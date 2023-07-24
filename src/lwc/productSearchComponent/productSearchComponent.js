/**
 * Created by Egran on 23.07.2023.
 */


import { LightningElement,wire,api } from 'lwc';
import getProductRecords from '@salesforce/apex/ObjectGetter.getProductRecords';
import addToCart from '@salesforce/apex/UserProductCart.addToCart';
import getTotalCost from '@salesforce/apex/UserProductCart.getTotalCost';

import { ShowToastEvent } from 'lightning/platformShowToastEvent';

export default class ProductSearchComponent extends LightningElement {
    openModal = false;
    products=[];
    itemName;
    itemDescryption;
    checkCost;
    @wire(getProductRecords)
        productrecords({ data, error  }) {
        if (data) {
            this.products=data;
        } else if (error) {
            this.error = error;
        }
    }

    handleInputChange(event) {
    this.clickedButtonLabel = event.target.value;
    }

    addToCart(event) {
        this.itemName=event.target.value;
        addToCart({productname: this.itemName,productcost:2000})
              .then((result) => {
                    const evt = new ShowToastEvent({
                        title: 'Added to cart',
                        message:'Product was successfully added to cart.',
                        variant: 'success',
                    });
                    this.dispatchEvent(evt);
                    getTotalCost()
                          .then((result) => {
                            this.checkCost = result.toString();
                          })
                          .catch((error) => {
                            this.error = error;
                          });
              })
              .catch((error) => {
                this.error = error;
                this.contacts = undefined;
                                    const evt = new ShowToastEvent({
                                        title: 'Error',
                                        message:'Unexpected error. Please try again',
                                        variant: 'error',
                                    });
                                    this.dispatchEvent(evt);
              });


    }


    openDetails(event){
    this.openModal = true;
    this.itemName=event.target.value;
    this.itemDescryption=event.target.name;
    }
    closeDetails(event){
    this.openModal = false;
    }
}
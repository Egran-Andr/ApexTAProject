/**
 * Created by Egran on 23.07.2023.
 */

import { LightningElement,wire,api } from 'lwc';
import getProductRecords from '@salesforce/apex/ObjectGetter.getProductRecords';

export default class ProductSearchComponent extends LightningElement {
    openModal = false;
    products=[];
    itemName="TestTest";
    clickedButtonLabel;
    itemDescryption;
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

    openDetails(event){
    this.openModal = true;
    this.itemName=event.target.value;
    this.itemDescryption=event.target.name;
    }
    closeDetails(event){
    this.openModal = false;
    }
}
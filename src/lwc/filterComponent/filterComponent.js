/**
 * Created by Egran on 23.07.2023.
 */

import { LightningElement,wire,track,api  } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import getTypesPickListValuesIntoList from '@salesforce/apex/ObjectGetter.getTypesPickListValuesIntoList';
import getFamilyPickListValuesIntoList from '@salesforce/apex/ObjectGetter.getFamilyPickListValuesIntoList';

export default class FilterComponent extends LightningElement {
     types=[];
     families=[];
    clickedButtonLabel;
        @wire(getTypesPickListValuesIntoList)
        producttypes({ data, error  }) {
            if (data) {
            this.types=data;
            } else if (error) {
                this.error = error;
            }
        }
        ///## (BUG)repopulating HTML code lead to error 957897146, reasons unknown but it make objects appear and function normally,but it appears to not change their behavior
      @wire(getFamilyPickListValuesIntoList)
           familytypes({ data, error  }) {
               if (data) {
               this.families=data;
               } else if (error) {
                   this.error = error;
               }
           }

    handleChange(e) {
        this.clickedButtonLabel = e.target.name;
    }


}
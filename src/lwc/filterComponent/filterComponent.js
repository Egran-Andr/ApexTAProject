/**
 * Created by Egran on 23.07.2023.
 */

import { LightningElement,wire,track } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import getTypesPickListValuesIntoList from '@salesforce/apex/ObjectGetter.getTypesPickListValuesIntoList';

export default class FilterComponent extends LightningElement {
        @track typesize;
        @wire(getTypesPickListValuesIntoList)
        getprediction({ data, error  }) {
            if (data) {
            for (let i = 0; i < data.length; i++) {

            }
            } else if (error) {
                this.error = error;
            }
        }


}
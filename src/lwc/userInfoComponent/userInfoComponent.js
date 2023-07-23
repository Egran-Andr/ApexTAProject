/**
 * Created by Egran on 23.07.2023.
 */

import {LightningElement,wire,track} from 'lwc';
import {getRecord} from 'lightning/uiRecordApi';

import USER_ID from '@salesforce/user/Id';

import NAME_FIELD from '@salesforce/schema/User.Name';


export default class Userinfoexample extends LightningElement {
    @track error ;
    @track name;
    @track id;
    @wire(getRecord, {
        recordId: USER_ID,
        fields: [NAME_FIELD]
    }) wireuser({
        error,
        data
    }) {
        if (error) {
           this.error = error ;
        } else if (data) {
            this.name = data.fields.Name.value;
            this.id = USER_ID;
        }
    }

        createProductClick(event) {
    /**
     * create new product
     */
        }
        viewCartClick(event) {
    /**
     * call modal window with cart
     */
        }

}
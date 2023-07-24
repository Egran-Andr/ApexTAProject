/**
 * Created by Egran on 23.07.2023.
 */

public with sharing class ObjectGetter {
    //get values of types picklist
    @AuraEnabled(cacheable=true)
    public static List<String> getTypesPickListValuesIntoList(){
        List<String> pickListValuesList= new List<String>();
        Schema.DescribeFieldResult fieldResult = Product__c.Type__c.getDescribe();
        List<Schema.PicklistEntry> ple = fieldResult.getPicklistValues();
        for( Schema.PicklistEntry pickListVal : ple){
            pickListValuesList.add(pickListVal.getLabel());
        }
        return pickListValuesList;
    }

    //get values of families picklist
    @AuraEnabled(cacheable=true)
    public static List<String> getFamilyPickListValuesIntoList(){
        List<String> pickListValuesListFamilies= new List<String>();
        Schema.DescribeFieldResult fieldResult = Product__c.Family__c.getDescribe();
        List<Schema.PicklistEntry> ple = fieldResult.getPicklistValues();
        for( Schema.PicklistEntry pickListVal : ple){
            pickListValuesListFamilies.add(pickListVal.getLabel());
        }
        return pickListValuesListFamilies;
    }

    //get product_c records
    @AuraEnabled(cacheable=true)
    public static List<Product__c> getProductRecords(){
        List<Product__c> objectList  =  [
                SELECT Id,Name,Description__c,Type__c,Family__c,Image__c,Price__c
                FROM Product__c
        ];
        return objectList;
    }


}
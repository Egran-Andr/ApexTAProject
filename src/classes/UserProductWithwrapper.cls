/**
 * Created by Egran on 24.07.2023.
 */

public with sharing class UserProductWithwrapper { //
    @AuraEnabled public Double totalCost {get;set;}
    @AuraEnabled public Map<String,Integer> userCart {get;set;}
    public UserProductWithwrapper() {
    }
    public class UserProductCartWrapper {
        @AuraEnabled public Double totalCost {get;set;}
        @AuraEnabled public Map<String,Integer> userCart {get;set;}
        @AuraEnabled public  UserProductCartWrapper UserProductCartWrapper {get;set;}
    }


    public  void addToCart(String productname,Double productcost){
        Double copycost=totalCost;
        try {
            if(userCart == null || userCart.isEmpty()){
                userCart.put(productname,1);
                copycost=copycost+productcost;
                totalCost=copycost;
                System.debug('This is copytest:::'+copycost);
            }
            else {
                if (userCart.get(productname)  != null) {
                    System.debug('we are totally in');
                    Integer curent=userCart.get(productname)+1;
                    userCart.put(productname,curent);
                    copycost=copycost+productcost;
                    totalCost=copycost;
                }
            }
        } catch (Exception ex){
            System.debug('--AP01_CrecheSiteWeb EXCEPTION --' + ex.getMessage());
        }
    }

    public  void removeFromCart(String productname,Double productcost){

        Double copycost=totalCost;
        try {
            if (userCart.get(productname)  != null) {
                System.debug('we are totally in');
                Integer curent=userCart.get(productname)-1;
                if (curent>0) {
                    userCart.put(productname,curent);
                    totalCost-=productcost;
                }
                else {
                    userCart.remove(productname);
                }
                userCart.put(productname,curent);
                copycost=copycost+productcost;
                totalCost=copycost;
            }

        } catch (Exception ex){
            System.debug('--AP01_CrecheSiteWeb EXCEPTION --' + ex.getMessage());
        }

    }
}
/**
 * Created by Egran on 24.07.2023.
 */

public with sharing class UserProductCart {
        public static  Double totalCost=0;
        public static  Map<String,Integer> userCart;

        @AuraEnabled(cacheable=true)
        public static Double getTotalCost() {
            System.debug('Test:::'+totalCost);
            return totalCost;
        }
        @AuraEnabled(cacheable=true)
        public static void setTotalCost(Double value) {
            totalCost=value;
        }

        @AuraEnabled(cacheable=true)
        public static void addToCart(String productname,Double productcost){
            Map<String,Integer> cartinfo = UserProductCart.userCart;
            Double copycost=totalCost;
            try {
                System.debug('we are in');
                if(cartinfo == null || cartinfo.isEmpty()){
                    System.debug('we are not in');
                    cartinfo.put(productname,1);
                    copycost=copycost+productcost;
                    setTotalCost(copycost);
                    System.debug('This is copytest:::'+copycost);
                }
                else {
                    if (cartinfo.containsKey(productname)) {
                        System.debug('we are totally in');
                        Integer curent=cartinfo.get(productname)+1;
                        cartinfo.put(productname,curent);
                        copycost=copycost+productcost;
                        setTotalCost(copycost);
                        System.debug('This is copytest:::'+copycost);
                    }

                }
                userCart=cartinfo;
            } catch (Exception ex){
                System.debug('--AP01_CrecheSiteWeb EXCEPTION --' + ex.getMessage());
            }
        }
        @AuraEnabled(cacheable=true)
        public static void removeFromCart(String productname,Double productcost){
            Map<String,Integer> cartinfo = UserProductCart.userCart;
            try {
                if(cartinfo.containsKey(productname)){
                    Integer curent=cartinfo.get(productname)-1;
                    if (curent>0) {
                        cartinfo.put(productname,curent);
                        totalCost-=productcost;
                    }
                    else {
                        cartinfo.remove(productname);
                    }
                }
                userCart=cartinfo;
            } catch (Exception ex){
                System.debug('--AP01_CrecheSiteWeb EXCEPTION --' + ex.getMessage());
            }
        }
    }
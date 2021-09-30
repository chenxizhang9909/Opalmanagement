/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package opal.entity;

/**
 *
 * @author chengming
 */
public class OpalCard {
    
    private int cardId;
    private int userId;
    private int cardNo;
    private int securityCode;
    private String nickname;
    private String cardType;
    
    public OpalCard(){}
    
    public int getCardNo(){
        return cardNo;
    }
    
    public void setCardNo(int cardNo){
        this.cardNo = cardNo;
    } 
    
     public int getsecurityCode(){
        return securityCode;
    }
    
    public void setsecurityCode(int securityCode){
        this.securityCode = securityCode;
    } 
    public String getnickname(){
        return nickname;
    }
    
    public void setnickname(String nickname){
        this.nickname = nickname;
    } 
    public String getcardType(){
        return cardType;
    }
    
    public void setcardType(String cardType){
        this.cardType = cardType;
    } 
            
}

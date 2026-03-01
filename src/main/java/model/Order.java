package model;

public class Order {

    private String name;
    private String email;
    private String phone;
    private String address;
    private String payment;
    private String cardNumber;

    public Order(String name, String email, String phone,
                 String address, String payment, String cardNumber) {

        this.name = name;
        this.email = email;
        this.phone = phone;
        this.address = address;
        this.payment = payment;
        this.cardNumber = cardNumber;
    }

    public String getName(){ return name; }
    public String getEmail(){ return email; }
    public String getPhone(){ return phone; }
    public String getAddress(){ return address; }
    public String getPayment(){ return payment; }
    public String getCardNumber(){ return cardNumber; }
}
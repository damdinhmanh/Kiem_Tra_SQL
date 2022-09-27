public class Customer {
    private int id;
    private String name;
    private String phone;
    private String address;
    private int wallet_id;

    public Customer(int id, String name, String phone, String address, int wallet_id) {
        this.id = id;
        this.name = name;
        this.phone = phone;
        this.address = address;
        this.wallet_id = wallet_id;
    }
    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }
    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }
    public String getPhone() {
        return phone;
    }
    public void setPhone(String phone) {
        this.phone = phone;
    }
    public String getAddress() {
        return address;
    }
    public void setAddress(String address) {
        this.address = address;
    }
    public int getWallet_id() {
        return wallet_id;
    }
    public void setWallet_id(int wallet_id) {
        this.wallet_id = wallet_id;
    }
}

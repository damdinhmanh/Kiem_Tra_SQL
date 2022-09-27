public class Order {
    private int id;
    private int cus_id;
    private int item_id;
    private int quantity;
    private int total_price;
    
    public Order(int id, int cus_id, int item_id, int quantity, int total_price) {
        this.id = id;
        this.cus_id = cus_id;
        this.item_id = item_id;
        this.quantity = quantity;
        this.total_price = total_price;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getCus_id() {
        return cus_id;
    }

    public void setCus_id(int cus_id) {
        this.cus_id = cus_id;
    }

    public int getItem_id() {
        return item_id;
    }

    public void setItem_id(int item_id) {
        this.item_id = item_id;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public int getTotal_price() {
        return total_price;
    }

    public void setTotal_price(int total_price) {
        this.total_price = total_price;
    }

    @Override
    public String toString() {
        return "Order [cus_id=" + cus_id + ", id=" + id + ", item_id=" + item_id + ", quantity=" + quantity
                + ", total_price=" + total_price + "]";
    }
}

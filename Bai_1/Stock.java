public class Stock {
    private int id;
    private int item_id;
    private int restock;
    
    public Stock(int id, int item_id, int restock) {
        this.id = id;
        this.item_id = item_id;
        this.restock = restock;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getItem_id() {
        return item_id;
    }

    public void setItem_id(int item_id) {
        this.item_id = item_id;
    }

    public int getRestock() {
        return restock;
    }

    public void setRestock(int restock) {
        this.restock = restock;
    }
}

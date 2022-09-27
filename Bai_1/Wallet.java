public class Wallet {
    private int id;
    private String acc_bank;
    private String name_bank;
    private int amount;
    
    public Wallet(int id, String acc_bank, String name_bank, int amount) {
        this.id = id;
        this.acc_bank = acc_bank;
        this.name_bank = name_bank;
        this.amount = amount;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getAcc_bank() {
        return acc_bank;
    }

    public void setAcc_bank(String acc_bank) {
        this.acc_bank = acc_bank;
    }

    public String getName_bank() {
        return name_bank;
    }

    public void setName_bank(String name_bank) {
        this.name_bank = name_bank;
    }

    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }

    @Override
    public String toString() {
        return "Wallet [acc_bank=" + acc_bank + ", amount=" + amount + ", id=" + id + ", name_bank=" + name_bank + "]";
    } 
}

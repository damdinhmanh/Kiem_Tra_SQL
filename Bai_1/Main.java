import java.util.HashMap;
import java.util.Map;
import java.util.Scanner;


public class Main {

   public static int order_cnt = 1;
   public static void main(String[] args) {
    //Item
    Map<String, Item> mapItem = new HashMap<String, Item>();
    Item item1 = new Item(1, "quan", 100000, "quan dai");
    mapItem.put(item1.getDesc(), item1);
    Item item2 = new Item(2, "ban chai", 200000, "ban chai");
    mapItem.put(item2.getDesc(), item2);


    //Customer
    Map<String, Customer> mapCus = new HashMap<String, Customer>();
    Customer customer1 = new Customer(1, "Nguyen Van A", "0983434334", "Ha Noi", 1);
    mapCus.put(customer1.getName(), customer1);
    Customer customer2 = new Customer(2, "Tran Van B", "09436456464", "Ha Nam", 2);
    mapCus.put(customer2.getName(), customer2);

    //Stock
    Map<Integer, Stock> mapStock = new HashMap<Integer, Stock>();
    Stock stock1 = new Stock(1, 1, 100);
    mapStock.put(stock1.getItem_id(), stock1);
    Stock stock2 = new Stock(2, 2, 500);
    mapStock.put(stock2.getItem_id(), stock2);

    //Wallet
    Map<Integer, Wallet> mapWallet = new HashMap<Integer, Wallet>();
    Wallet wallet1 = new Wallet(1, "444444", "VCB", 7000000);
    mapWallet.put(wallet1.getId(), wallet1);
    Wallet wallet2 = new Wallet(2, "666666", "TCB", 5000000);
    mapWallet.put(wallet2.getId(), wallet2);


    //Scanner
    Scanner scanner = new Scanner(System.in);
    boolean findStock = false;

    //Buy Item
    Item buyItem = null;

    do {
      System.out.println("Nhap mat hang can mua:");
      String buyItemName = scanner.nextLine();

      if (mapItem.containsKey(buyItemName)) {
         findStock = true;
         buyItem = mapItem.get(buyItemName);
      } else {
         System.out.println("Mat hang nay khong ton tai!");
      }
   } while(findStock==false);


   int buyItemQuantity = 0;
   boolean buyQuantityCheck = false;
  
   do {
      System.out.println("Nhap so luong can mua:");
      buyItemQuantity = Integer.parseInt(scanner.nextLine());

      if (buyItemQuantity==0 || buyItemQuantity > mapStock.get(buyItem.getId()).getRestock()) {
         buyQuantityCheck = false;
         System.out.println("Nhap so luong khong hop le!");
      } else {
         buyQuantityCheck = true;
      }
   } while(buyQuantityCheck==false);


    try {
         //Thuc Hien Order//hard code
         Order order1 = new Order(order_cnt, customer1.getId(), buyItem.getId(), buyItemQuantity, buyItemQuantity * buyItem.getPrice());
         order_cnt++;

         //Cap nhat restock
         mapStock.get(buyItem.getId()).setRestock(mapStock.get(buyItem.getId()).getRestock() - order1.getQuantity());

         //Cap nhat so du tai khoan
         mapWallet.get(customer1.getWallet_id()).setAmount(mapWallet.get(customer1.getWallet_id()).getAmount() - order1.getTotal_price());

         //Show Thong tin Order
         System.out.printf("\n\n---Thong tin don hang---");
         System.out.println("Ten Hang: " + buyItem.getDesc());
         System.out.println("Don gia: " + buyItem.getPrice());
         System.out.println("So luong: " + order1.getQuantity());
         System.out.println("Tong tien: " + order1.getTotal_price());
         
         //Thong tin tai khoan
         System.out.printf("\n\n===>Thong tin bien dong tai khoan");
         System.out.println("tai khoan thay doi -" + order1.getTotal_price() + "VND");
         System.out.println("So Du: " + mapWallet.get(customer1.getWallet_id()).getAmount() + "VND");
      
    } catch (Exception e) {
         System.out.println(e.toString());
    }

    scanner.close();
   } 
}

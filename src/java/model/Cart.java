package model;

import java.util.ArrayList;

public class Cart {

    private ArrayList<CartItem> items;

    public Cart() {
        items = new ArrayList<>();
    }

    public ArrayList<CartItem> getItems() {
        return items;
    }

    public void addItem(CartItem item) {
        items.add(item);
    }

    public void removeItem(CartItem item) {
        items.remove(item);
    }

    public double getTotalPrice() {
        double total = 0;
        for (CartItem item : items) {
            total += item.getProduct().getProduct_price() * item.getQuantity();
        }
        return total;
    }

    public void updateItemQuantity(Product product, int quantity) {
        for (CartItem item : items) {
            if (item.getProduct().getProduct_id().equals(product.getProduct_id())) {
                item.setQuantity(quantity);
                break;
            }
        }
    }
}

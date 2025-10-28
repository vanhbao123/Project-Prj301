package model;

import java.sql.Timestamp;

public class Order {

    private int id;
    private int accountId;
    private int amount;
    private Timestamp createAt;   // <-- Thời gian tạo đơn
    private String status;
    private String address;

    // --- Thông tin mở rộng (JOIN từ bảng Account) ---
    private String accountName;
    private String email;

    public Order() {
    }

    public Order(int id, int accountId, int amount, Timestamp createAt, String status, String address) {
        this.id = id;
        this.accountId = accountId;
        this.amount = amount;
        this.createAt = createAt;
        this.status = status;
        this.address = address;
    }

    // --- Getters and Setters ---
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getAccountId() {
        return accountId;
    }

    public void setAccountId(int accountId) {
        this.accountId = accountId;
    }

    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }

    public Timestamp getCreateAt() {
        return createAt;
    }

    public void setCreateAt(Timestamp createAt) {
        this.createAt = createAt;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getAccountName() {
        return accountName;
    }

    public void setAccountName(String accountName) {
        this.accountName = accountName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
}

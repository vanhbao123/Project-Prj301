package model;

import java.sql.Timestamp;

public class Review {
    private int id;
    private int productId;
    private String customerName;
    private int rating;
    private String comment;
    private Timestamp reviewDate;

    public Review() {
    }

    public Review(int id, int productId, String customerName, int rating, String comment, Timestamp reviewDate) {
        this.id = id;
        this.productId = productId;
        this.customerName = customerName;
        this.rating = rating;
        this.comment = comment;
        this.reviewDate = reviewDate;
    }

    // --- Thêm đầy đủ Getter và Setter cho tất cả các trường ---
    
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public String getCustomerName() {
        return customerName;
    }

    public void setCustomerName(String customerName) {
        this.customerName = customerName;
    }

    public int getRating() {
        return rating;
    }

    public void setRating(int rating) {
        this.rating = rating;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public Timestamp getReviewDate() {
        return reviewDate;
    }

    public void setReviewDate(Timestamp reviewDate) {
        this.reviewDate = reviewDate;
    }
}
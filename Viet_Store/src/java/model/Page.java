/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author DELL
 */
public class Page {
    private int totalPage;
    private int totalRecord;
    private int page;
    private String urlParrtern;

    public Page() {
    }

    public Page(int totalPage, int totalRecord, int page, String urlParrtern) {
        this.totalPage = totalPage;
        this.totalRecord = totalRecord;
        this.page = page;
        this.urlParrtern = urlParrtern;
    }

    

    public int getTotalPage() {
        return totalPage;
    }

    public void setTotalPage(int totalPage) {
        this.totalPage = totalPage;
    }

    public int getTotalRecord() {
        return totalRecord;
    }

    public void setTotalRecord(int totalRecord) {
        this.totalRecord = totalRecord;
    }

    public int getPage() {
        return page;
    }

    public void setPage(int page) {
        this.page = page;
    }

    public String getUrlParrtern() {
        return urlParrtern;
    }

    public void setUrlParrtern(String urlParrtern) {
        this.urlParrtern = urlParrtern;
    }

    
    
    
}

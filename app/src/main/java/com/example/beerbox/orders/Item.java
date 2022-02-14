package com.example.beerbox.orders;

public class Item {

    private String name;
    private float costs;

    public Item(String name, float costs) {
        this.name = name;
        this.costs = costs;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public float getCosts() {
        return costs;
    }

    public void setCosts(float costs) {
        this.costs = costs;
    }

}
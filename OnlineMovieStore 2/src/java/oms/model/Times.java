/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package oms.model;
import java.util.ArrayList;
/**
 *
 * @author kevin
 */
public class Times {
    private ArrayList<Time> times = new ArrayList<Time>();
    
    public ArrayList<Time> getAllTimes() {
        return this.times;
    }
     public void addTime (Time time) {
        times.add(time);
    }
    
    public void removeTime(Time time) {
        times.remove(time);
    }
    
}

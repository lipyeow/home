/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package guessNumber;

import java.util.Date;

/**
 *
 * @author lipyeow
 */
public class Attempt {
    public Date atime;
    public Integer usernum;
    public Integer actualnum;

    public Date getAtime() {
        return atime;
    }

    public void setAtime(Date atime) {
        this.atime = atime;
    }

    public Integer getUsernum() {
        return usernum;
    }

    public void setUsernum(Integer usernum) {
        this.usernum = usernum;
    }

    public Integer getActualnum() {
        return actualnum;
    }

    public void setActualnum(Integer actualnum) {
        this.actualnum = actualnum;
    }
    
}

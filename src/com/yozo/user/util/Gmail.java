package com.yozo.user.util;

import javax.mail.Authenticator;

import javax.mail.PasswordAuthentication;



public class Gmail extends Authenticator {



    @Override

    protected PasswordAuthentication getPasswordAuthentication() {

        return new PasswordAuthentication("lhseunge@gmail.com","Leehs9504!@");

    }

    

}



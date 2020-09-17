package com.lhm.utils;

import java.net.Inet4Address;
import java.net.InetAddress;
import java.net.UnknownHostException;

/**
 * 获取ip地址
 * @Author: lhm
 * @Date: 2020/9/17 16:08
 * 4
 */
public class Address {
    public static String getIpAddress(){
        String ip = null;
        try {
            InetAddress localHost = Inet4Address.getLocalHost();
            ip = localHost.getHostAddress();
        } catch (UnknownHostException e) {
            e.printStackTrace();
        }
        return ip;
    }
}

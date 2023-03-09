package com.wfc.project.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.serializer.SerializerFeature;
import com.wfc.project.pojo.Delivery;
import com.wfc.project.service.DeliveryService;
import com.wfc.project.utils.SendSms;
import com.sun.org.apache.bcel.internal.generic.NEW;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

/**
 * @author Administrator
 */
@RestController
public class DeliveryController {

    @Autowired
    DeliveryService deliveryService;

    String loginCode;
    Map<String,Object> map = new HashMap<>();

    /*根据oid获取taker*/
    @GetMapping("/findTakerByOid")
    public String findTakerByOid(String oid){
        System.out.println(oid);
        Delivery deliveryMan = deliveryService.findTakerByOid(Integer.valueOf(oid));
        return JSON.toJSONString(deliveryMan);
    }

    /*检查phone是否已注册*/
    @GetMapping("/checkPhone")
    public String checkPhone(String phone){
        Delivery delivery = deliveryService.findDeliveryByPhone(phone);
        if(delivery!=null){
            return "exist";
        }else {
            return "none";
        }
    }

    /*发送code*/
    @GetMapping("/sendCode")
    public String sendCode(String phone){
        int code = SendSms.sendCode(phone);
       // int code = 123;
        if (code != 0) {
            loginCode = phone + "_" + code;
            System.out.println("存进map的code："+loginCode);
            map.put("loginCode", loginCode);
            return "success";
        } else {
            return "fail";
        }
    }

    /*骑手验证码登录*/
    @GetMapping("/riderCodeLogin")
    public String riderCodeLogin(String phone,String code){
        String newCode = phone+"_"+code;
        System.out.println("newCode:"+newCode);

        String loginCode = (String) map.get("loginCode");
        System.out.println("loginCode:"+loginCode);


//       if(newCode.equals(loginCode))
        if(phone.equals(phone))
         {
            Delivery delivery = deliveryService.findDeliveryByPhone(phone);
//            System.out.println(delivery);
            return JSON.toJSONString(delivery);
        }else {
            return "fail";
        }
    }

    /*根据did获取delivery*/
    @GetMapping("/findDeliveryByDid")
    public String findDeliveryByDid(String did){
        Delivery delivery = deliveryService.findDeliveryByDid(Integer.valueOf(did));
        return JSON.toJSONString(delivery, SerializerFeature.WriteMapNullValue);
    }

    @PostMapping("/deliveryRegister")
    public String deliveryRegister(@RequestBody Delivery delivery){
        boolean flag = deliveryService.deliveryRegister(delivery);
        if (flag){
            return "success";
        }
        return "fail";

    }


}

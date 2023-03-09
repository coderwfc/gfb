
package com.wfc.project.utils;

import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.HttpException;
import org.apache.commons.httpclient.NameValuePair;
import org.apache.commons.httpclient.methods.PostMethod;
import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.DocumentHelper;
import org.dom4j.Element;


import java.io.IOException;




public class SendSms {
    private static String Url = "http://106.ihuyi.cn/webservice/sms.php?method=Submit";

/*发送验证码的方法*/

    public static int sendCode(String phone){
        HttpClient client = new HttpClient();
        PostMethod method = new PostMethod(Url);

        client.getParams().setContentCharset("GBK");
        //设置请求头信息及编码
        method.setRequestHeader("ContentType","application/x-www-form-urlencoded;charset=GBK");
        //短信验证码：6位整数
        int mobile_code = (int)((Math.random()*9+1)*100000);
        //短信模板：默认免费套餐不能修改！
        String content = new String("您的验证码是：" + mobile_code + "。请不要把验证码泄露给其他人。");

        //发送验证码的核心代码
        NameValuePair[] data = {//提交短信
                new NameValuePair("account", "C90573276"),
                new NameValuePair("password", "e64e90c64983983b84bec0ac7f2c8b87"),
                new NameValuePair("mobile", phone), //短信接收的手机号
                new NameValuePair("content", content),
        };
        method.setRequestBody(data);

        try {
            client.executeMethod(method);
            String SubmitResult =method.getResponseBodyAsString();

            Document doc = DocumentHelper.parseText(SubmitResult);
            Element root = doc.getRootElement();

            String code = root.elementText("code");
            String msg = root.elementText("msg");
            String smsid = root.elementText("smsid");

            if("2".equals(code)){
                //获取最终的验证码
                System.out.println("短信提交成功，验证码是："+mobile_code);
                return mobile_code;
            }

        } catch (HttpException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (DocumentException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return 0;
    }

}


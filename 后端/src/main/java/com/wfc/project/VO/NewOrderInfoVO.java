package com.wfc.project.VO;


import com.wfc.project.pojo.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

/**
 * @author Administrator
 */ /*                   orderNumber:'',
                        userInfo:'',
                        orderInfo:'',
                        goodInfo:'',
                        addressInfo:'',
                        createTime:''*/
@Data
@AllArgsConstructor
@NoArgsConstructor
public class NewOrderInfoVO {
     User userInfo;
     Order orderInfo;
     List<Good> goodInfo;
     Address addressInfo;
     Delivery deliveryInfo;
}

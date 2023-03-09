package com.wfc.project.VO;

import com.wfc.project.pojo.Address;
import com.wfc.project.pojo.Order;
import com.wfc.project.pojo.Shop;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @author Administrator
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class OrderFreeVO {
    private String userName;
    private String userPhone;
    private Order order;
    private Shop shop;
    private Address address;
}

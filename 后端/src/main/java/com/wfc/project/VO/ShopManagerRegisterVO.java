package com.wfc.project.VO;

import com.wfc.project.pojo.Shop;
import com.wfc.project.pojo.ShopManager;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @author Administrator
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class ShopManagerRegisterVO {
    public ShopManager userInfo;
    public Shop shopInfo;
}

package com.wfc.project.mapper;

import com.wfc.project.pojo.OrderGood;

import java.util.List;

public interface OrderGoodMapper {

    /*根据oid获取订单商品等信息*/
    List<OrderGood> findGidByOid(Integer oid);
}

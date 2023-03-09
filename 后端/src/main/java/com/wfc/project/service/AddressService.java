package com.wfc.project.service;

import com.wfc.project.pojo.Address;
import com.wfc.project.VO.AddressVO;

import java.util.List;

public interface AddressService {
    /*根据用户id查询所有address*/
    List<Address> listAllAddress(Integer id);

    /*根据用户id修改address*/
    boolean updateAddressById(Address address);

    /*添加address*/
    boolean addAddress(AddressVO address);
}

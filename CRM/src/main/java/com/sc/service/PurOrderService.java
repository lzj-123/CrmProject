package com.sc.service;

import com.github.pagehelper.PageInfo;
import com.sc.bean.PurOrder;
import com.sc.bean.PurOrderInfo;

public interface PurOrderService {

		////查询所有订单
		public PageInfo<PurOrder> selectallorder(Integer pageNum,Integer pageSize,PurOrder purorder);
		//添加采购单信息
		public void addinfo(PurOrder purorder);
		//通过id删除采购单信息
		public void delinfo(Long purnumber);
		//通过id修改供应商信息
		public void updateinfo(Long purnumber);
		
		
		
		//添加采购单详情
	     public void addpro(PurOrderInfo purOrderInfo);
	
	   //修改供应商信息
		 	public void updateinfo(PurOrder purorder);
		 	
		 	
			PageInfo<PurOrder> selecorder(Integer pageNum, Integer pageSize, PurOrder purorder);
	

		
	
}

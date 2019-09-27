package com.sc.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.sc.bean.PurOrder;
import com.sc.bean.PurOrderExample;
import com.sc.bean.PurOrderInfo;
import com.sc.bean.PurOrderInfoExample;
import com.sc.bean.PurSupInfo;
import com.sc.bean.PurSupInfoExample;
import com.sc.bean.PurOrderInfoExample.Criteria;
import com.sc.mapper.PurOrderInfoMapper;
import com.sc.mapper.PurOrderMapper;
import com.sc.mapper.PurSupInfoMapper;
import com.sc.service.PurOrderService;

@Service
public class PurOrderServiceImpl implements PurOrderService {

	@Autowired
	PurOrderMapper purordermapper;
@Autowired
  PurSupInfoMapper pursupinfomapper;

@Autowired
PurOrderInfoMapper  purOrderInfoMapper;
	@Override
	public PageInfo<PurOrder> selectallorder(Integer pageNum, Integer pageSize, PurOrder purorder) {
		 //设置开始分页
		PageHelper.startPage(pageNum, pageSize);
		 PurOrderExample example = new PurOrderExample();
		
		//调用查询所有的方法
		List<PurOrder> list=this.purordermapper.selectByExample(example);
		//封装LIST到pageinfo
		PageInfo<PurOrder> pi = new PageInfo<PurOrder>(list);
		
		return pi;
	}

	@Override
	public void addinfo(PurOrder purorder) {
		if(purorder!=null){
		purordermapper.insert(purorder);
	}}

	@Override
	public void delinfo(Long purnumber) {
		if(purnumber!=null){
			purordermapper.deleteByPrimaryKey(purnumber);
			}
	}

	@Override
	public void updateinfo(Long purnumber) {
		// TODO Auto-generated method stub

	}
  
	//添加采购单详情
	@Override
	public void addpro(PurOrderInfo purOrderInfo) {
		if(purOrderInfo!=null){}
		purOrderInfoMapper.insert(purOrderInfo);
		
	}

	@Override
	public void updateinfo(PurOrder purorder) {
		purordermapper.updateByPrimaryKey(purorder);
		
	}

	//查询所有
	@Override
	public PageInfo<PurOrder> selecorder(Integer pageNum,Integer pageSize ,PurOrder purorder) {
		   //设置开始分页
			PageHelper.startPage(pageNum, pageSize);
			 PurOrderExample example = new PurOrderExample();
			if(purorder.getPurTitle()!=null){
				 com.sc.bean.PurOrderExample.Criteria criteria = example.createCriteria();
				criteria.andPurTitleLike("%"+purorder.getPurTitle()+"%");
			}
			List<PurOrder> list=this.purordermapper.selectByExample(example);
			//封装LIST到pageinfo
			PageInfo<PurOrder> pi = new PageInfo<PurOrder>(list);
			
			return pi;
			}
			//调用查询所有的方法
			
		


}

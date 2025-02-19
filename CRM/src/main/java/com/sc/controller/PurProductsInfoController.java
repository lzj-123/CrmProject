package com.sc.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.sc.bean.CcCkxxb;
import com.sc.bean.Ccspxxb;
import com.sc.bean.PurOrderInfo;
import com.sc.service.CcSpxxService;
import com.sc.service.PurProductsInfoService;

@Controller // 注册成bean对象
@RequestMapping("/cgxqctlr")
public class PurProductsInfoController {

	@Autowired
	PurProductsInfoService purProductsInfoService;
	@Autowired
	CcSpxxService ccSpxxService;

	// 1.分页查看采购商品列表（以测试）
	@RequestMapping("/ck.do")

	public ModelAndView ck(ModelAndView mav, @RequestParam(defaultValue = "1") Integer pageNum,
			@RequestParam(defaultValue = "5") Integer pageSize, PurOrderInfo purOrderInfo) {

		
		// 添加模型数据
		mav.addObject("pi", purProductsInfoService.selectPurOrderInfo(pageNum, pageSize, purOrderInfo));
		System.out.println("进入查询方法");
		// 设置视图名称 转发
		mav.setViewName("Ck/cgxq");// 响应的视图名称，路径是：/WEB-INF/users/list.jsp
		return mav;
	}

	// 通过id查询
	@RequestMapping("/select.do")
	@ResponseBody
	public PurOrderInfo selectById(ModelAndView mav, HttpServletRequest req) throws IllegalStateException, IOException {
		System.out.println("进入查看弹层页面");
		String purInfoNumber = req.getParameter("purInfoNumber");
		Long uid = (long) Integer.parseInt(purInfoNumber);
		System.out.println("获取到的用户编号为:" + uid);
		PurOrderInfo byUid = purProductsInfoService.selctPurOrderInfoByid(uid);
		System.out.println("查出的用户为" + byUid);
		return byUid;

	}

	// 模糊查询
	@RequestMapping("/mh.do")
	public ModelAndView selectmh(ModelAndView mav, @RequestParam(defaultValue = "1") Integer pageNum,
			@RequestParam(defaultValue = "5") Integer pageSize, PurOrderInfo purOrderInfo) {

		System.out.println("进入查询供应商信息方法" + purOrderInfo);

		mav.addObject("pi", purProductsInfoService.mh(pageNum, pageSize, purOrderInfo));
		System.out.println(purProductsInfoService.mh(pageNum, pageSize, purOrderInfo));
		String warehouseOrnot = purOrderInfo.getWarehouseOrnot();
		mav.addObject("warehouseOrnot", warehouseOrnot);
		mav.setViewName("Ck/cgxq");

		return mav;
	}

	// 批量入库
	@RequestMapping("/sc.do")
	public ModelAndView del(ModelAndView mav, HttpServletRequest req) {
		String[] xx = req.getParameterValues("bb");// 单号
		String[] x1 = req.getParameterValues("e");// 产品编号
		String[] x2 = req.getParameterValues("f");// 产品数
		

		PurOrderInfo pinfo = new PurOrderInfo();
		for (int i = 0; i < xx.length; i++) {
			long l = Long.parseLong(xx[i]);
			System.out.println("+++++++"+l);
			long x01 = Long.parseLong(x1[i]);
			System.out.println("产品编号为"+x01);
			pinfo.setPurInfoNumber(l);
			PurOrderInfo byid = purProductsInfoService.selctPurOrderInfoByid(l);
			pinfo.setRemarksInfom(byid.getRemarksInfom());
			System.out.println("+++++"+purProductsInfoService.selctPurOrderInfoByid(l));
			Ccspxxb ccspxxByUid = ccSpxxService.selectCcspxxByUid(x01);
			System.out.println("+++"+ccspxxByUid);
			ccspxxByUid.setKcSl(ccspxxByUid.getKcSl() + Long.parseLong(x2[i]));
			ccSpxxService.updateCcspxx(ccspxxByUid, pinfo);

		}
		// 重定向到列表方法
		mav.setViewName("redirect:ck.do");
		return mav;
	}

}

package com.liu.test;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.liu.test.dao.FunctionDao;
import com.liu.test.domain.Sysfunction;

@Controller
@RequestMapping(path="/function")
public class FunctionController { 

	@Resource(name="functionDao")
	private FunctionDao functionDao;
	
    @RequestMapping(path="/function.do",method=RequestMethod.GET)// 
    public String getById(@RequestParam Map<String,String> map,Model model) {//鑾峰彇鍙傛暟鏂瑰紡 涓�
    	System.out.println(map.get("id")+":::::");
    	System.out.println(map.get("name")+":::::");
    	
    	Sysfunction function = functionDao.getObjectById(Sysfunction.class,map.get("id"));
    	model.addAttribute("function", function);
        return "function/one";
    }
    
    
    @RequestMapping("/functionList.do")
    public String getList(Model model) {//
    	List<Sysfunction> list = functionDao.getObjectList(Sysfunction.class);	
        model.addAttribute("list", list);
        return "function/list";
    }
    
    @RequestMapping(path="/hello/{oid}")
    public String urlTemplate(@PathVariable("oid") String oid,Model model){
    	System.out.println("url template1 oid:" + oid);
    	return "hello/helloWorld";
     }
    
    
    @RequestMapping("/mav/helloWorld")
    public ModelAndView helloWorld1(Model model) {
        model.addAttribute("message", "Hello World!");
        ModelAndView mav = new ModelAndView("helloword");
        mav.addObject("hehe", "bubu");
        return mav;
    }
}
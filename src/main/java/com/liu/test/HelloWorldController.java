package com.liu.test;

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
@RequestMapping(path="/test")
public class HelloWorldController { 

	@Resource(name="functionDao")
	private FunctionDao functionDao;
	
    @RequestMapping(path="/helloword",method=RequestMethod.GET)// 
    public String helloWorld(@RequestParam Map<String,String> map,Model model) {//鑾峰彇鍙傛暟鏂瑰紡 涓�
    	System.out.println(map.get("id")+":::::");
    	System.out.println(map.get("name")+":::::");
    	
    	Sysfunction function = functionDao.getFunction(map.get("id"));
    	
    	model.addAttribute("message", "Hello World!");
    	model.addAttribute("function", function);
        return "helloWorld";
    }
    
    
    @RequestMapping("/helloWorld1")
    public String helloWorld(Model model) {//
    		
        model.addAttribute("message", "Hello World!");
        return "helloWorld";
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
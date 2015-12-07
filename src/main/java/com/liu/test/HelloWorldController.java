package com.liu.test;

import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class HelloWorldController {

    @RequestMapping(path="/helloword",method=RequestMethod.GET)//多个参数 
    public String helloWorld(@RequestParam Map<String,String> map,Model model) {//获取参数方式 一
    	System.out.println(map.get("id")+":::::");
    	System.out.println(map.get("name")+":::::");
    	model.addAttribute("message", "Hello World!");
        return "helloWorld";
    }
    
    
    @RequestMapping("/helloWorld1")
    public String helloWorld(Model model) {//获取参数方式 一
    		
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
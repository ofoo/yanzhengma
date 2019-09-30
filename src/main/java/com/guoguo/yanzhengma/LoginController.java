package com.guoguo.yanzhengma;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class LoginController {
    @RequestMapping("/login")
    public String index(){
        return "login";
    }

    @RequestMapping("/doLogin")
    @ResponseBody
    public String dologin(@RequestParam("gapLeft") Integer gapLeft, @RequestParam("moveLeft") Integer moveLeft){
        return validateCode(gapLeft, moveLeft) + "";
    }

    /**
     * 验证图片验证码
     * @param gapLeft 固定图片坐标
     * @param moveLeft 移动图片坐标
     * @return false验证不通过，true验证通过
     */
    private boolean validateCode(int gapLeft,int moveLeft){
        int dvalue = 5;
        int v = Math.abs(gapLeft - moveLeft);
        if(gapLeft==0 || moveLeft==0 || v > dvalue){
            return false;
        }
        return true;
    }
}

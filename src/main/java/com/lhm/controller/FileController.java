package com.lhm.controller;

import com.lhm.common.Result;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;

@Controller
public class FileController {

    @RequestMapping("/uploadFile.json")
    @ResponseBody
    public Result uploadFile(@RequestParam("file") MultipartFile file){
        if (file.isEmpty()){
            return Result.fail("文件为空!");
        }
        //获取文件名
        String originalFilename = file.getOriginalFilename();
        //新文件名  时间戳+文件名
        String filename = System.currentTimeMillis()+"_"+originalFilename;
        //获取路径
        String path = getPath();
        //创建新的文件
        File fileMkdir = new File(path+"\\"+filename);
        if (!fileMkdir.exists()){
            fileMkdir.mkdir();
        }
        try {
            //写入文件
            file.transferTo(fileMkdir);
            return Result.success("上传成功！",filename);
        } catch (IOException e) {
            e.printStackTrace();
            return Result.fail("上传失败！");
        }
    }

    /**
     * 删除文件
     */
    @RequestMapping("/delFile.json")
    @ResponseBody
    public Result delFile(@RequestParam("filename") String filename){
        Result result = deleteFileByName(filename);
        return result;
    }

    /**
     * 预览文件
     * @param filename
     * @return
     */
    @GetMapping("/previewFile.json")
    public void previewFile(HttpServletResponse response, @RequestParam("filename")String filename) throws IOException{
        System.out.println(filename);
        String path = getPath();
        response.setContentType("application/pdf");
        FileInputStream in = new FileInputStream(new File(path+"\\"+filename));
        OutputStream out = response.getOutputStream();
        byte[] b = new byte[1024];
        while ((in.read(b))!=-1){
            out.write(b);
        }
        out.flush();
        in.close();
        out.close();
    }

    private Result deleteFileByName(String filename) {
        String path = getPath();
        File file = new File(path);
        if (!file.exists()){
            return Result.fail("该文件不存在!");
        }
        if (file.isFile()){
            return Result.fail("该文件是目录!");
        }else {
            File[] files = file.listFiles();
            for (File f: files) {
                if (filename.equals(f.getName())){
                    f.delete();
                    return Result.success("删除成功!",null);
                }
            }
        }
        return Result.fail("该文件不存在!");
    }

    /**
     * 获取存储路径
     */
    private String getPath(){
        //获取当前项目路径
        String c = System.getProperty("user.dir");
        //设置文件存储路径
        return c+"\\src\\main\\resources\\file"+"\\";
    }
}

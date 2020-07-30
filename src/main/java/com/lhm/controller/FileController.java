package com.lhm.controller;

import com.lhm.common.Result;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiOperation;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;

@Controller
@Api(tags = "文件操作相关接口")
public class FileController {

    @RequestMapping(value = "/uploadFile.json",method = RequestMethod.POST)
    @ApiOperation("上传文件接口")
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
    @RequestMapping(value = "/delFile.json",method = RequestMethod.POST)
    @ApiOperation("删除文件接口")
    @ApiImplicitParam(name = "filename", value = "上传后的文件名称")
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
    @GetMapping(value = "/previewFile.json")
    @ApiOperation("预览文件接口")
    @ApiImplicitParam(name = "filename", value = "预览的文件名称")
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

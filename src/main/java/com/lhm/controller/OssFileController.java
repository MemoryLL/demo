package com.lhm.controller;

import com.aliyun.oss.model.OSSObjectSummary;
import com.lhm.common.Result;
import com.lhm.service.OssFileService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

/**
 * @Author: lhm
 * @Date: 2020/11/9 18:35
 * 这里上传后的文件是存储在阿里云的OSS
 */
@Controller
@Api(tags = "OSS文件操作相关接口")
public class OssFileController {

    @Autowired
    private OssFileService ossFileService;


    /**
     * 获取所有文件
     * @return
     */
    @RequestMapping(value = "/oss/getList.json",method = RequestMethod.GET)
    @ResponseBody
    public List<OSSObjectSummary> getList(){
        return ossFileService.getList();
    }

    /**
     * 上传接口
     * @param file
     * @return
     */
    @RequestMapping(value = "/oss/uploadFile.json",method = RequestMethod.POST)
    @ApiOperation("上传文件到OSS接口")
    @ResponseBody
    public Result uploadFileOss(@RequestParam("file") MultipartFile file){
        return ossFileService.uploadFileOss(file);
    }

    /**
     * 删除接口
     * @param filename  删除的文件名  上传后的filepath(例如：demo/001.jpg)
     * @return
     */
    @RequestMapping(value = "/oss/deleteFile.json",method = RequestMethod.DELETE)
    @ResponseBody
    public Result deleteFileOss(@RequestParam("fileName") String filename){
        return ossFileService.deleteFileOss(filename);
    }

    /**
     * 执行文件下载
     * @param objectName  下载的文件名  上传后的filepath(例如：demo/001.jpg)
     * @param response
     * @throws IOException
     */
    @RequestMapping("/oss/downloadFile.json")
    @ResponseBody
    public void download(@RequestParam("fileName") String objectName, HttpServletResponse response) throws IOException {
        //通知浏览器以附件形式下载
        response.setHeader("Content-Disposition",
                "attachment;filename=" + new String(objectName.getBytes(), "ISO-8859-1"));
        this.ossFileService.downloadOssFile(response.getOutputStream(),objectName);
    }
}

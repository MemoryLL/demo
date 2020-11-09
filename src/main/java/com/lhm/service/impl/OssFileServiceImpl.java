package com.lhm.service.impl;

import com.aliyun.oss.OSS;
import com.aliyun.oss.OSSException;
import com.aliyun.oss.model.ListObjectsRequest;
import com.aliyun.oss.model.OSSObject;
import com.aliyun.oss.model.OSSObjectSummary;
import com.aliyun.oss.model.ObjectListing;
import com.lhm.common.Result;
import com.lhm.config.AliyunConfig;
import com.lhm.service.OssFileService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.ServletOutputStream;
import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.util.List;

/**
 * @Author: lhm
 * @Date: 2020/11/9 18:41
 * 4
 */
@Service
public class OssFileServiceImpl implements OssFileService {

    @Autowired
    private AliyunConfig aliyunConfig;
    @Autowired
    private OSS ossClient;

    @Override
    public Result uploadFileOss(MultipartFile file) {
        //获取文件的原名
        String filename = file.getOriginalFilename();
        //判断文件是否为空
        if (!StringUtils.isNotBlank(filename)) {
            return Result.fail("上传文件不能为空，请检查");
        }
        String filepath = getFilePath(filename);
        //判断文件是否已经存在,该判断可加可不加，如果不加的话上传后会自动覆盖
        boolean exist = ossClient.doesObjectExist(aliyunConfig.getBucketName(), filepath);
        if (exist){
            return Result.fail("文件已经存在，请勿重复上传");
        }
        try {
            ossClient.putObject(aliyunConfig.getBucketName(), filepath, new ByteArrayInputStream(file.getBytes()));
        } catch (IOException e) {
            e.printStackTrace();
            //上传失败
            return Result.fail("上传过程中失败，请检查网络或者OSS");
        }
        return Result.success("上传成功",aliyunConfig.getUrlPrefix()+filepath);
    }

    @Override
    public Result deleteFileOss(String objectName) {
        // 根据BucketName,objectName删除文件
        try {
            ossClient.deleteObject(aliyunConfig.getBucketName(), objectName);
        }catch (OSSException e){
            e.printStackTrace();
            return Result.fail("删除失败,请检查网络或者OSS");
        }
        return Result.success("删除成功",null);
    }

    @Override
    public List<OSSObjectSummary> getList() {
        // 设置最大个数。
        final int maxKeys = 200;
        // 列举文件。
        ObjectListing objectListing = ossClient.listObjects(new ListObjectsRequest(aliyunConfig.getBucketName()).withMaxKeys(maxKeys));
        List<OSSObjectSummary> list = objectListing.getObjectSummaries();
        return list;
    }

    @Override
    public void downloadOssFile(ServletOutputStream outputStream, String objectName) throws IOException{
        // ossObject包含文件所在的存储空间名称、文件名称、文件元信息以及一个输入流。
        OSSObject ossObject = ossClient.getObject(aliyunConfig.getBucketName(), objectName);
        // 读取文件内容。
        BufferedInputStream in = new BufferedInputStream(ossObject.getObjectContent());
        BufferedOutputStream out = new BufferedOutputStream(outputStream);
        byte[] buffer = new byte[1024];
        int lenght = 0;
        while ((lenght = in.read(buffer)) != -1) {
            out.write(buffer, 0, lenght);
        }
        if (out != null) {
            out.flush();
            out.close();
        }
        if (in != null) {
            in.close();
        }
    }


    public String getFilePath(String filename) {
        //demo为项目名称
        return "demo/" + filename;
    }
}

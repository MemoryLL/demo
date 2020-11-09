package com.lhm.service;

import com.aliyun.oss.model.OSSObjectSummary;
import com.lhm.common.Result;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.ServletOutputStream;
import java.io.IOException;
import java.util.List;

/**
 * @Author: lhm
 * @Date: 2020/11/9 18:41
 * 4
 */
public interface OssFileService {
    Result uploadFileOss(MultipartFile file);

    Result deleteFileOss(String filename);

    List<OSSObjectSummary> getList();

    void downloadOssFile(ServletOutputStream outputStream, String objectName) throws IOException;

}

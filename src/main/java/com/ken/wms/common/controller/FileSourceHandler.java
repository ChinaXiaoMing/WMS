package com.ken.wms.common.controller;

import com.ken.wms.common.util.Response;
import com.ken.wms.common.util.ResponseUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Map;
import java.util.UUID;

/**
 * 处理文件下载请求
 */
@Controller
@RequestMapping("/commons/fileSource")
public class FileSourceHandler {

    private final Logger log = LoggerFactory.getLogger(FileSourceHandler.class);

    @Autowired
    private ResponseUtil responseUtil;

    @RequestMapping(value = "download/{fileName:.+}", method = RequestMethod.GET)
    public void fileDownload(@PathVariable("fileName") String fileName, HttpServletRequest request,
                             HttpServletResponse response) throws IOException {

        if (fileName == null) {
            return;
        }

        // 获取文件
        ServletContext context = request.getServletContext();
        String directory = context.getRealPath("/WEB-INF/download");
        Path file = Paths.get(directory, fileName);
        if (Files.exists(file)) {
            // 设置响应头
            response.addHeader("Content-Disposition", "attachment;filename=" + file.getFileName());
            Files.copy(file, response.getOutputStream());
            response.getOutputStream().flush();
        }
    }

    /**
     * 文件上传
     *
     * @param file 文件
     * @return 文件路径
     */
    @RequestMapping(value = "upload", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> upload(@RequestParam("file") MultipartFile file, HttpServletRequest request) {
        //  初始化 Response
        Response responseContent = responseUtil.newResponseInstance();
        String filePath;
        // window系统
        if (System.getProperty("os.name").contains("Windows")) {
            filePath = "C:\\upload";
        } else {
            filePath ="/home/upload";
        }

        log.info("文件路径：{}", filePath);
        if (file == null) {
            responseContent.setResponseResult(Response.RESPONSE_RESULT_ERROR);
        } else {
            // 上传文件名
            String originFileName = file.getOriginalFilename();
            // 生成随机文件名，防止文件重名
            String fileName = "GoodsFile_" + UUID.randomUUID().toString().replace("-", "")
                    + originFileName.substring(originFileName.lastIndexOf("."));
            log.info("文件名称：{}", fileName);
            String allPathFile = filePath + File.separator + fileName;
            File dest = new File(allPathFile);
            //文件不存在，则新建文件夹
            if (!dest.getParentFile().exists()) {
                boolean result = dest.getParentFile().mkdirs();
                if (!result) {
                    log.error("上传文件夹创建失败，没有创建文件夹的权限");
                }
            }
            try {
                file.transferTo(dest);
            } catch (IOException e) {
                log.error("文件上传失败！", e);
            }

            log.info("上传文件全限名：{}", allPathFile);
            responseContent.setCustomerInfo("fileName", fileName);
        }

        return responseContent.generateResponse();
    }

}

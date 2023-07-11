package cn.keking.service.impl;

import cn.keking.config.ConfigConstants;
import cn.keking.model.FileAttribute;
import cn.keking.service.FilePreview;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import java.io.File;
import java.net.URLEncoder;

/**
 * ANSYS文件预览
 *
 * @author Li Jie
 * @author Corilead DevTeam
 */
@Service
public class Viewer3DPreviewImpl implements FilePreview {
    private final String fileDir = ConfigConstants.getFileDir();
    private final String demoDir = "demo";
    private final String demoPath = demoDir + File.separator;
    private final CommonPreviewImpl commonPreview;

    public Viewer3DPreviewImpl(CommonPreviewImpl commonPreview) {
        this.commonPreview = commonPreview;
    }

    @Override
    public String filePreviewHandle(String url, Model model, FileAttribute fileAttribute) {
        commonPreview.filePreviewHandle(url, model, fileAttribute);
        String path = fileDir + demoPath + fileAttribute.getName();
        path = URLEncoder.encode(path).replaceAll("\\+", "%20");
        model.addAttribute("viewerUrl", path);
        return VIEWER;
    }
}

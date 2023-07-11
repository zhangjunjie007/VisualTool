<!DOCTYPE html>

<html lang="en">
<head>
  <meta charset="utf-8"/>
  <meta name="viewport" content="width=device-width, user-scalable=yes, initial-scale=1.0">
  <title>ANSYS文件预览</title>
  <#include "*/commonHeader.ftl">
</head>
<body>
<iframe src="" width="100%" frameborder="0"></iframe>
<#if currentUrl?contains("http://") || currentUrl?contains("https://")>
<#assign finalUrl="${currentUrl}">
<#else>
<#assign finalUrl="${baseUrl}${currentUrl}">
</#if>
<script>
  var url = '${finalUrl}';
  var baseUrl = '${baseUrl}'.endsWith('/') ? '${baseUrl}' : '${baseUrl}' + '/';
  if (!url.startsWith(baseUrl)) {
    url = baseUrl + 'getCorsFile?urlPath=' + encodeURIComponent(Base64.encode(url));
  }
  document.getElementsByTagName('iframe')[0].src = "${baseUrl}viewer/index.html?src=about#U"+ encodeURIComponent(url)+"";
  document.getElementsByTagName('iframe')[0].height = document.documentElement.clientHeight - 10;
  /**
   * 页面变化调整高度
   */
  window.onresize = function () {
    var fm = document.getElementsByTagName("iframe")[0];
    fm.height = window.document.documentElement.clientHeight - 10;
  }


</script>
</body>

</html>

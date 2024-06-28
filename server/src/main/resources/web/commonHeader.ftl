<#setting classic_compatible=true>
<link rel="icon" href="./favicon.ico" type="image/x-icon">
<script src="js/watermark.js" type="text/javascript"></script>

<script>
    /**
     * 初始化水印
     */
    function initWaterMark() {
        let watermarkTxt = '${watermarkTxt}';
        if (watermarkTxt !== '') {
            watermark.init({
                watermark_txt: '${watermarkTxt}',
                watermark_x: 0,
                watermark_y: 0,
                watermark_rows: 0,
                watermark_cols: 0,
                watermark_x_space: ${watermarkXSpace},
                watermark_y_space: ${watermarkYSpace},
                watermark_font: '${watermarkFont}',
                watermark_fontsize: '${watermarkFontsize}',
                watermark_color: '${watermarkColor}',
                watermark_alpha: ${watermarkAlpha},
                watermark_width: ${watermarkWidth},
                watermark_height: ${watermarkHeight},
                watermark_angle: ${watermarkAngle},
            });
        }
    }
    function isWechatBrowser() {
        // 判断是否在微信内置浏览器中打开
        return typeof WeixinJSBridge !== 'undefined' || /MicroMessenger/i.test(navigator.userAgent);
    }
    function isInWxWork() {
        var ua = navigator.userAgent.toLowerCase();
        return /wxwork/i.test(ua);
    }

    // 企微下增加返回按钮
    document.addEventListener('DOMContentLoaded', function() {
        var isShowBack = true; //isWechatBrowser() || isInWxWork();
        if (isShowBack) {
            // 如果在微信环境中
            var backButton = document.createElement('img');
            backButton.src = "images/back3.svg";
            backButton.width = 64;
            backButton.height = 64;
            backButton.style.cssText = "position: fixed; cursor: pointer; bottom: 64px; right: 64px; z-index: 999;";
            backButton.alt = "返回";
            backButton.title = "返回";
            document.body.appendChild(backButton);

            // 返回按钮点击事件
            backButton.addEventListener('click', function() {
                if (history.length > 1) {
                    window.history.back(); // 可以后退时执行后退操作
                } else {
                    window.close(); // 不能后退时执行关闭窗口操作
                }
            });

            // 处理页面加载错误的情况
            window.addEventListener('error', function() {
                backButton.style.display = 'block';
            });
        }
    });
</script>

<style>
    * {
        margin: 0;
        padding: 0;
    }

    html, body {
        height: 100%;
        width: 100%;
    }
</style>

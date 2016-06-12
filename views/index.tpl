<!DOCTYPE html>
<html lang="zh-Hant">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="stylesheet" href="http://overpass-30e2.kxcdn.com/overpass.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/4.1.1/normalize.min.css" />
    <title>天氣 – 國立臺灣大學, 台灣</title>

    <style type="text/css">
        * {
            box-sizing: border-box;
        }

        a {
            color: inherit;
            text-decoration: none;
        }

        a:hover, a:active {
            color: #777;
        }

        html, body {
            background: #f9f9f9;
            color: #2b2b2b;
            font-family: Overpass, 'Pingfang TC', 'Source Han Sans TW', 'Microsoft Jhenghei', sans-serif;
        }

        .section {
            max-width: 62rem;
            margin: auto;
            padding: 1rem 1rem;
        }

        .logo {
            width: 20rem;
            height: auto;
        }

        .weather {
            background: #61a4b3 url('https://c2.staticflickr.com/8/7356/9144879696_a0e9305430_h.jpg') center / cover;
            color: rgba(255, 255, 255, .95);
            text-shadow: rgba(0, 0, 0, .1) 0 0 5px;
        }

        .weather .section {
            min-height: 30rem;
        }

        .weather h3 {
            font-weight: inherit;
            margin: 0;

        }

        .temperature span {
            display: inline-block;
        }

        .temperature .current {
            font-size: 8rem;
            letter-spacing: -.4rem;
        }

        .temperature .unit {
            font-size: 3rem;
            padding-top: 2rem;
            vertical-align: top;
        }

        .dashboard ul {
            color: rgba(255, 255, 255, .6);
            list-style: none;
            margin: 0;
            padding: 0;
        }

        .dashboard ul em {
            color: white;
            font-style: normal;
        }

        .dashboard .wind {
            color: white;
            display: inline-block;
            margin: 0 .25rem;
            text-align: center;
            width: 1rem;
            vertical-align: middle;
        }

        .source {
            color: rgba(255, 255, 255, .5);
            padding-top: 5rem;
            font-size: .75rem;
        }

        footer {
            font-size: .75rem;
            font-weight: 600;
        }

        .hide {
            color: #777;
            opacity: 0;
            transition: opacity .2s ease;
        }

        .section:hover .hide {
            opacity: 1;
        }

        footer .social {
            float: right;
            text-align: right;
            width: 200px;
        }
    </style>
    <script>
        (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){(i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)})(window,document,'script','https://www.google-analytics.com/analytics.js','ga');
        ga('create', 'UA-79166280-1', 'auto');
        ga('send', 'pageview');
    </script>
<%
    def value(text, digits=0, default='N/A'):
        try:
            float_value = float(text)
            if digits < 1:
                return round(float_value)
            else:
                return round(float_value, digits)
            end
        except ValueError:
            return default
        end
    end
%>
</head>
<body>
    <header class="section">
        <img alt="國立臺灣大學學生會" class="vendor logo" src="http://rschiang.github.io/student-weekly-themes/assets/logo.png" />
    </header>
    <section class="weather">
        <div class="section">
% if error:
            <h3>資訊暫時無法使用。</h3>
% else:
            <div class="temperature">
                <span class="current">{{ value(temperature) }}</span>
                <span class="unit">°C</span>
            </div>
            <div class="dashboard">
                <ul>
                    <li>本日氣溫 <em>{{ value(temp_min) }} – {{ value(temp_max) }} °C</em></li>
                    <li>風向 <span class="wind" style="transform: rotate({{ value(wind_direction, 1) - 90 }}deg)">➤</span> <em>{{ value(wind_speed) }} m/s</em></li>
                    <li>氣壓 <em>{{ value(pressure, 1) }} hPa</em></li>
                    <li>降雨強度 <em>{{ value(rain, 1) }} mm/h</em></li>
                    <li>濕度 <em>{{ value(humidity, 1) }}%</em></li>
                    <li>本日降雨 <em>{{ value(rain_day, 1) }} mm</em></li>
                </ul>
            </div>
% end
            <div class="source">
                資料來源：國立臺灣大學中尺度暨地形降水研究室
            </div>
        </div>
    </section>
    <footer class="section">
        <div class="social">
            <iframe src="https://www.facebook.com/plugins/like.php?href=https%3A%2F%2Fwww.facebook.com%2FNTUWelfare&width=92&layout=button_count&action=like&show_faces=false&share=false&height=21&appId=599411893573946" width="92" height="21" style="border:none;overflow:hidden" scrolling="no" frameborder="0" allowTransparency="true"></iframe>
            <iframe src="https://www.facebook.com/plugins/share_button.php?href=http%3A%2F%2Fntustudents.org%2F&layout=button&mobile_iframe=true&appId=599411893573946&width=58&height=21" width="58" height="21" style="border:none;overflow:hidden" scrolling="no" frameborder="0" allowTransparency="true"></iframe>
        </div>
        <div class="meta">
            第 28 屆<a href="https://www.facebook.com/NTUWelfare" rel="external nofollow">國立臺灣大學學生會福利部</a>
            <span class="hide">「總是為你撐起一把傘。」</span><br />
            National Taiwan University Student Association, 2016
        </div>
    </footer>
</body>
</html>
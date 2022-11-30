import webbrowser
import psutil

urls = set([
    "https://www.youtube.com/",
    "https://gitlab.neoway.com.br/",
    "https://mail.google.com/",
    "https://app.slack.com/client/T041E87SH"
    ])

chrome_path = "/opt/google/chrome/google-chrome"

webbrowser.register('chrome', None, 
                    webbrowser.BackgroundBrowser(chrome_path))

if not "chrome" in (i.name() for i in psutil.process_iter()):
    for idx,url in enumerate(urls):
        webbrowser.get('chrome').open(url, new=1, autoraise = True)
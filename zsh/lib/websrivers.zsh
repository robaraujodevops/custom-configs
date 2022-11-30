WEBDRIVERBIN=/opt/WebDriver/bin

if [[ -d "$WEBDRIVERBIN" ]]; then
  export PATH=$PATH:$WEBDRIVERBIN
fi

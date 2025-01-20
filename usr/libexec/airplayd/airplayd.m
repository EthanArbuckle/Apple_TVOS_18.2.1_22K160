BOOL start()
{
  void *v0;
  const char *v1;
  uint64_t v2;
  int *v3;
  uint64_t v4;
  void (*v5)(const char *);
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v10[1024];
  v0 = objc_autoreleasePoolPush();
  if (dword_100008010 <= 50
    && (dword_100008010 != -1 || _LogCategory_Initialize(&dword_100008010, 33554482LL)))
  {
    LogPrintF(&dword_100008010, "int main(int, const char **)", 33554482LL, "airplayd starting");
  }

  bzero(v10, 0x400uLL);
  _set_user_dir_suffix("com.apple.airplayd");
  if (confstr(65537, v10, 0x400uLL))
  {
    if (dword_100008010 <= 50
      && (dword_100008010 != -1 || _LogCategory_Initialize(&dword_100008010, 33554482LL)))
    {
      getprogname();
      v1 = "%s: will use temp directory '%s'";
      v2 = 33554482LL;
LABEL_12:
      LogPrintF(&dword_100008010, "void setupTempDirectory(const char *)", v2, v1);
    }
  }

  else if (dword_100008010 <= 90 {
         && (dword_100008010 != -1 || _LogCategory_Initialize(&dword_100008010, 33554522LL)))
  }
  {
    getprogname();
    v3 = __error();
    strerror(*v3);
    v2 = 33554522LL;
    v1 = "%s: failed to initialize temp directory: %s";
    goto LABEL_12;
  }

  FigCommonMediaProcessInitialization(8LL, 0LL);
  FigServer_SetAllowProcName(1LL);
  v4 = LogSetAppID(@"com.apple.airplay");
  if (IsAppleInternalBuild(v4))
  {
    LogControl( "?AirPlayClientCore:level=info,AirPlayEndpointCore:level=info,AirPlayHALPluginCore:level=info,AirPlayHIDCore:level= info,APAudioEngine:level=info,APBrowser:level=verbose,APBrowserBTLEManager:level=info,APBonjourBrowser:level=info, APBrowserController:level=info,APEndpoint:level=info,APEndpointManager:level=info,APEndpointStreamAudio:level=info ,APEndpointStreamPlayback:level=info,APEndpointStreamScreen:level=info,APSenderSessionSDP:level=info,APSenderSessi onAirPlay:level=info,AirPlayPairing:level=info");
  }

  else
  {
    LogControl("?.*:output2=");
    v5 = (void (*)(const char *))dlsym((void *)0xFFFFFFFFFFFFFFFFLL, "MediaControlSenderLogControl");
    if (v5) {
      v5("?.*:output2=");
    }
  }

  v6 = LogControl(".*:flags=public;time");
  v7 = AirPlayXPCServicesStart(v6);
  v8 = v7;
  if ((_DWORD)v7)
  {
    APSLogErrorAt(v7, "airplaydmain", 75LL, 0LL);
    APSLogErrorAt(v8, "main", 107LL, 0LL);
    if (dword_100008010 <= 90
      && (dword_100008010 != -1 || _LogCategory_Initialize(&dword_100008010, 33554522LL)))
    {
      LogPrintF(&dword_100008010, "int main(int, const char **)", 33554522LL, "Error encountered on launch: %d", v8);
    }
  }

  else
  {
    -[NSRunLoop run](+[NSRunLoop currentRunLoop](&OBJC_CLASS___NSRunLoop, "currentRunLoop"), "run");
  }

  objc_autoreleasePoolPop(v0);
  return (_DWORD)v8 != 0;
}

id objc_msgSend_run(void *a1, const char *a2, ...)
{
  return [a1 run];
}
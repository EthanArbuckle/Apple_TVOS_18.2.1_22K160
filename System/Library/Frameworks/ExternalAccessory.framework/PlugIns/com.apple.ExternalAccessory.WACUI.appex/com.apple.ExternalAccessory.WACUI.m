void sub_100001258(uint64_t a1, void *a2)
{
  id v2;
  if (a2)
  {
    v2 = a2;
    if ((objc_opt_respondsToSelector() & 1) != 0) {
      [v2 shouldCheckWiFiPowerStatus];
    }
  }
}

void sub_100001470(uint64_t a1)
{
  v2 = *(_BYTE **)(a1 + 32);
  if (v2[32])
  {
    NSLog(@"Plugin: signalling presentation complete");
    v2 = *(_BYTE **)(a1 + 32);
  }

  id v3 = (id)objc_claimAutoreleasedReturnValue([v2 _remoteViewControllerProxy]);
  [v3 _signalPresentationComplete];
}

int main(int argc, const char **argv, const char **envp)
{
  return 0;
}

id objc_msgSend_wifiDidShutdown(void *a1, const char *a2, ...)
{
  return [a1 wifiDidShutdown];
}
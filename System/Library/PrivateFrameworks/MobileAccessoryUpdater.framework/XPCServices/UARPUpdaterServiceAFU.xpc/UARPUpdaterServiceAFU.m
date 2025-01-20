void sub_10000216C(uint64_t a1)
{
  unsigned __int8 v2;
  os_log_s *v3;
  BOOL v4;
  uint64_t v5;
  void *v6;
  os_log_s *v7;
  void *v8;
  uint64_t v9;
  int v10;
  const char *v11;
  __int16 v12;
  uint64_t v13;
  v2 = [*(id *)(a1 + 32) createFWAssetInfo];
  v3 = *(os_log_s **)(*(void *)(a1 + 40) + 8LL);
  v4 = os_log_type_enabled(v3, OS_LOG_TYPE_INFO);
  if ((v2 & 1) != 0)
  {
    if (v4)
    {
      v5 = *(void *)(a1 + 48);
      v10 = 136315394;
      v11 = "-[UARPUpdaterServiceAFU ioKitRuleMatched:]_block_invoke";
      v12 = 2112;
      v13 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_INFO,  "%s: Updating Firmware for %@",  (uint8_t *)&v10,  0x16u);
    }

    v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) updateFirmwareWithOptions:0]);
    if (v6)
    {
      v7 = *(os_log_s **)(*(void *)(a1 + 40) + 8LL);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        sub_100002910(a1, (uint64_t)v6, v7);
      }
    }

    v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) controllers]);
    [v8 removeObject:*(void *)(a1 + 32)];
  }

  else if (v4)
  {
    v9 = *(void *)(a1 + 48);
    v10 = 136315394;
    v11 = "-[UARPUpdaterServiceAFU ioKitRuleMatched:]_block_invoke";
    v12 = 2112;
    v13 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_INFO,  "%s: Failed to get firmware asset Info for %@",  (uint8_t *)&v10,  0x16u);
  }
}

void sub_100002474(uint64_t a1)
{
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)qword_100008B68;
  qword_100008B68 = (uint64_t)v1;
}

int main(int argc, const char **argv, const char **envp)
{
  v3 = os_log_create("com.apple.accessoryupdater.UARPUpdaterServiceAFU", "main");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "UARP Updater Service AFU Started", v7, 2u);
  }

  if (!AUSandboxPlatformInit(v3, "com.apple.accessoryupdater.UARPUpdaterServiceAFU"))
  {
    v4 = objc_opt_new(&OBJC_CLASS___UARPUpdaterServiceAFUDelegate);
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCListener serviceListener](&OBJC_CLASS___NSXPCListener, "serviceListener"));
    [v5 setDelegate:v4];
    [v5 resume];
  }

  return 0;
}

uint64_t AUSandboxPlatformInitWithBundleIdentifier(void *a1, const char *a2)
{
  id v3 = a1;
  if (!v3)
  {
    id v3 = &_os_log_default;
    id v4 = &_os_log_default;
  }

  if (a2) {
    v5 = a2;
  }
  else {
    v5 = "com.apple.MobileAccessoryUpdater";
  }
  id v6 = v3;
  bzero(v10, 0x400uLL);
  id v7 = v6;
  if ((_set_user_dir_suffix(v5) & 1) != 0)
  {
    if (confstr(65537, v10, 0x400uLL))
    {
      uint64_t v8 = 0LL;
      goto LABEL_14;
    }

    if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_ERROR)) {
      sub_100002A30();
    }
  }

  else if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_ERROR))
  {
    sub_100002AA4();
  }

  uint64_t v8 = 1LL;
LABEL_14:

  return v8;
}

void sub_100002868( void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

void sub_100002888(uint64_t a1, os_log_s *a2)
{
  int v2 = 136315394;
  id v3 = "-[UARPUpdaterServiceAFU ioKitRuleMatched:]";
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "%s: Failed to init AFU Controller for %@",  (uint8_t *)&v2,  0x16u);
}

void sub_100002910(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3 = *(void *)(a1 + 48);
  int v4 = 136315650;
  uint64_t v5 = "-[UARPUpdaterServiceAFU ioKitRuleMatched:]_block_invoke";
  __int16 v6 = 2112;
  uint64_t v7 = v3;
  __int16 v8 = 2112;
  uint64_t v9 = a2;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "%s: Failed to update %@ with error: %@",  (uint8_t *)&v4,  0x20u);
}

void sub_1000029A8(uint64_t a1, os_log_s *a2)
{
  int v2 = 136315394;
  uint64_t v3 = "-[UARPUpdaterServiceAFUPreferences overriddenFirmwareAssetDirectoryURL]";
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "%s: read value %@", (uint8_t *)&v2, 0x16u);
}

void sub_100002A30()
{
}

void sub_100002AA4()
{
}

id objc_msgSend_updateFirmwareWithOptions_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateFirmwareWithOptions:");
}
uint64_t sub_1000025E8(os_log_s *a1, const char *a2)
{
  os_log_s *v2;
  const char *v3;
  char v5[1024];
  if (a1) {
    v2 = a1;
  }
  else {
    v2 = (os_log_s *)&_os_log_default;
  }
  if (a2) {
    v3 = a2;
  }
  else {
    v3 = "com.apple.MobileAccessoryUpdater";
  }
  bzero(v5, 0x400uLL);
  if ((_set_user_dir_suffix(v3) & 1) == 0)
  {
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      sub_100002D6C();
    }
    return 1LL;
  }

  if (!confstr(65537, v5, 0x400uLL))
  {
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      sub_100002CF8();
    }
    return 1LL;
  }

  return 0LL;
}

void sub_1000026D0( void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}
}

uint64_t start()
{
  v0 = objc_autoreleasePoolPush();
  FudLog(7LL, @"Starting Accessory Firmware Updater Early Boot");
  FudLogSetMode(1LL);
  if (sub_1000026CC(0LL, "com.apple.auearlyboot"))
  {
    v1 = @"Failed to enter sandbox";
  }

  else
  {
    v3 = objc_alloc_init(&OBJC_CLASS___FudEarlyBoot);
    if (v3)
    {
      v4 = v3;
      uint64_t v2 = -[FudEarlyBoot doFUDEarlyBoot:](v3, "doFUDEarlyBoot:", 0LL);

      FudLog(7LL, @"Exitng Early Boot");
      goto LABEL_6;
    }

    v1 = @"Failed to initialize accessory updater early boot";
  }

  FudLog(3LL, v1);
  uint64_t v2 = 1LL;
LABEL_6:
  objc_autoreleasePoolPop(v0);
  return v2;
}

void sub_100002CF8()
{
}

void sub_100002D6C()
{
}

id objc_msgSend_updateFirmwareWithOptions_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateFirmwareWithOptions:");
}
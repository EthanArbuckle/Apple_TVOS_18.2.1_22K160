int main(int argc, const char **argv, const char **envp)
{
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
      sub_100002EA8();
    }
  }

  else if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_ERROR))
  {
    sub_100002F1C();
  }

  uint64_t v8 = 1LL;
LABEL_14:

  return v8;
}

void sub_100002E88( void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

void sub_100002EA8()
{
}

void sub_100002F1C()
{
}

id objc_msgSend_updateFirmwareWithOptions_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateFirmwareWithOptions:");
}
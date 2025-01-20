LABEL_14:
    CFRelease(v10);
    CFRelease(v11);
    if (self->appleHPMInterfaceService)
    {
      appleHPMDeviceService = self->appleHPMDeviceService;
      if (appleHPMDeviceService)
      {
        v19 = (const __CFNumber *)IORegistryEntryCreateCFProperty( appleHPMDeviceService,  @"Device ID",  kCFAllocatorDefault,  0);
        if (v19)
        {
          v20 = v19;
          CFNumberGetValue(v19, kCFNumberIntType, &valuePtr);
          CFRelease(v20);
          if ((valuePtr - 33628200) > 0xFFFFFFFB)
          {
            v6 = 0;
          }

          else
          {
            v6 = -536870201;
            if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)v22 = 0;
              _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "Not matching on non Type-3 Devices!\n",  v22,  2u);
            }
          }
        }

        else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        {
          sub_10000352C();
        }
      }
    }
  }

  return v6;
}

void sub_1000033F4( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

  ;
}

uint64_t start()
{
  v0 = objc_autoreleasePoolPush();
  os_log_t v1 = os_log_create("com.apple.usbctelemetryd", "Analytics");
  v2 = IOServiceMatching("AppleHPMARM");
  IOServiceGetMatchingServices(kIOMainPortDefault, v2, &existing);
  uint64_t v3 = IOIteratorNext(existing);
  if ((_DWORD)v3)
  {
    uint64_t v4 = v3;
    do
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[AppleHPMManager create](&OBJC_CLASS___AppleHPMManager, "create"));
      if (![v5 initialize:v4 withLogger:v1])
      {
        [v5 collectAllAnalytics];
        v6 = (void *)objc_claimAutoreleasedReturnValue([v5 _analyticsDict]);
        AnalyticsSendEvent(@"com.apple.usbcd.reset_reasons", v6);
      }

      IOObjectRelease(v4);
      uint64_t v4 = IOIteratorNext(existing);
    }

    while ((_DWORD)v4);
  }

  IOObjectRelease(existing);

  objc_autoreleasePoolPop(v0);
  return 0LL;
}

void sub_10000352C()
{
}

void sub_100003558()
{
}

void sub_100003584()
{
}

void sub_1000035B0()
{
}

void sub_1000035DC()
{
}

void sub_100003608()
{
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithFormat:");
}
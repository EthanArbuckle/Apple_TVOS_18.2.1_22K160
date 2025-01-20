@interface IOKit
@end

@implementation IOKit

void ____wait_for_IOKit_to_quiesce_block_invoke()
{
  values[1] = *(void **)MEMORY[0x1895F89C0];
  qword_18C54F7A0 = (uint64_t)"Waiting for IOKit to quiesce (or timeout)";
  SCDynamicStoreRef v0 = SCDynamicStoreCreate(0LL, @"SCNetworkInterfaceCopyAll", 0LL, 0LL);
  if (!v0)
  {
    qword_18C54F7A0 = 0LL;
    return;
  }

  v1 = v0;
  values[0] = (void *)SCDynamicStoreKeyCreate(0LL, @"%@InterfaceNamer", @"Plugin:");
  v2 = CFArrayCreate(0LL, (const void **)values, 1LL, MEMORY[0x189605228]);
  int v3 = SCDynamicStoreSetNotificationKeys(v1, v2, 0LL);
  CFRelease(v2);
  if (v3)
  {
    while (1)
    {
      CFPropertyListRef v4 = SCDynamicStoreCopyValue(v1, (CFStringRef)values[0]);
      if (v4)
      {
        v5 = v4;
        CFTypeID TypeID = CFDictionaryGetTypeID();
        if (CFGetTypeID(v5) == TypeID
          && (CFDictionaryContainsKey((CFDictionaryRef)v5, @"*QUIET*")
           || CFDictionaryContainsKey((CFDictionaryRef)v5, @"*COMPLETE*")
           || CFDictionaryContainsKey((CFDictionaryRef)v5, @"*TIMEOUT*")))
        {
          CFRelease(v5);
          goto LABEL_18;
        }

        CFRelease(v5);
      }

      CFArrayRef v7 = SCDynamicStoreCopyNotifiedKeys(v1);
      if (v7) {
        CFRelease(v7);
      }
    }

    v8 = __log_SCNetworkConfiguration();
    uint64_t v9 = _SC_syslog_os_log_mapping(5);
    if (!__SC_log_enabled(5, v8, (os_log_type_t)v9)) {
      goto LABEL_18;
    }
    goto LABEL_16;
  }

  v8 = __log_SCNetworkConfiguration();
  uint64_t v9 = _SC_syslog_os_log_mapping(5);
  if (__SC_log_enabled(5, v8, (os_log_type_t)v9))
  {
LABEL_16:
    uint64_t v10 = _os_log_pack_size();
    v11 = (char *)values - ((MEMORY[0x1895F8858](v10) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    __error();
    uint64_t v12 = _os_log_pack_fill();
    int v13 = SCError();
    v14 = SCErrorString(v13);
    *(_DWORD *)uint64_t v12 = 136315138;
    *(void *)(v12 + 4) = v14;
    __SC_log_send(5, (uint64_t)v8, v9, v11);
  }

@end
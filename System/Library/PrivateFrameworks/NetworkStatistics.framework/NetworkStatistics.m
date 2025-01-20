LABEL_6:
}
}

uint64_t printf_domain()
{
  return printf_domain_printfdomain;
}

_printf_domain *__printf_domain_block_invoke()
{
  result = new_printf_domain();
  printf_domain_printfdomain = (uint64_t)result;
  if (result)
  {
    register_printf_domain_render_std(result, "M");
    register_printf_domain_function( (printf_domain_t)printf_domain_printfdomain,  78,  (printf_function *)xprint_sockaddr,  (printf_arginfo_function *)xprint_sockaddr_arginfo,  0LL);
    register_printf_domain_function( (printf_domain_t)printf_domain_printfdomain,  64,  (printf_function *)xprint_cfobject,  (printf_arginfo_function *)xprint_cfobject_arginfo,  0LL);
    return (_printf_domain *)register_printf_domain_function( (printf_domain_t)printf_domain_printfdomain,  73,  (printf_function *)xprint_ifindex,  (printf_arginfo_function *)xprint_ifindex_arginfo,  0LL);
  }

  return result;
}

uint64_t xprint_sockaddr(FILE *a1, uint64_t a2, unsigned __int8 ***a3)
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  v4 = **a3;
  if (!v4) {
    return fprintf(a1, "<NULL>");
  }
  unint64_t v5 = *v4;
  unsigned int v8 = v4[1];
  if (v8 > 0x11)
  {
    if (v8 == 18)
    {
      if (v5 >= 8)
      {
        uint64_t v11 = v4[5];
        if (v11 + v4[6] + (unint64_t)v4[7] + 8 <= v5)
        {
          if (v4[6])
          {
            unint64_t v12 = 0LL;
            LODWORD(v6) = 0;
            do
            {
              if (v12) {
                int v13 = fprintf(a1, ":%x");
              }
              else {
                int v13 = fprintf(a1, "%x");
              }
              uint64_t v6 = (v13 + v6);
              ++v12;
            }

            while (v12 < v4[6]);
            LODWORD(v11) = v4[5];
          }

          else
          {
            uint64_t v6 = 0LL;
          }

          if ((_DWORD)v11)
          {
            int v14 = fprintf(a1, "%s%*s");
          }

          else
          {
            if (!*((_WORD *)v4 + 1)) {
              return v6;
            }
            if ((_DWORD)v6) {
              int v14 = fprintf(a1, "%%%d");
            }
            else {
              int v14 = fprintf(a1, "%d");
            }
          }

          return (v14 + v6);
        }
      }

      return 0LL;
    }

    if (v8 != 30) {
      return fprintf(a1, "<unsupported af: %u>");
    }
    goto LABEL_12;
  }

  if (v8 != 1)
  {
    if (v8 != 2) {
      return fprintf(a1, "<unsupported af: %u>");
    }
LABEL_12:
    if (!getnameinfo((const sockaddr *)v4, v5, v16, 0x39u, v15, 6u, 10))
    {
      if (!*((_WORD *)v4 + 1)) {
        return fprintf(a1, "%s");
      }
      if (v4[1] == 2) {
        v9 = "%s:%s";
      }
      else {
        v9 = "%s.%s";
      }
      return fprintf(a1, v9, v16, v15);
    }

    return 0LL;
  }

  return fprintf(a1, "%.*s");
}

uint64_t xprint_sockaddr_arginfo(uint64_t a1, uint64_t a2, _DWORD *a3)
{
  if (a2) {
    *a3 = 32;
  }
  return 1LL;
}

uint64_t xprint_cfobject(FILE *a1, uint64_t a2, CFTypeRef **a3)
{
  v4 = (const __CFString *)**a3;
  if (!v4) {
    return fprintf(a1, "<NULL>");
  }
  CFTypeID v5 = CFGetTypeID(**a3);
  if (v5 == CFDictionaryGetTypeID() || (CFTypeID v6 = CFGetTypeID(v4), v6 == CFArrayGetTypeID()))
  {
    int v7 = fprintf(a1, "\n");
    return xprint_cfobject_container(a1, 2, v4) + v7;
  }

  else
  {
    xprint_cfobject_leaf(a1, v4);
    return 0LL;
  }
}

uint64_t xprint_cfobject_arginfo(uint64_t a1, uint64_t a2, _DWORD *a3)
{
  if (a2) {
    *a3 = 32;
  }
  return 1LL;
}

uint64_t xprint_ifindex(FILE *a1, uint64_t a2, unsigned int **a3)
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  unsigned int v4 = **a3;
  v6[0] = 0;
  if_indextoname(v4, v6);
  if (!v6[0]) {
    return fprintf(a1, "%d");
  }
  v6[16] = 0;
  return fprintf(a1, "%s");
}

uint64_t xprint_ifindex_arginfo(uint64_t a1, uint64_t a2, _DWORD *a3)
{
  if (a2) {
    *a3 = 1;
  }
  return 1LL;
}

id NStatGetLog()
{
  if (NStatGetLog_pred != -1) {
    dispatch_once(&NStatGetLog_pred, &__block_literal_global_306);
  }
  return (id)sNstatLogHandle;
}

void __NStatGetLog_block_invoke()
{
  uint64_t v34 = *MEMORY[0x1895F89C0];
  os_log_t v0 = os_log_create("com.apple.networkstatistics", "NetworkStatistics");
  v1 = (void *)sNstatLogHandle;
  sNstatLogHandle = (uint64_t)v0;

  if (sNstatLogHandle)
  {
    v2 = (void *)[objc_alloc(MEMORY[0x189603F48]) initWithContentsOfFile:@"/Library/Preferences/com.apple.NetworkStatistics.plist"];
    if (v2)
    {
      [MEMORY[0x1896079E8] propertyListWithData:v2 options:0 format:0 error:0];
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      if (v3)
      {
        pid_t v4 = getpid();
        if (proc_name(v4, buffer, 0x64u))
        {
          v25 = v2;
          unint64_t v5 = 0x189607000uLL;
          [NSString stringWithUTF8String:buffer];
          CFTypeID v6 = (void *)objc_claimAutoreleasedReturnValue();
          __int128 v28 = 0u;
          __int128 v29 = 0u;
          __int128 v30 = 0u;
          __int128 v31 = 0u;
          v24 = v3;
          id v7 = v3;
          uint64_t v8 = [v7 countByEnumeratingWithState:&v28 objects:v32 count:16];
          if (v8)
          {
            uint64_t v9 = v8;
            uint64_t v10 = *(void *)v29;
            v26 = v6;
            do
            {
              for (uint64_t i = 0LL; i != v9; ++i)
              {
                if (*(void *)v29 != v10) {
                  objc_enumerationMutation(v7);
                }
                unint64_t v12 = *(void **)(*((void *)&v28 + 1) + 8 * i);
                [v7 valueForKey:v12];
                int v13 = (void *)objc_claimAutoreleasedReturnValue();
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  if ([v12 isEqualToString:@"log_level"])
                  {
                    objc_opt_class();
                  }

                  else if (([v12 isEqualToString:@"all"] & 1) != 0 {
                         || [v12 isEqualToString:v6])
                  }
                  {
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) != 0)
                    {
                      id v27 = v6;
                      unint64_t v14 = v5;
                      id v15 = v13;
                      [v15 objectForKeyedSubscript:@"traceFilePrefix"];
                      v16 = (void *)objc_claimAutoreleasedReturnValue();
                      [v15 objectForKeyedSubscript:@"logVerbose"];
                      uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
                      [v15 objectForKeyedSubscript:@"traceVerbose"];
                      v18 = (void *)objc_claimAutoreleasedReturnValue();

                      unint64_t v5 = v14;
                      if (v16)
                      {
                        objc_opt_class();
                        if ((objc_opt_isKindOfClass() & 1) != 0)
                        {
                          v19 = *(void **)(v14 + 2600);
                          uint64_t v23 = getpid();
                          v20 = v19;
                          unint64_t v5 = v14;
                          uint64_t v21 = [v20 stringWithFormat:@"%@.%@.%d", v16, v27, v23];
                          v22 = (void *)traceFilePrefix;
                          traceFilePrefix = v21;
                        }
                      }

                      if (v17) {
                        defaultMgrFlags |= 0x10u;
                      }
                      if (v18) {
                        defaultMgrFlags |= 0x80u;
                      }

                      CFTypeID v6 = v26;
                    }
                  }
                }
              }

              uint64_t v9 = [v7 countByEnumeratingWithState:&v28 objects:v32 count:16];
            }

            while (v9);
          }

          v3 = v24;
          v2 = v25;
        }
      }
    }
  }

const char *msgTypeToString(int a1)
{
  if (a1 > 10000)
  {
    switch(a1)
    {
      case 10001:
        result = "src-added";
        break;
      case 10002:
        result = "src-removed";
        break;
      case 10003:
LABEL_9:
        result = "src-desc";
        break;
      case 10004:
        result = "src-counts";
        break;
      case 10005:
        result = "sysinfo-counts";
        break;
      case 10006:
        result = "src-update";
        break;
      default:
LABEL_21:
        result = "???";
        break;
    }
  }

  else
  {
    switch(a1)
    {
      case 1001:
        return "add-src";
      case 1002:
        return "add-all";
      case 1003:
        return "rem-src";
      case 1004:
        return "query-src";
      case 1005:
        goto LABEL_9;
      case 1006:
        return "set-filter";
      case 1007:
        return "get-update";
      case 1008:
        return "subscribe-sysinfo";
      default:
        if (a1)
        {
          if (a1 != 1) {
            goto LABEL_21;
          }
          result = "error";
        }

        else
        {
          result = "success";
        }

        break;
    }
  }

  return result;
}

void NStatMgrTraceF( void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
}

void NStatMgrVTraceF(void *a1, const char *a2, va_list a3)
{
  id v5 = a1;
  CFTypeID v6 = v5;
  if (v5 && ([v5 mgrflags] & 0x80) != 0)
  {
    id v7 = (void *)MEMORY[0x1895BB0FC]();
    __ret = 0LL;
    vasxprintf(&__ret, (printf_domain_t)printf_domain_printfdomain, 0LL, a2, a3);
    if (__ret)
    {
      objc_msgSend(v6, "trace:");
      free(__ret);
    }

    objc_autoreleasePoolPop(v7);
  }
}

void *NStatSourceCopyProperty(void *a1, uint64_t a2)
{
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 traditionalDictionary];
  pid_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 objectForKeyedSubscript:a2];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    uint64_t v6 = [v5 UUIDString];

    id v5 = (void *)v6;
  }

  return v5;
}

uint64_t NStatSourceCopyProperties(void *a1)
{
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v2 = [v1 traditionalDictionary];

  return v2;
}

uint64_t NStatSourceCopyCounts(void *a1)
{
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v2 = [v1 traditionalDictionary];

  return v2;
}

void NStatSourceSetRemovedBlock(void *a1, void *a2)
{
  id v8 = a1;
  id v3 = a2;
  [v8 delegate];
  pid_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    uint64_t v6 = objc_alloc_init(&OBJC_CLASS___NWStatisticsDelegateBlockWrapper);
    [v8 setDelegate:v6];
  }

  [v8 delegate];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 setRemovedBlock:v3];
}

void NStatSourceSetDescriptionBlock(void *a1, void *a2)
{
  id v8 = a1;
  id v3 = a2;
  [v8 delegate];
  pid_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    uint64_t v6 = objc_alloc_init(&OBJC_CLASS___NWStatisticsDelegateBlockWrapper);
    [v8 setDelegate:v6];
  }

  [v8 delegate];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 setDescriptionBlock:v3];
}

void NStatSourceSetCountsBlock(void *a1, void *a2)
{
  id v8 = a1;
  id v3 = a2;
  [v8 delegate];
  pid_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    uint64_t v6 = objc_alloc_init(&OBJC_CLASS___NWStatisticsDelegateBlockWrapper);
    [v8 setDelegate:v6];
  }

  [v8 delegate];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 setCountsBlock:v3];
}

void NStatSourceSetEventsBlock(void *a1, void *a2)
{
  id v8 = a1;
  id v3 = a2;
  [v8 delegate];
  pid_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    uint64_t v6 = objc_alloc_init(&OBJC_CLASS___NWStatisticsDelegateBlockWrapper);
    [v8 setDelegate:v6];
  }

  [v8 delegate];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 setEventsBlock:v3];
}

void NStatSourceRemove(void *a1)
{
  id v1 = a1;
  [v1 manager];
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v2 removeSource:v1];
}

uint64_t NStatManagerQueryAllSources(void *a1, const char *a2)
{
  return [a1 queryAllCounts:a2];
}

uint64_t NStatManagerQueryAllSourcesDescriptions(void *a1, const char *a2)
{
  return [a1 queryAllDescriptions:a2];
}

uint64_t NStatManagerQueryAllSourcesUpdate(void *a1, const char *a2)
{
  return [a1 queryAll:a2];
}

NWStatisticsRouteSource *NStatManagerCreateRouteSource(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return -[NWStatisticsRouteSource initWithManager:destination:mask:interface:]( objc_alloc(&OBJC_CLASS___NWStatisticsRouteSource),  "initWithManager:destination:mask:interface:",  a1,  a2,  a3,  a4);
}

uint64_t NStatManagerCreateTCPSource()
{
  return 0LL;
}

uint64_t NStatManagerCreateUDPSource()
{
  return 0LL;
}

uint64_t NStatManagerCreateSysinfoSource()
{
  return 0LL;
}

NWStatisticsInterfaceSource *NStatManagerCreateInterfaceSource(uint64_t a1, unsigned int a2, unsigned int a3)
{
  return -[NWStatisticsInterfaceSource initWithManager:interface:threshold:]( objc_alloc(&OBJC_CLASS___NWStatisticsInterfaceSource),  "initWithManager:interface:threshold:",  a1,  a2,  a3);
}

uint64_t NStatManagerAddAllTCP(void *a1, const char *a2)
{
  return [a1 addAllTCP:0 events:0 pid:0 uuid:0];
}

uint64_t NStatManagerAddAllTCPWithFilter(void *a1, const char *a2)
{
  return [a1 addAllTCP:a2 events:0 pid:0 uuid:0];
}

uint64_t NStatManagerAddAllTCPWithOptions(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return [a1 addAllTCP:a2 events:a3 pid:a4 uuid:a5];
}

uint64_t NStatManagerAddAllUDP(void *a1, const char *a2)
{
  return [a1 addAllUDP:0 events:0 pid:0 uuid:0];
}

uint64_t NStatManagerAddAllUDPWithFilter(void *a1, const char *a2)
{
  return [a1 addAllUDP:a2 events:0 pid:0 uuid:0];
}

uint64_t NStatManagerAddAllUDPWithOptions(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return [a1 addAllUDP:a2 events:a3 pid:a4 uuid:a5];
}

uint64_t NStatManagerAddAllRoutes(void *a1, const char *a2)
{
  return [a1 addAllRoute:0];
}

uint64_t NStatManagerAddAllRoutesWithFilter(void *a1, const char *a2)
{
  return [a1 addAllRoute:a2];
}

uint64_t NStatManagerDestroy(void *a1)
{
  return [a1 setStrongDelegate:0];
}

NWStatisticsManager *NStatManagerCreate(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  uint64_t v6 = objc_alloc_init(&OBJC_CLASS___NWStatisticsDelegateBlockWrapper);
  id v7 = v6;
  if (v6)
  {
    -[NWStatisticsDelegateBlockWrapper setAddedBlock:](v6, "setAddedBlock:", v5);
    id v8 = -[NWStatisticsManager initWithQueue:](objc_alloc(&OBJC_CLASS___NWStatisticsManager), "initWithQueue:", v4);
    -[NWStatisticsManager setStrongDelegate:](v8, "setStrongDelegate:", v7);
    -[NWStatisticsManager setDelegate:](v8, "setDelegate:", v7);
  }

  else
  {
    id v8 = 0LL;
  }

  return v8;
}

void NStatSourceSetFilter(void *a1, uint64_t a2)
{
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [v3 setFilter:a2];
}

void NStatManagerSetQueuePriority()
{
  os_log_t v0 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
    NStatManagerSetQueuePriority_cold_1(v0);
  }
}

uint64_t NStatManagerSetFlags(void *a1, const char *a2)
{
  return [a1 setMgrflags:a2];
}

uint64_t NStatManagerSetInterfaceTraceFD(void *a1, const char *a2)
{
  return [a1 setInterfaceTraceFd:a2];
}

uint64_t NStatManagerSetInterfaceSourceFD(void *a1, const char *a2)
{
  return [a1 setInterfaceSourceFd:a2];
}

BOOL NStatRouteValuesForIPv4Host(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = (void *)MEMORY[0x1895BB0FC]();
  int v7 = 1;
  if (a1 && a3)
  {
    +[NWSSnapshotSource routeSnapshotForIPv4Host:viaInterfaceIndex:]( &OBJC_CLASS___NWSSnapshotSource,  "routeSnapshotForIPv4Host:viaInterfaceIndex:",  a1,  a2);
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v9 = v8;
    if (v8)
    {
      [v8 rttMinimum];
      *(void *)a3 = v10;
      [v9 rttAverage];
      *(void *)(a3 + 8) = v11;
      [v9 rttVariation];
      *(void *)(a3 + 16) = v12;
      *(_DWORD *)(a3 + 24) = [v9 connectAttempts];
      int v7 = 0;
      *(_DWORD *)(a3 + 28) = [v9 connectSuccesses];
    }
  }

  objc_autoreleasePoolPop(v6);
  return v7 == 0;
}

BOOL NStatRouteValuesForIPv6Host(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = (void *)MEMORY[0x1895BB0FC]();
  int v7 = 1;
  if (a1 && a3)
  {
    +[NWSSnapshotSource routeSnapshotForIPv6Host:viaInterfaceIndex:]( &OBJC_CLASS___NWSSnapshotSource,  "routeSnapshotForIPv6Host:viaInterfaceIndex:",  a1,  a2);
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v9 = v8;
    if (v8)
    {
      [v8 rttMinimum];
      *(void *)a3 = v10;
      [v9 rttAverage];
      *(void *)(a3 + 8) = v11;
      [v9 rttVariation];
      *(void *)(a3 + 16) = v12;
      *(_DWORD *)(a3 + 24) = [v9 connectAttempts];
      int v7 = 0;
      *(_DWORD *)(a3 + 28) = [v9 connectSuccesses];
    }
  }

  objc_autoreleasePoolPop(v6);
  return v7 == 0;
}

uint64_t xprint_cfobject_container(FILE *a1, int a2, CFTypeRef cf)
{
  context[0] = 0;
  context[1] = a2;
  int v13 = a1;
  uint64_t v14 = 0LL;
  CFTypeID v6 = CFGetTypeID(cf);
  if (v6 == CFDictionaryGetTypeID())
  {
    if (CFDictionaryGetCount((CFDictionaryRef)cf))
    {
      CFDictionaryApplyFunction((CFDictionaryRef)cf, (CFDictionaryApplierFunction)xprint_cfobject_dictionary, context);
      return v14;
    }
  }

  else
  {
    CFTypeID v7 = CFGetTypeID(cf);
    if (v7 != CFArrayGetTypeID()) {
      return v14;
    }
    CFIndex Count = CFArrayGetCount((CFArrayRef)cf);
    if (Count)
    {
      v15.length = Count;
      v15.location = 0LL;
      CFArrayApplyFunction((CFArrayRef)cf, v15, (CFArrayApplierFunction)xprint_cfobject_array, context);
      return v14;
    }
  }

  if (a2 >= 80) {
    int v9 = 80;
  }
  else {
    int v9 = a2;
  }
  int v10 = fprintf(a1, "%.*s", v9, "                                                                                ");
  return (fprintf(a1, "<empty>") + v10);
}

uint64_t xprint_cfobject_leaf(FILE *a1, const __CFString *a2)
{
  if (!a2) {
    return fprintf(a1, "<NULL>");
  }
  CFTypeID v4 = CFGetTypeID(a2);
  if (v4 == CFStringGetTypeID())
  {
    CStringPtr = CFStringGetCStringPtr(a2, 0x8000100u);
    if (CStringPtr) {
      return fprintf(a1, "%s", CStringPtr);
    }
    CFIndex Length = CFStringGetLength(a2);
    CFIndex MaximumSizeForEncoding = CFStringGetMaximumSizeForEncoding(Length, 0x8000100u);
    uint64_t v12 = (char *)malloc(MaximumSizeForEncoding);
    if (v12)
    {
      int v13 = v12;
      if (CFStringGetCString(a2, v12, MaximumSizeForEncoding, 0x8000100u)) {
        uint64_t v14 = fprintf(a1, "%s", v13);
      }
      else {
        uint64_t v14 = 0LL;
      }
      free(v13);
      return v14;
    }

    return 0LL;
  }

  CFTypeID v7 = CFGetTypeID(a2);
  if (v7 == CFDataGetTypeID())
  {
    CFStringRef v8 = CFStringCreateFromExternalRepresentation((CFAllocatorRef)*MEMORY[0x189604DB0], (CFDataRef)a2, 0x8000100u);
    if (!v8) {
      return 0LL;
    }
LABEL_20:
    CFStringRef v17 = v8;
    uint64_t v14 = xprint_cfobject_leaf(a1, v8);
    CFRelease(v17);
    return v14;
  }

  CFTypeID v9 = CFGetTypeID(a2);
  if (v9 != CFBooleanGetTypeID())
  {
    CFTypeID v15 = CFGetTypeID(a2);
    if (v15 == CFNumberGetTypeID())
    {
      switch(CFNumberGetType((CFNumberRef)a2))
      {
        case kCFNumberSInt8Type:
          CFNumberGetValue((CFNumberRef)a2, kCFNumberSInt8Type, &valuePtr);
          uint64_t v16 = fprintf(a1, "(SInt8) %hhd");
          break;
        case kCFNumberSInt16Type:
          CFNumberGetValue((CFNumberRef)a2, kCFNumberSInt16Type, &valuePtr);
          uint64_t v16 = fprintf(a1, "(SInt16) %hd");
          break;
        case kCFNumberSInt32Type:
          CFNumberGetValue((CFNumberRef)a2, kCFNumberSInt32Type, &valuePtr);
          uint64_t v16 = fprintf(a1, "(SInt32) %d");
          break;
        case kCFNumberSInt64Type:
          CFNumberGetValue((CFNumberRef)a2, kCFNumberSInt64Type, &valuePtr);
          uint64_t v16 = fprintf(a1, "(SInt64) %lld");
          break;
        case kCFNumberFloat32Type:
          CFNumberGetValue((CFNumberRef)a2, kCFNumberFloat32Type, &valuePtr);
          uint64_t v16 = fprintf(a1, "(Float32) %f");
          break;
        case kCFNumberFloat64Type:
          CFNumberGetValue((CFNumberRef)a2, kCFNumberFloat64Type, &valuePtr);
          uint64_t v16 = fprintf(a1, "(Float64) %lf");
          break;
        case kCFNumberCharType:
          CFNumberGetValue((CFNumberRef)a2, kCFNumberCharType, &valuePtr);
          uint64_t v16 = fprintf(a1, "(Char) %hhd");
          break;
        case kCFNumberShortType:
          CFNumberGetValue((CFNumberRef)a2, kCFNumberShortType, &valuePtr);
          uint64_t v16 = fprintf(a1, "(Short) %hd");
          break;
        case kCFNumberIntType:
          CFNumberGetValue((CFNumberRef)a2, kCFNumberIntType, &valuePtr);
          uint64_t v16 = fprintf(a1, "(Int) %d");
          break;
        case kCFNumberLongType:
          CFNumberGetValue((CFNumberRef)a2, kCFNumberLongType, &valuePtr);
          uint64_t v16 = fprintf(a1, "(Long) %ld");
          break;
        case kCFNumberLongLongType:
          CFNumberGetValue((CFNumberRef)a2, kCFNumberLongLongType, &valuePtr);
          uint64_t v16 = fprintf(a1, "(LongLong) %lld");
          break;
        case kCFNumberFloatType:
          CFNumberGetValue((CFNumberRef)a2, kCFNumberFloatType, &valuePtr);
          uint64_t v16 = fprintf(a1, "(Float) %f");
          break;
        case kCFNumberDoubleType:
          CFNumberGetValue((CFNumberRef)a2, kCFNumberDoubleType, &valuePtr);
          uint64_t v16 = fprintf(a1, "(Double) %lf");
          break;
        case kCFNumberCFIndexType:
          CFNumberGetValue((CFNumberRef)a2, kCFNumberCFIndexType, &valuePtr);
          uint64_t v16 = fprintf(a1, "(CFIndex) %ld");
          break;
        default:
          goto LABEL_19;
      }

      return v16;
    }

LABEL_19:
    CFStringRef v8 = CFCopyDescription(a2);
    if (!v8) {
      return 0LL;
    }
    goto LABEL_20;
  }

  if (CFBooleanGetValue((CFBooleanRef)a2)) {
    return fprintf(a1, "True");
  }
  else {
    return fprintf(a1, "False");
  }
}
}

  return v9;
}

uint64_t xprint_cfobject_dictionary(const __CFString *cf, const __CFString *a2, uint64_t a3)
{
  if (cf)
  {
    CFTypeID v6 = CFGetTypeID(cf);
    if (v6 == CFStringGetTypeID())
    {
      v21.length = CFStringGetLength(cf);
      v21.location = 0LL;
      if (CFStringFindWithOptions(cf, @"password", v21, 1uLL, 0LL)) {
        a2 = @"<hidden>";
      }
    }
  }

  int v7 = *(_DWORD *)(a3 + 4);
  if (v7 >= 80) {
    int v7 = 80;
  }
  *(void *)(a3 + 16) += 4LL
                        * fprintf( *(FILE **)(a3 + 8),  "%.*s",  v7,  "                                                                                ");
  if (a2 && ((CFTypeID v8 = CFGetTypeID(a2), v8 == CFDictionaryGetTypeID()) || (v9 = CFGetTypeID(a2), v9 == CFArrayGetTypeID())))
  {
    int v10 = xprint_cfobject_leaf(*(FILE **)(a3 + 8), cf);
    uint64_t v11 = *(FILE **)(a3 + 8);
    *(void *)(a3 + 16) += 4LL * v10;
    int v12 = fprintf(v11, "\n");
    uint64_t v13 = *(void *)(a3 + 8);
    *(void *)(a3 + 16) += 4LL * v12;
    uint64_t result = xprint_cfobject_container(v13, *(_DWORD *)(a3 + 4) + 2, a2);
  }

  else
  {
    int v15 = xprint_cfobject_leaf(*(FILE **)(a3 + 8), cf);
    uint64_t v16 = *(FILE **)(a3 + 8);
    *(void *)(a3 + 16) += 4LL * v15;
    int v17 = fprintf(v16, " : ");
    v18 = *(FILE **)(a3 + 8);
    *(void *)(a3 + 16) += 4LL * v17;
    int v19 = xprint_cfobject_leaf(v18, a2);
    v20 = *(FILE **)(a3 + 8);
    *(void *)(a3 + 16) += 4LL * v19;
    uint64_t result = fprintf(v20, "\n");
  }

  *(void *)(a3 + 16) += 4LL * (int)result;
  return result;
}

uint64_t xprint_cfobject_array(const __CFString *a1, int *a2)
{
  int v5 = *a2;
  int v4 = a2[1];
  ++*a2;
  if (v4 >= 80) {
    int v4 = 80;
  }
  *((void *)a2 + 2) += 4LL
                       * fprintf( *((FILE **)a2 + 1),  "%.*s",  v4,  "                                                                                ");
  if (a1 && ((CFTypeID v6 = CFGetTypeID(a1), v6 == CFDictionaryGetTypeID()) || (v7 = CFGetTypeID(a1), v7 == CFArrayGetTypeID())))
  {
    int v8 = fprintf(*((FILE **)a2 + 1), "%d\n", v5);
    uint64_t v9 = *((void *)a2 + 1);
    *((void *)a2 + 2) += 4LL * v8;
    uint64_t result = xprint_cfobject_container(v9, a2[1] + 2, a1);
  }

  else
  {
    int v11 = fprintf(*((FILE **)a2 + 1), "%d : ", v5);
    int v12 = (FILE *)*((void *)a2 + 1);
    *((void *)a2 + 2) += 4LL * v11;
    int v13 = xprint_cfobject_leaf(v12, a1);
    uint64_t v14 = (FILE *)*((void *)a2 + 1);
    *((void *)a2 + 2) += 4LL * v13;
    uint64_t result = fprintf(v14, "\n");
  }

  *((void *)a2 + 2) += 4LL * (int)result;
  return result;
}

void sub_187FF8AA4( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
}

void sub_187FF8F44( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

void sub_187FF9100(_Unwind_Exception *a1)
{
}

LABEL_34:
}

void sub_187FF96C8( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

LABEL_10:
  return v5;
}

  -[NWStatisticsManager _internalSources](self, "_internalSources");
  int v11 = (void *)objc_claimAutoreleasedReturnValue();
  [v11 removeObjectForKey:v6];

  ++self->_numSourcesRemoved;
  -[NWStatisticsManager delegate](self, "delegate");
  int v12 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[NWStatisticsManager clientQueue](self, "clientQueue");
    int v13 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1895F87A8];
    v14[1] = 3221225472LL;
    v14[2] = __57__NWStatisticsManager_removeSourceInternal_isFromClient___block_invoke;
    v14[3] = &unk_18A1B6330;
    v14[4] = self;
    int v15 = v8;
    dispatch_async(v13, v14);
  }

LABEL_13:
}

LABEL_21:
LABEL_22:
    int v11 = 0LL;
    return v11;
  }

  if ((_DWORD)v16 != 10006)
  {
    if ((_DWORD)v16 == 2)
    {
      NStatGetLog();
      CFTypeID v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
        -[NWSRouteSnapshotter snapshot].cold.5(v7);
      }
    }

    else
    {
      NStatGetLog();
      CFTypeID v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        -[NWSRouteSnapshotter snapshot].cold.3();
      }
    }

    goto LABEL_21;
  }

  int v10 = v17;
  if (v10 != -[NWSSnapshotter kernelSourceRef](self, "kernelSourceRef"))
  {
    NStatGetLog();
    int v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[NWSRouteSnapshotter snapshot].cold.4((uint64_t *)&v17, self, v13);
    }

    goto LABEL_22;
  }

  int v11 = -[NWSRouteSnapshot initWithCounts:routeDescriptor:sourceIdent:seqno:]( objc_alloc(&OBJC_CLASS___NWSRouteSnapshot),  "initWithCounts:routeDescriptor:sourceIdent:seqno:",  &v18,  v19,  -[NWSSnapshotter kernelSourceRef](self, "kernelSourceRef"),  0LL);
  return v11;
}

  objc_sync_exit(v8);
}

void OUTLINED_FUNCTION_0( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

  ;
}

void OUTLINED_FUNCTION_3(void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
}

  ;
}

void OUTLINED_FUNCTION_5( void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

void OUTLINED_FUNCTION_7( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

void OUTLINED_FUNCTION_8( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

  ;
}

  ;
}

  ;
}

LABEL_9:
    }
  }

  objc_sync_exit(v8);
}

void sub_187FFCEC4(_Unwind_Exception *a1)
{
}

LABEL_15:
      p_var3 += 10;
      if (!--v6)
      {
        if ([v7 count])
        {
          -[NWStatisticsManager clientQueue](self, "clientQueue");
          uint64_t v14 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
          v16[0] = MEMORY[0x1895F87A8];
          v16[1] = 3221225472LL;
          v16[2] = __53__NWStatisticsManager_handleSystemInformationCounts___block_invoke;
          v16[3] = &unk_18A1B6330;
          v16[4] = self;
          int v17 = v7;
          int v15 = v7;
          dispatch_async(v14, v16);
        }

        else
        {
        }

        goto LABEL_19;
      }
    }

    int v12 = [MEMORY[0x189607968] numberWithLongLong:*((void *)p_var3 - 3)];
    goto LABEL_12;
  }

  if (!v16)
  {
    HIDWORD(v30) = 0;
    uint64_t v16 = @"UnknownProcess";
    if (!v15) {
      goto LABEL_18;
    }
    goto LABEL_17;
  }

  [v3 setObject:v40 forKeyedSubscript:@"update"];
  return v3;
}

LABEL_63:
      return;
    case 0x2715u:
      if ((unint64_t)a4 < 0x1C)
      {
        NStatGetLog();
        v37 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 134218240;
          v59 = self;
          v60 = 2048;
          *(void *)v61 = a4;
          _os_log_impl( &dword_187FF5000,  v37,  OS_LOG_TYPE_ERROR,  "Manager %p: Received message too short SYSINFO_COUNTS length %zd could not read nstat_sysinfo_len",  buf,  0x16u);
        }

        if ((-[NWStatisticsManager mgrflags](self, "mgrflags") & 0x80) != 0) {
          NStatMgrTraceF( self,  "%s Manager %p: Received message too short SYSINFO_COUNTS length %zd could not read nstat_sysinfo_len",  v38,  v39,  v40,  v41,  v42,  v43,  (char)"-[NWStatisticsManager handleMessage:length:]");
        }
      }

      else
      {
        p_type = &a3[1].type;
        if ((unint64_t)a3[1].type + 24 <= a4)
        {
          -[NWStatisticsManager handleSystemInformationCounts:](self, "handleSystemInformationCounts:", &a3[1].type);
        }

        else
        {
          NStatGetLog();
          __int128 v28 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
          {
            __int128 v29 = *p_type + 24LL;
            *(_DWORD *)buf = 134218496;
            v59 = self;
            v60 = 2048;
            *(void *)v61 = a4;
            *(_WORD *)&v61[8] = 2048;
            *(void *)&v61[10] = v29;
            _os_log_impl( &dword_187FF5000,  v28,  OS_LOG_TYPE_ERROR,  "Manager %p: Received message too short SYSINFO_COUNTS length %zd < %zd",  buf,  0x20u);
          }

          if ((-[NWStatisticsManager mgrflags](self, "mgrflags") & 0x80) != 0) {
            NStatMgrTraceF( self,  "%s Manager %p: Received message too short SYSINFO_COUNTS length %zd < %zd",  v30,  v31,  v32,  v33,  v34,  v35,  (char)"-[NWStatisticsManager handleMessage:length:]");
          }
        }
      }

      return;
    default:
      if (type == 1)
      {
        if ((unint64_t)a4 < 0x28)
        {
          NStatGetLog();
          v36 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG)) {
            -[NWStatisticsManager handleMessage:length:].cold.1((uint64_t)a3, v36);
          }
        }

        else
        {
          if ((-[NWStatisticsManager mgrflags](self, "mgrflags") & 0x10) != 0)
          {
            NStatGetLog();
            int v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
            {
              uint64_t v14 = a3[1].context;
              int v15 = *(void *)&a3[1].type;
              uint64_t v16 = a3[2].context;
              int v17 = msgTypeToString(v16);
              v18 = WORD2(a3[2].context);
              context_high = HIWORD(a3[2].context);
              else {
                v20 = *(void *)&a3[2].type;
              }
              *(_DWORD *)buf = 134219778;
              v59 = self;
              v60 = 1024;
              *(_DWORD *)v61 = v14;
              *(_WORD *)&v61[4] = 2048;
              *(void *)&v61[6] = v15;
              *(_WORD *)&v61[14] = 1024;
              *(_DWORD *)&v61[16] = v16;
              v62 = 2080;
              v63 = v17;
              v64 = 1024;
              v65 = v18;
              v66 = 1024;
              v67 = context_high;
              v68 = 2048;
              v69 = v20;
              _os_log_impl( &dword_187FF5000,  v13,  OS_LOG_TYPE_DEBUG,  "Manager %p: error: %d hdr {0x%lld, %d (%s) %d, 0x%x} srcref %lld}",  buf,  0x42u);
            }
          }

          if ((-[NWStatisticsManager mgrflags](self, "mgrflags") & 0x80) != 0)
          {
            msgTypeToString(a3[2].context);
            NStatMgrTraceF( self,  "%s Manager %p: error: %d hdr {0x%lld, %d (%s) %d, 0x%x} srcref %lld}",  v51,  v52,  v53,  v54,  v55,  v56,  (char)"-[NWStatisticsManager handleMessage:length:]");
          }
        }
      }

      return;
  }

void sub_187FFF060( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
}

void sub_187FFF4BC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

void sub_187FFFA18(_Unwind_Exception *a1)
{
}

void sub_188000AF8( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_188000CC0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void __Block_byref_object_dispose__0(uint64_t a1)
{
}

LABEL_14:
  return v8;
}

void OUTLINED_FUNCTION_0_0( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

uint64_t maskLeadingBitsCount(unsigned __int8 *a1)
{
  int v1 = a1[1];
  if (v1 == 30)
  {
    id v2 = a1 + 8;
    uint64_t v3 = 16LL;
  }

  else
  {
    if (v1 != 2) {
      return 0LL;
    }
    id v2 = a1 + 4;
    uint64_t v3 = 4LL;
  }

  uint64_t result = 0LL;
  uint64_t v5 = 8 * v3;
  while (1)
  {
    int v7 = *v2++;
    int v6 = v7;
    if (v7 != 255) {
      break;
    }
    result += 8LL;
    if (v5 == result) {
      return result;
    }
  }

  if (v6 <= 239)
  {
    switch(v6)
    {
      case 128:
        ++result;
        break;
      case 192:
        result += 2LL;
        break;
      case 224:
        result += 3LL;
        break;
    }
  }

  else if (v6 > 251)
  {
    if (v6 == 254)
    {
      result += 7LL;
    }

    else if (v6 == 252)
    {
      result += 6LL;
    }
  }

  else if (v6 == 240)
  {
    result += 4LL;
  }

  else if (v6 == 248)
  {
    result += 5LL;
  }

  return result;
}

LABEL_18:
    LOBYTE(v2_Block_object_dispose(va, 8) = 0;
    return v28;
  }

  v26 = self;
  objc_sync_enter(v26);
  id v27 = -[NWStatisticsSource _handleDescriptor:length:events:]( v26,  "_handleDescriptor:length:events:",  &a3[9].type,  a4 - 152,  *(void *)&a3[1].type);
  __int128 v28 = -[NWStatisticsSource handleCounts:](v26, "handleCounts:", &a3[2]) || v27;
LABEL_17:
  objc_sync_exit(self);

  return v28;
}
}

void sub_1880026E4(_Unwind_Exception *a1)
{
}

void sub_188002F1C(_Unwind_Exception *a1)
{
}

LABEL_12:
    int v7 = 0LL;
  }

  objc_sync_exit(v7);

  return v12;
}
  }

  return v5;
}

LABEL_13:
  return v7;
}

      objc_sync_exit(v11);
      objc_autoreleasePoolPop(v10);
      if (!a4) {
        goto LABEL_9;
      }
      goto LABEL_8;
    }
  }

  uint64_t v14 = 0;
  int v13 = 0LL;
  if (a4) {
LABEL_8:
  }
    *a4 = v14;
LABEL_9:

  return v13;
}

void sub_188005FE0(_Unwind_Exception *a1)
{
}

void sub_1880062AC(_Unwind_Exception *a1)
{
}

void sub_188006530(_Unwind_Exception *a1)
{
}

LABEL_17:
LABEL_19:
          [v10 setObject:v13 forKeyedSubscript:@"procName"];
          [MEMORY[0x189603F50] date];
          int v17 = (void *)objc_claimAutoreleasedReturnValue();
          [v10 setObject:v17 forKeyedSubscript:@"timestamp"];

          -[NSMutableDictionary setObject:forKeyedSubscript:]( v8->_uuidProcessNameMap,  "setObject:forKeyedSubscript:",  v10,  v6);
LABEL_20:

          goto LABEL_21;
        }
      }

      int v13 = (os_log_s *)v11;
      goto LABEL_19;
    }
  }

  else
  {
    objc_storeStrong((id *)&v8->_niluuidProcessName, a4);
  }

  v40 = [v76 objectForKeyedSubscript:@"uuid"];
  if (v40)
  {
    v41 = (void *)v40;
    [v76 objectForKeyedSubscript:@"uuid"];
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v43 = objc_opt_isKindOfClass();

    if ((v43 & 1) != 0)
    {
      v44 = objc_alloc(MEMORY[0x189607AB8]);
      [v76 objectForKeyedSubscript:@"uuid"];
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = (void *)[v44 initWithUUIDString:v45];

      if (v46) {
        [v46 getUUIDBytes:a3->uuid];
      }
    }
  }

  v47 = [v76 objectForKeyedSubscript:@"euuid"];
  if (v47)
  {
    v48 = (void *)v47;
    [v76 objectForKeyedSubscript:@"euuid"];
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v50 = objc_opt_isKindOfClass();

    if ((v50 & 1) != 0)
    {
      v51 = objc_alloc(MEMORY[0x189607AB8]);
      [v76 objectForKeyedSubscript:@"euuid"];
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      v53 = (void *)[v51 initWithUUIDString:v52];

      if (v53) {
        [v53 getUUIDBytes:a3->euuid];
      }
    }
  }

  v54 = [v76 objectForKeyedSubscript:@"vuuid"];
  if (v54)
  {
    v55 = (void *)v54;
    [v76 objectForKeyedSubscript:@"vuuid"];
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v57 = objc_opt_isKindOfClass();

    if ((v57 & 1) != 0)
    {
      v58 = objc_alloc(MEMORY[0x189607AB8]);
      [v76 objectForKeyedSubscript:@"vuuid"];
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      v60 = (void *)[v58 initWithUUIDString:v59];

      if (v60) {
        [v60 getUUIDBytes:a3->vuuid];
      }
    }
  }

  v61 = [v76 objectForKeyedSubscript:@"fuuid"];
  if (v61)
  {
    v62 = (void *)v61;
    [v76 objectForKeyedSubscript:@"fuuid"];
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v64 = objc_opt_isKindOfClass();

    if ((v64 & 1) != 0)
    {
      v65 = objc_alloc(MEMORY[0x189607AB8]);
      [v76 objectForKeyedSubscript:@"fuuid"];
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      v67 = (void *)[v65 initWithUUIDString:v66];

      if (v67) {
        [v67 getUUIDBytes:a3->fuuid];
      }
    }
  }

  [v76 objectForKeyedSubscript:@"ifnet_properties"];
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  a3->ifnet_properties = [v68 unsignedShortValue];

  [v76 objectForKeyedSubscript:@"probe_activated"];
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  a3->var0.__pad_connstatus[0] = a3->var0.__pad_connstatus[0] & 0xFE | [v69 BOOLValue];

  [v76 objectForKeyedSubscript:@"write_probe_failed"];
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  else {
    v71 = 0;
  }
  a3->var0.__pad_connstatus[0] = a3->var0.__pad_connstatus[0] & 0xFD | v71;

  [v76 objectForKeyedSubscript:@"read_probe_failed"];
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  else {
    v73 = 0;
  }
  a3->var0.__pad_connstatus[0] = a3->var0.__pad_connstatus[0] & 0xFB | v73;

  [v76 objectForKeyedSubscript:@"conn_probe_failed"];
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  else {
    v75 = 0;
  }
  a3->var0.__pad_connstatus[0] = a3->var0.__pad_connstatus[0] & 0xF7 | v75;
}

  v40 = [v76 objectForKeyedSubscript:@"uuid"];
  if (v40)
  {
    v41 = (void *)v40;
    [v76 objectForKeyedSubscript:@"uuid"];
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v43 = objc_opt_isKindOfClass();

    if ((v43 & 1) != 0)
    {
      v44 = objc_alloc(MEMORY[0x189607AB8]);
      [v76 objectForKeyedSubscript:@"uuid"];
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = (void *)[v44 initWithUUIDString:v45];

      if (v46) {
        [v46 getUUIDBytes:a3->uuid];
      }
    }
  }

  v47 = [v76 objectForKeyedSubscript:@"euuid"];
  if (v47)
  {
    v48 = (void *)v47;
    [v76 objectForKeyedSubscript:@"euuid"];
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v50 = objc_opt_isKindOfClass();

    if ((v50 & 1) != 0)
    {
      v51 = objc_alloc(MEMORY[0x189607AB8]);
      [v76 objectForKeyedSubscript:@"euuid"];
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      v53 = (void *)[v51 initWithUUIDString:v52];

      if (v53) {
        [v53 getUUIDBytes:a3->euuid];
      }
    }
  }

  v54 = [v76 objectForKeyedSubscript:@"vuuid"];
  if (v54)
  {
    v55 = (void *)v54;
    [v76 objectForKeyedSubscript:@"vuuid"];
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v57 = objc_opt_isKindOfClass();

    if ((v57 & 1) != 0)
    {
      v58 = objc_alloc(MEMORY[0x189607AB8]);
      [v76 objectForKeyedSubscript:@"vuuid"];
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      v60 = (void *)[v58 initWithUUIDString:v59];

      if (v60) {
        [v60 getUUIDBytes:a3->vuuid];
      }
    }
  }

  v61 = [v76 objectForKeyedSubscript:@"fuuid"];
  if (v61)
  {
    v62 = (void *)v61;
    [v76 objectForKeyedSubscript:@"fuuid"];
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v64 = objc_opt_isKindOfClass();

    if ((v64 & 1) != 0)
    {
      v65 = objc_alloc(MEMORY[0x189607AB8]);
      [v76 objectForKeyedSubscript:@"fuuid"];
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      v67 = (void *)[v65 initWithUUIDString:v66];

      if (v67) {
        [v67 getUUIDBytes:a3->fuuid];
      }
    }
  }

  [v76 objectForKeyedSubscript:@"ifnet_properties"];
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  a3->ifnet_properties = [v68 unsignedShortValue];

  [v76 objectForKeyedSubscript:@"probe_activated"];
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  a3->var0.__pad_connstatus[0] = a3->var0.__pad_connstatus[0] & 0xFE | [v69 BOOLValue];

  [v76 objectForKeyedSubscript:@"write_probe_failed"];
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  else {
    v71 = 0;
  }
  a3->var0.__pad_connstatus[0] = a3->var0.__pad_connstatus[0] & 0xFD | v71;

  [v76 objectForKeyedSubscript:@"read_probe_failed"];
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  else {
    v73 = 0;
  }
  a3->var0.__pad_connstatus[0] = a3->var0.__pad_connstatus[0] & 0xFB | v73;

  [v76 objectForKeyedSubscript:@"conn_probe_failed"];
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  else {
    v75 = 0;
  }
  a3->var0.__pad_connstatus[0] = a3->var0.__pad_connstatus[0] & 0xF7 | v75;
}

void sub_188006910(_Unwind_Exception *a1)
{
}

void sub_1880069C8(_Unwind_Exception *a1)
{
}

void sub_188007340(_Unwind_Exception *a1)
{
}

void sub_188007478(_Unwind_Exception *a1)
{
}

void sub_188007514(_Unwind_Exception *a1)
{
}

LABEL_7:
  int v6 = self->_hasExplicitUDPSubFlows && self->_explicitUDPSubFlowsValue;
  if (self->_hasExplicitQUIC)
  {
    explicitQUICValue = self->_explicitQUICValue;
    goto LABEL_29;
  }

  if (self->_hasExplicitTCP) {
    int v8 = 1;
  }
  else {
    int v8 = v5;
  }
  if ((v8 & 1) != 0) {
    goto LABEL_16;
  }
  if (!self->_hasExplicitSockets)
  {
    if (self->_hasExplicitUDPSubFlows)
    {
LABEL_16:
      explicitQUICValue = 0;
      goto LABEL_29;
    }

    goto LABEL_28;
  }

  explicitQUICValue = 0;
  if (!self->_hasExplicitUDPSubFlows && self->_hasExplicitChannels) {
LABEL_28:
  }
    explicitQUICValue = !self->_hasExplicitUserlandConnections;
LABEL_29:
  hasExplicitUserlandConnections = self->_hasExplicitUserlandConnections;
  if (hasExplicitUserlandConnections) {
    hasExplicitUserlandConnections = self->_explicitUserlandConnectionsValue;
  }
  explicitSocketsValue = !self->_hasExplicitChannels;
  if (self->_hasExplicitChannels)
  {
    explicitChannelsValue = self->_explicitChannelsValue;
    if (!self->_hasExplicitSockets) {
      goto LABEL_34;
    }
    goto LABEL_33;
  }

  explicitChannelsValue = !self->_hasExplicitSockets;
  if (self->_hasExplicitSockets) {
LABEL_33:
  }
    explicitSocketsValue = self->_explicitSocketsValue;
LABEL_34:
  uint64_t result = 0;
  switch(a3)
  {
    case 2:
      uint64_t result = explicitTCPValue && explicitSocketsValue;
      break;
    case 3:
      uint64_t result = explicitTCPValue && explicitChannelsValue;
      break;
    case 4:
      uint64_t result = hasExplicitUDP && explicitSocketsValue;
      break;
    case 5:
      uint64_t result = hasExplicitUDP && explicitChannelsValue;
      break;
    case 8:
      uint64_t result = explicitQUICValue;
      break;
    case 9:
      uint64_t result = hasExplicitUserlandConnections;
      break;
    case 10:
      uint64_t result = v6;
      break;
    default:
      return result;
  }

  return result;
}

  NStatGetLog();
  uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( &dword_187FF5000,  v14,  OS_LOG_TYPE_ERROR,  "initialConfigure: unexpected class for kNWStatsParameterTargetSelector",  buf,  2u);
  }

  int v10 = 0LL;
  int v13 = 0LL;
  int v12 = 0LL;
  int v11 = 0LL;
  LODWORD(v74) = 1;
LABEL_10:
  objc_msgSend(v4, "objectForKeyedSubscript:", @"kNWStatsParameterTraceFD", v74);
  int v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    [v4 objectForKeyedSubscript:@"kNWStatsParameterTraceFD"];
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
    int v17 = [v16 intValue];

    if ((_DWORD)v17) {
      -[NWStatsManager _setInterfaceTraceFd:](self, "_setInterfaceTraceFd:", v17);
    }
  }

  v18 = v11 | 0x8000000000LL;
  [v4 objectForKeyedSubscript:@"kNWStatsSelectKnownInbound"];
  int v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    [v4 objectForKeyedSubscript:@"kNWStatsSelectKnownInbound"];
    v20 = (void *)objc_claimAutoreleasedReturnValue();
  }

  [v4 objectForKeyedSubscript:@"kNWStatsSelectKnownOutbound"];
  CFRange v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    [v4 objectForKeyedSubscript:@"kNWStatsSelectKnownOutbound"];
    v22 = (void *)objc_claimAutoreleasedReturnValue();
  }

  [v4 objectForKeyedSubscript:@"kNWStatsSelectKnownListener"];
  uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23)
  {
    [v4 objectForKeyedSubscript:@"kNWStatsSelectKnownListener"];
    v24 = (void *)objc_claimAutoreleasedReturnValue();
  }

  [v4 objectForKeyedSubscript:@"kNWStatsParameterNECPClientTLV"];
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (v25)
  {
    v18 |= 0x40000000000uLL;
    v12 |= 0x40000000000uLL;
    NStatGetLog();
    v26 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v81 = v18;
      _os_log_impl( &dword_187FF5000,  v26,  OS_LOG_TYPE_DEFAULT,  "initialConfigure set NSTAT_EXTENSION_FILTER_NECP_TLV, filter now 0x%llx",  buf,  0xCu);
    }
  }

  [v4 objectForKeyedSubscript:@"kNWStatsParameterNECPAncestralClientTLV"];
  id v27 = (void *)objc_claimAutoreleasedReturnValue();

  if (v27) {
    __int128 v28 = v12 | 0x80000000000LL;
  }
  else {
    __int128 v28 = v12;
  }
  [v4 objectForKeyedSubscript:@"kNWStatsSelectConnHasNetAccess"];
  __int128 v29 = (void *)objc_claimAutoreleasedReturnValue();

  if (v29)
  {
    [v4 objectForKeyedSubscript:@"kNWStatsSelectConnHasNetAccess"];
    __int128 v30 = (void *)objc_claimAutoreleasedReturnValue();
  }

  [v4 objectForKeyedSubscript:@"kNWStatsSelectTuneSkipNoChangeConnOnRefresh"];
  __int128 v31 = (void *)objc_claimAutoreleasedReturnValue();

  if (v31)
  {
    [v4 objectForKeyedSubscript:@"kNWStatsSelectTuneSkipNoChangeConnOnRefresh"];
    v32 = (void *)objc_claimAutoreleasedReturnValue();
  }

  [v4 objectForKeyedSubscript:@"kNWStatsTuneMaxConsecutiveReads"];
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  if (v33)
  {
    [v4 objectForKeyedSubscript:@"kNWStatsTuneMaxConsecutiveReads"];
    uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v35 = objc_opt_isKindOfClass();

    if ((v35 & 1) != 0)
    {
      [v4 objectForKeyedSubscript:@"kNWStatsTuneMaxConsecutiveReads"];
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      self->_consecutiveReadLimit = [v36 intValue];
    }
  }

  [v4 objectForKeyedSubscript:@"kNWStatsSelectTuneSkipNoChangeConnOnClose"];
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  if (v37)
  {
    [v4 objectForKeyedSubscript:@"kNWStatsSelectTuneSkipNoChangeConnOnClose"];
    v38 = (void *)objc_claimAutoreleasedReturnValue();
  }

  [v4 objectForKeyedSubscript:@"kNWStatsOptimizeFrequentRefresh"];
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  if (v39)
  {
    [v4 objectForKeyedSubscript:@"kNWStatsOptimizeFrequentRefresh"];
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    if ([v40 BOOLValue])
    {
      -[NWStatsManager setReadBufferSize:](self, "setReadBufferSize:", 0x4000LL);
      v18 |= 0x2000000000uLL;
    }
  }

  v41 = [v4 objectForKeyedSubscript:@"kNWStatsSelectHasTrafficDelta"];
  if (v41)
  {
    v42 = (void *)v41;
    [v4 objectForKeyedSubscript:@"kNWStatsSelectHasTrafficDelta"];
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v44 = objc_opt_isKindOfClass();

    if ((v44 & 1) != 0)
    {
      [v4 objectForKeyedSubscript:@"kNWStatsSelectHasTrafficDelta"];
      v45 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }

  [v4 objectForKeyedSubscript:@"kNWStatsParameterReportOpen"];
  v46 = (void *)objc_claimAutoreleasedReturnValue();

  if (v46)
  {
    [v4 objectForKeyedSubscript:@"kNWStatsParameterReportOpen"];
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = [v47 BOOLValue];
    self->_eagerInstantiate = v48;
    if (v48)
    {
      [v4 objectForKeyedSubscript:@"kNWStatsParameterExperiment"];
      v49 = (void *)objc_claimAutoreleasedReturnValue();

      if (v49)
      {
        [v4 objectForKeyedSubscript:@"kNWStatsParameterExperiment"];
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        if ([v50 BOOLValue])
        {
          v28 |= 0x200000uLL;
          v18 |= 0x200000uLL;
        }
      }
    }

    eagerInstantiate = self->_eagerInstantiate;
  }

  else
  {
    eagerInstantiate = 0;
    self->_eagerInstantiate = 0;
  }

  if (eagerInstantiate)
  {
    v52 = v18;
  }

  else
  {
    v28 |= 0x100000uLL;
    v52 = v18 | 0x100000;
  }

  [v4 objectForKeyedSubscript:@"kNWStatsParameterTrafficDeltaAdjustmentFactor"];
  v53 = (void *)objc_claimAutoreleasedReturnValue();

  if (v53)
  {
    [v4 objectForKeyedSubscript:@"kNWStatsParameterTrafficDeltaAdjustmentFactor"];
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v55 = objc_opt_isKindOfClass();

    if ((v55 & 1) != 0)
    {
      [v4 objectForKeyedSubscript:@"kNWStatsParameterTrafficDeltaAdjustmentFactor"];
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      [v56 doubleValue];
      self->_trafficDeltaAdjustmentFactor = v57;
    }
  }

  [v4 objectForKeyedSubscript:@"kNWStatsParameterCheckNESessionManagerVPNs"];
  v58 = (void *)objc_claimAutoreleasedReturnValue();

  if (v58)
  {
    [v4 objectForKeyedSubscript:@"kNWStatsParameterCheckNESessionManagerVPNs"];
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v60 = objc_opt_isKindOfClass();

    if ((v60 & 1) != 0)
    {
      [v4 objectForKeyedSubscript:@"kNWStatsParameterCheckNESessionManagerVPNs"];
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      self->_checkNESessionManagerVPNs = [v61 BOOLValue];
    }
  }

  v62 = -[NWStatsManager readBufferSize](self, "readBufferSize");
  self->_readBuffer = v63;
  v64 = (OS_dispatch_source *)dispatch_source_create( MEMORY[0x1895F8B60],  self->_sockfd,  0LL,  (dispatch_queue_t)self->_clientQueue);
  readSource = self->_readSource;
  self->_readSource = v64;

  v66 = self->_readSource;
  if (!v66)
  {
    close(self->_sockfd);
    v71 = 55;
    goto LABEL_97;
  }

  v67 = MEMORY[0x1895F87A8];
  handler[0] = MEMORY[0x1895F87A8];
  handler[1] = 3221225472LL;
  handler[2] = __35__NWStatsManager_initialConfigure___block_invoke;
  handler[3] = &unk_18A1B6358;
  handler[4] = self;
  dispatch_source_set_event_handler((dispatch_source_t)v66, handler);
  sockfd = self->_sockfd;
  v69 = self->_readSource;
  v77[0] = v67;
  v77[1] = 3221225472LL;
  v77[2] = __35__NWStatsManager_initialConfigure___block_invoke_2;
  v77[3] = &__block_descriptor_36_e5_v8__0l;
  v78 = sockfd;
  dispatch_source_set_cancel_handler((dispatch_source_t)v69, v77);
  dispatch_resume((dispatch_object_t)self->_readSource);
  -[NWStatsManager _sendUpdateRequestMessage:](self, "_sendUpdateRequestMessage:", -1LL);
  if ((v75 & 1) != 0)
  {
    -[NWStatsManager _addAllForProvider:filter:events:](self, "_addAllForProvider:filter:events:", 2LL, v52, v13);
    -[NWStatsManager _drainReadBuffer](self, "_drainReadBuffer");
    v70 = currentRcvBufSize;
  }

  else
  {
    v70 = currentRcvBufSize;
    if (-[NWStatsTargetSelector shouldAddProvider:](v10, "shouldAddProvider:", 2LL))
    {
      -[NWStatsManager _addAllForProvider:filter:events:](self, "_addAllForProvider:filter:events:", 2LL, v52, v13);
      -[NWStatsManager _drainReadBuffer](self, "_drainReadBuffer");
    }

    if (!-[NWStatsTargetSelector shouldAddProvider:](v10, "shouldAddProvider:", 4LL))
    {
LABEL_84:
      if (-[NWStatsTargetSelector shouldAddProvider:](v10, "shouldAddProvider:", 3LL))
      {
        -[NWStatsManager _addAllForProvider:filter:events:](self, "_addAllForProvider:filter:events:", 3LL, v52, v13);
        -[NWStatsManager _drainReadBuffer](self, "_drainReadBuffer");
      }

      if (!-[NWStatsTargetSelector shouldAddProvider:](v10, "shouldAddProvider:", 5LL)) {
        goto LABEL_88;
      }
      goto LABEL_87;
    }
  }

  -[NWStatsManager _addAllForProvider:filter:events:](self, "_addAllForProvider:filter:events:", 4LL, v52, v13);
  -[NWStatsManager _drainReadBuffer](self, "_drainReadBuffer");
  if ((v75 & 1) == 0) {
    goto LABEL_84;
  }
  -[NWStatsManager _addAllForProvider:filter:events:](self, "_addAllForProvider:filter:events:", 3LL, v52, v13);
  -[NWStatsManager _drainReadBuffer](self, "_drainReadBuffer");
LABEL_87:
  -[NWStatsManager _addAllForProvider:filter:events:](self, "_addAllForProvider:filter:events:", 5LL, v52, v13);
  -[NWStatsManager _drainReadBuffer](self, "_drainReadBuffer");
  if ((v75 & 1) != 0)
  {
LABEL_89:
    -[NWStatsManager _addAllForProvider:filter:events:](self, "_addAllForProvider:filter:events:", 8LL, v52, v13);
    -[NWStatsManager _drainReadBuffer](self, "_drainReadBuffer");
    goto LABEL_90;
  }

  if (a5 >= 0x65 && v9 > 16 * a3)
  {
    if ((self->_flags & 0x1000000) == 0)
    {
      int v10 = (void *)objc_msgSend( objc_alloc(NSString),  "initWithFormat:",  @"Possible flow anomaly, flow %lld has minimal average payload when packet counts %lld byte count %lld",  -[NWStatsProtocolSnapshot sourceIdentifier](self, "sourceIdentifier"),  a5,  a3);
      +[NWStatsProtocolSnapshot logFlowAnomaly:anomaly:]( &OBJC_CLASS___NWStatsProtocolSnapshot,  "logFlowAnomaly:anomaly:",  self,  v10);
      self->_flags |= 0x1000000u;
    }

    uint64_t v9 = -[NWStatsProtocolSnapshot _byteOverheadForPacketCount:](self, "_byteOverheadForPacketCount:", 100LL);
    if (16 * a3 > v9) {
      uint64_t v9 = 16 * a3;
    }
  }

  return v9 + a3;
}

LABEL_78:
      return;
    default:
      if (!type)
      {
        currentPollReference = self->_currentPollReference;
        if (currentPollReference)
        {
          if (currentPollReference == a3->context)
          {
            if ((a3->flags & 2) != 0 && self->_continuationCount <= 0x27)
            {
              -[NWStatsManager activePoll](self, "activePoll");
              int v13 = (void *)objc_claimAutoreleasedReturnValue();
              if (!v13) {
                -[NWStatsManager _handleMessage:length:].cold.1();
              }

              -[NWStatsManager activePoll](self, "activePoll");
              v54 = (id)objc_claimAutoreleasedReturnValue();
              -[NWStatsManager _restartPoll:](self, "_restartPoll:");
LABEL_106:
            }

            else
            {
              -[NWStatsManager _handleCompletion:](self, "_handleCompletion:");
            }
          }
        }
      }

      return;
  }

LABEL_20:
LABEL_21:
  return v17;
}

LABEL_88:
  if (-[NWStatsTargetSelector shouldAddProvider:](v10, "shouldAddProvider:", 8LL)) {
    goto LABEL_89;
  }
LABEL_90:
  if (-[NWStatsTargetSelector shouldAddProvider:](v10, "shouldAddProvider:", 10LL))
  {
    -[NWStatsManager _addAllForProvider:filter:events:](self, "_addAllForProvider:filter:events:", 10LL, v52, v13);
    -[NWStatsManager _drainReadBuffer](self, "_drainReadBuffer");
    v70 = (v70 + 0x8000);
  }

  if (-[NWStatsTargetSelector shouldAddProvider:](v10, "shouldAddProvider:", 9LL))
  {
    -[NWStatsManager _addAllForProvider:filter:events:]( self,  "_addAllForProvider:filter:events:",  9LL,  v28 | 0x120000000000LL,  v13);
    -[NWStatsManager _drainReadBuffer](self, "_drainReadBuffer");
    v70 = (v70 + 0x8000);
  }

  -[NWStatsManager setRcvBufsize:](self, "setRcvBufsize:", v70);
  -[NWStatsManager setConfigured:](self, "setConfigured:", 1LL);
  [v4 objectForKeyedSubscript:@"kNWStatsParameterThresholds"];
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  v71 = -[NWStatsManager _setThresholds:](self, "_setThresholds:", v72);

  if (self->_eagerInstantiate || self->_trafficDeltaAdjustmentFactor > 0.0)
  {
    v76[0] = v67;
    v76[1] = 3221225472LL;
    v76[2] = __35__NWStatsManager_initialConfigure___block_invoke_3;
    v76[3] = &unk_18A1B6358;
    v76[4] = self;
    -[NWStatsManager _refreshUsingBlock:completionBlock:](self, "_refreshUsingBlock:completionBlock:", 0LL, v76);
  }

LABEL_97:
  return v71;
}

LABEL_16:
  return v6;
}

  if (!v15) {
    goto LABEL_18;
  }
LABEL_17:
  if ([v14 isEqual:v15]) {
    goto LABEL_18;
  }
  v20 = -[NWStatsMonitor identifierForUUID:derivation:](self, "identifierForUUID:derivation:", v15, &v30);
  if (!v20)
  {
    if ((_DWORD)v10 == (_DWORD)v11
      || !(_DWORD)v10
      || !self->_useCoalitionIDs
      || !-[NWStatsEntityMapperCoalitionWatcher noteUUID:forPid:]( self->_coalitionUUIDMapper,  "noteUUID:forPid:",  v15,  v10)
      || (-[NWStatsEntityMapperCoalitionWatcher identifierForUUID:derivation:]( self->_coalitionUUIDMapper,  "identifierForUUID:derivation:",  v15,  &v30),  (v20 = (void *)objc_claimAutoreleasedReturnValue()) == 0LL))
    {
      CFRange v21 = (_DWORD)v10 == (_DWORD)v11 ? 0LL : v10;
      -[NWStatsMonitor noteFailedLookupFor:processName:pid:]( self,  "noteFailedLookupFor:processName:pid:",  v14,  0LL,  v21);
      v20 = -[NWStatsEntityMapperProcessWatcher identifierForUUID:derivation:]( self->_processWatcherUUIDMapper,  "identifierForUUID:derivation:",  v15,  &v30);
      if (!v20)
      {
        id v27 = -[NSSet count](self->_useNEHelperSet, "count");
        if (!a7
          || !v27
          || (useNEHelperSet = self->_useNEHelperSet,
              [NSString stringWithUTF8String:a7],
              __int128 v29 = (void *)objc_claimAutoreleasedReturnValue(),
              LODWORD(useNEHelperSet) = -[NSSet containsObject:](useNEHelperSet, "containsObject:", v29),
              v29,
              !(_DWORD)useNEHelperSet)
          || (-[NWStatsEntityMapperNEHelper identifierForUUID:derivation:]( self->_neHelperUUIDMapper,  "identifierForUUID:derivation:",  v15,  &v30),  (v20 = (void *)objc_claimAutoreleasedReturnValue()) == 0LL))
        {
LABEL_18:
          if (a8) {
            *a8 = HIDWORD(v30);
          }
          [NSString stringWithString:v16];
          int v19 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_44;
        }
      }
    }
  }

  appendProcNameSet = self->_appendProcNameSet;
  if (appendProcNameSet)
  {
    uint64_t v23 = -[NSSet count](appendProcNameSet, "count");
    if (a7)
    {
      if (v23)
      {
        [NSString stringWithUTF8String:a7];
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        if (v24 && -[NSSet containsObject:](self->_appendProcNameSet, "containsObject:", v24))
        {
          v25 = [v24 stringByAppendingFormat:@"/%@", v20];

          v20 = (void *)v25;
          if (!v25) {
            goto LABEL_18;
          }
        }

        else
        {
        }
      }
    }
  }

  if (a8) {
    *a8 = v30;
  }
  [NSString stringWithString:v20];
  int v19 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_44:
  return v19;
}

uint64_t attributionReasonImpliesBundleName(unsigned int a1)
{
  return (a1 < 6) & (0x2Eu >> a1);
}

BOOL attributionReasonImpliesProcessName(int a1)
{
  return (a1 & 0xFFFFFFFD) == 4;
}

CFStringRef attributionReasonString(unsigned int a1)
{
  if (a1 > 6) {
    return @"reason-unknown-type";
  }
  else {
    return *(&off_18A1B6908 + (int)a1);
  }
}

LABEL_11:
  v36 = v13;
  v37 = v12;
  v35 = (__CFString *)v15;
  if (v13 && ([v12 isEqual:v13] & 1) == 0)
  {
    __int128 v29 = v9;
    __int128 v30 = -[NWStatsEntityMapperDynamicLaunchServices identifierForUUID:derivation:]( self->_dynamicLaunchServicesUUIDMapper,  "identifierForUUID:derivation:",  v13,  0LL);
    -[NWStatsEntityMapperCoalitionWatcher identifierForUUID:derivation:]( self->_coalitionUUIDMapper,  "identifierForUUID:derivation:",  v13,  0LL);
    v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
    -[NWStatsEntityMapperNEHelper identifierForUUID:derivation:]( self->_neHelperUUIDMapper,  "identifierForUUID:derivation:",  v13,  0LL);
    int v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
    -[NWStatsEntityMapperProcessWatcher identifierForUUID:derivation:]( self->_processWatcherUUIDMapper,  "identifierForUUID:derivation:",  v13,  0LL);
    v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
    CFRange v21 = -[NWStatsEntityMapperStaticAssignment identifierForUUID:derivation:]( self->_staticAssignmentUUIDMapper,  "identifierForUUID:derivation:",  v13,  0LL);
    if ((_DWORD)v8 && !v18)
    {
      if ((_DWORD)v8 == v29
        || !-[NWStatsEntityMapperCoalitionWatcher noteUUID:forPid:]( self->_coalitionUUIDMapper,  "noteUUID:forPid:",  v13,  v8))
      {
        v18 = 0LL;
      }

      else
      {
        -[NWStatsEntityMapperCoalitionWatcher identifierForUUID:derivation:]( self->_coalitionUUIDMapper,  "identifierForUUID:derivation:",  v13,  0LL);
        v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
    }

    int v17 = (__CFString *)v30;
  }

  else
  {
    int v17 = 0LL;
    v18 = 0LL;
    int v19 = 0LL;
    v20 = 0LL;
    CFRange v21 = 0LL;
  }

  if (v33) {
    v22 = (const __CFString *)v33;
  }
  else {
    v22 = @"nil-Core-UUID";
  }
  uint64_t v34 = (__CFString *)v22;
  if (!v14) {
    uint64_t v14 = @"nil-Coal-UUID";
  }
  if (v32) {
    uint64_t v23 = (__CFString *)v32;
  }
  else {
    uint64_t v23 = @"nil-NE-UUID";
  }
  if (v31) {
    v24 = (__CFString *)v31;
  }
  else {
    v24 = @"nil-static-UUID";
  }
  v38[0] = @"kNWStatsLookupUUIDCoreServices";
  v38[1] = @"kNWStatsLookupUUIDStatic";
  if (v17) {
    v25 = v17;
  }
  else {
    v25 = @"nil-Core-EUUID";
  }
  v39[0] = v22;
  v39[1] = v24;
  v38[2] = @"kNWStatsLookupUUIDNEHelper";
  v38[3] = @"kNWStatsLookupUUIDCoalitionID";
  v39[2] = v23;
  v39[3] = v14;
  v38[4] = @"kNWStatsLookupUUIDProcessName";
  v38[5] = @"kNWStatsLookupEUUIDCoreServices";
  if (!v18) {
    v18 = @"nil-Coal-EUUID";
  }
  v39[4] = v35;
  v39[5] = v25;
  v38[6] = @"kNWStatsLookupEUUIDStatic";
  v38[7] = @"kNWStatsLookupEUUIDNEHelper";
  if (!v19) {
    int v19 = @"nil-NE-EUUID";
  }
  if (!v20) {
    v20 = @"nil-Proc-EUUID";
  }
  if (v21) {
    v26 = (__CFString *)v21;
  }
  else {
    v26 = @"nil-static-EUUID";
  }
  v39[6] = v26;
  v39[7] = v19;
  v38[8] = @"kNWStatsLookupEUUIDCoalitionID";
  v38[9] = @"kNWStatsLookupEUUIDProcessName";
  v39[8] = v18;
  v39[9] = v20;
  [MEMORY[0x189603F68] dictionaryWithObjects:v39 forKeys:v38 count:10];
  id v27 = (void *)objc_claimAutoreleasedReturnValue();

  return v27;
}

LABEL_47:
      __break(1u);
      return;
    }
  }

      __break(1u);
      return;
    }
  }

LABEL_22:
        int v4 = 0LL;
      }
    }

    else
    {
      int v10 = 0LL;
      int v8 = 0LL;
      int v7 = 0LL;
    }
  }

  else
  {
    int v10 = 0LL;
    int v8 = 0LL;
    int v7 = 0LL;
    int v6 = 0LL;
  }

LABEL_23:
  int v15 = v4;
  return v15;
}

__CFString *sockaddrForLogging(const sockaddr *a1)
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  if (!a1 || getnameinfo(a1, a1->sa_len, v3, 0x39u, v2, 6u, 10)) {
    return @"?";
  }
  v3[56] = 0;
  v2[5] = 0;
  return (__CFString *)(id)objc_msgSend( objc_alloc(NSString),  "initWithFormat:",  @"%s:%s",  v3,  v2);
}

BOOL sockaddrsHavePortDiffOnly(uint64_t a1, uint64_t a2)
{
  int v2 = *(unsigned __int8 *)(a1 + 1);
  if (v2 == 30)
  {
    if (*(void *)(a1 + 8) != *(void *)(a2 + 8) || *(void *)(a1 + 16) != *(void *)(a2 + 16)) {
      return 0LL;
    }
  }

  else if (v2 != 2 || *(_DWORD *)(a1 + 4) != *(_DWORD *)(a2 + 4))
  {
    return 0LL;
  }

  return *(unsigned __int16 *)(a1 + 2) != *(unsigned __int16 *)(a2 + 2);
}

LABEL_29:
  v57 = self->_descriptor.ifnet_properties;
  if ((v57 & 0x200) == 0)
  {
    if ((v57 & 0x40) == 0) {
      goto LABEL_31;
    }
LABEL_40:
    [v4 setObject:MEMORY[0x189604A88] forKeyedSubscript:kNStatSrcKeyInterfaceIsExpensive];
    if ((self->_descriptor.ifnet_properties & 0x20) == 0) {
      goto LABEL_33;
    }
    goto LABEL_32;
  }

  [v4 setObject:MEMORY[0x189604A88] forKeyedSubscript:kNStatSrcKeyInterfaceTypeCompanionLink];
  v57 = self->_descriptor.ifnet_properties;
  if ((v57 & 0x40) != 0) {
    goto LABEL_40;
  }
LABEL_31:
  if ((v57 & 0x20) != 0) {
LABEL_32:
  }
    [v4 setObject:MEMORY[0x189604A88] forKeyedSubscript:kNStatSrcKeyInterfaceIsAWDL];
LABEL_33:
  [MEMORY[0x189607968] numberWithUnsignedInt:self->_descriptor.var0.__pad_connstatus[0] & 1];
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 setObject:v58 forKeyedSubscript:kNStatSrcKeyProbeActivated];

  [MEMORY[0x189607968] numberWithUnsignedInt:(self->_descriptor.var0.__pad_connstatus[0] >> 3) & 1];
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 setObject:v59 forKeyedSubscript:kNStatSrcKeyConnProbeFailed];

  [MEMORY[0x189607968] numberWithUnsignedInt:(self->_descriptor.var0.__pad_connstatus[0] >> 2) & 1];
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 setObject:v60 forKeyedSubscript:kNStatSrcKeyReadProbeFailed];

  [MEMORY[0x189607968] numberWithUnsignedInt:(self->_descriptor.var0.__pad_connstatus[0] >> 1) & 1];
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 setObject:v61 forKeyedSubscript:kNStatSrcKeyWriteProbeFailed];

  if (-[NWSTCPSnapshot countsIncludeHeaderOverhead](self, "countsIncludeHeaderOverhead")) {
    [v4 setObject:MEMORY[0x189604A88] forKeyedSubscript:kNStatSrcKeyChannelArchitecture];
  }
  if (self->_eventFlags)
  {
    objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedLongLong:");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 setObject:v62 forKeyedSubscript:kNStatSrcKeyEventFlags];
  }

  [MEMORY[0x189607968] numberWithUnsignedLongLong:p_descriptor->start_timestamp];
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 setObject:v63 forKeyedSubscript:kNStatSrcKeyStartAbsoluteTime];

  [MEMORY[0x189607968] numberWithUnsignedLongLong:p_descriptor->timestamp - p_descriptor->start_timestamp];
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 setObject:v64 forKeyedSubscript:kNStatSrcKeyDurationAbsoluteTime];

  v65 = v4;
LABEL_38:

  return v4;
}

LABEL_25:
  v45 = self->_descriptor.ifnet_properties;
  if ((v45 & 0x200) == 0)
  {
    if ((v45 & 0x40) == 0) {
      goto LABEL_27;
    }
LABEL_36:
    [v4 setObject:MEMORY[0x189604A88] forKeyedSubscript:kNStatSrcKeyInterfaceIsExpensive];
    if ((self->_descriptor.ifnet_properties & 0x20) == 0) {
      goto LABEL_29;
    }
    goto LABEL_28;
  }

  [v4 setObject:MEMORY[0x189604A88] forKeyedSubscript:kNStatSrcKeyInterfaceTypeCompanionLink];
  v45 = self->_descriptor.ifnet_properties;
  if ((v45 & 0x40) != 0) {
    goto LABEL_36;
  }
LABEL_27:
  if ((v45 & 0x20) != 0) {
LABEL_28:
  }
    [v4 setObject:MEMORY[0x189604A88] forKeyedSubscript:kNStatSrcKeyInterfaceIsAWDL];
LABEL_29:
  if (-[NWSUDPSnapshot countsIncludeHeaderOverhead](self, "countsIncludeHeaderOverhead")) {
    [v4 setObject:MEMORY[0x189604A88] forKeyedSubscript:kNStatSrcKeyChannelArchitecture];
  }
  if (self->_eventFlags)
  {
    objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedLongLong:");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 setObject:v46 forKeyedSubscript:kNStatSrcKeyEventFlags];
  }

  [MEMORY[0x189607968] numberWithUnsignedLongLong:p_descriptor->start_timestamp];
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 setObject:v47 forKeyedSubscript:kNStatSrcKeyStartAbsoluteTime];

  [MEMORY[0x189607968] numberWithUnsignedLongLong:p_descriptor->timestamp - p_descriptor->start_timestamp];
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 setObject:v48 forKeyedSubscript:kNStatSrcKeyDurationAbsoluteTime];

  v49 = v4;
LABEL_34:

  return v4;
}

  v45 = self->_descriptor.ifnet_properties;
  if ((v45 & 0x200) == 0)
  {
    if ((v45 & 0x40) == 0) {
      goto LABEL_27;
    }
LABEL_36:
    [v4 setObject:MEMORY[0x189604A88] forKeyedSubscript:kNStatSrcKeyInterfaceIsExpensive];
    if ((self->_descriptor.ifnet_properties & 0x20) == 0) {
      goto LABEL_29;
    }
    goto LABEL_28;
  }

  [v4 setObject:MEMORY[0x189604A88] forKeyedSubscript:kNStatSrcKeyInterfaceTypeCompanionLink];
  v45 = self->_descriptor.ifnet_properties;
  if ((v45 & 0x40) != 0) {
    goto LABEL_36;
  }
LABEL_27:
  if ((v45 & 0x20) != 0) {
LABEL_28:
  }
    [v4 setObject:MEMORY[0x189604A88] forKeyedSubscript:kNStatSrcKeyInterfaceIsAWDL];
LABEL_29:
  if (-[NWSQUICSnapshot countsIncludeHeaderOverhead](self, "countsIncludeHeaderOverhead")) {
    [v4 setObject:MEMORY[0x189604A88] forKeyedSubscript:kNStatSrcKeyChannelArchitecture];
  }
  if (self->_eventFlags)
  {
    objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedLongLong:");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 setObject:v46 forKeyedSubscript:kNStatSrcKeyEventFlags];
  }

  [MEMORY[0x189607968] numberWithUnsignedLongLong:p_descriptor->start_timestamp];
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 setObject:v47 forKeyedSubscript:kNStatSrcKeyStartAbsoluteTime];

  [MEMORY[0x189607968] numberWithUnsignedLongLong:p_descriptor->timestamp - p_descriptor->start_timestamp];
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 setObject:v48 forKeyedSubscript:kNStatSrcKeyDurationAbsoluteTime];

  v49 = v4;
LABEL_34:

  return v4;
}

id pid_to_process_name(int a1)
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  if (proc_pidinfo(a1, 13, 1uLL, buffer, 64) == 64)
  {
    __int128 v3 = v6;
    char v4 = 0;
    [NSString stringWithUTF8String:&v3];
    int v1 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    int v1 = 0LL;
  }

  return v1;
}

id pid_to_uuid_string(int a1)
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  if (proc_pidinfo(a1, 17, 1uLL, buffer, 56) == 56)
  {
    uuid_unparse_upper(buffer, out);
    [NSString stringWithUTF8String:out];
    int v1 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    int v1 = 0LL;
  }

  return v1;
}

id pid_to_uuid(int a1)
{
  v2[7] = *MEMORY[0x1895F89C0];
  if (proc_pidinfo(a1, 17, 1uLL, v2, 56) == 56) {
    return (id)[objc_alloc(MEMORY[0x189607AB8]) initWithUUIDBytes:v2];
  }
  else {
    return 0LL;
  }
}

BOOL pid_is_valid(int a1)
{
  uint64_t v3 = *MEMORY[0x1895F89C0];
  return proc_pidinfo(a1, 13, 1uLL, buffer, 64) == 64;
}

uint64_t uuid_to_pid(void *a1)
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  id v1 = a1;
  *(void *)int v13 = 0x600000001LL;
  size_t v9 = 4LL;
  if (sysctl(v13, 2u, &__count, &v9, 0LL, 0LL) < 0)
  {
    uint64_t v7 = 0xFFFFFFFFLL;
  }

  else
  {
    if (!__count || __count < 0 || (int v2 = calloc(__count, 4uLL)) == 0LL) {
      __break(1u);
    }
    uint64_t v3 = v2;
    [v1 getUUIDBytes:uu2];
    int v4 = proc_listallpids(v3, 4 * __count);
    if (v4 < 1)
    {
LABEL_10:
      uint64_t v7 = 0xFFFFFFFFLL;
    }

    else
    {
      uint64_t v5 = v4;
      __int128 v6 = (int *)v3;
      while (proc_pidinfo(*v6, 17, 1uLL, __count_4, 56) != 56 || uuid_compare(__count_4, uu2))
      {
        ++v6;
        if (!--v5) {
          goto LABEL_10;
        }
      }

      uint64_t v7 = *v6;
    }

    free(v3);
  }

  return v7;
}

uint64_t pid_to_coalitionid(int a1)
{
  if (proc_pidinfo(a1, 20, 1uLL, buffer, 40) == 40) {
    return buffer[0];
  }
  else {
    return 1LL;
  }
}

id pid_to_coalition_bundleid(int a1)
{
  if (proc_pidinfo(a1, 20, 1uLL, buffer, 40) == 40) {
    unint64_t v1 = buffer[0];
  }
  else {
    unint64_t v1 = 1LL;
  }
  if (v1 < 2)
  {
    int v4 = 0LL;
    return v4;
  }

  uint64_t v2 = xpc_coalition_copy_info();
  uint64_t v3 = (void *)v2;
  if (v2 && MEMORY[0x1895BB4D4](v2) == MEMORY[0x1895F9250])
  {
    string = xpc_dictionary_get_string(v3, (const char *)*MEMORY[0x1895F8708]);
    if (string)
    {
      [NSString stringWithUTF8String:string];
      int v4 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    }

    uint64_t v7 = xpc_dictionary_get_string(v3, (const char *)*MEMORY[0x1895F8710]);
    if (v7)
    {
      [NSString stringWithUTF8String:v7];
      int v8 = (void *)objc_claimAutoreleasedReturnValue();
      stringByRemovingTrailingUUIDsAndLaunchServicesStuff(v8);
      int v4 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_8;
    }
  }

  int v4 = 0LL;
LABEL_8:

  return v4;
}

id stringByRemovingTrailingUUIDsAndLaunchServicesStuff(void *a1)
{
  id v1 = a1;
  uint64_t v2 = v1;
  if (v1 && (uint64_t v3 = [v1 length]) != 0)
  {
    unint64_t v4 = v3;
    int v5 = [v2 characterAtIndex:v3 - 1];
    unint64_t v6 = [@"com.apple.xpc.launchd.oneshot" length];
    if (((v5 << 24) - 788529153) < 0xAFFFFFF || ((v5 << 24) - 1073741825) <= 0x6FFFFFE)
    {
      if (stringByRemovingTrailingUUIDsAndLaunchServicesStuff_pred != -1) {
        dispatch_once(&stringByRemovingTrailingUUIDsAndLaunchServicesStuff_pred, &__block_literal_global_2);
      }
      objc_msgSend( (id)stringByRemovingTrailingUUIDsAndLaunchServicesStuff_regex,  "stringByReplacingMatchesInString:options:range:withTemplate:",  v2,  0,  0,  objc_msgSend(v2, "length"),  &stru_18A1B7BD8);
      id v8 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_18;
    }

    if (v4 <= v6
      || [v2 characterAtIndex:v6 - 1] != 116
      || ![v2 hasPrefix:@"com.apple.xpc.launchd.oneshot"])
    {
      id v8 = v2;
LABEL_18:
      id v9 = v8;
      goto LABEL_19;
    }

    [v2 componentsSeparatedByString:@"."];
    int v10 = (void *)objc_claimAutoreleasedReturnValue();
    if ([v10 count] == 7
      && ([v10 objectAtIndexedSubscript:5],
          int v11 = (void *)objc_claimAutoreleasedReturnValue(),
          int v12 = [v11 hasPrefix:@"0x"],
          v11,
          v12))
    {
      int v13 = (void *)[v10 mutableCopy];
      [v13 removeObjectAtIndex:5];
      [v13 componentsJoinedByString:@"."];
      id v9 = (id)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      id v9 = v2;
    }
  }

  else
  {
    id v9 = 0LL;
  }

void __stringByRemovingTrailingUUIDsAndLaunchServicesStuff_block_invoke()
{
  id v3 = 0LL;
  uint64_t v0 = [MEMORY[0x189607A00] regularExpressionWithPattern:@"(\\.[A-F0-9]{8}-[A-F0-9]{4}-[A-F0-9]{4}-[A-F0-9]{4}-[A-F0-9]{12}\\Z|\\.[0-9]+\\Z|\\A\\[0x[a-fA-F0-9]+-0x[a-fA-F0-9]+\\]\\.)" options:0 error:&v3];
  id v1 = v3;
  uint64_t v2 = (void *)stringByRemovingTrailingUUIDsAndLaunchServicesStuff_regex;
  stringByRemovingTrailingUUIDsAndLaunchServicesStuff_regex = v0;
}

id pid_to_coalitionID(int a1)
{
  if (pid_to_coalitionID_onceToken != -1) {
    dispatch_once(&pid_to_coalitionID_onceToken, &__block_literal_global_12);
  }
  pid_to_coalition_bundleid(a1);
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2) {
    goto LABEL_6;
  }
  [(id)sLSPlugInKitProxyClass pluginKitProxyForIdentifier:v2];
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3
    || (unint64_t v4 = v3,
        [v3 containingBundle],
        int v5 = (void *)objc_claimAutoreleasedReturnValue(),
        [v5 bundleIdentifier],
        id v6 = (id)objc_claimAutoreleasedReturnValue(),
        v5,
        v4,
        !v6))
  {
LABEL_6:
    id v6 = v2;
  }

  return v6;
}

void __pid_to_coalitionID_block_invoke()
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  sCoreServicesDylibHandle = (uint64_t)dlopen((const char *)gCoreServicesFrameworkPath, 4);
  if (!sCoreServicesDylibHandle
    || ((Class Class = objc_getClass("LSPlugInKitProxy"), sLSPlugInKitProxyClass Class = (uint64_t)Class, sCoreServicesDylibHandle)
      ? (BOOL v1 = Class == 0LL)
      : (BOOL v1 = 1),
        v1))
  {
    NStatGetLog();
    uint64_t v2 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT))
    {
      int v3 = 134218240;
      uint64_t v4 = sCoreServicesDylibHandle;
      __int16 v5 = 2048;
      uint64_t v6 = sLSPlugInKitProxyClass;
      _os_log_impl( &dword_187FF5000,  v2,  OS_LOG_TYPE_FAULT,  "procinfo utils plugin mMapping dylib lookup failure handle %p plugin proxy class %p",  (uint8_t *)&v3,  0x16u);
    }
  }

id dateStringMillisecondsFromTimeInterval(double a1)
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  *(void *)__src = 0LL;
  uint64_t v15 = 0LL;
  __int16 v17 = 0;
  uint64_t v16 = 0LL;
  time_t v10 = (uint64_t)a1;
  if ((uint64_t)a1 <= 0)
  {
    time(&v10);
    a1 = 0.0;
  }

  double v1 = modf(a1, &v9);
  uint64_t v2 = localtime(&v10);
  int v3 = (void *)strftime(__src, 0x1AuLL, "%Y-%m-%d %H:%M:%S %z", v2);
  if (v3)
  {
    __int16 v8 = 0;
    *(_DWORD *)__str = 0;
    if (snprintf(__str, 6uLL, "%.3f", v1))
    {
      *(void *)__dst = 0LL;
      uint64_t v12 = 0LL;
      memset(v13, 0, sizeof(v13));
      uint64_t v4 = stpncpy(__dst, __src, 0x13uLL);
      __int16 v5 = stpncpy(v4, &__str[1], 4uLL);
      stpncpy(v5, (const char *)&v16 + 3, 6uLL);
      HIBYTE(v13[6]) = 0;
      int v3 = (void *)[objc_alloc(NSString) initWithCString:__dst encoding:1];
    }

    else
    {
      int v3 = 0LL;
    }
  }

  return v3;
}

id dateStringMillisecondsFromReferenceInterval(double a1)
{
  return dateStringMillisecondsFromTimeInterval(a1 + 978307200.0);
}

id timeStringMillisecondsFromTimeInterval(double a1)
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  memset(__src, 0, 15);
  time_t v10 = (uint64_t)a1;
  double v1 = modf(a1, &v9);
  uint64_t v2 = localtime(&v10);
  int v3 = (void *)strftime(__src, 0xFuLL, "%H:%M:%S %z", v2);
  if (v3)
  {
    __int16 v8 = 0;
    *(_DWORD *)__str = 0;
    if (snprintf(__str, 6uLL, "%.3f", v1))
    {
      *(void *)__dst = 0LL;
      memset(v12, 0, 11);
      uint64_t v4 = stpncpy(__dst, __src, 8uLL);
      __int16 v5 = stpncpy(v4, &__str[1], 4uLL);
      stpncpy(v5, &__src[8], 6uLL);
      BYTE2(v12[1]) = 0;
      int v3 = (void *)[objc_alloc(NSString) initWithCString:__dst encoding:1];
    }

    else
    {
      int v3 = 0LL;
    }
  }

  return v3;
}

id timeStringMillisecondsFromReferenceInterval(double a1)
{
  return timeStringMillisecondsFromTimeInterval(a1 + 978307200.0);
}

void NStatManagerSetQueuePriority_cold_1(os_log_t log)
{
  *(_WORD *)double v1 = 0;
  _os_log_error_impl( &dword_187FF5000,  log,  OS_LOG_TYPE_ERROR,  "Attempt to use obsolete NStatManagerSetQueuePriority() function",  v1,  2u);
}

CFAllocatorRef CFAllocatorGetDefault(void)
{
  return (CFAllocatorRef)MEMORY[0x1896025F8]();
}

void CFArrayApplyFunction(CFArrayRef theArray, CFRange range, CFArrayApplierFunction applier, void *context)
{
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x189602660](theArray);
}

CFTypeID CFArrayGetTypeID(void)
{
  return MEMORY[0x189602690]();
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x1896027C8]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x1896027D0](BOOLean);
}

CFStringRef CFCopyDescription(CFTypeRef cf)
{
  return (CFStringRef)MEMORY[0x189602A10](cf);
}

CFTypeID CFDataGetTypeID(void)
{
  return MEMORY[0x189602AC8]();
}

void CFDictionaryApplyFunction(CFDictionaryRef theDict, CFDictionaryApplierFunction applier, void *context)
{
}

CFIndex CFDictionaryGetCount(CFDictionaryRef theDict)
{
  return MEMORY[0x189602BD0](theDict);
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return MEMORY[0x189602BF0]();
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x189602D30](cf);
}

CFNumberType CFNumberGetType(CFNumberRef number)
{
  return MEMORY[0x189602EF8](number);
}

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x189602F08]();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x189602F10](number, theType, valuePtr);
}

void CFRelease(CFTypeRef cf)
{
}

CFStringRef CFStringCreateFromExternalRepresentation( CFAllocatorRef alloc, CFDataRef data, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x189603428](alloc, data, *(void *)&encoding);
}

Boolean CFStringFindWithOptions( CFStringRef theString, CFStringRef stringToFind, CFRange rangeToSearch, CFStringCompareFlags searchOptions, CFRange *result)
{
  return MEMORY[0x1896034D8]( theString,  stringToFind,  rangeToSearch.location,  rangeToSearch.length,  searchOptions,  result);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return MEMORY[0x1896034F8](theString, buffer, bufferSize, *(void *)&encoding);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return (const char *)MEMORY[0x189603500](theString, *(void *)&encoding);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x189603548](theString);
}

CFIndex CFStringGetMaximumSizeForEncoding(CFIndex length, CFStringEncoding encoding)
{
  return MEMORY[0x189603558](length, *(void *)&encoding);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x189603590]();
}

uint64_t NEHelperCacheCopySigningIdentifierMapping()
{
  return MEMORY[0x1895F8488]();
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return (SEL)MEMORY[0x1896076F0](aSelectorName);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x189607700](aClass);
}

CFTypeRef SecTaskCopyValueForEntitlement(SecTaskRef task, CFStringRef entitlement, CFErrorRef *error)
{
  return (CFTypeRef)MEMORY[0x18960B640](task, entitlement, error);
}

SecTaskRef SecTaskCreateFromSelf(CFAllocatorRef allocator)
{
  return (SecTaskRef)MEMORY[0x18960B658](allocator);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

int *__error(void)
{
  return (int *)MEMORY[0x1895F8898]();
}

uint64_t __memcpy_chk()
{
  return MEMORY[0x1895F8930]();
}

int __snprintf_chk(char *a1, size_t a2, int a3, size_t a4, const char *a5, ...)
{
  return MEMORY[0x1895F8998](a1, a2, *(void *)&a3, a4, a5);
}

uint64_t __strlcpy_chk()
{
  return MEMORY[0x1895F8A08]();
}

void _os_log_debug_impl( void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl( void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

int asxprintf(char **__ret, printf_domain_t __domain, locale_t __loc, const char *__format, ...)
{
  return MEMORY[0x1895F9550](__ret, __domain, __loc, __format);
}

void *__cdecl calloc(size_t __count, size_t __size)
{
  return (void *)MEMORY[0x1895F9710](__count, __size);
}

int close(int a1)
{
  return MEMORY[0x1895FA590](*(void *)&a1);
}

int connect(int a1, const sockaddr *a2, socklen_t a3)
{
  return MEMORY[0x1895FA5F0](*(void *)&a1, a2, *(void *)&a3);
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_assert_queue_not_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(uint64_t identifier, unint64_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1895FAC40](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class( dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x1895FAD78](attr, *(void *)&qos_class, *(void *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1895FAD80](label, attr);
}

dispatch_qos_class_t dispatch_queue_get_qos_class(dispatch_queue_t queue, int *relative_priority_ptr)
{
  return MEMORY[0x1895FADA0](queue, relative_priority_ptr);
}

void dispatch_resume(dispatch_object_t object)
{
}

dispatch_semaphore_t dispatch_semaphore_create(uint64_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x1895FADF0](value);
}

uint64_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x1895FAE00](dsema);
}

uint64_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x1895FAE08](dsema, timeout);
}

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create( dispatch_source_type_t type, uintptr_t handle, unint64_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x1895FAE50](type, handle, mask, queue);
}

void dispatch_source_set_cancel_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1895FAEE8](when, delta);
}

int dlclose(void *__handle)
{
  return MEMORY[0x1895FAF50](__handle);
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x1895FAF60](__path, *(void *)&__mode);
}

int fcntl(int a1, int a2, ...)
{
  return MEMORY[0x1895FB210](*(void *)&a1, *(void *)&a2);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x1895FB360](a1, a2);
}

void free(void *a1)
{
}

void freeifaddrs(ifaddrs *a1)
{
}

int getifaddrs(ifaddrs **a1)
{
  return MEMORY[0x1895FB5A0](a1);
}

int getnameinfo(const sockaddr *a1, socklen_t a2, char *a3, socklen_t a4, char *a5, socklen_t a6, int a7)
{
  return MEMORY[0x1895FB5D8](a1, *(void *)&a2, a3, *(void *)&a4, a5, *(void *)&a6, *(void *)&a7);
}

pid_t getpid(void)
{
  return MEMORY[0x1895FB628]();
}

int gettimeofday(timeval *a1, void *a2)
{
  return MEMORY[0x1895FB6E0](a1, a2);
}

char *__cdecl if_indextoname(unsigned int a1, char *a2)
{
  return (char *)MEMORY[0x1895FB7C8](*(void *)&a1, a2);
}

int ioctl(int a1, unint64_t a2, ...)
{
  return MEMORY[0x1895FB850](*(void *)&a1, a2);
}

tm *__cdecl localtime(const time_t *a1)
{
  return (tm *)MEMORY[0x1895FBA18](a1);
}

uint64_t mach_continuous_time(void)
{
  return MEMORY[0x1895FBAB0]();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x1895FBBF8](info);
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x1895FBC88](__size);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x1895FBE08](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1895FBE18](__dst, __src, __n);
}

double modf(double a1, double *a2)
{
  return result;
}

uint64_t ne_session_map_interface_to_provider_uuid()
{
  return MEMORY[0x1895FC018]();
}

printf_domain_t new_printf_domain(void)
{
  return (printf_domain_t)MEMORY[0x1895FC158]();
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1896165B0](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1896165C0]();
}

void objc_autoreleasePoolPop(void *context)
{
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x1896165E8]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1896165F0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x189616600]();
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x1896166B8](name);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1896166C8](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1896166D8](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x189616700](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x189616728](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x189616730]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x189616738]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x189616748]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x189616818](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x189616820](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x189616828](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x189616838](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x189616968](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x189616978](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x189616980](obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x189616990](a1);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x1895FC248](a1, *(void *)&a2);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1895FC440](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1895FC470](oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

int proc_listallpids(void *buffer, int buffersize)
{
  return MEMORY[0x1895FC8B0](buffer, *(void *)&buffersize);
}

int proc_name(int pid, void *buffer, uint32_t buffersize)
{
  return MEMORY[0x1895FC8C8](*(void *)&pid, buffer, *(void *)&buffersize);
}

int proc_pidinfo(int pid, int flavor, uint64_t arg, void *buffer, int buffersize)
{
  return MEMORY[0x1895FC8E0](*(void *)&pid, *(void *)&flavor, arg, buffer, *(void *)&buffersize);
}

ssize_t recv(int a1, void *a2, size_t a3, int a4)
{
  return MEMORY[0x1895FCCA8](*(void *)&a1, a2, a3, *(void *)&a4);
}

int register_printf_domain_function( printf_domain_t __domain, int __spec, printf_function *__render, printf_arginfo_function *__arginfo, void *__context)
{
  return MEMORY[0x1895FCCE8](__domain, *(void *)&__spec, __render, __arginfo, __context);
}

int register_printf_domain_render_std(printf_domain_t __domain, const char *__specs)
{
  return MEMORY[0x1895FCCF0](__domain, __specs);
}

ssize_t send(int a1, const void *a2, size_t a3, int a4)
{
  return MEMORY[0x1895FCE30](*(void *)&a1, a2, a3, *(void *)&a4);
}

int setsockopt(int a1, int a2, int a3, const void *a4, socklen_t a5)
{
  return MEMORY[0x1895FCEC8](*(void *)&a1, *(void *)&a2, *(void *)&a3, a4, *(void *)&a5);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x1895FCF90](__str, __size, __format);
}

int socket(int a1, int a2, int a3)
{
  return MEMORY[0x1895FCFA0](*(void *)&a1, *(void *)&a2, *(void *)&a3);
}

char *__cdecl stpncpy(char *__dst, const char *__src, size_t __n)
{
  return (char *)MEMORY[0x1895FD028](__dst, __src, __n);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x1895FD080](*(void *)&__errnum);
}

size_t strftime(char *a1, size_t a2, const char *a3, const tm *a4)
{
  return MEMORY[0x1895FD090](a1, a2, a3, a4);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1895FD0B8](__s);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x1895FD0E8](__s1, __s2, __n);
}

int sysctl(int *a1, u_int a2, void *a3, size_t *a4, void *a5, size_t a6)
{
  return MEMORY[0x1895FD2B0](a1, *(void *)&a2, a3, a4, a5, a6);
}

time_t time(time_t *a1)
{
  return MEMORY[0x1895FD400](a1);
}

int uuid_compare(const uuid_t uu1, const uuid_t uu2)
{
  return MEMORY[0x1895FD4B8](uu1, uu2);
}

int uuid_is_null(const uuid_t uu)
{
  return MEMORY[0x1895FD4E0](uu);
}

void uuid_unparse(const uuid_t uu, uuid_string_t out)
{
}

void uuid_unparse_upper(const uuid_t uu, uuid_string_t out)
{
}

int vasxprintf(char **__ret, printf_domain_t __domain, locale_t __loc, const char *__format, va_list __ap)
{
  return MEMORY[0x1895FD518](__ret, __domain, __loc, __format, __ap);
}

ssize_t write(int __fd, const void *__buf, size_t __nbyte)
{
  return MEMORY[0x1895FD750](*(void *)&__fd, __buf, __nbyte);
}

uint64_t xpc_coalition_copy_info()
{
  return MEMORY[0x1895FD900]();
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x1895FDC48](xdict, key);
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x1895FDE70](object);
}

const char *__cdecl xpc_string_get_string_ptr(xpc_object_t xstring)
{
  return (const char *)MEMORY[0x1895FE080](xstring);
}

uint64_t objc_msgSend__deltaForCurrentBytes_otherBytes_packets_prevBytes_prevOtherBytes_prevPackets_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel__deltaForCurrentBytes_otherBytes_packets_prevBytes_prevOtherBytes_prevPackets_);
}

uint64_t objc_msgSend_initWithUpdate_startTime_flowFlags_previously_bluetoothCounts_peerEgressCellularCounts_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel_initWithUpdate_startTime_flowFlags_previously_bluetoothCounts_peerEgressCellularCounts_);
}

uint64_t objc_msgSend_logAttributionChangeOn_oldProcName_newProcName_oldPid_newPid_oldEPid_newEPid_oldUUID_newUUID_oldEUUID_newEUUID_monitor_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel_logAttributionChangeOn_oldProcName_newProcName_oldPid_newPid_oldEPid_newEPid_oldUUID_newUUID_oldEUUID_newEUUID_monitor_);
}

uint64_t objc_msgSend_setAppStateIsForeground_screenStateOn_startAppStateIsForeground_startScreenStateOn_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel_setAppStateIsForeground_screenStateOn_startAppStateIsForeground_startScreenStateOn_);
}

uint64_t objc_msgSend_setAttribution_derivation_delegateName_delegateDerivation_extensionName_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel_setAttribution_derivation_delegateName_delegateDerivation_extensionName_);
}
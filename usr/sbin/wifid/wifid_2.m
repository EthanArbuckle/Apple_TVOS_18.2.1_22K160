id sub_100122814(uint64_t a1, uint64_t a2)
{
  id result;
  uint64_t (**v5)(id, uint64_t, void);
  result = [*(id *)(a1 + 32) response];
  if (result)
  {
    v5 = (uint64_t (**)(id, uint64_t, void))[*(id *)(a1 + 32) response];
    return (id)v5[2](v5, a2, 0LL);
  }

  return result;
}

void sub_100123504(id a1)
{
  qword_100219E08 = objc_alloc_init(&OBJC_CLASS___WiFiXPCManager);
}

void sub_100124600( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, char a18)
{
}

void sub_100124628(uint64_t a1)
{
  v2 = objc_autoreleasePoolPush();
  id v3 = [*(id *)(*(void *)(a1 + 32) + 56) objectForKeyedSubscript:*(void *)(a1 + 40)];
  if ([*(id *)(a1 + 48) array] != v3)
  {
    if ([*(id *)(a1 + 48) array]) {
      BOOL v4 = v3 == 0LL;
    }
    else {
      BOOL v4 = 1;
    }
    if (v4 || (objc_msgSend(objc_msgSend(*(id *)(a1 + 48), "array"), "isEqual:", v3) & 1) == 0)
    {
      objc_msgSend( *(id *)(*(void *)(a1 + 32) + 56),  "setObject:forKeyedSubscript:",  objc_msgSend(*(id *)(a1 + 48), "array"),  *(void *)(a1 + 40));
      *(_BYTE *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL) = 1;
    }
  }

  objc_autoreleasePoolPop(v2);
}

void sub_100124B84(uint64_t a1, uint64_t a2, void *a3, int a4, void *a5)
{
  v8 = objc_autoreleasePoolPush();
  if (a4)
  {
    if ([a5 response])
    {
      v9 = (void (**)(id, NSError *, void))[a5 response];
      v9[2]( v9,  +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  CWFManagerErrorDomain,  a4,  0LL),  0LL);
    }
  }

  else
  {
    id v10 = objc_alloc_init(&OBJC_CLASS___CWFSensingResult);
    objc_msgSend(v10, "setData:", objc_msgSend(a3, "copy"));
    id v11 = +[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary");
    [v11 setObject:v10 forKeyedSubscript:CWFXPCResultKey];
    if ([a5 response])
    {
      v12 = (void (**)(id, void, id))[a5 response];
      v12[2](v12, 0LL, v11);
    }
  }

  objc_autoreleasePoolPop(v8);
}

void sub_1001255F4(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  if ([*(id *)(a1 + 32) response])
  {
    v6 = (void (**)(id, NSError *, void))[*(id *)(a1 + 32) response];
    if (a4) {
      v7 = +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  CWFManagerErrorDomain,  a4,  0LL);
    }
    else {
      v7 = 0LL;
    }
    v6[2](v6, v7, 0LL);
  }
}

void sub_1001257BC(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  if ([*(id *)(a1 + 32) response])
  {
    v6 = (void (**)(id, NSError *, void))[*(id *)(a1 + 32) response];
    if (a4) {
      v7 = +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  CWFManagerErrorDomain,  a4,  0LL);
    }
    else {
      v7 = 0LL;
    }
    v6[2](v6, v7, 0LL);
  }
}

void sub_100125938( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

void sub_100125950(uint64_t a1)
{
  v2 = objc_autoreleasePoolPush();
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = objc_msgSend( objc_msgSend( *(id *)(*(void *)(a1 + 32) + 56),  "objectForKeyedSubscript:",  objc_msgSend( objc_msgSend( *(id *)(a1 + 40),  "requestParameters"),  "interfaceName")),  "copy");
  objc_autoreleasePoolPop(v2);
}

void sub_1001261D8(uint64_t a1)
{
  uint64_t v2 = CWFGetOSLog(a1);
  if (v2) {
    id v3 = (os_log_s *)CWFGetOSLog(v2);
  }
  else {
    id v3 = (os_log_s *)&_os_log_default;
  }
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    int v13 = 138543618;
    uint64_t v14 = v4;
    __int16 v15 = 1024;
    qos_class_t v16 = qos_class_self();
    _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v3,  0LL,  "[corewifi] Will process CoreWiFi XPC request (req=%{public}@, qos=%d)",  &v13,  18);
  }

  v5 = objc_autoreleasePoolPush();
  uint64_t v6 = (uint64_t)[*(id *)(a1 + 32) type];
  if (v6 <= 144)
  {
    if (v6 <= 35)
    {
      switch(v6)
      {
        case 6LL:
          objc_msgSend(*(id *)(a1 + 40), "__setPower:XPCConnection:", *(void *)(a1 + 32), *(void *)(a1 + 48));
          break;
        case 23LL:
          objc_msgSend(*(id *)(a1 + 40), "__setCompanionCountryCode:", *(void *)(a1 + 32));
          break;
        case 35LL:
          objc_msgSend(*(id *)(a1 + 40), "__getThermalIndex:", *(void *)(a1 + 32));
          break;
        default:
LABEL_25:
          uint64_t v8 = CWFGetOSLog(v6);
          if (v8) {
            v9 = (os_log_s *)CWFGetOSLog(v8);
          }
          else {
            v9 = (os_log_s *)&_os_log_default;
          }
          if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v10 = *(void *)(a1 + 32);
            int v13 = 138412290;
            uint64_t v14 = v10;
            LODWORD(v12) = 12;
            _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v9,  0LL,  "[corewifi] Sensing in wifiManager unsupported (%@)",  &v13,  v12);
          }

          if ([*(id *)(a1 + 32) response])
          {
            id v11 = (void (**)(id, NSError *, void))[*(id *)(a1 + 32) response];
            v11[2]( v11,  +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  45LL,  0LL),  0LL);
          }

          break;
      }
    }

    else
    {
      switch(v6)
      {
        case '6':
          objc_msgSend(*(id *)(a1 + 40), "__getKnownNetworkProfiles:", *(void *)(a1 + 32));
          break;
        case '7':
        case '8':
        case 'F':
        case 'G':
        case 'H':
        case 'I':
        case 'J':
        case 'K':
        case 'L':
        case 'M':
        case 'N':
        case 'P':
        case 'Q':
        case 'R':
        case 'S':
        case 'T':
        case 'U':
        case 'V':
        case 'W':
        case 'X':
        case 'Y':
        case 'Z':
        case '[':
        case '\\':
        case ']':
        case '^':
        case 'b':
        case 'c':
        case 'j':
        case 'k':
        case 'm':
        case 'n':
          goto LABEL_25;
        case '9':
          objc_msgSend(*(id *)(a1 + 40), "__getCurrentScanResult:", *(void *)(a1 + 32));
          break;
        case ':':
          objc_msgSend( *(id *)(a1 + 40),  "__getCurrentNetworkProfile:XPCConnection:",  *(void *)(a1 + 32),  *(void *)(a1 + 48));
          break;
        case ';':
          objc_msgSend(*(id *)(a1 + 40), "__addKnownNetworkProfile:", *(void *)(a1 + 32));
          break;
        case '<':
          objc_msgSend(*(id *)(a1 + 40), "__removeKnownNetworkProfile:", *(void *)(a1 + 32));
          break;
        case '=':
          objc_msgSend( *(id *)(a1 + 40),  "__updateKnownNetworkProfile:XPCConnection:",  *(void *)(a1 + 32),  *(void *)(a1 + 48));
          break;
        case '>':
          objc_msgSend(*(id *)(a1 + 40), "__associate:XPCConnection:", *(void *)(a1 + 32), *(void *)(a1 + 48));
          break;
        case '?':
          objc_msgSend(*(id *)(a1 + 40), "__disassociate:XPCConnection:", *(void *)(a1 + 32), *(void *)(a1 + 48));
          break;
        case '@':
          objc_msgSend(*(id *)(a1 + 40), "__performScan:XPCConnection:", *(void *)(a1 + 32), *(void *)(a1 + 48));
          break;
        case 'A':
          objc_msgSend(*(id *)(a1 + 40), "__performANQP:", *(void *)(a1 + 32));
          break;
        case 'B':
          objc_msgSend( *(id *)(a1 + 40),  "__startAWDLPeerAssistedDiscovery:XPCConnection:",  *(void *)(a1 + 32),  *(void *)(a1 + 48));
          break;
        case 'C':
          objc_msgSend( *(id *)(a1 + 40),  "__stopAWDLPeerAssistedDiscovery:XPCConnection:",  *(void *)(a1 + 32),  *(void *)(a1 + 48));
          break;
        case 'D':
          objc_msgSend(*(id *)(a1 + 40), "__setRangeable:", *(void *)(a1 + 32));
          break;
        case 'E':
          objc_msgSend(*(id *)(a1 + 40), "__performRanging:", *(void *)(a1 + 32));
          break;
        case 'O':
        case '_':
        case 'a':
LABEL_12:
          if ([*(id *)(a1 + 32) response])
          {
            id v7 = [*(id *)(a1 + 32) response];
            (*((void (**)(id, void, void))v7 + 2))(v7, 0LL, 0LL);
          }

          break;
        case 'd':
        case 'e':
        case 'f':
        case 'g':
        case 'h':
        case 'i':
        case 'l':
        case 'o':
          objc_msgSend(*(id *)(a1 + 40), "__handleActivity:", *(void *)(a1 + 32));
          break;
        default:
          if (v6 != 36) {
            goto LABEL_25;
          }
          objc_msgSend(*(id *)(a1 + 40), "__setThermalIndex:", *(void *)(a1 + 32));
          break;
      }
    }
  }

  else
  {
    switch(v6)
    {
      case 174LL:
        objc_msgSend(*(id *)(a1 + 40), "__setRangingIdentifier:", *(void *)(a1 + 32));
        break;
      case 175LL:
      case 176LL:
      case 178LL:
      case 185LL:
      case 186LL:
      case 187LL:
      case 192LL:
      case 196LL:
      case 203LL:
      case 204LL:
      case 205LL:
      case 206LL:
      case 207LL:
      case 208LL:
      case 209LL:
      case 210LL:
      case 211LL:
      case 212LL:
      case 213LL:
      case 214LL:
      case 215LL:
      case 216LL:
      case 217LL:
      case 222LL:
      case 223LL:
      case 224LL:
      case 225LL:
      case 226LL:
      case 227LL:
      case 228LL:
      case 229LL:
      case 230LL:
      case 231LL:
      case 232LL:
      case 233LL:
      case 234LL:
      case 235LL:
      case 239LL:
      case 240LL:
      case 241LL:
      case 242LL:
        goto LABEL_25;
      case 177LL:
        objc_msgSend(*(id *)(a1 + 40), "__performAutoJoin:", *(void *)(a1 + 32));
        break;
      case 179LL:
        objc_msgSend(*(id *)(a1 + 40), "__getUserAutoJoinState:", *(void *)(a1 + 32));
        break;
      case 180LL:
        objc_msgSend( *(id *)(a1 + 40),  "__setUserAutoJoinState:XPCConnection:",  *(void *)(a1 + 32),  *(void *)(a1 + 48));
        break;
      case 181LL:
      case 184LL:
      case 191LL:
      case 237LL:
        goto LABEL_12;
      case 182LL:
        objc_msgSend(*(id *)(a1 + 40), "__getAutoHotspotMode:", *(void *)(a1 + 32));
        break;
      case 183LL:
        objc_msgSend(*(id *)(a1 + 40), "__setAutoHotspotMode:", *(void *)(a1 + 32));
        break;
      case 188LL:
        objc_msgSend(*(id *)(a1 + 40), "__performSensing:", *(void *)(a1 + 32));
        break;
      case 189LL:
        objc_msgSend(*(id *)(a1 + 40), "__getUserSettings:", *(void *)(a1 + 32));
        break;
      case 190LL:
        objc_msgSend(*(id *)(a1 + 40), "__setUserSettings:", *(void *)(a1 + 32));
        break;
      case 193LL:
        objc_msgSend(*(id *)(a1 + 40), "__getAutoJoinMetric:", *(void *)(a1 + 32));
        break;
      case 194LL:
        objc_msgSend(*(id *)(a1 + 40), "__getAutoJoinStatistics:", *(void *)(a1 + 32));
        break;
      case 195LL:
        objc_msgSend(*(id *)(a1 + 40), "__resetAutoJoinStatistics:", *(void *)(a1 + 32));
        break;
      case 197LL:
        objc_msgSend(*(id *)(a1 + 40), "__getCountryBandSupport:", *(void *)(a1 + 32));
        break;
      case 198LL:
        objc_msgSend(*(id *)(a1 + 40), "__addKnownBSS:", *(void *)(a1 + 32));
        break;
      case 199LL:
        objc_msgSend(*(id *)(a1 + 40), "__removeKnownBSS:", *(void *)(a1 + 32));
        break;
      case 200LL:
        objc_msgSend(*(id *)(a1 + 40), "__updateKnownBSS:", *(void *)(a1 + 32));
        break;
      case 201LL:
        objc_msgSend(*(id *)(a1 + 40), "__getPassword:", *(void *)(a1 + 32));
        break;
      case 202LL:
        objc_msgSend(*(id *)(a1 + 40), "__setPassword:", *(void *)(a1 + 32));
        break;
      case 218LL:
        objc_msgSend(*(id *)(a1 + 40), "__setBlockedBands:", *(void *)(a1 + 32));
        break;
      case 219LL:
        objc_msgSend(*(id *)(a1 + 40), "__updateSoftAPBand:XPCConnection:", *(void *)(a1 + 32), *(void *)(a1 + 48));
        break;
      case 220LL:
        objc_msgSend(*(id *)(a1 + 40), "__startHostAPMode:XPCConnection:", *(void *)(a1 + 32), *(void *)(a1 + 48));
        break;
      case 221LL:
        objc_msgSend(*(id *)(a1 + 40), "__stopHostAPMode:XPCConnection:", *(void *)(a1 + 32), *(void *)(a1 + 48));
        break;
      case 236LL:
        objc_msgSend(*(id *)(a1 + 40), "__getWiFiAssistOverrideReasons:", *(void *)(a1 + 32));
        break;
      case 238LL:
        objc_msgSend(*(id *)(a1 + 40), "__performNDD:XPCConnection:", *(void *)(a1 + 32), *(void *)(a1 + 48));
        break;
      case 243LL:
        objc_msgSend(*(id *)(a1 + 40), "__getBackgroundScanConfiguration:", *(void *)(a1 + 32));
        break;
      case 244LL:
        objc_msgSend(*(id *)(a1 + 40), "__setBackgroundScanConfiguration:", *(void *)(a1 + 32));
        break;
      case 245LL:
        objc_msgSend(*(id *)(a1 + 40), "__getAutoJoinDenyList:", *(void *)(a1 + 32));
        break;
      case 246LL:
        objc_msgSend(*(id *)(a1 + 40), "__setAutoJoinDenyList:", *(void *)(a1 + 32));
        break;
      case 247LL:
        objc_msgSend(*(id *)(a1 + 40), "__clearAutoJoinDenyList:", *(void *)(a1 + 32));
        break;
      default:
        if (v6 != 145) {
          goto LABEL_25;
        }
        objc_msgSend(*(id *)(a1 + 40), "__getDeviceUUID:", *(void *)(a1 + 32));
        break;
    }
  }

  objc_autoreleasePoolPop(v5);
}

id sub_100126744(uint64_t a1)
{
  id v2 = objc_msgSend(*(id *)(a1 + 32), "__peerAssistedDiscoveryNetworksForUUID:", objc_msgSend(*(id *)(a1 + 40), "UUID"));
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  id v3 = objc_msgSend(v2, "allKeys", 0);
  id result = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (result)
  {
    id v5 = result;
    uint64_t v6 = *(void *)v13;
    do
    {
      id v7 = 0LL;
      do
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(const void **)(*((void *)&v12 + 1) + 8LL * (void)v7);
        v9 = sub_100094AAC((uint64_t)kCFAllocatorDefault, [v2 objectForKeyedSubscript:v8]);
        if (v9)
        {
          uint64_t v10 = v9;
          id v11 = objc_msgSend(*(id *)(a1 + 32), "__deviceManagerWithInterfaceName:", v8);
          if (v11) {
            sub_1000E5F48((uint64_t)v11, v8, v10, 0LL, 0LL);
          }
          CFRelease(v10);
        }

        objc_msgSend( *(id *)(a1 + 32),  "__setPeerAssistedDiscoveryNetwork:interfaceName:UUID:",  0,  v8,  objc_msgSend(*(id *)(a1 + 40), "UUID"));
        id v7 = (char *)v7 + 1;
      }

      while (v5 != v7);
      id result = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
      id v5 = result;
    }

    while (result);
  }

  return result;
}

void sub_10012691C(id a1)
{
  if (objc_opt_class(&OBJC_CLASS___BKSApplicationStateMonitor)) {
    qword_100219E18 = objc_alloc_init(&OBJC_CLASS___WiFiAppStateManager);
  }
}

void sub_100126990(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (a5) {
    [a2 externalAppUnregistered:a5];
  }
}

void sub_100126C9C(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(dispatch_queue_s **)(v2 + 104);
  if (v3)
  {
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472LL;
    v4[2] = sub_100126CF8;
    v4[3] = &unk_1001E2778;
    v4[4] = v2;
    v4[5] = a2;
    dispatch_async(v3, v4);
  }

id sub_100126CF8(uint64_t a1)
{
  return [*(id *)(a1 + 32) _applicationStateMonitorHandler:*(void *)(a1 + 40)];
}

void sub_100126DB4(uint64_t a1)
{
  uint64_t v2 = *(const void **)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL);
  if (v2)
  {
    CFRelease(v2);
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 0LL;
  }

void sub_100127430( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
}

void sub_100127460(uint64_t a1, uint64_t a2)
{
}

void sub_100127470(uint64_t a1)
{
}

void sub_10012747C(uint64_t a1)
{
}

uint64_t sub_1001274F0(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 32) + 80LL))( *(void *)(*(void *)(a1 + 32) + 72LL),  *(void *)(a1 + 40),  *(unsigned int *)(a1 + 48));
}

void sub_100127504(uint64_t a1)
{
  uint64_t v2 = *(const void **)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL);
  if (v2)
  {
    CFRelease(v2);
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 0LL;
  }

void sub_100127554(uint64_t a1)
{
  uint64_t v2 = *(const void **)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL);
  if (v2)
  {
    CFRelease(v2);
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 0LL;
  }

void sub_100127B8C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
}

void sub_100127BA4(uint64_t a1)
{
  CFNumberRef v2 = CFNumberCreate(0LL, kCFNumberIntType, (const void *)(a1 + 40));
  (*(void (**)(void, CFNumberRef))(*(void *)(a1 + 32) + 96LL))( *(void *)(*(void *)(a1 + 32) + 88LL),  v2);
  if (v2) {
    CFRelease(v2);
  }
}

void sub_100127BF8(uint64_t a1)
{
  CFNumberRef v2 = CFNumberCreate(0LL, kCFNumberIntType, (const void *)(a1 + 40));
  (*(void (**)(void, CFNumberRef))(*(void *)(a1 + 32) + 96LL))( *(void *)(*(void *)(a1 + 32) + 88LL),  v2);
  if (v2) {
    CFRelease(v2);
  }
}

void sub_100127C4C(uint64_t a1)
{
  CFNumberRef v2 = *(const void **)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL);
  if (v2)
  {
    CFRelease(v2);
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 0LL;
  }

WiFiDriverTriggeredTTR *sub_1001281B4(uint64_t a1)
{
  id result = -[WiFiDriverTriggeredTTR initWithWiFiManagerwithStringRef:withInterval:]( objc_alloc(&OBJC_CLASS___WiFiDriverTriggeredTTR),  "initWithWiFiManagerwithStringRef:withInterval:",  *(void *)(a1 + 32),  *(double *)(a1 + 40));
  qword_100219E28 = (uint64_t)result;
  return result;
}

void sub_1001285B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
}

uint64_t sub_1001285F4()
{
  uint64_t result = qword_100219E38;
  if (!qword_100219E38)
  {
    pthread_once(&stru_1002191E0, (void (*)(void))sub_100128630);
    return qword_100219E38;
  }

  return result;
}

uint64_t sub_100128630()
{
  uint64_t result = _CFRuntimeRegisterClass(&unk_1001E5BA0);
  qword_100219E38 = result;
  return result;
}

uint64_t sub_100128654(const __CFAllocator *a1, CFIndex a2)
{
  if (!qword_100219E38) {
    pthread_once(&stru_1002191E0, (void (*)(void))sub_100128630);
  }
  uint64_t Instance = _CFRuntimeCreateInstance(a1);
  uint64_t v5 = Instance;
  if (Instance)
  {
    *(_OWORD *)(Instance + 64) = 0u;
    *(_OWORD *)(Instance + 80) = 0u;
    *(_OWORD *)(Instance + 32) = 0u;
    *(_OWORD *)(Instance + 4_Block_object_dispose(va, 8) = 0u;
    *(_OWORD *)(Instance + 16) = 0u;
    *(void *)(Instance + 24) = a2;
    CFMutableArrayRef Mutable = CFArrayCreateMutable(a1, a2, &kCFTypeArrayCallBacks);
    *(void *)(v5 + 16) = Mutable;
    if (Mutable
      && (CFMutableSetRef v7 = CFSetCreateMutable(kCFAllocatorDefault, 0LL, &kCFTypeSetCallBacks), (*(void *)(v5 + 80) = v7) != 0LL))
    {
      *(_BYTE *)(v5 + 72) = 0;
    }

    else
    {
      CFRelease((CFTypeRef)v5);
      return 0LL;
    }
  }

  return v5;
}

uint64_t sub_100128724(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(void *)(result + 32) = a2;
  *(void *)(result + 40) = a3;
  return result;
}

CFIndex sub_10012872C(uint64_t a1)
{
  return CFArrayGetCount(*(CFArrayRef *)(a1 + 16));
}

uint64_t sub_100128734(uint64_t a1, const UInt8 *a2, CFIndex a3, void *a4)
{
  uint64_t result = 4294963394LL;
  if (a2 && a3)
  {
    CFIndex Count = CFArrayGetCount(*(CFArrayRef *)(a1 + 16));
    CFIndex v10 = *(void *)(a1 + 24);
    if (v10 && Count >= v10) {
      return 4294963394LL;
    }
    uint64_t v11 = sub_100128850(a1, 0LL);
    CFMutableArrayRef Mutable = CFDataCreateMutable(kCFAllocatorDefault, a3 + 8);
    if (!Mutable)
    {
      return 4294963394LL;
    }

    else
    {
      __int128 v13 = Mutable;
      ++qword_100219E40;
      CFDataAppendBytes(Mutable, (const UInt8 *)&qword_100219E40, 8LL);
      CFDataAppendBytes(v13, a2, a3);
      CFDataSetLength(v13, a3 + 8);
      CFArrayAppendValue(*(CFMutableArrayRef *)(a1 + 16), v13);
      if (a4) {
        *a4 = qword_100219E40;
      }
      if (!v11)
      {
        *(void *)(a1 + 8_Block_object_dispose(va, 8) = sub_10003AFF4((uint64_t)"WiFiCommandQueueEnqueue");
        sub_100128950(a1, 1);
      }

      CFRelease(v13);
      return 0LL;
    }
  }

  return result;
}

uint64_t sub_100128850(uint64_t a1, uint64_t *a2)
{
  *(void *)buffer = 0LL;
  if (a1 && (CFIndex Count = CFArrayGetCount(*(CFArrayRef *)(a1 + 16)), Count >= 1))
  {
    CFIndex v7 = Count;
    uint64_t v5 = 0LL;
    CFIndex v8 = 0LL;
    uint64_t v6 = -1LL;
    do
    {
      ValueAtIndex = (const __CFData *)CFArrayGetValueAtIndex(*(CFArrayRef *)(a1 + 16), v8);
      if (!ValueAtIndex) {
        break;
      }
      v15.location = 0LL;
      v15.length = 8LL;
      CFDataGetBytes(ValueAtIndex, v15, buffer);
      CFNumberRef v10 = CFNumberCreate(kCFAllocatorDefault, kCFNumberSInt64Type, buffer);
      if (!v10) {
        break;
      }
      CFNumberRef v11 = v10;
      int v12 = CFSetContainsValue(*(CFSetRef *)(a1 + 80), v10);
      if (!v12) {
        ++v5;
      }
      if (v12 == 0 && v6 == -1) {
        uint64_t v6 = v8;
      }
      CFRelease(v11);
      ++v8;
    }

    while (v7 != v8);
  }

  else
  {
    uint64_t v5 = 0LL;
    uint64_t v6 = -1LL;
  }

  if (a2) {
    *a2 = v6;
  }
  return v5;
}

uint64_t sub_100128950(uint64_t a1, int a2)
{
  CFIndex Count = CFArrayGetCount(*(CFArrayRef *)(a1 + 16));
  CFIndex v5 = Count;
  if (Count < 11)
  {
    if (!Count) {
      return 0LL;
    }
    if (!a2)
    {
LABEL_12:
      sub_100128AB8(a1);
      return 0LL;
    }
  }

  else
  {
    uint64_t v6 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      objc_msgSend( (id)qword_100219F60,  "WFLog:message:",  4,  "%s: cmdQueue size %ld exceeding recurse limit of %ld. Back to runloop.",  "WiFiCommandQueueSignal",  v5,  10);
    }
    objc_autoreleasePoolPop(v6);
  }

  if (!*(void *)(a1 + 48)) {
    goto LABEL_12;
  }
  if (*(_BYTE *)(a1 + 72))
  {
    CFIndex v7 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      objc_msgSend( (id)qword_100219F60,  "WFLog:message:",  3,  "%s: timer is running. Will not signal cmdQueue",  "WiFiCommandQueueSignal");
    }
    objc_autoreleasePoolPop(v7);
  }

  else
  {
    CFRetain((CFTypeRef)a1);
    CFIndex v8 = *(dispatch_queue_s **)(a1 + 48);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100128A88;
    block[3] = &unk_1001E2620;
    block[4] = a1;
    dispatch_async(v8, block);
  }

  return 0LL;
}

void sub_100128A88(uint64_t a1)
{
  CFNumberRef v2 = *(void **)(a1 + 32);
  if (v2[6])
  {
    sub_100128AB8((uint64_t)v2);
    CFNumberRef v2 = *(void **)(a1 + 32);
  }

  CFRelease(v2);
}

void sub_100128AB8(uint64_t a1)
{
  if (sub_100128850(a1, 0LL))
  {
    CFNumberRef v2 = *(void (**)(uint64_t, void))(a1 + 32);
    if (v2) {
      v2(a1, *(void *)(a1 + 40));
    }
  }

  else
  {
    id v3 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      objc_msgSend( (id)qword_100219F60,  "WFLog:message:",  3,  "%s:%d cmdQueue is EMPTY!!!!",  "__WiFiCommandQueueCallback",  506);
    }
    objc_autoreleasePoolPop(v3);
  }

uint64_t sub_100128B54(uint64_t a1, void *a2, CFIndex *a3, void *a4)
{
  *(void *)buffer = 0LL;
  if (!a2 || a3)
  {
    CFIndex Count = CFArrayGetCount(*(CFArrayRef *)(a1 + 16));
    if (Count >= 1)
    {
      CFIndex v9 = Count;
      uint64_t v10 = 1LL;
      do
      {
        ValueAtIndex = (const __CFData *)CFArrayGetValueAtIndex(*(CFArrayRef *)(a1 + 16), v10 - 1);
        if (!ValueAtIndex) {
          return 4294963394LL;
        }
        int v12 = ValueAtIndex;
        v20.location = 0LL;
        v20.length = 8LL;
        CFDataGetBytes(ValueAtIndex, v20, buffer);
        CFNumberRef v13 = CFNumberCreate(kCFAllocatorDefault, kCFNumberSInt64Type, buffer);
        if (!v13) {
          return 4294963394LL;
        }
        CFNumberRef v14 = v13;
        int v15 = CFSetContainsValue(*(CFSetRef *)(a1 + 80), v13);
        CFRelease(v14);
        if (v10 >= v9) {
          break;
        }
        ++v10;
      }

      while (v15);
      if (v15) {
        return 4294963394LL;
      }
      if (!a2)
      {
LABEL_14:
        uint64_t result = 0LL;
        if (a4) {
          *a4 = *(void *)buffer;
        }
        return result;
      }

      CFIndex Length = CFDataGetLength(v12);
      CFIndex v17 = Length - 8;
      if (Length != 8 && v17 <= *a3)
      {
        *a3 = v17;
        *a2 = CFDataGetBytePtr(v12) + 8;
        goto LABEL_14;
      }
    }
  }

  return 4294963394LL;
}

uint64_t sub_100128C88(uint64_t a1, void *a2, size_t a3, void *a4)
{
  __src = 0LL;
  size_t __len = a3;
  uint64_t v10 = 0LL;
  if (a1)
  {
    CFIndex v7 = *(dispatch_source_s **)(a1 + 64);
    if (v7) {
      dispatch_source_set_timer(v7, 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0LL);
    }
  }

  if (!sub_100128850(a1, 0LL))
  {
    uint64_t result = 4294963394LL;
    if (!a4) {
      return result;
    }
    goto LABEL_14;
  }

  if (a2) {
    p_src = &__src;
  }
  else {
    p_src = 0LL;
  }
  uint64_t result = sub_100128D80(a1, 0LL, v10);
  if (!(_DWORD)result)
  {
    sub_100128950(a1, 0);
    uint64_t result = 0LL;
  }

  if (a4) {
LABEL_14:
  }
    *a4 = v10;
  return result;
}

void sub_100128D60(uint64_t a1)
{
  if (a1)
  {
    v1 = *(dispatch_source_s **)(a1 + 64);
    if (v1) {
      dispatch_source_set_timer(v1, 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0LL);
    }
  }

uint64_t sub_100128D80(uint64_t a1, void *a2, uint64_t a3)
{
  CFIndex Count = CFArrayGetCount(*(CFArrayRef *)(a1 + 16));
  if (Count < 1)
  {
LABEL_6:
    uint64_t v10 = 4294963394LL;
    if (!Count) {
      return v10;
    }
  }

  else
  {
    CFIndex v7 = 0LL;
    while (1)
    {
      *(void *)buffer = 0xAAAAAAAAAAAAAAAALL;
      ValueAtIndex = (const __CFData *)CFArrayGetValueAtIndex(*(CFArrayRef *)(a1 + 16), v7);
      if (ValueAtIndex)
      {
        CFIndex v9 = ValueAtIndex;
        v19.location = 0LL;
        v19.length = 8LL;
        CFDataGetBytes(ValueAtIndex, v19, buffer);
        if (*(void *)buffer == a3) {
          break;
        }
      }

      if (Count == ++v7) {
        goto LABEL_6;
      }
    }

    if (a2)
    {
      CFNumberRef v11 = CFDataGetBytePtr(v9) + 8;
      CFIndex Length = CFDataGetLength(v9);
      memcpy(a2, v11, Length - 8);
    }

    CFArraySetValueAtIndex(*(CFMutableArrayRef *)(a1 + 16), v7, kCFNull);
    CFNumberRef v13 = *(const __CFArray **)(a1 + 16);
    v20.length = CFArrayGetCount(v13);
    v20.location = 0LL;
    CFIndex FirstIndexOfValue = CFArrayGetFirstIndexOfValue(v13, v20, kCFNull);
    if (FirstIndexOfValue != -1)
    {
      for (CFIndex i = FirstIndexOfValue; i != -1; CFIndex i = CFArrayGetFirstIndexOfValue(v16, v21, kCFNull))
      {
        CFArrayRemoveValueAtIndex(*(CFMutableArrayRef *)(a1 + 16), i);
        qos_class_t v16 = *(const __CFArray **)(a1 + 16);
        v21.length = CFArrayGetCount(v16);
        v21.location = 0LL;
      }
    }

    uint64_t v10 = 0LL;
  }

  if (!CFArrayGetCount(*(CFArrayRef *)(a1 + 16))) {

  }
  return v10;
}

void sub_100128EF0(uint64_t a1)
{
  CFNumberRef v2 = *(dispatch_source_s **)(a1 + 56);
  if (v2)
  {
    dispatch_time_t v3 = dispatch_time(0LL, 500000000LL);
    dispatch_source_set_timer(v2, v3, 0xFFFFFFFFFFFFFFFFLL, 0LL);
  }

  *(_BYTE *)(a1 + 72) = 1;
}

void sub_100128F40(uint64_t a1)
{
  CFNumberRef v2 = *(dispatch_source_s **)(a1 + 56);
  if (v2) {
    dispatch_source_set_timer(v2, 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0LL);
  }
  *(_BYTE *)(a1 + 72) = 0;
}

void sub_100128F78(void *context, dispatch_queue_t queue, void (__cdecl *a3)(void *), void *a4)
{
  *((void *)context + 6) = queue;
  dispatch_source_t v8 = (dispatch_source_t)*((void *)context + 7);
  if (v8
    || (dispatch_source_t v8 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0LL, 0LL, queue),
        (*((void *)context + 7) = v8) != 0LL))
  {
    dispatch_set_context(v8, context);
    dispatch_source_set_event_handler_f(*((dispatch_source_t *)context + 7), (dispatch_function_t)sub_100129044);
    dispatch_activate(*((dispatch_object_t *)context + 7));
  }

  dispatch_source_t v9 = (dispatch_source_t)*((void *)context + 8);
  if (v9 {
    || (dispatch_source_t v9 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0LL, 0LL, queue),
  }
        (*((void *)context + _Block_object_dispose(va, 8) = v9) != 0LL))
  {
    dispatch_set_context(v9, a4);
    dispatch_source_set_event_handler_f(*((dispatch_source_t *)context + 8), a3);
    dispatch_activate(*((dispatch_object_t *)context + 8));
  }

void sub_100129044(uint64_t a1)
{
  *(_BYTE *)(a1 + 72) = 0;
  CFNumberRef v2 = objc_autoreleasePoolPush();
  if (qword_100219F60) {
    objc_msgSend((id)qword_100219F60, "WFLog:message:", 3, "%s: retrying command", "__WiFiCommandQueueTimerCallback");
  }
  objc_autoreleasePoolPop(v2);
  sub_100128AB8(a1);
}

void sub_1001290AC(uint64_t a1)
{
  CFNumberRef v2 = *(dispatch_source_s **)(a1 + 56);
  if (v2)
  {
    dispatch_source_cancel(v2);
    dispatch_release(*(dispatch_object_t *)(a1 + 56));
    *(void *)(a1 + 56) = 0LL;
  }

  dispatch_time_t v3 = *(dispatch_source_s **)(a1 + 64);
  if (v3)
  {
    dispatch_source_cancel(v3);
    dispatch_release(*(dispatch_object_t *)(a1 + 64));
    *(void *)(a1 + 64) = 0LL;
  }

  *(void *)(a1 + 4_Block_object_dispose(va, 8) = 0LL;
}

void sub_1001290FC(uint64_t a1, uint64_t a2)
{
  uint64_t valuePtr = a2;
  if (a1)
  {
    CFIndex Count = CFArrayGetCount(*(CFArrayRef *)(a1 + 16));
    if (Count >= 1)
    {
      CFIndex v4 = Count;
      CFIndex v5 = 0LL;
      while (1)
      {
        unint64_t v9 = 0xAAAAAAAAAAAAAAAALL;
        ValueAtIndex = (const __CFData *)CFArrayGetValueAtIndex(*(CFArrayRef *)(a1 + 16), v5);
        if (ValueAtIndex)
        {
          v11.location = 0LL;
          v11.length = 8LL;
          CFDataGetBytes(ValueAtIndex, v11, (UInt8 *)&v9);
          if (valuePtr == v9)
          {
            CFNumberRef v7 = CFNumberCreate(kCFAllocatorDefault, kCFNumberSInt64Type, &valuePtr);
            if (v7) {
              break;
            }
          }
        }

        if (v4 == ++v5) {
          return;
        }
      }

      CFNumberRef v8 = v7;
      CFSetAddValue(*(CFMutableSetRef *)(a1 + 80), v7);
      CFRelease(v8);
    }
  }

void sub_1001291CC(uint64_t a1)
{
  if (a1)
  {
    CFNumberRef v2 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      [(id)qword_100219F60 WFLog:3 message:"Resetting deferred command queue IDs"];
    }
    objc_autoreleasePoolPop(v2);
    CFIndex idx = -1LL;
    uint64_t v3 = sub_100128850(a1, &idx);
    CFSetRemoveAllValues(*(CFMutableSetRef *)(a1 + 80));
    if (v3)
    {
      ValueAtIndex = CFArrayGetValueAtIndex(*(CFArrayRef *)(a1 + 16), idx);
      CFArrayInsertValueAtIndex(*(CFMutableArrayRef *)(a1 + 16), 0LL, ValueAtIndex);
      CFArrayRemoveValueAtIndex(*(CFMutableArrayRef *)(a1 + 16), idx + 1);
    }

    else
    {
      sub_100128950(a1, 0);
    }
  }

void sub_100129284(uint64_t a1, uint64_t a2)
{
  if (a1)
  {
    CFNumberRef v2 = *(dispatch_source_s **)(a1 + 64);
    if (v2)
    {
      dispatch_time_t v3 = dispatch_time(0LL, 1000000000 * a2);
      dispatch_source_set_timer(v2, v3, 0xFFFFFFFFFFFFFFFFLL, 0LL);
    }
  }

void sub_1001292D8(uint64_t a1)
{
  CFNumberRef v2 = *(const void **)(a1 + 16);
  if (v2)
  {
    CFRelease(v2);
    *(void *)(a1 + 16) = 0LL;
  }

  dispatch_time_t v3 = *(const void **)(a1 + 80);
  if (v3)
  {
    CFRelease(v3);
    *(void *)(a1 + 80) = 0LL;
  }

void sub_100129998(_Unwind_Exception *a1)
{
}

void sub_1001299B4(uint64_t a1, void *a2, uint64_t a3)
{
  CFIndex v4 = (id *)(a1 + 32);
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained(v4);
  [WeakRetained _kvsDidChangeWithKeys:v5 isExternal:a3];
}

void sub_100129FD4(id a1)
{
  if (objc_opt_class(&OBJC_CLASS___WAClient))
  {
    id v1 = -[WiFiManagerAnalytics _initPrivate](objc_alloc(&OBJC_CLASS___WiFiManagerAnalytics), "_initPrivate");
    uint64_t v2 = (void *)qword_100219E48;
    qword_100219E48 = (uint64_t)v1;
  }

void sub_10012A0E0(id a1, id a2, NSError *a3)
{
  id v6 = a2;
  CFIndex v4 = a3;
  if (v4)
  {
    id v5 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      objc_msgSend( (id)qword_100219F60,  "WFLog:message:",  4,  "Failed to register for WAGroupTypeWiFi with the WA daemon (wifianalyticsd). Error code: %ld. *** All message/met ric submission is likely broken.",  -[NSError code](v4, "code"),  v6);
    }
    objc_autoreleasePoolPop(v5);
  }
}

void sub_10012A168(id a1, id a2, NSError *a3)
{
  id v6 = a2;
  CFIndex v4 = a3;
  if (v4)
  {
    id v5 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      objc_msgSend( (id)qword_100219F60,  "WFLog:message:",  4,  "Failed to register for WAGroupTypeWiFi with the WA daemon (wifianalyticsd). Error code: %ld. *** All message/met ric submission is likely broken.",  -[NSError code](v4, "code"),  v6);
    }
    objc_autoreleasePoolPop(v5);
  }
}

void sub_10012A1F0(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  if (v5)
  {
    id v6 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      objc_msgSend( (id)qword_100219F60,  "WFLog:message:",  4,  "Failed to register for WAGroupTypeWiFi with the WA daemon (wifianalyticsd). Error code: %ld. *** All message/met ric submission is likely broken.",  objc_msgSend(v5, "code"),  v7);
    }
    objc_autoreleasePoolPop(v6);
  }

  else
  {
    [*(id *)(a1 + 32) setHasRegisteredWithDaemon:1];
  }
}

void sub_10012A44C(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  if ([v5 code] == (id)9009)
  {
    [*(id *)(a1 + 32) _register];
  }

  else
  {
    id v6 = objc_autoreleasePoolPush();
    id v7 = (void *)qword_100219F60;
    if (v5)
    {
      if (qword_100219F60)
      {
        CFNumberRef v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) key]);
        [v7 WFLog:4, "FAILED to submit GeoServices message with key: %@. Error: %@", v8, v5 message];
      }
    }

    else if (qword_100219F60)
    {
      objc_msgSend( (id)qword_100219F60,  "WFLog:message:",  3,  "%s Successfully submitted GEOWiFiConnectionQuality instance",  "-[WiFiManagerAnalytics submitGeoServicesMessage:]_block_invoke");
    }

    objc_autoreleasePoolPop(v6);
  }
}

void sub_10012A5C0(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  id v6 = objc_autoreleasePoolPush();
  id v7 = (void *)qword_100219F60;
  if (v5)
  {
    if (qword_100219F60)
    {
      CFNumberRef v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) key]);
      [v7 WFLog:4, "FAILED to submit datapath diagnostics message with key: %@. Error: %@", v8, v5 message];
    }
  }

  else if (qword_100219F60)
  {
    objc_msgSend( (id)qword_100219F60,  "WFLog:message:",  3,  "%s Successfully submitted WiFiDiagnostics instance",  "-[WiFiManagerAnalytics triggerDatapathDiagnosticsNoReply:]_block_invoke");
  }

  objc_autoreleasePoolPop(v6);
}

void sub_10012A740( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
}

void sub_10012A764(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if ([v5 code] == (id)9009)
  {
    [WeakRetained _register];
  }

  else if (v5)
  {
    id v7 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      [(id)qword_100219F60 WFLog:4 message:"FAILED to  set Device Analytics config."];
    }
    objc_autoreleasePoolPop(v7);
  }
}

void sub_10012A8A0(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  if (v5)
  {
    id v6 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      [(id)qword_100219F60 WFLog:4, "Failed to trigger perf study! Error: %@ -  %s", v5, "-[WiFiManagerAnalytics getDeviceAnalyticsConfigurationWithCompletion:]_block_invoke" message];
    }
LABEL_4:
    objc_autoreleasePoolPop(v6);
    id v7 = 0LL;
    goto LABEL_7;
  }

  if (!v10)
  {
    id v6 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      objc_msgSend( (id)qword_100219F60,  "WFLog:message:",  4,  "%s result is nil",  "-[WiFiManagerAnalytics getDeviceAnalyticsConfigurationWithCompletion:]_block_invoke",  v9);
    }
    goto LABEL_4;
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithDictionary:](&OBJC_CLASS___NSDictionary, "dictionaryWithDictionary:"));
LABEL_7:
  uint64_t v8 = *(void *)(a1 + 32);
  if (v8) {
    (*(void (**)(uint64_t, void *))(v8 + 16))(v8, v7);
  }
}

void sub_10012AA30(uint64_t a1, void *a2, void *a3)
{
  id v12 = a2;
  id v5 = a3;
  if (v5)
  {
    id v6 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      [(id)qword_100219F60 WFLog:4, "Failed to trigger DeviceAnalyticsStore! Error: %@ -  %s", v5, "-[WiFiManagerAnalytics triggerDeviceAnalyticsStoreMigrationWithCompletion:]_block_invoke" message];
    }
    objc_autoreleasePoolPop(v6);
    if ([v5 code] == (id)9009) {
      [*(id *)(a1 + 32) _register];
    }
LABEL_15:
    id v7 = 0LL;
    goto LABEL_16;
  }

  if (!v12)
  {
    id v10 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      objc_msgSend( (id)qword_100219F60,  "WFLog:message:",  4,  "%s result for triggerDeviceAnalyticsStoreMigration is nil",  "-[WiFiManagerAnalytics triggerDeviceAnalyticsStoreMigrationWithCompletion:]_block_invoke");
    }
    objc_autoreleasePoolPop(v10);
    goto LABEL_15;
  }

  id v7 = [v12 BOOLValue];
  uint64_t v8 = objc_autoreleasePoolPush();
  if (qword_100219F60)
  {
    uint64_t v9 = "NO";
    if ((_DWORD)v7) {
      uint64_t v9 = "YES";
    }
    objc_msgSend( (id)qword_100219F60,  "WFLog:message:",  4,  "%s triggerDeviceAnalyticsStoreMigration success? %s",  "-[WiFiManagerAnalytics triggerDeviceAnalyticsStoreMigrationWithCompletion:]_block_invoke",  v9);
  }

  objc_autoreleasePoolPop(v8);
LABEL_16:
  uint64_t v11 = *(void *)(a1 + 40);
  if (v11) {
    (*(void (**)(uint64_t, id))(v11 + 16))(v11, v7);
  }
}

void sub_10012AD88(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (!v5)
  {
    id v7 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      objc_msgSend( (id)qword_100219F60,  "WFLog:message:",  4,  "standard reply produced a null message.. identifier: %u",  *(unsigned int *)(a1 + 48));
    }
    objc_autoreleasePoolPop(v7);
  }

  if (*(void *)(a1 + 40))
  {
    uint64_t v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) serialQ]);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10012AEDC;
    block[3] = &unk_1001E5D58;
    uint64_t v9 = *(void **)(a1 + 40);
    block[4] = *(void *)(a1 + 32);
    id v14 = v9;
    id v12 = v5;
    id v13 = v6;
    dispatch_async(v8, block);
  }

  else
  {
    id v10 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      objc_msgSend( (id)qword_100219F60,  "WFLog:message:",  3,  "%s NULL reply supplied trying to process: %u",  "-[WiFiManagerAnalytics prepareMessageForSubmission:withData:andReply:]_block_invoke",  *(unsigned int *)(a1 + 48));
    }
    objc_autoreleasePoolPop(v10);
  }
}

void sub_10012AEDC(void *a1)
{
  uint64_t v2 = objc_autoreleasePoolPush();
  id v3 = [(id)objc_opt_class(a1[4]) instanceMethodSignatureForSelector:"_runReplyBlock:withMessage:andError:"];
  CFIndex v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSInvocation invocationWithMethodSignature:]( &OBJC_CLASS___NSInvocation,  "invocationWithMethodSignature:",  v4));

  [v5 setSelector:"_runReplyBlock:withMessage:andError:"];
  [v5 setTarget:a1[4]];
  if (a1[7]) {
    [v5 setArgument:a1 + 7 atIndex:2];
  }
  if (a1[5]) {
    [v5 setArgument:a1 + 5 atIndex:3];
  }
  id v6 = a1 + 6;
  if (a1[6]) {
    [v5 setArgument:v6 atIndex:4];
  }
  objc_msgSend(v5, "retainArguments", v6);
  id v7 = *(dispatch_queue_s **)(a1[4] + 16LL);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10012B03C;
  block[3] = &unk_1001E2520;
  id v11 = v5;
  id v8 = v5;
  dispatch_block_t v9 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_BACKGROUND, 0, block);
  dispatch_sync(v7, v9);

  objc_autoreleasePoolPop(v2);
}

id sub_10012B03C(uint64_t a1)
{
  return [*(id *)(a1 + 32) invoke];
}

void sub_10012B044(uint64_t a1)
{
  uint64_t v2 = objc_autoreleasePoolPush();
  int v3 = *(_DWORD *)(a1 + 56);
  switch(v3)
  {
    case 11075584:
      [*(id *)(a1 + 32) _populateDPSNotificationMessage:*(void *)(a1 + 48) andReply:*(void *)(a1 + 40)];
      break;
    case 11075585:
      [*(id *)(a1 + 32) _populateDPSProbeResultMessage:*(void *)(a1 + 48) andReply:*(void *)(a1 + 40)];
      break;
    case 11075586:
      [*(id *)(a1 + 32) _populateDPSLinkStateChangeMessage:*(void *)(a1 + 48) andReply:*(void *)(a1 + 40)];
      break;
    case 11075587:
      [*(id *)(a1 + 32) _populateDPSAPInfoMessage:*(void *)(a1 + 48) andReply:*(void *)(a1 + 40)];
      break;
    case 11075588:
      [*(id *)(a1 + 32) _populateSlowWiFiNotificationMessage:*(void *)(a1 + 48) andReply:*(void *)(a1 + 40)];
      break;
    default:
      if (v3 == 10027009)
      {
        [*(id *)(a1 + 32) _populateWiFiConnectionQualityMessageWithScorecard:*(void *)(a1 + 48) andReply:*(void *)(a1 + 40)];
      }

      else
      {
        CFIndex v4 = objc_autoreleasePoolPush();
        if (qword_100219F60) {
          objc_msgSend( (id)qword_100219F60,  "WFLog:message:",  4,  "[WiFiManagerAnalytics prepareMessageForSubmission] Unhandled message ID: %u",  *(unsigned int *)(a1 + 56));
        }
        objc_autoreleasePoolPop(v4);
      }

      break;
  }

  objc_autoreleasePoolPop(v2);
}

void sub_10012B4E8(id *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v25[0] = 0LL;
  v25[1] = v25;
  v25[2] = 0x3032000000LL;
  v25[3] = sub_10012B75C;
  v25[4] = sub_10012B76C;
  id v26 = 0LL;
  if (v6)
  {
    id v12 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      objc_msgSend( (id)qword_100219F60,  "WFLog:message:",  3,  "Failed to register for WAGroupTypeWiFiGeoServices, can't submit ConnectionQuality message");
    }
    objc_autoreleasePoolPop(v12);
    (*((void (**)(void))a1[6] + 2))();
  }

  else
  {
    id v7 = dispatch_group_create();
    dispatch_group_enter(v7);
    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[WAClient sharedClient](&OBJC_CLASS___WAClient, "sharedClient"));
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472LL;
    v20[2] = sub_10012B774;
    v20[3] = &unk_1001E5DD0;
    v24 = v25;
    id v21 = 0LL;
    id v22 = a1[4];
    dispatch_block_t v9 = v7;
    v23 = v9;
    [v8 getNewMessageForKey:@"CQ" groupType:2 andReply:v20];

    id v10 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([a1[5] serialQ]);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10012C934;
    block[3] = &unk_1001E5E20;
    CFRange v19 = v25;
    id v18 = a1[4];
    dispatch_group_notify(v9, v10, block);

    id v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([a1[5] serialQ]);
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_10012CE70;
    v13[3] = &unk_1001E5E70;
    qos_class_t v16 = v25;
    id v14 = a1[4];
    id v15 = a1[6];
    dispatch_group_notify(v9, v11, v13);
  }

  _Block_object_dispose(v25, 8);
}

void sub_10012B744(_Unwind_Exception *a1)
{
}

uint64_t sub_10012B75C(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_10012B76C(uint64_t a1)
{
}

void sub_10012B774(uint64_t a1, void *a2, void *a3)
{
  id v123 = a2;
  id v6 = a3;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 40LL), a2);
  if (v6 || (id v7 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8LL) + 40LL)) == 0LL)
  {
    v122 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      [(id)qword_100219F60 WFLog:3, "%s failed to get CQ message instance, error: %@", "-[WiFiManagerAnalytics _populateWiFiConnectionQualityMessageWithScorecard:andReply:]_block_invoke", *(void *)(a1 + 32) message];
    }
    objc_autoreleasePoolPop(v122);
  }

  else
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 fieldForKey:@"CQ_overAllStay"]);
    dispatch_block_t v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) objectForKeyedSubscript:@"overallStay"]);
    objc_msgSend(v8, "setUint64Value:", objc_msgSend(v9, "unsignedLongLongValue"));

    id v10 = (void *)objc_claimAutoreleasedReturnValue( [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) fieldForKey:@"CQ_lowLQMStay"]);
    id v11 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) objectForKeyedSubscript:@"lowLqmStay"]);
    objc_msgSend(v10, "setUint64Value:", objc_msgSend(v11, "unsignedLongLongValue"));

    id v12 = (void *)objc_claimAutoreleasedReturnValue( [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) fieldForKey:@"CQ_faultyStay"]);
    id v13 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) objectForKeyedSubscript:@"faultyStay"]);
    objc_msgSend(v12, "setUint64Value:", objc_msgSend(v13, "unsignedLongLongValue"));

    id v14 = (void *)objc_claimAutoreleasedReturnValue( [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) fieldForKey:@"CQ_lqmTranCount"]);
    id v15 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) objectForKeyedSubscript:@"lqmTransitionCount"]);
    objc_msgSend(v14, "setUint64Value:", objc_msgSend(v15, "unsignedLongLongValue"));

    qos_class_t v16 = (void *)objc_claimAutoreleasedReturnValue( [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) fieldForKey:@"CQ_packetsIn"]);
    CFIndex v17 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) objectForKeyedSubscript:@"packetsIn"]);
    objc_msgSend(v16, "setUint64Value:", objc_msgSend(v17, "unsignedLongLongValue"));

    id v18 = (void *)objc_claimAutoreleasedReturnValue( [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) fieldForKey:@"CQ_packetsOut"]);
    CFRange v19 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) objectForKeyedSubscript:@"packetsOut"]);
    objc_msgSend(v18, "setUint64Value:", objc_msgSend(v19, "unsignedLongLongValue"));

    CFRange v20 = (void *)objc_claimAutoreleasedReturnValue( [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) fieldForKey:@"CQ_bytesInTotal"]);
    id v21 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) objectForKeyedSubscript:@"bytesIn"]);
    objc_msgSend(v20, "setUint64Value:", objc_msgSend(v21, "unsignedLongLongValue"));

    id v22 = (void *)objc_claimAutoreleasedReturnValue( [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) fieldForKey:@"CQ_bytesOutTotal"]);
    v23 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) objectForKeyedSubscript:@"bytesOut"]);
    objc_msgSend(v22, "setUint64Value:", objc_msgSend(v23, "unsignedLongLongValue"));

    v24 = (void *)objc_claimAutoreleasedReturnValue( [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) fieldForKey:@"CQ_reTxBytes"]);
    v25 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) objectForKeyedSubscript:@"reTxBytes"]);
    objc_msgSend(v24, "setUint64Value:", objc_msgSend(v25, "unsignedLongLongValue"));

    id v26 = (void *)objc_claimAutoreleasedReturnValue( [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) fieldForKey:@"CQ_dataStalls"]);
    v27 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) objectForKeyedSubscript:@"dataStalls"]);
    objc_msgSend(v26, "setUint64Value:", objc_msgSend(v27, "unsignedLongLongValue"));

    v28 = (void *)objc_claimAutoreleasedReturnValue( [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) fieldForKey:@"CQ_receivedDupes"]);
    v29 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) objectForKeyedSubscript:@"rxDupeBytes"]);
    objc_msgSend(v28, "setUint64Value:", objc_msgSend(v29, "unsignedLongLongValue"));

    v30 = (void *)objc_claimAutoreleasedReturnValue( [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) fieldForKey:@"CQ_rxOutOfOrderBytes"]);
    v31 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) objectForKeyedSubscript:@"rxOOOBytes"]);
    objc_msgSend(v30, "setUint64Value:", objc_msgSend(v31, "unsignedLongLongValue"));

    v32 = (void *)objc_claimAutoreleasedReturnValue( [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) fieldForKey:@"CQ_roundTripTimeMin"]);
    v33 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) objectForKeyedSubscript:@"rttMin"]);
    [v33 floatValue];
    objc_msgSend(v32, "setFloatValue:");

    v34 = (void *)objc_claimAutoreleasedReturnValue( [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) fieldForKey:@"CQ_roundTripTimeAvg"]);
    v35 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) objectForKeyedSubscript:@"rttAvg"]);
    [v35 floatValue];
    objc_msgSend(v34, "setFloatValue:");

    v36 = (void *)objc_claimAutoreleasedReturnValue( [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) fieldForKey:@"CQ_roundTripTimeVar"]);
    v37 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) objectForKeyedSubscript:@"rttVar"]);
    [v37 floatValue];
    objc_msgSend(v36, "setFloatValue:");

    v38 = (void *)objc_claimAutoreleasedReturnValue( [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) fieldForKey:@"CQ_successfulConnections"]);
    v39 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) objectForKeyedSubscript:@"connSuccesses"]);
    objc_msgSend(v38, "setUint64Value:", objc_msgSend(v39, "unsignedLongLongValue"));

    v40 = (void *)objc_claimAutoreleasedReturnValue( [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) fieldForKey:@"CQ_failedConnections"]);
    v41 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) objectForKeyedSubscript:@"connAttempts"]);
    v42 = [v41 unsignedLongLongValue];
    v43 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) objectForKeyedSubscript:@"connSuccesses"]);
    objc_msgSend(v40, "setUint64Value:", v42 - (_BYTE *)objc_msgSend(v43, "unsignedLongLongValue"));

    v44 = (void *)objc_claimAutoreleasedReturnValue( [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) fieldForKey:@"CQ_sslConnectionCount"]);
    v45 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) objectForKeyedSubscript:@"connAttempts"]);
    objc_msgSend(v44, "setUint32Value:", objc_msgSend(v45, "unsignedIntegerValue"));

    v46 = (void *)objc_claimAutoreleasedReturnValue( [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) fieldForKey:@"CQ_sslErrorCount"]);
    v47 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) objectForKeyedSubscript:@"certErrors"]);
    objc_msgSend(v46, "setUint32Value:", objc_msgSend(v47, "unsignedIntegerValue"));

    v48 = (void *)objc_claimAutoreleasedReturnValue( [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) fieldForKey:@"CQ_bytesInActive"]);
    v49 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) objectForKeyedSubscript:@"ppaActiveUseBytesIn"]);
    objc_msgSend(v48, "setUint64Value:", objc_msgSend(v49, "unsignedLongLongValue"));

    v50 = (void *)objc_claimAutoreleasedReturnValue( [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) fieldForKey:@"CQ_bytesOutActive"]);
    v51 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) objectForKeyedSubscript:@"ppaActiveUseBytesOut"]);
    objc_msgSend(v50, "setUint64Value:", objc_msgSend(v51, "unsignedLongLongValue"));

    v52 = (void *)objc_claimAutoreleasedReturnValue( [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) fieldForKey:@"CQ_roundTripTimeAvgActive"]);
    v53 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) objectForKeyedSubscript:@"ppaActiveUseRttAvg"]);
    [v53 floatValue];
    objc_msgSend(v52, "setFloatValue:");

    v54 = (void *)objc_claimAutoreleasedReturnValue( [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) fieldForKey:@"CQ_roundTripTimeMinActive"]);
    v55 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) objectForKeyedSubscript:@"ppaActiveUseRttMin"]);
    [v55 floatValue];
    objc_msgSend(v54, "setFloatValue:");

    v56 = (void *)objc_claimAutoreleasedReturnValue( [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) fieldForKey:@"CQ_roundTripTimeVarActive"]);
    v57 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) objectForKeyedSubscript:@"ppaAactiveUseRttVar"]);
    [v57 floatValue];
    objc_msgSend(v56, "setFloatValue:");

    v58 = (void *)objc_claimAutoreleasedReturnValue( [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) fieldForKey:@"CQ_cca"]);
    v59 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) objectForKeyedSubscript:@"ppaCCA"]);
    objc_msgSend(v58, "setInt32Value:", objc_msgSend(v59, "integerValue"));

    v60 = (void *)objc_claimAutoreleasedReturnValue( [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) fieldForKey:@"CQ_rssi"]);
    v61 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) objectForKeyedSubscript:@"ppaRSSI"]);
    objc_msgSend(v60, "setInt32Value:", objc_msgSend(v61, "integerValue"));

    v62 = (void *)objc_claimAutoreleasedReturnValue( [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) fieldForKey:@"CQ_snr"]);
    v63 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) objectForKeyedSubscript:@"ppaSNR"]);
    objc_msgSend(v62, "setInt32Value:", objc_msgSend(v63, "integerValue"));

    v64 = (void *)objc_claimAutoreleasedReturnValue( [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) fieldForKey:@"CQ_uniqueID"]);
    v65 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) objectForKeyedSubscript:@"ppaBSSIDConnected"]);
    [v64 setStringValue:v65];

    v66 = (void *)objc_claimAutoreleasedReturnValue( [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) fieldForKey:@"CQ_hotspot20"]);
    v67 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) objectForKeyedSubscript:@"ppaHS2"]);
    objc_msgSend(v66, "setBoolValue:", objc_msgSend(v67, "BOOLValue"));

    v68 = (void *)objc_claimAutoreleasedReturnValue( [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) fieldForKey:@"CQ_band"]);
    v69 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) objectForKeyedSubscript:@"ppaBand"]);
    objc_msgSend(v68, "setUint32Value:", objc_msgSend(v69, "unsignedIntegerValue"));

    v70 = (void *)objc_claimAutoreleasedReturnValue( [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) fieldForKey:@"CQ_channel"]);
    v71 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) objectForKeyedSubscript:@"ppaChannel"]);
    objc_msgSend(v70, "setUint32Value:", objc_msgSend(v71, "unsignedIntegerValue"));

    v72 = (void *)objc_claimAutoreleasedReturnValue( [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) fieldForKey:@"CQ_channelWidth"]);
    v73 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) objectForKeyedSubscript:@"ppaChWidth"]);
    objc_msgSend(v72, "setUint32Value:", objc_msgSend(v73, "unsignedIntegerValue"));

    v74 = (void *)objc_claimAutoreleasedReturnValue( [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) fieldForKey:@"CQ_phyMode"]);
    v75 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) objectForKeyedSubscript:@"ppaPhyMode"]);
    objc_msgSend(v74, "setUint32Value:", objc_msgSend(v75, "unsignedIntegerValue"));

    v76 = (void *)objc_claimAutoreleasedReturnValue( [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) fieldForKey:@"CQ_timeOfDay"]);
    v77 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) objectForKeyedSubscript:@"ppaTimeOfDay"]);
    objc_msgSend(v76, "setUint64Value:", objc_msgSend(v77, "unsignedLongLongValue"));

    v78 = (void *)objc_claimAutoreleasedReturnValue( [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) fieldForKey:@"CQ_networkType"]);
    v79 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) objectForKeyedSubscript:@"ppaAdvertisedNetworkType"]);
    objc_msgSend(v78, "setInt32Value:", objc_msgSend(v79, "unsignedIntegerValue"));

    v80 = (void *)objc_claimAutoreleasedReturnValue( [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) fieldForKey:@"CQ_wasCaptiveFlag"]);
    v81 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) objectForKeyedSubscript:@"ppaWasCaptive"]);
    objc_msgSend(v80, "setUint32Value:", objc_msgSend(v81, "BOOLValue"));

    v82 = (void *)objc_claimAutoreleasedReturnValue( [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) fieldForKey:@"CQ_networkOrigin"]);
    v83 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) objectForKeyedSubscript:@"ppaNetworkOriginator"]);
    objc_msgSend(v82, "setInt32Value:", objc_msgSend(v83, "intValue") + 1);

    v84 = (void *)objc_claimAutoreleasedReturnValue( [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) fieldForKey:@"CQ_topDLRate"]);
    v85 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) objectForKeyedSubscript:@"topDownloadRate"]);
    [v85 floatValue];
    objc_msgSend(v84, "setFloatValue:");

    v86 = (void *)objc_claimAutoreleasedReturnValue( [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) fieldForKey:@"CQ_isKnownGood"]);
    v87 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) objectForKeyedSubscript:@"isKnownGood"]);
    objc_msgSend(v86, "setBoolValue:", objc_msgSend(v87, "intValue") != 0);

    v88 = (void *)objc_claimAutoreleasedReturnValue( [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) fieldForKey:@"CQ_lowInternetDL"]);
    v89 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) objectForKeyedSubscript:@"isLowInternetDL"]);
    objc_msgSend(v88, "setBoolValue:", objc_msgSend(v89, "BOOLValue"));

    v90 = (void *)objc_claimAutoreleasedReturnValue( [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) fieldForKey:@"CQ_lowInternetUL"]);
    v91 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) objectForKeyedSubscript:@"isLowInternetUL"]);
    objc_msgSend(v90, "setBoolValue:", objc_msgSend(v91, "BOOLValue"));

    v92 = (void *)objc_claimAutoreleasedReturnValue( [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) fieldForKey:@"CQ_isEdgeBSS"]);
    v93 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) objectForKeyedSubscript:@"ppaIsEdgeBSS"]);
    objc_msgSend(v92, "setBoolValue:", objc_msgSend(v93, "BOOLValue"));

    v94 = (void *)objc_claimAutoreleasedReturnValue( [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) fieldForKey:@"CQ_authTraits"]);
    v95 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) objectForKeyedSubscript:@"ppaSecType"]);
    if (v95)
    {
      v96 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) objectForKeyedSubscript:@"ppaSecType"]);
      unsigned __int8 v97 = [v96 unsignedIntegerValue];
      if ((v97 & 8) != 0)
      {
        uint64_t v98 = 4LL;
      }

      else if ((v97 & 2) != 0)
      {
        uint64_t v98 = 3LL;
      }

      else if ((v97 & 1) != 0)
      {
        uint64_t v98 = 2LL;
      }

      else
      {
        uint64_t v98 = 1LL;
      }

      [v94 addRepeatableInt32Value:v98];
    }

    else
    {
      [v94 addRepeatableInt32Value:1];
    }

    v99 = (void *)objc_claimAutoreleasedReturnValue( [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) fieldForKey:@"CQ_associationReason"]);
    v100 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) objectForKeyedSubscript:@"ppaAssocReason"]);
    objc_msgSend(v99, "setInt32Value:", objc_msgSend(v100, "integerValue"));

    v101 = (void *)objc_claimAutoreleasedReturnValue( [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) fieldForKey:@"CQ_disassociationReason"]);
    v102 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) objectForKeyedSubscript:@"ppaDisassocReason"]);
    objc_msgSend(v101, "setInt32Value:", objc_msgSend(v102, "integerValue"));

    v103 = (void *)objc_claimAutoreleasedReturnValue( [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) fieldForKey:@"CQ_captiveDetermination"]);
    v104 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) objectForKeyedSubscript:@"ppaCaptiveFlag"]);
    objc_msgSend(v103, "setInt32Value:", objc_msgSend(v104, "integerValue"));

    v105 = (void *)objc_claimAutoreleasedReturnValue( [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) fieldForKey:@"CQ_apMode"]);
    v106 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) objectForKeyedSubscript:@"ppaAPMode"]);
    objc_msgSend(v105, "setInt32Value:", objc_msgSend(v106, "integerValue"));

    v107 = (void *)objc_claimAutoreleasedReturnValue( [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) fieldForKey:@"CQ_associationLength"]);
    v108 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) objectForKeyedSubscript:@"ppaAssociatedTime"]);
    objc_msgSend(v107, "setInt32Value:", objc_msgSend(v108, "integerValue"));

    v109 = (void *)objc_claimAutoreleasedReturnValue( [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) fieldForKey:@"CQ_location"]);
    v110 = (void *)objc_claimAutoreleasedReturnValue([v109 subMessageValue]);
    v111 = (void *)objc_claimAutoreleasedReturnValue([v110 fieldForKey:@"GEOL_latLng"]);
    v112 = (void *)objc_claimAutoreleasedReturnValue([v111 subMessageValue]);

    v113 = (void *)objc_claimAutoreleasedReturnValue([v112 fieldForKey:@"GEOLL_lat"]);
    v114 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) objectForKeyedSubscript:@"ppaLat"]);
    [v114 doubleValue];
    objc_msgSend(v113, "setDoubleValue:");

    v115 = (void *)objc_claimAutoreleasedReturnValue([v112 fieldForKey:@"GEOLL_lng"]);
    v116 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) objectForKeyedSubscript:@"ppaLon"]);
    [v116 doubleValue];
    objc_msgSend(v115, "setDoubleValue:");

    v117 = (void *)objc_claimAutoreleasedReturnValue( [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) fieldForKey:@"CQ_identifier"]);
    v118 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) objectForKeyedSubscript:@"ppaSSID"]);
    [v117 setStringValue:v118];

    uint64_t v120 = objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) objectForKeyedSubscript:@"ppaColoState"]);
    unsigned int v119 = [(id)v120 unsignedIntegerValue];

    LODWORD(v120) = 0;
    do
    {
      if (((v119 >> v120) & 1) != 0)
      {
        v121 = (void *)objc_claimAutoreleasedReturnValue( [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) fieldForKey:@"CQ_traits"]);
        uint64_t v120 = (v120 + 1);
        [v121 addRepeatableInt32Value:v120];
      }

      else
      {
        LODWORD(v120) = v120 + 1;
      }
    }

    while ((_DWORD)v120 != 5);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

void sub_10012C934(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[WAClient sharedClient](&OBJC_CLASS___WAClient, "sharedClient"));
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10012C9D4;
  v5[3] = &unk_1001E5DF8;
  __int128 v4 = *(_OWORD *)(a1 + 32);
  id v3 = (id)v4;
  __int128 v6 = v4;
  [v2 getNewMessageForKey:@"AP2" groupType:2 andReply:v5];
}

void sub_10012C9D4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (!v6 && v5 && *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL))
  {
    __int128 v48 = 0u;
    __int128 v49 = 0u;
    __int128 v46 = 0u;
    __int128 v47 = 0u;
    id v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) objectForKeyedSubscript:@"ppaBSSIDsMatchingSSID"]);
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 allObjects]);

    id obj = v8;
    id v9 = [v8 countByEnumeratingWithState:&v46 objects:v51 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v47;
      do
      {
        for (CFIndex i = 0LL; i != v10; CFIndex i = (char *)i + 1)
        {
          if (*(void *)v47 != v11) {
            objc_enumerationMutation(obj);
          }
          id v13 = *(void **)(*((void *)&v46 + 1) + 8LL * (void)i);
          id v14 = [v5 copy];
          id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 fieldForKey:@"AP2_uniqueID"]);
          qos_class_t v16 = (void *)objc_claimAutoreleasedReturnValue([v13 bssid]);
          [v15 setStringValue:v16];

          CFIndex v17 = (void *)objc_claimAutoreleasedReturnValue([v14 fieldForKey:@"AP2_channel"]);
          id v18 = (void *)objc_claimAutoreleasedReturnValue([v13 channel]);
          objc_msgSend(v17, "setUint32Value:", objc_msgSend(v18, "unsignedIntValue"));

          CFRange v19 = (void *)objc_claimAutoreleasedReturnValue([v14 fieldForKey:@"AP2_rssi"]);
          CFRange v20 = (void *)objc_claimAutoreleasedReturnValue([v13 rssi]);
          objc_msgSend(v19, "setInt32Value:", objc_msgSend(v20, "intValue"));

          id v21 = (void *)objc_claimAutoreleasedReturnValue([v14 fieldForKey:@"AP2_origin"]);
          objc_msgSend(v21, "setInt32Value:", objc_msgSend(v13, "origin"));

          id v22 = (void *)objc_claimAutoreleasedReturnValue( [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) fieldForKey:@"CQ_essMembers"]);
          [v22 addRepeatableSubMessageValue:v14];
        }

        id v10 = [obj countByEnumeratingWithState:&v46 objects:v51 count:16];
      }

      while (v10);
    }

    __int128 v44 = 0u;
    __int128 v45 = 0u;
    __int128 v42 = 0u;
    __int128 v43 = 0u;
    v23 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) objectForKeyedSubscript:@"ppaBSSIDsNotMatchSSID"]);
    v24 = (void *)objc_claimAutoreleasedReturnValue([v23 allObjects]);

    id obja = v24;
    id v25 = [v24 countByEnumeratingWithState:&v42 objects:v50 count:16];
    if (v25)
    {
      id v26 = v25;
      uint64_t v27 = *(void *)v43;
      do
      {
        for (j = 0LL; j != v26; j = (char *)j + 1)
        {
          if (*(void *)v43 != v27) {
            objc_enumerationMutation(obja);
          }
          v29 = *(void **)(*((void *)&v42 + 1) + 8LL * (void)j);
          id v30 = [v5 copy];
          v31 = (void *)objc_claimAutoreleasedReturnValue([v30 fieldForKey:@"AP2_uniqueID"]);
          v32 = (void *)objc_claimAutoreleasedReturnValue([v29 bssid]);
          [v31 setStringValue:v32];

          v33 = (void *)objc_claimAutoreleasedReturnValue([v30 fieldForKey:@"AP2_channel"]);
          v34 = (void *)objc_claimAutoreleasedReturnValue([v29 channel]);
          objc_msgSend(v33, "setUint32Value:", objc_msgSend(v34, "unsignedIntValue"));

          v35 = (void *)objc_claimAutoreleasedReturnValue([v30 fieldForKey:@"AP2_rssi"]);
          v36 = (void *)objc_claimAutoreleasedReturnValue([v29 rssi]);
          objc_msgSend(v35, "setInt32Value:", objc_msgSend(v36, "intValue"));

          v37 = (void *)objc_claimAutoreleasedReturnValue([v30 fieldForKey:@"AP2_origin"]);
          objc_msgSend(v37, "setInt32Value:", objc_msgSend(v29, "origin"));

          v38 = (void *)objc_claimAutoreleasedReturnValue( [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) fieldForKey:@"CQ_nearbyBSSs"]);
          [v38 addRepeatableSubMessageValue:v30];
        }

        id v26 = [obja countByEnumeratingWithState:&v42 objects:v50 count:16];
      }

      while (v26);
    }

    id v6 = 0LL;
  }

  else
  {
    v39 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      [(id)qword_100219F60 WFLog:3, "%s Failed to get CQ or AP2 instance: %@", "-[WiFiManagerAnalytics _populateWiFiConnectionQualityMessageWithScorecard:andReply:]_block_invoke_3", v6 message];
    }
    objc_autoreleasePoolPop(v39);
  }
}

void sub_10012CE70(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[WAClient sharedClient](&OBJC_CLASS___WAClient, "sharedClient"));
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_10012CF20;
  v3[3] = &unk_1001E5E48;
  uint64_t v6 = *(void *)(a1 + 48);
  id v4 = *(id *)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  [v2 getNewMessageForKey:@"CST" groupType:2 andReply:v3];
}

void sub_10012CF20(uint64_t a1, void *a2, void *a3)
{
  id v12 = a2;
  id v5 = a3;
  if (!v5 && v12 && *(void *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL))
  {
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) objectForKeyedSubscript:@"ppaDLSpeed"]);

    if (v6)
    {
      id v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) objectForKeyedSubscript:@"ppaDLSpeed"]);
      id v8 = [v12 copy];
      id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 fieldForKey:@"CST_avgDL"]);
      [v7 floatValue];
      objc_msgSend(v9, "setFloatValue:");

      id v10 = (void *)objc_claimAutoreleasedReturnValue( [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) fieldForKey:@"CQ_speedTests"]);
      [v10 addRepeatableSubMessageValue:v8];
    }
  }

  else
  {
    uint64_t v11 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      [(id)qword_100219F60 WFLog:3, "%s Failed to get CQ or CST instance: %@", "-[WiFiManagerAnalytics _populateWiFiConnectionQualityMessageWithScorecard:andReply:]_block_invoke_5", v5 message];
    }
    objc_autoreleasePoolPop(v11);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
}

void sub_10012D204(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      [(id)qword_100219F60 WFLog:4, "%s: getNewMessageForKey DPSN message error: %@", "-[WiFiManagerAnalytics _populateDPSNotificationMessage:andReply:]_block_invoke", v6 message];
    }
LABEL_4:
    objc_autoreleasePoolPop(v7);
    goto LABEL_20;
  }

  CFBooleanRef BOOLean = 0LL;
  value = 0LL;
  if (!CFDictionaryGetValueIfPresent(*(CFDictionaryRef *)(a1 + 40), @"symptom", (const void **)&value))
  {
    id v7 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      objc_msgSend( (id)qword_100219F60,  "WFLog:message:",  4,  "%s Failed to get key kWiFiDPSSypmtom",  "-[WiFiManagerAnalytics _populateDPSNotificationMessage:andReply:]_block_invoke",  v14);
    }
    goto LABEL_4;
  }

  if (value)
  {
    LODWORD(valuePtr) = 0;
    CFNumberGetValue((CFNumberRef)value, kCFNumberSInt32Type, &valuePtr);
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v5 fieldForKey:@"DPSN_symptom"]);
    [v8 setInt32Value:valuePtr];
  }

  if (CFDictionaryGetValueIfPresent(*(CFDictionaryRef *)(a1 + 40), @"DPS_AC", (const void **)&value) && value)
  {
    LODWORD(valuePtr) = 0;
    CFNumberGetValue((CFNumberRef)value, kCFNumberSInt32Type, &valuePtr);
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v5 fieldForKey:@"DPSN_problemAC"]);
    [v9 setUint32Value:valuePtr];
  }

  if (CFDictionaryGetValueIfPresent(*(CFDictionaryRef *)(a1 + 40), @"DPS_CCA", (const void **)&value) && value)
  {
    LODWORD(valuePtr) = 0;
    CFNumberGetValue((CFNumberRef)value, kCFNumberSInt32Type, &valuePtr);
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v5 fieldForKey:@"DPSN_cca"]);
    [v10 setUint32Value:valuePtr];
  }

  if (CFDictionaryGetValueIfPresent(*(CFDictionaryRef *)(a1 + 40), @"DPS_TIMESTAMP", (const void **)&value)
    && value)
  {
    uint64_t valuePtr = 0LL;
    CFNumberGetValue((CFNumberRef)value, kCFNumberLongLongType, &valuePtr);
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v5 fieldForKey:@"DPSN_timestamp"]);
    [v11 setUint64Value:valuePtr];
  }

  if (CFDictionaryGetValueIfPresent( *(CFDictionaryRef *)(a1 + 40),  @"facetimeCallInProgress",  (const void **)&BOOLean)
    && BOOLean)
  {
    int v12 = CFBooleanGetValue(BOOLean);
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v5 fieldForKey:@"DPSN_facetimeCallInProgress"]);
    [v13 setBoolValue:v12 != 0];
  }

void sub_10012D528(uint64_t a1, void *a2, void *a3)
{
  id v15 = a2;
  id v5 = a3;
  if (v5)
  {
    id v6 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      [(id)qword_100219F60 WFLog:4, "%s: getNewMessageForKey DPSAPS message error: %@", "-[WiFiManagerAnalytics _populateDPSProbeResultMessage:andReply:]_block_invoke", v5 message];
    }
    objc_autoreleasePoolPop(v6);
  }

  else
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v15 fieldForKey:@"DPSAPS_rttGatewayBE"]);
    [v7 setUint32Value:**(unsigned int **)(a1 + 40)];

    id v8 = (void *)objc_claimAutoreleasedReturnValue([v15 fieldForKey:@"DPSAPS_rttGatewayBK"]);
    [v8 setUint32Value:*(unsigned int *)(*(void *)(a1 + 40) + 4)];

    id v9 = (void *)objc_claimAutoreleasedReturnValue([v15 fieldForKey:@"DPSAPS_rttGatewayVO"]);
    [v9 setUint32Value:*(unsigned int *)(*(void *)(a1 + 40) + 8)];

    id v10 = (void *)objc_claimAutoreleasedReturnValue([v15 fieldForKey:@"DPSAPS_rttGatewayVI"]);
    [v10 setUint32Value:*(unsigned int *)(*(void *)(a1 + 40) + 12)];

    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v15 fieldForKey:@"DPSAPS_rttPrimaryDnsBE"]);
    [v11 setUint32Value:0];

    int v12 = (void *)objc_claimAutoreleasedReturnValue([v15 fieldForKey:@"DPSAPS_rttPrimaryDnsBK"]);
    [v12 setUint32Value:0];

    id v13 = (void *)objc_claimAutoreleasedReturnValue([v15 fieldForKey:@"DPSAPS_rttPrimaryDnsVO"]);
    [v13 setUint32Value:0];

    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v15 fieldForKey:@"DPSAPS_rttPrimaryDnsVI"]);
    [v14 setUint32Value:0];
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_10012D7A0(uint64_t a1, void *a2, void *a3)
{
  id v14 = a2;
  id v5 = a3;
  if (v5)
  {
    id v6 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      [(id)qword_100219F60 WFLog:4, "%s: getNewMessageForKey WFAAWDWADAAD message error: %@", "-[WiFiManagerAnalytics _populateDPSLinkStateChangeMessage:andReply:]_block_invoke", v5 message];
    }
    objc_autoreleasePoolPop(v6);
  }

  else
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v14 fieldForKey:@"WFAAWDWADAAD_newBSSID"]);
    [v7 setBoolValue:*(_BYTE *)(*(void *)(a1 + 40) + 1) != 0];

    id v8 = (void *)objc_claimAutoreleasedReturnValue([v14 fieldForKey:@"WFAAWDWADAAD_changedChannel"]);
    [v8 setBoolValue:*(_BYTE *)(*(void *)(a1 + 40) + 2) != 0];

    id v9 = (void *)objc_claimAutoreleasedReturnValue([v14 fieldForKey:@"WFAAWDWADAAD_changedDNSPrimary"]);
    [v9 setBoolValue:**(_BYTE **)(a1 + 40) != 0];

    id v10 = (void *)objc_claimAutoreleasedReturnValue([v14 fieldForKey:@"WFAAWDWADAAD_changedDNSSecondary"]);
    [v10 setBoolValue:**(_BYTE **)(a1 + 40) != 0];

    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v14 fieldForKey:@"WFAAWDWADAAD_changedMAC"]);
    [v11 setBoolValue:*(_BYTE *)(*(void *)(a1 + 40) + 3) != 0];

    int v12 = (void *)objc_claimAutoreleasedReturnValue([v14 fieldForKey:@"WFAAWDWADAAD_eventType"]);
    [v12 setInt32Value:*(unsigned int *)(*(void *)(a1 + 40) + 8)];

    id v13 = (void *)objc_claimAutoreleasedReturnValue([v14 fieldForKey:@"WFAAWDWADAAD_additionalInfo"]);
    [v13 setUint32Value:*(unsigned int *)(*(void *)(a1 + 40) + 12)];
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_10012DA28(uint64_t a1, void *a2, void *a3)
{
  id v22 = a2;
  id v5 = a3;
  id v6 = objc_autoreleasePoolPush();
  if (v5)
  {
    if (qword_100219F60) {
      [(id)qword_100219F60 WFLog:4, "%s: getNewMessageForKey WFAAWDWAAAPI message error: %@", "-[WiFiManagerAnalytics _populateDPSAPInfoMessage:andReply:]_block_invoke", v5 message];
    }
    objc_autoreleasePoolPop(v6);
  }

  else
  {
    if (qword_100219F60) {
      [(id)qword_100219F60 WFLog:3 message:"Got WFAAWDWAAAPI WAGroupTypeWiFiDatapathDiagnostics WAMessage"];
    }
    objc_autoreleasePoolPop(v6);
    Value = CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 40), @"ManufacturerElement");
    if (Value)
    {
      id v8 = Value;
      id v9 = (void *)objc_claimAutoreleasedReturnValue([v22 fieldForKey:@"WFAAWDWAAAPI_manufacturerElement"]);
      [v9 setStringValue:v8];
    }

    id v10 = CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 40), @"ModelName");
    if (v10)
    {
      uint64_t v11 = v10;
      int v12 = (void *)objc_claimAutoreleasedReturnValue([v22 fieldForKey:@"WFAAWDWAAAPI_modelName"]);
      [v12 setStringValue:v11];
    }

    id v13 = CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 40), @"ModelNumber");
    if (v13)
    {
      id v14 = v13;
      id v15 = (void *)objc_claimAutoreleasedReturnValue([v22 fieldForKey:@"WFAAWDWAAAPI_modelNumber"]);
      [v15 setStringValue:v14];
    }

    qos_class_t v16 = CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 40), @"DeviceNameElement");
    if (v16)
    {
      CFIndex v17 = v16;
      id v18 = (void *)objc_claimAutoreleasedReturnValue([v22 fieldForKey:@"WFAAWDWAAAPI_deviceNameElement"]);
      [v18 setStringValue:v17];
    }

    CFRange v19 = CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 40), @"DeviceNameData");
    if (v19)
    {
      CFRange v20 = v19;
      id v21 = (void *)objc_claimAutoreleasedReturnValue([v22 fieldForKey:@"WFAAWDWAAAPI_deviceNameData"]);
      [v21 setStringValue:v20];
    }
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_10012DCB8(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      [(id)qword_100219F60 WFLog:4, "%s: getNewMessageForKey WFAAWDSWFN message error: %@", "-[WiFiManagerAnalytics _populateSlowWiFiNotificationMessage:andReply:]_block_invoke", v6 message];
    }
    objc_autoreleasePoolPop(v7);
  }

  else
  {
    CFBooleanRef BOOLean = 0LL;
    value = 0LL;
    if (CFDictionaryGetValueIfPresent( *(CFDictionaryRef *)(a1 + 40),  @"SLOWWIFI_ACTION_STAGE",  (const void **)&value))
    {
      BOOL v8 = value == 0LL;
    }

    else
    {
      BOOL v8 = 1;
    }

    if (!v8)
    {
      unsigned int valuePtr = 0;
      CFNumberGetValue((CFNumberRef)value, kCFNumberSInt32Type, &valuePtr);
      id v9 = (void *)objc_claimAutoreleasedReturnValue([v5 fieldForKey:@"WFAAWDSWFN_actionField"]);
      [v9 setUint32Value:valuePtr];
    }

    if (CFDictionaryGetValueIfPresent( *(CFDictionaryRef *)(a1 + 40),  @"SLOWWIFI_ACTION_TYPE",  (const void **)&value)
      && value)
    {
      unsigned int valuePtr = 0;
      CFNumberGetValue((CFNumberRef)value, kCFNumberSInt32Type, &valuePtr);
      id v10 = (void *)objc_claimAutoreleasedReturnValue([v5 fieldForKey:@"WFAAWDSWFN_recoveryAction"]);
      [v10 setUint32Value:valuePtr];
    }

    if (CFDictionaryGetValueIfPresent( *(CFDictionaryRef *)(a1 + 40),  @"SLOWWIFI_ACTION_REASON",  (const void **)&value)
      && value)
    {
      unsigned int valuePtr = 0;
      CFNumberGetValue((CFNumberRef)value, kCFNumberSInt32Type, &valuePtr);
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v5 fieldForKey:@"WFAAWDSWFN_recoveryReason"]);
      [v11 setUint32Value:valuePtr];
    }

    if (CFDictionaryGetValueIfPresent( *(CFDictionaryRef *)(a1 + 40),  @"SLOWWIFI_USER_INPUT",  (const void **)&value)
      && value)
    {
      unsigned int valuePtr = 0;
      CFNumberGetValue((CFNumberRef)value, kCFNumberSInt32Type, &valuePtr);
      int v12 = (void *)objc_claimAutoreleasedReturnValue([v5 fieldForKey:@"WFAAWDSWFN_userInput"]);
      [v12 setUint32Value:valuePtr];
    }

    if (CFDictionaryGetValueIfPresent( *(CFDictionaryRef *)(a1 + 40),  @"facetimeCallInProgress",  (const void **)&BOOLean)
      && BOOLean)
    {
      int v13 = CFBooleanGetValue(BOOLean);
      id v14 = (void *)objc_claimAutoreleasedReturnValue([v5 fieldForKey:@"WFAAWDSWFN_facetimeCallInProgress"]);
      [v14 setBoolValue:v13 != 0];
    }
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

id sub_10012DFAC(uint64_t a1)
{
  uint64_t v1 = *(const void **)a1;
  id v2 = *(id *)(a1 + 8);
  id v3 = objc_autoreleasePoolPush();
  if (qword_100219F60) {
    objc_msgSend((id)qword_100219F60, "WFLog:message:", 3, "%s: Enter", "WiFiMissingPasswordSoftErrorHandler");
  }
  objc_autoreleasePoolPop(v3);
  if (v2) {
    id v4 = [v2 incrementCount];
  }
  id v5 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Password for WiFi network '%@' is not in the keychain. If you did not recently delete or forget this network, please tap Yes to TTR and use Add Devices to collect data from *all* devices",  sub_100095BC8(v1));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  id v7 = [v2 askToLaunchTapToRadarWithMessage:v6 timeout:&stru_1001E5F00 completionHandler:60.0];
  if ((v7 & 1) != 0)
  {
    BOOL v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSURL URLWithString:]( &OBJC_CLASS___NSURL,  "URLWithString:",  @"tap-to-radar://new?Title=WiFi%20Password%20Missing%20From%20Keychain&AutoDiagnostics=phone&Description=WiFi%20Password%20Missing%20From%20Keychain&ComponentID=621547&ComponentName=WiFi%20Connectivity&ComponentVersion=iOS&Classification=Serious%20Bug%20&ExtensionIdentifiers=com.apple.DiagnosticExtensions.WiFi"));
    id v9 = [v2 tapToRadarWithURL:v8 completionHandler:&stru_1001E5F20];
  }

  else
  {
    id v10 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      objc_msgSend( (id)qword_100219F60,  "WFLog:message:",  3,  "%s: User declined the TTR",  "WiFiMissingPasswordSoftErrorHandler");
    }
    objc_autoreleasePoolPop(v10);
  }

  return v7;
}

void sub_10012E108(id a1, NSDictionary *a2, NSError *a3)
{
  id v6 = a2;
  id v4 = a3;
  id v5 = objc_autoreleasePoolPush();
  if (qword_100219F60) {
    [(id)qword_100219F60 WFLog:3, "%s: askToLaunchTapToRadarWithMessage result:%@, error:%@", "WiFiMissingPasswordSoftErrorHandler_block_invoke", v6, v4 message];
  }
  objc_autoreleasePoolPop(v5);
}

void sub_10012E188(id a1, NSDictionary *a2, NSError *a3)
{
  id v6 = a2;
  id v4 = a3;
  id v5 = objc_autoreleasePoolPush();
  if (qword_100219F60) {
    [(id)qword_100219F60 WFLog:3, "%s: WiFiMissingPasswordSoftError tapToRadarWithURL result:%@, error:%@", "WiFiMissingPasswordSoftErrorHandler_block_invoke_2", v6, v4 message];
  }
  objc_autoreleasePoolPop(v5);
}

void sub_10012E2F4(_Unwind_Exception *a1)
{
}

id sub_10012E668(uint64_t a1)
{
  id v2 = objc_autoreleasePoolPush();
  if (qword_100219F60)
  {
    if (*(_BYTE *)(*(void *)(a1 + 32) + 48LL)) {
      id v3 = "Started";
    }
    else {
      id v3 = "Stopped";
    }
    objc_msgSend( (id)qword_100219F60,  "WFLog:message:",  3,  "%s: %s tracking NOIs.",  "-[WiFiNOIManager asyncTrackNetworksOfInterest:]_block_invoke",  v3);
  }

  objc_autoreleasePoolPop(v2);
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(void **)(v4 + 8);
  if (*(_BYTE *)(v4 + 48)) {
    return [v5 trackAllBuiltinNOIsForInterfaceType:1 options:0];
  }
  [v5 stopTrackingNOIs:*(void *)(v4 + 16)];
  return [*(id *)(*(void *)(a1 + 32) + 8) stopTrackingNOIs:*(void *)(*(void *)(a1 + 32) + 24)];
}

void sub_10012E81C(_Unwind_Exception *a1)
{
}

id sub_10012E834(uint64_t a1)
{
  id v2 = (void *)sub_100095BC8(*(const void **)(a1 + 48));
  if (![*(id *)(*(void *)(a1 + 32) + 72) count])
  {
    uint64_t v3 = 0LL;
    goto LABEL_11;
  }

  uint64_t v3 = 1LL;
  if ((objc_msgSend( v2,  "isEqualToString:",  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 72), "firstObject")) & 1) == 0)
  {
    if (![*(id *)(*(void *)(a1 + 32) + 72) containsObject:v2])
    {
      uint64_t v3 = 0LL;
      goto LABEL_8;
    }

    uint64_t v3 = 2LL;
  }

  *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 1;
LABEL_8:
  uint64_t v4 = objc_autoreleasePoolPush();
  if (qword_100219F60) {
    [(id)qword_100219F60 WFLog:3, "%s: Setting home NOI for %s to : %@(%d)", "-[WiFiNOIManager setNetworkOfInterest:]_block_invoke", objc_msgSend(v2, "UTF8String"), sub_10003B334(v3), v3 message];
  }
  objc_autoreleasePoolPop(v4);
  sub_10009FA58(*(const void **)(a1 + 48), v3);
LABEL_11:
  if (![*(id *)(*(void *)(a1 + 32) + 80) count]) {
    return [*(id *)(a1 + 32) asyncTrackNetworksOfInterest:0];
  }
  unsigned __int8 v5 = objc_msgSend( v2,  "isEqualToString:",  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 80), "firstObject"));
  uint64_t v6 = 1LL;
  if ((v5 & 1) != 0) {
    goto LABEL_15;
  }
  if ([*(id *)(*(void *)(a1 + 32) + 80) containsObject:v2])
  {
    uint64_t v6 = 2LL;
LABEL_15:
    *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 1;
    uint64_t v3 = v6;
  }

  id v7 = objc_autoreleasePoolPush();
  if (qword_100219F60) {
    [(id)qword_100219F60 WFLog:3, "%s: Setting work NOI for %s to : %@(%d)", "-[WiFiNOIManager setNetworkOfInterest:]_block_invoke", objc_msgSend(v2, "UTF8String"), sub_10003B360(v3), v3 message];
  }
  objc_autoreleasePoolPop(v7);
  sub_10009F864(*(const void **)(a1 + 48), v3);
  return [*(id *)(a1 + 32) asyncTrackNetworksOfInterest:0];
}

id sub_10012EA64(uint64_t a1)
{
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v7 = 0u;
  __int128 v8 = 0u;
  id v2 = *(void **)(*(void *)(a1 + 32) + 16LL);
  id result = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (result)
  {
    id v4 = result;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0LL;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend( *(id *)(*(void *)(a1 + 32) + 8),  "networkAttachmentInfoForScopedNOI:reply:",  _NSConcreteStackBlock,  3221225472,  sub_10012EBA0,  &unk_1001E5FB0,  *(void *)(*((void *)&v7 + 1) + 8 * (void)v6),  *(void *)(a1 + 32));
        uint64_t v6 = (char *)v6 + 1;
      }

      while (v4 != v6);
      id result = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
      id v4 = result;
    }

    while (result);
  }

  return result;
}

void sub_10012EBA0(uint64_t a1, void *a2, void *a3)
{
  if (a3)
  {
    uint64_t v5 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      objc_msgSend( (id)qword_100219F60,  "WFLog:message:",  4,  "%s: %s: error: %s\n",  "-[WiFiNOIManager asyncScopeHomeNetworks]_block_invoke_2",  objc_msgSend(objc_msgSend(*(id *)(a1 + 32), "typePrettyPrint"), "UTF8String"),  objc_msgSend(objc_msgSend(a3, "description"), "UTF8String"));
    }
    objc_autoreleasePoolPop(v5);
  }

  else
  {
    id v6 = [a2 keysSortedByValueUsingComparator:&stru_1001E5F88];
    [*(id *)(*(void *)(a1 + 40) + 72) removeAllObjects];
    [*(id *)(*(void *)(a1 + 40) + 72) setArray:v6];
  }

int64_t sub_10012EC70(id a1, id a2, id a3)
{
  double v5 = v4;
  [a3 doubleValue];
  if (v5 > v6) {
    return -1LL;
  }
  else {
    return v5 < v6;
  }
}

id sub_10012ED0C(uint64_t a1)
{
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v7 = 0u;
  __int128 v8 = 0u;
  id v2 = *(void **)(*(void *)(a1 + 32) + 24LL);
  id result = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (result)
  {
    id v4 = result;
    uint64_t v5 = *(void *)v8;
    do
    {
      double v6 = 0LL;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend( *(id *)(*(void *)(a1 + 32) + 8),  "networkAttachmentInfoForScopedNOI:reply:",  _NSConcreteStackBlock,  3221225472,  sub_10012EE48,  &unk_1001E5FB0,  *(void *)(*((void *)&v7 + 1) + 8 * (void)v6),  *(void *)(a1 + 32));
        double v6 = (char *)v6 + 1;
      }

      while (v4 != v6);
      id result = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
      id v4 = result;
    }

    while (result);
  }

  return result;
}

void sub_10012EE48(uint64_t a1, void *a2, void *a3)
{
  if (a3)
  {
    uint64_t v5 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      objc_msgSend( (id)qword_100219F60,  "WFLog:message:",  4,  "%s: %s: error: %s\n",  "-[WiFiNOIManager asyncScopeWorkNetworks]_block_invoke_2",  objc_msgSend(objc_msgSend(*(id *)(a1 + 32), "typePrettyPrint"), "UTF8String"),  objc_msgSend(objc_msgSend(a3, "description"), "UTF8String"));
    }
    objc_autoreleasePoolPop(v5);
  }

  else
  {
    id v6 = [a2 keysSortedByValueUsingComparator:&stru_1001E5FD0];
    [*(id *)(*(void *)(a1 + 40) + 80) removeAllObjects];
    [*(id *)(*(void *)(a1 + 40) + 80) setArray:v6];
  }

int64_t sub_10012EF18(id a1, id a2, id a3)
{
  double v5 = v4;
  [a3 doubleValue];
  if (v5 > v6) {
    return -1LL;
  }
  else {
    return v5 < v6;
  }
}

void sub_10012EFB4(uint64_t a1)
{
  if (*(_DWORD *)(*(void *)(a1 + 32) + 52LL) == 7)
  {
    id v2 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      [(id)qword_100219F60 WFLog:3 message:"NOI Transition Check Timer fired. Triggering NOI Transition Check."];
    }
    objc_autoreleasePoolPop(v2);
    sub_1000F02B4(*(void *)(*(void *)(a1 + 32) + 64LL));
  }

uint64_t sub_10012F590()
{
  uint64_t result = qword_100219E60;
  if (!qword_100219E60)
  {
    pthread_once(&stru_100219250, (void (*)(void))sub_10012F5CC);
    return qword_100219E60;
  }

  return result;
}

uint64_t sub_10012F5CC()
{
  uint64_t result = _CFRuntimeRegisterClass(&unk_1001E5FF0);
  qword_100219E60 = result;
  return result;
}

void *sub_10012F5F0(uint64_t a1)
{
  if (!qword_100219E60) {
    pthread_once(&stru_100219250, (void (*)(void))sub_10012F5CC);
  }
  uint64_t result = (void *)_CFRuntimeCreateInstance(a1);
  if (result)
  {
    result[2] = 0LL;
    result[3] = 0LL;
    result[4] = 0LL;
  }

  return result;
}

BOOL sub_10012F650(uint64_t a1, CFTypeRef cf)
{
  CFTypeRef v3 = CFRetain(cf);
  *(void *)(a1 + 16) = v3;
  return v3 != 0LL;
}

BOOL sub_10012F680(uint64_t a1, CFTypeRef cf)
{
  CFTypeRef v3 = CFRetain(cf);
  *(void *)(a1 + 24) = v3;
  return v3 != 0LL;
}

BOOL sub_10012F6B0(uint64_t a1)
{
  CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
  *(CFAbsoluteTime *)(a1 + 32) = Current;
  return Current != 0.0;
}

double sub_10012F6DC(uint64_t a1)
{
  return *(double *)(a1 + 32);
}

void sub_10012F6E4(void *a1)
{
  if (!a1) {
    sub_10015488C();
  }
  CFTypeID v2 = CFGetTypeID(a1);
  uint64_t v3 = qword_100219E60;
  if (!qword_100219E60)
  {
    pthread_once(&stru_100219250, (void (*)(void))sub_10012F5CC);
    uint64_t v3 = qword_100219E60;
  }

  if (v2 != v3) {
    sub_1001548B4();
  }
  double v5 = a1 + 2;
  double v4 = (const void *)a1[2];
  if (v4)
  {
    CFRelease(v4);
    void *v5 = 0LL;
  }

  double v6 = (const void *)a1[3];
  if (v6) {
    CFRelease(v6);
  }
  void *v5 = 0LL;
  a1[3] = 0LL;
  a1[4] = 0LL;
}

uint64_t sub_10012F770(uint64_t a1, uint64_t a2)
{
  uint64_t result = CFEqual(*(CFTypeRef *)(a1 + 16), *(CFTypeRef *)(a2 + 16));
  if ((_DWORD)result)
  {
    uint64_t result = CFEqual(*(CFTypeRef *)(a1 + 24), *(CFTypeRef *)(a2 + 24));
    if ((_DWORD)result) {
      return *(double *)(a1 + 32) == *(double *)(a2 + 32);
    }
  }

  return result;
}

CFStringRef sub_10012F7C4(uint64_t a1, const __CFDictionary *a2)
{
  return CFStringCreateWithFormat(kCFAllocatorDefault, a2, @"WiFiCacheEntry@%p", a1);
}

CFStringRef sub_10012F7FC(uint64_t a1)
{
  return CFStringCreateWithFormat(kCFAllocatorDefault, 0LL, @"WiFiCacheEntry@%p", a1);
}

void sub_10012FA18()
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver( DarwinNotifyCenter,  0LL,  (CFNotificationCallback)sub_10012FCF8,  @"com.apple.language.changed",  0LL,  CFNotificationSuspensionBehaviorDeliverImmediately);
}

void sub_10012FA4C()
{
  v0 = CFURLCreateWithFileSystemPath( kCFAllocatorDefault,  @"/System/Library/PrivateFrameworks/MobileWiFi.framework",  kCFURLPOSIXPathStyle,  0);
  uint64_t v1 = CFBundleCreate(kCFAllocatorDefault, v0);
  if (v0) {
    CFRelease(v0);
  }
  if (v1)
  {
    CFPreferencesSynchronize(@".GlobalPreferences", @"mobile", kCFPreferencesAnyHost);
    if (qword_100219E70) {
      CFRelease((CFTypeRef)qword_100219E70);
    }
    qword_100219E70 = (uint64_t)v1;
    CFTypeID v2 = (const __CFArray *)CFPreferencesCopyValue( @"AppleLanguages",  @".GlobalPreferences",  @"mobile",  kCFPreferencesAnyHost);
    if (v2) {
      goto LABEL_10;
    }
    uint64_t v3 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      objc_msgSend( (id)qword_100219F60,  "WFLog:message:",  3,  "could not get apple languages array, assuming english\n");
    }
    objc_autoreleasePoolPop(v3);
    CFTypeID v2 = CFArrayCreate(kCFAllocatorDefault, (const void **)&off_1001E6068, 1LL, &kCFTypeArrayCallBacks);
    if (v2)
    {
LABEL_10:
      double v4 = CFBundleCopyBundleLocalizations(v1);
      if (v4)
      {
        double v5 = v4;
        double v6 = CFBundleCopyLocalizationsForPreferences(v4, v2);
        __int128 v7 = v6;
        if (v6)
        {
          if (CFArrayGetCount(v6))
          {
            if (qword_100219E68)
            {
              CFRelease((CFTypeRef)qword_100219E68);
              qword_100219E68 = 0LL;
            }

            qword_100219E68 = (uint64_t)CFArrayGetValueAtIndex(v7, 0LL);
            CFRetain((CFTypeRef)qword_100219E68);
            __int128 v8 = objc_autoreleasePoolPush();
            if (qword_100219F60) {
              [(id)qword_100219F60 WFLog:3, "%s: preferred language='%@'", "WiFiLocalizationUpdatePreferredLanguage", qword_100219E68 message];
            }
            goto LABEL_28;
          }

          __int128 v8 = objc_autoreleasePoolPush();
          __int128 v10 = (void *)qword_100219F60;
          if (!qword_100219F60)
          {
LABEL_28:
            objc_autoreleasePoolPop(v8);
            CFRelease(v2);
            CFRelease(v5);
            if (v7) {
              CFRelease(v7);
            }
            return;
          }

          uint64_t v11 = "no localizations for preferred languages\n";
        }

        else
        {
          __int128 v8 = objc_autoreleasePoolPush();
          __int128 v10 = (void *)qword_100219F60;
          if (!qword_100219F60) {
            goto LABEL_28;
          }
          uint64_t v11 = "could not get localizations for preferred languages\n";
        }

        objc_msgSend(v10, "WFLog:message:", 3, v11, v13, v14);
        goto LABEL_28;
      }

      __int128 v9 = objc_autoreleasePoolPush();
      if (qword_100219F60) {
        [(id)qword_100219F60 WFLog:3 message:"could not get localizations array from bundle\n"];
      }
      objc_autoreleasePoolPop(v9);
      CFRelease(v2);
    }

    else
    {
      int v12 = objc_autoreleasePoolPush();
      if (qword_100219F60) {
        [(id)qword_100219F60 WFLog:3 message:"could not use english as default language\n"];
      }
      objc_autoreleasePoolPop(v12);
    }
  }

void sub_10012FCF8()
{
  v0 = objc_autoreleasePoolPush();
  if (qword_100219F60) {
    [(id)qword_100219F60 WFLog:3 message:"language changed - refresh preferred language"];
  }
  objc_autoreleasePoolPop(v0);
  sub_10012FA4C();
}

void sub_10012FD40()
{
  if (qword_100219E68)
  {
    CFRelease((CFTypeRef)qword_100219E68);
    qword_100219E68 = 0LL;
  }

  if (qword_100219E70)
  {
    CFRelease((CFTypeRef)qword_100219E70);
    qword_100219E70 = 0LL;
  }

BOOL sub_10012FD80()
{
  return qword_100219E68 != 0;
}

id sub_10012FD94(uint64_t a1)
{
  if (qword_100219E68)
  {
    CFTypeID v2 = (void *)CFBundleCopyLocalizedStringForLocalization(qword_100219E70, a1, 0LL, 0LL);
    uint64_t v3 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      [(id)qword_100219F60 WFLog:3, "%s: lang='%@' key='%@' value='%@'", "WiFiLocalizationGetLocalizedString", qword_100219E68, a1, v2 message];
    }
  }

  else
  {
    uint64_t v3 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      [(id)qword_100219F60 WFLog:4 message:"WiFiLocalizationGetLocalizedString"];
    }
    CFTypeID v2 = 0LL;
  }

  objc_autoreleasePoolPop(v3);
  return v2;
}

uint64_t sub_10012FE70()
{
  uint64_t result = qword_100219E78;
  if (!qword_100219E78)
  {
    pthread_once(&stru_1002192C0, (void (*)(void))sub_10012FEAC);
    return qword_100219E78;
  }

  return result;
}

uint64_t sub_10012FEAC()
{
  uint64_t result = _CFRuntimeRegisterClass(&unk_1001E6278);
  qword_100219E78 = result;
  return result;
}

_OWORD *sub_10012FED0(uint64_t a1, uint64_t a2, const __CFDictionary *a3, uint64_t a4)
{
  return sub_10012FED8(a1, a2, a3, a4, 0LL);
}

_OWORD *sub_10012FED8( uint64_t a1, uint64_t a2, const __CFDictionary *a3, uint64_t a4, void (*a5)(uint64_t, _OWORD *))
{
  uint64_t valuePtr = 6LL;
  CFNumberRef v10 = CFNumberCreate(kCFAllocatorDefault, kCFNumberCFIndexType, &valuePtr);
  if (!v10) {
    return 0LL;
  }
  CFNumberRef v11 = v10;
  if (!a3)
  {
    v34 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      objc_msgSend( (id)qword_100219F60,  "WFLog:message:",  4,  "%s: null intfDictionary.",  "WiFiVirtualInterfaceCreateWithCompletion");
    }
    goto LABEL_33;
  }

  if (!a1)
  {
    v34 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      objc_msgSend( (id)qword_100219F60,  "WFLog:message:",  4,  "%s: null device.",  "WiFiVirtualInterfaceCreateWithCompletion");
    }
    goto LABEL_33;
  }

  if (!qword_100219E78) {
    pthread_once(&stru_1002192C0, (void (*)(void))sub_10012FEAC);
  }
  uint64_t Instance = (_OWORD *)_CFRuntimeCreateInstance(a2);
  if (!Instance)
  {
    v34 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      objc_msgSend((id)qword_100219F60, "WFLog:message:", 4, "Cannot create interface instance", v37);
    }
LABEL_33:
    objc_autoreleasePoolPop(v34);
    goto LABEL_25;
  }

  uint64_t v13 = Instance;
  Instance[1] = 0u;
  uint64_t v14 = Instance + 1;
  Instance[13] = 0u;
  Instance[14] = 0u;
  Instance[11] = 0u;
  Instance[12] = 0u;
  Instance[9] = 0u;
  Instance[10] = 0u;
  Instance[7] = 0u;
  Instance[8] = 0u;
  Instance[5] = 0u;
  Instance[6] = 0u;
  Instance[3] = 0u;
  Instance[4] = 0u;
  Instance[2] = 0u;
  MutableCopy = CFDictionaryCreateMutableCopy(kCFAllocatorDefault, 0LL, a3);
  *((void *)v14 + 2) = MutableCopy;
  if (!MutableCopy)
  {
    v31 = objc_autoreleasePoolPush();
    v32 = (void *)qword_100219F60;
    if (!qword_100219F60) {
      goto LABEL_24;
    }
    v33 = "Cannot create interface parameters dictionary copy";
    goto LABEL_23;
  }

  *((void *)v13 + 3) = a1;
  *((void *)v13 + 6) = a4;
  Value = CFDictionaryGetValue(MutableCopy, @"VIRT_IF_ROLE");
  if (!CFEqual(v11, Value))
  {
    id v26 = (const __CFDictionary *)*((void *)v13 + 4);
    if (v26)
    {
      uint64_t v27 = CFDictionaryGetValue(v26, @"VIRT_IF_NAME");
      *((void *)v13 + 5) = v27;
      if (v27)
      {
        uint64_t v28 = Apple80211Open(v14);
        if ((_DWORD)v28)
        {
          uint64_t v35 = v28;
          v31 = objc_autoreleasePoolPush();
          if (qword_100219F60) {
            objc_msgSend((id)qword_100219F60, "WFLog:message:", 4, "Cannot open 80211 device, err %d", v35);
          }
          goto LABEL_24;
        }

        uint64_t v29 = Apple80211BindToInterfaceWithParams(*((void *)v13 + 2), *((void *)v13 + 5), 0LL, 0LL, a4);
        if ((_DWORD)v29)
        {
          uint64_t v36 = v29;
          v31 = objc_autoreleasePoolPush();
          if (qword_100219F60) {
            objc_msgSend((id)qword_100219F60, "WFLog:message:", 4, "Cannot bind 80211 device, err %d", v36);
          }
          goto LABEL_24;
        }

        uint64_t v30 = sub_100130D8C(v13);
        *((void *)v13 + 2) = v30;
        if (v30)
        {
          if (a5) {
            a5(a1, v13);
          }
          goto LABEL_10;
        }

        v31 = objc_autoreleasePoolPush();
        v32 = (void *)qword_100219F60;
        if (!qword_100219F60) {
          goto LABEL_24;
        }
        v33 = "Unable to start monitoring events";
        goto LABEL_23;
      }
    }

    else
    {
      *((void *)v13 + 5) = 0LL;
    }

    v31 = objc_autoreleasePoolPush();
    v32 = (void *)qword_100219F60;
    if (!qword_100219F60)
    {
LABEL_24:
      objc_autoreleasePoolPop(v31);
      CFRelease(v11);
      CFNumberRef v11 = (CFNumberRef)v13;
LABEL_25:
      uint64_t v13 = 0LL;
      goto LABEL_11;
    }

    v33 = "No virtual interface name returned.";
LABEL_23:
    objc_msgSend(v32, "WFLog:message:", 4, v33, v37);
    goto LABEL_24;
  }

  CFIndex v17 = objc_alloc_init(&OBJC_CLASS___WiFiVirtualInterfaceWeakWrapper);
  *((void *)v13 + 27) = v17;
  -[WiFiVirtualInterfaceWeakWrapper setVirtualInterface:](v17, "setVirtualInterface:", v13);
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, *((id *)v13 + 27));
  *((void *)v13 + 25) = objc_alloc_init(&OBJC_CLASS___AWDLServiceDiscoveryManager);
  *((void *)v13 + 24) = objc_alloc_init(&OBJC_CLASS___WiFiP2PAWDLStateMonitor);
  id v18 = objc_alloc(&OBJC_CLASS___WiFiP2PDNSServiceDiscoveryManager);
  v50[0] = _NSConcreteStackBlock;
  v50[1] = 3221225472LL;
  v50[2] = sub_100130550;
  v50[3] = &unk_1001E60A0;
  v50[4] = a4;
  objc_copyWeak(&v51, &location);
  *((void *)v13 + 26) = [v18 initUsingWiFiAware:0 serviceCallback:v50];
  *((void *)v13 + 23) = 0LL;
  CFRange v19 = (void *)*((void *)v13 + 24);
  v48[0] = _NSConcreteStackBlock;
  v48[1] = 3221225472LL;
  v48[2] = sub_10013065C;
  v48[3] = &unk_1001E60F0;
  v48[4] = a4;
  objc_copyWeak(v49, &location);
  v49[1] = a5;
  [v19 setStateUpdatedHandler:v48];
  CFRange v20 = (void *)*((void *)v13 + 24);
  v46[0] = _NSConcreteStackBlock;
  v46[1] = 3221225472LL;
  v46[2] = sub_100130830;
  v46[3] = &unk_1001E6118;
  v46[4] = a4;
  objc_copyWeak(&v47, &location);
  [v20 setStatisticsUpdatedHandler:v46];
  id v21 = (void *)*((void *)v13 + 24);
  v44[0] = _NSConcreteStackBlock;
  v44[1] = 3221225472LL;
  v44[2] = sub_10013092C;
  v44[3] = &unk_1001E6168;
  v44[4] = a4;
  objc_copyWeak(&v45, &location);
  [v21 setRealtimeModeUpdatedHandler:v44];
  id v22 = (void *)*((void *)v13 + 24);
  v42[0] = _NSConcreteStackBlock;
  v42[1] = 3221225472LL;
  v42[2] = sub_100130A5C;
  v42[3] = &unk_1001E61B8;
  v42[4] = a4;
  objc_copyWeak(&v43, &location);
  [v22 setThreadCoexistenceEventHandler:v42];
  v23 = (void *)*((void *)v13 + 24);
  v40[0] = _NSConcreteStackBlock;
  v40[1] = 3221225472LL;
  v40[2] = sub_100130BDC;
  v40[3] = &unk_1001E6208;
  v40[4] = a4;
  objc_copyWeak(&v41, &location);
  [v23 setSoftAPChannelChangedEventHandler:v40];
  v24 = (void *)*((void *)v13 + 24);
  v38[0] = _NSConcreteStackBlock;
  v38[1] = 3221225472LL;
  v38[2] = sub_100130CA4;
  v38[3] = &unk_1001E6258;
  v38[4] = a4;
  objc_copyWeak(&v39, &location);
  [v24 setChannelSequenceUpdatedEventHandler:v38];
  [*((id *)v13 + 24) beginMonitoring];
  objc_destroyWeak(&v39);
  objc_destroyWeak(&v41);
  objc_destroyWeak(&v43);
  objc_destroyWeak(&v45);
  objc_destroyWeak(&v47);
  objc_destroyWeak(v49);
  objc_destroyWeak(&v51);
  objc_destroyWeak(&location);
LABEL_10:
  *((void *)v13 + 29) = 0LL;
LABEL_11:
  CFRelease(v11);
  return v13;
}

void sub_1001304A4( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *location)
{
}

const void *sub_100130530(uint64_t a1)
{
  if (a1 && (uint64_t v1 = *(const __CFDictionary **)(a1 + 32)) != 0LL) {
    return CFDictionaryGetValue(v1, @"VIRT_IF_ROLE");
  }
  else {
    return 0LL;
  }
}

void sub_100130550(uint64_t a1)
{
  uint64_t v1 = *(dispatch_queue_s **)(a1 + 32);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001305C8;
  block[3] = &unk_1001E6078;
  objc_copyWeak(&v3, (id *)(a1 + 40));
  dispatch_async(v1, block);
  objc_destroyWeak(&v3);
}

void sub_1001305C8(uint64_t a1)
{
  uint64_t v1 = [objc_loadWeak((id *)(a1 + 32)) virtualInterface];
  if (v1)
  {
    CFTypeID v2 = v1;
    CFTypeRef cf = 0LL;
    uint64_t v3 = sub_1001313F0((uint64_t)v1, (__CFDictionary **)&cf);
    double v4 = (void (*)(uint64_t, const void *, CFTypeRef, uint64_t, void))v2[15];
    if (v4)
    {
      uint64_t v5 = v3;
      uint64_t v7 = v2[3];
      double v6 = (const __CFDictionary *)v2[4];
      if (v6) {
        Value = CFDictionaryGetValue(v6, @"VIRT_IF_NAME");
      }
      else {
        Value = 0LL;
      }
      v4(v7, Value, cf, v5, v2[16]);
    }

    if (cf) {
      CFRelease(cf);
    }
  }

void sub_10013065C(uint64_t a1, void *a2)
{
  id v3 = a2;
  double v4 = *(dispatch_queue_s **)(a1 + 32);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001306F4;
  block[3] = &unk_1001E60C8;
  objc_copyWeak(v7, (id *)(a1 + 40));
  uint64_t v5 = *(void **)(a1 + 48);
  void block[4] = v3;
  v7[1] = v5;
  dispatch_async(v4, block);
  objc_destroyWeak(v7);
}

void sub_1001306F4(uint64_t a1)
{
  CFTypeID v2 = [objc_loadWeak((id *)(a1 + 40)) virtualInterface];
  if (v2)
  {
    uint64_t v3 = (uint64_t)v2;
    double v4 = (void *)v2[23];

    uint64_t v5 = *(void **)(a1 + 32);
    *(void *)(v3 + 184) = v5;
    if (v5)
    {
      if (!v4)
      {
        CFDictionarySetValue( *(CFMutableDictionaryRef *)(v3 + 32),  @"VIRT_IF_NAME",  [v5 interfaceName]);
        Value = *(const __CFDictionary **)(v3 + 32);
        if (Value) {
          Value = (const __CFDictionary *)CFDictionaryGetValue(Value, @"VIRT_IF_NAME");
        }
        *(void *)(v3 + 40) = Value;
        uint64_t v7 = *(void (**)(void, uint64_t))(a1 + 48);
        if (v7) {
          v7(*(void *)(v3 + 24), v3);
        }
        sub_100040BA8(*(void *)(v3 + 24));
      }

      CFTypeRef cf = 0LL;
      uint64_t v8 = sub_1001313F0(v3, (__CFDictionary **)&cf);
      __int128 v9 = *(void (**)(uint64_t, const void *, CFTypeRef, uint64_t, void))(v3 + 104);
      if (v9)
      {
        uint64_t v10 = v8;
        uint64_t v12 = *(void *)(v3 + 24);
        CFNumberRef v11 = *(const __CFDictionary **)(v3 + 32);
        if (v11) {
          uint64_t v13 = CFDictionaryGetValue(v11, @"VIRT_IF_NAME");
        }
        else {
          uint64_t v13 = 0LL;
        }
        v9(v12, v13, cf, v10, *(void *)(v3 + 112));
      }

      if (cf) {
        CFRelease(cf);
      }
    }
  }

  else
  {
  }

const void *sub_100130810(uint64_t a1)
{
  if (a1 && (uint64_t v1 = *(const __CFDictionary **)(a1 + 32)) != 0LL) {
    return CFDictionaryGetValue(v1, @"VIRT_IF_NAME");
  }
  else {
    return 0LL;
  }
}

void sub_100130830(uint64_t a1)
{
  uint64_t v1 = *(dispatch_queue_s **)(a1 + 32);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001308A8;
  block[3] = &unk_1001E6078;
  objc_copyWeak(&v3, (id *)(a1 + 40));
  dispatch_async(v1, block);
  objc_destroyWeak(&v3);
}

void sub_1001308A8(uint64_t a1)
{
  uint64_t v1 = [objc_loadWeak((id *)(a1 + 32)) virtualInterface];
  if (v1)
  {
    CFTypeID v2 = v1;
    id v3 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      objc_msgSend( (id)qword_100219F60,  "WFLog:message:",  3,  "%s: received APPLE80211_M_AWDL_STATISTICS event.",  "__WiFiVirtualInterfaceProcessAwdlStatisticsEvent");
    }
    objc_autoreleasePoolPop(v3);
    sub_10002ACEC(v2[3]);
  }

void sub_10013092C(uint64_t a1, char a2)
{
  id v3 = *(dispatch_queue_s **)(a1 + 32);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_1001309B4;
  v4[3] = &unk_1001E6140;
  objc_copyWeak(&v5, (id *)(a1 + 40));
  char v6 = a2;
  dispatch_async(v3, v4);
  objc_destroyWeak(&v5);
}

void sub_1001309B4(uint64_t a1)
{
  CFTypeID v2 = [objc_loadWeak((id *)(a1 + 32)) virtualInterface];
  if (v2)
  {
    id v3 = v2;
    uint64_t v4 = *(unsigned __int8 *)(a1 + 40);
    id v5 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      objc_msgSend( (id)qword_100219F60,  "WFLog:message:",  3,  "%s: didStart %d",  "__WiFiVirtualInterfaceProcessAWDLRealTimeModeEvent",  v4);
    }
    objc_autoreleasePoolPop(v5);
    char v6 = (void (*)(void, uint64_t, void))v3[17];
    if (v6) {
      v6(v3[3], v4, v3[18]);
    }
  }

void sub_100130A5C(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(dispatch_queue_s **)(a1 + 32);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_100130AEC;
  v5[3] = &unk_1001E6190;
  objc_copyWeak(v6, (id *)(a1 + 40));
  v6[1] = v3;
  dispatch_async(v4, v5);
  objc_destroyWeak(v6);
}

void sub_100130AEC(uint64_t a1)
{
  CFTypeID v2 = [objc_loadWeak((id *)(a1 + 32)) virtualInterface];
  if (v2)
  {
    uint64_t v3 = *(void *)(a1 + 40);
    if (v3)
    {
      uint64_t v4 = v2;
      id v5 = (void (*)(uint64_t, const void *, void, uint64_t))v2[21];
      if (v5)
      {
        uint64_t v7 = v2[3];
        char v6 = (const __CFDictionary *)v2[4];
        if (v6) {
          Value = CFDictionaryGetValue(v6, @"VIRT_IF_NAME");
        }
        else {
          Value = 0LL;
        }
        v5(v7, Value, v4[22], v3);
      }
    }

    else
    {
      uint64_t v10 = objc_autoreleasePoolPush();
      if (qword_100219F60) {
        objc_msgSend( (id)qword_100219F60,  "WFLog:message:",  4,  "invalid args: virtInf:%s, eventDict:%s",  "Null",  "non-Null");
      }
      objc_autoreleasePoolPop(v10);
    }
  }

  __int128 v9 = *(const void **)(a1 + 40);
  if (v9) {
    CFRelease(v9);
  }
}

void sub_100130BDC(uint64_t a1, char a2, __int16 a3)
{
  id v5 = *(dispatch_queue_s **)(a1 + 32);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  id v6[2] = sub_100130C6C;
  v6[3] = &unk_1001E61E0;
  objc_copyWeak(&v7, (id *)(a1 + 40));
  char v9 = a2;
  __int16 v8 = a3;
  dispatch_async(v5, v6);
  objc_destroyWeak(&v7);
}

CFDictionaryRef sub_100130C6C(uint64_t a1)
{
  uint64_t result = (const __CFDictionary *)[objc_loadWeak((id *)(a1 + 32)) virtualInterface];
  if (result)
  {
    uint64_t result = (const __CFDictionary *)*((void *)result + 4);
    if (result) {
      return (const __CFDictionary *)CFDictionaryGetValue(result, @"VIRT_IF_NAME");
    }
  }

  return result;
}

void sub_100130CA4(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(dispatch_queue_s **)(a1 + 32);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_100130D34;
  v5[3] = &unk_1001E6230;
  objc_copyWeak(&v6, (id *)(a1 + 40));
  void v5[4] = v3;
  dispatch_async(v4, v5);
  objc_destroyWeak(&v6);
}

void sub_100130D34(uint64_t a1)
{
  if ([objc_loadWeak((id *)(a1 + 40)) virtualInterface]) {
    -[WiFiUsageMonitor setAwdlSequence:]( +[WiFiUsageMonitor sharedInstance](&OBJC_CLASS___WiFiUsageMonitor, "sharedInstance"),  "setAwdlSequence:",  *(void *)(a1 + 32));
  }
  CFTypeID v2 = *(const void **)(a1 + 32);
  if (v2) {
    CFRelease(v2);
  }
}

uint64_t sub_100130D8C(void *a1)
{
  uint64_t result = a1[2];
  if (result)
  {
    if (Apple80211EventMonitoringInit2(result, sub_100132184, a1, a1[6]))
    {
      uint64_t v4 = objc_autoreleasePoolPush();
      if (qword_100219F60) {
        objc_msgSend( (id)qword_100219F60,  "WFLog:message:",  4,  "%s: Unable to init event monitoring",  "WiFiVirtualInterfaceMonitorEvents");
      }
      objc_autoreleasePoolPop(v4);
    }

    else if (!Apple80211StartMonitoringEvent(a1[2], 9LL) {
           && !Apple80211StartMonitoringEvent(a1[2], 10LL)
    }
           && !Apple80211StartMonitoringEvent(a1[2], 172LL))
    {
      return a1[2];
    }

    if (a1[2])
    {
      id v3 = objc_autoreleasePoolPush();
      if (qword_100219F60) {
        [(id)qword_100219F60 WFLog:4, "%s: failed to start event monitoring on %@", "WiFiVirtualInterfaceMonitorEvents", a1[5] message];
      }
      objc_autoreleasePoolPop(v3);
      Apple80211EventMonitoringHalt(a1[2]);
      uint64_t result = 0LL;
      a1[2] = 0LL;
    }

    else
    {
      return 0LL;
    }
  }

  return result;
}

uint64_t sub_100130EA8(uint64_t result)
{
  if (result) {
    return *(void *)(result + 24);
  }
  return result;
}

CFDataRef sub_100130EB4(uint64_t a1)
{
  *(void *)buffer = 0LL;
  uint64_t v16 = 0LL;
  CFTypeID v2 = *(void **)(a1 + 184);
  if (v2 && [v2 isEnabled])
  {
    id v3 = objc_msgSend(objc_msgSend(*(id *)(a1 + 184), "macAddress"), "data");
    if (v3) {
      return (CFDataRef)CFRetain(v3);
    }
  }

  else
  {
    id v5 = *(const __CFDictionary **)(a1 + 32);
    if (v5)
    {
      Value = (const __CFString *)CFDictionaryGetValue(v5, @"VIRT_IF_NAME");
      if (Value)
      {
        id v7 = Value;
        CFStringEncoding SystemEncoding = CFStringGetSystemEncoding();
        CFStringGetCString(v7, buffer, 16LL, SystemEncoding);
        *(_OWORD *)CFIndex v17 = xmmword_10017FCE0;
        int v18 = 3;
        unsigned int v19 = if_nametoindex(buffer);
        size_t __size = 0LL;
        sysctl(v17, 6u, 0LL, &__size, 0LL, 0LL);
        if (__size)
        {
          char v9 = (unsigned __int8 *)malloc(__size);
          if (v9)
          {
            uint64_t v10 = v9;
            if (sysctl(v17, 6u, v9, &__size, 0LL, 0LL) < 0)
            {
              uint64_t v13 = objc_autoreleasePoolPush();
              if (qword_100219F60) {
                objc_msgSend( (id)qword_100219F60,  "WFLog:message:",  3,  "%s: sysctl failed.",  "WiFiVirtualInterfaceCopyMACAddress");
              }
              objc_autoreleasePoolPop(v13);
              CFDataRef v11 = 0LL;
            }

            else
            {
              CFDataRef v11 = CFDataCreate(kCFAllocatorDefault, &v10[v10[117] + 120], 6LL);
            }

            free(v10);
            return v11;
          }

          uint64_t v12 = objc_autoreleasePoolPush();
          if (qword_100219F60) {
            objc_msgSend( (id)qword_100219F60,  "WFLog:message:",  3,  "%s: reqBuff is NULL.",  "WiFiVirtualInterfaceCopyMACAddress");
          }
        }

        else
        {
          uint64_t v12 = objc_autoreleasePoolPush();
          if (qword_100219F60) {
            objc_msgSend( (id)qword_100219F60,  "WFLog:message:",  3,  "%s: failed to get mib length.",  "WiFiVirtualInterfaceCopyMACAddress");
          }
        }

        objc_autoreleasePoolPop(v12);
      }
    }
  }

  return 0LL;
}

uint64_t sub_1001310E0(uint64_t a1, CFTypeRef cf, uint64_t a3)
{
  if (!a1)
  {
    CFDataRef v11 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      objc_msgSend((id)qword_100219F60, "WFLog:message:", 3, "%s: null virtInf.", "WiFiVirtualInterfaceSetProperty");
    }
    goto LABEL_26;
  }

  if (!cf)
  {
    CFDataRef v11 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      objc_msgSend((id)qword_100219F60, "WFLog:message:", 3, "%s: null key.", "WiFiVirtualInterfaceSetProperty");
    }
    goto LABEL_26;
  }

  if (!a3)
  {
    CFDataRef v11 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      objc_msgSend((id)qword_100219F60, "WFLog:message:", 3, "%s: null property.", "WiFiVirtualInterfaceSetProperty");
    }
LABEL_26:
    objc_autoreleasePoolPop(v11);
    return 4294963396LL;
  }

  CFTypeID v6 = CFGetTypeID(cf);
  if (v6 == CFNumberGetTypeID() && *(void *)(a1 + 16))
  {
    unsigned int valuePtr = 0;
    if (CFNumberGetValue((CFNumberRef)cf, kCFNumberIntType, &valuePtr))
    {
      for (int i = 6; ; --i)
      {
        uint64_t result = Apple80211Set(*(void *)(a1 + 16), valuePtr, 0LL, a3, 8LL);
        if ((_DWORD)result != -3905 && (_DWORD)result != 61 && (_DWORD)result != 16) {
          break;
        }
        if (!i) {
          break;
        }
        usleep(0x7A120u);
      }

      return result;
    }

    return 4294963396LL;
  }

  uint64_t v10 = objc_autoreleasePoolPush();
  if (qword_100219F60) {
    [(id)qword_100219F60 WFLog:3, "%s: unsupported key type for key %@", "WiFiVirtualInterfaceSetProperty", cf message];
  }
  objc_autoreleasePoolPop(v10);
  return 4294963393LL;
}

uint64_t sub_100131284(uint64_t a1, uint64_t a2, uint64_t a3, CFDictionaryRef *a4)
{
  int valuePtr = a2;
  uint64_t v6 = *(void *)(a1 + 16);
  if (v6)
  {
    for (int i = 6; ; --i)
    {
      uint64_t result = Apple80211CopyValue(v6, a2, a3, a4);
      if ((_DWORD)result != -3905 && (_DWORD)result != 61 && (_DWORD)result != 16) {
        break;
      }
      if (!i) {
        break;
      }
      usleep(0x7A120u);
      uint64_t v6 = *(void *)(a1 + 16);
    }
  }

  else if (a4)
  {
    CFDataRef v11 = (const __CFString *)CFNumberCreate(kCFAllocatorDefault, kCFNumberIntType, &valuePtr);
    uint64_t v12 = *(void *)(a1 + 24);
    uint64_t v13 = (const void *)sub_100043E8C(v12);
    CFDictionaryRef v14 = sub_100044010(v12, v13, v11);
    *a4 = v14;
    if (v11)
    {
      CFRelease(v11);
      CFDictionaryRef v14 = *a4;
    }

    if (v14) {
      return 0LL;
    }
    else {
      return 4294963365LL;
    }
  }

  else
  {
    return 0LL;
  }

  return result;
}

uint64_t sub_10013137C(uint64_t a1)
{
  if (!*(void *)(a1 + 16)) {
    return 4294963393LL;
  }
  for (int i = 6; ; --i)
  {
    uint64_t result = Apple80211GetInfoCopy();
    if ((_DWORD)result != -3905 && (_DWORD)result != 61 && (_DWORD)result != 16) {
      break;
    }
    if (!i) {
      break;
    }
    usleep(0x7A120u);
  }

  return result;
}

uint64_t sub_1001313F0(uint64_t a1, __CFDictionary **a2)
{
  int valuePtr = 0;
  uint64_t result = 4294963396LL;
  if (!a1 || !a2) {
    return result;
  }
  id v5 = *(const __CFDictionary **)(a1 + 32);
  if (!v5) {
    return 4294963393LL;
  }
  Value = (const __CFNumber *)CFDictionaryGetValue(v5, @"VIRT_IF_ROLE");
  if (!Value) {
    return 4294963393LL;
  }
  CFNumberGetValue(Value, kCFNumberSInt32Type, &valuePtr);
  if (valuePtr != 6) {
    return 4294963393LL;
  }
  id v7 = *(void **)(a1 + 184);
  if (v7) {
    unsigned int v8 = [v7 isEnabled] ^ 1;
  }
  else {
    unsigned int v8 = 1;
  }
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable( kCFAllocatorDefault,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
  if (!Mutable) {
    return 4294963395LL;
  }
  uint64_t v10 = Mutable;
  else {
    CFBooleanRef v11 = kCFBooleanFalse;
  }
  CFDictionarySetValue(v10, @"LINK_CHANGED_IS_AVAILABLE", v11);
  if (v8) {
    CFBooleanRef v12 = kCFBooleanTrue;
  }
  else {
    CFBooleanRef v12 = kCFBooleanFalse;
  }
  CFDictionarySetValue(v10, @"LINK_CHANGED_IS_LINKDOWN", v12);
  if (*(_BYTE *)(a1 + 224))
  {
    id v13 = [*(id *)(a1 + 192) queryPeerDatabase];
    if (v13)
    {
      CFTypeRef v14 = CFRetain(v13);
      if (v14)
      {
        id v15 = v14;
        CFDictionarySetValue(v10, @"LINK_CHANGED_PEER_LIST", v14);
        CFRelease(v15);
      }
    }
  }

  CFMutableDictionaryRef v16 = CFDictionaryCreateMutable( kCFAllocatorDefault,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
  if (!v16)
  {
    CFRelease(v10);
    return 4294963395LL;
  }

  CFIndex v17 = v16;
  CFDataRef v18 = sub_100130EB4(a1);
  if (v18)
  {
    CFDataRef v19 = v18;
    CFDictionarySetValue(v17, @"AWDL_IF_MAC_ADDRESS", v18);
    CFRelease(v19);
  }

  CFDictionaryRef theDict = 0LL;
  sub_1001317AC(a1, &theDict);
  if (theDict)
  {
    CFRange v20 = CFDictionaryGetValue(theDict, @"AWDL_INFO_PREFERRED_CHANNEL");
    id v21 = CFDictionaryGetValue(theDict, @"AWDL_INFO_PEER_MASTER_CHANNEL");
    id v22 = CFDictionaryGetValue(theDict, @"AWDL_INFO_EXT");
    if (v20) {
      CFDictionarySetValue(v17, @"AWDL_INFO_PREFERRED_CHANNEL", v20);
    }
    if (v21) {
      CFDictionarySetValue(v17, @"AWDL_INFO_PEER_MASTER_CHANNEL", v21);
    }
    if (sub_10004C250(*(void *)(a1 + 24)) && v22) {
      CFDictionarySetValue(v17, @"AWDL_INFO_EXT", v22);
    }
    v23 = *(const void **)(a1 + 232);
    if (v23)
    {
      CFRelease(v23);
      *(void *)(a1 + 232) = 0LL;
    }

    *(void *)(a1 + 232) = CFRetain(theDict);
    if (theDict)
    {
      CFRelease(theDict);
      CFDictionaryRef theDict = 0LL;
    }
  }

  int v29 = sub_1001319AC(a1);
  CFNumberRef v24 = CFNumberCreate(kCFAllocatorDefault, kCFNumberSInt32Type, &v29);
  if (v24)
  {
    CFNumberRef v25 = v24;
    CFDictionarySetValue(v17, @"AWDL_INFO_SUPPORTED_CHANNEL_FLAGS", v24);
    CFRelease(v25);
  }

  int v28 = 3;
  CFNumberRef v26 = CFNumberCreate(kCFAllocatorDefault, kCFNumberSInt32Type, &v28);
  if (v26)
  {
    CFNumberRef v27 = v26;
    CFDictionarySetValue(v17, @"AWDL_INFO_ASSISTED_DISCOVERY_METRIC", v26);
    CFRelease(v27);
  }

  CFDictionarySetValue(v10, @"AWDL_INFO", v17);
  CFRelease(v17);
  uint64_t result = 0LL;
  *a2 = v10;
  return result;
}

uint64_t sub_100131720(uint64_t a1, unsigned int *a2)
{
  uint64_t result = *(void *)(a1 + 184);
  if (result)
  {
    uint64_t result = (uint64_t)[(id)result isEnabled];
    if (a2)
    {
      if ((_DWORD)result)
      {
        *a2 = [*(id *)(a1 + 184) substate];
        id v5 = objc_autoreleasePoolPush();
        if (qword_100219F60) {
          objc_msgSend( (id)qword_100219F60,  "WFLog:message:",  3,  "%s: AWDL sync state is enabled with schedule state = %d",  "WiFiVirtualInterfaceGetAwdlSyncState",  *a2);
        }
        objc_autoreleasePoolPop(v5);
        return 1LL;
      }
    }
  }

  return result;
}

uint64_t sub_1001317AC(uint64_t a1, __CFDictionary **a2)
{
  if (!a1 || !a2)
  {
    id v13 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      objc_msgSend( (id)qword_100219F60,  "WFLog:message:",  3,  "%s: null params.",  "WiFiVirtualInterfaceCopyAwdlPreferredChannels");
    }
    goto LABEL_18;
  }

  if (!*(void *)(a1 + 184))
  {
    id v13 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      objc_msgSend( (id)qword_100219F60,  "WFLog:message:",  3,  "%s: no awdl state",  "WiFiVirtualInterfaceCopyAwdlPreferredChannels");
    }
LABEL_18:
    objc_autoreleasePoolPop(v13);
    return 4294963396LL;
  }

  *a2 = 0LL;
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable( kCFAllocatorDefault,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
  if (!Mutable) {
    return 4294963395LL;
  }
  id v5 = Mutable;
  *(_WORD *)bytes = -21846;
  unsigned __int16 valuePtr = (unsigned __int16)objc_msgSend( objc_msgSend(*(id *)(a1 + 184), "peerPrimaryPreferredChannel"),  "channelNumber");
  unsigned __int16 v14 = 0;
  CFNumberRef v6 = CFNumberCreate(kCFAllocatorDefault, kCFNumberSInt16Type, &valuePtr);
  if (!v6) {
    goto LABEL_12;
  }
  CFNumberRef v7 = v6;
  CFDictionarySetValue(v5, @"AWDL_INFO_PREFERRED_CHANNEL", v6);
  CFRelease(v7);
  unsigned __int16 valuePtr = (unsigned __int16)objc_msgSend(objc_msgSend(*(id *)(a1 + 184), "peerMasterChannel"), "channelNumber");
  CFNumberRef v8 = CFNumberCreate(kCFAllocatorDefault, kCFNumberSInt16Type, &valuePtr);
  if (!v8
    || (CFNumberRef v9 = v8,
        CFDictionarySetValue(v5, @"AWDL_INFO_PEER_MASTER_CHANNEL", v8),
        CFRelease(v9),
        *(_WORD *)bytes = (unsigned __int16)objc_msgSend( objc_msgSend(*(id *)(a1 + 184), "peerSecondaryPreferredChannel"),  "channelNumber"),  (CFDataRef v10 = CFDataCreate(kCFAllocatorDefault, bytes, 2)) == 0))
  {
LABEL_12:
    CFRelease(v5);
    return 4294963395LL;
  }

  CFDataRef v11 = v10;
  CFDictionarySetValue(v5, @"AWDL_INFO_EXT", v10);
  CFRelease(v11);
  uint64_t result = 0LL;
  *a2 = v5;
  return result;
}

uint64_t sub_1001319AC(uint64_t a1)
{
  CFArrayRef theArray = 0LL;
  sub_100131284(a1, 27LL, 0LL, &theArray);
  if (theArray)
  {
    if (CFArrayGetCount(theArray) < 1)
    {
      unsigned int v3 = 0;
    }

    else
    {
      CFIndex v2 = 0LL;
      unsigned int v3 = 0;
      do
      {
        ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(theArray, v2);
        if (ValueAtIndex)
        {
          Value = (const __CFNumber *)CFDictionaryGetValue(ValueAtIndex, @"SUP_CHANNEL");
          if (Value)
          {
            unsigned int valuePtr = -1431655766;
            CFNumberGetValue(Value, kCFNumberSInt32Type, &valuePtr);
            if (valuePtr >= 0xF)
            {
              int v6 = v3 | (valuePtr - 36 < 0xF);
              if (valuePtr - 50 < 0xF) {
                v6 |= 2u;
              }
              if (valuePtr - 100 < 0x2D) {
                v6 |= 4u;
              }
              if (valuePtr - 142 < 0x18 || valuePtr == 138) {
                unsigned int v3 = v6 | 8;
              }
              else {
                unsigned int v3 = v6;
              }
            }
          }
        }

        ++v2;
      }

      while (v2 < CFArrayGetCount(theArray));
    }

    if (theArray)
    {
      CFRelease(theArray);
      CFArrayRef theArray = 0LL;
    }
  }

  else
  {
    unsigned int v3 = 0;
  }

  else {
    return v3;
  }
}

uint64_t sub_100131AE4(uint64_t a1, __CFDictionary **a2)
{
  if (!a1 || (uint64_t v4 = *(const __CFDictionary **)(a1 + 32)) == 0LL)
  {
    int valuePtr = 0;
    goto LABEL_16;
  }

  Value = (const __CFNumber *)CFDictionaryGetValue(v4, @"VIRT_IF_ROLE");
  int valuePtr = 0;
  if (!Value || (CFNumberGetValue(Value, kCFNumberSInt32Type, &valuePtr), valuePtr != 6))
  {
LABEL_16:
    for (int i = 6; ; --i)
    {
      uint64_t v21 = Apple80211CopyCurrentNetwork(*(void *)(a1 + 16), a2);
      uint64_t v18 = v21;
      if ((_DWORD)v21 != -3905 && (_DWORD)v21 != 61 && (_DWORD)v21 != 16) {
        break;
      }
      if (!i) {
        break;
      }
      usleep(0x7A120u);
    }

    return v18;
  }

  *(_OWORD *)bytes = 0u;
  __int128 v25 = 0u;
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable( kCFAllocatorDefault,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
  if (!Mutable) {
    return 4294963395LL;
  }
  CFNumberRef v7 = Mutable;
  CFNumberRef v8 = sub_100130EB4(a1);
  if (v8)
  {
    CFNumberRef v9 = v8;
    BytePtr = (const ether_addr *)CFDataGetBytePtr(v8);
    CFDataRef v11 = ether_ntoa(BytePtr);
    if (v11)
    {
      CFBooleanRef v12 = v11;
      CFStringEncoding SystemEncoding = CFStringGetSystemEncoding();
      CFStringRef v14 = CFStringCreateWithCString(kCFAllocatorDefault, v12, SystemEncoding);
      if (v14)
      {
        CFStringRef v15 = v14;
        CFDictionarySetValue(v7, @"BSSID", v14);
        CFRelease(v15);
      }
    }

    CFDictionarySetValue(v7, @"STATION_MAC", v9);
    CFRelease(v9);
  }

  CFDictionarySetValue(v7, @"SSID_STR", &stru_1001EB6E0);
  CFDataRef v16 = CFDataCreate(kCFAllocatorDefault, bytes, 32LL);
  if (v16)
  {
    CFIndex v17 = v16;
    CFDictionarySetValue(v7, @"SSID", v16);
    uint64_t v18 = 0LL;
    *a2 = v7;
    CFNumberRef v7 = v17;
  }

  else
  {
    uint64_t v18 = 4294963395LL;
  }

  CFRelease(v7);
  return v18;
}

uint64_t sub_100131CDC(uint64_t a1)
{
  if (*(void *)(a1 + 16))
  {
    for (int i = 6; ; --i)
    {
      uint64_t result = Apple80211GetPowerState();
      if ((_DWORD)result != -3905 && (_DWORD)result != 61 && (_DWORD)result != 16) {
        break;
      }
      if (!i) {
        break;
      }
      usleep(0x7A120u);
    }
  }

  else
  {
    uint64_t v3 = *(void *)(a1 + 24);
    uint64_t v4 = sub_100043E8C(v3);
    sub_10004CE50(v3, v4);
    return 0LL;
  }

  return result;
}

uint64_t sub_100131D68(uint64_t a1)
{
  if (!*(void *)(a1 + 16)) {
    return 4294963393LL;
  }
  for (int i = 6; ; --i)
  {
    uint64_t result = Apple80211SetPowerState();
    if ((_DWORD)result != -3905 && (_DWORD)result != 61 && (_DWORD)result != 16) {
      break;
    }
    if (!i) {
      break;
    }
    usleep(0x7A120u);
  }

  return result;
}

uint64_t sub_100131DDC(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (!a1[2]) {
    return 4294963393LL;
  }
  a1[9] = a3;
  a1[10] = a4;
  for (int i = 6; ; --i)
  {
    uint64_t v6 = Apple80211ScanAsync();
    uint64_t v7 = v6;
    if ((int)v6 <= 15)
    {
      if ((_DWORD)v6 != -3905) {
        break;
      }
    }

    else if ((_DWORD)v6 != 61 && (_DWORD)v6 != 16)
    {
      goto LABEL_11;
    }

    if (!i) {
      break;
    }
    usleep(0x7A120u);
  }

  if (!(_DWORD)v6) {
    return v7;
  }
LABEL_11:
  sub_100131E84(a1, a1[5], 0LL, v6);
  return v7;
}

void sub_100131E84(uint64_t *a1, uint64_t a2, __CFArray *a3, uint64_t a4)
{
  CFNumberRef v9 = (void (*)(uint64_t, uint64_t, __CFArray *, void, uint64_t, uint64_t))a1[9];
  uint64_t v8 = a1[10];
  CFDataRef v10 = a1 + 9;
  CFDataRef v11 = objc_autoreleasePoolPush();
  if (qword_100219F60) {
    [(id)qword_100219F60 WFLog:3, "Completed Apple80211ScanAsync on %@ (0x%x)", a2, a4 message];
  }
  objc_autoreleasePoolPop(v11);
  if (a3)
  {
    CFTypeID v12 = CFGetTypeID(a3);
    if (v12 == CFArrayGetTypeID()) {
      a3 = sub_10003A530(a3);
    }
    else {
      a3 = 0LL;
    }
  }

  *CFDataRef v10 = 0LL;
  v10[1] = 0LL;
  if (v9) {
    v9(a1[3], a2, a3, 0LL, a4, v8);
  }
  if (a3) {
    CFRelease(a3);
  }
  sub_10004F9BC(a1[3]);
}

uint64_t sub_100131F6C(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, uint64_t a6, uint64_t a7)
{
  uint64_t v8 = a1[2];
  if (!v8) {
    return 4294963393LL;
  }
  a1[7] = a6;
  a1[8] = a7;
  int v11 = 6;
  if (a5)
  {
    while (1)
    {
      uint64_t result = Apple80211AssociateAsync();
      if ((_DWORD)result != -3905 && (_DWORD)result != 61 && (_DWORD)result != 16) {
        break;
      }
      if (!v11) {
        break;
      }
      usleep(0x7A120u);
      --v11;
    }
  }

  else
  {
    while (1)
    {
      uint64_t result = Apple80211Associate(v8, a3, a4);
      if ((_DWORD)result != -3905 && (_DWORD)result != 61 && (_DWORD)result != 16) {
        break;
      }
      if (!v11) {
        break;
      }
      usleep(0x7A120u);
      uint64_t v8 = a1[2];
      --v11;
    }
  }

  return result;
}

uint64_t sub_100132030(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v6 = a1[2];
  if (!v6) {
    return 4294963393LL;
  }
  a1[11] = a4;
  a1[12] = a5;
  for (int i = 6; ; --i)
  {
    uint64_t v10 = Apple80211Set(v6, 24LL, 1LL, a3, 8LL);
    uint64_t v11 = v10;
    if ((int)v10 <= 15)
    {
      if ((_DWORD)v10 != -3905) {
        break;
      }
    }

    else if ((_DWORD)v10 != 61 && (_DWORD)v10 != 16)
    {
      goto LABEL_11;
    }

    if (!i) {
      break;
    }
    usleep(0x7A120u);
    uint64_t v6 = a1[2];
  }

  if (!(_DWORD)v10) {
    return v11;
  }
LABEL_11:
  sub_1001320EC(a1, a2, v10);
  return v11;
}

void sub_1001320EC(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  id v5 = (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))a1[11];
  uint64_t v4 = a1[12];
  a1[11] = 0LL;
  a1[12] = 0LL;
  if (v5) {
    v5(a1[3], a2, a3, v4);
  }
  sub_10004F9BC(a1[3]);
}

uint64_t sub_100132120(uint64_t a1)
{
  if (!*(void *)(a1 + 16)) {
    return 4294963393LL;
  }
  for (int i = 6; ; --i)
  {
    uint64_t result = Apple80211Disassociate();
    if ((_DWORD)result != -3905 && (_DWORD)result != 61 && (_DWORD)result != 16) {
      break;
    }
    if (!i) {
      break;
    }
    usleep(0x7A120u);
  }

  return result;
}

void sub_100132184(uint64_t a1, uint64_t a2, int a3, __CFArray *a4, uint64_t a5, uint64_t a6)
{
  if (a6)
  {
    id v14 = (id)sub_10003AFF4((uint64_t)"__WiFiVirtualInterfaceEventCallback");
    if (sub_1000490DC(*(uint64_t **)(a6 + 24), a3) == 1)
    {
      switch(a3)
      {
        case 8:
          sub_1001320EC((uint64_t *)a6, *(void *)(a6 + 40), a1);
          break;
        case 10:
          sub_100131E84((uint64_t *)a6, *(void *)(a6 + 40), a4, a1);
          break;
        case 9:
          uint64_t v10 = *(void *)(a6 + 40);
          CFTypeID v12 = *(void (**)(void, uint64_t, __CFArray *, void, uint64_t, uint64_t))(a6 + 56);
          uint64_t v11 = *(void *)(a6 + 64);
          *(void *)(a6 + 56) = 0LL;
          *(void *)(a6 + 64) = 0LL;
          if (a4)
          {
            CFTypeID v13 = CFGetTypeID(a4);
            if (v13 == CFDictionaryGetTypeID()) {
              a4 = (__CFArray *)sub_100094AAC((uint64_t)kCFAllocatorDefault, a4);
            }
            else {
              a4 = 0LL;
            }
          }

          if (v12) {
            v12(*(void *)(a6 + 24), v10, a4, 0LL, a1, v11);
          }
          if (a4) {
            CFRelease(a4);
          }
          break;
      }
    }
  }

uint64_t sub_1001322B4(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(void *)(result + 104) = a2;
  *(void *)(result + 112) = a3;
  return result;
}

uint64_t sub_1001322BC(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(void *)(result + 120) = a2;
  *(void *)(result + 12_Block_object_dispose((const void *)(v1 - 48), 8) = a3;
  return result;
}

uint64_t sub_1001322C4(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(void *)(result + 136) = a2;
  *(void *)(result + 144) = a3;
  return result;
}

uint64_t sub_1001322CC(int a1, const void *a2, CFTypeRef cf1)
{
  if (cf1) {
    BOOL v4 = CFEqual(cf1, kCFBooleanTrue) == 0;
  }
  else {
    BOOL v4 = 1;
  }
  id v5 = objc_autoreleasePoolPush();
  if (qword_100219F60)
  {
    uint64_t v6 = "Y";
    if (v4) {
      uint64_t v6 = "N";
    }
    [(id)qword_100219F60 WFLog:3, "%s: UUID %@, active %s", "WiFiVirtualInterfaceSetAppTrafficPolicy", a2, v6 message];
  }

  objc_autoreleasePoolPop(v5);
  if (CFEqual(a2, @"CARPLAY_UUID"))
  {
    uint64_t v7 = 6LL;
  }

  else if (CFEqual(a2, @"FACETIME_UUID"))
  {
    uint64_t v7 = 10LL;
  }

  else
  {
    if (!CFEqual(a2, @"WiFiCallingUUID"))
    {
      if (CFEqual(a2, @"airplay")) {
        return 0LL;
      }
      else {
        return 4294963396LL;
      }
    }

    uint64_t v7 = 11LL;
  }

  id v8 = +[WiFiP2PSPITransactionRequestor shared](&OBJC_CLASS___WiFiP2PSPITransactionRequestor, "shared");
  if (v4)
  {
    [v8 endTransaction:v7];
  }

  else
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_100132444;
    v10[3] = &unk_1001E5188;
    v10[4] = v7;
    [v8 beginTransaction:v7 completionHandler:v10];
  }

  return 0LL;
}

void sub_100132444(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    BOOL v4 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      objc_msgSend( (id)qword_100219F60,  "WFLog:message:",  4,  "Transaction %d abruptly ended because %d",  *(void *)(a1 + 32),  a2);
    }
    objc_autoreleasePoolPop(v4);
  }

uint64_t sub_1001324B0(uint64_t a1, CFArrayRef theArray)
{
  unsigned int Count = CFArrayGetCount(theArray);
  id v5 = +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array");
  uint64_t v6 = Count;
  if (Count)
  {
    CFIndex v7 = 0LL;
    do
    {
      ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(theArray, v7);
      if (ValueAtIndex)
      {
        CFNumberRef v9 = ValueAtIndex;
        CFTypeID v10 = CFGetTypeID(ValueAtIndex);
        if (v10 == CFDictionaryGetTypeID())
        {
          Value = (const __CFNumber *)CFDictionaryGetValue(v9, @"MWS_Channel_Number");
          unsigned int valuePtr = -1431655766;
          if (Value)
          {
            CFTypeID v12 = Value;
            CFTypeID v13 = CFGetTypeID(Value);
            if (v13 == CFNumberGetTypeID())
            {
              CFNumberGetValue(v12, kCFNumberSInt32Type, &valuePtr);
              id v14 = objc_alloc(&OBJC_CLASS___WiFiChannel);
              LOBYTE(v17) = 0;
              id v15 = objc_msgSend( v14,  "initWithChannelNumber:bandwidth:is2_4GHz:is5GHz:is6GHz:isDFS:extensionChannelAbove:",  valuePtr,  1,  valuePtr < 0xF,  valuePtr > 0xE,  0,  0,  v17);
              [v5 addObject:v15];
            }
          }
        }
      }

      ++v7;
    }

    while (v6 != v7);
  }

  else {
    return 4294963365LL;
  }
}

uint64_t sub_100132600( uint64_t a1, const void *a2, const __CFDictionary *a3, void (*a4)(void, const void *, void, void), uint64_t a5, const __CFString *a6)
{
  uint64_t v11 = dispatch_semaphore_create(0LL);
  v31 = a2;
  if (a3 && CFDictionaryGetValue(a3, @"APPLE80211KEY_AWDL_INFO_ASSISTED_DISCOVERY_FOLLOW"))
  {
    int valuePtr = 1;
    CFTypeID v12 = kCFAllocatorDefault;
    CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable( kCFAllocatorDefault,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
    if (!Mutable)
    {
      uint64_t v30 = objc_autoreleasePoolPush();
      if (qword_100219F60) {
        objc_msgSend( (id)qword_100219F60,  "WFLog:message:",  3,  "%s: null follow mode policy.",  "WiFiVirtualInterfaceStartAwdl");
      }
      objc_autoreleasePoolPop(v30);
      uint64_t v25 = 4294963396LL;
      if (v11) {
        goto LABEL_30;
      }
      return v25;
    }

    id v14 = Mutable;
    CFNumberRef v15 = CFNumberCreate(kCFAllocatorDefault, kCFNumberSInt32Type, &valuePtr);
    if (v15)
    {
      CFNumberRef v16 = v15;
      CFDictionarySetValue(v14, @"APPLE80211KEY_RANGING_FOLLOW_MODE", v15);
      CFRelease(v16);
    }

    Value = (const __CFNumber *)CFDictionaryGetValue(a3, @"AWDL_INFO_PEER_PREFERRED_BAND");
    if (Value)
    {
      BOOL v33 = 0;
      CFNumberGetValue(Value, kCFNumberSInt32Type, &v33);
      BOOL v33 = v33;
      CFNumberRef v18 = CFNumberCreate(kCFAllocatorDefault, kCFNumberSInt32Type, &v33);
      CFDictionarySetValue(v14, @"APPLE80211KEY_RANGING_FOLLOW_MODE_BAND", v18);
      if (v18) {
        CFRelease(v18);
      }
    }

    CFDataRef v19 = sub_100132A28(a1, a2, (uint64_t)a3, kCFBooleanTrue);
    int v20 = 1;
  }

  else
  {
    CFDataRef v19 = sub_100132C94((void *)a1, a2, a3, kCFBooleanTrue, a6);
    id v14 = 0LL;
    int v20 = 0;
    CFTypeID v12 = kCFAllocatorDefault;
  }

  int v36 = 17563660;
  *(void *)bytes = 0xC064696669775F06LL;
  CFDataRef v21 = CFDataCreate(v12, bytes, 12LL);
  if (!v21) {
    goto LABEL_35;
  }
  id v22 = [[AWDLServiceDiscoveryConfiguration alloc] initWithKey:v21];
  v23 = *(void **)(a1 + 208);
  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472LL;
  v32[2] = sub_100133754;
  v32[3] = &unk_1001E2AF0;
  v32[4] = v11;
  [v23 startServiceDiscoveryWithConfiguration:v22 completionHandler:v32];

  dispatch_time_t v24 = dispatch_time(0LL, 2000000000LL);
  if (dispatch_semaphore_wait(v11, v24))
  {
    int v29 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      objc_msgSend( (id)qword_100219F60,  "WFLog:message:",  4,  "%s: timed out waiting for assisted discovery registration",  "WiFiVirtualInterfaceStartAwdl");
    }
    objc_autoreleasePoolPop(v29);
LABEL_35:
    uint64_t v25 = 4294963396LL;
    goto LABEL_23;
  }

  uint64_t v25 = sub_10013375C(a1, (uint64_t)v19);
  CFNumberRef v26 = objc_autoreleasePoolPush();
  if ((_DWORD)v25)
  {
    if (qword_100219F60) {
      objc_msgSend( (id)qword_100219F60,  "WFLog:message:",  4,  "%s: APPLE80211_IOC_AWDL_PEER_TRAFFIC_REGISTRATION returned error %d.",  "WiFiVirtualInterfaceStartAwdl",  v25);
    }
    objc_autoreleasePoolPop(v26);
  }

  else
  {
    if (qword_100219F60) {
      [(id)qword_100219F60 WFLog:3, "%s: AWDL brought up with wifid assisted policy %@", "WiFiVirtualInterfaceStartAwdl", v19 message];
    }
    objc_autoreleasePoolPop(v26);
    if (v20)
    {
      sub_100050BC8(*(void *)(a1 + 24), (uint64_t)v14);
      CFNumberRef v27 = objc_autoreleasePoolPush();
      if (qword_100219F60) {
        [(id)qword_100219F60 WFLog:3, "%s: AWDL brought up with wifid follow mode %@", "WiFiVirtualInterfaceStartAwdl", v14 message];
      }
      objc_autoreleasePoolPop(v27);
    }

    if (a4)
    {
      *(_BYTE *)(a1 + 224) = 1;
      a4(*(void *)(a1 + 24), v31, 0LL, 0LL);
    }

    uint64_t v25 = 0LL;
  }

__CFDictionary *sub_100132A28(uint64_t a1, const void *a2, uint64_t a3, const void *a4)
{
  values = 0LL;
  if (!a1)
  {
    CFTypeID v12 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      objc_msgSend( (id)qword_100219F60,  "WFLog:message:",  3,  "%s: null AWDL interface.",  "__WiFiVirtualInterfaceCreateFollowModePolicyFromRequest");
    }
    goto LABEL_16;
  }

  if (!a2)
  {
    CFTypeID v12 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      objc_msgSend( (id)qword_100219F60,  "WFLog:message:",  3,  "%s: null ifname.",  "__WiFiVirtualInterfaceCreateFollowModePolicyFromRequest");
    }
    goto LABEL_16;
  }

  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable( kCFAllocatorDefault,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
  if (!Mutable)
  {
    CFTypeID v12 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      objc_msgSend( (id)qword_100219F60,  "WFLog:message:",  3,  "%s: null policy.",  "__WiFiVirtualInterfaceCreateFollowModePolicyFromRequest");
    }
LABEL_16:
    objc_autoreleasePoolPop(v12);
    id v8 = 0LL;
    goto LABEL_7;
  }

  id v8 = Mutable;
  CFDictionarySetValue(Mutable, @"TR_SRV_NAME", @"ranging-responder");
  values = CFDictionaryCreateMutable( kCFAllocatorDefault,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
  if (values)
  {
    CFArrayRef v9 = CFArrayCreate(kCFAllocatorDefault, (const void **)&values, 1LL, &kCFTypeArrayCallBacks);
    if (v9)
    {
      CFArrayRef v10 = v9;
      CFDictionarySetValue(v8, @"TR_PEER_CONTEXTS", v9);
      CFRelease(v10);
      CFDictionarySetValue((CFMutableDictionaryRef)values, @"TR_IFNAME", a2);
      CFDictionarySetValue(v8, @"TR_ACTIVE", a4);
      if (a3) {
        goto LABEL_7;
      }
      CFTypeID v13 = objc_autoreleasePoolPush();
      if (qword_100219F60) {
        objc_msgSend( (id)qword_100219F60,  "WFLog:message:",  3,  "%s: no AWDL request",  "__WiFiVirtualInterfaceCreateFollowModePolicyFromRequest");
      }
    }

    else
    {
      CFTypeID v13 = objc_autoreleasePoolPush();
      if (qword_100219F60) {
        objc_msgSend( (id)qword_100219F60,  "WFLog:message:",  3,  "%s: null peer Context array.",  "__WiFiVirtualInterfaceCreateFollowModePolicyFromRequest");
      }
    }
  }

  else
  {
    CFTypeID v13 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      objc_msgSend( (id)qword_100219F60,  "WFLog:message:",  3,  "%s: null peerContext.",  "__WiFiVirtualInterfaceCreateFollowModePolicyFromRequest");
    }
  }

  objc_autoreleasePoolPop(v13);
LABEL_7:
  if (values) {
    CFRelease(values);
  }
  return v8;
}

__CFDictionary *sub_100132C94( void *a1, const void *a2, const __CFDictionary *a3, const void *a4, const __CFString *a5)
{
  values = 0LL;
  if (!a1)
  {
    v57 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      objc_msgSend( (id)qword_100219F60,  "WFLog:message:",  3,  "%s: null AWDL interface.",  "__WiFiVirtualInterfaceCreateAssistedDiscoveryPolicyFromRequest");
    }
    goto LABEL_169;
  }

  if (!a2)
  {
    v57 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      objc_msgSend( (id)qword_100219F60,  "WFLog:message:",  3,  "%s: null ifname.",  "__WiFiVirtualInterfaceCreateAssistedDiscoveryPolicyFromRequest");
    }
    goto LABEL_169;
  }

  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable( kCFAllocatorDefault,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
  if (!Mutable)
  {
    v57 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      objc_msgSend( (id)qword_100219F60,  "WFLog:message:",  3,  "%s: null policy.",  "__WiFiVirtualInterfaceCreateAssistedDiscoveryPolicyFromRequest");
    }
LABEL_169:
    objc_autoreleasePoolPop(v57);
    uint64_t v11 = 0LL;
    goto LABEL_156;
  }

  uint64_t v11 = Mutable;
  CFDictionarySetValue(Mutable, @"TR_SRV_NAME", @"wifid-assisted-discovery");
  values = CFDictionaryCreateMutable( kCFAllocatorDefault,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
  if (!values)
  {
    v58 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      objc_msgSend( (id)qword_100219F60,  "WFLog:message:",  3,  "%s: null peerContext.",  "__WiFiVirtualInterfaceCreateAssistedDiscoveryPolicyFromRequest");
    }
    goto LABEL_176;
  }

  CFArrayRef v12 = CFArrayCreate(kCFAllocatorDefault, (const void **)&values, 1LL, &kCFTypeArrayCallBacks);
  if (!v12)
  {
    v58 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      objc_msgSend( (id)qword_100219F60,  "WFLog:message:",  3,  "%s: null peer Context array.",  "__WiFiVirtualInterfaceCreateAssistedDiscoveryPolicyFromRequest");
    }
    goto LABEL_176;
  }

  CFArrayRef v13 = v12;
  CFDictionarySetValue(v11, @"TR_PEER_CONTEXTS", v12);
  CFRelease(v13);
  CFDictionarySetValue((CFMutableDictionaryRef)values, @"TR_IFNAME", a2);
  CFDictionarySetValue(v11, @"TR_ACTIVE", a4);
  if (!a3)
  {
    v58 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      objc_msgSend( (id)qword_100219F60,  "WFLog:message:",  3,  "%s: no AWDL request",  "__WiFiVirtualInterfaceCreateAssistedDiscoveryPolicyFromRequest");
    }
LABEL_176:
    objc_autoreleasePoolPop(v58);
    goto LABEL_156;
  }

  int valuePtr = 1;
  if (a5 && CFStringCompare(a5, @"mobilewifitool", 0LL) == kCFCompareEqualTo) {
    valuePtr |= 0x80u;
  }
  CFNumberRef v14 = CFNumberCreate(kCFAllocatorDefault, kCFNumberSInt32Type, &valuePtr);
  if (v14)
  {
    CFNumberRef v15 = v14;
    CFDictionarySetValue(v11, @"TR_SESSION_FLAGS", v14);
    CFRelease(v15);
  }

  int v68 = 0;
  uint64_t v67 = 0LL;
  int v66 = 0;
  uint64_t v61 = sub_1001319AC((uint64_t)a1);
  CFDictionaryRef theDict = 0LL;
  Value = (const __CFDictionary *)CFDictionaryGetValue(a3, @"AWDL_INFO_SELF");
  if (!Value)
  {
    CFDataRef v21 = (const void *)a1[29];
    if (v21)
    {
      id v22 = (const __CFDictionary *)CFRetain(v21);
      CFDictionaryRef theDict = v22;
      if (v22)
      {
LABEL_20:
        v23 = (const __CFNumber *)CFDictionaryGetValue(v22, @"AWDL_INFO_PEER_MASTER_CHANNEL");
        if (v23) {
          CFNumberGetValue(v23, kCFNumberSInt16Type, &v66);
        }
        dispatch_time_t v24 = (const __CFNumber *)CFDictionaryGetValue(theDict, @"AWDL_INFO_PREFERRED_CHANNEL");
        if (v24) {
          CFNumberGetValue(v24, kCFNumberSInt16Type, (char *)&v66 + 2);
        }
        int v20 = theDict;
        goto LABEL_25;
      }
    }

    else
    {
      Apple80211CopyAwdlPreferredChannels(a1[2], &theDict);
      id v22 = theDict;
      if (theDict) {
        goto LABEL_20;
      }
    }

    uint64_t v25 = 0LL;
    goto LABEL_26;
  }

  uint64_t v17 = Value;
  CFNumberRef v18 = (const __CFNumber *)CFDictionaryGetValue(Value, @"AWDL_INFO_PEER_MASTER_CHANNEL");
  if (v18) {
    CFNumberGetValue(v18, kCFNumberSInt16Type, &v66);
  }
  CFDataRef v19 = (const __CFNumber *)CFDictionaryGetValue(v17, @"AWDL_INFO_PREFERRED_CHANNEL");
  if (v19) {
    CFNumberGetValue(v19, kCFNumberSInt16Type, (char *)&v66 + 2);
  }
  int v20 = v17;
LABEL_25:
  uint64_t v25 = (const __CFData *)CFDictionaryGetValue(v20, @"AWDL_INFO_EXT");
LABEL_26:
  unsigned int v26 = (unsigned __int16)v66;
  if (!sub_10004C250(a1[3])
    || !v25
    || (*(_WORD *)buffer = -21846, CFDataGetLength(v25) != 2)
    || (v71.location = 0LL, v71.length = 2LL, CFDataGetBytes(v25, v71, buffer), (unsigned __int16 v27 = *(_WORD *)buffer) == 0))
  {
    unsigned __int16 v27 = HIWORD(v66);
  }

  if (theDict)
  {
    CFRelease(theDict);
    CFDictionaryRef theDict = 0LL;
  }

  v59 = a4;
  int v28 = (const __CFNumber *)CFDictionaryGetValue(a3, @"AWDL_INFO_ASSISTED_DISCOVERY_METRIC");
  if (v28)
  {
    uint64_t v29 = 3LL;
    CFNumberGetValue(v28, kCFNumberSInt32Type, (char *)&v67 + 4);
  }

  else
  {
    uint64_t v29 = 0LL;
  }

  uint64_t v30 = (const __CFNumber *)CFDictionaryGetValue(a3, @"AWDL_INFO_PEER_MASTER_CHANNEL");
  if (v30)
  {
    CFNumberGetValue(v30, kCFNumberSInt16Type, &v68);
    BOOL v31 = (unsigned __int16)v68 > 0xEu;
  }

  else
  {
    BOOL v31 = 0;
  }

  v60 = a5;
  v32 = (const __CFNumber *)CFDictionaryGetValue(a3, @"AWDL_INFO_PREFERRED_CHANNEL");
  if (v32) {
    CFNumberGetValue(v32, kCFNumberSInt16Type, (char *)&v68 + 2);
  }
  BOOL v33 = (const __CFData *)CFDictionaryGetValue(a3, @"AWDL_INFO_EXT");
  unsigned __int16 v34 = 255;
  if (sub_10004C250(a1[3]) && v33)
  {
    CFIndex Length = CFDataGetLength(v33);
    *(_WORD *)buffer = -21846;
    if (Length == 2)
    {
      v72.id location = 0LL;
      v72.length = 2LL;
      CFDataGetBytes(v33, v72, buffer);
      if (*(_WORD *)buffer) {
        unsigned __int16 v34 = *(_WORD *)buffer;
      }
      else {
        unsigned __int16 v34 = HIWORD(v68);
      }
    }

    else
    {
      unsigned __int16 v34 = 0;
    }
  }

  int v36 = (const __CFNumber *)CFDictionaryGetValue(a3, @"AWDL_INFO_SUPPORTED_CHANNEL_FLAGS");
  if (v36)
  {
    CFNumberGetValue(v36, kCFNumberSInt32Type, &v67);
  }

  else
  {
    uint64_t v37 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      objc_msgSend( (id)qword_100219F60,  "WFLog:message:",  3,  "%s: supported channel flags key not found",  "__WiFiVirtualInterfaceCreateAssistedDiscoveryPolicyFromRequest");
    }
    objc_autoreleasePoolPop(v37);
    LODWORD(v67) = v61;
  }

  v38 = objc_autoreleasePoolPush();
  if (qword_100219F60) {
    objc_msgSend( (id)qword_100219F60,  "WFLog:message:",  3,  "%s: self(metric=%d): preferred=%d master=%d secondary channel=%d flags=0x%x; peer(metric=%d): preferred=%d master="
  }
      "%d secondary channel=%d flags=0x%x",
      "__WiFiVirtualInterfaceCreateAssistedDiscoveryPolicyFromRequest",
      v29,
      HIWORD(v66),
      (unsigned __int16)v66,
      v27,
      v61,
      HIDWORD(v67),
      HIWORD(v68),
      (unsigned __int16)v68,
      v34,
      v67);
  objc_autoreleasePoolPop(v38);
  if (v26 <= 0xE || !v31)
  {
    if (HIWORD(v66) >= 0xFu) {
      HIWORD(v66) = 0;
    }
    if (HIWORD(v68) >= 0xFu) {
      HIWORD(v6_Block_object_dispose((const void *)(v1 - 48), 8) = 0;
    }
    if (v27 > 0xEu) {
      unsigned __int16 v27 = 0;
    }
    if (v34 != 255 && v34 >= 0xFu) {
      unsigned __int16 v34 = 0;
    }
    id v41 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      objc_msgSend( (id)qword_100219F60,  "WFLog:message:",  3,  "%s: reset: self(metric=%d): preferred=%d master=%d secondary channel=%d; peer(metric=%d): preferred=%d  master=%"
    }
        "d secondary channel=%d",
        "__WiFiVirtualInterfaceCreateAssistedDiscoveryPolicyFromRequest",
        v29,
        HIWORD(v66),
        (unsigned __int16)v66,
        v27,
        HIDWORD(v67),
        HIWORD(v68),
        (unsigned __int16)v68,
        v34);
    objc_autoreleasePoolPop(v41);
  }

  __int16 v63 = 255;
  if (HIDWORD(v67) != 2)
  {
    if ((int)v29 >= SHIDWORD(v67))
    {
      unsigned int v43 = HIWORD(v66);
      __int128 v44 = v59;
      if (HIWORD(v66)
        || (unsigned int v43 = HIWORD(v68), HIWORD(v68))
        || (unsigned int v43 = (unsigned __int16)v66, (_WORD)v66)
        || (unsigned int v43 = (unsigned __int16)v68, (_WORD)v68))
      {
        __int16 v63 = v43;
      }

      else
      {
        unsigned int v43 = 255;
      }

      goto LABEL_97;
    }

    unsigned int v43 = HIWORD(v68);
    __int128 v44 = v59;
    if (HIWORD(v68)
      || (unsigned int v43 = HIWORD(v66), HIWORD(v66))
      || (unsigned int v43 = (unsigned __int16)v68, (_WORD)v68)
      || (unsigned int v43 = (unsigned __int16)v66, (_WORD)v66))
    {
      __int16 v63 = v43;
    }

    else
    {
      unsigned int v43 = 255;
    }

LABEL_89:
    if (v34)
    {
      if (v34 == 255)
      {
LABEL_91:
        __int16 v62 = v43;
        unsigned __int16 v34 = v43;
        goto LABEL_119;
      }
    }

    else
    {
      if (v27)
      {
        __int16 v62 = v27;
        unsigned __int16 v34 = v27;
        goto LABEL_119;
      }

      if (v43 == 1)
      {
        unsigned __int16 v34 = 6;
      }

      else if (v43 > 6)
      {
        if (v43 > 0xB) {
          goto LABEL_91;
        }
        unsigned __int16 v34 = 1;
      }

      else
      {
        unsigned __int16 v34 = 11;
      }
    }

    __int16 v62 = v34;
LABEL_119:
    __int128 v46 = (const __CFData *)CFDictionaryGetValue(a3, @"AWDL_IF_MAC_ADDRESS");
    CFDataRef v45 = v46;
    if (v46) {
      CFRetain(v46);
    }
    goto LABEL_121;
  }

  __int128 v42 = objc_autoreleasePoolPush();
  if (qword_100219F60) {
    objc_msgSend( (id)qword_100219F60,  "WFLog:message:",  3,  "%s: overriding preferred ranging channel to channel 6 for iPhone/iPad",  "__WiFiVirtualInterfaceCreateAssistedDiscoveryPolicyFromRequest");
  }
  objc_autoreleasePoolPop(v42);
  unsigned int v43 = 6;
  __int16 v63 = 6;
  __int128 v44 = v59;
LABEL_97:
  if (v34 != 255)
  {
    if (!v27)
    {
      if (v34)
      {
        __int16 v62 = v34;
        unsigned __int16 v27 = v34;
        goto LABEL_107;
      }

      if (v43 == 1)
      {
        unsigned __int16 v27 = 6;
      }

      else if (v43 > 6)
      {
        if (v43 > 0xB) {
          goto LABEL_98;
        }
        unsigned __int16 v27 = 1;
      }

      else
      {
        unsigned __int16 v27 = 11;
      }
    }

    __int16 v62 = v27;
    goto LABEL_107;
  }

LABEL_98:
  __int16 v62 = v43;
  unsigned __int16 v27 = v43;
LABEL_107:
  CFDataRef v45 = sub_100130EB4((uint64_t)a1);
  unsigned __int16 v34 = v27;
LABEL_121:
  if (v43 >= 0xF)
  {
    uint64_t v47 = v67 & v61;
    unsigned int v48 = (v67 & v61 & 1) != 0 ? 44 : 6;
    uint64_t v49 = (v67 & v61 & 8) != 0 ? 149LL : v48;
    if (v43 - 36 <= 0xE && (v67 & v61 & 1) == 0
      || v43 - 50 <= 0xE && (v67 & v61 & 2) == 0
      || v43 - 100 <= 0x2C && (v67 & v61 & 4) == 0
      || ((unsigned __int16)(v43 - 166) < 0xFFE8u ? (BOOL v50 = v43 == 138) : (BOOL v50 = 1),
          v50 && (v67 & v61 & 8) == 0))
    {
      id v51 = objc_autoreleasePoolPush();
      if (qword_100219F60) {
        objc_msgSend( (id)qword_100219F60,  "WFLog:message:",  3,  "%s: using fallback channel %d because preferred channel %d is not supported (flags 0x%x)",  "__WiFiVirtualInterfaceCreateAssistedDiscoveryPolicyFromRequest",  v49,  v43,  v47);
      }
      objc_autoreleasePoolPop(v51);
      __int16 v63 = v49;
      LOWORD(v43) = v49;
    }
  }

  if (v34 >= 0xFu) {
    __int16 v62 = v43;
  }
  CFNumberRef v52 = CFNumberCreate(kCFAllocatorDefault, kCFNumberSInt16Type, &v63);
  CFNumberRef v53 = CFNumberCreate(kCFAllocatorDefault, kCFNumberSInt16Type, &v62);
  v54 = objc_autoreleasePoolPush();
  if (qword_100219F60) {
    [(id)qword_100219F60 WFLog:3, "%s: preferred AWDL discovery channel = %@ secondary channel = %@ and sync-peer %@", "__WiFiVirtualInterfaceCreateAssistedDiscoveryPolicyFromRequest", v52, v53, v45 message];
  }
  objc_autoreleasePoolPop(v54);
  if (v45)
  {
    CFDictionarySetValue((CFMutableDictionaryRef)values, @"TR_PEER_ADDRESS", v45);
    CFRelease(v45);
  }

  if (v52)
  {
    CFDictionarySetValue(v11, @"AWDL_TR_CHANNEL", v52);
    CFRelease(v52);
  }

  if (v53)
  {
    CFDictionarySetValue(v11, @"AWDL_TR_SEC_CHANNEL", v53);
    CFRelease(v53);
  }

  if (v44 && CFEqual(v44, kCFBooleanTrue))
  {
    v55 = +[WiFiUsageMonitor sharedInstance](&OBJC_CLASS___WiFiUsageMonitor, "sharedInstance");
    -[WiFiUsageMonitor rangingSessionRequestedWithSelfPreferredChannel:selfMainChannel:selfChannelFlags:peerPreferredChannel:peerMainChannel:peerChannelFlags:requester:]( v55,  "rangingSessionRequestedWithSelfPreferredChannel:selfMainChannel:selfChannelFlags:peerPreferredChannel:peerMainChan nel:peerChannelFlags:requester:",  HIWORD(v66),  (unsigned __int16)v66,  v61,  HIWORD(v68),  (unsigned __int16)v68,  v67,  v60);
  }

uint64_t sub_100133754(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

uint64_t sub_10013375C(uint64_t a1, uint64_t a2)
{
  char v9 = 0;
  id v3 = [[AWDLTrafficRegistrationConfiguration alloc] initWithDictionary:a2 isActive:&v9];
  if (v3)
  {
    BOOL v4 = *(void **)(a1 + 200);
    if (v9) {
      unsigned int v5 = [v4 setTrafficRegistration:v3 error:0];
    }
    else {
      unsigned int v5 = [v4 clearTrafficRegistration:v3 error:0];
    }
    if (v5) {
      uint64_t v6 = 0LL;
    }
    else {
      uint64_t v6 = 4294963365LL;
    }
  }

  else
  {
    id v8 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      [(id)qword_100219F60 WFLog:4 message:"Failed to send traffic registration because failed to parse dictionary"];
    }
    objc_autoreleasePoolPop(v8);
    uint64_t v6 = 4294963396LL;
  }

  return v6;
}

uint64_t sub_100133814(uint64_t a1, const void *a2, uint64_t a3)
{
  *(void *)bytes = 0xC064696669775F06LL;
  int v19 = 17563660;
  if (a3 && sub_1000951FC(a3, @"APPLE80211KEY_AWDL_INFO_ASSISTED_DISCOVERY_FOLLOW"))
  {
    int valuePtr = 0;
    CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable( kCFAllocatorDefault,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
    if (!Mutable)
    {
      CFNumberRef v16 = objc_autoreleasePoolPush();
      if (qword_100219F60) {
        objc_msgSend( (id)qword_100219F60,  "WFLog:message:",  3,  "%s: null follow mode policy.",  "WiFiVirtualInterfaceStopAwdl");
      }
      objc_autoreleasePoolPop(v16);
      goto LABEL_18;
    }

    uint64_t v6 = Mutable;
    CFNumberRef v7 = CFNumberCreate(kCFAllocatorDefault, kCFNumberSInt32Type, &valuePtr);
    if (v7)
    {
      CFNumberRef v8 = v7;
      CFDictionarySetValue(v6, @"APPLE80211KEY_RANGING_FOLLOW_MODE", v7);
      CFRelease(v8);
    }

    sub_100050BC8(*(void *)(a1 + 24), (uint64_t)v6);
    char v9 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      [(id)qword_100219F60 WFLog:3, "%s: AWDL bringdown with wifid follow mode %@", "WiFiVirtualInterfaceStopAwdl", v6 message];
    }
    objc_autoreleasePoolPop(v9);
    CFRelease(v6);
    CFArrayRef v10 = sub_100132A28(a1, a2, 0LL, kCFBooleanFalse);
  }

  else
  {
    CFArrayRef v10 = sub_100132C94((void *)a1, a2, 0LL, kCFBooleanFalse, 0LL);
  }

  uint64_t v11 = v10;
  if (v10)
  {
    sub_10013375C(a1, (uint64_t)v10);
    CFRelease(v11);
  }

  CFDataRef v12 = CFDataCreate(kCFAllocatorDefault, bytes, 12LL);
  if (!v12)
  {
LABEL_18:
    *(_BYTE *)(a1 + 224) = 0;
    return 4294963396LL;
  }

  CFDataRef v13 = v12;
  id v14 = [[AWDLServiceDiscoveryConfiguration alloc] initWithKey:v12];
  [*(id *)(a1 + 208) stopServiceDiscoveryWithConfiguration:v14];

  *(_BYTE *)(a1 + 224) = 0;
  CFRelease(v13);
  return 0LL;
}

uint64_t sub_100133A58(uint64_t a1, void *a2)
{
  uint64_t result = 4294963396LL;
  if (a2)
  {
    BOOL v4 = *(void **)(a1 + 192);
    if (v4)
    {
      id v6 = [v4 copyStatistics];
      *a2 = v6;
      if (v6) {
        return 0LL;
      }
      else {
        return 4294963365LL;
      }
    }
  }

  return result;
}

uint64_t sub_100133AA0(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(void *)(result + 152) = a2;
  *(void *)(result + 160) = a3;
  return result;
}

uint64_t sub_100133AA8(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(void *)(result + 16_Block_object_dispose((const void *)(v1 - 48), 8) = a2;
  *(void *)(result + 176) = a3;
  return result;
}

uint64_t sub_100133AB0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (!a1)
  {
    CFDataRef v12 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      objc_msgSend((id)qword_100219F60, "WFLog:message:", 3, "%s: null virtInf.", "WiFiVirtualInterfaceSetIoctl");
    }
    goto LABEL_14;
  }

  if (!a4)
  {
    CFDataRef v12 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      objc_msgSend((id)qword_100219F60, "WFLog:message:", 3, "%s: null property.", "WiFiVirtualInterfaceSetIoctl");
    }
LABEL_14:
    uint64_t v11 = 4294963396LL;
LABEL_18:
    objc_autoreleasePoolPop(v12);
    return v11;
  }

  uint64_t v6 = *(void *)(a1 + 16);
  if (!v6)
  {
    CFDataRef v12 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      objc_msgSend( (id)qword_100219F60,  "WFLog:message:",  3,  "%s: Ioctls are not supported on this interface",  "WiFiVirtualInterfaceSetIoctl");
    }
    uint64_t v11 = 4294963393LL;
    goto LABEL_18;
  }

  for (int i = 6; ; --i)
  {
    uint64_t v10 = Apple80211Set(v6, a2, a3, a4, 8LL);
    uint64_t v11 = v10;
    if ((_DWORD)v10 != -3905 && (_DWORD)v10 != 61 && (_DWORD)v10 != 16) {
      break;
    }
    if (!i) {
      break;
    }
    usleep(0x7A120u);
    uint64_t v6 = *(void *)(a1 + 16);
  }

  return v11;
}

void sub_100133C00(uint64_t a1)
{
  if (!a1) {
    sub_1001548DC();
  }
  CFTypeID v2 = CFGetTypeID((CFTypeRef)a1);
  uint64_t v3 = qword_100219E78;
  if (!qword_100219E78)
  {
    pthread_once(&stru_1002192C0, (void (*)(void))sub_10012FEAC);
    uint64_t v3 = qword_100219E78;
  }

  if (v2 != v3) {
    sub_100154904();
  }
  BOOL v4 = *(const void **)(a1 + 32);
  if (v4)
  {
    CFRelease(v4);
    *(void *)(a1 + 32) = 0LL;
  }

  uint64_t v5 = *(void *)(a1 + 16);
  if (v5)
  {
    Apple80211EventMonitoringHalt(v5);
    Apple80211Close(*(void *)(a1 + 16));
    *(void *)(a1 + 16) = 0LL;
  }

  uint64_t v6 = objc_autoreleasePoolPush();
  if (qword_100219F60) {
    objc_msgSend( (id)qword_100219F60,  "WFLog:message:",  3,  "%s: calling WiFiP2PAWDLStateMonitor endMonitoring.",  "__WiFiVirtualInterfaceRelease");
  }
  objc_autoreleasePoolPop(v6);
  [*(id *)(a1 + 192) endMonitoring];

  *(void *)(a1 + 192) = 0LL;
  *(void *)(a1 + 200) = 0LL;

  *(void *)(a1 + 184) = 0LL;
  *(void *)(a1 + 20_Block_object_dispose((const void *)(v1 - 48), 8) = 0LL;
  [*(id *)(a1 + 216) setVirtualInterface:0];

  *(void *)(a1 + 216) = 0LL;
  CFNumberRef v7 = *(const void **)(a1 + 232);
  if (v7)
  {
    CFRelease(v7);
    *(void *)(a1 + 232) = 0LL;
  }

  *(void *)(a1 + 4_Block_object_dispose((const void *)(v1 - 48), 8) = 0LL;
  *(void *)(a1 + 24) = 0LL;
}

uint64_t sub_100133D38(uint64_t a1, uint64_t a2)
{
  uint64_t result = 0LL;
  if (a1 && a2)
  {
    uint64_t v5 = *(const __CFDictionary **)(a1 + 32);
    if (v5) {
      BOOL v6 = *(void *)(a2 + 32) == 0LL;
    }
    else {
      BOOL v6 = 1;
    }
    if (v6) {
      return 0LL;
    }
    Value = CFDictionaryGetValue(v5, @"VIRT_IF_ROLE");
    CFNumberRef v8 = *(const __CFDictionary **)(a2 + 32);
    char v9 = v8 ? CFDictionaryGetValue(v8, @"VIRT_IF_ROLE") : 0LL;
    uint64_t result = CFEqual(Value, v9);
    if ((_DWORD)result)
    {
      uint64_t v10 = *(const __CFDictionary **)(a1 + 32);
      uint64_t v11 = v10 ? CFDictionaryGetValue(v10, @"VIRT_IF_NAME") : 0LL;
      CFDataRef v12 = *(const __CFDictionary **)(a2 + 32);
      CFDataRef v13 = v12 ? CFDictionaryGetValue(v12, @"VIRT_IF_NAME") : 0LL;
      uint64_t result = CFEqual(v11, v13);
      if ((_DWORD)result)
      {
        CFDataRef v14 = sub_100130EB4(a1);
        CFDataRef v15 = sub_100130EB4(a2);
        if (CFEqual(v14, v15))
        {
          if (v14) {
            CFRelease(v14);
          }
          uint64_t v16 = 1LL;
          uint64_t result = 1LL;
          if (v15)
          {
LABEL_24:
            CFRelease(v15);
            return v16;
          }
        }

        else
        {
          if (v14) {
            CFRelease(v14);
          }
          uint64_t v16 = 0LL;
          uint64_t result = 0LL;
          if (v15) {
            goto LABEL_24;
          }
        }
      }
    }
  }

  return result;
}

CFHashCode sub_100133E78(uint64_t a1)
{
  CFDataRef v1 = sub_100130EB4(a1);
  CFHashCode v2 = CFHash(v1);
  if (v1) {
    CFRelease(v1);
  }
  return v2;
}

CFStringRef sub_100133EB0(uint64_t a1)
{
  unsigned int valuePtr = -1431655766;
  *(void *)buffer = 0LL;
  uint64_t v10 = 0LL;
  if (!a1) {
    goto LABEL_8;
  }
  CFHashCode v2 = *(const __CFDictionary **)(a1 + 32);
  if (!v2) {
    goto LABEL_8;
  }
  Value = (const __CFString *)CFDictionaryGetValue(v2, @"VIRT_IF_NAME");
  if (Value) {
    CFStringGetCString(Value, buffer, 16LL, 0);
  }
  BOOL v4 = *(const __CFDictionary **)(a1 + 32);
  if (v4 && (uint64_t v5 = (const __CFNumber *)CFDictionaryGetValue(v4, @"VIRT_IF_ROLE")) != 0LL)
  {
    CFNumberGetValue(v5, kCFNumberSInt32Type, &valuePtr);
    uint64_t v6 = valuePtr;
  }

  else
  {
LABEL_8:
    uint64_t v6 = 0LL;
    unsigned int valuePtr = 0;
  }

  return CFStringCreateWithFormat(kCFAllocatorDefault, 0LL, @"%-40s: ROLE: %d", buffer, v6);
}

uint64_t sub_100133F90()
{
  uint64_t result = qword_100219E80;
  if (!qword_100219E80)
  {
    pthread_once(&stru_1002192D0, (void (*)(void))sub_100133FCC);
    return qword_100219E80;
  }

  return result;
}

uint64_t sub_100133FCC()
{
  uint64_t result = _CFRuntimeRegisterClass(&unk_1001E62D8);
  qword_100219E80 = result;
  return result;
}

_OWORD *sub_100133FF0(uint64_t a1)
{
  if (!qword_100219E80) {
    pthread_once(&stru_1002192D0, (void (*)(void))sub_100133FCC);
  }
  uint64_t Instance = (_OWORD *)_CFRuntimeCreateInstance(a1);
  uint64_t v3 = Instance;
  if (Instance)
  {
    Instance[2] = 0u;
    Instance[3] = 0u;
    Instance[1] = 0u;
    *((_BYTE *)Instance + 16) = 0;
    CFMutableArrayRef Mutable = CFArrayCreateMutable(kCFAllocatorDefault, 0LL, &kCFTypeArrayCallBacks);
    *((void *)v3 + 3) = Mutable;
    if (Mutable)
    {
      *((_BYTE *)v3 + 57) = 0;
    }

    else
    {
      CFRelease(v3);
      return 0LL;
    }
  }

  return v3;
}

void sub_100134094(uint64_t a1, int a2)
{
  if (a1 && *(_DWORD *)(a1 + 20) != a2)
  {
    BOOL v4 = objc_autoreleasePoolPush();
    if (qword_100219F60)
    {
      uint64_t v5 = "NonInteractive";
      if (a2 == 1) {
        uint64_t v5 = "Interactive";
      }
      objc_msgSend( (id)qword_100219F60,  "WFLog:message:",  3,  "ATJManager: setting ask-to-join interaction mode to %s",  v5);
    }

    objc_autoreleasePoolPop(v4);
    *(_DWORD *)(a1 + 20) = a2;
    *(void *)(a1 + 40) = 0LL;
    sub_100134140(a1);
  }

void sub_100134140(uint64_t a1)
{
  if (a1)
  {
    CFHashCode v2 = *(const __CFArray **)(a1 + 24);
    if (v2 && CFArrayGetCount(v2))
    {
      CFIndex Count = CFArrayGetCount(*(CFArrayRef *)(a1 + 24));
      if (CFArrayGetCount(*(CFArrayRef *)(a1 + 24)) >= 1)
      {
        for (CFIndex i = 0LL; i < CFArrayGetCount(*(CFArrayRef *)(a1 + 24)); ++i)
        {
          ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(*(CFArrayRef *)(a1 + 24), i);
          if (ValueAtIndex)
          {
            uint64_t v6 = ValueAtIndex;
            double Current = CFAbsoluteTimeGetCurrent();
            double v8 = sub_100134EA0(v6);
            Value = (const __CFDate *)CFDictionaryGetValue(v6, @"atjHistTblEntCreationTimeStamp");
            if (!Value) {
              goto LABEL_19;
            }
            double AbsoluteTime = CFDateGetAbsoluteTime(Value);
            if (AbsoluteTime == 0.0 || Current <= AbsoluteTime)
            {
              uint64_t v16 = objc_autoreleasePoolPush();
              if (qword_100219F60)
              {
                dispatch_time_t v24 = v16;
                objc_msgSend( (id)qword_100219F60,  "WFLog:message:",  3,  "%s: current time is less than creation time",  "__WiFiATJMgrATJHistTblEntGetAverageInRangeTime");
                uint64_t v16 = v24;
              }

              objc_autoreleasePoolPop(v16);
LABEL_19:
              if (!CFEqual(v6, *(CFTypeRef *)(a1 + 32))) {
                CFArrayRemoveValueAtIndex(*(CFMutableArrayRef *)(a1 + 24), i--);
              }
              continue;
            }

            double v12 = (Current - AbsoluteTime) / 86400.0;
            if (v12 == 0.0) {
              double v12 = 1.0;
            }
            if (v8 / v12 < dbl_10017FD00[*(_BYTE *)(a1 + 57) == 0]) {
              goto LABEL_19;
            }
            double v13 = CFAbsoluteTimeGetCurrent();
            CFDataRef v14 = (const __CFDate *)CFDictionaryGetValue(v6, @"atjHistTblEntCreationTimeStamp");
            if (v14)
            {
              double v15 = CFDateGetAbsoluteTime(v14);
              if (v15 == 0.0 || v13 <= v15)
              {
                uint64_t v17 = objc_autoreleasePoolPush();
                if (qword_100219F60) {
                  objc_msgSend( (id)qword_100219F60,  "WFLog:message:",  3,  "%s: current time is less than last seen time",  "__WiFiATJMgrATJHistTblEntGetTimeElapsedSinceLastSeen");
                }
                objc_autoreleasePoolPop(v17);
                continue;
              }

              if (v13 - v15 > dbl_10017FD10[*(_BYTE *)(a1 + 57) == 0]) {
                goto LABEL_19;
              }
            }
          }
        }
      }

      CFNumberRef v18 = objc_autoreleasePoolPush();
      uint64_t v19 = qword_100219F60;
      if (!qword_100219F60) {
        goto LABEL_32;
      }
      CFIndex v22 = Count;
      CFIndex v23 = CFArrayGetCount(*(CFArrayRef *)(a1 + 24));
      int v20 = "ATJManager: entries before cleanup %ld, entries after cleanup %ld";
      CFDataRef v21 = (void *)v19;
    }

    else
    {
      CFNumberRef v18 = objc_autoreleasePoolPush();
      CFDataRef v21 = (void *)qword_100219F60;
      if (!qword_100219F60) {
        goto LABEL_32;
      }
      int v20 = "ATJManager: no entries to purge";
    }

    objc_msgSend(v21, "WFLog:message:", 3, v20, v22, v23);
LABEL_32:
    objc_autoreleasePoolPop(v18);
  }

void sub_1001343C0(uint64_t a1, unsigned int a2)
{
  if (a1)
  {
    if (*(_BYTE *)(a1 + 58))
    {
      BOOL v4 = objc_autoreleasePoolPush();
      if (qword_100219F60) {
        objc_msgSend( (id)qword_100219F60,  "WFLog:message:",  3,  "%s: Lockdown Mode is enabled, ignoring SetATJMode %ld",  "WiFiATJMgrSetATJMode",  a2);
      }
      objc_autoreleasePoolPop(v4);
    }

    else if (*(unsigned __int8 *)(a1 + 16) != a2)
    {
      *(_BYTE *)(a1 + 16) = a2;
      if (!a2)
      {
        uint64_t v5 = *(const void **)(a1 + 32);
        if (v5)
        {
          CFRelease(v5);
          *(void *)(a1 + 32) = 0LL;
        }

        *(void *)(a1 + 40) = 0LL;
        *(void *)(a1 + 4_Block_object_dispose((const void *)(v1 - 48), 8) = 0LL;
        *(_BYTE *)(a1 + 56) = 0;
        CFArrayRemoveAllValues(*(CFMutableArrayRef *)(a1 + 24));
      }
    }
  }

void sub_100134480(uint64_t a1, int a2)
{
  if (a1)
  {
    *(_BYTE *)(a1 + 57) = a2;
    uint64_t v3 = objc_autoreleasePoolPush();
    if (qword_100219F60)
    {
      BOOL v4 = "enabled";
      if (!a2) {
        BOOL v4 = "disabled";
      }
      objc_msgSend((id)qword_100219F60, "WFLog:message:", 3, "ATJManager: atj test mode %s ", v4);
    }

    objc_autoreleasePoolPop(v3);
  }

uint64_t sub_1001344F8(uint64_t result)
{
  if (result) {
    return *(unsigned __int8 *)(result + 57);
  }
  return result;
}

uint64_t sub_100134504(uint64_t result)
{
  if (result) {
    return *(unsigned int *)(result + 20);
  }
  return result;
}

uint64_t sub_100134510(uint64_t result)
{
  if (result) {
    return *(unsigned __int8 *)(result + 16);
  }
  return result;
}

BOOL sub_10013451C(uint64_t a1, BOOL a2, const __CFArray *a3, uint64_t a4)
{
  double Current = CFAbsoluteTimeGetCurrent();
  if (!a1) {
    return 0LL;
  }
  double v9 = Current;
  uint64_t v10 = objc_autoreleasePoolPush();
  if (qword_100219F60)
  {
    if (*(_DWORD *)(a1 + 20) == 1) {
      uint64_t v11 = "Interactive";
    }
    else {
      uint64_t v11 = "NonInteractive";
    }
    objc_msgSend( (id)qword_100219F60,  "WFLog:message:",  3,  "ATJManager: atjAction=%d atjEnabled=%d userInteractionMode=%s discovered %ld networks",  a4,  *(unsigned __int8 *)(a1 + 16),  v11,  CFArrayGetCount((CFArrayRef)a2));
  }

  objc_autoreleasePoolPop(v10);
  if (a2)
  {
    if (!CFArrayGetCount((CFArrayRef)a2) || *(_DWORD *)(a1 + 20) != 1)
    {
LABEL_33:
      a2 = 0LL;
      goto LABEL_118;
    }

    CFIndex Count = CFArrayGetCount((CFArrayRef)a2);
    if (a3 && Count && CFArrayGetCount(a3) && CFArrayGetCount((CFArrayRef)a2) >= 1)
    {
      CFIndex v13 = 0LL;
      while (1)
      {
        ValueAtIndex = CFArrayGetValueAtIndex((CFArrayRef)a2, v13);
        if (ValueAtIndex)
        {
          double v15 = ValueAtIndex;
          v84.length = CFArrayGetCount(a3);
          v84.id location = 0LL;
          if (CFArrayContainsValue(a3, v84, v15)) {
            break;
          }
        }

        if (++v13 >= CFArrayGetCount((CFArrayRef)a2)) {
          goto LABEL_18;
        }
      }

      dispatch_time_t v24 = objc_autoreleasePoolPush();
      if (qword_100219F60) {
        objc_msgSend( (id)qword_100219F60,  "WFLog:message:",  3,  "%s: in range of preferred network.",  "__WiFiATJMgrIsPreferredNetworkInRange");
      }
      objc_autoreleasePoolPop(v24);
      goto LABEL_33;
    }

uint64_t sub_100134DA8(const __CFDictionary *a1, CFArrayRef theArray)
{
  CFIndex Count = CFArrayGetCount(theArray);
  uint64_t result = 0LL;
  if (theArray)
  {
    if (Count)
    {
      uint64_t result = (uint64_t)CFDictionaryGetValue(a1, @"atjHistTblEntBSSIDList");
      if (result)
      {
        uint64_t v6 = (const __CFArray *)result;
        CFIndex v7 = CFArrayGetCount((CFArrayRef)result);
        if (v7 >= 1)
        {
          CFIndex v8 = v7;
          CFIndex v9 = 0LL;
          while (1)
          {
            ValueAtIndex = CFArrayGetValueAtIndex(v6, v9);
            if (ValueAtIndex)
            {
              if (Count >= 1) {
                break;
              }
            }

double sub_100134EA0(const __CFDictionary *a1)
{
  uint64_t valuePtr = 0LL;
  double v1 = 0.0;
  if (a1)
  {
    Value = (const __CFNumber *)CFDictionaryGetValue(a1, @"atjHistTblEntInRangeTime");
    if (Value)
    {
      return (double)CFNumberGetValue(Value, kCFNumberDoubleType, &valuePtr);
    }

    else
    {
      BOOL v4 = objc_autoreleasePoolPush();
      if (qword_100219F60) {
        [(id)qword_100219F60 WFLog:4 message:"atjTableEntry does not have in range time"];
      }
      objc_autoreleasePoolPop(v4);
    }
  }

  return v1;
}

void sub_100134F2C(uint64_t a1)
{
  if (a1)
  {
    double v1 = *(__CFDictionary **)(a1 + 32);
    if (v1) {
      CFDictionarySetValue(v1, @"atjHistTblEntUserPromptPending", kCFBooleanFalse);
    }
  }

void sub_100134F54(void *a1)
{
  if (!a1) {
    sub_10015492C();
  }
  CFTypeID v2 = CFGetTypeID(a1);
  uint64_t v3 = qword_100219E80;
  if (!qword_100219E80)
  {
    pthread_once(&stru_1002192D0, (void (*)(void))sub_100133FCC);
    uint64_t v3 = qword_100219E80;
  }

  if (v2 != v3) {
    sub_100154954();
  }
  BOOL v4 = (const void *)a1[3];
  if (v4)
  {
    CFRelease(v4);
    a1[3] = 0LL;
  }

  uint64_t v5 = (const void *)a1[4];
  if (v5)
  {
    CFRelease(v5);
    a1[4] = 0LL;
  }

uint64_t sub_100134FD8(const __CFDictionary *a1, const __CFDictionary *a2)
{
  else {
    uint64_t v2 = 0LL;
  }
  if (a2) {
    uint64_t v2 = 1LL;
  }
  if (a1 && a2)
  {
    Value = (const __CFDate *)CFDictionaryGetValue(a1, @"atjHistTblEntLastSeenTimeStamp");
    double v5 = 0.0;
    double AbsoluteTime = 0.0;
    if (Value) {
      double AbsoluteTime = CFDateGetAbsoluteTime(Value);
    }
    CFIndex v7 = (const __CFDate *)CFDictionaryGetValue(a2, @"atjHistTblEntLastSeenTimeStamp");
    if (v7) {
      double v5 = CFDateGetAbsoluteTime(v7);
    }
    uint64_t v2 = -1LL;
    if (AbsoluteTime <= v5) {
      return 0LL;
    }
  }

  return v2;
}

void sub_100135154(id a1, BOOL a2, NSError *a3)
{
  BOOL v4 = a2;
  double v5 = objc_autoreleasePoolPush();
  if (qword_100219F60) {
    [(id)qword_100219F60 WFLog:3, "%s: granted %d error %@", "-[WiFiUserNotificationManager initWithQueue:supportsWAPI:]_block_invoke", v4, a3 message];
  }
  objc_autoreleasePoolPop(v5);
}

uint64_t sub_100135C7C(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) callback];
  return (*((uint64_t (**)(id, void, void, void, id))v2 + 2))( v2,  *(unsigned int *)(a1 + 48),  *(void *)(a1 + 40),  *(unsigned int *)(a1 + 52),  [*(id *)(a1 + 32) callbackContext]);
}

void sub_10013619C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, ...)
{
}

void sub_1001361B8(uint64_t a1, void *a2)
{
  if ([a2 count])
  {
    BOOL v4 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      [(id)qword_100219F60 WFLog:3, "%s: delivered notification is still visible %@", "-[WiFiUserNotificationManager dispatchNotificationWithRecommendation:currentLocation:force:]_block_invoke", a2 message];
    }
    objc_autoreleasePoolPop(v4);
  }

  else
  {
    id v5 = objc_msgSend( objc_msgSend(*(id *)(a1 + 32), "notificationMapping"),  "objectForKey:",  objc_msgSend(*(id *)(a1 + 32), "visibleRequest"));
    uint64_t v6 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      [(id)qword_100219F60 WFLog:3, "%s: no delivered notifications, clearing visible request (%@) for recommendation %@", "-[WiFiUserNotificationManager dispatchNotificationWithRecommendation:currentLocation:force:]_block_invoke", objc_msgSend(*(id *)(a1 + 32), "visibleRequest"), v5 message];
    }
    objc_autoreleasePoolPop(v6);
    [*(id *)(a1 + 32) setVisibleRequest:0];
    objc_msgSend(objc_msgSend(*(id *)(a1 + 32), "notificationMapping"), "removeAllObjects");
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100136320;
    block[3] = &unk_1001E63A8;
    __int128 v8 = *(_OWORD *)(a1 + 32);
    uint64_t v9 = *(void *)(a1 + 48);
    char v10 = *(_BYTE *)(a1 + 56);
    dispatch_async((dispatch_queue_t)qword_100219F80, block);
  }

id sub_100136320(uint64_t a1)
{
  return [*(id *)(a1 + 32) dispatchNotificationWithRecommendation:*(void *)(a1 + 40) currentLocation:*(void *)(a1 + 48) force:*(unsigned __int8 *)(a1 + 56)];
}

void sub_100136334(uint64_t a1, uint64_t a2)
{
}

void sub_100136344(uint64_t a1)
{
}

void sub_100136350(uint64_t a1, void *a2)
{
  BOOL v4 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8LL) + 40LL);
  id v5 = objc_autoreleasePoolPush();
  if (a2)
  {
    if (qword_100219F60) {
      [(id)qword_100219F60 WFLog:3, "%s: Error: %@", "-[WiFiUserNotificationManager dispatchNotificationWithRecommendation:currentLocation:force:]_block_invoke", objc_msgSend(a2, "localizedDescription") message];
    }
    objc_autoreleasePoolPop(v5);
  }

  else
  {
    if (qword_100219F60) {
      [(id)qword_100219F60 WFLog:3, "%s: Added RequestId: %@", "-[WiFiUserNotificationManager dispatchNotificationWithRecommendation:currentLocation:force:]_block_invoke", *(void *)(a1 + 32) message];
    }
    objc_autoreleasePoolPop(v5);
    [v4 setVisibleRequest:*(void *)(a1 + 32)];
    if (*(_BYTE *)(a1 + 64))
    {
      uint64_t v6 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
      -[NSMutableDictionary setObject:forKey:]( v6,  "setObject:forKey:",  [*(id *)(a1 + 40) SSID],  @"ssid");
      -[NSMutableDictionary setObject:forKey:](v6, "setObject:forKey:", *(void *)(a1 + 32), @"identifier");
      -[NSMutableDictionary setObject:forKey:](v6, "setObject:forKey:", &off_1002053E8, @"type");
      uint64_t v7 = *(void *)(a1 + 48);
      if (v7) {
        -[NSMutableDictionary setObject:forKey:](v6, "setObject:forKey:", v7, @"location");
      }
      [v4 _startTimerForNotificationWithUserInfo:v6];
      if (v6) {
        CFRelease(v6);
      }
    }
  }

void sub_1001367A4( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, char a16)
{
}

void sub_1001367C4(uint64_t a1, void *a2)
{
  if ([a2 count])
  {
    BOOL v4 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      [(id)qword_100219F60 WFLog:3, "%s: delivered notification is still visible %@", "-[WiFiUserNotificationManager dispatchNotificationWithRandomMAC:]_block_invoke", a2 message];
    }
    objc_autoreleasePoolPop(v4);
  }

  else
  {
    [*(id *)(a1 + 32) setVisibleRequest:0];
    objc_msgSend(objc_msgSend(*(id *)(a1 + 32), "notificationMapping"), "removeAllObjects");
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1001368A0;
    block[3] = &unk_1001E2778;
    __int128 v6 = *(_OWORD *)(a1 + 32);
    dispatch_async((dispatch_queue_t)qword_100219F80, block);
  }

id sub_1001368A0(uint64_t a1)
{
  return [*(id *)(a1 + 32) dispatchNotificationWithRandomMAC:*(void *)(a1 + 40)];
}

void sub_1001368AC(uint64_t a1, void *a2)
{
  BOOL v4 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL);
  id v5 = objc_autoreleasePoolPush();
  if (a2)
  {
    if (qword_100219F60) {
      [(id)qword_100219F60 WFLog:3, "%s: Error: %@", "-[WiFiUserNotificationManager dispatchNotificationWithRandomMAC:]_block_invoke_3", objc_msgSend(a2, "localizedDescription") message];
    }
    objc_autoreleasePoolPop(v5);
  }

  else
  {
    if (qword_100219F60) {
      [(id)qword_100219F60 WFLog:3, "%s: Added RequestId: %@", "-[WiFiUserNotificationManager dispatchNotificationWithRandomMAC:]_block_invoke_3", *(void *)(a1 + 32) message];
    }
    objc_autoreleasePoolPop(v5);
    [v4 setVisibleRequest:*(void *)(a1 + 32)];
  }

void sub_100136D84( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, char a18)
{
}

void sub_100136DA4(uint64_t a1, void *a2)
{
  if ([a2 count])
  {
    BOOL v4 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      [(id)qword_100219F60 WFLog:3, "%s: delivered notification is still visible %@", "-[WiFiUserNotificationManager dispatchJoinAlertForNetwork:withProviderName:andReason:]_block_invoke", a2 message];
    }
    objc_autoreleasePoolPop(v4);
  }

  else
  {
    [*(id *)(a1 + 32) setVisibleRequest:0];
    objc_msgSend(objc_msgSend(*(id *)(a1 + 32), "notificationMapping"), "removeAllObjects");
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100136E90;
    block[3] = &unk_1001E6470;
    __int128 v6 = *(_OWORD *)(a1 + 32);
    uint64_t v7 = *(void *)(a1 + 48);
    int v8 = *(_DWORD *)(a1 + 56);
    dispatch_async((dispatch_queue_t)qword_100219F80, block);
  }

id sub_100136E90(uint64_t a1)
{
  return [*(id *)(a1 + 32) dispatchJoinAlertForNetwork:*(void *)(a1 + 40) withProviderName:*(void *)(a1 + 48) andReason:*(unsigned int *)(a1 + 56)];
}

void sub_100136EA4(uint64_t a1, void *a2)
{
  BOOL v4 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL);
  id v5 = objc_autoreleasePoolPush();
  if (a2)
  {
    if (qword_100219F60) {
      [(id)qword_100219F60 WFLog:3, "%s: Error: %@", "-[WiFiUserNotificationManager dispatchJoinAlertForNetwork:withProviderName:andReason:]_block_invoke_3", objc_msgSend(a2, "localizedDescription") message];
    }
    objc_autoreleasePoolPop(v5);
  }

  else
  {
    if (qword_100219F60) {
      [(id)qword_100219F60 WFLog:3, "%s: Added RequestId: %@", "-[WiFiUserNotificationManager dispatchJoinAlertForNetwork:withProviderName:andReason:]_block_invoke_3", *(void *)(a1 + 32) message];
    }
    objc_autoreleasePoolPop(v5);
    [v4 setVisibleRequest:*(void *)(a1 + 32)];
  }

void sub_100137320( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17)
{
}

void sub_100137340(uint64_t a1, void *a2)
{
  if ([a2 count])
  {
    BOOL v4 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      [(id)qword_100219F60 WFLog:3, "%s: delivered notification is still visible %@", "-[WiFiUserNotificationManager dispatchLowDataModeAlertForNetwork:withReason:]_block_invoke", a2 message];
    }
    objc_autoreleasePoolPop(v4);
  }

  else
  {
    [*(id *)(a1 + 32) setVisibleRequest:0];
    objc_msgSend(objc_msgSend(*(id *)(a1 + 32), "notificationMapping"), "removeAllObjects");
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100137424;
    block[3] = &unk_1001E4708;
    __int128 v6 = *(_OWORD *)(a1 + 32);
    int v7 = *(_DWORD *)(a1 + 48);
    dispatch_async((dispatch_queue_t)qword_100219F80, block);
  }

id sub_100137424(uint64_t a1)
{
  return [*(id *)(a1 + 32) dispatchLowDataModeAlertForNetwork:*(void *)(a1 + 40) withReason:*(unsigned int *)(a1 + 48)];
}

void sub_100137434(uint64_t a1, void *a2)
{
  BOOL v4 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL);
  id v5 = objc_autoreleasePoolPush();
  if (a2)
  {
    if (qword_100219F60) {
      [(id)qword_100219F60 WFLog:3, "%s: Error: %@", "-[WiFiUserNotificationManager dispatchLowDataModeAlertForNetwork:withReason:]_block_invoke_3", objc_msgSend(a2, "localizedDescription") message];
    }
    objc_autoreleasePoolPop(v5);
  }

  else
  {
    if (qword_100219F60) {
      [(id)qword_100219F60 WFLog:3, "%s: Added RequestId: %@", "-[WiFiUserNotificationManager dispatchLowDataModeAlertForNetwork:withReason:]_block_invoke_3", *(void *)(a1 + 32) message];
    }
    objc_autoreleasePoolPop(v5);
    [v4 setVisibleRequest:*(void *)(a1 + 32)];
  }

void sub_100137A20( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
}

void sub_100137A40(uint64_t a1, void *a2)
{
  if ([a2 count])
  {
    BOOL v4 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      [(id)qword_100219F60 WFLog:3, "%s: delivered notification is still visible %@", "-[WiFiUserNotificationManager dispatchNotificationWithColocatedScanResult:fromScanResult:]_block_invoke", a2 message];
    }
    objc_autoreleasePoolPop(v4);
  }

  else
  {
    [*(id *)(a1 + 32) setVisibleRequest:0];
    objc_msgSend(objc_msgSend(*(id *)(a1 + 32), "notificationMapping"), "removeAllObjects");
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100137B24;
    block[3] = &unk_1001E5A30;
    __int128 v6 = *(_OWORD *)(a1 + 32);
    uint64_t v7 = *(void *)(a1 + 48);
    dispatch_async((dispatch_queue_t)qword_100219F80, block);
  }

id sub_100137B24(uint64_t a1)
{
  return [*(id *)(a1 + 32) dispatchNotificationWithColocatedScanResult:*(void *)(a1 + 40) fromScanResult:*(void *)(a1 + 48)];
}

void sub_100137B34(uint64_t a1)
{
  id v2 = objc_autoreleasePoolPush();
  if (qword_100219F60) {
    [(id)qword_100219F60 WFLog:3, "%s: Did invoke -[UNUserNotificationCenter didReceiveNotificationResponse:withCompletionHandler:] with test action %@", "-[WiFiUserNotificationManager dispatchNotificationWithColocatedScanResult:fromScanResult:]_block_invoke_3", *(void *)(a1 + 32) message];
  }
  objc_autoreleasePoolPop(v2);
}

void sub_100137B94(uint64_t a1, void *a2)
{
  BOOL v4 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL);
  id v5 = objc_autoreleasePoolPush();
  if (a2)
  {
    if (qword_100219F60) {
      [(id)qword_100219F60 WFLog:3, "%s: Error: %@", "-[WiFiUserNotificationManager dispatchNotificationWithColocatedScanResult:fromScanResult:]_block_invoke_4", objc_msgSend(a2, "localizedDescription") message];
    }
    objc_autoreleasePoolPop(v5);
  }

  else
  {
    if (qword_100219F60) {
      [(id)qword_100219F60 WFLog:3, "%s: Added RequestId: %@", "-[WiFiUserNotificationManager dispatchNotificationWithColocatedScanResult:fromScanResult:]_block_invoke_4", *(void *)(a1 + 32) message];
    }
    objc_autoreleasePoolPop(v5);
    [v4 setVisibleRequest:*(void *)(a1 + 32)];
  }

void sub_100137F24( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
}

void sub_100137F40(uint64_t a1, void *a2)
{
  if ([a2 count])
  {
    BOOL v4 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      [(id)qword_100219F60 WFLog:3, "%s: delivered notification is still visible %@", "-[WiFiUserNotificationManager dispatchNotificationWithAskToJoinHotspotRecommendation:]_block_invoke", a2 message];
    }
    objc_autoreleasePoolPop(v4);
  }

  else
  {
    id v5 = *(void **)(a1 + 32);
    if (v5[8])
    {
      __int128 v6 = objc_autoreleasePoolPush();
      if (qword_100219F60) {
        objc_msgSend( (id)qword_100219F60,  "WFLog:message:",  3,  "%s: canceling timer",  "-[WiFiUserNotificationManager dispatchNotificationWithAskToJoinHotspotRecommendation:]_block_invoke");
      }
      objc_autoreleasePoolPop(v6);
      dispatch_source_cancel(*(dispatch_source_t *)(*(void *)(a1 + 32) + 64LL));
      id v5 = *(void **)(a1 + 32);
    }

    [v5 setVisibleRequest:0];
    objc_msgSend(objc_msgSend(*(id *)(a1 + 32), "notificationMapping"), "removeAllObjects");
  }

void sub_100138024(uint64_t a1, void *a2)
{
  BOOL v4 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL);
  id v5 = objc_autoreleasePoolPush();
  if (a2)
  {
    if (qword_100219F60) {
      [(id)qword_100219F60 WFLog:3, "%s: Error: %@", "-[WiFiUserNotificationManager dispatchNotificationWithAskToJoinHotspotRecommendation:]_block_invoke_2", objc_msgSend(a2, "localizedDescription") message];
    }
    objc_autoreleasePoolPop(v5);
  }

  else
  {
    if (qword_100219F60) {
      [(id)qword_100219F60 WFLog:3, "%s: Added RequestId: %@", "-[WiFiUserNotificationManager dispatchNotificationWithAskToJoinHotspotRecommendation:]_block_invoke_2", *(void *)(a1 + 32) message];
    }
    objc_autoreleasePoolPop(v5);
    [v4 setVisibleRequest:*(void *)(a1 + 32)];
    if (*(_BYTE *)(a1 + 56))
    {
      __int128 v6 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
      -[NSMutableDictionary setObject:forKey:](v6, "setObject:forKey:", *(void *)(a1 + 40), @"ssid");
      -[NSMutableDictionary setObject:forKey:](v6, "setObject:forKey:", *(void *)(a1 + 32), @"identifier");
      -[NSMutableDictionary setObject:forKey:](v6, "setObject:forKey:", &off_100205400, @"type");
      [v4 _startTimerForNotificationWithUserInfo:v6];
      if (v6) {
        CFRelease(v6);
      }
    }
  }

id sub_1001384F4(uint64_t a1)
{
  return [*(id *)(a1 + 32) _timeoutTimerDidFire:*(void *)(a1 + 40)];
}

void sub_100138500(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 64LL) = 0LL;
}

void sub_1001394E4(_Unwind_Exception *a1)
{
}

id sub_100139528(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id result = [a2 doesContain:*(void *)(a1 + 64)];
  if ((_DWORD)result)
  {
    [a2 timeSinceFirstDeferral:*(void *)(a1 + 64)];
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = v9;
    double v10 = *(double *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL);
    id result = [*(id *)(a1 + 32) deferIntervalSecs];
    if (v10 >= v11)
    {
      *(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = 0;
      *(void *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL) = a3;
      if ((objc_msgSend( objc_msgSend(a2, "ssid"),  "isEqualToString:",  sub_100095BC8(*(const void **)(*(void *)(a1 + 32) + 32))) & 1) == 0)
      {
        CFIndex v12 = objc_autoreleasePoolPush();
        if (qword_100219F60) {
          [(id)qword_100219F60 WFLog:3, "%s: %@ was a time-deferred network for %2.1f secs. No longer time-deferring", "-[WiFiTimeDeferredNetworksAJManager canDeferNetwork:withUsageRank:andMotionState:]_block_invoke", sub_100095BC8(*(const void **)(a1 + 64)), *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) message];
        }
        objc_autoreleasePoolPop(v12);
      }

      id result = [a2 reset];
      *a4 = 1;
    }
  }

  return result;
}

void sub_100139A08( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
}

void sub_100139A34(uint64_t a1, uint64_t a2)
{
}

void sub_100139A44(uint64_t a1)
{
}

id sub_100139A50(void *a1, void *a2, uint64_t a3, _BYTE *a4)
{
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  int v8 = *(void **)(a1[4] + 24LL);
  id v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v15;
LABEL_3:
    uint64_t v12 = 0LL;
    while (1)
    {
      if (*(void *)v15 != v11) {
        objc_enumerationMutation(v8);
      }
      id result = [a2 doesContain:*(void *)(*((void *)&v14 + 1) + 8 * v12)];
      if (v10 == (id)++v12)
      {
        id v10 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
        if (v10) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
  }

  else
  {
LABEL_9:
    [*(id *)(*(void *)(a1[5] + 8) + 40) addIndex:a3];
    objc_msgSend(objc_msgSend(*(id *)(a1[4] + 16), "objectAtIndex:", a3), "reset");
    id result = objc_msgSend(objc_msgSend(*(id *)(a1[4] + 16), "objectAtIndex:", a3), "ssid");
    if (result)
    {
      [*(id *)(*(void *)(a1[6] + 8) + 40) appendFormat:@"%@", objc_msgSend(objc_msgSend(*(id *)(a1[4] + 16), "objectAtIndex:", a3), "ssid")];
      id result = [*(id *)(a1[4] + 16) count];
      if ((id)(a3 + 1) == result) {
        *a4 = 1;
      }
      else {
        return objc_msgSend(*(id *)(*(void *)(a1[6] + 8) + 40), "appendString:", @", ");
      }
    }
  }

  return result;
}

void sub_100139CF8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

id sub_100139D10(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id result = [a2 doesContain:*(void *)(a1 + 40)];
  if ((_DWORD)result)
  {
    id result = [a2 reset];
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = a3;
    *a4 = 1;
  }

  return result;
}

void sub_100139E3C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

id sub_100139E54(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id result = [a2 doesContain:*(void *)(*(void *)(a1 + 32) + 32)];
  if ((_DWORD)result)
  {
    id result = [a2 reset];
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = a3;
    *a4 = 1;
  }

  return result;
}

void sub_10013A074(_Unwind_Exception *a1)
{
}

id sub_10013A0A0(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id result = [a2 ssid];
  if (result)
  {
    id result = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) appendFormat:@"%@", objc_msgSend(a2, "ssid")];
    if (a3 + 1 == *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL)) {
      *a4 = 1;
    }
    else {
      return objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), "appendString:", @", ");
    }
  }

  return result;
}

int64_t sub_10013A5A4(id a1, id a2, id a3)
{
  unint64_t v4 = (unint64_t)a2;
  unint64_t v5 = (unint64_t)a3;
  __int128 v6 = (void *)v5;
  if (v4 | v5) {
    uint64_t v7 = -1LL;
  }
  else {
    uint64_t v7 = 0LL;
  }
  if (v4) {
    int64_t v8 = 1LL;
  }
  else {
    int64_t v8 = v7;
  }
  if (v4 && v5)
  {
    if ([(id)v4 group]) {
      uint64_t v9 = (100 * (3 - [(id)v4 group])) & 0xFCLL;
    }
    else {
      uint64_t v9 = 0LL;
    }
    if ([v6 group]) {
      uint64_t v10 = (100 * (3 - [v6 group])) & 0xFCLL;
    }
    else {
      uint64_t v10 = 0LL;
    }
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([(id)v4 batteryLife]);
    if ((uint64_t)[v11 integerValue] >= 20)
    {
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([(id)v4 batteryLife]);
      v9 += (uint64_t)[v12 integerValue] / 10;
    }

    CFIndex v13 = (void *)objc_claimAutoreleasedReturnValue([v6 batteryLife]);
    if ((uint64_t)[v13 integerValue] >= 20)
    {
      __int128 v14 = (void *)objc_claimAutoreleasedReturnValue([v6 batteryLife]);
      v10 += (uint64_t)[v14 integerValue] / 10;
    }

    unsigned __int8 v15 = [(id)v4 networkType];
    __int128 v16 = (void *)objc_claimAutoreleasedReturnValue([(id)v4 signalStrength]);
    unsigned __int8 v17 = v9 + v15 + [v16 integerValue];

    unsigned __int8 v18 = [v6 networkType];
    BOOL v19 = (void *)objc_claimAutoreleasedReturnValue([v6 signalStrength]);
    unsigned __int8 v20 = v10 + v18 + [v19 integerValue];

    else {
      uint64_t v21 = -1LL;
    }
    else {
      int64_t v8 = v21;
    }
  }

  return v8;
}

void sub_10013AAD8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  uint64_t v11 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10013AB08(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_10013AB18(uint64_t a1)
{
}

void sub_10013AB20(uint64_t a1, void *a2, void *a3)
{
  id v11 = a2;
  id v5 = a3;
  __int128 v6 = v5;
  if (v5)
  {
    uint64_t v7 = (void **)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL);
    int64_t v8 = v5;
  }

  else
  {
    uint64_t v7 = (void **)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL);
    int64_t v8 = v11;
  }

  id v9 = v8;
  uint64_t v10 = *v7;
  CFDateRef v7 = v9;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

uint64_t sub_10013AC3C(uint64_t result)
{
  *(_BYTE *)(*(void *)(*(void *)(result + 40) + 8LL) + 24LL) = *(_BYTE *)(*(void *)(result + 32) + 8LL);
  return result;
}

id sub_10013ACE8(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) hotspotSession]);
  [v2 startBrowsing];

  return [*(id *)(a1 + 32) setScanning:1];
}

id sub_10013AD90(uint64_t a1)
{
  id v2 = objc_autoreleasePoolPush();
  if (qword_100219F60) {
    objc_msgSend( (id)qword_100219F60,  "WFLog:message:",  3,  "Stopping hotspot browsing (isBrowsing %d removeCache %d)",  *(unsigned __int8 *)(*(void *)(a1 + 32) + 8),  *(unsigned __int8 *)(a1 + 40));
  }
  objc_autoreleasePoolPop(v2);
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) hotspotSession]);
  [v3 stopBrowsing];

  id result = [*(id *)(a1 + 32) setScanning:0];
  if (*(_BYTE *)(a1 + 40)) {
    return [*(id *)(a1 + 32) setNetworks:0];
  }
  return result;
}

uint64_t sub_10013B594()
{
  uint64_t result = qword_100219E88;
  if (!qword_100219E88)
  {
    pthread_once(&stru_1002193A0, (void (*)(void))sub_10013B5D0);
    return qword_100219E88;
  }

  return result;
}

uint64_t sub_10013B5D0()
{
  uint64_t result = _CFRuntimeRegisterClass(&unk_1001E66B0);
  qword_100219E88 = result;
  return result;
}

uint64_t sub_10013B5F4(uint64_t a1)
{
  id v2 = objc_autoreleasePoolPush();
  if (objc_opt_class(&OBJC_CLASS___AVAudioSessionRouteDescription))
  {
    if (!qword_100219E88) {
      pthread_once(&stru_1002193A0, (void (*)(void))sub_10013B5D0);
    }
    uint64_t Instance = _CFRuntimeCreateInstance(a1);
    uint64_t v4 = Instance;
    if (Instance)
    {
      *(_OWORD *)(Instance + 16) = 0u;
      *(_OWORD *)(Instance + 32) = 0u;
      id v5 = objc_alloc_init(&OBJC_CLASS___AudioRouteMonitor);
      *(void *)(v4 + 40) = v5;
      -[AudioRouteMonitor initializeWithHandler:](v5, "initializeWithHandler:", v4);
    }
  }

  else
  {
    uint64_t v4 = 0LL;
  }

  objc_autoreleasePoolPop(v2);
  return v4;
}

void sub_10013B6A0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = objc_autoreleasePoolPush();
  if (a1)
  {
    *(void *)(a1 + 16) = a2;
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10013B72C;
    block[3] = &unk_1001E2620;
    void block[4] = a1;
    dispatch_async(global_queue, block);
  }

  objc_autoreleasePoolPop(v4);
}

void sub_10013B72C(uint64_t a1)
{
}

void sub_10013B758(uint64_t a1)
{
  id v2 = objc_autoreleasePoolPush();
  if (a1 && *(void *)(a1 + 24))
  {
    __int128 v12 = 0u;
    __int128 v13 = 0u;
    __int128 v14 = 0u;
    __int128 v15 = 0u;
    uint64_t v3 = -[AVAudioSessionRouteDescription outputs]( -[AVAudioSession currentRoute]( +[AVAudioSession sharedInstance](&OBJC_CLASS___AVAudioSession, "sharedInstance"),  "currentRoute"),  "outputs");
    id v4 = -[NSArray countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v12,  v16,  16LL);
    if (v4)
    {
      id v5 = v4;
      uint64_t v6 = *(void *)v13;
      while (2)
      {
        uint64_t v7 = 0LL;
        do
        {
          if (*(void *)v13 != v6) {
            objc_enumerationMutation(v3);
          }
          if (objc_msgSend( objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * (void)v7), "portType"),  "isEqualToString:",  AVAudioSessionPortBuiltInReceiver))
          {
            char v8 = 1;
            goto LABEL_13;
          }

          uint64_t v7 = (char *)v7 + 1;
        }

        while (v5 != v7);
        id v5 = -[NSArray countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v12,  v16,  16LL);
        if (v5) {
          continue;
        }
        break;
      }
    }

    char v8 = 0;
LABEL_13:
    id v9 = *(dispatch_queue_s **)(a1 + 16);
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_10013B918;
    v10[3] = &unk_1001E6690;
    v10[4] = a1;
    char v11 = v8;
    dispatch_async(v9, v10);
  }

  objc_autoreleasePoolPop(v2);
}

void sub_10013B8D4(uint64_t a1)
{
  id v2 = objc_autoreleasePoolPush();
  if (a1)
  {
    [*(id *)(a1 + 40) stopMonitoring];
    *(void *)(a1 + 16) = 0LL;
  }

  objc_autoreleasePoolPop(v2);
}

uint64_t sub_10013B90C(uint64_t result, uint64_t a2, uint64_t a3)
{
  if (result)
  {
    *(void *)(result + 24) = a2;
    *(void *)(result + 32) = a3;
  }

  return result;
}

uint64_t sub_10013B918(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 32) + 24LL))( *(void *)(a1 + 32),  *(unsigned __int8 *)(a1 + 40),  *(void *)(*(void *)(a1 + 32) + 32LL));
}

double sub_10013B92C(uint64_t a1)
{
  if (!a1) {
    sub_10015497C();
  }
  CFTypeID v2 = CFGetTypeID((CFTypeRef)a1);
  uint64_t v3 = qword_100219E88;
  if (!qword_100219E88)
  {
    pthread_once(&stru_1002193A0, (void (*)(void))sub_10013B5D0);
    uint64_t v3 = qword_100219E88;
  }

  if (v2 != v3) {
    sub_1001549A4();
  }

  double result = 0.0;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  return result;
}

BOOL sub_10013B9A0(uint64_t a1, uint64_t a2)
{
  return a1 == a2;
}

CFStringRef sub_10013B9B0(uint64_t a1, const __CFDictionary *a2)
{
  return CFStringCreateWithFormat(kCFAllocatorDefault, a2, @"WiFiAudioRoute@%p", a1);
}

CFStringRef sub_10013B9E8(uint64_t a1)
{
  return CFStringCreateWithFormat(kCFAllocatorDefault, 0LL, @"WiFiAudioRoute@%p", a1);
}

BOOL sub_10013BA24()
{
  v0 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue([v0 stringForKey:@"DextCrashBoostMode"]);
  CFTypeID v2 = v1;
  BOOL v3 = v1 && ![v1 caseInsensitiveCompare:@"Enable"];

  return v3;
}

id sub_10013BAA0()
{
  v0 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  id v1 = [v0 integerForKey:@"DextCrashPurgePeriodInMinutes"];

  return v1;
}

id sub_10013BAE8()
{
  v0 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  id v1 = [v0 integerForKey:@"DextCrashMaxFilesCount"];

  return v1;
}

void sub_10013BB30(uint64_t *a1)
{
  uint64_t v1 = *a1;
  *((_WORD *)a1 + 25) = 0;
  if (*((_BYTE *)a1 + 48))
  {
    CFTypeID v2 = a1;
    BOOL v3 = objc_autoreleasePoolPush();
    id v4 = (void **)&qword_100219F60;
    if (qword_100219F60) {
      objc_msgSend((id)qword_100219F60, "WFLog:message:", 3, "%s Begin", "dextCoreFileProcess");
    }
    objc_autoreleasePoolPop(v3);
    id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v1,  4LL));
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v5));

    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    NSURLResourceKey v60 = NSURLCreationDateKey;
    char v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v60, 1LL));
    id v9 = (void *)objc_claimAutoreleasedReturnValue( [v7 contentsOfDirectoryAtURL:v6 includingPropertiesForKeys:v8 options:4 error:0]);

    if (v9 && [v9 count])
    {
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithBlock:]( &OBJC_CLASS___NSPredicate,  "predicateWithBlock:",  &stru_1001E6730));
      char v11 = (void *)objc_claimAutoreleasedReturnValue([v9 filteredArrayUsingPredicate:v10]);

      __int128 v12 = (void *)objc_claimAutoreleasedReturnValue([v11 sortedArrayUsingComparator:&stru_1001E6770]);
      LODWORD(v10) = *((_DWORD *)v2 + 8);
      unsigned int v13 = [v12 count];
      CFIndex v51 = v12;
      if ((int)v10 < 1441)
      {
        int v14 = *((_DWORD *)v2 + 9);
        if ((int)[v12 count] < 1)
        {
          LOWORD(v13) = 0;
        }

        else
        {
          uint64_t v44 = v11;
          CFIndex v45 = v9;
          __int128 v46 = v6;
          uint64_t v47 = v2;
          unsigned int v15 = v13;
          uint64_t v16 = 0LL;
          id v17 = 0LL;
          uint64_t v49 = v15 - v14;
          __int16 v52 = 0;
          unsigned __int8 v18 = v12;
          do
          {
            BOOL v19 = (void *)objc_claimAutoreleasedReturnValue([v18 objectAtIndexedSubscript:v16]);
            if (v16 >= (int)v49)
            {
              dispatch_time_t v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v1));
              double v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableString stringWithString:]( &OBJC_CLASS___NSMutableString,  "stringWithString:",  v24));

              [v25 appendString:@"/"];
              [v25 appendString:@"wifi-bcmwlan-dextcrash-"];
              id v55 = 0LL;
              id v56 = 0LL;
              [v19 getResourceValue:&v56 forKey:NSURLCreationDateKey error:&v55];
              id v26 = v56;
              id v27 = v55;

              id v28 = v26;
              CFNumberRef v29 = objc_alloc_init(&OBJC_CLASS___NSDateFormatter);
              -[NSDateFormatter setDateFormat:](v29, "setDateFormat:", @"yyyy-MM-dd'T'HH:mm:ss");
              uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSTimeZone systemTimeZone](&OBJC_CLASS___NSTimeZone, "systemTimeZone"));
              -[NSDateFormatter setTimeZone:](v29, "setTimeZone:", v30);

              BOOL v31 = (void *)objc_claimAutoreleasedReturnValue(-[NSDateFormatter stringFromDate:](v29, "stringFromDate:", v28));
              [v25 appendString:v31];

              [v25 appendString:@".core"];
              v32 = (void *)objc_claimAutoreleasedReturnValue([v19 path]);
              [v7 moveItemAtPath:v32 toPath:v25 error:0];

              uint64_t v54 = 66565LL;
              id v33 = v25;
              uint64_t v50 = fsctl((const char *)[v33 cStringUsingEncoding:4], 0xC0084A44uLL, &v54, 0);
              NSFileAttributeKey v58 = NSFilePosixPermissions;
              v59 = &off_100205418;
              unsigned __int16 v34 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v59,  &v58,  1LL));
              id v53 = v27;
              [v7 setAttributes:v34 ofItemAtPath:v33 error:&v53];
              id v17 = v53;

              CFIndex v35 = objc_autoreleasePoolPush();
              uint64_t v36 = *v4;
              if (*v4)
              {
                uint64_t v37 = objc_claimAutoreleasedReturnValue([v19 path]);
                unsigned int v48 = v19;
                id v38 = v17;
                id v39 = v28;
                v40 = v7;
                CFIndex v41 = v4;
                uint64_t v42 = v1;
                uint64_t v43 = (void *)v37;
                [v36 WFLog:3, "%s:process File:'%@' original path:'%@' fsctl ret:%d total_cnt:%lu purge_count:%d", "dextCoreFileProcess", v33, v37, v50, objc_msgSend(v51, "count"), v49 message];

                uint64_t v1 = v42;
                id v4 = v41;
                uint64_t v7 = v40;
                id v28 = v39;
                id v17 = v38;
                BOOL v19 = v48;
              }

              objc_autoreleasePoolPop(v35);
              ++v52;

              unsigned __int8 v18 = v51;
            }

            else
            {
              id v57 = v17;
              [v7 removeItemAtURL:v19 error:&v57];
              id v20 = v57;

              uint64_t v21 = objc_autoreleasePoolPush();
              CFIndex v22 = *v4;
              if (*v4)
              {
                CFIndex v23 = (void *)objc_claimAutoreleasedReturnValue([v19 path]);
                [v22 WFLog:3, "%s removeFile path:'%@' error:%@ total_cnt:%lu purge_count:%d", "dextCoreFileProcess", v23, v20, objc_msgSend(v18, "count"), v49 message];
              }

              objc_autoreleasePoolPop(v21);
              id v17 = v20;
            }

            ++v16;
          }

          while (v16 < (int)[v18 count]);

          uint64_t v6 = v46;
          CFTypeID v2 = v47;
          char v11 = v44;
          id v9 = v45;
          LOWORD(v13) = v52;
        }
      }

      *((_WORD *)v2 + 25) = v13;
    }
  }

BOOL sub_10013C0C8(id a1, id a2, NSDictionary *a3)
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "lastPathComponent", a3));
  unsigned __int8 v4 = [v3 hasPrefix:@"wifi-"];

  return v4;
}

int64_t sub_10013C108(id a1, NSURL *a2, NSURL *a3)
{
  id v9 = 0LL;
  unsigned __int8 v4 = a3;
  -[NSURL getResourceValue:forKey:error:](a2, "getResourceValue:forKey:error:", &v9, NSURLCreationDateKey, 0LL);
  uint64_t v8 = 0LL;
  id v5 = v9;
  -[NSURL getResourceValue:forKey:error:](v4, "getResourceValue:forKey:error:", &v8, NSURLCreationDateKey, 0LL);

  id v6 = [v5 compare:v8];
  return (int64_t)v6;
}

BOOL sub_10013C1A0(uint64_t a1, char a2)
{
  uint64_t v26 = 0LL;
  id v27 = &v26;
  uint64_t v28 = 0x2020000000LL;
  char v29 = 0;
  id v4 = *(id *)(a1 + 40);
  id v5 = objc_autoreleasePoolPush();
  if (qword_100219F60) {
    objc_msgSend( (id)qword_100219F60,  "WFLog:message:",  3,  "%s: WiFiDextCrashSoftError Enter",  "WiFiDextCrashedSoftErrorHandler");
  }
  objc_autoreleasePoolPop(v5);
  if (v4 && (a2 & 1) == 0)
  {
    id v6 = [v4 incrementCount];
    id v7 = [v4 submitMetric];
    id v8 = [v4 submitABCReportWithReason:0];
  }

  if ((a2 & 1) != 0)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  *(void *)a1,  4LL));
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v9));

    char v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    NSURLResourceKey v30 = NSURLCreationDateKey;
    __int128 v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v30, 1LL));
    unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue( [v11 contentsOfDirectoryAtURL:v10 includingPropertiesForKeys:v12 options:4 error:0]);

    if (v13)
    {
      BOOL v14 = [v13 count] == 0;

      if (v14) {
        goto LABEL_11;
      }
    }

    else
    {
    }

    uint64_t v21 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      objc_msgSend( (id)qword_100219F60,  "WFLog:message:",  3,  "%s: No Dext corefiles found isRetry:%d",  "WiFiDextCrashedSoftErrorHandler",  1);
    }
    goto LABEL_28;
  }

  sub_10013BB30((uint64_t *)a1);
  if (!*(_WORD *)(a1 + 50))
  {
    uint64_t v21 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      objc_msgSend( (id)qword_100219F60,  "WFLog:message:",  3,  "%s: No Dext corefiles found isRetry:%d",  "WiFiDextCrashedSoftErrorHandler",  0);
    }
    goto LABEL_28;
  }

void sub_10013C588( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
}

void sub_10013C5B0(uint64_t a1, void *a2, void *a3)
{
  id v11 = a2;
  id v5 = a3;
  id v6 = objc_autoreleasePoolPush();
  if (qword_100219F60) {
    [(id)qword_100219F60 WFLog:3, "%s WiFiDextCrashSoftError askToLaunchTapToRadarWithMessage result:%@, error:%@", "WiFiDextCrashedSoftErrorHandler_block_invoke", v11, v5 message];
  }
  objc_autoreleasePoolPop(v6);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 userInfo]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:@"deviceNotInteractive"]);

  if (v8)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v5 userInfo]);
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKey:@"deviceNotInteractive"]);
    *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [v10 BOOLValue];
  }
}

void sub_10013C6A8(uint64_t a1, void *a2, void *a3)
{
  id v11 = a2;
  id v5 = a3;
  id v6 = objc_autoreleasePoolPush();
  if (qword_100219F60) {
    [(id)qword_100219F60 WFLog:3, "%s WiFiDextCrashSoftError tapToRadarWithURL result:%@, error:%@", "WiFiDextCrashedSoftErrorHandler_block_invoke_2", v11, v5 message];
  }
  objc_autoreleasePoolPop(v6);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 userInfo]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:@"deviceNotInteractive"]);

  if (v8)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v5 userInfo]);
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKey:@"deviceNotInteractive"]);
    *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [v10 BOOLValue];
  }
}

void sub_10013C7FC(id a1)
{
  qword_100219E90 = objc_alloc_init(&OBJC_CLASS___WiFi3BarsObserver);
}

void sub_10013C93C(uint64_t a1)
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10013C9A0;
  block[3] = &unk_1001E2AF0;
  void block[4] = *(void *)(a1 + 32);
  dispatch_async((dispatch_queue_t)qword_100219F80, block);
}

id sub_10013C9A0(uint64_t a1)
{
  CFTypeID v2 = objc_autoreleasePoolPush();
  if (qword_100219F60) {
    objc_msgSend( (id)qword_100219F60,  "WFLog:message:",  3,  "%s: xpc connection got invalidated",  "-[WiFi3BarsObserver init]_block_invoke_2");
  }
  objc_autoreleasePoolPop(v2);
  return [*(id *)(a1 + 32) _cleanupMaintenanceTask];
}

void sub_10013CA04(uint64_t a1)
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10013CA68;
  block[3] = &unk_1001E2AF0;
  void block[4] = *(void *)(a1 + 32);
  dispatch_async((dispatch_queue_t)qword_100219F80, block);
}

id sub_10013CA68(uint64_t a1)
{
  CFTypeID v2 = objc_autoreleasePoolPush();
  if (qword_100219F60) {
    objc_msgSend( (id)qword_100219F60,  "WFLog:message:",  3,  "%s: xpc connection got interrupted",  "-[WiFi3BarsObserver init]_block_invoke_4");
  }
  objc_autoreleasePoolPop(v2);
  return [*(id *)(a1 + 32) _cleanupMaintenanceTask];
}

void sub_10013CC38(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 24LL) = 0LL;
}

void sub_10013CC68(uint64_t a1)
{
  if (v2 >= 120.0)
  {
    id v4 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      objc_msgSend( (id)qword_100219F60,  "WFLog:message:",  3,  "%s: activity exceeded max time of %d secs",  "-[WiFi3BarsObserver _installDeferMonitorForActivity:proxy:]_block_invoke_2",  120);
    }
    objc_autoreleasePoolPop(v4);
    [*(id *)(a1 + 40) cancelMaintenanceTask];
    [*(id *)(a1 + 32) _cleanupMaintenanceTask];
    if (!xpc_activity_set_state(*(xpc_activity_t *)(a1 + 48), 5LL))
    {
      id v5 = objc_autoreleasePoolPush();
      if (qword_100219F60) {
        objc_msgSend( (id)qword_100219F60,  "WFLog:message:",  3,  "%s: xpc_activity_set_state to Done failed",  "-[WiFi3BarsObserver _installDeferMonitorForActivity:proxy:]_block_invoke_2");
      }
      objc_autoreleasePoolPop(v5);
    }
  }

  else if (xpc_activity_should_defer(*(xpc_activity_t *)(a1 + 48)))
  {
    BOOL v3 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      objc_msgSend( (id)qword_100219F60,  "WFLog:message:",  3,  "%s: xpc wants to defer activity",  "-[WiFi3BarsObserver _installDeferMonitorForActivity:proxy:]_block_invoke_2");
    }
    objc_autoreleasePoolPop(v3);
    if (xpc_activity_set_state(*(xpc_activity_t *)(a1 + 48), 3LL))
    {
      [*(id *)(a1 + 40) cancelMaintenanceTask];
      [*(id *)(a1 + 32) _cleanupMaintenanceTask];
    }
  }

uint64_t sub_10013CF78(uint64_t a1, uint64_t a2)
{
  id v4 = objc_autoreleasePoolPush();
  if (qword_100219F60) {
    [(id)qword_100219F60 WFLog:4, "%s: error getting remote object: %@", "-[WiFi3BarsObserver run3BarsObserver:withActivity:withCompletion:]_block_invoke", a2 message];
  }
  objc_autoreleasePoolPop(v4);
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

id sub_10013CFF0(uint64_t a1)
{
  double v2 = objc_autoreleasePoolPush();
  if (qword_100219F60) {
    objc_msgSend( (id)qword_100219F60,  "WFLog:message:",  3,  "%s: finished running maintenance task",  "-[WiFi3BarsObserver run3BarsObserver:withActivity:withCompletion:]_block_invoke_2");
  }
  objc_autoreleasePoolPop(v2);
  (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
  return [*(id *)(a1 + 32) _cleanupMaintenanceTask];
}

void sub_10013D11C(id a1, NSError *a2)
{
  BOOL v3 = objc_autoreleasePoolPush();
  if (qword_100219F60) {
    [(id)qword_100219F60 WFLog:4, "%s: error getting synchronous remote object: %@", "-[WiFi3BarsObserver fetch3BarsNetworksForLocation:]_block_invoke", a2 message];
  }
  objc_autoreleasePoolPop(v3);
}

void sub_10013D1B8(id a1, NSError *a2)
{
  BOOL v3 = objc_autoreleasePoolPush();
  if (qword_100219F60) {
    [(id)qword_100219F60 WFLog:4, "%s: error getting synchronous remote object: %@", "-[WiFi3BarsObserver prune3BarsNetworks:]_block_invoke", a2 message];
  }
  objc_autoreleasePoolPop(v3);
}

void sub_10013D25C(id a1, NSError *a2)
{
  BOOL v3 = objc_autoreleasePoolPush();
  if (qword_100219F60) {
    [(id)qword_100219F60 WFLog:4, "%s: error getting synchronous remote object: %@", "-[WiFi3BarsObserver forceFetch3BarsNetworkMatchingBSSID:completionHandler:]_block_invoke", a2 message];
  }
  objc_autoreleasePoolPop(v3);
}

uint64_t sub_10013D674(uint64_t a1)
{
  uint64_t result = sub_10006EF90(*(void *)(*(void *)(a1 + 32) + 8LL));
  if (!(_DWORD)result) {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 1;
  }
  return result;
}

void sub_10013D878( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

void sub_10013D89C(uint64_t a1, uint64_t a2)
{
}

void sub_10013D8AC(uint64_t a1)
{
}

BOOL sub_10013D8B8(void *a1)
{
  BOOL result = sub_100079AD8(*(unsigned int **)(a1[4] + 8LL), *(void *)(*(void *)(a1[6] + 8LL) + 40LL));
  *(_BYTE *)(*(void *)(a1[5] + 8LL) + 24LL) = result;
  return result;
}

void sub_10013D988(uint64_t a1)
{
  CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
  CFDateRef v3 = CFDateCreate(kCFAllocatorDefault, Current);
  CFMutableArrayRef Mutable = CFDictionaryCreateMutable( kCFAllocatorDefault,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
  CFDictionarySetValue(Mutable, @"countryCodeUserDefault", *(const void **)(a1 + 32));
  CFDictionarySetValue(Mutable, @"countryCodeUserDefaultDate", v3);
  sub_1000845F8(*(void *)(*(void *)(a1 + 40) + 8LL), Mutable);
  id v5 = objc_autoreleasePoolPush();
  if (qword_100219F60) {
    [(id)qword_100219F60 WFLog:3, "%s WiFiCC : Saving Country Code information to user defaults : [%@]", "-[WiFiLocaleManagerUser setUserDefaultCountryCode:]_block_invoke", *(void *)(a1 + 32) message];
  }
  objc_autoreleasePoolPop(v5);
  if (v3) {
    CFRelease(v3);
  }
  if (Mutable) {
    CFRelease(Mutable);
  }
}

uint64_t sub_10013DB64(uint64_t a1)
{
  uint64_t result = sub_100079944( *(void *)(*(void *)(a1 + 32) + 8),  *(const __CFString **)(a1 + 40),  (char)[*(id *)(*(void *)(a1 + 32) + 16) getLocaleSource],  *(_BYTE *)(a1 + 56));
  *(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = result;
  return result;
}

void sub_10013DD7C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

uint64_t sub_10013DDA0(void *a1)
{
  uint64_t result = sub_100079CE4(*(void *)(a1[4] + 8LL), *(CFMutableStringRef *)(*(void *)(a1[6] + 8LL) + 40LL));
  *(_BYTE *)(*(void *)(a1[5] + 8LL) + 24LL) = result;
  return result;
}

void sub_10013DF0C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

id sub_10013DF30(void *a1)
{
  id result = [*(id *)(*(void *)(a1[5] + 8) + 40) setSet:*(void *)(a1[4] + 24)];
  *(void *)(*(void *)(a1[6] + 8LL) + 24LL) = *(void *)(a1[4] + 32LL);
  return result;
}

void sub_10013E180( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
}

uint64_t sub_10013E1A4(void *a1)
{
  uint64_t result = sub_100079D10(*(void *)(a1[4] + 8LL), *(__CFString **)(*(void *)(a1[6] + 8LL) + 40LL));
  *(_BYTE *)(*(void *)(a1[5] + 8LL) + 24LL) = result;
  return result;
}

void sub_10013E2D8(uint64_t a1)
{
  if (objc_msgSend(objc_msgSend(*(id *)(a1 + 32), "sessionsWaitingForFinalization"), "count"))
  {
    id v2 = objc_msgSend(objc_msgSend(*(id *)(a1 + 32), "sessionsWaitingForFinalization"), "firstObject");
    -[NSDate timeIntervalSince1970](+[NSDate date](&OBJC_CLASS___NSDate, "date"), "timeIntervalSince1970");
    double v4 = v3;
    [v2 doNotFinalizePriorToEpoch];
    if (v4 >= v5)
    {
      objc_msgSend(objc_msgSend(*(id *)(a1 + 32), "sessionsWaitingForFinalization"), "removeObjectAtIndex:", 0);
      [*(id *)(a1 + 32) finalizeSession:v2];
      [*(id *)(a1 + 32) finalizeFirstSessionThatRequiresItWhenAppropriate];
    }

    else
    {
      [v2 doNotFinalizePriorToEpoch];
      double v7 = v6;
      -[NSDate timeIntervalSince1970](+[NSDate date](&OBJC_CLASS___NSDate, "date"), "timeIntervalSince1970");
      dispatch_time_t v9 = dispatch_time(0LL, (uint64_t)((v7 - v8 + 0.25) * 1000000000.0));
      uint64_t v10 = (dispatch_queue_s *)[*(id *)(a1 + 32) utilityConcurrent];
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_10013E40C;
      block[3] = &unk_1001E2AF0;
      void block[4] = *(void *)(a1 + 32);
      dispatch_after(v9, v10, block);
    }
  }

id sub_10013E40C(uint64_t a1)
{
  return [*(id *)(a1 + 32) finalizeFirstSessionThatRequiresItWhenAppropriate];
}

void sub_10013E53C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

void sub_10013E554(uint64_t a1, uint64_t a2)
{
}

void sub_10013E564(uint64_t a1)
{
}

void sub_10013E570(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    id v4 = [*(id *)(a1 + 32) finalizeWithEndScorecard:a2];
    if (v4) {
      sub_100032C20(+[NSDictionary dictionaryWithDictionary:](&OBJC_CLASS___NSDictionary, "dictionaryWithDictionary:", v4));
    }
  }

  else
  {
    double v5 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      objc_msgSend( (id)qword_100219F60,  "WFLog:message:",  3,  "%s: Null scorecard",  "-[WiFiPerfPerAssoc finalizeSession:]_block_invoke");
    }
    objc_autoreleasePoolPop(v5);
  }

  *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL) = 0LL;
}

id sub_10013E6E0(uint64_t a1)
{
  return [*(id *)(a1 + 32) _beginPollingForInstantaenousScorecards];
}

uint64_t sub_10013E9A0()
{
  if (qword_100219EA0 != -1) {
    dispatch_once(&qword_100219EA0, &stru_1001E6920);
  }
  return 0LL;
}

void sub_10013E9DC(id a1)
{
  uint64_t v1 = objc_autoreleasePoolPush();
  if (qword_100219F60) {
    objc_msgSend( (id)qword_100219F60,  "WFLog:message:",  3,  "%s: DiagnosticLogSubmissionEnabled: %d",  "_DiagnosticLogSubmissionEnabled_block_invoke",  0);
  }
  objc_autoreleasePoolPop(v1);
}

id sub_10013EA34(_BYTE *a1)
{
  if (*a1) {
    uint64_t v1 = +[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", a1);
  }
  else {
    uint64_t v1 = @"??????";
  }
  id result = -[__CFString hasPrefix:](v1, "hasPrefix:", @"WiFiDebug");
  if ((result & 1) == 0)
  {
    double v3 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      [(id)qword_100219F60 WFLog:2, "Log collection started (event=DumpLogs, reason=%@)", v1 message];
    }
    objc_autoreleasePoolPop(v3);
    id result = objc_alloc_init((Class)sub_10013EBB8());
    if (result)
    {
      id v4 = result;
      double v8 = @"Reason";
      dispatch_time_t v9 = v1;
      id result = objc_msgSend( (id)sub_10013EC80(),  "requestWithItemID:configuration:",  71,  +[NSDictionary dictionaryWithObjects:forKeys:count:]( NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v9,  &v8,  1));
      if (result)
      {
        v6[0] = @"Reason";
        v6[1] = @"Compress";
        v7[0] = v1;
        v7[1] = &__kCFBooleanTrue;
        id v5 = result;
        return objc_msgSend( v4,  "collectLogs:configuration:update:reply:",  +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v5, 1),  +[NSDictionary dictionaryWithObjects:forKeys:count:]( NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v7,  v6,  2),  0,  &stru_1001E6960);
      }
    }
  }

  return result;
}

uint64_t sub_10013EBB8()
{
  uint64_t v3 = 0LL;
  id v4 = &v3;
  uint64_t v5 = 0x3052000000LL;
  double v6 = sub_10013EF98;
  double v7 = sub_10013EFA8;
  uint64_t v0 = qword_100219EA8;
  uint64_t v8 = qword_100219EA8;
  if (!qword_100219EA8)
  {
    v2[0] = _NSConcreteStackBlock;
    v2[1] = 3221225472LL;
    v2[2] = sub_10013EFB4;
    v2[3] = &unk_1001E42A0;
    v2[4] = &v3;
    sub_10013EFB4((uint64_t)v2);
    uint64_t v0 = v4[5];
  }

  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_10013EC68( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

uint64_t sub_10013EC80()
{
  uint64_t v3 = 0LL;
  id v4 = &v3;
  uint64_t v5 = 0x3052000000LL;
  double v6 = sub_10013EF98;
  double v7 = sub_10013EFA8;
  uint64_t v0 = qword_100219EB8;
  uint64_t v8 = qword_100219EB8;
  if (!qword_100219EB8)
  {
    v2[0] = _NSConcreteStackBlock;
    v2[1] = 3221225472LL;
    v2[2] = sub_10013F0AC;
    v2[3] = &unk_1001E42A0;
    v2[4] = &v3;
    sub_10013F0AC((uint64_t)v2);
    uint64_t v0 = v4[5];
  }

  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_10013ED30( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_10013ED48(id a1, NSError *a2, NSArray *a3, NSURL *a4)
{
  double v6 = objc_autoreleasePoolPush();
  if (qword_100219F60) {
    [(id)qword_100219F60 WFLog:2, "Log collection completed (event=DumpLogs error=%ld url=%@)", -[NSError code](a2, "code"), -[NSURL path](a4, "path") message];
  }
  objc_autoreleasePoolPop(v6);
}

id sub_10013EDC0(_BYTE *a1)
{
  if (*a1) {
    uint64_t v1 = +[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", a1);
  }
  else {
    uint64_t v1 = @"??????";
  }
  id result = -[__CFString hasPrefix:](v1, "hasPrefix:", @"WiFiDebug");
  if ((result & 1) == 0)
  {
    uint64_t v3 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      [(id)qword_100219F60 WFLog:2, "Log collection started (event=DatapathStall, reason=%@)", v1 message];
    }
    objc_autoreleasePoolPop(v3);
    id result = objc_alloc_init((Class)sub_10013EBB8());
    if (result)
    {
      id v4 = result;
      id result = [(id)sub_10013EC80() requestWithItemID:72 configuration:0];
      if (result)
      {
        v6[0] = @"Reason";
        v6[1] = @"Compress";
        v7[0] = v1;
        v7[1] = &__kCFBooleanTrue;
        id v5 = result;
        return objc_msgSend( v4,  "collectLogs:configuration:update:reply:",  +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v5, 1),  +[NSDictionary dictionaryWithObjects:forKeys:count:]( NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v7,  v6,  2),  0,  &stru_1001E6980);
      }
    }
  }

  return result;
}

void sub_10013EF20(id a1, NSError *a2, NSArray *a3, NSURL *a4)
{
  double v6 = objc_autoreleasePoolPush();
  if (qword_100219F60) {
    [(id)qword_100219F60 WFLog:2, "Log collection completed (event=DatapathStall, error=%ld url=%@)", -[NSError code](a2, "code"), -[NSURL path](a4, "path") message];
  }
  objc_autoreleasePoolPop(v6);
}

void sub_10013EF98(uint64_t a1, uint64_t a2)
{
}

void sub_10013EFA8(uint64_t a1)
{
}

Class sub_10013EFB4(uint64_t a1)
{
  Class result = objc_getClass("W5Client");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL)) {
    sub_1001549CC();
  }
  qword_100219EA8 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL);
  return result;
}

void sub_10013F008()
{
  uint64_t v0 = 0LL;
  if (!qword_100219EB0)
  {
    __int128 v1 = off_1001E69A0;
    uint64_t v2 = 0LL;
    qword_100219EB0 = _sl_dlopen(&v1, &v0);
  }

  if (!qword_100219EB0) {
    sub_100154A30(&v0);
  }
  if (v0) {
    free(v0);
  }
}

Class sub_10013F0AC(uint64_t a1)
{
  Class result = objc_getClass("W5LogItemRequest");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL)) {
    sub_100154A94();
  }
  qword_100219EB8 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL);
  return result;
}

void sub_10013F8DC(id a1)
{
  id v1 = -[WiFiUserInteractionMonitor _initPrivate](objc_alloc(&OBJC_CLASS___WiFiUserInteractionMonitor), "_initPrivate");
  uint64_t v2 = (void *)qword_100219EC0;
  qword_100219EC0 = (uint64_t)v1;
}

id sub_10013FDEC(id result)
{
  if (result) {
    return [result _handleManagedEventNotification];
  }
  return result;
}

void sub_10013FDF8(id a1, void *a2, unint64_t a3)
{
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "clients", 0));
  id v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (CFIndex i = 0LL; i != v6; CFIndex i = (char *)i + 1)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        dispatch_time_t v9 = *(void **)(*((void *)&v11 + 1) + 8LL * (void)i);
        uint64_t v10 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue([v9 callback]);
        ((void (**)(void, id, unint64_t))v10)[2](v10, [v9 context], a3);
      }

      id v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }

    while (v6);
  }
}

void sub_10013FF1C(uint64_t a1)
{
  uint64_t state64 = 0LL;
  if (notify_get_state(*(_DWORD *)(*(void *)(a1 + 32) + 48LL), &state64)) {
    return;
  }
  uint64_t v2 = objc_autoreleasePoolPush();
  if (qword_100219F60) {
    objc_msgSend( (id)qword_100219F60,  "WFLog:message:",  3,  "%s: received com.apple.system.console_mode_changed (%llu)",  "-[WiFiUserInteractionMonitor _initPrivate]_block_invoke_2",  state64);
  }
  objc_autoreleasePoolPop(v2);
  uint64_t v3 = state64;
  if (state64 != 1) {
    goto LABEL_7;
  }
  if ([*(id *)(a1 + 32) isInGameMode])
  {
    uint64_t v3 = state64;
LABEL_7:
    uint64_t v4 = 0LL;
    goto LABEL_11;
  }

  uint64_t v4 = 1LL;
LABEL_11:
  [*(id *)(a1 + 32) setIsInGameMode:v4];
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) clients]);
  id v6 = [v5 countByEnumeratingWithState:&v12 objects:v17 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (CFIndex i = 0LL; i != v7; CFIndex i = (char *)i + 1)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v12 + 1) + 8LL * (void)i);
        __int128 v11 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue([v10 callback]);
        ((void (**)(void, id, uint64_t))v11)[2](v11, [v10 context], 16);
      }

      id v7 = [v5 countByEnumeratingWithState:&v12 objects:v17 count:16];
    }

    while (v7);
  }
}

void sub_100142280( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
}

uint64_t sub_1001422A8(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_1001422B8(uint64_t a1)
{
}

void sub_1001422C0(uint64_t a1)
{
  id v2 = [[LSApplicationRecord alloc] initWithBundleIdentifier:*(void *)(a1 + 32) allowPlaceholder:0 error:0];
  uint64_t v3 = v2;
  if (v2)
  {
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    __int128 v15 = 0u;
    __int128 v16 = 0u;
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v2 infoDictionary]);
    id v5 = [v4 objectForKey:@"UIBackgroundModes" ofClass:objc_opt_class(NSArray)];
    id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

    id v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v16;
      while (2)
      {
        for (CFIndex i = 0LL; i != v8; CFIndex i = (char *)i + 1)
        {
          if (*(void *)v16 != v9) {
            objc_enumerationMutation(v6);
          }
          if ([*(id *)(*((void *)&v15 + 1) + 8 * (void)i) isEqualToString:@"voip"])
          {
            *(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = 1;
            uint64_t v11 = objc_autoreleasePoolPush();
            if (qword_100219F60) {
              [(id)qword_100219F60 WFLog:3, "%s: detected %@ as VOIP app", "-[WiFiUserInteractionMonitor hasRealTimeAppProperty:]_block_invoke", *(void *)(a1 + 32) message];
            }
            objc_autoreleasePoolPop(v11);
            goto LABEL_14;
          }
        }

        id v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }

uint64_t sub_100142CC4(uint64_t a1)
{
  return notify_post("com.apple.airport.userNotification");
}

void sub_100142D44(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if ((_DWORD)a2)
  {
    uint64_t v4 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      objc_msgSend( (id)qword_100219F60,  "WFLog:message:",  4,  "%s: Error %d from Managed Event Fetch",  "-[WiFiUserInteractionMonitor _handleManagedEventNotification]_block_invoke",  a2);
    }
LABEL_4:
    objc_autoreleasePoolPop(v4);
    return;
  }

  if (!a3)
  {
    uint64_t v4 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      [(id)qword_100219F60 WFLog:4, "%s: Fetched managed event is %@", "-[WiFiUserInteractionMonitor _handleManagedEventNotification]_block_invoke", 0 message];
    }
    goto LABEL_4;
  }

  id v6 = *(id *)(a3 + 48);
  id v7 = v6;
  if (v6)
  {
    id v8 = [v6 copy];
    [*(id *)(a1 + 32) setAppAwareDetails:v8];

    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  kManagedEventKeyBackgroundCombinedFlowProperties));
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:v9]);
    objc_msgSend(*(id *)(a1 + 32), "setSymptomBackgroundFlowProperties:", objc_msgSend(v10, "unsignedLongLongValue"));

    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  kManagedEventKeyForegroundCombinedFlowProperties));
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:v11]);
    objc_msgSend(*(id *)(a1 + 32), "setSymptomForegroundFlowProperties:", objc_msgSend(v12, "unsignedLongLongValue"));

    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  kManagedEventKeyBackgroundSpecificFlowClassifications));
    __int128 v14 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:v13]);
    objc_msgSend(*(id *)(a1 + 32), "setSymptomBackgroundFlowClassification:", objc_msgSend(v14, "unsignedIntValue"));

    __int128 v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  kManagedEventKeyForegroundSpecificFlowClassifications));
    __int128 v16 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:v15]);
    objc_msgSend(*(id *)(a1 + 32), "setSymptomForegroundFlowClassification:", objc_msgSend(v16, "unsignedIntValue"));

    __int128 v26 = 0u;
    __int128 v27 = 0u;
    __int128 v24 = 0u;
    __int128 v25 = 0u;
    __int128 v17 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) clients]);
    id v18 = [v17 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v18)
    {
      id v19 = v18;
      uint64_t v20 = *(void *)v25;
      do
      {
        for (CFIndex i = 0LL; i != v19; CFIndex i = (char *)i + 1)
        {
          if (*(void *)v25 != v20) {
            objc_enumerationMutation(v17);
          }
          BOOL v22 = *(void **)(*((void *)&v24 + 1) + 8LL * (void)i);
          CFIndex v23 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue([v22 callback]);
          ((void (**)(void, id, uint64_t))v23)[2](v23, [v22 context], 4);
        }

        id v19 = [v17 countByEnumeratingWithState:&v24 objects:v28 count:16];
      }

      while (v19);
    }
  }
}

NSMutableDictionary *sub_100143B04(void *a1, uint64_t a2)
{
  uint64_t v4 = objc_autoreleasePoolPush();
  id v5 = +[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", 1LL);
  id v6 = +[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", 0LL);
  if (!a1)
  {
    CFRange v84 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      objc_msgSend( (id)qword_100219F60,  "WFLog:message:",  3,  "%s: null networkRef ",  "WiFiNetworkSyncHelperCreateSyncableNetworkRecord");
    }
    goto LABEL_102;
  }

  if (!a2)
  {
    CFRange v84 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      objc_msgSend( (id)qword_100219F60,  "WFLog:message:",  3,  "%s: null manager",  "WiFiNetworkSyncHelperCreateSyncableNetworkRecord");
    }
    goto LABEL_102;
  }

  id v7 = v6;
  uint64_t v8 = sub_10009499C();
  if (v8 != CFGetTypeID(a1))
  {
    CFRange v84 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      objc_msgSend( (id)qword_100219F60,  "WFLog:message:",  3,  "%s: network object passed in is not WiFiNetwork type",  "WiFiNetworkSyncHelperCreateSyncableNetworkRecord");
    }
    goto LABEL_102;
  }

  uint64_t v9 = -[NSMutableDictionary initWithCapacity:](objc_alloc(&OBJC_CLASS___NSMutableDictionary), "initWithCapacity:", 7LL);
  if (!v9)
  {
    CFRange v84 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      objc_msgSend( (id)qword_100219F60,  "WFLog:message:",  3,  "%s: null cloudNetwork",  "WiFiNetworkSyncHelperCreateSyncableNetworkRecord");
    }
LABEL_102:
    objc_autoreleasePoolPop(v84);
    uint64_t v10 = 0LL;
    goto LABEL_93;
  }

  uint64_t v10 = v9;
  uint64_t v11 = sub_100012CEC((uint64_t)a1);
  if (v11)
  {
    uint64_t v12 = v11;
    Value = CFDictionaryGetValue(v11, @"SSID_STR");
    if (!Value)
    {
      CFRange v86 = objc_autoreleasePoolPush();
      if (qword_100219F60) {
        objc_msgSend( (id)qword_100219F60,  "WFLog:message:",  3,  "%s: null ssid... abort",  "WiFiNetworkSyncHelperCreateSyncableNetworkRecord");
      }
      objc_autoreleasePoolPop(v86);
      goto LABEL_92;
    }

    __int128 v14 = Value;
    unsigned __int8 v97 = v4;
    -[NSMutableDictionary setObject:forKey:](v10, "setObject:forKey:", Value, @"SSID_STR");
    __int128 v15 = sub_100096968((const __CFArray *)a1);
    __int128 v16 = v15;
    if (v15 && -[__CFArray length](v15, "length")) {
      -[NSMutableDictionary setObject:forKey:](v10, "setObject:forKey:", v16, @"BSSID");
    }
    __int128 v17 = CFDictionaryGetValue(v12, @"AP_MODE");
    if (!v17)
    {
      CFRange v87 = objc_autoreleasePoolPush();
      if (qword_100219F60) {
        objc_msgSend( (id)qword_100219F60,  "WFLog:message:",  3,  "%s: error - null apMode",  "WiFiNetworkSyncHelperCreateSyncableNetworkRecord");
      }
      objc_autoreleasePoolPop(v87);
      uint64_t v4 = v97;
      goto LABEL_92;
    }

    -[NSMutableDictionary setObject:forKey:](v10, "setObject:forKey:", v17, @"AP_MODE");
    id v18 = (const __CFBoolean *)CFDictionaryGetValue(v12, @"UserDirected");
    id v19 = v7;
    if (v18)
    {
      if (CFBooleanGetValue(v18)) {
        id v19 = v5;
      }
      else {
        id v19 = v7;
      }
    }

    -[NSMutableDictionary setObject:forKey:](v10, "setObject:forKey:", v19, @"UserDirected");
    uint64_t v20 = (const __CFBoolean *)CFDictionaryGetValue(v12, @"enabled");
    if (!v20 || (int v21 = CFBooleanGetValue(v20), v22 = v7, v21)) {
      BOOL v22 = v5;
    }
    -[NSMutableDictionary setObject:forKey:](v10, "setObject:forKey:", v22, @"enabled");
    BOOL v23 = sub_1000957F4((BOOL)a1);
    __int128 v24 = @"WEP";
    if (v23)
    {
      -[NSMutableDictionary setObject:forKey:](v10, "setObject:forKey:", v5, @"WEP");
      __int128 v25 = CFDictionaryGetValue(v12, @"WEPType");
      if (v25) {
        -[NSMutableDictionary setObject:forKey:](v10, "setObject:forKey:", v25, @"WEPType");
      }
      __int128 v26 = (NSNumber *)CFDictionaryGetValue(v12, @"WEP_AUTH_Flags");
      if (!v26)
      {
LABEL_25:
        unsigned int v29 = sub_100096D08((const __CFDictionary *)a1);
        int v30 = sub_100096E90((uint64_t)a1);
        if (v29)
        {
          if (v30)
          {
            if (sub_1000980AC((const __CFDictionary *)a1))
            {
              BOOL v31 = CFDictionaryGetValue(v12, @"RSN_IE");
              if (!v31) {
                goto LABEL_50;
              }
              v32 = v31;
              id v33 = @"RSN_IE";
              unsigned __int16 v34 = v10;
              goto LABEL_36;
            }

            if (sub_1000951FC((uint64_t)a1, @"ALLOW_WPA2_PSK"))
            {
              CFIndex v41 = sub_100094E60((uint64_t)kCFAllocatorDefault, (uint64_t)a1);
              sub_100096D18((int)v41, 1, 1);
              uint64_t v42 = sub_100012CEC((uint64_t)v41);
              uint64_t v43 = CFDictionaryGetValue(v42, @"RSN_IE");
              if (v43)
              {
                -[NSMutableDictionary setObject:forKey:](v10, "setObject:forKey:", v43, @"RSN_IE");
                uint64_t v44 = objc_autoreleasePoolPush();
                if (qword_100219F60)
                {
                  contexta = v44;
                  [(id)qword_100219F60 WFLog:3, "%s: inserted WPA2 auth, <%@> will be synced as a WPA2/WPA3 network", "WiFiNetworkSyncHelperCreateSyncableNetworkRecord", sub_100095BC8(a1) message];
                  uint64_t v44 = contexta;
                }

                objc_autoreleasePoolPop(v44);
              }

              if (v42) {
                CFRelease(v42);
              }
              if (v41) {
                CFRelease(v41);
              }
            }
          }

          else
          {
            id v39 = CFDictionaryGetValue(v12, @"RSN_IE");
            if (v39)
            {
              -[NSMutableDictionary setObject:forKey:](v10, "setObject:forKey:", v39, @"WPA3_RSN_IE");
              v40 = objc_autoreleasePoolPush();
              if (qword_100219F60) {
                [(id)qword_100219F60 WFLog:3, "%s: <%@> will be synced as a WPA3-only network", "WiFiNetworkSyncHelperCreateSyncableNetworkRecord", sub_100095BC8(a1) message];
              }
              objc_autoreleasePoolPop(v40);
            }
          }
        }

        else if (v30)
        {
          CFIndex v35 = CFDictionaryGetValue(v12, @"RSN_IE");
          if (v35) {
            -[NSMutableDictionary setObject:forKey:](v10, "setObject:forKey:", v35, @"RSN_IE");
          }
          uint64_t v36 = CFDictionaryGetValue(v12, @"WPA_IE");
          if (v36)
          {
            uint64_t v37 = v36;
            CFTypeID TypeID = CFDictionaryGetTypeID();
            if (sub_10003AE00(TypeID, v37))
            {
              id v33 = @"WPA_IE";
              unsigned __int16 v34 = v10;
              v32 = v37;
LABEL_36:
              -[NSMutableDictionary setObject:forKey:](v34, "setObject:forKey:", v32, v33);
            }
          }
        }

LABEL_50:
        else {
          CFIndex v45 = v7;
        }
        -[NSMutableDictionary setObject:forKey:](v10, "setObject:forKey:", v45, @"IS_NETWORK_EAP");
        else {
          __int128 v46 = v7;
        }
        -[NSMutableDictionary setObject:forKey:](v10, "setObject:forKey:", v46, @"IS_PERSONAL_HOTSPOT");
        else {
          uint64_t v47 = v7;
        }
        -[NSMutableDictionary setObject:forKey:](v10, "setObject:forKey:", v47, @"IS_NETWORK_CONFIGURED");
        unsigned int v48 = (const __CFDictionary *)sub_10006CE0C(a2);
        if (v48)
        {
          Copy = CFDictionaryCreateCopy(kCFAllocatorDefault, v48);
          if (Copy)
          {
            uint64_t v50 = Copy;
            int v51 = CFDictionaryContainsKey(Copy, v14);
            CFRelease(v50);
            __int16 v52 = v5;
            if (v51)
            {
LABEL_63:
              -[NSMutableDictionary setObject:forKey:](v10, "setObject:forKey:", v52, @"IS_NETWORK_CUSTOMIZED");
              else {
                id v53 = v7;
              }
              -[NSMutableDictionary setObject:forKey:](v10, "setObject:forKey:", v53, @"IS_NETWORK_EXPIRABLE");
              else {
                uint64_t v54 = v7;
              }
              -[NSMutableDictionary setObject:forKey:](v10, "setObject:forKey:", v54, @"IS_NETWORK_APPBASED");
              id v55 = sub_1000969F8((const __CFArray *)a1);
              if (v16)
              {
                id v56 = v55;
                if (-[__CFArray length](v16, "length"))
                {
                  if (v56)
                  {
                    if ((int)-[__CFArray intValue](v56, "intValue") >= 15)
                    {
                      id v57 = -[__CFArray componentsSeparatedByString:](v16, "componentsSeparatedByString:", @":");
                      if ([v57 count] == (id)6)
                      {
                        int v98 = -1431655766;
                        -[NSScanner scanHexInt:]( +[NSScanner scannerWithString:]( NSScanner,  "scannerWithString:",  [v57 lastObject]),  "scanHexInt:",  &v98);
                        id v93 = [v57 objectAtIndex:0];
                        id v58 = [v57 objectAtIndex:1];
                        id v59 = [v57 objectAtIndex:2];
                        id v60 = [v57 objectAtIndex:3];
                        id v61 = [v57 objectAtIndex:4];
                        v94 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@:%@:%@:%@:%@:%x",  v93,  v58,  v59,  v60,  v61,  (v98 - 1));
                        id v91 = [v57 objectAtIndex:0];
                        id v62 = [v57 objectAtIndex:1];
                        id v63 = [v57 objectAtIndex:2];
                        id v64 = [v57 objectAtIndex:3];
                        id v65 = [v57 objectAtIndex:4];
                        v92 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@:%@:%@:%@:%@:%x",  v91,  v62,  v63,  v64,  v65,  (v98 - 2));
                        id v90 = [v57 objectAtIndex:0];
                        id v66 = [v57 objectAtIndex:1];
                        id v67 = [v57 objectAtIndex:2];
                        id v68 = [v57 objectAtIndex:3];
                        id v69 = [v57 objectAtIndex:4];
                        context = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@:%@:%@:%@:%@:%x",  v90,  v66,  v67,  v68,  v69,  (v98 + 1));
                        id v89 = [v57 objectAtIndex:0];
                        id v70 = [v57 objectAtIndex:1];
                        id v71 = [v57 objectAtIndex:2];
                        id v72 = [v57 objectAtIndex:3];
                        id v73 = [v57 objectAtIndex:4];
                        int v74 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@:%@:%@:%@:%@:%x",  v89,  v70,  v71,  v72,  v73,  (v98 + 2));
                        -[NSMutableDictionary setObject:forKey:]( v10,  "setObject:forKey:",  v94,  @"GUESSED_2ghzBSSID1");
                        -[NSMutableDictionary setObject:forKey:]( v10,  "setObject:forKey:",  v92,  @"GUESSED_2ghzBSSID2");
                        -[NSMutableDictionary setObject:forKey:]( v10,  "setObject:forKey:",  context,  @"GUESSED_2ghzBSSID3");
                        -[NSMutableDictionary setObject:forKey:]( v10,  "setObject:forKey:",  v74,  @"GUESSED_2ghzBSSID4");
                        v75 = objc_autoreleasePoolPush();
                        if (qword_100219F60) {
                          [(id)qword_100219F60 WFLog:3, "%s: for 5ghz network <%@> %@: guess1 %@, guess2 %@, guess3 %@, guess4 %@", "WiFiNetworkSyncHelperCreateSyncableNetworkRecord", v14, v16, v94, v92, context, v74 message];
                        }
                        objc_autoreleasePoolPop(v75);
                      }
                    }
                  }
                }
              }

              -[NSMutableDictionary setObject:forKey:]( v10,  "setObject:forKey:",  +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  sub_10009997C((uint64_t)a1)),  @"SHARE_MODE");
              -[NSMutableDictionary setObject:forKey:]( v10,  "setObject:forKey:",  +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  sub_10009EEA4((uint64_t)a1)),  @"USER_ROLE");
              if (sub_1000951FC((uint64_t)a1, @"SaveDataMode")) {
                -[NSMutableDictionary setObject:forKey:]( v10,  "setObject:forKey:",  sub_1000951FC((uint64_t)a1, @"SaveDataMode"),  @"LOW_DATA_MODE");
              }
              -[NSMutableDictionary setValue:forKey:]( v10,  "setValue:forKey:",  sub_1000951FC((uint64_t)a1, @"addedAt"),  @"AddedAt");
              -[NSMutableDictionary setValue:forKey:]( v10,  "setValue:forKey:",  sub_1000951FC((uint64_t)a1, @"lastJoined"),  @"UserJoinedAt");
              v76 = sub_1000A063C((CFDictionaryRef *)a1);
              v77 = (NSNumber *)[v76 lastJoinedBySystemAtWeek];
              if (v77) {
                v77 = +[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", v77);
              }
              -[NSMutableDictionary setValue:forKey:](v10, "setValue:forKey:", v77, @"lastJoinedBySystemAtWeek");
              v78 = (NSNumber *)[v76 was6GHzOnlyAtWeek];
              if (v78) {
                v78 = +[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", v78);
              }
              -[NSMutableDictionary setValue:forKey:](v10, "setValue:forKey:", v78, @"was6GHzOnlyAtWeek");
              -[NSMutableDictionary setValue:forKey:]( v10,  "setValue:forKey:",  [v76 seamlessSSIDList],  @"seamlessSSIDList");

              -[NSMutableDictionary setObject:forKey:]( v10,  "setObject:forKey:",  +[NSNumber numberWithUnsignedChar:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedChar:",  sub_1000A1C1C((uint64_t)a1)),  @"IS_PRIVACY_PROXY_ENABLED");
              if (sub_1000951FC((uint64_t)a1, @"WiFiNetworkAttributeIsMoving"))
              {
                CFIndex v79 = sub_1000951FC((uint64_t)a1, @"WiFiNetworkAttributeIsMoving");
                v80 = +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  CFEqual(v79, kCFBooleanTrue) != 0);
              }

              else
              {
                v80 = 0LL;
              }

              if (sub_1000951FC((uint64_t)a1, @"WiFiNetworkAttributeIsPublic"))
              {
                uint64_t v81 = sub_1000951FC((uint64_t)a1, @"WiFiNetworkAttributeIsPublic");
                uint64_t v82 = +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  CFEqual(v81, kCFBooleanTrue) != 0);
              }

              else
              {
                uint64_t v82 = 0LL;
              }

              uint64_t v4 = v97;
              -[NSMutableDictionary setValue:forKey:](v10, "setValue:forKey:", v80, @"IS_MOVING");
              -[NSMutableDictionary setValue:forKey:](v10, "setValue:forKey:", v82, @"IS_PUBLIC");
LABEL_92:
              CFRelease(v12);
              goto LABEL_93;
            }
          }
        }

        else
        {
          CFRange v88 = objc_autoreleasePoolPush();
          if (qword_100219F60) {
            objc_msgSend( (id)qword_100219F60,  "WFLog:message:",  3,  "%s: null customNetworkSetDictRef",  "__WiFiNetworkSyncHelperIsCustomNetwork");
          }
          objc_autoreleasePoolPop(v88);
        }

        __int16 v52 = v7;
        goto LABEL_63;
      }

      __int128 v27 = v26;
      __int128 v24 = @"WEP_AUTH_Flags";
      uint64_t v28 = v10;
    }

    else
    {
      uint64_t v28 = v10;
      __int128 v27 = v7;
    }

    -[NSMutableDictionary setObject:forKey:](v28, "setObject:forKey:", v27, v24);
    goto LABEL_25;
  }

  CFRange v85 = objc_autoreleasePoolPush();
  if (qword_100219F60) {
    objc_msgSend( (id)qword_100219F60,  "WFLog:message:",  3,  "%s: null networkRecord",  "WiFiNetworkSyncHelperCreateSyncableNetworkRecord");
  }
  objc_autoreleasePoolPop(v85);
LABEL_93:
  objc_autoreleasePoolPop(v4);
  return v10;
}

void sub_1001447AC(uint64_t a1)
{
  if (a1)
  {
    sub_1000A0508(a1);
  }

  else
  {
    id v1 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      objc_msgSend( (id)qword_100219F60,  "WFLog:message:",  3,  "%s: null network",  "WiFiNetworkSyncHelperSanitizeNetwork");
    }
    objc_autoreleasePoolPop(v1);
  }

_WORD *sub_10014480C(void *a1)
{
  id v2 = objc_autoreleasePoolPush();
  if (!a1)
  {
    v40 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      objc_msgSend( (id)qword_100219F60,  "WFLog:message:",  3,  "%s: null cloudNetworkDict",  "WiFiNetworkSyncHelperCreateNetworkRef");
    }
    goto LABEL_70;
  }

  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable( kCFAllocatorDefault,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
  if (!Mutable)
  {
    v40 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      objc_msgSend( (id)qword_100219F60,  "WFLog:message:",  3,  "%s: null networkRecord",  "WiFiNetworkSyncHelperCreateNetworkRef");
    }
LABEL_70:
    objc_autoreleasePoolPop(v40);
    uint64_t v37 = 0LL;
    goto LABEL_63;
  }

  uint64_t v4 = Mutable;
  id v5 = [a1 objectForKey:@"SSID_STR"];
  if (v5)
  {
    CFDictionarySetValue(v4, @"SSID_STR", v5);
    id v6 = [a1 objectForKey:@"BSSID"];
    if (v6) {
      CFDictionarySetValue(v4, @"BSSID", v6);
    }
    id v7 = [a1 objectForKey:@"AP_MODE"];
    if (v7) {
      CFDictionarySetValue(v4, @"AP_MODE", v7);
    }
    id v8 = [a1 objectForKey:@"UserDirected"];
    if (v8)
    {
      else {
        uint64_t v9 = (const void **)&kCFBooleanFalse;
      }
      CFDictionarySetValue(v4, @"UserDirected", *v9);
    }

    id v10 = [a1 objectForKey:@"WEP"];
    if (v10 && [v10 BOOLValue])
    {
      CFDictionarySetValue(v4, @"WEP", kCFBooleanTrue);
      id v11 = [a1 objectForKey:@"WEPType"];
      if (v11) {
        CFDictionarySetValue(v4, @"WEPType", v11);
      }
      id v12 = [a1 objectForKey:@"WEP_AUTH_Flags"];
      if (v12) {
        CFDictionarySetValue(v4, @"WEP_AUTH_Flags", v12);
      }
    }

    id v13 = [a1 objectForKey:@"WPA_IE"];
    if (v13) {
      CFDictionarySetValue(v4, @"WPA_IE", v13);
    }
    id v14 = [a1 objectForKey:@"RSN_IE"];
    if (v14) {
      CFDictionarySetValue(v4, @"RSN_IE", v14);
    }
    id v15 = [a1 objectForKey:@"WPA3_RSN_IE"];
    if (v15) {
      CFDictionarySetValue(v4, @"RSN_IE", v15);
    }
    __int128 v16 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      [(id)qword_100219F60 WFLog:3, "%s for <%@>", "WiFiNetworkSyncHelperCreateNetworkRef", objc_msgSend(a1, "objectForKey:", @"SSID_STR") message];
    }
    objc_autoreleasePoolPop(v16);
    id v17 = [a1 objectForKey:@"SHARE_MODE"];
    if (v17) {
      CFDictionarySetValue(v4, @"ShareMode", v17);
    }
    id v18 = [a1 objectForKey:@"USER_ROLE"];
    if (v18) {
      CFDictionarySetValue(v4, @"UserRole", v18);
    }
    id v19 = [a1 objectForKey:@"LOW_DATA_MODE"];
    if (v19) {
      CFDictionarySetValue(v4, @"SaveDataMode", v19);
    }
    id v20 = [a1 objectForKey:@"IS_PERSONAL_HOTSPOT"];
    if (v20)
    {
      else {
        int v21 = (const void **)&kCFBooleanFalse;
      }
      CFDictionarySetValue(v4, @"IsPersonalHotspot", *v21);
    }

    id v22 = [a1 objectForKey:@"AddedAt"];
    if (v22) {
      CFDictionarySetValue(v4, @"addedAt", v22);
    }
    id v23 = [a1 objectForKey:@"UserJoinedAt"];
    if (v23) {
      CFDictionarySetValue(v4, @"lastJoined", v23);
    }
    id v24 = [a1 objectForKey:@"IS_PRIVACY_PROXY_ENABLED"];
    if (v24)
    {
      else {
        __int128 v25 = (const void **)&kCFBooleanFalse;
      }
      CFDictionarySetValue(v4, @"PrivacyProxyEnabled", *v25);
    }

    __int128 v26 = (CFDictionaryRef *)sub_100094AAC((uint64_t)kCFAllocatorDefault, v4);
    __int128 v27 = sub_1000A063C(v26);
    id v28 = [a1 objectForKeyedSubscript:@"lastJoinedBySystemAtWeek"];
    if (v28)
    {
      unsigned int v29 = v28;
      id v30 = [v28 unsignedIntegerValue];
      if (v30 <= [v27 lastJoinedBySystemAtWeek]) {
        id v31 = [v27 lastJoinedBySystemAtWeek];
      }
      else {
        id v31 = [v29 unsignedIntegerValue];
      }
      [v27 setLastJoinedBySystemAtWeek:v31];
    }

    id v32 = [a1 objectForKeyedSubscript:@"was6GHzOnlyAtWeek"];
    if (v32)
    {
      id v33 = v32;
      id v34 = [v32 unsignedIntegerValue];
      if (v34 <= [v27 was6GHzOnlyAtWeek]) {
        id v35 = [v27 was6GHzOnlyAtWeek];
      }
      else {
        id v35 = [v33 unsignedIntegerValue];
      }
      [v27 setWas6GHzOnlyAtWeek:v35];
    }

    id v36 = [a1 objectForKeyedSubscript:@"seamlessSSIDList"];
    if (v36) {
      [v27 setSeamlessSSIDList:v36];
    }
    if (v26) {
      CFRelease(v26);
    }
    uint64_t v37 = sub_1000A1DEC(v27, 0LL);
  }

  else
  {
    CFIndex v41 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      objc_msgSend( (id)qword_100219F60,  "WFLog:message:",  3,  "%s: null WIFICLOUDSYNC_NETWORKKEY_SSID",  "WiFiNetworkSyncHelperCreateNetworkRef");
    }
    objc_autoreleasePoolPop(v41);
    uint64_t v37 = 0LL;
  }

  CFRelease(v4);
LABEL_63:
  sub_1001447AC((uint64_t)v37);
  id v38 = objc_autoreleasePoolPush();
  if (qword_100219F60) {
    [(id)qword_100219F60 WFLog:3, "%s: network content to be returned to caller: %@", "WiFiNetworkSyncHelperCreateNetworkRef", v37 message];
  }
  objc_autoreleasePoolPop(v38);
  objc_autoreleasePoolPop(v2);
  return v37;
}

void sub_100144DA4(void *a1, uint64_t a2)
{
  if (a1)
  {
    if (a2)
    {
      uint64_t v4 = sub_10009499C();
      CFTypeID v5 = CFGetTypeID(a1);
      id v6 = objc_autoreleasePoolPush();
      if (v4 != v5)
      {
        if (qword_100219F60) {
          objc_msgSend( (id)qword_100219F60,  "WFLog:message:",  3,  "%s: network object passed in is not WiFiNetwork type",  "WiFiNetworkSyncHelperAddNetworkToPlist");
        }
        id v8 = v6;
        goto LABEL_13;
      }

      if (qword_100219F60) {
        objc_msgSend((id)qword_100219F60, "WFLog:message:", 3, "%s", "WiFiNetworkSyncHelperAddNetworkToPlist");
      }
      objc_autoreleasePoolPop(v6);
      if (!sub_100096D08((const __CFDictionary *)a1)
        || sub_100096E90((uint64_t)a1)
        || sub_1000821A4(a2))
      {
        sub_100072038(a2, a1, 3LL);
        return;
      }

      id v7 = objc_autoreleasePoolPush();
      if (qword_100219F60) {
        objc_msgSend( (id)qword_100219F60,  "WFLog:message:",  3,  "%s: WPA3 not supported, will not add WPA3-only network",  "WiFiNetworkSyncHelperAddNetworkToPlist");
      }
    }

    else
    {
      id v7 = objc_autoreleasePoolPush();
      if (qword_100219F60) {
        objc_msgSend( (id)qword_100219F60,  "WFLog:message:",  3,  "%s: null manager",  "WiFiNetworkSyncHelperAddNetworkToPlist");
      }
    }
  }

  else
  {
    id v7 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      objc_msgSend( (id)qword_100219F60,  "WFLog:message:",  3,  "%s: null networkRef ",  "WiFiNetworkSyncHelperAddNetworkToPlist");
    }
  }

  id v8 = v7;
LABEL_13:
  objc_autoreleasePoolPop(v8);
}

void sub_100144F3C(void *a1, uint64_t a2)
{
  if (!a1)
  {
    id v7 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      objc_msgSend( (id)qword_100219F60,  "WFLog:message:",  3,  "%s: null networkRef ",  "WiFiNetworkSyncHelperRemoveNetworkFromPlist");
    }
    goto LABEL_11;
  }

  if (!a2)
  {
    id v7 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      objc_msgSend( (id)qword_100219F60,  "WFLog:message:",  3,  "%s: null manager",  "WiFiNetworkSyncHelperRemoveNetworkFromPlist");
    }
LABEL_11:
    id v8 = v7;
LABEL_15:
    objc_autoreleasePoolPop(v8);
    return;
  }

  uint64_t v4 = sub_10009499C();
  CFTypeID v5 = CFGetTypeID(a1);
  id v6 = objc_autoreleasePoolPush();
  if (v4 != v5)
  {
    if (qword_100219F60) {
      objc_msgSend( (id)qword_100219F60,  "WFLog:message:",  3,  "%s: network object passed in is not WiFiNetwork type",  "WiFiNetworkSyncHelperRemoveNetworkFromPlist");
    }
    id v8 = v6;
    goto LABEL_15;
  }

  if (qword_100219F60) {
    objc_msgSend((id)qword_100219F60, "WFLog:message:", 3, "%s", "WiFiNetworkSyncHelperRemoveNetworkFromPlist");
  }
  objc_autoreleasePoolPop(v6);
  sub_100076340(a2, a1, 4LL);
}

uint64_t sub_100145088(void *a1)
{
  id v2 = objc_autoreleasePoolPush();
  if (!a1)
  {
    id v12 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      objc_msgSend( (id)qword_100219F60,  "WFLog:message:",  3,  "%s: null syncFormattedNetworkRecord",  "WiFiNetworkSyncHelperIsNetworkSyncable");
    }
    goto LABEL_40;
  }

  id v3 = [a1 objectForKey:@"IS_NETWORK_EAP"];
  if (!v3)
  {
    id v12 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      objc_msgSend( (id)qword_100219F60,  "WFLog:message:",  3,  "%s: missing WIFICLOUDSYNC_NETWORKKEY_ISEAP key, not syncable",  "WiFiNetworkSyncHelperIsNetworkSyncable");
    }
    goto LABEL_40;
  }

  if ([v3 BOOLValue])
  {
    id v12 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      objc_msgSend( (id)qword_100219F60,  "WFLog:message:",  3,  "%s: EAP network, not syncable",  "WiFiNetworkSyncHelperIsNetworkSyncable");
    }
    goto LABEL_40;
  }

  id v4 = [a1 objectForKey:@"IS_NETWORK_CUSTOMIZED"];
  if (!v4)
  {
    id v12 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      objc_msgSend( (id)qword_100219F60,  "WFLog:message:",  3,  "%s: missing WIFICLOUDSYNC_NETWORKKEY_ISCUSTOMIZED key, not syncable",  "WiFiNetworkSyncHelperIsNetworkSyncable");
    }
    goto LABEL_40;
  }

  if ([v4 BOOLValue])
  {
    id v12 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      objc_msgSend( (id)qword_100219F60,  "WFLog:message:",  3,  "%s: customized network, not syncable",  "WiFiNetworkSyncHelperIsNetworkSyncable");
    }
    goto LABEL_40;
  }

  id v5 = [a1 objectForKey:@"IS_NETWORK_CONFIGURED"];
  if (!v5)
  {
    id v12 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      objc_msgSend( (id)qword_100219F60,  "WFLog:message:",  3,  "%s: missing WIFICLOUDSYNC_NETWORKKEY_ISCONFIGURED key, not syncable",  "WiFiNetworkSyncHelperIsNetworkSyncable");
    }
    goto LABEL_40;
  }

  if ([v5 BOOLValue])
  {
    id v12 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      objc_msgSend( (id)qword_100219F60,  "WFLog:message:",  3,  "%s: configured network, not syncable",  "WiFiNetworkSyncHelperIsNetworkSyncable");
    }
    goto LABEL_40;
  }

  id v6 = [a1 objectForKey:@"AP_MODE"];
  if (v6 && [v6 intValue] != 2)
  {
    id v12 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      objc_msgSend( (id)qword_100219F60,  "WFLog:message:",  3,  "%s: non-infrastructure network, not syncable",  "WiFiNetworkSyncHelperIsNetworkSyncable");
    }
    goto LABEL_40;
  }

  id v7 = [a1 objectForKey:@"IS_NETWORK_APPBASED"];
  if (v7 && [v7 BOOLValue])
  {
    id v12 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      objc_msgSend( (id)qword_100219F60,  "WFLog:message:",  3,  "%s: app based network, not syncable",  "WiFiNetworkSyncHelperIsNetworkSyncable");
    }
    goto LABEL_40;
  }

  id v8 = [a1 objectForKey:@"IS_NETWORK_EXPIRABLE"];
  if (v8 && [v8 BOOLValue])
  {
    id v12 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      objc_msgSend( (id)qword_100219F60,  "WFLog:message:",  3,  "%s: expirable network, not syncable",  "WiFiNetworkSyncHelperIsNetworkSyncable");
    }
    goto LABEL_40;
  }

  id v9 = [a1 objectForKey:@"IS_NETWORK_CARPLAY_ONLY"];
  if (v9 && [v9 BOOLValue])
  {
    id v12 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      objc_msgSend( (id)qword_100219F60,  "WFLog:message:",  3,  "%s: carplay only network, not syncable",  "WiFiNetworkSyncHelperIsNetworkSyncable");
    }
LABEL_40:
    objc_autoreleasePoolPop(v12);
    uint64_t v10 = 0LL;
    goto LABEL_17;
  }

  uint64_t v10 = 1LL;
LABEL_17:
  objc_autoreleasePoolPop(v2);
  return v10;
}

uint64_t sub_1001453B4(void *a1)
{
  id v2 = objc_autoreleasePoolPush();
  if (!a1)
  {
    id v7 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      objc_msgSend( (id)qword_100219F60,  "WFLog:message:",  3,  "%s: null syncFormattedNetworkRecord",  "WiFiNetworkSyncHelperGetNetworkSecurity");
    }
    objc_autoreleasePoolPop(v7);
    goto LABEL_7;
  }

  id v3 = [a1 objectForKey:@"WEP"];
  if (v3 && ([v3 BOOLValue] & 1) != 0)
  {
    uint64_t v4 = 1LL;
  }

  else if ([a1 objectForKey:@"WPA3_RSN_IE"])
  {
    uint64_t v4 = 4LL;
  }

  else if ([a1 objectForKey:@"RSN_IE"])
  {
    uint64_t v4 = 3LL;
  }

  else
  {
    if (![a1 objectForKey:@"WPA_IE"])
    {
LABEL_7:
      uint64_t v4 = 0LL;
      goto LABEL_8;
    }

    uint64_t v4 = 2LL;
  }

void sub_100145508(uint64_t a1)
{
  id v2 = objc_autoreleasePoolPush();
  if (qword_100219F60) {
    objc_msgSend((id)qword_100219F60, "WFLog:message:", 3, "%s", "WiFiCoexManagerRegister");
  }
  objc_autoreleasePoolPop(v2);
  if (&WCMEnabled)
  {
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
    mach_service = xpc_connection_create_mach_service("com.apple.WirelessCoexManager", global_queue, 0LL);
    if (mach_service)
    {
      id v5 = mach_service;
      handler[0] = _NSConcreteStackBlock;
      handler[1] = 3221225472LL;
      handler[2] = sub_100145728;
      handler[3] = &unk_1001E6A70;
      handler[4] = a1;
      xpc_connection_set_event_handler(mach_service, handler);
      xpc_connection_resume(v5);
      keys = "kWCMRegisterProcess_ProcessId";
      xpc_object_t values = xpc_uint64_create(1uLL);
      xpc_object_t v6 = xpc_dictionary_create((const char *const *)&keys, &values, 1uLL);
      *(_OWORD *)id v11 = *(_OWORD *)off_1001E6A90;
      object[0] = xpc_uint64_create(1uLL);
      object[1] = v6;
      xpc_object_t v7 = xpc_dictionary_create((const char *const *)v11, object, 2uLL);
      xpc_connection_send_message(v5, v7);
      xpc_release(values);
      xpc_release(object[0]);
      xpc_release(v6);
      xpc_release(v7);
      sub_10007C1DC(a1, (uint64_t)v5);
      return;
    }

    id v8 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      objc_msgSend( (id)qword_100219F60,  "WFLog:message:",  3,  "Error: %s: failed to create xpc connection",  "WiFiCoexManagerRegister");
    }
  }

  else
  {
    id v8 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      objc_msgSend((id)qword_100219F60, "WFLog:message:", 3, "%s: WCM is disabled ", "WiFiCoexManagerRegister");
    }
  }

  objc_autoreleasePoolPop(v8);
}

void sub_100145728(uint64_t a1, xpc_object_t object)
{
  if (!object)
  {
    uint64_t v4 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      objc_msgSend( (id)qword_100219F60,  "WFLog:message:",  3,  "Error: %s: eventObject is null",  "__WiFiCoexManagerHandleEvent");
    }
    goto LABEL_14;
  }

  uint64_t v3 = *(void *)(a1 + 32);
  if (xpc_get_type(object) != (xpc_type_t)&_xpc_type_error) {
    return;
  }
  if (object == &_xpc_error_connection_interrupted)
  {
    id v5 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      objc_msgSend((id)qword_100219F60, "WFLog:message:", 3, "%s: Re-Register", "__WiFiCoexManagerHandleEvent");
    }
    objc_autoreleasePoolPop(v5);
    sub_100145508(v3);
  }

  else
  {
    if (object == &_xpc_error_termination_imminent)
    {
      uint64_t v4 = objc_autoreleasePoolPush();
      if (qword_100219F60) {
        objc_msgSend((id)qword_100219F60, "WFLog:message:", 3, "%s: about to Die", "__WiFiCoexManagerHandleEvent");
      }
      goto LABEL_14;
    }

    if (object == &_xpc_error_connection_invalid)
    {
      uint64_t v4 = objc_autoreleasePoolPush();
      if (qword_100219F60) {
        objc_msgSend( (id)qword_100219F60,  "WFLog:message:",  3,  " %s: Invalid XPC Connection",  "__WiFiCoexManagerHandleEvent");
      }
LABEL_14:
      objc_autoreleasePoolPop(v4);
    }
  }

void sub_100145894(xpc_object_t *a1)
{
  if (&WCMEnabled)
  {
    id v2 = (_xpc_connection_s *)*a1;
    if (v2)
    {
      xpc_connection_cancel(v2);
      xpc_release(*a1);
      *a1 = 0LL;
      return;
    }

    uint64_t v3 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      objc_msgSend( (id)qword_100219F60,  "WFLog:message:",  3,  "Error: %s: coexMgrXpcConnection is null",  "WiFiCoexManagerUnRegister");
    }
  }

  else
  {
    uint64_t v3 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      objc_msgSend((id)qword_100219F60, "WFLog:message:", 3, "%s: WCM is disabled ", "WiFiCoexManagerUnRegister");
    }
  }

  objc_autoreleasePoolPop(v3);
}

uint64_t sub_100145C64(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 20);
  else {
    return 0LL;
  }
}

uint64_t sub_100145CA4(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) == 0 || *(_DWORD *)(result + 24) != 1 || *(_DWORD *)(result + 4) != 56)
  {
    int v3 = -304;
    goto LABEL_9;
  }

  if (*(unsigned __int16 *)(result + 38) << 16 != 1114112)
  {
    int v3 = -300;
    goto LABEL_9;
  }

  if (*(_DWORD *)(result + 56) || *(_DWORD *)(result + 60) <= 0x1Fu)
  {
    int v3 = -309;
LABEL_9:
    *(_DWORD *)(a2 + 32) = v3;
    goto LABEL_10;
  }

  uint64_t v4 = (unsigned int *)(a2 + 28);
  *(void *)(a2 + 32) = 0x11000000000000LL;
  unsigned int v5 = *(_DWORD *)(result + 12);
  int v6 = *(_DWORD *)(result + 48);
  uint64_t v7 = *(unsigned int *)(result + 52);
  int v8 = *(_DWORD *)(result + 28);
  __int128 v9 = *(_OWORD *)(result + 92);
  v10[0] = *(_OWORD *)(result + 76);
  v10[1] = v9;
  Class result = sub_1000AF450(v5, v6, v7, v8, v4, (_DWORD *)(a2 + 48), v10);
  if (!(_DWORD)result)
  {
    *(NDR_record_t *)(a2 + 40) = NDR_record;
    *(_DWORD *)a2 |= 0x80000000;
    *(_DWORD *)(a2 + 4) = 52;
    *(_DWORD *)(a2 + 24) = 1;
    return result;
  }

  *(_DWORD *)(a2 + 32) = result;
LABEL_10:
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  return result;
}

_DWORD *sub_100145DA8(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0 || result[1] != 24)
  {
    *(_DWORD *)(a2 + 32) = -304;
    *(NDR_record_t *)(a2 + 24) = NDR_record;
  }

  else
  {
    Class result = (_DWORD *)sub_1000AF780(result[3]);
    *(_DWORD *)(a2 + 32) = (_DWORD)result;
  }

  return result;
}

_DWORD *sub_100145E00(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0 || result[1] != 24)
  {
    *(_DWORD *)(a2 + 32) = -304;
    goto LABEL_6;
  }

  *(_DWORD *)(a2 + 36) = 16777473;
  Class result = (_DWORD *)sub_1000B1874(result[3], (vm_offset_t *)(a2 + 28), (mach_msg_type_number_t *)(a2 + 52));
  if ((_DWORD)result)
  {
    *(_DWORD *)(a2 + 32) = (_DWORD)result;
LABEL_6:
    *(NDR_record_t *)(a2 + 24) = NDR_record;
    return result;
  }

  *(_DWORD *)(a2 + 40) = *(_DWORD *)(a2 + 52);
  *(NDR_record_t *)(a2 + 44) = NDR_record;
  *(_DWORD *)a2 |= 0x80000000;
  *(_DWORD *)(a2 + 4) = 56;
  *(_DWORD *)(a2 + 24) = 1;
  return result;
}

_DWORD *sub_100145EA4(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0 || result[1] != 36)
  {
    *(_DWORD *)(a2 + 32) = -304;
    goto LABEL_6;
  }

  *(_DWORD *)(a2 + 36) = 16777473;
  Class result = (_DWORD *)sub_1000B1978(result[3], result[8], (vm_offset_t *)(a2 + 28), (mach_msg_type_number_t *)(a2 + 52));
  if ((_DWORD)result)
  {
    *(_DWORD *)(a2 + 32) = (_DWORD)result;
LABEL_6:
    *(NDR_record_t *)(a2 + 24) = NDR_record;
    return result;
  }

  *(_DWORD *)(a2 + 40) = *(_DWORD *)(a2 + 52);
  *(NDR_record_t *)(a2 + 44) = NDR_record;
  *(_DWORD *)a2 |= 0x80000000;
  *(_DWORD *)(a2 + 4) = 56;
  *(_DWORD *)(a2 + 24) = 1;
  return result;
}

uint64_t sub_100145F50(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) == 0 || *(_DWORD *)(result + 24) != 1 || *(_DWORD *)(result + 4) != 56)
  {
    int v3 = -304;
LABEL_9:
    *(_DWORD *)(a2 + 32) = v3;
    goto LABEL_10;
  }

  if (*(_BYTE *)(result + 39) != 1 || *(_DWORD *)(result + 40) != *(_DWORD *)(result + 52))
  {
    int v3 = -300;
    goto LABEL_9;
  }

  *(_DWORD *)(a2 + 36) = 16777473;
  Class result = sub_1000B13E4( *(_DWORD *)(result + 12),  *(UInt8 **)(result + 28),  *(_DWORD *)(result + 40),  (vm_offset_t *)(a2 + 28),  (mach_msg_type_number_t *)(a2 + 52));
  if ((_DWORD)result)
  {
    *(_DWORD *)(a2 + 32) = result;
LABEL_10:
    *(NDR_record_t *)(a2 + 24) = NDR_record;
    return result;
  }

  *(_DWORD *)(a2 + 40) = *(_DWORD *)(a2 + 52);
  *(NDR_record_t *)(a2 + 44) = NDR_record;
  *(_DWORD *)a2 |= 0x80000000;
  *(_DWORD *)(a2 + 4) = 56;
  *(_DWORD *)(a2 + 24) = 1;
  return result;
}

uint64_t sub_100146030(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) == 0 || *(_DWORD *)(result + 24) != 2 || *(_DWORD *)(result + 4) != 76)
  {
    int v6 = -304;
LABEL_11:
    *(_DWORD *)(a2 + 32) = v6;
    NDR_record_t v5 = NDR_record;
    goto LABEL_12;
  }

  if (*(_BYTE *)(result + 39) != 1
    || *(_BYTE *)(result + 55) != 1
    || (unsigned int v3 = *(_DWORD *)(result + 40), v3 != *(_DWORD *)(result + 68))
    || (unsigned int v4 = *(_DWORD *)(result + 56), v4 != *(_DWORD *)(result + 72)))
  {
    int v6 = -300;
    goto LABEL_11;
  }

  Class result = sub_1000B15B4( *(_DWORD *)(result + 12),  *(UInt8 **)(result + 28),  v3,  *(UInt8 **)(result + 44),  v4,  (_DWORD *)(a2 + 36));
  *(_DWORD *)(a2 + 32) = result;
  NDR_record_t v5 = NDR_record;
  if (!(_DWORD)result)
  {
    *(NDR_record_t *)(a2 + 24) = NDR_record;
    *(_DWORD *)(a2 + 4) = 40;
    return result;
  }

uint64_t sub_100146100(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) != 0 && *(_DWORD *)(result + 24) == 1 && *(_DWORD *)(result + 4) == 56)
  {
    if (*(_BYTE *)(result + 39) == 1)
    {
      CFIndex v3 = *(unsigned int *)(result + 40);
      if ((_DWORD)v3 == *(_DWORD *)(result + 52))
      {
        Class result = sub_1000B1A88(*(_DWORD *)(result + 12), *(UInt8 **)(result + 28), v3);
        *(_DWORD *)(a2 + 32) = result;
        return result;
      }
    }

    int v4 = -300;
  }

  else
  {
    int v4 = -304;
  }

  *(_DWORD *)(a2 + 32) = v4;
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  return result;
}

uint64_t sub_100146190(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) != 0 && *(_DWORD *)(result + 24) == 2 && *(_DWORD *)(result + 4) == 76)
  {
    if (*(_BYTE *)(result + 39) == 1 && *(_BYTE *)(result + 55) == 1)
    {
      CFIndex v3 = *(unsigned int *)(result + 40);
      if ((_DWORD)v3 == *(_DWORD *)(result + 68))
      {
        unsigned int v4 = *(_DWORD *)(result + 56);
        if (v4 == *(_DWORD *)(result + 72))
        {
          Class result = sub_1000B1CCC(*(_DWORD *)(result + 12), *(UInt8 **)(result + 28), v3, *(UInt8 **)(result + 44), v4);
          *(_DWORD *)(a2 + 32) = result;
          return result;
        }
      }
    }

    int v5 = -300;
  }

  else
  {
    int v5 = -304;
  }

  *(_DWORD *)(a2 + 32) = v5;
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  return result;
}

uint64_t sub_100146240(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) != 0 && *(_DWORD *)(result + 24) == 1 && *(_DWORD *)(result + 4) == 56)
  {
    if (*(_BYTE *)(result + 39) == 1)
    {
      CFIndex v3 = *(unsigned int *)(result + 40);
      if ((_DWORD)v3 == *(_DWORD *)(result + 52))
      {
        Class result = sub_1000B1E34(*(_DWORD *)(result + 12), *(UInt8 **)(result + 28), v3);
        *(_DWORD *)(a2 + 32) = result;
        return result;
      }
    }

    int v4 = -300;
  }

  else
  {
    int v4 = -304;
  }

  *(_DWORD *)(a2 + 32) = v4;
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  return result;
}

uint64_t sub_1001462D0(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) != 0 && *(_DWORD *)(result + 24) == 1 && *(_DWORD *)(result + 4) == 60)
  {
    if (*(_BYTE *)(result + 39) == 1)
    {
      CFIndex v3 = *(unsigned int *)(result + 40);
      if ((_DWORD)v3 == *(_DWORD *)(result + 52))
      {
        Class result = sub_1000B1FE0(*(_DWORD *)(result + 12), *(UInt8 **)(result + 28), v3, *(unsigned int *)(result + 56));
        *(_DWORD *)(a2 + 32) = result;
        return result;
      }
    }

    int v4 = -300;
  }

  else
  {
    int v4 = -304;
  }

  *(_DWORD *)(a2 + 32) = v4;
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  return result;
}

uint64_t sub_100146364(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) != 0 && *(_DWORD *)(result + 24) == 1 && *(_DWORD *)(result + 4) == 56)
  {
    if (*(_BYTE *)(result + 39) == 1)
    {
      unsigned int v3 = *(_DWORD *)(result + 40);
      if (v3 == *(_DWORD *)(result + 52))
      {
        Class result = sub_1000B213C(*(_DWORD *)(result + 12), *(UInt8 **)(result + 28), v3);
        *(_DWORD *)(a2 + 32) = result;
        return result;
      }
    }

    int v4 = -300;
  }

  else
  {
    int v4 = -304;
  }

  *(_DWORD *)(a2 + 32) = v4;
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  return result;
}

uint64_t sub_1001463F4(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) != 0 && *(_DWORD *)(result + 24) == 1 && *(_DWORD *)(result + 4) == 60)
  {
    if (*(_BYTE *)(result + 39) == 1)
    {
      unsigned int v3 = *(_DWORD *)(result + 40);
      if (v3 == *(_DWORD *)(result + 52))
      {
        Class result = sub_1000B224C(*(_DWORD *)(result + 12), *(UInt8 **)(result + 28), v3, *(_DWORD *)(result + 56));
        *(_DWORD *)(a2 + 32) = result;
        return result;
      }
    }

    int v4 = -300;
  }

  else
  {
    int v4 = -304;
  }

  *(_DWORD *)(a2 + 32) = v4;
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  return result;
}

uint64_t sub_100146488(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) != 0 && *(_DWORD *)(result + 24) == 1 && *(_DWORD *)(result + 4) == 64)
  {
    if (*(_BYTE *)(result + 39) == 1)
    {
      CFIndex v3 = *(unsigned int *)(result + 40);
      if ((_DWORD)v3 == *(_DWORD *)(result + 52))
      {
        Class result = sub_1000B23C4( *(_DWORD *)(result + 12),  *(UInt8 **)(result + 28),  v3,  *(_DWORD *)(result + 56),  *(_DWORD *)(result + 60));
        *(_DWORD *)(a2 + 32) = result;
        return result;
      }
    }

    int v4 = -300;
  }

  else
  {
    int v4 = -304;
  }

  *(_DWORD *)(a2 + 32) = v4;
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  return result;
}

uint64_t sub_10014651C(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) == 0 || *(_DWORD *)(result + 24) != 1 || *(_DWORD *)(result + 4) != 56)
  {
    int v5 = -304;
LABEL_9:
    *(_DWORD *)(a2 + 32) = v5;
    NDR_record_t v4 = NDR_record;
    goto LABEL_10;
  }

  if (*(_BYTE *)(result + 39) != 1 || (CFIndex v3 = *(unsigned int *)(result + 40), (_DWORD)v3 != *(_DWORD *)(result + 52)))
  {
    int v5 = -300;
    goto LABEL_9;
  }

  Class result = sub_1000B25A4(*(_DWORD *)(result + 12), *(UInt8 **)(result + 28), v3, (_DWORD *)(a2 + 36));
  *(_DWORD *)(a2 + 32) = result;
  NDR_record_t v4 = NDR_record;
  if (!(_DWORD)result)
  {
    *(NDR_record_t *)(a2 + 24) = NDR_record;
    *(_DWORD *)(a2 + 4) = 40;
    return result;
  }

uint64_t sub_1001465CC(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) != 0 && *(_DWORD *)(result + 24) == 1 && *(_DWORD *)(result + 4) == 64)
  {
    if (*(_BYTE *)(result + 39) == 1)
    {
      unsigned int v3 = *(_DWORD *)(result + 40);
      if (v3 == *(_DWORD *)(result + 60))
      {
        Class result = sub_1000B27EC( *(_DWORD *)(result + 12),  *(unsigned int *)(result + 52),  *(unsigned int *)(result + 56),  *(UInt8 **)(result + 28),  v3);
        *(_DWORD *)(a2 + 32) = result;
        return result;
      }
    }

    int v4 = -300;
  }

  else
  {
    int v4 = -304;
  }

  *(_DWORD *)(a2 + 32) = v4;
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  return result;
}

uint64_t sub_100146660(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) != 0 && *(_DWORD *)(result + 24) == 1 && *(_DWORD *)(result + 4) == 64)
  {
    if (*(_BYTE *)(result + 39) == 1)
    {
      unsigned int v3 = *(_DWORD *)(result + 40);
      if (v3 == *(_DWORD *)(result + 60))
      {
        Class result = sub_1000B26A8( *(_DWORD *)(result + 12),  *(unsigned int *)(result + 52),  *(unsigned int *)(result + 56),  *(UInt8 **)(result + 28),  v3);
        *(_DWORD *)(a2 + 32) = result;
        return result;
      }
    }

    int v4 = -300;
  }

  else
  {
    int v4 = -304;
  }

  *(_DWORD *)(a2 + 32) = v4;
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  return result;
}

_DWORD *sub_1001466F4(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0 || result[1] != 36)
  {
    *(_DWORD *)(a2 + 32) = -304;
    *(NDR_record_t *)(a2 + 24) = NDR_record;
  }

  else
  {
    Class result = (_DWORD *)sub_1000B2930(result[3], result[8]);
    *(_DWORD *)(a2 + 32) = (_DWORD)result;
  }

  return result;
}

_DWORD *sub_100146754(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0 || result[1] != 36)
  {
    *(_DWORD *)(a2 + 32) = -304;
    *(NDR_record_t *)(a2 + 24) = NDR_record;
  }

  else
  {
    Class result = (_DWORD *)sub_1000AF7C4(result[3], result[8]);
    *(_DWORD *)(a2 + 32) = (_DWORD)result;
  }

  return result;
}

_DWORD *sub_1001467B4(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0 || result[1] != 24)
  {
    *(_DWORD *)(a2 + 32) = -304;
    NDR_record_t v3 = NDR_record;
  }

  else
  {
    Class result = (_DWORD *)sub_1000AF8F4(result[3], (_DWORD *)(a2 + 36));
    *(_DWORD *)(a2 + 32) = (_DWORD)result;
    NDR_record_t v3 = NDR_record;
    if (!(_DWORD)result)
    {
      *(NDR_record_t *)(a2 + 24) = NDR_record;
      *(_DWORD *)(a2 + 4) = 40;
      return result;
    }
  }

  *(NDR_record_t *)(a2 + 24) = v3;
  return result;
}

_DWORD *sub_10014682C(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0 || result[1] != 36)
  {
    *(_DWORD *)(a2 + 32) = -304;
    *(NDR_record_t *)(a2 + 24) = NDR_record;
  }

  else
  {
    Class result = (_DWORD *)sub_1000AF9B4(result[3], result[8]);
    *(_DWORD *)(a2 + 32) = (_DWORD)result;
  }

  return result;
}

_DWORD *sub_10014688C(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0 || result[1] != 24)
  {
    *(_DWORD *)(a2 + 32) = -304;
    NDR_record_t v3 = NDR_record;
  }

  else
  {
    Class result = (_DWORD *)sub_1000AFAE4(result[3], (_DWORD *)(a2 + 36));
    *(_DWORD *)(a2 + 32) = (_DWORD)result;
    NDR_record_t v3 = NDR_record;
    if (!(_DWORD)result)
    {
      *(NDR_record_t *)(a2 + 24) = NDR_record;
      *(_DWORD *)(a2 + 4) = 40;
      return result;
    }
  }

  *(NDR_record_t *)(a2 + 24) = v3;
  return result;
}

_DWORD *sub_100146904(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0 || result[1] != 36)
  {
    *(_DWORD *)(a2 + 32) = -304;
    *(NDR_record_t *)(a2 + 24) = NDR_record;
  }

  else
  {
    Class result = (_DWORD *)sub_1000AFEB8(result[3], result[8]);
    *(_DWORD *)(a2 + 32) = (_DWORD)result;
  }

  return result;
}

_DWORD *sub_100146964(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0 || result[1] != 24)
  {
    *(_DWORD *)(a2 + 32) = -304;
    NDR_record_t v3 = NDR_record;
  }

  else
  {
    Class result = (_DWORD *)sub_1000AFFE0(result[3], (_DWORD *)(a2 + 36));
    *(_DWORD *)(a2 + 32) = (_DWORD)result;
    NDR_record_t v3 = NDR_record;
    if (!(_DWORD)result)
    {
      *(NDR_record_t *)(a2 + 24) = NDR_record;
      *(_DWORD *)(a2 + 4) = 40;
      return result;
    }
  }

  *(NDR_record_t *)(a2 + 24) = v3;
  return result;
}

uint64_t sub_1001469DC(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) == 0 || *(_DWORD *)(result + 24) != 2 || *(_DWORD *)(result + 4) != 96)
  {
    int v5 = -304;
LABEL_10:
    *(_DWORD *)(a2 + 32) = v5;
    goto LABEL_11;
  }

  if (*(_BYTE *)(result + 39) != 1
    || *(_BYTE *)(result + 55) != 1
    || (unsigned int v3 = *(_DWORD *)(result + 40), v3 != *(_DWORD *)(result + 84))
    || (unsigned int v4 = *(_DWORD *)(result + 56), v4 != *(_DWORD *)(result + 88)))
  {
    int v5 = -300;
    goto LABEL_10;
  }

  Class result = sub_1000B00F0( *(_DWORD *)(result + 12),  *(_DWORD *)(result + 68),  *(unsigned int *)(result + 72),  *(_DWORD *)(result + 76),  *(unsigned int *)(result + 80),  *(UInt8 **)(result + 28),  v3,  *(UInt8 **)(result + 44),  v4,  *(_DWORD *)(result + 92));
  *(_DWORD *)(a2 + 32) = result;
LABEL_11:
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  return result;
}

_DWORD *sub_100146AA4(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0 || result[1] != 24)
  {
    *(_DWORD *)(a2 + 32) = -304;
    NDR_record_t v3 = NDR_record;
  }

  else
  {
    Class result = (_DWORD *)sub_1000B0314(result[3], (_DWORD *)(a2 + 36));
    *(_DWORD *)(a2 + 32) = (_DWORD)result;
    NDR_record_t v3 = NDR_record;
    if (!(_DWORD)result)
    {
      *(NDR_record_t *)(a2 + 24) = NDR_record;
      *(_DWORD *)(a2 + 4) = 40;
      return result;
    }
  }

  *(NDR_record_t *)(a2 + 24) = v3;
  return result;
}

_DWORD *sub_100146B1C(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0 || result[1] != 36)
  {
    *(_DWORD *)(a2 + 32) = -304;
    *(NDR_record_t *)(a2 + 24) = NDR_record;
  }

  else
  {
    Class result = (_DWORD *)sub_1000B03D4(result[3], result[8]);
    *(_DWORD *)(a2 + 32) = (_DWORD)result;
  }

  return result;
}

_DWORD *sub_100146B7C(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0 || result[1] != 24)
  {
    *(_DWORD *)(a2 + 32) = -304;
    goto LABEL_6;
  }

  *(_DWORD *)(a2 + 36) = 16777473;
  Class result = (_DWORD *)sub_1000B0500(result[3], (vm_offset_t *)(a2 + 28), (mach_msg_type_number_t *)(a2 + 52));
  if ((_DWORD)result)
  {
    *(_DWORD *)(a2 + 32) = (_DWORD)result;
LABEL_6:
    *(NDR_record_t *)(a2 + 24) = NDR_record;
    return result;
  }

  *(_DWORD *)(a2 + 40) = *(_DWORD *)(a2 + 52);
  *(NDR_record_t *)(a2 + 44) = NDR_record;
  *(_DWORD *)a2 |= 0x80000000;
  *(_DWORD *)(a2 + 4) = 56;
  *(_DWORD *)(a2 + 24) = 1;
  return result;
}

_DWORD *sub_100146C20(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0 || result[1] != 36)
  {
    *(_DWORD *)(a2 + 32) = -304;
    NDR_record_t v3 = NDR_record;
  }

  else
  {
    Class result = (_DWORD *)sub_1000B07B8(result[3], result[8], (_DWORD *)(a2 + 36));
    *(_DWORD *)(a2 + 32) = (_DWORD)result;
    NDR_record_t v3 = NDR_record;
    if (!(_DWORD)result)
    {
      *(NDR_record_t *)(a2 + 24) = NDR_record;
      *(_DWORD *)(a2 + 4) = 40;
      return result;
    }
  }

  *(NDR_record_t *)(a2 + 24) = v3;
  return result;
}

_DWORD *sub_100146CA0(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0 || result[1] != 24)
  {
    *(_DWORD *)(a2 + 32) = -304;
    NDR_record_t v3 = NDR_record;
  }

  else
  {
    Class result = (_DWORD *)sub_1000B08F4(result[3], (_DWORD *)(a2 + 36));
    *(_DWORD *)(a2 + 32) = (_DWORD)result;
    NDR_record_t v3 = NDR_record;
    if (!(_DWORD)result)
    {
      *(NDR_record_t *)(a2 + 24) = NDR_record;
      *(_DWORD *)(a2 + 4) = 40;
      return result;
    }
  }

  *(NDR_record_t *)(a2 + 24) = v3;
  return result;
}

_DWORD *sub_100146D18(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0 || result[1] != 24)
  {
    *(_DWORD *)(a2 + 32) = -304;
    NDR_record_t v3 = NDR_record;
  }

  else
  {
    Class result = (_DWORD *)sub_1000B09B4(result[3], (_DWORD *)(a2 + 36));
    *(_DWORD *)(a2 + 32) = (_DWORD)result;
    NDR_record_t v3 = NDR_record;
    if (!(_DWORD)result)
    {
      *(NDR_record_t *)(a2 + 24) = NDR_record;
      *(_DWORD *)(a2 + 4) = 40;
      return result;
    }
  }

  *(NDR_record_t *)(a2 + 24) = v3;
  return result;
}

_DWORD *sub_100146D90(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0 || result[1] != 24)
  {
    *(_DWORD *)(a2 + 32) = -304;
    NDR_record_t v3 = NDR_record;
  }

  else
  {
    Class result = (_DWORD *)sub_1000B3188(result[3], (_DWORD *)(a2 + 36));
    *(_DWORD *)(a2 + 32) = (_DWORD)result;
    NDR_record_t v3 = NDR_record;
    if (!(_DWORD)result)
    {
      *(NDR_record_t *)(a2 + 24) = NDR_record;
      *(_DWORD *)(a2 + 4) = 40;
      return result;
    }
  }

  *(NDR_record_t *)(a2 + 24) = v3;
  return result;
}

_DWORD *sub_100146E08(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0 || result[1] != 36)
  {
    *(_DWORD *)(a2 + 32) = -304;
    *(NDR_record_t *)(a2 + 24) = NDR_record;
  }

  else
  {
    Class result = (_DWORD *)sub_1000B1268(result[3], result[8]);
    *(_DWORD *)(a2 + 32) = (_DWORD)result;
  }

  return result;
}

_DWORD *sub_100146E68(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0 || result[1] != 24)
  {
    *(_DWORD *)(a2 + 32) = -304;
    NDR_record_t v3 = NDR_record;
  }

  else
  {
    Class result = (_DWORD *)sub_1000B1324(result[3], (_DWORD *)(a2 + 36));
    *(_DWORD *)(a2 + 32) = (_DWORD)result;
    NDR_record_t v3 = NDR_record;
    if (!(_DWORD)result)
    {
      *(NDR_record_t *)(a2 + 24) = NDR_record;
      *(_DWORD *)(a2 + 4) = 40;
      return result;
    }
  }

  *(NDR_record_t *)(a2 + 24) = v3;
  return result;
}

_DWORD *sub_100146EE0(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0 || result[1] != 36)
  {
    *(_DWORD *)(a2 + 32) = -304;
    *(NDR_record_t *)(a2 + 24) = NDR_record;
  }

  else
  {
    Class result = (_DWORD *)sub_1000B2A88(result[3], result[8]);
    *(_DWORD *)(a2 + 32) = (_DWORD)result;
  }

  return result;
}

_DWORD *sub_100146F40(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0 || result[1] != 24)
  {
    *(_DWORD *)(a2 + 32) = -304;
    NDR_record_t v3 = NDR_record;
  }

  else
  {
    Class result = (_DWORD *)sub_1000B2B98(result[3], (_DWORD *)(a2 + 36));
    *(_DWORD *)(a2 + 32) = (_DWORD)result;
    NDR_record_t v3 = NDR_record;
    if (!(_DWORD)result)
    {
      *(NDR_record_t *)(a2 + 24) = NDR_record;
      *(_DWORD *)(a2 + 4) = 40;
      return result;
    }
  }

  *(NDR_record_t *)(a2 + 24) = v3;
  return result;
}

_DWORD *sub_100146FB8(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0 || result[1] != 24)
  {
    *(_DWORD *)(a2 + 32) = -304;
    NDR_record_t v3 = NDR_record;
  }

  else
  {
    Class result = (_DWORD *)sub_1000AFBA4(result[3], (_DWORD *)(a2 + 36));
    *(_DWORD *)(a2 + 32) = (_DWORD)result;
    NDR_record_t v3 = NDR_record;
    if (!(_DWORD)result)
    {
      *(NDR_record_t *)(a2 + 24) = NDR_record;
      *(_DWORD *)(a2 + 4) = 40;
      return result;
    }
  }

  *(NDR_record_t *)(a2 + 24) = v3;
  return result;
}

uint64_t sub_100147030(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) != 0 || *(_DWORD *)(result + 4) != 40)
  {
    *(_DWORD *)(a2 + 32) = -304;
    *(NDR_record_t *)(a2 + 24) = NDR_record;
  }

  else
  {
    Class result = sub_1000AFCAC(*(_DWORD *)(result + 12), *(double *)(result + 32));
    *(_DWORD *)(a2 + 32) = result;
  }

  return result;
}

_DWORD *sub_100147090(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0 || result[1] != 24)
  {
    *(_DWORD *)(a2 + 32) = -304;
    NDR_record_t v3 = NDR_record;
  }

  else
  {
    Class result = (_DWORD *)sub_1000AFDBC(result[3], (void *)(a2 + 36));
    *(_DWORD *)(a2 + 32) = (_DWORD)result;
    NDR_record_t v3 = NDR_record;
    if (!(_DWORD)result)
    {
      *(NDR_record_t *)(a2 + 24) = NDR_record;
      *(_DWORD *)(a2 + 4) = 44;
      return result;
    }
  }

  *(NDR_record_t *)(a2 + 24) = v3;
  return result;
}

_DWORD *sub_100147108(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0 || result[1] != 36)
  {
    *(_DWORD *)(a2 + 32) = -304;
    *(NDR_record_t *)(a2 + 24) = NDR_record;
  }

  else
  {
    Class result = (_DWORD *)sub_1000B2C5C(result[3], result[8]);
    *(_DWORD *)(a2 + 32) = (_DWORD)result;
  }

  return result;
}

_DWORD *sub_100147168(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0 || result[1] != 24)
  {
    *(_DWORD *)(a2 + 32) = -304;
    NDR_record_t v3 = NDR_record;
  }

  else
  {
    Class result = (_DWORD *)sub_1000B2D70(result[3], (_DWORD *)(a2 + 36));
    *(_DWORD *)(a2 + 32) = (_DWORD)result;
    NDR_record_t v3 = NDR_record;
    if (!(_DWORD)result)
    {
      *(NDR_record_t *)(a2 + 24) = NDR_record;
      *(_DWORD *)(a2 + 4) = 40;
      return result;
    }
  }

  *(NDR_record_t *)(a2 + 24) = v3;
  return result;
}

_DWORD *sub_1001471E0(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0 || result[1] != 36)
  {
    *(_DWORD *)(a2 + 32) = -304;
    *(NDR_record_t *)(a2 + 24) = NDR_record;
  }

  else
  {
    Class result = (_DWORD *)sub_1000B2E34(result[3], result[8]);
    *(_DWORD *)(a2 + 32) = (_DWORD)result;
  }

  return result;
}

uint64_t sub_100147240(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) != 0 || *(_DWORD *)(result + 4) != 40)
  {
    *(_DWORD *)(a2 + 32) = -304;
    *(NDR_record_t *)(a2 + 24) = NDR_record;
  }

  else
  {
    Class result = sub_1000B2FA8(*(_DWORD *)(result + 12), *(void *)(result + 32));
    *(_DWORD *)(a2 + 32) = result;
  }

  return result;
}

_DWORD *sub_1001472A0(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0 || result[1] != 24)
  {
    *(_DWORD *)(a2 + 32) = -304;
    NDR_record_t v3 = NDR_record;
  }

  else
  {
    Class result = (_DWORD *)sub_1000B0B78(result[3], (_DWORD *)(a2 + 36));
    *(_DWORD *)(a2 + 32) = (_DWORD)result;
    NDR_record_t v3 = NDR_record;
    if (!(_DWORD)result)
    {
      *(NDR_record_t *)(a2 + 24) = NDR_record;
      *(_DWORD *)(a2 + 4) = 40;
      return result;
    }
  }

  *(NDR_record_t *)(a2 + 24) = v3;
  return result;
}

_DWORD *sub_100147318(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0 || result[1] != 24)
  {
    *(_DWORD *)(a2 + 32) = -304;
    goto LABEL_6;
  }

  *(_DWORD *)(a2 + 36) = 16777473;
  Class result = (_DWORD *)sub_1000B0C38(result[3], (vm_offset_t *)(a2 + 28), (mach_msg_type_number_t *)(a2 + 52));
  if ((_DWORD)result)
  {
    *(_DWORD *)(a2 + 32) = (_DWORD)result;
LABEL_6:
    *(NDR_record_t *)(a2 + 24) = NDR_record;
    return result;
  }

  *(_DWORD *)(a2 + 40) = *(_DWORD *)(a2 + 52);
  *(NDR_record_t *)(a2 + 44) = NDR_record;
  *(_DWORD *)a2 |= 0x80000000;
  *(_DWORD *)(a2 + 4) = 56;
  *(_DWORD *)(a2 + 24) = 1;
  return result;
}

_DWORD *sub_1001473BC(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0 || result[1] != 24)
  {
    *(_DWORD *)(a2 + 32) = -304;
  }

  else
  {
    Class result = (_DWORD *)sub_1000B0D64(result[3]);
    *(_DWORD *)(a2 + 32) = (_DWORD)result;
  }

  *(NDR_record_t *)(a2 + 24) = NDR_record;
  return result;
}

_DWORD *sub_100147414(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0 || result[1] != 24)
  {
    *(_DWORD *)(a2 + 32) = -304;
    NDR_record_t v3 = NDR_record;
  }

  else
  {
    Class result = (_DWORD *)sub_1000B0E54(result[3], (_DWORD *)(a2 + 36));
    *(_DWORD *)(a2 + 32) = (_DWORD)result;
    NDR_record_t v3 = NDR_record;
    if (!(_DWORD)result)
    {
      *(NDR_record_t *)(a2 + 24) = NDR_record;
      *(_DWORD *)(a2 + 4) = 40;
      return result;
    }
  }

  *(NDR_record_t *)(a2 + 24) = v3;
  return result;
}

_DWORD *sub_10014748C(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0 || result[1] != 24)
  {
    *(_DWORD *)(a2 + 32) = -304;
    goto LABEL_6;
  }

  *(_DWORD *)(a2 + 36) = 16777473;
  Class result = (_DWORD *)sub_1000B0F14(result[3], (vm_offset_t *)(a2 + 28), (mach_msg_type_number_t *)(a2 + 52));
  if ((_DWORD)result)
  {
    *(_DWORD *)(a2 + 32) = (_DWORD)result;
LABEL_6:
    *(NDR_record_t *)(a2 + 24) = NDR_record;
    return result;
  }

  *(_DWORD *)(a2 + 40) = *(_DWORD *)(a2 + 52);
  *(NDR_record_t *)(a2 + 44) = NDR_record;
  *(_DWORD *)a2 |= 0x80000000;
  *(_DWORD *)(a2 + 4) = 56;
  *(_DWORD *)(a2 + 24) = 1;
  return result;
}

uint64_t sub_100147530(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) == 0 || *(_DWORD *)(result + 24) != 1 || *(_DWORD *)(result + 4) != 56)
  {
    int v5 = -304;
LABEL_9:
    *(_DWORD *)(a2 + 32) = v5;
    NDR_record_t v4 = NDR_record;
    goto LABEL_10;
  }

  if (*(_BYTE *)(result + 39) != 1 || (unsigned int v3 = *(_DWORD *)(result + 40), v3 != *(_DWORD *)(result + 52)))
  {
    int v5 = -300;
    goto LABEL_9;
  }

  Class result = sub_1000B1028(*(_DWORD *)(result + 12), *(UInt8 **)(result + 28), v3, (_DWORD *)(a2 + 36));
  *(_DWORD *)(a2 + 32) = result;
  NDR_record_t v4 = NDR_record;
  if (!(_DWORD)result)
  {
    *(NDR_record_t *)(a2 + 24) = NDR_record;
    *(_DWORD *)(a2 + 4) = 40;
    return result;
  }

_DWORD *sub_1001475E0(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0 || result[1] != 24)
  {
    *(_DWORD *)(a2 + 32) = -304;
    goto LABEL_6;
  }

  *(_DWORD *)(a2 + 36) = 16777473;
  Class result = (_DWORD *)sub_1000B1164(result[3], (vm_offset_t *)(a2 + 28), (mach_msg_type_number_t *)(a2 + 52));
  if ((_DWORD)result)
  {
    *(_DWORD *)(a2 + 32) = (_DWORD)result;
LABEL_6:
    *(NDR_record_t *)(a2 + 24) = NDR_record;
    return result;
  }

  *(_DWORD *)(a2 + 40) = *(_DWORD *)(a2 + 52);
  *(NDR_record_t *)(a2 + 44) = NDR_record;
  *(_DWORD *)a2 |= 0x80000000;
  *(_DWORD *)(a2 + 4) = 56;
  *(_DWORD *)(a2 + 24) = 1;
  return result;
}

uint64_t sub_100147684(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) == 0 || *(_DWORD *)(result + 24) != 2 || *(_DWORD *)(result + 4) != 76)
  {
    int v3 = -304;
LABEL_11:
    *(_DWORD *)(a2 + 32) = v3;
    goto LABEL_12;
  }

  if (*(_BYTE *)(result + 39) != 1
    || *(_BYTE *)(result + 55) != 1
    || *(_DWORD *)(result + 40) != *(_DWORD *)(result + 68)
    || *(_DWORD *)(result + 56) != *(_DWORD *)(result + 72))
  {
    int v3 = -300;
    goto LABEL_11;
  }

  *(_DWORD *)(a2 + 36) = 16777473;
  Class result = sub_1000B3948( *(_DWORD *)(result + 12),  *(UInt8 **)(result + 28),  *(_DWORD *)(result + 40),  *(UInt8 **)(result + 44),  *(_DWORD *)(result + 56),  (vm_offset_t *)(a2 + 28),  (mach_msg_type_number_t *)(a2 + 52));
  if ((_DWORD)result)
  {
    *(_DWORD *)(a2 + 32) = result;
LABEL_12:
    *(NDR_record_t *)(a2 + 24) = NDR_record;
    return result;
  }

  *(_DWORD *)(a2 + 40) = *(_DWORD *)(a2 + 52);
  *(NDR_record_t *)(a2 + 44) = NDR_record;
  *(_DWORD *)a2 |= 0x80000000;
  *(_DWORD *)(a2 + 4) = 56;
  *(_DWORD *)(a2 + 24) = 1;
  return result;
}

uint64_t sub_100147788(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) != 0 && *(_DWORD *)(result + 24) == 3 && *(_DWORD *)(result + 4) == 96)
  {
    if (*(_BYTE *)(result + 39) == 1 && *(_BYTE *)(result + 55) == 1 && *(_BYTE *)(result + 71) == 1)
    {
      unsigned int v3 = *(_DWORD *)(result + 40);
      if (v3 == *(_DWORD *)(result + 84))
      {
        unsigned int v4 = *(_DWORD *)(result + 56);
        if (v4 == *(_DWORD *)(result + 88))
        {
          unsigned int v5 = *(_DWORD *)(result + 72);
          if (v5 == *(_DWORD *)(result + 92))
          {
            Class result = sub_1000B3BD4( *(_DWORD *)(result + 12),  *(UInt8 **)(result + 28),  v3,  *(UInt8 **)(result + 44),  v4,  *(UInt8 **)(result + 60),  v5);
            *(_DWORD *)(a2 + 32) = result;
            return result;
          }
        }
      }
    }

    int v6 = -300;
  }

  else
  {
    int v6 = -304;
  }

  *(_DWORD *)(a2 + 32) = v6;
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  return result;
}

uint64_t sub_100147858(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) == 0 || *(_DWORD *)(result + 24) != 3 || *(_DWORD *)(result + 4) != 96)
  {
    int v7 = -304;
LABEL_13:
    *(_DWORD *)(a2 + 32) = v7;
    NDR_record_t v6 = NDR_record;
    goto LABEL_14;
  }

  if (*(_BYTE *)(result + 39) != 1
    || *(_BYTE *)(result + 55) != 1
    || *(_BYTE *)(result + 71) != 1
    || (unsigned int v3 = *(_DWORD *)(result + 40), v3 != *(_DWORD *)(result + 84))
    || (unsigned int v4 = *(_DWORD *)(result + 56), v4 != *(_DWORD *)(result + 88))
    || (unsigned int v5 = *(_DWORD *)(result + 72), v5 != *(_DWORD *)(result + 92)))
  {
    int v7 = -300;
    goto LABEL_13;
  }

  Class result = sub_1000B3DCC( *(_DWORD *)(result + 12),  *(UInt8 **)(result + 28),  v3,  *(UInt8 **)(result + 44),  v4,  *(UInt8 **)(result + 60),  v5,  (_DWORD *)(a2 + 36));
  *(_DWORD *)(a2 + 32) = result;
  NDR_record_t v6 = NDR_record;
  if (!(_DWORD)result)
  {
    *(NDR_record_t *)(a2 + 24) = NDR_record;
    *(_DWORD *)(a2 + 4) = 40;
    return result;
  }

uint64_t sub_100147948(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) == 0 || *(_DWORD *)(result + 24) != 1 || *(_DWORD *)(result + 4) != 56)
  {
    int v5 = -304;
LABEL_9:
    *(_DWORD *)(a2 + 32) = v5;
    NDR_record_t v4 = NDR_record;
    goto LABEL_10;
  }

  if (*(_BYTE *)(result + 39) != 1 || (unsigned int v3 = *(_DWORD *)(result + 40), v3 != *(_DWORD *)(result + 52)))
  {
    int v5 = -300;
    goto LABEL_9;
  }

  Class result = sub_1000B59D4(*(_DWORD *)(result + 12), *(UInt8 **)(result + 28), v3, (_DWORD *)(a2 + 36));
  *(_DWORD *)(a2 + 32) = result;
  NDR_record_t v4 = NDR_record;
  if (!(_DWORD)result)
  {
    *(NDR_record_t *)(a2 + 24) = NDR_record;
    *(_DWORD *)(a2 + 4) = 40;
    return result;
  }

uint64_t sub_1001479F8(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) == 0 || *(_DWORD *)(result + 24) != 1 || *(_DWORD *)(result + 4) != 60)
  {
    int v5 = -304;
LABEL_9:
    *(_DWORD *)(a2 + 32) = v5;
    NDR_record_t v4 = NDR_record;
    goto LABEL_10;
  }

  if (*(_BYTE *)(result + 39) != 1 || (unsigned int v3 = *(_DWORD *)(result + 40), v3 != *(_DWORD *)(result + 52)))
  {
    int v5 = -300;
    goto LABEL_9;
  }

  Class result = sub_1000B5AE8( *(_DWORD *)(result + 12),  *(UInt8 **)(result + 28),  v3,  *(unsigned int *)(result + 56),  (_DWORD *)(a2 + 36));
  *(_DWORD *)(a2 + 32) = result;
  NDR_record_t v4 = NDR_record;
  if (!(_DWORD)result)
  {
    *(NDR_record_t *)(a2 + 24) = NDR_record;
    *(_DWORD *)(a2 + 4) = 40;
    return result;
  }

uint64_t sub_100147AAC(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) == 0 || *(_DWORD *)(result + 24) != 1 || *(_DWORD *)(result + 4) != 56)
  {
    int v3 = -304;
LABEL_9:
    *(_DWORD *)(a2 + 32) = v3;
    goto LABEL_10;
  }

  if (*(_BYTE *)(result + 39) != 1 || *(_DWORD *)(result + 40) != *(_DWORD *)(result + 52))
  {
    int v3 = -300;
    goto LABEL_9;
  }

  *(_DWORD *)(a2 + 36) = 16777473;
  Class result = sub_1000B4168( *(_DWORD *)(result + 12),  *(UInt8 **)(result + 28),  *(_DWORD *)(result + 40),  (vm_offset_t *)(a2 + 28),  (mach_msg_type_number_t *)(a2 + 52));
  if ((_DWORD)result)
  {
    *(_DWORD *)(a2 + 32) = result;
LABEL_10:
    *(NDR_record_t *)(a2 + 24) = NDR_record;
    return result;
  }

  *(_DWORD *)(a2 + 40) = *(_DWORD *)(a2 + 52);
  *(NDR_record_t *)(a2 + 44) = NDR_record;
  *(_DWORD *)a2 |= 0x80000000;
  *(_DWORD *)(a2 + 4) = 56;
  *(_DWORD *)(a2 + 24) = 1;
  return result;
}

uint64_t sub_100147B8C(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) != 0 && *(_DWORD *)(result + 24) == 1 && *(_DWORD *)(result + 4) == 56)
  {
    if (*(_BYTE *)(result + 39) == 1)
    {
      unsigned int v3 = *(_DWORD *)(result + 40);
      if (v3 == *(_DWORD *)(result + 52))
      {
        Class result = sub_1000B43E0(*(_DWORD *)(result + 12), *(UInt8 **)(result + 28), v3);
        *(_DWORD *)(a2 + 32) = result;
        return result;
      }
    }

    int v4 = -300;
  }

  else
  {
    int v4 = -304;
  }

  *(_DWORD *)(a2 + 32) = v4;
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  return result;
}

uint64_t sub_100147C1C(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) != 0 && *(_DWORD *)(result + 24) == 1 && *(_DWORD *)(result + 4) == 60)
  {
    if (*(_BYTE *)(result + 39) == 1)
    {
      unsigned int v3 = *(_DWORD *)(result + 40);
      if (v3 == *(_DWORD *)(result + 52))
      {
        Class result = sub_1000B4534(*(_DWORD *)(result + 12), *(UInt8 **)(result + 28), v3, *(_DWORD *)(result + 56));
        *(_DWORD *)(a2 + 32) = result;
        return result;
      }
    }

    int v4 = -300;
  }

  else
  {
    int v4 = -304;
  }

  *(_DWORD *)(a2 + 32) = v4;
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  return result;
}

uint64_t sub_100147CB0(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) == 0 || *(_DWORD *)(result + 24) != 2 || *(_DWORD *)(result + 4) != 76)
  {
    int v6 = -304;
LABEL_11:
    *(_DWORD *)(a2 + 32) = v6;
    NDR_record_t v5 = NDR_record;
    goto LABEL_12;
  }

  if (*(_BYTE *)(result + 39) != 1
    || *(_BYTE *)(result + 55) != 1
    || (unsigned int v3 = *(_DWORD *)(result + 40), v3 != *(_DWORD *)(result + 68))
    || (unsigned int v4 = *(_DWORD *)(result + 56), v4 != *(_DWORD *)(result + 72)))
  {
    int v6 = -300;
    goto LABEL_11;
  }

  Class result = sub_1000B46A4( *(_DWORD *)(result + 12),  *(UInt8 **)(result + 28),  v3,  *(UInt8 **)(result + 44),  v4,  (_DWORD *)(a2 + 36));
  *(_DWORD *)(a2 + 32) = result;
  NDR_record_t v5 = NDR_record;
  if (!(_DWORD)result)
  {
    *(NDR_record_t *)(a2 + 24) = NDR_record;
    *(_DWORD *)(a2 + 4) = 40;
    return result;
  }

uint64_t sub_100147D80(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) == 0 || *(_DWORD *)(result + 24) != 2 || *(_DWORD *)(result + 4) != 76)
  {
    int v6 = -304;
LABEL_11:
    *(_DWORD *)(a2 + 32) = v6;
    NDR_record_t v5 = NDR_record;
    goto LABEL_12;
  }

  if (*(_BYTE *)(result + 39) != 1
    || *(_BYTE *)(result + 55) != 1
    || (unsigned int v3 = *(_DWORD *)(result + 40), v3 != *(_DWORD *)(result + 68))
    || (unsigned int v4 = *(_DWORD *)(result + 56), v4 != *(_DWORD *)(result + 72)))
  {
    int v6 = -300;
    goto LABEL_11;
  }

  Class result = sub_1000B5580( *(_DWORD *)(result + 12),  *(UInt8 **)(result + 28),  v3,  *(UInt8 **)(result + 44),  v4,  (_DWORD *)(a2 + 36));
  *(_DWORD *)(a2 + 32) = result;
  NDR_record_t v5 = NDR_record;
  if (!(_DWORD)result)
  {
    *(NDR_record_t *)(a2 + 24) = NDR_record;
    *(_DWORD *)(a2 + 4) = 40;
    return result;
  }

uint64_t sub_100147E50(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) == 0 || *(_DWORD *)(result + 24) != 2 || *(_DWORD *)(result + 4) != 80)
  {
    int v6 = -304;
LABEL_11:
    *(_DWORD *)(a2 + 32) = v6;
    NDR_record_t v5 = NDR_record;
    goto LABEL_12;
  }

  if (*(_BYTE *)(result + 39) != 1
    || *(_BYTE *)(result + 55) != 1
    || (unsigned int v3 = *(_DWORD *)(result + 40), v3 != *(_DWORD *)(result + 68))
    || (unsigned int v4 = *(_DWORD *)(result + 56), v4 != *(_DWORD *)(result + 76)))
  {
    int v6 = -300;
    goto LABEL_11;
  }

  Class result = sub_1000B5C9C( *(_DWORD *)(result + 12),  *(UInt8 **)(result + 28),  v3,  *(unsigned int *)(result + 72),  *(UInt8 **)(result + 44),  v4,  (_DWORD *)(a2 + 36));
  *(_DWORD *)(a2 + 32) = result;
  NDR_record_t v5 = NDR_record;
  if (!(_DWORD)result)
  {
    *(NDR_record_t *)(a2 + 24) = NDR_record;
    *(_DWORD *)(a2 + 4) = 40;
    return result;
  }

uint64_t sub_100147F24(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) == 0 || *(_DWORD *)(result + 24) != 2 || *(_DWORD *)(result + 4) != 76)
  {
    int v6 = -304;
LABEL_11:
    *(_DWORD *)(a2 + 32) = v6;
    NDR_record_t v5 = NDR_record;
    goto LABEL_12;
  }

  if (*(_BYTE *)(result + 39) != 1
    || *(_BYTE *)(result + 55) != 1
    || (unsigned int v3 = *(_DWORD *)(result + 40), v3 != *(_DWORD *)(result + 68))
    || (unsigned int v4 = *(_DWORD *)(result + 56), v4 != *(_DWORD *)(result + 72)))
  {
    int v6 = -300;
    goto LABEL_11;
  }

  Class result = sub_1000B6450( *(_DWORD *)(result + 12),  *(UInt8 **)(result + 28),  v3,  *(UInt8 **)(result + 44),  v4,  (int *)(a2 + 36));
  *(_DWORD *)(a2 + 32) = result;
  NDR_record_t v5 = NDR_record;
  if (!(_DWORD)result)
  {
    *(NDR_record_t *)(a2 + 24) = NDR_record;
    *(_DWORD *)(a2 + 4) = 40;
    return result;
  }

uint64_t sub_100147FF4(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) == 0 || *(_DWORD *)(result + 24) != 1 || *(_DWORD *)(result + 4) != 60)
  {
    int v3 = -304;
LABEL_9:
    *(_DWORD *)(a2 + 32) = v3;
    goto LABEL_10;
  }

  if (*(_BYTE *)(result + 39) != 1 || *(_DWORD *)(result + 40) != *(_DWORD *)(result + 52))
  {
    int v3 = -300;
    goto LABEL_9;
  }

  *(_DWORD *)(a2 + 36) = 16777473;
  Class result = sub_1000B699C( *(_DWORD *)(result + 12),  *(UInt8 **)(result + 28),  *(_DWORD *)(result + 40),  *(unsigned int *)(result + 56),  (vm_offset_t *)(a2 + 28),  (mach_msg_type_number_t *)(a2 + 52),  (int *)(a2 + 56));
  if ((_DWORD)result)
  {
    *(_DWORD *)(a2 + 32) = result;
LABEL_10:
    *(NDR_record_t *)(a2 + 24) = NDR_record;
    return result;
  }

  *(_DWORD *)(a2 + 40) = *(_DWORD *)(a2 + 52);
  *(NDR_record_t *)(a2 + 44) = NDR_record;
  *(_DWORD *)a2 |= 0x80000000;
  *(_DWORD *)(a2 + 4) = 60;
  *(_DWORD *)(a2 + 24) = 1;
  return result;
}

uint64_t sub_1001480DC(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) == 0 || *(_DWORD *)(result + 24) != 1 || *(_DWORD *)(result + 4) != 60)
  {
    int v5 = -304;
LABEL_9:
    *(_DWORD *)(a2 + 32) = v5;
    NDR_record_t v4 = NDR_record;
    goto LABEL_10;
  }

  if (*(_BYTE *)(result + 39) != 1 || (unsigned int v3 = *(_DWORD *)(result + 40), v3 != *(_DWORD *)(result + 52)))
  {
    int v5 = -300;
    goto LABEL_9;
  }

  Class result = sub_1000B6CA8( *(_DWORD *)(result + 12),  *(UInt8 **)(result + 28),  v3,  *(unsigned int *)(result + 56),  (unsigned int *)(a2 + 36));
  *(_DWORD *)(a2 + 32) = result;
  NDR_record_t v4 = NDR_record;
  if (!(_DWORD)result)
  {
    *(NDR_record_t *)(a2 + 24) = NDR_record;
    *(_DWORD *)(a2 + 4) = 40;
    return result;
  }

uint64_t sub_100148190(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) != 0 && *(_DWORD *)(result + 24) == 1 && *(_DWORD *)(result + 4) == 64)
  {
    if (*(_BYTE *)(result + 39) == 1)
    {
      unsigned int v3 = *(_DWORD *)(result + 40);
      if (v3 == *(_DWORD *)(result + 52))
      {
        Class result = sub_1000B6E80(*(_DWORD *)(result + 12), *(UInt8 **)(result + 28), v3, *(void *)(result + 56));
        *(_DWORD *)(a2 + 32) = result;
        return result;
      }
    }

    int v4 = -300;
  }

  else
  {
    int v4 = -304;
  }

  *(_DWORD *)(a2 + 32) = v4;
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  return result;
}

uint64_t sub_100148224(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) != 0 && *(_DWORD *)(result + 24) == 1 && *(_DWORD *)(result + 4) == 56)
  {
    if (*(_BYTE *)(result + 39) == 1)
    {
      unsigned int v3 = *(_DWORD *)(result + 40);
      if (v3 == *(_DWORD *)(result + 52))
      {
        Class result = sub_1000B305C(*(_DWORD *)(result + 12), *(UInt8 **)(result + 28), v3);
        *(_DWORD *)(a2 + 32) = result;
        return result;
      }
    }

    int v4 = -300;
  }

  else
  {
    int v4 = -304;
  }

  *(_DWORD *)(a2 + 32) = v4;
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  return result;
}

uint64_t sub_1001482B4(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) != 0 && *(_DWORD *)(result + 24) == 1 && *(_DWORD *)(result + 4) == 56)
  {
    if (*(_BYTE *)(result + 39) == 1)
    {
      unsigned int v3 = *(_DWORD *)(result + 40);
      if (v3 == *(_DWORD *)(result + 52))
      {
        Class result = sub_1000B3248(*(_DWORD *)(result + 12), *(UInt8 **)(result + 28), v3);
        *(_DWORD *)(a2 + 32) = result;
        return result;
      }
    }

    int v4 = -300;
  }

  else
  {
    int v4 = -304;
  }

  *(_DWORD *)(a2 + 32) = v4;
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  return result;
}

_DWORD *sub_100148344(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0 || result[1] != 36)
  {
    *(_DWORD *)(a2 + 32) = -304;
    *(NDR_record_t *)(a2 + 24) = NDR_record;
  }

  else
  {
    Class result = (_DWORD *)sub_1000B3340(result[3], result[8]);
    *(_DWORD *)(a2 + 32) = (_DWORD)result;
  }

  return result;
}

uint64_t sub_1001483A4(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) != 0 && *(_DWORD *)(result + 24) == 1 && *(_DWORD *)(result + 4) == 56)
  {
    if (*(_BYTE *)(result + 39) == 1)
    {
      unsigned int v3 = *(_DWORD *)(result + 40);
      if (v3 == *(_DWORD *)(result + 52))
      {
        Class result = sub_1000B3464(*(_DWORD *)(result + 12), *(UInt8 **)(result + 28), v3);
        *(_DWORD *)(a2 + 32) = result;
        return result;
      }
    }

    int v4 = -300;
  }

  else
  {
    int v4 = -304;
  }

  *(_DWORD *)(a2 + 32) = v4;
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  return result;
}

uint64_t sub_100148434(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) == 0 || *(_DWORD *)(result + 24) != 1 || *(_DWORD *)(result + 4) != 56)
  {
    int v3 = -304;
LABEL_9:
    *(_DWORD *)(a2 + 32) = v3;
    goto LABEL_10;
  }

  if (*(_BYTE *)(result + 39) != 1 || *(_DWORD *)(result + 40) != *(_DWORD *)(result + 52))
  {
    int v3 = -300;
    goto LABEL_9;
  }

  *(_DWORD *)(a2 + 36) = 16777473;
  Class result = sub_1000B355C( *(_DWORD *)(result + 12),  *(UInt8 **)(result + 28),  *(_DWORD *)(result + 40),  (vm_offset_t *)(a2 + 28),  (mach_msg_type_number_t *)(a2 + 52));
  if ((_DWORD)result)
  {
    *(_DWORD *)(a2 + 32) = result;
LABEL_10:
    *(NDR_record_t *)(a2 + 24) = NDR_record;
    return result;
  }

  *(_DWORD *)(a2 + 40) = *(_DWORD *)(a2 + 52);
  *(NDR_record_t *)(a2 + 44) = NDR_record;
  *(_DWORD *)a2 |= 0x80000000;
  *(_DWORD *)(a2 + 4) = 56;
  *(_DWORD *)(a2 + 24) = 1;
  return result;
}

_DWORD *sub_100148514(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0 || result[1] != 24)
  {
    *(_DWORD *)(a2 + 32) = -304;
    goto LABEL_6;
  }

  *(_DWORD *)(a2 + 36) = 16777473;
  Class result = (_DWORD *)sub_1000B3740(result[3], (vm_offset_t *)(a2 + 28), (mach_msg_type_number_t *)(a2 + 52));
  if ((_DWORD)result)
  {
    *(_DWORD *)(a2 + 32) = (_DWORD)result;
LABEL_6:
    *(NDR_record_t *)(a2 + 24) = NDR_record;
    return result;
  }

  *(_DWORD *)(a2 + 40) = *(_DWORD *)(a2 + 52);
  *(NDR_record_t *)(a2 + 44) = NDR_record;
  *(_DWORD *)a2 |= 0x80000000;
  *(_DWORD *)(a2 + 4) = 56;
  *(_DWORD *)(a2 + 24) = 1;
  return result;
}

_DWORD *sub_1001485B8(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0 || result[1] != 24)
  {
    *(_DWORD *)(a2 + 32) = -304;
    goto LABEL_6;
  }

  *(_DWORD *)(a2 + 36) = 16777473;
  Class result = (_DWORD *)sub_1000B3844(result[3], (vm_offset_t *)(a2 + 28), (mach_msg_type_number_t *)(a2 + 52));
  if ((_DWORD)result)
  {
    *(_DWORD *)(a2 + 32) = (_DWORD)result;
LABEL_6:
    *(NDR_record_t *)(a2 + 24) = NDR_record;
    return result;
  }

  *(_DWORD *)(a2 + 40) = *(_DWORD *)(a2 + 52);
  *(NDR_record_t *)(a2 + 44) = NDR_record;
  *(_DWORD *)a2 |= 0x80000000;
  *(_DWORD *)(a2 + 4) = 56;
  *(_DWORD *)(a2 + 24) = 1;
  return result;
}

uint64_t sub_10014865C(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) == 0 || *(_DWORD *)(result + 24) != 1 || *(_DWORD *)(result + 4) != 56)
  {
    int v5 = -304;
LABEL_9:
    *(_DWORD *)(a2 + 32) = v5;
    NDR_record_t v4 = NDR_record;
    goto LABEL_10;
  }

  if (*(_BYTE *)(result + 39) != 1 || (unsigned int v3 = *(_DWORD *)(result + 40), v3 != *(_DWORD *)(result + 52)))
  {
    int v5 = -300;
    goto LABEL_9;
  }

  Class result = sub_1000B0A74(*(_DWORD *)(result + 12), *(UInt8 **)(result + 28), v3, (_DWORD *)(a2 + 36));
  *(_DWORD *)(a2 + 32) = result;
  NDR_record_t v4 = NDR_record;
  if (!(_DWORD)result)
  {
    *(NDR_record_t *)(a2 + 24) = NDR_record;
    *(_DWORD *)(a2 + 4) = 40;
    return result;
  }

uint64_t sub_10014870C(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) == 0 || *(_DWORD *)(result + 24) != 3 || *(_DWORD *)(result + 4) != 96)
  {
    int v7 = -304;
LABEL_13:
    *(_DWORD *)(a2 + 32) = v7;
    NDR_record_t v6 = NDR_record;
    goto LABEL_14;
  }

  if (*(_BYTE *)(result + 39) != 1
    || *(_BYTE *)(result + 55) != 1
    || *(_BYTE *)(result + 71) != 1
    || (unsigned int v3 = *(_DWORD *)(result + 40), v3 != *(_DWORD *)(result + 84))
    || (unsigned int v4 = *(_DWORD *)(result + 56), v4 != *(_DWORD *)(result + 88))
    || (unsigned int v5 = *(_DWORD *)(result + 72), v5 != *(_DWORD *)(result + 92)))
  {
    int v7 = -300;
    goto LABEL_13;
  }

  Class result = sub_1000B7088( *(_DWORD *)(result + 12),  *(UInt8 **)(result + 28),  v3,  *(UInt8 **)(result + 44),  v4,  *(UInt8 **)(result + 60),  v5,  (_DWORD *)(a2 + 36));
  *(_DWORD *)(a2 + 32) = result;
  NDR_record_t v6 = NDR_record;
  if (!(_DWORD)result)
  {
    *(NDR_record_t *)(a2 + 24) = NDR_record;
    *(_DWORD *)(a2 + 4) = 40;
    return result;
  }

uint64_t sub_1001487FC(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) == 0 || *(_DWORD *)(result + 24) != 2 || *(_DWORD *)(result + 4) != 80)
  {
    int v6 = -304;
LABEL_11:
    *(_DWORD *)(a2 + 32) = v6;
    NDR_record_t v5 = NDR_record;
    goto LABEL_12;
  }

  if (*(_BYTE *)(result + 39) != 1
    || *(_BYTE *)(result + 55) != 1
    || (unsigned int v3 = *(_DWORD *)(result + 40), v3 != *(_DWORD *)(result + 68))
    || (unsigned int v4 = *(_DWORD *)(result + 56), v4 != *(_DWORD *)(result + 76)))
  {
    int v6 = -300;
    goto LABEL_11;
  }

  Class result = sub_1000B74B4( *(_DWORD *)(result + 12),  *(UInt8 **)(result + 28),  v3,  *(unsigned int *)(result + 72),  *(UInt8 **)(result + 44),  v4,  (unsigned int *)(a2 + 36));
  *(_DWORD *)(a2 + 32) = result;
  NDR_record_t v5 = NDR_record;
  if (!(_DWORD)result)
  {
    *(NDR_record_t *)(a2 + 24) = NDR_record;
    *(_DWORD *)(a2 + 4) = 40;
    return result;
  }

uint64_t sub_1001488D0(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) == 0 || *(_DWORD *)(result + 24) != 2 || *(_DWORD *)(result + 4) != 80)
  {
    int v6 = -304;
LABEL_11:
    *(_DWORD *)(a2 + 32) = v6;
    NDR_record_t v5 = NDR_record;
    goto LABEL_12;
  }

  if (*(_BYTE *)(result + 39) != 1
    || *(_BYTE *)(result + 55) != 1
    || (unsigned int v3 = *(_DWORD *)(result + 40), v3 != *(_DWORD *)(result + 68))
    || (unsigned int v4 = *(_DWORD *)(result + 56), v4 != *(_DWORD *)(result + 76)))
  {
    int v6 = -300;
    goto LABEL_11;
  }

  Class result = sub_1000B76F0( *(_DWORD *)(result + 12),  *(UInt8 **)(result + 28),  v3,  *(_DWORD *)(result + 72),  *(UInt8 **)(result + 44),  v4,  (unsigned int *)(a2 + 36));
  *(_DWORD *)(a2 + 32) = result;
  NDR_record_t v5 = NDR_record;
  if (!(_DWORD)result)
  {
    *(NDR_record_t *)(a2 + 24) = NDR_record;
    *(_DWORD *)(a2 + 4) = 40;
    return result;
  }

uint64_t sub_1001489A4(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) == 0 || *(_DWORD *)(result + 24) != 2 || *(_DWORD *)(result + 4) != 80)
  {
    int v6 = -304;
LABEL_11:
    *(_DWORD *)(a2 + 32) = v6;
    NDR_record_t v5 = NDR_record;
    goto LABEL_12;
  }

  if (*(_BYTE *)(result + 39) != 1
    || *(_BYTE *)(result + 55) != 1
    || (unsigned int v3 = *(_DWORD *)(result + 40), v3 != *(_DWORD *)(result + 68))
    || (unsigned int v4 = *(_DWORD *)(result + 56), v4 != *(_DWORD *)(result + 72)))
  {
    int v6 = -300;
    goto LABEL_11;
  }

  Class result = sub_1000B78D0( *(_DWORD *)(result + 12),  *(UInt8 **)(result + 28),  v3,  *(UInt8 **)(result + 44),  v4,  *(unsigned int *)(result + 76),  (_DWORD *)(a2 + 36));
  *(_DWORD *)(a2 + 32) = result;
  NDR_record_t v5 = NDR_record;
  if (!(_DWORD)result)
  {
    *(NDR_record_t *)(a2 + 24) = NDR_record;
    *(_DWORD *)(a2 + 4) = 40;
    return result;
  }

uint64_t sub_100148A78(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) == 0 || *(_DWORD *)(result + 24) != 2 || *(_DWORD *)(result + 4) != 76)
  {
    int v3 = -304;
LABEL_11:
    *(_DWORD *)(a2 + 32) = v3;
    goto LABEL_12;
  }

  if (*(_BYTE *)(result + 39) != 1
    || *(_BYTE *)(result + 55) != 1
    || *(_DWORD *)(result + 40) != *(_DWORD *)(result + 68)
    || *(_DWORD *)(result + 56) != *(_DWORD *)(result + 72))
  {
    int v3 = -300;
    goto LABEL_11;
  }

  *(_DWORD *)(a2 + 36) = 16777473;
  Class result = sub_1000B7DF0( *(_DWORD *)(result + 12),  *(UInt8 **)(result + 28),  *(_DWORD *)(result + 40),  *(UInt8 **)(result + 44),  *(_DWORD *)(result + 56),  (vm_offset_t *)(a2 + 28),  (mach_msg_type_number_t *)(a2 + 52),  (_DWORD *)(a2 + 56));
  if ((_DWORD)result)
  {
    *(_DWORD *)(a2 + 32) = result;
LABEL_12:
    *(NDR_record_t *)(a2 + 24) = NDR_record;
    return result;
  }

  *(_DWORD *)(a2 + 40) = *(_DWORD *)(a2 + 52);
  *(NDR_record_t *)(a2 + 44) = NDR_record;
  *(_DWORD *)a2 |= 0x80000000;
  *(_DWORD *)(a2 + 4) = 60;
  *(_DWORD *)(a2 + 24) = 1;
  return result;
}

uint64_t sub_100148B80(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) == 0 || *(_DWORD *)(result + 24) != 1 || *(_DWORD *)(result + 4) != 56)
  {
    int v3 = -304;
LABEL_9:
    *(_DWORD *)(a2 + 32) = v3;
    goto LABEL_10;
  }

  if (*(_BYTE *)(result + 39) != 1 || *(_DWORD *)(result + 40) != *(_DWORD *)(result + 52))
  {
    int v3 = -300;
    goto LABEL_9;
  }

  *(_DWORD *)(a2 + 36) = 16777473;
  Class result = sub_1000B8010( *(_DWORD *)(result + 12),  *(UInt8 **)(result + 28),  *(_DWORD *)(result + 40),  (vm_offset_t *)(a2 + 28),  (mach_msg_type_number_t *)(a2 + 52));
  if ((_DWORD)result)
  {
    *(_DWORD *)(a2 + 32) = result;
LABEL_10:
    *(NDR_record_t *)(a2 + 24) = NDR_record;
    return result;
  }

  *(_DWORD *)(a2 + 40) = *(_DWORD *)(a2 + 52);
  *(NDR_record_t *)(a2 + 44) = NDR_record;
  *(_DWORD *)a2 |= 0x80000000;
  *(_DWORD *)(a2 + 4) = 56;
  *(_DWORD *)(a2 + 24) = 1;
  return result;
}

uint64_t sub_100148C60(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) == 0 || *(_DWORD *)(result + 24) != 2 || *(_DWORD *)(result + 4) != 76)
  {
    int v6 = -304;
LABEL_11:
    *(_DWORD *)(a2 + 32) = v6;
    NDR_record_t v5 = NDR_record;
    goto LABEL_12;
  }

  if (*(_BYTE *)(result + 39) != 1
    || *(_BYTE *)(result + 55) != 1
    || (unsigned int v3 = *(_DWORD *)(result + 40), v3 != *(_DWORD *)(result + 68))
    || (unsigned int v4 = *(_DWORD *)(result + 56), v4 != *(_DWORD *)(result + 72)))
  {
    int v6 = -300;
    goto LABEL_11;
  }

  Class result = sub_1000B8140( *(_DWORD *)(result + 12),  *(UInt8 **)(result + 28),  v3,  *(UInt8 **)(result + 44),  v4,  (_DWORD *)(a2 + 36));
  *(_DWORD *)(a2 + 32) = result;
  NDR_record_t v5 = NDR_record;
  if (!(_DWORD)result)
  {
    *(NDR_record_t *)(a2 + 24) = NDR_record;
    *(_DWORD *)(a2 + 4) = 40;
    return result;
  }

uint64_t sub_100148D30(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) == 0 || *(_DWORD *)(result + 24) != 1 || *(_DWORD *)(result + 4) != 60)
  {
    int v3 = -304;
LABEL_9:
    *(_DWORD *)(a2 + 32) = v3;
    goto LABEL_10;
  }

  if (*(_BYTE *)(result + 39) != 1 || *(_DWORD *)(result + 40) != *(_DWORD *)(result + 52))
  {
    int v3 = -300;
    goto LABEL_9;
  }

  *(_DWORD *)(a2 + 36) = 16777473;
  Class result = sub_1000B6840( *(_DWORD *)(result + 12),  *(UInt8 **)(result + 28),  *(_DWORD *)(result + 40),  *(unsigned int *)(result + 56),  (vm_offset_t *)(a2 + 28),  (mach_msg_type_number_t *)(a2 + 52),  (int *)(a2 + 56));
  if ((_DWORD)result)
  {
    *(_DWORD *)(a2 + 32) = result;
LABEL_10:
    *(NDR_record_t *)(a2 + 24) = NDR_record;
    return result;
  }

  *(_DWORD *)(a2 + 40) = *(_DWORD *)(a2 + 52);
  *(NDR_record_t *)(a2 + 44) = NDR_record;
  *(_DWORD *)a2 |= 0x80000000;
  *(_DWORD *)(a2 + 4) = 60;
  *(_DWORD *)(a2 + 24) = 1;
  return result;
}

uint64_t sub_100148E18(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) != 0 && *(_DWORD *)(result + 24) == 1 && *(_DWORD *)(result + 4) == 56)
  {
    if (*(_BYTE *)(result + 39) == 1)
    {
      unsigned int v3 = *(_DWORD *)(result + 40);
      if (v3 == *(_DWORD *)(result + 52))
      {
        Class result = sub_1000B82C8(*(_DWORD *)(result + 12), *(UInt8 **)(result + 28), v3);
        *(_DWORD *)(a2 + 32) = result;
        return result;
      }
    }

    int v4 = -300;
  }

  else
  {
    int v4 = -304;
  }

  *(_DWORD *)(a2 + 32) = v4;
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  return result;
}

uint64_t sub_100148EA8(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) != 0 && *(_DWORD *)(result + 24) == 1 && *(_DWORD *)(result + 4) == 60)
  {
    if (*(_BYTE *)(result + 39) == 1)
    {
      CFIndex v3 = *(unsigned int *)(result + 40);
      if ((_DWORD)v3 == *(_DWORD *)(result + 52))
      {
        Class result = sub_1000B83C0(*(_DWORD *)(result + 12), *(UInt8 **)(result + 28), v3);
        *(_DWORD *)(a2 + 32) = result;
        return result;
      }
    }

    int v4 = -300;
  }

  else
  {
    int v4 = -304;
  }

  *(_DWORD *)(a2 + 32) = v4;
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  return result;
}

uint64_t sub_100148F3C(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) != 0 && *(_DWORD *)(result + 24) == 1 && *(_DWORD *)(result + 4) == 60)
  {
    if (*(_BYTE *)(result + 39) == 1)
    {
      CFIndex v3 = *(unsigned int *)(result + 40);
      if ((_DWORD)v3 == *(_DWORD *)(result + 52))
      {
        Class result = sub_1000B852C(*(_DWORD *)(result + 12), *(UInt8 **)(result + 28), v3);
        *(_DWORD *)(a2 + 32) = result;
        return result;
      }
    }

    int v4 = -300;
  }

  else
  {
    int v4 = -304;
  }

  *(_DWORD *)(a2 + 32) = v4;
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  return result;
}

_DWORD *sub_100148FD0(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0 || result[1] != 24)
  {
    *(_DWORD *)(a2 + 32) = -304;
    goto LABEL_6;
  }

  *(_DWORD *)(a2 + 36) = 16777473;
  Class result = (_DWORD *)sub_1000B8624(result[3], (vm_offset_t *)(a2 + 28), (mach_msg_type_number_t *)(a2 + 52));
  if ((_DWORD)result)
  {
    *(_DWORD *)(a2 + 32) = (_DWORD)result;
LABEL_6:
    *(NDR_record_t *)(a2 + 24) = NDR_record;
    return result;
  }

  *(_DWORD *)(a2 + 40) = *(_DWORD *)(a2 + 52);
  *(NDR_record_t *)(a2 + 44) = NDR_record;
  *(_DWORD *)a2 |= 0x80000000;
  *(_DWORD *)(a2 + 4) = 56;
  *(_DWORD *)(a2 + 24) = 1;
  return result;
}

_DWORD *sub_100149074(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0 || result[1] != 24)
  {
    *(_DWORD *)(a2 + 32) = -304;
    NDR_record_t v3 = NDR_record;
  }

  else
  {
    Class result = (_DWORD *)sub_1000B8720(result[3], (_DWORD *)(a2 + 36));
    *(_DWORD *)(a2 + 32) = (_DWORD)result;
    NDR_record_t v3 = NDR_record;
    if (!(_DWORD)result)
    {
      *(NDR_record_t *)(a2 + 24) = NDR_record;
      *(_DWORD *)(a2 + 4) = 40;
      return result;
    }
  }

  *(NDR_record_t *)(a2 + 24) = v3;
  return result;
}

uint64_t sub_1001490EC(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) != 0 && *(_DWORD *)(result + 24) == 1 && *(_DWORD *)(result + 4) == 60)
  {
    if (*(_BYTE *)(result + 39) == 1)
    {
      unsigned int v3 = *(_DWORD *)(result + 40);
      if (v3 == *(_DWORD *)(result + 56))
      {
        Class result = sub_1000B87E0(*(_DWORD *)(result + 12), *(_DWORD *)(result + 52), *(UInt8 **)(result + 28), v3);
        *(_DWORD *)(a2 + 32) = result;
        return result;
      }
    }

    int v4 = -300;
  }

  else
  {
    int v4 = -304;
  }

  *(_DWORD *)(a2 + 32) = v4;
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  return result;
}

_DWORD *sub_100149180(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0 || result[1] != 36)
  {
    *(_DWORD *)(a2 + 32) = -304;
    *(NDR_record_t *)(a2 + 24) = NDR_record;
  }

  else
  {
    Class result = (_DWORD *)sub_1000B7C70(result[3], result[8]);
    *(_DWORD *)(a2 + 32) = (_DWORD)result;
  }

  return result;
}

_DWORD *sub_1001491E0(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0 || result[1] != 24)
  {
    *(_DWORD *)(a2 + 32) = -304;
    NDR_record_t v3 = NDR_record;
  }

  else
  {
    Class result = (_DWORD *)sub_1000B7D2C(result[3], (_DWORD *)(a2 + 36));
    *(_DWORD *)(a2 + 32) = (_DWORD)result;
    NDR_record_t v3 = NDR_record;
    if (!(_DWORD)result)
    {
      *(NDR_record_t *)(a2 + 24) = NDR_record;
      *(_DWORD *)(a2 + 4) = 40;
      return result;
    }
  }

  *(NDR_record_t *)(a2 + 24) = v3;
  return result;
}

uint64_t sub_100149258(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) == 0 || *(_DWORD *)(result + 24) != 2 || *(_DWORD *)(result + 4) != 76)
  {
    int v3 = -304;
LABEL_11:
    *(_DWORD *)(a2 + 32) = v3;
    goto LABEL_12;
  }

  if (*(_BYTE *)(result + 39) != 1
    || *(_BYTE *)(result + 55) != 1
    || *(_DWORD *)(result + 40) != *(_DWORD *)(result + 68)
    || *(_DWORD *)(result + 56) != *(_DWORD *)(result + 72))
  {
    int v3 = -300;
    goto LABEL_11;
  }

  *(_DWORD *)(a2 + 36) = 16777473;
  Class result = sub_1000B8990( *(_DWORD *)(result + 12),  *(UInt8 **)(result + 28),  *(_DWORD *)(result + 40),  *(UInt8 **)(result + 44),  *(_DWORD *)(result + 56),  (vm_offset_t *)(a2 + 28),  (mach_msg_type_number_t *)(a2 + 52),  (_DWORD *)(a2 + 56));
  if ((_DWORD)result)
  {
    *(_DWORD *)(a2 + 32) = result;
LABEL_12:
    *(NDR_record_t *)(a2 + 24) = NDR_record;
    return result;
  }

  *(_DWORD *)(a2 + 40) = *(_DWORD *)(a2 + 52);
  *(NDR_record_t *)(a2 + 44) = NDR_record;
  *(_DWORD *)a2 |= 0x80000000;
  *(_DWORD *)(a2 + 4) = 60;
  *(_DWORD *)(a2 + 24) = 1;
  return result;
}

_DWORD *sub_100149360(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0 || result[1] != 24)
  {
    *(_DWORD *)(a2 + 32) = -304;
    goto LABEL_6;
  }

  *(_DWORD *)(a2 + 36) = 16777473;
  Class result = (_DWORD *)sub_1000B8BC8(result[3], (vm_offset_t *)(a2 + 28), (mach_msg_type_number_t *)(a2 + 52));
  if ((_DWORD)result)
  {
    *(_DWORD *)(a2 + 32) = (_DWORD)result;
LABEL_6:
    *(NDR_record_t *)(a2 + 24) = NDR_record;
    return result;
  }

  *(_DWORD *)(a2 + 40) = *(_DWORD *)(a2 + 52);
  *(NDR_record_t *)(a2 + 44) = NDR_record;
  *(_DWORD *)a2 |= 0x80000000;
  *(_DWORD *)(a2 + 4) = 56;
  *(_DWORD *)(a2 + 24) = 1;
  return result;
}

uint64_t sub_100149404(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) == 0 || *(_DWORD *)(result + 24) != 1 || *(_DWORD *)(result + 4) != 56)
  {
    int v3 = -304;
LABEL_9:
    *(_DWORD *)(a2 + 32) = v3;
    goto LABEL_10;
  }

  if (*(_BYTE *)(result + 39) != 1 || *(_DWORD *)(result + 40) != *(_DWORD *)(result + 52))
  {
    int v3 = -300;
    goto LABEL_9;
  }

  *(_DWORD *)(a2 + 36) = 16777473;
  Class result = sub_1000B8CFC( *(_DWORD *)(result + 12),  *(UInt8 **)(result + 28),  *(unsigned int *)(result + 40),  (vm_offset_t *)(a2 + 28),  (mach_msg_type_number_t *)(a2 + 52));
  if ((_DWORD)result)
  {
    *(_DWORD *)(a2 + 32) = result;
LABEL_10:
    *(NDR_record_t *)(a2 + 24) = NDR_record;
    return result;
  }

  *(_DWORD *)(a2 + 40) = *(_DWORD *)(a2 + 52);
  *(NDR_record_t *)(a2 + 44) = NDR_record;
  *(_DWORD *)a2 |= 0x80000000;
  *(_DWORD *)(a2 + 4) = 56;
  *(_DWORD *)(a2 + 24) = 1;
  return result;
}

uint64_t sub_1001494E4(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) != 0 && *(_DWORD *)(result + 24) == 1 && *(_DWORD *)(result + 4) == 72)
  {
    if (*(_BYTE *)(result + 39) == 1)
    {
      CFIndex v3 = *(unsigned int *)(result + 40);
      if ((_DWORD)v3 == *(_DWORD *)(result + 52))
      {
        Class result = sub_1000B8E88( *(_DWORD *)(result + 12),  *(UInt8 **)(result + 28),  v3,  *(double *)(result + 56),  *(double *)(result + 64));
        *(_DWORD *)(a2 + 32) = result;
        return result;
      }
    }

    int v4 = -300;
  }

  else
  {
    int v4 = -304;
  }

  *(_DWORD *)(a2 + 32) = v4;
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  return result;
}

uint64_t sub_100149578(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) != 0 || *(_DWORD *)(result + 4) != 52)
  {
    *(_DWORD *)(a2 + 32) = -304;
    goto LABEL_6;
  }

  *(_DWORD *)(a2 + 36) = 16777473;
  Class result = sub_1000B90A8( *(_DWORD *)(result + 12),  *(_DWORD *)(result + 48),  (vm_offset_t *)(a2 + 28),  (mach_msg_type_number_t *)(a2 + 52),  *(double *)(result + 32),  *(double *)(result + 40));
  if ((_DWORD)result)
  {
    *(_DWORD *)(a2 + 32) = result;
LABEL_6:
    *(NDR_record_t *)(a2 + 24) = NDR_record;
    return result;
  }

  *(_DWORD *)(a2 + 40) = *(_DWORD *)(a2 + 52);
  *(NDR_record_t *)(a2 + 44) = NDR_record;
  *(_DWORD *)a2 |= 0x80000000;
  *(_DWORD *)(a2 + 4) = 56;
  *(_DWORD *)(a2 + 24) = 1;
  return result;
}

uint64_t sub_100149628(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) == 0 || *(_DWORD *)(result + 24) != 1 || *(_DWORD *)(result + 4) != 56)
  {
    int v3 = -304;
LABEL_9:
    *(_DWORD *)(a2 + 32) = v3;
    goto LABEL_10;
  }

  if (*(_BYTE *)(result + 39) != 1 || *(_DWORD *)(result + 40) != *(_DWORD *)(result + 52))
  {
    int v3 = -300;
    goto LABEL_9;
  }

  *(_DWORD *)(a2 + 36) = 16777473;
  Class result = sub_1000B92DC( *(_DWORD *)(result + 12),  *(UInt8 **)(result + 28),  *(unsigned int *)(result + 40),  (vm_offset_t *)(a2 + 28),  (mach_msg_type_number_t *)(a2 + 52));
  if ((_DWORD)result)
  {
    *(_DWORD *)(a2 + 32) = result;
LABEL_10:
    *(NDR_record_t *)(a2 + 24) = NDR_record;
    return result;
  }

  *(_DWORD *)(a2 + 40) = *(_DWORD *)(a2 + 52);
  *(NDR_record_t *)(a2 + 44) = NDR_record;
  *(_DWORD *)a2 |= 0x80000000;
  *(_DWORD *)(a2 + 4) = 56;
  *(_DWORD *)(a2 + 24) = 1;
  return result;
}

uint64_t sub_100149708(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) == 0 || *(_DWORD *)(result + 24) != 2 || *(_DWORD *)(result + 4) != 76)
  {
    int v6 = -304;
LABEL_11:
    *(_DWORD *)(a2 + 32) = v6;
    NDR_record_t v5 = NDR_record;
    goto LABEL_12;
  }

  if (*(_BYTE *)(result + 39) != 1
    || *(_BYTE *)(result + 55) != 1
    || (unsigned int v3 = *(_DWORD *)(result + 40), v3 != *(_DWORD *)(result + 68))
    || (unsigned int v4 = *(_DWORD *)(result + 56), v4 != *(_DWORD *)(result + 72)))
  {
    int v6 = -300;
    goto LABEL_11;
  }

  Class result = sub_1000B9468( *(_DWORD *)(result + 12),  *(UInt8 **)(result + 28),  v3,  *(UInt8 **)(result + 44),  v4,  (_DWORD *)(a2 + 36));
  *(_DWORD *)(a2 + 32) = result;
  NDR_record_t v5 = NDR_record;
  if (!(_DWORD)result)
  {
    *(NDR_record_t *)(a2 + 24) = NDR_record;
    *(_DWORD *)(a2 + 4) = 40;
    return result;
  }

_DWORD *sub_1001497D8(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0 || result[1] != 24)
  {
    *(_DWORD *)(a2 + 32) = -304;
    goto LABEL_6;
  }

  *(_DWORD *)(a2 + 36) = 16777473;
  Class result = (_DWORD *)sub_1000B96D8(result[3], (vm_offset_t *)(a2 + 28), (mach_msg_type_number_t *)(a2 + 52));
  if ((_DWORD)result)
  {
    *(_DWORD *)(a2 + 32) = (_DWORD)result;
LABEL_6:
    *(NDR_record_t *)(a2 + 24) = NDR_record;
    return result;
  }

  *(_DWORD *)(a2 + 40) = *(_DWORD *)(a2 + 52);
  *(NDR_record_t *)(a2 + 44) = NDR_record;
  *(_DWORD *)a2 |= 0x80000000;
  *(_DWORD *)(a2 + 4) = 56;
  *(_DWORD *)(a2 + 24) = 1;
  return result;
}

_DWORD *sub_10014987C(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0 || result[1] != 24)
  {
    *(_DWORD *)(a2 + 32) = -304;
    goto LABEL_6;
  }

  *(_DWORD *)(a2 + 36) = 16777473;
  Class result = (_DWORD *)sub_1000B97B8(result[3], (vm_offset_t *)(a2 + 28), (mach_msg_type_number_t *)(a2 + 52));
  if ((_DWORD)result)
  {
    *(_DWORD *)(a2 + 32) = (_DWORD)result;
LABEL_6:
    *(NDR_record_t *)(a2 + 24) = NDR_record;
    return result;
  }

  *(_DWORD *)(a2 + 40) = *(_DWORD *)(a2 + 52);
  *(NDR_record_t *)(a2 + 44) = NDR_record;
  *(_DWORD *)a2 |= 0x80000000;
  *(_DWORD *)(a2 + 4) = 56;
  *(_DWORD *)(a2 + 24) = 1;
  return result;
}

_DWORD *sub_100149920(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0 || result[1] != 36)
  {
    *(_DWORD *)(a2 + 32) = -304;
    *(NDR_record_t *)(a2 + 24) = NDR_record;
  }

  else
  {
    Class result = (_DWORD *)sub_1000B98B4(result[3], result[8]);
    *(_DWORD *)(a2 + 32) = (_DWORD)result;
  }

  return result;
}

_DWORD *sub_100149980(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0 || result[1] != 24)
  {
    *(_DWORD *)(a2 + 32) = -304;
    NDR_record_t v3 = NDR_record;
  }

  else
  {
    Class result = (_DWORD *)sub_1000B99D0(result[3], (_DWORD *)(a2 + 36));
    *(_DWORD *)(a2 + 32) = (_DWORD)result;
    NDR_record_t v3 = NDR_record;
    if (!(_DWORD)result)
    {
      *(NDR_record_t *)(a2 + 24) = NDR_record;
      *(_DWORD *)(a2 + 4) = 40;
      return result;
    }
  }

  *(NDR_record_t *)(a2 + 24) = v3;
  return result;
}

_DWORD *sub_1001499F8(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0 || result[1] != 24)
  {
    *(_DWORD *)(a2 + 32) = -304;
    *(NDR_record_t *)(a2 + 24) = NDR_record;
  }

  else
  {
    Class result = (_DWORD *)sub_1000B9ADC(result[3]);
    *(_DWORD *)(a2 + 32) = (_DWORD)result;
  }

  return result;
}

_DWORD *sub_100149A50(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0 || result[1] != 24)
  {
    *(_DWORD *)(a2 + 32) = -304;
    *(NDR_record_t *)(a2 + 24) = NDR_record;
  }

  else
  {
    Class result = (_DWORD *)sub_1000B9BD8(result[3]);
    *(_DWORD *)(a2 + 32) = (_DWORD)result;
  }

  return result;
}

uint64_t sub_100149AA8(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) != 0 || *(_DWORD *)(result + 4) != 40)
  {
    *(_DWORD *)(a2 + 32) = -304;
    *(NDR_record_t *)(a2 + 24) = NDR_record;
  }

  else
  {
    Class result = sub_1000B9CD4(*(_DWORD *)(result + 12), *(double *)(result + 32));
    *(_DWORD *)(a2 + 32) = result;
  }

  return result;
}

uint64_t sub_100149B08(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) != 0 || *(_DWORD *)(result + 4) != 44)
  {
    *(_DWORD *)(a2 + 32) = -304;
    *(NDR_record_t *)(a2 + 24) = NDR_record;
  }

  else
  {
    Class result = sub_1000B9DE4(*(_DWORD *)(result + 12), *(unsigned int *)(result + 40), *(double *)(result + 32));
    *(_DWORD *)(a2 + 32) = result;
  }

  return result;
}

_DWORD *sub_100149B6C(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0 || result[1] != 24)
  {
    *(_DWORD *)(a2 + 32) = -304;
    *(NDR_record_t *)(a2 + 24) = NDR_record;
  }

  else
  {
    Class result = (_DWORD *)sub_1000B9F08(result[3]);
    *(_DWORD *)(a2 + 32) = (_DWORD)result;
  }

  return result;
}

uint64_t sub_100149BC4(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) == 0 || *(_DWORD *)(result + 24) != 2 || *(_DWORD *)(result + 4) != 76)
  {
    int v3 = -304;
LABEL_11:
    *(_DWORD *)(a2 + 32) = v3;
    goto LABEL_12;
  }

  if (*(_BYTE *)(result + 39) != 1
    || *(_BYTE *)(result + 55) != 1
    || *(_DWORD *)(result + 40) != *(_DWORD *)(result + 68)
    || *(_DWORD *)(result + 56) != *(_DWORD *)(result + 72))
  {
    int v3 = -300;
    goto LABEL_11;
  }

  *(_DWORD *)(a2 + 36) = 16777473;
  Class result = sub_1000BA004( *(_DWORD *)(result + 12),  *(UInt8 **)(result + 28),  *(_DWORD *)(result + 40),  *(UInt8 **)(result + 44),  *(_DWORD *)(result + 56),  (vm_offset_t *)(a2 + 28),  (mach_msg_type_number_t *)(a2 + 52));
  if ((_DWORD)result)
  {
    *(_DWORD *)(a2 + 32) = result;
LABEL_12:
    *(NDR_record_t *)(a2 + 24) = NDR_record;
    return result;
  }

  *(_DWORD *)(a2 + 40) = *(_DWORD *)(a2 + 52);
  *(NDR_record_t *)(a2 + 44) = NDR_record;
  *(_DWORD *)a2 |= 0x80000000;
  *(_DWORD *)(a2 + 4) = 56;
  *(_DWORD *)(a2 + 24) = 1;
  return result;
}

uint64_t sub_100149CC8(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) != 0 && *(_DWORD *)(result + 24) == 2 && *(_DWORD *)(result + 4) == 80)
  {
    if (*(_BYTE *)(result + 39) == 1 && *(_BYTE *)(result + 55) == 1)
    {
      CFIndex v3 = *(unsigned int *)(result + 40);
      if ((_DWORD)v3 == *(_DWORD *)(result + 68))
      {
        unsigned int v4 = *(_DWORD *)(result + 56);
        if (v4 == *(_DWORD *)(result + 76))
        {
          Class result = sub_1000BA330( *(_DWORD *)(result + 12),  *(UInt8 **)(result + 28),  v3,  *(unsigned int *)(result + 72),  *(UInt8 **)(result + 44),  v4);
          *(_DWORD *)(a2 + 32) = result;
          return result;
        }
      }
    }

    int v5 = -300;
  }

  else
  {
    int v5 = -304;
  }

  *(_DWORD *)(a2 + 32) = v5;
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  return result;
}

uint64_t sub_100149D7C(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) == 0 || *(_DWORD *)(result + 24) != 1 || *(_DWORD *)(result + 4) != 56)
  {
    int v5 = -304;
LABEL_9:
    *(_DWORD *)(a2 + 32) = v5;
    NDR_record_t v4 = NDR_record;
    goto LABEL_10;
  }

  if (*(_BYTE *)(result + 39) != 1 || (unsigned int v3 = *(_DWORD *)(result + 40), v3 != *(_DWORD *)(result + 52)))
  {
    int v5 = -300;
    goto LABEL_9;
  }

  Class result = sub_1000BA46C(*(_DWORD *)(result + 12), *(UInt8 **)(result + 28), v3, (_DWORD *)(a2 + 36));
  *(_DWORD *)(a2 + 32) = result;
  NDR_record_t v4 = NDR_record;
  if (!(_DWORD)result)
  {
    *(NDR_record_t *)(a2 + 24) = NDR_record;
    *(_DWORD *)(a2 + 4) = 40;
    return result;
  }

_DWORD *sub_100149E2C(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0 || result[1] != 24)
  {
    *(_DWORD *)(a2 + 32) = -304;
    *(NDR_record_t *)(a2 + 24) = NDR_record;
  }

  else
  {
    Class result = (_DWORD *)sub_1000BA690(result[3]);
    *(_DWORD *)(a2 + 32) = (_DWORD)result;
  }

  return result;
}

_DWORD *sub_100149E84(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0 || result[1] != 24)
  {
    *(_DWORD *)(a2 + 32) = -304;
    goto LABEL_6;
  }

  *(_DWORD *)(a2 + 36) = 16777473;
  Class result = (_DWORD *)sub_1000BA78C(result[3], (vm_offset_t *)(a2 + 28), (mach_msg_type_number_t *)(a2 + 52));
  if ((_DWORD)result)
  {
    *(_DWORD *)(a2 + 32) = (_DWORD)result;
LABEL_6:
    *(NDR_record_t *)(a2 + 24) = NDR_record;
    return result;
  }

  *(_DWORD *)(a2 + 40) = *(_DWORD *)(a2 + 52);
  *(NDR_record_t *)(a2 + 44) = NDR_record;
  *(_DWORD *)a2 |= 0x80000000;
  *(_DWORD *)(a2 + 4) = 56;
  *(_DWORD *)(a2 + 24) = 1;
  return result;
}

_DWORD *sub_100149F28(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0 || result[1] != 24)
  {
    *(_DWORD *)(a2 + 32) = -304;
    NDR_record_t v3 = NDR_record;
  }

  else
  {
    Class result = (_DWORD *)sub_1000BA890(result[3], (_DWORD *)(a2 + 36));
    *(_DWORD *)(a2 + 32) = (_DWORD)result;
    NDR_record_t v3 = NDR_record;
    if (!(_DWORD)result)
    {
      *(NDR_record_t *)(a2 + 24) = NDR_record;
      *(_DWORD *)(a2 + 4) = 40;
      return result;
    }
  }

  *(NDR_record_t *)(a2 + 24) = v3;
  return result;
}

_DWORD *sub_100149FA0(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0 || result[1] != 24)
  {
    *(_DWORD *)(a2 + 32) = -304;
    NDR_record_t v3 = NDR_record;
  }

  else
  {
    Class result = (_DWORD *)sub_1000BA96C(result[3], (_DWORD *)(a2 + 36));
    *(_DWORD *)(a2 + 32) = (_DWORD)result;
    NDR_record_t v3 = NDR_record;
    if (!(_DWORD)result)
    {
      *(NDR_record_t *)(a2 + 24) = NDR_record;
      *(_DWORD *)(a2 + 4) = 40;
      return result;
    }
  }

  *(NDR_record_t *)(a2 + 24) = v3;
  return result;
}

_DWORD *sub_10014A018(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0 || result[1] != 24)
  {
    *(_DWORD *)(a2 + 32) = -304;
    NDR_record_t v3 = NDR_record;
  }

  else
  {
    Class result = (_DWORD *)sub_1000BAA54(result[3], (_DWORD *)(a2 + 36));
    *(_DWORD *)(a2 + 32) = (_DWORD)result;
    NDR_record_t v3 = NDR_record;
    if (!(_DWORD)result)
    {
      *(NDR_record_t *)(a2 + 24) = NDR_record;
      *(_DWORD *)(a2 + 4) = 40;
      return result;
    }
  }

  *(NDR_record_t *)(a2 + 24) = v3;
  return result;
}

_DWORD *sub_10014A090(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0 || result[1] != 24)
  {
    *(_DWORD *)(a2 + 32) = -304;
    NDR_record_t v3 = NDR_record;
  }

  else
  {
    Class result = (_DWORD *)sub_1000BAB30(result[3], (_DWORD *)(a2 + 36));
    *(_DWORD *)(a2 + 32) = (_DWORD)result;
    NDR_record_t v3 = NDR_record;
    if (!(_DWORD)result)
    {
      *(NDR_record_t *)(a2 + 24) = NDR_record;
      *(_DWORD *)(a2 + 4) = 40;
      return result;
    }
  }

  *(NDR_record_t *)(a2 + 24) = v3;
  return result;
}

_DWORD *sub_10014A108(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0 || result[1] != 36)
  {
    *(_DWORD *)(a2 + 32) = -304;
    *(NDR_record_t *)(a2 + 24) = NDR_record;
  }

  else
  {
    Class result = (_DWORD *)sub_1000BAC0C(result[3], result[8]);
    *(_DWORD *)(a2 + 32) = (_DWORD)result;
  }

  return result;
}

_DWORD *sub_10014A168(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0 || result[1] != 24)
  {
    *(_DWORD *)(a2 + 32) = -304;
    NDR_record_t v3 = NDR_record;
  }

  else
  {
    Class result = (_DWORD *)sub_1000BAD20(result[3], (_DWORD *)(a2 + 36));
    *(_DWORD *)(a2 + 32) = (_DWORD)result;
    NDR_record_t v3 = NDR_record;
    if (!(_DWORD)result)
    {
      *(NDR_record_t *)(a2 + 24) = NDR_record;
      *(_DWORD *)(a2 + 4) = 40;
      return result;
    }
  }

  *(NDR_record_t *)(a2 + 24) = v3;
  return result;
}

_DWORD *sub_10014A1E0(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0 || result[1] != 36)
  {
    *(_DWORD *)(a2 + 32) = -304;
    *(NDR_record_t *)(a2 + 24) = NDR_record;
  }

  else
  {
    Class result = (_DWORD *)sub_1000BADE4(result[3], result[8]);
    *(_DWORD *)(a2 + 32) = (_DWORD)result;
  }

  return result;
}

_DWORD *sub_10014A240(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0 || result[1] != 24)
  {
    *(_DWORD *)(a2 + 32) = -304;
    NDR_record_t v3 = NDR_record;
  }

  else
  {
    Class result = (_DWORD *)sub_1000BAEF4(result[3], (_DWORD *)(a2 + 36));
    *(_DWORD *)(a2 + 32) = (_DWORD)result;
    NDR_record_t v3 = NDR_record;
    if (!(_DWORD)result)
    {
      *(NDR_record_t *)(a2 + 24) = NDR_record;
      *(_DWORD *)(a2 + 4) = 40;
      return result;
    }
  }

  *(NDR_record_t *)(a2 + 24) = v3;
  return result;
}

_DWORD *sub_10014A2B8(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0 || result[1] != 36)
  {
    *(_DWORD *)(a2 + 32) = -304;
    *(NDR_record_t *)(a2 + 24) = NDR_record;
  }

  else
  {
    Class result = (_DWORD *)sub_1000BAFB8(result[3], result[8]);
    *(_DWORD *)(a2 + 32) = (_DWORD)result;
  }

  return result;
}

uint64_t sub_10014A318(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) != 0 || *(_DWORD *)(result + 4) != 40)
  {
    *(_DWORD *)(a2 + 32) = -304;
    *(NDR_record_t *)(a2 + 24) = NDR_record;
  }

  else
  {
    Class result = sub_1000BB0C8(*(_DWORD *)(result + 12), *(double *)(result + 32));
    *(_DWORD *)(a2 + 32) = result;
  }

  return result;
}

uint64_t sub_10014A378(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) == 0 || *(_DWORD *)(result + 24) != 1 || *(_DWORD *)(result + 4) != 60)
  {
    int v5 = -304;
LABEL_9:
    *(_DWORD *)(a2 + 32) = v5;
    NDR_record_t v4 = NDR_record;
    goto LABEL_10;
  }

  if (*(_BYTE *)(result + 39) != 1 || (uint64_t v3 = *(unsigned int *)(result + 40), (_DWORD)v3 != *(_DWORD *)(result + 52)))
  {
    int v5 = -300;
    goto LABEL_9;
  }

  Class result = sub_1000BB1D8( *(unsigned int *)(result + 12),  *(void *)(result + 28),  v3,  *(unsigned int *)(result + 56),  (_DWORD *)(a2 + 36));
  *(_DWORD *)(a2 + 32) = result;
  NDR_record_t v4 = NDR_record;
  if (!(_DWORD)result)
  {
    *(NDR_record_t *)(a2 + 24) = NDR_record;
    *(_DWORD *)(a2 + 4) = 40;
    return result;
  }

uint64_t sub_10014A42C(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) == 0 || *(_DWORD *)(result + 24) != 1 || *(_DWORD *)(result + 4) != 68)
  {
    int v5 = -304;
LABEL_9:
    *(_DWORD *)(a2 + 32) = v5;
    NDR_record_t v4 = NDR_record;
    goto LABEL_10;
  }

  if (*(_BYTE *)(result + 39) != 1 || (uint64_t v3 = *(unsigned int *)(result + 40), (_DWORD)v3 != *(_DWORD *)(result + 52)))
  {
    int v5 = -300;
    goto LABEL_9;
  }

  Class result = sub_1000BB1E4( *(unsigned int *)(result + 12),  *(void *)(result + 28),  v3,  *(void *)(result + 56),  *(unsigned int *)(result + 64),  (_DWORD *)(a2 + 36));
  *(_DWORD *)(a2 + 32) = result;
  NDR_record_t v4 = NDR_record;
  if (!(_DWORD)result)
  {
    *(NDR_record_t *)(a2 + 24) = NDR_record;
    *(_DWORD *)(a2 + 4) = 40;
    return result;
  }

_DWORD *sub_10014A4E4(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0 || result[1] != 24)
  {
    *(_DWORD *)(a2 + 32) = -304;
    NDR_record_t v3 = NDR_record;
  }

  else
  {
    Class result = (_DWORD *)sub_1000BB1F4(result[3], (_DWORD *)(a2 + 36));
    *(_DWORD *)(a2 + 32) = (_DWORD)result;
    NDR_record_t v3 = NDR_record;
    if (!(_DWORD)result)
    {
      *(NDR_record_t *)(a2 + 24) = NDR_record;
      *(_DWORD *)(a2 + 4) = 40;
      return result;
    }
  }

  *(NDR_record_t *)(a2 + 24) = v3;
  return result;
}

_DWORD *sub_10014A55C(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0 || result[1] != 24)
  {
    *(_DWORD *)(a2 + 32) = -304;
    NDR_record_t v3 = NDR_record;
  }

  else
  {
    Class result = (_DWORD *)sub_1000BB2B8(result[3], (_DWORD *)(a2 + 36));
    *(_DWORD *)(a2 + 32) = (_DWORD)result;
    NDR_record_t v3 = NDR_record;
    if (!(_DWORD)result)
    {
      *(NDR_record_t *)(a2 + 24) = NDR_record;
      *(_DWORD *)(a2 + 4) = 40;
      return result;
    }
  }

  *(NDR_record_t *)(a2 + 24) = v3;
  return result;
}

uint64_t sub_10014A5D4(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) == 0 || *(_DWORD *)(result + 24) != 3 || *(_DWORD *)(result + 4) != 96)
  {
    int v7 = -304;
LABEL_13:
    *(_DWORD *)(a2 + 32) = v7;
    NDR_record_t v6 = NDR_record;
    goto LABEL_14;
  }

  if (*(_BYTE *)(result + 39) != 1
    || *(_BYTE *)(result + 55) != 1
    || *(_BYTE *)(result + 71) != 1
    || (CFIndex v3 = *(unsigned int *)(result + 40), (_DWORD)v3 != *(_DWORD *)(result + 84))
    || (unsigned int v4 = *(_DWORD *)(result + 56), v4 != *(_DWORD *)(result + 88))
    || (unsigned int v5 = *(_DWORD *)(result + 72), v5 != *(_DWORD *)(result + 92)))
  {
    int v7 = -300;
    goto LABEL_13;
  }

  Class result = sub_1000BB37C( *(_DWORD *)(result + 12),  *(UInt8 **)(result + 28),  v3,  *(UInt8 **)(result + 44),  v4,  *(UInt8 **)(result + 60),  v5,  (_DWORD *)(a2 + 36));
  *(_DWORD *)(a2 + 32) = result;
  NDR_record_t v6 = NDR_record;
  if (!(_DWORD)result)
  {
    *(NDR_record_t *)(a2 + 24) = NDR_record;
    *(_DWORD *)(a2 + 4) = 40;
    return result;
  }

_DWORD *sub_10014A6C4(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0 || result[1] != 24)
  {
    *(_DWORD *)(a2 + 32) = -304;
    goto LABEL_6;
  }

  *(_DWORD *)(a2 + 36) = 16777473;
  Class result = (_DWORD *)sub_1000BB5A8(result[3], (vm_offset_t *)(a2 + 28), (mach_msg_type_number_t *)(a2 + 52));
  if ((_DWORD)result)
  {
    *(_DWORD *)(a2 + 32) = (_DWORD)result;
LABEL_6:
    *(NDR_record_t *)(a2 + 24) = NDR_record;
    return result;
  }

  *(_DWORD *)(a2 + 40) = *(_DWORD *)(a2 + 52);
  *(NDR_record_t *)(a2 + 44) = NDR_record;
  *(_DWORD *)a2 |= 0x80000000;
  *(_DWORD *)(a2 + 4) = 56;
  *(_DWORD *)(a2 + 24) = 1;
  return result;
}

_DWORD *sub_10014A768(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0 || result[1] != 24)
  {
    *(_DWORD *)(a2 + 32) = -304;
    NDR_record_t v3 = NDR_record;
  }

  else
  {
    Class result = (_DWORD *)sub_1000BB68C(result[3], (_DWORD *)(a2 + 36));
    *(_DWORD *)(a2 + 32) = (_DWORD)result;
    NDR_record_t v3 = NDR_record;
    if (!(_DWORD)result)
    {
      *(NDR_record_t *)(a2 + 24) = NDR_record;
      *(_DWORD *)(a2 + 4) = 40;
      return result;
    }
  }

  *(NDR_record_t *)(a2 + 24) = v3;
  return result;
}

_DWORD *sub_10014A7E0(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0 || result[1] != 24)
  {
    *(_DWORD *)(a2 + 32) = -304;
    NDR_record_t v3 = NDR_record;
  }

  else
  {
    Class result = (_DWORD *)sub_1000BAA48(result[3], (_DWORD *)(a2 + 36));
    *(_DWORD *)(a2 + 32) = (_DWORD)result;
    NDR_record_t v3 = NDR_record;
    if (!(_DWORD)result)
    {
      *(NDR_record_t *)(a2 + 24) = NDR_record;
      *(_DWORD *)(a2 + 4) = 40;
      return result;
    }
  }

  *(NDR_record_t *)(a2 + 24) = v3;
  return result;
}

_DWORD *sub_10014A858(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0 || result[1] != 36)
  {
    *(_DWORD *)(a2 + 32) = -304;
    *(NDR_record_t *)(a2 + 24) = NDR_record;
  }

  else
  {
    Class result = (_DWORD *)sub_10000B784();
    *(_DWORD *)(a2 + 32) = (_DWORD)result;
  }

  return result;
}

_DWORD *sub_10014A8B8(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0 || result[1] != 24)
  {
    *(_DWORD *)(a2 + 32) = -304;
    NDR_record_t v3 = NDR_record;
  }

  else
  {
    Class result = (_DWORD *)sub_1000BB74C(result[3], (_DWORD *)(a2 + 36));
    *(_DWORD *)(a2 + 32) = (_DWORD)result;
    NDR_record_t v3 = NDR_record;
    if (!(_DWORD)result)
    {
      *(NDR_record_t *)(a2 + 24) = NDR_record;
      *(_DWORD *)(a2 + 4) = 40;
      return result;
    }
  }

  *(NDR_record_t *)(a2 + 24) = v3;
  return result;
}

uint64_t sub_10014A930(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) == 0 || *(_DWORD *)(result + 24) != 1 || *(_DWORD *)(result + 4) != 56)
  {
    int v3 = -304;
LABEL_9:
    *(_DWORD *)(a2 + 32) = v3;
    goto LABEL_10;
  }

  if (*(_BYTE *)(result + 39) != 1 || *(_DWORD *)(result + 40) != *(_DWORD *)(result + 52))
  {
    int v3 = -300;
    goto LABEL_9;
  }

  *(_DWORD *)(a2 + 36) = 16777473;
  Class result = sub_1000BB80C( *(_DWORD *)(result + 12),  *(UInt8 **)(result + 28),  *(_DWORD *)(result + 40),  (vm_offset_t *)(a2 + 28),  (mach_msg_type_number_t *)(a2 + 52));
  if ((_DWORD)result)
  {
    *(_DWORD *)(a2 + 32) = result;
LABEL_10:
    *(NDR_record_t *)(a2 + 24) = NDR_record;
    return result;
  }

  *(_DWORD *)(a2 + 40) = *(_DWORD *)(a2 + 52);
  *(NDR_record_t *)(a2 + 44) = NDR_record;
  *(_DWORD *)a2 |= 0x80000000;
  *(_DWORD *)(a2 + 4) = 56;
  *(_DWORD *)(a2 + 24) = 1;
  return result;
}

uint64_t sub_10014AA10(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) != 0 && *(_DWORD *)(result + 24) == 1 && *(_DWORD *)(result + 4) == 56)
  {
    if (*(_BYTE *)(result + 39) == 1)
    {
      unsigned int v3 = *(_DWORD *)(result + 40);
      if (v3 == *(_DWORD *)(result + 52))
      {
        Class result = sub_1000BB944(*(_DWORD *)(result + 12), *(UInt8 **)(result + 28), v3);
        *(_DWORD *)(a2 + 32) = result;
        return result;
      }
    }

    int v4 = -300;
  }

  else
  {
    int v4 = -304;
  }

  *(_DWORD *)(a2 + 32) = v4;
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  return result;
}

uint64_t sub_10014AAA0(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) != 0 && *(_DWORD *)(result + 24) == 1 && *(_DWORD *)(result + 4) == 56)
  {
    if (*(_BYTE *)(result + 39) == 1)
    {
      unsigned int v3 = *(_DWORD *)(result + 40);
      if (v3 == *(_DWORD *)(result + 52))
      {
        Class result = sub_1000BBA44(*(_DWORD *)(result + 12), *(UInt8 **)(result + 28), v3);
        *(_DWORD *)(a2 + 32) = result;
        return result;
      }
    }

    int v4 = -300;
  }

  else
  {
    int v4 = -304;
  }

  *(_DWORD *)(a2 + 32) = v4;
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  return result;
}

uint64_t sub_10014AB30(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) != 0 && *(_DWORD *)(result + 24) == 1 && *(_DWORD *)(result + 4) == 56)
  {
    if (*(_BYTE *)(result + 39) == 1)
    {
      unsigned int v3 = *(_DWORD *)(result + 40);
      if (v3 == *(_DWORD *)(result + 52))
      {
        Class result = sub_1000BBB3C(*(_DWORD *)(result + 12), *(UInt8 **)(result + 28), v3);
        *(_DWORD *)(a2 + 32) = result;
        return result;
      }
    }

    int v4 = -300;
  }

  else
  {
    int v4 = -304;
  }

  *(_DWORD *)(a2 + 32) = v4;
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  return result;
}

uint64_t sub_10014ABC0(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) == 0 || *(_DWORD *)(result + 24) != 2 || *(_DWORD *)(result + 4) != 76)
  {
    int v3 = -304;
LABEL_11:
    *(_DWORD *)(a2 + 32) = v3;
    goto LABEL_12;
  }

  if (*(_BYTE *)(result + 39) != 1
    || *(_BYTE *)(result + 55) != 1
    || *(_DWORD *)(result + 40) != *(_DWORD *)(result + 68)
    || *(_DWORD *)(result + 56) != *(_DWORD *)(result + 72))
  {
    int v3 = -300;
    goto LABEL_11;
  }

  *(_DWORD *)(a2 + 36) = 16777473;
  Class result = sub_1000BBDB4( *(_DWORD *)(result + 12),  *(UInt8 **)(result + 28),  *(_DWORD *)(result + 40),  *(UInt8 **)(result + 44),  *(_DWORD *)(result + 56),  (vm_offset_t *)(a2 + 28),  (mach_msg_type_number_t *)(a2 + 52));
  if ((_DWORD)result)
  {
    *(_DWORD *)(a2 + 32) = result;
LABEL_12:
    *(NDR_record_t *)(a2 + 24) = NDR_record;
    return result;
  }

  *(_DWORD *)(a2 + 40) = *(_DWORD *)(a2 + 52);
  *(NDR_record_t *)(a2 + 44) = NDR_record;
  *(_DWORD *)a2 |= 0x80000000;
  *(_DWORD *)(a2 + 4) = 56;
  *(_DWORD *)(a2 + 24) = 1;
  return result;
}

uint64_t sub_10014ACC4(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) == 0 || *(_DWORD *)(result + 24) != 2 || *(_DWORD *)(result + 4) != 80)
  {
    int v6 = -304;
LABEL_11:
    *(_DWORD *)(a2 + 32) = v6;
    NDR_record_t v5 = NDR_record;
    goto LABEL_12;
  }

  if (*(_BYTE *)(result + 39) != 1
    || *(_BYTE *)(result + 55) != 1
    || (unsigned int v3 = *(_DWORD *)(result + 40), v3 != *(_DWORD *)(result + 68))
    || (unsigned int v4 = *(_DWORD *)(result + 56), v4 != *(_DWORD *)(result + 76)))
  {
    int v6 = -300;
    goto LABEL_11;
  }

  Class result = sub_1000BBC34( *(_DWORD *)(result + 12),  *(UInt8 **)(result + 28),  v3,  *(unsigned int *)(result + 72),  *(UInt8 **)(result + 44),  v4,  (_DWORD *)(a2 + 36));
  *(_DWORD *)(a2 + 32) = result;
  NDR_record_t v5 = NDR_record;
  if (!(_DWORD)result)
  {
    *(NDR_record_t *)(a2 + 24) = NDR_record;
    *(_DWORD *)(a2 + 4) = 40;
    return result;
  }

uint64_t sub_10014AD98(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) != 0 && *(_DWORD *)(result + 24) == 1 && *(_DWORD *)(result + 4) == 56)
  {
    if (*(_BYTE *)(result + 39) == 1)
    {
      unsigned int v3 = *(_DWORD *)(result + 40);
      if (v3 == *(_DWORD *)(result + 52))
      {
        Class result = sub_1000BC34C(*(_DWORD *)(result + 12), *(UInt8 **)(result + 28), v3);
        *(_DWORD *)(a2 + 32) = result;
        return result;
      }
    }

    int v4 = -300;
  }

  else
  {
    int v4 = -304;
  }

  *(_DWORD *)(a2 + 32) = v4;
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  return result;
}

uint64_t sub_10014AE28(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) != 0 && *(_DWORD *)(result + 24) == 2 && *(_DWORD *)(result + 4) == 76)
  {
    if (*(_BYTE *)(result + 39) == 1 && *(_BYTE *)(result + 55) == 1)
    {
      unsigned int v3 = *(_DWORD *)(result + 40);
      if (v3 == *(_DWORD *)(result + 68))
      {
        CFIndex v4 = *(unsigned int *)(result + 56);
        if ((_DWORD)v4 == *(_DWORD *)(result + 72))
        {
          Class result = sub_1000BC168(*(_DWORD *)(result + 12), *(UInt8 **)(result + 28), v3, *(UInt8 **)(result + 44), v4);
          *(_DWORD *)(a2 + 32) = result;
          return result;
        }
      }
    }

    int v5 = -300;
  }

  else
  {
    int v5 = -304;
  }

  *(_DWORD *)(a2 + 32) = v5;
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  return result;
}

_DWORD *sub_10014AED8(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0 || result[1] != 24)
  {
    *(_DWORD *)(a2 + 32) = -304;
    goto LABEL_6;
  }

  *(_DWORD *)(a2 + 36) = 16777473;
  Class result = (_DWORD *)sub_1000B05E0(result[3], (vm_offset_t *)(a2 + 28), (mach_msg_type_number_t *)(a2 + 52));
  if ((_DWORD)result)
  {
    *(_DWORD *)(a2 + 32) = (_DWORD)result;
LABEL_6:
    *(NDR_record_t *)(a2 + 24) = NDR_record;
    return result;
  }

  *(_DWORD *)(a2 + 40) = *(_DWORD *)(a2 + 52);
  *(NDR_record_t *)(a2 + 44) = NDR_record;
  *(_DWORD *)a2 |= 0x80000000;
  *(_DWORD *)(a2 + 4) = 56;
  *(_DWORD *)(a2 + 24) = 1;
  return result;
}

uint64_t sub_10014AF7C(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) == 0 || *(_DWORD *)(result + 24) != 1 || *(_DWORD *)(result + 4) != 56)
  {
    int v5 = -304;
LABEL_9:
    *(_DWORD *)(a2 + 32) = v5;
    NDR_record_t v4 = NDR_record;
    goto LABEL_10;
  }

  if (*(_BYTE *)(result + 39) != 1 || (unsigned int v3 = *(_DWORD *)(result + 40), v3 != *(_DWORD *)(result + 52)))
  {
    int v5 = -300;
    goto LABEL_9;
  }

  Class result = sub_1000B06C0(*(_DWORD *)(result + 12), *(UInt8 **)(result + 28), v3, (_DWORD *)(a2 + 36));
  *(_DWORD *)(a2 + 32) = result;
  NDR_record_t v4 = NDR_record;
  if (!(_DWORD)result)
  {
    *(NDR_record_t *)(a2 + 24) = NDR_record;
    *(_DWORD *)(a2 + 4) = 40;
    return result;
  }

uint64_t sub_10014B02C(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) != 0 && *(_DWORD *)(result + 24) == 1 && *(_DWORD *)(result + 4) == 56)
  {
    if (*(_BYTE *)(result + 39) == 1)
    {
      CFIndex v3 = *(unsigned int *)(result + 40);
      if ((_DWORD)v3 == *(_DWORD *)(result + 52))
      {
        Class result = sub_1000BC444(*(_DWORD *)(result + 12), *(UInt8 **)(result + 28), v3);
        *(_DWORD *)(a2 + 32) = result;
        return result;
      }
    }

    int v4 = -300;
  }

  else
  {
    int v4 = -304;
  }

  *(_DWORD *)(a2 + 32) = v4;
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  return result;
}

uint64_t sub_10014B0BC(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) == 0 || *(_DWORD *)(result + 24) != 1 || *(_DWORD *)(result + 4) != 56)
  {
    int v5 = -304;
LABEL_9:
    *(_DWORD *)(a2 + 32) = v5;
    NDR_record_t v4 = NDR_record;
    goto LABEL_10;
  }

  if (*(_BYTE *)(result + 39) != 1 || (CFIndex v3 = *(unsigned int *)(result + 40), (_DWORD)v3 != *(_DWORD *)(result + 52)))
  {
    int v5 = -300;
    goto LABEL_9;
  }

  Class result = sub_1000BC590(*(_DWORD *)(result + 12), *(UInt8 **)(result + 28), v3, (_DWORD *)(a2 + 36));
  *(_DWORD *)(a2 + 32) = result;
  NDR_record_t v4 = NDR_record;
  if (!(_DWORD)result)
  {
    *(NDR_record_t *)(a2 + 24) = NDR_record;
    *(_DWORD *)(a2 + 4) = 40;
    return result;
  }

uint64_t sub_10014B16C(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) == 0 || *(_DWORD *)(result + 24) != 1 || *(_DWORD *)(result + 4) != 60)
  {
    int v4 = -304;
LABEL_8:
    *(_DWORD *)(a2 + 32) = v4;
    goto LABEL_9;
  }

  if (*(_BYTE *)(result + 39) != 1 || (CFIndex v3 = *(unsigned int *)(result + 40), (_DWORD)v3 != *(_DWORD *)(result + 56)))
  {
    int v4 = -300;
    goto LABEL_8;
  }

  Class result = sub_1000BC6E4(*(_DWORD *)(result + 12), *(unsigned int *)(result + 52), *(UInt8 **)(result + 28), v3);
  *(_DWORD *)(a2 + 32) = result;
LABEL_9:
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  return result;
}

uint64_t sub_10014B200(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) != 0 && *(_DWORD *)(result + 24) == 1 && *(_DWORD *)(result + 4) == 56)
  {
    if (*(_BYTE *)(result + 39) == 1)
    {
      unsigned int v3 = *(_DWORD *)(result + 40);
      if (v3 == *(_DWORD *)(result + 52))
      {
        Class result = sub_1000BC830(*(_DWORD *)(result + 12), *(UInt8 **)(result + 28), v3);
        *(_DWORD *)(a2 + 32) = result;
        return result;
      }
    }

    int v4 = -300;
  }

  else
  {
    int v4 = -304;
  }

  *(_DWORD *)(a2 + 32) = v4;
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  return result;
}

_DWORD *sub_10014B290(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0 || result[1] != 24)
  {
    *(_DWORD *)(a2 + 32) = -304;
    NDR_record_t v3 = NDR_record;
  }

  else
  {
    Class result = (_DWORD *)sub_1000BC928(result[3], (_DWORD *)(a2 + 36));
    *(_DWORD *)(a2 + 32) = (_DWORD)result;
    NDR_record_t v3 = NDR_record;
    if (!(_DWORD)result)
    {
      *(NDR_record_t *)(a2 + 24) = NDR_record;
      *(_DWORD *)(a2 + 4) = 40;
      return result;
    }
  }

  *(NDR_record_t *)(a2 + 24) = v3;
  return result;
}

_DWORD *sub_10014B308(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0 || result[1] != 24)
  {
    *(_DWORD *)(a2 + 32) = -304;
    NDR_record_t v3 = NDR_record;
  }

  else
  {
    Class result = (_DWORD *)sub_1000BC9E8(result[3], (_DWORD *)(a2 + 36));
    *(_DWORD *)(a2 + 32) = (_DWORD)result;
    NDR_record_t v3 = NDR_record;
    if (!(_DWORD)result)
    {
      *(NDR_record_t *)(a2 + 24) = NDR_record;
      *(_DWORD *)(a2 + 4) = 40;
      return result;
    }
  }

  *(NDR_record_t *)(a2 + 24) = v3;
  return result;
}

_DWORD *sub_10014B380(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0 || result[1] != 24)
  {
    *(_DWORD *)(a2 + 32) = -304;
    *(NDR_record_t *)(a2 + 24) = NDR_record;
  }

  else
  {
    Class result = (_DWORD *)sub_1000BCAA8(result[3]);
    *(_DWORD *)(a2 + 32) = (_DWORD)result;
  }

  return result;
}

_DWORD *sub_10014B3D8(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0 || result[1] != 24)
  {
    *(_DWORD *)(a2 + 32) = -304;
    *(NDR_record_t *)(a2 + 24) = NDR_record;
  }

  else
  {
    Class result = (_DWORD *)sub_1000BCBB4(result[3]);
    *(_DWORD *)(a2 + 32) = (_DWORD)result;
  }

  return result;
}

_DWORD *sub_10014B430(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0 || result[1] != 24)
  {
    *(_DWORD *)(a2 + 32) = -304;
    *(NDR_record_t *)(a2 + 24) = NDR_record;
  }

  else
  {
    Class result = (_DWORD *)sub_1000BCC74(result[3]);
    *(_DWORD *)(a2 + 32) = (_DWORD)result;
  }

  return result;
}

uint64_t sub_10014B488(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) == 0 || *(_DWORD *)(result + 24) != 1 || *(_DWORD *)(result + 4) != 56)
  {
    int v5 = -304;
LABEL_9:
    *(_DWORD *)(a2 + 32) = v5;
    NDR_record_t v4 = NDR_record;
    goto LABEL_10;
  }

  if (*(_BYTE *)(result + 39) != 1 || (unsigned int v3 = *(_DWORD *)(result + 40), v3 != *(_DWORD *)(result + 52)))
  {
    int v5 = -300;
    goto LABEL_9;
  }

  Class result = sub_1000BCD4C(*(_DWORD *)(result + 12), *(UInt8 **)(result + 28), v3, (unsigned int *)(a2 + 36));
  *(_DWORD *)(a2 + 32) = result;
  NDR_record_t v4 = NDR_record;
  if (!(_DWORD)result)
  {
    *(NDR_record_t *)(a2 + 24) = NDR_record;
    *(_DWORD *)(a2 + 4) = 40;
    return result;
  }

_DWORD *sub_10014B538(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0 || result[1] != 36)
  {
    *(_DWORD *)(a2 + 32) = -304;
  }

  else
  {
    Class result = (_DWORD *)sub_1000BCE4C(result[3], result[8]);
    *(_DWORD *)(a2 + 32) = (_DWORD)result;
  }

  *(NDR_record_t *)(a2 + 24) = NDR_record;
  return result;
}

uint64_t sub_10014B598(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) != 0 && *(_DWORD *)(result + 24) == 1 && *(_DWORD *)(result + 4) == 56)
  {
    if (*(_BYTE *)(result + 39) == 1)
    {
      unsigned int v3 = *(_DWORD *)(result + 40);
      if (v3 == *(_DWORD *)(result + 52))
      {
        Class result = sub_1000BCF6C(*(_DWORD *)(result + 12), *(UInt8 **)(result + 28), v3);
        *(_DWORD *)(a2 + 32) = result;
        return result;
      }
    }

    int v4 = -300;
  }

  else
  {
    int v4 = -304;
  }

  *(_DWORD *)(a2 + 32) = v4;
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  return result;
}

_DWORD *sub_10014B628(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0 || result[1] != 24)
  {
    *(_DWORD *)(a2 + 32) = -304;
    goto LABEL_6;
  }

  *(_DWORD *)(a2 + 36) = 16777472;
  Class result = (_DWORD *)sub_1000BD060(result[3], (vm_offset_t *)(a2 + 28), (mach_msg_type_number_t *)(a2 + 52));
  if ((_DWORD)result)
  {
    *(_DWORD *)(a2 + 32) = (_DWORD)result;
LABEL_6:
    *(NDR_record_t *)(a2 + 24) = NDR_record;
    return result;
  }

  *(_DWORD *)(a2 + 40) = *(_DWORD *)(a2 + 52);
  *(NDR_record_t *)(a2 + 44) = NDR_record;
  *(_DWORD *)a2 |= 0x80000000;
  *(_DWORD *)(a2 + 4) = 56;
  *(_DWORD *)(a2 + 24) = 1;
  return result;
}

uint64_t sub_10014B6C8(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) == 0 || *(_DWORD *)(result + 24) != 1 || *(_DWORD *)(result + 4) != 56)
  {
    int v4 = -304;
LABEL_8:
    *(_DWORD *)(a2 + 32) = v4;
    goto LABEL_9;
  }

  if (*(_BYTE *)(result + 39) != 1 || (unsigned int v3 = *(_DWORD *)(result + 40), v3 != *(_DWORD *)(result + 52)))
  {
    int v4 = -300;
    goto LABEL_8;
  }

  Class result = sub_1000BD198(*(_DWORD *)(result + 12), *(UInt8 **)(result + 28), v3);
  *(_DWORD *)(a2 + 32) = result;
LABEL_9:
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  return result;
}

_DWORD *sub_10014B758(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0 || result[1] != 36)
  {
    *(_DWORD *)(a2 + 32) = -304;
    *(NDR_record_t *)(a2 + 24) = NDR_record;
  }

  else
  {
    Class result = (_DWORD *)sub_1000BD278(result[3], result[8]);
    *(_DWORD *)(a2 + 32) = (_DWORD)result;
  }

  return result;
}

_DWORD *sub_10014B7B8(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0 || result[1] != 24)
  {
    *(_DWORD *)(a2 + 32) = -304;
    NDR_record_t v3 = NDR_record;
  }

  else
  {
    Class result = (_DWORD *)sub_1000BD3A8(result[3], (_DWORD *)(a2 + 36));
    *(_DWORD *)(a2 + 32) = (_DWORD)result;
    NDR_record_t v3 = NDR_record;
    if (!(_DWORD)result)
    {
      *(NDR_record_t *)(a2 + 24) = NDR_record;
      *(_DWORD *)(a2 + 4) = 40;
      return result;
    }
  }

  *(NDR_record_t *)(a2 + 24) = v3;
  return result;
}

uint64_t sub_10014B830(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) != 0 && *(_DWORD *)(result + 24) == 1 && *(_DWORD *)(result + 4) == 56)
  {
    if (*(_BYTE *)(result + 39) == 1)
    {
      unsigned int v3 = *(_DWORD *)(result + 40);
      if (v3 == *(_DWORD *)(result + 52))
      {
        Class result = sub_1000BD464(*(_DWORD *)(result + 12), *(UInt8 **)(result + 28), v3);
        *(_DWORD *)(a2 + 32) = result;
        return result;
      }
    }

    int v4 = -300;
  }

  else
  {
    int v4 = -304;
  }

  *(_DWORD *)(a2 + 32) = v4;
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  return result;
}

uint64_t sub_10014B8C0(_DWORD *a1, uint64_t a2)
{
  int v2 = a1[2];
  *(_DWORD *)a2 = *a1 & 0x1F;
  *(_DWORD *)(a2 + 4) = 36;
  int v3 = a1[5] + 100;
  *(_DWORD *)(a2 + _Block_object_dispose((const void *)(v11 - 96), 8) = v2;
  *(_DWORD *)(a2 + 12) = 0;
  *(_DWORD *)(a2 + 16) = 0;
  *(_DWORD *)(a2 + 20) = v3;
  int v4 = a1[5];
  if ((v4 - 69846) >= 0xFFFFFF64
    && (int v5 = (void (*)(void))*(&off_1001E6AA0 + 5 * (v4 - 69690) + 5)) != 0LL)
  {
    v5();
    return 1LL;
  }

  else
  {
    uint64_t result = 0LL;
    *(NDR_record_t *)(a2 + 24) = NDR_record;
    *(_DWORD *)(a2 + 32) = -303;
  }

  return result;
}

uint64_t sub_10014B954( int a1, vm_address_t a2, int a3, int a4, int a5, uint64_t a6, int a7, uint64_t a8, int a9, mach_msg_timeout_t a10)
{
  vm_address_t v16 = a2;
  int v17 = 27918592;
  v18[0] = a3;
  *(void *)&v18[1] = a6;
  v18[3] = 27918592;
  v19[0] = a7;
  *(void *)&v19[1] = a8;
  v19[3] = 27918592;
  v20[0] = a9;
  *(NDR_record_t *)&v20[1] = NDR_record;
  v20[3] = a3;
  void v20[4] = a4;
  v20[5] = a5;
  v20[6] = a7;
  v20[7] = a9;
  *(void *)msg = 0xAAAAAAAA80000013LL;
  *(_DWORD *)&msg[8] = a1;
  *(_OWORD *)&msg[12] = xmmword_10017FD40;
  if (&_voucher_mach_msg_set) {
    voucher_mach_msg_set((mach_msg_header_t *)msg);
  }
  uint64_t v13 = mach_msg((mach_msg_header_t *)msg, 2097169, 0x68u, 0, 0, a10, 0);
  if ((_DWORD)v13 == 268435460)
  {
    if (v16 != a2) {
      mig_deallocate(v16, v18[0]);
    }
    if (*(void *)&v18[1] != a6) {
      mig_deallocate(*(vm_address_t *)&v18[1], v19[0]);
    }
    if (*(void *)&v19[1] != a8) {
      mig_deallocate(*(vm_address_t *)&v19[1], v20[0]);
    }
  }

  return v13;
}

uint64_t sub_10014BA70( int a1, vm_address_t a2, int a3, uint64_t a4, int a5, int a6, mach_msg_timeout_t timeout)
{
  vm_address_t v15 = a2;
  int v16 = 27918592;
  v17[0] = a3;
  *(void *)&v17[1] = a4;
  v17[3] = 27918592;
  v18[0] = a5;
  *(NDR_record_t *)&v18[1] = NDR_record;
  v18[3] = a3;
  _DWORD v18[4] = a5;
  v18[5] = a6;
  unint64_t v12 = 0xAAAAAAAA80000013LL;
  int v13 = a1;
  __int128 v14 = xmmword_10017FD50;
  if (&_voucher_mach_msg_set) {
    voucher_mach_msg_set((mach_msg_header_t *)&v12);
  }
  uint64_t v10 = mach_msg((mach_msg_header_t *)&v12, 2097169, 0x50u, 0, 0, timeout, 0);
  if ((_DWORD)v10 == 268435460)
  {
    if (v15 != a2) {
      mig_deallocate(v15, v17[0]);
    }
    if (*(void *)&v17[1] != a4) {
      mig_deallocate(*(vm_address_t *)&v17[1], v18[0]);
    }
  }

  return v10;
}

uint64_t sub_10014BB68( int a1, vm_address_t a2, int a3, uint64_t a4, int a5, uint64_t a6, int a7, int a8, mach_msg_timeout_t timeout)
{
  vm_address_t v15 = a2;
  int v16 = 27918592;
  v17[0] = a3;
  *(void *)&v17[1] = a4;
  v17[3] = 27918592;
  v18[0] = a5;
  *(void *)&v18[1] = a6;
  v18[3] = 27918592;
  v19[0] = a7;
  *(NDR_record_t *)&v19[1] = NDR_record;
  v19[3] = a3;
  _DWORD v19[4] = a5;
  v19[5] = a7;
  v19[6] = a8;
  *(void *)msg = 0xAAAAAAAA80000013LL;
  *(_DWORD *)&msg[8] = a1;
  *(_OWORD *)&msg[12] = xmmword_10017FD60;
  if (&_voucher_mach_msg_set) {
    voucher_mach_msg_set((mach_msg_header_t *)msg);
  }
  uint64_t v12 = mach_msg((mach_msg_header_t *)msg, 2097169, 0x64u, 0, 0, timeout, 0);
  if ((_DWORD)v12 == 268435460)
  {
    if (v15 != a2) {
      mig_deallocate(v15, v17[0]);
    }
    if (*(void *)&v17[1] != a4) {
      mig_deallocate(*(vm_address_t *)&v17[1], v18[0]);
    }
    if (*(void *)&v18[1] != a6) {
      mig_deallocate(*(vm_address_t *)&v18[1], v19[0]);
    }
  }

  return v12;
}

uint64_t sub_10014BC80( int a1, vm_address_t a2, int a3, int a4, uint64_t a5, int a6, uint64_t a7, int a8, mach_msg_timeout_t timeout)
{
  vm_address_t v15 = a2;
  int v16 = 27918592;
  v17[0] = a3;
  *(void *)&v17[1] = a5;
  v17[3] = 27918592;
  v18[0] = a6;
  *(void *)&v18[1] = a7;
  v18[3] = 27918592;
  v19[0] = a8;
  *(NDR_record_t *)&v19[1] = NDR_record;
  v19[3] = a3;
  _DWORD v19[4] = a4;
  v19[5] = a6;
  v19[6] = a8;
  *(void *)msg = 0xAAAAAAAA80000013LL;
  *(_DWORD *)&msg[8] = a1;
  *(_OWORD *)&msg[12] = xmmword_10017FD70;
  if (&_voucher_mach_msg_set) {
    voucher_mach_msg_set((mach_msg_header_t *)msg);
  }
  uint64_t v12 = mach_msg((mach_msg_header_t *)msg, 2097169, 0x64u, 0, 0, timeout, 0);
  if ((_DWORD)v12 == 268435460)
  {
    if (v15 != a2) {
      mig_deallocate(v15, v17[0]);
    }
    if (*(void *)&v17[1] != a5) {
      mig_deallocate(*(vm_address_t *)&v17[1], v18[0]);
    }
    if (*(void *)&v18[1] != a7) {
      mig_deallocate(*(vm_address_t *)&v18[1], v19[0]);
    }
  }

  return v12;
}

uint64_t sub_10014BD98( int a1, vm_address_t a2, int a3, int a4, uint64_t a5, int a6, mach_msg_timeout_t timeout)
{
  vm_address_t v15 = a2;
  int v16 = 27918592;
  v17[0] = a3;
  *(void *)&v17[1] = a5;
  v17[3] = 27918592;
  v18[0] = a6;
  *(NDR_record_t *)&v18[1] = NDR_record;
  v18[3] = a3;
  _DWORD v18[4] = a4;
  v18[5] = a6;
  unint64_t v12 = 0xAAAAAAAA80000013LL;
  int v13 = a1;
  __int128 v14 = xmmword_10017FD80;
  if (&_voucher_mach_msg_set) {
    voucher_mach_msg_set((mach_msg_header_t *)&v12);
  }
  uint64_t v10 = mach_msg((mach_msg_header_t *)&v12, 2097169, 0x50u, 0, 0, timeout, 0);
  if ((_DWORD)v10 == 268435460)
  {
    if (v15 != a2) {
      mig_deallocate(v15, v17[0]);
    }
    if (*(void *)&v17[1] != a5) {
      mig_deallocate(*(vm_address_t *)&v17[1], v18[0]);
    }
  }

  return v10;
}

uint64_t sub_10014BE90( int a1, vm_address_t a2, int a3, uint64_t a4, uint64_t a5, int a6, mach_msg_timeout_t timeout)
{
  vm_address_t v13 = a2;
  int v14 = 27918592;
  v15[0] = a3;
  *(void *)&v15[1] = a5;
  v15[3] = 27918592;
  v16[0] = a6;
  *(NDR_record_t *)&v16[1] = NDR_record;
  v16[3] = a3;
  uint64_t v17 = a4;
  int v18 = a6;
  *(void *)msg = 0xAAAAAAAA80000013LL;
  *(_DWORD *)&msg[8] = a1;
  *(_OWORD *)&msg[12] = xmmword_10017FD90;
  if (&_voucher_mach_msg_set) {
    voucher_mach_msg_set((mach_msg_header_t *)msg);
  }
  uint64_t v10 = mach_msg((mach_msg_header_t *)msg, 2097169, 0x54u, 0, 0, timeout, 0);
  if ((_DWORD)v10 == 268435460)
  {
    if (v13 != a2) {
      mig_deallocate(v13, v15[0]);
    }
    if (*(void *)&v15[1] != a5) {
      mig_deallocate(*(vm_address_t *)&v15[1], v16[0]);
    }
  }

  return v10;
}

uint64_t sub_10014BF8C(mach_port_t a1, int a2, mach_msg_timeout_t timeout)
{
  NDR_record_t v6 = NDR_record;
  int v7 = a2;
  *(void *)&msg.msgh_bits = 0xAAAAAAAA00000013LL;
  msg.msgh_voucher_port = 0;
  msg.msgh_id = 96966;
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = 0;
  if (&_voucher_mach_msg_set) {
    voucher_mach_msg_set(&msg);
  }
  return mach_msg(&msg, 2097169, 0x24u, 0, 0, timeout, 0);
}

uint64_t sub_10014C018( int a1, vm_address_t a2, int a3, uint64_t a4, int a5, int a6, mach_msg_timeout_t timeout)
{
  vm_address_t v15 = a2;
  int v16 = 27918592;
  v17[0] = a3;
  *(void *)&v17[1] = a4;
  v17[3] = 27918592;
  v18[0] = a5;
  *(NDR_record_t *)&v18[1] = NDR_record;
  v18[3] = a3;
  _DWORD v18[4] = a5;
  v18[5] = a6;
  unint64_t v12 = 0xAAAAAAAA80000013LL;
  int v13 = a1;
  __int128 v14 = xmmword_10017FDA0;
  if (&_voucher_mach_msg_set) {
    voucher_mach_msg_set((mach_msg_header_t *)&v12);
  }
  uint64_t v10 = mach_msg((mach_msg_header_t *)&v12, 2097169, 0x50u, 0, 0, timeout, 0);
  if ((_DWORD)v10 == 268435460)
  {
    if (v15 != a2) {
      mig_deallocate(v15, v17[0]);
    }
    if (*(void *)&v17[1] != a4) {
      mig_deallocate(*(vm_address_t *)&v17[1], v18[0]);
    }
  }

  return v10;
}

uint64_t sub_10014C110( int a1, vm_address_t a2, int a3, uint64_t a4, int a5, int a6, mach_msg_timeout_t timeout)
{
  vm_address_t v15 = a2;
  int v16 = 27918592;
  v17[0] = a3;
  *(void *)&v17[1] = a4;
  v17[3] = 27918592;
  v18[0] = a5;
  *(NDR_record_t *)&v18[1] = NDR_record;
  v18[3] = a3;
  _DWORD v18[4] = a5;
  v18[5] = a6;
  unint64_t v12 = 0xAAAAAAAA80000013LL;
  int v13 = a1;
  __int128 v14 = xmmword_10017FDB0;
  if (&_voucher_mach_msg_set) {
    voucher_mach_msg_set((mach_msg_header_t *)&v12);
  }
  uint64_t v10 = mach_msg((mach_msg_header_t *)&v12, 2097169, 0x50u, 0, 0, timeout, 0);
  if ((_DWORD)v10 == 268435460)
  {
    if (v15 != a2) {
      mig_deallocate(v15, v17[0]);
    }
    if (*(void *)&v17[1] != a4) {
      mig_deallocate(*(vm_address_t *)&v17[1], v18[0]);
    }
  }

  return v10;
}

uint64_t sub_10014C208(int a1, vm_address_t a2, int a3, int a4, mach_msg_timeout_t timeout)
{
  vm_address_t v12 = a2;
  int v13 = 27918592;
  v14[0] = a3;
  *(NDR_record_t *)&v14[1] = NDR_record;
  v14[3] = a3;
  v14[4] = a4;
  unint64_t v9 = 0xAAAAAAAA80000013LL;
  int v10 = a1;
  __int128 v11 = xmmword_10017FDC0;
  if (&_voucher_mach_msg_set) {
    voucher_mach_msg_set((mach_msg_header_t *)&v9);
  }
  uint64_t v7 = mach_msg((mach_msg_header_t *)&v9, 2097169, 0x3Cu, 0, 0, timeout, 0);
  if ((_DWORD)v7 == 268435460 && v12 != a2) {
    mig_deallocate(v12, v14[0]);
  }
  return v7;
}

uint64_t sub_10014C2D4(int a1, int a2, vm_address_t a3, int a4, mach_msg_timeout_t timeout)
{
  vm_address_t v12 = a3;
  int v13 = 27918592;
  v14[0] = a4;
  *(NDR_record_t *)&v14[1] = NDR_record;
  v14[3] = a2;
  v14[4] = a4;
  unint64_t v9 = 0xAAAAAAAA80000013LL;
  int v10 = a1;
  __int128 v11 = xmmword_10017FDD0;
  if (&_voucher_mach_msg_set) {
    voucher_mach_msg_set((mach_msg_header_t *)&v9);
  }
  uint64_t v7 = mach_msg((mach_msg_header_t *)&v9, 2097169, 0x3Cu, 0, 0, timeout, 0);
  if ((_DWORD)v7 == 268435460 && v12 != a3) {
    mig_deallocate(v12, v14[0]);
  }
  return v7;
}

uint64_t sub_10014C3A0(int a1, vm_address_t a2, int a3, mach_msg_timeout_t timeout)
{
  vm_address_t v9 = a2;
  int v10 = 27918592;
  v11[0] = a3;
  *(NDR_record_t *)&v11[1] = NDR_record;
  v11[3] = a3;
  *(void *)mach_msg_header_t msg = 0xAAAAAAAA80000013LL;
  *(_DWORD *)&msg[8] = a1;
  *(_OWORD *)&msg[12] = xmmword_10017FDE0;
  if (&_voucher_mach_msg_set) {
    voucher_mach_msg_set((mach_msg_header_t *)msg);
  }
  uint64_t v6 = mach_msg((mach_msg_header_t *)msg, 2097169, 0x38u, 0, 0, timeout, 0);
  if ((_DWORD)v6 == 268435460 && v9 != a2) {
    mig_deallocate(v9, v11[0]);
  }
  return v6;
}

uint64_t sub_10014C46C(mach_port_t a1, int a2, mach_msg_timeout_t timeout)
{
  NDR_record_t v6 = NDR_record;
  int v7 = a2;
  *(void *)&msg.msgh_bits = 0xAAAAAAAA00000013LL;
  msg.msgh_voucher_port = 0;
  msg.msgh_id = 96972;
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = 0;
  if (&_voucher_mach_msg_set) {
    voucher_mach_msg_set(&msg);
  }
  return mach_msg(&msg, 2097169, 0x24u, 0, 0, timeout, 0);
}

uint64_t sub_10014C4F8(int a1, vm_address_t a2, int a3, mach_msg_timeout_t timeout)
{
  vm_address_t v9 = a2;
  int v10 = 27918592;
  v11[0] = a3;
  *(NDR_record_t *)&v11[1] = NDR_record;
  v11[3] = a3;
  *(void *)mach_msg_header_t msg = 0xAAAAAAAA80000013LL;
  *(_DWORD *)&msg[8] = a1;
  *(_OWORD *)&msg[12] = xmmword_10017FDF0;
  if (&_voucher_mach_msg_set) {
    voucher_mach_msg_set((mach_msg_header_t *)msg);
  }
  uint64_t v6 = mach_msg((mach_msg_header_t *)msg, 2097169, 0x38u, 0, 0, timeout, 0);
  if ((_DWORD)v6 == 268435460 && v9 != a2) {
    mig_deallocate(v9, v11[0]);
  }
  return v6;
}

uint64_t netrbInitIfnetTrafficDescriptor( void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (!a1 || xpc_get_type(a1) != (xpc_type_t)&_xpc_type_dictionary)
  {
    int v10 = "metadata is not dictionary object";
LABEL_4:
    NETRBErrorLog((uint64_t)v10, a2, a3, a4, a5, a6, a7, a8, v106);
    return 0LL;
  }

  xpc_object_t value = xpc_dictionary_get_value(a1, netrbClientLowLatencyFlowParam);
  if (!value || (int v13 = value, xpc_get_type(value) != (xpc_type_t)&_xpc_type_dictionary))
  {
    int v10 = "metadata does not contain low latency flow parameter dictionary.";
    goto LABEL_4;
  }

  xpc_object_t v14 = xpc_dictionary_get_value(v13, netrbClientIfnetTrafficDescriptorIpVersion);
  if (v14 && (id v22 = v14, xpc_get_type(v14) == (xpc_type_t)&_xpc_type_uint64))
  {
    unsigned __int8 v58 = xpc_uint64_get_value(v22);
    int v66 = v58;
    if (v58 != 4 && v58 != 96)
    {
      NETRBErrorLog((uint64_t)"IP version (%hhu) is not supported or is invalid", v59, v60, v61, v62, v63, v64, v65, v58);
      return 0LL;
    }

    if (a2)
    {
      *(_BYTE *)(a2 + 8) |= 1u;
      *(_BYTE *)(a2 + 9) = v58;
    }

    xpc_object_t v67 = xpc_dictionary_get_value(v13, netrbClientIfnetTrafficDescriptorLocalIp);
    if (v67 && (v75 = v67, xpc_get_type(v67) == (xpc_type_t)&_xpc_type_string))
    {
      string_ptr = xpc_string_get_string_ptr(v75);
      if (a2) {
        *(_BYTE *)(a2 + 8) |= 4u;
      }
    }

    else
    {
      NETRBInfoLog((uint64_t)"local IP is not present or has incorrect type", v68, v69, v70, v71, v72, v73, v74, v106);
      string_ptr = 0LL;
    }

    xpc_object_t v77 = xpc_dictionary_get_value(v13, netrbClientIfnetTrafficDescriptorRemoteIp);
    if (v77 && (CFRange v85 = v77, xpc_get_type(v77) == (xpc_type_t)&_xpc_type_string))
    {
      CFRange v86 = xpc_string_get_string_ptr(v85);
      if (a2) {
        *(_BYTE *)(a2 + 8) |= 8u;
      }
    }

    else
    {
      NETRBInfoLog((uint64_t)"remote IP is not present or has incorrect type", v78, v79, v80, v81, v82, v83, v84, v106);
      CFRange v86 = 0LL;
    }

    if (v66 == 4)
    {
      if (string_ptr && inet_pton(2, string_ptr, (char *)&v108 + 12) != 1
        || v86 && inet_pton(2, v86, (char *)&v107 + 12) != 1)
      {
        int v10 = "local or remote IPv4 address is malformed.";
        goto LABEL_4;
      }

      if (a2)
      {
        *(_DWORD *)(a2 + 24) = HIDWORD(v108);
        *(_DWORD *)(a2 + 40) = HIDWORD(v107);
      }
    }

    else
    {
      if (string_ptr && inet_pton(30, string_ptr, &v108) != 1 || v86 && inet_pton(30, v86, &v107) != 1)
      {
        int v10 = "local or remote IPv6 address is malformed.";
        goto LABEL_4;
      }

      if (a2)
      {
        *(_OWORD *)(a2 + 12) = v108;
        *(_OWORD *)(a2 + 2_Block_object_dispose((const void *)(v11 - 96), 8) = v107;
      }
    }
  }

  else
  {
    NETRBErrorLog((uint64_t)"IP version is not present", v15, v16, v17, v18, v19, v20, v21, v106);
  }

  xpc_object_t v23 = xpc_dictionary_get_value(v13, netrbClientIfnetTrafficDescriptorIpProtocol);
  if (v23 && (id v31 = v23, xpc_get_type(v23) == (xpc_type_t)&_xpc_type_uint64))
  {
    char v87 = xpc_uint64_get_value(v31);
    if (v87 != 17 && v87 != 6)
    {
      int v10 = "IP protocol is not supported or is invalid.";
      goto LABEL_4;
    }

    if (a2)
    {
      *(_BYTE *)(a2 + 8) |= 2u;
      *(_BYTE *)(a2 + 10) = v87;
    }
  }

  else
  {
    NETRBInfoLog((uint64_t)"IP protocol is not present or has incorrect type", v24, v25, v26, v27, v28, v29, v30, v106);
  }

  xpc_object_t v32 = xpc_dictionary_get_value(v13, netrbClientIfnetTrafficDescriptorLocalPort);
  if (v32)
  {
    v40 = v32;
    if (xpc_get_type(v32) != (xpc_type_t)&_xpc_type_uint64)
    {
LABEL_22:
      int v10 = "Local port specified does not have UINT64 type.";
      goto LABEL_4;
    }

    uint64_t v41 = xpc_uint64_get_value(v40);
    if (v41 - 0x10000 < 0xFFFFFFFFFFFF0001LL)
    {
      NETRBErrorLog((uint64_t)"Illegal local port %llu", v42, v43, v44, v45, v46, v47, v48, v41);
      return 0LL;
    }

    if (a2)
    {
      *(_BYTE *)(a2 + 8) |= 0x10u;
      *(_WORD *)(a2 + 44) = bswap32(v41) >> 16;
    }
  }

  else
  {
    NETRBInfoLog((uint64_t)"No local port specified.", v33, v34, v35, v36, v37, v38, v39, v106);
  }

  xpc_object_t v49 = xpc_dictionary_get_value(v13, netrbClientIfnetTrafficDescriptorRemotePort);
  if (v49)
  {
    id v57 = v49;
    uint64_t v91 = xpc_uint64_get_value(v57);
    if (v91 - 0x10000 < 0xFFFFFFFFFFFF0001LL)
    {
      NETRBErrorLog((uint64_t)"Illegal remote port %llu", v92, v93, v94, v95, v96, v97, v98, v91);
      return 0LL;
    }

    if (a2)
    {
      *(_BYTE *)(a2 + 8) |= 0x20u;
      *(_WORD *)(a2 + 46) = bswap32(v91) >> 16;
    }
  }

  else
  {
    NETRBErrorLog((uint64_t)"No local port specified.", v50, v51, v52, v53, v54, v55, v56, v106);
  }

  xpc_object_t v89 = xpc_dictionary_get_value(v13, netrbClientIfnetTrafficDescriptorConnectionIdleTimeout);
  if (v89)
  {
    id v90 = v89;
    if (xpc_get_type(v89) != (xpc_type_t)&_xpc_type_uint64)
    {
      int v10 = "Connection idle timeout does not have UINT64 type.";
      goto LABEL_4;
    }

    if (xpc_uint64_get_value(v90) >= 0x69781)
    {
      NETRBErrorLog( (uint64_t)"Connection idle timeout exceeds max limit of %u seconds",  v99,  v100,  v101,  v102,  v103,  v104,  v105,  432000LL);
      return 0LL;
    }
  }

  return 1LL;
}

void *_NETRBClientCreateInternal(dispatch_object_s *a1, const void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v34 = 0LL;
  uint64_t v35 = &v34;
  uint64_t v36 = 0x2000000000LL;
  char v37 = 0;
  uint64_t v30 = 0LL;
  id v31 = &v30;
  uint64_t v32 = 0x2000000000LL;
  uint64_t v33 = 2000LL;
  int v7 = 0LL;
  if (qword_100219EE8 != -1) {
    dispatch_once(&qword_100219EE8, &stru_1001E89B0);
  }
  uint64_t Instance = _CFRuntimeCreateInstance(kCFAllocatorDefault);
  int v7 = (void *)Instance;
  if (!Instance)
  {
    uint64_t v18 = __error();
    uint64_t v19 = strerror(*v18);
    NETRBErrorLog((uint64_t)"unable to create client object %s", v20, v21, v22, v23, v24, v25, v26, (uint64_t)v19);
    goto LABEL_2;
  }

  bzero((void *)(Instance + 16), 0x218uLL);
  if (a1)
  {
    void v7[2] = a1;
    dispatch_retain(a1);
    if (a2) {
      v7[3] = _Block_copy(a2);
    }
  }

  if (qword_100219EF8 != -1) {
    dispatch_once(&qword_100219EF8, &stru_1001E8A50);
  }
  uint64_t v17 = (dispatch_queue_s *)qword_100219F00;
  if (qword_100219F00)
  {
    if (qword_100219F08 != -1) {
      dispatch_once(&qword_100219F08, &stru_1001E8A90);
    }
    if (qword_100219F10)
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 0x40000000LL;
      block[2] = sub_10014CC80;
      block[3] = &unk_1001E8350;
      block[6] = v7;
      block[7] = qword_100219F10;
      void block[4] = &v34;
      void block[5] = &v30;
      block[8] = v17;
      block[9] = a4;
      dispatch_sync(v17, block);
      if (*((_BYTE *)v35 + 24) && (v31[3] | 2) == 0x7D2) {
        *((_BYTE *)v35 + 24) = 0;
      }
      goto LABEL_22;
    }

    uint64_t v27 = "unable to create XPC queue";
  }

  else
  {
    uint64_t v27 = "unable to create framework queue";
  }

  NETRBErrorLog((uint64_t)v27, v10, v11, v12, v13, v14, v15, v16, v28);
LABEL_22:
  if (!*((_BYTE *)v35 + 24))
  {
    CFRelease(v7);
    int v7 = 0LL;
  }

LABEL_2:
  _Block_object_dispose(&v30, 8);
  _Block_object_dispose(&v34, 8);
  return v7;
}

  CFArrayAppendValue(v3, v2);
  *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = 1;
  int v4 = xpc_dictionary_create(0LL, 0LL, 0LL);
  if (!v4)
  {
    sub_10014CE4C(*(const void **)(a1 + 48));
    uint64_t v42 = "xpc_dictionary_create() failed";
LABEL_12:
    NETRBErrorLog((uint64_t)v42, v35, v36, v37, v38, v39, v40, v41, (uint64_t)v52);
LABEL_16:
    *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = 0;
    return;
  }

  int v5 = v4;
  xpc_dictionary_set_uint64(v4, off_100219628, 0x3E8uLL);
  NETRBInfoLog((uint64_t)"client %p xpc send -> client create", v6, v7, v8, v9, v10, v11, v12, *(void *)(a1 + 48));
  v53[0] = _NSConcreteStackBlock;
  v53[1] = 0x40000000LL;
  v53[2] = sub_10014CEE4;
  v53[3] = &unk_1001E8328;
  uint64_t v54 = *(_OWORD *)(a1 + 40);
  uint64_t v55 = *(void *)(a1 + 72);
  *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = NETRBXPCSetupAndSend(0LL, v5, (uint64_t)v53);
  if (!*(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL)) {
    sub_10014CE4C(*(const void **)(a1 + 48));
  }
  xpc_release(v5);
}

void sub_10014CC80(uint64_t a1)
{
  int v2 = *(const void **)(a1 + 48);
  int v3 = (__CFArray *)qword_100219EE0;
  if (!qword_100219EE0)
  {
    uint64_t v14 = *(dispatch_queue_s **)(a1 + 56);
    uint64_t v13 = *(dispatch_queue_s **)(a1 + 64);
    qword_100219EE0 = (uint64_t)CFArrayCreateMutable(kCFAllocatorDefault, 0LL, 0LL);
    if (!qword_100219EE0)
    {
      uint64_t v43 = __error();
      uint64_t v52 = strerror(*v43);
      uint64_t v42 = "unable to create client list %s";
      goto LABEL_12;
    }

    if (NETRBXPCCreate(v14, (uint64_t)v13, v15, v16, v17, v18, v19, v20))
    {
      if (NETRBXPCEndPointCreate(v13, v21, v22, v23, v24, v25, v26, v27))
      {
        int v3 = (__CFArray *)qword_100219EE0;
        goto LABEL_2;
      }

      uint64_t v44 = NETRBErrorLog( (uint64_t)"unable to create xpc endpoint connection",  v28,  v29,  v30,  v31,  v32,  v33,  v34,  (uint64_t)v52);
      NETRBXPCCleanup(v44, v45, v46, v47, v48, v49, v50, v51);
    }

    else
    {
      NETRBErrorLog( (uint64_t)"unable to create xpc connnection to daemon",  v21,  v22,  v23,  v24,  v25,  v26,  v27,  (uint64_t)v52);
    }

    CFRelease((CFTypeRef)qword_100219EE0);
    qword_100219EE0 = 0LL;
    goto LABEL_16;
  }

void sub_10014CE4C(const void *a1)
{
  if (qword_100219EE0 && CFArrayGetCount((CFArrayRef)qword_100219EE0) >= 1)
  {
    CFIndex v2 = 0LL;
    while (CFArrayGetValueAtIndex((CFArrayRef)qword_100219EE0, v2) != a1)
    {
      if (++v2 >= CFArrayGetCount((CFArrayRef)qword_100219EE0)) {
        return;
      }
    }

    CFArrayRemoveValueAtIndex((CFMutableArrayRef)qword_100219EE0, v2);
    if (!CFArrayGetCount((CFArrayRef)qword_100219EE0))
    {
      BOOL v10 = NETRBXPCCleanup(0LL, v3, v4, v5, v6, v7, v8, v9);
      NETRBEndPointCleanup(v10, v11, v12, v13, v14, v15, v16, v17);
      CFRelease((CFTypeRef)qword_100219EE0);
      qword_100219EE0 = 0LL;
    }
  }

void sub_10014CEE4( uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (!a2) {
    goto LABEL_6;
  }
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = xpc_dictionary_get_uint64(a2, off_100219688);
  if (*(void *)(a1 + 48)) {
    **(_DWORD **)(a1 + 4_Block_object_dispose((const void *)(v11 - 96), 8) = xpc_dictionary_get_uint64(a2, off_100219678);
  }
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) != 2001LL
    || (BOOL v10 = (char *)(*(void *)(a1 + 40) + 32LL),
        string = xpc_dictionary_get_string(a2, off_100219630),
        snprintf(v10, 0x100uLL, "%s", string),
        *(_BYTE *)(*(void *)(a1 + 40) + 288LL) = 1,
        *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) != 2001LL))
  {
LABEL_6:
    sub_10014CE4C(*(const void **)(a1 + 40));
  }

void *_NETRBClientCreate(dispatch_object_s *a1, const void *a2, uint64_t a3)
{
  return _NETRBClientCreateInternal(a1, a2, a3, 0LL);
}

uint64_t _NETRBClientDestroy( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v18 = 0LL;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x2000000000LL;
  char v21 = 0;
  uint64_t v14 = 0LL;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x2000000000LL;
  uint64_t v17 = 2000LL;
  if (!a1)
  {
    uint64_t v9 = "client handle cannot be NULL";
LABEL_9:
    NETRBErrorLog((uint64_t)v9, a2, a3, a4, a5, a6, a7, a8, v12);
    goto LABEL_10;
  }

  if (qword_100219EF8 != -1) {
    dispatch_once(&qword_100219EF8, &stru_1001E8A50);
  }
  if (!qword_100219F00)
  {
    uint64_t v9 = "unable to create framework queue";
    goto LABEL_9;
  }

  block[0] = _NSConcreteStackBlock;
  block[1] = 0x40000000LL;
  block[2] = sub_10014D124;
  block[3] = &unk_1001E83A0;
  void block[4] = &v18;
  void block[5] = &v14;
  block[6] = a1;
  dispatch_sync((dispatch_queue_t)qword_100219F00, block);
  if (*((_BYTE *)v19 + 24)) {
    *((_BYTE *)v19 + 24) = v15[3] == 2001;
  }
LABEL_10:
  uint64_t v10 = *((unsigned __int8 *)v19 + 24);
  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v18, 8);
  return v10;
}

void sub_10014D124( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (sub_10014D270(*(_BYTE **)(a1 + 48), a2, a3, a4, a5, a6, a7, a8))
  {
    NETRBErrorLog((uint64_t)"invalid client %p", v9, v10, v11, v12, v13, v14, v15, *(void *)(a1 + 48));
LABEL_3:
    *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = 0;
    return;
  }

  *(_BYTE *)(*(void *)(a1 + 48) + 288LL) = 0;
  xpc_object_t v16 = xpc_dictionary_create(0LL, 0LL, 0LL);
  if (!v16)
  {
    NETRBErrorLog((uint64_t)"xpc_dictionary_create() failed", v17, v18, v19, v20, v21, v22, v23, v32);
    sub_10014CE4C(*(const void **)(a1 + 48));
    CFRelease(*(CFTypeRef *)(a1 + 48));
    goto LABEL_3;
  }

  uint64_t v24 = v16;
  xpc_dictionary_set_uint64(v16, off_100219628, 0x3F4uLL);
  xpc_dictionary_set_string(v24, off_100219630, (const char *)(*(void *)(a1 + 48) + 32LL));
  NETRBInfoLog((uint64_t)"client %p xpc send -> destroy client", v25, v26, v27, v28, v29, v30, v31, *(void *)(a1 + 48));
  v33[0] = _NSConcreteStackBlock;
  v33[1] = 0x40000000LL;
  v33[2] = sub_10014D338;
  v33[3] = &unk_1001E8378;
  __int128 v34 = *(_OWORD *)(a1 + 40);
  *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = NETRBXPCSetupAndSend(0LL, v24, (uint64_t)v33);
  xpc_release(v24);
  if (!*(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL))
  {
    sub_10014CE4C(*(const void **)(a1 + 48));
    CFRelease(*(CFTypeRef *)(a1 + 48));
  }

uint64_t sub_10014D270( _BYTE *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (!a1)
  {
    uint64_t v12 = "client handler is NULL";
LABEL_14:
    NETRBNoticeLog((uint64_t)v12, a2, a3, a4, a5, a6, a7, a8, v14);
    return 22LL;
  }

  if (!a1[288]) {
    return 22LL;
  }
  if (!qword_100219EE0)
  {
    uint64_t v12 = "client list is empty";
    goto LABEL_14;
  }

  CFIndex Count = CFArrayGetCount((CFArrayRef)qword_100219EE0);
  if (!Count)
  {
    uint64_t v12 = "client is not added to the list";
    goto LABEL_14;
  }

  CFIndex v10 = Count;
  if (Count < 1)
  {
    uint64_t v12 = "unknown client";
    goto LABEL_14;
  }

  CFIndex v11 = 0LL;
  uint64_t v12 = "unknown client";
  while (CFArrayGetValueAtIndex((CFArrayRef)qword_100219EE0, v11) != a1)
  {
    if (v10 == ++v11) {
      goto LABEL_14;
    }
  }

  return 0LL;
}

void sub_10014D338( uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a2) {
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = xpc_dictionary_get_uint64(a2, off_100219688);
  }
  sub_10014CE4C(*(const void **)(a1 + 40));
  CFRelease(*(CFTypeRef *)(a1 + 40));
}

uint64_t _NETRBClientStartService( uint64_t a1, char *__s1, uint64_t a3, uint64_t a4, void *a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v91 = 0LL;
  uint64_t v92 = &v91;
  uint64_t v93 = 0x2000000000LL;
  char v94 = 0;
  if (!a1)
  {
    uint64_t v9 = "client handle cannot be NULL";
LABEL_24:
    NETRBErrorLog((uint64_t)v9, (uint64_t)__s1, a3, a4, (uint64_t)a5, a6, a7, a8, (uint64_t)v87);
    goto LABEL_25;
  }

  int v8 = a3;
  if ((a3 - 205) <= 0xFFFFFFFA)
  {
    NETRBErrorLog((uint64_t)"incorrect operation mode %d", (uint64_t)__s1, a3, a4, (uint64_t)a5, a6, a7, a8, a3);
    goto LABEL_25;
  }

  int v10 = a4;
  if ((a4 - 304) <= 0xFFFFFFFB)
  {
    NETRBErrorLog((uint64_t)"incorrect bridge type %d", (uint64_t)__s1, a3, a4, (uint64_t)a5, a6, a7, a8, a4);
    goto LABEL_25;
  }

  if (__s1 && *__s1 && strncmp(__s1, netrbClientAnyExternal, 0x10uLL) && !if_nametoindex(__s1))
  {
    char v87 = __s1;
    uint64_t v9 = "incorrect external interface name %s";
    goto LABEL_24;
  }

  xpc_object_t v14 = xpc_dictionary_create(0LL, 0LL, 0LL);
  if (!v14)
  {
    uint64_t v9 = "xpc_dictionary_create() failed";
    goto LABEL_24;
  }

  uint64_t v15 = v14;
  if (!a5 || xpc_get_type(a5) != (xpc_type_t)&_xpc_type_dictionary)
  {
    xpc_object_t v16 = "incorrect interface object";
LABEL_20:
    NETRBErrorLog((uint64_t)v16, (uint64_t)__s1, a3, a4, (uint64_t)a5, a6, a7, a8, (uint64_t)v87);
LABEL_21:
    uint64_t v20 = v15;
LABEL_22:
    xpc_release(v20);
    goto LABEL_25;
  }

  xpc_object_t value = xpc_dictionary_get_value(a5, netrbClientDeviceType);
  if (!value
    || (uint64_t v18 = value, xpc_get_type(value) != (xpc_type_t)&_xpc_type_uint64)
    || (uint64_t v19 = xpc_uint64_get_value(v18), v19 >= 7))
  {
    xpc_object_t v16 = "device type is incorrect";
    goto LABEL_20;
  }

  uint64_t v23 = v19;
  xpc_dictionary_set_uint64(v15, off_100219700, v19);
  if (v23 != 1)
  {
    xpc_object_t v26 = xpc_dictionary_get_value(a5, netrbClientInterfaceName);
    if (!v26
      || (uint64_t v27 = v26, xpc_get_type(v26) != (xpc_type_t)&_xpc_type_string)
      || (string_ptr = xpc_string_get_string_ptr(v27), !if_nametoindex(string_ptr)))
    {
      xpc_object_t v16 = "interface name is incorrect";
      goto LABEL_20;
    }

    uint64_t v33 = off_1002196F8;
    __int128 v34 = xpc_string_get_string_ptr(v27);
    xpc_dictionary_set_string(v15, v33, v34);
  }

  xpc_object_t v24 = xpc_dictionary_get_value(a5, netrbClientInterfaceMTU);
  if (v24)
  {
    uint64_t v25 = v24;
    if (xpc_get_type(v24) != (xpc_type_t)&_xpc_type_uint64)
    {
      xpc_object_t v16 = "incorrect format for interface mtu";
      goto LABEL_20;
    }

    uint64_t v28 = off_100219710;
    uint64_t v29 = xpc_uint64_get_value(v25);
    xpc_dictionary_set_uint64(v15, v28, v29);
  }

  xpc_object_t v30 = xpc_dictionary_get_value(a5, netrbClientInterfaceInstance);
  if (v30)
  {
    uint64_t v31 = v30;
    if (xpc_get_type(v30) != (xpc_type_t)&_xpc_type_uint64)
    {
      xpc_object_t v16 = "incorrect format for interface instance";
      goto LABEL_20;
    }

    uint64_t v35 = off_100219718;
    uint64_t v36 = xpc_uint64_get_value(v31);
    xpc_dictionary_set_uint64(v15, v35, v36);
  }

  xpc_object_t v37 = xpc_dictionary_get_value(a5, netrbClientInterfaceStartAddress);
  if (v37)
  {
    uint64_t v38 = v37;
    if (xpc_get_type(v37) != (xpc_type_t)&_xpc_type_string)
    {
      xpc_object_t v16 = "incorrect format for interface start address";
      goto LABEL_20;
    }

    uint64_t v39 = off_100219720;
    uint64_t v40 = xpc_string_get_string_ptr(v38);
    xpc_dictionary_set_string(v15, v39, v40);
  }

  xpc_object_t v41 = xpc_dictionary_get_value(a5, netrbClientInterfaceEndAddress);
  if (v41)
  {
    uint64_t v42 = v41;
    if (xpc_get_type(v41) != (xpc_type_t)&_xpc_type_string)
    {
      xpc_object_t v16 = "incorrect format for interface end address";
      goto LABEL_20;
    }

    uint64_t v43 = off_100219728;
    uint64_t v44 = xpc_string_get_string_ptr(v42);
    xpc_dictionary_set_string(v15, v43, v44);
  }

  xpc_object_t v45 = xpc_dictionary_get_value(a5, netrbClientInterfaceNetworkMask);
  if (v45)
  {
    uint64_t v46 = v45;
    if (xpc_get_type(v45) != (xpc_type_t)&_xpc_type_string)
    {
      xpc_object_t v16 = "incorrect format for interface network mask";
      goto LABEL_20;
    }

    uint64_t v47 = off_100219730;
    uint64_t v48 = xpc_string_get_string_ptr(v46);
    xpc_dictionary_set_string(v15, v47, v48);
  }

  xpc_object_t v49 = xpc_dictionary_get_value(a5, netrbClientNatType);
  if (!v49)
  {
    if (v8 != 201)
    {
      xpc_dictionary_set_uint64(v15, off_100219748, 0x1F5uLL);
LABEL_62:
      xpc_object_t v67 = 0LL;
      goto LABEL_63;
    }

    xpc_dictionary_set_uint64(v15, off_100219748, 0x1F4uLL);
LABEL_57:
    goto LABEL_62;
  }

  uint64_t v50 = v49;
  if (xpc_get_type(v49) != (xpc_type_t)&_xpc_type_uint64)
  {
    xpc_object_t v16 = "incorrect format for nat type";
    goto LABEL_20;
  }

  uint64_t v58 = xpc_uint64_get_value(v50);
  int v66 = v58;
  if ((v58 - 503) <= 0xFFFFFFFC)
  {
    NETRBErrorLog((uint64_t)"incorrect nat type %d", v59, v60, v61, v62, v63, v64, v65, v58);
    goto LABEL_21;
  }

  xpc_dictionary_set_uint64(v15, off_100219748, v58);
  if (v66 == 500) {
    goto LABEL_57;
  }
  if (v66 != 502) {
    goto LABEL_62;
  }
  xpc_object_t v68 = xpc_dictionary_get_value(a5, netrbClientNat64Param);
  if (!v68) {
    goto LABEL_62;
  }
  uint64_t v69 = v68;
  if (xpc_get_type(v68) != (xpc_type_t)&_xpc_type_dictionary)
  {
    xpc_object_t v16 = "incorrect format for nat64 param dictionary";
    goto LABEL_20;
  }

  xpc_object_t v70 = xpc_dictionary_create(0LL, 0LL, 0LL);
  if (!v70)
  {
    xpc_object_t v16 = "xpc_dictionary_create() failed for NAT64 dictionary";
    goto LABEL_20;
  }

  xpc_object_t v67 = v70;
  xpc_object_t v71 = xpc_dictionary_get_value(v69, netrbClientDns64Prefix);
  if (v71)
  {
    uint64_t v72 = v71;
    if (xpc_get_type(v71) != (xpc_type_t)&_xpc_type_string)
    {
      uint64_t v80 = "incorrect format for dns64 prefix";
LABEL_84:
      NETRBErrorLog((uint64_t)v80, v73, v74, v75, v76, v77, v78, v79, (uint64_t)v87);
      xpc_release(v15);
LABEL_69:
      uint64_t v20 = v67;
      goto LABEL_22;
    }

    uint64_t v81 = off_100219760;
    uint64_t v82 = xpc_string_get_string_ptr(v72);
    xpc_dictionary_set_string(v67, v81, v82);
  }

  xpc_object_t v83 = xpc_dictionary_get_value(v69, netrbClientRaPrefix);
  if (v83)
  {
    uint64_t v84 = v83;
    if (xpc_get_type(v83) != (xpc_type_t)&_xpc_type_string)
    {
      uint64_t v80 = "incorrect format for NAT64 RA prefix";
      goto LABEL_84;
    }

    CFRange v85 = off_100219768;
    CFRange v86 = xpc_string_get_string_ptr(v84);
    xpc_dictionary_set_string(v67, v85, v86);
  }

  xpc_dictionary_set_value(v15, off_100219750, v67);
LABEL_63:
  if (qword_100219EF8 != -1) {
    dispatch_once(&qword_100219EF8, &stru_1001E8A50);
  }
  if (qword_100219F00)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 0x40000000LL;
    block[2] = sub_10014DAFC;
    block[3] = &unk_1001E83E8;
    void block[4] = &v91;
    void block[5] = a1;
    int v89 = v8;
    int v90 = v10;
    block[6] = v15;
    void block[7] = __s1;
    block[8] = qword_100219F00;
    dispatch_sync((dispatch_queue_t)qword_100219F00, block);
  }

  else
  {
    NETRBErrorLog((uint64_t)"unable to create framework queue", v51, v52, v53, v54, v55, v56, v57, (uint64_t)v87);
  }

  xpc_release(v15);
  if (v67) {
    goto LABEL_69;
  }
LABEL_25:
  uint64_t v21 = *((unsigned __int8 *)v92 + 24);
  _Block_object_dispose(&v91, 8);
  return v21;
}

uint64_t sub_10014DA34(void *a1, void *a2)
{
  xpc_object_t value = xpc_dictionary_get_value(a1, netrbClientNat66Param);
  if (value)
  {
    uint64_t v4 = value;
    if (xpc_get_type(value) != (xpc_type_t)&_xpc_type_dictionary)
    {
      uint64_t v12 = "incorrect format for nat66 param dictionary";
LABEL_4:
      NETRBErrorLog((uint64_t)v12, v5, v6, v7, v8, v9, v10, v11, v17);
      return 0LL;
    }

    string = xpc_dictionary_get_string(v4, netrbClientRaPrefix);
    if (!string)
    {
      uint64_t v12 = "NAT66 RA prefix is invalid/missing";
      goto LABEL_4;
    }

    uint64_t v15 = string;
    xpc_object_t v16 = xpc_dictionary_create(0LL, 0LL, 0LL);
    xpc_dictionary_set_string(v16, off_100219768, v15);
    xpc_dictionary_set_value(a2, off_100219758, v16);
  }

  return 1LL;
}

double sub_10014DAFC( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (sub_10014D270(*(_BYTE **)(a1 + 40), a2, a3, a4, a5, a6, a7, a8))
  {
    NETRBErrorLog((uint64_t)"invalid client %p", v9, v10, v11, v12, v13, v14, v15, *(void *)(a1 + 40));
LABEL_6:
    *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = 0;
    return result;
  }

  if (*(_BYTE *)(*(void *)(a1 + 40) + 289LL))
  {
    uint64_t v17 = "client already started a service";
LABEL_5:
    NETRBErrorLog((uint64_t)v17, v9, v10, v11, v12, v13, v14, v15, v32);
    goto LABEL_6;
  }

  xpc_object_t v18 = xpc_dictionary_create(0LL, 0LL, 0LL);
  if (!v18)
  {
    uint64_t v17 = "xpc_dictionary_create() failed";
    goto LABEL_5;
  }

  uint64_t v19 = v18;
  xpc_dictionary_set_uint64(v18, off_100219628, 0x3E9uLL);
  xpc_dictionary_set_string(v19, off_100219630, (const char *)(*(void *)(a1 + 40) + 32LL));
  xpc_dictionary_set_uint64(v19, off_100219690, *(unsigned int *)(a1 + 72));
  xpc_dictionary_set_uint64(v19, off_100219698, *(unsigned int *)(a1 + 76));
  xpc_dictionary_set_value(v19, off_1002196F0, *(xpc_object_t *)(a1 + 48));
  uint64_t v27 = *(const char **)(a1 + 56);
  if (v27 && *v27)
  {
    if (!strncmp(*(const char **)(a1 + 56), netrbClientAnyExternal, 0x10uLL))
    {
      uint64_t v29 = off_100219740;
      uint64_t v28 = v19;
    }

    else
    {
      uint64_t v28 = v19;
      uint64_t v29 = v27;
    }

    xpc_dictionary_set_string(v28, off_1002196B0, v29);
  }

  NETRBInfoLog((uint64_t)"client %p xpc send -> start service", v20, v21, v22, v23, v24, v25, v26, *(void *)(a1 + 40));
  snprintf( (char *)(*(void *)(a1 + 40) + 289LL),  0x100uLL,  "%s-%p-%u",  "com.apple.netrb",  *(const void **)(a1 + 40),  dword_100219ED8);
  ++dword_100219ED8;
  xpc_object_t v30 = *(dispatch_queue_s **)(a1 + 64);
  v33[0] = _NSConcreteStackBlock;
  v33[1] = 0x40000000LL;
  v33[2] = sub_10014DD44;
  v33[3] = &unk_1001E83C0;
  void v33[4] = *(void *)(a1 + 40);
  *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = NETRBXPCSetupAndSend(v30, v19, (uint64_t)v33);
  xpc_release(v19);
  uint64_t v31 = *(void *)(a1 + 40);
  if (*(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL))
  {
    CFRetain((CFTypeRef)v31);
  }

  else
  {
    double result = 0.0;
    *(_OWORD *)(v31 + 513) = 0u;
    *(_OWORD *)(v31 + 529) = 0u;
    *(_OWORD *)(v31 + 481) = 0u;
    *(_OWORD *)(v31 + 497) = 0u;
    *(_OWORD *)(v31 + 449) = 0u;
    *(_OWORD *)(v31 + 465) = 0u;
    *(_OWORD *)(v31 + 417) = 0u;
    *(_OWORD *)(v31 + 433) = 0u;
    *(_OWORD *)(v31 + 385) = 0u;
    *(_OWORD *)(v31 + 401) = 0u;
    *(_OWORD *)(v31 + 353) = 0u;
    *(_OWORD *)(v31 + 369) = 0u;
    *(_OWORD *)(v31 + 321) = 0u;
    *(_OWORD *)(v31 + 337) = 0u;
    *(_OWORD *)(v31 + 289) = 0u;
    *(_OWORD *)(v31 + 305) = 0u;
  }

  return result;
}

void sub_10014DD44( uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10014DD58( void *a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v10 = a2;
  NETRBInfoLog((uint64_t)"client %p %s xpc response received", a2, (uint64_t)a3, a4, a5, a6, a7, a8, (uint64_t)a1);
  if (sub_10014D270(a1, v12, v13, v14, v15, v16, v17, v18))
  {
    uint64_t v26 = "client already destroyed";
LABEL_9:
    NETRBDebugLog((uint64_t)v26, v19, v20, v21, v22, v23, v24, v25, v43);
LABEL_10:
    CFRelease(a1);
    return;
  }

  if (!a1[2] || !a1[3])
  {
    uint64_t v26 = "no queue or handler block to send response";
    goto LABEL_9;
  }

  if (!a3)
  {
    xpc_object_t v34 = xpc_dictionary_create(0LL, 0LL, 0LL);
    if (v34)
    {
LABEL_15:
      uint64_t v36 = netrbClientNotificationKey;
      xpc_object_t v37 = v34;
      uint64_t v38 = 5003LL;
LABEL_16:
      xpc_dictionary_set_uint64(v37, v36, v38);
      goto LABEL_17;
    }

uint64_t _NETRBClientStopService( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v14 = 0LL;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x2000000000LL;
  char v17 = 0;
  if (!a1)
  {
    uint64_t v9 = "client handle cannot be NULL";
LABEL_8:
    NETRBErrorLog((uint64_t)v9, a2, a3, a4, a5, a6, a7, a8, v12);
    goto LABEL_9;
  }

  if (qword_100219EF8 != -1) {
    dispatch_once(&qword_100219EF8, &stru_1001E8A50);
  }
  if (!qword_100219F00)
  {
    uint64_t v9 = "unable to create framework queue";
    goto LABEL_8;
  }

  block[0] = _NSConcreteStackBlock;
  block[1] = 0x40000000LL;
  block[2] = sub_10014E068;
  block[3] = &unk_1001E8430;
  void block[4] = &v14;
  void block[5] = a1;
  block[6] = qword_100219F00;
  dispatch_sync((dispatch_queue_t)qword_100219F00, block);
LABEL_9:
  uint64_t v10 = *((unsigned __int8 *)v15 + 24);
  _Block_object_dispose(&v14, 8);
  return v10;
}

void sub_10014E068( void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (sub_10014D270((_BYTE *)a1[5], a2, a3, a4, a5, a6, a7, a8))
  {
    uint64_t v28 = a1[5];
    uint64_t v16 = "invalid client %p";
LABEL_3:
    NETRBErrorLog((uint64_t)v16, v9, v10, v11, v12, v13, v14, v15, v28);
    *(_BYTE *)(*(void *)(a1[4] + 8LL) + 24LL) = 0;
    return;
  }

  if (!*(_BYTE *)(a1[5] + 289LL))
  {
    uint64_t v16 = "no service to stop";
    goto LABEL_3;
  }

  xpc_object_t v17 = xpc_dictionary_create(0LL, 0LL, 0LL);
  if (!v17)
  {
    uint64_t v16 = "xpc_dictionary_create() failed";
    goto LABEL_3;
  }

  uint64_t v18 = v17;
  xpc_dictionary_set_uint64(v17, off_100219628, 0x3EAuLL);
  xpc_dictionary_set_string(v18, off_100219630, (const char *)(a1[5] + 32LL));
  NETRBInfoLog((uint64_t)"client %p xpc send -> stop service", v19, v20, v21, v22, v23, v24, v25, a1[5]);
  uint64_t v26 = (_OWORD *)(a1[5] + 289LL);
  v26[14] = 0u;
  v26[15] = 0u;
  v26[12] = 0u;
  v26[13] = 0u;
  v26[10] = 0u;
  v26[11] = 0u;
  v26[8] = 0u;
  v26[9] = 0u;
  v26[6] = 0u;
  v26[7] = 0u;
  v26[4] = 0u;
  v26[5] = 0u;
  v26[2] = 0u;
  v26[3] = 0u;
  *uint64_t v26 = 0u;
  v26[1] = 0u;
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 0x40000000LL;
  v29[2] = sub_10014E1D0;
  v29[3] = &unk_1001E8408;
  uint64_t v27 = (dispatch_queue_s *)a1[6];
  v29[4] = a1[5];
  *(_BYTE *)(*(void *)(a1[4] + 8LL) + 24LL) = NETRBXPCSetupAndSend(v27, v18, (uint64_t)v29);
  xpc_release(v18);
  if (*(_BYTE *)(*(void *)(a1[4] + 8LL) + 24LL)) {
    CFRetain((CFTypeRef)a1[5]);
  }
}

void sub_10014E1D0( uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

uint64_t _NETRBClientGetDynamicStoreKey( uint64_t a1, char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v14 = 0LL;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x2000000000LL;
  char v17 = 0;
  if (!a1)
  {
    uint64_t v10 = "client handle cannot be NULL";
LABEL_11:
    NETRBErrorLog((uint64_t)v10, (uint64_t)a2, a3, a4, a5, a6, a7, a8, v13[0]);
    goto LABEL_12;
  }

  if (!a2)
  {
    uint64_t v10 = "key cannot be NULL";
    goto LABEL_11;
  }

  if (qword_100219EF8 != -1) {
    dispatch_once(&qword_100219EF8, &stru_1001E8A50);
  }
  if (!qword_100219F00)
  {
    uint64_t v10 = "unable to create framework queue";
    goto LABEL_11;
  }

  v13[0] = (uint64_t)_NSConcreteStackBlock;
  v13[1] = 0x40000000LL;
  v13[2] = (uint64_t)sub_10014E2F8;
  v13[3] = (uint64_t)&unk_1001E8458;
  void v13[4] = (uint64_t)&v14;
  v13[5] = a1;
  dispatch_sync((dispatch_queue_t)qword_100219F00, v13);
  if (*((_BYTE *)v15 + 24)) {
    strcpy(a2, "com.apple.MobileInternetSharing");
  }
LABEL_12:
  uint64_t v11 = *((unsigned __int8 *)v15 + 24);
  _Block_object_dispose(&v14, 8);
  return v11;
}

uint64_t sub_10014E2F8( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t result = sub_10014D270(*(_BYTE **)(a1 + 40), a2, a3, a4, a5, a6, a7, a8);
  if ((_DWORD)result) {
    return NETRBErrorLog((uint64_t)"invalid client %p", v10, v11, v12, v13, v14, v15, v16, *(void *)(a1 + 40));
  }
  *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = 1;
  return result;
}

uint64_t _NETRBClientGetGlobalServiceState( uint64_t a1, _DWORD *a2, _DWORD *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v27 = 0LL;
  uint64_t v28 = &v27;
  uint64_t v29 = 0x2000000000LL;
  int v30 = 0;
  uint64_t v23 = 0LL;
  uint64_t v24 = &v23;
  uint64_t v25 = 0x2000000000LL;
  int v26 = 0;
  uint64_t v19 = 0LL;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x2000000000LL;
  char v22 = 0;
  uint64_t v15 = 0LL;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x2000000000LL;
  uint64_t v18 = 2000LL;
  if (!a1)
  {
    uint64_t v10 = "client handle cannot be NULL";
LABEL_13:
    NETRBErrorLog((uint64_t)v10, (uint64_t)a2, (uint64_t)a3, a4, a5, a6, a7, a8, v13);
    goto LABEL_14;
  }

  if (!a2)
  {
    uint64_t v10 = "state cannot be NULL";
    goto LABEL_13;
  }

  if (!a3)
  {
    uint64_t v10 = "reason cannot be NULL";
    goto LABEL_13;
  }

  if (qword_100219EF8 != -1)
  {
    uint64_t v13 = a1;
    dispatch_once(&qword_100219EF8, &stru_1001E8A50);
    a1 = v13;
  }

  if (!qword_100219F00)
  {
    uint64_t v10 = "unable to create framework queue";
    goto LABEL_13;
  }

  block[0] = _NSConcreteStackBlock;
  block[1] = 0x40000000LL;
  block[2] = sub_10014E50C;
  block[3] = &unk_1001E84A8;
  void block[4] = &v19;
  void block[5] = &v15;
  block[6] = &v27;
  void block[7] = &v23;
  block[8] = a1;
  dispatch_sync((dispatch_queue_t)qword_100219F00, block);
  if (*((_BYTE *)v20 + 24))
  {
    *((_BYTE *)v20 + 24) = v16[3] == 2001;
    *a2 = *((_DWORD *)v28 + 6);
    *a3 = *((_DWORD *)v24 + 6);
  }

void sub_10014E50C( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (sub_10014D270(*(_BYTE **)(a1 + 64), a2, a3, a4, a5, a6, a7, a8))
  {
    uint64_t v27 = *(void *)(a1 + 64);
    uint64_t v16 = "invalid client %p";
LABEL_3:
    NETRBErrorLog((uint64_t)v16, v9, v10, v11, v12, v13, v14, v15, v27);
    *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = 0;
    return;
  }

  xpc_object_t v17 = xpc_dictionary_create(0LL, 0LL, 0LL);
  if (!v17)
  {
    uint64_t v16 = "xpc_dictionary_create() failed";
    goto LABEL_3;
  }

  uint64_t v18 = v17;
  xpc_dictionary_set_uint64(v17, off_100219628, 0x3EBuLL);
  xpc_dictionary_set_string(v18, off_100219630, (const char *)(*(void *)(a1 + 64) + 32LL));
  NETRBInfoLog((uint64_t)"client %p xpc send -> get state", v19, v20, v21, v22, v23, v24, v25, *(void *)(a1 + 64));
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 0x40000000LL;
  v28[2] = sub_10014E624;
  v28[3] = &unk_1001E8480;
  __int128 v26 = *(_OWORD *)(a1 + 56);
  __int128 v29 = *(_OWORD *)(a1 + 40);
  __int128 v30 = v26;
  *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = NETRBXPCSetupAndSend(0LL, v18, (uint64_t)v28);
  xpc_release(v18);
}

uint64_t sub_10014E624( void *a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t result = NETRBInfoLog( (uint64_t)"client %p get state xpc response received",  (uint64_t)a2,  a3,  a4,  a5,  a6,  a7,  a8,  a1[7]);
  if (a2)
  {
    uint64_t result = xpc_dictionary_get_uint64(a2, off_100219688);
    *(void *)(*(void *)(a1[4] + 8LL) + 24LL) = result;
    if (*(void *)(*(void *)(a1[4] + 8LL) + 24LL) == 2001LL)
    {
      *(_DWORD *)(*(void *)(a1[5] + 8LL) + 24LL) = xpc_dictionary_get_uint64(a2, off_1002196A8);
      uint64_t result = xpc_dictionary_get_uint64(a2, off_1002196B8);
      *(_DWORD *)(*(void *)(a1[6] + 8LL) + 24LL) = result;
    }
  }

  return result;
}

uint64_t _NETRBClientSetGlobalServiceState( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v20 = 0LL;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x2000000000LL;
  char v23 = 0;
  uint64_t v16 = 0LL;
  xpc_object_t v17 = &v16;
  uint64_t v18 = 0x2000000000LL;
  uint64_t v19 = 2000LL;
  if (!a1)
  {
    uint64_t v9 = "client handle cannot be NULL";
LABEL_11:
    NETRBErrorLog((uint64_t)v9, a2, a3, a4, a5, a6, a7, a8, v13);
    goto LABEL_12;
  }

  int v8 = a2;
  if ((a2 - 1024) <= 0xFFFFFFFB)
  {
    NETRBErrorLog((uint64_t)"incorrect state %d", a2, a3, a4, a5, a6, a7, a8, a2);
    goto LABEL_12;
  }

  if (qword_100219EF8 != -1) {
    dispatch_once(&qword_100219EF8, &stru_1001E8A50);
  }
  if (!qword_100219F00)
  {
    uint64_t v9 = "unable to create framework queue";
    goto LABEL_11;
  }

  block[0] = _NSConcreteStackBlock;
  block[1] = 0x40000000LL;
  block[2] = sub_10014E828;
  block[3] = &unk_1001E84F8;
  int v15 = v8;
  void block[4] = &v20;
  void block[5] = &v16;
  block[6] = a1;
  dispatch_sync((dispatch_queue_t)qword_100219F00, block);
  if (*((_BYTE *)v21 + 24)) {
    *((_BYTE *)v21 + 24) = v17[3] == 2001;
  }
LABEL_12:
  uint64_t v11 = *((unsigned __int8 *)v21 + 24);
  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v20, 8);
  return v11;
}

void sub_10014E828( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (sub_10014D270(*(_BYTE **)(a1 + 48), a2, a3, a4, a5, a6, a7, a8))
  {
    uint64_t v26 = *(void *)(a1 + 48);
    uint64_t v16 = "invalid client %p";
LABEL_3:
    NETRBErrorLog((uint64_t)v16, v9, v10, v11, v12, v13, v14, v15, v26);
    *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = 0;
    return;
  }

  xpc_object_t v17 = xpc_dictionary_create(0LL, 0LL, 0LL);
  if (!v17)
  {
    uint64_t v16 = "xpc_dictionary_create() failed";
    goto LABEL_3;
  }

  uint64_t v18 = v17;
  xpc_dictionary_set_uint64(v17, off_100219628, 0x3ECuLL);
  xpc_dictionary_set_string(v18, off_100219630, (const char *)(*(void *)(a1 + 48) + 32LL));
  xpc_dictionary_set_uint64(v18, off_1002196A8, *(unsigned int *)(a1 + 56));
  NETRBInfoLog((uint64_t)"client %p xpc send -> set state", v19, v20, v21, v22, v23, v24, v25, *(void *)(a1 + 48));
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 0x40000000LL;
  v27[2] = sub_10014E954;
  v27[3] = &unk_1001E84D0;
  __int128 v28 = *(_OWORD *)(a1 + 40);
  *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = NETRBXPCSetupAndSend(0LL, v18, (uint64_t)v27);
  xpc_release(v18);
}

uint64_t sub_10014E954( uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t result = NETRBInfoLog( (uint64_t)"client %p set state xpc response received",  (uint64_t)a2,  a3,  a4,  a5,  a6,  a7,  a8,  *(void *)(a1 + 40));
  if (a2)
  {
    uint64_t result = xpc_dictionary_get_uint64(a2, off_100219688);
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = result;
  }

  return result;
}

uint64_t _NETRBClientGetExtName( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v18 = 0LL;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x2000000000LL;
  char v21 = 0;
  uint64_t v14 = 0LL;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x2000000000LL;
  uint64_t v17 = 2000LL;
  if (!a1)
  {
    uint64_t v10 = "client handle cannot be NULL";
LABEL_11:
    NETRBErrorLog((uint64_t)v10, a2, a3, a4, a5, a6, a7, a8, v13[0]);
    goto LABEL_12;
  }

  if (!a2)
  {
    uint64_t v10 = "external name cannot be NULL";
    goto LABEL_11;
  }

  if (qword_100219EF8 != -1) {
    dispatch_once(&qword_100219EF8, &stru_1001E8A50);
  }
  if (!qword_100219F00)
  {
    uint64_t v10 = "unable to create framework queue";
    goto LABEL_11;
  }

  v13[0] = (uint64_t)_NSConcreteStackBlock;
  v13[1] = 0x40000000LL;
  v13[2] = (uint64_t)sub_10014EAF4;
  v13[3] = (uint64_t)&unk_1001E8548;
  void v13[4] = (uint64_t)&v18;
  v13[5] = (uint64_t)&v14;
  uint64_t v13[6] = a1;
  v13[7] = a2;
  dispatch_sync((dispatch_queue_t)qword_100219F00, v13);
  if (*((_BYTE *)v19 + 24)) {
    *((_BYTE *)v19 + 24) = v15[3] == 2001;
  }
LABEL_12:
  uint64_t v11 = *((unsigned __int8 *)v19 + 24);
  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v18, 8);
  return v11;
}

void sub_10014EAF4( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (sub_10014D270(*(_BYTE **)(a1 + 48), a2, a3, a4, a5, a6, a7, a8))
  {
    uint64_t v26 = *(void *)(a1 + 48);
    uint64_t v16 = "invalid client %p";
LABEL_3:
    NETRBErrorLog((uint64_t)v16, v9, v10, v11, v12, v13, v14, v15, v26);
    *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = 0;
    return;
  }

  xpc_object_t v17 = xpc_dictionary_create(0LL, 0LL, 0LL);
  if (!v17)
  {
    uint64_t v16 = "xpc_dictionary_create() failed";
    goto LABEL_3;
  }

  uint64_t v18 = v17;
  xpc_dictionary_set_uint64(v17, off_100219628, 0x3F5uLL);
  xpc_dictionary_set_string(v18, off_100219630, (const char *)(*(void *)(a1 + 48) + 32LL));
  NETRBInfoLog( (uint64_t)"client %p xpc send -> get external name",  v19,  v20,  v21,  v22,  v23,  v24,  v25,  *(void *)(a1 + 48));
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 0x40000000LL;
  v27[2] = sub_10014EC10;
  v27[3] = &unk_1001E8520;
  __int128 v28 = *(_OWORD *)(a1 + 40);
  uint64_t v29 = *(void *)(a1 + 56);
  *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = NETRBXPCSetupAndSend(0LL, v18, (uint64_t)v27);
  xpc_release(v18);
}

uint64_t sub_10014EC10( void *a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t result = NETRBInfoLog( (uint64_t)"client %p get external name xpc response received",  (uint64_t)a2,  a3,  a4,  a5,  a6,  a7,  a8,  a1[5]);
  if (a2)
  {
    uint64_t result = xpc_dictionary_get_uint64(a2, off_100219688);
    *(void *)(*(void *)(a1[4] + 8LL) + 24LL) = result;
    if (*(void *)(*(void *)(a1[4] + 8LL) + 24LL) == 2001LL)
    {
      uint64_t v11 = (char *)a1[6];
      string = xpc_dictionary_get_string(a2, off_1002196B0);
      return snprintf(v11, 0x10uLL, "%s", string);
    }
  }

  return result;
}

void *_NETRBClientCopyFixtureForwardedPorts( void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v8 = a1;
  uint64_t v32 = 0LL;
  uint64_t v33 = &v32;
  uint64_t v34 = 0x2000000000LL;
  __int16 v35 = 0;
  uint64_t v28 = 0LL;
  uint64_t v29 = &v28;
  uint64_t v30 = 0x2000000000LL;
  __int16 v31 = 0;
  uint64_t v24 = 0LL;
  uint64_t v25 = &v24;
  uint64_t v26 = 0x2000000000LL;
  char v27 = 0;
  uint64_t v20 = 0LL;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x2000000000LL;
  uint64_t v23 = 2000LL;
  if (!a1)
  {
    NETRBErrorLog((uint64_t)"client handle cannot be NULL", a2, a3, a4, a5, a6, a7, a8, v18);
    goto LABEL_12;
  }

  if (qword_100219EF8 != -1) {
    dispatch_once(&qword_100219EF8, &stru_1001E8A50);
  }
  if (!qword_100219F00)
  {
    NETRBErrorLog((uint64_t)"unable to create framework queue", a2, a3, a4, a5, a6, a7, a8, v18);
LABEL_11:
    int v8 = 0LL;
    goto LABEL_12;
  }

  block[0] = _NSConcreteStackBlock;
  block[1] = 0x40000000LL;
  block[2] = sub_10014EE80;
  block[3] = &unk_1001E8598;
  void block[4] = &v24;
  void block[5] = &v20;
  block[6] = &v32;
  void block[7] = &v28;
  block[8] = v8;
  dispatch_sync((dispatch_queue_t)qword_100219F00, block);
  if (!*((_BYTE *)v25 + 24) || v21[3] != 2001) {
    goto LABEL_11;
  }
  xpc_object_t v9 = xpc_dictionary_create(0LL, 0LL, 0LL);
  int v8 = v9;
  if (v9)
  {
    xpc_dictionary_set_uint64(v9, netrbClientForwardedLowPort, *((unsigned __int16 *)v33 + 12));
    xpc_dictionary_set_uint64(v8, netrbClientForwardedHighPort, *((unsigned __int16 *)v29 + 12));
  }

  else
  {
    NETRBErrorLog((uint64_t)"xpc_dictionary_create() failed", v10, v11, v12, v13, v14, v15, v16, v18);
    *((_BYTE *)v25 + 24) = 0;
  }

void sub_10014EE80( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (sub_10014D270(*(_BYTE **)(a1 + 64), a2, a3, a4, a5, a6, a7, a8))
  {
    uint64_t v27 = *(void *)(a1 + 64);
    uint64_t v16 = "invalid client %p";
LABEL_3:
    NETRBErrorLog((uint64_t)v16, v9, v10, v11, v12, v13, v14, v15, v27);
    *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = 0;
    return;
  }

  xpc_object_t v17 = xpc_dictionary_create(0LL, 0LL, 0LL);
  if (!v17)
  {
    uint64_t v16 = "xpc_dictionary_create() failed";
    goto LABEL_3;
  }

  uint64_t v18 = v17;
  xpc_dictionary_set_uint64(v17, off_100219628, 0x3EDuLL);
  xpc_dictionary_set_string(v18, off_100219630, (const char *)(*(void *)(a1 + 64) + 32LL));
  NETRBInfoLog( (uint64_t)"client %p xpc send -> get forwarded ports",  v19,  v20,  v21,  v22,  v23,  v24,  v25,  *(void *)(a1 + 64));
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 0x40000000LL;
  v28[2] = sub_10014EF98;
  v28[3] = &unk_1001E8570;
  __int128 v26 = *(_OWORD *)(a1 + 56);
  __int128 v29 = *(_OWORD *)(a1 + 40);
  __int128 v30 = v26;
  *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = NETRBXPCSetupAndSend(0LL, v18, (uint64_t)v28);
  xpc_release(v18);
}

uint64_t sub_10014EF98( void *a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t result = NETRBInfoLog( (uint64_t)"client %p get forwarded ports xpc response received",  (uint64_t)a2,  a3,  a4,  a5,  a6,  a7,  a8,  a1[7]);
  if (a2)
  {
    uint64_t result = xpc_dictionary_get_uint64(a2, off_100219688);
    *(void *)(*(void *)(a1[4] + 8LL) + 24LL) = result;
    if (*(void *)(*(void *)(a1[4] + 8LL) + 24LL) == 2001LL)
    {
      *(_WORD *)(*(void *)(a1[5] + 8LL) + 24LL) = xpc_dictionary_get_uint64(a2, off_1002196C0);
      uint64_t result = xpc_dictionary_get_uint64(a2, off_1002196C8);
      *(_WORD *)(*(void *)(a1[6] + 8LL) + 24LL) = result;
    }
  }

  return result;
}

uint64_t _NETRBClientSetFixtureForwardedPorts( uint64_t a1, xpc_object_t object, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v18 = 0LL;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x2000000000LL;
  char v21 = 0;
  uint64_t v14 = 0LL;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x2000000000LL;
  uint64_t v17 = 2000LL;
  if (!a1)
  {
    uint64_t v10 = "client handle cannot be NULL";
    goto LABEL_6;
  }

  if (!object || xpc_get_type(object) != (xpc_type_t)&_xpc_type_dictionary)
  {
    uint64_t v10 = "forwarded ports should be a xpc dictionary";
LABEL_6:
    NETRBErrorLog((uint64_t)v10, (uint64_t)object, a3, a4, a5, a6, a7, a8, v13[0]);
    goto LABEL_7;
  }

  if (qword_100219EF8 != -1) {
    dispatch_once(&qword_100219EF8, &stru_1001E8A50);
  }
  if (!qword_100219F00)
  {
    uint64_t v10 = "unable to create framework queue";
    goto LABEL_6;
  }

  v13[0] = (uint64_t)_NSConcreteStackBlock;
  v13[1] = 0x40000000LL;
  v13[2] = (uint64_t)sub_10014F1A4;
  v13[3] = (uint64_t)&unk_1001E85E8;
  uint64_t v13[6] = a1;
  v13[7] = (uint64_t)object;
  void v13[4] = (uint64_t)&v18;
  v13[5] = (uint64_t)&v14;
  dispatch_sync((dispatch_queue_t)qword_100219F00, v13);
  if (*((_BYTE *)v19 + 24)) {
    *((_BYTE *)v19 + 24) = v15[3] == 2001;
  }
LABEL_7:
  uint64_t v11 = *((unsigned __int8 *)v19 + 24);
  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v18, 8);
  return v11;
}

void sub_10014F1A4( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (sub_10014D270(*(_BYTE **)(a1 + 48), a2, a3, a4, a5, a6, a7, a8))
  {
    uint64_t v30 = *(void *)(a1 + 48);
    uint64_t v16 = "invalid client %p";
LABEL_3:
    NETRBErrorLog((uint64_t)v16, v9, v10, v11, v12, v13, v14, v15, v30);
    *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = 0;
    return;
  }

  xpc_object_t v17 = xpc_dictionary_create(0LL, 0LL, 0LL);
  if (!v17)
  {
    uint64_t v16 = "xpc_dictionary_create() failed";
    goto LABEL_3;
  }

  uint64_t v18 = v17;
  xpc_dictionary_set_uint64(v17, off_100219628, 0x3EEuLL);
  xpc_dictionary_set_string(v18, off_100219630, (const char *)(*(void *)(a1 + 48) + 32LL));
  uint64_t v19 = off_1002196C0;
  uint64_t uint64 = xpc_dictionary_get_uint64(*(xpc_object_t *)(a1 + 56), netrbClientForwardedLowPort);
  xpc_dictionary_set_uint64(v18, v19, uint64);
  char v21 = off_1002196C8;
  uint64_t v22 = xpc_dictionary_get_uint64(*(xpc_object_t *)(a1 + 56), netrbClientForwardedHighPort);
  xpc_dictionary_set_uint64(v18, v21, v22);
  NETRBInfoLog( (uint64_t)"client %p xpc send -> set forwarded ports",  v23,  v24,  v25,  v26,  v27,  v28,  v29,  *(void *)(a1 + 48));
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 0x40000000LL;
  v31[2] = sub_10014F318;
  v31[3] = &unk_1001E85C0;
  __int128 v32 = *(_OWORD *)(a1 + 40);
  *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = NETRBXPCSetupAndSend(0LL, v18, (uint64_t)v31);
  xpc_release(v18);
}

uint64_t sub_10014F318( uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t result = NETRBInfoLog( (uint64_t)"client %p set forwarded ports xpc response received",  (uint64_t)a2,  a3,  a4,  a5,  a6,  a7,  a8,  *(void *)(a1 + 40));
  if (a2)
  {
    uint64_t result = xpc_dictionary_get_uint64(a2, off_100219688);
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = result;
  }

  return result;
}

uint64_t _NETRBClientIsAllowedMoreHost( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v18 = 0LL;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x2000000000LL;
  char v21 = 0;
  uint64_t v14 = 0LL;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x2000000000LL;
  uint64_t v17 = 2000LL;
  if (!a1)
  {
    uint64_t v9 = "client handle cannot be NULL";
LABEL_9:
    NETRBErrorLog((uint64_t)v9, a2, a3, a4, a5, a6, a7, a8, v12);
    goto LABEL_10;
  }

  if (qword_100219EF8 != -1) {
    dispatch_once(&qword_100219EF8, &stru_1001E8A50);
  }
  if (!qword_100219F00)
  {
    uint64_t v9 = "unable to create framework queue";
    goto LABEL_9;
  }

  block[0] = _NSConcreteStackBlock;
  block[1] = 0x40000000LL;
  block[2] = sub_10014F4A4;
  block[3] = &unk_1001E8638;
  void block[4] = &v18;
  void block[5] = &v14;
  block[6] = a1;
  dispatch_sync((dispatch_queue_t)qword_100219F00, block);
  if (*((_BYTE *)v19 + 24)) {
    *((_BYTE *)v19 + 24) = v15[3] == 2001;
  }
LABEL_10:
  uint64_t v10 = *((unsigned __int8 *)v19 + 24);
  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v18, 8);
  return v10;
}

void sub_10014F4A4( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (sub_10014D270(*(_BYTE **)(a1 + 48), a2, a3, a4, a5, a6, a7, a8))
  {
    uint64_t v26 = *(void *)(a1 + 48);
    uint64_t v16 = "invalid client %p";
LABEL_3:
    NETRBErrorLog((uint64_t)v16, v9, v10, v11, v12, v13, v14, v15, v26);
    *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = 0;
    return;
  }

  xpc_object_t v17 = xpc_dictionary_create(0LL, 0LL, 0LL);
  if (!v17)
  {
    uint64_t v16 = "xpc_dictionary_create() failed";
    goto LABEL_3;
  }

  uint64_t v18 = v17;
  xpc_dictionary_set_uint64(v17, off_100219628, 0x3EFuLL);
  xpc_dictionary_set_string(v18, off_100219630, (const char *)(*(void *)(a1 + 48) + 32LL));
  NETRBInfoLog( (uint64_t)"client %p xpc send -> allowed more host",  v19,  v20,  v21,  v22,  v23,  v24,  v25,  *(void *)(a1 + 48));
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 0x40000000LL;
  v27[2] = sub_10014F5B8;
  v27[3] = &unk_1001E8610;
  __int128 v28 = *(_OWORD *)(a1 + 40);
  *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = NETRBXPCSetupAndSend(0LL, v18, (uint64_t)v27);
  xpc_release(v18);
}

uint64_t sub_10014F5B8( uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t result = NETRBInfoLog( (uint64_t)"client %p allowed more host xpc response received",  (uint64_t)a2,  a3,  a4,  a5,  a6,  a7,  a8,  *(void *)(a1 + 40));
  if (a2)
  {
    uint64_t result = xpc_dictionary_get_uint64(a2, off_100219688);
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = result;
  }

  return result;
}

uint64_t _NETRBClientAddHost(uint64_t a1, unsigned int a2)
{
  xpc_object_t v4 = xpc_dictionary_create(0LL, 0LL, 0LL);
  if (v4)
  {
    uint64_t v12 = v4;
    xpc_dictionary_set_uint64(v4, netrbClientHostIftype, a2);
    xpc_dictionary_set_uint64(v12, netrbClientHostDeviceId, 0xFFFFFFFFuLL);
    uint64_t v19 = _NETRBClientAddHostExt(a1, v12, v13, v14, v15, v16, v17, v18);
    xpc_release(v12);
    return v19;
  }

  else
  {
    NETRBErrorLog((uint64_t)"failed to create xpc dictionary for add host.", v5, v6, v7, v8, v9, v10, v11, v21);
    return 0LL;
  }

uint64_t _NETRBClientAddHostExt( uint64_t a1, xpc_object_t object, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v35 = 0LL;
  uint64_t v36 = &v35;
  uint64_t v37 = 0x2000000000LL;
  char v38 = 0;
  uint64_t v31 = 0LL;
  __int128 v32 = &v31;
  uint64_t v33 = 0x2000000000LL;
  uint64_t v34 = 2000LL;
  if (!object || xpc_get_type(object) != (xpc_type_t)&_xpc_type_dictionary)
  {
    uint64_t v10 = "request is not dictionary object";
LABEL_4:
    NETRBErrorLog((uint64_t)v10, (uint64_t)object, a3, a4, a5, a6, a7, a8, v28);
    *((_BYTE *)v36 + 24) = 0;
    goto LABEL_5;
  }

  xpc_object_t value = xpc_dictionary_get_value(object, netrbClientHostIftype);
  if (!value || (uint64_t v14 = value, xpc_get_type(value) != (xpc_type_t)&_xpc_type_uint64))
  {
    uint64_t v10 = "netrbIftype does not exist in request.";
    goto LABEL_4;
  }

  uint64_t v15 = xpc_uint64_get_value(v14);
  xpc_object_t v16 = xpc_dictionary_get_value(object, netrbClientHostDeviceId);
  if (!v16 || (uint64_t v17 = v16, xpc_get_type(v16) != (xpc_type_t)&_xpc_type_uint64))
  {
    uint64_t v10 = "device ID does not exist in request.";
    goto LABEL_4;
  }

  uint64_t v18 = xpc_uint64_get_value(v17);
  if (!a1)
  {
    uint64_t v26 = "client handle cannot be NULL";
LABEL_22:
    NETRBErrorLog((uint64_t)v26, v19, v20, v21, v22, v23, v24, v25, v28);
    goto LABEL_5;
  }

  if ((v15 - 7) <= 0xFFFFFFFA)
  {
    NETRBErrorLog((uint64_t)"incorrect device type value %d", v19, v20, v21, v22, v23, v24, v25, v15);
    goto LABEL_5;
  }

  uint64_t v27 = v18;
  if (qword_100219EF8 != -1) {
    dispatch_once(&qword_100219EF8, &stru_1001E8A50);
  }
  if (!qword_100219F00)
  {
    uint64_t v26 = "unable to create framework queue";
    goto LABEL_22;
  }

  block[0] = _NSConcreteStackBlock;
  block[1] = 0x40000000LL;
  block[2] = sub_10014F8B8;
  block[3] = &unk_1001E8688;
  int v30 = v15;
  block[6] = a1;
  void block[7] = v27;
  void block[4] = &v35;
  void block[5] = &v31;
  dispatch_sync((dispatch_queue_t)qword_100219F00, block);
  if (*((_BYTE *)v36 + 24)) {
    *((_BYTE *)v36 + 24) = v32[3] == 2001;
  }
LABEL_5:
  uint64_t v11 = *((unsigned __int8 *)v36 + 24);
  _Block_object_dispose(&v31, 8);
  _Block_object_dispose(&v35, 8);
  return v11;
}

void sub_10014F8B8( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (sub_10014D270(*(_BYTE **)(a1 + 48), a2, a3, a4, a5, a6, a7, a8))
  {
    uint64_t v26 = *(void *)(a1 + 48);
    xpc_object_t v16 = "invalid client %p";
LABEL_3:
    NETRBErrorLog((uint64_t)v16, v9, v10, v11, v12, v13, v14, v15, v26);
    *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = 0;
    return;
  }

  xpc_object_t v17 = xpc_dictionary_create(0LL, 0LL, 0LL);
  if (!v17)
  {
    xpc_object_t v16 = "xpc_dictionary_create() failed";
    goto LABEL_3;
  }

  uint64_t v18 = v17;
  xpc_dictionary_set_uint64(v17, off_100219628, 0x3F0uLL);
  xpc_dictionary_set_string(v18, off_100219630, (const char *)(*(void *)(a1 + 48) + 32LL));
  xpc_dictionary_set_uint64(v18, off_1002196D0, *(unsigned int *)(a1 + 64));
  xpc_dictionary_set_uint64(v18, off_100219708, *(void *)(a1 + 56));
  NETRBInfoLog((uint64_t)"client %p xpc send -> add host", v19, v20, v21, v22, v23, v24, v25, *(void *)(a1 + 48));
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 0x40000000LL;
  v27[2] = sub_10014F9FC;
  v27[3] = &unk_1001E8660;
  __int128 v28 = *(_OWORD *)(a1 + 40);
  *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = NETRBXPCSetupAndSend(0LL, v18, (uint64_t)v27);
  xpc_release(v18);
}

uint64_t sub_10014F9FC( uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t result = NETRBInfoLog( (uint64_t)"client %p add host xpc response received",  (uint64_t)a2,  a3,  a4,  a5,  a6,  a7,  a8,  *(void *)(a1 + 40));
  if (a2)
  {
    uint64_t result = xpc_dictionary_get_uint64(a2, off_100219688);
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = result;
  }

  return result;
}

uint64_t _NETRBClientRemoveHostExt( uint64_t a1, xpc_object_t object, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v35 = 0LL;
  uint64_t v36 = &v35;
  uint64_t v37 = 0x2000000000LL;
  char v38 = 0;
  uint64_t v31 = 0LL;
  __int128 v32 = &v31;
  uint64_t v33 = 0x2000000000LL;
  uint64_t v34 = 2000LL;
  if (!object || xpc_get_type(object) != (xpc_type_t)&_xpc_type_dictionary)
  {
    uint64_t v10 = "request is not dictionary object";
LABEL_4:
    NETRBErrorLog((uint64_t)v10, (uint64_t)object, a3, a4, a5, a6, a7, a8, v28);
    *((_BYTE *)v36 + 24) = 0;
    goto LABEL_5;
  }

  xpc_object_t value = xpc_dictionary_get_value(object, netrbClientHostIftype);
  if (!value || (uint64_t v14 = value, xpc_get_type(value) != (xpc_type_t)&_xpc_type_uint64))
  {
    uint64_t v10 = "netrbIftype does not exist in request.";
    goto LABEL_4;
  }

  uint64_t v15 = xpc_uint64_get_value(v14);
  xpc_object_t v16 = xpc_dictionary_get_value(object, netrbClientHostDeviceId);
  if (!v16 || (xpc_object_t v17 = v16, xpc_get_type(v16) != (xpc_type_t)&_xpc_type_uint64))
  {
    uint64_t v10 = "device ID does not exist in request.";
    goto LABEL_4;
  }

  uint64_t v18 = xpc_uint64_get_value(v17);
  if (!a1)
  {
    uint64_t v26 = "client handle cannot be NULL";
LABEL_22:
    NETRBErrorLog((uint64_t)v26, v19, v20, v21, v22, v23, v24, v25, v28);
    goto LABEL_5;
  }

  if ((v15 - 7) <= 0xFFFFFFFA)
  {
    NETRBErrorLog((uint64_t)"incorrect device type value %d", v19, v20, v21, v22, v23, v24, v25, v15);
    goto LABEL_5;
  }

  uint64_t v27 = v18;
  if (qword_100219EF8 != -1) {
    dispatch_once(&qword_100219EF8, &stru_1001E8A50);
  }
  if (!qword_100219F00)
  {
    uint64_t v26 = "unable to create framework queue";
    goto LABEL_22;
  }

  block[0] = _NSConcreteStackBlock;
  block[1] = 0x40000000LL;
  block[2] = sub_10014FC68;
  block[3] = &unk_1001E86D8;
  int v30 = v15;
  block[6] = a1;
  void block[7] = v27;
  void block[4] = &v35;
  void block[5] = &v31;
  dispatch_sync((dispatch_queue_t)qword_100219F00, block);
  if (*((_BYTE *)v36 + 24)) {
    *((_BYTE *)v36 + 24) = v32[3] == 2001;
  }
LABEL_5:
  uint64_t v11 = *((unsigned __int8 *)v36 + 24);
  _Block_object_dispose(&v31, 8);
  _Block_object_dispose(&v35, 8);
  return v11;
}

void sub_10014FC68( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (sub_10014D270(*(_BYTE **)(a1 + 48), a2, a3, a4, a5, a6, a7, a8))
  {
    uint64_t v26 = *(void *)(a1 + 48);
    xpc_object_t v16 = "invalid client %p";
LABEL_3:
    NETRBErrorLog((uint64_t)v16, v9, v10, v11, v12, v13, v14, v15, v26);
    *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = 0;
    return;
  }

  xpc_object_t v17 = xpc_dictionary_create(0LL, 0LL, 0LL);
  if (!v17)
  {
    xpc_object_t v16 = "xpc_dictionary_create() failed";
    goto LABEL_3;
  }

  uint64_t v18 = v17;
  xpc_dictionary_set_uint64(v17, off_100219628, 0x3F1uLL);
  xpc_dictionary_set_string(v18, off_100219630, (const char *)(*(void *)(a1 + 48) + 32LL));
  xpc_dictionary_set_uint64(v18, off_1002196D0, *(unsigned int *)(a1 + 64));
  xpc_dictionary_set_uint64(v18, off_100219700, *(void *)(a1 + 56));
  NETRBInfoLog((uint64_t)"client %p xpc send -> remove host", v19, v20, v21, v22, v23, v24, v25, *(void *)(a1 + 48));
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 0x40000000LL;
  v27[2] = sub_10014FDAC;
  v27[3] = &unk_1001E86B0;
  __int128 v28 = *(_OWORD *)(a1 + 40);
  *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = NETRBXPCSetupAndSend(0LL, v18, (uint64_t)v27);
  xpc_release(v18);
}

uint64_t sub_10014FDAC( uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t result = NETRBInfoLog( (uint64_t)"client %p remove host xpc response received",  (uint64_t)a2,  a3,  a4,  a5,  a6,  a7,  a8,  *(void *)(a1 + 40));
  if (a2)
  {
    uint64_t result = xpc_dictionary_get_uint64(a2, off_100219688);
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = result;
  }

  return result;
}

uint64_t _NETRBClientRemoveHost(uint64_t a1, unsigned int a2)
{
  xpc_object_t v4 = xpc_dictionary_create(0LL, 0LL, 0LL);
  if (v4)
  {
    uint64_t v12 = v4;
    xpc_dictionary_set_uint64(v4, netrbClientHostIftype, a2);
    xpc_dictionary_set_uint64(v12, netrbClientHostDeviceId, 0xFFFFFFFFuLL);
    uint64_t v19 = _NETRBClientRemoveHostExt(a1, v12, v13, v14, v15, v16, v17, v18);
    xpc_release(v12);
    return v19;
  }

  else
  {
    NETRBErrorLog((uint64_t)"failed to create xpc dictionary for remove host.", v5, v6, v7, v8, v9, v10, v11, v21);
    return 0LL;
  }

uint64_t _NETRBClientGetHostCount( uint64_t a1, _DWORD *a2, _DWORD *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v27 = 0LL;
  __int128 v28 = &v27;
  uint64_t v29 = 0x2000000000LL;
  int v30 = 0;
  uint64_t v23 = 0LL;
  uint64_t v24 = &v23;
  uint64_t v25 = 0x2000000000LL;
  int v26 = 0;
  uint64_t v19 = 0LL;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x2000000000LL;
  char v22 = 0;
  uint64_t v15 = 0LL;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x2000000000LL;
  uint64_t v18 = 2000LL;
  if (!a1)
  {
    uint64_t v10 = "client handle cannot be NULL";
LABEL_13:
    NETRBErrorLog((uint64_t)v10, (uint64_t)a2, (uint64_t)a3, a4, a5, a6, a7, a8, v13);
    goto LABEL_14;
  }

  if (!a2)
  {
    uint64_t v10 = "max cannot be NULL";
    goto LABEL_13;
  }

  if (!a3)
  {
    uint64_t v10 = "current cannot be NULL";
    goto LABEL_13;
  }

  if (qword_100219EF8 != -1)
  {
    uint64_t v13 = a1;
    dispatch_once(&qword_100219EF8, &stru_1001E8A50);
    a1 = v13;
  }

  if (!qword_100219F00)
  {
    uint64_t v10 = "unable to create framework queue";
    goto LABEL_13;
  }

  block[0] = _NSConcreteStackBlock;
  block[1] = 0x40000000LL;
  block[2] = sub_10015005C;
  block[3] = &unk_1001E8728;
  void block[4] = &v19;
  void block[5] = &v15;
  block[6] = &v27;
  void block[7] = &v23;
  void block[8] = a1;
  dispatch_sync((dispatch_queue_t)qword_100219F00, block);
  if (*((_BYTE *)v20 + 24))
  {
    *((_BYTE *)v20 + 24) = v16[3] == 2001;
    *a2 = *((_DWORD *)v28 + 6);
    *a3 = *((_DWORD *)v24 + 6);
  }

void sub_10015005C( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (sub_10014D270(*(_BYTE **)(a1 + 64), a2, a3, a4, a5, a6, a7, a8))
  {
    uint64_t v27 = *(void *)(a1 + 64);
    uint64_t v16 = "invalid client %p";
LABEL_3:
    NETRBErrorLog((uint64_t)v16, v9, v10, v11, v12, v13, v14, v15, v27);
    *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = 0;
    return;
  }

  xpc_object_t v17 = xpc_dictionary_create(0LL, 0LL, 0LL);
  if (!v17)
  {
    uint64_t v16 = "xpc_dictionary_create() failed";
    goto LABEL_3;
  }

  uint64_t v18 = v17;
  xpc_dictionary_set_uint64(v17, off_100219628, 0x3F2uLL);
  xpc_dictionary_set_string(v18, off_100219630, (const char *)(*(void *)(a1 + 64) + 32LL));
  NETRBInfoLog((uint64_t)"client %p xpc send -> get host count", v19, v20, v21, v22, v23, v24, v25, *(void *)(a1 + 64));
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 0x40000000LL;
  v28[2] = sub_100150174;
  v28[3] = &unk_1001E8700;
  __int128 v26 = *(_OWORD *)(a1 + 56);
  __int128 v29 = *(_OWORD *)(a1 + 40);
  __int128 v30 = v26;
  *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = NETRBXPCSetupAndSend(0LL, v18, (uint64_t)v28);
  xpc_release(v18);
}

uint64_t sub_100150174( void *a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t result = NETRBInfoLog( (uint64_t)"client %p get host count xpc response received",  (uint64_t)a2,  a3,  a4,  a5,  a6,  a7,  a8,  a1[7]);
  if (a2)
  {
    uint64_t result = xpc_dictionary_get_uint64(a2, off_100219688);
    *(void *)(*(void *)(a1[4] + 8LL) + 24LL) = result;
    if (*(void *)(*(void *)(a1[4] + 8LL) + 24LL) == 2001LL)
    {
      *(_DWORD *)(*(void *)(a1[5] + 8LL) + 24LL) = xpc_dictionary_get_uint64(a2, off_1002196D8);
      uint64_t result = xpc_dictionary_get_uint64(a2, off_1002196E0);
      *(_DWORD *)(*(void *)(a1[6] + 8LL) + 24LL) = result;
    }
  }

  return result;
}

uint64_t _NETRBClientSetHostCount( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v22 = 0LL;
  uint64_t v23 = &v22;
  uint64_t v24 = 0x2000000000LL;
  char v25 = 0;
  uint64_t v18 = 0LL;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x2000000000LL;
  uint64_t v21 = 2000LL;
  if (!a1)
  {
    uint64_t v9 = "client handle cannot be NULL";
LABEL_11:
    NETRBErrorLog((uint64_t)v9, a2, a3, a4, a5, a6, a7, a8, v14);
    goto LABEL_12;
  }

  int v8 = a2;
  if ((a2 - 7) <= 0xFFFFFFFA)
  {
    NETRBErrorLog((uint64_t)"incorrect device type value %d", a2, a3, a4, a5, a6, a7, a8, a2);
    goto LABEL_12;
  }

  int v10 = a3;
  if (qword_100219EF8 != -1) {
    dispatch_once(&qword_100219EF8, &stru_1001E8A50);
  }
  if (!qword_100219F00)
  {
    uint64_t v9 = "unable to create framework queue";
    goto LABEL_11;
  }

  block[0] = _NSConcreteStackBlock;
  block[1] = 0x40000000LL;
  block[2] = sub_100150384;
  block[3] = &unk_1001E8778;
  int v16 = v8;
  int v17 = v10;
  void block[4] = &v22;
  void block[5] = &v18;
  block[6] = a1;
  dispatch_sync((dispatch_queue_t)qword_100219F00, block);
  if (*((_BYTE *)v23 + 24)) {
    *((_BYTE *)v23 + 24) = v19[3] == 2001;
  }
LABEL_12:
  uint64_t v12 = *((unsigned __int8 *)v23 + 24);
  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v22, 8);
  return v12;
}

void sub_100150384( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (sub_10014D270(*(_BYTE **)(a1 + 48), a2, a3, a4, a5, a6, a7, a8))
  {
    uint64_t v26 = *(void *)(a1 + 48);
    int v16 = "invalid client %p";
LABEL_3:
    NETRBErrorLog((uint64_t)v16, v9, v10, v11, v12, v13, v14, v15, v26);
    *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = 0;
    return;
  }

  xpc_object_t v17 = xpc_dictionary_create(0LL, 0LL, 0LL);
  if (!v17)
  {
    int v16 = "xpc_dictionary_create() failed";
    goto LABEL_3;
  }

  uint64_t v18 = v17;
  xpc_dictionary_set_uint64(v17, off_100219628, 0x3F3uLL);
  xpc_dictionary_set_string(v18, off_100219630, (const char *)(*(void *)(a1 + 48) + 32LL));
  xpc_dictionary_set_uint64(v18, off_1002196D0, *(unsigned int *)(a1 + 56));
  xpc_dictionary_set_uint64(v18, off_1002196E8, *(unsigned int *)(a1 + 60));
  NETRBInfoLog((uint64_t)"client %p xpc send -> set host count", v19, v20, v21, v22, v23, v24, v25, *(void *)(a1 + 48));
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 0x40000000LL;
  v27[2] = sub_1001504C8;
  v27[3] = &unk_1001E8750;
  __int128 v28 = *(_OWORD *)(a1 + 40);
  *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = NETRBXPCSetupAndSend(0LL, v18, (uint64_t)v27);
  xpc_release(v18);
}

uint64_t sub_1001504C8( uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t result = NETRBInfoLog( (uint64_t)"client %p set host count xpc response received",  (uint64_t)a2,  a3,  a4,  a5,  a6,  a7,  a8,  *(void *)(a1 + 40));
  if (a2)
  {
    uint64_t result = xpc_dictionary_get_uint64(a2, off_100219688);
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = result;
  }

  return result;
}

uint64_t _NETRBClientNewInterface( uint64_t a1, uint64_t a2, uint64_t a3, xpc_object_t xdict, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v61 = 0LL;
  uint64_t v62 = &v61;
  uint64_t v63 = 0x2000000000LL;
  char v64 = 0;
  uint64_t v57 = 0LL;
  uint64_t v58 = &v57;
  uint64_t v59 = 0x2000000000LL;
  uint64_t v60 = 0LL;
  if (!a1)
  {
    uint64_t v13 = "client handle cannot be NULL";
LABEL_41:
    NETRBErrorLog((uint64_t)v13, a2, a3, (uint64_t)xdict, a5, a6, a7, a8, (uint64_t)v42);
    goto LABEL_42;
  }

  if (xdict) {
    string = xpc_dictionary_get_string(xdict, netrbClientExternalInterface);
  }
  else {
    string = 0LL;
  }
  if ((a2 - 201) >= 3)
  {
    if ((_DWORD)a2 != 204)
    {
      NETRBErrorLog((uint64_t)"incorrect operation mode %d", a2, a3, (uint64_t)xdict, a5, a6, a7, a8, a2);
      goto LABEL_42;
    }

    if (!string || !*string)
    {
      uint64_t v13 = "interface must be specified";
      goto LABEL_41;
    }
  }

  else
  {
    if (string)
    {
      uint64_t v13 = "specifying external interface not supported";
      goto LABEL_41;
    }

    if (xdict)
    {
      int uint64 = xpc_dictionary_get_uint64(xdict, netrbClientInterfaceMTU);
      goto LABEL_17;
    }
  }

  int uint64 = 0;
LABEL_17:
  if (qword_100219EF8 != -1) {
    dispatch_once(&qword_100219EF8, &stru_1001E8A50);
  }
  uint64_t v15 = (dispatch_queue_s *)qword_100219F00;
  if (!qword_100219F00)
  {
    uint64_t v13 = "unable to create framework queue";
    goto LABEL_41;
  }

  v58[3] = (uint64_t)xpc_dictionary_create(0LL, 0LL, 0LL);
  if (!xdict)
  {
    BOOL v16 = 0;
    BOOL v17 = 0;
    BOOL v18 = 0;
    BOOL v19 = 0;
    char v20 = 1;
LABEL_55:
    block[0] = _NSConcreteStackBlock;
    block[1] = 0x40000000LL;
    block[2] = sub_1001509F0;
    block[3] = &unk_1001E87C0;
    char v52 = v20;
    block[6] = a1;
    void block[7] = a3;
    BOOL v53 = v18;
    BOOL v54 = v19;
    BOOL v55 = v17;
    BOOL v56 = v16;
    int v50 = a2;
    int v51 = uint64;
    void block[4] = &v57;
    void block[5] = &v61;
    void block[8] = string;
    void block[9] = v15;
    dispatch_sync(v15, block);
    goto LABEL_42;
  }

  if (xpc_dictionary_get_value(xdict, netrbClientAllocateMACAddress)) {
    BOOL v46 = xpc_dictionary_get_BOOL(xdict, netrbClientAllocateMACAddress);
  }
  else {
    BOOL v46 = 1;
  }
  if (xpc_dictionary_get_value(xdict, netrbClientEnableTSO)) {
    BOOL v45 = xpc_dictionary_get_BOOL(xdict, netrbClientEnableTSO);
  }
  else {
    BOOL v45 = 0;
  }
  if (xpc_dictionary_get_value(xdict, netrbClientEnableIsolation)) {
    BOOL v44 = xpc_dictionary_get_BOOL(xdict, netrbClientEnableIsolation);
  }
  else {
    BOOL v44 = 0;
  }
  uint64_t v48 = v15;
  if (xpc_dictionary_get_value(xdict, netrbClientEnableChecksumOffload)) {
    BOOL v43 = xpc_dictionary_get_BOOL(xdict, netrbClientEnableChecksumOffload);
  }
  else {
    BOOL v43 = 0;
  }
  BOOL v47 = xpc_dictionary_get_BOOL(xdict, netrbClientEnableMACNAT);
  uint64_t v21 = (void *)v58[3];
  uint64_t v22 = xpc_dictionary_get_string(xdict, netrbClientInterfaceStartAddress);
  uint64_t v23 = xpc_dictionary_get_string(xdict, netrbClientInterfaceEndAddress);
  uint64_t v24 = xpc_dictionary_get_string(xdict, netrbClientInterfaceNetworkMask);
  if (v22 && v23 && (uint64_t v25 = v24) != 0LL)
  {
    xpc_dictionary_set_string(v21, off_100219720, v22);
    xpc_dictionary_set_string(v21, off_100219728, v23);
    xpc_dictionary_set_string(v21, off_100219730, v25);
  }

  else if ((unint64_t)v22 | (unint64_t)v23)
  {
    uint64_t v42 = netrbClientInterfaceStartAddress;
    uint64_t v13 = "All of %s, %s, and %s must be specified";
    goto LABEL_41;
  }

  if (sub_10014DA34(xdict, (void *)v58[3]))
  {
    __int128 v29 = (void *)v58[3];
    uuid = xpc_dictionary_get_uuid(xdict, netrbClientNetworkIdentifier);
    if (uuid)
    {
      xpc_dictionary_set_uuid(v29, off_100219778, uuid);
      uint64_t v31 = xpc_dictionary_get_string(xdict, netrbClientInterfaceIPv4Address);
      __int128 v32 = xpc_dictionary_get_string(xdict, netrbClientInterfaceNetworkMask);
      uint64_t v40 = v32;
      if (v31 && v32)
      {
        xpc_dictionary_set_string(v29, off_100219780, v31);
        xpc_dictionary_set_string(v29, off_100219730, v40);
      }

      else if ((unint64_t)v31 | (unint64_t)v32)
      {
        NETRBErrorLog( (uint64_t)"%s, and %s must be specified",  v33,  v34,  v35,  v36,  v37,  v38,  v39,  (uint64_t)netrbClientInterfaceIPv4Address);
        goto LABEL_42;
      }

      uint64_t v41 = xpc_dictionary_get_string(xdict, netrbClientInterfaceIPv6Address);
      if (v41) {
        xpc_dictionary_set_string(v29, off_100219788, v41);
      }
    }

    uint64_t v15 = v48;
    BOOL v18 = v45;
    char v20 = v46;
    BOOL v16 = v43;
    BOOL v17 = v44;
    BOOL v19 = v47;
    goto LABEL_55;
  }

_BYTE *sub_1001509F0( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  if (*(_BYTE *)(*(void *)(a1 + 48) + 545LL)) {
    return (_BYTE *)NETRBErrorLog((uint64_t)"client already requested interface", v10, v11, v12, v13, v14, v15, v16, a9);
  }
  xpc_dictionary_set_uint64(*(xpc_object_t *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL), off_100219628, 0x3F6uLL);
  xpc_dictionary_set_uint64( *(xpc_object_t *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL),  off_100219690,  *(unsigned int *)(a1 + 80));
  xpc_dictionary_set_string( *(xpc_object_t *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL),  off_100219630,  (const char *)(*(void *)(a1 + 48) + 32LL));
  if (*(_BYTE *)(a1 + 88))
  {
    if (!uuid_is_null(*(const unsigned __int8 **)(a1 + 56))) {
      xpc_dictionary_set_uuid( *(xpc_object_t *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL),  off_100219638,  *(const unsigned __int8 **)(a1 + 56));
    }
  }

  else
  {
    xpc_dictionary_set_BOOL(*(xpc_object_t *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL), off_100219650, 0);
  }

  uint64_t v24 = *(const char **)(a1 + 64);
  if (v24) {
    xpc_dictionary_set_string(*(xpc_object_t *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL), off_1002196B0, v24);
  }
  if (*(_BYTE *)(a1 + 89)) {
    xpc_dictionary_set_BOOL(*(xpc_object_t *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL), off_100219658, 1);
  }
  if (*(_BYTE *)(a1 + 90)) {
    xpc_dictionary_set_BOOL(*(xpc_object_t *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL), off_100219660, 1);
  }
  if (*(_BYTE *)(a1 + 91)) {
    xpc_dictionary_set_BOOL(*(xpc_object_t *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL), off_100219668, 1);
  }
  if (*(_BYTE *)(a1 + 92)) {
    xpc_dictionary_set_BOOL(*(xpc_object_t *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL), off_100219670, 1);
  }
  uint64_t v25 = *(int *)(a1 + 84);
  if ((_DWORD)v25) {
    xpc_dictionary_set_uint64(*(xpc_object_t *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL), off_100219710, v25);
  }
  NETRBInfoLog( (uint64_t)"client %p xpc send -> create interface [%s%s%s%s ]",  v18,  v25,  v19,  v20,  v21,  v22,  v23,  *(void *)(a1 + 48));
  uint64_t v26 = *(void *)(a1 + 48);
  *(_BYTE *)(v26 + 545) = 1;
  uint64_t v27 = *(dispatch_queue_s **)(a1 + 72);
  __int128 v28 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 0x40000000LL;
  v30[2] = sub_100150CF0;
  v30[3] = &unk_1001E8798;
  v30[4] = v26;
  BOOL v29 = NETRBXPCSetupAndSend(v27, v28, (uint64_t)v30);
  uint64_t result = *(_BYTE **)(a1 + 48);
  *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = v29;
  if (*(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL)) {
    return CFRetain(result);
  }
  result[545] = 0;
  return result;
}

void sub_100150CF0( uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

uint64_t _NETRBClientAddIPPortForwardingRule( CFTypeRef cf, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v25 = 0LL;
  uint64_t v26 = &v25;
  uint64_t v27 = 0x2000000000LL;
  char v28 = 0;
  if (!cf)
  {
    uint64_t v16 = "client handle cannot be NULL";
LABEL_12:
    NETRBErrorLog((uint64_t)v16, a2, a3, a4, a5, a6, a7, a8, v19);
    goto LABEL_13;
  }

  __int16 v9 = a6;
  char v11 = a4;
  __int16 v12 = a3;
  char v13 = a2;
  if ((_DWORD)a4 != 2 && (_DWORD)a4 != 30)
  {
    NETRBErrorLog((uint64_t)"invalid address family %d", a2, a3, a4, a5, a6, a7, a8, a4);
    goto LABEL_13;
  }

  if (qword_100219EF8 != -1) {
    dispatch_once(&qword_100219EF8, &stru_1001E8A50);
  }
  uint64_t v15 = (dispatch_queue_s *)qword_100219F00;
  if (!qword_100219F00)
  {
    uint64_t v16 = "unable to create framework queue";
    goto LABEL_12;
  }

  block[0] = _NSConcreteStackBlock;
  block[1] = 0x40000000LL;
  block[2] = sub_100150E74;
  block[3] = &unk_1001E8838;
  char v23 = v13;
  __int16 v21 = v12;
  char v24 = v11;
  block[6] = cf;
  void block[7] = a5;
  __int16 v22 = v9;
  void block[4] = a7;
  void block[5] = &v25;
  void block[8] = qword_100219F00;
  CFRetain(cf);
  dispatch_sync(v15, block);
  if (!*((_BYTE *)v26 + 24)) {
    CFRelease(cf);
  }
LABEL_13:
  uint64_t v17 = *((unsigned __int8 *)v26 + 24);
  _Block_object_dispose(&v25, 8);
  return v17;
}

void sub_100150E74( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (sub_10014D270(*(_BYTE **)(a1 + 48), a2, a3, a4, a5, a6, a7, a8))
  {
    NETRBErrorLog((uint64_t)"invalid client %p", v9, v10, v11, v12, v13, v14, v15, *(void *)(a1 + 48));
  }

  else
  {
    xpc_object_t v16 = xpc_dictionary_create(0LL, 0LL, 0LL);
    xpc_dictionary_set_string(v16, off_100219630, (const char *)(*(void *)(a1 + 48) + 32LL));
    xpc_dictionary_set_uint64(v16, off_100219628, 0x3F7uLL);
    uint64_t v17 = sub_100150FB0( *(unsigned __int8 *)(a1 + 76),  *(unsigned __int16 *)(a1 + 72),  *(unsigned __int8 *)(a1 + 77),  *(void **)(a1 + 56),  *(unsigned __int16 *)(a1 + 74));
    xpc_dictionary_set_value(v16, off_100219790, v17);
    xpc_release(v17);
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 0x40000000LL;
    v26[2] = sub_100151104;
    v26[3] = &unk_1001E8810;
    uint64_t v18 = *(void *)(a1 + 48);
    v26[4] = *(void *)(a1 + 32);
    v26[5] = v18;
    NETRBInfoLog((uint64_t)"client %p xpc send -> add port forwarding rule", v19, v20, v21, v22, v23, v24, v25, v18);
    *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = NETRBXPCSetupAndSend( *(dispatch_queue_s **)(a1 + 64),  v16,  (uint64_t)v26);
    xpc_release(v16);
  }

void *sub_100150FB0(unsigned int a1, unsigned int a2, unsigned int a3, void *a4, unsigned int a5)
{
  if (a3 != 30 && a3 != 2 || !a4 && a5 || a4 && !a5 || a4 && !inet_ntop(a3, a4, string, 0x2Eu)) {
    return 0LL;
  }
  xpc_object_t v12 = xpc_dictionary_create(0LL, 0LL, 0LL);
  uint64_t v10 = v12;
  if (a1) {
    xpc_dictionary_set_uint64(v12, off_1002197A0, a1);
  }
  if (a2) {
    xpc_dictionary_set_uint64(v10, off_1002197A8, a2);
  }
  xpc_dictionary_set_uint64(v10, off_1002197B8, a3);
  if (a5) {
    xpc_dictionary_set_uint64(v10, off_1002197C0, a5);
  }
  if (a4) {
    xpc_dictionary_set_string(v10, off_1002197B0, string);
  }
  return v10;
}

void sub_100151104(uint64_t a1, void *a2)
{
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4)
  {
    if (a2)
    {
      LOBYTE(a2) = xpc_dictionary_get_uint64(a2, off_100219688) == 2001;
      uint64_t v4 = *(void *)(a1 + 32);
    }

    dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 0x40000000LL;
    void v6[2] = sub_1001511B0;
    v6[3] = &unk_1001E87E8;
    void v6[4] = v4;
    char v7 = (char)a2;
    dispatch_async(global_queue, v6);
  }

uint64_t sub_1001511B0(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16LL))( *(void *)(a1 + 32),  *(unsigned __int8 *)(a1 + 40));
}

uint64_t _NETRBClientRemoveIPPortForwardingRule( CFTypeRef cf, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v22 = 0LL;
  uint64_t v23 = &v22;
  uint64_t v24 = 0x2000000000LL;
  char v25 = 0;
  if (!cf)
  {
    uint64_t v14 = "client handle cannot be NULL";
LABEL_12:
    NETRBErrorLog((uint64_t)v14, a2, a3, a4, a5, a6, a7, a8, v17);
    goto LABEL_13;
  }

  char v9 = a4;
  __int16 v10 = a3;
  char v11 = a2;
  if ((_DWORD)a4 != 2 && (_DWORD)a4 != 30)
  {
    NETRBErrorLog((uint64_t)"invalid address family %d", a2, a3, a4, a5, a6, a7, a8, a4);
    goto LABEL_13;
  }

  if (qword_100219EF8 != -1) {
    dispatch_once(&qword_100219EF8, &stru_1001E8A50);
  }
  uint64_t v13 = (dispatch_queue_s *)qword_100219F00;
  if (!qword_100219F00)
  {
    uint64_t v14 = "unable to create framework queue";
    goto LABEL_12;
  }

  block[0] = _NSConcreteStackBlock;
  block[1] = 0x40000000LL;
  block[2] = sub_10015131C;
  block[3] = &unk_1001E88B0;
  char v20 = v11;
  __int16 v19 = v10;
  char v21 = v9;
  void block[4] = a5;
  void block[5] = &v22;
  block[6] = cf;
  void block[7] = qword_100219F00;
  CFRetain(cf);
  dispatch_sync(v13, block);
  if (!*((_BYTE *)v23 + 24)) {
    CFRelease(cf);
  }
LABEL_13:
  uint64_t v15 = *((unsigned __int8 *)v23 + 24);
  _Block_object_dispose(&v22, 8);
  return v15;
}

void sub_10015131C( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (sub_10014D270(*(_BYTE **)(a1 + 48), a2, a3, a4, a5, a6, a7, a8))
  {
    NETRBErrorLog((uint64_t)"invalid client %p", v9, v10, v11, v12, v13, v14, v15, *(void *)(a1 + 48));
  }

  else
  {
    xpc_object_t v16 = xpc_dictionary_create(0LL, 0LL, 0LL);
    xpc_dictionary_set_string(v16, off_100219630, (const char *)(*(void *)(a1 + 48) + 32LL));
    xpc_dictionary_set_uint64(v16, off_100219628, 0x3F8uLL);
    uint64_t v17 = *(unsigned __int8 *)(a1 + 67);
    if ((_DWORD)v17 == 30 || (_DWORD)v17 == 2)
    {
      uint64_t v19 = *(unsigned __int8 *)(a1 + 66);
      uint64_t v20 = *(unsigned __int16 *)(a1 + 64);
      xpc_object_t v21 = xpc_dictionary_create(0LL, 0LL, 0LL);
      uint64_t v22 = v21;
      if ((_DWORD)v19) {
        xpc_dictionary_set_uint64(v21, off_1002197A0, v19);
      }
      if ((_DWORD)v20) {
        xpc_dictionary_set_uint64(v22, off_1002197A8, v20);
      }
      xpc_dictionary_set_uint64(v22, off_1002197B8, v17);
    }

    else
    {
      uint64_t v22 = 0LL;
    }

    xpc_dictionary_set_value(v16, off_100219790, v22);
    xpc_release(v22);
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 0x40000000LL;
    v31[2] = sub_1001514C8;
    v31[3] = &unk_1001E8888;
    uint64_t v23 = *(void *)(a1 + 48);
    void v31[4] = *(void *)(a1 + 32);
    v31[5] = v23;
    NETRBInfoLog((uint64_t)"client %p xpc send -> remove port forwarding rule", v24, v25, v26, v27, v28, v29, v30, v23);
    *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = NETRBXPCSetupAndSend( *(dispatch_queue_s **)(a1 + 56),  v16,  (uint64_t)v31);
    xpc_release(v16);
  }

void sub_1001514C8(uint64_t a1, void *a2)
{
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4)
  {
    if (a2)
    {
      LOBYTE(a2) = xpc_dictionary_get_uint64(a2, off_100219688) == 2001;
      uint64_t v4 = *(void *)(a1 + 32);
    }

    dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 0x40000000LL;
    void v6[2] = sub_100151574;
    v6[3] = &unk_1001E8860;
    void v6[4] = v4;
    char v7 = (char)a2;
    dispatch_async(global_queue, v6);
  }

uint64_t sub_100151574(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16LL))( *(void *)(a1 + 32),  *(unsigned __int8 *)(a1 + 40));
}

uint64_t _NETRBClientGetIPPortForwardingRules( CFTypeRef cf, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v18 = 0LL;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x2000000000LL;
  char v21 = 0;
  if (!cf)
  {
    uint64_t v12 = "client handle cannot be NULL";
LABEL_12:
    NETRBErrorLog((uint64_t)v12, a2, a3, a4, a5, a6, a7, a8, v15);
    goto LABEL_13;
  }

  char v9 = a2;
  if ((_DWORD)a2 != 2 && (_DWORD)a2 != 30)
  {
    NETRBErrorLog((uint64_t)"invalid address family %d", a2, a3, a4, a5, a6, a7, a8, a2);
    goto LABEL_13;
  }

  if (qword_100219EF8 != -1) {
    dispatch_once(&qword_100219EF8, &stru_1001E8A50);
  }
  uint64_t v11 = (dispatch_queue_s *)qword_100219F00;
  if (!qword_100219F00)
  {
    uint64_t v12 = "unable to create framework queue";
    goto LABEL_12;
  }

  block[0] = _NSConcreteStackBlock;
  block[1] = 0x40000000LL;
  block[2] = sub_1001516C8;
  block[3] = &unk_1001E8928;
  char v17 = v9;
  void block[4] = a3;
  void block[5] = &v18;
  block[6] = cf;
  void block[7] = qword_100219F00;
  CFRetain(cf);
  dispatch_sync(v11, block);
  if (!*((_BYTE *)v19 + 24)) {
    CFRelease(cf);
  }
LABEL_13:
  uint64_t v13 = *((unsigned __int8 *)v19 + 24);
  _Block_object_dispose(&v18, 8);
  return v13;
}

void sub_1001516C8( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (sub_10014D270(*(_BYTE **)(a1 + 48), a2, a3, a4, a5, a6, a7, a8))
  {
    NETRBErrorLog((uint64_t)"invalid client %p", v9, v10, v11, v12, v13, v14, v15, *(void *)(a1 + 48));
  }

  else
  {
    xpc_object_t v16 = xpc_dictionary_create(0LL, 0LL, 0LL);
    xpc_dictionary_set_string(v16, off_100219630, (const char *)(*(void *)(a1 + 48) + 32LL));
    xpc_dictionary_set_uint64(v16, off_100219628, 0x3F9uLL);
    uint64_t v17 = *(unsigned __int8 *)(a1 + 64);
    if ((_DWORD)v17 == 30 || (_DWORD)v17 == 2)
    {
      xpc_object_t v19 = xpc_dictionary_create(0LL, 0LL, 0LL);
      xpc_dictionary_set_uint64(v19, off_1002197B8, v17);
    }

    else
    {
      xpc_object_t v19 = 0LL;
    }

    xpc_dictionary_set_value(v16, off_100219790, v19);
    xpc_release(v19);
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 0x40000000LL;
    v28[2] = sub_100151828;
    v28[3] = &unk_1001E8900;
    uint64_t v20 = *(void *)(a1 + 48);
    void v28[4] = *(void *)(a1 + 32);
    v28[5] = v20;
    NETRBInfoLog((uint64_t)"client %p xpc send -> get port forwarding rules", v21, v22, v23, v24, v25, v26, v27, v20);
    *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = NETRBXPCSetupAndSend( *(dispatch_queue_s **)(a1 + 56),  v16,  (uint64_t)v28);
    xpc_release(v16);
  }

void sub_100151828(uint64_t a1, void *a2)
{
  if (a2)
  {
    xpc_object_t value = xpc_dictionary_get_value(a2, off_100219798);
    a2 = value;
    if (value) {
      xpc_retain(value);
    }
  }

  dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 0x40000000LL;
  void v6[2] = sub_1001518C8;
  v6[3] = &unk_1001E88D8;
  void v6[4] = *(void *)(a1 + 32);
  void v6[5] = a2;
  dispatch_async(global_queue, v6);
}

void sub_1001518C8(uint64_t a1)
{
  CFIndex v2 = *(void **)(a1 + 40);
  if (v2) {
    xpc_release(v2);
  }
}

const char *_NETRBIPPortForwardingDictGetDetails( xpc_object_t xdict, _BYTE *a2, _WORD *a3, uint64_t a4, void *a5, _WORD *a6, uint64_t a7, uint64_t a8)
{
  if (!xdict)
  {
    uint64_t v26 = "rule is NULL";
LABEL_12:
    NETRBErrorLog((uint64_t)v26, (uint64_t)a2, (uint64_t)a3, a4, (uint64_t)a5, (uint64_t)a6, a7, a8, v27);
    return 0LL;
  }

  int v10 = a4;
  if ((_DWORD)a4 != 2 && (_DWORD)a4 != 30)
  {
    uint64_t v27 = a4;
    uint64_t v26 = "invalid address family %d";
    goto LABEL_12;
  }

  char uint64 = xpc_dictionary_get_uint64(xdict, off_1002197A0);
  *a2 = uint64;
  __int16 v15 = xpc_dictionary_get_uint64(xdict, off_1002197A8);
  *a3 = v15;
  if (!v15) {
    return 0LL;
  }
  __int16 v16 = xpc_dictionary_get_uint64(xdict, off_1002197C0);
  *a6 = v16;
  if (!v16) {
    return 0LL;
  }
  unsigned __int8 v17 = xpc_dictionary_get_uint64(xdict, off_1002197B8);
  if (v17 != v10)
  {
    NETRBErrorLog((uint64_t)"returned address family %d != %d", v18, v19, v20, v21, v22, v23, v24, v17);
    return 0LL;
  }

  uint64_t result = xpc_dictionary_get_string(xdict, off_1002197B0);
  if (result) {
    return (const char *)(inet_pton(v10, result, a5) != 0);
  }
  return result;
}

uint64_t NETRBClientSendNotification( void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (!qword_100219EE0 || (CFIndex Count = CFArrayGetCount((CFArrayRef)qword_100219EE0)) == 0)
  {
    uint64_t v20 = "received notification but no clients";
LABEL_14:
    NETRBErrorLog((uint64_t)v20, a2, a3, a4, a5, a6, a7, a8, v21[0]);
    return 0LL;
  }

  uint64_t v10 = Count;
  xpc_object_t v11 = xpc_dictionary_create(0LL, 0LL, 0LL);
  if (!v11)
  {
    uint64_t v20 = "xpc_dictionary_create() failed";
    goto LABEL_14;
  }

  uint64_t v12 = v11;
  uint64_t v13 = netrbClientNotificationKey;
  uint64_t uint64 = xpc_dictionary_get_uint64(a1, off_100219738);
  xpc_dictionary_set_uint64(v12, v13, uint64);
  if (v10 >= 1)
  {
    for (CFIndex i = 0LL; i != v10; ++i)
    {
      ValueAtIndex = CFArrayGetValueAtIndex((CFArrayRef)qword_100219EE0, i);
      if (ValueAtIndex)
      {
        unsigned __int8 v17 = ValueAtIndex;
        if (ValueAtIndex[2])
        {
          if (ValueAtIndex[3])
          {
            xpc_retain(v12);
            CFRetain(v17);
            uint64_t v18 = (dispatch_queue_s *)v17[2];
            v21[0] = (uint64_t)_NSConcreteStackBlock;
            v21[1] = 0x40000000LL;
            v21[2] = (uint64_t)sub_100151B9C;
            v21[3] = (uint64_t)&unk_1001E8970;
            v21[4] = (uint64_t)v17;
            v21[5] = (uint64_t)v12;
            dispatch_async(v18, v21);
          }
        }
      }
    }
  }

  xpc_release(v12);
  return 1LL;
}

void sub_100151B9C(uint64_t a1)
{
  v4[0] = 0LL;
  v4[1] = v4;
  v4[2] = 0x2000000000LL;
  if (qword_100219EF8 != -1) {
    dispatch_once(&qword_100219EF8, &stru_1001E8A50);
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 0x40000000LL;
  block[2] = sub_100151C64;
  block[3] = &unk_1001E8950;
  void block[4] = v4;
  __int128 v3 = *(_OWORD *)(a1 + 32);
  dispatch_sync((dispatch_queue_t)qword_100219F00, block);
  xpc_release(*(xpc_object_t *)(a1 + 40));
  CFRelease(*(CFTypeRef *)(a1 + 32));
  _Block_object_dispose(v4, 8);
}

uint64_t sub_100151C64( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t result = sub_10014D270(*(_BYTE **)(a1 + 40), a2, a3, a4, a5, a6, a7, a8);
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = result;
  if (!(_DWORD)result) {
    return (*(uint64_t (**)(void))(*(void *)(*(void *)(a1 + 40) + 24LL) + 16LL))();
  }
  return result;
}

uint64_t _NETRBClientAddLowLatencyFlow( uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return sub_100151CBC(a1, a2, 0LL, a4, a5, a6, a7, a8);
}

uint64_t sub_100151CBC( uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  char v8 = a3;
  uint64_t v24 = 0LL;
  uint64_t v25 = &v24;
  uint64_t v26 = 0x2000000000LL;
  char v27 = 0;
  char inited = netrbInitIfnetTrafficDescriptor(a2, 0LL, a3, a4, a5, a6, a7, a8);
  *((_BYTE *)v25 + 24) = inited;
  if ((inited & 1) == 0)
  {
    uint64_t v19 = "input xpc dictionary is malformed.";
LABEL_8:
    NETRBErrorLog((uint64_t)v19, v12, v13, v14, v15, v16, v17, v18, v22[0]);
    goto LABEL_9;
  }

  if (qword_100219EF8 != -1) {
    dispatch_once(&qword_100219EF8, &stru_1001E8A50);
  }
  if (!qword_100219F00)
  {
    uint64_t v19 = "unable to create framework queue";
    goto LABEL_8;
  }

  v22[0] = (uint64_t)_NSConcreteStackBlock;
  v22[1] = 0x40000000LL;
  v22[2] = (uint64_t)sub_100152340;
  v22[3] = (uint64_t)&unk_1001E8B28;
  v22[4] = (uint64_t)&v24;
  v22[5] = a1;
  v22[6] = (uint64_t)a2;
  char v23 = v8;
  dispatch_sync((dispatch_queue_t)qword_100219F00, v22);
LABEL_9:
  uint64_t v20 = *((unsigned __int8 *)v25 + 24);
  _Block_object_dispose(&v24, 8);
  return v20;
}

uint64_t _NETRBClientRemoveLowLatencyFlow( uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return sub_100151CBC(a1, a2, 1LL, a4, a5, a6, a7, a8);
}

void sub_100151DD4(id a1)
{
  qword_100219EF0 = _CFRuntimeRegisterClass(&unk_1001E89D0);
}

uint64_t sub_100151DF8( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9 = *(const void **)(a1 + 24);
  if (v9)
  {
    _Block_release(v9);
    *(void *)(a1 + 24) = 0LL;
  }

  uint64_t v10 = *(dispatch_object_s **)(a1 + 16);
  if (v10)
  {
    dispatch_release(v10);
    *(void *)(a1 + 16) = 0LL;
  }

  return NETRBInfoLog((uint64_t)"releasing client %p", a2, a3, a4, a5, a6, a7, a8, a1);
}

void sub_100151E4C(id a1)
{
  __str[44] = 0;
  qword_100219F00 = (uint64_t)dispatch_queue_create(__str, 0LL);
  if (!qword_100219F00)
  {
    int v1 = __error();
    CFIndex v2 = strerror(*v1);
    NETRBErrorLog((uint64_t)"creating framework queue failed %s", v3, v4, v5, v6, v7, v8, v9, (uint64_t)v2);
  }

void sub_100151EE8(id a1)
{
  __str[48] = 0;
  qword_100219F10 = (uint64_t)dispatch_queue_create(__str, 0LL);
  if (!qword_100219F10)
  {
    int v1 = __error();
    CFIndex v2 = strerror(*v1);
    NETRBErrorLog((uint64_t)"creating client XPC queue failed %s", v3, v4, v5, v6, v7, v8, v9, (uint64_t)v2);
  }

void sub_100151F84(void *a1, xpc_object_t xdict)
{
  string = xpc_dictionary_get_string(xdict, off_100219640);
  if (string) {
    xpc_dictionary_set_string(a1, netrbClientMACAddress, string);
  }
  uuid = xpc_dictionary_get_uuid(xdict, off_100219638);
  if (uuid)
  {
    *(_OWORD *)uint64_t v15 = *(_OWORD *)uuid;
    xpc_dictionary_set_uuid(a1, netrbClientMACUUID, v15);
  }

  int v6 = xpc_dictionary_dup_fd(xdict, off_100219648);
  if (v6 != -1) {
    xpc_dictionary_set_uint64(a1, netrbClientSocketFD, v6);
  }
  uint64_t v7 = xpc_dictionary_get_string(xdict, off_100219720);
  uint64_t v8 = xpc_dictionary_get_string(xdict, off_100219728);
  uint64_t v9 = xpc_dictionary_get_string(xdict, off_100219730);
  if (v7) {
    BOOL v10 = v8 == 0LL;
  }
  else {
    BOOL v10 = 1;
  }
  if (!v10 && v9 != 0LL)
  {
    uint64_t v12 = v9;
    xpc_dictionary_set_string(a1, netrbClientInterfaceStartAddress, v7);
    xpc_dictionary_set_string(a1, netrbClientInterfaceEndAddress, v8);
    xpc_dictionary_set_string(a1, netrbClientInterfaceNetworkMask, v12);
  }

  xpc_object_t value = xpc_dictionary_get_value(xdict, off_100219710);
  if (value) {
    xpc_dictionary_set_value(a1, netrbClientInterfaceMTU, value);
  }
  xpc_object_t v14 = xpc_dictionary_get_value(xdict, off_100219758);
  if (v14) {
    xpc_dictionary_set_value(a1, netrbClientNat66Param, v14);
  }
}

void sub_100152164(uint64_t a1)
{
  uint64_t v7 = 0LL;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2000000000LL;
  if (qword_100219EF8 != -1) {
    dispatch_once(&qword_100219EF8, &stru_1001E8A50);
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 0x40000000LL;
  block[2] = sub_100152288;
  block[3] = &unk_1001E8AB8;
  void block[4] = &v7;
  int v6 = *(_DWORD *)(a1 + 56);
  __int128 v4 = *(_OWORD *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 48);
  dispatch_sync((dispatch_queue_t)qword_100219F00, block);
  if (!*((_DWORD *)v8 + 6)) {
    (*(void (**)(void))(*(void *)(*(void *)(a1 + 32) + 24LL) + 16LL))();
  }
  CFIndex v2 = *(void **)(a1 + 48);
  if (v2) {
    xpc_release(v2);
  }
  CFRelease(*(CFTypeRef *)(a1 + 32));
  _Block_object_dispose(&v7, 8);
}

double sub_100152288( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v9 = sub_10014D270(*(_BYTE **)(a1 + 40), a2, a3, a4, a5, a6, a7, a8);
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = v9;
  if (!v9 && *(_DWORD *)(a1 + 64) == 1001)
  {
    if (!strncmp(*(const char **)(a1 + 48), (const char *)(*(void *)(a1 + 40) + 289LL), 0x100uLL)
      || (*(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = 1, *(_DWORD *)(a1 + 64) == 1001))
    {
      if (xpc_dictionary_get_uint64(*(xpc_object_t *)(a1 + 56), netrbClientNotificationKey) == 5003)
      {
        xpc_object_t v11 = (_OWORD *)(*(void *)(a1 + 40) + 289LL);
        double result = 0.0;
        v11[14] = 0u;
        v11[15] = 0u;
        v11[12] = 0u;
        v11[13] = 0u;
        v11[10] = 0u;
        v11[11] = 0u;
        v11[8] = 0u;
        v11[9] = 0u;
        v11[6] = 0u;
        v11[7] = 0u;
        _DWORD v11[4] = 0u;
        v11[5] = 0u;
        v11[2] = 0u;
        v11[3] = 0u;
        *xpc_object_t v11 = 0u;
        v11[1] = 0u;
      }
    }
  }

  return result;
}

uint64_t sub_100152340( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (sub_10014D270(*(_BYTE **)(a1 + 40), a2, a3, a4, a5, a6, a7, a8))
  {
    uint64_t result = NETRBErrorLog((uint64_t)"invalid client %p", v9, v10, v11, v12, v13, v14, v15, *(void *)(a1 + 40));
    *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = 0;
  }

  else
  {
    xpc_dictionary_set_string(*(xpc_object_t *)(a1 + 48), off_100219630, (const char *)(*(void *)(a1 + 40) + 32LL));
    if (*(_BYTE *)(a1 + 56)) {
      uint64_t v17 = 1019LL;
    }
    else {
      uint64_t v17 = 1018LL;
    }
    if (*(_BYTE *)(a1 + 56)) {
      uint64_t v18 = "client %p xpc send -> remove low latency flow";
    }
    else {
      uint64_t v18 = "client %p xpc send -> add low latency flow";
    }
    xpc_dictionary_set_uint64(*(xpc_object_t *)(a1 + 48), off_100219628, v17);
    NETRBInfoLog((uint64_t)v18, v19, v20, v21, v22, v23, v24, v25, *(void *)(a1 + 40));
    *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = 0;
    uint64_t v26 = *(void **)(a1 + 48);
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 0x40000000LL;
    v27[2] = sub_100152444;
    v27[3] = &unk_1001E8B00;
    __int128 v28 = *(_OWORD *)(a1 + 32);
    return NETRBXPCSetupAndSend(0LL, v26, (uint64_t)v27);
  }

  return result;
}

uint64_t sub_100152444( uint64_t a1, xpc_object_t object, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (!object || xpc_get_type(object) != (xpc_type_t)&_xpc_type_dictionary)
  {
    uint64_t v10 = "response is not a dictionary type";
LABEL_4:
    NETRBErrorLog((uint64_t)v10, (uint64_t)object, a3, a4, a5, a6, a7, a8, v21);
    return NETRBInfoLog( (uint64_t)"client %p set low latency flow reponse received, result %u",  v11,  v12,  v13,  v14,  v15,  v16,  v17,  *(void *)(a1 + 40));
  }

  xpc_object_t value = xpc_dictionary_get_value(object, off_100219688);
  if (!value || (uint64_t v20 = value, xpc_get_type(value) != (xpc_type_t)&_xpc_type_uint64))
  {
    uint64_t v10 = "response does not contain the success status";
    goto LABEL_4;
  }

  return NETRBInfoLog( (uint64_t)"client %p set low latency flow reponse received, result %u",  v11,  v12,  v13,  v14,  v15,  v16,  v17,  *(void *)(a1 + 40));
}

uint64_t NETRBLogCreate()
{
  if (qword_100219F18 != -1) {
    dispatch_once(&qword_100219F18, &stru_1001E8BD8);
  }
  if (byte_100219F20) {
    return 12LL;
  }
  else {
    return 0LL;
  }
}

void sub_10015255C(id a1)
{
  qword_100219F28 = (uint64_t)os_log_create("com.apple.MobileInternetSharing", "framework.netrb");
  if (!qword_100219F28)
  {
    byte_100219F20 = 1;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100154AF8();
    }
  }

uint64_t NETRBErrorLog( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  return os_log_with_args(qword_100219F28, 0LL, a1, &a9, v9);
}

uint64_t NETRBNoticeLog( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  return os_log_with_args(qword_100219F28, 0LL, a1, &a9, v9);
}

uint64_t NETRBInfoLog( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  return os_log_with_args(qword_100219F28, 1LL, a1, &a9, v9);
}

uint64_t NETRBDebugLog( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  return os_log_with_args(qword_100219F28, 2LL, a1, &a9, v9);
}

uint64_t NETRBXPCEndPointCreate( dispatch_queue_t targetq, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (qword_100219F30)
  {
    NETRBDebugLog((uint64_t)"xpc endpoint connection already exists", a2, a3, a4, a5, a6, a7, a8, v19);
  }

  else
  {
    xpc_connection_t v9 = xpc_connection_create(0LL, targetq);
    qword_100219F30 = (uint64_t)v9;
    if (!v9)
    {
      NETRBErrorLog((uint64_t)"unable to create xpc endpoint connection", v10, v11, v12, v13, v14, v15, v16, v19);
      return 0LL;
    }

    uint64_t v17 = v9;
    NETRBInfoLog((uint64_t)"listener connection %p created", v10, v11, v12, v13, v14, v15, v16, (uint64_t)v9);
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 0x40000000LL;
    handler[2] = sub_100152770;
    handler[3] = &unk_1001E8BF8;
    handler[4] = v17;
    void handler[5] = targetq;
    xpc_connection_set_event_handler(v17, handler);
    xpc_connection_resume((xpc_connection_t)qword_100219F30);
  }

  return 1LL;
}

void sub_100152770(uint64_t a1, xpc_object_t object)
{
  xpc_type_t type = xpc_get_type(object);
  uint64_t v12 = *(void *)(a1 + 32);
  if (v12 && (v12 == qword_100219F30 ? (BOOL v13 = type == (xpc_type_t)&_xpc_type_error) : (BOOL v13 = 0), v13))
  {
    if (object == &_xpc_error_termination_imminent)
    {
      NETRBInfoLog( (uint64_t)"received XPC_ERROR_TERMINATION_IMMINENT for %p",  v5,  v6,  v7,  v8,  v9,  v10,  v11,  *(void *)(a1 + 32));
    }

    else if (object == &_xpc_error_connection_invalid)
    {
      NETRBInfoLog((uint64_t)"XPC_ERROR_CONNECTION_INVALID for %p", v5, v6, v7, v8, v9, v10, v11, *(void *)(a1 + 32));
    }
  }

  else if (type == (xpc_type_t)&_xpc_type_connection)
  {
    uint64_t v14 = *(dispatch_queue_s **)(a1 + 40);
    NETRBInfoLog((uint64_t)"new notification connection %p from daemon", v5, v6, v7, v8, v9, v10, v11, (uint64_t)object);
    if (qword_100219F40)
    {
      xpc_connection_cancel((xpc_connection_t)qword_100219F40);
      xpc_release((xpc_object_t)qword_100219F40);
      qword_100219F40 = 0LL;
    }

    qword_100219F40 = (uint64_t)xpc_retain(object);
    xpc_connection_set_target_queue((xpc_connection_t)object, v14);
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 0x40000000LL;
    handler[2] = sub_100152D48;
    handler[3] = &unk_1001E8C58;
    handler[4] = object;
    xpc_connection_set_event_handler((xpc_connection_t)object, handler);
    xpc_connection_resume((xpc_connection_t)object);
  }

BOOL NETRBXPCCreate( dispatch_queue_t targetq, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (qword_100219F38)
  {
    NETRBDebugLog((uint64_t)"xpc connection %p to daemon already exists", a2, a3, a4, a5, a6, a7, a8, qword_100219F38);
    return 1LL;
  }

  xpc_connection_t mach_service = xpc_connection_create_mach_service(off_100219620, targetq, 2uLL);
  qword_100219F38 = (uint64_t)mach_service;
  if (!mach_service) {
    goto LABEL_7;
  }
  if (xpc_get_type(mach_service) != (xpc_type_t)&_xpc_type_connection)
  {
    if (qword_100219F38)
    {
      xpc_release((xpc_object_t)qword_100219F38);
LABEL_8:
      BOOL result = 0LL;
      qword_100219F38 = 0LL;
      return result;
    }

void sub_1001529C0(uint64_t a1, xpc_object_t object)
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 0x40000000LL;
  v4[2] = sub_100152A2C;
  v4[3] = &unk_1001E8C18;
  uint64_t v3 = *(void *)(a1 + 32);
  void v4[4] = object;
  v4[5] = v3;
  xpc_retain(object);
  dispatch_async(*(dispatch_queue_t *)(a1 + 40), v4);
}

void sub_100152A2C(uint64_t a1)
{
  if (xpc_get_type(*(xpc_object_t *)(a1 + 32)) == (xpc_type_t)&_xpc_type_error)
  {
    uint64_t v9 = *(void *)(a1 + 40);
    if (v9 == qword_100219F38)
    {
      xpc_dictionary_get_string(*(xpc_object_t *)(a1 + 32), _xpc_error_key_description);
      uint64_t v17 = NETRBErrorLog((uint64_t)"xpc connection %p to daemon error: %s", v10, v11, v12, v13, v14, v15, v16, v9);
      NETRBXPCCleanup(v17, v18, v19, v20, v21, v22, v23, v24);
    }
  }

  else
  {
    NETRBErrorLog((uint64_t)"unrecognized event", v2, v3, v4, v5, v6, v7, v8, v25);
  }

  xpc_release(*(xpc_object_t *)(a1 + 32));
}

BOOL NETRBXPCCleanup( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8 = qword_100219F38;
  if (qword_100219F38)
  {
    NETRBInfoLog((uint64_t)"cleaning up connection %p to daemon", a2, a3, a4, a5, a6, a7, a8, qword_100219F38);
    xpc_connection_cancel((xpc_connection_t)qword_100219F38);
    xpc_release((xpc_object_t)qword_100219F38);
    qword_100219F38 = 0LL;
  }

  return v8 != 0;
}

BOOL NETRBXPCSetupAndSend(dispatch_queue_s *a1, xpc_object_t xdict, uint64_t a3)
{
  if (xpc_dictionary_get_uint64(xdict, off_100219628) == 1000)
  {
    if (!qword_100219F30) {
      return 0LL;
    }
    xpc_dictionary_set_connection(xdict, off_100219680, (xpc_connection_t)qword_100219F30);
  }

  if (a1)
  {
    BOOL v13 = qword_100219F38 != 0;
    if (qword_100219F38)
    {
      handler[0] = _NSConcreteStackBlock;
      handler[1] = 0x40000000LL;
      handler[2] = sub_100152E60;
      handler[3] = &unk_1001E8C80;
      handler[4] = a3;
      xpc_connection_send_message_with_reply((xpc_connection_t)qword_100219F38, xdict, a1, handler);
    }

    else
    {
      NETRBDebugLog((uint64_t)"connection to daemon does not exist", v6, v7, v8, v9, v10, v11, v12, v80);
    }

    return v13;
  }

  if (!qword_100219F38)
  {
    NETRBDebugLog((uint64_t)"connection to daemon does not exist", v6, v7, v8, v9, v10, v11, v12, v80);
    return 0LL;
  }

  xpc_object_t v14 = xpc_connection_send_message_with_reply_sync((xpc_connection_t)qword_100219F38, xdict);
  uint64_t v22 = v14;
  if (v14)
  {
    xpc_type_t type = xpc_get_type(v14);
    if (type != (xpc_type_t)&_xpc_type_error)
    {
      xpc_type_t v31 = type;
      if (type == (xpc_type_t)&_xpc_type_dictionary)
      {
        if (xpc_dictionary_get_uint64(v22, off_100219688) == 2002)
        {
          uint64_t v72 = NETRBErrorLog( (uint64_t)"error: aborting XPC connection to daemon",  v65,  v66,  v67,  v68,  v69,  v70,  v71,  v80);
          NETRBXPCCleanup(v72, v73, v74, v75, v76, v77, v78, v79);
        }

        xpc_type_t v31 = (xpc_type_t)&_xpc_type_dictionary;
      }

      else
      {
        uint64_t v32 = NETRBErrorLog((uint64_t)"unknown response", v24, v25, v26, v27, v28, v29, v30, v80);
        NETRBXPCCleanup(v32, v33, v34, v35, v36, v37, v38, v39);
      }

      goto LABEL_18;
    }

    string = xpc_dictionary_get_string(v22, _xpc_error_key_description);
    uint64_t v55 = NETRBErrorLog( (uint64_t)"xpc_connection_send_message_with_reply_sync() received %s",  v48,  v49,  v50,  v51,  v52,  v53,  v54,  (uint64_t)string);
    NETRBXPCCleanup(v55, v56, v57, v58, v59, v60, v61, v62);
  }

  else
  {
    NETRBXPCCleanup(0LL, v15, v16, v17, v18, v19, v20, v21);
    NETRBErrorLog( (uint64_t)"NULL response from xpc_connection_send_message_with_reply_sync",  v40,  v41,  v42,  v43,  v44,  v45,  v46,  v80);
  }

  xpc_type_t v31 = (xpc_type_t)&_xpc_type_error;
LABEL_18:
  if (v31 == (xpc_type_t)&_xpc_type_dictionary) {
    uint64_t v63 = v22;
  }
  else {
    uint64_t v63 = 0LL;
  }
  (*(void (**)(uint64_t, void *))(a3 + 16))(a3, v63);
  if (v22) {
    xpc_release(v22);
  }
  return 1LL;
}

BOOL NETRBEndPointCleanup( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8 = qword_100219F30;
  if (qword_100219F30)
  {
    NETRBInfoLog((uint64_t)"cleaning up listener connection %p", a2, a3, a4, a5, a6, a7, a8, qword_100219F30);
    xpc_connection_cancel((xpc_connection_t)qword_100219F30);
    xpc_release((xpc_object_t)qword_100219F30);
    qword_100219F30 = 0LL;
  }

  return v8 != 0;
}

void sub_100152D48( uint64_t a1, xpc_object_t object, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  xpc_type_t type = xpc_get_type(object);
  uint64_t v12 = xpc_copy_description(object);
  if (v12)
  {
    uint64_t v20 = v12;
    NETRBInfoLog( (uint64_t)"received event on notification connection %s",  v13,  v14,  v15,  v16,  v17,  v18,  v19,  (uint64_t)v12);
    free(v20);
  }

  uint64_t v21 = *(void *)(a1 + 32);
  if (v21) {
    BOOL v22 = v21 == qword_100219F40;
  }
  else {
    BOOL v22 = 0;
  }
  if (v22 && type == (xpc_type_t)&_xpc_type_error)
  {
    xpc_dictionary_get_string(object, _xpc_error_key_description);
    NETRBInfoLog((uint64_t)"error %p:%s", v25, v26, v27, v28, v29, v30, v31, v21);
    xpc_connection_cancel(*(xpc_connection_t *)(a1 + 32));
    xpc_release(*(xpc_object_t *)(a1 + 32));
    qword_100219F40 = 0LL;
  }

  else
  {
    if (qword_100219F40) {
      BOOL v24 = type == (xpc_type_t)&_xpc_type_dictionary;
    }
    else {
      BOOL v24 = 0;
    }
    if (v24) {
      NETRBClientSendNotification(object, v13, v14, v15, v16, v17, v18, v19);
    }
    else {
      NETRBNoticeLog((uint64_t)"unknown event", v13, v14, v15, v16, v17, v18, v19, a9);
    }
  }

uint64_t sub_100152E60( uint64_t a1, xpc_object_t object, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (object)
  {
    xpc_type_t type = xpc_get_type(object);
    if (type == (xpc_type_t)&_xpc_type_dictionary)
    {
      if (xpc_dictionary_get_uint64(object, off_100219688) != 2002)
      {
LABEL_11:
        uint64_t v26 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL);
        return v26();
      }

      uint64_t v34 = NETRBErrorLog( (uint64_t)"error: aborting XPC connection to daemon",  v27,  v28,  v29,  v30,  v31,  v32,  v33,  (uint64_t)string);
    }

    else
    {
      if (type == (xpc_type_t)&_xpc_type_error)
      {
        string = xpc_dictionary_get_string(object, _xpc_error_key_description);
        uint64_t v18 = "error: %s";
      }

      else
      {
        uint64_t v18 = "unknown response";
      }

      uint64_t v34 = NETRBErrorLog((uint64_t)v18, v11, v12, v13, v14, v15, v16, v17, (uint64_t)string);
    }

    NETRBXPCCleanup(v34, v35, v36, v37, v38, v39, v40, v41);
    goto LABEL_11;
  }

  NETRBXPCCleanup(a1, 0LL, a3, a4, a5, a6, a7, a8);
  NETRBErrorLog( (uint64_t)"NULL response from xpc_connection_send_message_with_reply()",  v19,  v20,  v21,  v22,  v23,  v24,  v25,  (uint64_t)string);
  uint64_t v26 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL);
  return v26();
}

uint64_t _MISAttach(void *a1)
{
  if (!a1) {
    return 22LL;
  }
  if (qword_100219F48 != -1) {
    dispatch_once(&qword_100219F48, &stru_1001E8D00);
  }
  uint64_t v2 = (dispatch_object_s *)qword_100219F50;
  if (!qword_100219F50) {
    return 12LL;
  }
  *a1 = 0LL;
  uint64_t v3 = _NETRBClientCreate(v2, &stru_1001E8CC0, 0LL);
  if (!v3) {
    return 12LL;
  }
  uint64_t v4 = v3;
  uint64_t result = 0LL;
  *a1 = v4;
  return result;
}

int sub_100152FC8(id a1, int a2, void *a3)
{
  return 0;
}

uint64_t _MISDetach( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8 = 22LL;
  if (a1)
  {
    else {
      return 22LL;
    }
  }

  return v8;
}

uint64_t _MISIsServiceAvailable( uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (result)
  {
    uint64_t v8 = result;
    uint64_t result = _NETRBClientGetGlobalServiceState(result, &v20, &v19, a4, a5, a6, a7, a8);
    if ((_DWORD)result)
    {
      if (v20 == 1022) {
        return 0LL;
      }
      if (v20 == 1023) {
        return 1LL;
      }
      uint64_t result = (uint64_t)xpc_dictionary_create(0LL, 0LL, 0LL);
      if (result)
      {
        uint64_t v9 = (void *)result;
        xpc_dictionary_set_uint64((xpc_object_t)result, netrbClientDeviceType, 1uLL);
        int started = _NETRBClientStartService(v8, 0LL, 201LL, 301LL, v9, v10, v11, v12);
        xpc_release(v9);
        if (started)
        {
          uint64_t result = _NETRBClientGetGlobalServiceState(v8, &v20, &v19, v14, v15, v16, v17, v18);
          if ((_DWORD)result) {
            return v20 == 1023;
          }
          return result;
        }

        return 0LL;
      }
    }
  }

  return result;
}

uint64_t _MISGetGlobalServiceState( uint64_t a1, _DWORD *a2, int *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v10 = 0;
  uint64_t v8 = 22LL;
  if (a1)
  {
    if (!a3) {
      a3 = &v10;
    }
    else {
      return 22LL;
    }
  }

  return v8;
}

uint64_t _MISGetDynamicStoreKey( uint64_t a1, char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return 0LL;
}

uint64_t _MISSetGlobalServiceState( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8 = 22LL;
  if (a1)
  {
    else {
      return 22LL;
    }
  }

  return v8;
}

uint64_t _MISStartServiceDHCP(uint64_t a1, const char *a2, _OWORD *a3)
{
  if (!a1) {
    return 22LL;
  }
  a3[14] = 0u;
  a3[15] = 0u;
  a3[12] = 0u;
  a3[13] = 0u;
  a3[10] = 0u;
  a3[11] = 0u;
  a3[8] = 0u;
  a3[9] = 0u;
  a3[6] = 0u;
  a3[7] = 0u;
  a3[4] = 0u;
  a3[5] = 0u;
  a3[2] = 0u;
  a3[3] = 0u;
  *a3 = 0u;
  a3[1] = 0u;
  xpc_object_t v5 = xpc_dictionary_create(0LL, 0LL, 0LL);
  if (!v5) {
    return 12LL;
  }
  uint64_t v6 = v5;
  xpc_dictionary_set_string(v5, netrbClientInterfaceName, a2);
  uint64_t v7 = netrbClientDeviceType;
  size_t v8 = strlen(a2);
  if (!strncmp("ap1", a2, v8)) {
    uint64_t v9 = 3LL;
  }
  else {
    uint64_t v9 = 0LL;
  }
  xpc_dictionary_set_uint64(v6, v7, v9);
  int started = _NETRBClientStartService(a1, 0LL, 201LL, 302LL, v6, v10, v11, v12);
  xpc_release(v6);
  if (started) {
    return 0LL;
  }
  else {
    return 22LL;
  }
}

uint64_t _MISStartServiceDHCPLocal(uint64_t a1, const char *a2, _OWORD *a3)
{
  if (!a1) {
    return 22LL;
  }
  a3[14] = 0u;
  a3[15] = 0u;
  a3[12] = 0u;
  a3[13] = 0u;
  a3[10] = 0u;
  a3[11] = 0u;
  a3[8] = 0u;
  a3[9] = 0u;
  a3[6] = 0u;
  a3[7] = 0u;
  a3[4] = 0u;
  a3[5] = 0u;
  a3[2] = 0u;
  a3[3] = 0u;
  *a3 = 0u;
  a3[1] = 0u;
  xpc_object_t v5 = xpc_dictionary_create(0LL, 0LL, 0LL);
  if (!v5) {
    return 12LL;
  }
  uint64_t v6 = v5;
  xpc_dictionary_set_string(v5, netrbClientInterfaceName, a2);
  uint64_t v7 = netrbClientDeviceType;
  size_t v8 = strlen(a2);
  if (!strncmp("ap1", a2, v8)) {
    uint64_t v9 = 3LL;
  }
  else {
    uint64_t v9 = 0LL;
  }
  xpc_dictionary_set_uint64(v6, v7, v9);
  int started = _NETRBClientStartService(a1, 0LL, 203LL, 302LL, v6, v10, v11, v12);
  xpc_release(v6);
  if (started) {
    return 0LL;
  }
  else {
    return 22LL;
  }
}

uint64_t _MISStartServiceDHCPCustom( uint64_t a1, const char *a2, unsigned int a3, unsigned int a4, int a5, _OWORD *a6)
{
  if (!a1) {
    return 22LL;
  }
  a6[14] = 0u;
  a6[15] = 0u;
  a6[12] = 0u;
  a6[13] = 0u;
  a6[10] = 0u;
  a6[11] = 0u;
  a6[8] = 0u;
  a6[9] = 0u;
  a6[6] = 0u;
  a6[7] = 0u;
  a6[4] = 0u;
  a6[5] = 0u;
  a6[2] = 0u;
  a6[3] = 0u;
  *a6 = 0u;
  a6[1] = 0u;
  xpc_object_t v11 = xpc_dictionary_create(0LL, 0LL, 0LL);
  if (!v11) {
    return 12LL;
  }
  uint64_t v12 = v11;
  xpc_dictionary_set_string(v11, netrbClientInterfaceName, a2);
  xpc_dictionary_set_uint64(v12, netrbClientInterfaceMTU, a3);
  xpc_dictionary_set_uint64(v12, netrbClientInterfaceInstance, a4);
  uint64_t v13 = netrbClientDeviceType;
  size_t v14 = strlen(a2);
  if (!strncmp("ap1", a2, v14)) {
    uint64_t v15 = 3LL;
  }
  else {
    uint64_t v15 = 0LL;
  }
  xpc_dictionary_set_uint64(v12, v13, v15);
  if (a5 == 1) {
    uint64_t v19 = 203LL;
  }
  else {
    uint64_t v19 = 201LL;
  }
  int started = _NETRBClientStartService(a1, 0LL, v19, 302LL, v12, v16, v17, v18);
  xpc_release(v12);
  if (started) {
    return 0LL;
  }
  else {
    return 22LL;
  }
}

uint64_t _MISStartServiceDHCPWithOptions( uint64_t a1, const char *a2, unsigned int a3, unsigned int a4, unsigned int a5, int a6, uint64_t a7, uint64_t a8, _OWORD *a9)
{
  if (!a1) {
    return 22LL;
  }
  a9[14] = 0u;
  a9[15] = 0u;
  a9[12] = 0u;
  a9[13] = 0u;
  a9[10] = 0u;
  a9[11] = 0u;
  a9[8] = 0u;
  a9[9] = 0u;
  a9[6] = 0u;
  a9[7] = 0u;
  a9[4] = 0u;
  a9[5] = 0u;
  a9[2] = 0u;
  a9[3] = 0u;
  *a9 = 0u;
  a9[1] = 0u;
  xpc_object_t v15 = xpc_dictionary_create(0LL, 0LL, 0LL);
  if (!v15) {
    return 12LL;
  }
  uint64_t v16 = v15;
  xpc_dictionary_set_string(v15, netrbClientInterfaceName, a2);
  xpc_dictionary_set_uint64(v16, netrbClientDeviceType, a3);
  xpc_dictionary_set_uint64(v16, netrbClientInterfaceMTU, a4);
  xpc_dictionary_set_uint64(v16, netrbClientInterfaceInstance, a5);
  if (a6 == 1) {
    uint64_t v20 = 203LL;
  }
  else {
    uint64_t v20 = 201LL;
  }
  int started = _NETRBClientStartService(a1, 0LL, v20, 302LL, v16, v17, v18, v19);
  xpc_release(v16);
  if (started) {
    return 0LL;
  }
  else {
    return 22LL;
  }
}

uint64_t _MISStopService( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8 = 22LL;
  if (a1)
  {
    else {
      return 22LL;
    }
  }

  return v8;
}

uint64_t _MISSetFixtureForwardedPorts(uint64_t a1, unsigned int a2, unsigned int a3)
{
  if (!a1) {
    return 22LL;
  }
  xpc_object_t v6 = xpc_dictionary_create(0LL, 0LL, 0LL);
  if (!v6) {
    return 12LL;
  }
  uint64_t v7 = v6;
  xpc_dictionary_set_uint64(v6, netrbClientForwardedLowPort, a2);
  xpc_dictionary_set_uint64(v7, netrbClientForwardedHighPort, a3);
  int v14 = _NETRBClientSetFixtureForwardedPorts(a1, v7, v8, v9, v10, v11, v12, v13);
  xpc_release(v7);
  if (v14) {
    return 0LL;
  }
  else {
    return 22LL;
  }
}

uint64_t _MISGetFixtureForwardedPorts( void *a1, _WORD *a2, _WORD *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (!a1) {
    return 22LL;
  }
  uint64_t v10 = _NETRBClientCopyFixtureForwardedPorts(a1, (uint64_t)a2, (uint64_t)a3, a4, a5, a6, a7, a8);
  if (!v10) {
    return 22LL;
  }
  uint64_t v11 = v10;
  if (xpc_get_type(v10) != (xpc_type_t)&_xpc_type_dictionary) {
    return 22LL;
  }
  *a2 = xpc_dictionary_get_uint64(v11, netrbClientForwardedLowPort);
  __int16 uint64 = xpc_dictionary_get_uint64(v11, netrbClientForwardedHighPort);
  uint64_t result = 0LL;
  *a3 = uint64;
  return result;
}

uint64_t _MISIsAllowedMoreHost( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a1) {
    return _NETRBClientIsAllowedMoreHost(a1, a2, a3, a4, a5, a6, a7, a8);
  }
  else {
    return 22LL;
  }
}

uint64_t _MISAddHost(uint64_t a1, int a2)
{
  uint64_t v2 = 22LL;
  if (a1)
  {
    else {
      unsigned int v3 = 0;
    }
    else {
      return 22LL;
    }
  }

  return v2;
}

uint64_t _MISRemoveHost(uint64_t a1, int a2)
{
  uint64_t v2 = 22LL;
  if (a1)
  {
    else {
      unsigned int v3 = 0;
    }
    else {
      return 22LL;
    }
  }

  return v2;
}

uint64_t _MISGetHostCount( uint64_t a1, _DWORD *a2, _DWORD *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8 = 22LL;
  if (a1)
  {
    else {
      return 22LL;
    }
  }

  return v8;
}

uint64_t _MISSetHostCount( uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8 = 22LL;
  if (a1)
  {
    else {
      uint64_t v9 = 0LL;
    }
    else {
      return 22LL;
    }
  }

  return v8;
}

uint64_t _MISGetExt( uint64_t a1, char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return 0LL;
}

void sub_100153950(id a1)
{
  __str[33] = 0;
  qword_100219F50 = (uint64_t)dispatch_queue_create(__str, 0LL);
}

void sub_1001539D4()
{
}

void sub_1001539FC()
{
  __assert_rtn("__WiFiPolicyRelease", "WiFiPolicy.c", 200, "CFGetTypeID(object) == WiFiPolicyGetTypeID()");
}

void sub_100153A24()
{
  __assert_rtn( "__WiFiLQAMgrAvgValidPerCoreRssiSamples",  "WiFiLinkQualityManager.c",  4123,  "validCore0RssiCount <= arrayCount");
}

void sub_100153A4C()
{
  __assert_rtn( "__WiFiLQAMgrAvgValidPerCoreRssiSamples",  "WiFiLinkQualityManager.c",  4124,  "validCore1RssiCount <= arrayCount");
}

void sub_100153A74()
{
}

void sub_100153A9C()
{
  __assert_rtn("__WiFiLQAMgrRelease", "WiFiLinkQualityManager.c", 1235, "CFGetTypeID(object) == WiFiLQAMgrGetTypeID()");
}

void sub_100153AC4()
{
  *(_WORD *)uint64_t v0 = 0;
  _os_log_fault_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_FAULT,  "Fatal chip watchdog with missing reason or subreason",  v0,  2u);
}

void sub_100153B08()
{
  sub_10003B8A4( (void *)&_mh_execute_header,  (os_log_s *)&_os_log_default,  v0,  "%s: CFPropertyListCreateWithData returned with error %@",  v1,  v2,  v3,  v4,  2u);
  sub_10003B8C8();
}

void sub_100153B80()
{
  int v0 = 136315138;
  uint64_t v1 = "_WiFiCopyUnserialized";
  _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "%s: Invalid buffer/buffersize.",  (uint8_t *)&v0,  0xCu);
  sub_10003B8C8();
}

void sub_100153C00()
{
  sub_10003B8A4( (void *)&_mh_execute_header,  (os_log_s *)&_os_log_default,  v0,  "%s: CFPropertyListWrite returned with error %@",  v1,  v2,  v3,  v4,  2u);
  sub_10003B8C8();
}

void sub_100153C78( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100153CEC(uint64_t a1, char a2, char a3)
{
  uint64_t v3 = "NO";
  xpc_object_t v6 = "-[WiFiFindAndJoinRequest _canPerformRetry:]";
  __int16 v7 = 2112;
  if ((a2 & 1) != 0) {
    uint64_t v4 = "YES";
  }
  else {
    uint64_t v4 = "NO";
  }
  int v5 = 136315906;
  uint64_t v8 = a1;
  __int16 v9 = 2080;
  uint64_t v10 = v4;
  if ((a3 & 1) == 0) {
    uint64_t v3 = "YES";
  }
  __int16 v11 = 2080;
  uint64_t v12 = v3;
  _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "%s: last error (%@), retry expired=%s exceeded=%s",  (uint8_t *)&v5,  0x2Au);
}

void sub_100153DB0( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100153E24( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100153E98(void *a1, double a2)
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([a1 scanFailureList]);
  unsigned int v5 = [v4 count];
  xpc_object_t v6 = (void *)objc_claimAutoreleasedReturnValue([a1 joinFailureList]);
  int v7 = 136315650;
  uint64_t v8 = "-[WiFiFindAndJoinRequest _checkAndRequestChipResetIfNeeded]";
  __int16 v9 = 1024;
  unsigned int v10 = [v6 count] + v5;
  __int16 v11 = 1024;
  int v12 = (int)a2;
  _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "%s: encountered multiple (%d) failures, performing chip reset before retrying (remaining time %ds)...",  (uint8_t *)&v7,  0x18u);
}

void sub_100153F88( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100153FFC(uint8_t *a1, void *a2, uint64_t a3)
{
  *(_DWORD *)a1 = 136315138;
  *a2 = "-[WiFiFindAndJoinRequest _runFindAndJoinOnInterface:outError:]";
  sub_100060778( (void *)&_mh_execute_header,  (os_log_s *)&_os_log_default,  a3,  "%s: no match in scan results, performing scan retry...",  a1);
}

void sub_100154044( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1001540B8(uint8_t *a1, void *a2, uint64_t a3)
{
  *(_DWORD *)a1 = 136315138;
  *a2 = "-[WiFiFindAndJoinRequest _runFindAndJoinOnInterface:outError:]";
  sub_100060778( (void *)&_mh_execute_header,  (os_log_s *)&_os_log_default,  a3,  "%s: no join candidate, performing scan retry...",  a1);
}

void sub_100154100( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100154174(void *a1)
{
  int v1 = 136315394;
  uint64_t v2 = "-[WiFiFindAndJoinRequest _runFindAndJoinOnInterface:outError:]";
  __int16 v3 = 1024;
  unsigned int v4 = [a1 channelBand];
  _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "%s: invalid band specified (%d), forcing to 2.4GHz",  (uint8_t *)&v1,  0x12u);
  sub_10003B8C8();
}

void sub_100154204()
{
  *(_WORD *)uint64_t v0 = 0;
  _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "_set_user_dir_suffix failed!\n",  v0,  2u);
}

void sub_100154248(const void *a1, char a2, uint64_t a3)
{
  unsigned int v5 = sub_100095BC8(a1);
  xpc_object_t v6 = "enabled";
  int v7 = 136315906;
  uint64_t v8 = "WiFiNetworkSetStateWithReason";
  unsigned int v10 = v5;
  __int16 v9 = 2112;
  __int16 v11 = 2080;
  if (!a2) {
    xpc_object_t v6 = "disabled";
  }
  int v12 = v6;
  __int16 v13 = 2112;
  uint64_t v14 = a3;
  _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "%s: Network '%@' %s for auto-join due to %@",  (uint8_t *)&v7,  0x2Au);
}

void sub_100154318()
{
}

void sub_10015437C()
{
}

void sub_1001543E0()
{
}

void sub_100154444(void *a1)
{
}

void sub_1001544A8()
{
}

void sub_10015450C()
{
}

void sub_100154570()
{
}

void sub_1001545D4(void *a1)
{
}

void sub_100154638()
{
}

void sub_10015469C(int a1, uint64_t a2, uint64_t a3)
{
  if (a1) {
    unsigned int v4 = "ENABLED";
  }
  else {
    unsigned int v4 = "DISABLED";
  }
  int v5 = 136315650;
  xpc_object_t v6 = v4;
  __int16 v7 = 2112;
  uint64_t v8 = sub_10003BEDC(a2);
  __int16 v9 = 2112;
  uint64_t v10 = a3;
  _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "Auto join %s by %@ for %@",  (uint8_t *)&v5,  0x20u);
}

void sub_100154758()
{
  __assert_rtn( "__WiFiDeviceManagerRegister",  "WiFiDeviceManager.c",  2523,  "__kWiFiDeviceManagerTypeID != _kCFRuntimeNotATypeID");
}

void sub_100154780()
{
  *(_WORD *)uint64_t v0 = 0;
  _os_log_fault_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_FAULT,  "Will request to chip reset with no triggerReason",  v0,  2u);
}

void sub_1001547C4()
{
}

void sub_100154828(void *a1)
{
}

void sub_10015488C()
{
}

void sub_1001548B4()
{
  __assert_rtn("__WiFiCacheEntryRelease", "WiFiCacheEntry.c", 135, "CFGetTypeID(object) == WiFiCacheEntryGetTypeID()");
}

void sub_1001548DC()
{
}

void sub_100154904()
{
  __assert_rtn( "__WiFiVirtualInterfaceRelease",  "WiFiVirtualInterface.c",  342,  "CFGetTypeID(virtIntf) == WiFiVirtualInterfaceGetTypeID()");
}

void sub_10015492C()
{
}

void sub_100154954()
{
  __assert_rtn("__WiFiATJMgrRelease", "WiFiAskToJoinManager.c", 176, "CFGetTypeID(object) == WiFiATJMgrGetTypeID()");
}

void sub_10015497C()
{
}

void sub_1001549A4()
{
  __assert_rtn("__WiFiAudioRouteRelease", "WiFiAudioRoute.c", 145, "CFGetTypeID(object) == WiFiAudioRouteGetTypeID()");
}

void sub_1001549CC()
{
}

void sub_100154A30(void *a1)
{
}

void sub_100154A94()
{
}

void sub_100154AF8()
{
  *(_WORD *)uint64_t v0 = 0;
  _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "Couldn't create os log object",  v0,  2u);
}

id objc_msgSend__isSymptomTrackingRtTrafficForFlowNamed_withProperties_andClassification_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_isSymptomTrackingRtTrafficForFlowNamed:withProperties:andClassification:");
}

id objc_msgSend_addRangingRttSampleWithRssi_rtt_snr_flags_channel_coreId_bitErrorRate_phyError_andPeerSnr_andPeerCoreId_andPeerBitErrorRate_andPeerPhyError_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "addRangingRttSampleWithRssi:rtt:snr:flags:channel:coreId:bitErrorRate:phyError:andPeerSnr:andPeerCoreId:andPe erBitErrorRate:andPeerPhyError:");
}

id objc_msgSend_addSoftApClientEvent_identifier_isAppleClient_isInstantHotspot_isAutoHotspot_isHidden_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addSoftApClientEvent:identifier:isAppleClient:isInstantHotspot:isAutoHotspot:isHidden:");
}

id objc_msgSend_addSoftApCoexEvent_deniedUnii1ChannelMap_deniedUnii2aChannelMap_deniedUnii2cChannelMap_deniedUnii3ChannelMap_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "addSoftApCoexEvent:deniedUnii1ChannelMap:deniedUnii2aChannelMap:deniedUnii2cChannelMap:deniedUnii3ChannelMap:");
}

id objc_msgSend_bssWithIdentifier_apProfile_apMode_phyMode_channel_channelFlags_channelWidth_rssi_latitude_longitude_isEdgeBss_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "bssWithIdentifier:apProfile:apMode:phyMode:channel:channelFlags:channelWidth:rssi:latitude:longitude:isEdgeBss:");
}

id objc_msgSend_copyScoreSortedNetworksAvailableAtLocationWithinDistance_distance_authComparator_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "copyScoreSortedNetworksAvailableAtLocationWithinDistance:distance:authComparator:");
}

id objc_msgSend_initWithChannelNumber_bandwidth_is2_4GHz_is5GHz_is6GHz_isDFS_extensionChannelAbove_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithChannelNumber:bandwidth:is2_4GHz:is5GHz:is6GHz:isDFS:extensionChannelAbove:");
}

id objc_msgSend_initWithClient_network_bundleId_localizedAppName_originator_poweredOff_wapi_sessionBased_useSSIDPrefix_callback_context_bypassPrompt_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "initWithClient:network:bundleId:localizedAppName:originator:poweredOff:wapi:sessionBased:useSSIDPrefix:callba ck:context:bypassPrompt:");
}

id objc_msgSend_initWithCoordinate_altitude_horizontalAccuracy_verticalAccuracy_timestamp_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithCoordinate:altitude:horizontalAccuracy:verticalAccuracy:timestamp:");
}

id objc_msgSend_initWithManager_availabilityEngine_scanResults_disableProminentFiltering_blacklistedSSIDs_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithManager:availabilityEngine:scanResults:disableProminentFiltering:blacklistedSSIDs:");
}

id objc_msgSend_initializeDeviceLockState_displayState_motionState_callState_mediaState_chargingState_companionConnectionState_andSecondaryInterfaceName_compatibilityMode_badLinkRssi_goodLinkRssi_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "initializeDeviceLockState:displayState:motionState:callState:mediaState:chargingState:companionConnectionStat e:andSecondaryInterfaceName:compatibilityMode:badLinkRssi:goodLinkRssi:");
}

id objc_msgSend_joinRecommendationEventWithSource_action_BSSID_latitude_longitude_score_visibleDuration_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "joinRecommendationEventWithSource:action:BSSID:latitude:longitude:score:visibleDuration:");
}

id objc_msgSend_maintenanceTask_location_predictedForDuration_maxPredictedLocations_completionHandler_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "maintenanceTask:location:predictedForDuration:maxPredictedLocations:completionHandler:");
}

id objc_msgSend_notifyDriverAvailability_available_version_flags_eventID_reason_subReason_minorReason_reasonString_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "notifyDriverAvailability:available:version:flags:eventID:reason:subReason:minorReason:reasonString:");
}

id objc_msgSend_notifyIpConfigurationStateWithMethod_dhcpLeaseDuration_hasRoutableIpV4_hasRoutableIpV6_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "notifyIpConfigurationStateWithMethod:dhcpLeaseDuration:hasRoutableIpV4:hasRoutableIpV6:");
}

id objc_msgSend_populateWithRssi_rssi0_rssi1_rssiMode_noise_noise0_noise1_snr_selfCca_otherCca_interference_totalReportedCca_beaconPer_rxCrsGlitch_rxBadPLCP_rxStart_rxBphyCrsGlitch_rxBphyBadPLCP_sampleDuration_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "populateWithRssi:rssi0:rssi1:rssiMode:noise:noise0:noise1:snr:selfCca:otherCca:interference:totalReportedCca: beaconPer:rxCrsGlitch:rxBadPLCP:rxStart:rxBphyCrsGlitch:rxBphyBadPLCP:sampleDuration:");
}

id objc_msgSend_populateWithTxFrames_RxFrames_TxFails_TxRetries_RxRetries_TxRate_RxRate_txRTS_txRTSFail_txMpdu_txAMPDU_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "populateWithTxFrames:RxFrames:TxFails:TxRetries:RxRetries:TxRate:RxRate:txRTS:txRTSFail:txMpdu:txAMPDU:");
}

id objc_msgSend_rangingSessionRequestedWithSelfPreferredChannel_selfMainChannel_selfChannelFlags_peerPreferredChannel_peerMainChannel_peerChannelFlags_requester_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "rangingSessionRequestedWithSelfPreferredChannel:selfMainChannel:selfChannelFlags:peerPreferredChannel:peerMai nChannel:peerChannelFlags:requester:");
}

id objc_msgSend_receivedBssTransitionRequest_candidateListIncluded_isAbridged_disassociationImminent_bssTerminationIncluded_essDisassociationImminent_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "receivedBssTransitionRequest:candidateListIncluded:isAbridged:disassociationImminent:bssTerminationIncluded:e ssDisassociationImminent:");
}

id objc_msgSend_setApplicationRunningState_foregroundState_andNetworkingState_forBundleId_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setApplicationRunningState:foregroundState:andNetworkingState:forBundleId:");
}

id objc_msgSend_setBluetoothState_connectedDeviceCount_inA2dp_inSco_inUniAoS_inBiAoS_btAudioBand_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBluetoothState:connectedDeviceCount:inA2dp:inSco:inUniAoS:inBiAoS:btAudioBand:");
}

id objc_msgSend_setDestinationFile_runLoopRef_runLoopMode_classC_dateFormatter_maxFileSizeInMB_logLifespanInDays_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "setDestinationFile:runLoopRef:runLoopMode:classC:dateFormatter:maxFileSizeInMB:logLifespanInDays:");
}

id objc_msgSend_setDestinationFileLocation_fileNamePrefix_runLoopRef_runLoopMode_classC_dateFormatter_maxFileSizeInMB_logLifespanInDays_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "setDestinationFileLocation:fileNamePrefix:runLoopRef:runLoopMode:classC:dateFormatter:maxFileSizeInMB:logLifespanInDays:");
}

id objc_msgSend_setJoinEvent_withReason_lastDisconnectReason_lastJoinFailure_andNetworkDetails_forInterface_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "setJoinEvent:withReason:lastDisconnectReason:lastJoinFailure:andNetworkDetails:forInterface:");
}

id objc_msgSend_setLinkEvent_isInvoluntary_linkChangeReason_linkChangeSubreason_withNetworkDetails_forInterface_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "setLinkEvent:isInvoluntary:linkChangeReason:linkChangeSubreason:withNetworkDetails:forInterface:");
}

id objc_msgSend_setRoamingState_withReason_asString_andStatus_asString_andLatency_andRoamData_andPingPongSequence_forInterface_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "setRoamingState:withReason:asString:andStatus:asString:andLatency:andRoamData:andPingPongSequence:forInterface:");
}

id objc_msgSend_setScanningState_client_neighborBSS_otherBSS_withChannelInfoList_withRequest_forInterface_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setScanningState:client:neighborBSS:otherBSS:withChannelInfoList:withRequest:forInterface:");
}

id objc_msgSend_setSoftApState_requester_status_changeReason_channelNumber_countryCode_isHidden_isInfraConnected_isAwdlUp_lowPowerModeDuration_compatibilityMode_requestToUpLatency_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "setSoftApState:requester:status:changeReason:channelNumber:countryCode:isHidden:isInfraConnected:isAwdlUp:low PowerModeDuration:compatibilityMode:requestToUpLatency:");
}

id objc_msgSend_setSteeringRequest_preferredChannel_preferredBand_preferredSSID_targetSSIDDiffersFromCurrent_preferredBSS_ssidIsSplit_transitionCandidates_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "setSteeringRequest:preferredChannel:preferredBand:preferredSSID:targetSSIDDiffersFromCurrent:preferredBSS:ssi dIsSplit:transitionCandidates:");
}

id objc_msgSend_updateWithBspOverflowed_IsBSPActive_BspTimeToTST_BspSampleDurationMS_IsScanActiveBSP_IsP2PActiveBSP_BspTriggerCount_BspMutePercentage_BspMaxMuteMS_BspAvgMuteMS_BspErrorPercentage_BspTimeOutPercentageOfTriggers_BspRejectOrFailPercentageOfTriggers_bspMaxConsecutiveFails_supportsLinkRecommendation_forInterface_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "updateWithBspOverflowed:IsBSPActive:BspTimeToTST:BspSampleDurationMS:IsScanActiveBSP:IsP2PActiveBSP:BspTrigge rCount:BspMutePercentage:BspMaxMuteMS:BspAvgMuteMS:BspErrorPercentage:BspTimeOutPercentageOfTriggers:BspRejec tOrFailPercentageOfTriggers:bspMaxConsecutiveFails:supportsLinkRecommendation:forInterface:");
}

id objc_msgSend_updateWithChQualScore_txLatencyScore_rxLatencyScore_txLossScore_rxLossScore_txLatencyP95_linkRecommendationFlags_rtTrafficStatus_forInterface_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "updateWithChQualScore:txLatencyScore:rxLatencyScore:txLossScore:rxLossScore:txLatencyP95:linkRecommendationFl ags:rtTrafficStatus:forInterface:");
}

id objc_msgSend_userNotificationCenter_didReceiveNotificationResponse_withCompletionHandler_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "userNotificationCenter:didReceiveNotificationResponse:withCompletionHandler:");
}

id objc_msgSend_writeToURL_atomically_encoding_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeToURL:atomically:encoding:error:");
}
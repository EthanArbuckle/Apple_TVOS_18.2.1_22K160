@interface ACLSNetworkUtilities
+ (BOOL)areDigestedIdentifiers:(id)a3 equalToCleartextIdentifiers:(id)a4 tag:(unsigned int)a5;
+ (BOOL)hasUsefulUSBEthernetInterface;
+ (BOOL)isAutomaticConfigMethod4:(id)a3;
+ (BOOL)isAutomaticConfigMethod6:(id)a3;
+ (BOOL)isDigestedIdentifier:(id)a3 equalToCleartextIdentifier:(id)a4 tag:(unsigned int)a5;
+ (BOOL)isManualConfigMethod4:(id)a3;
+ (BOOL)isManualConfigMethod6:(id)a3;
+ (BOOL)isShareableInaddr4:(const in_addr *)a3;
+ (BOOL)isShareableInaddr6:(const in6_addr *)a3;
+ (BOOL)isShareableSockaddr4:(const sockaddr_in *)a3;
+ (BOOL)isShareableSockaddr6:(const sockaddr_in6 *)a3;
+ (BOOL)isUsefulInaddr4:(const in_addr *)a3;
+ (BOOL)isUsefulInaddr6:(const in6_addr *)a3;
+ (BOOL)isUsefulSockaddr4:(const sockaddr_in *)a3;
+ (BOOL)isUsefulSockaddr6:(const sockaddr_in6 *)a3;
+ (BOOL)isWiredNetworkInterfaceType:(id)a3;
+ (BOOL)makeLocalAddresses:(id *)a3 andGatewayIdentifiers:(id *)a4 tag:(unsigned int)a5;
+ (double)speedFromEthernetMediaSubType:(id)a3;
+ (id)allActiveNetworkInterfaces;
+ (id)createNetworkInterface:(__SCNetworkInterface *)a3 service:(__SCNetworkService *)a4 configInfo:(id)a5;
+ (id)digestIdentifier:(id)a3 tag:(unsigned int)a4;
+ (id)digestIdentifiers:(id)a3 tag:(unsigned int)a4;
+ (id)netmask4ContainingStartAddress:(id)a3 endAddress:(id)a4;
+ (id)serviceIDFromKey:(id)a3;
+ (id)stringFromInaddr4:(const in_addr *)a3;
+ (id)stringFromInaddr6:(const in6_addr *)a3;
+ (id)stringFromMacAddr:(char *)a3;
+ (id)stringFromSockaddr4:(const sockaddr_in *)a3;
+ (id)stringFromSockaddr6:(const sockaddr_in6 *)a3;
+ (id)stringFromSockaddrDL:(const sockaddr_dl *)a3;
+ (id)stringFromSockaddrStorage:(const sockaddr_storage *)a3;
@end

@implementation ACLSNetworkUtilities

+ (BOOL)hasUsefulUSBEthernetInterface
{
  __int128 v8 = 0u;
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  id v2 = (id)objc_claimAutoreleasedReturnValue([a1 allActiveNetworkInterfaces]);
  id v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v9;
    while (2)
    {
      for (i = 0LL; i != v3; i = (char *)i + 1)
      {
        if (*(void *)v9 != v4) {
          objc_enumerationMutation(v2);
        }
        v6 = *(void **)(*((void *)&v8 + 1) + 8LL * (void)i);
        if (objc_msgSend(v6, "isNCM", (void)v8) && (objc_msgSend(v6, "useful") & 1) != 0)
        {
          LOBYTE(v3) = 1;
          goto LABEL_12;
        }
      }

      id v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }

+ (id)netmask4ContainingStartAddress:(id)a3 endAddress:(id)a4
{
  id v5 = a4;
  v17[0] = 0LL;
  v17[1] = 0LL;
  v16[0] = 0LL;
  v16[1] = 0LL;
  if (inet_pton(2, (const char *)[a3 UTF8String], (char *)v17 + 4) < 1
    || inet_pton(2, (const char *)[v5 UTF8String], (char *)v16 + 4) < 1)
  {
    goto LABEL_8;
  }

  unsigned int v6 = 0;
  unsigned int v7 = bswap32(HIDWORD(v16[0]) ^ HIDWORD(v17[0]));
  unsigned int v8 = 0x80000000;
  do
  {
    unsigned int v9 = v6;
    if (!v8) {
      break;
    }
    v6 |= v8;
    BOOL v10 = (v8 & v7) == 0;
    v8 >>= 1;
  }

  while (v10);
  *(void *)v14 = 0LL;
  uint64_t v15 = 0LL;
  unsigned int v13 = bswap32(v9);
  if (inet_ntop(2, &v13, v14, 0x10u)) {
    __int128 v11 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v14));
  }
  else {
LABEL_8:
  }
    __int128 v11 = &stru_100031770;

  return v11;
}

+ (id)allActiveNetworkInterfaces
{
  id v3 = (void *)objc_opt_new(&OBJC_CLASS___NSMutableArray, a2);
  uint64_t v4 = SCPreferencesCreate(0LL, @"AssetCacheTetherator", 0LL);
  if (v4)
  {
    v68 = v4;
    __int128 v98 = 0u;
    __int128 v99 = 0u;
    __int128 v100 = 0u;
    __int128 v101 = 0u;
    id v5 = SCNetworkServiceCopyAll(v4);
    id v6 = -[__CFArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v98,  v112,  16LL);
    if (!v6) {
      goto LABEL_104;
    }
    id v7 = v6;
    uint64_t v8 = 0LL;
    uint64_t v88 = *(void *)v99;
    v78 = v5;
    v75 = v3;
    while (1)
    {
      unsigned int v9 = 0LL;
      id v84 = v7;
      do
      {
        if (*(void *)v99 != v88) {
          objc_enumerationMutation(v5);
        }
        BOOL v10 = *(const __SCNetworkService **)(*((void *)&v98 + 1) + 8LL * (void)v9);
        CFStringRef ServiceID = SCNetworkServiceGetServiceID(v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue(ServiceID);
        if (v12)
        {
          v89 = v12;
          if (os_log_type_enabled((os_log_t)gLogHandle, OS_LOG_TYPE_INFO)) {
            unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableString stringWithFormat:]( &OBJC_CLASS___NSMutableString,  "stringWithFormat:",  @"service[%d] %@",  v8,  v12));
          }
          else {
            unsigned int v13 = 0LL;
          }
          if (!SCNetworkServiceGetEnabled(v10))
          {
            [v13 appendFormat:@", network service disabled %@", v10];
            int v22 = 0;
            BSDName = 0LL;
            goto LABEL_28;
          }

          Interface = SCNetworkServiceGetInterface(v10);
          [v13 appendFormat:@", if %@", Interface];
          SCNetworkInterfaceRef v15 = SCNetworkInterfaceGetInterface(Interface);
          if (v15)
          {
            while (1)
            {
              v16 = v15;
              if (CFEqual(v15, kSCNetworkInterfaceIPv4)) {
                break;
              }
              Interface = v16;
              [v13 appendFormat:@", if %@", v16];
              SCNetworkInterfaceRef v15 = SCNetworkInterfaceGetInterface(v16);
              if (!v15) {
                goto LABEL_17;
              }
            }
          }

          if (Interface)
          {
LABEL_17:
            BSDName = (__CFString *)SCNetworkInterfaceGetBSDName(Interface);
            [v13 appendFormat:@", bn %@", BSDName];
            if (!BSDName) {
              goto LABEL_26;
            }
            NetworkInterfaceEntity = SCDynamicStoreKeyCreateNetworkInterfaceEntity( 0LL,  kSCDynamicStoreDomainState,  BSDName,  kSCEntNetLink);
            [v13 appendFormat:@", lk %@", NetworkInterfaceEntity];
            if (NetworkInterfaceEntity)
            {
              BSDName = (__CFString *)SCDynamicStoreCreate(0LL, @"AssetCacheTetherator", 0LL, 0LL);
              objc_msgSend(v13, "appendFormat:", @", ds %d", BSDName != 0);
              if (BSDName)
              {
                v19 = (const __CFDictionary *)SCDynamicStoreCopyValue( (SCDynamicStoreRef)BSDName,  NetworkInterfaceEntity);
                if (v19)
                {
                  store = (const __SCDynamicStore *)BSDName;
                  v77 = NetworkInterfaceEntity;
                  v20 = v19;
                  objc_msgSend(v13, "appendFormat:", @", li %d", CFDictionaryGetCount(v19));
                  v76 = v20;
                  Value = (const __CFBoolean *)CFDictionaryGetValue(v20, kSCPropNetLinkActive);
                  [v13 appendFormat:@", la %@ %d", Value, Value == kCFBooleanTrue];
                  if (Value != kCFBooleanTrue) {
                    goto LABEL_22;
                  }
                  v27 = SCNetworkServiceCopyProtocol(v10, kSCNetworkProtocolTypeIPv4);
                  v85 = v10;
                  if (!v27)
                  {
                    objc_msgSend(v13, "appendFormat:", @", 4p %d", 0xFFFFFFFFLL);
                    goto LABEL_70;
                  }

                  v28 = v27;
                  objc_msgSend(v13, "appendFormat:", @", 4p %d", SCNetworkProtocolGetEnabled(v27));
                  CFDictionaryRef Configuration = SCNetworkProtocolGetConfiguration(v28);
                  v30 = (void *)objc_claimAutoreleasedReturnValue(Configuration);
                  v31 = v30;
                  if (!v30)
                  {
                    objc_msgSend(v13, "appendFormat:", @", 4c %d", 0xFFFFFFFFLL);
                    goto LABEL_68;
                  }

                  objc_msgSend(v13, "appendFormat:", @", 4c %d", objc_msgSend(v30, "count"));
                  if (!SCNetworkProtocolGetEnabled(v28)) {
                    goto LABEL_68;
                  }
                  v73 = v28;
                  v32 = (void *)objc_claimAutoreleasedReturnValue([v31 objectForKey:kSCPropNetIPv4ConfigMethod]);
                  [v13 appendFormat:@", 4m %@", v32];
                  v71 = v31;
                  if ([a1 isManualConfigMethod4:v32])
                  {
                    v69 = v32;
                    BSDName = (__CFString *)objc_claimAutoreleasedReturnValue( [a1 createNetworkInterface:Interface service:v10 configInfo:v31]);
                    goto LABEL_67;
                  }

                  if (![a1 isAutomaticConfigMethod4:v32]
                    || (NetworkServiceEntity = SCDynamicStoreKeyCreateNetworkServiceEntity( 0,  kSCDynamicStoreDomainState,  kSCCompAnyRegex,  kSCEntNetIPv4),  [v13 appendFormat:@", 4g %@", NetworkServiceEntity],  !NetworkServiceEntity))
                  {

                    v28 = v73;
                    goto LABEL_68;
                  }

                  v69 = v32;
                  CFArrayRef v34 = SCDynamicStoreCopyKeyList(store, NetworkServiceEntity);
                  __int128 v94 = 0u;
                  __int128 v95 = 0u;
                  __int128 v96 = 0u;
                  __int128 v97 = 0u;
                  v35 = v34;
                  id v36 = -[__CFArray countByEnumeratingWithState:objects:count:]( v35,  "countByEnumeratingWithState:objects:count:",  &v94,  v111,  16LL);
                  if (!v36)
                  {

                    v45 = v35;
                    goto LABEL_65;
                  }

                  id v37 = v36;
                  obj = v35;
                  cf = NetworkServiceEntity;
                  id v86 = a1;
                  BSDName = 0LL;
                  uint64_t v81 = *(void *)v95;
                  do
                  {
                    for (i = 0LL; i != v37; i = (char *)i + 1)
                    {
                      if (*(void *)v95 != v81) {
                        objc_enumerationMutation(obj);
                      }
                      v39 = *(const __CFString **)(*((void *)&v94 + 1) + 8LL * (void)i);
                      v40 = (void *)objc_claimAutoreleasedReturnValue([v86 serviceIDFromKey:v39]);
                      if ([v40 isEqualToString:v89])
                      {
                        v41 = (void *)SCDynamicStoreCopyValue(store, v39);
                        v42 = v41;
                        if (v41) {
                          uint64_t v43 = (uint64_t)[v41 count];
                        }
                        else {
                          uint64_t v43 = 0xFFFFFFFFLL;
                        }
                        objc_msgSend(v13, "appendFormat:", @", 4d %d", v43);
                        uint64_t v44 = objc_claimAutoreleasedReturnValue([v86 createNetworkInterface:Interface service:v85 configInfo:v42]);

                        if (!v44) {
                          [v13 appendFormat:@", !4d %@", v42];
                        }

                        BSDName = (__CFString *)v44;
                        BOOL v10 = v85;
                      }
                    }

                    id v37 = -[__CFArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v94,  v111,  16LL);
                  }

                  while (v37);
                  v45 = obj;

                  a1 = v86;
                  NetworkServiceEntity = cf;
                  if (!BSDName)
                  {
LABEL_65:
                    [v13 appendFormat:@", !4l %@", v45];
                    BSDName = 0LL;
                  }

                  CFRelease(NetworkServiceEntity);

                  id v5 = v78;
LABEL_67:

                  v31 = v71;
                  v28 = v73;
                  if (!BSDName)
                  {
LABEL_68:
                    [v13 appendFormat:@", !4c %@, !4p %@", v31, v28];
                    BSDName = 0LL;
                  }

                  CFRelease(v28);

                  id v3 = v75;
                  if (BSDName) {
                    goto LABEL_102;
                  }
LABEL_70:
                  v46 = SCNetworkServiceCopyProtocol(v10, kSCNetworkProtocolTypeIPv6);
                  if (v46)
                  {
                    v47 = v46;
                    objc_msgSend(v13, "appendFormat:", @", 6p %d", SCNetworkProtocolGetEnabled(v46));
                    CFDictionaryRef v48 = SCNetworkProtocolGetConfiguration(v47);
                    v49 = (void *)objc_claimAutoreleasedReturnValue(v48);
                    v50 = v49;
                    if (!v49)
                    {
                      objc_msgSend(v13, "appendFormat:", @", 6c %d", 0xFFFFFFFFLL);
                      goto LABEL_100;
                    }

                    objc_msgSend(v13, "appendFormat:", @", 6c %d", objc_msgSend(v49, "count"));
                    if (!SCNetworkProtocolGetEnabled(v47)) {
                      goto LABEL_100;
                    }
                    v51 = (void *)objc_claimAutoreleasedReturnValue([v50 objectForKey:kSCPropNetIPv6ConfigMethod]);
                    [v13 appendFormat:@", 6m %@", v51];
                    if ([a1 isManualConfigMethod6:v51])
                    {
                      v72 = v51;
                      v74 = v50;
                      BSDName = (__CFString *)objc_claimAutoreleasedReturnValue( [a1 createNetworkInterface:Interface service:v10 configInfo:v50]);
                      goto LABEL_99;
                    }

                    if (![a1 isAutomaticConfigMethod6:v51]
                      || (v52 = SCDynamicStoreKeyCreateNetworkServiceEntity( 0,  kSCDynamicStoreDomainState,  kSCCompAnyRegex,  kSCEntNetIPv6),  [v13 appendFormat:@", 6g %@", v52],  !v52))
                    {

                      goto LABEL_100;
                    }

                    v72 = v51;
                    v74 = v50;
                    v70 = v52;
                    CFArrayRef v53 = SCDynamicStoreCopyKeyList(store, v52);
                    __int128 v90 = 0u;
                    __int128 v91 = 0u;
                    __int128 v92 = 0u;
                    __int128 v93 = 0u;
                    v54 = v53;
                    id v87 = -[__CFArray countByEnumeratingWithState:objects:count:]( v54,  "countByEnumeratingWithState:objects:count:",  &v90,  v110,  16LL);
                    if (!v87)
                    {

                      v63 = v54;
                      goto LABEL_97;
                    }

                    obja = v54;
                    cfa = v47;
                    BSDName = 0LL;
                    uint64_t v82 = *(void *)v91;
                    do
                    {
                      for (j = 0LL; j != v87; j = (char *)j + 1)
                      {
                        if (*(void *)v91 != v82) {
                          objc_enumerationMutation(obja);
                        }
                        v56 = *(const __CFString **)(*((void *)&v90 + 1) + 8LL * (void)j);
                        v57 = (void *)objc_claimAutoreleasedReturnValue([a1 serviceIDFromKey:v56]);
                        if ([v57 isEqualToString:v89])
                        {
                          v58 = (void *)SCDynamicStoreCopyValue(store, v56);
                          v59 = v58;
                          if (v58) {
                            uint64_t v60 = (uint64_t)[v58 count];
                          }
                          else {
                            uint64_t v60 = 0xFFFFFFFFLL;
                          }
                          objc_msgSend(v13, "appendFormat:", @", 6d %d", v60);
                          id v61 = a1;
                          uint64_t v62 = objc_claimAutoreleasedReturnValue([a1 createNetworkInterface:Interface service:v85 configInfo:v59]);

                          if (!v62) {
                            [v13 appendFormat:@", !6d %@", v59];
                          }

                          BSDName = (__CFString *)v62;
                          a1 = v61;
                          id v5 = v78;
                        }
                      }

                      id v87 = -[__CFArray countByEnumeratingWithState:objects:count:]( obja,  "countByEnumeratingWithState:objects:count:",  &v90,  v110,  16LL);
                    }

                    while (v87);
                    v63 = obja;

                    v47 = cfa;
                    if (!BSDName)
                    {
LABEL_97:
                      [v13 appendFormat:@", !6l %@", v63];
                      BSDName = 0LL;
                    }

                    CFRelease(v70);

LABEL_99:
                    v50 = v74;
                    if (!BSDName)
                    {
LABEL_100:
                      [v13 appendFormat:@", !6c %@, !6p %@", v50, v47];
                      BSDName = 0LL;
                    }

                    CFRelease(v47);

                    id v3 = v75;
                    if (BSDName)
                    {
LABEL_102:
                      CFRelease(v76);
                      v26 = store;
                      id v7 = v84;
                      NetworkInterfaceEntity = v77;
                      goto LABEL_35;
                    }
                  }

                  else
                  {
                    objc_msgSend(v13, "appendFormat:", @", 6p %d", 0xFFFFFFFFLL);
                  }

+ (double)speedFromEthernetMediaSubType:(id)a3
{
  id v3 = a3;
  uint64_t v4 = (const char *)[v3 UTF8String];
  if (v4)
  {
    BOOL v10 = 0LL;
    double v5 = strtod(v4, &v10);
    double v6 = v5;
    BOOL v7 = v5 <= 0.0 || v10 == 0LL;
    if (!v7 && *v10 == 71) {
      double v6 = v5 * 1000.0;
    }
  }

  else
  {
    [v3 doubleValue];
    double v6 = v8;
  }

  return v6;
}

+ (id)createNetworkInterface:(__SCNetworkInterface *)a3 service:(__SCNetworkService *)a4 configInfo:(id)a5
{
  id v8 = a5;
  BOOL v10 = (void *)objc_opt_new(&OBJC_CLASS___ACLSNetworkInterface, v9);
  [v10 setBsdName:SCNetworkInterfaceGetBSDName(a3)];
  [v10 setDeviceID:SCNetworkServiceGetServiceID(a4)];
  [v10 setUserReadable:SCNetworkInterfaceGetLocalizedDisplayName(a3)];
  [v10 setInterfaceType:SCNetworkInterfaceGetInterfaceType(a3)];
  __int128 v11 = (void *)objc_claimAutoreleasedReturnValue([v10 interfaceType]);
  objc_msgSend(v10, "setWired:", objc_msgSend(a1, "isWiredNetworkInterfaceType:", v11));

  [v10 setLocationID:&off_1000335A8];
  [v10 setIsNCM:0];
  uint64_t IORegistryEntryID = _SCNetworkInterfaceGetIORegistryEntryID(a3);
  if (IORegistryEntryID)
  {
    uint64_t v13 = IORegistryEntryID;
    mainPort[0] = 0;
    if (!IOMainPort(0, mainPort))
    {
      mach_port_t v14 = mainPort[0];
      if (mainPort[0])
      {
        SCNetworkInterfaceRef v15 = IORegistryEntryIDMatching(v13);
        io_service_t MatchingService = IOServiceGetMatchingService(v14, v15);
        if (MatchingService)
        {
          io_registry_entry_t v17 = MatchingService;
          v18 = (const __CFNumber *)IORegistryEntrySearchCFProperty( MatchingService,  "IOService",  @"locationID",  0LL,  3u);
          if (v18)
          {
            v19 = v18;
            CFNumberGetValue(v18, kCFNumberSInt32Type, &valuePtr);
            v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  valuePtr));
            [v10 setLocationID:v20];

            CFRelease(v19);
          }

          io_registry_entry_t valuePtr = 0;
          if (!IORegistryEntryGetParentEntry(v17, "IOService", &valuePtr) && valuePtr)
          {
            objc_msgSend(v10, "setIsNCM:", IOObjectConformsTo(valuePtr, "AppleUSBDeviceNCMData") != 0);
            IOObjectRelease(valuePtr);
          }

          IOObjectRelease(v17);
        }

        mach_port_deallocate(mach_task_self_, mainPort[0]);
      }
    }
  }

  if ([v10 wired])
  {
    *(void *)mainPort = 0LL;
    SCNetworkInterfaceCopyMediaOptions(a3, 0LL, (CFDictionaryRef *)mainPort, 0LL, 1u);
    if (*(void *)mainPort)
    {
      Value = CFDictionaryGetValue(*(CFDictionaryRef *)mainPort, kSCPropNetEthernetMediaSubType);
      int v22 = (void *)objc_claimAutoreleasedReturnValue(Value);
      [a1 speedFromEthernetMediaSubType:v22];
      objc_msgSend(v10, "setSpeed:");
      CFRelease(*(CFTypeRef *)mainPort);
    }
  }

  v23 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:kSCPropNetIPv4Addresses]);
  v24 = (void *)objc_claimAutoreleasedReturnValue([v23 lastObject]);

  v25 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:kSCPropNetIPv4SubnetMasks]);
  v26 = (void *)objc_claimAutoreleasedReturnValue([v25 lastObject]);

  v27 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:kSCPropNetIPv6Addresses]);
  v28 = (void *)objc_claimAutoreleasedReturnValue([v27 lastObject]);

  v29 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:kSCPropNetIPv6PrefixLength]);
  v30 = (void *)objc_claimAutoreleasedReturnValue([v29 lastObject]);

  [v10 setShareable:0];
  [v10 setUseful:0];
  if ([v24 length] && objc_msgSend(v26, "length"))
  {
    *(void *)mainPort = 0LL;
    v37[0] = 0LL;
    id v31 = v24;
    if (inet_pton(2, (const char *)[v31 UTF8String], &mainPort[1]) >= 1)
    {
      [v10 setIpAddress:v31];
      objc_msgSend(v10, "setShareable:", objc_msgSend(a1, "isShareableSockaddr4:", mainPort));
      id v32 = [a1 isUsefulSockaddr4:mainPort];
LABEL_23:
      [v10 setUseful:v32];
    }
  }

  else if ([v28 length])
  {
    if (v30)
    {
      *(void *)mainPort = 0LL;
      v37[0] = 0LL;
      int v38 = 0;
      v37[1] = 0LL;
      id v33 = v28;
      if (inet_pton(30, (const char *)[v33 UTF8String], v37) >= 1)
      {
        [v10 setIpAddress:v33];
        objc_msgSend(v10, "setShareable:", objc_msgSend(a1, "isShareableSockaddr6:", mainPort));
        id v32 = [a1 isUsefulSockaddr6:mainPort];
        goto LABEL_23;
      }
    }
  }

  return v10;
}

+ (BOOL)isShareableSockaddr4:(const sockaddr_in *)a3
{
  return [a1 isShareableInaddr4:&a3->sin_addr];
}

+ (BOOL)isShareableSockaddr6:(const sockaddr_in6 *)a3
{
  return [a1 isShareableInaddr6:&a3->sin6_addr];
}

+ (BOOL)isShareableInaddr4:(const in_addr *)a3
{
  unsigned int v3 = bswap32(a3->s_addr);
  if (v3 >> 20 == 2753) {
    return 1;
  }
  unsigned int v5 = v3 & 0xFFFF0000;
  return v5 == -1062731776 || v5 == -1442971648;
}

+ (BOOL)isShareableInaddr6:(const in6_addr *)a3
{
  if (a3->__u6_addr32[0] || a3->__u6_addr32[1]) {
    return 1;
  }
  if (!a3->__u6_addr32[2] && !a3->__u6_addr32[3]) {
    return 0;
  }
  if (a3->__u6_addr32[2]) {
    return 1;
  }
  return a3->__u6_addr32[3] != 0x1000000;
}

+ (BOOL)isUsefulSockaddr4:(const sockaddr_in *)a3
{
  return [a1 isUsefulInaddr4:&a3->sin_addr];
}

+ (BOOL)isUsefulSockaddr6:(const sockaddr_in6 *)a3
{
  return [a1 isUsefulInaddr6:&a3->sin6_addr];
}

+ (BOOL)isUsefulInaddr4:(const in_addr *)a3
{
  BOOL v4 = (unsigned __int16)a3->s_addr != 65193 && a3->s_addr != 127;
  return a3->s_addr && v4;
}

+ (BOOL)isUsefulInaddr6:(const in6_addr *)a3
{
  if (a3->__u6_addr32[0]) {
    return a3->__u6_addr32[0] != 254 || (a3->__u6_addr32[0] & 0xC000) != 0x8000;
  }
  else {
    return a3->__u6_addr32[1]
  }
        || (a3->__u6_addr32[2] || a3->__u6_addr32[3]) && (a3->__u6_addr32[2] || a3->__u6_addr32[3] != 0x1000000);
}

+ (BOOL)isManualConfigMethod4:(id)a3
{
  return [a3 isEqualToString:kSCValNetIPv4ConfigMethodManual];
}

+ (BOOL)isManualConfigMethod6:(id)a3
{
  return [a3 isEqualToString:kSCValNetIPv6ConfigMethodManual];
}

+ (BOOL)isAutomaticConfigMethod4:(id)a3
{
  id v3 = a3;
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  kSCValNetIPv4ConfigMethodDHCP,  kSCValNetIPv4ConfigMethodINFORM,  kSCValNetIPv4ConfigMethodBOOTP,  kSCValNetIPv4ConfigMethodPPP,  0LL));
  unsigned __int8 v5 = [v4 containsObject:v3];

  return v5;
}

+ (BOOL)isAutomaticConfigMethod6:(id)a3
{
  return [a3 isEqualToString:kSCValNetIPv6ConfigMethodAutomatic];
}

+ (BOOL)isWiredNetworkInterfaceType:(id)a3
{
  id v3 = a3;
  v8[0] = kSCNetworkInterfaceTypeBond;
  v8[1] = kSCNetworkInterfaceTypeEthernet;
  v8[2] = kSCNetworkInterfaceTypeFireWire;
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v8, 3LL));
  unsigned __int8 v5 = v4;
  if (v3) {
    unsigned __int8 v6 = [v4 containsObject:v3];
  }
  else {
    unsigned __int8 v6 = 0;
  }

  return v6;
}

+ (id)serviceIDFromKey:(id)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSScanner scannerWithString:](&OBJC_CLASS___NSScanner, "scannerWithString:", a3));
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSCharacterSet characterSetWithCharactersInString:]( &OBJC_CLASS___NSCharacterSet,  "characterSetWithCharactersInString:",  @"/"));
  unsigned __int8 v5 = 0LL;
  if ([v3 scanUpToString:@"/Network/Service/" intoString:0])
  {
    unsigned __int8 v5 = 0LL;
    if ([v3 scanString:@"/Network/Service/" intoString:0])
    {
      id v9 = 0LL;
      unsigned __int8 v6 = [v3 scanUpToCharactersFromSet:v4 intoString:&v9];
      id v7 = v9;
      unsigned __int8 v5 = v7;
      if ((v6 & 1) == 0)
      {

        unsigned __int8 v5 = 0LL;
      }
    }
  }

  return v5;
}

+ (id)stringFromInaddr4:(const in_addr *)a3
{
  *(void *)unsigned __int8 v5 = 0LL;
  uint64_t v6 = 0LL;
  id v3 = (char *)inet_ntop(2, a3, v5, 0x10u);
  if (v3) {
    id v3 = (char *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v5));
  }
  return v3;
}

+ (id)stringFromInaddr6:(const in6_addr *)a3
{
  id v3 = (char *)inet_ntop(30, a3, (char *)v5, 0x2Eu);
  if (v3) {
    id v3 = (char *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v5));
  }
  return v3;
}

+ (id)stringFromMacAddr:(char *)a3
{
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%02x:%02x:%02x:%02x:%02x:%02x",  *a3,  a3[1],  a3[2],  a3[3],  a3[4],  a3[5]);
}

+ (id)stringFromSockaddr4:(const sockaddr_in *)a3
{
  return [a1 stringFromInaddr4:&a3->sin_addr];
}

+ (id)stringFromSockaddr6:(const sockaddr_in6 *)a3
{
  return [a1 stringFromInaddr6:&a3->sin6_addr];
}

+ (id)stringFromSockaddrDL:(const sockaddr_dl *)a3
{
  if (a3->sdl_type == 6 && a3->sdl_alen == 6)
  {
    BOOL v4 = (void *)objc_claimAutoreleasedReturnValue([a1 stringFromMacAddr:&a3->sdl_data[a3->sdl_nlen]]);
  }

  else
  {
    unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableString stringWithFormat:]( &OBJC_CLASS___NSMutableString,  "stringWithFormat:",  @"<type=%#x>",  a3->sdl_type));
    BOOL v4 = v5;
    if (a3->sdl_nlen) {
      objc_msgSend(v5, "appendFormat:", @"%.*s", a3->sdl_nlen, a3->sdl_data);
    }
    else {
      [v5 appendString:@"<unknown>"];
    }
    if (a3->sdl_alen)
    {
      unint64_t v6 = 0LL;
      id v7 = &a3->sdl_data[a3->sdl_nlen];
      id v8 = @":";
      do
      {
        [v4 appendString:v8];
        objc_msgSend(v4, "appendFormat:", @"%02x", v7[v6++]);
        id v8 = @"-";
      }

      while (v6 < a3->sdl_alen);
    }
  }

  return v4;
}

+ (id)stringFromSockaddrStorage:(const sockaddr_storage *)a3
{
  int ss_family = a3->ss_family;
  switch(ss_family)
  {
    case 30:
      BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "stringFromSockaddr6:"));
      break;
    case 18:
      BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "stringFromSockaddrDL:"));
      break;
    case 2:
      BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "stringFromSockaddr4:"));
      break;
    default:
      BOOL v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"(family=%u)",  a3->ss_family));
      break;
  }

  return v4;
}

+ (BOOL)makeLocalAddresses:(id *)a3 andGatewayIdentifiers:(id *)a4 tag:(unsigned int)a5
{
  id v8 = gLogHandle;
  if (os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_DEBUG)) {
    sub_10001F7F4(a5, (os_log_s *)v8);
  }

  *(_OWORD *)v127 = xmmword_100026060;
  uint64_t v128 = 7LL;
  size_t __size = 0LL;
  id v9 = 0LL;
  id v10 = 0LL;
  __int128 v11 = 0LL;
  v12 = 0LL;
  if (sysctl(v127, 6u, 0LL, &__size, 0LL, 0LL)) {
    goto LABEL_9;
  }
  uint64_t v13 = (unsigned __int16 *)malloc(__size);
  if (!v13)
  {
    id v9 = 0LL;
    id v10 = 0LL;
    __int128 v11 = 0LL;
    v12 = 0LL;
    goto LABEL_9;
  }

  mach_port_t v14 = v13;
  if (sysctl(v127, 6u, v13, &__size, 0LL, 0LL))
  {
    id v9 = 0LL;
    SCNetworkInterfaceRef v15 = (char *)v14;
    id v10 = 0LL;
    __int128 v11 = 0LL;
    v12 = 0LL;
    goto LABEL_7;
  }

  if ((uint64_t)__size < 1)
  {
    id v9 = 0LL;
    id v10 = 0LL;
    __int128 v11 = 0LL;
    v12 = 0LL;
    SCNetworkInterfaceRef v15 = (char *)v14;
    goto LABEL_7;
  }

  unsigned int v96 = a5;
  char v97 = 0;
  v21 = 0LL;
  uint64_t v98 = 0LL;
  unint64_t v95 = 0LL;
  unint64_t v22 = (unint64_t)v14 + __size;
  __int128 v94 = v14;
  v23 = v14;
  __int128 v99 = a4;
  __int128 v100 = a3;
  do
  {
    if (os_log_type_enabled((os_log_t)gLogHandle, OS_LOG_TYPE_DEBUG)) {
      v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableString stringWithFormat:]( &OBJC_CLASS___NSMutableString,  "stringWithFormat:",  @"sa_family=%d, rtm_addrs=%#x, rtm_flags=%#x",  *((unsigned __int8 *)v23 + 93),  *((unsigned int *)v23 + 3),  *((unsigned int *)v23 + 2)));
    }
    else {
      v24 = 0LL;
    }
    int v25 = *((unsigned __int8 *)v23 + 93);
    BOOL v26 = v25 == 2 || v25 == 30;
    if (!v26)
    {
      v40 = gLogHandle;
      if (os_log_type_enabled((os_log_t)gLogHandle, OS_LOG_TYPE_DEBUG))
      {
        v59 = v40;
        uint64_t v60 = currentQueueName();
        LODWORD(buf[0]) = 67109635;
        HIDWORD(buf[0]) = v96;
        LOWORD(buf[1]) = 2080;
        *(void *)((char *)&buf[1] + 2) = v60;
        WORD1(buf[2]) = 2113;
        *(void *)((char *)&buf[2] + 4) = v24;
        _os_log_debug_impl( (void *)&_mh_execute_header,  v59,  OS_LOG_TYPE_DEBUG,  "#%08x [%s] makeLocalAddresses: %{private}@",  (uint8_t *)buf,  0x1Cu);
      }

      goto LABEL_103;
    }

    __int128 v101 = v21;
    v27 = (unsigned __int8 *)(v23 + 46);
    bzero(buf, 0x400uLL);
    uint64_t v28 = 0LL;
    uint64_t v29 = 0LL;
    while (((*((_DWORD *)v23 + 3) >> v29) & 1) == 0)
    {
LABEL_43:
      ++v29;
      v28 += 16LL;
      if (v28 == 128) {
        goto LABEL_47;
      }
    }

    uint64_t v30 = *v27;
    if ((unint64_t)&v27[v30] <= v22 && v30 <= 0x80 && &v27[v30] <= (unsigned __int8 *)v23 + *v23)
    {
      memcpy(&buf[v28], v27, *v27);
      if (v28 == 32) {
        v124[121] = BYTE1(buf[0]);
      }
      if (os_log_type_enabled((os_log_t)gLogHandle, OS_LOG_TYPE_DEBUG))
      {
        id v32 = off_100030AA8[v29];
        uint64_t v33 = *v27;
        CFArrayRef v34 = (void *)objc_claimAutoreleasedReturnValue([a1 stringFromSockaddrStorage:&buf[v28]]);
        [v24 appendFormat:@", %s=[%u]%@", v32, v33, v34];
      }

      int v35 = *v27;
      uint64_t v36 = ((v35 - 1) & 0xFFFFFFFC) + 4LL;
      BOOL v26 = v35 == 0;
      uint64_t v37 = 4LL;
      if (!v26) {
        uint64_t v37 = v36;
      }
      v27 += v37;
      goto LABEL_43;
    }

    if (os_log_type_enabled((os_log_t)gLogHandle, OS_LOG_TYPE_DEBUG)) {
      objc_msgSend( v24,  "appendFormat:",  @", skipping %s (sa=%p + len=%d = %p, lim=%p, msg=%p)",  off_100030AA8[v29],  v27,  v30,  &v27[v30],  v22,  (char *)v23 + *v23);
    }
LABEL_47:
    int v38 = gLogHandle;
    v21 = v101;
    if (os_log_type_enabled((os_log_t)v38, OS_LOG_TYPE_DEBUG))
    {
      v47 = currentQueueName();
      *(_DWORD *)__int16 v106 = 67109635;
      unsigned int v107 = v96;
      __int16 v108 = 2080;
      v109 = v47;
      __int16 v110 = 2113;
      *(void *)v111 = v24;
      _os_log_debug_impl( (void *)&_mh_execute_header,  (os_log_t)v38,  OS_LOG_TYPE_DEBUG,  "#%08x [%s] makeLocalAddresses: %{private}@",  v106,  0x1Cu);
    }

    int v39 = __n_1;
    a4 = v99;
    if (BYTE1(buf[0]) == __n_1)
    {
      a3 = v100;
      if (BYTE1(buf[0]) == 30)
      {
        goto LABEL_62;
      }

      if (BYTE1(buf[0]) == 2)
      {
        if (HIDWORD(buf[0])) {
          goto LABEL_103;
        }
        if (!v125) {
          goto LABEL_62;
        }
LABEL_61:
        if (v124[120]) {
          goto LABEL_103;
        }
LABEL_62:
        uint64_t v42 = v98;
        if (v98 >= v95)
        {
          uint64_t v43 = 2 * v95;
          if (!v95) {
            uint64_t v43 = 10LL;
          }
          unint64_t v95 = v43;
          uint64_t v42 = v98;
          v21 = (char *)realloc(v101, 272 * v43);
        }

        uint64_t v44 = &v21[272 * v42];
        *((_OWORD *)v44 + 15) = 0u;
        *((_OWORD *)v44 + 16) = 0u;
        *((_OWORD *)v44 + 13) = 0u;
        *((_OWORD *)v44 + 14) = 0u;
        *((_OWORD *)v44 + 11) = 0u;
        *((_OWORD *)v44 + 12) = 0u;
        *((_OWORD *)v44 + 9) = 0u;
        *((_OWORD *)v44 + 10) = 0u;
        *((_OWORD *)v44 + 7) = 0u;
        *((_OWORD *)v44 + 8) = 0u;
        *((_OWORD *)v44 + 5) = 0u;
        *((_OWORD *)v44 + 6) = 0u;
        *((_OWORD *)v44 + 3) = 0u;
        *((_OWORD *)v44 + 4) = 0u;
        *((_OWORD *)v44 + 1) = 0u;
        *((_OWORD *)v44 + 2) = 0u;
        *(_OWORD *)uint64_t v44 = 0u;
        *(_DWORD *)uint64_t v44 = v23[2];
        memcpy(v44 + 136, &__n, __n);
        v45 = gLogHandle;
        if (os_log_type_enabled((os_log_t)v45, OS_LOG_TYPE_DEBUG))
        {
          id v61 = currentQueueName();
          int v62 = *(_DWORD *)v44;
          id v63 = (id)objc_claimAutoreleasedReturnValue([a1 stringFromSockaddrStorage:v44 + 136]);
          *(_DWORD *)__int16 v106 = 67110147;
          unsigned int v107 = v96;
          __int16 v108 = 2080;
          v109 = v61;
          a3 = v100;
          __int16 v110 = 2048;
          *(void *)v111 = v42;
          *(_WORD *)&v111[8] = 1024;
          *(_DWORD *)&v111[10] = v62;
          __int16 v112 = 2113;
          id v113 = v63;
          _os_log_debug_impl( (void *)&_mh_execute_header,  (os_log_t)v45,  OS_LOG_TYPE_DEBUG,  "#%08x [%s] makeLocalAddresses: defaultAddresses[%ld]: ifindex=%d gwaddr=%{private}@",  v106,  0x2Cu);
        }

        uint64_t v98 = v42 + 1;

        int v39 = __n_1;
      }

      else
      {
        int v39 = BYTE1(buf[0]);
      }
    }

    else
    {
      a3 = v100;
    }

    if ((*((_BYTE *)v23 + 9) & 4) != 0 && v39 == 18)
    {
      v46 = &v124[__n_5];
      if (*(_DWORD *)v46 | *((unsigned __int16 *)v46 + 2))
      {
        if (!(v97 & 1 | (__n_6 != 6)))
        {
          if (*(_DWORD *)v46 ^ 2 | *((unsigned __int16 *)v46 + 2))
          {
            char v97 = 0;
          }

          else
          {
            CFDictionaryRef v48 = gLogHandle;
            if (os_log_type_enabled((os_log_t)v48, OS_LOG_TYPE_ERROR))
            {
              id v64 = currentQueueName();
              *(_DWORD *)__int16 v106 = 67109378;
              unsigned int v107 = v96;
              __int16 v108 = 2080;
              v109 = v64;
              _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)v48,  OS_LOG_TYPE_ERROR,  "#%08x [%s] makeLocalAddresses: denied access to MAC address",  v106,  0x12u);
            }

            char v97 = 1;
          }
        }

        if (v98 >= 1)
        {
          for (unint64_t i = 0LL; &v21[i] < &v21[272 * v98]; i += 272LL)
          {
            char v50 = v21[i + 270];
            if ((v50 & 2) == 0)
            {
              int v51 = v21[i + 137];
              if (v51 == 2 && BYTE1(buf[0]) == 2)
              {
                if (*(_DWORD *)&v21[i + 140] == HIDWORD(buf[0])) {
                  goto LABEL_100;
                }
              }

              else if (v51 == 30 {
                     && BYTE1(buf[0]) == 30
              }
                     && *(void *)&v21[i + 144] == buf[1]
                     && *(void *)&v21[i + 152] == buf[2])
              {
LABEL_100:
                v55 = &v21[i];
                v56 = &v124[__n_5];
                int v57 = *(_DWORD *)v56;
                *((_WORD *)v55 + 134) = *((_WORD *)v56 + 2);
                *((_DWORD *)v55 + 66) = v57;
                v55[270] = v50 | 2;
                v58 = gLogHandle;
                if (os_log_type_enabled((os_log_t)v58, OS_LOG_TYPE_DEBUG))
                {
                  v65 = currentQueueName();
                  id v66 = (id)objc_claimAutoreleasedReturnValue([a1 stringFromMacAddr:v55 + 264]);
                  *(_DWORD *)__int16 v106 = 67109891;
                  unsigned int v107 = v96;
                  __int16 v108 = 2080;
                  v109 = v65;
                  a3 = v100;
                  __int16 v110 = 1024;
                  *(_DWORD *)v111 = -252645135 * (i >> 4);
                  *(_WORD *)&v111[4] = 2113;
                  *(void *)&v111[6] = v66;
                  _os_log_debug_impl( (void *)&_mh_execute_header,  (os_log_t)v58,  OS_LOG_TYPE_DEBUG,  "#%08x [%s] makeLocalAddresses: defaultAddresses[%d]: gwmac=%{private}@",  v106,  0x22u);
                }

                break;
              }
            }
          }
        }
      }
    }

+ (id)digestIdentifier:(id)a3 tag:(unsigned int)a4
{
  id v5 = a3;
  arc4random_buf(__buf, 0x20uLL);
  id v6 = v5;
  CCHmac(2u, [v6 UTF8String], (size_t)objc_msgSend(v6, "length"), __buf, 0x20uLL, macOut);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:", macOut, 32LL));
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:", __buf, 32LL));
  id v9 = gLogHandle;
  if (os_log_type_enabled((os_log_t)gLogHandle, OS_LOG_TYPE_DEBUG))
  {
    log = v9;
    *(_DWORD *)buf = 67111171;
    unsigned int v16 = a4;
    __int16 v17 = 2080;
    id v18 = currentQueueName();
    __int16 v19 = 2113;
    id v20 = v6;
    __int16 v21 = 2112;
    unint64_t v22 = @"digest";
    __int16 v23 = 1040;
    unsigned int v24 = [v7 length];
    __int16 v25 = 2096;
    id v26 = [v7 bytes];
    __int16 v27 = 2112;
    uint64_t v28 = @"key";
    __int16 v29 = 1040;
    unsigned int v30 = [v8 length];
    __int16 v31 = 2096;
    id v32 = [v8 bytes];
    _os_log_debug_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_DEBUG,  "#%08x [%s] digestIdentifier:%{private}@ -> %@=%.*P, %@=%.*P",  buf,  0x50u);
  }

  v13[0] = @"digest";
  v13[1] = @"key";
  v14[0] = v7;
  v14[1] = v8;
  id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v14,  v13,  2LL));

  return v10;
}

+ (id)digestIdentifiers:(id)a3 tag:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v6 count]));
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  id v8 = v6;
  id v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      v12 = 0LL;
      do
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( a1,  "digestIdentifier:tag:",  *(void *)(*((void *)&v15 + 1) + 8 * (void)v12),  v4,  (void)v15));
        [v7 addObject:v13];

        v12 = (char *)v12 + 1;
      }

      while (v10 != v12);
      id v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }

    while (v10);
  }

  return v7;
}

+ (BOOL)isDigestedIdentifier:(id)a3 equalToCleartextIdentifier:(id)a4 tag:(unsigned int)a5
{
  id v7 = a4;
  id v8 = a3;
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:@"digest"]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:@"key"]);

  if ([v9 length] == (id)32 && objc_msgSend(v10, "length") == (id)32)
  {
    unsigned int v22 = a5;
    id v11 = v7;
    id v12 = [v11 UTF8String];
    id v21 = v11;
    id v13 = [v11 length];
    id v14 = v10;
    CCHmac(2u, v12, (size_t)v13, [v14 bytes], (size_t)objc_msgSend(v14, "length"), macOut);
    id v15 = v9;
    int v16 = cc_cmp_safe(32, [v15 bytes], macOut);
    BOOL v17 = v16 == 0;
    __int128 v18 = gLogHandle;
    if (os_log_type_enabled((os_log_t)gLogHandle, OS_LOG_TYPE_DEBUG))
    {
      id v20 = v18;
      *(_DWORD *)buf = 67111427;
      unsigned int v24 = v22;
      __int16 v25 = 2080;
      id v26 = currentQueueName();
      __int16 v27 = 2112;
      uint64_t v28 = @"digest";
      __int16 v29 = 1040;
      unsigned int v30 = [v15 length];
      __int16 v31 = 2096;
      id v32 = [v15 bytes];
      __int16 v33 = 2112;
      CFArrayRef v34 = @"key";
      __int16 v35 = 1040;
      unsigned int v36 = [v14 length];
      __int16 v37 = 2096;
      id v38 = [v14 bytes];
      __int16 v39 = 2113;
      id v40 = v21;
      __int16 v41 = 1024;
      BOOL v42 = v16 == 0;
      _os_log_debug_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEBUG,  "#%08x [%s] isDigestedIdentifier:%@=%.*P,%@=%.*P equalToCleartextIdentifier:%{private}@ -> %{BOOL}d",  buf,  0x56u);
    }
  }

  else
  {
    BOOL v17 = 0;
  }

  return v17;
}

+ (BOOL)areDigestedIdentifiers:(id)a3 equalToCleartextIdentifiers:(id)a4 tag:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  id v8 = a3;
  id v9 = a4;
  id v10 = gLogHandle;
  if (os_log_type_enabled((os_log_t)gLogHandle, OS_LOG_TYPE_DEBUG))
  {
    __int128 v18 = v10;
    v19[0] = 67110147;
    v19[1] = v5;
    __int16 v20 = 2080;
    id v21 = currentQueueName();
    __int16 v22 = 2112;
    id v23 = v8;
    __int16 v24 = 2048;
    id v25 = [v9 count];
    __int16 v26 = 2113;
    id v27 = v9;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEBUG,  "#%08x [%s] areDigestedIdentifiers:%@ equalToCleartextIdentifiers:[%ld]%{private}@",  (uint8_t *)v19,  0x30u);
  }

  id v11 = [v8 count];
  if (v11 == [v9 count])
  {
    if ([v8 count])
    {
      unint64_t v12 = 0LL;
      do
      {
        id v13 = (void *)objc_claimAutoreleasedReturnValue([v8 objectAtIndex:v12]);
        id v14 = (void *)objc_claimAutoreleasedReturnValue([v9 objectAtIndex:v12]);
        unsigned __int8 v15 = [a1 isDigestedIdentifier:v13 equalToCleartextIdentifier:v14 tag:v5];

        if ((v15 & 1) == 0) {
          break;
        }
        ++v12;
      }

      while (v12 < (unint64_t)[v8 count]);
    }

    else
    {
      unsigned __int8 v15 = 1;
    }
  }

  else
  {
    unsigned __int8 v15 = 0;
  }

  int v16 = gLogHandle;
  if (os_log_type_enabled((os_log_t)gLogHandle, OS_LOG_TYPE_DEBUG)) {
    sub_10001F88C(v16, v15, v5);
  }

  return v15;
}

@end
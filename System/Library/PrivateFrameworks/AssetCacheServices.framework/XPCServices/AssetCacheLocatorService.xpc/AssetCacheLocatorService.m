LABEL_22:
  return v18;
}

                  [v13 appendFormat:@", !li %@", v76];
                  CFRelease(v76);
                  NetworkInterfaceEntity = v77;
                  BSDName = (__CFString *)store;
                }

                else
                {
                  objc_msgSend(v13, "appendFormat:", @", li %d", 0xFFFFFFFFLL);
                }

                [v13 appendFormat:@", !ds %@", BSDName];
                v26 = BSDName;
                BSDName = 0LL;
                v7 = v84;
LABEL_35:
                CFRelease(v26);
                CFRelease(NetworkInterfaceEntity);
                if (BSDName)
                {
                  [v3 addObject:BSDName];
                  v22 = 1;
                }

                else
                {
                  v22 = 0;
                }

void sub_100002078( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, char a27)
{
}

void sub_10000209C(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  v7 = *(void **)(a1 + 32);
  v8 = *(void **)(a1 + 40);
  id v9 = a2;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "stringByAppendingFormat:", @"[%ld]", a3));
  LOBYTE(v7) = [v7 verify:v9 name:v10 withTemplate:*(void *)(a1 + 48) tag:*(unsigned int *)(a1 + 64)];

  if ((v7 & 1) == 0)
  {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL) = 0;
    *a4 = 1;
  }
}

void sub_10000213C(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  v7 = *(void **)(a1 + 32);
  id v8 = a3;
  id v9 = a2;
  id v12 = (id)objc_claimAutoreleasedReturnValue([v7 objectForKey:v9]);
  v10 = *(void **)(a1 + 40);
  v11 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) stringByAppendingFormat:@".%@", v9]);

  LOBYTE(v9) = [v10 verify:v12 name:v11 withTemplate:v8 tag:*(unsigned int *)(a1 + 64)];
  if ((v9 & 1) == 0)
  {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL) = 0;
    *a4 = 1;
  }
}

void sub_10000242C(uint64_t a1, uint64_t a2)
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( [*(id *)(a1 + 32) sanitize:a2 withTemplate:*(void *)(a1 + 40) tag:*(unsigned int *)(a1 + 56)]);
  if (v3)
  {
    v4 = v3;
    [*(id *)(a1 + 48) addObject:v3];
    v3 = v4;
  }
}

void sub_100002484(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  v5 = *(void **)(a1 + 32);
  id v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:v9]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) sanitize:v7 withTemplate:v6 tag:*(unsigned int *)(a1 + 56)]);

  if (v8) {
    [*(id *)(a1 + 48) setObject:v8 forKey:v9];
  }
}

LABEL_12:
  return (char)v3;
}

    v5 = 1;
    goto LABEL_13;
  }

  v5 = 1;
LABEL_14:
  v16 = _NSConcreteStackBlock;
  v17 = 3221225472LL;
  v18 = sub_10001C7D8;
  v19 = &unk_100031418;
  v14 = *(dispatch_queue_s **)(a1 + 40);
  v20 = *(id *)(a1 + 48);
  v21 = v5;
  dispatch_async(v14, &v16);
  if (!v4 && *(_BYTE *)(a1 + 60))
  {
    v15 = *(void **)(a1 + 32);
    objc_msgSend(v15, "locateTimeout", v16, v17, v18, v19);
    objc_msgSend( v15,  "relocateCachingServersWithTimeout:capabilities:affinityID:forceRefresh:tag:",  0,  0,  1,  *(unsigned int *)(a1 + 56));
  }
}

LABEL_28:
                v23 = gLogHandle;
                if (os_log_type_enabled((os_log_t)gLogHandle, OS_LOG_TYPE_INFO))
                {
                  v24 = v23;
                  v25 = currentQueueName();
                  *(_DWORD *)buf = 67109890;
                  v103 = 0;
                  v104 = 2080;
                  v105 = v25;
                  v106 = 1024;
                  v107 = v22;
                  v108 = 2112;
                  v109 = v13;
                  _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_INFO,  "#%08x [%s] allActiveNetworkInterfaces %d %@",  buf,  0x22u);
                }

                id v12 = v89;
                goto LABEL_31;
              }

              CFRelease(NetworkInterfaceEntity);
LABEL_26:
              v22 = 0;
LABEL_27:
              v7 = v84;
              goto LABEL_28;
            }
          }

          v22 = 0;
          BSDName = 0LL;
          goto LABEL_27;
        }

LABEL_31:
        id v8 = (v8 + 1);
        id v9 = (char *)v9 + 1;
      }

      while (v9 != v7);
      v64 = -[__CFArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v98,  v112,  16LL);
      v7 = v64;
      if (!v64)
      {
LABEL_104:

        CFRelease(v68);
        return v3;
      }
    }
  }

  return v3;
}

  -[AssetCacheLocatorService setDnsResolutionTimeout:](v2, "setDnsResolutionTimeout:", 5.0);
  v34 = CFPreferencesCopyAppValue(@"DNSResolutionTimeout", @"com.apple.AssetCacheLocatorService");
  v35 = (void *)v34;
  if (!v34) {
    goto LABEL_40;
  }
  if ((objc_opt_respondsToSelector(v34, "doubleValue") & 1) != 0)
  {
    [v35 doubleValue];
    -[AssetCacheLocatorService setDnsResolutionTimeout:](v2, "setDnsResolutionTimeout:");
    -[AssetCacheLocatorService dnsResolutionTimeout](v2, "dnsResolutionTimeout");
    if (v36 >= 1.0)
    {
      -[AssetCacheLocatorService dnsResolutionTimeout](v2, "dnsResolutionTimeout");
      if (v41 <= 60.0) {
        goto LABEL_40;
      }
      v37 = 60.0;
    }

    else
    {
      v37 = 1.0;
    }

    -[AssetCacheLocatorService setDnsResolutionTimeout:](v2, "setDnsResolutionTimeout:", v37);
  }

  else
  {
    v38 = gLogHandle;
    if (os_log_type_enabled((os_log_t)gLogHandle, OS_LOG_TYPE_DEFAULT))
    {
      v39 = v38;
      v40 = currentQueueName();
      buf = 67109890LL;
      v291 = 2080;
      v292 = v40;
      v293 = 2112;
      v294 = @"DNSResolutionTimeout";
      v295 = 2112;
      v296 = @"a number";
      _os_log_impl( (void *)&_mh_execute_header,  v39,  OS_LOG_TYPE_DEFAULT,  "#%08x [%s] bad type for preference %@; expected %@",
        (uint8_t *)&buf,
        0x26u);
    }
  }

    goto LABEL_32;
  }

  v14 = *(void *)(a1 + 64);
  v77 = 0LL;
  v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSPropertyListSerialization propertyListWithData:options:format:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "propertyListWithData:options:format:error:",  v14,  0LL,  0LL,  &v77));
  v16 = v77;
  if (v15 && (v17 = objc_opt_class(&OBJC_CLASS___NSDictionary), (objc_opt_isKindOfClass(v15, v17) & 1) != 0))
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue([v15 objectForKey:@"lastSaved"]);
    if (v18)
    {
      v19 = objc_opt_class(&OBJC_CLASS___NSDate);
      if ((objc_opt_isKindOfClass(v18, v19) & 1) != 0)
      {
        v20 = gLogHandle;
        if (os_log_type_enabled((os_log_t)gLogHandle, OS_LOG_TYPE_INFO))
        {
          v70 = v15;
          v21 = v16;
          v22 = *(_DWORD *)(a1 + 152);
          v68 = v20;
          v23 = v18;
          v24 = currentQueueName();
          v25 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) absoluteString]);
          *(_DWORD *)buf = 67109890;
          v81 = v22;
          v16 = v21;
          v82 = 2080;
          v83 = v24;
          v18 = v23;
          v84 = 2112;
          v85 = v25;
          v86 = 2112;
          v87 = v23;
          v15 = v70;
          _os_log_impl((void *)&_mh_execute_header, v68, OS_LOG_TYPE_INFO, "#%08x [%s] %@ lastSaved %@", buf, 0x26u);
        }

        v26 = *(void *)(a1 + 72);
        v90[0] = @"server";
        v90[1] = @"lastSaved";
        v91[0] = v26;
        v91[1] = v18;
        v27 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v91,  v90,  2LL));
        v3 = 1LL;
        goto LABEL_48;
      }
    }
  }

  else
  {
    v18 = 0LL;
  }

  v57 = gLogHandle;
  if (os_log_type_enabled((os_log_t)gLogHandle, OS_LOG_TYPE_DEFAULT))
  {
    v67 = *(_DWORD *)(a1 + 152);
    v69 = v57;
    v71 = v15;
    v58 = v16;
    v59 = currentQueueName();
    v60 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) absoluteString]);
    v61 = *(void **)(a1 + 80);
    v62 = v18;
    v63 = [*(id *)(a1 + 64) bytes];
    v64 = [*(id *)(a1 + 64) length];
    v65 = v63;
    v18 = v62;
    v66 = (void *)objc_claimAutoreleasedReturnValue([v61 safeString:v65 length:v64 forceHex:0]);
    *(_DWORD *)buf = 67110146;
    v81 = v67;
    v82 = 2080;
    v83 = v59;
    v16 = v58;
    v15 = v71;
    v84 = 2112;
    v85 = v60;
    v86 = 2112;
    v87 = v66;
    v88 = 2112;
    v89 = v16;
    _os_log_impl( (void *)&_mh_execute_header,  v69,  OS_LOG_TYPE_DEFAULT,  "#%08x [%s] Invalid response from %@: %@ (%@)",  buf,  0x30u);
  }

  v3 = 0LL;
  v27 = 0LL;
LABEL_48:

  if (!v27) {
    goto LABEL_32;
  }
  if ((v3 & 1) == 0) {
    sub_100021020();
  }
  v3 = 1LL;
LABEL_37:
  [*(id *)(a1 + 96) addObject:v27];
  v54 = [*(id *)(a1 + 96) count];
  if (v54 != [*(id *)(a1 + 104) count])
  {
    v56 = 0LL;
    v55 = 0LL;
    if (*(void *)(a1 + 88)) {
      goto LABEL_43;
    }
LABEL_42:
    [*(id *)(a1 + 80) updateHealthOfCachingServerWithHostport:*(void *)(a1 + 136) healthy:v3 override:1 callback:v55 callbackQueue:v56 tag:*(unsigned int *)(a1 + 152)];
    goto LABEL_43;
  }

  v72[0] = _NSConcreteStackBlock;
  v72[1] = 3221225472LL;
  v72[2] = sub_1000187F4;
  v72[3] = &unk_100031198;
  v73 = *(id *)(a1 + 96);
  v74 = *(id *)(a1 + 112);
  v76 = *(id *)(a1 + 144);
  v75 = *(id *)(a1 + 120);
  v55 = objc_retainBlock(v72);
  v56 = (dispatch_queue_s *)*(id *)(a1 + 128);

  if (!*(void *)(a1 + 88)) {
    goto LABEL_42;
  }
  if (v55) {
    dispatch_async(v56, v55);
  }
LABEL_43:
}

LABEL_103:
    v23 = (unsigned __int16 *)((char *)v23 + *v23);
  }

  while ((unint64_t)v23 < v22);
  free(v94);
  v102 = v21;
  if (!v98)
  {
    id v12 = 0LL;
    v11 = 0LL;
    v10 = 0LL;
    id v9 = 0LL;
    a5 = v96;
    goto LABEL_170;
  }

  v104 = 0LL;
  if (getifaddrs(&v104)) {
    v104 = 0LL;
  }
  if (os_log_type_enabled((os_log_t)gLogHandle, OS_LOG_TYPE_DEBUG))
  {
    v67 = v104;
    if (v104)
    {
      v68 = 0uLL;
      do
      {
        if (v67->ifa_name && v67->ifa_addr)
        {
          v118 = v68;
          v119 = v68;
          v116 = v68;
          v117 = v68;
          *(_OWORD *)&buf[4] = v68;
          v115 = v68;
          *(_OWORD *)buf = v68;
          *(_OWORD *)&buf[2] = v68;
          __memcpy_chk(buf, v67->ifa_addr, v67->ifa_addr->sa_len, 128LL);
          ifa_name = v67->ifa_name;
          ifa_flags = v67->ifa_flags;
          v71 = (void *)objc_claimAutoreleasedReturnValue([a1 stringFromSockaddrStorage:buf]);
          v72 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableString stringWithFormat:]( &OBJC_CLASS___NSMutableString,  "stringWithFormat:",  @"ifa_name=%s, ifa_flags=%#x, ifa_addr=%@",  ifa_name,  ifa_flags,  v71));

          if (v67->ifa_netmask)
          {
            v118 = 0u;
            v119 = 0u;
            v116 = 0u;
            v117 = 0u;
            v115 = 0u;
            memset(buf, 0, sizeof(buf));
            __memcpy_chk(buf, v67->ifa_netmask, v67->ifa_netmask->sa_len, 128LL);
            v73 = (void *)objc_claimAutoreleasedReturnValue([a1 stringFromSockaddrStorage:buf]);
            [v72 appendFormat:@", ifa_netmask=%@", v73];
          }

          if (v67->ifa_dstaddr)
          {
            v118 = 0u;
            v119 = 0u;
            v116 = 0u;
            v117 = 0u;
            v115 = 0u;
            memset(buf, 0, sizeof(buf));
            __memcpy_chk(buf, v67->ifa_dstaddr, v67->ifa_dstaddr->sa_len, 128LL);
            v74 = (void *)objc_claimAutoreleasedReturnValue([a1 stringFromSockaddrStorage:buf]);
            [v72 appendFormat:@", ifa_dstaddr=%@", v74];
          }

          v75 = gLogHandle;
          if (os_log_type_enabled((os_log_t)v75, OS_LOG_TYPE_DEBUG))
          {
            v76 = currentQueueName();
            *(_DWORD *)v106 = 67109634;
            v107 = v96;
            v108 = 2080;
            v109 = v76;
            v110 = 2112;
            *(void *)v111 = v72;
            _os_log_debug_impl( (void *)&_mh_execute_header,  (os_log_t)v75,  OS_LOG_TYPE_DEBUG,  "#%08x [%s] makeLocalAddresses: %@",  v106,  0x1Cu);
          }

          v68 = 0uLL;
        }

        v67 = v67->ifa_next;
      }

      while (v67);
    }
  }

  v77 = v102;
  v78 = &v102[272 * v98];
  if (v98 < 1) {
    goto LABEL_141;
  }
  while (2)
  {
    if ((v77[270] & 2) == 0) {
      goto LABEL_136;
    }
    v79 = v104;
    if (!v104) {
      goto LABEL_136;
    }
    while (2)
    {
      v80 = v79->ifa_name;
      if (!v80) {
        goto LABEL_135;
      }
      ifa_addr = v79->ifa_addr;
      if (!ifa_addr) {
        goto LABEL_135;
      }
      sa_family = ifa_addr->sa_family;
      if (sa_family != 30)
      {
        if (sa_family == 2 && ifa_addr->sa_len == 16)
        {
          buf[0] = 0LL;
          buf[1] = 0LL;
          __memcpy_chk(buf, ifa_addr, ifa_addr->sa_len, 16LL);
        }

        goto LABEL_135;
      }

      if (ifa_addr->sa_len != 28
        || (memset(buf, 0, 28),
            __memcpy_chk(buf, v79->ifa_addr, v79->ifa_addr->sa_len, 28LL),
            ![a1 isUsefulSockaddr6:buf]))
      {
LABEL_135:
        v79 = v79->ifa_next;
        if (!v79) {
          goto LABEL_136;
        }
        continue;
      }

      break;
    }

    memcpy(v77 + 8, v79->ifa_addr, v79->ifa_addr->sa_len);
    v77[270] |= 1u;
    v83 = gLogHandle;
    if (os_log_type_enabled((os_log_t)v83, OS_LOG_TYPE_DEBUG))
    {
      v84 = currentQueueName();
      v85 = (id)objc_claimAutoreleasedReturnValue([a1 stringFromSockaddrStorage:v77 + 8]);
      LODWORD(buf[0]) = 67109890;
      HIDWORD(buf[0]) = v96;
      LOWORD(buf[1]) = 2080;
      *(void *)((char *)&buf[1] + 2) = v84;
      WORD1(buf[2]) = 1024;
      HIDWORD(buf[2]) = -252645135 * ((unint64_t)(v77 - v102) >> 4);
      LOWORD(buf[3]) = 2112;
      *(void *)((char *)&buf[3] + 2) = v85;
      _os_log_debug_impl( (void *)&_mh_execute_header,  (os_log_t)v83,  OS_LOG_TYPE_DEBUG,  "#%08x [%s] makeLocalAddresses: defaultAddresses[%d]: ifaddr=%@",  (uint8_t *)buf,  0x22u);
    }

LABEL_136:
    v77 += 272;
    if (v77 < v78) {
      continue;
    }
    break;
  }

LABEL_141:
  if (v104) {
    freeifaddrs(v104);
  }
  a3 = v100;
  id v12 = 0LL;
  v11 = 0LL;
  v10 = 0LL;
  id v9 = 0LL;
  if (v98 < 1)
  {
    a5 = v96;
    a4 = v99;
    goto LABEL_170;
  }

  v86 = a1;
  v87 = v102 + 264;
  while (2)
  {
    if ((v87[6] & 1) != 0)
    {
      v88 = *(v87 - 255);
      if (v88 == 30)
      {
        if (!v10)
        {
          v10 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](&OBJC_CLASS___NSMutableArray, "arrayWithCapacity:", v98));
          v86 = a1;
        }

        v89 = (void *)objc_claimAutoreleasedReturnValue([v86 stringFromSockaddr6:v87 - 256]);
        v90 = v10;
LABEL_154:
        [v90 addObject:v89];

        v86 = a1;
      }

      else if (v88 == 2)
      {
        if (!v9)
        {
          id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](&OBJC_CLASS___NSMutableArray, "arrayWithCapacity:", v98));
          v86 = a1;
        }

        v89 = (void *)objc_claimAutoreleasedReturnValue([v86 stringFromSockaddr4:v87 - 256]);
        v90 = v9;
        goto LABEL_154;
      }
    }

    if ((v87[6] & 2) != 0)
    {
      v91 = (void *)objc_claimAutoreleasedReturnValue([v86 stringFromMacAddr:v87]);
      if (v11)
      {
        if ([v12 containsObject:v91])
        {
LABEL_161:

          v86 = a1;
          goto LABEL_162;
        }
      }

      else
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](&OBJC_CLASS___NSMutableArray, "arrayWithCapacity:", v98));
        v92 = objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithCapacity:](&OBJC_CLASS___NSMutableSet, "setWithCapacity:", v98));

        id v12 = (void *)v92;
        a3 = v100;
      }

      [v11 addObject:v91];
      [v12 addObject:v91];
      goto LABEL_161;
    }

LABEL_162:
    v93 = v87 + 8;
    v87 += 272;
    if (v93 < v78) {
      continue;
    }
    break;
  }

  a5 = v96;
  a4 = v99;
  if (v10)
  {
    if (v9)
    {
      [v9 addObjectsFromArray:v10];
    }

    else
    {
      v10 = v10;
      id v9 = v10;
    }
  }

LABEL_170:
  v15 = v102;
  if (v102) {
LABEL_7:
  }
    free(v15);
LABEL_9:
  if (a3) {
    *a3 = [v9 copy];
  }
  if (a4) {
    *a4 = [v11 copy];
  }
  v16 = gLogHandle;
  if (os_log_type_enabled((os_log_t)v16, OS_LOG_TYPE_INFO))
  {
    v17 = currentQueueName();
    v18 = [v11 count];
    LODWORD(buf[0]) = 67110147;
    HIDWORD(buf[0]) = a5;
    LOWORD(buf[1]) = 2080;
    *(void *)((char *)&buf[1] + 2) = v17;
    WORD1(buf[2]) = 2112;
    *(void *)((char *)&buf[2] + 4) = v9;
    WORD2(buf[3]) = 2048;
    *(void *)((char *)&buf[3] + 6) = v18;
    HIWORD(buf[4]) = 2113;
    buf[5] = v11;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v16,  OS_LOG_TYPE_INFO,  "#%08x [%s] makeLocalAddresses -> localAddresses=%@ gatewayIdentifiers=[%ld]%{private}@",  (uint8_t *)buf,  0x30u);
  }

  if ([v9 count]) {
    v19 = [v11 count] != 0;
  }
  else {
    v19 = 0;
  }

  return v19;
}

void sub_1000064E0(uint64_t a1)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) callback]);
  (*((void (**)(id, void, void))v2 + 2))(v2, *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 40));
}

int main(int argc, const char **argv, const char **envp)
{
  v3 = objc_autoreleasePoolPush();
  v4 = objc_alloc_init(&OBJC_CLASS___AssetCacheLocatorService);
  objc_autoreleasePoolPop(v3);
  -[AssetCacheLocatorService start](v4, "start");

  return 1;
}

LABEL_14:
  -[AssetCacheLocatorService setConcurrentDNSResolutions:](v2, "setConcurrentDNSResolutions:", 5LL);
  v18 = CFPreferencesCopyAppValue(@"ConcurrentDNSResolutions", @"com.apple.AssetCacheLocatorService");
  v19 = (void *)v18;
  if (!v18) {
    goto LABEL_23;
  }
  if ((objc_opt_respondsToSelector(v18, "intValue") & 1) != 0)
  {
    -[AssetCacheLocatorService setConcurrentDNSResolutions:]( v2,  "setConcurrentDNSResolutions:",  [v19 intValue]);
    if (-[AssetCacheLocatorService concurrentDNSResolutions](v2, "concurrentDNSResolutions") <= 0)
    {
      v20 = v2;
      v21 = 1LL;
    }

    else
    {
      if (-[AssetCacheLocatorService concurrentDNSResolutions](v2, "concurrentDNSResolutions") < 26) {
        goto LABEL_23;
      }
      v20 = v2;
      v21 = 25LL;
    }

    -[AssetCacheLocatorService setConcurrentDNSResolutions:](v20, "setConcurrentDNSResolutions:", v21);
  }

  else
  {
    v22 = gLogHandle;
    if (os_log_type_enabled((os_log_t)gLogHandle, OS_LOG_TYPE_DEFAULT))
    {
      v23 = v22;
      v24 = currentQueueName();
      buf = 67109890LL;
      v291 = 2080;
      v292 = v24;
      v293 = 2112;
      v294 = @"ConcurrentDNSResolutions";
      v295 = 2112;
      v296 = @"a number";
      _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEFAULT,  "#%08x [%s] bad type for preference %@; expected %@",
        (uint8_t *)&buf,
        0x26u);
    }
  }

LABEL_23:
  -[AssetCacheLocatorService setLocateTimeout:](v2, "setLocateTimeout:", 60.0);
  v25 = CFPreferencesCopyAppValue(@"LocateTimeout", @"com.apple.AssetCacheLocatorService");
  v26 = (void *)v25;
  if (!v25) {
    goto LABEL_31;
  }
  if ((objc_opt_respondsToSelector(v25, "doubleValue") & 1) != 0)
  {
    [v26 doubleValue];
    -[AssetCacheLocatorService setLocateTimeout:](v2, "setLocateTimeout:");
    -[AssetCacheLocatorService locateTimeout](v2, "locateTimeout");
    if (v27 >= 5.0)
    {
      -[AssetCacheLocatorService locateTimeout](v2, "locateTimeout");
      v33 = v32;
      v28 = 300.0;
      if (v33 <= 300.0) {
        goto LABEL_31;
      }
    }

    else
    {
      v28 = 5.0;
    }

    -[AssetCacheLocatorService setLocateTimeout:](v2, "setLocateTimeout:", v28);
  }

  else
  {
    v29 = gLogHandle;
    if (os_log_type_enabled((os_log_t)gLogHandle, OS_LOG_TYPE_DEFAULT))
    {
      v30 = v29;
      v31 = currentQueueName();
      buf = 67109890LL;
      v291 = 2080;
      v292 = v31;
      v293 = 2112;
      v294 = @"LocateTimeout";
      v295 = 2112;
      v296 = @"a number";
      _os_log_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_DEFAULT,  "#%08x [%s] bad type for preference %@; expected %@",
        (uint8_t *)&buf,
        0x26u);
    }
  }

      v24 = 1;
LABEL_25:

      goto LABEL_27;
    }

    goto LABEL_24;
  }

  if (inet_pton(30, (const char *)[v9 UTF8String], v37) == 1)
  {
    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    v17 = v8;
    v18 = [v17 countByEnumeratingWithState:&v29 objects:v49 count:16];
    if (v18)
    {
      v19 = v18;
      v20 = *(void *)v30;
LABEL_15:
      v21 = 0LL;
      while (1)
      {
        if (*(void *)v30 != v20) {
          objc_enumerationMutation(v17);
        }
        v22 = *(void **)(*((void *)&v29 + 1) + 8 * v21);
        v23 = objc_opt_class(&OBJC_CLASS___ACLSIPv6Range);
        if ((objc_opt_isKindOfClass(v22, v23) & 1) != 0
          && (objc_msgSend(v22, "containsAddress:", v37, (void)v29) & 1) != 0)
        {
          goto LABEL_23;
        }

        if (v19 == (id)++v21)
        {
          v19 = [v17 countByEnumeratingWithState:&v29 objects:v49 count:16];
          v24 = 0;
          if (v19) {
            goto LABEL_15;
          }
          goto LABEL_25;
        }
      }
    }

LABEL_40:
  -[AssetCacheLocatorService setRefreshValidityInterval:](v2, "setRefreshValidityInterval:", 60.0);
  v42 = CFPreferencesCopyAppValue(@"RefreshValidityInterval", @"com.apple.AssetCacheLocatorService");
  v43 = (void *)v42;
  if (v42)
  {
    if ((objc_opt_respondsToSelector(v42, "doubleValue") & 1) != 0)
    {
      [v43 doubleValue];
      -[AssetCacheLocatorService setRefreshValidityInterval:](v2, "setRefreshValidityInterval:");
      -[AssetCacheLocatorService refreshValidityInterval](v2, "refreshValidityInterval");
      v44 = 60.0;
      if (v45 < 60.0
        || (-[AssetCacheLocatorService refreshValidityInterval](v2, "refreshValidityInterval"),
            v44 = 1.79769313e308,
            v46 > 1.79769313e308))
      {
        -[AssetCacheLocatorService setRefreshValidityInterval:](v2, "setRefreshValidityInterval:", v44);
      }
    }

    else
    {
      v47 = gLogHandle;
      if (os_log_type_enabled((os_log_t)gLogHandle, OS_LOG_TYPE_DEFAULT))
      {
        v48 = v47;
        v49 = currentQueueName();
        buf = 67109890LL;
        v291 = 2080;
        v292 = v49;
        v293 = 2112;
        v294 = @"RefreshValidityInterval";
        v295 = 2112;
        v296 = @"a number";
        _os_log_impl( (void *)&_mh_execute_header,  v48,  OS_LOG_TYPE_DEFAULT,  "#%08x [%s] bad type for preference %@; expected %@",
          (uint8_t *)&buf,
          0x26u);
      }
    }
  }

  v50 = objc_claimAutoreleasedReturnValue( +[NSURL URLWithString:]( &OBJC_CLASS___NSURL,  "URLWithString:",  @"https://lcdn-locator.apple.com/lcdn/locate"));
  -[AssetCacheLocatorService setLocateURL:](v2, "setLocateURL:", v50);
  v51 = (void *)CFPreferencesCopyAppValue(@"LocateURL", @"com.apple.AssetCacheLocatorService");
  if (v51)
  {
    v52 = objc_opt_class(&OBJC_CLASS___NSString);
    if ((objc_opt_isKindOfClass(v51, v52) & 1) != 0)
    {
      v53 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v51));
      -[AssetCacheLocatorService setLocateURL:](v2, "setLocateURL:", v53);

      v54 = (void *)objc_claimAutoreleasedReturnValue(-[AssetCacheLocatorService locateURL](v2, "locateURL"));
      if (!v54) {
        -[AssetCacheLocatorService setLocateURL:](v2, "setLocateURL:", v50);
      }
    }

    else
    {
      v55 = gLogHandle;
      if (os_log_type_enabled((os_log_t)gLogHandle, OS_LOG_TYPE_DEFAULT))
      {
        v56 = v55;
        v57 = currentQueueName();
        buf = 67109890LL;
        v291 = 2080;
        v292 = v57;
        v293 = 2112;
        v294 = @"LocateURL";
        v295 = 2112;
        v296 = @"a string";
        _os_log_impl( (void *)&_mh_execute_header,  v56,  OS_LOG_TYPE_DEFAULT,  "#%08x [%s] bad type for preference %@; expected %@",
          (uint8_t *)&buf,
          0x26u);
      }
    }
  }

  -[AssetCacheLocatorService setRedactLogs:](v2, "setRedactLogs:", 1LL);
  LOBYTE(buf) = 0;
  AppBooleanValue = CFPreferencesGetAppBooleanValue( @"RedactLogs",  @"com.apple.AssetCacheLocatorService",  (Boolean *)&buf);
  if ((_BYTE)buf) {
    -[AssetCacheLocatorService setRedactLogs:](v2, "setRedactLogs:", AppBooleanValue != 0);
  }
  v175 = (void *)v50;
  -[AssetCacheLocatorService setSkipEVCheck:](v2, "setSkipEVCheck:", 0LL);
  LOBYTE(buf) = 0;
  v59 = CFPreferencesGetAppBooleanValue( @"SkipEVCheck",  @"com.apple.AssetCacheLocatorService",  (Boolean *)&buf);
  if ((_BYTE)buf) {
    -[AssetCacheLocatorService setSkipEVCheck:](v2, "setSkipEVCheck:", v59 != 0);
  }
  v174 = v51;
  LOBYTE(buf) = 0;
  v60 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  v61 = (void *)objc_claimAutoreleasedReturnValue(-[AssetCacheLocatorService cacheDirPath](v2, "cacheDirPath"));
  v62 = [v60 fileExistsAtPath:v61 isDirectory:&buf];

  if (v62 && !(_BYTE)buf)
  {
    v63 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    v64 = (void *)objc_claimAutoreleasedReturnValue(-[AssetCacheLocatorService cacheDirPath](v2, "cacheDirPath"));
    [v63 removeItemAtPath:v64 error:0];

LABEL_61:
    v65 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    v66 = (void *)objc_claimAutoreleasedReturnValue(-[AssetCacheLocatorService cacheDirPath](v2, "cacheDirPath"));
    v182 = 0LL;
    v67 = [v65 createDirectoryAtPath:v66 withIntermediateDirectories:1 attributes:0 error:&v182];
    v68 = v182;

    if ((v67 & 1) != 0)
    {

      goto LABEL_63;
    }

    v147 = gLogHandle;
    if (os_log_type_enabled((os_log_t)gLogHandle, OS_LOG_TYPE_ERROR)) {
      sub_10001F948(v147, v2, v68);
    }

LABEL_68:
    v146 = 0LL;
    goto LABEL_69;
  }

  if ((v62 & 1) == 0) {
    goto LABEL_61;
  }
LABEL_63:
  v69 = (void *)objc_claimAutoreleasedReturnValue(-[AssetCacheLocatorService cacheDirPath](v2, "cacheDirPath"));
  v70 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@/%@",  v69,  @"diskCache.plist"));
  -[AssetCacheLocatorService setDiskCachePlistPath:](v2, "setDiskCachePlistPath:", v70);

  -[AssetCacheLocatorService setLocalhostAddresses:](v2, "setLocalhostAddresses:", &off_100033650);
  v289[0] = &__kCFBooleanFalse;
  v288[0] = @"mandatory";
  v288[1] = @"class";
  v289[1] = objc_opt_class(&OBJC_CLASS___NSDictionary);
  v288[2] = @"template";
  v286[0] = @"im";
  v285[0] = &__kCFBooleanFalse;
  v284[0] = @"mandatory";
  v284[1] = @"class";
  v285[1] = objc_opt_class(&OBJC_CLASS___NSNumber);
  v171 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v285,  v284,  2LL));
  v287[0] = v171;
  v286[1] = @"ns";
  v283[0] = &__kCFBooleanFalse;
  v282[0] = @"mandatory";
  v282[1] = @"class";
  v283[1] = objc_opt_class(&OBJC_CLASS___NSNumber);
  v71 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v283,  v282,  2LL));
  v287[1] = v71;
  v286[2] = @"pc";
  v281[0] = &__kCFBooleanFalse;
  v280[0] = @"mandatory";
  v280[1] = @"class";
  v281[1] = objc_opt_class(&OBJC_CLASS___NSNumber);
  v72 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v281,  v280,  2LL));
  v287[2] = v72;
  v286[3] = @"query-parameters";
  v279[0] = &__kCFBooleanFalse;
  v278[0] = @"mandatory";
  v278[1] = @"class";
  v279[1] = objc_opt_class(&OBJC_CLASS___NSNumber);
  v73 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v279,  v278,  2LL));
  v287[3] = v73;
  v286[4] = @"sc";
  v277[0] = &__kCFBooleanFalse;
  v276[0] = @"mandatory";
  v276[1] = @"class";
  v277[1] = objc_opt_class(&OBJC_CLASS___NSNumber);
  v74 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v277,  v276,  2LL));
  v287[4] = v74;
  v286[5] = @"ur";
  v275[0] = &__kCFBooleanFalse;
  v274[0] = @"mandatory";
  v274[1] = @"class";
  v275[1] = objc_opt_class(&OBJC_CLASS___NSNumber);
  v177 = v2;
  v75 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v275,  v274,  2LL));
  v287[5] = v75;
  v76 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v287,  v286,  6LL));
  v289[2] = v76;
  v77 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v289,  v288,  3LL));
  -[AssetCacheLocatorService setServerCapabilitiesTemplate:](v177, "setServerCapabilitiesTemplate:", v77);

  v78 = objc_alloc(&OBJC_CLASS___ACLSTypeVerifier);
  v79 = (void *)objc_claimAutoreleasedReturnValue(-[AssetCacheLocatorService serverCapabilitiesTemplate](v177, "serverCapabilitiesTemplate"));
  v80 = -[ACLSTypeVerifier initWithTemplate:](v78, "initWithTemplate:", v79);
  -[AssetCacheLocatorService setServerCapabilitiesVerifier:](v177, "setServerCapabilitiesVerifier:", v80);

  v273[0] = &__kCFBooleanFalse;
  v272[0] = @"mandatory";
  v272[1] = @"class";
  v273[1] = objc_opt_class(&OBJC_CLASS___NSDictionary);
  v272[2] = @"template";
  v270[0] = @"ac-power";
  v269[0] = &__kCFBooleanFalse;
  v268[0] = @"mandatory";
  v268[1] = @"class";
  v269[1] = objc_opt_class(&OBJC_CLASS___NSNumber);
  v172 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v269,  v268,  2LL));
  v271[0] = v172;
  v270[1] = @"cache-size";
  v267[0] = &__kCFBooleanFalse;
  v266[0] = @"mandatory";
  v266[1] = @"class";
  v267[1] = objc_opt_class(&OBJC_CLASS___NSNumber);
  v169 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v267,  v266,  2LL));
  v271[1] = v169;
  v270[2] = @"capabilities";
  v167 = (void *)objc_claimAutoreleasedReturnValue(-[AssetCacheLocatorService serverCapabilitiesTemplate](v177, "serverCapabilitiesTemplate"));
  v271[2] = v167;
  v270[3] = @"is-portable";
  v265[0] = &__kCFBooleanFalse;
  v264[0] = @"mandatory";
  v264[1] = @"class";
  v265[1] = objc_opt_class(&OBJC_CLASS___NSNumber);
  v165 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v265,  v264,  2LL));
  v271[3] = v165;
  v270[4] = @"local-network";
  v263[0] = &__kCFBooleanFalse;
  v262[0] = @"mandatory";
  v262[1] = @"class";
  v263[1] = objc_opt_class(&OBJC_CLASS___NSArray);
  v262[2] = @"template";
  v260[0] = @"class";
  v261[0] = objc_opt_class(&OBJC_CLASS___NSDictionary);
  v260[1] = @"template";
  v258[0] = @"speed";
  v257[0] = &__kCFBooleanFalse;
  v256[0] = @"mandatory";
  v256[1] = @"class";
  v257[1] = objc_opt_class(&OBJC_CLASS___NSNumber);
  v81 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v257,  v256,  2LL));
  v259[0] = v81;
  v258[1] = @"wired";
  v255[0] = &__kCFBooleanFalse;
  v254[0] = @"mandatory";
  v254[1] = @"class";
  v255[1] = objc_opt_class(&OBJC_CLASS___NSNumber);
  v82 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v255,  v254,  2LL));
  v259[1] = v82;
  v83 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v259,  v258,  2LL));
  v261[1] = v83;
  v84 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v261,  v260,  2LL));
  v263[2] = v84;
  v85 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v263,  v262,  3LL));
  v271[4] = v85;
  v86 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v271,  v270,  5LL));
  v273[2] = v86;
  v87 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v273,  v272,  3LL));
  -[AssetCacheLocatorService setServerDetailsTemplate:](v177, "setServerDetailsTemplate:", v87);

  v88 = objc_alloc(&OBJC_CLASS___ACLSTypeVerifier);
  v89 = (void *)objc_claimAutoreleasedReturnValue(-[AssetCacheLocatorService serverDetailsTemplate](v177, "serverDetailsTemplate"));
  v90 = -[ACLSTypeVerifier initWithTemplate:](v88, "initWithTemplate:", v89);
  -[AssetCacheLocatorService setServerDetailsVerifier:](v177, "setServerDetailsVerifier:", v90);

  v253[0] = &__kCFBooleanTrue;
  v252[0] = @"mandatory";
  v252[1] = @"class";
  v253[1] = objc_opt_class(&OBJC_CLASS___NSArray);
  v252[2] = @"template";
  v250[0] = @"class";
  v251[0] = objc_opt_class(&OBJC_CLASS___NSDictionary);
  v250[1] = @"template";
  v248[0] = @"digest";
  v247[0] = &__kCFBooleanTrue;
  v246[0] = @"mandatory";
  v246[1] = @"class";
  v247[1] = objc_opt_class(&OBJC_CLASS___NSData);
  v91 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v247,  v246,  2LL));
  v249[0] = v91;
  v248[1] = @"key";
  v245[0] = &__kCFBooleanTrue;
  v244[0] = @"mandatory";
  v244[1] = @"class";
  v245[1] = objc_opt_class(&OBJC_CLASS___NSData);
  v92 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v245,  v244,  2LL));
  v249[1] = v92;
  v93 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v249,  v248,  2LL));
  v251[1] = v93;
  v94 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v251,  v250,  2LL));
  v253[2] = v94;
  v170 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v253,  v252,  3LL));

  v243[0] = &__kCFBooleanTrue;
  v242[0] = @"mandatory";
  v242[1] = @"class";
  v243[1] = objc_opt_class(&OBJC_CLASS___NSArray);
  v242[2] = @"template";
  v240[0] = @"class";
  v241[0] = objc_opt_class(&OBJC_CLASS___NSDictionary);
  v240[1] = @"template";
  v238[0] = @"first";
  v237[0] = &__kCFBooleanTrue;
  v236[0] = @"mandatory";
  v236[1] = @"class";
  v237[1] = objc_opt_class(&OBJC_CLASS___NSString);
  v95 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v237,  v236,  2LL));
  v239[0] = v95;
  v238[1] = @"last";
  v235[0] = &__kCFBooleanTrue;
  v234[0] = @"mandatory";
  v234[1] = @"class";
  v235[1] = objc_opt_class(&OBJC_CLASS___NSString);
  v96 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v235,  v234,  2LL));
  v239[1] = v96;
  v97 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v239,  v238,  2LL));
  v241[1] = v97;
  v98 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v241,  v240,  2LL));
  v243[2] = v98;
  v173 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v243,  v242,  3LL));

  v233[0] = &__kCFBooleanTrue;
  v232[0] = @"mandatory";
  v232[1] = @"class";
  v233[1] = objc_opt_class(&OBJC_CLASS___NSMutableDictionary);
  v232[2] = @"template";
  v230[0] = @"version";
  v229[0] = &__kCFBooleanTrue;
  v228[0] = @"mandatory";
  v228[1] = @"class";
  v229[1] = objc_opt_class(&OBJC_CLASS___NSNumber);
  v168 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v229,  v228,  2LL));
  v231[0] = v168;
  v230[1] = @"cache";
  v227[0] = &__kCFBooleanTrue;
  v226[0] = @"mandatory";
  v226[1] = @"class";
  v227[1] = objc_opt_class(&OBJC_CLASS___NSMutableArray);
  v226[2] = @"template";
  v224[0] = @"class";
  v225[0] = objc_opt_class(&OBJC_CLASS___NSMutableDictionary);
  v224[1] = @"template";
  v222[0] = @"validUntil";
  v221[0] = &__kCFBooleanTrue;
  v220[0] = @"mandatory";
  v220[1] = @"class";
  v221[1] = objc_opt_class(&OBJC_CLASS___NSDate);
  v166 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v221,  v220,  2LL));
  v223[0] = v166;
  v223[1] = v170;
  v222[1] = @"networkIdentifiers";
  v222[2] = @"servers";
  v219[0] = &__kCFBooleanTrue;
  v218[0] = @"mandatory";
  v218[1] = @"class";
  v219[1] = objc_opt_class(&OBJC_CLASS___NSArray);
  v218[2] = @"template";
  v216[0] = @"class";
  v217[0] = objc_opt_class(&OBJC_CLASS___NSMutableDictionary);
  v216[1] = @"template";
  v214[0] = @"localAddressAndPort";
  v213[0] = &__kCFBooleanTrue;
  v212[0] = @"mandatory";
  v212[1] = @"class";
  v213[1] = objc_opt_class(&OBJC_CLASS___NSString);
  v164 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v213,  v212,  2LL));
  v215[0] = v164;
  v214[1] = @"connectTimeout";
  v211[0] = &__kCFBooleanTrue;
  v210[0] = @"mandatory";
  v210[1] = @"class";
  v211[1] = objc_opt_class(&OBJC_CLASS___NSNumber);
  v163 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v211,  v210,  2LL));
  v215[1] = v163;
  v214[2] = @"details";
  v162 = (void *)objc_claimAutoreleasedReturnValue(-[AssetCacheLocatorService serverDetailsTemplate](v177, "serverDetailsTemplate"));
  v215[2] = v162;
  v214[3] = @"failureCount";
  v209[0] = &__kCFBooleanFalse;
  v208[0] = @"mandatory";
  v208[1] = @"class";
  v209[1] = objc_opt_class(&OBJC_CLASS___NSNumber);
  v161 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v209,  v208,  2LL));
  v215[3] = v161;
  v214[4] = @"favored";
  v207[0] = &__kCFBooleanFalse;
  v206[0] = @"mandatory";
  v206[1] = @"class";
  v207[1] = objc_opt_class(&OBJC_CLASS___NSNumber);
  v160 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v207,  v206,  2LL));
  v215[4] = v160;
  v214[5] = @"guid";
  v205[0] = &__kCFBooleanTrue;
  v204[0] = @"mandatory";
  v204[1] = @"class";
  v205[1] = objc_opt_class(&OBJC_CLASS___NSString);
  v159 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v205,  v204,  2LL));
  v215[5] = v159;
  v214[6] = @"rank";
  v203[0] = &__kCFBooleanTrue;
  v202[0] = @"mandatory";
  v202[1] = @"class";
  v203[1] = objc_opt_class(&OBJC_CLASS___NSNumber);
  v158 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v203,  v202,  2LL));
  v215[6] = v158;
  v157 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v215,  v214,  7LL));
  v217[1] = v157;
  v156 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v217,  v216,  2LL));
  v219[2] = v156;
  v155 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v219,  v218,  3LL));
  v223[2] = v155;
  v154 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v223,  v222,  3LL));
  v225[1] = v154;
  v153 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v225,  v224,  2LL));
  v227[2] = v153;
  v152 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v227,  v226,  3LL));
  v231[1] = v152;
  v230[2] = @"dnsResults";
  v201[0] = &__kCFBooleanTrue;
  v200[0] = @"mandatory";
  v200[1] = @"class";
  v201[1] = objc_opt_class(&OBJC_CLASS___NSMutableArray);
  v200[2] = @"template";
  v198[0] = @"class";
  v199[0] = objc_opt_class(&OBJC_CLASS___NSMutableDictionary);
  v198[1] = @"template";
  v196[0] = @"validUntil";
  v195[0] = &__kCFBooleanTrue;
  v194[0] = @"mandatory";
  v194[1] = @"class";
  v195[1] = objc_opt_class(&OBJC_CLASS___NSDate);
  v151 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v195,  v194,  2LL));
  v197[0] = v151;
  v197[1] = v170;
  v196[1] = @"networkIdentifiers";
  v196[2] = @"publicAddressRanges";
  v196[3] = @"favoredServerRanges";
  v197[2] = v173;
  v197[3] = v173;
  v150 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v197,  v196,  4LL));
  v199[1] = v150;
  v149 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v199,  v198,  2LL));
  v201[2] = v149;
  v99 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v201,  v200,  3LL));
  v231[2] = v99;
  v230[3] = @"serversRecentlySeen";
  v193[0] = &__kCFBooleanFalse;
  v192[0] = @"mandatory";
  v192[1] = @"class";
  v193[1] = objc_opt_class(&OBJC_CLASS___NSMutableArray);
  v192[2] = @"template";
  v190[0] = @"class";
  v100 = objc_opt_class(&OBJC_CLASS___NSMutableDictionary);
  v190[1] = @"template";
  v191[0] = v100;
  v188[0] = @"validUntil";
  v186[1] = @"class";
  v187[0] = &__kCFBooleanTrue;
  v186[0] = @"mandatory";
  v187[1] = objc_opt_class(&OBJC_CLASS___NSDate);
  v101 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v187,  v186,  2LL));
  v189[0] = v101;
  v189[1] = v170;
  v188[1] = @"networkIdentifiers";
  v188[2] = @"recentlySeen";
  v184[1] = @"class";
  v185[0] = &__kCFBooleanTrue;
  v184[0] = @"mandatory";
  v185[1] = objc_opt_class(&OBJC_CLASS___NSNumber);
  v102 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v185,  v184,  2LL));
  v189[2] = v102;
  v103 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v189,  v188,  3LL));
  v191[1] = v103;
  v104 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v191,  v190,  2LL));
  v193[2] = v104;
  v105 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v193,  v192,  3LL));
  v231[3] = v105;
  v106 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v231,  v230,  4LL));
  v233[2] = v106;
  v107 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v233,  v232,  3LL));
  -[AssetCacheLocatorService setDiskCacheTemplate:](v177, "setDiskCacheTemplate:", v107);

  id v2 = v177;
  v108 = objc_alloc(&OBJC_CLASS___ACLSTypeVerifier);
  v109 = (void *)objc_claimAutoreleasedReturnValue(-[AssetCacheLocatorService diskCacheTemplate](v177, "diskCacheTemplate"));
  v110 = -[ACLSTypeVerifier initWithTemplate:](v108, "initWithTemplate:", v109);
  -[AssetCacheLocatorService setDiskCacheVerifier:](v177, "setDiskCacheVerifier:", v110);

  v111 = (void *)objc_claimAutoreleasedReturnValue(-[AssetCacheLocatorService makeSoftwareVersions](v177, "makeSoftwareVersions"));
  -[AssetCacheLocatorService setSoftwareVersions:](v177, "setSoftwareVersions:", v111);

  v112 = (void *)objc_claimAutoreleasedReturnValue(-[AssetCacheLocatorService makeBootTimeWithTag:](v177, "makeBootTimeWithTag:", 0LL));
  -[AssetCacheLocatorService setBootTime:](v177, "setBootTime:", v112);

  v113 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v114 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v113);
  v115 = dispatch_queue_create("AssetCacheLocatorService.queue", v114);
  -[AssetCacheLocatorService setQueue:](v177, "setQueue:", v115);

  v116 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[AssetCacheLocatorService queue](v177, "queue"));
  v117 = off_100036F80;
  v118 = (void *)objc_claimAutoreleasedReturnValue(-[AssetCacheLocatorService queue](v177, "queue"));
  dispatch_queue_set_specific(v116, v117, v118, 0LL);

  v119 = dispatch_get_global_queue(0LL, 0LL);
  v120 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v119);
  v121 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0LL, 0LL, v120);
  -[AssetCacheLocatorService setDiskCacheRefreshTimer:](v177, "setDiskCacheRefreshTimer:", v121);

  v122 = (dispatch_source_s *)objc_claimAutoreleasedReturnValue(-[AssetCacheLocatorService diskCacheRefreshTimer](v177, "diskCacheRefreshTimer"));
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472LL;
  handler[2] = sub_100008834;
  handler[3] = &unk_100030B58;
  v123 = v177;
  v181 = v123;
  dispatch_source_set_event_handler(v122, handler);

  -[AssetCacheLocatorService setDiskCacheRefreshTimerResumed:](v123, "setDiskCacheRefreshTimerResumed:", 0LL);
  v124 = dispatch_semaphore_create(1LL);
  -[AssetCacheLocatorService setSingleLocate:](v123, "setSingleLocate:", v124);

  v125 = objc_alloc_init(&OBJC_CLASS___NSOperationQueue);
  -[AssetCacheLocatorService setLocateOpQueue:](v123, "setLocateOpQueue:", v125);

  v126 = (void *)objc_claimAutoreleasedReturnValue(-[AssetCacheLocatorService locateOpQueue](v123, "locateOpQueue"));
  [v126 setMaxConcurrentOperationCount:1];

  v127 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v128 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v127);
  v129 = dispatch_queue_create("AssetCacheLocatorService.cacheRefreshQueue", v128);
  -[AssetCacheLocatorService setCacheRefreshQueue:](v123, "setCacheRefreshQueue:", v129);

  v130 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[AssetCacheLocatorService cacheRefreshQueue](v123, "cacheRefreshQueue"));
  v131 = off_100036F80;
  v132 = (void *)objc_claimAutoreleasedReturnValue(-[AssetCacheLocatorService cacheRefreshQueue](v123, "cacheRefreshQueue"));
  dispatch_queue_set_specific(v130, v131, v132, 0LL);

  v133 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  -[AssetCacheLocatorService setAffinityCache:](v123, "setAffinityCache:", v133);

  v134 = -[NSURLCache initWithMemoryCapacity:diskCapacity:diskPath:]( objc_alloc(&OBJC_CLASS___NSURLCache),  "initWithMemoryCapacity:diskCapacity:diskPath:",  0LL,  0LL,  0LL);
  -[NSURLCache removeAllCachedResponses](v134, "removeAllCachedResponses");
  +[NSURLCache setSharedURLCache:](&OBJC_CLASS___NSURLCache, "setSharedURLCache:", v134);
  v135 = (void *)objc_claimAutoreleasedReturnValue( +[NSURLSessionConfiguration ephemeralSessionConfiguration]( &OBJC_CLASS___NSURLSessionConfiguration,  "ephemeralSessionConfiguration"));
  -[AssetCacheLocatorService setLocateSessionConfig:](v123, "setLocateSessionConfig:", v135);

  v136 = (void *)objc_claimAutoreleasedReturnValue(-[AssetCacheLocatorService locateSessionConfig](v123, "locateSessionConfig"));
  [v136 setAllowsCellularAccess:0];

  v137 = (void *)objc_claimAutoreleasedReturnValue(-[AssetCacheLocatorService locateSessionConfig](v123, "locateSessionConfig"));
  [v137 setHTTPCookieStorage:0];

  v138 = (void *)objc_claimAutoreleasedReturnValue(-[AssetCacheLocatorService locateSessionConfig](v123, "locateSessionConfig"));
  [v138 setURLCredentialStorage:0];

  v139 = (void *)objc_claimAutoreleasedReturnValue(-[AssetCacheLocatorService locateSessionConfig](v123, "locateSessionConfig"));
  [v139 setURLCache:0];

  v140 = (void *)objc_claimAutoreleasedReturnValue(-[AssetCacheLocatorService locateSessionConfig](v123, "locateSessionConfig"));
  v141 = [v140 copy];
  -[AssetCacheLocatorService setImportSessionConfig:](v123, "setImportSessionConfig:", v141);

  v142 = (void *)objc_claimAutoreleasedReturnValue(-[AssetCacheLocatorService locateSessionConfig](v123, "locateSessionConfig"));
  v143 = [v142 copy];
  -[AssetCacheLocatorService setQuerySessionConfig:](v123, "setQuerySessionConfig:", v143);

  v144 = (dispatch_semaphore_s *)objc_claimAutoreleasedReturnValue(-[AssetCacheLocatorService singleLocate](v123, "singleLocate"));
  dispatch_semaphore_wait(v144, 0xFFFFFFFFFFFFFFFFLL);

  v145 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[AssetCacheLocatorService queue](v123, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000089C4;
  block[3] = &unk_100030B58;
  v179 = v123;
  dispatch_async(v145, block);

LABEL_64:
  v146 = v2;
LABEL_69:

  return v146;
}

void sub_1000087F4(id a1)
{
  id v1 = (id)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  [v1 removeItemAtPath:@"/var/mobile/Library/Caches/com.apple.AssetCacheLocatorService" error:0];
}

void sub_100008834(uint64_t a1)
{
  id v2 = gLogHandle;
  if (os_log_type_enabled((os_log_t)gLogHandle, OS_LOG_TYPE_DEFAULT))
  {
    v3 = v2;
    *(_DWORD *)buf = 67109378;
    int v9 = 0;
    __int16 v10 = 2080;
    v11 = currentQueueName();
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "#%08x [%s] automatic disk cache refresh",  buf,  0x12u);
  }

  v4 = (dispatch_semaphore_s *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) singleLocate]);
  dispatch_semaphore_wait(v4, 0xFFFFFFFFFFFFFFFFLL);

  v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) queue]);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10000897C;
  block[3] = &unk_100030B58;
  id v7 = *(id *)(a1 + 32);
  dispatch_async(v5, block);
}

void sub_10000897C(uint64_t a1)
{
  id v2 = (dispatch_semaphore_s *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) singleLocate]);
  dispatch_semaphore_signal(v2);
}

void sub_1000089C4(uint64_t a1)
{
  id v2 = (dispatch_semaphore_s *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) singleLocate]);
  dispatch_semaphore_signal(v2);
}

LABEL_11:
  int v9 = 0LL;
LABEL_18:

  return v9;
}

uint64_t sub_100008FA8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) NSObjectFromXPCObject:a3 tag:*(unsigned int *)(a1 + 48)]);
  if (v4) {
    [*(id *)(a1 + 40) addObject:v4];
  }

  return 1LL;
}

uint64_t sub_100008FF0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) NSObjectFromXPCObject:a3 tag:*(unsigned int *)(a1 + 48)]);
  if (v5)
  {
    id v6 = *(void **)(a1 + 40);
    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", a2));
    [v6 setObject:v5 forKey:v7];
  }

  return 1LL;
}

void sub_100009280(uint64_t a1, uint64_t a2)
{
  v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) XPCObjectFromNSObject:a2 tag:*(unsigned int *)(a1 + 48)]);
  if (v3)
  {
    v4 = v3;
    xpc_array_append_value(*(xpc_object_t *)(a1 + 40), v3);
    v3 = v4;
  }
}

void sub_1000092D0(uint64_t a1, void *a2, uint64_t a3)
{
  id v6 = a2;
  v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) XPCObjectFromNSObject:a3 tag:*(unsigned int *)(a1 + 48)]);
  if (v5) {
    xpc_dictionary_set_value( *(xpc_object_t *)(a1 + 40), (const char *)[v6 UTF8String], v5);
  }
}

void sub_100009AD0(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = gLogHandle;
  if (os_log_type_enabled((os_log_t)gLogHandle, OS_LOG_TYPE_DEBUG)) {
    sub_10001FD30(v4, v3);
  }
  xpc_type_t type = xpc_get_type(v3);
  if (type == (xpc_type_t)&_xpc_type_connection)
  {
    [*(id *)(a1 + 32) handleConnection:v3];
  }

  else if (v3 == &_xpc_error_connection_invalid && type == (xpc_type_t)&_xpc_type_error)
  {
    [*(id *)(a1 + 32) setListenerConnection:0];
  }
}

void sub_100009B7C(uint64_t a1)
{
  id v1 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) listenerConnection]);

  if (!v1)
  {
    id v2 = gLogHandle;
    if (os_log_type_enabled((os_log_t)gLogHandle, OS_LOG_TYPE_DEFAULT))
    {
      id v3 = v2;
      v4[0] = 67109634;
      v4[1] = 0;
      __int16 v5 = 2080;
      id v6 = currentQueueName();
      __int16 v7 = 2080;
      id v8 = "AssetCacheLocatorService";
      _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "#%08x [%s] %s exiting:  XPC listener gone and no more XPC connections",  (uint8_t *)v4,  0x1Cu);
    }

    exit(0);
  }

void sub_100009DB8(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = gLogHandle;
  if (os_log_type_enabled((os_log_t)gLogHandle, OS_LOG_TYPE_DEBUG)) {
    sub_10001FDDC(v4, a1, v3);
  }
}

LABEL_4:
  int v9 = 0;
LABEL_5:

  return v9;
}

void sub_10000A9E4(_Unwind_Exception *a1)
{
}

uint64_t sub_10000AA1C(uint64_t a1, const char *a2, void *a3)
{
  id v5 = a3;
  if (!strcmp(a2, "import") && xpc_get_type(v5) == (xpc_type_t)&_xpc_type_BOOL && xpc_BOOL_get_value(v5))
  {
    id v6 = *(void **)(a1 + 32);
    __int16 v7 = @"im";
LABEL_17:
    [v6 setObject:&__kCFBooleanTrue forKey:v7];
    goto LABEL_18;
  }

  if (!strcmp(a2, "namespaces") && xpc_get_type(v5) == (xpc_type_t)&_xpc_type_BOOL && xpc_BOOL_get_value(v5))
  {
    id v6 = *(void **)(a1 + 32);
    __int16 v7 = @"ns";
    goto LABEL_17;
  }

  if (!strcmp(a2, "personalCaching") && xpc_get_type(v5) == (xpc_type_t)&_xpc_type_BOOL && xpc_BOOL_get_value(v5))
  {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 0;
  }

  else if (!strcmp(a2, "queryParameters") && xpc_get_type(v5) == (xpc_type_t)&_xpc_type_BOOL && xpc_BOOL_get_value(v5))
  {
    id v6 = *(void **)(a1 + 32);
    __int16 v7 = @"query-parameters";
    goto LABEL_17;
  }

LABEL_18:
  return 1LL;
}

  v27 = 3600.0;
LABEL_22:

LABEL_23:
  v31 = gLogHandle;
  if (os_log_type_enabled((os_log_t)v31, OS_LOG_TYPE_DEBUG))
  {
    v45 = currentQueueName();
    v46 = (void *)objc_claimAutoreleasedReturnValue(-[AssetCacheLocatorService redactObject:](self, "redactObject:", *(void *)(*(void *)v74 + 40LL)));
    *(_DWORD *)v63 = 67110146;
    v64 = v49;
    v65 = 2080;
    v66 = v45;
    v67 = 2112;
    v68 = v46;
    v69 = 2048;
    v70 = v27;
    v71 = 2112;
    v72 = v14;
    _os_log_debug_impl( (void *)&_mh_execute_header,  (os_log_t)v31,  OS_LOG_TYPE_DEBUG,  "#%08x [%s] parseLocateResponse -> servers=%@, validityInterval=%.3f, error=%@",  v63,  0x30u);
  }

  if (v14)
  {
    if (a7) {
      *a7 = v14;
    }
  }

  else
  {
    if (a5) {
      *a5 = [*(id *)(*(void *)v74 + 40) copy];
    }
    if (a6) {
      *a6 = v27;
    }
  }

  _Block_object_dispose(v61, 8);
  _Block_object_dispose(buf, 8);

  return v14 == 0LL;
}

void sub_10000AB8C(uint64_t a1, void *a2, uint64_t a3, void *a4, void *a5, double a6)
{
  id v11 = a2;
  id v12 = a4;
  id v13 = a5;
  v14 = gLogHandle;
  if (os_log_type_enabled((os_log_t)gLogHandle, OS_LOG_TYPE_DEBUG))
  {
    int v78 = *(_DWORD *)(a1 + 80);
    v24 = v14;
    v25 = currentQueueName();
    v26 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) redactObject:v11]);
    v27 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) redactObject:v12]);
    *(_DWORD *)buf = 67110658;
    int v86 = v78;
    __int16 v87 = 2080;
    v88 = v25;
    __int16 v89 = 2112;
    *(void *)v90 = v26;
    *(_WORD *)&v90[8] = 1024;
    *(_DWORD *)v91 = a3;
    *(_WORD *)&v91[4] = 2112;
    *(void *)&v91[6] = v27;
    *(_WORD *)&v91[14] = 2048;
    *(double *)&v91[16] = a6;
    *(_WORD *)&v91[24] = 2112;
    *(void *)&v91[26] = v13;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEBUG,  "#%08x [%s] handleLocateEvent callback(servers=%@, sorted=%{BOOL}d, other=%@, validityInterval=%.3f, error=%@)",  buf,  0x40u);

    if (v13) {
      goto LABEL_3;
    }
  }

  else if (v13)
  {
LABEL_3:
    v15 = gLogHandle;
    if (os_log_type_enabled((os_log_t)gLogHandle, OS_LOG_TYPE_INFO))
    {
      int v16 = *(_DWORD *)(a1 + 80);
      v17 = v15;
      v18 = currentQueueName();
      pid_t pid = xpc_connection_get_pid(*(xpc_connection_t *)(a1 + 40));
      uid_t euid = xpc_connection_get_euid(*(xpc_connection_t *)(a1 + 40));
      [*(id *)(a1 + 48) timeIntervalSinceNow];
      *(_DWORD *)buf = 67110402;
      int v86 = v16;
      __int16 v87 = 2080;
      v88 = v18;
      __int16 v89 = 1024;
      *(_DWORD *)v90 = pid;
      *(_WORD *)&v90[4] = 1024;
      *(_DWORD *)&v90[6] = euid;
      *(_WORD *)v91 = 2112;
      *(void *)&v91[2] = v13;
      *(_WORD *)&v91[10] = 2048;
      *(double *)&v91[12] = -v21;
      _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_INFO,  "#%08x [%s] XPC response to pid %d uid %d: error: %@, elapsed=%.3f",  buf,  0x32u);
    }

    v22 = *(void **)(a1 + 56);
    v23 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) objectWithError:v13]);
    xpc_dictionary_set_value(v22, "error", v23);

    xpc_connection_send_message(*(xpc_connection_t *)(a1 + 40), *(xpc_object_t *)(a1 + 56));
    goto LABEL_35;
  }

  v76 = (void *)objc_claimAutoreleasedReturnValue( [*(id *)(a1 + 32) choose:*(unsigned int *)(a1 + 84) fromArray:v11 sorted:a3 other:v12 tag:*(unsigned int *)(a1 + 80)]);
  v28 = gLogHandle;
  id v75 = v12;
  if (os_log_type_enabled((os_log_t)gLogHandle, OS_LOG_TYPE_INFO))
  {
    int v29 = *(_DWORD *)(a1 + 80);
    v30 = v28;
    v31 = currentQueueName();
    pid_t v32 = xpc_connection_get_pid(*(xpc_connection_t *)(a1 + 40));
    uid_t v33 = xpc_connection_get_euid(*(xpc_connection_t *)(a1 + 40));
    v34 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) redactObject:v76]);
    [*(id *)(a1 + 48) timeIntervalSinceNow];
    *(_DWORD *)buf = 67110658;
    int v86 = v29;
    __int16 v87 = 2080;
    v88 = v31;
    __int16 v89 = 1024;
    *(_DWORD *)v90 = v32;
    *(_WORD *)&v90[4] = 1024;
    *(_DWORD *)&v90[6] = v33;
    *(_WORD *)v91 = 2112;
    *(void *)&v91[2] = v34;
    *(_WORD *)&v91[10] = 2048;
    *(double *)&v91[12] = a6;
    *(_WORD *)&v91[20] = 2048;
    *(double *)&v91[22] = -v35;
    _os_log_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_INFO,  "#%08x [%s] XPC response to pid %d uid %d: success: servers=%@ validityInterval=%.3f elapsed=%.3f",  buf,  0x3Cu);
  }

  id v74 = v13;
  if (*(_BYTE *)(a1 + 88))
  {
    uint64_t v72 = a1;
    id v73 = v11;
    xpc_object_t v36 = xpc_array_create(0LL, 0LL);
    __int128 v80 = 0u;
    __int128 v81 = 0u;
    __int128 v82 = 0u;
    __int128 v83 = 0u;
    id obj = v76;
    id v37 = [obj countByEnumeratingWithState:&v80 objects:v84 count:16];
    if (v37)
    {
      id v38 = v37;
      uint64_t v79 = *(void *)v81;
      do
      {
        for (i = 0LL; i != v38; i = (char *)i + 1)
        {
          if (*(void *)v81 != v79) {
            objc_enumerationMutation(obj);
          }
          v40 = *(void **)(*((void *)&v80 + 1) + 8LL * (void)i);
          xpc_object_t v41 = xpc_dictionary_create(0LL, 0LL, 0LL);
          v42 = (void *)objc_claimAutoreleasedReturnValue([v40 objectForKey:@"localAddressAndPort"]);
          v43 = v42;
          if (v42) {
            xpc_dictionary_set_string( v41, "hostport", (const char *)[v42 UTF8String]);
          }
          v44 = v36;
          v45 = (void *)objc_claimAutoreleasedReturnValue([v40 objectForKey:@"guid"]);
          v46 = v45;
          if (v45) {
            xpc_dictionary_set_string( v41, "guid", (const char *)[v45 UTF8String]);
          }
          v47 = (void *)objc_claimAutoreleasedReturnValue([v40 objectForKeyedSubscript:@"failureCount"]);
          xpc_dictionary_set_BOOL(v41, "healthy", (unint64_t)[v47 unsignedIntegerValue] < 3);

          v48 = (void *)objc_claimAutoreleasedReturnValue([v40 objectForKeyedSubscript:@"favored"]);
          xpc_dictionary_set_BOOL(v41, "favored", (BOOL)[v48 BOOLValue]);

          v49 = (void *)objc_claimAutoreleasedReturnValue([v40 objectForKey:@"details"]);
          v50 = (void *)objc_claimAutoreleasedReturnValue([v49 objectForKey:@"capabilities"]);
          v51 = (void *)objc_claimAutoreleasedReturnValue([v50 objectForKey:@"ur"]);
          xpc_dictionary_set_BOOL(v41, "supportsUrgency", (BOOL)[v51 BOOLValue]);

          v52 = (void *)objc_claimAutoreleasedReturnValue([v40 objectForKey:@"connectTimeout"]);
          [v52 doubleValue];
          double v54 = v53;

          if (v54 >= 0.2) {
            double v55 = v54;
          }
          else {
            double v55 = 1.0;
          }
          xpc_dictionary_set_double(v41, "timeout", v55);
          v56 = (void *)objc_claimAutoreleasedReturnValue([v40 objectForKey:@"rank"]);
          xpc_dictionary_set_int64(v41, "rank", (int)[v56 intValue]);

          xpc_object_t v36 = v44;
          xpc_array_set_value(v44, 0xFFFFFFFFFFFFFFFFLL, v41);
        }

        id v38 = [obj countByEnumeratingWithState:&v80 objects:v84 count:16];
      }

      while (v38);
    }

    a1 = v72;
    xpc_dictionary_set_value(*(xpc_object_t *)(v72 + 56), "servers", v36);
    id v11 = v73;
    id v12 = v75;
  }

  else
  {
    v57 = (void *)objc_claimAutoreleasedReturnValue([v11 firstObject]);
    v58 = (void *)objc_claimAutoreleasedReturnValue([v57 objectForKey:@"localAddressAndPort"]);
    v59 = v58;
    if (v58) {
      xpc_dictionary_set_string( *(xpc_object_t *)(a1 + 56), "hostport", (const char *)[v58 UTF8String]);
    }
    v60 = *(void **)(a1 + 56);
    v61 = (void *)objc_claimAutoreleasedReturnValue([v57 objectForKey:@"details"]);
    v62 = (void *)objc_claimAutoreleasedReturnValue([v61 objectForKey:@"capabilities"]);
    v63 = v57;
    v64 = (void *)objc_claimAutoreleasedReturnValue([v62 objectForKey:@"ur"]);
    xpc_dictionary_set_BOOL(v60, "supportsUrgency", (BOOL)[v64 BOOLValue]);

    xpc_object_t v36 = v63;
    v65 = (void *)objc_claimAutoreleasedReturnValue([v63 objectForKey:@"connectTimeout"]);
    [v65 doubleValue];
    double v67 = v66;

    double v68 = 1.0;
    if (v67 >= 0.2) {
      double v68 = v67;
    }
    xpc_dictionary_set_double(*(xpc_object_t *)(a1 + 56), "timeout", v68);
  }

  double v69 = 3600.0;
  if (a6 > 0.0) {
    double v69 = a6;
  }
  xpc_dictionary_set_double(*(xpc_object_t *)(a1 + 56), "validityInterval", v69);

  xpc_connection_send_message(*(xpc_connection_t *)(a1 + 40), *(xpc_object_t *)(a1 + 56));
  [*(id *)(a1 + 32) refreshValidityInterval];
  id v13 = v74;
  if (v70 > a6 && *(_BYTE *)(a1 + 89))
  {
    v71 = *(void **)(a1 + 32);
    [v71 locateTimeout];
    objc_msgSend( v71,  "relocateCachingServersWithTimeout:capabilities:affinityID:forceRefresh:tag:",  *(void *)(a1 + 64),  *(void *)(a1 + 72),  1,  *(unsigned int *)(a1 + 80));
  }

LABEL_35:
}

void sub_10000B388(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  [*(id *)(a1 + 40) timeIntervalSinceNow];
  double v4 = v3;
  uint64_t v5 = *(void *)(a1 + 48);
  uint64_t v6 = *(void *)(a1 + 56);
  uint64_t v7 = *(unsigned __int8 *)(a1 + 76);
  uint64_t v8 = *(unsigned __int8 *)(a1 + 77);
  uint64_t v9 = *(unsigned __int8 *)(a1 + 78);
  uint64_t v10 = *(void *)(a1 + 64);
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
  id v13 = (id)objc_claimAutoreleasedReturnValue(global_queue);
  LODWORD(v12) = *(_DWORD *)(a1 + 72);
  [v2 locateCachingServersWithTimeout:v5 capabilities:v6 affinityID:v7 autoRefresh:v8 quickMiss:v9 forceMiss:v10 callback:v4 callbackQueue:v13 tag:v12];
}

void sub_10000B5C0(uint64_t a1, BOOL a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = gLogHandle;
  if (os_log_type_enabled((os_log_t)gLogHandle, OS_LOG_TYPE_DEBUG))
  {
    int v23 = *(_DWORD *)(a1 + 64);
    v24 = v6;
    int v25 = 67109890;
    int v26 = v23;
    __int16 v27 = 2080;
    v28 = currentQueueName();
    __int16 v29 = 1024;
    int v30 = a2;
    __int16 v31 = 2112;
    *(void *)pid_t v32 = v5;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEBUG,  "#%08x [%s] handleRecentlySeenEvent callback(recentlySeen=%{BOOL}d, error=%@)",  (uint8_t *)&v25,  0x22u);
  }

  uint64_t v7 = gLogHandle;
  BOOL v8 = os_log_type_enabled((os_log_t)gLogHandle, OS_LOG_TYPE_INFO);
  if (v5)
  {
    if (v8)
    {
      int v9 = *(_DWORD *)(a1 + 64);
      uint64_t v10 = v7;
      id v11 = currentQueueName();
      pid_t pid = xpc_connection_get_pid(*(xpc_connection_t *)(a1 + 32));
      uid_t euid = xpc_connection_get_euid(*(xpc_connection_t *)(a1 + 32));
      [*(id *)(a1 + 40) timeIntervalSinceNow];
      int v25 = 67110402;
      int v26 = v9;
      __int16 v27 = 2080;
      v28 = v11;
      __int16 v29 = 1024;
      int v30 = pid;
      __int16 v31 = 1024;
      *(_DWORD *)pid_t v32 = euid;
      *(_WORD *)&v32[4] = 2112;
      *(void *)&v32[6] = v5;
      *(_WORD *)&v32[14] = 2048;
      *(double *)&v32[16] = -v14;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_INFO,  "#%08x [%s] XPC response to pid %d uid %d: error: %@, elapsed=%.3f",  (uint8_t *)&v25,  0x32u);
    }

    xpc_dictionary_set_BOOL(*(xpc_object_t *)(a1 + 48), "recentlySeen", 1);
    v15 = *(void **)(a1 + 48);
    int v16 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 56) objectWithError:v5]);
    xpc_dictionary_set_value(v15, "error", v16);
  }

  else
  {
    if (v8)
    {
      int v17 = *(_DWORD *)(a1 + 64);
      v18 = v7;
      v19 = currentQueueName();
      pid_t v20 = xpc_connection_get_pid(*(xpc_connection_t *)(a1 + 32));
      uid_t v21 = xpc_connection_get_euid(*(xpc_connection_t *)(a1 + 32));
      [*(id *)(a1 + 40) timeIntervalSinceNow];
      int v25 = 67110402;
      int v26 = v17;
      __int16 v27 = 2080;
      v28 = v19;
      __int16 v29 = 1024;
      int v30 = v20;
      __int16 v31 = 1024;
      *(_DWORD *)pid_t v32 = v21;
      *(_WORD *)&v32[4] = 1024;
      *(_DWORD *)&v32[6] = a2;
      *(_WORD *)&v32[10] = 2048;
      *(double *)&v32[12] = -v22;
      _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_INFO,  "#%08x [%s] XPC response to pid %d uid %d: recentlySeen=%{BOOL}d, elapsed=%.3f",  (uint8_t *)&v25,  0x2Eu);
    }

    xpc_dictionary_set_BOOL(*(xpc_object_t *)(a1 + 48), "recentlySeen", a2);
  }

  xpc_connection_send_message(*(xpc_connection_t *)(a1 + 32), *(xpc_object_t *)(a1 + 48));
}

void sub_10000B890(uint64_t a1)
{
  uint64_t v2 = *(unsigned __int8 *)(a1 + 52);
  double v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
  id v6 = (id)objc_claimAutoreleasedReturnValue(global_queue);
  [v3 recentlySeenCachingServerWithAutoRefresh:v2 callback:v4 callbackQueue:v6 tag:*(unsigned int *)(a1 + 48)];
}

void sub_10000BA6C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

uint64_t sub_10000BA8C(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_10000BA9C(uint64_t a1)
{
}

void sub_10000BAA4(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(unsigned __int8 *)(a1 + 60);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10000BB4C;
  v7[3] = &unk_100030D38;
  v7[4] = *(void *)(a1 + 48);
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(global_queue);
  [v2 updateHealthOfCachingServerWithHostport:v3 healthy:v4 override:0 callback:v7 callbackQueue:v6 tag:*(unsigned int *)(a1 + 56)];
}

void sub_10000BB4C(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 32) + 8LL);
  uint64_t v2 = *(void **)(v1 + 40);
  *(void *)(v1 + 40) = 0LL;
}

void sub_10000C024(uint64_t a1, BOOL a2, void *a3)
{
  id v5 = a3;
  id v6 = gLogHandle;
  if (os_log_type_enabled((os_log_t)gLogHandle, OS_LOG_TYPE_DEBUG))
  {
    int v23 = *(_DWORD *)(a1 + 64);
    v24 = v6;
    int v25 = 67109890;
    int v26 = v23;
    __int16 v27 = 2080;
    v28 = currentQueueName();
    __int16 v29 = 1024;
    int v30 = a2;
    __int16 v31 = 2112;
    *(void *)pid_t v32 = v5;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEBUG,  "#%08x [%s] handleImportEvent callback(success=%{BOOL}d, error=%@)",  (uint8_t *)&v25,  0x22u);
  }

  uint64_t v7 = gLogHandle;
  BOOL v8 = os_log_type_enabled((os_log_t)gLogHandle, OS_LOG_TYPE_INFO);
  if (v5)
  {
    if (v8)
    {
      int v9 = *(_DWORD *)(a1 + 64);
      uint64_t v10 = v7;
      id v11 = currentQueueName();
      pid_t pid = xpc_connection_get_pid(*(xpc_connection_t *)(a1 + 32));
      uid_t euid = xpc_connection_get_euid(*(xpc_connection_t *)(a1 + 32));
      [*(id *)(a1 + 40) timeIntervalSinceNow];
      int v25 = 67110402;
      int v26 = v9;
      __int16 v27 = 2080;
      v28 = v11;
      __int16 v29 = 1024;
      int v30 = pid;
      __int16 v31 = 1024;
      *(_DWORD *)pid_t v32 = euid;
      *(_WORD *)&v32[4] = 2112;
      *(void *)&v32[6] = v5;
      *(_WORD *)&v32[14] = 2048;
      *(double *)&v32[16] = -v14;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_INFO,  "#%08x [%s] XPC response to pid %d uid %d: error: %@, elapsed=%.3f",  (uint8_t *)&v25,  0x32u);
    }

    xpc_dictionary_set_BOOL(*(xpc_object_t *)(a1 + 48), "success", 0);
    v15 = *(void **)(a1 + 48);
    int v16 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 56) objectWithError:v5]);
    xpc_dictionary_set_value(v15, "error", v16);
  }

  else
  {
    if (v8)
    {
      int v17 = *(_DWORD *)(a1 + 64);
      v18 = v7;
      v19 = currentQueueName();
      pid_t v20 = xpc_connection_get_pid(*(xpc_connection_t *)(a1 + 32));
      uid_t v21 = xpc_connection_get_euid(*(xpc_connection_t *)(a1 + 32));
      [*(id *)(a1 + 40) timeIntervalSinceNow];
      int v25 = 67110402;
      int v26 = v17;
      __int16 v27 = 2080;
      v28 = v19;
      __int16 v29 = 1024;
      int v30 = v20;
      __int16 v31 = 1024;
      *(_DWORD *)pid_t v32 = v21;
      *(_WORD *)&v32[4] = 1024;
      *(_DWORD *)&v32[6] = a2;
      *(_WORD *)&v32[10] = 2048;
      *(double *)&v32[12] = -v22;
      _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_INFO,  "#%08x [%s] XPC response to pid %d uid %d: success=%{BOOL}d, elapsed=%.3f",  (uint8_t *)&v25,  0x2Eu);
    }

    xpc_dictionary_set_BOOL(*(xpc_object_t *)(a1 + 48), "success", a2);
  }

  xpc_connection_send_message(*(xpc_connection_t *)(a1 + 32), *(xpc_object_t *)(a1 + 48));
}

uint64_t sub_10000C2F4(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (xpc_get_type(v5) == (xpc_type_t)&_xpc_type_string)
  {
    string_ptr = xpc_string_get_string_ptr(v5);
    uint64_t v7 = *(void **)(a1 + 32);
    BOOL v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", string_ptr));
    int v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", a2));
    [v7 setObject:v8 forKey:v9];
  }

  return 1LL;
}

uint64_t sub_10000C398(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  uint64_t value = xpc_uint64_get_value(v4);
  uint64_t v6 = value - 1;
  if (value - 1 > 3) {
    goto LABEL_6;
  }
  uint64_t v7 = *(void *)(a1 + 40);
  if (!*(_BYTE *)(v7 + v6)
    && (uint64_t v8 = value,
        *(_BYTE *)(v7 + v6) = 1,
        int v9 = *(void **)(a1 + 32),
        uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( NSNumber,  "numberWithUnsignedLongLong:",  value)),  [v9 addObject:v10],  v10,  v8 == 4))
  {
    uint64_t v11 = 0LL;
  }

  else
  {
LABEL_6:
    uint64_t v11 = 1LL;
  }

  return v11;
}

void sub_10000C540(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  v37[0] = _NSConcreteStackBlock;
  v37[1] = 3221225472LL;
  v37[2] = sub_10000C840;
  v37[3] = &unk_100030DD8;
  id v4 = v2;
  id v38 = v4;
  id v5 = v3;
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v7 = *(void **)(a1 + 40);
  id v39 = v5;
  uint64_t v40 = v6;
  int v43 = *(_DWORD *)(a1 + 56);
  id v41 = v7;
  id v42 = *(id *)(a1 + 48);
  uint64_t v8 = objc_retainBlock(v37);
  id v9 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) localAddresses]);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) gatewayIdentifiers]);
  if (!v9)
  {
    uint64_t v11 = *(void **)(a1 + 32);
    id v35 = v10;
    id v36 = 0LL;
    unsigned __int8 v12 = [v11 makeLocalAddresses:&v36 andGatewayIdentifiers:&v35 tag:*(unsigned int *)(a1 + 56)];
    id v9 = v36;
    id v13 = v35;

    if ((v12 & 1) == 0)
    {

      id v13 = 0LL;
      id v9 = 0LL;
    }

    [*(id *)(a1 + 32) setLocalAddresses:v9];
    [*(id *)(a1 + 32) setGatewayIdentifiers:v13];
    uint64_t v10 = v13;
  }

  if (*(_BYTE *)(a1 + 60))
  {
    unint64_t v14 = 0LL;
    unint64_t v15 = 0LL;
  }

  else
  {
    int v16 = *(void **)(a1 + 32);
    id v33 = 0LL;
    id v34 = 0LL;
    [v16 cachedDNSPublicAddressRanges:&v34 andFavoredServerRanges:&v33 forNetworkIdentifiers:v10 tag:*(unsigned int *)(a1 + 56)];
    unint64_t v14 = (unint64_t)v34;
    unint64_t v15 = (unint64_t)v33;
  }

  if (v14 | v15)
  {
    if (v14) {
      [v4 addObject:v14];
    }
    if (v15) {
      [v5 addObject:v15];
    }
    ((void (*)(void *))v8[2])(v8);
  }

  else
  {
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472LL;
    v28[2] = sub_10000C9FC;
    v28[3] = &unk_100030E00;
    int v32 = *(_DWORD *)(a1 + 56);
    v28[4] = *(void *)(a1 + 32);
    id v29 = v4;
    id v30 = v5;
    __int16 v31 = v8;
    int v17 = objc_retainBlock(v28);
    v18 = *(void **)(a1 + 32);
    [v18 locateTimeout];
    double v20 = v19;
    unint64_t v27 = v14;
    id v21 = v9;
    double v22 = v10;
    int v23 = v8;
    id v24 = v5;
    id v25 = v4;
    int v26 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) queue]);
    [v18 resolveDNSRecordsWithTimeout:v17 callback:v26 callbackQueue:*(unsigned int *)(a1 + 56) tag:v20];

    id v4 = v25;
    id v5 = v24;
    uint64_t v8 = v23;
    uint64_t v10 = v22;
    id v9 = v21;
    unint64_t v14 = v27;
  }
}

void sub_10000C840(uint64_t a1)
{
  v22[0] = _kACSIntrospectionPublicAddressRangesKey;
  v22[1] = _kACSIntrospectionFavoredServerRangesKey;
  uint64_t v2 = *(void *)(a1 + 40);
  v23[0] = *(void *)(a1 + 32);
  v23[1] = v2;
  v22[2] = _kACSIntrospectionTestFlagsKey;
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( NSNumber,  "numberWithUnsignedLongLong:",  [*(id *)(a1 + 48) testFlags]));
  v23[2] = v3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v23,  v22,  3LL));

  id v5 = gLogHandle;
  if (os_log_type_enabled((os_log_t)gLogHandle, OS_LOG_TYPE_INFO))
  {
    int v6 = *(_DWORD *)(a1 + 72);
    uint64_t v7 = v5;
    uint64_t v8 = currentQueueName();
    pid_t pid = xpc_connection_get_pid(*(xpc_connection_t *)(a1 + 56));
    uid_t euid = xpc_connection_get_euid(*(xpc_connection_t *)(a1 + 56));
    v13[0] = 67110147;
    v13[1] = v6;
    __int16 v14 = 2080;
    unint64_t v15 = v8;
    __int16 v16 = 1024;
    pid_t v17 = pid;
    __int16 v18 = 1024;
    uid_t v19 = euid;
    __int16 v20 = 2113;
    id v21 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "#%08x [%s] XPC response to pid %d uid %d: introspection=%{private}@",  (uint8_t *)v13,  0x28u);
  }

  uint64_t v11 = *(void **)(a1 + 64);
  unsigned __int8 v12 = (void *)_CFXPCCreateXPCObjectFromCFObject(v4);
  xpc_dictionary_set_value(v11, "introspection", v12);

  xpc_connection_send_message(*(xpc_connection_t *)(a1 + 56), *(xpc_object_t *)(a1 + 64));
}

void sub_10000C9FC(uint64_t a1, void *a2, void *a3, void *a4, double a5)
{
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  unsigned __int8 v12 = gLogHandle;
  if (os_log_type_enabled((os_log_t)gLogHandle, OS_LOG_TYPE_DEBUG))
  {
    int v13 = *(_DWORD *)(a1 + 64);
    __int16 v14 = v12;
    v15[0] = 67110915;
    v15[1] = v13;
    __int16 v16 = 2080;
    pid_t v17 = currentQueueName();
    __int16 v18 = 2048;
    id v19 = [v9 count];
    __int16 v20 = 2113;
    id v21 = v9;
    __int16 v22 = 2048;
    id v23 = [v10 count];
    __int16 v24 = 2112;
    id v25 = v10;
    __int16 v26 = 2048;
    double v27 = a5;
    __int16 v28 = 2112;
    id v29 = v11;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEBUG,  "#%08x [%s] handleIntrospectEvent callback(dnsPublicAddressRanges=[%ld]%{private}@ dnsFavoredServerRanges=[%ld]%@ d nsValidityInterval=%.3f dnsError=%@)",  (uint8_t *)v15,  0x4Eu);
  }

  if ([v9 count]) {
    [*(id *)(a1 + 40) addObject:v9];
  }
  if ([v10 count]) {
    [*(id *)(a1 + 48) addObject:v10];
  }
  (*(void (**)(void))(*(void *)(a1 + 56) + 16LL))();
}

id sub_10000D010(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) localAddresses]);

  if (v2)
  {
    uint64_t v3 = gLogHandle;
    if (os_log_type_enabled((os_log_t)gLogHandle, OS_LOG_TYPE_INFO))
    {
      id v4 = v3;
      v6[0] = 67109378;
      v6[1] = 0;
      __int16 v7 = 2080;
      uint64_t v8 = currentQueueName();
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_INFO,  "#%08x [%s] network configuration changed; invalidating saved local address info",
        (uint8_t *)v6,
        0x12u);
    }
  }

  [*(id *)(a1 + 32) setLocalAddresses:0];
  [*(id *)(a1 + 32) setGatewayIdentifiers:0];
  return [*(id *)(a1 + 32) uncacheAllAffinitiesWithTag:0];
}

id sub_10000D3A0(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 networkChanged];
}

LABEL_98:
      __int16 v18 = v116;
      free(v41);
      goto LABEL_99;
    }

    int v86 = v14;
    id v30 = v27;
    __int16 v31 = v25;
    __int16 v87 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: out of memory for %d byte DNS buffer",  v86,  v39));
    v88 = createTaggedError(NSPOSIXErrorDomain, 12LL, v87, v123);
    id v34 = (id)objc_claimAutoreleasedReturnValue(v88);

    id v36 = 0LL;
    id v35 = 0LL;
    id v37 = 0.0;
    __int16 v18 = v116;
LABEL_99:
    res_9_ndestroy(&res);
    __int16 v16 = v117;
    goto LABEL_100;
  }

  v51 = (void *)objc_claimAutoreleasedReturnValue([v21 objectForKey:@"delay"]);
  [v51 doubleValue];
  double v53 = v52;

  double v54 = (void *)objc_claimAutoreleasedReturnValue([v21 objectForKey:@"error"]);
  double v55 = [v54 BOOLValue];

  v56 = (void *)objc_claimAutoreleasedReturnValue([v21 objectForKey:@"response"]);
  if (v53 < a4) {
    v57 = v53;
  }
  else {
    v57 = a4;
  }
  v58 = dispatch_time(0LL, (uint64_t)(v57 * 1000000000.0));
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
  v60 = v18;
  v61 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10000EF54;
  block[3] = &unk_100030E78;
  v142 = v53 >= a4;
  v141 = v123;
  v143 = v55;
  v136 = v56;
  v137 = self;
  v138 = v14;
  v139 = v16;
  v140 = v15;
  v62 = v15;
  v63 = v56;
  dispatch_after(v58, v61, block);

  __int16 v18 = v60;
  id v30 = 0LL;
  __int16 v26 = 0LL;
  __int16 v31 = 0LL;
  v64 = 0LL;
LABEL_101:
}

void sub_10000EF54(uint64_t a1)
{
  char v61 = 0;
  if (!*(_BYTE *)(a1 + 76))
  {
    if (*(_BYTE *)(a1 + 77))
    {
      NSErrorDomain v2 = NSURLErrorDomain;
      uint64_t v3 = *(unsigned int *)(a1 + 72);
      id v4 = @"simulated error";
      uint64_t v5 = -1011LL;
      goto LABEL_5;
    }

    __int16 v16 = *(void **)(a1 + 32);
    pid_t v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", "prs="));
    id v18 = (id)objc_claimAutoreleasedReturnValue([v16 objectForKey:v17]);

    if (v18)
    {
      id v19 = (void *)objc_claimAutoreleasedReturnValue([v18 dataUsingEncoding:4]);
      __int16 v20 = *(void **)(a1 + 40);
      uint64_t v21 = *(void *)(a1 + 48);
      id v22 = v19;
      id v23 = [v22 bytes];
      id v24 = [v22 length];
      id v60 = 0LL;
      LODWORD(v49) = *(_DWORD *)(a1 + 72);
      id v9 = (void *)objc_claimAutoreleasedReturnValue( [v20 makeRangesFromDNSRecordNamed:v21 withType:0 data:v23 length:v24 more:&v61 error:&v60 tag:v49]);
      id v7 = v60;
    }

    else
    {
      id v25 = *(void **)(a1 + 32);
      __int16 v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", "prn="));
      id v9 = (void *)objc_claimAutoreleasedReturnValue([v25 objectForKey:v26]);

      if (!v9)
      {
        id v7 = 0LL;
LABEL_12:
        __int16 v31 = *(void **)(a1 + 32);
        int v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", "fss="));
        id v33 = (id)objc_claimAutoreleasedReturnValue([v31 objectForKey:v32]);

        if (v33)
        {
          id v34 = (void *)objc_claimAutoreleasedReturnValue([v33 dataUsingEncoding:4]);
          id v35 = *(void **)(a1 + 40);
          uint64_t v36 = *(void *)(a1 + 48);
          id v37 = v34;
          id v38 = [v37 bytes];
          id v39 = [v37 length];
          id v58 = v7;
          LODWORD(v49) = *(_DWORD *)(a1 + 72);
          uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( [v35 makeRangesFromDNSRecordNamed:v36 withType:2 data:v38 length:v39 more:&v61 error:&v58 tag:v49]);
          id v40 = v58;

          id v7 = v37;
        }

        else
        {
          id v41 = *(void **)(a1 + 32);
          id v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", "fsn="));
          uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v41 objectForKey:v42]);

          if (!v8)
          {
LABEL_17:
            v47 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) objectForKey:@"ttl"]);
            [v47 doubleValue];
            uint64_t v10 = v48;

            goto LABEL_6;
          }

          int v43 = *(void **)(a1 + 40);
          uint64_t v44 = *(void *)(a1 + 48);
          id v33 = v8;
          id v45 = [v33 bytes];
          id v46 = [v33 length];
          id v57 = v7;
          LODWORD(v49) = *(_DWORD *)(a1 + 72);
          uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( [v43 makeRangesFromDNSRecordNamed:v44 withType:3 data:v45 length:v46 more:&v61 error:&v57 tag:v49]);
          id v40 = v57;
        }

        id v7 = v40;
        goto LABEL_17;
      }

      double v27 = *(void **)(a1 + 40);
      uint64_t v28 = *(void *)(a1 + 48);
      id v18 = v9;
      id v29 = [v18 bytes];
      id v30 = [v18 length];
      id v59 = 0LL;
      LODWORD(v49) = *(_DWORD *)(a1 + 72);
      id v9 = (void *)objc_claimAutoreleasedReturnValue( [v27 makeRangesFromDNSRecordNamed:v28 withType:1 data:v29 length:v30 more:&v61 error:&v59 tag:v49]);
      id v7 = v59;
    }

    goto LABEL_12;
  }

  NSErrorDomain v2 = NSURLErrorDomain;
  uint64_t v3 = *(unsigned int *)(a1 + 72);
  id v4 = @"simulated timeout";
  uint64_t v5 = -1001LL;
LABEL_5:
  id TaggedError = createTaggedError(v2, v5, v4, v3);
  id v7 = (id)objc_claimAutoreleasedReturnValue(TaggedError);
  uint64_t v8 = 0LL;
  id v9 = 0LL;
  uint64_t v10 = 0LL;
LABEL_6:
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10000F368;
  block[3] = &unk_100030E50;
  id v11 = *(dispatch_queue_s **)(a1 + 56);
  id v12 = *(id *)(a1 + 64);
  id v51 = v9;
  id v52 = v8;
  uint64_t v55 = v10;
  char v56 = v61;
  id v53 = v7;
  id v54 = v12;
  id v13 = v7;
  id v14 = v8;
  id v15 = v9;
  dispatch_async(v11, block);
}

uint64_t sub_10000F368(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void, void, void, double))(*(void *)(a1 + 56) + 16LL))( *(void *)(a1 + 56),  *(void *)(a1 + 32),  *(void *)(a1 + 40),  *(unsigned __int8 *)(a1 + 72),  *(void *)(a1 + 48),  *(double *)(a1 + 64));
}

uint64_t sub_10000F384(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 56);
  if (v2) {
    return (*(uint64_t (**)(uint64_t, void, void, void, double))(v3 + 16))(v3, 0LL, 0LL, 0LL, 0.0);
  }
  else {
    return (*(uint64_t (**)(uint64_t, void, void, void, double))(v3 + 16))( v3,  *(void *)(a1 + 40),  *(void *)(a1 + 48),  *(unsigned __int8 *)(a1 + 72),  *(double *)(a1 + 64));
  }
}

LABEL_36:
    v50 = !v40;
    if (v82 != 0.0) {
      v50 = 1;
    }
    if ((v50 & 1) != 0)
    {
      id v33 = 0;
    }

    else
    {
      if ((int)-[__CFString intValue](v11, "intValue") >= 25)
      {
        id v30 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"too many chained DNS records, max %d",  25LL));
        id v51 = createTaggedError(NSPOSIXErrorDomain, 62LL, v30, a6);
        *(double *)&int v32 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue(v51));
        goto LABEL_16;
      }

      [v75 timeIntervalSinceNow];
      a3 = v52;
      if (v52 <= 0.0)
      {
        id v30 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"_aaplcache%@._tcp",  v11));
        id v54 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"timed out before getting to DNS resolution of %@",  v30));
        uint64_t v55 = createTaggedError(NSPOSIXErrorDomain, 60LL, v54, a6);
        *(double *)&int v32 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue(v55));

        goto LABEL_16;
      }

      __int128 v82 = 0.0;
      id v33 = 1;
    }

LABEL_17:
  }

  while ((v33 & 1) != 0);
  char v56 = gLogHandle;
  id v57 = os_log_type_enabled((os_log_t)v56, OS_LOG_TYPE_INFO);
  if (v82 == 0.0)
  {
    if (v57)
    {
      v62 = currentQueueName();
      v63 = COERCE_DOUBLE([v79 count]);
      v64 = (const char *)[v78 count];
      v65 = *((void *)v104 + 3);
      *(_DWORD *)buf = 67110659;
      v108 = a6;
      v109 = 2080;
      v110 = v62;
      v111 = 2048;
      v112 = v63;
      v113 = 2113;
      v114 = v79;
      v115 = 2048;
      label = v64;
      v117 = 2112;
      v118 = v78;
      v119 = 2048;
      v120 = v65;
      id v59 = "#%08x [%s] resolveDNSRecords -> public addresses: [%ld]%{private}@, favored servers: [%ld]%@, validityInterval %.f";
      id v60 = (os_log_s *)v56;
      char v61 = 68;
LABEL_50:
      _os_log_impl((void *)&_mh_execute_header, v60, OS_LOG_TYPE_INFO, v59, buf, v61);
    }
  }

  else if (v57)
  {
    id v58 = currentQueueName();
    *(_DWORD *)buf = 67109634;
    v108 = a6;
    v109 = 2080;
    v110 = v58;
    v111 = 2112;
    v112 = v82;
    id v59 = "#%08x [%s] resolveDNSRecords -> %@";
    id v60 = (os_log_s *)v56;
    char v61 = 28;
    goto LABEL_50;
  }

  v85[0] = _NSConcreteStackBlock;
  v85[1] = 3221225472LL;
  v85[2] = sub_100010240;
  v85[3] = &unk_100030F18;
  int v86 = v82;
  __int16 v87 = v79;
  v88 = v78;
  __int16 v89 = v73;
  v90 = &v103;
  double v66 = v78;
  double v67 = v79;
  double v68 = v73;
  double v69 = *(id *)&v82;
  dispatch_async(queue, v85);

  _Block_object_dispose(&v103, 8);
}

void sub_10000FE38( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, uint64_t a48, uint64_t a49, uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,char a59)
{
}

void sub_10000FE98(uint64_t a1)
{
  uint64_t v3 = *(void **)(a1 + 32);
  uint64_t v2 = *(void **)(a1 + 40);
  double v4 = *(double *)(a1 + 80);
  BOOL v5 = *(void *)(a1 + 48) != (void)&stru_100031770;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_10000FF7C;
  v8[3] = &unk_100030EC8;
  int v13 = *(_DWORD *)(a1 + 88);
  id v6 = v2;
  uint64_t v7 = *(void *)(a1 + 32);
  id v9 = v6;
  uint64_t v10 = v7;
  id v11 = *(id *)(a1 + 56);
  id v12 = *(id *)(a1 + 64);
  [v3 resolveDNSRecordNamed:v6 withTimeout:v5 errorIfNotFound:v8 callback:*(void *)(a1 + 72) callbackQueue:*(unsigned int *)(a1 + 88) tag:v4];
}

void sub_10000FF7C(uint64_t a1, void *a2, void *a3, uint64_t a4, void *a5, double a6)
{
  id v11 = a2;
  id v12 = a3;
  id v13 = a5;
  id v14 = gLogHandle;
  if (os_log_type_enabled((os_log_t)gLogHandle, OS_LOG_TYPE_DEBUG))
  {
    int v20 = *(_DWORD *)(a1 + 64);
    uint64_t v21 = v14;
    id v22 = currentQueueName();
    uint64_t v23 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 67111427;
    int v31 = v20;
    __int16 v32 = 2080;
    id v33 = v22;
    __int16 v34 = 2112;
    uint64_t v35 = v23;
    __int16 v36 = 2048;
    id v37 = [v11 count];
    __int16 v38 = 2113;
    id v39 = v11;
    __int16 v40 = 2048;
    id v41 = [v12 count];
    __int16 v42 = 2112;
    id v43 = v12;
    __int16 v44 = 2048;
    double v45 = a6;
    __int16 v46 = 1024;
    int v47 = a4;
    __int16 v48 = 2112;
    id v49 = v13;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEBUG,  "#%08x [%s] resolveDNSRecords: %@ callback(publicAddressRanges=[%ld]%{private}@, favoredServerRanges=[%ld]%@, valid ityInterval=%.3f, more=%{BOOL}d, error=%@)",  buf,  0x5Eu);
  }

  if (a6 == 0.0)
  {
    a6 = 3600.0;
  }

  else if (a6 < 300.0 && ((unint64_t)[*(id *)(a1 + 40) testFlags] & 2) == 0)
  {
    a6 = 300.0;
  }

  if (v13)
  {
    uint64_t v28 = @"error";
    id v29 = v13;
    id v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v29,  &v28,  1LL));
    if (v15) {
LABEL_10:
    }
      [*(id *)(a1 + 48) setObject:v15 forKey:*(void *)(a1 + 32)];
  }

  else
  {
    __int16 v16 = &__NSArray0__struct;
    id v24 = @"publicAddressRanges";
    id v25 = @"favoredServerRanges";
    if (v11) {
      pid_t v17 = v11;
    }
    else {
      pid_t v17 = &__NSArray0__struct;
    }
    if (v12) {
      __int16 v16 = v12;
    }
    v27[0] = v17;
    v27[1] = v16;
    id v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithDouble:]( &OBJC_CLASS___NSNumber,  "numberWithDouble:",  a6,  v24,  v25,  @"validityInterval"));
    v27[2] = v18;
    __int16 v26 = @"more";
    id v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", a4));
    v27[3] = v19;
    id v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v27,  &v24,  4LL));

    if (v15) {
      goto LABEL_10;
    }
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
}

uint64_t sub_100010240(void *a1)
{
  uint64_t v2 = a1[4];
  uint64_t v3 = a1[7];
  if (v2) {
    return (*(uint64_t (**)(uint64_t, void, void, double))(v3 + 16))(v3, 0LL, 0LL, 0.0);
  }
  else {
    return (*(uint64_t (**)(uint64_t, void, void, double))(v3 + 16))( v3,  a1[5],  a1[6],  *(double *)(*(void *)(a1[8] + 8LL) + 24LL));
  }
}

LABEL_24:
    if (v19) {
      goto LABEL_43;
    }
    if (v12 == (id)++v13)
    {
      uint64_t v10 = v44;
      goto LABEL_46;
    }
  }

LABEL_43:
  __int16 v36 = gLogHandle;
  if (os_log_type_enabled((os_log_t)gLogHandle, OS_LOG_TYPE_DEFAULT))
  {
    id v37 = v36;
    __int16 v38 = currentQueueName();
    *(_DWORD *)buf = 67110146;
    *(_DWORD *)&uint8_t buf[4] = a5;
    *(_WORD *)&buf[8] = 2080;
    *(void *)&buf[10] = v38;
    *(_WORD *)&buf[18] = 2048;
    *(void *)&buf[20] = v13 + 1;
    *(_WORD *)&buf[28] = 2048;
    *(void *)&buf[30] = v12;
    *(_WORD *)&buf[38] = 2112;
    *(void *)&buf[40] = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v37,  OS_LOG_TYPE_DEFAULT,  "#%08x [%s] sanitizeRanges: bad entry %lu/%lu in %@",  buf,  0x30u);
  }

  uint64_t v10 = 0LL;
LABEL_46:
  if (os_log_type_enabled((os_log_t)gLogHandle, OS_LOG_TYPE_DEBUG)) {
    sub_100020164();
  }

  return v10;
}

    uint64_t v3 = 1LL;
    goto LABEL_31;
  }

  if (!*(void *)(a1 + 56)) {
    goto LABEL_24;
  }
  id v13 = *(void **)(a1 + 64);
  if (!v13 || (unint64_t)[v13 length] > 0x400)
  {
    int v47 = gLogHandle;
    uint64_t v3 = 0LL;
    if (os_log_type_enabled((os_log_t)gLogHandle, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v48 = *(_DWORD *)(a1 + 152);
      __int16 v40 = v47;
      id v49 = currentQueueName();
      __int16 v42 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) absoluteString]);
      v50 = [*(id *)(a1 + 64) length];
      *(_DWORD *)buf = 67109890;
      __int128 v81 = v48;
      __int128 v82 = 2080;
      __int128 v83 = v49;
      v84 = 2112;
      v85 = v42;
      int v86 = 2048;
      __int16 v87 = v50;
      id v43 = "#%08x [%s] Invalid response from %@: %ld bytes";
      __int16 v44 = v40;
      double v45 = OS_LOG_TYPE_DEFAULT;
      __int16 v46 = 38;
      goto LABEL_29;
    }

    id v24 = 0;
    goto LABEL_25;
  }

  id v24 = 0;
LABEL_27:
  id v25 = gLogHandle;
  if (os_log_type_enabled((os_log_t)gLogHandle, OS_LOG_TYPE_DEBUG))
  {
    double v27 = v25;
    uint64_t v28 = currentQueueName();
    *(_DWORD *)buf = 67110146;
    __int16 v40 = a5;
    id v41 = 2080;
    __int16 v42 = v28;
    id v43 = 2112;
    __int16 v44 = v9;
    double v45 = 2112;
    __int16 v46 = v8;
    int v47 = 1024;
    __int16 v48 = v24;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_DEBUG,  "#%08x [%s] isAddress:%@ inCompiledRanges:%@ -> %{BOOL}d",  buf,  0x2Cu);
  }

  return v24;
}

LABEL_39:
  __int128 v82 = [v33 count];
  int v47 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s objectForKey:](v16, "objectForKey:", @"serversRecentlySeen"));
  v76 = [v47 count];
  if ([v47 count])
  {
    __int16 v48 = 0LL;
    do
    {
      id v49 = (void *)objc_claimAutoreleasedReturnValue([v47 objectAtIndex:v48]);
      v50 = (void *)objc_claimAutoreleasedReturnValue([v49 objectForKey:@"validUntil"]);
      if ([v50 compare:v23] == (id)1)
      {
        ++v48;
      }

      else
      {
        id v51 = gLogHandle;
        if (os_log_type_enabled((os_log_t)gLogHandle, OS_LOG_TYPE_INFO))
        {
          id v52 = v51;
          id v53 = currentQueueName();
          *(_DWORD *)buf = 67110146;
          v88 = v3;
          __int16 v89 = 2080;
          v90 = v53;
          v91 = 2112;
          v92 = @"expired";
          v93 = 2112;
          v94 = @"serversRecentlySeen";
          v95 = 2112;
          v96 = v49;
          _os_log_impl( (void *)&_mh_execute_header,  v52,  OS_LOG_TYPE_INFO,  "#%08x [%s] loadDiskCache: discarding %@ %@ entry %@",  buf,  0x30u);
        }

        [v47 removeObjectAtIndex:v48];
        uint64_t v23 = (uint64_t)v83;
      }
    }

    while (v48 < (unint64_t)[v47 count]);
  }

  uint64_t v55 = [v47 count] != v76 || v82 != v77;
  char v56 = v55 | v79;
  id v57 = (void *)objc_claimAutoreleasedReturnValue(-[AssetCacheLocatorService diskCache](self, "diskCache"));
  id v58 = -[AssetCacheLocatorService transferVolatileStateFromDiskCache:toDiskCache:tag:]( self,  "transferVolatileStateFromDiskCache:toDiskCache:tag:",  v57,  v16,  v3);

  -[AssetCacheLocatorService setDiskCache:](self, "setDiskCache:", v16);
  if ((v56 & 1) != 0 || v58)
  {
    -[AssetCacheLocatorService saveDiskCacheWithTag:](self, "saveDiskCacheWithTag:", v3);
    id v59 = v78;
    id v60 = v80;
    if ((v56 & 1) != 0) {
      -[AssetCacheLocatorService uncacheAllAffinitiesWithTag:](self, "uncacheAllAffinitiesWithTag:", v3);
    }
  }

  else
  {
    -[AssetCacheLocatorService updateDiskCacheRefreshTimerWithTag:](self, "updateDiskCacheRefreshTimerWithTag:", v3);
    id v59 = v78;
    id v60 = v80;
  }

LABEL_67:
  if (os_log_type_enabled((os_log_t)gLogHandle, OS_LOG_TYPE_DEBUG)) {
    sub_1000202F4();
  }
}

void sub_100011C3C(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  NSFileAttributeKey v30 = NSFileProtectionKey;
  NSFileProtectionType v31 = NSFileProtectionCompleteUntilFirstUserAuthentication;
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v31,  &v30,  1LL));
  double v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) diskCachePlistPath]);
  id v21 = 0LL;
  unsigned __int8 v5 = [v2 setAttributes:v3 ofItemAtPath:v4 error:&v21];
  id v6 = v21;

  if ((v5 & 1) == 0)
  {
    uint64_t v7 = gLogHandle;
    if (os_log_type_enabled((os_log_t)gLogHandle, OS_LOG_TYPE_INFO))
    {
      int v8 = *(_DWORD *)(a1 + 40);
      id v9 = v7;
      uint64_t v10 = currentQueueName();
      id v11 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) diskCachePlistPath]);
      *(_DWORD *)buf = 67109890;
      int v23 = v8;
      __int16 v24 = 2080;
      id v25 = v10;
      __int16 v26 = 2112;
      double v27 = v11;
      __int16 v28 = 2112;
      id v29 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_INFO,  "#%08x [%s] failed to set attributes of %@: %@",  buf,  0x26u);
    }
  }

  uint64_t v12 = objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) diskCachePlistPath]);
  id v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", v12));

  id v20 = 0LL;
  LOBYTE(v12) = [v13 setResourceValue:&__kCFBooleanTrue forKey:NSURLIsExcludedFromBackupKey error:&v20];
  id v14 = v20;
  if ((v12 & 1) == 0)
  {
    id v15 = gLogHandle;
    if (os_log_type_enabled((os_log_t)gLogHandle, OS_LOG_TYPE_INFO))
    {
      int v16 = *(_DWORD *)(a1 + 40);
      pid_t v17 = v15;
      id v18 = currentQueueName();
      id v19 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) diskCachePlistPath]);
      *(_DWORD *)buf = 67109890;
      int v23 = v16;
      __int16 v24 = 2080;
      id v25 = v18;
      __int16 v26 = 2112;
      double v27 = v19;
      __int16 v28 = 2112;
      id v29 = v14;
      _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_INFO,  "#%08x [%s] failed to exclude %@ from backups: %@",  buf,  0x26u);
    }
  }
}

LABEL_54:
}

LABEL_20:
  return v26;
}

  id v22 = *(void **)(a1 + 32);
  __int16 v36 = 0LL;
  id v37 = 0LL;
  [v22 refineServers:v7 intoBest:&v37 andOther:&v36 tag:*(unsigned int *)(a1 + 80)];
  int v23 = v37;
  __int16 v24 = v36;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10001E2BC;
  block[3] = &unk_100031490;
  id v25 = *(dispatch_queue_s **)(a1 + 56);
  __int16 v26 = *(id *)(a1 + 64);
  NSFileProtectionType v31 = v23;
  __int16 v32 = v24;
  uint64_t v35 = v40;
  id v33 = v8;
  __int16 v34 = v26;
  double v27 = v8;
  __int16 v28 = v24;
  id v29 = v23;
  dispatch_async(v25, block);
}

id sub_10001466C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) setValue:a3 forHTTPHeaderField:a2];
}

void sub_100014678(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) locateOpQueue]);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_100014718;
  v5[3] = &unk_100030FD0;
  __int16 v10 = *(_WORD *)(a1 + 60);
  int v9 = *(_DWORD *)(a1 + 56);
  id v3 = *(id *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 32);
  id v6 = v3;
  uint64_t v7 = v4;
  uint64_t v8 = *(void *)(a1 + 48);
  [v2 addOperationWithBlock:v5];
}

void sub_100014718(uint64_t a1)
{
  id v27 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
  if (*(_BYTE *)(a1 + 60))
  {
    NSErrorDomain v2 = NSURLErrorDomain;
    uint64_t v3 = *(unsigned int *)(a1 + 56);
    uint64_t v4 = @"simulated timeout";
    uint64_t v5 = -1001LL;
LABEL_5:
    id TaggedError = createTaggedError(v2, v5, v4, v3);
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(TaggedError);
    goto LABEL_6;
  }

  if (*(_BYTE *)(a1 + 61))
  {
    NSErrorDomain v2 = NSURLErrorDomain;
    uint64_t v3 = *(unsigned int *)(a1 + 56);
    uint64_t v4 = @"simulated error";
    uint64_t v5 = -1011LL;
    goto LABEL_5;
  }

  if ([*(id *)(a1 + 32) isEqual:&stru_100031770])
  {
    __int16 v10 = 0LL;
  }

  else
  {
    uint64_t v11 = *(void *)(a1 + 32);
    if (v11) {
      uint64_t v12 = objc_claimAutoreleasedReturnValue( +[NSJSONSerialization dataWithJSONObject:options:error:]( &OBJC_CLASS___NSJSONSerialization,  "dataWithJSONObject:options:error:",  v11,  0LL,  0LL));
    }
    else {
      uint64_t v12 = objc_claimAutoreleasedReturnValue([@"NO_LOCAL_SERVER" dataUsingEncoding:4]);
    }
    __int16 v10 = (void *)v12;
  }

  id v13 = objc_alloc(&OBJC_CLASS___NSHTTPURLResponse);
  id v14 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) locateURL]);
  if (*(void *)(a1 + 48)) {
    uint64_t v15 = *(void *)(a1 + 48);
  }
  else {
    uint64_t v15 = 404LL;
  }
  int v16 = -[NSHTTPURLResponse initWithURL:statusCode:HTTPVersion:headerFields:]( v13,  "initWithURL:statusCode:HTTPVersion:headerFields:",  v14,  v15,  @"HTTP/1.1",  0LL);

  [*(id *)(a1 + 40) setLocateServerValidated:1];
  pid_t v17 = *(void **)(a1 + 40);
  id v18 = (void *)objc_claimAutoreleasedReturnValue([v17 locateSession]);
  [v17 URLSession:v18 dataTask:v27 didReceiveResponse:v16 completionHandler:&stru_100030FA8];

  if ([v10 length])
  {
    unint64_t v19 = (unint64_t)[v10 length];
    unint64_t v20 = v19 >> 1;
    if (v19 >= 2)
    {
      id v21 = *(void **)(a1 + 40);
      id v22 = (void *)objc_claimAutoreleasedReturnValue([v21 locateSession]);
      int v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "subdataWithRange:", 0, v20));
      [v21 URLSession:v22 dataTask:v27 didReceiveData:v23];
    }

    __int16 v24 = *(void **)(a1 + 40);
    id v25 = (void *)objc_claimAutoreleasedReturnValue([v24 locateSession]);
    __int16 v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "subdataWithRange:", v20, (char *)objc_msgSend(v10, "length") - v20));
    [v24 URLSession:v25 dataTask:v27 didReceiveData:v26];
  }

  uint64_t v7 = 0LL;
LABEL_6:
  uint64_t v8 = *(void **)(a1 + 40);
  int v9 = (void *)objc_claimAutoreleasedReturnValue([v8 locateSession]);
  [v8 URLSession:v9 task:v27 didCompleteWithError:v7];
}

void sub_1000149A4(id a1, int64_t a2)
{
  if (a2 != 1) {
    sub_100020F58();
  }
}

uint64_t sub_1000149BC(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void, void, void, double))(*(void *)(a1 + 40) + 16LL))( *(void *)(a1 + 40),  0LL,  0LL,  0LL,  *(void *)(a1 + 32),  0.0);
}

void sub_1000150DC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, char a29)
{
}

void sub_10001511C(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  uint64_t v7 = objc_opt_class(&OBJC_CLASS___NSDictionary);
  if ((objc_opt_isKindOfClass(v6, v7) & 1) != 0)
  {
    id v8 = (id)objc_claimAutoreleasedReturnValue([v6 objectForKey:@"address"]);
    int v9 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:@"port"]);
    __int16 v10 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:@"details"]);
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:@"guid"]);
    if (!v8) {
      goto LABEL_26;
    }
    uint64_t v12 = objc_opt_class(&OBJC_CLASS___NSString);
    if ((objc_opt_isKindOfClass(v8, v12) & 1) == 0) {
      goto LABEL_26;
    }
    if (!v9) {
      goto LABEL_26;
    }
    uint64_t v13 = objc_opt_class(&OBJC_CLASS___NSNumber);
    if ((objc_opt_isKindOfClass(v9, v13) & 1) == 0)
    {
      uint64_t v14 = objc_opt_class(&OBJC_CLASS___NSString);
      if ((objc_opt_isKindOfClass(v9, v14) & 1) == 0) {
        goto LABEL_26;
      }
    }

    if (v10)
    {
      uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) serverDetailsVerifier]);
      a3 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"servers[%ld].details",  a3));
    }

    else if (!v11)
    {
      goto LABEL_26;
    }

    uint64_t v15 = objc_opt_class(&OBJC_CLASS___NSString);
    if ((objc_opt_isKindOfClass(v11, v15) & 1) != 0)
    {
      __int16 v48 = v3;
      int v16 = -[NSUUID initWithUUIDString:](objc_alloc(&OBJC_CLASS___NSUUID), "initWithUUIDString:", v11);

      if (v10)
      {
      }

      if (!v16) {
        goto LABEL_26;
      }
      unsigned int v46 = [*(id *)(a1 + 32) isAddress:v8 inCompiledRanges:*(void *)(a1 + 40) tag:*(unsigned int *)(a1 + 72)];
      if ([v8 containsString:@":"]
        && ([v8 hasPrefix:@"["] & 1) == 0)
      {
        uint64_t v17 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"[%@]", v8));

        id v8 = (id)v17;
      }

      uint64_t v18 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@:%@", v8, v9));
      double v19 = *(double *)(a1 + 64);
      uint64_t v20 = objc_claimAutoreleasedReturnValue([v6 objectForKey:@"connect-timeout"]);
      id v21 = (void *)v20;
      id v49 = (void *)v18;
      if (v20)
      {
        id v22 = &CCHmac_ptr;
        if ((objc_opt_respondsToSelector(v20, "doubleValue") & 1) != 0)
        {
          [v21 doubleValue];
          double v19 = v23;
          if (v23 < 0.2) {
            double v19 = 1.0;
          }
        }
      }

      else
      {
        id v22 = &CCHmac_ptr;
      }

      int v47 = v21;
      NSFileAttributeKey v30 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) serverDetailsVerifier]);
      uint64_t v31 = objc_claimAutoreleasedReturnValue([v30 sanitize:v10 tag:*(unsigned int *)(a1 + 72)]);

      if (v31) {
        __int16 v32 = (void *)v31;
      }
      else {
        __int16 v32 = &__NSDictionary0__struct;
      }
      id v33 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue([v6 objectForKey:@"rank"]);
      if (!v33 || (uint64_t v34 = objc_opt_class(v22[55]), (objc_opt_isKindOfClass(v33, v34) & 1) == 0))
      {

        id v33 = &off_100033608;
      }

      uint64_t v35 = v49;
      if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL))
      {
        if ([*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) containsObject:v49]) {
          goto LABEL_43;
        }
      }

      else
      {
        uint64_t v36 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
        uint64_t v37 = *(void *)(*(void *)(a1 + 48) + 8LL);
        __int16 v38 = *(void **)(v37 + 40);
        *(void *)(v37 + 40) = v36;

        uint64_t v39 = objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
        uint64_t v40 = *(void *)(*(void *)(a1 + 56) + 8LL);
        id v41 = *(void **)(v40 + 40);
        *(void *)(v40 + 40) = v39;
      }

      double v45 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL);
      v59[0] = v49;
      v58[0] = @"localAddressAndPort";
      v58[1] = @"connectTimeout";
      __int16 v42 = (void *)objc_claimAutoreleasedReturnValue([v22[55] numberWithDouble:v19]);
      v59[1] = v42;
      v59[2] = v32;
      v58[2] = @"details";
      v58[3] = @"favored";
      id v43 = (void *)objc_claimAutoreleasedReturnValue([v22[55] numberWithBool:v46]);
      v59[3] = v43;
      v59[4] = v11;
      v58[4] = @"guid";
      v58[5] = @"rank";
      v59[5] = v33;
      __int16 v44 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v59,  v58,  6LL));
      [v45 addObject:v44];

      uint64_t v35 = v49;
      [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) addObject:v49];
LABEL_43:

      goto LABEL_29;
    }

    if (v10)
    {
LABEL_25:
    }

LABEL_26:
  }

  __int16 v24 = gLogHandle;
  if (os_log_type_enabled((os_log_t)gLogHandle, OS_LOG_TYPE_DEFAULT))
  {
    int v25 = *(_DWORD *)(a1 + 72);
    id v8 = v24;
    __int16 v26 = currentQueueName();
    id v27 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) locateURL]);
    __int16 v28 = (void *)objc_claimAutoreleasedReturnValue([v27 absoluteString]);
    uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) redactObject:v6]);
    *(_DWORD *)buf = 67109890;
    int v51 = v25;
    __int16 v52 = 2080;
    id v53 = v26;
    __int16 v54 = 2112;
    uint64_t v55 = v28;
    __int16 v56 = 2112;
    id v57 = v29;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v8,  OS_LOG_TYPE_DEFAULT,  "#%08x [%s] in response from %@, server entry is invalid: %@",  buf,  0x26u);

LABEL_29:
  }
}

void sub_100015C10(uint64_t a1, void *a2, void *a3)
{
  int v16 = _NSConcreteStackBlock;
  uint64_t v18 = sub_100015D34;
  double v19 = &unk_100031048;
  int v23 = *(_DWORD *)(a1 + 72);
  id v6 = *(void **)(a1 + 40);
  uint64_t v20 = *(void *)(a1 + 32);
  uint64_t v17 = 3221225472LL;
  id v21 = v6;
  id v22 = *(id *)(a1 + 64);
  id v7 = a3;
  id v8 = a2;
  int v9 = objc_retainBlock(&v16);
  __int16 v10 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 48), "timeIntervalSinceNow", v16, v17, v18, v19, v20);
  double v12 = v11;
  uint64_t v13 = *(void *)(a1 + 56);
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(global_queue);
  [v10 locateLocalCachingServersWithHeaders:v8 body:v7 timeout:v13 favoredServerRanges:v9 callback:v15 callbackQueue:*(unsigned int *)(a1 + 72) tag:v12];
}

void sub_100015D34(uint64_t a1, void *a2, int a3, void *a4, void *a5, double a6)
{
  id v11 = a2;
  id v12 = a4;
  id v13 = a5;
  uint64_t v14 = gLogHandle;
  if (os_log_type_enabled((os_log_t)gLogHandle, OS_LOG_TYPE_DEBUG))
  {
    int v20 = *(_DWORD *)(a1 + 56);
    id v21 = v14;
    id v22 = currentQueueName();
    int v23 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) redactObject:v11]);
    __int16 v24 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) redactObject:v12]);
    *(_DWORD *)buf = 67110658;
    int v33 = v20;
    __int16 v34 = 2080;
    uint64_t v35 = v22;
    __int16 v36 = 2112;
    uint64_t v37 = v23;
    __int16 v38 = 1024;
    int v39 = a3;
    __int16 v40 = 2112;
    id v41 = v24;
    __int16 v42 = 2048;
    double v43 = a6;
    __int16 v44 = 2112;
    id v45 = v13;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEBUG,  "#%08x [%s] locateLocalCachingServers callback(locateServers=%@, sorted=%{BOOL}d, other=%@, locateValidityInterval= %.3f, locateError=%@)",  buf,  0x40u);
  }

  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472LL;
  v25[2] = sub_100015F44;
  v25[3] = &unk_100030E50;
  uint64_t v15 = *(dispatch_queue_s **)(a1 + 40);
  id v16 = *(id *)(a1 + 48);
  char v31 = a3;
  id v26 = v11;
  id v27 = v12;
  double v30 = a6;
  id v28 = v13;
  id v29 = v16;
  id v17 = v13;
  id v18 = v12;
  id v19 = v11;
  dispatch_async(v15, v25);
}

uint64_t sub_100015F44(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void, void, void, double))(*(void *)(a1 + 56) + 16LL))( *(void *)(a1 + 56),  *(void *)(a1 + 32),  *(unsigned __int8 *)(a1 + 72),  *(void *)(a1 + 40),  *(void *)(a1 + 48),  *(double *)(a1 + 64));
}

id sub_100015F60(uint64_t a1)
{
  NSErrorDomain v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) softwareVersions]);
  [v2 setObject:v3 forKey:@"locator-software"];

  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"#%08x",  *(unsigned int *)(a1 + 56)));
  [v2 setObject:v4 forKey:@"locator-tag"];

  [v2 setObject:*(void *)(a1 + 40) forKey:@"local-addresses"];
  if ([*(id *)(a1 + 48) count]) {
    [v2 setObject:*(void *)(a1 + 48) forKey:@"public-address-ranges"];
  }
  [v2 setObject:&__kCFBooleanTrue forKey:@"ranked-results"];
  id v5 = [v2 copy];

  return v5;
}

void sub_100016064(uint64_t a1, void *a2, void *a3, void *a4, double a5)
{
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  id v12 = gLogHandle;
  if (os_log_type_enabled((os_log_t)gLogHandle, OS_LOG_TYPE_DEBUG))
  {
    int v21 = *(_DWORD *)(a1 + 88);
    id v22 = v12;
    int v23 = 67110915;
    int v24 = v21;
    __int16 v25 = 2080;
    id v26 = currentQueueName();
    __int16 v27 = 2048;
    id v28 = [v9 count];
    __int16 v29 = 2113;
    id v30 = v9;
    __int16 v31 = 2048;
    id v32 = [v10 count];
    __int16 v33 = 2112;
    id v34 = v10;
    __int16 v35 = 2048;
    double v36 = a5;
    __int16 v37 = 2112;
    id v38 = v11;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEBUG,  "#%08x [%s] locateLocalCachingServers callback(dnsPublicAddressRanges=[%ld]%{private}@ dnsFavoredServerRanges=[%ld] %@ dnsValidityInterval=%.3f dnsError=%@)",  (uint8_t *)&v23,  0x4Eu);
  }

  if (v11)
  {
    id v13 = gLogHandle;
    if (os_log_type_enabled((os_log_t)gLogHandle, OS_LOG_TYPE_INFO))
    {
      int v14 = *(_DWORD *)(a1 + 88);
      uint64_t v15 = v13;
      id v16 = currentQueueName();
      int v23 = 67109634;
      int v24 = v14;
      __int16 v25 = 2080;
      id v26 = v16;
      __int16 v27 = 2112;
      id v28 = v11;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_INFO,  "#%08x [%s] ignoring DNS error: %@",  (uint8_t *)&v23,  0x1Cu);
    }
  }

  if (a5 == 0.0)
  {
    a5 = 3600.0;
  }

  else if (a5 < 300.0 && ((unint64_t)[*(id *)(a1 + 32) testFlags] & 2) == 0)
  {
    a5 = 300.0;
  }

  if (!v9) {
    id v9 = &__NSArray0__struct;
  }
  if (!v10) {
    id v10 = &__NSArray0__struct;
  }
  [*(id *)(a1 + 32) uncacheDNSPublicAddressRangesAndFavoredServerRangesForNetworkIdentifiers:*(void *)(a1 + 40) tag:*(unsigned int *)(a1 + 88)];
  [*(id *)(a1 + 32) cacheDNSPublicAddressRanges:v9 andFavoredServerRanges:v10 forNetworkIdentifiers:*(void *)(a1 + 40) validityInterval:*(unsigned int *)(a1 + 88) tag:a5];
  [*(id *)(a1 + 32) saveDiskCacheWithTag:*(unsigned int *)(a1 + 88)];
  if ([v9 count]) {
    [*(id *)(a1 + 48) addObject:v9];
  }
  if ([v10 count]) {
    [*(id *)(a1 + 56) addObject:v10];
  }
  uint64_t v18 = *(void *)(a1 + 64);
  uint64_t v17 = *(void *)(a1 + 72);
  uint64_t v19 = (*(uint64_t (**)(void))(*(void *)(a1 + 80) + 16LL))();
  int v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
  (*(void (**)(uint64_t, uint64_t, void *))(v17 + 16))(v17, v18, v20);
}

void sub_1000165AC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
}

void sub_1000165D4(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v12 = a2;
  id v7 = a3;
  if (([v12 isEqualToString:@"query-parameters"] & 1) != 0
    || [v12 isEqualToString:@"sc"])
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) objectForKey:v12]);
    if (!v8) {
      goto LABEL_6;
    }
  }

  else
  {
    if ([v12 isEqualToString:@"sizeHint"])
    {
      uint64_t v9 = (uint64_t)[v7 longLongValue];
      uint64_t v10 = objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) objectForKey:@"cache-size"]);
      id v8 = (void *)v10;
      if (v10)
      {
        if ((objc_opt_respondsToSelector(v10, "longLongValue") & 1) != 0)
        {
          uint64_t v11 = (uint64_t)[v8 longLongValue];
          if (v9 >= 1 && v11 >= 1 && v9 > v11) {
            goto LABEL_5;
          }
        }
      }

      goto LABEL_6;
    }

    id v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) objectForKey:v12]);
    if (!v8) {
      goto LABEL_5;
    }
  }

  if (([v7 isEqual:v8] & 1) == 0)
  {
LABEL_5:
    *(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = 0;
    *a4 = 1;
  }

LABEL_6:
}

int64_t sub_100016CFC(id a1, NSDictionary *a2, NSDictionary *a3)
{
  uint64_t v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKey:](a2, "objectForKey:", @"rank"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKey:](v4, "objectForKey:", @"rank"));

  id v7 = [v5 compare:v6];
  return (int64_t)v7;
}

uint64_t sub_100017DE8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_100017DFC(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  _DWORD v13[2] = sub_100017FA0;
  v13[3] = &unk_1000311C0;
  id v14 = a4;
  int v28 = *(_DWORD *)(a1 + 128);
  uint64_t v9 = *(dispatch_queue_s **)(a1 + 32);
  id v15 = *(id *)(a1 + 40);
  id v16 = v8;
  id v17 = *(id *)(a1 + 48);
  id v18 = v7;
  __int128 v19 = *(_OWORD *)(a1 + 56);
  id v20 = *(id *)(a1 + 72);
  id v21 = *(id *)(a1 + 80);
  id v22 = *(id *)(a1 + 88);
  id v23 = *(id *)(a1 + 96);
  id v27 = *(id *)(a1 + 120);
  id v24 = *(id *)(a1 + 104);
  id v25 = *(id *)(a1 + 32);
  id v26 = *(id *)(a1 + 112);
  id v10 = v7;
  id v11 = v8;
  id v12 = v14;
  dispatch_async(v9, v13);
}

void sub_100017FA0(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    NSErrorDomain v2 = gLogHandle;
    uint64_t v3 = 0LL;
    if (!os_log_type_enabled((os_log_t)gLogHandle, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_32;
    }
    int v4 = *(_DWORD *)(a1 + 152);
    id v5 = v2;
    id v6 = currentQueueName();
    id v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) absoluteString]);
    id v8 = *(void **)(a1 + 32);
    *(_DWORD *)buf = 67109890;
    int v81 = v4;
    __int16 v82 = 2080;
    __int128 v83 = v6;
    __int16 v84 = 2112;
    v85 = v7;
    __int16 v86 = 2112;
    id v87 = v8;
    uint64_t v9 = "#%08x [%s] Error sending %@: %@";
    goto LABEL_4;
  }

  uint64_t v10 = *(void *)(a1 + 48);
  uint64_t v11 = objc_opt_class(&OBJC_CLASS___NSHTTPURLResponse);
  if ((objc_opt_isKindOfClass(v10, v11) & 1) == 0)
  {
    if (*(void *)(a1 + 88)) {
      goto LABEL_18;
    }
    __int16 v35 = gLogHandle;
    uint64_t v3 = 0LL;
    if (os_log_type_enabled((os_log_t)gLogHandle, OS_LOG_TYPE_DEFAULT))
    {
      int v36 = *(_DWORD *)(a1 + 152);
      id v5 = v35;
      __int16 v37 = currentQueueName();
      id v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) absoluteString]);
      id v38 = *(void **)(a1 + 48);
      *(_DWORD *)buf = 67109890;
      int v81 = v36;
      __int16 v82 = 2080;
      __int128 v83 = v37;
      __int16 v84 = 2112;
      v85 = v7;
      __int16 v86 = 2112;
      id v87 = v38;
      uint64_t v9 = "#%08x [%s] Invalid response from %@: %@";
LABEL_4:
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, v9, buf, 0x26u);

LABEL_18:
      uint64_t v3 = 0LL;
    }

LABEL_32:
    int v51 = *(void **)(a1 + 72);
    if ((v3 & 1) != 0 || *(void *)(a1 + 88))
    {
      id v52 = v51;
    }

    else
    {
      id v52 = [v51 mutableCopy];
      [v52 setObject:&off_100033620 forKeyedSubscript:@"failureCount"];
    }

    v78[0] = @"server";
    v78[1] = @"lastSaved";
    v79[0] = v52;
    id v53 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate distantPast](&OBJC_CLASS___NSDate, "distantPast"));
    v79[1] = v53;
    id v27 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v79,  v78,  2LL));

    goto LABEL_37;
  }

  id v12 = *(id *)(a1 + 48);
  if ([v12 statusCode] != (id)200)
  {
    id v28 = [v12 statusCode];
    __int16 v29 = gLogHandle;
    BOOL v30 = os_log_type_enabled((os_log_t)gLogHandle, OS_LOG_TYPE_INFO);
    if (v28 != (id)404)
    {
      if (!v30)
      {
LABEL_30:
        uint64_t v3 = 0LL;
        goto LABEL_31;
      }

      int v39 = *(_DWORD *)(a1 + 152);
      __int16 v40 = v29;
      id v41 = currentQueueName();
      __int16 v42 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) absoluteString]);
      *(_DWORD *)buf = 67109890;
      int v81 = v39;
      __int16 v82 = 2080;
      __int128 v83 = v41;
      __int16 v84 = 2112;
      v85 = v42;
      __int16 v86 = 1024;
      LODWORD(v87) = [v12 statusCode];
      double v43 = "#%08x [%s] Error response from %@: %d";
      __int16 v44 = v40;
      os_log_type_t v45 = OS_LOG_TYPE_INFO;
      uint32_t v46 = 34;
LABEL_29:
      _os_log_impl((void *)&_mh_execute_header, v44, v45, v43, buf, v46);

      goto LABEL_30;
    }

    if (v30)
    {
      int v31 = *(_DWORD *)(a1 + 152);
      id v32 = v29;
      __int16 v33 = currentQueueName();
      id v34 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) absoluteString]);
      *(_DWORD *)buf = 67109634;
      int v81 = v31;
      __int16 v82 = 2080;
      __int128 v83 = v33;
      __int16 v84 = 2112;
      v85 = v34;
      uint64_t v3 = 1LL;
      _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_INFO, "#%08x [%s] No affinity from %@", buf, 0x1Cu);

      goto LABEL_31;
    }

LABEL_33:
  int v36 = *(void **)(a1 + 64);
  if (v36) {
    dispatch_async(*(dispatch_queue_t *)(a1 + 56), v36);
  }
}

void sub_1000187F4(uint64_t a1)
{
  NSErrorDomain v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  id v3 = *(id *)(a1 + 32);
  id v4 = [v3 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v19;
    do
    {
      id v7 = 0LL;
      do
      {
        if (*(void *)v19 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v18 + 1) + 8 * (void)v7) objectForKey:@"server"]);
        [v2 addObject:v8];

        id v7 = (char *)v7 + 1;
      }

      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }

    while (v5);
  }

  uint64_t v9 = *(dispatch_queue_s **)(a1 + 40);
  id v12 = _NSConcreteStackBlock;
  uint64_t v13 = 3221225472LL;
  uint64_t v14 = sub_100018ACC;
  id v15 = &unk_100030FF8;
  id v10 = *(id *)(a1 + 56);
  id v16 = v2;
  id v17 = v10;
  id v11 = v2;
  dispatch_async(v9, &v12);
  objc_msgSend(*(id *)(a1 + 48), "invalidateAndCancel", v12, v13, v14, v15);
}

int64_t sub_1000189A4(id a1, NSDictionary *a2, NSDictionary *a3)
{
  id v4 = a2;
  id v5 = a3;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKey:](v4, "objectForKey:", @"lastSaved"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKey:](v5, "objectForKey:", @"lastSaved"));
  int64_t v8 = (int64_t)[v7 compare:v6];
  if (!v8)
  {
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](v4, "objectForKeyedSubscript:", @"server"));
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:@"favored"]);
    unsigned int v11 = [v10 BOOLValue];

    id v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](v5, "objectForKeyedSubscript:", @"server"));
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:@"favored"]);
    unsigned int v14 = [v13 BOOLValue];

    if (v11) {
      int64_t v8 = v14 - 1LL;
    }
    else {
      int64_t v8 = v14;
    }
  }

  return v8;
}

uint64_t sub_100018ACC(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, uint64_t))(*(void *)(a1 + 40) + 16LL))( *(void *)(a1 + 40),  *(void *)(a1 + 32),  1LL);
}

uint64_t sub_100018AE0(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_100018AF8(uint64_t a1)
{
  if (*(_BYTE *)(a1 + 68))
  {
    NSErrorDomain v2 = NSURLErrorDomain;
    uint64_t v3 = *(unsigned int *)(a1 + 64);
    id v4 = @"simulated timeout";
    uint64_t v5 = -1001LL;
LABEL_5:
    id TaggedError = createTaggedError(v2, v5, v4, v3);
    id v7 = (void *)objc_claimAutoreleasedReturnValue(TaggedError);
    id v8 = 0LL;
    uint64_t v9 = 0LL;
    goto LABEL_6;
  }

  if (*(_BYTE *)(a1 + 69))
  {
    NSErrorDomain v2 = NSURLErrorDomain;
    uint64_t v3 = *(unsigned int *)(a1 + 64);
    id v4 = @"simulated error";
    uint64_t v5 = -1011LL;
    goto LABEL_5;
  }

  uint64_t v10 = *(void *)(a1 + 32);
  if (v10) {
    id v14 = (id)objc_claimAutoreleasedReturnValue( +[NSPropertyListSerialization dataWithPropertyList:format:options:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "dataWithPropertyList:format:options:error:",  v10,  100LL,  0LL,  0LL));
  }
  else {
    id v14 = 0LL;
  }
  unsigned int v11 = objc_alloc(&OBJC_CLASS___NSHTTPURLResponse);
  if (*(void *)(a1 + 56)) {
    uint64_t v12 = *(void *)(a1 + 56);
  }
  else {
    uint64_t v12 = 404LL;
  }
  uint64_t v9 = -[NSHTTPURLResponse initWithURL:statusCode:HTTPVersion:headerFields:]( v11,  "initWithURL:statusCode:HTTPVersion:headerFields:",  *(void *)(a1 + 40),  v12,  @"HTTP/1.1",  0LL);
  id v7 = 0LL;
  id v8 = v14;
LABEL_6:
  id v13 = v8;
  (*(void (**)(void))(*(void *)(a1 + 48) + 16LL))();
}

void sub_100019974(uint64_t a1)
{
  if (*(_BYTE *)(a1 + 84))
  {
    uint64_t v2 = objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) lastLocateDate]);
    if (!v2
      || (uint64_t v3 = (void *)v2,
          id v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) lastLocateDate]),
          [v4 timeIntervalSinceNow],
          double v6 = v5,
          v4,
          v3,
          v6 <= -10.0))
    {
      char v21 = 1;
      uint64_t v20 = 1LL;
      goto LABEL_14;
    }

    id v7 = gLogHandle;
    if (os_log_type_enabled((os_log_t)gLogHandle, OS_LOG_TYPE_INFO))
    {
      int v8 = *(_DWORD *)(a1 + 80);
      uint64_t v9 = v7;
      uint64_t v10 = currentQueueName();
      unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) lastLocateDate]);
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeInterval:sinceDate:]( &OBJC_CLASS___NSDate,  "dateWithTimeInterval:sinceDate:",  v11,  10.0));
      *(_DWORD *)buf = 67109634;
      *(_DWORD *)&uint8_t buf[4] = v8;
      __int16 v57 = 2080;
      id v58 = v10;
      __int16 v59 = 2112;
      id v60 = v12;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_INFO,  "#%08x [%s] ignoring forceMiss so soon after locate; next allowed %@",
        buf,
        0x1Cu);
    }
  }

  char v55 = 0;
  *(void *)buf = 0LL;
  id v13 = *(void **)(a1 + 32);
  uint64_t v14 = *(void *)(a1 + 40);
  uint64_t v15 = *(void *)(a1 + 48);
  __int128 v54 = 0uLL;
  LODWORD(v36) = *(_DWORD *)(a1 + 80);
  unsigned int v16 = [v13 probeCacheWithLabel:@"early" capabilities:v14 affinityID:v15 hitServers:(char *)&v54 + 8 hitServersAreSorted:&v55 hitOtherServers:&v54 hitVa lidityInterval:buf tag:v36];
  id v17 = *((id *)&v54 + 1);
  id v18 = (id)v54;
  __int128 v19 = v18;
  if (v16 == 2)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100019DA4;
    block[3] = &unk_100031238;
    int v22 = *(dispatch_queue_s **)(a1 + 56);
    id v23 = *(id *)(a1 + 64);
    id v50 = v19;
    id v51 = v23;
    char v53 = v55;
    id v49 = v17;
    uint64_t v52 = *(void *)buf;
    id v24 = v19;
    id v25 = v17;
    dispatch_async(v22, block);

    return;
  }

  if (v16 == 1)
  {
    if (!*(void *)(a1 + 48)) {
      sub_1000211A0();
    }
    uint64_t v20 = 0LL;
  }

  else
  {
    uint64_t v20 = 1LL;
  }

  char v21 = 0;
LABEL_14:
  if (*(_BYTE *)(a1 + 85))
  {
    uint64_t v26 = gLogHandle;
    if (os_log_type_enabled((os_log_t)gLogHandle, OS_LOG_TYPE_DEFAULT))
    {
      int v27 = *(_DWORD *)(a1 + 80);
      id v28 = v26;
      __int16 v29 = currentQueueName();
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)&uint8_t buf[4] = v27;
      __int16 v57 = 2080;
      id v58 = v29;
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "#%08x [%s] quick miss", buf, 0x12u);
    }

    v45[0] = _NSConcreteStackBlock;
    v45[1] = 3221225472LL;
    v45[2] = sub_100019DC4;
    v45[3] = &unk_100031260;
    BOOL v30 = *(dispatch_queue_s **)(a1 + 56);
    id v46 = *(id *)(a1 + 64);
    int v47 = *(_DWORD *)(a1 + 80);
    dispatch_async(v30, v45);
    if (*(_BYTE *)(a1 + 86))
    {
      int v31 = *(void **)(a1 + 32);
      [v31 locateTimeout];
      objc_msgSend( v31,  "relocateCachingServersWithTimeout:capabilities:affinityID:forceRefresh:tag:",  *(void *)(a1 + 40),  *(void *)(a1 + 48),  v20,  *(unsigned int *)(a1 + 80));
    }

    id v32 = v46;
  }

  else
  {
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
    id v34 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
    v37[0] = _NSConcreteStackBlock;
    v37[2] = sub_100019E3C;
    v37[3] = &unk_100031288;
    __int16 v35 = *(void **)(a1 + 40);
    void v37[4] = *(void *)(a1 + 32);
    v37[1] = 3221225472LL;
    uint64_t v41 = *(void *)(a1 + 72);
    id v38 = v35;
    id v39 = *(id *)(a1 + 48);
    char v43 = v21;
    char v44 = v21;
    id v40 = *(id *)(a1 + 64);
    int v42 = *(_DWORD *)(a1 + 80);
    dispatch_async(v34, v37);

    id v32 = v38;
  }
}

uint64_t sub_100019DA4(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void, void, void, double))(*(void *)(a1 + 48) + 16LL))( *(void *)(a1 + 48),  *(void *)(a1 + 32),  *(unsigned __int8 *)(a1 + 64),  *(void *)(a1 + 40),  0LL,  *(double *)(a1 + 56));
}

void sub_100019DC4(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id TaggedError = createTaggedError(NSPOSIXErrorDomain, 60LL, @"quick miss requested", *(unsigned int *)(a1 + 40));
  id v3 = (id)objc_claimAutoreleasedReturnValue(TaggedError);
  (*(void (**)(uint64_t, void, void, void, id, double))(v1 + 16))(v1, 0LL, 0LL, 0LL, v3, 300.0);
}

id sub_100019E3C(uint64_t a1)
{
  return [*(id *)(a1 + 32) slowcateCachingServerWithTimeout:*(void *)(a1 + 40) capabilities:*(void *)(a1 + 48) affinityID:*(unsigned __int8 *)(a1 + 76) forceRefresh:*(unsigned __int8 *)(a1 + 77) forceDNSRefresh:*(void *)(a1 + 56) callback:*(unsigned int *)(a1 + 72) tag:*(double *)(a1 + 64)];
}

void sub_10001A084( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
}

id sub_10001A0A4(uint64_t a1)
{
  id result = [*(id *)(a1 + 32) cacheRefreshInProgress];
  if ((result & 1) == 0)
  {
    id result = [*(id *)(a1 + 32) setCacheRefreshInProgress:1];
    *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 1;
  }

  return result;
}

id sub_10001A0E8(uint64_t a1)
{
  uint64_t v2 = gLogHandle;
  if (os_log_type_enabled((os_log_t)gLogHandle, OS_LOG_TYPE_INFO))
  {
    int v3 = *(_DWORD *)(a1 + 56);
    id v4 = v2;
    *(_DWORD *)buf = 67109378;
    int v13 = v3;
    __int16 v14 = 2080;
    uint64_t v15 = currentQueueName();
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_INFO,  "#%08x [%s] starting proactive cache refresh",  buf,  0x12u);
  }

  double v5 = *(void **)(a1 + 32);
  [v5 locateTimeout];
  uint64_t v6 = *(void *)(a1 + 40);
  uint64_t v7 = *(void *)(a1 + 48);
  uint64_t v8 = *(unsigned __int8 *)(a1 + 60);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_10001A210;
  v10[3] = &unk_100031300;
  int v11 = *(_DWORD *)(a1 + 56);
  v10[4] = *(void *)(a1 + 32);
  return objc_msgSend( v5,  "slowcateCachingServerWithTimeout:capabilities:affinityID:forceRefresh:forceDNSRefresh:callback:tag:",  v6,  v7,  v8,  0,  v10);
}

void sub_10001A210(uint64_t a1, void *a2, int a3, void *a4, void *a5, double a6)
{
  id v11 = a5;
  uint64_t v12 = gLogHandle;
  if (os_log_type_enabled((os_log_t)gLogHandle, OS_LOG_TYPE_INFO))
  {
    int v13 = *(_DWORD *)(a1 + 40);
    __int16 v14 = v12;
    id v15 = a4;
    id v16 = a2;
    id v17 = currentQueueName();
    id v18 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) redactObject:v16]);

    __int128 v19 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) redactObject:v15]);
    *(_DWORD *)buf = 67110658;
    int v23 = v13;
    __int16 v24 = 2080;
    id v25 = v17;
    __int16 v26 = 2112;
    int v27 = v18;
    __int16 v28 = 1024;
    int v29 = a3;
    __int16 v30 = 2112;
    int v31 = v19;
    __int16 v32 = 2048;
    double v33 = a6;
    __int16 v34 = 2112;
    id v35 = v11;
    _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_INFO,  "#%08x [%s] cache refresh finished (servers=%@, sorted=%{BOOL}d, other=%@, validityInterval=%.3f, error=%@)",  buf,  0x40u);
  }

  uint64_t v20 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) cacheRefreshQueue]);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10001A3E4;
  block[3] = &unk_100030B58;
  void block[4] = *(void *)(a1 + 32);
  dispatch_sync(v20, block);
}

id sub_10001A3E4(uint64_t a1)
{
  return [*(id *)(a1 + 32) setCacheRefreshInProgress:0];
}

void sub_10001A7C0(uint64_t a1, void *a2, int a3, void *a4, void *a5, double a6)
{
  id v11 = a2;
  id v12 = a4;
  id v13 = a5;
  __int16 v14 = gLogHandle;
  if (os_log_type_enabled((os_log_t)gLogHandle, OS_LOG_TYPE_DEBUG))
  {
    int v16 = *(_DWORD *)(a1 + 48);
    id v17 = v14;
    id v18 = currentQueueName();
    __int128 v19 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) redactObject:v11]);
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) redactObject:v12]);
    v21[0] = 67110658;
    v21[1] = v16;
    __int16 v22 = 2080;
    int v23 = v18;
    __int16 v24 = 2112;
    id v25 = v19;
    __int16 v26 = 1024;
    int v27 = a3;
    __int16 v28 = 2112;
    int v29 = v20;
    __int16 v30 = 2048;
    double v31 = a6;
    __int16 v32 = 2112;
    id v33 = v13;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEBUG,  "#%08x [%s] slowcateCachingServer finishSingleLocateAndCallBackWithServers(servers=%@, sorted=%{BOOL}d, other=%@, v alidityInterval=%.3f, error=%@)",  (uint8_t *)v21,  0x40u);
  }

  [*(id *)(a1 + 32) setSingleLocateTag:0];
  id v15 = (dispatch_semaphore_s *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) singleLocate]);
  dispatch_semaphore_signal(v15);

  (*(void (**)(double))(*(void *)(a1 + 40) + 16LL))(a6);
}

void sub_10001A9A4(uint64_t a1)
{
  if (*(_BYTE *)(a1 + 76)) {
    goto LABEL_2;
  }
  char v44 = 0;
  id v42 = 0LL;
  double v43 = 0.0;
  uint64_t v7 = *(void **)(a1 + 32);
  uint64_t v8 = *(void *)(a1 + 40);
  uint64_t v9 = *(void *)(a1 + 48);
  id v41 = 0LL;
  LODWORD(v22) = *(_DWORD *)(a1 + 72);
  unsigned int v10 = [v7 probeCacheWithLabel:@"standard" capabilities:v8 affinityID:v9 hitServers:&v42 hitServersAreSorted:&v44 hitOtherServers:&v41 hitVa lidityInterval:&v43 tag:v22];
  id v11 = v42;
  id v12 = v41;
  id v13 = v12;
  if (v10 == 2)
  {
    (*(void (**)(double))(*(void *)(a1 + 64) + 16LL))(v43);
LABEL_13:

    goto LABEL_17;
  }

  if (v10 == 1)
  {
    uint64_t v14 = *(void *)(a1 + 48);
    if (!v14) {
      sub_100021268();
    }
    id v15 = *(void **)(a1 + 32);
    [*(id *)(a1 + 56) timeIntervalSinceNow];
    double v17 = v16;
    v35[0] = _NSConcreteStackBlock;
    v35[1] = 3221225472LL;
    v35[2] = sub_10001ACF8;
    v35[3] = &unk_100031350;
    v35[4] = *(void *)(a1 + 32);
    id v36 = *(id *)(a1 + 48);
    int v40 = *(_DWORD *)(a1 + 72);
    id v38 = *(id *)(a1 + 64);
    id v37 = v13;
    double v39 = v43;
    id v18 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) queue]);
    [v15 queryServersFromArray:v11 forReachabilityOrAffinityID:v14 withTimeout:v35 callbackWithServers:v18 callbackQueue:*(unsigned int *)(a1 + 72) tag:v17];

    goto LABEL_13;
  }

LABEL_2:
  id v2 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) localAddresses]);
  int v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) gatewayIdentifiers]);
  if (!v2)
  {
    if (*(_BYTE *)(a1 + 76))
    {
      id v4 = *(void **)(a1 + 32);
      id v33 = v3;
      id v34 = 0LL;
      unsigned __int8 v5 = [v4 makeLocalAddresses:&v34 andGatewayIdentifiers:&v33 tag:*(unsigned int *)(a1 + 72)];
      id v2 = v34;
      id v6 = v33;

      if ((v5 & 1) == 0)
      {

        id v2 = 0LL;
        id v6 = 0LL;
      }

      [*(id *)(a1 + 32) setLocalAddresses:v2];
      [*(id *)(a1 + 32) setGatewayIdentifiers:v6];
      int v3 = v6;
    }

    else
    {
      id v2 = 0LL;
    }
  }

  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472LL;
  v23[2] = sub_10001AD60;
  void v23[3] = &unk_1000313C8;
  int v31 = *(_DWORD *)(a1 + 72);
  __int128 v19 = *(void **)(a1 + 40);
  v23[4] = *(void *)(a1 + 32);
  id v24 = v19;
  id v30 = *(id *)(a1 + 64);
  id v25 = v2;
  id v26 = v3;
  id v27 = *(id *)(a1 + 48);
  id v28 = *(id *)(a1 + 56);
  id v29 = 0LL;
  char v32 = *(_BYTE *)(a1 + 77);
  id v20 = v3;
  id v11 = v2;
  char v21 = objc_retainBlock(v23);
  ((void (*)(void *, void, void, void, void, double))v21[2])(v21, 0LL, 0LL, 0LL, 0LL, 0.0);

LABEL_17:
}

void sub_10001ACF8(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 count]) {
    [*(id *)(a1 + 32) cacheServers:v3 forAffinityID:*(void *)(a1 + 40) tag:*(unsigned int *)(a1 + 72)];
  }
  (*(void (**)(double))(*(void *)(a1 + 56) + 16LL))(*(double *)(a1 + 64));
}

void sub_10001AD60(uint64_t a1, void *a2, int a3, void *a4, void *a5, double a6)
{
  id v11 = a2;
  id v12 = a4;
  id v13 = a5;
  uint64_t v14 = gLogHandle;
  if (os_log_type_enabled((os_log_t)gLogHandle, OS_LOG_TYPE_DEBUG))
  {
    int v53 = *(_DWORD *)(a1 + 96);
    __int128 v54 = v14;
    char v55 = currentQueueName();
    id v56 = v13;
    __int16 v57 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) redactObject:v11]);
    id v62 = v12;
    id v58 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) redactObject:v12]);
    *(_DWORD *)buf = 67110658;
    int v71 = v53;
    __int16 v72 = 2080;
    id v73 = v55;
    __int16 v74 = 2112;
    id v75 = v57;
    __int16 v76 = 1024;
    int v77 = a3;
    __int16 v78 = 2112;
    uint64_t v79 = v58;
    __int16 v80 = 2048;
    double v81 = a6;
    __int16 v82 = 2112;
    id v83 = v56;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v54,  OS_LOG_TYPE_DEBUG,  "#%08x [%s] slowcateCachingServer callback(localhostServers=%@, sorted=%{BOOL}d, other=%@, localhostValidityInterva l=%.3f, localhostError=%@)",  buf,  0x40u);

    id v12 = v62;
    id v13 = v56;
  }

  if ([v11 count])
  {
    if (a6 == 0.0)
    {
      a6 = 1200.0;
    }

    else if (a6 < 300.0 && ((unint64_t)[*(id *)(a1 + 32) testFlags] & 4) == 0)
    {
      a6 = 300.0;
    }

    [*(id *)(a1 + 32) uncacheAllServersWithTag:*(unsigned int *)(a1 + 96)];
    __int128 v19 = *(void **)(a1 + 32);
    id v20 = (void *)objc_claimAutoreleasedReturnValue([v19 servers:v11 byAppendingServers:v12]);
    char v21 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) localhostAddresses]);
    [v19 cacheServers:v20 forNetworkIdentifiers:v21 validityInterval:*(unsigned int *)(a1 + 96) tag:a6];

    [*(id *)(a1 + 32) uncacheAllRecentlySeenWithTag:*(unsigned int *)(a1 + 96)];
    uint64_t v22 = *(void **)(a1 + 32);
    int v23 = (void *)objc_claimAutoreleasedReturnValue([v22 localhostAddresses]);
    [v22 cacheRecentlySeen:1 forNetworkIdentifiers:v23 validityInterval:*(unsigned int *)(a1 + 96) tag:604800.0];

    [*(id *)(a1 + 32) saveDiskCacheWithTag:*(unsigned int *)(a1 + 96)];
    [*(id *)(a1 + 32) uncacheAllAffinitiesWithTag:*(unsigned int *)(a1 + 96)];
    id v18 = (void *)objc_claimAutoreleasedReturnValue( [*(id *)(a1 + 32) serversFromArray:v11 withCapabilities:*(void *)(a1 + 40) tag:*(unsigned int *)(a1 + 96)]);
    if ([v18 count])
    {
      id v24 = gLogHandle;
      if (os_log_type_enabled((os_log_t)gLogHandle, OS_LOG_TYPE_DEFAULT))
      {
        int v25 = *(_DWORD *)(a1 + 96);
        id v26 = v24;
        id v27 = currentQueueName();
        id v28 = v13;
        id v29 = (void *)objc_claimAutoreleasedReturnValue( [*(id *)(a1 + 32) describeCapableServers:v18 fromAvailableServers:v11 withOtherServers:v12]);
        *(_DWORD *)buf = 67109634;
        int v71 = v25;
        __int16 v72 = 2080;
        id v73 = v27;
        __int16 v74 = 2112;
        id v75 = v29;
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "#%08x [%s] found %@", buf, 0x1Cu);

        id v13 = v28;
      }

      (*(void (**)(double))(*(void *)(a1 + 88) + 16LL))(a6);

      goto LABEL_25;
    }
  }

  else
  {
    id v15 = *(void **)(a1 + 32);
    double v16 = (void *)objc_claimAutoreleasedReturnValue([v15 localhostAddresses]);
    [v15 uncacheServersForNetworkIdentifiers:v16 tag:*(unsigned int *)(a1 + 96)];

    double v17 = *(void **)(a1 + 32);
    id v18 = (void *)objc_claimAutoreleasedReturnValue([v17 localhostAddresses]);
    [v17 cacheNotRecentlySeenForNetworkIdentifiers:v18 tag:*(unsigned int *)(a1 + 96)];
  }

  if (*(void *)(a1 + 48))
  {
    id v30 = gLogHandle;
    if (os_log_type_enabled((os_log_t)gLogHandle, OS_LOG_TYPE_INFO))
    {
      int v31 = *(_DWORD *)(a1 + 96);
      char v32 = v30;
      id v33 = currentQueueName();
      *(_DWORD *)buf = 67109378;
      int v71 = v31;
      __int16 v72 = 2080;
      id v73 = v33;
      _os_log_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_INFO,  "#%08x [%s] checking for caching servers on local network",  buf,  0x12u);
    }

    v63[0] = _NSConcreteStackBlock;
    v63[1] = 3221225472LL;
    v63[2] = sub_10001B3EC;
    v63[3] = &unk_1000313A0;
    int v69 = *(_DWORD *)(a1 + 96);
    v63[4] = *(void *)(a1 + 32);
    id v64 = *(id *)(a1 + 56);
    id v65 = *(id *)(a1 + 40);
    id v66 = *(id *)(a1 + 64);
    id v68 = *(id *)(a1 + 88);
    id v67 = *(id *)(a1 + 72);
    id v34 = objc_retainBlock(v63);
    id v35 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) locateTetheredCachingServersWithTag:*(unsigned int *)(a1 + 96)]);
    if ([v35 count])
    {
      ((void (*)(void *, void *, void, void, void, double))v34[2])(v34, v35, 0LL, 0LL, 0LL, 3600.0);
    }

    else
    {
      id v60 = *(void **)(a1 + 32);
      [*(id *)(a1 + 72) timeIntervalSinceNow];
      double v43 = v42;
      id v61 = v11;
      id v44 = v13;
      id v45 = v12;
      uint64_t v46 = *(void *)(a1 + 48);
      uint64_t v47 = *(void *)(a1 + 56);
      uint64_t v48 = *(void *)(a1 + 80);
      uint64_t v49 = *(unsigned __int8 *)(a1 + 100);
      id v50 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) queue]);
      LODWORD(v59) = *(_DWORD *)(a1 + 96);
      uint64_t v51 = v46;
      id v13 = v44;
      id v11 = v61;
      uint64_t v52 = v47;
      id v12 = v45;
      [v60 locateLocalCachingServersWithTimeout:v51 localAddresses:v52 gatewayIdentifiers:v48 configurationProfiles:v49 forceDNSRefresh:v34 cal lback:v50 callbackQueue:v43 tag:v59];
    }
  }

  else
  {
    id v36 = *(void **)(a1 + 32);
    id v37 = (void *)objc_claimAutoreleasedReturnValue([v36 localhostAddresses]);
    [v36 cacheServers:&__NSArray0__struct forNetworkIdentifiers:v37 validityInterval:*(unsigned int *)(a1 + 96) tag:5.0];

    [*(id *)(a1 + 32) saveDiskCacheWithTag:*(unsigned int *)(a1 + 96)];
    [*(id *)(a1 + 32) uncacheAllAffinitiesWithTag:*(unsigned int *)(a1 + 96)];
    id v38 = gLogHandle;
    if (os_log_type_enabled((os_log_t)gLogHandle, OS_LOG_TYPE_DEFAULT))
    {
      int v39 = *(_DWORD *)(a1 + 96);
      int v40 = v38;
      id v41 = currentQueueName();
      *(_DWORD *)buf = 67109378;
      int v71 = v39;
      __int16 v72 = 2080;
      id v73 = v41;
      _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "#%08x [%s] no local network", buf, 0x12u);
    }

    (*(void (**)(double))(*(void *)(a1 + 88) + 16LL))(3600.0);
  }

LABEL_25:
}

void sub_10001B3EC(uint64_t a1, void *a2, int a3, void *a4, void *a5, double a6)
{
  id v11 = a2;
  id v12 = a4;
  id v13 = a5;
  uint64_t v14 = gLogHandle;
  if (os_log_type_enabled((os_log_t)gLogHandle, OS_LOG_TYPE_DEBUG))
  {
    int v35 = *(_DWORD *)(a1 + 80);
    int v31 = v14;
    char v32 = currentQueueName();
    id v33 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) redactObject:v11]);
    id v34 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) redactObject:v12]);
    *(_DWORD *)buf = 67110658;
    int v45 = v35;
    __int16 v46 = 2080;
    uint64_t v47 = v32;
    __int16 v48 = 2112;
    uint64_t v49 = v33;
    __int16 v50 = 1024;
    int v51 = a3;
    __int16 v52 = 2112;
    int v53 = v34;
    __int16 v54 = 2048;
    double v55 = a6;
    __int16 v56 = 2112;
    id v57 = v13;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_DEBUG,  "#%08x [%s] slowcateCachingServer callback(localServers=%@, sorted=%{BOOL}d, other=%@, localValidityInterval=%.3f, localError=%@)",  buf,  0x40u);
  }

  if (a6 == 0.0)
  {
    a6 = 3600.0;
  }

  else if (a6 < 300.0 && ((unint64_t)[*(id *)(a1 + 32) testFlags] & 4) == 0)
  {
    a6 = 300.0;
  }

  if (v11 && !v13)
  {
    if ([v11 count])
    {
      [*(id *)(a1 + 32) uncacheServersForNetworkIdentifiers:*(void *)(a1 + 40) tag:*(unsigned int *)(a1 + 80)];
      id v15 = *(void **)(a1 + 32);
      double v16 = (void *)objc_claimAutoreleasedReturnValue([v15 servers:v11 byAppendingServers:v12]);
      [v15 cacheServers:v16 forNetworkIdentifiers:*(void *)(a1 + 40) validityInterval:*(unsigned int *)(a1 + 80) tag:a6];

      [*(id *)(a1 + 32) uncacheRecentlySeenForNetworkIdentifiers:*(void *)(a1 + 40) tag:*(unsigned int *)(a1 + 80)];
      [*(id *)(a1 + 32) cacheRecentlySeen:1 forNetworkIdentifiers:*(void *)(a1 + 40) validityInterval:*(unsigned int *)(a1 + 80) tag:604800.0];
      [*(id *)(a1 + 32) saveDiskCacheWithTag:*(unsigned int *)(a1 + 80)];
      double v17 = (void *)objc_claimAutoreleasedReturnValue( [*(id *)(a1 + 32) serversFromArray:v11 withCapabilities:*(void *)(a1 + 48) tag:*(unsigned int *)(a1 + 80)]);
      v37[0] = _NSConcreteStackBlock;
      v37[1] = 3221225472LL;
      v37[2] = sub_10001B898;
      v37[3] = &unk_100031378;
      int v43 = *(_DWORD *)(a1 + 80);
      void v37[4] = *(void *)(a1 + 32);
      id v38 = v17;
      id v39 = v12;
      id v40 = *(id *)(a1 + 56);
      id v41 = *(id *)(a1 + 72);
      double v42 = a6;
      id v18 = v17;
      __int128 v19 = objc_retainBlock(v37);
      id v20 = *(void **)(a1 + 32);
      uint64_t v21 = *(void *)(a1 + 56);
      [*(id *)(a1 + 64) timeIntervalSinceNow];
      double v23 = v22;
      id v24 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) queue]);
      [v20 queryServersFromArray:v18 forReachabilityOrAffinityID:v21 withTimeout:v19 callbackWithServers:v24 callbackQueue:*(unsigned int *)(a1 + 80) tag:v23];

      goto LABEL_21;
    }

    goto LABEL_15;
  }

  if (!v13)
  {
LABEL_15:
    id v36 = 0LL;
    [*(id *)(a1 + 32) cachedRecentlySeen:&v36 forNetworkIdentifiers:*(void *)(a1 + 40) validityInterval:0 tag:*(unsigned int *)(a1 + 80)];
    id v25 = v36;

    goto LABEL_18;
  }

  a6 = 3600.0;
LABEL_18:
  [*(id *)(a1 + 32) uncacheServersForNetworkIdentifiers:*(void *)(a1 + 40) tag:*(unsigned int *)(a1 + 80)];
  [*(id *)(a1 + 32) cacheServers:&__NSArray0__struct forNetworkIdentifiers:*(void *)(a1 + 40) validityInterval:*(unsigned int *)(a1 + 80) tag:a6];
  [*(id *)(a1 + 32) cacheNotRecentlySeenForNetworkIdentifiers:*(void *)(a1 + 40) tag:*(unsigned int *)(a1 + 80)];
  [*(id *)(a1 + 32) saveDiskCacheWithTag:*(unsigned int *)(a1 + 80)];
  [*(id *)(a1 + 32) uncacheAllAffinitiesWithTag:*(unsigned int *)(a1 + 80)];
  id v26 = gLogHandle;
  if (os_log_type_enabled((os_log_t)gLogHandle, OS_LOG_TYPE_DEFAULT))
  {
    int v27 = *(_DWORD *)(a1 + 80);
    id v28 = v26;
    id v29 = currentQueueName();
    id v30 = (void *)objc_claimAutoreleasedReturnValue( [*(id *)(a1 + 32) describeCapableServers:0 fromAvailableServers:0 withOtherServers:0]);
    *(_DWORD *)buf = 67109634;
    int v45 = v27;
    __int16 v46 = 2080;
    uint64_t v47 = v29;
    __int16 v48 = 2112;
    uint64_t v49 = v30;
    _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "#%08x [%s] found %@", buf, 0x1Cu);
  }

  (*(void (**)(double))(*(void *)(a1 + 72) + 16LL))(a6);
LABEL_21:
}

void sub_10001B898(uint64_t a1, void *a2, int a3)
{
  id v5 = a2;
  id v6 = gLogHandle;
  if (os_log_type_enabled((os_log_t)gLogHandle, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = *(_DWORD *)(a1 + 80);
    uint64_t v8 = v6;
    uint64_t v9 = currentQueueName();
    unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue( [*(id *)(a1 + 32) describeCapableServers:*(void *)(a1 + 40) fromAvailableServers:v5 withOtherServers:*(void *)(a1 + 48)]);
    v11[0] = 67109890;
    v11[1] = v7;
    __int16 v12 = 2080;
    id v13 = v9;
    __int16 v14 = 2112;
    id v15 = v10;
    __int16 v16 = 1024;
    int v17 = a3;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "#%08x [%s] found %@, sorted=%{BOOL}d",  (uint8_t *)v11,  0x22u);
  }

  if (*(void *)(a1 + 56) && [v5 count]) {
    [*(id *)(a1 + 32) cacheServers:v5 forAffinityID:*(void *)(a1 + 56) tag:*(unsigned int *)(a1 + 80)];
  }
  (*(void (**)(double))(*(void *)(a1 + 64) + 16LL))(*(double *)(a1 + 72));
}

void sub_10001BC5C(uint64_t a1, void *a2, unint64_t a3, _BYTE *a4)
{
  id v10 = a2;
  if (a3 && (objc_msgSend(*(id *)(a1 + 32), "appendString:", @", "), a3 > 0x13))
  {
    [*(id *)(a1 + 32) appendString:@"..."];
    *a4 = 1;
  }

  else
  {
    int v7 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:@"localAddressAndPort"]);
    [*(id *)(a1 + 32) appendString:v7];
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:@"failureCount"]);
    id v9 = [v8 unsignedIntegerValue];
  }
}

void sub_10001C5E4(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  id v25 = 0LL;
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 localhostAddresses]);
  [v2 cachedRecentlySeen:&v25 forNetworkIdentifiers:v3 validityInterval:0 tag:*(unsigned int *)(a1 + 56)];
  id v4 = v25;

  if (v4 && ([v4 BOOLValue] & 1) == 0)
  {
    id v6 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) localAddresses]);
    uint64_t v7 = objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) gatewayIdentifiers]);
    uint64_t v8 = (void *)v7;
    if (v6)
    {
      if (!v7) {
        goto LABEL_12;
      }
    }

    else
    {
      id v9 = *(void **)(a1 + 32);
      id v23 = v8;
      id v24 = 0LL;
      unsigned __int8 v10 = [v9 makeLocalAddresses:&v24 andGatewayIdentifiers:&v23 tag:*(unsigned int *)(a1 + 56)];
      id v6 = v24;
      id v11 = v23;

      if ((v10 & 1) == 0)
      {

        id v6 = 0LL;
        id v11 = 0LL;
      }

      [*(id *)(a1 + 32) setLocalAddresses:v6];
      [*(id *)(a1 + 32) setGatewayIdentifiers:v11];
      uint64_t v8 = v11;
      if (!v11) {
        goto LABEL_12;
      }
    }

    __int16 v12 = *(void **)(a1 + 32);
    id v22 = 0LL;
    [v12 cachedRecentlySeen:&v22 forNetworkIdentifiers:v8 validityInterval:0 tag:*(unsigned int *)(a1 + 56)];
    id v13 = v22;
    id v4 = v13;
    if (v13)
    {
      unsigned __int8 v5 = [v13 BOOLValue];
LABEL_13:

      goto LABEL_14;
    }

uint64_t sub_10001C7D8(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 32) + 16LL))( *(void *)(a1 + 32),  *(unsigned __int8 *)(a1 + 40),  0LL);
}

void sub_10001CA98(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) localhostAddresses]);
  unsigned int v3 = [v2 containsObject:*(void *)(a1 + 40)];

  id v4 = *(void **)(a1 + 32);
  if (v3)
  {
    unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) localhostAddresses]);
    id v44 = 0LL;
    unsigned __int8 v6 = [v4 probeCacheForType:@"localhost" withLabel:@"health-update" networkIdentifiers:v5 hitServers:&v44 hitValidityInterval:0 tag:*(unsigned int *)(a1 + 72)];
    id v7 = v44;

    if ((v6 & 1) == 0) {
      goto LABEL_33;
    }
  }

  else
  {
    id v8 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) localAddresses]);
    id v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) gatewayIdentifiers]);
    if (!v8)
    {
      unsigned __int8 v10 = *(void **)(a1 + 32);
      id v42 = v9;
      id v43 = 0LL;
      unsigned __int8 v11 = [v10 makeLocalAddresses:&v43 andGatewayIdentifiers:&v42 tag:*(unsigned int *)(a1 + 72)];
      id v8 = v43;
      id v12 = v42;

      if ((v11 & 1) == 0)
      {

        id v12 = 0LL;
        id v8 = 0LL;
      }

      [*(id *)(a1 + 32) setLocalAddresses:v8];
      [*(id *)(a1 + 32) setGatewayIdentifiers:v12];
      id v9 = v12;
    }

    id v13 = *(void **)(a1 + 32);
    id v41 = 0LL;
    unsigned int v14 = [v13 probeCacheForType:@"local" withLabel:@"health-update" networkIdentifiers:v9 hitServers:&v41 hitValidityInterval:0 tag:*(unsigned int *)(a1 + 72)];
    id v7 = v41;

    if (!v14) {
      goto LABEL_33;
    }
  }

  __int128 v39 = 0u;
  __int128 v40 = 0u;
  __int128 v37 = 0u;
  __int128 v38 = 0u;
  id v7 = v7;
  id v15 = [v7 countByEnumeratingWithState:&v37 objects:v51 count:16];
  if (v15)
  {
    id v16 = v15;
    uint64_t v17 = *(void *)v38;
    while (2)
    {
      for (i = 0LL; i != v16; i = (char *)i + 1)
      {
        if (*(void *)v38 != v17) {
          objc_enumerationMutation(v7);
        }
        __int128 v19 = *(void **)(*((void *)&v37 + 1) + 8LL * (void)i);
        id v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "objectForKeyedSubscript:", @"localAddressAndPort", (void)v37));
        unsigned int v21 = [v20 isEqualToString:*(void *)(a1 + 48)];

        if (v21)
        {
          id v22 = (void *)objc_claimAutoreleasedReturnValue([v19 objectForKeyedSubscript:@"failureCount"]);
          id v23 = [v22 unsignedIntegerValue];

          if (*(_BYTE *)(a1 + 76))
          {
            if (v23)
            {
              if ((unint64_t)v23 >= 3)
              {
                id v24 = gLogHandle;
                if (os_log_type_enabled((os_log_t)gLogHandle, OS_LOG_TYPE_DEFAULT))
                {
                  int v25 = *(_DWORD *)(a1 + 72);
                  id v26 = v24;
                  int v27 = currentQueueName();
                  uint64_t v28 = *(void *)(a1 + 48);
                  *(_DWORD *)buf = 67109634;
                  int v46 = v25;
                  __int16 v47 = 2080;
                  __int16 v48 = v27;
                  __int16 v49 = 2112;
                  uint64_t v50 = v28;
                  _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEFAULT,  "#%08x [%s] caching server %@ is healthy again",  buf,  0x1Cu);
                }
              }

              [v19 removeObjectForKey:@"failureCount"];
            }
          }

          else if ((unint64_t)v23 <= 2)
          {
            if (*(_BYTE *)(a1 + 77)) {
              unint64_t v29 = 3LL;
            }
            else {
              unint64_t v29 = (unint64_t)v23 + 1;
            }
            if (v29 >= 3)
            {
              id v30 = gLogHandle;
              if (os_log_type_enabled((os_log_t)gLogHandle, OS_LOG_TYPE_DEFAULT))
              {
                int v31 = *(_DWORD *)(a1 + 72);
                char v32 = v30;
                id v33 = currentQueueName();
                uint64_t v34 = *(void *)(a1 + 48);
                *(_DWORD *)buf = 67109634;
                int v46 = v31;
                __int16 v47 = 2080;
                __int16 v48 = v33;
                __int16 v49 = 2112;
                uint64_t v50 = v34;
                _os_log_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_DEFAULT,  "#%08x [%s] caching server %@ is now unhealthy",  buf,  0x1Cu);
              }
            }

            int v35 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  v29));
            [v19 setObject:v35 forKeyedSubscript:@"failureCount"];
          }

          goto LABEL_32;
        }
      }

      id v16 = [v7 countByEnumeratingWithState:&v37 objects:v51 count:16];
      if (v16) {
        continue;
      }
      break;
    }
  }

id sub_10001D238(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) setValue:a3 forHTTPHeaderField:a2];
}

LABEL_19:
            v10[2](v10, 2LL, 0LL);
            goto LABEL_20;
          }
        }

        int v31 = gLogHandle;
        if (os_log_type_enabled((os_log_t)gLogHandle, OS_LOG_TYPE_ERROR))
        {
          id v41 = v31;
          id v44 = currentQueueName();
          id v42 = (void *)objc_claimAutoreleasedReturnValue(-[AssetCacheLocatorService locateURL](self, "locateURL"));
          id v43 = (void *)objc_claimAutoreleasedReturnValue([v42 absoluteString]);
          *(_DWORD *)buf = 67110146;
          __int16 v49 = v11;
          uint64_t v50 = 2080;
          int v51 = v44;
          __int16 v52 = 2112;
          int v53 = v43;
          __int16 v54 = 2112;
          double v55 = v21;
          __int16 v56 = 2112;
          id v57 = log;
          _os_log_error_impl( (void *)&_mh_execute_header,  v41,  OS_LOG_TYPE_ERROR,  "#%08x [%s] LocateURL %@ untrusted: EV=%@ organization=%@",  buf,  0x30u);
        }

        CFRelease(v27);

LABEL_18:
        goto LABEL_19;
      }

      unsigned int v21 = error;
    }

    else
    {
      unsigned int v21 = (CFErrorRef)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSOSStatusErrorDomain,  -25245LL,  0LL));
    }

    int v25 = gLogHandle;
    if (os_log_type_enabled((os_log_t)gLogHandle, OS_LOG_TYPE_ERROR))
    {
      char v32 = v25;
      id v33 = currentQueueName();
      uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue(-[AssetCacheLocatorService locateURL](self, "locateURL"));
      int v35 = (void *)objc_claimAutoreleasedReturnValue([v34 absoluteString]);
      *(_DWORD *)buf = 67109890;
      __int16 v49 = v11;
      uint64_t v50 = 2080;
      int v51 = v33;
      __int16 v52 = 2112;
      int v53 = v35;
      __int16 v54 = 2112;
      double v55 = v21;
      _os_log_error_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_ERROR,  "#%08x [%s] LocateURL %@ untrusted: error=%@",  buf,  0x26u);
    }

    goto LABEL_18;
  }

  v10[2](v10, 2LL, 0LL);
LABEL_21:
}

id sub_10001DC88(id *a1)
{
  id v2 = [a1[4] locateTag];
  if (os_log_type_enabled((os_log_t)gLogHandle, OS_LOG_TYPE_DEBUG)) {
    sub_100021454();
  }
  id v3 = a1[5];
  id v4 = (id)objc_claimAutoreleasedReturnValue([a1[4] locateSession]);

  if (v3 == v4)
  {
    [a1[4] setLocateTag:0];
    unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue([a1[4] locateCallback]);
    [a1[4] setLocateCallback:0];
    unsigned __int8 v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([a1[4] locateCallbackQueue]);
    [a1[4] setLocateCallbackQueue:0];
    id v7 = (void *)objc_claimAutoreleasedReturnValue([a1[4] locateFavoredServerRanges]);
    [a1[4] setLocateFavoredServerRanges:0];
    [a1[4] setLocateSession:0];
    unsigned __int8 v8 = [a1[4] locateServerValidated];
    id v9 = [a1[4] locateResponseCode];
    [a1[4] setLocateResponseCode:0];
    unsigned __int8 v10 = (void *)objc_claimAutoreleasedReturnValue([a1[4] locateResponseData]);
    [a1[4] setLocateResponseData:0];
    unsigned __int8 v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    [a1[4] setLastLocateDate:v11];

    if (a1[7])
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_10001E2D8;
      block[3] = &unk_100030FF8;
      unsigned int v21 = v5;
      id v20 = a1[7];
      id v12 = v5;
      dispatch_async(v6, block);

      id v13 = v21;
    }

    else
    {
      dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
      id v15 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
      v22[0] = _NSConcreteStackBlock;
      v22[1] = 3221225472LL;
      v22[2] = sub_10001DF24;
      void v22[3] = &unk_1000314B8;
      unsigned __int8 v29 = v8;
      id v16 = a1[4];
      int v28 = (int)v2;
      v22[4] = v16;
      id v27 = v9;
      id v23 = v10;
      id v24 = v7;
      int v25 = v6;
      id v26 = v5;
      id v17 = v5;
      dispatch_async(v15, v22);

      id v13 = v23;
    }
  }

  return [a1[5] finishTasksAndInvalidate];
}

void sub_10001DF24(uint64_t a1)
{
  uint64_t v40 = 0LL;
  if (!*(_BYTE *)(a1 + 84))
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) locateURL]);
    unsigned __int8 v10 = (void *)objc_claimAutoreleasedReturnValue([v9 absoluteString]);
    unsigned __int8 v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"unable to validate server for %@",  v10));
    id TaggedError = createTaggedError(NSURLErrorDomain, -1202LL, v11, *(unsigned int *)(a1 + 80));
    id v8 = (id)objc_claimAutoreleasedReturnValue(TaggedError);

LABEL_19:
    id v7 = 0LL;
    goto LABEL_20;
  }

  uint64_t v2 = *(void *)(a1 + 72);
  uint64_t v3 = *(void *)(a1 + 40);
  if (v2 != 200)
  {
    if (v3)
    {
      id v13 = -[NSString initWithData:encoding:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithData:encoding:",  *(void *)(a1 + 40),  4LL);
      uint64_t v2 = *(void *)(a1 + 72);
    }

    else
    {
      id v13 = 0LL;
    }

    if (v2 == 404)
    {
      if (-[NSString isEqualToString:](v13, "isEqualToString:", @"NO_LOCAL_SERVER"))
      {
        id v15 = gLogHandle;
        if (os_log_type_enabled((os_log_t)gLogHandle, OS_LOG_TYPE_INFO))
        {
          int v16 = *(_DWORD *)(a1 + 80);
          id v17 = v15;
          *(_DWORD *)buf = 67109378;
          int v42 = v16;
          __int16 v43 = 2080;
          id v44 = currentQueueName();
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "#%08x [%s] NO_LOCAL_SERVER", buf, 0x12u);
        }

        id v8 = 0LL;
        uint64_t v40 = 0x40F5180000000000LL;
        goto LABEL_18;
      }

      uint64_t v2 = *(void *)(a1 + 72);
    }

    id v18 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) locateURL]);
    __int128 v19 = (void *)objc_claimAutoreleasedReturnValue([v18 absoluteString]);
    id v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"HTTP error %u from %@, body: %@",  v2,  v19,  v13));
    id v21 = createTaggedError(NSURLErrorDomain, -1011LL, v20, *(unsigned int *)(a1 + 80));
    id v8 = (id)objc_claimAutoreleasedReturnValue(v21);

LABEL_18:
    goto LABEL_19;
  }

  if (!v3)
  {
    id v14 = createTaggedError(NSURLErrorDomain, -1014LL, @"no data from server", *(unsigned int *)(a1 + 80));
    id v8 = (id)objc_claimAutoreleasedReturnValue(v14);
    goto LABEL_19;
  }

  id v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 48);
  id v39 = 0LL;
  id v38 = 0LL;
  unsigned __int8 v6 = [v4 parseLocateResponse:v3 withFavoredServerRanges:v5 intoServers:&v39 validityInterval:&v40 error:&v38 tag:*(unsigned int *)(a1 + 80)];
  id v7 = v39;
  id v8 = v38;
  if ((v6 & 1) == 0)
  {

    id v7 = 0LL;
    uint64_t v40 = 0LL;
  }

uint64_t sub_10001E2BC(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void, void, void, double))(*(void *)(a1 + 56) + 16LL))( *(void *)(a1 + 56),  *(void *)(a1 + 32),  0LL,  *(void *)(a1 + 40),  *(void *)(a1 + 48),  *(double *)(a1 + 64));
}

uint64_t sub_10001E2D8(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void, void, void, double))(*(void *)(a1 + 40) + 16LL))( *(void *)(a1 + 40),  0LL,  0LL,  0LL,  *(void *)(a1 + 32),  0.0);
}

void sub_10001E400(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) locateTag];
  if (os_log_type_enabled((os_log_t)gLogHandle, OS_LOG_TYPE_DEBUG)) {
    sub_1000214F8();
  }
  uint64_t v3 = *(void **)(a1 + 40);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) locateSession]);

  if (v3 != v4) {
    goto LABEL_7;
  }
  [*(id *)(a1 + 32) setLocateResponseData:0];
  uint64_t v5 = *(void *)(a1 + 56);
  uint64_t v6 = objc_opt_class(&OBJC_CLASS___NSHTTPURLResponse);
  if ((objc_opt_isKindOfClass(v5, v6) & 1) != 0)
  {
    id v7 = *(id *)(a1 + 56);
    objc_msgSend(*(id *)(a1 + 32), "setLocateResponseCode:", objc_msgSend(v7, "statusCode"));
    (*(void (**)(void))(*(void *)(a1 + 64) + 16LL))();
  }

  else
  {
LABEL_7:
    (*(void (**)(void))(*(void *)(a1 + 64) + 16LL))();
  }

void sub_10001E5E4(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) locateTag];
  if (os_log_type_enabled((os_log_t)gLogHandle, OS_LOG_TYPE_DEBUG)) {
    sub_10002159C();
  }
  uint64_t v3 = *(void **)(a1 + 40);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) locateSession]);

  if (v3 == v4)
  {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) locateResponseData]);

    if (v5)
    {
      uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) locateResponseData]);
      id v7 = (char *)[v6 length];
      id v8 = &v7[(void)[*(id *)(a1 + 56) length]];

      id v9 = *(void **)(a1 + 32);
      if ((unint64_t)v8 > 0xA00000)
      {
        uint64_t v12 = *(void *)(a1 + 40);
        uint64_t v11 = *(void *)(a1 + 48);
        id v10 = (id)objc_claimAutoreleasedReturnValue([v9 locateURL]);
        id v13 = (void *)objc_claimAutoreleasedReturnValue([v10 absoluteString]);
        id v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"too much data in response from %@ (max %lu)",  v13,  10485760LL));
        id TaggedError = createTaggedError(NSURLErrorDomain, -1103LL, v14, (uint64_t)v2);
        int v16 = (void *)objc_claimAutoreleasedReturnValue(TaggedError);
        [v9 URLSession:v12 task:v11 didCompleteWithError:v16];
      }

      else
      {
        id v10 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) locateResponseData]);
        [v10 appendData:*(void *)(a1 + 56)];
      }
    }

    else
    {
      id v10 = [*(id *)(a1 + 56) mutableCopy];
      [*(id *)(a1 + 32) setLocateResponseData:v10];
    }
  }

LABEL_15:
      id v8 = v4;
      goto LABEL_16;
    }
  }

  id v8 = (id)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v4 count]));
  id v24 = 0u;
  int v25 = 0u;
  id v26 = 0u;
  id v27 = 0u;
  id v9 = v4;
  id v10 = [v9 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v25;
    do
    {
      id v13 = 0LL;
      do
      {
        if (*(void *)v25 != v12) {
          objc_enumerationMutation(v9);
        }
        id v14 = (void *)objc_claimAutoreleasedReturnValue( -[AssetCacheLocatorService redactObject:]( self,  "redactObject:",  *(void *)(*((void *)&v24 + 1) + 8LL * (void)v13)));
        [v8 addObject:v14];

        id v13 = (char *)v13 + 1;
      }

      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }

    while (v11);
  }

LABEL_16:
  return v8;
}

      id v20 = v6;
      goto LABEL_16;
    }
  }

  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v6 count]));
  id v22 = 0u;
  id v23 = 0u;
  id v24 = 0u;
  int v25 = 0u;
  uint64_t v12 = v6;
  id v13 = [v12 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v13)
  {
    id v14 = v13;
    id v15 = *(void *)v23;
    do
    {
      int v16 = 0LL;
      do
      {
        if (*(void *)v23 != v15) {
          objc_enumerationMutation(v12);
        }
        id v17 = (void *)objc_claimAutoreleasedReturnValue( -[AssetCacheLocatorService redactStringsFromObject:usingBlock:]( self,  "redactStringsFromObject:usingBlock:",  *(void *)(*((void *)&v22 + 1) + 8LL * (void)v16),  v7,  (void)v22));
        [v11 addObject:v17];

        int v16 = (char *)v16 + 1;
      }

      while (v14 != v16);
      id v14 = [v12 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }

    while (v14);
  }

LABEL_17:
  return v11;
}

NSString *__cdecl sub_10001EA0C(id a1, NSString *a2)
{
  return (NSString *)@"[redacted]";
}

NSString *__cdecl sub_10001EA18(id a1, NSString *a2)
{
  return (NSString *)@"[redacted]";
}

void sub_10001EA24(uint64_t a1, void *a2, void *a3)
{
  id v11 = a2;
  id v5 = a3;
  if ([v11 rangeOfString:@"guid" options:1] == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    if (([v11 isEqualToString:@"first"] & 1) == 0
      && ![v11 isEqualToString:@"last"])
    {
      id v7 = *(void **)(a1 + 32);
      uint64_t v9 = objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) redactObject:v5]);
      goto LABEL_7;
    }

    id v7 = *(void **)(a1 + 32);
    uint64_t v6 = *(void **)(a1 + 40);
    uint64_t v8 = *(void *)(a1 + 56);
  }

  else
  {
    id v7 = *(void **)(a1 + 32);
    uint64_t v6 = *(void **)(a1 + 40);
    uint64_t v8 = *(void *)(a1 + 48);
  }

  uint64_t v9 = objc_claimAutoreleasedReturnValue([v6 redactStringsFromObject:v5 usingBlock:v8]);
LABEL_7:
  id v10 = (void *)v9;
  [v7 setObject:v9 forKey:v11];
}

void sub_10001F20C( void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

void sub_10001F244( void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

const char *sub_10001F258()
{
  return currentQueueName();
}

  ;
}

  ;
}

  ;
}

  ;
}

id sub_10001F2AC(id a1)
{
  return a1;
}

  ;
}

void sub_10001F2D4(void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
}

void sub_10001F2E0( void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

const char *sub_10001F2F4()
{
  return currentQueueName();
}

  ;
}

id sub_10001F330(id a1)
{
  return a1;
}

void sub_10001F338( void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

void sub_10001F34C( void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

void sub_10001F360( void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

uint64_t sub_10001F380()
{
  return v0;
}

id sub_10001F38C@<X0>(id a1@<X0>, uint64_t a2@<X8>)
{
  *(void *)(v2 - 40) = a2;
  return a1;
}

  ;
}

  ;
}

  ;
}

  ;
}

const char *sub_10001F3E8()
{
  return currentQueueName();
}

  ;
}

void sub_10001F3FC(void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
}

id createTaggedError(void *a1, uint64_t a2, void *a3, uint64_t a4)
{
  v14[0] = a3;
  id v7 = a3;
  id v8 = a1;
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"#%08x",  a4,  NSLocalizedDescriptionKey,  @"com.apple.AssetCacheLocatorService.tag",  v14[0]));
  v14[1] = v9;
  id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v14,  &v13,  2LL));
  id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v8,  a2,  v10));

  return v11;
}

uint64_t acls_nsearch_notld(__res_9_state *a1, const char *a2, int a3, int a4, u_char *a5, int a6)
{
  *__error() = 0;
  _res_9_h_errno_set(a1, 1);
  uint64_t v12 = a1->dnsrch[0];
  if (v12)
  {
    int v13 = 0;
    uint64_t v14 = 80LL;
    while (1)
    {
      uint64_t result = res_9_nquerydomain(a1, a2, v12, a3, a4, a5, a6);
      if (*__error() == 61) {
        break;
      }
      int res_h_errno = a1->res_h_errno;
      if (res_h_errno != 1)
      {
        if (res_h_errno != 4) {
          goto LABEL_9;
        }
        ++v13;
      }

      uint64_t v12 = *(const char **)((char *)&a1->retrans + v14);
      v14 += 8LL;
      if (!v12)
      {
LABEL_9:
        if (!v13) {
          return 0xFFFFFFFFLL;
        }
        id v17 = a1;
        int v18 = 4;
        goto LABEL_12;
      }
    }

    id v17 = a1;
    int v18 = 2;
LABEL_12:
    _res_9_h_errno_set(v17, v18);
  }

  return 0xFFFFFFFFLL;
}

BOOL isXPCError(void *a1)
{
  return a1 == &_xpc_error_connection_interrupted
      || a1 == &_xpc_error_connection_invalid
      || a1 == &_xpc_error_termination_imminent;
}

__CFString *xpcEventDescription(void *a1)
{
  id v1 = a1;
  uint64_t v2 = v1;
  if (v1 == &_xpc_error_connection_interrupted)
  {
    uint64_t v3 = @"XPC_ERROR_CONNECTION_INTERRUPTED";
  }

  else if (v1 == &_xpc_error_connection_invalid)
  {
    uint64_t v3 = @"XPC_ERROR_CONNECTION_INVALID";
  }

  else if (v1 == &_xpc_error_termination_imminent)
  {
    uint64_t v3 = @"XPC_ERROR_TERMINATION_IMMINENT";
  }

  else
  {
    uint64_t v3 = (__CFString *)objc_claimAutoreleasedReturnValue([v1 description]);
  }

  return v3;
}

const char *currentQueueName()
{
  current_queue = dispatch_get_current_queue();
  if (current_queue) {
    return dispatch_queue_get_label(current_queue);
  }
  else {
    return "defunct";
  }
}

void sub_10001F6E8()
{
  __assert_rtn( "-[ACLSTypeVerifier verify:name:withTemplate:tag:]",  "ACLSTypeVerifier.m",  55,  "template != nil && [template isKindOfClass:[NSDictionary class]]");
}

void sub_10001F710()
{
  __assert_rtn("-[ACLSTypeVerifier verify:name:withTemplate:tag:]", "ACLSTypeVerifier.m", 65, "class != nil");
}

void sub_10001F738(void *a1, uint64_t a2, int a3)
{
  id v5 = a1;
  v6[0] = 67109634;
  v6[1] = a3;
  __int16 v7 = 2080;
  id v8 = currentQueueName();
  __int16 v9 = 2112;
  uint64_t v10 = a2;
  _os_log_debug_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "#%08x [%s] verify %@", (uint8_t *)v6, 0x1Cu);
}

void sub_10001F7F4(int a1, os_log_s *a2)
{
  v3[0] = 67109378;
  v3[1] = a1;
  __int16 v4 = 2080;
  id v5 = currentQueueName();
  _os_log_debug_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_DEBUG,  "#%08x [%s] makeLocalAddresses",  (uint8_t *)v3,  0x12u);
}

void sub_10001F88C(void *a1, char a2, int a3)
{
  id v5 = a1;
  v6[0] = 67109634;
  v6[1] = a3;
  __int16 v7 = 2080;
  id v8 = currentQueueName();
  __int16 v9 = 1024;
  int v10 = a2 & 1;
  _os_log_debug_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEBUG,  "#%08x [%s] areDigestedIdentifiers:equalToCleartextIdentifiers: -> %{BOOL}d",  (uint8_t *)v6,  0x18u);
}

void sub_10001F948(void *a1, void *a2, void *a3)
{
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([a2 cacheDirPath]);
  __int16 v7 = (void *)objc_claimAutoreleasedReturnValue([a3 localizedDescription]);
  v11[0] = 67109890;
  v11[1] = 0;
  sub_10001F3B8();
  uint64_t v12 = v6;
  __int16 v13 = v8;
  uint64_t v14 = v9;
  sub_10001F3FC((void *)&_mh_execute_header, v3, v10, "#%08x [%s] unable to create directory %@: %@", (uint8_t *)v11);

  sub_10001F1E4();
}

void sub_10001FA08(void *a1, void *a2)
{
  __int16 v4 = sub_10001F2F4();
  id v5 = (void *)objc_claimAutoreleasedReturnValue([a2 cacheDirPath]);
  v7[0] = 67109634;
  v7[1] = 0;
  __int16 v8 = 2080;
  uint64_t v9 = v4;
  sub_10001F374();
  sub_10001F2D4((void *)&_mh_execute_header, v2, v6, "#%08x [%s] cache directory = %@", (uint8_t *)v7);

  sub_10001F1E4();
}

void sub_10001FAB4()
{
  __assert_rtn( "-[AssetCacheLocatorService init]_block_invoke",  "AssetCacheLocatorService.m",  567,  "self.singleLocateTag == 0");
}

void sub_10001FADC(void *a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_10001F258();
  uint64_t v7 = *a3;
  v9[0] = 67109890;
  v9[1] = 0;
  __int16 v10 = 2080;
  id v11 = v6;
  __int16 v12 = 2112;
  uint64_t v13 = a2;
  __int16 v14 = 2048;
  uint64_t v15 = v7;
  sub_10001F3FC( (void *)&_mh_execute_header,  v3,  v8,  "#%08x [%s] Error getting system group container for identifier %@: %llu",  (uint8_t *)v9);

  sub_10001F1E4();
}

void sub_10001FB88()
{
  sub_10001F1E4();
}

void sub_10001FBFC()
{
  sub_10001F1E4();
}

void sub_10001FC70()
{
}

void sub_10001FC98(void *a1)
{
  id v2 = a1;
  sub_10001F3E8();
  sub_10001F3D0();
  __int16 v5 = v3;
  uint64_t v6 = "com.apple.AssetCacheLocatorService";
  _os_log_error_impl( (void *)&_mh_execute_header,  v1,  OS_LOG_TYPE_ERROR,  "#%08x [%s] xpc_connection_create(%s) failed",  v4,  0x1Cu);
}

void sub_10001FD30(void *a1, void *a2)
{
  uint64_t v4 = sub_10001F2F4();
  __int16 v5 = xpcEventDescription(a2);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v8[0] = 67109634;
  v8[1] = 0;
  __int16 v9 = 2080;
  __int16 v10 = v4;
  sub_10001F374();
  sub_10001F2D4((void *)&_mh_execute_header, v2, v7, "#%08x [%s] XPC listener received event %@", (uint8_t *)v8);

  sub_10001F1E4();
}

void sub_10001FDDC(void *a1, uint64_t a2, void *a3)
{
  uint64_t v6 = sub_10001F3E8();
  pid_t pid = xpc_connection_get_pid(*(xpc_connection_t *)(a2 + 32));
  LODWORD(a2) = xpc_connection_get_euid(*(xpc_connection_t *)(a2 + 32));
  uint8_t v8 = xpcEventDescription(a3);
  __int16 v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v10[0] = 67110146;
  v10[1] = 0;
  __int16 v11 = 2080;
  __int16 v12 = v6;
  __int16 v13 = 1024;
  pid_t v14 = pid;
  __int16 v15 = 1024;
  int v16 = a2;
  __int16 v17 = 2112;
  int v18 = v9;
  _os_log_debug_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEBUG,  "#%08x [%s] XPC connection from pid %d uid %d received event %@",  (uint8_t *)v10,  0x28u);

  sub_10001F3A4();
}

void sub_10001FEC8(void *a1, _xpc_connection_s *a2)
{
  v4[0] = 67110402;
  v4[1] = 0;
  __int16 v5 = 2080;
  uint64_t v6 = sub_10001F2F4();
  __int16 v7 = 1024;
  pid_t pid = xpc_connection_get_pid(a2);
  __int16 v9 = 1024;
  uid_t euid = xpc_connection_get_euid(a2);
  __int16 v11 = 2080;
  __int16 v12 = "tag";
  __int16 v13 = 1024;
  int v14 = 0;
  _os_log_error_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_ERROR,  "#%08x [%s] XPC connection from pid %d uid %d received invalid %s: #%08x",  (uint8_t *)v4,  0x2Eu);

  sub_10001F290();
}

void sub_10001FFA0(void *a1)
{
  id v2 = (void *)sub_10001F380();
  __int16 v3 = xpcEventDescription(v2);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  sub_10001F374();
  sub_10001F360((void *)&_mh_execute_header, v5, v6, "#%08x [%s] handleEvent:%@ forConnection:%@", v7, v8, v9, v10, 2u);

  sub_10001F1E4();
}

void sub_10002004C()
{
}

void sub_100020074(void *a1)
{
  sub_10001F284();
}

void sub_1000200F0()
{
  sub_10001F1E4();
}

void sub_100020164()
{
  sub_10001F1E4();
}

void sub_100020204()
{
  sub_10001F1E4();
}

void sub_100020284(void *a1)
{
  sub_10001F284();
}

void sub_1000202F4()
{
  id v2 = [(id)sub_10001F380() diskCache];
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  sub_10001F220();
  sub_10001F244((void *)&_mh_execute_header, v4, v5, "#%08x [%s] loadDiskCache -> %{private}@", v6, v7, v8, v9, v10);

  sub_10001F1E4();
}

void sub_10002037C()
{
}

void sub_1000203A4(void *a1)
{
  sub_10001F284();
}

void sub_100020414(void *a1)
{
  sub_10001F284();
}

void sub_100020484()
{
  id v4 = [(id)sub_10001F380() diskCachePlistPath];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  int v6 = *__error();
  int v7 = 67109890;
  int v8 = v0;
  __int16 v9 = 2080;
  uint64_t v10 = v2;
  __int16 v11 = 2112;
  __int16 v12 = v5;
  __int16 v13 = 1024;
  int v14 = v6;
  _os_log_error_impl( (void *)&_mh_execute_header,  v1,  OS_LOG_TYPE_ERROR,  "#%08x [%s] unable to write disk cache to %@: %{darwin.errno}d",  (uint8_t *)&v7,  0x22u);

  sub_10001F1E4();
}

void sub_10002054C()
{
}

void sub_100020574()
{
}

void sub_10002059C()
{
}

void sub_1000205C4()
{
  id v2 = [(id)sub_10001F380() diskCache];
  id v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  sub_10001F220();
  sub_10001F244( (void *)&_mh_execute_header,  v4,  v5,  "#%08x [%s] saveDiskCache diskCache=%{private}@",  v6,  v7,  v8,  v9,  v10);

  sub_10001F1E4();
}

void sub_10002064C()
{
}

void sub_100020674(void *a1)
{
  sub_10001F284();
}

void sub_1000206E4()
{
  sub_10001F1E4();
}

void sub_100020760()
{
}

void sub_100020788()
{
  id v2 = [(id)sub_10001F380() diskCache];
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  sub_10001F220();
  sub_10001F244( (void *)&_mh_execute_header,  v4,  v5,  "#%08x [%s] after cacheServers diskCache=%{private}@",  v6,  v7,  v8,  v9,  v10);

  sub_10001F1E4();
}

void sub_100020810()
{
}

void sub_100020838()
{
}

void sub_100020860()
{
}

void sub_100020888()
{
}

void sub_1000208B0()
{
}

void sub_1000208D8()
{
}

void sub_100020900()
{
}

void sub_100020928(void *a1)
{
  sub_10001F284();
}

void sub_100020998()
{
  id v2 = [(id)sub_10001F380() diskCache];
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  sub_10001F220();
  sub_10001F244( (void *)&_mh_execute_header,  v4,  v5,  "#%08x [%s] after cacheDNSPublicAddressRanges diskCache=%{private}@",  v6,  v7,  v8,  v9,  v10);

  sub_10001F1E4();
}

void sub_100020A20()
{
}

void sub_100020A48()
{
}

void sub_100020A70()
{
  id v2 = [(id)sub_10001F380() diskCache];
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  sub_10001F220();
  sub_10001F244( (void *)&_mh_execute_header,  v4,  v5,  "#%08x [%s] after cacheRecentlySeen diskCache=%{private}@",  v6,  v7,  v8,  v9,  v10);

  sub_10001F1E4();
}

void sub_100020AF8()
{
}

void sub_100020B20()
{
}

void sub_100020B48()
{
}

void sub_100020B70()
{
}

void sub_100020B98(void *a1)
{
  sub_10001F284();
}

void sub_100020C08()
{
  sub_10001F2E0( (void *)&_mh_execute_header,  v2,  v3,  "#%08x [%s] locateTetheredCachingServers: CFPreferencesCopyValue(%@, %@) returned unexpected value %@",  v4,  v5,  v6,  v7,  v8);

  sub_10001F290();
}

void sub_100020C94()
{
  sub_10001F2E0( (void *)&_mh_execute_header,  v2,  v3,  "#%08x [%s] locateTetheredCachingServers: CFPreferencesCopyValue(%@, %@) returned unexpected value %@",  v4,  v5,  v6,  v7,  v8);

  sub_10001F290();
}

void sub_100020D20()
{
  sub_10001F2E0( (void *)&_mh_execute_header,  v2,  v3,  "#%08x [%s] locateTetheredCachingServers: CFPreferencesCopyValue(%@, %@) returned unexpected value %@",  v4,  v5,  v6,  v7,  v8);

  sub_10001F290();
}

void sub_100020DAC()
{
  sub_10001F2E0( (void *)&_mh_execute_header,  v2,  v3,  "#%08x [%s] locateTetheredCachingServers: CFPreferencesCopyValue(%@, %@) returned unexpected value %@",  v4,  v5,  v6,  v7,  v8);

  sub_10001F290();
}

void sub_100020E38(void *a1)
{
  sub_10001F284();
}

void sub_100020EB8()
{
  __assert_rtn( "-[AssetCacheLocatorService locateLocalCachingServersWithHeaders:body:timeout:favoredServerRanges:callback:callbackQueue:tag:]",  "AssetCacheLocatorService.m",  3198,  "self.locateSession == nil");
}

void sub_100020EE0()
{
  __assert_rtn( "-[AssetCacheLocatorService locateLocalCachingServersWithHeaders:body:timeout:favoredServerRanges:callback:callbackQueue:tag:]",  "AssetCacheLocatorService.m",  3197,  "self.locateCallback == nil");
}

void sub_100020F08()
{
}

void sub_100020F30()
{
}

void sub_100020F58()
{
  __assert_rtn( "-[AssetCacheLocatorService locateLocalCachingServersWithHeaders:body:timeout:favoredServerRanges:callback:callbackQu eue:tag:]_block_invoke_3",  "AssetCacheLocatorService.m",  3244,  "disposition == ACSURLSessionResponseAllow");
}

void sub_100020F80()
{
}

void sub_100020FA8()
{
}

void sub_100020FD0()
{
}

void sub_100020FF8()
{
}

void sub_100021020()
{
}

void sub_100021048()
{
}

void sub_100021070(void *a1)
{
  sub_10001F284();
}

void sub_1000210E0(void *a1)
{
  sub_10001F284();
}

void sub_100021150()
{
}

void sub_100021178()
{
}

void sub_1000211A0()
{
  __assert_rtn( "-[AssetCacheLocatorService locateCachingServersWithTimeout:capabilities:affinityID:autoRefresh:quickMiss:forceMiss:c allback:callbackQueue:tag:]_block_invoke",  "AssetCacheLocatorService.m",  4067,  "affinityID != nil");
}

void sub_1000211C8()
{
}

void sub_1000211F0()
{
  __assert_rtn( "-[AssetCacheLocatorService slowcateCachingServerWithTimeout:capabilities:affinityID:forceRefresh:forceDNSRefresh:callback:tag:]",  "AssetCacheLocatorService.m",  4164,  "self.singleLocateTag == 0");
}

void sub_100021218()
{
  __assert_rtn( "-[AssetCacheLocatorService slowcateCachingServerWithTimeout:capabilities:affinityID:forceRefresh:forceDNSRefresh:cal lback:tag:]_block_invoke",  "AssetCacheLocatorService.m",  4171,  "self.singleLocateTag == tag");
}

void sub_100021240()
{
}

void sub_100021268()
{
  __assert_rtn( "-[AssetCacheLocatorService slowcateCachingServerWithTimeout:capabilities:affinityID:forceRefresh:forceDNSRefresh:cal lback:tag:]_block_invoke_2",  "AssetCacheLocatorService.m",  4228,  "affinityID != nil");
}

void sub_100021290()
{
}

void sub_1000212B8()
{
}

void sub_1000212E0(void *a1)
{
  sub_10001F284();
}

void sub_100021350()
{
  id v2 = [(id)sub_10001F380() locateURL];
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 absoluteString]);
  sub_10001F374();
  sub_10001F338( (void *)&_mh_execute_header,  v5,  v6,  "#%08x [%s] LocateURL %@ untrusted: no EV result",  v7,  v8,  v9,  v10,  2u);

  sub_10001F3A4();
}

void sub_100021404()
{
}

void sub_10002142C()
{
}

void sub_100021454()
{
  sub_10001F290();
}

void sub_1000214D0()
{
}

void sub_1000214F8()
{
  sub_10001F290();
}

void sub_100021574()
{
}

void sub_10002159C()
{
  id v3 = v2;
  sub_10001F258();
  [*(id *)(v0 + 56) length];
  sub_10001F3B8();
  sub_10001F34C( (void *)&_mh_execute_header,  v4,  v5,  "#%08x [%s] URLSession:%@ dataTask:%@ didReceiveData:[%ld bytes]",  v6,  v7,  v8,  v9,  2u);
}

id objc_msgSend_cacheDNSPublicAddressRanges_andFavoredServerRanges_forNetworkIdentifiers_validityInterval_tag_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "cacheDNSPublicAddressRanges:andFavoredServerRanges:forNetworkIdentifiers:validityInterval:tag:");
}

id objc_msgSend_cachedDNSPublicAddressRanges_andFavoredServerRanges_forNetworkIdentifiers_tag_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cachedDNSPublicAddressRanges:andFavoredServerRanges:forNetworkIdentifiers:tag:");
}

id objc_msgSend_importToCachingServerAsURL_sourcePath_sourceFileHandle_sourceOffset_sourceLength_method_headers_importStrategies_entitled_callback_callbackQueue_tag_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "importToCachingServerAsURL:sourcePath:sourceFileHandle:sourceOffset:sourceLength:method:headers:importStrateg ies:entitled:callback:callbackQueue:tag:");
}

id objc_msgSend_importToLocalCachingServerAsURL_sourceFileHandle_sourceOffset_sourceLength_method_headers_callback_callbackQueue_tag_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "importToLocalCachingServerAsURL:sourceFileHandle:sourceOffset:sourceLength:method:headers:callback:callbackQueue:tag:");
}

id objc_msgSend_locateCachingServersWithTimeout_capabilities_affinityID_autoRefresh_quickMiss_forceMiss_callback_callbackQueue_tag_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "locateCachingServersWithTimeout:capabilities:affinityID:autoRefresh:quickMiss:forceMiss:callback:callbackQueue:tag:");
}

id objc_msgSend_locateLocalCachingServersWithHeaders_body_timeout_favoredServerRanges_callback_callbackQueue_tag_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "locateLocalCachingServersWithHeaders:body:timeout:favoredServerRanges:callback:callbackQueue:tag:");
}

id objc_msgSend_locateLocalCachingServersWithTimeout_localAddresses_gatewayIdentifiers_configurationProfiles_forceDNSRefresh_callback_callbackQueue_tag_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "locateLocalCachingServersWithTimeout:localAddresses:gatewayIdentifiers:configurationProfiles:forceDNSRefresh: callback:callbackQueue:tag:");
}

id objc_msgSend_parseLocateResponse_withFavoredServerRanges_intoServers_validityInterval_error_tag_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "parseLocateResponse:withFavoredServerRanges:intoServers:validityInterval:error:tag:");
}

id objc_msgSend_probeCacheForType_withLabel_networkIdentifiers_hitServers_hitValidityInterval_tag_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "probeCacheForType:withLabel:networkIdentifiers:hitServers:hitValidityInterval:tag:");
}

id objc_msgSend_probeCacheWithLabel_capabilities_affinityID_hitServers_hitServersAreSorted_hitOtherServers_hitValidityInterval_tag_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "probeCacheWithLabel:capabilities:affinityID:hitServers:hitServersAreSorted:hitOtherServers:hitValidityInterval:tag:");
}

id objc_msgSend_queryServersFromArray_forReachabilityOrAffinityID_withTimeout_callbackWithServers_callbackQueue_tag_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "queryServersFromArray:forReachabilityOrAffinityID:withTimeout:callbackWithServers:callbackQueue:tag:");
}

id objc_msgSend_relocateCachingServersWithTimeout_capabilities_affinityID_forceRefresh_tag_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "relocateCachingServersWithTimeout:capabilities:affinityID:forceRefresh:tag:");
}

id objc_msgSend_resolveDNSRecordNamed_withTimeout_errorIfNotFound_callback_callbackQueue_tag_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "resolveDNSRecordNamed:withTimeout:errorIfNotFound:callback:callbackQueue:tag:");
}

id objc_msgSend_sessionWithConfiguration_canUseCachingServer_locateOptions_delegate_delegateQueue_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sessionWithConfiguration:canUseCachingServer:locateOptions:delegate:delegateQueue:");
}

id objc_msgSend_slowcateCachingServerWithTimeout_capabilities_affinityID_forceRefresh_forceDNSRefresh_callback_tag_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "slowcateCachingServerWithTimeout:capabilities:affinityID:forceRefresh:forceDNSRefresh:callback:tag:");
}

id objc_msgSend_uncacheDNSPublicAddressRangesAndFavoredServerRangesForNetworkIdentifiers_tag_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "uncacheDNSPublicAddressRangesAndFavoredServerRangesForNetworkIdentifiers:tag:");
}

id objc_msgSend_updateHealthOfCachingServerWithHostport_healthy_override_callback_callbackQueue_tag_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateHealthOfCachingServerWithHostport:healthy:override:callback:callbackQueue:tag:");
}

id objc_msgSend_writeToFile_atomically_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeToFile:atomically:");
}
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 - (void)setDiskCacheTemplate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 128LL);
}

- (ACLSTypeVerifier)diskCacheVerifier
{
  return (ACLSTypeVerifier *)objc_getProperty(self, a2, 136LL, 1);
}

- (void)setDiskCacheVerifier:(id)a3
{
}

- (NSArray)softwareVersions
{
  return (NSArray *)objc_getProperty(self, a2, 144LL, 1);
}

- (void)setSoftwareVersions:(id)a3
{
}

- (NSDate)bootTime
{
  return (NSDate *)objc_getProperty(self, a2, 152LL, 1);
}

- (void)setBootTime:(id)a3
{
}

- (NSURLSessionConfiguration)locateSessionConfig
{
  return (NSURLSessionConfiguration *)objc_getProperty(self, a2, 160LL, 1);
}

- (void)setLocateSessionConfig:(id)a3
{
}

- (NSURLSessionConfiguration)importSessionConfig
{
  return (NSURLSessionConfiguration *)objc_getProperty(self, a2, 168LL, 1);
}

- (void)setImportSessionConfig:(id)a3
{
}

- (NSURLSessionConfiguration)querySessionConfig
{
  return (NSURLSessionConfiguration *)objc_getProperty(self, a2, 176LL, 1);
}

- (void)setQuerySessionConfig:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 184LL, 1);
}

- (void)setQueue:(id)a3
{
}

- (OS_xpc_object)listenerConnection
{
  return (OS_xpc_object *)objc_getProperty(self, a2, 192LL, 1);
}

- (void)setListenerConnection:(id)a3
{
}

- (NSMutableDictionary)diskCache
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 200LL, 1);
}

- (void)setDiskCache:(id)a3
{
}

- (OS_dispatch_source)diskCacheRefreshTimer
{
  return (OS_dispatch_source *)objc_getProperty(self, a2, 208LL, 1);
}

- (void)setDiskCacheRefreshTimer:(id)a3
{
}

- (BOOL)diskCacheRefreshTimerResumed
{
  return self->_diskCacheRefreshTimerResumed;
}

- (void)setDiskCacheRefreshTimerResumed:(BOOL)a3
{
  self->_diskCacheRefreshTimerResumed = a3;
}

- (OS_dispatch_semaphore)singleLocate
{
  return (OS_dispatch_semaphore *)objc_getProperty(self, a2, 216LL, 1);
}

- (void)setSingleLocate:(id)a3
{
}

- (unsigned)singleLocateTag
{
  return self->_singleLocateTag;
}

- (void)setSingleLocateTag:(unsigned int)a3
{
  self->_singleLocateTag = a3;
}

- (NSOperationQueue)locateOpQueue
{
  return (NSOperationQueue *)objc_getProperty(self, a2, 224LL, 1);
}

- (void)setLocateOpQueue:(id)a3
{
}

- (NSArray)localAddresses
{
  return (NSArray *)objc_getProperty(self, a2, 232LL, 1);
}

- (void)setLocalAddresses:(id)a3
{
}

- (NSArray)gatewayIdentifiers
{
  return (NSArray *)objc_getProperty(self, a2, 240LL, 1);
}

- (void)setGatewayIdentifiers:(id)a3
{
}

- (OS_dispatch_queue)cacheRefreshQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 248LL, 1);
}

- (void)setCacheRefreshQueue:(id)a3
{
}

- (BOOL)cacheRefreshInProgress
{
  return self->_cacheRefreshInProgress;
}

- (void)setCacheRefreshInProgress:(BOOL)a3
{
  self->_cacheRefreshInProgress = a3;
}

- (NSMutableDictionary)affinityCache
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 256LL, 1);
}

- (void)setAffinityCache:(id)a3
{
}

- (unint64_t)testFlags
{
  return self->_testFlags;
}

- (void)setTestFlags:(unint64_t)a3
{
  self->_testFlags = a3;
}

- (__SCDynamicStore)store
{
  return (__SCDynamicStore *)objc_getProperty(self, a2, 272LL, 1);
}

- (void)setStore:(__SCDynamicStore *)a3
{
}

- (unsigned)locateTag
{
  return self->_locateTag;
}

- (void)setLocateTag:(unsigned int)a3
{
  self->_locateTag = a3;
}

- (id)locateCallback
{
  return objc_getProperty(self, a2, 280LL, 1);
}

- (void)setLocateCallback:(id)a3
{
}

- (OS_dispatch_queue)locateCallbackQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 288LL, 1);
}

- (void)setLocateCallbackQueue:(id)a3
{
}

- (NSArray)locateFavoredServerRanges
{
  return (NSArray *)objc_getProperty(self, a2, 296LL, 1);
}

- (void)setLocateFavoredServerRanges:(id)a3
{
}

- (ACSURLSession)locateSession
{
  return (ACSURLSession *)objc_getProperty(self, a2, 304LL, 1);
}

- (void)setLocateSession:(id)a3
{
}

- (BOOL)locateServerValidated
{
  return self->_locateServerValidated;
}

- (void)setLocateServerValidated:(BOOL)a3
{
  self->_locateServerValidated = a3;
}

- (unint64_t)locateResponseCode
{
  return self->_locateResponseCode;
}

- (void)setLocateResponseCode:(unint64_t)a3
{
  self->_locateResponseCode = a3;
}

- (NSMutableData)locateResponseData
{
  return (NSMutableData *)objc_getProperty(self, a2, 320LL, 1);
}

- (void)setLocateResponseData:(id)a3
{
}

- (NSDate)lastLocateDate
{
  return (NSDate *)objc_getProperty(self, a2, 328LL, 1);
}

- (void)setLastLocateDate:(id)a3
{
}

- (void).cxx_destruct
{
}

  ;
}

  ;
}

@end
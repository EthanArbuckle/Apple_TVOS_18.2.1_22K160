uint64_t start()
{
  qword_100010770 = MOLogOpen("com.apple.mobile.installation_proxy", 5LL);
  if (!qword_100010770) {
    syslog(3, "Failed to set up logging");
  }
  if (lockdown_checkin_xpc("com.apple.mobile.installation_proxy", 0LL, 0LL, &stru_10000C420))
  {
    return 1LL;
  }

  else
  {
    CFRunLoopRun();
    return 0LL;
  }
}

void sub_1000048F0(id a1, _lockdown_connection *a2, __CFDictionary *a3)
{
  uint64_t v76 = 0LL;
  v74 = a2;
  Value = (char *)CFDictionaryGetValue(a3, kLockdownCheckinClientNameKey);
  v4 = objc_autoreleasePoolPush();
  cf[0] = 0LL;
  int v5 = lockdown_receive_message(a2, cf);
  CFTypeRef v6 = cf[0];
  char v7 = 1;
  if (!v5 && cf[0])
  {
    v8 = @"Command";
    uint64_t v9 = MCFeatureAppInstallationAllowed;
    uint64_t v73 = MCFeatureAppRemovalAllowed;
    do
    {
      CFTypeID v10 = CFGetTypeID(v6);
      CFTypeID TypeID = CFDictionaryGetTypeID();
      CFTypeRef v6 = cf[0];
      if (v10 != TypeID) {
        break;
      }
      if (!cf[0]) {
        goto LABEL_200;
      }
      v12 = CFDictionaryGetValue((CFDictionaryRef)cf[0], v8);
      v13 = v12;
      if (!v12)
      {
        sub_100005B00((uint64_t)&v74, @"MissingCommand");
        goto LABEL_48;
      }

      LODWORD(v76) = 0;
      if (CFEqual(v12, @"Install") || CFEqual(v13, @"Upgrade"))
      {
        v14 = (void *)objc_claimAutoreleasedReturnValue( +[MCProfileConnection sharedConnection]( &OBJC_CLASS___MCProfileConnection,  "sharedConnection",  p_isa,  v70,  v71));
        BOOL v15 = [v14 effectiveBoolValueForSetting:v9] == 2;

        if (v15)
        {
          sub_100005B00((uint64_t)&v74, @"InstallProhibited");
          goto LABEL_48;
        }

        v16 = (void *)objc_claimAutoreleasedReturnValue(+[TVSCacheDelete sharedInstance](&OBJC_CLASS___TVSCacheDelete, "sharedInstance"));
        v17 = (CFTypeRef *)[v16 synchronouslyFetchApplicationsState];

        if (v17 == (CFTypeRef *)2)
        {
          uint64_t v18 = qword_100010770;
          if (!qword_100010770 || *(int *)(qword_100010770 + 44) >= 3) {
LABEL_23:
          }
            MOLogWrite(v18);
LABEL_47:
          sub_100005B00((uint64_t)&v74, @"AppQuotaExceeded");
          goto LABEL_48;
        }

        if (v17 != (CFTypeRef *)1)
        {
          if (v17)
          {
            if (!qword_100010770 || *(int *)(qword_100010770 + 44) >= 3)
            {
              p_isa = v17;
              MOLogWrite(qword_100010770);
            }
          }

          else
          {
            uint64_t v18 = qword_100010770;
          }

          goto LABEL_47;
        }

        v21 = CFDictionaryGetValue((CFDictionaryRef)v6, @"PackagePath");
        if (!v21)
        {
          goto LABEL_69;
        }

        if (qword_100010780 != -1) {
          dispatch_once(&qword_100010780, &stru_10000C4A8);
        }
        v22 = (void *)qword_100010778;
        if (!qword_100010778)
        {
LABEL_69:
          sub_100005B00((uint64_t)&v74, @"MissingPackagePath");
          goto LABEL_48;
        }

        v23 = (__CFString *)CFStringCreateWithFormat(kCFAllocatorDefault, 0LL, @"%@/%@", qword_100010778, v21);
        if (!v23)
        {
          sub_100005B00((uint64_t)&v74, @"PathCreationFailed");
          goto LABEL_48;
        }

        v24 = v23;
        bzero(cf, 0x400uLL);
        v25 = v24;
        if (realpath_DARWIN_EXTSN( (const char *)-[__CFString fileSystemRepresentation](v25, "fileSystemRepresentation"),  (char *)cf))
        {
          v26 = (const char *)[v22 fileSystemRepresentation];
          size_t v27 = strlen(v26);
          if (v27 <= strlen((const char *)cf) && !memcmp(cf, v26, v27))
          {

            id v88 = 0LL;
            v89 = &v88;
            uint64_t v90 = 0x2020000000LL;
            char v91 = 0;
            v51 = (const __CFDictionary *)CFDictionaryGetValue((CFDictionaryRef)v6, @"ClientOptions");
            v52 = v51;
            if (v51)
            {
              v53 = CFDictionaryGetValue(v51, @"PackageType");
              v54 = v53;
              if (v53)
              {
                if (CFEqual(v53, @"CarrierBundle"))
                {
                  if (!&__CTServerConnectionCreate)
                  {
                    uint64_t v55 = qword_100010770;
                    goto LABEL_184;
                  }

                  id v94 = 0LL;
                  *(_OWORD *)cf = 0u;
                  __int128 v93 = 0u;
                  v65 = (const void *)_CTServerConnectionCreate(kCFAllocatorDefault, sub_100006004, cf);
                  if (v65)
                  {
                    CFURLRef v66 = CFURLCreateWithFileSystemPath(kCFAllocatorDefault, v25, kCFURLPOSIXPathStyle, 0);
                    if (v66)
                    {
                      unint64_t v67 = _CTServerConnectionInstallCarrierBundle(v65, v66);
                      BOOL v68 = (_DWORD)v67 == 0;
                      if ((_DWORD)v67 && (!qword_100010770 || *(int *)(qword_100010770 + 44) >= 3))
                      {
                        p_isa = (CFTypeRef *)v67;
                        v70 = (char *)HIDWORD(v67);
                        MOLogWrite(qword_100010770);
                      }

                      CFRelease(v66);
                    }

                    else
                    {
                      if (!qword_100010770 || *(int *)(qword_100010770 + 44) >= 3)
                      {
                        p_isa = (CFTypeRef *)&v25->isa;
                        MOLogWrite(qword_100010770);
                      }

                      BOOL v68 = 0;
                    }

                    CFRelease(v65);
                  }

                  else
                  {
                    uint64_t v55 = qword_100010770;
                    if (!qword_100010770 || *(int *)(qword_100010770 + 44) >= 3) {
LABEL_183:
                    }
                      MOLogWrite(v55);
LABEL_184:
                    BOOL v68 = 0;
                  }

                  *((_BYTE *)v89 + 24) = v68;
LABEL_191:
                  if (*((_BYTE *)v89 + 24))
                  {
                    sub_100005CC4(&v74);
                  }

                  else
                  {
                    if (!qword_100010770 || *(int *)(qword_100010770 + 44) >= 3)
                    {
                      p_isa = 0LL;
                      MOLogWrite(qword_100010770);
                    }

                    sub_100005B00((uint64_t)&v74, @"APIInternalError");
                  }

                  CFRelease(v25);
                  _Block_object_dispose(&v88, 8);
                  goto LABEL_48;
                }

                int v59 = 0;
LABEL_150:
                if (((v59 | MGGetBoolAnswer(@"InternalBuild")) & 1) != 0
                  || !CFEqual(v54, @"System"))
                {
                  id v60 = -[__CFDictionary mutableCopy](v52, "mutableCopy");
                  [v60 setObject:&__kCFBooleanTrue forKeyedSubscript:@"AllowInstallLocalProvisioned"];
                  v61 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", v25));
                  id v62 = [[MIInstallOptions alloc] initWithLegacyOptionsDictionary:v60];
                  v72 = v60;
                  dispatch_semaphore_t v63 = dispatch_semaphore_create(0LL);
                  uint64_t v84 = 3221225472LL;
                  uint64_t v85 = (uint64_t)sub_100005C08;
                  v86 = &unk_10000C440;
                  v87 = &v74;
                  v77 = _NSConcreteStackBlock;
                  uint64_t v78 = 3221225472LL;
                  v79 = sub_100005CA8;
                  v80 = &unk_10000C468;
                  v82 = &v88;
                  v83 = _NSConcreteStackBlock;
                  v64 = v63;
                  v81 = (_lockdown_connection **)v64;
                  +[IXAppInstallCoordinator installApplication:consumeSource:options:legacyProgressBlock:completion:]( &OBJC_CLASS___IXAppInstallCoordinator,  "installApplication:consumeSource:options:legacyProgressBlock:completion:",  v61,  1LL,  v62,  &v83,  &v77);
                  dispatch_semaphore_wait(v64, 0xFFFFFFFFFFFFFFFFLL);
                }

                else
                {
                  sub_100005B00((uint64_t)&v74, @"InstallProhibited");
                }

                goto LABEL_191;
              }
            }

            else
            {
              v54 = 0LL;
            }

            int v59 = 1;
            goto LABEL_150;
          }

          if (!qword_100010770 || *(int *)(qword_100010770 + 44) >= 3)
          {
            p_isa = cf;
            v70 = (char *)v26;
            MOLogWrite(qword_100010770);
          }
        }

        else
        {
          uint64_t v44 = qword_100010770;
          if (!qword_100010770 || *(int *)(qword_100010770 + 44) >= 3)
          {
            v45 = (CFTypeRef *)-[__CFString fileSystemRepresentation]( v25, "fileSystemRepresentation");
            v46 = __error();
            v70 = strerror(*v46);
            v71 = cf;
            p_isa = v45;
            MOLogWrite(v44);
          }
        }

        if (!qword_100010770 || *(int *)(qword_100010770 + 44) >= 3)
        {
          p_isa = (CFTypeRef *)&v25->isa;
          MOLogWrite(qword_100010770);
        }

        sub_100005B00((uint64_t)&v74, @"MissingPackagePath");
        CFRelease(v25);
      }

      else
      {
        if (CFEqual(v13, @"Uninstall"))
        {
          v19 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](&OBJC_CLASS___MCProfileConnection, "sharedConnection"));
          BOOL v20 = [v19 effectiveBoolValueForSetting:v73] == 2;

          if (v20)
          {
            sub_100005B00((uint64_t)&v74, @"UninstallProhibited");
            goto LABEL_48;
          }

          v33 = CFDictionaryGetValue((CFDictionaryRef)v6, @"ApplicationIdentifier");
          if (!v33)
          {
            sub_100005B00((uint64_t)&v74, @"MissingApplicationIdentifier");
            goto LABEL_48;
          }

          v34 = CFDictionaryGetValue((CFDictionaryRef)v6, @"ClientOptions");
          v35 = (void *)objc_claimAutoreleasedReturnValue(v34);
          v36 = v35;
          if (v35)
          {
            id v37 = v35;
            v83 = 0LL;
            uint64_t v84 = (uint64_t)&v83;
            uint64_t v85 = 0x2020000000LL;
            LOBYTE(v86) = 1;
            v38 = (void *)objc_opt_new(&OBJC_CLASS___IXUninstallOptions);
            cf[0] = _NSConcreteStackBlock;
            cf[1] = (CFTypeRef)3221225472LL;
            *(void *)&__int128 v93 = sub_100006048;
            *((void *)&v93 + 1) = &unk_10000C4D0;
            id v39 = v38;
            id v94 = v39;
            v96 = &v83;
            id v40 = v37;
            id v95 = v40;
            v97 = &v74;
            [v40 enumerateKeysAndObjectsUsingBlock:cf];
            if (*(_BYTE *)(v84 + 24))
            {
              v41 = v8;
            }

            else
            {

              v41 = v8;
              id v39 = 0LL;
            }

            v48 = v95;
            id v43 = v39;

            v8 = v41;
            _Block_object_dispose(&v83, 8);
          }

          else
          {
            id v43 = (id)objc_opt_new(&OBJC_CLASS___IXUninstallOptions);
          }

          if (v43)
          {
            id v88 = 0LL;
            v77 = _NSConcreteStackBlock;
            uint64_t v78 = 3221225472LL;
            v79 = sub_100006038;
            v80 = &unk_10000C440;
            v81 = &v74;
            unsigned __int8 v49 = +[IXAppInstallCoordinator uninstallAppWithBundleID:options:disposition:error:legacyProgressBlock:]( &OBJC_CLASS___IXAppInstallCoordinator,  "uninstallAppWithBundleID:options:disposition:error:legacyProgressBlock:",  v33,  v43,  0LL,  &v88,  &v77);
            id v50 = v88;
            if ((v49 & 1) != 0)
            {
              sub_100005CC4(&v74);
LABEL_120:

              goto LABEL_48;
            }
          }

          else
          {
            id v50 = 0LL;
          }

          if (!qword_100010770 || *(int *)(qword_100010770 + 44) >= 3)
          {
            p_isa = (CFTypeRef *)v50;
            v70 = Value;
            MOLogWrite(qword_100010770);
          }

          sub_100005B00((uint64_t)&v74, @"APIInternalError");
          goto LABEL_120;
        }

        if (CFEqual(v13, @"Lookup"))
        {
          v29 = (char *)CFDictionaryGetValue((CFDictionaryRef)v6, @"ClientOptions");
          if (!qword_100010770 || *(int *)(qword_100010770 + 44) >= 3)
          {
            p_isa = (CFTypeRef *)Value;
            v70 = v29;
            MOLogWrite(qword_100010770);
          }

          v30 = sub_100006D60(v29, Value);
          if (!v30)
          {
            sub_100005B00((uint64_t)&v74, @"LookupFailed");
            goto LABEL_48;
          }

          Mutable = CFDictionaryCreateMutable( kCFAllocatorDefault,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
          v32 = Mutable;
          if (Mutable)
          {
            CFDictionarySetValue(Mutable, @"Status", @"Complete");
            CFDictionarySetValue(v32, @"LookupResult", v30);
            if (lockdown_send_message(v74, v32, 200LL)
              && (!qword_100010770 || *(int *)(qword_100010770 + 44) >= 3))
            {
              MOLogWrite(qword_100010770);
            }

            goto LABEL_61;
          }

          goto LABEL_103;
        }

        if (CFEqual(v13, @"Browse"))
        {
          v42 = (char *)CFDictionaryGetValue((CFDictionaryRef)v6, @"ClientOptions");
          if (!qword_100010770 || *(int *)(qword_100010770 + 44) >= 3)
          {
            p_isa = (CFTypeRef *)Value;
            v70 = v42;
            MOLogWrite(qword_100010770);
          }

          if ((sub_100006E08(v42, (void (*)(void *, uint64_t))sub_100005C18, (uint64_t)&v74, Value) & 1) != 0)
          {
            sub_100005CC4(&v74);
            goto LABEL_48;
          }
        }

        else
        {
          if (CFEqual(v13, @"Restore"))
          {
            if (CFDictionaryGetValue((CFDictionaryRef)v6, @"ApplicationIdentifier"))
            {
              if (!qword_100010770 || (v47 = @"APIInternalError", *(int *)(qword_100010770 + 44) >= 3))
              {
                p_isa = (CFTypeRef *)Value;
                MOLogWrite(qword_100010770);
                v47 = @"APIInternalError";
              }
            }

            else if (!qword_100010770 {
                   || (v47 = @"MissingApplicationIdentifier", *(int *)(qword_100010770 + 44) >= 3))
            }
            {
              MOLogWrite(qword_100010770);
              v47 = @"MissingApplicationIdentifier";
            }

            sub_100005B00((uint64_t)&v74, v47);
            goto LABEL_48;
          }

          if (!CFEqual(v13, @"CheckCapabilitiesMatch"))
          {
            sub_100005B00((uint64_t)&v74, @"UnknownCommand");
            goto LABEL_48;
          }

          v56 = CFDictionaryGetValue((CFDictionaryRef)v6, @"Capabilities");
          if (!v56)
          {
            sub_100005B00((uint64_t)&v74, @"MissingCapabilities");
            goto LABEL_48;
          }

          v57 = CFDictionaryGetValue((CFDictionaryRef)v6, @"ClientOptions");
          v30 = (NSMutableDictionary *)MobileInstallationCheckCapabilitiesMatch(v56, v57);
          if (v30)
          {
            v58 = CFDictionaryCreateMutable( kCFAllocatorDefault,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
            v32 = v58;
            if (v58)
            {
              CFDictionarySetValue(v58, @"Status", @"Complete");
              CFDictionarySetValue(v32, @"LookupResult", v30);
              if (lockdown_send_message(v74, v32, 200LL)
                && (!qword_100010770 || *(int *)(qword_100010770 + 44) >= 3))
              {
                MOLogWrite(qword_100010770);
              }

LABEL_61:
              CFRelease(v32);
LABEL_104:
              CFRelease(v30);
              goto LABEL_48;
            }

LABEL_103:
            sub_100005B00((uint64_t)&v74, @"DictCreationFailed");
            goto LABEL_104;
          }
        }

        sub_100005B00((uint64_t)&v74, @"APIInternalError");
      }

LABEL_48:
      CFRelease(v6);
      objc_autoreleasePoolPop(v4);
      v4 = objc_autoreleasePoolPush();
      cf[0] = 0LL;
      int v28 = lockdown_receive_message(v74, cf);
      char v7 = 0;
      CFTypeRef v6 = cf[0];
    }

    while (!v28 && cf[0]);
  }

  if (v6) {
    CFRelease(v6);
  }
LABEL_200:
  objc_autoreleasePoolPop(v4);
  lockdown_disconnect(a2);
}

void sub_100005AC4( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, char a31)
{
}

void sub_100005B00(uint64_t a1, const void *a2)
{
  if (!*(_DWORD *)(a1 + 16))
  {
    Mutable = CFDictionaryCreateMutable( kCFAllocatorDefault,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
    if (Mutable)
    {
      int v5 = Mutable;
      if (a2) {
        CFDictionarySetValue(Mutable, @"Error", a2);
      }
      if (lockdown_send_message(*(void *)a1, v5, 200LL)
        && (!qword_100010770 || *(int *)(qword_100010770 + 44) >= 3))
      {
        MOLogWrite(qword_100010770);
      }

      CFRelease(v5);
    }

    else if (!qword_100010770 || *(int *)(qword_100010770 + 44) >= 3)
    {
      MOLogWrite(qword_100010770);
    }
  }

uint64_t sub_100005C08(uint64_t a1, const __CFDictionary *a2)
{
  return sub_100005C18(a2, *(void *)(a1 + 32));
}

uint64_t sub_100005C18(const __CFDictionary *a1, uint64_t a2)
{
  if (a1)
  {
    if (CFDictionaryContainsKey(a1, @"Error"))
    {
      *(_DWORD *)(a2 + 16) = 1;
      goto LABEL_5;
    }

    if (a2)
    {
LABEL_5:
      uint64_t result = lockdown_send_message(*(void *)a2, a1, 200LL);
      if (!(_DWORD)result) {
        return result;
      }
    }
  }

  uint64_t result = qword_100010770;
  return result;
}

uint64_t sub_100005CA8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (!a3) {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 1;
  }
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_100005CC4(void *a1)
{
  Mutable = CFDictionaryCreateMutable( kCFAllocatorDefault,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
  if (Mutable)
  {
    v3 = Mutable;
    CFDictionarySetValue(Mutable, @"Status", @"Complete");
    if ((!a1 || lockdown_send_message(*a1, v3, 200LL))
      && (!qword_100010770 || *(int *)(qword_100010770 + 44) >= 3))
    {
      MOLogWrite(qword_100010770);
    }

    CFRelease(v3);
  }

  else if (!qword_100010770 || *(int *)(qword_100010770 + 44) >= 3)
  {
    MOLogWrite(qword_100010770);
  }

void sub_100005DB0(id a1)
{
  qword_100010778 = (uint64_t)sub_100005DCC();
}

CFStringRef sub_100005DCC()
{
  uint64_t v0 = sysconf(71);
  if (v0 == -1)
  {
    int v6 = *__error();
    uint64_t v7 = qword_100010770;
    if (!qword_100010770 || *(int *)(qword_100010770 + 44) >= 3)
    {
      strerror(v6);
      MOLogWrite(v7);
    }

    return 0LL;
  }

  else
  {
    size_t v1 = v0;
    v2 = (char *)&v10 - ((__chkstk_darwin() + 15) & 0xFFFFFFFFFFFFFFF0LL);
    bzero(v13, 0x400uLL);
    v11 = 0LL;
    int v3 = getpwnam_r("mobile", &v12, v2, v1, &v11);
    if (v3)
    {
      uint64_t v4 = qword_100010770;
      if (!qword_100010770 || *(int *)(qword_100010770 + 44) >= 3)
      {
        strerror(v3);
        MOLogWrite(v4);
      }

      return 0LL;
    }

    if (!v11)
    {
      return 0LL;
    }

    if (!realpath_DARWIN_EXTSN(v12.pw_dir, v13))
    {
      uint64_t v8 = qword_100010770;
      if (!qword_100010770 || *(int *)(qword_100010770 + 44) >= 3)
      {
        uint64_t v9 = __error();
        strerror(*v9);
        MOLogWrite(v8);
      }

      return 0LL;
    }

    return CFStringCreateWithFormat(kCFAllocatorDefault, 0LL, @"%s/Media", v13);
  }

uint64_t sub_100006004()
{
  uint64_t result = qword_100010770;
  return result;
}

uint64_t sub_100006038(uint64_t a1, const __CFDictionary *a2)
{
  return sub_100005C18(a2, *(void *)(a1 + 32));
}

void sub_100006048(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7 = a2;
  id v8 = a3;
  if (![v7 isEqualToString:@"WaitForStorageDeletion"])
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT)) {
      sub_100008C60((uint64_t)v7, a1);
    }
    goto LABEL_10;
  }

  uint64_t v9 = objc_opt_class(&OBJC_CLASS___NSNumber);
  if ((objc_opt_isKindOfClass(v8, v9) & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT)) {
      sub_100008BD8((uint64_t)v7, (uint64_t)v8);
    }
LABEL_10:
    *(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = 0;
    *a4 = 1;
    goto LABEL_11;
  }

  id v10 = v8;

LABEL_11:
}

void sub_10000613C(void *a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a1;
  id v7 = v6;
  if (v6)
  {
    if ([v6 count] == (id)1
      && (id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:@"com.apple.mobile_installation.metadata"]),
          unsigned __int8 v9 = [v8 BOOLValue],
          v8,
          (v9 & 1) != 0))
    {
      int v10 = 0;
      BOOL v92 = 0;
      BOOL v90 = 0;
    }

    else
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:@"ShowPlaceholders"]);

      BOOL v90 = v11 != 0LL;
      passwd v12 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:@"ShowLaunchProhibitedApps"]);

      BOOL v13 = v12 != 0LL;
      v14 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:@"ShowAppClips"]);

      BOOL v15 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:@"ShowSwiftPlaygroundsApps"]);
      BOOL v92 = v13;
      int v10 = 1;
    }

    v16 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:@"Attribute"]);
    id v17 = sub_100006B3C(v16);
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(v17);

    if (v18) {
      v97 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v18));
    }
    else {
      v97 = 0LL;
    }
    v21 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:@"BundleIDs"]);
    id v22 = sub_100006B3C(v21);
    v23 = (void *)objc_claimAutoreleasedReturnValue(v22);

    if (v23) {
      uint64_t v24 = objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v23));
    }
    else {
      uint64_t v24 = 0LL;
    }
    v25 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:@"ReturnAttributes"]);
    id v26 = sub_100006B3C(v25);
    size_t v27 = (void *)objc_claimAutoreleasedReturnValue(v26);

    if (v27) {
      uint64_t v28 = objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v27));
    }
    else {
      uint64_t v28 = 0LL;
    }
    v19 = (void *)v24;

    BOOL v20 = (void *)v28;
    if (!v10) {
      goto LABEL_99;
    }
  }

  else
  {
    BOOL v90 = 0;
    BOOL v92 = 0;
    v97 = 0LL;
    v19 = 0LL;
    BOOL v20 = 0LL;
  }

  id v91 = (id)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:@"ApplicationType"]);
  id v29 = v19;
  id v30 = v97;
  id v31 = v20;
  id v95 = a2;
  id v94 = v5;
  if (qword_100010790 != -1) {
    dispatch_once(&qword_100010790, &stru_10000C540);
  }
  id v32 = (id)qword_100010788;
  v87 = v29;
  if (qword_1000107A0 != -1) {
    dispatch_once(&qword_1000107A0, &stru_10000C658);
  }
  id v33 = (id)qword_100010798;
  id v88 = v7;
  if (v31)
  {
    id v34 = v31;
    unsigned int v35 = [v34 containsObject:@"SharedDirSize"];
    else {
      int v36 = 0;
    }
    int v37 = v36 | v35;
    else {
      int v38 = 0;
    }
    else {
      int v39 = 0;
    }
    int v40 = v37 | v38 | v39;
    else {
      int v41 = 0;
    }
    else {
      int v42 = 0;
    }
    int v43 = v41 | v42;
    unsigned int v44 = [v34 containsObject:@"GeoJSON"];

    if (v44) {
      int v45 = 64;
    }
    else {
      int v45 = 0;
    }
    int v46 = v40 | v43 | v45;
  }

  else
  {
    int v46 = 0;
  }

  int v47 = v92;
  id v89 = v5;
  id v48 = v32;
  id v49 = v33;
  id v50 = v30;
  id v51 = v31;
  v96 = v51;
  v97 = v50;
  if (v31)
  {
    v52 = v51;
    int v86 = v46;
    id v31 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithCapacity:](&OBJC_CLASS___NSMutableSet, "setWithCapacity:", 0LL));
    v53 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithCapacity:](&OBJC_CLASS___NSMutableSet, "setWithCapacity:", 0LL));
    __int128 v104 = 0u;
    __int128 v105 = 0u;
    __int128 v106 = 0u;
    __int128 v107 = 0u;
    id v54 = v52;
    id v55 = [v54 countByEnumeratingWithState:&v104 objects:v111 count:16];
    if (v55)
    {
      id v56 = v55;
      uint64_t v57 = *(void *)v105;
      do
      {
        for (i = 0LL; i != v56; i = (char *)i + 1)
        {
          if (*(void *)v105 != v57) {
            objc_enumerationMutation(v54);
          }
          uint64_t v59 = *(void *)(*((void *)&v104 + 1) + 8LL * (void)i);
          unsigned int v60 = [v48 containsObject:v59];
          unsigned int v61 = [v49 containsObject:v59];
          if ((v60 & 1) != 0 || (id v62 = v31, v61))
          {
            id v62 = v53;
            if (((v60 ^ 1 | v61) & 1) != 0) {
              continue;
            }
          }

          [v62 addObject:v59];
        }

        id v56 = [v54 countByEnumeratingWithState:&v104 objects:v111 count:16];
      }

      while (v56);
    }

    id v50 = v97;
    if (v97)
    {
      __int128 v102 = 0u;
      __int128 v103 = 0u;
      __int128 v100 = 0u;
      __int128 v101 = 0u;
      id v63 = v97;
      id v64 = [v63 countByEnumeratingWithState:&v100 objects:v110 count:16];
      if (v64)
      {
        id v65 = v64;
        uint64_t v66 = *(void *)v101;
        do
        {
          for (j = 0LL; j != v65; j = (char *)j + 1)
          {
            if (*(void *)v101 != v66) {
              objc_enumerationMutation(v63);
            }
            uint64_t v68 = *(void *)(*((void *)&v100 + 1) + 8LL * (void)j);
            unsigned int v69 = [v48 containsObject:v68];
            unsigned int v70 = [v49 containsObject:v68];
            if ((v69 & 1) != 0 || (v71 = v31, v70))
            {
              v71 = v53;
              if (((v69 ^ 1 | v70) & 1) != 0) {
                continue;
              }
            }

            [v71 addObject:v68];
          }

          id v65 = [v63 countByEnumeratingWithState:&v100 objects:v110 count:16];
        }

        while (v65);
      }

      int v47 = v92;
      id v50 = v97;
    }

    else
    {
      int v47 = v92;
    }

    int v46 = v86;
  }

  else
  {
    v53 = 0LL;
  }

  id v72 = v53;
  id v73 = v31;

  id v93 = v72;
  id v74 = v73;
  v19 = v87;
  if (([v95 isEqualToString:@"iTunes"] & 1) != 0
    || [v95 isEqualToString:@"AMPDevicesAgent"])
  {
    [v74 removeObject:@"CFBundleBuild"];
  }

  [v74 removeObject:@"UINewsstandApp"];
  v75 = v91;
  if (!v74 || ![v74 count]) {
    goto LABEL_90;
  }
  if ((MGGetBoolAnswer(@"InternalBuild") & 1) != 0)
  {
LABEL_89:
    id v84 = v95;
    id v85 = v74;
    MOLogWrite(qword_100010770);
    goto LABEL_90;
  }

LABEL_90:
  if (!v91
    || ([v91 isEqualToString:@"Any"] & 1) != 0
    || ([v91 isEqualToString:@"System"] & 1) != 0
    || ([v91 isEqualToString:@"Internal"] & 1) != 0
    || ([v91 isEqualToString:@"User"] & 1) != 0)
  {
    uint64_t v76 = (void *)objc_claimAutoreleasedReturnValue( +[LSApplicationRecord enumeratorWithOptions:]( &OBJC_CLASS___LSApplicationRecord,  "enumeratorWithOptions:",  0LL,  v84,  v85));
    sub_1000070F0(v76, v50, v87, v94, v91, v74, v47, v93, v48, v96, v49, v46);
    if (v90)
    {
      v77 = (void *)objc_claimAutoreleasedReturnValue( +[LSApplicationRecord enumeratorWithOptions:]( &OBJC_CLASS___LSApplicationRecord,  "enumeratorWithOptions:",  64LL));
      sub_1000070F0(v77, v50, v87, v94, v91, v74, v47, v93, v48, v96, v49, v46);

      v75 = v91;
    }
  }

  else if (!qword_100010770 || *(int *)(qword_100010770 + 44) >= 3)
  {
    id v84 = v91;
    MOLogWrite(qword_100010770);
  }

  BOOL v20 = v96;
  id v7 = v88;
  id v5 = v89;
  if (v88)
  {
LABEL_99:
    uint64_t v78 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", @"com.apple.mobile_installation.metadata", v84));
    unsigned int v79 = [v78 BOOLValue];

    if (v79)
    {
      v80 = (void *)objc_claimAutoreleasedReturnValue( +[LSApplicationWorkspace defaultWorkspace]( &OBJC_CLASS___LSApplicationWorkspace,  "defaultWorkspace"));
      id v98 = 0LL;
      id v99 = 0LL;
      [v80 getKnowledgeUUID:&v99 andSequenceNumber:&v98];
      id v81 = v99;
      id v82 = v98;

      v109[0] = @"com.apple.mobile_installation.metadata";
      v108[0] = kCFBundleIdentifierKey;
      v108[1] = @"CacheGUID";
      v83 = (void *)objc_claimAutoreleasedReturnValue([v81 UUIDString]);
      v108[2] = @"SequenceNumber";
      v109[1] = v83;
      v109[2] = v82;
      (*((void (**)(id, const __CFString *, NSDictionary *))v5 + 2))( v5,  @"com.apple.mobile_installation.metadata",  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v109,  v108,  3LL));
    }
  }
}

id sub_100006B3C(void *a1)
{
  id v1 = a1;
  if (!v1) {
    goto LABEL_23;
  }
  uint64_t v2 = objc_opt_class(&OBJC_CLASS___NSArray);
  char isKindOfClass = objc_opt_isKindOfClass(v1, v2);
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___NSString);
  if ((isKindOfClass & 1) != 0)
  {
    id v5 = v1;
    uint64_t v6 = objc_opt_class(&OBJC_CLASS___NSArray);
    if ((objc_opt_isKindOfClass(v5, v6) & 1) != 0)
    {
      __int128 v20 = 0u;
      __int128 v21 = 0u;
      __int128 v18 = 0u;
      __int128 v19 = 0u;
      id v7 = v5;
      id v8 = [v7 countByEnumeratingWithState:&v18 objects:v23 count:16];
      if (!v8)
      {

LABEL_25:
        id v13 = v7;
        goto LABEL_26;
      }

      id v9 = v8;
      uint64_t v10 = *(void *)v19;
      int v11 = 1;
      do
      {
        for (i = 0LL; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v19 != v10) {
            objc_enumerationMutation(v7);
          }
          v11 &= objc_opt_isKindOfClass(*(void *)(*((void *)&v18 + 1) + 8LL * (void)i), v4);
        }

        id v9 = [v7 countByEnumeratingWithState:&v18 objects:v23 count:16];
      }

      while (v9);

      if ((v11 & 1) != 0) {
        goto LABEL_25;
      }
    }

    else
    {
    }

    uint64_t v14 = qword_100010770;
  }

  else
  {
    if ((objc_opt_isKindOfClass(v1, v4) & 1) != 0)
    {
      id v22 = v1;
      id v13 = (id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v22, 1LL));
LABEL_26:
      v16 = v13;
      goto LABEL_27;
    }

    uint64_t v15 = qword_100010770;
    if (!qword_100010770 || *(int *)(qword_100010770 + 44) >= 3)
    {
      objc_opt_class(v1);
      uint64_t v14 = v15;
LABEL_22:
      MOLogWrite(v14);
    }
  }

LABEL_23:
  v16 = 0LL;
LABEL_27:

  return v16;
}

NSMutableDictionary *sub_100006D60(void *a1, void *a2)
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100006DFC;
  v7[3] = &unk_10000C4F8;
  uint64_t v4 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  id v8 = v4;
  sub_10000613C(a1, a2, v7);
  id v5 = v4;

  return v5;
}

id sub_100006DFC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) setObject:a3 forKeyedSubscript:a2];
}

uint64_t sub_100006E08(void *a1, void (*a2)(void *, uint64_t), uint64_t a3, void *a4)
{
  uint64_t v17 = 0LL;
  __int128 v18 = &v17;
  uint64_t v19 = 0x2020000000LL;
  uint64_t v20 = 0LL;
  v16[0] = 0LL;
  v16[1] = v16;
  v16[2] = 0x2020000000LL;
  v16[3] = 0LL;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_100006F4C;
  v10[3] = &unk_10000C520;
  id v8 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](&OBJC_CLASS___NSMutableArray, "arrayWithCapacity:", 10LL));
  id v11 = v8;
  passwd v12 = &v17;
  id v13 = v16;
  uint64_t v14 = a2;
  uint64_t v15 = a3;
  sub_10000613C(a1, a4, v10);
  if ([v8 count]) {
    sub_100006FD0(a2, a3, v8, v18[3]);
  }

  _Block_object_dispose(v16, 8);
  _Block_object_dispose(&v17, 8);

  return 1LL;
}

void sub_100006F28( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
}

id sub_100006F4C(uint64_t a1)
{
  id result = [*(id *)(a1 + 32) count];
  if (result == (id)10)
  {
    sub_100006FD0( *(void (**)(void *, uint64_t))(a1 + 56),  *(void *)(a1 + 64),  *(void **)(a1 + 32),  *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL));
    id result = [*(id *)(a1 + 32) removeAllObjects];
  }

  else if (result == (id)1)
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = *(void *)(*(void *)(*(void *)(a1 + 48) + 8LL)
                                                                            + 24LL);
  }

  ++*(void *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL);
  return result;
}

void sub_100006FD0(void (*a1)(void *, uint64_t), uint64_t a2, void *a3, uint64_t a4)
{
  id v7 = a3;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a4));
  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v7 count]));
  v11[0] = @"Status";
  v11[1] = @"CurrentIndex";
  v12[0] = @"BrowsingApplications";
  v12[1] = v8;
  v11[2] = @"CurrentAmount";
  v11[3] = @"CurrentList";
  v12[2] = v9;
  v12[3] = v7;
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v12,  v11,  4LL));

  a1(v10, a2);
}

void sub_1000070F0( void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, int a7, void *a8, void *a9, void *a10, void *a11, int a12)
{
  id v18 = a1;
  id v135 = a2;
  id v19 = a3;
  v128 = a4;
  id v20 = a5;
  id v21 = a6;
  v134 = a8;
  id v22 = v21;
  id v133 = a9;
  v23 = v19;
  id v141 = a10;
  id v132 = a11;
  __int128 v155 = 0u;
  __int128 v156 = 0u;
  __int128 v157 = 0u;
  __int128 v158 = 0u;
  id obj = v18;
  id v24 = [obj countByEnumeratingWithState:&v155 objects:v171 count:16];
  if (v24)
  {
    id v25 = v24;
    uint64_t v26 = *(void *)v156;
    id v142 = v19;
    id v130 = v20;
    v131 = v22;
    uint64_t v129 = *(void *)v156;
    do
    {
      size_t v27 = 0LL;
      id v136 = v25;
      do
      {
        if (*(void *)v156 != v26) {
          objc_enumerationMutation(obj);
        }
        uint64_t v28 = *(void **)(*((void *)&v155 + 1) + 8LL * (void)v27);
        id v29 = objc_autoreleasePoolPush();
        if (!v23
          || (id v30 = (void *)objc_claimAutoreleasedReturnValue([v28 bundleIdentifier]),
              unsigned int v31 = [v23 containsObject:v30],
              v30,
              v31))
        {
          id v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "compatibilityObject", v122, v123, v124));
          id v33 = (void *)objc_claimAutoreleasedReturnValue([v32 bundleType]);
          id v34 = v33;
          if (!v20
            || ([v33 isEqualToString:v20] & 1) != 0
            || [v20 isEqualToString:@"Any"]
            && (([v34 isEqualToString:@"System"] & 1) != 0
             || ([v34 isEqualToString:@"Internal"] & 1) != 0
             || [v34 isEqualToString:@"User"]))
          {
            BOOL v35 = [v28 isLaunchProhibited] && a7 == 0;
            if (!v35)
            {
              v146 = v34;
              v150 = v29;
              v148 = v27;
              int v36 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithCapacity:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithCapacity:",  0LL));
              v147 = v32;
              id v37 = v32;
              id v38 = v36;
              id v151 = v133;
              id v153 = v132;
              id v39 = v22;
              int v40 = v134;
              int v41 = v134;
              int v42 = objc_autoreleasePoolPush();
              int v43 = v42;
              v152 = v28;
              v144 = v41;
              if (v134)
              {
                v137 = v42;
                id v139 = v39;
                __int128 v174 = 0u;
                __int128 v175 = 0u;
                __int128 v172 = 0u;
                __int128 v173 = 0u;
                unsigned int v44 = v41;
                id v45 = [v44 countByEnumeratingWithState:&v172 objects:v176 count:16];
                if (v45)
                {
                  id v46 = v45;
                  uint64_t v47 = *(void *)v173;
                  do
                  {
                    id v48 = 0LL;
                    do
                    {
                      if (*(void *)v173 != v47) {
                        objc_enumerationMutation(v44);
                      }
                      id v49 = *(void **)(*((void *)&v172 + 1) + 8LL * (void)v48);
                      id v50 = v37;
                      id v51 = v38;
                      v52 = v49;
                      if (qword_1000107B0 != -1) {
                        dispatch_once(&qword_1000107B0, &stru_10000C6A0);
                      }
                      id v53 = objc_msgSend((id)qword_1000107A8, "indexForKey:", v52, v122);
                      if (v53 == (id)0x7FFFFFFFFFFFFFFFLL)
                      {
                        if (!qword_100010770 || *(int *)(qword_100010770 + 44) >= 3)
                        {
                          v122 = v52;
                          MOLogWrite(qword_100010770);
                        }
                      }

                      else
                      {
                        id v54 = &off_100010290 + 4 * (void)v53;

                        sub_100008750((uint64_t)v54, v50, v51);
                      }

                      id v48 = (char *)v48 + 1;
                    }

                    while (v46 != v48);
                    id v46 = [v44 countByEnumeratingWithState:&v172 objects:v176 count:16];
                  }

                  while (v46);
                }

                v23 = v142;
                id v22 = v131;
                uint64_t v28 = v152;
                int v43 = v137;
                id v39 = v139;
              }

              else
              {
                do
                {
                  sub_100008750((uint64_t)&off_100010290 + (void)v40, v37, v38);
                  v40 += 32;
                }

                while (v40 != (char *)1184);
              }

              objc_autoreleasePoolPop(v43);
              id v55 = v151;
              if (!v22 || [v39 count])
              {
                id v56 = (__CFString *)(id)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "bundleURL", v122));
                uint64_t v57 = (__CFString *)v39;
                pthread_mutex_lock(&stru_100010730);
                Unique = (__CFBundle *)_CFBundleCreateUnique(0LL, v56);
                if (Unique)
                {
                  uint64_t v59 = Unique;
                  if (v22)
                  {
                    uint64_t FilteredInfoPlist = _CFBundleCreateFilteredInfoPlist();
                    if (FilteredInfoPlist)
                    {
                      unsigned int v61 = (const __CFDictionary *)FilteredInfoPlist;
                      id v62 = v28;
                      CFTypeID TypeID = CFDictionaryGetTypeID();
                      if (TypeID == CFGetTypeID(v61))
                      {
                        id v64 = v39;
                        CFMutableDictionaryRef MutableCopy = CFDictionaryCreateMutableCopy(0LL, 0LL, v61);
                        CFRelease(v61);
                      }

                      else
                      {
                        CFTypeID v68 = CFGetTypeID(v61);
                        CFStringRef v69 = CFCopyTypeIDDescription(v68);
                        if (!qword_100010770 || *(int *)(qword_100010770 + 44) >= 3)
                        {
                          v122 = (__CFString *)v69;
                          MOLogWrite(qword_100010770);
                        }

                        id v64 = v39;
                        if (v69) {
                          CFRelease(v69);
                        }
                        CFRelease(v61);
                        CFMutableDictionaryRef MutableCopy = 0LL;
                      }

                      id v22 = v131;
                      uint64_t v28 = v62;
                      id v55 = v151;
                    }

                    else
                    {
                      id v64 = v39;
                      if (!qword_100010770 || *(int *)(qword_100010770 + 44) >= 3)
                      {
                        v122 = v57;
                        v123 = v59;
                        MOLogWrite(qword_100010770);
                      }

                      CFMutableDictionaryRef MutableCopy = 0LL;
                      id v22 = v131;
                    }
                  }

                  else
                  {
                    InfoDictionary = CFBundleGetInfoDictionary(Unique);
                    if (InfoDictionary)
                    {
                      id v64 = v39;
                      CFMutableDictionaryRef v67 = CFDictionaryCreateMutableCopy(0LL, 0LL, InfoDictionary);
                      CFMutableDictionaryRef MutableCopy = v67;
                      if (v67) {
                        -[__CFDictionary removeObjectForKey:](v67, "removeObjectForKey:", @"CFBundleInfoPlistURL");
                      }
                    }

                    else
                    {
                      id v64 = v39;
                      if (!qword_100010770 || *(int *)(qword_100010770 + 44) >= 3)
                      {
                        v122 = v56;
                        MOLogWrite(qword_100010770);
                      }

                      CFMutableDictionaryRef MutableCopy = 0LL;
                    }
                  }

                  CFRelease(v59);
                }

                else
                {
                  id v64 = v39;
                  if (!qword_100010770 || *(int *)(qword_100010770 + 44) >= 3)
                  {
                    v122 = v56;
                    MOLogWrite(qword_100010770);
                  }

                  CFMutableDictionaryRef MutableCopy = 0LL;
                }

                pthread_mutex_unlock(&stru_100010730);

                if (MutableCopy)
                {
                  *(void *)&__int128 v163 = _NSConcreteStackBlock;
                  *((void *)&v163 + 1) = 3221225472LL;
                  *(void *)&__int128 v164 = sub_10000899C;
                  *((void *)&v164 + 1) = &unk_10000C680;
                  *(void *)&__int128 v165 = v55;
                  *((void *)&v165 + 1) = v153;
                  *(void *)&__int128 v166 = v38;
                  -[__CFDictionary enumerateKeysAndObjectsUsingBlock:]( MutableCopy,  "enumerateKeysAndObjectsUsingBlock:",  &v163);
                }

                id v39 = v64;
                v23 = v142;
              }

              id v70 = (id)objc_claimAutoreleasedReturnValue([v28 bundleIdentifier]);
              id v71 = v38;
              id v72 = v135;
              id v73 = v141;
              __int128 v163 = 0u;
              __int128 v164 = 0u;
              __int128 v165 = 0u;
              __int128 v166 = 0u;
              id v74 = v72;
              id v75 = [v74 countByEnumeratingWithState:&v163 objects:v176 count:16];
              if (v75)
              {
                id v76 = v75;
                uint64_t v77 = *(void *)v164;
                while (2)
                {
                  for (i = 0LL; i != v76; i = (char *)i + 1)
                  {
                    if (*(void *)v164 != v77) {
                      objc_enumerationMutation(v74);
                    }
                    unsigned int v79 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v71,  "objectForKeyedSubscript:",  *(void *)(*((void *)&v163 + 1) + 8 * (void)i),  v122));

                    if (!v79)
                    {

                      uint64_t v26 = v129;
                      id v20 = v130;
                      id v25 = v136;
                      id v29 = v150;
                      goto LABEL_149;
                    }
                  }

                  id v76 = [v74 countByEnumeratingWithState:&v163 objects:v176 count:16];
                  if (v76) {
                    continue;
                  }
                  break;
                }
              }

              if (!v141) {
                goto LABEL_101;
              }
              __int128 v161 = 0u;
              __int128 v162 = 0u;
              __int128 v159 = 0u;
              __int128 v160 = 0u;
              v80 = (void *)objc_claimAutoreleasedReturnValue([v71 allKeys]);
              id v81 = [v80 countByEnumeratingWithState:&v159 objects:&v172 count:16];
              if (v81)
              {
                id v82 = v81;
                uint64_t v83 = *(void *)v160;
                do
                {
                  for (j = 0LL; j != v82; j = (char *)j + 1)
                  {
                    if (*(void *)v160 != v83) {
                      objc_enumerationMutation(v80);
                    }
                    uint64_t v85 = *(void *)(*((void *)&v159 + 1) + 8LL * (void)j);
                  }

                  id v82 = [v80 countByEnumeratingWithState:&v159 objects:&v172 count:16];
                }

                while (v82);
              }

              v23 = v142;
              if (a12)
              {
                int v86 = (void *)objc_claimAutoreleasedReturnValue( +[LSApplicationProxy applicationProxyForIdentifier:]( &OBJC_CLASS___LSApplicationProxy,  "applicationProxyForIdentifier:",  v70));
                v87 = (void *)objc_claimAutoreleasedReturnValue([v86 bundleContainerURL]);
                v154 = v86;
                unsigned int v88 = [v86 isContainerized];
                id v89 = v87;
                id v29 = v150;
                BOOL v90 = v152;
                if (v88 && v87)
                {
                  if ((a12 & 4) == 0)
                  {
                    if ((a12 & 2) == 0) {
                      goto LABEL_97;
                    }
LABEL_108:
                    id v94 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v154, "diskUsage", v122));
                    id v95 = (void *)objc_claimAutoreleasedReturnValue([v94 dynamicUsage]);

                    if (v95)
                    {
                      [v71 setObject:v95 forKey:@"DynamicDiskUsage"];
                    }

                    else
                    {
                      uint64_t v96 = qword_100010770;
                      if (!qword_100010770 || *(int *)(qword_100010770 + 44) >= 3)
                      {
                        v122 = (__CFString *)objc_claimAutoreleasedReturnValue([v154 bundleIdentifier]);
                        MOLogWrite(v96);

                        id v29 = v150;
                      }
                    }

                    BOOL v90 = v152;
                    if ((a12 & 8) != 0) {
                      goto LABEL_114;
                    }
LABEL_98:
                    if ((a12 & 0x10) == 0) {
                      goto LABEL_143;
                    }
LABEL_115:
                    __int128 v101 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v87,  "URLByAppendingPathComponent:",  @"iTunesMetadata.plist",  v122));
                    id v102 = v154;
                    id v103 = v101;
                    id v140 = v71;
                    v127 = v102;
                    v145 = (__CFBundle *)objc_claimAutoreleasedReturnValue([v102 bundleIdentifier]);
                    id v170 = 0LL;
                    v138 = v103;
                    __int128 v104 = (void *)objc_claimAutoreleasedReturnValue( +[NSData dataWithContentsOfURL:options:error:]( &OBJC_CLASS___NSData,  "dataWithContentsOfURL:options:error:",  v103,  3LL,  &v170));
                    id v105 = v170;
                    id v106 = v105;
                    if (v104)
                    {
                      id v168 = 0LL;
                      uint64_t v169 = 100LL;
                      __int128 v107 = (void *)objc_claimAutoreleasedReturnValue( +[NSPropertyListSerialization propertyListWithData:options:format:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "propertyListWithData:options:format:error:",  v104,  1LL,  &v169,  &v168));
                      id v126 = v168;

                      if (v107)
                      {
                        uint64_t v108 = objc_opt_class(&OBJC_CLASS___NSMutableDictionary);
                        if ((objc_opt_isKindOfClass(v107, v108) & 1) == 0)
                        {
                          uint64_t v114 = qword_100010770;
                          if (!qword_100010770 || *(int *)(qword_100010770 + 44) >= 3)
                          {
                            v115 = (__CFString *)objc_claimAutoreleasedReturnValue([v138 path]);
                            v116 = (objc_class *)objc_opt_class(v107);
                            v117 = NSStringFromClass(v116);
                            v123 = v145;
                            v124 = (void *)objc_claimAutoreleasedReturnValue(v117);
                            v122 = v115;
                            MOLogWrite(v114);
                          }

                          goto LABEL_134;
                        }

                        v109 = (void *)objc_claimAutoreleasedReturnValue([v107 objectForKeyedSubscript:@"title"]);

                        if (v109) {
                          goto LABEL_123;
                        }
                        v125 = v107;
                        v110 = (void *)objc_claimAutoreleasedReturnValue([v127 localizedShortName]);
                        if (!v110) {
                          v110 = (void *)objc_claimAutoreleasedReturnValue([v127 localizedName]);
                        }
                        [v125 setObject:v110 forKeyedSubscript:@"title"];
                        id v167 = 0LL;
                        uint64_t v111 = objc_claimAutoreleasedReturnValue( +[NSPropertyListSerialization dataWithPropertyList:format:options:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "dataWithPropertyList:format:options:error:",  v125,  v169,  0LL,  &v167));
                        id v106 = v167;

                        if (v111)
                        {

                          __int128 v104 = (void *)v111;
                          id v126 = v106;
                          __int128 v107 = v125;
LABEL_123:
                          [v140 setObject:v104 forKey:@"iTunesMetadata"];
LABEL_134:
                          BOOL v90 = v152;
LABEL_135:
                          id v106 = v126;
                        }

                        else
                        {
                          BOOL v90 = v152;
                          if (!qword_100010770 || *(int *)(qword_100010770 + 44) >= 3)
                          {
                            v122 = (__CFString *)v145;
                            v123 = (__CFBundle *)v106;
                            MOLogWrite(qword_100010770);
                          }

                          __int128 v104 = 0LL;
                          __int128 v107 = v125;
                        }
                      }

                      else
                      {
                        id v106 = v126;
                        v122 = (__CFString *)v145;
                        v123 = (__CFBundle *)v126;
                        MOLogWrite(qword_100010770);
                      }

                      goto LABEL_137;
                    }

                    if (v105)
                    {
                      v112 = (void *)objc_claimAutoreleasedReturnValue([v105 domain]);
                      if ([v112 isEqualToString:NSCocoaErrorDomain])
                      {
                        id v113 = [v106 code];

                        BOOL v35 = v113 == (id)260;
                        BOOL v90 = v152;
                        if (v35) {
                          goto LABEL_137;
                        }
                      }

                      else
                      {
                      }
                    }

                    if (qword_100010770 && *(int *)(qword_100010770 + 44) < 3)
                    {
LABEL_137:
                      v118 = v138;
                    }

                    else
                    {
                      v118 = v138;
                      v123 = (__CFBundle *)v138;
                      v124 = v106;
                      v122 = (__CFString *)v145;
                      MOLogWrite(qword_100010770);
                    }

                    id v22 = v131;
                    id v29 = v150;
                    goto LABEL_143;
                  }

                  id v91 = (void *)objc_claimAutoreleasedReturnValue([v86 diskUsage]);
                  BOOL v92 = (void *)objc_claimAutoreleasedReturnValue([v91 staticUsage]);

                  if (v92)
                  {
                    [v71 setObject:v92 forKey:@"StaticDiskUsage"];
                  }

                  else
                  {
                    uint64_t v93 = qword_100010770;
                    if (!qword_100010770 || *(int *)(qword_100010770 + 44) >= 3)
                    {
                      v122 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v154, "bundleIdentifier", v122));
                      MOLogWrite(v93);

                      id v29 = v150;
                    }
                  }

                  BOOL v90 = v152;
                  if ((a12 & 2) != 0) {
                    goto LABEL_108;
                  }
LABEL_97:
                  if ((a12 & 8) == 0) {
                    goto LABEL_98;
                  }
LABEL_114:
                  v97 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v154, "bundleURL", v122));
                  id v98 = (void *)objc_claimAutoreleasedReturnValue([v154 bundleExecutable]);
                  id v99 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"SC_Info/%@.sinf",  v98));
                  __int128 v100 = (void *)objc_claimAutoreleasedReturnValue([v97 URLByAppendingPathComponent:v99]);
                  sub_100008AA4(v100, v71, @"ApplicationSINF");

                  id v22 = v131;
                  id v29 = v150;

                  BOOL v90 = v152;
                  if ((a12 & 0x10) != 0) {
                    goto LABEL_115;
                  }
LABEL_143:
                  id v89 = v87;
                  if ((a12 & 0x20) != 0)
                  {
                    v119 = (void *)objc_claimAutoreleasedReturnValue([v87 URLByAppendingPathComponent:@"iTunesArtwork"]);
                    BOOL v90 = v152;
                    sub_100008AA4(v119, v71, @"iTunesArtwork");

                    id v89 = v87;
                  }

                  if ((a12 & 0x40) != 0)
                  {
                    v120 = (void *)objc_claimAutoreleasedReturnValue([v89 URLByAppendingPathComponent:@"GeoJSON"]);
                    sub_100008AA4(v120, v71, @"GeoJSON");

                    id v89 = v87;
                  }
                }
              }

              else
              {
LABEL_101:

                id v29 = v150;
                BOOL v90 = v152;
              }

              id v70 = (id)objc_claimAutoreleasedReturnValue([v90 bundleIdentifier]);
              v128[2](v128, v70, v71);
              uint64_t v26 = v129;
              id v20 = v130;
              id v25 = v136;
LABEL_149:
              id v34 = v146;

              id v32 = v147;
              size_t v27 = v148;
            }
          }
        }

        objc_autoreleasePoolPop(v29);
        size_t v27 = (char *)v27 + 1;
      }

      while (v27 != v25);
      id v121 = [obj countByEnumeratingWithState:&v155 objects:v171 count:16];
      id v25 = v121;
    }

    while (v121);
  }
}

void sub_100008118(id a1)
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithCapacity:](&OBJC_CLASS___NSMutableSet, "setWithCapacity:", 37LL));
  for (uint64_t i = 0LL; i != 1184; i += 32LL)
    [v4 addObject:**(void **)((char *)&off_100010290 + i)];
  id v2 = [v4 copy];
  int v3 = (void *)qword_100010788;
  qword_100010788 = (uint64_t)v2;
}

void *sub_100008194()
{
  return &__kCFBooleanTrue;
}

id sub_1000081A0(id *a1)
{
  id v1 = *a1;
  id v2 = [*a1 count];
  if (v2) {
    id v2 = v1;
  }
  return v2;
}

id sub_1000081CC(_BYTE *a1)
{
  if (*a1) {
    id v1 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", 1LL));
  }
  else {
    id v1 = 0LL;
  }
  return v1;
}

id sub_100008200(id *a1)
{
  return [*a1 path];
}

id sub_100008208(id *a1)
{
  id v1 = *a1;
  id v2 = [*a1 count];
  if (v2) {
    id v2 = v1;
  }
  return v2;
}

void *sub_100008234(void *a1)
{
  id v1 = a1;
  id v2 = [v1 entitlementValueForKey:@"com.apple.private.mobileinstall.upgrade-enabled" ofClass:objc_opt_class(NSNumber)];
  int v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  unsigned int v4 = [v3 BOOLValue];
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v1 bundleType]);

  uint64_t v6 = &__kCFBooleanTrue;
  if (([v5 isEqualToString:@"User"] & 1) == 0
    && !([v5 isEqualToString:@"VPNPlugin"] | v4))
  {
    uint64_t v6 = &__kCFBooleanFalse;
  }

  return v6;
}

id sub_1000082F0(id *a1)
{
  id v1 = [*a1 longLongValue];
  if (v1) {
    id v1 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", v1));
  }
  return v1;
}

id sub_100008320(id *a1)
{
  id v1 = *a1;
  id v2 = [*a1 count];
  if (v2)
  {
    id v3 = (id)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithCapacity:]( NSMutableDictionary,  "dictionaryWithCapacity:",  [v1 count]));
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    __int128 v20 = 0u;
    __int128 v21 = 0u;
    id v4 = v1;
    id v5 = [v4 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (!v5) {
      goto LABEL_22;
    }
    id v6 = v5;
    uint64_t v7 = *(void *)v19;
    while (1)
    {
      for (uint64_t i = 0LL; i != v6; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v19 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v18 + 1) + 8LL * (void)i);
        uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", v9, v17));
        uint64_t v11 = objc_opt_class(&OBJC_CLASS___NSURL);
        if ((objc_opt_isKindOfClass(v10, v11) & 1) != 0)
        {
          id v12 = v10;
          goto LABEL_11;
        }

        uint64_t v13 = objc_opt_class(&OBJC_CLASS___NSString);
        if ((objc_opt_isKindOfClass(v10, v13) & 1) != 0)
        {
          id v12 = (id)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v10));
LABEL_11:
          uint64_t v14 = v12;
          if ([v12 isFileURL])
          {
            uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v14 path]);
            [v3 setObject:v15 forKeyedSubscript:v9];
          }

          else if (!qword_100010770 || *(int *)(qword_100010770 + 44) >= 3)
          {
            uint64_t v17 = v14;
            MOLogWrite(qword_100010770);
          }

          goto LABEL_20;
        }

        uint64_t v14 = 0LL;
LABEL_20:
      }

      id v6 = [v4 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (!v6)
      {
LABEL_22:

        id v2 = v3;
        return v2;
      }
    }
  }

  return v2;
}

NSNumber *sub_100008560(void *a1)
{
  return +[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", *a1);
}

id sub_100008570(void *a1)
{
  id v1 = a1;
  uint64_t v2 = objc_opt_class(&OBJC_CLASS___NSArray);
  id v3 = [v1 objectForInfoDictionaryKey:@"SBMatchingApplicationGenres" ofClass:v2 valuesOfClass:objc_opt_class(NSString)];
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);

  return v4;
}

id sub_1000085D8(void *a1)
{
  id v1 = a1;
  id v2 = [v1 objectForInfoDictionaryKey:@"LSApplicationCategoryType" ofClass:objc_opt_class(NSString)];
  id v3 = (void *)objc_claimAutoreleasedReturnValue(v2);

  return v3;
}

void *sub_10000862C(void *a1)
{
  id v1 = a1;
  id v2 = (void *)objc_claimAutoreleasedReturnValue([v1 appState]);
  if (![v2 isPlaceholder])
  {

    goto LABEL_7;
  }

  if ([v1 installType] != (id)7)
  {
    id v3 = [v1 installType];

    if (v3 == (id)8) {
      goto LABEL_6;
    }
LABEL_7:
    id v4 = &__kCFBooleanFalse;
    goto LABEL_8;
  }

LABEL_6:
  id v4 = &__kCFBooleanTrue;
LABEL_8:

  return v4;
}

void *sub_1000086BC()
{
  return &__kCFBooleanFalse;
}

void *sub_1000086C8()
{
  return &__kCFBooleanTrue;
}

void sub_1000086D4(id a1)
{
  uint64_t v1 = objc_claimAutoreleasedReturnValue( +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  @"SharedDirSize",  @"DynamicDiskUsage",  @"StaticDiskUsage",  @"ApplicationSINF",  @"iTunesArtwork",  @"GeoJSON",  @"iTunesMetadata",  0LL));
  id v2 = (void *)qword_100010798;
  qword_100010798 = v1;
}

void sub_100008750(uint64_t a1, void *a2, void *a3)
{
  id v20 = a2;
  id v5 = a3;
  id v6 = *(uint64_t (**)(id))(a1 + 24);
  if (!v6)
  {
    uint64_t v10 = (NSString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  *(void *)(a1 + 8)));
    SEL v11 = NSSelectorFromString(v10);

    if ((objc_opt_respondsToSelector(v20, v11) & 1) != 0)
    {
      uint64_t v12 = objc_claimAutoreleasedReturnValue([v20 methodSignatureForSelector:v11]);
      if (v12)
      {
        uint64_t v13 = (void *)v12;
        uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSInvocation invocationWithMethodSignature:]( &OBJC_CLASS___NSInvocation,  "invocationWithMethodSignature:",  v12));
        [v14 setSelector:v11];
        [v14 invokeWithTarget:v20];
        uint64_t v9 = (id *)malloc((size_t)[v13 methodReturnLength]);
        [v14 getReturnValue:v9];
        uint64_t v15 = *(uint64_t (**)(id *))(a1 + 16);
        if (v15)
        {
          uint64_t v16 = v15(v9);
          id v17 = (id)objc_claimAutoreleasedReturnValue(v16);
        }

        else
        {
          id v19 = v13;
          if (strcmp("@", (const char *)[v19 methodReturnType]))
          {

            goto LABEL_17;
          }

          id v17 = *v9;
        }

        id v8 = v17;

        if (!v8) {
          goto LABEL_17;
        }
        goto LABEL_3;
      }

      uint64_t v18 = qword_100010770;
      if (qword_100010770 && *(int *)(qword_100010770 + 44) < 3)
      {
LABEL_16:
        uint64_t v9 = 0LL;
        goto LABEL_17;
      }
    }

    else
    {
      uint64_t v18 = qword_100010770;
    }

    MOLogWrite(v18);
    goto LABEL_16;
  }

  uint64_t v7 = v6(v20);
  id v8 = (id)objc_claimAutoreleasedReturnValue(v7);
  uint64_t v9 = 0LL;
  if (v8) {
LABEL_3:
  }
    [v5 setObject:v8 forKey:**(void **)a1];
LABEL_17:
  free(v9);
}

void sub_10000899C(id *a1, void *a2, void *a3, _BYTE *a4)
{
  id v8 = a2;
  id v7 = a3;
  if (([a1[4] containsObject:v8] & 1) == 0
    && ([a1[5] containsObject:v8] & 1) == 0)
  {
    [a1[6] setValue:v7 forKey:v8];
  }

  *a4 = 0;
}

void sub_100008A1C(id a1)
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](&OBJC_CLASS___NSMutableArray, "arrayWithCapacity:", 37LL));
  for (uint64_t i = 0LL; i != 1184; i += 32LL)
    [v4 addObject:**(void **)((char *)&off_100010290 + i)];
  id v2 = [[NSKnownKeysMappingStrategy alloc] initForKeys:v4];
  id v3 = (void *)qword_1000107A8;
  qword_1000107A8 = (uint64_t)v2;
}

void sub_100008AA4(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  id v6 = a2;
  id v7 = a3;
  id v13 = 0LL;
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSData dataWithContentsOfURL:options:error:]( &OBJC_CLASS___NSData,  "dataWithContentsOfURL:options:error:",  v5,  2LL,  &v13));
  id v9 = v13;
  uint64_t v10 = v9;
  if (v8)
  {
    [v6 setObject:v8 forKey:v7];
  }

  else
  {
    if (v9)
    {
      SEL v11 = (void *)objc_claimAutoreleasedReturnValue([v9 domain]);
      if ([v11 isEqualToString:NSCocoaErrorDomain])
      {
        id v12 = [v10 code];

        if (v12 == (id)260) {
          goto LABEL_11;
        }
      }

      else
      {
      }
    }
  }

LABEL_11:
}

void sub_100008BD8(uint64_t a1, uint64_t a2)
{
  int v2 = 138412546;
  uint64_t v3 = a1;
  __int16 v4 = 2112;
  uint64_t v5 = a2;
  _os_log_fault_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_FAULT,  "Unsupported value for %@ : %@",  (uint8_t *)&v2,  0x16u);
}

void sub_100008C60(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  uint64_t v3 = *(void *)(*(void *)(a2 + 56) + 8LL);
  int v4 = 138412802;
  uint64_t v5 = a1;
  __int16 v6 = 2112;
  uint64_t v7 = v2;
  __int16 v8 = 2112;
  uint64_t v9 = v3;
  _os_log_fault_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_FAULT,  "Unsupported uninstall option %@ in %@ (client: %@)",  (uint8_t *)&v4,  0x20u);
}

id objc_msgSend_uninstallAppWithBundleID_options_disposition_error_legacyProgressBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "uninstallAppWithBundleID:options:disposition:error:legacyProgressBlock:");
}
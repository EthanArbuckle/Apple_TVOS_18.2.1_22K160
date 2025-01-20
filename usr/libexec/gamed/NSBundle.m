@interface NSBundle
+ (id)_gkBundleIdentifierFromAuditToken:(id *)a3;
+ (id)_gkBundleIdentifierFromConnection:(id)a3;
+ (id)_gkBundleIdentifierFromPID:(int)a3;
+ (id)_gkBundleIdentifierOrProcessNameForPID:(int)a3;
+ (id)_gkBundleInfoWithPID:(int)a3;
+ (id)_gkBundleWithIdentifier:(id)a3;
+ (id)_gkBundleWithPID:(int)a3;
+ (id)_gkLocalizedMessageFromDictionary:(id)a3 forBundleID:(id)a4;
+ (id)_gkLocalizedMessageFromPushDictionary:(id)a3 forBundleID:(id)a4;
+ (id)executablePathForPid:(int)a3;
+ (id)executableURLForPid:(int)a3;
- (BOOL)_gkIsBadgingEnabled;
- (BOOL)_gkIsGameCenterEnabled;
@end

@implementation NSBundle

+ (id)_gkBundleIdentifierOrProcessNameForPID:(int)a3
{
  id v4 = objc_msgSend((id)objc_opt_class(a1, a2), "executablePathForPid:", *(void *)&a3);
  v5 = (__CFString *)objc_claimAutoreleasedReturnValue(v4);
  if (v5)
  {
    v6 = objc_autoreleasePoolPush();
    v7 = CFURLCreateWithFileSystemPath(0LL, v5, kCFURLPOSIXPathStyle, 0);
    v8 = (const __CFURL *)_CFBundleCopyBundleURLForExecutableURL();
    if (v8)
    {
      v9 = v8;
      v10 = CFBundleCreate(0LL, v8);
      if (v10)
      {
        v11 = v10;
        CFStringRef Identifier = CFBundleGetIdentifier(v10);
        uint64_t v13 = objc_claimAutoreleasedReturnValue(Identifier);
        v14 = (const __CFDictionary *)v13;
        if (!os_log_GKGeneral) {
          id v15 = (id)GKOSLoggers(v13);
        }
        v16 = (os_log_s *)os_log_GKDaemon;
        if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          CFDictionaryRef v32 = v14;
          _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_INFO,  "Getting bundleId from bundleURL %@",  buf,  0xCu);
        }

        CFRelease(v11);
        CFRelease(v9);
        if (v14) {
          goto LABEL_28;
        }
      }

      else
      {
        CFRelease(v9);
      }
    }

    CFDictionaryRef v17 = CFBundleCopyInfoDictionaryForURL(v7);
    if (!v17) {
      goto LABEL_23;
    }
    CFDictionaryRef v18 = v17;
    uint64_t v19 = objc_claimAutoreleasedReturnValue(-[__CFDictionary objectForKey:](v17, "objectForKey:", @"CFBundleIdentifier"));
    v14 = (const __CFDictionary *)v19;
    if (!os_log_GKGeneral) {
      id v20 = (id)GKOSLoggers(v19);
    }
    v21 = (os_log_s *)os_log_GKDaemon;
    if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      CFDictionaryRef v32 = v18;
      _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_INFO,  "Getting bundleId from plist in binary %@",  buf,  0xCu);
    }

    if (!v14)
    {
LABEL_23:
      if (!proc_name(a3, buf, 0x400u)) {
        goto LABEL_24;
      }
      uint64_t v22 = objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", buf));
      v14 = (const __CFDictionary *)v22;
      if (!os_log_GKGeneral) {
        id v23 = (id)GKOSLoggers(v22);
      }
      v24 = (os_log_s *)os_log_GKDaemon;
      if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
      {
        int v29 = 138412290;
        v30 = v14;
        _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_INFO,  "Getting bundleID in debug from pid/procname %@",  (uint8_t *)&v29,  0xCu);
      }

      if (!v14)
      {
LABEL_24:
        uint64_t v25 = objc_claimAutoreleasedReturnValue(-[__CFString lastPathComponent](v5, "lastPathComponent"));
        v14 = (const __CFDictionary *)v25;
        if (!os_log_GKGeneral) {
          id v26 = (id)GKOSLoggers(v25);
        }
        v27 = (os_log_s *)os_log_GKDaemon;
        if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          CFDictionaryRef v32 = v14;
          _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_INFO,  "Getting bundleId from process name %@",  buf,  0xCu);
        }
      }
    }

+ (id)executablePathForPid:(int)a3
{
  int v3 = proc_pidpath(a3, buffer, 0x1000u);
  if (v3 < 1) {
    return 0LL;
  }
  else {
    return  -[NSString initWithBytes:length:encoding:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithBytes:length:encoding:",  buffer,  v3,  4LL);
  }
}

+ (id)executableURLForPid:(int)a3
{
  id v3 = objc_msgSend((id)objc_opt_class(a1, a2), "executablePathForPid:", *(void *)&a3);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  if (v4) {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", v4));
  }
  else {
    v5 = 0LL;
  }

  return v5;
}

+ (id)_gkBundleWithIdentifier:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[GKApplicationWorkspace defaultWorkspace](&OBJC_CLASS___GKApplicationWorkspace, "defaultWorkspace"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 applicationProxyForBundleID:v3]);

  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 bundle]);
  return v6;
}

+ (id)_gkBundleWithPID:(int)a3
{
  id v4 = objc_msgSend((id)objc_opt_class(a1, a2), "executableURLForPid:", *(void *)&a3);
  uint64_t v5 = objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)v5;
  if (v5)
  {
    v7 = (void *)_CFBundleCopyBundleURLForExecutableURL(v5);
    if (v7) {
      v8 = (void *)objc_claimAutoreleasedReturnValue([a1 bundleWithURL:v7]);
    }
    else {
      v8 = 0LL;
    }
  }

  else
  {
    v8 = 0LL;
  }

  return v8;
}

+ (id)_gkBundleInfoWithPID:(int)a3
{
  id v3 = objc_msgSend((id)objc_opt_class(a1, a2), "executableURLForPid:", *(void *)&a3);
  id v4 = (const __CFURL *)objc_claimAutoreleasedReturnValue(v3);
  uint64_t v5 = v4;
  if (v4) {
    CFDictionaryRef v6 = CFBundleCopyInfoDictionaryForURL(v4);
  }
  else {
    CFDictionaryRef v6 = 0LL;
  }

  return v6;
}

+ (id)_gkBundleIdentifierFromPID:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle _gkBundleWithPID:](&OBJC_CLASS___NSBundle, "_gkBundleWithPID:"));
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = objc_claimAutoreleasedReturnValue([v4 bundleIdentifier]);
    v7 = (void *)v6;
    v8 = (os_log_s *)os_log_GKGeneral;
    if (!os_log_GKGeneral)
    {
      id v9 = (id)GKOSLoggers(v6);
      v8 = (os_log_s *)os_log_GKGeneral;
    }

    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      sub_1000AAB08((uint64_t)v7, v8, v10, v11, v12, v13, v14, v15);
    }
  }

  else
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle _gkBundleInfoWithPID:](&OBJC_CLASS___NSBundle, "_gkBundleInfoWithPID:", v3));
    uint64_t v5 = v16;
    if (!v16
      || (uint64_t v17 = objc_claimAutoreleasedReturnValue([v16 objectForKey:@"CFBundleIdentifier"])) == 0)
    {

      v7 = 0LL;
      return v7;
    }

    v7 = (void *)v17;
    CFDictionaryRef v18 = (os_log_s *)os_log_GKGeneral;
    if (!os_log_GKGeneral)
    {
      id v19 = (id)GKOSLoggers(v17);
      CFDictionaryRef v18 = (os_log_s *)os_log_GKGeneral;
    }

    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
      sub_1000AAAA4((uint64_t)v7, v18, v20, v21, v22, v23, v24, v25);
    }
  }

  return v7;
}

+ (id)_gkBundleIdentifierFromAuditToken:(id *)a3
{
  CFErrorRef error = 0LL;
  __int128 v4 = *(_OWORD *)&a3->var0[4];
  *(_OWORD *)token.val = *(_OWORD *)a3->var0;
  *(_OWORD *)&token.val[4] = v4;
  uint64_t v5 = CPCopyBundleIdentifierAndTeamFromAuditToken(&token, &error, 0LL);
  if ((_DWORD)v5)
  {
    uint64_t v6 = error;
    v7 = (os_log_s *)os_log_GKGeneral;
    if (!os_log_GKGeneral)
    {
      id v8 = (id)GKOSLoggers(v5);
      v7 = (os_log_s *)os_log_GKGeneral;
    }

    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      sub_1000AAB6C((uint64_t)v6, v7, v9, v10, v11, v12, v13, v14);
    }
    return v6;
  }

  __int128 v15 = *(_OWORD *)&a3->var0[4];
  *(_OWORD *)token.val = *(_OWORD *)a3->var0;
  *(_OWORD *)&token.val[4] = v15;
  v16 = SecTaskCreateWithAuditToken(0LL, &token);
  if (!v16)
  {
LABEL_14:
    uint64_t v6 = 0LL;
    return v6;
  }

  uint64_t v17 = v16;
  CFErrorRef error = 0LL;
  uint64_t v6 = (void *)SecTaskCopySigningIdentifier(v16, &error);
  CFRelease(v17);
  if (error)
  {
    id v19 = (os_log_s *)os_log_GKGeneral;
    if (!os_log_GKGeneral)
    {
      id v20 = (id)GKOSLoggers(v18);
      id v19 = (os_log_s *)os_log_GKGeneral;
    }

    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      token.val[0] = 138412290;
      *(void *)&token.val[1] = error;
      _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_INFO,  "bundleIdentifierFromAuditToken: SecTaskCopySigningIdentifier() failed %@",  (uint8_t *)&token,  0xCu);
    }

    CFRelease(error);
    goto LABEL_13;
  }

  if (!v6)
  {
LABEL_13:

    goto LABEL_14;
  }

  uint64_t v22 = (os_log_s *)os_log_GKGeneral;
  if (!os_log_GKGeneral)
  {
    id v23 = (id)GKOSLoggers(v18);
    uint64_t v22 = (os_log_s *)os_log_GKGeneral;
  }

  if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
  {
    token.val[0] = 138412290;
    *(void *)&token.val[1] = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_INFO,  "bundleIdentifierFromAuditToken: SecTaskCopySigningIdentifier(): %@",  (uint8_t *)&token,  0xCu);
  }

  return v6;
}

+ (id)_gkBundleIdentifierFromConnection:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4) {
    [v4 auditToken];
  }
  else {
    memset(v9, 0, sizeof(v9));
  }
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([a1 _gkBundleIdentifierFromAuditToken:v9]);
  if (!v6)
  {
    id v7 = [v5 processIdentifier];
    if ((_DWORD)v7) {
      uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([a1 _gkBundleIdentifierFromPID:v7]);
    }
    else {
      uint64_t v6 = 0LL;
    }
  }

  return v6;
}

+ (id)_gkLocalizedMessageFromDictionary:(id)a3 forBundleID:(id)a4
{
  id v5 = a4;
  if (a3)
  {
    id v6 = a3;
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:@"loc-key"]);
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:@"loc-args"]);
    id v9 = (id)objc_claimAutoreleasedReturnValue([v6 objectForKey:@"loc-default"]);

    if (!v9) {
      id v9 = v7;
    }
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 bundleIdentifier]);
    if ([v11 isEqualToString:v5])
    {
    }

    else
    {
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( +[GKApplicationWorkspace defaultWorkspace]( &OBJC_CLASS___GKApplicationWorkspace,  "defaultWorkspace"));
      unsigned int v14 = [v13 applicationIsInstalled:v5];

      if (v14)
      {
        __int128 v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle _gkBundleWithIdentifier:](&OBJC_CLASS___NSBundle, "_gkBundleWithIdentifier:", v5));
LABEL_10:
        v16 = v15;
        uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v15 _gkLocalizedStringForKey:v7 defaultValue:v9 arguments:v8]);

        goto LABEL_11;
      }
    }

    __int128 v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    goto LABEL_10;
  }

  uint64_t v12 = 0LL;
LABEL_11:

  return v12;
}

+ (id)_gkLocalizedMessageFromPushDictionary:(id)a3 forBundleID:(id)a4
{
  id v5 = a4;
  if (a3)
  {
    id v6 = a3;
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"k"]);
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"a"]);
    id v9 = (id)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"d"]);

    if (!v9) {
      id v9 = v7;
    }
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[GKApplicationWorkspace defaultWorkspace](&OBJC_CLASS___GKApplicationWorkspace, "defaultWorkspace"));
    unsigned int v11 = [v10 applicationIsInstalled:v5];

    if (v11
      && (uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle _gkBundleWithIdentifier:](&OBJC_CLASS___NSBundle, "_gkBundleWithIdentifier:", v5))) != 0LL)
    {
      uint64_t v13 = v12;
      id v14 = (id)objc_claimAutoreleasedReturnValue([v12 _gkLocalizedStringForKey:v7 defaultValue:v9 arguments:v8]);
    }

    else
    {
      id v14 = v9;
    }
  }

  else
  {
    id v14 = 0LL;
  }

  return v14;
}

- (BOOL)_gkIsGameCenterEnabled
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NSBundle bundleIdentifier](self, "bundleIdentifier"));
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[GKApplicationWorkspace defaultWorkspace](&OBJC_CLASS___GKApplicationWorkspace, "defaultWorkspace"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 applicationProxyForBundleID:v2]);

  LOBYTE(v3) = [v4 isGameCenterEnabled];
  return (char)v3;
}

- (BOOL)_gkIsBadgingEnabled
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NSBundle infoDictionary](self, "infoDictionary"));
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKey:@"GKGameCenterBadgingDisabled"]);

  if (v3) {
    unsigned int v4 = [v3 BOOLValue] ^ 1;
  }
  else {
    LOBYTE(v4) = 1;
  }

  return v4;
}

@end
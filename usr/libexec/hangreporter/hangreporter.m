id sub_100001D24(void *a1, const __CFUUID *a2, void *a3, void *a4)
{
  CFStringRef v7;
  __CFString *v8;
  __CFString *v9;
  CFStringRef v10;
  BOOL v11;
  CFURLRef v12;
  CFURLRef v13;
  __CFBundle *v14;
  __CFBundle *v15;
  CFStringRef Identifier;
  CFStringRef ValueForInfoDictionaryKey;
  CFURLRef v18;
  CFURLRef v19;
  void *v20;
  unsigned int v21;
  id v22;
  id v23;
  os_log_s *v24;
  os_log_s *v25;
  CFURLRef v26;
  CFURLRef v27;
  CFURLRef v28;
  CFStringRef v29;
  CFStringRef v30;
  id v31;
  id v32;
  id v33;
  os_log_s *v34;
  id v35;
  id v36;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  void *v44;
  BOOL v45;
  int v46;
  CFStringRef v47;
  __CFString *v48;
  CFStringRef v49;
  CFStringRef v50;
  CFStringRef v51;
  CFStringRef v52;
  void *v53;
  NSNumber *v54;
  void *v55;
  __CFString *v56;
  void *v57;
  void *v58;
  void *v59;
  id v60;
  int v62;
  void *v63;
  void *v64;
  void *v65;
  CFStringRef v66;
  CFStringRef v67;
  CFStringRef v68;
  __CFString *v69;
  CFURLRef v70;
  CFStringRef cf;
  CFStringRef cfa;
  id v73;
  id v74;
  void v75[8];
  void v76[8];
  uint8_t buf[4];
  CFURLRef v78;
  __int16 v79;
  id v80;
  v7 = a1;
  v8 = a3;
  v9 = a4;
  if (a2) {
    v10 = CFUUIDCreateString(0LL, a2);
  }
  else {
    v10 = 0LL;
  }
  v69 = v8;
  if (!v8)
  {
    v62 = 0;
    v63 = 0LL;
    v64 = 0LL;
    v65 = 0LL;
    v66 = 0LL;
    v70 = 0LL;
    v29 = 0LL;
    v30 = 0LL;
    v11 = 1LL;
    goto LABEL_43;
  }

  v11 = 1LL;
  v12 = CFURLCreateWithFileSystemPath(0LL, v8, kCFURLPOSIXPathStyle, 1u);
  if (!v12)
  {
    v62 = 0;
    v63 = 0LL;
    v64 = 0LL;
    v65 = 0LL;
    v66 = 0LL;
    v70 = 0LL;
    v29 = 0LL;
    v30 = 0LL;
    goto LABEL_43;
  }

  v13 = v12;
  v67 = v10;
  v14 = (__CFBundle *)_CFBundleCreateWithExecutableURLIfLooksLikeBundle(kCFAllocatorDefault, v12);
  if (!v14)
  {
    CFRelease(v13);
    v62 = 0;
    v63 = 0LL;
    v64 = 0LL;
    v65 = 0LL;
    v66 = 0LL;
    v70 = 0LL;
    v29 = 0LL;
    v30 = 0LL;
    goto LABEL_43;
  }

  v15 = v14;
  Identifier = CFBundleGetIdentifier(v14);
  cf = (const __CFString *)CFBundleGetValueForInfoDictionaryKey(v15, kCFBundleVersionKey);
  ValueForInfoDictionaryKey = (const __CFString *)CFBundleGetValueForInfoDictionaryKey( v15,  _kCFBundleShortVersionStringKey);
  v18 = CFBundleCopyBundleURL(v15);
  if (Identifier) {
    CFRetain(Identifier);
  }
  v66 = Identifier;
  if (cf) {
    CFRetain(cf);
  }
  if (ValueForInfoDictionaryKey) {
    CFRetain(ValueForInfoDictionaryKey);
  }
  CFRelease(v15);
  CFRelease(v13);
  if (v18)
  {
    v19 = v18;
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[__CFURL pathExtension](v19, "pathExtension"));
    v21 = [v20 isEqualToString:@"appex"];

    v70 = v19;
    if (!v21)
    {
      v23 = 0LL;
LABEL_35:
      v73 = v23;
      v11 = 1LL;
      v35 = [[LSApplicationRecord alloc] initWithURL:v19 allowPlaceholder:1 error:&v73];
      v36 = v73;

      if (v35)
      {
        v37 = v36;
        v38 = (void *)objc_claimAutoreleasedReturnValue([v35 iTunesMetadata]);
        v65 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( NSNumber,  "numberWithUnsignedLongLong:",  [v38 storeItemIdentifier]));

        v39 = (void *)objc_claimAutoreleasedReturnValue([v35 iTunesMetadata]);
        v40 = (void *)objc_claimAutoreleasedReturnValue([v39 distributorInfo]);
        v64 = (void *)objc_claimAutoreleasedReturnValue([v40 distributorID]);

        v41 = (void *)objc_claimAutoreleasedReturnValue([v35 iTunesMetadata]);
        v63 = (void *)objc_claimAutoreleasedReturnValue([v41 storeCohortWithError:0]);

        v11 = [v35 developerType] == 1;
        v42 = (void *)objc_claimAutoreleasedReturnValue([v35 entitlements]);
        v43 = [v42 objectForKey:@"beta-reports-active" ofClass:objc_opt_class(NSObject)];
        v8 = v9;
        v44 = (void *)objc_claimAutoreleasedReturnValue(v43);

        v36 = v37;
        v45 = v44 == 0LL;
        v9 = v8;
        v46 = !v45;
        v62 = v46;
      }

      else
      {
        v62 = 0;
        v63 = 0LL;
        v64 = 0LL;
        v65 = 0LL;
      }

      goto LABEL_42;
    }

    v74 = 0LL;
    v22 = [[LSApplicationExtensionRecord alloc] initWithURL:v19 error:&v74];
    v23 = v74;
    if (!v22)
    {
      v31 = sub_1000199EC();
      v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v28 = v70;
        v78 = v70;
        v79 = 2112;
        v80 = v23;
        _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "No extension record for %@: %@",  buf,  0x16u);
      }

      else
      {
        v28 = v70;
      }

      goto LABEL_34;
    }

    v24 = (os_log_s *)objc_claimAutoreleasedReturnValue([v22 containingBundleRecord]);
    v25 = v24;
    if (v24)
    {
      v26 = (const __CFURL *)objc_claimAutoreleasedReturnValue(-[os_log_s URL](v24, "URL"));
      v27 = v26;
      if (v26)
      {
        v27 = v26;

        v28 = v27;
LABEL_33:

LABEL_34:
        v19 = v28;
        goto LABEL_35;
      }

      v33 = sub_1000199EC();
      v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v78 = v70;
        _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "No parent url for %@", buf, 0xCu);
      }
    }

    else
    {
      v32 = sub_1000199EC();
      v27 = (const __CFURL *)objc_claimAutoreleasedReturnValue(v32);
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
      {
        v28 = v70;
        sub_100033768((uint64_t)v70, v27);
        goto LABEL_33;
      }
    }

    v28 = v70;
    goto LABEL_33;
  }

  v62 = 0;
  v63 = 0LL;
  v64 = 0LL;
  v65 = 0LL;
  v70 = 0LL;
  v11 = 1LL;
LABEL_42:
  v10 = v67;
  v29 = ValueForInfoDictionaryKey;
  v30 = cf;
LABEL_43:
  v47 = @"Unknown";
  v48 = (__CFString *)v7;
  if (v7) {
    v47 = v7;
  }
  v75[0] = kCRProblemReportAppNameKey;
  v75[1] = kOSAIPSHeaderAppNameKey;
  v76[0] = v47;
  v76[1] = v47;
  v49 = &stru_100071CD0;
  v50 = v10;
  if (v10) {
    v51 = v10;
  }
  else {
    v51 = &stru_100071CD0;
  }
  v75[2] = @"slice_uuid";
  v75[3] = @"build_version";
  cfa = v30;
  if (v30) {
    v52 = v30;
  }
  else {
    v52 = &stru_100071CD0;
  }
  v76[2] = v51;
  v76[3] = v52;
  v68 = v29;
  if (v29) {
    v49 = v29;
  }
  v76[4] = v49;
  v75[4] = @"app_version";
  v75[5] = @"is_first_party";
  v53 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v11));
  v76[5] = v53;
  v75[6] = @"share_with_app_devs";
  v54 = +[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", AppAnalyticsEnabled());
  v55 = (void *)objc_claimAutoreleasedReturnValue(v54);
  v76[6] = v55;
  v75[7] = kOSAIPSHeaderIncidentIDKey;
  v56 = v9;
  v57 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString objectForKeyedSubscript:](v9, "objectForKeyedSubscript:", @"HangUUID"));
  v58 = v57;
  if (!v57)
  {
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
    v58 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString UUIDString](v8, "UUIDString"));
  }

  v76[7] = v58;
  v59 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v76,  v75,  8LL));
  v60 = [v59 mutableCopy];

  if (!v57)
  {
  }

  if (v66) {
    [v60 setObject:v66 forKeyedSubscript:kCRProblemReportBundleIDKey];
  }
  if (v62)
  {
    [v60 setObject:&__kCFBooleanTrue forKeyedSubscript:@"is_beta"];
    if (v63) {
      [v60 setObject:v63 forKeyedSubscript:@"app_cohort"];
    }
  }

  if (v65) {
    [v60 setObject:v65 forKeyedSubscript:@"adam_id"];
  }
  if (v64) {
    [v60 setObject:v64 forKeyedSubscript:@"distributor_id"];
  }
  if (v50) {
    CFRelease(v50);
  }
  if (v66) {
    CFRelease(v66);
  }
  if (cfa) {
    CFRelease(cfa);
  }
  if (v68) {
    CFRelease(v68);
  }

  return v60;
}

id sub_100002474(int a1)
{
  if (proc_pidpath(a1, buffer, 0x1000u))
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", buffer));
    if (!v2)
    {
      v2 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  buffer,  1LL));
      id v3 = sub_1000199EC();
      v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
      if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
        sub_1000337DC((uint64_t)v2, v4);
      }
    }
  }

  else
  {
    v2 = 0LL;
  }

  return v2;
}

__CFString *sub_100002570(void *a1)
{
  v1 = a1;
  if (v1 && (CFURLRef v2 = CFURLCreateWithFileSystemPath(0LL, v1, kCFURLPOSIXPathStyle, 1u)) != 0LL)
  {
    CFURLRef v3 = v2;
    v4 = (__CFBundle *)_CFBundleCreateWithExecutableURLIfLooksLikeBundle(kCFAllocatorDefault, v2);
    if (v4)
    {
      v5 = v4;
      CFStringRef Identifier = CFBundleGetIdentifier(v4);
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue(Identifier);
      CFRelease(v5);
    }

    else
    {
      v7 = &stru_100071CD0;
    }

    CFRelease(v3);
  }

  else
  {
    v7 = &stru_100071CD0;
  }

  return v7;
}

id sub_100002610(uint64_t a1, uint64_t a2)
{
  CFURLRef v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObject:forKey:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObject:forKey:",  a2,  NSLocalizedDescriptionKey));
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"SentryTailspinError",  a1,  v3));

  return v4;
}

uint64_t sub_100002688(void *a1, int a2)
{
  id v3 = a1;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  char v21 = 0;
  else {
    BOOL v5 = 1;
  }
  if (v5)
  {
    id v6 = sub_1000199EC();
    v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v23 = v3;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "Directory doesn't exist -> trying to create directory at path: %@",  buf,  0xCu);
    }

    if (a2)
    {
      NSFileAttributeKey v26 = NSFileOwnerAccountName;
      v27 = @"mobile";
      v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v27,  &v26,  1LL));
    }

    else
    {
      v8 = 0LL;
    }

    id v20 = 0LL;
    [v4 createDirectoryAtPath:v3 withIntermediateDirectories:1 attributes:v8 error:&v20];
    id v10 = v20;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    unsigned int v12 = [v11 fileExistsAtPath:v3 isDirectory:&v21];

    if (v21) {
      uint64_t v9 = v12;
    }
    else {
      uint64_t v9 = 0LL;
    }
    id v13 = sub_1000199EC();
    v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
    if ((_DWORD)v9 == 1)
    {
      if (v15)
      {
        *(_DWORD *)buf = 138412290;
        id v23 = v3;
        v16 = "Successfully created directory at path %@";
        v17 = v14;
        uint32_t v18 = 12;
LABEL_19:
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, v16, buf, v18);
      }
    }

    else if (v15)
    {
      *(_DWORD *)buf = 138412546;
      id v23 = v3;
      __int16 v24 = 2112;
      id v25 = v10;
      v16 = "Error: error creating directory at path %@ %@";
      v17 = v14;
      uint32_t v18 = 22;
      goto LABEL_19;
    }

    goto LABEL_21;
  }

  uint64_t v9 = 1LL;
LABEL_21:

  return v9;
}

id sub_1000028D0()
{
  if (qword_10007C0F0 != -1) {
    dispatch_once(&qword_10007C0F0, &stru_1000709D0);
  }
  return (id)qword_10007C0E8;
}

void sub_100002910(id a1)
{
  os_log_t v1 = os_log_create("com.apple.hangtracer", "signpost_hang");
  CFURLRef v2 = (void *)qword_10007C0E8;
  qword_10007C0E8 = (uint64_t)v1;
}

id sub_100002940()
{
  if (qword_10007C100 != -1) {
    dispatch_once(&qword_10007C100, &stru_1000709F0);
  }
  return (id)qword_10007C0F8;
}

void sub_100002980(id a1)
{
  os_log_t v1 = os_log_create("com.apple.hangtracer", "hangreporter_tailspin_conversion");
  CFURLRef v2 = (void *)qword_10007C0F8;
  qword_10007C0F8 = (uint64_t)v1;
}

void sub_1000029B0(void *a1, void *a2, os_signpost_id_t a3, uint64_t a4, void *a5)
{
  uint64_t v9 = a1;
  id v10 = a2;
  id v11 = a5;
  mach_get_times(buf, &v18, 0LL);
  uint64_t v12 = v18;
  uint64_t v13 = *(void *)buf;
  if (os_signpost_enabled((os_log_t)v11))
  {
    v14 = (os_log_s *)v11;
    BOOL v15 = v14;
    if (a3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
    {
      v16 = @"Unknown";
      *(_DWORD *)buf = 134349826;
      *(void *)&uint8_t buf[4] = v12 - v13 + a3;
      if (v10) {
        v17 = v10;
      }
      else {
        v17 = @"Unknown";
      }
      __int16 v20 = 2050;
      uint64_t v21 = v12 - v13 + a4;
      __int16 v22 = 2114;
      if (v9) {
        v16 = v9;
      }
      id v23 = v17;
      __int16 v24 = 2114;
      id v25 = v16;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v15,  OS_SIGNPOST_EVENT,  a3,  "HangInterval",  "%{public, signpost.description:begin_time}llu, %{public, signpost.description:end_time}llu, BundleIdOverride=%{p ublic, signpost.description:attribute}@ type=%{public, signpost.telemetry:string2}@ enableTelemetry=YES ",  buf,  0x2Au);
    }
  }
}

__CFString *sub_100002B10(unint64_t a1)
{
  if (a1 <= 0xA) {
    a1 = *off_100070A10[a1];
  }
  return (__CFString *)(id)a1;
}

BOOL sub_100002B40(uint64_t a1)
{
  return (unint64_t)(a1 - 3) < 3;
}

CFStringRef sub_100002B50(unint64_t a1)
{
  if (a1 > 0xB) {
    return @"failed due to unknown reason";
  }
  else {
    return *(&off_100070A68 + a1);
  }
}

uint64_t sub_100002B74(int a1, int a2, double a3)
{
  if (a1)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](&OBJC_CLASS___HTPrefs, "sharedPrefs"));
    double v5 = (double)(unint64_t)[v4 runloopLongHangDurationThresholdMSec];

    if (v5 <= a3)
    {
      return 222LL;
    }

    else
    {
      id v6 = (void *)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](&OBJC_CLASS___HTPrefs, "sharedPrefs"));
      double v7 = (double)(unint64_t)[v6 runloopHangDurationThresholdMSec];

      if (v7 <= a3) {
        return 223LL;
      }
      else {
        return 310LL;
      }
    }
  }

  else if (a2)
  {
    return 328LL;
  }

  else
  {
    return 228LL;
  }
}

uint64_t sub_100002C0C(void *a1)
{
  id v1 = a1;
  if ([v1 containsString:@"UIKit-runloop"])
  {
    uint64_t v2 = 0LL;
  }

  else if ([v1 containsString:@"Fence-hang"])
  {
    uint64_t v2 = 1LL;
  }

  else if ([v1 containsString:@"Slow-Launch"])
  {
    uint64_t v2 = 2LL;
  }

  else if ([v1 containsString:@"Sentry"])
  {
    uint64_t v2 = 3LL;
  }

  else if ([v1 containsString:@"Force-Quit"])
  {
    uint64_t v2 = 4LL;
  }

  else
  {
    uint64_t v2 = 5LL;
  }

  return v2;
}

double sub_100002CD0(unint64_t a1)
{
  double v2 = (double)v6[0] - kCFAbsoluteTimeIntervalSince1970 + (double)v6[1] / 1000000000.0;
  double v3 = sub_100002FAC(v5) / 1000.0;
  return v2 + sub_100002FAC(a1) / 1000.0 - v3;
}

id sub_100002D68(void *a1)
{
  id v1 = a1;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  id v2 = [v1 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v2)
  {
    id v3 = v2;
    v4 = 0LL;
    uint64_t v5 = *(void *)v15;
    unint64_t v6 = -1LL;
    do
    {
      for (i = 0LL; i != v3; i = (char *)i + 1)
      {
        if (*(void *)v15 != v5) {
          objc_enumerationMutation(v1);
        }
        v8 = *(void **)(*((void *)&v14 + 1) + 8LL * (void)i);
        uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:@"StartTime"]);
        id v10 = [v9 longLongValue];

        if (v6 > (unint64_t)v10)
        {
          id v11 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:@"StartTime"]);
          unint64_t v6 = (unint64_t)[v11 longLongValue];

          id v12 = v8;
          v4 = v12;
        }
      }

      id v3 = [v1 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }

    while (v3);
  }

  else
  {
    v4 = 0LL;
  }

  return v4;
}

NSDate *sub_100002ECC(uint64_t a1, void *a2, unint64_t a3)
{
  double v6 = sub_100003060((unint64_t)(v5 * 1000.0));
  return +[NSDate dateWithTimeIntervalSinceReferenceDate:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceReferenceDate:",  sub_100003000((unint64_t)(v6 - (double)a3) + a1));
}

double sub_100002F24()
{
  if (qword_10007C110 != -1) {
    dispatch_once(&qword_10007C110, &stru_100070FB8);
  }
  return *(double *)&qword_10007C108;
}

void sub_100002F64(id a1)
{
  *(double *)&qword_10007C108 = (float)((float)((float)info.numer * 0.000001) / (float)info.denom);
}

double sub_100002FAC(unint64_t a1)
{
  if (qword_10007C110 != -1) {
    dispatch_once(&qword_10007C110, &stru_100070FB8);
  }
  return *(double *)&qword_10007C108 * (double)a1;
}

double sub_100003000(unint64_t a1)
{
  if (qword_10007C110 != -1) {
    dispatch_once(&qword_10007C110, &stru_100070FB8);
  }
  return *(double *)&qword_10007C108 * (double)a1 / 1000.0;
}

double sub_100003060(unint64_t a1)
{
  if (qword_10007C110 != -1) {
    dispatch_once(&qword_10007C110, &stru_100070FB8);
  }
  return (double)a1 / *(double *)&qword_10007C108;
}

uint64_t sub_1000030B4()
{
  if (qword_10007C118 != -1) {
    dispatch_once(&qword_10007C118, &stru_100070FD8);
  }
  return qword_10007C120;
}

void sub_1000030F4(id a1)
{
}

HRFenceInfo *sub_1000033AC(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id v7 = a1;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a2));
  uint64_t v9 = (HRFenceInfo *)objc_claimAutoreleasedReturnValue([v7 objectForKey:v8]);

  if (!v9)
  {
    uint64_t v9 = -[HRFenceInfo initWithFenceName:traceStart:traceEnd:]( objc_alloc(&OBJC_CLASS___HRFenceInfo),  "initWithFenceName:traceStart:traceEnd:",  a2,  a3,  a4);
    id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a2));
    [v7 setObject:v9 forKey:v10];
  }

  return v9;
}

HRHandleInfo *sub_100003474(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  id v11 = a1;
  id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a4));
  uint64_t v13 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue([v11 objectForKey:v12]);

  if (!v13)
  {
    uint64_t v13 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    __int128 v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a4));
    [v11 setObject:v13 forKey:v14];
  }

  __int128 v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a2));
  __int128 v16 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v13, "objectForKey:", v15));

  if (!v16)
  {
    __int128 v16 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    __int128 v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a2));
    -[NSMutableDictionary setObject:forKey:](v13, "setObject:forKey:", v16, v17);
  }

  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a3));
  v19 = (HRHandleInfo *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v16, "objectForKey:", v18));

  if (!v19)
  {
    v19 = -[HRHandleInfo initWithHandleName:fenceName:traceStart:traceEnd:]( objc_alloc(&OBJC_CLASS___HRHandleInfo),  "initWithHandleName:fenceName:traceStart:traceEnd:",  a3,  a2,  a5,  a6);
    __int16 v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a3));
    -[NSMutableDictionary setObject:forKey:](v16, "setObject:forKey:", v19, v20);
  }

  return v19;
}

uint64_t sub_100003628(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  id v6 = a2;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](&OBJC_CLASS___HTPrefs, "sharedPrefs"));
  unsigned int v8 = [v7 shouldSaveTailspins];

  if (v8)
  {
    v75[0] = _NSConcreteStackBlock;
    v75[1] = 3221225472LL;
    v75[2] = sub_100003F1C;
    v75[3] = &unk_100071000;
    id v76 = v6;
    id v9 = v5;
    id v77 = v9;
    id v10 = objc_retainBlock(v75);
    uint64_t v11 = ((uint64_t (*)(void))v10[2])();
    id v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    uint64_t v13 = @"/var/root/Library/Logs/CrashReporter/DiagnosticLogs/HangTracer/";
    __int128 v14 = @"/var/mobile/Library/Logs/CrashReporter/DiagnosticLogs/HangTracer/";
    uint64_t v15 = 0LL;
    if (sub_100002688(v13, 0))
    {
      if (sub_100002688(v14, 1))
      {
        v72 = v14;
        __int128 v16 = (void *)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](&OBJC_CLASS___HTPrefs, "sharedPrefs"));
        unsigned int v17 = [v16 shouldCompressSavedTailspins];

        uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString stringByAppendingPathComponent:](v13, "stringByAppendingPathComponent:", v12));
        v19 = v18;
        v71 = v12;
        if (!v17)
        {
          v34 = (void *)objc_claimAutoreleasedReturnValue([v18 stringByAppendingPathExtension:@"processing"]);

          id v35 = v9;
          v36 = (const char *)[v35 UTF8String];
          id v73 = v34;
          LODWORD(v34) = link(v36, (const char *)[v73 UTF8String]);
          id v37 = sub_1000199EC();
          v38 = (os_log_s *)objc_claimAutoreleasedReturnValue(v37);
          BOOL v39 = os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT);
          if ((_DWORD)v34)
          {
            if (v39)
            {
              v40 = __error();
              v41 = strerror(*v40);
              int errnum = 136315394;
              id v79 = v41;
              __int16 v80 = 2112;
              v81 = (os_log_s *)v35;
              _os_log_impl( (void *)&_mh_execute_header,  v38,  OS_LOG_TYPE_DEFAULT,  "Error: %s creating hardlink for %@",  (uint8_t *)&errnum,  0x16u);
            }

            uint64_t v15 = 0LL;
            goto LABEL_55;
          }

          id v45 = v73;
          if (v39)
          {
            int errnum = 138412546;
            id v79 = v35;
            __int16 v80 = 2112;
            v81 = (os_log_s *)v73;
            _os_log_impl( (void *)&_mh_execute_header,  v38,  OS_LOG_TYPE_DEFAULT,  "Successfully hard-linked tailspin file: %@ -> %@",  (uint8_t *)&errnum,  0x16u);
          }

LABEL_31:
          v38 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[__CFString stringByAppendingPathComponent:](v72, "stringByAppendingPathComponent:", v71));
          if ([v45 containsString:@".gz"])
          {
            uint64_t v46 = objc_claimAutoreleasedReturnValue(-[os_log_s stringByAppendingPathExtension:](v38, "stringByAppendingPathExtension:", @"gz"));

            v38 = (os_log_s *)v46;
          }

          id v47 = sub_1000199EC();
          v48 = (os_log_s *)objc_claimAutoreleasedReturnValue(v47);
          if (os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
          {
            int errnum = 138412546;
            id v79 = v45;
            __int16 v80 = 2112;
            v81 = v38;
            _os_log_impl( (void *)&_mh_execute_header,  v48,  OS_LOG_TYPE_INFO,  "Moving '%@' -> '%@'",  (uint8_t *)&errnum,  0x16u);
          }

          id v49 = v45;
          if (chmod((const char *)[v49 UTF8String], 0x1B6u))
          {
            id v50 = sub_1000199EC();
            v51 = (os_log_s *)objc_claimAutoreleasedReturnValue(v50);
            if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
            {
              int errnum = 138412290;
              id v79 = v9;
              _os_log_impl( (void *)&_mh_execute_header,  v51,  OS_LOG_TYPE_DEFAULT,  "Failed to chmod tailspin file: %@",  (uint8_t *)&errnum,  0xCu);
            }
          }

          v52 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
          id v73 = v49;
          id v74 = 0LL;
          uint64_t v15 = (uint64_t)[v52 moveItemAtPath:v49 toPath:v38 error:&v74];
          id v53 = v74;

          if ((_DWORD)v15)
          {
            if (a3) {
              *a3 = v38;
            }
            id v54 = sub_1000199EC();
            v55 = (os_log_s *)objc_claimAutoreleasedReturnValue(v54);
            if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
            {
              int errnum = 138412546;
              id v79 = v73;
              __int16 v80 = 2112;
              v81 = v38;
              _os_log_impl( (void *)&_mh_execute_header,  v55,  OS_LOG_TYPE_DEFAULT,  "Successful move of tailspin file: %@ -> %@",  (uint8_t *)&errnum,  0x16u);
            }

            v56 = (void *)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](&OBJC_CLASS___HTPrefs, "sharedPrefs"));
            sub_100004034(v72, (uint64_t)[v56 savedTailspinMaxMB]);
          }

          else
          {
            id v59 = sub_1000199EC();
            v56 = (void *)objc_claimAutoreleasedReturnValue(v59);
            if (os_log_type_enabled((os_log_t)v56, OS_LOG_TYPE_DEFAULT))
            {
              int errnum = 138412802;
              id v79 = v73;
              __int16 v80 = 2112;
              v81 = v38;
              __int16 v82 = 2112;
              id v83 = v53;
              _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v56,  OS_LOG_TYPE_DEFAULT,  "Error failed move of tailspin file: %@ -> %@ error: %@",  (uint8_t *)&errnum,  0x20u);
            }
          }

LABEL_55:
          __int128 v14 = v72;
LABEL_56:

          id v12 = v71;
          goto LABEL_57;
        }

        __int16 v20 = (void *)objc_claimAutoreleasedReturnValue([v18 stringByAppendingPathExtension:@"gz.processing"]);

        id v21 = v20;
        __int16 v22 = (const char *)[v21 UTF8String];
        id v23 = v9;
        __filename = (char *)[v23 UTF8String];
        else {
          int v24 = 2;
        }
        int v25 = open_dprotected_np(v22, 514, v24, 0, 416LL);
        id v73 = v21;
        v69 = v23;
        if (v25 < 0)
        {
          id v42 = sub_1000199EC();
          v43 = (os_log_s *)objc_claimAutoreleasedReturnValue(v42);
          if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
          {
            int errnum = 136315138;
            id v79 = (id)v22;
            v44 = "Error getting file descriptor for %s due to protection classes";
LABEL_47:
            _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEFAULT, v44, (uint8_t *)&errnum, 0xCu);
          }
        }

        else
        {
          file = gzdopen(v25, "wb");
          if (file)
          {
            NSFileAttributeKey v26 = fopen(__filename, "rb");
            if (v26)
            {
              v27 = v26;
              v28 = malloc(0x4000uLL);
              if (v28)
              {
                v29 = v28;
                while (1)
                {
                  unsigned int v30 = fread(v29, 1uLL, 0x4000uLL, v27);
                  if (!v30) {
                    break;
                  }
                  if (gzwrite(file, v29, v30) != v30)
                  {
                    int errnum = 0;
                    gzerror(file, &errnum);
                    if (errnum == -1)
                    {
                      v31 = __error();
                      strerror(*v31);
                    }

                    id v32 = sub_1000199EC();
                    v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
                    if (os_log_type_enabled(v33, OS_LOG_TYPE_FAULT)) {
                      sub_100033850();
                    }

                    gzclose(file);
                    fclose(v27);
                    free(v29);
                    goto LABEL_49;
                  }
                }

                gzclose(file);
                fclose(v27);
                free(v29);
                id v65 = sub_1000199EC();
                v66 = (os_log_s *)objc_claimAutoreleasedReturnValue(v65);
                if (os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT))
                {
                  int errnum = 138412546;
                  id v79 = v69;
                  __int16 v80 = 2112;
                  v81 = (os_log_s *)v73;
                  _os_log_impl( (void *)&_mh_execute_header,  v66,  OS_LOG_TYPE_DEFAULT,  "Successfully compressed tailspin file: %@ -> %@",  (uint8_t *)&errnum,  0x16u);
                }

                v67 = (const char *)[v69 UTF8String];
                id v45 = v73;
                sub_100019E9C(v67, (char *)[v45 UTF8String]);
                goto LABEL_31;
              }

              id v63 = sub_1000199EC();
              v64 = (os_log_s *)objc_claimAutoreleasedReturnValue(v63);
              if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
              {
                int errnum = 136315138;
                id v79 = __filename;
                _os_log_impl( (void *)&_mh_execute_header,  v64,  OS_LOG_TYPE_DEFAULT,  "unable to allocate memory for compressing tailspin file %s",  (uint8_t *)&errnum,  0xCu);
              }

              gzclose(file);
              fclose(v27);
            }

            else
            {
              id v61 = sub_1000199EC();
              v62 = (os_log_s *)objc_claimAutoreleasedReturnValue(v61);
              if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
              {
                int errnum = 136315138;
                id v79 = __filename;
                _os_log_impl( (void *)&_mh_execute_header,  v62,  OS_LOG_TYPE_DEFAULT,  "Error with opening tailspin file %s",  (uint8_t *)&errnum,  0xCu);
              }

              gzclose(file);
            }

LABEL_49:
            id v58 = sub_1000199EC();
            v38 = (os_log_s *)objc_claimAutoreleasedReturnValue(v58);
            __int128 v14 = v72;
            if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
            {
              int errnum = 138412290;
              id v79 = v69;
              _os_log_impl( (void *)&_mh_execute_header,  v38,  OS_LOG_TYPE_DEFAULT,  "Error: error creating compressed file for %@, stop processing",  (uint8_t *)&errnum,  0xCu);
            }

            uint64_t v15 = 0LL;
            goto LABEL_56;
          }

          id v57 = sub_1000199EC();
          v43 = (os_log_s *)objc_claimAutoreleasedReturnValue(v57);
          if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
          {
            int errnum = 136315138;
            id v79 = (id)v22;
            v44 = "Error with gzopen() for %s";
            goto LABEL_47;
          }
        }

        goto LABEL_49;
      }

      uint64_t v15 = 0LL;
    }

LABEL_57:
    goto LABEL_58;
  }

  uint64_t v15 = 1LL;
LABEL_58:

  return v15;
}

id sub_100003F1C(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  if (v2)
  {
    id v3 = sub_100003FAC(v2);
    v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  }

  else
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) lastPathComponent]);
    id v6 = [v5 rangeOfString:@"processing.tailspin" options:12];
    v4 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v5,  "stringByReplacingOccurrencesOfString:withString:options:range:",  @"processing.tailspin",  @"tailspin",  12,  v6,  v7));
  }

  return v4;
}

id sub_100003FAC(void *a1)
{
  id v1 = (void *)objc_claimAutoreleasedReturnValue([a1 lastPathComponent]);
  if ([v1 characterAtIndex:0] == 46)
  {
    uint64_t v2 = objc_claimAutoreleasedReturnValue([v1 substringFromIndex:1]);

    id v1 = (void *)v2;
  }

  id v3 = (void *)objc_claimAutoreleasedReturnValue([v1 stringByDeletingPathExtension]);
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 stringByAppendingPathExtension:@"tailspin"]);

  return v4;
}

void sub_100004034(void *a1, uint64_t a2)
{
  id v3 = a1;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v3));
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:",  NSURLPathKey,  NSURLCreationDateKey,  NSURLTotalFileSizeKey,  0LL));
  v62[0] = _NSConcreteStackBlock;
  v62[1] = 3221225472LL;
  v62[2] = sub_100006440;
  v62[3] = &unk_100071068;
  id v7 = v3;
  id v63 = v7;
  uint64_t v46 = v4;
  unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue([v4 enumeratorAtURL:v5 includingPropertiesForKeys:v6 options:4 errorHandler:v62]);

  v48 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  __int128 v58 = 0u;
  __int128 v59 = 0u;
  __int128 v60 = 0u;
  __int128 v61 = 0u;
  id v9 = v8;
  id v10 = [v9 countByEnumeratingWithState:&v58 objects:v69 count:16];
  id obj = v9;
  if (!v10)
  {
LABEL_37:

    goto LABEL_38;
  }

  id v11 = v10;
  id v44 = v7;
  unint64_t v12 = 0LL;
  unint64_t v47 = a2 << 20;
  uint64_t v13 = *(void *)v59;
  while (2)
  {
    for (i = 0LL; i != v11; i = (char *)i + 1)
    {
      if (*(void *)v59 != v13) {
        objc_enumerationMutation(obj);
      }
      uint64_t v15 = *(void **)(*((void *)&v58 + 1) + 8LL * (void)i);
      __int128 v16 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v48, "objectForKey:", v15));

      if (!v16)
      {
        id v56 = 0LL;
        id v57 = 0LL;
        uint64_t v17 = [v15 getResourceValue:&v57 forKey:NSURLCreationDateKey error:&v56];
        id v18 = v57;
        id v19 = v56;
        if ((v17 & 1) != 0)
        {
          id v54 = 0LL;
          id v55 = 0LL;
          unsigned __int8 v20 = [v15 getResourceValue:&v55 forKey:NSURLTotalFileSizeKey error:&v54];
          id v21 = v55;
          id v22 = v54;

          if ((v20 & 1) != 0)
          {
            v12 += (unint64_t)[v21 unsignedLongValue];
            id v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjectsAndKeys:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjectsAndKeys:",  v15,  @"url",  v18,  @"date",  v21,  @"size",  0LL));
            -[NSMutableDictionary setObject:forKey:](v48, "setObject:forKey:", v23, v15);

            continue;
          }

          id v27 = sub_1000199EC();
          int v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
          {
            v28 = (void *)objc_claimAutoreleasedReturnValue([v22 localizedDescription]);
            *(_DWORD *)buf = 138412546;
            v66 = v15;
            __int16 v67 = 2112;
            v68 = v28;
            _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "Error getting file size for %@: %@",  buf,  0x16u);
          }

          id v19 = v22;
        }

        else
        {
          id v24 = sub_1000199EC();
          int v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
          {
            NSFileAttributeKey v26 = (void *)objc_claimAutoreleasedReturnValue([v19 localizedDescription]);
            *(_DWORD *)buf = 138412546;
            v66 = v15;
            __int16 v67 = 2112;
            v68 = v26;
            _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "Error getting file creation date for %@: %@",  buf,  0x16u);
          }

          id v21 = 0LL;
        }

        goto LABEL_20;
      }
    }

    id v11 = [obj countByEnumeratingWithState:&v58 objects:v69 count:16];
    if (v11) {
      continue;
    }
    break;
  }

LABEL_20:
  BOOL v29 = v12 > v47;
  id v7 = v44;
  if (v29)
  {
    id v9 = (id)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary keysSortedByValueUsingComparator:]( v48,  "keysSortedByValueUsingComparator:",  &stru_1000710A8));
    __int128 v50 = 0u;
    __int128 v51 = 0u;
    __int128 v52 = 0u;
    __int128 v53 = 0u;
    id v30 = [v9 countByEnumeratingWithState:&v50 objects:v64 count:16];
    if (v30)
    {
      id v31 = v30;
      unint64_t v32 = 0LL;
      uint64_t v33 = *(void *)v51;
      do
      {
        for (j = 0LL; j != v31; j = (char *)j + 1)
        {
          if (*(void *)v51 != v33) {
            objc_enumerationMutation(v9);
          }
          id v35 = *(void **)(*((void *)&v50 + 1) + 8LL * (void)j);
          v36 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v48, "objectForKey:", v35));
          id v37 = (void *)objc_claimAutoreleasedReturnValue([v36 objectForKey:@"size"]);
          v32 += (unint64_t)[v37 unsignedLongValue];

          if (v32 > v47)
          {
            id v49 = 0LL;
            unsigned __int8 v38 = [v46 removeItemAtURL:v35 error:&v49];
            id v39 = v49;
            id v40 = sub_1000199EC();
            v41 = (os_log_s *)objc_claimAutoreleasedReturnValue(v40);
            id v42 = v41;
            if ((v38 & 1) != 0)
            {
              if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412290;
                v66 = v35;
                _os_log_impl( (void *)&_mh_execute_header,  v42,  OS_LOG_TYPE_INFO,  "Successful removal of tailspin file to reduce disk space: %@",  buf,  0xCu);
              }
            }

            else if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
            {
              v43 = (void *)objc_claimAutoreleasedReturnValue([v39 localizedDescription]);
              *(_DWORD *)buf = 138412546;
              v66 = v35;
              __int16 v67 = 2112;
              v68 = v43;
              _os_log_impl( (void *)&_mh_execute_header,  v42,  OS_LOG_TYPE_DEFAULT,  "Error: failed removal of tailspin file to reduce disk space: %@ error: %@",  buf,  0x16u);
            }
          }
        }

        id v31 = [v9 countByEnumeratingWithState:&v50 objects:v64 count:16];
      }

      while (v31);
      id v7 = v44;
    }

    goto LABEL_37;
  }

LABEL_38:
}

void sub_10000463C(void *a1)
{
  id v1 = a1;
  id v2 = sub_1000199EC();
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_1000338F0();
  }

  id v4 = v1;
  id v5 = (char *)[v4 UTF8String];
  id v63 = 0LL;
  id v6 = sub_1000119D8(v5, &v63);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  id v8 = v63;
  if (v7)
  {
    if ([v7 count] == (id)1)
    {
      id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 objectAtIndex:0]);
      id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:off_10007BAF0]);
      id v11 = v10;
      if (!v10)
      {
        id v37 = sub_1000199EC();
        unsigned __int8 v38 = (os_log_s *)objc_claimAutoreleasedReturnValue(v37);
        if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)id v73 = 0;
          _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "Report type field is missing", v73, 2u);
        }

        id v39 = sub_100002610(5LL, (uint64_t)@"Report type field is missing, failed to process request");
        id v40 = (void *)objc_claimAutoreleasedReturnValue(v39);

        sub_100004CE0(0LL, 0LL, v40);
        unlink(v5);
        id v36 = 0LL;
        id v8 = v40;
        goto LABEL_49;
      }

      if ([v10 isEqualToString:off_10007BB00])
      {
        id v55 = v11;
        id v57 = v8;
        __int128 v58 = v5;
        __int128 v59 = v7;
        id v60 = v4;
        id v12 = v4;
        id v56 = v9;
        id v54 = v9;
        uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
        id v14 = [[SASampleStore alloc] initForFileParsing];
        [v14 setShouldGatherKextStat:0];
        [v14 setDataGatheringOptions:7];
        id v15 = v12;
        id v16 = [v15 UTF8String];
        id v68 = 0LL;
        [v14 parseKTraceFile:v16 warningsOut:v13 errorOut:&v68];
        __int128 v61 = (__CFString *)v68;
        __int128 v64 = 0u;
        __int128 v65 = 0u;
        __int128 v66 = 0u;
        __int128 v67 = 0u;
        id v17 = v13;
        id v18 = [v17 countByEnumeratingWithState:&v64 objects:v73 count:16];
        if (v18)
        {
          id v19 = v18;
          uint64_t v20 = *(void *)v65;
          do
          {
            for (i = 0LL; i != v19; i = (char *)i + 1)
            {
              if (*(void *)v65 != v20) {
                objc_enumerationMutation(v17);
              }
              id v22 = *(const __CFString **)(*((void *)&v64 + 1) + 8LL * (void)i);
              id v23 = sub_1000199EC();
              id v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
              if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412546;
                id v70 = v15;
                __int16 v71 = 2112;
                v72 = v22;
                _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "WARNING trying to create sample store from %@: %@\n",  buf,  0x16u);
              }
            }

            id v19 = [v17 countByEnumeratingWithState:&v64 objects:v73 count:16];
          }

          while (v19);
        }

        int v25 = v14;
        if (v14)
        {
          NSFileAttributeKey v26 = v54;
          id v27 = sub_1000065A4(v15, v14, v54, 0);
          v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
          id v7 = v59;
          id v4 = v60;
          id v8 = v57;
          id v5 = v58;
          id v11 = v55;
        }

        else
        {
          id v41 = sub_1000199EC();
          id v42 = (os_log_s *)objc_claimAutoreleasedReturnValue(v41);
          id v7 = v59;
          NSFileAttributeKey v26 = v54;
          id v11 = v55;
          if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
          {
            v43 = @"Unknown error";
            if (v61) {
              v43 = v61;
            }
            *(_DWORD *)buf = 138412546;
            id v70 = v15;
            __int16 v71 = 2112;
            v72 = v43;
            _os_log_impl( (void *)&_mh_execute_header,  v42,  OS_LOG_TYPE_DEFAULT,  "ERROR trying to create sample store from %@: %@\n",  buf,  0x16u);
          }

          v28 = 0LL;
          id v4 = v60;
          id v8 = v57;
          id v5 = v58;
        }

        id v9 = v56;
      }

      id v44 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:off_10007BAE0]);
      id v45 = sub_1000199EC();
      uint64_t v46 = (os_log_s *)objc_claimAutoreleasedReturnValue(v45);
      unint64_t v47 = v46;
      if (v44)
      {
        if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG)) {
          sub_1000338C4();
        }

        id v62 = 0LL;
        sub_100003628(v4, 0LL, &v62);
        id v36 = v62;
        id v48 = sub_1000199EC();
        id v49 = (os_log_s *)objc_claimAutoreleasedReturnValue(v48);
        BOOL v50 = os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT);
        if (v36)
        {
          if (v50)
          {
            *(_WORD *)id v73 = 0;
            _os_log_impl( (void *)&_mh_execute_header,  v49,  OS_LOG_TYPE_DEFAULT,  "Successfully parsed and moved tailspin file. Posting filePath to Sentry",  v73,  2u);
          }

          sub_100004CE0(v36, v44, 0LL);
          goto LABEL_48;
        }

        if (v50)
        {
          *(_DWORD *)id v73 = 138412290;
          id v74 = v4;
          _os_log_impl( (void *)&_mh_execute_header,  v49,  OS_LOG_TYPE_DEFAULT,  "Error trying to move Sentry tailspin from %@",  v73,  0xCu);
        }

        id v53 = sub_100002610(5LL, (uint64_t)@"Failed to move Sentry tailspin from spool directory");
        __int128 v52 = (void *)objc_claimAutoreleasedReturnValue(v53);

        sub_100004CE0(0LL, v44, v52);
      }

      else
      {
        if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)id v73 = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v47,  OS_LOG_TYPE_DEFAULT,  "Failed to get reference number from reason dictionary. Reference number won't be included",  v73,  2u);
        }

        id v51 = sub_100002610( 5LL,  (uint64_t)@"Failed to get reference number from reason dictionary. Reference number won't be included");
        __int128 v52 = (void *)objc_claimAutoreleasedReturnValue(v51);

        sub_100004CE0(0LL, 0LL, v52);
        id v36 = 0LL;
      }

      id v8 = v52;
LABEL_48:
      unlink(v5);

LABEL_49:
      id v35 = v8;
      goto LABEL_50;
    }

    id v32 = sub_1000199EC();
    uint64_t v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v73 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v33,  OS_LOG_TYPE_DEFAULT,  "Tailspin unexpectledly contains more than one hang",  v73,  2u);
    }

    id v31 = @"Error, tailspin unexpectledly contains more than one hang. Reference number won't be included";
  }

  else
  {
    id v29 = sub_1000199EC();
    id v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v73 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_DEFAULT,  "Failed to parse tailspin reasonString into a dictionary",  v73,  2u);
    }

    id v31 = @"Failed to parse reasonString into a dictionary. Reference number won't be included";
  }

  id v34 = sub_100002610(5LL, (uint64_t)v31);
  id v35 = (void *)objc_claimAutoreleasedReturnValue(v34);

  sub_100004CE0(0LL, 0LL, v35);
  unlink(v5);
  id v36 = 0LL;
LABEL_50:
}

void sub_100004CE0(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  id v6 = a2;
  id v7 = a3;
  id v8 = v7;
  if (v7)
  {
    if (!v6)
    {
      uint64_t v18 = off_10007BB18;
      id v19 = v7;
      id v9 = &v19;
      id v10 = &v18;
      uint64_t v11 = 1LL;
      goto LABEL_9;
    }

    v16[0] = off_10007BAE0;
    v16[1] = off_10007BB18;
    v17[0] = v6;
    v17[1] = v7;
    id v9 = (id *)v17;
    id v10 = v16;
  }

  else
  {
    if (!v6) {
      sub_10003391C();
    }
    if (!v5) {
      sub_100033944();
    }
    v14[0] = off_10007BAE0;
    v14[1] = off_10007BB10;
    v15[0] = v6;
    v15[1] = v5;
    id v9 = (id *)v15;
    id v10 = v14;
  }

  uint64_t v11 = 2LL;
LABEL_9:
  id v12 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v9,  v10,  v11));
  DistributedCenter = CFNotificationCenterGetDistributedCenter();
  CFNotificationCenterPostNotification(DistributedCenter, off_10007BAD8, 0LL, v12, 1u);
}

void sub_100004E38()
{
  unsigned int v0 = 0;
  do
  {
    dword_10007C128 = 0;
    nftw( "/var/root/Library/Caches/hangtracerd/spool",  (int (__cdecl *)(const char *, const stat *, int, FTW *))sub_100005990,  1,  3);
    if (v0 > 3) {
      break;
    }
    ++v0;
  }

  while (dword_10007C128 > 0);
  id v1 = &ADClientAddValueForScalarKey_ptr;
  id v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  id v89 = 0LL;
  id v3 = (void *)objc_claimAutoreleasedReturnValue( [v2 contentsOfDirectoryAtPath:@"/var/mobile/Library/Caches/com.apple.backboardd/spool" error:&v89]);
  id v4 = v89;

  if (!v4)
  {
    __int128 v87 = 0u;
    __int128 v88 = 0u;
    __int128 v85 = 0u;
    __int128 v86 = 0u;
    id v12 = v3;
    id v13 = [v12 countByEnumeratingWithState:&v85 objects:v93 count:16];
    if (!v13) {
      goto LABEL_80;
    }
    id v14 = v13;
    uint64_t v15 = *(void *)v86;
    id v78 = v12;
    while (1)
    {
      id v16 = 0LL;
      do
      {
        if (*(void *)v86 != v15) {
          objc_enumerationMutation(v12);
        }
        id v17 = *(void **)(*((void *)&v85 + 1) + 8LL * (void)v16);
        uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v17 pathExtension]);
        unsigned __int8 v19 = [v18 isEqualToString:@"tailspin"];

        if ((v19 & 1) == 0)
        {
          id v27 = sub_1000199EC();
          uint64_t v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
          {
            LODWORD(buf[0]) = 138543362;
            *(void *)((char *)buf + 4) = v17;
            _os_log_debug_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEBUG,  "Skipping non-tailspin file: %{public}@",  (uint8_t *)buf,  0xCu);
          }

          goto LABEL_47;
        }

        uint64_t v20 = (os_log_s *)objc_claimAutoreleasedReturnValue( [@"/var/mobile/Library/Caches/com.apple.backboardd/spool" stringByAppendingPathComponent:v17]);
        id v21 = (void *)objc_claimAutoreleasedReturnValue([v1[55] defaultManager]);
        unsigned int v22 = [v21 fileExistsAtPath:v20 isDirectory:&v84];
        int v23 = v84;

        if (v22) {
          BOOL v24 = v23 == 0;
        }
        else {
          BOOL v24 = 0;
        }
        if (v24)
        {
          v81 = objc_autoreleasePoolPush();
          v28 = v20;
          context = objc_autoreleasePoolPush();
          id v29 = sub_1000199EC();
          id v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
          if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
          {
            LODWORD(buf[0]) = 138412290;
            *(void *)((char *)buf + 4) = v28;
            _os_log_debug_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_DEBUG,  "Started processing %@",  (uint8_t *)buf,  0xCu);
          }

          __int16 v82 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s lastPathComponent](v28, "lastPathComponent"));
          id v79 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(@"processing_", "stringByAppendingString:"));
          uint64_t v31 = objc_claimAutoreleasedReturnValue( objc_msgSend( @"/var/mobile/Library/Caches/com.apple.backboardd/spool",  "stringByAppendingPathComponent:"));
          id v32 = (void *)objc_claimAutoreleasedReturnValue([v1[55] defaultManager]);
          id v92 = 0LL;
          uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue([v32 attributesOfItemAtPath:v28 error:&v92]);
          id v34 = v92;

          id v83 = (__CFString *)v31;
          if (!v33 || v34)
          {
            id v39 = sub_1000199EC();
            unsigned __int8 v38 = (os_log_s *)objc_claimAutoreleasedReturnValue(v39);
            if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v40 = objc_claimAutoreleasedReturnValue([v34 localizedDescription]);
              id v41 = (void *)v40;
              LODWORD(buf[0]) = 138412546;
              id v42 = @"Unknown";
              if (v40) {
                id v42 = (const __CFString *)v40;
              }
              *(void *)((char *)buf + 4) = v28;
              WORD2(buf[1]) = 2112;
              *(void *)((char *)&buf[1] + 6) = v42;
              _os_log_impl( (void *)&_mh_execute_header,  v38,  OS_LOG_TYPE_DEFAULT,  "Could not get attributes of '%@' due to error %@. Attempting to remove the file.",  (uint8_t *)buf,  0x16u);
            }

LABEL_39:
            v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
            [v43 removeItemAtPath:v28 error:0];
LABEL_40:
          }

          else
          {
            id v35 = [v33 fileSize];
            if ((unint64_t)v35 >= 0x1400001)
            {
              id v36 = v35;
              id v37 = sub_1000199EC();
              unsigned __int8 v38 = (os_log_s *)objc_claimAutoreleasedReturnValue(v37);
              if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
              {
                LODWORD(buf[0]) = 138412802;
                *(void *)((char *)buf + 4) = v28;
                WORD2(buf[1]) = 2048;
                *(void *)((char *)&buf[1] + 6) = v36;
                HIWORD(buf[2]) = 2048;
                uint64_t v101 = 20971520LL;
                _os_log_impl( (void *)&_mh_execute_header,  v38,  OS_LOG_TYPE_DEFAULT,  "Encountered tailspin file '%@' of size %lluB (> cap of %lluB). Attempting to remove the file.",  (uint8_t *)buf,  0x20u);
              }

              goto LABEL_39;
            }

            id v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
            id v91 = 0LL;
            unsigned int v49 = [v48 moveItemAtPath:v28 toPath:v31 error:&v91];
            id v34 = v91;

            if (v49 && !v34)
            {
              BOOL v50 = (void *)objc_claimAutoreleasedReturnValue( +[NSFileHandle fileHandleForReadingAtPath:]( &OBJC_CLASS___NSFileHandle,  "fileHandleForReadingAtPath:",  v83));
              uint64_t v33 = v50;
              if (!v50)
              {
                __int128 v59 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
                [v59 removeItemAtPath:v83 error:0];

                id v60 = sub_1000199EC();
                id v51 = (os_log_s *)objc_claimAutoreleasedReturnValue(v60);
                if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
                {
                  LODWORD(buf[0]) = 138412290;
                  *(void *)((char *)buf + 4) = v83;
                  __int128 v61 = (uint8_t *)buf;
                  id v62 = v51;
                  id v63 = "Could not open %@ for reading. Attempting to remove the file.";
                  uint32_t v64 = 12;
                  goto LABEL_71;
                }

LABEL_72:
                unsigned __int8 v44 = 0;
                goto LABEL_78;
              }

              buf[0] = _NSConcreteStackBlock;
              buf[1] = 3221225472LL;
              buf[2] = sub_10000E4C8;
              uint64_t v101 = (uint64_t)&unk_100071388;
              id v102 = v50;
              if ((OSAWriteLogForSubmission(@"302", v82, 0LL, 0LL, buf) & 1) != 0)
              {

                if ((sub_100002688(@"/var/mobile/Library/Logs/CrashReporter/DiagnosticLogs/CoreAnimation/", 1) & 1) != 0)
                {
                  id v51 = (os_log_s *)objc_claimAutoreleasedReturnValue( [@"/var/mobile/Library/Logs/CrashReporter/DiagnosticLogs/CoreAnimation/" stringByAppendingPathComponent:v82]);
                  __int128 v52 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
                  id v90 = 0LL;
                  unsigned __int8 v44 = [v52 moveItemAtPath:v83 toPath:v51 error:&v90];
                  id v77 = v90;
                  if (v77) {
                    unsigned __int8 v44 = 0;
                  }

                  if ((v44 & 1) != 0)
                  {
                    id v53 = sub_1000199EC();
                    id v54 = (os_log_s *)objc_claimAutoreleasedReturnValue(v53);
                    if (os_log_type_enabled(v54, OS_LOG_TYPE_DEBUG))
                    {
                      int v94 = 138412546;
                      v95 = (const __CFString *)v28;
                      __int16 v96 = 2112;
                      v97 = v51;
                      _os_log_debug_impl( (void *)&_mh_execute_header,  v54,  OS_LOG_TYPE_DEBUG,  "Finished processing successfully %@. Final destination for file is %@",  (uint8_t *)&v94,  0x16u);
                    }
                  }

                  else
                  {
                    id v70 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
                    [v70 removeItemAtPath:v83 error:0];

                    id v71 = sub_1000199EC();
                    id v54 = (os_log_s *)objc_claimAutoreleasedReturnValue(v71);
                    if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
                    {
                      uint64_t v72 = objc_claimAutoreleasedReturnValue([v77 localizedDescription]);
                      id v76 = (void *)v72;
                      int v94 = 138543874;
                      id v73 = @"Unknown";
                      if (v72) {
                        id v73 = (const __CFString *)v72;
                      }
                      v95 = v83;
                      __int16 v96 = 2114;
                      v97 = v51;
                      __int16 v98 = 2112;
                      v99 = v73;
                      _os_log_impl( (void *)&_mh_execute_header,  v54,  OS_LOG_TYPE_DEFAULT,  "Could not rename %{public}@ to %{public}@ due to error %@. Attempting to remove the file",  (uint8_t *)&v94,  0x20u);
                    }
                  }

                  goto LABEL_78;
                }

                id v68 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
                [v68 removeItemAtPath:v83 error:0];

                id v69 = sub_1000199EC();
                id v51 = (os_log_s *)objc_claimAutoreleasedReturnValue(v69);
                if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
                {
                  int v94 = 138412546;
                  v95 = @"/var/mobile/Library/Logs/CrashReporter/DiagnosticLogs/CoreAnimation/";
                  __int16 v96 = 2112;
                  v97 = (os_log_s *)v83;
                  __int128 v61 = (uint8_t *)&v94;
                  id v62 = v51;
                  id v63 = "Could not create %@. Removing %@ rather than letting it persist.";
                  uint32_t v64 = 22;
LABEL_71:
                  _os_log_impl((void *)&_mh_execute_header, v62, OS_LOG_TYPE_DEFAULT, v63, v61, v64);
                }

                goto LABEL_72;
              }

              __int128 v65 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
              [v65 removeItemAtPath:v83 error:0];

              id v66 = sub_1000199EC();
              __int128 v67 = (os_log_s *)objc_claimAutoreleasedReturnValue(v66);
              if (os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT))
              {
                int v94 = 138412290;
                v95 = v83;
                _os_log_impl( (void *)&_mh_execute_header,  v67,  OS_LOG_TYPE_DEFAULT,  "Failed to write binary data for IPS file creation. Removing %@",  (uint8_t *)&v94,  0xCu);
              }

              unsigned __int8 v44 = 0;
              id v51 = (os_log_s *)v102;
LABEL_78:
              id v45 = v81;

              id v34 = 0LL;
LABEL_42:

              objc_autoreleasePoolPop(context);
              id v1 = &ADClientAddValueForScalarKey_ptr;
              if ((v44 & 1) == 0)
              {
                id v46 = sub_1000199EC();
                unint64_t v47 = (os_log_s *)objc_claimAutoreleasedReturnValue(v46);
                if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
                {
                  LODWORD(buf[0]) = 138412290;
                  *(void *)((char *)buf + 4) = v28;
                  _os_log_impl( (void *)&_mh_execute_header,  v47,  OS_LOG_TYPE_DEFAULT,  "Encountered error trying to procesxs %@",  (uint8_t *)buf,  0xCu);
                }
              }

              objc_autoreleasePoolPop(v45);
              id v12 = v78;
              goto LABEL_47;
            }

            id v55 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
            [v55 removeItemAtPath:v28 error:0];

            id v56 = sub_1000199EC();
            uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue(v56);
            if (os_log_type_enabled((os_log_t)v33, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v57 = objc_claimAutoreleasedReturnValue([v34 localizedDescription]);
              v43 = (void *)v57;
              LODWORD(buf[0]) = 138543874;
              __int128 v58 = @"Unknown";
              if (v57) {
                __int128 v58 = (const __CFString *)v57;
              }
              *(void *)((char *)buf + 4) = v28;
              WORD2(buf[1]) = 2114;
              *(void *)((char *)&buf[1] + 6) = v83;
              HIWORD(buf[2]) = 2112;
              uint64_t v101 = (uint64_t)v58;
              _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v33,  OS_LOG_TYPE_DEFAULT,  "Could not rename %{public}@ to %{public}@ due to error %@. Attempting to remove the file.",  (uint8_t *)buf,  0x20u);
              goto LABEL_40;
            }
          }

          unsigned __int8 v44 = 0;
          id v45 = v81;
          goto LABEL_42;
        }

        id v25 = sub_1000199EC();
        NSFileAttributeKey v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
        {
          LODWORD(buf[0]) = 138412290;
          *(void *)((char *)buf + 4) = v20;
          _os_log_debug_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEBUG,  "Skipping directory with .tailspin extension: %@",  (uint8_t *)buf,  0xCu);
        }

LABEL_47:
LABEL_48:
        id v16 = (char *)v16 + 1;
      }

      while (v14 != v16);
      id v74 = [v12 countByEnumeratingWithState:&v85 objects:v93 count:16];
      id v14 = v74;
      if (!v74)
      {
LABEL_80:

        v75 = (void *)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](&OBJC_CLASS___HTPrefs, "sharedPrefs"));
        sub_100004034( @"/var/mobile/Library/Logs/CrashReporter/DiagnosticLogs/CoreAnimation/",  (uint64_t)[v75 savedTailspinMaxMB]);

        return;
      }
    }
  }

  id v5 = sub_1000199EC();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    uint64_t v7 = objc_claimAutoreleasedReturnValue([v4 localizedDescription]);
    id v8 = (void *)v7;
    id v9 = @"Unknown";
    if (v7) {
      id v9 = (const __CFString *)v7;
    }
    LODWORD(buf[0]) = 138412290;
    *(void *)((char *)buf + 4) = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_INFO,  "Could not list files in CA stalls directory due to error: %@",  (uint8_t *)buf,  0xCu);
  }

  id v10 = sub_1000199EC();
  uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v93 = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Error checking for CA glitch tailspins", v93, 2u);
  }
}

uint64_t sub_100005990(uint64_t a1, uint64_t a2)
{
  id v4 = objc_autoreleasePoolPush();
  if ((*(_WORD *)(a2 + 4) & 0xF000) == 0x8000)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", a1));
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 pathExtension]);
    unsigned int v7 = [v6 isEqualToString:@"tailspin"];
    id v8 = [v5 rangeOfString:@"processing.tailspin"];
    if (!v7)
    {
      id v26 = sub_1000199EC();
      id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        __int128 v58 = (os_log_s *)v5;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Ignoring non tailspin file: %@", buf, 0xCu);
      }

      uint64_t v15 = 0LL;
      goto LABEL_12;
    }

    id v9 = v8;
    sub_100012AC0();
    if (v9 != (id)0x7FFFFFFFFFFFFFFFLL)
    {
      id v28 = sub_1000199EC();
      id v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        __int128 v58 = (os_log_s *)v5;
        _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_DEFAULT,  "Found aborted file, deleting: %@",  buf,  0xCu);
      }

      id v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
      id v51 = 0LL;
      unsigned __int8 v31 = [v30 removeItemAtPath:v5 error:&v51];
      uint64_t v15 = (os_log_s *)v51;

      sub_100009268(0LL, 1uLL, 0LL, 1LL);
      if ((v31 & 1) != 0) {
        goto LABEL_13;
      }
      id v32 = sub_1000199EC();
      id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        __int128 v58 = (os_log_s *)v5;
        __int16 v59 = 2112;
        id v60 = v15;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Failed to delete %@: %@", buf, 0x16u);
      }

LABEL_12:
LABEL_13:
      goto LABEL_14;
    }

    ++dword_10007C128;
    id v10 = [v5 rangeOfString:v6 options:12];
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue( objc_msgSend( v5,  "stringByReplacingOccurrencesOfString:withString:options:range:",  v6,  @"processing.tailspin",  12,  v10,  v11));
    id v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    id v54 = 0LL;
    unsigned __int8 v14 = [v13 moveItemAtPath:v5 toPath:v12 error:&v54];
    uint64_t v15 = (os_log_s *)v54;

    if ((v14 & 1) == 0)
    {
      id v33 = sub_1000199EC();
      id v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412802;
        __int128 v58 = (os_log_s *)v5;
        __int16 v59 = 2112;
        id v60 = v12;
        __int16 v61 = 2112;
        id v62 = v15;
        _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "Failed to move %@ -> %@: %@", buf, 0x20u);
      }

      id v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
      unsigned __int8 v36 = [v35 removeItemAtPath:v5 error:0];

      if ((v36 & 1) == 0)
      {
        sub_100009268(0LL, 2uLL, 0LL, 1LL);
        id v37 = sub_1000199EC();
        unsigned __int8 v38 = (os_log_s *)objc_claimAutoreleasedReturnValue(v37);
        if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          __int128 v58 = (os_log_s *)v5;
          __int16 v59 = 2112;
          id v60 = v15;
          _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "Failed to delete %@: %@", buf, 0x16u);
        }
      }

      goto LABEL_12;
    }

    id v16 = (void *)CFPreferencesCopyValue( @"PDSEPrefHTTimeoutTimestampSec",  @"com.apple.da",  @"mobile",  kCFPreferencesAnyHost);

    if (-[os_log_s containsString:](v12, "containsString:", @"Sentry"))
    {
      id v17 = (void *)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](&OBJC_CLASS___HTPrefs, "sharedPrefs"));
      unsigned int v18 = [v17 shouldCollectOSSignpostsDeferred];

      if (v18)
      {
        unsigned __int8 v19 = v12;
        uint64_t v20 = open((const char *)-[os_log_s UTF8String](v19, "UTF8String"), 2);
        if ((_DWORD)v20 != -1)
        {
          uint64_t v21 = v20;
          uint64_t v55 = UnsafePointer;
          unsigned int v22 = (void *)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](&OBJC_CLASS___HTPrefs, "sharedPrefs"));
          int v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v22 shouldCollectOSSignpostsDeferred]));
          id v56 = v23;
          BOOL v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v56,  &v55,  1LL));

          uint64_t v25 = qword_10007C1A0;
          v52[0] = _NSConcreteStackBlock;
          v52[1] = 3221225472LL;
          v52[2] = sub_10000A37C;
          v52[3] = &unk_100071170;
          id v53 = v19;
          tailspin_augment_output(v21, v24, v25, v52);
          dispatch_semaphore_wait((dispatch_semaphore_t)qword_10007C1A8, 0xFFFFFFFFFFFFFFFFLL);

LABEL_41:
          sub_10000463C(v12);
          goto LABEL_12;
        }

        id v50 = sub_1000199EC();
        BOOL v24 = (void *)objc_claimAutoreleasedReturnValue(v50);
        if (!os_log_type_enabled((os_log_t)v24, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_41;
        }
        *(_DWORD *)buf = 138412290;
        __int128 v58 = v19;
        v43 = "Failed to open tailspin at %@";
        unsigned __int8 v44 = (os_log_s *)v24;
        os_log_type_t v45 = OS_LOG_TYPE_DEFAULT;
        uint32_t v46 = 12;
      }

      else
      {
        id v42 = sub_1000199EC();
        BOOL v24 = (void *)objc_claimAutoreleasedReturnValue(v42);
        if (!os_log_type_enabled((os_log_t)v24, OS_LOG_TYPE_INFO)) {
          goto LABEL_41;
        }
        *(_WORD *)buf = 0;
        v43 = "OS Signposts augmentation is disabled";
        unsigned __int8 v44 = (os_log_s *)v24;
        os_log_type_t v45 = OS_LOG_TYPE_INFO;
        uint32_t v46 = 2;
      }

      _os_log_impl((void *)&_mh_execute_header, v44, v45, v43, buf, v46);
      goto LABEL_41;
    }

    if ((-[os_log_s containsString:](v12, "containsString:", @"Slow-Launch") & 1) != 0
      || -[os_log_s containsString:](v12, "containsString:", @"Slow-Resume"))
    {
      id v39 = sub_1000199EC();
      uint64_t v40 = (void *)objc_claimAutoreleasedReturnValue(v39);
      if (!os_log_type_enabled((os_log_t)v40, OS_LOG_TYPE_DEFAULT))
      {
LABEL_31:

        sub_100003628(v12, 0LL, 0LL);
        id v12 = v12;
        unlink((const char *)-[os_log_s UTF8String](v12, "UTF8String"));
        goto LABEL_12;
      }

      *(_WORD *)buf = 0;
      id v41 = "Slow-launch or Slow-resume tailspin detected. Not saving a spindump";
    }

    else
    {
      unint64_t v47 = (void *)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](&OBJC_CLASS___HTPrefs, "sharedPrefs"));
      unsigned int v48 = [v47 eplEnabled];

      if (!v48 || v16)
      {
        sub_10000A47C(v12);
        goto LABEL_12;
      }

      id v49 = sub_1000199EC();
      uint64_t v40 = (void *)objc_claimAutoreleasedReturnValue(v49);
      if (!os_log_type_enabled((os_log_t)v40, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_31;
      }
      *(_WORD *)buf = 0;
      id v41 = "EPL is enabled, and HTSE is disabled. Not saving a spindump";
    }

    _os_log_impl((void *)&_mh_execute_header, (os_log_t)v40, OS_LOG_TYPE_DEFAULT, v41, buf, 2u);
    goto LABEL_31;
  }
  }
}
}

LABEL_14:
  objc_autoreleasePoolPop(v4);
  return 0LL;
}
        }

        v7 += strlen(&v34[v7]) + 1;
        if (v7 >= v6) {
          return;
        }
      }

      id v17 = sub_1000199EC();
      id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
      if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_14;
      }
      *(_DWORD *)buf = 136315138;
      uint64_t v25 = &v34[v7];
      unsigned __int8 v14 = v13;
      uint64_t v15 = "Skipping copying extended attribute which is either NULL or not in allowlist: %s";
      id v16 = 12;
LABEL_13:
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, v15, buf, v16);
      goto LABEL_14;
    }
  }

                                            sub_1000322D0(v16, "", v19, v18);
                                          }

  if (v21) {
    sub_100033618((uint64_t)v21);
  }
  return v19;
}

void start()
{
  unsigned int v0 = (void *)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](&OBJC_CLASS___HTPrefs, "sharedPrefs"));
  [v0 setupPrefsWithQueue:&_dispatch_main_q];

  int out_token = -1;
  uint32_t v1 = notify_register_check("com.apple.hangreporter.processing", &out_token);
  if (v1 || out_token == -1)
  {
    id v2 = sub_1000199EC();
    id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 67109376;
      uint32_t v14 = v1;
      __int16 v15 = 1024;
      int v16 = out_token;
      _os_log_fault_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_FAULT,  "Unable to checkin with notifitation: %d (token %d)",  buf,  0xEu);
    }

    int out_token = -1;
  }

  sub_10001267C();
  dispatch_queue_attr_t v4 = dispatch_queue_attr_make_with_qos_class(0LL, QOS_CLASS_BACKGROUND, -15);
  id v5 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v4);
  dispatch_queue_t v6 = dispatch_queue_create("com.apple.hangreporter.tailspin.augmentation_queue", v5);
  unsigned int v7 = (void *)qword_10007C1A0;
  qword_10007C1A0 = (uint64_t)v6;

  dispatch_semaphore_t v8 = dispatch_semaphore_create(0LL);
  id v9 = (void *)qword_10007C1A8;
  qword_10007C1A8 = (uint64_t)v8;

  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472LL;
  handler[2] = sub_100006214;
  handler[3] = &unk_100071020;
  int v12 = out_token;
  xpc_set_event_stream_handler("com.apple.fsevents.matching", &_dispatch_main_q, handler);

  dispatch_time_t v10 = dispatch_time(0LL, 10000000000LL);
  dispatch_after(v10, &_dispatch_main_q, &stru_100071040);

  dispatch_main();
}

void sub_100006214(uint64_t a1, xpc_object_t xdict)
{
  string = xpc_dictionary_get_string(xdict, _xpc_event_key_name);
  id v4 = sub_1000199EC();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 136315138;
    id v13 = string;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Received event: %s", (uint8_t *)&v12, 0xCu);
  }

  if (!strncmp(string, "com.apple.hangreporter.spool.modified", 0x25uLL))
  {
    notify_set_state(*(_DWORD *)(a1 + 32), 1uLL);
    sub_100004E38();
    notify_set_state(*(_DWORD *)(a1 + 32), 0LL);
    id v8 = sub_1000199EC();
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      sub_10003396C();
    }

    notify_post("com.apple.hangreporter.processing");
  }

  else
  {
    id v6 = sub_1000199EC();
    unsigned int v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 136315138;
      id v13 = string;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Ignoring unknown event: %s",  (uint8_t *)&v12,  0xCu);
    }
  }

  id v10 = sub_1000199EC();
  uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v12) = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Done...", (uint8_t *)&v12, 2u);
  }
}

void sub_1000063D8(id a1)
{
  id v1 = sub_1000199EC();
  id v2 = (os_log_s *)objc_claimAutoreleasedReturnValue(v1);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v3 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_DEFAULT,  "Calling xpc_transaction_exit_clean() now",  v3,  2u);
  }

  xpc_transaction_exit_clean();
}

BOOL sub_100006440(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if (v4)
  {
    id v5 = sub_1000199EC();
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      id v8 = (void *)objc_claimAutoreleasedReturnValue([v4 localizedDescription]);
      int v10 = 138412546;
      uint64_t v11 = v7;
      __int16 v12 = 2112;
      id v13 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Error getting enumerator for directory %@: %@",  (uint8_t *)&v10,  0x16u);
    }
  }

  return v4 == 0LL;
}

int64_t sub_100006528(id a1, id a2, id a3)
{
  id v4 = a2;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([a3 objectForKey:@"date"]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"date"]);

  id v7 = [v5 compare:v6];
  return (int64_t)v7;
}

id sub_1000065A4(void *a1, void *a2, void *a3, int a4)
{
  kern_return_t Name;
  id v240;
  os_log_s *v241;
  kern_return_t v242;
  id v243;
  os_log_s *v244;
  id v245;
  void *v246;
  void *v247;
  void *v248;
  void *v249;
  id v250;
  os_log_s *v251;
  void *v252;
  id v253;
  os_log_s *v254;
  void *v255;
  unsigned int v256;
  CFDictionaryRef v257;
  void *v258;
  id v259;
  void *v260;
  CFStringRef v261;
  void *v262;
  void *v263;
  HTOrderedNSDict *v264;
  void *v265;
  id v266;
  void *v267;
  void *v268;
  void *v269;
  BOOL v270;
  void *v271;
  void *v272;
  void *v273;
  void *v274;
  id v275;
  id v276;
  id v277;
  uint64_t v278;
  NSMutableDictionary *v279;
  void *v280;
  void *v281;
  void *v282;
  void *v283;
  void *v284;
  NSNumber *v285;
  void *v286;
  NSMutableArray *v287;
  NSMutableArray *v288;
  void *v289;
  void *v290;
  id v291;
  os_log_s *v292;
  id v293;
  HRMakeRunnableData *v294;
  uint64_t v295;
  const char *v296;
  int v297;
  id v298;
  unsigned int v299;
  void *v300;
  NSMutableData *v301;
  uint64_t v302;
  unint64_t v303;
  void *v305;
  void *v306;
  void *v307;
  int v308;
  void *v309;
  NSMutableDictionary *v310;
  void *v311;
  void *v312;
  id v313;
  _BYTE *v314;
  void *v315;
  void *v316;
  void *v317;
  void *v318;
  id v319;
  NSMutableDictionary *v320;
  void *v321;
  _BYTE *v322;
  void *v323;
  NSMutableData *v324;
  void v325[4];
  id v326;
  unint64_t v327;
  double v328;
  void v329[4];
  NSMutableData *v330;
  id v331;
  id v332;
  id v333;
  _BYTE *v334;
  const char *v335;
  unint64_t v336;
  uint64_t v337;
  char v338;
  __int128 v339;
  __int128 v340;
  __int128 v341;
  __int128 v342;
  __int128 v343;
  __int128 v344;
  __int128 v345;
  __int128 v346;
  void v347[4];
  id v348;
  _BYTE *v349;
  uint64_t v350;
  uint64_t v351;
  char v352;
  CFMutableDictionaryRef properties;
  io_iterator_t existing;
  _BYTE v355[22];
  _BYTE v356[128];
  _BYTE v357[128];
  CFStringRef v358;
  void *v359;
  void v360[2];
  void v361[2];
  _BYTE buf[24];
  uint64_t (*v363)(uint64_t, uint64_t);
  __int128 v364;
  id v6 = a1;
  v319 = a2;
  id v7 = a3;
  v313 = v6;
  v296 = (const char *)[v313 cStringUsingEncoding:4];
  v321 = v7;
  v316 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:@"ServiceName"]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:@"PID"]);
  v299 = [v8 unsignedIntValue];

  id v9 = (void *)objc_claimAutoreleasedReturnValue([v321 objectForKeyedSubscript:@"HangType"]);
  signed int v10 = [v9 intValue];

  v306 = (void *)objc_claimAutoreleasedReturnValue([v321 objectForKeyedSubscript:@"EnablementType"]);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v321 objectForKeyedSubscript:@"StartTime"]);
  v322 = [v11 unsignedLongLongValue];

  v314 = sub_100012B04(v313, v321);
  v311 = (void *)objc_claimAutoreleasedReturnValue([v321 objectForKeyedSubscript:off_10007BAF0]);
  v312 = (void *)objc_claimAutoreleasedReturnValue([v321 objectForKeyedSubscript:@"ProcessPath"]);
  v305 = (void *)objc_claimAutoreleasedReturnValue([v312 lastPathComponent]);
  __int16 v12 = (void *)objc_claimAutoreleasedReturnValue([v321 objectForKeyedSubscript:@"IsThirdPartyDevSupportModeHang"]);
  v308 = [v12 BOOLValue];

  v307 = (void *)objc_claimAutoreleasedReturnValue([v321 objectForKeyedSubscript:@"IPSMetaDictionary"]);
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v321 objectForKeyedSubscript:@"isFirstPartyApp"]);
  int v14 = [v13 BOOLValue];

  double v15 = sub_100002FAC(v314 - v322);
  v297 = v14;
  v302 = sub_100002B74(v14, v308, v15);
  int v16 = (void *)objc_claimAutoreleasedReturnValue([v321 objectForKeyedSubscript:@"Reason"]);
  [v319 setReason:v16];

  id v17 = +[SATimestamp timestampWithMachAbsTime:machContTime:wallTime:machTimebase:]( &OBJC_CLASS___SATimestamp,  "timestampWithMachAbsTime:machContTime:wallTime:machTimebase:",  v322,  0LL,  sub_1000030B4(),  0.0);
  v318 = (void *)objc_claimAutoreleasedReturnValue(v17);
  unsigned int v18 = +[SATimestamp timestampWithMachAbsTime:machContTime:wallTime:machTimebase:]( &OBJC_CLASS___SATimestamp,  "timestampWithMachAbsTime:machContTime:wallTime:machTimebase:",  v314,  0LL,  sub_1000030B4(),  0.0);
  v317 = (void *)objc_claimAutoreleasedReturnValue(v18);
  id v19 = [v319 indexOfFirstSampleOnOrAfterTimestamp:v318];
  id v20 = [v319 indexOfLastSampleOnOrBeforeTimestamp:v317];
  if (v19 == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v319 endTime]);

    if (!v21) {
      goto LABEL_6;
    }
    unsigned int v22 = (void *)objc_claimAutoreleasedReturnValue([v319 endTime]);
    [v318 guessMissingTimesBasedOnTimestamp:v22];
  }

  else
  {
    unsigned int v22 = (void *)objc_claimAutoreleasedReturnValue([v319 sampleTimestamps]);
    int v23 = (void *)objc_claimAutoreleasedReturnValue([v22 objectAtIndexedSubscript:v19]);
    [v318 guessMissingTimesBasedOnTimestamp:v23];
  }

LABEL_6:
  if (v20 == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    BOOL v24 = (void *)objc_claimAutoreleasedReturnValue([v319 startTime]);

    if (!v24) {
      goto LABEL_11;
    }
    uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue([v319 startTime]);
    [v317 guessMissingTimesBasedOnTimestamp:v25];
  }

  else
  {
    uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue([v319 sampleTimestamps]);
    id v26 = (void *)objc_claimAutoreleasedReturnValue([v25 objectAtIndexedSubscript:v20]);
    [v317 guessMissingTimesBasedOnTimestamp:v26];
  }

LABEL_11:
  j__ADClientAddValueForScalarKey( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"com.apple.hangtracer.HTLogsConversion.AttemptType.%@",  v316),  1LL);
  id v27 = sub_1000199EC();
  id v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG)) {
    sub_100033B90();
  }

  v303 = v10;
  if ([v311 isEqualToString:off_10007BB00])
  {
    if (v19 == (id)0x7FFFFFFFFFFFFFFFLL || v20 == (id)0x7FFFFFFFFFFFFFFFLL)
    {
      id v67 = sub_1000199EC();
      id v68 = (os_log_s *)objc_claimAutoreleasedReturnValue(v67);
      if (os_log_type_enabled(v68, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v68,  OS_LOG_TYPE_DEFAULT,  "Sample store contains no samples for the tailspin interval, ignoring!",  buf,  2u);
      }

      if (a4) {
        sub_100009268(0LL, 6uLL, v10, v302);
      }
      j__ADClientAddValueForScalarKey(@"com.apple.hangtracer.HTLogsConversion.FailedNoSamples", 1LL);
    }

    else
    {
      double v29 = sub_100002FAC(v314 - v322);
      [v319 setTargetProcessId:v299];
      [v319 setSanitizePaths:1];
      id v30 = (void *)objc_claimAutoreleasedReturnValue([v321 objectForKeyedSubscript:off_10007BAE8]);
      [v319 setEvent:v30];

      unsigned __int8 v31 = (void *)objc_claimAutoreleasedReturnValue([v319 targetProcess]);
      id v32 = [[SASamplePrinter alloc] initWithSampleStore:v319];
      [v32 filterToMachAbsTimeRangeStart:v322 end:v314];
      id v33 = (void *)objc_claimAutoreleasedReturnValue([v32 options]);
      [v33 setPrintSpinSignatureStack:1];

      id v34 = (void *)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](&OBJC_CLASS___HTPrefs, "sharedPrefs"));
      unsigned __int8 v35 = [v34 isInternal];

      if ((v35 & 1) == 0)
      {
        unsigned __int8 v36 = (void *)objc_claimAutoreleasedReturnValue([v32 options]);
        [v36 setDisplayKernelFrames:0];
      }

      if (((v308 ^ 1 | v14) & 1) == 0)
      {
        id v37 = (void *)objc_claimAutoreleasedReturnValue([v32 options]);
        [v37 setDisplayTrialInformation:0];
      }

      unsigned __int8 v38 = objc_alloc(&OBJC_CLASS___NSUUID);
      id v39 = (void *)objc_claimAutoreleasedReturnValue([v321 objectForKeyedSubscript:off_10007BB08]);
      uint64_t v40 = -[NSUUID initWithUUIDString:](v38, "initWithUUIDString:", v39);
      [v32 setIncidentUUID:v40];

      id v41 = (void *)objc_claimAutoreleasedReturnValue([v32 options]);
      [v41 setForceOneBasedTimeIndexes:1];

      id v42 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
      v43 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%0.0f",  *(void *)&v29));
      -[NSMutableDictionary setObject:forKey:](v42, "setObject:forKey:", v43, @"duration_ms");

      unsigned __int8 v44 = (void *)objc_claimAutoreleasedReturnValue([v319 hardwareModel]);
      if (v44) {
        v315 = (void *)objc_claimAutoreleasedReturnValue([v319 hardwareModel]);
      }
      else {
        v315 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", "UNKNOWN"));
      }

      -[NSMutableDictionary setObject:forKey:](v42, "setObject:forKey:", v315, @"machine_config");
      if (v29 <= 1000.0) {
        uint64_t v72 = @"Regular Launch";
      }
      else {
        uint64_t v72 = @"Slow Launch";
      }
      -[NSMutableDictionary setObject:forKey:](v42, "setObject:forKey:", v72, @"bug_subtype");
      v358 = @"HangUUID";
      id v73 = (void *)objc_claimAutoreleasedReturnValue([v32 incidentUUID]);
      v359 = v73;
      v309 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v359,  &v358,  1LL));

      id v74 = (void *)objc_claimAutoreleasedReturnValue([v31 name]);
      v75 = (void *)objc_claimAutoreleasedReturnValue([v31 mainBinaryPath]);
      id v76 = sub_100001D24(v74, 0LL, v75, v309);
      v323 = (void *)objc_claimAutoreleasedReturnValue(v76);

      -[NSMutableDictionary addEntriesFromDictionary:](v42, "addEntriesFromDictionary:", v323);
      id v77 = (void *)objc_claimAutoreleasedReturnValue(+[SATimeRange timeRangeStart:end:](&OBJC_CLASS___SATimeRange, "timeRangeStart:end:", v318, v317));
      [v319 setEventTimeRange:v77];

      +[MXSampleAnalysisParser sendDiagnosticReport:forType:forSourceID:]( &OBJC_CLASS___MXSampleAnalysisParser,  "sendDiagnosticReport:forType:forSourceID:",  v32,  3LL,  3LL);
      id v78 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v299));
      id v79 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithObject:](&OBJC_CLASS___NSMutableSet, "setWithObject:", v78));
      __int16 v80 = (void *)objc_claimAutoreleasedReturnValue([v32 options]);
      [v80 setPidsToPrint:v79];

      v81 = (void *)objc_claimAutoreleasedReturnValue([v32 options]);
      [v81 setPrintHeavyStacks:1];

      *(void *)buf = 0LL;
      *(void *)&buf[8] = buf;
      *(void *)&buf[16] = 0x3032000000LL;
      v363 = sub_100009448;
      *(void *)&v364 = sub_100009458;
      *((void *)&v364 + 1) = 0LL;
      __int16 v82 = (void *)objc_claimAutoreleasedReturnValue([v31 name]);
      v300 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Applaunch-%@",  v82));

      id v83 = (void *)objc_claimAutoreleasedReturnValue([v321 objectForKeyedSubscript:@"Reason"]);
      if (v83) {
        uint64_t v84 = objc_claimAutoreleasedReturnValue([v321 objectForKeyedSubscript:@"Reason"]);
      }
      else {
        uint64_t v84 = objc_claimAutoreleasedReturnValue([v321 objectForKeyedSubscript:off_10007BAE8]);
      }
      __int128 v85 = (void *)v84;

      unsigned int v86 = [v85 isEqualToString:off_10007BAF8];
      __int128 v87 = @"238";
      if (v86) {
        __int128 v87 = @"248";
      }
      __int128 v88 = v87;
      v347[0] = _NSConcreteStackBlock;
      v347[1] = 3221225472LL;
      v347[2] = sub_100009460;
      v347[3] = &unk_1000710D0;
      v349 = buf;
      id v89 = v32;
      v352 = a4;
      v348 = v89;
      v350 = v10;
      v351 = v302;
      if (OSAWriteLogForSubmission(v88, v300, v42, 0LL, v347))
      {
        id v90 = sub_1000199EC();
        id v91 = (os_log_s *)objc_claimAutoreleasedReturnValue(v90);
        if (os_log_type_enabled(v91, OS_LOG_TYPE_INFO))
        {
          uint64_t v92 = *(void *)(*(void *)&buf[8] + 40LL);
          *(_DWORD *)v355 = 138412290;
          *(void *)&v355[4] = v92;
          _os_log_impl( (void *)&_mh_execute_header,  v91,  OS_LOG_TYPE_INFO,  "IPS file for MetricKit App launch diagnostics written successfully at %@",  v355,  0xCu);
        }

        uint32_t v93 = arc4random_uniform(0x64u);
        double v94 = (double)v93;
        if (v93 > 0x18)
        {
          id v112 = sub_1000199EC();
          v97 = (os_log_s *)objc_claimAutoreleasedReturnValue(v112);
          if (os_log_type_enabled(v97, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)v355 = 134217984;
            *(double *)&v355[4] = v94;
            _os_log_impl( (void *)&_mh_execute_header,  v97,  OS_LOG_TYPE_INFO,  "randomFlagValue is %f, rejecting submission to DP",  v355,  0xCu);
          }
        }

        else
        {
          id v95 = sub_1000199EC();
          __int16 v96 = (os_log_s *)objc_claimAutoreleasedReturnValue(v95);
          if (os_log_type_enabled(v96, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)v355 = 134217984;
            *(double *)&v355[4] = v94;
            _os_log_impl( (void *)&_mh_execute_header,  v96,  OS_LOG_TYPE_INFO,  "randomFlagValue is %f will be submitting the tailspin to DP",  v355,  0xCu);
          }

          v97 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
          __int16 v98 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary valueForKey:](v42, "valueForKey:", @"duration_ms"));
          -[os_log_s setObject:forKeyedSubscript:]( v97,  "setObject:forKeyedSubscript:",  v98,  @"observedLatencyInMs");

          v99 = (void *)objc_claimAutoreleasedReturnValue([v89 incidentUUID]);
          if (v99)
          {
            v100 = (void *)objc_claimAutoreleasedReturnValue([v89 incidentUUID]);
            uint64_t v101 = (void *)objc_claimAutoreleasedReturnValue([v100 UUIDString]);
            -[os_log_s setObject:forKeyedSubscript:](v97, "setObject:forKeyedSubscript:", v101, @"UUID");
          }

          id v102 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary valueForKey:](v42, "valueForKey:", @"bug_subtype"));
          -[os_log_s setObject:forKeyedSubscript:](v97, "setObject:forKeyedSubscript:", v102, @"reason");

          v103 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary valueForKey:](v42, "valueForKey:", @"app_version"));
          -[os_log_s setObject:forKeyedSubscript:](v97, "setObject:forKeyedSubscript:", v103, @"appVersion");

          v104 = (void *)objc_claimAutoreleasedReturnValue([v31 name]);
          -[os_log_s setObject:forKeyedSubscript:](v97, "setObject:forKeyedSubscript:", v104, @"appName");

          v105 = (void *)objc_claimAutoreleasedReturnValue([v31 mainBinaryPath]);
          if (v105)
          {
            v106 = (os_log_s *)objc_claimAutoreleasedReturnValue([v31 mainBinaryPath]);
            -[os_log_s setObject:forKeyedSubscript:](v97, "setObject:forKeyedSubscript:", v106, @"processPath");
          }

          else
          {
            id v129 = sub_1000199EC();
            v106 = (os_log_s *)objc_claimAutoreleasedReturnValue(v129);
            if (os_log_type_enabled(v106, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)v355 = 0;
              _os_log_impl( (void *)&_mh_execute_header,  v106,  OS_LOG_TYPE_DEFAULT,  "mainBinaryPath field was nil in SATask object",  v355,  2u);
            }
          }

          v130 = (void *)objc_claimAutoreleasedReturnValue([v31 bundleIdentifier]);
          if (v130)
          {
            v131 = (os_log_s *)objc_claimAutoreleasedReturnValue([v31 bundleIdentifier]);
            -[os_log_s setObject:forKeyedSubscript:](v97, "setObject:forKeyedSubscript:", v131, @"bundleID");
          }

          else
          {
            id v132 = sub_1000199EC();
            v131 = (os_log_s *)objc_claimAutoreleasedReturnValue(v132);
            if (os_log_type_enabled(v131, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)v355 = 0;
              _os_log_impl( (void *)&_mh_execute_header,  v131,  OS_LOG_TYPE_DEFAULT,  "bundleIdentifier field was nil in SATask object",  v355,  2u);
            }
          }

          v133 = (void *)objc_claimAutoreleasedReturnValue([v323 objectForKeyedSubscript:@"is_first_party"]);
          if (v133)
          {
            v134 = (void *)objc_claimAutoreleasedReturnValue([v323 objectForKeyedSubscript:@"is_first_party"]);
            int v135 = [v134 BOOLValue];
          }

          else
          {
            int v135 = 1;
          }

          sub_100009604(v135, 0, 0LL, v313, v97);
        }
      }

      else if (a4)
      {
        sub_100009268(0LL, 9uLL, v10, v302);
      }

      _Block_object_dispose(buf, 8);
    }

LABEL_117:
    id v136 = 0LL;
    goto LABEL_118;
  }

  if ([v316 containsString:@"Fence-hang"])
  {
    id v45 = sub_1000199EC();
    uint32_t v46 = (os_log_s *)objc_claimAutoreleasedReturnValue(v45);
    if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v46,  OS_LOG_TYPE_INFO,  "Analyzing a Fence-hang, going to find process slowest at fence handling",  buf,  2u);
    }

    unint64_t v47 = (void *)objc_claimAutoreleasedReturnValue([v321 objectForKeyedSubscript:@"FenceInfoUpdated"]);
    unsigned int v48 = v47;
    if (v47)
    {
      unsigned int v49 = [v47 BOOLValue];
      id v50 = sub_1000199EC();
      id v51 = (os_log_s *)objc_claimAutoreleasedReturnValue(v50);
      BOOL v52 = os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT);
      if (v49)
      {
        if (v52)
        {
          id v53 = (void *)objc_claimAutoreleasedReturnValue([v319 reason]);
          *(_DWORD *)buf = 138412546;
          *(void *)&uint8_t buf[4] = v312;
          *(_WORD *)&_BYTE buf[12] = 2112;
          *(void *)&buf[14] = v53;
          _os_log_impl( (void *)&_mh_execute_header,  v51,  OS_LOG_TYPE_DEFAULT,  "Found slowest fence client: %@ reason: %@",  buf,  0x16u);
        }

        if (v299 == -1)
        {
          id v54 = sub_1000199EC();
          uint64_t v55 = (os_log_s *)objc_claimAutoreleasedReturnValue(v54);
          if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl( (void *)&_mh_execute_header,  v55,  OS_LOG_TYPE_DEFAULT,  "Found slowest fence client: ktraca data shows pid -1",  buf,  2u);
          }

          j__ADClientAddValueForScalarKey(@"com.apple.hangtracer.HTLogsConversion.FencePidUnknown", 1LL);
        }

        goto LABEL_34;
      }

      if (v52)
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v51,  OS_LOG_TYPE_DEFAULT,  "Unable to find slowest fence client from ktrace signposts in tailspin",  buf,  2u);
      }
    }

    else
    {
      id v71 = sub_1000199EC();
      id v51 = (os_log_s *)objc_claimAutoreleasedReturnValue(v71);
      if (os_log_type_enabled(v51, OS_LOG_TYPE_FAULT)) {
        sub_1000339C4();
      }
    }

    j__ADClientAddValueForScalarKey(@"com.apple.hangtracer.HTLogsConversion.NoFenceFound", 1LL);
    id v108 = sub_1000199EC();
    v109 = (os_log_s *)objc_claimAutoreleasedReturnValue(v108);
    v110 = v109;
    if (v19 == (id)0x7FFFFFFFFFFFFFFFLL || v20 == (id)0x7FFFFFFFFFFFFFFFLL)
    {
      if (os_log_type_enabled(v109, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v110,  OS_LOG_TYPE_DEFAULT,  "Unable to find slowest fence client: no ktrace data during time period",  buf,  2u);
      }

      v111 = @"com.apple.hangtracer.HTLogsConversion.NoFenceFound.EmptyTrace";
    }

    else
    {
      if (os_log_type_enabled(v109, OS_LOG_TYPE_FAULT)) {
        sub_100033998();
      }
      v111 = @"com.apple.hangtracer.HTLogsConversion.NoFenceFound.GoodTrace";
    }

    j__ADClientAddValueForScalarKey(v111, 1LL);
    if (a4) {
      sub_100009268(0LL, 5uLL, v10, v302);
    }

    goto LABEL_117;
  }

LABEL_34:
  if (v19 == (id)0x7FFFFFFFFFFFFFFFLL || v20 == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    if (a4) {
      sub_100009268(0LL, 6uLL, v10, v302);
    }
    id v69 = sub_1000199EC();
    id v70 = (os_log_s *)objc_claimAutoreleasedReturnValue(v69);
    if (os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v70,  OS_LOG_TYPE_DEFAULT,  "Sample store contains no samples for the hang interval, ignoring!",  buf,  2u);
    }

    j__ADClientAddValueForScalarKey(@"com.apple.hangtracer.HTLogsConversion.FailedNoSamples", 1LL);
    goto LABEL_117;
  }

  if ([v316 containsString:@"Fence-hang"])
  {
    sub_10001A390(v296, @"hangtracer.process_path", v312);
    id v56 = (void *)objc_claimAutoreleasedReturnValue([v307 objectForKeyedSubscript:kCRProblemReportBundleIDKey]);
    sub_10001A390(v296, @"hangtracer.bundle_id", v56);

    uint64_t v57 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%f",  *(void *)&v15));
    sub_10001A390(v296, @"hangtracer.duration", v57);
  }

  if (v14)
  {
    __int128 v58 = (void *)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](&OBJC_CLASS___HTPrefs, "sharedPrefs"));
    BOOL v59 = v15 < (double)(unint64_t)[v58 runloopLongHangDurationThresholdMSec];

    id v60 = (void *)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](&OBJC_CLASS___HTPrefs, "sharedPrefs"));
    __int16 v61 = v60;
    if (v59)
    {
      BOOL v62 = v15 < (double)(unint64_t)[v60 runloopHangDurationThresholdMSec];

      if (v62)
      {
        id v63 = sub_1000199EC();
        uint32_t v64 = (os_log_s *)objc_claimAutoreleasedReturnValue(v63);
        double v65 = 0.25;
        if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
        {
          id v66 = (id)objc_claimAutoreleasedReturnValue([v313 lastPathComponent]);
          *(_DWORD *)buf = 138413058;
          *(void *)&uint8_t buf[4] = v66;
          *(_WORD *)&_BYTE buf[12] = 2048;
          *(double *)&buf[14] = v15;
          *(_WORD *)&buf[22] = 2048;
          v363 = (uint64_t (*)(uint64_t, uint64_t))v302;
          LOWORD(v364) = 2048;
          *(void *)((char *)&v364 + 2) = 0x3FD0000000000000LL;
          _os_log_impl( (void *)&_mh_execute_header,  v64,  OS_LOG_TYPE_DEFAULT,  "Post-Processing %@: hangDuration=%fms -> categorized as Micro Hang and bug_type=%lu and reportThreshold=%f",  buf,  0x2Au);
        }
      }

      else
      {
        v141 = (void *)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](&OBJC_CLASS___HTPrefs, "sharedPrefs"));
        id v142 = [v141 runloopHangDurationThresholdMSec];

        id v143 = sub_1000199EC();
        uint32_t v64 = (os_log_s *)objc_claimAutoreleasedReturnValue(v143);
        double v65 = (double)(unint64_t)v142 / 1000.0;
        if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
        {
          id v144 = (id)objc_claimAutoreleasedReturnValue([v313 lastPathComponent]);
          *(_DWORD *)buf = 138413058;
          *(void *)&uint8_t buf[4] = v144;
          *(_WORD *)&_BYTE buf[12] = 2048;
          *(double *)&buf[14] = v15;
          *(_WORD *)&buf[22] = 2048;
          v363 = (uint64_t (*)(uint64_t, uint64_t))v302;
          LOWORD(v364) = 2048;
          *(double *)((char *)&v364 + 2) = v65;
          _os_log_impl( (void *)&_mh_execute_header,  v64,  OS_LOG_TYPE_DEFAULT,  "Post-Processing %@: hangDuration=%fms -> categorized as Short Hang and bug_type=%lu and reportThreshold=%f",  buf,  0x2Au);
        }
      }
    }

    else
    {
      id v126 = [v60 runloopLongHangDurationThresholdMSec];

      id v127 = sub_1000199EC();
      uint32_t v64 = (os_log_s *)objc_claimAutoreleasedReturnValue(v127);
      double v65 = (double)(unint64_t)v126 / 1000.0;
      if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
      {
        id v128 = (id)objc_claimAutoreleasedReturnValue([v313 lastPathComponent]);
        *(_DWORD *)buf = 138413058;
        *(void *)&uint8_t buf[4] = v128;
        *(_WORD *)&_BYTE buf[12] = 2048;
        *(double *)&buf[14] = v15;
        *(_WORD *)&buf[22] = 2048;
        v363 = (uint64_t (*)(uint64_t, uint64_t))v302;
        LOWORD(v364) = 2048;
        *(double *)((char *)&v364 + 2) = (double)(unint64_t)v126 / 1000.0;
        _os_log_impl( (void *)&_mh_execute_header,  v64,  OS_LOG_TYPE_DEFAULT,  "Post-Processing %@: hangDuration=%fms -> categorized as Long Hang and bug_type=%lu and reportThreshold=%f",  buf,  0x2Au);
      }
    }
  }

  else
  {
    else {
      int v107 = 0;
    }
    if (((+[MXSourceUtilities anyClientsAvailable]( &OBJC_CLASS___MXSourceUtilities,  "anyClientsAvailable") | v107) & 1) == 0)
    {
      v113 = (void *)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](&OBJC_CLASS___HTPrefs, "sharedPrefs"));
      unsigned __int8 v114 = [v113 thirdPartyDevHangHUDEnabled];

      if ((v114 & 1) == 0)
      {
        id v138 = sub_1000199EC();
        v139 = (os_log_s *)objc_claimAutoreleasedReturnValue(v138);
        if (os_log_type_enabled(v139, OS_LOG_TYPE_DEFAULT))
        {
          v140 = (void *)objc_claimAutoreleasedReturnValue([v313 lastPathComponent]);
          *(_DWORD *)buf = 138412290;
          *(void *)&uint8_t buf[4] = v140;
          _os_log_impl( (void *)&_mh_execute_header,  v139,  OS_LOG_TYPE_DEFAULT,  "Post-Processing %@: Hang in Third Party App, but Sharing with App Developers is not enabled -> will not gene rate log and will delete tailspin",  buf,  0xCu);
        }

        j__ADClientAddValueForScalarKey( @"com.apple.hangtracer.HTLogsConversion.DeletedDueToAppAnalyticsDisabled",  1LL);
        if (a4) {
          sub_100009268(0LL, 7uLL, v10, v302);
        }
        goto LABEL_117;
      }
    }

    if ([v316 containsString:@"Fence-hang"])
    {
      v115 = (void *)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](&OBJC_CLASS___HTPrefs, "sharedPrefs"));
      BOOL v116 = v15 < (double)(unint64_t)[v115 runloopHangThirdPartyDurationThresholdMSec];

      if (v116)
      {
        id v117 = sub_1000199EC();
        v118 = (os_log_s *)objc_claimAutoreleasedReturnValue(v117);
        if (os_log_type_enabled(v118, OS_LOG_TYPE_DEFAULT))
        {
          v119 = (void *)objc_claimAutoreleasedReturnValue([v313 lastPathComponent]);
          v120 = (void *)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](&OBJC_CLASS___HTPrefs, "sharedPrefs"));
          v121 = (uint64_t (*)(uint64_t, uint64_t))[v120 runloopHangThirdPartyDurationThresholdMSec];
          *(_DWORD *)buf = 138412802;
          *(void *)&uint8_t buf[4] = v119;
          *(_WORD *)&_BYTE buf[12] = 2048;
          *(double *)&buf[14] = v15;
          *(_WORD *)&buf[22] = 2048;
          v363 = v121;
          _os_log_impl( (void *)&_mh_execute_header,  v118,  OS_LOG_TYPE_DEFAULT,  "Post-Processing %@: Hang in Third Party App, but hang duration blamed on app (%f ms) is below the 3rd party hang log threshold (%llu ms) -> will not generate log and will delete tailspin",  buf,  0x20u);
        }

        j__ADClientAddValueForScalarKey( @"com.apple.hangtracer.HTLogsConversion.DeletedDueTo3rdPartyFenceBelowHangThreshold",  1LL);
        if (a4) {
          sub_100009268(0LL, 8uLL, v10, v302);
        }
        goto LABEL_117;
      }
    }

    v122 = (void *)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](&OBJC_CLASS___HTPrefs, "sharedPrefs"));
    id v123 = [v122 runloopHangThirdPartyDurationThresholdMSec];

    id v124 = sub_1000199EC();
    uint32_t v64 = (os_log_s *)objc_claimAutoreleasedReturnValue(v124);
    double v65 = (double)(unint64_t)v123 / 1000.0;
    if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
    {
      id v125 = (id)objc_claimAutoreleasedReturnValue([v313 lastPathComponent]);
      *(_DWORD *)buf = 138413058;
      *(void *)&uint8_t buf[4] = v125;
      *(_WORD *)&_BYTE buf[12] = 2048;
      *(double *)&buf[14] = v15;
      *(_WORD *)&buf[22] = 2048;
      v363 = (uint64_t (*)(uint64_t, uint64_t))v302;
      LOWORD(v364) = 2048;
      *(double *)((char *)&v364 + 2) = v65;
      _os_log_impl( (void *)&_mh_execute_header,  v64,  OS_LOG_TYPE_DEFAULT,  "Post-Processing %@: hangDuration=%fms -> categorized as Third Party Hang and bug_type=%lu and reportThreshold=%f",  buf,  0x2Au);
    }
  }

  [v319 setTargetProcessId:v299];
  [v319 setSanitizePaths:1];
  [v319 setReportTimeThreshold:v65];
  v145 = sub_100002B10(v10);
  v146 = (void *)objc_claimAutoreleasedReturnValue(v145);
  [v319 setEvent:v146];

  v147 = (void *)objc_claimAutoreleasedReturnValue(+[SATimeRange timeRangeStart:end:](&OBJC_CLASS___SATimeRange, "timeRangeStart:end:", v318, v317));
  [v319 setEventTimeRange:v147];

  v345 = 0u;
  v346 = 0u;
  v343 = 0u;
  v344 = 0u;
  v148 = (void *)objc_claimAutoreleasedReturnValue([v319 tasksByPid]);
  v149 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v299));
  v150 = (void *)objc_claimAutoreleasedReturnValue([v148 objectForKeyedSubscript:v149]);

  id v151 = [v150 countByEnumeratingWithState:&v343 objects:v357 count:16];
  if (!v151)
  {

LABEL_139:
    id v163 = sub_1000199EC();
    v164 = (os_log_s *)objc_claimAutoreleasedReturnValue(v163);
    if (os_log_type_enabled(v164, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v164, OS_LOG_TYPE_DEFAULT, "Hang App Main Thread is not found", buf, 2u);
    }

    if (a4) {
      sub_100009268(0LL, 0xCuLL, v10, v302);
    }
    goto LABEL_117;
  }

  v152 = 0LL;
  uint64_t v153 = *(void *)v344;
  do
  {
    for (i = 0LL; i != v151; i = (char *)i + 1)
    {
      if (*(void *)v344 != v153) {
        objc_enumerationMutation(v150);
      }
      v155 = *(void **)(*((void *)&v343 + 1) + 8LL * (void)i);
      v156 = (void *)objc_claimAutoreleasedReturnValue([v155 mainThread]);

      if (v156)
      {
        uint64_t v157 = objc_claimAutoreleasedReturnValue([v155 mainThread]);

        v152 = (void *)v157;
      }
    }

    id v151 = [v150 countByEnumeratingWithState:&v343 objects:v357 count:16];
  }

  while (v151);

  if (!v152) {
    goto LABEL_139;
  }
  v158 = (void *)objc_claimAutoreleasedReturnValue([v152 lastThreadStateOnOrBeforeTime:v317 sampleIndex:0x7FFFFFFFFFFFFFFFLL]);
  v159 = [v158 cpuTimeNs];
  v160 = (void *)objc_claimAutoreleasedReturnValue([v152 firstThreadStateOnOrAfterTime:v318 sampleIndex:0x7FFFFFFFFFFFFFFFLL]);
  v161 = [v160 cpuTimeNs];

  float v162 = v15;
  if ((float)((float)(unint64_t)(v159 - v161) / (float)(v162 * 1000000.0)) >= 0.5)
  {
    v294 = 0LL;
    v295 = 1LL;
  }

  else
  {
    v294 = objc_alloc_init(&OBJC_CLASS___HRMakeRunnableData);
    if ((id)-[HRMakeRunnableData findBlockingThreadForTailspin:sampleStore:mainThread:hangStartTime:hangEndTime:hangDuration:]( v294,  "findBlockingThreadForTailspin:sampleStore:mainThread:hangStartTime:hangEndTime:hangDuration:",  v313,  v319,  v152,  v322,  v314,  (int)v15) == (id)5) {
      v295 = 5LL;
    }
    else {
      v295 = -[HRMakeRunnableData findBlockingThreadFromSampleStore:mainThread:hangStartTime:hangEndTime:]( v294,  "findBlockingThreadFromSampleStore:mainThread:hangStartTime:hangEndTime:",  v319,  v152,  v322,  v314);
    }
  }

  id v165 = sub_1000199EC();
  v166 = (os_log_s *)objc_claimAutoreleasedReturnValue(v165);
  if (os_log_type_enabled(v166, OS_LOG_TYPE_DEFAULT))
  {
    v167 = sub_10000F2C4(v295);
    id v168 = (id)objc_claimAutoreleasedReturnValue(v167);
    if (v295 == 5) {
      v169 = (__CFString *)objc_claimAutoreleasedReturnValue(-[HRMakeRunnableData blockingThreadInfo](v294, "blockingThreadInfo"));
    }
    else {
      v169 = &stru_100071CD0;
    }
    *(_DWORD *)buf = 138412546;
    *(void *)&uint8_t buf[4] = v168;
    *(_WORD *)&_BYTE buf[12] = 2112;
    *(void *)&buf[14] = v169;
    _os_log_impl( (void *)&_mh_execute_header,  v166,  OS_LOG_TYPE_DEFAULT,  "Blocking Thread Search Status: %@ %@",  buf,  0x16u);
    if (v295 == 5) {
  }
    }

  v341 = 0u;
  v342 = 0u;
  v339 = 0u;
  v340 = 0u;
  v170 = (void *)objc_claimAutoreleasedReturnValue([v319 hidEvents]);
  id v171 = [v170 countByEnumeratingWithState:&v339 objects:v356 count:16];
  if (!v171)
  {

    goto LABEL_166;
  }

  id v172 = 0LL;
  uint64_t v173 = *(void *)v340;
  do
  {
    for (j = 0LL; j != v171; j = (char *)j + 1)
    {
      if (*(void *)v340 != v173) {
        objc_enumerationMutation(v170);
      }
      v175 = *(void **)(*((void *)&v339 + 1) + 8LL * (void)j);
      v176 = (void *)objc_claimAutoreleasedReturnValue([v175 hidEventTimestamp]);
      if ([v176 machAbsTime] <= v322)
      {
        v177 = (void *)objc_claimAutoreleasedReturnValue([v175 hidEventTimestamp]);
        BOOL v178 = [v177 machAbsTime] > v172;

        if (!v178) {
          continue;
        }
        v176 = (void *)objc_claimAutoreleasedReturnValue([v175 hidEventTimestamp]);
        id v172 = [v176 machAbsTime];
      }
    }

    id v171 = [v170 countByEnumeratingWithState:&v339 objects:v356 count:16];
  }

  while (v171);

  if (v172) {
    [v319 setTargetHIDEventMachAbs:v172];
  }
LABEL_166:
  id v179 = [[SASamplePrinter alloc] initWithSampleStore:v319];
  [v179 filterToMachAbsTimeRangeStart:v322 end:v314];
  v180 = (void *)objc_claimAutoreleasedReturnValue([v179 options]);
  [v180 setPrintHeavyStacks:1];

  v181 = (void *)objc_claimAutoreleasedReturnValue([v179 options]);
  [v181 setPrintSpinSignatureStack:1];

  v182 = objc_alloc(&OBJC_CLASS___NSUUID);
  v183 = (void *)objc_claimAutoreleasedReturnValue([v307 objectForKeyedSubscript:kOSAIPSHeaderIncidentIDKey]);
  v184 = -[NSUUID initWithUUIDString:](v182, "initWithUUIDString:", v183);
  [v179 setIncidentUUID:v184];

  v185 = (void *)objc_claimAutoreleasedReturnValue([v179 options]);
  [v185 setForceOneBasedTimeIndexes:1];

  if (((v308 ^ 1 | v297) & 1) == 0)
  {
    v186 = (void *)objc_claimAutoreleasedReturnValue([v179 options]);
    [v186 setDisplayTrialInformation:0];
  }

  v310 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  v187 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%0.0f",  *(void *)&v15));
  -[NSMutableDictionary setObject:forKey:](v310, "setObject:forKey:", v187, @"duration_ms");

  v188 = (void *)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](&OBJC_CLASS___HTPrefs, "sharedPrefs"));
  [v188 runloopHangPercentHeavyLogs];
  double v190 = v189;
  v191 = (void *)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](&OBJC_CLASS___HTPrefs, "sharedPrefs"));
  BOOL v193 = v15 >= (double)(unint64_t)[v191 runloopHangTimeoutDurationMSec] || (_DWORD)v303 == 2;

  if (v193)
  {
    id v194 = sub_1000199EC();
    v195 = (os_log_s *)objc_claimAutoreleasedReturnValue(v194);
    if (os_log_type_enabled(v195, OS_LOG_TYPE_DEBUG)) {
      sub_100033A78(v303, v195, v15);
    }
    goto LABEL_180;
  }

  if ((_DWORD)v303 == 10)
  {
    id v196 = sub_1000199EC();
    v195 = (os_log_s *)objc_claimAutoreleasedReturnValue(v196);
    if (os_log_type_enabled(v195, OS_LOG_TYPE_DEBUG)) {
      sub_100033B64();
    }
    goto LABEL_180;
  }

  if (v190 >= 100.0) {
    goto LABEL_181;
  }
  if (v190 <= 0.0) {
    goto LABEL_209;
  }
  double v221 = (double)arc4random_uniform(0x7FFFFFFFu) * 100.0 / 2147483650.0;
  id v222 = sub_1000199EC();
  v195 = (os_log_s *)objc_claimAutoreleasedReturnValue(v222);
  BOOL v223 = os_log_type_enabled(v195, OS_LOG_TYPE_INFO);
  if (v221 <= v190)
  {
    if (v223)
    {
      *(_DWORD *)buf = 134218240;
      *(double *)&uint8_t buf[4] = v221;
      *(_WORD *)&_BYTE buf[12] = 2048;
      *(double *)&buf[14] = v190;
      _os_log_impl( (void *)&_mh_execute_header,  v195,  OS_LOG_TYPE_INFO,  "Should capture heavy log due to roll of %.4f (pref is %.4f)",  buf,  0x16u);
    }

LABEL_180:
LABEL_181:
    v197 = @"heavy";
    goto LABEL_182;
  }

  if (v223)
  {
    *(_DWORD *)buf = 134218240;
    *(double *)&uint8_t buf[4] = v221;
    *(_WORD *)&_BYTE buf[12] = 2048;
    *(double *)&buf[14] = v190;
    _os_log_impl( (void *)&_mh_execute_header,  v195,  OS_LOG_TYPE_INFO,  "Should capture lite log due to roll of %.4f (pref is %.4f)",  buf,  0x16u);
  }

LABEL_209:
  if (v295 == 5)
  {
    v224 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v299));
    v188 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithObject:](&OBJC_CLASS___NSMutableSet, "setWithObject:", v224));

    v225 = (void *)objc_claimAutoreleasedReturnValue(-[HRMakeRunnableData topBlockingPid](v294, "topBlockingPid"));
    [v188 addObject:v225];

    v226 = (void *)objc_claimAutoreleasedReturnValue([v179 options]);
    [v226 setPidsToPrint:v188];

    id v227 = objc_msgSend( (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array")),  "init");
    v228 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( NSNumber,  "numberWithUnsignedLongLong:",  [v152 threadId]));
    [v227 addObject:v228];

    v229 = (void *)objc_claimAutoreleasedReturnValue(-[HRMakeRunnableData allBlockingThreadsArray](v294, "allBlockingThreadsArray"));
    [v227 addObjectsFromArray:v229];

    v230 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v227));
    v231 = (void *)objc_claimAutoreleasedReturnValue([v179 options]);
    [v231 setTidsToPrint:v230];
  }

  else
  {
    v188 = (void *)objc_claimAutoreleasedReturnValue([v179 options]);
    [v188 setPrintTargetThreadOnly:1];
  }

  v197 = @"light";
LABEL_182:

  -[NSMutableDictionary setObject:forKey:](v310, "setObject:forKey:", v197, @"bug_subtype");
  if (v306) {
    -[NSMutableDictionary setObject:forKey:](v310, "setObject:forKey:", v306, @"ht_enablement_prefix");
  }
  v301 = objc_alloc_init(&OBJC_CLASS___NSMutableData);
  [v179 printToMutableData:v301];
  +[MXSampleAnalysisParser sendDiagnosticReport:forType:forSourceID:]( &OBJC_CLASS___MXSampleAnalysisParser,  "sendDiagnosticReport:forType:forSourceID:",  v179,  2LL,  3LL);
  v198 = (void *)objc_claimAutoreleasedReturnValue([v319 startTime]);
  [v198 wallTime];
  double v200 = v199;

  v201 = (void *)objc_claimAutoreleasedReturnValue([v319 targetProcess]);
  v202 = (void *)objc_claimAutoreleasedReturnValue([v201 bundleIdentifier]);
  v203 = v202;
  if (v202)
  {
    v298 = v202;
  }

  else
  {
    v204 = sub_100002570(v312);
    v298 = (id)objc_claimAutoreleasedReturnValue(v204);
  }

  v320 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  if (v306) {
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v320,  "setObject:forKeyedSubscript:",  v306,  @"htEnablementPrefix");
  }
  v205 = (void *)objc_claimAutoreleasedReturnValue([v321 objectForKeyedSubscript:@"HangUUID"]);
  BOOL v206 = v205 == 0LL;

  if (v206)
  {
    id v207 = sub_1000199EC();
    v208 = (os_log_s *)objc_claimAutoreleasedReturnValue(v207);
    if (os_log_type_enabled(v208, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v208, OS_LOG_TYPE_DEFAULT, "Hang UUID is missing", buf, 2u);
    }

    -[NSMutableDictionary setObject:forKeyedSubscript:]( v320,  "setObject:forKeyedSubscript:",  &__kCFBooleanTrue,  @"HangUUIDMissing");
  }

  v209 = (void *)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](&OBJC_CLASS___HTPrefs, "sharedPrefs"));
  unsigned int v210 = [v209 shouldIncludeDisplayData];

  if (v210)
  {
    id v211 = sub_1000199EC();
    v212 = (os_log_s *)objc_claimAutoreleasedReturnValue(v211);
    if (os_log_type_enabled(v212, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v212, OS_LOG_TYPE_INFO, "Adding display info to spindump", buf, 2u);
    }

    v213 = (void *)objc_claimAutoreleasedReturnValue( +[HTDisplayParser displayInfoForSpindump:startAbsoluteTime:endAbsoluteTime:]( &OBJC_CLASS___HTDisplayParser,  "displayInfoForSpindump:startAbsoluteTime:endAbsoluteTime:",  v321,  v322,  v314));
    -[NSMutableDictionary addEntriesFromDictionary:](v320, "addEntriesFromDictionary:", v213);
  }

  v214 = (void *)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](&OBJC_CLASS___HTPrefs, "sharedPrefs"));
  unsigned int v215 = [v214 shouldIncludeNetworkState];

  if (v215)
  {
    v216 = (void *)objc_claimAutoreleasedReturnValue([v321 objectForKeyedSubscript:@"NetworkState"]);
    if (v216
      && (v217 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null")),
          unsigned __int8 v218 = [v216 isEqual:v217],
          v217,
          (v218 & 1) == 0))
    {
      id v232 = sub_1000199EC();
      v233 = (os_log_s *)objc_claimAutoreleasedReturnValue(v232);
      if (os_log_type_enabled(v233, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v233, OS_LOG_TYPE_INFO, "Adding network state to spindump", buf, 2u);
      }

      -[NSMutableDictionary addEntriesFromDictionary:](v320, "addEntriesFromDictionary:", v216);
    }

    else
    {
      id v219 = sub_1000199EC();
      v220 = (os_log_s *)objc_claimAutoreleasedReturnValue(v219);
      if (os_log_type_enabled(v220, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v220, OS_LOG_TYPE_INFO, "No network state for spindump", buf, 2u);
      }
    }
  }

  v234 = (void *)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](&OBJC_CLASS___HTPrefs, "sharedPrefs"));
  unsigned int v235 = [v234 shouldIncludeDiskInfo];

  if (v235)
  {
    v236 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    v237 = IOServiceMatching("AppleAPFSVolume");
    if (v237)
    {
      IOServiceGetMatchingServices(kIOMainPortDefault, v237, &existing);
      for (io_registry_entry_t k = IOIteratorNext(existing); k; io_registry_entry_t k = IOIteratorNext(existing))
      {
        Name = IORegistryEntryGetName(k, buf);
        if (Name)
        {
          v240 = sub_1000199EC();
          v241 = (os_log_s *)objc_claimAutoreleasedReturnValue(v240);
          if (os_log_type_enabled(v241, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)v355 = 67109376;
            *(_DWORD *)&v355[4] = Name;
            *(_WORD *)&v355[8] = 1024;
            *(_DWORD *)&v355[10] = k;
            _os_log_impl( (void *)&_mh_execute_header,  v241,  OS_LOG_TYPE_DEFAULT,  "Warn: 0x%08x: Could not get name for io_registry_entry_t 0x%x\n",  v355,  0xEu);
          }

          strcpy(buf, "UNKNOWN");
        }

        properties = 0LL;
        v242 = IORegistryEntryCreateCFProperties(k, &properties, kCFAllocatorDefault, 0);
        if (v242)
        {
          v243 = sub_1000199EC();
          v244 = (os_log_s *)objc_claimAutoreleasedReturnValue(v243);
          if (os_log_type_enabled(v244, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)v355 = 67109378;
            *(_DWORD *)&v355[4] = v242;
            *(_WORD *)&v355[8] = 2080;
            *(void *)&v355[10] = buf;
            _os_log_impl( (void *)&_mh_execute_header,  v244,  OS_LOG_TYPE_DEFAULT,  "Error: 0x%08x: Could not get properties for io_registry_entry_t %s\n",  v355,  0x12u);
          }
        }

        else
        {
          v245 = objc_claimAutoreleasedReturnValue( -[__CFDictionary objectForKey:]( properties, "objectForKey:", @"BSD Name"));
          snprintf(buf, 0x80uLL, "%s_%s", buf, (const char *)[v245 UTF8String]);

          v360[0] = @"BSD Name";
          v246 = (void *)objc_claimAutoreleasedReturnValue(-[__CFDictionary objectForKey:](properties, "objectForKey:", @"BSD Name"));
          v361[0] = v246;
          v360[1] = @"FormattedBy";
          v247 = (void *)objc_claimAutoreleasedReturnValue(-[__CFDictionary objectForKey:](properties, "objectForKey:", @"FormattedBy"));
          v361[1] = v247;
          v244 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v361,  v360,  2LL));

          v248 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", buf));
          if (objc_claimAutoreleasedReturnValue([v236 objectForKeyedSubscript:v248])) {
            sub_100033A50();
          }

          v249 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", buf));
          [v236 setObject:v244 forKeyedSubscript:v249];

          CFRelease(properties);
        }
      }

      IOObjectRelease(existing);
    }

    else
    {
      v250 = sub_1000199EC();
      v251 = (os_log_s *)objc_claimAutoreleasedReturnValue(v250);
      if (os_log_type_enabled(v251, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        *(void *)&uint8_t buf[4] = "AppleAPFSVolume";
        _os_log_impl( (void *)&_mh_execute_header,  v251,  OS_LOG_TYPE_DEFAULT,  "Error: Could not create matching dictionary for %s\n",  buf,  0xCu);
      }
    }

    *(void *)v355 = @"AppleAPFSVolume";
    *(void *)buf = v236;
    v252 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  buf,  v355,  1LL));
    v253 = sub_1000199EC();
    v254 = (os_log_s *)objc_claimAutoreleasedReturnValue(v253);
    if (os_log_type_enabled(v254, OS_LOG_TYPE_DEBUG)) {
      sub_1000339F0();
    }

    -[NSMutableDictionary addEntriesFromDictionary:](v320, "addEntriesFromDictionary:", v252);
  }

  v255 = (void *)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](&OBJC_CLASS___HTPrefs, "sharedPrefs"));
  v256 = [v255 shouldIncludeDiskInfo];

  if (v256)
  {
    v257 = sub_1000133E8();
    v258 = (void *)objc_claimAutoreleasedReturnValue(v257);
    -[NSMutableDictionary addEntriesFromDictionary:](v320, "addEntriesFromDictionary:", v258);

    v259 = sub_1000133FC();
    v260 = (void *)objc_claimAutoreleasedReturnValue(v259);
    -[NSMutableDictionary addEntriesFromDictionary:](v320, "addEntriesFromDictionary:", v260);
  }

  v261 = sub_10000F2C4(v295);
  v262 = (void *)objc_claimAutoreleasedReturnValue(v261);
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v320,  "setObject:forKeyedSubscript:",  v262,  @"blockingThreadStatus");

  if (v295 == 5)
  {
    v263 = (void *)objc_claimAutoreleasedReturnValue(-[HRMakeRunnableData blockingThreadInfo](v294, "blockingThreadInfo"));
    v264 = sub_100009DCC(v263);
    v265 = (void *)objc_claimAutoreleasedReturnValue(v264);
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v320,  "setObject:forKeyedSubscript:",  v265,  @"blockingThreadInfo");
  }

  v266 = sub_100019320((uint64_t)v322, (uint64_t)v314);
  v267 = (void *)objc_claimAutoreleasedReturnValue(v266);
  v268 = v267;
  if (v267)
  {
    v269 = (void *)objc_claimAutoreleasedReturnValue([v267 objectForKeyedSubscript:@"hangHistoryCount"]);
    v270 = (int)[v269 intValue] > 1;

    if (v270) {
      -[NSMutableDictionary setObject:forKeyedSubscript:]( v320,  "setObject:forKeyedSubscript:",  v268,  @"hangHistoryData");
    }
  }

  v271 = (void *)objc_claimAutoreleasedReturnValue( +[HTProcessLaunchExitRecord getProcessExitsAndLaunchesDuringHang:endTime:]( &OBJC_CLASS___HTProcessLaunchExitRecord,  "getProcessExitsAndLaunchesDuringHang:endTime:",  v322,  v314));
  if (v271) {
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v320,  "setObject:forKeyedSubscript:",  v271,  @"processExits");
  }
  v272 = (void *)objc_claimAutoreleasedReturnValue( +[NSJSONSerialization dataWithJSONObject:options:error:]( &OBJC_CLASS___NSJSONSerialization,  "dataWithJSONObject:options:error:",  v320,  1LL,  0LL));
  v273 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@-%@",  v316,  v305));
  -[NSMutableDictionary addEntriesFromDictionary:](v310, "addEntriesFromDictionary:", v307);
  *(void *)buf = 0LL;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000LL;
  v363 = sub_100009448;
  *(void *)&v364 = sub_100009458;
  *((void *)&v364 + 1) = 0LL;
  v274 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%lu", v302));
  v329[0] = _NSConcreteStackBlock;
  v329[1] = 3221225472LL;
  v329[2] = sub_100009F9C;
  v329[3] = &unk_1000710F8;
  v334 = buf;
  v324 = v301;
  v330 = v324;
  v275 = v272;
  v331 = v275;
  v335 = v296;
  v276 = v313;
  v332 = v276;
  v277 = v273;
  v338 = a4;
  v333 = v277;
  v336 = v303;
  v337 = v302;
  LODWORD(v273) = OSAWriteLogForSubmission(v274, v277, v310, 0LL, v329);

  if ((_DWORD)v273)
  {
    v278 = off_10007BB20;
    v325[0] = _NSConcreteStackBlock;
    v325[1] = 3221225472LL;
    v325[2] = sub_10000A144;
    v325[3] = &unk_100071120;
    v327 = v303;
    v326 = v298;
    v328 = v15;
    AnalyticsSendEventLazy(v278, v325);
    j__ADClientAddValueForScalarKey(@"com.apple.hangtracer.HTLogsConversion.Succeeded", 1LL);
    v279 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    v280 = (void *)objc_claimAutoreleasedReturnValue([v321 objectForKeyedSubscript:@"DisplayedInHUD"]);

    if (v280)
    {
      v281 = (void *)objc_claimAutoreleasedReturnValue([v321 objectForKeyedSubscript:@"DisplayedInHUD"]);
      -[NSMutableDictionary setObject:forKeyedSubscript:]( v279,  "setObject:forKeyedSubscript:",  v281,  @"displayedInHUD");
    }

    v282 = (void *)objc_claimAutoreleasedReturnValue([v321 objectForKeyedSubscript:@"HangNotificationUUID"]);

    if (v282)
    {
      v283 = (void *)objc_claimAutoreleasedReturnValue([v321 objectForKeyedSubscript:@"HangNotificationUUID"]);
      -[NSMutableDictionary setObject:forKeyedSubscript:](v279, "setObject:forKeyedSubscript:", v283, @"hangUUID");
    }

    if (v312) {
      -[NSMutableDictionary setObject:forKeyedSubscript:]( v279,  "setObject:forKeyedSubscript:",  v312,  @"processPath");
    }
    if (v302)
    {
      v284 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:"));
      -[NSMutableDictionary setObject:forKeyedSubscript:]( v279,  "setObject:forKeyedSubscript:",  v284,  @"htBugType");
    }

    if (v316)
    {
      v285 = +[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", sub_100002C0C(v316));
      v286 = (void *)objc_claimAutoreleasedReturnValue(v285);
      -[NSMutableDictionary setObject:forKeyedSubscript:]( v279,  "setObject:forKeyedSubscript:",  v286,  @"hangEventType");
    }

    if (v276 || *(void *)(*(void *)&buf[8] + 40LL))
    {
      v287 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
      v288 = v287;
      if (v276) {
        -[NSMutableArray addObject:](v287, "addObject:", v276);
      }
      if (*(void *)(*(void *)&buf[8] + 40LL)) {
        -[NSMutableArray addObject:](v288, "addObject:");
      }
      -[NSMutableDictionary setObject:forKeyedSubscript:]( v279,  "setObject:forKeyedSubscript:",  v288,  @"logFilePaths");
    }

    v289 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v200));
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v279,  "setObject:forKeyedSubscript:",  v289,  @"startWallTime");

    v290 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v15));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v279, "setObject:forKeyedSubscript:", v290, @"durationMS");

    HTReportHangLogsProcessed(v279);
  }

  else
  {
    v291 = sub_1000199EC();
    v292 = (os_log_s *)objc_claimAutoreleasedReturnValue(v291);
    if (os_log_type_enabled(v292, OS_LOG_TYPE_DEFAULT))
    {
      v293 = (id)objc_claimAutoreleasedReturnValue([v276 lastPathComponent]);
      *(_DWORD *)v355 = 138412546;
      *(void *)&v355[4] = v293;
      *(_WORD *)&v355[12] = 2112;
      *(void *)&v355[14] = v277;
      _os_log_impl( (void *)&_mh_execute_header,  v292,  OS_LOG_TYPE_DEFAULT,  "Post-Processing %@: Failed to write spindump %@!\n",  v355,  0x16u);
    }

    j__ADClientAddValueForScalarKey(@"com.apple.hangtracer.HTLogsConversion.FailedReportCrashSubmit", 1LL);
    if (a4) {
      sub_100009268(0LL, 9uLL, v303, v302);
    }
  }

  id v136 = *(id *)(*(void *)&buf[8] + 40LL);

  _Block_object_dispose(buf, 8);
  v319 = 0LL;
LABEL_118:

  return v136;
}

void sub_100009208(_Unwind_Exception *a1)
{
}

void sub_100009268(uint64_t a1, unint64_t a2, unint64_t a3, uint64_t a4)
{
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](&OBJC_CLASS___HTPrefs, "sharedPrefs"));
  id v9 = (__CFString *)objc_claimAutoreleasedReturnValue([v8 enablementPrefix]);

  if (!v9) {
    id v9 = &stru_100071CD0;
  }
  id v10 = sub_1000199EC();
  uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    __int16 v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", a1));
    id v13 = sub_100002B50(a2);
    int v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    double v15 = sub_100002B10(a3);
    int v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    *(_DWORD *)buf = 138413570;
    uint64_t v25 = @"EnablementType";
    __int16 v26 = 2112;
    id v27 = v9;
    __int16 v28 = 2112;
    double v29 = v12;
    __int16 v30 = 2112;
    unsigned __int8 v31 = v14;
    __int16 v32 = 2112;
    id v33 = v16;
    __int16 v34 = 2048;
    uint64_t v35 = a4;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_INFO,  "com.apple.hangtracer.hang_capture_tailspin_v3 %@: %@, spindump_successful: %@, failure_reason: %@, HangSubType: %@ , HTBugType: %ld",  buf,  0x3Eu);
  }

  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_10000A244;
  v18[3] = &unk_100071148;
  char v23 = a1;
  id v19 = v9;
  unint64_t v20 = a2;
  unint64_t v21 = a3;
  uint64_t v22 = a4;
  id v17 = v9;
  AnalyticsSendEventLazy(@"com.apple.hangtracer.hang_capture_tailspin_v3", v18);
}

uint64_t sub_100009448(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_100009458(uint64_t a1)
{
}

void sub_100009460(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (fcntl((int)[v3 fileDescriptor], 50, v15) != -1)
  {
    uint64_t v4 = objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v15));
    uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8LL);
    id v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v4;
  }

  int v7 = dup((int)[v3 fileDescriptor]);
  if (v7 == -1)
  {
    if (*(_BYTE *)(a1 + 64)) {
      sub_100009268(0LL, 0xBuLL, *(void *)(a1 + 48), *(void *)(a1 + 56));
    }
    id v10 = sub_1000199EC();
    uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_16;
    }
    *(_WORD *)buf = 0;
    __int16 v12 = "Failed to create a copy of file descriptor while trying to persist App launch logs";
    goto LABEL_15;
  }

  id v8 = fdopen(v7, "a");
  if (!v8)
  {
    if (*(_BYTE *)(a1 + 64)) {
      sub_100009268(0LL, 0xAuLL, *(void *)(a1 + 48), *(void *)(a1 + 56));
    }
    id v13 = sub_1000199EC();
    uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_16;
    }
    *(_WORD *)buf = 0;
    __int16 v12 = "Failed to open file stream while trying to persist App launch logs";
LABEL_15:
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, v12, buf, 2u);
LABEL_16:

    goto LABEL_17;
  }

  id v9 = v8;
  [*(id *)(a1 + 32) printToStream:v8];
  fclose(v9);
  if (*(_BYTE *)(a1 + 64)) {
    sub_100009268(1LL, 0LL, *(void *)(a1 + 48), *(void *)(a1 + 56));
  }
LABEL_17:
}

void sub_100009604(int a1, int a2, void *a3, void *a4, void *a5)
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = sub_1000199EC();
  id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_INFO,  "Starting submission of tailspin to diagnostic pipeline",  buf,  2u);
  }

  if (a2 == 1)
  {
    int v14 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:@"HangType"]);
    if (v14)
    {
      double v15 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:@"HangType"]);
      unint64_t v16 = (int)[v15 intValue];
    }

    else
    {
      unint64_t v16 = 0LL;
    }

    unint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:@"durationms"]);
    if (v21)
    {
      uint64_t v22 = v21;
      [v21 doubleValue];
      double v24 = v23;
      uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](&OBJC_CLASS___HTPrefs, "sharedPrefs"));
      double v26 = (double)(unint64_t)[v25 runloopHangDurationThresholdMSec];

      if (v24 >= v26)
      {
        [v22 doubleValue];
        double v32 = v31;
        id v33 = (void *)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](&OBJC_CLASS___HTPrefs, "sharedPrefs"));
        double v34 = (double)(unint64_t)[v33 runloopLongHangDurationThresholdMSec];

        id v27 = @"Long Hang";
        if (v32 < v34) {
          id v27 = @"Normal Hang";
        }
      }

      else
      {
        id v27 = @"Micro Hang";
      }

      uint64_t v35 = @"Third Party App";
      if (a1) {
        uint64_t v35 = @"First Party App";
      }
      id v19 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ Hang (%@)",  v35,  v27));
      unsigned __int8 v36 = sub_100002B10(v16);
      unsigned int v18 = (void *)objc_claimAutoreleasedReturnValue(v36);

      unint64_t v20 = @"com.apple.hangtracer";
LABEL_22:
      id v73 = 0LL;
      int v37 = DRShouldGatherLog(v20, v19, v11, @"tailspin", &v73);
      unsigned __int8 v38 = (__CFString *)v73;
      id v39 = sub_1000199EC();
      uint64_t v40 = (os_log_s *)objc_claimAutoreleasedReturnValue(v39);
      BOOL v41 = os_log_type_enabled(v40, OS_LOG_TYPE_INFO);
      if (!v37)
      {
        if (v41)
        {
          id v63 = (void *)objc_claimAutoreleasedReturnValue([v10 lastPathComponent]);
          *(_DWORD *)buf = 138412546;
          id v77 = v63;
          __int16 v78 = 2112;
          id v79 = v38;
          _os_log_impl( (void *)&_mh_execute_header,  v40,  OS_LOG_TYPE_INFO,  "Post Processing %@: Should NOT submit to Diagnostic Pipeline, error (%@)",  buf,  0x16u);
        }

        goto LABEL_41;
      }

      id v69 = v9;
      if (v41)
      {
        id v42 = (void *)objc_claimAutoreleasedReturnValue([v10 lastPathComponent]);
        *(_DWORD *)buf = 138412290;
        id v77 = v42;
        _os_log_impl( (void *)&_mh_execute_header,  v40,  OS_LOG_TYPE_INFO,  "Post Processing %@: Should submit to Diagnostic Pipeline",  buf,  0xCu);
      }

      id v68 = v18;

      sub_100002688(@"/tmp/HangTracer/", 1);
      id v43 = sub_1000199EC();
      unsigned __int8 v44 = (os_log_s *)objc_claimAutoreleasedReturnValue(v43);
      if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
      {
        id v45 = (void *)objc_claimAutoreleasedReturnValue([v10 lastPathComponent]);
        uint32_t v46 = (__CFString *)objc_claimAutoreleasedReturnValue([v10 lastPathComponent]);
        *(_DWORD *)buf = 138412802;
        id v77 = v45;
        __int16 v78 = 2112;
        id v79 = v46;
        __int16 v80 = 2112;
        v81 = @"/tmp/HangTracer/";
        _os_log_impl( (void *)&_mh_execute_header,  v44,  OS_LOG_TYPE_DEFAULT,  "Post Processing %@: Copy tailspin %@ to directory accesible by mobile %@",  buf,  0x20u);
      }

      unint64_t v47 = (void *)objc_claimAutoreleasedReturnValue([v10 lastPathComponent]);
      uint64_t v40 = (os_log_s *)objc_claimAutoreleasedReturnValue([@"/tmp/HangTracer/" stringByAppendingPathComponent:v47]);

      unsigned int v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
      uint64_t v72 = v38;
      unsigned int v49 = [v48 copyItemAtPath:v10 toPath:v40 error:&v72];
      id v50 = v72;

      if (v49)
      {
        id v51 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
        v74[0] = NSFileOwnerAccountName;
        v74[1] = NSFileGroupOwnerAccountName;
        v75[0] = @"mobile";
        v75[1] = @"mobile";
        BOOL v52 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v75,  v74,  2LL));
        id v71 = v50;
        unsigned int v53 = [v51 setAttributes:v52 ofItemAtPath:v40 error:&v71];
        id v54 = v71;

        if (v53)
        {
          id v70 = v54;
          unsigned int v18 = v68;
          int v55 = DRSubmitLog(v20, v19, v68, v11, @"tailspin", v40, 1LL, &v70);
          id v50 = v70;

          id v56 = sub_1000199EC();
          uint64_t v57 = (os_log_s *)objc_claimAutoreleasedReturnValue(v56);
          BOOL v58 = os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT);
          id v9 = v69;
          if (v55)
          {
            if (v58)
            {
              BOOL v59 = (void *)objc_claimAutoreleasedReturnValue([v10 lastPathComponent]);
              *(_DWORD *)buf = 138412290;
              id v77 = v59;
              id v60 = "Post Processing %@: Submitted to Diagnostic Pipeline Successfully";
              __int16 v61 = v57;
              uint32_t v62 = 12;
LABEL_45:
              _os_log_impl((void *)&_mh_execute_header, v61, OS_LOG_TYPE_DEFAULT, v60, buf, v62);
            }
          }

          else if (v58)
          {
            BOOL v59 = (void *)objc_claimAutoreleasedReturnValue([v10 lastPathComponent]);
            *(_DWORD *)buf = 138412546;
            id v77 = v59;
            __int16 v78 = 2112;
            id v79 = v50;
            id v60 = "Post Processing %@: Failed submission to Diagnostic Pipeline due to Error (%@)";
            __int16 v61 = v57;
            uint32_t v62 = 22;
            goto LABEL_45;
          }

LABEL_40:
          unsigned __int8 v38 = v50;
LABEL_41:

          goto LABEL_42;
        }

        id v66 = sub_1000199EC();
        uint64_t v57 = (os_log_s *)objc_claimAutoreleasedReturnValue(v66);
        id v9 = v69;
        if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
        {
          id v67 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s lastPathComponent](v40, "lastPathComponent"));
          *(_DWORD *)buf = 138412802;
          id v77 = v67;
          __int16 v78 = 2112;
          id v79 = (const __CFString *)v40;
          __int16 v80 = 2112;
          v81 = v54;
          _os_log_impl( (void *)&_mh_execute_header,  v57,  OS_LOG_TYPE_DEFAULT,  "Post Processing %@: Failed to update ownership of tailspin %@ to 'mobile', error (%@)",  buf,  0x20u);
        }

        id v50 = v54;
      }

      else
      {
        id v64 = sub_1000199EC();
        uint64_t v57 = (os_log_s *)objc_claimAutoreleasedReturnValue(v64);
        if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
        {
          double v65 = (void *)objc_claimAutoreleasedReturnValue([v10 lastPathComponent]);
          *(_DWORD *)buf = 138412802;
          id v77 = v65;
          __int16 v78 = 2112;
          id v79 = @"/tmp/HangTracer/";
          __int16 v80 = 2112;
          v81 = v50;
          _os_log_impl( (void *)&_mh_execute_header,  v57,  OS_LOG_TYPE_DEFAULT,  "Post Processing %@: Failed to copy tailspin to %@, error (%@)",  buf,  0x20u);
        }
      }

      unsigned int v18 = v68;
      goto LABEL_40;
    }

    id v30 = sub_1000199EC();
    id v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "Error unwrapping hang duration during tailspin submission to diagnostic pipeline, aborting submission",  buf,  2u);
    }
  }

  else
  {
    uint64_t v17 = objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:@"reason"]);
    if (v17)
    {
      unsigned int v18 = (void *)v17;
      id v19 = (os_log_s *)@"ApplicationLaunch";
      unint64_t v20 = @"com.apple.sentry";
      goto LABEL_22;
    }

    id v28 = sub_1000199EC();
    double v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_DEFAULT,  "Error unwrapping issue description during tailspin submission to diagnostic pipeline, aborting submission",  buf,  2u);
    }

    id v19 = (os_log_s *)@"ApplicationLaunch";
  }

LABEL_42:
}

HTOrderedNSDict *sub_100009DCC(void *a1)
{
  id v1 = a1;
  id v2 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:",  @"topBlockingProcess",  @"topBlockingThreadId",  @"topBlockingPid",  @"topBlockingTimeMS",  @"otherBlockingThreads",  @"nextTopBlockingThreadInfo",  0LL));
  id v3 = objc_opt_new(&OBJC_CLASS___HTOrderedNSDict);
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  id v4 = v2;
  id v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v15;
    do
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v14 + 1) + 8LL * (void)i);
        id v10 = (void *)objc_claimAutoreleasedReturnValue([v1 objectForKeyedSubscript:v9]);
        if (v10)
        {
          if ([v9 isEqual:@"nextTopBlockingThreadInfo"])
          {
            uint64_t v11 = sub_100009DCC(v10);
            id v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
            -[HTOrderedNSDict setObject:forKey:](v3, "setObject:forKey:", v12, v9);
          }

          else
          {
            -[HTOrderedNSDict setObject:forKey:](v3, "setObject:forKey:", v10, v9);
          }
        }
      }

      id v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }

    while (v6);
  }

  return v3;
}

void sub_100009F9C(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (fcntl((int)[v3 fileDescriptor], 50, v19) != -1)
  {
    uint64_t v4 = objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v19));
    uint64_t v5 = *(void *)(*(void *)(a1 + 64) + 8LL);
    id v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v4;
  }

  [v3 writeData:*(void *)(a1 + 32)];
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([@"\n" dataUsingEncoding:4]);
  [v3 writeData:v7];

  [v3 writeData:*(void *)(a1 + 40)];
  id v8 = *(const char **)(a1 + 72);
  int v9 = [v3 fileDescriptor];

  sub_100019BC8(v8, v9);
  id v10 = sub_1000199EC();
  uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) lastPathComponent]);
    id v13 = (void *)v12;
    uint64_t v14 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 40LL);
    if (!v14) {
      uint64_t v14 = *(void *)(a1 + 56);
    }
    *(_DWORD *)buf = 138412546;
    uint64_t v16 = v12;
    __int16 v17 = 2112;
    uint64_t v18 = v14;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Post-Processing %@: Wrote %@ successfully! (\n",  buf,  0x16u);
  }

  if (*(_BYTE *)(a1 + 96)) {
    sub_100009268(1LL, 0LL, *(void *)(a1 + 80), *(void *)(a1 + 88));
  }
}

id sub_10000A144(uint64_t a1)
{
  v9[0] = off_10007BB38;
  v8[0] = off_10007BB28;
  v8[1] = off_10007BB40;
  id v2 = sub_100002B10(*(void *)(a1 + 40));
  id v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  uint64_t v4 = *(void *)(a1 + 32);
  v9[1] = v3;
  v9[2] = v4;
  v8[2] = off_10007BB50;
  v8[3] = off_10007BB48;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", *(double *)(a1 + 48)));
  v9[3] = v5;
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v9,  v8,  4LL));

  return v6;
}

id sub_10000A244(uint64_t a1)
{
  v9[0] = *(void *)(a1 + 32);
  v8[0] = @"EnablementType";
  v8[1] = @"SpindumpSuccessful";
  id v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", *(unsigned __int8 *)(a1 + 64)));
  v9[1] = v2;
  v8[2] = @"SpindumpFailureReason";
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", *(void *)(a1 + 40)));
  v9[2] = v3;
  v8[3] = @"HangSubType";
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", *(void *)(a1 + 48)));
  v9[3] = v4;
  void v8[4] = @"HTBugType";
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", *(void *)(a1 + 56)));
  void v9[4] = v5;
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v9,  v8,  5LL));

  return v6;
}

uint64_t sub_10000A37C(uint64_t a1, int a2)
{
  id v4 = sub_1000199EC();
  uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  id v6 = v5;
  if (a2)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      int v13 = 138412290;
      uint64_t v14 = v7;
      id v8 = "Successfully augmented tailspin at %@ with os signposts";
      int v9 = v6;
      os_log_type_t v10 = OS_LOG_TYPE_INFO;
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, v9, v10, v8, (uint8_t *)&v13, 0xCu);
    }
  }

  else if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = *(void *)(a1 + 32);
    int v13 = 138412290;
    uint64_t v14 = v11;
    id v8 = "Failed to augment tailspin at %@ with os signposts";
    int v9 = v6;
    os_log_type_t v10 = OS_LOG_TYPE_DEFAULT;
    goto LABEL_6;
  }

  return dispatch_semaphore_signal((dispatch_semaphore_t)qword_10007C1A8);
}

void sub_10000A47C(void *a1)
{
  id v1 = a1;
  id v2 = sub_1000199EC();
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    *(void *)&uint8_t buf[4] = v1;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Post-Processing Tailspin file: %@\n", buf, 0xCu);
  }

  j__ADClientAddValueForScalarKey(@"com.apple.hangtracer.HTLogsConversion.Attempted", 1LL);
  id v228 = v1;
  id v4 = sub_1000119D8((char *)[v228 UTF8String], 0);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  if (!v5)
  {
    unlink((const char *)[v228 UTF8String]);
    sub_100009268(0LL, 3uLL, 0LL, 1LL);
    goto LABEL_227;
  }

  __int128 v278 = 0u;
  __int128 v279 = 0u;
  __int128 v276 = 0u;
  __int128 v277 = 0u;
  id obj = v5;
  id v6 = [obj countByEnumeratingWithState:&v276 objects:v306 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v277;
    while (2)
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v277 != v7) {
          objc_enumerationMutation(obj);
        }
        int v9 = *(void **)(*((void *)&v276 + 1) + 8LL * (void)i);
        os_log_type_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:@"IsThirdPartyDevSupportModeHang"]);
        if (v10)
        {
          uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:@"IsThirdPartyDevSupportModeHang"]);
          unsigned __int8 v12 = [v11 BOOLValue];

          if ((v12 & 1) != 0)
          {
            int v13 = 1;
            goto LABEL_16;
          }
        }
      }

      id v6 = [obj countByEnumeratingWithState:&v276 objects:v306 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }

  int v13 = 0;
LABEL_16:

  id v14 = sub_100002940();
  __int128 v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  __int16 v17 = (void *)objc_claimAutoreleasedReturnValue([v16 attributesOfItemAtPath:v228 error:0]);
  id v18 = [v17 fileSize];

  id v19 = v15;
  if (os_signpost_enabled(v19))
  {
    unint64_t v20 = "NO";
    *(_DWORD *)buf = 138412802;
    *(void *)&uint8_t buf[4] = v228;
    if (v13) {
      unint64_t v20 = "YES";
    }
    *(_WORD *)&_BYTE buf[12] = 2048;
    *(void *)&buf[14] = v18;
    *(_WORD *)&buf[22] = 2080;
    *(void *)&buf[24] = v20;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v19,  OS_SIGNPOST_INTERVAL_BEGIN,  0xEEEEB0B5B2B2EEEELL,  "TailspinConversionInterval",  "File=%@, Bytes=%{signpost.telemetry:number1}llu, Symbolicate=%{signpost.telemetry:string1}s enableTelemetry=YES ",  buf,  0x20u);
  }

  v225 = v19;

  if (v13)
  {
    id v21 = v228;
    uint64_t v22 = (const char *)[v21 cStringUsingEncoding:4];
    uint64_t v23 = mach_absolute_time();
    uint64_t v24 = open(v22, 2);
    if ((_DWORD)v24 == -1)
    {
      id v29 = sub_1000199EC();
      uint64_t v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = v21;
        _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "Failed to open tailspin to add symbols at %@",  buf,  0xCu);
      }
    }

    else
    {
      blocio_registry_entry_t k = (void **)UnsafePointer;
      *(void *)v315 = &__kCFBooleanFalse;
      uint64_t v25 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v315,  &block,  1LL));
      id v26 = sub_1000199EC();
      id v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG)) {
        sub_100034048();
      }

      uint64_t v28 = qword_10007C1A0;
      *(void *)buf = _NSConcreteStackBlock;
      *(void *)&uint8_t buf[8] = 3221225472LL;
      *(void *)&buf[16] = sub_10000C8B0;
      *(void *)&buf[24] = &unk_100071170;
      *(void *)&buf[32] = v21;
      tailspin_augment_output(v24, v25, v28, buf);
      dispatch_semaphore_wait((dispatch_semaphore_t)qword_10007C1A8, 0xFFFFFFFFFFFFFFFFLL);
    }

    uint64_t v30 = mach_absolute_time();
    double v31 = sub_100003000(v30 - v23);
    *(void *)&__int128 v297 = _NSConcreteStackBlock;
    *((void *)&v297 + 1) = 3221225472LL;
    *(void *)&__int128 v298 = sub_10000C9B0;
    *((void *)&v298 + 1) = &unk_100071190;
    *(double *)&__int128 v299 = v31;
    AnalyticsSendEventLazy(@"com.apple.hangtracer.hangreporter.tailspinsymbolication.v1", &v297);
  }

  double v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  id v226 = [[SASampleStore alloc] initForFileParsing];
  [v226 setShouldGatherKextStat:0];
  [v226 setDataGatheringOptions:7];
  id v33 = v228;
  id v275 = 0LL;
  objc_msgSend(v226, "parseKTraceFile:warningsOut:errorOut:", objc_msgSend(v33, "UTF8String"), v32, &v275);
  v224 = (__CFString *)v275;
  __int128 v271 = 0u;
  __int128 v272 = 0u;
  __int128 v273 = 0u;
  __int128 v274 = 0u;
  id v249 = v32;
  id v34 = [v249 countByEnumeratingWithState:&v271 objects:v305 count:16];
  if (v34)
  {
    uint64_t v35 = *(void *)v272;
    do
    {
      for (j = 0LL; j != v34; j = (char *)j + 1)
      {
        if (*(void *)v272 != v35) {
          objc_enumerationMutation(v249);
        }
        uint64_t v37 = *(void *)(*((void *)&v271 + 1) + 8LL * (void)j);
        id v38 = sub_1000199EC();
        id v39 = (os_log_s *)objc_claimAutoreleasedReturnValue(v38);
        if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          *(void *)&uint8_t buf[4] = v33;
          *(_WORD *)&_BYTE buf[12] = 2112;
          *(void *)&buf[14] = v37;
          _os_log_impl( (void *)&_mh_execute_header,  v39,  OS_LOG_TYPE_DEFAULT,  "WARNING trying to create sample store from %@: %@\n",  buf,  0x16u);
        }
      }

      id v34 = [v249 countByEnumeratingWithState:&v271 objects:v305 count:16];
    }

    while (v34);
  }

  if (!v226)
  {
    sub_100009268(0LL, 4uLL, 0LL, 1LL);
    id v63 = sub_1000199EC();
    id v64 = (os_log_s *)objc_claimAutoreleasedReturnValue(v63);
    if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
    {
      double v65 = @"Unknown error";
      if (v224) {
        double v65 = v224;
      }
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = v33;
      *(_WORD *)&_BYTE buf[12] = 2112;
      *(void *)&buf[14] = v65;
      _os_log_impl( (void *)&_mh_execute_header,  v64,  OS_LOG_TYPE_DEFAULT,  "ERROR trying to create sample store from %@: %@\n",  buf,  0x16u);
    }

    unlink((const char *)[v33 UTF8String]);
    goto LABEL_226;
  }

  id v256 = v33;
  id v254 = v226;
  id v40 = obj;
  v250 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v299 = 0u;
  __int128 v300 = 0u;
  __int128 v297 = 0u;
  __int128 v298 = 0u;
  id v257 = v40;
  int v41 = 0;
  int v42 = 0;
  id v43 = [v257 countByEnumeratingWithState:&v297 objects:buf count:16];
  if (v43)
  {
    uint64_t v44 = *(void *)v298;
    do
    {
      for (io_registry_entry_t k = 0LL; k != v43; io_registry_entry_t k = (char *)k + 1)
      {
        if (*(void *)v298 != v44) {
          objc_enumerationMutation(v257);
        }
        uint32_t v46 = *(void **)(*((void *)&v297 + 1) + 8LL * (void)k);
        unint64_t v47 = (void *)objc_claimAutoreleasedReturnValue([v46 objectForKeyedSubscript:@"HangType"]);
        signed int v48 = [v47 intValue];

        if (v48 == 5)
        {
          unsigned int v49 = (void *)objc_claimAutoreleasedReturnValue([v46 objectForKeyedSubscript:@"FenceInfoUpdated"]);
          BOOL v50 = v49 == 0LL;

          if (v50)
          {
            [v46 setObject:&__kCFBooleanFalse forKeyedSubscript:@"FenceInfoUpdated"];
            -[NSMutableArray addObject:](v250, "addObject:", v46);
            ++v42;
          }

          else
          {
            ++v41;
          }
        }

        else if (sub_100002B40(v48))
        {
          id v51 = sub_1000199EC();
          BOOL v52 = (os_log_s *)objc_claimAutoreleasedReturnValue(v51);
          if (os_log_type_enabled(v52, OS_LOG_TYPE_FAULT))
          {
            unsigned int v53 = sub_100002B10(v48);
            id v54 = (void *)objc_claimAutoreleasedReturnValue(v53);
            *(_DWORD *)v315 = 138543618;
            *(void *)&v315[4] = v54;
            *(_WORD *)&v315[12] = 2048;
            *(void *)&v315[14] = v48;
            _os_log_fault_impl( (void *)&_mh_execute_header,  v52,  OS_LOG_TYPE_FAULT,  "Unsupported fence hang %{public}@ (%ld)",  v315,  0x16u);
          }
        }
      }

      id v43 = [v257 countByEnumeratingWithState:&v297 objects:buf count:16];
    }

    while (v43);
  }

  BOOL v55 = -[NSMutableArray count](v250, "count") == 0LL;
  id v56 = sub_1000199EC();
  uint64_t v57 = (os_log_s *)objc_claimAutoreleasedReturnValue(v56);
  BOOL v58 = os_log_type_enabled(v57, OS_LOG_TYPE_DEBUG);
  if (v55)
  {
    if (v58) {
      sub_100033C98(v41, v57);
    }
  }

  else
  {
    if (v58) {
      sub_100033FD8();
    }

    v295[0] = _NSConcreteStackBlock;
    v295[1] = 3221225472LL;
    v295[2] = sub_10000CA50;
    v295[3] = &unk_1000711B8;
    v296 = v250;
    BOOL v59 = objc_retainBlock(v295);
    uint64_t v291 = 0LL;
    v292 = &v291;
    uint64_t v293 = 0x2020000000LL;
    uint64_t v294 = ktrace_session_create();
    uint64_t v60 = v292[3];
    if (v60)
    {
      if (ktrace_set_file(v60, [v256 cStringUsingEncoding:4]))
      {
        ktrace_session_destroy(v292[3]);
        id v61 = sub_1000199EC();
        uint32_t v62 = (os_log_s *)objc_claimAutoreleasedReturnValue(v61);
        if (os_log_type_enabled(v62, OS_LOG_TYPE_FAULT)) {
          sub_100033F78();
        }
      }

      else
      {
        id v67 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
        id v68 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
        uint64_t v69 = v292[3];
        v288[0] = _NSConcreteStackBlock;
        v288[1] = 3221225472LL;
        v288[2] = sub_10000CC04;
        v288[3] = &unk_100071208;
        id v70 = v59;
        id v290 = v70;
        uint32_t v62 = v67;
        v289 = v62;
        if (ktrace_events_single(v69, 835322368LL, v288))
        {
          id v71 = sub_1000199EC();
          uint64_t v72 = (os_log_s *)objc_claimAutoreleasedReturnValue(v71);
          if (os_log_type_enabled(v72, OS_LOG_TYPE_FAULT)) {
            sub_100033F18();
          }

          ktrace_session_destroy(v292[3]);
        }

        else
        {
          uint64_t v73 = v292[3];
          v285[0] = _NSConcreteStackBlock;
          v285[1] = 3221225472LL;
          v285[2] = sub_10000CDAC;
          v285[3] = &unk_100071208;
          id v74 = v70;
          id v287 = v74;
          v75 = v62;
          v286 = v75;
          if (ktrace_events_single(v73, 835322376LL, v285))
          {
            id v76 = sub_1000199EC();
            id v77 = (os_log_s *)objc_claimAutoreleasedReturnValue(v76);
            if (os_log_type_enabled(v77, OS_LOG_TYPE_FAULT)) {
              sub_100033EB8();
            }

            ktrace_session_destroy(v292[3]);
          }

          else
          {
            uint64_t v78 = v292[3];
            *(void *)v315 = _NSConcreteStackBlock;
            *(void *)&v315[8] = 3221225472LL;
            *(void *)&v315[16] = sub_10000CEF4;
            v316 = &unk_100071258;
            id v79 = v74;
            id v320 = v79;
            id v80 = v254;
            id v317 = v80;
            v81 = v75;
            v318 = v81;
            __int16 v82 = v68;
            v319 = v82;
            if (ktrace_events_single(v78, 835322400LL, v315))
            {
              id v83 = sub_1000199EC();
              uint64_t v84 = (os_log_s *)objc_claimAutoreleasedReturnValue(v83);
              if (os_log_type_enabled(v84, OS_LOG_TYPE_FAULT)) {
                sub_100033E58();
              }

              ktrace_session_destroy(v292[3]);
            }

            else
            {
              v241 = (void (**)(id, void ***))v79;
              dispatch_semaphore_t v85 = dispatch_semaphore_create(0LL);
              uint64_t v86 = v292[3];
              v282[0] = _NSConcreteStackBlock;
              v282[1] = 3221225472LL;
              v282[2] = sub_10000D3A0;
              v282[3] = &unk_100071280;
              v284 = &v291;
              obja = v85;
              v283 = obja;
              ktrace_set_completion_handler(v86, v282);
              uint64_t v87 = v292[3];
              dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
              id v89 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
              LODWORD(v87) = ktrace_start(v87, v89);

              if ((_DWORD)v87)
              {
                id v90 = sub_1000199EC();
                id v91 = (os_log_s *)objc_claimAutoreleasedReturnValue(v90);
                if (os_log_type_enabled(v91, OS_LOG_TYPE_FAULT)) {
                  sub_100033DF8();
                }

                ktrace_session_destroy(v292[3]);
              }

              else
              {
                dispatch_time_t v92 = dispatch_time(0LL, 100000000000LL);
                if (dispatch_semaphore_wait(obja, v92))
                {
                  id v93 = sub_1000199EC();
                  double v94 = (os_log_s *)objc_claimAutoreleasedReturnValue(v93);
                  if (os_log_type_enabled(v94, OS_LOG_TYPE_FAULT)) {
                    sub_100033D78(v42, v94);
                  }

                  blocio_registry_entry_t k = _NSConcreteStackBlock;
                  uint64_t v308 = 3221225472LL;
                  v309 = sub_10000D3DC;
                  v310 = &unk_1000712A8;
                  v311 = (NSMutableDictionary *)&v291;
                  dispatch_async(v89, &block);
                }

                else
                {
                  v280[0] = 0LL;
                  v280[1] = v280;
                  v280[2] = 0x2020000000LL;
                  int v281 = 0;
                  blocio_registry_entry_t k = _NSConcreteStackBlock;
                  uint64_t v308 = 3221225472LL;
                  v309 = sub_10000D3F8;
                  v310 = &unk_100071338;
                  v311 = v82;
                  id v312 = v80;
                  v313 = v81;
                  v314 = v280;
                  v241[2](v241, &block);

                  _Block_object_dispose(v280, 8);
                }
              }
            }
          }
        }
      }
    }

    else
    {
      id v66 = sub_1000199EC();
      uint32_t v62 = (os_log_s *)objc_claimAutoreleasedReturnValue(v66);
      if (os_log_type_enabled(v62, OS_LOG_TYPE_FAULT)) {
        sub_100033D08(v42, v62);
      }
    }

    _Block_object_dispose(&v291, 8);
    uint64_t v57 = (os_log_s *)v296;
  }

  __int128 v267 = 0u;
  __int128 v268 = 0u;
  __int128 v269 = 0u;
  __int128 v270 = 0u;
  id v251 = v257;
  id v95 = [v251 countByEnumeratingWithState:&v267 objects:v304 count:16];
  if (v95)
  {
    uint64_t v258 = *(void *)v268;
    do
    {
      for (m = 0LL; m != v95; m = (char *)m + 1)
      {
        if (*(void *)v268 != v258) {
          objc_enumerationMutation(v251);
        }
        v97 = *(void **)(*((void *)&v267 + 1) + 8LL * (void)m);
        __int16 v98 = (void *)objc_claimAutoreleasedReturnValue([v97 objectForKeyedSubscript:@"ProcessPath"]);
        v99 = (void *)objc_claimAutoreleasedReturnValue([v98 lastPathComponent]);
        id v100 = sub_100001D24(v99, 0LL, v98, v97);
        uint64_t v101 = (void *)objc_claimAutoreleasedReturnValue(v100);
        id v102 = (void *)objc_claimAutoreleasedReturnValue([v101 objectForKeyedSubscript:@"is_first_party"]);
        if (v102)
        {
          id v103 = (id)objc_claimAutoreleasedReturnValue([v101 objectForKeyedSubscript:@"is_first_party"]);
        }

        else
        {
          id v103 = &__kCFBooleanTrue;
        }

        [v97 setObject:v103 forKeyedSubscript:@"isFirstPartyApp"];
        [v97 setObject:v101 forKeyedSubscript:@"IPSMetaDictionary"];
      }

      id v95 = [v251 countByEnumeratingWithState:&v267 objects:v304 count:16];
    }

    while (v95);
  }

  if ((unint64_t)[v251 count] < 2)
  {
    id v159 = v251;
    goto LABEL_163;
  }

  id v104 = [v251 mutableCopy];
  if (![v104 count]) {
    goto LABEL_162;
  }
  unint64_t v105 = 0LL;
  do
  {
    unint64_t v237 = v105;
    dispatch_queue_t queue = (dispatch_queue_t)objc_claimAutoreleasedReturnValue(objc_msgSend(v104, "objectAtIndexedSubscript:"));
    v106 = (void *)objc_claimAutoreleasedReturnValue(-[dispatch_queue_s objectForKeyedSubscript:](queue, "objectForKeyedSubscript:", @"PID"));
    unsigned int v107 = [v106 intValue];

    id v108 = (void *)objc_claimAutoreleasedReturnValue(-[dispatch_queue_s objectForKeyedSubscript:](queue, "objectForKeyedSubscript:", @"StartTime"));
    v259 = [v108 unsignedLongLongValue];

    v109 = (void *)objc_claimAutoreleasedReturnValue(-[dispatch_queue_s objectForKeyedSubscript:](queue, "objectForKeyedSubscript:", @"EndTime"));
    objb = [v109 unsignedLongLongValue];

    double v110 = sub_100002FAC(objb - v259);
    v111 = (void *)objc_claimAutoreleasedReturnValue(-[dispatch_queue_s objectForKeyedSubscript:](queue, "objectForKeyedSubscript:", @"HangType"));
    BOOL v112 = sub_100002B40((int)[v111 intValue]);

    v113 = (void *)objc_claimAutoreleasedReturnValue( -[dispatch_queue_s objectForKeyedSubscript:]( queue,  "objectForKeyedSubscript:",  @"IsThirdPartyDevSupportModeHang"));
    if (v113)
    {
      unsigned __int8 v114 = (void *)objc_claimAutoreleasedReturnValue( -[dispatch_queue_s objectForKeyedSubscript:]( queue,  "objectForKeyedSubscript:",  @"IsThirdPartyDevSupportModeHang"));
      unsigned int v115 = [v114 BOOLValue];

      int v116 = v115 ^ 1;
    }

    else
    {
      int v116 = 1;
    }

    id v117 = (void *)objc_claimAutoreleasedReturnValue( -[dispatch_queue_s objectForKeyedSubscript:]( queue,  "objectForKeyedSubscript:",  @"isFirstPartyApp"));
    unsigned int v118 = [v117 BOOLValue];

    v242 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableIndexSet indexSet](&OBJC_CLASS___NSMutableIndexSet, "indexSet"));
    unint64_t v239 = (unint64_t)v110;
    if (v237 + 1 >= (unint64_t)[v104 count])
    {
LABEL_132:
      BOOL v137 = [v242 count] == 0;
      id v138 = sub_1000199EC();
      v139 = (os_log_s *)objc_claimAutoreleasedReturnValue(v138);
      v140 = v139;
      if (v137)
      {
        if (os_log_type_enabled(v139, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 67109888;
          *(_DWORD *)&uint8_t buf[4] = v107;
          *(_WORD *)&uint8_t buf[8] = 2048;
          *(void *)&buf[10] = v259;
          *(_WORD *)&buf[18] = 2048;
          *(void *)&buf[20] = objb;
          *(_WORD *)&buf[28] = 2048;
          *(void *)&buf[30] = v239;
          _os_log_debug_impl( (void *)&_mh_execute_header,  v140,  OS_LOG_TYPE_DEBUG,  "[%d] %llu-%llu (%llums) does not overlap any other hangs",  buf,  0x26u);
        }
      }

      else
      {
        if (os_log_type_enabled(v139, OS_LOG_TYPE_DEFAULT))
        {
          id v141 = [v242 count];
          *(_DWORD *)buf = 134219008;
          *(void *)&uint8_t buf[4] = v141;
          *(_WORD *)&_BYTE buf[12] = 1024;
          *(_DWORD *)&buf[14] = v107;
          *(_WORD *)&buf[18] = 2048;
          *(void *)&buf[20] = v259;
          *(_WORD *)&buf[28] = 2048;
          *(void *)&buf[30] = objb;
          *(_WORD *)&buf[38] = 2048;
          *(void *)v322 = v239;
          _os_log_impl( (void *)&_mh_execute_header,  v140,  OS_LOG_TYPE_DEFAULT,  "Removing %lu hangs in favor of overlapping [%d] %llu-%llu (%llums)",  buf,  0x30u);
        }

        [v104 removeObjectsAtIndexes:v242];
      }

      ++v237;
      goto LABEL_140;
    }

    int v235 = v118 & v112 ^ 1;
    int v231 = v118 & !v112;
    int v229 = v116 | v112;
    int v227 = v116 | !v112;
    unint64_t v119 = v237 + 1;
    while (1)
    {
      v120 = (void *)objc_claimAutoreleasedReturnValue([v104 objectAtIndexedSubscript:v119]);
      v121 = (void *)objc_claimAutoreleasedReturnValue([v120 objectForKeyedSubscript:@"PID"]);
      unsigned int v122 = [v121 intValue];

      id v123 = (void *)objc_claimAutoreleasedReturnValue([v120 objectForKeyedSubscript:@"StartTime"]);
      id v124 = [v123 unsignedLongLongValue];

      id v125 = (void *)objc_claimAutoreleasedReturnValue([v120 objectForKeyedSubscript:@"EndTime"]);
      id v126 = [v125 unsignedLongLongValue];

      double v127 = sub_100002FAC(v126 - v124);
      id v128 = (void *)objc_claimAutoreleasedReturnValue([v120 objectForKeyedSubscript:@"HangType"]);
      BOOL v129 = sub_100002B40((int)[v128 intValue]);

      if (v107 != v122 || v259 >= v126 || objb <= v124) {
        goto LABEL_131;
      }
      unint64_t v130 = (unint64_t)v127;
      if (((v235 | v129) & 1) == 0 && v239 + 1000 > v130)
      {
        [v242 addIndex:v119];
        id v131 = sub_1000199EC();
        id v132 = (os_log_s *)objc_claimAutoreleasedReturnValue(v131);
        if (os_log_type_enabled(v132, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67110912;
          *(_DWORD *)&uint8_t buf[4] = v107;
          *(_WORD *)&uint8_t buf[8] = 2048;
          *(void *)&buf[10] = v124;
          *(_WORD *)&buf[18] = 2048;
          *(void *)&buf[20] = v126;
          *(_WORD *)&buf[28] = 2048;
          *(void *)&buf[30] = (unint64_t)v127;
          *(_WORD *)&buf[38] = 1024;
          *(_DWORD *)v322 = v107;
          *(_WORD *)&v322[4] = 2048;
          *(void *)&v322[6] = v259;
          __int16 v323 = 2048;
          v324 = objb;
          __int16 v325 = 2048;
          unint64_t v326 = v239;
          v133 = v132;
          v134 = "Adding hang [%d] %llu-%llu (%llums) to removal list in favor of overlapping [%d] %llu-%llu (%llums) (1p"
                 " prefer fence if other is <1s longer)";
LABEL_129:
          _os_log_impl((void *)&_mh_execute_header, v133, OS_LOG_TYPE_DEFAULT, v134, buf, 0x4Au);
          goto LABEL_130;
        }

        goto LABEL_130;
      }

      if ((v231 & v129) == 1 && v130 + 1000 > v239) {
        break;
      }
      if (((v229 | !v129) & 1) != 0)
      {
        if (((v227 | v129) & 1) == 0)
        {
          BOOL v150 = [v242 count] == 0;
          id v151 = sub_1000199EC();
          v145 = (os_log_s *)objc_claimAutoreleasedReturnValue(v151);
          BOOL v152 = os_log_type_enabled(v145, OS_LOG_TYPE_DEFAULT);
          if (!v150)
          {
            if (!v152) {
              goto LABEL_160;
            }
            id v153 = [v242 count];
            *(_DWORD *)buf = 67111168;
            *(_DWORD *)&uint8_t buf[4] = v107;
            *(_WORD *)&uint8_t buf[8] = 2048;
            *(void *)&buf[10] = v259;
            *(_WORD *)&buf[18] = 2048;
            *(void *)&buf[20] = objb;
            *(_WORD *)&buf[28] = 2048;
            *(void *)&buf[30] = v239;
            *(_WORD *)&buf[38] = 1024;
            *(_DWORD *)v322 = v107;
            *(_WORD *)&v322[4] = 2048;
            *(void *)&v322[6] = v124;
            __int16 v323 = 2048;
            v324 = v126;
            __int16 v325 = 2048;
            unint64_t v326 = (unint64_t)v127;
            __int16 v327 = 2048;
            id v328 = v153;
            v148 = v145;
            v149 = "Removing hang [%d] %llu-%llu (%llums) in favor of overlapping [%d] %llu-%llu (%llums) (3p prefer fenc"
                   "e) (not removing %lu on removal list)";
            goto LABEL_151;
          }

          if (!v152) {
            goto LABEL_160;
          }
          *(_DWORD *)buf = 67110912;
          *(_DWORD *)&uint8_t buf[4] = v107;
          *(_WORD *)&uint8_t buf[8] = 2048;
          *(void *)&buf[10] = v259;
          *(_WORD *)&buf[18] = 2048;
          *(void *)&buf[20] = objb;
          *(_WORD *)&buf[28] = 2048;
          *(void *)&buf[30] = v239;
          *(_WORD *)&buf[38] = 1024;
          *(_DWORD *)v322 = v107;
          *(_WORD *)&v322[4] = 2048;
          *(void *)&v322[6] = v124;
          __int16 v323 = 2048;
          v324 = v126;
          __int16 v325 = 2048;
          unint64_t v326 = (unint64_t)v127;
          v148 = v145;
          v149 = "Removing hang [%d] %llu-%llu (%llums) in favor of overlapping [%d] %llu-%llu (%llums) (3p prefer fence)";
          goto LABEL_158;
        }

        if (objb - v259 < (unint64_t)(v126 - v124))
        {
          BOOL v154 = [v242 count] == 0;
          id v155 = sub_1000199EC();
          v145 = (os_log_s *)objc_claimAutoreleasedReturnValue(v155);
          BOOL v156 = os_log_type_enabled(v145, OS_LOG_TYPE_DEFAULT);
          if (!v154)
          {
            if (!v156) {
              goto LABEL_160;
            }
            id v157 = [v242 count];
            *(_DWORD *)buf = 67111168;
            *(_DWORD *)&uint8_t buf[4] = v107;
            *(_WORD *)&uint8_t buf[8] = 2048;
            *(void *)&buf[10] = v259;
            *(_WORD *)&buf[18] = 2048;
            *(void *)&buf[20] = objb;
            *(_WORD *)&buf[28] = 2048;
            *(void *)&buf[30] = v239;
            *(_WORD *)&buf[38] = 1024;
            *(_DWORD *)v322 = v107;
            *(_WORD *)&v322[4] = 2048;
            *(void *)&v322[6] = v124;
            __int16 v323 = 2048;
            v324 = v126;
            __int16 v325 = 2048;
            unint64_t v326 = (unint64_t)v127;
            __int16 v327 = 2048;
            id v328 = v157;
            v148 = v145;
            v149 = "Removing hang [%d] %llu-%llu (%llums) in favor of overlapping [%d] %llu-%llu (%llums) (prefer longer "
                   "hangs) (not removing %lu on removal list)";
            goto LABEL_151;
          }

          if (!v156) {
            goto LABEL_160;
          }
          *(_DWORD *)buf = 67110912;
          *(_DWORD *)&uint8_t buf[4] = v107;
          *(_WORD *)&uint8_t buf[8] = 2048;
          *(void *)&buf[10] = v259;
          *(_WORD *)&buf[18] = 2048;
          *(void *)&buf[20] = objb;
          *(_WORD *)&buf[28] = 2048;
          *(void *)&buf[30] = v239;
          *(_WORD *)&buf[38] = 1024;
          *(_DWORD *)v322 = v107;
          *(_WORD *)&v322[4] = 2048;
          *(void *)&v322[6] = v124;
          __int16 v323 = 2048;
          v324 = v126;
          __int16 v325 = 2048;
          unint64_t v326 = (unint64_t)v127;
          v148 = v145;
          v149 = "Removing hang [%d] %llu-%llu (%llums) in favor of overlapping [%d] %llu-%llu (%llums) (prefer longer hangs)";
          goto LABEL_158;
        }

        [v242 addIndex:v119];
        id v135 = sub_1000199EC();
        id v132 = (os_log_s *)objc_claimAutoreleasedReturnValue(v135);
        if (!os_log_type_enabled(v132, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_130;
        }
        *(_DWORD *)buf = 67110912;
        *(_DWORD *)&uint8_t buf[4] = v107;
        *(_WORD *)&uint8_t buf[8] = 2048;
        *(void *)&buf[10] = v124;
        *(_WORD *)&buf[18] = 2048;
        *(void *)&buf[20] = v126;
        *(_WORD *)&buf[28] = 2048;
        *(void *)&buf[30] = (unint64_t)v127;
        *(_WORD *)&buf[38] = 1024;
        *(_DWORD *)v322 = v107;
        *(_WORD *)&v322[4] = 2048;
        *(void *)&v322[6] = v259;
        __int16 v323 = 2048;
        v324 = objb;
        __int16 v325 = 2048;
        unint64_t v326 = v239;
        v133 = v132;
        v134 = "Adding hang [%d] %llu-%llu (%llums) to removal list in favor of overlapping [%d] %llu-%llu (%llums) (pref"
               "er longer hangs)";
        goto LABEL_129;
      }

      [v242 addIndex:v119];
      id v136 = sub_1000199EC();
      id v132 = (os_log_s *)objc_claimAutoreleasedReturnValue(v136);
      if (os_log_type_enabled(v132, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67110912;
        *(_DWORD *)&uint8_t buf[4] = v107;
        *(_WORD *)&uint8_t buf[8] = 2048;
        *(void *)&buf[10] = v124;
        *(_WORD *)&buf[18] = 2048;
        *(void *)&buf[20] = v126;
        *(_WORD *)&buf[28] = 2048;
        *(void *)&buf[30] = (unint64_t)v127;
        *(_WORD *)&buf[38] = 1024;
        *(_DWORD *)v322 = v107;
        *(_WORD *)&v322[4] = 2048;
        *(void *)&v322[6] = v259;
        __int16 v323 = 2048;
        v324 = objb;
        __int16 v325 = 2048;
        unint64_t v326 = v239;
        v133 = v132;
        v134 = "Adding hang [%d] %llu-%llu (%llums) to removal list in favor of overlapping [%d] %llu-%llu (%llums) (3p prefer fence)";
        goto LABEL_129;
      }

LABEL_130:
LABEL_131:
    }

    BOOL v143 = [v242 count] == 0;
    id v144 = sub_1000199EC();
    v145 = (os_log_s *)objc_claimAutoreleasedReturnValue(v144);
    BOOL v146 = os_log_type_enabled(v145, OS_LOG_TYPE_DEFAULT);
    if (!v143)
    {
      if (!v146) {
        goto LABEL_160;
      }
      id v147 = [v242 count];
      *(_DWORD *)buf = 67111168;
      *(_DWORD *)&uint8_t buf[4] = v107;
      *(_WORD *)&uint8_t buf[8] = 2048;
      *(void *)&buf[10] = v259;
      *(_WORD *)&buf[18] = 2048;
      *(void *)&buf[20] = objb;
      *(_WORD *)&buf[28] = 2048;
      *(void *)&buf[30] = v239;
      *(_WORD *)&buf[38] = 1024;
      *(_DWORD *)v322 = v107;
      *(_WORD *)&v322[4] = 2048;
      *(void *)&v322[6] = v124;
      __int16 v323 = 2048;
      v324 = v126;
      __int16 v325 = 2048;
      unint64_t v326 = (unint64_t)v127;
      __int16 v327 = 2048;
      id v328 = v147;
      v148 = v145;
      v149 = "Removing hang [%d] %llu-%llu (%llums) in favor of overlapping [%d] %llu-%llu (%llums) (1p prefer fence if o"
             "ther is <1s longer) (not removing %lu on removal list)";
LABEL_151:
      uint32_t v158 = 84;
      goto LABEL_159;
    }

    if (!v146) {
      goto LABEL_160;
    }
    *(_DWORD *)buf = 67110912;
    *(_DWORD *)&uint8_t buf[4] = v107;
    *(_WORD *)&uint8_t buf[8] = 2048;
    *(void *)&buf[10] = v259;
    *(_WORD *)&buf[18] = 2048;
    *(void *)&buf[20] = objb;
    *(_WORD *)&buf[28] = 2048;
    *(void *)&buf[30] = v239;
    *(_WORD *)&buf[38] = 1024;
    *(_DWORD *)v322 = v107;
    *(_WORD *)&v322[4] = 2048;
    *(void *)&v322[6] = v124;
    __int16 v323 = 2048;
    v324 = v126;
    __int16 v325 = 2048;
    unint64_t v326 = (unint64_t)v127;
    v148 = v145;
    v149 = "Removing hang [%d] %llu-%llu (%llums) in favor of overlapping [%d] %llu-%llu (%llums) (1p prefer fence if oth"
           "er is <1s longer)";
LABEL_158:
    uint32_t v158 = 74;
LABEL_159:
    _os_log_impl((void *)&_mh_execute_header, v148, OS_LOG_TYPE_DEFAULT, v149, buf, v158);
LABEL_160:

    [v104 removeObjectAtIndex:v237];
LABEL_140:

    id v142 = [v104 count];
    unint64_t v105 = v237;
  }

  while (v237 < (unint64_t)v142);
LABEL_162:
  id v159 = [v104 copy];

LABEL_163:
  __int128 v265 = 0u;
  __int128 v266 = 0u;
  __int128 v263 = 0u;
  __int128 v264 = 0u;
  id obj = v159;
  id v260 = [obj countByEnumeratingWithState:&v263 objects:v303 count:16];
  if (v260)
  {
    int v160 = 0;
    id v161 = 0LL;
    id v252 = *(id *)v264;
    do
    {
      for (n = 0LL; n != v260; n = (char *)n + 1)
      {
        if (*(id *)v264 != v252) {
          objc_enumerationMutation(obj);
        }
        id v163 = *(void **)(*((void *)&v263 + 1) + 8LL * (void)n);
        id v164 = v256;
        sub_10001A664((const char *)[v164 UTF8String], v163);
        id v165 = sub_1000065A4(v164, v254, v163, 1);
        v166 = (void *)objc_claimAutoreleasedReturnValue(v165);
        v167 = v166;
        if (v166)
        {
          ++v160;
          if (v161)
          {
            id v168 = v166;
            id v161 = v161;
            v169 = (void *)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](&OBJC_CLASS___HTPrefs, "sharedPrefs"));
            unsigned __int8 v170 = [v169 shouldSaveTailspins];

            if ((v170 & 1) != 0)
            {
              id v171 = sub_100003FAC(v168);
              id v172 = (void *)objc_claimAutoreleasedReturnValue(v171);
              uint64_t v173 = (void *)objc_claimAutoreleasedReturnValue([v161 pathExtension]);
              unsigned int v174 = [v173 containsString:@"gz"];

              if (v174)
              {
                uint64_t v175 = objc_claimAutoreleasedReturnValue([v172 stringByAppendingPathExtension:@"gz"]);

                id v172 = (void *)v175;
              }

              v176 = (void *)objc_claimAutoreleasedReturnValue( [@"/var/mobile/Library/Logs/CrashReporter/DiagnosticLogs/HangTracer/" stringByAppendingPathComponent:v172]);
            }

            else
            {
              id v177 = sub_1000199EC();
              id v172 = (void *)objc_claimAutoreleasedReturnValue(v177);
              if (os_log_type_enabled((os_log_t)v172, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v172,  OS_LOG_TYPE_DEFAULT,  "shouldSaveTailspins says NO, not saving tailspin files",  buf,  2u);
              }

              v176 = 0LL;
            }

            if (v176)
            {
              id v178 = v161;
              id v179 = (const char *)[v178 UTF8String];
              id v180 = v176;
              BOOL v181 = clonefile(v179, (const char *)[v180 UTF8String], 0) == 0;
              id v182 = sub_1000199EC();
              v183 = (os_log_s *)objc_claimAutoreleasedReturnValue(v182);
              BOOL v184 = os_log_type_enabled(v183, OS_LOG_TYPE_DEFAULT);
              if (v181)
              {
                if (v184)
                {
                  *(_DWORD *)buf = 138412546;
                  *(void *)&uint8_t buf[4] = v178;
                  *(_WORD *)&_BYTE buf[12] = 2112;
                  *(void *)&buf[14] = v180;
                  _os_log_impl( (void *)&_mh_execute_header,  v183,  OS_LOG_TYPE_DEFAULT,  "successfully cloned %@ to %@",  buf,  0x16u);
                }

                sub_100019E9C( (const char *)[v164 UTF8String], (char *)objc_msgSend(v180, "UTF8String"));
              }

              else
              {
                if (v184)
                {
                  *(_DWORD *)buf = 138412290;
                  *(void *)&uint8_t buf[4] = v180;
                  _os_log_impl( (void *)&_mh_execute_header,  v183,  OS_LOG_TYPE_DEFAULT,  "failed to archive tailspin file %@",  buf,  0xCu);
                }
              }
            }
          }

          else
          {
            id v262 = 0LL;
            sub_100003628(v164, v166, &v262);
            id v161 = v262;
          }
        }
      }

      id v260 = [obj countByEnumeratingWithState:&v263 objects:v303 count:16];
    }

    while (v260);
  }

  else
  {
    int v160 = 0;
    id v161 = 0LL;
  }

  v185 = v225;
  if (os_signpost_enabled(v185))
  {
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&uint8_t buf[4] = v160;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v185,  OS_SIGNPOST_INTERVAL_END,  0xEEEEB0B5B2B2EEEELL,  "TailspinConversionInterval",  "NumSuccessfulReports=%{signpost.telemetry:number2}d enableTelemetry=YES ",  buf,  8u);
  }

  id v186 = sub_1000199EC();
  v187 = (os_log_s *)objc_claimAutoreleasedReturnValue(v186);
  if (os_log_type_enabled(v187, OS_LOG_TYPE_INFO))
  {
    id v188 = (id)objc_claimAutoreleasedReturnValue([v256 lastPathComponent]);
    double v189 = (void *)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](&OBJC_CLASS___HTPrefs, "sharedPrefs"));
    unsigned int v190 = [v189 shouldUploadToDiagPipe];
    *(_DWORD *)buf = 138412546;
    *(void *)&uint8_t buf[4] = v188;
    *(_WORD *)&_BYTE buf[12] = 1024;
    *(_DWORD *)&buf[14] = v190;
    _os_log_impl( (void *)&_mh_execute_header,  v187,  OS_LOG_TYPE_INFO,  "Post Processing %@: Should Try to Upload to Diagnostic Pipeline: %{BOOL}i",  buf,  0x12u);
  }

  v191 = (void *)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](&OBJC_CLASS___HTPrefs, "sharedPrefs"));
  unsigned int v192 = [v191 shouldUploadToDiagPipe];

  if (v192)
  {
    id v193 = sub_100002D68(obj);
    id v194 = (void *)objc_claimAutoreleasedReturnValue(v193);
    v195 = v194;
    if (v194)
    {
      id v196 = (void *)objc_claimAutoreleasedReturnValue([v194 objectForKeyedSubscript:@"StartTime"]);
      double v197 = sub_100002CD0((unint64_t)[v196 longLongValue]);

      v198 = (void *)objc_claimAutoreleasedReturnValue([v195 objectForKeyedSubscript:@"StartTime"]);
      double v199 = [v198 longLongValue];

      double v200 = (void *)objc_claimAutoreleasedReturnValue([v195 objectForKeyedSubscript:@"EndTime"]);
      v201 = [v200 longLongValue];

      double v202 = sub_100002FAC(v201 - v199);
      v203 = (void *)objc_claimAutoreleasedReturnValue([v195 objectForKeyedSubscript:@"ProcessPath"]);
      if (v203)
      {
        id v255 = (id)objc_claimAutoreleasedReturnValue([v195 objectForKeyedSubscript:@"ProcessPath"]);
      }

      else
      {
        id v255 = 0LL;
      }

      dispatch_queue_t queuea = (dispatch_queue_t)objc_claimAutoreleasedReturnValue([v255 lastPathComponent]);
      id v207 = sub_100001D24(queuea, 0LL, v255, v195);
      v261 = (void *)objc_claimAutoreleasedReturnValue(v207);
      v208 = (void *)objc_claimAutoreleasedReturnValue([v261 objectForKeyedSubscript:@"is_first_party"]);
      if (v208)
      {
        v209 = (void *)objc_claimAutoreleasedReturnValue([v261 objectForKeyedSubscript:@"is_first_party"]);
        int v243 = [v209 BOOLValue];
      }

      else
      {
        int v243 = 1;
      }

      unsigned int v210 = (void *)objc_claimAutoreleasedReturnValue([v195 objectForKeyedSubscript:@"IsThirdPartyDevSupportModeHang"]);
      if (v210)
      {
        id v211 = (void *)objc_claimAutoreleasedReturnValue([v195 objectForKeyedSubscript:@"IsThirdPartyDevSupportModeHang"]);
        int v212 = [v211 BOOLValue];
      }

      else
      {
        int v212 = 0;
      }

      uint64_t v213 = sub_100002B74(v243, v212, v202);
      v301[0] = @"bundleid";
      v214 = sub_100002570(v255);
      v240 = (void *)objc_claimAutoreleasedReturnValue(v214);
      v302[0] = v240;
      v301[1] = @"durationms";
      v238 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v202));
      v302[1] = v238;
      v301[2] = @"pid";
      id v253 = (id)objc_claimAutoreleasedReturnValue([v195 objectForKeyedSubscript:@"PID"]);
      if (v253) {
        unsigned int v215 = (const __CFString *)objc_claimAutoreleasedReturnValue([v195 objectForKeyedSubscript:@"PID"]);
      }
      else {
        unsigned int v215 = &stru_100071CD0;
      }
      v230 = (__CFString *)v215;
      v302[2] = v215;
      v301[3] = @"starttime";
      v236 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  v199));
      v302[3] = v236;
      v301[4] = @"endtime";
      v234 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  v201));
      v302[4] = v234;
      v301[5] = @"walltime";
      v233 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v197));
      v302[5] = v233;
      v301[6] = @"bugtype";
      id v232 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%lu", v213));
      v302[6] = v232;
      v301[7] = @"sharewithdevs";
      v216 = +[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", AppAnalyticsEnabled());
      v217 = (void *)objc_claimAutoreleasedReturnValue(v216);
      v302[7] = v217;
      v301[8] = @"adamid";
      unsigned __int8 v218 = (void *)objc_claimAutoreleasedReturnValue([v261 objectForKeyedSubscript:@"adam_id"]);
      if (v218) {
        id v219 = (__CFString *)objc_claimAutoreleasedReturnValue([v261 objectForKeyedSubscript:@"adam_id"]);
      }
      else {
        id v219 = &stru_100071CD0;
      }
      v302[8] = v219;
      v301[9] = @"appversion";
      v220 = (void *)objc_claimAutoreleasedReturnValue([v261 objectForKeyedSubscript:@"app_version"]);
      if (v220) {
        double v221 = (__CFString *)objc_claimAutoreleasedReturnValue([v261 objectForKeyedSubscript:@"app_version"]);
      }
      else {
        double v221 = &stru_100071CD0;
      }
      v302[9] = v221;
      v301[10] = @"HangUUID";
      id v222 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v195, "objectForKeyedSubscript:"));
      v302[10] = v222;
      BOOL v223 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v302,  v301,  11LL));

      if (v220) {
      if (v218)
      }

      if (v253) {
      sub_100009604(v243, 1, v195, v256, v223);
      }

      BOOL v206 = (os_log_s *)v255;
    }

    else
    {
      id v204 = sub_1000199EC();
      v205 = (os_log_s *)objc_claimAutoreleasedReturnValue(v204);
      BOOL v206 = v205;
      if (os_log_type_enabled(v205, OS_LOG_TYPE_FAULT))
      {
        sub_100033BF0((uint64_t)v256, obj, v205);
        BOOL v206 = v205;
      }
    }
  }

  unlink((const char *)[v256 UTF8String]);

LABEL_226:
LABEL_227:
}

void sub_10000C854(_Unwind_Exception *a1)
{
}

uint64_t sub_10000C8B0(uint64_t a1, int a2)
{
  id v4 = sub_1000199EC();
  uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  id v6 = v5;
  if (a2)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      int v13 = 138412290;
      uint64_t v14 = v7;
      id v8 = "Successfully augmented tailspin at %@ with symbols";
      int v9 = v6;
      os_log_type_t v10 = OS_LOG_TYPE_INFO;
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, v9, v10, v8, (uint8_t *)&v13, 0xCu);
    }
  }

  else if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = *(void *)(a1 + 32);
    int v13 = 138412290;
    uint64_t v14 = v11;
    id v8 = "Failed to augment tailspin at %@ with symbols";
    int v9 = v6;
    os_log_type_t v10 = OS_LOG_TYPE_DEFAULT;
    goto LABEL_6;
  }

  return dispatch_semaphore_signal((dispatch_semaphore_t)qword_10007C1A8);
}

id sub_10000C9B0(uint64_t a1)
{
  id v4 = @"DurationSec";
  id v1 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", *(double *)(a1 + 32)));
  uint64_t v5 = v1;
  id v2 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v5,  &v4,  1LL));

  return v2;
}

void sub_10000CA50(uint64_t a1, void *a2)
{
  id v3 = a2;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  id obj = *(id *)(a1 + 32);
  id v4 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v18;
    do
    {
      for (i = 0LL; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v18 != v6) {
          objc_enumerationMutation(obj);
        }
        id v8 = *(void **)(*((void *)&v17 + 1) + 8LL * (void)i);
        int v9 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:@"StartTime"]);
        id v10 = [v9 unsignedLongLongValue];

        uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:@"EndTime"]);
        id v12 = [v11 unsignedLongLongValue];

        int v13 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:@"CAFenceId"]);
        id v14 = [v13 unsignedLongLongValue];

        __int128 v15 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:@"RecentAppsDict"]);
        v3[2](v3, v8, v10, v12, v14, v15);
      }

      id v5 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
    }

    while (v5);
  }
}

void sub_10000CC04(uint64_t a1, uint64_t a2)
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_10000CC78;
  v3[3] = &unk_1000711E0;
  uint64_t v5 = a2;
  uint64_t v2 = *(void *)(a1 + 40);
  id v4 = *(id *)(a1 + 32);
  (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v3);
}

void sub_10000CC78(uint64_t a1, void *a2, unint64_t a3, unint64_t a4, uint64_t a5, void *a6)
{
  id v11 = a2;
  id v12 = a6;
  uint64_t v13 = *(void *)(a1 + 40);
  if (*(void *)(v13 + 8) == a5 && *(void *)v13 >= a3 && *(void *)v13 <= a4)
  {
    int v15 = *(_DWORD *)(v13 + 48);
    if ((v15 & 1) != 0)
    {
      __int128 v20 = sub_1000033AC(*(void **)(a1 + 32), a5, a3, a4);
      __int128 v17 = (void *)objc_claimAutoreleasedReturnValue(v20);
      [v17 setFenceStartTime:**(void **)(a1 + 40)];
      id v21 = sub_1000199EC();
      __int128 v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
        sub_100034108();
      }
      goto LABEL_12;
    }

    if ((v15 & 2) != 0)
    {
      uint64_t v16 = sub_1000033AC(*(void **)(a1 + 32), a5, a3, a4);
      __int128 v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
      [v17 setFenceEndTime:**(void **)(a1 + 40)];
      id v18 = sub_1000199EC();
      __int128 v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
        sub_1000340A8();
      }
LABEL_12:
    }
  }
}

void sub_10000CDAC(uint64_t a1, uint64_t a2)
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_10000CE20;
  v3[3] = &unk_1000711E0;
  uint64_t v5 = a2;
  uint64_t v2 = *(void *)(a1 + 40);
  id v4 = *(id *)(a1 + 32);
  (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v3);
}

void sub_10000CE20(uint64_t a1, void *a2, unint64_t a3, unint64_t a4, uint64_t a5, void *a6)
{
  id v11 = a2;
  id v12 = a6;
  uint64_t v13 = *(unint64_t **)(a1 + 40);
  if (v13[1] == a5)
  {
    unint64_t v14 = *v13;
    if (v14 >= a3 && v14 <= a4)
    {
      uint64_t v16 = sub_1000033AC(*(void **)(a1 + 32), a5, a3, a4);
      __int128 v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
      [v17 setResolution:2];
      id v18 = sub_1000199EC();
      __int128 v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
        sub_100034168();
      }
    }
  }
}

void sub_10000CEF4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 56);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10000CF98;
  v4[3] = &unk_100071230;
  uint64_t v8 = a2;
  id v5 = *(id *)(a1 + 32);
  id v6 = *(id *)(a1 + 40);
  id v7 = *(id *)(a1 + 48);
  (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v4);
}

void sub_10000CF98(uint64_t a1, void *a2, unint64_t a3, unint64_t a4, uint64_t a5, void *a6)
{
  id v11 = a2;
  id v12 = a6;
  uint64_t v13 = *(void *)(a1 + 56);
  if (*(void *)(v13 + 16) == a5 && *(void *)v13 >= a3 && *(void *)v13 <= a4)
  {
    int v15 = *(_DWORD *)(v13 + 88);
    if (v15 == -1)
    {
      uint64_t v16 = *(void *)(v13 + 40);
      id v47 = *(id *)(a1 + 32);
      __int128 v17 = (void *)qword_10007C130;
      if (!qword_10007C130)
      {
        id v18 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
        __int128 v19 = (void *)qword_10007C130;
        qword_10007C130 = (uint64_t)v18;

        __int128 v17 = (void *)qword_10007C130;
      }

      uint64_t v49 = 0LL;
      v50[0] = &v49;
      v50[1] = 0x2020000000LL;
      int v51 = -1;
      __int128 v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  v16));
      id v21 = (void *)objc_claimAutoreleasedReturnValue([v17 objectForKeyedSubscript:v20]);
      BOOL v22 = v21 == 0LL;

      if (v22)
      {
        v48[0] = _NSConcreteStackBlock;
        v48[1] = 3221225472LL;
        v48[2] = sub_10000E3EC;
        v48[3] = &unk_100071360;
        v48[4] = &v49;
        v48[5] = v16;
        [v47 enumerateTasks:v48];
        uint64_t v29 = *(unsigned int *)(v50[0] + 24LL);
        if ((_DWORD)v29 == -1)
        {
          id v30 = sub_1000199EC();
          double v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
          if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 134217984;
            uint64_t v53 = v16;
            _os_log_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_INFO,  "Null pid in ktrace data: iterated SA threads and did NOT find threadid %llu (or its pid)",  buf,  0xCu);
          }

          uint64_t v29 = *(unsigned int *)(v50[0] + 24LL);
        }

        uint64_t v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v29));
        double v32 = (void *)qword_10007C130;
        id v33 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  v16));
        [v32 setObject:v28 forKeyedSubscript:v33];
      }

      else
      {
        uint64_t v23 = (void *)qword_10007C130;
        uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  v16));
        uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue([v23 objectForKeyedSubscript:v24]);
        unsigned int v26 = [v25 intValue];
        *(_DWORD *)(v50[0] + 24LL) = v26;

        id v27 = sub_1000199EC();
        uint64_t v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG)) {
          sub_100034288((uint64_t)v50, v16, v28);
        }
      }

      int v15 = *(_DWORD *)(v50[0] + 24LL);
      _Block_object_dispose(&v49, 8);

      uint64_t v13 = *(void *)(a1 + 56);
    }

    int v34 = *(_DWORD *)(v13 + 48);
    if ((v34 & 1) != 0)
    {
      id v42 = sub_1000033AC(*(void **)(a1 + 40), *(void *)(v13 + 16), a3, a4);
      uint64_t v44 = *(void *)(a1 + 56);
      id v43 = (void **)(a1 + 56);
      id v45 = sub_100003474(*(v43 - 1), *(void *)(v44 + 16), *(void *)(v44 + 8), v15, a3, a4);
      id v39 = (void *)objc_claimAutoreleasedReturnValue(v45);
      [v39 setHandleStartTime:**v43];
      id v46 = sub_1000199EC();
      int v41 = (os_log_s *)objc_claimAutoreleasedReturnValue(v46);
      if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG)) {
        sub_100034228();
      }
      goto LABEL_24;
    }

    if ((v34 & 2) != 0)
    {
      id v35 = sub_1000033AC(*(void **)(a1 + 40), *(void *)(v13 + 16), a3, a4);
      uint64_t v37 = *(void *)(a1 + 56);
      unsigned __int8 v36 = (void **)(a1 + 56);
      id v38 = sub_100003474(*(v36 - 1), *(void *)(v37 + 16), *(void *)(v37 + 8), v15, a3, a4);
      id v39 = (void *)objc_claimAutoreleasedReturnValue(v38);
      [v39 setHandleEndTime:**v36];
      id v40 = sub_1000199EC();
      int v41 = (os_log_s *)objc_claimAutoreleasedReturnValue(v40);
      if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG)) {
        sub_1000341C8();
      }
LABEL_24:
    }
  }
}

void sub_10000D378( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

uint64_t sub_10000D3A0(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 0LL;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

uint64_t sub_10000D3DC(uint64_t a1)
{
  uint64_t result = *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
  if (result) {
    return ktrace_end(result, 1LL);
  }
  return result;
}

void sub_10000D3F8(id *a1, void *a2, _BYTE *a3, _BYTE *a4, uint64_t a5, void *a6)
{
  id v8 = a2;
  id v117 = a6;
  id v9 = sub_1000199EC();
  id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    sub_100034300();
  }

  __int128 v159 = 0u;
  __int128 v160 = 0u;
  __int128 v157 = 0u;
  __int128 v158 = 0u;
  id v11 = a1[4];
  id v121 = [v11 countByEnumeratingWithState:&v157 objects:v180 count:16];
  if (v121)
  {
    id v126 = 0LL;
    id v123 = 0LL;
    unint64_t v129 = 0LL;
    uint64_t v118 = *(void *)v158;
    id v125 = a1;
    unint64_t v119 = v11;
    v120 = v8;
    do
    {
      uint64_t v12 = 0LL;
      do
      {
        if (*(void *)v158 != v118) {
          objc_enumerationMutation(v11);
        }
        uint64_t v122 = v12;
        uint64_t v13 = *(void **)(*((void *)&v157 + 1) + 8 * v12);
        __int128 v153 = 0u;
        __int128 v154 = 0u;
        __int128 v155 = 0u;
        __int128 v156 = 0u;
        v134 = v13;
        id obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a1[4], "objectForKey:"));
        id v128 = [obj countByEnumeratingWithState:&v153 objects:v179 count:16];
        if (v128)
        {
          uint64_t v127 = *(void *)v154;
          do
          {
            uint64_t v14 = 0LL;
            do
            {
              if (*(void *)v154 != v127) {
                objc_enumerationMutation(obj);
              }
              uint64_t v131 = v14;
              int v15 = *(void **)(*((void *)&v153 + 1) + 8 * v14);
              uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([a1[4] objectForKey:v134]);
              unint64_t v130 = v15;
              __int128 v17 = (void *)objc_claimAutoreleasedReturnValue([v16 objectForKey:v15]);

              id v18 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
              __int128 v149 = 0u;
              __int128 v150 = 0u;
              __int128 v151 = 0u;
              __int128 v152 = 0u;
              id v19 = v17;
              id v20 = [v19 countByEnumeratingWithState:&v149 objects:v178 count:16];
              if (v20)
              {
                id v21 = v20;
                uint64_t v22 = *(void *)v150;
                do
                {
                  for (i = 0LL; i != v21; i = (char *)i + 1)
                  {
                    if (*(void *)v150 != v22) {
                      objc_enumerationMutation(v19);
                    }
                    uint64_t v24 = *(void **)(*((void *)&v149 + 1) + 8LL * (void)i);
                    uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue([v19 objectForKey:v24]);
                    id v26 = [v25 handleEndTime];
                    if (v26 >= [v25 handleStartTime])
                    {
                      id v27 = -[HRHandleStateChange initWithType:andTimestamp:andName:]( [HRHandleStateChange alloc],  "initWithType:andTimestamp:andName:",  0,  [v25 handleStartTime],  objc_msgSend(v24, "unsignedLongLongValue"));
                      -[NSMutableArray addObject:](v18, "addObject:", v27);

                      uint64_t v28 = -[HRHandleStateChange initWithType:andTimestamp:andName:]( [HRHandleStateChange alloc],  "initWithType:andTimestamp:andName:",  1,  [v25 handleEndTime],  objc_msgSend(v24, "unsignedLongLongValue"));
                      -[NSMutableArray addObject:](v18, "addObject:", v28);
                    }
                  }

                  id v21 = [v19 countByEnumeratingWithState:&v149 objects:v178 count:16];
                }

                while (v21);
              }

              uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableArray sortedArrayUsingComparator:]( v18,  "sortedArrayUsingComparator:",  &stru_1000712E8));
              __int128 v145 = 0u;
              __int128 v146 = 0u;
              __int128 v147 = 0u;
              __int128 v148 = 0u;
              id v30 = [v29 countByEnumeratingWithState:&v145 objects:v177 count:16];
              if (v30)
              {
                id v31 = v30;
                v140 = 0LL;
                int v32 = 0;
                unint64_t v33 = 0LL;
                uint64_t v34 = *(void *)v146;
                id v132 = v29;
                do
                {
                  for (j = 0LL; j != v31; j = (char *)j + 1)
                  {
                    if (*(void *)v146 != v34) {
                      objc_enumerationMutation(v29);
                    }
                    unsigned __int8 v36 = *(void **)(*((void *)&v145 + 1) + 8LL * (void)j);
                    if (![v36 type])
                    {
                      if (!v32) {
                        v140 = [v36 timestamp];
                      }
                      ++v32;
                      id v37 = sub_1000199EC();
                      id v38 = (os_log_s *)objc_claimAutoreleasedReturnValue(v37);
                      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
                      {
                        unint64_t v137 = v33;
                        unsigned int v46 = [v134 intValue];
                        id v47 = [v36 timestamp];
                        id v48 = [v36 name];
                        *(_DWORD *)buf = 67109888;
                        *(_DWORD *)float v162 = v46;
                        unint64_t v33 = v137;
                        *(_WORD *)&v162[4] = 2048;
                        *(void *)&v162[6] = v47;
                        uint64_t v29 = v132;
                        *(_WORD *)&v162[14] = 1024;
                        *(_DWORD *)&v162[16] = v32;
                        *(_WORD *)&v162[20] = 2048;
                        *(void *)&v162[22] = v48;
                        _os_log_debug_impl( (void *)&_mh_execute_header,  v38,  OS_LOG_TYPE_DEBUG,  "pid(%i): Grab handle time=%llu count=>%i handle=%llu",  buf,  0x22u);
                      }
                    }

                    if ([v36 type] == (id)1)
                    {
                      if (!--v32)
                      {
                        v33 += (_BYTE *)[v36 timestamp] - v140;
                        id v39 = sub_1000199EC();
                        id v40 = (os_log_s *)objc_claimAutoreleasedReturnValue(v39);
                        if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
                        {
                          unint64_t v138 = v33;
                          unsigned int v49 = [v134 intValue];
                          BOOL v50 = (char *)((_BYTE *)[v36 timestamp] - v140);
                          id v51 = [v36 name];
                          *(_DWORD *)buf = 67109888;
                          *(_DWORD *)float v162 = v49;
                          unint64_t v33 = v138;
                          *(_WORD *)&v162[4] = 2048;
                          *(void *)&v162[6] = v50;
                          uint64_t v29 = v132;
                          *(_WORD *)&v162[14] = 2048;
                          *(void *)&v162[16] = v138;
                          *(_WORD *)&v162[24] = 2048;
                          *(void *)&v162[26] = v51;
                          _os_log_debug_impl( (void *)&_mh_execute_header,  v40,  OS_LOG_TYPE_DEBUG,  "pid(%i): Dropping last handle! Save time holding handle += %llu (total for pid now = %llu handle=%llu",  buf,  0x26u);
                        }
                      }

                      id v41 = sub_1000199EC();
                      id v42 = (os_log_s *)objc_claimAutoreleasedReturnValue(v41);
                      if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG))
                      {
                        unint64_t v136 = v33;
                        unsigned int v43 = [v134 intValue];
                        id v44 = [v36 timestamp];
                        id v45 = [v36 name];
                        *(_DWORD *)buf = 67109888;
                        *(_DWORD *)float v162 = v43;
                        unint64_t v33 = v136;
                        *(_WORD *)&v162[4] = 2048;
                        *(void *)&v162[6] = v44;
                        uint64_t v29 = v132;
                        *(_WORD *)&v162[14] = 1024;
                        *(_DWORD *)&v162[16] = v32;
                        *(_WORD *)&v162[20] = 2048;
                        *(void *)&v162[22] = v45;
                        _os_log_debug_impl( (void *)&_mh_execute_header,  v42,  OS_LOG_TYPE_DEBUG,  "pid(%i): Drop handle time=%llu count=>%i handle=%llu",  buf,  0x22u);
                      }
                    }
                  }

                  id v31 = [v29 countByEnumeratingWithState:&v145 objects:v177 count:16];
                }

                while (v31);
              }

              else
              {
                unint64_t v33 = 0LL;
              }

              id v52 = sub_1000199EC();
              uint64_t v53 = (os_log_s *)objc_claimAutoreleasedReturnValue(v52);
              if (os_log_type_enabled(v53, OS_LOG_TYPE_DEBUG))
              {
                unint64_t v57 = v33;
                id v58 = [v130 longLongValue];
                unsigned int v59 = [v134 intValue];
                *(_DWORD *)buf = 134218496;
                *(void *)float v162 = v58;
                unint64_t v33 = v57;
                *(_WORD *)&v162[8] = 1024;
                *(_DWORD *)&v162[10] = v59;
                *(_WORD *)&v162[14] = 2048;
                *(void *)&v162[16] = v57;
                _os_log_debug_impl( (void *)&_mh_execute_header,  v53,  OS_LOG_TYPE_DEBUG,  "fence=%lli pid=%i total_time=%lli",  buf,  0x1Cu);
              }

              a1 = v125;
              if (v33 >= v129)
              {
                id v123 = [v134 intValue];
                id v54 = v130;

                id v55 = sub_1000199EC();
                id v56 = (os_log_s *)objc_claimAutoreleasedReturnValue(v55);
                if (os_log_type_enabled(v56, OS_LOG_TYPE_DEBUG))
                {
                  unint64_t v60 = v33;
                  id v61 = [v54 longLongValue];
                  unsigned int v62 = [v134 intValue];
                  *(_DWORD *)buf = 134218240;
                  *(void *)float v162 = v61;
                  unint64_t v33 = v60;
                  *(_WORD *)&v162[8] = 1024;
                  *(_DWORD *)&v162[10] = v62;
                  _os_log_debug_impl( (void *)&_mh_execute_header,  v56,  OS_LOG_TYPE_DEBUG,  "fence=%lli pid=%i is the new slowest fence pid",  buf,  0x12u);
                }

                id v126 = v54;
                unint64_t v129 = v33;
              }

              uint64_t v14 = v131 + 1;
            }

            while ((id)(v131 + 1) != v128);
            id v128 = [obj countByEnumeratingWithState:&v153 objects:v179 count:16];
          }

          while (v128);
        }

        uint64_t v12 = v122 + 1;
        id v11 = v119;
        id v8 = v120;
      }

      while ((id)(v122 + 1) != v121);
      id v121 = [v119 countByEnumeratingWithState:&v157 objects:v180 count:16];
    }

    while (v121);

    if (v126)
    {
      id v63 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%i", v123));
      id v64 = (void *)objc_claimAutoreleasedReturnValue([v117 objectForKeyedSubscript:v63]);

      if (!v64)
      {
        id v65 = sub_1000199EC();
        id v66 = (os_log_s *)objc_claimAutoreleasedReturnValue(v65);
        if (os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v66,  OS_LOG_TYPE_DEFAULT,  "Targent Fence PID not found in recentAppsPaths Dict, trying pathForPid",  buf,  2u);
        }

        id v67 = sub_100002474((int)v123);
        id v64 = (void *)objc_claimAutoreleasedReturnValue(v67);
        if (!v64)
        {
          id v68 = (void *)objc_claimAutoreleasedReturnValue([a1[5] tasksByPid]);
          uint64_t v69 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v123));
          id v70 = (void *)objc_claimAutoreleasedReturnValue([v68 objectForKeyedSubscript:v69]);
          id v71 = (void *)objc_claimAutoreleasedReturnValue([v70 lastObject]);
          id v64 = (void *)objc_claimAutoreleasedReturnValue([v71 mainBinaryPath]);

          id v8 = v120;
        }
      }

      id v72 = sub_1000199EC();
      uint64_t v73 = (os_log_s *)objc_claimAutoreleasedReturnValue(v72);
      if (os_log_type_enabled(v73, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        *(void *)float v162 = v64;
        *(_WORD *)&v162[8] = 1024;
        *(_DWORD *)&v162[10] = (_DWORD)v123;
        _os_log_impl( (void *)&_mh_execute_header,  v73,  OS_LOG_TYPE_INFO,  "Target Process Path: %@ (pid: %i)",  buf,  0x12u);
      }

      id v74 = (void *)objc_claimAutoreleasedReturnValue([a1[6] objectForKey:v126]);
      v75 = [v74 fenceStartTime];

      id v76 = (void *)objc_claimAutoreleasedReturnValue([a1[6] objectForKey:v126]);
      id v77 = [v76 fenceResolutionTime];

      id v141 = v77;
      unint64_t v78 = v77 - v75;
      j__ADClientAddValueForScalarKey(@"com.apple.hangtracer.HTLogsFenceHang.PostTailspin", 1LL);
      id v79 = (void *)objc_claimAutoreleasedReturnValue([a1[6] objectForKey:v126]);
      unsigned int v80 = [v79 resolution];

      if (v80 == 2)
      {
        j__ADClientAddValueForScalarKey(@"com.apple.hangtracer.HTLogsBlownFence.Total", 1LL);
        v81 = (void *)objc_claimAutoreleasedReturnValue([v64 lastPathComponent]);
        __int16 v82 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"com.apple.hangtracer.HTLogsBlownFence.%@",  v81);
        id v83 = @"blown-fence";
      }

      else
      {
        j__ADClientAddValueForScalarKey(@"com.apple.hangtracer.HTLogsLongFence.Total", 1LL);
        v81 = (void *)objc_claimAutoreleasedReturnValue([v64 lastPathComponent]);
        __int16 v82 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"com.apple.hangtracer.HTLogsLongFence.%@",  v81);
        id v83 = @"long-fence";
      }

      j__ADClientAddValueForScalarKey(v82, 1LL);

      uint64_t v86 = (void *)objc_claimAutoreleasedReturnValue([a1[6] objectForKey:v126]);
      os_signpost_id_t v139 = (os_signpost_id_t)v75;
      if ([v86 fenceResolutionTime] == a4)
      {
      }

      else
      {
        uint64_t v87 = (void *)objc_claimAutoreleasedReturnValue([a1[6] objectForKey:v126]);
        __int128 v88 = [v87 fenceStartTime];

        if (v88 != a3)
        {
          id v89 = &stru_100071CD0;
          goto LABEL_74;
        }
      }

      id v89 = @"~";
LABEL_74:
      id v90 = (void *)objc_claimAutoreleasedReturnValue([v64 lastPathComponent]);
      uint64_t v91 = (int)sub_100002FAC(v129);
      dispatch_time_t v92 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Fence-hang-%@: %ims handling fence, %@ (fence duration=%@%ims)",  v90,  v91,  v83,  v89,  (int)sub_100002FAC(v78));
      id v93 = (void *)objc_claimAutoreleasedReturnValue(v92);

      double v94 = sub_100002570(v64);
      id v95 = (void *)objc_claimAutoreleasedReturnValue(v94);
      __int16 v96 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"com.apple.hangtracer.Fence-hang.%@",  v95);
      double v97 = sub_100002FAC(v129);
      j__ADClientPushValueForDistributionKey(v96, v97);
      uint64_t v98 = off_10007BB20;
      v142[0] = _NSConcreteStackBlock;
      v142[1] = 3221225472LL;
      v142[2] = sub_10000E2FC;
      v142[3] = &unk_100071310;
      id v99 = v95;
      id v143 = v99;
      unint64_t v144 = v129;
      AnalyticsSendEventLazy(v98, v142);
      id v100 = sub_1000028D0();
      uint64_t v101 = (void *)objc_claimAutoreleasedReturnValue(v100);
      os_signpost_id_t v103 = v139;
      id v102 = v77;
      sub_1000029B0(@"Blown CA Fence Hang", v99, v139, (uint64_t)v77, v101);

      id v104 = sub_1000199EC();
      unint64_t v105 = (os_log_s *)objc_claimAutoreleasedReturnValue(v104);
      if (os_log_type_enabled(v105, OS_LOG_TYPE_DEFAULT))
      {
        v133 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:@"PID"]);
        unsigned int v106 = [v133 intValue];
        id v135 = v64;
        unsigned int v107 = v93;
        id v108 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:@"ProcessPath"]);
        int v109 = (int)sub_100002FAC(a4 - a3);
        int v110 = (int)sub_100002FAC(v78);
        v111 = (void *)objc_claimAutoreleasedReturnValue([v120 objectForKeyedSubscript:@"Reason"]);
        *(_DWORD *)buf = 67111938;
        *(_DWORD *)float v162 = v106;
        os_signpost_id_t v103 = v139;
        *(_WORD *)&v162[4] = 1024;
        *(_DWORD *)&v162[6] = (_DWORD)v123;
        *(_WORD *)&v162[10] = 2112;
        *(void *)&v162[12] = v108;
        *(_WORD *)&v162[20] = 2112;
        *(void *)&v162[22] = v135;
        *(_WORD *)&v162[30] = 2048;
        *(void *)&v162[32] = a3;
        __int16 v163 = 2048;
        os_signpost_id_t v164 = v139;
        __int16 v165 = 2048;
        id v166 = a4;
        id v102 = v141;
        __int16 v167 = 2048;
        id v168 = v141;
        __int16 v169 = 1024;
        int v170 = v109;
        __int16 v171 = 1024;
        int v172 = v110;
        id v8 = v120;
        __int16 v173 = 2112;
        unsigned int v174 = v111;
        __int16 v175 = 2112;
        v176 = v107;
        _os_log_impl( (void *)&_mh_execute_header,  v105,  OS_LOG_TYPE_DEFAULT,  "Updated fence hang info: pid=%i->%i path=%@->%@ target_start=%llu->%llu, target_end=%llu->%llu (duration=%i->%i ms); %@->%@",
          buf,
          0x6Au);

        id v93 = v107;
        id v64 = v135;
      }

      BOOL v112 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v123));
      [v8 setObject:v112 forKeyedSubscript:@"PID"];

      v113 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  v103));
      [v120 setObject:v113 forKeyedSubscript:@"StartTime"];

      id v8 = v120;
      unsigned __int8 v114 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  v102));
      [v120 setObject:v114 forKeyedSubscript:@"EndTime"];

      [v120 setObject:v93 forKeyedSubscript:@"Reason"];
      [v120 setObject:v64 forKeyedSubscript:@"ProcessPath"];
      [v120 setObject:&__kCFBooleanTrue forKeyedSubscript:@"FenceInfoUpdated"];
      ++*(_DWORD *)(*((void *)v125[7] + 1) + 24LL);

      dispatch_semaphore_t v85 = (os_log_s *)v126;
      goto LABEL_77;
    }
  }

  else
  {
  }

  id v84 = sub_1000199EC();
  dispatch_semaphore_t v85 = (os_log_s *)objc_claimAutoreleasedReturnValue(v84);
  if (os_log_type_enabled(v85, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v85,  OS_LOG_TYPE_DEFAULT,  "longestClientFenceName is nil, aborting!",  buf,  2u);
  }

LABEL_77:
}

int64_t sub_10000E27C(id a1, HRHandleStateChange *a2, HRHandleStateChange *a3)
{
  id v4 = a2;
  id v5 = a3;
  id v6 = -[HRHandleStateChange timestamp](v4, "timestamp");
  if (v6 <= (id)-[HRHandleStateChange timestamp](v5, "timestamp"))
  {
    id v8 = -[HRHandleStateChange timestamp](v4, "timestamp");
    if (v8 >= (id)-[HRHandleStateChange timestamp](v5, "timestamp")) {
      int64_t v7 = 0LL;
    }
    else {
      int64_t v7 = -1LL;
    }
  }

  else
  {
    int64_t v7 = 1LL;
  }

  return v7;
}

id sub_10000E2FC(uint64_t a1)
{
  v7[0] = off_10007BB28;
  v7[1] = off_10007BB40;
  v8[0] = off_10007BB30;
  v8[1] = @"Blown CA Fence Hang";
  uint64_t v2 = *(void *)(a1 + 32);
  unint64_t v1 = *(void *)(a1 + 40);
  v8[2] = v2;
  v7[2] = off_10007BB50;
  v7[3] = off_10007BB48;
  uint64_t v3 = +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", sub_100002FAC(v1));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v8[3] = v4;
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v8,  v7,  4LL));

  return v5;
}

void sub_10000E3EC(uint64_t a1, void *a2, _BYTE *a3)
{
  id v5 = a2;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 threads]);
  int64_t v7 = (void *)(a1 + 40);
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  *(void *)(a1 + 40)));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:v8]);

  if (v9)
  {
    unsigned int v10 = [v5 pid];
    uint64_t v12 = *(void *)(a1 + 32);
    uint64_t v11 = a1 + 32;
    *(_DWORD *)(*(void *)(v12 + 8) + 24LL) = v10;
    id v13 = sub_1000199EC();
    uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
      sub_100034360(v7, v11, v14);
    }

    *a3 = 1;
  }
}

void sub_10000E4C8(uint64_t a1, void *a2)
{
  id v5 = a2;
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) readDataOfLength:0x4000]);
  if ([v3 length])
  {
    do
    {
      [v5 writeData:v3];
      id v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) readDataOfLength:0x4000]);

      uint64_t v3 = v4;
    }

    while ([v4 length]);
  }

  else
  {
    id v4 = v3;
  }

  [*(id *)(a1 + 32) closeFile];
}

  ;
}

  ;
}

void sub_10000E5A8(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
}

  ;
}

  ;
}

void sub_10000E600( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

void sub_10000E610( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

void sub_10000E620(uint64_t a1@<X8>)
{
  *(void *)(v1 - _Block_object_dispose(va, 8) = a1;
}

  ;
}

void sub_10000E640( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

void sub_10000E65C(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
}

void sub_10000E670(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
}

void sub_10000E684(uint64_t a1@<X8>)
{
  *(void *)(v1 - _Block_object_dispose(va, 8) = a1;
}

void sub_10000E6A0( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

  ;
}

void sub_10000E6C4(void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
}

  ;
}

void sub_10000EB50( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_10000EB68(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6 = a2;
  if ((unint64_t)[v6 unsignedLongLongValue] < *(void *)(a1 + 40))
  {
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 32) = [v6 unsignedLongLongValue];
    *a4 = 1;
  }
}

void sub_10000F2B4( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

CFStringRef sub_10000F2C4(uint64_t a1)
{
  else {
    return off_100071460[a1 - 1];
  }
}

__CFString *sub_10000F750(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 tasksByPid]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:v4]);

  id v7 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (!v7)
  {

LABEL_13:
    id v9 = @"unknown";
    goto LABEL_14;
  }

  id v8 = v7;
  id v17 = v3;
  id v9 = 0LL;
  uint64_t v10 = *(void *)v19;
  do
  {
    for (i = 0LL; i != v8; i = (char *)i + 1)
    {
      if (*(void *)v19 != v10) {
        objc_enumerationMutation(v6);
      }
      uint64_t v12 = *(void **)(*((void *)&v18 + 1) + 8LL * (void)i);
      id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 name]);
      unsigned __int8 v14 = [v13 isEqualToString:@"xpcproxy"];

      if ((v14 & 1) == 0)
      {
        uint64_t v15 = objc_claimAutoreleasedReturnValue([v12 name]);

        id v9 = (__CFString *)v15;
      }
    }

    id v8 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
  }

  while (v8);

  id v3 = v17;
  if (!v9) {
    goto LABEL_13;
  }
LABEL_14:

  return v9;
}

LABEL_85:
      ktrace_session_destroy(v21);
LABEL_93:

      goto LABEL_94;
    }

    uint64_t v28 = dispatch_semaphore_create(0LL);
    *(void *)double v199 = _NSConcreteStackBlock;
    *(void *)&v199[8] = 3221225472LL;
    *(void *)&v199[16] = sub_1000119B0;
    double v200 = &unk_100071440;
    *(void *)&v201[8] = v21;
    uint64_t v29 = v28;
    *(void *)v201 = v29;
    ktrace_set_completion_handler(v21, v199);
    id v30 = qos_class_self();
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(v30, 0LL);
    int v32 = (void *)objc_claimAutoreleasedReturnValue(global_queue);
    unint64_t v33 = ktrace_start(v21, v32);

    if (v33)
    {
      __int128 v153 = sub_1000199EC();
      __int128 v154 = (os_log_s *)objc_claimAutoreleasedReturnValue(v153);
      if (os_log_type_enabled(v154, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)uint64_t v213 = 67109376;
        *(_DWORD *)&v213[4] = v33;
        *(_WORD *)&v213[8] = 2048;
        *(void *)&v213[10] = v178;
        _os_log_impl( (void *)&_mh_execute_header,  v154,  OS_LOG_TYPE_DEFAULT,  "getMKRunnableDatafromKTraceforThreadId: ktrace_start failed with error# = %i for threadId= %llx",  v213,  0x12u);
      }

      ktrace_session_destroy(v21);
      goto LABEL_92;
    }

    uint64_t v34 = dispatch_time(0LL, 100000000000LL);
    if (dispatch_semaphore_wait(v29, v34))
    {
      __int128 v155 = sub_1000199EC();
      __int128 v156 = (os_log_s *)objc_claimAutoreleasedReturnValue(v155);
      if (os_log_type_enabled(v156, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)uint64_t v213 = 134217984;
        *(void *)&v213[4] = 100000000000LL;
        _os_log_impl( (void *)&_mh_execute_header,  v156,  OS_LOG_TYPE_DEFAULT,  "Timed out (%lld) parsing trace buffer",  v213,  0xCu);
      }

      ktrace_end(v21, 1LL);
LABEL_92:

      goto LABEL_93;
    }

    if (!-[NSDictionary count](blockingThreadInfo, "count")) {
      break;
    }
    id v35 = sub_1000199EC();
    unsigned __int8 v36 = (os_log_s *)objc_claimAutoreleasedReturnValue(v35);
    if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
    {
      id v37 = -[NSDictionary count](blockingThreadInfo, "count");
      *(_DWORD *)buf = 134217984;
      *(void *)&uint8_t buf[4] = v37;
      _os_log_impl( (void *)&_mh_execute_header,  v36,  OS_LOG_TYPE_INFO,  "*** Size of makeRunnableData array %lx,***",  buf,  0xCu);
    }

    id v38 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    v198 = v176;
    id v39 = v172;
    v187 = v38;
    memset(v213, 0, sizeof(v213));
    v214 = 0u;
    unsigned int v215 = 0u;
    __int16 v173 = blockingThreadInfo;
    id v40 = blockingThreadInfo;
    id v41 = v39;
    id v42 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary reverseObjectEnumerator](v40, "reverseObjectEnumerator"));
    unsigned int v43 = [v42 countByEnumeratingWithState:v213 objects:buf count:16];
    id v193 = v39;
    if (v43)
    {
      id v44 = v43;
      id v45 = **(void **)&v213[16];
      id v194 = **(void **)&v213[16];
      id v196 = v42;
      do
      {
        unsigned int v46 = 0LL;
        do
        {
          if (**(void **)&v213[16] != v45) {
            objc_enumerationMutation(v42);
          }
          id v47 = *(void **)(*(void *)&v213[8] + 8LL * (void)v46);
          if ((objc_msgSend(v47, "inInterrupt", v166) & 1) == 0
            && (unint64_t)[v47 timestamp] < v24)
          {
            id v48 = +[SATimestamp timestampWithMachAbsTime:machContTime:wallTime:machTimebase:]( SATimestamp,  "timestampWithMachAbsTime:machContTime:wallTime:machTimebase:",  [v47 timestamp],  0,  sub_1000030B4(),  0.0);
            unsigned int v49 = (void *)objc_claimAutoreleasedReturnValue(v48);
            BOOL v50 = (void *)objc_claimAutoreleasedReturnValue([v41 sampleTimestamps]);
            id v51 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v198,  "lastThreadStateOnOrBeforeTime:sampleIndex:",  v49,  (char *)objc_msgSend(v50, "count") - 1));

            if (v51)
            {
              id v52 = [v47 timestamp];
              uint64_t v53 = (void *)objc_claimAutoreleasedReturnValue([v51 endTimestamp]);
              if (v52 <= [v53 machAbsTime])
              {
                unsigned int v59 = [v47 timestamp];
                unint64_t v60 = (void *)objc_claimAutoreleasedReturnValue([v51 startTimestamp]);
                id v54 = v59 >= [v60 machAbsTime];

                id v41 = v193;
              }

              else
              {
                id v54 = 0;
              }

              id v61 = sub_1000199EC();
              unsigned int v62 = (os_log_s *)objc_claimAutoreleasedReturnValue(v61);
              if (os_log_type_enabled(v62, OS_LOG_TYPE_DEBUG))
              {
                v185 = [v47 timestamp];
                id v182 = [v47 madeRunnableByThreadId];
                double v189 = (void *)objc_claimAutoreleasedReturnValue([v51 startTimestamp]);
                id v180 = [v189 machAbsTime];
                id v93 = (void *)objc_claimAutoreleasedReturnValue([v51 endTimestamp]);
                double v94 = [v93 machAbsTime];
                id v95 = [v51 startSampleIndex];
                __int16 v96 = [v51 endSampleIndex];
                *(_DWORD *)double v199 = 134219778;
                double v97 = @"outside";
                if (v54) {
                  double v97 = @"inside";
                }
                *(void *)&v199[4] = v185;
                *(_WORD *)&v199[12] = 2048;
                *(void *)&v199[14] = v178;
                *(_WORD *)&v199[22] = 2048;
                double v200 = v182;
                *(_WORD *)v201 = 2048;
                *(void *)&v201[2] = v180;
                *(_WORD *)&v201[10] = 2048;
                *(void *)&v201[12] = v94;
                id v41 = v193;
                double v202 = 2048;
                v203 = (unint64_t)v95;
                id v204 = 2048;
                v205 = v96;
                BOOL v206 = 2112;
                id v207 = v97;
                _os_log_debug_impl( (void *)&_mh_execute_header,  v62,  OS_LOG_TYPE_DEBUG,  "iterateMkRunnableDataToFindBlockingThreadInfo: eachMadeRunnable: %llu - thread %llx by %llx mkRunnable Time, threadState time %llu-%llu (idx %lu - idx %lu) -> %@",  v199,  0x52u);

                uint64_t v24 = a7;
              }

              if (v54)
              {
                id v63 = (void *)objc_claimAutoreleasedReturnValue([v51 startTimestamp]);
                id v64 = [v63 machAbsTime];

                else {
                  id v65 = (unint64_t)v64;
                }
                id v66 = (char *)[v47 timestamp];
                id v67 = sub_1000199EC();
                id v68 = (os_log_s *)objc_claimAutoreleasedReturnValue(v67);
                if (os_log_type_enabled(v68, OS_LOG_TYPE_DEBUG))
                {
                  uint64_t v98 = [v47 timestamp];
                  id v99 = [v47 madeRunnableByThreadId];
                  *(_DWORD *)double v199 = 134219264;
                  *(void *)&v199[4] = v98;
                  *(_WORD *)&v199[12] = 2048;
                  *(void *)&v199[14] = v178;
                  *(_WORD *)&v199[22] = 2048;
                  double v200 = v99;
                  *(_WORD *)v201 = 2048;
                  *(void *)&v201[2] = &v66[-v65];
                  *(_WORD *)&v201[10] = 2048;
                  *(void *)&v201[12] = v66;
                  double v202 = 2048;
                  v203 = v65;
                  _os_log_debug_impl( (void *)&_mh_execute_header,  v68,  OS_LOG_TYPE_DEBUG,  "iterateMkRunnableDataToFindBlockingThreadInfo: eachMadeRunnable: %llu - thread %llx by %llx -> block edtime = %llu (= %llu - %llu)",  v199,  0x3Eu);
                }

                uint64_t v69 = &v66[-v65];
                if ((unint64_t)v66 >= v65)
                {
                  id v188 = v49;
                  BOOL v181 = v66;
                  BOOL v184 = v65;
                  uint64_t v73 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( NSNumber,  "numberWithUnsignedLongLong:",  [v47 madeRunnableByThreadId]));
                  id v74 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v187, "objectForKeyedSubscript:", v73));

                  if (!v74)
                  {
                    v75 = objc_alloc_init(&OBJC_CLASS___BlockingThreadElement);
                    id v76 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( NSNumber,  "numberWithUnsignedLongLong:",  [v47 madeRunnableByThreadId]));
                    -[NSMutableDictionary setObject:forKeyedSubscript:](v187, "setObject:forKeyedSubscript:", v75, v76);
                  }

                  id v77 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( NSNumber,  "numberWithUnsignedLongLong:",  [v47 madeRunnableByThreadId]));
                  unint64_t v78 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v187, "objectForKeyedSubscript:", v77));
                  id v79 = (unint64_t)v69;
                  unsigned int v80 = &v69[(void)[v78 cumulativeTime]];

                  v81 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( NSNumber,  "numberWithUnsignedLongLong:",  [v47 madeRunnableByThreadId]));
                  __int16 v82 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v187, "objectForKeyedSubscript:", v81));
                  id v179 = v80;
                  [v82 setCumulativeTime:v80];

                  id v83 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( NSNumber,  "numberWithUnsignedLongLong:",  [v47 madeRunnableByThreadId]));
                  id v84 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v187, "objectForKeyedSubscript:", v83));
                  dispatch_semaphore_t v85 = [v84 maxBlockingTime];

                  if ((unint64_t)v85 < v79)
                  {
                    uint64_t v86 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( NSNumber,  "numberWithUnsignedLongLong:",  [v47 madeRunnableByThreadId]));
                    uint64_t v87 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( v187,  "objectForKeyedSubscript:",  v86));
                    [v87 setMaxBlockingTime:v79];

                    __int128 v88 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( NSNumber,  "numberWithUnsignedLongLong:",  [v47 madeRunnableByThreadId]));
                    id v89 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( v187,  "objectForKeyedSubscript:",  v88));
                    [v89 setStartThreadTime:v184];

                    id v90 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( NSNumber,  "numberWithUnsignedLongLong:",  [v47 madeRunnableByThreadId]));
                    uint64_t v91 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( v187,  "objectForKeyedSubscript:",  v90));
                    [v91 setEndThreadTime:v181];
                  }

                  dispatch_time_t v92 = sub_1000199EC();
                  id v56 = (os_log_s *)objc_claimAutoreleasedReturnValue(v92);
                  unsigned int v49 = v188;
                  if (os_log_type_enabled(v56, OS_LOG_TYPE_DEBUG))
                  {
                    id v100 = [v47 timestamp];
                    uint64_t v101 = [v47 madeRunnableByThreadId];
                    id v102 = [v47 madeRunnableByThreadId];
                    os_signpost_id_t v103 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( NSNumber,  "numberWithUnsignedLongLong:",  [v47 madeRunnableByThreadId]));
                    id v104 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( v187,  "objectForKeyedSubscript:",  v103));
                    unint64_t v105 = [v104 maxBlockingTime];
                    *(_DWORD *)double v199 = 134219264;
                    *(void *)&v199[4] = v100;
                    *(_WORD *)&v199[12] = 2048;
                    *(void *)&v199[14] = v178;
                    *(_WORD *)&v199[22] = 2048;
                    double v200 = v101;
                    *(_WORD *)v201 = 2048;
                    *(void *)&v201[2] = v102;
                    *(_WORD *)&v201[10] = 2048;
                    *(void *)&v201[12] = v179;
                    double v202 = 2048;
                    v203 = (unint64_t)v105;
                    _os_log_debug_impl( (void *)&_mh_execute_header,  v56,  OS_LOG_TYPE_DEBUG,  "iterateMkRunnableDataToFindBlockingThreadInfo: eachMadeRunnable: %llu - thread %llx by %llx => thr ead %llu total time is up to %llu and max time %llu",  v199,  0x3Eu);
                  }

                  uint64_t v24 = a7;
                  id v41 = v193;
                }

                else
                {
                  id v70 = sub_1000199EC();
                  id v56 = (os_log_s *)objc_claimAutoreleasedReturnValue(v70);
                  uint64_t v24 = a7;
                  if (os_log_type_enabled(v56, OS_LOG_TYPE_FAULT))
                  {
                    v183 = v65;
                    id v71 = [v47 timestamp];
                    id v72 = [v47 madeRunnableByThreadId];
                    *(_DWORD *)double v199 = 134219008;
                    *(void *)&v199[4] = v71;
                    *(_WORD *)&v199[12] = 2048;
                    *(void *)&v199[14] = v178;
                    *(_WORD *)&v199[22] = 2048;
                    double v200 = v72;
                    *(_WORD *)v201 = 2048;
                    *(void *)&v201[2] = v66;
                    *(_WORD *)&v201[10] = 2048;
                    *(void *)&v201[12] = v183;
                    _os_log_fault_impl( (void *)&_mh_execute_header,  v56,  OS_LOG_TYPE_FAULT,  "iterateMkRunnableDataToFindBlockingThreadInfo: eachMadeRunnable: %llu - thread %llx by %llx -> NEG ATIVE blocked time = %llu - %llu)",  v199,  0x34u);
                  }
                }

                goto LABEL_43;
              }
            }

            else
            {
              id v55 = sub_1000199EC();
              id v56 = (os_log_s *)objc_claimAutoreleasedReturnValue(v55);
              if (os_log_type_enabled(v56, OS_LOG_TYPE_DEBUG))
              {
                unint64_t v57 = [v47 timestamp];
                id v58 = [v47 madeRunnableByThreadId];
                *(_DWORD *)double v199 = 134218496;
                *(void *)&v199[4] = v57;
                *(_WORD *)&v199[12] = 2048;
                *(void *)&v199[14] = v178;
                *(_WORD *)&v199[22] = 2048;
                double v200 = v58;
                _os_log_debug_impl( (void *)&_mh_execute_header,  v56,  OS_LOG_TYPE_DEBUG,  "iterateMkRunnableDataToFindBlockingThreadInfo: eachMadeRunnable: %llu - thread %llx by %llx mkRunnable Time, threadState is nil",  v199,  0x20u);
              }

LABEL_43:
            }

            id v45 = v194;
            id v42 = v196;
          }

          unsigned int v46 = (char *)v46 + 1;
        }

        while (v44 != v46);
        unsigned int v106 = [v42 countByEnumeratingWithState:v213 objects:buf count:16];
        id v44 = v106;
      }

      while (v106);
    }

    unsigned int v107 = sub_1000199EC();
    id v108 = (os_log_s *)objc_claimAutoreleasedReturnValue(v107);
    if (os_log_type_enabled(v108, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = v187;
      _os_log_impl( (void *)&_mh_execute_header,  v108,  OS_LOG_TYPE_DEFAULT,  "findBlockingThreadForTailspin: Cumulative Blocking Time By Thread: %@",  buf,  0xCu);
    }

    int v109 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  v178));
    -[NSMutableDictionary removeObjectForKey:](v187, "removeObjectForKey:", v109);

    if (!-[NSMutableDictionary count](v187, "count"))
    {
      id v161 = sub_1000199EC();
      float v162 = (os_log_s *)objc_claimAutoreleasedReturnValue(v161);
      __int16 v163 = v162;
      if (v178 == v170)
      {
        uint64_t v10 = v169;
        blockingThreadInfo = v173;
        if (os_log_type_enabled(v162, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v163,  OS_LOG_TYPE_DEFAULT,  "findBlockingThreadForTailspin: no thread found for hangAppMainThreadId ",  buf,  2u);
        }

        __int128 v157 = 4LL;
        v176 = v198;
        goto LABEL_111;
      }

      uint64_t v10 = v169;
      blockingThreadInfo = v173;
      if (os_log_type_enabled(v162, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134217984;
        *(void *)&uint8_t buf[4] = v178;
        _os_log_impl( (void *)&_mh_execute_header,  v163,  OS_LOG_TYPE_INFO,  "findBlockingThreadForTailspin: no thread found for currentNestedThreadId =%llx ",  buf,  0xCu);
      }

LABEL_109:
LABEL_110:
      os_signpost_id_t v164 = v168;
      blockingThreadInfo = self->_blockingThreadInfo;
      self->_blockingThreadInfo = v164;
      __int128 v157 = 5LL;
      goto LABEL_111;
    }

    int v110 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary keysSortedByValueUsingComparator:]( v187,  "keysSortedByValueUsingComparator:",  &stru_1000713D0));
    v111 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary keysSortedByValueUsingComparator:]( v187,  "keysSortedByValueUsingComparator:",  &stru_1000713F0));
    BOOL v112 = (void *)objc_claimAutoreleasedReturnValue([v111 objectAtIndexedSubscript:0]);
    v113 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v187, "objectForKeyedSubscript:", v112));
    unsigned __int8 v114 = +[NSNumber numberWithDouble:]( NSNumber,  "numberWithDouble:",  sub_100002FAC((unint64_t)[v113 cumulativeTime]));
    unsigned int v115 = (void *)objc_claimAutoreleasedReturnValue(v114);

    int v116 = (void *)objc_claimAutoreleasedReturnValue([v175 objectForKeyedSubscript:v112]);
    id v117 = (void *)objc_claimAutoreleasedReturnValue([v110 objectAtIndexedSubscript:0]);
    uint64_t v118 = [v117 unsignedLongLongValue];
    unint64_t v119 = (void *)objc_claimAutoreleasedReturnValue([v111 objectAtIndexedSubscript:0]);
    v120 = [v119 unsignedLongLongValue];

    id v121 = v118 == v120;
    uint64_t v122 = a7;
    id v123 = self;
    if (!v121)
    {
      id v124 = sub_1000199EC();
      id v125 = (os_log_s *)objc_claimAutoreleasedReturnValue(v124);
      if (os_log_type_enabled(v125, OS_LOG_TYPE_DEFAULT))
      {
        v195 = (void *)objc_claimAutoreleasedReturnValue([v111 objectAtIndexedSubscript:0]);
        id v186 = [v195 unsignedLongLongValue];
        unsigned int v190 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v187, "objectForKeyedSubscript:", v112));
        double v197 = v116;
        id v126 = [v190 cumulativeTime];
        uint64_t v127 = (void *)objc_claimAutoreleasedReturnValue([v110 objectAtIndexedSubscript:0]);
        id v128 = [v127 unsignedLongLongValue];
        unint64_t v129 = (void *)objc_claimAutoreleasedReturnValue([v110 objectAtIndexedSubscript:0]);
        unint64_t v130 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v187, "objectForKeyedSubscript:", v129));
        uint64_t v131 = [v130 cumulativeTime];
        *(_DWORD *)buf = 134218752;
        *(void *)&uint8_t buf[4] = v186;
        *(_WORD *)&_BYTE buf[12] = 2048;
        *(void *)&buf[14] = v126;
        int v116 = v197;
        *(_WORD *)&buf[22] = 2048;
        v209 = v128;
        LOWORD(v210) = 2048;
        *(void *)((char *)&v210 + 2) = v131;
        _os_log_impl( (void *)&_mh_execute_header,  v125,  OS_LOG_TYPE_DEFAULT,  "findBlockingThreadForTailspin: max cumulative Thread id %llx, blocking time %llu, max block time thread id %ll x, blocking time %llu ",  buf,  0x2Au);

        id v123 = self;
        uint64_t v122 = a7;
      }
    }

    uint64_t v15 = v177;
    -[HRMakeRunnableData storeTopBlockingThreadInfoInBlockingThreadInfo:sampleStore:mostBlockingTimeThreadId:pidMostBlockingTime:blockedTime:isHangMainThread:]( v123,  "storeTopBlockingThreadInfoInBlockingThreadInfo:sampleStore:mostBlockingTimeThreadId:pidMostBlockingTime:blockedTim e:isHangMainThread:",  v177,  v193,  v112,  v116,  v115,  v178 == v170);
    if ((unint64_t)[v115 unsignedLongLongValue] < 0x33)
    {
      os_signpost_id_t v139 = 0;
      uint64_t v16 = 0;
      v176 = v198;
    }

    else
    {
      -[HRMakeRunnableData storeOtherBlockingThreadInfoInBlockingThreadInfo:sampleStore:mostBlockingTimeThreadId:sortedThreadsMaxCumlativeTime:blockingTimeByThread:tidToPidDict:]( v123,  "storeOtherBlockingThreadInfoInBlockingThreadInfo:sampleStore:mostBlockingTimeThreadId:sortedThreadsMaxCumlativeT ime:blockingTimeByThread:tidToPidDict:",  v177,  v193,  v112,  v111,  v187,  v175);
      if (!v116)
      {
        v140 = sub_1000199EC();
        id v141 = (os_log_s *)objc_claimAutoreleasedReturnValue(v140);
        if (os_log_type_enabled(v141, OS_LOG_TYPE_DEFAULT))
        {
          id v142 = [v112 unsignedLongLongValue];
          *(_DWORD *)buf = 134217984;
          *(void *)&uint8_t buf[4] = v142;
          _os_log_impl( (void *)&_mh_execute_header,  v141,  OS_LOG_TYPE_DEFAULT,  "findBlockingThreadForTailspin: pid is nil for Thread with most blocking time %llx ",  buf,  0xCu);
        }

        uint64_t v16 = 0;
        os_signpost_id_t v139 = 3;
        v176 = v198;
        goto LABEL_69;
      }

      id v132 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v187, "objectForKeyedSubscript:", v112));
      v133 = [v132 endThreadTime];

      v134 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v187, "objectForKeyedSubscript:", v112));
      id v135 = [v134 startThreadTime];

      unint64_t v136 = sub_1000199EC();
      unint64_t v137 = (os_log_s *)objc_claimAutoreleasedReturnValue(v136);
      if (os_log_type_enabled(v137, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = v166;
        *(void *)&uint8_t buf[4] = v135;
        *(_WORD *)&_BYTE buf[12] = 2048;
        *(void *)&buf[14] = v133;
        _os_log_impl( (void *)&_mh_execute_header,  v137,  OS_LOG_TYPE_INFO,  "findBlockingThreadForTailspin: new threadStartTime %llu endTime %llu ",  buf,  0x16u);
      }

      if (v133 - v135 <= (v122 - a6) >> 1)
      {
        os_signpost_id_t v139 = 0;
        uint64_t v16 = 0;
        v176 = v198;
        a6 = (unint64_t)v135;
        a7 = (unint64_t)v133;
LABEL_69:
        uint64_t v15 = v177;
        goto LABEL_70;
      }

      id v178 = [v112 unsignedLongLongValue];
      unint64_t v138 = sub_100011180(v193, v175, (uint64_t)v178);
      v176 = (void *)objc_claimAutoreleasedReturnValue(v138);

      uint64_t v15 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
      -[NSMutableDictionary setObject:forKeyedSubscript:]( v177,  "setObject:forKeyedSubscript:",  v15,  @"nextTopBlockingThreadInfo");

      os_signpost_id_t v139 = 0;
      ++v174;
      uint64_t v16 = 1;
      a6 = (unint64_t)v135;
      a7 = (unint64_t)v133;
    }

LABEL_70:
    uint64_t v10 = v169;
    if (v139)
    {
      id v177 = v15;
      goto LABEL_110;
    }
  }

  __int128 v158 = sub_1000199EC();
  __int128 v159 = (os_log_s *)objc_claimAutoreleasedReturnValue(v158);
  __int128 v160 = v159;
  if (v178 != v170)
  {
    if (os_log_type_enabled(v159, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      *(void *)&uint8_t buf[4] = v178;
      _os_log_impl( (void *)&_mh_execute_header,  v160,  OS_LOG_TYPE_INFO,  "findBlockingThreadForTailspin: 0 mkrunnable tracepoints found for threadId = %llx",  buf,  0xCu);
    }

    goto LABEL_109;
  }

  if (os_log_type_enabled(v159, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v160,  OS_LOG_TYPE_DEFAULT,  "findBlockingThreadForTailspin: 0 mkrunnable tracepoints found for hang main app thread",  buf,  2u);
  }

  __int128 v157 = 3LL;
LABEL_111:

  return v157;
}

int64_t sub_100011168(id a1, id a2, id a3)
{
  return (int64_t)_[a3 compareMaxBlockingTime:a2];
}

int64_t sub_100011174(id a1, id a2, id a3)
{
  return (int64_t)_[a3 compareCumulativeTime:a2];
}

id sub_100011180(void *a1, void *a2, uint64_t a3)
{
  id v5 = a1;
  id v6 = a2;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a3));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:v7]);

  __int128 v28 = 0u;
  __int128 v29 = 0u;
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v5 tasksByPid]);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:v8]);

  id v11 = [v10 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v23 = v8;
    id v24 = v6;
    id v25 = v5;
    uint64_t v13 = *(void *)v27;
    while (2)
    {
      for (i = 0LL; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v27 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void **)(*((void *)&v26 + 1) + 8LL * (void)i);
        uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v15 threads]);
        id v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  a3));
        __int128 v18 = (void *)objc_claimAutoreleasedReturnValue([v16 objectForKeyedSubscript:v17]);

        if (v18)
        {
          __int128 v20 = (void *)objc_claimAutoreleasedReturnValue([v15 threads]);
          __int128 v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  a3));
          __int128 v19 = (void *)objc_claimAutoreleasedReturnValue([v20 objectForKeyedSubscript:v21]);

          goto LABEL_11;
        }
      }

      id v12 = [v10 countByEnumeratingWithState:&v26 objects:v30 count:16];
      if (v12) {
        continue;
      }
      break;
    }

    __int128 v19 = 0LL;
LABEL_11:
    id v6 = v24;
    id v5 = v25;
    id v8 = v23;
  }

  else
  {
    __int128 v19 = 0LL;
  }

  return v19;
}

LABEL_16:
LABEL_18:
    if (!v28 && (_DWORD)v29 == -1) {
      goto LABEL_27;
    }
    if ((_DWORD)v29 == -1)
    {
      id v30 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  v28));
      id v31 = (void *)objc_claimAutoreleasedReturnValue([v47 objectForKeyedSubscript:v30]);
      __int128 v29 = (uint64_t)[v31 intValue];
    }

    int v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", v28));
    unint64_t v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v29));
    -[HRMakeRunnableData storeTopBlockingThreadInfoInBlockingThreadInfo:sampleStore:mostBlockingTimeThreadId:pidMostBlockingTime:blockedTime:isHangMainThread:]( self,  "storeTopBlockingThreadInfoInBlockingThreadInfo:sampleStore:mostBlockingTimeThreadId:pidMostBlockingTime:blockedTim e:isHangMainThread:",  v25,  v45,  v32,  v33,  &off_100076430,  v22 == v43);

    if (!v28)
    {
LABEL_27:
      uint64_t v15 = v24;
      __int128 v20 = v48;
      goto LABEL_29;
    }

    uint64_t v34 = sub_100011180(v45, v47, (uint64_t)v28);
    __int128 v20 = (void *)objc_claimAutoreleasedReturnValue(v34);

    id v35 = (void *)objc_claimAutoreleasedReturnValue([v20 threadStates]);
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v35 lastObject]);

    unsigned __int8 v36 = (void *)objc_claimAutoreleasedReturnValue([v15 startTimestamp]);
    id v37 = (void *)objc_claimAutoreleasedReturnValue([v15 endTimestamp]);
    id v38 = [v37 ge:v44];

    if ((v38 & 1) == 0) {
      goto LABEL_29;
    }
    __int128 v19 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v25,  "setObject:forKeyedSubscript:",  v19,  @"nextTopBlockingThreadInfo");

    ++v21;
    uint64_t v22 = v28;
    uint64_t v23 = v20;
    id v24 = v15;
    id v25 = v19;
    if (v21 >= 0x1F) {
      goto LABEL_30;
    }
  }

LABEL_29:
  __int128 v19 = v25;
LABEL_30:
  uint64_t v13 = v42;
  if (-[NSMutableDictionary count](v42, "count"))
  {
    objc_storeStrong((id *)&self->_blockingThreadInfo, obj);
    __int128 v18 = 5LL;
  }

  else
  {
    __int128 v18 = 4LL;
  }

  id v8 = v45;
  id v11 = v41;

LABEL_34:
  return v18;
}

  id v39 = sub_1000199EC();
  id v40 = (os_log_s *)objc_claimAutoreleasedReturnValue(v39);
  id v41 = v16;
  if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
  {
    id v52 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%.02f",  (float)(v66 * 1000.0)));
    uint64_t v53 = -[NSMutableArray count](v61, "count");
    *(_DWORD *)buf = 136316162;
    id v70 = "getSurroundingHangIntervalsData";
    id v71 = 2112;
    id v72 = v56;
    uint64_t v73 = 2112;
    id v74 = v55;
    v75 = 2112;
    id v76 = v52;
    id v77 = 2048;
    unint64_t v78 = v53;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v40,  OS_LOG_TYPE_DEBUG,  "%s retrieved hang history between windowStartDate %@ and windowEndDate %@ which took %@ms and found %lu hangs.",  buf,  0x34u);
  }

  v67[0] = @"hangHistory";
  id v42 = -[NSMutableArray copy](v61, "copy");
  v68[0] = v42;
  v67[1] = @"hangHistoryRetrievalTimeMS";
  unsigned int v43 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%.02f",  (float)(v66 * 1000.0)));
  v68[1] = v43;
  v67[2] = @"hangHistoryCount";
  id v44 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLong:",  -[NSMutableArray count](v61, "count")));
  v68[2] = v44;
  v67[3] = @"hangHistoryTotalHangTimeMS";
  id v45 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%.02f",  (float)(v17 * 1000.0)));
  v68[3] = v45;
  v67[4] = @"hangHistoryForwardWindowTimeMS";
  [v55 timeIntervalSinceReferenceDate];
  id v47 = v46;
  [v60 timeIntervalSinceReferenceDate];
  unsigned int v49 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%.02f",  (v47 - (v10 + v48)) * 1000.0));
  v68[4] = v49;
  BOOL v50 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v68,  v67,  5LL));

  return v50;
}

                                          uint64_t v10 = (v10 + 1);
                                          goto LABEL_17;
                                        }

                                        goto LABEL_2110;
                                      }

                                      if (v12 > 1115)
                                      {
                                        if (v12 == 1116)
                                        {
                                          if ((_DWORD)v14 != 32) {
                                            sub_10001BA0C( "ASPFTLParseBufferToCxt: gcwamp(1116): (#32) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                          }
                                          else {
                                            __int128 v20 = v14;
                                          }
                                          if ((sub_10002B6E0(a1, "gcwamp_", (uint64_t)v8, 8u, v20) & 1) == 0)
                                          {
                                            uint64_t v22 = "ASPFTLParseBufferToCxt: gcwamp(1116): Cannot add 32 elements to context";
                                            goto LABEL_2247;
                                          }

                                          goto LABEL_14;
                                        }

                                        if (v12 == 1137)
                                        {
                                          __int128 v19 = "ASPFTLParseBufferToCxt: numOfToUnhappySwitches(1137) cannot add 1 element to context";
                                          goto LABEL_15;
                                        }

void sub_1000117F0(void *a1, uint64_t *a2)
{
  if (a2[1] == a1[5] && (unint64_t)*a2 >= a1[6] && (unint64_t)*a2 <= a1[7])
  {
    BOOL v3 = *((_DWORD *)a2 + 12) == 621346816 && a2[3] != 0;
    id v4 = (void *)a1[4];
    id v5 = -[MakeRunnableEvent initWithMadeRunnableByThreadID:atTime:inInterrupt:]( objc_alloc(&OBJC_CLASS___MakeRunnableEvent),  "initWithMadeRunnableByThreadID:atTime:inInterrupt:",  a2[5],  *a2,  v3);
    [v4 addObject:v5];

    id v6 = sub_1000199EC();
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      int v8 = *((_DWORD *)a2 + 12);
      if (v8 == 6)
      {
        int v9 = 0;
        uint64_t v10 = @"MACH_MAKE_RUNNABLE";
      }

      else if (v8 == 621346816)
      {
        int v9 = 0;
        uint64_t v10 = @"PERF_LZ_MKRUNNABLE";
      }

      else
      {
        uint64_t v10 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:"));
        int v9 = 1;
      }

      uint64_t v11 = a2[5];
      uint64_t v12 = *a2;
      uint64_t v13 = a2[1];
      int v14 = 138413314;
      uint64_t v15 = v10;
      __int16 v16 = 2048;
      uint64_t v17 = v12;
      __int16 v18 = 2048;
      uint64_t v19 = v11;
      __int16 v20 = 2048;
      uint64_t v21 = v13;
      __int16 v22 = 1024;
      BOOL v23 = v3;
      _os_log_debug_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEBUG,  "%@: %llu - thread %llx mkrunnable thread %llx inInterrupt %x",  (uint8_t *)&v14,  0x30u);
      if (v9) {
    }
      }
  }

uint64_t sub_1000119B0(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

NSMutableArray *sub_1000119D8(char *a1, void *a2)
{
  uint64_t v36 = 0LL;
  id v37 = &v36;
  uint64_t v38 = 0x3032000000LL;
  id v39 = sub_100011E48;
  id v40 = sub_100011E58;
  id v41 = &stru_100071CD0;
  uint64_t v4 = ktrace_file_open(a1, 0LL);
  uint64_t v5 = v4;
  if (v4)
  {
    v35[0] = _NSConcreteStackBlock;
    v35[1] = 3221225472LL;
    v35[2] = sub_100011E60;
    v35[3] = &unk_100071490;
    v35[4] = &v36;
    int v6 = ktrace_file_iterate(v4, 0LL, v35);
    ktrace_file_close(v5);
    if (v6)
    {
      id v7 = sub_1000199EC();
      int v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        int v9 = strerror(v6);
        *(_DWORD *)buf = 136315138;
        unsigned int v43 = v9;
        _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Error iterating over tailspin file: %s",  buf,  0xCu);
      }

      if (a2)
      {
        uint64_t v10 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Error iterating over tailspin file: %s",  strerror(v6));
        uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
        id v12 = sub_100002610(5LL, (uint64_t)v11);
        *a2 = (id)objc_claimAutoreleasedReturnValue(v12);
      }

      goto LABEL_11;
    }

    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([(id)v37[5] dataUsingEncoding:4]);
    if (v19)
    {
      id v34 = 0LL;
      __int16 v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSJSONSerialization JSONObjectWithData:options:error:]( &OBJC_CLASS___NSJSONSerialization,  "JSONObjectWithData:options:error:",  v19,  1LL,  &v34));
      uint64_t v21 = (char *)v34;
      __int16 v22 = v21;
      if (!v20 || v21)
      {
        id v29 = sub_1000199EC();
        id v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          unsigned int v43 = v22;
          _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "Error deserializing JSON: %@", buf, 0xCu);
        }

        if (a2)
        {
          id v31 = sub_100002610(5LL, (uint64_t)@"Error deserializing JSON from tailspin reason string");
          __int16 v18 = 0LL;
          *a2 = (id)objc_claimAutoreleasedReturnValue(v31);
        }

        else
        {
          __int16 v18 = 0LL;
        }
      }

      else
      {
        uint64_t v23 = objc_opt_class(&OBJC_CLASS___NSArray);
        if ((objc_opt_isKindOfClass(v20, v23) & 1) != 0)
        {
          id v24 = v20;
        }

        else
        {
          uint64_t v32 = objc_opt_class(&OBJC_CLASS___NSDictionary);
          if ((objc_opt_isKindOfClass(v20, v32) & 1) != 0)
          {
            id v24 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
            -[NSMutableArray addObject:](v24, "addObject:", v20);
          }

          else
          {
            id v24 = 0LL;
          }
        }

        __int16 v18 = v24;
      }
    }

    else
    {
      id v25 = sub_1000199EC();
      __int128 v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        __int128 v27 = (char *)v37[5];
        *(_DWORD *)buf = 138412290;
        unsigned int v43 = v27;
        _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEFAULT,  "Error creating JSON data from reason string: '%@'",  buf,  0xCu);
      }

      if (a2)
      {
        id v28 = sub_100002610(5LL, (uint64_t)@"Error creating JSON data from reason string");
        __int16 v18 = 0LL;
        *a2 = (id)objc_claimAutoreleasedReturnValue(v28);
      }

      else
      {
        __int16 v18 = 0LL;
      }
    }
  }

  else
  {
    if (!a2)
    {
LABEL_11:
      __int16 v18 = 0LL;
      goto LABEL_33;
    }

    id v13 = sub_1000199EC();
    int v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v15 = __error();
      __int16 v16 = strerror(*v15);
      *(_DWORD *)buf = 136315394;
      unsigned int v43 = a1;
      __int16 v44 = 2080;
      id v45 = v16;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Could not open tailspin file %s for parsing reason string, error: %s",  buf,  0x16u);
    }

    id v17 = sub_100002610(5LL, (uint64_t)@"Could not open tailspin file for parsing reason string");
    __int16 v18 = 0LL;
    *a2 = (id)objc_claimAutoreleasedReturnValue(v17);
  }

LABEL_33:
  _Block_object_dispose(&v36, 8);
  return v18;
}

void sub_100011E04( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

uint64_t sub_100011E48(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_100011E58(uint64_t a1)
{
}

uint64_t sub_100011E60(uint64_t a1, uint64_t a2)
{
  int v4 = ktrace_chunk_tag(a2);
  unsigned int v5 = ktrace_chunk_version_major(a2);
  uint64_t v6 = ktrace_config_create(a2);
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t reason = ktrace_config_get_reason();
    if (reason)
    {
      uint64_t v9 = objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", reason));
      uint64_t v10 = *(void *)(*(void *)(a1 + 32) + 8LL);
      uint64_t v11 = *(void **)(v10 + 40);
      *(void *)(v10 + 40) = v9;

      ktrace_config_destroy(v7);
      return 0LL;
    }

    ktrace_config_destroy(v7);
  }

  uint64_t result = 1LL;
  if (v4 == 36867 && v5 <= 1)
  {
    uint64_t v13 = ktrace_chunk_size(a2);
    uint64_t v14 = ktrace_chunk_map_data(a2, 0LL, v13);
    uint64_t v15 = -[NSData initWithBytesNoCopy:length:freeWhenDone:]( objc_alloc(&OBJC_CLASS___NSData),  "initWithBytesNoCopy:length:freeWhenDone:",  v14,  v13,  0LL);
    __int16 v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSPropertyListSerialization propertyListWithData:options:format:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "propertyListWithData:options:format:error:",  v15,  0LL,  0LL,  0LL));
    uint64_t v17 = objc_claimAutoreleasedReturnValue([v16 objectForKeyedSubscript:UnsafePointer]);
    uint64_t v18 = *(void *)(*(void *)(a1 + 32) + 8LL);
    uint64_t v19 = *(void **)(v18 + 40);
    *(void *)(v18 + 40) = v17;

    ktrace_chunk_unmap_data(a2, v14, v13);
    return 0LL;
  }

  return result;
}

id sub_100011FBC(void *a1, void *a2)
{
  id v3 = a1;
  unint64_t v60 = a2;
  id v4 = sub_1000199EC();
  unsigned int v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Getting processing hangs", buf, 2u);
  }

  if (v60) {
    uint64_t v6 = v60;
  }
  else {
    uint64_t v6 = @"/var/root/Library/Caches/hangtracerd/spool";
  }
  uint64_t v7 = objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:isDirectory:](&OBJC_CLASS___NSURL, "fileURLWithPath:isDirectory:", v6, 1LL));
  int v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  id v77 = 0LL;
  id v58 = (void *)v7;
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( [v8 contentsOfDirectoryAtURL:v7 includingPropertiesForKeys:0 options:0 error:&v77]);
  id v57 = v77;

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 sortedArrayUsingComparator:&stru_100071588]);
  unsigned int v59 = v3;
  if (v3) {
    xpc_object_t reply = xpc_dictionary_create_reply(v3);
  }
  else {
    xpc_object_t reply = xpc_dictionary_create_empty();
  }
  xpc_object_t xdict = reply;
  xpc_object_t xarray = xpc_array_create_empty();
  __int128 v73 = 0u;
  __int128 v74 = 0u;
  __int128 v75 = 0u;
  __int128 v76 = 0u;
  id obj = v10;
  id v12 = [obj countByEnumeratingWithState:&v73 objects:v89 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v74;
    uint64_t v61 = *(void *)v74;
    do
    {
      uint64_t v15 = 0LL;
      id v62 = v13;
      do
      {
        if (*(void *)v74 != v14) {
          objc_enumerationMutation(obj);
        }
        __int16 v16 = *(void **)(*((void *)&v73 + 1) + 8LL * (void)v15);
        uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v16 lastPathComponent]);
        unsigned int v18 = [v17 hasSuffix:@"tailspin"];

        if (v18)
        {
          id v19 = objc_claimAutoreleasedReturnValue([v16 path]);
          __int16 v20 = sub_1000119D8((char *)[v19 UTF8String], 0);
          uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(v20);

          if (v21)
          {
            id v64 = v21;
            id v65 = v15;
            __int128 v71 = 0u;
            __int128 v72 = 0u;
            __int128 v69 = 0u;
            __int128 v70 = 0u;
            id v68 = v21;
            id v22 = [v68 countByEnumeratingWithState:&v69 objects:v88 count:16];
            if (v22)
            {
              id v23 = v22;
              uint64_t v24 = *(void *)v70;
              uint64_t v67 = *(void *)v70;
              do
              {
                for (i = 0LL; i != v23; i = (char *)i + 1)
                {
                  if (*(void *)v70 != v24) {
                    objc_enumerationMutation(v68);
                  }
                  __int128 v26 = *(void **)(*((void *)&v69 + 1) + 8LL * (void)i);
                  xpc_object_t empty = xpc_dictionary_create_empty();
                  id v28 = (void *)objc_claimAutoreleasedReturnValue([v26 objectForKeyedSubscript:@"HangNotificationUUID"]);

                  if (v28)
                  {
                    id v29 = (void *)objc_claimAutoreleasedReturnValue([v26 objectForKeyedSubscript:@"HangNotificationUUID"]);
                    id v30 = (const char *)[@"hangtracer.hangid" UTF8String];
                    id v31 = v29;
                    xpc_dictionary_set_string(empty, v30, (const char *)[v31 UTF8String]);
                    uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue([v26 objectForKeyedSubscript:@"ProcessPath"]);

                    if (v32)
                    {
                      unint64_t v33 = (void *)objc_claimAutoreleasedReturnValue([v26 objectForKeyedSubscript:@"ProcessPath"]);
                      id v34 = (const char *)[@"hangtracer.process_path" UTF8String];
                      id v35 = v33;
                      xpc_dictionary_set_string(empty, v34, (const char *)[v35 UTF8String]);
                      uint64_t v36 = sub_100002570(v35);
                      id v37 = (void *)objc_claimAutoreleasedReturnValue(v36);
                      uint64_t v38 = (const char *)[@"hangtracer.bundle_id" UTF8String];
                      id v39 = v37;
                      xpc_dictionary_set_string(empty, v38, (const char *)[v39 UTF8String]);
                      id v40 = (id)objc_claimAutoreleasedReturnValue([v26 objectForKeyedSubscript:@"StartTime"]);
                      if (v40)
                      {
                        id v41 = (void *)objc_claimAutoreleasedReturnValue([v26 objectForKeyedSubscript:@"EndTime"]);

                        if (v41)
                        {
                          id v42 = (void *)objc_claimAutoreleasedReturnValue([v26 objectForKeyedSubscript:@"StartTime"]);
                          unsigned int v43 = [v42 unsignedLongLongValue];

                          __int16 v44 = (void *)objc_claimAutoreleasedReturnValue([v26 objectForKeyedSubscript:@"EndTime"]);
                          id v45 = [v44 unsignedLongLongValue];

                          unsigned int v46 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%.0f",  sub_100002FAC(v45 - v43));
                          id v47 = (void *)objc_claimAutoreleasedReturnValue(v46);
                          id v48 = (const char *)[@"hangtracer.duration" UTF8String];
                          id v40 = v47;
                          xpc_dictionary_set_string(empty, v48, (const char *)[v40 UTF8String]);
                        }

                        else
                        {
                          id v40 = 0LL;
                        }
                      }

                      unsigned int v49 = (void *)objc_claimAutoreleasedReturnValue([v26 objectForKeyedSubscript:@"CreatedAt"]);

                      if (v49)
                      {
                        BOOL v50 = (void *)objc_claimAutoreleasedReturnValue([v26 objectForKeyedSubscript:@"CreatedAt"]);
                        id v51 = (const char *)[@"hangtracer.created_at" UTF8String];
                        id v52 = v50;
                        xpc_dictionary_set_string(empty, v51, (const char *)[v52 UTF8String]);
                      }

                      else
                      {
                        id v52 = 0LL;
                      }

                      id v53 = sub_1000199EC();
                      id v54 = (os_log_s *)objc_claimAutoreleasedReturnValue(v53);
                      if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
                      {
                        *(_DWORD *)buf = 138413314;
                        id v79 = v35;
                        __int16 v80 = 2112;
                        id v81 = v39;
                        __int16 v82 = 2112;
                        id v83 = v31;
                        __int16 v84 = 2112;
                        id v85 = v40;
                        __int16 v86 = 2112;
                        id v87 = v52;
                        _os_log_impl( (void *)&_mh_execute_header,  v54,  OS_LOG_TYPE_DEFAULT,  "createProcessingHangsReply: adding hang info - processPath %@, bundleID %@, hangUUID %@, durat ion %@, createdAt %@",  buf,  0x34u);
                      }

                      xpc_array_append_value(xarray, empty);
                      uint64_t v24 = v67;
                    }
                  }

                  else
                  {
                    id v31 = 0LL;
                  }
                }

                id v23 = [v68 countByEnumeratingWithState:&v69 objects:v88 count:16];
              }

              while (v23);
            }

            uint64_t v14 = v61;
            id v13 = v62;
            uint64_t v21 = v64;
            uint64_t v15 = v65;
          }
        }

        uint64_t v15 = (char *)v15 + 1;
      }

      while (v15 != v13);
      id v13 = [obj countByEnumeratingWithState:&v73 objects:v89 count:16];
    }

    while (v13);
  }

  xpc_dictionary_set_value(xdict, off_10007BB60, xarray);
  return xdict;
}

void sub_10001267C()
{
  id v0 = sub_1000199EC();
  uint64_t v1 = (os_log_s *)objc_claimAutoreleasedReturnValue(v0);
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)unsigned int v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEFAULT, "Starting hangreporter service", v5, 2u);
  }

  if (qword_10007C138) {
    sub_1000344F0();
  }
  if (qword_10007C148 != -1) {
    dispatch_once(&qword_10007C148, &stru_1000715A8);
  }
  uint64_t v2 = (dispatch_queue_s *)(id)qword_10007C140;
  xpc_connection_t mach_service = xpc_connection_create_mach_service("com.apple.hangreporter", v2, 1uLL);
  id v4 = (void *)qword_10007C138;
  qword_10007C138 = (uint64_t)mach_service;

  xpc_connection_set_event_handler((xpc_connection_t)qword_10007C138, &stru_1000714D0);
  xpc_connection_resume((xpc_connection_t)qword_10007C138);
}

void sub_100012764(id a1, OS_xpc_object *a2)
{
  uint64_t v2 = a2;
  xpc_type_t type = xpc_get_type(v2);
  if (type == (xpc_type_t)&_xpc_type_connection)
  {
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472LL;
    handler[2] = sub_100012928;
    handler[3] = &unk_1000714F8;
    id v13 = v2;
    id v25 = v13;
    xpc_connection_set_event_handler(v13, handler);
    xpc_connection_resume(v13);
  }

  else
  {
    if (type == (xpc_type_t)&_xpc_type_rich_error)
    {
      id v4 = xpc_rich_error_copy_description(v2);
      id v14 = sub_1000199EC();
      uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
        sub_100034518((uint64_t)v4, v6, v15, v16, v17, v18, v19, v20);
      }
    }

    else
    {
      id v4 = xpc_copy_description(v2);
      id v5 = sub_1000199EC();
      uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
        sub_10003457C((uint64_t)v4, v6, v7, v8, v9, v10, v11, v12);
      }
    }

    free(v4);
    if (v2 == (OS_xpc_object *)&_xpc_error_connection_invalid)
    {
      uint64_t v21 = (void *)xpc_connection_copy_invalidation_reason(qword_10007C138);
      id v22 = sub_1000199EC();
      id v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        __int128 v27 = v21;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "invalidation reason: %s", buf, 0xCu);
      }

      free(v21);
    }
  }
}

void sub_100012928(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (xpc_get_type(v3) == (xpc_type_t)&_xpc_type_dictionary)
  {
    uint64_t v7 = (_xpc_connection_s *)*(id *)(a1 + 32);
    id v8 = v3;
    string = xpc_dictionary_get_string(v8, off_10007BB58);
    if (string && !strcmp(string, off_10007BB68))
    {
      id v19 = sub_100011FBC(v8, 0LL);
      uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
      if (v20)
      {
        uint64_t v21 = v20;
        xpc_connection_send_message(v7, v20);
      }
    }

    else
    {
      uint64_t v10 = xpc_copy_description(v8);
      id v11 = sub_1000199EC();
      uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
        sub_1000345E0((uint64_t)v10, v12, v13, v14, v15, v16, v17, v18);
      }

      free(v10);
    }
  }

  else
  {
    id v4 = xpc_copy_description(v3);
    id v5 = sub_1000199EC();
    uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      int v22 = 136315138;
      id v23 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_INFO,  "Encountered non-dictionary event: %s",  (uint8_t *)&v22,  0xCu);
    }

    free(v4);
  }
}

void sub_100012AC0()
{
  id v0 = (id)objc_claimAutoreleasedReturnValue( +[NSDistributedNotificationCenter defaultCenter]( &OBJC_CLASS___NSDistributedNotificationCenter,  "defaultCenter"));
  [v0 postNotificationName:@"com.apple.hangreporter.didSaveTailspin" object:0];
}

id sub_100012B04(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"EndTime"]);
  id v6 = [v5 unsignedLongLongValue];

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"HangType"]);
  unsigned int v8 = [v7 intValue];

  if ((v8 | 8) == 0xA)
  {
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"PID"]);
    unsigned int v10 = [v9 unsignedIntValue];

    id v11 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"StartTime"]);
    id v12 = [v11 unsignedLongLongValue];

    id v13 = v3;
    uint64_t v14 = ktrace_file_open([v13 UTF8String], 0);
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v48 = 0LL;
      if (ktrace_file_latest_timestamp(v14, &v48))
      {
        id v16 = sub_1000199EC();
        uint64_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
        if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT)) {
          sub_100034800();
        }

        ktrace_file_close(v15);
      }

      else
      {
        unint64_t v47 = 0LL;
        if (ktrace_file_earliest_timestamp(v15, &v47))
        {
          id v20 = sub_1000199EC();
          uint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
          if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT)) {
            sub_1000347A0();
          }

          ktrace_file_close(v15);
        }

        else if (v47 >= (unint64_t)v6)
        {
          id v25 = sub_1000199EC();
          __int128 v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
          if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 134218240;
            *(void *)&uint8_t buf[4] = v6;
            *(_WORD *)&_BYTE buf[12] = 2048;
            *(void *)&buf[14] = v47;
            _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_INFO,  "Hang ending at %llu does not overlap tailspin data starting at %llu, using hang completion time",  buf,  0x16u);
          }

          ktrace_file_close(v15);
        }

        else
        {
          uint64_t v22 = ktrace_session_create();
          ktrace_session_set_event_names_enabled(v22, 0LL);
          ktrace_set_execnames_enabled(v22, 0LL);
          ktrace_set_uuid_map_enabled(v22, 0LL);
          ktrace_set_walltimes_enabled(v22, 0LL);
          ktrace_set_vnode_paths_enabled(v22, 0LL);
          ktrace_set_thread_groups_enabled(v22, 0LL);
          ktrace_set_thread_cputime_enabled(v22, 0LL);
          ktrace_set_jetsam_coalitions_enabled(v22, 0LL);
          ktrace_set_coprocessor_tracing_enabled(v22, 0LL);
          ktrace_set_remotetime_conversion_enabled(v22, 0LL);
          ktrace_session_set_event_names_enabled(v22, 0LL);
          if (ktrace_set_ktrace_file(v22, v15, 1LL))
          {
            id v23 = sub_1000199EC();
            uint64_t v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
            if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT)) {
              sub_100034740();
            }

            ktrace_file_close(v15);
            ktrace_session_destroy(v22);
          }

          else
          {
            *(void *)buf = 0LL;
            *(void *)&uint8_t buf[8] = buf;
            *(void *)&buf[16] = 0x2020000000LL;
            uint64_t v56 = 0LL;
            v45[0] = _NSConcreteStackBlock;
            v45[1] = 3221225472LL;
            v45[2] = sub_100013134;
            v45[3] = &unk_100071520;
            unsigned int v46 = v10;
            v45[6] = v6;
            v45[7] = v12;
            v45[4] = buf;
            v45[5] = v22;
            ktrace_events_single(v22, 606208004LL, v45);
            v43[0] = _NSConcreteStackBlock;
            v43[1] = 3221225472LL;
            v43[2] = sub_1000132E4;
            v43[3] = &unk_100071548;
            __int128 v27 = dispatch_semaphore_create(0LL);
            __int16 v44 = v27;
            ktrace_set_completion_handler(v22, v43);
            dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
            id v29 = (void *)objc_claimAutoreleasedReturnValue(global_queue);
            int v30 = ktrace_start(v22, v29);

            if (v30)
            {
              id v31 = sub_1000199EC();
              uint64_t v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
              if (os_log_type_enabled(v32, OS_LOG_TYPE_FAULT)) {
                sub_1000346E0();
              }

              ktrace_session_destroy(v22);
            }

            else
            {
              dispatch_time_t v33 = dispatch_time(0LL, 100000000000LL);
              if (dispatch_semaphore_wait(v27, v33))
              {
                id v34 = sub_1000199EC();
                id v35 = (os_log_s *)objc_claimAutoreleasedReturnValue(v34);
                if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
                {
                  *(_WORD *)unsigned int v49 = 0;
                  _os_log_impl( (void *)&_mh_execute_header,  v35,  OS_LOG_TYPE_DEFAULT,  "timed out waiting for ktrace determing end of timeout hang",  v49,  2u);
                }

                ktrace_end(v22, 0LL);
              }

              ktrace_session_destroy(v22);
              if (*(void *)(*(void *)&buf[8] + 24LL))
              {
                id v36 = sub_1000199EC();
                id v37 = (os_log_s *)objc_claimAutoreleasedReturnValue(v36);
                if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
                {
                  uint64_t v38 = *(void *)(*(void *)&buf[8] + 24LL);
                  *(_DWORD *)unsigned int v49 = 134218496;
                  id v50 = v6;
                  __int16 v51 = 2048;
                  uint64_t v52 = v48;
                  __int16 v53 = 2048;
                  uint64_t v54 = v38;
                  _os_log_impl( (void *)&_mh_execute_header,  v37,  OS_LOG_TYPE_INFO,  "Hang timed out at %llu completed before tailspin was saved at %llu, using hang completion time %llu",  v49,  0x20u);
                }

                id v39 = (id *)(*(void *)&buf[8] + 24LL);
              }

              else
              {
                id v40 = sub_1000199EC();
                id v41 = (os_log_s *)objc_claimAutoreleasedReturnValue(v40);
                if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)unsigned int v49 = 134218240;
                  id v50 = v6;
                  __int16 v51 = 2048;
                  uint64_t v52 = v48;
                  _os_log_impl( (void *)&_mh_execute_header,  v41,  OS_LOG_TYPE_INFO,  "Hang timed out at %llu did not complete before tailspin was saved at %llu, using tailspin end time",  v49,  0x16u);
                }

                id v39 = (id *)&v48;
              }

              id v6 = *v39;
            }

            _Block_object_dispose(buf, 8);
          }
        }
      }
    }

    else
    {
      id v18 = sub_1000199EC();
      id v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT)) {
        sub_100034644((uint64_t)v13, v19);
      }
    }
  }

  return v6;
}

void sub_1000130FC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, char a29)
{
}

void sub_100013134(uint64_t a1, uint64_t a2)
{
  int pid_for_thread = *(_DWORD *)(a2 + 88);
  if (pid_for_thread == -1) {
    int pid_for_thread = ktrace_get_pid_for_thread(*(void *)(a1 + 40), *(void *)(a2 + 40));
  }
  if (pid_for_thread == *(_DWORD *)(a1 + 64))
  {
    unint64_t v5 = *(void *)(a2 + 8);
    if (v5 < *(void *)(a1 + 48))
    {
      unint64_t v6 = *(void *)(a2 + 16);
      unint64_t v7 = *(void *)(a1 + 56);
      if (v6 > v7)
      {
        if (v5 == v7)
        {
          uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8LL);
          if (!*(void *)(v8 + 24))
          {
            *(void *)(v8 + 24) = v6;
            return;
          }

          id v9 = sub_1000199EC();
          unsigned int v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
          if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
          {
            unint64_t v11 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
            uint64_t v13 = *(void *)(a1 + 48);
            unint64_t v12 = *(void *)(a1 + 56);
            int v17 = 134218752;
            unint64_t v18 = v12;
            __int16 v19 = 2048;
            unint64_t v20 = v11;
            __int16 v21 = 2048;
            unint64_t v22 = v6;
            __int16 v23 = 2048;
            uint64_t v24 = v13;
            _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_INFO,  "Two overlapping hangs: start:%llu end1:%llu end2:%llu metadataEnd:%llu",  (uint8_t *)&v17,  0x2Au);
          }
        }

        else
        {
          id v14 = sub_1000199EC();
          unsigned int v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
          if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
          {
            uint64_t v16 = *(void *)(a1 + 48);
            unint64_t v15 = *(void *)(a1 + 56);
            int v17 = 134218752;
            unint64_t v18 = v5;
            __int16 v19 = 2048;
            unint64_t v20 = v6;
            __int16 v21 = 2048;
            unint64_t v22 = v15;
            __int16 v23 = 2048;
            uint64_t v24 = v16;
            _os_log_fault_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_FAULT,  "Overlapping hang has mismatched start time: event:%llu-%llu vs metadata:%llu-%llu",  (uint8_t *)&v17,  0x2Au);
          }
        }
      }
    }
  }

uint64_t sub_1000132E4(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

int64_t sub_1000132EC(id a1, NSURL *a2, NSURL *a3)
{
  id v4 = a3;
  unint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL lastPathComponent](a2, "lastPathComponent"));
  unint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL lastPathComponent](v4, "lastPathComponent"));

  id v7 = [v5 compare:v6];
  return (int64_t)v7;
}

void sub_100013358(id a1)
{
  dispatch_queue_attr_t v1 = dispatch_queue_attr_make_with_qos_class(0LL, QOS_CLASS_USER_INITIATED, 0);
  id v4 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v1);
  dispatch_queue_t v2 = dispatch_queue_create("com.apple.hangreporter.service", v4);
  id v3 = (void *)qword_10007C140;
  qword_10007C140 = (uint64_t)v2;
}

void sub_1000133AC(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
}

  ;
}

void sub_1000133D8( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

CFDictionaryRef sub_1000133E8()
{
  return ASP_GetIndirectionTableStatistics();
}

id sub_1000133FC()
{
  vm_size_t v0 = vm_page_size;
  size_t v1 = 40 * vm_page_size;
  uint64_t v8 = 40 * vm_page_size;
  dispatch_queue_t v2 = (char *)valloc(40 * vm_page_size);
  if (!v2)
  {
    size_t v1 = 4 * v0;
    uint64_t v8 = 4 * v0;
    dispatch_queue_t v2 = (char *)valloc(4 * v0);
    if (!v2) {
      return 0LL;
    }
  }

  id v3 = v2;
  uint64_t snapshot = nand_get_snapshot(0LL, v2, v1, (size_t *)&v8);
  if ((_DWORD)snapshot)
  {
    NSLog(@"Failed to get snapshot buffer, status 0x%x\n", snapshot);
    unint64_t v5 = 0LL;
  }

  else
  {
    id v9 = @"NANDSnapshot";
    unint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v3,  1LL));
    unsigned int v10 = v6;
    unint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v10,  &v9,  1LL));
  }

  free(v3);
  return v5;
}

__CFString *sub_100013990(unsigned int a1)
{
  if (a1 >= 0x2A) {
    return (__CFString *)(id)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%d",  a1));
  }
  else {
    return *(&off_1000715C8 + (char)a1);
  }
}

__CFString *sub_1000139E8(uint64_t a1)
{
  if ((a1 - 1) >= 0x1F) {
    return (__CFString *)(id)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"SIG%d",  a1));
  }
  else {
    return *(&off_100071718 + (int)a1 - 1);
  }
}

__CFString *sub_100013A3C(uint64_t a1)
{
  if (a1 >= 0x10) {
    return (__CFString *)(id)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%d",  a1));
  }
  else {
    return *(&off_100071810 + (int)a1);
  }
}

__CFString *sub_100013A8C(uint64_t a1)
{
  if (a1 > 3221229822LL)
  {
    if (a1 <= 3306925314LL)
    {
      switch(a1)
      {
        case 3221229823LL:
          return @"thermal pressure";
        case 3306925313LL:
          return @"cpu violation";
        case 3306925314LL:
          return @"walltime violation";
      }
    }

    else if (a1 > 3735943696LL)
    {
      if (a1 == 3735943697LL) {
        return @"user quit";
      }
      if (a1 == 4227595259LL) {
        return @"force quit";
      }
    }

    else
    {
      if (a1 == 3306925315LL) {
        return @"system busy";
      }
      if (a1 == 3735883980LL) {
        return @"resource exclusion";
      }
    }

    goto LABEL_36;
  }

  if (a1 <= 1539435072)
  {
    switch(a1)
    {
      case 95805101LL:
        return @"application assertion";
      case 439025681LL:
        return @"input ui scene";
      case 732775916LL:
        return @"secure draw violation";
    }

    goto LABEL_36;
  }

  if (a1 > 1539435076)
  {
    if (a1 == 1539435077) {
      return @"legacy clear the board";
    }
    if (a1 == 2343432205LL) {
      return @"watchdog";
    }
    goto LABEL_36;
  }

  if (a1 == 1539435073) {
    return @"languages changed";
  }
  if (a1 != 1539435076)
  {
LABEL_36:
    size_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%#llx", a1));
    return v1;
  }

  size_t v1 = @"clear the board";
  return v1;
}

__CFString *sub_100013C98(uint64_t a1)
{
  if ((a1 - 1) >= 4) {
    return (__CFString *)(id)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%d",  a1));
  }
  else {
    return *(&off_100071890 + (int)a1 - 1);
  }
}

__CFString *sub_100013CEC(uint64_t a1)
{
  if ((a1 - 1) >= 0x13) {
    return (__CFString *)(id)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%d",  a1));
  }
  else {
    return *(&off_1000718B0 + (int)a1 - 1);
  }
}

__CFString *sub_100013D40(uint64_t a1)
{
  if ((a1 - 1) >= 5) {
    return (__CFString *)(id)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%d",  a1));
  }
  else {
    return *(&off_100071948 + (int)a1 - 1);
  }
}

__CFString *sub_100013D94(uint64_t a1)
{
  if ((a1 - 1) >= 9) {
    return (__CFString *)(id)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%u",  a1));
  }
  else {
    return *(&off_100071970 + (int)a1 - 1);
  }
}

id sub_100013DE8(uint64_t a1)
{
  uint64_t v1 = a1 - 1;
  else {
    dispatch_queue_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%llu", a1));
  }
  return v2;
}

__CFString *sub_100013E48(uint64_t a1)
{
  if (a1 <= 2343432204LL)
  {
    if (a1 <= 562215633)
    {
      if (a1)
      {
        if (a1 == 97132013)
        {
          return @"conditions changed";
        }

        else
        {
          if (a1 != 562215597) {
            goto LABEL_37;
          }
          return @"assertion timeout";
        }
      }

      else
      {
        return @"none";
      }
    }

    else if (a1 > 562215635)
    {
      if (a1 == 562215636)
      {
        return @"background fetch completion timeout";
      }

      else
      {
        if (a1 != 732775916) {
          goto LABEL_37;
        }
        return @"security violation";
      }
    }

    else if (a1 == 562215634)
    {
      return @"background task assertion timeout";
    }

    else
    {
      return @"background url session completion timeout";
    }
  }

  else if (a1 > 3490524076LL)
  {
    if (a1 > 3735905537LL)
    {
      if (a1 == 3735905538LL)
      {
        return @"termination assertion";
      }

      else
      {
        if (a1 != 3735943697LL) {
          goto LABEL_37;
        }
        return @"user initiated quit";
      }
    }

    else if (a1 == 3490524077LL)
    {
      return @"max assertions violation";
    }

    else
    {
      if (a1 != 3735883980LL) {
        goto LABEL_37;
      }
      return @"resource exclusion";
    }
  }

  else if (a1 > 2970726672LL)
  {
    if (a1 == 2970726673LL)
    {
      return @"process exited";
    }

    else
    {
      if (a1 != 3221229823LL) {
        goto LABEL_37;
      }
      return @"thermal pressure";
    }
  }

  else
  {
    if (a1 != 2343432205LL)
    {
      if (a1 == 2970405393LL)
      {
        uint64_t v1 = @"max states violation";
        return v1;
      }

LABEL_37:
      uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%#llx",  a1));
      return v1;
    }

    return @"watchdog violation";
  }

__CFString *sub_100014078(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) >= 5) {
    return (__CFString *)(id)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%llu",  a1));
  }
  else {
    return *(&off_100071A00 + a1 - 1);
  }
}

id sub_1000140CC(uint64_t a1)
{
  uint64_t v1 = a1 - 1;
  if ((unint64_t)(a1 - 1) < 5 && ((0x1Du >> v1) & 1) != 0)
  {
    id v4 = *(&off_100071A28 + v1);
  }

  else
  {
    dispatch_queue_t v2 = sub_100014078(a1);
    id v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
    id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 capitalizedString]);
  }

  return v4;
}

__CFString *sub_10001412C(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) >= 3) {
    return (__CFString *)(id)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%llu",  a1));
  }
  else {
    return *(&off_100071A50 + a1 - 1);
  }
}

__CFString *sub_100014180(uint64_t a1)
{
  switch(a1)
  {
    case 1LL:
      return @"service timeout";
    case 1001LL:
      return @"chronokit";
    case 2LL:
      uint64_t v1 = @"timeout no diags";
      break;
    default:
      uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%llu", a1));
      break;
  }

  return v1;
}

__CFString *sub_1000141F4(uint64_t a1)
{
  if (a1 == 1) {
    return @"api violation";
  }
  if (a1 == 2) {
    uint64_t v1 = @"internal error";
  }
  else {
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%llu", a1));
  }
  return v1;
}

id sub_100014254(uint64_t a1)
{
  uint64_t v1 = a1 - 1;
  else {
    dispatch_queue_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%llu", a1));
  }
  return v2;
}

id sub_1000142B8(int a1, uint64_t a2)
{
  switch(a1)
  {
    case 1:
      dispatch_queue_t v2 = sub_100013A3C(a2);
      id v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
      break;
    case 2:
      id v4 = sub_1000139E8(a2);
      id v3 = (void *)objc_claimAutoreleasedReturnValue(v4);
      break;
    case 3:
      unint64_t v5 = sub_100013C98(a2);
      id v3 = (void *)objc_claimAutoreleasedReturnValue(v5);
      break;
    case 6:
      id v6 = sub_100013DE8(a2);
      id v3 = (void *)objc_claimAutoreleasedReturnValue(v6);
      break;
    case 7:
      id v7 = sub_100013D94(a2);
      id v3 = (void *)objc_claimAutoreleasedReturnValue(v7);
      break;
    case 9:
      uint64_t v8 = sub_100013CEC(a2);
      id v3 = (void *)objc_claimAutoreleasedReturnValue(v8);
      break;
    case 10:
      id v9 = sub_100013A8C(a2);
      id v3 = (void *)objc_claimAutoreleasedReturnValue(v9);
      break;
    case 15:
      unsigned int v10 = sub_100013E48(a2);
      id v3 = (void *)objc_claimAutoreleasedReturnValue(v10);
      break;
    case 18:
      id v11 = sub_1000140CC(a2);
      id v3 = (void *)objc_claimAutoreleasedReturnValue(v11);
      break;
    case 20:
      unint64_t v12 = sub_100014180(a2);
      id v3 = (void *)objc_claimAutoreleasedReturnValue(v12);
      break;
    case 22:
      uint64_t v13 = sub_1000141F4(a2);
      id v3 = (void *)objc_claimAutoreleasedReturnValue(v13);
      break;
    case 23:
      id v14 = sub_100013D40(a2);
      id v3 = (void *)objc_claimAutoreleasedReturnValue(v14);
      break;
    case 27:
      unint64_t v15 = sub_10001412C(a2);
      id v3 = (void *)objc_claimAutoreleasedReturnValue(v15);
      break;
    case 32:
      id v16 = sub_100014254(a2);
      id v3 = (void *)objc_claimAutoreleasedReturnValue(v16);
      break;
    default:
      id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%llu", a2));
      break;
  }

  return v3;
}

void sub_100014430(id a1)
{
  v3[0] = @"HTProfile";
  v3[1] = @"HTEPL";
  v3[2] = @"HTThirdPartyDevSupport";
  v3[3] = @"PLTasking";
  void v3[4] = &stru_100071CD0;
  v3[5] = @"PDSEHangTracer";
  v3[6] = @"PDSEHTThirdParty";
  v3[7] = @"PDSEWorkflowResponsiveness";
  v3[8] = @"PDSEHTRateOnly";
  v3[9] = @"PDSESentry";
  v3[10] = @"PDSEAppLaunch";
  uint64_t v1 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v3, 11LL));
  dispatch_queue_t v2 = (void *)qword_10007C158;
  qword_10007C158 = v1;
}

void sub_100016218(id a1)
{
  uint64_t v1 = objc_alloc_init(&OBJC_CLASS___HTPrefs);
  dispatch_queue_t v2 = (void *)qword_10007C160;
  qword_10007C160 = (uint64_t)v1;
}

void sub_10001812C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, char a25, uint64_t a26, uint64_t a27, uint64_t a28, char a29, uint64_t a30, uint64_t a31, uint64_t a32, char a33)
{
}

void sub_100018190(uint64_t a1, int a2)
{
  if (*(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) == a2)
  {
    id v3 = sub_1000199EC();
    id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      unint64_t v5 = "HTPrefs: Tasking Changed";
LABEL_16:
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, v5, buf, 2u);
    }
  }

  else if (*(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) == a2)
  {
    id v6 = sub_1000199EC();
    id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      unint64_t v5 = "HTPrefs: Telemetry Changed";
      goto LABEL_16;
    }
  }

  else if (*(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL) == a2)
  {
    id v7 = sub_1000199EC();
    id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      unint64_t v5 = "HTPrefs: Profile List Changed";
      goto LABEL_16;
    }
  }

  else if (*(_DWORD *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 24LL) == a2)
  {
    id v8 = sub_1000199EC();
    id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      unint64_t v5 = "HTPrefs: EPL State Changed";
      goto LABEL_16;
    }
  }

  else
  {
    if (*(_DWORD *)(*(void *)(*(void *)(a1 + 72) + 8LL) + 24LL) != a2) {
      goto LABEL_18;
    }
    id v9 = sub_1000199EC();
    id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      unint64_t v5 = "HTPrefs: HT Self-Enablement State Changed Triggered Refresh";
      goto LABEL_16;
    }
  }

LABEL_18:
  unsigned int v10 = (id *)(a1 + 80);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 80));
  unsigned int v12 = [WeakRetained hangtracerDaemonEnabled];

  [*(id *)(a1 + 32) refreshHTPrefs];
  id v13 = objc_loadWeakRetained((id *)(a1 + 80));
  LODWORD(WeakRetained) = [v13 hangtracerDaemonEnabled];

  if (v12 != (_DWORD)WeakRetained)
  {
    id v14 = sub_1000199EC();
    unint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      if (v12) {
        id v16 = @"ON";
      }
      else {
        id v16 = @"OFF";
      }
      id v17 = objc_loadWeakRetained(v10);
      else {
        unint64_t v18 = @"OFF";
      }
      *(_DWORD *)buf = 138412546;
      __int128 v27 = v16;
      __int16 v28 = 2112;
      id v29 = v18;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_INFO,  "HTPrefs: HangTracer Enabled State Changed: %@ -> %@",  buf,  0x16u);
    }

    id v19 = objc_loadWeakRetained(v10);
    unint64_t v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  objc_msgSend(v19, "hangtracerDaemonEnabled", @"Enabled")));
    id v25 = v20;
    __int16 v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v25,  &v24,  1LL));

    unint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    id v23 = objc_loadWeakRetained(v10);
    [v22 postNotificationName:@"com.apple.hangtracer.daemonstate" object:v23 userInfo:v21];
  }

void sub_1000184E0(uint64_t a1, int a2)
{
  if (*(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) == a2)
  {
    id v2 = sub_1000199EC();
    id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v4 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "HTPrefs: Test Reset Log Limits", v4, 2u);
    }
  }

void sub_100018F28(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
}

  ;
}

  ;
}

BOOL sub_100018F58(void *a1, void *a2, float *a3, void *a4)
{
  id v7 = a4;
  id v8 = a2;
  id v9 = a1;
  unsigned int v10 = (void *)objc_opt_new(&OBJC_CLASS___SignpostSupportObjectExtractor);
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472LL;
  v22[2] = sub_100019218;
  v22[3] = &unk_100071BA8;
  id v11 = v7;
  id v23 = v11;
  [v10 setIntervalCompletionProcessingBlock:v22];
  unsigned int v12 = (void *)objc_opt_new(&OBJC_CLASS___SignpostSupportSubsystemCategoryAllowlist);
  [v12 addSubsystem:@"com.apple.hangtracer" category:@"always_on_hang"];
  [v10 setSubsystemCategoryFilter:v12];
  memset(&v20, 0, sizeof(v20));
  memset(&v21, 0, sizeof(v21));
  getrusage(0, &v21);
  id v19 = 0LL;
  [v10 processLogArchiveWithPath:0 startDate:v9 endDate:v8 errorOut:&v19];

  id v13 = v19;
  getrusage(0, &v20);
  if (a3)
  {
    float v14 = (float)((float)((float)v20.ru_stime.tv_usec / 1000000.0) + (float)v20.ru_stime.tv_sec)
        - (float)((float)((float)v21.ru_stime.tv_usec / 1000000.0) + (float)v21.ru_stime.tv_sec)
    *a3 = v14;
  }

  if (v13)
  {
    id v15 = sub_1000199EC();
    id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      id v17 = (void *)objc_claimAutoreleasedReturnValue([v13 localizedDescription]);
      *(_DWORD *)buf = 136315394;
      id v25 = "enumerateHangIntervalsInTimeRange";
      __int16 v26 = 2112;
      __int128 v27 = v17;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%s completed with error: %@\n", buf, 0x16u);
    }
  }

  return v13 == 0LL;
}

uint64_t sub_100019218(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

id sub_100019224(void *a1, void *a2, float *a3)
{
  id v5 = a2;
  id v6 = a1;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_100019300;
  v10[3] = &unk_100071BD0;
  id v7 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  id v11 = v7;
  LODWORD(a3) = sub_100018F58(v6, v5, a3, v10);

  if ((_DWORD)a3) {
    id v8 = -[NSMutableArray copy](v7, "copy");
  }
  else {
    id v8 = &__NSArray0__struct;
  }

  return v8;
}

uint64_t sub_100019300(uint64_t a1, uint64_t a2)
{
  return 1LL;
}

id sub_100019320(uint64_t a1, uint64_t a2)
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
  [v4 timeIntervalSinceReferenceDate];
  double v6 = sub_100003060((unint64_t)(v5 * 1000.0));
  uint64_t v7 = mach_absolute_time();
  id v8 = +[NSDate dateWithTimeIntervalSinceReferenceDate:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceReferenceDate:",  sub_100003000((unint64_t)(v6 - (double)v7) + a1));
  uint64_t v9 = objc_claimAutoreleasedReturnValue(v8);
  double v10 = sub_100003000(a2 - a1);
  id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeInterval:sinceDate:]( &OBJC_CLASS___NSDate,  "dateWithTimeInterval:sinceDate:",  v9,  -5.0));
  unint64_t v60 = (void *)v9;
  unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeInterval:sinceDate:]( &OBJC_CLASS___NSDate,  "dateWithTimeInterval:sinceDate:",  v9,  v10 + 5.0));
  uint64_t v54 = v4;
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 earlierDate:v4]);

  float v66 = 0.0;
  id v55 = v13;
  uint64_t v56 = v11;
  id v14 = sub_100019224(v11, v13, &v66);
  id v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  uint64_t v61 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  __int128 v62 = 0u;
  __int128 v63 = 0u;
  __int128 v64 = 0u;
  __int128 v65 = 0u;
  id v16 = v15;
  id v59 = [v16 countByEnumeratingWithState:&v62 objects:v81 count:16];
  if (v59)
  {
    uint64_t v58 = *(void *)v63;
    id obj = v16;
    float v17 = 0.0;
    while (2)
    {
      for (i = 0LL; i != v59; i = (char *)i + 1)
      {
        if (*(void *)v63 != v58) {
          objc_enumerationMutation(obj);
        }
        id v19 = *(void **)(*((void *)&v62 + 1) + 8LL * (void)i);
        rusage v20 = (void *)objc_claimAutoreleasedReturnValue([v19 beginDate]);
        [v20 timeIntervalSinceReferenceDate];
        double v22 = v21;
        [v60 timeIntervalSinceReferenceDate];
        double v24 = v22 - v23;

        v79[0] = @"startTime";
        id v25 = (void *)objc_claimAutoreleasedReturnValue([v19 beginWallTimeStringWithTimeZoneName:0]);
        v80[0] = v25;
        v79[1] = @"durationMS";
        [v19 durationSeconds];
        __int128 v27 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%.02f",  (float)(v26 * 1000.0)));
        v80[1] = v27;
        v79[2] = @"processName";
        __int16 v28 = (void *)objc_claimAutoreleasedReturnValue([v19 beginEvent]);
        uint64_t v29 = objc_claimAutoreleasedReturnValue([v28 processName]);
        int v30 = (void *)v29;
        id v31 = @"Unknown";
        if (v29) {
          id v31 = (const __CFString *)v29;
        }
        v80[2] = v31;
        v79[3] = @"processID";
        uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue([v19 beginEvent]);
        dispatch_time_t v33 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInt:]( NSNumber,  "numberWithInt:",  [v32 processID]));
        v80[3] = v33;
        v79[4] = @"relativeTimeMS";
        uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%+.02f",  v24 * 1000.0));
        v80[4] = v34;
        id v35 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v80,  v79,  5LL));

        -[NSMutableArray addObject:](v61, "addObject:", v35);
        [v19 durationSeconds];
        float v17 = v17 + v36;
        if ((unint64_t)-[NSMutableArray count](v61, "count") >= 0x28)
        {
          id v37 = sub_1000199EC();
          uint64_t v38 = (os_log_s *)objc_claimAutoreleasedReturnValue(v37);
          if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315394;
            __int128 v70 = "getSurroundingHangIntervalsData";
            __int16 v71 = 1024;
            LODWORD(v72) = 40;
            _os_log_impl( (void *)&_mh_execute_header,  v38,  OS_LOG_TYPE_DEFAULT,  "%s retrieved max logs of %d.",  buf,  0x12u);
          }

          id v16 = obj;
          goto LABEL_16;
        }
      }

      id v16 = obj;
      id v59 = [obj countByEnumeratingWithState:&v62 objects:v81 count:16];
      if (v59) {
        continue;
      }
      break;
    }
  }

  else
  {
    float v17 = 0.0;
  }

id sub_1000199EC()
{
  if (qword_10007C178 != -1) {
    dispatch_once(&qword_10007C178, &stru_100071BF0);
  }
  return (id)qword_10007C170;
}

void sub_100019A2C(id a1)
{
  os_log_t v1 = os_log_create("com.apple.hangtracer", "");
  id v2 = (void *)qword_10007C170;
  qword_10007C170 = (uint64_t)v1;
}

id sub_100019A5C()
{
  if (qword_10007C180 != -1) {
    dispatch_once(&qword_10007C180, &stru_100071C10);
  }
  return (id)qword_10007C188;
}

void sub_100019A9C(id a1)
{
  os_log_t v1 = objc_alloc(&OBJC_CLASS___NSSet);
  v5[0] = @"hangtracer.hangid";
  v5[1] = @"hangtracer.process_path";
  v5[2] = @"hangtracer.bundle_id";
  v5[3] = @"hangtracer.duration";
  v5[4] = @"hangtracer.created_at";
  id v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v5, 5LL));
  id v3 = -[NSSet initWithArray:](v1, "initWithArray:", v2);
  id v4 = (void *)qword_10007C188;
  qword_10007C188 = (uint64_t)v3;
}

id sub_100019B7C(void *a1)
{
  id v1 = a1;
  id v2 = sub_100019A5C();
  id v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  id v4 = [v3 containsObject:v1];

  return v4;
}

void sub_100019BC8(const char *a1, int a2)
{
  ssize_t v4 = listxattr(a1, v34, 0x2710uLL, 1);
  if (v4 == -1)
  {
    id v20 = sub_1000199EC();
    double v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      int v22 = *__error();
      int value = 136315394;
      id v31 = a1;
      __int16 v32 = 1024;
      int v33 = v22;
      _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "Unable to retrieve extended attributes of file at path %s (%{darwin.errno}d)",  (uint8_t *)&value,  0x12u);
    }
  }

  else
  {
    unint64_t v6 = v4;
    if (v4)
    {
      unint64_t v7 = 0LL;
      *(void *)&__int128 v5 = 136315650LL;
      __int128 v23 = v5;
      while (1)
      {
        id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", &v34[v7], v23));
        unsigned __int8 v9 = sub_100019B7C(v8);

        if ((v9 & 1) == 0) {
          break;
        }
        ssize_t v10 = getxattr(a1, &v34[v7], &value, 0x2710uLL, 0, 0);
        if (v10 == -1)
        {
          int v18 = *__error();
          id v19 = sub_1000199EC();
          id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
          if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_14;
          }
          *(_DWORD *)buf = 67109120;
          LODWORD(v25) = v18;
          id v14 = v13;
          id v15 = "Unable to retrieve extended attribute: %{darwin.errno}d";
          uint32_t v16 = 8;
          goto LABEL_13;
        }

        if (fsetxattr(a2, &v34[v7], &value, v10, 0, 0) == -1)
        {
          int v11 = *__error();
          id v12 = sub_1000199EC();
          id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v23;
            id v25 = &v34[v7];
            __int16 v26 = 2080;
            __int128 v27 = a1;
            __int16 v28 = 1024;
            int v29 = v11;
            id v14 = v13;
            id v15 = "Unable to copy extended attribute %s from file %s: %{darwin.errno}d";
            uint32_t v16 = 28;
            goto LABEL_13;
          }

void sub_100019E9C(const char *a1, char *a2)
{
  int v4 = open(a2, 2);
  if (v4 == -1)
  {
    int v10 = *__error();
    id v11 = sub_1000199EC();
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 136315394;
      id v13 = a2;
      __int16 v14 = 1024;
      int v15 = v10;
      unsigned __int8 v9 = "Unable to copy extended attributes, failed to open file %s: %{darwin.errno}d";
      goto LABEL_7;
    }
  }

  else
  {
    int v5 = v4;
    sub_100019BC8(a1, v4);
    if (close(v5) != -1) {
      return;
    }
    int v6 = *__error();
    id v7 = sub_1000199EC();
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 136315394;
      id v13 = a2;
      __int16 v14 = 1024;
      int v15 = v6;
      unsigned __int8 v9 = "Unable to close file %s: %{darwin.errno}d";
LABEL_7:
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v12, 0x12u);
    }
  }
}

void sub_100019FE0(int a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (!v6)
  {
    id v16 = sub_1000199EC();
    int v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_12;
    }
    int v18 = 138412290;
    id v19 = v5;
    id v13 = "Not writing extended attribute %@ since the value is nil";
LABEL_10:
    __int16 v14 = v12;
    uint32_t v15 = 12;
    goto LABEL_11;
  }

  if ((sub_100019B7C(v5) & 1) == 0)
  {
    id v17 = sub_1000199EC();
    int v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_12;
    }
    int v18 = 138412290;
    id v19 = v5;
    id v13 = "Not writing extended attribute %@ since it's not in the allowlist";
    goto LABEL_10;
  }

  id v7 = v5;
  id v8 = (const char *)[v7 UTF8String];
  id v9 = v6;
  if (fsetxattr( a1,  v8,  [v9 UTF8String],  (size_t)objc_msgSend(v9, "lengthOfBytesUsingEncoding:", 4),  0,  0))
  {
    int v10 = *__error();
    id v11 = sub_1000199EC();
    int v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v18 = 138412802;
      id v19 = v7;
      __int16 v20 = 2112;
      id v21 = v9;
      __int16 v22 = 1024;
      int v23 = v10;
      id v13 = "Unable to write extended attribute %@ with value %@: %d{darwin.errno}d";
      __int16 v14 = v12;
      uint32_t v15 = 28;
LABEL_11:
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, v13, (uint8_t *)&v18, v15);
    }

void sub_10001A1C0(int a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"HangNotificationUUID"]);
  sub_100019FE0(a1, @"hangtracer.hangid", v6);

  id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"CreatedAt"]);
  sub_100019FE0(a1, @"hangtracer.created_at", v7);

  id v8 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"EndTime"]);
  id v9 = [v8 unsignedLongLongValue];
  int v10 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"StartTime"]);
  double v11 = (double)(unint64_t)(v9 - (_BYTE *)[v10 unsignedLongLongValue]);

  double v12 = v11 + -24000000.0;
  if (a3 != 1) {
    double v12 = v11;
  }
  id v13 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%.0f",  sub_100002FAC((unint64_t)v12));
  __int16 v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  sub_100019FE0(a1, @"hangtracer.duration", v14);

  id v17 = (id)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"ProcessPath"]);
  if (v17)
  {
    sub_100019FE0(a1, @"hangtracer.process_path", v17);
    uint32_t v15 = sub_100002570(v17);
    id v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    sub_100019FE0(a1, @"hangtracer.bundle_id", v16);
  }
}

void sub_10001A390(const char *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  int v7 = open(a1, 2);
  if (v7 == -1)
  {
    int v13 = *__error();
    id v14 = sub_1000199EC();
    double v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 136315394;
      id v16 = a1;
      __int16 v17 = 1024;
      int v18 = v13;
      double v12 = "Unable to open file %s: %{darwin.errno}d";
      goto LABEL_7;
    }

LABEL_8:
    goto LABEL_9;
  }

  int v8 = v7;
  sub_100019FE0(v7, v5, v6);
  if (close(v8) == -1)
  {
    int v9 = *__error();
    id v10 = sub_1000199EC();
    double v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 136315394;
      id v16 = a1;
      __int16 v17 = 1024;
      int v18 = v9;
      double v12 = "Unable to close file %s: %{darwin.errno}d";
LABEL_7:
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, v12, (uint8_t *)&v15, 0x12u);
      goto LABEL_8;
    }

    goto LABEL_8;
  }

LABEL_9:
}

void sub_10001A4F4(int a1)
{
  if (a1 == -1)
  {
    id v2 = sub_1000199EC();
    id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4[0] = 67109120;
      v4[1] = -1;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Bad file desctiptor %d", (uint8_t *)v4, 8u);
    }
  }

  else
  {
    fremovexattr(a1, (const char *)[@"hangtracer.hangid" UTF8String], 0);
    fremovexattr(a1, (const char *)[@"hangtracer.created_at" UTF8String], 0);
    fremovexattr(a1, (const char *)[@"hangtracer.duration" UTF8String], 0);
    fremovexattr(a1, (const char *)[@"hangtracer.process_path" UTF8String], 0);
    fremovexattr(a1, (const char *)[@"hangtracer.bundle_id" UTF8String], 0);
  }

void sub_10001A664(const char *a1, void *a2)
{
  id v3 = a2;
  int v4 = open(a1, 2);
  if (v4 == -1)
  {
    int v9 = *__error();
    id v10 = sub_1000199EC();
    double v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 136315394;
      id v16 = a1;
      __int16 v17 = 1024;
      int v18 = v9;
      double v12 = "Unable to open file %s: %{darwin.errno}d";
LABEL_10:
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, v12, (uint8_t *)&v15, 0x12u);
    }

LABEL_11:
    goto LABEL_12;
  }

  int v5 = v4;
  sub_10001A4F4(v4);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"ServiceName"]);
  if (v6)
  {
    int v7 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"ServiceName"]);
    uint64_t v8 = sub_100002C0C(v7);
  }

  else
  {
    uint64_t v8 = 5LL;
  }

  sub_10001A1C0(v5, v3, v8);
  if (close(v5) == -1)
  {
    int v13 = *__error();
    id v14 = sub_1000199EC();
    double v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 136315394;
      id v16 = a1;
      __int16 v17 = 1024;
      int v18 = v13;
      double v12 = "Unable to close file %s: %{darwin.errno}d";
      goto LABEL_10;
    }

    goto LABEL_11;
  }

void sub_10001A938()
{
  id v0 = sub_1000199EC();
  id v1 = (os_log_s *)objc_claimAutoreleasedReturnValue(v0);
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEFAULT, "marking hangreporter as clean to exit", v3, 2u);
  }

  id v2 = (void *)objc_claimAutoreleasedReturnValue([(id)qword_10007C198 transaction]);
  if (v2) {
    [(id)qword_10007C198 setTransaction:0];
  }
}

void sub_10001B29C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
}

void sub_10001B2F0(id a1)
{
  id v1 = -[HTFixedSizeQueue initWithSize:](objc_alloc(&OBJC_CLASS___HTFixedSizeQueue), "initWithSize:", 128LL);
  id v2 = (void *)qword_10007C198;
  qword_10007C198 = (uint64_t)v1;

  if (!qword_10007C198)
  {
    id v3 = sub_1000199EC();
    int v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)int v5 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Unable to instantiate queue to hold process launch and exit records, exiting",  v5,  2u);
    }

    exit(12);
  }

void sub_10001BA0C( const char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  if (!qword_10007C1B0)
  {
    qword_10007C1B0 = (uint64_t)calloc(0x400uLL, 1uLL);
    vsnprintf(__str, 0x400uLL, a1, &a9);
    snprintf((char *)qword_10007C1B0, 0x400uLL, "%s", __str);
  }

uint64_t sub_10001BAC4(uint64_t a1, uint64_t *a2, unsigned int a3)
{
  *(_DWORD *)(a1 + 36) = -1;
  if (a3 < 8) {
    return 0LL;
  }
  unsigned int v6 = a3 >> 3;
  while (2)
  {
    unint64_t v9 = *a2;
    uint64_t v8 = a2 + 1;
    int v7 = v9;
    unint64_t v10 = HIDWORD(v9);
    unsigned int v11 = v6 - 1;
    if (v9 <= 0x30000000 && v11 >= v10)
    {
      uint64_t v13 = (v7 - 1);
      if (v13 <= 0x47) {
        __asm { BR              X10 }
      }

      uint64_t v17 = (v7 - 73);
      if (v17 <= 0x46) {
        __asm { BR              X10 }
      }

      switch(v7)
      {
        case 144:
          uint64_t v18 = *v8;
          id v19 = "numMemExtreme";
          goto LABEL_13;
        case 145:
          uint64_t v18 = *v8;
          id v19 = "maxMemExtremeDuration";
          goto LABEL_13;
        case 146:
          uint64_t v18 = *v8;
          id v19 = "memExtremeDuration";
          goto LABEL_13;
        case 147:
          uint64_t v18 = *v8;
          id v19 = "bandGetsExtreme";
          goto LABEL_13;
        case 148:
          uint64_t v18 = *v8;
          id v19 = "bandGetsLow";
          goto LABEL_13;
        case 149:
          uint64_t v18 = *v8;
          id v19 = "numHostChoke";
          goto LABEL_13;
        case 152:
          uint64_t v18 = *v8;
          id v19 = "AbortSkip_ProgramError";
          goto LABEL_13;
        case 153:
          uint64_t v18 = *v8;
          id v19 = "AbortSkip_ReadErrorOpenBand";
          goto LABEL_13;
        case 154:
          uint64_t v18 = *v8;
          id v19 = "AbortSkip_FailedRebuildingParity";
          goto LABEL_13;
        case 155:
          uint64_t v18 = *v8;
          id v19 = "AbortPad_OpenRefreshBand";
          goto LABEL_13;
        case 156:
          uint64_t v18 = *v8;
          id v19 = "AbortPad_CloseBands";
          goto LABEL_13;
        case 157:
          uint64_t v18 = *v8;
          id v19 = "AbortPad_SetPhoto";
          goto LABEL_13;
        case 158:
          uint64_t v18 = *v8;
          id v19 = "AbortPad_GcNoSource";
          goto LABEL_13;
        case 159:
          uint64_t v18 = *v8;
          id v19 = "AbortPad_Format";
          goto LABEL_13;
        case 160:
          uint64_t v18 = *v8;
          id v19 = "nandDiscoveryDuration";
          goto LABEL_13;
        case 161:
          uint64_t v18 = *v8;
          id v19 = "coreCCEnableDuration";
          goto LABEL_13;
        case 163:
          uint64_t v18 = *v8;
          id v19 = "coreOpenDuration";
          goto LABEL_13;
        case 164:
          uint64_t v18 = *v8;
          id v19 = "coreWritableDuration";
          goto LABEL_13;
        case 165:
          uint64_t v18 = *v8;
          id v19 = "coreClogLoadDuration";
          goto LABEL_13;
        case 167:
          uint64_t v18 = *v8;
          id v19 = "bulkPFail";
          goto LABEL_13;
        case 169:
          uint64_t v18 = *v8;
          id v19 = "bulkRFail";
          goto LABEL_13;
        case 172:
          uint64_t v18 = *v8;
          id v19 = "raidSmartErrors";
          goto LABEL_13;
        case 182:
          uint64_t v18 = *v8;
          id v19 = "internalUeccs";
          goto LABEL_13;
        case 183:
          uint64_t v18 = *v8;
          id v19 = "e2eFail";
          goto LABEL_13;
        case 184:
          uint64_t v18 = *v8;
          id v19 = "TempSensorMax";
          goto LABEL_13;
        case 185:
          uint64_t v18 = *v8;
          id v19 = "TempSensorMin";
          goto LABEL_13;
        case 186:
          uint64_t v18 = *v8;
          id v19 = "powerUpFromDDR";
          goto LABEL_13;
        case 187:
          uint64_t v18 = *v8;
          id v19 = "numMemLow";
          goto LABEL_13;
        case 188:
          uint64_t v18 = *v8;
          id v19 = "maxMemLowDuration";
          goto LABEL_13;
        case 189:
          uint64_t v18 = *v8;
          id v19 = "memLowDuration";
          goto LABEL_13;
        case 190:
          uint64_t v18 = *v8;
          id v19 = "numFences";
          goto LABEL_13;
        case 191:
          uint64_t v18 = *v8;
          id v19 = "hostPassiveIO";
          goto LABEL_13;
        case 192:
          uint64_t v18 = *v8;
          id v19 = "odtsMax";
          goto LABEL_13;
        case 193:
          uint64_t v18 = *v8;
          id v19 = "defragMFromOrphans";
          goto LABEL_13;
        case 194:
          uint64_t v18 = *v8;
          id v19 = "defragMFromFragments";
          goto LABEL_13;
        case 195:
          uint64_t v18 = *v8;
          id v19 = "defragMTime";
          goto LABEL_13;
        case 196:
          uint64_t v18 = *v8;
          id v19 = "defragMMaxTime";
          goto LABEL_13;
        case 197:
          uint64_t v18 = *v8;
          id v19 = "raidFailedLbaMismatch";
          goto LABEL_13;
        case 198:
          uint64_t v18 = *v8;
          id v19 = "numSyscfgWrites";
          goto LABEL_13;
        case 199:
          uint64_t v18 = *v8;
          id v19 = "indmbUnitsXfer";
          goto LABEL_13;
        case 200:
          uint64_t v18 = *v8;
          id v19 = "indmbUnitsCache";
          goto LABEL_13;
        case 201:
          uint64_t v18 = *v8;
          id v19 = "indmbUnitsInd";
          goto LABEL_13;
        case 202:
          uint64_t v18 = *v8;
          id v19 = "wcacheFS_Mbytes";
          goto LABEL_13;
        case 203:
          uint64_t v18 = *v8;
          id v19 = "wcacheDS_Mbytes";
          goto LABEL_13;
        case 204:
          uint64_t v18 = *v8;
          id v19 = "powerOnSeconds";
          goto LABEL_13;
        case 205:
          uint64_t v18 = *v8;
          id v19 = "numUnknownTokenHostRead";
          goto LABEL_13;
        case 206:
          uint64_t v18 = *v8;
          id v19 = "numUnmmapedTokenHostRead";
          goto LABEL_13;
        case 207:
          __int16 v20 = "numOfThrottlingEntriesPerLevel";
          uint64_t v21 = a1;
          int v22 = 207;
LABEL_85:
          id v14 = v8;
          unsigned int v15 = 16;
          goto LABEL_12;
        case 208:
          uint64_t v18 = *v8;
          id v19 = "wcacheFS_MbytesMin";
          goto LABEL_13;
        case 209:
          uint64_t v18 = *v8;
          id v19 = "wcacheFS_MbytesMax";
          goto LABEL_13;
        case 210:
          uint64_t v18 = *v8;
          id v19 = "prepareForShutdownFailCounter";
          goto LABEL_13;
        case 211:
          uint64_t v18 = *v8;
          id v19 = "lpsrEntry";
          goto LABEL_13;
        case 212:
          uint64_t v18 = *v8;
          id v19 = "lpsrExit";
          goto LABEL_13;
        case 213:
          __int16 v20 = "crcInternalReadFail";
          uint64_t v21 = a1;
          int v22 = 213;
LABEL_23:
          id v14 = v8;
          unsigned int v15 = 8;
          goto LABEL_12;
        case 214:
          uint64_t v18 = *v8;
          id v19 = "wcacheFSEvictCnt";
          goto LABEL_13;
        case 215:
          uint64_t v18 = *v8;
          id v19 = "wcacheFSEvictSize";
          goto LABEL_13;
        case 216:
          uint64_t v18 = *v8;
          id v19 = "wcacheFSWr";
          goto LABEL_13;
        case 217:
          uint64_t v18 = *v8;
          id v19 = "wcacheDSWr";
          goto LABEL_13;
        case 218:
          __int16 v20 = "wcacheFSEvictSizeLogDist";
          uint64_t v21 = a1;
          int v22 = 218;
LABEL_11:
          id v14 = v8;
          unsigned int v15 = 10;
          goto LABEL_12;
        case 219:
          uint64_t v18 = *v8;
          id v19 = "prepareForShutdownTimeoutCounter";
          goto LABEL_13;
        case 220:
          uint64_t v18 = *v8;
          id v19 = "prepareForShutdownCancelCounter";
          goto LABEL_13;
        case 221:
          uint64_t v18 = *v8;
          id v19 = "RD_openBandCount";
          goto LABEL_13;
        case 222:
          uint64_t v18 = *v8;
          id v19 = "RD_openBandNops";
          goto LABEL_13;
        case 223:
          uint64_t v18 = *v8;
          id v19 = "RD_closedBandEvictCount";
LABEL_13:
          id v16 = (void *)a1;
          goto LABEL_14;
        default:
          switch(v7)
          {
            case 224:
              uint64_t v18 = *v8;
              id v19 = "RD_closedBandEvictSectors";
              goto LABEL_13;
            case 225:
              uint64_t v18 = *v8;
              id v19 = "RD_closedBandFragmentCount";
              goto LABEL_13;
            case 226:
              uint64_t v18 = *v8;
              id v19 = "RD_closedBandFragmentSectors";
              goto LABEL_13;
            case 227:
              __int16 v20 = "wcacheFSOverWrLogSizeCnts";
              uint64_t v21 = a1;
              int v22 = 227;
              goto LABEL_11;
            case 228:
              __int16 v20 = "wcacheFSOverWrSizeByFlow";
              uint64_t v21 = a1;
              int v22 = 228;
              goto LABEL_22;
            case 229:
              __int16 v20 = "indmbXferCountTo";
              uint64_t v21 = a1;
              int v22 = 229;
              goto LABEL_20;
            case 230:
              __int16 v20 = "indmbAccumulatedTimeBetweenXfers";
              uint64_t v21 = a1;
              int v22 = 230;
LABEL_20:
              id v14 = v8;
              unsigned int v15 = 2;
              goto LABEL_12;
            case 231:
              uint64_t v18 = *v8;
              id v19 = "maxGracefulBootTimeMs";
              goto LABEL_13;
            case 232:
              uint64_t v18 = *v8;
              id v19 = "maxUngracefulBootTimeMs";
              goto LABEL_13;
            case 233:
              uint64_t v18 = *v8;
              id v19 = "averageGracefulBootTimeMs";
              goto LABEL_13;
            case 234:
              uint64_t v18 = *v8;
              id v19 = "averageUngracefulBootTimeMs";
              goto LABEL_13;
            case 235:
              __int16 v20 = "gracefulBootTimeLogMs";
              uint64_t v21 = a1;
              int v22 = 235;
              goto LABEL_23;
            case 236:
              __int16 v20 = "ungracefulBootTimeLogMs";
              uint64_t v21 = a1;
              int v22 = 236;
              goto LABEL_23;
            case 237:
              __int16 v20 = "CalibrationCount";
              uint64_t v21 = a1;
              int v22 = 237;
              goto LABEL_22;
            case 238:
              uint64_t v18 = *v8;
              id v19 = "CalibrationLastTmp";
              goto LABEL_13;
            case 239:
              uint64_t v18 = *v8;
              id v19 = "CalibrationMaxTmp";
              goto LABEL_13;
            case 240:
              uint64_t v18 = *v8;
              id v19 = "CalibrationMinTmp";
              goto LABEL_13;
            case 241:
              uint64_t v18 = *v8;
              id v19 = "ungracefulBootWorstIndicator";
              goto LABEL_13;
            case 242:
              uint64_t v18 = *v8;
              id v19 = "metaMismatchReread";
              goto LABEL_13;
            case 243:
              uint64_t v18 = *v8;
              id v19 = "numS3SleepOps";
              goto LABEL_13;
            case 244:
              uint64_t v18 = *v8;
              id v19 = "odtsCurrent";
              goto LABEL_13;
            case 245:
              uint64_t v18 = *v8;
              id v19 = "prefetchReads";
              goto LABEL_13;
            case 246:
              uint64_t v18 = *v8;
              id v19 = "prefetchHits";
              goto LABEL_13;
            case 247:
              uint64_t v18 = *v8;
              id v19 = "prefetchWritesInvalidation";
              goto LABEL_13;
            case 248:
              uint64_t v18 = *v8;
              id v19 = "indmbUnitsTotal";
              goto LABEL_13;
            case 249:
              uint64_t v18 = *v8;
              id v19 = "selfThrottlingEngage";
              goto LABEL_13;
            case 250:
              uint64_t v18 = *v8;
              id v19 = "selfThrottlingDisengage";
              goto LABEL_13;
            case 252:
              uint64_t v18 = *v8;
              id v19 = "AbortSkip_WlpMode";
              goto LABEL_13;
            case 253:
              uint64_t v18 = *v8;
              id v19 = "hostWritesWlpMode";
              goto LABEL_13;
            case 254:
              uint64_t v18 = *v8;
              id v19 = "numClogDoubleUnc";
              goto LABEL_13;
            case 256:
              uint64_t v18 = *v8;
              id v19 = "AbortPad_WlpMode";
              goto LABEL_13;
            case 257:
              uint64_t v18 = *v8;
              id v19 = "bonfireIntermediateBandErases";
              goto LABEL_13;
            case 258:
              uint64_t v18 = *v8;
              id v19 = "bonfireUserBandErases";
              goto LABEL_13;
            case 259:
              uint64_t v18 = *v8;
              id v19 = "bonfireIntermediateBandProgs";
              goto LABEL_13;
            case 260:
              uint64_t v18 = *v8;
              id v19 = "bonfireUserBandProgs";
              goto LABEL_13;
            case 261:
              uint64_t v18 = *v8;
              id v19 = "bonfireIntermediatePageReads";
              goto LABEL_13;
            case 262:
              uint64_t v18 = *v8;
              id v19 = "bonfireUserPageReads";
              goto LABEL_13;
            case 263:
              uint64_t v18 = *v8;
              id v19 = "refreshUtil00";
              goto LABEL_13;
            case 264:
              uint64_t v18 = *v8;
              id v19 = "failToReadUtil00";
              goto LABEL_13;
            case 265:
              __int16 v20 = "readCountHisto";
              uint64_t v21 = a1;
              int v22 = 265;
LABEL_19:
              id v14 = v8;
              unsigned int v15 = 5;
              goto LABEL_12;
            case 266:
              __int16 v20 = "readAmpHisto";
              uint64_t v21 = a1;
              int v22 = 266;
              goto LABEL_85;
            case 267:
              uint64_t v18 = *v8;
              id v19 = "totalReadAmp";
              goto LABEL_13;
            case 268:
              __int16 v20 = "nvmeModeSelect";
              uint64_t v21 = a1;
              int v22 = 268;
              goto LABEL_22;
            case 269:
              __int16 v20 = "numBootBlockRefreshSuccess";
              uint64_t v21 = a1;
              int v22 = 269;
              goto LABEL_23;
            case 270:
              __int16 v20 = "numBootBlockRefreshFail";
              uint64_t v21 = a1;
              int v22 = 270;
              goto LABEL_23;
            case 271:
              uint64_t v18 = *v8;
              id v19 = "numUnsupportedAsi";
              goto LABEL_13;
            case 272:
              uint64_t v18 = *v8;
              id v19 = "NumTerminatedProgramSegs";
              goto LABEL_13;
            case 273:
              uint64_t v18 = *v8;
              id v19 = "indParityPagesDrops";
              goto LABEL_13;
            case 274:
              uint64_t v18 = *v8;
              id v19 = "indFlowPrograms";
              goto LABEL_13;
            case 277:
              __int16 v20 = "powerBudgetSelect";
              uint64_t v21 = a1;
              int v22 = 277;
LABEL_22:
              id v14 = v8;
              unsigned int v15 = 4;
              goto LABEL_12;
            case 279:
              uint64_t v18 = *v8;
              id v19 = "RxBurnNandWrites";
              goto LABEL_13;
            case 280:
              __int16 v20 = "E2EDPErrorCounters";
              uint64_t v21 = a1;
              int v22 = 280;
LABEL_153:
              id v14 = v8;
              unsigned int v15 = 12;
              goto LABEL_12;
            case 281:
              uint64_t v18 = *v8;
              id v19 = "wcacheSectorsMax";
              goto LABEL_13;
            case 282:
              uint64_t v18 = *v8;
              id v19 = "wcacheSectorsMin";
              goto LABEL_13;
            case 283:
              uint64_t v18 = *v8;
              id v19 = "wcacheSectorsCur";
              goto LABEL_13;
            case 284:
              uint64_t v18 = *v8;
              id v19 = "wcacheDS_SectorsMax";
              goto LABEL_13;
            case 285:
              uint64_t v18 = *v8;
              id v19 = "wcacheDS_SectorsMin";
              goto LABEL_13;
            case 286:
              uint64_t v18 = *v8;
              id v19 = "wcacheDS_SectorsCur";
              goto LABEL_13;
            case 287:
              uint64_t v18 = *v8;
              id v19 = "wcacheFS_Reads";
              goto LABEL_13;
            case 288:
              uint64_t v18 = *v8;
              id v19 = "wcacheDS_Reads";
              goto LABEL_13;
            case 289:
              __int16 v20 = "mspBootBlockReadFail";
              uint64_t v21 = a1;
              int v22 = 289;
              goto LABEL_155;
            case 290:
              __int16 v20 = "mspBootBlockProgFail";
              uint64_t v21 = a1;
              int v22 = 290;
              goto LABEL_155;
            case 291:
              __int16 v20 = "mspBootBlockEraseFail";
              uint64_t v21 = a1;
              int v22 = 291;
              goto LABEL_155;
            case 292:
              uint64_t v18 = *v8;
              id v19 = "bandsRefreshedOnError";
              goto LABEL_13;
            default:
              switch(v7)
              {
                case 298:
                  __int16 v20 = "perHostReads";
                  uint64_t v21 = a1;
                  int v22 = 298;
                  goto LABEL_20;
                case 299:
                  __int16 v20 = "perHostReadXacts";
                  uint64_t v21 = a1;
                  int v22 = 299;
                  goto LABEL_20;
                case 300:
                  __int16 v20 = "perHostWrites";
                  uint64_t v21 = a1;
                  int v22 = 300;
                  goto LABEL_20;
                case 301:
                  __int16 v20 = "perHostWriteXacts";
                  uint64_t v21 = a1;
                  int v22 = 301;
                  goto LABEL_20;
                case 302:
                  __int16 v20 = "perHostNumFlushes";
                  uint64_t v21 = a1;
                  int v22 = 302;
                  goto LABEL_20;
                case 303:
                  __int16 v20 = "perHostNumFences";
                  uint64_t v21 = a1;
                  int v22 = 303;
                  goto LABEL_20;
                case 304:
                  __int16 v20 = "commitPadSectorsPerFlow";
                  uint64_t v21 = a1;
                  int v22 = 304;
                  goto LABEL_11;
                case 305:
                  __int16 v20 = "wcacheDSOverWrLogSizeCnts";
                  uint64_t v21 = a1;
                  int v22 = 305;
                  goto LABEL_11;
                case 306:
                  __int16 v20 = "wcacheDSOverWrSizeByFlow";
                  uint64_t v21 = a1;
                  int v22 = 306;
                  goto LABEL_22;
                case 307:
                  __int16 v20 = "CmdRaisePrioiryEvents";
                  uint64_t v21 = a1;
                  int v22 = 307;
                  goto LABEL_11;
                case 308:
                  uint64_t v18 = *v8;
                  id v19 = "utilNumVerification";
                  goto LABEL_13;
                case 309:
                  uint64_t v18 = *v8;
                  id v19 = "utilRefreshes";
                  goto LABEL_13;
                case 310:
                  uint64_t v18 = *v8;
                  id v19 = "utilBDRErrors";
                  goto LABEL_13;
                case 311:
                  uint64_t v18 = *v8;
                  id v19 = "indBandsPerFlow";
                  goto LABEL_13;
                case 312:
                  uint64_t v18 = *v8;
                  id v19 = "secsPerIndFlow";
                  goto LABEL_13;
                case 313:
                  uint64_t v18 = *v8;
                  id v19 = "indDecodedECC";
                  goto LABEL_13;
                case 314:
                  __int16 v20 = "numBootBlockValidateSuccess";
                  uint64_t v21 = a1;
                  int v22 = 314;
                  goto LABEL_23;
                case 315:
                  __int16 v20 = "numBootBlockValidateFail";
                  uint64_t v21 = a1;
                  int v22 = 315;
                  goto LABEL_23;
                case 316:
                  __int16 v20 = "clogPagesFillingPercentage";
                  uint64_t v21 = a1;
                  int v22 = 316;
                  goto LABEL_22;
                case 317:
                  uint64_t v18 = *v8;
                  id v19 = "bdrCalTimeAccFactor";
                  goto LABEL_13;
                case 318:
                  uint64_t v18 = *v8;
                  id v19 = "bootChainRdError";
                  goto LABEL_13;
                case 319:
                  uint64_t v18 = *v8;
                  id v19 = "bootChainBlankError";
                  goto LABEL_13;
                case 320:
                  uint64_t v18 = *v8;
                  id v19 = "bootChainRefreshError";
                  goto LABEL_13;
                case 321:
                  uint64_t v18 = *v8;
                  id v19 = "bootChainVersionError";
                  goto LABEL_13;
                case 322:
                  uint64_t v18 = *v8;
                  id v19 = "mspBootBlockMismatch";
                  goto LABEL_13;
                case 323:
                  uint64_t v18 = *v8;
                  id v19 = "mspBootBlockMismatchErr";
                  goto LABEL_13;
                case 324:
                  __int16 v20 = "bitflipAddr";
                  uint64_t v21 = a1;
                  int v22 = 324;
                  goto LABEL_19;
                case 325:
                  __int16 v20 = "bitflipCount";
                  uint64_t v21 = a1;
                  int v22 = 325;
                  goto LABEL_19;
                case 326:
                  __int16 v20 = "bitflipDupes";
                  uint64_t v21 = a1;
                  int v22 = 326;
                  goto LABEL_19;
                case 327:
                  __int16 v20 = "bandsMaxTempHisto";
                  uint64_t v21 = a1;
                  int v22 = 327;
                  goto LABEL_196;
                case 328:
                  __int16 v20 = "bandsMinTempHisto";
                  uint64_t v21 = a1;
                  int v22 = 328;
                  goto LABEL_196;
                case 329:
                  __int16 v20 = "bandsLifeTimeTempHisto";
                  uint64_t v21 = a1;
                  int v22 = 329;
LABEL_196:
                  id v14 = v8;
                  unsigned int v15 = 30;
                  goto LABEL_12;
                case 330:
                  __int16 v20 = "bandsDeltaTempHisto";
                  uint64_t v21 = a1;
                  int v22 = 330;
                  id v14 = v8;
                  unsigned int v15 = 22;
                  goto LABEL_12;
                case 331:
                  __int16 v20 = "bandsCrossTempHisto";
                  uint64_t v21 = a1;
                  int v22 = 331;
                  id v14 = v8;
                  unsigned int v15 = 45;
                  goto LABEL_12;
                case 332:
                  __int16 v20 = "wcacheWaitLogMs";
                  uint64_t v21 = a1;
                  int v22 = 332;
                  goto LABEL_11;
                case 333:
                  __int16 v20 = "wcacheDS_segsSortedLogSize";
                  uint64_t v21 = a1;
                  int v22 = 333;
                  goto LABEL_11;
                case 334:
                  uint64_t v18 = *v8;
                  id v19 = "numFirmwareWrites";
                  goto LABEL_13;
                case 335:
                  uint64_t v18 = *v8;
                  id v19 = "numBisWrites";
                  goto LABEL_13;
                case 336:
                  uint64_t v18 = *v8;
                  id v19 = "numBootChainUpdates";
                  goto LABEL_13;
                case 337:
                  uint64_t v18 = *v8;
                  id v19 = "cntCalTimeWentBackWard";
                  goto LABEL_13;
                case 338:
                  uint64_t v18 = *v8;
                  id v19 = "indBoRecoveries";
                  goto LABEL_13;
                case 340:
                  uint64_t v18 = *v8;
                  id v19 = "numCrossTempUecc";
                  goto LABEL_13;
                case 341:
                  uint64_t v18 = *v8;
                  id v19 = "latencyMonitorError";
                  goto LABEL_13;
                case 343:
                  uint64_t v18 = *v8;
                  id v19 = "utilUeccReads";
                  goto LABEL_13;
                case 344:
                  uint64_t v18 = *v8;
                  id v19 = "numOfAvoidedGCDueToTemp";
                  goto LABEL_13;
                case 345:
                  uint64_t v18 = *v8;
                  id v19 = "forceShutdowns";
                  goto LABEL_13;
                case 346:
                  uint64_t v18 = *v8;
                  id v19 = "gcSlcDestinations";
                  goto LABEL_13;
                case 347:
                  uint64_t v18 = *v8;
                  id v19 = "indReplayExtUsed";
                  goto LABEL_13;
                case 348:
                  uint64_t v18 = *v8;
                  id v19 = "defectsPerPackageOverflow";
                  goto LABEL_13;
                case 349:
                  uint64_t v18 = *v8;
                  id v19 = "RxBurnIntBandsProgrammed";
                  goto LABEL_13;
                case 350:
                  uint64_t v18 = *v8;
                  id v19 = "RxBurnUsrBandsProgrammed";
                  goto LABEL_13;
                case 351:
                  uint64_t v18 = *v8;
                  id v19 = "RxBurnIntNandWrites";
                  goto LABEL_13;
                case 352:
                  uint64_t v18 = *v8;
                  id v19 = "RxBurnUsrNandWrites";
                  goto LABEL_13;
                case 353:
                  uint64_t v18 = *v8;
                  id v19 = "clogLastStripeUeccs";
                  goto LABEL_13;
                case 354:
                  uint64_t v18 = *v8;
                  id v19 = "GC_MidDestSrcSwitchSLC2TLC";
                  goto LABEL_13;
                case 355:
                  uint64_t v18 = *v8;
                  id v19 = "GC_MidDestSrcSwitchTLC2SLC";
                  goto LABEL_13;
                case 356:
                  uint64_t v18 = *v8;
                  id v19 = "nvme_stats_shutdown_count_host0_normal";
                  goto LABEL_13;
                case 357:
                  uint64_t v18 = *v8;
                  id v19 = "nvme_stats_shutdown_count_host1_normal";
                  goto LABEL_13;
                case 358:
                  uint64_t v18 = *v8;
                  id v19 = "nvme_stats_shutdown_count_host0_s2r";
                  goto LABEL_13;
                case 359:
                  uint64_t v18 = *v8;
                  id v19 = "nvme_stats_shutdown_count_host1_s2r";
                  goto LABEL_13;
                case 360:
                  __int16 v20 = "gcPDusterIntrSrcValidityHisto";
                  uint64_t v21 = a1;
                  int v22 = 360;
                  goto LABEL_85;
                case 361:
                  __int16 v20 = "gcPDusterUserSrcValidityHisto";
                  uint64_t v21 = a1;
                  int v22 = 361;
                  goto LABEL_85;
                case 362:
                  uint64_t v18 = *v8;
                  id v19 = "raidFailedReadParity";
                  goto LABEL_13;
                case 364:
                  uint64_t v18 = *v8;
                  id v19 = "lhotNumSkipes";
                  goto LABEL_13;
                default:
                  switch(v7)
                  {
                    case 365:
                      uint64_t v18 = *v8;
                      id v19 = "lhotNumIsHotCalls";
                      goto LABEL_13;
                    case 366:
                      uint64_t v18 = *v8;
                      id v19 = "lhotFullLap";
                      goto LABEL_13;
                    case 367:
                      uint64_t v18 = *v8;
                      id v19 = "lhotSkipPrecent";
                      goto LABEL_13;
                    case 368:
                      uint64_t v18 = *v8;
                      id v19 = "eraseSuspendEvents";
                      goto LABEL_13;
                    case 369:
                      uint64_t v18 = *v8;
                      id v19 = "eraseSuspendedStatuses";
                      goto LABEL_13;
                    case 370:
                      uint64_t v18 = *v8;
                      id v19 = "eraseSuspendedBands";
                      goto LABEL_13;
                    case 371:
                      uint64_t v18 = *v8;
                      id v19 = "eraseSuspendSituationsBelowThreshold";
                      goto LABEL_13;
                    case 372:
                      uint64_t v18 = *v8;
                      id v19 = "eraseSuspendSituationsAboveThreshold";
                      goto LABEL_13;
                    case 373:
                      uint64_t v18 = *v8;
                      id v19 = "eraseSuspendReadChainsProcessed";
                      goto LABEL_13;
                    case 374:
                      uint64_t v18 = *v8;
                      id v19 = "bdrLastDoneHr";
                      goto LABEL_13;
                    case 375:
                      uint64_t v18 = *v8;
                      id v19 = "bdrBackupThreshHrs";
                      goto LABEL_13;
                    case 376:
                      uint64_t v18 = *v8;
                      id v19 = "clogPortableProgBufs";
                      goto LABEL_13;
                    case 377:
                      uint64_t v18 = *v8;
                      id v19 = "clogPortableDropBufs";
                      goto LABEL_13;
                    case 378:
                      uint64_t v18 = *v8;
                      id v19 = "clogPortablePadSectors";
                      goto LABEL_13;
                    case 379:
                      uint64_t v18 = *v8;
                      id v19 = "numRetiredBlocks";
                      goto LABEL_13;
                    case 381:
                      uint64_t v18 = *v8;
                      id v19 = "numRefreshOnErrNandRefreshPerf";
                      goto LABEL_13;
                    case 382:
                      uint64_t v18 = *v8;
                      id v19 = "raidReconstructReads";
                      goto LABEL_13;
                    case 383:
                      uint64_t v18 = *v8;
                      id v19 = "gcReadsNoBlog";
                      goto LABEL_13;
                    case 384:
                      uint64_t v18 = *v8;
                      id v19 = "AbortSkip_MPBXReadVerifyClosedBand";
                      goto LABEL_13;
                    case 385:
                      uint64_t v18 = *v8;
                      id v19 = "openBandReadFail";
                      goto LABEL_13;
                    case 386:
                      uint64_t v18 = *v8;
                      id v19 = "AbortSkip_MPBXReadVerifyOpenBand";
                      goto LABEL_13;
                    case 387:
                      uint64_t v18 = *v8;
                      id v19 = "AbortSkip_MBPXFailedRebuildingParity";
                      goto LABEL_13;
                    case 388:
                      uint64_t v18 = *v8;
                      id v19 = "raidSuccessfulPMXReconstructionInternal";
                      goto LABEL_13;
                    case 389:
                      uint64_t v18 = *v8;
                      id v19 = "raidSuccessfulPMXReconstructionHost";
                      goto LABEL_13;
                    case 390:
                      uint64_t v18 = *v8;
                      id v19 = "raidFailedPMXReconstructionInternal";
                      goto LABEL_13;
                    case 391:
                      uint64_t v18 = *v8;
                      id v19 = "raidFailedPMXReconstructionHost";
                      goto LABEL_13;
                    case 392:
                      uint64_t v18 = *v8;
                      id v19 = "raidSuccessfulRMXReconstructionInternal";
                      goto LABEL_13;
                    case 393:
                      uint64_t v18 = *v8;
                      id v19 = "raidSuccessfulRMXReconstructionHost";
                      goto LABEL_13;
                    case 394:
                      uint64_t v18 = *v8;
                      id v19 = "raidFailedRMXReconstructionInternal";
                      goto LABEL_13;
                    case 395:
                      uint64_t v18 = *v8;
                      id v19 = "raidFailedRMXReconstructionHost";
                      goto LABEL_13;
                    case 396:
                      uint64_t v18 = *v8;
                      id v19 = "raidFailedReadParityInternal";
                      goto LABEL_13;
                    case 397:
                      uint64_t v18 = *v8;
                      id v19 = "raidFailedReadQParityInternal";
                      goto LABEL_13;
                    case 398:
                      uint64_t v18 = *v8;
                      id v19 = "raidFailedReadQParity";
                      goto LABEL_13;
                    case 399:
                      uint64_t v18 = *v8;
                      id v19 = "raidFailedReadQCopy";
                      goto LABEL_13;
                    case 400:
                      uint64_t v18 = *v8;
                      id v19 = "raidFailedReconstructionQParity";
                      goto LABEL_13;
                    case 401:
                      uint64_t v18 = *v8;
                      id v19 = "offlineBlocksCnt";
                      goto LABEL_13;
                    case 402:
                      uint64_t v18 = *v8;
                      id v19 = "bork0Revectors";
                      goto LABEL_13;
                    case 403:
                      uint64_t v18 = *v8;
                      id v19 = "raidFailedReadBlog";
                      goto LABEL_13;
                    case 404:
                      uint64_t v18 = *v8;
                      id v19 = "numReliabilityRefreshes";
                      goto LABEL_13;
                    case 405:
                      uint64_t v18 = *v8;
                      id v19 = "raidFailedReadQCopyInternal";
                      goto LABEL_13;
                    case 406:
                      __int16 v20 = "raidReconstructSuccessFlow";
                      uint64_t v21 = a1;
                      int v22 = 406;
                      goto LABEL_19;
                    case 407:
                      __int16 v20 = "raidReconstructFailFlow";
                      uint64_t v21 = a1;
                      int v22 = 407;
                      goto LABEL_19;
                    case 408:
                      uint64_t v18 = *v8;
                      id v19 = "raidReconstructFailP";
                      goto LABEL_13;
                    case 409:
                      uint64_t v18 = *v8;
                      id v19 = "raidReconstructFailQ";
                      goto LABEL_13;
                    case 410:
                      uint64_t v18 = *v8;
                      id v19 = "raidReconstructFailUECC";
                      goto LABEL_13;
                    case 411:
                      uint64_t v18 = *v8;
                      id v19 = "raidReconstructFailUnsupp";
                      goto LABEL_13;
                    case 412:
                      uint64_t v18 = *v8;
                      id v19 = "raidUECCOpenBand";
                      goto LABEL_13;
                    case 414:
                      uint64_t v18 = *v8;
                      id v19 = "ueccReads";
                      goto LABEL_13;
                    case 416:
                      uint64_t v18 = *v8;
                      id v19 = "raidSuccessfulVerify";
                      goto LABEL_13;
                    case 417:
                      uint64_t v18 = *v8;
                      id v19 = "raidFailedVerify";
                      goto LABEL_13;
                    case 418:
                      uint64_t v18 = *v8;
                      id v19 = "numBandsVerified";
                      goto LABEL_13;
                    case 419:
                      uint64_t v18 = *v8;
                      id v19 = "cache_heads";
                      goto LABEL_13;
                    case 420:
                      uint64_t v18 = *v8;
                      id v19 = "AbortSkip_RMXtoMPBX";
                      goto LABEL_13;
                    case 421:
                      uint64_t v18 = *v8;
                      id v19 = "s3eFwVer";
                      goto LABEL_13;
                    case 422:
                      uint64_t v18 = *v8;
                      id v19 = "readVerifyNative";
                      goto LABEL_13;
                    case 423:
                      uint64_t v18 = *v8;
                      id v19 = "reducedReadVerifyNative";
                      goto LABEL_13;
                    case 424:
                      uint64_t v18 = *v8;
                      id v19 = "readVerifySlc";
                      goto LABEL_13;
                    case 425:
                      uint64_t v18 = *v8;
                      id v19 = "reducedReadVerifySlc";
                      goto LABEL_13;
                    case 426:
                      uint64_t v18 = *v8;
                      id v19 = "RxBurnEvictions";
                      goto LABEL_13;
                    case 427:
                      uint64_t v18 = *v8;
                      id v19 = "directToTLCBands";
                      goto LABEL_13;
                    case 428:
                      uint64_t v18 = *v8;
                      id v19 = "nandDesc";
                      goto LABEL_13;
                    case 429:
                      uint64_t v18 = *v8;
                      id v19 = "fwUpdatesPercentUsed";
                      goto LABEL_13;
                    case 430:
                      uint64_t v18 = *v8;
                      id v19 = "slcPercentUsed";
                      goto LABEL_13;
                    case 431:
                      uint64_t v18 = *v8;
                      id v19 = "percentUsed";
                      goto LABEL_13;
                    default:
                      switch(v7)
                      {
                        case 432:
                          uint64_t v18 = *v8;
                          id v19 = "hostAutoWrites";
                          goto LABEL_13;
                        case 433:
                          uint64_t v18 = *v8;
                          id v19 = "hostAutoWriteXacts";
                          goto LABEL_13;
                        case 434:
                          uint64_t v18 = *v8;
                          id v19 = "gcDestDynamic";
                          goto LABEL_13;
                        case 435:
                          uint64_t v18 = *v8;
                          id v19 = "gcDestStatic";
                          goto LABEL_13;
                        case 436:
                          uint64_t v18 = *v8;
                          id v19 = "gcDestWearlevel";
                          goto LABEL_13;
                        case 437:
                          uint64_t v18 = *v8;
                          id v19 = "gcDestParity";
                          goto LABEL_13;
                        case 438:
                          uint64_t v18 = *v8;
                          id v19 = "AbortSkip_Format";
                          goto LABEL_13;
                        case 440:
                          uint64_t v18 = *v8;
                          id v19 = "raidSLCPadding";
                          goto LABEL_13;
                        case 441:
                          uint64_t v18 = *v8;
                          id v19 = "raidGCBands";
                          goto LABEL_13;
                        case 442:
                          uint64_t v18 = *v8;
                          id v19 = "raidGCSectors";
                          goto LABEL_13;
                        case 443:
                          uint64_t v18 = *v8;
                          id v19 = "raidGCPadding";
                          goto LABEL_13;
                        case 444:
                          uint64_t v18 = *v8;
                          id v19 = "raidSLCBandsPerHostFlow";
                          goto LABEL_13;
                        case 445:
                          uint64_t v18 = *v8;
                          id v19 = "raidSLCSecsPerHostFlow";
                          goto LABEL_13;
                        case 446:
                          uint64_t v18 = *v8;
                          id v19 = "rxBurnMinCycleRuns";
                          goto LABEL_13;
                        case 447:
                          uint64_t v18 = *v8;
                          id v19 = "clogNumFastCxt";
                          goto LABEL_13;
                        case 448:
                          uint64_t v18 = *v8;
                          id v19 = "clogNumRapidReboots";
                          goto LABEL_13;
                        case 449:
                          uint64_t v18 = *v8;
                          id v19 = "clogFastCxtAbvThr";
                          goto LABEL_13;
                        case 450:
                          uint64_t v18 = *v8;
                          id v19 = "rxBurnDiffModeRuns";
                          goto LABEL_13;
                        case 452:
                          uint64_t v18 = *v8;
                          id v19 = "indReadVerifyFail";
                          goto LABEL_13;
                        case 453:
                          __int16 v20 = "numOfThrottlingEntriesPerReadLevel";
                          uint64_t v21 = a1;
                          int v22 = 453;
                          goto LABEL_85;
                        case 454:
                          __int16 v20 = "numOfThrottlingEntriesPerWriteLevel";
                          uint64_t v21 = a1;
                          int v22 = 454;
                          goto LABEL_85;
                        case 456:
                          __int16 v20 = "slcFifoDepth";
                          uint64_t v21 = a1;
                          int v22 = 456;
                          goto LABEL_11;
                        case 457:
                          uint64_t v18 = *v8;
                          id v19 = "wcacheSectorsDirtyIdle";
                          goto LABEL_13;
                        case 458:
                          uint64_t v18 = *v8;
                          id v19 = "wcacheDS_SectorsDirtyIdle";
                          goto LABEL_13;
                        case 459:
                          uint64_t v18 = *v8;
                          id v19 = "wcacheFS_MbytesDirtyIdle";
                          goto LABEL_13;
                        case 460:
                          __int16 v20 = "CacheDepthVsThroughput";
                          uint64_t v21 = a1;
                          int v22 = 460;
                          id v14 = v8;
                          unsigned int v15 = 256;
                          goto LABEL_12;
                        case 461:
                          uint64_t v18 = *v8;
                          id v19 = "directToTLCSectors";
                          goto LABEL_13;
                        case 462:
                          uint64_t v18 = *v8;
                          id v19 = "fallbackToWaterfall";
                          goto LABEL_13;
                        case 463:
                          __int16 v20 = "balanceProportionBucketsHistogram";
                          uint64_t v21 = a1;
                          int v22 = 463;
LABEL_320:
                          id v14 = v8;
                          unsigned int v15 = 11;
                          goto LABEL_12;
                        case 464:
                          uint64_t v18 = *v8;
                          id v19 = "lockToTlc";
                          goto LABEL_13;
                        case 465:
                          __int16 v20 = "burstSizeHistogram";
                          uint64_t v21 = a1;
                          int v22 = 465;
                          goto LABEL_11;
                        case 466:
                          __int16 v20 = "qosDirectToTLC";
                          uint64_t v21 = a1;
                          int v22 = 466;
                          goto LABEL_342;
                        case 467:
                          __int16 v20 = "maxQosDirectToTLC";
                          uint64_t v21 = a1;
                          int v22 = 467;
                          goto LABEL_22;
                        case 468:
                          __int16 v20 = "wcacheDirtyAtFlush";
                          uint64_t v21 = a1;
                          int v22 = 468;
                          goto LABEL_85;
                        case 469:
                          __int16 v20 = "raidReconstructSuccessPartition";
                          uint64_t v21 = a1;
                          int v22 = 469;
                          goto LABEL_20;
                        case 470:
                          __int16 v20 = "raidReconstructFailPartition";
                          uint64_t v21 = a1;
                          int v22 = 470;
                          goto LABEL_20;
                        case 471:
                          uint64_t v18 = *v8;
                          id v19 = "raidUncleanBootBandFail";
                          goto LABEL_13;
                        case 472:
                          uint64_t v18 = *v8;
                          id v19 = "raidReconstructFailBandFlowHost";
                          goto LABEL_13;
                        case 473:
                          uint64_t v18 = *v8;
                          id v19 = "raidReconstructFailBandFlowGC";
                          goto LABEL_13;
                        case 476:
                          __int16 v20 = "raidSuccessfulRecoLbaRange";
                          uint64_t v21 = a1;
                          int v22 = 476;
                          goto LABEL_20;
                        case 477:
                          __int16 v20 = "raidFailedRecoLbaRange";
                          uint64_t v21 = a1;
                          int v22 = 477;
                          goto LABEL_20;
                        case 481:
                          __int16 v20 = "skinnyBandErases_481";
                          uint64_t v21 = a1;
                          int v22 = 481;
                          goto LABEL_155;
                        case 483:
                          uint64_t v18 = *v8;
                          id v19 = "tlcOverHeatWaterfall";
                          goto LABEL_13;
                        case 484:
                          uint64_t v18 = *v8;
                          id v19 = "skinnyCyclesConvert";
                          goto LABEL_13;
                        case 485:
                          uint64_t v18 = *v8;
                          id v19 = "non_proportional_directToTLCSectors";
                          goto LABEL_13;
                        case 486:
                          uint64_t v18 = *v8;
                          id v19 = "maxFailedFastCxtSync";
                          goto LABEL_13;
                        case 487:
                          uint64_t v18 = *v8;
                          id v19 = "numFormatUserArea";
                          goto LABEL_13;
                        case 488:
                          uint64_t v18 = *v8;
                          id v19 = "clogFastCxtSyncAborted";
                          goto LABEL_13;
                        case 489:
                          __int16 v20 = "clogOccupationSectors";
                          uint64_t v21 = a1;
                          int v22 = 489;
                          goto LABEL_19;
                        case 490:
                          __int16 v20 = "bdrTmpHist";
                          uint64_t v21 = a1;
                          int v22 = 490;
LABEL_342:
                          id v14 = v8;
                          unsigned int v15 = 64;
                          goto LABEL_12;
                        case 491:
                          uint64_t v18 = *v8;
                          id v19 = "numFWUpdates";
                          goto LABEL_13;
                        case 492:
                          uint64_t v18 = *v8;
                          id v19 = "numClogLoadFails";
                          goto LABEL_13;
                        case 493:
                          uint64_t v18 = *v8;
                          id v19 = "rxBurnNumForcedDiffMode";
                          goto LABEL_13;
                        case 494:
                          uint64_t v18 = *v8;
                          id v19 = "RD_numSaves";
                          goto LABEL_13;
                        case 495:
                          uint64_t v18 = *v8;
                          id v19 = "eanCompressWrites";
                          goto LABEL_13;
                        case 496:
                          uint64_t v18 = *v8;
                          id v19 = "eanHostWrites";
                          goto LABEL_13;
                        case 497:
                          uint64_t v18 = *v8;
                          id v19 = "bandPreErases";
                          goto LABEL_13;
                        case 498:
                          uint64_t v18 = *v8;
                          id v19 = "eanHostUnmaps";
                          goto LABEL_13;
                        case 499:
                          uint64_t v18 = *v8;
                          id v19 = "eanHostFlushes";
                          goto LABEL_13;
                        case 500:
                          uint64_t v18 = *v8;
                          id v19 = "eanFastWrites";
                          goto LABEL_13;
                        case 501:
                          uint64_t v18 = *v8;
                          id v19 = "autowriteDS2FSCollisions";
                          goto LABEL_13;
                        case 502:
                          uint64_t v18 = *v8;
                          id v19 = "autowriteWaitTransferTaskBlocks";
                          goto LABEL_13;
                        case 503:
                          __int16 v20 = "avgCycle";
                          uint64_t v21 = a1;
                          int v22 = 503;
                          goto LABEL_20;
                        case 504:
                          uint64_t v18 = *v8;
                          id v19 = "RD_DeferredClearsOverflowCnt";
                          goto LABEL_13;
                        default:
                          switch(v7)
                          {
                            case 505:
                              uint64_t v18 = *v8;
                              id v19 = "maxVerticsInBand";
                              goto LABEL_13;
                            case 506:
                              uint64_t v18 = *v8;
                              id v19 = "numVertics";
                              goto LABEL_13;
                            case 507:
                              uint64_t v18 = *v8;
                              id v19 = "exceededCVertics";
                              goto LABEL_13;
                            case 510:
                              uint64_t v18 = *v8;
                              id v19 = "raidReconstructFailMismatch";
                              goto LABEL_13;
                            case 511:
                              __int16 v20 = "mspbootBlockRefreshCnt";
                              uint64_t v21 = a1;
                              int v22 = 511;
                              goto LABEL_155;
                            case 516:
                              __int16 v20 = "mspBootBlockRefreshTime";
                              uint64_t v21 = a1;
                              int v22 = 516;
                              goto LABEL_155;
                            case 517:
                              uint64_t v18 = *v8;
                              id v19 = "mspBootBlockCountPerMsp";
                              goto LABEL_13;
                            case 518:
                              uint64_t v18 = *v8;
                              id v19 = "skinnyRevectorSLC";
                              goto LABEL_13;
                            case 519:
                              uint64_t v18 = *v8;
                              id v19 = "skinnyRevectorTLC";
                              goto LABEL_13;
                            case 520:
                              uint64_t v18 = *v8;
                              id v19 = "perfSetupAttempts";
                              goto LABEL_13;
                            case 521:
                              uint64_t v18 = *v8;
                              id v19 = "perfSetupSuccesses";
                              goto LABEL_13;
                            case 522:
                              uint64_t v18 = *v8;
                              id v19 = "perfWriteAttempts";
                              goto LABEL_13;
                            case 523:
                              uint64_t v18 = *v8;
                              id v19 = "perfWriteSuccesses";
                              goto LABEL_13;
                            case 524:
                              uint64_t v18 = *v8;
                              id v19 = "perfReadAttempts";
                              goto LABEL_13;
                            case 525:
                              uint64_t v18 = *v8;
                              id v19 = "perfReadSuccesses";
                              goto LABEL_13;
                            case 526:
                              uint64_t v18 = *v8;
                              id v19 = "perfCleanupAttempts";
                              goto LABEL_13;
                            case 527:
                              uint64_t v18 = *v8;
                              id v19 = "perfCleanupSuccesses";
                              goto LABEL_13;
                            case 530:
                              uint64_t v18 = *v8;
                              id v19 = "firstFailedDieId";
                              goto LABEL_13;
                            case 531:
                              uint64_t v18 = *v8;
                              id v19 = "numDieFailures";
                              goto LABEL_13;
                            case 532:
                              uint64_t v18 = *v8;
                              id v19 = "spareAvailablePercent";
                              goto LABEL_13;
                            case 533:
                              uint64_t v18 = *v8;
                              id v19 = "dataFabricErr";
                              goto LABEL_13;
                            case 534:
                              uint64_t v18 = *v8;
                              id v19 = "downlinkFabricErr";
                              goto LABEL_13;
                            case 535:
                              uint64_t v18 = *v8;
                              id v19 = "prpAccTimeoutErr";
                              goto LABEL_13;
                            case 537:
                              uint64_t v18 = *v8;
                              id v19 = "uplinkFabricErr";
                              goto LABEL_13;
                            case 538:
                              uint64_t v18 = *v8;
                              id v19 = "skinnyBandsGBB";
                              goto LABEL_13;
                            case 539:
                              uint64_t v18 = *v8;
                              id v19 = "AbortPad_GcMustPadBand";
                              goto LABEL_13;
                            case 540:
                              uint64_t v18 = *v8;
                              id v19 = "AbortPad_GcMustPadSkinny";
                              goto LABEL_13;
                            case 541:
                              uint64_t v18 = *v8;
                              id v19 = "bdrHostPingInitial";
                              goto LABEL_13;
                            case 542:
                              uint64_t v18 = *v8;
                              id v19 = "bdrHostPingMoreNeeded";
                              goto LABEL_13;
                            case 543:
                              uint64_t v18 = *v8;
                              id v19 = "bandParityAllocationFailed";
                              goto LABEL_13;
                            case 544:
                              uint64_t v18 = *v8;
                              id v19 = "fastHwBurstToSlc";
                              goto LABEL_13;
                            case 545:
                              uint64_t v18 = *v8;
                              id v19 = "slowHwToTlc";
                              goto LABEL_13;
                            case 546:
                              __int16 v20 = "slcDemandBurstSizeDetected";
                              uint64_t v21 = a1;
                              int v22 = 546;
                              goto LABEL_11;
                            case 547:
                              __int16 v20 = "slcDemandBurstDur";
                              uint64_t v21 = a1;
                              int v22 = 547;
                              goto LABEL_11;
                            case 548:
                              uint64_t v18 = *v8;
                              id v19 = "fastHwToTlcBurst";
                              goto LABEL_13;
                            case 549:
                              __int16 v20 = "slcDemandBurstSizeSlc";
                              uint64_t v21 = a1;
                              int v22 = 549;
                              goto LABEL_11;
                            case 551:
                              __int16 v20 = "balanceProportionBucketsHistogramTlc";
                              uint64_t v21 = a1;
                              int v22 = 551;
                              goto LABEL_320;
                            case 553:
                              uint64_t v18 = *v8;
                              id v19 = "slowHwFlushToSlc";
                              goto LABEL_13;
                            case 557:
                              uint64_t v18 = *v8;
                              id v19 = "slowHwToSlc";
                              goto LABEL_13;
                            case 558:
                              uint64_t v18 = *v8;
                              id v19 = "flushNwToSlc";
                              goto LABEL_13;
                            case 559:
                              uint64_t v18 = *v8;
                              id v19 = "flushNwToTlc";
                              goto LABEL_13;
                            case 560:
                              uint64_t v18 = *v8;
                              id v19 = "oslcHw";
                              goto LABEL_13;
                            case 561:
                              uint64_t v18 = *v8;
                              id v19 = "oslcTransitions";
                              goto LABEL_13;
                            case 563:
                              uint64_t v18 = *v8;
                              id v19 = "slcDemandFlushCount";
                              goto LABEL_13;
                            case 564:
                              uint64_t v18 = *v8;
                              id v19 = "slcDemandBurstCount";
                              goto LABEL_13;
                            case 565:
                              uint64_t v18 = *v8;
                              id v19 = "oslcBaseAvgPE";
                              goto LABEL_13;
                            case 566:
                              uint64_t v18 = *v8;
                              id v19 = "raidReconstructFailNoSPBX";
                              goto LABEL_13;
                            case 567:
                              uint64_t v18 = *v8;
                              id v19 = "raidReconstructFailDouble";
                              goto LABEL_13;
                            case 568:
                              uint64_t v18 = *v8;
                              id v19 = "oslcFastWAmpUOnOff";
                              goto LABEL_13;
                            case 569:
                              uint64_t v18 = *v8;
                              id v19 = "oslcSlowWAmpUOnOff";
                              goto LABEL_13;
                            case 570:
                              uint64_t v18 = *v8;
                              id v19 = "raidReconstructFailInvalid";
                              goto LABEL_13;
                            case 572:
                              uint64_t v18 = *v8;
                              id v19 = "oslcLastWAmpUx10";
                              goto LABEL_13;
                            case 573:
                              uint64_t v18 = *v8;
                              id v19 = "raidFailedReadNoBlog";
                              goto LABEL_13;
                            case 574:
                              uint64_t v18 = *v8;
                              id v19 = "raidReconstructFailBlank";
                              goto LABEL_13;
                            case 575:
                              uint64_t v18 = *v8;
                              id v19 = "oslcHotTLCOnOff";
                              goto LABEL_13;
                            case 576:
                              uint64_t v18 = *v8;
                              id v19 = "gcVPackDestinations";
                              goto LABEL_13;
                            case 581:
                              uint64_t v18 = *v8;
                              id v19 = "averageTLCPECycles";
                              goto LABEL_13;
                            case 582:
                              uint64_t v18 = *v8;
                              id v19 = "averageSLCPECycles";
                              goto LABEL_13;
                            case 583:
                              uint64_t v18 = *v8;
                              id v19 = "numAtomicBoots";
                              goto LABEL_13;
                            case 584:
                              uint64_t v18 = *v8;
                              id v19 = "clogMinorMismatch";
                              goto LABEL_13;
                            case 586:
                              uint64_t v18 = *v8;
                              id v19 = "raidExpectedFailRMXReconstructionInternal";
                              goto LABEL_13;
                            case 587:
                              uint64_t v18 = *v8;
                              id v19 = "raidExpectedFailRMXReconstructionHost";
                              goto LABEL_13;
                            case 588:
                              uint64_t v18 = *v8;
                              id v19 = "oslcGCinvalidations";
                              goto LABEL_13;
                            case 589:
                              uint64_t v18 = *v8;
                              id v19 = "oslcGCActivateReason";
                              goto LABEL_13;
                            default:
                              switch(v7)
                              {
                                case 590:
                                  uint64_t v18 = *v8;
                                  id v19 = "oslcLowCleanBandsUOnOff";
                                  goto LABEL_13;
                                case 591:
                                  uint64_t v18 = *v8;
                                  id v19 = "oslcTooManyGCMustOnOff";
                                  goto LABEL_13;
                                case 592:
                                  uint64_t v18 = *v8;
                                  id v19 = "oslcBaseHostWrites";
                                  goto LABEL_13;
                                case 593:
                                  uint64_t v18 = *v8;
                                  id v19 = "oslcBaseBandErases";
                                  goto LABEL_13;
                                case 594:
                                  uint64_t v18 = *v8;
                                  id v19 = "oslcBdrBands";
                                  goto LABEL_13;
                                case 595:
                                  uint64_t v18 = *v8;
                                  id v19 = "oslcBdrValid";
                                  goto LABEL_13;
                                case 596:
                                  uint64_t v18 = *v8;
                                  id v19 = "unexpectedBlanksInternal";
                                  goto LABEL_13;
                                case 597:
                                  uint64_t v18 = *v8;
                                  id v19 = "unexpectedBlanksOnRV";
                                  goto LABEL_13;
                                case 601:
                                  uint64_t v18 = *v8;
                                  id v19 = "waterfallLockSectors";
                                  goto LABEL_13;
                                case 602:
                                  uint64_t v18 = *v8;
                                  id v19 = "oslcGCActiveWrites";
                                  goto LABEL_13;
                                case 603:
                                  uint64_t v18 = *v8;
                                  id v19 = "chipIdTemperatureSample";
                                  goto LABEL_13;
                                case 604:
                                  uint64_t v18 = *v8;
                                  id v19 = "gcVPackWrites";
                                  goto LABEL_13;
                                case 605:
                                  __int16 v20 = "gcActiveReasons";
                                  uint64_t v21 = a1;
                                  int v22 = 605;
                                  goto LABEL_11;
                                case 606:
                                  uint64_t v18 = *v8;
                                  id v19 = "eanMaxInitTimeMs";
                                  goto LABEL_13;
                                case 607:
                                  uint64_t v18 = *v8;
                                  id v19 = "eanMinToFirstReadTimeMs";
                                  goto LABEL_13;
                                case 608:
                                  uint64_t v18 = *v8;
                                  id v19 = "skinnyAPGMRetire";
                                  goto LABEL_13;
                                case 609:
                                  uint64_t v18 = *v8;
                                  id v19 = "unexpectedBlanksHost";
                                  goto LABEL_13;
                                case 610:
                                  __int16 v20 = "pcieAerCounters";
                                  uint64_t v21 = a1;
                                  int v22 = 610;
                                  goto LABEL_342;
                                case 611:
                                  uint64_t v18 = *v8;
                                  id v19 = "fastHwToTlcBalance";
                                  goto LABEL_13;
                                case 612:
                                  uint64_t v18 = *v8;
                                  id v19 = "perfOSLCRuns";
                                  goto LABEL_13;
                                case 613:
                                  uint64_t v18 = *v8;
                                  id v19 = "slcDemandBurstWritesInGC";
                                  goto LABEL_13;
                                case 614:
                                  uint64_t v18 = *v8;
                                  id v19 = "slcDemandBurstWritesInTT";
                                  goto LABEL_13;
                                case 615:
                                  uint64_t v18 = *v8;
                                  id v19 = "slcDemandBurstWritesInNRP";
                                  goto LABEL_13;
                                case 616:
                                  uint64_t v18 = *v8;
                                  id v19 = "perfTotalDmaMb";
                                  goto LABEL_13;
                                case 617:
                                  uint64_t v18 = *v8;
                                  id v19 = "eanAvgInitTimeMs";
                                  goto LABEL_13;
                                case 618:
                                  uint64_t v18 = *v8;
                                  id v19 = "eanAvgToFirstReadTimeMs";
                                  goto LABEL_13;
                                case 619:
                                  uint64_t v18 = *v8;
                                  id v19 = "eanMaxBootReadTimeMs";
                                  goto LABEL_13;
                                case 620:
                                  uint64_t v18 = *v8;
                                  id v19 = "eanAvgBootReadTimeMs";
                                  goto LABEL_13;
                                case 621:
                                  __int16 v20 = "eanBootReadsHist";
                                  uint64_t v21 = a1;
                                  int v22 = 621;
                                  goto LABEL_11;
                                case 622:
                                  uint64_t v18 = *v8;
                                  id v19 = "maxBgInitTimeMs";
                                  goto LABEL_13;
                                case 623:
                                  uint64_t v18 = *v8;
                                  id v19 = "avgBgInitTimeMs";
                                  goto LABEL_13;
                                case 624:
                                  __int16 v20 = "clogFailReason";
                                  uint64_t v21 = a1;
                                  int v22 = 624;
                                  goto LABEL_85;
                                case 625:
                                  uint64_t v18 = *v8;
                                  id v19 = "eanMinBootReadMBPerSec";
                                  goto LABEL_13;
                                case 626:
                                  uint64_t v18 = *v8;
                                  id v19 = "eanAvgBootReadMBPerSec";
                                  goto LABEL_13;
                                case 627:
                                  uint64_t v18 = *v8;
                                  id v19 = "minSkinnyPECycles";
                                  goto LABEL_13;
                                case 628:
                                  uint64_t v18 = *v8;
                                  id v19 = "maxSkinnyPECycles";
                                  goto LABEL_13;
                                case 629:
                                  uint64_t v18 = *v8;
                                  id v19 = "averageSkinnyPECycles";
                                  goto LABEL_13;
                                case 630:
                                  __int16 v20 = "raidSuccessfulRecoEAN";
                                  uint64_t v21 = a1;
                                  int v22 = 630;
                                  goto LABEL_463;
                                case 631:
                                  __int16 v20 = "raidFailedRecoEAN";
                                  uint64_t v21 = a1;
                                  int v22 = 631;
                                  goto LABEL_463;
                                case 632:
                                  __int16 v20 = "eanFirstReadMode";
                                  uint64_t v21 = a1;
                                  int v22 = 632;
LABEL_463:
                                  id v14 = v8;
                                  unsigned int v15 = 6;
                                  goto LABEL_12;
                                case 635:
                                  uint64_t v18 = *v8;
                                  id v19 = "oslcHwGC";
                                  goto LABEL_13;
                                case 636:
                                  uint64_t v18 = *v8;
                                  id v19 = "oslcHwTT";
                                  goto LABEL_13;
                                case 637:
                                  uint64_t v18 = *v8;
                                  id v19 = "oslcHwNRP";
                                  goto LABEL_13;
                                case 638:
                                  __int16 v20 = "oslcDemandBurstSize";
                                  uint64_t v21 = a1;
                                  int v22 = 638;
                                  goto LABEL_11;
                                case 639:
                                  uint64_t v18 = *v8;
                                  id v19 = "raidReconstructSuccessBandFlowOslc";
                                  goto LABEL_13;
                                case 640:
                                  uint64_t v18 = *v8;
                                  id v19 = "raidReconstructFailBandFlowOslc";
                                  goto LABEL_13;
                                case 641:
                                  uint64_t v18 = *v8;
                                  id v19 = "raidFailSectors";
                                  goto LABEL_13;
                                case 642:
                                  uint64_t v18 = *v8;
                                  id v19 = "eanFailSectors";
                                  goto LABEL_13;
                                case 643:
                                  uint64_t v18 = *v8;
                                  id v19 = "bdrTimeMode";
                                  goto LABEL_13;
                                case 644:
                                  uint64_t v18 = *v8;
                                  id v19 = "raidParityNotSavedP";
                                  goto LABEL_13;
                                case 645:
                                  uint64_t v18 = *v8;
                                  id v19 = "raidParityNotSavedQ";
                                  goto LABEL_13;
                                case 646:
                                  uint64_t v18 = *v8;
                                  id v19 = "raidParityInvalid";
                                  goto LABEL_13;
                                case 647:
                                  uint64_t v18 = *v8;
                                  id v19 = "raidParityUnknown";
                                  goto LABEL_13;
                                case 648:
                                  uint64_t v18 = *v8;
                                  id v19 = "raidParityUnmapped";
                                  goto LABEL_13;
                                case 649:
                                  uint64_t v18 = *v8;
                                  id v19 = "raidParityGCUnc";
                                  goto LABEL_13;
                                case 657:
                                  uint64_t v18 = *v8;
                                  id v19 = "AbortSkip_MPBXProbational";
                                  goto LABEL_13;
                                case 659:
                                  uint64_t v18 = *v8;
                                  id v19 = "raidVerificationReads";
                                  goto LABEL_13;
                                case 666:
                                  uint64_t v18 = *v8;
                                  id v19 = "nofDies";
                                  goto LABEL_13;
                                case 671:
                                  uint64_t v18 = *v8;
                                  id v19 = "skinnyBandsNum";
                                  goto LABEL_13;
                                case 672:
                                  uint64_t v18 = *v8;
                                  id v19 = "skinnyBandsNumDips";
                                  goto LABEL_13;
                                case 674:
                                  __int16 v20 = "oslcNoVotesHw";
                                  uint64_t v21 = a1;
                                  int v22 = 674;
                                  goto LABEL_23;
                                case 675:
                                  uint64_t v18 = *v8;
                                  id v19 = "totalLbas";
                                  goto LABEL_13;
                                case 676:
                                  uint64_t v18 = *v8;
                                  id v19 = "bdrHostPingExtra";
                                  goto LABEL_13;
                                case 677:
                                  uint64_t v18 = *v8;
                                  id v19 = "magazineInstanceMeta";
                                  goto LABEL_13;
                                default:
                                  switch(v7)
                                  {
                                    case 680:
                                      __int16 v20 = "magazineFWVersion";
                                      uint64_t v21 = a1;
                                      int v22 = 680;
                                      goto LABEL_21;
                                    case 681:
                                      uint64_t v18 = *v8;
                                      id v19 = "raidReconstructFailPMXUnsup";
                                      goto LABEL_13;
                                    case 682:
                                      uint64_t v18 = *v8;
                                      id v19 = "raidReconstructFailBMXUnsup";
                                      goto LABEL_13;
                                    case 683:
                                      uint64_t v18 = *v8;
                                      id v19 = "iBootNANDResets";
                                      goto LABEL_13;
                                    case 684:
                                      uint64_t v18 = *v8;
                                      id v19 = "pcieClkreqHighTimeout";
                                      goto LABEL_13;
                                    case 687:
                                      __int16 v20 = "cbdrInitSent";
                                      uint64_t v21 = a1;
                                      int v22 = 687;
LABEL_21:
                                      id v14 = v8;
                                      unsigned int v15 = 3;
                                      goto LABEL_12;
                                    case 688:
                                      uint64_t v18 = *v8;
                                      id v19 = "cbdrPauseSent";
                                      goto LABEL_13;
                                    case 689:
                                      uint64_t v18 = *v8;
                                      id v19 = "cbdrResumeSent";
                                      goto LABEL_13;
                                    case 690:
                                      uint64_t v18 = *v8;
                                      id v19 = "cbdrGetResultSent";
                                      goto LABEL_13;
                                    case 691:
                                      uint64_t v18 = *v8;
                                      id v19 = "cbdrEarlyExits";
                                      goto LABEL_13;
                                    case 694:
                                      __int16 v20 = "cbdrRefreshGrades";
                                      uint64_t v21 = a1;
                                      int v22 = 694;
                                      goto LABEL_11;
                                    case 695:
                                      uint64_t v18 = *v8;
                                      id v19 = "cbdrNotEnoughReads";
                                      goto LABEL_13;
                                    case 696:
                                      uint64_t v18 = *v8;
                                      id v19 = "cbdrAborts";
                                      goto LABEL_13;
                                    case 697:
                                      uint64_t v18 = *v8;
                                      id v19 = "TurboRaidHostClassifications";
                                      goto LABEL_13;
                                    case 698:
                                      uint64_t v18 = *v8;
                                      id v19 = "TurboRaidInternalClassifications";
                                      goto LABEL_13;
                                    case 699:
                                      uint64_t v18 = *v8;
                                      id v19 = "cbdrFullyDone";
                                      goto LABEL_13;
                                    case 702:
                                      __int16 v20 = "vcurve";
                                      uint64_t v21 = a1;
                                      int v22 = 702;
                                      goto LABEL_155;
                                    case 703:
                                      __int16 v20 = "injDepth";
                                      uint64_t v21 = a1;
                                      int v22 = 703;
                                      goto LABEL_153;
                                    case 704:
                                      uint64_t v18 = *v8;
                                      id v19 = "logical_disk_occupied_promiles";
                                      goto LABEL_13;
                                    case 711:
                                      uint64_t v18 = *v8;
                                      id v19 = "raidPrevFailedReconstructSkip";
                                      goto LABEL_13;
                                    case 712:
                                      uint64_t v18 = *v8;
                                      id v19 = "TurboRaidSuccessfulHostAuxReads";
                                      goto LABEL_13;
                                    case 713:
                                      uint64_t v18 = *v8;
                                      id v19 = "TurboRaidSuccessfulInternalAuxReads";
                                      goto LABEL_13;
                                    case 714:
                                      uint64_t v18 = *v8;
                                      id v19 = "turboRaidClassificationReliabilityHost";
                                      goto LABEL_13;
                                    case 715:
                                      uint64_t v18 = *v8;
                                      id v19 = "turboRaidClassificationReliabilityInternal";
                                      goto LABEL_13;
                                    case 716:
                                      uint64_t v18 = *v8;
                                      id v19 = "turboRaidClassificationQualityHost";
                                      goto LABEL_13;
                                    case 717:
                                      uint64_t v18 = *v8;
                                      id v19 = "turboRaidClassificationQualityInternal";
                                      goto LABEL_13;
                                    case 719:
                                      uint64_t v18 = *v8;
                                      id v19 = "skinnyBandErases";
                                      goto LABEL_13;
                                    case 721:
                                      uint64_t v18 = *v8;
                                      id v19 = "gcPDusterDestinations";
                                      goto LABEL_13;
                                    case 722:
                                      uint64_t v18 = *v8;
                                      id v19 = "gcPDusterWrites";
                                      goto LABEL_13;
                                    case 730:
                                      uint64_t v18 = *v8;
                                      id v19 = "rvFails";
                                      goto LABEL_13;
                                    case 737:
                                      uint64_t v18 = *v8;
                                      id v19 = "TurboRaidFailedHostAuxReads";
                                      goto LABEL_13;
                                    case 738:
                                      uint64_t v18 = *v8;
                                      id v19 = "TurboRaidFailedInternalAuxReads";
                                      goto LABEL_13;
                                    case 741:
                                      uint64_t v18 = *v8;
                                      id v19 = "autoSkipTriggers";
                                      goto LABEL_13;
                                    case 742:
                                      uint64_t v18 = *v8;
                                      id v19 = "autoSkipPlanes";
                                      goto LABEL_13;
                                    case 744:
                                      __int16 v20 = "raidReconstructDurationHisto";
                                      uint64_t v21 = a1;
                                      int v22 = 744;
                                      goto LABEL_23;
                                    case 745:
                                      __int16 v20 = "failsOnReconstructHisto";
                                      uint64_t v21 = a1;
                                      int v22 = 745;
                                      goto LABEL_23;
                                    case 746:
                                      uint64_t v18 = *v8;
                                      id v19 = "bandKill_userFlattenExcessive";
                                      goto LABEL_13;
                                    case 747:
                                      uint64_t v18 = *v8;
                                      id v19 = "bandKill_IntFlattenExcessive";
                                      goto LABEL_13;
                                    case 748:
                                      uint64_t v18 = *v8;
                                      id v19 = "bandKill_userFlattenBalance";
                                      goto LABEL_13;
                                    case 749:
                                      uint64_t v18 = *v8;
                                      id v19 = "bandKill_intFlattenBalance";
                                      goto LABEL_13;
                                    case 750:
                                      uint64_t v18 = *v8;
                                      id v19 = "bandKill_formatVertExcessive";
                                      goto LABEL_13;
                                    case 751:
                                      uint64_t v18 = *v8;
                                      id v19 = "bandKill_formatVertBalance";
                                      goto LABEL_13;
                                    case 753:
                                      uint64_t v18 = *v8;
                                      id v19 = "cbdrNumSlowRefreshes";
                                      goto LABEL_13;
                                    case 754:
                                      uint64_t v18 = *v8;
                                      id v19 = "cbdrNumFastRefreshes";
                                      goto LABEL_13;
                                    case 755:
                                      uint64_t v18 = *v8;
                                      id v19 = "cbdrTotalRefreshValidity";
                                      goto LABEL_13;
                                    case 756:
                                      __int16 v20 = "cbdrRefreshedAges";
                                      uint64_t v21 = a1;
                                      int v22 = 756;
                                      goto LABEL_545;
                                    case 758:
                                      uint64_t v18 = *v8;
                                      id v19 = "cbdrSkippedBlocks";
                                      goto LABEL_13;
                                    case 759:
                                      __int16 v20 = "cbdrScanPct";
                                      uint64_t v21 = a1;
                                      int v22 = 759;
                                      goto LABEL_19;
                                    case 760:
                                      uint64_t v18 = *v8;
                                      id v19 = "raidSuccessfulBMXReconstructionInternal";
                                      goto LABEL_13;
                                    case 761:
                                      uint64_t v18 = *v8;
                                      id v19 = "raidSuccessfulBMXReconstructionHost";
                                      goto LABEL_13;
                                    case 762:
                                      uint64_t v18 = *v8;
                                      id v19 = "raidFailedBMXReconstructionInternal";
                                      goto LABEL_13;
                                    case 763:
                                      uint64_t v18 = *v8;
                                      id v19 = "raidFailedBMXReconstructionHost";
                                      goto LABEL_13;
                                    case 764:
                                      uint64_t v18 = *v8;
                                      id v19 = "ricSPRVFail";
                                      goto LABEL_13;
                                    case 765:
                                      uint64_t v18 = *v8;
                                      id v19 = "ricMPRVFail";
                                      goto LABEL_13;
                                    case 767:
                                      __int16 v20 = "cbdrRefreshGradesSLC";
                                      uint64_t v21 = a1;
                                      int v22 = 767;
                                      goto LABEL_11;
                                    case 768:
                                      __int16 v20 = "cbdrRefreshedAgesSLC";
                                      uint64_t v21 = a1;
                                      int v22 = 768;
LABEL_545:
                                      id v14 = v8;
                                      unsigned int v15 = 9;
                                      goto LABEL_12;
                                    case 769:
                                      __int16 v20 = "cbdrScanPctSLC";
                                      uint64_t v21 = a1;
                                      int v22 = 769;
                                      goto LABEL_19;
                                    case 770:
                                      __int16 v20 = "cpuBurstLength";
                                      uint64_t v21 = a1;
                                      int v22 = 770;
                                      goto LABEL_23;
                                    case 771:
                                      uint64_t v18 = *v8;
                                      id v19 = "autoSkipRaidRecoFail";
                                      goto LABEL_13;
                                    case 772:
                                      __int16 v20 = "dmReasonsSlc";
                                      uint64_t v21 = a1;
                                      int v22 = 772;
                                      goto LABEL_155;
                                    case 773:
                                      __int16 v20 = "dmReasonsTlc";
                                      uint64_t v21 = a1;
                                      int v22 = 773;
                                      goto LABEL_155;
                                    case 774:
                                      uint64_t v18 = *v8;
                                      id v19 = "raidReconstructFailBMXAbort";
                                      goto LABEL_13;
                                    case 775:
                                      uint64_t v18 = *v8;
                                      id v19 = "bandKill_fatBindingNoBlocks";
                                      goto LABEL_13;
                                    case 776:
                                      uint64_t v18 = *v8;
                                      id v19 = "bandKill_fatBindingFewBlocks";
                                      goto LABEL_13;
                                    default:
                                      switch(v7)
                                      {
                                        case 777:
                                          uint64_t v18 = *v8;
                                          id v19 = "numBadBootBlocks";
                                          goto LABEL_13;
                                        case 778:
                                          uint64_t v18 = *v8;
                                          id v19 = "snapshotCPUHigh";
                                          goto LABEL_13;
                                        case 779:
                                          uint64_t v18 = *v8;
                                          id v19 = "snapshotCPULow";
                                          goto LABEL_13;
                                        case 780:
                                          uint64_t v18 = *v8;
                                          id v19 = "gcWithoutBMs";
                                          goto LABEL_13;
                                        case 781:
                                          __int16 v20 = "gcSearchTimeHistory";
                                          uint64_t v21 = a1;
                                          int v22 = 781;
                                          goto LABEL_11;
                                        case 785:
                                          __int16 v20 = "gcSearchPortion";
                                          uint64_t v21 = a1;
                                          int v22 = 785;
                                          goto LABEL_85;
                                        case 786:
                                          uint64_t v18 = *v8;
                                          id v19 = "raidReconstructFailBmxMp";
                                          goto LABEL_13;
                                        case 787:
                                          uint64_t v18 = *v8;
                                          id v19 = "raidReconstructFailBmx";
                                          goto LABEL_13;
                                        case 788:
                                          uint64_t v18 = *v8;
                                          id v19 = "raidReconstructFailBMXUECC";
                                          goto LABEL_13;
                                        case 789:
                                          uint64_t v18 = *v8;
                                          id v19 = "raidReconstructFailBMXBlank";
                                          goto LABEL_13;
                                        case 790:
                                          uint64_t v18 = *v8;
                                          id v19 = "raidPrevFailedReconstructBmxMpSkip";
                                          goto LABEL_13;
                                        case 792:
                                          uint64_t v18 = *v8;
                                          id v19 = "numTLCFatBands";
                                          goto LABEL_13;
                                        case 793:
                                          uint64_t v18 = *v8;
                                          id v19 = "fatValidity";
                                          goto LABEL_13;
                                        case 794:
                                          uint64_t v18 = *v8;
                                          id v19 = "fatTotal";
                                          goto LABEL_13;
                                        case 798:
                                          __int16 v20 = "raidBMXFailP";
                                          uint64_t v21 = a1;
                                          int v22 = 798;
                                          goto LABEL_22;
                                        case 799:
                                          __int16 v20 = "raidBMXFailUECC";
                                          uint64_t v21 = a1;
                                          int v22 = 799;
                                          goto LABEL_22;
                                        case 804:
                                          __int16 v20 = "raidBMXFailNoSPBX";
                                          uint64_t v21 = a1;
                                          int v22 = 804;
                                          goto LABEL_22;
                                        case 806:
                                          __int16 v20 = "raidBMXFailBlank";
                                          uint64_t v21 = a1;
                                          int v22 = 806;
                                          goto LABEL_22;
                                        case 809:
                                          __int16 v20 = "raidBMXFailUnsup";
                                          uint64_t v21 = a1;
                                          int v22 = 809;
                                          goto LABEL_22;
                                        case 811:
                                          __int16 v20 = "raidBMXFailMpSkip";
                                          uint64_t v21 = a1;
                                          int v22 = 811;
                                          goto LABEL_22;
                                        case 812:
                                          __int16 v20 = "raidBMXFailAbort";
                                          uint64_t v21 = a1;
                                          int v22 = 812;
                                          goto LABEL_22;
                                        case 813:
                                          uint64_t v18 = *v8;
                                          id v19 = "TurboRaidIsEnabled";
                                          goto LABEL_13;
                                        case 814:
                                          __int16 v20 = "raidBMXFailOther";
                                          uint64_t v21 = a1;
                                          int v22 = 814;
                                          goto LABEL_22;
                                        case 815:
                                          __int16 v20 = "raidBMXSuccess";
                                          uint64_t v21 = a1;
                                          int v22 = 815;
                                          goto LABEL_22;
                                        case 816:
                                          uint64_t v18 = *v8;
                                          id v19 = "skinnyBandsExtraDip";
                                          goto LABEL_13;
                                        case 821:
                                          uint64_t v18 = *v8;
                                          id v19 = "writeAmp";
                                          goto LABEL_13;
                                        case 822:
                                          uint64_t v18 = *v8;
                                          id v19 = "ricMaxClogOnlyPages";
                                          goto LABEL_13;
                                        case 823:
                                          __int16 v20 = "readClassifyStatusesHisto";
                                          uint64_t v21 = a1;
                                          int v22 = 823;
                                          goto LABEL_21;
                                        case 824:
                                          __int16 v20 = "readWithAuxStatusesHisto";
                                          uint64_t v21 = a1;
                                          int v22 = 824;
                                          goto LABEL_11;
                                        case 825:
                                          __int16 v20 = "readReconstructStatusesHisto";
                                          uint64_t v21 = a1;
                                          int v22 = 825;
                                          goto LABEL_11;
                                        case 826:
                                          uint64_t v18 = *v8;
                                          id v19 = "bdrBackupChecks";
                                          goto LABEL_13;
                                        case 827:
                                          uint64_t v18 = *v8;
                                          id v19 = "ricExceedClogOnlyPagesTH";
                                          goto LABEL_13;
                                        case 828:
                                          uint64_t v18 = *v8;
                                          id v19 = "numDipFailures";
                                          goto LABEL_13;
                                        case 831:
                                          uint64_t v18 = *v8;
                                          id v19 = "prefetchNextRange";
                                          goto LABEL_13;
                                        case 862:
                                          uint64_t v18 = *v8;
                                          id v19 = "raidSuccessfulSkip";
                                          goto LABEL_13;
                                        case 863:
                                          uint64_t v18 = *v8;
                                          id v19 = "raidFailedSkip";
                                          goto LABEL_13;
                                        case 864:
                                          uint64_t v18 = *v8;
                                          id v19 = "raidSkipAttempts";
                                          goto LABEL_13;
                                        case 865:
                                          __int16 v20 = "timeOfThrottlingPerLevel";
                                          uint64_t v21 = a1;
                                          int v22 = 865;
                                          goto LABEL_85;
                                        case 866:
                                          __int16 v20 = "timeOfThrottlingPerReadLevel";
                                          uint64_t v21 = a1;
                                          int v22 = 866;
                                          goto LABEL_85;
                                        case 867:
                                          __int16 v20 = "timeOfThrottlingPerWriteLevel";
                                          uint64_t v21 = a1;
                                          int v22 = 867;
                                          goto LABEL_85;
                                        case 868:
                                          __int16 v20 = "dmReasonsSlc_1bc";
                                          uint64_t v21 = a1;
                                          int v22 = 868;
                                          goto LABEL_155;
                                        case 869:
                                          __int16 v20 = "dmReasonsTlc_1bc";
                                          uint64_t v21 = a1;
                                          int v22 = 869;
                                          goto LABEL_155;
                                        case 870:
                                          __int16 v20 = "dmReasonsSlc_1bc_he";
                                          uint64_t v21 = a1;
                                          int v22 = 870;
                                          goto LABEL_155;
                                        case 871:
                                          __int16 v20 = "dmReasonsTlc_1bc_he";
                                          uint64_t v21 = a1;
                                          int v22 = 871;
                                          goto LABEL_155;
                                        case 876:
                                          __int16 v20 = "dmReasonsSlc_mbc";
                                          uint64_t v21 = a1;
                                          int v22 = 876;
                                          goto LABEL_155;
                                        case 877:
                                          __int16 v20 = "dmReasonsTlc_mbc";
                                          uint64_t v21 = a1;
                                          int v22 = 877;
                                          goto LABEL_155;
                                        case 883:
                                          uint64_t v18 = *v8;
                                          id v19 = "clogEmptyProgramms";
                                          goto LABEL_13;
                                        case 884:
                                          uint64_t v18 = *v8;
                                          id v19 = "oslcHwCloseBand";
                                          goto LABEL_13;
                                        case 891:
                                          __int16 v20 = "turboRaidSuccessAuxPartition";
                                          uint64_t v21 = a1;
                                          int v22 = 891;
                                          goto LABEL_20;
                                        case 892:
                                          __int16 v20 = "turboRaidFailAuxPartition";
                                          uint64_t v21 = a1;
                                          int v22 = 892;
                                          goto LABEL_20;
                                        case 893:
                                          __int16 v20 = "turboRaidClassifyQualPartition";
                                          uint64_t v21 = a1;
                                          int v22 = 893;
                                          goto LABEL_20;
                                        case 894:
                                          __int16 v20 = "turboRaidClassifyRelPartition";
                                          uint64_t v21 = a1;
                                          int v22 = 894;
                                          goto LABEL_20;
                                        case 895:
                                          uint64_t v18 = *v8;
                                          id v19 = "IND_pool_freeMinSilo";
                                          goto LABEL_13;
                                        case 896:
                                          uint64_t v18 = *v8;
                                          id v19 = "autoSweepBlocks";
                                          goto LABEL_13;
                                        case 897:
                                          __int16 v20 = "wcWrFragSizes";
                                          uint64_t v21 = a1;
                                          int v22 = 897;
                                          goto LABEL_85;
                                        case 898:
                                          __int16 v20 = "indStateAcrossGcDidNoL";
                                          uint64_t v21 = a1;
                                          int v22 = 898;
                                          goto LABEL_85;
                                        case 899:
                                          __int16 v20 = "indStateAcrossGcDidL";
                                          uint64_t v21 = a1;
                                          int v22 = 899;
                                          goto LABEL_85;
                                        case 900:
                                          uint64_t v18 = *v8;
                                          id v19 = "turboRaidNoClassifyDueToWasRetire";
                                          goto LABEL_13;
                                        case 901:
                                          uint64_t v18 = *v8;
                                          id v19 = "turboRaidNoClassifyDueToOpenBand";
                                          goto LABEL_13;
                                        case 902:
                                          uint64_t v18 = *v8;
                                          id v19 = "turboRaidNoClassifyDueToQualityBlock";
                                          goto LABEL_13;
                                        case 903:
                                          uint64_t v18 = *v8;
                                          id v19 = "turboRaidGbbOpenBand";
                                          goto LABEL_13;
                                        case 904:
                                          uint64_t v18 = *v8;
                                          id v19 = "turboRaidGbbShouldRetireOnRefresh";
                                          goto LABEL_13;
                                        case 905:
                                          __int16 v20 = "turboRaidRelPerBlock";
                                          uint64_t v21 = a1;
                                          int v22 = 905;
                                          goto LABEL_85;
                                        case 906:
                                          __int16 v20 = "turboRaidRelBetweenRefreshesPerBlock";
                                          uint64_t v21 = a1;
                                          int v22 = 906;
                                          goto LABEL_85;
                                        default:
                                          if (v7 <= 1039)
                                          {
                                            switch(v7)
                                            {
                                              case 907:
                                                __int16 v20 = "turboRaidMaxRelBetweenRefreshesPerBlock";
                                                uint64_t v21 = a1;
                                                int v22 = 907;
                                                goto LABEL_85;
                                              case 908:
                                                __int16 v20 = "turboRaidMinRelBetweenRefreshesPerBlock";
                                                uint64_t v21 = a1;
                                                int v22 = 908;
                                                goto LABEL_85;
                                              case 909:
                                              case 910:
                                              case 911:
                                              case 912:
                                              case 913:
                                              case 914:
                                              case 915:
                                              case 916:
                                              case 917:
                                              case 924:
                                              case 925:
                                              case 926:
                                              case 927:
                                              case 928:
                                              case 929:
                                              case 936:
                                              case 941:
                                              case 945:
                                              case 946:
                                              case 947:
                                              case 949:
                                              case 950:
                                              case 952:
                                              case 954:
                                              case 955:
                                              case 956:
                                              case 957:
                                              case 958:
                                              case 959:
                                              case 960:
                                              case 963:
                                              case 964:
                                              case 965:
                                              case 966:
                                              case 968:
                                              case 969:
                                              case 970:
                                                goto LABEL_696;
                                              case 918:
                                                __int16 v20 = "turboRaidMaxCyclesBetweenRel";
                                                uint64_t v21 = a1;
                                                int v22 = 918;
                                                goto LABEL_85;
                                              case 919:
                                                __int16 v20 = "turboRaidMinCyclesBetweenRel";
                                                uint64_t v21 = a1;
                                                int v22 = 919;
                                                goto LABEL_85;
                                              case 920:
                                                __int16 v20 = "turboRaidAuxPerBlock";
                                                uint64_t v21 = a1;
                                                int v22 = 920;
                                                goto LABEL_85;
                                              case 921:
                                                __int16 v20 = "turboRaidAuxBetweenRefreshesPerBlock";
                                                uint64_t v21 = a1;
                                                int v22 = 921;
                                                goto LABEL_85;
                                              case 922:
                                                uint64_t v18 = *v8;
                                                id v19 = "turboRaidRelLockMark";
                                                goto LABEL_13;
                                              case 923:
                                                uint64_t v18 = *v8;
                                                id v19 = "turboRaidAuxLockMark";
                                                goto LABEL_13;
                                              case 930:
                                                __int16 v20 = "turboRaidMaxCyclesBetweenAux";
                                                uint64_t v21 = a1;
                                                int v22 = 930;
                                                goto LABEL_85;
                                              case 931:
                                                __int16 v20 = "turboRaidMinCyclesBetweenAux";
                                                uint64_t v21 = a1;
                                                int v22 = 931;
                                                goto LABEL_85;
                                              case 932:
                                                __int16 v20 = "turboRaidLastRelPECycles";
                                                uint64_t v21 = a1;
                                                int v22 = 932;
                                                goto LABEL_85;
                                              case 933:
                                                __int16 v20 = "turboRaidRelQualPECycles";
                                                uint64_t v21 = a1;
                                                int v22 = 933;
                                                goto LABEL_85;
                                              case 934:
                                                __int16 v20 = "turboRaidLastAuxPECycles";
                                                uint64_t v21 = a1;
                                                int v22 = 934;
                                                goto LABEL_85;
                                              case 935:
                                                __int16 v20 = "turboRaidAuxQualPECycles";
                                                uint64_t v21 = a1;
                                                int v22 = 935;
                                                goto LABEL_85;
                                              case 937:
                                                uint64_t v18 = *v8;
                                                id v19 = "turboRaidPEFailAfterRel";
                                                goto LABEL_13;
                                              case 938:
                                                uint64_t v18 = *v8;
                                                id v19 = "turboRaidPEFailAfterAux";
                                                goto LABEL_13;
                                              case 939:
                                                uint64_t v18 = *v8;
                                                id v19 = "dvfmVotesCPU";
                                                goto LABEL_13;
                                              case 940:
                                                uint64_t v18 = *v8;
                                                id v19 = "dvfmVotesBandwidth";
                                                goto LABEL_13;
                                              case 942:
                                                uint64_t v18 = *v8;
                                                id v19 = "maxSLCEndurance";
                                                goto LABEL_13;
                                              case 943:
                                                uint64_t v18 = *v8;
                                                id v19 = "maxMixedEndurance";
                                                goto LABEL_13;
                                              case 944:
                                                uint64_t v18 = *v8;
                                                id v19 = "maxNativeEndurance";
                                                goto LABEL_13;
                                              case 948:
                                                __int16 v20 = "assertHistory";
                                                uint64_t v21 = a1;
                                                int v22 = 948;
                                                id v14 = v8;
                                                unsigned int v15 = 40;
                                                goto LABEL_12;
                                              case 951:
                                                uint64_t v18 = *v8;
                                                id v19 = "asp3Support";
                                                goto LABEL_13;
                                              case 953:
                                                uint64_t v18 = *v8;
                                                id v19 = "numCrossTempRaidUecc";
                                                goto LABEL_13;
                                              case 961:
                                                uint64_t v18 = *v8;
                                                id v19 = "osBuildStr";
                                                goto LABEL_13;
                                              case 962:
                                                uint64_t v18 = *v8;
                                                id v19 = "raidConfig";
                                                goto LABEL_13;
                                              case 967:
                                                __int16 v20 = "indTrimFrags";
                                                uint64_t v21 = a1;
                                                int v22 = 967;
                                                goto LABEL_153;
                                              case 971:
                                                __int16 v20 = "indUsedFrags";
                                                uint64_t v21 = a1;
                                                int v22 = 971;
                                                goto LABEL_153;
                                              default:
                                                switch(v7)
                                                {
                                                  case 996:
                                                    uint64_t v18 = *v8;
                                                    id v16 = (void *)a1;
                                                    id v19 = "clogFindFail";
                                                    goto LABEL_14;
                                                  case 997:
                                                    uint64_t v18 = *v8;
                                                    id v16 = (void *)a1;
                                                    id v19 = "clogFindBlank";
                                                    goto LABEL_14;
                                                  case 998:
                                                    uint64_t v18 = *v8;
                                                    id v16 = (void *)a1;
                                                    id v19 = "clogFindUnc";
                                                    goto LABEL_14;
                                                  case 999:
                                                    uint64_t v18 = *v8;
                                                    id v16 = (void *)a1;
                                                    id v19 = "clogFindUnexpected";
                                                    goto LABEL_14;
                                                  case 1001:
                                                    uint64_t v21 = a1;
                                                    int v22 = 1001;
                                                    __int16 v20 = "clogReplayFailReason";
                                                    goto LABEL_23;
                                                  case 1002:
                                                    uint64_t v18 = *v8;
                                                    id v16 = (void *)a1;
                                                    id v19 = "clogReplayTransientError";
                                                    goto LABEL_14;
                                                  case 1003:
                                                    uint64_t v18 = *v8;
                                                    id v16 = (void *)a1;
                                                    id v19 = "clogReplaySpfError";
                                                    goto LABEL_14;
                                                  case 1015:
                                                    uint64_t v21 = a1;
                                                    int v22 = 1015;
                                                    __int16 v20 = "eanEarlyBootUeccPage";
                                                    goto LABEL_22;
                                                  case 1016:
                                                    uint64_t v18 = *v8;
                                                    id v16 = (void *)a1;
                                                    id v19 = "eanEarlyBootNumUeccPages";
                                                    goto LABEL_14;
                                                  case 1017:
                                                    uint64_t v18 = *v8;
                                                    id v16 = (void *)a1;
                                                    id v19 = "eanEarlyBootUeccMultiplane";
                                                    goto LABEL_14;
                                                  default:
                                                    goto LABEL_696;
                                                }
                                            }
                                          }

                                          if (v7 <= 1137)
                                          {
                                            if (v7 > 1104)
                                            {
                                              if (v7 > 1115)
                                              {
                                                if (v7 == 1116)
                                                {
                                                  uint64_t v21 = a1;
                                                  int v22 = 1116;
                                                  __int16 v20 = "gcwamp";
LABEL_155:
                                                  id v14 = v8;
                                                  unsigned int v15 = 32;
                                                  goto LABEL_12;
                                                }

                                                if (v7 == 1137)
                                                {
                                                  uint64_t v18 = *v8;
                                                  id v16 = (void *)a1;
                                                  id v19 = "numOfToUnhappySwitches";
                                                  goto LABEL_14;
                                                }
                                              }

                                              else
                                              {
                                                if (v7 == 1105)
                                                {
                                                  uint64_t v21 = a1;
                                                  int v22 = 1105;
                                                  __int16 v20 = "hostReadSequential";
                                                  goto LABEL_703;
                                                }

                                                if (v7 == 1106)
                                                {
                                                  uint64_t v21 = a1;
                                                  int v22 = 1106;
                                                  __int16 v20 = "GCReadSequential";
LABEL_703:
                                                  id v14 = v8;
                                                  unsigned int v15 = 14;
                                                  goto LABEL_12;
                                                }
                                              }
                                            }

                                            else
                                            {
                                              if (v7 <= 1041)
                                              {
                                                uint64_t v21 = a1;
                                                if (v7 == 1040)
                                                {
                                                  int v22 = 1040;
                                                  __int16 v20 = "bandsAgeBinsV2";
                                                }

                                                else
                                                {
                                                  int v22 = 1041;
                                                  __int16 v20 = "bandsAgeBinsSnapshot";
                                                }

                                                id v14 = v8;
                                                unsigned int v15 = 31;
                                                goto LABEL_12;
                                              }

                                              if (v7 == 1042)
                                              {
                                                uint64_t v21 = a1;
                                                int v22 = 1042;
                                                __int16 v20 = "bandsAgeBinsReadSectors";
                                                id v14 = v8;
                                                unsigned int v15 = 15;
LABEL_12:
                                                sub_100020640(v21, v22, v20, v14, v15);
                                                goto LABEL_15;
                                              }

                                              if (v7 == 1080)
                                              {
                                                uint64_t v18 = *v8;
                                                id v16 = (void *)a1;
                                                id v19 = "raidForceClogLoad";
                                                goto LABEL_14;
                                              }
                                            }

LABEL_696:
                                            switch(v7)
                                            {
                                              case 1196:
                                                uint64_t v21 = a1;
                                                int v22 = 1196;
                                                __int16 v20 = "poDetectGBBedTotalCost";
                                                goto LABEL_19;
                                              case 1197:
                                                uint64_t v21 = a1;
                                                int v22 = 1197;
                                                __int16 v20 = "poDetectGBBedAge";
                                                goto LABEL_11;
                                              case 1198:
                                                uint64_t v21 = a1;
                                                int v22 = 1198;
                                                __int16 v20 = "poDetectPERemovalMostSevereCost";
                                                goto LABEL_21;
                                              case 1199:
                                                uint64_t v18 = *v8;
                                                id v16 = (void *)a1;
                                                id v19 = "poDetectCurrentSize";
                                                goto LABEL_14;
                                              case 1200:
                                              case 1203:
                                              case 1204:
                                              case 1205:
                                              case 1206:
                                              case 1207:
                                              case 1208:
                                              case 1209:
                                              case 1210:
                                              case 1212:
                                              case 1213:
                                              case 1214:
                                              case 1219:
                                              case 1220:
                                              case 1221:
                                              case 1222:
                                              case 1223:
                                                break;
                                              case 1201:
                                                uint64_t v21 = a1;
                                                int v22 = 1201;
                                                __int16 v20 = "gcVerticalSuccssfulAlignments";
                                                goto LABEL_22;
                                              case 1202:
                                                uint64_t v21 = a1;
                                                int v22 = 1202;
                                                __int16 v20 = "gcVerticalNoAlignmentDueToMissingSegs";
                                                goto LABEL_22;
                                              case 1211:
                                                uint64_t v21 = a1;
                                                int v22 = 1211;
                                                __int16 v20 = "forcedAllocationSmallEraseQ";
                                                goto LABEL_716;
                                              case 1215:
                                                uint64_t v21 = a1;
                                                int v22 = 1215;
                                                __int16 v20 = "hostWritesPerThrottleZone";
                                                goto LABEL_19;
                                              case 1216:
                                                uint64_t v21 = a1;
                                                int v22 = 1216;
                                                __int16 v20 = "tlcWLPerDipAvgPEC";
                                                goto LABEL_716;
                                              case 1217:
                                                uint64_t v21 = a1;
                                                int v22 = 1217;
                                                __int16 v20 = "tlcWLPerDipMaxPEC";
                                                goto LABEL_716;
                                              case 1218:
                                                uint64_t v21 = a1;
                                                int v22 = 1218;
                                                __int16 v20 = "tlcWLPerDipMinPEC";
                                                goto LABEL_716;
                                              case 1224:
                                                uint64_t v21 = a1;
                                                int v22 = 1224;
                                                __int16 v20 = "apfsValidLbaOvershoot";
                                                id v14 = v8;
                                                unsigned int v15 = 20;
                                                goto LABEL_12;
                                              default:
                                                switch(v7)
                                                {
                                                  case 1232:
                                                    uint64_t v18 = *v8;
                                                    id v16 = (void *)a1;
                                                    id v19 = "eanFastSize";
                                                    goto LABEL_14;
                                                  case 1233:
                                                    uint64_t v18 = *v8;
                                                    id v16 = (void *)a1;
                                                    id v19 = "eanNumSlcEvictions";
                                                    goto LABEL_14;
                                                  case 1234:
                                                    uint64_t v18 = *v8;
                                                    id v16 = (void *)a1;
                                                    id v19 = "eanNumForcedCompress";
                                                    goto LABEL_14;
                                                  case 1235:
                                                  case 1236:
                                                  case 1237:
                                                  case 1238:
                                                  case 1239:
                                                  case 1240:
                                                  case 1242:
                                                  case 1243:
                                                  case 1245:
                                                    goto LABEL_15;
                                                  case 1241:
                                                    uint64_t v21 = a1;
                                                    int v22 = 1241;
                                                    __int16 v20 = "s2rTimeHisto";
                                                    goto LABEL_11;
                                                  case 1244:
                                                    uint64_t v18 = *v8;
                                                    id v16 = (void *)a1;
                                                    id v19 = "calendarTimeWentBackward";
                                                    goto LABEL_14;
                                                  case 1246:
                                                    uint64_t v21 = a1;
                                                    int v22 = 1246;
                                                    __int16 v20 = "bandsUeccCrossTempHisto";
                                                    goto LABEL_23;
                                                  default:
                                                    if (v7 != 1190) {
                                                      goto LABEL_15;
                                                    }
                                                    uint64_t v21 = a1;
                                                    int v22 = 1190;
                                                    __int16 v20 = "powerDownTime";
                                                    break;
                                                }

                                                goto LABEL_153;
                                            }
                                          }

                                          else
                                          {
                                            switch(v7)
                                            {
                                              case 1147:
                                                uint64_t v21 = a1;
                                                int v22 = 1147;
                                                __int16 v20 = "gc_concurrent_dw_gc12";
                                                goto LABEL_716;
                                              case 1148:
                                                uint64_t v21 = a1;
                                                int v22 = 1148;
                                                __int16 v20 = "gc_concurrent_dw_gc1";
                                                goto LABEL_716;
                                              case 1149:
                                                uint64_t v21 = a1;
                                                int v22 = 1149;
                                                __int16 v20 = "gc_concurrent_dw_gc2";
LABEL_716:
                                                id v14 = v8;
                                                unsigned int v15 = 24;
                                                goto LABEL_12;
                                              case 1150:
                                              case 1151:
                                              case 1152:
                                              case 1153:
                                              case 1154:
                                              case 1155:
                                              case 1156:
                                              case 1159:
                                              case 1160:
                                              case 1161:
                                              case 1162:
                                              case 1163:
                                              case 1164:
                                              case 1165:
                                              case 1166:
                                              case 1167:
                                              case 1170:
                                              case 1173:
                                              case 1174:
                                              case 1175:
                                              case 1176:
                                              case 1177:
                                              case 1178:
                                                goto LABEL_696;
                                              case 1157:
                                                uint64_t v18 = *v8;
                                                id v16 = (void *)a1;
                                                id v19 = "eanMaxForceROTimeMs";
                                                break;
                                              case 1158:
                                                uint64_t v18 = *v8;
                                                id v16 = (void *)a1;
                                                id v19 = "eanMaxForceRORecoTimeMs";
                                                break;
                                              case 1168:
                                                uint64_t v21 = a1;
                                                int v22 = 1168;
                                                __int16 v20 = "poDetectPERemovalTotalCost";
                                                goto LABEL_20;
                                              case 1169:
                                                uint64_t v21 = a1;
                                                int v22 = 1169;
                                                __int16 v20 = "poDetectEmptySpotRemovalTotalCost";
                                                goto LABEL_20;
                                              case 1171:
                                                uint64_t v21 = a1;
                                                int v22 = 1171;
                                                __int16 v20 = "poDetectEmptySpotRemovalAge";
                                                goto LABEL_11;
                                              case 1172:
                                                uint64_t v21 = a1;
                                                int v22 = 1172;
                                                __int16 v20 = "poDetectGBBedMostSevereCost";
                                                goto LABEL_21;
                                              case 1179:
                                                uint64_t v21 = a1;
                                                int v22 = 1179;
                                                __int16 v20 = "gc_cur_dw_gc1";
                                                goto LABEL_22;
                                              case 1180:
                                                uint64_t v21 = a1;
                                                int v22 = 1180;
                                                __int16 v20 = "gc_cur_dw_gc2";
                                                goto LABEL_22;
                                              case 1181:
                                                uint64_t v21 = a1;
                                                int v22 = 1181;
                                                __int16 v20 = "gc_cur_dw_gc3";
                                                goto LABEL_22;
                                              case 1182:
                                                uint64_t v21 = a1;
                                                int v22 = 1182;
                                                __int16 v20 = "gc_tot_dw_gc1";
                                                goto LABEL_22;
                                              case 1183:
                                                uint64_t v21 = a1;
                                                int v22 = 1183;
                                                __int16 v20 = "gc_tot_dw_gc2";
                                                goto LABEL_22;
                                              case 1184:
                                                uint64_t v18 = *v8;
                                                id v16 = (void *)a1;
                                                id v19 = "unhappy_state";
                                                break;
                                              case 1185:
                                                uint64_t v18 = *v8;
                                                id v16 = (void *)a1;
                                                id v19 = "unhappy_level";
                                                break;
                                              default:
                                                if (v7 == 1138)
                                                {
                                                  uint64_t v18 = *v8;
                                                  id v16 = (void *)a1;
                                                  id v19 = "numOfToHappySwitches";
                                                }

                                                else
                                                {
                                                  if (v7 != 1189) {
                                                    goto LABEL_696;
                                                  }
                                                  uint64_t v18 = *v8;
                                                  id v16 = (void *)a1;
                                                  id v19 = "lastLbaFormatTime";
                                                }

                                                break;
                                            }

LABEL_15:
                                          a2 = &v8[v10];
                                          unsigned int v6 = v11 - v10;
                                          if (v11 != (_DWORD)v10) {
                                            continue;
                                          }
                                          uint64_t result = 1LL;
                                          break;
                                      }

                                      break;
                                  }

                                  break;
                              }

                              break;
                          }

                          break;
                      }

                      break;
                  }

                  break;
              }

              break;
          }

          break;
      }
    }

    else
    {
      uint64_t result = 0LL;
      *(_DWORD *)(a1 + 32) = 0;
    }

    return result;
  }

                                        sub_10001BA0C(v19, a2, a3, a4, a5, a6, a7, a8, v23);
                                        goto LABEL_16;
                                      }

                                      if (v12 <= 1104)
                                      {
                                        if (v12 <= 1041)
                                        {
                                          if (v12 == 1040)
                                          {
                                            if ((_DWORD)v14 != 31) {
                                              sub_10001BA0C( "ASPFTLParseBufferToCxt: bandsAgeBinsV2(1040): (#31) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                            }
                                            else {
                                              __int16 v20 = v14;
                                            }
                                            if ((sub_10002B6E0(a1, "bandsAgeBinsV2_", (uint64_t)v8, 8u, v20) & 1) == 0)
                                            {
                                              int v22 = "ASPFTLParseBufferToCxt: bandsAgeBinsV2(1040): Cannot add 31 elements to context";
                                              goto LABEL_2247;
                                            }
                                          }

                                          else
                                          {
                                            if ((_DWORD)v14 != 31) {
                                              sub_10001BA0C( "ASPFTLParseBufferToCxt: bandsAgeBinsSnapshot(1041): (#31) cfg elements ! = (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                            }
                                            else {
                                              __int16 v20 = v14;
                                            }
                                            if ((sub_10002B6E0(a1, "bandsAgeBinsSnapshot_", (uint64_t)v8, 8u, v20) & 1) == 0)
                                            {
                                              int v22 = "ASPFTLParseBufferToCxt: bandsAgeBinsSnapshot(1041): Cannot add 31 el"
                                                    "ements to context";
                                              goto LABEL_2247;
                                            }
                                          }

                                          goto LABEL_14;
                                        }

                                        if (v12 == 1042)
                                        {
                                          if ((_DWORD)v14 != 15) {
                                            sub_10001BA0C( "ASPFTLParseBufferToCxt: bandsAgeBinsReadSectors(1042): (#15) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                          }
                                          else {
                                            __int16 v20 = v14;
                                          }
                                          if ((sub_10002B6E0(a1, "bandsAgeBinsReadSectors_", (uint64_t)v8, 8u, v20) & 1) == 0)
                                          {
                                            int v22 = "ASPFTLParseBufferToCxt: bandsAgeBinsReadSectors(1042): Cannot add 15 e"
                                                  "lements to context";
                                            goto LABEL_2247;
                                          }

                                          goto LABEL_14;
                                        }

                                        if (v12 == 1080)
                                        {
                                          if ((sub_10002B6E0(a1, "raidForceClogLoad", (uint64_t)v8, 8u, 1u) & 1) == 0)
                                          {
                                            id v19 = "ASPFTLParseBufferToCxt: raidForceClogLoad(1080) cannot add 1 element to context";
                                            goto LABEL_15;
                                          }

uint64_t sub_100020640(uint64_t result, int a2, const char *a3, uint64_t *a4, unsigned int a5)
{
  int v7 = (void *)result;
  uint64_t v8 = *a4;
  if (a2 <= 44)
  {
    switch(a2)
    {
      case 4:
        *(void *)(result + 72) = v8;
        if (a5) {
          goto LABEL_42;
        }
        return result;
      case 5:
      case 6:
      case 8:
      case 9:
      case 10:
      case 11:
      case 14:
      case 15:
      case 16:
        goto LABEL_41;
      case 7:
        *(void *)(result + 64) = v8;
        if (a5) {
          goto LABEL_42;
        }
        return result;
      case 12:
        *(void *)(result + 144) = v8;
        if (a5) {
          goto LABEL_42;
        }
        return result;
      case 13:
        *(void *)(result + 152) = v8;
        if (a5) {
          goto LABEL_42;
        }
        return result;
      case 17:
        *(void *)(result + 8_Block_object_dispose((const void *)(v34 - 144), 8) = v8;
        if (a5) {
          goto LABEL_42;
        }
        return result;
      case 18:
        *(void *)(result + 104) = v8;
        if (a5) {
          goto LABEL_42;
        }
        return result;
      case 19:
        *(void *)(result + 96) = v8;
        if (a5) {
          goto LABEL_42;
        }
        return result;
      case 20:
        *(void *)(result + 112) = v8;
        if (a5) {
          goto LABEL_42;
        }
        return result;
      default:
        if (a2 != 28) {
          goto LABEL_41;
        }
        *(void *)(result + 16_Block_object_dispose((const void *)(v34 - 144), 8) = v8;
        if (!a5) {
          return result;
        }
        goto LABEL_42;
    }
  }

  switch(a2)
  {
    case '-':
      *(void *)(result + 176) = v8;
      if (a5) {
        goto LABEL_42;
      }
      return result;
    case '.':
    case '/':
    case '6':
    case '7':
      goto LABEL_41;
    case '0':
      *(void *)(result + 80) = v8;
      if (!a5) {
        return result;
      }
      goto LABEL_42;
    case '1':
      *(_DWORD *)(result + 56) = v8;
      if (!a5) {
        return result;
      }
      goto LABEL_42;
    case '2':
      *(_DWORD *)(result + 52) = v8;
      if (!a5) {
        return result;
      }
      goto LABEL_42;
    case '3':
      *(_DWORD *)(result + 4_Block_object_dispose((const void *)(v34 - 144), 8) = v8;
      if (!a5) {
        return result;
      }
      goto LABEL_42;
    case '4':
      *(_DWORD *)(result + 44) = v8;
      if (!a5) {
        return result;
      }
      goto LABEL_42;
    case '5':
      *(_DWORD *)(result + 32) = v8;
      goto LABEL_41;
    case '8':
      *(void *)(result + 160) = v8;
      if (!a5) {
        return result;
      }
      goto LABEL_42;
    default:
      if (a2 != 265) {
        goto LABEL_41;
      }
      if (a5)
      {
        uint64_t v9 = a5;
        unint64_t v10 = (void *)(result + 184);
        unsigned int v11 = a4;
        do
        {
          uint64_t v12 = *v11++;
          *v10++ = v12;
          --v9;
        }

        while (v9);
LABEL_41:
        if (a5)
        {
LABEL_42:
          if (a5 == 1)
          {
            return sub_1000322D0((void *)result, "", a3, v8);
          }

          else
          {
            uint64_t v13 = 0LL;
            uint64_t v14 = a5;
            do
            {
              snprintf(__str, 0x64uLL, "%d", v13);
              __str[100] = 0;
              uint64_t result = sub_1000322D0(v7, a3, __str, a4[v13++]);
            }

            while (v14 != v13);
          }
        }
      }

      return result;
  }

double sub_100020888(uint64_t a1)
{
  id v2 = *(void **)a1;
  if (v2)
  {
    do
    {
      id v3 = (void *)v2[14];
      free(v2);
      id v2 = v3;
    }

    while (v3);
  }

  int v4 = *(void **)(a1 + 16);
  if (v4)
  {
    do
    {
      int v5 = (void *)v4[14];
      free(v4);
      int v4 = v5;
    }

    while (v5);
  }

  double result = 0.0;
  *(_OWORD *)(a1 + 20_Block_object_dispose((const void *)(v34 - 144), 8) = 0u;
  *(_OWORD *)(a1 + 224) = 0u;
  *(_OWORD *)(a1 + 176) = 0u;
  *(_OWORD *)(a1 + 192) = 0u;
  *(_OWORD *)(a1 + 144) = 0u;
  *(_OWORD *)(a1 + 160) = 0u;
  *(_OWORD *)(a1 + 112) = 0u;
  *(_OWORD *)(a1 + 12_Block_object_dispose((const void *)(v34 - 144), 8) = 0u;
  *(_OWORD *)(a1 + 80) = 0u;
  *(_OWORD *)(a1 + 96) = 0u;
  *(_OWORD *)(a1 + 4_Block_object_dispose((const void *)(v34 - 144), 8) = 0u;
  *(_OWORD *)(a1 + 64) = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)a1 = 0u;
  return result;
}

uint64_t sub_1000208F8( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8 = (unint64_t *)a2;
  uint64_t v10 = 0LL;
  unsigned int v11 = a3 >> 3;
  *(_OWORD *)__str = 0u;
  __int128 v25 = 0u;
  do
  {
LABEL_2:
    if (!v11) {
      return v10;
    }
    unint64_t v13 = *v8++;
    int v12 = v13;
    unint64_t v14 = HIDWORD(v13);
    --v11;
  }

  while (!HIDWORD(v13));
  uint64_t v17 = (v12 - 1);
  if (v17 <= 0x47) {
    __asm { BR              X9 }
  }

  uint64_t v18 = (v12 - 73);
  if (v18 <= 0x46) {
    __asm { BR              X9 }
  }

  switch(v12)
  {
    case 144:
      id v19 = "ASPFTLParseBufferToCxt: numMemExtreme(144) cannot add 1 element to context";
      goto LABEL_15;
    case 145:
      id v19 = "ASPFTLParseBufferToCxt: maxMemExtremeDuration(145) cannot add 1 element to context";
      goto LABEL_15;
    case 146:
      id v19 = "ASPFTLParseBufferToCxt: memExtremeDuration(146) cannot add 1 element to context";
      goto LABEL_15;
    case 147:
      id v19 = "ASPFTLParseBufferToCxt: bandGetsExtreme(147) cannot add 1 element to context";
      goto LABEL_15;
    case 148:
      id v19 = "ASPFTLParseBufferToCxt: bandGetsLow(148) cannot add 1 element to context";
      goto LABEL_15;
    case 149:
      id v19 = "ASPFTLParseBufferToCxt: numHostChoke(149) cannot add 1 element to context";
      goto LABEL_15;
    case 152:
      id v19 = "ASPFTLParseBufferToCxt: AbortSkip_ProgramError(152) cannot add 1 element to context";
      goto LABEL_15;
    case 153:
      id v19 = "ASPFTLParseBufferToCxt: AbortSkip_ReadErrorOpenBand(153) cannot add 1 element to context";
      goto LABEL_15;
    case 154:
      id v19 = "ASPFTLParseBufferToCxt: AbortSkip_FailedRebuildingParity(154) cannot add 1 element to context";
      goto LABEL_15;
    case 155:
      id v19 = "ASPFTLParseBufferToCxt: AbortPad_OpenRefreshBand(155) cannot add 1 element to context";
      goto LABEL_15;
    case 156:
      id v19 = "ASPFTLParseBufferToCxt: AbortPad_CloseBands(156) cannot add 1 element to context";
      goto LABEL_15;
    case 157:
      id v19 = "ASPFTLParseBufferToCxt: AbortPad_SetPhoto(157) cannot add 1 element to context";
      goto LABEL_15;
    case 158:
      id v19 = "ASPFTLParseBufferToCxt: AbortPad_GcNoSource(158) cannot add 1 element to context";
      goto LABEL_15;
    case 159:
      id v19 = "ASPFTLParseBufferToCxt: AbortPad_Format(159) cannot add 1 element to context";
      goto LABEL_15;
    case 160:
      id v19 = "ASPFTLParseBufferToCxt: nandDiscoveryDuration(160) cannot add 1 element to context";
      goto LABEL_15;
    case 161:
      id v19 = "ASPFTLParseBufferToCxt: coreCCEnableDuration(161) cannot add 1 element to context";
      goto LABEL_15;
    case 163:
      id v19 = "ASPFTLParseBufferToCxt: coreOpenDuration(163) cannot add 1 element to context";
      goto LABEL_15;
    case 164:
      id v19 = "ASPFTLParseBufferToCxt: coreWritableDuration(164) cannot add 1 element to context";
      goto LABEL_15;
    case 165:
      id v19 = "ASPFTLParseBufferToCxt: coreClogLoadDuration(165) cannot add 1 element to context";
      goto LABEL_15;
    case 167:
      id v19 = "ASPFTLParseBufferToCxt: bulkPFail(167) cannot add 1 element to context";
      goto LABEL_15;
    case 169:
      id v19 = "ASPFTLParseBufferToCxt: bulkRFail(169) cannot add 1 element to context";
      goto LABEL_15;
    case 172:
      id v19 = "ASPFTLParseBufferToCxt: raidSmartErrors(172) cannot add 1 element to context";
      goto LABEL_15;
    case 182:
      id v19 = "ASPFTLParseBufferToCxt: internalUeccs(182) cannot add 1 element to context";
      goto LABEL_15;
    case 183:
      id v19 = "ASPFTLParseBufferToCxt: e2eFail(183) cannot add 1 element to context";
      goto LABEL_15;
    case 184:
      id v19 = "ASPFTLParseBufferToCxt: TempSensorMax(184) cannot add 1 element to context";
      goto LABEL_15;
    case 185:
      id v19 = "ASPFTLParseBufferToCxt: TempSensorMin(185) cannot add 1 element to context";
      goto LABEL_15;
    case 186:
      id v19 = "ASPFTLParseBufferToCxt: powerUpFromDDR(186) cannot add 1 element to context";
      goto LABEL_15;
    case 187:
      id v19 = "ASPFTLParseBufferToCxt: numMemLow(187) cannot add 1 element to context";
      goto LABEL_15;
    case 188:
      id v19 = "ASPFTLParseBufferToCxt: maxMemLowDuration(188) cannot add 1 element to context";
      goto LABEL_15;
    case 189:
      id v19 = "ASPFTLParseBufferToCxt: memLowDuration(189) cannot add 1 element to context";
      goto LABEL_15;
    case 190:
      id v19 = "ASPFTLParseBufferToCxt: numFences(190) cannot add 1 element to context";
      goto LABEL_15;
    case 191:
      id v19 = "ASPFTLParseBufferToCxt: hostPassiveIO(191) cannot add 1 element to context";
      goto LABEL_15;
    case 192:
      id v19 = "ASPFTLParseBufferToCxt: odtsMax(192) cannot add 1 element to context";
      goto LABEL_15;
    case 193:
      id v19 = "ASPFTLParseBufferToCxt: defragMFromOrphans(193) cannot add 1 element to context";
      goto LABEL_15;
    case 194:
      id v19 = "ASPFTLParseBufferToCxt: defragMFromFragments(194) cannot add 1 element to context";
      goto LABEL_15;
    case 195:
      id v19 = "ASPFTLParseBufferToCxt: defragMTime(195) cannot add 1 element to context";
      goto LABEL_15;
    case 196:
      id v19 = "ASPFTLParseBufferToCxt: defragMMaxTime(196) cannot add 1 element to context";
      goto LABEL_15;
    case 197:
      id v19 = "ASPFTLParseBufferToCxt: raidFailedLbaMismatch(197) cannot add 1 element to context";
      goto LABEL_15;
    case 198:
      id v19 = "ASPFTLParseBufferToCxt: numSyscfgWrites(198) cannot add 1 element to context";
      goto LABEL_15;
    case 199:
      id v19 = "ASPFTLParseBufferToCxt: indmbUnitsXfer(199) cannot add 1 element to context";
      goto LABEL_15;
    case 200:
      id v19 = "ASPFTLParseBufferToCxt: indmbUnitsCache(200) cannot add 1 element to context";
      goto LABEL_15;
    case 201:
      id v19 = "ASPFTLParseBufferToCxt: indmbUnitsInd(201) cannot add 1 element to context";
      goto LABEL_15;
    case 202:
      id v19 = "ASPFTLParseBufferToCxt: wcacheFS_Mbytes(202) cannot add 1 element to context";
      goto LABEL_15;
    case 203:
      id v19 = "ASPFTLParseBufferToCxt: wcacheDS_Mbytes(203) cannot add 1 element to context";
      goto LABEL_15;
    case 204:
      id v19 = "ASPFTLParseBufferToCxt: powerOnSeconds(204) cannot add 1 element to context";
      goto LABEL_15;
    case 205:
      id v19 = "ASPFTLParseBufferToCxt: numUnknownTokenHostRead(205) cannot add 1 element to context";
      goto LABEL_15;
    case 206:
      id v19 = "ASPFTLParseBufferToCxt: numUnmmapedTokenHostRead(206) cannot add 1 element to context";
      goto LABEL_15;
    case 207:
      if ((_DWORD)v14 != 16) {
        sub_10001BA0C( "ASPFTLParseBufferToCxt: numOfThrottlingEntriesPerLevel(207): (#16) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
      }
      else {
        unsigned int v20 = v14;
      }
      int v22 = "ASPFTLParseBufferToCxt: numOfThrottlingEntriesPerLevel(207): Cannot add 16 elements to context";
      goto LABEL_2247;
    case 208:
      id v19 = "ASPFTLParseBufferToCxt: wcacheFS_MbytesMin(208) cannot add 1 element to context";
      goto LABEL_15;
    case 209:
      id v19 = "ASPFTLParseBufferToCxt: wcacheFS_MbytesMax(209) cannot add 1 element to context";
      goto LABEL_15;
    case 210:
      id v19 = "ASPFTLParseBufferToCxt: prepareForShutdownFailCounter(210) cannot add 1 element to context";
      goto LABEL_15;
    case 211:
      id v19 = "ASPFTLParseBufferToCxt: lpsrEntry(211) cannot add 1 element to context";
      goto LABEL_15;
    case 212:
      id v19 = "ASPFTLParseBufferToCxt: lpsrExit(212) cannot add 1 element to context";
      goto LABEL_15;
    case 213:
      if ((_DWORD)v14 != 8) {
        sub_10001BA0C( "ASPFTLParseBufferToCxt: crcInternalReadFail(213): (#8) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
      }
      else {
        unsigned int v20 = v14;
      }
      int v22 = "ASPFTLParseBufferToCxt: crcInternalReadFail(213): Cannot add 8 elements to context";
      goto LABEL_2247;
    case 214:
      id v19 = "ASPFTLParseBufferToCxt: wcacheFSEvictCnt(214) cannot add 1 element to context";
      goto LABEL_15;
    case 215:
      id v19 = "ASPFTLParseBufferToCxt: wcacheFSEvictSize(215) cannot add 1 element to context";
      goto LABEL_15;
    case 216:
      id v19 = "ASPFTLParseBufferToCxt: wcacheFSWr(216) cannot add 1 element to context";
      goto LABEL_15;
    case 217:
      id v19 = "ASPFTLParseBufferToCxt: wcacheDSWr(217) cannot add 1 element to context";
      goto LABEL_15;
    case 218:
      if ((_DWORD)v14 != 10) {
        sub_10001BA0C( "ASPFTLParseBufferToCxt: wcacheFSEvictSizeLogDist(218): (#10) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
      }
      else {
        unsigned int v20 = v14;
      }
      int v22 = "ASPFTLParseBufferToCxt: wcacheFSEvictSizeLogDist(218): Cannot add 10 elements to context";
      goto LABEL_2247;
    case 219:
      id v19 = "ASPFTLParseBufferToCxt: prepareForShutdownTimeoutCounter(219) cannot add 1 element to context";
      goto LABEL_15;
    case 220:
      id v19 = "ASPFTLParseBufferToCxt: prepareForShutdownCancelCounter(220) cannot add 1 element to context";
      goto LABEL_15;
    case 221:
      id v19 = "ASPFTLParseBufferToCxt: RD_openBandCount(221) cannot add 1 element to context";
      goto LABEL_15;
    case 222:
      id v19 = "ASPFTLParseBufferToCxt: RD_openBandNops(222) cannot add 1 element to context";
      goto LABEL_15;
    case 223:
      id v19 = "ASPFTLParseBufferToCxt: RD_closedBandEvictCount(223) cannot add 1 element to context";
      goto LABEL_15;
    default:
      switch(v12)
      {
        case 224:
          id v19 = "ASPFTLParseBufferToCxt: RD_closedBandEvictSectors(224) cannot add 1 element to context";
          goto LABEL_15;
        case 225:
          id v19 = "ASPFTLParseBufferToCxt: RD_closedBandFragmentCount(225) cannot add 1 element to context";
          goto LABEL_15;
        case 226:
          id v19 = "ASPFTLParseBufferToCxt: RD_closedBandFragmentSectors(226) cannot add 1 element to context";
          goto LABEL_15;
        case 227:
          if ((_DWORD)v14 != 10) {
            sub_10001BA0C( "ASPFTLParseBufferToCxt: wcacheFSOverWrLogSizeCnts(227): (#10) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
          }
          else {
            unsigned int v20 = v14;
          }
          int v22 = "ASPFTLParseBufferToCxt: wcacheFSOverWrLogSizeCnts(227): Cannot add 10 elements to context";
          goto LABEL_2247;
        case 228:
          if ((_DWORD)v14 != 4) {
            sub_10001BA0C( "ASPFTLParseBufferToCxt: wcacheFSOverWrSizeByFlow(228): (#4) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
          }
          else {
            unsigned int v20 = v14;
          }
          int v22 = "ASPFTLParseBufferToCxt: wcacheFSOverWrSizeByFlow(228): Cannot add 4 elements to context";
          goto LABEL_2247;
        case 229:
          if ((_DWORD)v14 != 2) {
            sub_10001BA0C( "ASPFTLParseBufferToCxt: indmbXferCountTo(229): (#2) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
          }
          else {
            unsigned int v20 = v14;
          }
          int v22 = "ASPFTLParseBufferToCxt: indmbXferCountTo(229): Cannot add 2 elements to context";
          goto LABEL_2247;
        case 230:
          if ((_DWORD)v14 != 2) {
            sub_10001BA0C( "ASPFTLParseBufferToCxt: indmbAccumulatedTimeBetweenXfers(230): (#2) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
          }
          else {
            unsigned int v20 = v14;
          }
          int v22 = "ASPFTLParseBufferToCxt: indmbAccumulatedTimeBetweenXfers(230): Cannot add 2 elements to context";
          goto LABEL_2247;
        case 231:
          id v19 = "ASPFTLParseBufferToCxt: maxGracefulBootTimeMs(231) cannot add 1 element to context";
          goto LABEL_15;
        case 232:
          id v19 = "ASPFTLParseBufferToCxt: maxUngracefulBootTimeMs(232) cannot add 1 element to context";
          goto LABEL_15;
        case 233:
          id v19 = "ASPFTLParseBufferToCxt: averageGracefulBootTimeMs(233) cannot add 1 element to context";
          goto LABEL_15;
        case 234:
          id v19 = "ASPFTLParseBufferToCxt: averageUngracefulBootTimeMs(234) cannot add 1 element to context";
          goto LABEL_15;
        case 235:
          if ((_DWORD)v14 != 8) {
            sub_10001BA0C( "ASPFTLParseBufferToCxt: gracefulBootTimeLogMs(235): (#8) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
          }
          else {
            unsigned int v20 = v14;
          }
          int v22 = "ASPFTLParseBufferToCxt: gracefulBootTimeLogMs(235): Cannot add 8 elements to context";
          goto LABEL_2247;
        case 236:
          if ((_DWORD)v14 != 8) {
            sub_10001BA0C( "ASPFTLParseBufferToCxt: ungracefulBootTimeLogMs(236): (#8) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
          }
          else {
            unsigned int v20 = v14;
          }
          int v22 = "ASPFTLParseBufferToCxt: ungracefulBootTimeLogMs(236): Cannot add 8 elements to context";
          goto LABEL_2247;
        case 237:
          if ((_DWORD)v14 != 4) {
            sub_10001BA0C( "ASPFTLParseBufferToCxt: CalibrationCount(237): (#4) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
          }
          else {
            unsigned int v20 = v14;
          }
          int v22 = "ASPFTLParseBufferToCxt: CalibrationCount(237): Cannot add 4 elements to context";
          goto LABEL_2247;
        case 238:
          id v19 = "ASPFTLParseBufferToCxt: CalibrationLastTmp(238) cannot add 1 element to context";
          goto LABEL_15;
        case 239:
          id v19 = "ASPFTLParseBufferToCxt: CalibrationMaxTmp(239) cannot add 1 element to context";
          goto LABEL_15;
        case 240:
          id v19 = "ASPFTLParseBufferToCxt: CalibrationMinTmp(240) cannot add 1 element to context";
          goto LABEL_15;
        case 241:
          id v19 = "ASPFTLParseBufferToCxt: ungracefulBootWorstIndicator(241) cannot add 1 element to context";
          goto LABEL_15;
        case 242:
          id v19 = "ASPFTLParseBufferToCxt: metaMismatchReread(242) cannot add 1 element to context";
          goto LABEL_15;
        case 243:
          id v19 = "ASPFTLParseBufferToCxt: numS3SleepOps(243) cannot add 1 element to context";
          goto LABEL_15;
        case 244:
          id v19 = "ASPFTLParseBufferToCxt: odtsCurrent(244) cannot add 1 element to context";
          goto LABEL_15;
        case 245:
          id v19 = "ASPFTLParseBufferToCxt: prefetchReads(245) cannot add 1 element to context";
          goto LABEL_15;
        case 246:
          id v19 = "ASPFTLParseBufferToCxt: prefetchHits(246) cannot add 1 element to context";
          goto LABEL_15;
        case 247:
          id v19 = "ASPFTLParseBufferToCxt: prefetchWritesInvalidation(247) cannot add 1 element to context";
          goto LABEL_15;
        case 248:
          id v19 = "ASPFTLParseBufferToCxt: indmbUnitsTotal(248) cannot add 1 element to context";
          goto LABEL_15;
        case 249:
          id v19 = "ASPFTLParseBufferToCxt: selfThrottlingEngage(249) cannot add 1 element to context";
          goto LABEL_15;
        case 250:
          id v19 = "ASPFTLParseBufferToCxt: selfThrottlingDisengage(250) cannot add 1 element to context";
          goto LABEL_15;
        case 252:
          id v19 = "ASPFTLParseBufferToCxt: AbortSkip_WlpMode(252) cannot add 1 element to context";
          goto LABEL_15;
        case 253:
          id v19 = "ASPFTLParseBufferToCxt: hostWritesWlpMode(253) cannot add 1 element to context";
          goto LABEL_15;
        case 254:
          id v19 = "ASPFTLParseBufferToCxt: numClogDoubleUnc(254) cannot add 1 element to context";
          goto LABEL_15;
        case 256:
          id v19 = "ASPFTLParseBufferToCxt: AbortPad_WlpMode(256) cannot add 1 element to context";
          goto LABEL_15;
        case 257:
          id v19 = "ASPFTLParseBufferToCxt: bonfireIntermediateBandErases(257) cannot add 1 element to context";
          goto LABEL_15;
        case 258:
          id v19 = "ASPFTLParseBufferToCxt: bonfireUserBandErases(258) cannot add 1 element to context";
          goto LABEL_15;
        case 259:
          id v19 = "ASPFTLParseBufferToCxt: bonfireIntermediateBandProgs(259) cannot add 1 element to context";
          goto LABEL_15;
        case 260:
          id v19 = "ASPFTLParseBufferToCxt: bonfireUserBandProgs(260) cannot add 1 element to context";
          goto LABEL_15;
        case 261:
          id v19 = "ASPFTLParseBufferToCxt: bonfireIntermediatePageReads(261) cannot add 1 element to context";
          goto LABEL_15;
        case 262:
          id v19 = "ASPFTLParseBufferToCxt: bonfireUserPageReads(262) cannot add 1 element to context";
          goto LABEL_15;
        case 263:
          id v19 = "ASPFTLParseBufferToCxt: refreshUtil00(263) cannot add 1 element to context";
          goto LABEL_15;
        case 264:
          id v19 = "ASPFTLParseBufferToCxt: failToReadUtil00(264) cannot add 1 element to context";
          goto LABEL_15;
        case 265:
          if ((_DWORD)v14 != 5) {
            sub_10001BA0C( "ASPFTLParseBufferToCxt: readCountHisto(265): (#5) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
          }
          else {
            unsigned int v20 = v14;
          }
          int v22 = "ASPFTLParseBufferToCxt: readCountHisto(265): Cannot add 5 elements to context";
          goto LABEL_2247;
        case 266:
          if ((_DWORD)v14 != 16) {
            sub_10001BA0C( "ASPFTLParseBufferToCxt: readAmpHisto(266): (#16) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
          }
          else {
            unsigned int v20 = v14;
          }
          int v22 = "ASPFTLParseBufferToCxt: readAmpHisto(266): Cannot add 16 elements to context";
          goto LABEL_2247;
        case 267:
          id v19 = "ASPFTLParseBufferToCxt: totalReadAmp(267) cannot add 1 element to context";
          goto LABEL_15;
        case 268:
          if ((_DWORD)v14 != 4) {
            sub_10001BA0C( "ASPFTLParseBufferToCxt: nvmeModeSelect(268): (#4) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
          }
          else {
            unsigned int v20 = v14;
          }
          int v22 = "ASPFTLParseBufferToCxt: nvmeModeSelect(268): Cannot add 4 elements to context";
          goto LABEL_2247;
        case 269:
          if ((_DWORD)v14 != 8) {
            sub_10001BA0C( "ASPFTLParseBufferToCxt: numBootBlockRefreshSuccess(269): (#8) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
          }
          else {
            unsigned int v20 = v14;
          }
          int v22 = "ASPFTLParseBufferToCxt: numBootBlockRefreshSuccess(269): Cannot add 8 elements to context";
          goto LABEL_2247;
        case 270:
          if ((_DWORD)v14 != 8) {
            sub_10001BA0C( "ASPFTLParseBufferToCxt: numBootBlockRefreshFail(270): (#8) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
          }
          else {
            unsigned int v20 = v14;
          }
          int v22 = "ASPFTLParseBufferToCxt: numBootBlockRefreshFail(270): Cannot add 8 elements to context";
          goto LABEL_2247;
        case 271:
          id v19 = "ASPFTLParseBufferToCxt: numUnsupportedAsi(271) cannot add 1 element to context";
          goto LABEL_15;
        case 272:
          id v19 = "ASPFTLParseBufferToCxt: NumTerminatedProgramSegs(272) cannot add 1 element to context";
          goto LABEL_15;
        case 273:
          id v19 = "ASPFTLParseBufferToCxt: indParityPagesDrops(273) cannot add 1 element to context";
          goto LABEL_15;
        case 274:
          id v19 = "ASPFTLParseBufferToCxt: indFlowPrograms(274) cannot add 1 element to context";
          goto LABEL_15;
        case 277:
          if ((_DWORD)v14 != 4) {
            sub_10001BA0C( "ASPFTLParseBufferToCxt: powerBudgetSelect(277): (#4) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
          }
          else {
            unsigned int v20 = v14;
          }
          int v22 = "ASPFTLParseBufferToCxt: powerBudgetSelect(277): Cannot add 4 elements to context";
          goto LABEL_2247;
        case 279:
          id v19 = "ASPFTLParseBufferToCxt: RxBurnNandWrites(279) cannot add 1 element to context";
          goto LABEL_15;
        case 280:
          if ((_DWORD)v14 != 12) {
            sub_10001BA0C( "ASPFTLParseBufferToCxt: E2EDPErrorCounters(280): (#12) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
          }
          else {
            unsigned int v20 = v14;
          }
          int v22 = "ASPFTLParseBufferToCxt: E2EDPErrorCounters(280): Cannot add 12 elements to context";
          goto LABEL_2247;
        case 281:
          id v19 = "ASPFTLParseBufferToCxt: wcacheSectorsMax(281) cannot add 1 element to context";
          goto LABEL_15;
        case 282:
          id v19 = "ASPFTLParseBufferToCxt: wcacheSectorsMin(282) cannot add 1 element to context";
          goto LABEL_15;
        case 283:
          id v19 = "ASPFTLParseBufferToCxt: wcacheSectorsCur(283) cannot add 1 element to context";
          goto LABEL_15;
        case 284:
          id v19 = "ASPFTLParseBufferToCxt: wcacheDS_SectorsMax(284) cannot add 1 element to context";
          goto LABEL_15;
        case 285:
          id v19 = "ASPFTLParseBufferToCxt: wcacheDS_SectorsMin(285) cannot add 1 element to context";
          goto LABEL_15;
        case 286:
          id v19 = "ASPFTLParseBufferToCxt: wcacheDS_SectorsCur(286) cannot add 1 element to context";
          goto LABEL_15;
        case 287:
          id v19 = "ASPFTLParseBufferToCxt: wcacheFS_Reads(287) cannot add 1 element to context";
          goto LABEL_15;
        case 288:
          id v19 = "ASPFTLParseBufferToCxt: wcacheDS_Reads(288) cannot add 1 element to context";
          goto LABEL_15;
        case 289:
          if ((_DWORD)v14 != 32) {
            sub_10001BA0C( "ASPFTLParseBufferToCxt: mspBootBlockReadFail(289): (#32) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
          }
          else {
            unsigned int v20 = v14;
          }
          int v22 = "ASPFTLParseBufferToCxt: mspBootBlockReadFail(289): Cannot add 32 elements to context";
          goto LABEL_2247;
        case 290:
          if ((_DWORD)v14 != 32) {
            sub_10001BA0C( "ASPFTLParseBufferToCxt: mspBootBlockProgFail(290): (#32) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
          }
          else {
            unsigned int v20 = v14;
          }
          int v22 = "ASPFTLParseBufferToCxt: mspBootBlockProgFail(290): Cannot add 32 elements to context";
          goto LABEL_2247;
        case 291:
          if ((_DWORD)v14 != 32) {
            sub_10001BA0C( "ASPFTLParseBufferToCxt: mspBootBlockEraseFail(291): (#32) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
          }
          else {
            unsigned int v20 = v14;
          }
          int v22 = "ASPFTLParseBufferToCxt: mspBootBlockEraseFail(291): Cannot add 32 elements to context";
          goto LABEL_2247;
        case 292:
          id v19 = "ASPFTLParseBufferToCxt: bandsRefreshedOnError(292) cannot add 1 element to context";
          goto LABEL_15;
        default:
          switch(v12)
          {
            case 298:
              if ((_DWORD)v14 != 2) {
                sub_10001BA0C( "ASPFTLParseBufferToCxt: perHostReads(298): (#2) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
              }
              else {
                unsigned int v20 = v14;
              }
              int v22 = "ASPFTLParseBufferToCxt: perHostReads(298): Cannot add 2 elements to context";
              goto LABEL_2247;
            case 299:
              if ((_DWORD)v14 != 2) {
                sub_10001BA0C( "ASPFTLParseBufferToCxt: perHostReadXacts(299): (#2) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
              }
              else {
                unsigned int v20 = v14;
              }
              int v22 = "ASPFTLParseBufferToCxt: perHostReadXacts(299): Cannot add 2 elements to context";
              goto LABEL_2247;
            case 300:
              if ((_DWORD)v14 != 2) {
                sub_10001BA0C( "ASPFTLParseBufferToCxt: perHostWrites(300): (#2) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
              }
              else {
                unsigned int v20 = v14;
              }
              int v22 = "ASPFTLParseBufferToCxt: perHostWrites(300): Cannot add 2 elements to context";
              goto LABEL_2247;
            case 301:
              if ((_DWORD)v14 != 2) {
                sub_10001BA0C( "ASPFTLParseBufferToCxt: perHostWriteXacts(301): (#2) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
              }
              else {
                unsigned int v20 = v14;
              }
              int v22 = "ASPFTLParseBufferToCxt: perHostWriteXacts(301): Cannot add 2 elements to context";
              goto LABEL_2247;
            case 302:
              if ((_DWORD)v14 != 2) {
                sub_10001BA0C( "ASPFTLParseBufferToCxt: perHostNumFlushes(302): (#2) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
              }
              else {
                unsigned int v20 = v14;
              }
              int v22 = "ASPFTLParseBufferToCxt: perHostNumFlushes(302): Cannot add 2 elements to context";
              goto LABEL_2247;
            case 303:
              if ((_DWORD)v14 != 2) {
                sub_10001BA0C( "ASPFTLParseBufferToCxt: perHostNumFences(303): (#2) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
              }
              else {
                unsigned int v20 = v14;
              }
              int v22 = "ASPFTLParseBufferToCxt: perHostNumFences(303): Cannot add 2 elements to context";
              goto LABEL_2247;
            case 304:
              if ((_DWORD)v14 != 10) {
                sub_10001BA0C( "ASPFTLParseBufferToCxt: commitPadSectorsPerFlow(304): (#10) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
              }
              else {
                unsigned int v20 = v14;
              }
              int v22 = "ASPFTLParseBufferToCxt: commitPadSectorsPerFlow(304): Cannot add 10 elements to context";
              goto LABEL_2247;
            case 305:
              if ((_DWORD)v14 != 10) {
                sub_10001BA0C( "ASPFTLParseBufferToCxt: wcacheDSOverWrLogSizeCnts(305): (#10) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
              }
              else {
                unsigned int v20 = v14;
              }
              int v22 = "ASPFTLParseBufferToCxt: wcacheDSOverWrLogSizeCnts(305): Cannot add 10 elements to context";
              goto LABEL_2247;
            case 306:
              if ((_DWORD)v14 != 4) {
                sub_10001BA0C( "ASPFTLParseBufferToCxt: wcacheDSOverWrSizeByFlow(306): (#4) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
              }
              else {
                unsigned int v20 = v14;
              }
              int v22 = "ASPFTLParseBufferToCxt: wcacheDSOverWrSizeByFlow(306): Cannot add 4 elements to context";
              goto LABEL_2247;
            case 307:
              if ((_DWORD)v14 != 10) {
                sub_10001BA0C( "ASPFTLParseBufferToCxt: CmdRaisePrioiryEvents(307): (#10) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
              }
              else {
                unsigned int v20 = v14;
              }
              int v22 = "ASPFTLParseBufferToCxt: CmdRaisePrioiryEvents(307): Cannot add 10 elements to context";
              goto LABEL_2247;
            case 308:
              id v19 = "ASPFTLParseBufferToCxt: utilNumVerification(308) cannot add 1 element to context";
              goto LABEL_15;
            case 309:
              id v19 = "ASPFTLParseBufferToCxt: utilRefreshes(309) cannot add 1 element to context";
              goto LABEL_15;
            case 310:
              id v19 = "ASPFTLParseBufferToCxt: utilBDRErrors(310) cannot add 1 element to context";
              goto LABEL_15;
            case 311:
              id v19 = "ASPFTLParseBufferToCxt: indBandsPerFlow(311) cannot add 1 element to context";
              goto LABEL_15;
            case 312:
              id v19 = "ASPFTLParseBufferToCxt: secsPerIndFlow(312) cannot add 1 element to context";
              goto LABEL_15;
            case 313:
              id v19 = "ASPFTLParseBufferToCxt: indDecodedECC(313) cannot add 1 element to context";
              goto LABEL_15;
            case 314:
              if ((_DWORD)v14 != 8) {
                sub_10001BA0C( "ASPFTLParseBufferToCxt: numBootBlockValidateSuccess(314): (#8) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
              }
              else {
                unsigned int v20 = v14;
              }
              int v22 = "ASPFTLParseBufferToCxt: numBootBlockValidateSuccess(314): Cannot add 8 elements to context";
              goto LABEL_2247;
            case 315:
              if ((_DWORD)v14 != 8) {
                sub_10001BA0C( "ASPFTLParseBufferToCxt: numBootBlockValidateFail(315): (#8) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
              }
              else {
                unsigned int v20 = v14;
              }
              int v22 = "ASPFTLParseBufferToCxt: numBootBlockValidateFail(315): Cannot add 8 elements to context";
              goto LABEL_2247;
            case 316:
              if ((_DWORD)v14 != 4) {
                sub_10001BA0C( "ASPFTLParseBufferToCxt: clogPagesFillingPercentage(316): (#4) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
              }
              else {
                unsigned int v20 = v14;
              }
              int v22 = "ASPFTLParseBufferToCxt: clogPagesFillingPercentage(316): Cannot add 4 elements to context";
              goto LABEL_2247;
            case 317:
              id v19 = "ASPFTLParseBufferToCxt: bdrCalTimeAccFactor(317) cannot add 1 element to context";
              goto LABEL_15;
            case 318:
              id v19 = "ASPFTLParseBufferToCxt: bootChainRdError(318) cannot add 1 element to context";
              goto LABEL_15;
            case 319:
              id v19 = "ASPFTLParseBufferToCxt: bootChainBlankError(319) cannot add 1 element to context";
              goto LABEL_15;
            case 320:
              id v19 = "ASPFTLParseBufferToCxt: bootChainRefreshError(320) cannot add 1 element to context";
              goto LABEL_15;
            case 321:
              id v19 = "ASPFTLParseBufferToCxt: bootChainVersionError(321) cannot add 1 element to context";
              goto LABEL_15;
            case 322:
              id v19 = "ASPFTLParseBufferToCxt: mspBootBlockMismatch(322) cannot add 1 element to context";
              goto LABEL_15;
            case 323:
              id v19 = "ASPFTLParseBufferToCxt: mspBootBlockMismatchErr(323) cannot add 1 element to context";
              goto LABEL_15;
            case 324:
              if ((_DWORD)v14 != 5) {
                sub_10001BA0C( "ASPFTLParseBufferToCxt: bitflipAddr(324): (#5) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
              }
              else {
                unsigned int v20 = v14;
              }
              int v22 = "ASPFTLParseBufferToCxt: bitflipAddr(324): Cannot add 5 elements to context";
              goto LABEL_2247;
            case 325:
              if ((_DWORD)v14 != 5) {
                sub_10001BA0C( "ASPFTLParseBufferToCxt: bitflipCount(325): (#5) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
              }
              else {
                unsigned int v20 = v14;
              }
              int v22 = "ASPFTLParseBufferToCxt: bitflipCount(325): Cannot add 5 elements to context";
              goto LABEL_2247;
            case 326:
              if ((_DWORD)v14 != 5) {
                sub_10001BA0C( "ASPFTLParseBufferToCxt: bitflipDupes(326): (#5) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
              }
              else {
                unsigned int v20 = v14;
              }
              int v22 = "ASPFTLParseBufferToCxt: bitflipDupes(326): Cannot add 5 elements to context";
              goto LABEL_2247;
            case 327:
              if ((_DWORD)v14 != 30) {
                sub_10001BA0C( "ASPFTLParseBufferToCxt: bandsMaxTempHisto(327): (#30) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
              }
              else {
                unsigned int v20 = v14;
              }
              int v22 = "ASPFTLParseBufferToCxt: bandsMaxTempHisto(327): Cannot add 30 elements to context";
              goto LABEL_2247;
            case 328:
              if ((_DWORD)v14 != 30) {
                sub_10001BA0C( "ASPFTLParseBufferToCxt: bandsMinTempHisto(328): (#30) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
              }
              else {
                unsigned int v20 = v14;
              }
              int v22 = "ASPFTLParseBufferToCxt: bandsMinTempHisto(328): Cannot add 30 elements to context";
              goto LABEL_2247;
            case 329:
              if ((_DWORD)v14 != 30) {
                sub_10001BA0C( "ASPFTLParseBufferToCxt: bandsLifeTimeTempHisto(329): (#30) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
              }
              else {
                unsigned int v20 = v14;
              }
              int v22 = "ASPFTLParseBufferToCxt: bandsLifeTimeTempHisto(329): Cannot add 30 elements to context";
              goto LABEL_2247;
            case 330:
              if ((_DWORD)v14 != 22) {
                sub_10001BA0C( "ASPFTLParseBufferToCxt: bandsDeltaTempHisto(330): (#22) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
              }
              else {
                unsigned int v20 = v14;
              }
              int v22 = "ASPFTLParseBufferToCxt: bandsDeltaTempHisto(330): Cannot add 22 elements to context";
              goto LABEL_2247;
            case 331:
              if ((_DWORD)v14 != 45) {
                sub_10001BA0C( "ASPFTLParseBufferToCxt: bandsCrossTempHisto(331): (#45) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
              }
              else {
                unsigned int v20 = v14;
              }
              int v22 = "ASPFTLParseBufferToCxt: bandsCrossTempHisto(331): Cannot add 45 elements to context";
              goto LABEL_2247;
            case 332:
              if ((_DWORD)v14 != 10) {
                sub_10001BA0C( "ASPFTLParseBufferToCxt: wcacheWaitLogMs(332): (#10) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
              }
              else {
                unsigned int v20 = v14;
              }
              int v22 = "ASPFTLParseBufferToCxt: wcacheWaitLogMs(332): Cannot add 10 elements to context";
              goto LABEL_2247;
            case 333:
              if ((_DWORD)v14 != 10) {
                sub_10001BA0C( "ASPFTLParseBufferToCxt: wcacheDS_segsSortedLogSize(333): (#10) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
              }
              else {
                unsigned int v20 = v14;
              }
              int v22 = "ASPFTLParseBufferToCxt: wcacheDS_segsSortedLogSize(333): Cannot add 10 elements to context";
              goto LABEL_2247;
            case 334:
              id v19 = "ASPFTLParseBufferToCxt: numFirmwareWrites(334) cannot add 1 element to context";
              goto LABEL_15;
            case 335:
              id v19 = "ASPFTLParseBufferToCxt: numBisWrites(335) cannot add 1 element to context";
              goto LABEL_15;
            case 336:
              id v19 = "ASPFTLParseBufferToCxt: numBootChainUpdates(336) cannot add 1 element to context";
              goto LABEL_15;
            case 337:
              id v19 = "ASPFTLParseBufferToCxt: cntCalTimeWentBackWard(337) cannot add 1 element to context";
              goto LABEL_15;
            case 338:
              id v19 = "ASPFTLParseBufferToCxt: indBoRecoveries(338) cannot add 1 element to context";
              goto LABEL_15;
            case 340:
              id v19 = "ASPFTLParseBufferToCxt: numCrossTempUecc(340) cannot add 1 element to context";
              goto LABEL_15;
            case 341:
              id v19 = "ASPFTLParseBufferToCxt: latencyMonitorError(341) cannot add 1 element to context";
              goto LABEL_15;
            case 343:
              id v19 = "ASPFTLParseBufferToCxt: utilUeccReads(343) cannot add 1 element to context";
              goto LABEL_15;
            case 344:
              id v19 = "ASPFTLParseBufferToCxt: numOfAvoidedGCDueToTemp(344) cannot add 1 element to context";
              goto LABEL_15;
            case 345:
              id v19 = "ASPFTLParseBufferToCxt: forceShutdowns(345) cannot add 1 element to context";
              goto LABEL_15;
            case 346:
              id v19 = "ASPFTLParseBufferToCxt: gcSlcDestinations(346) cannot add 1 element to context";
              goto LABEL_15;
            case 347:
              id v19 = "ASPFTLParseBufferToCxt: indReplayExtUsed(347) cannot add 1 element to context";
              goto LABEL_15;
            case 348:
              id v19 = "ASPFTLParseBufferToCxt: defectsPerPackageOverflow(348) cannot add 1 element to context";
              goto LABEL_15;
            case 349:
              id v19 = "ASPFTLParseBufferToCxt: RxBurnIntBandsProgrammed(349) cannot add 1 element to context";
              goto LABEL_15;
            case 350:
              id v19 = "ASPFTLParseBufferToCxt: RxBurnUsrBandsProgrammed(350) cannot add 1 element to context";
              goto LABEL_15;
            case 351:
              id v19 = "ASPFTLParseBufferToCxt: RxBurnIntNandWrites(351) cannot add 1 element to context";
              goto LABEL_15;
            case 352:
              id v19 = "ASPFTLParseBufferToCxt: RxBurnUsrNandWrites(352) cannot add 1 element to context";
              goto LABEL_15;
            case 353:
              id v19 = "ASPFTLParseBufferToCxt: clogLastStripeUeccs(353) cannot add 1 element to context";
              goto LABEL_15;
            case 354:
              id v19 = "ASPFTLParseBufferToCxt: GC_MidDestSrcSwitchSLC2TLC(354) cannot add 1 element to context";
              goto LABEL_15;
            case 355:
              id v19 = "ASPFTLParseBufferToCxt: GC_MidDestSrcSwitchTLC2SLC(355) cannot add 1 element to context";
              goto LABEL_15;
            case 356:
              id v19 = "ASPFTLParseBufferToCxt: nvme_stats_shutdown_count_host0_normal(356) cannot add 1 element to context";
              goto LABEL_15;
            case 357:
              id v19 = "ASPFTLParseBufferToCxt: nvme_stats_shutdown_count_host1_normal(357) cannot add 1 element to context";
              goto LABEL_15;
            case 358:
              id v19 = "ASPFTLParseBufferToCxt: nvme_stats_shutdown_count_host0_s2r(358) cannot add 1 element to context";
              goto LABEL_15;
            case 359:
              id v19 = "ASPFTLParseBufferToCxt: nvme_stats_shutdown_count_host1_s2r(359) cannot add 1 element to context";
              goto LABEL_15;
            case 360:
              if ((_DWORD)v14 != 16) {
                sub_10001BA0C( "ASPFTLParseBufferToCxt: gcPDusterIntrSrcValidityHisto(360): (#16) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
              }
              else {
                unsigned int v20 = v14;
              }
              int v22 = "ASPFTLParseBufferToCxt: gcPDusterIntrSrcValidityHisto(360): Cannot add 16 elements to context";
              goto LABEL_2247;
            case 361:
              if ((_DWORD)v14 != 16) {
                sub_10001BA0C( "ASPFTLParseBufferToCxt: gcPDusterUserSrcValidityHisto(361): (#16) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
              }
              else {
                unsigned int v20 = v14;
              }
              int v22 = "ASPFTLParseBufferToCxt: gcPDusterUserSrcValidityHisto(361): Cannot add 16 elements to context";
              goto LABEL_2247;
            case 362:
              id v19 = "ASPFTLParseBufferToCxt: raidFailedReadParity(362) cannot add 1 element to context";
              goto LABEL_15;
            case 364:
              id v19 = "ASPFTLParseBufferToCxt: lhotNumSkipes(364) cannot add 1 element to context";
              goto LABEL_15;
            default:
              switch(v12)
              {
                case 365:
                  id v19 = "ASPFTLParseBufferToCxt: lhotNumIsHotCalls(365) cannot add 1 element to context";
                  goto LABEL_15;
                case 366:
                  id v19 = "ASPFTLParseBufferToCxt: lhotFullLap(366) cannot add 1 element to context";
                  goto LABEL_15;
                case 367:
                  id v19 = "ASPFTLParseBufferToCxt: lhotSkipPrecent(367) cannot add 1 element to context";
                  goto LABEL_15;
                case 368:
                  id v19 = "ASPFTLParseBufferToCxt: eraseSuspendEvents(368) cannot add 1 element to context";
                  goto LABEL_15;
                case 369:
                  id v19 = "ASPFTLParseBufferToCxt: eraseSuspendedStatuses(369) cannot add 1 element to context";
                  goto LABEL_15;
                case 370:
                  id v19 = "ASPFTLParseBufferToCxt: eraseSuspendedBands(370) cannot add 1 element to context";
                  goto LABEL_15;
                case 371:
                  id v19 = "ASPFTLParseBufferToCxt: eraseSuspendSituationsBelowThreshold(371) cannot add 1 element to context";
                  goto LABEL_15;
                case 372:
                  id v19 = "ASPFTLParseBufferToCxt: eraseSuspendSituationsAboveThreshold(372) cannot add 1 element to context";
                  goto LABEL_15;
                case 373:
                  id v19 = "ASPFTLParseBufferToCxt: eraseSuspendReadChainsProcessed(373) cannot add 1 element to context";
                  goto LABEL_15;
                case 374:
                  id v19 = "ASPFTLParseBufferToCxt: bdrLastDoneHr(374) cannot add 1 element to context";
                  goto LABEL_15;
                case 375:
                  id v19 = "ASPFTLParseBufferToCxt: bdrBackupThreshHrs(375) cannot add 1 element to context";
                  goto LABEL_15;
                case 376:
                  id v19 = "ASPFTLParseBufferToCxt: clogPortableProgBufs(376) cannot add 1 element to context";
                  goto LABEL_15;
                case 377:
                  id v19 = "ASPFTLParseBufferToCxt: clogPortableDropBufs(377) cannot add 1 element to context";
                  goto LABEL_15;
                case 378:
                  id v19 = "ASPFTLParseBufferToCxt: clogPortablePadSectors(378) cannot add 1 element to context";
                  goto LABEL_15;
                case 379:
                  id v19 = "ASPFTLParseBufferToCxt: numRetiredBlocks(379) cannot add 1 element to context";
                  goto LABEL_15;
                case 381:
                  id v19 = "ASPFTLParseBufferToCxt: numRefreshOnErrNandRefreshPerf(381) cannot add 1 element to context";
                  goto LABEL_15;
                case 382:
                  id v19 = "ASPFTLParseBufferToCxt: raidReconstructReads(382) cannot add 1 element to context";
                  goto LABEL_15;
                case 383:
                  id v19 = "ASPFTLParseBufferToCxt: gcReadsNoBlog(383) cannot add 1 element to context";
                  goto LABEL_15;
                case 384:
                  id v19 = "ASPFTLParseBufferToCxt: AbortSkip_MPBXReadVerifyClosedBand(384) cannot add 1 element to context";
                  goto LABEL_15;
                case 385:
                  id v19 = "ASPFTLParseBufferToCxt: openBandReadFail(385) cannot add 1 element to context";
                  goto LABEL_15;
                case 386:
                  id v19 = "ASPFTLParseBufferToCxt: AbortSkip_MPBXReadVerifyOpenBand(386) cannot add 1 element to context";
                  goto LABEL_15;
                case 387:
                  id v19 = "ASPFTLParseBufferToCxt: AbortSkip_MBPXFailedRebuildingParity(387) cannot add 1 element to context";
                  goto LABEL_15;
                case 388:
                  id v19 = "ASPFTLParseBufferToCxt: raidSuccessfulPMXReconstructionInternal(388) cannot add 1 element to context";
                  goto LABEL_15;
                case 389:
                  id v19 = "ASPFTLParseBufferToCxt: raidSuccessfulPMXReconstructionHost(389) cannot add 1 element to context";
                  goto LABEL_15;
                case 390:
                  id v19 = "ASPFTLParseBufferToCxt: raidFailedPMXReconstructionInternal(390) cannot add 1 element to context";
                  goto LABEL_15;
                case 391:
                  id v19 = "ASPFTLParseBufferToCxt: raidFailedPMXReconstructionHost(391) cannot add 1 element to context";
                  goto LABEL_15;
                case 392:
                  id v19 = "ASPFTLParseBufferToCxt: raidSuccessfulRMXReconstructionInternal(392) cannot add 1 element to context";
                  goto LABEL_15;
                case 393:
                  id v19 = "ASPFTLParseBufferToCxt: raidSuccessfulRMXReconstructionHost(393) cannot add 1 element to context";
                  goto LABEL_15;
                case 394:
                  id v19 = "ASPFTLParseBufferToCxt: raidFailedRMXReconstructionInternal(394) cannot add 1 element to context";
                  goto LABEL_15;
                case 395:
                  id v19 = "ASPFTLParseBufferToCxt: raidFailedRMXReconstructionHost(395) cannot add 1 element to context";
                  goto LABEL_15;
                case 396:
                  id v19 = "ASPFTLParseBufferToCxt: raidFailedReadParityInternal(396) cannot add 1 element to context";
                  goto LABEL_15;
                case 397:
                  id v19 = "ASPFTLParseBufferToCxt: raidFailedReadQParityInternal(397) cannot add 1 element to context";
                  goto LABEL_15;
                case 398:
                  id v19 = "ASPFTLParseBufferToCxt: raidFailedReadQParity(398) cannot add 1 element to context";
                  goto LABEL_15;
                case 399:
                  id v19 = "ASPFTLParseBufferToCxt: raidFailedReadQCopy(399) cannot add 1 element to context";
                  goto LABEL_15;
                case 400:
                  id v19 = "ASPFTLParseBufferToCxt: raidFailedReconstructionQParity(400) cannot add 1 element to context";
                  goto LABEL_15;
                case 401:
                  id v19 = "ASPFTLParseBufferToCxt: offlineBlocksCnt(401) cannot add 1 element to context";
                  goto LABEL_15;
                case 402:
                  id v19 = "ASPFTLParseBufferToCxt: bork0Revectors(402) cannot add 1 element to context";
                  goto LABEL_15;
                case 403:
                  id v19 = "ASPFTLParseBufferToCxt: raidFailedReadBlog(403) cannot add 1 element to context";
                  goto LABEL_15;
                case 404:
                  id v19 = "ASPFTLParseBufferToCxt: numReliabilityRefreshes(404) cannot add 1 element to context";
                  goto LABEL_15;
                case 405:
                  id v19 = "ASPFTLParseBufferToCxt: raidFailedReadQCopyInternal(405) cannot add 1 element to context";
                  goto LABEL_15;
                case 406:
                  if ((_DWORD)v14 != 5) {
                    sub_10001BA0C( "ASPFTLParseBufferToCxt: raidReconstructSuccessFlow(406): (#5) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                  }
                  else {
                    unsigned int v20 = v14;
                  }
                  int v22 = "ASPFTLParseBufferToCxt: raidReconstructSuccessFlow(406): Cannot add 5 elements to context";
                  goto LABEL_2247;
                case 407:
                  if ((_DWORD)v14 != 5) {
                    sub_10001BA0C( "ASPFTLParseBufferToCxt: raidReconstructFailFlow(407): (#5) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                  }
                  else {
                    unsigned int v20 = v14;
                  }
                  int v22 = "ASPFTLParseBufferToCxt: raidReconstructFailFlow(407): Cannot add 5 elements to context";
                  goto LABEL_2247;
                case 408:
                  id v19 = "ASPFTLParseBufferToCxt: raidReconstructFailP(408) cannot add 1 element to context";
                  goto LABEL_15;
                case 409:
                  id v19 = "ASPFTLParseBufferToCxt: raidReconstructFailQ(409) cannot add 1 element to context";
                  goto LABEL_15;
                case 410:
                  id v19 = "ASPFTLParseBufferToCxt: raidReconstructFailUECC(410) cannot add 1 element to context";
                  goto LABEL_15;
                case 411:
                  id v19 = "ASPFTLParseBufferToCxt: raidReconstructFailUnsupp(411) cannot add 1 element to context";
                  goto LABEL_15;
                case 412:
                  id v19 = "ASPFTLParseBufferToCxt: raidUECCOpenBand(412) cannot add 1 element to context";
                  goto LABEL_15;
                case 414:
                  id v19 = "ASPFTLParseBufferToCxt: ueccReads(414) cannot add 1 element to context";
                  goto LABEL_15;
                case 416:
                  id v19 = "ASPFTLParseBufferToCxt: raidSuccessfulVerify(416) cannot add 1 element to context";
                  goto LABEL_15;
                case 417:
                  id v19 = "ASPFTLParseBufferToCxt: raidFailedVerify(417) cannot add 1 element to context";
                  goto LABEL_15;
                case 418:
                  id v19 = "ASPFTLParseBufferToCxt: numBandsVerified(418) cannot add 1 element to context";
                  goto LABEL_15;
                case 419:
                  id v19 = "ASPFTLParseBufferToCxt: cache_heads(419) cannot add 1 element to context";
                  goto LABEL_15;
                case 420:
                  id v19 = "ASPFTLParseBufferToCxt: AbortSkip_RMXtoMPBX(420) cannot add 1 element to context";
                  goto LABEL_15;
                case 421:
                  id v19 = "ASPFTLParseBufferToCxt: s3eFwVer(421) cannot add 1 element to context";
                  goto LABEL_15;
                case 422:
                  id v19 = "ASPFTLParseBufferToCxt: readVerifyNative(422) cannot add 1 element to context";
                  goto LABEL_15;
                case 423:
                  id v19 = "ASPFTLParseBufferToCxt: reducedReadVerifyNative(423) cannot add 1 element to context";
                  goto LABEL_15;
                case 424:
                  id v19 = "ASPFTLParseBufferToCxt: readVerifySlc(424) cannot add 1 element to context";
                  goto LABEL_15;
                case 425:
                  id v19 = "ASPFTLParseBufferToCxt: reducedReadVerifySlc(425) cannot add 1 element to context";
                  goto LABEL_15;
                case 426:
                  id v19 = "ASPFTLParseBufferToCxt: RxBurnEvictions(426) cannot add 1 element to context";
                  goto LABEL_15;
                case 427:
                  id v19 = "ASPFTLParseBufferToCxt: directToTLCBands(427) cannot add 1 element to context";
                  goto LABEL_15;
                case 428:
                  id v19 = "ASPFTLParseBufferToCxt: nandDesc(428) cannot add 1 element to context";
                  goto LABEL_15;
                case 429:
                  id v19 = "ASPFTLParseBufferToCxt: fwUpdatesPercentUsed(429) cannot add 1 element to context";
                  goto LABEL_15;
                case 430:
                  id v19 = "ASPFTLParseBufferToCxt: slcPercentUsed(430) cannot add 1 element to context";
                  goto LABEL_15;
                case 431:
                  id v19 = "ASPFTLParseBufferToCxt: percentUsed(431) cannot add 1 element to context";
                  goto LABEL_15;
                default:
                  switch(v12)
                  {
                    case 432:
                      id v19 = "ASPFTLParseBufferToCxt: hostAutoWrites(432) cannot add 1 element to context";
                      goto LABEL_15;
                    case 433:
                      id v19 = "ASPFTLParseBufferToCxt: hostAutoWriteXacts(433) cannot add 1 element to context";
                      goto LABEL_15;
                    case 434:
                      id v19 = "ASPFTLParseBufferToCxt: gcDestDynamic(434) cannot add 1 element to context";
                      goto LABEL_15;
                    case 435:
                      id v19 = "ASPFTLParseBufferToCxt: gcDestStatic(435) cannot add 1 element to context";
                      goto LABEL_15;
                    case 436:
                      id v19 = "ASPFTLParseBufferToCxt: gcDestWearlevel(436) cannot add 1 element to context";
                      goto LABEL_15;
                    case 437:
                      id v19 = "ASPFTLParseBufferToCxt: gcDestParity(437) cannot add 1 element to context";
                      goto LABEL_15;
                    case 438:
                      id v19 = "ASPFTLParseBufferToCxt: AbortSkip_Format(438) cannot add 1 element to context";
                      goto LABEL_15;
                    case 440:
                      id v19 = "ASPFTLParseBufferToCxt: raidSLCPadding(440) cannot add 1 element to context";
                      goto LABEL_15;
                    case 441:
                      id v19 = "ASPFTLParseBufferToCxt: raidGCBands(441) cannot add 1 element to context";
                      goto LABEL_15;
                    case 442:
                      id v19 = "ASPFTLParseBufferToCxt: raidGCSectors(442) cannot add 1 element to context";
                      goto LABEL_15;
                    case 443:
                      id v19 = "ASPFTLParseBufferToCxt: raidGCPadding(443) cannot add 1 element to context";
                      goto LABEL_15;
                    case 444:
                      id v19 = "ASPFTLParseBufferToCxt: raidSLCBandsPerHostFlow(444) cannot add 1 element to context";
                      goto LABEL_15;
                    case 445:
                      id v19 = "ASPFTLParseBufferToCxt: raidSLCSecsPerHostFlow(445) cannot add 1 element to context";
                      goto LABEL_15;
                    case 446:
                      id v19 = "ASPFTLParseBufferToCxt: rxBurnMinCycleRuns(446) cannot add 1 element to context";
                      goto LABEL_15;
                    case 447:
                      id v19 = "ASPFTLParseBufferToCxt: clogNumFastCxt(447) cannot add 1 element to context";
                      goto LABEL_15;
                    case 448:
                      id v19 = "ASPFTLParseBufferToCxt: clogNumRapidReboots(448) cannot add 1 element to context";
                      goto LABEL_15;
                    case 449:
                      id v19 = "ASPFTLParseBufferToCxt: clogFastCxtAbvThr(449) cannot add 1 element to context";
                      goto LABEL_15;
                    case 450:
                      id v19 = "ASPFTLParseBufferToCxt: rxBurnDiffModeRuns(450) cannot add 1 element to context";
                      goto LABEL_15;
                    case 452:
                      id v19 = "ASPFTLParseBufferToCxt: indReadVerifyFail(452) cannot add 1 element to context";
                      goto LABEL_15;
                    case 453:
                      if ((_DWORD)v14 != 16) {
                        sub_10001BA0C( "ASPFTLParseBufferToCxt: numOfThrottlingEntriesPerReadLevel(453): (#16) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                      }
                      else {
                        unsigned int v20 = v14;
                      }
                      int v22 = "ASPFTLParseBufferToCxt: numOfThrottlingEntriesPerReadLevel(453): Cannot add 16 elements to context";
                      goto LABEL_2247;
                    case 454:
                      if ((_DWORD)v14 != 16) {
                        sub_10001BA0C( "ASPFTLParseBufferToCxt: numOfThrottlingEntriesPerWriteLevel(454): (#16) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                      }
                      else {
                        unsigned int v20 = v14;
                      }
                      int v22 = "ASPFTLParseBufferToCxt: numOfThrottlingEntriesPerWriteLevel(454): Cannot add 16 elements to context";
                      goto LABEL_2247;
                    case 456:
                      if ((_DWORD)v14 != 10) {
                        sub_10001BA0C( "ASPFTLParseBufferToCxt: slcFifoDepth(456): (#10) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                      }
                      else {
                        unsigned int v20 = v14;
                      }
                      int v22 = "ASPFTLParseBufferToCxt: slcFifoDepth(456): Cannot add 10 elements to context";
                      goto LABEL_2247;
                    case 457:
                      id v19 = "ASPFTLParseBufferToCxt: wcacheSectorsDirtyIdle(457) cannot add 1 element to context";
                      goto LABEL_15;
                    case 458:
                      id v19 = "ASPFTLParseBufferToCxt: wcacheDS_SectorsDirtyIdle(458) cannot add 1 element to context";
                      goto LABEL_15;
                    case 459:
                      id v19 = "ASPFTLParseBufferToCxt: wcacheFS_MbytesDirtyIdle(459) cannot add 1 element to context";
                      goto LABEL_15;
                    case 460:
                      if ((_DWORD)v14 != 256) {
                        sub_10001BA0C( "ASPFTLParseBufferToCxt: CacheDepthVsThroughput(460): (#256) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                      }
                      else {
                        unsigned int v20 = v14;
                      }
                      int v22 = "ASPFTLParseBufferToCxt: CacheDepthVsThroughput(460): Cannot add 256 elements to context";
                      goto LABEL_2247;
                    case 461:
                      id v19 = "ASPFTLParseBufferToCxt: directToTLCSectors(461) cannot add 1 element to context";
                      goto LABEL_15;
                    case 462:
                      id v19 = "ASPFTLParseBufferToCxt: fallbackToWaterfall(462) cannot add 1 element to context";
                      goto LABEL_15;
                    case 463:
                      if ((_DWORD)v14 != 11) {
                        sub_10001BA0C( "ASPFTLParseBufferToCxt: balanceProportionBucketsHistogram(463): (#11) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                      }
                      else {
                        unsigned int v20 = v14;
                      }
                      int v22 = "ASPFTLParseBufferToCxt: balanceProportionBucketsHistogram(463): Cannot add 11 elements to context";
                      goto LABEL_2247;
                    case 464:
                      id v19 = "ASPFTLParseBufferToCxt: lockToTlc(464) cannot add 1 element to context";
                      goto LABEL_15;
                    case 465:
                      if ((_DWORD)v14 != 10) {
                        sub_10001BA0C( "ASPFTLParseBufferToCxt: burstSizeHistogram(465): (#10) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                      }
                      else {
                        unsigned int v20 = v14;
                      }
                      int v22 = "ASPFTLParseBufferToCxt: burstSizeHistogram(465): Cannot add 10 elements to context";
                      goto LABEL_2247;
                    case 466:
                      if ((_DWORD)v14 != 64) {
                        sub_10001BA0C( "ASPFTLParseBufferToCxt: qosDirectToTLC(466): (#64) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                      }
                      else {
                        unsigned int v20 = v14;
                      }
                      int v22 = "ASPFTLParseBufferToCxt: qosDirectToTLC(466): Cannot add 64 elements to context";
                      goto LABEL_2247;
                    case 467:
                      if ((_DWORD)v14 != 4) {
                        sub_10001BA0C( "ASPFTLParseBufferToCxt: maxQosDirectToTLC(467): (#4) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                      }
                      else {
                        unsigned int v20 = v14;
                      }
                      int v22 = "ASPFTLParseBufferToCxt: maxQosDirectToTLC(467): Cannot add 4 elements to context";
                      goto LABEL_2247;
                    case 468:
                      if ((_DWORD)v14 != 16) {
                        sub_10001BA0C( "ASPFTLParseBufferToCxt: wcacheDirtyAtFlush(468): (#16) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                      }
                      else {
                        unsigned int v20 = v14;
                      }
                      int v22 = "ASPFTLParseBufferToCxt: wcacheDirtyAtFlush(468): Cannot add 16 elements to context";
                      goto LABEL_2247;
                    case 469:
                      if ((_DWORD)v14 != 2) {
                        sub_10001BA0C( "ASPFTLParseBufferToCxt: raidReconstructSuccessPartition(469): (#2) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                      }
                      else {
                        unsigned int v20 = v14;
                      }
                      int v22 = "ASPFTLParseBufferToCxt: raidReconstructSuccessPartition(469): Cannot add 2 elements to context";
                      goto LABEL_2247;
                    case 470:
                      if ((_DWORD)v14 != 2) {
                        sub_10001BA0C( "ASPFTLParseBufferToCxt: raidReconstructFailPartition(470): (#2) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                      }
                      else {
                        unsigned int v20 = v14;
                      }
                      int v22 = "ASPFTLParseBufferToCxt: raidReconstructFailPartition(470): Cannot add 2 elements to context";
                      goto LABEL_2247;
                    case 471:
                      id v19 = "ASPFTLParseBufferToCxt: raidUncleanBootBandFail(471) cannot add 1 element to context";
                      goto LABEL_15;
                    case 472:
                      id v19 = "ASPFTLParseBufferToCxt: raidReconstructFailBandFlowHost(472) cannot add 1 element to context";
                      goto LABEL_15;
                    case 473:
                      id v19 = "ASPFTLParseBufferToCxt: raidReconstructFailBandFlowGC(473) cannot add 1 element to context";
                      goto LABEL_15;
                    case 476:
                      if ((_DWORD)v14 != 2) {
                        sub_10001BA0C( "ASPFTLParseBufferToCxt: raidSuccessfulRecoLbaRange(476): (#2) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                      }
                      else {
                        unsigned int v20 = v14;
                      }
                      int v22 = "ASPFTLParseBufferToCxt: raidSuccessfulRecoLbaRange(476): Cannot add 2 elements to context";
                      goto LABEL_2247;
                    case 477:
                      if ((_DWORD)v14 != 2) {
                        sub_10001BA0C( "ASPFTLParseBufferToCxt: raidFailedRecoLbaRange(477): (#2) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                      }
                      else {
                        unsigned int v20 = v14;
                      }
                      int v22 = "ASPFTLParseBufferToCxt: raidFailedRecoLbaRange(477): Cannot add 2 elements to context";
                      goto LABEL_2247;
                    case 481:
                      if ((_DWORD)v14 != 32) {
                        sub_10001BA0C( "ASPFTLParseBufferToCxt: skinnyBandErases_481(481): (#32) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                      }
                      else {
                        unsigned int v20 = v14;
                      }
                      int v22 = "ASPFTLParseBufferToCxt: skinnyBandErases_481(481): Cannot add 32 elements to context";
                      goto LABEL_2247;
                    case 483:
                      id v19 = "ASPFTLParseBufferToCxt: tlcOverHeatWaterfall(483) cannot add 1 element to context";
                      goto LABEL_15;
                    case 484:
                      id v19 = "ASPFTLParseBufferToCxt: skinnyCyclesConvert(484) cannot add 1 element to context";
                      goto LABEL_15;
                    case 485:
                      id v19 = "ASPFTLParseBufferToCxt: non_proportional_directToTLCSectors(485) cannot add 1 element to context";
                      goto LABEL_15;
                    case 486:
                      id v19 = "ASPFTLParseBufferToCxt: maxFailedFastCxtSync(486) cannot add 1 element to context";
                      goto LABEL_15;
                    case 487:
                      id v19 = "ASPFTLParseBufferToCxt: numFormatUserArea(487) cannot add 1 element to context";
                      goto LABEL_15;
                    case 488:
                      id v19 = "ASPFTLParseBufferToCxt: clogFastCxtSyncAborted(488) cannot add 1 element to context";
                      goto LABEL_15;
                    case 489:
                      if ((_DWORD)v14 != 5) {
                        sub_10001BA0C( "ASPFTLParseBufferToCxt: clogOccupationSectors(489): (#5) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                      }
                      else {
                        unsigned int v20 = v14;
                      }
                      int v22 = "ASPFTLParseBufferToCxt: clogOccupationSectors(489): Cannot add 5 elements to context";
                      goto LABEL_2247;
                    case 490:
                      if ((_DWORD)v14 != 64) {
                        sub_10001BA0C( "ASPFTLParseBufferToCxt: bdrTmpHist(490): (#64) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                      }
                      else {
                        unsigned int v20 = v14;
                      }
                      int v22 = "ASPFTLParseBufferToCxt: bdrTmpHist(490): Cannot add 64 elements to context";
                      goto LABEL_2247;
                    case 491:
                      id v19 = "ASPFTLParseBufferToCxt: numFWUpdates(491) cannot add 1 element to context";
                      goto LABEL_15;
                    case 492:
                      id v19 = "ASPFTLParseBufferToCxt: numClogLoadFails(492) cannot add 1 element to context";
                      goto LABEL_15;
                    case 493:
                      id v19 = "ASPFTLParseBufferToCxt: rxBurnNumForcedDiffMode(493) cannot add 1 element to context";
                      goto LABEL_15;
                    case 494:
                      id v19 = "ASPFTLParseBufferToCxt: RD_numSaves(494) cannot add 1 element to context";
                      goto LABEL_15;
                    case 495:
                      id v19 = "ASPFTLParseBufferToCxt: eanCompressWrites(495) cannot add 1 element to context";
                      goto LABEL_15;
                    case 496:
                      id v19 = "ASPFTLParseBufferToCxt: eanHostWrites(496) cannot add 1 element to context";
                      goto LABEL_15;
                    case 497:
                      id v19 = "ASPFTLParseBufferToCxt: bandPreErases(497) cannot add 1 element to context";
                      goto LABEL_15;
                    case 498:
                      id v19 = "ASPFTLParseBufferToCxt: eanHostUnmaps(498) cannot add 1 element to context";
                      goto LABEL_15;
                    case 499:
                      id v19 = "ASPFTLParseBufferToCxt: eanHostFlushes(499) cannot add 1 element to context";
                      goto LABEL_15;
                    case 500:
                      id v19 = "ASPFTLParseBufferToCxt: eanFastWrites(500) cannot add 1 element to context";
                      goto LABEL_15;
                    case 501:
                      id v19 = "ASPFTLParseBufferToCxt: autowriteDS2FSCollisions(501) cannot add 1 element to context";
                      goto LABEL_15;
                    case 502:
                      id v19 = "ASPFTLParseBufferToCxt: autowriteWaitTransferTaskBlocks(502) cannot add 1 element to context";
                      goto LABEL_15;
                    case 503:
                      if ((_DWORD)v14 != 2) {
                        sub_10001BA0C( "ASPFTLParseBufferToCxt: avgCycle(503): (#2) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                      }
                      else {
                        unsigned int v20 = v14;
                      }
                      int v22 = "ASPFTLParseBufferToCxt: avgCycle(503): Cannot add 2 elements to context";
                      goto LABEL_2247;
                    case 504:
                      id v19 = "ASPFTLParseBufferToCxt: RD_DeferredClearsOverflowCnt(504) cannot add 1 element to context";
                      goto LABEL_15;
                    default:
                      switch(v12)
                      {
                        case 505:
                          id v19 = "ASPFTLParseBufferToCxt: maxVerticsInBand(505) cannot add 1 element to context";
                          goto LABEL_15;
                        case 506:
                          id v19 = "ASPFTLParseBufferToCxt: numVertics(506) cannot add 1 element to context";
                          goto LABEL_15;
                        case 507:
                          id v19 = "ASPFTLParseBufferToCxt: exceededCVertics(507) cannot add 1 element to context";
                          goto LABEL_15;
                        case 510:
                          id v19 = "ASPFTLParseBufferToCxt: raidReconstructFailMismatch(510) cannot add 1 element to context";
                          goto LABEL_15;
                        case 511:
                          if ((_DWORD)v14 != 32) {
                            sub_10001BA0C( "ASPFTLParseBufferToCxt: mspbootBlockRefreshCnt(511): (#32) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                          }
                          else {
                            unsigned int v20 = v14;
                          }
                          int v22 = "ASPFTLParseBufferToCxt: mspbootBlockRefreshCnt(511): Cannot add 32 elements to context";
                          goto LABEL_2247;
                        case 516:
                          if ((_DWORD)v14 != 32) {
                            sub_10001BA0C( "ASPFTLParseBufferToCxt: mspBootBlockRefreshTime(516): (#32) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                          }
                          else {
                            unsigned int v20 = v14;
                          }
                          int v22 = "ASPFTLParseBufferToCxt: mspBootBlockRefreshTime(516): Cannot add 32 elements to context";
                          goto LABEL_2247;
                        case 517:
                          id v19 = "ASPFTLParseBufferToCxt: mspBootBlockCountPerMsp(517) cannot add 1 element to context";
                          goto LABEL_15;
                        case 518:
                          id v19 = "ASPFTLParseBufferToCxt: skinnyRevectorSLC(518) cannot add 1 element to context";
                          goto LABEL_15;
                        case 519:
                          id v19 = "ASPFTLParseBufferToCxt: skinnyRevectorTLC(519) cannot add 1 element to context";
                          goto LABEL_15;
                        case 520:
                          id v19 = "ASPFTLParseBufferToCxt: perfSetupAttempts(520) cannot add 1 element to context";
                          goto LABEL_15;
                        case 521:
                          id v19 = "ASPFTLParseBufferToCxt: perfSetupSuccesses(521) cannot add 1 element to context";
                          goto LABEL_15;
                        case 522:
                          id v19 = "ASPFTLParseBufferToCxt: perfWriteAttempts(522) cannot add 1 element to context";
                          goto LABEL_15;
                        case 523:
                          id v19 = "ASPFTLParseBufferToCxt: perfWriteSuccesses(523) cannot add 1 element to context";
                          goto LABEL_15;
                        case 524:
                          id v19 = "ASPFTLParseBufferToCxt: perfReadAttempts(524) cannot add 1 element to context";
                          goto LABEL_15;
                        case 525:
                          id v19 = "ASPFTLParseBufferToCxt: perfReadSuccesses(525) cannot add 1 element to context";
                          goto LABEL_15;
                        case 526:
                          id v19 = "ASPFTLParseBufferToCxt: perfCleanupAttempts(526) cannot add 1 element to context";
                          goto LABEL_15;
                        case 527:
                          id v19 = "ASPFTLParseBufferToCxt: perfCleanupSuccesses(527) cannot add 1 element to context";
                          goto LABEL_15;
                        case 530:
                          id v19 = "ASPFTLParseBufferToCxt: firstFailedDieId(530) cannot add 1 element to context";
                          goto LABEL_15;
                        case 531:
                          id v19 = "ASPFTLParseBufferToCxt: numDieFailures(531) cannot add 1 element to context";
                          goto LABEL_15;
                        case 532:
                          id v19 = "ASPFTLParseBufferToCxt: spareAvailablePercent(532) cannot add 1 element to context";
                          goto LABEL_15;
                        case 533:
                          id v19 = "ASPFTLParseBufferToCxt: dataFabricErr(533) cannot add 1 element to context";
                          goto LABEL_15;
                        case 534:
                          id v19 = "ASPFTLParseBufferToCxt: downlinkFabricErr(534) cannot add 1 element to context";
                          goto LABEL_15;
                        case 535:
                          id v19 = "ASPFTLParseBufferToCxt: prpAccTimeoutErr(535) cannot add 1 element to context";
                          goto LABEL_15;
                        case 537:
                          id v19 = "ASPFTLParseBufferToCxt: uplinkFabricErr(537) cannot add 1 element to context";
                          goto LABEL_15;
                        case 538:
                          id v19 = "ASPFTLParseBufferToCxt: skinnyBandsGBB(538) cannot add 1 element to context";
                          goto LABEL_15;
                        case 539:
                          id v19 = "ASPFTLParseBufferToCxt: AbortPad_GcMustPadBand(539) cannot add 1 element to context";
                          goto LABEL_15;
                        case 540:
                          id v19 = "ASPFTLParseBufferToCxt: AbortPad_GcMustPadSkinny(540) cannot add 1 element to context";
                          goto LABEL_15;
                        case 541:
                          id v19 = "ASPFTLParseBufferToCxt: bdrHostPingInitial(541) cannot add 1 element to context";
                          goto LABEL_15;
                        case 542:
                          id v19 = "ASPFTLParseBufferToCxt: bdrHostPingMoreNeeded(542) cannot add 1 element to context";
                          goto LABEL_15;
                        case 543:
                          id v19 = "ASPFTLParseBufferToCxt: bandParityAllocationFailed(543) cannot add 1 element to context";
                          goto LABEL_15;
                        case 544:
                          id v19 = "ASPFTLParseBufferToCxt: fastHwBurstToSlc(544) cannot add 1 element to context";
                          goto LABEL_15;
                        case 545:
                          id v19 = "ASPFTLParseBufferToCxt: slowHwToTlc(545) cannot add 1 element to context";
                          goto LABEL_15;
                        case 546:
                          if ((_DWORD)v14 != 10) {
                            sub_10001BA0C( "ASPFTLParseBufferToCxt: slcDemandBurstSizeDetected(546): (#10) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                          }
                          else {
                            unsigned int v20 = v14;
                          }
                          int v22 = "ASPFTLParseBufferToCxt: slcDemandBurstSizeDetected(546): Cannot add 10 elements to context";
                          goto LABEL_2247;
                        case 547:
                          if ((_DWORD)v14 != 10) {
                            sub_10001BA0C( "ASPFTLParseBufferToCxt: slcDemandBurstDur(547): (#10) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                          }
                          else {
                            unsigned int v20 = v14;
                          }
                          int v22 = "ASPFTLParseBufferToCxt: slcDemandBurstDur(547): Cannot add 10 elements to context";
                          goto LABEL_2247;
                        case 548:
                          id v19 = "ASPFTLParseBufferToCxt: fastHwToTlcBurst(548) cannot add 1 element to context";
                          goto LABEL_15;
                        case 549:
                          if ((_DWORD)v14 != 10) {
                            sub_10001BA0C( "ASPFTLParseBufferToCxt: slcDemandBurstSizeSlc(549): (#10) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                          }
                          else {
                            unsigned int v20 = v14;
                          }
                          int v22 = "ASPFTLParseBufferToCxt: slcDemandBurstSizeSlc(549): Cannot add 10 elements to context";
                          goto LABEL_2247;
                        case 551:
                          if ((_DWORD)v14 != 11) {
                            sub_10001BA0C( "ASPFTLParseBufferToCxt: balanceProportionBucketsHistogramTlc(551): (#11) cfg elements !=(%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                          }
                          else {
                            unsigned int v20 = v14;
                          }
                          int v22 = "ASPFTLParseBufferToCxt: balanceProportionBucketsHistogramTlc(551): Cannot add 11 elements to context";
                          goto LABEL_2247;
                        case 553:
                          id v19 = "ASPFTLParseBufferToCxt: slowHwFlushToSlc(553) cannot add 1 element to context";
                          goto LABEL_15;
                        case 557:
                          id v19 = "ASPFTLParseBufferToCxt: slowHwToSlc(557) cannot add 1 element to context";
                          goto LABEL_15;
                        case 558:
                          id v19 = "ASPFTLParseBufferToCxt: flushNwToSlc(558) cannot add 1 element to context";
                          goto LABEL_15;
                        case 559:
                          id v19 = "ASPFTLParseBufferToCxt: flushNwToTlc(559) cannot add 1 element to context";
                          goto LABEL_15;
                        case 560:
                          id v19 = "ASPFTLParseBufferToCxt: oslcHw(560) cannot add 1 element to context";
                          goto LABEL_15;
                        case 561:
                          id v19 = "ASPFTLParseBufferToCxt: oslcTransitions(561) cannot add 1 element to context";
                          goto LABEL_15;
                        case 563:
                          id v19 = "ASPFTLParseBufferToCxt: slcDemandFlushCount(563) cannot add 1 element to context";
                          goto LABEL_15;
                        case 564:
                          id v19 = "ASPFTLParseBufferToCxt: slcDemandBurstCount(564) cannot add 1 element to context";
                          goto LABEL_15;
                        case 565:
                          id v19 = "ASPFTLParseBufferToCxt: oslcBaseAvgPE(565) cannot add 1 element to context";
                          goto LABEL_15;
                        case 566:
                          id v19 = "ASPFTLParseBufferToCxt: raidReconstructFailNoSPBX(566) cannot add 1 element to context";
                          goto LABEL_15;
                        case 567:
                          id v19 = "ASPFTLParseBufferToCxt: raidReconstructFailDouble(567) cannot add 1 element to context";
                          goto LABEL_15;
                        case 568:
                          id v19 = "ASPFTLParseBufferToCxt: oslcFastWAmpUOnOff(568) cannot add 1 element to context";
                          goto LABEL_15;
                        case 569:
                          id v19 = "ASPFTLParseBufferToCxt: oslcSlowWAmpUOnOff(569) cannot add 1 element to context";
                          goto LABEL_15;
                        case 570:
                          id v19 = "ASPFTLParseBufferToCxt: raidReconstructFailInvalid(570) cannot add 1 element to context";
                          goto LABEL_15;
                        case 572:
                          id v19 = "ASPFTLParseBufferToCxt: oslcLastWAmpUx10(572) cannot add 1 element to context";
                          goto LABEL_15;
                        case 573:
                          id v19 = "ASPFTLParseBufferToCxt: raidFailedReadNoBlog(573) cannot add 1 element to context";
                          goto LABEL_15;
                        case 574:
                          id v19 = "ASPFTLParseBufferToCxt: raidReconstructFailBlank(574) cannot add 1 element to context";
                          goto LABEL_15;
                        case 575:
                          id v19 = "ASPFTLParseBufferToCxt: oslcHotTLCOnOff(575) cannot add 1 element to context";
                          goto LABEL_15;
                        case 576:
                          id v19 = "ASPFTLParseBufferToCxt: gcVPackDestinations(576) cannot add 1 element to context";
                          goto LABEL_15;
                        case 581:
                          id v19 = "ASPFTLParseBufferToCxt: averageTLCPECycles(581) cannot add 1 element to context";
                          goto LABEL_15;
                        case 582:
                          id v19 = "ASPFTLParseBufferToCxt: averageSLCPECycles(582) cannot add 1 element to context";
                          goto LABEL_15;
                        case 583:
                          id v19 = "ASPFTLParseBufferToCxt: numAtomicBoots(583) cannot add 1 element to context";
                          goto LABEL_15;
                        case 584:
                          id v19 = "ASPFTLParseBufferToCxt: clogMinorMismatch(584) cannot add 1 element to context";
                          goto LABEL_15;
                        case 586:
                          id v19 = "ASPFTLParseBufferToCxt: raidExpectedFailRMXReconstructionInternal(586) cannot add 1 element to context";
                          goto LABEL_15;
                        case 587:
                          id v19 = "ASPFTLParseBufferToCxt: raidExpectedFailRMXReconstructionHost(587) cannot add 1 element to context";
                          goto LABEL_15;
                        case 588:
                          id v19 = "ASPFTLParseBufferToCxt: oslcGCinvalidations(588) cannot add 1 element to context";
                          goto LABEL_15;
                        case 589:
                          id v19 = "ASPFTLParseBufferToCxt: oslcGCActivateReason(589) cannot add 1 element to context";
                          goto LABEL_15;
                        default:
                          switch(v12)
                          {
                            case 590:
                              id v19 = "ASPFTLParseBufferToCxt: oslcLowCleanBandsUOnOff(590) cannot add 1 element to context";
                              goto LABEL_15;
                            case 591:
                              id v19 = "ASPFTLParseBufferToCxt: oslcTooManyGCMustOnOff(591) cannot add 1 element to context";
                              goto LABEL_15;
                            case 592:
                              id v19 = "ASPFTLParseBufferToCxt: oslcBaseHostWrites(592) cannot add 1 element to context";
                              goto LABEL_15;
                            case 593:
                              id v19 = "ASPFTLParseBufferToCxt: oslcBaseBandErases(593) cannot add 1 element to context";
                              goto LABEL_15;
                            case 594:
                              id v19 = "ASPFTLParseBufferToCxt: oslcBdrBands(594) cannot add 1 element to context";
                              goto LABEL_15;
                            case 595:
                              id v19 = "ASPFTLParseBufferToCxt: oslcBdrValid(595) cannot add 1 element to context";
                              goto LABEL_15;
                            case 596:
                              id v19 = "ASPFTLParseBufferToCxt: unexpectedBlanksInternal(596) cannot add 1 element to context";
                              goto LABEL_15;
                            case 597:
                              id v19 = "ASPFTLParseBufferToCxt: unexpectedBlanksOnRV(597) cannot add 1 element to context";
                              goto LABEL_15;
                            case 601:
                              id v19 = "ASPFTLParseBufferToCxt: waterfallLockSectors(601) cannot add 1 element to context";
                              goto LABEL_15;
                            case 602:
                              id v19 = "ASPFTLParseBufferToCxt: oslcGCActiveWrites(602) cannot add 1 element to context";
                              goto LABEL_15;
                            case 603:
                              id v19 = "ASPFTLParseBufferToCxt: chipIdTemperatureSample(603) cannot add 1 element to context";
                              goto LABEL_15;
                            case 604:
                              id v19 = "ASPFTLParseBufferToCxt: gcVPackWrites(604) cannot add 1 element to context";
                              goto LABEL_15;
                            case 605:
                              if ((_DWORD)v14 != 10) {
                                sub_10001BA0C( "ASPFTLParseBufferToCxt: gcActiveReasons(605): (#10) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                              }
                              else {
                                unsigned int v20 = v14;
                              }
                              int v22 = "ASPFTLParseBufferToCxt: gcActiveReasons(605): Cannot add 10 elements to context";
                              goto LABEL_2247;
                            case 606:
                              id v19 = "ASPFTLParseBufferToCxt: eanMaxInitTimeMs(606) cannot add 1 element to context";
                              goto LABEL_15;
                            case 607:
                              id v19 = "ASPFTLParseBufferToCxt: eanMinToFirstReadTimeMs(607) cannot add 1 element to context";
                              goto LABEL_15;
                            case 608:
                              id v19 = "ASPFTLParseBufferToCxt: skinnyAPGMRetire(608) cannot add 1 element to context";
                              goto LABEL_15;
                            case 609:
                              id v19 = "ASPFTLParseBufferToCxt: unexpectedBlanksHost(609) cannot add 1 element to context";
                              goto LABEL_15;
                            case 610:
                              if ((_DWORD)v14 != 64) {
                                sub_10001BA0C( "ASPFTLParseBufferToCxt: pcieAerCounters(610): (#64) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                              }
                              else {
                                unsigned int v20 = v14;
                              }
                              int v22 = "ASPFTLParseBufferToCxt: pcieAerCounters(610): Cannot add 64 elements to context";
                              goto LABEL_2247;
                            case 611:
                              id v19 = "ASPFTLParseBufferToCxt: fastHwToTlcBalance(611) cannot add 1 element to context";
                              goto LABEL_15;
                            case 612:
                              id v19 = "ASPFTLParseBufferToCxt: perfOSLCRuns(612) cannot add 1 element to context";
                              goto LABEL_15;
                            case 613:
                              id v19 = "ASPFTLParseBufferToCxt: slcDemandBurstWritesInGC(613) cannot add 1 element to context";
                              goto LABEL_15;
                            case 614:
                              id v19 = "ASPFTLParseBufferToCxt: slcDemandBurstWritesInTT(614) cannot add 1 element to context";
                              goto LABEL_15;
                            case 615:
                              id v19 = "ASPFTLParseBufferToCxt: slcDemandBurstWritesInNRP(615) cannot add 1 element to context";
                              goto LABEL_15;
                            case 616:
                              id v19 = "ASPFTLParseBufferToCxt: perfTotalDmaMb(616) cannot add 1 element to context";
                              goto LABEL_15;
                            case 617:
                              id v19 = "ASPFTLParseBufferToCxt: eanAvgInitTimeMs(617) cannot add 1 element to context";
                              goto LABEL_15;
                            case 618:
                              id v19 = "ASPFTLParseBufferToCxt: eanAvgToFirstReadTimeMs(618) cannot add 1 element to context";
                              goto LABEL_15;
                            case 619:
                              id v19 = "ASPFTLParseBufferToCxt: eanMaxBootReadTimeMs(619) cannot add 1 element to context";
                              goto LABEL_15;
                            case 620:
                              id v19 = "ASPFTLParseBufferToCxt: eanAvgBootReadTimeMs(620) cannot add 1 element to context";
                              goto LABEL_15;
                            case 621:
                              if ((_DWORD)v14 != 10) {
                                sub_10001BA0C( "ASPFTLParseBufferToCxt: eanBootReadsHist(621): (#10) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                              }
                              else {
                                unsigned int v20 = v14;
                              }
                              int v22 = "ASPFTLParseBufferToCxt: eanBootReadsHist(621): Cannot add 10 elements to context";
                              goto LABEL_2247;
                            case 622:
                              id v19 = "ASPFTLParseBufferToCxt: maxBgInitTimeMs(622) cannot add 1 element to context";
                              goto LABEL_15;
                            case 623:
                              id v19 = "ASPFTLParseBufferToCxt: avgBgInitTimeMs(623) cannot add 1 element to context";
                              goto LABEL_15;
                            case 624:
                              if ((_DWORD)v14 != 16) {
                                sub_10001BA0C( "ASPFTLParseBufferToCxt: clogFailReason(624): (#16) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                              }
                              else {
                                unsigned int v20 = v14;
                              }
                              int v22 = "ASPFTLParseBufferToCxt: clogFailReason(624): Cannot add 16 elements to context";
                              goto LABEL_2247;
                            case 625:
                              id v19 = "ASPFTLParseBufferToCxt: eanMinBootReadMBPerSec(625) cannot add 1 element to context";
                              goto LABEL_15;
                            case 626:
                              id v19 = "ASPFTLParseBufferToCxt: eanAvgBootReadMBPerSec(626) cannot add 1 element to context";
                              goto LABEL_15;
                            case 627:
                              id v19 = "ASPFTLParseBufferToCxt: minSkinnyPECycles(627) cannot add 1 element to context";
                              goto LABEL_15;
                            case 628:
                              id v19 = "ASPFTLParseBufferToCxt: maxSkinnyPECycles(628) cannot add 1 element to context";
                              goto LABEL_15;
                            case 629:
                              id v19 = "ASPFTLParseBufferToCxt: averageSkinnyPECycles(629) cannot add 1 element to context";
                              goto LABEL_15;
                            case 630:
                              if ((_DWORD)v14 != 6) {
                                sub_10001BA0C( "ASPFTLParseBufferToCxt: raidSuccessfulRecoEAN(630): (#6) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                              }
                              else {
                                unsigned int v20 = v14;
                              }
                              int v22 = "ASPFTLParseBufferToCxt: raidSuccessfulRecoEAN(630): Cannot add 6 elements to context";
                              goto LABEL_2247;
                            case 631:
                              if ((_DWORD)v14 != 6) {
                                sub_10001BA0C( "ASPFTLParseBufferToCxt: raidFailedRecoEAN(631): (#6) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                              }
                              else {
                                unsigned int v20 = v14;
                              }
                              int v22 = "ASPFTLParseBufferToCxt: raidFailedRecoEAN(631): Cannot add 6 elements to context";
                              goto LABEL_2247;
                            case 632:
                              if ((_DWORD)v14 != 6) {
                                sub_10001BA0C( "ASPFTLParseBufferToCxt: eanFirstReadMode(632): (#6) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                              }
                              else {
                                unsigned int v20 = v14;
                              }
                              int v22 = "ASPFTLParseBufferToCxt: eanFirstReadMode(632): Cannot add 6 elements to context";
                              goto LABEL_2247;
                            case 635:
                              id v19 = "ASPFTLParseBufferToCxt: oslcHwGC(635) cannot add 1 element to context";
                              goto LABEL_15;
                            case 636:
                              id v19 = "ASPFTLParseBufferToCxt: oslcHwTT(636) cannot add 1 element to context";
                              goto LABEL_15;
                            case 637:
                              id v19 = "ASPFTLParseBufferToCxt: oslcHwNRP(637) cannot add 1 element to context";
                              goto LABEL_15;
                            case 638:
                              if ((_DWORD)v14 != 10) {
                                sub_10001BA0C( "ASPFTLParseBufferToCxt: oslcDemandBurstSize(638): (#10) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                              }
                              else {
                                unsigned int v20 = v14;
                              }
                              int v22 = "ASPFTLParseBufferToCxt: oslcDemandBurstSize(638): Cannot add 10 elements to context";
                              goto LABEL_2247;
                            case 639:
                              id v19 = "ASPFTLParseBufferToCxt: raidReconstructSuccessBandFlowOslc(639) cannot add 1 element to context";
                              goto LABEL_15;
                            case 640:
                              id v19 = "ASPFTLParseBufferToCxt: raidReconstructFailBandFlowOslc(640) cannot add 1 element to context";
                              goto LABEL_15;
                            case 641:
                              id v19 = "ASPFTLParseBufferToCxt: raidFailSectors(641) cannot add 1 element to context";
                              goto LABEL_15;
                            case 642:
                              id v19 = "ASPFTLParseBufferToCxt: eanFailSectors(642) cannot add 1 element to context";
                              goto LABEL_15;
                            case 643:
                              id v19 = "ASPFTLParseBufferToCxt: bdrTimeMode(643) cannot add 1 element to context";
                              goto LABEL_15;
                            case 644:
                              id v19 = "ASPFTLParseBufferToCxt: raidParityNotSavedP(644) cannot add 1 element to context";
                              goto LABEL_15;
                            case 645:
                              id v19 = "ASPFTLParseBufferToCxt: raidParityNotSavedQ(645) cannot add 1 element to context";
                              goto LABEL_15;
                            case 646:
                              id v19 = "ASPFTLParseBufferToCxt: raidParityInvalid(646) cannot add 1 element to context";
                              goto LABEL_15;
                            case 647:
                              id v19 = "ASPFTLParseBufferToCxt: raidParityUnknown(647) cannot add 1 element to context";
                              goto LABEL_15;
                            case 648:
                              id v19 = "ASPFTLParseBufferToCxt: raidParityUnmapped(648) cannot add 1 element to context";
                              goto LABEL_15;
                            case 649:
                              id v19 = "ASPFTLParseBufferToCxt: raidParityGCUnc(649) cannot add 1 element to context";
                              goto LABEL_15;
                            case 657:
                              id v19 = "ASPFTLParseBufferToCxt: AbortSkip_MPBXProbational(657) cannot add 1 element to context";
                              goto LABEL_15;
                            case 659:
                              id v19 = "ASPFTLParseBufferToCxt: raidVerificationReads(659) cannot add 1 element to context";
                              goto LABEL_15;
                            case 666:
                              id v19 = "ASPFTLParseBufferToCxt: nofDies(666) cannot add 1 element to context";
                              goto LABEL_15;
                            case 671:
                              id v19 = "ASPFTLParseBufferToCxt: skinnyBandsNum(671) cannot add 1 element to context";
                              goto LABEL_15;
                            case 672:
                              id v19 = "ASPFTLParseBufferToCxt: skinnyBandsNumDips(672) cannot add 1 element to context";
                              goto LABEL_15;
                            case 674:
                              if ((_DWORD)v14 != 8) {
                                sub_10001BA0C( "ASPFTLParseBufferToCxt: oslcNoVotesHw(674): (#8) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                              }
                              else {
                                unsigned int v20 = v14;
                              }
                              int v22 = "ASPFTLParseBufferToCxt: oslcNoVotesHw(674): Cannot add 8 elements to context";
                              goto LABEL_2247;
                            case 675:
                              id v19 = "ASPFTLParseBufferToCxt: totalLbas(675) cannot add 1 element to context";
                              goto LABEL_15;
                            case 676:
                              id v19 = "ASPFTLParseBufferToCxt: bdrHostPingExtra(676) cannot add 1 element to context";
                              goto LABEL_15;
                            case 677:
                              id v19 = "ASPFTLParseBufferToCxt: magazineInstanceMeta(677) cannot add 1 element to context";
                              goto LABEL_15;
                            default:
                              switch(v12)
                              {
                                case 680:
                                  if ((_DWORD)v14 != 3) {
                                    sub_10001BA0C( "ASPFTLParseBufferToCxt: magazineFWVersion(680): (#3) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                  }
                                  else {
                                    unsigned int v20 = v14;
                                  }
                                  int v22 = "ASPFTLParseBufferToCxt: magazineFWVersion(680): Cannot add 3 elements to context";
                                  goto LABEL_2247;
                                case 681:
                                  id v19 = "ASPFTLParseBufferToCxt: raidReconstructFailPMXUnsup(681) cannot add 1 element to context";
                                  goto LABEL_15;
                                case 682:
                                  id v19 = "ASPFTLParseBufferToCxt: raidReconstructFailBMXUnsup(682) cannot add 1 element to context";
                                  goto LABEL_15;
                                case 683:
                                  id v19 = "ASPFTLParseBufferToCxt: iBootNANDResets(683) cannot add 1 element to context";
                                  goto LABEL_15;
                                case 684:
                                  id v19 = "ASPFTLParseBufferToCxt: pcieClkreqHighTimeout(684) cannot add 1 element to context";
                                  goto LABEL_15;
                                case 687:
                                  if ((_DWORD)v14 != 3) {
                                    sub_10001BA0C( "ASPFTLParseBufferToCxt: cbdrInitSent(687): (#3) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                  }
                                  else {
                                    unsigned int v20 = v14;
                                  }
                                  int v22 = "ASPFTLParseBufferToCxt: cbdrInitSent(687): Cannot add 3 elements to context";
                                  goto LABEL_2247;
                                case 688:
                                  id v19 = "ASPFTLParseBufferToCxt: cbdrPauseSent(688) cannot add 1 element to context";
                                  goto LABEL_15;
                                case 689:
                                  id v19 = "ASPFTLParseBufferToCxt: cbdrResumeSent(689) cannot add 1 element to context";
                                  goto LABEL_15;
                                case 690:
                                  id v19 = "ASPFTLParseBufferToCxt: cbdrGetResultSent(690) cannot add 1 element to context";
                                  goto LABEL_15;
                                case 691:
                                  id v19 = "ASPFTLParseBufferToCxt: cbdrEarlyExits(691) cannot add 1 element to context";
                                  goto LABEL_15;
                                case 694:
                                  if ((_DWORD)v14 != 10) {
                                    sub_10001BA0C( "ASPFTLParseBufferToCxt: cbdrRefreshGrades(694): (#10) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                  }
                                  else {
                                    unsigned int v20 = v14;
                                  }
                                  int v22 = "ASPFTLParseBufferToCxt: cbdrRefreshGrades(694): Cannot add 10 elements to context";
                                  goto LABEL_2247;
                                case 695:
                                  id v19 = "ASPFTLParseBufferToCxt: cbdrNotEnoughReads(695) cannot add 1 element to context";
                                  goto LABEL_15;
                                case 696:
                                  id v19 = "ASPFTLParseBufferToCxt: cbdrAborts(696) cannot add 1 element to context";
                                  goto LABEL_15;
                                case 697:
                                  id v19 = "ASPFTLParseBufferToCxt: TurboRaidHostClassifications(697) cannot add 1 element to context";
                                  goto LABEL_15;
                                case 698:
                                  id v19 = "ASPFTLParseBufferToCxt: TurboRaidInternalClassifications(698) cannot add 1 element to context";
                                  goto LABEL_15;
                                case 699:
                                  id v19 = "ASPFTLParseBufferToCxt: cbdrFullyDone(699) cannot add 1 element to context";
                                  goto LABEL_15;
                                case 702:
                                  if ((_DWORD)v14 != 32) {
                                    sub_10001BA0C( "ASPFTLParseBufferToCxt: vcurve(702): (#32) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                  }
                                  else {
                                    unsigned int v20 = v14;
                                  }
                                  int v22 = "ASPFTLParseBufferToCxt: vcurve(702): Cannot add 32 elements to context";
                                  goto LABEL_2247;
                                case 703:
                                  if ((_DWORD)v14 != 12) {
                                    sub_10001BA0C( "ASPFTLParseBufferToCxt: injDepth(703): (#12) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                  }
                                  else {
                                    unsigned int v20 = v14;
                                  }
                                  int v22 = "ASPFTLParseBufferToCxt: injDepth(703): Cannot add 12 elements to context";
                                  goto LABEL_2247;
                                case 704:
                                  id v19 = "ASPFTLParseBufferToCxt: logical_disk_occupied_promiles(704) cannot add 1 element to context";
                                  goto LABEL_15;
                                case 711:
                                  id v19 = "ASPFTLParseBufferToCxt: raidPrevFailedReconstructSkip(711) cannot add 1 element to context";
                                  goto LABEL_15;
                                case 712:
                                  id v19 = "ASPFTLParseBufferToCxt: TurboRaidSuccessfulHostAuxReads(712) cannot add 1 element to context";
                                  goto LABEL_15;
                                case 713:
                                  id v19 = "ASPFTLParseBufferToCxt: TurboRaidSuccessfulInternalAuxReads(713) cannot add 1 el"
                                        "ement to context";
                                  goto LABEL_15;
                                case 714:
                                  id v19 = "ASPFTLParseBufferToCxt: turboRaidClassificationReliabilityHost(714) cannot add 1"
                                        " element to context";
                                  goto LABEL_15;
                                case 715:
                                  if ((sub_10002B6E0( a1,  "turboRaidClassificationReliabilityInternal",  (uint64_t)v8,  8u,  1u) & 1) != 0) {
                                    goto LABEL_16;
                                  }
                                  id v19 = "ASPFTLParseBufferToCxt: turboRaidClassificationReliabilityInternal(715) cannot a"
                                        "dd 1 element to context";
                                  goto LABEL_15;
                                case 716:
                                  id v19 = "ASPFTLParseBufferToCxt: turboRaidClassificationQualityHost(716) cannot add 1 element to context";
                                  goto LABEL_15;
                                case 717:
                                  id v19 = "ASPFTLParseBufferToCxt: turboRaidClassificationQualityInternal(717) cannot add 1"
                                        " element to context";
                                  goto LABEL_15;
                                case 719:
                                  id v19 = "ASPFTLParseBufferToCxt: skinnyBandErases(719) cannot add 1 element to context";
                                  goto LABEL_15;
                                case 721:
                                  id v19 = "ASPFTLParseBufferToCxt: gcPDusterDestinations(721) cannot add 1 element to context";
                                  goto LABEL_15;
                                case 722:
                                  id v19 = "ASPFTLParseBufferToCxt: gcPDusterWrites(722) cannot add 1 element to context";
                                  goto LABEL_15;
                                case 730:
                                  id v19 = "ASPFTLParseBufferToCxt: rvFails(730) cannot add 1 element to context";
                                  goto LABEL_15;
                                case 737:
                                  id v19 = "ASPFTLParseBufferToCxt: TurboRaidFailedHostAuxReads(737) cannot add 1 element to context";
                                  goto LABEL_15;
                                case 738:
                                  id v19 = "ASPFTLParseBufferToCxt: TurboRaidFailedInternalAuxReads(738) cannot add 1 element to context";
                                  goto LABEL_15;
                                case 741:
                                  id v19 = "ASPFTLParseBufferToCxt: autoSkipTriggers(741) cannot add 1 element to context";
                                  goto LABEL_15;
                                case 742:
                                  id v19 = "ASPFTLParseBufferToCxt: autoSkipPlanes(742) cannot add 1 element to context";
                                  goto LABEL_15;
                                case 744:
                                  if ((_DWORD)v14 != 8) {
                                    sub_10001BA0C( "ASPFTLParseBufferToCxt: raidReconstructDurationHisto(744): (#8) cfg elements != (% d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                  }
                                  else {
                                    unsigned int v20 = v14;
                                  }
                                  int v22 = "ASPFTLParseBufferToCxt: raidReconstructDurationHisto(744): Cannot add 8 elements to context";
                                  goto LABEL_2247;
                                case 745:
                                  if ((_DWORD)v14 != 8) {
                                    sub_10001BA0C( "ASPFTLParseBufferToCxt: failsOnReconstructHisto(745): (#8) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                  }
                                  else {
                                    unsigned int v20 = v14;
                                  }
                                  int v22 = "ASPFTLParseBufferToCxt: failsOnReconstructHisto(745): Cannot add 8 elements to context";
                                  goto LABEL_2247;
                                case 746:
                                  id v19 = "ASPFTLParseBufferToCxt: bandKill_userFlattenExcessive(746) cannot add 1 element to context";
                                  goto LABEL_15;
                                case 747:
                                  id v19 = "ASPFTLParseBufferToCxt: bandKill_IntFlattenExcessive(747) cannot add 1 element to context";
                                  goto LABEL_15;
                                case 748:
                                  id v19 = "ASPFTLParseBufferToCxt: bandKill_userFlattenBalance(748) cannot add 1 element to context";
                                  goto LABEL_15;
                                case 749:
                                  id v19 = "ASPFTLParseBufferToCxt: bandKill_intFlattenBalance(749) cannot add 1 element to context";
                                  goto LABEL_15;
                                case 750:
                                  id v19 = "ASPFTLParseBufferToCxt: bandKill_formatVertExcessive(750) cannot add 1 element to context";
                                  goto LABEL_15;
                                case 751:
                                  id v19 = "ASPFTLParseBufferToCxt: bandKill_formatVertBalance(751) cannot add 1 element to context";
                                  goto LABEL_15;
                                case 753:
                                  id v19 = "ASPFTLParseBufferToCxt: cbdrNumSlowRefreshes(753) cannot add 1 element to context";
                                  goto LABEL_15;
                                case 754:
                                  id v19 = "ASPFTLParseBufferToCxt: cbdrNumFastRefreshes(754) cannot add 1 element to context";
                                  goto LABEL_15;
                                case 755:
                                  id v19 = "ASPFTLParseBufferToCxt: cbdrTotalRefreshValidity(755) cannot add 1 element to context";
                                  goto LABEL_15;
                                case 756:
                                  if ((_DWORD)v14 != 9) {
                                    sub_10001BA0C( "ASPFTLParseBufferToCxt: cbdrRefreshedAges(756): (#9) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                  }
                                  else {
                                    unsigned int v20 = v14;
                                  }
                                  int v22 = "ASPFTLParseBufferToCxt: cbdrRefreshedAges(756): Cannot add 9 elements to context";
                                  goto LABEL_2247;
                                case 758:
                                  id v19 = "ASPFTLParseBufferToCxt: cbdrSkippedBlocks(758) cannot add 1 element to context";
                                  goto LABEL_15;
                                case 759:
                                  if ((_DWORD)v14 != 5) {
                                    sub_10001BA0C( "ASPFTLParseBufferToCxt: cbdrScanPct(759): (#5) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                  }
                                  else {
                                    unsigned int v20 = v14;
                                  }
                                  int v22 = "ASPFTLParseBufferToCxt: cbdrScanPct(759): Cannot add 5 elements to context";
                                  goto LABEL_2247;
                                case 760:
                                  if ((sub_10002B6E0( a1,  "raidSuccessfulBMXReconstructionInternal",  (uint64_t)v8,  8u,  1u) & 1) != 0) {
                                    goto LABEL_16;
                                  }
                                  id v19 = "ASPFTLParseBufferToCxt: raidSuccessfulBMXReconstructionInternal(760) cannot add "
                                        "1 element to context";
                                  goto LABEL_15;
                                case 761:
                                  id v19 = "ASPFTLParseBufferToCxt: raidSuccessfulBMXReconstructionHost(761) cannot add 1 el"
                                        "ement to context";
                                  goto LABEL_15;
                                case 762:
                                  id v19 = "ASPFTLParseBufferToCxt: raidFailedBMXReconstructionInternal(762) cannot add 1 el"
                                        "ement to context";
                                  goto LABEL_15;
                                case 763:
                                  id v19 = "ASPFTLParseBufferToCxt: raidFailedBMXReconstructionHost(763) cannot add 1 element to context";
                                  goto LABEL_15;
                                case 764:
                                  id v19 = "ASPFTLParseBufferToCxt: ricSPRVFail(764) cannot add 1 element to context";
                                  goto LABEL_15;
                                case 765:
                                  id v19 = "ASPFTLParseBufferToCxt: ricMPRVFail(765) cannot add 1 element to context";
                                  goto LABEL_15;
                                case 767:
                                  if ((_DWORD)v14 != 10) {
                                    sub_10001BA0C( "ASPFTLParseBufferToCxt: cbdrRefreshGradesSLC(767): (#10) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                  }
                                  else {
                                    unsigned int v20 = v14;
                                  }
                                  int v22 = "ASPFTLParseBufferToCxt: cbdrRefreshGradesSLC(767): Cannot add 10 elements to context";
                                  goto LABEL_2247;
                                case 768:
                                  if ((_DWORD)v14 != 9) {
                                    sub_10001BA0C( "ASPFTLParseBufferToCxt: cbdrRefreshedAgesSLC(768): (#9) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                  }
                                  else {
                                    unsigned int v20 = v14;
                                  }
                                  int v22 = "ASPFTLParseBufferToCxt: cbdrRefreshedAgesSLC(768): Cannot add 9 elements to context";
                                  goto LABEL_2247;
                                case 769:
                                  if ((_DWORD)v14 != 5) {
                                    sub_10001BA0C( "ASPFTLParseBufferToCxt: cbdrScanPctSLC(769): (#5) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                  }
                                  else {
                                    unsigned int v20 = v14;
                                  }
                                  int v22 = "ASPFTLParseBufferToCxt: cbdrScanPctSLC(769): Cannot add 5 elements to context";
                                  goto LABEL_2247;
                                case 770:
                                  if ((_DWORD)v14 != 8) {
                                    sub_10001BA0C( "ASPFTLParseBufferToCxt: cpuBurstLength(770): (#8) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                  }
                                  else {
                                    unsigned int v20 = v14;
                                  }
                                  int v22 = "ASPFTLParseBufferToCxt: cpuBurstLength(770): Cannot add 8 elements to context";
                                  goto LABEL_2247;
                                case 771:
                                  id v19 = "ASPFTLParseBufferToCxt: autoSkipRaidRecoFail(771) cannot add 1 element to context";
                                  goto LABEL_15;
                                case 772:
                                  if ((_DWORD)v14 != 32) {
                                    sub_10001BA0C( "ASPFTLParseBufferToCxt: dmReasonsSlc(772): (#32) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                  }
                                  else {
                                    unsigned int v20 = v14;
                                  }
                                  int v22 = "ASPFTLParseBufferToCxt: dmReasonsSlc(772): Cannot add 32 elements to context";
                                  goto LABEL_2247;
                                case 773:
                                  if ((_DWORD)v14 != 32) {
                                    sub_10001BA0C( "ASPFTLParseBufferToCxt: dmReasonsTlc(773): (#32) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                  }
                                  else {
                                    unsigned int v20 = v14;
                                  }
                                  int v22 = "ASPFTLParseBufferToCxt: dmReasonsTlc(773): Cannot add 32 elements to context";
                                  goto LABEL_2247;
                                case 774:
                                  id v19 = "ASPFTLParseBufferToCxt: raidReconstructFailBMXAbort(774) cannot add 1 element to context";
                                  goto LABEL_15;
                                case 775:
                                  id v19 = "ASPFTLParseBufferToCxt: bandKill_fatBindingNoBlocks(775) cannot add 1 element to context";
                                  goto LABEL_15;
                                case 776:
                                  id v19 = "ASPFTLParseBufferToCxt: bandKill_fatBindingFewBlocks(776) cannot add 1 element to context";
                                  goto LABEL_15;
                                default:
                                  switch(v12)
                                  {
                                    case 777:
                                      id v19 = "ASPFTLParseBufferToCxt: numBadBootBlocks(777) cannot add 1 element to context";
                                      goto LABEL_15;
                                    case 778:
                                      id v19 = "ASPFTLParseBufferToCxt: snapshotCPUHigh(778) cannot add 1 element to context";
                                      goto LABEL_15;
                                    case 779:
                                      id v19 = "ASPFTLParseBufferToCxt: snapshotCPULow(779) cannot add 1 element to context";
                                      goto LABEL_15;
                                    case 780:
                                      id v19 = "ASPFTLParseBufferToCxt: gcWithoutBMs(780) cannot add 1 element to context";
                                      goto LABEL_15;
                                    case 781:
                                      if ((_DWORD)v14 != 10) {
                                        sub_10001BA0C( "ASPFTLParseBufferToCxt: gcSearchTimeHistory(781): (#10) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                      }
                                      else {
                                        unsigned int v20 = v14;
                                      }
                                      int v22 = "ASPFTLParseBufferToCxt: gcSearchTimeHistory(781): Cannot add 10 elements to context";
                                      goto LABEL_2247;
                                    case 785:
                                      if ((_DWORD)v14 != 16) {
                                        sub_10001BA0C( "ASPFTLParseBufferToCxt: gcSearchPortion(785): (#16) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                      }
                                      else {
                                        unsigned int v20 = v14;
                                      }
                                      int v22 = "ASPFTLParseBufferToCxt: gcSearchPortion(785): Cannot add 16 elements to context";
                                      goto LABEL_2247;
                                    case 786:
                                      id v19 = "ASPFTLParseBufferToCxt: raidReconstructFailBmxMp(786) cannot add 1 element to context";
                                      goto LABEL_15;
                                    case 787:
                                      id v19 = "ASPFTLParseBufferToCxt: raidReconstructFailBmx(787) cannot add 1 element to context";
                                      goto LABEL_15;
                                    case 788:
                                      id v19 = "ASPFTLParseBufferToCxt: raidReconstructFailBMXUECC(788) cannot add 1 element to context";
                                      goto LABEL_15;
                                    case 789:
                                      id v19 = "ASPFTLParseBufferToCxt: raidReconstructFailBMXBlank(789) cannot add 1 element to context";
                                      goto LABEL_15;
                                    case 790:
                                      id v19 = "ASPFTLParseBufferToCxt: raidPrevFailedReconstructBmxMpSkip(790) cannot add 1"
                                            " element to context";
                                      goto LABEL_15;
                                    case 792:
                                      id v19 = "ASPFTLParseBufferToCxt: numTLCFatBands(792) cannot add 1 element to context";
                                      goto LABEL_15;
                                    case 793:
                                      id v19 = "ASPFTLParseBufferToCxt: fatValidity(793) cannot add 1 element to context";
                                      goto LABEL_15;
                                    case 794:
                                      id v19 = "ASPFTLParseBufferToCxt: fatTotal(794) cannot add 1 element to context";
                                      goto LABEL_15;
                                    case 798:
                                      if ((_DWORD)v14 != 4) {
                                        sub_10001BA0C( "ASPFTLParseBufferToCxt: raidBMXFailP(798): (#4) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                      }
                                      else {
                                        unsigned int v20 = v14;
                                      }
                                      int v22 = "ASPFTLParseBufferToCxt: raidBMXFailP(798): Cannot add 4 elements to context";
                                      goto LABEL_2247;
                                    case 799:
                                      if ((_DWORD)v14 != 4) {
                                        sub_10001BA0C( "ASPFTLParseBufferToCxt: raidBMXFailUECC(799): (#4) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                      }
                                      else {
                                        unsigned int v20 = v14;
                                      }
                                      int v22 = "ASPFTLParseBufferToCxt: raidBMXFailUECC(799): Cannot add 4 elements to context";
                                      goto LABEL_2247;
                                    case 804:
                                      if ((_DWORD)v14 != 4) {
                                        sub_10001BA0C( "ASPFTLParseBufferToCxt: raidBMXFailNoSPBX(804): (#4) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                      }
                                      else {
                                        unsigned int v20 = v14;
                                      }
                                      int v22 = "ASPFTLParseBufferToCxt: raidBMXFailNoSPBX(804): Cannot add 4 elements to context";
                                      goto LABEL_2247;
                                    case 806:
                                      if ((_DWORD)v14 != 4) {
                                        sub_10001BA0C( "ASPFTLParseBufferToCxt: raidBMXFailBlank(806): (#4) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                      }
                                      else {
                                        unsigned int v20 = v14;
                                      }
                                      int v22 = "ASPFTLParseBufferToCxt: raidBMXFailBlank(806): Cannot add 4 elements to context";
                                      goto LABEL_2247;
                                    case 809:
                                      if ((_DWORD)v14 != 4) {
                                        sub_10001BA0C( "ASPFTLParseBufferToCxt: raidBMXFailUnsup(809): (#4) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                      }
                                      else {
                                        unsigned int v20 = v14;
                                      }
                                      int v22 = "ASPFTLParseBufferToCxt: raidBMXFailUnsup(809): Cannot add 4 elements to context";
                                      goto LABEL_2247;
                                    case 811:
                                      if ((_DWORD)v14 != 4) {
                                        sub_10001BA0C( "ASPFTLParseBufferToCxt: raidBMXFailMpSkip(811): (#4) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                      }
                                      else {
                                        unsigned int v20 = v14;
                                      }
                                      int v22 = "ASPFTLParseBufferToCxt: raidBMXFailMpSkip(811): Cannot add 4 elements to context";
                                      goto LABEL_2247;
                                    case 812:
                                      if ((_DWORD)v14 != 4) {
                                        sub_10001BA0C( "ASPFTLParseBufferToCxt: raidBMXFailAbort(812): (#4) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                      }
                                      else {
                                        unsigned int v20 = v14;
                                      }
                                      int v22 = "ASPFTLParseBufferToCxt: raidBMXFailAbort(812): Cannot add 4 elements to context";
                                      goto LABEL_2247;
                                    case 813:
                                      id v19 = "ASPFTLParseBufferToCxt: TurboRaidIsEnabled(813) cannot add 1 element to context";
                                      goto LABEL_15;
                                    case 814:
                                      if ((_DWORD)v14 != 4) {
                                        sub_10001BA0C( "ASPFTLParseBufferToCxt: raidBMXFailOther(814): (#4) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                      }
                                      else {
                                        unsigned int v20 = v14;
                                      }
                                      int v22 = "ASPFTLParseBufferToCxt: raidBMXFailOther(814): Cannot add 4 elements to context";
                                      goto LABEL_2247;
                                    case 815:
                                      if ((_DWORD)v14 != 4) {
                                        sub_10001BA0C( "ASPFTLParseBufferToCxt: raidBMXSuccess(815): (#4) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                      }
                                      else {
                                        unsigned int v20 = v14;
                                      }
                                      int v22 = "ASPFTLParseBufferToCxt: raidBMXSuccess(815): Cannot add 4 elements to context";
                                      goto LABEL_2247;
                                    case 816:
                                      id v19 = "ASPFTLParseBufferToCxt: skinnyBandsExtraDip(816) cannot add 1 element to context";
                                      goto LABEL_15;
                                    case 821:
                                      id v19 = "ASPFTLParseBufferToCxt: writeAmp(821) cannot add 1 element to context";
                                      goto LABEL_15;
                                    case 822:
                                      id v19 = "ASPFTLParseBufferToCxt: ricMaxClogOnlyPages(822) cannot add 1 element to context";
                                      goto LABEL_15;
                                    case 823:
                                      if ((_DWORD)v14 != 3) {
                                        sub_10001BA0C( "ASPFTLParseBufferToCxt: readClassifyStatusesHisto(823): (#3) cfg elements !=(%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                      }
                                      else {
                                        unsigned int v20 = v14;
                                      }
                                      int v22 = "ASPFTLParseBufferToCxt: readClassifyStatusesHisto(823): Cannot add 3 elements to context";
                                      goto LABEL_2247;
                                    case 824:
                                      if ((_DWORD)v14 != 10) {
                                        sub_10001BA0C( "ASPFTLParseBufferToCxt: readWithAuxStatusesHisto(824): (#10) cfg elements !=(%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                      }
                                      else {
                                        unsigned int v20 = v14;
                                      }
                                      int v22 = "ASPFTLParseBufferToCxt: readWithAuxStatusesHisto(824): Cannot add 10 elements to context";
                                      goto LABEL_2247;
                                    case 825:
                                      if ((_DWORD)v14 != 10) {
                                        sub_10001BA0C( "ASPFTLParseBufferToCxt: readReconstructStatusesHisto(825): (#10) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                      }
                                      else {
                                        unsigned int v20 = v14;
                                      }
                                      int v22 = "ASPFTLParseBufferToCxt: readReconstructStatusesHisto(825): Cannot add 10 ele"
                                            "ments to context";
                                      goto LABEL_2247;
                                    case 826:
                                      id v19 = "ASPFTLParseBufferToCxt: bdrBackupChecks(826) cannot add 1 element to context";
                                      goto LABEL_15;
                                    case 827:
                                      id v19 = "ASPFTLParseBufferToCxt: ricExceedClogOnlyPagesTH(827) cannot add 1 element to context";
                                      goto LABEL_15;
                                    case 828:
                                      id v19 = "ASPFTLParseBufferToCxt: numDipFailures(828) cannot add 1 element to context";
                                      goto LABEL_15;
                                    case 831:
                                      id v19 = "ASPFTLParseBufferToCxt: prefetchNextRange(831) cannot add 1 element to context";
                                      goto LABEL_15;
                                    case 862:
                                      id v19 = "ASPFTLParseBufferToCxt: raidSuccessfulSkip(862) cannot add 1 element to context";
                                      goto LABEL_15;
                                    case 863:
                                      id v19 = "ASPFTLParseBufferToCxt: raidFailedSkip(863) cannot add 1 element to context";
                                      goto LABEL_15;
                                    case 864:
                                      id v19 = "ASPFTLParseBufferToCxt: raidSkipAttempts(864) cannot add 1 element to context";
                                      goto LABEL_15;
                                    case 865:
                                      if ((_DWORD)v14 != 16) {
                                        sub_10001BA0C( "ASPFTLParseBufferToCxt: timeOfThrottlingPerLevel(865): (#16) cfg elements !=(%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                      }
                                      else {
                                        unsigned int v20 = v14;
                                      }
                                      int v22 = "ASPFTLParseBufferToCxt: timeOfThrottlingPerLevel(865): Cannot add 16 elements to context";
                                      goto LABEL_2247;
                                    case 866:
                                      if ((_DWORD)v14 != 16) {
                                        sub_10001BA0C( "ASPFTLParseBufferToCxt: timeOfThrottlingPerReadLevel(866): (#16) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                      }
                                      else {
                                        unsigned int v20 = v14;
                                      }
                                      int v22 = "ASPFTLParseBufferToCxt: timeOfThrottlingPerReadLevel(866): Cannot add 16 ele"
                                            "ments to context";
                                      goto LABEL_2247;
                                    case 867:
                                      if ((_DWORD)v14 != 16) {
                                        sub_10001BA0C( "ASPFTLParseBufferToCxt: timeOfThrottlingPerWriteLevel(867): (#16) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                      }
                                      else {
                                        unsigned int v20 = v14;
                                      }
                                      int v22 = "ASPFTLParseBufferToCxt: timeOfThrottlingPerWriteLevel(867): Cannot add 16 el"
                                            "ements to context";
                                      goto LABEL_2247;
                                    case 868:
                                      if ((_DWORD)v14 != 32) {
                                        sub_10001BA0C( "ASPFTLParseBufferToCxt: dmReasonsSlc_1bc(868): (#32) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                      }
                                      else {
                                        unsigned int v20 = v14;
                                      }
                                      int v22 = "ASPFTLParseBufferToCxt: dmReasonsSlc_1bc(868): Cannot add 32 elements to context";
                                      goto LABEL_2247;
                                    case 869:
                                      if ((_DWORD)v14 != 32) {
                                        sub_10001BA0C( "ASPFTLParseBufferToCxt: dmReasonsTlc_1bc(869): (#32) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                      }
                                      else {
                                        unsigned int v20 = v14;
                                      }
                                      int v22 = "ASPFTLParseBufferToCxt: dmReasonsTlc_1bc(869): Cannot add 32 elements to context";
                                      goto LABEL_2247;
                                    case 870:
                                      if ((_DWORD)v14 != 32) {
                                        sub_10001BA0C( "ASPFTLParseBufferToCxt: dmReasonsSlc_1bc_he(870): (#32) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                      }
                                      else {
                                        unsigned int v20 = v14;
                                      }
                                      int v22 = "ASPFTLParseBufferToCxt: dmReasonsSlc_1bc_he(870): Cannot add 32 elements to context";
                                      goto LABEL_2247;
                                    case 871:
                                      if ((_DWORD)v14 != 32) {
                                        sub_10001BA0C( "ASPFTLParseBufferToCxt: dmReasonsTlc_1bc_he(871): (#32) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                      }
                                      else {
                                        unsigned int v20 = v14;
                                      }
                                      int v22 = "ASPFTLParseBufferToCxt: dmReasonsTlc_1bc_he(871): Cannot add 32 elements to context";
                                      goto LABEL_2247;
                                    case 876:
                                      if ((_DWORD)v14 != 32) {
                                        sub_10001BA0C( "ASPFTLParseBufferToCxt: dmReasonsSlc_mbc(876): (#32) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                      }
                                      else {
                                        unsigned int v20 = v14;
                                      }
                                      int v22 = "ASPFTLParseBufferToCxt: dmReasonsSlc_mbc(876): Cannot add 32 elements to context";
                                      goto LABEL_2247;
                                    case 877:
                                      if ((_DWORD)v14 != 32) {
                                        sub_10001BA0C( "ASPFTLParseBufferToCxt: dmReasonsTlc_mbc(877): (#32) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                      }
                                      else {
                                        unsigned int v20 = v14;
                                      }
                                      int v22 = "ASPFTLParseBufferToCxt: dmReasonsTlc_mbc(877): Cannot add 32 elements to context";
                                      goto LABEL_2247;
                                    case 883:
                                      id v19 = "ASPFTLParseBufferToCxt: clogEmptyProgramms(883) cannot add 1 element to context";
                                      goto LABEL_15;
                                    case 884:
                                      id v19 = "ASPFTLParseBufferToCxt: oslcHwCloseBand(884) cannot add 1 element to context";
                                      goto LABEL_15;
                                    case 891:
                                      if ((_DWORD)v14 != 2) {
                                        sub_10001BA0C( "ASPFTLParseBufferToCxt: turboRaidSuccessAuxPartition(891): (#2) cfg elements ! = (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                      }
                                      else {
                                        unsigned int v20 = v14;
                                      }
                                      int v22 = "ASPFTLParseBufferToCxt: turboRaidSuccessAuxPartition(891): Cannot add 2 elements to context";
                                      goto LABEL_2247;
                                    case 892:
                                      if ((_DWORD)v14 != 2) {
                                        sub_10001BA0C( "ASPFTLParseBufferToCxt: turboRaidFailAuxPartition(892): (#2) cfg elements !=(%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                      }
                                      else {
                                        unsigned int v20 = v14;
                                      }
                                      int v22 = "ASPFTLParseBufferToCxt: turboRaidFailAuxPartition(892): Cannot add 2 elements to context";
                                      goto LABEL_2247;
                                    case 893:
                                      if ((_DWORD)v14 != 2) {
                                        sub_10001BA0C( "ASPFTLParseBufferToCxt: turboRaidClassifyQualPartition(893): (#2) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                      }
                                      else {
                                        unsigned int v20 = v14;
                                      }
                                      int v22 = "ASPFTLParseBufferToCxt: turboRaidClassifyQualPartition(893): Cannot add 2 el"
                                            "ements to context";
                                      goto LABEL_2247;
                                    case 894:
                                      if ((_DWORD)v14 != 2) {
                                        sub_10001BA0C( "ASPFTLParseBufferToCxt: turboRaidClassifyRelPartition(894): (#2) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                      }
                                      else {
                                        unsigned int v20 = v14;
                                      }
                                      int v22 = "ASPFTLParseBufferToCxt: turboRaidClassifyRelPartition(894): Cannot add 2 ele"
                                            "ments to context";
                                      goto LABEL_2247;
                                    case 895:
                                      id v19 = "ASPFTLParseBufferToCxt: IND_pool_freeMinSilo(895) cannot add 1 element to context";
                                      goto LABEL_15;
                                    case 896:
                                      id v19 = "ASPFTLParseBufferToCxt: autoSweepBlocks(896) cannot add 1 element to context";
                                      goto LABEL_15;
                                    case 897:
                                      if ((_DWORD)v14 != 16) {
                                        sub_10001BA0C( "ASPFTLParseBufferToCxt: wcWrFragSizes(897): (#16) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                      }
                                      else {
                                        unsigned int v20 = v14;
                                      }
                                      int v22 = "ASPFTLParseBufferToCxt: wcWrFragSizes(897): Cannot add 16 elements to context";
                                      goto LABEL_2247;
                                    case 898:
                                      if ((_DWORD)v14 != 16) {
                                        sub_10001BA0C( "ASPFTLParseBufferToCxt: indStateAcrossGcDidNoL(898): (#16) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                      }
                                      else {
                                        unsigned int v20 = v14;
                                      }
                                      int v22 = "ASPFTLParseBufferToCxt: indStateAcrossGcDidNoL(898): Cannot add 16 elements to context";
                                      goto LABEL_2247;
                                    case 899:
                                      if ((_DWORD)v14 != 16) {
                                        sub_10001BA0C( "ASPFTLParseBufferToCxt: indStateAcrossGcDidL(899): (#16) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                      }
                                      else {
                                        unsigned int v20 = v14;
                                      }
                                      int v22 = "ASPFTLParseBufferToCxt: indStateAcrossGcDidL(899): Cannot add 16 elements to context";
                                      goto LABEL_2247;
                                    case 900:
                                      id v19 = "ASPFTLParseBufferToCxt: turboRaidNoClassifyDueToWasRetire(900) cannot add 1 "
                                            "element to context";
                                      goto LABEL_15;
                                    case 901:
                                      id v19 = "ASPFTLParseBufferToCxt: turboRaidNoClassifyDueToOpenBand(901) cannot add 1 e"
                                            "lement to context";
                                      goto LABEL_15;
                                    case 902:
                                      if ((sub_10002B6E0( a1,  "turboRaidNoClassifyDueToQualityBlock",  (uint64_t)v8,  8u,  1u) & 1) != 0) {
                                        goto LABEL_16;
                                      }
                                      id v19 = "ASPFTLParseBufferToCxt: turboRaidNoClassifyDueToQualityBlock(902) cannot add"
                                            " 1 element to context";
                                      goto LABEL_15;
                                    case 903:
                                      id v19 = "ASPFTLParseBufferToCxt: turboRaidGbbOpenBand(903) cannot add 1 element to context";
                                      goto LABEL_15;
                                    case 904:
                                      id v19 = "ASPFTLParseBufferToCxt: turboRaidGbbShouldRetireOnRefresh(904) cannot add 1 "
                                            "element to context";
                                      goto LABEL_15;
                                    case 905:
                                      if ((_DWORD)v14 != 16) {
                                        sub_10001BA0C( "ASPFTLParseBufferToCxt: turboRaidRelPerBlock(905): (#16) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                      }
                                      else {
                                        unsigned int v20 = v14;
                                      }
                                      int v22 = "ASPFTLParseBufferToCxt: turboRaidRelPerBlock(905): Cannot add 16 elements to context";
                                      goto LABEL_2247;
                                    case 906:
                                      if ((_DWORD)v14 != 16) {
                                        sub_10001BA0C( "ASPFTLParseBufferToCxt: turboRaidRelBetweenRefreshesPerBlock(906): (#16) cfg e lements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                      }
                                      else {
                                        unsigned int v20 = v14;
                                      }
                                      if ((sub_10002B6E0( a1,  "turboRaidRelBetweenRefreshesPerBlock_",  (uint64_t)v8,  8u,  v20) & 1) != 0) {
                                        goto LABEL_14;
                                      }
                                      int v22 = "ASPFTLParseBufferToCxt: turboRaidRelBetweenRefreshesPerBlock(906): Cannot ad"
                                            "d 16 elements to context";
                                      goto LABEL_2247;
                                    default:
                                      if (v12 <= 1039)
                                      {
                                        switch(v12)
                                        {
                                          case 907:
                                            if ((_DWORD)v14 != 16) {
                                              sub_10001BA0C( "ASPFTLParseBufferToCxt: turboRaidMaxRelBetweenRefreshesPerBlock(907): (# 16) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                            }
                                            else {
                                              unsigned int v20 = v14;
                                            }
                                            if ((sub_10002B6E0( a1,  "turboRaidMaxRelBetweenRefreshesPerBlock_",  (uint64_t)v8,  8u,  v20) & 1) != 0) {
                                              goto LABEL_14;
                                            }
                                            int v22 = "ASPFTLParseBufferToCxt: turboRaidMaxRelBetweenRefreshesPerBlock(907): "
                                                  "Cannot add 16 elements to context";
                                            goto LABEL_2247;
                                          case 908:
                                            if ((_DWORD)v14 != 16) {
                                              sub_10001BA0C( "ASPFTLParseBufferToCxt: turboRaidMinRelBetweenRefreshesPerBlock(908): (# 16) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                            }
                                            else {
                                              unsigned int v20 = v14;
                                            }
                                            if ((sub_10002B6E0( a1,  "turboRaidMinRelBetweenRefreshesPerBlock_",  (uint64_t)v8,  8u,  v20) & 1) != 0) {
                                              goto LABEL_14;
                                            }
                                            int v22 = "ASPFTLParseBufferToCxt: turboRaidMinRelBetweenRefreshesPerBlock(908): "
                                                  "Cannot add 16 elements to context";
                                            goto LABEL_2247;
                                          case 909:
                                          case 910:
                                          case 911:
                                          case 912:
                                          case 913:
                                          case 914:
                                          case 915:
                                          case 916:
                                          case 917:
                                          case 924:
                                          case 925:
                                          case 926:
                                          case 927:
                                          case 928:
                                          case 929:
                                          case 936:
                                          case 941:
                                          case 945:
                                          case 946:
                                          case 947:
                                          case 949:
                                          case 950:
                                          case 952:
                                          case 954:
                                          case 955:
                                          case 956:
                                          case 957:
                                          case 958:
                                          case 959:
                                          case 960:
                                          case 963:
                                          case 964:
                                          case 965:
                                          case 966:
                                          case 968:
                                          case 969:
                                          case 970:
                                            goto LABEL_2110;
                                          case 918:
                                            if ((_DWORD)v14 != 16) {
                                              sub_10001BA0C( "ASPFTLParseBufferToCxt: turboRaidMaxCyclesBetweenRel(918): (#16) cfg ele ments != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                            }
                                            else {
                                              unsigned int v20 = v14;
                                            }
                                            if ((sub_10002B6E0( a1,  "turboRaidMaxCyclesBetweenRel_",  (uint64_t)v8,  8u,  v20) & 1) != 0) {
                                              goto LABEL_14;
                                            }
                                            int v22 = "ASPFTLParseBufferToCxt: turboRaidMaxCyclesBetweenRel(918): Cannot add "
                                                  "16 elements to context";
                                            goto LABEL_2247;
                                          case 919:
                                            if ((_DWORD)v14 != 16) {
                                              sub_10001BA0C( "ASPFTLParseBufferToCxt: turboRaidMinCyclesBetweenRel(919): (#16) cfg ele ments != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                            }
                                            else {
                                              unsigned int v20 = v14;
                                            }
                                            if ((sub_10002B6E0( a1,  "turboRaidMinCyclesBetweenRel_",  (uint64_t)v8,  8u,  v20) & 1) != 0) {
                                              goto LABEL_14;
                                            }
                                            int v22 = "ASPFTLParseBufferToCxt: turboRaidMinCyclesBetweenRel(919): Cannot add "
                                                  "16 elements to context";
                                            goto LABEL_2247;
                                          case 920:
                                            if ((_DWORD)v14 != 16) {
                                              sub_10001BA0C( "ASPFTLParseBufferToCxt: turboRaidAuxPerBlock(920): (#16) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                            }
                                            else {
                                              unsigned int v20 = v14;
                                            }
                                            int v22 = "ASPFTLParseBufferToCxt: turboRaidAuxPerBlock(920): Cannot add 16 elements to context";
                                            goto LABEL_2247;
                                          case 921:
                                            if ((_DWORD)v14 != 16) {
                                              sub_10001BA0C( "ASPFTLParseBufferToCxt: turboRaidAuxBetweenRefreshesPerBlock(921): (#16) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                            }
                                            else {
                                              unsigned int v20 = v14;
                                            }
                                            if ((sub_10002B6E0( a1,  "turboRaidAuxBetweenRefreshesPerBlock_",  (uint64_t)v8,  8u,  v20) & 1) != 0) {
                                              goto LABEL_14;
                                            }
                                            int v22 = "ASPFTLParseBufferToCxt: turboRaidAuxBetweenRefreshesPerBlock(921): Can"
                                                  "not add 16 elements to context";
                                            goto LABEL_2247;
                                          case 922:
                                            id v19 = "ASPFTLParseBufferToCxt: turboRaidRelLockMark(922) cannot add 1 element to context";
                                            goto LABEL_15;
                                          case 923:
                                            id v19 = "ASPFTLParseBufferToCxt: turboRaidAuxLockMark(923) cannot add 1 element to context";
                                            goto LABEL_15;
                                          case 930:
                                            if ((_DWORD)v14 != 16) {
                                              sub_10001BA0C( "ASPFTLParseBufferToCxt: turboRaidMaxCyclesBetweenAux(930): (#16) cfg ele ments != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                            }
                                            else {
                                              unsigned int v20 = v14;
                                            }
                                            if ((sub_10002B6E0( a1,  "turboRaidMaxCyclesBetweenAux_",  (uint64_t)v8,  8u,  v20) & 1) != 0) {
                                              goto LABEL_14;
                                            }
                                            int v22 = "ASPFTLParseBufferToCxt: turboRaidMaxCyclesBetweenAux(930): Cannot add "
                                                  "16 elements to context";
                                            goto LABEL_2247;
                                          case 931:
                                            if ((_DWORD)v14 != 16) {
                                              sub_10001BA0C( "ASPFTLParseBufferToCxt: turboRaidMinCyclesBetweenAux(931): (#16) cfg ele ments != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                            }
                                            else {
                                              unsigned int v20 = v14;
                                            }
                                            if ((sub_10002B6E0( a1,  "turboRaidMinCyclesBetweenAux_",  (uint64_t)v8,  8u,  v20) & 1) != 0) {
                                              goto LABEL_14;
                                            }
                                            int v22 = "ASPFTLParseBufferToCxt: turboRaidMinCyclesBetweenAux(931): Cannot add "
                                                  "16 elements to context";
                                            goto LABEL_2247;
                                          case 932:
                                            if ((_DWORD)v14 != 16) {
                                              sub_10001BA0C( "ASPFTLParseBufferToCxt: turboRaidLastRelPECycles(932): (#16) cfg element s != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                            }
                                            else {
                                              unsigned int v20 = v14;
                                            }
                                            int v22 = "ASPFTLParseBufferToCxt: turboRaidLastRelPECycles(932): Cannot add 16 e"
                                                  "lements to context";
                                            goto LABEL_2247;
                                          case 933:
                                            if ((_DWORD)v14 != 16) {
                                              sub_10001BA0C( "ASPFTLParseBufferToCxt: turboRaidRelQualPECycles(933): (#16) cfg element s != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                            }
                                            else {
                                              unsigned int v20 = v14;
                                            }
                                            int v22 = "ASPFTLParseBufferToCxt: turboRaidRelQualPECycles(933): Cannot add 16 e"
                                                  "lements to context";
                                            goto LABEL_2247;
                                          case 934:
                                            if ((_DWORD)v14 != 16) {
                                              sub_10001BA0C( "ASPFTLParseBufferToCxt: turboRaidLastAuxPECycles(934): (#16) cfg element s != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                            }
                                            else {
                                              unsigned int v20 = v14;
                                            }
                                            int v22 = "ASPFTLParseBufferToCxt: turboRaidLastAuxPECycles(934): Cannot add 16 e"
                                                  "lements to context";
                                            goto LABEL_2247;
                                          case 935:
                                            if ((_DWORD)v14 != 16) {
                                              sub_10001BA0C( "ASPFTLParseBufferToCxt: turboRaidAuxQualPECycles(935): (#16) cfg element s != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                            }
                                            else {
                                              unsigned int v20 = v14;
                                            }
                                            int v22 = "ASPFTLParseBufferToCxt: turboRaidAuxQualPECycles(935): Cannot add 16 e"
                                                  "lements to context";
                                            goto LABEL_2247;
                                          case 937:
                                            id v19 = "ASPFTLParseBufferToCxt: turboRaidPEFailAfterRel(937) cannot add 1 element to context";
                                            goto LABEL_15;
                                          case 938:
                                            id v19 = "ASPFTLParseBufferToCxt: turboRaidPEFailAfterAux(938) cannot add 1 element to context";
                                            goto LABEL_15;
                                          case 939:
                                            id v19 = "ASPFTLParseBufferToCxt: dvfmVotesCPU(939) cannot add 1 element to context";
                                            goto LABEL_15;
                                          case 940:
                                            id v19 = "ASPFTLParseBufferToCxt: dvfmVotesBandwidth(940) cannot add 1 element to context";
                                            goto LABEL_15;
                                          case 942:
                                            id v19 = "ASPFTLParseBufferToCxt: maxSLCEndurance(942) cannot add 1 element to context";
                                            goto LABEL_15;
                                          case 943:
                                            id v19 = "ASPFTLParseBufferToCxt: maxMixedEndurance(943) cannot add 1 element to context";
                                            goto LABEL_15;
                                          case 944:
                                            id v19 = "ASPFTLParseBufferToCxt: maxNativeEndurance(944) cannot add 1 element to context";
                                            goto LABEL_15;
                                          case 948:
                                            if ((_DWORD)v14 != 40) {
                                              sub_10001BA0C( "ASPFTLParseBufferToCxt: assertHistory(948): (#40) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                            }
                                            else {
                                              unsigned int v20 = v14;
                                            }
                                            int v22 = "ASPFTLParseBufferToCxt: assertHistory(948): Cannot add 40 elements to context";
                                            goto LABEL_2247;
                                          case 951:
                                            id v19 = "ASPFTLParseBufferToCxt: asp3Support(951) cannot add 1 element to context";
                                            goto LABEL_15;
                                          case 953:
                                            id v19 = "ASPFTLParseBufferToCxt: numCrossTempRaidUecc(953) cannot add 1 element to context";
                                            goto LABEL_15;
                                          case 961:
                                            id v19 = "ASPFTLParseBufferToCxt: osBuildStr(961) cannot add 1 element to context";
                                            goto LABEL_15;
                                          case 962:
                                            id v19 = "ASPFTLParseBufferToCxt: raidConfig(962) cannot add 1 element to context";
                                            goto LABEL_15;
                                          case 967:
                                            if ((_DWORD)v14 != 12) {
                                              sub_10001BA0C( "ASPFTLParseBufferToCxt: indTrimFrags(967): (#12) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                            }
                                            else {
                                              unsigned int v20 = v14;
                                            }
                                            int v22 = "ASPFTLParseBufferToCxt: indTrimFrags(967): Cannot add 12 elements to context";
                                            goto LABEL_2247;
                                          case 971:
                                            if ((_DWORD)v14 != 12) {
                                              sub_10001BA0C( "ASPFTLParseBufferToCxt: indUsedFrags(971): (#12) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                            }
                                            else {
                                              unsigned int v20 = v14;
                                            }
                                            int v22 = "ASPFTLParseBufferToCxt: indUsedFrags(971): Cannot add 12 elements to context";
                                            goto LABEL_2247;
                                          default:
                                            switch(v12)
                                            {
                                              case 996:
                                                id v19 = "ASPFTLParseBufferToCxt: clogFindFail(996) cannot add 1 element to context";
                                                goto LABEL_15;
                                              case 997:
                                                id v19 = "ASPFTLParseBufferToCxt: clogFindBlank(997) cannot add 1 element to context";
                                                goto LABEL_15;
                                              case 998:
                                                id v19 = "ASPFTLParseBufferToCxt: clogFindUnc(998) cannot add 1 element to context";
                                                goto LABEL_15;
                                              case 999:
                                                id v19 = "ASPFTLParseBufferToCxt: clogFindUnexpected(999) cannot add 1 element to context";
                                                goto LABEL_15;
                                              case 1001:
                                                if ((_DWORD)v14 != 8) {
                                                  sub_10001BA0C( "ASPFTLParseBufferToCxt: clogReplayFailReason(1001): (#8) cfg element s != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                                }
                                                else {
                                                  unsigned int v20 = v14;
                                                }
                                                int v22 = "ASPFTLParseBufferToCxt: clogReplayFailReason(1001): Cannot add 8 e"
                                                      "lements to context";
                                                goto LABEL_2247;
                                              case 1002:
                                                id v19 = "ASPFTLParseBufferToCxt: clogReplayTransientError(1002) cannot add "
                                                      "1 element to context";
                                                goto LABEL_15;
                                              case 1003:
                                                id v19 = "ASPFTLParseBufferToCxt: clogReplaySpfError(1003) cannot add 1 element to context";
                                                goto LABEL_15;
                                              case 1015:
                                                if ((_DWORD)v14 != 4) {
                                                  sub_10001BA0C( "ASPFTLParseBufferToCxt: eanEarlyBootUeccPage(1015): (#4) cfg element s != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                                }
                                                else {
                                                  unsigned int v20 = v14;
                                                }
                                                int v22 = "ASPFTLParseBufferToCxt: eanEarlyBootUeccPage(1015): Cannot add 4 e"
                                                      "lements to context";
                                                goto LABEL_2247;
                                              case 1016:
                                                id v19 = "ASPFTLParseBufferToCxt: eanEarlyBootNumUeccPages(1016) cannot add "
                                                      "1 element to context";
                                                goto LABEL_15;
                                              case 1017:
                                                if ((sub_10002B6E0( a1,  "eanEarlyBootUeccMultiplane",  (uint64_t)v8,  8u,  1u) & 1) != 0) {
                                                  goto LABEL_16;
                                                }
                                                id v19 = "ASPFTLParseBufferToCxt: eanEarlyBootUeccMultiplane(1017) cannot ad"
                                                      "d 1 element to context";
                                                goto LABEL_15;
                                              default:
                                                goto LABEL_2110;
                                            }
                                        }
                                      }

                                      if (v12 > 1137)
                                      {
                                        switch(v12)
                                        {
                                          case 1147:
                                            if ((_DWORD)v14 != 24) {
                                              sub_10001BA0C( "ASPFTLParseBufferToCxt: gc_concurrent_dw_gc12(1147): (#24) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                            }
                                            else {
                                              unsigned int v20 = v14;
                                            }
                                            int v22 = "ASPFTLParseBufferToCxt: gc_concurrent_dw_gc12(1147): Cannot add 24 ele"
                                                  "ments to context";
                                            goto LABEL_2247;
                                          case 1148:
                                            if ((_DWORD)v14 != 24) {
                                              sub_10001BA0C( "ASPFTLParseBufferToCxt: gc_concurrent_dw_gc1(1148): (#24) cfg elements ! = (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                            }
                                            else {
                                              unsigned int v20 = v14;
                                            }
                                            int v22 = "ASPFTLParseBufferToCxt: gc_concurrent_dw_gc1(1148): Cannot add 24 elements to context";
                                            goto LABEL_2247;
                                          case 1149:
                                            if ((_DWORD)v14 != 24) {
                                              sub_10001BA0C( "ASPFTLParseBufferToCxt: gc_concurrent_dw_gc2(1149): (#24) cfg elements ! = (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                            }
                                            else {
                                              unsigned int v20 = v14;
                                            }
                                            int v22 = "ASPFTLParseBufferToCxt: gc_concurrent_dw_gc2(1149): Cannot add 24 elements to context";
                                            goto LABEL_2247;
                                          case 1150:
                                          case 1151:
                                          case 1152:
                                          case 1153:
                                          case 1154:
                                          case 1155:
                                          case 1156:
                                          case 1159:
                                          case 1160:
                                          case 1161:
                                          case 1162:
                                          case 1163:
                                          case 1164:
                                          case 1165:
                                          case 1166:
                                          case 1167:
                                          case 1170:
                                          case 1173:
                                          case 1174:
                                          case 1175:
                                          case 1176:
                                          case 1177:
                                          case 1178:
                                            goto LABEL_2110;
                                          case 1157:
                                            id v19 = "ASPFTLParseBufferToCxt: eanMaxForceROTimeMs(1157) cannot add 1 element to context";
                                            break;
                                          case 1158:
                                            id v19 = "ASPFTLParseBufferToCxt: eanMaxForceRORecoTimeMs(1158) cannot add 1 element to context";
                                            break;
                                          case 1168:
                                            if ((_DWORD)v14 != 2) {
                                              sub_10001BA0C( "ASPFTLParseBufferToCxt: poDetectPERemovalTotalCost(1168): (#2) cfg eleme nts != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                            }
                                            else {
                                              unsigned int v20 = v14;
                                            }
                                            int v22 = "ASPFTLParseBufferToCxt: poDetectPERemovalTotalCost(1168): Cannot add 2"
                                                  " elements to context";
                                            goto LABEL_2247;
                                          case 1169:
                                            if ((_DWORD)v14 != 2) {
                                              sub_10001BA0C( "ASPFTLParseBufferToCxt: poDetectEmptySpotRemovalTotalCost(1169): (#2) cf g elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                            }
                                            else {
                                              unsigned int v20 = v14;
                                            }
                                            if ((sub_10002B6E0( a1,  "poDetectEmptySpotRemovalTotalCost_",  (uint64_t)v8,  8u,  v20) & 1) != 0) {
                                              goto LABEL_14;
                                            }
                                            int v22 = "ASPFTLParseBufferToCxt: poDetectEmptySpotRemovalTotalCost(1169): Canno"
                                                  "t add 2 elements to context";
                                            goto LABEL_2247;
                                          case 1171:
                                            if ((_DWORD)v14 != 10) {
                                              sub_10001BA0C( "ASPFTLParseBufferToCxt: poDetectEmptySpotRemovalAge(1171): (#10) cfg ele ments != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                            }
                                            else {
                                              unsigned int v20 = v14;
                                            }
                                            if ((sub_10002B6E0( a1,  "poDetectEmptySpotRemovalAge_",  (uint64_t)v8,  8u,  v20) & 1) != 0) {
                                              goto LABEL_14;
                                            }
                                            int v22 = "ASPFTLParseBufferToCxt: poDetectEmptySpotRemovalAge(1171): Cannot add "
                                                  "10 elements to context";
                                            goto LABEL_2247;
                                          case 1172:
                                            if ((_DWORD)v14 != 3) {
                                              sub_10001BA0C( "ASPFTLParseBufferToCxt: poDetectGBBedMostSevereCost(1172): (#3) cfg elem ents != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                            }
                                            else {
                                              unsigned int v20 = v14;
                                            }
                                            if ((sub_10002B6E0( a1,  "poDetectGBBedMostSevereCost_",  (uint64_t)v8,  8u,  v20) & 1) != 0) {
                                              goto LABEL_14;
                                            }
                                            int v22 = "ASPFTLParseBufferToCxt: poDetectGBBedMostSevereCost(1172): Cannot add "
                                                  "3 elements to context";
                                            goto LABEL_2247;
                                          case 1179:
                                            if ((_DWORD)v14 != 4) {
                                              sub_10001BA0C( "ASPFTLParseBufferToCxt: gc_cur_dw_gc1(1179): (#4) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                            }
                                            else {
                                              unsigned int v20 = v14;
                                            }
                                            int v22 = "ASPFTLParseBufferToCxt: gc_cur_dw_gc1(1179): Cannot add 4 elements to context";
                                            goto LABEL_2247;
                                          case 1180:
                                            if ((_DWORD)v14 != 4) {
                                              sub_10001BA0C( "ASPFTLParseBufferToCxt: gc_cur_dw_gc2(1180): (#4) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                            }
                                            else {
                                              unsigned int v20 = v14;
                                            }
                                            int v22 = "ASPFTLParseBufferToCxt: gc_cur_dw_gc2(1180): Cannot add 4 elements to context";
                                            goto LABEL_2247;
                                          case 1181:
                                            if ((_DWORD)v14 != 4) {
                                              sub_10001BA0C( "ASPFTLParseBufferToCxt: gc_cur_dw_gc3(1181): (#4) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                            }
                                            else {
                                              unsigned int v20 = v14;
                                            }
                                            int v22 = "ASPFTLParseBufferToCxt: gc_cur_dw_gc3(1181): Cannot add 4 elements to context";
                                            goto LABEL_2247;
                                          case 1182:
                                            if ((_DWORD)v14 != 4) {
                                              sub_10001BA0C( "ASPFTLParseBufferToCxt: gc_tot_dw_gc1(1182): (#4) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                            }
                                            else {
                                              unsigned int v20 = v14;
                                            }
                                            int v22 = "ASPFTLParseBufferToCxt: gc_tot_dw_gc1(1182): Cannot add 4 elements to context";
                                            goto LABEL_2247;
                                          case 1183:
                                            if ((_DWORD)v14 != 4) {
                                              sub_10001BA0C( "ASPFTLParseBufferToCxt: gc_tot_dw_gc2(1183): (#4) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                            }
                                            else {
                                              unsigned int v20 = v14;
                                            }
                                            int v22 = "ASPFTLParseBufferToCxt: gc_tot_dw_gc2(1183): Cannot add 4 elements to context";
                                            goto LABEL_2247;
                                          case 1184:
                                            id v19 = "ASPFTLParseBufferToCxt: unhappy_state(1184) cannot add 1 element to context";
                                            break;
                                          case 1185:
                                            id v19 = "ASPFTLParseBufferToCxt: unhappy_level(1185) cannot add 1 element to context";
                                            break;
                                          default:
                                            if (v12 != 1138)
                                            {
                                              if (v12 != 1189) {
                                                goto LABEL_2110;
                                              }
                                              if ((sub_10002B6E0(a1, "lastLbaFormatTime", (uint64_t)v8, 8u, 1u) & 1) == 0)
                                              {
                                                id v19 = "ASPFTLParseBufferToCxt: lastLbaFormatTime(1189) cannot add 1 element to context";
                                                break;
                                              }

                                              goto LABEL_16;
                                            }

                                            id v19 = "ASPFTLParseBufferToCxt: numOfToHappySwitches(1138) cannot add 1 element to context";
                                            break;
                                        }

LABEL_2110:
                                        switch(v12)
                                        {
                                          case 1196:
                                            if ((_DWORD)v14 != 5) {
                                              sub_10001BA0C( "ASPFTLParseBufferToCxt: poDetectGBBedTotalCost(1196): (#5) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                            }
                                            else {
                                              unsigned int v20 = v14;
                                            }
                                            int v22 = "ASPFTLParseBufferToCxt: poDetectGBBedTotalCost(1196): Cannot add 5 ele"
                                                  "ments to context";
                                            goto LABEL_2247;
                                          case 1197:
                                            if ((_DWORD)v14 != 10) {
                                              sub_10001BA0C( "ASPFTLParseBufferToCxt: poDetectGBBedAge(1197): (#10) cfg elements != (% d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                            }
                                            else {
                                              unsigned int v20 = v14;
                                            }
                                            int v22 = "ASPFTLParseBufferToCxt: poDetectGBBedAge(1197): Cannot add 10 elements to context";
                                            goto LABEL_2247;
                                          case 1198:
                                            if ((_DWORD)v14 != 3) {
                                              sub_10001BA0C( "ASPFTLParseBufferToCxt: poDetectPERemovalMostSevereCost(1198): (#3) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                            }
                                            else {
                                              unsigned int v20 = v14;
                                            }
                                            if ((sub_10002B6E0( a1,  "poDetectPERemovalMostSevereCost_",  (uint64_t)v8,  8u,  v20) & 1) != 0) {
                                              goto LABEL_14;
                                            }
                                            int v22 = "ASPFTLParseBufferToCxt: poDetectPERemovalMostSevereCost(1198): Cannot "
                                                  "add 3 elements to context";
                                            goto LABEL_2247;
                                          case 1199:
                                            id v19 = "ASPFTLParseBufferToCxt: poDetectCurrentSize(1199) cannot add 1 element to context";
                                            goto LABEL_15;
                                          case 1200:
                                          case 1203:
                                          case 1204:
                                          case 1205:
                                          case 1206:
                                          case 1207:
                                          case 1208:
                                          case 1209:
                                          case 1210:
                                          case 1212:
                                          case 1213:
                                          case 1214:
                                          case 1219:
                                          case 1220:
                                          case 1221:
                                          case 1222:
                                          case 1223:
LABEL_2242:
                                            else {
                                              snprintf(__str, 0x20uLL, "Stat_%d_");
                                            }
                                            if ((sub_10002B6E0(a1, __str, (uint64_t)v8, 8u, v14) & 1) == 0)
                                            {
                                              sub_10001BA0C( "ASPFTLParseBufferToCxt %d: Cannot add %d elements to context",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v12);
                                              return v10;
                                            }

                                            uint64_t v10 = (v10 + v14);
                                            break;
                                          case 1201:
                                            if ((_DWORD)v14 != 4) {
                                              sub_10001BA0C( "ASPFTLParseBufferToCxt: gcVerticalSuccssfulAlignments(1201): (#4) cfg el ements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                            }
                                            else {
                                              unsigned int v20 = v14;
                                            }
                                            if ((sub_10002B6E0( a1,  "gcVerticalSuccssfulAlignments_",  (uint64_t)v8,  8u,  v20) & 1) != 0) {
                                              goto LABEL_14;
                                            }
                                            int v22 = "ASPFTLParseBufferToCxt: gcVerticalSuccssfulAlignments(1201): Cannot ad"
                                                  "d 4 elements to context";
                                            goto LABEL_2247;
                                          case 1202:
                                            if ((_DWORD)v14 != 4) {
                                              sub_10001BA0C( "ASPFTLParseBufferToCxt: gcVerticalNoAlignmentDueToMissingSegs(1202): (#4) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                            }
                                            else {
                                              unsigned int v20 = v14;
                                            }
                                            if ((sub_10002B6E0( a1,  "gcVerticalNoAlignmentDueToMissingSegs_",  (uint64_t)v8,  8u,  v20) & 1) != 0) {
                                              goto LABEL_14;
                                            }
                                            int v22 = "ASPFTLParseBufferToCxt: gcVerticalNoAlignmentDueToMissingSegs(1202): C"
                                                  "annot add 4 elements to context";
                                            goto LABEL_2247;
                                          case 1211:
                                            if ((_DWORD)v14 != 24) {
                                              sub_10001BA0C( "ASPFTLParseBufferToCxt: forcedAllocationSmallEraseQ(1211): (#24) cfg ele ments != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                            }
                                            else {
                                              unsigned int v20 = v14;
                                            }
                                            if ((sub_10002B6E0( a1,  "forcedAllocationSmallEraseQ_",  (uint64_t)v8,  8u,  v20) & 1) != 0) {
                                              goto LABEL_14;
                                            }
                                            int v22 = "ASPFTLParseBufferToCxt: forcedAllocationSmallEraseQ(1211): Cannot add "
                                                  "24 elements to context";
                                            goto LABEL_2247;
                                          case 1215:
                                            if ((_DWORD)v14 != 5) {
                                              sub_10001BA0C( "ASPFTLParseBufferToCxt: hostWritesPerThrottleZone(1215): (#5) cfg elemen ts != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                            }
                                            else {
                                              unsigned int v20 = v14;
                                            }
                                            int v22 = "ASPFTLParseBufferToCxt: hostWritesPerThrottleZone(1215): Cannot add 5 "
                                                  "elements to context";
                                            goto LABEL_2247;
                                          case 1216:
                                            if ((_DWORD)v14 != 24) {
                                              sub_10001BA0C( "ASPFTLParseBufferToCxt: tlcWLPerDipAvgPEC(1216): (#24) cfg elements !=(%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                            }
                                            else {
                                              unsigned int v20 = v14;
                                            }
                                            int v22 = "ASPFTLParseBufferToCxt: tlcWLPerDipAvgPEC(1216): Cannot add 24 elements to context";
                                            goto LABEL_2247;
                                          case 1217:
                                            if ((_DWORD)v14 != 24) {
                                              sub_10001BA0C( "ASPFTLParseBufferToCxt: tlcWLPerDipMaxPEC(1217): (#24) cfg elements !=(%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                            }
                                            else {
                                              unsigned int v20 = v14;
                                            }
                                            int v22 = "ASPFTLParseBufferToCxt: tlcWLPerDipMaxPEC(1217): Cannot add 24 elements to context";
                                            goto LABEL_2247;
                                          case 1218:
                                            if ((_DWORD)v14 != 24) {
                                              sub_10001BA0C( "ASPFTLParseBufferToCxt: tlcWLPerDipMinPEC(1218): (#24) cfg elements !=(%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                            }
                                            else {
                                              unsigned int v20 = v14;
                                            }
                                            int v22 = "ASPFTLParseBufferToCxt: tlcWLPerDipMinPEC(1218): Cannot add 24 elements to context";
                                            goto LABEL_2247;
                                          case 1224:
                                            if ((_DWORD)v14 != 20) {
                                              sub_10001BA0C( "ASPFTLParseBufferToCxt: apfsValidLbaOvershoot(1224): (#20) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                            }
                                            else {
                                              unsigned int v20 = v14;
                                            }
                                            int v22 = "ASPFTLParseBufferToCxt: apfsValidLbaOvershoot(1224): Cannot add 20 ele"
                                                  "ments to context";
                                            goto LABEL_2247;
                                          default:
                                            switch(v12)
                                            {
                                              case 1232:
                                                id v19 = "ASPFTLParseBufferToCxt: eanFastSize(1232) cannot add 1 element to context";
                                                goto LABEL_15;
                                              case 1233:
                                                id v19 = "ASPFTLParseBufferToCxt: eanNumSlcEvictions(1233) cannot add 1 element to context";
                                                goto LABEL_15;
                                              case 1234:
                                                id v19 = "ASPFTLParseBufferToCxt: eanNumForcedCompress(1234) cannot add 1 el"
                                                      "ement to context";
                                                goto LABEL_15;
                                              case 1235:
                                              case 1236:
                                              case 1237:
                                              case 1238:
                                              case 1239:
                                              case 1240:
                                              case 1242:
                                              case 1243:
                                              case 1245:
                                                goto LABEL_2242;
                                              case 1241:
                                                if ((_DWORD)v14 != 10) {
                                                  sub_10001BA0C( "ASPFTLParseBufferToCxt: s2rTimeHisto(1241): (#10) cfg elements != (% d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                                }
                                                else {
                                                  unsigned int v20 = v14;
                                                }
                                                int v22 = "ASPFTLParseBufferToCxt: s2rTimeHisto(1241): Cannot add 10 elements to context";
                                                goto LABEL_2247;
                                              case 1244:
                                                id v19 = "ASPFTLParseBufferToCxt: calendarTimeWentBackward(1244) cannot add "
                                                      "1 element to context";
                                                goto LABEL_15;
                                              case 1246:
                                                if ((_DWORD)v14 != 8) {
                                                  sub_10001BA0C( "ASPFTLParseBufferToCxt: bandsUeccCrossTempHisto(1246): (#8) cfg elem ents != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                                }
                                                else {
                                                  unsigned int v20 = v14;
                                                }
                                                if ((sub_10002B6E0( a1,  "bandsUeccCrossTempHisto_",  (uint64_t)v8,  8u,  v20) & 1) != 0) {
                                                  goto LABEL_14;
                                                }
                                                int v22 = "ASPFTLParseBufferToCxt: bandsUeccCrossTempHisto(1246): Cannot add "
                                                      "8 elements to context";
                                                goto LABEL_2247;
                                              default:
                                                if (v12 != 1190) {
                                                  goto LABEL_2242;
                                                }
                                                if ((_DWORD)v14 != 12) {
                                                  sub_10001BA0C( "ASPFTLParseBufferToCxt: powerDownTime(1190): (#12) cfg elements !=(%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                                }
                                                else {
                                                  unsigned int v20 = v14;
                                                }
                                                int v22 = "ASPFTLParseBufferToCxt: powerDownTime(1190): Cannot add 12 elements to context";
                                                break;
                                            }

                                            goto LABEL_2247;
                                        }

LABEL_17:
                                        v8 += v14;
                                        v11 -= v14;
                                        goto LABEL_2;
                                      }

                                      if (v12 == 1105)
                                      {
                                        if ((_DWORD)v14 != 14) {
                                          sub_10001BA0C( "ASPFTLParseBufferToCxt: hostReadSequential(1105): (#14) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                        }
                                        else {
                                          unsigned int v20 = v14;
                                        }
                                        if ((sub_10002B6E0(a1, "hostReadSequential_", (uint64_t)v8, 8u, v20) & 1) == 0)
                                        {
                                          int v22 = "ASPFTLParseBufferToCxt: hostReadSequential(1105): Cannot add 14 elements to context";
                                          goto LABEL_2247;
                                        }

                                        goto LABEL_14;
                                      }

                                      if (v12 != 1106) {
                                        goto LABEL_2110;
                                      }
                                      if ((_DWORD)v14 != 14) {
                                        sub_10001BA0C( "ASPFTLParseBufferToCxt: GCReadSequential(1106): (#14) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                      }
                                      else {
                                        unsigned int v20 = v14;
                                      }
                                      if ((sub_10002B6E0(a1, "GCReadSequential_", (uint64_t)v8, 8u, v20) & 1) != 0)
                                      {
LABEL_14:
                                        uint64_t v10 = v20 + v10;
                                        goto LABEL_17;
                                      }

                                      int v22 = "ASPFTLParseBufferToCxt: GCReadSequential(1106): Cannot add 14 elements to context";
LABEL_2247:
                                      sub_10001BA0C(v22, a2, a3, a4, a5, a6, a7, a8, v23);
                                      return v10;
                                  }
                              }
                          }
                      }
                  }
              }
          }
      }
  }

uint64_t sub_10002B6E0(uint64_t a1, const char *a2, uint64_t a3, unsigned int a4, unsigned int a5)
{
  uint64_t v14 = 0LL;
  uint64_t v5 = 1LL;
  if (a4 && a5)
  {
    if (a5 == 1)
    {
      if (a4 <= 8)
      {
        __memmove_chk(&v14, a3, a4, 8LL);
        return sub_100032174(a1, "", a2, v14);
      }

      else
      {
        return 0LL;
      }
    }

    else
    {
      int v11 = 0;
      int v12 = 0;
      do
      {
        uint64_t v14 = 0LL;
        if (a4 <= 8)
        {
          __memmove_chk(&v14, a3 + v11 * a4, a4, 8LL);
          snprintf(__str, 0x64uLL, "%d", v11);
          __str[100] = 0;
          uint64_t v5 = sub_100032174(a1, a2, __str, v14) & v5;
        }

        else
        {
          uint64_t v5 = 0LL;
        }

        int v11 = (unsigned __int16)++v12;
      }

      while ((unsigned __int16)v12 < a5);
    }
  }

  return v5;
}

uint64_t sub_10002B840(uint64_t a1, unint64_t *a2, unsigned int a3)
{
  uint64_t v5 = 0LL;
  unsigned int v6 = a3 >> 3;
  *(_OWORD *)__str = 0u;
  __int128 v22 = 0u;
LABEL_2:
  int v7 = -v6;
  while (v7)
  {
    unint64_t v9 = *a2++;
    unsigned int v8 = v9;
    unint64_t v10 = HIDWORD(v9);
    ++v7;
    if (HIDWORD(v9))
    {
      if (v8 != 0xFFFF && v8 <= 0x30000000 && -v7 >= v10)
      {
        else {
          snprintf(__str, 0x20uLL, "Stat_%d_");
        }
        if ((sub_10002B6E0(a1, __str, (uint64_t)a2, 8u, v10) & 1) != 0)
        {
          uint64_t v5 = (v5 + v10);
          a2 += v10;
          unsigned int v6 = -v7 - v10;
          goto LABEL_2;
        }

        sub_10001BA0C( "ASPFTLParseBufferToCxt %d: Cannot add %d elements to context",  v13,  v14,  v15,  v16,  v17,  v18,  v19,  v8);
      }

      return v5;
    }
  }

  return v5;
}

uint64_t sub_10002B968( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8 = 0LL;
  unint64_t v9 = "ASPMSPParseBufferToCxt: Passed in invalid buffer or empty buffer";
  if (!a2) {
    goto LABEL_1981;
  }
  unsigned int v10 = a3;
  if (!(_DWORD)a3) {
    goto LABEL_1981;
  }
  uint64_t v11 = a2;
  uint64_t v8 = 0LL;
  uint64_t v13 = &jpt_10002FABC;
  uint64_t v14 = "ASPMSPParseBufferToCxt: fs1_4b_fail(4279): Error adding 4 elements to context";
  unint64_t v9 = "ASPMSPParseBufferToCxt: cbdr_step_5(4256): Error adding 10 elements to context";
  while (1)
  {
    do
    {
      if (!v10) {
        return v8;
      }
      uint64_t v15 = (unsigned __int16 *)v11;
      uint64_t v16 = *(unsigned __int16 *)(v11 + 2);
      v11 += 4LL;
      v10 -= 4;
    }

    while (!(_DWORD)v16);
    int v17 = *v15;
    if (v17 != 12286) {
      break;
    }
LABEL_461:
    v11 += v16;
    v10 -= v16;
  }

  switch(v17)
  {
    case 4096:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 4) {
        sub_10001BA0C( "ASPMSPParseBufferToCxt: passWithTmodeHard(4096): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: passWithTmodeHard(4096): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4097:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 4) {
        sub_10001BA0C( "ASPMSPParseBufferToCxt: passWithTmodeFS1_2b(4097): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: passWithTmodeFS1_2b(4097): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4098:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 4) {
        sub_10001BA0C( "ASPMSPParseBufferToCxt: passWithTmodeFS1_4b(4098): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: passWithTmodeFS1_4b(4098): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4099:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 4) {
        sub_10001BA0C( "ASPMSPParseBufferToCxt: passWithTmodeHard_fast(4099): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: passWithTmodeHard_fast(4099): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4100:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 4) {
        sub_10001BA0C( "ASPMSPParseBufferToCxt: passWithTmodeFS1_2b_fast(4100): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: passWithTmodeFS1_2b_fast(4100): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4101:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 4) {
        sub_10001BA0C( "ASPMSPParseBufferToCxt: passWithTmodeFS1_4b_fast(4101): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: passWithTmodeFS1_4b_fast(4101): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4102:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 4) {
        sub_10001BA0C( "ASPMSPParseBufferToCxt: numOfCwFailedInTmodeFS2_EOL(4102): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: numOfCwFailedInTmodeFS2_EOL(4102): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4103:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 4) {
        sub_10001BA0C( "ASPMSPParseBufferToCxt: numOfCwFailedInTmodeFS2_DSP_EOL(4103): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: numOfCwFailedInTmodeFS2_DSP_EOL(4103): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4104:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 4) {
        sub_10001BA0C( "ASPMSPParseBufferToCxt: readAlgoPassWithHardAfterAcq(4104): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: readAlgoPassWithHardAfterAcq(4104): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4105:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 4) {
        sub_10001BA0C( "ASPMSPParseBufferToCxt: firstReadWasHardWithDefaultBDBFastRead(4105): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: firstReadWasHardWithDefaultBDBFastRead(4105): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4106:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 4) {
        sub_10001BA0C( "ASPMSPParseBufferToCxt: readalgoPassWithDS1(4106): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: readalgoPassWithDS1(4106): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4107:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 4) {
        sub_10001BA0C( "ASPMSPParseBufferToCxt: readalgoPassWithDYCE1(4107): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: readalgoPassWithDYCE1(4107): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4108:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 4) {
        sub_10001BA0C( "ASPMSPParseBufferToCxt: readalgoPassWithDS2(4108): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: readalgoPassWithDS2(4108): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4109:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 4) {
        sub_10001BA0C( "ASPMSPParseBufferToCxt: readalgoPassWithDYCE2(4109): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: readalgoPassWithDYCE2(4109): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4110:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 4) {
        sub_10001BA0C( "ASPMSPParseBufferToCxt: firstReadWasHardWithAcq(4110): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: firstReadWasHardWithAcq(4110): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4111:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 4) {
        sub_10001BA0C( "ASPMSPParseBufferToCxt: bdbDynamicMovedToEOL_LSB(4111): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: bdbDynamicMovedToEOL_LSB(4111): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4112:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 4) {
        sub_10001BA0C( "ASPMSPParseBufferToCxt: bdbDynamicMovedToEOL_MSB(4112): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: bdbDynamicMovedToEOL_MSB(4112): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4113:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 4) {
        sub_10001BA0C( "ASPMSPParseBufferToCxt: bdbDynamicMovedToEOL_USB(4113): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: bdbDynamicMovedToEOL_USB(4113): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4114:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 4) {
        sub_10001BA0C( "ASPMSPParseBufferToCxt: bdbDynamicMovedToSOL_LSB(4114): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: bdbDynamicMovedToSOL_LSB(4114): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4115:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 4) {
        sub_10001BA0C( "ASPMSPParseBufferToCxt: bdbDynamicMovedToSOL_MSB(4115): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: bdbDynamicMovedToSOL_MSB(4115): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4116:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 4) {
        sub_10001BA0C( "ASPMSPParseBufferToCxt: bdbDynamicMovedToSOL_USB(4116): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: bdbDynamicMovedToSOL_USB(4116): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4117:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 4) {
        sub_10001BA0C( "ASPMSPParseBufferToCxt: firstReadWasHardWithDefaultBDB(4117): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: firstReadWasHardWithDefaultBDB(4117): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4118:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 4) {
        sub_10001BA0C( "ASPMSPParseBufferToCxt: readAlgoPassedThroughSyndSumAcquisition(4118): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: readAlgoPassedThroughSyndSumAcquisition(4118): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4119:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 4) {
        sub_10001BA0C( "ASPMSPParseBufferToCxt: readAlgoPassedThroughSlip(4119): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: readAlgoPassedThroughSlip(4119): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4120:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 44) {
        sub_10001BA0C( "ASPMSPParseBufferToCxt: FS2decodedBitFlips(4120): cfg 11 elements; (11*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: FS2decodedBitFlips(4120): Error adding 11 elements to context";
      goto LABEL_1981;
    case 4121:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 16) {
        sub_10001BA0C( "ASPMSPParseBufferToCxt: slipTrackingAfterFs1ForceFailChangedVthInTicksHist(4121): cfg 4 elements; (4*4) cfg by"
      }
          "tes != (%d) buffer bytes",
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: slipTrackingAfterFs1ForceFailChangedVthInTicksHist(4121): Error adding 4 elements to context";
      goto LABEL_1981;
    case 4122:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 4) {
        sub_10001BA0C( "ASPMSPParseBufferToCxt: readAlgoPassWithFS2_4b_fast(4122): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: readAlgoPassWithFS2_4b_fast(4122): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4123:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 4) {
        sub_10001BA0C( "ASPMSPParseBufferToCxt: readAlgoPassWithHardAfterSlip_fast(4123): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: readAlgoPassWithHardAfterSlip_fast(4123): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4124:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 4) {
        sub_10001BA0C( "ASPMSPParseBufferToCxt: readAlgoPassWithFS12BitAfterSlip_fast(4124): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: readAlgoPassWithFS12BitAfterSlip_fast(4124): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4125:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 4) {
        sub_10001BA0C( "ASPMSPParseBufferToCxt: readAlgoPassWithFS14BitAfterSlip_fast(4125): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: readAlgoPassWithFS14BitAfterSlip_fast(4125): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4126:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 4) {
        sub_10001BA0C( "ASPMSPParseBufferToCxt: readAlgoPassWithFS3_fast(4126): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: readAlgoPassWithFS3_fast(4126): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4127:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 40) {
        sub_10001BA0C( "ASPMSPParseBufferToCxt: deepSoft1Decoded(4127): cfg 10 elements; (10*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: deepSoft1Decoded(4127): Error adding 10 elements to context";
      goto LABEL_1981;
    case 4128:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 40) {
        sub_10001BA0C( "ASPMSPParseBufferToCxt: deepSoft2Decoded(4128): cfg 10 elements; (10*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: deepSoft2Decoded(4128): Error adding 10 elements to context";
      goto LABEL_1981;
    case 4129:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 4) {
        sub_10001BA0C( "ASPMSPParseBufferToCxt: readAlgoPassedThroughFS2_2b_fast(4129): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: readAlgoPassedThroughFS2_2b_fast(4129): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4130:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 4) {
        sub_10001BA0C( "ASPMSPParseBufferToCxt: readAlgoPassedThroughFS2_4b_fast(4130): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: readAlgoPassedThroughFS2_4b_fast(4130): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4131:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 4) {
        sub_10001BA0C( "ASPMSPParseBufferToCxt: readAlgoPassedThroughSlip_fast(4131): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: readAlgoPassedThroughSlip_fast(4131): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4132:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 4) {
        sub_10001BA0C( "ASPMSPParseBufferToCxt: readAlgoPassedThroughFS3_fast(4132): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: readAlgoPassedThroughFS3_fast(4132): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4133:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 4) {
        sub_10001BA0C( "ASPMSPParseBufferToCxt: readalgoPassWithEXH(4133): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: readalgoPassWithEXH(4133): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4134:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 44) {
        sub_10001BA0C( "ASPMSPParseBufferToCxt: FS1decodedbitflips(4134): cfg 11 elements; (11*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: FS1decodedbitflips(4134): Error adding 11 elements to context";
      goto LABEL_1981;
    case 4135:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 4) {
        sub_10001BA0C( "ASPMSPParseBufferToCxt: readZeroPage(4135): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: readZeroPage(4135): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4136:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 4) {
        sub_10001BA0C( "ASPMSPParseBufferToCxt: readErasedPage(4136): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: readErasedPage(4136): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4137:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 4) {
        sub_10001BA0C( "ASPMSPParseBufferToCxt: readFail(4137): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: readFail(4137): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4138:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 20) {
        sub_10001BA0C( "ASPMSPParseBufferToCxt: numOfSensesWereSentDuringSyndSumAcq(4138): cfg 5 elements; (5*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: numOfSensesWereSentDuringSyndSumAcq(4138): Error adding 5 elements to context";
      goto LABEL_1981;
    case 4139:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 12) {
        sub_10001BA0C( "ASPMSPParseBufferToCxt: numOfSensesWereSentDuringMiniAcq(4139): cfg 3 elements; (3*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: numOfSensesWereSentDuringMiniAcq(4139): Error adding 3 elements to context";
      goto LABEL_1981;
    case 4140:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 4) {
        sub_10001BA0C( "ASPMSPParseBufferToCxt: bdbDefaultMoveFastToNormal(4140): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: bdbDefaultMoveFastToNormal(4140): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4141:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 4) {
        sub_10001BA0C( "ASPMSPParseBufferToCxt: bdbDefaultMoveNormalToFast(4141): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: bdbDefaultMoveNormalToFast(4141): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4142:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 4) {
        sub_10001BA0C( "ASPMSPParseBufferToCxt: readalgoPassWithEXH_DSP(4142): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: readalgoPassWithEXH_DSP(4142): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4143:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 4) {
        sub_10001BA0C( "ASPMSPParseBufferToCxt: readalgoPassWithDS1_DSP(4143): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: readalgoPassWithDS1_DSP(4143): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4144:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 4) {
        sub_10001BA0C( "ASPMSPParseBufferToCxt: readalgoPassWithDYCE1_DSP(4144): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: readalgoPassWithDYCE1_DSP(4144): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4145:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 4) {
        sub_10001BA0C( "ASPMSPParseBufferToCxt: firstReadWasFS2EOL_DSP(4145): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: firstReadWasFS2EOL_DSP(4145): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4146:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 4) {
        sub_10001BA0C( "ASPMSPParseBufferToCxt: firstReadWasFS2EOL(4146): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: firstReadWasFS2EOL(4146): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4147:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 4) {
        sub_10001BA0C( "ASPMSPParseBufferToCxt: readAlgoPassedThroughFS2_4b(4147): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: readAlgoPassedThroughFS2_4b(4147): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4148:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 4) {
        sub_10001BA0C( "ASPMSPParseBufferToCxt: readAlgoPassWithFS2_4b(4148): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: readAlgoPassWithFS2_4b(4148): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4149:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 4) {
        sub_10001BA0C( "ASPMSPParseBufferToCxt: readAlgoPassedThroughFS2_2b(4149): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: readAlgoPassedThroughFS2_2b(4149): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4150:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 4) {
        sub_10001BA0C( "ASPMSPParseBufferToCxt: readAlgoPassedThroughFS3(4150): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: readAlgoPassedThroughFS3(4150): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4151:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 4) {
        sub_10001BA0C( "ASPMSPParseBufferToCxt: readAlgoPassedThroughDS1(4151): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: readAlgoPassedThroughDS1(4151): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4152:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 4) {
        sub_10001BA0C( "ASPMSPParseBufferToCxt: readAlgoPassedThroughDS2(4152): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: readAlgoPassedThroughDS2(4152): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4153:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 4) {
        sub_10001BA0C( "ASPMSPParseBufferToCxt: readAlgoPassWithHardAfterSlip(4153): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: readAlgoPassWithHardAfterSlip(4153): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4154:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 4) {
        sub_10001BA0C( "ASPMSPParseBufferToCxt: readAlgoPassWithFS12BitAfterSlip(4154): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: readAlgoPassWithFS12BitAfterSlip(4154): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4155:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 4) {
        sub_10001BA0C( "ASPMSPParseBufferToCxt: readAlgoPassWithFS14BitAfterSlip(4155): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: readAlgoPassWithFS14BitAfterSlip(4155): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4156:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 4) {
        sub_10001BA0C( "ASPMSPParseBufferToCxt: readAlgoPassWithFS3(4156): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: readAlgoPassWithFS3(4156): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4157:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 4) {
        sub_10001BA0C( "ASPMSPParseBufferToCxt: readAlgoPassedThroughSyndSumAcquisition_DSP(4157): cfg 1 elements; (1*4) cfg bytes != "
      }
          "(%d) buffer bytes",
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: readAlgoPassedThroughSyndSumAcquisition_DSP(4157): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4158:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 4) {
        sub_10001BA0C( "ASPMSPParseBufferToCxt: readAlgoPassWithFS12BitAfterAcq(4158): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: readAlgoPassWithFS12BitAfterAcq(4158): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4159:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 4) {
        sub_10001BA0C( "ASPMSPParseBufferToCxt: readAlgoPassWithFS14BitAfterAcq(4159): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      if (sub_10002B6E0(a1, "readAlgoPassWithFS14BitAfterAcq", v11, 4u, v21))
      {
LABEL_460:
        uint64_t v8 = v8 + v21;
        uint64_t v13 = v20;
        uint64_t v14 = v19;
        goto LABEL_461;
      }

      unint64_t v9 = "ASPMSPParseBufferToCxt: readAlgoPassWithFS14BitAfterAcq(4159): Error adding 1 elements to context";
LABEL_1981:
      sub_10001BA0C(v9, a2, a3, a4, a5, a6, a7, a8, v24);
      return v8;
    default:
      switch(v17)
      {
        case 4160:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 4) {
            sub_10001BA0C( "ASPMSPParseBufferToCxt: readAlgoPassedThroughDS1_DSP(4160): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: readAlgoPassedThroughDS1_DSP(4160): Error adding 1 elements to context";
          goto LABEL_1981;
        case 4161:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 4) {
            sub_10001BA0C( "ASPMSPParseBufferToCxt: numOfSlipTracking(4161): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: numOfSlipTracking(4161): Error adding 1 elements to context";
          goto LABEL_1981;
        case 4162:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 4) {
            sub_10001BA0C( "ASPMSPParseBufferToCxt: bdbDynamicMovedToEOL_QSB(4162): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: bdbDynamicMovedToEOL_QSB(4162): Error adding 1 elements to context";
          goto LABEL_1981;
        case 4163:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 4) {
            sub_10001BA0C( "ASPMSPParseBufferToCxt: bdbDynamicMovedToSOL_QSB(4163): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: bdbDynamicMovedToSOL_QSB(4163): Error adding 1 elements to context";
          goto LABEL_1981;
        case 4196:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 4) {
            sub_10001BA0C( "ASPMSPParseBufferToCxt: readStageNumOfFails100(4196): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: readStageNumOfFails100(4196): Error adding 1 elements to context";
          goto LABEL_1981;
        case 4197:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 4) {
            sub_10001BA0C( "ASPMSPParseBufferToCxt: readStageNumOfFails101(4197): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: readStageNumOfFails101(4197): Error adding 1 elements to context";
          goto LABEL_1981;
        case 4198:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 4) {
            sub_10001BA0C( "ASPMSPParseBufferToCxt: readStage100(4198): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: readStage100(4198): Error adding 1 elements to context";
          goto LABEL_1981;
        case 4199:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 16) {
            sub_10001BA0C( "ASPMSPParseBufferToCxt: readStage101(4199): cfg 4 elements; (4*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: readStage101(4199): Error adding 4 elements to context";
          goto LABEL_1981;
        case 4200:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 4) {
            sub_10001BA0C( "ASPMSPParseBufferToCxt: initialReadStage100(4200): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: initialReadStage100(4200): Error adding 1 elements to context";
          goto LABEL_1981;
        case 4201:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 4) {
            sub_10001BA0C( "ASPMSPParseBufferToCxt: readStage102(4201): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: readStage102(4201): Error adding 1 elements to context";
          goto LABEL_1981;
        case 4202:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 4) {
            sub_10001BA0C( "ASPMSPParseBufferToCxt: initialReadStage101(4202): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: initialReadStage101(4202): Error adding 1 elements to context";
          goto LABEL_1981;
        case 4203:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 4) {
            sub_10001BA0C( "ASPMSPParseBufferToCxt: nandStageOfLife100(4203): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: nandStageOfLife100(4203): Error adding 1 elements to context";
          goto LABEL_1981;
        case 4204:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 4) {
            sub_10001BA0C( "ASPMSPParseBufferToCxt: nandStageOfLife101(4204): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: nandStageOfLife101(4204): Error adding 1 elements to context";
          goto LABEL_1981;
        case 4205:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 16) {
            sub_10001BA0C( "ASPMSPParseBufferToCxt: readStageNumOfFails102(4205): cfg 4 elements; (4*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: readStageNumOfFails102(4205): Error adding 4 elements to context";
          goto LABEL_1981;
        case 4206:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 4) {
            sub_10001BA0C( "ASPMSPParseBufferToCxt: initialReadStage102(4206): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: initialReadStage102(4206): Error adding 1 elements to context";
          goto LABEL_1981;
        case 4207:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 4) {
            sub_10001BA0C( "ASPMSPParseBufferToCxt: readStage103(4207): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: readStage103(4207): Error adding 1 elements to context";
          goto LABEL_1981;
        case 4208:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 4) {
            sub_10001BA0C( "ASPMSPParseBufferToCxt: readStage104(4208): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: readStage104(4208): Error adding 1 elements to context";
          goto LABEL_1981;
        case 4209:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 16) {
            sub_10001BA0C( "ASPMSPParseBufferToCxt: readStage105(4209): cfg 4 elements; (4*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: readStage105(4209): Error adding 4 elements to context";
          goto LABEL_1981;
        case 4210:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 16) {
            sub_10001BA0C( "ASPMSPParseBufferToCxt: readStage106(4210): cfg 4 elements; (4*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: readStage106(4210): Error adding 4 elements to context";
          goto LABEL_1981;
        case 4211:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 16) {
            sub_10001BA0C( "ASPMSPParseBufferToCxt: dspExceptionParameter100(4211): cfg 4 elements; (4*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: dspExceptionParameter100(4211): Error adding 4 elements to context";
          goto LABEL_1981;
        case 4212:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 16) {
            sub_10001BA0C( "ASPMSPParseBufferToCxt: dspExceptionParameter101(4212): cfg 4 elements; (4*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: dspExceptionParameter101(4212): Error adding 4 elements to context";
          goto LABEL_1981;
        case 4213:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 4) {
            sub_10001BA0C( "ASPMSPParseBufferToCxt: initialReadStage103(4213): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: initialReadStage103(4213): Error adding 1 elements to context";
          goto LABEL_1981;
        case 4214:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 4) {
            sub_10001BA0C( "ASPMSPParseBufferToCxt: initialReadStage104(4214): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: initialReadStage104(4214): Error adding 1 elements to context";
          goto LABEL_1981;
        case 4215:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 16) {
            sub_10001BA0C( "ASPMSPParseBufferToCxt: readStage107(4215): cfg 4 elements; (4*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: readStage107(4215): Error adding 4 elements to context";
          goto LABEL_1981;
        case 4216:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 16) {
            sub_10001BA0C( "ASPMSPParseBufferToCxt: readStage108(4216): cfg 4 elements; (4*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: readStage108(4216): Error adding 4 elements to context";
          goto LABEL_1981;
        case 4217:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 4) {
            sub_10001BA0C( "ASPMSPParseBufferToCxt: nandStageOfLife102(4217): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: nandStageOfLife102(4217): Error adding 1 elements to context";
          goto LABEL_1981;
        case 4218:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 4) {
            sub_10001BA0C( "ASPMSPParseBufferToCxt: nandStageOfLife103(4218): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: nandStageOfLife103(4218): Error adding 1 elements to context";
          goto LABEL_1981;
        case 4219:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 4) {
            sub_10001BA0C( "ASPMSPParseBufferToCxt: nandStageOfLife104(4219): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: nandStageOfLife104(4219): Error adding 1 elements to context";
          goto LABEL_1981;
        case 4220:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 16) {
            sub_10001BA0C( "ASPMSPParseBufferToCxt: dspExceptionParameter102(4220): cfg 4 elements; (4*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: dspExceptionParameter102(4220): Error adding 4 elements to context";
          goto LABEL_1981;
        case 4221:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 16) {
            sub_10001BA0C( "ASPMSPParseBufferToCxt: dspExceptionParameter103(4221): cfg 4 elements; (4*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: dspExceptionParameter103(4221): Error adding 4 elements to context";
          goto LABEL_1981;
        case 4222:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 16) {
            sub_10001BA0C( "ASPMSPParseBufferToCxt: dspExceptionParameter104(4222): cfg 4 elements; (4*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: dspExceptionParameter104(4222): Error adding 4 elements to context";
          goto LABEL_1981;
        case 4223:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 16) {
            sub_10001BA0C( "ASPMSPParseBufferToCxt: dspExceptionParameter105(4223): cfg 4 elements; (4*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: dspExceptionParameter105(4223): Error adding 4 elements to context";
          goto LABEL_1981;
        case 4224:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 16) {
            sub_10001BA0C( "ASPMSPParseBufferToCxt: dspExceptionParameter106(4224): cfg 4 elements; (4*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: dspExceptionParameter106(4224): Error adding 4 elements to context";
          goto LABEL_1981;
        case 4225:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 16) {
            sub_10001BA0C( "ASPMSPParseBufferToCxt: dspExceptionParameter107(4225): cfg 4 elements; (4*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: dspExceptionParameter107(4225): Error adding 4 elements to context";
          goto LABEL_1981;
        case 4226:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 16) {
            sub_10001BA0C( "ASPMSPParseBufferToCxt: dspExceptionParameter108(4226): cfg 4 elements; (4*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: dspExceptionParameter108(4226): Error adding 4 elements to context";
          goto LABEL_1981;
        case 4227:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 16) {
            sub_10001BA0C( "ASPMSPParseBufferToCxt: dspExceptionParameter109(4227): cfg 4 elements; (4*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: dspExceptionParameter109(4227): Error adding 4 elements to context";
          goto LABEL_1981;
        case 4228:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 16) {
            sub_10001BA0C( "ASPMSPParseBufferToCxt: dspExceptionParameter110(4228): cfg 4 elements; (4*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: dspExceptionParameter110(4228): Error adding 4 elements to context";
          goto LABEL_1981;
        case 4229:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 16) {
            sub_10001BA0C( "ASPMSPParseBufferToCxt: dspExceptionParameter111(4229): cfg 4 elements; (4*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: dspExceptionParameter111(4229): Error adding 4 elements to context";
          goto LABEL_1981;
        case 4230:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 16) {
            sub_10001BA0C( "ASPMSPParseBufferToCxt: dspExceptionParameter112(4230): cfg 4 elements; (4*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: dspExceptionParameter112(4230): Error adding 4 elements to context";
          goto LABEL_1981;
        case 4231:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 16) {
            sub_10001BA0C( "ASPMSPParseBufferToCxt: dspExceptionParameter113(4231): cfg 4 elements; (4*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: dspExceptionParameter113(4231): Error adding 4 elements to context";
          goto LABEL_1981;
        case 4232:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 256) {
            sub_10001BA0C( "ASPMSPParseBufferToCxt: readStageNumOfFails108(4232): cfg 64 elements; (64*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: readStageNumOfFails108(4232): Error adding 64 elements to context";
          goto LABEL_1981;
        case 4233:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 256) {
            sub_10001BA0C( "ASPMSPParseBufferToCxt: readStageNumOfFails103(4233): cfg 64 elements; (64*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: readStageNumOfFails103(4233): Error adding 64 elements to context";
          goto LABEL_1981;
        case 4234:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 16) {
            sub_10001BA0C( "ASPMSPParseBufferToCxt: readStageNumOfFails104(4234): cfg 4 elements; (4*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: readStageNumOfFails104(4234): Error adding 4 elements to context";
          goto LABEL_1981;
        case 4235:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 16) {
            sub_10001BA0C( "ASPMSPParseBufferToCxt: readStageNumOfFails105(4235): cfg 4 elements; (4*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: readStageNumOfFails105(4235): Error adding 4 elements to context";
          goto LABEL_1981;
        case 4236:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 16) {
            sub_10001BA0C( "ASPMSPParseBufferToCxt: readStageNumOfFails106(4236): cfg 4 elements; (4*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: readStageNumOfFails106(4236): Error adding 4 elements to context";
          goto LABEL_1981;
        case 4237:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 16) {
            sub_10001BA0C( "ASPMSPParseBufferToCxt: readStageNumOfFails107(4237): cfg 4 elements; (4*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: readStageNumOfFails107(4237): Error adding 4 elements to context";
          goto LABEL_1981;
        case 4238:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 16) {
            sub_10001BA0C( "ASPMSPParseBufferToCxt: readStage109(4238): cfg 4 elements; (4*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: readStage109(4238): Error adding 4 elements to context";
          goto LABEL_1981;
        case 4239:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 16) {
            sub_10001BA0C( "ASPMSPParseBufferToCxt: readStage110(4239): cfg 4 elements; (4*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: readStage110(4239): Error adding 4 elements to context";
          goto LABEL_1981;
        case 4240:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 80) {
            sub_10001BA0C( "ASPMSPParseBufferToCxt: readStageNumOfErrorsBin100(4240): cfg 20 elements; (20*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: readStageNumOfErrorsBin100(4240): Error adding 20 elements to context";
          goto LABEL_1981;
        case 4241:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 80) {
            sub_10001BA0C( "ASPMSPParseBufferToCxt: dspExceptionParameter114(4241): cfg 20 elements; (20*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: dspExceptionParameter114(4241): Error adding 20 elements to context";
          goto LABEL_1981;
        case 4242:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 4) {
            sub_10001BA0C( "ASPMSPParseBufferToCxt: dspExceptionParameter115(4242): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: dspExceptionParameter115(4242): Error adding 1 elements to context";
          goto LABEL_1981;
        case 4243:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 4) {
            sub_10001BA0C( "ASPMSPParseBufferToCxt: dspExceptionParameter116(4243): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: dspExceptionParameter116(4243): Error adding 1 elements to context";
          goto LABEL_1981;
        case 4244:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 4) {
            sub_10001BA0C( "ASPMSPParseBufferToCxt: dspExceptionParameter117(4244): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: dspExceptionParameter117(4244): Error adding 1 elements to context";
          goto LABEL_1981;
        case 4245:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 4) {
            sub_10001BA0C( "ASPMSPParseBufferToCxt: dspExceptionParameter118(4245): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: dspExceptionParameter118(4245): Error adding 1 elements to context";
          goto LABEL_1981;
        case 4246:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 4) {
            sub_10001BA0C( "ASPMSPParseBufferToCxt: dspExceptionParameter119(4246): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: dspExceptionParameter119(4246): Error adding 1 elements to context";
          goto LABEL_1981;
        case 4247:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 4) {
            sub_10001BA0C( "ASPMSPParseBufferToCxt: dspExceptionParameter120(4247): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: dspExceptionParameter120(4247): Error adding 1 elements to context";
          goto LABEL_1981;
        case 4248:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 4) {
            sub_10001BA0C( "ASPMSPParseBufferToCxt: dspExceptionParameter121(4248): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: dspExceptionParameter121(4248): Error adding 1 elements to context";
          goto LABEL_1981;
        case 4249:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 4) {
            sub_10001BA0C( "ASPMSPParseBufferToCxt: cbdr_ref_1(4249): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: cbdr_ref_1(4249): Error adding 1 elements to context";
          goto LABEL_1981;
        case 4250:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 4) {
            sub_10001BA0C( "ASPMSPParseBufferToCxt: cbdr_ref_2(4250): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: cbdr_ref_2(4250): Error adding 1 elements to context";
          goto LABEL_1981;
        case 4251:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 4) {
            sub_10001BA0C( "ASPMSPParseBufferToCxt: cbdr_outlier(4251): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: cbdr_outlier(4251): Error adding 1 elements to context";
          goto LABEL_1981;
        case 4252:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 40) {
            sub_10001BA0C( "ASPMSPParseBufferToCxt: cbdr_step_1(4252): cfg 10 elements; (10*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: cbdr_step_1(4252): Error adding 10 elements to context";
          goto LABEL_1981;
        case 4253:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 40) {
            sub_10001BA0C( "ASPMSPParseBufferToCxt: cbdr_step_2(4253): cfg 10 elements; (10*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: cbdr_step_2(4253): Error adding 10 elements to context";
          goto LABEL_1981;
        case 4254:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 40) {
            sub_10001BA0C( "ASPMSPParseBufferToCxt: cbdr_step_3(4254): cfg 10 elements; (10*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: cbdr_step_3(4254): Error adding 10 elements to context";
          goto LABEL_1981;
        case 4255:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 40) {
            sub_10001BA0C( "ASPMSPParseBufferToCxt: cbdr_step_4(4255): cfg 10 elements; (10*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: cbdr_step_4(4255): Error adding 10 elements to context";
          goto LABEL_1981;
        default:
          switch(v17)
          {
            case 12288:
              if ((_DWORD)v16 != 8) {
                sub_10001BA0C( "ASPMSPParseBufferToCxt: readStageNumOfFails200(12288): cfg 1 elements; (1*8) cfg bytes != (%d) buffer bytes",
              }
                  a2,
                  a3,
                  a4,
                  a5,
                  a6,
                  a7,
                  a8,
                  v16);
              else {
                unsigned int v22 = v16 >> 3;
              }
              unint64_t v9 = "ASPMSPParseBufferToCxt: readStageNumOfFails200(12288): Error adding 1 elements to context";
              goto LABEL_1981;
            case 12289:
              if ((_DWORD)v16 != 8) {
                sub_10001BA0C( "ASPMSPParseBufferToCxt: initialReadStage200(12289): cfg 1 elements; (1*8) cfg bytes != (%d) buffer bytes",
              }
                  a2,
                  a3,
                  a4,
                  a5,
                  a6,
                  a7,
                  a8,
                  v16);
              else {
                unsigned int v22 = v16 >> 3;
              }
              unint64_t v9 = "ASPMSPParseBufferToCxt: initialReadStage200(12289): Error adding 1 elements to context";
              goto LABEL_1981;
            case 12290:
              if ((_DWORD)v16 != 8) {
                sub_10001BA0C( "ASPMSPParseBufferToCxt: initialReadStage201(12290): cfg 1 elements; (1*8) cfg bytes != (%d) buffer bytes",
              }
                  a2,
                  a3,
                  a4,
                  a5,
                  a6,
                  a7,
                  a8,
                  v16);
              else {
                unsigned int v22 = v16 >> 3;
              }
              unint64_t v9 = "ASPMSPParseBufferToCxt: initialReadStage201(12290): Error adding 1 elements to context";
              goto LABEL_1981;
            case 12291:
              if ((_DWORD)v16 != 8) {
                sub_10001BA0C( "ASPMSPParseBufferToCxt: readStageNumOfFails201(12291): cfg 1 elements; (1*8) cfg bytes != (%d) buffer bytes",
              }
                  a2,
                  a3,
                  a4,
                  a5,
                  a6,
                  a7,
                  a8,
                  v16);
              else {
                unsigned int v22 = v16 >> 3;
              }
              unint64_t v9 = "ASPMSPParseBufferToCxt: readStageNumOfFails201(12291): Error adding 1 elements to context";
              goto LABEL_1981;
            case 12292:
              if ((_DWORD)v16 != 8) {
                sub_10001BA0C( "ASPMSPParseBufferToCxt: initialReadStage202(12292): cfg 1 elements; (1*8) cfg bytes != (%d) buffer bytes",
              }
                  a2,
                  a3,
                  a4,
                  a5,
                  a6,
                  a7,
                  a8,
                  v16);
              else {
                unsigned int v22 = v16 >> 3;
              }
              unint64_t v9 = "ASPMSPParseBufferToCxt: initialReadStage202(12292): Error adding 1 elements to context";
              goto LABEL_1981;
            case 12293:
              if ((_DWORD)v16 != 8) {
                sub_10001BA0C( "ASPMSPParseBufferToCxt: initialReadStage203(12293): cfg 1 elements; (1*8) cfg bytes != (%d) buffer bytes",
              }
                  a2,
                  a3,
                  a4,
                  a5,
                  a6,
                  a7,
                  a8,
                  v16);
              else {
                unsigned int v22 = v16 >> 3;
              }
              unint64_t v9 = "ASPMSPParseBufferToCxt: initialReadStage203(12293): Error adding 1 elements to context";
              goto LABEL_1981;
            case 12294:
              if ((_DWORD)v16 != 8) {
                sub_10001BA0C( "ASPMSPParseBufferToCxt: readStageNumOfFails202(12294): cfg 1 elements; (1*8) cfg bytes != (%d) buffer bytes",
              }
                  a2,
                  a3,
                  a4,
                  a5,
                  a6,
                  a7,
                  a8,
                  v16);
              else {
                unsigned int v22 = v16 >> 3;
              }
              unint64_t v9 = "ASPMSPParseBufferToCxt: readStageNumOfFails202(12294): Error adding 1 elements to context";
              goto LABEL_1981;
            case 12295:
              if ((_DWORD)v16 != 8) {
                sub_10001BA0C( "ASPMSPParseBufferToCxt: readStageNumOfFails203(12295): cfg 1 elements; (1*8) cfg bytes != (%d) buffer bytes",
              }
                  a2,
                  a3,
                  a4,
                  a5,
                  a6,
                  a7,
                  a8,
                  v16);
              else {
                unsigned int v22 = v16 >> 3;
              }
              unint64_t v9 = "ASPMSPParseBufferToCxt: readStageNumOfFails203(12295): Error adding 1 elements to context";
              goto LABEL_1981;
            case 12296:
              if ((_DWORD)v16 != 8) {
                sub_10001BA0C( "ASPMSPParseBufferToCxt: initialReadStage204(12296): cfg 1 elements; (1*8) cfg bytes != (%d) buffer bytes",
              }
                  a2,
                  a3,
                  a4,
                  a5,
                  a6,
                  a7,
                  a8,
                  v16);
              else {
                unsigned int v22 = v16 >> 3;
              }
              unint64_t v9 = "ASPMSPParseBufferToCxt: initialReadStage204(12296): Error adding 1 elements to context";
              goto LABEL_1981;
            case 12297:
              if ((_DWORD)v16 != 8) {
                sub_10001BA0C( "ASPMSPParseBufferToCxt: initialReadStage205(12297): cfg 1 elements; (1*8) cfg bytes != (%d) buffer bytes",
              }
                  a2,
                  a3,
                  a4,
                  a5,
                  a6,
                  a7,
                  a8,
                  v16);
              else {
                unsigned int v22 = v16 >> 3;
              }
              unint64_t v9 = "ASPMSPParseBufferToCxt: initialReadStage205(12297): Error adding 1 elements to context";
              goto LABEL_1981;
            case 12298:
              if ((_DWORD)v16 != 8) {
                sub_10001BA0C( "ASPMSPParseBufferToCxt: initialReadStage206(12298): cfg 1 elements; (1*8) cfg bytes != (%d) buffer bytes",
              }
                  a2,
                  a3,
                  a4,
                  a5,
                  a6,
                  a7,
                  a8,
                  v16);
              else {
                unsigned int v22 = v16 >> 3;
              }
              unint64_t v9 = "ASPMSPParseBufferToCxt: initialReadStage206(12298): Error adding 1 elements to context";
              goto LABEL_1981;
            case 12299:
              if ((_DWORD)v16 != 8) {
                sub_10001BA0C( "ASPMSPParseBufferToCxt: initialReadStage207(12299): cfg 1 elements; (1*8) cfg bytes != (%d) buffer bytes",
              }
                  a2,
                  a3,
                  a4,
                  a5,
                  a6,
                  a7,
                  a8,
                  v16);
              else {
                unsigned int v22 = v16 >> 3;
              }
              unint64_t v9 = "ASPMSPParseBufferToCxt: initialReadStage207(12299): Error adding 1 elements to context";
              goto LABEL_1981;
            case 12300:
              if ((_DWORD)v16 != 8) {
                sub_10001BA0C( "ASPMSPParseBufferToCxt: initialReadStage208(12300): cfg 1 elements; (1*8) cfg bytes != (%d) buffer bytes",
              }
                  a2,
                  a3,
                  a4,
                  a5,
                  a6,
                  a7,
                  a8,
                  v16);
              else {
                unsigned int v22 = v16 >> 3;
              }
              unint64_t v9 = "ASPMSPParseBufferToCxt: initialReadStage208(12300): Error adding 1 elements to context";
              goto LABEL_1981;
            case 12301:
              if ((_DWORD)v16 != 8) {
                sub_10001BA0C( "ASPMSPParseBufferToCxt: initialReadStage209(12301): cfg 1 elements; (1*8) cfg bytes != (%d) buffer bytes",
              }
                  a2,
                  a3,
                  a4,
                  a5,
                  a6,
                  a7,
                  a8,
                  v16);
              else {
                unsigned int v22 = v16 >> 3;
              }
              unint64_t v9 = "ASPMSPParseBufferToCxt: initialReadStage209(12301): Error adding 1 elements to context";
              goto LABEL_1981;
            case 12302:
              if ((_DWORD)v16 != 8) {
                sub_10001BA0C( "ASPMSPParseBufferToCxt: readStage200(12302): cfg 1 elements; (1*8) cfg bytes != (%d) buffer bytes",
              }
                  a2,
                  a3,
                  a4,
                  a5,
                  a6,
                  a7,
                  a8,
                  v16);
              else {
                unsigned int v22 = v16 >> 3;
              }
              unint64_t v9 = "ASPMSPParseBufferToCxt: readStage200(12302): Error adding 1 elements to context";
              goto LABEL_1981;
            case 12303:
              if ((_DWORD)v16 != 32) {
                sub_10001BA0C( "ASPMSPParseBufferToCxt: readStage201(12303): cfg 4 elements; (4*8) cfg bytes != (%d) buffer bytes",
              }
                  a2,
                  a3,
                  a4,
                  a5,
                  a6,
                  a7,
                  a8,
                  v16);
              else {
                unsigned int v22 = v16 >> 3;
              }
              unint64_t v9 = "ASPMSPParseBufferToCxt: readStage201(12303): Error adding 4 elements to context";
              goto LABEL_1981;
            case 12304:
              if ((_DWORD)v16 != 32) {
                sub_10001BA0C( "ASPMSPParseBufferToCxt: readStage202(12304): cfg 4 elements; (4*8) cfg bytes != (%d) buffer bytes",
              }
                  a2,
                  a3,
                  a4,
                  a5,
                  a6,
                  a7,
                  a8,
                  v16);
              else {
                unsigned int v22 = v16 >> 3;
              }
              unint64_t v9 = "ASPMSPParseBufferToCxt: readStage202(12304): Error adding 4 elements to context";
              goto LABEL_1981;
            case 12305:
              if ((_DWORD)v16 != 8) {
                sub_10001BA0C( "ASPMSPParseBufferToCxt: initialReadStage210(12305): cfg 1 elements; (1*8) cfg bytes != (%d) buffer bytes",
              }
                  a2,
                  a3,
                  a4,
                  a5,
                  a6,
                  a7,
                  a8,
                  v16);
              else {
                unsigned int v22 = v16 >> 3;
              }
              unint64_t v9 = "ASPMSPParseBufferToCxt: initialReadStage210(12305): Error adding 1 elements to context";
              goto LABEL_1981;
            case 12306:
              if ((_DWORD)v16 != 8) {
                sub_10001BA0C( "ASPMSPParseBufferToCxt: initialReadStage211(12306): cfg 1 elements; (1*8) cfg bytes != (%d) buffer bytes",
              }
                  a2,
                  a3,
                  a4,
                  a5,
                  a6,
                  a7,
                  a8,
                  v16);
              else {
                unsigned int v22 = v16 >> 3;
              }
              unint64_t v9 = "ASPMSPParseBufferToCxt: initialReadStage211(12306): Error adding 1 elements to context";
              goto LABEL_1981;
            case 12307:
              if ((_DWORD)v16 != 8) {
                sub_10001BA0C( "ASPMSPParseBufferToCxt: readStage203(12307): cfg 1 elements; (1*8) cfg bytes != (%d) buffer bytes",
              }
                  a2,
                  a3,
                  a4,
                  a5,
                  a6,
                  a7,
                  a8,
                  v16);
              else {
                unsigned int v22 = v16 >> 3;
              }
              unint64_t v9 = "ASPMSPParseBufferToCxt: readStage203(12307): Error adding 1 elements to context";
              goto LABEL_1981;
            case 12308:
              if ((_DWORD)v16 != 8) {
                sub_10001BA0C( "ASPMSPParseBufferToCxt: readStage204(12308): cfg 1 elements; (1*8) cfg bytes != (%d) buffer bytes",
              }
                  a2,
                  a3,
                  a4,
                  a5,
                  a6,
                  a7,
                  a8,
                  v16);
              else {
                unsigned int v22 = v16 >> 3;
              }
              unint64_t v9 = "ASPMSPParseBufferToCxt: readStage204(12308): Error adding 1 elements to context";
              goto LABEL_1981;
            case 12309:
              if ((_DWORD)v16 != 8) {
                sub_10001BA0C( "ASPMSPParseBufferToCxt: readStage205(12309): cfg 1 elements; (1*8) cfg bytes != (%d) buffer bytes",
              }
                  a2,
                  a3,
                  a4,
                  a5,
                  a6,
                  a7,
                  a8,
                  v16);
              else {
                unsigned int v22 = v16 >> 3;
              }
              unint64_t v9 = "ASPMSPParseBufferToCxt: readStage205(12309): Error adding 1 elements to context";
              goto LABEL_1981;
            case 12310:
              if ((_DWORD)v16 != 8) {
                sub_10001BA0C( "ASPMSPParseBufferToCxt: readStage206(12310): cfg 1 elements; (1*8) cfg bytes != (%d) buffer bytes",
              }
                  a2,
                  a3,
                  a4,
                  a5,
                  a6,
                  a7,
                  a8,
                  v16);
              else {
                unsigned int v22 = v16 >> 3;
              }
              unint64_t v9 = "ASPMSPParseBufferToCxt: readStage206(12310): Error adding 1 elements to context";
              goto LABEL_1981;
            case 12311:
              if ((_DWORD)v16 != 8) {
                sub_10001BA0C( "ASPMSPParseBufferToCxt: readStage207(12311): cfg 1 elements; (1*8) cfg bytes != (%d) buffer bytes",
              }
                  a2,
                  a3,
                  a4,
                  a5,
                  a6,
                  a7,
                  a8,
                  v16);
              else {
                unsigned int v22 = v16 >> 3;
              }
              unint64_t v9 = "ASPMSPParseBufferToCxt: readStage207(12311): Error adding 1 elements to context";
              goto LABEL_1981;
            case 12312:
              if ((_DWORD)v16 != 8) {
                sub_10001BA0C( "ASPMSPParseBufferToCxt: readStage208(12312): cfg 1 elements; (1*8) cfg bytes != (%d) buffer bytes",
              }
                  a2,
                  a3,
                  a4,
                  a5,
                  a6,
                  a7,
                  a8,
                  v16);
              else {
                unsigned int v22 = v16 >> 3;
              }
              unint64_t v9 = "ASPMSPParseBufferToCxt: readStage208(12312): Error adding 1 elements to context";
              goto LABEL_1981;
            case 12313:
              if ((_DWORD)v16 != 32) {
                sub_10001BA0C( "ASPMSPParseBufferToCxt: readStage209(12313): cfg 4 elements; (4*8) cfg bytes != (%d) buffer bytes",
              }
                  a2,
                  a3,
                  a4,
                  a5,
                  a6,
                  a7,
                  a8,
                  v16);
              else {
                unsigned int v22 = v16 >> 3;
              }
              unint64_t v9 = "ASPMSPParseBufferToCxt: readStage209(12313): Error adding 4 elements to context";
              goto LABEL_1981;
            case 12314:
              if ((_DWORD)v16 != 32) {
                sub_10001BA0C( "ASPMSPParseBufferToCxt: readStage210(12314): cfg 4 elements; (4*8) cfg bytes != (%d) buffer bytes",
              }
                  a2,
                  a3,
                  a4,
                  a5,
                  a6,
                  a7,
                  a8,
                  v16);
              else {
                unsigned int v22 = v16 >> 3;
              }
              unint64_t v9 = "ASPMSPParseBufferToCxt: readStage210(12314): Error adding 4 elements to context";
              goto LABEL_1981;
            case 12315:
              if ((_DWORD)v16 != 8) {
                sub_10001BA0C( "ASPMSPParseBufferToCxt: initialReadStage212(12315): cfg 1 elements; (1*8) cfg bytes != (%d) buffer bytes",
              }
                  a2,
                  a3,
                  a4,
                  a5,
                  a6,
                  a7,
                  a8,
                  v16);
              else {
                unsigned int v22 = v16 >> 3;
              }
              unint64_t v9 = "ASPMSPParseBufferToCxt: initialReadStage212(12315): Error adding 1 elements to context";
              goto LABEL_1981;
            case 12316:
              if ((_DWORD)v16 != 8) {
                sub_10001BA0C( "ASPMSPParseBufferToCxt: initialReadStage213(12316): cfg 1 elements; (1*8) cfg bytes != (%d) buffer bytes",
              }
                  a2,
                  a3,
                  a4,
                  a5,
                  a6,
                  a7,
                  a8,
                  v16);
              else {
                unsigned int v22 = v16 >> 3;
              }
              unint64_t v9 = "ASPMSPParseBufferToCxt: initialReadStage213(12316): Error adding 1 elements to context";
              goto LABEL_1981;
            case 12317:
              if ((_DWORD)v16 != 8) {
                sub_10001BA0C( "ASPMSPParseBufferToCxt: readStage211(12317): cfg 1 elements; (1*8) cfg bytes != (%d) buffer bytes",
              }
                  a2,
                  a3,
                  a4,
                  a5,
                  a6,
                  a7,
                  a8,
                  v16);
              else {
                unsigned int v22 = v16 >> 3;
              }
              unint64_t v9 = "ASPMSPParseBufferToCxt: readStage211(12317): Error adding 1 elements to context";
              goto LABEL_1981;
            case 12318:
              if ((_DWORD)v16 != 8) {
                sub_10001BA0C( "ASPMSPParseBufferToCxt: readStage212(12318): cfg 1 elements; (1*8) cfg bytes != (%d) buffer bytes",
              }
                  a2,
                  a3,
                  a4,
                  a5,
                  a6,
                  a7,
                  a8,
                  v16);
              else {
                unsigned int v22 = v16 >> 3;
              }
              unint64_t v9 = "ASPMSPParseBufferToCxt: readStage212(12318): Error adding 1 elements to context";
              goto LABEL_1981;
            case 12319:
              if ((_DWORD)v16 != 8) {
                sub_10001BA0C( "ASPMSPParseBufferToCxt: readStage213(12319): cfg 1 elements; (1*8) cfg bytes != (%d) buffer bytes",
              }
                  a2,
                  a3,
                  a4,
                  a5,
                  a6,
                  a7,
                  a8,
                  v16);
              else {
                unsigned int v22 = v16 >> 3;
              }
              unint64_t v9 = "ASPMSPParseBufferToCxt: readStage213(12319): Error adding 1 elements to context";
              goto LABEL_1981;
            case 12320:
              if ((_DWORD)v16 != 8) {
                sub_10001BA0C( "ASPMSPParseBufferToCxt: readStage214(12320): cfg 1 elements; (1*8) cfg bytes != (%d) buffer bytes",
              }
                  a2,
                  a3,
                  a4,
                  a5,
                  a6,
                  a7,
                  a8,
                  v16);
              else {
                unsigned int v22 = v16 >> 3;
              }
              unint64_t v9 = "ASPMSPParseBufferToCxt: readStage214(12320): Error adding 1 elements to context";
              goto LABEL_1981;
            case 12321:
              if ((_DWORD)v16 != 8) {
                sub_10001BA0C( "ASPMSPParseBufferToCxt: readStage215(12321): cfg 1 elements; (1*8) cfg bytes != (%d) buffer bytes",
              }
                  a2,
                  a3,
                  a4,
                  a5,
                  a6,
                  a7,
                  a8,
                  v16);
              else {
                unsigned int v22 = v16 >> 3;
              }
              unint64_t v9 = "ASPMSPParseBufferToCxt: readStage215(12321): Error adding 1 elements to context";
              goto LABEL_1981;
            case 12322:
              if ((_DWORD)v16 != 8) {
                sub_10001BA0C( "ASPMSPParseBufferToCxt: dspExceptionParameter142(12322): cfg 1 elements; (1*8) cfg bytes != (%d) buffer bytes",
              }
                  a2,
                  a3,
                  a4,
                  a5,
                  a6,
                  a7,
                  a8,
                  v16);
              else {
                unsigned int v22 = v16 >> 3;
              }
              unint64_t v9 = "ASPMSPParseBufferToCxt: dspExceptionParameter142(12322): Error adding 1 elements to context";
              goto LABEL_1981;
            case 12323:
              if ((_DWORD)v16 != 8) {
                sub_10001BA0C( "ASPMSPParseBufferToCxt: dspExceptionParameter143(12323): cfg 1 elements; (1*8) cfg bytes != (%d) buffer bytes",
              }
                  a2,
                  a3,
                  a4,
                  a5,
                  a6,
                  a7,
                  a8,
                  v16);
              else {
                unsigned int v22 = v16 >> 3;
              }
              unint64_t v9 = "ASPMSPParseBufferToCxt: dspExceptionParameter143(12323): Error adding 1 elements to context";
              goto LABEL_1981;
            default:
              switch(v17)
              {
                case 4256:
                  if ((_DWORD)v16 != 40) {
                    sub_10001BA0C( "ASPMSPParseBufferToCxt: cbdr_step_5(4256): cfg 10 elements; (10*4) cfg bytes != (%d) buffer bytes",
                  }
                      a2,
                      a3,
                      a4,
                      a5,
                      a6,
                      a7,
                      a8,
                      v16);
                  else {
                    unsigned int v22 = v16 >> 2;
                  }
                  goto LABEL_1372;
                case 4257:
                  if ((_DWORD)v16 != 40) {
                    sub_10001BA0C( "ASPMSPParseBufferToCxt: cbdr_step_6(4257): cfg 10 elements; (10*4) cfg bytes != (%d) buffer bytes",
                  }
                      a2,
                      a3,
                      a4,
                      a5,
                      a6,
                      a7,
                      a8,
                      v16);
                  else {
                    unsigned int v22 = v16 >> 2;
                  }
                  unint64_t v9 = "ASPMSPParseBufferToCxt: cbdr_step_6(4257): Error adding 10 elements to context";
                  goto LABEL_1981;
                case 4258:
                  if ((_DWORD)v16 != 40) {
                    sub_10001BA0C( "ASPMSPParseBufferToCxt: cbdr_step_7(4258): cfg 10 elements; (10*4) cfg bytes != (%d) buffer bytes",
                  }
                      a2,
                      a3,
                      a4,
                      a5,
                      a6,
                      a7,
                      a8,
                      v16);
                  else {
                    unsigned int v22 = v16 >> 2;
                  }
                  unint64_t v9 = "ASPMSPParseBufferToCxt: cbdr_step_7(4258): Error adding 10 elements to context";
                  goto LABEL_1981;
                case 4259:
                  if ((_DWORD)v16 != 80) {
                    sub_10001BA0C( "ASPMSPParseBufferToCxt: dspExceptionParameter122(4259): cfg 20 elements; (20*4) cfg bytes != (%d) buffer bytes",
                  }
                      a2,
                      a3,
                      a4,
                      a5,
                      a6,
                      a7,
                      a8,
                      v16);
                  else {
                    unsigned int v22 = v16 >> 2;
                  }
                  unint64_t v9 = "ASPMSPParseBufferToCxt: dspExceptionParameter122(4259): Error adding 20 elements to context";
                  goto LABEL_1981;
                case 4260:
                  if ((_DWORD)v16 != 32) {
                    sub_10001BA0C( "ASPMSPParseBufferToCxt: dspExceptionParameter123(4260): cfg 8 elements; (8*4) cfg bytes != (%d) buffer bytes",
                  }
                      a2,
                      a3,
                      a4,
                      a5,
                      a6,
                      a7,
                      a8,
                      v16);
                  else {
                    unsigned int v22 = v16 >> 2;
                  }
                  unint64_t v9 = "ASPMSPParseBufferToCxt: dspExceptionParameter123(4260): Error adding 8 elements to context";
                  goto LABEL_1981;
                case 4261:
                  if ((_DWORD)v16 != 4) {
                    sub_10001BA0C( "ASPMSPParseBufferToCxt: dspExceptionParameter124(4261): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
                  }
                      a2,
                      a3,
                      a4,
                      a5,
                      a6,
                      a7,
                      a8,
                      v16);
                  else {
                    unsigned int v22 = v16 >> 2;
                  }
                  unint64_t v9 = "ASPMSPParseBufferToCxt: dspExceptionParameter124(4261): Error adding 1 elements to context";
                  goto LABEL_1981;
                case 4262:
                  if ((_DWORD)v16 != 4) {
                    sub_10001BA0C( "ASPMSPParseBufferToCxt: dspExceptionParameter125(4262): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
                  }
                      a2,
                      a3,
                      a4,
                      a5,
                      a6,
                      a7,
                      a8,
                      v16);
                  else {
                    unsigned int v22 = v16 >> 2;
                  }
                  unint64_t v9 = "ASPMSPParseBufferToCxt: dspExceptionParameter125(4262): Error adding 1 elements to context";
                  goto LABEL_1981;
                case 4263:
                  if ((_DWORD)v16 != 4) {
                    sub_10001BA0C( "ASPMSPParseBufferToCxt: dspExceptionParameter126(4263): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
                  }
                      a2,
                      a3,
                      a4,
                      a5,
                      a6,
                      a7,
                      a8,
                      v16);
                  else {
                    unsigned int v22 = v16 >> 2;
                  }
                  unint64_t v9 = "ASPMSPParseBufferToCxt: dspExceptionParameter126(4263): Error adding 1 elements to context";
                  goto LABEL_1981;
                case 4264:
                  if ((_DWORD)v16 != 16) {
                    sub_10001BA0C( "ASPMSPParseBufferToCxt: dspExceptionParameter127(4264): cfg 4 elements; (4*4) cfg bytes != (%d) buffer bytes",
                  }
                      a2,
                      a3,
                      a4,
                      a5,
                      a6,
                      a7,
                      a8,
                      v16);
                  else {
                    unsigned int v22 = v16 >> 2;
                  }
                  unint64_t v9 = "ASPMSPParseBufferToCxt: dspExceptionParameter127(4264): Error adding 4 elements to context";
                  goto LABEL_1981;
                case 4265:
                  if ((_DWORD)v16 != 16) {
                    sub_10001BA0C( "ASPMSPParseBufferToCxt: dspExceptionParameter128(4265): cfg 4 elements; (4*4) cfg bytes != (%d) buffer bytes",
                  }
                      a2,
                      a3,
                      a4,
                      a5,
                      a6,
                      a7,
                      a8,
                      v16);
                  else {
                    unsigned int v22 = v16 >> 2;
                  }
                  unint64_t v9 = "ASPMSPParseBufferToCxt: dspExceptionParameter128(4265): Error adding 4 elements to context";
                  goto LABEL_1981;
                case 4266:
                  if ((_DWORD)v16 != 16) {
                    sub_10001BA0C( "ASPMSPParseBufferToCxt: dspExceptionParameter129(4266): cfg 4 elements; (4*4) cfg bytes != (%d) buffer bytes",
                  }
                      a2,
                      a3,
                      a4,
                      a5,
                      a6,
                      a7,
                      a8,
                      v16);
                  else {
                    unsigned int v22 = v16 >> 2;
                  }
                  unint64_t v9 = "ASPMSPParseBufferToCxt: dspExceptionParameter129(4266): Error adding 4 elements to context";
                  goto LABEL_1981;
                case 4267:
                  if ((_DWORD)v16 != 16) {
                    sub_10001BA0C( "ASPMSPParseBufferToCxt: dspExceptionParameter130(4267): cfg 4 elements; (4*4) cfg bytes != (%d) buffer bytes",
                  }
                      a2,
                      a3,
                      a4,
                      a5,
                      a6,
                      a7,
                      a8,
                      v16);
                  else {
                    unsigned int v22 = v16 >> 2;
                  }
                  unint64_t v9 = "ASPMSPParseBufferToCxt: dspExceptionParameter130(4267): Error adding 4 elements to context";
                  goto LABEL_1981;
                case 4268:
                  if ((_DWORD)v16 != 16) {
                    sub_10001BA0C( "ASPMSPParseBufferToCxt: dspExceptionParameter131(4268): cfg 4 elements; (4*4) cfg bytes != (%d) buffer bytes",
                  }
                      a2,
                      a3,
                      a4,
                      a5,
                      a6,
                      a7,
                      a8,
                      v16);
                  else {
                    unsigned int v22 = v16 >> 2;
                  }
                  unint64_t v9 = "ASPMSPParseBufferToCxt: dspExceptionParameter131(4268): Error adding 4 elements to context";
                  goto LABEL_1981;
                case 4269:
                  if ((_DWORD)v16 != 40) {
                    sub_10001BA0C( "ASPMSPParseBufferToCxt: dspExceptionParameter132(4269): cfg 10 elements; (10*4) cfg bytes != (%d) buffer bytes",
                  }
                      a2,
                      a3,
                      a4,
                      a5,
                      a6,
                      a7,
                      a8,
                      v16);
                  else {
                    unsigned int v22 = v16 >> 2;
                  }
                  unint64_t v9 = "ASPMSPParseBufferToCxt: dspExceptionParameter132(4269): Error adding 10 elements to context";
                  goto LABEL_1981;
                case 4270:
                  if ((_DWORD)v16 != 40) {
                    sub_10001BA0C( "ASPMSPParseBufferToCxt: dspExceptionParameter133(4270): cfg 10 elements; (10*4) cfg bytes != (%d) buffer bytes",
                  }
                      a2,
                      a3,
                      a4,
                      a5,
                      a6,
                      a7,
                      a8,
                      v16);
                  else {
                    unsigned int v22 = v16 >> 2;
                  }
                  unint64_t v9 = "ASPMSPParseBufferToCxt: dspExceptionParameter133(4270): Error adding 10 elements to context";
                  goto LABEL_1981;
                case 4271:
                  if ((_DWORD)v16 != 4) {
                    sub_10001BA0C( "ASPMSPParseBufferToCxt: dspExceptionParameter134(4271): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
                  }
                      a2,
                      a3,
                      a4,
                      a5,
                      a6,
                      a7,
                      a8,
                      v16);
                  else {
                    unsigned int v22 = v16 >> 2;
                  }
                  unint64_t v9 = "ASPMSPParseBufferToCxt: dspExceptionParameter134(4271): Error adding 1 elements to context";
                  goto LABEL_1981;
                case 4272:
                  if ((_DWORD)v16 != 4) {
                    sub_10001BA0C( "ASPMSPParseBufferToCxt: dspExceptionParameter135(4272): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
                  }
                      a2,
                      a3,
                      a4,
                      a5,
                      a6,
                      a7,
                      a8,
                      v16);
                  else {
                    unsigned int v22 = v16 >> 2;
                  }
                  unint64_t v9 = "ASPMSPParseBufferToCxt: dspExceptionParameter135(4272): Error adding 1 elements to context";
                  goto LABEL_1981;
                case 4273:
                  if ((_DWORD)v16 != 4) {
                    sub_10001BA0C( "ASPMSPParseBufferToCxt: dspExceptionParameter136(4273): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
                  }
                      a2,
                      a3,
                      a4,
                      a5,
                      a6,
                      a7,
                      a8,
                      v16);
                  else {
                    unsigned int v22 = v16 >> 2;
                  }
                  unint64_t v9 = "ASPMSPParseBufferToCxt: dspExceptionParameter136(4273): Error adding 1 elements to context";
                  goto LABEL_1981;
                case 4274:
                  if ((_DWORD)v16 != 4) {
                    sub_10001BA0C( "ASPMSPParseBufferToCxt: dspExceptionParameter137(4274): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
                  }
                      a2,
                      a3,
                      a4,
                      a5,
                      a6,
                      a7,
                      a8,
                      v16);
                  else {
                    unsigned int v22 = v16 >> 2;
                  }
                  unint64_t v9 = "ASPMSPParseBufferToCxt: dspExceptionParameter137(4274): Error adding 1 elements to context";
                  goto LABEL_1981;
                case 4275:
                  if ((_DWORD)v16 != 4) {
                    sub_10001BA0C( "ASPMSPParseBufferToCxt: dspExceptionParameter138(4275): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
                  }
                      a2,
                      a3,
                      a4,
                      a5,
                      a6,
                      a7,
                      a8,
                      v16);
                  else {
                    unsigned int v22 = v16 >> 2;
                  }
                  unint64_t v9 = "ASPMSPParseBufferToCxt: dspExceptionParameter138(4275): Error adding 1 elements to context";
                  goto LABEL_1981;
                case 4276:
                  if ((_DWORD)v16 != 16) {
                    sub_10001BA0C( "ASPMSPParseBufferToCxt: dspExceptionParameter139(4276): cfg 4 elements; (4*4) cfg bytes != (%d) buffer bytes",
                  }
                      a2,
                      a3,
                      a4,
                      a5,
                      a6,
                      a7,
                      a8,
                      v16);
                  else {
                    unsigned int v22 = v16 >> 2;
                  }
                  unint64_t v9 = "ASPMSPParseBufferToCxt: dspExceptionParameter139(4276): Error adding 4 elements to context";
                  goto LABEL_1981;
                case 4277:
                  if ((_DWORD)v16 != 4) {
                    sub_10001BA0C( "ASPMSPParseBufferToCxt: dspExceptionParameter140(4277): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
                  }
                      a2,
                      a3,
                      a4,
                      a5,
                      a6,
                      a7,
                      a8,
                      v16);
                  else {
                    unsigned int v22 = v16 >> 2;
                  }
                  unint64_t v9 = "ASPMSPParseBufferToCxt: dspExceptionParameter140(4277): Error adding 1 elements to context";
                  goto LABEL_1981;
                case 4278:
                  if ((_DWORD)v16 != 4) {
                    sub_10001BA0C( "ASPMSPParseBufferToCxt: dspExceptionParameter141(4278): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
                  }
                      a2,
                      a3,
                      a4,
                      a5,
                      a6,
                      a7,
                      a8,
                      v16);
                  else {
                    unsigned int v22 = v16 >> 2;
                  }
                  unint64_t v9 = "ASPMSPParseBufferToCxt: dspExceptionParameter141(4278): Error adding 1 elements to context";
                  goto LABEL_1981;
                default:
                  switch(v17)
                  {
                    case 4164:
                      if ((_DWORD)v16 != 4) {
                        sub_10001BA0C( "ASPMSPParseBufferToCxt: syndSumAcqConvergedToStaticWalls(4164): cfg 1 elements; (1*4) cfg byte"
                      }
                          "s != (%d) buffer bytes",
                          a2,
                          a3,
                          a4,
                          a5,
                          a6,
                          a7,
                          a8,
                          v16);
                      else {
                        unsigned int v22 = v16 >> 2;
                      }
                      unint64_t v9 = "ASPMSPParseBufferToCxt: syndSumAcqConvergedToStaticWalls(4164): Error adding 1 elements to context";
                      goto LABEL_1981;
                    case 4165:
                      if ((_DWORD)v16 != 60) {
                        sub_10001BA0C( "ASPMSPParseBufferToCxt: DYCE1_Decoded_Bitflips(4165): cfg 15 elements; (15*4) cfg bytes != (%d) buffer bytes",
                      }
                          a2,
                          a3,
                          a4,
                          a5,
                          a6,
                          a7,
                          a8,
                          v16);
                      else {
                        unsigned int v22 = v16 >> 2;
                      }
                      unint64_t v9 = "ASPMSPParseBufferToCxt: DYCE1_Decoded_Bitflips(4165): Error adding 15 elements to context";
                      goto LABEL_1981;
                    case 4166:
                      if ((_DWORD)v16 != 80) {
                        sub_10001BA0C( "ASPMSPParseBufferToCxt: DYCE1_Target_Bitflips(4166): cfg 20 elements; (20*4) cfg bytes != (%d) buffer bytes",
                      }
                          a2,
                          a3,
                          a4,
                          a5,
                          a6,
                          a7,
                          a8,
                          v16);
                      else {
                        unsigned int v22 = v16 >> 2;
                      }
                      unint64_t v9 = "ASPMSPParseBufferToCxt: DYCE1_Target_Bitflips(4166): Error adding 20 elements to context";
                      goto LABEL_1981;
                    case 4167:
                      if ((_DWORD)v16 != 60) {
                        sub_10001BA0C( "ASPMSPParseBufferToCxt: DYCE2_Decoded_Bitflips(4167): cfg 15 elements; (15*4) cfg bytes != (%d) buffer bytes",
                      }
                          a2,
                          a3,
                          a4,
                          a5,
                          a6,
                          a7,
                          a8,
                          v16);
                      else {
                        unsigned int v22 = v16 >> 2;
                      }
                      unint64_t v9 = "ASPMSPParseBufferToCxt: DYCE2_Decoded_Bitflips(4167): Error adding 15 elements to context";
                      goto LABEL_1981;
                    case 4168:
                      if ((_DWORD)v16 != 80) {
                        sub_10001BA0C( "ASPMSPParseBufferToCxt: DYCE2_Target_Bitflips(4168): cfg 20 elements; (20*4) cfg bytes != (%d) buffer bytes",
                      }
                          a2,
                          a3,
                          a4,
                          a5,
                          a6,
                          a7,
                          a8,
                          v16);
                      else {
                        unsigned int v22 = v16 >> 2;
                      }
                      unint64_t v9 = "ASPMSPParseBufferToCxt: DYCE2_Target_Bitflips(4168): Error adding 20 elements to context";
                      goto LABEL_1981;
                    default:
                      if (v17 <= 12323)
                      {
                        switch(v17)
                        {
                          case 8193:
                            if ((_DWORD)v16 != 20) {
                              sub_10001BA0C( "ASPMSPParseBufferToCxt: avg_rd_window_size(8193): cfg 5 elements; (5*4) cfg bytes != (%d) buffer bytes",
                            }
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v16);
                            else {
                              unsigned int v22 = v16 >> 2;
                            }
                            unint64_t v9 = "ASPMSPParseBufferToCxt: avg_rd_window_size(8193): Error adding 5 elements to context";
                            break;
                          case 8194:
                            if ((_DWORD)v16 != 4) {
                              sub_10001BA0C( "ASPMSPParseBufferToCxt: num_zq_failures(8194): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
                            }
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v16);
                            else {
                              unsigned int v22 = v16 >> 2;
                            }
                            unint64_t v9 = "ASPMSPParseBufferToCxt: num_zq_failures(8194): Error adding 1 elements to context";
                            break;
                          case 8195:
                            if ((_DWORD)v16 != 64) {
                              sub_10001BA0C( "ASPMSPParseBufferToCxt: lower_die_temperature(8195): cfg 16 elements; (16*4) cfg bytes !"
                            }
                                "= (%d) buffer bytes",
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v16);
                            else {
                              unsigned int v22 = v16 >> 2;
                            }
                            unint64_t v9 = "ASPMSPParseBufferToCxt: lower_die_temperature(8195): Error adding 16 elements to context";
                            break;
                          case 8196:
                            if ((_DWORD)v16 != 64) {
                              sub_10001BA0C( "ASPMSPParseBufferToCxt: higher_die_temperature(8196): cfg 16 elements; (16*4) cfg bytes "
                            }
                                "!= (%d) buffer bytes",
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v16);
                            else {
                              unsigned int v22 = v16 >> 2;
                            }
                            unint64_t v9 = "ASPMSPParseBufferToCxt: higher_die_temperature(8196): Error adding 16 elements to context";
                            break;
                          case 8197:
                            if ((_DWORD)v16 != 4) {
                              sub_10001BA0C( "ASPMSPParseBufferToCxt: number_of_sram_flips(8197): cfg 1 elements; (1*4) cfg bytes != ("
                            }
                                "%d) buffer bytes",
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v16);
                            else {
                              unsigned int v22 = v16 >> 2;
                            }
                            unint64_t v9 = "ASPMSPParseBufferToCxt: number_of_sram_flips(8197): Error adding 1 elements to context";
                            break;
                          case 8198:
                            if ((_DWORD)v16 != 4) {
                              sub_10001BA0C( "ASPMSPParseBufferToCxt: number_of_reset_failures(8198): cfg 1 elements; (1*4) cfg bytes "
                            }
                                "!= (%d) buffer bytes",
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v16);
                            else {
                              unsigned int v22 = v16 >> 2;
                            }
                            unint64_t v9 = "ASPMSPParseBufferToCxt: number_of_reset_failures(8198): Error adding 1 elements to context";
                            break;
                          case 8199:
                            if ((_DWORD)v16 != 4) {
                              sub_10001BA0C( "ASPMSPParseBufferToCxt: device_config(8199): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
                            }
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v16);
                            else {
                              unsigned int v22 = v16 >> 2;
                            }
                            unint64_t v9 = "ASPMSPParseBufferToCxt: device_config(8199): Error adding 1 elements to context";
                            break;
                          case 8200:
                            if ((_DWORD)v16 != 4) {
                              sub_10001BA0C( "ASPMSPParseBufferToCxt: number_of_throttling_events(8200): cfg 1 elements; (1*4) cfg byt"
                            }
                                "es != (%d) buffer bytes",
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v16);
                            else {
                              unsigned int v22 = v16 >> 2;
                            }
                            unint64_t v9 = "ASPMSPParseBufferToCxt: number_of_throttling_events(8200): Error adding 1 elements to context";
                            break;
                          case 8201:
                            if ((_DWORD)v16 != 4) {
                              sub_10001BA0C( "ASPMSPParseBufferToCxt: link_speed_recoveries(8201): cfg 1 elements; (1*4) cfg bytes != "
                            }
                                "(%d) buffer bytes",
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v16);
                            else {
                              unsigned int v22 = v16 >> 2;
                            }
                            unint64_t v9 = "ASPMSPParseBufferToCxt: link_speed_recoveries(8201): Error adding 1 elements to context";
                            break;
                          case 8202:
                            if ((_DWORD)v16 != 4) {
                              sub_10001BA0C( "ASPMSPParseBufferToCxt: fw_updates(8202): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
                            }
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v16);
                            else {
                              unsigned int v22 = v16 >> 2;
                            }
                            unint64_t v9 = "ASPMSPParseBufferToCxt: fw_updates(8202): Error adding 1 elements to context";
                            break;
                          case 8203:
                            if ((_DWORD)v16 != 4) {
                              sub_10001BA0C( "ASPMSPParseBufferToCxt: maintenance_backup_to_main(8203): cfg 1 elements; (1*4) cfg byte"
                            }
                                "s != (%d) buffer bytes",
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v16);
                            else {
                              unsigned int v22 = v16 >> 2;
                            }
                            unint64_t v9 = "ASPMSPParseBufferToCxt: maintenance_backup_to_main(8203): Error adding 1 elements to context";
                            break;
                          case 8204:
                            if ((_DWORD)v16 != 4) {
                              sub_10001BA0C( "ASPMSPParseBufferToCxt: maintenance_main_to_backup(8204): cfg 1 elements; (1*4) cfg byte"
                            }
                                "s != (%d) buffer bytes",
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v16);
                            else {
                              unsigned int v22 = v16 >> 2;
                            }
                            unint64_t v9 = "ASPMSPParseBufferToCxt: maintenance_main_to_backup(8204): Error adding 1 elements to context";
                            break;
                          case 8205:
                            if ((_DWORD)v16 != 4) {
                              sub_10001BA0C( "ASPMSPParseBufferToCxt: boot_block_erase_failures(8205): cfg 1 elements; (1*4) cfg bytes"
                            }
                                " != (%d) buffer bytes",
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v16);
                            else {
                              unsigned int v22 = v16 >> 2;
                            }
                            unint64_t v9 = "ASPMSPParseBufferToCxt: boot_block_erase_failures(8205): Error adding 1 elements to context";
                            break;
                          case 8206:
                            if ((_DWORD)v16 != 4) {
                              sub_10001BA0C( "ASPMSPParseBufferToCxt: boot_block_program_failures(8206): cfg 1 elements; (1*4) cfg byt"
                            }
                                "es != (%d) buffer bytes",
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v16);
                            else {
                              unsigned int v22 = v16 >> 2;
                            }
                            unint64_t v9 = "ASPMSPParseBufferToCxt: boot_block_program_failures(8206): Error adding 1 elements to context";
                            break;
                          case 8207:
                            if ((_DWORD)v16 != 4) {
                              sub_10001BA0C( "ASPMSPParseBufferToCxt: boot_block_read_verify_failures(8207): cfg 1 elements; (1*4) cfg"
                            }
                                " bytes != (%d) buffer bytes",
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v16);
                            else {
                              unsigned int v22 = v16 >> 2;
                            }
                            unint64_t v9 = "ASPMSPParseBufferToCxt: boot_block_read_verify_failures(8207): Error adding 1 elements to context";
                            break;
                          case 8208:
                            if ((_DWORD)v16 != 4) {
                              sub_10001BA0C( "ASPMSPParseBufferToCxt: boot_block_read_failures(8208): cfg 1 elements; (1*4) cfg bytes "
                            }
                                "!= (%d) buffer bytes",
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v16);
                            else {
                              unsigned int v22 = v16 >> 2;
                            }
                            unint64_t v9 = "ASPMSPParseBufferToCxt: boot_block_read_failures(8208): Error adding 1 elements to context";
                            break;
                          case 8209:
                            if ((_DWORD)v16 != 4) {
                              sub_10001BA0C( "ASPMSPParseBufferToCxt: boot_block_refresh(8209): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
                            }
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v16);
                            else {
                              unsigned int v22 = v16 >> 2;
                            }
                            unint64_t v9 = "ASPMSPParseBufferToCxt: boot_block_refresh(8209): Error adding 1 elements to context";
                            break;
                          case 8210:
                            if ((_DWORD)v16 != 4) {
                              sub_10001BA0C( "ASPMSPParseBufferToCxt: boot_block_convert_to_main(8210): cfg 1 elements; (1*4) cfg byte"
                            }
                                "s != (%d) buffer bytes",
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v16);
                            else {
                              unsigned int v22 = v16 >> 2;
                            }
                            unint64_t v9 = "ASPMSPParseBufferToCxt: boot_block_convert_to_main(8210): Error adding 1 elements to context";
                            break;
                          case 8211:
                            if ((_DWORD)v16 != 4) {
                              sub_10001BA0C( "ASPMSPParseBufferToCxt: boot_block_read_source_changed(8211): cfg 1 elements; (1*4) cfg "
                            }
                                "bytes != (%d) buffer bytes",
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v16);
                            else {
                              unsigned int v22 = v16 >> 2;
                            }
                            unint64_t v9 = "ASPMSPParseBufferToCxt: boot_block_read_source_changed(8211): Error adding 1 elements to context";
                            break;
                          case 8212:
                            if ((_DWORD)v16 != 16) {
                              sub_10001BA0C( "ASPMSPParseBufferToCxt: open_blocks_hist(8212): cfg 4 elements; (4*4) cfg bytes != (%d) buffer bytes",
                            }
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v16);
                            else {
                              unsigned int v22 = v16 >> 2;
                            }
                            unint64_t v9 = "ASPMSPParseBufferToCxt: open_blocks_hist(8212): Error adding 4 elements to context";
                            break;
                          case 8213:
                            if ((_DWORD)v16 != 24) {
                              sub_10001BA0C( "ASPMSPParseBufferToCxt: random_read_hit_ratio_hist(8213): cfg 6 elements; (6*4) cfg byte"
                            }
                                "s != (%d) buffer bytes",
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v16);
                            else {
                              unsigned int v22 = v16 >> 2;
                            }
                            unint64_t v9 = "ASPMSPParseBufferToCxt: random_read_hit_ratio_hist(8213): Error adding 6 elements to context";
                            break;
                          case 8214:
                            if ((_DWORD)v16 != 20) {
                              sub_10001BA0C( "ASPMSPParseBufferToCxt: active_time_hist(8214): cfg 5 elements; (5*4) cfg bytes != (%d) buffer bytes",
                            }
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v16);
                            else {
                              unsigned int v22 = v16 >> 2;
                            }
                            unint64_t v9 = "ASPMSPParseBufferToCxt: active_time_hist(8214): Error adding 5 elements to context";
                            break;
                          case 8215:
                            if ((_DWORD)v16 != 8) {
                              sub_10001BA0C( "ASPMSPParseBufferToCxt: rd_retraining_failures(8215): cfg 2 elements; (2*4) cfg bytes !="
                            }
                                " (%d) buffer bytes",
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v16);
                            else {
                              unsigned int v22 = v16 >> 2;
                            }
                            unint64_t v9 = "ASPMSPParseBufferToCxt: rd_retraining_failures(8215): Error adding 2 elements to context";
                            break;
                          case 8216:
                            if ((_DWORD)v16 != 8) {
                              sub_10001BA0C( "ASPMSPParseBufferToCxt: wr_retraining_failures(8216): cfg 2 elements; (2*4) cfg bytes !="
                            }
                                " (%d) buffer bytes",
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v16);
                            else {
                              unsigned int v22 = v16 >> 2;
                            }
                            unint64_t v9 = "ASPMSPParseBufferToCxt: wr_retraining_failures(8216): Error adding 2 elements to context";
                            break;
                          case 8217:
                            if ((_DWORD)v16 != 20) {
                              sub_10001BA0C( "ASPMSPParseBufferToCxt: auto_skip(8217): cfg 5 elements; (5*4) cfg bytes != (%d) buffer bytes",
                            }
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v16);
                            else {
                              unsigned int v22 = v16 >> 2;
                            }
                            unint64_t v9 = "ASPMSPParseBufferToCxt: auto_skip(8217): Error adding 5 elements to context";
                            break;
                          case 8218:
                            if ((_DWORD)v16 != 4) {
                              sub_10001BA0C( "ASPMSPParseBufferToCxt: number_of_dcc_pass_after_retry(8218): cfg 1 elements; (1*4) cfg "
                            }
                                "bytes != (%d) buffer bytes",
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v16);
                            else {
                              unsigned int v22 = v16 >> 2;
                            }
                            unint64_t v9 = "ASPMSPParseBufferToCxt: number_of_dcc_pass_after_retry(8218): Error adding 1 elements to context";
                            break;
                          case 8219:
                            if ((_DWORD)v16 != 4) {
                              sub_10001BA0C( "ASPMSPParseBufferToCxt: number_of_dcc_failures(8219): cfg 1 elements; (1*4) cfg bytes !="
                            }
                                " (%d) buffer bytes",
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v16);
                            else {
                              unsigned int v22 = v16 >> 2;
                            }
                            unint64_t v9 = "ASPMSPParseBufferToCxt: number_of_dcc_failures(8219): Error adding 1 elements to context";
                            break;
                          case 8220:
                            if ((_DWORD)v16 != 28) {
                              sub_10001BA0C( "ASPMSPParseBufferToCxt: open_blocks_hist(8220): cfg 7 elements; (7*4) cfg bytes != (%d) buffer bytes",
                            }
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v16);
                            else {
                              unsigned int v22 = v16 >> 2;
                            }
                            unint64_t v9 = "ASPMSPParseBufferToCxt: open_blocks_hist(8220): Error adding 7 elements to context";
                            break;
                          case 8221:
                            if ((_DWORD)v16 != 4) {
                              sub_10001BA0C( "ASPMSPParseBufferToCxt: max_size_open_blocks_list(8221): cfg 1 elements; (1*4) cfg bytes"
                            }
                                " != (%d) buffer bytes",
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v16);
                            else {
                              unsigned int v22 = v16 >> 2;
                            }
                            unint64_t v9 = "ASPMSPParseBufferToCxt: max_size_open_blocks_list(8221): Error adding 1 elements to context";
                            break;
                          case 8222:
                            if ((_DWORD)v16 != 4) {
                              sub_10001BA0C( "ASPMSPParseBufferToCxt: gps_max_num_of_failures(8222): cfg 1 elements; (1*4) cfg bytes !"
                            }
                                "= (%d) buffer bytes",
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v16);
                            else {
                              unsigned int v22 = v16 >> 2;
                            }
                            unint64_t v9 = "ASPMSPParseBufferToCxt: gps_max_num_of_failures(8222): Error adding 1 elements to context";
                            break;
                          case 8223:
                            if ((_DWORD)v16 != 4) {
                              sub_10001BA0C( "ASPMSPParseBufferToCxt: gps_num_of_failures_max_overflow(8223): cfg 1 elements; (1*4) cf"
                            }
                                "g bytes != (%d) buffer bytes",
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v16);
                            else {
                              unsigned int v22 = v16 >> 2;
                            }
                            unint64_t v9 = "ASPMSPParseBufferToCxt: gps_num_of_failures_max_overflow(8223): Error adding 1 elements to context";
                            break;
                          case 8224:
                            if ((_DWORD)v16 != 32) {
                              sub_10001BA0C( "ASPMSPParseBufferToCxt: active_time_hist(8224): cfg 8 elements; (8*4) cfg bytes != (%d) buffer bytes",
                            }
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v16);
                            else {
                              unsigned int v22 = v16 >> 2;
                            }
                            unint64_t v9 = "ASPMSPParseBufferToCxt: active_time_hist(8224): Error adding 8 elements to context";
                            break;
                          case 8225:
                            if ((_DWORD)v16 != 4) {
                              sub_10001BA0C( "ASPMSPParseBufferToCxt: num_auto_program_cache_terminations(8225): cfg 1 elements; (1*4)"
                            }
                                " cfg bytes != (%d) buffer bytes",
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v16);
                            else {
                              unsigned int v22 = v16 >> 2;
                            }
                            unint64_t v9 = "ASPMSPParseBufferToCxt: num_auto_program_cache_terminations(8225): Error adding 1 elements to context";
                            break;
                          case 8226:
                            if ((_DWORD)v16 != 4) {
                              sub_10001BA0C( "ASPMSPParseBufferToCxt: number_of_read_cache_auto_terminations(8226): cfg 1 elements; (1"
                            }
                                "*4) cfg bytes != (%d) buffer bytes",
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v16);
                            else {
                              unsigned int v22 = v16 >> 2;
                            }
                            unint64_t v9 = "ASPMSPParseBufferToCxt: number_of_read_cache_auto_terminations(8226): Error adding 1 el"
                                 "ements to context";
                            break;
                          case 8227:
                            if ((_DWORD)v16 != 28) {
                              sub_10001BA0C( "ASPMSPParseBufferToCxt: external_etags_usage_hist(8227): cfg 7 elements; (7*4) cfg bytes"
                            }
                                " != (%d) buffer bytes",
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v16);
                            else {
                              unsigned int v22 = v16 >> 2;
                            }
                            unint64_t v9 = "ASPMSPParseBufferToCxt: external_etags_usage_hist(8227): Error adding 7 elements to context";
                            break;
                          case 8228:
                            if ((_DWORD)v16 != 16) {
                              sub_10001BA0C( "ASPMSPParseBufferToCxt: internal_etags_usage_hist(8228): cfg 4 elements; (4*4) cfg bytes"
                            }
                                " != (%d) buffer bytes",
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v16);
                            else {
                              unsigned int v22 = v16 >> 2;
                            }
                            unint64_t v9 = "ASPMSPParseBufferToCxt: internal_etags_usage_hist(8228): Error adding 4 elements to context";
                            break;
                          case 8229:
                            if ((_DWORD)v16 != 4) {
                              sub_10001BA0C( "ASPMSPParseBufferToCxt: max_heap_usage(8229): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
                            }
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v16);
                            else {
                              unsigned int v22 = v16 >> 2;
                            }
                            unint64_t v9 = "ASPMSPParseBufferToCxt: max_heap_usage(8229): Error adding 1 elements to context";
                            break;
                          case 8230:
                            if ((_DWORD)v16 != 24) {
                              sub_10001BA0C( "ASPMSPParseBufferToCxt: rom_num_hard_resets(8230): cfg 6 elements; (6*4) cfg bytes != (%d) buffer bytes",
                            }
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v16);
                            else {
                              unsigned int v22 = v16 >> 2;
                            }
                            unint64_t v9 = "ASPMSPParseBufferToCxt: rom_num_hard_resets(8230): Error adding 6 elements to context";
                            break;
                          case 8231:
                            if ((_DWORD)v16 != 64) {
                              sub_10001BA0C( "ASPMSPParseBufferToCxt: lower_die_temperature(8231): cfg 16 elements; (16*4) cfg bytes !"
                            }
                                "= (%d) buffer bytes",
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v16);
                            else {
                              unsigned int v22 = v16 >> 2;
                            }
                            unint64_t v9 = "ASPMSPParseBufferToCxt: lower_die_temperature(8231): Error adding 16 elements to context";
                            break;
                          case 8232:
                            if ((_DWORD)v16 != 64) {
                              sub_10001BA0C( "ASPMSPParseBufferToCxt: higher_die_temperature(8232): cfg 16 elements; (16*4) cfg bytes "
                            }
                                "!= (%d) buffer bytes",
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v16);
                            else {
                              unsigned int v22 = v16 >> 2;
                            }
                            unint64_t v9 = "ASPMSPParseBufferToCxt: higher_die_temperature(8232): Error adding 16 elements to context";
                            break;
                          case 8233:
                            if ((_DWORD)v16 != 24) {
                              sub_10001BA0C( "ASPMSPParseBufferToCxt: random_read_hit_ratio_hist(8233): cfg 6 elements; (6*4) cfg byte"
                            }
                                "s != (%d) buffer bytes",
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v16);
                            else {
                              unsigned int v22 = v16 >> 2;
                            }
                            unint64_t v9 = "ASPMSPParseBufferToCxt: random_read_hit_ratio_hist(8233): Error adding 6 elements to context";
                            break;
                          case 8234:
                            if ((_DWORD)v16 != 4) {
                              sub_10001BA0C( "ASPMSPParseBufferToCxt: msp_number_sram_flips(8234): cfg 1 elements; (1*4) cfg bytes != "
                            }
                                "(%d) buffer bytes",
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v16);
                            else {
                              unsigned int v22 = v16 >> 2;
                            }
                            unint64_t v9 = "ASPMSPParseBufferToCxt: msp_number_sram_flips(8234): Error adding 1 elements to context";
                            break;
                          case 8235:
                            if ((_DWORD)v16 != 28) {
                              sub_10001BA0C( "ASPMSPParseBufferToCxt: boot_time_normal_power(8235): cfg 7 elements; (7*4) cfg bytes !="
                            }
                                " (%d) buffer bytes",
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v16);
                            else {
                              unsigned int v22 = v16 >> 2;
                            }
                            unint64_t v9 = "ASPMSPParseBufferToCxt: boot_time_normal_power(8235): Error adding 7 elements to context";
                            break;
                          case 8236:
                            if ((_DWORD)v16 != 28) {
                              sub_10001BA0C( "ASPMSPParseBufferToCxt: boot_time_low_power(8236): cfg 7 elements; (7*4) cfg bytes != (%d) buffer bytes",
                            }
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v16);
                            else {
                              unsigned int v22 = v16 >> 2;
                            }
                            unint64_t v9 = "ASPMSPParseBufferToCxt: boot_time_low_power(8236): Error adding 7 elements to context";
                            break;
                          case 8237:
                            if ((_DWORD)v16 != 40) {
                              sub_10001BA0C( "ASPMSPParseBufferToCxt: active_time_bw_pg_hist(8237): cfg 10 elements; (10*4) cfg bytes "
                            }
                                "!= (%d) buffer bytes",
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v16);
                            else {
                              unsigned int v22 = v16 >> 2;
                            }
                            unint64_t v9 = "ASPMSPParseBufferToCxt: active_time_bw_pg_hist(8237): Error adding 10 elements to context";
                            break;
                          case 8238:
                            if ((_DWORD)v16 != 4) {
                              sub_10001BA0C( "ASPMSPParseBufferToCxt: active_time_bw_pg_min(8238): cfg 1 elements; (1*4) cfg bytes != "
                            }
                                "(%d) buffer bytes",
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v16);
                            else {
                              unsigned int v22 = v16 >> 2;
                            }
                            unint64_t v9 = "ASPMSPParseBufferToCxt: active_time_bw_pg_min(8238): Error adding 1 elements to context";
                            break;
                          case 8239:
                            if ((_DWORD)v16 != 4) {
                              sub_10001BA0C( "ASPMSPParseBufferToCxt: active_time_bw_pg_max(8239): cfg 1 elements; (1*4) cfg bytes != "
                            }
                                "(%d) buffer bytes",
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v16);
                            else {
                              unsigned int v22 = v16 >> 2;
                            }
                            unint64_t v9 = "ASPMSPParseBufferToCxt: active_time_bw_pg_max(8239): Error adding 1 elements to context";
                            break;
                          case 8240:
                            if ((_DWORD)v16 != 20) {
                              sub_10001BA0C( "ASPMSPParseBufferToCxt: mdll_relative_offset(8240): cfg 5 elements; (5*4) cfg bytes != ("
                            }
                                "%d) buffer bytes",
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v16);
                            else {
                              unsigned int v22 = v16 >> 2;
                            }
                            unint64_t v9 = "ASPMSPParseBufferToCxt: mdll_relative_offset(8240): Error adding 5 elements to context";
                            break;
                          case 8241:
                            if ((_DWORD)v16 != 4) {
                              sub_10001BA0C( "ASPMSPParseBufferToCxt: num_pg_regrets(8241): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
                            }
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v16);
                            else {
                              unsigned int v22 = v16 >> 2;
                            }
                            unint64_t v9 = "ASPMSPParseBufferToCxt: num_pg_regrets(8241): Error adding 1 elements to context";
                            break;
                          case 8242:
                            if ((_DWORD)v16 != 4) {
                              sub_10001BA0C( "ASPMSPParseBufferToCxt: spi_image_overall_duration_acc(8242): cfg 1 elements; (1*4) cfg "
                            }
                                "bytes != (%d) buffer bytes",
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v16);
                            else {
                              unsigned int v22 = v16 >> 2;
                            }
                            unint64_t v9 = "ASPMSPParseBufferToCxt: spi_image_overall_duration_acc(8242): Error adding 1 elements to context";
                            break;
                          case 8243:
                            if ((_DWORD)v16 != 4) {
                              sub_10001BA0C( "ASPMSPParseBufferToCxt: spi_image_cw_fetch_duration_acc(8243): cfg 1 elements; (1*4) cfg"
                            }
                                " bytes != (%d) buffer bytes",
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v16);
                            else {
                              unsigned int v22 = v16 >> 2;
                            }
                            unint64_t v9 = "ASPMSPParseBufferToCxt: spi_image_cw_fetch_duration_acc(8243): Error adding 1 elements to context";
                            break;
                          case 8244:
                            if ((_DWORD)v16 != 20) {
                              sub_10001BA0C( "ASPMSPParseBufferToCxt: spi_image_cw_fetch_duration_hist(8244): cfg 5 elements; (5*4) cf"
                            }
                                "g bytes != (%d) buffer bytes",
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v16);
                            else {
                              unsigned int v22 = v16 >> 2;
                            }
                            unint64_t v9 = "ASPMSPParseBufferToCxt: spi_image_cw_fetch_duration_hist(8244): Error adding 5 elements to context";
                            break;
                          default:
                            switch(v17)
                            {
                              case 4279:
                                if ((_DWORD)v16 != 16) {
                                  sub_10001BA0C( "ASPMSPParseBufferToCxt: fs1_4b_fail(4279): cfg 4 elements; (4*4) cfg bytes != (%d) buffer bytes",
                                }
                                    a2,
                                    a3,
                                    a4,
                                    a5,
                                    a6,
                                    a7,
                                    a8,
                                    v16);
                                else {
                                  unsigned int v22 = v16 >> 2;
                                }
                                unint64_t v9 = v14;
                                break;
                              case 4280:
                                if ((_DWORD)v16 != 16) {
                                  sub_10001BA0C( "ASPMSPParseBufferToCxt: fs1_4b_fast_fail(4280): cfg 4 elements; (4*4) cfg bytes != ("
                                }
                                    "%d) buffer bytes",
                                    a2,
                                    a3,
                                    a4,
                                    a5,
                                    a6,
                                    a7,
                                    a8,
                                    v16);
                                else {
                                  unsigned int v22 = v16 >> 2;
                                }
                                unint64_t v9 = "ASPMSPParseBufferToCxt: fs1_4b_fast_fail(4280): Error adding 4 elements to context";
                                break;
                              case 4281:
                                if ((_DWORD)v16 != 40) {
                                  sub_10001BA0C( "ASPMSPParseBufferToCxt: dyce_decoded_bit_flips(4281): cfg 10 elements; (10*4) cfg by"
                                }
                                    "tes != (%d) buffer bytes",
                                    a2,
                                    a3,
                                    a4,
                                    a5,
                                    a6,
                                    a7,
                                    a8,
                                    v16);
                                else {
                                  unsigned int v22 = v16 >> 2;
                                }
                                unint64_t v9 = "ASPMSPParseBufferToCxt: dyce_decoded_bit_flips(4281): Error adding 10 elements to context";
                                break;
                              case 4282:
                                if ((_DWORD)v16 != 60) {
                                  sub_10001BA0C( "ASPMSPParseBufferToCxt: slip_bch(4282): cfg 15 elements; (15*4) cfg bytes != (%d) buffer bytes",
                                }
                                    a2,
                                    a3,
                                    a4,
                                    a5,
                                    a6,
                                    a7,
                                    a8,
                                    v16);
                                else {
                                  unsigned int v22 = v16 >> 2;
                                }
                                unint64_t v9 = "ASPMSPParseBufferToCxt: slip_bch(4282): Error adding 15 elements to context";
                                break;
                              case 4283:
                                if ((_DWORD)v16 != 40) {
                                  sub_10001BA0C( "ASPMSPParseBufferToCxt: read_fail(4283): cfg 10 elements; (10*4) cfg bytes != (%d) buffer bytes",
                                }
                                    a2,
                                    a3,
                                    a4,
                                    a5,
                                    a6,
                                    a7,
                                    a8,
                                    v16);
                                else {
                                  unsigned int v22 = v16 >> 2;
                                }
                                unint64_t v9 = "ASPMSPParseBufferToCxt: read_fail(4283): Error adding 10 elements to context";
                                break;
                              case 4284:
                                if ((_DWORD)v16 != 40) {
                                  sub_10001BA0C( "ASPMSPParseBufferToCxt: tr_read_fail(4284): cfg 10 elements; (10*4) cfg bytes != (%d) buffer bytes",
                                }
                                    a2,
                                    a3,
                                    a4,
                                    a5,
                                    a6,
                                    a7,
                                    a8,
                                    v16);
                                else {
                                  unsigned int v22 = v16 >> 2;
                                }
                                unint64_t v9 = "ASPMSPParseBufferToCxt: tr_read_fail(4284): Error adding 10 elements to context";
                                break;
                              case 4285:
                                if ((_DWORD)v16 != 40) {
                                  sub_10001BA0C( "ASPMSPParseBufferToCxt: tr_aux_bfs_percent(4285): cfg 10 elements; (10*4) cfg bytes "
                                }
                                    "!= (%d) buffer bytes",
                                    a2,
                                    a3,
                                    a4,
                                    a5,
                                    a6,
                                    a7,
                                    a8,
                                    v16);
                                else {
                                  unsigned int v22 = v16 >> 2;
                                }
                                unint64_t v9 = "ASPMSPParseBufferToCxt: tr_aux_bfs_percent(4285): Error adding 10 elements to context";
                                break;
                              case 4286:
                                if ((_DWORD)v16 != 20) {
                                  sub_10001BA0C( "ASPMSPParseBufferToCxt: tr_reconstruct_pass_step(4286): cfg 5 elements; (5*4) cfg by"
                                }
                                    "tes != (%d) buffer bytes",
                                    a2,
                                    a3,
                                    a4,
                                    a5,
                                    a6,
                                    a7,
                                    a8,
                                    v16);
                                else {
                                  unsigned int v22 = v16 >> 2;
                                }
                                unint64_t v9 = "ASPMSPParseBufferToCxt: tr_reconstruct_pass_step(4286): Error adding 5 elements to context";
                                break;
                              case 4287:
                                if ((_DWORD)v16 != 4) {
                                  sub_10001BA0C( "ASPMSPParseBufferToCxt: tr_reconstruct_num(4287): cfg 1 elements; (1*4) cfg bytes !="
                                }
                                    " (%d) buffer bytes",
                                    a2,
                                    a3,
                                    a4,
                                    a5,
                                    a6,
                                    a7,
                                    a8,
                                    v16);
                                else {
                                  unsigned int v22 = v16 >> 2;
                                }
                                unint64_t v9 = "ASPMSPParseBufferToCxt: tr_reconstruct_num(4287): Error adding 1 elements to context";
                                break;
                              default:
                                goto LABEL_1404;
                            }

                            goto LABEL_1981;
                        }

                        goto LABEL_1981;
                      }

                      switch(v17)
                      {
                        case 12326:
                          if ((_DWORD)v16 != 8) {
                            sub_10001BA0C( "ASPMSPParseBufferToCxt: initialReadStageParameter2(12326): cfg 1 elements; (1*8) cfg bytes"
                          }
                              " != (%d) buffer bytes",
                              a2,
                              a3,
                              a4,
                              a5,
                              a6,
                              a7,
                              a8,
                              v16);
                          else {
                            unsigned int v22 = v16 >> 3;
                          }
                          if (!sub_10002B6E0(a1, "initialReadStageParameter2", v11, 8u, v22))
                          {
                            unint64_t v9 = "ASPMSPParseBufferToCxt: initialReadStageParameter2(12326): Error adding 1 elements to context";
                            goto LABEL_1981;
                          }

                          break;
                        case 12325:
                          if ((_DWORD)v16 != 8) {
                            sub_10001BA0C( "ASPMSPParseBufferToCxt: initialReadStageParameter1(12325): cfg 1 elements; (1*8) cfg bytes"
                          }
                              " != (%d) buffer bytes",
                              a2,
                              a3,
                              a4,
                              a5,
                              a6,
                              a7,
                              a8,
                              v16);
                          else {
                            unsigned int v22 = v16 >> 3;
                          }
                          if (!sub_10002B6E0(a1, "initialReadStageParameter1", v11, 8u, v22))
                          {
                            unint64_t v9 = "ASPMSPParseBufferToCxt: initialReadStageParameter1(12325): Error adding 1 elements to context";
                            goto LABEL_1981;
                          }

                          break;
                        case 12324:
                          if ((_DWORD)v16 != 8) {
                            sub_10001BA0C( "ASPMSPParseBufferToCxt: dspExceptionParameter144(12324): cfg 1 elements; (1*8) cfg bytes !"
                          }
                              "= (%d) buffer bytes",
                              a2,
                              a3,
                              a4,
                              a5,
                              a6,
                              a7,
                              a8,
                              v16);
                          else {
                            unsigned int v22 = v16 >> 3;
                          }
                          if (!sub_10002B6E0(a1, "dspExceptionParameter144", v11, 8u, v22))
                          {
                            unint64_t v9 = "ASPMSPParseBufferToCxt: dspExceptionParameter144(12324): Error adding 1 elements to context";
                            goto LABEL_1981;
                          }

                          break;
                        default:
LABEL_1404:
                          switch(v17)
                          {
                            case 8245:
                              if ((_DWORD)v16 != 4) {
                                sub_10001BA0C( "ASPMSPParseBufferToCxt: spi_num_uses(8245): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
                              }
                                  a2,
                                  a3,
                                  a4,
                                  a5,
                                  a6,
                                  a7,
                                  a8,
                                  v16);
                              else {
                                unsigned int v22 = v16 >> 2;
                              }
                              unint64_t v9 = "ASPMSPParseBufferToCxt: spi_num_uses(8245): Error adding 1 elements to context";
                              break;
                            case 8246:
                              if ((_DWORD)v16 != 20) {
                                sub_10001BA0C( "ASPMSPParseBufferToCxt: e2e_error_count_tmode(8246): cfg 5 elements; (5*4) cfg bytes !"
                              }
                                  "= (%d) buffer bytes",
                                  a2,
                                  a3,
                                  a4,
                                  a5,
                                  a6,
                                  a7,
                                  a8,
                                  v16);
                              else {
                                unsigned int v22 = v16 >> 2;
                              }
                              unint64_t v9 = "ASPMSPParseBufferToCxt: e2e_error_count_tmode(8246): Error adding 5 elements to context";
                              break;
                            case 8247:
                              if ((_DWORD)v16 != 36) {
                                sub_10001BA0C( "ASPMSPParseBufferToCxt: rd_window_dist(8247): cfg 9 elements; (9*4) cfg bytes != (%d) buffer bytes",
                              }
                                  a2,
                                  a3,
                                  a4,
                                  a5,
                                  a6,
                                  a7,
                                  a8,
                                  v16);
                              else {
                                unsigned int v22 = v16 >> 2;
                              }
                              unint64_t v9 = "ASPMSPParseBufferToCxt: rd_window_dist(8247): Error adding 9 elements to context";
                              break;
                            case 8248:
                              if ((_DWORD)v16 != 36) {
                                sub_10001BA0C( "ASPMSPParseBufferToCxt: extended_rd_window_diff_dist(8248): cfg 9 elements; (9*4) cfg "
                              }
                                  "bytes != (%d) buffer bytes",
                                  a2,
                                  a3,
                                  a4,
                                  a5,
                                  a6,
                                  a7,
                                  a8,
                                  v16);
                              else {
                                unsigned int v22 = v16 >> 2;
                              }
                              unint64_t v9 = "ASPMSPParseBufferToCxt: extended_rd_window_diff_dist(8248): Error adding 9 elements to context";
                              break;
                            case 8249:
                              if ((_DWORD)v16 != 8) {
                                sub_10001BA0C( "ASPMSPParseBufferToCxt: rd_retraining_failures_v2(8249): cfg 2 elements; (2*4) cfg byt"
                              }
                                  "es != (%d) buffer bytes",
                                  a2,
                                  a3,
                                  a4,
                                  a5,
                                  a6,
                                  a7,
                                  a8,
                                  v16);
                              else {
                                unsigned int v22 = v16 >> 2;
                              }
                              unint64_t v9 = "ASPMSPParseBufferToCxt: rd_retraining_failures_v2(8249): Error adding 2 elements to context";
                              break;
                            case 8250:
                              if ((_DWORD)v16 != 120) {
                                sub_10001BA0C( "ASPMSPParseBufferToCxt: lower_die_temperature(8250): cfg 30 elements; (30*4) cfg bytes"
                              }
                                  " != (%d) buffer bytes",
                                  a2,
                                  a3,
                                  a4,
                                  a5,
                                  a6,
                                  a7,
                                  a8,
                                  v16);
                              else {
                                unsigned int v22 = v16 >> 2;
                              }
                              unint64_t v9 = "ASPMSPParseBufferToCxt: lower_die_temperature(8250): Error adding 30 elements to context";
                              break;
                            case 8251:
                              if ((_DWORD)v16 != 120) {
                                sub_10001BA0C( "ASPMSPParseBufferToCxt: higher_die_temperature(8251): cfg 30 elements; (30*4) cfg byte"
                              }
                                  "s != (%d) buffer bytes",
                                  a2,
                                  a3,
                                  a4,
                                  a5,
                                  a6,
                                  a7,
                                  a8,
                                  v16);
                              else {
                                unsigned int v22 = v16 >> 2;
                              }
                              unint64_t v9 = "ASPMSPParseBufferToCxt: higher_die_temperature(8251): Error adding 30 elements to context";
                              break;
                            case 8252:
                              if ((_DWORD)v16 != 36) {
                                sub_10001BA0C( "ASPMSPParseBufferToCxt: rd_window_dist_single_die(8252): cfg 9 elements; (9*4) cfg byt"
                              }
                                  "es != (%d) buffer bytes",
                                  a2,
                                  a3,
                                  a4,
                                  a5,
                                  a6,
                                  a7,
                                  a8,
                                  v16);
                              else {
                                unsigned int v22 = v16 >> 2;
                              }
                              unint64_t v9 = "ASPMSPParseBufferToCxt: rd_window_dist_single_die(8252): Error adding 9 elements to context";
                              break;
                            case 8253:
                              if ((_DWORD)v16 != 16) {
                                sub_10001BA0C( "ASPMSPParseBufferToCxt: parallel_slip_drops_hist(8253): cfg 4 elements; (4*4) cfg byte"
                              }
                                  "s != (%d) buffer bytes",
                                  a2,
                                  a3,
                                  a4,
                                  a5,
                                  a6,
                                  a7,
                                  a8,
                                  v16);
                              else {
                                unsigned int v22 = v16 >> 2;
                              }
                              unint64_t v9 = "ASPMSPParseBufferToCxt: parallel_slip_drops_hist(8253): Error adding 4 elements to context";
                              break;
                            case 8254:
                              if ((_DWORD)v16 != 4) {
                                sub_10001BA0C( "ASPMSPParseBufferToCxt: sys_halt_max_latency(8254): cfg 1 elements; (1*4) cfg bytes !="
                              }
                                  " (%d) buffer bytes",
                                  a2,
                                  a3,
                                  a4,
                                  a5,
                                  a6,
                                  a7,
                                  a8,
                                  v16);
                              else {
                                unsigned int v22 = v16 >> 2;
                              }
                              unint64_t v9 = "ASPMSPParseBufferToCxt: sys_halt_max_latency(8254): Error adding 1 elements to context";
                              break;
                            case 8255:
                              if ((_DWORD)v16 != 4) {
                                sub_10001BA0C( "ASPMSPParseBufferToCxt: sys_halt_max_latency_opcode(8255): cfg 1 elements; (1*4) cfg b"
                              }
                                  "ytes != (%d) buffer bytes",
                                  a2,
                                  a3,
                                  a4,
                                  a5,
                                  a6,
                                  a7,
                                  a8,
                                  v16);
                              else {
                                unsigned int v22 = v16 >> 2;
                              }
                              unint64_t v9 = "ASPMSPParseBufferToCxt: sys_halt_max_latency_opcode(8255): Error adding 1 elements to context";
                              break;
                            case 8256:
                              if ((_DWORD)v16 != 4) {
                                sub_10001BA0C( "ASPMSPParseBufferToCxt: channel_halt_max_latency(8256): cfg 1 elements; (1*4) cfg byte"
                              }
                                  "s != (%d) buffer bytes",
                                  a2,
                                  a3,
                                  a4,
                                  a5,
                                  a6,
                                  a7,
                                  a8,
                                  v16);
                              else {
                                unsigned int v22 = v16 >> 2;
                              }
                              unint64_t v9 = "ASPMSPParseBufferToCxt: channel_halt_max_latency(8256): Error adding 1 elements to context";
                              break;
                            case 8257:
                              if ((_DWORD)v16 != 8) {
                                sub_10001BA0C( "ASPMSPParseBufferToCxt: max_heap_usage_v2(8257): cfg 2 elements; (2*4) cfg bytes != (%d) buffer bytes",
                              }
                                  a2,
                                  a3,
                                  a4,
                                  a5,
                                  a6,
                                  a7,
                                  a8,
                                  v16);
                              else {
                                unsigned int v22 = v16 >> 2;
                              }
                              unint64_t v9 = "ASPMSPParseBufferToCxt: max_heap_usage_v2(8257): Error adding 2 elements to context";
                              break;
                            default:
                              switch(v17)
                              {
                                case 16384:
                                  if ((_DWORD)v16 != 8) {
                                    sub_10001BA0C( "ASPMSPParseBufferToCxt: fw_version_identifier(16384): cfg 1 elements; (1*8) cfg by"
                                  }
                                      "tes != (%d) buffer bytes",
                                      a2,
                                      a3,
                                      a4,
                                      a5,
                                      a6,
                                      a7,
                                      a8,
                                      v16);
                                  else {
                                    unsigned int v22 = v16 >> 3;
                                  }
                                  unint64_t v9 = "ASPMSPParseBufferToCxt: fw_version_identifier(16384): Error adding 1 elements to context";
                                  break;
                                case 16385:
                                  if ((_DWORD)v16 != 40) {
                                    sub_10001BA0C( "ASPMSPParseBufferToCxt: random_read_size_ratio(16385): cfg 5 elements; (5*8) cfg b"
                                  }
                                      "ytes != (%d) buffer bytes",
                                      a2,
                                      a3,
                                      a4,
                                      a5,
                                      a6,
                                      a7,
                                      a8,
                                      v16);
                                  else {
                                    unsigned int v22 = v16 >> 3;
                                  }
                                  unint64_t v9 = "ASPMSPParseBufferToCxt: random_read_size_ratio(16385): Error adding 5 elements to context";
                                  break;
                                case 16386:
                                  if ((_DWORD)v16 != 8) {
                                    sub_10001BA0C( "ASPMSPParseBufferToCxt: number_gracefull_read_terminations(16386): cfg 1 elements;"
                                  }
                                      " (1*8) cfg bytes != (%d) buffer bytes",
                                      a2,
                                      a3,
                                      a4,
                                      a5,
                                      a6,
                                      a7,
                                      a8,
                                      v16);
                                  else {
                                    unsigned int v22 = v16 >> 3;
                                  }
                                  if (sub_10002B6E0( a1,  "number_gracefull_read_terminations",  v11,  8u,  v22)) {
                                    goto LABEL_1372;
                                  }
                                  unint64_t v9 = "ASPMSPParseBufferToCxt: number_gracefull_read_terminations(16386): Error adding 1"
                                       " elements to context";
                                  break;
                                case 16387:
                                  if ((_DWORD)v16 != 8) {
                                    sub_10001BA0C( "ASPMSPParseBufferToCxt: active_time_bw_pg_acc(16387): cfg 1 elements; (1*8) cfg by"
                                  }
                                      "tes != (%d) buffer bytes",
                                      a2,
                                      a3,
                                      a4,
                                      a5,
                                      a6,
                                      a7,
                                      a8,
                                      v16);
                                  else {
                                    unsigned int v22 = v16 >> 3;
                                  }
                                  unint64_t v9 = "ASPMSPParseBufferToCxt: active_time_bw_pg_acc(16387): Error adding 1 elements to context";
                                  break;
                                case 16388:
                                  if ((_DWORD)v16 != 8) {
                                    sub_10001BA0C( "ASPMSPParseBufferToCxt: num_pg_events(16388): cfg 1 elements; (1*8) cfg bytes != ("
                                  }
                                      "%d) buffer bytes",
                                      a2,
                                      a3,
                                      a4,
                                      a5,
                                      a6,
                                      a7,
                                      a8,
                                      v16);
                                  else {
                                    unsigned int v22 = v16 >> 3;
                                  }
                                  unint64_t v9 = "ASPMSPParseBufferToCxt: num_pg_events(16388): Error adding 1 elements to context";
                                  break;
                                case 16389:
                                  if ((_DWORD)v16 != 128) {
                                    sub_10001BA0C( "ASPMSPParseBufferToCxt: algo_queue_depth(16389): cfg 16 elements; (16*8) cfg bytes"
                                  }
                                      " != (%d) buffer bytes",
                                      a2,
                                      a3,
                                      a4,
                                      a5,
                                      a6,
                                      a7,
                                      a8,
                                      v16);
                                  else {
                                    unsigned int v22 = v16 >> 3;
                                  }
                                  unint64_t v9 = "ASPMSPParseBufferToCxt: algo_queue_depth(16389): Error adding 16 elements to context";
                                  break;
                                case 16390:
                                  if ((_DWORD)v16 != 128) {
                                    sub_10001BA0C( "ASPMSPParseBufferToCxt: parallel_slip_hist(16390): cfg 16 elements; (16*8) cfg byt"
                                  }
                                      "es != (%d) buffer bytes",
                                      a2,
                                      a3,
                                      a4,
                                      a5,
                                      a6,
                                      a7,
                                      a8,
                                      v16);
                                  else {
                                    unsigned int v22 = v16 >> 3;
                                  }
                                  unint64_t v9 = "ASPMSPParseBufferToCxt: parallel_slip_hist(16390): Error adding 16 elements to context";
                                  break;
                                case 16391:
                                  if ((_DWORD)v16 != 48) {
                                    sub_10001BA0C( "ASPMSPParseBufferToCxt: sys_halt_latency_hist(16391): cfg 6 elements; (6*8) cfg by"
                                  }
                                      "tes != (%d) buffer bytes",
                                      a2,
                                      a3,
                                      a4,
                                      a5,
                                      a6,
                                      a7,
                                      a8,
                                      v16);
                                  else {
                                    unsigned int v22 = v16 >> 3;
                                  }
                                  unint64_t v9 = "ASPMSPParseBufferToCxt: sys_halt_latency_hist(16391): Error adding 6 elements to context";
                                  break;
                                case 16392:
                                  if ((_DWORD)v16 != 48) {
                                    sub_10001BA0C( "ASPMSPParseBufferToCxt: channel_halt_latency_hist(16392): cfg 6 elements; (6*8) cf"
                                  }
                                      "g bytes != (%d) buffer bytes",
                                      a2,
                                      a3,
                                      a4,
                                      a5,
                                      a6,
                                      a7,
                                      a8,
                                      v16);
                                  else {
                                    unsigned int v22 = v16 >> 3;
                                  }
                                  unint64_t v9 = "ASPMSPParseBufferToCxt: channel_halt_latency_hist(16392): Error adding 6 elements to context";
                                  break;
                                case 16393:
                                  if ((_DWORD)v16 != 8) {
                                    sub_10001BA0C( "ASPMSPParseBufferToCxt: num_idle_die_read_cache_terminate(16393): cfg 1 elements; "
                                  }
                                      "(1*8) cfg bytes != (%d) buffer bytes",
                                      a2,
                                      a3,
                                      a4,
                                      a5,
                                      a6,
                                      a7,
                                      a8,
                                      v16);
                                  else {
                                    unsigned int v22 = v16 >> 3;
                                  }
                                  if (sub_10002B6E0( a1,  "num_idle_die_read_cache_terminate",  v11,  8u,  v22)) {
                                    goto LABEL_1372;
                                  }
                                  unint64_t v9 = "ASPMSPParseBufferToCxt: num_idle_die_read_cache_terminate(16393): Error adding 1 "
                                       "elements to context";
                                  break;
                                default:
                                  goto LABEL_1373;
                              }

                              goto LABEL_1981;
                          }

                          goto LABEL_1981;
                      }

LABEL_1372:
                      uint64_t v8 = v8 + v22;
LABEL_1373:
                      uint64_t v13 = &jpt_10002FABC;
                      break;
                  }

                  break;
              }

              break;
          }

          break;
      }

      goto LABEL_461;
  }

uint64_t sub_100032174(uint64_t result, const char *a2, const char *a3, uint64_t a4)
{
  if (result)
  {
    int v7 = (void *)result;
    uint64_t v8 = (char *)calloc(1uLL, 0x78uLL);
    unint64_t v9 = calloc(1uLL, 0x78uLL);
    unsigned int v10 = v9;
    if (v8 && v9)
    {
      uint64_t v11 = v7[1];
      if (v11 && (uint64_t v12 = v7[3]) != 0)
      {
        *(void *)(v11 + 112) = v9;
        uint64_t v13 = (char **)(v12 + 112);
      }

      else
      {
        void *v7 = v9;
        uint64_t v13 = (char **)(v7 + 2);
      }

      *uint64_t v13 = v8;
      v7[1] = v9;
      v7[3] = v8;
      *((void *)v8 + 14) = 0LL;
      *((void *)v9 + 14) = 0LL;
      snprintf(v9, 0x63uLL, "%s%s", a2, a3);
      v10[99] = 0;
      snprintf(v8, 0x63uLL, "%llu", a4);
      v8[99] = 0;
      *((void *)v8 + 13) = a4;
      return 1LL;
    }

    else
    {
      if (v8) {
        free(v8);
      }
      if (v10) {
        free(v10);
      }
      return 0LL;
    }
  }

  return result;
}

double sub_100032278(uint64_t a1)
{
  if (a1)
  {
    id v2 = *(void **)a1;
    if (v2)
    {
      do
      {
        id v3 = (void *)v2[14];
        free(v2);
        id v2 = v3;
      }

      while (v3);
    }

    int v4 = *(void **)(a1 + 16);
    if (v4)
    {
      do
      {
        uint64_t v5 = (void *)v4[14];
        free(v4);
        int v4 = v5;
      }

      while (v5);
    }

    double result = 0.0;
    *(_OWORD *)a1 = 0u;
    *(_OWORD *)(a1 + 16) = 0u;
  }

  return result;
}

uint64_t sub_1000322D0(void *a1, const char *a2, const char *a3, uint64_t a4)
{
  uint64_t v8 = (char *)malloc(0x78uLL);
  unint64_t v9 = malloc(0x78uLL);
  unsigned int v10 = v9;
  uint64_t v11 = a1[1];
  if (v11 && (uint64_t v12 = a1[3]) != 0)
  {
    *(void *)(v11 + 112) = v9;
    uint64_t v13 = (char **)(v12 + 112);
  }

  else
  {
    *a1 = v9;
    uint64_t v13 = (char **)(a1 + 2);
  }

  *uint64_t v13 = v8;
  a1[1] = v9;
  a1[3] = v8;
  *((void *)v8 + 14) = 0LL;
  v9[14] = 0LL;
  snprintf((char *)v9, 0x63uLL, "%s%s", a2, a3);
  *((_BYTE *)v10 + 99) = 0;
  uint64_t result = snprintf(v8, 0x63uLL, "%llu", a4);
  v8[99] = 0;
  *((void *)v8 + 13) = a4;
  return result;
}

BOOL sub_10003239C(uint64_t a1, uint64_t a2, char *a3, size_t *a4, _DWORD *a5, unsigned int *a6)
{
  *(_OWORD *)__int128 v74 = 0u;
  __int128 v75 = 0u;
  if (!a5) {
    return 0LL;
  }
  int v9 = a5[3];
  size_t v10 = *a4;
  uint64_t v11 = a5[6];
  *(void *)__int128 v76 = 0LL;
  uint64_t v77 = 0LL;
  uint64_t v78 = 0LL;
  gettimeofday(&v73, 0LL);
  uint64_t v12 = localtime(&v73.tv_sec);
  strftime(v76, 0x18uLL, "%Y-%m-%d %H:%M:%S", v12);
  __sprintf_chk(v74, 0, 0x20uLL, "%s.%03d", v76, v73.tv_usec / 1000);
  unsigned int v13 = snprintf(a3, v10, "Captured at: %s\n", v74);
  size_t v14 = v10 - v13;
  BOOL v15 = v10 <= v13;
  uint64_t v16 = &a3[v13];
  if (v10 > v13) {
    size_t v17 = v10 - v13;
  }
  else {
    size_t v17 = v10;
  }
  __int128 v69 = a3;
  if (v10 > v13) {
    uint64_t v18 = &a3[v13];
  }
  else {
    uint64_t v18 = a3;
  }
  id v68 = a5;
  if (*a6) {
    goto LABEL_9;
  }
  if (a5[1] >= 6u)
  {
    if (v10 > v13)
    {
      unsigned int v62 = snprintf(&a3[v13], v14, "- ASP Snapshot - \n%s\n");
      goto LABEL_92;
    }

LABEL_94:
    uint64_t v19 = 0LL;
    BOOL v15 = 1;
    goto LABEL_95;
  }

  if (v10 <= v13) {
    goto LABEL_94;
  }
  unsigned int v62 = snprintf( &a3[v13],  v14,  "Key: \n T   - Timestamp\n E   - Erased bands during this time interval\n HR  - Host Reads (in 4k sectors)\n HW  - Host Writes (in 4k sectors)\n NR  - Nand Reads (in 4k sectors)\n NW  - Nand Writes (in 4k sectors)\n TH  - Time in Hysteresis in this time interval (in ms)\n GC  - Number of sectors (4k bytes) completed GC in this time interval\n W   - Number of wear level bands completed in this time interval\n BI  - Bands Intermediate (SLC) PendingErase\n BU  - Bands User (MLC) PendingErase\n V   - Number of Free Nodes\n BF  - Buffer Fragments/BufferHighWater\n P   - Percent of time in DoPreempt rather than DoNormal\n H   - Qos Delays: Normal/Extreme\n X   - Successful expedite commands/Failed expedite commands\n L   - Age of the oldest command in ms (calculated every second)/Qos Interval (in 100us units)\n C   - Command tags in use by host (Min/Max)S   - Number of free segs\n U   - Sectors of host unmaps\n RO  - Num read ops for this time interval: priority0/priority1/...\n RL  - Total Read Latency (in us) for this time interval: priority0/priority1/...\n RM  - Max Read Latency (int us) for this time interval: priority0/priority1/...\n WO  - Num write ops for this time interval: priority0/priority1/...\n WL  - Total write latency (in us) for this time interval: priority0/priority1/...\n WM  - Max write latency (in us) for this time interval: priority0/priority1/...\n \n");
LABEL_92:
  if (v14 <= v62) {
    goto LABEL_94;
  }
  BOOL v15 = 0;
  uint64_t v18 = &v16[v62];
  size_t v17 = v14 - v62;
LABEL_9:
  uint64_t v19 = 0LL;
  unsigned int v20 = v9 - 1;
  unsigned int v21 = *a6;
  if (*a6 >= v9 - 1 || v15) {
    goto LABEL_95;
  }
  uint64_t v19 = 0LL;
  uint64_t v23 = a1;
  unsigned int v22 = a5;
  char v24 = (_DWORD *)((char *)a5 + v11);
  unint64_t v25 = *v24;
  unsigned int v64 = v9 - 1;
  unint64_t v70 = v25;
  while (2)
  {
    uint64_t v72 = v23 + v22[2] * v21;
    if (!*(_DWORD *)(v72 + v24[3])) {
      goto LABEL_83;
    }
    __int128 v65 = v19;
    if (!(_DWORD)v25) {
      goto LABEL_81;
    }
    unint64_t v26 = 0LL;
    do
    {
      unsigned int v27 = LOWORD(v24[7 * v26 + 2]);
      if (v27 < 2)
      {
        id v39 = &v24[7 * v26];
        int v42 = *((unsigned __int8 *)v39 + 20);
        id v40 = (const char *)(v39 + 5);
        int v41 = v42;
        if (!v42) {
          goto LABEL_78;
        }
        unsigned int v43 = fmtcheck(v40, "%u");
        unsigned int v44 = snprintf(v18, v17, v43, *(unsigned int *)(v72 + v24[7 * v26 + 3]), v63);
      }

      else
      {
        if (v27 != 2)
        {
          if (v27 == 3)
          {
            __int16 v28 = &v24[7 * v26];
            unsigned int v29 = v28[4];
            unsigned int v30 = v29 / 0xC;
            __int16 v71 = (char *)(v28 + 5);
            id v31 = fmtcheck((const char *)v28 + 20, "%s");
            size_t v32 = snprintf(v18, v17, v31, "O");
            BOOL v33 = v17 <= v32;
            if (v17 <= v32) {
              size_t v32 = 0LL;
            }
            v17 -= v32;
            v18 += v32;
            if (v29 >= 0xC)
            {
              uint64_t v34 = 0LL;
              if (v30 <= 1) {
                unsigned int v35 = 1;
              }
              else {
                unsigned int v35 = v29 / 0xC;
              }
              uint64_t v36 = 12LL * v35;
              do
              {
                if (v33)
                {
                  BOOL v33 = 1;
                }

                else
                {
                  if (v34) {
                    unsigned int v37 = snprintf(v18, v17, "/%4u");
                  }
                  else {
                    unsigned int v37 = snprintf(v18, v17, "%4u");
                  }
                  if (v17 <= v37)
                  {
                    BOOL v33 = 1;
                  }

                  else
                  {
                    v17 -= v37;
                    v18 += v37;
                    BOOL v33 = 0;
                  }
                }

                v34 += 12LL;
              }

              while (v36 != v34);
            }

            if (v33)
            {
              char v38 = 1;
            }

            else
            {
              double v48 = fmtcheck(v71, "%s");
              unsigned int v49 = snprintf(v18, v17, v48, "L");
              if (v17 <= v49)
              {
                char v38 = 1;
              }

              else
              {
                v17 -= v49;
                v18 += v49;
                char v38 = 0;
              }
            }

            if (v29 >= 0xC)
            {
              uint64_t v50 = 0LL;
              if (v30 <= 1) {
                unsigned int v51 = 1;
              }
              else {
                unsigned int v51 = v29 / 0xC;
              }
              uint64_t v52 = 12LL * v51;
              do
              {
                if ((v38 & 1) != 0)
                {
                  char v38 = 1;
                }

                else
                {
                  if (v50) {
                    unsigned int v53 = snprintf(v18, v17, "/%7u");
                  }
                  else {
                    unsigned int v53 = snprintf(v18, v17, "%7u");
                  }
                  if (v17 <= v53)
                  {
                    char v38 = 1;
                  }

                  else
                  {
                    v17 -= v53;
                    v18 += v53;
                    char v38 = 0;
                  }
                }

                v50 += 12LL;
              }

              while (v52 != v50);
            }

            if ((v38 & 1) != 0)
            {
              int v41 = 1;
            }

            else
            {
              uint64_t v54 = fmtcheck(v71, "%s");
              unsigned int v55 = snprintf(v18, v17, v54, "M");
              if (v17 <= v55)
              {
                int v41 = 1;
              }

              else
              {
                v17 -= v55;
                v18 += v55;
                int v41 = 0;
              }
            }

            unint64_t v25 = v70;
            if (v29 >= 0xC)
            {
              uint64_t v56 = 0LL;
              if (v30 <= 1) {
                unsigned int v57 = 1;
              }
              else {
                unsigned int v57 = v30;
              }
              uint64_t v58 = 12LL * v57;
              do
              {
                if ((v41 & 1) != 0)
                {
                  int v41 = 1;
                }

                else
                {
                  if (v56) {
                    unsigned int v59 = snprintf(v18, v17, "/%5u");
                  }
                  else {
                    unsigned int v59 = snprintf(v18, v17, "%5u");
                  }
                  if (v17 <= v59)
                  {
                    int v41 = 1;
                  }

                  else
                  {
                    v17 -= v59;
                    v18 += v59;
                    int v41 = 0;
                  }
                }

                v56 += 12LL;
              }

              while (v58 != v56);
            }
          }

          else
          {
            int v41 = 0;
          }

          goto LABEL_78;
        }

        id v45 = &v24[7 * v26];
        unsigned int v46 = *(_DWORD *)(v72 + v45[3]);
        double v47 = fmtcheck((const char *)v45 + 20, "%u %u");
        unsigned int v44 = snprintf(v18, v17, v47, v46 / 0x3E8uLL, v46 % 0x3E8 / 0xAuLL);
      }

      if (v17 <= v44) {
        goto LABEL_89;
      }
      int v41 = 0;
      v18 += v44;
      v17 -= v44;
LABEL_78:
      ++v26;
    }

    while (v26 < v25 && !v41);
    if ((v41 & 1) == 0)
    {
LABEL_81:
      unsigned int v60 = snprintf(v18, v17, "\n");
      if (v17 > v60)
      {
        v18 += v60;
        v17 -= v60;
        uint64_t v19 = (char *)(v18 - v69);
        uint64_t v23 = a1;
        unsigned int v22 = v68;
        unsigned int v20 = v64;
LABEL_83:
        unsigned int v21 = *a6 + 1;
        *a6 = v21;
        if (v21 >= v20)
        {
          BOOL v15 = 0;
          goto LABEL_95;
        }

        continue;
      }
    }

    break;
  }

LABEL_89:
  ++*a6;
  BOOL v15 = 1;
  uint64_t v19 = v65;
LABEL_95:
  BOOL result = !v15;
  v19[(void)v69] = 0;
  *a4 = (size_t)(v19 + 1);
  return result;
}

uint64_t sub_1000329FC(uint64_t a1, unint64_t a2, char *__str, size_t *a4)
{
  int v4 = a4;
  unint64_t v8 = *a4;
  unsigned int v9 = snprintf( __str,  *a4,  "Key: \n T   - Timestamp\n E   - Erased bands during this time interval\n HR  - Host Reads (in 4k sectors)\n HW  - Host Writes (in 4k sectors)\n NR  - Nand Reads (in 4k sectors)\n NW  - Nand Writes (in 4k sectors)\n TH  - Time in Hysteresis in this time interval (in ms)\n GC  - Number of sectors (4k bytes) completed GC in this time interval\n W   - Number of wear level bands completed in this time interval\n BI  - Bands Intermediate (SLC) PendingErase\n BU  - Bands User (MLC) PendingErase\n V   - Number of Free Nodes\n BF  - Buffer Fragments/BufferHighWater\n P   - Percent of time in DoPreempt rather than DoNormal\n H   - Qos Delays: Normal/Extreme\n X   - Successful expedite commands/Failed expedite commands\n L   - Age of the oldest command in ms (calculated every second)/Qos Interval (in 100us units)\n C   - Command tags in use by host (Min/Max)S   - Number of free segs\n U   - Sectors of host unmaps\n RO  - Num read ops for this time interval: priority0/priority1/...\n RL  - Total Read Latency (in us) for this time interval: priority0/priority1/...\n RM  - Max Read Latency (int us) for this time interval: priority0/priority1/...\n WO  - Num write ops for this time interval: priority0/priority1/...\n WL  - Total write latency (in us) for this time interval: priority0/priority1/...\n WM  - Max write latency (in us) for this time interval: priority0/priority1/...\n \n");
  if (v8 > v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = &__str[v9];
    size_t v12 = v8 - v10;
    if ((a2 / 0xF8))
    {
      uint64_t v80 = (a2 / 0xF8);
      id v81 = v4;
      uint64_t v13 = 0LL;
      uint64_t v14 = a1 + 68;
      uint64_t v84 = a1 + 76;
      uint64_t v85 = a1 + 72;
      uint64_t v88 = a1;
      uint64_t v82 = a1;
LABEL_4:
      uint64_t v83 = v13;
      BOOL v15 = (int *)(a1 + 248 * v13);
      int v87 = v15[26];
      int v16 = v15[28];
      int v86 = v15[27];
      unsigned int v17 = v15[38];
      int v18 = v15[39];
      int v19 = v15[29];
      int v20 = v15[30];
      int v21 = v15[31];
      int v22 = v15[32];
      int v24 = v15[35];
      int v23 = v15[36];
      int v26 = v15[43];
      int v25 = v15[44];
      int v27 = v15[46];
      int v28 = v15[47];
      int v29 = *v15;
      int v30 = v15[1];
      int v31 = v15[49];
      int v32 = v15[50];
      int v34 = v15[41];
      int v33 = v15[42];
      int v36 = v15[52];
      int v35 = v15[53];
      int v37 = v15[40];
      int v38 = v15[51];
      int v40 = v15[14];
      id v39 = v15 + 14;
      int v79 = v34;
      int v41 = v11;
      unsigned int v42 = snprintf( v11,  v12,  "T=%04u E=%02u HR=%4u HW=%4u NR=%4u NW=%4u TH=%8u.%02u GC=%4u W=%2u BI=%3u BU=%3u V=%5u BF=%2u/%2u P=%2u H= %2u/%2u X=%2u/%2u L=%3u/%3u C=%2u/%2u S=%4u U=%8u RO=%4u",  v29,  v87,  v86,  v16,  v19,  v20,  v17 / 0x3E8,  v17 % 0x3E8 / 0xA,  v21,  v22,  v24,  v23,  v25,  v27,  v28,  v30,  v37,  v18,  v31,  v32,  v33,  v26,  v36,  v35,  v79,  v38,  v40);
      if (v12 > v42)
      {
        uint64_t v43 = 0LL;
        unsigned int v44 = &v41[v42];
        size_t v45 = v12 - v42;
        while (1)
        {
          unsigned int v46 = snprintf(v44, v45, "/%4u", *(_DWORD *)(v14 + v43));
          if (v45 <= v46) {
            break;
          }
          v43 += 12LL;
          v44 += v46;
          v45 -= v46;
          if (v43 == 36)
          {
            unsigned int v47 = snprintf(v44, v45, " RL=%7u", v39[1]);
            if (v45 > v47)
            {
              uint64_t v48 = 0LL;
              unsigned int v49 = &v44[v47];
              size_t v50 = v45 - v47;
              while (1)
              {
                unsigned int v51 = snprintf(v49, v50, "/%7u", *(_DWORD *)(v85 + v48));
                if (v50 <= v51) {
                  break;
                }
                v48 += 12LL;
                v49 += v51;
                v50 -= v51;
                if (v48 == 36)
                {
                  unsigned int v52 = snprintf(v49, v50, " RM=%5u", v39[2]);
                  if (v50 > v52)
                  {
                    uint64_t v53 = 0LL;
                    uint64_t v54 = &v49[v52];
                    size_t v55 = v50 - v52;
                    while (1)
                    {
                      unsigned int v56 = snprintf(v54, v55, "/%5u", *(_DWORD *)(v84 + v53));
                      if (v55 <= v56) {
                        break;
                      }
                      v53 += 12LL;
                      v54 += v56;
                      v55 -= v56;
                      if (v53 == 36)
                      {
                        uint64_t v57 = v82 + 248 * v83;
                        int v59 = *(_DWORD *)(v57 + 8);
                        uint64_t v58 = v57 + 8;
                        unsigned int v60 = snprintf(v54, v55, " WO=%4u", v59);
                        if (v55 > v60)
                        {
                          uint64_t v61 = &v54[v60];
                          size_t v62 = v55 - v60;
                          uint64_t v63 = 20LL;
                          while (1)
                          {
                            unsigned int v64 = snprintf(v61, v62, "/%4u", *(_DWORD *)(v88 + v63));
                            if (v62 <= v64) {
                              break;
                            }
                            v63 += 12LL;
                            v61 += v64;
                            v62 -= v64;
                            if (v63 == 56)
                            {
                              unsigned int v65 = snprintf(v61, v62, " WL=%7u", *(_DWORD *)(v58 + 4));
                              if (v62 > v65)
                              {
                                float v66 = &v61[v65];
                                size_t v67 = v62 - v65;
                                uint64_t v68 = 24LL;
                                while (1)
                                {
                                  unsigned int v69 = snprintf(v66, v67, "/%7u", *(_DWORD *)(v88 + v68));
                                  if (v67 <= v69) {
                                    break;
                                  }
                                  v68 += 12LL;
                                  v66 += v69;
                                  v67 -= v69;
                                  if (v68 == 60)
                                  {
                                    unsigned int v70 = snprintf(v66, v67, " WM=%5u", *(_DWORD *)(v58 + 8));
                                    if (v67 > v70)
                                    {
                                      __int16 v71 = &v66[v70];
                                      size_t v72 = v67 - v70;
                                      uint64_t v73 = 28LL;
                                      while (1)
                                      {
                                        unsigned int v74 = snprintf(v71, v72, "/%5u", *(_DWORD *)(v88 + v73));
                                        if (v72 <= v74) {
                                          break;
                                        }
                                        v73 += 12LL;
                                        v71 += v74;
                                        v72 -= v74;
                                        if (v73 == 64)
                                        {
                                          unsigned int v75 = snprintf(v71, v72, "\n");
                                          if (v72 <= v75) {
                                            return 0LL;
                                          }
                                          uint64_t v76 = v75;
                                          uint64_t v11 = &v71[v75];
                                          size_t v12 = v72 - v76;
                                          a1 = v82;
                                          uint64_t v13 = v83 + 1;
                                          v14 += 248LL;
                                          v84 += 248LL;
                                          v85 += 248LL;
                                          v88 += 248LL;
                                          int v4 = v81;
                                          if (v83 + 1 != v80) {
                                            goto LABEL_4;
                                          }
                                          goto LABEL_30;
                                        }
                                      }
                                    }

                                    return 0LL;
                                  }
                                }
                              }

                              return 0LL;
                            }
                          }
                        }

                        return 0LL;
                      }
                    }
                  }

                  return 0LL;
                }
              }
            }

            return 0LL;
          }
        }
      }
    }

    else
    {
LABEL_30:
      unsigned int v77 = snprintf(v11, v12, "\n");
      if (v77 < v12)
      {
        *v4 += v77 - v12;
        return 1LL;
      }
    }
  }

  return 0LL;
}

CFDictionaryRef ASP_GetIndirectionTableStatistics()
{
  int v16 = IND_POOL_KEY[0];
  uint64_t v12 = 0LL;
  id v0 = (const __CFDictionary *)sub_100033438(10, &v12);
  CFDictionaryRef v1 = v0;
  if (v0)
  {
    float v13 = 0.0;
    keys[0] = IND_POOL_SIZE_KEY[0];
    keys[1] = IND_POOL_FREE_KEY[0];
    keys[2] = IND_POOL_FULL_KEY;
    if ((v12 & 0xFFFFFFF8) != 0)
    {
      int v2 = 0;
      int v3 = 0;
      unint64_t v4 = 0LL;
      unint64_t v5 = 0LL;
      unsigned int v6 = v0;
      do
      {
        unint64_t v9 = *(void *)v6;
        int v7 = (unint64_t *)((char *)v6 + 8);
        unint64_t v8 = v9;
        if ((_DWORD)v9 == 12)
        {
          unint64_t v4 = *v7;
          int v3 = 1;
        }

        else if ((_DWORD)v8 == 13)
        {
          unint64_t v5 = *v7;
          int v2 = 1;
        }

        if ((v3 & v2 & 1) != 0) {
          break;
        }
        unsigned int v6 = (const __CFDictionary *)&v7[HIDWORD(v8)];
      }

      while (v6 < (char *v0 + (v12 & 0xFFFFFFF8)));
      unint64_t v14 = v4;
      unint64_t valuePtr = v5;
      if (v5) {
        float v13 = 1.0 - (float)((float)v4 / (float)v5);
      }
    }

    else
    {
      unint64_t v14 = 0LL;
      unint64_t valuePtr = 0LL;
    }

    values = CFNumberCreate(0LL, kCFNumberSInt64Type, &valuePtr);
    CFTypeRef cf = CFNumberCreate(0LL, kCFNumberSInt64Type, &v14);
    CFTypeRef v19 = CFNumberCreate(0LL, kCFNumberFloat32Type, &v13);
    CFDictionaryRef v10 = CFDictionaryCreate( 0LL,  (const void **)keys,  (const void **)&values,  3LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
    CFRelease(values);
    CFRelease(cf);
    CFRelease(v19);
    free(v1);
    keys[0] = v10;
    CFDictionaryRef v1 = CFDictionaryCreate( 0LL,  (const void **)&v16,  (const void **)keys,  1LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
    CFRelease(keys[0]);
  }

  return v1;
}

void *sub_1000330B8(char **a1, int a2, int a3, int a4, void *a5, char a6, char a7)
{
  float v13 = a1;
  int v21 = 0LL;
  *a5 = 0LL;
  if (!a1 && (!sub_1000334D0(&v21) || (float v13 = v21) == 0LL || !*((_DWORD *)v21 + 4)))
  {
    fwrite("Err: Finding internal NAND exporter failed for fetch tunnel buffer.\n", 0x44uLL, 1uLL, __stderrp);
LABEL_11:
    CFTypeRef v19 = 0LL;
    goto LABEL_14;
  }

  int v14 = a3;
  unsigned int v15 = sub_100033254((uint64_t)v13, a2, a3, a4, a7);
  if (!v15)
  {
    fprintf(__stderrp, "failed to get data size for cmd option %d\n", a2);
    goto LABEL_11;
  }

  uint64_t v16 = v15;
  size_t v17 = (vm_page_size + v15 - 1) / vm_page_size * vm_page_size;
  int v18 = valloc(v17);
  CFTypeRef v19 = v18;
  if (v18)
  {
    bzero(v18, v17);
    if ((sub_100033318((uint64_t)v13, a2, v14, a4, v19, v17, a6, a7) & 1) != 0)
    {
      *a5 = v16;
    }

    else
    {
      free(v19);
      CFTypeRef v19 = 0LL;
      *a5 = 0LL;
    }
  }

  else
  {
    fwrite("can't allocate buffer!\n", 0x17uLL, 1uLL, __stderrp);
  }

uint64_t sub_100033254(uint64_t a1, int a2, int a3, int a4, char a5)
{
  kern_return_t v7;
  uint64_t result;
  size_t outputStructCnt;
  unsigned int outputStruct;
  _DWORD inputStruct[3];
  uint64_t v12;
  int v13;
  float v13 = 0;
  uint64_t v12 = 0LL;
  outputStructCnt = 4LL;
  inputStruct[0] = a2;
  inputStruct[1] = a3 | 1;
  inputStruct[2] = a4;
  int v7 = IOConnectCallStructMethod( *(_DWORD *)(a1 + 16),  *(_DWORD *)(a1 + 28),  inputStruct,  0x18uLL,  &outputStruct,  &outputStructCnt);
  if (v7)
  {
    if ((a5 & 1) == 0) {
      fprintf(__stderrp, "Error calling CoreDebugTunnel method! - 0x%X\n", v7);
    }
    return 0LL;
  }

  else
  {
    BOOL result = outputStruct;
    if (!outputStruct && (a5 & 1) == 0)
    {
      fprintf(__stderrp, "SizeOnly for tunnel command 0x%x returned 0\n", a2);
      return outputStruct;
    }
  }

  return result;
}

uint64_t sub_100033318(uint64_t a1, int a2, int a3, int a4, void *outputStruct, size_t a6, char a7, char a8)
{
  kern_return_t v15;
  size_t v16;
  _DWORD inputStruct[3];
  uint64_t v19;
  int v20;
  size_t outputStructCnt;
  LOBYTE(v9) = a7;
  outputStructCnt = a6;
  int v20 = 0;
  CFTypeRef v19 = 0LL;
  while (1)
  {
    inputStruct[0] = a2;
    inputStruct[1] = a3;
    inputStruct[2] = a4;
    unsigned int v15 = IOConnectCallStructMethod( *(_DWORD *)(a1 + 16),  *(_DWORD *)(a1 + 28),  inputStruct,  0x18uLL,  outputStruct,  &outputStructCnt);
    if (v15 != -536870211) {
      break;
    }
    if ((v9 & 1) == 0) {
      goto LABEL_10;
    }
    if ((a8 & 1) == 0) {
      fprintf(__stderrp, "CoreDebugTunnel 0x%x returned kIOReturnNoMemory\n", a2);
    }
    uint64_t v16 = outputStructCnt;
    outputStructCnt = vm_page_size;
    uint64_t v9 = 1LL;
    if (vm_page_size == v16) {
      return v9;
    }
  }

  if (!v15) {
    return 1LL;
  }
LABEL_10:
  if ((a8 & 1) == 0) {
    fprintf(__stderrp, "Error calling CoreDebugTunnel method! - 0x%X\n", v15);
  }
  return 0LL;
}

void *sub_100033438(int a1, void *a2)
{
  return sub_1000330B8(0LL, a1, 0, 0, a2, 0, 0);
}

void *sub_100033458()
{
  return &unk_10007BD10;
}

void *sub_100033464()
{
  return &unk_10007BD18;
}

void *sub_100033470()
{
  return &unk_10007BD20;
}

void *sub_10003347C()
{
  return &unk_10007BD30;
}

void *sub_100033488()
{
  return &unk_10007BD38;
}

void *sub_100033494()
{
  return &unk_10007BD40;
}

void *sub_1000334A0()
{
  return &unk_10007BD48;
}

void *sub_1000334AC()
{
  return &unk_10007BD50;
}

void *sub_1000334B8()
{
  return &unk_10007BD28;
}

void *sub_1000334C4()
{
  return &unk_10007BD58;
}

char *sub_1000334D0(char ***a1)
{
  io_connect_t connect = 0;
  *a1 = 0LL;
  int v2 = pthread_mutex_trylock(&stru_10007BD60);
  if (v2)
  {
    if (v2 != 16
      || (syslog(4, "Warning: NANDInfo: NANDExporter: serializeAccess already locked. waiting for lock !\n"),
          pthread_mutex_lock(&stru_10007BD60)))
    {
      int v3 = __error();
      syslog(3, "Error: NANDInfo: NANDExporter: pthread_mutex_trylock() (%d) failed \n", *v3);
      return 0LL;
    }
  }

  syslog(5, "NANDInfo: NANDExporter object locked ! \n");
  unint64_t v5 = &off_10007BDA0;
  BOOL result = off_10007BDA0;
  if (!off_10007BDA0)
  {
LABEL_11:
    io_object_t v8 = 0;
    goto LABEL_12;
  }

  while (1)
  {
    unsigned int v6 = IOServiceMatching(result);
    if (!v6) {
      goto LABEL_10;
    }
    io_service_t MatchingService = IOServiceGetMatchingService(kIOMainPortDefault, v6);
    if (!MatchingService) {
      goto LABEL_10;
    }
    io_object_t v8 = MatchingService;
    if (!IOServiceOpen(MatchingService, mach_task_self_, 0, &connect)) {
      break;
    }
    IOServiceClose(connect);
    io_connect_t connect = 0;
    IOObjectRelease(v8);
LABEL_10:
    uint64_t v9 = v5[21];
    v5 += 21;
    BOOL result = (char *)v9;
    if (!v9) {
      goto LABEL_11;
    }
  }

  syslog(5, "NANDInfo: findNandExporter_tunnel: Controller found: %s\n", *v5);
  BOOL result = (char *)1;
LABEL_12:
  *((_DWORD *)v5 + 4) = connect;
  *((_DWORD *)v5 + 5) = v8;
  *a1 = v5;
  return result;
}

uint64_t sub_100033618(uint64_t a1)
{
  io_connect_t v2 = *(_DWORD *)(a1 + 16);
  if (v2)
  {
    IOServiceClose(v2);
    *(_DWORD *)(a1 + 16) = 0;
  }

  io_object_t v3 = *(_DWORD *)(a1 + 20);
  if (v3)
  {
    IOObjectRelease(v3);
    *(_DWORD *)(a1 + 20) = 0;
  }

  syslog(5, "NANDInfo: NANDExporter object unlocked ! \n");
  return pthread_mutex_unlock(&stru_10007BD60);
}

uint64_t nand_get_snapshot(uint64_t a1, char *a2, size_t a3, size_t *a4)
{
  uint64_t v13 = 0LL;
  *(void *)int v14 = 0LL;
  size_t v12 = a3;
  int v7 = sub_100033438(145, &v13);
  io_object_t v8 = sub_100033438(22, v14);
  if (!v8) {
    return 5LL;
  }
  uint64_t v9 = v8;
  if (v7 && v7[1] >= 6u)
  {
    unsigned int v15 = 0;
    else {
      uint64_t v10 = 52LL;
    }
    *a4 = v12;
    free(v9);
    goto LABEL_14;
  }

  *a4 = a3;
  else {
    uint64_t v10 = 3LL;
  }
  free(v9);
  if (v7) {
LABEL_14:
  }
    free(v7);
  return v10;
}

void sub_100033768(uint64_t a1, os_log_s *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_DEBUG,  "No parent record for %@",  (uint8_t *)&v2,  0xCu);
}

void sub_1000337DC(uint64_t a1, os_log_s *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_fault_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_FAULT,  "HangTracer: pathForPid was found invalid UTF8 string, trying ascii encoding = %@",  (uint8_t *)&v2,  0xCu);
}

void sub_100033850()
{
  __int16 v3 = 2080;
  uint64_t v4 = v0;
  sub_10000E6C4((void *)&_mh_execute_header, v1, (uint64_t)v1, "unable to write to compressed file %s, error: %s", v2);
  sub_10000E5BC();
}

void sub_1000338C4()
{
}

void sub_1000338F0()
{
}

void sub_10003391C()
{
  __assert_rtn("postNotificationForSentryTailspin", "hangreporter.m", 1972, "refNumber != nil");
}

void sub_100033944()
{
  __assert_rtn("postNotificationForSentryTailspin", "hangreporter.m", 1973, "newPath != nil");
}

void sub_10003396C()
{
}

void sub_100033998()
{
}

void sub_1000339C4()
{
}

void sub_1000339F0()
{
}

void sub_100033A50()
{
}

void sub_100033A78(unint64_t a1, os_log_s *a2, double a3)
{
  uint8_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](&OBJC_CLASS___HTPrefs, "sharedPrefs"));
  id v7 = [v6 runloopHangTimeoutDurationMSec];
  io_object_t v8 = sub_100002B10(a1);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  int v10 = 134218498;
  double v11 = a3;
  __int16 v12 = 2048;
  id v13 = v7;
  __int16 v14 = 2112;
  unsigned int v15 = v9;
  _os_log_debug_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_DEBUG,  "Should capture heavy log due to hang duration of %.4f (pref is %llu), type %@",  (uint8_t *)&v10,  0x20u);
}

void sub_100033B64()
{
}

void sub_100033B90()
{
}

void sub_100033BF0(uint64_t a1, void *a2, os_log_s *a3)
{
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([a2 debugDescription]);
  int v7 = 138412546;
  uint64_t v8 = a1;
  __int16 v9 = 2112;
  int v10 = v5;
  sub_10000E6C4( (void *)&_mh_execute_header,  a3,  v6,  "Post Processing %@: No hang in info dict array %@",  (uint8_t *)&v7);

  sub_10000E6BC();
}

void sub_100033C98(int a1, os_log_s *a2)
{
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_debug_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_DEBUG,  "No fence hangs to update (%d previously attempted)",  (uint8_t *)v2,  8u);
  sub_10000E638();
}

void sub_100033D08(int a1, os_log_s *a2)
{
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_fault_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_FAULT,  "Update to create ktrace session to update %d fence hangs",  (uint8_t *)v2,  8u);
  sub_10000E638();
}

void sub_100033D78(int a1, os_log_s *a2)
{
  int v2 = 134218240;
  uint64_t v3 = 100LL;
  __int16 v4 = 1024;
  int v5 = a1;
  _os_log_fault_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_FAULT,  "Timed out (%lld) parsing trace buffer to update %d fence hangs",  (uint8_t *)&v2,  0x12u);
  sub_10000E5BC();
}

void sub_100033DF8()
{
}

void sub_100033E58()
{
}

void sub_100033EB8()
{
}

void sub_100033F18()
{
}

void sub_100033F78()
{
}

void sub_100033FD8()
{
}

void sub_100034048()
{
}

void sub_1000340A8()
{
  sub_10000E640( (void *)&_mh_execute_header,  v0,  v1,  "Fence_End, fence=%llu, pid=%d, tid=%llu, time=%llu",  v2,  v3,  v4,  v5,  v6);
  sub_10000E6D0();
}

void sub_100034108()
{
  sub_10000E640( (void *)&_mh_execute_header,  v0,  v1,  "Fence_Start, fence=%llu, pid=%d, tid=%llu, time=%llu",  v2,  v3,  v4,  v5,  v6);
  sub_10000E6D0();
}

void sub_100034168()
{
  sub_10000E640( (void *)&_mh_execute_header,  v0,  v1,  "Fence_TimedOut, fence=%llu, pid=%d, tid=%llu, time=%llu",  v2,  v3,  v4,  v5,  v6);
  sub_10000E6D0();
}

void sub_1000341C8()
{
  sub_10000E670( (void *)&_mh_execute_header,  v0,  v1,  "Handle_End, fence=%llu, handle=%llu, pid=%d, foundpid=%d, tid=%llu, time=%llu",  v2,  v3,  v4,  v5,  v6,  v7);
  sub_10000E6BC();
}

void sub_100034228()
{
  sub_10000E670( (void *)&_mh_execute_header,  v0,  v1,  "Handle_Start, fence=%llu, handle=%llu, pid=%d, foundpid=%d, tid=%llu, time=%llu",  v2,  v3,  v4,  v5,  v6,  v7);
  sub_10000E6BC();
}

void sub_100034288(uint64_t a1, uint64_t a2, os_log_s *a3)
{
  LODWORD(sub_10000E5A8( (void *)&_mh_execute_header,  v0,  v1,  "Update to set file for ktrace session to update %d fence hangs: %d",  v2, v3) = 134218240;
  HIDWORD(sub_10000E5A8( (void *)&_mh_execute_header,  v0,  v1,  "Update to set file for ktrace session to update %d fence hangs: %d",  v2, v3) = a2;
  sub_10000E65C( (void *)&_mh_execute_header,  a2,  a3,  "Null pid in ktrace data: checked cache and found threadid %llu is from pid %i",  v3,  HIDWORD(a2));
  sub_10000E5BC();
}

void sub_100034300()
{
  sub_10000E600((void *)&_mh_execute_header, v0, v1, "UpdateInfoForFenceHangs checking fence=%lli", v2, v3, v4, v5, v6);
  sub_10000E5BC();
}

void sub_100034360(void *a1, uint64_t a2, os_log_s *a3)
{
  LODWORD(sub_10000E5A8( (void *)&_mh_execute_header,  v0,  v1,  "Update to set file for ktrace session to update %d fence hangs: %d",  v2, v3) = 134218240;
  *(void *)((char *)&v3 + 4) = *a1;
  sub_10000E65C( (void *)&_mh_execute_header,  a2,  a3,  "Null pid in ktrace data: iterated SA threads found threadid %llu is from pid %i",  (void)v3,  HIDWORD(*a1));
  sub_10000E5BC();
}

void sub_1000343E0(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_DEBUG,  "No valid startState — first known display state change event must be after hang start. Defaulting to the first displ ay state change entry.",  v1,  2u);
}

void sub_100034420()
{
}

void sub_100034488()
{
}

void sub_1000344F0()
{
  __assert_rtn("startHangReporterService", "HangReporterService.m", 211, "listener == nil");
}

void sub_100034518( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10003457C( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000345E0( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100034644(uint64_t a1, os_log_s *a2)
{
  int v4 = *__error();
  int v5 = 138412546;
  uint64_t v6 = a1;
  __int16 v7 = 1024;
  int v8 = v4;
  _os_log_fault_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_FAULT,  "Could not open tailspin file %@ for finding timeout hang end time: %d",  (uint8_t *)&v5,  0x12u);
}

void sub_1000346E0()
{
}

void sub_100034740()
{
}

void sub_1000347A0()
{
}

void sub_100034800()
{
}

void sub_100034860(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_debug_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_DEBUG,  "HTPrefs: %@ was not found in the %@ domain, a profile, by EPL, by PowerLog Tasking domain, by HT Self Enablement or by HT Sentry Enablement",  (uint8_t *)&v3,  0x16u);
}

void sub_1000348E4(uint64_t a1, void *a2, os_log_s *a3)
{
  *(_DWORD *)int v3 = 138412802;
  *(void *)&void v3[4] = @"enablementPrefix";
  *(_WORD *)&v3[12] = 2112;
  *(void *)&v3[14] = a1;
  *(_WORD *)&v3[22] = 2112;
  sub_100018F28( (void *)&_mh_execute_header,  (uint64_t)a2,  a3,  "HTPrefs: %@: %@ -> %@",  *(void *)v3,  *(void *)&v3[8],  *(void *)&v3[16],  *a2);
  sub_10000E6D0();
}

void sub_100034968()
{
}

void sub_1000349FC()
{
}

void sub_100034A90()
{
}

void sub_100034B24()
{
}

void sub_100034BB8(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "Preparing prefInitList", v1, 2u);
}

void sub_100034BF8()
{
  __assert_rtn("-[HTPrefs setupPrefsWithQueue:]", "HTPrefs.m", 1486, "prefsQueue != NULL");
}

id objc_msgSend_JSONObjectWithData_options_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "JSONObjectWithData:options:error:");
}

id objc_msgSend_URL(void *a1, const char *a2, ...)
{
  return _[a1 URL];
}

id objc_msgSend_URLWithString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "URLWithString:");
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return _[a1 UTF8String];
}

id objc_msgSend_UUID(void *a1, const char *a2, ...)
{
  return _[a1 UUID];
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return _[a1 UUIDString];
}

id objc_msgSend___createInternalSettings(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "__createInternalSettings");
}

id objc_msgSend_addEntriesFromDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addEntriesFromDictionary:");
}

id objc_msgSend_addIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addIndex:");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObject:");
}

id objc_msgSend_addObjectsFromArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObjectsFromArray:");
}

id objc_msgSend_addSubsystem_category_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addSubsystem:category:");
}

id objc_msgSend_allBlockingThreadsArray(void *a1, const char *a2, ...)
{
  return _[a1 allBlockingThreadsArray];
}

id objc_msgSend_allocWithZone_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "allocWithZone:");
}

id objc_msgSend_anyClientsAvailable(void *a1, const char *a2, ...)
{
  return _[a1 anyClientsAvailable];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return _[a1 array];
}

id objc_msgSend_arrayWithObjects_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithObjects:");
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_attributesOfItemAtPath_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "attributesOfItemAtPath:error:");
}

id objc_msgSend_beginDate(void *a1, const char *a2, ...)
{
  return _[a1 beginDate];
}

id objc_msgSend_beginEvent(void *a1, const char *a2, ...)
{
  return _[a1 beginEvent];
}

id objc_msgSend_beginWallTimeStringWithTimeZoneName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "beginWallTimeStringWithTimeZoneName:");
}

id objc_msgSend_blockingPid(void *a1, const char *a2, ...)
{
  return _[a1 blockingPid];
}

id objc_msgSend_blockingThreadInfo(void *a1, const char *a2, ...)
{
  return _[a1 blockingThreadInfo];
}

id objc_msgSend_blockingTid(void *a1, const char *a2, ...)
{
  return _[a1 blockingTid];
}

id objc_msgSend_BOOLProperty_contextPrefixOut_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "BOOLProperty:contextPrefixOut:");
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return _[a1 BOOLValue];
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 bundleIdentifier];
}

id objc_msgSend_cStringUsingEncoding_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cStringUsingEncoding:");
}

id objc_msgSend_capitalizedString(void *a1, const char *a2, ...)
{
  return _[a1 capitalizedString];
}

id objc_msgSend_characterAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "characterAtIndex:");
}

id objc_msgSend_closeFile(void *a1, const char *a2, ...)
{
  return _[a1 closeFile];
}

id objc_msgSend_compare_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "compare:");
}

id objc_msgSend_containingBundleRecord(void *a1, const char *a2, ...)
{
  return _[a1 containingBundleRecord];
}

id objc_msgSend_containsObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "containsObject:");
}

id objc_msgSend_containsString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "containsString:");
}

id objc_msgSend_contentsOfDirectoryAtPath_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "contentsOfDirectoryAtPath:error:");
}

id objc_msgSend_contentsOfDirectoryAtURL_includingPropertiesForKeys_options_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:");
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return _[a1 copy];
}

id objc_msgSend_copyItemAtPath_toPath_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "copyItemAtPath:toPath:error:");
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return _[a1 count];
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_cpuTimeNs(void *a1, const char *a2, ...)
{
  return _[a1 cpuTimeNs];
}

id objc_msgSend_createDirectoryAtPath_withIntermediateDirectories_attributes_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:");
}

id objc_msgSend_cumulativeTime(void *a1, const char *a2, ...)
{
  return _[a1 cumulativeTime];
}

id objc_msgSend_dataUsingEncoding_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataUsingEncoding:");
}

id objc_msgSend_dataWithJSONObject_options_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataWithJSONObject:options:error:");
}

id objc_msgSend_dateFormatter(void *a1, const char *a2, ...)
{
  return _[a1 dateFormatter];
}

id objc_msgSend_dateWithTimeInterval_sinceDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dateWithTimeInterval:sinceDate:");
}

id objc_msgSend_dateWithTimeIntervalSinceReferenceDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dateWithTimeIntervalSinceReferenceDate:");
}

id objc_msgSend_debugDescription(void *a1, const char *a2, ...)
{
  return _[a1 debugDescription];
}

id objc_msgSend_decodeInt64ForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "decodeInt64ForKey:");
}

id objc_msgSend_decodeIntForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "decodeIntForKey:");
}

id objc_msgSend_decodeObjectOfClass_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "decodeObjectOfClass:forKey:");
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return _[a1 defaultCenter];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return _[a1 defaultManager];
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return _[a1 description];
}

id objc_msgSend_developerType(void *a1, const char *a2, ...)
{
  return _[a1 developerType];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return _[a1 dictionary];
}

id objc_msgSend_dictionaryWithContentsOfFile_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithContentsOfFile:");
}

id objc_msgSend_dictionaryWithObject_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithObject:forKey:");
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_dictionaryWithObjectsAndKeys_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithObjectsAndKeys:");
}

id objc_msgSend_displayEventStatesFromDisplayInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "displayEventStatesFromDisplayInfo:");
}

id objc_msgSend_displayEventTimestampsFromDisplayInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "displayEventTimestampsFromDisplayInfo:");
}

id objc_msgSend_displayInfoForSpindump_startAbsoluteTime_endAbsoluteTime_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "displayInfoForSpindump:startAbsoluteTime:endAbsoluteTime:");
}

id objc_msgSend_displayOnIntervalsForDisplayTimestamps_displayStates_startTimestamp_endTimestamp_startState_endState_( void *a1, const char *a2, ...)
{
  return _objc_msgSend( a1,  "displayOnIntervalsForDisplayTimestamps:displayStates:startTimestamp:endTimestamp:startState:endState:");
}

id objc_msgSend_displayStateBeforeHangStartTimestamp_displayTimestamps_displayStates_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "displayStateBeforeHangStartTimestamp:displayTimestamps:displayStates:");
}

id objc_msgSend_displayStateBeforeOrAtTime_timestamps_states_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "displayStateBeforeOrAtTime:timestamps:states:");
}

id objc_msgSend_distantFuture(void *a1, const char *a2, ...)
{
  return _[a1 distantFuture];
}

id objc_msgSend_distributorID(void *a1, const char *a2, ...)
{
  return _[a1 distributorID];
}

id objc_msgSend_distributorInfo(void *a1, const char *a2, ...)
{
  return _[a1 distributorInfo];
}

id objc_msgSend_doubleProperty_contextPrefixOut_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "doubleProperty:contextPrefixOut:");
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return _[a1 doubleValue];
}

id objc_msgSend_durationSeconds(void *a1, const char *a2, ...)
{
  return _[a1 durationSeconds];
}

id objc_msgSend_earlierDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "earlierDate:");
}

id objc_msgSend_earlyInitNecessaryPrefs(void *a1, const char *a2, ...)
{
  return _[a1 earlyInitNecessaryPrefs];
}

id objc_msgSend_enablementPrefix(void *a1, const char *a2, ...)
{
  return _[a1 enablementPrefix];
}

id objc_msgSend_encodeInt64_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "encodeInt64:forKey:");
}

id objc_msgSend_encodeInt_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "encodeInt:forKey:");
}

id objc_msgSend_encodeObject_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "encodeObject:forKey:");
}

id objc_msgSend_endSampleIndex(void *a1, const char *a2, ...)
{
  return _[a1 endSampleIndex];
}

id objc_msgSend_endThreadTime(void *a1, const char *a2, ...)
{
  return _[a1 endThreadTime];
}

id objc_msgSend_endTime(void *a1, const char *a2, ...)
{
  return _[a1 endTime];
}

id objc_msgSend_endTimestamp(void *a1, const char *a2, ...)
{
  return _[a1 endTimestamp];
}

id objc_msgSend_entitlements(void *a1, const char *a2, ...)
{
  return _[a1 entitlements];
}

id objc_msgSend_enumerateObjectsWithOptions_usingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumerateObjectsWithOptions:usingBlock:");
}

id objc_msgSend_enumerateTasks_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumerateTasks:");
}

id objc_msgSend_enumeratorAtURL_includingPropertiesForKeys_options_errorHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:");
}

id objc_msgSend_eplEnabled(void *a1, const char *a2, ...)
{
  return _[a1 eplEnabled];
}

id objc_msgSend_errorWithDomain_code_userInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "errorWithDomain:code:userInfo:");
}

id objc_msgSend_exitReasonCode(void *a1, const char *a2, ...)
{
  return _[a1 exitReasonCode];
}

id objc_msgSend_exitReasonNamespace(void *a1, const char *a2, ...)
{
  return _[a1 exitReasonNamespace];
}

id objc_msgSend_exitTimestamp(void *a1, const char *a2, ...)
{
  return _[a1 exitTimestamp];
}

id objc_msgSend_fenceResolutionTime(void *a1, const char *a2, ...)
{
  return _[a1 fenceResolutionTime];
}

id objc_msgSend_fenceStartTime(void *a1, const char *a2, ...)
{
  return _[a1 fenceStartTime];
}

id objc_msgSend_fetchProcessRecords(void *a1, const char *a2, ...)
{
  return _[a1 fetchProcessRecords];
}

id objc_msgSend_fileDescriptor(void *a1, const char *a2, ...)
{
  return _[a1 fileDescriptor];
}

id objc_msgSend_fileExistsAtPath_isDirectory_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fileExistsAtPath:isDirectory:");
}

id objc_msgSend_fileHandleForReadingAtPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fileHandleForReadingAtPath:");
}

id objc_msgSend_fileSize(void *a1, const char *a2, ...)
{
  return _[a1 fileSize];
}

id objc_msgSend_fileURLWithPath_isDirectory_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fileURLWithPath:isDirectory:");
}

id objc_msgSend_filterToMachAbsTimeRangeStart_end_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "filterToMachAbsTimeRangeStart:end:");
}

id objc_msgSend_findBlockingThreadForTailspin_sampleStore_mainThread_hangStartTime_hangEndTime_hangDuration_( void *a1, const char *a2, ...)
{
  return _objc_msgSend( a1,  "findBlockingThreadForTailspin:sampleStore:mainThread:hangStartTime:hangEndTime:hangDuration:");
}

id objc_msgSend_findBlockingThreadFromSampleStore_mainThread_hangStartTime_hangEndTime_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "findBlockingThreadFromSampleStore:mainThread:hangStartTime:hangEndTime:");
}

id objc_msgSend_firstThreadStateOnOrAfterTime_sampleIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "firstThreadStateOnOrAfterTime:sampleIndex:");
}

id objc_msgSend_ge_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ge:");
}

id objc_msgSend_getDescription_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getDescription:");
}

id objc_msgSend_getProcessExitsAndLaunchesDuringHang_endTime_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getProcessExitsAndLaunchesDuringHang:endTime:");
}

id objc_msgSend_getResourceValue_forKey_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getResourceValue:forKey:error:");
}

id objc_msgSend_guessMissingTimesBasedOnTimestamp_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "guessMissingTimesBasedOnTimestamp:");
}

id objc_msgSend_handleEndTime(void *a1, const char *a2, ...)
{
  return _[a1 handleEndTime];
}

id objc_msgSend_handleStartTime(void *a1, const char *a2, ...)
{
  return _[a1 handleStartTime];
}

id objc_msgSend_hangtracerDaemonEnabled(void *a1, const char *a2, ...)
{
  return _[a1 hangtracerDaemonEnabled];
}

id objc_msgSend_hardwareModel(void *a1, const char *a2, ...)
{
  return _[a1 hardwareModel];
}

id objc_msgSend_hasPrefix_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasPrefix:");
}

id objc_msgSend_hasSuffix_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasSuffix:");
}

id objc_msgSend_hidEventTimestamp(void *a1, const char *a2, ...)
{
  return _[a1 hidEventTimestamp];
}

id objc_msgSend_hidEvents(void *a1, const char *a2, ...)
{
  return _[a1 hidEvents];
}

id objc_msgSend_hudEnabled(void *a1, const char *a2, ...)
{
  return _[a1 hudEnabled];
}

id objc_msgSend_iTunesMetadata(void *a1, const char *a2, ...)
{
  return _[a1 iTunesMetadata];
}

id objc_msgSend_inInterrupt(void *a1, const char *a2, ...)
{
  return _[a1 inInterrupt];
}

id objc_msgSend_incidentUUID(void *a1, const char *a2, ...)
{
  return _[a1 incidentUUID];
}

id objc_msgSend_indexOfFirstSampleOnOrAfterTimestamp_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "indexOfFirstSampleOnOrAfterTimestamp:");
}

id objc_msgSend_indexOfLastSampleOnOrBeforeTimestamp_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "indexOfLastSampleOnOrBeforeTimestamp:");
}

id objc_msgSend_indexOfObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "indexOfObject:");
}

id objc_msgSend_indexSet(void *a1, const char *a2, ...)
{
  return _[a1 indexSet];
}

id objc_msgSend_init(void *a1, const char *a2, ...)
{
  return _[a1 init];
}

id objc_msgSend_initForFileParsing(void *a1, const char *a2, ...)
{
  return _[a1 initForFileParsing];
}

id objc_msgSend_initWithArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithArray:");
}

id objc_msgSend_initWithBytesNoCopy_length_freeWhenDone_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithBytesNoCopy:length:freeWhenDone:");
}

id objc_msgSend_initWithFenceName_traceStart_traceEnd_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithFenceName:traceStart:traceEnd:");
}

id objc_msgSend_initWithHandleName_fenceName_traceStart_traceEnd_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithHandleName:fenceName:traceStart:traceEnd:");
}

id objc_msgSend_initWithInfo_pid_spawnTimestamp_exitTimestamp_exitReasonCode_exitReasonNamespace_jetsam_priority_( void *a1, const char *a2, ...)
{
  return _objc_msgSend( a1,  "initWithInfo:pid:spawnTimestamp:exitTimestamp:exitReasonCode:exitReasonNamespace:jetsam_priority:");
}

id objc_msgSend_initWithMadeRunnableByThreadID_atTime_inInterrupt_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithMadeRunnableByThreadID:atTime:inInterrupt:");
}

id objc_msgSend_initWithSampleStore_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithSampleStore:");
}

id objc_msgSend_initWithSize_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithSize:");
}

id objc_msgSend_initWithType_andTimestamp_andName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithType:andTimestamp:andName:");
}

id objc_msgSend_initWithURL_allowPlaceholder_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithURL:allowPlaceholder:error:");
}

id objc_msgSend_initWithURL_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithURL:error:");
}

id objc_msgSend_initWithUUIDString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithUUIDString:");
}

id objc_msgSend_insert_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "insert:");
}

id objc_msgSend_insertObject_atIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "insertObject:atIndex:");
}

id objc_msgSend_intProperty_contextPrefixOut_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "intProperty:contextPrefixOut:");
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return _[a1 intValue];
}

id objc_msgSend_isEqual_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqual:");
}

id objc_msgSend_isEqualToArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToArray:");
}

id objc_msgSend_isEqualToNumber_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToNumber:");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_isInternal(void *a1, const char *a2, ...)
{
  return _[a1 isInternal];
}

id objc_msgSend_jetsam_priority(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "jetsam_priority");
}

id objc_msgSend_keysSortedByValueUsingComparator_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "keysSortedByValueUsingComparator:");
}

id objc_msgSend_lastObject(void *a1, const char *a2, ...)
{
  return _[a1 lastObject];
}

id objc_msgSend_lastPathComponent(void *a1, const char *a2, ...)
{
  return _[a1 lastPathComponent];
}

id objc_msgSend_lastThreadStateOnOrBeforeTime_sampleIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lastThreadStateOnOrBeforeTime:sampleIndex:");
}

id objc_msgSend_le_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "le:");
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return _[a1 length];
}

id objc_msgSend_lengthOfBytesUsingEncoding_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lengthOfBytesUsingEncoding:");
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return _[a1 localizedDescription];
}

id objc_msgSend_longLongValue(void *a1, const char *a2, ...)
{
  return _[a1 longLongValue];
}

id objc_msgSend_machAbsTime(void *a1, const char *a2, ...)
{
  return _[a1 machAbsTime];
}

id objc_msgSend_madeRunnableByThreadId(void *a1, const char *a2, ...)
{
  return _[a1 madeRunnableByThreadId];
}

id objc_msgSend_mainBinaryPath(void *a1, const char *a2, ...)
{
  return _[a1 mainBinaryPath];
}

id objc_msgSend_mainThread(void *a1, const char *a2, ...)
{
  return _[a1 mainThread];
}

id objc_msgSend_maxBlockingTime(void *a1, const char *a2, ...)
{
  return _[a1 maxBlockingTime];
}

id objc_msgSend_moveItemAtPath_toPath_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "moveItemAtPath:toPath:error:");
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return _[a1 mutableCopy];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return _[a1 name];
}

id objc_msgSend_now(void *a1, const char *a2, ...)
{
  return _[a1 now];
}

id objc_msgSend_null(void *a1, const char *a2, ...)
{
  return _[a1 null];
}

id objc_msgSend_numberWithBool_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithBool:");
}

id objc_msgSend_numberWithDouble_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithDouble:");
}

id objc_msgSend_numberWithFloat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithFloat:");
}

id objc_msgSend_numberWithInt_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithInt:");
}

id objc_msgSend_numberWithInteger_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithInteger:");
}

id objc_msgSend_numberWithLongLong_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithLongLong:");
}

id objc_msgSend_numberWithUnsignedInt_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithUnsignedInt:");
}

id objc_msgSend_numberWithUnsignedLong_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithUnsignedLong:");
}

id objc_msgSend_numberWithUnsignedLongLong_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithUnsignedLongLong:");
}

id objc_msgSend_numberWithUnsignedShort_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithUnsignedShort:");
}

id objc_msgSend_objectAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectAtIndex:");
}

id objc_msgSend_objectAtIndexedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectAtIndexedSubscript:");
}

id objc_msgSend_objectForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKey:");
}

id objc_msgSend_objectForKey_ofClass_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKey:ofClass:");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_objectProperty_matchingSelector_contextPrefixOut_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectProperty:matchingSelector:contextPrefixOut:");
}

id objc_msgSend_options(void *a1, const char *a2, ...)
{
  return _[a1 options];
}

id objc_msgSend_parseKTraceFile_warningsOut_errorOut_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "parseKTraceFile:warningsOut:errorOut:");
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return _[a1 path];
}

id objc_msgSend_pathExtension(void *a1, const char *a2, ...)
{
  return _[a1 pathExtension];
}

id objc_msgSend_pid(void *a1, const char *a2, ...)
{
  return _[a1 pid];
}

id objc_msgSend_postNotificationName_object_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "postNotificationName:object:");
}

id objc_msgSend_postNotificationName_object_userInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "postNotificationName:object:userInfo:");
}

id objc_msgSend_prefContextPrefixPriorityOrder(void *a1, const char *a2, ...)
{
  return _[a1 prefContextPrefixPriorityOrder];
}

id objc_msgSend_prefInitList(void *a1, const char *a2, ...)
{
  return _[a1 prefInitList];
}

id objc_msgSend_prefNamed_domain_profile_matchingSelector_contextPrefixOut_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "prefNamed:domain:profile:matchingSelector:contextPrefixOut:");
}

id objc_msgSend_preferredLanguages(void *a1, const char *a2, ...)
{
  return _[a1 preferredLanguages];
}

id objc_msgSend_printToMutableData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "printToMutableData:");
}

id objc_msgSend_printToStream_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "printToStream:");
}

id objc_msgSend_processID(void *a1, const char *a2, ...)
{
  return _[a1 processID];
}

id objc_msgSend_processLogArchiveWithPath_startDate_endDate_errorOut_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "processLogArchiveWithPath:startDate:endDate:errorOut:");
}

id objc_msgSend_processName(void *a1, const char *a2, ...)
{
  return _[a1 processName];
}

id objc_msgSend_propertyListWithData_options_format_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "propertyListWithData:options:format:error:");
}

id objc_msgSend_rangeOfString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rangeOfString:");
}

id objc_msgSend_rangeOfString_options_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rangeOfString:options:");
}

id objc_msgSend_readDataOfLength_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "readDataOfLength:");
}

id objc_msgSend_reason(void *a1, const char *a2, ...)
{
  return _[a1 reason];
}

id objc_msgSend_refreshHTPrefs(void *a1, const char *a2, ...)
{
  return _[a1 refreshHTPrefs];
}

id objc_msgSend_removeItemAtPath_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeItemAtPath:error:");
}

id objc_msgSend_removeItemAtURL_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeItemAtURL:error:");
}

id objc_msgSend_removeObjectAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObjectAtIndex:");
}

id objc_msgSend_removeObjectForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObjectForKey:");
}

id objc_msgSend_removeObjectsAtIndexes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObjectsAtIndexes:");
}

id objc_msgSend_resolution(void *a1, const char *a2, ...)
{
  return _[a1 resolution];
}

id objc_msgSend_reverseObjectEnumerator(void *a1, const char *a2, ...)
{
  return _[a1 reverseObjectEnumerator];
}

id objc_msgSend_runloopHangDurationThresholdMSec(void *a1, const char *a2, ...)
{
  return _[a1 runloopHangDurationThresholdMSec];
}

id objc_msgSend_runloopHangPercentHeavyLogs(void *a1, const char *a2, ...)
{
  return _[a1 runloopHangPercentHeavyLogs];
}

id objc_msgSend_runloopHangThirdPartyDurationThresholdMSec(void *a1, const char *a2, ...)
{
  return _[a1 runloopHangThirdPartyDurationThresholdMSec];
}

id objc_msgSend_runloopHangTimeoutDurationMSec(void *a1, const char *a2, ...)
{
  return _[a1 runloopHangTimeoutDurationMSec];
}

id objc_msgSend_runloopLongHangDurationThresholdMSec(void *a1, const char *a2, ...)
{
  return _[a1 runloopLongHangDurationThresholdMSec];
}

id objc_msgSend_sampleTimestamps(void *a1, const char *a2, ...)
{
  return _[a1 sampleTimestamps];
}

id objc_msgSend_savedTailspinMaxMB(void *a1, const char *a2, ...)
{
  return _[a1 savedTailspinMaxMB];
}

id objc_msgSend_sendDiagnosticReport_forType_forSourceID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendDiagnosticReport:forType:forSourceID:");
}

id objc_msgSend_setAllBlockingThreadsArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAllBlockingThreadsArray:");
}

id objc_msgSend_setAttributes_ofItemAtPath_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAttributes:ofItemAtPath:error:");
}

id objc_msgSend_setBlockingThreadInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBlockingThreadInfo:");
}

id objc_msgSend_setCumulativeTime_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCumulativeTime:");
}

id objc_msgSend_setDataGatheringOptions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDataGatheringOptions:");
}

id objc_msgSend_setDateFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDateFormat:");
}

id objc_msgSend_setDisplayKernelFrames_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDisplayKernelFrames:");
}

id objc_msgSend_setDisplayTrialInformation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDisplayTrialInformation:");
}

id objc_msgSend_setEndThreadTime_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEndThreadTime:");
}

id objc_msgSend_setEvent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEvent:");
}

id objc_msgSend_setEventTimeRange_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEventTimeRange:");
}

id objc_msgSend_setFenceEndTime_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFenceEndTime:");
}

id objc_msgSend_setFenceName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFenceName:");
}

id objc_msgSend_setFenceResolutionTime_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFenceResolutionTime:");
}

id objc_msgSend_setFenceStartTime_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFenceStartTime:");
}

id objc_msgSend_setForceOneBasedTimeIndexes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setForceOneBasedTimeIndexes:");
}

id objc_msgSend_setHandleBlown_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHandleBlown:");
}

id objc_msgSend_setHandleBlownTime_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHandleBlownTime:");
}

id objc_msgSend_setHandleEndTime_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHandleEndTime:");
}

id objc_msgSend_setHandleName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHandleName:");
}

id objc_msgSend_setHandleStartTime_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHandleStartTime:");
}

id objc_msgSend_setInInterrupt_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInInterrupt:");
}

id objc_msgSend_setIncidentUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIncidentUUID:");
}

id objc_msgSend_setIntervalCompletionProcessingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIntervalCompletionProcessingBlock:");
}

id objc_msgSend_setMadeRunnableByThreadId_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMadeRunnableByThreadId:");
}

id objc_msgSend_setMaxBlockingTime_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMaxBlockingTime:");
}

id objc_msgSend_setMemoryLoggingIntervalSec_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMemoryLoggingIntervalSec:");
}

id objc_msgSend_setName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setName:");
}

id objc_msgSend_setObject_atIndexedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObject:atIndexedSubscript:");
}

id objc_msgSend_setObject_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObject:forKey:");
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObject:forKeyedSubscript:");
}

id objc_msgSend_setPidsToPrint_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPidsToPrint:");
}

id objc_msgSend_setPrintHeavyStacks_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPrintHeavyStacks:");
}

id objc_msgSend_setPrintSpinSignatureStack_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPrintSpinSignatureStack:");
}

id objc_msgSend_setPrintTargetThreadOnly_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPrintTargetThreadOnly:");
}

id objc_msgSend_setReason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setReason:");
}

id objc_msgSend_setReportTimeThreshold_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setReportTimeThreshold:");
}

id objc_msgSend_setResolution_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setResolution:");
}

id objc_msgSend_setSanitizePaths_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSanitizePaths:");
}

id objc_msgSend_setShouldGatherKextStat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShouldGatherKextStat:");
}

id objc_msgSend_setShouldPostHTPrefsChangedNotification_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShouldPostHTPrefsChangedNotification:");
}

id objc_msgSend_setStartThreadTime_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setStartThreadTime:");
}

id objc_msgSend_setSubsystemCategoryFilter_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSubsystemCategoryFilter:");
}

id objc_msgSend_setTargetHIDEventMachAbs_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTargetHIDEventMachAbs:");
}

id objc_msgSend_setTargetProcessId_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTargetProcessId:");
}

id objc_msgSend_setTidsToPrint_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTidsToPrint:");
}

id objc_msgSend_setTimestamp_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTimestamp:");
}

id objc_msgSend_setTopBlockingPid_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTopBlockingPid:");
}

id objc_msgSend_setTransaction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTransaction:");
}

id objc_msgSend_setType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setType:");
}

id objc_msgSend_setWithArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWithArray:");
}

id objc_msgSend_setWithObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWithObject:");
}

id objc_msgSend_setupPrefsWithQueue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setupPrefsWithQueue:");
}

id objc_msgSend_setupPrefsWithQueue_profilePath_taskingDomainName_hangtracerDomain_setupInternalPrefs_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setupPrefsWithQueue:profilePath:taskingDomainName:hangtracerDomain:setupInternalPrefs:");
}

id objc_msgSend_sharedPrefs(void *a1, const char *a2, ...)
{
  return _[a1 sharedPrefs];
}

id objc_msgSend_shouldCollectOSSignpostsDeferred(void *a1, const char *a2, ...)
{
  return _[a1 shouldCollectOSSignpostsDeferred];
}

id objc_msgSend_shouldCompressSavedTailspins(void *a1, const char *a2, ...)
{
  return _[a1 shouldCompressSavedTailspins];
}

id objc_msgSend_shouldIncludeDiskInfo(void *a1, const char *a2, ...)
{
  return _[a1 shouldIncludeDiskInfo];
}

id objc_msgSend_shouldIncludeDisplayData(void *a1, const char *a2, ...)
{
  return _[a1 shouldIncludeDisplayData];
}

id objc_msgSend_shouldIncludeNetworkState(void *a1, const char *a2, ...)
{
  return _[a1 shouldIncludeNetworkState];
}

id objc_msgSend_shouldPostHTPrefsChangedNotification(void *a1, const char *a2, ...)
{
  return _[a1 shouldPostHTPrefsChangedNotification];
}

id objc_msgSend_shouldSaveTailspins(void *a1, const char *a2, ...)
{
  return _[a1 shouldSaveTailspins];
}

id objc_msgSend_shouldUploadToDiagPipe(void *a1, const char *a2, ...)
{
  return _[a1 shouldUploadToDiagPipe];
}

id objc_msgSend_sortedArrayUsingComparator_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sortedArrayUsingComparator:");
}

id objc_msgSend_spawnTimestamp(void *a1, const char *a2, ...)
{
  return _[a1 spawnTimestamp];
}

id objc_msgSend_startSampleIndex(void *a1, const char *a2, ...)
{
  return _[a1 startSampleIndex];
}

id objc_msgSend_startThreadTime(void *a1, const char *a2, ...)
{
  return _[a1 startThreadTime];
}

id objc_msgSend_startTime(void *a1, const char *a2, ...)
{
  return _[a1 startTime];
}

id objc_msgSend_startTimestamp(void *a1, const char *a2, ...)
{
  return _[a1 startTimestamp];
}

id objc_msgSend_storeCohortWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "storeCohortWithError:");
}

id objc_msgSend_storeItemIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 storeItemIdentifier];
}

id objc_msgSend_storeOtherBlockingThreadInfoInBlockingThreadInfo_sampleStore_mostBlockingTimeThreadId_sortedThreadsMaxCumlativeTime_blockingTimeByThread_tidToPidDict_( void *a1, const char *a2, ...)
{
  return _objc_msgSend( a1,  "storeOtherBlockingThreadInfoInBlockingThreadInfo:sampleStore:mostBlockingTimeThreadId:sortedThreadsMaxCumlati veTime:blockingTimeByThread:tidToPidDict:");
}

id objc_msgSend_storeTopBlockingThreadInfoInBlockingThreadInfo_sampleStore_mostBlockingTimeThreadId_pidMostBlockingTime_blockedTime_isHangMainThread_( void *a1, const char *a2, ...)
{
  return _objc_msgSend( a1,  "storeTopBlockingThreadInfoInBlockingThreadInfo:sampleStore:mostBlockingTimeThreadId:pidMostBlockingTime:block edTime:isHangMainThread:");
}

id objc_msgSend_stringByAppendingPathComponent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByAppendingPathComponent:");
}

id objc_msgSend_stringByAppendingPathExtension_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByAppendingPathExtension:");
}

id objc_msgSend_stringByAppendingString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByAppendingString:");
}

id objc_msgSend_stringByDeletingPathExtension(void *a1, const char *a2, ...)
{
  return _[a1 stringByDeletingPathExtension];
}

id objc_msgSend_stringByReplacingOccurrencesOfString_withString_options_range_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByReplacingOccurrencesOfString:withString:options:range:");
}

id objc_msgSend_stringFromDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringFromDate:");
}

id objc_msgSend_stringProperty_contextPrefixOut_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringProperty:contextPrefixOut:");
}

id objc_msgSend_stringWithCString_encoding_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithCString:encoding:");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_stringWithUTF8String_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithUTF8String:");
}

id objc_msgSend_substringFromIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "substringFromIndex:");
}

id objc_msgSend_targetProcess(void *a1, const char *a2, ...)
{
  return _[a1 targetProcess];
}

id objc_msgSend_tasksByPid(void *a1, const char *a2, ...)
{
  return _[a1 tasksByPid];
}

id objc_msgSend_thirdPartyDevHangHUDEnabled(void *a1, const char *a2, ...)
{
  return _[a1 thirdPartyDevHangHUDEnabled];
}

id objc_msgSend_threadId(void *a1, const char *a2, ...)
{
  return _[a1 threadId];
}

id objc_msgSend_threadStates(void *a1, const char *a2, ...)
{
  return _[a1 threadStates];
}

id objc_msgSend_threads(void *a1, const char *a2, ...)
{
  return _[a1 threads];
}

id objc_msgSend_tidToPidDict(void *a1, const char *a2, ...)
{
  return _[a1 tidToPidDict];
}

id objc_msgSend_timeIntervalSinceReferenceDate(void *a1, const char *a2, ...)
{
  return _[a1 timeIntervalSinceReferenceDate];
}

id objc_msgSend_timeRangeStart_end_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "timeRangeStart:end:");
}

id objc_msgSend_timer(void *a1, const char *a2, ...)
{
  return _[a1 timer];
}

id objc_msgSend_timestamp(void *a1, const char *a2, ...)
{
  return _[a1 timestamp];
}

id objc_msgSend_timestampWithMachAbsTime_machContTime_wallTime_machTimebase_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "timestampWithMachAbsTime:machContTime:wallTime:machTimebase:");
}

id objc_msgSend_topBlockingPid(void *a1, const char *a2, ...)
{
  return _[a1 topBlockingPid];
}

id objc_msgSend_transaction(void *a1, const char *a2, ...)
{
  return _[a1 transaction];
}

id objc_msgSend_turnstileInfo(void *a1, const char *a2, ...)
{
  return _[a1 turnstileInfo];
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return _[a1 type];
}

id objc_msgSend_unsignedIntProperty_contextPrefixOut_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unsignedIntProperty:contextPrefixOut:");
}

id objc_msgSend_unsignedIntValue(void *a1, const char *a2, ...)
{
  return _[a1 unsignedIntValue];
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return _[a1 unsignedIntegerValue];
}

id objc_msgSend_unsignedLongLongValue(void *a1, const char *a2, ...)
{
  return _[a1 unsignedLongLongValue];
}

id objc_msgSend_unsignedLongProperty_contextPrefixOut_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unsignedLongProperty:contextPrefixOut:");
}

id objc_msgSend_unsignedLongValue(void *a1, const char *a2, ...)
{
  return _[a1 unsignedLongValue];
}

id objc_msgSend_valueForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "valueForKey:");
}

id objc_msgSend_waitInfo(void *a1, const char *a2, ...)
{
  return _[a1 waitInfo];
}

id objc_msgSend_wallTime(void *a1, const char *a2, ...)
{
  return _[a1 wallTime];
}

id objc_msgSend_writeData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "writeData:");
}
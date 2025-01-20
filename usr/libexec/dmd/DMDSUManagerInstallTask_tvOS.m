@interface DMDSUManagerInstallTask_tvOS
+ (id)_dmfDownloadErrorFromSUDownloadError:(id)a3;
+ (id)_dmfInstallErrorFromSUInstallError:(id)a3;
+ (id)_dmfStatusErrorFromSUStatusError:(id)a3;
+ (id)defaultProductKey;
- (BOOL)removeUpdateWithError:(id *)a3;
- (BOOL)startDownloadWithError:(id *)a3;
- (BOOL)startInstallWithError:(id *)a3;
- (DMDSUManagerInstallTask_tvOS)init;
- (PBSOSUpdateDownload)lastDownload;
- (PBSOSUpdateManagerClient)client;
- (id)availableUpdateWithVersion:(id)a3 useDelay:(BOOL)a4 error:(id *)a5;
- (id)currentStatusWithError:(id *)a3;
- (void)client:(id)a3 downloadDidFinish:(id)a4;
- (void)setClient:(id)a3;
- (void)setLastDownload:(id)a3;
@end

@implementation DMDSUManagerInstallTask_tvOS

+ (id)defaultProductKey
{
  return @"tvOSUpdate";
}

- (DMDSUManagerInstallTask_tvOS)init
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___DMDSUManagerInstallTask_tvOS;
  v2 = -[DMDSUManagerInstallTask_tvOS init](&v5, "init");
  if (v2)
  {
    v3 = -[PBSOSUpdateManagerClient initWithDelegate:]( objc_alloc(&OBJC_CLASS___PBSOSUpdateManagerClient),  "initWithDelegate:",  v2);
    -[DMDSUManagerInstallTask_tvOS setClient:](v2, "setClient:", v3);
  }

  return v2;
}

- (id)availableUpdateWithVersion:(id)a3 useDelay:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  uint64_t v70 = 0LL;
  v71 = &v70;
  uint64_t v72 = 0x3032000000LL;
  v73 = sub_10005824C;
  v74 = sub_10005825C;
  id v75 = 0LL;
  uint64_t v64 = 0LL;
  v65 = &v64;
  uint64_t v66 = 0x3032000000LL;
  v67 = sub_10005824C;
  v68 = sub_10005825C;
  id v69 = 0LL;
  dispatch_semaphore_t v9 = dispatch_semaphore_create(0LL);
  v10 = (void *)objc_opt_new(&OBJC_CLASS___PBSOSUpdateScanOptions);
  [v10 setIdentifier:@"com.apple.mdm"];
  [v10 setMDMUseDelayPeriod:v6];
  [v10 setRequestedPMV:v8];
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    v11 = @"NO";
    if (v6) {
      v11 = @"YES";
    }
    *(_DWORD *)buf = 138412546;
    id v87 = v8;
    __int16 v88 = 2112;
    v89 = v11;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "available-os-updates requested=%@ useDelay=%@",  buf,  0x16u);
  }

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[DMDSUManagerInstallTask_tvOS client](self, "client"));
  v60[0] = _NSConcreteStackBlock;
  v60[1] = 3221225472LL;
  v60[2] = sub_100058264;
  v60[3] = &unk_10009F350;
  v62 = &v70;
  v63 = &v64;
  v13 = v9;
  v61 = v13;
  [v12 scanForUpdates:v10 withResult:v60];

  dispatch_time_t v14 = dispatch_time(0LL, 120000000000LL);
  if (!dispatch_semaphore_wait(v13, v14))
  {
    v17 = (void *)v65[5];
    if (!v17) {
      goto LABEL_16;
    }
    v18 = (void *)objc_claimAutoreleasedReturnValue([v17 domain]);
    if (([v18 isEqualToString:PBSOSUpdateServiceErrorDomain] & 1) == 0)
    {

      goto LABEL_16;
    }

    if ([(id)v65[5] code] == (id)5 || objc_msgSend((id)v65[5], "code") == (id)6)
    {
    }

    else
    {
      BOOL v37 = [(id)v65[5] code] == (id)7;

      if (!v37) {
        goto LABEL_16;
      }
    }

    v19 = (void *)v65[5];
    v65[5] = 0LL;

    v20 = (void *)objc_claimAutoreleasedReturnValue(-[DMDSUManagerInstallTask_tvOS lastDownload](self, "lastDownload"));
    BOOL v21 = v20 == 0LL;

    if (v21)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "available-os-updates no prior download. Cannot provide specific product key.",  buf,  2u);
      }
    }

    else
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[DMDSUManagerInstallTask_tvOS lastDownload](self, "lastDownload"));
      uint64_t v23 = objc_claimAutoreleasedReturnValue([v22 descriptor]);
      v24 = (void *)v71[5];
      v71[5] = v23;
    }

- (id)currentStatusWithError:(id *)a3
{
  uint64_t v23 = 0LL;
  v24 = &v23;
  uint64_t v25 = 0x3032000000LL;
  v26 = sub_10005824C;
  unsigned int v27 = sub_10005825C;
  dispatch_semaphore_t v28 = dispatch_semaphore_create(0LL);
  uint64_t v20 = 0LL;
  v21[0] = &v20;
  v21[1] = 0x3032000000LL;
  v21[2] = sub_10005824C;
  v21[3] = sub_10005825C;
  id v22 = 0LL;
  uint64_t v14 = 0LL;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x3032000000LL;
  v17 = sub_10005824C;
  v18 = sub_10005825C;
  v19 = objc_opt_new(&OBJC_CLASS___DMDSUStatus);
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(-[DMDSUManagerInstallTask_tvOS client](self, "client"));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_100058540;
  v13[3] = &unk_10009F378;
  v13[4] = &v14;
  v13[5] = &v20;
  v13[6] = &v23;
  [v5 currentDownload:v13];

  dispatch_time_t v6 = dispatch_time(0LL, 30000000000LL);
  if (!dispatch_semaphore_wait((dispatch_semaphore_t)v24[5], v6))
  {
    if (!*(void *)(v21[0] + 40LL))
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue([(id)v15[5] download]);
      -[DMDSUManagerInstallTask_tvOS setLastDownload:](self, "setLastDownload:", v11);

      id v10 = (id)v15[5];
      goto LABEL_12;
    }

    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      sub_100066D9C((uint64_t)v21);
      if (!a3) {
        goto LABEL_11;
      }
    }

    else if (!a3)
    {
      goto LABEL_11;
    }

    dispatch_semaphore_t v9 = (void *)objc_opt_class(self);
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v9 _dmfStatusErrorFromSUStatusError:*(void *)(v21[0] + 40)]);
    goto LABEL_8;
  }

  if (!a3)
  {
LABEL_11:
    id v10 = 0LL;
    goto LABEL_12;
  }

  uint64_t v7 = DMFErrorWithCodeAndUserInfo(801LL, 0LL);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
LABEL_8:
  id v10 = 0LL;
  *a3 = v8;
LABEL_12:
  _Block_object_dispose(&v14, 8);

  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v23, 8);

  return v10;
}

- (BOOL)startDownloadWithError:(id *)a3
{
  uint64_t v24 = 0LL;
  uint64_t v25 = &v24;
  uint64_t v26 = 0x2020000000LL;
  char v27 = 0;
  uint64_t v18 = 0LL;
  v19 = &v18;
  uint64_t v20 = 0x3032000000LL;
  BOOL v21 = sub_10005824C;
  id v22 = sub_10005825C;
  id v23 = 0LL;
  dispatch_semaphore_t v5 = dispatch_semaphore_create(0LL);
  dispatch_time_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[DMDSUManagerInstallTask_tvOS client](self, "client"));
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_100058778;
  v14[3] = &unk_10009F3A0;
  uint64_t v16 = &v24;
  v17 = &v18;
  uint64_t v7 = v5;
  uint64_t v15 = v7;
  [v6 startDownload:v14];

  dispatch_time_t v8 = dispatch_time(0LL, 30000000000LL);
  if (!dispatch_semaphore_wait(v7, v8))
  {
    if (*((_BYTE *)v25 + 24))
    {
      BOOL v11 = 1;
      goto LABEL_10;
    }

    if (a3)
    {
      v12 = (void *)objc_opt_class(self);
      id v10 = (void *)objc_claimAutoreleasedReturnValue([v12 _dmfDownloadErrorFromSUDownloadError:v19[5]]);
      goto LABEL_4;
    }

- (BOOL)startInstallWithError:(id *)a3
{
  uint64_t v28 = 0LL;
  id v29 = &v28;
  uint64_t v30 = 0x2020000000LL;
  char v31 = 0;
  uint64_t v22 = 0LL;
  id v23 = &v22;
  uint64_t v24 = 0x3032000000LL;
  uint64_t v25 = sub_10005824C;
  uint64_t v26 = sub_10005825C;
  id v27 = 0LL;
  dispatch_semaphore_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[DMDSUManagerInstallTask_tvOS lastDownload](self, "lastDownload"));

  if (v5)
  {
    dispatch_semaphore_t v6 = dispatch_semaphore_create(0LL);
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[DMDSUManagerInstallTask_tvOS lastDownload](self, "lastDownload"));
    dispatch_time_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 descriptor]);

    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[DMDSUManagerInstallTask_tvOS client](self, "client"));
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472LL;
    v18[2] = sub_100058A08;
    v18[3] = &unk_10009F3A0;
    uint64_t v20 = &v28;
    BOOL v21 = &v22;
    id v10 = v6;
    v19 = v10;
    [v9 installUpdate:v8 withOptions:0 withResult:v18];

    dispatch_time_t v11 = dispatch_time(0LL, 30000000000LL);
    if (dispatch_semaphore_wait(v10, v11))
    {
      if (a3)
      {
        uint64_t v12 = DMFErrorWithCodeAndUserInfo(801LL, 0LL);
        v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
LABEL_5:
        BOOL v14 = 0;
        *a3 = v13;
LABEL_14:

        goto LABEL_15;
      }
    }

    else
    {
      if (*((_BYTE *)v29 + 24))
      {
        BOOL v14 = 1;
        goto LABEL_14;
      }

      if (a3)
      {
        uint64_t v16 = (void *)objc_opt_class(self);
        v13 = (void *)objc_claimAutoreleasedReturnValue([v16 _dmfInstallErrorFromSUInstallError:v23[5]]);
        goto LABEL_5;
      }
    }

    BOOL v14 = 0;
    goto LABEL_14;
  }

  if (a3)
  {
    uint64_t v15 = DMFErrorWithCodeAndUserInfo(2202LL, 0LL);
    BOOL v14 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue(v15);
  }

  else
  {
    BOOL v14 = 0;
  }

- (BOOL)removeUpdateWithError:(id *)a3
{
  dispatch_semaphore_t v5 = dispatch_semaphore_create(0LL);
  uint64_t v45 = 0LL;
  uint64_t v46 = &v45;
  uint64_t v47 = 0x2020000000LL;
  char v48 = 0;
  uint64_t v42 = 0LL;
  v43[0] = &v42;
  v43[1] = 0x3032000000LL;
  v43[2] = sub_10005824C;
  v43[3] = sub_10005825C;
  id v44 = 0LL;
  dispatch_semaphore_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[DMDSUManagerInstallTask_tvOS client](self, "client"));
  uint64_t v35 = _NSConcreteStackBlock;
  uint64_t v36 = 3221225472LL;
  BOOL v37 = sub_100058D3C;
  id v38 = &unk_10009F3A0;
  v40 = &v45;
  uint64_t v41 = &v42;
  uint64_t v7 = v5;
  v39 = v7;
  [v6 purgeDownload:&v35];

  dispatch_time_t v8 = dispatch_time(0LL, 30000000000LL);
  if (dispatch_semaphore_wait(v7, v8))
  {
    if (a3)
    {
      uint64_t v9 = DMFErrorWithCodeAndUserInfo(801LL, 0LL);
      BOOL v10 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue(v9);
    }

    else
    {
      BOOL v10 = 0;
    }
  }

  else
  {
    if (*((_BYTE *)v46 + 24))
    {
      BOOL v11 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG);
      if (v11) {
        sub_100066EDC(v11, v12, v13, v14, v15, v16, v17, v18);
      }
    }

    else if (*(void *)(v43[0] + 40LL))
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
        sub_100066E58((uint64_t)v43);
      }
      if (a3)
      {
        uint64_t v19 = *(void *)(v43[0] + 40LL);
        if (v19)
        {
          NSErrorUserInfoKey v49 = NSUnderlyingErrorKey;
          uint64_t v50 = v19;
          uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v50,  &v49,  1LL,  v35,  v36,  v37,  v38));
          uint64_t v21 = DMFErrorWithCodeAndUserInfo(0LL, v20);
          id v22 = objc_claimAutoreleasedReturnValue(v21);
          *a3 = v22;
        }

        else
        {
          uint64_t v32 = DMFErrorWithCodeAndUserInfo(0LL, 0LL);
          id v33 = objc_claimAutoreleasedReturnValue(v32);
          *a3 = v33;
        }
      }
    }

    else if (a3)
    {
      BOOL v23 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG);
      if (v23) {
        sub_100066E20(v23, v24, v25, v26, v27, v28, v29, v30);
      }
      uint64_t v31 = DMFErrorWithCodeAndUserInfo(0LL, 0LL);
      *a3 = (id)objc_claimAutoreleasedReturnValue(v31);
    }

    BOOL v10 = *((_BYTE *)v46 + 24) != 0;
  }

  _Block_object_dispose(&v42, 8);
  _Block_object_dispose(&v45, 8);

  return v10;
}

- (void)client:(id)a3 downloadDidFinish:(id)a4
{
}

+ (id)_dmfStatusErrorFromSUStatusError:(id)a3
{
  id v3 = a3;
  v4 = v3;
  if (v3)
  {
    NSErrorUserInfoKey v10 = NSUnderlyingErrorKey;
    id v11 = v3;
    dispatch_semaphore_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v11,  &v10,  1LL));
    uint64_t v6 = DMFErrorWithCodeAndUserInfo(0LL, v5);
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  }

  else
  {
    uint64_t v8 = DMFErrorWithCodeAndUserInfo(0LL, 0LL);
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(v8);
  }

  return v7;
}

+ (id)_dmfDownloadErrorFromSUDownloadError:(id)a3
{
  id v3 = a3;
  v4 = v3;
  if (v3)
  {
    dispatch_semaphore_t v5 = (void *)objc_claimAutoreleasedReturnValue([v3 domain]);
    unsigned __int8 v6 = [v5 isEqualToString:PBSOSUpdateServiceErrorDomain];

    if ((v6 & 1) == 0)
    {
      NSErrorUserInfoKey v26 = NSUnderlyingErrorKey;
      uint64_t v27 = v4;
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v27,  &v26,  1LL));
      uint64_t v9 = 0LL;
      goto LABEL_16;
    }

    uint64_t v7 = (uint64_t)[v4 code];
    if (v7 > 6)
    {
      if (v7 == 7)
      {
        NSErrorUserInfoKey v20 = NSUnderlyingErrorKey;
        uint64_t v21 = v4;
        uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v21,  &v20,  1LL));
        uint64_t v9 = 2207LL;
        goto LABEL_16;
      }

      if (v7 == 15)
      {
        NSErrorUserInfoKey v18 = NSUnderlyingErrorKey;
        uint64_t v19 = v4;
        uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v19,  &v18,  1LL));
        uint64_t v9 = 2201LL;
        goto LABEL_16;
      }
    }

    else
    {
      if (v7 == 2)
      {
        NSErrorUserInfoKey v24 = NSUnderlyingErrorKey;
        uint64_t v25 = v4;
        uint64_t v12 = &v25;
        uint64_t v13 = &v24;
        goto LABEL_14;
      }

      if (v7 == 6)
      {
        NSErrorUserInfoKey v22 = NSUnderlyingErrorKey;
        BOOL v23 = v4;
        uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v23,  &v22,  1LL));
        uint64_t v9 = 2200LL;
LABEL_16:
        uint64_t v14 = DMFErrorWithCodeAndUserInfo(v9, v8);
        id v11 = (void *)objc_claimAutoreleasedReturnValue(v14);

        goto LABEL_17;
      }
    }

    NSErrorUserInfoKey v16 = NSUnderlyingErrorKey;
    uint64_t v17 = v4;
    uint64_t v12 = &v17;
    uint64_t v13 = &v16;
LABEL_14:
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v12,  v13,  1LL));
    uint64_t v9 = 2202LL;
    goto LABEL_16;
  }

  uint64_t v10 = DMFErrorWithCodeAndUserInfo(0LL, 0LL);
  id v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
LABEL_17:

  return v11;
}

+ (id)_dmfInstallErrorFromSUInstallError:(id)a3
{
  id v3 = a3;
  v4 = v3;
  if (v3)
  {
    dispatch_semaphore_t v5 = (void *)objc_claimAutoreleasedReturnValue([v3 domain]);
    unsigned __int8 v6 = [v5 isEqualToString:PBSOSUpdateServiceErrorDomain];

    if ((v6 & 1) != 0)
    {
      switch((unint64_t)[v4 code])
      {
        case 2uLL:
          NSErrorUserInfoKey v21 = NSUnderlyingErrorKey;
          NSErrorUserInfoKey v22 = v4;
          uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v22,  &v21,  1LL));
          uint64_t v8 = 2202LL;
          break;
        case 4uLL:
        case 7uLL:
          NSErrorUserInfoKey v17 = NSUnderlyingErrorKey;
          NSErrorUserInfoKey v18 = v4;
          uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v18,  &v17,  1LL));
          uint64_t v8 = 2207LL;
          break;
        case 6uLL:
          NSErrorUserInfoKey v19 = NSUnderlyingErrorKey;
          NSErrorUserInfoKey v20 = v4;
          uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v20,  &v19,  1LL));
          uint64_t v8 = 2200LL;
          break;
        case 0xDuLL:
          NSErrorUserInfoKey v15 = NSUnderlyingErrorKey;
          NSErrorUserInfoKey v16 = v4;
          uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v16,  &v15,  1LL));
          uint64_t v8 = 2214LL;
          break;
        default:
          NSErrorUserInfoKey v13 = NSUnderlyingErrorKey;
          uint64_t v14 = v4;
          uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v14,  &v13,  1LL));
          uint64_t v8 = 2208LL;
          break;
      }
    }

    else
    {
      NSErrorUserInfoKey v23 = NSUnderlyingErrorKey;
      NSErrorUserInfoKey v24 = v4;
      uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v24,  &v23,  1LL));
      uint64_t v8 = 0LL;
    }

    uint64_t v11 = DMFErrorWithCodeAndUserInfo(v8, v7);
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(v11);
  }

  else
  {
    uint64_t v9 = DMFErrorWithCodeAndUserInfo(0LL, 0LL);
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  }

  return v10;
}

- (PBSOSUpdateManagerClient)client
{
  return self->client;
}

- (void)setClient:(id)a3
{
}

- (PBSOSUpdateDownload)lastDownload
{
  return self->lastDownload;
}

- (void)setLastDownload:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
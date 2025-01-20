@interface PVAppIdentityGenerator
- (BOOL)extractApplicationRecord:(id *)a3;
- (BOOL)validatePPQAppId:(id *)a3;
- (PVAppIdentityGenerator)initWithApplicationURL:(id)a3 ppqAppId:(id)a4;
- (id)generateDigest;
- (void)dealloc;
@end

@implementation PVAppIdentityGenerator

- (PVAppIdentityGenerator)initWithApplicationURL:(id)a3 ppqAppId:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___PVAppIdentityGenerator;
  v9 = -[PVAppIdentityGenerator init](&v14, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->applicationURL, a3);
    objc_storeStrong((id *)&v10->ppqAppId, a4);
    executableName = v10->executableName;
    v10->executableName = 0LL;

    executableURL = v10->executableURL;
    v10->executableURL = 0LL;
  }

  return v10;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)&OBJC_CLASS___PVAppIdentityGenerator;
  -[PVAppIdentityGenerator dealloc](&v2, "dealloc");
}

- (BOOL)extractApplicationRecord:(id *)a3
{
  id v5 = objc_alloc(&OBJC_CLASS___LSApplicationRecord);
  applicationURL = self->applicationURL;
  id v34 = 0LL;
  id v7 = [v5 initWithURL:applicationURL allowPlaceholder:0 error:&v34];
  id v8 = (os_log_s *)v34;
  if (v7)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue([v7 infoDictionary]);
    id v10 = [v9 objectForKey:kCFBundleExecutableKey ofClass:objc_opt_class(NSString)];
    v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);

    v12 = (void *)objc_claimAutoreleasedReturnValue([v7 executableURL]);
    id v13 = isNSString(v11);
    objc_super v14 = (void *)objc_claimAutoreleasedReturnValue(v13);

    if (v14) {
      BOOL v15 = v12 == 0LL;
    }
    else {
      BOOL v15 = 1;
    }
    if (v15)
    {
      v16 = v8;
      id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[NSError pvai_errorWithCode:](&OBJC_CLASS___NSError, "pvai_errorWithCode:", -10200LL));
    }

    else
    {
      objc_storeStrong((id *)&self->executableName, v11);
      objc_storeStrong((id *)&self->executableURL, v12);
      id v17 = _PVAppIdentityLogSystem();
      v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
        sub_100018FCC(v7);
      }

      id v20 = _PVAppIdentityLogSystem();
      v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
        sub_100018F64();
      }

      id v22 = _PVAppIdentityLogSystem();
      v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG)) {
        sub_100018EDC(v7);
      }

      id v24 = _PVAppIdentityLogSystem();
      v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG)) {
        sub_100018E54(v7);
      }

      id v26 = _PVAppIdentityLogSystem();
      v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG)) {
        sub_100018DCC(v7);
      }

      id v28 = _PVAppIdentityLogSystem();
      v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG)) {
        sub_100018D54(v7);
      }

      id v30 = _PVAppIdentityLogSystem();
      v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG)) {
        sub_100018CDC(v7);
      }

      id v32 = _PVAppIdentityLogSystem();
      v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
        sub_100018C74();
      }
    }
  }

  else
  {
    v11 = v8;
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSError pvai_wrappedError:error:]( &OBJC_CLASS___NSError,  "pvai_wrappedError:error:",  -10200LL,  v8));
  }

  if (a3 && v8) {
    *a3 = v8;
  }

  return v8 == 0LL;
}

- (BOOL)validatePPQAppId:(id *)a3
{
  id v4 = isNSData(self->ppqAppId);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);

  if (v5)
  {
    id v6 = 0LL;
  }

  else
  {
    id v6 = (id)objc_claimAutoreleasedReturnValue(+[NSError pvai_errorWithCode:](&OBJC_CLASS___NSError, "pvai_errorWithCode:", -10001LL));
    if (a3 && v6)
    {
      id v6 = v6;
      *a3 = v6;
    }
  }

  BOOL v7 = v6 == 0LL;

  return v7;
}

- (id)generateDigest
{
  id v42 = 0LL;
  id v43 = 0LL;
  id v41 = 0LL;
  CFTypeRef v39 = 0LL;
  CFTypeRef cf = 0LL;
  id v37 = 0LL;
  CFTypeRef v38 = 0LL;
  -[PVAppIdentityGenerator extractApplicationRecord:](self, "extractApplicationRecord:", &v37);
  id v3 = v37;
  if (v3
    || (id v36 = 0LL,
        -[PVAppIdentityGenerator validatePPQAppId:](self, "validatePPQAppId:", &v36),
        (id v3 = v36) != 0LL))
  {
    id v4 = v3;
    id v5 = 0LL;
    id v34 = 0LL;
LABEL_4:
    id v6 = objc_alloc(&OBJC_CLASS___PVAppIdentityDigest);
    BOOL v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", 2001LL));
    id v8 = -[PVAppIdentityDigest initWithError:version:](v6, "initWithError:version:", v4, v7);
    v9 = 0LL;
    id v10 = 0LL;
    v11 = 0LL;
    v12 = 0LL;
    id v13 = 0LL;
    objc_super v14 = 0LL;
LABEL_5:

    BOOL v15 = v34;
    goto LABEL_6;
  }

  BOOL v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSString dataUsingEncoding:](self->executableName, "dataUsingEncoding:", 4LL));
  applicationURL = self->applicationURL;
  p_applicationURL = (uint64_t *)&self->applicationURL;
  uint64_t v33 = objc_claimAutoreleasedReturnValue( -[NSURL URLByAppendingPathComponent:isDirectory:]( applicationURL,  "URLByAppendingPathComponent:isDirectory:",  @"_CodeSignature/CodeResources",  0LL));
  PVAppIdentityCore_GenerateDigests( p_applicationURL[1],  (uint64_t)v15,  *p_applicationURL,  p_applicationURL[3],  v33,  -1,  -1);
  if (!v20)
  {
    id v34 = v15;
    id v21 = v43;
    id v22 = v42;
    id v30 = v41;
    CFTypeRef v23 = (id)v39;
    objc_super v14 = (id)cf;
    id v13 = (id)v38;
    id v24 = objc_alloc(&OBJC_CLASS___PVAppIdentityDigest);
    v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInt:]( &OBJC_CLASS___NSNumber,  "numberWithInt:",  2001LL,  &v42,  &v41,  &v39,  &cf,  &v38));
    v9 = v21;
    id v26 = v21;
    id v10 = v22;
    id v27 = v22;
    v11 = v30;
    v12 = (void *)v23;
    id v8 = -[PVAppIdentityDigest initWithVersion:data0:data1:data2:data3:data4:data5:]( v24,  "initWithVersion:data0:data1:data2:data3:data4:data5:",  v25,  v26,  v27,  v13);

    BOOL v7 = (void *)objc_claimAutoreleasedReturnValue(-[PVAppIdentityDigest asDictionary](v8, "asDictionary"));
    id v35 = 0LL;
    id v32 = (void *)objc_claimAutoreleasedReturnValue( +[NSJSONSerialization dataWithJSONObject:options:error:]( &OBJC_CLASS___NSJSONSerialization,  "dataWithJSONObject:options:error:",  v7,  3LL,  &v35));
    id v31 = v35;
    id v28 = _PVAppIdentityLogSystem();
    v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG)) {
      sub_100019044(p_applicationURL, (uint64_t)v32, v29);
    }

    id v4 = 0LL;
    id v5 = (void *)v33;
    goto LABEL_5;
  }

  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSError pvai_errorWithCode:]( &OBJC_CLASS___NSError,  "pvai_errorWithCode:",  v20,  &v42,  &v41,  &v39,  &cf,  &v38));
  if (v4)
  {
    id v34 = v15;
    id v5 = (void *)v33;
    goto LABEL_4;
  }

  v9 = 0LL;
  id v10 = 0LL;
  v11 = 0LL;
  v12 = 0LL;
  id v13 = 0LL;
  objc_super v14 = 0LL;
  id v8 = 0LL;
  id v5 = (void *)v33;
LABEL_6:
  if (v43) {
    CFRelease(v43);
  }
  if (v42) {
    CFRelease(v42);
  }
  if (v41) {
    CFRelease(v41);
  }
  if (cf) {
    CFRelease(cf);
  }
  if (v39) {
    CFRelease(v39);
  }
  if (v38) {
    CFRelease(v38);
  }
  v16 = v8;

  return v16;
}

- (void).cxx_destruct
{
}

@end
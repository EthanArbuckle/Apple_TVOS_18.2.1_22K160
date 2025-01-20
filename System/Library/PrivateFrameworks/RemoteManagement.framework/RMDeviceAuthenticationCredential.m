@interface RMDeviceAuthenticationCredential
- (BOOL)prepareTask:(id)a3 error:(id *)a4;
- (BOOL)prepareURLRequest:(id)a3 error:(id *)a4;
@end

@implementation RMDeviceAuthenticationCredential

- (BOOL)prepareURLRequest:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 HTTPBody]);
  if (!v6) {
    v6 = (void *)objc_claimAutoreleasedReturnValue([&stru_1000BB450 dataUsingEncoding:4]);
  }
  uint64_t v41 = 0LL;
  v42 = &v41;
  uint64_t v43 = 0x3032000000LL;
  v44 = sub_10000A1D8;
  v45 = sub_10000A1E8;
  id v46 = 0LL;
  uint64_t v35 = 0LL;
  v36 = &v35;
  uint64_t v37 = 0x3032000000LL;
  v38 = sub_10000A1D8;
  v39 = sub_10000A1E8;
  id v40 = 0LL;
  uint64_t v29 = 0LL;
  v30 = &v29;
  uint64_t v31 = 0x3032000000LL;
  v32 = sub_10000A1D8;
  v33 = sub_10000A1E8;
  id v34 = 0LL;
  v7 = -[NSConditionLock initWithCondition:](objc_alloc(&OBJC_CLASS___NSConditionLock), "initWithCondition:", 0LL);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[RMDeviceIdentity sharedDeviceIdentity](&OBJC_CLASS___RMDeviceIdentity, "sharedDeviceIdentity"));
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472LL;
  v23[2] = sub_10000A1F0;
  v23[3] = &unk_1000B8E10;
  v9 = v7;
  v24 = v9;
  v26 = &v41;
  id v10 = v6;
  id v25 = v10;
  v27 = &v29;
  v28 = &v35;
  [v8 deviceIdentityWithCompletionHandler:v23];

  -[NSConditionLock lockWhenCondition:](v9, "lockWhenCondition:", 1LL);
  -[NSConditionLock unlock](v9, "unlock");
  uint64_t v11 = v30[5];
  if (v11)
  {
    if (a4)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[RMErrorUtilities createInternalError](&OBJC_CLASS___RMErrorUtilities, "createInternalError"));
      v13 = v12;
      if (v12) {
        *a4 = v12;
      }
    }
  }

  else
  {
    v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog deviceAuthenticationCredential](&OBJC_CLASS___RMLog, "deviceAuthenticationCredential"));
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
      sub_10000A500(v14, v15, v16, v17, v18, v19, v20, v21);
    }

    [v5 setValue:v42[5] forHTTPHeaderField:@"X-Apple-RM-Signature-Data"];
    [v5 setValue:v36[5] forHTTPHeaderField:@"X-Apple-RM-Signature-Certificates"];
  }

  _Block_object_dispose(&v29, 8);
  _Block_object_dispose(&v35, 8);

  _Block_object_dispose(&v41, 8);
  return v11 == 0;
}

- (BOOL)prepareTask:(id)a3 error:(id *)a4
{
  return 1;
}

@end
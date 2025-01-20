void sub_100002190(uint64_t a1)
{
  id v2;
  void v3[4];
  id v4;
  v2 = [*(id *)(a1 + 32) copy];
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_100002214;
  v3[3] = &unk_1000187F0;
  v4 = *(id *)(a1 + 40);
  DeviceIdentityIssueClientCertificateWithCompletion(0LL, v2, v3);
}

void sub_100002214(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  v11 = v8;
  if (v8)
  {
    v12 = *(void **)(DEPLogObjects(v8, v9, v10) + 8);
    if (os_log_type_enabled((os_log_t)v12, OS_LOG_TYPE_ERROR))
    {
      v13 = v12;
      v14 = (void *)objc_claimAutoreleasedReturnValue([v11 description]);
      int v16 = 138543362;
      v17 = v14;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_ERROR,  "Error while retrieving client certificates: %{public}@",  (uint8_t *)&v16,  0xCu);
    }

    (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
  }

  else
  {
    uint64_t v15 = *(void *)(a1 + 32);
    if (v15)
    {
      (*(void (**)(uint64_t, void *, id, void))(v15 + 16))(v15, a2, v7, 0LL);
    }
  }
}

void sub_100003F80(uint64_t a1)
{
  id v1 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) deviceType]);
  byte_100021590 = [v1 isEqualToString:@"iPad"];
}

void sub_100004034(uint64_t a1)
{
  id v1 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) deviceType]);
  byte_1000215A0 = [v1 isEqualToString:@"AppleTV"];
}

void sub_1000040E8(uint64_t a1)
{
  id v1 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) deviceType]);
  byte_1000215B0 = [v1 isEqualToString:@"Watch"];
}

void sub_10000419C(uint64_t a1)
{
  id v1 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) deviceType]);
  byte_1000215C0 = [v1 isEqualToString:@"AudioAccessory"];
}

void sub_100004250(uint64_t a1)
{
  id v1 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) deviceType]);
  byte_1000215D0 = [v1 isEqualToString:@"iPhone"];
}

void sub_1000042E0(id a1)
{
  uint64_t v1 = MGCopyAnswer(@"3kmXfug8VcxLI5yEmsqQKw", 0LL);
  v2 = (void *)v1;
  if (v1)
  {
    v4 = (void *)v1;
    uint64_t v3 = objc_opt_class(&OBJC_CLASS___NSNumber);
    if ((objc_opt_isKindOfClass(v4, v3) & 1) != 0) {
      LOBYTE(v1) = [v4 BOOLValue];
    }
    else {
      LOBYTE(v1) = 0;
    }
    v2 = v4;
  }

  byte_1000215E0 = v1;
}

void sub_100004464(id a1)
{
  uint64_t v1 = -[NSDictionary initWithContentsOfFile:]( objc_alloc(&OBJC_CLASS___NSDictionary),  "initWithContentsOfFile:",  @"/System/Library/CoreServices/SystemVersion.plist");
  v2 = (void *)qword_1000215F0;
  qword_1000215F0 = (uint64_t)v1;
}

LABEL_13:
      v14 = 0LL;
      goto LABEL_14;
    }

    if (a5 == 503)
    {
      v14 = 0LL;
      *a6 = 1;
      goto LABEL_14;
    }

LABEL_10:
    if (a7)
    {
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue( -[CCDEnrollmentOperation errorForStatusCode:responseData:]( self,  "errorForStatusCode:responseData:",  a5,  v12));
      goto LABEL_12;
    }

    goto LABEL_13;
  }

  if (a5 != 200 && a5 != 204) {
    goto LABEL_10;
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue( -[CCDEnrollmentOperation responseWithResponseData:contentType:outError:]( self,  "responseWithResponseData:contentType:outError:",  v12,  v13,  a7));
LABEL_14:

  return v14;
}

LABEL_20:
    v31 = (id)objc_claimAutoreleasedReturnValue(+[CCDError badFormatError](&OBJC_CLASS___CCDError, "badFormatError", *(_OWORD *)v37));
    goto LABEL_21;
  }

  if (!-[__CFString isEqualToString:](v9, "isEqualToString:", @"PROVISIONAL_ENROLLMENT"))
  {
    v25 = -[__CFString isEqualToString:](v9, "isEqualToString:", @"REGULAR_ENROLLMENT");
    v26 = (int)v25;
    v29 = *(os_log_s **)(DEPLogObjects(v25, v27, v28) + 8);
    v30 = os_log_type_enabled(v29, OS_LOG_TYPE_ERROR);
    if (v26)
    {
      if (v30)
      {
        *(_WORD *)v37 = 0;
        _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, "This device is already enrolled.", v37, 2u);
      }

      v31 = (id)objc_claimAutoreleasedReturnValue(+[CCDError deviceAlreadyEnrolledError](&OBJC_CLASS___CCDError, "deviceAlreadyEnrolledError"));
LABEL_21:
      v20 = v31;
      if (!a4) {
        goto LABEL_29;
      }
      goto LABEL_27;
    }

    if (v30)
    {
      *(_WORD *)v37 = 0;
      v22 = "Enrollment type is not recognized.";
      v23 = v29;
      v24 = 2;
      goto LABEL_19;
    }

    goto LABEL_20;
  }

  v19 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"ce_expiry_ts"]);
  if (v19)
  {
    v20 = 0LL;
  }

  else
  {
    v34 = *(os_log_s **)(DEPLogObjects(0LL, v17, v18) + 8);
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v37 = 0;
      _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "No expiry date received", v37, 2u);
    }

    v20 = (void *)objc_claimAutoreleasedReturnValue(+[CCDError badFormatError](&OBJC_CLASS___CCDError, "badFormatError"));
  }

  if (a4)
  {
LABEL_27:
    if (v20)
    {
      v31 = v20;
      *a4 = v31;
    }
  }

LABEL_29:
  v35 = *(os_log_s **)(DEPLogObjects(v31, v32, v33) + 8);
  if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v37 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v35,  OS_LOG_TYPE_DEBUG,  "Enrollment response is validated successfully.",  v37,  2u);
  }

  return v20 == 0LL;
}

LABEL_19:
    v30 = 0LL;
    goto LABEL_20;
  }

  v23 = *(void **)(DEPLogObjects(v11, v12, v13) + 8);
  if (os_log_type_enabled((os_log_t)v23, OS_LOG_TYPE_DEBUG))
  {
    v24 = v23;
    v25 = -[NSString initWithData:encoding:](objc_alloc(&OBJC_CLASS___NSString), "initWithData:encoding:", v9, 4LL);
    *(_DWORD *)buf = 138543362;
    v49 = v25;
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEBUG, "Enrollment Response: %{public}@", buf, 0xCu);
  }

  v47 = 0LL;
  v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSJSONSerialization JSONObjectWithData:options:error:]( &OBJC_CLASS___NSJSONSerialization,  "JSONObjectWithData:options:error:",  v9,  1LL,  &v47));
  v14 = (NSString *)v47;
  v29 = *(os_log_s **)(DEPLogObjects(v14, v27, v28) + 8);
  if (v14)
  {
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v49 = v14;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, "Error: %@", buf, 0xCu);
    }

    v30 = 0LL;
LABEL_16:
    if (a5) {
      *a5 = (id)objc_claimAutoreleasedReturnValue(+[CCDError badFormatError](&OBJC_CLASS___CCDError, "badFormatError"));
    }

    goto LABEL_19;
  }

  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEBUG, "Validating cloud configuration", buf, 2u);
  }

  v46 = 0LL;
  v32 = -[CCDEnrollmentRetrieveCloudConfigurationOperation _convertCloudConfigDictionary:toManagedConfiguration:]( self,  "_convertCloudConfigDictionary:toManagedConfiguration:",  v26,  &v46);
  v33 = v46;
  v30 = v33;
  if ((v32 & 1) == 0)
  {
    v44 = *(os_log_s **)(DEPLogObjects(v33, v34, v35) + 8);
    if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_INFO, "Cloud configuration is invalid.", buf, 2u);
    }

    goto LABEL_16;
  }

  CFPreferencesSetAppValue( @"LockdownCloudConfigurationAvailable",  kCFBooleanTrue,  @"com.apple.managedconfiguration.notbackedup");
  v39 = *(os_log_s **)(DEPLogObjects(v36, v37, v38) + 8);
  if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v39,  OS_LOG_TYPE_DEFAULT,  "Wait for preferences to flush its caches",  buf,  2u);
  }

  v40 = _CFPreferencesFlushCachesForIdentifier(@"com.apple.managedconfiguration.notbackedup", @"mobile");
  v43 = *(os_log_s **)(DEPLogObjects(v40, v41, v42) + 8);
  if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v43,  OS_LOG_TYPE_DEFAULT,  "Disk is updated with the cloud configuration preference.",  buf,  2u);
  }

  v14 = 0LL;
LABEL_20:

  return v30;
}

void sub_100006CB4(uint64_t a1)
{
  v13[0] = @"PROFILE_NOT_ACTIVE";
  v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) profileNotActiveError]);
  v14[0] = v2;
  v13[1] = @"PROFILE_NOT_FOUND";
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) profileNotFoundError]);
  v14[1] = v3;
  v13[2] = @"DEVICE_NOT_FOUND";
  v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) deviceNotFoundError]);
  v14[2] = v4;
  v13[3] = @"DEVICE_NOT_ENROLLED";
  v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) deviceNotEnrolledError]);
  v14[3] = v5;
  v13[4] = @"NONCE_EXPIRED";
  v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) nonceExpiredError]);
  v14[4] = v6;
  v13[5] = @"INVALID_SIGNATURE";
  id v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) invalidSignatureError]);
  v14[5] = v7;
  v13[6] = @"INVALID_DEVICE";
  id v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) invalidDeviceError]);
  v14[6] = v8;
  v13[7] = @"INVALID_PROFILE";
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) invalidProfileError]);
  v14[7] = v9;
  v13[8] = @"CANNOT_ENROLL";
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) deviceAlreadyEnrolledError]);
  v14[8] = v10;
  uint64_t v11 = objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v14,  v13,  9LL));
  v12 = (void *)qword_100021608;
  qword_100021608 = v11;
}

void sub_1000077FC(uint64_t a1)
{
  v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) idleTimer]);
  [v2 invalidate];

  uint64_t v3 = objc_alloc(&OBJC_CLASS___NSTimer);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](&OBJC_CLASS___NSDate, "dateWithTimeIntervalSinceNow:", 300.0));
  v5 = -[NSTimer initWithFireDate:interval:target:selector:userInfo:repeats:]( v3,  "initWithFireDate:interval:target:selector:userInfo:repeats:",  v4,  *(void *)(a1 + 32),  "idleTimerDidFire:",  0LL,  0LL,  0.0);
  [*(id *)(a1 + 32) setIdleTimer:v5];

  id v7 = (id)objc_claimAutoreleasedReturnValue(+[NSRunLoop mainRunLoop](&OBJC_CLASS___NSRunLoop, "mainRunLoop"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) idleTimer]);
  [v7 addTimer:v6 forMode:NSRunLoopCommonModes];
}

LABEL_7:
  if (a12)
  {
    v24 = v27;
    *a12 = v24;
  }

  v31 = *(os_log_s **)(DEPLogObjects(v24, v25, v26) + 8);
  if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    v46 = v27;
    _os_log_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_ERROR,  "Failed to set data in keychain. Error: %{public}@",  buf,  0xCu);
  }

  v32 = 0;
LABEL_23:

  return v32;
}
}

void sub_100008670(id a1)
{
  uint64_t v1 = objc_claimAutoreleasedReturnValue(+[CCDDeviceUtilities deviceType](&OBJC_CLASS___CCDDeviceUtilities, "deviceType"));
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[CCDDeviceUtilities productName](&OBJC_CLASS___CCDDeviceUtilities, "productName"));
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[CCDDeviceUtilities productBuildVersion](&OBJC_CLASS___CCDDeviceUtilities, "productBuildVersion"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[CCDDeviceUtilities productBuildVersion](&OBJC_CLASS___CCDDeviceUtilities, "productBuildVersion"));
  int v16 = (void *)v1;
  v21[0] = v1;
  v21[1] = v2;
  v21[2] = v3;
  v21[3] = v4;
  id v5 = (id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v21, 4LL));
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  id v6 = [v5 countByEnumeratingWithState:&v17 objects:v22 count:16];
  if (v6)
  {
    id v7 = v6;
    id v8 = 0LL;
    uint64_t v9 = *(void *)v18;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v5);
        }
        uint64_t v11 = *(void **)(*((void *)&v17 + 1) + 8LL * (void)i);
        if (v11)
        {
          if ([v8 length])
          {
            [v8 appendFormat:@"; %@", v11];
          }

          else
          {
            id v12 = [v11 mutableCopy];

            id v8 = v12;
          }
        }
      }

      id v7 = [v5 countByEnumeratingWithState:&v17 objects:v22 count:16];
    }

    while (v7);
  }

  else
  {
    id v8 = 0LL;
  }

  if ([v8 length]) {
    v13 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @" (%@)", v8));
  }
  else {
    v13 = &stru_100019A88;
  }
  uint64_t v14 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"ConfigClient/1.0%@", v13));
  uint64_t v15 = (void *)qword_100021610;
  qword_100021610 = v14;
}

void sub_10000892C(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (v9 && (id v10 = [*(id *)(a1 + 32) isCancelled], (v10 & 1) == 0))
  {
    v13 = *(os_log_s **)(DEPLogObjects(v10, v11, v12) + 8);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      int v14 = 138543362;
      id v15 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_ERROR,  "Failed to retrieve the client certificate: %{public}@.",  (uint8_t *)&v14,  0xCu);
    }

    [*(id *)(a1 + 32) setCertificateRetrievalFailed:1];
    [*(id *)(a1 + 32) _retryCertificateRetrievalIfAllowedAfterDelayOrFailWithError:v9];
  }

  else
  {
    [*(id *)(a1 + 32) _completeOperationWithReferenceKey:v7 certificates:v8 error:v9];
  }
}

void sub_1000092C4( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, char a38)
{
}

uint64_t sub_100009320(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_100009330(uint64_t a1)
{
}

id sub_100009338(void *a1, uint64_t a2, uint64_t a3)
{
  v4 = *(os_log_s **)(DEPLogObjects(a1, a2, a3) + 8);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Done retrieving mid", v6, 2u);
  }

  [*(id *)(*(void *)(a1[5] + 8) + 40) lock];
  if (*(_BYTE *)(*(void *)(a1[6] + 8LL) + 24LL)) {
    (*(void (**)(void))(a1[4] + 16LL))();
  }
  else {
    *(_BYTE *)(*(void *)(a1[10] + 8LL) + 24LL) = 1;
  }
  return [*(id *)(*(void *)(a1[5] + 8) + 40) unlock];
}

void sub_10000940C(void *a1, char a2, void *a3, void *a4)
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v12 = *(os_log_s **)(DEPLogObjects(v9, v10, v11) + 8);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v13 = 0;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "Done retrieving cloud configuration", v13, 2u);
  }

  [*(id *)(*(void *)(a1[5] + 8) + 40) lock];
  if (*(_BYTE *)(*(void *)(a1[6] + 8LL) + 24LL))
  {
    (*(void (**)(void))(a1[4] + 16LL))();
  }

  else
  {
    *(_BYTE *)(*(void *)(a1[7] + 8LL) + 24LL) = a2;
    objc_storeStrong((id *)(*(void *)(a1[8] + 8LL) + 40LL), a3);
    objc_storeStrong((id *)(*(void *)(a1[9] + 8LL) + 40LL), a4);
    *(_BYTE *)(*(void *)(a1[10] + 8LL) + 24LL) = 1;
  }

  [*(id *)(*(void *)(a1[5] + 8) + 40) unlock];
}

uint64_t sub_100009974(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void, BOOL, uint64_t))(*(void *)(a1 + 32) + 16LL))( *(void *)(a1 + 32),  a3 == 0,  a2);
}

void sub_100009B30(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  id v8 = a3;
  if (a4)
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16LL))();
  }

  else
  {
    [*(id *)(a1 + 32) setPrivateKey:a2];
    [*(id *)(a1 + 32) setClientCertificates:v8];
    id v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) _operationForEnrollmentRequest:*(void *)(a1 + 32)]);
    [v7 setEnrollmentCompletionBlock:*(void *)(a1 + 48)];
    [*(id *)(a1 + 40) _addOperationToQueue:v7];
  }
}

void sub_10000B508(id a1)
{
  v153[0] = @"org";
  v152[0] = &__kCFBooleanTrue;
  v151[0] = @"isRequired";
  v151[1] = @"keyInfo";
  v149[0] = @"name";
  v147[0] = @"isRequired";
  v147[1] = @"validationType";
  v148[0] = &__kCFBooleanTrue;
  v148[1] = &off_10001AAA0;
  v147[2] = @"destinationKey";
  v148[2] = @"OrganizationName";
  v52 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v148,  v147,  3LL));
  v150[0] = v52;
  v149[1] = @"address";
  v145[0] = @"isRequired";
  v145[1] = @"validationType";
  v146[0] = &__kCFBooleanFalse;
  v146[1] = &off_10001AAA0;
  v145[2] = @"destinationKey";
  v146[2] = @"OrganizationAddress";
  v51 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v146,  v145,  3LL));
  v150[1] = v51;
  v149[2] = @"address-line-1";
  v143[0] = @"isRequired";
  v143[1] = @"validationType";
  v144[0] = &__kCFBooleanFalse;
  v144[1] = &off_10001AAA0;
  v143[2] = @"destinationKey";
  v144[2] = @"OrganizationAddressLine1";
  v50 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v144,  v143,  3LL));
  v150[2] = v50;
  v149[3] = @"address-line-2";
  v141[0] = @"isRequired";
  v141[1] = @"validationType";
  v142[0] = &__kCFBooleanFalse;
  v142[1] = &off_10001AAA0;
  v141[2] = @"destinationKey";
  v142[2] = @"OrganizationAddressLine2";
  v49 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v142,  v141,  3LL));
  v150[3] = v49;
  v149[4] = @"address-line-3";
  v139[0] = @"isRequired";
  v139[1] = @"validationType";
  v140[0] = &__kCFBooleanFalse;
  v140[1] = &off_10001AAA0;
  v139[2] = @"destinationKey";
  v140[2] = @"OrganizationAddressLine3";
  v48 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v140,  v139,  3LL));
  v150[4] = v48;
  v149[5] = @"city";
  v137[0] = @"isRequired";
  v137[1] = @"validationType";
  v138[0] = &__kCFBooleanFalse;
  v138[1] = &off_10001AAA0;
  v137[2] = @"destinationKey";
  v138[2] = @"OrganizationCity";
  v47 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v138,  v137,  3LL));
  v150[5] = v47;
  v149[6] = @"region";
  v135[0] = @"isRequired";
  v135[1] = @"validationType";
  v136[0] = &__kCFBooleanFalse;
  v136[1] = &off_10001AAA0;
  v135[2] = @"destinationKey";
  v136[2] = @"OrganizationRegion";
  v46 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v136,  v135,  3LL));
  v150[6] = v46;
  v149[7] = @"zip-code";
  v133[0] = @"isRequired";
  v133[1] = @"validationType";
  v134[0] = &__kCFBooleanFalse;
  v134[1] = &off_10001AAA0;
  v133[2] = @"destinationKey";
  v134[2] = @"OrganizationZipCode";
  v45 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v134,  v133,  3LL));
  v150[7] = v45;
  v149[8] = @"country";
  v131[0] = @"isRequired";
  v131[1] = @"validationType";
  v132[0] = &__kCFBooleanFalse;
  v132[1] = &off_10001AAA0;
  v131[2] = @"destinationKey";
  v132[2] = @"OrganizationCountry";
  v44 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v132,  v131,  3LL));
  v150[8] = v44;
  v149[9] = @"phone";
  v129[0] = @"isRequired";
  v129[1] = @"validationType";
  v130[0] = &__kCFBooleanFalse;
  v130[1] = &off_10001AAA0;
  v129[2] = @"destinationKey";
  v130[2] = @"OrganizationPhone";
  v43 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v130,  v129,  3LL));
  v150[9] = v43;
  v149[10] = @"magic";
  v127[0] = @"isRequired";
  v127[1] = @"validationType";
  v128[0] = &__kCFBooleanFalse;
  v128[1] = &off_10001AAA0;
  v127[2] = @"destinationKey";
  v128[2] = @"OrganizationMagic";
  v42 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v128,  v127,  3LL));
  v150[10] = v42;
  v149[11] = @"email";
  v125[0] = @"isRequired";
  v125[1] = @"validationType";
  v126[0] = &__kCFBooleanFalse;
  v126[1] = &off_10001AAA0;
  v125[2] = @"destinationKey";
  v126[2] = @"OrganizationEmail";
  v41 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v126,  v125,  3LL));
  v150[11] = v41;
  v149[12] = @"department";
  v123[0] = @"isRequired";
  v123[1] = @"validationType";
  v124[0] = &__kCFBooleanFalse;
  v124[1] = &off_10001AAA0;
  v123[2] = @"destinationKey";
  v124[2] = @"OrganizationDepartment";
  v40 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v124,  v123,  3LL));
  v150[12] = v40;
  v149[13] = @"support-phone-number";
  v121[0] = @"isRequired";
  v121[1] = @"validationType";
  v122[0] = &__kCFBooleanFalse;
  v122[1] = &off_10001AAA0;
  v121[2] = @"destinationKey";
  v122[2] = @"OrganizationSupportPhone";
  v39 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v122,  v121,  3LL));
  v150[13] = v39;
  v149[14] = @"support-email-address";
  v119[0] = @"isRequired";
  v119[1] = @"validationType";
  v120[0] = &__kCFBooleanFalse;
  v120[1] = &off_10001AAA0;
  v119[2] = @"destinationKey";
  v120[2] = @"OrganizationSupportEmail";
  uint64_t v38 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v120,  v119,  3LL));
  v150[14] = v38;
  v149[15] = @"vendor-id";
  v117[0] = @"isRequired";
  v117[1] = @"validationType";
  v118[0] = &__kCFBooleanFalse;
  v118[1] = &off_10001AAA0;
  v117[2] = @"destinationKey";
  v118[2] = @"OrganizationVendorID";
  v37 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v118,  v117,  3LL));
  v150[15] = v37;
  v36 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v150,  v149,  16LL));
  v152[1] = v36;
  v35 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v152,  v151,  2LL));
  v154[0] = v35;
  v153[1] = @"config";
  v116[0] = &__kCFBooleanFalse;
  v115[0] = @"isRequired";
  v115[1] = @"keyInfo";
  v113[0] = @"url";
  v111[0] = @"isRequired";
  v111[1] = @"validationType";
  v112[0] = &__kCFBooleanTrue;
  v112[1] = &off_10001AAB8;
  v111[2] = @"destinationKey";
  v112[2] = @"ConfigurationURL";
  v34 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v112,  v111,  3LL));
  v114[0] = v34;
  v113[1] = @"management-protocol-version";
  v109[0] = @"isRequired";
  v109[1] = @"validationType";
  v110[0] = &__kCFBooleanFalse;
  v110[1] = &off_10001AAD0;
  v109[2] = @"destinationKey";
  v110[2] = @"MDMProtocolVersion";
  v33 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v110,  v109,  3LL));
  v114[1] = v33;
  v113[2] = @"is-supervised";
  v107[0] = @"isRequired";
  v107[1] = @"validationType";
  v108[0] = &__kCFBooleanFalse;
  v108[1] = &off_10001AAE8;
  v107[2] = @"destinationKey";
  v108[2] = @"IsSupervised";
  v32 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v108,  v107,  3LL));
  v114[2] = v32;
  v113[3] = @"allow-pairing";
  v105[0] = @"isRequired";
  v105[1] = @"validationType";
  v106[0] = &__kCFBooleanFalse;
  v106[1] = &off_10001AAE8;
  v105[2] = @"destinationKey";
  v106[2] = @"AllowPairing";
  v31 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v106,  v105,  3LL));
  v114[3] = v31;
  v113[4] = @"is-mandatory";
  v103[0] = @"isRequired";
  v103[1] = @"validationType";
  v104[0] = &__kCFBooleanFalse;
  v104[1] = &off_10001AAE8;
  v103[2] = @"destinationKey";
  v104[2] = @"IsMandatory";
  v30 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v104,  v103,  3LL));
  v114[4] = v30;
  v113[5] = @"is-mdm-removable";
  v101[0] = @"isRequired";
  v101[1] = @"validationType";
  v102[0] = &__kCFBooleanFalse;
  v102[1] = &off_10001AB00;
  v101[2] = @"destinationKey";
  v102[2] = @"IsMDMUnremovable";
  v29 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v102,  v101,  3LL));
  v114[5] = v29;
  v113[6] = @"sysdiagnose-upload-url";
  v99[0] = @"isRequired";
  v99[1] = @"validationType";
  v100[0] = &__kCFBooleanFalse;
  v100[1] = &off_10001AAB8;
  v99[2] = @"destinationKey";
  v100[2] = @"DiagnosticsUploadURL";
  v28 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v100,  v99,  3LL));
  v114[6] = v28;
  v113[7] = @"anchor-certs";
  v97[0] = @"isRequired";
  v97[1] = @"validationType";
  v98[0] = &__kCFBooleanFalse;
  v98[1] = &off_10001AB18;
  v97[2] = @"destinationKey";
  v98[2] = @"AnchorCertificates";
  v27 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v98,  v97,  3LL));
  v114[7] = v27;
  v113[8] = @"supervision-host-certs";
  v95[0] = @"isRequired";
  v95[1] = @"validationType";
  v96[0] = &__kCFBooleanFalse;
  v96[1] = &off_10001AB18;
  v95[2] = @"destinationKey";
  v96[2] = @"SupervisorHostCertificates";
  v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v96,  v95,  3LL));
  v114[8] = v26;
  v113[9] = @"skip-buddy-items";
  v93[0] = @"isRequired";
  v93[1] = @"validationType";
  v94[0] = &__kCFBooleanFalse;
  v94[1] = &off_10001AB30;
  v93[2] = @"destinationKey";
  v94[2] = @"SkipSetup";
  v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v94,  v93,  3LL));
  v114[9] = v25;
  v113[10] = @"is-multi-user";
  v91[0] = @"isRequired";
  v91[1] = @"validationType";
  v92[0] = &__kCFBooleanFalse;
  v92[1] = &off_10001AAE8;
  v91[2] = @"destinationKey";
  v92[2] = @"IsMultiUser";
  v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v92,  v91,  3LL));
  v114[10] = v24;
  v113[11] = @"await-device-configured";
  v89[0] = @"isRequired";
  v89[1] = @"validationType";
  v90[0] = &__kCFBooleanFalse;
  v90[1] = &off_10001AAE8;
  v89[2] = @"destinationKey";
  v90[2] = @"AwaitDeviceConfigured";
  v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v90,  v89,  3LL));
  v114[11] = v23;
  v113[12] = @"auto-advance-setup";
  v87[0] = @"isRequired";
  v87[1] = @"validationType";
  v88[0] = &__kCFBooleanFalse;
  v88[1] = &off_10001AAE8;
  v87[2] = @"destinationKey";
  v88[2] = @"AutoAdvanceSetup";
  v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v88,  v87,  3LL));
  v114[12] = v22;
  v113[13] = @"language";
  v85[0] = @"isRequired";
  v85[1] = @"validationType";
  v86[0] = &__kCFBooleanFalse;
  v86[1] = &off_10001AAA0;
  v85[2] = @"destinationKey";
  v86[2] = @"Language";
  v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v86,  v85,  3LL));
  v114[13] = v21;
  v113[14] = @"region";
  v83[0] = @"isRequired";
  v83[1] = @"validationType";
  v84[0] = &__kCFBooleanFalse;
  v84[1] = &off_10001AAA0;
  v83[2] = @"destinationKey";
  v84[2] = @"Region";
  __int128 v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v84,  v83,  3LL));
  v114[14] = v20;
  v113[15] = @"script";
  v81[0] = @"isRequired";
  v81[1] = @"validationType";
  v82[0] = &__kCFBooleanFalse;
  v82[1] = &off_10001AAA0;
  v81[2] = @"destinationKey";
  v82[2] = @"Script";
  __int128 v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v82,  v81,  3LL));
  v114[15] = v19;
  v113[16] = @"configuration-web-url";
  v79[0] = @"isRequired";
  v79[1] = @"validationType";
  v80[0] = &__kCFBooleanFalse;
  v80[1] = &off_10001AAA0;
  v79[2] = @"destinationKey";
  v80[2] = @"ConfigurationWebURL";
  __int128 v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v80,  v79,  3LL));
  v113[17] = @"enrollment-server";
  v78[0] = &__kCFBooleanFalse;
  v78[1] = &off_10001AB48;
  v114[16] = v18;
  v78[2] = @"EnrollmentServer";
  v77[0] = @"isRequired";
  v77[1] = @"validationType";
  v77[2] = @"destinationKey";
  v77[3] = @"subKey";
  v75[0] = @"enrollment-url";
  v73[0] = @"isRequired";
  v73[1] = @"validationType";
  v74[0] = &__kCFBooleanTrue;
  v74[1] = &off_10001AAB8;
  v73[2] = @"destinationKey";
  v74[2] = @"EnrollmentURL";
  __int128 v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v74,  v73,  3LL));
  v76[0] = v17;
  v75[1] = @"enrollment-anchor-certificates";
  v71[0] = @"isRequired";
  v71[1] = @"validationType";
  v72[0] = &__kCFBooleanFalse;
  v72[1] = &off_10001AB18;
  v71[2] = @"destinationKey";
  v72[2] = @"EnrollmentAnchorCertificates";
  int v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v72,  v71,  3LL));
  v76[1] = v16;
  v75[2] = @"supported-features";
  v69[0] = @"isRequired";
  v69[1] = @"validationType";
  v70[0] = &__kCFBooleanFalse;
  v70[1] = &off_10001AB60;
  v69[2] = @"destinationKey";
  v70[2] = @"SupportedFeatures";
  id v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v70,  v69,  3LL));
  v76[2] = v15;
  int v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v76,  v75,  3LL));
  v78[3] = v14;
  v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v78,  v77,  4LL));
  v114[17] = v13;
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v114,  v113,  18LL));
  v116[1] = v12;
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v116,  v115,  2LL));
  v154[1] = v11;
  v153[2] = @"enrollment";
  v68[0] = &__kCFBooleanFalse;
  v67[0] = @"isRequired";
  v67[1] = @"keyInfo";
  v65 = @"expiry";
  v63[0] = @"isRequired";
  v63[1] = @"validationType";
  v64[0] = &__kCFBooleanTrue;
  v64[1] = &off_10001AAD0;
  v63[2] = @"destinationKey";
  v64[2] = @"ProvisionalEnrollmentExpiry";
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v64,  v63,  3LL));
  v66 = v1;
  v2 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v66,  &v65,  1LL));
  v68[1] = v2;
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v68,  v67,  2LL));
  v154[2] = v3;
  v153[3] = @"user";
  v62[0] = &__kCFBooleanFalse;
  v61[0] = @"isRequired";
  v61[1] = @"keyInfo";
  v59[0] = @"token";
  v57[0] = @"isRequired";
  v57[1] = @"validationType";
  v57[2] = @"destinationKey";
  v58[0] = &__kCFBooleanTrue;
  v58[1] = &off_10001AAA0;
  v58[2] = @"UserToken";
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v58,  v57,  3LL));
  v60[0] = v4;
  v59[1] = @"ft_maid";
  v55[0] = @"isRequired";
  v55[1] = @"validationType";
  v56[0] = &__kCFBooleanFalse;
  v56[1] = &off_10001AAA0;
  v55[2] = @"destinationKey";
  v56[2] = @"MAIDUsername";
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v56,  v55,  3LL));
  v60[1] = v5;
  v59[2] = @"ft_token";
  v53[0] = @"isRequired";
  v53[1] = @"validationType";
  v54[0] = &__kCFBooleanFalse;
  v54[1] = &off_10001AB78;
  v53[2] = @"destinationKey";
  v54[2] = @"MAIDHasCredential";
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v54,  v53,  3LL));
  v60[2] = v6;
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v60,  v59,  3LL));
  v62[1] = v7;
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v62,  v61,  2LL));
  v154[3] = v8;
  uint64_t v9 = objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v154,  v153,  4LL));
  uint64_t v10 = (void *)qword_100021620;
  qword_100021620 = v9;
}

uint64_t start(uint64_t a1, uint64_t a2)
{
  v2 = *(os_log_s **)(DEPLogObjects(a1, a2) + 8);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "service starting...", buf, 2u);
  }

  uint64_t v3 = objc_alloc_init(&OBJC_CLASS___CCDServer);
  id v5 = (void *)objc_opt_new(&OBJC_CLASS___CCDGatekeeper, v4);
  [v5 setServer:v3];
  id v6 = objc_alloc(&OBJC_CLASS___NSXPCListener);
  id v7 = -[NSXPCListener initWithMachServiceName:](v6, "initWithMachServiceName:", kCCServiceName);
  id v8 = -[NSXPCListener setDelegate:](v7, "setDelegate:", v5);
  uint64_t v10 = *(os_log_s **)(DEPLogObjects(v8, v9) + 8);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v16 = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "awaiting connections...", v16, 2u);
  }

  -[NSXPCListener resume](v7, "resume");
  CFRunLoopRun();
  id v11 = -[NSXPCListener invalidate](v7, "invalidate");
  v13 = *(os_log_s **)(DEPLogObjects(v11, v12) + 8);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v15 = 0;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "service stopping.", v15, 2u);
  }

  return 0LL;
}

id objc_msgSend__newQueryWithService_account_label_description_group_useSystemKeychain_outError_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_newQueryWithService:account:label:description:group:useSystemKeychain:outError:");
}

id objc_msgSend_dataFromService_account_label_description_group_useSystemKeychain_outError_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataFromService:account:label:description:group:useSystemKeychain:outError:");
}

id objc_msgSend_retrieveDeviceUploadSoldToIdsForOrganization_credentials_completionBlock_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "retrieveDeviceUploadSoldToIdsForOrganization:credentials:completionBlock:");
}

id objc_msgSend_setData_forService_account_label_description_access_group_useSystemKeychain_sysBound_outError_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "setData:forService:account:label:description:access:group:useSystemKeychain:sysBound:outError:");
}

id objc_msgSend_willChangeValueForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "willChangeValueForKey:");
}
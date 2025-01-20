@interface AKStrongDeviceIdentitySigner
+ (id)sharedSigner;
- (AKStrongDeviceIdentifying)strongDeviceIdentifying;
- (AKStrongDeviceIdentitySigner)initWithStrongDeviceIdentifying:(id)a3;
- (BOOL)_chanceInOptionsCountUsingTenExponent:(unint64_t)a3;
- (BOOL)_shouldPostAnalyticsWithSamplingRate:(unint64_t)a3;
- (OS_dispatch_queue)reportingQueue;
- (OS_dispatch_queue)signingQueue;
- (id)_digestForSigningWithBody:(id)a3 header:(id)a4;
- (id)_headersToSignFromRequestData:(id)a3;
- (void)_baaV1HeadersForRequestData:(id)a3 completion:(id)a4;
- (void)_hostSignData:(id)a3 signatureKey:(id)a4 completion:(id)a5;
- (void)_hostSignDataList:(id)a3 completion:(id)a4;
- (void)_machineSignDataList:(id)a3 completion:(id)a4;
- (void)_reportBAASigningForEvent:(id)a3;
- (void)_shouldExcludeHostVIPForRequestData:(id)a3 completion:(id)a4;
- (void)_updateAnalyticsEvent:(id)a3 withError:(id)a4;
- (void)attestationDataForOSVersionWithContext:(id)a3 attestationNonce:(id)a4 completion:(id)a5;
- (void)baaV1HeadersForRequestData:(id)a3 completion:(id)a4;
- (void)resetDeviceIdentityWithCompletion:(id)a3;
- (void)setReportingQueue:(id)a3;
- (void)setSigningQueue:(id)a3;
- (void)setStrongDeviceIdentifying:(id)a3;
- (void)signData:(id)a3 completion:(id)a4;
@end

@implementation AKStrongDeviceIdentitySigner

- (AKStrongDeviceIdentitySigner)initWithStrongDeviceIdentifying:(id)a3
{
  id v5 = a3;
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___AKStrongDeviceIdentitySigner;
  v6 = -[AKStrongDeviceIdentitySigner init](&v17, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_strongDeviceIdentifying, a3);
    dispatch_queue_attr_t v8 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v9 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v8);
    dispatch_queue_t v10 = dispatch_queue_create("com.apple.authkit.AKStrongDeviceIdentitySigner", v9);
    signingQueue = v7->_signingQueue;
    v7->_signingQueue = (OS_dispatch_queue *)v10;

    dispatch_queue_attr_t v12 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v13 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v12);
    dispatch_queue_t v14 = dispatch_queue_create("com.apple.authkit.baa.reporting", v13);
    reportingQueue = v7->_reportingQueue;
    v7->_reportingQueue = (OS_dispatch_queue *)v14;
  }

  return v7;
}

+ (id)sharedSigner
{
  if (qword_10020F2F8 != -1) {
    dispatch_once(&qword_10020F2F8, &stru_1001C6CD0);
  }
  return (id)qword_10020F2F0;
}

- (id)_headersToSignFromRequestData:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue([a3 headers]);
  if ([v3 count])
  {
    id v4 = [v3 mutableCopy];
    id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    __int128 v20 = 0u;
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "allKeys", 0));
    id v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v18;
      do
      {
        dispatch_queue_t v10 = 0LL;
        do
        {
          if (*(void *)v18 != v9) {
            objc_enumerationMutation(v6);
          }
          v11 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v17 + 1) + 8 * (void)v10) lowercaseString]);
          [v5 addObject:v11];

          dispatch_queue_t v10 = (char *)v10 + 1;
        }

        while (v8 != v10);
        id v8 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }

      while (v8);
    }

    dispatch_queue_attr_t v12 = (void *)objc_claimAutoreleasedReturnValue([v5 sortedArrayUsingSelector:"caseInsensitiveCompare:"]);
    v13 = (void *)objc_claimAutoreleasedReturnValue([v12 componentsJoinedByString:@":"]);
    [v4 setObject:v13 forKey:AKRequestSigningHeaderSignedHeadersKey];
  }

  else
  {
    id v4 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  }

  dispatch_queue_t v14 = (void *)objc_claimAutoreleasedReturnValue(+[AKBAATimeProvider sharedInstance](&OBJC_CLASS___AKBAATimeProvider, "sharedInstance"));
  v15 = (void *)objc_claimAutoreleasedReturnValue([v14 adjustedDeviceTime]);

  [v4 setObject:v15 forKey:AKRequestSigningHeaderClientTimeKey];
  [v4 setObject:AKRequestSigningHeaderVersionValue forKey:AKRequestSigningHeaderVersionKey];

  return v4;
}

- (void)baaV1HeadersForRequestData:(id)a3 completion:(id)a4
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_10001B164;
  v8[3] = &unk_1001C6CF8;
  id v9 = a3;
  id v10 = a4;
  v8[4] = self;
  id v6 = v9;
  id v7 = v10;
  -[AKStrongDeviceIdentitySigner _shouldExcludeHostVIPForRequestData:completion:]( self,  "_shouldExcludeHostVIPForRequestData:completion:",  v6,  v8);
}

- (void)_baaV1HeadersForRequestData:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v40 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue( -[AKStrongDeviceIdentitySigner _headersToSignFromRequestData:]( self,  "_headersToSignFromRequestData:",  v6));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 bodyDataHash]);
  v42 = (void *)objc_claimAutoreleasedReturnValue( -[AKStrongDeviceIdentitySigner _digestForSigningWithBody:header:]( self,  "_digestForSigningWithBody:header:",  v8,  v7));

  v41 = (void *)objc_claimAutoreleasedReturnValue( -[AKStrongDeviceIdentitySigner _digestForSigningWithBody:header:]( self,  "_digestForSigningWithBody:header:",  0LL,  v7));
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[AKDevice currentDevice](&OBJC_CLASS___AKDevice, "currentDevice"));
  unsigned int v10 = [v9 isInternalBuild];

  if (v10)
  {
    dispatch_queue_attr_t v12 = (void *)objc_claimAutoreleasedReturnValue([v42 base64EncodedStringWithOptions:0]);
    [v7 setValue:v12 forKey:AKRequestSigningHeaderInternalDigestKey];

    v13 = (void *)objc_claimAutoreleasedReturnValue([v41 base64EncodedStringWithOptions:0]);
    [v7 setValue:v13 forKey:AKRequestSigningHeaderAltInternalDigestKey];

    dispatch_queue_t v14 = (void *)objc_claimAutoreleasedReturnValue(+[AKConfiguration sharedConfiguration](&OBJC_CLASS___AKConfiguration, "sharedConfiguration"));
    v15 = (void *)objc_claimAutoreleasedReturnValue([v14 configurationValueForKey:@"_AKConfigKeyVMType"]);
    v16 = (void *)objc_claimAutoreleasedReturnValue([v15 stringValue]);

    if (v16) {
      [v7 setValue:v16 forKey:AKVMTypeHeaderKey];
    }
  }

  uint64_t v17 = _AKLogSystem(v11);
  __int128 v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
    sub_10012DE00();
  }

  uint64_t v19 = _AKSignpostLogSystem([v7 setValue:@"1" forKey:AKRequestSigningHeaderFeatureHeadersKey]);
  __int128 v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
  uint64_t v21 = _AKSignpostCreate();
  uint64_t v39 = v22;
  os_signpost_id_t v23 = v21;

  uint64_t v25 = _AKSignpostLogSystem(v24);
  v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
  v27 = v26;
  if (v23 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v26))
  {
    LOWORD(buf) = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v27,  OS_SIGNPOST_INTERVAL_BEGIN,  v23,  "BAASigning",  " enableTelemetry=YES ",  (uint8_t *)&buf,  2u);
  }

  uint64_t v29 = _AKSignpostLogSystem(v28);
  v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 134217984;
    *(void *)((char *)&buf + 4) = v23;
    _os_log_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_DEFAULT,  "BEGIN [%lld]: BAASigning  enableTelemetry=YES ",  (uint8_t *)&buf,  0xCu);
  }

  *(void *)&__int128 buf = 0LL;
  *((void *)&buf + 1) = &buf;
  uint64_t v69 = 0x3032000000LL;
  v70 = sub_10001B700;
  v71 = sub_10001B710;
  id v72 = 0LL;
  v64[0] = 0LL;
  v64[1] = v64;
  v64[2] = 0x3032000000LL;
  v64[3] = sub_10001B700;
  v64[4] = sub_10001B710;
  id v65 = 0LL;
  v62[0] = 0LL;
  v62[1] = v62;
  v62[2] = 0x3032000000LL;
  v62[3] = sub_10001B700;
  v62[4] = sub_10001B710;
  id v63 = 0LL;
  v60[0] = 0LL;
  v60[1] = v60;
  v60[2] = 0x3032000000LL;
  v60[3] = sub_10001B700;
  v60[4] = sub_10001B710;
  id v61 = 0LL;
  v31 = dispatch_group_create();
  dispatch_group_enter(v31);
  v67[0] = v42;
  v67[1] = v41;
  v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v67, 2LL));
  v56[0] = _NSConcreteStackBlock;
  v56[1] = 3221225472LL;
  v56[2] = sub_10001B718;
  v56[3] = &unk_1001C6D20;
  v58 = v62;
  p___int128 buf = &buf;
  v33 = v31;
  v57 = v33;
  -[AKStrongDeviceIdentitySigner _machineSignDataList:completion:](self, "_machineSignDataList:completion:", v32, v56);

  dispatch_group_enter(v33);
  v66[0] = v42;
  v66[1] = v41;
  v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v66, 2LL));
  v52[0] = _NSConcreteStackBlock;
  v52[1] = 3221225472LL;
  v52[2] = sub_10001B7A0;
  v52[3] = &unk_1001C6D20;
  v54 = v60;
  v55 = v64;
  v35 = v33;
  v53 = v35;
  -[AKStrongDeviceIdentitySigner _hostSignDataList:completion:](self, "_hostSignDataList:completion:", v34, v52);

  signingQueue = (dispatch_queue_s *)self->_signingQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10001B828;
  block[3] = &unk_1001C6D48;
  v46 = &buf;
  v47 = v64;
  v48 = v62;
  v49 = v60;
  os_signpost_id_t v50 = v23;
  uint64_t v51 = v39;
  id v44 = v7;
  id v45 = v40;
  id v37 = v40;
  id v38 = v7;
  dispatch_group_notify(v35, signingQueue, block);

  _Block_object_dispose(v60, 8);
  _Block_object_dispose(v62, 8);

  _Block_object_dispose(v64, 8);
  _Block_object_dispose(&buf, 8);
}

- (void)_machineSignDataList:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14[0] = 0LL;
  v14[1] = v14;
  v14[2] = 0x3032000000LL;
  v14[3] = sub_10001B700;
  v14[4] = sub_10001B710;
  id v15 = (id)objc_claimAutoreleasedReturnValue( +[AAFAnalyticsEvent ak_analyticsEventWithEventName:error:]( &OBJC_CLASS___AAFAnalyticsEvent,  "ak_analyticsEventWithEventName:error:",  @"com.apple.authkit.baa.signing",  0LL));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_10001BB18;
  v10[3] = &unk_1001C6D70;
  v13 = v14;
  v10[4] = self;
  id v8 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  id v11 = v8;
  id v9 = v7;
  id v12 = v9;
  -[AKStrongDeviceIdentitySigner signData:completion:](self, "signData:completion:", v6, v10);

  _Block_object_dispose(v14, 8);
}

- (void)_hostSignDataList:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 count];
  if (v8 == (id)2)
  {
    v40[0] = 0LL;
    v40[1] = v40;
    v40[2] = 0x3032000000LL;
    v40[3] = sub_10001B700;
    v40[4] = sub_10001B710;
    id v41 = 0LL;
    v38[0] = 0LL;
    v38[1] = v38;
    v38[2] = 0x3032000000LL;
    v38[3] = sub_10001B700;
    v38[4] = sub_10001B710;
    id v39 = 0LL;
    id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    unsigned int v10 = dispatch_group_create();
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v6 objectAtIndexedSubscript:0]);
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v6 objectAtIndexedSubscript:1]);
    dispatch_group_enter(v10);
    uint64_t v13 = AKRequestSigningHeaderHostAltSignatureKey;
    v34[0] = _NSConcreteStackBlock;
    v34[1] = 3221225472LL;
    v34[2] = sub_10001C21C;
    v34[3] = &unk_1001C6D98;
    id v37 = v38;
    id v14 = v9;
    id v35 = v14;
    id v15 = v10;
    v36 = v15;
    -[AKStrongDeviceIdentitySigner _hostSignData:signatureKey:completion:]( self,  "_hostSignData:signatureKey:completion:",  v12,  v13,  v34);
    if (([v12 isEqual:v11] & 1) == 0)
    {
      dispatch_group_enter(v15);
      uint64_t v16 = AKRequestSigningHeaderHostSignatureKey;
      v30[0] = _NSConcreteStackBlock;
      v30[1] = 3221225472LL;
      v30[2] = sub_10001C290;
      v30[3] = &unk_1001C6D98;
      v33 = v40;
      id v31 = v14;
      v32 = v15;
      -[AKStrongDeviceIdentitySigner _hostSignData:signatureKey:completion:]( self,  "_hostSignData:signatureKey:completion:",  v11,  v16,  v30);
    }

    signingQueue = (dispatch_queue_s *)self->_signingQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10001C304;
    block[3] = &unk_1001C6DC0;
    uint64_t v28 = v40;
    uint64_t v29 = v38;
    id v24 = v14;
    id v25 = v12;
    id v26 = v11;
    id v27 = v7;
    id v18 = v11;
    id v19 = v12;
    id v20 = v14;
    dispatch_group_notify(v15, signingQueue, block);

    _Block_object_dispose(v38, 8);
    _Block_object_dispose(v40, 8);
  }

  else
  {
    uint64_t v21 = _AKLogSystem(v8);
    uint64_t v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      sub_10012DE58();
    }

    (*((void (**)(id, void, void))v7 + 2))(v7, 0LL, 0LL);
  }
}

- (void)_hostSignData:(id)a3 signatureKey:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[AKDevice currentDevice](&OBJC_CLASS___AKDevice, "currentDevice"));
  unsigned __int8 v12 = [v11 isVirtualMachine];

  if ((v12 & 1) != 0)
  {
    uint64_t v14 = _AKLogSystem(v13);
    id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
      sub_10012DE84((uint64_t)v9, v15, v16, v17, v18, v19, v20, v21);
    }

    uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue( +[AAFAnalyticsEvent ak_analyticsEventWithEventName:error:]( &OBJC_CLASS___AAFAnalyticsEvent,  "ak_analyticsEventWithEventName:error:",  @"com.apple.authkit.baa.signing.host",  0LL));
    uint64_t v23 = _AKSignpostLogSystem(v22);
    id v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
    os_signpost_id_t v25 = _AKSignpostCreate();
    uint64_t v27 = v26;

    uint64_t v29 = _AKSignpostLogSystem(v28);
    v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
    id v31 = v30;
    if (v25 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v30))
    {
      *(_WORD *)__int128 buf = 0;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v31,  OS_SIGNPOST_INTERVAL_BEGIN,  v25,  "VMHostBAASigning",  " enableTelemetry=YES ",  buf,  2u);
    }

    uint64_t v33 = _AKSignpostLogSystem(v32);
    v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 134217984;
      os_signpost_id_t v45 = v25;
      _os_log_impl( (void *)&_mh_execute_header,  v34,  OS_LOG_TYPE_DEFAULT,  "BEGIN [%lld]: VMHostBAASigning  enableTelemetry=YES ",  buf,  0xCu);
    }

    id v35 = (void *)objc_claimAutoreleasedReturnValue(-[AKStrongDeviceIdentitySigner strongDeviceIdentifying](self, "strongDeviceIdentifying"));
    v37[0] = _NSConcreteStackBlock;
    v37[1] = 3221225472LL;
    v37[2] = sub_10001C628;
    v37[3] = &unk_1001C6DE8;
    id v38 = v22;
    id v39 = self;
    id v40 = v9;
    os_signpost_id_t v42 = v25;
    uint64_t v43 = v27;
    id v41 = v10;
    id v36 = v22;
    [v35 createHostSignatureForData:v8 completion:v37];
  }

  else
  {
    (*((void (**)(id, void, void))v10 + 2))(v10, 0LL, 0LL);
  }
}

- (void)signData:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 count])
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[AKStrongDeviceIdentitySigner strongDeviceIdentifying](self, "strongDeviceIdentifying"));
    [v8 createBAASignatureForDataFields:v6 completion:v7];
LABEL_7:

    goto LABEL_8;
  }

  uint64_t v9 = _AKLogSystem(0LL);
  id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
    sub_10012DF14();
  }

  if (v7)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  AKGenericErrorDomain,  -17003LL,  0LL));
    (*((void (**)(id, void, void, void, void *))v7 + 2))(v7, 0LL, 0LL, 0LL, v8);
    goto LABEL_7;
  }

- (void)attestationDataForOSVersionWithContext:(id)a3 attestationNonce:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = (id)objc_claimAutoreleasedReturnValue(-[AKStrongDeviceIdentitySigner strongDeviceIdentifying](self, "strongDeviceIdentifying"));
  [v11 createOSAttestationDataWithContext:v10 attestationNonce:v9 completion:v8];
}

- (id)_digestForSigningWithBody:(id)a3 header:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 length] || objc_msgSend(v6, "count"))
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    id v8 = v7;
    id v30 = v5;
    if (v5)
    {
      id v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "aaf_toHexString"));
      id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 lowercaseString]);

      [v8 addObject:v10];
    }

    else
    {
      [v7 addObject:&stru_1001D1450];
    }

    id v29 = v6;
    id v11 = [v6 mutableCopy];
    unsigned __int8 v12 = (void *)objc_claimAutoreleasedReturnValue([v11 allKeys]);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v12 sortedArrayUsingSelector:"caseInsensitiveCompare:"]);
    id v14 = [v13 mutableCopy];

    __int128 v34 = 0u;
    __int128 v35 = 0u;
    __int128 v32 = 0u;
    __int128 v33 = 0u;
    id obj = v14;
    id v15 = [obj countByEnumeratingWithState:&v32 objects:v36 count:16];
    if (v15)
    {
      id v16 = v15;
      uint64_t v17 = *(void *)v33;
      do
      {
        for (i = 0LL; i != v16; i = (char *)i + 1)
        {
          if (*(void *)v33 != v17) {
            objc_enumerationMutation(obj);
          }
          uint64_t v19 = *(void **)(*((void *)&v32 + 1) + 8LL * (void)i);
          uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v19 lowercaseString]);
          uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:v19]);
          uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSCharacterSet whitespaceCharacterSet]( &OBJC_CLASS___NSCharacterSet,  "whitespaceCharacterSet"));
          uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([v21 stringByTrimmingCharactersInSet:v22]);

          id v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@=%@",  v20,  v23));
          [v8 addObject:v24];
        }

        id v16 = [obj countByEnumeratingWithState:&v32 objects:v36 count:16];
      }

      while (v16);
    }

    os_signpost_id_t v25 = (void *)objc_claimAutoreleasedReturnValue([v8 componentsJoinedByString:@"|"]);
    uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue([v25 dataUsingEncoding:4]);
    uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "ak_SHA256Data"));

    id v6 = v29;
    id v5 = v30;
  }

  else
  {
    uint64_t v27 = 0LL;
  }

  return v27;
}

- (void)resetDeviceIdentityWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[AKStrongDeviceIdentitySigner strongDeviceIdentifying](self, "strongDeviceIdentifying"));
  [v5 resetDeviceIdentityWithCompletion:v4];
}

- (void)_shouldExcludeHostVIPForRequestData:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = (void (**)(id, uint64_t))a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 requestURL]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 host]);

  if ([v8 length])
  {
    __int128 v26 = 0u;
    __int128 v27 = 0u;
    __int128 v24 = 0u;
    __int128 v25 = 0u;
    id v9 = [&off_1001D9210 countByEnumeratingWithState:&v24 objects:v30 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v25;
      while (2)
      {
        unsigned __int8 v12 = 0LL;
        do
        {
          if (*(void *)v25 != v11) {
            objc_enumerationMutation(&off_1001D9210);
          }
          if ([v8 hasSuffix:*(void *)(*((void *)&v24 + 1) + 8 * (void)v12)])
          {
            id v14 = (void *)objc_claimAutoreleasedReturnValue(+[AKConfiguration sharedConfiguration](&OBJC_CLASS___AKConfiguration, "sharedConfiguration"));
            id v15 = [v14 shouldEnableAttestationLogging];

            if (v15)
            {
              uint64_t v17 = _AKLogSystem(v16);
              uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
              if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
              {
                uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v5 requestURL]);
                *(_DWORD *)__int128 buf = 138412290;
                id v29 = v19;
                _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "Excluding from attestation. URL - %@",  buf,  0xCu);
              }
            }

            v6[2](v6, 1LL);
            goto LABEL_17;
          }

          unsigned __int8 v12 = (char *)v12 + 1;
        }

        while (v10 != v12);
        id v10 = [&off_1001D9210 countByEnumeratingWithState:&v24 objects:v30 count:16];
        if (v10) {
          continue;
        }
        break;
      }
    }

    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[AKURLBag sharedBag](&OBJC_CLASS___AKURLBag, "sharedBag"));
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472LL;
    v20[2] = sub_10001CFF4;
    v20[3] = &unk_1001C6E10;
    uint64_t v23 = v6;
    id v21 = v8;
    id v22 = v5;
    [v13 configurationValueForKey:@"baa-attestation-exclusion-vip" fromCache:1 completion:v20];
  }

  else
  {
    v6[2](v6, 0LL);
  }

- (void)_reportBAASigningForEvent:(id)a3
{
  id v4 = a3;
  reportingQueue = (dispatch_queue_s *)self->_reportingQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10001D280;
  v7[3] = &unk_1001C6538;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(reportingQueue, v7);
}

- (void)_updateAnalyticsEvent:(id)a3 withError:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[AKDevice currentDevice](&OBJC_CLASS___AKDevice, "currentDevice"));
  unsigned int v8 = [v7 isInternalBuild];

  if (v8)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "ak_allUnderlyingErrors"));
    id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    __int128 v20 = 0u;
    __int128 v21 = 0u;
    id v11 = v9;
    id v12 = [v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void *)v19;
      do
      {
        id v15 = 0LL;
        do
        {
          if (*(void *)v19 != v14) {
            objc_enumerationMutation(v11);
          }
          uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( *(id *)(*((void *)&v18 + 1) + 8 * (void)v15),  "localizedDescription",  (void)v18));
          [v10 addObject:v16];

          id v15 = (char *)v15 + 1;
        }

        while (v13 != v15);
        id v13 = [v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }

      while (v13);
    }

    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v10 componentsJoinedByString:@"<<"]);
    [v5 setObject:v17 forKeyedSubscript:kAAFTestSignatureString];
  }
}

- (BOOL)_shouldPostAnalyticsWithSamplingRate:(unint64_t)a3
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[AKConfiguration sharedConfiguration](&OBJC_CLASS___AKConfiguration, "sharedConfiguration"));
  id v6 = [v5 lastKnownIDMSEnvironment];

  if (v6)
  {
    uint64_t v8 = _AKLogSystem(v7);
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      sub_10012E034(v9, v10, v11, v12, v13, v14, v15, v16);
    }

    return 0;
  }

  if (!a3) {
    return 0;
  }
  __int128 v18 = (void *)objc_claimAutoreleasedReturnValue(+[AKDevice currentDevice](&OBJC_CLASS___AKDevice, "currentDevice"));
  unsigned __int8 v19 = [v18 isInternalBuild];

  if ((v19 & 1) != 0) {
    return 1;
  }
  else {
    return -[AKStrongDeviceIdentitySigner _chanceInOptionsCountUsingTenExponent:]( self,  "_chanceInOptionsCountUsingTenExponent:",  a3);
  }
}

- (BOOL)_chanceInOptionsCountUsingTenExponent:(unint64_t)a3
{
  if (!a3) {
    return 0;
  }
  double v3 = __exp10((double)a3);
  return arc4random_uniform((unint64_t)v3) == 0;
}

- (AKStrongDeviceIdentifying)strongDeviceIdentifying
{
  return self->_strongDeviceIdentifying;
}

- (void)setStrongDeviceIdentifying:(id)a3
{
}

- (OS_dispatch_queue)signingQueue
{
  return self->_signingQueue;
}

- (void)setSigningQueue:(id)a3
{
}

- (OS_dispatch_queue)reportingQueue
{
  return self->_reportingQueue;
}

- (void)setReportingQueue:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
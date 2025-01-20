@interface DTODRResourceStatus
+ (void)registerCapabilities:(id)a3;
- (id)ODRGetBandwidth;
- (id)ODRPurgeResourcesForBundleIdentifier:(id)a3;
- (id)ODRPurgeTagID:(id)a3 forBundleIdentifier:(id)a4;
- (id)ODRSetBandwidth:(id)a3;
- (id)_uncachedValueForKey:(__CFString *)a3 atURL:(id)a4;
- (id)bundleIDForPID:(int)a3;
- (id)sampleAttributes:(id)a3 forPIDs:(id)a4;
- (id)supportedAttributes;
- (void)_ODRPurgeResourcesForBundleIdentifier:(id)a3 tagID:(id)a4 finishBlock:(id)a5;
- (void)captureAttributes:(id)a3 toDictionary:(id)a4 forPID:(id)a5 completed:(id)a6;
@end

@implementation DTODRResourceStatus

+ (void)registerCapabilities:(id)a3
{
  id v4 = a3;
  [v4 publishCapability:@"com.apple.xcode.debug-gauge-data-providers.resources" withVersion:1 forClass:a1];
  [v4 publishCapability:@"com.apple.xcode.resource-control" withVersion:1 forClass:a1];
}

- (id)supportedAttributes
{
  if (qword_8920 != -1) {
    dispatch_once(&qword_8920, &stru_4238);
  }
  return (id)qword_8918;
}

- (id)_uncachedValueForKey:(__CFString *)a3 atURL:(id)a4
{
  CFBundleRef v5 = CFBundleCreate(0LL, (CFURLRef)a4);
  if (v5)
  {
    v6 = v5;
    _CFBundleFlushBundleCaches();
    CFTypeRef ValueForInfoDictionaryKey = CFBundleGetValueForInfoDictionaryKey(v6, a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue(ValueForInfoDictionaryKey);
    CFRelease(v6);
  }

  else
  {
    v8 = 0LL;
  }

  return v8;
}

- (id)bundleIDForPID:(int)a3
{
  if (proc_pidpath(a3, buffer, 0x1000u) < 1) {
    return 0LL;
  }
  uint64_t v4 = objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", buffer));
  if (!v4) {
    return 0LL;
  }
  CFBundleRef v5 = (void *)v4;
  v6 = 0LL;
  int v7 = -101;
  while ((unint64_t)[v5 length] >= 2 && !v6)
  {
    if (__CFADD__(v7++, 1))
    {
      v6 = 0LL;
      break;
    }

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", v5));
    if (v9) {
      v6 = (void *)objc_claimAutoreleasedReturnValue( -[DTODRResourceStatus _uncachedValueForKey:atURL:]( self,  "_uncachedValueForKey:atURL:",  kCFBundleIdentifierKey,  v9));
    }
    else {
      v6 = 0LL;
    }
    uint64_t v10 = objc_claimAutoreleasedReturnValue([v5 stringByDeletingLastPathComponent]);

    CFBundleRef v5 = (void *)v10;
    if (!v10) {
      break;
    }
  }

  return v6;
}

- (void)captureAttributes:(id)a3 toDictionary:(id)a4 forPID:(id)a5 completed:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  v12 = (void (**)(id, id, void))a6;
  if ([a3 containsObject:@"process.resources[]"])
  {
    id v13 = [v11 intValue];
    if ((int)v13 <= 0)
    {
      v55[0] = @"ODRTag_TagNameKey";
      v55[1] = @"ODRTag_StatusStringKey";
      v56[0] = @"Test Data 1";
      v56[1] = @"Transferring";
      v55[2] = @"ODRTag_StatusKey";
      v19 = +[NSNumber numberWithLong:](&OBJC_CLASS___NSNumber, "numberWithLong:", random() & 7);
      v41 = (void *)objc_claimAutoreleasedReturnValue(v19);
      v56[2] = v41;
      v55[3] = @"ODRTag_PercentageCompleteKey";
      *(float *)&double v20 = (float)((float)rand() * 4.6566e-10) * 100.0;
      v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:", v20));
      v55[4] = @"ODRTag_SizeKey";
      v56[3] = v40;
      v56[4] = @"10 KB";
      v39 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v56,  v55,  5LL));
      id v38 = [v39 mutableCopy];
      v57[0] = v38;
      v53[0] = @"ODRTag_TagNameKey";
      v53[1] = @"ODRTag_StatusStringKey";
      v54[0] = @"Test Data 2";
      v54[1] = @"In Use";
      v53[2] = @"ODRTag_StatusKey";
      v21 = +[NSNumber numberWithLong:](&OBJC_CLASS___NSNumber, "numberWithLong:", random() & 7);
      v37 = (void *)objc_claimAutoreleasedReturnValue(v21);
      v54[2] = v37;
      v54[3] = &off_4918;
      v53[3] = @"ODRTag_PercentageCompleteKey";
      v53[4] = @"ODRTag_SizeKey";
      v54[4] = @"412 KB";
      v36 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v54,  v53,  5LL));
      id v35 = [v36 mutableCopy];
      v57[1] = v35;
      v51[0] = @"ODRTag_TagNameKey";
      v51[1] = @"ODRTag_StatusStringKey";
      v52[0] = @"Test Data 4";
      v52[1] = @"Transfering";
      v51[2] = @"ODRTag_StatusKey";
      v22 = +[NSNumber numberWithLong:](&OBJC_CLASS___NSNumber, "numberWithLong:", random() & 7);
      v34 = (void *)objc_claimAutoreleasedReturnValue(v22);
      v52[2] = v34;
      v51[3] = @"ODRTag_PercentageCompleteKey";
      *(float *)&double v23 = (float)((float)rand() * 4.6566e-10) * 100.0;
      v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:", v23));
      v51[4] = @"ODRTag_SizeKey";
      v52[3] = v33;
      v52[4] = @"35 KB";
      v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v52,  v51,  5LL));
      id v25 = [v24 mutableCopy];
      v57[2] = v25;
      v49[0] = @"ODRTag_TagNameKey";
      v49[1] = @"ODRTag_StatusStringKey";
      v50[0] = @"Test Data 5";
      v50[1] = @"Transferring";
      v49[2] = @"ODRTag_StatusKey";
      v26 = +[NSNumber numberWithLong:](&OBJC_CLASS___NSNumber, "numberWithLong:", random() & 7);
      v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
      v50[2] = v27;
      v49[3] = @"ODRTag_PercentageCompleteKey";
      *(float *)&double v28 = (float)((float)rand() * 4.6566e-10) * 100.0;
      v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:", v28));
      v49[4] = @"ODRTag_SizeKey";
      v50[3] = v29;
      v50[4] = @"12 MB";
      v30 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v50,  v49,  5LL));
      id v31 = [v30 mutableCopy];
      v57[3] = v31;
      v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v57, 4LL));

      [v10 setObject:v32 forKeyedSubscript:@"process.resources[]"];
      v12[2](v12, v10, 0LL);
    }

    else
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[DTODRResourceStatus bundleIDForPID:](self, "bundleIDForPID:", v13));
      if (v14)
      {
        id v15 = sub_1688();
        v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
        v17 = (void *)objc_claimAutoreleasedReturnValue([v16 remoteObjectProxyWithErrorHandler:&stru_4278]);

        v47[0] = 0LL;
        v47[1] = v47;
        v47[2] = 0x3032000000LL;
        v47[3] = sub_1810;
        v47[4] = sub_1820;
        id v48 = v10;
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472LL;
        block[2] = sub_1828;
        block[3] = &unk_42E8;
        id v43 = v17;
        id v44 = v14;
        v46 = v47;
        v45 = v12;
        id v18 = v17;
        dispatch_sync(&_dispatch_main_q, block);

        _Block_object_dispose(v47, 8);
      }
    }
  }

  else
  {
    v12[2](v12, 0LL, 0LL);
  }
}

- (id)sampleAttributes:(id)a3 forPIDs:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  v9 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  memset(v29, 0, sizeof(v29));
  if ([v7 countByEnumeratingWithState:v29 objects:v30 count:16])
  {
    uint64_t v10 = **((void **)&v29[0] + 1);
    id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithCapacity:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithCapacity:",  32LL));
    [v11 setObject:v10 forKeyedSubscript:@"pid"];
    [v11 setObject:v8 forKeyedSubscript:@"time"];
    id v12 = objc_alloc_init(&OBJC_CLASS___DTXRemoteInvocationReceipt);
    id v13 = v9;
    dispatch_time_t v14 = dispatch_time(0LL, 10000000000LL);
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
    v16 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1C98;
    block[3] = &unk_4310;
    id v17 = v12;
    id v28 = v17;
    dispatch_time_t v18 = v14;
    v9 = v13;
    dispatch_after(v18, v16, block);

    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472LL;
    v23[2] = sub_1D68;
    v23[3] = &unk_4338;
    v24 = v13;
    uint64_t v25 = v10;
    id v19 = v17;
    id v26 = v19;
    -[DTODRResourceStatus captureAttributes:toDictionary:forPID:completed:]( self,  "captureAttributes:toDictionary:forPID:completed:",  v6,  v11,  v10,  v23);
    double v20 = v26;
    id v21 = v19;
  }

  else
  {
    id v21 = 0LL;
  }

  return v21;
}

- (void)_ODRPurgeResourcesForBundleIdentifier:(id)a3 tagID:(id)a4 finishBlock:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = sub_1688();
  id v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 remoteObjectProxyWithErrorHandler:&stru_4358]);

  if (v7 && !v8 && v12)
  {
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472LL;
    v18[2] = sub_2014;
    v18[3] = &unk_43A0;
    id v19 = v9;
    [v12 purgeAllTagsInBundleWithID:v7 replyBlock:v18];
    id v13 = v19;
  }

  else if (v7 && v8 && v12)
  {
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472LL;
    v16[2] = sub_2020;
    v16[3] = &unk_43A0;
    id v17 = v9;
    [v12 purgeTagWithName:v8 inBundleWithID:v7 replyBlock:v16];
    id v13 = v17;
  }

  else
  {
    if (v12)
    {
      NSErrorUserInfoKey v20 = NSLocalizedDescriptionKey;
      id v21 = @"ODR Purge API called without an TagID or BundleID.";
      dispatch_time_t v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v21,  &v20,  1LL));
      uint64_t v15 = -2LL;
    }

    else
    {
      NSErrorUserInfoKey v22 = NSLocalizedDescriptionKey;
      double v23 = @"OnDemandD connection invalid.";
      dispatch_time_t v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v23,  &v22,  1LL));
      uint64_t v15 = -1LL;
    }

    id v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.dtmobileis.assetcontrol",  v15,  v14));

    (*((void (**)(id, void *))v9 + 2))(v9, v13);
  }
}

- (id)ODRPurgeResourcesForBundleIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(&OBJC_CLASS___DTXRemoteInvocationReceipt);
  dispatch_time_t v6 = dispatch_time(0LL, 10000000000LL);
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
  id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_216C;
  block[3] = &unk_43C8;
  id v9 = v5;
  id v18 = v9;
  id v19 = v4;
  id v10 = v4;
  dispatch_after(v6, v8, block);

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_225C;
  v15[3] = &unk_43F0;
  id v11 = v9;
  id v16 = v11;
  -[DTODRResourceStatus _ODRPurgeResourcesForBundleIdentifier:tagID:finishBlock:]( self,  "_ODRPurgeResourcesForBundleIdentifier:tagID:finishBlock:",  v10,  0LL,  v15);
  id v12 = v16;
  id v13 = v11;

  return v13;
}

- (id)ODRPurgeTagID:(id)a3 forBundleIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init(&OBJC_CLASS___DTXRemoteInvocationReceipt);
  dispatch_time_t v9 = dispatch_time(0LL, 10000000000LL);
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
  id v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_23C8;
  block[3] = &unk_43C8;
  id v12 = v8;
  id v21 = v12;
  id v22 = v6;
  id v13 = v6;
  dispatch_after(v9, v11, block);

  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_24B8;
  v18[3] = &unk_43F0;
  id v14 = v12;
  id v19 = v14;
  -[DTODRResourceStatus _ODRPurgeResourcesForBundleIdentifier:tagID:finishBlock:]( self,  "_ODRPurgeResourcesForBundleIdentifier:tagID:finishBlock:",  v7,  v13,  v18);

  uint64_t v15 = v19;
  id v16 = v14;

  return v16;
}

- (id)ODRGetBandwidth
{
  id v2 = sub_1688();
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 remoteObjectProxyWithErrorHandler:&stru_4410]);

  id v5 = objc_alloc_init(&OBJC_CLASS___DTXRemoteInvocationReceipt);
  dispatch_time_t v6 = dispatch_time(0LL, 10000000000LL);
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
  id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_262C;
  block[3] = &unk_4310;
  id v9 = v5;
  id v17 = v9;
  dispatch_after(v6, v8, block);

  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_26FC;
  v14[3] = &unk_4458;
  id v10 = v9;
  id v15 = v10;
  [v4 getSimulatedBandwidthWithReply:v14];
  id v11 = v15;
  id v12 = v10;

  return v12;
}

- (id)ODRSetBandwidth:(id)a3
{
  id v3 = a3;
  id v4 = [v3 unsignedIntegerValue];
  id v5 = sub_1688();
  dispatch_time_t v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 remoteObjectProxyWithErrorHandler:&stru_4478]);

  id v8 = objc_alloc_init(&OBJC_CLASS___DTXRemoteInvocationReceipt);
  dispatch_time_t v9 = dispatch_time(0LL, 10000000000LL);
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
  id v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_28FC;
  block[3] = &unk_43C8;
  id v12 = v8;
  id v21 = v12;
  id v22 = v3;
  id v13 = v3;
  dispatch_after(v9, v11, block);

  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_29EC;
  v18[3] = &unk_4458;
  id v14 = v12;
  id v19 = v14;
  [v7 setSimulatedBandwidth:v4 withReply:v18];
  id v15 = v19;
  id v16 = v14;

  return v16;
}

@end
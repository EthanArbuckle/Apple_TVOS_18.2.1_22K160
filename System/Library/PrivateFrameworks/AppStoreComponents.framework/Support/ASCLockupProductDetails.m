@interface ASCLockupProductDetails
+ (id)URLForLockupID:(id)a3 ofKind:(id)a4 offerFlags:(int64_t)a5 queryParameters:(id)a6;
+ (id)URLForLockupID:(id)a3 ofKind:(id)a4 withOfferFlags:(int64_t)a5;
+ (id)queryParametersForLockup:(id)a3;
- (ASCLockup)lockup;
- (ASCLockupProductDetails)initWithLockup:(id)a3;
- (ASCLockupProductDetails)initWithLockup:(id)a3 storeSheetHostBundleID:(id)a4 storeSheetUsageContext:(id)a5;
- (ASCLockupProductDetails)initWithLockup:(id)a3 storeSheetHostBundleID:(id)a4 storeSheetUsageContext:(id)a5 parameters:(id)a6;
- (ASCLockupProductDetailsObserver)observer;
- (BOOL)isEqual:(id)a3;
- (BOOL)isOpenAppCallbackEnabled;
- (BOOL)isWebBrowser;
- (NSDictionary)parameters;
- (NSString)storeSheetHostBundleID;
- (NSString)storeSheetUsageContext;
- (id)description;
- (unint64_t)hash;
- (void)present:(id)a3;
- (void)setObserver:(id)a3;
- (void)setOpenAppCallbackEnabled:(BOOL)a3;
- (void)setWebBrowser:(BOOL)a3;
@end

@implementation ASCLockupProductDetails

+ (id)URLForLockupID:(id)a3 ofKind:(id)a4 withOfferFlags:(int64_t)a5
{
  id v8 = a4;
  id v9 = a3;
  sub_10000F4DC((uint64_t)&OBJC_CLASS___ASCEligibility);
  v10 = (void *)objc_claimAutoreleasedReturnValue([a1 URLForLockupID:v9 ofKind:v8 offerFlags:a5 queryParameters:0]);

  return v10;
}

+ (id)URLForLockupID:(id)a3 ofKind:(id)a4 offerFlags:(int64_t)a5 queryParameters:(id)a6
{
  char v7 = a5;
  id v9 = a3;
  id v10 = a4;
  id v11 = a6;
  sub_10000F4DC((uint64_t)&OBJC_CLASS___ASCEligibility);
  v12 = (void *)objc_claimAutoreleasedReturnValue([v9 stringValue]);
  v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSCharacterSet URLPathAllowedCharacterSet]( &OBJC_CLASS___NSCharacterSet,  "URLPathAllowedCharacterSet"));
  v14 = (void *)objc_claimAutoreleasedReturnValue([v12 stringByAddingPercentEncodingWithAllowedCharacters:v13]);
  v15 = objc_alloc_init(&OBJC_CLASS___NSURLComponents);
  v16 = v15;
  if ((v7 & 4) != 0) {
    v17 = @"com.apple.Arcade";
  }
  else {
    v17 = @"itms-apps";
  }
  -[NSURLComponents setScheme:](v15, "setScheme:", v17);
  if (![v10 isEqualToString:@"app"])
  {
    sub_100021328(@"ASCLockupKind", v10, v18, v19, v20, v21, v22, v23, v31, v32);
    goto LABEL_10;
  }

  -[NSURLComponents setPercentEncodedHost:](v16, "setPercentEncodedHost:", @"apps.apple.com");
  v35[0] = @"/";
  v35[1] = @"app";
  v24 = (void *)objc_claimAutoreleasedReturnValue([@"id" stringByAppendingString:v14]);
  v35[2] = v24;
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v35, 3LL));
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSString pathWithComponents:](&OBJC_CLASS___NSString, "pathWithComponents:", v25));
  -[NSURLComponents setPercentEncodedPath:](v16, "setPercentEncodedPath:", v26);

  if (v11)
  {
    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472LL;
    v33[2] = sub_1000172E0;
    v33[3] = &unk_10011EFA8;
    id v34 = (id)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v11 count]));
    id v27 = v34;
    [v11 enumerateKeysAndObjectsUsingBlock:v33];
    -[NSURLComponents setQueryItems:](v16, "setQueryItems:", v27);
  }

  uint64_t v28 = objc_claimAutoreleasedReturnValue(-[NSURLComponents URL](v16, "URL"));
  if (!v28) {
LABEL_10:
  }
    objc_exception_throw(  -[NSException initWithName:reason:userInfo:]( objc_alloc(&OBJC_CLASS___NSException),  "initWithName:reason:userInfo:",  NSInvalidArgumentException,  -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"Lockup id %@ of kind %@ is invalid",  v9,  v10),  0LL));
  v29 = (void *)v28;

  return v29;
}

+ (id)queryParametersForLockup:(id)a3
{
  id v3 = a3;
  sub_10000F4DC((uint64_t)&OBJC_CLASS___ASCEligibility);
  v4 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  v5 = (void *)objc_claimAutoreleasedReturnValue([v3 productVariantID]);

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue([v3 productVariantID]);
    -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v6, @"ppid");
  }

  char v7 = (void *)objc_claimAutoreleasedReturnValue([v3 offer]);
  unsigned __int16 v8 = (unsigned __int16)[v7 flags];

  if ((v8 & 0x200) != 0) {
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v4,  "setObject:forKeyedSubscript:",  @"1",  @"isViewOnly");
  }
  if (-[NSMutableDictionary count](v4, "count")) {
    id v9 = -[NSMutableDictionary copy](v4, "copy");
  }
  else {
    id v9 = 0LL;
  }

  return v9;
}

- (ASCLockupProductDetails)initWithLockup:(id)a3
{
  return -[ASCLockupProductDetails initWithLockup:storeSheetHostBundleID:storeSheetUsageContext:parameters:]( self,  "initWithLockup:storeSheetHostBundleID:storeSheetUsageContext:parameters:",  a3,  0LL,  0LL,  0LL);
}

- (ASCLockupProductDetails)initWithLockup:(id)a3 storeSheetHostBundleID:(id)a4 storeSheetUsageContext:(id)a5
{
  return -[ASCLockupProductDetails initWithLockup:storeSheetHostBundleID:storeSheetUsageContext:parameters:]( self,  "initWithLockup:storeSheetHostBundleID:storeSheetUsageContext:parameters:",  a3,  a4,  a5,  0LL);
}

- (ASCLockupProductDetails)initWithLockup:(id)a3 storeSheetHostBundleID:(id)a4 storeSheetUsageContext:(id)a5 parameters:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  sub_10000F4DC((uint64_t)&OBJC_CLASS___ASCEligibility);
  v24.receiver = self;
  v24.super_class = (Class)&OBJC_CLASS___ASCLockupProductDetails;
  v14 = -[ASCLockupProductDetails init](&v24, "init");
  if (v14)
  {
    v15 = (ASCLockup *)[v10 copy];
    lockup = v14->_lockup;
    v14->_lockup = v15;

    v17 = (NSString *)[v11 copy];
    storeSheetHostBundleID = v14->_storeSheetHostBundleID;
    v14->_storeSheetHostBundleID = v17;

    uint64_t v19 = (NSString *)[v12 copy];
    storeSheetUsageContext = v14->_storeSheetUsageContext;
    v14->_storeSheetUsageContext = v19;

    uint64_t v21 = (NSDictionary *)[v13 copy];
    parameters = v14->_parameters;
    v14->_parameters = v21;
  }

  return v14;
}

- (void)present:(id)a3
{
  v4 = (void (**)(id, void))a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ASCLockupProductDetails lockup](self, "lockup"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 id]);
  char v7 = (void *)objc_claimAutoreleasedReturnValue(+[ASCAdamID invalidAdamID](&OBJC_CLASS___ASCAdamID, "invalidAdamID"));
  unsigned int v8 = [v6 isEqual:v7];

  if (v8)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
    {
      id v9 = (void *)objc_claimAutoreleasedReturnValue(-[ASCLockupProductDetails lockup](self, "lockup"));
      id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 id]);
      *(_DWORD *)buf = 138543362;
      BOOL v32 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "Not presenting product details for lockup %{public}@ because ID is invalid.",  buf,  0xCu);
    }

    if (v4) {
      v4[2](v4, 0LL);
    }
  }

  else
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[ASCLockupProductDetails lockup](self, "lockup"));
    id v12 = (void *)objc_claimAutoreleasedReturnValue( +[ASCLockupProductDetails queryParametersForLockup:]( &OBJC_CLASS___ASCLockupProductDetails,  "queryParametersForLockup:",  v11));

    id v13 = (void *)objc_claimAutoreleasedReturnValue(-[ASCLockupProductDetails parameters](self, "parameters"));
    if (v13)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[ASCLockupProductDetails parameters](self, "parameters"));
      id v15 = [v14 mutableCopy];

      if (v12) {
        [v15 addEntriesFromDictionary:v12];
      }
    }

    else
    {
      id v15 = [v12 mutableCopy];
    }

    id v27 = v12;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[ASCLockupProductDetails lockup](self, "lockup", v12));
      v17 = (void *)objc_claimAutoreleasedReturnValue([v16 id]);
      *(_DWORD *)buf = 138543362;
      BOOL v32 = v17;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "Presenting product details for lockup %{public}@",  buf,  0xCu);
    }

    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(-[ASCLockupProductDetails lockup](self, "lockup", v27));
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v18 id]);
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(-[ASCLockupProductDetails lockup](self, "lockup"));
    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v20 kind]);
    uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(-[ASCLockupProductDetails lockup](self, "lockup"));
    uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([v22 offer]);
    objc_super v24 = (void *)objc_claimAutoreleasedReturnValue( +[ASCLockupProductDetails URLForLockupID:ofKind:offerFlags:queryParameters:]( ASCLockupProductDetails,  "URLForLockupID:ofKind:offerFlags:queryParameters:",  v19,  v21,  [v23 flags],  v15));

    v25 = (void *)objc_claimAutoreleasedReturnValue(+[ASCWorkspace sharedWorkspace](&OBJC_CLASS___ASCWorkspace, "sharedWorkspace"));
    v26 = (void *)objc_claimAutoreleasedReturnValue([v25 openURL:v24]);

    if (v4)
    {
      v29[0] = _NSConcreteStackBlock;
      v29[1] = 3221225472LL;
      v29[2] = sub_10001788C;
      v29[3] = &unk_10011F1A8;
      v30 = v4;
      [v26 addFinishBlock:v29];
    }
  }
}

- (unint64_t)hash
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ASCLockupProductDetails lockup](self, "lockup"));
  id v3 = (char *)[v2 hash] + 2;

  return (unint64_t)v3;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___ASCLockupProductDetails);
  v5 = self;
  v6 = v5;
  if (v5)
  {
    if ((objc_opt_isKindOfClass(v5, v4) & 1) != 0) {
      char v7 = v6;
    }
    else {
      char v7 = 0LL;
    }
  }

  else
  {
    char v7 = 0LL;
  }

  unsigned int v8 = v7;

  if (v8)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[ASCLockupProductDetails lockup](v6, "lockup"));
    uint64_t v10 = objc_claimAutoreleasedReturnValue(-[ASCLockupProductDetails lockup](v8, "lockup"));
    id v11 = (void *)v10;
    if (v9 && v10) {
      unsigned __int8 v12 = [v9 isEqual:v10];
    }
    else {
      unsigned __int8 v12 = v9 == (void *)v10;
    }
  }

  else
  {
    unsigned __int8 v12 = 0;
  }

  return v12;
}

- (id)description
{
  id v3 = -[ASCDescriber initWithObject:](objc_alloc(&OBJC_CLASS___ASCDescriber), "initWithObject:", self);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[ASCLockupProductDetails lockup](self, "lockup"));
  -[ASCDescriber addObject:withName:](v3, "addObject:withName:", v4, @"lockup");

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ASCDescriber finalizeDescription](v3, "finalizeDescription"));
  return v5;
}

- (ASCLockup)lockup
{
  return self->_lockup;
}

- (NSString)storeSheetHostBundleID
{
  return self->_storeSheetHostBundleID;
}

- (NSString)storeSheetUsageContext
{
  return self->_storeSheetUsageContext;
}

- (NSDictionary)parameters
{
  return self->_parameters;
}

- (ASCLockupProductDetailsObserver)observer
{
  return (ASCLockupProductDetailsObserver *)objc_loadWeakRetained((id *)&self->_observer);
}

- (void)setObserver:(id)a3
{
}

- (BOOL)isOpenAppCallbackEnabled
{
  return self->_openAppCallbackEnabled;
}

- (void)setOpenAppCallbackEnabled:(BOOL)a3
{
  self->_openAppCallbackEnabled = a3;
}

- (BOOL)isWebBrowser
{
  return self->_webBrowser;
}

- (void)setWebBrowser:(BOOL)a3
{
  self->_webBrowser = a3;
}

- (void).cxx_destruct
{
}

@end
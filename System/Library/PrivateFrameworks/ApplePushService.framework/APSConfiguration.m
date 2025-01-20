@interface APSConfiguration
+ (id)_onQueue_configurationForEnvironment:(id)a3 connectionType:(int64_t)a4;
+ (id)configurationForEnvironment:(id)a3 connectionType:(int64_t)a4;
+ (void)initialize;
+ (void)invalidateConfigurationForEnvironment:(id)a3 connectionType:(int64_t)a4;
+ (void)loadConfigurationForEnvironment:(id)a3 connectionType:(int64_t)a4 block:(id)a5;
- (APSConfiguration)initWithEnvironment:(id)a3 connectionType:(int64_t)a4;
- (BOOL)_isExpired;
- (BOOL)_isLoaded;
- (BOOL)hasValidSignature;
- (NSDate)expiry;
- (NSDate)fetchDate;
- (NSNumber)activeInterval;
- (NSNumber)awdSlowReceiveThreshold;
- (NSNumber)costDrivenDualChannelAttempts;
- (NSNumber)criticalMessageKeepAliveTimerDuration;
- (NSNumber)criticalMessageTimeout;
- (NSNumber)delayedReconnectInterval;
- (NSNumber)delayedReconnectIntervalWatchWiFi;
- (NSNumber)delayedReconnectMaxInterval;
- (NSNumber)delayedReconnectMaxIntervalTrigger;
- (NSNumber)delayedReconnectMinIntervalTrigger;
- (NSNumber)delayedReconnectTLSInterval;
- (NSNumber)delayedReconnectTLSIntervalTrigger;
- (NSNumber)delayedSuspendKeepAliveInterval;
- (NSNumber)disableCostDrivenDualChannelAttempts;
- (NSNumber)disableDualModePiggybackTimer;
- (NSNumber)expensiveConditionsBackOffInterval;
- (NSNumber)filterMessageTimeout;
- (NSNumber)filterOptimizationEnabled;
- (NSNumber)forcedShortTimeoutInterval;
- (NSNumber)highQualityThresholdConnectedTime;
- (NSNumber)keepAliveV2TimeDriftMaximum;
- (NSNumber)lastIPCachingPercentage;
- (NSNumber)lastIPCachingTTLMinutes;
- (NSNumber)lastIPCachingTTLMinutesV2;
- (NSNumber)lowPriorityMessageBatchSize;
- (NSNumber)lowQualityThresholdConnectedTime;
- (NSNumber)maxExpensiveConditionsConnectionAttempts;
- (NSNumber)maximumLowPriorityBatchesPerHour;
- (NSNumber)minPresenceSaltRotationInterval;
- (NSNumber)minimumIntervalFallbackEnabled;
- (NSNumber)nagleEnabled;
- (NSNumber)numberOfCriticalMessageKeepAlivesBeforeDisconnecting;
- (NSNumber)piggybackDualChannelAttempts;
- (NSNumber)powerOptimizationsForExpensiveNetworkingDisabled;
- (NSNumber)pubSubDefaultTimeout;
- (NSNumber)pubSubRetryAttemptsCount;
- (NSNumber)simulatorConnectionEnabled;
- (NSNumber)suspendToggleDailyLimit;
- (NSNumber)suspendToggleHourlyLimit;
- (NSNumber)wifiKeepAliveEarlyFireConstantInterval;
- (NSNumber)wwanTrackedLinkQualityOffTransitions;
- (NSNumber)wwanTrackedLinkQualityTimeInterval;
- (NSString)hostname;
- (NSString)urlTokenPrefix;
- (id)ExpensiveConditionsBackOffInterval;
- (id)bagExpiryInterval;
- (id)pendingCompletionBocks;
- (int)status;
- (unint64_t)serverCount;
- (void)_callCompletionBlocksWithError:(id)a3;
- (void)_failWithError:(id)a3;
- (void)_finishLoadWithResponse:(id)a3 urlHost:(id)a4 data:(id)a5;
- (void)addCompletionBlock:(id)a3;
- (void)dealloc;
- (void)setExpiry:(id)a3;
- (void)setExpiryInterval:(double)a3 expirationBlock:(id)a4;
- (void)setFetchDate:(id)a3;
- (void)setHasValidSignature:(BOOL)a3;
@end

@implementation APSConfiguration

+ (void)initialize
{
  v2 = -[NSURLCache initWithMemoryCapacity:diskCapacity:diskPath:]( objc_alloc(&OBJC_CLASS___NSURLCache),  "initWithMemoryCapacity:diskCapacity:diskPath:",  0LL,  0LL,  0LL);
  if (v2)
  {
    v3 = v2;
    +[NSURLCache setSharedURLCache:](&OBJC_CLASS___NSURLCache, "setSharedURLCache:", v2);
    v2 = v3;
  }
}

+ (id)_onQueue_configurationForEnvironment:(id)a3 connectionType:(int64_t)a4
{
  id v5 = a3;
  v6 = sub_10006598C(a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue([v5 name]);
  v9 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:v8]);

  if (v9 && [v9 _isExpired])
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue([v5 name]);
      int v15 = 138412546;
      v16 = v9;
      __int16 v17 = 2112;
      v18 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Config %@ for env %@ expired, flushing",  (uint8_t *)&v15,  0x16u);
    }

    v11 = sub_10006598C(a4);
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue([v5 name]);
    [v12 removeObjectForKey:v13];

    v9 = 0LL;
  }

  return v9;
}

+ (id)configurationForEnvironment:(id)a3 connectionType:(int64_t)a4
{
  id v7 = a3;
  if (!+[NSThread isMainThread](&OBJC_CLASS___NSThread, "isMainThread"))
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v13 handleFailureInMethod:a2 object:a1 file:@"APSConfiguration.m" lineNumber:170 description:@"must be called from main thread"];
  }

  uint64_t v19 = 0LL;
  v20 = &v19;
  uint64_t v21 = 0x3032000000LL;
  v22 = sub_100065BA4;
  v23 = sub_100065BB4;
  id v24 = 0LL;
  id v8 = sub_1000674DC();
  v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v8);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_100065BBC;
  v14[3] = &unk_10011F5F0;
  id v15 = v7;
  v16 = &v19;
  id v17 = a1;
  int64_t v18 = a4;
  id v10 = v7;
  dispatch_sync(v9, v14);

  id v11 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v11;
}

+ (void)loadConfigurationForEnvironment:(id)a3 connectionType:(int64_t)a4 block:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  if (!+[NSThread isMainThread](&OBJC_CLASS___NSThread, "isMainThread"))
  {
    int64_t v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v18 handleFailureInMethod:a2 object:a1 file:@"APSConfiguration.m" lineNumber:181 description:@"must be called from main thread"];
  }

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v9 name]);
    v12 = sub_100005B48(a4);
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    *(_DWORD *)buf = 138412802;
    id v25 = v9;
    __int16 v26 = 2112;
    v27 = v11;
    __int16 v28 = 2112;
    v29 = v13;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "loadConfigurationForEnvironment: %@ %@ interface: %@",  buf,  0x20u);
  }

  id v14 = sub_1000674DC();
  id v15 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v14);
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_100065DC4;
  v19[3] = &unk_10011F618;
  id v22 = a1;
  int64_t v23 = a4;
  id v20 = v9;
  id v21 = v10;
  id v16 = v10;
  id v17 = v9;
  dispatch_sync(v15, v19);
}

+ (void)invalidateConfigurationForEnvironment:(id)a3 connectionType:(int64_t)a4
{
  id v7 = a3;
  if (!+[NSThread isMainThread](&OBJC_CLASS___NSThread, "isMainThread"))
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v12 handleFailureInMethod:a2 object:a1 file:@"APSConfiguration.m" lineNumber:194 description:@"must be called from main thread"];
  }

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 name]);
    *(_DWORD *)buf = 138412802;
    id v17 = a1;
    __int16 v18 = 2112;
    id v19 = v7;
    __int16 v20 = 2112;
    id v21 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%@: invalidateConfigurationForEnvironment: %@ %@",  buf,  0x20u);
  }

  id v9 = sub_1000674DC();
  id v10 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v9);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_100066000;
  v13[3] = &unk_10011F640;
  id v14 = v7;
  int64_t v15 = a4;
  id v11 = v7;
  dispatch_sync(v10, v13);
}

- (APSConfiguration)initWithEnvironment:(id)a3 connectionType:(int64_t)a4
{
  id v6 = a3;
  v35.receiver = self;
  v35.super_class = (Class)&OBJC_CLASS___APSConfiguration;
  id v7 = -[APSConfiguration init](&v35, "init");
  if (v7)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 name]);
    id v9 = (NSString *)[v8 copy];
    name = v7->_name;
    v7->_name = v9;

    id v11 = (void *)objc_claimAutoreleasedReturnValue([v6 configurationURL]);
    v12 = (NSURL *)[v11 copy];
    url = v7->_url;
    v7->_url = v12;

    v7->_isLoadBalanced = [v6 isLoadBalanced];
    v7->_connectionType = a4;
    v7->_isLoaded = 0;
    uint64_t v14 = objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](&OBJC_CLASS___NSDate, "dateWithTimeIntervalSinceNow:", 900.0));
    expiry = v7->_expiry;
    v7->_expiry = (NSDate *)v14;

    id v16 = (void *)objc_claimAutoreleasedReturnValue([v6 configurationURL]);
    id v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSURLComponents componentsWithURL:resolvingAgainstBaseURL:]( &OBJC_CLASS___NSURLComponents,  "componentsWithURL:resolvingAgainstBaseURL:",  v16,  1LL));

    __int16 v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    v31 = (void *)objc_claimAutoreleasedReturnValue( +[NSURLQueryItem queryItemWithName:value:]( &OBJC_CLASS___NSURLQueryItem,  "queryItemWithName:value:",  @"v",  @"1"));
    objc_msgSend(v18, "addObject:");
    if (v7->_connectionType)
    {
      id v19 = @"WiFi";
    }

    else
    {
      __int16 v20 = (void *)objc_claimAutoreleasedReturnValue( +[PCInterfaceMonitor sharedInstanceForIdentifier:]( &OBJC_CLASS___PCInterfaceMonitor,  "sharedInstanceForIdentifier:",  1LL));
      id v21 = (void *)objc_claimAutoreleasedReturnValue([v20 networkCode]);

      if ([v21 length]) {
        id v19 = v21;
      }
      else {
        id v19 = @"unknown";
      }
    }

    id v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSURLQueryItem queryItemWithName:value:]( &OBJC_CLASS___NSURLQueryItem,  "queryItemWithName:value:",  @"c",  v19));
    [v18 addObject:v22];
    [v17 setQueryItems:v18];
    int64_t v23 = (void *)objc_claimAutoreleasedReturnValue([v17 URL]);
    id v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableURLRequest requestWithURL:cachePolicy:timeoutInterval:]( &OBJC_CLASS___NSMutableURLRequest,  "requestWithURL:cachePolicy:timeoutInterval:",  v23,  1LL,  20.0));

    [v24 setHTTPShouldHandleCookies:0];
    if (qword_10014E8B8 != -1) {
      dispatch_once(&qword_10014E8B8, &stru_10011F718);
    }
    id v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@/%@ (%@)",  qword_10014E8A0,  qword_10014E8A8,  qword_10014E8B0));
    [v24 setValue:v25 forHTTPHeaderField:@"User-Agent"];

    __int16 v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSURLSessionConfiguration ephemeralSessionConfiguration]( &OBJC_CLASS___NSURLSessionConfiguration,  "ephemeralSessionConfiguration"));
    objc_msgSend(v26, "set_tlsTrustPinningPolicyName:", kSecPolicyNameApplePushService);
    v27 = (void *)objc_claimAutoreleasedReturnValue( +[NSURLSession sessionWithConfiguration:]( &OBJC_CLASS___NSURLSession,  "sessionWithConfiguration:",  v26));
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472LL;
    v32[2] = sub_100066468;
    v32[3] = &unk_10011F690;
    v33 = v7;
    id v34 = v27;
    id v28 = v27;
    v29 = (void *)objc_claimAutoreleasedReturnValue([v28 dataTaskWithRequest:v24 completionHandler:v32]);
    [v29 resume];
  }

  return v7;
}

- (void)dealloc
{
  expireTimer = self->_expireTimer;
  if (expireTimer) {
    dispatch_source_cancel((dispatch_source_t)expireTimer);
  }
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___APSConfiguration;
  -[APSConfiguration dealloc](&v4, "dealloc");
}

- (id)pendingCompletionBocks
{
  return self->_pendingCompletionBlocks;
}

- (void)addCompletionBlock:(id)a3
{
  id v4 = a3;
  id v5 = sub_1000674DC();
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v5);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_100066724;
  v8[3] = &unk_10011F6B8;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(v6, v8);
}

- (void)_callCompletionBlocksWithError:(id)a3
{
  id v4 = a3;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    expiry = self->_expiry;
    *(_DWORD *)buf = 138412802;
    int64_t v15 = self;
    __int16 v16 = 2112;
    id v17 = expiry;
    __int16 v18 = 2112;
    id v19 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%@ Calling configuration completion blocks, expiration date %@ error: %@",  buf,  0x20u);
  }

  id v6 = self->_pendingCompletionBlocks;
  pendingCompletionBlocks = self->_pendingCompletionBlocks;
  self->_pendingCompletionBlocks = 0LL;

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100066904;
  block[3] = &unk_10011DAB8;
  id v11 = v6;
  v12 = self;
  id v13 = v4;
  id v8 = v4;
  id v9 = v6;
  dispatch_async(&_dispatch_main_q, block);
}

- (void)_failWithError:(id)a3
{
  id v4 = a3;
  id v5 = sub_1000674DC();
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v5);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_100066A8C;
  v8[3] = &unk_10011DC60;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(v6, v8);
}

- (void)_finishLoadWithResponse:(id)a3 urlHost:(id)a4 data:(id)a5
{
  id v23 = 0LL;
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSPropertyListSerialization propertyListWithData:options:format:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "propertyListWithData:options:format:error:",  a5,  0LL,  0LL,  &v23));
  id v8 = v23;
  if (!v6)
  {
    uint64_t v17 = APSUnderlyingError(2LL, v8, @"failed to parse configuration data");
    uint64_t v18 = objc_claimAutoreleasedReturnValue(v17);
LABEL_8:
    __int16 v20 = (void *)v18;

    -[APSConfiguration _failWithError:](self, "_failWithError:", v20);
    id v8 = v20;
    goto LABEL_11;
  }

  uint64_t v9 = objc_opt_class(&OBJC_CLASS___NSDictionary, v7);
  if ((objc_opt_isKindOfClass(v6, v9) & 1) == 0)
  {
    uint64_t v19 = APSError(2LL, @"base type of configuration is not a dictionary");
    uint64_t v18 = objc_claimAutoreleasedReturnValue(v19);
    goto LABEL_8;
  }

  if (self->_isLoadBalanced
    && (id v10 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:@"APNSCourierHostcount"]),
        id v11 = [v10 unsignedIntegerValue],
        v10,
        !v11))
  {
    uint64_t v21 = APSError(2LL, @"Environment is loadBalanced but got serverCount of 0");
    v12 = (void *)objc_claimAutoreleasedReturnValue(v21);
    -[APSConfiguration _failWithError:](self, "_failWithError:", v12);
  }

  else
  {
    objc_storeStrong((id *)&self->_plist, v6);
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472LL;
    v22[2] = sub_100066CC0;
    v22[3] = &unk_10011E4F0;
    v22[4] = self;
    v12 = objc_retainBlock(v22);
    id v13 = (void *)objc_claimAutoreleasedReturnValue(-[APSConfiguration bagExpiryInterval](self, "bagExpiryInterval"));
    double v14 = (double)(uint64_t)[v13 integerValue];

    -[APSConfiguration setExpiryInterval:expirationBlock:](self, "setExpiryInterval:expirationBlock:", v12, v14);
    int64_t v15 = (NSDate *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    fetchDate = self->_fetchDate;
    self->_fetchDate = v15;

    *(_WORD *)&self->_isLoaded = 257;
    -[APSConfiguration _callCompletionBlocksWithError:](self, "_callCompletionBlocksWithError:", 0LL);
  }

LABEL_11:
}

- (NSString)hostname
{
  return (NSString *)-[NSDictionary objectForKey:](self->_plist, "objectForKey:", @"APNSCourierHostname");
}

- (unint64_t)serverCount
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKey:](self->_plist, "objectForKey:", @"APNSCourierHostcount"));
  v3 = v2;
  if (v2) {
    id v4 = [v2 unsignedIntegerValue];
  }
  else {
    id v4 = 0LL;
  }

  return (unint64_t)v4;
}

- (int)status
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKey:](self->_plist, "objectForKey:", @"APNSCourierStatus"));
  unsigned int v3 = [v2 BOOLValue] ^ 1;

  return v3;
}

- (NSNumber)numberOfCriticalMessageKeepAlivesBeforeDisconnecting
{
  return (NSNumber *)-[NSDictionary objectForKey:]( self->_plist,  "objectForKey:",  @"APNSNumberOfCriticalMessageKeepAlivesBeforeDisconnecting");
}

- (NSNumber)criticalMessageKeepAliveTimerDuration
{
  return (NSNumber *)-[NSDictionary objectForKey:]( self->_plist,  "objectForKey:",  @"APNSCriticalMessageKeepAliveTimerDuration");
}

- (NSNumber)criticalMessageTimeout
{
  return (NSNumber *)-[NSDictionary objectForKey:](self->_plist, "objectForKey:", @"APNSCriticalMessageTimeout");
}

- (NSNumber)lowPriorityMessageBatchSize
{
  return (NSNumber *)-[NSDictionary objectForKey:]( self->_plist,  "objectForKey:",  @"APNSLowPriorityMessageBatchSize");
}

- (NSNumber)maximumLowPriorityBatchesPerHour
{
  return (NSNumber *)-[NSDictionary objectForKey:]( self->_plist,  "objectForKey:",  @"APNSMaximumLowPriorityBatchesPerHour");
}

- (NSNumber)wwanTrackedLinkQualityTimeInterval
{
  return (NSNumber *)-[NSDictionary objectForKey:]( self->_plist,  "objectForKey:",  @"APNSWWANTrackedLinkQualityTimeInterval");
}

- (NSNumber)wwanTrackedLinkQualityOffTransitions
{
  return (NSNumber *)-[NSDictionary objectForKey:]( self->_plist,  "objectForKey:",  @"APNSWWANTrackedLinkQualityOffTransitions");
}

- (NSNumber)awdSlowReceiveThreshold
{
  return (NSNumber *)-[NSDictionary objectForKey:](self->_plist, "objectForKey:", @"APNSAWDSlowReceiveThreshold");
}

- (NSNumber)activeInterval
{
  return (NSNumber *)-[NSDictionary objectForKey:](self->_plist, "objectForKey:", @"APNSActiveInterval");
}

- (NSNumber)forcedShortTimeoutInterval
{
  return (NSNumber *)-[NSDictionary objectForKey:]( self->_plist,  "objectForKey:",  @"APNSForcedShortTimeoutInterval");
}

- (NSNumber)costDrivenDualChannelAttempts
{
  return (NSNumber *)-[NSDictionary objectForKey:]( self->_plist,  "objectForKey:",  @"APNSCostDrivenDualChannelAttempts");
}

- (NSNumber)piggybackDualChannelAttempts
{
  return (NSNumber *)-[NSDictionary objectForKey:]( self->_plist,  "objectForKey:",  @"APNSPiggybackDualChannelAttempts");
}

- (NSNumber)disableCostDrivenDualChannelAttempts
{
  return (NSNumber *)-[NSDictionary objectForKey:]( self->_plist,  "objectForKey:",  @"APNSDisableCostDrivenDualChannel");
}

- (NSNumber)keepAliveV2TimeDriftMaximum
{
  return (NSNumber *)-[NSDictionary objectForKey:]( self->_plist,  "objectForKey:",  @"KeepAliveV2TimeDriftMaxAllowed");
}

- (NSNumber)lastIPCachingPercentage
{
  return (NSNumber *)-[NSDictionary objectForKey:](self->_plist, "objectForKey:", @"APNSIPCachingPercentage");
}

- (NSNumber)lastIPCachingTTLMinutes
{
  return (NSNumber *)-[NSDictionary objectForKey:](self->_plist, "objectForKey:", @"APNSIPCachingTTLMinutes");
}

- (NSNumber)lastIPCachingTTLMinutesV2
{
  return (NSNumber *)-[NSDictionary objectForKey:](self->_plist, "objectForKey:", @"APNSIPCachingTTLMinutesV2");
}

- (NSNumber)nagleEnabled
{
  return (NSNumber *)-[NSDictionary objectForKey:](self->_plist, "objectForKey:", @"APNSNagleEnabledV2");
}

- (NSNumber)minimumIntervalFallbackEnabled
{
  return (NSNumber *)-[NSDictionary objectForKey:]( self->_plist,  "objectForKey:",  @"APNSMinimumIntervalFallbackEnabled");
}

- (NSNumber)powerOptimizationsForExpensiveNetworkingDisabled
{
  return (NSNumber *)-[NSDictionary objectForKey:]( self->_plist,  "objectForKey:",  @"APNSPowerOptimizationsForExpensiveNetworkingDisabled");
}

- (NSNumber)maxExpensiveConditionsConnectionAttempts
{
  return (NSNumber *)-[NSDictionary objectForKey:]( self->_plist,  "objectForKey:",  @"APNSMaxExpensiveConditionsConnectionAttempts");
}

- (id)ExpensiveConditionsBackOffInterval
{
  return -[NSDictionary objectForKey:](self->_plist, "objectForKey:", @"APNSExpensiveConditionsBackOffInterval");
}

- (NSNumber)wifiKeepAliveEarlyFireConstantInterval
{
  return (NSNumber *)-[NSDictionary objectForKey:]( self->_plist,  "objectForKey:",  @"APNSWiFiKeepAliveEarlyFireConstantInterval");
}

- (NSNumber)delayedReconnectIntervalWatchWiFi
{
  return (NSNumber *)-[NSDictionary objectForKey:](self->_plist, "objectForKey:", @"APNSDelayedReconnectInterval");
}

- (NSNumber)delayedReconnectInterval
{
  return (NSNumber *)-[NSDictionary objectForKey:]( self->_plist,  "objectForKey:",  @"APNSDelayedReconnectIntervalAll");
}

- (NSNumber)delayedReconnectMaxInterval
{
  return (NSNumber *)-[NSDictionary objectForKey:]( self->_plist,  "objectForKey:",  @"APNSDelayedReconnectMaxInterval");
}

- (NSNumber)delayedReconnectMaxIntervalTrigger
{
  return (NSNumber *)-[NSDictionary objectForKey:]( self->_plist,  "objectForKey:",  @"APNSDelayedReconnectMaxIntervalTrigger");
}

- (NSNumber)delayedReconnectMinIntervalTrigger
{
  return (NSNumber *)-[NSDictionary objectForKey:]( self->_plist,  "objectForKey:",  @"APNSDelayedReconnectMinIntervalTrigger");
}

- (NSNumber)delayedReconnectTLSIntervalTrigger
{
  return (NSNumber *)-[NSDictionary objectForKey:]( self->_plist,  "objectForKey:",  @"APNSDelayedReconnectTLSIntervalTrigger");
}

- (NSNumber)delayedReconnectTLSInterval
{
  return (NSNumber *)-[NSDictionary objectForKey:]( self->_plist,  "objectForKey:",  @"APNSDelayedReconnectTLSInterval");
}

- (NSNumber)highQualityThresholdConnectedTime
{
  return (NSNumber *)-[NSDictionary objectForKey:]( self->_plist,  "objectForKey:",  @"APNSHighQualityThresholdConnectedTime");
}

- (NSNumber)lowQualityThresholdConnectedTime
{
  return (NSNumber *)-[NSDictionary objectForKey:]( self->_plist,  "objectForKey:",  @"APNSLowQualityThresholdConnectedTime");
}

- (NSNumber)disableDualModePiggybackTimer
{
  return (NSNumber *)-[NSDictionary objectForKey:]( self->_plist,  "objectForKey:",  @"APNSDisableDualModePiggybackTimer");
}

- (id)bagExpiryInterval
{
  return -[NSDictionary objectForKey:](self->_plist, "objectForKey:", @"APNSBagExpiry");
}

- (NSNumber)suspendToggleHourlyLimit
{
  return (NSNumber *)-[NSDictionary objectForKey:](self->_plist, "objectForKey:", @"APNSSuspendToggleHourlyLimit");
}

- (NSNumber)suspendToggleDailyLimit
{
  return (NSNumber *)-[NSDictionary objectForKey:](self->_plist, "objectForKey:", @"APNSSuspendToggleDailyLimit");
}

- (NSNumber)delayedSuspendKeepAliveInterval
{
  return (NSNumber *)-[NSDictionary objectForKey:]( self->_plist,  "objectForKey:",  @"APNSDelayedSuspendKeepAliveInterval");
}

- (NSNumber)pubSubRetryAttemptsCount
{
  return (NSNumber *)-[NSDictionary objectForKey:](self->_plist, "objectForKey:", @"APNSCloudChannelRetryCount");
}

- (NSNumber)pubSubDefaultTimeout
{
  return (NSNumber *)-[NSDictionary objectForKey:]( self->_plist,  "objectForKey:",  @"APNSCloudChannelRequestTimeoutSeconds");
}

- (NSString)urlTokenPrefix
{
  return (NSString *)-[NSDictionary objectForKey:](self->_plist, "objectForKey:", @"APNSWebpushUrlPrefix");
}

- (NSNumber)minPresenceSaltRotationInterval
{
  return (NSNumber *)-[NSDictionary objectForKey:]( self->_plist,  "objectForKey:",  @"APNSMinPresenceSaltRotationIntervalMinutes");
}

- (NSNumber)simulatorConnectionEnabled
{
  return (NSNumber *)-[NSDictionary objectForKey:]( self->_plist,  "objectForKey:",  @"APNSEnableSimulatorConnection");
}

- (NSNumber)filterOptimizationEnabled
{
  return (NSNumber *)-[NSDictionary objectForKey:]( self->_plist,  "objectForKey:",  @"APNSFilterOptimizationEnabledV1");
}

- (BOOL)_isLoaded
{
  return self->_isLoaded;
}

- (BOOL)_isExpired
{
  expiry = self->_expiry;
  unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  LOBYTE(expiry) = (id)-[NSDate compare:](expiry, "compare:", v3) != (id)1;

  return (char)expiry;
}

- (void)setExpiryInterval:(double)a3 expirationBlock:(id)a4
{
  id v6 = a4;
  if (a3 <= 0.0)
  {
    id v10 = (NSDate *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSinceNow:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceNow:",  900.0));
    expiry = self->_expiry;
    self->_expiry = v10;
  }

  else
  {
    uint64_t v7 = (NSDate *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](&OBJC_CLASS___NSDate, "dateWithTimeIntervalSinceNow:", a3));
    id v8 = self->_expiry;
    self->_expiry = v7;

    expireTimer = self->_expireTimer;
    if (expireTimer)
    {
      dispatch_source_cancel((dispatch_source_t)expireTimer);
    }

    else
    {
      id v12 = sub_1000674DC();
      id v13 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v12);
      double v14 = (OS_dispatch_source *)dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_timer,  0LL,  0LL,  v13);
      int64_t v15 = self->_expireTimer;
      self->_expireTimer = v14;

      __int16 v16 = self->_expireTimer;
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472LL;
      v19[2] = sub_1000673A0;
      v19[3] = &unk_10011F6B8;
      void v19[4] = self;
      id v20 = v6;
      dispatch_source_set_event_handler((dispatch_source_t)v16, v19);
    }

    uint64_t v17 = self->_expireTimer;
    dispatch_time_t v18 = dispatch_time(0LL, (uint64_t)(a3 * 1000000000.0));
    dispatch_source_set_timer( (dispatch_source_t)v17,  v18,  0xFFFFFFFFFFFFFFFFLL,  (unint64_t)(a3 / 10.0 * 1000000000.0));
    dispatch_resume((dispatch_object_t)self->_expireTimer);
  }
}

- (NSDate)fetchDate
{
  return self->_fetchDate;
}

- (void)setFetchDate:(id)a3
{
}

- (NSDate)expiry
{
  return self->_expiry;
}

- (void)setExpiry:(id)a3
{
}

- (BOOL)hasValidSignature
{
  return self->_hasValidSignature;
}

- (void)setHasValidSignature:(BOOL)a3
{
  self->_hasValidSignature = a3;
}

- (NSNumber)expensiveConditionsBackOffInterval
{
  return self->_expensiveConditionsBackOffInterval;
}

- (NSNumber)filterMessageTimeout
{
  return self->_filterMessageTimeout;
}

- (void).cxx_destruct
{
}

@end
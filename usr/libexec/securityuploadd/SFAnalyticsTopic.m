@interface SFAnalyticsTopic
+ (id)AppSupportPath;
+ (id)databasePathForCKKS;
+ (id)databasePathForCloudServices;
+ (id)databasePathForLocal;
+ (id)databasePathForNetworking;
+ (id)databasePathForPCS;
+ (id)databasePathForSOS;
+ (id)databasePathForSWTransparency;
+ (id)databasePathForTransparency;
+ (id)databasePathForTrust;
- (BOOL)allowInsecureSplunkCert;
- (BOOL)ckDeviceAccountApprovedTopic:(id)a3;
- (BOOL)copyEvents:(id)a3 failures:(id)a4 forUpload:(BOOL)a5 participatingClients:(id)a6 force:(BOOL)a7 linkedUUID:(id)a8 error:(id *)a9;
- (BOOL)disableClientId;
- (BOOL)disableUploads;
- (BOOL)eventIsBlacklisted:(id)a3;
- (BOOL)haveEligibleClients;
- (BOOL)ignoreServersMessagesTellingUsToGoAway;
- (BOOL)isSampledUpload;
- (BOOL)postJSON:(id)a3 toEndpoint:(id)a4 postSession:(id)a5 error:(id *)a6;
- (BOOL)prepareEventForUpload:(id)a3 linkedUUID:(id)a4;
- (BOOL)terseMetrics;
- (NSArray)blacklistedEvents;
- (NSArray)blacklistedFields;
- (NSArray)topicClients;
- (NSDictionary)metricsBase;
- (NSString)internalTopicName;
- (NSString)splunkTopicName;
- (NSURL)_splunkUploadURL;
- (NSURL)splunkBagURL;
- (SFAnalyticsTopic)initWithDictionary:(id)a3 name:(id)a4 samplingRates:(id)a5;
- (float)devicePercentage;
- (id)appleUser;
- (id)askSecurityForCKDeviceID;
- (id)carryStatus;
- (id)chunkFailureSet:(unint64_t)a3 events:(id)a4 error:(id *)a5;
- (id)createChunkedLoggingJSON:(BOOL)a3 forUpload:(BOOL)a4 participatingClients:(id)a5 force:(BOOL)a6 error:(id *)a7;
- (id)createChunkedLoggingJSON:(id)a3 failures:(id)a4 error:(id *)a5;
- (id)createEventDictionary:(id)a3 timestamp:(id)a4 error:(id *)a5;
- (id)createLoggingJSON:(BOOL)a3 forUpload:(BOOL)a4 participatingClients:(id)a5 force:(BOOL)a6 error:(id *)a7;
- (id)dataAnalyticsSetting:(id)a3;
- (id)eventDictWithBlacklistedFieldsStrippedFrom:(id)a3;
- (id)getSession;
- (id)healthSummaryWithName:(id)a3 store:(id)a4 uuid:(id)a5 timestamp:(id)a6 lastUploadTime:(id)a7;
- (id)sampleStatisticsForSamples:(id)a3 withName:(id)a4;
- (id)splunkUploadURL:(BOOL)a3 urlSession:(id)a4;
- (unint64_t)maxEventsToReport;
- (unint64_t)secondsBetweenUploads;
- (unint64_t)serializedEventSize:(id)a3 error:(id *)a4;
- (unint64_t)uploadSizeLimit;
- (void)URLSession:(id)a3 didReceiveChallenge:(id)a4 completionHandler:(id)a5;
- (void)addFailures:(id)a3 toUploadRecords:(id)a4 threshold:(unint64_t)a5 linkedUUID:(id)a6;
- (void)addRequiredFieldsToEvent:(id)a3;
- (void)removeBlacklistedFieldsFromEvent:(id)a3;
- (void)setAllowInsecureSplunkCert:(BOOL)a3;
- (void)setBlacklistedEvents:(id)a3;
- (void)setBlacklistedFields:(id)a3;
- (void)setDevicePercentage:(float)a3;
- (void)setDisableClientId:(BOOL)a3;
- (void)setDisableUploads:(BOOL)a3;
- (void)setIgnoreServersMessagesTellingUsToGoAway:(BOOL)a3;
- (void)setInternalTopicName:(id)a3;
- (void)setMaxEventsToReport:(unint64_t)a3;
- (void)setMetricsBase:(id)a3;
- (void)setSecondsBetweenUploads:(unint64_t)a3;
- (void)setSplunkBagURL:(id)a3;
- (void)setSplunkTopicName:(id)a3;
- (void)setTerseMetrics:(BOOL)a3;
- (void)setTopicClients:(id)a3;
- (void)setUploadSizeLimit:(unint64_t)a3;
- (void)set_splunkUploadURL:(id)a3;
- (void)setupClientsForTopic:(id)a3;
- (void)updateUploadDateForClients:(id)a3 date:(id)a4 clearData:(BOOL)a5;
@end

@implementation SFAnalyticsTopic

- (void)setupClientsForTopic:(id)a3
{
  id v27 = a3;
  v4 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  if ([v27 isEqualToString:SFAnalyticsTopicKeySync])
  {
    id v5 = [(id)objc_opt_class(self) databasePathForCKKS];
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue( +[SFAnalyticsClient getSharedClientNamed:orCreateWithStorePath:requireDeviceAnalytics:requireiCloudAnalytics:]( &OBJC_CLASS___SFAnalyticsClient,  "getSharedClientNamed:orCreateWithStorePath:requireDeviceAnalytics:requireiCloudAnalytics:",  @"ckks",  v6,  0LL,  1LL));
    -[NSMutableArray addObject:](v4, "addObject:", v7);

    id v8 = [(id)objc_opt_class(self) databasePathForSOS];
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue( +[SFAnalyticsClient getSharedClientNamed:orCreateWithStorePath:requireDeviceAnalytics:requireiCloudAnalytics:]( &OBJC_CLASS___SFAnalyticsClient,  "getSharedClientNamed:orCreateWithStorePath:requireDeviceAnalytics:requireiCloudAnalytics:",  @"sos",  v9,  0LL,  1LL));
    -[NSMutableArray addObject:](v4, "addObject:", v10);

    id v11 = [(id)objc_opt_class(self) databasePathForPCS];
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue( +[SFAnalyticsClient getSharedClientNamed:orCreateWithStorePath:requireDeviceAnalytics:requireiCloudAnalytics:]( &OBJC_CLASS___SFAnalyticsClient,  "getSharedClientNamed:orCreateWithStorePath:requireDeviceAnalytics:requireiCloudAnalytics:",  @"pcs",  v12,  0LL,  1LL));
    -[NSMutableArray addObject:](v4, "addObject:", v13);

    id v14 = [(id)objc_opt_class(self) databasePathForLocal];
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    v16 = @"local";
LABEL_9:
    v20 = v15;
    uint64_t v21 = 1LL;
    uint64_t v22 = 0LL;
    goto LABEL_10;
  }

  if ([v27 isEqualToString:SFAnalyticsTopicCloudServices])
  {
    id v17 = [(id)objc_opt_class(self) databasePathForCloudServices];
    v15 = (void *)objc_claimAutoreleasedReturnValue(v17);
    v16 = @"CloudServices";
    goto LABEL_9;
  }

  if ([v27 isEqualToString:SFAnalyticsTopicTrust])
  {
    id v18 = [(id)objc_opt_class(self) databasePathForTrust];
    v15 = (void *)objc_claimAutoreleasedReturnValue(v18);
    v16 = @"trust";
    goto LABEL_9;
  }

  if ([v27 isEqualToString:SFAnalyticsTopicNetworking])
  {
    id v19 = [(id)objc_opt_class(self) databasePathForNetworking];
    v15 = (void *)objc_claimAutoreleasedReturnValue(v19);
    v16 = @"networking";
    goto LABEL_9;
  }

  if ([v27 isEqualToString:SFAnalyticsTopicTransparency])
  {
    -[SFAnalyticsTopic setTerseMetrics:](self, "setTerseMetrics:", 1LL);
    id v25 = [(id)objc_opt_class(self) databasePathForTransparency];
    v15 = (void *)objc_claimAutoreleasedReturnValue(v25);
    v16 = @"transparency";
  }

  else
  {
    -[SFAnalyticsTopic setTerseMetrics:](self, "setTerseMetrics:", 1LL);
    id v26 = [(id)objc_opt_class(self) databasePathForSWTransparency];
    v15 = (void *)objc_claimAutoreleasedReturnValue(v26);
    v16 = @"swtransparency";
  }

  v20 = v15;
  uint64_t v21 = 0LL;
  uint64_t v22 = 1LL;
LABEL_10:
  v23 = (void *)objc_claimAutoreleasedReturnValue( +[SFAnalyticsClient getSharedClientNamed:orCreateWithStorePath:requireDeviceAnalytics:requireiCloudAnalytics:]( &OBJC_CLASS___SFAnalyticsClient,  "getSharedClientNamed:orCreateWithStorePath:requireDeviceAnalytics:requireiCloudAnalytics:",  v16,  v20,  v21,  v22));
  -[NSMutableArray addObject:](v4, "addObject:", v23);

LABEL_11:
  topicClients = self->_topicClients;
  self->_topicClients = &v4->super;
}

- (SFAnalyticsTopic)initWithDictionary:(id)a3 name:(id)a4 samplingRates:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v54.receiver = self;
  v54.super_class = (Class)&OBJC_CLASS___SFAnalyticsTopic;
  id v11 = -[SFAnalyticsTopic init](&v54, "init");
  v12 = v11;
  if (v11)
  {
    v11->_terseMetrics = 0;
    objc_storeStrong((id *)&v11->_internalTopicName, a4);
    id v52 = v9;
    -[SFAnalyticsTopic setupClientsForTopic:](v12, "setupClientsForTopic:", v9);
    uint64_t v13 = objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:@"splunk_topic"]);
    splunkTopicName = v12->_splunkTopicName;
    v12->_splunkTopicName = (NSString *)v13;

    v15 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:@"splunk_uploadURL"]);
    uint64_t v16 = objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v15));
    splunkUploadURL = v12->__splunkUploadURL;
    v12->__splunkUploadURL = (NSURL *)v16;

    id v18 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:@"splunk_bagURL"]);
    uint64_t v19 = objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v18));
    splunkBagURL = v12->_splunkBagURL;
    v12->_splunkBagURL = (NSURL *)v19;

    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v8 valueForKey:@"splunk_allowInsecureCertificate"]);
    v12->_allowInsecureSplunkCert = [v21 BOOLValue];

    uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v8 valueForKey:@"uploadSizeLimit"]);
    v12->_uploadSizeLimit = (unint64_t)[v22 unsignedIntegerValue];

    v53 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:@"splunk_endpointDomain"]);
    v23 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:@"disableClientId"]);

    if (v23) {
      v12->_disableClientId = 1;
    }
    v24 = objc_alloc(&OBJC_CLASS___NSUserDefaults);
    id v25 = -[NSUserDefaults initWithSuiteName:](v24, "initWithSuiteName:", SFAnalyticsUserDefaultsSuite);
    id v26 = (void *)objc_claimAutoreleasedReturnValue(-[NSUserDefaults stringForKey:](v25, "stringForKey:", @"splunk_topic"));
    if (v26) {
      objc_storeStrong((id *)&v12->_splunkTopicName, v26);
    }
    v51 = v26;
    id v27 = (void *)objc_claimAutoreleasedReturnValue(-[NSUserDefaults stringForKey:](v25, "stringForKey:", @"splunk_uploadURL"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v27));

    if (v28) {
      objc_storeStrong((id *)&v12->__splunkUploadURL, v28);
    }
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[NSUserDefaults stringForKey:](v25, "stringForKey:", @"splunk_bagURL"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v29));

    if (v30) {
      objc_storeStrong((id *)&v12->_splunkBagURL, v30);
    }
    uint64_t v31 = -[NSUserDefaults integerForKey:](v25, "integerForKey:", @"uploadSizeLimit");
    if (v31 >= 1) {
      v12->_uploadSizeLimit = v31;
    }
    v12->_allowInsecureSplunkCert |= -[NSUserDefaults BOOLForKey:]( v25,  "BOOLForKey:",  @"splunk_allowInsecureCertificate");
    v32 = (void *)objc_claimAutoreleasedReturnValue(-[NSUserDefaults stringForKey:](v25, "stringForKey:", @"splunk_endpointDomain"));
    v33 = v32;
    if (v32)
    {
      id v34 = v32;

      v53 = v34;
    }

    int has_internal_diagnostics = os_variant_has_internal_diagnostics("com.apple.security");
    if (v10)
    {
      else {
        v36 = @"SecondsBetweenUploadsCustomer";
      }
      else {
        v37 = @"DevicePercentageCustomer";
      }
      v38 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:v36]);
      v39 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:v37]);
      v12->_unint64_t secondsBetweenUploads = (unint64_t)[v38 integerValue];
      v40 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:@"NumberOfEvents"]);
      v12->_unint64_t maxEventsToReport = (unint64_t)[v40 unsignedIntegerValue];

      [v39 floatValue];
      v12->_double devicePercentage = v41;
    }

    else
    {
      uint64_t v42 = 259200LL;
      unint64_t v43 = SFAnalyticsMaxEventsToReport;
      v12->_unint64_t secondsBetweenUploads = v42;
      v12->_unint64_t maxEventsToReport = v43;
      v12->_double devicePercentage = 100.0;
    }

    v44 = sub_100010B50("supd");
    v45 = (os_log_s *)objc_claimAutoreleasedReturnValue(v44);
    if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
    {
      internalTopicName = v12->_internalTopicName;
      unint64_t secondsBetweenUploads = v12->_secondsBetweenUploads;
      unint64_t maxEventsToReport = v12->_maxEventsToReport;
      double devicePercentage = v12->_devicePercentage;
      *(_DWORD *)buf = 138413058;
      v56 = internalTopicName;
      __int16 v57 = 2048;
      unint64_t v58 = secondsBetweenUploads;
      __int16 v59 = 2048;
      unint64_t v60 = maxEventsToReport;
      __int16 v61 = 2048;
      double v62 = devicePercentage;
      _os_log_impl( (void *)&_mh_execute_header,  v45,  OS_LOG_TYPE_DEFAULT,  "created %@ with %lu seconds between uploads, %lu max events, %f percent of uploads",  buf,  0x2Au);
    }

    id v9 = v52;
  }

  return v12;
}

- (BOOL)isSampledUpload
{
  uint32_t v3 = arc4random();
  double devicePercentage = self->_devicePercentage;
  if (devicePercentage >= 0.0000000232830644)
  {
  }

  else if (v3)
  {
    return 0;
  }

  return 1;
}

- (id)getSession
{
  uint32_t v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSURLSessionConfiguration ephemeralSessionConfiguration]( &OBJC_CLASS___NSURLSessionConfiguration,  "ephemeralSessionConfiguration"));
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"securityd/%s",  "61439.63.1",  @"User-Agent"));
  id v9 = v4;
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v9,  &v8,  1LL));
  [v3 setHTTPAdditionalHeaders:v5];

  v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSURLSession sessionWithConfiguration:delegate:delegateQueue:]( &OBJC_CLASS___NSURLSession,  "sessionWithConfiguration:delegate:delegateQueue:",  v3,  self,  0LL));
  return v6;
}

- (BOOL)postJSON:(id)a3 toEndpoint:(id)a4 postSession:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (v11)
  {
    uint64_t v13 = objc_alloc_init(&OBJC_CLASS___NSMutableURLRequest);
    -[NSMutableURLRequest setURL:](v13, "setURL:", v11);
    -[NSMutableURLRequest setHTTPMethod:](v13, "setHTTPMethod:", @"POST");
    id v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "supd_gzipDeflate"));
    -[NSMutableURLRequest setHTTPBody:](v13, "setHTTPBody:", v14);

    -[NSMutableURLRequest setValue:forHTTPHeaderField:]( v13,  "setValue:forHTTPHeaderField:",  @"gzip",  @"Content-Encoding");
    dispatch_semaphore_t v15 = dispatch_semaphore_create(0LL);
    uint64_t v28 = 0LL;
    v29 = &v28;
    uint64_t v30 = 0x2020000000LL;
    char v31 = 0;
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472LL;
    v24[2] = sub_10000C0C4;
    v24[3] = &unk_100018690;
    v24[4] = self;
    id v27 = &v28;
    id v25 = v11;
    uint64_t v16 = v15;
    id v26 = v16;
    id v17 = (void *)objc_claimAutoreleasedReturnValue([v12 dataTaskWithRequest:v13 completionHandler:v24]);
    id v18 = sub_100010B50("upload");
    uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      internalTopicName = self->_internalTopicName;
      *(_DWORD *)buf = 138412290;
      v33 = internalTopicName;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Splunk upload start for %@", buf, 0xCu);
    }

    [v17 resume];
    dispatch_time_t v21 = dispatch_time(0LL, 300000000000LL);
    dispatch_semaphore_wait(v16, v21);
    BOOL v22 = *((_BYTE *)v29 + 24) != 0;

    _Block_object_dispose(&v28, 8);
  }

  else
  {
    if (!a6)
    {
      BOOL v22 = 0;
      goto LABEL_8;
    }

    uint64_t v13 = (NSMutableURLRequest *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"No endpoint for %@",  self->_internalTopicName));
    NSErrorUserInfoKey v34 = NSLocalizedDescriptionKey;
    v35 = v13;
    uint64_t v16 = (dispatch_semaphore_s *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v35,  &v34,  1LL));
    BOOL v22 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"SupdUploadErrorDomain",  -10LL,  v16));
  }

LABEL_8:
  return v22;
}

- (BOOL)eventIsBlacklisted:(id)a3
{
  blacklistedEvents = self->_blacklistedEvents;
  if (!blacklistedEvents) {
    return 0;
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue([a3 objectForKeyedSubscript:SFAnalyticsEventType]);
  unsigned __int8 v5 = -[NSArray containsObject:](blacklistedEvents, "containsObject:", v4);

  return v5;
}

- (void)removeBlacklistedFieldsFromEvent:(id)a3
{
  id v4 = a3;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  unsigned __int8 v5 = self->_blacklistedFields;
  id v6 = -[NSArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v10,  v14,  16LL);
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      id v9 = 0LL;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend(v4, "removeObjectForKey:", *(void *)(*((void *)&v10 + 1) + 8 * (void)v9), (void)v10);
        id v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      id v7 = -[NSArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v10,  v14,  16LL);
    }

    while (v7);
  }
}

- (void)addRequiredFieldsToEvent:(id)a3
{
  id v4 = a3;
  metricsBase = self->_metricsBase;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10000C050;
  v7[3] = &unk_1000186B8;
  id v8 = v4;
  id v6 = v4;
  -[NSDictionary enumerateKeysAndObjectsUsingBlock:](metricsBase, "enumerateKeysAndObjectsUsingBlock:", v7);
}

- (BOOL)prepareEventForUpload:(id)a3 linkedUUID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unsigned __int8 v8 = -[SFAnalyticsTopic eventIsBlacklisted:](self, "eventIsBlacklisted:", v6);
  if ((v8 & 1) == 0)
  {
    -[SFAnalyticsTopic removeBlacklistedFieldsFromEvent:](self, "removeBlacklistedFieldsFromEvent:", v6);
    -[SFAnalyticsTopic addRequiredFieldsToEvent:](self, "addRequiredFieldsToEvent:", v6);
    if (self->_disableClientId) {
      [v6 setObject:&off_10001A240 forKeyedSubscript:@"clientId"];
    }
    splunkTopicName = self->_splunkTopicName;
    if (!splunkTopicName)
    {
      __int128 v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
      [v6 setObject:v12 forKeyedSubscript:@"topic"];

      if (!v7) {
        goto LABEL_7;
      }
      goto LABEL_6;
    }

    [v6 setObject:splunkTopicName forKeyedSubscript:@"topic"];
    if (v7)
    {
LABEL_6:
      __int128 v10 = (void *)objc_claimAutoreleasedReturnValue([v7 UUIDString]);
      [v6 setObject:v10 forKeyedSubscript:@"eventLinkID"];
    }
  }

- (void)addFailures:(id)a3 toUploadRecords:(id)a4 threshold:(unint64_t)a5 linkedUUID:(id)a6
{
  id v9 = a3;
  id v35 = a4;
  id v10 = a6;
  __int128 v51 = 0u;
  __int128 v52 = 0u;
  __int128 v53 = 0u;
  __int128 v54 = 0u;
  id v11 = [v9 countByEnumeratingWithState:&v51 objects:v57 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v52;
    do
    {
      for (i = 0LL; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v52 != v13) {
          objc_enumerationMutation(v9);
        }
        dispatch_semaphore_t v15 = *(void **)(*((void *)&v51 + 1) + 8LL * (void)i);
        v47[0] = _NSConcreteStackBlock;
        v47[1] = 3221225472LL;
        v47[2] = sub_10000BE38;
        v47[3] = &unk_1000186E0;
        unint64_t v50 = a5;
        v47[4] = self;
        id v48 = v10;
        id v49 = v35;
        [v15 enumerateObjectsUsingBlock:v47];
      }

      id v12 = [v9 countByEnumeratingWithState:&v51 objects:v57 count:16];
    }

    while (v12);
  }

  __int128 v45 = 0u;
  __int128 v46 = 0u;
  __int128 v44 = 0u;
  __int128 v43 = 0u;
  id v16 = v9;
  id v17 = [v16 countByEnumeratingWithState:&v43 objects:v56 count:16];
  if (v17)
  {
    id v18 = v17;
    uint64_t v19 = 0LL;
    uint64_t v20 = *(void *)v44;
    do
    {
      for (j = 0LL; j != v18; j = (char *)j + 1)
      {
        if (*(void *)v44 != v20) {
          objc_enumerationMutation(v16);
        }
        id v22 = [*(id *)(*((void *)&v43 + 1) + 8 * (void)j) count];
        v19 += ((uint64_t)v22 - a5) & ~((uint64_t)((uint64_t)v22 - a5) >> 63);
      }

      id v18 = [v16 countByEnumeratingWithState:&v43 objects:v56 count:16];
    }

    while (v18);
  }

  else
  {
    uint64_t v19 = 0LL;
  }

  id v23 = [v35 count];
  unint64_t maxEventsToReport = self->_maxEventsToReport;
  if ((unint64_t)v23 < maxEventsToReport && v19 >= 1)
  {
    id v25 = [v35 count];
    __int128 v39 = 0u;
    __int128 v40 = 0u;
    else {
      double v26 = 1.0;
    }
    __int128 v41 = 0uLL;
    __int128 v42 = 0uLL;
    id v27 = v16;
    id v28 = [v27 countByEnumeratingWithState:&v39 objects:v55 count:16];
    if (v28)
    {
      id v29 = v28;
      uint64_t v30 = *(void *)v40;
      do
      {
        for (k = 0LL; k != v29; k = (char *)k + 1)
        {
          if (*(void *)v40 != v30) {
            objc_enumerationMutation(v27);
          }
          v32 = *(void **)(*((void *)&v39 + 1) + 8LL * (void)k);
          if ((unint64_t)[v32 count] > a5)
          {
            v33 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v32,  "subarrayWithRange:",  a5,  (unint64_t)(v26 * (double)((unint64_t)objc_msgSend(v32, "count") - a5))));
            v36[0] = _NSConcreteStackBlock;
            v36[1] = 3221225472LL;
            v36[2] = sub_10000C004;
            v36[3] = &unk_100018708;
            v36[4] = self;
            id v37 = v10;
            id v38 = v35;
            [v33 enumerateObjectsUsingBlock:v36];
          }
        }

        id v29 = [v27 countByEnumeratingWithState:&v39 objects:v55 count:16];
      }

      while (v29);
    }
  }
}

- (id)sampleStatisticsForSamples:(id)a3 withName:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unsigned __int8 v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  unint64_t v9 = (unint64_t)[v6 count];
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v6 sortedArrayUsingSelector:"compare:"]);
  id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSExpression expressionForConstantValue:]( &OBJC_CLASS___NSExpression,  "expressionForConstantValue:",  v10));
  v68 = v11;
  id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v68, 1LL));

  if (v9 == 1)
  {
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v6 objectAtIndexedSubscript:0]);
    [v8 setObject:v13 forKeyedSubscript:v7];
LABEL_16:

    goto LABEL_17;
  }

  id v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSExpression expressionForFunction:arguments:]( &OBJC_CLASS___NSExpression,  "expressionForFunction:arguments:",  @"average:",  v12));
  dispatch_semaphore_t v15 = (void *)objc_claimAutoreleasedReturnValue([v14 expressionValueWithObject:0 context:0]);
  id v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@-avg", v7));
  [v8 setObject:v15 forKeyedSubscript:v16];

  if (!-[SFAnalyticsTopic terseMetrics](self, "terseMetrics"))
  {
    id v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSExpression expressionForFunction:arguments:]( &OBJC_CLASS___NSExpression,  "expressionForFunction:arguments:",  @"stddev:",  v12));
    id v18 = (void *)objc_claimAutoreleasedReturnValue([v17 expressionValueWithObject:0 context:0]);
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@-dev", v7));
    [v8 setObject:v18 forKeyedSubscript:v19];

    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSExpression expressionForFunction:arguments:]( &OBJC_CLASS___NSExpression,  "expressionForFunction:arguments:",  @"min:",  v12));
    dispatch_time_t v21 = (void *)objc_claimAutoreleasedReturnValue([v20 expressionValueWithObject:0 context:0]);
    id v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@-min", v7));
    [v8 setObject:v21 forKeyedSubscript:v22];

    id v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSExpression expressionForFunction:arguments:]( &OBJC_CLASS___NSExpression,  "expressionForFunction:arguments:",  @"max:",  v12));
    v24 = (void *)objc_claimAutoreleasedReturnValue([v23 expressionValueWithObject:0 context:0]);
    id v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@-max", v7));
    [v8 setObject:v24 forKeyedSubscript:v25];

    double v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSExpression expressionForFunction:arguments:]( &OBJC_CLASS___NSExpression,  "expressionForFunction:arguments:",  @"median:",  v12));
    id v27 = (void *)objc_claimAutoreleasedReturnValue([v26 expressionValueWithObject:0 context:0]);
    id v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@-med", v7));
    [v8 setObject:v27 forKeyedSubscript:v28];
  }

  if (v9 >= 4 && !-[SFAnalyticsTopic terseMetrics](self, "terseMetrics"))
  {
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@-1q", v7));
    id v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@-3q", v7));
    if ((v9 & 1) != 0)
    {
      if ((v9 & 3) == 3)
      {
        v63 = (void *)objc_claimAutoreleasedReturnValue([v10 objectAtIndexedSubscript:v9 >> 2]);
        [v63 doubleValue];
        double v50 = v49;
        __int128 v51 = (void *)objc_claimAutoreleasedReturnValue([v10 objectAtIndexedSubscript:(v9 >> 2) + 1]);
        [v51 doubleValue];
        double v42 = 0.25;
        v65 = v29;
        __int128 v53 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithDouble:]( &OBJC_CLASS___NSNumber,  "numberWithDouble:",  (v52 + v50 * 3.0) * 0.25));
        [v8 setObject:v53 forKeyedSubscript:v13];

        uint64_t v54 = 3 * (v9 >> 2);
        __int16 v61 = (void *)objc_claimAutoreleasedReturnValue([v10 objectAtIndexedSubscript:v54 + 1]);
        [v61 doubleValue];
        double v56 = v55;
        NSErrorUserInfoKey v34 = (void *)objc_claimAutoreleasedReturnValue([v10 objectAtIndexedSubscript:v54 + 2]);
        [v34 doubleValue];
        double v48 = v56 + v57 * 3.0;
      }

      else
      {
        if ((v9 & 3) != 1)
        {
LABEL_15:

          goto LABEL_16;
        }

        double v62 = (void *)objc_claimAutoreleasedReturnValue([v10 objectAtIndexedSubscript:(v9 >> 2) - 1]);
        [v62 doubleValue];
        double v39 = v38;
        __int128 v40 = (void *)objc_claimAutoreleasedReturnValue([v10 objectAtIndexedSubscript:v9 >> 2]);
        [v40 doubleValue];
        double v42 = 0.25;
        v65 = v29;
        __int128 v43 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithDouble:]( &OBJC_CLASS___NSNumber,  "numberWithDouble:",  (v39 + v41 * 3.0) * 0.25));
        [v8 setObject:v43 forKeyedSubscript:v13];

        uint64_t v44 = 3 * (v9 >> 2);
        __int16 v61 = (void *)objc_claimAutoreleasedReturnValue([v10 objectAtIndexedSubscript:v44]);
        [v61 doubleValue];
        double v46 = v45;
        NSErrorUserInfoKey v34 = (void *)objc_claimAutoreleasedReturnValue([v10 objectAtIndexedSubscript:v44 + 1]);
        [v34 doubleValue];
        double v48 = v47 + v46 * 3.0;
      }

      id v29 = v65;
      id v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v48 * v42));
      [v8 setObject:v35 forKeyedSubscript:v65];
    }

    else
    {
      unint64_t v30 = v9 >> 1;
      unint64_t v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "subarrayWithRange:", 0, v30));
      __int16 v59 = (void *)objc_claimAutoreleasedReturnValue( +[NSExpression expressionForConstantValue:]( &OBJC_CLASS___NSExpression,  "expressionForConstantValue:",  v60));
      v67 = v59;
      char v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v67, 1LL));
      v32 = (void *)objc_claimAutoreleasedReturnValue( +[NSExpression expressionForFunction:arguments:]( &OBJC_CLASS___NSExpression,  "expressionForFunction:arguments:",  @"median:",  v31));
      v64 = v29;
      v33 = (void *)objc_claimAutoreleasedReturnValue([v32 expressionValueWithObject:0 context:0]);
      [v8 setObject:v33 forKeyedSubscript:v13];

      __int16 v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "subarrayWithRange:", v30, v30));
      NSErrorUserInfoKey v34 = (void *)objc_claimAutoreleasedReturnValue( +[NSExpression expressionForConstantValue:]( &OBJC_CLASS___NSExpression,  "expressionForConstantValue:"));
      v66 = v34;
      id v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v66, 1LL));
      v36 = (void *)objc_claimAutoreleasedReturnValue( +[NSExpression expressionForFunction:arguments:]( &OBJC_CLASS___NSExpression,  "expressionForFunction:arguments:",  @"median:",  v35));
      id v37 = (void *)objc_claimAutoreleasedReturnValue([v36 expressionValueWithObject:0 context:0]);
      [v8 setObject:v37 forKeyedSubscript:v64];

      id v29 = v64;
    }

    goto LABEL_15;
  }

- (id)healthSummaryWithName:(id)a3 store:(id)a4 uuid:(id)a5 timestamp:(id)a6 lastUploadTime:(id)a7
{
  id v11 = a3;
  id v51 = a4;
  id v46 = a5;
  id v47 = a6;
  id v48 = a7;
  double v49 = v11;
  id v12 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v11 queue]);
  dispatch_assert_queue_V2(v12);

  double v50 = (void *)objc_claimAutoreleasedReturnValue([v11 name]);
  uint64_t v71 = 0LL;
  v72 = &v71;
  uint64_t v73 = 0x3032000000LL;
  v74 = sub_100005DB0;
  v75 = sub_100005DC0;
  id v76 = (id)0xAAAAAAAAAAAAAAAALL;
  id v76 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@HealthSummary",  v50));
  uint64_t v44 = SFAnalyticsEventType;
  objc_msgSend((id)v72[5], "setObject:forKeyedSubscript:", v13);

  if (-[SFAnalyticsTopic eventIsBlacklisted:](self, "eventIsBlacklisted:", v72[5]))
  {
    id v14 = 0LL;
  }

  else
  {
    [(id)v72[5] setObject:v47 forKeyedSubscript:SFAnalyticsEventTime];
    +[SFAnalytics addOSVersionToEvent:](&OBJC_CLASS___SFAnalytics, "addOSVersionToEvent:", v72[5]);
    if (v48) {
      [(id)v72[5] setObject:v48 forKeyedSubscript:SFAnalyticsAttributeLastUploadTime];
    }
    double v45 = (void *)objc_claimAutoreleasedReturnValue([v51 summaryCounts]);
    uint64_t v67 = 0LL;
    v68 = &v67;
    uint64_t v69 = 0x2020000000LL;
    uint64_t v70 = 0LL;
    uint64_t v63 = 0LL;
    v64 = &v63;
    uint64_t v65 = 0x2020000000LL;
    uint64_t v66 = 0LL;
    uint64_t v59 = 0LL;
    unint64_t v60 = &v59;
    uint64_t v61 = 0x2020000000LL;
    uint64_t v62 = 0LL;
    if (-[SFAnalyticsTopic terseMetrics](self, "terseMetrics")) {
      [(id)v72[5] setObject:&off_10001A258 forKeyedSubscript:@"T"];
    }
    v58[0] = _NSConcreteStackBlock;
    v58[1] = 3221225472LL;
    v58[2] = sub_10000BA9C;
    v58[3] = &unk_100018730;
    v58[4] = self;
    v58[5] = &v71;
    v58[6] = &v67;
    v58[7] = &v63;
    v58[8] = &v59;
    [v45 enumerateKeysAndObjectsUsingBlock:v58];
    dispatch_semaphore_t v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v68[3]));
    [(id)v72[5] setObject:v15 forKeyedSubscript:SFAnalyticsColumnSuccessCount];

    id v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v64[3]));
    [(id)v72[5] setObject:v16 forKeyedSubscript:SFAnalyticsColumnHardFailureCount];

    id v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v60[3]));
    [(id)v72[5] setObject:v17 forKeyedSubscript:SFAnalyticsColumnSoftFailureCount];

    uint64_t v18 = objc_claimAutoreleasedReturnValue([v51 metricsAccountID]);
    if (v18) {
      [(id)v72[5] setObject:v18 forKeyedSubscript:@"sfaAccountID"];
    }
    __int128 v43 = (void *)v18;
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    __int128 v56 = 0u;
    __int128 v57 = 0u;
    __int128 v54 = 0u;
    __int128 v55 = 0u;
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v51 samples]);
    id v21 = [v20 countByEnumeratingWithState:&v54 objects:v83 count:16];
    if (v21)
    {
      uint64_t v22 = *(void *)v55;
      uint64_t v23 = SFAnalyticsColumnSampleName;
      uint64_t v24 = SFAnalyticsColumnSampleValue;
      do
      {
        for (i = 0LL; i != v21; i = (char *)i + 1)
        {
          if (*(void *)v55 != v22) {
            objc_enumerationMutation(v20);
          }
          double v26 = *(void **)(*((void *)&v54 + 1) + 8LL * (void)i);
          id v27 = (void *)objc_claimAutoreleasedReturnValue([v26 objectForKeyedSubscript:v23]);
          id v28 = (void *)objc_claimAutoreleasedReturnValue([v19 objectForKeyedSubscript:v27]);
          BOOL v29 = v28 == 0LL;

          if (v29)
          {
            unint64_t v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
            char v31 = (void *)objc_claimAutoreleasedReturnValue([v26 objectForKeyedSubscript:v23]);
            [v19 setObject:v30 forKeyedSubscript:v31];
          }

          v32 = (void *)objc_claimAutoreleasedReturnValue([v26 objectForKeyedSubscript:v23]);
          v33 = (void *)objc_claimAutoreleasedReturnValue([v19 objectForKeyedSubscript:v32]);
          NSErrorUserInfoKey v34 = (void *)objc_claimAutoreleasedReturnValue([v26 objectForKeyedSubscript:v24]);
          [v33 addObject:v34];
        }

        id v21 = [v20 countByEnumeratingWithState:&v54 objects:v83 count:16];
      }

      while (v21);
    }

    v53[0] = _NSConcreteStackBlock;
    v53[1] = 3221225472LL;
    v53[2] = sub_10000BDE8;
    v53[3] = &unk_100018758;
    v53[4] = self;
    v53[5] = &v71;
    [v19 enumerateKeysAndObjectsUsingBlock:v53];
    if (-[SFAnalyticsTopic prepareEventForUpload:linkedUUID:](self, "prepareEventForUpload:linkedUUID:", v72[5], v46))
    {
      if (+[NSJSONSerialization isValidJSONObject:](&OBJC_CLASS___NSJSONSerialization, "isValidJSONObject:", v72[5]))
      {
        id v14 = (id)v72[5];
      }

      else
      {
        id v37 = sub_100010B50("SecError");
        double v38 = (os_log_s *)objc_claimAutoreleasedReturnValue(v37);
        if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v39 = v72[5];
          *(_DWORD *)buf = 138412546;
          v80 = v50;
          __int16 v81 = 2112;
          uint64_t v82 = v39;
          _os_log_impl( (void *)&_mh_execute_header,  v38,  OS_LOG_TYPE_DEFAULT,  "json: health summary for client %@ is invalid JSON: %@",  buf,  0x16u);
        }

        v78[0] = SFAnalyticsEventTypeErrorEvent;
        v77[0] = v44;
        v77[1] = SFAnalyticsEventErrorDestription;
        __int128 v40 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"JSON:%@HealthSummary",  v50));
        v78[1] = v40;
        double v41 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v78,  v77,  2LL));
        id v14 = [v41 mutableCopy];
      }
    }

    else
    {
      id v35 = sub_100010B50("SecWarning");
      v36 = (os_log_s *)objc_claimAutoreleasedReturnValue(v35);
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v80 = v50;
        _os_log_impl( (void *)&_mh_execute_header,  v36,  OS_LOG_TYPE_DEFAULT,  "supd: health summary for %@ blacklisted",  buf,  0xCu);
      }

      id v14 = 0LL;
    }

    _Block_object_dispose(&v59, 8);
    _Block_object_dispose(&v63, 8);
    _Block_object_dispose(&v67, 8);
  }

  _Block_object_dispose(&v71, 8);

  return v14;
}

- (void)updateUploadDateForClients:(id)a3 date:(id)a4 clearData:(BOOL)a5
{
  id v7 = a3;
  id v8 = a4;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  id v9 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v19;
    do
    {
      id v12 = 0LL;
      do
      {
        if (*(void *)v19 != v11) {
          objc_enumerationMutation(v7);
        }
        uint64_t v13 = *(void **)(*((void *)&v18 + 1) + 8LL * (void)v12);
        v14[0] = _NSConcreteStackBlock;
        v14[1] = 3221225472LL;
        v14[2] = sub_10000B930;
        v14[3] = &unk_100018780;
        id v15 = v8;
        id v16 = v13;
        BOOL v17 = a5;
        [v13 withStore:v14];

        id v12 = (char *)v12 + 1;
      }

      while (v10 != v12);
      id v10 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }

    while (v10);
  }
}

- (unint64_t)serializedEventSize:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = objc_autoreleasePoolPush();
  if (+[NSJSONSerialization isValidJSONObject:](&OBJC_CLASS___NSJSONSerialization, "isValidJSONObject:", v5))
  {
    id v16 = 0LL;
    id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSJSONSerialization dataWithJSONObject:options:error:]( &OBJC_CLASS___NSJSONSerialization,  "dataWithJSONObject:options:error:",  v5,  0LL,  &v16));
    id v8 = v16;
    if (v7)
    {
      id v9 = [v7 length];

      objc_autoreleasePoolPop(v6);
      goto LABEL_10;
    }

    id v15 = sub_100010B50("serializedEventSize");
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v18 = v8;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "failed to serialize event: %@", buf, 0xCu);
    }
  }

  else
  {
    id v10 = sub_100010B50("serializedEventSize");
    uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "invalid JSON object", buf, 2u);
    }

    NSErrorUserInfoKey v19 = NSLocalizedDescriptionKey;
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString localizedStringWithFormat:]( &OBJC_CLASS___NSString,  "localizedStringWithFormat:",  @"Event is not valid JSON: %@",  v5));
    __int128 v20 = v12;
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v20,  &v19,  1LL));
    id v8 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.security.supd",  2LL,  v13));
  }

  objc_autoreleasePoolPop(v6);
  if (a4)
  {
    id v8 = v8;
    id v9 = 0LL;
    *a4 = v8;
  }

  else
  {
    id v9 = 0LL;
  }

- (id)chunkFailureSet:(unint64_t)a3 events:(id)a4 error:(id *)a5
{
  id v7 = a4;
  id v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  __int128 v35 = 0u;
  id v9 = v7;
  id v10 = [v9 countByEnumeratingWithState:&v32 objects:v38 count:16];
  if (v10)
  {
    id v11 = v10;
    id v27 = a5;
    unint64_t v12 = 0LL;
    uint64_t v13 = 0LL;
    uint64_t v14 = *(void *)v33;
    id obj = v9;
    while (2)
    {
      for (i = 0LL; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v33 != v14) {
          objc_enumerationMutation(obj);
        }
        uint64_t v16 = *(void *)(*((void *)&v32 + 1) + 8LL * (void)i);
        id v31 = 0LL;
        unint64_t v17 = -[SFAnalyticsTopic serializedEventSize:error:](self, "serializedEventSize:error:", v16, &v31);
        id v18 = v31;
        if (v18)
        {
          uint64_t v22 = v18;
          if (v27) {
            *id v27 = v18;
          }
          uint64_t v23 = sub_100010B50("SecEmergency");
          uint64_t v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
          __int128 v20 = v28;
          id v9 = obj;
          if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
          {
            double v26 = (void *)objc_claimAutoreleasedReturnValue([v22 localizedDescription]);
            *(_DWORD *)buf = 138412290;
            id v37 = v26;
            _os_log_error_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_ERROR,  "Unable to serialize event JSON: %@",  buf,  0xCu);

            id v9 = obj;
          }

          id v21 = 0LL;
          goto LABEL_22;
        }

        if (v12 > 0x3E7 || v17 + v13 > a3)
        {
          if ([v8 count])
          {
            [v28 addObject:v8];
            uint64_t v19 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));

            unint64_t v12 = 0LL;
            uint64_t v13 = 0LL;
            id v8 = (void *)v19;
          }

          else
          {
            unint64_t v12 = 0LL;
            uint64_t v13 = 0LL;
          }
        }

        [v8 addObject:v16];
        ++v12;
        v13 += v17;
      }

      id v9 = obj;
      id v11 = [obj countByEnumeratingWithState:&v32 objects:v38 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }

  __int128 v20 = v28;
  if ([v8 count]) {
    [v28 addObject:v8];
  }
  id v21 = v28;
LABEL_22:

  return v21;
}

- (id)createEventDictionary:(id)a3 timestamp:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = objc_autoreleasePoolPush();
  v20[0] = SFAnalyticsPostTime;
  v20[1] = @"events";
  v21[0] = v8;
  v21[1] = v7;
  id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v21,  v20,  2LL));
  if (+[NSJSONSerialization isValidJSONObject:](&OBJC_CLASS___NSJSONSerialization, "isValidJSONObject:", v10))
  {
    objc_autoreleasePoolPop(v9);
    id v11 = 0LL;
  }

  else
  {
    unint64_t v12 = sub_100010B50("SecEmergency");
    uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_ERROR,  "json: final dictionary invalid JSON.",  buf,  2u);
    }

    NSErrorUserInfoKey v18 = NSLocalizedDescriptionKey;
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSString localizedStringWithFormat:]( &OBJC_CLASS___NSString,  "localizedStringWithFormat:",  @"Final dictionary for upload is invalid JSON: %@",  v10));
    uint64_t v19 = v14;
    id v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v19,  &v18,  1LL));
    id v11 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.security.supd",  2LL,  v15));

    objc_autoreleasePoolPop(v9);
    if (a5)
    {
      id v11 = v11;
      id v10 = 0LL;
      *a5 = v11;
    }

    else
    {
      id v10 = 0LL;
    }
  }

  return v10;
}

- (id)createChunkedLoggingJSON:(id)a3 failures:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  [v11 timeIntervalSince1970];
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v12 * 1000.0));

  id v28 = v8;
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( -[SFAnalyticsTopic chunkFailureSet:events:error:]( self,  "chunkFailureSet:events:error:",  -[SFAnalyticsTopic uploadSizeLimit](self, "uploadSizeLimit"),  v8,  a5));
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  __int128 v35 = 0u;
  __int128 v36 = 0u;
  id v15 = [v14 countByEnumeratingWithState:&v33 objects:v38 count:16];
  if (v15)
  {
    id v16 = v15;
    uint64_t v17 = *(void *)v34;
    do
    {
      NSErrorUserInfoKey v18 = 0LL;
      do
      {
        if (*(void *)v34 != v17) {
          objc_enumerationMutation(v14);
        }
        uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue( -[SFAnalyticsTopic createEventDictionary:timestamp:error:]( self,  "createEventDictionary:timestamp:error:",  *(void *)(*((void *)&v33 + 1) + 8LL * (void)v18),  v13,  a5));
        if (v19) {
          [v10 addObject:v19];
        }

        NSErrorUserInfoKey v18 = (char *)v18 + 1;
      }

      while (v16 != v18);
      id v16 = [v14 countByEnumeratingWithState:&v33 objects:v38 count:16];
    }

    while (v16);
  }

  __int128 v20 = (void *)objc_claimAutoreleasedReturnValue( -[SFAnalyticsTopic chunkFailureSet:events:error:]( self,  "chunkFailureSet:events:error:",  -[SFAnalyticsTopic uploadSizeLimit](self, "uploadSizeLimit"),  v9,  a5));

  __int128 v31 = 0u;
  __int128 v32 = 0u;
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  id v21 = v20;
  id v22 = [v21 countByEnumeratingWithState:&v29 objects:v37 count:16];
  if (v22)
  {
    id v23 = v22;
    uint64_t v24 = *(void *)v30;
    do
    {
      id v25 = 0LL;
      do
      {
        if (*(void *)v30 != v24) {
          objc_enumerationMutation(v21);
        }
        double v26 = (void *)objc_claimAutoreleasedReturnValue( -[SFAnalyticsTopic createEventDictionary:timestamp:error:]( self,  "createEventDictionary:timestamp:error:",  *(void *)(*((void *)&v29 + 1) + 8LL * (void)v25),  v13,  a5));
        if (v26) {
          [v10 addObject:v26];
        }

        id v25 = (char *)v25 + 1;
      }

      while (v23 != v25);
      id v23 = [v21 countByEnumeratingWithState:&v29 objects:v37 count:16];
    }

    while (v23);
  }

  return v10;
}

- (id)dataAnalyticsSetting:(id)a3
{
  uint32_t v3 = (void *)CFPreferencesCopyValue((CFStringRef)a3, @"com.apple.da", @"mobile", kCFPreferencesAnyHost);
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___NSString);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0) {
    id v5 = v3;
  }
  else {
    id v5 = 0LL;
  }

  return v5;
}

- (id)carryStatus
{
  if (os_variant_has_internal_diagnostics("com.apple.security"))
  {
    uint32_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[OSASystemConfiguration automatedDeviceGroup]( &OBJC_CLASS___OSASystemConfiguration,  "automatedDeviceGroup"));
    if (v4
      || (uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( -[SFAnalyticsTopic dataAnalyticsSetting:]( self,  "dataAnalyticsSetting:",  @"AutomatedDeviceGroup"))) != 0LL)
    {
      [v3 setObject:v4 forKeyedSubscript:@"automatedDeviceGroup"];
      id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SFAnalyticsTopic dataAnalyticsSetting:](self, "dataAnalyticsSetting:", @"ExperimentGroup"));
    }

    else
    {
      id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SFAnalyticsTopic dataAnalyticsSetting:](self, "dataAnalyticsSetting:", @"ExperimentGroup"));
      if (([v5 isEqual:@"walkabout"] & 1) != 0
        || [v5 isEqual:@"carry"])
      {
        [v3 setObject:&__kCFBooleanTrue forKeyedSubscript:@"carry"];
      }
    }

    if ([v3 count]) {
      id v6 = v3;
    }
    else {
      id v6 = 0LL;
    }
  }

  else
  {
    id v6 = 0LL;
  }

  id v7 = sub_100010B50("getLoggingJSON");
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412290;
    id v11 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "carrystatus is %@", (uint8_t *)&v10, 0xCu);
  }

  return v6;
}

- (BOOL)ckDeviceAccountApprovedTopic:(id)a3
{
  id v3 = a3;
  if (os_variant_has_internal_diagnostics("com.apple.security"))
  {
    if (qword_10001DB78 != -1) {
      dispatch_once(&qword_10001DB78, &stru_1000187A0);
    }
    unsigned __int8 v4 = [(id)qword_10001DB80 containsObject:v3];
  }

  else
  {
    unsigned __int8 v4 = 0;
  }

  return v4;
}

- (BOOL)copyEvents:(id)a3 failures:(id)a4 forUpload:(BOOL)a5 participatingClients:(id)a6 force:(BOOL)a7 linkedUUID:(id)a8 error:(id *)a9
{
  BOOL v35 = a5;
  id v40 = a3;
  id v33 = a4;
  id v13 = a6;
  id v44 = a8;
  double v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  __int128 v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  double v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  double v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  if (-[SFAnalyticsTopic ckDeviceAccountApprovedTopic:]( self,  "ckDeviceAccountApprovedTopic:",  self->_internalTopicName))
  {
    uint64_t v39 = (void *)objc_claimAutoreleasedReturnValue(-[SFAnalyticsTopic askSecurityForCKDeviceID](self, "askSecurityForCKDeviceID"));
    id v14 = sub_10000B0F8();
    double v38 = (void *)objc_claimAutoreleasedReturnValue(v14);
    id v37 = (void *)objc_claimAutoreleasedReturnValue(-[SFAnalyticsTopic appleUser](self, "appleUser"));
    __int128 v36 = (void *)objc_claimAutoreleasedReturnValue(-[SFAnalyticsTopic carryStatus](self, "carryStatus"));
    id v15 = sub_100010B50("getLoggingJSON");
    id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "including deviceID for internal user",  buf,  2u);
    }
  }

  else
  {
    uint64_t v17 = sub_100010B50("getLoggingJSON");
    id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "no deviceID for internal user", buf, 2u);
    }

    double v38 = 0LL;
    uint64_t v39 = 0LL;
    __int128 v36 = 0LL;
    id v37 = 0LL;
  }

  NSErrorUserInfoKey v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  [v18 timeIntervalSince1970];
  __int128 v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v19 * 1000.0));

  __int128 v62 = 0u;
  __int128 v63 = 0u;
  __int128 v60 = 0u;
  __int128 v61 = 0u;
  id v21 = self;
  id v22 = self->_topicClients;
  id v23 = -[NSArray countByEnumeratingWithState:objects:count:]( v22,  "countByEnumeratingWithState:objects:count:",  &v60,  v67,  16LL);
  if (v23)
  {
    id v24 = v23;
    uint64_t v25 = *(void *)v61;
    do
    {
      for (i = 0LL; i != v24; i = (char *)i + 1)
      {
        if (*(void *)v61 != v25) {
          objc_enumerationMutation(v22);
        }
        id v27 = *(void **)(*((void *)&v60 + 1) + 8LL * (void)i);
        v46[0] = _NSConcreteStackBlock;
        v46[1] = 3221225472LL;
        v46[2] = sub_10000B388;
        v46[3] = &unk_1000187C8;
        BOOL v58 = a7;
        BOOL v59 = v35;
        v46[4] = v27;
        v46[5] = v21;
        id v47 = v45;
        id v48 = v44;
        id v49 = v20;
        id v50 = v39;
        id v51 = v38;
        id v52 = v36;
        id v53 = v37;
        id v54 = v40;
        id v55 = v43;
        id v56 = v42;
        id v57 = v41;
        [v27 withStore:v46];
      }

      id v24 = -[NSArray countByEnumeratingWithState:objects:count:]( v22,  "countByEnumeratingWithState:objects:count:",  &v60,  v67,  16LL);
    }

    while (v24);
  }

  if (v35 && ![v45 count])
  {
    if (!a9)
    {
      BOOL v30 = 0;
      __int128 v29 = v33;
      goto LABEL_18;
    }

    id v28 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Upload too recent for all clients for %@",  v21->_internalTopicName));
    NSErrorUserInfoKey v65 = NSLocalizedDescriptionKey;
    uint64_t v66 = v28;
    __int128 v32 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v66,  &v65,  1LL));
    *a9 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"SupdUploadErrorDomain",  -10LL,  v32));

    BOOL v30 = 0;
    __int128 v29 = v33;
  }

  else
  {
    [v13 addObjectsFromArray:v45];
    id v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    -[SFAnalyticsTopic addFailures:toUploadRecords:threshold:linkedUUID:]( v21,  "addFailures:toUploadRecords:threshold:linkedUUID:",  v43,  v28,  v21->_maxEventsToReport / 0xA,  v44);
    -[SFAnalyticsTopic addFailures:toUploadRecords:threshold:linkedUUID:]( v21,  "addFailures:toUploadRecords:threshold:linkedUUID:",  v42,  v28,  v21->_maxEventsToReport / 0xA,  v44);
    -[SFAnalyticsTopic addFailures:toUploadRecords:threshold:linkedUUID:]( v21,  "addFailures:toUploadRecords:threshold:linkedUUID:",  v41,  v28,  0LL,  v44);
    __int128 v29 = v33;
    [v33 addObjectsFromArray:v28];
    BOOL v30 = 1;
  }

LABEL_18:
  return v30;
}

- (id)createChunkedLoggingJSON:(BOOL)a3 forUpload:(BOOL)a4 participatingClients:(id)a5 force:(BOOL)a6 error:(id *)a7
{
  BOOL v8 = a6;
  BOOL v9 = a4;
  id v11 = a5;
  double v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
  id v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  id v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  id v22 = 0LL;
  LODWORD(v9) = -[SFAnalyticsTopic copyEvents:failures:forUpload:participatingClients:force:linkedUUID:error:]( self,  "copyEvents:failures:forUpload:participatingClients:force:linkedUUID:error:",  v14,  v13,  v9,  v11,  v8,  v12,  &v22);

  id v15 = v22;
  id v16 = v15;
  if (v9 && v15 == 0LL)
  {
    if ((unint64_t)[v13 count] > self->_maxEventsToReport)
    {
      double v19 = (void *)objc_claimAutoreleasedReturnValue([v13 subarrayWithRange:0]);
      id v20 = [v19 mutableCopy];

      id v13 = v20;
    }

    NSErrorUserInfoKey v18 = (void *)objc_claimAutoreleasedReturnValue( -[SFAnalyticsTopic createChunkedLoggingJSON:failures:error:]( self,  "createChunkedLoggingJSON:failures:error:",  v14,  v13,  a7));
  }

  else
  {
    NSErrorUserInfoKey v18 = 0LL;
    if (a7) {
      *a7 = v15;
    }
  }

  return v18;
}

- (id)createLoggingJSON:(BOOL)a3 forUpload:(BOOL)a4 participatingClients:(id)a5 force:(BOOL)a6 error:(id *)a7
{
  BOOL v8 = a6;
  BOOL v9 = a4;
  id v11 = a5;
  double v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  id v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  id v25 = 0LL;
  LODWORD(v9) = -[SFAnalyticsTopic copyEvents:failures:forUpload:participatingClients:force:linkedUUID:error:]( self,  "copyEvents:failures:forUpload:participatingClients:force:linkedUUID:error:",  v13,  v12,  v9,  v11,  v8,  0LL,  &v25);

  id v14 = v25;
  id v15 = v14;
  if (v9 && v14 == 0LL)
  {
    if ((unint64_t)[v12 count] > self->_maxEventsToReport)
    {
      NSErrorUserInfoKey v18 = (void *)objc_claimAutoreleasedReturnValue([v12 subarrayWithRange:0]);
      id v19 = [v18 mutableCopy];

      double v12 = v19;
    }

    id v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    [v20 addObjectsFromArray:v13];
    [v20 addObjectsFromArray:v12];
    id v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    [v21 timeIntervalSince1970];
    id v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v22 * 1000.0));
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue( -[SFAnalyticsTopic createEventDictionary:timestamp:error:]( self,  "createEventDictionary:timestamp:error:",  v20,  v23,  a7));
  }

  else
  {
    uint64_t v17 = 0LL;
    if (a7) {
      *a7 = v14;
    }
  }

  return v17;
}

- (BOOL)haveEligibleClients
{
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SFAnalyticsTopic topicClients](self, "topicClients", 0LL));
  id v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v11;
    while (2)
    {
      id v6 = 0LL;
      do
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v10 + 1) + 8LL * (void)v6);
        if (qword_10001DB98 != -1) {
          dispatch_once(&qword_10001DB98, &stru_100018928);
        }
        if (byte_10001DB90)
        {
LABEL_13:
          if (qword_10001DBA8 != -1) {
            dispatch_once(&qword_10001DBA8, &stru_100018948);
          }
          if (byte_10001DBA0)
          {
LABEL_17:
            BOOL v8 = 1;
            goto LABEL_19;
          }
        }

        id v6 = (char *)v6 + 1;
      }

      while (v4 != v6);
      id v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
      BOOL v8 = 0;
      if (v4) {
        continue;
      }
      break;
    }
  }

  else
  {
    BOOL v8 = 0;
  }

- (id)askSecurityForCKDeviceID
{
  id v17 = 0LL;
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[CKKSControl controlObject:](&OBJC_CLASS___CKKSControl, "controlObject:", &v17));
  id v3 = v17;
  if (v3) {
    BOOL v4 = 1;
  }
  else {
    BOOL v4 = v2 == 0LL;
  }
  if (v4)
  {
    uint64_t v5 = sub_100010B50("SecError");
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v3;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "unable to obtain CKKS endpoint: %@",  (uint8_t *)&buf,  0xCu);
    }

    id v7 = 0LL;
  }

  else
  {
    *(void *)&__int128 buf = 0LL;
    *((void *)&buf + 1) = &buf;
    uint64_t v19 = 0x3032000000LL;
    id v20 = sub_100005DB0;
    id v21 = sub_100005DC0;
    id v22 = 0LL;
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_10000ACE8;
    v14[3] = &unk_1000187F0;
    p___int128 buf = &buf;
    BOOL v8 = dispatch_semaphore_create(0LL);
    id v15 = v8;
    [v2 rpcGetCKDeviceIDWithReply:v14];
    dispatch_time_t v9 = dispatch_time(0LL, 10000000000LL);
    if (dispatch_semaphore_wait(v8, v9))
    {
      __int128 v10 = sub_100010B50("SecError");
      __int128 v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)__int128 v13 = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "timed out waiting for a response from security",  v13,  2u);
      }

      id v7 = 0LL;
    }

    else
    {
      id v7 = *(id *)(*((void *)&buf + 1) + 40LL);
    }

    _Block_object_dispose(&buf, 8);
  }

  return v7;
}

- (id)appleUser
{
  v2 = objc_alloc_init(&OBJC_CLASS___ACAccountStore);
  id v3 = (void *)objc_claimAutoreleasedReturnValue( -[ACAccountStore accountTypeWithAccountTypeIdentifier:]( v2,  "accountTypeWithAccountTypeIdentifier:",  ACAccountTypeIdentifierIMAP));
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[ACAccountStore accountsWithAccountType:](v2, "accountsWithAccountType:", v3));
  id v25 = [v4 countByEnumeratingWithState:&v30 objects:v35 count:16];
  if (v25)
  {
    uint64_t v5 = *(void *)v31;
    uint64_t v6 = ACEmailAliasKeyEmailAddresses;
    id v7 = &ACAccountTypeIdentifierIMAP_ptr;
    uint64_t v23 = *(void *)v31;
    id v24 = v3;
    uint64_t v22 = ACEmailAliasKeyEmailAddresses;
    do
    {
      BOOL v8 = 0LL;
      do
      {
        if (*(void *)v31 != v5) {
          objc_enumerationMutation(v4);
        }
        dispatch_time_t v9 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( *(id *)(*((void *)&v30 + 1) + 8 * (void)v8),  "objectForKeyedSubscript:",  v6,  v22,  v23));
        uint64_t v10 = objc_opt_class(v7[31]);
        if ((objc_opt_isKindOfClass(v9, v10) & 1) != 0)
        {
          id v11 = (id)objc_claimAutoreleasedReturnValue([v9 allKeys]);
        }

        else
        {
          uint64_t v12 = objc_opt_class(&OBJC_CLASS___NSArray);
          if ((objc_opt_isKindOfClass(v9, v12) & 1) != 0)
          {
            id v11 = v9;
          }

          else
          {
            uint64_t v13 = objc_opt_class(&OBJC_CLASS___NSString);
            if ((objc_opt_isKindOfClass(v9, v13) & 1) != 0) {
              id v11 = (id)objc_claimAutoreleasedReturnValue([v9 componentsSeparatedByString:@","]);
            }
            else {
              id v11 = 0LL;
            }
          }
        }

        __int128 v28 = 0u;
        __int128 v29 = 0u;
        __int128 v26 = 0u;
        __int128 v27 = 0u;
        id v14 = v11;
        id v15 = [v14 countByEnumeratingWithState:&v26 objects:v34 count:16];
        if (v15)
        {
          id v16 = v15;
          uint64_t v17 = *(void *)v27;
          while (2)
          {
            for (i = 0LL; i != v16; i = (char *)i + 1)
            {
              if (*(void *)v27 != v17) {
                objc_enumerationMutation(v14);
              }
              uint64_t v19 = *(void **)(*((void *)&v26 + 1) + 8LL * (void)i);
              if ([v19 hasSuffix:@"@apple.com"])
              {
                id v20 = v19;

                id v3 = v24;
                goto LABEL_26;
              }
            }

            id v16 = [v14 countByEnumeratingWithState:&v26 objects:v34 count:16];
            if (v16) {
              continue;
            }
            break;
          }
        }

        BOOL v8 = (char *)v8 + 1;
        uint64_t v6 = v22;
        uint64_t v5 = v23;
        id v7 = &ACAccountTypeIdentifierIMAP_ptr;
      }

      while (v8 != v25);
      id v20 = 0LL;
      id v3 = v24;
      id v25 = [v4 countByEnumeratingWithState:&v30 objects:v35 count:16];
    }

    while (v25);
  }

  else
  {
    id v20 = 0LL;
  }

- (id)splunkUploadURL:(BOOL)a3 urlSession:(id)a4
{
  id v6 = a4;
  if (a3 || -[SFAnalyticsTopic haveEligibleClients](self, "haveEligibleClients"))
  {
    splunkUploadURL = self->__splunkUploadURL;
    if (splunkUploadURL)
    {
      BOOL v8 = splunkUploadURL;
    }

    else
    {
      dispatch_time_t v9 = sub_100010B50("getURL");
      uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        id v11 = (void *)objc_claimAutoreleasedReturnValue(-[SFAnalyticsTopic internalTopicName](self, "internalTopicName"));
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = v11;
        _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Asking server for endpoint and config data for topic %@",  (uint8_t *)&buf,  0xCu);
      }

      id location = (id)0xAAAAAAAAAAAAAAAALL;
      objc_initWeak(&location, self);
      dispatch_semaphore_t v12 = dispatch_semaphore_create(0LL);
      *(void *)&__int128 buf = 0LL;
      *((void *)&buf + 1) = &buf;
      uint64_t v36 = 0x3032000000LL;
      id v37 = sub_100005DB0;
      double v38 = sub_100005DC0;
      id v39 = 0LL;
      uint64_t v13 = self->_splunkBagURL;
      uint64_t v28 = 0LL;
      __int128 v29 = &v28;
      uint64_t v30 = 0x3032000000LL;
      __int128 v31 = sub_100005DB0;
      __int128 v32 = sub_100005DC0;
      id v33 = 0LL;
      v22[0] = _NSConcreteStackBlock;
      v22[1] = 3221225472LL;
      v22[2] = sub_10000A75C;
      v22[3] = &unk_100018818;
      objc_copyWeak(&v27, &location);
      p___int128 buf = &buf;
      v22[4] = self;
      id v14 = v12;
      uint64_t v23 = v14;
      __int128 v26 = &v28;
      id v15 = v13;
      id v24 = v15;
      id v16 = (void *)objc_claimAutoreleasedReturnValue([v6 dataTaskWithURL:v15 completionHandler:v22]);
      [v16 resume];
      dispatch_time_t v17 = dispatch_time(0LL, 60000000000LL);
      dispatch_semaphore_wait(v14, v17);
      BOOL v8 = (NSURL *)(id)v29[5];

      objc_destroyWeak(&v27);
      _Block_object_dispose(&v28, 8);

      _Block_object_dispose(&buf, 8);
      objc_destroyWeak(&location);
    }
  }

  else
  {
    NSErrorUserInfoKey v18 = sub_100010B50("getURL");
    uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      id v20 = (void *)objc_claimAutoreleasedReturnValue(-[SFAnalyticsTopic internalTopicName](self, "internalTopicName"));
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v20;
      _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "Not going to talk to server for topic %@ because no eligible clients",  (uint8_t *)&buf,  0xCu);
    }

    BOOL v8 = 0LL;
  }

  return v8;
}

- (void)URLSession:(id)a3 didReceiveChallenge:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = (void (**)(id, uint64_t, void))a5;
  if (!v10)
  {
    id v11 = sub_100010B50("SecError");
    dispatch_semaphore_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 138412546;
      *(void *)&uint8_t buf[4] = @"Execution has encountered an unexpected state";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 1405091854;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Simulating crash, reason: %@, code=%08x",  buf,  0x12u);
    }

    int v13 = dword_10001DB58;
    if (dword_10001DB58 == -1)
    {
      if (!qword_10001DBD8)
      {
        *(_OWORD *)__int128 buf = off_100018CF0;
        *(void *)&uint8_t buf[16] = 0LL;
        qword_10001DBD8 = _sl_dlopen(buf, 0LL);
      }

      if (qword_10001DBD8)
      {
        uint64_t v14 = getpid();
        id v15 = @"Execution has encountered an unexpected state";
        *(void *)__int128 buf = 0LL;
        *(void *)&uint8_t buf[8] = buf;
        *(void *)&uint8_t buf[16] = 0x2020000000LL;
        id v16 = off_10001DBE0;
        __int128 v34 = off_10001DBE0;
        if (off_10001DBE0) {
          goto LABEL_15;
        }
        __int128 v32 = 0LL;
        if (!qword_10001DBD8)
        {
          __int128 v35 = off_100018CF0;
          uint64_t v36 = 0LL;
          qword_10001DBD8 = _sl_dlopen(&v35, &v32);
        }

        id v16 = (void *)qword_10001DBD8;
        if (!qword_10001DBD8)
        {
          id v8 = (id)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
          id v9 = (id)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "void *CrashReporterSupportLibrary(void)"));
          objc_msgSend( v8,  "handleFailureInFunction:file:lineNumber:description:",  v9,  @"simulate_crash.m",  18,  @"%s",  v32);

          goto LABEL_36;
        }

        dispatch_time_t v17 = v32;
        if (v32) {
          goto LABEL_37;
        }
        while (1)
        {
          id v16 = dlsym(v16, "SimulateCrash");
          *(void *)(*(void *)&buf[8] + 24LL) = v16;
          off_10001DBE0 = v16;
LABEL_15:
          _Block_object_dispose(buf, 8);
          if (v16) {
            break;
          }
          id v8 = (id)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
          id v9 = (id)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "BOOL soft_SimulateCrash(pid_t, mach_exception_data_type_t, NSString *__strong)"));
          objc_msgSend( v8,  "handleFailureInFunction:file:lineNumber:description:",  v9,  @"simulate_crash.m",  22,  @"%s",  dlerror());

LABEL_36:
          __break(1u);
LABEL_37:
          free(v17);
        }

        ((void (*)(uint64_t, uint64_t, const __CFString *))v16)( v14,  1405091854LL,  @"Execution has encountered an unexpected state");

        goto LABEL_17;
      }

      int v13 = dword_10001DB58;
    }

    dword_10001DB58 = v13 + 1;
  }

- (id)eventDictWithBlacklistedFieldsStrippedFrom:(id)a3
{
  id v4 = [a3 mutableCopy];
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  uint64_t v5 = self->_blacklistedFields;
  id v6 = -[NSArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v11,  v15,  16LL);
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      id v9 = 0LL;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend(v4, "removeObjectForKey:", *(void *)(*((void *)&v11 + 1) + 8 * (void)v9), (void)v11);
        id v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      id v7 = -[NSArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v11,  v15,  16LL);
    }

    while (v7);
  }

  return v4;
}

- (NSString)splunkTopicName
{
  return (NSString *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setSplunkTopicName:(id)a3
{
}

- (NSURL)splunkBagURL
{
  return (NSURL *)objc_getProperty(self, a2, 32LL, 1);
}

- (void)setSplunkBagURL:(id)a3
{
}

- (NSString)internalTopicName
{
  return (NSString *)objc_getProperty(self, a2, 40LL, 1);
}

- (void)setInternalTopicName:(id)a3
{
}

- (unint64_t)uploadSizeLimit
{
  return self->_uploadSizeLimit;
}

- (void)setUploadSizeLimit:(unint64_t)a3
{
  self->_uploadSizeLimit = a3;
}

- (NSArray)topicClients
{
  return (NSArray *)objc_getProperty(self, a2, 56LL, 1);
}

- (void)setTopicClients:(id)a3
{
}

- (NSURL)_splunkUploadURL
{
  return (NSURL *)objc_getProperty(self, a2, 64LL, 1);
}

- (void)set_splunkUploadURL:(id)a3
{
}

- (BOOL)allowInsecureSplunkCert
{
  return self->_allowInsecureSplunkCert;
}

- (void)setAllowInsecureSplunkCert:(BOOL)a3
{
  self->_allowInsecureSplunkCert = a3;
}

- (BOOL)ignoreServersMessagesTellingUsToGoAway
{
  return self->_ignoreServersMessagesTellingUsToGoAway;
}

- (void)setIgnoreServersMessagesTellingUsToGoAway:(BOOL)a3
{
  self->_ignoreServersMessagesTellingUsToGoAway = a3;
}

- (BOOL)disableUploads
{
  return self->_disableUploads;
}

- (void)setDisableUploads:(BOOL)a3
{
  self->_disableUploads = a3;
}

- (BOOL)disableClientId
{
  return self->_disableClientId;
}

- (void)setDisableClientId:(BOOL)a3
{
  self->_disableClientId = a3;
}

- (BOOL)terseMetrics
{
  return self->_terseMetrics;
}

- (void)setTerseMetrics:(BOOL)a3
{
  self->_terseMetrics = a3;
}

- (unint64_t)secondsBetweenUploads
{
  return self->_secondsBetweenUploads;
}

- (void)setSecondsBetweenUploads:(unint64_t)a3
{
  self->_unint64_t secondsBetweenUploads = a3;
}

- (unint64_t)maxEventsToReport
{
  return self->_maxEventsToReport;
}

- (void)setMaxEventsToReport:(unint64_t)a3
{
  self->_unint64_t maxEventsToReport = a3;
}

- (float)devicePercentage
{
  return self->_devicePercentage;
}

- (void)setDevicePercentage:(float)a3
{
  self->_double devicePercentage = a3;
}

- (NSDictionary)metricsBase
{
  return (NSDictionary *)objc_getProperty(self, a2, 88LL, 1);
}

- (void)setMetricsBase:(id)a3
{
}

- (NSArray)blacklistedFields
{
  return (NSArray *)objc_getProperty(self, a2, 96LL, 1);
}

- (void)setBlacklistedFields:(id)a3
{
}

- (NSArray)blacklistedEvents
{
  return (NSArray *)objc_getProperty(self, a2, 104LL, 1);
}

- (void)setBlacklistedEvents:(id)a3
{
}

- (void).cxx_destruct
{
}

+ (id)databasePathForCKKS
{
  CFURLRef v2 = sub_100010C4C(@"Library/Keychains", (uint64_t)@"Analytics/ckks_analytics.db");
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[__CFURL path](v2, "path"));

  return v3;
}

+ (id)databasePathForSOS
{
  CFURLRef v2 = sub_100010C4C(@"Library/Keychains", (uint64_t)@"Analytics/sos_analytics.db");
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[__CFURL path](v2, "path"));

  return v3;
}

+ (id)AppSupportPath
{
  return @"/var/mobile/Library/Application Support";
}

+ (id)databasePathForPCS
{
  CFURLRef v2 = (void *)objc_claimAutoreleasedReturnValue([a1 AppSupportPath]);
  if (v2)
  {
    id v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@/com.apple.ProtectedCloudStorage/PCSAnalytics.db",  v2));
    id v4 = sub_100010B50("supd");
    uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 138412290;
      uint64_t v8 = v3;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "PCS Database path (%@)", buf, 0xCu);
    }
  }

  else
  {
    id v3 = 0LL;
  }

  return v3;
}

+ (id)databasePathForLocal
{
  CFURLRef v2 = sub_100010C4C(@"Library/Keychains", (uint64_t)@"Analytics/localkeychain.db");
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[__CFURL path](v2, "path"));

  return v3;
}

+ (id)databasePathForTrust
{
  CFURLRef v2 = sub_100010C4C(@"Library/Keychains", (uint64_t)@"Analytics/trust_analytics.db");
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[__CFURL path](v2, "path"));

  return v3;
}

+ (id)databasePathForNetworking
{
  CFURLRef v2 = sub_100010C4C(@"Library/Keychains", (uint64_t)@"Analytics/networking_analytics.db");
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[__CFURL path](v2, "path"));

  return v3;
}

+ (id)databasePathForCloudServices
{
  CFURLRef v2 = sub_100010C4C(@"Library/Keychains", (uint64_t)@"Analytics/CloudServicesAnalytics.db");
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[__CFURL path](v2, "path"));

  return v3;
}

+ (id)databasePathForTransparency
{
  CFURLRef v2 = sub_100010C4C(@"Library/Keychains", (uint64_t)@"Analytics/TransparencyAnalytics.db");
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[__CFURL path](v2, "path"));

  return v3;
}

+ (id)databasePathForSWTransparency
{
  CFURLRef v2 = sub_100010C4C(@"Library/Keychains", (uint64_t)@"Analytics/SWTransparencyAnalytics.db");
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[__CFURL path](v2, "path"));

  return v3;
}

@end
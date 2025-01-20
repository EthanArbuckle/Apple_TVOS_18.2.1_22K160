@interface WAIOReporterMessagePopulator
+ (BOOL)supportsSecureCoding;
+ (id)getIORPopAvailabeIOReportersTempFile;
+ (id)getUnavailablePredTempFile;
+ (id)getUsageTempFile;
- (BOOL)_runIOLegendTest;
- (BOOL)doesMessageNeedPrepopulation:(id)a3;
- (BOOL)failNextCreateOrUpdateSample;
- (BOOL)hasAttemptedUnpersisting;
- (BOOL)ioReportersCacheNeedsUpdating;
- (BOOL)persistFileExistedAtPIDLoad;
- (BOOL)persistTimerRunning;
- (BOOL)rescanTimerRunning;
- (BOOL)runIOLegendTest;
- (NSDate)pidLaunchDate;
- (NSMutableArray)cachedPredicatesNotYetFound;
- (NSMutableDictionary)cachedChannelsCountPerIORPopulatable;
- (NSMutableDictionary)cachedIOPopAvailableChannels;
- (NSMutableDictionary)cachedIOReportSample;
- (NSMutableDictionary)cachedIOReportSubbedChannels;
- (NSMutableDictionary)cachedUsage;
- (NSNumber)providerNum;
- (NSString)drvName;
- (NSString)drvPath;
- (NSString)infraInterfaceName;
- (OS_dispatch_queue)queue;
- (OS_dispatch_source)persistTimer;
- (OS_dispatch_source)rescanTimer;
- (RecommendationPreferences)preferences;
- (WAApple80211)apple80211Wrapper;
- (WAIOReporterMessagePopulator)init;
- (WAIOReporterMessagePopulator)initWithCoder:(id)a3;
- (WAIOReporterPersistenceDelegate)persistenceDelegate;
- (WAIOReporterPopulatorMessageDelegate)messageDelegate;
- (id)_buildPredicateList:(int64_t)a3 wlan:(int64_t)a4;
- (id)_createStructuredIOReportDictionary:(id)a3;
- (id)_getCachedUsage;
- (id)createChannelWithProviderID:(id)a3 providerName:(id)a4 legCh:(id)a5 groupName:(id)a6 subgroupName:(id)a7 chinfo:(id)a8;
- (id)getCachedUsage;
- (int)pid;
- (int64_t)wlanType;
- (unint64_t)_addDriverChannelsMatchingPredicateList:(int64_t)a3;
- (unsigned)_getCCPipeDriverForWLAN;
- (unsigned)_getIOServiceWithForceRefresh:(BOOL)a3 apple80211:(id)a4;
- (unsigned)_iorPreparedForSampling:(unsigned __int8)a3;
- (unsigned)doesChannelExistInStructuredDict:(id)a3 providerName:(id)a4 legCh:(id)a5 groupName:(id)a6 subgroupName:(id)a7 chinfo:(id)a8;
- (unsigned)doesDriverHaveChannelsInStructuredDict:(int64_t)a3 containsStale:(char *)a4;
- (unsigned)srv;
- (void)_buildOrRescanToBuildChannelAvailabilityCaches:(int64_t)a3;
- (void)_calculateEstimatedUptime;
- (void)_cancelDelayedInvocationForPersist;
- (void)_cancelDelayedInvocationForRescan;
- (void)_clearIOReporterCache;
- (void)_delayedInvocationForPersist;
- (void)_delayedInvocationForRescan;
- (void)_findChannelsAndBuildChannelCaches:(int64_t)a3;
- (void)_freeIORCaches;
- (void)_freeSubscriptionSample:(id)a3;
- (void)_handleUnpersistForUsageData;
- (void)_incrementPredicateCachedUsageWithPrefix:(id)a3 q:(id *)a4;
- (void)_persistIORObjects:(unsigned __int8)a3;
- (void)_prepopulateMessage:(id)a3 forProcess:(id)a4 groupType:(int64_t)a5 andReply:(id)a6 isResubscribe:(BOOL)a7;
- (void)_removeIORChannelsPersistenceFiles;
- (void)_scanPredicatesWithMode:(int64_t)a3;
- (void)_signalPotentialNewIORChannels;
- (void)_unpersistIORObjects;
- (void)determineChannelsPerIORPopulatable;
- (void)determineChannelsPerIORPopulatableWithinPopulatorBlock;
- (void)encodeWithCoder:(id)a3;
- (void)freeIORCaches;
- (void)injectErrorOnNextCreateOrUpdateSample;
- (void)persistIORObjects:(unsigned __int8)a3;
- (void)prepopulateMessage:(id)a3 forProcess:(id)a4 groupType:(int64_t)a5 andReply:(id)a6;
- (void)prepopulateMessageWithinPopulatorBlock:(id)a3 forProcess:(id)a4 groupType:(int64_t)a5 andReply:(id)a6;
- (void)scanPredicatesNotYetFoundAndMutable;
- (void)setApple80211Wrapper:(id)a3;
- (void)setCachedChannelsCountPerIORPopulatable:(id)a3;
- (void)setCachedIOPopAvailableChannels:(id)a3;
- (void)setCachedIOReportSample:(id)a3;
- (void)setCachedIOReportSubbedChannels:(id)a3;
- (void)setCachedPredicatesNotYetFound:(id)a3;
- (void)setCachedUsage:(id)a3;
- (void)setDrvName:(id)a3;
- (void)setDrvPath:(id)a3;
- (void)setFailNextCreateOrUpdateSample:(BOOL)a3;
- (void)setHasAttemptedUnpersisting:(BOOL)a3;
- (void)setInfraInterfaceName:(id)a3;
- (void)setIoReportersCacheNeedsUpdating:(BOOL)a3;
- (void)setMessageDelegate:(id)a3;
- (void)setPersistFileExistedAtPIDLoad:(BOOL)a3;
- (void)setPersistTimer:(id)a3;
- (void)setPersistTimerRunning:(BOOL)a3;
- (void)setPersistenceDelegate:(id)a3;
- (void)setPid:(int)a3;
- (void)setPidLaunchDate:(id)a3;
- (void)setPreferences:(id)a3;
- (void)setProviderNum:(id)a3;
- (void)setQueue:(id)a3;
- (void)setRescanTimer:(id)a3;
- (void)setRescanTimerRunning:(BOOL)a3;
- (void)setSrv:(unsigned int)a3;
- (void)setWlanType:(int64_t)a3;
- (void)signalPotentialNewIORChannels;
- (void)unpersistIORObjects;
@end

@implementation WAIOReporterMessagePopulator

- (WAIOReporterMessagePopulator)init
{
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___WAIOReporterMessagePopulator;
  v2 = -[WAIOReporterMessagePopulator init](&v18, "init");
  if (v2)
  {
    if (qword_1000ECF28 != -1) {
      dispatch_once(&qword_1000ECF28, &stru_1000CCCC0);
    }
    if (qword_1000ECF10 != -1) {
      dispatch_once(&qword_1000ECF10, &stru_1000CCC60);
    }
    if (qword_1000ECF18 != -1) {
      dispatch_once(&qword_1000ECF18, &stru_1000CCC80);
    }
    if (qword_1000ECF20 != -1) {
      dispatch_once(&qword_1000ECF20, &stru_1000CCCA0);
    }
    v3 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    -[WAIOReporterMessagePopulator setCachedPredicatesNotYetFound:](v2, "setCachedPredicatesNotYetFound:", v3);

    v4 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    -[WAIOReporterMessagePopulator setCachedUsage:](v2, "setCachedUsage:", v4);

    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"dunno"));
    -[WAIOReporterMessagePopulator setInfraInterfaceName:](v2, "setInfraInterfaceName:", v5);

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[RecommendationPreferences sharedObject](&OBJC_CLASS___RecommendationPreferences, "sharedObject"));
    -[WAIOReporterMessagePopulator setPreferences:](v2, "setPreferences:", v6);

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[WAIOReporterMessagePopulator preferences](v2, "preferences"));
    if (v7)
    {
      *(_WORD *)&v2->_ioReportersCacheNeedsUpdating = 0;
      v2->_persistFileExistedAtPIDLoad = 0;
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSProcessInfo processInfo](&OBJC_CLASS___NSProcessInfo, "processInfo"));
      v2->_pid = [v8 processIdentifier];

      uint64_t v9 = objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
      pidLaunchDate = v2->_pidLaunchDate;
      v2->_pidLaunchDate = (NSDate *)v9;

      v2->_srv = 0;
      drvName = v2->_drvName;
      v2->_drvName = 0LL;

      providerNum = v2->_providerNum;
      v2->_providerNum = 0LL;

      v2->_wlanType = 0LL;
      dispatch_queue_attr_t v13 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v14 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v13);
      v15 = (os_log_s *)dispatch_queue_create("com.apple.wifi.analytics.IOReporterQ", v14);
      -[WAIOReporterMessagePopulator setQueue:](v2, "setQueue:", v15);
    }

    else
    {
      id v17 = WALogCategoryDefaultHandle();
      v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446466;
        v20 = "-[WAIOReporterMessagePopulator init]";
        __int16 v21 = 1024;
        int v22 = 327;
        _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_ERROR,  "%{public}s::%d:Error RecommendationPreferences init",  buf,  0x12u);
      }

      v14 = (dispatch_queue_attr_s *)v2;
      v2 = 0LL;
    }
  }

  else
  {
    v14 = 0LL;
  }

  return v2;
}

- (unsigned)_getIOServiceWithForceRefresh:(BOOL)a3 apple80211:(id)a4
{
  id v6 = a4;
  if (a3 || (unsigned int srv = self->_srv) == 0)
  {
    +[WAUtil incrementValueForKey:inMutableDict:onQueue:]( &OBJC_CLASS___WAUtil,  "incrementValueForKey:inMutableDict:onQueue:",  @"Fetch IOService Calls",  self->_cachedUsage,  self->_queue);
    id v8 = WALogCategoryDefaultHandle();
    uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 136446466;
      v12 = "-[WAIOReporterMessagePopulator _getIOServiceWithForceRefresh:apple80211:]";
      __int16 v13 = 1024;
      int v14 = 359;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "%{public}s::%d:Getting _srv",  (uint8_t *)&v11,  0x12u);
    }

    unsigned int srv = [v6 getIOReportingService];
    self->_unsigned int srv = srv;
  }

  return srv;
}

- (unsigned)_getCCPipeDriverForWLAN
{
  io_iterator_t existing = 0;
  CFMutableDictionaryRef v2 = IOServiceNameMatching("CCPipe");
  if (!v2)
  {
    id v12 = WALogCategoryDefaultHandle();
    __int16 v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      __int16 v21 = "-[WAIOReporterMessagePopulator _getCCPipeDriverForWLAN]";
      __int16 v22 = 1024;
      int v23 = 375;
      int v14 = "%{public}s::%d:IOServiceMatching failed";
LABEL_29:
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, v14, buf, 0x12u);
    }

- (void)freeIORCaches
{
  id v3 = WALogCategoryDefaultHandle();
  io_registry_entry_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (char *)os_signpost_id_generate(v4);

  id v6 = WALogCategoryDefaultHandle();
  CFTypeID v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  id v8 = v7;
  if ((unint64_t)(v5 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v8,  OS_SIGNPOST_INTERVAL_BEGIN,  (os_signpost_id_t)v5,  "IOR freeIORCaches",  (const char *)&unk_1000B76E7,  buf,  2u);
  }

  uint64_t v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[WAIOReporterMessagePopulator queue](self, "queue"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_100015114;
  v10[3] = &unk_1000CCD08;
  objc_copyWeak(v11, &location);
  v11[1] = v5;
  dispatch_sync(v9, v10);

  objc_destroyWeak(v11);
  objc_destroyWeak(&location);
}

- (void)_freeIORCaches
{
  id v3 = WALogCategoryDefaultHandle();
  io_registry_entry_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136446722;
    id v10 = "-[WAIOReporterMessagePopulator _freeIORCaches]";
    __int16 v11 = 1024;
    int v12 = 436;
    __int16 v13 = 2080;
    int v14 = "-[WAIOReporterMessagePopulator _freeIORCaches]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:%s", (uint8_t *)&v9, 0x1Cu);
  }

  id v5 = WALogCategoryDefaultHandle();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_signpost_enabled(v6))
  {
    LOWORD(v9) = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v6,  OS_SIGNPOST_INTERVAL_BEGIN,  0xEEEEB0B5B2B2EEEELL,  "IOR _freeIORCaches",  (const char *)&unk_1000B76E7,  (uint8_t *)&v9,  2u);
  }

  -[WAIOReporterMessagePopulator setCachedChannelsCountPerIORPopulatable:]( self,  "setCachedChannelsCountPerIORPopulatable:",  0LL);
  -[WAIOReporterMessagePopulator setCachedIOPopAvailableChannels:](self, "setCachedIOPopAvailableChannels:", 0LL);
  -[WAIOReporterMessagePopulator setCachedIOReportSubbedChannels:](self, "setCachedIOReportSubbedChannels:", 0LL);
  -[WAIOReporterMessagePopulator setCachedIOReportSample:](self, "setCachedIOReportSample:", 0LL);
  id v7 = WALogCategoryDefaultHandle();
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_signpost_enabled(v8))
  {
    LOWORD(v9) = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v8,  OS_SIGNPOST_INTERVAL_BEGIN,  0xEEEEB0B5B2B2EEEELL,  "IOR _freeIORCaches",  (const char *)&unk_1000B76E7,  (uint8_t *)&v9,  2u);
  }
}

- (void)_freeSubscriptionSample:(id)a3
{
  id v4 = a3;
  id v5 = WALogCategoryDefaultHandle();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v32 = 136446722;
    v33 = "-[WAIOReporterMessagePopulator _freeSubscriptionSample:]";
    __int16 v34 = 1024;
    int v35 = 449;
    __int16 v36 = 2112;
    id v37 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "%{public}s::%d:Clearing cachedIOReportSubbedChannels and cachedIOReportSample for %@",  (uint8_t *)&v32,  0x1Cu);
  }

  id v7 = WALogCategoryDefaultHandle();
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_signpost_enabled(v8))
  {
    LOWORD(v32) = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v8,  OS_SIGNPOST_INTERVAL_BEGIN,  0xEEEEB0B5B2B2EEEELL,  "IOR _freeSubscriptionSample",  (const char *)&unk_1000B76E7,  (uint8_t *)&v32,  2u);
  }

  int v9 = (void *)objc_claimAutoreleasedReturnValue(-[WAIOReporterMessagePopulator cachedIOReportSubbedChannels](self, "cachedIOReportSubbedChannels"));
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:v4]);
  __int16 v11 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:@"iorsub"]);

  if (v11)
  {
    id v12 = WALogCategoryDefaultHandle();
    __int16 v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int v32 = 136446722;
      v33 = "-[WAIOReporterMessagePopulator _freeSubscriptionSample:]";
      __int16 v34 = 1024;
      int v35 = 453;
      __int16 v36 = 2112;
      id v37 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "%{public}s::%d:Freeing cachedIOReportSubbedChannels iorsub for %@",  (uint8_t *)&v32,  0x1Cu);
    }

    int v14 = (void *)objc_claimAutoreleasedReturnValue(-[WAIOReporterMessagePopulator cachedIOReportSubbedChannels](self, "cachedIOReportSubbedChannels"));
    id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKeyedSubscript:v4]);
    [v15 setObject:0 forKeyedSubscript:@"iorsub"];
  }

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[WAIOReporterMessagePopulator cachedIOReportSample](self, "cachedIOReportSample"));
  id v17 = (void *)objc_claimAutoreleasedReturnValue([v16 objectForKeyedSubscript:v4]);
  objc_super v18 = (void *)objc_claimAutoreleasedReturnValue([v17 objectForKeyedSubscript:@"sampleValues"]);

  if (v18)
  {
    id v19 = WALogCategoryDefaultHandle();
    v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      int v32 = 136446722;
      v33 = "-[WAIOReporterMessagePopulator _freeSubscriptionSample:]";
      __int16 v34 = 1024;
      int v35 = 458;
      __int16 v36 = 2112;
      id v37 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "%{public}s::%d:Freeing cachedIOReportSample sampleValues for %@",  (uint8_t *)&v32,  0x1Cu);
    }

    __int16 v21 = (void *)objc_claimAutoreleasedReturnValue(-[WAIOReporterMessagePopulator cachedIOReportSample](self, "cachedIOReportSample"));
    __int16 v22 = (void *)objc_claimAutoreleasedReturnValue([v21 objectForKeyedSubscript:v4]);
    [v22 setObject:0 forKeyedSubscript:@"sampleValues"];
  }

  int v23 = (void *)objc_claimAutoreleasedReturnValue(-[WAIOReporterMessagePopulator cachedIOReportSample](self, "cachedIOReportSample"));
  __int16 v24 = (void *)objc_claimAutoreleasedReturnValue([v23 objectForKeyedSubscript:v4]);
  v25 = (void *)objc_claimAutoreleasedReturnValue([v24 objectForKeyedSubscript:@"structuredDict"]);

  if (v25)
  {
    id v26 = WALogCategoryDefaultHandle();
    v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      int v32 = 136446722;
      v33 = "-[WAIOReporterMessagePopulator _freeSubscriptionSample:]";
      __int16 v34 = 1024;
      int v35 = 463;
      __int16 v36 = 2112;
      id v37 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_DEFAULT,  "%{public}s::%d:Freeing cachedIOReportSample structuredDict for %@",  (uint8_t *)&v32,  0x1Cu);
    }

    v28 = (void *)objc_claimAutoreleasedReturnValue(-[WAIOReporterMessagePopulator cachedIOReportSample](self, "cachedIOReportSample"));
    v29 = (void *)objc_claimAutoreleasedReturnValue([v28 objectForKeyedSubscript:v4]);
    [v29 setObject:0 forKeyedSubscript:@"structuredDict"];
  }

  id v30 = WALogCategoryDefaultHandle();
  v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
  if (os_signpost_enabled(v31))
  {
    LOWORD(v32) = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v31,  OS_SIGNPOST_INTERVAL_END,  0xEEEEB0B5B2B2EEEELL,  "IOR _freeSubscriptionSample",  (const char *)&unk_1000B76E7,  (uint8_t *)&v32,  2u);
  }
}

- (BOOL)runIOLegendTest
{
  uint64_t v7 = 0LL;
  id v8 = &v7;
  uint64_t v9 = 0x2020000000LL;
  char v10 = 0;
  id v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[WAIOReporterMessagePopulator queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000158A4;
  block[3] = &unk_1000CCD30;
  objc_copyWeak(&v6, &location);
  block[4] = &v7;
  dispatch_sync(v3, block);

  LOBYTE(v3) = *((_BYTE *)v8 + 24);
  objc_destroyWeak(&v6);
  _Block_object_dispose(&v7, 8);
  objc_destroyWeak(&location);
  return (char)v3;
}

- (BOOL)_runIOLegendTest
{
  __int128 v38 = 0u;
  __int128 v39 = 0u;
  __int128 v36 = 0u;
  __int128 v37 = 0u;
  id v3 = WALogCategoryDefaultHandle();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v41 = "-[WAIOReporterMessagePopulator _runIOLegendTest]";
    __int16 v42 = 1024;
    int v43 = 488;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "%{public}s::%d:runIOLegendTest starting",  buf,  0x12u);
  }

  if (!self->_hasAttemptedUnpersisting) {
    -[WAIOReporterMessagePopulator _unpersistIORObjects](self, "_unpersistIORObjects");
  }
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[WAApple80211Manager sharedObject](&OBJC_CLASS___WAApple80211Manager, "sharedObject"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 getInfraApple80211]);

  if (v6)
  {
    uint64_t v7 = (void *)v36;
    *(void *)&__int128 v36 = @"Interface en";

    id v8 = (void *)*((void *)&v36 + 1);
    *((void *)&v36 + 1) = @"Peer";

    uint64_t v9 = (void *)v37;
    *(void *)&__int128 v37 = @"00:00:00:00:00:00";

    char v10 = (void *)*((void *)&v38 + 1);
    *((void *)&v38 + 1) = @"DataPath";

    context = objc_autoreleasePoolPush();
    char v35 = 0;
    +[WAUtil incrementValueForKey:inMutableDict:onQueue:]( &OBJC_CLASS___WAUtil,  "incrementValueForKey:inMutableDict:onQueue:",  @"Legend Query Calls",  self->_cachedUsage,  self->_queue);
    __int16 v11 = (void *)objc_claimAutoreleasedReturnValue([v6 getIOReportLegendItemsMatching:&v36 retErr:&v35]);
    if (v35 == 1)
    {
      +[WAUtil incrementValueForKey:inMutableDict:onQueue:]( &OBJC_CLASS___WAUtil,  "incrementValueForKey:inMutableDict:onQueue:",  @"Legend Query Failed",  self->_cachedUsage,  self->_queue);
      -[WAIOReporterMessagePopulator _incrementPredicateCachedUsageWithPrefix:q:]( self,  "_incrementPredicateCachedUsageWithPrefix:q:",  @"Failed Pred: ",  &v36);
      id v12 = WALogCategoryDefaultHandle();
      __int16 v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446466;
        v41 = "-[WAIOReporterMessagePopulator _runIOLegendTest]";
        __int16 v42 = 1024;
        int v43 = 512;
        _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_ERROR,  "%{public}s::%d:legendFetchError with getIOReportLegendItemsMatching",  buf,  0x12u);
      }
    }

    if (![v11 count]) {
      -[WAIOReporterMessagePopulator _incrementPredicateCachedUsageWithPrefix:q:]( self,  "_incrementPredicateCachedUsageWithPrefix:q:",  @"Zero Results Pred: ",  &v36);
    }
    id v33 = [v11 count];
    if (v33)
    {
      int v14 = 100;
      do
      {
        id v15 = WALogCategoryDefaultHandle();
        v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
        if (os_signpost_enabled(v16))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v16,  OS_SIGNPOST_INTERVAL_BEGIN,  0xEEEEB0B5B2B2EEEELL,  "IOR getIOReportLegendItemsMatching",  (const char *)&unk_1000B76E7,  buf,  2u);
        }

        +[WAUtil incrementValueForKey:inMutableDict:onQueue:]( &OBJC_CLASS___WAUtil,  "incrementValueForKey:inMutableDict:onQueue:",  @"Legend Query Calls",  self->_cachedUsage,  self->_queue);
        id v17 = (void *)objc_claimAutoreleasedReturnValue([v6 getIOReportLegendItemsMatching:&v36 retErr:&v35]);

        if (v35 == 1)
        {
          +[WAUtil incrementValueForKey:inMutableDict:onQueue:]( &OBJC_CLASS___WAUtil,  "incrementValueForKey:inMutableDict:onQueue:",  @"Legend Query Failed",  self->_cachedUsage,  self->_queue);
          -[WAIOReporterMessagePopulator _incrementPredicateCachedUsageWithPrefix:q:]( self,  "_incrementPredicateCachedUsageWithPrefix:q:",  @"Failed Pred: ",  &v36);
          id v18 = WALogCategoryDefaultHandle();
          id v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136446466;
            v41 = "-[WAIOReporterMessagePopulator _runIOLegendTest]";
            __int16 v42 = 1024;
            int v43 = 529;
            _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_ERROR,  "%{public}s::%d:legendFetchError with getIOReportLegendItemsMatching",  buf,  0x12u);
          }
        }

        if (!objc_msgSend(v17, "count", v33))
        {
          -[WAIOReporterMessagePopulator _incrementPredicateCachedUsageWithPrefix:q:]( self,  "_incrementPredicateCachedUsageWithPrefix:q:",  @"Zero Results Pred: ",  &v36);
          id v20 = WALogCategoryDefaultHandle();
          __int16 v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136446466;
            v41 = "-[WAIOReporterMessagePopulator _runIOLegendTest]";
            __int16 v42 = 1024;
            int v43 = 534;
            _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_ERROR,  "%{public}s::%d:Failed to find requests from query",  buf,  0x12u);
          }
        }

        id v22 = WALogCategoryDefaultHandle();
        int v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
        if (os_signpost_enabled(v23))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v23,  OS_SIGNPOST_INTERVAL_END,  0xEEEEB0B5B2B2EEEELL,  "IOR getIOReportLegendItemsMatching",  (const char *)&unk_1000B76E7,  buf,  2u);
        }

        __int16 v11 = v17;
        --v14;
      }

      while (v14);
    }

    else
    {
      id v31 = WALogCategoryDefaultHandle();
      int v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446466;
        v41 = "-[WAIOReporterMessagePopulator _runIOLegendTest]";
        __int16 v42 = 1024;
        int v43 = 517;
        _os_log_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_ERROR,  "%{public}s::%d:getIOReportLegendItemsMatching returned 0 size",  buf,  0x12u);
      }

      id v17 = v11;
    }

    objc_autoreleasePoolPop(context);
    if (v33)
    {
      id v24 = WALogCategoryDefaultHandle();
      v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136446466;
        v41 = "-[WAIOReporterMessagePopulator _runIOLegendTest]";
        __int16 v42 = 1024;
        int v43 = 543;
        _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "%{public}s::%d:runIOLegendTest complete: success",  buf,  0x12u);
      }

      BOOL v26 = 1;
      goto LABEL_37;
    }
  }

  else
  {
    id v27 = WALogCategoryDefaultHandle();
    v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v41 = "-[WAIOReporterMessagePopulator _runIOLegendTest]";
      __int16 v42 = 1024;
      int v43 = 495;
      _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_ERROR,  "%{public}s::%d:invalid apple80211API",  buf,  0x12u);
    }
  }

  id v29 = WALogCategoryDefaultHandle();
  v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
  if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136446466;
    v41 = "-[WAIOReporterMessagePopulator _runIOLegendTest]";
    __int16 v42 = 1024;
    int v43 = 547;
    _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_ERROR,  "%{public}s::%d:runIOLegendTest failed",  buf,  0x12u);
  }

  BOOL v26 = 0;
LABEL_37:

  sub_100015F74((id *)&v36);
  return v26;
}

- (unsigned)doesChannelExistInStructuredDict:(id)a3 providerName:(id)a4 legCh:(id)a5 groupName:(id)a6 subgroupName:(id)a7 chinfo:(id)a8
{
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[WAIOReporterMessagePopulator cachedIOReportSample](self, "cachedIOReportSample"));
  id v17 = (void *)objc_claimAutoreleasedReturnValue([v16 objectForKeyedSubscript:&off_1000DFFD0]);
  id v18 = (void *)objc_claimAutoreleasedReturnValue([v17 objectForKeyedSubscript:@"structuredDict"]);

  id v19 = (void *)objc_claimAutoreleasedReturnValue([v18 objectForKeyedSubscript:v12]);
  if (!v19) {
    goto LABEL_16;
  }
  id v20 = (void *)objc_claimAutoreleasedReturnValue([v18 objectForKeyedSubscript:v12]);
  __int16 v21 = (void *)objc_claimAutoreleasedReturnValue([v20 objectForKeyedSubscript:v14]);

  if (!v21)
  {
    id v19 = 0LL;
    goto LABEL_17;
  }

  id v22 = (void *)objc_claimAutoreleasedReturnValue([v18 objectForKeyedSubscript:v12]);
  int v23 = (void *)objc_claimAutoreleasedReturnValue([v22 objectForKeyedSubscript:v14]);
  id v24 = (void *)objc_claimAutoreleasedReturnValue([v23 objectForKeyedSubscript:v15]);

  if (!v24) {
    goto LABEL_15;
  }
  if ((unint64_t)[v13 count] <= 1)
  {
    id v34 = WALogCategoryDefaultHandle();
    char v35 = (os_log_s *)objc_claimAutoreleasedReturnValue(v34);
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v41 = "-[WAIOReporterMessagePopulator doesChannelExistInStructuredDict:providerName:legCh:groupName:subgroupName:chinfo:]";
      __int16 v42 = 1024;
      int v43 = 571;
      __int128 v36 = "%{public}s::%d:legCh is not >= 2";
LABEL_13:
      _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_ERROR, v36, buf, 0x12u);
    }

- (unsigned)doesDriverHaveChannelsInStructuredDict:(int64_t)a3 containsStale:(char *)a4
{
  uint64_t entryID = 0LL;
  *a4 = 0;
  uint64_t v6 = objc_claimAutoreleasedReturnValue(-[WAIOReporterMessagePopulator cachedIOReportSample](self, "cachedIOReportSample"));
  if (!v6) {
    return v6;
  }
  uint64_t v7 = (void *)v6;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[WAIOReporterMessagePopulator cachedIOReportSample](self, "cachedIOReportSample"));
  uint64_t v9 = objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:&off_1000DFFD0]);
  if (!v9)
  {

    goto LABEL_9;
  }

  char v10 = (void *)v9;
  __int16 v11 = (void *)objc_claimAutoreleasedReturnValue(-[WAIOReporterMessagePopulator cachedIOReportSample](self, "cachedIOReportSample"));
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:&off_1000DFFD0]);
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:@"structuredDict"]);

  if (!v13) {
    goto LABEL_53;
  }
  id v14 = (void *)objc_claimAutoreleasedReturnValue(-[WAIOReporterMessagePopulator cachedIOReportSample](self, "cachedIOReportSample"));
  id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKeyedSubscript:&off_1000DFFD0]);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v15 objectForKeyedSubscript:@"structuredDict"]);

  if (a3 != 1)
  {
    if (a3)
    {
      id v17 = 0LL;
      goto LABEL_35;
    }

    v16 = (void *)objc_claimAutoreleasedReturnValue(+[WAApple80211Manager sharedObject](&OBJC_CLASS___WAApple80211Manager, "sharedObject"));
    id v17 = (void *)objc_claimAutoreleasedReturnValue([v16 getInfraApple80211]);

    if (v17)
    {
      io_registry_entry_t v18 = [v17 getIOReportingService];
      goto LABEL_11;
    }

    id v51 = WALogCategoryDefaultHandle();
    v52 = (os_log_s *)objc_claimAutoreleasedReturnValue(v51);
    if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)io_name_t name = 136446466;
      *(void *)&name[4] = "-[WAIOReporterMessagePopulator doesDriverHaveChannelsInStructuredDict:containsStale:]";
      *(_WORD *)&name[12] = 1024;
      *(_DWORD *)&name[14] = 614;
      _os_log_impl( (void *)&_mh_execute_header,  v52,  OS_LOG_TYPE_ERROR,  "%{public}s::%d:invalid apple80211API",  (uint8_t *)name,  0x12u);
    }

LABEL_9:
    goto LABEL_53;
  }

  io_registry_entry_t v18 = -[WAIOReporterMessagePopulator _getCCPipeDriverForWLAN](self, "_getCCPipeDriverForWLAN");
  id v17 = 0LL;
LABEL_11:
  if (!v18)
  {
LABEL_35:
    id v39 = WALogCategoryDefaultHandle();
    v40 = (void *)objc_claimAutoreleasedReturnValue(v39);
    if (!os_log_type_enabled((os_log_t)v40, OS_LOG_TYPE_ERROR))
    {
LABEL_39:

      goto LABEL_53;
    }

    *(_DWORD *)io_name_t name = 136446722;
    *(void *)&name[4] = "-[WAIOReporterMessagePopulator doesDriverHaveChannelsInStructuredDict:containsStale:]";
    *(_WORD *)&name[12] = 1024;
    *(_DWORD *)&name[14] = 624;
    *(_WORD *)&name[18] = 2048;
    *(void *)&name[20] = a3;
    v41 = "%{public}s::%d:Can't find io_service_t for driver %ld";
    goto LABEL_37;
  }

  if (IORegistryEntryGetRegistryEntryID(v18, &entryID))
  {
    id v49 = WALogCategoryDefaultHandle();
    v40 = (void *)objc_claimAutoreleasedReturnValue(v49);
    if (!os_log_type_enabled((os_log_t)v40, OS_LOG_TYPE_ERROR)) {
      goto LABEL_39;
    }
    *(_DWORD *)io_name_t name = 136446722;
    *(void *)&name[4] = "-[WAIOReporterMessagePopulator doesDriverHaveChannelsInStructuredDict:containsStale:]";
    *(_WORD *)&name[12] = 1024;
    *(_DWORD *)&name[14] = 626;
    *(_WORD *)&name[18] = 2048;
    *(void *)&name[20] = a3;
    v41 = "%{public}s::%d:Can't call IORegistryEntryGetRegistryEntryID on driver %ld";
LABEL_37:
    __int16 v42 = (uint8_t *)name;
LABEL_38:
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)v40, OS_LOG_TYPE_ERROR, v41, v42, 0x1Cu);
    goto LABEL_39;
  }

  if (IORegistryEntryGetName(v18, name))
  {
    id v50 = WALogCategoryDefaultHandle();
    v40 = (void *)objc_claimAutoreleasedReturnValue(v50);
    if (!os_log_type_enabled((os_log_t)v40, OS_LOG_TYPE_ERROR)) {
      goto LABEL_39;
    }
    *(_DWORD *)buf = 136446722;
    v64 = "-[WAIOReporterMessagePopulator doesDriverHaveChannelsInStructuredDict:containsStale:]";
    __int16 v65 = 1024;
    int v66 = 628;
    __int16 v67 = 2048;
    int64_t v68 = a3;
    v41 = "%{public}s::%d:Can't call IORegistryEntryGetName on driver %ld";
    __int16 v42 = buf;
    goto LABEL_38;
  }

  v54 = v17;
  v57 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  name,  4LL));
  __int128 v58 = 0u;
  __int128 v59 = 0u;
  __int128 v60 = 0u;
  __int128 v61 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue([v7 allKeys]);
  id v19 = [obj countByEnumeratingWithState:&v58 objects:v71 count:16];
  if (!v19) {
    goto LABEL_52;
  }
  id v20 = v19;
  uint64_t v21 = *(void *)v59;
  while (2)
  {
    for (i = 0LL; i != v20; i = (char *)i + 1)
    {
      if (*(void *)v59 != v21) {
        objc_enumerationMutation(obj);
      }
      int v23 = *(void **)(*((void *)&v58 + 1) + 8LL * (void)i);
      id v24 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:v23]);

      if (!v24)
      {
        id v43 = WALogCategoryDefaultHandle();
        id v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v43);
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136446722;
          v64 = "-[WAIOReporterMessagePopulator doesDriverHaveChannelsInStructuredDict:containsStale:]";
          __int16 v65 = 1024;
          int v66 = 638;
          __int16 v67 = 2112;
          int64_t v68 = (int64_t)v23;
          v44 = "%{public}s::%d:Issue strDict[foundDriver] %@ doesnt have value";
          goto LABEL_44;
        }

- (id)createChannelWithProviderID:(id)a3 providerName:(id)a4 legCh:(id)a5 groupName:(id)a6 subgroupName:(id)a7 chinfo:(id)a8
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  if ((unint64_t)[v15 count] <= 1)
  {
    id v24 = WALogCategoryDefaultHandle();
    id v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      int v29 = 136446466;
      id v30 = "-[WAIOReporterMessagePopulator createChannelWithProviderID:providerName:legCh:groupName:subgroupName:chinfo:]";
      __int16 v31 = 1024;
      int v32 = 673;
      BOOL v26 = "%{public}s::%d:legCh is not >= 2";
LABEL_15:
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, v26, (uint8_t *)&v29, 0x12u);
    }
  }

  else
  {
    id v19 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    if (v19)
    {
      id v20 = v19;
      -[NSMutableDictionary setObject:forKeyedSubscript:](v19, "setObject:forKeyedSubscript:", v13, @"DriverID");
      -[NSMutableDictionary setObject:forKeyedSubscript:](v20, "setObject:forKeyedSubscript:", v14, @"DriverName");
      -[NSMutableDictionary setObject:forKeyedSubscript:]( v20,  "setObject:forKeyedSubscript:",  v15,  @"LegendChannel");
      if (v16) {
        -[NSMutableDictionary setObject:forKeyedSubscript:]( v20,  "setObject:forKeyedSubscript:",  v16,  @"IOReportGroupName");
      }
      if (v17) {
        -[NSMutableDictionary setObject:forKeyedSubscript:]( v20,  "setObject:forKeyedSubscript:",  v17,  @"IOReportSubGroupName");
      }
      if (v18) {
        -[NSMutableDictionary setObject:forKeyedSubscript:]( v20,  "setObject:forKeyedSubscript:",  v18,  @"IOReportChannelInfo");
      }
      uint64_t v21 = v20;
      id v22 = v21;
      goto LABEL_10;
    }

    id v27 = WALogCategoryDefaultHandle();
    id v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      int v29 = 136446466;
      id v30 = "-[WAIOReporterMessagePopulator createChannelWithProviderID:providerName:legCh:groupName:subgroupName:chinfo:]";
      __int16 v31 = 1024;
      int v32 = 676;
      BOOL v26 = "%{public}s::%d:failed to alloc newch";
      goto LABEL_15;
    }
  }

  id v28 = WALogCategoryDefaultHandle();
  uint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
  {
    int v29 = 136446466;
    id v30 = "-[WAIOReporterMessagePopulator createChannelWithProviderID:providerName:legCh:groupName:subgroupName:chinfo:]";
    __int16 v31 = 1024;
    int v32 = 700;
    _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_ERROR,  "%{public}s::%d:Failed to create IOReportChannelRef",  (uint8_t *)&v29,  0x12u);
  }

  id v22 = 0LL;
LABEL_10:

  return v22;
}

- (void)_incrementPredicateCachedUsageWithPrefix:(id)a3 q:(id *)a4
{
  var7 = &stru_1000CF610;
  var0 = (const __CFString *)a4->var0;
  var1 = (const __CFString *)a4->var1;
  if (!a4->var0) {
    var0 = &stru_1000CF610;
  }
  if (!var1) {
    var1 = &stru_1000CF610;
  }
  var2 = (const __CFString *)a4->var2;
  var3 = (const __CFString *)a4->var3;
  if (!var2) {
    var2 = &stru_1000CF610;
  }
  if (!var3) {
    var3 = &stru_1000CF610;
  }
  var4 = (const __CFString *)a4->var4;
  var5 = (const __CFString *)a4->var5;
  if (!var4) {
    var4 = &stru_1000CF610;
  }
  if (!var5) {
    var5 = &stru_1000CF610;
  }
  var6 = (const __CFString *)a4->var6;
  if (!var6) {
    var6 = &stru_1000CF610;
  }
  if (a4->var7) {
    var7 = (const __CFString *)a4->var7;
  }
  id v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ G: %@,%@,%@,%@ g: %@,%@,%@,%@",  a3,  var0,  var1,  var2,  var3,  var4,  var5,  var6,  var7));
  +[WAUtil incrementValueForKey:inMutableDict:onQueue:]( &OBJC_CLASS___WAUtil,  "incrementValueForKey:inMutableDict:onQueue:",  v13,  self->_cachedUsage,  self->_queue);
}

- (id)_buildPredicateList:(int64_t)a3 wlan:(int64_t)a4
{
  switch(a3)
  {
    case 0LL:
      uint64_t v6 = (NSMutableArray *)[(id)qword_1000ECEF8 mutableCopy];
      if (a4 == 1)
      {
        __int128 v101 = 0u;
        __int128 v102 = 0u;
        __int128 v99 = 0u;
        __int128 v100 = 0u;
        uint64_t v7 = (NSMutableArray *)(id)qword_1000ECF08;
        id v40 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v99,  v118,  16LL);
        if (v40)
        {
          id v41 = v40;
          uint64_t v42 = *(void *)v100;
          do
          {
            for (i = 0LL; i != v41; i = (char *)i + 1)
            {
              if (*(void *)v100 != v42) {
                objc_enumerationMutation(v7);
              }
              -[NSMutableArray addObject:](v6, "addObject:", *(void *)(*((void *)&v99 + 1) + 8LL * (void)i));
            }

            id v41 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v99,  v118,  16LL);
          }

          while (v41);
        }
      }

      else if (a4 == 2)
      {
        __int128 v105 = 0u;
        __int128 v106 = 0u;
        __int128 v103 = 0u;
        __int128 v104 = 0u;
        uint64_t v7 = (NSMutableArray *)(id)qword_1000ECF00;
        id v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v103,  v119,  16LL);
        if (v8)
        {
          id v9 = v8;
          uint64_t v10 = *(void *)v104;
          do
          {
            for (j = 0LL; j != v9; j = (char *)j + 1)
            {
              if (*(void *)v104 != v10) {
                objc_enumerationMutation(v7);
              }
              -[NSMutableArray addObject:](v6, "addObject:", *(void *)(*((void *)&v103 + 1) + 8LL * (void)j));
            }

            id v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v103,  v119,  16LL);
          }

          while (v9);
        }
      }

      else
      {
        id v44 = WALogCategoryDefaultHandle();
        id v45 = (os_log_s *)objc_claimAutoreleasedReturnValue(v44);
        if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136446466;
          v115 = "-[WAIOReporterMessagePopulator _buildPredicateList:wlan:]";
          __int16 v116 = 1024;
          int v117 = 746;
          _os_log_impl( (void *)&_mh_execute_header,  v45,  OS_LOG_TYPE_ERROR,  "%{public}s::%d:Unknown and unhandled WAWiFiDriverType when handling kWAIORIOReporterSearchAllStaticPredicates",  buf,  0x12u);
        }

        id v46 = WALogCategoryDefaultHandle();
        uint64_t v7 = (NSMutableArray *)objc_claimAutoreleasedReturnValue(v46);
        if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)buf = 0;
          id v47 = "Unknown and unhandled WAWiFiDriverType when handling kWAIORIOReporterSearchAllStaticPredicates";
          goto LABEL_108;
        }
      }

      goto LABEL_105;
    case 1LL:
      uint64_t v6 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
      __int128 v95 = 0u;
      __int128 v96 = 0u;
      __int128 v97 = 0u;
      __int128 v98 = 0u;
      id v13 = (id)qword_1000ECEF8;
      id v14 = [v13 countByEnumeratingWithState:&v95 objects:v113 count:16];
      if (v14)
      {
        id v15 = v14;
        uint64_t v16 = *(void *)v96;
        do
        {
          for (k = 0LL; k != v15; k = (char *)k + 1)
          {
            if (*(void *)v96 != v16) {
              objc_enumerationMutation(v13);
            }
            id v18 = *(void **)(*((void *)&v95 + 1) + 8LL * (void)k);
            id v19 = (void *)objc_claimAutoreleasedReturnValue([v18 objectForKeyedSubscript:@"mutates"]);

            if (v19) {
              -[NSMutableArray addObject:](v6, "addObject:", v18);
            }
          }

          id v15 = [v13 countByEnumeratingWithState:&v95 objects:v113 count:16];
        }

        while (v15);
      }

      if (a4 == 1)
      {
        __int128 v89 = 0u;
        __int128 v90 = 0u;
        __int128 v87 = 0u;
        __int128 v88 = 0u;
        id v20 = (id)qword_1000ECF08;
        id v48 = [v20 countByEnumeratingWithState:&v87 objects:v111 count:16];
        if (v48)
        {
          id v49 = v48;
          uint64_t v50 = *(void *)v88;
          do
          {
            for (m = 0LL; m != v49; m = (char *)m + 1)
            {
              if (*(void *)v88 != v50) {
                objc_enumerationMutation(v20);
              }
              v52 = *(void **)(*((void *)&v87 + 1) + 8LL * (void)m);
              v53 = (void *)objc_claimAutoreleasedReturnValue([v52 objectForKeyedSubscript:@"mutates"]);

              if (v53) {
                -[NSMutableArray addObject:](v6, "addObject:", v52);
              }
            }

            id v49 = [v20 countByEnumeratingWithState:&v87 objects:v111 count:16];
          }

          while (v49);
        }
      }

      else if (a4 == 2)
      {
        __int128 v93 = 0u;
        __int128 v94 = 0u;
        __int128 v91 = 0u;
        __int128 v92 = 0u;
        id v20 = (id)qword_1000ECF00;
        id v21 = [v20 countByEnumeratingWithState:&v91 objects:v112 count:16];
        if (v21)
        {
          id v22 = v21;
          uint64_t v23 = *(void *)v92;
          do
          {
            for (n = 0LL; n != v22; n = (char *)n + 1)
            {
              if (*(void *)v92 != v23) {
                objc_enumerationMutation(v20);
              }
              id v25 = *(void **)(*((void *)&v91 + 1) + 8LL * (void)n);
              BOOL v26 = (void *)objc_claimAutoreleasedReturnValue([v25 objectForKeyedSubscript:@"mutates"]);

              if (v26) {
                -[NSMutableArray addObject:](v6, "addObject:", v25);
              }
            }

            id v22 = [v20 countByEnumeratingWithState:&v91 objects:v112 count:16];
          }

          while (v22);
        }
      }

      else
      {
        id v54 = WALogCategoryDefaultHandle();
        v55 = (os_log_s *)objc_claimAutoreleasedReturnValue(v54);
        if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136446466;
          v115 = "-[WAIOReporterMessagePopulator _buildPredicateList:wlan:]";
          __int16 v116 = 1024;
          int v117 = 790;
          _os_log_impl( (void *)&_mh_execute_header,  v55,  OS_LOG_TYPE_ERROR,  "%{public}s::%d:Unknown and unhandled WAWiFiDriverType when handling kWAIORIOReporterSearchUnfoundAndMutablePredicates",  buf,  0x12u);
        }

        id v56 = WALogCategoryDefaultHandle();
        id v20 = (id)objc_claimAutoreleasedReturnValue(v56);
        if (os_log_type_enabled((os_log_t)v20, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_fault_impl( (void *)&_mh_execute_header,  (os_log_t)v20,  OS_LOG_TYPE_FAULT,  "Unknown and unhandled WAWiFiDriverType when handling kWAIORIOReporterSearchUnfoundAndMutablePredicates",  buf,  2u);
        }
      }

      __int128 v85 = 0u;
      __int128 v86 = 0u;
      __int128 v83 = 0u;
      __int128 v84 = 0u;
      uint64_t v7 = self->_cachedPredicatesNotYetFound;
      id v57 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v83,  v110,  16LL);
      if (v57)
      {
        id v58 = v57;
        uint64_t v59 = *(void *)v84;
        do
        {
          for (ii = 0LL; ii != v58; ii = (char *)ii + 1)
          {
            if (*(void *)v84 != v59) {
              objc_enumerationMutation(v7);
            }
            uint64_t v61 = *(void *)(*((void *)&v83 + 1) + 8LL * (void)ii);
          }

          id v58 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v83,  v110,  16LL);
        }

        while (v58);
      }

      goto LABEL_105;
    case 2LL:
      return -[NSMutableArray copy](self->_cachedPredicatesNotYetFound, "copy");
    case 3LL:
      uint64_t v6 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
      __int128 v79 = 0u;
      __int128 v80 = 0u;
      __int128 v81 = 0u;
      __int128 v82 = 0u;
      id v27 = (id)qword_1000ECEF8;
      id v28 = [v27 countByEnumeratingWithState:&v79 objects:v109 count:16];
      if (v28)
      {
        id v29 = v28;
        uint64_t v30 = *(void *)v80;
        do
        {
          for (jj = 0LL; jj != v29; jj = (char *)jj + 1)
          {
            if (*(void *)v80 != v30) {
              objc_enumerationMutation(v27);
            }
            int v32 = *(void **)(*((void *)&v79 + 1) + 8LL * (void)jj);
            id v33 = (void *)objc_claimAutoreleasedReturnValue([v32 objectForKeyedSubscript:@"mutates"]);

            if (v33) {
              -[NSMutableArray addObject:](v6, "addObject:", v32);
            }
          }

          id v29 = [v27 countByEnumeratingWithState:&v79 objects:v109 count:16];
        }

        while (v29);
      }

      if (a4 == 1)
      {
        __int128 v73 = 0u;
        __int128 v74 = 0u;
        __int128 v71 = 0u;
        __int128 v72 = 0u;
        uint64_t v7 = (NSMutableArray *)(id)qword_1000ECF08;
        id v62 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v71,  v107,  16LL);
        if (v62)
        {
          id v63 = v62;
          uint64_t v64 = *(void *)v72;
          do
          {
            for (kk = 0LL; kk != v63; kk = (char *)kk + 1)
            {
              if (*(void *)v72 != v64) {
                objc_enumerationMutation(v7);
              }
              int v66 = *(void **)(*((void *)&v71 + 1) + 8LL * (void)kk);
              __int16 v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v66, "objectForKeyedSubscript:", @"mutates", (void)v71));

              if (v67) {
                -[NSMutableArray addObject:](v6, "addObject:", v66);
              }
            }

            id v63 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v71,  v107,  16LL);
          }

          while (v63);
        }
      }

      else if (a4 == 2)
      {
        __int128 v77 = 0u;
        __int128 v78 = 0u;
        __int128 v75 = 0u;
        __int128 v76 = 0u;
        uint64_t v7 = (NSMutableArray *)(id)qword_1000ECF00;
        id v34 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v75,  v108,  16LL);
        if (v34)
        {
          id v35 = v34;
          uint64_t v36 = *(void *)v76;
          do
          {
            for (mm = 0LL; mm != v35; mm = (char *)mm + 1)
            {
              if (*(void *)v76 != v36) {
                objc_enumerationMutation(v7);
              }
              __int128 v38 = *(void **)(*((void *)&v75 + 1) + 8LL * (void)mm);
              id v39 = (void *)objc_claimAutoreleasedReturnValue([v38 objectForKeyedSubscript:@"mutates"]);

              if (v39) {
                -[NSMutableArray addObject:](v6, "addObject:", v38);
              }
            }

            id v35 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v75,  v108,  16LL);
          }

          while (v35);
        }
      }

      else
      {
        id v68 = WALogCategoryDefaultHandle();
        __int16 v69 = (os_log_s *)objc_claimAutoreleasedReturnValue(v68);
        if (os_log_type_enabled(v69, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136446466;
          v115 = "-[WAIOReporterMessagePopulator _buildPredicateList:wlan:]";
          __int16 v116 = 1024;
          int v117 = 844;
          _os_log_impl( (void *)&_mh_execute_header,  v69,  OS_LOG_TYPE_ERROR,  "%{public}s::%d:Unknown and unhandled WAWiFiDriverType when handling kWAIORIOReporterSearchMutablePredicates",  buf,  0x12u);
        }

        id v70 = WALogCategoryDefaultHandle();
        uint64_t v7 = (NSMutableArray *)objc_claimAutoreleasedReturnValue(v70);
        if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)buf = 0;
          id v47 = "Unknown and unhandled WAWiFiDriverType when handling kWAIORIOReporterSearchMutablePredicates";
LABEL_108:
          _os_log_fault_impl((void *)&_mh_execute_header, (os_log_t)v7, OS_LOG_TYPE_FAULT, v47, buf, 2u);
        }
      }

- (unint64_t)_addDriverChannelsMatchingPredicateList:(int64_t)a3
{
  id v3 = WALogCategoryDefaultHandle();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_signpost_enabled(v4))
  {
    *(_DWORD *)buf = 134217984;
    *(void *)&uint8_t buf[4] = a3;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v4,  OS_SIGNPOST_INTERVAL_BEGIN,  0xEEEEB0B5B2B2EEEELL,  "IOR addDriverChannelsMatchingPredicateList",  "Mode %ld",  buf,  0xCu);
  }

  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[WAApple80211Manager sharedObject](&OBJC_CLASS___WAApple80211Manager, "sharedObject"));
  v169 = (void *)objc_claimAutoreleasedReturnValue([v5 getInfraApple80211]);

  if (!v169)
  {
    id v141 = WALogCategoryDefaultHandle();
    id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v141);
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      goto LABEL_163;
    }
    *(_DWORD *)buf = 136446466;
    *(void *)&uint8_t buf[4] = "-[WAIOReporterMessagePopulator _addDriverChannelsMatchingPredicateList:]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 868;
    v137 = "%{public}s::%d:invalid apple80211API";
LABEL_161:
    v138 = v14;
    uint32_t v139 = 18;
LABEL_162:
    _os_log_impl((void *)&_mh_execute_header, v138, OS_LOG_TYPE_ERROR, v137, buf, v139);
    goto LABEL_163;
  }

  uint64_t v6 = self;
  if (self->_srv && self->_drvName && self->_providerNum && self->_drvPath && self->_wlanType) {
    goto LABEL_25;
  }
  unsigned int v7 = -[WAIOReporterMessagePopulator _getIOServiceWithForceRefresh:apple80211:]( self,  "_getIOServiceWithForceRefresh:apple80211:",  0LL,  v169);
  self->_unsigned int srv = v7;
  if (!v7)
  {
    id v142 = WALogCategoryDefaultHandle();
    id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v142);
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      goto LABEL_163;
    }
    *(_DWORD *)buf = 136446466;
    *(void *)&uint8_t buf[4] = "-[WAIOReporterMessagePopulator _addDriverChannelsMatchingPredicateList:]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 875;
    v137 = "%{public}s::%d:Failed to retrieve io_service_t of driver";
    goto LABEL_161;
  }

  if (!IORegistryEntryGetRegistryEntryID(v7, &entryID)) {
    goto LABEL_17;
  }
  id v8 = WALogCategoryDefaultHandle();
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    unsigned int srv = self->_srv;
    *(_DWORD *)buf = 136446978;
    *(void *)&uint8_t buf[4] = "-[WAIOReporterMessagePopulator _addDriverChannelsMatchingPredicateList:]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 878;
    *(_WORD *)&buf[18] = 2048;
    *(void *)&buf[20] = entryID;
    *(_WORD *)&buf[28] = 1024;
    *(_DWORD *)&buf[30] = srv;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_ERROR,  "%{public}s::%d:Failed to convert IORegistryEntryGetRegistryEntryID %llx _srv was %d",  buf,  0x22u);
  }

  unsigned int v11 = -[WAIOReporterMessagePopulator _getIOServiceWithForceRefresh:apple80211:]( self,  "_getIOServiceWithForceRefresh:apple80211:",  1LL,  v169);
  self->_unsigned int srv = v11;
  id v12 = WALogCategoryDefaultHandle();
  id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  id v14 = v13;
  if (!v11)
  {
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      goto LABEL_163;
    }
    *(_DWORD *)buf = 136446466;
    *(void *)&uint8_t buf[4] = "-[WAIOReporterMessagePopulator _addDriverChannelsMatchingPredicateList:]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 882;
    v137 = "%{public}s::%d:Failed to find io_service_t";
    goto LABEL_161;
  }

  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v15 = self->_srv;
    *(_DWORD *)buf = 136446722;
    *(void *)&uint8_t buf[4] = "-[WAIOReporterMessagePopulator _addDriverChannelsMatchingPredicateList:]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 884;
    *(_WORD *)&buf[18] = 1024;
    *(_DWORD *)&buf[20] = v15;
    _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "%{public}s::%d:Found new io_service_t _srv is now %d",  buf,  0x18u);
  }

  if (!IORegistryEntryGetRegistryEntryID(self->_srv, &entryID))
  {
LABEL_17:
    uint64_t v16 = (NSString *)objc_claimAutoreleasedReturnValue([v169 getIOReportingDriverName]);
    drvName = self->_drvName;
    self->_drvName = v16;

    if (self->_drvName)
    {
      id v18 = objc_alloc(&OBJC_CLASS___NSNumber);
      id v19 = -[NSNumber initWithLongLong:](v18, "initWithLongLong:", entryID);
      providerNum = self->_providerNum;
      self->_providerNum = v19;

      if (self->_providerNum)
      {
        id v21 = (NSString *)objc_claimAutoreleasedReturnValue([v169 getIOReportingClassPath]);
        drvPath = self->_drvPath;
        self->_drvPath = v21;

        if (self->_drvPath)
        {
          id v23 = [v169 getDriverType];
          uint64_t v6 = self;
          self->_int64_t wlanType = (int64_t)v23;
          if (v23)
          {
            *(void *)buf = _NSConcreteStackBlock;
            *(void *)&uint8_t buf[8] = 3221225472LL;
            *(void *)&buf[16] = nullsub_1;
            *(void *)&buf[24] = &unk_1000CCCE0;
            *(void *)&buf[32] = v23;
            if (qword_1000ECEF0 != -1) {
              dispatch_once(&qword_1000ECEF0, buf);
            }
            if (!self->_drvName || !self->_providerNum)
            {
LABEL_143:
              id v132 = WALogCategoryDefaultHandle();
              id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v132);
              if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
                goto LABEL_163;
              }
              BOOL v133 = v6->_drvName == 0LL;
              int64_t wlanType = v6->_wlanType;
              BOOL v135 = v6->_providerNum == 0LL;
              BOOL v136 = v6->_drvPath == 0LL;
              *(_DWORD *)buf = 136447490;
              *(void *)&uint8_t buf[4] = "-[WAIOReporterMessagePopulator _addDriverChannelsMatchingPredicateList:]";
              *(_WORD *)&buf[12] = 1024;
              *(_DWORD *)&buf[14] = 903;
              *(_WORD *)&buf[18] = 1024;
              *(_DWORD *)&buf[20] = v133;
              *(_WORD *)&buf[24] = 1024;
              *(_DWORD *)&buf[26] = v135;
              *(_WORD *)&buf[30] = 1024;
              *(_DWORD *)&buf[32] = v136;
              *(_WORD *)&buf[36] = 2048;
              *(void *)&buf[38] = wlanType;
              v137 = "%{public}s::%d:Invalid drvName %d and providerNum %d and drvPath %d _wlanType %ld";
              v138 = v14;
              uint32_t v139 = 46;
              goto LABEL_162;
            }

- (void)signalPotentialNewIORChannels
{
  id v3 = WALogCategoryDefaultHandle();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  id v5 = (char *)os_signpost_id_generate(v4);

  id v6 = WALogCategoryDefaultHandle();
  unsigned int v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  id v8 = v7;
  if ((unint64_t)(v5 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v8,  OS_SIGNPOST_INTERVAL_BEGIN,  (os_signpost_id_t)v5,  "IOR signalPotentialNewIORChannels",  (const char *)&unk_1000B76E7,  buf,  2u);
  }

  id v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[WAIOReporterMessagePopulator queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10001929C;
  block[3] = &unk_1000CCD58;
  objc_copyWeak(v11, &location);
  block[4] = self;
  v11[1] = v5;
  dispatch_sync(v9, block);

  objc_destroyWeak(v11);
  objc_destroyWeak(&location);
}

- (void)_signalPotentialNewIORChannels
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  if (self->_rescanTimerRunning)
  {
    id v4 = WALogCategoryDefaultHandle();
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446466;
      id v152 = "-[WAIOReporterMessagePopulator _signalPotentialNewIORChannels]";
      __int16 v153 = 1024;
      int v154 = 1108;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "%{public}s::%d:Ignoring, waiting for _rescanTimerRunning to run",  buf,  0x12u);
    }

    goto LABEL_132;
  }

  +[WAUtil incrementValueForKey:inMutableDict:onQueue:]( &OBJC_CLASS___WAUtil,  "incrementValueForKey:inMutableDict:onQueue:",  @"Rescan Signal Count",  self->_cachedUsage,  self->_queue);
  -[NSMutableDictionary removeObjectForKey:](self->_cachedUsage, "removeObjectForKey:", @"Rescan Siganl Date");
  -[NSMutableDictionary setObject:forKey:](self->_cachedUsage, "setObject:forKey:", v3, @"Rescan Siganl Date");
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[WAApple80211Manager sharedObject](&OBJC_CLASS___WAApple80211Manager, "sharedObject"));
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue([v6 getInfraApple80211]);

  if (!v5)
  {
    id v147 = WALogCategoryDefaultHandle();
    uint64_t v59 = (os_log_s *)objc_claimAutoreleasedReturnValue(v147);
    if (!os_log_type_enabled(v59, OS_LOG_TYPE_ERROR)) {
      goto LABEL_94;
    }
    *(_DWORD *)buf = 136446466;
    id v152 = "-[WAIOReporterMessagePopulator _signalPotentialNewIORChannels]";
    __int16 v153 = 1024;
    int v154 = 1117;
    id v97 = "%{public}s::%d:invalid apple80211API";
    __int128 v98 = v59;
    os_log_type_t v99 = OS_LOG_TYPE_ERROR;
    goto LABEL_93;
  }

  id v7 = -[os_log_s getPhyMode](v5, "getPhyMode");
  id v8 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_cachedUsage,  "objectForKeyedSubscript:",  @"Phy Types Found after signal API"));

  if (!v8)
  {
    id v9 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_cachedUsage,  "setObject:forKeyedSubscript:",  v9,  @"Phy Types Found after signal API");
  }

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_cachedUsage,  "objectForKeyedSubscript:",  @"Phy Types Found after signal API"));
  unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", v7));
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:v11]);

  id v148 = v7;
  if (!v12)
  {
    id v28 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    BOOL v29 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_cachedUsage,  "objectForKeyedSubscript:",  @"Phy Types Found after signal API"));
    uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", v7));
    [v29 setObject:v28 forKeyedSubscript:v30];

    __int128 v24 = 0LL;
    char v26 = 1;
    char v27 = 1;
LABEL_23:
    char v25 = 1;
    goto LABEL_24;
  }

  id v13 = WALogCategoryDefaultHandle();
  id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136446722;
    id v152 = "-[WAIOReporterMessagePopulator _signalPotentialNewIORChannels]";
    __int16 v153 = 1024;
    int v154 = 1134;
    __int16 v155 = 2048;
    double v156 = *(double *)&v7;
    _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEBUG,  "%{public}s::%d:Already recscanned due to this phy %lu",  buf,  0x1Cu);
  }

  unsigned int v15 = (void *)objc_claimAutoreleasedReturnValue(-[WAIOReporterMessagePopulator cachedIOPopAvailableChannels](self, "cachedIOPopAvailableChannels"));
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v15 objectForKeyedSubscript:&off_1000DFFD0]);
  id v17 = [v16 count];

  id v18 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_cachedChannelsCountPerIORPopulatable,  "objectForKeyedSubscript:",  &off_1000DFFD0));
  id v19 = [v18 unsignedIntegerValue];

  if (v19 > v17)
  {
    id v20 = WALogCategoryDefaultHandle();
    id v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      id v22 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_cachedChannelsCountPerIORPopulatable,  "objectForKeyedSubscript:",  &off_1000DFFD0));
      id v23 = [v22 unsignedIntegerValue];
      *(_DWORD *)buf = 136446978;
      id v152 = "-[WAIOReporterMessagePopulator _signalPotentialNewIORChannels]";
      __int16 v153 = 1024;
      int v154 = 1143;
      __int16 v155 = 2048;
      double v156 = *(double *)&v17;
      __int16 v157 = 2048;
      double v158 = *(double *)&v23;
      _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "%{public}s::%d:Considering Exploratory Rescan: currentChannelCount %lu previous max chanels %lu",  buf,  0x26u);
    }

    __int128 v24 = 0LL;
    char v25 = 0;
    char v26 = 1;
    char v27 = 1;
    goto LABEL_24;
  }

  __int16 v31 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_cachedUsage,  "objectForKeyedSubscript:",  @"Rescan Permitted: Last Rescan Date"));

  if (v31)
  {
    int v32 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary valueForKey:]( self->_cachedUsage,  "valueForKey:",  @"Rescan Permitted: Last Rescan Date"));
    [v3 timeIntervalSinceDate:v32];
    if (v33 >= 0.0) {
      double v34 = v33;
    }
    else {
      double v34 = -v33;
    }
    if (-[RecommendationPreferences ior_rescan_budget_exploratory_seconds]( self->_preferences,  "ior_rescan_budget_exploratory_seconds",  v7) < v34)
    {
      id v35 = WALogCategoryDefaultHandle();
      uint64_t v36 = (os_log_s *)objc_claimAutoreleasedReturnValue(v35);
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136446722;
        id v152 = "-[WAIOReporterMessagePopulator _signalPotentialNewIORChannels]";
        __int16 v153 = 1024;
        int v154 = 1158;
        __int16 v155 = 2048;
        double v156 = v34;
        _os_log_impl( (void *)&_mh_execute_header,  v36,  OS_LOG_TYPE_DEFAULT,  "%{public}s::%d:Considering Exploratory Rescan: Last rescan was %f s ago",  buf,  0x1Cu);
      }

      __int128 v24 = 0LL;
      char v27 = 0;
      char v26 = 1;
      goto LABEL_23;
    }
  }

  id v63 = WALogCategoryDefaultHandle();
  id v64 = (os_log_s *)objc_claimAutoreleasedReturnValue(v63);
  if (os_log_type_enabled(v64, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136446466;
    id v152 = "-[WAIOReporterMessagePopulator _signalPotentialNewIORChannels]";
    __int16 v153 = 1024;
    int v154 = 1167;
    _os_log_impl( (void *)&_mh_execute_header,  v64,  OS_LOG_TYPE_DEBUG,  "%{public}s::%d:Rescan not selected due to isExploratory or isLessThanPreviousMaxChannels",  buf,  0x12u);
  }

  id v65 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_cachedUsage,  "objectForKeyedSubscript:",  @"Interface Types Found after signal API"));
  if (!v65)
  {
    int v66 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_cachedUsage,  "setObject:forKeyedSubscript:",  v66,  @"Interface Types Found after signal API");
  }

  id v67 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_cachedUsage,  "objectForKeyedSubscript:",  @"Interface Types Found after signal API",  v148));
  id v68 = (void *)objc_claimAutoreleasedReturnValue([v67 objectForKeyedSubscript:@"ap"]);
  if (v68)
  {
  }

  else
  {
    unsigned int v69 = -[os_log_s hasSoftAPInterfaceListed](v5, "hasSoftAPInterfaceListed");

    if (v69)
    {
      id v70 = WALogCategoryDefaultHandle();
      uint64_t v71 = (os_log_s *)objc_claimAutoreleasedReturnValue(v70);
      if (os_log_type_enabled(v71, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136446466;
        id v152 = "-[WAIOReporterMessagePopulator _signalPotentialNewIORChannels]";
        __int16 v153 = 1024;
        int v154 = 1182;
        _os_log_impl( (void *)&_mh_execute_header,  v71,  OS_LOG_TYPE_DEFAULT,  "%{public}s::%d:New Interface found AP",  buf,  0x12u);
      }

      char v26 = 0;
      char v27 = 1;
      char v25 = 1;
      __int128 v24 = @"ap";
      goto LABEL_24;
    }
  }

  uint64_t v72 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_cachedUsage,  "objectForKeyedSubscript:",  @"Interface Types Found after signal API"));
  BOOL v73 = (void *)objc_claimAutoreleasedReturnValue([v72 objectForKeyedSubscript:@"nan"]);
  if (v73)
  {
  }

  else
  {
    unsigned int v81 = -[os_log_s hasNANInterfaceListed](v5, "hasNANInterfaceListed");

    if (v81)
    {
      id v82 = WALogCategoryDefaultHandle();
      id v83 = (os_log_s *)objc_claimAutoreleasedReturnValue(v82);
      if (os_log_type_enabled(v83, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136446466;
        id v152 = "-[WAIOReporterMessagePopulator _signalPotentialNewIORChannels]";
        __int16 v153 = 1024;
        int v154 = 1190;
        _os_log_impl( (void *)&_mh_execute_header,  v83,  OS_LOG_TYPE_DEFAULT,  "%{public}s::%d:New Interface found NAN",  buf,  0x12u);
      }

      char v26 = 0;
      char v27 = 1;
      char v25 = 1;
      __int128 v24 = @"nan";
      goto LABEL_24;
    }
  }

  uint64_t v84 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_cachedUsage,  "objectForKeyedSubscript:",  @"Interface Types Found after signal API"));
  __int128 v85 = (void *)objc_claimAutoreleasedReturnValue([v84 objectForKeyedSubscript:@"awdl"]);
  if (v85)
  {
  }

  else
  {
    unsigned int v86 = -[os_log_s hasAWDLInterfaceListed](v5, "hasAWDLInterfaceListed");

    if (v86)
    {
      id v87 = WALogCategoryDefaultHandle();
      id v88 = (os_log_s *)objc_claimAutoreleasedReturnValue(v87);
      if (os_log_type_enabled(v88, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136446466;
        id v152 = "-[WAIOReporterMessagePopulator _signalPotentialNewIORChannels]";
        __int16 v153 = 1024;
        int v154 = 1198;
        _os_log_impl( (void *)&_mh_execute_header,  v88,  OS_LOG_TYPE_DEFAULT,  "%{public}s::%d:New Interface found AWDL",  buf,  0x12u);
      }

      char v26 = 0;
      char v27 = 1;
      char v25 = 1;
      __int128 v24 = @"awdl";
      goto LABEL_24;
    }
  }

  __int128 v89 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_cachedUsage,  "objectForKeyedSubscript:",  @"Interface Types Found after signal API"));
  __int128 v90 = (void *)objc_claimAutoreleasedReturnValue([v89 objectForKeyedSubscript:@"ir"]);
  if (v90)
  {

LABEL_91:
    id v96 = WALogCategoryDefaultHandle();
    uint64_t v59 = (os_log_s *)objc_claimAutoreleasedReturnValue(v96);
    if (!os_log_type_enabled(v59, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_94;
    }
    *(_DWORD *)buf = 136446466;
    id v152 = "-[WAIOReporterMessagePopulator _signalPotentialNewIORChannels]";
    __int16 v153 = 1024;
    int v154 = 1211;
    id v97 = "%{public}s::%d:Rescan not selected due to No new Interfaces found";
    __int128 v98 = v59;
    os_log_type_t v99 = OS_LOG_TYPE_DEBUG;
LABEL_93:
    _os_log_impl((void *)&_mh_execute_header, v98, v99, v97, buf, 0x12u);
    goto LABEL_94;
  }

  unsigned int v93 = -[os_log_s hasIRInterfaceListed](v5, "hasIRInterfaceListed");

  if (!v93) {
    goto LABEL_91;
  }
  id v94 = WALogCategoryDefaultHandle();
  __int128 v95 = (os_log_s *)objc_claimAutoreleasedReturnValue(v94);
  if (os_log_type_enabled(v95, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    id v152 = "-[WAIOReporterMessagePopulator _signalPotentialNewIORChannels]";
    __int16 v153 = 1024;
    int v154 = 1206;
    _os_log_impl( (void *)&_mh_execute_header,  v95,  OS_LOG_TYPE_DEFAULT,  "%{public}s::%d:New Interface found IR",  buf,  0x12u);
  }

  char v26 = 0;
  char v27 = 1;
  char v25 = 1;
  __int128 v24 = @"ir";
LABEL_24:
  BOOL v37 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_cachedUsage,  "objectForKeyedSubscript:",  @"Rescan Permitted: Last Rescan Date",  v148));

  if (v37)
  {
    uint64_t v38 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_cachedUsage,  "objectForKeyedSubscript:",  @"Rescan Permitted: Last Rescan Date"));
    [v3 timeIntervalSinceDate:v38];
    double v40 = v39;

    id v41 = WALogCategoryDefaultHandle();
    uint64_t v42 = (os_log_s *)objc_claimAutoreleasedReturnValue(v41);
    if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446722;
      double v43 = -v40;
      id v152 = "-[WAIOReporterMessagePopulator _signalPotentialNewIORChannels]";
      if (v40 >= 0.0) {
        double v43 = v40;
      }
      __int16 v153 = 1024;
      int v154 = 1219;
      __int16 v155 = 2048;
      double v156 = v43;
      _os_log_impl( (void *)&_mh_execute_header,  v42,  OS_LOG_TYPE_DEFAULT,  "%{public}s::%d:Last rescan was %f s ago",  buf,  0x1Cu);
    }
  }

  char v150 = v25;
  if ((v26 & 1) != 0)
  {
    if (v12)
    {
      if ((v25 & 1) != 0)
      {
        if ((v27 & 1) != 0)
        {
          id v44 = WALogCategoryDefaultHandle();
          BOOL v45 = (os_log_s *)objc_claimAutoreleasedReturnValue(v44);
          if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136446466;
            id v152 = "-[WAIOReporterMessagePopulator _signalPotentialNewIORChannels]";
            __int16 v153 = 1024;
            int v154 = 1285;
            _os_log_impl( (void *)&_mh_execute_header,  v45,  OS_LOG_TYPE_ERROR,  "%{public}s::%d:Testing budget with no reason",  buf,  0x12u);
          }

          char v46 = v27;

          goto LABEL_103;
        }

        id v74 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_cachedUsage,  "objectForKeyedSubscript:",  @"Rescan Reason: Explore Date"));

        if (v74)
        {
          __int128 v75 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_cachedUsage,  "objectForKeyedSubscript:",  @"Rescan Reason: Explore Date"));
          [v3 timeIntervalSinceDate:v75];
          double v77 = v76;

          if (v77 < 0.0) {
            double v77 = -v77;
          }
          double v78 = (double)-[RecommendationPreferences ior_rescan_budget_less_than_previous_max_channels_seconds]( self->_preferences,  "ior_rescan_budget_less_than_previous_max_channels_seconds");
          id v79 = WALogCategoryDefaultHandle();
          uint64_t v59 = (os_log_s *)objc_claimAutoreleasedReturnValue(v79);
          BOOL v80 = os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT);
          if (v77 < v78)
          {
            if (v80)
            {
              uint64_t v61 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_cachedUsage,  "objectForKeyedSubscript:",  @"Rescan Reason: Explore Count"));
              *(_DWORD *)buf = 136446978;
              id v152 = "-[WAIOReporterMessagePopulator _signalPotentialNewIORChannels]";
              __int16 v153 = 1024;
              int v154 = 1268;
              __int16 v155 = 2112;
              double v156 = *(double *)&v61;
              __int16 v157 = 2048;
              double v158 = v77;
              id v62 = "%{public}s::%d:Rescan Budget Denied: Explore - previous rescans %@ - last check was %f s ago";
              goto LABEL_68;
            }

            goto LABEL_94;
          }

          if (v80)
          {
            __int128 v104 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_cachedUsage,  "objectForKeyedSubscript:",  @"Rescan Reason: Explore Count"));
            *(_DWORD *)buf = 136446978;
            id v152 = "-[WAIOReporterMessagePopulator _signalPotentialNewIORChannels]";
            __int16 v153 = 1024;
            int v154 = 1271;
            __int16 v155 = 2112;
            double v156 = *(double *)&v104;
            __int16 v157 = 2048;
            double v158 = v77;
            _os_log_impl( (void *)&_mh_execute_header,  v59,  OS_LOG_TYPE_DEFAULT,  "%{public}s::%d:Rescan Budget OK: Missing Channels - previous rescans %@ - last check was %f s ago",  buf,  0x26u);
          }
        }

        else
        {
          id v103 = WALogCategoryDefaultHandle();
          uint64_t v59 = (os_log_s *)objc_claimAutoreleasedReturnValue(v103);
          if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136446466;
            id v152 = "-[WAIOReporterMessagePopulator _signalPotentialNewIORChannels]";
            __int16 v153 = 1024;
            int v154 = 1274;
            _os_log_impl( (void *)&_mh_execute_header,  v59,  OS_LOG_TYPE_DEFAULT,  "%{public}s::%d:Rescan Budget OK: Explore - first rescan",  buf,  0x12u);
          }
        }

        char v46 = v27;

        +[WAUtil incrementValueForKey:inMutableDict:onQueue:]( &OBJC_CLASS___WAUtil,  "incrementValueForKey:inMutableDict:onQueue:",  @"Rescan Reason: Explore Count",  self->_cachedUsage,  self->_queue);
        cachedUsage = self->_cachedUsage;
        uint64_t v50 = @"Rescan Reason: Explore Date";
      }

      else
      {
        BOOL v53 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_cachedUsage,  "objectForKeyedSubscript:",  @"Rescan Reason: Low Channel Date"));

        if (v53)
        {
          uint64_t v54 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_cachedUsage,  "objectForKeyedSubscript:",  @"Rescan Reason: Low Channel Date"));
          [v3 timeIntervalSinceDate:v54];
          double v56 = v55;

          if (v56 < 0.0) {
            double v56 = -v56;
          }
          double v57 = (double)-[RecommendationPreferences ior_rescan_budget_less_than_previous_max_channels_seconds]( self->_preferences,  "ior_rescan_budget_less_than_previous_max_channels_seconds");
          id v58 = WALogCategoryDefaultHandle();
          uint64_t v59 = (os_log_s *)objc_claimAutoreleasedReturnValue(v58);
          BOOL v60 = os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT);
          if (v56 < v57)
          {
            if (v60)
            {
              uint64_t v61 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_cachedUsage,  "objectForKeyedSubscript:",  @"Rescan Reason: Low Channel Count"));
              *(_DWORD *)buf = 136446978;
              id v152 = "-[WAIOReporterMessagePopulator _signalPotentialNewIORChannels]";
              __int16 v153 = 1024;
              int v154 = 1246;
              __int16 v155 = 2112;
              double v156 = *(double *)&v61;
              __int16 v157 = 2048;
              double v158 = v56;
              id v62 = "%{public}s::%d:Rescan Budget Denied: Missing Channels - previous rescans %@ - last check was %f s ago";
LABEL_68:
              _os_log_impl((void *)&_mh_execute_header, v59, OS_LOG_TYPE_DEFAULT, v62, buf, 0x26u);
            }

- (void)_cancelDelayedInvocationForRescan
{
  if (self->_rescanTimerRunning)
  {
    rescanTimer = self->_rescanTimer;
    if (rescanTimer)
    {
      if (!dispatch_source_testcancel((dispatch_source_t)rescanTimer))
      {
        id v4 = WALogCategoryDefaultHandle();
        id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
        {
          int v9 = 136446466;
          uint64_t v10 = "-[WAIOReporterMessagePopulator _cancelDelayedInvocationForRescan]";
          __int16 v11 = 1024;
          int v12 = 1367;
          _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "%{public}s::%d:Timer exists and is valid, Suspending",  (uint8_t *)&v9,  0x12u);
        }

        dispatch_suspend((dispatch_object_t)self->_rescanTimer);
        self->_BOOL rescanTimerRunning = 0;
        id v6 = WALogCategoryDefaultHandle();
        id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          BOOL rescanTimerRunning = self->_rescanTimerRunning;
          int v9 = 136446722;
          uint64_t v10 = "-[WAIOReporterMessagePopulator _cancelDelayedInvocationForRescan]";
          __int16 v11 = 1024;
          int v12 = 1370;
          __int16 v13 = 1024;
          BOOL v14 = rescanTimerRunning;
          _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "%{public}s::%d:setting _rescanTimerRunning %d",  (uint8_t *)&v9,  0x18u);
        }
      }
    }
  }

- (void)_delayedInvocationForRescan
{
  id v3 = WALogCategoryDefaultHandle();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    BOOL rescanTimerRunning = self->_rescanTimerRunning;
    unint64_t v6 = -[RecommendationPreferences ior_rescan_new_phy_delay_seconds]( self->_preferences,  "ior_rescan_new_phy_delay_seconds");
    rescanTimer = self->_rescanTimer;
    BOOL v8 = rescanTimer != 0LL;
    if (rescanTimer) {
      BOOL v9 = dispatch_source_testcancel((dispatch_source_t)rescanTimer) != 0;
    }
    else {
      BOOL v9 = 0;
    }
    *(_DWORD *)buf = 136447490;
    BOOL v45 = "-[WAIOReporterMessagePopulator _delayedInvocationForRescan]";
    __int16 v46 = 1024;
    int v47 = 1376;
    __int16 v48 = 1024;
    *(_DWORD *)BOOL v49 = rescanTimerRunning;
    *(_WORD *)&v49[4] = 2048;
    *(void *)&v49[6] = v6;
    __int16 v50 = 1024;
    BOOL v51 = v8;
    __int16 v52 = 1024;
    BOOL v53 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "%{public}s::%d:_rescanTimerRunning is %d ior_rescan_new_phy_delay_seconds is %lu _timer exists %d testcancel is %d",  buf,  0x2Eu);
  }

  if (self->_rescanTimerRunning) {
    goto LABEL_31;
  }
  id v10 = WALogCategoryDefaultHandle();
  __int16 v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136446466;
    BOOL v45 = "-[WAIOReporterMessagePopulator _delayedInvocationForRescan]";
    __int16 v46 = 1024;
    int v47 = 1379;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "%{public}s::%d:Setting timer", buf, 0x12u);
  }

  int v12 = self->_rescanTimer;
  if (v12)
  {
    if (!dispatch_source_testcancel((dispatch_source_t)v12))
    {
LABEL_22:
      id v24 = WALogCategoryDefaultHandle();
      char v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        unint64_t v26 = -[RecommendationPreferences ior_rescan_new_phy_delay_seconds]( self->_preferences,  "ior_rescan_new_phy_delay_seconds");
        *(_DWORD *)buf = 136446722;
        BOOL v45 = "-[WAIOReporterMessagePopulator _delayedInvocationForRescan]";
        __int16 v46 = 1024;
        int v47 = 1405;
        __int16 v48 = 2048;
        *(void *)BOOL v49 = v26;
        _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "%{public}s::%d:Starting dispatch_source_set_timer fire in %lu s",  buf,  0x1Cu);
      }

      char v27 = self->_rescanTimer;
      dispatch_time_t v28 = dispatch_time( 0xFFFFFFFFFFFFFFFELL,  1000000000 * -[RecommendationPreferences ior_rescan_new_phy_delay_seconds]( self->_preferences,  "ior_rescan_new_phy_delay_seconds"));
      dispatch_source_set_timer((dispatch_source_t)v27, v28, 0xFFFFFFFFFFFFFFFFLL, 0x5F5E100uLL);
      id v29 = WALogCategoryDefaultHandle();
      uint64_t v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136446466;
        BOOL v45 = "-[WAIOReporterMessagePopulator _delayedInvocationForRescan]";
        __int16 v46 = 1024;
        int v47 = 1407;
        _os_log_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_DEFAULT,  "%{public}s::%d:Starting dispatch_source_set_timer Done",  buf,  0x12u);
      }

      id v31 = WALogCategoryDefaultHandle();
      int v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136446466;
        BOOL v45 = "-[WAIOReporterMessagePopulator _delayedInvocationForRescan]";
        __int16 v46 = 1024;
        int v47 = 1409;
        _os_log_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_DEFAULT,  "%{public}s::%d:dispatch_resume _timer",  buf,  0x12u);
      }

      dispatch_resume((dispatch_object_t)self->_rescanTimer);
      self->_BOOL rescanTimerRunning = 1;
      id v33 = WALogCategoryDefaultHandle();
      double v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        BOOL v35 = self->_rescanTimerRunning;
        *(_DWORD *)buf = 136446722;
        BOOL v45 = "-[WAIOReporterMessagePopulator _delayedInvocationForRescan]";
        __int16 v46 = 1024;
        int v47 = 1413;
        __int16 v48 = 1024;
        *(_DWORD *)BOOL v49 = v35;
        _os_log_impl( (void *)&_mh_execute_header,  v34,  OS_LOG_TYPE_DEFAULT,  "%{public}s::%d:setting _rescanTimerRunning %d",  buf,  0x18u);
      }

LABEL_31:
      id v36 = WALogCategoryDefaultHandle();
      BOOL v37 = (os_log_s *)objc_claimAutoreleasedReturnValue(v36);
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
      {
        BOOL v38 = self->_rescanTimerRunning;
        unint64_t v39 = -[RecommendationPreferences ior_rescan_new_phy_delay_seconds]( self->_preferences,  "ior_rescan_new_phy_delay_seconds");
        double v40 = self->_rescanTimer;
        if (v40) {
          BOOL v41 = dispatch_source_testcancel((dispatch_source_t)v40) == 0;
        }
        else {
          BOOL v41 = 0;
        }
        *(_DWORD *)buf = 136447234;
        BOOL v45 = "-[WAIOReporterMessagePopulator _delayedInvocationForRescan]";
        __int16 v46 = 1024;
        int v47 = 1417;
        __int16 v48 = 1024;
        *(_DWORD *)BOOL v49 = v38;
        *(_WORD *)&v49[4] = 2048;
        *(void *)&v49[6] = v39;
        __int16 v50 = 1024;
        BOOL v51 = v41;
        _os_log_impl( (void *)&_mh_execute_header,  v37,  OS_LOG_TYPE_DEFAULT,  "%{public}s::%d:Timer State : Enabled %d Period(ms) %lu valid %d",  buf,  0x28u);
      }

      goto LABEL_36;
    }

- (void)scanPredicatesNotYetFoundAndMutable
{
  id v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[WAIOReporterMessagePopulator queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10001B678;
  block[3] = &unk_1000CCBD8;
  objc_copyWeak(&v5, &location);
  block[4] = self;
  dispatch_sync(v3, block);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)_scanPredicatesWithMode:(int64_t)a3
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[WAIOReporterMessagePopulator cachedIOPopAvailableChannels](self, "cachedIOPopAvailableChannels"));
  unint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:&off_1000DFFD0]);

  if (v6)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[WAIOReporterMessagePopulator cachedIOPopAvailableChannels](self, "cachedIOPopAvailableChannels"));
    BOOL v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:&off_1000DFFD0]);
    id v9 = [v8 count];

    if (!a3) {
      goto LABEL_9;
    }
  }

  else
  {
    id v9 = 0LL;
    if (!a3) {
      goto LABEL_9;
    }
  }

  if (!v9)
  {
    id v10 = WALogCategoryDefaultHandle();
    __int16 v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v40 = 136446978;
      BOOL v41 = "-[WAIOReporterMessagePopulator _scanPredicatesWithMode:]";
      __int16 v42 = 1024;
      int v43 = 1447;
      __int16 v44 = 2048;
      BOOL v45 = (_UNKNOWN **)a3;
      __int16 v46 = 2048;
      int v47 = 0LL;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "%{public}s::%d:predicateSearch %ld when previousChannelCount %lu, changing predicateSearch to kWAIORIOReporterSe archAllStaticPredicates",  (uint8_t *)&v40,  0x26u);
    }

    a3 = 0LL;
    goto LABEL_13;
  }

- (void)_buildOrRescanToBuildChannelAvailabilityCaches:(int64_t)a3
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[WAIOReporterMessagePopulator cachedIOPopAvailableChannels](self, "cachedIOPopAvailableChannels"));
  unint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", 5LL));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:v6]);

  id v8 = WALogCategoryDefaultHandle();
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (v7)
  {
    if (v10)
    {
      int v11 = 136446722;
      uint64_t v12 = "-[WAIOReporterMessagePopulator _buildOrRescanToBuildChannelAvailabilityCaches:]";
      __int16 v13 = 1024;
      int v14 = 1499;
      __int16 v15 = 2048;
      int64_t v16 = a3;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "%{public}s::%d:Running _scanPredicatesWithMode:%ld",  (uint8_t *)&v11,  0x1Cu);
    }

    -[WAIOReporterMessagePopulator _scanPredicatesWithMode:](self, "_scanPredicatesWithMode:", a3);
  }

  else
  {
    if (v10)
    {
      int v11 = 136446466;
      uint64_t v12 = "-[WAIOReporterMessagePopulator _buildOrRescanToBuildChannelAvailabilityCaches:]";
      __int16 v13 = 1024;
      int v14 = 1492;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "%{public}s::%d:Running _findChannelsAndBuildChannelCaches:kWAIORIOReporterSearchAllStaticPredicates",  (uint8_t *)&v11,  0x12u);
    }

    -[WAIOReporterMessagePopulator _findChannelsAndBuildChannelCaches:]( self,  "_findChannelsAndBuildChannelCaches:",  0LL);
  }

- (void)_findChannelsAndBuildChannelCaches:(int64_t)a3
{
  uint64_t v127 = 0LL;
  value = 0LL;
  __int16 v126 = 0;
  +[WAUtil incrementValueForKey:inMutableDict:onQueue:]( &OBJC_CLASS___WAUtil,  "incrementValueForKey:inMutableDict:onQueue:",  @"Find Channels Calls",  self->_cachedUsage,  self->_queue);
  id v5 = (void *)objc_claimAutoreleasedReturnValue( -[WAIOReporterMessagePopulator cachedChannelsCountPerIORPopulatable]( self,  "cachedChannelsCountPerIORPopulatable"));

  if (!v5)
  {
    unint64_t v6 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    -[WAIOReporterMessagePopulator setCachedChannelsCountPerIORPopulatable:]( self,  "setCachedChannelsCountPerIORPopulatable:",  v6);
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[WAIOReporterMessagePopulator cachedIOPopAvailableChannels](self, "cachedIOPopAvailableChannels"));

  if (v7)
  {
    id v8 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue( -[WAIOReporterMessagePopulator cachedIOPopAvailableChannels]( self,  "cachedIOPopAvailableChannels"));
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v8, "objectForKeyedSubscript:", &off_1000DFFD0));
    id v10 = [v9 count];
  }

  else
  {
    id v8 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    -[WAIOReporterMessagePopulator setCachedIOPopAvailableChannels:](self, "setCachedIOPopAvailableChannels:", v8);
    id v10 = 0LL;
  }

  if (a3 && !v10)
  {
    id v11 = WALogCategoryDefaultHandle();
    uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446978;
      id v130 = "-[WAIOReporterMessagePopulator _findChannelsAndBuildChannelCaches:]";
      __int16 v131 = 1024;
      int v132 = 1532;
      __int16 v133 = 2048;
      *(void *)v134 = a3;
      *(_WORD *)&v134[8] = 2048;
      unint64_t v135 = 0LL;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "%{public}s::%d:predicateSearch %ld when previousChannelCount %lu, changing predicateSearch to kWAIORIOReporterSe archAllStaticPredicates",  buf,  0x26u);
    }

    a3 = 0LL;
LABEL_15:
    id v17 = WALogCategoryDefaultHandle();
    id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_signpost_enabled(v18))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v18,  OS_SIGNPOST_INTERVAL_BEGIN,  0xEEEEB0B5B2B2EEEELL,  "IOR FindChannelsAndBuildChannelCaches",  (const char *)&unk_1000B76E7,  buf,  2u);
    }

    uint64_t v19 = objc_claimAutoreleasedReturnValue(-[WAIOReporterMessagePopulator cachedIOReportSample](self, "cachedIOReportSample"));
    if (v19)
    {
      unint64_t v20 = (void *)v19;
      id v21 = (void *)objc_claimAutoreleasedReturnValue(-[WAIOReporterMessagePopulator cachedIOReportSample](self, "cachedIOReportSample"));
      id v22 = (void *)objc_claimAutoreleasedReturnValue([v21 objectForKeyedSubscript:&off_1000DFFD0]);
      if (!v22)
      {

        unsigned int v26 = 0;
LABEL_34:

LABEL_35:
        if (HIBYTE(v126) | v126)
        {
          +[WAUtil incrementValueForKey:inMutableDict:onQueue:]( &OBJC_CLASS___WAUtil,  "incrementValueForKey:inMutableDict:onQueue:",  @"Fault Detection: Stale DriverID Count",  self->_cachedUsage,  self->_queue);
          -[NSMutableDictionary removeObjectForKey:]( self->_cachedUsage,  "removeObjectForKey:",  @"Fault Detection: Stale DriverID Date");
          cachedUsage = self->_cachedUsage;
          id v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
          -[NSMutableDictionary setObject:forKey:]( cachedUsage,  "setObject:forKey:",  v33,  @"Fault Detection: Stale DriverID Date");

          -[WAIOReporterMessagePopulator _clearIOReporterCache](self, "_clearIOReporterCache");
          unsigned int v26 = 0;
        }

        else if ((_DWORD)v22)
        {
          id v34 = -[NSMutableArray count](self->_cachedPredicatesNotYetFound, "count");
          id v35 = WALogCategoryDefaultHandle();
          id v36 = (os_log_s *)objc_claimAutoreleasedReturnValue(v35);
          BOOL v37 = os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT);
          if (v34)
          {
            if (v37)
            {
              *(_DWORD *)buf = 136446722;
              id v130 = "-[WAIOReporterMessagePopulator _findChannelsAndBuildChannelCaches:]";
              __int16 v131 = 1024;
              int v132 = 1570;
              __int16 v133 = 2048;
              *(void *)v134 = a3;
              _os_log_impl( (void *)&_mh_execute_header,  v36,  OS_LOG_TYPE_DEFAULT,  "%{public}s::%d:Some predicates not found, searching %ld",  buf,  0x1Cu);
            }

            id v38 = WALogCategoryDefaultHandle();
            id v39 = (os_log_s *)objc_claimAutoreleasedReturnValue(v38);
            if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136446722;
              id v130 = "-[WAIOReporterMessagePopulator _findChannelsAndBuildChannelCaches:]";
              __int16 v131 = 1024;
              int v132 = 1572;
              __int16 v133 = 2048;
              *(void *)v134 = a3;
              _os_log_impl( (void *)&_mh_execute_header,  v39,  OS_LOG_TYPE_DEFAULT,  "%{public}s::%d:Running _buildOrRescanToBuildChannelAvailabilityCaches:%ld",  buf,  0x1Cu);
            }

            int v40 = self;
            int64_t v41 = a3;
          }

          else
          {
            if (v37)
            {
              *(_DWORD *)buf = 136446466;
              id v130 = "-[WAIOReporterMessagePopulator _findChannelsAndBuildChannelCaches:]";
              __int16 v131 = 1024;
              int v132 = 1575;
              _os_log_impl( (void *)&_mh_execute_header,  v36,  OS_LOG_TYPE_DEFAULT,  "%{public}s::%d:All predicates found, searching kWAIORIOReporterSearchMutablePredicates",  buf,  0x12u);
            }

            id v46 = WALogCategoryDefaultHandle();
            int v47 = (os_log_s *)objc_claimAutoreleasedReturnValue(v46);
            if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136446466;
              id v130 = "-[WAIOReporterMessagePopulator _findChannelsAndBuildChannelCaches:]";
              __int16 v131 = 1024;
              int v132 = 1577;
              _os_log_impl( (void *)&_mh_execute_header,  v47,  OS_LOG_TYPE_DEFAULT,  "%{public}s::%d:Running _buildOrRescanToBuildChannelAvailabilityCaches:kWAIORIOReporterSearchMutablePredicates",  buf,  0x12u);
            }

            int v40 = self;
            int64_t v41 = 3LL;
          }

          -[WAIOReporterMessagePopulator _buildOrRescanToBuildChannelAvailabilityCaches:]( v40,  "_buildOrRescanToBuildChannelAvailabilityCaches:",  v41);
LABEL_55:
          __int16 v48 = (void *)objc_claimAutoreleasedReturnValue( -[WAIOReporterMessagePopulator cachedIOPopAvailableChannels]( self,  "cachedIOPopAvailableChannels"));
          id v49 = (const void *)objc_claimAutoreleasedReturnValue([v48 objectForKeyedSubscript:&off_1000DFFD0]);

          if (!v49 || (int)IOReportGetChannelCount(v49) <= 0)
          {
            id v115 = WALogCategoryDefaultHandle();
            id v116 = (os_log_s *)objc_claimAutoreleasedReturnValue(v115);
            if (os_log_type_enabled(v116, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136446466;
              id v130 = "-[WAIOReporterMessagePopulator _findChannelsAndBuildChannelCaches:]";
              __int16 v131 = 1024;
              int v132 = 1583;
              _os_log_impl( (void *)&_mh_execute_header,  v116,  OS_LOG_TYPE_ERROR,  "%{public}s::%d:No WiFi Channels found",  buf,  0x12u);
            }

            if (v49)
            {
              CFRelease(v49);
              id v49 = 0LL;
            }

            goto LABEL_118;
          }

          if (!v26)
          {
            uint64_t v50 = -[WAIOReporterMessagePopulator _getCCPipeDriverForWLAN](self, "_getCCPipeDriverForWLAN");
            if ((_DWORD)v50)
            {
              uint64_t v51 = IOReportCopyChannelsForDriver(v50, 0LL, &v127);
              __int16 v52 = (const void *)v51;
              if (v51 && (int)IOReportGetChannelCount(v51) > 0)
              {
                id v53 = WALogCategoryDefaultHandle();
                uint64_t v54 = (os_log_s *)objc_claimAutoreleasedReturnValue(v53);
                if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
                {
                  int ChannelCount = IOReportGetChannelCount(v52);
                  int v56 = IOReportGetChannelCount(v49);
                  *(_DWORD *)buf = 136446978;
                  id v130 = "-[WAIOReporterMessagePopulator _findChannelsAndBuildChannelCaches:]";
                  __int16 v131 = 1024;
                  int v132 = 1592;
                  __int16 v133 = 1024;
                  *(_DWORD *)v134 = ChannelCount;
                  *(_WORD *)&v134[4] = 1024;
                  *(_DWORD *)&v134[6] = v56;
                  _os_log_impl( (void *)&_mh_execute_header,  v54,  OS_LOG_TYPE_DEFAULT,  "%{public}s::%d:Adding %d channels to %d",  buf,  0x1Eu);
                }

                int v57 = IOReportMergeChannels(v49, v52, &v127);
                id v58 = WALogCategoryDefaultHandle();
                uint64_t v59 = (os_log_s *)objc_claimAutoreleasedReturnValue(v58);
                BOOL v60 = v59;
                if (!v57)
                {
                  if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
                  {
                    int v61 = IOReportGetChannelCount(v49);
                    *(_DWORD *)buf = 136446722;
                    id v130 = "-[WAIOReporterMessagePopulator _findChannelsAndBuildChannelCaches:]";
                    __int16 v131 = 1024;
                    int v132 = 1598;
                    __int16 v133 = 1024;
                    *(_DWORD *)v134 = v61;
                    _os_log_impl( (void *)&_mh_execute_header,  v60,  OS_LOG_TYPE_DEFAULT,  "%{public}s::%d:Final channel count %d",  buf,  0x18u);
                  }

                  CFRelease(v52);
                  goto LABEL_70;
                }

                if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 136446722;
                  id v130 = "-[WAIOReporterMessagePopulator _findChannelsAndBuildChannelCaches:]";
                  __int16 v131 = 1024;
                  int v132 = 1596;
                  __int16 v133 = 2112;
                  *(void *)v134 = v127;
                  _os_log_impl( (void *)&_mh_execute_header,  v60,  OS_LOG_TYPE_ERROR,  "%{public}s::%d:Couldn't get additionalChannels from CCLogPipe driver %@",  buf,  0x1Cu);
                }
              }

              else
              {
                id v124 = WALogCategoryDefaultHandle();
                v125 = (os_log_s *)objc_claimAutoreleasedReturnValue(v124);
                if (os_log_type_enabled(v125, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 136446722;
                  id v130 = "-[WAIOReporterMessagePopulator _findChannelsAndBuildChannelCaches:]";
                  __int16 v131 = 1024;
                  int v132 = 1590;
                  __int16 v133 = 2112;
                  *(void *)v134 = v127;
                  _os_log_impl( (void *)&_mh_execute_header,  v125,  OS_LOG_TYPE_ERROR,  "%{public}s::%d:Couldn't get additionalChannels from CCLogPipe driver %@",  buf,  0x1Cu);
                }

                if (!v52) {
                  goto LABEL_118;
                }
              }

              CFRelease(v52);
              goto LABEL_118;
            }

            id v62 = WALogCategoryDefaultHandle();
            id v63 = (os_log_s *)objc_claimAutoreleasedReturnValue(v62);
            if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136446466;
              id v130 = "-[WAIOReporterMessagePopulator _findChannelsAndBuildChannelCaches:]";
              __int16 v131 = 1024;
              int v132 = 1601;
              _os_log_impl( (void *)&_mh_execute_header,  v63,  OS_LOG_TYPE_ERROR,  "%{public}s::%d:Couldn't find _getCCPipeDriverForWLAN",  buf,  0x12u);
            }
          }

- (unsigned)_iorPreparedForSampling:(unsigned __int8)a3
{
  int v3 = a3;
  id v4 = self;
  CFErrorRef v170 = 0LL;
  CFTypeRef cf = 0LL;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[WAIOReporterMessagePopulator cachedIOPopAvailableChannels](self, "cachedIOPopAvailableChannels"));
  unint64_t v6 = &AnalyticsSendEventLazy_ptr;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", 5LL));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:v7]);

  if (v8)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[WAIOReporterMessagePopulator cachedIOReportSubbedChannels](v4, "cachedIOReportSubbedChannels"));

    if (!v9)
    {
      id v10 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
      -[WAIOReporterMessagePopulator setCachedIOReportSubbedChannels:](v4, "setCachedIOReportSubbedChannels:", v10);
    }

    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[WAIOReporterMessagePopulator cachedIOReportSample](v4, "cachedIOReportSample"));

    if (!v11)
    {
      uint64_t v12 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
      -[WAIOReporterMessagePopulator setCachedIOReportSample:](v4, "setCachedIOReportSample:", v12);
    }

    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[WAIOReporterMessagePopulator cachedIOReportSubbedChannels](v4, "cachedIOReportSubbedChannels"));
    int v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", 5LL));
    __int16 v15 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKeyedSubscript:v14]);
    if (v15)
    {
      id v16 = (void *)objc_claimAutoreleasedReturnValue(-[WAIOReporterMessagePopulator cachedIOReportSubbedChannels](v4, "cachedIOReportSubbedChannels"));
      id v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", 5LL));
      id v18 = (void *)objc_claimAutoreleasedReturnValue([v16 objectForKeyedSubscript:v17]);
    }

    id v19 = WALogCategoryDefaultHandle();
    unint64_t v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
    if (os_signpost_enabled(v20))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v20,  OS_SIGNPOST_INTERVAL_BEGIN,  0xEEEEB0B5B2B2EEEELL,  "IOR Prepare IOReporter",  (const char *)&unk_1000B76E7,  buf,  2u);
    }

    id v21 = (void *)objc_claimAutoreleasedReturnValue(-[WAIOReporterMessagePopulator cachedIOReportSubbedChannels](v4, "cachedIOReportSubbedChannels"));
    id v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", 5LL));
    uint64_t v23 = objc_claimAutoreleasedReturnValue([v21 objectForKeyedSubscript:v22]);
    v169 = v4;
    if (v23)
    {
      id v24 = (void *)v23;
      char v25 = (void *)objc_claimAutoreleasedReturnValue(-[WAIOReporterMessagePopulator cachedIOReportSubbedChannels](v4, "cachedIOReportSubbedChannels"));
      unsigned int v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", 5LL));
      id v27 = (void *)objc_claimAutoreleasedReturnValue([v25 objectForKeyedSubscript:v26]);
      dispatch_time_t v28 = (void *)objc_claimAutoreleasedReturnValue([v27 objectForKeyedSubscript:@"iorsub"]);

      if (v28) {
        goto LABEL_33;
      }
    }

    else
    {
    }

    id v32 = WALogCategoryDefaultHandle();
    id v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446466;
      __int128 v173 = "-[WAIOReporterMessagePopulator _iorPreparedForSampling:]";
      __int16 v174 = 1024;
      int v175 = 1714;
      _os_log_impl( (void *)&_mh_execute_header,  v33,  OS_LOG_TYPE_DEFAULT,  "%{public}s::%d:cachedIOReportSubbedChannels nil - running and caching IOReportCreateSubscription",  buf,  0x12u);
    }

    id v34 = WALogCategoryDefaultHandle();
    id v35 = (os_log_s *)objc_claimAutoreleasedReturnValue(v34);
    if (os_signpost_enabled(v35))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v35,  OS_SIGNPOST_INTERVAL_BEGIN,  0xEEEEB0B5B2B2EEEELL,  "IOR IOReportCreateSubscription",  (const char *)&unk_1000B76E7,  buf,  2u);
    }

    +[WAUtil incrementValueForKey:inMutableDict:onQueue:]( &OBJC_CLASS___WAUtil,  "incrementValueForKey:inMutableDict:onQueue:",  @"CreateSubscription Calls",  v4->_cachedUsage,  v4->_queue);
    CFAllocatorRef Default = CFAllocatorGetDefault();
    BOOL v37 = (void *)objc_claimAutoreleasedReturnValue(-[WAIOReporterMessagePopulator cachedIOPopAvailableChannels](v4, "cachedIOPopAvailableChannels"));
    id v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", 5LL));
    id v39 = (void *)objc_claimAutoreleasedReturnValue([v37 objectForKeyedSubscript:v38]);
    int v40 = (void *)IOReportCreateSubscription(Default, v39, &cf, 0LL, &v170);

    if (!v40 || (v41 = cf) == 0LL || (CFErrorRef v42 = v170) != 0LL)
    {
      +[WAUtil incrementValueForKey:inMutableDict:onQueue:]( &OBJC_CLASS___WAUtil,  "incrementValueForKey:inMutableDict:onQueue:",  @"CreateSubscription Failed Calls",  v4->_cachedUsage,  v4->_queue);
      CFErrorRef v42 = v170;
      CFTypeRef v41 = cf;
    }

    if (!v40 || !v41 || v42)
    {
      id v151 = WALogCategoryDefaultHandle();
      id v152 = (os_log_s *)objc_claimAutoreleasedReturnValue(v151);
      if (os_log_type_enabled(v152, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446466;
        __int128 v173 = "-[WAIOReporterMessagePopulator _iorPreparedForSampling:]";
        __int16 v174 = 1024;
        int v175 = 1726;
        _os_log_impl( (void *)&_mh_execute_header,  v152,  OS_LOG_TYPE_ERROR,  "%{public}s::%d:Failed to create iorsub and subbedChannelsRef",  buf,  0x12u);
      }

      if (v170)
      {
        id v153 = WALogCategoryDefaultHandle();
        uint64_t v71 = (os_log_s *)objc_claimAutoreleasedReturnValue(v153);
        if (os_log_type_enabled(v71, OS_LOG_TYPE_ERROR))
        {
          int v154 = (const __CFString *)v170;
          __int16 v155 = (void *)objc_claimAutoreleasedReturnValue(-[__CFError localizedDescription](v170, "localizedDescription"));
          *(_DWORD *)buf = 136446978;
          __int128 v173 = "-[WAIOReporterMessagePopulator _iorPreparedForSampling:]";
          __int16 v174 = 1024;
          int v175 = 1726;
          __int16 v176 = 2112;
          __int128 v177 = v154;
          __int16 v178 = 2112;
          __int128 v179 = v155;
          double v156 = "%{public}s::%d:Error returned from IOReportCreateSubscription(): %@ - localized description: %@";
LABEL_125:
          _os_log_impl((void *)&_mh_execute_header, v71, OS_LOG_TYPE_ERROR, v156, buf, 0x26u);
        }

- (void)determineChannelsPerIORPopulatable
{
  id v3 = WALogCategoryDefaultHandle();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  id v5 = (char *)os_signpost_id_generate(v4);

  id v6 = WALogCategoryDefaultHandle();
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  id v8 = v7;
  if ((unint64_t)(v5 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v8,  OS_SIGNPOST_INTERVAL_BEGIN,  (os_signpost_id_t)v5,  "IOR determineChannelsPerIORPopulatable",  (const char *)&unk_1000B76E7,  buf,  2u);
  }

  id v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[WAIOReporterMessagePopulator queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10001E9D8;
  block[3] = &unk_1000CCD58;
  objc_copyWeak(v11, &location);
  block[4] = self;
  v11[1] = v5;
  dispatch_sync(v9, block);

  objc_destroyWeak(v11);
  objc_destroyWeak(&location);
}

- (void)determineChannelsPerIORPopulatableWithinPopulatorBlock
{
  if (!self->_hasAttemptedUnpersisting) {
    -[WAIOReporterMessagePopulator unpersistIORObjects](self, "unpersistIORObjects");
  }
  +[WAUtil incrementValueForKey:inMutableDict:onQueue:]( &OBJC_CLASS___WAUtil,  "incrementValueForKey:inMutableDict:onQueue:",  @"External: Determine Channels Within Blocks Calls",  self->_cachedUsage,  self->_queue);
  -[WAIOReporterMessagePopulator _findChannelsAndBuildChannelCaches:](self, "_findChannelsAndBuildChannelCaches:", 1LL);
}

- (BOOL)doesMessageNeedPrepopulation:(id)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue([(id)qword_1000ECEE8 objectForKeyedSubscript:a3]);
  BOOL v4 = v3 != 0LL;

  return v4;
}

- (void)prepopulateMessageWithinPopulatorBlock:(id)a3 forProcess:(id)a4 groupType:(int64_t)a5 andReply:(id)a6
{
  id v12 = a3;
  id v10 = a4;
  id v11 = a6;
  if (!self->_hasAttemptedUnpersisting) {
    -[WAIOReporterMessagePopulator _unpersistIORObjects](self, "_unpersistIORObjects");
  }
  -[WAIOReporterMessagePopulator _prepopulateMessage:forProcess:groupType:andReply:isResubscribe:]( self,  "_prepopulateMessage:forProcess:groupType:andReply:isResubscribe:",  v12,  v10,  a5,  v11,  0LL);
}

- (void)prepopulateMessage:(id)a3 forProcess:(id)a4 groupType:(int64_t)a5 andReply:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  objc_initWeak(&location, self);
  id v13 = WALogCategoryDefaultHandle();
  int v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
  __int16 v15 = (char *)os_signpost_id_generate(v14);

  id v16 = WALogCategoryDefaultHandle();
  id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
  id v18 = v17;
  if ((unint64_t)(v15 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
  {
    id v19 = (void *)objc_claimAutoreleasedReturnValue([v10 originalClassName]);
    *(_DWORD *)buf = 138543362;
    unsigned __int8 v31 = v19;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v18,  OS_SIGNPOST_INTERVAL_BEGIN,  (os_signpost_id_t)v15,  "IOR prepopulateMessage",  " message=%{public, signpost.description:attribute}@ ",  buf,  0xCu);
  }

  unint64_t v20 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[WAIOReporterMessagePopulator queue](self, "queue"));
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472LL;
  v24[2] = sub_10001EDD8;
  v24[3] = &unk_1000CCDA8;
  objc_copyWeak(v28, &location);
  v24[4] = self;
  id v25 = v10;
  id v26 = v11;
  id v27 = v12;
  v28[1] = (id)a5;
  v28[2] = v15;
  id v21 = v12;
  id v22 = v11;
  id v23 = v10;
  dispatch_sync(v20, v24);

  objc_destroyWeak(v28);
  objc_destroyWeak(&location);
}

- (void)_prepopulateMessage:(id)a3 forProcess:(id)a4 groupType:(int64_t)a5 andReply:(id)a6 isResubscribe:(BOOL)a7
{
  id v12 = a3;
  id v153 = a4;
  id v154 = a6;
  id v13 = v12;
  unsigned __int8 v168 = 0LL;
  __int16 v155 = (void *)objc_claimAutoreleasedReturnValue(-[WAIOReporterMessagePopulator messageDelegate](self, "messageDelegate"));
  id v14 = WALogCategoryDefaultHandle();
  __int16 v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
  if (os_signpost_enabled(v15))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v15,  OS_SIGNPOST_INTERVAL_BEGIN,  0xEEEEB0B5B2B2EEEELL,  "IOR PrepopulateIOReporterChannels",  (const char *)&unk_1000B76E7,  buf,  2u);
  }

  +[WAUtil incrementValueForKey:inMutableDict:onQueue:]( &OBJC_CLASS___WAUtil,  "incrementValueForKey:inMutableDict:onQueue:",  @"Populate IOReporter Calls",  self->_cachedUsage,  self->_queue);
  int64_t v151 = a5;
  BOOL v152 = a7;
  if (!v13)
  {
    id v130 = WALogCategoryDefaultHandle();
    __int16 v131 = (os_log_s *)objc_claimAutoreleasedReturnValue(v130);
    if (!os_log_type_enabled(v131, OS_LOG_TYPE_ERROR)) {
      goto LABEL_111;
    }
    *(_DWORD *)buf = 136446466;
    CFErrorRef v170 = "-[WAIOReporterMessagePopulator _prepopulateMessage:forProcess:groupType:andReply:isResubscribe:]";
    __int16 v171 = 1024;
    int v172 = 1936;
    int v132 = "%{public}s::%d:ERROR messageToPopulate == nil";
LABEL_107:
    _os_log_impl((void *)&_mh_execute_header, v131, OS_LOG_TYPE_ERROR, v132, buf, 0x12u);
    goto LABEL_111;
  }

  id v16 = (void *)qword_1000ECEE8;
  id v17 = (void *)objc_claimAutoreleasedReturnValue([v13 originalClassName]);
  id v18 = (void *)objc_claimAutoreleasedReturnValue([v16 objectForKeyedSubscript:v17]);

  if (!v18)
  {
    id v133 = WALogCategoryDefaultHandle();
    __int16 v131 = (os_log_s *)objc_claimAutoreleasedReturnValue(v133);
    if (os_log_type_enabled(v131, OS_LOG_TYPE_ERROR))
    {
      v134 = (__CFString *)objc_claimAutoreleasedReturnValue([v13 originalClassName]);
      unint64_t v135 = (void *)objc_claimAutoreleasedReturnValue([v13 key]);
      *(_DWORD *)buf = 136446978;
      CFErrorRef v170 = "-[WAIOReporterMessagePopulator _prepopulateMessage:forProcess:groupType:andReply:isResubscribe:]";
      __int16 v171 = 1024;
      int v172 = 1938;
      __int16 v173 = 2112;
      __int16 v174 = v134;
      __int16 v175 = 2112;
      __int16 v176 = v135;
      _os_log_impl( (void *)&_mh_execute_header,  v131,  OS_LOG_TYPE_ERROR,  "%{public}s::%d:WAMessageAWD with original classname: %@ and key: %@ doesn't appear to be setup to be prepopulate d. Sending it back as received.",  buf,  0x26u);

LABEL_110:
    }

+ (id)getIORPopAvailabeIOReportersTempFile
{
  CFMutableDictionaryRef v2 = (void *)objc_claimAutoreleasedReturnValue(+[WAUtil wifianalyticsTmpDirectory](&OBJC_CLASS___WAUtil, "wifianalyticsTmpDirectory"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 path]);
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@/ch.out", v3));

  return v4;
}

+ (id)getUnavailablePredTempFile
{
  CFMutableDictionaryRef v2 = (void *)objc_claimAutoreleasedReturnValue(+[WAUtil wifianalyticsTmpDirectory](&OBJC_CLASS___WAUtil, "wifianalyticsTmpDirectory"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 path]);
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@/unavail.out", v3));

  return v4;
}

+ (id)getUsageTempFile
{
  CFMutableDictionaryRef v2 = (void *)objc_claimAutoreleasedReturnValue(+[WAUtil wifianalyticsTmpDirectory](&OBJC_CLASS___WAUtil, "wifianalyticsTmpDirectory"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 path]);
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@/usage.out", v3));

  return v4;
}

- (void)_removeIORChannelsPersistenceFiles
{
  CFMutableDictionaryRef v2 = (void *)objc_claimAutoreleasedReturnValue( +[WAIOReporterMessagePopulator getIORPopAvailabeIOReportersTempFile]( &OBJC_CLASS___WAIOReporterMessagePopulator,  "getIORPopAvailabeIOReportersTempFile"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:isDirectory:](&OBJC_CLASS___NSURL, "fileURLWithPath:isDirectory:", v2, 0LL));

  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  id v29 = 0LL;
  unsigned __int8 v5 = [v4 removeItemAtURL:v3 error:&v29];
  id v6 = v29;

  if ((v5 & 1) != 0)
  {
    id v7 = WALogCategoryDefaultHandle();
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      unsigned __int8 v31 = "-[WAIOReporterMessagePopulator _removeIORChannelsPersistenceFiles]";
      __int16 v32 = 1024;
      int v33 = 2184;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_ERROR,  "%{public}s::%d:WAIOReporterMessagePopulator _removePersistenceFile file is not deletable",  buf,  0x12u);
    }
  }

  else
  {
    if (v6 && [v6 code] != (id)2)
    {
      id v14 = WALogCategoryDefaultHandle();
      id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
      if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        goto LABEL_11;
      }
      id v10 = (void *)objc_claimAutoreleasedReturnValue([v6 underlyingErrors]);
      *(_DWORD *)buf = 136446978;
      unsigned __int8 v31 = "-[WAIOReporterMessagePopulator _removeIORChannelsPersistenceFiles]";
      __int16 v32 = 1024;
      int v33 = 2179;
      __int16 v34 = 2112;
      id v35 = v3;
      __int16 v36 = 2112;
      BOOL v37 = v10;
      id v11 = "%{public}s::%d:WAIOReporterMessagePopulator _removePersistenceFile error removing file %@: %@";
      id v12 = v8;
      os_log_type_t v13 = OS_LOG_TYPE_ERROR;
    }

    else
    {
      id v9 = WALogCategoryDefaultHandle();
      id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
      if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_11;
      }
      id v10 = (void *)objc_claimAutoreleasedReturnValue([v6 description]);
      *(_DWORD *)buf = 136446978;
      unsigned __int8 v31 = "-[WAIOReporterMessagePopulator _removeIORChannelsPersistenceFiles]";
      __int16 v32 = 1024;
      int v33 = 2181;
      __int16 v34 = 2112;
      id v35 = v3;
      __int16 v36 = 2112;
      BOOL v37 = v10;
      id v11 = "%{public}s::%d:WAIOReporterMessagePopulator _removePersistenceFile successful or does not exist %@: %@";
      id v12 = v8;
      os_log_type_t v13 = OS_LOG_TYPE_DEBUG;
    }

    _os_log_impl((void *)&_mh_execute_header, v12, v13, v11, buf, 0x26u);
  }

- (void)_clearIOReporterCache
{
  id v3 = WALogCategoryDefaultHandle();
  BOOL v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v12 = 136446466;
    os_log_type_t v13 = "-[WAIOReporterMessagePopulator _clearIOReporterCache]";
    __int16 v14 = 1024;
    int v15 = 2202;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_ERROR,  "%{public}s::%d:Removing IOReporter Cache",  (uint8_t *)&v12,  0x12u);
  }

  id v5 = WALogCategoryDefaultHandle();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_signpost_enabled(v6))
  {
    LOWORD(v12) = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v6,  OS_SIGNPOST_INTERVAL_BEGIN,  0xEEEEB0B5B2B2EEEELL,  "IOR clearIOReporterCache",  (const char *)&unk_1000B76E7,  (uint8_t *)&v12,  2u);
  }

  +[WAUtil incrementValueForKey:inMutableDict:onQueue:]( &OBJC_CLASS___WAUtil,  "incrementValueForKey:inMutableDict:onQueue:",  @"clearIOReporterCaches Calls",  self->_cachedUsage,  self->_queue);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[WAIOReporterMessagePopulator cachedIOPopAvailableChannels](self, "cachedIOPopAvailableChannels"));
  [v7 removeAllObjects];

  id v8 = (void *)objc_claimAutoreleasedReturnValue( -[WAIOReporterMessagePopulator cachedChannelsCountPerIORPopulatable]( self,  "cachedChannelsCountPerIORPopulatable"));
  [v8 removeAllObjects];

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[WAIOReporterMessagePopulator cachedPredicatesNotYetFound](self, "cachedPredicatesNotYetFound"));
  [v9 removeAllObjects];

  id v10 = WALogCategoryDefaultHandle();
  id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_signpost_enabled(v11))
  {
    LOWORD(v12) = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v11,  OS_SIGNPOST_INTERVAL_END,  0xEEEEB0B5B2B2EEEELL,  "IOR clearIOReporterCache",  (const char *)&unk_1000B76E7,  (uint8_t *)&v12,  2u);
  }
}

- (void)injectErrorOnNextCreateOrUpdateSample
{
  id v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[WAIOReporterMessagePopulator queue](self, "queue"));
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_100021364;
  v4[3] = &unk_1000CCE18;
  objc_copyWeak(&v5, &location);
  dispatch_sync(v3, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = WALogCategoryDefaultHandle();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_signpost_enabled(v6))
  {
    LOWORD(v12) = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v6,  OS_SIGNPOST_INTERVAL_BEGIN,  0xEEEEB0B5B2B2EEEELL,  "IOR encodeWithCoder",  (const char *)&unk_1000B76E7,  (uint8_t *)&v12,  2u);
  }

  [v4 encodeObject:self->_cachedChannelsCountPerIORPopulatable forKey:@"_cachedChannelsCountPerIORPopulatable"];
  id v7 = WALogCategoryDefaultHandle();
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    cachedChannelsCountPerIORPopulatable = self->_cachedChannelsCountPerIORPopulatable;
    int v12 = 136446722;
    os_log_type_t v13 = "-[WAIOReporterMessagePopulator encodeWithCoder:]";
    __int16 v14 = 1024;
    int v15 = 2234;
    __int16 v16 = 2112;
    id v17 = cachedChannelsCountPerIORPopulatable;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "%{public}s::%d:encoded _cachedChannelsCountPerIORPopulatable %@",  (uint8_t *)&v12,  0x1Cu);
  }

  id v10 = WALogCategoryDefaultHandle();
  id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_signpost_enabled(v11))
  {
    LOWORD(v12) = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v11,  OS_SIGNPOST_INTERVAL_END,  0xEEEEB0B5B2B2EEEELL,  "IOR encodeWithCoder",  (const char *)&unk_1000B76E7,  (uint8_t *)&v12,  2u);
  }
}

- (WAIOReporterMessagePopulator)initWithCoder:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)&OBJC_CLASS___WAIOReporterMessagePopulator;
  id v5 = -[WAIOReporterMessagePopulator init](&v20, "init");
  if (v5)
  {
    if (qword_1000ECF28 != -1) {
      dispatch_once(&qword_1000ECF28, &stru_1000CCCC0);
    }
    if (qword_1000ECF10 != -1) {
      dispatch_once(&qword_1000ECF10, &stru_1000CCC60);
    }
    if (qword_1000ECF18 != -1) {
      dispatch_once(&qword_1000ECF18, &stru_1000CCC80);
    }
    if (qword_1000ECF20 != -1) {
      dispatch_once(&qword_1000ECF20, &stru_1000CCCA0);
    }
    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"dunno"));
    -[WAIOReporterMessagePopulator setInfraInterfaceName:](v5, "setInfraInterfaceName:", v6);

    *(_WORD *)&v5->_ioReportersCacheNeedsUpdating = 0;
    v5->_persistFileExistedAtPIDLoad = 0;
    dispatch_queue_attr_t v7 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    id v8 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v7);
    dispatch_queue_t v9 = dispatch_queue_create("com.apple.wifi.analytics.IOReporterQ", v8);
    -[WAIOReporterMessagePopulator setQueue:](v5, "setQueue:", v9);

    uint64_t v10 = objc_opt_class(&OBJC_CLASS___NSDictionary);
    id v11 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v10,  objc_opt_class(&OBJC_CLASS___NSNumber),  0LL);
    int v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    uint64_t v13 = objc_claimAutoreleasedReturnValue([v4 decodeObjectOfClasses:v12 forKey:@"_cachedChannelsCountPerIORPopulatable"]);
    cachedChannelsCountPerIORPopulatable = v5->_cachedChannelsCountPerIORPopulatable;
    v5->_cachedChannelsCountPerIORPopulatable = (NSMutableDictionary *)v13;

    id v15 = WALogCategoryDefaultHandle();
    __int16 v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      id v17 = v5->_cachedChannelsCountPerIORPopulatable;
      *(_DWORD *)buf = 136446722;
      id v22 = "-[WAIOReporterMessagePopulator initWithCoder:]";
      __int16 v23 = 1024;
      int v24 = 2265;
      __int16 v25 = 2112;
      os_log_type_t v26 = v17;
      _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEBUG,  "%{public}s::%d:initWithCoder _cachedChannelsCountPerIORPopulatable %@",  buf,  0x1Cu);
    }

    drvName = v5->_drvName;
    v5->_drvName = 0LL;
  }

  return v5;
}

- (void)unpersistIORObjects
{
  id v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[WAIOReporterMessagePopulator queue](self, "queue"));
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10002186C;
  v4[3] = &unk_1000CCE18;
  objc_copyWeak(&v5, &location);
  dispatch_sync(v3, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)_unpersistIORObjects
{
  id v3 = WALogCategoryDefaultHandle();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v4,  OS_SIGNPOST_INTERVAL_BEGIN,  0xEEEEB0B5B2B2EEEELL,  "IOR Unpersist",  (const char *)&unk_1000B76E7,  buf,  2u);
  }

  -[WAIOReporterMessagePopulator setCachedIOPopAvailableChannels:](self, "setCachedIOPopAvailableChannels:", 0LL);
  -[WAIOReporterMessagePopulator setCachedPredicatesNotYetFound:](self, "setCachedPredicatesNotYetFound:", 0LL);
  -[WAIOReporterMessagePopulator setCachedUsage:](self, "setCachedUsage:", 0LL);
  id v5 = objc_autoreleasePoolPush();
  id v6 = &AnalyticsSendEventLazy_ptr;
  dispatch_queue_attr_t v7 = &OBJC_IVAR___WAEngine__tmpFilesHaveAttemptedProcessingInDataStreamPath;
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[WAIOReporterMessagePopulator getIORPopAvailabeIOReportersTempFile]( &OBJC_CLASS___WAIOReporterMessagePopulator,  "getIORPopAvailabeIOReportersTempFile"));
  id v115 = 0LL;
  dispatch_queue_t v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSData dataWithContentsOfFile:options:error:]( &OBJC_CLASS___NSData,  "dataWithContentsOfFile:options:error:",  v8,  8LL,  &v115));
  id v10 = v115;

  id v11 = WALogCategoryDefaultHandle();
  int v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
  if (!v9)
  {
    if (!v13) {
      goto LABEL_22;
    }
    *(_DWORD *)buf = 136446466;
    id v117 = "-[WAIOReporterMessagePopulator _unpersistIORObjects]";
    __int16 v118 = 1024;
    int v119 = 2332;
    __int16 v16 = "%{public}s::%d:unpersist cachedIOPopAvailableChannels file not available";
    id v17 = v12;
    os_log_type_t v18 = OS_LOG_TYPE_DEFAULT;
    goto LABEL_11;
  }

  if (v13)
  {
    id v14 = [v9 length];
    *(_DWORD *)buf = 136446722;
    id v117 = "-[WAIOReporterMessagePopulator _unpersistIORObjects]";
    __int16 v118 = 1024;
    int v119 = 2314;
    __int16 v120 = 2048;
    id v121 = v14;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "%{public}s::%d:from file: cachedIOPopAvailableChannelsData NSData sizeof is %lu",  buf,  0x1Cu);
  }

  if (v10)
  {
    id v15 = WALogCategoryDefaultHandle();
    int v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      goto LABEL_22;
    }
    *(_DWORD *)buf = 136446466;
    id v117 = "-[WAIOReporterMessagePopulator _unpersistIORObjects]";
    __int16 v118 = 1024;
    int v119 = 2329;
    __int16 v16 = "%{public}s::%d:Failed to unpersist cachedIOPopAvailableChannels";
    id v17 = v12;
    os_log_type_t v18 = OS_LOG_TYPE_ERROR;
LABEL_11:
    _os_log_impl((void *)&_mh_execute_header, v17, v18, v16, buf, 0x12u);
    goto LABEL_22;
  }

  BOOL v107 = v5;
  uint64_t v19 = objc_opt_class(&OBJC_CLASS___NSDictionary);
  uint64_t v20 = objc_opt_class(&OBJC_CLASS___NSMutableDictionary);
  uint64_t v21 = objc_opt_class(&OBJC_CLASS___NSArray);
  uint64_t v22 = objc_opt_class(&OBJC_CLASS___NSMutableArray);
  uint64_t v23 = objc_opt_class(&OBJC_CLASS___NSData);
  uint64_t v24 = objc_opt_class(&OBJC_CLASS___NSMutableData);
  uint64_t v25 = objc_opt_class(&OBJC_CLASS___NSString);
  os_log_type_t v26 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v19,  v20,  v21,  v22,  v23,  v24,  v25,  objc_opt_class(&OBJC_CLASS___NSNumber),  0LL);
  id v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
  id v114 = 0LL;
  int v12 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSKeyedUnarchiver unarchivedObjectOfClasses:fromData:error:]( &OBJC_CLASS___NSKeyedUnarchiver,  "unarchivedObjectOfClasses:fromData:error:",  v27,  v9,  &v114));
  id v28 = v114;

  id v29 = WALogCategoryDefaultHandle();
  id v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
  unsigned __int8 v31 = v30;
  if (v28 || !v12)
  {
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      id v117 = "-[WAIOReporterMessagePopulator _unpersistIORObjects]";
      __int16 v118 = 1024;
      int v119 = 2320;
      __int16 v120 = 2112;
      id v121 = v28;
      _os_log_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_ERROR,  "%{public}s::%d:Failed to unarchive cachedIOPopAvailableChannels: %@",  buf,  0x1Cu);
    }

    id v5 = v107;
    id v6 = &AnalyticsSendEventLazy_ptr;
    dispatch_queue_attr_t v7 = &OBJC_IVAR___WAEngine__tmpFilesHaveAttemptedProcessingInDataStreamPath;
  }

  else
  {
    dispatch_queue_attr_t v7 = &OBJC_IVAR___WAEngine__tmpFilesHaveAttemptedProcessingInDataStreamPath;
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v32 = (void *)objc_opt_class(v12);
      *(_DWORD *)buf = 136446722;
      id v117 = "-[WAIOReporterMessagePopulator _unpersistIORObjects]";
      __int16 v118 = 1024;
      int v119 = 2323;
      __int16 v120 = 2112;
      id v121 = v32;
      id v33 = v32;
      _os_log_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_DEFAULT,  "%{public}s::%d:unpersist rootChannelDictionary class is %@",  buf,  0x1Cu);
    }

    -[WAIOReporterMessagePopulator setCachedIOPopAvailableChannels:](self, "setCachedIOPopAvailableChannels:", v12);
    id v34 = WALogCategoryDefaultHandle();
    id v35 = (os_log_s *)objc_claimAutoreleasedReturnValue(v34);
    id v6 = &AnalyticsSendEventLazy_ptr;
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446466;
      id v117 = "-[WAIOReporterMessagePopulator _unpersistIORObjects]";
      __int16 v118 = 1024;
      int v119 = 2326;
      _os_log_impl( (void *)&_mh_execute_header,  v35,  OS_LOG_TYPE_DEFAULT,  "%{public}s::%d:unpersist cachedIOPopAvailableChannels success",  buf,  0x12u);
    }

    id v5 = v107;
  }

- (void)persistIORObjects:(unsigned __int8)a3
{
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[WAIOReporterMessagePopulator queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100022848;
  block[3] = &unk_1000CCE40;
  objc_copyWeak(&v7, &location);
  unsigned __int8 v8 = a3;
  dispatch_sync(v5, block);

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

- (void)_persistIORObjects:(unsigned __int8)a3
{
  int v3 = a3;
  id v5 = WALogCategoryDefaultHandle();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_signpost_enabled(v6))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v6,  OS_SIGNPOST_INTERVAL_BEGIN,  0xEEEEB0B5B2B2EEEELL,  "IOR Persist",  (const char *)&unk_1000B76E7,  buf,  2u);
  }

  -[WAIOReporterMessagePopulator _cancelDelayedInvocationForPersist](self, "_cancelDelayedInvocationForPersist");
  if (v3 == 1)
  {
    +[WAUtil incrementValueForKey:inMutableDict:onQueue:]( &OBJC_CLASS___WAUtil,  "incrementValueForKey:inMutableDict:onQueue:",  @"Terminations - Graceful",  self->_cachedUsage,  self->_queue);
    -[NSMutableDictionary removeObjectForKey:]( self->_cachedUsage,  "removeObjectForKey:",  @"Last Graceful Termination Date");
    cachedUsage = self->_cachedUsage;
    unsigned __int8 v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    -[NSMutableDictionary setObject:forKey:]( cachedUsage,  "setObject:forKey:",  v8,  @"Last Graceful Termination Date");
  }

  +[WAUtil incrementValueForKey:inMutableDict:onQueue:]( &OBJC_CLASS___WAUtil,  "incrementValueForKey:inMutableDict:onQueue:",  @"Persist Calls",  self->_cachedUsage,  self->_queue);
  -[NSMutableDictionary removeObjectForKey:](self->_cachedUsage, "removeObjectForKey:", @"Last Persisted Date");
  dispatch_queue_t v9 = self->_cachedUsage;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  -[NSMutableDictionary setObject:forKey:](v9, "setObject:forKey:", v10, @"Last Persisted Date");

  -[NSMutableDictionary removeObjectForKey:](self->_cachedUsage, "removeObjectForKey:", @"Last Persisted PID");
  id v11 = self->_cachedUsage;
  uint64_t v12 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLong:", self->_pid));
  -[NSMutableDictionary setObject:forKey:](v11, "setObject:forKey:", v12, @"Last Persisted PID");

  -[WAIOReporterMessagePopulator _calculateEstimatedUptime](self, "_calculateEstimatedUptime");
  BOOL v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  id v14 = (void *)objc_claimAutoreleasedReturnValue( +[WAIOReporterMessagePopulator getUsageTempFile]( &OBJC_CLASS___WAIOReporterMessagePopulator,  "getUsageTempFile"));
  LOBYTE(v12) = [v13 fileExistsAtPath:v14];

  if ((v12 & 1) == 0)
  {
    id v15 = WALogCategoryDefaultHandle();
    __int16 v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      id v17 = (void *)objc_claimAutoreleasedReturnValue( +[WAIOReporterMessagePopulator getUsageTempFile]( &OBJC_CLASS___WAIOReporterMessagePopulator,  "getUsageTempFile"));
      *(_DWORD *)buf = 136446722;
      uint64_t v81 = "-[WAIOReporterMessagePopulator _persistIORObjects:]";
      __int16 v82 = 1024;
      int v83 = 2460;
      __int16 v84 = 2112;
      id v85 = v17;
      _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "%{public}s::%d:Persistence file doesnt yet exist %@",  buf,  0x1Cu);
    }

    -[NSMutableDictionary removeObjectForKey:]( self->_cachedUsage,  "removeObjectForKey:",  @"Persist file creation Date");
    os_log_type_t v18 = self->_cachedUsage;
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    -[NSMutableDictionary setObject:forKey:](v18, "setObject:forKey:", v19, @"Persist file creation Date");
  }

  uint64_t v20 = objc_autoreleasePoolPush();
  id v21 = WALogCategoryDefaultHandle();
  uint64_t v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue( +[WAIOReporterMessagePopulator getUsageTempFile]( &OBJC_CLASS___WAIOReporterMessagePopulator,  "getUsageTempFile"));
    uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue(-[WAIOReporterMessagePopulator cachedUsage](self, "cachedUsage"));
    uint64_t v25 = (void *)objc_opt_class(v24);
    *(_DWORD *)buf = 136446978;
    uint64_t v81 = "-[WAIOReporterMessagePopulator _persistIORObjects:]";
    __int16 v82 = 1024;
    int v83 = 2468;
    __int16 v84 = 2112;
    id v85 = v23;
    __int16 v86 = 2112;
    id v87 = v25;
    id v26 = v25;
    _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "%{public}s::%d:Updating file %@ with cachedUsage of class %@",  buf,  0x26u);
  }

  id v27 = (void *)objc_claimAutoreleasedReturnValue(-[WAIOReporterMessagePopulator cachedUsage](self, "cachedUsage"));
  id v79 = 0LL;
  id v28 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  v27,  1LL,  &v79));
  id v29 = v79;

  id v30 = WALogCategoryDefaultHandle();
  unsigned __int8 v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
  {
    id v32 = [v28 length];
    *(_DWORD *)buf = 136446722;
    uint64_t v81 = "-[WAIOReporterMessagePopulator _persistIORObjects:]";
    __int16 v82 = 1024;
    int v83 = 2471;
    __int16 v84 = 2048;
    id v85 = v32;
    _os_log_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_DEFAULT,  "%{public}s::%d:cachedUsage sizeof is %lu",  buf,  0x1Cu);
  }

  if (v29)
  {
    id v65 = WALogCategoryDefaultHandle();
    id v66 = (os_log_s *)objc_claimAutoreleasedReturnValue(v65);
    if (!os_log_type_enabled(v66, OS_LOG_TYPE_ERROR)) {
      goto LABEL_53;
    }
    *(_DWORD *)buf = 136446722;
    uint64_t v81 = "-[WAIOReporterMessagePopulator _persistIORObjects:]";
    __int16 v82 = 1024;
    int v83 = 2472;
    __int16 v84 = 2112;
    id v85 = v29;
    id v67 = "%{public}s::%d:Failed to archive usages: %@";
LABEL_49:
    _os_log_impl((void *)&_mh_execute_header, v66, OS_LOG_TYPE_ERROR, v67, buf, 0x1Cu);
    goto LABEL_53;
  }

  id v33 = (void *)objc_claimAutoreleasedReturnValue( +[WAIOReporterMessagePopulator getUsageTempFile]( &OBJC_CLASS___WAIOReporterMessagePopulator,  "getUsageTempFile"));
  id v78 = 0LL;
  [v28 writeToFile:v33 options:1 error:&v78];
  id v29 = v78;

  if (v29)
  {
    id v68 = WALogCategoryDefaultHandle();
    id v66 = (os_log_s *)objc_claimAutoreleasedReturnValue(v68);
    if (!os_log_type_enabled(v66, OS_LOG_TYPE_ERROR)) {
      goto LABEL_53;
    }
    id v69 = (void *)objc_claimAutoreleasedReturnValue( +[WAIOReporterMessagePopulator getUsageTempFile]( &OBJC_CLASS___WAIOReporterMessagePopulator,  "getUsageTempFile"));
    *(_DWORD *)buf = 136446978;
    uint64_t v81 = "-[WAIOReporterMessagePopulator _persistIORObjects:]";
    __int16 v82 = 1024;
    int v83 = 2474;
    __int16 v84 = 2112;
    id v85 = v69;
    __int16 v86 = 2112;
    id v87 = v29;
LABEL_52:
    _os_log_impl( (void *)&_mh_execute_header,  v66,  OS_LOG_TYPE_ERROR,  "%{public}s::%d:Unable to write to file %@: %@",  buf,  0x26u);

    goto LABEL_53;
  }

  BOOL ioReportersCacheNeedsUpdating = self->_ioReportersCacheNeedsUpdating;
  id v35 = WALogCategoryDefaultHandle();
  __int16 v36 = (os_log_s *)objc_claimAutoreleasedReturnValue(v35);
  BOOL v37 = os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT);
  if (!ioReportersCacheNeedsUpdating)
  {
    if (v37)
    {
      id v63 = (void *)objc_claimAutoreleasedReturnValue( +[WAIOReporterMessagePopulator getIORPopAvailabeIOReportersTempFile]( &OBJC_CLASS___WAIOReporterMessagePopulator,  "getIORPopAvailabeIOReportersTempFile"));
      *(_DWORD *)buf = 136446722;
      uint64_t v81 = "-[WAIOReporterMessagePopulator _persistIORObjects:]";
      __int16 v82 = 1024;
      int v83 = 2506;
      __int16 v84 = 2112;
      id v85 = v63;
      _os_log_impl( (void *)&_mh_execute_header,  v36,  OS_LOG_TYPE_DEFAULT,  "%{public}s::%d:Didn't find new channels, not updating file %@",  buf,  0x1Cu);
    }

    id v64 = WALogCategoryDefaultHandle();
    unsigned int v61 = (os_log_s *)objc_claimAutoreleasedReturnValue(v64);
    if (!os_signpost_enabled(v61)) {
      goto LABEL_37;
    }
    *(_WORD *)buf = 0;
    id v62 = "Skipped";
    goto LABEL_36;
  }

  if (v37)
  {
    id v38 = (void *)objc_claimAutoreleasedReturnValue( +[WAIOReporterMessagePopulator getIORPopAvailabeIOReportersTempFile]( &OBJC_CLASS___WAIOReporterMessagePopulator,  "getIORPopAvailabeIOReportersTempFile"));
    id v39 = (void *)objc_claimAutoreleasedReturnValue(-[WAIOReporterMessagePopulator cachedIOPopAvailableChannels](self, "cachedIOPopAvailableChannels"));
    id v40 = (void *)objc_opt_class(v39);
    *(_DWORD *)buf = 136446978;
    uint64_t v81 = "-[WAIOReporterMessagePopulator _persistIORObjects:]";
    __int16 v82 = 1024;
    int v83 = 2481;
    __int16 v84 = 2112;
    id v85 = v38;
    __int16 v86 = 2112;
    id v87 = v40;
    id v41 = v40;
    _os_log_impl( (void *)&_mh_execute_header,  v36,  OS_LOG_TYPE_DEFAULT,  "%{public}s::%d:Updating file %@ with cachedIOPopAvailableChannels of class %@",  buf,  0x26u);
  }

  BOOL v42 = (void *)objc_claimAutoreleasedReturnValue(-[WAIOReporterMessagePopulator cachedIOPopAvailableChannels](self, "cachedIOPopAvailableChannels"));
  id v77 = 0LL;
  id v28 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  v42,  1LL,  &v77));
  id v29 = v77;

  id v43 = WALogCategoryDefaultHandle();
  id v44 = (os_log_s *)objc_claimAutoreleasedReturnValue(v43);
  if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
  {
    id v45 = [v28 length];
    *(_DWORD *)buf = 136446722;
    uint64_t v81 = "-[WAIOReporterMessagePopulator _persistIORObjects:]";
    __int16 v82 = 1024;
    int v83 = 2484;
    __int16 v84 = 2048;
    id v85 = v45;
    _os_log_impl( (void *)&_mh_execute_header,  v44,  OS_LOG_TYPE_DEFAULT,  "%{public}s::%d:cachedIOPopAvailableChannels sizeof is %lu",  buf,  0x1Cu);
  }

  if (v29)
  {
    id v70 = WALogCategoryDefaultHandle();
    id v66 = (os_log_s *)objc_claimAutoreleasedReturnValue(v70);
    if (!os_log_type_enabled(v66, OS_LOG_TYPE_ERROR)) {
      goto LABEL_53;
    }
    *(_DWORD *)buf = 136446722;
    uint64_t v81 = "-[WAIOReporterMessagePopulator _persistIORObjects:]";
    __int16 v82 = 1024;
    int v83 = 2485;
    __int16 v84 = 2112;
    id v85 = v29;
    id v67 = "%{public}s::%d:Failed to archive desired channels: %@";
    goto LABEL_49;
  }

  id v46 = (void *)objc_claimAutoreleasedReturnValue( +[WAIOReporterMessagePopulator getIORPopAvailabeIOReportersTempFile]( &OBJC_CLASS___WAIOReporterMessagePopulator,  "getIORPopAvailabeIOReportersTempFile"));
  id v76 = 0LL;
  [v28 writeToFile:v46 options:1 error:&v76];
  id v29 = v76;

  if (v29)
  {
    id v71 = WALogCategoryDefaultHandle();
    id v66 = (os_log_s *)objc_claimAutoreleasedReturnValue(v71);
    if (!os_log_type_enabled(v66, OS_LOG_TYPE_ERROR)) {
      goto LABEL_53;
    }
    id v69 = (void *)objc_claimAutoreleasedReturnValue( +[WAIOReporterMessagePopulator getIORPopAvailabeIOReportersTempFile]( &OBJC_CLASS___WAIOReporterMessagePopulator,  "getIORPopAvailabeIOReportersTempFile"));
    *(_DWORD *)buf = 136446978;
    uint64_t v81 = "-[WAIOReporterMessagePopulator _persistIORObjects:]";
    __int16 v82 = 1024;
    int v83 = 2487;
    __int16 v84 = 2112;
    id v85 = v69;
    __int16 v86 = 2112;
    id v87 = v29;
    goto LABEL_52;
  }

  id v47 = WALogCategoryDefaultHandle();
  uint64_t v48 = (os_log_s *)objc_claimAutoreleasedReturnValue(v47);
  if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v49 = (void *)objc_claimAutoreleasedReturnValue( +[WAIOReporterMessagePopulator getUnavailablePredTempFile]( &OBJC_CLASS___WAIOReporterMessagePopulator,  "getUnavailablePredTempFile"));
    uint64_t v50 = (void *)objc_claimAutoreleasedReturnValue(-[WAIOReporterMessagePopulator cachedPredicatesNotYetFound](self, "cachedPredicatesNotYetFound"));
    uint64_t v51 = (void *)objc_opt_class(v50);
    *(_DWORD *)buf = 136446978;
    uint64_t v81 = "-[WAIOReporterMessagePopulator _persistIORObjects:]";
    __int16 v82 = 1024;
    int v83 = 2492;
    __int16 v84 = 2112;
    id v85 = v49;
    __int16 v86 = 2112;
    id v87 = v51;
    id v52 = v51;
    _os_log_impl( (void *)&_mh_execute_header,  v48,  OS_LOG_TYPE_DEFAULT,  "%{public}s::%d:Updating file %@ with cachedPredicatesNotYetFound of class %@",  buf,  0x26u);
  }

  uint64_t v53 = (void *)objc_claimAutoreleasedReturnValue(-[WAIOReporterMessagePopulator cachedPredicatesNotYetFound](self, "cachedPredicatesNotYetFound"));
  id v75 = 0LL;
  id v28 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  v53,  1LL,  &v75));
  id v29 = v75;

  id v54 = WALogCategoryDefaultHandle();
  double v55 = (os_log_s *)objc_claimAutoreleasedReturnValue(v54);
  if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
  {
    id v56 = [v28 length];
    *(_DWORD *)buf = 136446722;
    uint64_t v81 = "-[WAIOReporterMessagePopulator _persistIORObjects:]";
    __int16 v82 = 1024;
    int v83 = 2495;
    __int16 v84 = 2048;
    id v85 = v56;
    _os_log_impl( (void *)&_mh_execute_header,  v55,  OS_LOG_TYPE_DEFAULT,  "%{public}s::%d:cachedPredicatesNotYetFound sizeof is %lu",  buf,  0x1Cu);
  }

  if (v29)
  {
    id v72 = WALogCategoryDefaultHandle();
    id v66 = (os_log_s *)objc_claimAutoreleasedReturnValue(v72);
    if (!os_log_type_enabled(v66, OS_LOG_TYPE_ERROR)) {
      goto LABEL_53;
    }
    *(_DWORD *)buf = 136446722;
    uint64_t v81 = "-[WAIOReporterMessagePopulator _persistIORObjects:]";
    __int16 v82 = 1024;
    int v83 = 2496;
    __int16 v84 = 2112;
    id v85 = v29;
    id v67 = "%{public}s::%d:Failed to archive cachedPredicatesNotYetFound: %@";
    goto LABEL_49;
  }

  id v57 = (void *)objc_claimAutoreleasedReturnValue( +[WAIOReporterMessagePopulator getUnavailablePredTempFile]( &OBJC_CLASS___WAIOReporterMessagePopulator,  "getUnavailablePredTempFile"));
  id v74 = 0LL;
  [v28 writeToFile:v57 options:1 error:&v74];
  id v29 = v74;

  if (v29)
  {
    id v73 = WALogCategoryDefaultHandle();
    id v66 = (os_log_s *)objc_claimAutoreleasedReturnValue(v73);
    if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
    {
      id v69 = (void *)objc_claimAutoreleasedReturnValue( +[WAIOReporterMessagePopulator getUnavailablePredTempFile]( &OBJC_CLASS___WAIOReporterMessagePopulator,  "getUnavailablePredTempFile"));
      *(_DWORD *)buf = 136446978;
      uint64_t v81 = "-[WAIOReporterMessagePopulator _persistIORObjects:]";
      __int16 v82 = 1024;
      int v83 = 2498;
      __int16 v84 = 2112;
      id v85 = v69;
      __int16 v86 = 2112;
      id v87 = v29;
      goto LABEL_52;
    }

- (void)_cancelDelayedInvocationForPersist
{
  if (self->_persistTimerRunning)
  {
    persistTimer = self->_persistTimer;
    if (persistTimer)
    {
      if (!dispatch_source_testcancel((dispatch_source_t)persistTimer))
      {
        id v4 = WALogCategoryDefaultHandle();
        id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
        {
          int v9 = 136446466;
          id v10 = "-[WAIOReporterMessagePopulator _cancelDelayedInvocationForPersist]";
          __int16 v11 = 1024;
          int v12 = 2522;
          _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "%{public}s::%d:Timer exists and is valid, Suspending",  (uint8_t *)&v9,  0x12u);
        }

        dispatch_suspend((dispatch_object_t)self->_persistTimer);
        self->_BOOL persistTimerRunning = 0;
        id v6 = WALogCategoryDefaultHandle();
        id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          BOOL persistTimerRunning = self->_persistTimerRunning;
          int v9 = 136446722;
          id v10 = "-[WAIOReporterMessagePopulator _cancelDelayedInvocationForPersist]";
          __int16 v11 = 1024;
          int v12 = 2525;
          __int16 v13 = 1024;
          BOOL v14 = persistTimerRunning;
          _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "%{public}s::%d:setting _persistTimerRunning %d",  (uint8_t *)&v9,  0x18u);
        }
      }
    }
  }

- (void)_delayedInvocationForPersist
{
  BOOL persistTimerRunning = self->_persistTimerRunning;
  id v4 = WALogCategoryDefaultHandle();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (persistTimerRunning)
  {
    if (v6)
    {
      *(_DWORD *)buf = 136446466;
      uint64_t v49 = "-[WAIOReporterMessagePopulator _delayedInvocationForPersist]";
      __int16 v50 = 1024;
      int v51 = 2532;
      id v7 = "%{public}s::%d:Persist is already scheduled, ignoring additional request";
      unsigned __int8 v8 = v5;
      uint32_t v9 = 18;
LABEL_39:
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, v7, buf, v9);
      goto LABEL_40;
    }

    goto LABEL_40;
  }

  if (v6)
  {
    BOOL v10 = self->_persistTimerRunning;
    unint64_t v11 = -[RecommendationPreferences ior_persist_delay_seconds](self->_preferences, "ior_persist_delay_seconds");
    persistTimer = self->_persistTimer;
    BOOL v13 = persistTimer != 0LL;
    if (persistTimer) {
      BOOL v14 = dispatch_source_testcancel((dispatch_source_t)persistTimer) != 0;
    }
    else {
      BOOL v14 = 0;
    }
    *(_DWORD *)buf = 136447490;
    uint64_t v49 = "-[WAIOReporterMessagePopulator _delayedInvocationForPersist]";
    __int16 v50 = 1024;
    int v51 = 2536;
    __int16 v52 = 1024;
    *(_DWORD *)uint64_t v53 = v10;
    *(_WORD *)&v53[4] = 2048;
    *(void *)&v53[6] = v11;
    __int16 v54 = 1024;
    BOOL v55 = v13;
    __int16 v56 = 1024;
    BOOL v57 = v14;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "%{public}s::%d:_persistTimerRunning is %d ior_persist_delay_seconds is %lu _persistTimer exists %d testcancel is %d",  buf,  0x2Eu);
  }

  if (!self->_persistTimerRunning)
  {
    id v15 = WALogCategoryDefaultHandle();
    __int16 v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136446466;
      uint64_t v49 = "-[WAIOReporterMessagePopulator _delayedInvocationForPersist]";
      __int16 v50 = 1024;
      int v51 = 2539;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "%{public}s::%d:Setting timer", buf, 0x12u);
    }

    id v17 = self->_persistTimer;
    if (v17)
    {
      if (!dispatch_source_testcancel((dispatch_source_t)v17))
      {
LABEL_25:
        id v29 = WALogCategoryDefaultHandle();
        id v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
        {
          unint64_t v31 = -[RecommendationPreferences ior_persist_delay_seconds](self->_preferences, "ior_persist_delay_seconds");
          *(_DWORD *)buf = 136446722;
          uint64_t v49 = "-[WAIOReporterMessagePopulator _delayedInvocationForPersist]";
          __int16 v50 = 1024;
          int v51 = 2560;
          __int16 v52 = 2048;
          *(void *)uint64_t v53 = v31;
          _os_log_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_DEFAULT,  "%{public}s::%d:Starting dispatch_source_set_timer fire in %lu s",  buf,  0x1Cu);
        }

        id v32 = self->_persistTimer;
        dispatch_time_t v33 = dispatch_time( 0xFFFFFFFFFFFFFFFELL,  1000000000 * -[RecommendationPreferences ior_persist_delay_seconds](self->_preferences, "ior_persist_delay_seconds"));
        dispatch_source_set_timer((dispatch_source_t)v32, v33, 0xFFFFFFFFFFFFFFFFLL, 0x5F5E100uLL);
        id v34 = WALogCategoryDefaultHandle();
        id v35 = (os_log_s *)objc_claimAutoreleasedReturnValue(v34);
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136446466;
          uint64_t v49 = "-[WAIOReporterMessagePopulator _delayedInvocationForPersist]";
          __int16 v50 = 1024;
          int v51 = 2562;
          _os_log_impl( (void *)&_mh_execute_header,  v35,  OS_LOG_TYPE_DEFAULT,  "%{public}s::%d:Starting dispatch_source_set_timer Done",  buf,  0x12u);
        }

        id v36 = WALogCategoryDefaultHandle();
        BOOL v37 = (os_log_s *)objc_claimAutoreleasedReturnValue(v36);
        if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136446466;
          uint64_t v49 = "-[WAIOReporterMessagePopulator _delayedInvocationForPersist]";
          __int16 v50 = 1024;
          int v51 = 2564;
          _os_log_impl( (void *)&_mh_execute_header,  v37,  OS_LOG_TYPE_DEFAULT,  "%{public}s::%d:dispatch_resume _persistTimer",  buf,  0x12u);
        }

        dispatch_resume((dispatch_object_t)self->_persistTimer);
        self->_BOOL persistTimerRunning = 1;
        id v38 = WALogCategoryDefaultHandle();
        id v39 = (os_log_s *)objc_claimAutoreleasedReturnValue(v38);
        if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
        {
          BOOL v40 = self->_persistTimerRunning;
          *(_DWORD *)buf = 136446722;
          uint64_t v49 = "-[WAIOReporterMessagePopulator _delayedInvocationForPersist]";
          __int16 v50 = 1024;
          int v51 = 2568;
          __int16 v52 = 1024;
          *(_DWORD *)uint64_t v53 = v40;
          _os_log_impl( (void *)&_mh_execute_header,  v39,  OS_LOG_TYPE_DEFAULT,  "%{public}s::%d:setting _persistTimerRunning %d",  buf,  0x18u);
        }

        goto LABEL_34;
      }
    }

    else
    {
      id v18 = WALogCategoryDefaultHandle();
      uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136446466;
        uint64_t v49 = "-[WAIOReporterMessagePopulator _delayedInvocationForPersist]";
        __int16 v50 = 1024;
        int v51 = 2545;
        _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "%{public}s::%d:Creating _persistTimer",  buf,  0x12u);
      }

      uint64_t v20 = (OS_dispatch_source *)dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_timer,  0LL,  0LL,  (dispatch_queue_t)self->_queue);
      id v21 = self->_persistTimer;
      self->_persistTimer = v20;

      id v22 = WALogCategoryDefaultHandle();
      uint64_t v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136446466;
        uint64_t v49 = "-[WAIOReporterMessagePopulator _delayedInvocationForPersist]";
        __int16 v50 = 1024;
        int v51 = 2547;
        _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEBUG,  "%{public}s::%d:Creating _persistTimer Done",  buf,  0x12u);
      }

      if (!self->_persistTimer)
      {
        id v46 = WALogCategoryDefaultHandle();
        id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v46);
        if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_fault_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_FAULT,  "Failed to create _persistTimer",  buf,  2u);
        }

        goto LABEL_40;
      }
    }

    id v24 = WALogCategoryDefaultHandle();
    uint64_t v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446466;
      uint64_t v49 = "-[WAIOReporterMessagePopulator _delayedInvocationForPersist]";
      __int16 v50 = 1024;
      int v51 = 2551;
      _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "%{public}s::%d:Setting dispatch_source_set_event_handler",  buf,  0x12u);
    }

    id v26 = self->_persistTimer;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472LL;
    handler[2] = sub_100023D10;
    handler[3] = &unk_1000CCD80;
    handler[4] = self;
    dispatch_source_set_event_handler((dispatch_source_t)v26, handler);
    id v27 = WALogCategoryDefaultHandle();
    id v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136446466;
      uint64_t v49 = "-[WAIOReporterMessagePopulator _delayedInvocationForPersist]";
      __int16 v50 = 1024;
      int v51 = 2557;
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEBUG, "%{public}s::%d:Setting block Done", buf, 0x12u);
    }

    goto LABEL_25;
  }

- (void)_calculateEstimatedUptime
{
  int v3 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_cachedUsage,  "objectForKeyedSubscript:",  @"PID Unpersisted Date"));

  if (v3)
  {
    id v4 = WALogCategoryDefaultHandle();
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      BOOL v6 = (NSDate *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_cachedUsage,  "objectForKeyedSubscript:",  @"PID Unpersisted Date"));
      id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
      unsigned __int8 v8 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_cachedUsage,  "objectForKeyedSubscript:",  @"PID Unpersisted Date"));
      [v8 timeIntervalSinceNow];
      double v10 = v9;

      *(_DWORD *)id v27 = 136447234;
      double v11 = -v10;
      *(void *)&v27[4] = "-[WAIOReporterMessagePopulator _calculateEstimatedUptime]";
      if (v10 >= 0.0) {
        double v11 = v10;
      }
      *(_WORD *)&v27[12] = 1024;
      *(_DWORD *)&v27[14] = 2580;
      __int16 v28 = 2112;
      id v29 = v6;
      __int16 v30 = 2112;
      unint64_t v31 = v7;
      __int16 v32 = 2048;
      double v33 = v11;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEBUG,  "%{public}s::%d:_cachedUsage[kWAUnpersistedDateKey] %@ now %@ interval %f",  v27,  0x30u);
    }

    -[NSMutableDictionary removeObjectForKey:](self->_cachedUsage, "removeObjectForKey:", @"Estimated Uptime (s)");
    cachedUsage = self->_cachedUsage;
    BOOL v13 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( cachedUsage,  "objectForKeyedSubscript:",  @"PID Unpersisted Date"));
    [v13 timeIntervalSinceNow];
    double v15 = v14;

    double v16 = -v15;
    if (v15 >= 0.0) {
      double v16 = v15;
    }
    id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLong:",  (unint64_t)v16,  *(_OWORD *)v27));
    id v18 = cachedUsage;
LABEL_17:
    -[NSMutableDictionary setObject:forKey:](v18, "setObject:forKey:", v17, @"Estimated Uptime (s)");
    goto LABEL_18;
  }

  pidLaunchDate = self->_pidLaunchDate;
  id v20 = WALogCategoryDefaultHandle();
  id v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
  id v17 = v21;
  if (pidLaunchDate)
  {
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    {
      id v22 = self->_pidLaunchDate;
      uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
      -[NSDate timeIntervalSinceNow](self->_pidLaunchDate, "timeIntervalSinceNow");
      *(_DWORD *)id v27 = 136447234;
      *(void *)&v27[4] = "-[WAIOReporterMessagePopulator _calculateEstimatedUptime]";
      *(_WORD *)&v27[12] = 1024;
      if (v24 < 0.0) {
        double v24 = -v24;
      }
      *(_DWORD *)&v27[14] = 2585;
      __int16 v28 = 2112;
      id v29 = v22;
      __int16 v30 = 2112;
      unint64_t v31 = v23;
      __int16 v32 = 2048;
      double v33 = v24;
      _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEBUG,  "%{public}s::%d:_pidLaunchDate %@ now %@ interval %f",  v27,  0x30u);
    }

    -[NSMutableDictionary removeObjectForKey:](self->_cachedUsage, "removeObjectForKey:", @"Estimated Uptime (s)");
    uint64_t v25 = self->_cachedUsage;
    -[NSDate timeIntervalSinceNow](self->_pidLaunchDate, "timeIntervalSinceNow");
    if (v26 < 0.0) {
      double v26 = -v26;
    }
    id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLong:",  (unint64_t)v26,  *(void *)v27,  *(void *)&v27[8]));
    id v18 = v25;
    goto LABEL_17;
  }

  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)id v27 = 136446466;
    *(void *)&v27[4] = "-[WAIOReporterMessagePopulator _calculateEstimatedUptime]";
    *(_WORD *)&v27[12] = 1024;
    *(_DWORD *)&v27[14] = 2590;
    _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_ERROR,  "%{public}s::%d: calculating kWACumulativeUptimeKey unavailable",  v27,  0x12u);
  }

- (void)_handleUnpersistForUsageData
{
  CFMutableDictionaryRef v2 = self;
  int v3 = @"Work Bin: Last PID Work";
  -[NSMutableDictionary removeObjectForKey:]( self->_cachedUsage,  "removeObjectForKey:",  @"Work Bin: Last PID Work");
  id v90 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v2->_cachedUsage, "setObject:forKeyedSubscript:");
  id v4 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( v2->_cachedUsage,  "objectForKeyedSubscript:",  @"Work Bin: Previous PIDs Work"));

  if (!v4)
  {
    id v5 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v2->_cachedUsage,  "setObject:forKeyedSubscript:",  v5,  @"Work Bin: Previous PIDs Work");
  }

  __int128 v109 = 0u;
  __int128 v110 = 0u;
  __int128 v107 = 0u;
  __int128 v108 = 0u;
  id v6 = -[NSMutableDictionary copy](v2->_cachedUsage, "copy");
  id v7 = [v6 countByEnumeratingWithState:&v107 objects:v127 count:16];
  id v95 = v2;
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v108;
    do
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v108 != v9) {
          objc_enumerationMutation(v6);
        }
        double v11 = *(__CFString **)(*((void *)&v107 + 1) + 8LL * (void)i);
        if ((-[__CFString isEqualToString:]( v11,  "isEqualToString:",  @"Work Bin: Previous PIDs Work") & 1) != 0 || -[__CFString isEqualToString:](v11, "isEqualToString:", v3))
        {
          id v12 = WALogCategoryDefaultHandle();
          BOOL v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 136446978;
            id v112 = "-[WAIOReporterMessagePopulator _handleUnpersistForUsageData]";
            __int16 v113 = 1024;
            int v114 = 2616;
            __int16 v115 = 2112;
            id v116 = v3;
            __int16 v117 = 2112;
            __int16 v118 = v11;
            _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEBUG,  "%{public}s::%d:Skipping copying key to %@: %@",  buf,  0x26u);
          }
        }

        else
        {
          id v14 = v6;
          double v15 = v2;
          double v16 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v2->_cachedUsage, "objectForKey:", v11));
          id v17 = v3;
          id v18 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( v15->_cachedUsage,  "objectForKeyedSubscript:",  v3));
          [v18 setObject:v16 forKeyedSubscript:v11];

          -[NSMutableDictionary removeObjectForKey:](v15->_cachedUsage, "removeObjectForKey:", v11);
          id v19 = WALogCategoryDefaultHandle();
          BOOL v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
          {
            id v20 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( v15->_cachedUsage,  "objectForKeyedSubscript:",  v17));
            id v21 = (__CFString *)objc_claimAutoreleasedReturnValue([v20 objectForKeyedSubscript:v11]);
            *(_DWORD *)buf = 136446978;
            id v112 = "-[WAIOReporterMessagePopulator _handleUnpersistForUsageData]";
            __int16 v113 = 1024;
            int v114 = 2623;
            __int16 v115 = 2112;
            id v116 = v11;
            __int16 v117 = 2112;
            __int16 v118 = v21;
            _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEBUG,  "%{public}s::%d:_cachedUsage[kLastPIDBin] now contains key %@ with value %@",  buf,  0x26u);
          }

          int v3 = v17;
          id v6 = v14;
        }

        CFMutableDictionaryRef v2 = v95;
      }

      id v8 = [v6 countByEnumeratingWithState:&v107 objects:v127 count:16];
    }

    while (v8);
  }

  if (v2->_persistFileExistedAtPIDLoad)
  {
    id v22 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( v2->_cachedUsage,  "objectForKeyedSubscript:",  @"Work Bin: Last PID Work"));
    uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([v22 objectForKeyedSubscript:@"Terminations - Graceful"]);

    if (!v23)
    {
      double v24 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( v2->_cachedUsage,  "objectForKeyedSubscript:",  @"Work Bin: Last PID Work"));
      +[WAUtil incrementValueForKey:inMutableDict:onQueue:]( &OBJC_CLASS___WAUtil,  "incrementValueForKey:inMutableDict:onQueue:",  @"Terminations - Unknown",  v24,  v2->_queue);
    }
  }

  __int128 v105 = 0u;
  __int128 v106 = 0u;
  __int128 v103 = 0u;
  __int128 v104 = 0u;
  uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( v2->_cachedUsage,  "objectForKeyedSubscript:",  @"Work Bin: Last PID Work"));
  id v26 = [v25 copy];

  id v27 = [v26 countByEnumeratingWithState:&v103 objects:v126 count:16];
  __int16 v28 = &AnalyticsSendEventLazy_ptr;
  if (v27)
  {
    id v29 = v27;
    uint64_t v93 = *(void *)v104;
    id v91 = v26;
    do
    {
      uint64_t v30 = 0LL;
      id v92 = v29;
      do
      {
        if (*(void *)v104 != v93) {
          objc_enumerationMutation(v26);
        }
        uint64_t v94 = v30;
        unint64_t v31 = *(__CFString **)(*((void *)&v103 + 1) + 8 * v30);
        if (-[__CFString isEqualToString:](v31, "isEqualToString:", @"Persist file creation Date"))
        {
          __int16 v32 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( v2->_cachedUsage,  "objectForKeyedSubscript:",  @"Work Bin: Last PID Work"));
          double v33 = (void *)objc_claimAutoreleasedReturnValue([v32 objectForKeyedSubscript:v31]);
          id v34 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( v2->_cachedUsage,  "objectForKeyedSubscript:",  @"Work Bin: Previous PIDs Work"));
          [v34 setObject:v33 forKeyedSubscript:v31];
        }

        id v35 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( v2->_cachedUsage,  "objectForKeyedSubscript:",  @"Work Bin: Last PID Work"));
        id v36 = (void *)objc_claimAutoreleasedReturnValue([v35 objectForKeyedSubscript:v31]);
        uint64_t v37 = objc_opt_class(v28[91]);
        char isKindOfClass = objc_opt_isKindOfClass(v36, v37);

        id v98 = v31;
        if ((isKindOfClass & 1) != 0)
        {
          id v39 = WALogCategoryDefaultHandle();
          BOOL v40 = (os_log_s *)objc_claimAutoreleasedReturnValue(v39);
          if (!os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG)) {
            goto LABEL_35;
          }
          *(_DWORD *)buf = 136446722;
          id v112 = "-[WAIOReporterMessagePopulator _handleUnpersistForUsageData]";
          __int16 v113 = 1024;
          int v114 = 2640;
          __int16 v115 = 2112;
          id v116 = v31;
          id v41 = v40;
          BOOL v42 = "%{public}s::%d:Skipping copying to _cachedUsage[kPreviousPIDsBin] key %@: NSDate";
LABEL_34:
          _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEBUG, v42, buf, 0x1Cu);
          goto LABEL_35;
        }

        if ((-[__CFString isEqualToString:](v31, "isEqualToString:", @"Last Persisted PID") & 1) != 0
          || -[__CFString isEqualToString:](v31, "isEqualToString:", @"Last Terminated PID"))
        {
          id v43 = WALogCategoryDefaultHandle();
          BOOL v40 = (os_log_s *)objc_claimAutoreleasedReturnValue(v43);
          if (!os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG)) {
            goto LABEL_35;
          }
          *(_DWORD *)buf = 136446722;
          id v112 = "-[WAIOReporterMessagePopulator _handleUnpersistForUsageData]";
          __int16 v113 = 1024;
          int v114 = 2644;
          __int16 v115 = 2112;
          id v116 = v31;
          id v41 = v40;
          BOOL v42 = "%{public}s::%d:Skipping copying to _cachedUsage[kPreviousPIDsBin] key %@: kWAPersistedPidKey or kWATerminationPidKey";
          goto LABEL_34;
        }

        id v44 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( v2->_cachedUsage,  "objectForKeyedSubscript:",  @"Work Bin: Last PID Work"));
        BOOL v45 = (void *)objc_claimAutoreleasedReturnValue([v44 objectForKeyedSubscript:v31]);
        uint64_t v46 = objc_opt_class(&OBJC_CLASS___NSNumber);
        char v47 = objc_opt_isKindOfClass(v45, v46);

        if ((v47 & 1) != 0)
        {
          id v48 = WALogCategoryDefaultHandle();
          uint64_t v49 = (os_log_s *)objc_claimAutoreleasedReturnValue(v48);
          if (os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG))
          {
            __int16 v50 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( v2->_cachedUsage,  "objectForKeyedSubscript:",  @"Work Bin: Last PID Work"));
            int v51 = (__CFString *)objc_claimAutoreleasedReturnValue([v50 objectForKeyedSubscript:v31]);
            __int16 v52 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( v2->_cachedUsage,  "objectForKeyedSubscript:",  @"Work Bin: Previous PIDs Work"));
            uint64_t v53 = (void *)objc_claimAutoreleasedReturnValue([v52 objectForKeyedSubscript:v31]);
            *(_DWORD *)buf = 136447234;
            id v112 = "-[WAIOReporterMessagePopulator _handleUnpersistForUsageData]";
            __int16 v113 = 1024;
            int v114 = 2649;
            __int16 v115 = 2112;
            id v116 = v31;
            __int16 v117 = 2112;
            __int16 v118 = v51;
            __int16 v119 = 2112;
            __int16 v120 = v53;
            _os_log_impl( (void *)&_mh_execute_header,  v49,  OS_LOG_TYPE_DEBUG,  "%{public}s::%d:Summing key %@ of kLastPIDBin %@ to kPreviousPIDsBin %@",  buf,  0x30u);

            id v29 = v92;
          }

          BOOL v40 = (os_log_s *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( v2->_cachedUsage,  "objectForKeyedSubscript:",  @"Work Bin: Previous PIDs Work"));
          __int16 v54 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( v2->_cachedUsage,  "objectForKeyedSubscript:",  @"Work Bin: Last PID Work"));
          +[WAUtil sumNSNumberForKey:dstDict:otherDict:]( &OBJC_CLASS___WAUtil,  "sumNSNumberForKey:dstDict:otherDict:",  v31,  v40,  v54);
        }

        else
        {
          BOOL v55 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( v2->_cachedUsage,  "objectForKeyedSubscript:",  @"Work Bin: Last PID Work"));
          __int16 v56 = (void *)objc_claimAutoreleasedReturnValue([v55 objectForKeyedSubscript:v31]);
          uint64_t v57 = objc_opt_class(&OBJC_CLASS___NSMutableDictionary);
          char v58 = objc_opt_isKindOfClass(v56, v57);

          if ((v58 & 1) != 0)
          {
            __int128 v101 = 0u;
            __int128 v102 = 0u;
            __int128 v99 = 0u;
            __int128 v100 = 0u;
            uint64_t v59 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( v2->_cachedUsage,  "objectForKeyedSubscript:",  @"Work Bin: Last PID Work"));
            id v60 = (void *)objc_claimAutoreleasedReturnValue([v59 objectForKeyedSubscript:v31]);
            BOOL v40 = (os_log_s *)[v60 copy];

            id v97 = -[os_log_s countByEnumeratingWithState:objects:count:]( v40,  "countByEnumeratingWithState:objects:count:",  &v99,  v125,  16LL);
            if (v97)
            {
              uint64_t v61 = *(void *)v100;
              id v62 = v98;
              id obj = v40;
              do
              {
                for (j = 0LL; j != v97; j = (char *)j + 1)
                {
                  if (*(void *)v100 != v61) {
                    objc_enumerationMutation(obj);
                  }
                  id v64 = *(const __CFString **)(*((void *)&v99 + 1) + 8LL * (void)j);
                  id v65 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( v2->_cachedUsage,  "objectForKeyedSubscript:",  @"Work Bin: Last PID Work"));
                  id v66 = (void *)objc_claimAutoreleasedReturnValue([v65 objectForKeyedSubscript:v62]);
                  id v67 = (void *)objc_claimAutoreleasedReturnValue([v66 objectForKeyedSubscript:v64]);
                  uint64_t v68 = objc_opt_class(&OBJC_CLASS___NSNumber);
                  char v69 = objc_opt_isKindOfClass(v67, v68);

                  if ((v69 & 1) != 0)
                  {
                    id v70 = WALogCategoryDefaultHandle();
                    id v71 = (os_log_s *)objc_claimAutoreleasedReturnValue(v70);
                    if (os_log_type_enabled(v71, OS_LOG_TYPE_DEBUG))
                    {
                      id v72 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( v2->_cachedUsage,  "objectForKeyedSubscript:",  @"Work Bin: Last PID Work"));
                      id v73 = (void *)objc_claimAutoreleasedReturnValue([v72 objectForKeyedSubscript:v62]);
                      id v74 = (void *)objc_claimAutoreleasedReturnValue([v73 objectForKeyedSubscript:v64]);
                      id v75 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( v2->_cachedUsage,  "objectForKeyedSubscript:",  @"Work Bin: Previous PIDs Work"));
                      id v76 = (void *)objc_claimAutoreleasedReturnValue([v75 objectForKeyedSubscript:v98]);
                      id v77 = (void *)objc_claimAutoreleasedReturnValue([v76 objectForKeyedSubscript:v64]);
                      *(_DWORD *)buf = 136447746;
                      id v112 = "-[WAIOReporterMessagePopulator _handleUnpersistForUsageData]";
                      __int16 v113 = 1024;
                      int v114 = 2656;
                      __int16 v115 = 2112;
                      id v116 = v64;
                      __int16 v117 = 2112;
                      __int16 v118 = v98;
                      __int16 v119 = 2112;
                      __int16 v120 = v74;
                      __int16 v121 = 2112;
                      uint32_t v122 = v98;
                      __int16 v123 = 2112;
                      id v124 = v77;
                      _os_log_impl( (void *)&_mh_execute_header,  v71,  OS_LOG_TYPE_DEBUG,  "%{public}s::%d:Summing innerKey %@ of kLastPIDBin.%@ %@ to kPreviousPIDsBin.%@ %@",  buf,  0x44u);

                      CFMutableDictionaryRef v2 = v95;
                      id v62 = v98;
                    }

                    id v78 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( v2->_cachedUsage,  "objectForKeyedSubscript:",  @"Work Bin: Previous PIDs Work"));
                    id v79 = (void *)objc_claimAutoreleasedReturnValue([v78 objectForKeyedSubscript:v62]);
                    uint64_t v80 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( v2->_cachedUsage,  "objectForKeyedSubscript:",  @"Work Bin: Last PID Work"));
                    uint64_t v81 = (void *)objc_claimAutoreleasedReturnValue([v80 objectForKeyedSubscript:v98]);
                    +[WAUtil sumNSNumberForKey:dstDict:otherDict:]( &OBJC_CLASS___WAUtil,  "sumNSNumberForKey:dstDict:otherDict:",  v64,  v79,  v81);

                    id v62 = v98;
                  }
                }

                BOOL v40 = obj;
                id v97 = -[os_log_s countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v99,  v125,  16LL);
              }

              while (v97);
              id v26 = v91;
              __int16 v28 = &AnalyticsSendEventLazy_ptr;
              id v29 = v92;
            }
          }

          else
          {
            id v82 = WALogCategoryDefaultHandle();
            BOOL v40 = (os_log_s *)objc_claimAutoreleasedReturnValue(v82);
            if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
            {
              int v83 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( v2->_cachedUsage,  "objectForKeyedSubscript:",  @"Work Bin: Last PID Work"));
              __int16 v84 = (void *)objc_claimAutoreleasedReturnValue([v83 objectForKeyedSubscript:v31]);
              id v85 = (__CFString *)objc_opt_class(v84);
              *(_DWORD *)buf = 136446978;
              id v112 = "-[WAIOReporterMessagePopulator _handleUnpersistForUsageData]";
              __int16 v113 = 1024;
              int v114 = 2661;
              __int16 v115 = 2112;
              id v116 = v31;
              __int16 v117 = 2112;
              __int16 v118 = v85;
              __int16 v86 = v85;
              _os_log_impl( (void *)&_mh_execute_header,  v40,  OS_LOG_TYPE_DEBUG,  "%{public}s::%d:Skipping copying to _cachedUsage[kPreviousPIDsBin] key %@: unknown class %@",  buf,  0x26u);
            }
          }
        }

- (id)getCachedUsage
{
  uint64_t v8 = 0LL;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x3032000000LL;
  double v11 = sub_100024EB4;
  id v12 = sub_100024EC4;
  id v13 = 0LL;
  int v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[WAIOReporterMessagePopulator queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100024ECC;
  block[3] = &unk_1000CCD30;
  objc_copyWeak(&v7, &location);
  void block[4] = &v8;
  dispatch_sync(v3, block);

  id v4 = (id)v9[5];
  objc_destroyWeak(&v7);
  _Block_object_dispose(&v8, 8);

  objc_destroyWeak(&location);
  return v4;
}

- (id)_getCachedUsage
{
  if (!self->_hasAttemptedUnpersisting)
  {
    id v3 = WALogCategoryDefaultHandle();
    id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      cachedUsage = self->_cachedUsage;
      int v7 = 136446722;
      uint64_t v8 = "-[WAIOReporterMessagePopulator _getCachedUsage]";
      __int16 v9 = 1024;
      int v10 = 2691;
      __int16 v11 = 2112;
      id v12 = cachedUsage;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "%{public}s::%d:_hasAttemptedUnpersisting not run _cachedUsage is %@",  (uint8_t *)&v7,  0x1Cu);
    }

    -[WAIOReporterMessagePopulator _unpersistIORObjects](self, "_unpersistIORObjects");
  }

  -[WAIOReporterMessagePopulator _calculateEstimatedUptime](self, "_calculateEstimatedUptime");
  return self->_cachedUsage;
}

- (id)_createStructuredIOReportDictionary:(id)a3
{
  id v4 = a3;
  uint64_t v9 = 0LL;
  int v10 = &v9;
  uint64_t v11 = 0x3032000000LL;
  id v12 = sub_100024EB4;
  id v13 = sub_100024EC4;
  id v14 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  +[WAUtil incrementValueForKey:inMutableDict:onQueue:]( &OBJC_CLASS___WAUtil,  "incrementValueForKey:inMutableDict:onQueue:",  @"Build Structured Dict Calls",  self->_cachedUsage,  self->_queue);
  id v5 = objc_autoreleasePoolPush();
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_100025118;
  v8[3] = &unk_1000CCE68;
  v8[4] = &v9;
  IOReportIterate(v4, v8);
  objc_autoreleasePoolPop(v5);
  id v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v6;
}

- (RecommendationPreferences)preferences
{
  return self->_preferences;
}

- (void)setPreferences:(id)a3
{
}

- (WAIOReporterPopulatorMessageDelegate)messageDelegate
{
  return (WAIOReporterPopulatorMessageDelegate *)objc_loadWeakRetained((id *)&self->_messageDelegate);
}

- (void)setMessageDelegate:(id)a3
{
}

- (WAIOReporterPersistenceDelegate)persistenceDelegate
{
  return (WAIOReporterPersistenceDelegate *)objc_loadWeakRetained((id *)&self->_persistenceDelegate);
}

- (void)setPersistenceDelegate:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 48LL, 1);
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_source)rescanTimer
{
  return (OS_dispatch_source *)objc_getProperty(self, a2, 56LL, 1);
}

- (void)setRescanTimer:(id)a3
{
}

- (BOOL)rescanTimerRunning
{
  return self->_rescanTimerRunning;
}

- (void)setRescanTimerRunning:(BOOL)a3
{
  self->_BOOL rescanTimerRunning = a3;
}

- (OS_dispatch_source)persistTimer
{
  return (OS_dispatch_source *)objc_getProperty(self, a2, 64LL, 1);
}

- (void)setPersistTimer:(id)a3
{
}

- (BOOL)persistTimerRunning
{
  return self->_persistTimerRunning;
}

- (void)setPersistTimerRunning:(BOOL)a3
{
  self->_BOOL persistTimerRunning = a3;
}

- (NSMutableDictionary)cachedIOPopAvailableChannels
{
  return self->_cachedIOPopAvailableChannels;
}

- (void)setCachedIOPopAvailableChannels:(id)a3
{
}

- (NSMutableDictionary)cachedUsage
{
  return self->_cachedUsage;
}

- (void)setCachedUsage:(id)a3
{
}

- (NSMutableDictionary)cachedChannelsCountPerIORPopulatable
{
  return self->_cachedChannelsCountPerIORPopulatable;
}

- (void)setCachedChannelsCountPerIORPopulatable:(id)a3
{
}

- (BOOL)ioReportersCacheNeedsUpdating
{
  return self->_ioReportersCacheNeedsUpdating;
}

- (void)setIoReportersCacheNeedsUpdating:(BOOL)a3
{
  self->_BOOL ioReportersCacheNeedsUpdating = a3;
}

- (NSString)infraInterfaceName
{
  return self->_infraInterfaceName;
}

- (void)setInfraInterfaceName:(id)a3
{
}

- (NSMutableArray)cachedPredicatesNotYetFound
{
  return self->_cachedPredicatesNotYetFound;
}

- (void)setCachedPredicatesNotYetFound:(id)a3
{
}

- (NSMutableDictionary)cachedIOReportSubbedChannels
{
  return self->_cachedIOReportSubbedChannels;
}

- (void)setCachedIOReportSubbedChannels:(id)a3
{
}

- (NSMutableDictionary)cachedIOReportSample
{
  return self->_cachedIOReportSample;
}

- (void)setCachedIOReportSample:(id)a3
{
}

- (WAApple80211)apple80211Wrapper
{
  return self->_apple80211Wrapper;
}

- (void)setApple80211Wrapper:(id)a3
{
}

- (BOOL)hasAttemptedUnpersisting
{
  return self->_hasAttemptedUnpersisting;
}

- (void)setHasAttemptedUnpersisting:(BOOL)a3
{
  self->_hasAttemptedUnpersisting = a3;
}

- (BOOL)persistFileExistedAtPIDLoad
{
  return self->_persistFileExistedAtPIDLoad;
}

- (void)setPersistFileExistedAtPIDLoad:(BOOL)a3
{
  self->_persistFileExistedAtPIDLoad = a3;
}

- (int)pid
{
  return self->_pid;
}

- (void)setPid:(int)a3
{
  self->_pid = a3;
}

- (NSDate)pidLaunchDate
{
  return (NSDate *)objc_getProperty(self, a2, 136LL, 1);
}

- (void)setPidLaunchDate:(id)a3
{
}

- (BOOL)failNextCreateOrUpdateSample
{
  return self->_failNextCreateOrUpdateSample;
}

- (void)setFailNextCreateOrUpdateSample:(BOOL)a3
{
  self->_failNextCreateOrUpdateSample = a3;
}

- (unsigned)srv
{
  return self->_srv;
}

- (void)setSrv:(unsigned int)a3
{
  self->_unsigned int srv = a3;
}

- (NSString)drvName
{
  return (NSString *)objc_getProperty(self, a2, 144LL, 1);
}

- (void)setDrvName:(id)a3
{
}

- (NSString)drvPath
{
  return (NSString *)objc_getProperty(self, a2, 152LL, 1);
}

- (void)setDrvPath:(id)a3
{
}

- (NSNumber)providerNum
{
  return (NSNumber *)objc_getProperty(self, a2, 160LL, 1);
}

- (void)setProviderNum:(id)a3
{
}

- (int64_t)wlanType
{
  return self->_wlanType;
}

- (void)setWlanType:(int64_t)a3
{
  self->_int64_t wlanType = a3;
}

- (void).cxx_destruct
{
}

@end
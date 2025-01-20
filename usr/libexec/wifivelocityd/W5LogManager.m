@interface W5LogManager
+ (id)__descriptionForNetwork:(id)a3;
+ (id)__logBTCProfile:(apple80211_btc_profile_osx *)a3;
+ (id)__logBluetoothStatus:(id)a3;
+ (id)__logNetworkStatus:(id)a3;
+ (id)__logScanResults:(id)a3;
+ (id)__logTxPower:(apple80211_per_chain_power_data_get *)a3;
+ (id)__logWiFiStatus:(id)a3;
+ (id)__temporaryDirectory;
+ (void)__parsePingOutput:(id)a3 result:(id)a4;
- (BOOL)__logItems:(id)a3 containsID:(int64_t)a4;
- (BOOL)__wlCLIWithArguments:(id)a3 outputFilePath:(id)a4 outputData:(id)a5;
- (BOOL)isRequestActiveOrPending:(id)a3;
- (BOOL)waDeviceAnalyticsClientExists;
- (W5LogManager)initWithStatusManager:(id)a3 diagnosticsManager:(id)a4 peerDiagnosticsManager:(id)a5;
- (id)__basicWiFiLogsWithFilteredContent:(BOOL)a3 useMegaWiFiProfileLimits:(BOOL)a4;
- (id)__browseBonjourInstancesWithServiceType:(id)a3 duration:(unint64_t)a4;
- (id)__collect3barsCache:(id)a3;
- (id)__collectAWDLStatus:(id)a3;
- (id)__collectAdditionalLog:(id)a3 url:(id)a4;
- (id)__collectAirPlayLogs:(id)a3;
- (id)__collectBluetoothLogs:(id)a3;
- (id)__collectBluetoothStatus:(id)a3;
- (id)__collectBonjourRecords:(id)a3;
- (id)__collectCoreCapture24:(id)a3;
- (id)__collectCoreCapture:(id)a3;
- (id)__collectCoreCaptureDump:(id)a3;
- (id)__collectCrashesAndSpins24:(id)a3;
- (id)__collectDatapathStats:(id)a3;
- (id)__collectDeviceAnalyticsDeploymentGraph:(id)a3;
- (id)__collectDeviceAnalyticsEntityCSVs:(id)a3;
- (id)__collectDeviceAnalyticsStore:(id)a3;
- (id)__collectDextCoreDump:(id)a3;
- (id)__collectDiagnostics:(id)a3;
- (id)__collectEAP8021XLogs:(id)a3;
- (id)__collectEventHistory:(id)a3;
- (id)__collectFileAtURL:(id)a3 outputDirectory:(id)a4 maxAge:(double)a5 maxSize:(unint64_t)a6 compress:(BOOL)a7 remainingSize:(unint64_t *)a8;
- (id)__collectFilesInDirectories:(id)a3 include:(id)a4 exclude:(id)a5 maxAge:(double)a6 maxCount:(unint64_t)a7 maxSize:(unint64_t)a8 outputDirectory:(id)a9 compress:(BOOL)a10 remainingSize:(unint64_t *)a11 contentFilter:(id)a12;
- (id)__collectFilteredWiFiManagerLogArchiveWithOutputURL:(id)a3 compress:(BOOL)a4 age:(unint64_t)a5;
- (id)__collectIPConfigurationLogs:(id)a3;
- (id)__collectIndividual:(id)a3 error:(id *)a4;
- (id)__collectLeakyAPStats:(id)a3;
- (id)__collectLogItem:(id)a3 error:(id *)a4;
- (id)__collectMultiple:(id)a3;
- (id)__collectNetworkPreferences:(id)a3;
- (id)__collectNetworkStatus:(id)a3;
- (id)__collectPeerDiagnostics:(id)a3;
- (id)__collectPerSSIDDiagnosticsHistory:(id)a3;
- (id)__collectPreviouslyCollected:(id)a3;
- (id)__collectSharingLogs:(id)a3;
- (id)__collectSystemConfiguration:(id)a3;
- (id)__collectSystemLogs24:(id)a3;
- (id)__collectSystemLogs:(id)a3;
- (id)__collectSystemProfiler:(id)a3;
- (id)__collectTCPDump_POST:(id)a3;
- (id)__collectTCPDump_PRE:(id)a3;
- (id)__collectWiFiDeviceConfig:(id)a3;
- (id)__collectWiFiLogs24:(id)a3;
- (id)__collectWiFiLogs:(id)a3;
- (id)__collectWiFiLogsDump:(id)a3;
- (id)__collectWiFiMemoryUsage:(id)a3;
- (id)__collectWiFiPerfLogs:(id)a3;
- (id)__collectWiFiPreferences:(id)a3;
- (id)__collectWiFiScanResults:(id)a3;
- (id)__collectWiFiStatsCLI:(id)a3;
- (id)__collectWiFiStatsPost:(id)a3;
- (id)__collectWiFiStatsPre:(id)a3;
- (id)__collectWiFiStatus:(id)a3;
- (id)__collectWiFiVelocityLog:(id)a3;
- (id)__collectWirelessProxLogs:(id)a3;
- (id)__collect_CFNetworkPing:(id)a3;
- (id)__collect_IMFoundationPing:(id)a3;
- (id)__collect_arp:(id)a3;
- (id)__collect_configd:(id)a3;
- (id)__collect_darwinup:(id)a3;
- (id)__collect_hosts:(id)a3;
- (id)__collect_ifconfig:(id)a3;
- (id)__collect_ioreg:(id)a3;
- (id)__collect_ipconfig:(id)a3;
- (id)__collect_kextstat:(id)a3;
- (id)__collect_mobilewifitool:(id)a3;
- (id)__collect_ndp:(id)a3;
- (id)__collect_netstat:(id)a3;
- (id)__collect_ping:(id)a3;
- (id)__collect_pmset:(id)a3;
- (id)__collect_spindump:(id)a3;
- (id)__collect_swvers:(id)a3;
- (id)__collect_sysdiagnose:(id)a3;
- (id)__collect_top:(id)a3;
- (id)__collect_traceroute:(id)a3;
- (id)__collect_wl_cca_get_stats:(id)a3;
- (id)__collect_wl_curpower:(id)a3;
- (id)__concurrentConnectivityDiagnosticsTest;
- (id)__configurationDiagnosticsLogItemWithTimeout:(double)a3;
- (id)__connectivityDiagnosticsLogItemWithTimeout:(double)a3;
- (id)__dnssdBrowseAll:(id)a3;
- (id)__dnssdCacheAndState:(id)a3;
- (id)__environmentDiagnosticsLogItemWithTimeout:(double)a3;
- (id)__expandLogItems:(id)a3 configuration:(id)a4;
- (id)__fastConnectivityDiagnosticsLogItemWithTimeout:(double)a3;
- (id)__logAWDLStatus:(id)a3;
- (id)__logDiagnosticsPingResults:(id)a3;
- (id)__logDiagnosticsTestResults:(id)a3;
- (id)__logItemsForABCWithReason:(id)a3 filteredContent:(BOOL)a4;
- (id)__logItemsForBTSysdiagnoseWithFilteredContent:(BOOL)a3 timeout:(int64_t)a4;
- (id)__logItemsForBackgroundEventWithReason:(id)a3 filteredContent:(BOOL)a4;
- (id)__logItemsForDatapathStallEventWithFilteredContent:(BOOL)a3;
- (id)__logItemsForDumpLogsEventWithReason:(id)a3 filteredContent:(BOOL)a4;
- (id)__logItemsForFeedbackAssistant;
- (id)__logItemsForInternalWiFiSettings;
- (id)__logItemsForSysdiagnoseWithFilteredContent:(BOOL)a3 useMegaWiFiProfileLimits:(BOOL)a4 timeout:(int64_t)a5;
- (id)__logItemsForSysdiagnoseWithNoTimeoutAndFilteredContent:(BOOL)a3 useMegaWiFiProfileLimits:(BOOL)a4;
- (id)__logItemsForTapToRadar;
- (id)__logItemsForWiFiDiagnosticsApp;
- (id)__logItemsForWiFiDiagnosticsExtensionWithCoreCapturePrefix:(id)a3;
- (id)__model;
- (id)__mostRecentInDirectories:(id)a3 include:(id)a4 exclude:(id)a5 maxAge:(double)a6;
- (id)__mostRecentInDirectories:(id)a3 matchingPrefix:(id)a4 matchingSuffix:(id)a5 excludingPrefix:(id)a6 excludingSuffix:(id)a7 maxAge:(double)a8;
- (id)__pendingRequestWithUUID:(id)a3;
- (id)__ping6WithAddress:(id)a3 count:(int64_t)a4 wait:(double)a5 trafficClass:(id)a6 interfaceName:(id)a7 dataLength:(unint64_t)a8;
- (id)__pingBroadcast:(id)a3;
- (id)__pingSubnet:(id)a3;
- (id)__pingUsingCFNetworkWithAddress:(id)a3 count:(int64_t)a4 timeout:(int64_t)a5 trafficClass:(id)a6 networkServiceType:(id)a7;
- (id)__pingUsingIMFoundationWithAddress:(id)a3 timeout:(int64_t)a4;
- (id)__pingWithAddress:(id)a3 count:(int64_t)a4 timeout:(double)a5 wait:(double)a6 interval:(double)a7 trafficClass:(id)a8 interfaceName:(id)a9 dataLength:(unint64_t)a10;
- (id)__possibleCoreCapturePathsWithComponent:(id)a3;
- (id)__possibleTempWiFiLogPaths;
- (id)__resolveBonjourInstance:(id)a3 serviceType:(id)a4 duration:(unint64_t)a5;
- (id)__runDiagnosticsTests:(id)a3 configuration:(id)a4 timeout:(int64_t)a5 error:(id *)a6;
- (id)collectLogItemCallback;
- (id)collectedItemCallback;
- (id)pingCallback;
- (unint64_t)__calculateSizeAtPath:(id)a3;
- (void)__dumpCoreCaptureLogsWithReason:(id)a3 component:(id)a4;
- (void)__dumpWiFiLogs;
- (void)__endWiFiStats;
- (void)__filterCoreCaptureContent:(id)a3;
- (void)__nextRequest;
- (void)__purgeFilesInDirectory:(id)a3 matching:(id)a4 maxAge:(unint64_t)a5 maxCount:(unint64_t)a6;
- (void)__replyWithCachedSysdiagnoseContentForRequest:(id)a3 temporaryURL:(id)a4;
- (void)__runRequest:(id)a3 reply:(id)a4;
- (void)__runToolWithOutputFileHandle:(id)a3 launchPath:(id)a4 arguments:(id)a5;
- (void)__runToolWithOutputFileHandle:(id)a3 readFromStandardError:(BOOL)a4 launchPath:(id)a5 arguments:(id)a6 addCommand:(BOOL)a7 addTimestamps:(BOOL)a8;
- (void)__setupWiFiStats;
- (void)__startWiFiStats;
- (void)__teardownWiFiStats;
- (void)__wlCLIWithArguments:(id)a3 outputFileHandle:(id)a4;
- (void)__wlCLIWithArguments:(id)a3 outputFileHandle:(id)a4 addCommand:(BOOL)a5 addTimestamps:(BOOL)a6;
- (void)addRequest:(id)a3;
- (void)cancelRequestWithUUID:(id)a3 reply:(id)a4;
- (void)dealloc;
- (void)setCollectLogItemCallback:(id)a3;
- (void)setCollectedItemCallback:(id)a3;
- (void)setPingCallback:(id)a3;
- (void)teardownAndNotify:(id)a3;
@end

@implementation W5LogManager

- (W5LogManager)initWithStatusManager:(id)a3 diagnosticsManager:(id)a4 peerDiagnosticsManager:(id)a5
{
  v20.receiver = self;
  v20.super_class = (Class)&OBJC_CLASS___W5LogManager;
  v8 = -[W5LogManager init](&v20, "init");
  if (!v8) {
    goto LABEL_16;
  }
  v9 = dispatch_queue_create("com.apple.wifivelocity.collect-logs", 0LL);
  v8->_queue = (OS_dispatch_queue *)v9;
  if (!v9) {
    goto LABEL_16;
  }
  dispatch_queue_set_specific(v9, &v8->_queue, (void *)1, 0LL);
  dispatch_queue_t v10 = dispatch_queue_create("com.apple.wifivelocity.debug-log", 0LL);
  v8->_debugLogQueue = (OS_dispatch_queue *)v10;
  if (!v10) {
    goto LABEL_16;
  }
  v11 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  v8->_debugLogMap = v11;
  if (!v11) {
    goto LABEL_16;
  }
  v12 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  v8->_missingLogItemMap = v12;
  if (!v12) {
    goto LABEL_16;
  }
  v13 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  v8->_taskUUIDMap = v13;
  if (!v13) {
    goto LABEL_16;
  }
  v14 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  v8->_urlUUIDMap = v14;
  if (!v14) {
    goto LABEL_16;
  }
  v15 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  v8->_leewayUUIDMap = v15;
  if (!v15) {
    goto LABEL_16;
  }
  v16 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  v8->_timestampUUIDMap = v16;
  if (!v16) {
    goto LABEL_16;
  }
  v17 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  v8->_pendingRequests = v17;
  if (a3
    && v17
    && (v8->_status = (W5StatusManager *)a3, a4)
    && (v8->_diagnostics = (W5DiagnosticsManager *)a4,
        v8->_peerDiagnostics = (W5PeerDiagnosticsManager *)a5,
        v18 = objc_alloc_init(&OBJC_CLASS___NSDateFormatter),
        (v8->_dateFormatter = v18) != 0LL))
  {
    -[NSDateFormatter setDateFormat:](v18, "setDateFormat:", @"HH:mm:ss.SSS");
    v8->_model = (NSString *)objc_msgSend(-[W5LogManager __model](v8, "__model"), "copy");
    v8->_ioReportSubscription = 0LL;
    v8->_waDeviceAnalyticsClient = 0LL;
    v8->_waDeviceAnalyticsClientNotSupported = 0;
    v8->_ioReportBase = 0LL;
    v8->_ioReportDelta = 0LL;
    v8->_ioReportChannels = 0LL;
  }

  else
  {
LABEL_16:

    return 0LL;
  }

  return v8;
}

- (void)dealloc
{
  queue = (dispatch_object_s *)self->_queue;
  if (queue) {
    dispatch_release(queue);
  }
  debugLogQueue = (dispatch_object_s *)self->_debugLogQueue;
  if (debugLogQueue) {
    dispatch_release(debugLogQueue);
  }
  ioReportBase = self->_ioReportBase;
  if (ioReportBase) {
    CFRelease(ioReportBase);
  }
  ioReportDelta = self->_ioReportDelta;
  if (ioReportDelta) {
    CFRelease(ioReportDelta);
  }
  ioReportChannels = self->_ioReportChannels;
  if (ioReportChannels) {
    CFRelease(ioReportChannels);
  }
  ioReportSubscription = self->_ioReportSubscription;
  if (ioReportSubscription) {
    CFRelease(ioReportSubscription);
  }
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___W5LogManager;
  -[W5LogManager dealloc](&v9, "dealloc");
}

- (BOOL)waDeviceAnalyticsClientExists
{
  if (!self->_waDeviceAnalyticsClient)
  {
    if (self->_waDeviceAnalyticsClientNotSupported) {
      return 0;
    }
    if (sub_100053438() && (uint64_t v5 = sub_100053438(), objc_opt_class(v5, v6)))
    {
      int v7 = _os_feature_enabled_impl("WiFiPolicy", "HND_AnalyticsProcessor");
      v8 = (os_log_s *)sub_10008C90C();
      BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
      if (v7)
      {
        if (v9)
        {
          v17[0] = 0;
          _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v8,  0LL,  "[wifivelocity] Creating _waDeviceAnalyticsClient with [WADeviceAnalyticsClient_SOFT sharedDeviceAnalyticsCli entWithSharedServerTypeAndXPCStore]",  v17,  2);
        }

        dispatch_queue_t v10 = (WADeviceAnalyticsClient *)[(id)sub_100053438() sharedDeviceAnalyticsClientWithPersist];
      }

      else
      {
        if (v9)
        {
          v16[0] = 0;
          _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v8,  0LL,  "[wifivelocity] Creating _waDeviceAnalyticsClient with [[WADeviceAnalyticsClient_SOFT alloc] init]",  v16,  2);
        }

        dispatch_queue_t v10 = (WADeviceAnalyticsClient *)objc_alloc_init((Class)sub_100053438());
      }

      self->_waDeviceAnalyticsClient = v10;
      if (!v10) {
        return 0;
      }
    }

    else
    {
      v11 = (os_log_s *)sub_10008C90C();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        v15[0] = 0;
        _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v11,  0LL,  "[wifivelocity] WADeviceAnalyticsClient_SOFT failed or [WADeviceAnalyticsClient_SOFT class] doesnt exist, setti ng _waDeviceAnalyticsClientNotSupported",  v15,  2);
      }

      self->_waDeviceAnalyticsClientNotSupported = 1;
      if (!self->_waDeviceAnalyticsClient) {
        return 0;
      }
    }

    v12 = (os_log_s *)sub_10008C90C();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v14[0] = 0;
      LODWORD(v13) = 2;
      BOOL v2 = 1;
      _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v12,  0LL,  "[wifivelocity] _waDeviceAnalyticsClient now exists after performing runtime checks and initialization",  v14,  v13);
      return v2;
    }
  }

  return 1;
}

- (void)setCollectedItemCallback:(id)a3
{
  if (dispatch_get_specific(&self->_queue))
  {

    self->_collectedItemCallback = [a3 copy];
  }

  else
  {
    queue = (dispatch_queue_s *)self->_queue;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472LL;
    v6[2] = sub_100053580;
    v6[3] = &unk_1000D1B80;
    v6[4] = self;
    v6[5] = a3;
    dispatch_sync(queue, v6);
  }

- (void)setPingCallback:(id)a3
{
  if (dispatch_get_specific(&self->_queue))
  {

    self->_pingCallback = [a3 copy];
  }

  else
  {
    queue = (dispatch_queue_s *)self->_queue;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472LL;
    v6[2] = sub_10005364C;
    v6[3] = &unk_1000D1B80;
    v6[4] = self;
    v6[5] = a3;
    dispatch_sync(queue, v6);
  }

- (void)setCollectLogItemCallback:(id)a3
{
  if (dispatch_get_specific(&self->_queue))
  {

    self->_collectLogItemCallback = [a3 copy];
  }

  else
  {
    queue = (dispatch_queue_s *)self->_queue;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472LL;
    v6[2] = sub_100053718;
    v6[3] = &unk_1000D1B80;
    v6[4] = self;
    v6[5] = a3;
    dispatch_sync(queue, v6);
  }

- (void)__replyWithCachedSysdiagnoseContentForRequest:(id)a3 temporaryURL:(id)a4
{
  unsigned int v6 = objc_msgSend( objc_msgSend(objc_msgSend(a3, "configuration"), "objectForKeyedSubscript:", @"Compress"),  "BOOLValue");
  if (a4)
  {
    unsigned int v7 = v6;
    v14 = 0LL;
    v8 = -[NSURL URLByAppendingPathComponent:]( +[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", @"/var/run/com.apple.wifivelocity"),  "URLByAppendingPathComponent:",  [a3 filename]);
    if (v7)
    {
      BOOL v9 = &Apple80211BindToInterface_ptr;
      sub_10008C94C(a4, v8, &v14);
    }

    else
    {
      sub_10008D400(a4, v8, &v14);
      dispatch_queue_t v10 = +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager");
      v18[0] = &off_1000DF060;
      v17[0] = NSFilePosixPermissions;
      v17[1] = NSFileOwnerAccountID;
      v18[1] = +[NSNumber numberWithUnsignedInt:]( NSNumber,  "numberWithUnsignedInt:",  [a3 uid]);
      v17[2] = NSFileGroupOwnerAccountID;
      v18[2] = +[NSNumber numberWithUnsignedInt:]( NSNumber,  "numberWithUnsignedInt:",  [a3 gid]);
      BOOL v9 = &Apple80211BindToInterface_ptr;
      -[NSFileManager setAttributes:ofItemAtPath:error:]( v10,  "setAttributes:ofItemAtPath:error:",  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v18,  v17,  3LL),  -[NSURL path](v8, "path"),  0LL);
    }

    if (objc_msgSend(objc_msgSend(a3, "configuration"), "objectForKeyedSubscript:", @"Reason"))
    {
      v11 = -[NSURL URLByAppendingPathComponent:]( -[NSURL URLByAppendingPathComponent:]( -[NSFileManager containerURLForSecurityApplicationGroupIdentifier:]( +[NSFileManager defaultManager](NSFileManager, "defaultManager"),  "containerURLForSecurityApplicationGroupIdentifier:",  @"group.com.apple.wifi.logs"),  "URLByAppendingPathComponent:",  @"previous"),  "URLByAppendingPathComponent:",  [a3 filename]);
      sub_10008D400(v8, v11, &v14);
      v12 = +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager");
      v16[0] = &off_1000DF060;
      v15[0] = NSFilePosixPermissions;
      v15[1] = NSFileOwnerAccountID;
      v16[1] = +[NSNumber numberWithUnsignedInt:]( NSNumber,  "numberWithUnsignedInt:",  [a3 uid]);
      v15[2] = NSFileGroupOwnerAccountID;
      v16[2] = +[NSNumber numberWithUnsignedInt:]( NSNumber,  "numberWithUnsignedInt:",  [a3 gid]);
      -[NSFileManager setAttributes:ofItemAtPath:error:]( v12,  "setAttributes:ofItemAtPath:error:",  [v9[118] dictionaryWithObjects:v16 forKeys:v15 count:3],  -[NSURL path](v11, "path"),  0);
    }

    if ([a3 reply])
    {
      uint64_t v13 = (void (**)(id, NSError *, NSURL *, void))[a3 reply];
      v13[2](v13, v14, v8, 0LL);
    }
  }

- (BOOL)__logItems:(id)a3 containsID:(int64_t)a4
{
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  id v6 = [a3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v12;
    while (2)
    {
      BOOL v9 = 0LL;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(a3);
        }
        if ([*(id *)(*((void *)&v11 + 1) + 8 * (void)v9) itemID] == (id)a4)
        {
          LOBYTE(v6) = 1;
          return (char)v6;
        }

        BOOL v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      id v6 = [a3 countByEnumeratingWithState:&v11 objects:v15 count:16];
      id v7 = v6;
      if (v6) {
        continue;
      }
      break;
    }
  }

  return (char)v6;
}

- (void)addRequest:(id)a3
{
  queue = (dispatch_queue_s *)self->_queue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_100053B9C;
  v4[3] = &unk_1000D1BA8;
  v4[4] = a3;
  v4[5] = self;
  dispatch_async(queue, v4);
}

- (void)cancelRequestWithUUID:(id)a3 reply:(id)a4
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100054EEC;
  block[3] = &unk_1000D1BD0;
  block[4] = self;
  block[5] = a3;
  block[6] = a4;
  dispatch_async(queue, block);
}

- (BOOL)isRequestActiveOrPending:(id)a3
{
  return (-[NSUUID isEqual:]( -[W5LogItemRequestInternal uuid](self->_activeRequest, "uuid"),  "isEqual:",  a3) & 1) != 0 || -[W5LogManager __pendingRequestWithUUID:](self, "__pendingRequestWithUUID:", a3) != 0LL;
}

- (void)teardownAndNotify:(id)a3
{
  queue = (dispatch_queue_s *)self->_queue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_1000551EC;
  v4[3] = &unk_1000D1B80;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(queue, v4);
}

- (id)__pendingRequestWithUUID:(id)a3
{
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  pendingRequests = self->_pendingRequests;
  id v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( pendingRequests,  "countByEnumeratingWithState:objects:count:",  &v11,  v15,  16LL);
  if (!v5) {
    return 0LL;
  }
  id v6 = v5;
  uint64_t v7 = *(void *)v12;
LABEL_3:
  uint64_t v8 = 0LL;
  while (1)
  {
    if (*(void *)v12 != v7) {
      objc_enumerationMutation(pendingRequests);
    }
    BOOL v9 = *(void **)(*((void *)&v11 + 1) + 8 * v8);
    if (v6 == (id)++v8)
    {
      id v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( pendingRequests,  "countByEnumeratingWithState:objects:count:",  &v11,  v15,  16LL);
      if (v6) {
        goto LABEL_3;
      }
      return 0LL;
    }
  }

- (void)__purgeFilesInDirectory:(id)a3 matching:(id)a4 maxAge:(unint64_t)a5 maxCount:(unint64_t)a6
{
  id v9 = +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array");
  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  double v11 = v10;
  id v32 = +[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary");
  __int128 v12 = -[NSFileManager contentsOfDirectoryAtPath:error:]( +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"),  "contentsOfDirectoryAtPath:error:",  a3,  0LL);
  __int128 v37 = 0u;
  __int128 v38 = 0u;
  __int128 v39 = 0u;
  __int128 v40 = 0u;
  id v13 = -[NSArray countByEnumeratingWithState:objects:count:]( v12,  "countByEnumeratingWithState:objects:count:",  &v37,  v44,  16LL);
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v38;
    double v16 = (double)a5;
    do
    {
      for (i = 0LL; i != v14; i = (char *)i + 1)
      {
        if (*(void *)v38 != v15) {
          objc_enumerationMutation(v12);
        }
        v18 = *(void **)(*((void *)&v37 + 1) + 8LL * (void)i);
        -[NSDate timeIntervalSinceReferenceDate]( -[NSDictionary fileCreationDate]( -[NSFileManager attributesOfItemAtPath:error:]( +[NSFileManager defaultManager](NSFileManager, "defaultManager"),  "attributesOfItemAtPath:error:",  [a3 stringByAppendingPathComponent:v18],  0),  "fileCreationDate"),  "timeIntervalSinceReferenceDate");
        double v20 = v19;
        if (!a4
          || objc_msgSend(a4, "numberOfMatchesInString:options:range:", v18, 0, 0, objc_msgSend(v18, "length")))
        {
          id v21 = [a3 stringByAppendingPathComponent:v18];
          if (v11 - v20 <= v16) {
            objc_msgSend( v32,  "setObject:forKeyedSubscript:",  v21,  +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v20));
          }
          else {
            [v9 addObject:v21];
          }
        }
      }

      id v14 = -[NSArray countByEnumeratingWithState:objects:count:]( v12,  "countByEnumeratingWithState:objects:count:",  &v37,  v44,  16LL);
    }

    while (v14);
  }

  id v22 = objc_msgSend(objc_msgSend(v32, "allKeys"), "mutableCopy");
  [v22 sortUsingComparator:&stru_1000D2B00];
  if ((unint64_t)[v22 count] > a6 && objc_msgSend(v22, "count") != (id)a6)
  {
    v23 = 0LL;
    do
      objc_msgSend( v9,  "addObject:",  objc_msgSend(v32, "objectForKeyedSubscript:", objc_msgSend(v22, "objectAtIndexedSubscript:", v23++)));
    while (v23 < (char *)[v22 count] - a6);
  }

  __int128 v35 = 0u;
  __int128 v36 = 0u;
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  id v24 = [v9 countByEnumeratingWithState:&v33 objects:v43 count:16];
  if (v24)
  {
    id v25 = v24;
    uint64_t v26 = *(void *)v34;
    do
    {
      for (j = 0LL; j != v25; j = (char *)j + 1)
      {
        if (*(void *)v34 != v26) {
          objc_enumerationMutation(v9);
        }
        uint64_t v28 = *(void *)(*((void *)&v33 + 1) + 8LL * (void)j);
        v29 = (os_log_s *)sub_10008C90C();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          int v41 = 138543362;
          uint64_t v42 = v28;
          LODWORD(v30) = 12;
          _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v29,  0LL,  "[wifivelocity] PURGE obsolete WiFi log content, path='%{public}@'",  &v41,  v30);
        }

        -[NSFileManager removeItemAtPath:error:]( +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"),  "removeItemAtPath:error:",  v28,  0LL);
      }

      id v25 = [v9 countByEnumeratingWithState:&v33 objects:v43 count:16];
    }

    while (v25);
  }

- (void)__nextRequest
{
  if (!self->_activeRequest)
  {
    if (-[NSMutableArray count](self->_pendingRequests, "count"))
    {
      id v3 = objc_msgSend(-[NSMutableArray firstObject](self->_pendingRequests, "firstObject"), "copy");
      self->_activeRequest = (W5LogItemRequestInternal *)[v3 copy];
      -[NSMutableArray removeObjectAtIndex:](self->_pendingRequests, "removeObjectAtIndex:", 0LL);
      v6[0] = 0LL;
      v6[1] = v6;
      v6[2] = 0x3052000000LL;
      v6[3] = sub_1000558E4;
      v6[4] = sub_1000558F4;
      uint64_t v4 = os_transaction_create("com.apple.wifivelocity.logs");
      objc_msgSend( +[W5ActivityManager sharedActivityManager](W5ActivityManager, "sharedActivityManager"),  "osTransactionCreate:transaction:",  "com.apple.wifivelocity.logs",  v4);
      v6[5] = v4;
      v5[0] = _NSConcreteStackBlock;
      v5[1] = 3221225472LL;
      v5[2] = sub_100055900;
      v5[3] = &unk_1000D2B78;
      v5[4] = v3;
      v5[5] = self;
      v5[6] = v6;
      -[W5LogManager __runRequest:reply:](self, "__runRequest:reply:", v3, v5);
      _Block_object_dispose(v6, 8);
    }
  }

- (id)__logItemsForDumpLogsEventWithReason:(id)a3 filteredContent:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array");
  if (!a3)
  {
    a3 = -[NSString substringToIndex:]( -[NSUUID UUIDString](+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"), "UUIDString"),  "substringToIndex:",  5LL);
    double v11 = @"Reason";
    __int128 v12 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@~dump[%@]",  @"WiFiDebug",  a3);
    objc_msgSend( v7,  "addObject:",  +[W5LogItemRequest requestWithItemID:configuration:]( W5LogItemRequest,  "requestWithItemID:configuration:",  21,  +[NSDictionary dictionaryWithObjects:forKeys:count:]( NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v12,  &v11,  1)));
  }

  objc_msgSend( v7,  "addObject:",  +[W5LogItemRequest requestWithItemID:configuration:]( W5LogItemRequest,  "requestWithItemID:configuration:",  39,  0));
  objc_msgSend( v7,  "addObject:",  +[W5LogItemRequest requestWithItemID:configuration:]( W5LogItemRequest,  "requestWithItemID:configuration:",  45,  &off_1000E1CC8));
  objc_msgSend( v7,  "addObject:",  +[W5LogItemRequest requestWithItemID:configuration:]( W5LogItemRequest,  "requestWithItemID:configuration:",  46,  &off_1000E1CF0));
  objc_msgSend( v7,  "addObject:",  +[W5LogItemRequest requestWithItemID:configuration:]( W5LogItemRequest,  "requestWithItemID:configuration:",  47,  &off_1000E1D18));
  objc_msgSend( v7,  "addObject:",  +[W5LogItemRequest requestWithItemID:configuration:]( W5LogItemRequest,  "requestWithItemID:configuration:",  44,  &off_1000E1D40));
  objc_msgSend( v7,  "addObject:",  +[W5LogItemRequest requestWithItemID:configuration:]( W5LogItemRequest,  "requestWithItemID:configuration:",  48,  0));
  objc_msgSend( v7,  "addObject:",  +[W5LogItemRequest requestWithItemID:configuration:]( W5LogItemRequest,  "requestWithItemID:configuration:",  7,  0));
  objc_msgSend( v7,  "addObject:",  +[W5LogItemRequest requestWithItemID:configuration:]( W5LogItemRequest,  "requestWithItemID:configuration:",  16,  0));
  objc_msgSend( v7,  "addObject:",  +[W5LogItemRequest requestWithItemID:configuration:]( W5LogItemRequest,  "requestWithItemID:configuration:",  58,  0));
  objc_msgSend( v7,  "addObject:",  -[W5LogManager __configurationDiagnosticsLogItemWithTimeout:]( self,  "__configurationDiagnosticsLogItemWithTimeout:",  0.0));
  objc_msgSend( v7,  "addObject:",  +[W5LogItemRequest requestWithItemID:configuration:]( W5LogItemRequest,  "requestWithItemID:configuration:",  69,  &off_1000E1D68));
  objc_msgSend( v7,  "addObject:",  +[W5LogItemRequest requestWithItemID:configuration:]( W5LogItemRequest,  "requestWithItemID:configuration:",  28,  &off_1000E1D90));
  objc_msgSend( v7,  "addObject:",  -[W5LogManager __environmentDiagnosticsLogItemWithTimeout:]( self,  "__environmentDiagnosticsLogItemWithTimeout:",  0.0));
  objc_msgSend( v7,  "addObject:",  +[W5LogItemRequest requestWithItemID:configuration:]( W5LogItemRequest,  "requestWithItemID:configuration:",  81,  &off_1000E1DB8));
  objc_msgSend( v7,  "addObject:",  -[W5LogManager __connectivityDiagnosticsLogItemWithTimeout:]( self,  "__connectivityDiagnosticsLogItemWithTimeout:",  0.0));
  objc_msgSend( v7,  "addObject:",  +[W5LogItemRequest requestWithItemID:configuration:]( W5LogItemRequest,  "requestWithItemID:configuration:",  81,  &off_1000E1DE0));
  objc_msgSend( v7,  "addObject:",  +[W5LogItemRequest requestWithItemID:configuration:]( W5LogItemRequest,  "requestWithItemID:configuration:",  3,  0));
  objc_msgSend( v7,  "addObject:",  +[W5LogItemRequest requestWithItemID:configuration:]( W5LogItemRequest,  "requestWithItemID:configuration:",  4,  0));
  objc_msgSend( v7,  "addObject:",  +[W5LogItemRequest requestWithItemID:configuration:]( W5LogItemRequest,  "requestWithItemID:configuration:",  6,  0));
  objc_msgSend( v7,  "addObject:",  +[W5LogItemRequest requestWithItemID:configuration:]( W5LogItemRequest,  "requestWithItemID:configuration:",  8,  0));
  objc_msgSend( v7,  "addObject:",  +[W5LogItemRequest requestWithItemID:configuration:]( W5LogItemRequest,  "requestWithItemID:configuration:",  37,  &off_1000E1E08));
  objc_msgSend( v7,  "addObject:",  +[W5LogItemRequest requestWithItemID:configuration:]( W5LogItemRequest,  "requestWithItemID:configuration:",  40,  0));
  v9[0] = @"IncludeMatching";
  v10[0] = +[NSRegularExpression escapedPatternForString:]( &OBJC_CLASS___NSRegularExpression,  "escapedPatternForString:",  a3);
  v10[1] = &off_1000DF0C0;
  v9[1] = @"MaxCount";
  v9[2] = @"FilterContent";
  v9[3] = @"Compress";
  v10[2] = +[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v4);
  v10[3] = &__kCFBooleanTrue;
  objc_msgSend( v7,  "addObject:",  +[W5LogItemRequest requestWithItemID:configuration:]( W5LogItemRequest,  "requestWithItemID:configuration:",  19,  +[NSDictionary dictionaryWithObjects:forKeys:count:]( NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v10,  v9,  4)));
  return [v7 copy];
}

- (id)__logItemsForABCWithReason:(id)a3 filteredContent:(BOOL)a4
{
  BOOL v4 = a4;
  if (a3) {
    id v6 = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"abc~%@", a3);
  }
  else {
    id v6 = @"abc";
  }
  return -[W5LogManager __logItemsForBackgroundEventWithReason:filteredContent:]( self,  "__logItemsForBackgroundEventWithReason:filteredContent:",  v6,  v4);
}

- (id)__logItemsForBackgroundEventWithReason:(id)a3 filteredContent:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array");
  uint64_t v8 = -[NSString substringToIndex:]( -[NSUUID UUIDString](+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"), "UUIDString"),  "substringToIndex:",  5LL);
  if (a3) {
    id v9 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@~%@[%@]",  @"WiFiDebug",  a3,  v8);
  }
  else {
    id v9 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@[%@]",  @"WiFiDebug",  v8,  v11);
  }
  id v14 = @"Reason";
  uint64_t v15 = v9;
  objc_msgSend( v7,  "addObject:",  +[W5LogItemRequest requestWithItemID:configuration:]( W5LogItemRequest,  "requestWithItemID:configuration:",  21,  +[NSDictionary dictionaryWithObjects:forKeys:count:]( NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v15,  &v14,  1)));
  objc_msgSend( v7,  "addObject:",  +[W5LogItemRequest requestWithItemID:configuration:]( W5LogItemRequest,  "requestWithItemID:configuration:",  39,  0));
  objc_msgSend( v7,  "addObject:",  +[W5LogItemRequest requestWithItemID:configuration:]( W5LogItemRequest,  "requestWithItemID:configuration:",  45,  0));
  objc_msgSend( v7,  "addObject:",  +[W5LogItemRequest requestWithItemID:configuration:]( W5LogItemRequest,  "requestWithItemID:configuration:",  46,  0));
  objc_msgSend( v7,  "addObject:",  +[W5LogItemRequest requestWithItemID:configuration:]( W5LogItemRequest,  "requestWithItemID:configuration:",  47,  0));
  objc_msgSend( v7,  "addObject:",  +[W5LogItemRequest requestWithItemID:configuration:]( W5LogItemRequest,  "requestWithItemID:configuration:",  44,  0));
  objc_msgSend( v7,  "addObject:",  +[W5LogItemRequest requestWithItemID:configuration:]( W5LogItemRequest,  "requestWithItemID:configuration:",  81,  0));
  objc_msgSend( v7,  "addObject:",  +[W5LogItemRequest requestWithItemID:configuration:]( W5LogItemRequest,  "requestWithItemID:configuration:",  16,  0));
  objc_msgSend( v7,  "addObject:",  +[W5LogItemRequest requestWithItemID:configuration:]( W5LogItemRequest,  "requestWithItemID:configuration:",  18,  0));
  objc_msgSend( v7,  "addObject:",  +[W5LogItemRequest requestWithItemID:configuration:]( W5LogItemRequest,  "requestWithItemID:configuration:",  12,  0));
  objc_msgSend( v7,  "addObject:",  +[W5LogItemRequest requestWithItemID:configuration:]( W5LogItemRequest,  "requestWithItemID:configuration:",  7,  0));
  objc_msgSend( v7,  "addObject:",  +[W5LogItemRequest requestWithItemID:configuration:]( W5LogItemRequest,  "requestWithItemID:configuration:",  10,  0));
  objc_msgSend( v7,  "addObject:",  +[W5LogItemRequest requestWithItemID:configuration:]( W5LogItemRequest,  "requestWithItemID:configuration:",  11,  0));
  objc_msgSend( v7,  "addObject:",  +[W5LogItemRequest requestWithItemID:configuration:]( W5LogItemRequest,  "requestWithItemID:configuration:",  58,  0));
  objc_msgSend( v7,  "addObject:",  +[W5LogItemRequest requestWithItemID:configuration:]( W5LogItemRequest,  "requestWithItemID:configuration:",  57,  0));
  objc_msgSend( v7,  "addObject:",  +[W5LogItemRequest requestWithItemID:configuration:]( W5LogItemRequest,  "requestWithItemID:configuration:",  28,  &off_1000E1E30));
  objc_msgSend( v7,  "addObject:",  -[W5LogManager __environmentDiagnosticsLogItemWithTimeout:]( self,  "__environmentDiagnosticsLogItemWithTimeout:",  0.0));
  objc_msgSend( v7,  "addObject:",  -[W5LogManager __configurationDiagnosticsLogItemWithTimeout:]( self,  "__configurationDiagnosticsLogItemWithTimeout:",  0.0));
  objc_msgSend( v7,  "addObject:",  +[W5LogItemRequest requestWithItemID:configuration:]( W5LogItemRequest,  "requestWithItemID:configuration:",  69,  &off_1000E1E58));
  objc_msgSend( v7,  "addObject:",  +[W5LogItemRequest requestWithItemID:configuration:]( W5LogItemRequest,  "requestWithItemID:configuration:",  37,  &off_1000E1E80));
  objc_msgSend( v7,  "addObject:",  +[W5LogItemRequest requestWithItemID:configuration:]( W5LogItemRequest,  "requestWithItemID:configuration:",  40,  0));
  v13[0] = &off_1000DF0D8;
  v12[0] = @"MaxAge";
  v12[1] = @"FilterContent";
  v12[2] = @"Compress";
  v13[1] = +[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v4);
  v13[2] = &__kCFBooleanTrue;
  objc_msgSend( v7,  "addObject:",  +[W5LogItemRequest requestWithItemID:configuration:]( W5LogItemRequest,  "requestWithItemID:configuration:",  19,  +[NSDictionary dictionaryWithObjects:forKeys:count:]( NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v13,  v12,  3)));
  return [v7 copy];
}

- (id)__logItemsForDatapathStallEventWithFilteredContent:(BOOL)a3
{
  BOOL v8 = a3;
  id v4 = +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array");
  objc_msgSend( v4,  "addObject:",  +[W5LogItemRequest requestWithItemID:configuration:]( W5LogItemRequest,  "requestWithItemID:configuration:",  39,  0));
  objc_msgSend( v4,  "addObject:",  +[W5LogItemRequest requestWithItemID:configuration:]( W5LogItemRequest,  "requestWithItemID:configuration:",  45,  &off_1000E1EA8));
  objc_msgSend( v4,  "addObject:",  +[W5LogItemRequest requestWithItemID:configuration:]( W5LogItemRequest,  "requestWithItemID:configuration:",  46,  &off_1000E1ED0));
  objc_msgSend( v4,  "addObject:",  +[W5LogItemRequest requestWithItemID:configuration:]( W5LogItemRequest,  "requestWithItemID:configuration:",  47,  &off_1000E1EF8));
  objc_msgSend( v4,  "addObject:",  +[W5LogItemRequest requestWithItemID:configuration:]( W5LogItemRequest,  "requestWithItemID:configuration:",  44,  &off_1000E1F20));
  objc_msgSend( v4,  "addObject:",  +[W5LogItemRequest requestWithItemID:configuration:]( W5LogItemRequest,  "requestWithItemID:configuration:",  48,  0));
  objc_msgSend( v4,  "addObject:",  +[W5LogItemRequest requestWithItemID:configuration:]( W5LogItemRequest,  "requestWithItemID:configuration:",  7,  0));
  objc_msgSend( v4,  "addObject:",  +[W5LogItemRequest requestWithItemID:configuration:]( W5LogItemRequest,  "requestWithItemID:configuration:",  16,  0));
  objc_msgSend( v4,  "addObject:",  +[W5LogItemRequest requestWithItemID:configuration:]( W5LogItemRequest,  "requestWithItemID:configuration:",  58,  0));
  objc_msgSend( v4,  "addObject:",  +[W5LogItemRequest requestWithItemID:configuration:]( W5LogItemRequest,  "requestWithItemID:configuration:",  11,  0));
  objc_msgSend( v4,  "addObject:",  -[W5LogManager __configurationDiagnosticsLogItemWithTimeout:]( self,  "__configurationDiagnosticsLogItemWithTimeout:",  0.0));
  id v5 = -[NSUUID UUIDString](+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"), "UUIDString");
  objc_msgSend( v4,  "addObject:",  +[W5LogItemRequest requestWithItemID:configuration:]( W5LogItemRequest,  "requestWithItemID:configuration:",  28,  &off_1000E1F48));
  objc_msgSend( v4,  "addObject:",  -[W5LogManager __environmentDiagnosticsLogItemWithTimeout:]( self,  "__environmentDiagnosticsLogItemWithTimeout:",  0.0));
  v17[0] = @"Reason";
  v17[1] = @"NameOverride";
  v18[0] = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@~dps~PRE[%@]",  @"WiFiDebug",  -[NSString substringToIndex:](v5, "substringToIndex:", 5LL));
  v18[1] = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"CoreCapture Dump (%@)",  v18[0]);
  objc_msgSend( v4,  "addObject:",  +[W5LogItemRequest requestWithItemID:configuration:]( W5LogItemRequest,  "requestWithItemID:configuration:",  21,  +[NSDictionary dictionaryWithObjects:forKeys:count:]( NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v18,  v17,  2)));
  id v6 = -[NSUUID UUIDString](+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"), "UUIDString");
  uint64_t v15 = @"UUID";
  double v16 = v6;
  objc_msgSend( v4,  "addObject:",  +[W5LogItemRequest requestWithItemID:configuration:]( W5LogItemRequest,  "requestWithItemID:configuration:",  24,  +[NSDictionary dictionaryWithObjects:forKeys:count:]( NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v16,  &v15,  1)));
  objc_msgSend( v4,  "addObject:",  +[W5LogItemRequest requestWithItemID:configuration:]( W5LogItemRequest,  "requestWithItemID:configuration:",  69,  &off_1000E1F70));
  objc_msgSend( v4,  "addObject:",  +[W5LogItemRequest requestWithItemID:configuration:]( W5LogItemRequest,  "requestWithItemID:configuration:",  81,  &off_1000E1F98));
  objc_msgSend( v4,  "addObject:",  +[W5LogItemRequest requestWithItemID:configuration:]( W5LogItemRequest,  "requestWithItemID:configuration:",  61,  &off_1000E1FC0));
  objc_msgSend( v4,  "addObject:",  +[W5LogItemRequest requestWithItemID:configuration:]( W5LogItemRequest,  "requestWithItemID:configuration:",  3,  &off_1000E1FE8));
  objc_msgSend( v4,  "addObject:",  -[W5LogManager __connectivityDiagnosticsLogItemWithTimeout:]( self,  "__connectivityDiagnosticsLogItemWithTimeout:",  0.0));
  objc_msgSend( v4,  "addObject:",  +[W5LogItemRequest requestWithItemID:configuration:]( W5LogItemRequest,  "requestWithItemID:configuration:",  61,  &off_1000E2010));
  objc_msgSend( v4,  "addObject:",  +[W5LogItemRequest requestWithItemID:configuration:]( W5LogItemRequest,  "requestWithItemID:configuration:",  3,  &off_1000E2038));
  objc_msgSend( v4,  "addObject:",  +[W5LogItemRequest requestWithItemID:configuration:]( W5LogItemRequest,  "requestWithItemID:configuration:",  81,  &off_1000E2060));
  id v13 = @"UUID";
  id v14 = v6;
  objc_msgSend( v4,  "addObject:",  +[W5LogItemRequest requestWithItemID:configuration:]( W5LogItemRequest,  "requestWithItemID:configuration:",  25,  +[NSDictionary dictionaryWithObjects:forKeys:count:]( NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v14,  &v13,  1)));
  objc_msgSend( v4,  "addObject:",  +[W5LogItemRequest requestWithItemID:configuration:]( W5LogItemRequest,  "requestWithItemID:configuration:",  69,  &off_1000E2088));
  v11[0] = @"Reason";
  v11[1] = @"NameOverride";
  v12[0] = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@~dps~POST[%@]",  @"WiFiDebug",  -[NSString substringToIndex:](v5, "substringToIndex:", 5LL));
  v12[1] = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"CoreCapture Dump (%@)",  v12[0]);
  objc_msgSend( v4,  "addObject:",  +[W5LogItemRequest requestWithItemID:configuration:]( W5LogItemRequest,  "requestWithItemID:configuration:",  21,  +[NSDictionary dictionaryWithObjects:forKeys:count:]( NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v12,  v11,  2)));
  objc_msgSend( v4,  "addObject:",  +[W5LogItemRequest requestWithItemID:configuration:]( W5LogItemRequest,  "requestWithItemID:configuration:",  4,  0));
  objc_msgSend( v4,  "addObject:",  +[W5LogItemRequest requestWithItemID:configuration:]( W5LogItemRequest,  "requestWithItemID:configuration:",  6,  0));
  objc_msgSend( v4,  "addObject:",  +[W5LogItemRequest requestWithItemID:configuration:]( W5LogItemRequest,  "requestWithItemID:configuration:",  8,  0));
  objc_msgSend( v4,  "addObject:",  +[W5LogItemRequest requestWithItemID:configuration:]( W5LogItemRequest,  "requestWithItemID:configuration:",  69,  &off_1000E20B0));
  objc_msgSend( v4,  "addObject:",  +[W5LogItemRequest requestWithItemID:configuration:]( W5LogItemRequest,  "requestWithItemID:configuration:",  37,  &off_1000E20D8));
  objc_msgSend( v4,  "addObject:",  +[W5LogItemRequest requestWithItemID:configuration:]( W5LogItemRequest,  "requestWithItemID:configuration:",  40,  0));
  v9[0] = @"IncludeMatching";
  v10[0] = +[NSRegularExpression escapedPatternForString:]( &OBJC_CLASS___NSRegularExpression,  "escapedPatternForString:",  -[NSString substringToIndex:](v5, "substringToIndex:", 5LL));
  v9[1] = @"FilterContent";
  v9[2] = @"Compress";
  v10[1] = +[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v8);
  v10[2] = &__kCFBooleanTrue;
  objc_msgSend( v4,  "addObject:",  +[W5LogItemRequest requestWithItemID:configuration:]( W5LogItemRequest,  "requestWithItemID:configuration:",  19,  +[NSDictionary dictionaryWithObjects:forKeys:count:]( NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v10,  v9,  3)));
  return [v4 copy];
}

- (id)__logItemsForWiFiDiagnosticsApp
{
  BOOL v2 = +[NSMutableArray arrayWithArray:]( &OBJC_CLASS___NSMutableArray,  "arrayWithArray:",  -[W5LogManager __logItemsForWiFiDiagnosticsExtensionWithCoreCapturePrefix:]( self,  "__logItemsForWiFiDiagnosticsExtensionWithCoreCapturePrefix:",  +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@~wdapp",  @"WiFiDebug")));
  -[NSMutableArray addObject:]( v2,  "addObject:",  +[W5LogItemRequest requestWithItemID:configuration:]( &OBJC_CLASS___W5LogItemRequest,  "requestWithItemID:configuration:",  14LL,  &off_1000E2100));
  -[NSMutableArray addObject:]( v2,  "addObject:",  +[W5LogItemRequest requestWithItemID:configuration:]( &OBJC_CLASS___W5LogItemRequest,  "requestWithItemID:configuration:",  52LL,  0LL));
  -[NSMutableArray addObject:]( v2,  "addObject:",  +[W5LogItemRequest requestWithItemID:configuration:]( &OBJC_CLASS___W5LogItemRequest,  "requestWithItemID:configuration:",  50LL,  0LL));
  return v2;
}

- (id)__logItemsForWiFiDiagnosticsExtensionWithCoreCapturePrefix:(id)a3
{
  id v4 = +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array");
  unsigned int v18 = -[NSFileManager isExecutableFileAtPath:]( +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"),  "isExecutableFileAtPath:",  @"/sbin/ping");
  id v5 = -[NSUUID UUIDString](+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"), "UUIDString");
  id v6 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@~PRE[%@]",  a3,  -[NSString substringToIndex:](v5, "substringToIndex:", 5LL));
  v46[0] = &off_1000DF0C0;
  v45[0] = @"MaxCount";
  v45[1] = @"IncludeMatching";
  v46[1] = +[NSRegularExpression escapedPatternForString:]( &OBJC_CLASS___NSRegularExpression,  "escapedPatternForString:",  v6);
  v46[2] = &__kCFBooleanTrue;
  v45[2] = @"Compress";
  v45[3] = @"NameOverride";
  v46[3] = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"CoreCapture Collect (%@)",  v6);
  id v7 = +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v46,  v45,  4LL);
  v42[1] = @"NameOverride";
  v43[0] = v6;
  v42[0] = @"Reason";
  v43[1] = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"CoreCapture Dump (%@)",  v6);
  v44[0] = +[W5LogItemRequest requestWithItemID:configuration:]( &OBJC_CLASS___W5LogItemRequest,  "requestWithItemID:configuration:",  21LL,  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v43,  v42,  2LL));
  v44[1] = +[W5LogItemRequest requestWithItemID:configuration:]( &OBJC_CLASS___W5LogItemRequest,  "requestWithItemID:configuration:",  69LL,  &off_1000E2128);
  v44[2] = +[W5LogItemRequest requestWithItemID:configuration:]( &OBJC_CLASS___W5LogItemRequest,  "requestWithItemID:configuration:",  19LL,  v7);
  v40[0] = @"Requests";
  v40[1] = @"RunConcurrent";
  v41[0] = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v44, 3LL);
  v41[1] = &__kCFBooleanFalse;
  v40[2] = @"NameOverride";
  v41[2] = @"CoreCapture (PRE)";
  v17 = +[W5LogItemRequest requestWithItemID:configuration:]( &OBJC_CLASS___W5LogItemRequest,  "requestWithItemID:configuration:",  53LL,  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v41,  v40,  3LL));
  BOOL v8 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@~POST[%@]",  a3,  -[NSString substringToIndex:](v5, "substringToIndex:", 5LL));
  v38[0] = @"MaxAge";
  v38[1] = @"Compress";
  v39[0] = &off_1000DF120;
  v39[1] = &__kCFBooleanTrue;
  v39[2] = &off_1000DF108;
  v38[2] = @"Timeout";
  v38[3] = @"NameOverride";
  v39[3] = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"CoreCapture Collect (24h + %@)",  v8);
  id v9 = +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v39,  v38,  4LL);
  v35[1] = @"NameOverride";
  v36[0] = v8;
  v35[0] = @"Reason";
  v36[1] = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"CoreCapture Dump (%@)",  v8);
  v37[0] = +[W5LogItemRequest requestWithItemID:configuration:]( &OBJC_CLASS___W5LogItemRequest,  "requestWithItemID:configuration:",  21LL,  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v36,  v35,  2LL));
  v37[1] = +[W5LogItemRequest requestWithItemID:configuration:]( &OBJC_CLASS___W5LogItemRequest,  "requestWithItemID:configuration:",  69LL,  &off_1000E2150);
  v37[2] = +[W5LogItemRequest requestWithItemID:configuration:]( &OBJC_CLASS___W5LogItemRequest,  "requestWithItemID:configuration:",  19LL,  v9);
  v33[0] = @"Requests";
  v33[1] = @"RunConcurrent";
  v34[0] = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v37, 3LL);
  v34[1] = &__kCFBooleanFalse;
  v34[2] = @"CoreCapture (POST + 24h)";
  v33[2] = @"NameOverride";
  v33[3] = @"Timeout";
  v34[3] = &off_1000DF108;
  double v16 = +[W5LogItemRequest requestWithItemID:configuration:]( &OBJC_CLASS___W5LogItemRequest,  "requestWithItemID:configuration:",  53LL,  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v34,  v33,  4LL));
  v32[0] = +[W5LogItemRequest requestWithItemID:configuration:]( &OBJC_CLASS___W5LogItemRequest,  "requestWithItemID:configuration:",  39LL,  0LL);
  v32[1] = +[W5LogItemRequest requestWithItemID:configuration:]( &OBJC_CLASS___W5LogItemRequest,  "requestWithItemID:configuration:",  69LL,  &off_1000E2178);
  v32[2] = +[W5LogItemRequest requestWithItemID:configuration:]( &OBJC_CLASS___W5LogItemRequest,  "requestWithItemID:configuration:",  37LL,  &off_1000E21A0);
  v30[0] = @"Requests";
  v30[1] = @"RunConcurrent";
  v31[0] = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v32, 3LL);
  v31[1] = &__kCFBooleanFalse;
  v30[2] = @"NameOverride";
  v30[3] = @"Timeout";
  v31[2] = @"Wi-Fi Logs (24h)";
  v31[3] = &off_1000DF108;
  uint64_t v15 = +[W5LogItemRequest requestWithItemID:configuration:]( &OBJC_CLASS___W5LogItemRequest,  "requestWithItemID:configuration:",  53LL,  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v31,  v30,  4LL));
  double v10 = -[NSUUID UUIDString](+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"), "UUIDString");
  v27 = @"UUID";
  uint64_t v28 = v10;
  v29[0] = +[W5LogItemRequest requestWithItemID:configuration:]( &OBJC_CLASS___W5LogItemRequest,  "requestWithItemID:configuration:",  24LL,  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v28,  &v27,  1LL));
  v29[1] = +[W5LogItemRequest requestWithItemID:configuration:]( &OBJC_CLASS___W5LogItemRequest,  "requestWithItemID:configuration:",  69LL,  &off_1000E21C8);
  v25[0] = @"Requests";
  v25[1] = @"RunConcurrent";
  v26[0] = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v29, 2LL);
  v25[2] = @"NameOverride";
  v26[1] = &__kCFBooleanFalse;
  v26[2] = @"TCP Dump (Begin)";
  uint64_t v11 = +[W5LogItemRequest requestWithItemID:configuration:]( &OBJC_CLASS___W5LogItemRequest,  "requestWithItemID:configuration:",  53LL,  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v26,  v25,  3LL));
  id v22 = @"UUID";
  v23 = v10;
  v24[0] = +[W5LogItemRequest requestWithItemID:configuration:]( &OBJC_CLASS___W5LogItemRequest,  "requestWithItemID:configuration:",  25LL,  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v23,  &v22,  1LL));
  v24[1] = +[W5LogItemRequest requestWithItemID:configuration:]( &OBJC_CLASS___W5LogItemRequest,  "requestWithItemID:configuration:",  69LL,  &off_1000E21F0);
  v20[0] = @"Requests";
  v20[1] = @"RunConcurrent";
  v21[0] = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v24, 2LL);
  v21[1] = &__kCFBooleanFalse;
  v20[2] = @"NameOverride";
  v21[2] = @"TCP Dump (POST)";
  __int128 v12 = +[W5LogItemRequest requestWithItemID:configuration:]( &OBJC_CLASS___W5LogItemRequest,  "requestWithItemID:configuration:",  53LL,  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v21,  v20,  3LL));
  objc_msgSend( v4,  "addObject:",  +[W5LogItemRequest requestWithItemID:configuration:]( W5LogItemRequest,  "requestWithItemID:configuration:",  28,  &off_1000E2218));
  [v4 addObject:v17];
  [v4 addObject:v11];
  objc_msgSend( v4,  "addObject:",  +[W5LogItemRequest requestWithItemID:configuration:]( W5LogItemRequest,  "requestWithItemID:configuration:",  81,  &off_1000E2240));
  objc_msgSend( v4,  "addObject:",  +[W5LogItemRequest requestWithItemID:configuration:]( W5LogItemRequest,  "requestWithItemID:configuration:",  61,  &off_1000E2268));
  objc_msgSend( v4,  "addObject:",  +[W5LogItemRequest requestWithItemID:configuration:]( W5LogItemRequest,  "requestWithItemID:configuration:",  3,  &off_1000E2290));
  if (v18) {
    uint64_t v13 = 2LL;
  }
  else {
    uint64_t v13 = 43LL;
  }
  objc_msgSend( v4,  "addObject:",  +[W5LogItemRequest requestWithItemID:configuration:]( W5LogItemRequest,  "requestWithItemID:configuration:",  v13,  0));
  objc_msgSend( v4,  "addObject:",  -[W5LogManager __connectivityDiagnosticsLogItemWithTimeout:]( self,  "__connectivityDiagnosticsLogItemWithTimeout:",  0.0));
  objc_msgSend( v4,  "addObject:",  -[W5LogManager __configurationDiagnosticsLogItemWithTimeout:]( self,  "__configurationDiagnosticsLogItemWithTimeout:",  0.0));
  objc_msgSend( v4,  "addObject:",  -[W5LogManager __environmentDiagnosticsLogItemWithTimeout:]( self,  "__environmentDiagnosticsLogItemWithTimeout:",  0.0));
  objc_msgSend( v4,  "addObject:",  +[W5LogItemRequest requestWithItemID:configuration:]( W5LogItemRequest,  "requestWithItemID:configuration:",  3,  &off_1000E22B8));
  objc_msgSend( v4,  "addObject:",  +[W5LogItemRequest requestWithItemID:configuration:]( W5LogItemRequest,  "requestWithItemID:configuration:",  62,  &off_1000E22E0));
  objc_msgSend( v4,  "addObject:",  +[W5LogItemRequest requestWithItemID:configuration:]( W5LogItemRequest,  "requestWithItemID:configuration:",  81,  &off_1000E2308));
  [v4 addObject:v12];
  [v4 addObject:v16];
  [v4 addObject:v15];
  objc_msgSend( v4,  "addObject:",  +[W5LogItemRequest requestWithItemID:configuration:]( W5LogItemRequest,  "requestWithItemID:configuration:",  70,  &off_1000E2330));
  objc_msgSend( v4,  "addObject:",  +[W5LogItemRequest requestWithItemID:configuration:]( W5LogItemRequest,  "requestWithItemID:configuration:",  40,  0));
  objc_msgSend( v4,  "addObject:",  +[W5LogItemRequest requestWithItemID:configuration:]( W5LogItemRequest,  "requestWithItemID:configuration:",  30,  0));
  objc_msgSend( v4,  "addObject:",  +[W5LogItemRequest requestWithItemID:configuration:]( W5LogItemRequest,  "requestWithItemID:configuration:",  33,  0));
  objc_msgSend( v4,  "addObject:",  +[W5LogItemRequest requestWithItemID:configuration:]( W5LogItemRequest,  "requestWithItemID:configuration:",  45,  &off_1000E2358));
  objc_msgSend( v4,  "addObject:",  +[W5LogItemRequest requestWithItemID:configuration:]( W5LogItemRequest,  "requestWithItemID:configuration:",  46,  &off_1000E2380));
  objc_msgSend( v4,  "addObject:",  +[W5LogItemRequest requestWithItemID:configuration:]( W5LogItemRequest,  "requestWithItemID:configuration:",  44,  &off_1000E23A8));
  objc_msgSend( v4,  "addObject:",  +[W5LogItemRequest requestWithItemID:configuration:]( W5LogItemRequest,  "requestWithItemID:configuration:",  47,  &off_1000E23D0));
  objc_msgSend( v4,  "addObject:",  +[W5LogItemRequest requestWithItemID:configuration:]( W5LogItemRequest,  "requestWithItemID:configuration:",  6,  0));
  objc_msgSend( v4,  "addObject:",  +[W5LogItemRequest requestWithItemID:configuration:]( W5LogItemRequest,  "requestWithItemID:configuration:",  9,  0));
  objc_msgSend( v4,  "addObject:",  +[W5LogItemRequest requestWithItemID:configuration:]( W5LogItemRequest,  "requestWithItemID:configuration:",  4,  0));
  if (os_variant_has_internal_diagnostics("com.apple.wifivelocity")) {
    objc_msgSend( v4,  "addObject:",  +[W5LogItemRequest requestWithItemID:configuration:]( W5LogItemRequest,  "requestWithItemID:configuration:",  86,  0));
  }
  objc_msgSend( v4,  "addObject:",  +[W5LogItemRequest requestWithItemID:configuration:]( W5LogItemRequest,  "requestWithItemID:configuration:",  7,  0));
  objc_msgSend( v4,  "addObject:",  +[W5LogItemRequest requestWithItemID:configuration:]( W5LogItemRequest,  "requestWithItemID:configuration:",  16,  0));
  objc_msgSend( v4,  "addObject:",  +[W5LogItemRequest requestWithItemID:configuration:]( W5LogItemRequest,  "requestWithItemID:configuration:",  49,  0));
  objc_msgSend( v4,  "addObject:",  +[W5LogItemRequest requestWithItemID:configuration:]( W5LogItemRequest,  "requestWithItemID:configuration:",  48,  0));
  objc_msgSend( v4,  "addObject:",  +[W5LogItemRequest requestWithItemID:configuration:]( W5LogItemRequest,  "requestWithItemID:configuration:",  58,  0));
  objc_msgSend( v4,  "addObject:",  +[W5LogItemRequest requestWithItemID:configuration:]( W5LogItemRequest,  "requestWithItemID:configuration:",  57,  0));
  objc_msgSend( v4,  "addObject:",  +[W5LogItemRequest requestWithItemID:configuration:]( W5LogItemRequest,  "requestWithItemID:configuration:",  5,  &off_1000E23F8));
  objc_msgSend( v4,  "addObject:",  +[W5LogItemRequest requestWithItemID:configuration:]( W5LogItemRequest,  "requestWithItemID:configuration:",  51,  0));
  objc_msgSend( v4,  "addObject:",  +[W5LogItemRequest requestWithItemID:configuration:]( W5LogItemRequest,  "requestWithItemID:configuration:",  18,  0));
  objc_msgSend( v4,  "addObject:",  +[W5LogItemRequest requestWithItemID:configuration:]( W5LogItemRequest,  "requestWithItemID:configuration:",  74,  0));
  objc_msgSend( v4,  "addObject:",  +[W5LogItemRequest requestWithItemID:configuration:]( W5LogItemRequest,  "requestWithItemID:configuration:",  78,  &off_1000E2420));
  objc_msgSend( v4,  "addObject:",  +[W5LogItemRequest requestWithItemID:configuration:]( W5LogItemRequest,  "requestWithItemID:configuration:",  80,  0));
  objc_msgSend( v4,  "addObject:",  +[W5LogItemRequest requestWithItemID:configuration:]( W5LogItemRequest,  "requestWithItemID:configuration:",  85,  &off_1000E2448));
  objc_msgSend( v4,  "addObject:",  +[W5LogItemRequest requestWithItemID:configuration:]( W5LogItemRequest,  "requestWithItemID:configuration:",  84,  &off_1000E2470));
  objc_msgSend( v4,  "addObject:",  +[W5LogItemRequest requestWithItemID:configuration:]( W5LogItemRequest,  "requestWithItemID:configuration:",  88,  &off_1000E2498));
  objc_msgSend( v4,  "addObject:",  +[W5LogItemRequest requestWithItemID:configuration:]( W5LogItemRequest,  "requestWithItemID:configuration:",  87,  0));
  return v4;
}

- (id)__logItemsForFeedbackAssistant
{
  return -[W5LogManager __logItemsForWiFiDiagnosticsExtensionWithCoreCapturePrefix:]( self,  "__logItemsForWiFiDiagnosticsExtensionWithCoreCapturePrefix:",  +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@~fba",  @"WiFiDebug"));
}

- (id)__logItemsForTapToRadar
{
  return -[W5LogManager __logItemsForWiFiDiagnosticsExtensionWithCoreCapturePrefix:]( self,  "__logItemsForWiFiDiagnosticsExtensionWithCoreCapturePrefix:",  +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@~ttr",  @"WiFiDebug"));
}

- (id)__logItemsForInternalWiFiSettings
{
  return -[W5LogManager __logItemsForWiFiDiagnosticsExtensionWithCoreCapturePrefix:]( self,  "__logItemsForWiFiDiagnosticsExtensionWithCoreCapturePrefix:",  +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@~settings",  @"WiFiDebug"));
}

- (id)__concurrentConnectivityDiagnosticsTest
{
  id v2 = objc_alloc_init(&OBJC_CLASS___W5DiagnosticsTestRequest);
  [v2 setTestID:53];
  unsigned int v3 = -[NSFileManager isExecutableFileAtPath:]( +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"),  "isExecutableFileAtPath:",  @"/sbin/ping");
  unsigned int v4 = -[NSFileManager isExecutableFileAtPath:]( +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"),  "isExecutableFileAtPath:",  @"/sbin/ping6");
  if (v3) {
    uint64_t v5 = 1LL;
  }
  else {
    uint64_t v5 = 3LL;
  }
  if (v3) {
    uint64_t v6 = 4LL;
  }
  else {
    uint64_t v6 = 6LL;
  }
  id v7 = +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array");
  objc_msgSend( v7,  "addObject:",  +[W5DiagnosticsTestRequest requestWithTestID:configuration:]( W5DiagnosticsTestRequest,  "requestWithTestID:configuration:",  v5,  &off_1000E24C0));
  objc_msgSend( v7,  "addObject:",  +[W5DiagnosticsTestRequest requestWithTestID:configuration:]( W5DiagnosticsTestRequest,  "requestWithTestID:configuration:",  v5,  &off_1000E24E8));
  objc_msgSend( v7,  "addObject:",  +[W5DiagnosticsTestRequest requestWithTestID:configuration:]( W5DiagnosticsTestRequest,  "requestWithTestID:configuration:",  v5,  &off_1000E2510));
  objc_msgSend( v7,  "addObject:",  +[W5DiagnosticsTestRequest requestWithTestID:configuration:]( W5DiagnosticsTestRequest,  "requestWithTestID:configuration:",  v5,  &off_1000E2538));
  objc_msgSend( v7,  "addObject:",  +[W5DiagnosticsTestRequest requestWithTestID:configuration:]( W5DiagnosticsTestRequest,  "requestWithTestID:configuration:",  v6,  &off_1000E2560));
  objc_msgSend( v7,  "addObject:",  +[W5DiagnosticsTestRequest requestWithTestID:configuration:]( W5DiagnosticsTestRequest,  "requestWithTestID:configuration:",  v6,  &off_1000E2588));
  if (v3)
  {
    objc_msgSend( v7,  "addObject:",  +[W5DiagnosticsTestRequest requestWithTestID:configuration:]( W5DiagnosticsTestRequest,  "requestWithTestID:configuration:",  1,  &off_1000E25B0));
    objc_msgSend( v7,  "addObject:",  +[W5DiagnosticsTestRequest requestWithTestID:configuration:]( W5DiagnosticsTestRequest,  "requestWithTestID:configuration:",  1,  &off_1000E25D8));
    objc_msgSend( v7,  "addObject:",  +[W5DiagnosticsTestRequest requestWithTestID:configuration:]( W5DiagnosticsTestRequest,  "requestWithTestID:configuration:",  1,  &off_1000E2600));
    objc_msgSend( v7,  "addObject:",  +[W5DiagnosticsTestRequest requestWithTestID:configuration:]( W5DiagnosticsTestRequest,  "requestWithTestID:configuration:",  1,  &off_1000E2628));
  }

  if (v4) {
    objc_msgSend( v7,  "addObject:",  +[W5DiagnosticsTestRequest requestWithTestID:configuration:]( W5DiagnosticsTestRequest,  "requestWithTestID:configuration:",  59,  &off_1000E2650));
  }
  objc_msgSend( v7,  "addObject:",  +[W5DiagnosticsTestRequest requestWithTestID:configuration:]( W5DiagnosticsTestRequest,  "requestWithTestID:configuration:",  7,  0));
  objc_msgSend( v7,  "addObject:",  +[W5DiagnosticsTestRequest requestWithTestID:configuration:]( W5DiagnosticsTestRequest,  "requestWithTestID:configuration:",  9,  0));
  if (-[NSFileManager isExecutableFileAtPath:]( +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"),  "isExecutableFileAtPath:",  @"/usr/local/bin/curl"))
  {
    uint64_t v8 = 54LL;
  }

  else
  {
    uint64_t v8 = 11LL;
  }

  objc_msgSend( v7,  "addObject:",  +[W5DiagnosticsTestRequest requestWithTestID:configuration:]( W5DiagnosticsTestRequest,  "requestWithTestID:configuration:",  v8,  0));
  v10[0] = @"ConcurrentRequests";
  v10[1] = @"NameOverride";
  v11[0] = v7;
  v11[1] = @"Connectivity (Concurrent)";
  objc_msgSend( v2,  "setConfiguration:",  +[NSDictionary dictionaryWithObjects:forKeys:count:]( NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v11,  v10,  2));
  return v2;
}

- (id)__configurationDiagnosticsLogItemWithTimeout:(double)a3
{
  id v4 = +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array");
  id v5 = +[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary");
  [v5 setObject:&__kCFBooleanTrue forKeyedSubscript:@"UseCachedStatus"];
  [v5 setObject:&__kCFBooleanTrue forKeyedSubscript:@"UseCachedPNL"];
  objc_msgSend( v4,  "addObject:",  +[W5DiagnosticsTestRequest requestWithTestID:configuration:]( W5DiagnosticsTestRequest,  "requestWithTestID:configuration:",  52,  v5));
  objc_msgSend( v4,  "addObject:",  +[W5DiagnosticsTestRequest requestWithTestID:configuration:]( W5DiagnosticsTestRequest,  "requestWithTestID:configuration:",  12,  v5));
  objc_msgSend( v4,  "addObject:",  +[W5DiagnosticsTestRequest requestWithTestID:configuration:]( W5DiagnosticsTestRequest,  "requestWithTestID:configuration:",  13,  v5));
  objc_msgSend( v4,  "addObject:",  +[W5DiagnosticsTestRequest requestWithTestID:configuration:]( W5DiagnosticsTestRequest,  "requestWithTestID:configuration:",  57,  v5));
  objc_msgSend( v4,  "addObject:",  +[W5DiagnosticsTestRequest requestWithTestID:configuration:]( W5DiagnosticsTestRequest,  "requestWithTestID:configuration:",  58,  v5));
  objc_msgSend( v4,  "addObject:",  +[W5DiagnosticsTestRequest requestWithTestID:configuration:]( W5DiagnosticsTestRequest,  "requestWithTestID:configuration:",  14,  v5));
  objc_msgSend( v4,  "addObject:",  +[W5DiagnosticsTestRequest requestWithTestID:configuration:]( W5DiagnosticsTestRequest,  "requestWithTestID:configuration:",  15,  v5));
  objc_msgSend( v4,  "addObject:",  +[W5DiagnosticsTestRequest requestWithTestID:configuration:]( W5DiagnosticsTestRequest,  "requestWithTestID:configuration:",  16,  v5));
  objc_msgSend( v4,  "addObject:",  +[W5DiagnosticsTestRequest requestWithTestID:configuration:]( W5DiagnosticsTestRequest,  "requestWithTestID:configuration:",  17,  v5));
  objc_msgSend( v4,  "addObject:",  +[W5DiagnosticsTestRequest requestWithTestID:configuration:]( W5DiagnosticsTestRequest,  "requestWithTestID:configuration:",  18,  v5));
  objc_msgSend( v4,  "addObject:",  +[W5DiagnosticsTestRequest requestWithTestID:configuration:]( W5DiagnosticsTestRequest,  "requestWithTestID:configuration:",  19,  v5));
  objc_msgSend( v4,  "addObject:",  +[W5DiagnosticsTestRequest requestWithTestID:configuration:]( W5DiagnosticsTestRequest,  "requestWithTestID:configuration:",  20,  v5));
  objc_msgSend( v4,  "addObject:",  +[W5DiagnosticsTestRequest requestWithTestID:configuration:]( W5DiagnosticsTestRequest,  "requestWithTestID:configuration:",  21,  v5));
  objc_msgSend( v4,  "addObject:",  +[W5DiagnosticsTestRequest requestWithTestID:configuration:]( W5DiagnosticsTestRequest,  "requestWithTestID:configuration:",  22,  v5));
  objc_msgSend( v4,  "addObject:",  +[W5DiagnosticsTestRequest requestWithTestID:configuration:]( W5DiagnosticsTestRequest,  "requestWithTestID:configuration:",  51,  v5));
  objc_msgSend( v4,  "addObject:",  +[W5DiagnosticsTestRequest requestWithTestID:configuration:]( W5DiagnosticsTestRequest,  "requestWithTestID:configuration:",  32,  v5));
  objc_msgSend( v4,  "addObject:",  +[W5DiagnosticsTestRequest requestWithTestID:configuration:]( W5DiagnosticsTestRequest,  "requestWithTestID:configuration:",  34,  v5));
  objc_msgSend( v4,  "addObject:",  +[W5DiagnosticsTestRequest requestWithTestID:configuration:]( W5DiagnosticsTestRequest,  "requestWithTestID:configuration:",  35,  v5));
  objc_msgSend( v4,  "addObject:",  +[W5DiagnosticsTestRequest requestWithTestID:configuration:]( W5DiagnosticsTestRequest,  "requestWithTestID:configuration:",  38,  v5));
  objc_msgSend( v4,  "addObject:",  +[W5DiagnosticsTestRequest requestWithTestID:configuration:]( W5DiagnosticsTestRequest,  "requestWithTestID:configuration:",  40,  v5));
  objc_msgSend( v4,  "addObject:",  +[W5DiagnosticsTestRequest requestWithTestID:configuration:]( W5DiagnosticsTestRequest,  "requestWithTestID:configuration:",  39,  v5));
  objc_msgSend( v4,  "addObject:",  +[W5DiagnosticsTestRequest requestWithTestID:configuration:]( W5DiagnosticsTestRequest,  "requestWithTestID:configuration:",  41,  v5));
  objc_msgSend( v4,  "addObject:",  +[W5DiagnosticsTestRequest requestWithTestID:configuration:]( W5DiagnosticsTestRequest,  "requestWithTestID:configuration:",  44,  v5));
  objc_msgSend( v4,  "addObject:",  +[W5DiagnosticsTestRequest requestWithTestID:configuration:]( W5DiagnosticsTestRequest,  "requestWithTestID:configuration:",  45,  v5));
  objc_msgSend( v4,  "addObject:",  +[W5DiagnosticsTestRequest requestWithTestID:configuration:]( W5DiagnosticsTestRequest,  "requestWithTestID:configuration:",  33,  v5));
  objc_msgSend( v4,  "addObject:",  +[W5DiagnosticsTestRequest requestWithTestID:configuration:]( W5DiagnosticsTestRequest,  "requestWithTestID:configuration:",  42,  v5));
  objc_msgSend( v4,  "addObject:",  +[W5DiagnosticsTestRequest requestWithTestID:configuration:]( W5DiagnosticsTestRequest,  "requestWithTestID:configuration:",  46,  v5));
  objc_msgSend( v4,  "addObject:",  +[W5DiagnosticsTestRequest requestWithTestID:configuration:]( W5DiagnosticsTestRequest,  "requestWithTestID:configuration:",  43,  v5));
  v8[0] = v4;
  v7[0] = @"DiagnosticsTests";
  v7[1] = @"Timeout";
  v8[1] = +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", a3);
  v8[2] = @"WiFi Conf Diagnostics";
  v7[2] = @"NameOverride";
  v7[3] = @"FileNameOverride";
  v8[3] = @"diagnostics-configuration.txt";
  return +[W5LogItemRequest requestWithItemID:configuration:]( &OBJC_CLASS___W5LogItemRequest,  "requestWithItemID:configuration:",  26LL,  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v8,  v7,  4LL));
}

- (id)__environmentDiagnosticsLogItemWithTimeout:(double)a3
{
  id v4 = +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array");
  id v5 = +[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary");
  [v5 setObject:&__kCFBooleanTrue forKeyedSubscript:@"UseCachedStatus"];
  [v5 setObject:&__kCFBooleanTrue forKeyedSubscript:@"UseCachedPNL"];
  [v5 setObject:&off_1000DF2D0 forKeyedSubscript:@"MaxScanCacheAge"];
  objc_msgSend( v4,  "addObject:",  +[W5DiagnosticsTestRequest requestWithTestID:configuration:]( W5DiagnosticsTestRequest,  "requestWithTestID:configuration:",  24,  v5));
  objc_msgSend( v4,  "addObject:",  +[W5DiagnosticsTestRequest requestWithTestID:configuration:]( W5DiagnosticsTestRequest,  "requestWithTestID:configuration:",  27,  v5));
  objc_msgSend( v4,  "addObject:",  +[W5DiagnosticsTestRequest requestWithTestID:configuration:]( W5DiagnosticsTestRequest,  "requestWithTestID:configuration:",  28,  v5));
  objc_msgSend( v4,  "addObject:",  +[W5DiagnosticsTestRequest requestWithTestID:configuration:]( W5DiagnosticsTestRequest,  "requestWithTestID:configuration:",  30,  v5));
  objc_msgSend( v4,  "addObject:",  +[W5DiagnosticsTestRequest requestWithTestID:configuration:]( W5DiagnosticsTestRequest,  "requestWithTestID:configuration:",  31,  v5));
  objc_msgSend( v4,  "addObject:",  +[W5DiagnosticsTestRequest requestWithTestID:configuration:]( W5DiagnosticsTestRequest,  "requestWithTestID:configuration:",  36,  v5));
  objc_msgSend( v4,  "addObject:",  +[W5DiagnosticsTestRequest requestWithTestID:configuration:]( W5DiagnosticsTestRequest,  "requestWithTestID:configuration:",  37,  v5));
  v8[0] = v4;
  v7[0] = @"DiagnosticsTests";
  v7[1] = @"Timeout";
  v8[1] = +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", a3);
  v8[2] = @"WiFi Env Diagnostics";
  v7[2] = @"NameOverride";
  v7[3] = @"FileNameOverride";
  v8[3] = @"diagnostics-environment.txt";
  return +[W5LogItemRequest requestWithItemID:configuration:]( &OBJC_CLASS___W5LogItemRequest,  "requestWithItemID:configuration:",  26LL,  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v8,  v7,  4LL));
}

- (id)__connectivityDiagnosticsLogItemWithTimeout:(double)a3
{
  id v4 = +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array");
  unsigned int v5 = -[NSFileManager isExecutableFileAtPath:]( +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"),  "isExecutableFileAtPath:",  @"/sbin/ping");
  unsigned int v6 = -[NSFileManager isExecutableFileAtPath:]( +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"),  "isExecutableFileAtPath:",  @"/sbin/ping6");
  if (v5) {
    uint64_t v7 = 1LL;
  }
  else {
    uint64_t v7 = 3LL;
  }
  if (v5) {
    uint64_t v8 = 4LL;
  }
  else {
    uint64_t v8 = 6LL;
  }
  objc_msgSend( v4,  "addObject:",  +[W5DiagnosticsTestRequest requestWithTestID:configuration:]( W5DiagnosticsTestRequest,  "requestWithTestID:configuration:",  v7,  &off_1000E2678));
  objc_msgSend( v4,  "addObject:",  +[W5DiagnosticsTestRequest requestWithTestID:configuration:]( W5DiagnosticsTestRequest,  "requestWithTestID:configuration:",  v7,  &off_1000E26A0));
  objc_msgSend( v4,  "addObject:",  +[W5DiagnosticsTestRequest requestWithTestID:configuration:]( W5DiagnosticsTestRequest,  "requestWithTestID:configuration:",  v7,  &off_1000E26C8));
  objc_msgSend( v4,  "addObject:",  +[W5DiagnosticsTestRequest requestWithTestID:configuration:]( W5DiagnosticsTestRequest,  "requestWithTestID:configuration:",  v7,  &off_1000E26F0));
  objc_msgSend( v4,  "addObject:",  +[W5DiagnosticsTestRequest requestWithTestID:configuration:]( W5DiagnosticsTestRequest,  "requestWithTestID:configuration:",  v8,  &off_1000E2718));
  objc_msgSend( v4,  "addObject:",  +[W5DiagnosticsTestRequest requestWithTestID:configuration:]( W5DiagnosticsTestRequest,  "requestWithTestID:configuration:",  v8,  &off_1000E2740));
  if (v5)
  {
    objc_msgSend( v4,  "addObject:",  +[W5DiagnosticsTestRequest requestWithTestID:configuration:]( W5DiagnosticsTestRequest,  "requestWithTestID:configuration:",  1,  &off_1000E2768));
    objc_msgSend( v4,  "addObject:",  +[W5DiagnosticsTestRequest requestWithTestID:configuration:]( W5DiagnosticsTestRequest,  "requestWithTestID:configuration:",  1,  &off_1000E2790));
    objc_msgSend( v4,  "addObject:",  +[W5DiagnosticsTestRequest requestWithTestID:configuration:]( W5DiagnosticsTestRequest,  "requestWithTestID:configuration:",  1,  &off_1000E27B8));
    objc_msgSend( v4,  "addObject:",  +[W5DiagnosticsTestRequest requestWithTestID:configuration:]( W5DiagnosticsTestRequest,  "requestWithTestID:configuration:",  1,  &off_1000E27E0));
  }

  if (v6) {
    objc_msgSend( v4,  "addObject:",  +[W5DiagnosticsTestRequest requestWithTestID:configuration:]( W5DiagnosticsTestRequest,  "requestWithTestID:configuration:",  59,  &off_1000E2808));
  }
  objc_msgSend( v4,  "addObject:",  +[W5DiagnosticsTestRequest requestWithTestID:configuration:]( W5DiagnosticsTestRequest,  "requestWithTestID:configuration:",  7,  0));
  objc_msgSend( v4,  "addObject:",  +[W5DiagnosticsTestRequest requestWithTestID:configuration:]( W5DiagnosticsTestRequest,  "requestWithTestID:configuration:",  9,  0));
  if (-[NSFileManager isExecutableFileAtPath:]( +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"),  "isExecutableFileAtPath:",  @"/usr/local/bin/curl"))
  {
    uint64_t v9 = 54LL;
  }

  else
  {
    uint64_t v9 = 11LL;
  }

  objc_msgSend( v4,  "addObject:",  +[W5DiagnosticsTestRequest requestWithTestID:configuration:]( W5DiagnosticsTestRequest,  "requestWithTestID:configuration:",  v9,  0));
  objc_msgSend( v4,  "addObject:",  +[W5DiagnosticsTestRequest requestWithTestID:configuration:]( W5DiagnosticsTestRequest,  "requestWithTestID:configuration:",  8,  0));
  objc_msgSend( v4,  "addObject:",  +[W5DiagnosticsTestRequest requestWithTestID:configuration:]( W5DiagnosticsTestRequest,  "requestWithTestID:configuration:",  49,  0));
  v12[0] = v4;
  v11[0] = @"DiagnosticsTests";
  v11[1] = @"Timeout";
  v12[1] = +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", a3);
  void v12[2] = @"WiFi Conn Diagnostics";
  void v11[2] = @"NameOverride";
  v11[3] = @"FileNameOverride";
  void v12[3] = @"diagnostics-connectivity.txt";
  return +[W5LogItemRequest requestWithItemID:configuration:]( &OBJC_CLASS___W5LogItemRequest,  "requestWithItemID:configuration:",  26LL,  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v12,  v11,  4LL));
}

- (id)__fastConnectivityDiagnosticsLogItemWithTimeout:(double)a3
{
  v6[0] = @"DiagnosticsTests";
  id v5 = -[W5LogManager __concurrentConnectivityDiagnosticsTest](self, "__concurrentConnectivityDiagnosticsTest");
  v7[0] = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v5, 1LL);
  v6[1] = @"Timeout";
  v7[1] = +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", a3);
  v7[2] = @"WiFi Conn Diagnostics";
  v6[2] = @"NameOverride";
  v6[3] = @"FileNameOverride";
  v7[3] = @"diagnostics-connectivity.txt";
  return +[W5LogItemRequest requestWithItemID:configuration:]( &OBJC_CLASS___W5LogItemRequest,  "requestWithItemID:configuration:",  26LL,  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v7,  v6,  4LL));
}

- (id)__logItemsForSysdiagnoseWithFilteredContent:(BOOL)a3 useMegaWiFiProfileLimits:(BOOL)a4 timeout:(int64_t)a5
{
  BOOL v43 = a3;
  id v41 = +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array");
  v44 = -[NSUUID UUIDString](+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"), "UUIDString");
  BOOL v34 = a5 > 35999 && a4;
  uint64_t v8 = 4000LL;
  if (v34) {
    uint64_t v8 = 6000LL;
  }
  uint64_t v40 = v8;
  if (a5 > 35999 && a4) {
    unint64_t v9 = 24000LL;
  }
  else {
    unint64_t v9 = 7000LL;
  }
  uint64_t v10 = 2000LL;
  if (a5 > 35999 && a4) {
    uint64_t v10 = 3000LL;
  }
  uint64_t v33 = v10;
  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  double v12 = v11;
  uint64_t v42 = self;
  -[NSDate timeIntervalSinceReferenceDate]( -[W5LogItemRequestInternal addedAt](self->_activeRequest, "addedAt"),  "timeIntervalSinceReferenceDate");
  unint64_t v14 = (unint64_t)(v12 - v13);
  double v15 = (double)v9;
  unint64_t v16 = (unint64_t)v15;
  if (v9 == (unint64_t)v15)
  {
    unint64_t v35 = v9;
  }

  else
  {
    v17 = (os_log_s *)sub_10008C90C();
    unint64_t v35 = v16;
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      int v95 = 134218752;
      unint64_t v96 = v9;
      __int16 v97 = 2048;
      unint64_t v98 = v16;
      __int16 v99 = 2048;
      int64_t v100 = a5;
      __int16 v101 = 2048;
      unint64_t v102 = v14;
      _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v17,  0LL,  "[wifivelocity] Adjusted CoreCapture delay (%lums --> %lums) based on specified timeout (%lums) and time elapsed since request was added (%lus)",  &v95,  42,  v29,  v31);
    }
  }

  unsigned int v18 = -[NSUUID UUIDString](+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"), "UUIDString");
  v92[0] = @"Reason";
  v92[1] = @"NameOverride";
  v93[0] = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@~sysdiag~PRE[%@]",  @"WiFiDebug",  -[NSString substringToIndex:](v18, "substringToIndex:", 5LL));
  uint64_t v38 = v93[0];
  v93[1] = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"CoreCapture Dump (%@)",  v93[0]);
  v94 = +[W5LogItemRequest requestWithItemID:configuration:]( &OBJC_CLASS___W5LogItemRequest,  "requestWithItemID:configuration:",  21LL,  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v93,  v92,  2LL));
  v90[0] = @"Requests";
  v90[1] = @"RunConcurrent";
  v91[0] = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v94, 1LL);
  v91[1] = &__kCFBooleanFalse;
  v90[2] = @"NameOverride";
  v91[2] = @"CoreCapture Dump (PRE)";
  id v32 = +[W5LogItemRequest requestWithItemID:configuration:]( &OBJC_CLASS___W5LogItemRequest,  "requestWithItemID:configuration:",  53LL,  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v91,  v90,  3LL));
  v87 = @"UUID";
  __int128 v37 = -[NSUUID UUIDString](+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"), "UUIDString");
  v88 = v37;
  v89[0] = +[W5LogItemRequest requestWithItemID:configuration:]( &OBJC_CLASS___W5LogItemRequest,  "requestWithItemID:configuration:",  24LL,  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v88,  &v87,  1LL));
  v89[1] = +[W5LogItemRequest requestWithItemID:configuration:]( &OBJC_CLASS___W5LogItemRequest,  "requestWithItemID:configuration:",  69LL,  &off_1000E2830);
  v85[0] = @"Requests";
  v85[1] = @"RunConcurrent";
  v86[0] = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v89, 2LL);
  v86[1] = &__kCFBooleanFalse;
  v85[2] = @"NameOverride";
  v86[2] = @"TCP Dump (PRE)";
  uint64_t v30 = +[W5LogItemRequest requestWithItemID:configuration:]( &OBJC_CLASS___W5LogItemRequest,  "requestWithItemID:configuration:",  53LL,  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v86,  v85,  3LL));
  v84[0] = +[W5LogItemRequest requestWithItemID:configuration:]( &OBJC_CLASS___W5LogItemRequest,  "requestWithItemID:configuration:",  39LL,  0LL);
  v84[1] = +[W5LogItemRequest requestWithItemID:configuration:]( &OBJC_CLASS___W5LogItemRequest,  "requestWithItemID:configuration:",  57LL,  0LL);
  v84[2] = +[W5LogItemRequest requestWithItemID:configuration:]( &OBJC_CLASS___W5LogItemRequest,  "requestWithItemID:configuration:",  45LL,  &off_1000E2858);
  v84[3] = +[W5LogItemRequest requestWithItemID:configuration:]( &OBJC_CLASS___W5LogItemRequest,  "requestWithItemID:configuration:",  46LL,  &off_1000E2880);
  v84[4] = -[W5LogManager __configurationDiagnosticsLogItemWithTimeout:]( v42,  "__configurationDiagnosticsLogItemWithTimeout:",  0.0);
  v84[5] = +[W5LogItemRequest requestWithItemID:configuration:]( &OBJC_CLASS___W5LogItemRequest,  "requestWithItemID:configuration:",  48LL,  0LL);
  v84[6] = +[W5LogItemRequest requestWithItemID:configuration:]( &OBJC_CLASS___W5LogItemRequest,  "requestWithItemID:configuration:",  28LL,  &off_1000E28A8);
  v84[7] = +[W5LogItemRequest requestWithItemID:configuration:]( &OBJC_CLASS___W5LogItemRequest,  "requestWithItemID:configuration:",  80LL,  0LL);
  v84[8] = +[W5LogItemRequest requestWithItemID:configuration:]( &OBJC_CLASS___W5LogItemRequest,  "requestWithItemID:configuration:",  85LL,  &off_1000E28D0);
  v84[9] = +[W5LogItemRequest requestWithItemID:configuration:]( &OBJC_CLASS___W5LogItemRequest,  "requestWithItemID:configuration:",  84LL,  &off_1000E28F8);
  v84[10] = +[W5LogItemRequest requestWithItemID:configuration:]( &OBJC_CLASS___W5LogItemRequest,  "requestWithItemID:configuration:",  88LL,  &off_1000E2920);
  v82[0] = @"Requests";
  v82[1] = @"RunConcurrent";
  v83[0] = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v84, 11LL);
  v83[1] = &__kCFBooleanFalse;
  v82[2] = @"NameOverride";
  v83[2] = @"Wi-Fi Status / Scan";
  double v19 = +[W5LogItemRequest requestWithItemID:configuration:]( &OBJC_CLASS___W5LogItemRequest,  "requestWithItemID:configuration:",  53LL,  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v83,  v82,  3LL));
  if (v34) {
    uint64_t v20 = 30000000LL;
  }
  else {
    uint64_t v20 = 4000000LL;
  }
  v81[0] = &off_1000DF120;
  v80[0] = @"MaxAge";
  v80[1] = @"MaxSize";
  v81[1] = +[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v20);
  v80[2] = @"FilterContent";
  v81[2] = +[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v43);
  v81[3] = &__kCFBooleanTrue;
  v80[3] = @"Compress";
  v80[4] = @"ExcludeMatching";
  v80[5] = @"NameOverride";
  v81[4] = +[NSRegularExpression escapedPatternForString:]( &OBJC_CLASS___NSRegularExpression,  "escapedPatternForString:",  -[NSString substringToIndex:](v18, "substringToIndex:", 5LL));
  v81[5] = @"CoreCapture Collect (24h)";
  id v21 = +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v81,  v80,  6LL);
  v79[0] = v32;
  v79[1] = v19;
  v79[2] = +[W5LogItemRequest requestWithItemID:configuration:]( &OBJC_CLASS___W5LogItemRequest,  "requestWithItemID:configuration:",  61LL,  &off_1000E2948);
  v79[3] = +[W5LogItemRequest requestWithItemID:configuration:]( &OBJC_CLASS___W5LogItemRequest,  "requestWithItemID:configuration:",  4LL,  0LL);
  v79[4] = +[W5LogItemRequest requestWithItemID:configuration:]( &OBJC_CLASS___W5LogItemRequest,  "requestWithItemID:configuration:",  7LL,  0LL);
  v79[5] = +[W5LogItemRequest requestWithItemID:configuration:]( &OBJC_CLASS___W5LogItemRequest,  "requestWithItemID:configuration:",  33LL,  0LL);
  v79[6] = +[W5LogItemRequest requestWithItemID:configuration:]( &OBJC_CLASS___W5LogItemRequest,  "requestWithItemID:configuration:",  58LL,  0LL);
  v79[7] = +[W5LogItemRequest requestWithItemID:configuration:]( &OBJC_CLASS___W5LogItemRequest,  "requestWithItemID:configuration:",  47LL,  &off_1000E2970);
  v79[8] = +[W5LogItemRequest requestWithItemID:configuration:]( &OBJC_CLASS___W5LogItemRequest,  "requestWithItemID:configuration:",  44LL,  &off_1000E2998);
  v79[9] = +[W5LogItemRequest requestWithItemID:configuration:]( &OBJC_CLASS___W5LogItemRequest,  "requestWithItemID:configuration:",  19LL,  v21);
  v79[10] = +[W5LogItemRequest requestWithItemID:configuration:]( &OBJC_CLASS___W5LogItemRequest,  "requestWithItemID:configuration:",  70LL,  &off_1000E29C0);
  id v22 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v79, 11LL);
  if (!v43) {
    id v22 = -[NSArray arrayByAddingObject:](v22, "arrayByAddingObject:", v30);
  }
  v77[0] = @"Requests";
  v77[1] = @"RunConcurrent";
  v78[0] = v22;
  v78[1] = &__kCFBooleanTrue;
  v78[2] = v44;
  v77[2] = @"AddLeewayUUID";
  v77[3] = @"Timeout";
  v77[4] = @"NameOverride";
  v78[3] = +[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", v33);
  v78[4] = @"Connectivity (PRE)";
  objc_msgSend( v41,  "addObject:",  +[W5LogItemRequest requestWithItemID:configuration:]( W5LogItemRequest,  "requestWithItemID:configuration:",  53,  +[NSDictionary dictionaryWithObjects:forKeys:count:]( NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v78,  v77,  5)));
  v76[0] = +[W5LogItemRequest requestWithItemID:configuration:]( &OBJC_CLASS___W5LogItemRequest,  "requestWithItemID:configuration:",  81LL,  &off_1000E29E8);
  v76[1] = +[W5LogItemRequest requestWithItemID:configuration:]( &OBJC_CLASS___W5LogItemRequest,  "requestWithItemID:configuration:",  3LL,  &off_1000E2A10);
  v76[2] = -[W5LogManager __fastConnectivityDiagnosticsLogItemWithTimeout:]( v42,  "__fastConnectivityDiagnosticsLogItemWithTimeout:",  2000.0);
  v76[3] = +[W5LogItemRequest requestWithItemID:configuration:]( &OBJC_CLASS___W5LogItemRequest,  "requestWithItemID:configuration:",  3LL,  &off_1000E2A38);
  v76[4] = +[W5LogItemRequest requestWithItemID:configuration:]( &OBJC_CLASS___W5LogItemRequest,  "requestWithItemID:configuration:",  81LL,  &off_1000E2A60);
  v76[5] = +[W5LogItemRequest requestWithItemID:configuration:]( &OBJC_CLASS___W5LogItemRequest,  "requestWithItemID:configuration:",  62LL,  &off_1000E2A88);
  v74[0] = @"Requests";
  v74[1] = @"RunConcurrent";
  v75[0] = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v76, 6LL);
  v75[1] = &__kCFBooleanFalse;
  v75[2] = v44;
  v74[2] = @"AddLeewayUUID";
  v74[3] = @"Timeout";
  v74[4] = @"NameOverride";
  v75[3] = +[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", v35);
  v75[4] = @"Connectivity (DIAG)";
  objc_msgSend( v41,  "addObject:",  +[W5LogItemRequest requestWithItemID:configuration:]( W5LogItemRequest,  "requestWithItemID:configuration:",  53,  +[NSDictionary dictionaryWithObjects:forKeys:count:]( NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v75,  v74,  5)));
  v23 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@~sysdiag~POST[%@]",  @"WiFiDebug",  -[NSString substringToIndex:](v18, "substringToIndex:", 5LL));
  v72[0] = @"IncludeMatching";
  v73[0] = +[NSRegularExpression escapedPatternForString:]( &OBJC_CLASS___NSRegularExpression,  "escapedPatternForString:",  v23);
  v72[1] = @"FilterContent";
  v73[1] = +[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v43);
  v73[2] = &__kCFBooleanTrue;
  v72[2] = @"Compress";
  v72[3] = @"NameOverride";
  v73[3] = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"CoreCapture Collect (%@)",  v23);
  id v24 = +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v73,  v72,  4LL);
  v70[0] = v23;
  v69[0] = @"Reason";
  v69[1] = @"NameOverride";
  v70[1] = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"CoreCapture Dump (%@)",  v23);
  v71[0] = +[W5LogItemRequest requestWithItemID:configuration:]( &OBJC_CLASS___W5LogItemRequest,  "requestWithItemID:configuration:",  21LL,  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v70,  v69,  2LL));
  v67 = @"Delay";
  v68 = +[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", v40 - 400);
  v71[1] = +[W5LogItemRequest requestWithItemID:configuration:]( &OBJC_CLASS___W5LogItemRequest,  "requestWithItemID:configuration:",  69LL,  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v68,  &v67,  1LL));
  v71[2] = +[W5LogItemRequest requestWithItemID:configuration:]( &OBJC_CLASS___W5LogItemRequest,  "requestWithItemID:configuration:",  19LL,  v24);
  v65[0] = @"Requests";
  v65[1] = @"RunConcurrent";
  v66[0] = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v71, 3LL);
  v66[1] = &__kCFBooleanFalse;
  v65[2] = @"Timeout";
  v65[3] = @"NameOverride";
  v66[2] = +[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", v40);
  v66[3] = @"CoreCapture (POST)";
  __int128 v36 = +[W5LogItemRequest requestWithItemID:configuration:]( &OBJC_CLASS___W5LogItemRequest,  "requestWithItemID:configuration:",  53LL,  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v66,  v65,  4LL));
  v63[0] = @"IncludeMatching";
  v64[0] = +[NSRegularExpression escapedPatternForString:]( &OBJC_CLASS___NSRegularExpression,  "escapedPatternForString:",  v38);
  v63[1] = @"FilterContent";
  v64[1] = +[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v43);
  v64[2] = &__kCFBooleanTrue;
  v63[2] = @"Compress";
  v63[3] = @"NameOverride";
  v64[3] = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"CoreCapture Collect (%@)",  v38);
  id v25 = +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v64,  v63,  4LL);
  v60[0] = @"Delay";
  v60[1] = @"UseLeewayUUID";
  v61[0] = &off_1000DF108;
  v61[1] = v44;
  v62[0] = +[W5LogItemRequest requestWithItemID:configuration:]( &OBJC_CLASS___W5LogItemRequest,  "requestWithItemID:configuration:",  69LL,  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v61,  v60,  2LL));
  v62[1] = +[W5LogItemRequest requestWithItemID:configuration:]( &OBJC_CLASS___W5LogItemRequest,  "requestWithItemID:configuration:",  19LL,  v25);
  v58[0] = @"Requests";
  v58[1] = @"RunConcurrent";
  v59[0] = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v62, 2LL);
  v59[1] = &__kCFBooleanFalse;
  v58[2] = @"Timeout";
  v58[3] = @"NameOverride";
  v59[2] = +[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", v40);
  v59[3] = @"CoreCapture (PRE)";
  uint64_t v26 = +[W5LogItemRequest requestWithItemID:configuration:]( &OBJC_CLASS___W5LogItemRequest,  "requestWithItemID:configuration:",  53LL,  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v59,  v58,  4LL));
  v55 = @"UUID";
  v56 = v37;
  v57[0] = +[W5LogItemRequest requestWithItemID:configuration:]( &OBJC_CLASS___W5LogItemRequest,  "requestWithItemID:configuration:",  25LL,  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v56,  &v55,  1LL));
  v57[1] = +[W5LogItemRequest requestWithItemID:configuration:]( &OBJC_CLASS___W5LogItemRequest,  "requestWithItemID:configuration:",  69LL,  &off_1000E2AB0);
  v53[0] = @"Requests";
  v53[1] = @"RunConcurrent";
  v54[0] = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v57, 2LL);
  v54[1] = &__kCFBooleanFalse;
  v53[2] = @"NameOverride";
  v54[2] = @"TCP Dump (POST)";
  __int128 v39 = +[W5LogItemRequest requestWithItemID:configuration:]( &OBJC_CLASS___W5LogItemRequest,  "requestWithItemID:configuration:",  53LL,  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v54,  v53,  3LL));
  v52[0] = +[W5LogItemRequest requestWithItemID:configuration:]( &OBJC_CLASS___W5LogItemRequest,  "requestWithItemID:configuration:",  28LL,  &off_1000E2AD8);
  v52[1] = -[W5LogManager __environmentDiagnosticsLogItemWithTimeout:]( v42,  "__environmentDiagnosticsLogItemWithTimeout:",  0.0);
  v50[0] = @"Requests";
  v50[1] = @"RunConcurrent";
  v51[0] = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v52, 2LL);
  v51[1] = &__kCFBooleanFalse;
  v50[2] = @"NameOverride";
  v51[2] = @"WiFi Env Diagnostics";
  v49[0] = v36;
  v49[1] = v26;
  v49[2] = +[W5LogItemRequest requestWithItemID:configuration:]( &OBJC_CLASS___W5LogItemRequest,  "requestWithItemID:configuration:",  53LL,  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v51,  v50,  3LL));
  v49[3] = +[W5LogItemRequest requestWithItemID:configuration:]( &OBJC_CLASS___W5LogItemRequest,  "requestWithItemID:configuration:",  37LL,  &off_1000E2B00);
  v49[4] = +[W5LogItemRequest requestWithItemID:configuration:]( &OBJC_CLASS___W5LogItemRequest,  "requestWithItemID:configuration:",  40LL,  0LL);
  v47[0] = @"Delay";
  v47[1] = @"UseLeewayUUID";
  v48[0] = +[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", v40);
  v48[1] = v44;
  v49[5] = +[W5LogItemRequest requestWithItemID:configuration:]( &OBJC_CLASS___W5LogItemRequest,  "requestWithItemID:configuration:",  69LL,  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v48,  v47,  2LL));
  v27 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v49, 6LL);
  if (!v43) {
    v27 = -[NSArray arrayByAddingObject:](v27, "arrayByAddingObject:", v39);
  }
  v45[0] = @"Requests";
  v45[1] = @"RunConcurrent";
  v46[0] = v27;
  v46[1] = &__kCFBooleanTrue;
  v46[2] = v44;
  v45[2] = @"UseLeewayUUID";
  v45[3] = @"Timeout";
  void v45[4] = @"NameOverride";
  v46[3] = +[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", v40);
  void v46[4] = @"Connectivity (POST)";
  objc_msgSend( v41,  "addObject:",  +[W5LogItemRequest requestWithItemID:configuration:]( W5LogItemRequest,  "requestWithItemID:configuration:",  53,  +[NSDictionary dictionaryWithObjects:forKeys:count:]( NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v46,  v45,  5)));
  return v41;
}

- (id)__logItemsForSysdiagnoseWithNoTimeoutAndFilteredContent:(BOOL)a3 useMegaWiFiProfileLimits:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  unsigned int v20 = -[NSFileManager isExecutableFileAtPath:]( +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"),  "isExecutableFileAtPath:",  @"/sbin/ping");
  unsigned int v6 = -[NSUUID UUIDString](+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"), "UUIDString");
  uint64_t v7 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@~sysdiag~PRE[%@]",  @"WiFiDebug",  -[NSString substringToIndex:](v6, "substringToIndex:", 5LL));
  v49[0] = &off_1000DF0C0;
  v48[0] = @"MaxCount";
  v48[1] = @"IncludeMatching";
  v49[1] = +[NSRegularExpression escapedPatternForString:]( &OBJC_CLASS___NSRegularExpression,  "escapedPatternForString:",  v7);
  void v48[2] = @"FilterContent";
  v49[2] = +[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v5);
  v49[3] = &__kCFBooleanTrue;
  v48[3] = @"Compress";
  v48[4] = @"NameOverride";
  v49[4] = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"CoreCapture Collect (%@)",  v7);
  uint64_t v8 = +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v49,  v48,  5LL);
  v45[1] = @"NameOverride";
  v46[0] = v7;
  v45[0] = @"Reason";
  v46[1] = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"CoreCapture Dump (%@)",  v7);
  v47[0] = +[W5LogItemRequest requestWithItemID:configuration:]( &OBJC_CLASS___W5LogItemRequest,  "requestWithItemID:configuration:",  21LL,  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v46,  v45,  2LL));
  v47[1] = +[W5LogItemRequest requestWithItemID:configuration:]( &OBJC_CLASS___W5LogItemRequest,  "requestWithItemID:configuration:",  69LL,  &off_1000E2B28);
  void v47[2] = +[W5LogItemRequest requestWithItemID:configuration:]( &OBJC_CLASS___W5LogItemRequest,  "requestWithItemID:configuration:",  19LL,  v8);
  v43[0] = @"Requests";
  v43[1] = @"RunConcurrent";
  v44[0] = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v47, 3LL);
  v44[1] = &__kCFBooleanFalse;
  void v43[2] = @"NameOverride";
  v44[2] = @"CoreCapture (PRE)";
  double v19 = +[W5LogItemRequest requestWithItemID:configuration:]( &OBJC_CLASS___W5LogItemRequest,  "requestWithItemID:configuration:",  53LL,  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v44,  v43,  3LL));
  if (v4) {
    uint64_t v9 = 30000000LL;
  }
  else {
    uint64_t v9 = 4000000LL;
  }
  uint64_t v10 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@~sysdiag~POST[%@]",  @"WiFiDebug",  -[NSString substringToIndex:](v6, "substringToIndex:", 5LL));
  v42[0] = &off_1000DF120;
  v41[0] = @"MaxAge";
  v41[1] = @"MaxSize";
  v42[1] = +[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v9);
  v41[2] = @"FilterContent";
  void v42[2] = +[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v5);
  v42[3] = &__kCFBooleanTrue;
  void v41[3] = @"Compress";
  v41[4] = @"NameOverride";
  v42[4] = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"CoreCapture Collect (24h + %@)",  v10);
  double v11 = +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v42,  v41,  5LL);
  v39[0] = v10;
  v38[0] = @"Reason";
  v38[1] = @"NameOverride";
  v39[1] = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"CoreCapture Dump (%@)",  v10);
  v40[0] = +[W5LogItemRequest requestWithItemID:configuration:]( &OBJC_CLASS___W5LogItemRequest,  "requestWithItemID:configuration:",  21LL,  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v39,  v38,  2LL));
  v40[1] = +[W5LogItemRequest requestWithItemID:configuration:]( &OBJC_CLASS___W5LogItemRequest,  "requestWithItemID:configuration:",  69LL,  &off_1000E2B50);
  v40[2] = +[W5LogItemRequest requestWithItemID:configuration:]( &OBJC_CLASS___W5LogItemRequest,  "requestWithItemID:configuration:",  19LL,  v11);
  v36[0] = @"Requests";
  v36[1] = @"RunConcurrent";
  v37[0] = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v40, 3LL);
  v37[1] = &__kCFBooleanFalse;
  void v36[2] = @"NameOverride";
  v37[2] = @"CoreCapture (POST + 24h)";
  unsigned int v18 = +[W5LogItemRequest requestWithItemID:configuration:]( &OBJC_CLASS___W5LogItemRequest,  "requestWithItemID:configuration:",  53LL,  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v37,  v36,  3LL));
  v35[0] = +[W5LogItemRequest requestWithItemID:configuration:]( &OBJC_CLASS___W5LogItemRequest,  "requestWithItemID:configuration:",  39LL,  0LL);
  v35[1] = +[W5LogItemRequest requestWithItemID:configuration:]( &OBJC_CLASS___W5LogItemRequest,  "requestWithItemID:configuration:",  69LL,  &off_1000E2B78);
  void v35[2] = +[W5LogItemRequest requestWithItemID:configuration:]( &OBJC_CLASS___W5LogItemRequest,  "requestWithItemID:configuration:",  37LL,  &off_1000E2BA0);
  v33[0] = @"Requests";
  v33[1] = @"RunConcurrent";
  v34[0] = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v35, 3LL);
  v34[1] = &__kCFBooleanFalse;
  v33[2] = @"NameOverride";
  v34[2] = @"Wi-Fi Logs (24h)";
  v17 = +[W5LogItemRequest requestWithItemID:configuration:]( &OBJC_CLASS___W5LogItemRequest,  "requestWithItemID:configuration:",  53LL,  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v34,  v33,  3LL));
  double v12 = -[NSUUID UUIDString](+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"), "UUIDString");
  uint64_t v30 = @"UUID";
  uint64_t v31 = v12;
  v32[0] = +[W5LogItemRequest requestWithItemID:configuration:]( &OBJC_CLASS___W5LogItemRequest,  "requestWithItemID:configuration:",  24LL,  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v31,  &v30,  1LL));
  v32[1] = +[W5LogItemRequest requestWithItemID:configuration:]( &OBJC_CLASS___W5LogItemRequest,  "requestWithItemID:configuration:",  69LL,  &off_1000E2BC8);
  v28[0] = @"Requests";
  v28[1] = @"RunConcurrent";
  v29[0] = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v32, 2LL);
  v29[1] = &__kCFBooleanFalse;
  v28[2] = @"NameOverride";
  void v29[2] = @"TCP Dump (Begin)";
  double v13 = +[W5LogItemRequest requestWithItemID:configuration:]( &OBJC_CLASS___W5LogItemRequest,  "requestWithItemID:configuration:",  53LL,  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v29,  v28,  3LL));
  id v25 = @"UUID";
  uint64_t v26 = v12;
  v27[0] = +[W5LogItemRequest requestWithItemID:configuration:]( &OBJC_CLASS___W5LogItemRequest,  "requestWithItemID:configuration:",  25LL,  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v26,  &v25,  1LL));
  v27[1] = +[W5LogItemRequest requestWithItemID:configuration:]( &OBJC_CLASS___W5LogItemRequest,  "requestWithItemID:configuration:",  69LL,  &off_1000E2BF0);
  v23[0] = @"Requests";
  v23[1] = @"RunConcurrent";
  v24[0] = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v27, 2LL);
  v24[1] = &__kCFBooleanFalse;
  v23[2] = @"NameOverride";
  void v24[2] = @"TCP Dump (POST)";
  unint64_t v14 = +[W5LogItemRequest requestWithItemID:configuration:]( &OBJC_CLASS___W5LogItemRequest,  "requestWithItemID:configuration:",  53LL,  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v24,  v23,  3LL));
  v22[0] = +[W5LogItemRequest requestWithItemID:configuration:]( &OBJC_CLASS___W5LogItemRequest,  "requestWithItemID:configuration:",  28LL,  0LL);
  v22[1] = v19;
  v22[2] = v13;
  v22[3] = +[W5LogItemRequest requestWithItemID:configuration:]( &OBJC_CLASS___W5LogItemRequest,  "requestWithItemID:configuration:",  81LL,  &off_1000E2C18);
  v22[4] = +[W5LogItemRequest requestWithItemID:configuration:]( &OBJC_CLASS___W5LogItemRequest,  "requestWithItemID:configuration:",  61LL,  &off_1000E2C40);
  v22[5] = +[W5LogItemRequest requestWithItemID:configuration:]( &OBJC_CLASS___W5LogItemRequest,  "requestWithItemID:configuration:",  3LL,  &off_1000E2C68);
  if (v20) {
    uint64_t v15 = 2LL;
  }
  else {
    uint64_t v15 = 43LL;
  }
  v22[6] = +[W5LogItemRequest requestWithItemID:configuration:]( &OBJC_CLASS___W5LogItemRequest,  "requestWithItemID:configuration:",  v15,  0LL);
  v22[7] = -[W5LogManager __connectivityDiagnosticsLogItemWithTimeout:]( self,  "__connectivityDiagnosticsLogItemWithTimeout:",  0.0);
  v22[8] = -[W5LogManager __configurationDiagnosticsLogItemWithTimeout:]( self,  "__configurationDiagnosticsLogItemWithTimeout:",  0.0);
  v22[9] = -[W5LogManager __environmentDiagnosticsLogItemWithTimeout:]( self,  "__environmentDiagnosticsLogItemWithTimeout:",  0.0);
  v22[10] = +[W5LogItemRequest requestWithItemID:configuration:]( &OBJC_CLASS___W5LogItemRequest,  "requestWithItemID:configuration:",  3LL,  &off_1000E2C90);
  v22[11] = +[W5LogItemRequest requestWithItemID:configuration:]( &OBJC_CLASS___W5LogItemRequest,  "requestWithItemID:configuration:",  62LL,  &off_1000E2CB8);
  v22[12] = +[W5LogItemRequest requestWithItemID:configuration:]( &OBJC_CLASS___W5LogItemRequest,  "requestWithItemID:configuration:",  81LL,  &off_1000E2CE0);
  v22[13] = v14;
  v22[14] = v18;
  v22[15] = v17;
  v22[16] = +[W5LogItemRequest requestWithItemID:configuration:]( &OBJC_CLASS___W5LogItemRequest,  "requestWithItemID:configuration:",  70LL,  &off_1000E2D08);
  v22[17] = +[W5LogItemRequest requestWithItemID:configuration:]( &OBJC_CLASS___W5LogItemRequest,  "requestWithItemID:configuration:",  40LL,  0LL);
  v22[18] = +[W5LogItemRequest requestWithItemID:configuration:]( &OBJC_CLASS___W5LogItemRequest,  "requestWithItemID:configuration:",  30LL,  0LL);
  v22[19] = +[W5LogItemRequest requestWithItemID:configuration:]( &OBJC_CLASS___W5LogItemRequest,  "requestWithItemID:configuration:",  33LL,  0LL);
  v22[20] = +[W5LogItemRequest requestWithItemID:configuration:]( &OBJC_CLASS___W5LogItemRequest,  "requestWithItemID:configuration:",  45LL,  &off_1000E2D30);
  v22[21] = +[W5LogItemRequest requestWithItemID:configuration:]( &OBJC_CLASS___W5LogItemRequest,  "requestWithItemID:configuration:",  46LL,  &off_1000E2D58);
  v22[22] = +[W5LogItemRequest requestWithItemID:configuration:]( &OBJC_CLASS___W5LogItemRequest,  "requestWithItemID:configuration:",  44LL,  &off_1000E2D80);
  v22[23] = +[W5LogItemRequest requestWithItemID:configuration:]( &OBJC_CLASS___W5LogItemRequest,  "requestWithItemID:configuration:",  47LL,  &off_1000E2DA8);
  v22[24] = +[W5LogItemRequest requestWithItemID:configuration:]( &OBJC_CLASS___W5LogItemRequest,  "requestWithItemID:configuration:",  6LL,  0LL);
  v22[25] = +[W5LogItemRequest requestWithItemID:configuration:]( &OBJC_CLASS___W5LogItemRequest,  "requestWithItemID:configuration:",  9LL,  0LL);
  v22[26] = +[W5LogItemRequest requestWithItemID:configuration:]( &OBJC_CLASS___W5LogItemRequest,  "requestWithItemID:configuration:",  4LL,  0LL);
  v22[27] = +[W5LogItemRequest requestWithItemID:configuration:]( &OBJC_CLASS___W5LogItemRequest,  "requestWithItemID:configuration:",  7LL,  0LL);
  v22[28] = +[W5LogItemRequest requestWithItemID:configuration:]( &OBJC_CLASS___W5LogItemRequest,  "requestWithItemID:configuration:",  16LL,  0LL);
  v22[29] = +[W5LogItemRequest requestWithItemID:configuration:]( &OBJC_CLASS___W5LogItemRequest,  "requestWithItemID:configuration:",  48LL,  0LL);
  v22[30] = +[W5LogItemRequest requestWithItemID:configuration:]( &OBJC_CLASS___W5LogItemRequest,  "requestWithItemID:configuration:",  58LL,  0LL);
  v22[31] = +[W5LogItemRequest requestWithItemID:configuration:]( &OBJC_CLASS___W5LogItemRequest,  "requestWithItemID:configuration:",  57LL,  0LL);
  v22[32] = +[W5LogItemRequest requestWithItemID:configuration:]( &OBJC_CLASS___W5LogItemRequest,  "requestWithItemID:configuration:",  74LL,  0LL);
  v22[33] = +[W5LogItemRequest requestWithItemID:configuration:]( &OBJC_CLASS___W5LogItemRequest,  "requestWithItemID:configuration:",  51LL,  0LL);
  v22[34] = +[W5LogItemRequest requestWithItemID:configuration:]( &OBJC_CLASS___W5LogItemRequest,  "requestWithItemID:configuration:",  78LL,  &off_1000E2DD0);
  v22[35] = +[W5LogItemRequest requestWithItemID:configuration:]( &OBJC_CLASS___W5LogItemRequest,  "requestWithItemID:configuration:",  80LL,  0LL);
  v22[36] = +[W5LogItemRequest requestWithItemID:configuration:]( &OBJC_CLASS___W5LogItemRequest,  "requestWithItemID:configuration:",  85LL,  &off_1000E2DF8);
  v22[37] = +[W5LogItemRequest requestWithItemID:configuration:]( &OBJC_CLASS___W5LogItemRequest,  "requestWithItemID:configuration:",  84LL,  &off_1000E2E20);
  v22[38] = +[W5LogItemRequest requestWithItemID:configuration:]( &OBJC_CLASS___W5LogItemRequest,  "requestWithItemID:configuration:",  88LL,  &off_1000E2E48);
  return +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v22, 39LL);
}

- (id)__logItemsForBTSysdiagnoseWithFilteredContent:(BOOL)a3 timeout:(int64_t)a4
{
  BOOL v4 = a3;
  id v30 = +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array");
  BOOL v5 = -[NSUUID UUIDString](+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"), "UUIDString");
  unsigned int v6 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@~sysdiag[%@]",  @"BluetoothDebug",  -[NSString substringToIndex:](v5, "substringToIndex:", 5LL));
  uint64_t v7 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@~AMFM~sysdiag[%@]",  @"BluetoothDebug",  -[NSString substringToIndex:](v5, "substringToIndex:", 5LL));
  v58[0] = &off_1000DF0C0;
  v57[0] = @"MaxCount";
  v57[1] = @"IncludeMatching";
  v58[1] = +[NSRegularExpression escapedPatternForString:]( &OBJC_CLASS___NSRegularExpression,  "escapedPatternForString:",  v6);
  void v57[2] = @"FilterContent";
  v58[2] = +[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v4);
  v58[3] = @"BT";
  v57[3] = @"Component";
  v57[4] = @"Compress";
  void v58[4] = &__kCFBooleanTrue;
  v57[5] = @"NameOverride";
  v58[5] = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"CoreCapture Collect (%@)",  v6);
  uint64_t v26 = +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v58,  v57,  6LL);
  v56[0] = &off_1000DF0C0;
  v55[0] = @"MaxCount";
  v55[1] = @"IncludeMatching";
  v56[1] = +[NSRegularExpression escapedPatternForString:]( &OBJC_CLASS___NSRegularExpression,  "escapedPatternForString:",  v7);
  v55[2] = @"FilterContent";
  v56[2] = +[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v4);
  v56[3] = @"MultiFunctionManager";
  v55[3] = @"Component";
  v55[4] = @"Compress";
  v56[4] = &__kCFBooleanTrue;
  v55[5] = @"NameOverride";
  uint64_t v8 = v7;
  id v21 = v7;
  int64_t v9 = a4;
  v56[5] = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"CoreCapture Collect (%@)",  v21);
  id v24 = +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v56,  v55,  6LL);
  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  double v11 = v10;
  -[NSDate timeIntervalSinceReferenceDate]( -[W5LogItemRequestInternal addedAt](self->_activeRequest, "addedAt"),  "timeIntervalSinceReferenceDate");
  unint64_t v13 = (unint64_t)(v11 - v12);
  uint64_t v14 = a4 - v13;
  double v15 = (double)(uint64_t)(a4 - v13) * 0.4;
  if (v15 <= 2000.0) {
    double v15 = 2000.0;
  }
  unint64_t v16 = (unint64_t)v15;
  if ((unint64_t)v15 != 2000)
  {
    v17 = (os_log_s *)sub_10008C90C();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      int v47 = 134218752;
      uint64_t v48 = 2000LL;
      __int16 v49 = 2048;
      unint64_t v50 = v16;
      __int16 v51 = 2048;
      int64_t v52 = a4;
      __int16 v53 = 2048;
      unint64_t v54 = v13;
      LODWORD(v22) = 42;
      _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v17,  0LL,  "[wifivelocity] Adjusted CoreCapture delay (%lums --> %lums) based on specified timeout (%lums) and time elapsed since request was added (%lus)",  &v47,  v22,  a4,  v24);
    }
  }

  uint64_t v18 = 9000LL;
  if (v14 > 9000) {
    uint64_t v18 = v9 - v13;
  }
  uint64_t v29 = v18 - 2000;
  v44[0] = @"Reason";
  v44[1] = @"Component";
  v45[0] = v6;
  v45[1] = @"BT";
  v44[2] = @"NameOverride";
  void v45[2] = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"CoreCapture Dump (%@)",  v6);
  v46[0] = +[W5LogItemRequest requestWithItemID:configuration:]( &OBJC_CLASS___W5LogItemRequest,  "requestWithItemID:configuration:",  21LL,  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v45,  v44,  3LL));
  v42[0] = @"Reason";
  v42[1] = @"Component";
  v43[0] = v8;
  v43[1] = @"MultiFunctionManager";
  void v42[2] = @"NameOverride";
  void v43[2] = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"CoreCapture Dump (%@)",  v8);
  v46[1] = +[W5LogItemRequest requestWithItemID:configuration:]( &OBJC_CLASS___W5LogItemRequest,  "requestWithItemID:configuration:",  21LL,  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v43,  v42,  3LL));
  uint64_t v40 = @"Delay";
  id v41 = +[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", v16);
  void v46[2] = +[W5LogItemRequest requestWithItemID:configuration:]( &OBJC_CLASS___W5LogItemRequest,  "requestWithItemID:configuration:",  69LL,  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v41,  &v40,  1LL));
  v46[3] = +[W5LogItemRequest requestWithItemID:configuration:]( &OBJC_CLASS___W5LogItemRequest,  "requestWithItemID:configuration:",  19LL,  v26);
  void v46[4] = +[W5LogItemRequest requestWithItemID:configuration:]( &OBJC_CLASS___W5LogItemRequest,  "requestWithItemID:configuration:",  19LL,  v24);
  v38[0] = @"Requests";
  v38[1] = @"RunConcurrent";
  v39[0] = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v46, 5LL);
  v39[1] = &__kCFBooleanFalse;
  void v38[2] = @"NameOverride";
  void v39[2] = @"CoreCapture (Dump)";
  v27 = +[W5LogItemRequest requestWithItemID:configuration:]( &OBJC_CLASS___W5LogItemRequest,  "requestWithItemID:configuration:",  53LL,  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v39,  v38,  3LL));
  v36[0] = @"MaxAge";
  v36[1] = @"MaxSize";
  v37[0] = &off_1000DF120;
  v37[1] = &off_1000DF318;
  void v36[2] = @"FilterContent";
  v37[2] = +[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v4);
  void v37[3] = @"BT";
  void v36[3] = @"Component";
  v36[4] = @"Compress";
  v36[5] = @"NameOverride";
  v37[4] = &__kCFBooleanTrue;
  v37[5] = @"CoreCapture Collect BT (24h)";
  id v25 = +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v37,  v36,  6LL);
  v34[0] = @"MaxAge";
  v34[1] = @"MaxSize";
  v35[0] = &off_1000DF120;
  v35[1] = &off_1000DF330;
  v34[2] = @"FilterContent";
  void v35[2] = +[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v4);
  void v35[3] = @"MultiFunctionManager";
  void v34[3] = @"Component";
  void v34[4] = @"Compress";
  v34[5] = @"NameOverride";
  v35[4] = &__kCFBooleanTrue;
  v35[5] = @"CoreCapture Collect AMFM (24h)";
  double v19 = +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v35,  v34,  6LL);
  v33[0] = v27;
  v33[1] = +[W5LogItemRequest requestWithItemID:configuration:]( &OBJC_CLASS___W5LogItemRequest,  "requestWithItemID:configuration:",  47LL,  &off_1000E2E70);
  v33[2] = +[W5LogItemRequest requestWithItemID:configuration:]( &OBJC_CLASS___W5LogItemRequest,  "requestWithItemID:configuration:",  30LL,  0LL);
  void v33[3] = +[W5LogItemRequest requestWithItemID:configuration:]( &OBJC_CLASS___W5LogItemRequest,  "requestWithItemID:configuration:",  19LL,  v25);
  void v33[4] = +[W5LogItemRequest requestWithItemID:configuration:]( &OBJC_CLASS___W5LogItemRequest,  "requestWithItemID:configuration:",  19LL,  v19);
  v31[0] = @"Requests";
  v31[1] = @"RunConcurrent";
  v32[0] = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v33, 5LL);
  v32[1] = &__kCFBooleanTrue;
  v31[2] = @"Timeout";
  v31[3] = @"NameOverride";
  void v32[2] = +[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", v29);
  void v32[3] = @"Bluetooth Logs";
  objc_msgSend( v30,  "addObject:",  +[W5LogItemRequest requestWithItemID:configuration:]( W5LogItemRequest,  "requestWithItemID:configuration:",  53,  +[NSDictionary dictionaryWithObjects:forKeys:count:]( NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v32,  v31,  4)));
  return v30;
}

- (id)__model
{
  id v2 = IOServiceMatching("IOPlatformExpertDevice");
  io_service_t MatchingService = IOServiceGetMatchingService(kIOMainPortDefault, v2);
  if (!MatchingService) {
    return 0LL;
  }
  io_object_t v4 = MatchingService;
  CFProperty = (const __CFData *)IORegistryEntryCreateCFProperty( MatchingService,  @"model",  kCFAllocatorDefault,  0);
  if (CFProperty)
  {
    unsigned int v6 = CFProperty;
    uint64_t v7 =  -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"%@",  +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  CFDataGetBytePtr(CFProperty),  4LL));
    CFRelease(v6);
  }

  else
  {
    uint64_t v7 = 0LL;
  }

  IOObjectRelease(v4);
  return v7;
}

- (id)__basicWiFiLogsWithFilteredContent:(BOOL)a3 useMegaWiFiProfileLimits:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v23 = a3;
  id v6 = +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array");
  model = self->_model;
  if (!model) {
    goto LABEL_5;
  }
  if (-[NSString rangeOfString:](model, "rangeOfString:", @"Watch1") != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v10 = 0LL;
    uint64_t v9 = 1LL;
    goto LABEL_11;
  }

  uint64_t v8 = self->_model;
  if (v8 && -[NSString rangeOfString:](v8, "rangeOfString:", @"Watch2") != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v10 = 1LL;
    uint64_t v9 = 2LL;
  }

  else
  {
LABEL_5:
    if (v4) {
      uint64_t v9 = 8LL;
    }
    else {
      uint64_t v9 = 4LL;
    }
    uint64_t v10 = 1LL;
  }

- (id)__expandLogItems:(id)a3 configuration:(id)a4
{
  id v7 = +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array");
  unsigned int v18 = objc_msgSend( objc_msgSend(a4, "objectForKeyedSubscript:", @"UseMegaWiFiProfileLimits"),  "BOOLValue");
  id v8 = [a4 objectForKeyedSubscript:@"FilterContent"];
  if (v8)
  {
    id v9 = [v8 BOOLValue];
  }

  else
  {
    os_variant_has_internal_diagnostics("com.apple.wifivelocity");
    id v9 = 0LL;
  }

  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  id v10 = [a3 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v20;
    do
    {
      for (i = 0LL; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v20 != v12) {
          objc_enumerationMutation(a3);
        }
        uint64_t v14 = *(void **)(*((void *)&v19 + 1) + 8LL * (void)i);
        switch((unint64_t)[v14 itemID])
        {
          case '6':
          case 'M':
            id v15 = -[W5LogManager __logItemsForWiFiDiagnosticsApp](self, "__logItemsForWiFiDiagnosticsApp");
            goto LABEL_24;
          case '7':
            id v15 = -[W5LogManager __logItemsForWiFiDiagnosticsExtensionWithCoreCapturePrefix:]( self,  "__logItemsForWiFiDiagnosticsExtensionWithCoreCapturePrefix:",  +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@~wdext",  @"WiFiDebug"));
            goto LABEL_24;
          case '8':
            id v16 = objc_msgSend(objc_msgSend(a4, "objectForKeyedSubscript:", @"Timeout"), "integerValue");
            if (v16) {
              id v15 = -[W5LogManager __logItemsForSysdiagnoseWithFilteredContent:useMegaWiFiProfileLimits:timeout:]( self,  "__logItemsForSysdiagnoseWithFilteredContent:useMegaWiFiProfileLimits:timeout:",  v9,  v18,  v16);
            }
            else {
              id v15 = -[W5LogManager __logItemsForSysdiagnoseWithNoTimeoutAndFilteredContent:useMegaWiFiProfileLimits:]( self,  "__logItemsForSysdiagnoseWithNoTimeoutAndFilteredContent:useMegaWiFiProfileLimits:",  v9,  v18);
            }
            goto LABEL_24;
          case ';':
            id v15 = -[W5LogManager __logItemsForFeedbackAssistant](self, "__logItemsForFeedbackAssistant");
            goto LABEL_24;
          case '<':
            id v15 = -[W5LogManager __logItemsForTapToRadar](self, "__logItemsForTapToRadar");
            goto LABEL_24;
          case 'C':
            id v15 = -[W5LogManager __logItemsForInternalWiFiSettings](self, "__logItemsForInternalWiFiSettings");
            goto LABEL_24;
          case 'G':
            id v15 = -[W5LogManager __logItemsForDumpLogsEventWithReason:filteredContent:]( self,  "__logItemsForDumpLogsEventWithReason:filteredContent:",  objc_msgSend(objc_msgSend(v14, "configuration"), "objectForKeyedSubscript:", @"Reason"),  v9);
            goto LABEL_24;
          case 'H':
            id v15 = -[W5LogManager __logItemsForDatapathStallEventWithFilteredContent:]( self,  "__logItemsForDatapathStallEventWithFilteredContent:",  v9);
            goto LABEL_24;
          case 'O':
            id v15 = -[W5LogManager __logItemsForBTSysdiagnoseWithFilteredContent:timeout:]( self,  "__logItemsForBTSysdiagnoseWithFilteredContent:timeout:",  v9,  objc_msgSend(objc_msgSend(a4, "objectForKeyedSubscript:", @"Timeout"), "integerValue"));
            goto LABEL_24;
          case 'R':
            id v15 = -[W5LogManager __logItemsForABCWithReason:filteredContent:]( self,  "__logItemsForABCWithReason:filteredContent:",  objc_msgSend(objc_msgSend(v14, "configuration"), "objectForKeyedSubscript:", @"Reason"),  v9);
            goto LABEL_24;
          case 'S':
            id v15 = -[W5LogManager __logItemsForBackgroundEventWithReason:filteredContent:]( self,  "__logItemsForBackgroundEventWithReason:filteredContent:",  objc_msgSend(objc_msgSend(v14, "configuration"), "objectForKeyedSubscript:", @"Reason"),  v9);
LABEL_24:
            objc_msgSend( v7,  "addObjectsFromArray:",  -[W5LogManager __expandLogItems:configuration:](self, "__expandLogItems:configuration:", v15, a4));
            break;
          default:
            [v7 addObject:v14];
            break;
        }
      }

      id v11 = [a3 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }

    while (v11);
  }

  id result = [v7 count];
  if (result) {
    return [v7 copy];
  }
  return result;
}

- (void)__runRequest:(id)a3 reply:(id)a4
{
  id v7 = -[W5LogManager __expandLogItems:configuration:]( self,  "__expandLogItems:configuration:",  [a3 itemRequests],  objc_msgSend(a3, "configuration"));
  debugLogQueue = (dispatch_queue_s *)self->_debugLogQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10005B5F4;
  block[3] = &unk_1000D1858;
  block[4] = self;
  block[5] = a3;
  block[6] = v7;
  dispatch_sync(debugLogQueue, block);
  id v9 = -[NSURL URLByAppendingPathComponent:]( +[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", @"/var/run/com.apple.wifivelocity"),  "URLByAppendingPathComponent:",  [a3 filename]);
  if (objc_msgSend( objc_msgSend(objc_msgSend(a3, "configuration"), "objectForKeyedSubscript:", @"Compress"),  "BOOLValue")) {
    id v9 = -[NSURL URLByDeletingPathExtension](v9, "URLByDeletingPathExtension");
  }
  id v10 = +[NSURL fileURLWithPath:isDirectory:]( &OBJC_CLASS___NSURL,  "fileURLWithPath:isDirectory:",  @"/var/mobile",  1LL);
  if (v9 && (id v11 = v10) != 0LL)
  {
    -[NSFileManager createDirectoryAtPath:withIntermediateDirectories:attributes:error:]( +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"),  "createDirectoryAtPath:withIntermediateDirectories:attributes:error:",  -[NSURL path](v9, "path"),  1LL,  0LL,  0LL);
    uint64_t v12 = -[W5StatusManager concurrentQueue](self->_status, "concurrentQueue");
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_10005B844;
    void v13[3] = &unk_1000D20E0;
    v13[4] = a3;
    v13[5] = v7;
    v13[6] = self;
    v13[7] = v9;
    v13[8] = v11;
    v13[9] = a4;
    -[NSOperationQueue addOperationWithBlock:](v12, "addOperationWithBlock:", v13);
  }

  else if (a4)
  {
    NSErrorUserInfoKey v15 = NSLocalizedFailureReasonErrorKey;
    id v16 = @"W5ResourceErr";
    (*((void (**)(id, NSError *, void, void))a4 + 2))( a4,  +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.wifivelocity.error",  7LL,  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v16,  &v15,  1LL)),  0LL,  0LL);
  }

- (id)__collectWiFiScanResults:(id)a3
{
  id v5 = objc_alloc_init(&OBJC_CLASS___W5LogItemReceipt);
  [v5 setRequest:a3];
  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v5, "setStartedAt:");
  id v6 = objc_msgSend(objc_msgSend(a3, "configuration"), "objectForKeyedSubscript:", @"OutputDirectory");
  id v7 = objc_msgSend( objc_msgSend(objc_msgSend(a3, "configuration"), "objectForKeyedSubscript:", @"UseScanCache"),  "BOOLValue");
  unsigned int v8 = objc_msgSend( objc_msgSend( objc_msgSend(a3, "configuration"),  "objectForKeyedSubscript:",  @"Use6GHzFollowup"),  "BOOLValue");
  id v9 = [v6 path];
  if ((_DWORD)v7) {
    id v10 = @"wifi_scan_cache.txt";
  }
  else {
    id v10 = @"wifi_scan.txt";
  }
  id v11 = [v9 stringByAppendingPathComponent:v10];
  id v12 = objc_alloc_init(&OBJC_CLASS___CWFScanParameters);
  [v12 setIncludeHiddenNetworks:1];
  [v12 setMergeScanResults:0];
  [v12 setCacheOnly:v7];
  if (v8) {
    uint64_t v13 = 768LL;
  }
  else {
    uint64_t v13 = 512LL;
  }
  [v12 setScanFlags:v13];
  objc_msgSend( v12,  "setChannels:",  -[CWFInterface supportedChannelsWithCountryCode:]( -[W5StatusManager corewifi](self->_status, "corewifi"),  "supportedChannelsWithCountryCode:",  0));
  objc_msgSend( v12,  "setIncludeProperties:",  +[NSSet setWithArray:](NSSet, "setWithArray:", &off_1000E3C30));
  if (-[NSFileManager createFileAtPath:contents:attributes:]( +[NSFileManager defaultManager](NSFileManager, "defaultManager"),  "createFileAtPath:contents:attributes:",  v11,  objc_msgSend( +[W5LogManager __logScanResults:]( W5LogManager,  "__logScanResults:",  -[CWFInterface performScanWithParameters:error:]( -[W5StatusManager corewifi](self->_status, "corewifi"),  "performScanWithParameters:error:",  v12,  0)),  "dataUsingEncoding:",  4),  0))
  {
    NSErrorUserInfoKey v15 = +[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", v10);
    objc_msgSend( v5,  "setRelativeURLs:",  +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v15, 1));
  }

  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v5, "setCompletedAt:");
  return v5;
}

- (id)__collectDiagnostics:(id)a3
{
  id v5 = objc_alloc_init(&OBJC_CLASS___W5LogItemReceipt);
  [v5 setRequest:a3];
  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v5, "setStartedAt:");
  id v6 = +[NSMutableString string](&OBJC_CLASS___NSMutableString, "string");
  id v7 = objc_msgSend(objc_msgSend(a3, "configuration"), "objectForKeyedSubscript:", @"OutputDirectory");
  id v8 = objc_msgSend(objc_msgSend(a3, "configuration"), "objectForKeyedSubscript:", @"DiagnosticsTests");
  id v9 = (const __CFString *)objc_msgSend( objc_msgSend(a3, "configuration"),  "objectForKeyedSubscript:",  @"FileNameOverride");
  uint64_t v16 = 0LL;
  id v10 = -[W5LogManager __runDiagnosticsTests:configuration:timeout:error:]( self,  "__runDiagnosticsTests:configuration:timeout:error:",  v8,  [a3 configuration],  0,  &v16);
  [v6 appendString:@"# --- Diagnostics\n\n"];
  objc_msgSend( v6,  "appendString:",  -[W5LogManager __logDiagnosticsTestResults:](self, "__logDiagnosticsTestResults:", v10));
  id v11 = -[W5LogManager __logDiagnosticsPingResults:](self, "__logDiagnosticsPingResults:", v10);
  if ([v11 length])
  {
    [v6 appendString:@"\n\n\n# --- Ping Results\n\n"];
    [v6 appendString:v11];
  }

  [v6 appendString:@"\n\n"];
  id v12 = +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager");
  id v13 = [v7 path];
  if (v9) {
    uint64_t v14 = v9;
  }
  else {
    uint64_t v14 = @"diagnostics.txt";
  }
  if (-[NSFileManager createFileAtPath:contents:attributes:]( v12,  "createFileAtPath:contents:attributes:",  [v13 stringByAppendingPathComponent:v14],  objc_msgSend(v6, "dataUsingEncoding:", 4),  0))
  {
    __int128 v19 = +[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", v14);
    objc_msgSend( v5,  "setRelativeURLs:",  +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v19, 1));
  }

  if (v10)
  {
    v17 = @"DiagnosticsResults";
    id v18 = v10;
    objc_msgSend( v5,  "setInfo:",  +[NSDictionary dictionaryWithObjects:forKeys:count:]( NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v18,  &v17,  1));
  }

  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v5, "setCompletedAt:");
  return v5;
}

- (id)__collectPerSSIDDiagnosticsHistory:(id)a3
{
  id v5 = objc_alloc_init(&OBJC_CLASS___W5LogItemReceipt);
  [v5 setRequest:a3];
  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  v17 = v5;
  objc_msgSend(v5, "setStartedAt:");
  id v6 = objc_msgSend(objc_msgSend(a3, "configuration"), "objectForKeyedSubscript:", @"OutputDirectory");
  id v18 = +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array");
  id v7 = -[W5DiagnosticsManager diagnosticsHistory](self->_diagnostics, "diagnosticsHistory");
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  id obj = [v7 allKeys];
  id v8 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v21;
    do
    {
      for (i = 0LL; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v21 != v10) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = *(void *)(*((void *)&v20 + 1) + 8LL * (void)i);
        id v13 = objc_msgSend( objc_msgSend(objc_msgSend(v7, "objectForKeyedSubscript:", v12), "allValues"),  "sortedArrayUsingComparator:",  &stru_1000D2C58);
        id v14 = +[NSMutableString string](&OBJC_CLASS___NSMutableString, "string");
        [v14 appendFormat:@"# --- Diagnostics (%@)\n\n", v12];
        objc_msgSend( v14,  "appendString:",  -[W5LogManager __logDiagnosticsTestResults:](self, "__logDiagnosticsTestResults:", v13));
        [v14 appendString:@"\n\n"];
        NSErrorUserInfoKey v15 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@-diagnostics.txt",  v12);
        if (-[NSFileManager createFileAtPath:contents:attributes:]( +[NSFileManager defaultManager](NSFileManager, "defaultManager"),  "createFileAtPath:contents:attributes:",  objc_msgSend(objc_msgSend(v6, "path"), "stringByAppendingPathComponent:", v15),  objc_msgSend(v14, "dataUsingEncoding:", 4),  0))
        {
          objc_msgSend(v18, "addObject:", +[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v15));
        }
      }

      id v9 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
    }

    while (v9);
  }

  [v17 setRelativeURLs:v18];
  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v17, "setCompletedAt:");
  return v17;
}

- (id)__collectPeerDiagnostics:(id)a3
{
  id v5 = objc_alloc_init(&OBJC_CLASS___W5LogItemReceipt);
  [v5 setRequest:a3];
  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v5, "setStartedAt:");
  id v6 = objc_msgSend(objc_msgSend(a3, "configuration"), "objectForKeyedSubscript:", @"OutputDirectory");
  id v7 = +[NSMutableString string](&OBJC_CLASS___NSMutableString, "string");
  id v8 = -[W5PeerDiagnosticsManager gatherPeerDiagnostics](self->_peerDiagnostics, "gatherPeerDiagnostics");
  objc_msgSend(v7, "appendFormat:", @"# --- Peer Diagnostics from %lu devices\n\n", objc_msgSend(v8, "count"));
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  id v9 = [v8 countByEnumeratingWithState:&v14 objects:v19 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v15;
    do
    {
      uint64_t v12 = 0LL;
      do
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(v8);
        }
        [v7 appendFormat:@"%@\n", *(void *)(*((void *)&v14 + 1) + 8 * (void)v12)];
        uint64_t v12 = (char *)v12 + 1;
      }

      while (v10 != v12);
      id v10 = [v8 countByEnumeratingWithState:&v14 objects:v19 count:16];
    }

    while (v10);
  }

  [v7 appendString:@"\n\n"];
  if (-[NSFileManager createFileAtPath:contents:attributes:]( +[NSFileManager defaultManager](NSFileManager, "defaultManager"),  "createFileAtPath:contents:attributes:",  objc_msgSend(objc_msgSend(v6, "path"), "stringByAppendingPathComponent:", @"peer_diagnostics.txt"),  objc_msgSend(v7, "dataUsingEncoding:", 4),  0))
  {
    id v18 = +[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", @"peer_diagnostics.txt");
    objc_msgSend( v5,  "setRelativeURLs:",  +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v18, 1));
  }

  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v5, "setCompletedAt:");
  return v5;
}

- (id)__collectLeakyAPStats:(id)a3
{
  id v5 = objc_alloc_init(&OBJC_CLASS___W5LogItemReceipt);
  [v5 setRequest:a3];
  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v5, "setStartedAt:");
  id v6 = objc_msgSend(objc_msgSend(a3, "configuration"), "objectForKeyedSubscript:", @"OutputDirectory");
  id v7 = +[NSMutableString string](&OBJC_CLASS___NSMutableString, "string");
  [v7 appendString:@"# --- Leaky AP Stats\n\n"];
  objc_msgSend( v7,  "appendString:",  sub_10001C3F0((uint64_t)objc_msgSend( -[CWFInterface leakyAPStats]( -[W5StatusManager corewifi](self->_status, "corewifi"),  "leakyAPStats"),  "bytes")));
  [v7 appendString:@"\n\n"];
  if (-[NSFileManager createFileAtPath:contents:attributes:]( +[NSFileManager defaultManager](NSFileManager, "defaultManager"),  "createFileAtPath:contents:attributes:",  objc_msgSend(objc_msgSend(v6, "path"), "stringByAppendingPathComponent:", @"leaky_ap_stats.txt"),  objc_msgSend(v7, "dataUsingEncoding:", 4),  0))
  {
    id v9 = +[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", @"leaky_ap_stats.txt");
    objc_msgSend( v5,  "setRelativeURLs:",  +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v9, 1));
  }

  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v5, "setCompletedAt:");
  return v5;
}

- (id)__browseBonjourInstancesWithServiceType:(id)a3 duration:(unint64_t)a4
{
  id v6 = +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array");
  id v7 = +[NSMutableData dataWithCapacity:](&OBJC_CLASS___NSMutableData, "dataWithCapacity:", 0LL);
  v20[0] = @"-B";
  v20[1] = a3;
  +[NSTask runTaskWithLaunchPath:arguments:timeout:outputData:errorData:launchHandler:didLaunch:error:]( &OBJC_CLASS___NSTask,  "runTaskWithLaunchPath:arguments:timeout:outputData:errorData:launchHandler:didLaunch:error:",  @"/usr/bin/dns-sd",  +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v20, 2LL),  v7,  0LL,  0LL,  0LL,  (double)a4,  0LL);
  if (-[NSMutableData length](v7, "length"))
  {
    id v8 = -[NSString componentsSeparatedByString:]( -[NSString initWithData:encoding:](objc_alloc(&OBJC_CLASS___NSString), "initWithData:encoding:", v7, 4LL),  "componentsSeparatedByString:",  @"\n");
    __int128 v15 = 0u;
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    id v9 = -[NSArray countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v15,  v19,  16LL);
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v16;
      do
      {
        uint64_t v12 = 0LL;
        do
        {
          if (*(void *)v16 != v11) {
            objc_enumerationMutation(v8);
          }
          id v13 =  objc_msgSend( objc_msgSend( *(id *)(*((void *)&v15 + 1) + 8 * (void)v12),  "componentsSeparatedByCharactersInSet:",  +[NSCharacterSet whitespaceCharacterSet](NSCharacterSet, "whitespaceCharacterSet")),  "mutableCopy");
          [v13 removeObject:&stru_1000D4648];
          if ([v13 count] == (id)7) {
            objc_msgSend(v6, "addObject:", objc_msgSend(v13, "objectAtIndexedSubscript:", 6));
          }
          uint64_t v12 = (char *)v12 + 1;
        }

        while (v10 != v12);
        id v10 = -[NSArray countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v15,  v19,  16LL);
      }

      while (v10);
    }
  }

  return [v6 copy];
}

- (id)__resolveBonjourInstance:(id)a3 serviceType:(id)a4 duration:(unint64_t)a5
{
  id v8 = +[NSMutableData dataWithCapacity:](&OBJC_CLASS___NSMutableData, "dataWithCapacity:", 0LL);
  v10[0] = @"-L";
  v10[1] = a3;
  void v10[2] = a4;
  +[NSTask runTaskWithLaunchPath:arguments:timeout:outputData:errorData:launchHandler:didLaunch:error:]( &OBJC_CLASS___NSTask,  "runTaskWithLaunchPath:arguments:timeout:outputData:errorData:launchHandler:didLaunch:error:",  @"/usr/bin/dns-sd",  +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v10, 3LL),  v8,  0LL,  0LL,  0LL,  (double)a5,  0LL);
  id result = -[NSMutableData length](v8, "length");
  if (result) {
    return -[NSString initWithData:encoding:](objc_alloc(&OBJC_CLASS___NSString), "initWithData:encoding:", v8, 4LL);
  }
  return result;
}

- (id)__collectBonjourRecords:(id)a3
{
  id v5 = objc_alloc_init(&OBJC_CLASS___W5LogItemReceipt);
  [v5 setRequest:a3];
  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v5, "setStartedAt:");
  id v6 = objc_msgSend(objc_msgSend(a3, "configuration"), "objectForKeyedSubscript:", @"OutputDirectory");
  id v7 = +[NSMutableString string](&OBJC_CLASS___NSMutableString, "string");
  [v7 appendString:@"# --- Bonjour Records\n\n"];
  id v8 = -[W5LogManager __browseBonjourInstancesWithServiceType:duration:]( self,  "__browseBonjourInstancesWithServiceType:duration:",  @"_appletv-v2._tcp",  1LL);
  __int128 v41 = 0u;
  __int128 v42 = 0u;
  __int128 v43 = 0u;
  __int128 v44 = 0u;
  id v9 = [v8 countByEnumeratingWithState:&v41 objects:v49 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v42;
    do
    {
      uint64_t v12 = 0LL;
      do
      {
        if (*(void *)v42 != v11) {
          objc_enumerationMutation(v8);
        }
        [v7 appendFormat:@"%@\n", -[W5LogManager __resolveBonjourInstance:serviceType:duration:]( self, "__resolveBonjourInstance:serviceType:duration:", *(void *)(*((void *)&v41 + 1) + 8 * (void)v12), @"_appletv-v2._tcp", 1)];
        uint64_t v12 = (char *)v12 + 1;
      }

      while (v10 != v12);
      id v10 = [v8 countByEnumeratingWithState:&v41 objects:v49 count:16];
    }

    while (v10);
  }

  id v13 = -[W5LogManager __browseBonjourInstancesWithServiceType:duration:]( self,  "__browseBonjourInstancesWithServiceType:duration:",  @"_airport._tcp",  1LL);
  __int128 v37 = 0u;
  __int128 v38 = 0u;
  __int128 v39 = 0u;
  __int128 v40 = 0u;
  id v14 = [v13 countByEnumeratingWithState:&v37 objects:v48 count:16];
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = *(void *)v38;
    do
    {
      __int128 v17 = 0LL;
      do
      {
        if (*(void *)v38 != v16) {
          objc_enumerationMutation(v13);
        }
        [v7 appendFormat:@"%@\n", -[W5LogManager __resolveBonjourInstance:serviceType:duration:]( self, "__resolveBonjourInstance:serviceType:duration:", *(void *)(*((void *)&v37 + 1) + 8 * (void)v17), @"_airport._tcp", 1)];
        __int128 v17 = (char *)v17 + 1;
      }

      while (v15 != v17);
      id v15 = [v13 countByEnumeratingWithState:&v37 objects:v48 count:16];
    }

    while (v15);
  }

  id v18 = -[W5LogManager __browseBonjourInstancesWithServiceType:duration:]( self,  "__browseBonjourInstancesWithServiceType:duration:",  @"_homekit._tcp",  1LL);
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  __int128 v35 = 0u;
  __int128 v36 = 0u;
  id v19 = [v18 countByEnumeratingWithState:&v33 objects:v47 count:16];
  if (v19)
  {
    id v20 = v19;
    uint64_t v21 = *(void *)v34;
    do
    {
      __int128 v22 = 0LL;
      do
      {
        if (*(void *)v34 != v21) {
          objc_enumerationMutation(v18);
        }
        [v7 appendFormat:@"%@\n", -[W5LogManager __resolveBonjourInstance:serviceType:duration:]( self, "__resolveBonjourInstance:serviceType:duration:", *(void *)(*((void *)&v33 + 1) + 8 * (void)v22), @"_homekit._tcp", 1)];
        __int128 v22 = (char *)v22 + 1;
      }

      while (v20 != v22);
      id v20 = [v18 countByEnumeratingWithState:&v33 objects:v47 count:16];
    }

    while (v20);
  }

  id v23 = -[W5LogManager __browseBonjourInstancesWithServiceType:duration:]( self,  "__browseBonjourInstancesWithServiceType:duration:",  @"_hap._tcp",  1LL);
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  id v24 = [v23 countByEnumeratingWithState:&v29 objects:v46 count:16];
  if (v24)
  {
    id v25 = v24;
    uint64_t v26 = *(void *)v30;
    do
    {
      v27 = 0LL;
      do
      {
        if (*(void *)v30 != v26) {
          objc_enumerationMutation(v23);
        }
        [v7 appendFormat:@"%@\n", -[W5LogManager __resolveBonjourInstance:serviceType:duration:]( self, "__resolveBonjourInstance:serviceType:duration:", *(void *)(*((void *)&v29 + 1) + 8 * (void)v27), @"_hap._tcp", 1)];
        v27 = (char *)v27 + 1;
      }

      while (v25 != v27);
      id v25 = [v23 countByEnumeratingWithState:&v29 objects:v46 count:16];
    }

    while (v25);
  }

  if (-[NSFileManager createFileAtPath:contents:attributes:]( +[NSFileManager defaultManager](NSFileManager, "defaultManager"),  "createFileAtPath:contents:attributes:",  objc_msgSend(objc_msgSend(v6, "path"), "stringByAppendingPathComponent:", @"bonjour_records.txt"),  objc_msgSend(v7, "dataUsingEncoding:", 4),  0))
  {
    v45 = +[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", @"bonjour_records.txt");
    objc_msgSend( v5,  "setRelativeURLs:",  +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v45, 1));
  }

  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v5, "setCompletedAt:");
  return v5;
}

- (id)__collectAWDLStatus:(id)a3
{
  id v5 = objc_alloc_init(&OBJC_CLASS___W5LogItemReceipt);
  [v5 setRequest:a3];
  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v5, "setStartedAt:");
  id v6 = objc_msgSend(objc_msgSend(a3, "configuration"), "objectForKeyedSubscript:", @"OutputDirectory");
  id v7 = objc_msgSend(objc_msgSend(a3, "configuration"), "objectForKeyedSubscript:", @"InternalUUID");
  unsigned int v8 = objc_msgSend( objc_msgSend( objc_msgSend(a3, "configuration"),  "objectForKeyedSubscript:",  @"UseCachedStatus"),  "BOOLValue");
  status = self->_status;
  if (v8) {
    id v10 = objc_msgSend(-[W5StatusManager cachedStatusWithUUID:](status, "cachedStatusWithUUID:", v7), "awdl");
  }
  else {
    id v10 = -[W5StatusManager awdlStatus](status, "awdlStatus");
  }
  uint64_t v11 = v10;
  id v12 = +[NSMutableString string](&OBJC_CLASS___NSMutableString, "string");
  [v12 appendString:@"# --- AWDL Status\n\n"];
  objc_msgSend(v12, "appendString:", -[W5LogManager __logAWDLStatus:](self, "__logAWDLStatus:", v11));
  [v12 appendString:@"\n\n"];
  id v13 = objc_msgSend(objc_msgSend(v6, "path"), "stringByAppendingPathComponent:", @"awdl_status.txt");
  if (-[NSFileManager createFileAtPath:contents:attributes:]( +[NSFileManager defaultManager](NSFileManager, "defaultManager"),  "createFileAtPath:contents:attributes:",  v13,  [v12 dataUsingEncoding:4],  0))
  {
    id v14 = [v11 interfaceName];
    if (v14)
    {
      id v15 = v14;
      uint64_t v16 = +[NSFileHandle fileHandleForUpdatingAtPath:]( &OBJC_CLASS___NSFileHandle,  "fileHandleForUpdatingAtPath:",  v13);
      -[NSFileHandle seekToEndOfFile](v16, "seekToEndOfFile");
      v19[0] = v15;
      v19[1] = @"-dbg=print_sr";
      -[W5LogManager __runToolWithOutputFileHandle:readFromStandardError:launchPath:arguments:addCommand:addTimestamps:]( self,  "__runToolWithOutputFileHandle:readFromStandardError:launchPath:arguments:addCommand:addTimestamps:",  v16,  0LL,  @"/usr/local/bin/apple80211",  +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v19, 2LL),  1LL,  0LL);
      -[NSFileHandle closeFile](v16, "closeFile");
    }

    id v18 = +[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", @"awdl_status.txt");
    objc_msgSend( v5,  "setRelativeURLs:",  +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v18, 1));
  }

  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v5, "setCompletedAt:");
  return v5;
}

- (id)__collectNetworkStatus:(id)a3
{
  id v5 = objc_alloc_init(&OBJC_CLASS___W5LogItemReceipt);
  [v5 setRequest:a3];
  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v5, "setStartedAt:");
  id v6 = objc_msgSend(objc_msgSend(a3, "configuration"), "objectForKeyedSubscript:", @"OutputDirectory");
  id v7 = objc_msgSend(objc_msgSend(a3, "configuration"), "objectForKeyedSubscript:", @"InternalUUID");
  unsigned int v8 = objc_msgSend( objc_msgSend( objc_msgSend(a3, "configuration"),  "objectForKeyedSubscript:",  @"UseCachedStatus"),  "BOOLValue");
  status = self->_status;
  if (v8) {
    id v10 = objc_msgSend(-[W5StatusManager cachedStatusWithUUID:](status, "cachedStatusWithUUID:", v7), "network");
  }
  else {
    id v10 = -[W5StatusManager networkStatus](status, "networkStatus");
  }
  id v11 = v10;
  id v12 = +[NSMutableString string](&OBJC_CLASS___NSMutableString, "string");
  [v12 appendString:@"# --- Network Status\n\n"];
  objc_msgSend( v12,  "appendString:",  +[W5LogManager __logNetworkStatus:](W5LogManager, "__logNetworkStatus:", v11));
  [v12 appendString:@"\n\n"];
  if (-[NSFileManager createFileAtPath:contents:attributes:]( +[NSFileManager defaultManager](NSFileManager, "defaultManager"),  "createFileAtPath:contents:attributes:",  objc_msgSend(objc_msgSend(v6, "path"), "stringByAppendingPathComponent:", @"network_status.txt"),  objc_msgSend(v12, "dataUsingEncoding:", 4),  0))
  {
    id v14 = +[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", @"network_status.txt");
    objc_msgSend( v5,  "setRelativeURLs:",  +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v14, 1));
  }

  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v5, "setCompletedAt:");
  return v5;
}

- (id)__collectWiFiStatus:(id)a3
{
  id v5 = objc_alloc_init(&OBJC_CLASS___W5LogItemReceipt);
  [v5 setRequest:a3];
  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v5, "setStartedAt:");
  id v6 = objc_msgSend(objc_msgSend(a3, "configuration"), "objectForKeyedSubscript:", @"OutputDirectory");
  id v7 = objc_msgSend(objc_msgSend(a3, "configuration"), "objectForKeyedSubscript:", @"InternalUUID");
  unsigned int v8 = objc_msgSend( objc_msgSend( objc_msgSend(a3, "configuration"),  "objectForKeyedSubscript:",  @"UseCachedStatus"),  "BOOLValue");
  status = self->_status;
  if (v8) {
    id v10 = objc_msgSend(-[W5StatusManager cachedStatusWithUUID:](status, "cachedStatusWithUUID:", v7), "wifi");
  }
  else {
    id v10 = -[W5StatusManager wifiStatus](status, "wifiStatus");
  }
  id v11 = v10;
  id v12 = +[NSMutableString string](&OBJC_CLASS___NSMutableString, "string");
  [v12 appendString:@"# --- Wi-Fi Status\n\n"];
  objc_msgSend( v12,  "appendString:",  +[W5LogManager __logWiFiStatus:](W5LogManager, "__logWiFiStatus:", v11));
  [v12 appendString:@"\n\n"];
  if (-[NSFileManager createFileAtPath:contents:attributes:]( +[NSFileManager defaultManager](NSFileManager, "defaultManager"),  "createFileAtPath:contents:attributes:",  objc_msgSend(objc_msgSend(v6, "path"), "stringByAppendingPathComponent:", @"wifi_status.txt"),  objc_msgSend(v12, "dataUsingEncoding:", 4),  0))
  {
    id v14 = +[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", @"wifi_status.txt");
    objc_msgSend( v5,  "setRelativeURLs:",  +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v14, 1));
  }

  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v5, "setCompletedAt:");
  return v5;
}

- (id)__collectBluetoothStatus:(id)a3
{
  id v5 = objc_alloc_init(&OBJC_CLASS___W5LogItemReceipt);
  [v5 setRequest:a3];
  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v5, "setStartedAt:");
  id v6 = objc_msgSend(objc_msgSend(a3, "configuration"), "objectForKeyedSubscript:", @"OutputDirectory");
  id v7 = objc_msgSend(objc_msgSend(a3, "configuration"), "objectForKeyedSubscript:", @"InternalUUID");
  unsigned int v8 = objc_msgSend( objc_msgSend( objc_msgSend(a3, "configuration"),  "objectForKeyedSubscript:",  @"UseCachedStatus"),  "BOOLValue");
  status = self->_status;
  if (v8) {
    id v10 = objc_msgSend(-[W5StatusManager cachedStatusWithUUID:](status, "cachedStatusWithUUID:", v7), "bluetooth");
  }
  else {
    id v10 = -[W5StatusManager bluetoothStatus](status, "bluetoothStatus");
  }
  id v11 = v10;
  id v12 = +[NSMutableString string](&OBJC_CLASS___NSMutableString, "string");
  [v12 appendString:@"# --- Bluetooth Status\n\n"];
  objc_msgSend( v12,  "appendString:",  +[W5LogManager __logBluetoothStatus:](W5LogManager, "__logBluetoothStatus:", v11));
  [v12 appendString:@"\n\n"];
  if (-[NSFileManager createFileAtPath:contents:attributes:]( +[NSFileManager defaultManager](NSFileManager, "defaultManager"),  "createFileAtPath:contents:attributes:",  objc_msgSend(objc_msgSend(v6, "path"), "stringByAppendingPathComponent:", @"bluetooth_status.txt"),  objc_msgSend(v12, "dataUsingEncoding:", 4),  0))
  {
    id v14 = +[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", @"bluetooth_status.txt");
    objc_msgSend( v5,  "setRelativeURLs:",  +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v14, 1));
  }

  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v5, "setCompletedAt:");
  return v5;
}

- (id)__collect_swvers:(id)a3
{
  id v4 = objc_alloc_init(&OBJC_CLASS___W5LogItemReceipt);
  [v4 setRequest:a3];
  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v4, "setStartedAt:");
  if (+[NSTask runTaskWithLaunchPath:arguments:outputFilePath:error:]( NSTask,  "runTaskWithLaunchPath:arguments:outputFilePath:error:",  @"/usr/bin/sw_vers",  0,  objc_msgSend( objc_msgSend( objc_msgSend(objc_msgSend(a3, "configuration"), "objectForKeyedSubscript:", @"OutputDirectory"),  "path"),  "stringByAppendingPathComponent:",  @"sw_vers.txt"),  0))
  {
    id v6 = +[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", @"sw_vers.txt");
    objc_msgSend( v4,  "setRelativeURLs:",  +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v6, 1));
  }

  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v4, "setCompletedAt:");
  return v4;
}

- (id)__collect_arp:(id)a3
{
  id v5 = objc_alloc_init(&OBJC_CLASS___W5LogItemReceipt);
  [v5 setRequest:a3];
  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v5, "setStartedAt:");
  id v6 = objc_msgSend(objc_msgSend(a3, "configuration"), "objectForKeyedSubscript:", @"OutputDirectory");
  unsigned int v7 = objc_msgSend( objc_msgSend( objc_msgSend(a3, "configuration"),  "objectForKeyedSubscript:",  @"ResolveHostnames"),  "BOOLValue");
  id v8 = objc_msgSend(objc_msgSend(v6, "path"), "stringByAppendingPathComponent:", @"arp.txt");
  -[NSFileManager removeItemAtPath:error:]( +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"),  "removeItemAtPath:error:",  v8,  0LL);
  -[NSFileManager createFileAtPath:contents:attributes:]( +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"),  "createFileAtPath:contents:attributes:",  v8,  0LL,  0LL);
  id v9 = +[NSFileHandle fileHandleForUpdatingAtPath:](&OBJC_CLASS___NSFileHandle, "fileHandleForUpdatingAtPath:", v8);
  if (v9)
  {
    id v10 = v9;
    if (v7) {
      id v11 = &off_1000E3C48;
    }
    else {
      id v11 = &off_1000E3C60;
    }
    -[W5LogManager __runToolWithOutputFileHandle:launchPath:arguments:]( self,  "__runToolWithOutputFileHandle:launchPath:arguments:",  v9,  @"/usr/sbin/arp",  v11);
    -[NSFileHandle closeFile](v10, "closeFile");
    id v13 = +[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", @"arp.txt");
    objc_msgSend( v5,  "setRelativeURLs:",  +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v13, 1));
  }

  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v5, "setCompletedAt:");
  return v5;
}

- (id)__collectSystemProfiler:(id)a3
{
  id v4 = objc_alloc_init(&OBJC_CLASS___W5LogItemReceipt);
  [v4 setRequest:a3];
  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v4, "setStartedAt:");
  id v5 = objc_msgSend( objc_msgSend(objc_msgSend(a3, "configuration"), "objectForKeyedSubscript:", @"OutputDirectory"),  "URLByAppendingPathComponent:",  @"system_profiler.spx");
  v9[0] = @"-detailLevel";
  v9[1] = @"full";
  v9[2] = @"-timeout";
  void v9[3] = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%.0f",  0x4034000000000000LL);
  void v9[4] = @"-xml";
  uint64_t v7 = 0LL;
  if (+[NSTask runTaskWithLaunchPath:arguments:outputFilePath:error:]( NSTask,  "runTaskWithLaunchPath:arguments:outputFilePath:error:",  @"/usr/sbin/system_profiler",  +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v9, 5),  [v5 path],  &v7))
  {
    id v8 = +[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", @"system_profiler.spx");
    objc_msgSend( v4,  "setRelativeURLs:",  +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v8, 1));
  }

  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v4, "setCompletedAt:");
  return v4;
}

- (id)__collect_IMFoundationPing:(id)a3
{
  id v5 = objc_alloc_init(&OBJC_CLASS___W5LogItemReceipt);
  [v5 setRequest:a3];
  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v5, "setStartedAt:");
  id v37 = objc_msgSend(objc_msgSend(a3, "configuration"), "objectForKeyedSubscript:", @"OutputDirectory");
  id v6 = +[NSMutableData data](&OBJC_CLASS___NSMutableData, "data");
  id v7 = +[NSMutableString string](&OBJC_CLASS___NSMutableString, "string");
  [v7 appendString:@"————————————————————————————————————————————————————————————————————\n"];
  [v7 appendString:@"Ping localhost (loopback)\n"];
  [v7 appendString:@"————————————————————————————————————————————————————————————————————\n"];
  id v8 = -[W5LogManager __pingUsingIMFoundationWithAddress:timeout:]( self,  "__pingUsingIMFoundationWithAddress:timeout:",  @"localhost",  1LL);
  [v8 packetLoss];
  if (v9 >= 100.0) {
    id v10 = @"FAIL";
  }
  else {
    id v10 = @"PASS";
  }
  [v8 min];
  [v7 appendFormat:@"%@ -- %.2f ms\n\n", v10, v11];
  objc_msgSend(v6, "appendData:", objc_msgSend(v7, "dataUsingEncoding:", 4));
  id v12 = -[CWFInterface IPv4RouterAddress](-[W5StatusManager corewifi](self->_status, "corewifi"), "IPv4RouterAddress");
  if (v12
    || (id v12 = -[CWFInterface IPv6RouterAddress]( -[W5StatusManager corewifi](self->_status, "corewifi"),  "IPv6RouterAddress")) != 0LL)
  {
    id v13 = +[NSMutableString string](&OBJC_CLASS___NSMutableString, "string");
    [v13 appendString:@"————————————————————————————————————————————————————————————————————\n"];
    [v13 appendFormat:@"Ping LAN (%@)\n", v12];
    [v13 appendString:@"————————————————————————————————————————————————————————————————————\n"];
    id v14 = -[W5LogManager __pingUsingIMFoundationWithAddress:timeout:]( self,  "__pingUsingIMFoundationWithAddress:timeout:",  v12,  1LL);
    [v14 packetLoss];
    if (v15 >= 100.0) {
      uint64_t v16 = @"FAIL";
    }
    else {
      uint64_t v16 = @"PASS";
    }
    [v14 min];
    [v13 appendFormat:@"%@ -- %.2f ms\n\n", v16, v17];
    objc_msgSend(v6, "appendData:", objc_msgSend(v13, "dataUsingEncoding:", 4));
  }

  id v18 = +[NSMutableString string](&OBJC_CLASS___NSMutableString, "string");
  [v18 appendString:@"————————————————————————————————————————————————————————————————————\n"];
  [v18 appendFormat:@"Ping WAN\n"];
  [v18 appendString:@"————————————————————————————————————————————————————————————————————\n"];
  id v19 = objc_msgSend( -[CWFInterface DNSServerAddresses]( -[W5StatusManager corewifi](self->_status, "corewifi"),  "DNSServerAddresses"),  "firstObject");
  id v20 = -[W5LogManager __pingUsingIMFoundationWithAddress:timeout:]( self,  "__pingUsingIMFoundationWithAddress:timeout:",  v19,  1LL);
  [v20 packetLoss];
  if (v21 >= 100.0) {
    __int128 v22 = @"FAIL";
  }
  else {
    __int128 v22 = @"PASS";
  }
  [v20 min];
  [v18 appendFormat:@"%@ -- %@ -- %.2f ms\n", v19, v22, v23];
  id v24 = sub_10008C2A8();
  id v25 = -[W5LogManager __pingUsingIMFoundationWithAddress:timeout:]( self,  "__pingUsingIMFoundationWithAddress:timeout:",  v24,  1LL);
  [v25 packetLoss];
  if (v26 >= 100.0) {
    v27 = @"FAIL";
  }
  else {
    v27 = @"PASS";
  }
  [v25 min];
  [v18 appendFormat:@"%@ -- %@ -- %.2f ms\n\n", v24, v27, v28];
  objc_msgSend(v6, "appendData:", objc_msgSend(v18, "dataUsingEncoding:", 4));
  id v29 = +[NSMutableString string](&OBJC_CLASS___NSMutableString, "string");
  [v29 appendString:@"————————————————————————————————————————————————————————————————————\n"];
  [v29 appendFormat:@"Ping Performance (%@)\n", v12];
  [v29 appendString:@"————————————————————————————————————————————————————————————————————\n"];
  id v30 = -[W5LogManager __pingUsingIMFoundationWithAddress:timeout:]( self,  "__pingUsingIMFoundationWithAddress:timeout:",  v12,  10LL);
  objc_msgSend(v29, "appendFormat:", @"count=%ld\n", objc_msgSend(v30, "count"));
  [v30 min];
  [v29 appendFormat:@"min=%.2f ms\n", v31];
  [v30 max];
  [v29 appendFormat:@"max=%.2f ms\n", v32];
  [v30 avg];
  [v29 appendFormat:@"avg=%.2f ms\n", v33];
  [v30 stddev];
  [v29 appendFormat:@"stddev=%.2f ms\n", v34];
  [v30 packetLoss];
  [v29 appendFormat:@"loss=%.2f%%\n", v35];
  objc_msgSend(v6, "appendData:", objc_msgSend(v29, "dataUsingEncoding:", 4));
  if (-[NSFileManager createFileAtPath:contents:attributes:]( +[NSFileManager defaultManager](NSFileManager, "defaultManager"),  "createFileAtPath:contents:attributes:",  objc_msgSend(objc_msgSend(v37, "path"), "stringByAppendingPathComponent:", @"ping-IMFoundation.txt"),  v6,  0))
  {
    __int128 v38 = +[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", @"ping-IMFoundation.txt");
    objc_msgSend( v5,  "setRelativeURLs:",  +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v38, 1));
  }

  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v5, "setCompletedAt:");
  return v5;
}

- (id)__collect_ping:(id)a3
{
  id v5 = objc_alloc_init(&OBJC_CLASS___W5LogItemReceipt);
  [v5 setRequest:a3];
  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v5, "setStartedAt:");
  id v92 = objc_msgSend(objc_msgSend(a3, "configuration"), "objectForKeyedSubscript:", @"OutputDirectory");
  id v6 = +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array");
  id v95 = +[NSMutableData data](&OBJC_CLASS___NSMutableData, "data");
  id v7 = +[NSMutableString string](&OBJC_CLASS___NSMutableString, "string");
  v93 = v5;
  [v7 appendString:@"————————————————————————————————————————————————————————————————————\n"];
  [v7 appendString:@"Ping localhost (loopback)\n"];
  [v7 appendString:@"————————————————————————————————————————————————————————————————————\n"];
  id v8 = -[W5LogManager __pingWithAddress:count:timeout:wait:interval:trafficClass:interfaceName:dataLength:]( self,  "__pingWithAddress:count:timeout:wait:interval:trafficClass:interfaceName:dataLength:",  @"localhost",  1LL,  0LL,  -[W5WiFiInterface interfaceName](-[W5StatusManager wifi](self->_status, "wifi"), "interfaceName"),  10LL,  2.0,  2.0,  0.1);
  if (v8) {
    [v6 addObject:v8];
  }
  [v8 packetLoss];
  double v9 = @"FAIL";
  if (v10 >= 100.0) {
    uint64_t v11 = @"FAIL";
  }
  else {
    uint64_t v11 = @"PASS";
  }
  [v8 min];
  [v7 appendFormat:@"%@ -- %.2f ms\n\n", v11, v12];
  objc_msgSend(v95, "appendData:", objc_msgSend(v7, "dataUsingEncoding:", 4));
  id v13 = -[CWFInterface IPv4RouterAddress](-[W5StatusManager corewifi](self->_status, "corewifi"), "IPv4RouterAddress");
  if (v13
    || (id v13 = -[CWFInterface IPv6RouterAddress]( -[W5StatusManager corewifi](self->_status, "corewifi"),  "IPv6RouterAddress")) != 0LL)
  {
    id v14 = +[NSMutableString string](&OBJC_CLASS___NSMutableString, "string");
    [v14 appendString:@"————————————————————————————————————————————————————————————————————\n"];
    [v14 appendFormat:@"Ping LAN (%@)\n", v13];
    [v14 appendString:@"————————————————————————————————————————————————————————————————————\n"];
    id v15 = -[W5LogManager __pingWithAddress:count:timeout:wait:interval:trafficClass:interfaceName:dataLength:]( self,  "__pingWithAddress:count:timeout:wait:interval:trafficClass:interfaceName:dataLength:",  v13,  1LL,  0LL,  -[W5WiFiInterface interfaceName](-[W5StatusManager wifi](self->_status, "wifi"), "interfaceName"),  11LL,  2.0,  2.0,  0.1);
    if (v15) {
      [v6 addObject:v15];
    }
    [v15 packetLoss];
    if (v16 >= 100.0) {
      uint64_t v17 = @"FAIL";
    }
    else {
      uint64_t v17 = @"PASS";
    }
    [v15 min];
    [v14 appendFormat:@"%@ -- %.2f ms\n\n", v17, v18];
    objc_msgSend(v95, "appendData:", objc_msgSend(v14, "dataUsingEncoding:", 4));
  }

  id v19 = +[NSMutableString string](&OBJC_CLASS___NSMutableString, "string");
  [v19 appendString:@"————————————————————————————————————————————————————————————————————\n"];
  [v19 appendString:@"Ping WAN\n"];
  [v19 appendString:@"————————————————————————————————————————————————————————————————————\n"];
  id v20 = objc_msgSend( -[CWFInterface DNSServerAddresses]( -[W5StatusManager corewifi](self->_status, "corewifi"),  "DNSServerAddresses"),  "firstObject");
  id v21 = -[W5LogManager __pingWithAddress:count:timeout:wait:interval:trafficClass:interfaceName:dataLength:]( self,  "__pingWithAddress:count:timeout:wait:interval:trafficClass:interfaceName:dataLength:",  v20,  1LL,  0LL,  -[W5WiFiInterface interfaceName](-[W5StatusManager wifi](self->_status, "wifi"), "interfaceName"),  12LL,  2.0,  2.0,  0.1);
  if (v21) {
    [v6 addObject:v21];
  }
  [v21 packetLoss];
  if (v22 >= 100.0) {
    uint64_t v23 = @"FAIL";
  }
  else {
    uint64_t v23 = @"PASS";
  }
  [v21 min];
  [v19 appendFormat:@"%@ -- %@ -- %.2f ms\n", v20, v23, v24];
  id v25 = sub_10008C2A8();
  id v26 = -[W5LogManager __pingWithAddress:count:timeout:wait:interval:trafficClass:interfaceName:dataLength:]( self,  "__pingWithAddress:count:timeout:wait:interval:trafficClass:interfaceName:dataLength:",  v25,  1LL,  0LL,  -[W5WiFiInterface interfaceName](-[W5StatusManager wifi](self->_status, "wifi"), "interfaceName"),  13LL,  2.0,  2.0,  0.1);
  if (v26) {
    [v6 addObject:v26];
  }
  [v26 packetLoss];
  if (v27 >= 100.0) {
    uint64_t v28 = @"FAIL";
  }
  else {
    uint64_t v28 = @"PASS";
  }
  [v26 min];
  [v19 appendFormat:@"%@ -- %@ -- %.2f ms\n\n", v25, v28, v29];
  objc_msgSend(v95, "appendData:", objc_msgSend(v19, "dataUsingEncoding:", 4));
  id v30 = +[NSMutableString string](&OBJC_CLASS___NSMutableString, "string");
  [v30 appendString:@"————————————————————————————————————————————————————————————————————\n"];
  [v30 appendFormat:@"Ping QOS (%@)\n", v13];
  [v30 appendString:@"————————————————————————————————————————————————————————————————————\n"];
  id v31 = -[W5LogManager __pingWithAddress:count:timeout:wait:interval:trafficClass:interfaceName:dataLength:]( self,  "__pingWithAddress:count:timeout:wait:interval:trafficClass:interfaceName:dataLength:",  v25,  1LL,  &off_1000DF198,  -[W5WiFiInterface interfaceName](-[W5StatusManager wifi](self->_status, "wifi"), "interfaceName"),  14LL,  2.0,  2.0,  0.1);
  if (v31) {
    [v6 addObject:v31];
  }
  [v31 packetLoss];
  if (v32 >= 100.0) {
    uint64_t v33 = @"FAIL";
  }
  else {
    uint64_t v33 = @"PASS";
  }
  [v31 min];
  [v30 appendFormat:@"BE -- %@ -- %.2f ms\n", v33, v34];
  id v35 = -[W5LogManager __pingWithAddress:count:timeout:wait:interval:trafficClass:interfaceName:dataLength:]( self,  "__pingWithAddress:count:timeout:wait:interval:trafficClass:interfaceName:dataLength:",  v25,  1LL,  &off_1000DF630,  -[W5WiFiInterface interfaceName](-[W5StatusManager wifi](self->_status, "wifi"), "interfaceName"),  15LL,  2.0,  2.0,  0.1);
  if (v35) {
    [v6 addObject:v35];
  }
  [v35 packetLoss];
  if (v36 >= 100.0) {
    id v37 = @"FAIL";
  }
  else {
    id v37 = @"PASS";
  }
  [v35 min];
  [v30 appendFormat:@"BK_SYS -- %@ -- %.2f ms\n", v37, v38];
  id v39 = -[W5LogManager __pingWithAddress:count:timeout:wait:interval:trafficClass:interfaceName:dataLength:]( self,  "__pingWithAddress:count:timeout:wait:interval:trafficClass:interfaceName:dataLength:",  v25,  1LL,  &off_1000DF1B0,  -[W5WiFiInterface interfaceName](-[W5StatusManager wifi](self->_status, "wifi"), "interfaceName"),  16LL,  2.0,  2.0,  0.1);
  if (v39) {
    [v6 addObject:v39];
  }
  [v39 packetLoss];
  if (v40 >= 100.0) {
    __int128 v41 = @"FAIL";
  }
  else {
    __int128 v41 = @"PASS";
  }
  [v39 min];
  [v30 appendFormat:@"BK -- %@ -- %.2f ms\n", v41, v42];
  id v43 = -[W5LogManager __pingWithAddress:count:timeout:wait:interval:trafficClass:interfaceName:dataLength:]( self,  "__pingWithAddress:count:timeout:wait:interval:trafficClass:interfaceName:dataLength:",  v25,  1LL,  &off_1000DF648,  -[W5WiFiInterface interfaceName](-[W5StatusManager wifi](self->_status, "wifi"), "interfaceName"),  17LL,  2.0,  2.0,  0.1);
  if (v43) {
    [v6 addObject:v43];
  }
  [v43 packetLoss];
  if (v44 >= 100.0) {
    v45 = @"FAIL";
  }
  else {
    v45 = @"PASS";
  }
  [v43 min];
  [v30 appendFormat:@"RD -- %@ -- %.2f ms\n", v45, v46];
  id v47 = -[W5LogManager __pingWithAddress:count:timeout:wait:interval:trafficClass:interfaceName:dataLength:]( self,  "__pingWithAddress:count:timeout:wait:interval:trafficClass:interfaceName:dataLength:",  v25,  1LL,  &off_1000DF660,  -[W5WiFiInterface interfaceName](-[W5StatusManager wifi](self->_status, "wifi"), "interfaceName"),  18LL,  2.0,  2.0,  0.1);
  if (v47) {
    [v6 addObject:v47];
  }
  [v47 packetLoss];
  if (v48 >= 100.0) {
    __int16 v49 = @"FAIL";
  }
  else {
    __int16 v49 = @"PASS";
  }
  [v47 min];
  [v30 appendFormat:@"OAM -- %@ -- %.2f ms\n", v49, v50];
  id v51 = -[W5LogManager __pingWithAddress:count:timeout:wait:interval:trafficClass:interfaceName:dataLength:]( self,  "__pingWithAddress:count:timeout:wait:interval:trafficClass:interfaceName:dataLength:",  v25,  1LL,  &off_1000DF678,  -[W5WiFiInterface interfaceName](-[W5StatusManager wifi](self->_status, "wifi"), "interfaceName"),  19LL,  2.0,  2.0,  0.1);
  if (v51) {
    [v6 addObject:v51];
  }
  [v51 packetLoss];
  if (v52 >= 100.0) {
    __int16 v53 = @"FAIL";
  }
  else {
    __int16 v53 = @"PASS";
  }
  [v51 min];
  [v30 appendFormat:@"AV -- %@ -- %.2f ms\n", v53, v54];
  id v55 = -[W5LogManager __pingWithAddress:count:timeout:wait:interval:trafficClass:interfaceName:dataLength:]( self,  "__pingWithAddress:count:timeout:wait:interval:trafficClass:interfaceName:dataLength:",  v25,  1LL,  &off_1000DF690,  -[W5WiFiInterface interfaceName](-[W5StatusManager wifi](self->_status, "wifi"), "interfaceName"),  20LL,  2.0,  2.0,  0.1);
  if (v55) {
    [v6 addObject:v55];
  }
  [v55 packetLoss];
  if (v56 >= 100.0) {
    __int16 v57 = @"FAIL";
  }
  else {
    __int16 v57 = @"PASS";
  }
  [v55 min];
  [v30 appendFormat:@"RV -- %@ -- %.2f ms\n", v57, v58];
  id v59 = -[W5LogManager __pingWithAddress:count:timeout:wait:interval:trafficClass:interfaceName:dataLength:]( self,  "__pingWithAddress:count:timeout:wait:interval:trafficClass:interfaceName:dataLength:",  v25,  1LL,  &off_1000DF1C8,  -[W5WiFiInterface interfaceName](-[W5StatusManager wifi](self->_status, "wifi"), "interfaceName"),  21LL,  2.0,  2.0,  0.1);
  if (v59) {
    [v6 addObject:v59];
  }
  [v59 packetLoss];
  if (v60 >= 100.0) {
    __int16 v61 = @"FAIL";
  }
  else {
    __int16 v61 = @"PASS";
  }
  [v59 min];
  [v30 appendFormat:@"VI -- %@ -- %.2f ms\n", v61, v62];
  id v63 = -[W5LogManager __pingWithAddress:count:timeout:wait:interval:trafficClass:interfaceName:dataLength:]( self,  "__pingWithAddress:count:timeout:wait:interval:trafficClass:interfaceName:dataLength:",  v25,  1LL,  &off_1000DF1F8,  -[W5WiFiInterface interfaceName](-[W5StatusManager wifi](self->_status, "wifi"), "interfaceName"),  22LL,  2.0,  2.0,  0.1);
  if (v63) {
    [v6 addObject:v63];
  }
  [v63 packetLoss];
  if (v64 >= 100.0) {
    __int16 v65 = @"FAIL";
  }
  else {
    __int16 v65 = @"PASS";
  }
  [v63 min];
  [v30 appendFormat:@"VO -- %@ -- %.2f ms\n", v65, v66];
  id v67 = -[W5LogManager __pingWithAddress:count:timeout:wait:interval:trafficClass:interfaceName:dataLength:]( self,  "__pingWithAddress:count:timeout:wait:interval:trafficClass:interfaceName:dataLength:",  v25,  1LL,  &off_1000DF6A8,  -[W5WiFiInterface interfaceName](-[W5StatusManager wifi](self->_status, "wifi"), "interfaceName"),  23LL,  2.0,  2.0,  0.1);
  if (v67) {
    [v6 addObject:v67];
  }
  [v67 packetLoss];
  if (v68 >= 100.0) {
    v69 = @"FAIL";
  }
  else {
    v69 = @"PASS";
  }
  [v67 min];
  [v30 appendFormat:@"CTL -- %@ -- %.2f ms\n\n", v69, v70];
  objc_msgSend(v95, "appendData:", objc_msgSend(v30, "dataUsingEncoding:", 4));
  id v71 = +[NSMutableString string](&OBJC_CLASS___NSMutableString, "string");
  [v71 appendString:@"————————————————————————————————————————————————————————————————————\n"];
  [v71 appendFormat:@"Ping Performance (%@)\n", v13];
  [v71 appendString:@"————————————————————————————————————————————————————————————————————\n"];
  id v72 = -[W5LogManager __pingWithAddress:count:timeout:wait:interval:trafficClass:interfaceName:dataLength:]( self,  "__pingWithAddress:count:timeout:wait:interval:trafficClass:interfaceName:dataLength:",  v13,  10LL,  &off_1000DF198,  -[W5WiFiInterface interfaceName](-[W5StatusManager wifi](self->_status, "wifi"), "interfaceName"),  24LL,  21.0,  2.0,  0.1);
  if (v72) {
    [v6 addObject:v72];
  }
  objc_msgSend(v71, "appendFormat:", @"count=%ld\n", objc_msgSend(v72, "count"));
  [v72 min];
  [v71 appendFormat:@"min=%.2f ms\n", v73];
  [v72 max];
  [v71 appendFormat:@"max=%.2f ms\n", v74];
  [v72 avg];
  [v71 appendFormat:@"avg=%.2f ms\n", v75];
  [v72 stddev];
  [v71 appendFormat:@"stddev=%.2f ms\n", v76];
  [v72 packetLoss];
  [v71 appendFormat:@"loss=%.2f%%\n\n", v77];
  objc_msgSend(v95, "appendData:", objc_msgSend(v71, "dataUsingEncoding:", 4));
  id v78 = +[NSMutableString string](&OBJC_CLASS___NSMutableString, "string");
  [v78 appendString:@"————————————————————————————————————————————————————————————————————\n"];
  [v78 appendFormat:@"Ping6 AWDL (%@)\n", @"ff02::fb"];
  [v78 appendString:@"————————————————————————————————————————————————————————————————————\n"];
  v94 = self;
  id v79 = -[W5LogManager __ping6WithAddress:count:wait:trafficClass:interfaceName:dataLength:]( self,  "__ping6WithAddress:count:wait:trafficClass:interfaceName:dataLength:",  @"ff02::fb",  1LL,  0LL,  -[W5WiFiInterface interfaceName](-[W5StatusManager awdl](self->_status, "awdl"), "interfaceName"),  25LL,  2.0);
  if (v79) {
    [v6 addObject:v79];
  }
  [v79 packetLoss];
  if (v80 < 100.0) {
    double v9 = @"PASS";
  }
  [v79 min];
  [v78 appendFormat:@"%@ -- %.2f ms\n\n", v9, v81];
  objc_msgSend(v95, "appendData:", objc_msgSend(v78, "dataUsingEncoding:", 4));
  if ([v6 count])
  {
    objc_msgSend(v95, "appendData:", objc_msgSend(@"\n\n\n# --- Ping Results\n\n", "dataUsingEncoding:", 4));
    __int128 v98 = 0u;
    __int128 v99 = 0u;
    __int128 v96 = 0u;
    __int128 v97 = 0u;
    id v82 = [v6 countByEnumeratingWithState:&v96 objects:v101 count:16];
    if (v82)
    {
      id v83 = v82;
      uint64_t v84 = *(void *)v97;
      do
      {
        for (i = 0LL; i != v83; i = (char *)i + 1)
        {
          if (*(void *)v97 != v84) {
            objc_enumerationMutation(v6);
          }
          v86 = *(void **)(*((void *)&v96 + 1) + 8LL * (void)i);
          id v87 = +[NSMutableString string](&OBJC_CLASS___NSMutableString, "string");
          [v87 appendString:@"————————————————————————————————————————————————————————————————————\n"];
          dateFormatter = v94->_dateFormatter;
          [v86 startedAt];
          v89 = -[NSDateFormatter stringFromDate:]( dateFormatter,  "stringFromDate:",  +[NSDate dateWithTimeIntervalSinceReferenceDate:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceReferenceDate:"));
          v90 = v94->_dateFormatter;
          [v86 endedAt];
          [v87 appendFormat:@"[%@ - %@]\n", v89, -[NSDateFormatter stringFromDate:]( v90, "stringFromDate:", +[NSDate dateWithTimeIntervalSinceReferenceDate:]( NSDate, "dateWithTimeIntervalSinceReferenceDate:"))];
          [v87 appendFormat:@"%@\n", objc_msgSend(v86, "command")];
          [v87 appendFormat:@"%@\n", objc_msgSend(v86, "output")];
          objc_msgSend(v95, "appendData:", objc_msgSend(v87, "dataUsingEncoding:", 4));
        }

        id v83 = [v6 countByEnumeratingWithState:&v96 objects:v101 count:16];
      }

      while (v83);
    }
  }

  if (-[NSFileManager createFileAtPath:contents:attributes:]( +[NSFileManager defaultManager](NSFileManager, "defaultManager"),  "createFileAtPath:contents:attributes:",  objc_msgSend(objc_msgSend(v92, "path"), "stringByAppendingPathComponent:", @"ping.txt"),  v95,  0))
  {
    int64_t v100 = +[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", @"ping.txt");
    objc_msgSend( v93,  "setRelativeURLs:",  +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v100, 1));
  }

  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v93, "setCompletedAt:");
  return v93;
}

- (id)__collect_CFNetworkPing:(id)a3
{
  id v5 = objc_alloc_init(&OBJC_CLASS___W5LogItemReceipt);
  [v5 setRequest:a3];
  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v5, "setStartedAt:");
  id v78 = objc_msgSend(objc_msgSend(a3, "configuration"), "objectForKeyedSubscript:", @"OutputDirectory");
  id v6 = +[NSMutableData data](&OBJC_CLASS___NSMutableData, "data");
  id v7 = +[NSMutableString string](&OBJC_CLASS___NSMutableString, "string");
  [v7 appendString:@"————————————————————————————————————————————————————————————————————\n"];
  [v7 appendString:@"Ping localhost (loopback)\n"];
  [v7 appendString:@"————————————————————————————————————————————————————————————————————\n"];
  id v8 = -[W5LogManager __pingUsingCFNetworkWithAddress:count:timeout:trafficClass:networkServiceType:]( self,  "__pingUsingCFNetworkWithAddress:count:timeout:trafficClass:networkServiceType:",  @"localhost",  1LL,  1LL,  0LL,  0LL);
  [v8 packetLoss];
  if (v9 >= 100.0) {
    double v10 = @"FAIL";
  }
  else {
    double v10 = @"PASS";
  }
  [v8 min];
  [v7 appendFormat:@"%@ -- %.2f ms\n\n", v10, v11];
  objc_msgSend(v6, "appendData:", objc_msgSend(v7, "dataUsingEncoding:", 4));
  id v12 = -[CWFInterface IPv4RouterAddress](-[W5StatusManager corewifi](self->_status, "corewifi"), "IPv4RouterAddress");
  id v79 = v5;
  if (v12
    || (id v12 = -[CWFInterface IPv6RouterAddress]( -[W5StatusManager corewifi](self->_status, "corewifi"),  "IPv6RouterAddress")) != 0LL)
  {
    id v13 = +[NSMutableString string](&OBJC_CLASS___NSMutableString, "string");
    [v13 appendString:@"————————————————————————————————————————————————————————————————————\n"];
    [v13 appendFormat:@"Ping LAN (%@)\n", v12];
    [v13 appendString:@"————————————————————————————————————————————————————————————————————\n"];
    id v14 = -[W5LogManager __pingUsingCFNetworkWithAddress:count:timeout:trafficClass:networkServiceType:]( self,  "__pingUsingCFNetworkWithAddress:count:timeout:trafficClass:networkServiceType:",  v12,  1LL,  1LL,  0LL,  0LL);
    [v14 packetLoss];
    if (v15 >= 100.0) {
      double v16 = @"FAIL";
    }
    else {
      double v16 = @"PASS";
    }
    [v14 min];
    [v13 appendFormat:@"%@ -- %.2f ms\n\n", v16, v17];
    objc_msgSend(v6, "appendData:", objc_msgSend(v13, "dataUsingEncoding:", 4));
  }

  id v18 = +[NSMutableString string](&OBJC_CLASS___NSMutableString, "string");
  [v18 appendString:@"————————————————————————————————————————————————————————————————————\n"];
  [v18 appendString:@"Ping WAN\n"];
  [v18 appendString:@"————————————————————————————————————————————————————————————————————\n"];
  id v19 = objc_msgSend( -[CWFInterface DNSServerAddresses]( -[W5StatusManager corewifi](self->_status, "corewifi"),  "DNSServerAddresses"),  "firstObject");
  id v20 = -[W5LogManager __pingUsingCFNetworkWithAddress:count:timeout:trafficClass:networkServiceType:]( self,  "__pingUsingCFNetworkWithAddress:count:timeout:trafficClass:networkServiceType:",  v19,  1LL,  1LL,  0LL,  0LL);
  [v20 packetLoss];
  if (v21 >= 100.0) {
    double v22 = @"FAIL";
  }
  else {
    double v22 = @"PASS";
  }
  [v20 min];
  [v18 appendFormat:@"%@ -- %@ -- %.2f ms\n", v19, v22, v23];
  id v24 = sub_10008C2A8();
  id v25 = -[W5LogManager __pingUsingCFNetworkWithAddress:count:timeout:trafficClass:networkServiceType:]( self,  "__pingUsingCFNetworkWithAddress:count:timeout:trafficClass:networkServiceType:",  v24,  1LL,  1LL,  0LL,  0LL);
  [v25 packetLoss];
  if (v26 >= 100.0) {
    double v27 = @"FAIL";
  }
  else {
    double v27 = @"PASS";
  }
  [v25 min];
  [v18 appendFormat:@"%@ -- %@ -- %.2f ms\n\n", v24, v27, v28];
  objc_msgSend(v6, "appendData:", objc_msgSend(v18, "dataUsingEncoding:", 4));
  id v29 = +[NSMutableString string](&OBJC_CLASS___NSMutableString, "string");
  [v29 appendString:@"————————————————————————————————————————————————————————————————————\n"];
  [v29 appendFormat:@"Ping QOS (%@)\n", v12];
  [v29 appendString:@"————————————————————————————————————————————————————————————————————\n"];
  id v30 = -[W5LogManager __pingUsingCFNetworkWithAddress:count:timeout:trafficClass:networkServiceType:]( self,  "__pingUsingCFNetworkWithAddress:count:timeout:trafficClass:networkServiceType:",  v12,  1LL,  1LL,  &off_1000DF198,  0LL);
  [v30 packetLoss];
  if (v31 >= 100.0) {
    double v32 = @"FAIL";
  }
  else {
    double v32 = @"PASS";
  }
  [v30 min];
  [v29 appendFormat:@"BE -- %@ -- %.2f ms\n", v32, v33];
  id v34 = -[W5LogManager __pingUsingCFNetworkWithAddress:count:timeout:trafficClass:networkServiceType:]( self,  "__pingUsingCFNetworkWithAddress:count:timeout:trafficClass:networkServiceType:",  v12,  1LL,  1LL,  &off_1000DF630,  0LL);
  [v34 packetLoss];
  if (v35 >= 100.0) {
    double v36 = @"FAIL";
  }
  else {
    double v36 = @"PASS";
  }
  [v34 min];
  [v29 appendFormat:@"BK_SYS -- %@ -- %.2f ms\n", v36, v37];
  id v38 = -[W5LogManager __pingUsingCFNetworkWithAddress:count:timeout:trafficClass:networkServiceType:]( self,  "__pingUsingCFNetworkWithAddress:count:timeout:trafficClass:networkServiceType:",  v12,  1LL,  1LL,  &off_1000DF1B0,  0LL);
  [v38 packetLoss];
  if (v39 >= 100.0) {
    double v40 = @"FAIL";
  }
  else {
    double v40 = @"PASS";
  }
  [v38 min];
  [v29 appendFormat:@"BK -- %@ -- %.2f ms\n", v40, v41];
  id v42 = -[W5LogManager __pingUsingCFNetworkWithAddress:count:timeout:trafficClass:networkServiceType:]( self,  "__pingUsingCFNetworkWithAddress:count:timeout:trafficClass:networkServiceType:",  v12,  1LL,  1LL,  &off_1000DF648,  0LL);
  [v42 packetLoss];
  if (v43 >= 100.0) {
    double v44 = @"FAIL";
  }
  else {
    double v44 = @"PASS";
  }
  [v42 min];
  [v29 appendFormat:@"RD -- %@ -- %.2f ms\n", v44, v45];
  id v46 = -[W5LogManager __pingUsingCFNetworkWithAddress:count:timeout:trafficClass:networkServiceType:]( self,  "__pingUsingCFNetworkWithAddress:count:timeout:trafficClass:networkServiceType:",  v12,  1LL,  1LL,  &off_1000DF660,  0LL);
  [v46 packetLoss];
  if (v47 >= 100.0) {
    double v48 = @"FAIL";
  }
  else {
    double v48 = @"PASS";
  }
  [v46 min];
  [v29 appendFormat:@"OAM -- %@ -- %.2f ms\n", v48, v49];
  id v50 = -[W5LogManager __pingUsingCFNetworkWithAddress:count:timeout:trafficClass:networkServiceType:]( self,  "__pingUsingCFNetworkWithAddress:count:timeout:trafficClass:networkServiceType:",  v12,  1LL,  1LL,  &off_1000DF678,  0LL);
  [v50 packetLoss];
  if (v51 >= 100.0) {
    double v52 = @"FAIL";
  }
  else {
    double v52 = @"PASS";
  }
  [v50 min];
  [v29 appendFormat:@"AV -- %@ -- %.2f ms\n", v52, v53];
  id v54 = -[W5LogManager __pingUsingCFNetworkWithAddress:count:timeout:trafficClass:networkServiceType:]( self,  "__pingUsingCFNetworkWithAddress:count:timeout:trafficClass:networkServiceType:",  v12,  1LL,  1LL,  &off_1000DF690,  0LL);
  [v54 packetLoss];
  if (v55 >= 100.0) {
    double v56 = @"FAIL";
  }
  else {
    double v56 = @"PASS";
  }
  [v54 min];
  [v29 appendFormat:@"RV -- %@ -- %.2f ms\n", v56, v57];
  id v58 = -[W5LogManager __pingUsingCFNetworkWithAddress:count:timeout:trafficClass:networkServiceType:]( self,  "__pingUsingCFNetworkWithAddress:count:timeout:trafficClass:networkServiceType:",  v12,  1LL,  1LL,  &off_1000DF1C8,  0LL);
  [v58 packetLoss];
  if (v59 >= 100.0) {
    double v60 = @"FAIL";
  }
  else {
    double v60 = @"PASS";
  }
  [v58 min];
  [v29 appendFormat:@"VI -- %@ -- %.2f ms\n", v60, v61];
  id v62 = -[W5LogManager __pingUsingCFNetworkWithAddress:count:timeout:trafficClass:networkServiceType:]( self,  "__pingUsingCFNetworkWithAddress:count:timeout:trafficClass:networkServiceType:",  v12,  1LL,  1LL,  &off_1000DF1F8,  0LL);
  [v62 packetLoss];
  if (v63 >= 100.0) {
    double v64 = @"FAIL";
  }
  else {
    double v64 = @"PASS";
  }
  [v62 min];
  [v29 appendFormat:@"VO -- %@ -- %.2f ms\n", v64, v65];
  id v66 = -[W5LogManager __pingUsingCFNetworkWithAddress:count:timeout:trafficClass:networkServiceType:]( self,  "__pingUsingCFNetworkWithAddress:count:timeout:trafficClass:networkServiceType:",  v12,  1LL,  1LL,  &off_1000DF6A8,  0LL);
  [v66 packetLoss];
  if (v67 >= 100.0) {
    double v68 = @"FAIL";
  }
  else {
    double v68 = @"PASS";
  }
  [v66 min];
  [v29 appendFormat:@"CTL -- %@ -- %.2f ms\n\n", v68, v69];
  objc_msgSend(v6, "appendData:", objc_msgSend(v29, "dataUsingEncoding:", 4));
  id v70 = +[NSMutableString string](&OBJC_CLASS___NSMutableString, "string");
  [v70 appendString:@"————————————————————————————————————————————————————————————————————\n"];
  [v70 appendFormat:@"Ping Performance (%@)\n", v12];
  [v70 appendString:@"————————————————————————————————————————————————————————————————————\n"];
  id v71 = -[W5LogManager __pingUsingCFNetworkWithAddress:count:timeout:trafficClass:networkServiceType:]( self,  "__pingUsingCFNetworkWithAddress:count:timeout:trafficClass:networkServiceType:",  v12,  10LL,  1LL,  &off_1000DF198,  0LL);
  objc_msgSend(v70, "appendFormat:", @"count=%ld\n", objc_msgSend(v71, "count"));
  [v71 min];
  [v70 appendFormat:@"min=%.2f ms\n", v72];
  [v71 max];
  [v70 appendFormat:@"max=%.2f ms\n", v73];
  [v71 avg];
  [v70 appendFormat:@"avg=%.2f ms\n", v74];
  [v71 stddev];
  [v70 appendFormat:@"stddev=%.2f ms\n", v75];
  [v71 packetLoss];
  [v70 appendFormat:@"loss=%.2f%%\n", v76];
  objc_msgSend(v6, "appendData:", objc_msgSend(v70, "dataUsingEncoding:", 4));
  if (-[NSFileManager createFileAtPath:contents:attributes:]( +[NSFileManager defaultManager](NSFileManager, "defaultManager"),  "createFileAtPath:contents:attributes:",  objc_msgSend(objc_msgSend(v78, "path"), "stringByAppendingPathComponent:", @"ping-CFNetwork.txt"),  v6,  0))
  {
    double v80 = +[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", @"ping-CFNetwork.txt");
    objc_msgSend( v79,  "setRelativeURLs:",  +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v80, 1));
  }

  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v79, "setCompletedAt:");
  return v79;
}

- (id)__collect_ifconfig:(id)a3
{
  id v5 = objc_alloc_init(&OBJC_CLASS___W5LogItemReceipt);
  [v5 setRequest:a3];
  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v5, "setStartedAt:");
  id v6 = objc_msgSend( objc_msgSend( objc_msgSend(objc_msgSend(a3, "configuration"), "objectForKeyedSubscript:", @"OutputDirectory"),  "path"),  "stringByAppendingPathComponent:",  @"ifconfig.txt");
  -[NSFileManager removeItemAtPath:error:]( +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"),  "removeItemAtPath:error:",  v6,  0LL);
  -[NSFileManager createFileAtPath:contents:attributes:]( +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"),  "createFileAtPath:contents:attributes:",  v6,  0LL,  0LL);
  id v7 = +[NSFileHandle fileHandleForUpdatingAtPath:](&OBJC_CLASS___NSFileHandle, "fileHandleForUpdatingAtPath:", v6);
  if (v7)
  {
    id v8 = v7;
    -[W5LogManager __runToolWithOutputFileHandle:launchPath:arguments:]( self,  "__runToolWithOutputFileHandle:launchPath:arguments:",  v7,  @"/sbin/ifconfig",  &off_1000E3C78);
    -[NSFileHandle closeFile](v8, "closeFile");
    double v10 = +[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", @"ifconfig.txt");
    objc_msgSend( v5,  "setRelativeURLs:",  +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v10, 1));
  }

  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v5, "setCompletedAt:");
  return v5;
}

- (id)__collect_ipconfig:(id)a3
{
  id v5 = objc_alloc_init(&OBJC_CLASS___W5LogItemReceipt);
  [v5 setRequest:a3];
  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v5, "setStartedAt:");
  id v6 = objc_msgSend(objc_msgSend(a3, "configuration"), "objectForKeyedSubscript:", @"OutputDirectory");
  id v7 = -[W5WiFiInterface interfaceName](-[W5StatusManager wifi](self->_status, "wifi"), "interfaceName");
  if (v7)
  {
    v10[0] = @"getpacket";
    v10[1] = v7;
    if (+[NSTask runTaskWithLaunchPath:arguments:outputFilePath:error:]( NSTask,  "runTaskWithLaunchPath:arguments:outputFilePath:error:",  @"/usr/sbin/ipconfig",  +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v10, 2),  objc_msgSend(objc_msgSend(v6, "path"), "stringByAppendingPathComponent:", @"ipconfig.txt"),  0))
    {
      double v9 = +[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", @"ipconfig.txt");
      objc_msgSend( v5,  "setRelativeURLs:",  +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v9, 1));
    }
  }

  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v5, "setCompletedAt:");
  return v5;
}

- (id)__collect_traceroute:(id)a3
{
  id v5 = objc_alloc_init(&OBJC_CLASS___W5LogItemReceipt);
  [v5 setRequest:a3];
  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v5, "setStartedAt:");
  id v6 = objc_msgSend(objc_msgSend(a3, "configuration"), "objectForKeyedSubscript:", @"OutputDirectory");
  id v7 = -[W5WiFiInterface interfaceName](-[W5StatusManager wifi](self->_status, "wifi"), "interfaceName");
  if (v7)
  {
    v10[0] = @"-n";
    v10[1] = @"-m";
    void v10[2] = @"6";
    void v10[3] = @"-i";
    void v10[4] = v7;
    v10[5] = @"-w";
    v10[6] = @"2";
    v10[7] = @"-q";
    v10[8] = @"1";
    v10[9] = @"captive.apple.com";
    if (+[NSTask runTaskWithLaunchPath:arguments:outputFilePath:error:]( NSTask,  "runTaskWithLaunchPath:arguments:outputFilePath:error:",  @"/usr/sbin/traceroute",  +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v10, 10),  objc_msgSend(objc_msgSend(v6, "path"), "stringByAppendingPathComponent:", @"traceroute.txt"),  0))
    {
      double v9 = +[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", @"traceroute.txt");
      objc_msgSend( v5,  "setRelativeURLs:",  +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v9, 1));
    }
  }

  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v5, "setCompletedAt:");
  return v5;
}

- (id)__collect_kextstat:(id)a3
{
  id v4 = objc_alloc_init(&OBJC_CLASS___W5LogItemReceipt);
  [v4 setRequest:a3];
  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v4, "setStartedAt:");
  if (+[NSTask runTaskWithLaunchPath:arguments:outputFilePath:error:]( NSTask,  "runTaskWithLaunchPath:arguments:outputFilePath:error:",  @"/usr/sbin/kextstat",  0,  objc_msgSend( objc_msgSend( objc_msgSend(objc_msgSend(a3, "configuration"), "objectForKeyedSubscript:", @"OutputDirectory"),  "path"),  "stringByAppendingPathComponent:",  @"kextstat.txt"),  0))
  {
    id v6 = +[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", @"kextstat.txt");
    objc_msgSend( v4,  "setRelativeURLs:",  +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v6, 1));
  }

  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v4, "setCompletedAt:");
  return v4;
}

- (id)__collect_ioreg:(id)a3
{
  id v4 = objc_alloc_init(&OBJC_CLASS___W5LogItemReceipt);
  [v4 setRequest:a3];
  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v4, "setStartedAt:");
  if (+[NSTask runTaskWithLaunchPath:arguments:outputFilePath:error:]( NSTask,  "runTaskWithLaunchPath:arguments:outputFilePath:error:",  @"/usr/sbin/ioreg",  &off_1000E3C90,  objc_msgSend( objc_msgSend( objc_msgSend(objc_msgSend(a3, "configuration"), "objectForKeyedSubscript:", @"OutputDirectory"),  "path"),  "stringByAppendingPathComponent:",  @"ioreg.txt"),  0))
  {
    id v6 = +[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", @"ioreg.txt");
    objc_msgSend( v4,  "setRelativeURLs:",  +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v6, 1));
  }

  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v4, "setCompletedAt:");
  return v4;
}

- (id)__collect_top:(id)a3
{
  id v4 = objc_alloc_init(&OBJC_CLASS___W5LogItemReceipt);
  [v4 setRequest:a3];
  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v4, "setStartedAt:");
  if (+[NSTask runTaskWithLaunchPath:arguments:outputFilePath:error:]( NSTask,  "runTaskWithLaunchPath:arguments:outputFilePath:error:",  @"/usr/bin/top",  &off_1000E3CA8,  objc_msgSend( objc_msgSend( objc_msgSend(objc_msgSend(a3, "configuration"), "objectForKeyedSubscript:", @"OutputDirectory"),  "path"),  "stringByAppendingPathComponent:",  @"top.txt"),  0))
  {
    id v6 = +[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", @"top.txt");
    objc_msgSend( v4,  "setRelativeURLs:",  +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v6, 1));
  }

  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v4, "setCompletedAt:");
  return v4;
}

- (id)__collect_netstat:(id)a3
{
  id v5 = objc_alloc_init(&OBJC_CLASS___W5LogItemReceipt);
  [v5 setRequest:a3];
  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v5, "setStartedAt:");
  id v6 = objc_msgSend(objc_msgSend(a3, "configuration"), "objectForKeyedSubscript:", @"OutputDirectory");
  id v7 = (const __CFString *)objc_msgSend( objc_msgSend(a3, "configuration"),  "objectForKeyedSubscript:",  @"FileNameOverride");
  id v8 = [v6 path];
  if (!v7) {
    id v7 = @"netstat.txt";
  }
  id v9 = [v8 stringByAppendingPathComponent:v7];
  -[NSFileManager removeItemAtPath:error:]( +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"),  "removeItemAtPath:error:",  v9,  0LL);
  -[NSFileManager createFileAtPath:contents:attributes:]( +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"),  "createFileAtPath:contents:attributes:",  v9,  0LL,  0LL);
  double v10 = +[NSFileHandle fileHandleForUpdatingAtPath:](&OBJC_CLASS___NSFileHandle, "fileHandleForUpdatingAtPath:", v9);
  if (v10)
  {
    uint64_t v11 = v10;
    id v12 = -[W5WiFiInterface interfaceName](-[W5StatusManager wifi](self->_status, "wifi"), "interfaceName");
    if (v12)
    {
      id v13 = v12;
      v18[0] = @"-n";
      v18[1] = @"-s";
      void v18[2] = @"-I";
      void v18[3] = v12;
      -[W5LogManager __runToolWithOutputFileHandle:launchPath:arguments:]( self,  "__runToolWithOutputFileHandle:launchPath:arguments:",  v11,  @"/usr/sbin/netstat",  +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v18, 4LL));
      v17[0] = @"-n";
      v17[1] = @"-I";
      void v17[2] = v13;
      -[W5LogManager __runToolWithOutputFileHandle:launchPath:arguments:]( self,  "__runToolWithOutputFileHandle:launchPath:arguments:",  v11,  @"/usr/sbin/netstat",  +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v17, 3LL));
      v16[0] = @"-qq";
      v16[1] = @"-I";
      v16[2] = v13;
      -[W5LogManager __runToolWithOutputFileHandle:launchPath:arguments:]( self,  "__runToolWithOutputFileHandle:launchPath:arguments:",  v11,  @"/usr/sbin/netstat",  +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v16, 3LL));
    }

    -[W5LogManager __runToolWithOutputFileHandle:launchPath:arguments:]( self,  "__runToolWithOutputFileHandle:launchPath:arguments:",  v11,  @"/usr/sbin/netstat",  &off_1000E3CC0);
    -[W5LogManager __runToolWithOutputFileHandle:launchPath:arguments:]( self,  "__runToolWithOutputFileHandle:launchPath:arguments:",  v11,  @"/usr/sbin/netstat",  &off_1000E3CD8);
    -[NSFileHandle closeFile](v11, "closeFile");
    double v15 = +[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", v7);
    objc_msgSend( v5,  "setRelativeURLs:",  +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v15, 1));
  }

  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v5, "setCompletedAt:");
  return v5;
}

- (id)__collectSystemConfiguration:(id)a3
{
  id v4 = objc_alloc_init(&OBJC_CLASS___W5LogItemReceipt);
  [v4 setRequest:a3];
  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v4, "setStartedAt:");
  if (sub_10008D400( +[NSURL fileURLWithPath:]( NSURL,  "fileURLWithPath:",  @"/Library/Preferences/SystemConfiguration"),  objc_msgSend( objc_msgSend( objc_msgSend(a3, "configuration"),  "objectForKeyedSubscript:",  @"OutputDirectory"),  "URLByAppendingPathComponent:",  @"SystemConfiguration"),  0))
  {
    id v6 = +[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", @"SystemConfiguration");
    objc_msgSend( v4,  "setRelativeURLs:",  +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v6, 1));
  }

  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v4, "setCompletedAt:");
  return v4;
}

- (id)__collect_configd:(id)a3
{
  id v4 = objc_alloc_init(&OBJC_CLASS___W5LogItemReceipt);
  [v4 setRequest:a3];
  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v4, "setStartedAt:");
  id v5 = objc_msgSend(objc_msgSend(a3, "configuration"), "objectForKeyedSubscript:", @"OutputDirectory");
  if (+[NSTask runTaskWithLaunchPath:arguments:error:]( &OBJC_CLASS___NSTask,  "runTaskWithLaunchPath:arguments:error:",  @"/usr/sbin/scutil",  &off_1000E3CF0,  0LL)
    && sub_10008D400( +[NSURL fileURLWithPath:]( &OBJC_CLASS___NSURL,  "fileURLWithPath:",  @"/var/tmp/configd-store.plist"),  v5,  0LL))
  {
    id v7 = +[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", @"configd-store.plist");
    objc_msgSend( v4,  "setRelativeURLs:",  +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v7, 1));
  }

  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v4, "setCompletedAt:");
  return v4;
}

- (id)__collect_wl_curpower:(id)a3
{
  id v5 = objc_alloc_init(&OBJC_CLASS___W5LogItemReceipt);
  [v5 setRequest:a3];
  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v5, "setStartedAt:");
  if (-[W5LogManager __wlCLIWithArguments:outputFilePath:outputData:]( self,  "__wlCLIWithArguments:outputFilePath:outputData:",  &off_1000E3D08,  objc_msgSend( objc_msgSend( objc_msgSend(objc_msgSend(a3, "configuration"), "objectForKeyedSubscript:", @"OutputDirectory"),  "path"),  "stringByAppendingPathComponent:",  @"wl_curpower.txt"),  0))
  {
    id v7 = +[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", @"wl_curpower.txt");
    objc_msgSend( v5,  "setRelativeURLs:",  +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v7, 1));
  }

  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v5, "setCompletedAt:");
  return v5;
}

- (id)__collect_wl_cca_get_stats:(id)a3
{
  id v5 = objc_alloc_init(&OBJC_CLASS___W5LogItemReceipt);
  [v5 setRequest:a3];
  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v5, "setStartedAt:");
  if (-[W5LogManager __wlCLIWithArguments:outputFilePath:outputData:]( self,  "__wlCLIWithArguments:outputFilePath:outputData:",  &off_1000E3D20,  objc_msgSend( objc_msgSend( objc_msgSend(objc_msgSend(a3, "configuration"), "objectForKeyedSubscript:", @"OutputDirectory"),  "path"),  "stringByAppendingPathComponent:",  @"wl_cca_get_stats.txt"),  0))
  {
    id v7 = +[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", @"wl_cca_get_stats.txt");
    objc_msgSend( v5,  "setRelativeURLs:",  +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v7, 1));
  }

  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v5, "setCompletedAt:");
  return v5;
}

- (id)__collect_spindump:(id)a3
{
  id v5 = objc_alloc_init(&OBJC_CLASS___W5LogItemReceipt);
  [v5 setRequest:a3];
  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v5, "setStartedAt:");
  id v6 = objc_msgSend(objc_msgSend(a3, "configuration"), "objectForKeyedSubscript:", @"OutputDirectory");
  uint64_t v10 = 0LL;
  if (+[NSTask runTaskWithLaunchPath:arguments:timeout:outputData:errorData:launchHandler:didLaunch:error:]( &OBJC_CLASS___NSTask,  "runTaskWithLaunchPath:arguments:timeout:outputData:errorData:launchHandler:didLaunch:error:",  @"/usr/sbin/spindump",  0LL,  0LL,  0LL,  0LL,  0LL,  60.0,  &v10))
  {
    id v7 = objc_msgSend( -[W5LogManager __mostRecentInDirectories:matchingPrefix:matchingSuffix:excludingPrefix:excludingSuffix:maxAge:]( self,  "__mostRecentInDirectories:matchingPrefix:matchingSuffix:excludingPrefix:excludingSuffix:maxAge:",  &off_1000E3D38,  @"spindump",  0,  0,  0,  300.0),  "firstObject");
    if (v7)
    {
      id v8 = v7;
      if (sub_10008D400(+[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", v7), v6, 0LL))
      {
        uint64_t v11 = +[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", [v8 lastPathComponent]);
        objc_msgSend( v5,  "setRelativeURLs:",  +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v11, 1));
      }

      -[NSFileManager removeItemAtPath:error:]( +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"),  "removeItemAtPath:error:",  v8,  0LL);
    }
  }

  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v5, "setCompletedAt:");
  return v5;
}

- (id)__collect_darwinup:(id)a3
{
  id v4 = objc_alloc_init(&OBJC_CLASS___W5LogItemReceipt);
  [v4 setRequest:a3];
  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v4, "setStartedAt:");
  if (+[NSTask runTaskWithLaunchPath:arguments:outputFilePath:error:]( NSTask,  "runTaskWithLaunchPath:arguments:outputFilePath:error:",  @"/usr/local/bin/darwinup",  &off_1000E3D50,  objc_msgSend( objc_msgSend( objc_msgSend(objc_msgSend(a3, "configuration"), "objectForKeyedSubscript:", @"OutputDirectory"),  "path"),  "stringByAppendingPathComponent:",  @"darwinup_list.txt"),  0))
  {
    id v6 = +[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", @"darwinup_list.txt");
    objc_msgSend( v4,  "setRelativeURLs:",  +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v6, 1));
  }

  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v4, "setCompletedAt:");
  return v4;
}

- (id)__collect_hosts:(id)a3
{
  id v4 = objc_alloc_init(&OBJC_CLASS___W5LogItemReceipt);
  [v4 setRequest:a3];
  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v4, "setStartedAt:");
  if (sub_10008D400( +[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", @"/etc/hosts"),  objc_msgSend( objc_msgSend( objc_msgSend(a3, "configuration"),  "objectForKeyedSubscript:",  @"OutputDirectory"),  "URLByAppendingPathComponent:",  @"hosts"),  0))
  {
    id v6 = +[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", @"hosts");
    objc_msgSend( v4,  "setRelativeURLs:",  +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v6, 1));
  }

  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v4, "setCompletedAt:");
  return v4;
}

- (id)__collect_sysdiagnose:(id)a3
{
  id v4 = objc_alloc_init(&OBJC_CLASS___W5LogItemReceipt);
  [v4 setRequest:a3];
  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v4, "setStartedAt:");
  id v5 = objc_msgSend(objc_msgSend(a3, "configuration"), "objectForKeyedSubscript:", @"OutputDirectory");
  id v14 = 0LL;
  *(void *)id v19 = 0LL;
  *(void *)&v19[8] = v19;
  *(void *)&v19[16] = 0x3052000000LL;
  *(void *)&__int128 v20 = sub_1000558E4;
  *((void *)&v20 + 1) = sub_1000558F4;
  id v6 = (void *)qword_1000F7560;
  uint64_t v21 = qword_1000F7560;
  if (!qword_1000F7560)
  {
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_1000747D0;
    void v15[3] = &unk_1000D12E0;
    v15[4] = v19;
    sub_1000747D0((uint64_t)v15);
    id v6 = *(void **)(*(void *)&v19[8] + 40LL);
  }

  _Block_object_dispose(v19, 8);
  id v7 = [v6 sysdiagnoseWithMetadata:&off_1000E2FD8 withError:&v14];
  if (v7)
  {
    if (sub_10008D400(+[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", v7), v5, 0LL))
    {
      id v8 = +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager");
      v17[0] = NSFilePosixPermissions;
      v17[1] = NSFileOwnerAccountID;
      v18[0] = &off_1000DF6C0;
      v18[1] = &off_1000DF108;
      void v17[2] = NSFileGroupOwnerAccountID;
      void v18[2] = &off_1000DF108;
      -[NSFileManager setAttributes:ofItemAtPath:error:]( v8,  "setAttributes:ofItemAtPath:error:",  +[NSDictionary dictionaryWithObjects:forKeys:count:]( NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v18,  v17,  3),  objc_msgSend(objc_msgSend(v5, "URLByAppendingPathComponent:", objc_msgSend(v7, "lastPathComponent")), "path"),  0);
      double v16 = +[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", [v7 lastPathComponent]);
      objc_msgSend( v4,  "setRelativeURLs:",  +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v16, 1));
    }

    -[NSFileManager removeItemAtPath:error:]( +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"),  "removeItemAtPath:error:",  v7,  0LL);
  }

  else
  {
    uint64_t v10 = (os_log_s *)sub_10008C90C();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      id v11 = [v14 code];
      *(_DWORD *)id v19 = 136315906;
      *(void *)&v19[4] = "-[W5LogManager __collect_sysdiagnose:]";
      *(_WORD *)&v19[12] = 2080;
      *(void *)&v19[14] = "W5LogManager.m";
      *(_WORD *)&v19[22] = 1024;
      LODWORD(v20) = 4146;
      WORD2(v20) = 2048;
      *(void *)((char *)&v20 + 6) = v11;
      LODWORD(v12) = 38;
      _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v10,  0LL,  "[wifivelocity] %s (%s:%u) FAILED to collect sysdiagnose, returned error %ld",  v19,  v12,  v13,  v14);
    }
  }

  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v4, "setCompletedAt:");
  return v4;
}

- (id)__collect_ndp:(id)a3
{
  id v5 = objc_alloc_init(&OBJC_CLASS___W5LogItemReceipt);
  [v5 setRequest:a3];
  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v5, "setStartedAt:");
  id v6 = objc_msgSend( objc_msgSend( objc_msgSend(objc_msgSend(a3, "configuration"), "objectForKeyedSubscript:", @"OutputDirectory"),  "path"),  "stringByAppendingPathComponent:",  @"ndp.txt");
  -[NSFileManager removeItemAtPath:error:]( +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"),  "removeItemAtPath:error:",  v6,  0LL);
  -[NSFileManager createFileAtPath:contents:attributes:]( +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"),  "createFileAtPath:contents:attributes:",  v6,  0LL,  0LL);
  id v7 = +[NSFileHandle fileHandleForUpdatingAtPath:](&OBJC_CLASS___NSFileHandle, "fileHandleForUpdatingAtPath:", v6);
  if (v7)
  {
    id v8 = v7;
    -[W5LogManager __runToolWithOutputFileHandle:launchPath:arguments:]( self,  "__runToolWithOutputFileHandle:launchPath:arguments:",  v7,  @"/usr/sbin/ndp",  &off_1000E3D68);
    -[W5LogManager __runToolWithOutputFileHandle:launchPath:arguments:]( self,  "__runToolWithOutputFileHandle:launchPath:arguments:",  v8,  @"/usr/sbin/ndp",  &off_1000E3D80);
    -[W5LogManager __runToolWithOutputFileHandle:launchPath:arguments:]( self,  "__runToolWithOutputFileHandle:launchPath:arguments:",  v8,  @"/usr/sbin/ndp",  &off_1000E3D98);
    id v9 = -[W5WiFiInterface interfaceName](-[W5StatusManager wifi](self->_status, "wifi"), "interfaceName");
    if (v9)
    {
      v12[0] = @"-i";
      v12[1] = v9;
      -[W5LogManager __runToolWithOutputFileHandle:launchPath:arguments:]( self,  "__runToolWithOutputFileHandle:launchPath:arguments:",  v8,  @"/usr/sbin/ndp",  +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v12, 2LL));
    }

    -[NSFileHandle closeFile](v8, "closeFile");
    id v11 = +[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", @"ndp.txt");
    objc_msgSend( v5,  "setRelativeURLs:",  +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v11, 1));
  }

  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v5, "setCompletedAt:");
  return v5;
}

- (id)__collectTCPDump_PRE:(id)a3
{
  id v5 = objc_alloc_init(&OBJC_CLASS___W5LogItemReceipt);
  [v5 setRequest:a3];
  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v5, "setStartedAt:");
  id v6 = objc_msgSend(objc_msgSend(a3, "configuration"), "objectForKeyedSubscript:", @"OutputDirectory");
  id v7 = objc_msgSend(objc_msgSend(a3, "configuration"), "objectForKeyedSubscript:", @"UUID");
  id v8 = objc_msgSend(objc_msgSend(a3, "configuration"), "objectForKeyedSubscript:", @"Timeout");
  if (v8) {
    uint64_t v9 = (uint64_t)[v8 unsignedIntegerValue];
  }
  else {
    uint64_t v9 = 60LL;
  }
  uint64_t v10 = dispatch_semaphore_create(0LL);
  id v11 = -[W5WiFiInterface interfaceName](-[W5StatusManager wifi](self->_status, "wifi"), "interfaceName");
  if (v11)
  {
    id v12 = v11;
    id v13 = objc_msgSend( objc_msgSend(v6, "path"),  "stringByAppendingPathComponent:",  +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@_tcpdump.pcap", v11));
    v20[0] = @"-q";
    v20[1] = @"-n";
    void v20[2] = @"-i";
    void v20[3] = v12;
    v20[4] = @"-G";
    v20[5] = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%lu", v9);
    v20[6] = @"-W";
    v20[7] = @"1";
    v20[8] = @"-w";
    v20[9] = v13;
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472LL;
    void v17[2] = sub_100061C88;
    void v17[3] = &unk_1000D2C80;
    v17[4] = self;
    v17[5] = v7;
    v17[6] = v13;
    v17[7] = v5;
    _WORD v17[8] = v12;
    v17[9] = v10;
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472LL;
    v16[2] = sub_100061DE0;
    void v16[3] = &unk_1000D2CA8;
    v16[4] = self;
    v16[5] = v7;
    +[NSTask runTaskWithLaunchPath:arguments:timeout:startBlock:updateBlock:endBlock:]( &OBJC_CLASS___NSTask,  "runTaskWithLaunchPath:arguments:timeout:startBlock:updateBlock:endBlock:",  @"/usr/sbin/tcpdump",  +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v20, 10LL),  v17,  0LL,  v16,  0.0);
    dispatch_time_t v14 = dispatch_time(0LL, 600000000000LL);
    if (dispatch_semaphore_wait(v10, v14) >= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134349056;
      uint64_t v19 = 0x4082C00000000000LL;
      _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "[wifivelocity] FAILED to complete operation within %{public}.1fs, continuing",  buf,  0xCu);
    }
  }

  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v5, "setCompletedAt:");
  return v5;
}

- (id)__collectTCPDump_POST:(id)a3
{
  id v5 = objc_alloc_init(&OBJC_CLASS___W5LogItemReceipt);
  [v5 setRequest:a3];
  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v5, "setStartedAt:");
  id v6 = objc_msgSend(objc_msgSend(a3, "configuration"), "objectForKeyedSubscript:", @"OutputDirectory");
  unsigned __int8 v7 = objc_msgSend( objc_msgSend(objc_msgSend(a3, "configuration"), "objectForKeyedSubscript:", @"Compress"),  "BOOLValue");
  id v8 = objc_msgSend(objc_msgSend(a3, "configuration"), "objectForKeyedSubscript:", @"UUID");
  if (v8)
  {
    queue = (dispatch_queue_s *)self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100061F90;
    block[3] = &unk_1000D2CD0;
    block[4] = self;
    block[5] = v8;
    unsigned __int8 v12 = v7;
    block[6] = v6;
    void block[7] = v5;
    dispatch_async(queue, block);
  }

  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v5, "setCompletedAt:");
  return v5;
}

- (id)__collect_pmset:(id)a3
{
  id v4 = objc_alloc_init(&OBJC_CLASS___W5LogItemReceipt);
  [v4 setRequest:a3];
  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v4, "setStartedAt:");
  if (+[NSTask runTaskWithLaunchPath:arguments:outputFilePath:error:]( NSTask,  "runTaskWithLaunchPath:arguments:outputFilePath:error:",  @"/usr/bin/pmset",  &off_1000E3DB0,  objc_msgSend( objc_msgSend( objc_msgSend(objc_msgSend(a3, "configuration"), "objectForKeyedSubscript:", @"OutputDirectory"),  "path"),  "stringByAppendingPathComponent:",  @"pmset_everything.txt"),  0))
  {
    id v6 = +[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", @"pmset_everything.txt");
    objc_msgSend( v4,  "setRelativeURLs:",  +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v6, 1));
  }

  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v4, "setCompletedAt:");
  return v4;
}

- (unint64_t)__calculateSizeAtPath:(id)a3
{
  uint64_t v16 = 0LL;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x2020000000LL;
  uint64_t v19 = 0LL;
  char v15 = 0;
  if (-[NSFileManager fileExistsAtPath:isDirectory:]( +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"),  "fileExistsAtPath:isDirectory:",  a3,  &v15))
  {
    if (v15)
    {
      dispatch_queue_t v5 = dispatch_queue_create(0LL, 0LL);
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472LL;
      v9[2] = sub_1000622E0;
      void v9[3] = &unk_1000D2D20;
      uint64_t v10 = -[NSFileManager contentsOfDirectoryAtPath:error:]( +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"),  "contentsOfDirectoryAtPath:error:",  a3,  0LL);
      id v11 = self;
      id v12 = a3;
      dispatch_queue_t v13 = v5;
      dispatch_time_t v14 = &v16;
      dispatch_apply(-[NSArray count](v10, "count"), 0LL, v9);
      if (v5) {
        dispatch_release(v5);
      }
    }

    else
    {
      unint64_t v6 = -[NSDictionary fileSize]( -[NSFileManager attributesOfItemAtPath:error:]( +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"),  "attributesOfItemAtPath:error:",  a3,  0LL),  "fileSize");
      v17[3] += v6;
    }
  }

  unint64_t v7 = v17[3];
  _Block_object_dispose(&v16, 8);
  return v7;
}

- (id)__collectFilesInDirectories:(id)a3 include:(id)a4 exclude:(id)a5 maxAge:(double)a6 maxCount:(unint64_t)a7 maxSize:(unint64_t)a8 outputDirectory:(id)a9 compress:(BOOL)a10 remainingSize:(unint64_t *)a11 contentFilter:(id)a12
{
  uint64_t v18 = a11;
  id v44 = +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array");
  id v19 = -[W5LogManager __mostRecentInDirectories:include:exclude:maxAge:]( self,  "__mostRecentInDirectories:include:exclude:maxAge:",  a3,  a4,  a5,  a6);
  __int128 v52 = 0u;
  __int128 v53 = 0u;
  __int128 v54 = 0u;
  __int128 v55 = 0u;
  id v20 = [v19 countByEnumeratingWithState:&v52 objects:v68 count:16];
  if (!v20)
  {
    unint64_t v48 = 0LL;
    if (a11) {
      goto LABEL_35;
    }
    return [v44 copy];
  }

  id v21 = v20;
  id v22 = 0LL;
  unint64_t v48 = 0LL;
  unint64_t v49 = 0LL;
  uint64_t v50 = *(void *)v53;
  while (2)
  {
    for (i = 0LL; i != v21; i = (char *)i + 1)
    {
      if (*(void *)v53 != v50) {
        objc_enumerationMutation(v19);
      }
      id v24 = +[NSURL fileURLWithPath:]( &OBJC_CLASS___NSURL,  "fileURLWithPath:",  *(void *)(*((void *)&v52 + 1) + 8LL * (void)i));
      char v51 = 0;
      -[NSFileManager fileExistsAtPath:isDirectory:]( +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"),  "fileExistsAtPath:isDirectory:",  -[NSURL path](v24, "path"),  &v51);
      if (a12 && v51)
      {
        if (!v22) {
          id v22 = +[W5LogManager __temporaryDirectory](&OBJC_CLASS___W5LogManager, "__temporaryDirectory");
        }
        id v25 = (NSURL *)objc_msgSend( v22,  "URLByAppendingPathComponent:",  -[NSURL lastPathComponent](v24, "lastPathComponent"));
        sub_10008D400(v24, v25, 0LL);
        (*((void (**)(id, NSURL *))a12 + 2))(a12, v25);
        id v24 = v25;
      }

      id v26 = objc_msgSend(a9, "URLByAppendingPathComponent:", -[NSURL lastPathComponent](v24, "lastPathComponent"));
      id v27 = v26;
      if (a10)
      {
        id v27 = [v26 URLByAppendingPathExtension:@"tgz"];
        if (-[NSFileManager fileExistsAtPath:]( +[NSFileManager defaultManager](NSFileManager, "defaultManager"),  "fileExistsAtPath:",  [v27 path])
          || (sub_10008C94C(v24, v27, 0LL) & 1) == 0)
        {
          goto LABEL_25;
        }
      }

      else if (-[NSFileManager fileExistsAtPath:]( +[NSFileManager defaultManager](NSFileManager, "defaultManager"),  "fileExistsAtPath:",  [v26 path]) {
             || !sub_10008D400(v24, v27, 0LL))
      }
      {
LABEL_25:
        uint64_t v37 = (os_log_s *)sub_10008C90C();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
        {
          id v38 = [v27 path];
          int v56 = 138543362;
          unint64_t v57 = (unint64_t)v38;
          LODWORD(v43) = 12;
          _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v37,  0LL,  "[wifivelocity] Failed to collect file (%{public}@)",  &v56,  v43);
        }

        continue;
      }

      id v47 = v22;
      uint64_t v28 = -[NSFileManager attributesOfItemAtPath:error:]( +[NSFileManager defaultManager](NSFileManager, "defaultManager"),  "attributesOfItemAtPath:error:",  [v27 path],  0);
      unint64_t v29 = -[NSDictionary fileSize](v28, "fileSize");
      unint64_t v30 = v29 + v48;
      unint64_t v31 = ++v49;
      if (v28)
      {
        unint64_t v32 = v29;
        uint64_t v33 = (os_log_s *)sub_10008C90C();
        BOOL v34 = os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT);
        if (v30 > a8 || v31 > a7)
        {
          if (v34)
          {
            id v42 = [v27 path];
            int v56 = 134219266;
            unint64_t v57 = v30;
            __int16 v58 = 2048;
            unint64_t v59 = a8;
            __int16 v60 = 2048;
            unint64_t v61 = v32;
            __int16 v62 = 2048;
            unint64_t v63 = v31;
            __int16 v64 = 2048;
            unint64_t v65 = a7;
            __int16 v66 = 2114;
            id v67 = v42;
            LODWORD(v43) = 62;
            _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v33,  0LL,  "[wifivelocity] Max size or max count exceeded, removing file from destination (aggregateSize=%luB, maxSize =%ldB, fileSize=%luB, aggregateCount=%lu, maxCount=%ld, file=%{public}@)",  &v56,  v43);
          }

          -[NSFileManager removeItemAtPath:error:]( +[NSFileManager defaultManager](NSFileManager, "defaultManager"),  "removeItemAtPath:error:",  [v27 path],  0);
          id v22 = v47;
          if (!v47) {
            goto LABEL_34;
          }
LABEL_33:
          -[NSFileManager removeItemAtURL:error:]( +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"),  "removeItemAtURL:error:",  v22,  0LL);
          goto LABEL_34;
        }

        if (v34)
        {
          id v36 = [v27 path];
          int v56 = 134219266;
          unint64_t v57 = v30;
          __int16 v58 = 2048;
          unint64_t v59 = a8;
          __int16 v60 = 2048;
          unint64_t v61 = v32;
          __int16 v62 = 2048;
          unint64_t v63 = v49;
          __int16 v64 = 2048;
          unint64_t v65 = a7;
          __int16 v66 = 2114;
          id v67 = v36;
          LODWORD(v43) = 62;
          _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v33,  0LL,  "[wifivelocity] Successfully collected file (aggregateSize=%luB, maxSize=%ldB, fileSize=%luB, aggregateCount= %lu, maxCount=%ld, file=%{public}@)",  &v56,  v43);
        }

        objc_msgSend( v44,  "addObject:",  +[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", objc_msgSend(v27, "lastPathComponent")));
      }

      else
      {
        double v39 = (os_log_s *)sub_10008C90C();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
        {
          id v40 = [v27 path];
          int v56 = 138543362;
          unint64_t v57 = (unint64_t)v40;
          LODWORD(v43) = 12;
          _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v39,  0LL,  "[wifivelocity] Failed to get collected file attributes (file=%{public}@)",  &v56,  v43);
        }
      }

      unint64_t v48 = v30;
      id v22 = v47;
    }

    id v21 = [v19 countByEnumeratingWithState:&v52 objects:v68 count:16];
    if (v21) {
      continue;
    }
    break;
  }

  if (v22) {
    goto LABEL_33;
  }
LABEL_34:
  uint64_t v18 = a11;
  if (a11) {
LABEL_35:
  }
    unint64_t *v18 = a8 - v48;
  return [v44 copy];
}

- (id)__collectFileAtURL:(id)a3 outputDirectory:(id)a4 maxAge:(double)a5 maxSize:(unint64_t)a6 compress:(BOOL)a7 remainingSize:(unint64_t *)a8
{
  BOOL v9 = a7;
  if (!-[NSFileManager fileExistsAtPath:]( +[NSFileManager defaultManager](NSFileManager, "defaultManager"),  "fileExistsAtPath:",  [a3 path])) {
    return 0LL;
  }
  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  double v15 = v14;
  id v16 = objc_msgSend(a4, "URLByAppendingPathComponent:", objc_msgSend(a3, "lastPathComponent"));
  id v17 = v16;
  if (v9)
  {
    id v17 = [v16 URLByAppendingPathExtension:@"tgz"];
    if (-[NSFileManager fileExistsAtPath:]( +[NSFileManager defaultManager](NSFileManager, "defaultManager"),  "fileExistsAtPath:",  [v17 path])
      || (sub_10008C94C(a3, v17, 0LL) & 1) == 0)
    {
LABEL_19:
      unint64_t v29 = (os_log_s *)sub_10008C90C();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        int v33 = 138543362;
        id v34 = [v17 path];
        _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v29,  0LL,  "[wifivelocity] Failed to collect file (%{public}@)",  &v33,  12);
      }

      return 0LL;
    }
  }

  else if (-[NSFileManager fileExistsAtPath:]( +[NSFileManager defaultManager](NSFileManager, "defaultManager"),  "fileExistsAtPath:",  [v16 path]) {
         || !sub_10008D400(a3, v17, 0LL))
  }
  {
    goto LABEL_19;
  }

  uint64_t v18 = -[NSFileManager attributesOfItemAtPath:error:]( +[NSFileManager defaultManager](NSFileManager, "defaultManager"),  "attributesOfItemAtPath:error:",  [v17 path],  0);
  if (v18)
  {
    id v19 = v18;
    -[NSDate timeIntervalSinceReferenceDate]( -[NSDictionary fileCreationDate](v18, "fileCreationDate"),  "timeIntervalSinceReferenceDate");
    double v21 = v20;
    -[NSDate timeIntervalSinceReferenceDate]( -[NSDictionary fileModificationDate](v19, "fileModificationDate"),  "timeIntervalSinceReferenceDate");
    double v23 = v22;
    id v24 = -[NSDictionary fileSize](v19, "fileSize");
    if (a6 < (unint64_t)v24
      || ((double v25 = v15 - v21, v26 = v15 - v23, v15 - v21 > a5) ? (v27 = v26 <= a5) : (v27 = 1), !v27))
    {
      unint64_t v30 = (os_log_s *)sub_10008C90C();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        int v33 = 134219266;
        id v34 = (id)a6;
        __int16 v35 = 2048;
        id v36 = v24;
        __int16 v37 = 2048;
        unint64_t v38 = (unint64_t)a5;
        __int16 v39 = 2114;
        id v40 = +[NSDate dateWithTimeIntervalSinceReferenceDate:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceReferenceDate:",  v21);
        __int16 v41 = 2114;
        id v42 = +[NSDate dateWithTimeIntervalSinceReferenceDate:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceReferenceDate:",  v23);
        __int16 v43 = 2114;
        id v44 = [v17 path];
        _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v30,  0LL,  "[wifivelocity] Max size or max age exceeded, removing file from destination (maxSize=%ldB, fileSize=%luB, maxA ge=%ld, fileCreationDate=%{public}@, fileModificationDate=%{public}@, file=%{public}@)",  &v33,  62);
      }

      -[NSFileManager removeItemAtPath:error:]( +[NSFileManager defaultManager](NSFileManager, "defaultManager"),  "removeItemAtPath:error:",  [v17 path],  0);
      return 0LL;
    }

    if (a8)
    {
      uint64_t v28 = (os_log_s *)sub_10008C90C();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        int v33 = 134219266;
        id v34 = (id)a6;
        __int16 v35 = 2048;
        id v36 = v24;
        __int16 v37 = 2048;
        unint64_t v38 = (unint64_t)a5;
        __int16 v39 = 2114;
        id v40 = +[NSDate dateWithTimeIntervalSinceReferenceDate:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceReferenceDate:",  v21);
        __int16 v41 = 2114;
        id v42 = +[NSDate dateWithTimeIntervalSinceReferenceDate:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceReferenceDate:",  v23);
        __int16 v43 = 2114;
        id v44 = [v17 path];
        _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v28,  0LL,  "[wifivelocity] Successfully collected file (maxSize=%ldB, fileSize=%luB, maxAge=%ld, fileCreationDate=%{public }@, fileModificationDate=%{public}@, file=%{public}@)",  &v33,  62);
      }

      *a8 = a6 - (void)v24;
    }
  }

  else
  {
    unint64_t v31 = (os_log_s *)sub_10008C90C();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      int v33 = 138543362;
      id v34 = [v17 path];
      _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v31,  0LL,  "[wifivelocity] Failed to get collected file attributes (file=%{public}@)",  &v33,  12);
    }
  }

  if (v17) {
    return +[NSURL fileURLWithPath:]( NSURL,  "fileURLWithPath:",  objc_msgSend(v17, "lastPathComponent", v25, v26));
  }
  return 0LL;
}

- (id)__mostRecentInDirectories:(id)a3 include:(id)a4 exclude:(id)a5 maxAge:(double)a6
{
  id v31 = +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array");
  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  double v11 = v10;
  id v37 = +[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary");
  id v38 = +[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set");
  __int128 v43 = 0u;
  __int128 v44 = 0u;
  __int128 v45 = 0u;
  __int128 v46 = 0u;
  id obj = a3;
  id v34 = [a3 countByEnumeratingWithState:&v43 objects:v48 count:16];
  if (v34)
  {
    uint64_t v33 = *(void *)v44;
    do
    {
      uint64_t v12 = 0LL;
      do
      {
        if (*(void *)v44 != v33) {
          objc_enumerationMutation(obj);
        }
        uint64_t v36 = v12;
        dispatch_queue_t v13 = *(void **)(*((void *)&v43 + 1) + 8 * v12);
        context = objc_autoreleasePoolPush();
        double v14 = -[NSFileManager contentsOfDirectoryAtPath:error:]( +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"),  "contentsOfDirectoryAtPath:error:",  v13,  0LL);
        __int128 v39 = 0u;
        __int128 v40 = 0u;
        __int128 v41 = 0u;
        __int128 v42 = 0u;
        id v15 = -[NSArray countByEnumeratingWithState:objects:count:]( v14,  "countByEnumeratingWithState:objects:count:",  &v39,  v47,  16LL);
        if (v15)
        {
          id v16 = v15;
          uint64_t v17 = *(void *)v40;
          do
          {
            for (i = 0LL; i != v16; i = (char *)i + 1)
            {
              if (*(void *)v40 != v17) {
                objc_enumerationMutation(v14);
              }
              id v19 = *(void **)(*((void *)&v39 + 1) + 8LL * (void)i);
              double v20 = objc_autoreleasePoolPush();
              double v21 = -[NSFileManager attributesOfItemAtPath:error:]( +[NSFileManager defaultManager](NSFileManager, "defaultManager"),  "attributesOfItemAtPath:error:",  [v13 stringByAppendingPathComponent:v19],  0);
              -[NSDate timeIntervalSinceReferenceDate]( -[NSDictionary fileCreationDate](v21, "fileCreationDate"),  "timeIntervalSinceReferenceDate");
              double v23 = v22;
              -[NSDate timeIntervalSinceReferenceDate]( -[NSDictionary fileModificationDate](v21, "fileModificationDate"),  "timeIntervalSinceReferenceDate");
              double v25 = v24;
              double v26 = v11 - v23;
              double v27 = v11 - v25;
              BOOL v28 = v11 - v23 > a6 && v27 > a6;
              if (!v28
                && (!a4
                 || objc_msgSend( a4,  "numberOfMatchesInString:options:range:",  v19,  0,  0,  objc_msgSend(v19, "length", v26, v27)))
                && (!a5
                 || !objc_msgSend( a5,  "numberOfMatchesInString:options:range:",  v19,  0,  0,  objc_msgSend(v19, "length", v26, v27)))
                && (objc_msgSend(v38, "containsObject:", v19, v26, v27) & 1) == 0)
              {
                if (v23 <= v25) {
                  double v29 = v25;
                }
                else {
                  double v29 = v23;
                }
                objc_msgSend( v37,  "setObject:forKeyedSubscript:",  +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v29),  objc_msgSend(v13, "stringByAppendingPathComponent:", v19));
                [v38 addObject:v19];
              }

              objc_autoreleasePoolPop(v20);
            }

            id v16 = -[NSArray countByEnumeratingWithState:objects:count:]( v14,  "countByEnumeratingWithState:objects:count:",  &v39,  v47,  16LL);
          }

          while (v16);
        }

        objc_autoreleasePoolPop(context);
        uint64_t v12 = v36 + 1;
      }

      while ((id)(v36 + 1) != v34);
      id v34 = [obj countByEnumeratingWithState:&v43 objects:v48 count:16];
    }

    while (v34);
  }

  objc_msgSend(v31, "addObjectsFromArray:", objc_msgSend(v37, "keysSortedByValueUsingComparator:", &stru_1000D2D40));
  return [v31 copy];
}

- (id)__mostRecentInDirectories:(id)a3 matchingPrefix:(id)a4 matchingSuffix:(id)a5 excludingPrefix:(id)a6 excludingSuffix:(id)a7 maxAge:(double)a8
{
  id v32 = +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array");
  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  double v12 = v11;
  id v38 = +[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary");
  id v39 = +[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set");
  __int128 v47 = 0u;
  __int128 v48 = 0u;
  __int128 v49 = 0u;
  __int128 v50 = 0u;
  id obj = a3;
  id v35 = [a3 countByEnumeratingWithState:&v47 objects:v52 count:16];
  if (v35)
  {
    uint64_t v34 = *(void *)v48;
    do
    {
      uint64_t v13 = 0LL;
      do
      {
        if (*(void *)v48 != v34) {
          objc_enumerationMutation(obj);
        }
        uint64_t v37 = v13;
        double v14 = *(void **)(*((void *)&v47 + 1) + 8 * v13);
        context = objc_autoreleasePoolPush();
        id v15 = -[NSFileManager contentsOfDirectoryAtPath:error:]( +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"),  "contentsOfDirectoryAtPath:error:",  v14,  0LL);
        __int128 v43 = 0u;
        __int128 v44 = 0u;
        __int128 v45 = 0u;
        __int128 v46 = 0u;
        id v16 = -[NSArray countByEnumeratingWithState:objects:count:]( v15,  "countByEnumeratingWithState:objects:count:",  &v43,  v51,  16LL);
        if (v16)
        {
          id v17 = v16;
          uint64_t v18 = *(void *)v44;
          do
          {
            for (i = 0LL; i != v17; i = (char *)i + 1)
            {
              if (*(void *)v44 != v18) {
                objc_enumerationMutation(v15);
              }
              double v20 = *(void **)(*((void *)&v43 + 1) + 8LL * (void)i);
              double v21 = objc_autoreleasePoolPush();
              double v22 = -[NSFileManager attributesOfItemAtPath:error:]( +[NSFileManager defaultManager](NSFileManager, "defaultManager"),  "attributesOfItemAtPath:error:",  [v14 stringByAppendingPathComponent:v20],  0);
              -[NSDate timeIntervalSinceReferenceDate]( -[NSDictionary fileCreationDate](v22, "fileCreationDate"),  "timeIntervalSinceReferenceDate");
              double v24 = v23;
              -[NSDate timeIntervalSinceReferenceDate]( -[NSDictionary fileModificationDate](v22, "fileModificationDate"),  "timeIntervalSinceReferenceDate");
              double v26 = v25;
              double v27 = v12 - v24;
              double v28 = v12 - v26;
              BOOL v29 = v12 - v24 > a8 && v28 > a8;
              if (!v29
                && (!a4 || objc_msgSend(v20, "hasPrefix:", a4, v27, v28))
                && (!a5 || objc_msgSend(v20, "hasSuffix:", a5, v27, v28))
                && (!a6 || (objc_msgSend(v20, "hasPrefix:", a6, v27, v28) & 1) == 0)
                && (!a7 || (objc_msgSend(v20, "hasSuffix:", a7, v27, v28) & 1) == 0)
                && (objc_msgSend(v39, "containsObject:", v20, v27, v28) & 1) == 0)
              {
                if (v24 <= v26) {
                  double v30 = v26;
                }
                else {
                  double v30 = v24;
                }
                objc_msgSend( v38,  "setObject:forKeyedSubscript:",  +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v30),  objc_msgSend(v14, "stringByAppendingPathComponent:", v20));
                [v39 addObject:v20];
              }

              objc_autoreleasePoolPop(v21);
            }

            id v17 = -[NSArray countByEnumeratingWithState:objects:count:]( v15,  "countByEnumeratingWithState:objects:count:",  &v43,  v51,  16LL);
          }

          while (v17);
        }

        objc_autoreleasePoolPop(context);
        uint64_t v13 = v37 + 1;
      }

      while ((id)(v37 + 1) != v35);
      id v35 = [obj countByEnumeratingWithState:&v47 objects:v52 count:16];
    }

    while (v35);
  }

  objc_msgSend(v32, "addObjectsFromArray:", objc_msgSend(v38, "keysSortedByValueUsingComparator:", &stru_1000D2D60));
  return [v32 copy];
}

- (id)__possibleCoreCapturePathsWithComponent:(id)a3
{
  id v4 = +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array");
  if (!a3) {
    a3 = @"WiFi";
  }
  [v4 addObject:+[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"/Library/Logs/CrashReporter/CoreCapture/%@", a3)];
  [v4 addObject:+[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"/Library/Logs/CoreCapture/%@", a3)];
  [v4 addObject:+[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"/var/mobile/Library/Logs/CrashReporter/CoreCapture/%@", a3)];
  id result = [v4 count];
  if (result) {
    return [v4 copy];
  }
  return result;
}

- (void)__filterCoreCaptureContent:(id)a3
{
  id v4 = +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array");
  dispatch_queue_t v5 = +[NSRegularExpression regularExpressionWithPattern:options:error:]( &OBJC_CLASS___NSRegularExpression,  "regularExpressionWithPattern:options:error:",  @"\\.bin$|\\.pcapng\\.gz$",  0LL,  0LL);
  NSURLResourceKey v27 = NSURLNameKey;
  unint64_t v6 = -[NSFileManager enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:]( +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"),  "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:",  a3,  +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v27, 1LL),  0LL,  0LL);
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  id v7 = -[NSDirectoryEnumerator countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v21,  v26,  16LL);
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v22;
    do
    {
      double v10 = 0LL;
      do
      {
        if (*(void *)v22 != v9) {
          objc_enumerationMutation(v6);
        }
        double v11 = *(void **)(*((void *)&v21 + 1) + 8LL * (void)v10);
        id v20 = 0LL;
        [v11 getResourceValue:&v20 forKey:NSURLNameKey error:0];
        if (-[NSRegularExpression firstMatchInString:options:range:]( v5,  "firstMatchInString:options:range:",  v20,  0,  0,  [v20 length]))
        {
          [v4 addObject:v11];
        }

        double v10 = (char *)v10 + 1;
      }

      while (v8 != v10);
      id v8 = -[NSDirectoryEnumerator countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v21,  v26,  16LL);
    }

    while (v8);
  }

  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  id v12 = [v4 countByEnumeratingWithState:&v16 objects:v25 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v17;
    do
    {
      id v15 = 0LL;
      do
      {
        if (*(void *)v17 != v14) {
          objc_enumerationMutation(v4);
        }
        -[NSFileManager removeItemAtURL:error:]( +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"),  "removeItemAtURL:error:",  *(void *)(*((void *)&v16 + 1) + 8LL * (void)v15),  0LL);
        id v15 = (char *)v15 + 1;
      }

      while (v13 != v15);
      id v13 = [v4 countByEnumeratingWithState:&v16 objects:v25 count:16];
    }

    while (v13);
  }

- (id)__collectCoreCaptureDump:(id)a3
{
  id v5 = objc_alloc_init(&OBJC_CLASS___W5LogItemReceipt);
  [v5 setRequest:a3];
  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v5, "setStartedAt:");
  unint64_t v6 = (const __CFString *)objc_msgSend(objc_msgSend(a3, "configuration"), "objectForKeyedSubscript:", @"Reason");
  if (v6) {
    id v7 = v6;
  }
  else {
    id v7 = @"WiFiDebug";
  }
  id v8 = (const __CFString *)objc_msgSend( objc_msgSend(a3, "configuration"),  "objectForKeyedSubscript:",  @"Component");
  if (v8) {
    uint64_t v9 = v8;
  }
  else {
    uint64_t v9 = @"WiFi";
  }
  -[W5LogManager __dumpCoreCaptureLogsWithReason:component:](self, "__dumpCoreCaptureLogsWithReason:component:", v7, v9);
  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v5, "setCompletedAt:");
  return v5;
}

- (id)__collectCoreCapture:(id)a3
{
  id v4 = objc_alloc_init(&OBJC_CLASS___W5LogItemReceipt);
  [v4 setRequest:a3];
  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v4, "setStartedAt:");
  id v5 = objc_msgSend(objc_msgSend(a3, "configuration"), "objectForKeyedSubscript:", @"OutputDirectory");
  id v6 = objc_msgSend(objc_msgSend(a3, "configuration"), "objectForKeyedSubscript:", @"MaxAge");
  if (v6)
  {
    [v6 doubleValue];
    double v8 = v7;
  }

  else
  {
    double v8 = 1.79769313e308;
  }

  id v9 = objc_msgSend(objc_msgSend(a3, "configuration"), "objectForKeyedSubscript:", @"MaxCount");
  if (v9) {
    uint64_t v28 = (uint64_t)[v9 unsignedIntegerValue];
  }
  else {
    uint64_t v28 = -1LL;
  }
  id v10 = objc_msgSend(objc_msgSend(a3, "configuration"), "objectForKeyedSubscript:", @"MaxSize");
  if (v10) {
    uint64_t v27 = (uint64_t)[v10 unsignedIntegerValue];
  }
  else {
    uint64_t v27 = -1LL;
  }
  unsigned __int8 v26 = objc_msgSend( objc_msgSend( objc_msgSend(a3, "configuration"),  "objectForKeyedSubscript:",  @"Compress"),  "BOOLValue");
  unsigned int v11 = objc_msgSend( objc_msgSend( objc_msgSend(a3, "configuration"),  "objectForKeyedSubscript:",  @"FilterContent"),  "BOOLValue");
  id v12 = (const __CFString *)objc_msgSend( objc_msgSend(a3, "configuration"),  "objectForKeyedSubscript:",  @"Component");
  if (v12) {
    id v13 = v12;
  }
  else {
    id v13 = @"WiFi";
  }
  id v14 = objc_msgSend(objc_msgSend(a3, "configuration"), "objectForKeyedSubscript:", @"IncludeMatching");
  id v15 = objc_msgSend(objc_msgSend(a3, "configuration"), "objectForKeyedSubscript:", @"ExcludeMatching");
  id v16 = +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array");
  __int128 v17 = &stru_1000D4648;
  if (v11) {
    __int128 v17 = @"-Filtered";
  }
  __int128 v18 = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"CoreCapture%@", v17);
  __int128 v19 = v5;
  -[NSFileManager createDirectoryAtPath:withIntermediateDirectories:attributes:error:]( +[NSFileManager defaultManager](NSFileManager, "defaultManager"),  "createDirectoryAtPath:withIntermediateDirectories:attributes:error:",  objc_msgSend( objc_msgSend(objc_msgSend(v5, "path"), "stringByAppendingPathComponent:", v18),  "stringByAppendingPathComponent:",  v13),  1,  0,  0);
  id v20 = 0LL;
  if (v11)
  {
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472LL;
    void v30[2] = sub_100063C08;
    v30[3] = &unk_1000D2D88;
    void v30[4] = self;
    id v20 = v30;
  }

  if (v14)
  {
    __int128 v21 = +[NSRegularExpression regularExpressionWithPattern:options:error:]( &OBJC_CLASS___NSRegularExpression,  "regularExpressionWithPattern:options:error:",  v14,  0LL,  0LL);
    if (v15)
    {
LABEL_19:
      __int128 v22 = +[NSRegularExpression regularExpressionWithPattern:options:error:]( &OBJC_CLASS___NSRegularExpression,  "regularExpressionWithPattern:options:error:",  v15,  0LL,  0LL);
      goto LABEL_22;
    }
  }

  else
  {
    __int128 v21 = 0LL;
    if (v15) {
      goto LABEL_19;
    }
  }

  __int128 v22 = 0LL;
LABEL_22:
  LOBYTE(v25) = v26;
  -[W5LogManager __collectFilesInDirectories:include:exclude:maxAge:maxCount:maxSize:outputDirectory:compress:remainingSize:contentFilter:]( self,  "__collectFilesInDirectories:include:exclude:maxAge:maxCount:maxSize:outputDirectory:compress:remainingSize:contentFilter:",  -[W5LogManager __possibleCoreCapturePathsWithComponent:](self, "__possibleCoreCapturePathsWithComponent:", v13),  v21,  v22,  v28,  v27,  objc_msgSend(objc_msgSend(v19, "URLByAppendingPathComponent:", v18), "URLByAppendingPathComponent:", v13),  v8,  v25,  0,  v20);
  objc_msgSend(v16, "addObject:", +[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v18));
  id v23 = -[W5LogManager __collectFileAtURL:outputDirectory:maxAge:maxSize:compress:remainingSize:]( self,  "__collectFileAtURL:outputDirectory:maxAge:maxSize:compress:remainingSize:",  +[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", @"/var/log/corecaptured.log"),  v19,  0x7FFFFFFFFFFFFFFFLL,  1LL,  0LL,  1.79769313e308);
  if (v23) {
    [v16 addObject:v23];
  }
  [v4 setRelativeURLs:v16];
  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v4, "setCompletedAt:");
  return v4;
}

- (id)__collectCoreCapture24:(id)a3
{
  id v4 = objc_alloc_init(&OBJC_CLASS___W5LogItemReceipt);
  [v4 setRequest:a3];
  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v4, "setStartedAt:");
  id v5 = objc_msgSend(objc_msgSend(a3, "configuration"), "objectForKeyedSubscript:", @"OutputDirectory");
  unsigned __int8 v19 = objc_msgSend( objc_msgSend( objc_msgSend(a3, "configuration"),  "objectForKeyedSubscript:",  @"Compress"),  "BOOLValue");
  unsigned int v6 = objc_msgSend( objc_msgSend( objc_msgSend(a3, "configuration"),  "objectForKeyedSubscript:",  @"FilterContent"),  "BOOLValue");
  double v7 = (const __CFString *)objc_msgSend( objc_msgSend(a3, "configuration"),  "objectForKeyedSubscript:",  @"Component");
  if (v7) {
    double v8 = v7;
  }
  else {
    double v8 = @"WiFi";
  }
  id v9 = objc_msgSend(objc_msgSend(a3, "configuration"), "objectForKeyedSubscript:", @"IncludeMatching");
  id v10 = (NSRegularExpression *)objc_msgSend( objc_msgSend(a3, "configuration"),  "objectForKeyedSubscript:",  @"ExcludeMatching");
  id v11 = +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array");
  id v12 = &stru_1000D4648;
  if (v6) {
    id v12 = @"-Filtered";
  }
  id v13 = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"CoreCapture%@", v12);
  -[NSFileManager createDirectoryAtPath:withIntermediateDirectories:attributes:error:]( +[NSFileManager defaultManager](NSFileManager, "defaultManager"),  "createDirectoryAtPath:withIntermediateDirectories:attributes:error:",  objc_msgSend( objc_msgSend(objc_msgSend(v5, "path"), "stringByAppendingPathComponent:", v13),  "stringByAppendingPathComponent:",  v8),  1,  0,  0);
  id v14 = 0LL;
  if (v6)
  {
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472LL;
    v21[2] = sub_100063F1C;
    void v21[3] = &unk_1000D2D88;
    v21[4] = self;
    id v14 = v21;
  }

  if (v9)
  {
    id v15 = +[NSRegularExpression regularExpressionWithPattern:options:error:]( &OBJC_CLASS___NSRegularExpression,  "regularExpressionWithPattern:options:error:",  v9,  0LL,  0LL);
    if (!v10) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }

  id v15 = 0LL;
  if (v10) {
LABEL_10:
  }
    id v10 = +[NSRegularExpression regularExpressionWithPattern:options:error:]( &OBJC_CLASS___NSRegularExpression,  "regularExpressionWithPattern:options:error:",  v10,  0LL,  0LL);
LABEL_11:
  LOBYTE(v18) = v19;
  -[W5LogManager __collectFilesInDirectories:include:exclude:maxAge:maxCount:maxSize:outputDirectory:compress:remainingSize:contentFilter:]( self,  "__collectFilesInDirectories:include:exclude:maxAge:maxCount:maxSize:outputDirectory:compress:remainingSize:contentFilter:",  -[W5LogManager __possibleCoreCapturePathsWithComponent:](self, "__possibleCoreCapturePathsWithComponent:", v8),  v15,  v10,  0x7FFFFFFFFFFFFFFFLL,  0x7FFFFFFFFFFFFFFFLL,  objc_msgSend(objc_msgSend(v5, "URLByAppendingPathComponent:", v13), "URLByAppendingPathComponent:", v8),  86400.0,  v18,  0,  v14);
  objc_msgSend(v11, "addObject:", +[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v13));
  id v16 = -[W5LogManager __collectFileAtURL:outputDirectory:maxAge:maxSize:compress:remainingSize:]( self,  "__collectFileAtURL:outputDirectory:maxAge:maxSize:compress:remainingSize:",  +[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", @"/var/log/corecaptured.log"),  v5,  0x7FFFFFFFFFFFFFFFLL,  1LL,  0LL,  1.79769313e308);
  if (v16) {
    [v11 addObject:v16];
  }
  [v4 setRelativeURLs:v11];
  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v4, "setCompletedAt:");
  return v4;
}

- (id)__collectWiFiPreferences:(id)a3
{
  id v5 = objc_alloc_init(&OBJC_CLASS___W5LogItemReceipt);
  [v5 setRequest:a3];
  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v5, "setStartedAt:");
  id v6 = objc_msgSend(objc_msgSend(a3, "configuration"), "objectForKeyedSubscript:", @"OutputDirectory");
  unsigned int v7 = objc_msgSend( objc_msgSend( objc_msgSend(a3, "configuration"),  "objectForKeyedSubscript:",  @"UseMegaWiFiProfileLimits"),  "BOOLValue");
  id v8 = +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array");
  if (-[NSFileManager fileExistsAtPath:]( +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"),  "fileExistsAtPath:",  @"/Library/Preferences/SystemConfiguration/com.apple.wifi.plist")
    && sub_10008D400( +[NSURL fileURLWithPath:]( NSURL,  "fileURLWithPath:",  @"/Library/Preferences/SystemConfiguration/com.apple.wifi.plist"),  [v6 URLByAppendingPathComponent:@"com.apple.wifi.plist"],  0))
  {
    objc_msgSend( v8,  "addObject:",  +[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", @"com.apple.wifi.plist"));
  }

  if (-[NSFileManager fileExistsAtPath:]( +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"),  "fileExistsAtPath:",  @"/Library/Preferences/SystemConfiguration/com.apple.wifi-networks.plist")
    && sub_10008D400( +[NSURL fileURLWithPath:]( NSURL,  "fileURLWithPath:",  @"/Library/Preferences/SystemConfiguration/com.apple.wifi-networks.plist"),  [v6 URLByAppendingPathComponent:@"LEGACY_com.apple.wifi-networks.plist"],  0))
  {
    objc_msgSend( v8,  "addObject:",  +[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", @"LEGACY_com.apple.wifi-networks.plist"));
  }

  if (-[NSFileManager fileExistsAtPath:]( +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"),  "fileExistsAtPath:",  @"/Library/Preferences/SystemConfiguration/com.apple.wifi-private-mac-networks.plist")
    && sub_10008D400( +[NSURL fileURLWithPath:]( NSURL,  "fileURLWithPath:",  @"/Library/Preferences/SystemConfiguration/com.apple.wifi-private-mac-networks.plist"),  [v6 URLByAppendingPathComponent:@"com.apple.wifi-private-mac-networks.plist"],  0))
  {
    objc_msgSend( v8,  "addObject:",  +[NSURL fileURLWithPath:]( NSURL,  "fileURLWithPath:",  @"com.apple.wifi-private-mac-networks.plist"));
  }

  if ((os_variant_has_internal_content("com.apple.wifivelocity", v9) | v7) == 1)
  {
    id v10 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@.plist",  CWFKnownNetworksStoreIdentifier);
    id v11 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"/Library/Preferences/%@",  v10);
    if (-[NSFileManager fileExistsAtPath:]( +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"),  "fileExistsAtPath:",  v11)
      && sub_10008D400( +[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v11),  [v6 URLByAppendingPathComponent:v10],  0))
    {
      objc_msgSend(v8, "addObject:", +[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v10));
    }

    id v12 = -[NSFileManager containerURLForSecurityApplicationGroupIdentifier:]( +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"),  "containerURLForSecurityApplicationGroupIdentifier:",  @"group.com.apple.wifi.logs");
    id v13 = -[NSString stringByAppendingPathComponent:]( -[NSURL path](v12, "path"),  "stringByAppendingPathComponent:",  @"com.apple.wifi.syncable-networks.plist");
    if (-[NSFileManager fileExistsAtPath:]( +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"),  "fileExistsAtPath:",  v13)
      && sub_10008D400( +[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v13),  [v6 URLByAppendingPathComponent:@"com.apple.wifi.syncable-networks.plist"],  0))
    {
      objc_msgSend( v8,  "addObject:",  +[NSURL fileURLWithPath:]( NSURL,  "fileURLWithPath:",  @"com.apple.wifi.syncable-networks.plist"));
    }

    id v14 = -[NSString stringByAppendingPathComponent:]( -[NSURL path](v12, "path"),  "stringByAppendingPathComponent:",  @"com.apple.wifi.syncable-networks.legacy.plist");
    if (-[NSFileManager fileExistsAtPath:]( +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"),  "fileExistsAtPath:",  v14)
      && sub_10008D400( +[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v14),  [v6 URLByAppendingPathComponent:@"com.apple.wifi.syncable-networks.legacy.plist"],  0))
    {
      objc_msgSend( v8,  "addObject:",  +[NSURL fileURLWithPath:]( NSURL,  "fileURLWithPath:",  @"com.apple.wifi.syncable-networks.legacy.plist"));
    }

    id v15 = -[NSString stringByAppendingPathComponent:]( -[NSURL path](v12, "path"),  "stringByAppendingPathComponent:",  @"com.apple.wifi.recent-networks.json");
    if (-[NSFileManager fileExistsAtPath:]( +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"),  "fileExistsAtPath:",  v15)
      && sub_10008D400( +[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v15),  [v6 URLByAppendingPathComponent:@"com.apple.wifi.recent-networks.json"],  0))
    {
      objc_msgSend( v8,  "addObject:",  +[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", @"com.apple.wifi.recent-networks.json"));
    }
  }

  else
  {
    debugLogQueue = (dispatch_queue_s *)self->_debugLogQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000643E4;
    block[3] = &unk_1000D1BA8;
    block[4] = a3;
    block[5] = self;
    dispatch_async(debugLogQueue, block);
  }

  [v5 setRelativeURLs:v8];
  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v5, "setCompletedAt:");
  return v5;
}

- (id)__collectNetworkPreferences:(id)a3
{
  id v4 = objc_alloc_init(&OBJC_CLASS___W5LogItemReceipt);
  [v4 setRequest:a3];
  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v4, "setStartedAt:");
  id v5 = objc_msgSend(objc_msgSend(a3, "configuration"), "objectForKeyedSubscript:", @"OutputDirectory");
  id v6 = +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array");
  if (-[NSFileManager fileExistsAtPath:]( +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"),  "fileExistsAtPath:",  @"/Library/Preferences/SystemConfiguration/preferences.plist")
    && sub_10008D400( +[NSURL fileURLWithPath:]( NSURL,  "fileURLWithPath:",  @"/Library/Preferences/SystemConfiguration/preferences.plist"),  [v5 URLByAppendingPathComponent:@"preferences.plist"],  0))
  {
    objc_msgSend( v6,  "addObject:",  +[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", @"preferences.plist"));
  }

  [v4 setRelativeURLs:v6];
  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v4, "setCompletedAt:");
  return v4;
}

- (id)__possibleTempWiFiLogPaths
{
  return &off_1000E3DC8;
}

- (void)__dumpWiFiLogs
{
}

- (id)__collectFilteredWiFiManagerLogArchiveWithOutputURL:(id)a3 compress:(BOOL)a4 age:(unint64_t)a5
{
  BOOL v6 = a4;
  id v9 = objc_msgSend(objc_msgSend(a3, "path"), "stringByAppendingPathComponent:", @"wifi_logarchive.log");
  void v12[3] = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"--last=%lus",  a5,  @"show",  @"--debug",  @"--signpost");
  void v12[4] = @"--style=compact";
  v12[5] = @"--predicate=(subsystem CONTAINS com.apple.WiFiManager) OR (subsystem CONTAINS wifi.analytics) OR (senderImagePath CONTAINS IO80211Family) OR (senderImagePath CONTAINS AppleBCMWLANCore) OR (process CONTAINS wifid)";
  id v10 = 0LL;
  if (+[NSTask runTaskWithLaunchPath:arguments:outputFilePath:error:]( &OBJC_CLASS___NSTask,  "runTaskWithLaunchPath:arguments:outputFilePath:error:",  @"/usr/bin/log",  +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v12, 6LL),  v9,  0LL))
  {
    if (v6)
    {
      id v10 = -[W5LogManager __collectFileAtURL:outputDirectory:maxAge:maxSize:compress:remainingSize:]( self,  "__collectFileAtURL:outputDirectory:maxAge:maxSize:compress:remainingSize:",  +[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", v9),  a3,  0x7FFFFFFFFFFFFFFFLL,  1LL,  0LL,  1.79769313e308);
      -[NSFileManager removeItemAtPath:error:]( +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"),  "removeItemAtPath:error:",  v9,  0LL);
    }

    else
    {
      return +[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", @"wifi_logarchive.log");
    }
  }

  return v10;
}

- (id)__collectWiFiLogs24:(id)a3
{
  id v5 = objc_alloc_init(&OBJC_CLASS___W5LogItemReceipt);
  [v5 setRequest:a3];
  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v5, "setStartedAt:");
  id v6 = objc_msgSend(objc_msgSend(a3, "configuration"), "objectForKeyedSubscript:", @"OutputDirectory");
  id v7 = objc_msgSend( objc_msgSend(objc_msgSend(a3, "configuration"), "objectForKeyedSubscript:", @"Compress"),  "BOOLValue");
  id v8 = +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array");
  id v9 = -[W5LogManager __collectFileAtURL:outputDirectory:maxAge:maxSize:compress:remainingSize:]( self,  "__collectFileAtURL:outputDirectory:maxAge:maxSize:compress:remainingSize:",  +[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", @"/Library/Logs/wifi.log"),  v6,  0x7FFFFFFFFFFFFFFFLL,  v7,  0LL,  86400.0);
  if (v9) {
    [v8 addObject:v9];
  }
  id v10 = -[W5LogManager __collectFileAtURL:outputDirectory:maxAge:maxSize:compress:remainingSize:]( self,  "__collectFileAtURL:outputDirectory:maxAge:maxSize:compress:remainingSize:",  +[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", @"/Library/Logs/wifimanager.log"),  v6,  0x7FFFFFFFFFFFFFFFLL,  v7,  0LL,  86400.0);
  if (v10) {
    [v8 addObject:v10];
  }
  id v11 = -[W5LogManager __collectFileAtURL:outputDirectory:maxAge:maxSize:compress:remainingSize:]( self,  "__collectFileAtURL:outputDirectory:maxAge:maxSize:compress:remainingSize:",  +[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", @"/Library/Logs/wifi_driver.log"),  v6,  0x7FFFFFFFFFFFFFFFLL,  v7,  0LL,  86400.0);
  if (v11) {
    [v8 addObject:v11];
  }
  id v12 = -[W5LogManager __collectFileAtURL:outputDirectory:maxAge:maxSize:compress:remainingSize:]( self,  "__collectFileAtURL:outputDirectory:maxAge:maxSize:compress:remainingSize:",  +[NSURL fileURLWithPath:]( &OBJC_CLASS___NSURL,  "fileURLWithPath:",  @"/private/var/logs/wifiFirmwareLoader.log"),  v6,  0x7FFFFFFFFFFFFFFFLL,  v7,  0LL,  86400.0);
  if (v12) {
    [v8 addObject:v12];
  }
  LOBYTE(v16) = (_BYTE)v7;
  id v13 = -[W5LogManager __collectFilesInDirectories:include:exclude:maxAge:maxCount:maxSize:outputDirectory:compress:remainingSize:contentFilter:]( self,  "__collectFilesInDirectories:include:exclude:maxAge:maxCount:maxSize:outputDirectory:compress:remainingSize:contentFilter:",  -[W5LogManager __possibleTempWiFiLogPaths](self, "__possibleTempWiFiLogPaths"),  0LL,  +[NSRegularExpression regularExpressionWithPattern:options:error:]( &OBJC_CLASS___NSRegularExpression,  "regularExpressionWithPattern:options:error:",  @"WiFiManager$|WiFiDebugInfo\\.tar\\.gz$",  0LL,  0LL),  0x7FFFFFFFFFFFFFFFLL,  0x7FFFFFFFFFFFFFFFLL,  v6,  86400.0,  v16,  0LL,  0LL);
  if (v13) {
    [v8 addObjectsFromArray:v13];
  }
  id v14 = -[W5LogManager __collectFilteredWiFiManagerLogArchiveWithOutputURL:compress:age:]( self,  "__collectFilteredWiFiManagerLogArchiveWithOutputURL:compress:age:",  v6,  v7,  600LL);
  if (v14) {
    [v8 addObject:v14];
  }
  [v5 setRelativeURLs:v8];
  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v5, "setCompletedAt:");
  return v5;
}

- (id)__collectWiFiLogs:(id)a3
{
  id v5 = objc_alloc_init(&OBJC_CLASS___W5LogItemReceipt);
  [v5 setRequest:a3];
  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v5, "setStartedAt:");
  id v6 = objc_msgSend(objc_msgSend(a3, "configuration"), "objectForKeyedSubscript:", @"OutputDirectory");
  id v7 = objc_msgSend(objc_msgSend(a3, "configuration"), "objectForKeyedSubscript:", @"MaxAge");
  if (v7)
  {
    [v7 doubleValue];
    double v9 = v8;
  }

  else
  {
    double v9 = 1.79769313e308;
  }

  id v10 = objc_msgSend(objc_msgSend(a3, "configuration"), "objectForKeyedSubscript:", @"MaxCount");
  if (v10) {
    uint64_t v11 = (uint64_t)[v10 unsignedIntegerValue];
  }
  else {
    uint64_t v11 = -1LL;
  }
  id v12 = objc_msgSend( objc_msgSend(objc_msgSend(a3, "configuration"), "objectForKeyedSubscript:", @"Compress"),  "BOOLValue");
  unsigned __int8 v13 = objc_msgSend( objc_msgSend( objc_msgSend(a3, "configuration"),  "objectForKeyedSubscript:",  @"CollectTempWiFiLog"),  "BOOLValue");
  id v14 = +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array");
  if ((v13 & 1) != 0)
  {
    uint64_t v11 = 1LL;
  }

  else
  {
    id v15 = -[W5LogManager __collectFileAtURL:outputDirectory:maxAge:maxSize:compress:remainingSize:]( self,  "__collectFileAtURL:outputDirectory:maxAge:maxSize:compress:remainingSize:",  +[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", @"/Library/Logs/wifi.log"),  v6,  0x7FFFFFFFFFFFFFFFLL,  v12,  0LL,  1.79769313e308);
    if (v15) {
      [v14 addObject:v15];
    }
    id v16 = -[W5LogManager __collectFileAtURL:outputDirectory:maxAge:maxSize:compress:remainingSize:]( self,  "__collectFileAtURL:outputDirectory:maxAge:maxSize:compress:remainingSize:",  +[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", @"/Library/Logs/wifimanager.log"),  v6,  0x7FFFFFFFFFFFFFFFLL,  v12,  0LL,  1.79769313e308);
    if (v16) {
      [v14 addObject:v16];
    }
    id v17 = -[W5LogManager __collectFileAtURL:outputDirectory:maxAge:maxSize:compress:remainingSize:]( self,  "__collectFileAtURL:outputDirectory:maxAge:maxSize:compress:remainingSize:",  +[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", @"/Library/Logs/wifi_driver.log"),  v6,  0x7FFFFFFFFFFFFFFFLL,  v12,  0LL,  1.79769313e308);
    if (v17) {
      [v14 addObject:v17];
    }
    id v18 = -[W5LogManager __collectFileAtURL:outputDirectory:maxAge:maxSize:compress:remainingSize:]( self,  "__collectFileAtURL:outputDirectory:maxAge:maxSize:compress:remainingSize:",  +[NSURL fileURLWithPath:]( &OBJC_CLASS___NSURL,  "fileURLWithPath:",  @"/private/var/logs/wifiFirmwareLoader.log"),  v6,  0x7FFFFFFFFFFFFFFFLL,  v12,  0LL,  1.79769313e308);
    if (v18) {
      [v14 addObject:v18];
    }
  }

  LOBYTE(v22) = (_BYTE)v12;
  id v19 = -[W5LogManager __collectFilesInDirectories:include:exclude:maxAge:maxCount:maxSize:outputDirectory:compress:remainingSize:contentFilter:]( self,  "__collectFilesInDirectories:include:exclude:maxAge:maxCount:maxSize:outputDirectory:compress:remainingSize:contentFilter:",  -[W5LogManager __possibleTempWiFiLogPaths](self, "__possibleTempWiFiLogPaths"),  0LL,  +[NSRegularExpression regularExpressionWithPattern:options:error:]( &OBJC_CLASS___NSRegularExpression,  "regularExpressionWithPattern:options:error:",  @"WiFiManager$|WiFiDebugInfo\\.tar\\.gz$",  0LL,  0LL),  v11,  0x7FFFFFFFFFFFFFFFLL,  v6,  v9,  v22,  0LL,  0LL);
  if (v19) {
    [v14 addObjectsFromArray:v19];
  }
  id v20 = -[W5LogManager __collectFilteredWiFiManagerLogArchiveWithOutputURL:compress:age:]( self,  "__collectFilteredWiFiManagerLogArchiveWithOutputURL:compress:age:",  v6,  v12,  600LL);
  if (v20) {
    [v14 addObject:v20];
  }
  [v5 setRelativeURLs:v14];
  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v5, "setCompletedAt:");
  return v5;
}

- (id)__collectWiFiLogsDump:(id)a3
{
  id v5 = objc_alloc_init(&OBJC_CLASS___W5LogItemReceipt);
  [v5 setRequest:a3];
  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v5, "setStartedAt:");
  -[W5LogManager __dumpWiFiLogs](self, "__dumpWiFiLogs");
  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v5, "setCompletedAt:");
  return v5;
}

- (id)__collectEAP8021XLogs:(id)a3
{
  id v5 = objc_alloc_init(&OBJC_CLASS___W5LogItemReceipt);
  [v5 setRequest:a3];
  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v5, "setStartedAt:");
  id v6 = objc_msgSend(objc_msgSend(a3, "configuration"), "objectForKeyedSubscript:", @"OutputDirectory");
  id v7 = +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array");
  if (-[NSFileManager fileExistsAtPath:]( +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"),  "fileExistsAtPath:",  @"/Library/Preferences/SystemConfiguration/com.apple.network.eapolclient.configuration.plist")
    && sub_10008D400( +[NSURL fileURLWithPath:]( &OBJC_CLASS___NSURL,  "fileURLWithPath:",  @"/Library/Preferences/SystemConfiguration/com.apple.network.eapolclient.configuration.plist"),  v6,  0LL))
  {
    objc_msgSend( v7,  "addObject:",  +[NSURL fileURLWithPath:]( NSURL,  "fileURLWithPath:",  @"com.apple.network.eapolclient.configuration.plist"));
  }

  id v8 = -[W5LogManager __mostRecentInDirectories:matchingPrefix:matchingSuffix:excludingPrefix:excludingSuffix:maxAge:]( self,  "__mostRecentInDirectories:matchingPrefix:matchingSuffix:excludingPrefix:excludingSuffix:maxAge:",  &off_1000E3DE0,  @"com.apple.networking.eapol.log",  0LL,  0LL,  0LL,  1.79769313e308);
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  if (objc_msgSend(v8, "count", 0)) {
    uint64_t v9 = 1LL;
  }
  else {
    uint64_t v9 = (uint64_t)[v8 count];
  }
  id v10 = objc_msgSend(v8, "subarrayWithRange:", 0, v9);
  id v11 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v18;
    do
    {
      for (i = 0LL; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v18 != v13) {
          objc_enumerationMutation(v10);
        }
        id v15 = *(void **)(*((void *)&v17 + 1) + 8LL * (void)i);
        if (sub_10008D400( +[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", v15),  v6,  0LL)) {
          objc_msgSend( v7,  "addObject:",  +[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", objc_msgSend(v15, "lastPathComponent")));
        }
      }

      id v12 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }

    while (v12);
  }

  [v5 setRelativeURLs:v7];
  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v5, "setCompletedAt:");
  return v5;
}

- (id)__collectIPConfigurationLogs:(id)a3
{
  id v5 = objc_alloc_init(&OBJC_CLASS___W5LogItemReceipt);
  [v5 setRequest:a3];
  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v5, "setStartedAt:");
  id v6 = objc_msgSend(objc_msgSend(a3, "configuration"), "objectForKeyedSubscript:", @"OutputDirectory");
  id v7 = +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array");
  id v8 = -[W5LogManager __mostRecentInDirectories:matchingPrefix:matchingSuffix:excludingPrefix:excludingSuffix:maxAge:]( self,  "__mostRecentInDirectories:matchingPrefix:matchingSuffix:excludingPrefix:excludingSuffix:maxAge:",  &off_1000E3DF8,  @"com.apple.networking.IPConfiguration.log",  0LL,  0LL,  0LL,  1.79769313e308);
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  if (objc_msgSend(v8, "count", 0)) {
    uint64_t v9 = 1LL;
  }
  else {
    uint64_t v9 = (uint64_t)[v8 count];
  }
  id v10 = objc_msgSend(v8, "subarrayWithRange:", 0, v9);
  id v11 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v18;
    do
    {
      for (i = 0LL; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v18 != v13) {
          objc_enumerationMutation(v10);
        }
        id v15 = *(void **)(*((void *)&v17 + 1) + 8LL * (void)i);
        if (sub_10008D400( +[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", v15),  v6,  0LL)) {
          objc_msgSend( v7,  "addObject:",  +[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", objc_msgSend(v15, "lastPathComponent")));
        }
      }

      id v12 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }

    while (v12);
  }

  [v5 setRelativeURLs:v7];
  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v5, "setCompletedAt:");
  return v5;
}

- (id)__collectSystemLogs:(id)a3
{
  id v4 = objc_alloc_init(&OBJC_CLASS___W5LogItemReceipt);
  [v4 setRequest:a3];
  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v4, "setStartedAt:");
  id v5 = objc_msgSend(objc_msgSend(a3, "configuration"), "objectForKeyedSubscript:", @"OutputDirectory");
  id v6 = objc_msgSend(objc_msgSend(a3, "configuration"), "objectForKeyedSubscript:", @"MaxAge");
  id v7 = objc_msgSend(objc_msgSend(a3, "configuration"), "objectForKeyedSubscript:", @"MaxSize");
  unsigned int v8 = objc_msgSend( objc_msgSend(objc_msgSend(a3, "configuration"), "objectForKeyedSubscript:", @"LimitTime"),  "BOOLValue");
  id v9 = +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array");
  v18[0] = @"-B";
  v18[1] = @"-x";
  void v18[2] = objc_msgSend(objc_msgSend(v5, "path"), "stringByAppendingPathComponent:", @"syslog.asl");
  if (+[NSTask runTaskWithLaunchPath:arguments:error:]( &OBJC_CLASS___NSTask,  "runTaskWithLaunchPath:arguments:error:",  @"/usr/bin/syslog",  +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v18, 3LL),  0LL))
  {
    objc_msgSend( v9,  "addObject:",  +[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", @"syslog.asl"));
  }

  id v10 = +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array");
  [v10 addObject:@"collect"];
  if (v6)
  {
    +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
    double v12 = v11;
    [v6 doubleValue];
    double v14 = v12 - v13;
    id v15 = objc_alloc_init(&OBJC_CLASS___NSDateFormatter);
    -[NSDateFormatter setDateFormat:](v15, "setDateFormat:", @"yyyy-MM-dd");
    if (v8) {
      -[NSDateFormatter setDateFormat:](v15, "setDateFormat:", @"yyyy-MM-dd HH:mm:ss");
    }
    id v16 = -[NSDateFormatter stringFromDate:]( v15,  "stringFromDate:",  +[NSDate dateWithTimeIntervalSinceReferenceDate:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceReferenceDate:",  v14));
    [v10 addObject:@"--start"];
    [v10 addObject:v16];
  }

  if (v7)
  {
    [v10 addObject:@"--size"];
    [v10 addObject:+[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%lum", objc_msgSend(v7, "unsignedIntegerValue"))];
  }

  [v10 addObject:@"--output"];
  objc_msgSend( v10,  "addObject:",  objc_msgSend(objc_msgSend(v5, "URLByAppendingPathComponent:isDirectory:", @"system.logarchive", 0), "path"));
  if (+[NSTask runTaskWithLaunchPath:arguments:error:]( &OBJC_CLASS___NSTask,  "runTaskWithLaunchPath:arguments:error:",  @"/usr/bin/log",  v10,  0LL))
  {
    objc_msgSend( v9,  "addObject:",  +[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", @"system.logarchive"));
  }

  [v4 setRelativeURLs:v9];
  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v4, "setCompletedAt:");
  return v4;
}

- (id)__collectWiFiVelocityLog:(id)a3
{
  id v5 = objc_alloc_init(&OBJC_CLASS___W5LogItemReceipt);
  [v5 setRequest:a3];
  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v5, "setStartedAt:");
  id v6 = objc_msgSend(objc_msgSend(a3, "configuration"), "objectForKeyedSubscript:", @"OutputDirectory");
  unsigned int v7 = objc_msgSend( objc_msgSend(objc_msgSend(a3, "configuration"), "objectForKeyedSubscript:", @"Compress"),  "BOOLValue");
  id v8 = objc_msgSend(objc_msgSend(a3, "configuration"), "objectForKeyedSubscript:", @"MaxAge");
  if (v8) {
    uint64_t v9 = (uint64_t)[v8 unsignedIntegerValue];
  }
  else {
    uint64_t v9 = 300LL;
  }
  id v10 = objc_msgSend(objc_msgSend(v6, "path"), "stringByAppendingPathComponent:", @"wifivelocity_logarchive.log");
  v15[0] = @"show";
  v15[1] = @"--info";
  v15[2] = @"--debug";
  void v15[3] = @"--signpost";
  v15[4] = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"--last=%lus", v9);
  void v15[5] = @"--style=syslog";
  v15[6] = @"--predicate=message BEGINSWITH \"[wifivelocity]\"";
  if (+[NSTask runTaskWithLaunchPath:arguments:outputFilePath:error:]( &OBJC_CLASS___NSTask,  "runTaskWithLaunchPath:arguments:outputFilePath:error:",  @"/usr/bin/log",  +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v15, 7LL),  v10,  0LL))
  {
    if (v7)
    {
      id v11 = -[W5LogManager __collectFileAtURL:outputDirectory:maxAge:maxSize:compress:remainingSize:]( self,  "__collectFileAtURL:outputDirectory:maxAge:maxSize:compress:remainingSize:",  +[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", v10),  v6,  0x7FFFFFFFFFFFFFFFLL,  1LL,  0LL,  1.79769313e308);
      if (v11)
      {
        id v14 = v11;
        objc_msgSend( v5,  "setRelativeURLs:",  +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v14, 1));
      }

      -[NSFileManager removeItemAtPath:error:]( +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"),  "removeItemAtPath:error:",  v10,  0LL);
    }

    else
    {
      double v13 = +[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", @"wifivelocity_logarchive.log");
      objc_msgSend( v5,  "setRelativeURLs:",  +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v13, 1));
    }
  }

  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v5, "setCompletedAt:");
  return v5;
}

- (id)__collectSystemLogs24:(id)a3
{
  id v5 = objc_msgSend(objc_msgSend(a3, "configuration"), "mutableCopy");
  [v5 setObject:0 forKeyedSubscript:@"MaxSize"];
  [v5 setObject:&off_1000DF120 forKeyedSubscript:@"MaxAge"];
  [a3 setConfiguration:v5];
  return -[W5LogManager __collectSystemLogs:](self, "__collectSystemLogs:", a3);
}

- (id)__collectAirPlayLogs:(id)a3
{
  id v5 = objc_alloc_init(&OBJC_CLASS___W5LogItemReceipt);
  [v5 setRequest:a3];
  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v5, "setStartedAt:");
  id v6 = objc_msgSend(objc_msgSend(a3, "configuration"), "objectForKeyedSubscript:", @"OutputDirectory");
  id v7 = +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array");
  id v8 = -[W5LogManager __mostRecentInDirectories:matchingPrefix:matchingSuffix:excludingPrefix:excludingSuffix:maxAge:]( self,  "__mostRecentInDirectories:matchingPrefix:matchingSuffix:excludingPrefix:excludingSuffix:maxAge:",  &off_1000E3E10,  @"AirPlay",  0LL,  0LL,  0LL,  1.79769313e308);
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  if (objc_msgSend(v8, "count", 0)) {
    uint64_t v9 = 1LL;
  }
  else {
    uint64_t v9 = (uint64_t)[v8 count];
  }
  id v10 = objc_msgSend(v8, "subarrayWithRange:", 0, v9);
  id v11 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v18;
    do
    {
      for (i = 0LL; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v18 != v13) {
          objc_enumerationMutation(v10);
        }
        id v15 = *(void **)(*((void *)&v17 + 1) + 8LL * (void)i);
        if (sub_10008D400( +[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", v15),  v6,  0LL)) {
          objc_msgSend( v7,  "addObject:",  +[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", objc_msgSend(v15, "lastPathComponent")));
        }
      }

      id v12 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }

    while (v12);
  }

  [v5 setRelativeURLs:v7];
  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v5, "setCompletedAt:");
  return v5;
}

- (id)__collectWirelessProxLogs:(id)a3
{
  id v4 = objc_alloc_init(&OBJC_CLASS___W5LogItemReceipt);
  [v4 setRequest:a3];
  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v4, "setStartedAt:");
  id v5 = objc_msgSend(objc_msgSend(a3, "configuration"), "objectForKeyedSubscript:", @"OutputDirectory");
  if (-[NSFileManager fileExistsAtPath:]( +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"),  "fileExistsAtPath:",  @"/private/var/log/wirelessproxd.log")
    && sub_10008D400( +[NSURL fileURLWithPath:]( &OBJC_CLASS___NSURL,  "fileURLWithPath:",  @"/private/var/log/wirelessproxd.log"),  v5,  0LL))
  {
    id v7 = +[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", @"wirelessproxd.log");
    objc_msgSend( v4,  "setRelativeURLs:",  +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v7, 1));
  }

  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v4, "setCompletedAt:");
  return v4;
}

- (id)__collectSharingLogs:(id)a3
{
  id v4 = objc_alloc_init(&OBJC_CLASS___W5LogItemReceipt);
  [v4 setRequest:a3];
  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v4, "setStartedAt:");
  id v5 = objc_msgSend(objc_msgSend(a3, "configuration"), "objectForKeyedSubscript:", @"OutputDirectory");
  id v6 = objc_msgSend(objc_msgSend(a3, "configuration"), "objectForKeyedSubscript:", @"HomeDirectory");
  if (-[NSFileManager fileExistsAtPath:]( +[NSFileManager defaultManager](NSFileManager, "defaultManager"),  "fileExistsAtPath:",  objc_msgSend( objc_msgSend(v6, "path"),  "stringByAppendingPathComponent:",  @"/Library/Logs/com.apple.sharingd/sharingd.log"))
    && sub_10008D400( [v6 URLByAppendingPathComponent:@"/Library/Logs/com.apple.sharingd/sharingd.log"],  v5,  0))
  {
    id v8 = +[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", @"sharingd.log");
    objc_msgSend( v4,  "setRelativeURLs:",  +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v8, 1));
  }

  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v4, "setCompletedAt:");
  return v4;
}

- (id)__collectBluetoothLogs:(id)a3
{
  id v4 = objc_alloc_init(&OBJC_CLASS___W5LogItemReceipt);
  [v4 setRequest:a3];
  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v4, "setStartedAt:");
  id v5 = objc_msgSend(objc_msgSend(a3, "configuration"), "objectForKeyedSubscript:", @"OutputDirectory");
  id v6 = +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array");
  if (-[NSFileManager fileExistsAtPath:]( +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"),  "fileExistsAtPath:",  @"/Library/Preferences/com.apple.Bluetooth.plist")
    && sub_10008D400( +[NSURL fileURLWithPath:]( &OBJC_CLASS___NSURL,  "fileURLWithPath:",  @"/Library/Preferences/com.apple.Bluetooth.plist"),  v5,  0LL))
  {
    objc_msgSend( v6,  "addObject:",  +[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", @"com.apple.Bluetooth.plist"));
  }

  if (-[NSFileManager fileExistsAtPath:]( +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"),  "fileExistsAtPath:",  @"/private/var/log/blued.log")
    && sub_10008D400( +[NSURL fileURLWithPath:]( &OBJC_CLASS___NSURL,  "fileURLWithPath:",  @"/private/var/log/blued.log"),  v5,  0LL))
  {
    objc_msgSend( v6,  "addObject:",  +[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", @"blued.log"));
  }

  if (-[NSFileManager fileExistsAtPath:]( +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"),  "fileExistsAtPath:",  @"/Library/Logs/Bluetooth/")
    && sub_10008D400( +[NSURL fileURLWithPath:]( &OBJC_CLASS___NSURL,  "fileURLWithPath:",  @"/Library/Logs/Bluetooth/"),  v5,  0LL))
  {
    objc_msgSend( v6,  "addObject:",  +[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", @"blued.log"));
  }

  if (-[NSFileManager fileExistsAtPath:]( +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"),  "fileExistsAtPath:",  @"Library/Preferences/com.apple.BTServer.plist")
    && sub_10008D400( +[NSURL fileURLWithPath:]( &OBJC_CLASS___NSURL,  "fileURLWithPath:",  @"Library/Preferences/com.apple.BTServer.plist"),  v5,  0LL))
  {
    objc_msgSend( v6,  "addObject:",  +[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", @"com.apple.BTServer.plist"));
  }

  [v4 setRelativeURLs:v6];
  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v4, "setCompletedAt:");
  return v4;
}

- (id)__collectDextCoreDump:(id)a3
{
  id v4 = objc_alloc_init(&OBJC_CLASS___W5LogItemReceipt);
  [v4 setRequest:a3];
  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v4, "setStartedAt:");
  id v5 = objc_msgSend(objc_msgSend(a3, "configuration"), "objectForKeyedSubscript:", @"OutputDirectory");
  id v23 = +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array");
  id v6 = +[NSURL fileURLWithPath:]( NSURL,  "fileURLWithPath:",  objc_msgSend(objc_msgSend(v5, "path"), "stringByAppendingPathComponent:", @"dext_coredumps"));
  id v7 = +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager");
  char v28 = 0;
  id v8 = @"/private/var/dextcores";
  unsigned __int8 v9 = -[NSFileManager fileExistsAtPath:isDirectory:]( v7,  "fileExistsAtPath:isDirectory:",  @"/private/var/dextcores",  &v28);
  if ((v9 & (v28 != 0)) == 0) {
    id v8 = @"/private/var/cores";
  }
  id v10 = -[NSFileManager contentsOfDirectoryAtPath:error:](v7, "contentsOfDirectoryAtPath:error:", v8, 0LL);
  if (-[NSArray count](v10, "count"))
  {
    if (-[NSFileManager createDirectoryAtPath:withIntermediateDirectories:attributes:error:]( v7,  "createDirectoryAtPath:withIntermediateDirectories:attributes:error:",  -[NSURL path](v6, "path"),  0LL,  0LL,  0LL))
    {
      uint64_t v22 = v4;
      __int128 v26 = 0u;
      __int128 v27 = 0u;
      __int128 v24 = 0u;
      __int128 v25 = 0u;
      id v11 = -[NSArray countByEnumeratingWithState:objects:count:]( v10,  "countByEnumeratingWithState:objects:count:",  &v24,  v29,  16LL);
      if (v11)
      {
        id v12 = v11;
        uint64_t v13 = *(void *)v25;
        do
        {
          id v14 = 0LL;
          do
          {
            if (*(void *)v25 != v13) {
              objc_enumerationMutation(v10);
            }
            id v15 = *(void **)(*((void *)&v24 + 1) + 8LL * (void)v14);
            id v16 = -[NSURL URLByAppendingPathComponent:]( +[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", v8),  "URLByAppendingPathComponent:",  v15);
            id v17 = [v15 stringByAppendingString:@".tgz"];
            __int128 v18 = -[NSURL URLByAppendingPathComponent:](v6, "URLByAppendingPathComponent:", v17);
            *(void *)double v30 = 0LL;
            if (sub_10008C94C(v16, v18, (NSError **)v30)) {
              objc_msgSend( v23,  "addObject:",  +[NSURL fileURLWithPath:]( NSURL,  "fileURLWithPath:",  objc_msgSend(v17, "lastPathComponent")));
            }
            id v14 = (char *)v14 + 1;
          }

          while (v12 != v14);
          id v12 = -[NSArray countByEnumeratingWithState:objects:count:]( v10,  "countByEnumeratingWithState:objects:count:",  &v24,  v29,  16LL);
        }

        while (v12);
      }

      id v4 = v22;
      [v22 setRelativeURLs:v23];
    }

    else
    {
      __int128 v20 = (os_log_s *)sub_10008C90C();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        __int128 v21 = -[NSURL path](v6, "path");
        *(_DWORD *)double v30 = 136316162;
        *(void *)&void v30[4] = "-[W5LogManager __collectDextCoreDump:]";
        __int16 v31 = 2080;
        id v32 = "W5LogManager.m";
        __int16 v33 = 1024;
        int v34 = 5694;
        __int16 v35 = 2114;
        uint64_t v36 = v21;
        __int16 v37 = 2114;
        id v38 = a3;
        _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v20,  0LL,  "[wifivelocity] %s (%s:%u) WiFiDextCrashSoftError createDirectoryAtPath fail for path:%{public}@ request:%{public}@",  v30,  48);
      }
    }
  }

  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v4, "setCompletedAt:");
  return v4;
}

- (id)__collectCrashesAndSpins24:(id)a3
{
  id v4 = objc_alloc_init(&OBJC_CLASS___W5LogItemReceipt);
  [v4 setRequest:a3];
  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  uint64_t v22 = v4;
  objc_msgSend(v4, "setStartedAt:");
  id v5 = objc_msgSend(objc_msgSend(a3, "configuration"), "objectForKeyedSubscript:", @"OutputDirectory");
  id v23 = +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array");
  __int128 v25 = v5;
  -[NSFileManager createDirectoryAtPath:withIntermediateDirectories:attributes:error:]( +[NSFileManager defaultManager](NSFileManager, "defaultManager"),  "createDirectoryAtPath:withIntermediateDirectories:attributes:error:",  objc_msgSend(objc_msgSend(v5, "path"), "stringByAppendingPathComponent:", @"crashes_and_spins"),  0,  0,  0);
  id v6 = -[NSFileManager contentsOfDirectoryAtPath:error:]( +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"),  "contentsOfDirectoryAtPath:error:",  @"/Library/Logs/CrashReporter",  0LL);
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  id v7 = -[NSArray countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v26,  v30,  16LL);
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v27;
    uint64_t v24 = *(void *)v27;
    do
    {
      id v10 = 0LL;
      do
      {
        if (*(void *)v27 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v26 + 1) + 8LL * (void)v10);
        id v12 = -[NSFileManager attributesOfItemAtPath:error:]( +[NSFileManager defaultManager](NSFileManager, "defaultManager"),  "attributesOfItemAtPath:error:",  [@"/Library/Logs/CrashReporter" stringByAppendingPathComponent:v11],  0);
        -[NSDate timeIntervalSinceReferenceDate]( -[NSDictionary fileCreationDate](v12, "fileCreationDate"),  "timeIntervalSinceReferenceDate");
        double v14 = v13;
        if (-[NSString isEqualToString:]( -[NSDictionary fileType](v12, "fileType"),  "isEqualToString:",  NSFileTypeRegular))
        {
          +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
          if (v15 - v14 < 86400.0)
          {
            if ([v11 hasSuffix:@"ips"])
            {
              id v16 = +[NSData dataWithContentsOfFile:]( NSData,  "dataWithContentsOfFile:",  [@"/Library/Logs/CrashReporter" stringByAppendingPathComponent:v11]);
              unint64_t v17 = (unint64_t)-[NSData rangeOfData:options:range:]( v16,  "rangeOfData:options:range:",  +[NSData dataWithBytes:length:]( &OBJC_CLASS___NSData,  "dataWithBytes:length:",  "\n",  1LL),  0LL,  0LL,  -[NSData length](v16, "length"));
              __int128 v18 = (char *)(v17 + 1);
              __int128 v19 = (char *)-[NSData length](v16, "length") + ~v17;
              id v20 = objc_msgSend( objc_msgSend(v11, "stringByDeletingPathExtension"),  "stringByAppendingPathExtension:",  @"crash");
              uint64_t v9 = v24;
              if (-[NSData writeToFile:atomically:]( -[NSData subdataWithRange:](v16, "subdataWithRange:", v18, v19),  "writeToFile:atomically:",  objc_msgSend( objc_msgSend( objc_msgSend(v25, "path"),  "stringByAppendingPathComponent:",  @"crashes_and_spins"),  "stringByAppendingPathComponent:",  v20),  0))
              {
                objc_msgSend( v23,  "addObject:",  +[NSURL fileURLWithPath:]( NSURL,  "fileURLWithPath:",  objc_msgSend(v20, "lastPathComponent")));
              }
            }
          }
        }

        id v10 = (char *)v10 + 1;
      }

      while (v8 != v10);
      id v8 = -[NSArray countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v26,  v30,  16LL);
    }

    while (v8);
  }

  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v22, "setCompletedAt:");
  return v22;
}

- (id)__collectEventHistory:(id)a3
{
  id v5 = objc_alloc_init(&OBJC_CLASS___W5LogItemReceipt);
  [v5 setRequest:a3];
  id v6 = &Apple80211BindToInterface_ptr;
  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  __int128 v97 = v5;
  objc_msgSend(v5, "setStartedAt:");
  id v96 = objc_msgSend(objc_msgSend(a3, "configuration"), "objectForKeyedSubscript:", @"OutputDirectory");
  id v7 = -[W5StatusManager eventHistory](self->_status, "eventHistory");
  id v8 = +[NSMutableString string](&OBJC_CLASS___NSMutableString, "string");
  __int128 v103 = 0u;
  __int128 v104 = 0u;
  __int128 v105 = 0u;
  __int128 v106 = 0u;
  id v102 = [v7 countByEnumeratingWithState:&v103 objects:v108 count:16];
  if (v102)
  {
    uint64_t v9 = *(void *)v104;
    __int128 v98 = self;
    id v99 = v8;
    id v100 = v7;
    uint64_t v101 = *(void *)v104;
    do
    {
      id v10 = 0LL;
      do
      {
        if (*(void *)v104 != v9) {
          objc_enumerationMutation(v7);
        }
        id v11 = *(void **)(*((void *)&v103 + 1) + 8LL * (void)v10);
        switch((unint64_t)[v11 eventID])
        {
          case 4uLL:
            id v12 = objc_msgSend(objc_msgSend(v11, "info"), "objectForKeyedSubscript:", @"NetworkStatus");
            BOOL v13 = ([v12 isAppleReachable] & 2) != 0
               && ([v12 isAppleReachable] & 4) == 0;
            id v75 = [v12 primaryIPv4InterfaceName];
            id v76 = objc_msgSend(objc_msgSend(v12, "primaryIPv4Addresses"), "firstObject");
            id v77 = [v12 primaryIPv4Router];
            id v78 = [v12 primaryIPv6InterfaceName];
            id v79 = objc_msgSend(objc_msgSend(v12, "primaryIPv6Addresses"), "firstObject");
            id v80 = [v12 primaryIPv6Router];
            id v81 = objc_msgSend(objc_msgSend(v12, "primaryDNSAddresses"), "firstObject");
            id v82 = "no";
            if (v13) {
              id v82 = "yes";
            }
            uint64_t v72 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Network Status: ipv4[if=%@ ip=%@ router=%@] ipv6[if=%@ ip=%@ router=%@] dns=%@ reach=%s",  v75,  v76,  v77,  v78,  v79,  v80,  v81,  v82);
            id v6 = &Apple80211BindToInterface_ptr;
            self = v98;
            id v8 = v99;
            id v7 = v100;
            uint64_t v9 = v101;
            if (v72) {
              goto LABEL_41;
            }
            goto LABEL_42;
          case 0xCuLL:
            unint64_t v17 = @"BT Paging Start";
            goto LABEL_39;
          case 0xDuLL:
            unint64_t v17 = @"BT Paging End";
            goto LABEL_39;
          case 0xEuLL:
            id v18 = [v11 info];
            id v19 = [v18 objectForKeyedSubscript:@"InterfaceName"];
            id v20 = objc_msgSend( objc_msgSend(v18, "objectForKeyedSubscript:", @"EAPControlMode"),  "unsignedIntValue");
            id v21 = objc_msgSend( objc_msgSend(v18, "objectForKeyedSubscript:", @"EAPControlState"),  "unsignedIntValue");
            id v22 = objc_msgSend( objc_msgSend(v18, "objectForKeyedSubscript:", @"EAPSupplicantState"),  "unsignedIntValue");
            id v23 = objc_msgSend(objc_msgSend(v18, "objectForKeyedSubscript:", @"EAPClientStatus"), "intValue");
            uint64_t v24 = W5DescriptionForEAPOLControlState(v21);
            uint64_t v25 = W5DescriptionForEAPOLControlMode(v20);
            id v26 = v22;
            id v7 = v100;
            uint64_t v86 = v24;
            uint64_t v9 = v101;
            id v8 = v99;
            double v15 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"EAP8021X: %@ if=%@ mode=%@ supp=%@ status=%u",  v86,  v19,  v25,  W5DescriptionForEAPOLSupplicantState(v26),  v23);
            break;
          case 0xFuLL:
            id v27 = [v11 info];
            id v28 = objc_msgSend(objc_msgSend(v27, "objectForKeyedSubscript:", @"PowerSourceType"), "integerValue");
            objc_msgSend(objc_msgSend(v27, "objectForKeyedSubscript:", @"BatteryEstimatedTime"), "doubleValue");
            uint64_t v30 = v29;
            objc_msgSend(objc_msgSend(v27, "objectForKeyedSubscript:", @"BatteryLevel"), "doubleValue");
            id v32 = v31;
            id v33 = objc_msgSend(objc_msgSend(v27, "objectForKeyedSubscript:", @"BatteryWarningLevel"), "intValue");
            uint64_t v34 = W5DescriptionForPowerSourceType(v28);
            double v93 = COERCE_DOUBLE(W5DescriptionForBatteryWarningLevel(v33));
            uint64_t v89 = v30;
            id v91 = v32;
            id v85 = (id)v34;
            unint64_t v17 = @"Power Source: ps=%@ est=%.3fs lvl=%.1f%% warn=%@";
            goto LABEL_29;
          case 0x10uLL:
            id v85 = (id)W5DescriptionForPowerStateCaps( objc_msgSend( objc_msgSend( objc_msgSend(v11, "info"),  "objectForKeyedSubscript:",  @"SystemPowerStateCaps"),  "unsignedIntValue"));
            unint64_t v17 = @"Power State: %@";
            goto LABEL_39;
          case 0x11uLL:
            id v35 = [v11 info];
            id v36 = objc_msgSend(objc_msgSend(v35, "objectForKeyedSubscript:", @"PowerSourceType"), "integerValue");
            objc_msgSend(objc_msgSend(v35, "objectForKeyedSubscript:", @"BatteryEstimatedTime"), "doubleValue");
            uint64_t v38 = v37;
            objc_msgSend(objc_msgSend(v35, "objectForKeyedSubscript:", @"BatteryLevel"), "doubleValue");
            __int128 v40 = v39;
            id v41 = objc_msgSend(objc_msgSend(v35, "objectForKeyedSubscript:", @"BatteryWarningLevel"), "intValue");
            uint64_t v42 = W5DescriptionForPowerSourceType(v36);
            double v93 = COERCE_DOUBLE(W5DescriptionForBatteryWarningLevel(v41));
            uint64_t v89 = v38;
            id v91 = v40;
            id v85 = (id)v42;
            unint64_t v17 = @"Low Battery: ps=%@ est=%.3fs lvl=%.1f%% warn=%@";
            goto LABEL_29;
          case 0x12uLL:
            id v43 = [v11 info];
            id v44 = [v43 objectForKeyedSubscript:@"InterfaceName"];
            unsigned int v45 = objc_msgSend( objc_msgSend(v43, "objectForKeyedSubscript:", @"WiFiPowerOn"),  "BOOLValue");
            __int128 v46 = "OFF";
            if (v45) {
              __int128 v46 = "ON";
            }
            double v15 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Wi-Fi Power: if=%@ state=%s",  v44,  v46,  v91,  *(void *)&v93,  v95);
            break;
          case 0x13uLL:
            id v47 = [v11 info];
            double v15 = +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"Wi-Fi SSID: if=%@ ssid=%@",  [v47 objectForKeyedSubscript:@"InterfaceName"],  objc_msgSend(v47, "objectForKeyedSubscript:", @"WiFiSSIDString"),  v91,  *(void *)&v93,  v95);
            break;
          case 0x14uLL:
            id v48 = [v11 info];
            double v15 = +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"Wi-Fi BSSID: if=%@ bssid=%@",  [v48 objectForKeyedSubscript:@"InterfaceName"],  objc_msgSend(v48, "objectForKeyedSubscript:", @"WiFiBSSID"),  v91,  *(void *)&v93,  v95);
            break;
          case 0x15uLL:
            double v15 = +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"Wi-Fi RSN Handshake: if=%@",  objc_msgSend(objc_msgSend(v11, "info"), "objectForKeyedSubscript:", @"InterfaceName"),  v89,  v91,  *(void *)&v93,  v95);
            break;
          case 0x16uLL:
            id v49 = [v11 info];
            id v50 = [v49 objectForKeyedSubscript:@"InterfaceName"];
            unsigned int v51 = objc_msgSend( objc_msgSend(v49, "objectForKeyedSubscript:", @"WiFiLinkUp"),  "BOOLValue");
            id v52 = objc_msgSend( objc_msgSend(v49, "objectForKeyedSubscript:", @"WiFiLinkChangeReason"),  "integerValue");
            id v53 = objc_msgSend( objc_msgSend(v49, "objectForKeyedSubscript:", @"WiFiLinkChangeSubreason"),  "integerValue");
            unsigned int v54 = objc_msgSend( objc_msgSend(v49, "objectForKeyedSubscript:", @"WiFiLinkChangeInvoluntary"),  "BOOLValue");
            __int128 v55 = "DOWN";
            if (v51) {
              __int128 v55 = "UP";
            }
            id v94 = v53;
            id v92 = v52;
            uint64_t v9 = v101;
            id v87 = v50;
            id v8 = v99;
            id v7 = v100;
            double v15 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Wi-Fi Link: if=%@ link=%s reason=%ld subreason=%ld involuntary=%d",  v87,  v55,  v92,  v94,  v54);
            break;
          case 0x17uLL:
            id v56 = [v11 info];
            id v85 = [v56 objectForKeyedSubscript:@"InterfaceName"];
            uint64_t v89 = W5DescriptionForOpMode(objc_msgSend(objc_msgSend(v56, "objectForKeyedSubscript:", @"WiFiMode"), "intValue"));
            unint64_t v17 = @"Wi-Fi Mode: if=%@ mode=%@";
            goto LABEL_39;
          case 0x18uLL:
            id v14 = [v11 info];
            double v15 = +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"Wi-Fi Country Code: if=%@ cc=%@",  [v14 objectForKeyedSubscript:@"InterfaceName"],  objc_msgSend(v14, "objectForKeyedSubscript:", @"WiFiCountryCode"),  v91,  *(void *)&v93,  v95);
            break;
          case 0x19uLL:
            id v57 = [v11 info];
            id v58 = [v57 objectForKeyedSubscript:@"InterfaceName"];
            id v59 = [v57 objectForKeyedSubscript:@"WiFiLinkQualityUpdate"];
            id v60 = [v59 rssi];
            id v61 = [v59 txRate];
            [v59 cca];
            double v93 = v62;
            uint64_t v89 = (uint64_t)v60;
            id v91 = v61;
            id v8 = v99;
            id v7 = v100;
            id v85 = v58;
            unint64_t v17 = @"Wi-Fi Link Quality: if=%@ rssi=%lddBm txrate=%ldMbps cca=%.1f%%";
LABEL_29:
            uint64_t v9 = v101;
            goto LABEL_39;
          case 0x1AuLL:
            double v15 = +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"Wi-Fi Deauth: if=%@",  objc_msgSend(objc_msgSend(v11, "info"), "objectForKeyedSubscript:", @"InterfaceName"),  v89,  v91,  *(void *)&v93,  v95);
            break;
          case 0x1BuLL:
            double v15 = +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"Wi-Fi Reset: if=%@",  objc_msgSend(objc_msgSend(v11, "info"), "objectForKeyedSubscript:", @"InterfaceName"),  v89,  v91,  *(void *)&v93,  v95);
            break;
          case 0x1CuLL:
            double v15 = +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"Wi-Fi Availabe: if=%@",  objc_msgSend(objc_msgSend(v11, "info"), "objectForKeyedSubscript:", @"InterfaceName"),  v89,  v91,  *(void *)&v93,  v95);
            break;
          case 0x1DuLL:
            id v16 = [v11 info];
            id v85 = [v16 objectForKeyedSubscript:@"InterfaceName"];
            uint64_t v89 = W5DescriptionForChannel([v16 objectForKeyedSubscript:@"WiFiChannel"]);
            unint64_t v17 = @"Wi-Fi Channel Switch: if=%@ ch=%@";
            goto LABEL_39;
          case 0x1EuLL:
            double v15 = +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"Wi-Fi Roam Start: if=%@",  objc_msgSend(objc_msgSend(v11, "info"), "objectForKeyedSubscript:", @"InterfaceName"),  v89,  v91,  *(void *)&v93,  v95);
            break;
          case 0x1FuLL:
            id v85 = objc_msgSend(objc_msgSend(v11, "info"), "objectForKeyedSubscript:", @"InterfaceName");
            unint64_t v17 = @"Wi-Fi Roam End: if=%@";
            goto LABEL_39;
          case 0x20uLL:
            double v15 = +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"AWDL RTM Start: if=%@",  objc_msgSend(objc_msgSend(v11, "info"), "objectForKeyedSubscript:", @"InterfaceName"),  v89,  v91,  *(void *)&v93,  v95);
            break;
          case 0x21uLL:
            double v15 = +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"AWDL RTM End: if=%@",  objc_msgSend(objc_msgSend(v11, "info"), "objectForKeyedSubscript:", @"InterfaceName"),  v89,  v91,  *(void *)&v93,  v95);
            break;
          case 0x22uLL:
            id v63 = objc_msgSend(objc_msgSend(v11, "info"), "objectForKeyedSubscript:", @"PingResult");
            id v64 = [v63 interfaceName];
            id v65 = [v63 address];
            [v63 min];
            uint64_t v67 = v66;
            [v63 max];
            uint64_t v69 = v68;
            [v63 packetLoss];
            id v88 = v64;
            id v90 = v65;
            id v7 = v100;
            uint64_t v9 = v101;
            double v15 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Ping: if=%@ addr=%@ min=%.2fms max=%.2fms loss=%.2f%%",  v88,  v90,  v67,  v69,  v70);
            break;
          case 0x23uLL:
            id v71 = [v11 info];
            id v85 = [v71 objectForKeyedSubscript:@"InterfaceName"];
            uint64_t v89 = W5DescriptionForWiFiDropReason(objc_msgSend(objc_msgSend(v71, "objectForKeyedSubscript:", @"WiFiDropReason"), "integerValue"));
            unint64_t v17 = @"Wi-Fi Drop: if=%@ reason=%@";
LABEL_39:
            double v15 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  v17,  v85,  v89,  v91,  *(void *)&v93,  v95);
            break;
          default:
            double v15 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Unhandled Event: event=%@",  v11,  v89,  v91,  *(void *)&v93,  v95);
            break;
        }

        uint64_t v72 = v15;
        if (v15)
        {
LABEL_41:
          dateFormatter = self->_dateFormatter;
          uint64_t v74 = v6[116];
          [v11 timestamp];
          [v8 appendFormat:@"%@ %@\n", -[NSDateFormatter stringFromDate:]( dateFormatter, "stringFromDate:", objc_msgSend(v74, "dateWithTimeIntervalSinceReferenceDate:")), v72];
        }

- (id)__collectAdditionalLog:(id)a3 url:(id)a4
{
  id v6 = objc_alloc_init(&OBJC_CLASS___W5LogItemReceipt);
  [v6 setRequest:a3];
  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v6, "setStartedAt:");
  id v7 = objc_msgSend(objc_msgSend(a3, "configuration"), "objectForKeyedSubscript:", @"OutputDirectory");
  if (-[NSFileManager fileExistsAtPath:]( +[NSFileManager defaultManager](NSFileManager, "defaultManager"),  "fileExistsAtPath:",  [a4 path])
    && sub_10008D400( a4,  [v7 URLByAppendingPathComponent:+[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"additional.log")],  0))
  {
    uint64_t v9 = +[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", @"additional.log");
    objc_msgSend( v6,  "setRelativeURLs:",  +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v9, 1));
  }

  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v6, "setCompletedAt:");
  return v6;
}

- (id)__collectMultiple:(id)a3
{
  id v4 = objc_alloc_init(&OBJC_CLASS___W5LogItemReceipt);
  [v4 setRequest:a3];
  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v4, "setStartedAt:");
  id v43 = objc_msgSend(objc_msgSend(a3, "configuration"), "objectForKeyedSubscript:", @"OutputDirectory");
  id v42 = objc_msgSend(objc_msgSend(a3, "configuration"), "objectForKeyedSubscript:", @"HomeDirectory");
  id v41 = objc_msgSend(objc_msgSend(a3, "configuration"), "objectForKeyedSubscript:", @"InternalUUID");
  unsigned __int8 v40 = objc_msgSend( objc_msgSend( objc_msgSend(a3, "configuration"),  "objectForKeyedSubscript:",  @"IncludeEvents"),  "BOOLValue");
  unsigned __int8 v39 = objc_msgSend( objc_msgSend( objc_msgSend(a3, "configuration"),  "objectForKeyedSubscript:",  @"UseMegaWiFiProfileLimits"),  "BOOLValue");
  id v5 = objc_msgSend(objc_msgSend(a3, "configuration"), "objectForKeyedSubscript:", @"UseLeewayUUID");
  id v6 = objc_msgSend(objc_msgSend(a3, "configuration"), "objectForKeyedSubscript:", @"AddLeewayUUID");
  id v7 = objc_msgSend(objc_msgSend(a3, "configuration"), "objectForKeyedSubscript:", @"TimestampUUID");
  unsigned int v8 = objc_msgSend( objc_msgSend( objc_msgSend(a3, "configuration"),  "objectForKeyedSubscript:",  @"RunConcurrent"),  "BOOLValue");
  id obj = objc_msgSend(objc_msgSend(a3, "configuration"), "objectForKeyedSubscript:", @"Requests");
  id v9 = objc_msgSend(objc_msgSend(a3, "configuration"), "objectForKeyedSubscript:", @"Timeout");
  if (v9) {
    uint64_t v10 = (uint64_t)[v9 unsignedIntegerValue];
  }
  else {
    uint64_t v10 = 10000LL;
  }
  if (v5)
  {
    *(void *)id v65 = 0LL;
    *(void *)&v65[8] = v65;
    *(void *)&v65[16] = 0x2020000000LL;
    uint64_t v66 = 0LL;
    queue = (dispatch_queue_s *)self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000678BC;
    block[3] = &unk_1000D2660;
    block[5] = v5;
    void block[6] = v65;
    block[4] = self;
    dispatch_sync(queue, block);
    uint64_t v12 = *(void *)(*(void *)&v65[8] + 24LL);
    BOOL v13 = (os_log_s *)sub_10008C90C();
    v10 += v12;
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v14 = *(void *)(*(void *)&v65[8] + 24LL);
      id v15 = [v5 substringToIndex:5];
      uint64_t v16 = v10 - *(void *)(*(void *)&v65[8] + 24LL);
      *(_DWORD *)id v61 = 134218754;
      *(void *)&v61[4] = v14;
      *(_WORD *)&v61[12] = 2114;
      *(void *)&v61[14] = v15;
      *(_WORD *)&v61[22] = 2048;
      uint64_t v62 = v16;
      __int16 v63 = 2048;
      uint64_t v64 = v10;
      _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v13,  0LL,  "[wifivelocity] Using leeway of %lums [%{public}@], extending timeout from %lums to %lums",  v61,  42);
    }

    _Block_object_dispose(v65, 8);
  }

  id v44 = +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array");
  *(void *)id v61 = 0LL;
  *(void *)&v61[8] = v61;
  *(void *)&v61[16] = 0x2020000000LL;
  LOBYTE(v62) = 0;
  unint64_t v17 = dispatch_queue_create(0LL, 0LL);
  id v18 = objc_alloc_init(&OBJC_CLASS___NSOperationQueue);
  -[NSOperationQueue setMaxConcurrentOperationCount:](v18, "setMaxConcurrentOperationCount:", 1LL);
  if (v8) {
    id v18 = -[W5StatusManager concurrentQueue](self->_status, "concurrentQueue");
  }
  uint64_t v37 = v10;
  id v19 = dispatch_group_create();
  uint64_t v35 = mach_absolute_time();
  id v36 = v4;
  __int128 v55 = 0u;
  __int128 v56 = 0u;
  __int128 v53 = 0u;
  __int128 v54 = 0u;
  id v20 = [obj countByEnumeratingWithState:&v53 objects:v60 count:16];
  if (v20)
  {
    uint64_t v21 = *(void *)v54;
    do
    {
      for (i = 0LL; i != v20; i = (char *)i + 1)
      {
        if (*(void *)v54 != v21) {
          objc_enumerationMutation(obj);
        }
        uint64_t v23 = *(void *)(*((void *)&v53 + 1) + 8LL * (void)i);
        dispatch_group_enter(v19);
        v50[0] = _NSConcreteStackBlock;
        v50[1] = 3221225472LL;
        v50[2] = sub_100067900;
        void v50[3] = &unk_1000D2DD0;
        void v50[4] = v23;
        v50[5] = v43;
        v50[6] = v42;
        v50[7] = v41;
        unsigned __int8 v51 = v40;
        unsigned __int8 v52 = v39;
        v50[8] = self;
        v50[9] = v17;
        v50[11] = v19;
        v50[12] = v61;
        v50[10] = v44;
        -[NSOperationQueue addOperationWithBlock:](v18, "addOperationWithBlock:", v50);
      }

      id v20 = [obj countByEnumeratingWithState:&v53 objects:v60 count:16];
    }

    while (v20);
  }

  if (v37) {
    dispatch_time_t v24 = dispatch_time(0LL, 1000000 * v37);
  }
  else {
    dispatch_time_t v24 = -1LL;
  }
  uint64_t v25 = dispatch_group_wait(v19, v24);
  v49[0] = _NSConcreteStackBlock;
  v49[1] = 3221225472LL;
  v49[2] = sub_100067A88;
  v49[3] = &unk_1000D12E0;
  v49[4] = v61;
  dispatch_sync(v17, v49);
  if (v37 && !v25 && v6)
  {
    mach_timebase_info(&info);
    uint64_t v26 = info.denom ? (mach_absolute_time() - v35) * info.numer / info.denom / 0xF4240 : 0LL;
    uint64_t v27 = v37 - v26;
    id v28 = (dispatch_queue_s *)self->_queue;
    v47[0] = _NSConcreteStackBlock;
    v47[1] = 3221225472LL;
    void v47[2] = sub_100067AB8;
    void v47[3] = &unk_1000D23C8;
    v47[4] = self;
    v47[5] = v6;
    v47[6] = v37 - v26;
    dispatch_async(v28, v47);
    uint64_t v29 = (os_log_s *)sub_10008C90C();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      id v30 = [v6 substringToIndex:5];
      *(_DWORD *)id v65 = 134218242;
      *(void *)&void v65[4] = v27;
      *(_WORD *)&v65[12] = 2114;
      *(void *)&v65[14] = v30;
      LODWORD(v34) = 22;
      _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v29,  0LL,  "[wifivelocity] Storing leeway of %lums [%{public}@]",  v65,  v34);
    }
  }

  uint64_t v31 = mach_absolute_time();
  id v32 = (dispatch_queue_s *)self->_queue;
  v46[0] = _NSConcreteStackBlock;
  v46[1] = 3221225472LL;
  void v46[2] = sub_100067B00;
  void v46[3] = &unk_1000D23C8;
  void v46[4] = v7;
  void v46[5] = self;
  v46[6] = v31;
  dispatch_async(v32, v46);
  v58[0] = @"Receipts";
  v59[0] = [v44 copy];
  v58[1] = @"TimeoutOccurred";
  v59[1] = +[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v25 != 0);
  objc_msgSend( v36,  "setInfo:",  +[NSDictionary dictionaryWithObjects:forKeys:count:]( NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v59,  v58,  2));
  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v36, "setCompletedAt:");
  if (v19) {
    dispatch_release(v19);
  }
  if (v17) {
    dispatch_release(v17);
  }
  _Block_object_dispose(v61, 8);
  return v36;
}

- (id)__collect_mobilewifitool:(id)a3
{
  id v5 = objc_alloc_init(&OBJC_CLASS___W5LogItemReceipt);
  [v5 setRequest:a3];
  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v5, "setStartedAt:");
  id v6 = objc_msgSend( objc_msgSend( objc_msgSend(objc_msgSend(a3, "configuration"), "objectForKeyedSubscript:", @"OutputDirectory"),  "path"),  "stringByAppendingPathComponent:",  @"mobilewifitool.txt");
  -[NSFileManager removeItemAtPath:error:]( +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"),  "removeItemAtPath:error:",  v6,  0LL);
  -[NSFileManager createFileAtPath:contents:attributes:]( +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"),  "createFileAtPath:contents:attributes:",  v6,  0LL,  0LL);
  id v7 = +[NSFileHandle fileHandleForUpdatingAtPath:](&OBJC_CLASS___NSFileHandle, "fileHandleForUpdatingAtPath:", v6);
  if (v7)
  {
    unsigned int v8 = v7;
    -[W5LogManager __runToolWithOutputFileHandle:launchPath:arguments:]( self,  "__runToolWithOutputFileHandle:launchPath:arguments:",  v7,  @"/usr/local/bin/mobilewifitool",  &off_1000E3E28);
    -[W5LogManager __runToolWithOutputFileHandle:launchPath:arguments:]( self,  "__runToolWithOutputFileHandle:launchPath:arguments:",  v8,  @"/usr/local/bin/mobilewifitool",  &off_1000E3E40);
    -[NSFileHandle closeFile](v8, "closeFile");
    uint64_t v10 = +[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", @"mobilewifitool.txt");
    objc_msgSend( v5,  "setRelativeURLs:",  +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v10, 1));
  }

  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v5, "setCompletedAt:");
  return v5;
}

- (void)__endWiFiStats
{
  ioReportSubscription = self->_ioReportSubscription;
  if (ioReportSubscription && self->_ioReportBase)
  {
    if (self->_ioReportDelta)
    {
      CFRelease(self->_ioReportDelta);
      ioReportSubscription = self->_ioReportSubscription;
    }

    Samples = (const void *)IOReportCreateSamples(ioReportSubscription, self->_ioReportChannels, 0LL);
    self->_ioReportDelta = (__CFDictionary *)IOReportCreateSamplesDelta(self->_ioReportBase, Samples, 0LL);
    self->_ioReportDeltaMachAbsoluteTime = mach_absolute_time();
    if (Samples) {
      CFRelease(Samples);
    }
  }

- (void)__startWiFiStats
{
  ioReportSubscription = self->_ioReportSubscription;
  if (ioReportSubscription)
  {
    if (self->_ioReportBase)
    {
      CFRelease(self->_ioReportBase);
      ioReportSubscription = self->_ioReportSubscription;
    }

    self->_ioReportBase = (__CFDictionary *)IOReportCreateSamples(ioReportSubscription, self->_ioReportChannels, 0LL);
    self->_ioReportBaseMachAbsoluteTime = mach_absolute_time();
  }

- (void)__teardownWiFiStats
{
  self->_ioReportBaseMachAbsoluteTime = 0LL;
  self->_ioReportDeltaMachAbsoluteTime = 0LL;
  ioReportBase = self->_ioReportBase;
  if (ioReportBase) {
    CFRelease(ioReportBase);
  }
  self->_ioReportBase = 0LL;
  ioReportDelta = self->_ioReportDelta;
  if (ioReportDelta) {
    CFRelease(ioReportDelta);
  }
  self->_ioReportDelta = 0LL;
  ioReportChannels = self->_ioReportChannels;
  if (ioReportChannels) {
    CFRelease(ioReportChannels);
  }
  self->_ioReportChannels = 0LL;
  ioReportSubscription = self->_ioReportSubscription;
  if (ioReportSubscription) {
    CFRelease(ioReportSubscription);
  }
  self->_ioReportSubscription = 0LL;
}

- (void)__setupWiFiStats
{
  *(void *)parent = 0LL;
  uint64_t Aggregate = IOReportCreateAggregate(2LL, a2);
  if (Aggregate)
  {
    id v4 = (const void *)Aggregate;
    Apple80211GetIOReportingService(&parent[1]);
    if (parent[1])
    {
      uint64_t v5 = ((uint64_t (*)(void))IOReportCopyChannelsForDriver)();
      if (v5)
      {
        id v6 = (const void *)v5;
        CFRelease(v6);
      }

      if (!IORegistryEntryGetParentEntry(parent[1], "IOService", parent))
      {
        do
        {
          uint64_t v7 = IOReportCopyChannelsForDriver(parent[0], 2LL, 0LL);
          if (v7)
          {
            unsigned int v8 = (const void *)v7;
            CFRelease(v8);
          }

          IOObjectRelease(parent[1]);
          parent[1] = parent[0];
        }

        while (!IORegistryEntryGetParentEntry(parent[0], "IOService", parent));
      }

      IOObjectRelease(parent[1]);
    }

    id v9 = IOServiceMatching("apcie");
    io_service_t MatchingService = IOServiceGetMatchingService(0, v9);
    parent[1] = MatchingService;
    if (MatchingService)
    {
      while (!IORegistryEntryGetChildEntry(MatchingService, "IOService", parent))
      {
        IOObjectRelease(parent[1]);
        io_service_t MatchingService = parent[0];
        parent[1] = parent[0];
        if (!parent[0]) {
          goto LABEL_30;
        }
      }

      if (parent[1])
      {
        uint64_t v11 = IOReportCopyChannelsForDriver(parent[1], 2LL, 0LL);
        if (v11)
        {
          uint64_t v12 = (const void *)v11;
          CFRelease(v12);
        }

        if (!IORegistryEntryGetParentEntry(parent[1], "IOService", parent))
        {
          do
          {
            uint64_t v13 = IOReportCopyChannelsForDriver(parent[0], 2LL, 0LL);
            if (v13)
            {
              uint64_t v14 = (const void *)v13;
              CFRelease(v14);
            }

            IOObjectRelease(parent[1]);
            parent[1] = parent[0];
          }

          while (!IORegistryEntryGetParentEntry(parent[0], "IOService", parent));
        }

        IOObjectRelease(parent[1]);
      }
    }

- (id)__collectWiFiStatsPre:(id)a3
{
  id v5 = objc_alloc_init(&OBJC_CLASS___W5LogItemReceipt);
  [v5 setRequest:a3];
  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v5, "setStartedAt:");
  -[W5LogManager __teardownWiFiStats](self, "__teardownWiFiStats");
  -[W5LogManager __setupWiFiStats](self, "__setupWiFiStats");
  -[W5LogManager __startWiFiStats](self, "__startWiFiStats");
  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v5, "setCompletedAt:");
  return v5;
}

- (id)__collectWiFiStatsPost:(id)a3
{
  id v5 = objc_alloc_init(&OBJC_CLASS___W5LogItemReceipt);
  [v5 setRequest:a3];
  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v5, "setStartedAt:");
  id v6 = objc_msgSend(objc_msgSend(a3, "configuration"), "objectForKeyedSubscript:", @"OutputDirectory");
  unsigned int v7 = objc_msgSend( objc_msgSend(objc_msgSend(a3, "configuration"), "objectForKeyedSubscript:", @"Compress"),  "BOOLValue");
  -[W5LogManager __endWiFiStats](self, "__endWiFiStats");
  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v5, "setCompletedAt:");
  v12[0] = @"MachBegin";
  v13[0] = +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  self->_ioReportBaseMachAbsoluteTime);
  v12[1] = @"MachEnd";
  v13[1] = +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  self->_ioReportDeltaMachAbsoluteTime);
  void v12[2] = @"Duration";
  v13[2] = +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  self->_ioReportDeltaMachAbsoluteTime - self->_ioReportBaseMachAbsoluteTime);
  -[__CFDictionary setObject:forKey:]( self->_ioReportDelta,  "setObject:forKey:",  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v13,  v12,  3LL),  @"DebugInfo");
  id v8 = objc_msgSend(objc_msgSend(v6, "path"), "stringByAppendingPathComponent:", @"wifi_stats.xml");
  if (-[NSFileManager createFileAtPath:contents:attributes:]( +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"),  "createFileAtPath:contents:attributes:",  v8,  +[NSPropertyListSerialization dataWithPropertyList:format:options:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "dataWithPropertyList:format:options:error:",  self->_ioReportDelta,  100LL,  0LL,  0LL),  0LL))
  {
    if (v7)
    {
      if (sub_10008C94C( +[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v8),  [v6 URLByAppendingPathComponent:@"wifi_stats.xml.tgz"],  0))
      {
        uint64_t v11 = +[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", @"wifi_stats.xml.tgz");
        objc_msgSend( v5,  "setRelativeURLs:",  +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v11, 1));
        -[NSFileManager removeItemAtPath:error:]( +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"),  "removeItemAtPath:error:",  v8,  0LL);
      }
    }

    else
    {
      uint64_t v10 = +[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", @"wifi_stats.xml");
      objc_msgSend( v5,  "setRelativeURLs:",  +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v10, 1));
    }
  }

  -[W5LogManager __teardownWiFiStats](self, "__teardownWiFiStats");
  return v5;
}

- (id)__collectWiFiStatsCLI:(id)a3
{
  id v4 = objc_alloc_init(&OBJC_CLASS___W5LogItemReceipt);
  [v4 setRequest:a3];
  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v4, "setStartedAt:");
  id v5 = objc_msgSend(objc_msgSend(a3, "configuration"), "objectForKeyedSubscript:", @"OutputDirectory");
  id v6 = (__CFString *)objc_msgSend( objc_msgSend(a3, "configuration"),  "objectForKeyedSubscript:",  @"FileNameOverride");
  unsigned int v7 = objc_msgSend( objc_msgSend(objc_msgSend(a3, "configuration"), "objectForKeyedSubscript:", @"Compress"),  "BOOLValue");
  id v8 = [v5 path];
  if (!v6) {
    id v6 = @"wifistats.xml";
  }
  id v9 = [v8 stringByAppendingPathComponent:v6];
  if (v9)
  {
    id v10 = v9;
    v16[0] = @"-p";
    v16[1] = v9;
    if (+[NSTask runTaskWithLaunchPath:arguments:error:]( &OBJC_CLASS___NSTask,  "runTaskWithLaunchPath:arguments:error:",  @"/usr/local/bin/wifistats",  +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v16, 2LL),  0LL))
    {
      if (!v7)
      {
        uint64_t v14 = +[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", v6);
        uint64_t v12 = &v14;
        goto LABEL_9;
      }

      id v11 = -[__CFString stringByAppendingPathExtension:](v6, "stringByAppendingPathExtension:", @"tgz");
      if (sub_10008C94C( +[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v10),  [v5 URLByAppendingPathComponent:v11],  0))
      {
        -[NSFileManager removeItemAtPath:error:]( +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"),  "removeItemAtPath:error:",  v10,  0LL);
        uint64_t v15 = +[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", v11);
        uint64_t v12 = &v15;
LABEL_9:
        objc_msgSend( v4,  "setRelativeURLs:",  +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v12, 1));
      }
    }
  }

  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v4, "setCompletedAt:");
  return v4;
}

- (id)__collectPreviouslyCollected:(id)a3
{
  id v4 = objc_alloc_init(&OBJC_CLASS___W5LogItemReceipt);
  [v4 setRequest:a3];
  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v4, "setStartedAt:");
  id v5 = objc_msgSend(objc_msgSend(a3, "configuration"), "objectForKeyedSubscript:", @"OutputDirectory");
  id v6 = objc_msgSend(objc_msgSend(a3, "configuration"), "objectForKeyedSubscript:", @"MaxAge");
  if (v6)
  {
    [v6 doubleValue];
    double v8 = v7;
  }

  else
  {
    double v8 = 1.79769313e308;
  }

  id v9 = objc_msgSend(objc_msgSend(a3, "configuration"), "objectForKeyedSubscript:", @"MaxCount");
  if (v9) {
    uint64_t v10 = (uint64_t)[v9 unsignedIntegerValue];
  }
  else {
    uint64_t v10 = -1LL;
  }
  id v11 = objc_msgSend(objc_msgSend(a3, "configuration"), "objectForKeyedSubscript:", @"MaxSize");
  if (v11) {
    uint64_t v12 = (uint64_t)[v11 unsignedIntegerValue];
  }
  else {
    uint64_t v12 = -1LL;
  }
  unsigned __int8 v13 = objc_msgSend( objc_msgSend( objc_msgSend(a3, "configuration"),  "objectForKeyedSubscript:",  @"Compress"),  "BOOLValue");
  uint64_t v14 = (NSRegularExpression *)objc_msgSend( objc_msgSend(a3, "configuration"),  "objectForKeyedSubscript:",  @"IncludeMatching");
  uint64_t v15 = (NSRegularExpression *)objc_msgSend( objc_msgSend(a3, "configuration"),  "objectForKeyedSubscript:",  @"ExcludeMatching");
  id v16 = +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array");
  -[NSFileManager createDirectoryAtPath:withIntermediateDirectories:attributes:error:]( +[NSFileManager defaultManager](NSFileManager, "defaultManager"),  "createDirectoryAtPath:withIntermediateDirectories:attributes:error:",  objc_msgSend(objc_msgSend(v5, "path"), "stringByAppendingPathComponent:", @"Previous"),  0,  0,  0);
  if (v14) {
    uint64_t v14 = +[NSRegularExpression regularExpressionWithPattern:options:error:]( &OBJC_CLASS___NSRegularExpression,  "regularExpressionWithPattern:options:error:",  v14,  0LL,  0LL);
  }
  if (v15) {
    uint64_t v15 = +[NSRegularExpression regularExpressionWithPattern:options:error:]( &OBJC_CLASS___NSRegularExpression,  "regularExpressionWithPattern:options:error:",  v15,  0LL,  0LL);
  }
  CFStringRef v20 = -[NSURL path]( -[NSURL URLByAppendingPathComponent:]( -[NSFileManager containerURLForSecurityApplicationGroupIdentifier:]( +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"),  "containerURLForSecurityApplicationGroupIdentifier:",  @"group.com.apple.wifi.logs"),  "URLByAppendingPathComponent:",  @"previous"),  "path");
  LOBYTE(v18) = v13;
  if (objc_msgSend( -[W5LogManager __collectFilesInDirectories:include:exclude:maxAge:maxCount:maxSize:outputDirectory:compress:remainingSize:contentFilter:]( self,  "__collectFilesInDirectories:include:exclude:maxAge:maxCount:maxSize:outputDirectory:compress:remainingSize:contentFilter:",  +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v20, 1),  v14,  v15,  v10,  v12,  objc_msgSend(v5, "URLByAppendingPathComponent:", @"Previous"),  v8,  v18,  0,  0),  "count"))
  {
    objc_msgSend( v16,  "addObject:",  +[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", @"Previous"));
  }

  else
  {
    -[NSFileManager removeItemAtPath:error:]( +[NSFileManager defaultManager](NSFileManager, "defaultManager"),  "removeItemAtPath:error:",  objc_msgSend(objc_msgSend(v5, "path"), "stringByAppendingPathComponent:", @"Previous"),  0);
  }

  [v4 setRelativeURLs:v16];
  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v4, "setCompletedAt:");
  return v4;
}

- (id)__collectWiFiMemoryUsage:(id)a3
{
  id v4 = objc_alloc_init(&OBJC_CLASS___W5LogItemReceipt);
  [v4 setRequest:a3];
  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v4, "setStartedAt:");
  id v5 = objc_msgSend(objc_msgSend(a3, "configuration"), "objectForKeyedSubscript:", @"OutputDirectory");
  id v6 = +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array");
  if (+[NSTask runTaskWithLaunchPath:arguments:outputFilePath:error:]( NSTask,  "runTaskWithLaunchPath:arguments:outputFilePath:error:",  @"/usr/bin/footprint",  &off_1000E3E58,  objc_msgSend(objc_msgSend(v5, "path"), "stringByAppendingPathComponent:", @"footprint_wifid.txt"),  0))
  {
    objc_msgSend( v6,  "addObject:",  +[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", @"footprint_wifid.txt"));
  }

  if (+[NSTask runTaskWithLaunchPath:arguments:outputFilePath:error:]( NSTask,  "runTaskWithLaunchPath:arguments:outputFilePath:error:",  @"/usr/bin/vmmap",  &off_1000E3E70,  objc_msgSend(objc_msgSend(v5, "path"), "stringByAppendingPathComponent:", @"vmmap_wifid.txt"),  0))
  {
    objc_msgSend( v6,  "addObject:",  +[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", @"vmmap_wifid.txt"));
  }

  if (+[NSTask runTaskWithLaunchPath:arguments:outputFilePath:error:]( NSTask,  "runTaskWithLaunchPath:arguments:outputFilePath:error:",  @"/usr/bin/heap",  &off_1000E3E88,  objc_msgSend(objc_msgSend(v5, "path"), "stringByAppendingPathComponent:", @"heap_wifid.txt"),  0))
  {
    objc_msgSend( v6,  "addObject:",  +[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", @"heap_wifid.txt"));
  }

  if (+[NSTask runTaskWithLaunchPath:arguments:timeout:outputFilePath:errorFilePath:redirectErrorToOutput:launchHandler:didLaunch:error:]( NSTask,  "runTaskWithLaunchPath:arguments:timeout:outputFilePath:errorFilePath:redirectErrorToOutput:launchHandler:didLaunch:error:",  @"/usr/local/bin/easyperf",  &off_1000E3EA0,  0,  objc_msgSend(objc_msgSend(v5, "path"), "stringByAppendingPathComponent:", @"easyperf_wifid.txt"),  0,  0,  10.0,  0,  0))
  {
    objc_msgSend( v6,  "addObject:",  +[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", @"easyperf_wifid.txt"));
  }

  if (+[NSTask runTaskWithLaunchPath:arguments:outputFilePath:error:]( NSTask,  "runTaskWithLaunchPath:arguments:outputFilePath:error:",  @"/usr/bin/footprint",  &off_1000E3EB8,  objc_msgSend(objc_msgSend(v5, "path"), "stringByAppendingPathComponent:", @"footprint_dext.txt"),  0))
  {
    objc_msgSend( v6,  "addObject:",  +[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", @"footprint_dext.txt"));
  }

  if (+[NSTask runTaskWithLaunchPath:arguments:outputFilePath:error:]( NSTask,  "runTaskWithLaunchPath:arguments:outputFilePath:error:",  @"/usr/bin/vmmap",  &off_1000E3ED0,  objc_msgSend(objc_msgSend(v5, "path"), "stringByAppendingPathComponent:", @"vmmap_dext.txt"),  0))
  {
    objc_msgSend( v6,  "addObject:",  +[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", @"vmmap_dext.txt"));
  }

  if (+[NSTask runTaskWithLaunchPath:arguments:outputFilePath:error:]( NSTask,  "runTaskWithLaunchPath:arguments:outputFilePath:error:",  @"/usr/bin/heap",  &off_1000E3EE8,  objc_msgSend(objc_msgSend(v5, "path"), "stringByAppendingPathComponent:", @"heap_dext.txt"),  0))
  {
    objc_msgSend( v6,  "addObject:",  +[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", @"heap_dext.txt"));
  }

  if (+[NSTask runTaskWithLaunchPath:arguments:timeout:outputFilePath:errorFilePath:redirectErrorToOutput:launchHandler:didLaunch:error:]( NSTask,  "runTaskWithLaunchPath:arguments:timeout:outputFilePath:errorFilePath:redirectErrorToOutput:launchHandler:didLaunch:error:",  @"/usr/local/bin/easyperf",  &off_1000E3F00,  0,  objc_msgSend(objc_msgSend(v5, "path"), "stringByAppendingPathComponent:", @"easyperf_dext.txt"),  0,  0,  10.0,  0,  0))
  {
    objc_msgSend( v6,  "addObject:",  +[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", @"easyperf_dext.txt"));
  }

  if (+[NSTask runTaskWithLaunchPath:arguments:outputFilePath:error:]( NSTask,  "runTaskWithLaunchPath:arguments:outputFilePath:error:",  @"/usr/bin/zprint",  0,  objc_msgSend(objc_msgSend(v5, "path"), "stringByAppendingPathComponent:", @"zprint.txt"),  0))
  {
    objc_msgSend( v6,  "addObject:",  +[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", @"zprint.txt"));
  }

  if (+[NSTask runTaskWithLaunchPath:arguments:outputFilePath:error:]( NSTask,  "runTaskWithLaunchPath:arguments:outputFilePath:error:",  @"/usr/local/bin/jetsam_priority",  &off_1000E3F18,  objc_msgSend(objc_msgSend(v5, "path"), "stringByAppendingPathComponent:", @"jetsam_priority.txt"),  0))
  {
    objc_msgSend( v6,  "addObject:",  +[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", @"jetsam_priority.txt"));
  }

  [v4 setRelativeURLs:v6];
  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v4, "setCompletedAt:");
  return v4;
}

- (id)__collectWiFiDeviceConfig:(id)a3
{
  id v5 = objc_alloc_init(&OBJC_CLASS___W5LogItemReceipt);
  [v5 setRequest:a3];
  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v5, "setStartedAt:");
  id v6 = objc_msgSend(objc_msgSend(a3, "configuration"), "objectForKeyedSubscript:", @"OutputDirectory");
  double v7 = -[W5WiFiInterface interfaceName](-[W5StatusManager wifi](self->_status, "wifi"), "interfaceName");
  id v8 = objc_msgSend(objc_msgSend(v6, "path"), "stringByAppendingPathComponent:", @"wifi_internal.txt");
  -[NSFileManager removeItemAtPath:error:]( +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"),  "removeItemAtPath:error:",  v8,  0LL);
  -[NSFileManager createFileAtPath:contents:attributes:]( +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"),  "createFileAtPath:contents:attributes:",  v8,  0LL,  0LL);
  id v9 = +[NSFileHandle fileHandleForUpdatingAtPath:](&OBJC_CLASS___NSFileHandle, "fileHandleForUpdatingAtPath:", v8);
  if (v9)
  {
    uint64_t v10 = v9;
    id v11 = +[NSMutableData dataWithCapacity:](&OBJC_CLASS___NSMutableData, "dataWithCapacity:", 0LL);
    v36[0] = v7;
    v36[1] = @"-cardcap";
    +[NSTask runTaskWithLaunchPath:arguments:outputData:error:]( &OBJC_CLASS___NSTask,  "runTaskWithLaunchPath:arguments:outputData:error:",  @"/usr/local/bin/apple80211",  +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v36, 2LL),  v11,  0LL);
    uint64_t v12 = -[NSString componentsSeparatedByString:]( -[NSString initWithData:encoding:](objc_alloc(&OBJC_CLASS___NSString), "initWithData:encoding:", v11, 4LL),  "componentsSeparatedByString:",  @"\n");
    -[NSMutableData setLength:](v11, "setLength:", 0LL);
    -[W5LogManager __wlCLIWithArguments:outputFilePath:outputData:]( self,  "__wlCLIWithArguments:outputFilePath:outputData:",  &off_1000E3F30,  0LL,  v11);
    unsigned __int8 v13 = -[NSString componentsSeparatedByString:]( -[NSString initWithData:encoding:](objc_alloc(&OBJC_CLASS___NSString), "initWithData:encoding:", v11, 4LL),  "componentsSeparatedByString:",  @" ");
    if (v7)
    {
      uint64_t v14 = v13;
      v35[0] = v7;
      v35[1] = @"-driver_ver";
      -[W5LogManager __runToolWithOutputFileHandle:launchPath:arguments:]( self,  "__runToolWithOutputFileHandle:launchPath:arguments:",  v10,  @"/usr/local/bin/apple80211",  +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v35, 2LL));
      v34[0] = v7;
      v34[1] = @"-hardware_ver";
      -[W5LogManager __runToolWithOutputFileHandle:launchPath:arguments:]( self,  "__runToolWithOutputFileHandle:launchPath:arguments:",  v10,  @"/usr/local/bin/apple80211",  +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v34, 2LL));
      v33[0] = v7;
      v33[1] = @"-ssid";
      -[W5LogManager __runToolWithOutputFileHandle:launchPath:arguments:]( self,  "__runToolWithOutputFileHandle:launchPath:arguments:",  v10,  @"/usr/local/bin/apple80211",  +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v33, 2LL));
      v32[0] = v7;
      v32[1] = @"-bssid";
      -[W5LogManager __runToolWithOutputFileHandle:launchPath:arguments:]( self,  "__runToolWithOutputFileHandle:launchPath:arguments:",  v10,  @"/usr/local/bin/apple80211",  +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v32, 2LL));
      v31[0] = v7;
      v31[1] = @"-rssi";
      -[W5LogManager __runToolWithOutputFileHandle:launchPath:arguments:]( self,  "__runToolWithOutputFileHandle:launchPath:arguments:",  v10,  @"/usr/local/bin/apple80211",  +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v31, 2LL));
      v30[0] = v7;
      v30[1] = @"-noise";
      -[W5LogManager __runToolWithOutputFileHandle:launchPath:arguments:]( self,  "__runToolWithOutputFileHandle:launchPath:arguments:",  v10,  @"/usr/local/bin/apple80211",  +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v30, 2LL));
      v29[0] = v7;
      v29[1] = @"-channel";
      -[W5LogManager __runToolWithOutputFileHandle:launchPath:arguments:]( self,  "__runToolWithOutputFileHandle:launchPath:arguments:",  v10,  @"/usr/local/bin/apple80211",  +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v29, 2LL));
      v28[0] = v7;
      v28[1] = @"-authtype";
      -[W5LogManager __runToolWithOutputFileHandle:launchPath:arguments:]( self,  "__runToolWithOutputFileHandle:launchPath:arguments:",  v10,  @"/usr/local/bin/apple80211",  +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v28, 2LL));
      v27[0] = v7;
      v27[1] = @"-country_code";
      -[W5LogManager __runToolWithOutputFileHandle:launchPath:arguments:]( self,  "__runToolWithOutputFileHandle:launchPath:arguments:",  v10,  @"/usr/local/bin/apple80211",  +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v27, 2LL));
      v26[0] = v7;
      v26[1] = @"-rateset";
      -[W5LogManager __runToolWithOutputFileHandle:launchPath:arguments:]( self,  "__runToolWithOutputFileHandle:launchPath:arguments:",  v10,  @"/usr/local/bin/apple80211",  +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v26, 2LL));
      v25[0] = v7;
      v25[1] = @"-leaky_ap_stats_mode";
      -[W5LogManager __runToolWithOutputFileHandle:launchPath:arguments:]( self,  "__runToolWithOutputFileHandle:launchPath:arguments:",  v10,  @"/usr/local/bin/apple80211",  +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v25, 2LL));
      v24[0] = v7;
      v24[1] = @"-cardcap";
      -[W5LogManager __runToolWithOutputFileHandle:launchPath:arguments:]( self,  "__runToolWithOutputFileHandle:launchPath:arguments:",  v10,  @"/usr/local/bin/apple80211",  +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v24, 2LL));
      v23[0] = v7;
      v23[1] = @"-dbg=mimopsstatus";
      -[W5LogManager __runToolWithOutputFileHandle:launchPath:arguments:]( self,  "__runToolWithOutputFileHandle:launchPath:arguments:",  v10,  @"/usr/local/bin/apple80211",  +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v23, 2LL));
      if (-[NSArray containsObject:](v12, "containsObject:", @"roam"))
      {
        v22[0] = v7;
        v22[1] = @"-dbg=print-roam";
        -[W5LogManager __runToolWithOutputFileHandle:launchPath:arguments:]( self,  "__runToolWithOutputFileHandle:launchPath:arguments:",  v10,  @"/usr/local/bin/apple80211",  +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v22, 2LL));
      }

      if (-[NSArray containsObject:](v12, "containsObject:", @"ocl"))
      {
        v21[0] = v7;
        v21[1] = @"-dbg=ocl_status";
        -[W5LogManager __runToolWithOutputFileHandle:launchPath:arguments:]( self,  "__runToolWithOutputFileHandle:launchPath:arguments:",  v10,  @"/usr/local/bin/apple80211",  +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v21, 2LL));
        v20[0] = v7;
        v20[1] = @"-dbg=ocl_rssi_threshold";
        -[W5LogManager __runToolWithOutputFileHandle:launchPath:arguments:]( self,  "__runToolWithOutputFileHandle:launchPath:arguments:",  v10,  @"/usr/local/bin/apple80211",  +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v20, 2LL));
      }

      if (-[NSArray containsObject:](v12, "containsObject:", @"awdl")) {
        -[W5LogManager __runToolWithOutputFileHandle:launchPath:arguments:]( self,  "__runToolWithOutputFileHandle:launchPath:arguments:",  v10,  @"/usr/local/bin/apple80211",  &off_1000E3F48);
      }
      if (-[NSArray containsObject:](v12, "containsObject:", @"timesync")) {
        -[W5LogManager __runToolWithOutputFileHandle:launchPath:arguments:]( self,  "__runToolWithOutputFileHandle:launchPath:arguments:",  v10,  @"/usr/local/bin/apple80211",  &off_1000E3F60);
      }
      v19[0] = v7;
      v19[1] = @"-dbg=bgscan-private-mac";
      -[W5LogManager __runToolWithOutputFileHandle:launchPath:arguments:]( self,  "__runToolWithOutputFileHandle:launchPath:arguments:",  v10,  @"/usr/local/bin/apple80211",  +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v19, 2LL));
      v18[0] = v7;
      v18[1] = @"-dbg=dtim";
      -[W5LogManager __runToolWithOutputFileHandle:launchPath:arguments:]( self,  "__runToolWithOutputFileHandle:launchPath:arguments:",  v10,  @"/usr/local/bin/apple80211",  +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v18, 2LL));
      v17[0] = v7;
      v17[1] = @"-dbg=private-mac";
      -[W5LogManager __runToolWithOutputFileHandle:launchPath:arguments:]( self,  "__runToolWithOutputFileHandle:launchPath:arguments:",  v10,  @"/usr/local/bin/apple80211",  +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v17, 2LL));
      -[W5LogManager __wlCLIWithArguments:outputFileHandle:]( self,  "__wlCLIWithArguments:outputFileHandle:",  &off_1000E3F78,  v10);
      -[W5LogManager __wlCLIWithArguments:outputFileHandle:]( self,  "__wlCLIWithArguments:outputFileHandle:",  &off_1000E3F90,  v10);
      -[W5LogManager __wlCLIWithArguments:outputFileHandle:]( self,  "__wlCLIWithArguments:outputFileHandle:",  &off_1000E3FA8,  v10);
      -[W5LogManager __wlCLIWithArguments:outputFileHandle:]( self,  "__wlCLIWithArguments:outputFileHandle:",  &off_1000E3FC0,  v10);
      -[W5LogManager __wlCLIWithArguments:outputFileHandle:]( self,  "__wlCLIWithArguments:outputFileHandle:",  &off_1000E3FD8,  v10);
      -[W5LogManager __wlCLIWithArguments:outputFileHandle:]( self,  "__wlCLIWithArguments:outputFileHandle:",  &off_1000E3FF0,  v10);
      -[W5LogManager __wlCLIWithArguments:outputFileHandle:]( self,  "__wlCLIWithArguments:outputFileHandle:",  &off_1000E4008,  v10);
      -[W5LogManager __wlCLIWithArguments:outputFileHandle:]( self,  "__wlCLIWithArguments:outputFileHandle:",  &off_1000E4020,  v10);
      -[W5LogManager __wlCLIWithArguments:outputFileHandle:]( self,  "__wlCLIWithArguments:outputFileHandle:",  &off_1000E4038,  v10);
      -[W5LogManager __wlCLIWithArguments:outputFileHandle:]( self,  "__wlCLIWithArguments:outputFileHandle:",  &off_1000E4050,  v10);
      -[W5LogManager __wlCLIWithArguments:outputFileHandle:]( self,  "__wlCLIWithArguments:outputFileHandle:",  &off_1000E4068,  v10);
      -[W5LogManager __wlCLIWithArguments:outputFileHandle:]( self,  "__wlCLIWithArguments:outputFileHandle:",  &off_1000E4080,  v10);
      -[W5LogManager __wlCLIWithArguments:outputFileHandle:]( self,  "__wlCLIWithArguments:outputFileHandle:",  &off_1000E4098,  v10);
      -[W5LogManager __wlCLIWithArguments:outputFileHandle:]( self,  "__wlCLIWithArguments:outputFileHandle:",  &off_1000E40B0,  v10);
      -[W5LogManager __wlCLIWithArguments:outputFileHandle:]( self,  "__wlCLIWithArguments:outputFileHandle:",  &off_1000E40C8,  v10);
      -[W5LogManager __wlCLIWithArguments:outputFileHandle:]( self,  "__wlCLIWithArguments:outputFileHandle:",  &off_1000E40E0,  v10);
      -[W5LogManager __wlCLIWithArguments:outputFileHandle:]( self,  "__wlCLIWithArguments:outputFileHandle:",  &off_1000E40F8,  v10);
      -[W5LogManager __wlCLIWithArguments:outputFileHandle:]( self,  "__wlCLIWithArguments:outputFileHandle:",  &off_1000E4110,  v10);
      -[W5LogManager __wlCLIWithArguments:outputFileHandle:]( self,  "__wlCLIWithArguments:outputFileHandle:",  &off_1000E4128,  v10);
      -[W5LogManager __wlCLIWithArguments:outputFileHandle:]( self,  "__wlCLIWithArguments:outputFileHandle:",  &off_1000E4140,  v10);
      -[W5LogManager __wlCLIWithArguments:outputFileHandle:]( self,  "__wlCLIWithArguments:outputFileHandle:",  &off_1000E4158,  v10);
      -[W5LogManager __wlCLIWithArguments:outputFileHandle:]( self,  "__wlCLIWithArguments:outputFileHandle:",  &off_1000E4170,  v10);
      if (-[NSArray containsObject:](v14, "containsObject:", @"ampdu")) {
        -[W5LogManager __wlCLIWithArguments:outputFileHandle:]( self,  "__wlCLIWithArguments:outputFileHandle:",  &off_1000E4188,  v10);
      }
      if (-[NSArray containsObject:](v14, "containsObject:", @"amsdu")) {
        -[W5LogManager __wlCLIWithArguments:outputFileHandle:]( self,  "__wlCLIWithArguments:outputFileHandle:",  &off_1000E41A0,  v10);
      }
      if (-[NSArray containsObject:](v14, "containsObject:", @"ocl"))
      {
        -[W5LogManager __wlCLIWithArguments:outputFileHandle:]( self,  "__wlCLIWithArguments:outputFileHandle:",  &off_1000E41B8,  v10);
        -[W5LogManager __wlCLIWithArguments:outputFileHandle:]( self,  "__wlCLIWithArguments:outputFileHandle:",  &off_1000E41D0,  v10);
      }

      if (-[NSArray containsObject:](v14, "containsObject:", @"txcap")) {
        -[W5LogManager __wlCLIWithArguments:outputFileHandle:]( self,  "__wlCLIWithArguments:outputFileHandle:",  &off_1000E41E8,  v10);
      }
      if (-[NSArray containsObject:](v14, "containsObject:", @"mim_ps"))
      {
        -[W5LogManager __wlCLIWithArguments:outputFileHandle:]( self,  "__wlCLIWithArguments:outputFileHandle:",  &off_1000E4200,  v10);
        -[W5LogManager __wlCLIWithArguments:outputFileHandle:]( self,  "__wlCLIWithArguments:outputFileHandle:",  &off_1000E4218,  v10);
      }

      if (-[NSArray containsObject:](v14, "containsObject:", @"ops"))
      {
        -[W5LogManager __wlCLIWithArguments:outputFileHandle:]( self,  "__wlCLIWithArguments:outputFileHandle:",  &off_1000E4230,  v10);
        -[W5LogManager __wlCLIWithArguments:outputFileHandle:]( self,  "__wlCLIWithArguments:outputFileHandle:",  &off_1000E4248,  v10);
        -[W5LogManager __wlCLIWithArguments:outputFileHandle:]( self,  "__wlCLIWithArguments:outputFileHandle:",  &off_1000E4260,  v10);
      }

      if (-[NSArray containsObject:](v14, "containsObject:", @"nap"))
      {
        -[W5LogManager __wlCLIWithArguments:outputFileHandle:]( self,  "__wlCLIWithArguments:outputFileHandle:",  &off_1000E4278,  v10);
        -[W5LogManager __wlCLIWithArguments:outputFileHandle:]( self,  "__wlCLIWithArguments:outputFileHandle:",  &off_1000E4290,  v10);
        -[W5LogManager __wlCLIWithArguments:outputFileHandle:]( self,  "__wlCLIWithArguments:outputFileHandle:",  &off_1000E42A8,  v10);
      }

      if (-[NSArray containsObject:](v14, "containsObject:", @"bcntrim"))
      {
        -[W5LogManager __wlCLIWithArguments:outputFileHandle:]( self,  "__wlCLIWithArguments:outputFileHandle:",  &off_1000E42C0,  v10);
        -[W5LogManager __wlCLIWithArguments:outputFileHandle:]( self,  "__wlCLIWithArguments:outputFileHandle:",  &off_1000E42D8,  v10);
        -[W5LogManager __wlCLIWithArguments:outputFileHandle:]( self,  "__wlCLIWithArguments:outputFileHandle:",  &off_1000E42F0,  v10);
      }

      if (-[NSArray containsObject:](v14, "containsObject:", @"rsdb"))
      {
        -[W5LogManager __wlCLIWithArguments:outputFileHandle:]( self,  "__wlCLIWithArguments:outputFileHandle:",  &off_1000E4308,  v10);
        -[W5LogManager __wlCLIWithArguments:outputFileHandle:]( self,  "__wlCLIWithArguments:outputFileHandle:",  &off_1000E4320,  v10);
        -[W5LogManager __wlCLIWithArguments:outputFileHandle:]( self,  "__wlCLIWithArguments:outputFileHandle:",  &off_1000E4338,  v10);
        -[W5LogManager __wlCLIWithArguments:outputFileHandle:]( self,  "__wlCLIWithArguments:outputFileHandle:",  &off_1000E4350,  v10);
        -[W5LogManager __wlCLIWithArguments:outputFileHandle:]( self,  "__wlCLIWithArguments:outputFileHandle:",  &off_1000E4368,  v10);
        if (-[NSArray containsObject:](v14, "containsObject:", @"tdmtx"))
        {
          -[W5LogManager __wlCLIWithArguments:outputFileHandle:]( self,  "__wlCLIWithArguments:outputFileHandle:",  &off_1000E4380,  v10);
          -[W5LogManager __wlCLIWithArguments:outputFileHandle:]( self,  "__wlCLIWithArguments:outputFileHandle:",  &off_1000E4398,  v10);
        }
      }

      if (-[NSArray containsObject:](v14, "containsObject:", @"tvpm"))
      {
        -[W5LogManager __wlCLIWithArguments:outputFileHandle:]( self,  "__wlCLIWithArguments:outputFileHandle:",  &off_1000E43B0,  v10);
        -[W5LogManager __wlCLIWithArguments:outputFileHandle:]( self,  "__wlCLIWithArguments:outputFileHandle:",  &off_1000E43C8,  v10);
        -[W5LogManager __wlCLIWithArguments:outputFileHandle:]( self,  "__wlCLIWithArguments:outputFileHandle:",  &off_1000E43E0,  v10);
      }

      -[W5LogManager __wlCLIWithArguments:outputFileHandle:]( self,  "__wlCLIWithArguments:outputFileHandle:",  &off_1000E43F8,  v10);
      -[W5LogManager __wlCLIWithArguments:outputFileHandle:]( self,  "__wlCLIWithArguments:outputFileHandle:",  &off_1000E4410,  v10);
    }

    -[NSFileHandle closeFile](v10, "closeFile");
    id v16 = +[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", @"wifi_internal.txt");
    objc_msgSend( v5,  "setRelativeURLs:",  +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v16, 1));
  }

  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v5, "setCompletedAt:");
  return v5;
}

- (id)__collectWiFiPerfLogs:(id)a3
{
  id v5 = objc_alloc_init(&OBJC_CLASS___W5LogItemReceipt);
  [v5 setRequest:a3];
  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v5, "setStartedAt:");
  id v6 = objc_msgSend(objc_msgSend(a3, "configuration"), "objectForKeyedSubscript:", @"OutputDirectory");
  unsigned __int8 v7 = objc_msgSend( objc_msgSend(objc_msgSend(a3, "configuration"), "objectForKeyedSubscript:", @"Compress"),  "BOOLValue");
  id v8 = objc_msgSend(objc_msgSend(a3, "configuration"), "objectForKeyedSubscript:", @"UUID");
  if (v8)
  {
    id v15 = [@"/var/run/com.apple.wifivelocity/wifiperf" stringByAppendingPathComponent:v8];
    id v9 = &v15;
  }

  else
  {
    id v10 = -[W5LogManager __mostRecentInDirectories:matchingPrefix:matchingSuffix:excludingPrefix:excludingSuffix:maxAge:]( self,  "__mostRecentInDirectories:matchingPrefix:matchingSuffix:excludingPrefix:excludingSuffix:maxAge:",  &off_1000E4428,  0LL,  0LL,  0LL,  0LL,  1.79769313e308);
    if (![v10 count]) {
      goto LABEL_7;
    }
    id v14 = [v10 firstObject];
    id v9 = &v14;
  }

  LOBYTE(v13) = v7;
  id v11 = -[W5LogManager __collectFilesInDirectories:include:exclude:maxAge:maxCount:maxSize:outputDirectory:compress:remainingSize:contentFilter:]( self,  "__collectFilesInDirectories:include:exclude:maxAge:maxCount:maxSize:outputDirectory:compress:remainingSize:contentFilter:",  +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v9, 1LL),  0LL,  0LL,  -1LL,  -1LL,  v6,  1.79769313e308,  v13,  0LL,  0LL);
  if (v11) {
    [v5 setRelativeURLs:v11];
  }
LABEL_7:
  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate", v11);
  objc_msgSend(v5, "setCompletedAt:");
  return v5;
}

- (id)__collect3barsCache:(id)a3
{
  id v5 = objc_alloc_init(&OBJC_CLASS___W5LogItemReceipt);
  [v5 setRequest:a3];
  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v5, "setStartedAt:");
  id v6 = objc_msgSend( objc_msgSend( objc_msgSend(objc_msgSend(a3, "configuration"), "objectForKeyedSubscript:", @"OutputDirectory"),  "path"),  "stringByAppendingPathComponent:",  @"3bars.txt");
  -[NSFileManager removeItemAtPath:error:]( +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"),  "removeItemAtPath:error:",  v6,  0LL);
  -[NSFileManager createFileAtPath:contents:attributes:]( +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"),  "createFileAtPath:contents:attributes:",  v6,  0LL,  0LL);
  unsigned __int8 v7 = +[NSFileHandle fileHandleForUpdatingAtPath:](&OBJC_CLASS___NSFileHandle, "fileHandleForUpdatingAtPath:", v6);
  if (v7)
  {
    id v8 = v7;
    -[W5LogManager __runToolWithOutputFileHandle:launchPath:arguments:]( self,  "__runToolWithOutputFileHandle:launchPath:arguments:",  v7,  @"/usr/local/bin/3bars",  &off_1000E4440);
    -[NSFileHandle closeFile](v8, "closeFile");
    id v10 = +[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", @"3bars.txt");
    objc_msgSend( v5,  "setRelativeURLs:",  +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v10, 1));
  }

  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v5, "setCompletedAt:");
  return v5;
}

- (id)__collectDeviceAnalyticsStore:(id)a3
{
  id v5 = objc_alloc_init(&OBJC_CLASS___W5LogItemReceipt);
  id v6 = objc_msgSend(objc_msgSend(a3, "configuration"), "objectForKeyedSubscript:", @"OutputDirectory");
  HIDWORD(v23) = objc_msgSend( objc_msgSend( objc_msgSend(a3, "configuration"),  "objectForKeyedSubscript:",  @"Compress"),  "BOOLValue");
  unsigned int v7 = objc_msgSend( objc_msgSend(objc_msgSend(a3, "configuration"), "objectForKeyedSubscript:", @"MaxAge"),  "unsignedIntValue");
  uint64_t v8 = objc_msgSend( objc_msgSend(objc_msgSend(a3, "configuration"), "objectForKeyedSubscript:", @"BatchSize"),  "unsignedIntValue");
  [v5 setRequest:a3];
  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v5, "setStartedAt:");
  id v9 = +[NSMutableString string](&OBJC_CLASS___NSMutableString, "string");
  id v10 = dispatch_semaphore_create(0LL);
  id v11 = (os_log_s *)sub_10008C90C();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v30 = 136316418;
    uint64_t v31 = "-[W5LogManager __collectDeviceAnalyticsStore:]";
    __int16 v32 = 2080;
    id v33 = "W5LogManager.m";
    __int16 v34 = 1024;
    int v35 = 7033;
    __int16 v36 = 2048;
    *(void *)uint64_t v37 = v7;
    *(_WORD *)&v37[8] = 2048;
    *(void *)&v37[10] = v7 / 0x15180uLL;
    __int16 v38 = 2048;
    uint64_t v39 = v8;
    LODWORD(v23) = 58;
    _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v11,  0LL,  "[wifivelocity] %s (%s:%u) maxAge:%lu days:%lu batchSize:%lu",  (const char *)&v30,  v23,  (_DWORD)v24,  v25,  v26,  v27);
  }

  if (-[W5LogManager waDeviceAnalyticsClientExists](self, "waDeviceAnalyticsClientExists"))
  {
    waDeviceAnalyticsClient = self->_waDeviceAnalyticsClient;
    dispatch_time_t v24 = _NSConcreteStackBlock;
    uint64_t v25 = 3221225472LL;
    uint64_t v26 = sub_10006A31C;
    uint64_t v27 = &unk_1000D2E18;
    id v28 = v9;
    uint64_t v29 = v10;
    if (!-[WADeviceAnalyticsClient dumpDeviceAnalyticsUsingBatchSizeToFileWithCompletion:batchSize:maxAge:]( waDeviceAnalyticsClient,  "dumpDeviceAnalyticsUsingBatchSizeToFileWithCompletion:batchSize:maxAge:",  &v24,  v8,  v7 / 0x15180uLL))
    {
LABEL_8:
      int v15 = 0;
      goto LABEL_9;
    }

    dispatch_time_t v13 = dispatch_time(0LL, 60000000000LL);
    if (dispatch_semaphore_wait(v10, v13))
    {
      id v14 = (os_log_s *)sub_10008C90C();
      int v15 = 0;
      if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_9;
      }
      int v30 = 136315650;
      uint64_t v31 = "-[W5LogManager __collectDeviceAnalyticsStore:]";
      __int16 v32 = 2080;
      id v33 = "W5LogManager.m";
      __int16 v34 = 1024;
      int v35 = 7047;
      LODWORD(v23) = 28;
      _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v14,  0LL,  "[wifivelocity] %s (%s:%u) Gave up waiting to get Device Analytics Store Dump. Bailing",  (const char *)&v30,  v23,  (_DWORD)v24);
      goto LABEL_8;
    }

    if (![v9 length])
    {
      int v15 = 1;
LABEL_9:
      id v16 = (os_log_s *)sub_10008C90C();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        id v17 = [v9 length];
        int v30 = 136316162;
        uint64_t v31 = "-[W5LogManager __collectDeviceAnalyticsStore:]";
        __int16 v32 = 2080;
        id v33 = "W5LogManager.m";
        __int16 v34 = 1024;
        int v35 = 7052;
        __int16 v36 = 1024;
        *(_DWORD *)uint64_t v37 = v15;
        *(_WORD *)&v37[4] = 2048;
        *(void *)&void v37[6] = v17;
        LODWORD(v23) = 44;
        _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v16,  0LL,  "[wifivelocity] %s (%s:%u) Success:%d Length:%lu",  &v30,  v23);
      }

      goto LABEL_11;
    }

    if (-[NSFileManager isReadableFileAtPath:]( +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"),  "isReadableFileAtPath:",  v9))
    {
      id v19 = +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array");
      id v20 = objc_msgSend( objc_msgSend(v6, "path"),  "stringByAppendingPathComponent:",  objc_msgSend(v9, "lastPathComponent"));
      -[NSFileManager copyItemAtPath:toPath:error:]( +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"),  "copyItemAtPath:toPath:error:",  v9,  v20,  0LL);
      -[NSFileManager removeItemAtPath:error:]( +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"),  "removeItemAtPath:error:",  v9,  0LL);
      uint64_t v21 = +[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", v20);
      if (HIDWORD(v23))
      {
        uint64_t v21 = -[W5LogManager __collectFileAtURL:outputDirectory:maxAge:maxSize:compress:remainingSize:]( self,  "__collectFileAtURL:outputDirectory:maxAge:maxSize:compress:remainingSize:",  v21,  v6,  0x7FFFFFFFFFFFFFFFLL,  1LL,  0LL,  1.79769313e308);
        -[NSFileManager removeItemAtPath:error:]( +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"),  "removeItemAtPath:error:",  v20,  0LL);
      }

      if (v21)
      {
        [v19 addObject:v21];
        [v5 setRelativeURLs:v19];
      }
    }
  }

  else
  {
    id v22 = (os_log_s *)sub_10008C90C();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      int v30 = 136315906;
      uint64_t v31 = "-[W5LogManager __collectDeviceAnalyticsStore:]";
      __int16 v32 = 2080;
      id v33 = "W5LogManager.m";
      __int16 v34 = 1024;
      int v35 = 7035;
      __int16 v36 = 2080;
      *(void *)uint64_t v37 = "-[W5LogManager __collectDeviceAnalyticsStore:]";
      LODWORD(v23) = 38;
      _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v22,  0LL,  "[wifivelocity] %s (%s:%u) %s [self waDeviceAnalyticsClientExists] == FALSE, skipping",  &v30,  v23);
    }
  }

- (id)__collectDeviceAnalyticsDeploymentGraph:(id)a3
{
  id v5 = objc_alloc_init(&OBJC_CLASS___W5LogItemReceipt);
  id v6 = objc_msgSend(objc_msgSend(a3, "configuration"), "objectForKeyedSubscript:", @"OutputDirectory");
  unsigned int v7 = objc_msgSend( objc_msgSend(objc_msgSend(a3, "configuration"), "objectForKeyedSubscript:", @"Compress"),  "BOOLValue");
  [v5 setRequest:a3];
  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v5, "setStartedAt:");
  id v8 = +[NSMutableString string](&OBJC_CLASS___NSMutableString, "string");
  id v9 = dispatch_semaphore_create(0LL);
  if (-[W5LogManager waDeviceAnalyticsClientExists](self, "waDeviceAnalyticsClientExists"))
  {
    waDeviceAnalyticsClient = self->_waDeviceAnalyticsClient;
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472LL;
    void v23[2] = sub_10006A858;
    void v23[3] = &unk_1000D2E18;
    v23[4] = v8;
    v23[5] = v9;
    if (!-[WADeviceAnalyticsClient dumpDeploymentGraphJSONFileWithCompletion:]( waDeviceAnalyticsClient,  "dumpDeploymentGraphJSONFileWithCompletion:",  v23))
    {
LABEL_6:
      int v13 = 0;
      goto LABEL_7;
    }

    dispatch_time_t v11 = dispatch_time(0LL, 60000000000LL);
    if (dispatch_semaphore_wait(v9, v11))
    {
      uint64_t v12 = (os_log_s *)sub_10008C90C();
      int v13 = 0;
      if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_7;
      }
      int v24 = 136315650;
      uint64_t v25 = "-[W5LogManager __collectDeviceAnalyticsDeploymentGraph:]";
      __int16 v26 = 2080;
      uint64_t v27 = "W5LogManager.m";
      __int16 v28 = 1024;
      int v29 = 7111;
      LODWORD(v21) = 28;
      _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v12,  0LL,  "[wifivelocity] %s (%s:%u) Gave up waiting to get Device Analytics Store Dump. Bailing",  (const char *)&v24,  v21,  LODWORD(v23[0]));
      goto LABEL_6;
    }

    if (![v8 length])
    {
      int v13 = 1;
LABEL_7:
      id v14 = (os_log_s *)sub_10008C90C();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        id v15 = [v8 length];
        int v24 = 136316162;
        uint64_t v25 = "-[W5LogManager __collectDeviceAnalyticsDeploymentGraph:]";
        __int16 v26 = 2080;
        uint64_t v27 = "W5LogManager.m";
        __int16 v28 = 1024;
        int v29 = 7116;
        __int16 v30 = 1024;
        LODWORD(v31[0]) = v13;
        WORD2(v31[0]) = 2048;
        *(void *)((char *)v31 + 6) = v15;
        LODWORD(v21) = 44;
        _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v14,  0LL,  "[wifivelocity] %s (%s:%u) Success:%d Length:%lu",  &v24,  v21);
      }

      goto LABEL_9;
    }

    if (-[NSFileManager isReadableFileAtPath:]( +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"),  "isReadableFileAtPath:",  v8))
    {
      id v17 = +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array");
      id v18 = objc_msgSend( objc_msgSend(v6, "path"),  "stringByAppendingPathComponent:",  objc_msgSend(v8, "lastPathComponent"));
      -[NSFileManager copyItemAtPath:toPath:error:]( +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"),  "copyItemAtPath:toPath:error:",  v8,  v18,  0LL);
      -[NSFileManager removeItemAtPath:error:]( +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"),  "removeItemAtPath:error:",  v8,  0LL);
      id v19 = +[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", v18);
      if (v7)
      {
        id v19 = -[W5LogManager __collectFileAtURL:outputDirectory:maxAge:maxSize:compress:remainingSize:]( self,  "__collectFileAtURL:outputDirectory:maxAge:maxSize:compress:remainingSize:",  v19,  v6,  0x7FFFFFFFFFFFFFFFLL,  1LL,  0LL,  1.79769313e308);
        -[NSFileManager removeItemAtPath:error:]( +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"),  "removeItemAtPath:error:",  v18,  0LL);
      }

      if (v19)
      {
        [v17 addObject:v19];
        [v5 setRelativeURLs:v17];
      }
    }
  }

  else
  {
    id v20 = (os_log_s *)sub_10008C90C();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      int v24 = 136315906;
      uint64_t v25 = "-[W5LogManager __collectDeviceAnalyticsDeploymentGraph:]";
      __int16 v26 = 2080;
      uint64_t v27 = "W5LogManager.m";
      __int16 v28 = 1024;
      int v29 = 7099;
      __int16 v30 = 2080;
      v31[0] = "-[W5LogManager __collectDeviceAnalyticsDeploymentGraph:]";
      int v22 = 38;
      _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v20,  0LL,  "[wifivelocity] %s (%s:%u) %s [self waDeviceAnalyticsClientExists] == FALSE, skipping",  &v24,  v22);
    }
  }

- (id)__collectDeviceAnalyticsEntityCSVs:(id)a3
{
  id v5 = objc_alloc_init(&OBJC_CLASS___W5LogItemReceipt);
  id v6 = objc_msgSend(objc_msgSend(a3, "configuration"), "objectForKey:", @"AnalyticsCSVOutputDir");
  if (!v6) {
    id v6 = objc_msgSend(objc_msgSend(a3, "configuration"), "objectForKeyedSubscript:", @"OutputDirectory");
  }
  HIDWORD(v34) = objc_msgSend( objc_msgSend( objc_msgSend(a3, "configuration"),  "objectForKeyedSubscript:",  @"Compress"),  "BOOLValue");
  unsigned int v7 = objc_msgSend( objc_msgSend(objc_msgSend(a3, "configuration"), "objectForKeyedSubscript:", @"MaxAge"),  "unsignedIntValue");
  uint64_t v8 = objc_msgSend( objc_msgSend(objc_msgSend(a3, "configuration"), "objectForKeyedSubscript:", @"BatchSize"),  "unsignedIntValue");
  [v5 setRequest:a3];
  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v5, "setStartedAt:");
  id v9 = +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array");
  id v10 = dispatch_semaphore_create(0LL);
  dispatch_time_t v11 = (os_log_s *)sub_10008C90C();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v41 = 136316418;
    id v42 = "-[W5LogManager __collectDeviceAnalyticsEntityCSVs:]";
    __int16 v43 = 2080;
    id v44 = "W5LogManager.m";
    __int16 v45 = 1024;
    int v46 = 7167;
    __int16 v47 = 2048;
    *(void *)id v48 = v7;
    *(_WORD *)&v48[8] = 2048;
    *(void *)&v48[10] = v7 / 0x15180uLL;
    __int16 v49 = 2048;
    uint64_t v50 = v8;
    LODWORD(v28) = 58;
    _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v11,  0LL,  "[wifivelocity] %s (%s:%u) maxAge:%lu days:%lu batchSize:%lu",  (const char *)&v41,  v28,  object,  v31,  v32,  v34);
  }

  id v33 = v5;
  objecta = v10;
  if (-[W5LogManager waDeviceAnalyticsClientExists](self, "waDeviceAnalyticsClientExists"))
  {
    waDeviceAnalyticsClient = self->_waDeviceAnalyticsClient;
    v39[0] = _NSConcreteStackBlock;
    v39[1] = 3221225472LL;
    void v39[2] = sub_10006AF44;
    void v39[3] = &unk_1000D2E40;
    void v39[4] = v9;
    v39[5] = v10;
    if (!-[WADeviceAnalyticsClient dumpDeviceAnalyticsCSVsUsingBatchSizeToFileWithCompletion:batchSize:maxAge:]( waDeviceAnalyticsClient,  "dumpDeviceAnalyticsCSVsUsingBatchSizeToFileWithCompletion:batchSize:maxAge:",  v39,  v8,  v7 / 0x15180uLL))
    {
LABEL_10:
      int v15 = 0;
      goto LABEL_11;
    }

    dispatch_time_t v13 = dispatch_time(0LL, 60000000000LL);
    if (dispatch_semaphore_wait(v10, v13))
    {
      id v14 = (os_log_s *)sub_10008C90C();
      int v15 = 0;
      if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_11;
      }
      int v41 = 136315650;
      id v42 = "-[W5LogManager __collectDeviceAnalyticsEntityCSVs:]";
      __int16 v43 = 2080;
      id v44 = "W5LogManager.m";
      __int16 v45 = 1024;
      int v46 = 7181;
      LODWORD(v28) = 28;
      _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v14,  0LL,  "[wifivelocity] %s (%s:%u) Gave up waiting to get Device Analytics Store Dump. Bailing",  (const char *)&v41,  v28,  (_DWORD)v10);
      goto LABEL_10;
    }

    if (![v9 count])
    {
      int v15 = 1;
LABEL_11:
      id v16 = (os_log_s *)sub_10008C90C();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        id v17 = [v9 count];
        int v41 = 136316162;
        id v42 = "-[W5LogManager __collectDeviceAnalyticsEntityCSVs:]";
        __int16 v43 = 2080;
        id v44 = "W5LogManager.m";
        __int16 v45 = 1024;
        int v46 = 7186;
        __int16 v47 = 1024;
        *(_DWORD *)id v48 = v15;
        *(_WORD *)&v48[4] = 2048;
        *(void *)&v48[6] = v17;
        LODWORD(v28) = 44;
        _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v16,  0LL,  "[wifivelocity] %s (%s:%u) Success:%d nFiles:%lu",  &v41,  v28);
      }

      goto LABEL_27;
    }

    __int128 v37 = 0u;
    __int128 v38 = 0u;
    __int128 v35 = 0u;
    __int128 v36 = 0u;
    id v18 = [v9 countByEnumeratingWithState:&v35 objects:v40 count:16];
    if (v18)
    {
      id v19 = v18;
      uint64_t v20 = *(void *)v36;
      do
      {
        for (i = 0LL; i != v19; i = (char *)i + 1)
        {
          if (*(void *)v36 != v20) {
            objc_enumerationMutation(v9);
          }
          int v22 = *(void **)(*((void *)&v35 + 1) + 8LL * (void)i);
          if (-[NSFileManager isReadableFileAtPath:]( +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"),  "isReadableFileAtPath:",  v22))
          {
            id v23 = +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array");
            id v24 = objc_msgSend( objc_msgSend(v6, "path"),  "stringByAppendingPathComponent:",  objc_msgSend(v22, "lastPathComponent"));
            -[NSFileManager copyItemAtPath:toPath:error:]( +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"),  "copyItemAtPath:toPath:error:",  v22,  v24,  0LL);
            -[NSFileManager removeItemAtPath:error:]( +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"),  "removeItemAtPath:error:",  v22,  0LL);
            uint64_t v25 = +[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", v24);
            if (HIDWORD(v34))
            {
              uint64_t v25 = -[W5LogManager __collectFileAtURL:outputDirectory:maxAge:maxSize:compress:remainingSize:]( self,  "__collectFileAtURL:outputDirectory:maxAge:maxSize:compress:remainingSize:",  v25,  v6,  0x7FFFFFFFFFFFFFFFLL,  1LL,  0LL,  1.79769313e308);
              -[NSFileManager removeItemAtPath:error:]( +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"),  "removeItemAtPath:error:",  v24,  0LL);
            }

            if (v25)
            {
              [v23 addObject:v25];
              [v33 setRelativeURLs:v23];
            }
          }
        }

        id v19 = [v9 countByEnumeratingWithState:&v35 objects:v40 count:16];
      }

      while (v19);
    }
  }

  else
  {
    uint64_t v27 = (os_log_s *)sub_10008C90C();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      int v41 = 136315906;
      id v42 = "-[W5LogManager __collectDeviceAnalyticsEntityCSVs:]";
      __int16 v43 = 2080;
      id v44 = "W5LogManager.m";
      __int16 v45 = 1024;
      int v46 = 7169;
      __int16 v47 = 2080;
      *(void *)id v48 = "-[W5LogManager __collectDeviceAnalyticsEntityCSVs:]";
      LODWORD(v28) = 38;
      _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v27,  0LL,  "[wifivelocity] %s (%s:%u) %s [self waDeviceAnalyticsClientExists] == FALSE, skipping",  &v41,  v28);
    }
  }

- (id)__dnssdBrowseAll:(id)a3
{
  id v4 = objc_alloc_init(&OBJC_CLASS___W5LogItemReceipt);
  [v4 setRequest:a3];
  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v4, "setStartedAt:");
  id v5 = objc_msgSend(objc_msgSend(a3, "configuration"), "objectForKeyedSubscript:", @"OutputDirectory");
  id v6 = objc_msgSend( objc_msgSend(objc_msgSend(a3, "configuration"), "objectForKeyedSubscript:", @"DoPing"),  "BOOLValue");
  id v7 = -[W5DNSSDBrowser init:](objc_alloc(&OBJC_CLASS___W5DNSSDBrowser), "init:", v6);
  unsigned int v8 = [v7 startBrowsing];
  if (v8)
  {
    unsigned int v20 = v8;
    uint64_t v21 = (os_log_s *)sub_10008C90C();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      uint64_t v28 = (uint64_t)"-[W5LogManager __dnssdBrowseAll:]";
      __int16 v29 = 2080;
      __int16 v30 = "W5LogManager.m";
      __int16 v31 = 1024;
      int v32 = 7238;
      __int16 v33 = 1024;
      LODWORD(v34) = v20;
      LODWORD(v22) = 34;
      _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v21,  0LL,  "[wifivelocity] %s (%s:%u) DNSServiceQueryRecord failed. Error: %d",  (const char *)buf,  v22,  v23,  v24);
    }
  }

  else
  {
    id v9 = dispatch_semaphore_create(0LL);
    if ((_DWORD)v6) {
      int64_t v10 = 30000000000LL;
    }
    else {
      int64_t v10 = 10000000000LL;
    }
    dispatch_time_t v11 = dispatch_time(0LL, v10);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10006B4B8;
    block[3] = &unk_1000D1BF8;
    block[4] = v9;
    dispatch_after(v11, &_dispatch_main_q, block);
    dispatch_time_t v12 = dispatch_time(0LL, 80000000000LL);
    if (dispatch_semaphore_wait(v9, v12) >= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134349056;
      uint64_t v28 = 0x4054000000000000LL;
      _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "[wifivelocity] FAILED to complete operation within %{public}.1fs, continuing",  buf,  0xCu);
    }

    [v7 stopBrowsing];
    uint64_t v24 = 0LL;
    dispatch_time_t v13 = +[NSJSONSerialization dataWithJSONObject:options:error:]( NSJSONSerialization,  "dataWithJSONObject:options:error:",  [v7 browseAllResults],  1,  &v24);
    if (v24)
    {
      id v14 = (os_log_s *)sub_10008C90C();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        uint64_t v28 = (uint64_t)"-[W5LogManager __dnssdBrowseAll:]";
        __int16 v29 = 2080;
        __int16 v30 = "W5LogManager.m";
        __int16 v31 = 1024;
        int v32 = 7256;
        _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v14,  0LL,  "[wifivelocity] %s (%s:%u) Failed to convert to JSON",  buf,  28);
      }
    }

    else
    {
      int v15 = -[NSString initWithData:encoding:](objc_alloc(&OBJC_CLASS___NSString), "initWithData:encoding:", v13, 4LL);
      id v16 = objc_msgSend(objc_msgSend(v5, "path"), "stringByAppendingPathComponent:", @"dnssd_browseAll.json");
      unsigned int v17 = -[NSString writeToFile:atomically:encoding:error:]( v15,  "writeToFile:atomically:encoding:error:",  v16,  1LL,  4LL,  &v24);
      id v18 = (os_log_s *)sub_10008C90C();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316418;
        uint64_t v28 = (uint64_t)"-[W5LogManager __dnssdBrowseAll:]";
        __int16 v29 = 2080;
        __int16 v30 = "W5LogManager.m";
        __int16 v31 = 1024;
        int v32 = 7263;
        __int16 v33 = 2112;
        id v34 = v16;
        __int16 v35 = 1024;
        unsigned int v36 = v17;
        __int16 v37 = 2112;
        uint64_t v38 = v24;
        _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v18,  0LL,  "[wifivelocity] %s (%s:%u) Write BrowseAll results to: %@, success: %d, error: %@",  buf,  54);
      }
    }

    __int16 v26 = +[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", @"dnssd_browseAll.json");
    objc_msgSend( v4,  "setRelativeURLs:",  +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v26, 1));
  }

  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v4, "setCompletedAt:");
  return v4;
}

- (id)__dnssdCacheAndState:(id)a3
{
  id v5 = objc_alloc_init(&OBJC_CLASS___W5LogItemReceipt);
  [v5 setRequest:a3];
  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v5, "setStartedAt:");
  id v6 = objc_msgSend(objc_msgSend(a3, "configuration"), "objectForKeyedSubscript:", @"OutputDirectory");
  id v7 = objc_msgSend(objc_msgSend(v6, "path"), "stringByAppendingPathComponent:", @"dnssd_cachedLocalRecords.txt");
  -[NSFileManager removeItemAtPath:error:]( +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"),  "removeItemAtPath:error:",  v7,  0LL);
  -[NSFileManager createFileAtPath:contents:attributes:]( +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"),  "createFileAtPath:contents:attributes:",  v7,  0LL,  0LL);
  unsigned int v8 = +[NSFileHandle fileHandleForUpdatingAtPath:](&OBJC_CLASS___NSFileHandle, "fileHandleForUpdatingAtPath:", v7);
  if (v8)
  {
    id v9 = v8;
    -[W5LogManager __runToolWithOutputFileHandle:launchPath:arguments:]( self,  "__runToolWithOutputFileHandle:launchPath:arguments:",  v8,  @"/usr/local/bin/dnssdutil",  &off_1000E4458);
    -[NSFileHandle closeFile](v9, "closeFile");
    id v10 = objc_msgSend(objc_msgSend(v6, "path"), "stringByAppendingPathComponent:", @"dnssd_state.txt");
    -[NSFileManager removeItemAtPath:error:]( +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"),  "removeItemAtPath:error:",  v10,  0LL);
    -[NSFileManager createFileAtPath:contents:attributes:]( +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"),  "createFileAtPath:contents:attributes:",  v10,  0LL,  0LL);
    dispatch_time_t v11 = +[NSFileHandle fileHandleForUpdatingAtPath:](&OBJC_CLASS___NSFileHandle, "fileHandleForUpdatingAtPath:", v10);
    if (v11)
    {
      dispatch_time_t v12 = v11;
      -[W5LogManager __runToolWithOutputFileHandle:launchPath:arguments:]( self,  "__runToolWithOutputFileHandle:launchPath:arguments:",  v11,  @"/usr/bin/dns-sd",  &off_1000E4470);
      -[NSFileHandle closeFile](v12, "closeFile");
      v14[0] = +[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", @"dnssd_cachedLocalRecords.txt");
      v14[1] = +[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", @"dnssd_state.txt");
      objc_msgSend( v5,  "setRelativeURLs:",  +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v14, 2));
    }
  }

  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v5, "setCompletedAt:");
  return v5;
}

- (id)__pingSubnet:(id)a3
{
  id v5 = objc_alloc_init(&OBJC_CLASS___W5LogItemReceipt);
  [v5 setRequest:a3];
  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v5, "setStartedAt:");
  id v6 = objc_msgSend( objc_msgSend(-[W5StatusManager networkStatus](self->_status, "networkStatus"), "primaryIPv4Addresses"),  "firstObject");
  id v7 = v6;
  if (v6 && [v6 length])
  {
    id v8 = [v7 componentsSeparatedByString:@"."];
    if ([v8 count] == (id)4)
    {
      id v9 = objc_msgSend(objc_msgSend(v8, "subarrayWithRange:", 0, 3), "componentsJoinedByString:", @".");
      id v10 = objc_opt_new(&OBJC_CLASS___NSOperationQueue);
      for (int i = 1; i != 255; ++i)
      {
        v19[0] = _NSConcreteStackBlock;
        v19[1] = 3221225472LL;
        void v19[2] = sub_10006BA44;
        v19[3] = &unk_1000D2E68;
        v19[4] = self;
        v19[5] = v9;
        char v20 = i;
        -[NSOperationQueue addOperationWithBlock:](v10, "addOperationWithBlock:", v19);
      }

      dispatch_time_t v12 = dispatch_semaphore_create(0LL);
      dispatch_time_t v13 = dispatch_time(0LL, 60000000000LL);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_10006BAC8;
      block[3] = &unk_1000D1BA8;
      block[4] = v10;
      void block[5] = v12;
      dispatch_after(v13, &_dispatch_main_q, block);
      dispatch_time_t v14 = dispatch_time(0LL, 80000000000LL);
      if (dispatch_semaphore_wait(v12, v14) > 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134349056;
        uint64_t v22 = 0x4054000000000000LL;
        _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "[wifivelocity] FAILED to complete operation within %{public}.1fs, continuing",  buf,  0xCu);
      }
    }

    else
    {
      unsigned int v17 = (os_log_s *)sub_10008C90C();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        uint64_t v22 = (uint64_t)"-[W5LogManager __pingSubnet:]";
        __int16 v23 = 2080;
        uint64_t v24 = "W5LogManager.m";
        __int16 v25 = 1024;
        int v26 = 7328;
        __int16 v27 = 2112;
        uint64_t v28 = v7;
        _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v17,  0LL,  "[wifivelocity] %s (%s:%u) Malformed self IP address: %@",  buf,  38);
      }
    }
  }

  else
  {
    id v16 = (os_log_s *)sub_10008C90C();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      uint64_t v22 = (uint64_t)"-[W5LogManager __pingSubnet:]";
      __int16 v23 = 2080;
      uint64_t v24 = "W5LogManager.m";
      __int16 v25 = 1024;
      int v26 = 7325;
      __int16 v27 = 2112;
      uint64_t v28 = v7;
      _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v16,  0LL,  "[wifivelocity] %s (%s:%u) Unable to get valid self IP address: %@",  buf,  38);
    }
  }

  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v5, "setCompletedAt:");
  return v5;
}

- (id)__pingBroadcast:(id)a3
{
  id v5 = objc_alloc_init(&OBJC_CLASS___W5LogItemReceipt);
  [v5 setRequest:a3];
  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v5, "setStartedAt:");
  if ((-[CWFInterface powerOn](-[W5StatusManager corewifi](self->_status, "corewifi"), "powerOn") & 1) != 0)
  {
    id v6 = objc_msgSend( objc_msgSend( objc_msgSend(objc_msgSend(a3, "configuration"), "objectForKeyedSubscript:", @"OutputDirectory"),  "path"),  "stringByAppendingPathComponent:",  @"ping_broadcast.txt");
    -[NSFileManager removeItemAtPath:error:]( +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"),  "removeItemAtPath:error:",  v6,  0LL);
    -[NSFileManager createFileAtPath:contents:attributes:]( +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"),  "createFileAtPath:contents:attributes:",  v6,  0LL,  0LL);
    id v7 = +[NSFileHandle fileHandleForUpdatingAtPath:](&OBJC_CLASS___NSFileHandle, "fileHandleForUpdatingAtPath:", v6);
    if (v7)
    {
      -[W5LogManager __runToolWithOutputFileHandle:launchPath:arguments:]( self,  "__runToolWithOutputFileHandle:launchPath:arguments:",  v7,  @"/sbin/ping",  &off_1000E4488);
      dispatch_time_t v12 = +[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", @"ping_broadcast.txt");
      objc_msgSend( v5,  "setRelativeURLs:",  +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v12, 1));
    }
  }

  else
  {
    id v9 = (os_log_s *)sub_10008C90C();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 136315650;
      dispatch_time_t v14 = "-[W5LogManager __pingBroadcast:]";
      __int16 v15 = 2080;
      id v16 = "W5LogManager.m";
      __int16 v17 = 1024;
      int v18 = 7362;
      LODWORD(v10) = 28;
      _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v9,  0LL,  "[wifivelocity] %s (%s:%u) WiFi is OFF",  (const char *)&v13,  v10,  v11);
    }
  }

  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v5, "setCompletedAt:");
  return v5;
}

- (id)__collectDatapathStats:(id)a3
{
  id v5 = objc_alloc_init(&OBJC_CLASS___W5LogItemReceipt);
  [v5 setRequest:a3];
  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  uint64_t v22 = v5;
  objc_msgSend(v5, "setStartedAt:");
  id v6 = objc_msgSend(objc_msgSend(a3, "configuration"), "objectForKeyedSubscript:", @"OutputDirectory");
  id v7 = (const __CFString *)objc_msgSend( objc_msgSend(a3, "configuration"),  "objectForKeyedSubscript:",  @"FileNameOverride");
  id v8 = [v6 path];
  if (v7) {
    id v9 = v7;
  }
  else {
    id v9 = @"wifi_datapath.txt";
  }
  id v10 = [v8 stringByAppendingPathComponent:v9];
  -[NSFileManager removeItemAtPath:error:]( +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"),  "removeItemAtPath:error:",  v10,  0LL);
  -[NSFileManager createFileAtPath:contents:attributes:]( +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"),  "createFileAtPath:contents:attributes:",  v10,  0LL,  0LL);
  int v11 = +[NSFileHandle fileHandleForUpdatingAtPath:](&OBJC_CLASS___NSFileHandle, "fileHandleForUpdatingAtPath:", v10);
  if (v11)
  {
    dispatch_time_t v12 = v11;
    id v13 = +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array");
    id v14 = -[CWFInterface interfaceNames](-[W5StatusManager corewifi](self->_status, "corewifi"), "interfaceNames");
    id v15 = -[CWFInterface virtualInterfaceNames]( -[W5StatusManager corewifi](self->_status, "corewifi"),  "virtualInterfaceNames");
    if (v14) {
      [v13 addObjectsFromArray:v14];
    }
    if (v15) {
      [v13 addObjectsFromArray:v15];
    }
    __int128 v26 = 0u;
    __int128 v27 = 0u;
    __int128 v24 = 0u;
    __int128 v25 = 0u;
    id obj = v13;
    id v16 = [v13 countByEnumeratingWithState:&v24 objects:v39 count:16];
    if (v16)
    {
      uint64_t v17 = *(void *)v25;
      do
      {
        for (int i = 0LL; i != v16; int i = (char *)i + 1)
        {
          if (*(void *)v25 != v17) {
            objc_enumerationMutation(obj);
          }
          uint64_t v19 = *(void *)(*((void *)&v24 + 1) + 8LL * (void)i);
          id v20 = +[NSMutableString string](&OBJC_CLASS___NSMutableString, "string");
          [v20 appendString:@"####################################################################\n"];
          [v20 appendFormat:@"INTERFACE: %@\n", v19];
          [v20 appendString:@"####################################################################\n\n"];
          -[NSFileHandle writeData:](v12, "writeData:", [v20 dataUsingEncoding:4]);
          v38[0] = v19;
          v38[1] = @"-dbg=m";
          -[W5LogManager __runToolWithOutputFileHandle:readFromStandardError:launchPath:arguments:addCommand:addTimestamps:]( self,  "__runToolWithOutputFileHandle:readFromStandardError:launchPath:arguments:addCommand:addTimestamps:",  v12,  0LL,  @"/usr/local/bin/apple80211",  +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v38, 2LL),  1LL,  0LL);
          v37[0] = v19;
          v37[1] = @"-dbg=bgscan-private-mac";
          -[W5LogManager __runToolWithOutputFileHandle:readFromStandardError:launchPath:arguments:addCommand:addTimestamps:]( self,  "__runToolWithOutputFileHandle:readFromStandardError:launchPath:arguments:addCommand:addTimestamps:",  v12,  0LL,  @"/usr/local/bin/apple80211",  +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v37, 2LL),  1LL,  0LL);
          v36[0] = v19;
          v36[1] = @"-dbg=proptx";
          -[W5LogManager __runToolWithOutputFileHandle:readFromStandardError:launchPath:arguments:addCommand:addTimestamps:]( self,  "__runToolWithOutputFileHandle:readFromStandardError:launchPath:arguments:addCommand:addTimestamps:",  v12,  0LL,  @"/usr/local/bin/apple80211",  +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v36, 2LL),  1LL,  0LL);
          v35[0] = @"-i";
          v35[1] = v19;
          void v35[2] = @"wme_counters";
          -[W5LogManager __wlCLIWithArguments:outputFileHandle:addCommand:addTimestamps:]( self,  "__wlCLIWithArguments:outputFileHandle:addCommand:addTimestamps:",  +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v35, 3LL),  v12,  1LL,  0LL);
          v34[0] = @"-i";
          v34[1] = v19;
          void v34[2] = @"counters";
          -[W5LogManager __wlCLIWithArguments:outputFileHandle:addCommand:addTimestamps:]( self,  "__wlCLIWithArguments:outputFileHandle:addCommand:addTimestamps:",  +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v34, 3LL),  v12,  1LL,  0LL);
          v33[0] = @"-i";
          v33[1] = v19;
          void v33[2] = @"memuse";
          -[W5LogManager __wlCLIWithArguments:outputFileHandle:addCommand:addTimestamps:]( self,  "__wlCLIWithArguments:outputFileHandle:addCommand:addTimestamps:",  +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v33, 3LL),  v12,  1LL,  0LL);
          v32[0] = @"-i";
          v32[1] = v19;
          void v32[2] = @"-q";
          -[W5LogManager __runToolWithOutputFileHandle:readFromStandardError:launchPath:arguments:addCommand:addTimestamps:]( self,  "__runToolWithOutputFileHandle:readFromStandardError:launchPath:arguments:addCommand:addTimestamps:",  v12,  0LL,  @"/usr/sbin/netstat",  +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v32, 3LL),  1LL,  0LL);
          v31[0] = v19;
          v31[1] = @"-dbg=print_peers";
          -[W5LogManager __runToolWithOutputFileHandle:readFromStandardError:launchPath:arguments:addCommand:addTimestamps:]( self,  "__runToolWithOutputFileHandle:readFromStandardError:launchPath:arguments:addCommand:addTimestamps:",  v12,  0LL,  @"/usr/local/bin/apple80211",  +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v31, 2LL),  1LL,  0LL);
          v30[0] = v19;
          v30[1] = @"-dbg=print_packets";
          -[W5LogManager __runToolWithOutputFileHandle:readFromStandardError:launchPath:arguments:addCommand:addTimestamps:]( self,  "__runToolWithOutputFileHandle:readFromStandardError:launchPath:arguments:addCommand:addTimestamps:",  v12,  0LL,  @"/usr/local/bin/apple80211",  +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v30, 2LL),  1LL,  0LL);
          v29[0] = v19;
          v29[1] = @"-dbg=print_all_peers_verbose";
          -[W5LogManager __runToolWithOutputFileHandle:readFromStandardError:launchPath:arguments:addCommand:addTimestamps:]( self,  "__runToolWithOutputFileHandle:readFromStandardError:launchPath:arguments:addCommand:addTimestamps:",  v12,  0LL,  @"/usr/local/bin/apple80211",  +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v29, 2LL),  1LL,  0LL);
        }

        id v16 = [obj countByEnumeratingWithState:&v24 objects:v39 count:16];
      }

      while (v16);
    }

    -[NSFileHandle closeFile](v12, "closeFile");
    uint64_t v28 = +[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", v9);
    objc_msgSend( v22,  "setRelativeURLs:",  +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v28, 1));
  }

  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v22, "setCompletedAt:");
  return v22;
}

- (id)__collectLogItem:(id)a3 error:(id *)a4
{
  if ([a3 itemID] == (id)53)
  {
    debugLogQueue = (dispatch_queue_s *)self->_debugLogQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10006C8A0;
    block[3] = &unk_1000D1BA8;
    block[4] = a3;
    void block[5] = self;
    dispatch_sync(debugLogQueue, block);
    return -[W5LogManager __collectMultiple:](self, "__collectMultiple:", a3);
  }

  else
  {
    id v8 = objc_msgSend(objc_msgSend(a3, "configuration"), "objectForKeyedSubscript:", @"UseLeewayUUID");
    id v37 = objc_msgSend(objc_msgSend(a3, "configuration"), "objectForKeyedSubscript:", @"AddLeewayUUID");
    id v9 = objc_msgSend(objc_msgSend(a3, "configuration"), "objectForKeyedSubscript:", @"TimestampUUID");
    id v10 = objc_msgSend(objc_msgSend(a3, "configuration"), "objectForKeyedSubscript:", @"Timeout");
    if (v10) {
      uint64_t v11 = (uint64_t)[v10 unsignedIntegerValue];
    }
    else {
      uint64_t v11 = 10000LL;
    }
    if (v8)
    {
      id v12 = v9;
      uint64_t v44 = 0LL;
      __int16 v45 = &v44;
      uint64_t v46 = 0x2020000000LL;
      uint64_t v47 = 0LL;
      queue = (dispatch_queue_s *)self->_queue;
      v43[0] = _NSConcreteStackBlock;
      v43[1] = 3221225472LL;
      void v43[2] = sub_10006CA10;
      void v43[3] = &unk_1000D2660;
      v43[5] = v8;
      v43[6] = &v44;
      v43[4] = self;
      dispatch_sync(queue, v43);
      uint64_t v14 = v45[3];
      id v15 = (os_log_s *)sub_10008C90C();
      v11 += v14;
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v16 = v45[3];
        id v17 = [v8 substringToIndex:5];
        int v18 = (void (*)(uint64_t, uint64_t))(v11 - v45[3]);
        *(_DWORD *)__int128 v53 = 134218754;
        *(void *)&v53[4] = v16;
        *(_WORD *)&v53[12] = 2114;
        *(void *)&v53[14] = v17;
        *(_WORD *)&v53[22] = 2048;
        __int128 v54 = v18;
        LOWORD(v55) = 2048;
        *(void *)((char *)&v55 + 2) = v11;
        _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v15,  0LL,  "[wifivelocity] Using leeway of %lums [%{public}@], extending timeout from %lums to %lums",  v53,  42);
      }

      _Block_object_dispose(&v44, 8);
      id v9 = v12;
    }

    +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
    uint64_t v20 = v19;
    uint64_t v44 = 0LL;
    __int16 v45 = &v44;
    uint64_t v46 = 0x2020000000LL;
    LOBYTE(v47) = 0;
    *(void *)__int128 v53 = 0LL;
    *(void *)&v53[8] = v53;
    *(void *)&v53[16] = 0x3052000000LL;
    __int128 v54 = sub_1000558E4;
    *(void *)&__int128 v55 = sub_1000558F4;
    *((void *)&v55 + 1) = 0LL;
    uint64_t v21 = dispatch_queue_create(0LL, 0LL);
    v42[0] = _NSConcreteStackBlock;
    v42[1] = 3221225472LL;
    void v42[2] = sub_10006CA54;
    void v42[3] = &unk_1000D2EB8;
    v42[4] = self;
    void v42[5] = a3;
    v42[6] = v21;
    v42[7] = &v44;
    v42[8] = v53;
    v42[9] = a4;
    dispatch_block_t v22 = dispatch_block_create(DISPATCH_BLOCK_ASSIGN_CURRENT, v42);
    uint64_t v23 = mach_absolute_time();
    -[NSOperationQueue addOperationWithBlock:]( -[W5StatusManager concurrentQueue](self->_status, "concurrentQueue"),  "addOperationWithBlock:",  v22);
    if (v11) {
      dispatch_time_t v24 = dispatch_time(0LL, 1000000 * v11);
    }
    else {
      dispatch_time_t v24 = -1LL;
    }
    uint64_t v25 = dispatch_block_wait(v22, v24);
    v41[0] = _NSConcreteStackBlock;
    v41[1] = 3221225472LL;
    v41[2] = sub_10006CB1C;
    void v41[3] = &unk_1000D2EE0;
    v41[6] = v53;
    v41[7] = v25;
    v41[4] = a3;
    void v41[5] = &v44;
    v41[8] = v20;
    dispatch_sync(v21, v41);
    if (!v25 && v37 && v11)
    {
      mach_timebase_info(&info);
      if (info.denom) {
        uint64_t v26 = (mach_absolute_time() - v23) * info.numer / info.denom / 0xF4240;
      }
      else {
        uint64_t v26 = 0LL;
      }
      uint64_t v27 = v11 - v26;
      uint64_t v28 = (dispatch_queue_s *)self->_queue;
      v39[0] = _NSConcreteStackBlock;
      v39[1] = 3221225472LL;
      void v39[2] = sub_10006CC54;
      void v39[3] = &unk_1000D23C8;
      void v39[4] = self;
      v39[5] = v37;
      void v39[6] = v27;
      dispatch_async(v28, v39);
      __int16 v29 = (os_log_s *)sub_10008C90C();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        id v30 = [v37 substringToIndex:5];
        int v49 = 134218242;
        uint64_t v50 = v27;
        __int16 v51 = 2114;
        id v52 = v30;
        LODWORD(v36) = 22;
        _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v29,  0LL,  "[wifivelocity] Storing leeway of %lums [%{public}@]",  &v49,  v36);
      }
    }

    uint64_t v31 = mach_absolute_time();
    int v32 = (dispatch_queue_s *)self->_queue;
    v38[0] = _NSConcreteStackBlock;
    v38[1] = 3221225472LL;
    void v38[2] = sub_10006CC9C;
    void v38[3] = &unk_1000D23C8;
    void v38[4] = v9;
    v38[5] = self;
    v38[6] = v31;
    dispatch_async(v32, v38);
    id v33 = [*(id *)(*(void *)&v53[8] + 40) copy];
    id v34 = *(id *)(*(void *)&v53[8] + 40LL);
    dispatch_release(v21);
    _Block_release(v22);
    _Block_object_dispose(v53, 8);
    _Block_object_dispose(&v44, 8);
    return v33;
  }

- (id)__collectIndividual:(id)a3 error:(id *)a4
{
  uint64_t v7 = W5DescriptionForLogItemID([a3 itemID]);
  if (-[NSArray containsObject:]( -[W5StatusManager bootArgs](self->_status, "bootArgs"),  "containsObject:",  +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@=%ld",  @"wifivelocity-exclude-log",  [a3 itemID]))
    || -[NSArray containsObject:]( -[W5StatusManager bootArgs](self->_status, "bootArgs"),  "containsObject:",  +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@='%@'",  @"wifivelocity-exclude-log",  v7)))
  {
    id v8 = (os_log_s *)sub_10008C90C();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)mach_timebase_info info = 138543618;
      *(void *)&info[4] = v7;
      *(_WORD *)&info[12] = 2048;
      *(void *)&info[14] = [a3 itemID];
      LODWORD(v36) = 22;
      _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v8,  0LL,  "[wifivelocity] EXCLUDING [%{public}@] (logItemID=%ld) via boot-arg!!!",  info,  v36);
    }

    return 0LL;
  }

  else
  {
    id v10 = +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"com.apple.wifivelocity.log_item.%@",  W5DescriptionForLogItemID([a3 itemID]));
    uint64_t v11 = (void *)os_transaction_create(-[NSString UTF8String](v10, "UTF8String"));
    objc_msgSend( +[W5ActivityManager sharedActivityManager](W5ActivityManager, "sharedActivityManager"),  "osTransactionCreate:transaction:",  -[NSString UTF8String](v10, "UTF8String"),  v11);
    debugLogQueue = (dispatch_queue_s *)self->_debugLogQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10006D944;
    block[3] = &unk_1000D1858;
    block[4] = a3;
    void block[5] = self;
    void block[6] = v7;
    dispatch_sync(debugLogQueue, block);
    switch((unint64_t)[a3 itemID])
    {
      case 1uLL:
        id v13 = -[W5LogManager __collect_spindump:](self, "__collect_spindump:", a3);
        goto LABEL_89;
      case 2uLL:
        id v13 = -[W5LogManager __collect_ping:](self, "__collect_ping:", a3);
        goto LABEL_89;
      case 3uLL:
        id v13 = -[W5LogManager __collect_netstat:](self, "__collect_netstat:", a3);
        goto LABEL_89;
      case 4uLL:
        id v13 = -[W5LogManager __collect_arp:](self, "__collect_arp:", a3);
        goto LABEL_89;
      case 6uLL:
        id v13 = -[W5LogManager __collect_ndp:](self, "__collect_ndp:", a3);
        goto LABEL_89;
      case 7uLL:
        id v13 = -[W5LogManager __collect_ifconfig:](self, "__collect_ifconfig:", a3);
        goto LABEL_89;
      case 8uLL:
        id v13 = -[W5LogManager __collect_ipconfig:](self, "__collect_ipconfig:", a3);
        goto LABEL_89;
      case 9uLL:
        id v13 = -[W5LogManager __collect_traceroute:](self, "__collect_traceroute:", a3);
        goto LABEL_89;
      case 0xAuLL:
        id v13 = -[W5LogManager __collect_ioreg:](self, "__collect_ioreg:", a3);
        goto LABEL_89;
      case 0xBuLL:
        id v13 = -[W5LogManager __collect_kextstat:](self, "__collect_kextstat:", a3);
        goto LABEL_89;
      case 0xCuLL:
        id v13 = -[W5LogManager __collect_darwinup:](self, "__collect_darwinup:", a3);
        goto LABEL_89;
      case 0xDuLL:
        id v13 = -[W5LogManager __collect_hosts:](self, "__collect_hosts:", a3);
        goto LABEL_89;
      case 0xEuLL:
        id v13 = -[W5LogManager __collect_sysdiagnose:](self, "__collect_sysdiagnose:", a3);
        goto LABEL_89;
      case 0xFuLL:
        id v13 = -[W5LogManager __collect_pmset:](self, "__collect_pmset:", a3);
        goto LABEL_89;
      case 0x10uLL:
        id v13 = -[W5LogManager __collect_configd:](self, "__collect_configd:", a3);
        goto LABEL_89;
      case 0x11uLL:
        id v13 = -[W5LogManager __collect_top:](self, "__collect_top:", a3);
        goto LABEL_89;
      case 0x12uLL:
        id v13 = -[W5LogManager __collect_swvers:](self, "__collect_swvers:", a3);
        goto LABEL_89;
      case 0x13uLL:
        id v13 = -[W5LogManager __collectCoreCapture:](self, "__collectCoreCapture:", a3);
        goto LABEL_89;
      case 0x14uLL:
        id v13 = -[W5LogManager __collectCoreCapture24:](self, "__collectCoreCapture24:", a3);
        goto LABEL_89;
      case 0x15uLL:
        id v13 = -[W5LogManager __collectCoreCaptureDump:](self, "__collectCoreCaptureDump:", a3);
        goto LABEL_89;
      case 0x18uLL:
        id v13 = -[W5LogManager __collectTCPDump_PRE:](self, "__collectTCPDump_PRE:", a3);
        goto LABEL_89;
      case 0x19uLL:
        id v13 = -[W5LogManager __collectTCPDump_POST:](self, "__collectTCPDump_POST:", a3);
        goto LABEL_89;
      case 0x1AuLL:
        id v13 = -[W5LogManager __collectDiagnostics:](self, "__collectDiagnostics:", a3);
        goto LABEL_89;
      case 0x1BuLL:
        id v13 = -[W5LogManager __collectSystemConfiguration:](self, "__collectSystemConfiguration:", a3);
        goto LABEL_89;
      case 0x1CuLL:
        id v13 = -[W5LogManager __collectWiFiScanResults:](self, "__collectWiFiScanResults:", a3);
        goto LABEL_89;
      case 0x1DuLL:
        id v13 = -[W5LogManager __collectAirPlayLogs:](self, "__collectAirPlayLogs:", a3);
        goto LABEL_89;
      case 0x1EuLL:
        id v13 = -[W5LogManager __collectBluetoothLogs:](self, "__collectBluetoothLogs:", a3);
        goto LABEL_89;
      case 0x1FuLL:
        id v13 = -[W5LogManager __collectSystemLogs:](self, "__collectSystemLogs:", a3);
        goto LABEL_89;
      case 0x20uLL:
        id v13 = -[W5LogManager __collectSystemLogs24:](self, "__collectSystemLogs24:", a3);
        goto LABEL_89;
      case 0x21uLL:
        id v13 = -[W5LogManager __collectEAP8021XLogs:](self, "__collectEAP8021XLogs:", a3);
        goto LABEL_89;
      case 0x22uLL:
        id v13 = -[W5LogManager __collectIPConfigurationLogs:](self, "__collectIPConfigurationLogs:", a3);
        goto LABEL_89;
      case 0x23uLL:
        id v13 = -[W5LogManager __collectCrashesAndSpins24:](self, "__collectCrashesAndSpins24:", a3);
        goto LABEL_89;
      case 0x24uLL:
        id v13 = -[W5LogManager __collectSharingLogs:](self, "__collectSharingLogs:", a3);
        goto LABEL_89;
      case 0x25uLL:
        id v13 = -[W5LogManager __collectWiFiLogs:](self, "__collectWiFiLogs:", a3);
        goto LABEL_89;
      case 0x26uLL:
        id v13 = -[W5LogManager __collectWiFiLogs24:](self, "__collectWiFiLogs24:", a3);
        goto LABEL_89;
      case 0x27uLL:
        id v13 = -[W5LogManager __collectWiFiLogsDump:](self, "__collectWiFiLogsDump:", a3);
        goto LABEL_89;
      case 0x28uLL:
        id v13 = -[W5LogManager __collectWiFiPreferences:](self, "__collectWiFiPreferences:", a3);
        goto LABEL_89;
      case 0x29uLL:
        id v13 = -[W5LogManager __collectWirelessProxLogs:](self, "__collectWirelessProxLogs:", a3);
        goto LABEL_89;
      case 0x2AuLL:
        id v13 = -[W5LogManager __collect_IMFoundationPing:](self, "__collect_IMFoundationPing:", a3);
        goto LABEL_89;
      case 0x2BuLL:
        id v13 = -[W5LogManager __collect_CFNetworkPing:](self, "__collect_CFNetworkPing:", a3);
        goto LABEL_89;
      case 0x2CuLL:
        id v13 = -[W5LogManager __collectNetworkStatus:](self, "__collectNetworkStatus:", a3);
        goto LABEL_89;
      case 0x2DuLL:
        id v13 = -[W5LogManager __collectWiFiStatus:](self, "__collectWiFiStatus:", a3);
        goto LABEL_89;
      case 0x2EuLL:
        id v13 = -[W5LogManager __collectAWDLStatus:](self, "__collectAWDLStatus:", a3);
        goto LABEL_89;
      case 0x2FuLL:
        id v13 = -[W5LogManager __collectBluetoothStatus:](self, "__collectBluetoothStatus:", a3);
        goto LABEL_89;
      case 0x30uLL:
        id v13 = -[W5LogManager __collectLeakyAPStats:](self, "__collectLeakyAPStats:", a3);
        goto LABEL_89;
      case 0x31uLL:
        id v13 = -[W5LogManager __collectBonjourRecords:](self, "__collectBonjourRecords:", a3);
        goto LABEL_89;
      case 0x32uLL:
        id v13 = -[W5LogManager __collectEventHistory:](self, "__collectEventHistory:", a3);
        goto LABEL_89;
      case 0x33uLL:
        id v13 = -[W5LogManager __collectPerSSIDDiagnosticsHistory:](self, "__collectPerSSIDDiagnosticsHistory:", a3);
        goto LABEL_89;
      case 0x34uLL:
        *(void *)mach_timebase_info info = 0LL;
        *(void *)&info[8] = info;
        *(void *)&info[16] = 0x3052000000LL;
        *(void *)__int128 v55 = sub_1000558E4;
        *(void *)&v55[8] = sub_1000558F4;
        *(void *)&v55[16] = 0LL;
        queue = (dispatch_queue_s *)self->_queue;
        v50[0] = _NSConcreteStackBlock;
        v50[1] = 3221225472LL;
        v50[2] = sub_10006DAC0;
        void v50[3] = &unk_1000D18F8;
        void v50[4] = self;
        v50[5] = info;
        dispatch_sync(queue, v50);
        id v15 = *(id *)(*(void *)&info[8] + 40LL);
        id v9 = -[W5LogManager __collectAdditionalLog:url:]( self,  "__collectAdditionalLog:url:",  a3,  *(void *)(*(void *)&info[8] + 40LL));
        uint64_t v16 = (uint64_t *)info;
        goto LABEL_105;
      case 0x39uLL:
        id v13 = -[W5LogManager __collect_mobilewifitool:](self, "__collect_mobilewifitool:", a3);
        goto LABEL_89;
      case 0x3DuLL:
      case 0x3EuLL:
        id v13 = -[W5LogManager __collectWiFiStatsCLI:](self, "__collectWiFiStatsCLI:", a3);
        goto LABEL_89;
      case 0x3FuLL:
        id v9 = objc_alloc_init(&OBJC_CLASS___W5LogItemReceipt);
        [v9 setRequest:a3];
        +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
        objc_msgSend(v9, "setStartedAt:");
        -[W5DiagnosticsManager beginWiFiDefaultRoute](self->_diagnostics, "beginWiFiDefaultRoute");
        goto LABEL_64;
      case 0x40uLL:
        id v9 = objc_alloc_init(&OBJC_CLASS___W5LogItemReceipt);
        [v9 setRequest:a3];
        +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
        objc_msgSend(v9, "setStartedAt:");
        -[W5DiagnosticsManager endWiFiDefaultRoute](self->_diagnostics, "endWiFiDefaultRoute");
LABEL_64:
        +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
        objc_msgSend(v9, "setCompletedAt:");
        break;
      case 0x41uLL:
        id v13 = -[W5LogManager __collect_wl_curpower:](self, "__collect_wl_curpower:", a3);
        goto LABEL_89;
      case 0x42uLL:
        id v13 = -[W5LogManager __collect_wl_cca_get_stats:](self, "__collect_wl_cca_get_stats:", a3);
        goto LABEL_89;
      case 0x45uLL:
        id v9 = objc_alloc_init(&OBJC_CLASS___W5LogItemReceipt);
        [v9 setRequest:a3];
        +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
        objc_msgSend(v9, "setStartedAt:");
        id v17 = objc_msgSend(objc_msgSend(a3, "configuration"), "objectForKeyedSubscript:", @"Delay");
        if (v17)
        {
          unint64_t v18 = (unint64_t)[v17 unsignedIntegerValue];
        }

        else
        {
          uint64_t v25 = (os_log_s *)sub_10008C90C();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)mach_timebase_info info = 0;
            LODWORD(v36) = 2;
            _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v25,  0LL,  "[wifivelocity] DELAY log item used without specifying delay, using default of 1000 ms",  info,  v36);
          }

          unint64_t v18 = 1000LL;
        }

        id v26 = objc_msgSend(objc_msgSend(a3, "configuration"), "objectForKeyedSubscript:", @"UseLeewayUUID");
        id v27 = objc_msgSend(objc_msgSend(a3, "configuration"), "objectForKeyedSubscript:", @"TimestampUUID");
        uint64_t v46 = 0LL;
        uint64_t v47 = &v46;
        uint64_t v48 = 0x2020000000LL;
        uint64_t v49 = 0LL;
        uint64_t v42 = 0LL;
        __int16 v43 = &v42;
        uint64_t v44 = 0x2020000000LL;
        uint64_t v45 = 0LL;
        uint64_t v28 = (dispatch_queue_s *)self->_queue;
        v41[0] = _NSConcreteStackBlock;
        v41[1] = 3221225472LL;
        v41[2] = sub_10006DB04;
        void v41[3] = &unk_1000D2F08;
        v41[4] = v26;
        void v41[5] = self;
        v41[7] = &v46;
        v41[8] = &v42;
        v41[6] = v27;
        dispatch_sync(v28, v41);
        uint64_t v29 = v43[3];
        if (v29)
        {
          mach_timebase_info((mach_timebase_info_t)info);
          if (*(_DWORD *)&info[4]) {
            uint64_t v29 = (mach_absolute_time() - v43[3]) * *(unsigned int *)info / *(unsigned int *)&info[4] / 0xF4240;
          }
          else {
            uint64_t v29 = 0LL;
          }
        }

        uint64_t v38 = v29;
        unint64_t v39 = v18;
        BOOL v30 = v18 >= v29;
        unint64_t v31 = v18 - v29;
        if (v30) {
          unint64_t v32 = v31;
        }
        else {
          unint64_t v32 = 0LL;
        }
        unint64_t v33 = v47[3] + v32;
        id v34 = (os_log_s *)sub_10008C90C();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v35 = v47[3];
          *(_DWORD *)mach_timebase_info info = 134218752;
          *(void *)&info[4] = v39;
          *(_WORD *)&info[12] = 2048;
          *(void *)&info[14] = v38;
          *(_WORD *)&info[22] = 2048;
          *(void *)__int128 v55 = v35;
          *(_WORD *)&v55[8] = 2048;
          *(void *)&v55[10] = v33;
          LODWORD(v36) = 42;
          _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v34,  0LL,  "[wifivelocity] DELAY (delay=%lu, elapsed=%lu, leeway=%lu, total=%lu)",  info,  v36,  v37,  v38);
        }

        usleep(1000 * v33);
        +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
        objc_msgSend(v9, "setCompletedAt:");
        _Block_object_dispose(&v42, 8);
        uint64_t v16 = &v46;
LABEL_105:
        _Block_object_dispose(v16, 8);
        break;
      case 0x46uLL:
        id v13 = -[W5LogManager __collectPreviouslyCollected:](self, "__collectPreviouslyCollected:", a3);
        goto LABEL_89;
      case 0x49uLL:
        id v13 = -[W5LogManager __collectNetworkPreferences:](self, "__collectNetworkPreferences:", a3);
        goto LABEL_89;
      case 0x4AuLL:
        id v13 = -[W5LogManager __collectWiFiMemoryUsage:](self, "__collectWiFiMemoryUsage:", a3);
        goto LABEL_89;
      case 0x4BuLL:
        id v13 = -[W5LogManager __collectWiFiDeviceConfig:](self, "__collectWiFiDeviceConfig:", a3);
        goto LABEL_89;
      case 0x4CuLL:
        id v13 = -[W5LogManager __collectWiFiPerfLogs:](self, "__collectWiFiPerfLogs:", a3);
        goto LABEL_89;
      case 0x4EuLL:
        id v13 = -[W5LogManager __collectWiFiVelocityLog:](self, "__collectWiFiVelocityLog:", a3);
        goto LABEL_89;
      case 0x50uLL:
        id v13 = -[W5LogManager __collect3barsCache:](self, "__collect3barsCache:", a3);
        goto LABEL_89;
      case 0x51uLL:
        id v13 = -[W5LogManager __collectDatapathStats:](self, "__collectDatapathStats:", a3);
        goto LABEL_89;
      case 0x54uLL:
        id v13 = -[W5LogManager __collectDeviceAnalyticsStore:](self, "__collectDeviceAnalyticsStore:", a3);
        goto LABEL_89;
      case 0x55uLL:
        id v13 = -[W5LogManager __collectDeviceAnalyticsDeploymentGraph:]( self,  "__collectDeviceAnalyticsDeploymentGraph:",  a3);
        goto LABEL_89;
      case 0x56uLL:
        id v13 = -[W5LogManager __collectPeerDiagnostics:](self, "__collectPeerDiagnostics:", a3);
        goto LABEL_89;
      case 0x57uLL:
        id v13 = -[W5LogManager __collectDextCoreDump:](self, "__collectDextCoreDump:", a3);
        goto LABEL_89;
      case 0x58uLL:
        if (!objc_msgSend(objc_msgSend(a3, "configuration"), "objectForKeyedSubscript:", @"BatchSize"))
        {
          uint64_t v19 = (os_log_s *)sub_10008C90C();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            id v20 = [a3 configuration];
            *(_DWORD *)mach_timebase_info info = 138412290;
            *(void *)&info[4] = v20;
            LODWORD(v36) = 12;
            _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v19,  0LL,  "[wifivelocity] logItem.configuration[kW5LogItemRequestConfigBatchSize] is nil %@",  info,  v36);
          }
        }

        uint64_t v21 = (os_log_s *)sub_10008C90C();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          id v22 = [a3 configuration];
          *(_DWORD *)mach_timebase_info info = 136315906;
          *(void *)&info[4] = "-[W5LogManager __collectIndividual:error:]";
          *(_WORD *)&info[12] = 2080;
          *(void *)&info[14] = "W5LogManager.m";
          *(_WORD *)&info[22] = 1024;
          *(_DWORD *)__int128 v55 = 8104;
          *(_WORD *)&v55[4] = 2112;
          *(void *)&void v55[6] = v22;
          LODWORD(v36) = 38;
          _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v21,  0LL,  "[wifivelocity] %s (%s:%u) Requesting Analytics CSVs with config: %@",  info,  v36);
        }

        id v13 = -[W5LogManager __collectDeviceAnalyticsEntityCSVs:](self, "__collectDeviceAnalyticsEntityCSVs:", a3);
        goto LABEL_89;
      case 0x59uLL:
        id v13 = -[W5LogManager __dnssdBrowseAll:](self, "__dnssdBrowseAll:", a3);
        goto LABEL_89;
      case 0x5AuLL:
        id v13 = -[W5LogManager __dnssdCacheAndState:](self, "__dnssdCacheAndState:", a3);
        goto LABEL_89;
      case 0x5BuLL:
        id v13 = -[W5LogManager __pingSubnet:](self, "__pingSubnet:", a3);
        goto LABEL_89;
      case 0x5CuLL:
        id v13 = -[W5LogManager __pingBroadcast:](self, "__pingBroadcast:", a3);
LABEL_89:
        id v9 = v13;
        break;
      default:
        id v9 = objc_alloc_init(&OBJC_CLASS___W5LogItemReceipt);
        [v9 setRequest:a3];
        +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
        objc_msgSend(v9, "setStartedAt:");
        [v9 startedAt];
        objc_msgSend(v9, "setCompletedAt:");
        if (a4)
        {
          NSErrorUserInfoKey v52 = NSLocalizedFailureReasonErrorKey;
          __int128 v53 = @"W5ParamErr";
          *a4 = +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.wifivelocity.error",  1LL,  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v53,  &v52,  1LL));
        }

        break;
    }

    uint64_t v23 = (dispatch_queue_s *)self->_debugLogQueue;
    v40[0] = _NSConcreteStackBlock;
    v40[1] = 3221225472LL;
    v40[2] = sub_10006DB84;
    void v40[3] = &unk_1000D1858;
    void v40[4] = a3;
    v40[5] = v9;
    v40[6] = self;
    dispatch_sync(v23, v40);
    objc_msgSend( +[W5ActivityManager sharedActivityManager](W5ActivityManager, "sharedActivityManager"),  "osTransactionComplete:",  v11);
  }

  return v9;
}

- (id)__runDiagnosticsTests:(id)a3 configuration:(id)a4 timeout:(int64_t)a5 error:(id *)a6
{
  uint64_t v46 = 0LL;
  uint64_t v47 = &v46;
  uint64_t v48 = 0x3052000000LL;
  uint64_t v49 = sub_1000558E4;
  uint64_t v50 = sub_1000558F4;
  uint64_t v51 = 0LL;
  uint64_t v40 = 0LL;
  int v41 = &v40;
  uint64_t v42 = 0x3052000000LL;
  __int16 v43 = sub_1000558E4;
  uint64_t v44 = sub_1000558F4;
  uint64_t v45 = 0LL;
  uint64_t v36 = 0LL;
  uint64_t v37 = &v36;
  uint64_t v38 = 0x2020000000LL;
  char v39 = 0;
  uint64_t v32 = 0LL;
  unint64_t v33 = &v32;
  uint64_t v34 = 0x2020000000LL;
  char v35 = 0;
  uint64_t v11 = objc_alloc_init(&OBJC_CLASS___NSLock);
  id v12 = dispatch_semaphore_create(0LL);
  id v13 = objc_alloc_init(&OBJC_CLASS___W5DiagnosticsTestRequestInternal);
  uint64_t v26 = 0LL;
  id v27 = &v26;
  uint64_t v28 = 0x3052000000LL;
  uint64_t v29 = sub_1000558E4;
  BOOL v30 = sub_1000558F4;
  uint64_t v31 = 0LL;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10006E284;
  block[3] = &unk_1000D18F8;
  block[4] = self;
  void block[5] = &v26;
  dispatch_sync(queue, block);
  id v15 = (id)v27[5];
  -[W5DiagnosticsTestRequestInternal setUuid:](v13, "setUuid:", v27[5]);
  -[W5DiagnosticsTestRequestInternal setTestRequests:](v13, "setTestRequests:", a3);
  -[W5DiagnosticsTestRequestInternal setIncludeEvents:]( v13,  "setIncludeEvents:",  objc_msgSend(objc_msgSend(a4, "objectForKeyedSubscript:", @"IncludeEvents"), "BOOLValue"));
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472LL;
  void v24[2] = sub_10006E2C8;
  void v24[3] = &unk_1000D2F30;
  v24[6] = &v36;
  v24[7] = &v32;
  v24[8] = &v40;
  v24[9] = &v46;
  void v24[4] = v11;
  void v24[5] = v12;
  -[W5DiagnosticsTestRequestInternal setReply:](v13, "setReply:", v24);
  -[W5DiagnosticsManager addRequest:](self->_diagnostics, "addRequest:", v13);
  if (a5)
  {
    dispatch_time_t v16 = dispatch_time(0LL, (uint64_t)((double)a5 / 1000.0 * 1000000000.0));
    if (dispatch_semaphore_wait(v12, v16))
    {
      -[NSLock lock](v11, "lock");
      if (!*((_BYTE *)v33 + 24))
      {
        *((_BYTE *)v37 + 24) = 1;
        NSErrorUserInfoKey v54 = NSLocalizedFailureReasonErrorKey;
        __int128 v55 = @"W5TimeoutErr";
        id v17 =  +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.wifivelocity.error",  3LL,  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v55,  &v54,  1LL));
        void v41[5] = (uint64_t)v17;
      }

      -[NSLock unlock](v11, "unlock");
    }
  }

  else
  {
    dispatch_time_t v18 = dispatch_time(0LL, 600000000000LL);
    if (dispatch_semaphore_wait(v12, v18) >= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134349056;
      uint64_t v53 = 0x4082C00000000000LL;
      _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "[wifivelocity] FAILED to complete operation within %{public}.1fs, continuing",  buf,  0xCu);
    }
  }

  id v19 = (id)v41[5];
  id v20 = (id)v47[5];
  if (a6)
  {
    uint64_t v21 = (void *)v41[5];
    if (v21) {
      *a6 = [v21 copy];
    }
  }

  id v22 = [(id)v47[5] copy];
  _Block_object_dispose(&v26, 8);
  _Block_object_dispose(&v32, 8);
  _Block_object_dispose(&v36, 8);
  _Block_object_dispose(&v40, 8);
  _Block_object_dispose(&v46, 8);
  return v22;
}

+ (id)__descriptionForNetwork:(id)a3
{
  if (!a3) {
    return 0LL;
  }
  id v4 = +[NSMutableString string](&OBJC_CLASS___NSMutableString, "string");
  id v5 = [a3 ssidString];
  if (v5) {
    [v4 appendFormat:@"'%@' %@, ", v5, objc_msgSend(a3, "ssid")];
  }
  else {
    objc_msgSend(v4, "appendFormat:", @"<HIDDEN>, ", v15, v16);
  }
  [v4 appendFormat:@"bssid=%@, ", objc_msgSend(a3, "bssid")];
  [v4 appendFormat:@"channel=[%@], ", W5DescriptionForChannel(objc_msgSend(a3, "channel"))];
  [v4 appendFormat:@"cc=%@, ", objc_msgSend(a3, "countryCode")];
  [v4 appendFormat:@"type=%@, ", W5DescriptionForPHYMode(objc_msgSend(a3, "fastestSupportedPHYMode"))];
  objc_msgSend(v4, "appendFormat:", @"rssi=%li, ", objc_msgSend(a3, "rssi"));
  [v4 appendFormat:@"rsn=%@, ", sub_10001C0B0(a3)];
  [v4 appendFormat:@"wpa=%@, ", sub_10001BD20(a3)];
  else {
    id v6 = "no";
  }
  objc_msgSend(v4, "appendFormat:", @"wep=%s, ", v6);
  if (objc_msgSend(objc_msgSend(a3, "supportedSecurityTypes"), "containsObject:", &off_1000DF540))
  {
    uint64_t v7 = "cert";
  }

  else
  {
    unsigned int v8 = objc_msgSend(objc_msgSend(a3, "supportedSecurityTypes"), "containsObject:", &off_1000DF6F0);
    uint64_t v7 = "psk";
    if (!v8) {
      uint64_t v7 = "no";
    }
  }

  objc_msgSend(v4, "appendFormat:", @"wapi=%s, ", v7);
  else {
    id v9 = "no";
  }
  objc_msgSend(v4, "appendFormat:", @"ibss=%s, ", v9);
  else {
    id v10 = "no";
  }
  objc_msgSend(v4, "appendFormat:", @"ph=%s, ", v10);
  else {
    uint64_t v11 = "no";
  }
  objc_msgSend(v4, "appendFormat:", @"swap=%s, ", v11);
  else {
    id v12 = "no";
  }
  objc_msgSend(v4, "appendFormat:", @"hs20=%s, ", v12);
  id v13 = [a3 airPortBaseStationModelName];
  if (v13) {
    [v4 appendFormat:@"airport=[%@]", v13];
  }
  return v4;
}

+ (id)__logScanResults:(id)a3
{
  id v4 = +[NSMutableString string](&OBJC_CLASS___NSMutableString, "string");
  v33[0] = +[NSSortDescriptor sortDescriptorWithKey:ascending:selector:]( &OBJC_CLASS___NSSortDescriptor,  "sortDescriptorWithKey:ascending:selector:",  @"networkName",  1LL,  "caseInsensitiveCompare:");
  v33[1] = +[NSSortDescriptor sortDescriptorWithKey:ascending:]( &OBJC_CLASS___NSSortDescriptor,  "sortDescriptorWithKey:ascending:",  @"BSSID",  1LL);
  id v20 = a3;
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  id obj = objc_msgSend( a3,  "sortedArrayUsingDescriptors:",  +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v33, 2));
  id v5 = [obj countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v21 = 0LL;
    uint64_t v22 = 0LL;
    uint64_t v24 = 0LL;
    uint64_t v25 = 0LL;
    uint64_t v7 = 0LL;
    uint64_t v8 = 0LL;
    uint64_t v9 = 0LL;
    uint64_t v10 = 0LL;
    uint64_t v11 = 0LL;
    uint64_t v23 = 0LL;
    uint64_t v27 = *(void *)v29;
    do
    {
      for (int i = 0LL; i != v6; int i = (char *)i + 1)
      {
        if (*(void *)v29 != v27) {
          objc_enumerationMutation(obj);
        }
        id v13 = *(void **)(*((void *)&v28 + 1) + 8LL * (void)i);
        id v14 = v4;
        [v4 appendFormat:@"%@\n\n", v13];
        unsigned int v15 = objc_msgSend(objc_msgSend(v13, "channel"), "is6GHz");
        id v16 = [v13 channel];
        if (v15)
        {
          else {
            ++v24;
          }
        }

        else
        {
          unsigned int v17 = [v16 is5GHz];
          id v18 = [v13 channel];
          if (v17)
          {
            else {
              ++v21;
            }
          }

          else
          {
            v23 += [v18 is2GHz];
          }
        }

        id v4 = v14;
        v7 += [v13 isIBSS];
        if (![v13 SSID]) {
          ++v9;
        }
        if ([v13 airPortBaseStationModel]) {
          ++v8;
        }
        v10 += [v13 isPasspoint];
        v11 += [v13 isPersonalHotspot];
      }

      id v6 = [obj countByEnumeratingWithState:&v28 objects:v32 count:16];
    }

    while (v6);
  }

  else
  {
    uint64_t v21 = 0LL;
    uint64_t v22 = 0LL;
    uint64_t v24 = 0LL;
    uint64_t v25 = 0LL;
    uint64_t v7 = 0LL;
    uint64_t v8 = 0LL;
    uint64_t v9 = 0LL;
    uint64_t v10 = 0LL;
    uint64_t v11 = 0LL;
    uint64_t v23 = 0LL;
  }

  [v4 insertString:+[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"total=%lu, 6GHz(PSC)=%ld, 6GHz(NonPSC)=%ld, 5GHz(Active)=%ld, 5GHz(DFS)=%ld, 2GHz=%ld, ibss=%ld, hidden=%ld, passpoint=%ld, ph=%ld, airport=%ld\n\n\n", objc_msgSend(v20, "count"), v25, v24, v21, v22, v23, v7, v9, v10, v11, v8), 0 atIndex];
  return v4;
}

- (id)__logDiagnosticsPingResults:(id)a3
{
  id v5 = +[NSMutableString string](&OBJC_CLASS___NSMutableString, "string");
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  id obj = a3;
  id v24 = [a3 countByEnumeratingWithState:&v30 objects:v35 count:16];
  if (v24)
  {
    uint64_t v23 = *(void *)v31;
    do
    {
      uint64_t v6 = 0LL;
      do
      {
        if (*(void *)v31 != v23) {
          objc_enumerationMutation(obj);
        }
        uint64_t v7 = *(void **)(*((void *)&v30 + 1) + 8 * v6);
        id v8 = [v7 testID];
        id v9 = [v7 info];
        uint64_t v25 = v6;
        if (v8 == (id)53)
        {
          objc_msgSend( v5,  "appendString:",  -[W5LogManager __logDiagnosticsPingResults:]( self,  "__logDiagnosticsPingResults:",  objc_msgSend(v9, "objectForKeyedSubscript:", @"ConcurrentResults")));
        }

        else
        {
          id v10 = [v9 objectForKeyedSubscript:@"PingResult"];
          id v11 = objc_msgSend(objc_msgSend(v7, "info"), "objectForKeyedSubscript:", @"PingResults");
          id v12 = +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array");
          if ([v11 count]) {
            [v12 addObjectsFromArray:v11];
          }
          if (v10) {
            [v12 addObject:v10];
          }
          if ([v12 count])
          {
            __int128 v28 = 0u;
            __int128 v29 = 0u;
            __int128 v26 = 0u;
            __int128 v27 = 0u;
            id v13 = [v12 countByEnumeratingWithState:&v26 objects:v34 count:16];
            if (v13)
            {
              id v14 = v13;
              uint64_t v15 = *(void *)v27;
              do
              {
                for (int i = 0LL; i != v14; int i = (char *)i + 1)
                {
                  if (*(void *)v27 != v15) {
                    objc_enumerationMutation(v12);
                  }
                  unsigned int v17 = *(void **)(*((void *)&v26 + 1) + 8LL * (void)i);
                  [v5 appendString:@"————————————————————————————————————————————————————————————————————\n"];
                  dateFormatter = self->_dateFormatter;
                  [v17 startedAt];
                  id v19 = -[NSDateFormatter stringFromDate:]( dateFormatter,  "stringFromDate:",  +[NSDate dateWithTimeIntervalSinceReferenceDate:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceReferenceDate:"));
                  id v20 = self->_dateFormatter;
                  [v17 endedAt];
                  [v5 appendFormat:@"[%@ - %@]\n", v19, -[NSDateFormatter stringFromDate:]( v20, "stringFromDate:", +[NSDate dateWithTimeIntervalSinceReferenceDate:]( NSDate, "dateWithTimeIntervalSinceReferenceDate:"))];
                  [v5 appendFormat:@"%@\n", objc_msgSend(v17, "command")];
                  [v5 appendFormat:@"%@\n", objc_msgSend(v17, "output")];
                }

                id v14 = [v12 countByEnumeratingWithState:&v26 objects:v34 count:16];
              }

              while (v14);
            }
          }
        }

        uint64_t v6 = v25 + 1;
      }

      while ((id)(v25 + 1) != v24);
      id v24 = [obj countByEnumeratingWithState:&v30 objects:v35 count:16];
    }

    while (v24);
  }

  return v5;
}

- (id)__logDiagnosticsTestResults:(id)a3
{
  id v4 = +[NSMutableString string](&OBJC_CLASS___NSMutableString, "string");
  [v4 appendString:W5FormattedHeaderForDiagnosticsTestResults()];
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  id v5 = [a3 countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v21;
    do
    {
      for (int i = 0LL; i != v6; int i = (char *)i + 1)
      {
        if (*(void *)v21 != v7) {
          objc_enumerationMutation(a3);
        }
        id v9 = *(void **)(*((void *)&v20 + 1) + 8LL * (void)i);
        if ([v9 testID] == (id)53)
        {
          id v10 = objc_msgSend(objc_msgSend(v9, "info"), "objectForKeyedSubscript:", @"ConcurrentResults");
          __int128 v16 = 0u;
          __int128 v17 = 0u;
          __int128 v18 = 0u;
          __int128 v19 = 0u;
          id v11 = [v10 countByEnumeratingWithState:&v16 objects:v24 count:16];
          if (v11)
          {
            id v12 = v11;
            uint64_t v13 = *(void *)v17;
            do
            {
              for (j = 0LL; j != v12; j = (char *)j + 1)
              {
                if (*(void *)v17 != v13) {
                  objc_enumerationMutation(v10);
                }
                [v4 appendString:W5FormattedDescriptionForDiagnosticsTestResult(*(void *)(*((void *)&v16 + 1) + 8 * (void)j))];
              }

              id v12 = [v10 countByEnumeratingWithState:&v16 objects:v24 count:16];
            }

            while (v12);
          }
        }

        else
        {
          [v4 appendString:W5FormattedDescriptionForDiagnosticsTestResult(v9)];
        }
      }

      id v6 = [a3 countByEnumeratingWithState:&v20 objects:v25 count:16];
    }

    while (v6);
  }

  return v4;
}

+ (id)__logBTCProfile:(apple80211_btc_profile_osx *)a3
{
  id v4 = +[NSMutableString stringWithCapacity:](&OBJC_CLASS___NSMutableString, "stringWithCapacity:", 0LL);
  -[NSMutableString appendFormat:]( v4,  "appendFormat:",  @"      Mode                        : %@\n",  W5DescriptionForBTCMode(a3->var0));
  -[NSMutableString appendFormat:]( v4,  "appendFormat:",  @"      Desense                     : %@\n",  W5DescriptionForDesenseFlags(a3->var1));
  -[NSMutableString appendFormat:]( v4,  "appendFormat:",  @"      Desense Level               : %i\n",  a3->var2);
  -[NSMutableString appendFormat:]( v4,  "appendFormat:",  @"      Desense Thresh              : [%i,%i]\n",  a3->var4,  a3->var3);
  -[NSMutableString appendFormat:](v4, "appendFormat:", @"      Chain Ack                   : [");
  if (a3->var5)
  {
    unint64_t v5 = 0LL;
    do
    {
      if (a3->var6[v5] == 1) {
        id v6 = "On";
      }
      else {
        id v6 = "Off";
      }
      -[NSMutableString appendFormat:](v4, "appendFormat:", @"%s", v6);
      unsigned int var5 = a3->var5;
      if (v5 < var5 - 1)
      {
        -[NSMutableString appendString:](v4, "appendString:", @",");
        unsigned int var5 = a3->var5;
      }

      ++v5;
    }

    while (v5 < var5);
  }

  -[NSMutableString appendString:](v4, "appendString:", @"]\n");
  -[NSMutableString appendFormat:](v4, "appendFormat:", @"      Chain Tx Power Offset       : [");
  if (a3->var5)
  {
    unint64_t v8 = 0LL;
    do
    {
      -[NSMutableString appendFormat:](v4, "appendFormat:", @"%i", a3->var7[v8]);
      unsigned int v9 = a3->var5;
      if (v8 < v9 - 1)
      {
        -[NSMutableString appendString:](v4, "appendString:", @",");
        unsigned int v9 = a3->var5;
      }

      ++v8;
    }

    while (v8 < v9);
  }

  -[NSMutableString appendString:](v4, "appendString:", @"]\n");
  -[NSMutableString appendFormat:]( v4,  "appendFormat:",  @"      WiFi RSSI Thresh / Hyst     : %i/%i\n",  a3->var8,  a3->var9);
  -[NSMutableString appendFormat:]( v4,  "appendFormat:",  @"      BT RSSI Thresh / Hyst       : %i/%i\n",  a3->var10,  a3->var11);
  -[NSMutableString appendFormat:](v4, "appendFormat:", @"      SISO Resp Enable            : [");
  if (a3->var12)
  {
    unint64_t v10 = 0LL;
    do
    {
      -[NSMutableString appendFormat:](v4, "appendFormat:", @"%i", a3->var13[v10]);
      unsigned int var12 = a3->var12;
      if (v10 < var12 - 1)
      {
        -[NSMutableString appendString:](v4, "appendString:", @",");
        unsigned int var12 = a3->var12;
      }

      ++v10;
    }

    while (v10 < var12);
  }

  -[NSMutableString appendString:](v4, "appendString:", @"]\n");
  -[NSMutableString appendFormat:](v4, "appendFormat:", @"      Max SISO Resp Power         : [");
  if (a3->var12)
  {
    unint64_t v12 = 0LL;
    do
    {
      -[NSMutableString appendFormat:](v4, "appendFormat:", @"%i", a3->var14[v12]);
      unsigned int v13 = a3->var12;
      if (v12 < v13 - 1)
      {
        -[NSMutableString appendString:](v4, "appendString:", @",");
        unsigned int v13 = a3->var12;
      }

      ++v12;
    }

    while (v12 < v13);
  }

  -[NSMutableString appendString:](v4, "appendString:", @"]\n");
  return -[NSMutableString copy](v4, "copy");
}

+ (id)__logTxPower:(apple80211_per_chain_power_data_get *)a3
{
  id v4 = +[NSMutableString stringWithCapacity:](&OBJC_CLASS___NSMutableString, "stringWithCapacity:", 0LL);
  -[NSMutableString appendFormat:]( v4,  "appendFormat:",  @"      Current            : %i\n",  a3->var2);
  -[NSMutableString appendFormat:]( v4,  "appendFormat:",  @"      Offset             : %i\n",  a3->var1);
  -[NSMutableString appendFormat:]( v4,  "appendFormat:",  @"      Min                : %i\n",  a3->var3);
  -[NSMutableString appendFormat:]( v4,  "appendFormat:",  @"      Max                : %i\n",  a3->var4);
  return -[NSMutableString copy](v4, "copy");
}

+ (id)__logNetworkStatus:(id)a3
{
  id v4 = +[NSMutableString string](&OBJC_CLASS___NSMutableString, "string");
  if ([a3 primaryIPv4InterfaceName])
  {
    objc_msgSend( v4,  "appendFormat:",  @"    Primary IPv4         : %s (%s / %s)\n",  objc_msgSend(objc_msgSend(a3, "primaryIPv4InterfaceName"), "UTF8String"),  objc_msgSend(objc_msgSend(a3, "primaryIPv4ServiceName"), "UTF8String"),  objc_msgSend(objc_msgSend(a3, "primaryIPv4ServiceID"), "UTF8String"));
    id v5 = [a3 primaryIPv4Addresses];
    __int128 v25 = 0u;
    __int128 v26 = 0u;
    __int128 v27 = 0u;
    __int128 v28 = 0u;
    id v6 = [v5 countByEnumeratingWithState:&v25 objects:v30 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v26;
      do
      {
        for (int i = 0LL; i != v7; int i = (char *)i + 1)
        {
          if (*(void *)v26 != v8) {
            objc_enumerationMutation(v5);
          }
          objc_msgSend( v4,  "appendFormat:",  @"                         : %s\n",  objc_msgSend(*(id *)(*((void *)&v25 + 1) + 8 * (void)i), "UTF8String"));
        }

        id v7 = [v5 countByEnumeratingWithState:&v25 objects:v30 count:16];
      }

      while (v7);
    }
  }

  else
  {
    [v4 appendFormat:@"    Primary IPv4         : None\n"];
  }

  if ([a3 primaryIPv6InterfaceName])
  {
    objc_msgSend( v4,  "appendFormat:",  @"    Primary IPv6         : %s (%s / %s)\n",  objc_msgSend(objc_msgSend(a3, "primaryIPv6InterfaceName"), "UTF8String"),  objc_msgSend(objc_msgSend(a3, "primaryIPv6ServiceName"), "UTF8String"),  objc_msgSend(objc_msgSend(a3, "primaryIPv6ServiceID"), "UTF8String"));
    id v10 = [a3 primaryIPv6Addresses];
    __int128 v21 = 0u;
    __int128 v22 = 0u;
    __int128 v23 = 0u;
    __int128 v24 = 0u;
    id v11 = [v10 countByEnumeratingWithState:&v21 objects:v29 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v22;
      do
      {
        for (j = 0LL; j != v12; j = (char *)j + 1)
        {
          if (*(void *)v22 != v13) {
            objc_enumerationMutation(v10);
          }
          objc_msgSend( v4,  "appendFormat:",  @"                         : %s\n",  objc_msgSend(*(id *)(*((void *)&v21 + 1) + 8 * (void)j), "UTF8String"));
        }

        id v12 = [v10 countByEnumeratingWithState:&v21 objects:v29 count:16];
      }

      while (v12);
    }
  }

  else
  {
    [v4 appendFormat:@"    Primary IPv6         : None\n"];
  }

  id v15 = [a3 primaryDNSAddresses];
  if ([v15 count])
  {
    objc_msgSend( v4,  "appendFormat:",  @"    DNS Addresses        : %s\n",  objc_msgSend(objc_msgSend(v15, "firstObject"), "UTF8String"));
    if ((unint64_t)[v15 count] >= 2 && (unint64_t)objc_msgSend(v15, "count") >= 2)
    {
      unint64_t v16 = 1LL;
      do
        objc_msgSend( v4,  "appendFormat:",  @"                         : %s\n",  objc_msgSend(objc_msgSend(v15, "objectAtIndexedSubscript:", v16++), "UTF8String"));
      while (v16 < (unint64_t)[v15 count]);
    }
  }

  else
  {
    [v4 appendFormat:@"    DNS Addresses        : None\n"];
  }

  __int128 v17 = "Not Reachable";
  if (([a3 isAppleReachable] & 2) != 0
    && ([a3 isAppleReachable] & 4) == 0)
  {
    __int128 v17 = "Reachable";
  }

  id v18 = [a3 isAppleReachable];
  __int128 v19 = " (WWAN)";
  objc_msgSend(v4, "appendFormat:", @"    Apple                : %s%s\n", v17, v19);
  return v4;
}

+ (id)__logWiFiStatus:(id)a3
{
  id v5 = +[NSMutableString string](&OBJC_CLASS___NSMutableString, "string");
  objc_msgSend( v5,  "appendFormat:",  @"    MAC Address          : %s (hw=%s)\n",  objc_msgSend(objc_msgSend(a3, "macAddress"), "UTF8String"),  objc_msgSend(objc_msgSend(a3, "hardwareMACAddress"), "UTF8String"));
  objc_msgSend( v5,  "appendFormat:",  @"    Interface Name       : %s\n",  objc_msgSend(objc_msgSend(a3, "interfaceName"), "UTF8String"));
  else {
    id v6 = "Off";
  }
  if (objc_msgSend(objc_msgSend(a3, "power"), "length") == (id)24) {
    id v7 = objc_msgSend(objc_msgSend(a3, "power"), "bytes");
  }
  else {
    id v7 = 0LL;
  }
  [v5 appendFormat:@"    Power                : %s [%@]\n", v6, W5DescriptionForPower(v7)];
  objc_msgSend( v5,  "appendFormat:",  @"    Op Mode              : %s\n",  objc_msgSend((id)W5DescriptionForOpMode(objc_msgSend(a3, "opMode")), "UTF8String"));
  if (objc_msgSend(objc_msgSend(a3, "ssidString"), "UTF8String")) {
    uint64_t v8 = (const char *)objc_msgSend(objc_msgSend(a3, "ssidString"), "UTF8String");
  }
  else {
    uint64_t v8 = "None";
  }
  objc_msgSend(v5, "appendFormat:", @"    SSID                 : %s\n", v8);
  if (objc_msgSend(objc_msgSend(a3, "bssid"), "UTF8String")) {
    unsigned int v9 = (const char *)objc_msgSend(objc_msgSend(a3, "bssid"), "UTF8String");
  }
  else {
    unsigned int v9 = "None";
  }
  objc_msgSend(v5, "appendFormat:", @"    BSSID                : %s\n", v9);
  objc_msgSend(v5, "appendFormat:", @"    RSSI                 : %i dBm\n", objc_msgSend(a3, "rssi"));
  objc_msgSend(v5, "appendFormat:", @"    Noise                : %i dBm\n", objc_msgSend(a3, "noise"));
  [a3 txRate];
  objc_msgSend(v5, "appendFormat:", @"    Tx Rate              : %.1f Mbps\n", v10);
  if ([a3 ssid]) {
    objc_msgSend( v5,  "appendFormat:",  @"    Security             : %s\n",  objc_msgSend((id)W5DescriptionForSecurity(objc_msgSend(a3, "security")), "UTF8String"));
  }
  else {
    objc_msgSend(v5, "appendFormat:", @"    Security             : None\n", v55);
  }
  if ([a3 security] == (id)12
    || [a3 security] == (id)11
    || [a3 security] == (id)9
    || [a3 security] == (id)10
    || [a3 security] == (id)8)
  {
    objc_msgSend( v5,  "appendFormat:",  @"    802.1X Mode          : %s\n",  objc_msgSend((id)W5DescriptionForEAPOLControlMode(objc_msgSend(a3, "eapolControlMode")), "UTF8String"));
    objc_msgSend( v5,  "appendFormat:",  @"    802.1X Supplicant    : %s\n",  objc_msgSend((id)W5DescriptionForEAPOLSupplicantState(objc_msgSend(a3, "eapolSupplicantState")), "UTF8String"));
  }

  objc_msgSend( v5,  "appendFormat:",  @"    PHY Mode             : %s\n",  objc_msgSend((id)W5DescriptionForPHYMode(objc_msgSend(a3, "phyMode")), "UTF8String"));
  objc_msgSend(v5, "appendFormat:", @"    MCS Index            : %i\n", objc_msgSend(a3, "mcsIndex"));
  id v11 = [a3 ssid];
  if (v11) {
    id v11 = [a3 guardInterval];
  }
  objc_msgSend(v5, "appendFormat:", @"    Guard Interval       : %i\n", v11);
  objc_msgSend( v5,  "appendFormat:",  @"    NSS                  : %i\n",  objc_msgSend(a3, "numberOfSpacialStreams"));
  if (objc_msgSend((id)W5DescriptionForChannel(objc_msgSend(a3, "channel")), "UTF8String")) {
    id v12 = (const char *)objc_msgSend((id)W5DescriptionForChannel(objc_msgSend(a3, "channel")), "UTF8String");
  }
  else {
    id v12 = "None";
  }
  objc_msgSend(v5, "appendFormat:", @"    Channel              : %s\n", v12);
  objc_msgSend( v5,  "appendFormat:",  @"    Country Code         : %s\n",  objc_msgSend(objc_msgSend(a3, "countryCode"), "UTF8String"));
  if (objc_msgSend(objc_msgSend(a3, "networkServiceID"), "UTF8String")) {
    uint64_t v13 = (const char *)objc_msgSend(objc_msgSend(a3, "networkServiceID"), "UTF8String");
  }
  else {
    uint64_t v13 = "None";
  }
  objc_msgSend(v5, "appendFormat:", @"    NetworkServiceID     : %s\n", v13);
  objc_msgSend( v5,  "appendFormat:",  @"    IPv4 Config Method   : %s\n",  objc_msgSend((id)W5DescriptionForIPv4ConfigMethod(objc_msgSend(a3, "ipv4ConfigMethod")), "UTF8String"));
  if (objc_msgSend(objc_msgSend(objc_msgSend(a3, "ipv4Addresses"), "firstObject"), "UTF8String")) {
    id v14 = (const char *)objc_msgSend(objc_msgSend(objc_msgSend(a3, "ipv4Addresses"), "firstObject"), "UTF8String");
  }
  else {
    id v14 = "None";
  }
  objc_msgSend(v5, "appendFormat:", @"    IPv4 Address         : %s\n", v14);
  if ((unint64_t)objc_msgSend(objc_msgSend(a3, "ipv4Addresses"), "count") >= 2)
  {
    unint64_t v15 = 1LL;
    do
      printf( "                         : %s\n",  (const char *)objc_msgSend( objc_msgSend(objc_msgSend(a3, "ipv4Addresses"), "objectAtIndexedSubscript:", v15++),  "UTF8String"));
    while (v15 < (unint64_t)objc_msgSend(objc_msgSend(a3, "ipv4Addresses"), "count"));
  }

  if (objc_msgSend(objc_msgSend(a3, "ipv4RouterAddress"), "UTF8String")) {
    unint64_t v16 = (const char *)objc_msgSend(objc_msgSend(a3, "ipv4RouterAddress"), "UTF8String");
  }
  else {
    unint64_t v16 = "None";
  }
  objc_msgSend(v5, "appendFormat:", @"    IPv4 Router          : %s\n", v16);
  objc_msgSend( v5,  "appendFormat:",  @"    IPv6 Config Method   : %s\n",  objc_msgSend((id)W5DescriptionForIPv6ConfigMethod(objc_msgSend(a3, "ipv6ConfigMethod")), "UTF8String"));
  if (objc_msgSend(objc_msgSend(objc_msgSend(a3, "ipv6Addresses"), "firstObject"), "UTF8String")) {
    __int128 v17 = (const char *)objc_msgSend(objc_msgSend(objc_msgSend(a3, "ipv6Addresses"), "firstObject"), "UTF8String");
  }
  else {
    __int128 v17 = "None";
  }
  objc_msgSend(v5, "appendFormat:", @"    IPv6 Address         : %s\n", v17);
  if ((unint64_t)objc_msgSend(objc_msgSend(a3, "ipv6Addresses"), "count") >= 2)
  {
    unint64_t v18 = 1LL;
    do
      printf( "                         : %s\n",  (const char *)objc_msgSend( objc_msgSend(objc_msgSend(a3, "ipv6Addresses"), "objectAtIndexedSubscript:", v18++),  "UTF8String"));
    while (v18 < (unint64_t)objc_msgSend(objc_msgSend(a3, "ipv6Addresses"), "count"));
  }

  if (objc_msgSend(objc_msgSend(a3, "ipv6RouterAddress"), "UTF8String")) {
    __int128 v19 = (const char *)objc_msgSend(objc_msgSend(a3, "ipv6RouterAddress"), "UTF8String");
  }
  else {
    __int128 v19 = "None";
  }
  objc_msgSend(v5, "appendFormat:", @"    IPv6 Router          : %s\n", v19);
  if (objc_msgSend(objc_msgSend(objc_msgSend(a3, "dnsAddresses"), "firstObject"), "UTF8String")) {
    __int128 v20 = (const char *)objc_msgSend(objc_msgSend(objc_msgSend(a3, "dnsAddresses"), "firstObject"), "UTF8String");
  }
  else {
    __int128 v20 = "None";
  }
  objc_msgSend(v5, "appendFormat:", @"    DNS                  : %s\n", v20);
  if ((unint64_t)objc_msgSend(objc_msgSend(a3, "dnsAddresses"), "count") >= 2)
  {
    unint64_t v21 = 1LL;
    do
      objc_msgSend( v5,  "appendFormat:",  @"                         : %s\n",  objc_msgSend(objc_msgSend(objc_msgSend(a3, "dnsAddresses"), "objectAtIndexedSubscript:", v21++), "UTF8String"));
    while (v21 < (unint64_t)objc_msgSend(objc_msgSend(a3, "dnsAddresses"), "count"));
  }

  objc_msgSend( v5,  "appendFormat:",  @"    BTC Mode             : %s\n",  objc_msgSend((id)W5DescriptionForBTCMode(objc_msgSend(a3, "btcMode")), "UTF8String"));
  if ([a3 desense])
  {
    if (objc_msgSend(objc_msgSend(a3, "desense"), "length") == (id)16) {
      id v22 = objc_msgSend(objc_msgSend(a3, "desense"), "bytes");
    }
    else {
      id v22 = 0LL;
    }
    if (objc_msgSend(objc_msgSend(a3, "desenseLevel"), "length") == (id)8) {
      id v24 = objc_msgSend(objc_msgSend(a3, "desenseLevel"), "bytes");
    }
    else {
      id v24 = 0LL;
    }
    id v56 = objc_msgSend((id)W5DescriptionForDesense(v22, v24), "UTF8String");
    __int128 v23 = @"    Desense              : %s\n";
  }

  else
  {
    __int128 v23 = @"    Desense              : Unavailable\n";
  }

  objc_msgSend(v5, "appendFormat:", v23, v56);
  if ([a3 chainAck])
  {
    if (objc_msgSend(objc_msgSend(a3, "chainAck"), "length") == (id)24) {
      id v25 = objc_msgSend(objc_msgSend(a3, "chainAck"), "bytes");
    }
    else {
      id v25 = 0LL;
    }
    id v57 = [(id)W5DescriptionForChainAck(v25) UTF8String];
    __int128 v26 = @"    Chain Ack            : [%s]\n";
  }

  else
  {
    __int128 v26 = @"    Chain Ack            : Unavailable\n";
  }

  objc_msgSend(v5, "appendFormat:", v26, v57);
  if ([a3 txChainPower])
  {
    objc_msgSend(objc_msgSend(a3, "txChainPower"), "length");
    if (*((_DWORD *)objc_msgSend(objc_msgSend(a3, "txChainPower"), "bytes") + 1))
    {
      objc_msgSend(objc_msgSend(a3, "txChainPower"), "length");
      if (*((_DWORD *)objc_msgSend(objc_msgSend(a3, "txChainPower"), "bytes") + 1))
      {
        unint64_t v27 = 0LL;
        uint64_t v28 = 8LL;
        do
        {
          objc_msgSend(objc_msgSend(a3, "txChainPower"), "length");
          objc_msgSend( v5,  "appendFormat:",  @"    Tx Power [%lu]         : %s\n",  v27,  objc_msgSend( (id)W5DescriptionForChainPowerState(*(unsigned int *)((char *)objc_msgSend( objc_msgSend(a3, "txChainPower"),  "bytes")
                                                                  + v28)),
              "UTF8String"));
          if (objc_msgSend(objc_msgSend(a3, "txChainPower"), "length") == (id)88) {
            __int128 v29 = (char *)objc_msgSend(objc_msgSend(a3, "txChainPower"), "bytes");
          }
          else {
            __int128 v29 = 0LL;
          }
          __int128 v30 = *(_OWORD *)&v29[v28];
          LODWORD(v59) = *(_DWORD *)&v29[v28 + 16];
          __int128 v58 = v30;
          objc_msgSend( v5,  "appendFormat:",  @"%s",  objc_msgSend(objc_msgSend(a1, "__logTxPower:", &v58), "UTF8String"));
          ++v27;
          objc_msgSend(objc_msgSend(a3, "txChainPower"), "length");
          v28 += 20LL;
        }

        while (v27 < *((int *)objc_msgSend(objc_msgSend(a3, "txChainPower"), "bytes") + 1));
      }
    }
  }

  if ([a3 btcProfiles2GHz])
  {
    objc_msgSend(objc_msgSend(a3, "btcProfiles2GHz"), "length");
    if (*((_DWORD *)objc_msgSend(objc_msgSend(a3, "btcProfiles2GHz"), "bytes") + 2))
    {
      unint64_t v31 = 0LL;
      uint64_t v32 = 12LL;
      do
      {
        objc_msgSend(objc_msgSend(a3, "btcConfig"), "length");
        if (*((_DWORD *)objc_msgSend(objc_msgSend(a3, "btcConfig"), "bytes") + 1))
        {
          objc_msgSend(objc_msgSend(a3, "btcConfig"), "length");
          if (v31 == *((_DWORD *)objc_msgSend(objc_msgSend(a3, "btcConfig"), "bytes") + 2)) {
            __int128 v33 = "Active";
          }
          else {
            __int128 v33 = "Inactive";
          }
        }

        else
        {
          __int128 v33 = "Inactive";
        }

        objc_msgSend(v5, "appendFormat:", @"    BTC Profile 2.4GHz [%lu]        : %s\n", v31, v33);
        if (objc_msgSend(objc_msgSend(a3, "btcProfiles2GHz"), "length") == (id)572) {
          uint64_t v34 = (char *)objc_msgSend(objc_msgSend(a3, "btcProfiles2GHz"), "bytes");
        }
        else {
          uint64_t v34 = 0LL;
        }
        __int128 v58 = *(_OWORD *)&v34[v32];
        __int128 v35 = *(_OWORD *)&v34[v32 + 16];
        __int128 v36 = *(_OWORD *)&v34[v32 + 32];
        __int128 v37 = *(_OWORD *)&v34[v32 + 64];
        __int128 v61 = *(_OWORD *)&v34[v32 + 48];
        __int128 v62 = v37;
        __int128 v59 = v35;
        __int128 v60 = v36;
        __int128 v38 = *(_OWORD *)&v34[v32 + 80];
        __int128 v39 = *(_OWORD *)&v34[v32 + 96];
        __int128 v40 = *(_OWORD *)&v34[v32 + 112];
        *(_OWORD *)&v65[12] = *(_OWORD *)&v34[v32 + 124];
        __int128 v64 = v39;
        *(_OWORD *)id v65 = v40;
        __int128 v63 = v38;
        objc_msgSend( v5,  "appendFormat:",  @"%s",  objc_msgSend(objc_msgSend(a1, "__logBTCProfile:", &v58), "UTF8String"));
        ++v31;
        objc_msgSend(objc_msgSend(a3, "btcProfiles2GHz"), "length");
        v32 += 140LL;
      }

      while (v31 < *((unsigned int *)objc_msgSend(objc_msgSend(a3, "btcProfiles2GHz"), "bytes") + 2));
    }
  }

  if ([a3 btcProfiles5GHz])
  {
    objc_msgSend(objc_msgSend(a3, "btcProfiles5GHz"), "length");
    if (*((_DWORD *)objc_msgSend(objc_msgSend(a3, "btcProfiles5GHz"), "bytes") + 2))
    {
      unint64_t v41 = 0LL;
      uint64_t v42 = 12LL;
      do
      {
        objc_msgSend(objc_msgSend(a3, "btcConfig"), "length");
        if (*((_DWORD *)objc_msgSend(objc_msgSend(a3, "btcConfig"), "bytes") + 3))
        {
          objc_msgSend(objc_msgSend(a3, "btcConfig"), "length");
          if (v41 == *((_DWORD *)objc_msgSend(objc_msgSend(a3, "btcConfig"), "bytes") + 4)) {
            __int16 v43 = "Active";
          }
          else {
            __int16 v43 = "Inactive";
          }
        }

        else
        {
          __int16 v43 = "Inactive";
        }

        objc_msgSend(v5, "appendFormat:", @"    BTC Profile 5GHz [%lu]          : %s\n", v41, v43);
        if (objc_msgSend(objc_msgSend(a3, "btcProfiles5GHz"), "length") == (id)572) {
          uint64_t v44 = (char *)objc_msgSend(objc_msgSend(a3, "btcProfiles5GHz"), "bytes");
        }
        else {
          uint64_t v44 = 0LL;
        }
        __int128 v58 = *(_OWORD *)&v44[v42];
        __int128 v45 = *(_OWORD *)&v44[v42 + 16];
        __int128 v46 = *(_OWORD *)&v44[v42 + 32];
        __int128 v47 = *(_OWORD *)&v44[v42 + 64];
        __int128 v61 = *(_OWORD *)&v44[v42 + 48];
        __int128 v62 = v47;
        __int128 v59 = v45;
        __int128 v60 = v46;
        __int128 v48 = *(_OWORD *)&v44[v42 + 80];
        __int128 v49 = *(_OWORD *)&v44[v42 + 96];
        __int128 v50 = *(_OWORD *)&v44[v42 + 112];
        *(_OWORD *)&v65[12] = *(_OWORD *)&v44[v42 + 124];
        __int128 v64 = v49;
        *(_OWORD *)id v65 = v50;
        __int128 v63 = v48;
        objc_msgSend( v5,  "appendFormat:",  @"%s",  objc_msgSend(objc_msgSend(a1, "__logBTCProfile:", &v58), "UTF8String"));
        ++v41;
        objc_msgSend(objc_msgSend(a3, "btcProfiles5GHz"), "length");
        v42 += 140LL;
      }

      while (v41 < *((unsigned int *)objc_msgSend(objc_msgSend(a3, "btcProfiles5GHz"), "bytes") + 2));
    }
  }

  else {
    uint64_t v51 = "Not Supported";
  }
  objc_msgSend( v5,  "appendFormat:",  @"    SmartCCA/Desense     : %s (USB=%d)\n",  v51,  objc_msgSend(a3, "smartCCADesenseUSBPresence"));
  unsigned int v52 = objc_msgSend(objc_msgSend(a3, "capabilities"), "containsObject:", &off_1000DF708);
  uint64_t v53 = "No";
  if (v52) {
    uint64_t v53 = "Yes";
  }
  objc_msgSend(v5, "appendFormat:", @"    Supports 6e          : %s\n", v53);
  objc_msgSend( v5,  "appendFormat:",  @"    Supported Channels   : %s\n",  objc_msgSend( objc_msgSend(objc_msgSend(a3, "supportedChannels"), "componentsJoinedByString:", @","),  "UTF8String"));
  return v5;
}

+ (id)__logBluetoothStatus:(id)a3
{
  id v4 = +[NSMutableString string](&OBJC_CLASS___NSMutableString, "string");
  unsigned int v5 = [a3 powerOn];
  id v6 = "Off";
  if (v5) {
    id v6 = "On";
  }
  objc_msgSend(v4, "appendFormat:", @"    Power                : %s\n", v6);
  if (objc_msgSend(objc_msgSend(a3, "address"), "UTF8String")) {
    id v7 = (const char *)objc_msgSend(objc_msgSend(a3, "address"), "UTF8String");
  }
  else {
    id v7 = "None";
  }
  objc_msgSend(v4, "appendFormat:", @"    MAC Address          : %s\n", v7);
  uint64_t v8 = "No";
  unsigned int v9 = "Yes";
  else {
    uint64_t v10 = "No";
  }
  objc_msgSend(v4, "appendFormat:", @"    Discoverable         : %s\n", v10);
  else {
    id v11 = "No";
  }
  objc_msgSend(v4, "appendFormat:", @"    Connectable          : %s\n", v11);
  else {
    id v12 = "No";
  }
  objc_msgSend(v4, "appendFormat:", @"    Scanning             : %s\n", v12);
  __int128 v55 = 0u;
  __int128 v56 = 0u;
  __int128 v53 = 0u;
  __int128 v54 = 0u;
  id v45 = a3;
  id obj = [a3 devices];
  id v13 = [obj countByEnumeratingWithState:&v53 objects:v58 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = 0LL;
    uint64_t v16 = 0LL;
    uint64_t v17 = 0LL;
    uint64_t v18 = *(void *)v54;
    do
    {
      for (int i = 0LL; i != v14; int i = (char *)i + 1)
      {
        if (*(void *)v54 != v18) {
          objc_enumerationMutation(obj);
        }
        __int128 v20 = *(void **)(*((void *)&v53 + 1) + 8LL * (void)i);
        v17 += [v20 isPaired];
        v16 += [v20 isCloudPaired];
        v15 += [v20 isConnected];
      }

      id v14 = [obj countByEnumeratingWithState:&v53 objects:v58 count:16];
    }

    while (v14);
  }

  else
  {
    uint64_t v15 = 0LL;
    uint64_t v16 = 0LL;
    uint64_t v17 = 0LL;
  }

  objc_msgSend( v4,  "appendFormat:",  @"    Devices              : %lu (paired=%lu cloud=%lu connected=%lu)\n\n",  objc_msgSend(objc_msgSend(v45, "devices"), "count"),  v17,  v16,  v15);
  __int128 v51 = 0u;
  __int128 v52 = 0u;
  __int128 v49 = 0u;
  __int128 v50 = 0u;
  id obja = [v45 devices];
  id v21 = [obja countByEnumeratingWithState:&v49 objects:v57 count:16];
  if (v21)
  {
    id v22 = v21;
    __int128 v23 = @"    %@\n";
    id v24 = @"    Address          : %@\n";
    uint64_t v25 = *(void *)v50;
    __int128 v26 = @"    Paired           : %s\n";
    __int128 v46 = v4;
    do
    {
      for (j = 0LL; j != v22; j = (char *)j + 1)
      {
        if (*(void *)v50 != v25) {
          objc_enumerationMutation(obja);
        }
        uint64_t v28 = *(void **)(*((void *)&v49 + 1) + 8LL * (void)j);
        objc_msgSend(v4, "appendFormat:", v23, objc_msgSend(v28, "name"));
        objc_msgSend(v4, "appendFormat:", v24, objc_msgSend(v28, "address"));
        else {
          __int128 v29 = v8;
        }
        objc_msgSend(v4, "appendFormat:", v26, v29);
        else {
          __int128 v30 = v8;
        }
        objc_msgSend(v4, "appendFormat:", @"    CloudPaired      : %s\n", v30);
        else {
          unint64_t v31 = v8;
        }
        objc_msgSend(v4, "appendFormat:", @"    Connected        : %s\n", v31);
        if ([v28 isConnected])
        {
          id v32 = v22;
          uint64_t v33 = v25;
          uint64_t v34 = v9;
          __int128 v35 = v8;
          __int128 v36 = v26;
          __int128 v37 = v24;
          __int128 v38 = v23;
          id v39 = [v28 majorClass];
          id v40 = [v28 minorClass];
          id v41 = v39;
          __int128 v23 = v38;
          id v24 = v37;
          __int128 v26 = v36;
          uint64_t v8 = v35;
          unsigned int v9 = v34;
          uint64_t v25 = v33;
          id v22 = v32;
          id v4 = v46;
          [v46 appendFormat:@"    Type             : %@\n", W5DescriptionForBluetoothDeviceType(v41, v40)];
          else {
            uint64_t v42 = v8;
          }
          objc_msgSend(v46, "appendFormat:", @"    LE               : %s\n", v42);
          else {
            __int16 v43 = v8;
          }
          objc_msgSend(v46, "appendFormat:", @"    Apple            : %s\n", v43);
        }

        [v4 appendString:@"\n"];
      }

      id v22 = [obja countByEnumeratingWithState:&v49 objects:v57 count:16];
    }

    while (v22);
  }

  return v4;
}

- (id)__logAWDLStatus:(id)a3
{
  id v5 = +[NSMutableString string](&OBJC_CLASS___NSMutableString, "string");
  id v6 = -[W5StatusManager corewifi](self->_status, "corewifi");
  [v5 appendFormat:@"IPv6: %@\n\n", objc_msgSend(objc_msgSend(-[CWFInterface AWDL](v6, "AWDL"), "IPv6Addresses"), "firstObject")];
  [v5 appendFormat:@"AirDrop Discoverable Mode: %@\n\n", W5DescriptionForAirDropDiscoverableMode(objc_msgSend(a3, "airDropDiscoverableMode"))];
  DWORD2(v49) = 0;
  *(void *)&__int128 v49 = 0LL;
  objc_msgSend(-[CWFInterface AWDLSyncEnabled](v6, "AWDLSyncEnabled"), "getBytes:length:", &v49, 12);
  if (DWORD2(v49)) {
    id v7 = "enabled";
  }
  else {
    id v7 = "disabled";
  }
  [v5 appendString:+[NSString stringWithFormat:](NSString, "stringWithFormat:", @"awdl is %s\n", v7)];
  *(void *)&__int128 v49 = 0LL;
  objc_msgSend(-[CWFInterface AWDLOpMode](v6, "AWDLOpMode"), "getBytes:length:", &v49, 8);
  if (DWORD1(v49) <= 2) {
    uint64_t v8 = (&off_1000D2F80)[DWORD1(v49)];
  }
  else {
    uint64_t v8 = "UNKNOWN";
  }
  [v5 appendString:+[NSString stringWithFormat:](NSString, "stringWithFormat:", @"awdl mode = %s\n", v8)];
  *(void *)&__int128 v60 = 0LL;
  __int128 v58 = 0u;
  __int128 v59 = 0u;
  __int128 v56 = 0u;
  __int128 v57 = 0u;
  __int128 v54 = 0u;
  __int128 v55 = 0u;
  __int128 v52 = 0u;
  __int128 v53 = 0u;
  __int128 v50 = 0u;
  __int128 v51 = 0u;
  __int128 v49 = 0u;
  objc_msgSend( -[CWFInterface AWDLPeerTrafficRegistration](v6, "AWDLPeerTrafficRegistration"),  "getBytes:length:",  &v49,  184);
  if (DWORD2(v59))
  {
    unsigned int v9 = " FAVOR INFRA HINT";
    if (!HIDWORD(v59)) {
      unsigned int v9 = " NO HINT";
    }
    uint64_t v10 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"traffic registration found for peer (hint=%x%s) %02x:%02x:%02x:%02x:%02x:%02x \n",  HIDWORD(v59),  v9,  BYTE4(v49),  BYTE5(v49),  BYTE6(v49),  BYTE7(v49),  BYTE8(v49),  BYTE9(v49));
  }

  else
  {
    uint64_t v10 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"no peer traffic registration active\n",  v39,  v40,  v41,  v42,  v43,  v44,  v45,  v46);
  }

  [v5 appendString:v10];
  *(void *)&__int128 v49 = 0LL;
  objc_msgSend(-[CWFInterface AWDLMasterChannel](v6, "AWDLMasterChannel"), "getBytes:length:", &v49, 8);
  [v5 appendString:+[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"awdl master channel = %u\n", DWORD1(v49))];
  *(void *)&__int128 v49 = 0LL;
  objc_msgSend( -[CWFInterface AWDLSecondaryMasterChannel](v6, "AWDLSecondaryMasterChannel"),  "getBytes:length:",  &v49,  8);
  [v5 appendString:+[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"awdl secondary master channel = %u\n", DWORD1(v49))];
  id v11 = +[NSMutableString string](&OBJC_CLASS___NSMutableString, "string");
  __int128 v72 = 0u;
  __int128 v73 = 0u;
  __int128 v70 = 0u;
  __int128 v71 = 0u;
  __int128 v68 = 0u;
  __int128 v69 = 0u;
  __int128 v66 = 0u;
  __int128 v67 = 0u;
  __int128 v64 = 0u;
  __int128 v65 = 0u;
  __int128 v62 = 0u;
  __int128 v63 = 0u;
  __int128 v60 = 0u;
  __int128 v61 = 0u;
  __int128 v58 = 0u;
  __int128 v59 = 0u;
  __int128 v56 = 0u;
  __int128 v57 = 0u;
  __int128 v54 = 0u;
  __int128 v55 = 0u;
  __int128 v52 = 0u;
  __int128 v53 = 0u;
  __int128 v50 = 0u;
  __int128 v51 = 0u;
  __int128 v49 = 0u;
  objc_msgSend(-[CWFInterface AWDLSyncChannelSequence](v6, "AWDLSyncChannelSequence"), "getBytes:length:", &v49, 400);
  objc_msgSend( v11,  "appendFormat:",  @"awdl channel sequence: strategy %u, step count %u, encoding %u, length=%u, duplicate=%u, fill=%u\n",  HIDWORD(v73),  BYTE7(v49),  BYTE6(v49),  BYTE5(v49),  BYTE8(v49),  BYTE9(v49));
  if (BYTE5(v49))
  {
    unint64_t v12 = 0LL;
    id v13 = (unsigned int *)&v50;
    while (1)
    {
      objc_msgSend(v11, "appendFormat:", @"%u", *v13);
      if (*v13)
      {
        unsigned int v14 = v13[1];
        uint64_t v15 = @"++";
        if ((v14 & 0x400) != 0) {
          goto LABEL_20;
        }
        if ((v14 & 4) != 0) {
          break;
        }
      }

- (id)__pingWithAddress:(id)a3 count:(int64_t)a4 timeout:(double)a5 wait:(double)a6 interval:(double)a7 trafficClass:(id)a8 interfaceName:(id)a9 dataLength:(unint64_t)a10
{
  id v10 = 0LL;
  if (a3 && a4 <= 2147483646 && a5 < 2147483650.0 && a9 != 0LL)
  {
    if (a8 && (uint64_t v20 = W5DescriptionForPingTrafficClass([a8 integerValue])) != 0)
    {
      uint64_t v21 = v20;
      v35[0] = @"-c";
      v35[1] = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%ld", a4);
      void v35[2] = @"-b";
      void v35[3] = a9;
      v35[4] = @"-k";
      v35[5] = v21;
      void v35[6] = @"-i";
      v35[7] = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%.1f", *(void *)&a7);
      v35[8] = @"-t";
      v35[9] = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%.2f", *(void *)&a5);
      v35[10] = @"-W";
      v35[11] = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%ld",  (uint64_t)(a6 * 1000.0));
      v35[12] = @"-s";
      v35[13] = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%ld", a10 + 56);
      v35[14] = a3;
      id v22 = v35;
      uint64_t v23 = 15LL;
    }

    else
    {
      v34[0] = @"-c";
      v34[1] = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%ld", a4);
      void v34[2] = @"-b";
      void v34[3] = a9;
      void v34[4] = @"-i";
      v34[5] = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%.1f", *(void *)&a7);
      void v34[6] = @"-t";
      v34[7] = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%.2f", *(void *)&a5);
      v34[8] = @"-W";
      v34[9] = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%ld",  (uint64_t)(a6 * 1000.0));
      v34[10] = @"-s";
      v34[11] = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%ld", a10 + 56);
      v34[12] = a3;
      id v22 = v34;
      uint64_t v23 = 13LL;
    }

    id v24 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v22, v23);
    +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
    double v26 = v25;
    unint64_t v27 = +[NSMutableData dataWithCapacity:](&OBJC_CLASS___NSMutableData, "dataWithCapacity:", 0LL);
    +[NSTask runTaskWithLaunchPath:arguments:outputData:error:]( &OBJC_CLASS___NSTask,  "runTaskWithLaunchPath:arguments:outputData:error:",  @"/sbin/ping",  v24,  v27,  0LL);
    id v10 = objc_alloc_init(&OBJC_CLASS___W5PingResult);
    [v10 setInterfaceName:a9];
    [v10 setAddress:a3];
    [v10 setCount:a4];
    [v10 setTimeout:a5];
    [v10 setWait:a6];
    [v10 setInterval:a7];
    objc_msgSend(v10, "setTrafficClass:", objc_msgSend(a8, "integerValue"));
    [v10 setDataLength:a10];
    [v10 setStartedAt:v26];
    +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
    objc_msgSend(v10, "setEndedAt:");
    [v10 setCommand:+[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"/sbin/ping %@", -[NSArray componentsJoinedByString:](v24, "componentsJoinedByString:", @" "))];
    objc_msgSend( v10,  "setOutput:",  -[NSString initWithData:encoding:]([NSString alloc], "initWithData:encoding:", v27, 4));
    +[W5LogManager __parsePingOutput:result:](&OBJC_CLASS___W5LogManager, "__parsePingOutput:result:", v27, v10);
    if (v10)
    {
      uint64_t v28 = objc_alloc_init(&OBJC_CLASS___W5Event);
      -[W5Event setEventID:](v28, "setEventID:", 34LL);
      [v10 endedAt];
      -[W5Event setTimestamp:](v28, "setTimestamp:");
      id v32 = @"PingResult";
      id v33 = v10;
      -[W5Event setInfo:]( v28,  "setInfo:",  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v33,  &v32,  1LL));
      pingCallback = (void (**)(id, W5Event *))self->_pingCallback;
      if (pingCallback) {
        pingCallback[2](pingCallback, v28);
      }
    }
  }

  return v10;
}

- (id)__ping6WithAddress:(id)a3 count:(int64_t)a4 wait:(double)a5 trafficClass:(id)a6 interfaceName:(id)a7 dataLength:(unint64_t)a8
{
  id v8 = 0LL;
  if (a3 && a4 <= 2147483646 && a7)
  {
    if (a6 && (uint64_t v15 = W5DescriptionForPingTrafficClass([a6 integerValue])) != 0)
    {
      uint64_t v16 = v15;
      v30[0] = @"-c";
      v30[1] = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%ld", a4);
      void v30[2] = @"-B";
      v30[3] = a7;
      void v30[4] = @"-I";
      void v30[5] = a7;
      v30[6] = @"-k";
      v30[7] = v16;
      v30[8] = @"-i";
      v30[9] = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%f", *(void *)&a5);
      v30[10] = @"-s";
      v30[11] = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%ld", a8 + 56);
      _BYTE v30[12] = a3;
      id v17 = v30;
      uint64_t v18 = 13LL;
    }

    else
    {
      v29[0] = @"-c";
      v29[1] = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%ld", a4);
      void v29[2] = @"-B";
      void v29[3] = a7;
      v29[4] = @"-I";
      v29[5] = a7;
      v29[6] = @"-i";
      v29[7] = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%f", *(void *)&a5);
      v29[8] = @"-s";
      v29[9] = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%ld", a8 + 56);
      v29[10] = a3;
      id v17 = v29;
      uint64_t v18 = 11LL;
    }

    __int128 v19 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v17, v18);
    +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
    double v21 = v20;
    id v22 = +[NSMutableData dataWithCapacity:](&OBJC_CLASS___NSMutableData, "dataWithCapacity:", 0LL);
    +[NSTask runTaskWithLaunchPath:arguments:outputData:error:]( &OBJC_CLASS___NSTask,  "runTaskWithLaunchPath:arguments:outputData:error:",  @"/sbin/ping6",  v19,  v22,  0LL);
    id v8 = objc_alloc_init(&OBJC_CLASS___W5PingResult);
    [v8 setInterfaceName:a7];
    [v8 setAddress:a3];
    [v8 setCount:a4];
    [v8 setWait:a5];
    objc_msgSend(v8, "setTrafficClass:", objc_msgSend(a6, "integerValue"));
    [v8 setDataLength:a8];
    [v8 setStartedAt:v21];
    +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
    objc_msgSend(v8, "setEndedAt:");
    [v8 setCommand:+[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"/sbin/ping6 %@", -[NSArray componentsJoinedByString:](v19, "componentsJoinedByString:", @" "))];
    objc_msgSend( v8,  "setOutput:",  -[NSString initWithData:encoding:]([NSString alloc], "initWithData:encoding:", v22, 4));
    +[W5LogManager __parsePingOutput:result:](&OBJC_CLASS___W5LogManager, "__parsePingOutput:result:", v22, v8);
    if (v8)
    {
      uint64_t v23 = objc_alloc_init(&OBJC_CLASS___W5Event);
      -[W5Event setEventID:](v23, "setEventID:", 34LL);
      [v8 endedAt];
      -[W5Event setTimestamp:](v23, "setTimestamp:");
      unint64_t v27 = @"PingResult";
      id v28 = v8;
      -[W5Event setInfo:]( v23,  "setInfo:",  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v28,  &v27,  1LL));
      pingCallback = (void (**)(id, W5Event *))self->_pingCallback;
      if (pingCallback) {
        pingCallback[2](pingCallback, v23);
      }
    }
  }

  return v8;
}

- (id)__pingUsingCFNetworkWithAddress:(id)a3 count:(int64_t)a4 timeout:(int64_t)a5 trafficClass:(id)a6 networkServiceType:(id)a7
{
  id v7 = 0LL;
  if (a3 && a4 <= 2147483646 && a5 <= 2147483646)
  {
    +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
    double v13 = v12;
    id v14 = +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array");
    double v15 = 0.0;
    double v16 = 0.0;
    int64_t v46 = a4;
    if (a4 >= 1)
    {
      uint64_t v17 = kCFNetDiagnosticPingOptionTimeout;
      uint64_t v18 = kCFNetDiagnosticPingOptionPacketCount;
      uint64_t v48 = kCFNetDiagnosticPingOptionTrafficClass;
      uint64_t v47 = kCFNetDiagnosticPingOptionTypeOfService;
      int64_t v19 = v46;
      do
      {
        v58[0] = v17;
        double v20 = +[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a5);
        v58[1] = v18;
        v59[0] = v20;
        v59[1] = &off_1000DF0C0;
        id v21 =  -[NSDictionary mutableCopy]( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v59,  v58,  2LL),  "mutableCopy");
        id v22 = v21;
        if (a6) {
          [v21 setObject:a6 forKeyedSubscript:v48];
        }
        if (a7) {
          [v22 setObject:a7 forKeyedSubscript:v47];
        }
        +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
        double v24 = v23;
        CFTypeRef cf = 0LL;
        int v25 = CFNetDiagnosticPingWithOptions(a3, v22, &cf);
        +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
        if (v25)
        {
          double v16 = v16 + 1.0;
          objc_msgSend( v14,  "addObject:",  +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", (v26 - v24) * 1000.0));
        }

        if (cf) {
          CFRelease(cf);
        }
        --v19;
      }

      while (v19);
    }

    double v27 = 0.0;
    double v28 = 0.0;
    if ([v14 count])
    {
      unint64_t v29 = 0LL;
      double v15 = 0.0;
      do
      {
        objc_msgSend(objc_msgSend(v14, "objectAtIndexedSubscript:", v29), "doubleValue");
        double v28 = v28 + v30;
        if (v30 <= v15) {
          double v31 = v15;
        }
        else {
          double v31 = v30;
        }
        if (v30 < v27) {
          double v32 = v30;
        }
        else {
          double v32 = v27;
        }
        if (v29) {
          double v15 = v31;
        }
        else {
          double v15 = v30;
        }
        if (v29) {
          double v27 = v32;
        }
        else {
          double v27 = v30;
        }
        ++v29;
      }

      while (v29 < (unint64_t)[v14 count]);
    }

    double v33 = 0.0;
    double v34 = 0.0;
    if ([v14 count]) {
      double v34 = v28 / (double)(unint64_t)[v14 count];
    }
    __int128 v52 = 0u;
    __int128 v53 = 0u;
    __int128 v50 = 0u;
    __int128 v51 = 0u;
    id v35 = [v14 countByEnumeratingWithState:&v50 objects:v57 count:16];
    if (v35)
    {
      id v36 = v35;
      uint64_t v37 = *(void *)v51;
      do
      {
        for (uint64_t i = 0LL; i != v36; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v51 != v37) {
            objc_enumerationMutation(v14);
          }
          [*(id *)(*((void *)&v50 + 1) + 8 * (void)i) doubleValue];
          double v33 = v33 + (v39 - v34) * (v39 - v34);
        }

        id v36 = [v14 countByEnumeratingWithState:&v50 objects:v57 count:16];
      }

      while (v36);
    }

    double v40 = sqrt(v33 / (double)(unint64_t)[v14 count]);
    id v7 = objc_alloc_init(&OBJC_CLASS___W5PingResult);
    objc_msgSend( v7,  "setInterfaceName:",  -[W5WiFiInterface interfaceName](-[W5StatusManager wifi](self->_status, "wifi"), "interfaceName"));
    [v7 setAddress:a3];
    [v7 setCount:v46];
    [v7 setMin:v27];
    [v7 setMax:v15];
    [v7 setAvg:v34];
    [v7 setStddev:v40];
    [v7 setPacketLoss:((double)v46 - v16) / (double)v46];
    [v7 setStartedAt:v13];
    +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
    objc_msgSend(v7, "setEndedAt:");
    id v41 = v7;
    if (v7)
    {
      uint64_t v42 = objc_alloc_init(&OBJC_CLASS___W5Event);
      -[W5Event setEventID:](v42, "setEventID:", 34LL);
      [v7 endedAt];
      -[W5Event setTimestamp:](v42, "setTimestamp:");
      __int128 v55 = @"PingResult";
      id v56 = v7;
      -[W5Event setInfo:]( v42,  "setInfo:",  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v56,  &v55,  1LL));
      pingCallback = (void (**)(id, W5Event *))self->_pingCallback;
      if (pingCallback) {
        pingCallback[2](pingCallback, v42);
      }
    }
  }

  return v7;
}

- (id)__pingUsingIMFoundationWithAddress:(id)a3 timeout:(int64_t)a4
{
  uint64_t v18 = 0LL;
  int64_t v19 = &v18;
  uint64_t v20 = 0x3052000000LL;
  id v21 = sub_1000558E4;
  id v22 = sub_1000558F4;
  uint64_t v23 = 0LL;
  if (!qword_1000F7570)
  {
    *(_OWORD *)buf = off_1000D2F98;
    uint64_t v28 = 0LL;
    qword_1000F7570 = _sl_dlopen(buf, 0LL);
  }

  if (a4 <= 2147483646 && a3 && qword_1000F7570)
  {
    id v7 = dispatch_semaphore_create(0LL);
    *(void *)buf = 0LL;
    *(void *)&buf[8] = buf;
    uint64_t v28 = 0x3052000000LL;
    unint64_t v29 = sub_1000558E4;
    double v30 = sub_1000558F4;
    id v8 = (objc_class *)qword_1000F7578;
    uint64_t v31 = qword_1000F7578;
    if (!qword_1000F7578)
    {
      v24[0] = _NSConcreteStackBlock;
      v24[1] = 3221225472LL;
      void v24[2] = sub_100074A68;
      void v24[3] = &unk_1000D12E0;
      void v24[4] = buf;
      sub_100074A68((uint64_t)v24);
      id v8 = *(objc_class **)(*(void *)&buf[8] + 40LL);
    }

    _Block_object_dispose(buf, 8);
    id v9 = [[v8 alloc] initWithAddress:a3 wifi:1];
    +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472LL;
    void v17[2] = sub_100072554;
    void v17[3] = &unk_1000D2770;
    v17[4] = a3;
    v17[5] = self;
    _WORD v17[8] = v10;
    v17[6] = v7;
    v17[7] = &v18;
    objc_msgSend(v9, "startWithTimeout:queue:completionHandler:", dispatch_get_global_queue(0, 0), v17, (double)a4);
    dispatch_time_t v11 = dispatch_time(0LL, 80000000000LL);
    if (dispatch_semaphore_wait(v7, v11) >= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134349056;
      *(void *)&uint8_t buf[4] = 0x4054000000000000LL;
      _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "[wifivelocity] FAILED to complete operation within %{public}.1fs, continuing",  buf,  0xCu);
    }

    id v12 = (id)v19[5];
  }

  if (v19[5])
  {
    double v13 = objc_alloc_init(&OBJC_CLASS___W5Event);
    -[W5Event setEventID:](v13, "setEventID:", 34LL);
    [(id)v19[5] endedAt];
    -[W5Event setTimestamp:](v13, "setTimestamp:");
    int v25 = @"PingResult";
    uint64_t v26 = v19[5];
    -[W5Event setInfo:]( v13,  "setInfo:",  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v26,  &v25,  1LL));
    pingCallback = (void (**)(id, W5Event *))self->_pingCallback;
    if (pingCallback) {
      pingCallback[2](pingCallback, v13);
    }
  }

  double v15 = (void *)v19[5];
  _Block_object_dispose(&v18, 8);
  return v15;
}

+ (void)__parsePingOutput:(id)a3 result:(id)a4
{
  if (a3)
  {
    if (a4)
    {
      id v5 = -[NSString initWithData:encoding:](objc_alloc(&OBJC_CLASS___NSString), "initWithData:encoding:", a3, 4LL);
      if (v5)
      {
        id v14 = v5;
        id v6 = -[NSString componentsSeparatedByString:](v5, "componentsSeparatedByString:", @"\n");
        __int128 v15 = 0u;
        __int128 v16 = 0u;
        __int128 v17 = 0u;
        __int128 v18 = 0u;
        id v7 = -[NSArray countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v15,  v19,  16LL);
        if (v7)
        {
          id v8 = v7;
          uint64_t v9 = *(void *)v16;
          do
          {
            uint64_t v10 = 0LL;
            do
            {
              if (*(void *)v16 != v9) {
                objc_enumerationMutation(v6);
              }
              id v11 = objc_msgSend( *(id *)(*((void *)&v15 + 1) + 8 * (void)v10),  "componentsSeparatedByCharactersInSet:",  +[NSCharacterSet whitespaceCharacterSet](NSCharacterSet, "whitespaceCharacterSet"));
              if ([v11 containsObject:@"loss"])
              {
                id v12 = [v11 objectAtIndexedSubscript:6];
                objc_msgSend( objc_msgSend(v12, "substringToIndex:", (char *)objc_msgSend(v12, "length") - 1),  "doubleValue");
                objc_msgSend(a4, "setPacketLoss:");
              }

              else if ([v11 containsObject:@"round-trip"])
              {
                id v13 = objc_msgSend( objc_msgSend(v11, "objectAtIndexedSubscript:", 3),  "componentsSeparatedByString:",  @"/");
                objc_msgSend(objc_msgSend(v13, "objectAtIndexedSubscript:", 0), "doubleValue");
                objc_msgSend(a4, "setMin:");
                objc_msgSend(objc_msgSend(v13, "objectAtIndexedSubscript:", 1), "doubleValue");
                objc_msgSend(a4, "setAvg:");
                objc_msgSend(objc_msgSend(v13, "objectAtIndexedSubscript:", 2), "doubleValue");
                objc_msgSend(a4, "setMax:");
                objc_msgSend(objc_msgSend(v13, "objectAtIndexedSubscript:", 3), "doubleValue");
                objc_msgSend(a4, "setStddev:");
              }

              uint64_t v10 = (char *)v10 + 1;
            }

            while (v8 != v10);
            id v8 = -[NSArray countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v15,  v19,  16LL);
          }

          while (v8);
        }

        [a4 setOutput:v14];
      }
    }
  }

- (void)__runToolWithOutputFileHandle:(id)a3 launchPath:(id)a4 arguments:(id)a5
{
}

- (void)__runToolWithOutputFileHandle:(id)a3 readFromStandardError:(BOOL)a4 launchPath:(id)a5 arguments:(id)a6 addCommand:(BOOL)a7 addTimestamps:(BOOL)a8
{
  BOOL v8 = a8;
  BOOL v9 = a7;
  BOOL v12 = a4;
  if (a7)
  {
    id v15 = +[NSMutableString string](&OBJC_CLASS___NSMutableString, "string");
    [v15 appendString:@"--------------------------------------------------------------------\n"];
    [v15 appendFormat:@"%@ %@\n", objc_msgSend(a5, "lastPathComponent"), objc_msgSend(a6, "componentsJoinedByString:", @" ")];
    [v15 appendString:@"--------------------------------------------------------------------\n"];
    objc_msgSend(a3, "writeData:", objc_msgSend(v15, "dataUsingEncoding:", 4));
  }

  id v16 = [a3 offsetInFile];
  __int128 v17 = +[NSDate date](&OBJC_CLASS___NSDate, "date");
  if (v8)
  {
    __int128 v18 = v17;
    id v19 = +[NSMutableString string](&OBJC_CLASS___NSMutableString, "string");
    [v19 appendFormat:@"BEGIN: %@, END: 00:00:00.000\n", -[NSDateFormatter stringFromDate:](self->_dateFormatter, "stringFromDate:", v18)];
    [v19 appendString:@"--------------------------------------------------------------------\n"];
    objc_msgSend(a3, "writeData:", objc_msgSend(v19, "dataUsingEncoding:", 4));
    if (v12) {
      id v20 = 0LL;
    }
    else {
      id v20 = a3;
    }
    if (v12) {
      id v21 = a3;
    }
    else {
      id v21 = 0LL;
    }
    +[NSTask runTaskWithLaunchPath:arguments:timeout:outputFileHandle:errorFileHandle:launchHandler:didLaunch:error:]( &OBJC_CLASS___NSTask,  "runTaskWithLaunchPath:arguments:timeout:outputFileHandle:errorFileHandle:launchHandler:didLaunch:error:",  a5,  a6,  v20,  v21,  0LL,  0LL,  10.0,  0LL);
    [a3 seekToFileOffset:v16];
    id v22 = +[NSMutableString string](&OBJC_CLASS___NSMutableString, "string");
    [v22 appendFormat:@"BEGIN: %@, END: %@\n", -[NSDateFormatter stringFromDate:](self->_dateFormatter, "stringFromDate:", v18), -[NSDateFormatter stringFromDate:]( self->_dateFormatter, "stringFromDate:", +[NSDate date](NSDate, "date"))];
    [v22 appendString:@"--------------------------------------------------------------------\n"];
    objc_msgSend(a3, "writeData:", objc_msgSend(v22, "dataUsingEncoding:", 4));
    [a3 seekToEndOfFile];
LABEL_18:
    objc_msgSend(a3, "writeData:", objc_msgSend(@"\n", "dataUsingEncoding:", 4));
    return;
  }

  if (v12) {
    id v23 = 0LL;
  }
  else {
    id v23 = a3;
  }
  if (v12) {
    id v24 = a3;
  }
  else {
    id v24 = 0LL;
  }
  +[NSTask runTaskWithLaunchPath:arguments:timeout:outputFileHandle:errorFileHandle:launchHandler:didLaunch:error:]( &OBJC_CLASS___NSTask,  "runTaskWithLaunchPath:arguments:timeout:outputFileHandle:errorFileHandle:launchHandler:didLaunch:error:",  a5,  a6,  v23,  v24,  0LL,  0LL,  10.0,  0LL);
  if (v9) {
    goto LABEL_18;
  }
}

- (void)__wlCLIWithArguments:(id)a3 outputFileHandle:(id)a4
{
}

- (void)__wlCLIWithArguments:(id)a3 outputFileHandle:(id)a4 addCommand:(BOOL)a5 addTimestamps:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  if (-[CWFInterface SSID](-[W5StatusManager corewifi](self->_status, "corewifi"), "SSID"))
  {
    -[W5LogManager __runToolWithOutputFileHandle:readFromStandardError:launchPath:arguments:addCommand:addTimestamps:]( self,  "__runToolWithOutputFileHandle:readFromStandardError:launchPath:arguments:addCommand:addTimestamps:",  a4,  0LL,  @"/usr/local/bin/wl",  a3,  v7,  v6);
  }

  else if (v7)
  {
    id v11 = +[NSMutableString string](&OBJC_CLASS___NSMutableString, "string");
    [v11 appendString:@"--------------------------------------------------------------------\n"];
    [v11 appendFormat:@"%@ %@ -- NOT ASSOCIATED, NOOP\n", objc_msgSend(@"/usr/local/bin/wl", "lastPathComponent"), objc_msgSend(a3, "componentsJoinedByString:", @" ")];
    [v11 appendString:@"--------------------------------------------------------------------\n\n"];
    objc_msgSend(a4, "writeData:", objc_msgSend(v11, "dataUsingEncoding:", 4));
  }

- (BOOL)__wlCLIWithArguments:(id)a3 outputFilePath:(id)a4 outputData:(id)a5
{
  if (!-[CWFInterface SSID](-[W5StatusManager corewifi](self->_status, "corewifi"), "SSID")) {
    return 0;
  }
  if (a4) {
    return +[NSTask runTaskWithLaunchPath:arguments:outputFilePath:error:]( &OBJC_CLASS___NSTask,  "runTaskWithLaunchPath:arguments:outputFilePath:error:",  @"/usr/local/bin/wl",  a3,  a4,  0LL);
  }
  if (a5) {
    return +[NSTask runTaskWithLaunchPath:arguments:outputData:error:]( &OBJC_CLASS___NSTask,  "runTaskWithLaunchPath:arguments:outputData:error:",  @"/usr/local/bin/wl",  a3,  a5,  0LL);
  }
  else {
    return 0;
  }
}

- (void)__dumpCoreCaptureLogsWithReason:(id)a3 component:(id)a4
{
  BOOL v6 = -[W5StatusManager concurrentQueue](self->_status, "concurrentQueue");
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000731B4;
  v7[3] = &unk_1000D1BA8;
  void v7[4] = a4;
  v7[5] = a3;
  -[NSOperationQueue addOperationWithBlock:](v6, "addOperationWithBlock:", v7);
}

+ (id)__temporaryDirectory
{
  id v2 = +[NSURL fileURLWithPath:]( &OBJC_CLASS___NSURL,  "fileURLWithPath:",  -[NSString stringByAppendingPathComponent:]( -[NSString stringByAppendingPathComponent:]( NSTemporaryDirectory(),  "stringByAppendingPathComponent:",  @"com.apple.wifivelocity"),  "stringByAppendingPathComponent:",  -[NSString substringToIndex:]( -[NSUUID UUIDString](+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"), "UUIDString"),  "substringToIndex:",  5LL)));
  uint64_t v6 = 0LL;
  if (!-[NSFileManager createDirectoryAtPath:withIntermediateDirectories:attributes:error:]( +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"),  "createDirectoryAtPath:withIntermediateDirectories:attributes:error:",  -[NSURL path](v2, "path"),  1LL,  0LL,  &v6))
  {
    unsigned int v3 = (os_log_s *)sub_10008C90C();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 136315906;
      BOOL v8 = "+[W5LogManager __temporaryDirectory]";
      __int16 v9 = 2080;
      uint64_t v10 = "W5LogManager.m";
      __int16 v11 = 1024;
      int v12 = 9786;
      __int16 v13 = 2112;
      uint64_t v14 = v6;
      int v5 = 38;
      _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v3,  0LL,  "[wifivelocity] %s (%s:%u) FAILED to create temporary directory, returned error %@",  &v7,  v5);
    }
  }

  return v2;
}

- (id)collectedItemCallback
{
  return self->_collectedItemCallback;
}

- (id)collectLogItemCallback
{
  return self->_collectLogItemCallback;
}

- (id)pingCallback
{
  return self->_pingCallback;
}

@end
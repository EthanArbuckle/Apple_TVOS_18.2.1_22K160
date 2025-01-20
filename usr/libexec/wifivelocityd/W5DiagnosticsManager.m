@interface W5DiagnosticsManager
+ (BOOL)__detectLocalIPv4Address:(id)a3;
+ (BOOL)__isDoubleNATWithTracerouteOutput:(id)a3;
+ (BOOL)__setNetworkServiceOrder:(id)a3;
+ (id)__ambiguousSSIDs;
+ (id)__channelNumbersForWiFiChannels:(id)a3;
+ (id)__networkServiceOrder;
+ (id)__performDNSResolution:(id)a3;
+ (void)__parsePingOutput:(id)a3 result:(id)a4;
- (BOOL)__isDefaultCountryCode:(id)a3;
- (BOOL)__isUsingCustomProxySettings:(id)a3;
- (BOOL)__performCurlWithAddress:(id)a3;
- (BOOL)__performLoadViaNSURLSessionWithAddress:(id)a3 usingTimeout:(id)a4 andForceWiFiInterface:(BOOL)a5;
- (W5DiagnosticsManager)initWithStatusManager:(id)a3 peerDiagnosticsManager:(id)a4;
- (id)__adjust5GHzWeights:(id)a3;
- (id)__applyChannelWeights:(id)a3 supportedChannels:(id)a4;
- (id)__channelWeightsForChannel:(id)a3;
- (id)__channelWeightsForScanResults:(id)a3 supportedChannels:(id)a4 rssiThreshold:(int64_t)a5;
- (id)__defaultDiagnosticsTests;
- (id)__filteredChannelWeights:(id)a3 channels:(id)a4;
- (id)__occupiedChannelsForScanResults:(id)a3 supportedChannels:(id)a4 rssiThreshold:(int64_t)a5 ignoreChannel:(id)a6;
- (id)__only2GHzChannels:(id)a3;
- (id)__only2GHz_1_6_11_14_Channels:(id)a3;
- (id)__only5GHz20MHz40MHzChannels:(id)a3;
- (id)__only5GHz40MHzChannels:(id)a3;
- (id)__only5GHzChannels:(id)a3;
- (id)__only5GHzNonDFSChannels:(id)a3;
- (id)__orderedChannelWeights:(id)a3;
- (id)__overlappingChannelsForChannel:(id)a3 supportedChannels:(id)a4;
- (id)__pendingRequestWithUUID:(id)a3;
- (id)__performCFPingWithAddress:(id)a3 count:(int64_t)a4 timeout:(double)a5 trafficClass:(id)a6 networkServiceType:(id)a7 dataLength:(unint64_t)a8;
- (id)__performPing6WithAddress:(id)a3 count:(int64_t)a4 wait:(double)a5 trafficClass:(id)a6 interfaceName:(id)a7 dataLength:(unint64_t)a8;
- (id)__performPingUsingIMFoundationWithAddress:(id)a3 timeout:(int64_t)a4;
- (id)__performPingWithAddress:(id)a3 count:(int64_t)a4 timeout:(double)a5 wait:(double)a6 interval:(double)a7 trafficClass:(id)a8 interfaceName:(id)a9 dataLength:(unint64_t)a10;
- (id)__performTracerouteWithAddress:(id)a3 maxTTL:(int64_t)a4 waittime:(int64_t)a5 queries:(int64_t)a6;
- (id)__preferredNetworkWithNetworkName:(id)a3 configuration:(id)a4;
- (id)__runDiagnosticsTest:(id)a3;
- (id)__scanResultWithNetworkName:(id)a3;
- (id)__testAWDLEnabledWithConfiguration:(id)a3;
- (id)__testAWDLRealtimeWithConfiguration:(id)a3;
- (id)__testAirPortBaseStationWithConfiguration:(id)a3;
- (id)__testAmbiguousNetworkNameWithConfiguration:(id)a3;
- (id)__testBTCoexWithConfiguration:(id)a3;
- (id)__testCaptivePortalWithConfiguration:(id)a3;
- (id)__testConcurrentWithConfiguration:(id)a3;
- (id)__testConflictingCountryCodeWithConfiguration:(id)a3;
- (id)__testConflictingPHYMode11acWithConfiguration:(id)a3;
- (id)__testConflictingPHYMode11nWithConfiguration:(id)a3;
- (id)__testConflictingSecurityTypePNLWithConfiguration:(id)a3;
- (id)__testCongested2GHzWithConfiguration:(id)a3;
- (id)__testCongested5GHzWithConfiguration:(id)a3;
- (id)__testCongestedChannelUsingCCAWithConfiguration:(id)a3;
- (id)__testCongestedChannelWithConfiguration:(id)a3;
- (id)__testCurlApple;
- (id)__testCustomDNS;
- (id)__testCustomIPv4;
- (id)__testCustomIPv6;
- (id)__testCustomWebProxy;
- (id)__testDetectDoubleNAT;
- (id)__testDiscoverPeerTypes;
- (id)__testDownloadSpeedWithConfiguration:(id)a3;
- (id)__testHT402GHzWithConfiguration:(id)a3;
- (id)__testHiddenNetworkWithConfiguration:(id)a3;
- (id)__testHighBTConnectedWithConfiguration:(id)a3;
- (id)__testHighBTPairedWithConfiguration:(id)a3;
- (id)__testIPv4Assigned;
- (id)__testIPv6Assigned;
- (id)__testLargePNLWithConfiguration:(id)a3;
- (id)__testLeakyAP;
- (id)__testLegacyRates11bWithConfiguration:(id)a3;
- (id)__testLegacySecurityWEPWithConfiguration:(id)a3;
- (id)__testLegacySecurityWPAWithConfiguration:(id)a3;
- (id)__testLongBeaconIntervalWithConfiguration:(id)a3;
- (id)__testLongDTIMInterval;
- (id)__testNoSecurityWithConfiguration:(id)a3;
- (id)__testPNLContainsHiddenWithConfiguration:(id)a3;
- (id)__testPasspointWithConfiguration:(id)a3;
- (id)__testPeerDiagnostics;
- (id)__testPeerTypes;
- (id)__testPing6AWDLWithConfiguration:(id)a3;
- (id)__testPingLANUsingCFNetworkWithConfiguration:(id)a3;
- (id)__testPingLANUsingIMFoundation;
- (id)__testPingLANWithConfiguration:(id)a3;
- (id)__testPingWANUsingCFNetworkWithConfiguration:(id)a3;
- (id)__testPingWANUsingIMFoundation;
- (id)__testPingWANWithConfiguration:(id)a3;
- (id)__testPoorSignalWithConfiguration:(id)a3;
- (id)__testReachApple;
- (id)__testReachabilityToPeersWithConfiguration:(id)a3;
- (id)__testResolveDNS;
- (id)__testRetrieveApple;
- (id)__testRetrieveAppleForceWiFiWithConfiguration:(id)a3;
- (id)__testUploadSpeedWithConfiguration:(id)a3;
- (id)__testWiFiHiddenScanResultsWithConfiguration:(id)a3;
- (id)__testWiFiIsPrimaryIPv4;
- (id)__testWiFiIsPrimaryIPv6;
- (id)__testWiFiLink;
- (id)__testWiFiNoScanResultsWithConfiguration:(id)a3;
- (id)__testiOSPersonalHotspotWithConfiguration:(id)a3;
- (id)completedTestCallback;
- (id)diagnosticsHistory;
- (id)pingCallback;
- (int64_t)__ipv4ConfigMethodForDescription:(id)a3;
- (int64_t)__ipv6ConfigMethodForDescription:(id)a3;
- (void)__nextRequest;
- (void)__purgeDiagnosticsHistory;
- (void)__resetNetworkServiceOrderFromFile;
- (void)__runRequest:(id)a3 reply:(id)a4;
- (void)__updateDiagnosticsHistoryWithResult:(id)a3;
- (void)addRequest:(id)a3;
- (void)cancelRequestWithUUID:(id)a3 reply:(id)a4;
- (void)dealloc;
- (void)resetNetworkServiceOrderForTeardown;
- (void)setCompletedTestCallback:(id)a3;
- (void)setPingCallback:(id)a3;
- (void)teardownAndNotify:(id)a3;
@end

@implementation W5DiagnosticsManager

- (W5DiagnosticsManager)initWithStatusManager:(id)a3 peerDiagnosticsManager:(id)a4
{
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___W5DiagnosticsManager;
  v6 = -[W5DiagnosticsManager init](&v14, "init");
  if (!v6) {
    goto LABEL_10;
  }
  dispatch_queue_t v7 = dispatch_queue_create("com.apple.wifivelocity.diagnostics", 0LL);
  *((void *)v6 + 5) = v7;
  if (!v7) {
    goto LABEL_10;
  }
  v8 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v9 = dispatch_queue_create("com.apple.wifivelocity.diagnostics.default-route", v8);
  *((void *)v6 + 11) = v9;
  if (!v9) {
    goto LABEL_10;
  }
  dispatch_queue_set_specific(*((dispatch_queue_t *)v6 + 5), v6 + 40, (void *)1, 0LL);
  if (!a3) {
    goto LABEL_10;
  }
  *((void *)v6 + 1) = a3;
  *((void *)v6 + 2) = a4;
  v10 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  *((void *)v6 + 6) = v10;
  if (!v10) {
    goto LABEL_10;
  }
  v11 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  *((void *)v6 + 8) = v11;
  if (v11 && (v12 = objc_alloc_init(&OBJC_CLASS___NSDateFormatter), (*((void *)v6 + 14) = v12) != 0LL))
  {
    -[NSDateFormatter setDateFormat:](v12, "setDateFormat:", @"HH:mm:ss.SSS");
    objc_msgSend(v6, "__resetNetworkServiceOrderFromFile");
  }

  else
  {
LABEL_10:

    return 0LL;
  }

  return (W5DiagnosticsManager *)v6;
}

- (void)dealloc
{
  -[NSURLSession invalidateAndCancel](self->_urlSession, "invalidateAndCancel");
  queue = (dispatch_object_s *)self->_queue;
  if (queue) {
    dispatch_release(queue);
  }
  wifiDefaultRouteQueue = (dispatch_object_s *)self->_wifiDefaultRouteQueue;
  if (wifiDefaultRouteQueue) {
    dispatch_release(wifiDefaultRouteQueue);
  }
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___W5DiagnosticsManager;
  -[W5DiagnosticsManager dealloc](&v5, "dealloc");
}

- (void)setCompletedTestCallback:(id)a3
{
  if (dispatch_get_specific(&self->_queue))
  {

    self->_completedTestCallback = [a3 copy];
  }

  else
  {
    queue = (dispatch_queue_s *)self->_queue;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472LL;
    v6[2] = sub_100037B00;
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
    v6[2] = sub_100037BCC;
    v6[3] = &unk_1000D1B80;
    v6[4] = self;
    v6[5] = a3;
    dispatch_sync(queue, v6);
  }

- (void)addRequest:(id)a3
{
  queue = (dispatch_queue_s *)self->_queue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_100037C68;
  v4[3] = &unk_1000D1BA8;
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
    dispatch_queue_t v9 = *(void **)(*((void *)&v11 + 1) + 8 * v8);
    if (v6 == (id)++v8)
    {
      id v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( pendingRequests,  "countByEnumeratingWithState:objects:count:",  &v11,  v15,  16LL);
      if (v6) {
        goto LABEL_3;
      }
      return 0LL;
    }
  }

- (void)cancelRequestWithUUID:(id)a3 reply:(id)a4
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100037E04;
  block[3] = &unk_1000D1BD0;
  block[4] = self;
  block[5] = a3;
  block[6] = a4;
  dispatch_async(queue, block);
}

- (void)teardownAndNotify:(id)a3
{
  queue = (dispatch_queue_s *)self->_queue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_1000380AC;
  v4[3] = &unk_1000D1B80;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(queue, v4);
}

- (id)diagnosticsHistory
{
  uint64_t v6 = 0LL;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3052000000LL;
  dispatch_queue_t v9 = sub_1000381CC;
  v10 = sub_1000381DC;
  uint64_t v11 = 0LL;
  queue = (dispatch_queue_s *)self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1000381E8;
  v5[3] = &unk_1000D1CA8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)__resetNetworkServiceOrderFromFile
{
  v2 = +[NSData dataWithContentsOfFile:]( &OBJC_CLASS___NSData,  "dataWithContentsOfFile:",  @"/var/run/wifivelocity-tmp");
  if (-[NSData length](v2, "length"))
  {
    id v3 = +[NSPropertyListSerialization propertyListWithData:options:format:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "propertyListWithData:options:format:error:",  v2,  0LL,  0LL,  0LL);
    if (v3)
    {
      id v4 = v3;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v5 = 0;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "[wifivelocity] Restoring network service order from file",  v5,  2u);
      }

      +[W5DiagnosticsManager __setNetworkServiceOrder:]( &OBJC_CLASS___W5DiagnosticsManager,  "__setNetworkServiceOrder:",  v4);
    }

    -[NSFileManager removeItemAtPath:error:]( +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"),  "removeItemAtPath:error:",  @"/var/run/wifivelocity-tmp",  0LL);
  }

- (void)resetNetworkServiceOrderForTeardown
{
  wifiDefaultRouteQueue = (dispatch_queue_s *)self->_wifiDefaultRouteQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100038360;
  block[3] = &unk_1000D1BF8;
  block[4] = self;
  dispatch_sync(wifiDefaultRouteQueue, block);
}

- (void)__nextRequest
{
  if (!self->_activeRequest)
  {
    if (-[NSMutableArray count](self->_pendingRequests, "count"))
    {
      id v3 = objc_msgSend(-[NSMutableArray firstObject](self->_pendingRequests, "firstObject"), "copy");
      self->_activeRequest = (W5DiagnosticsTestRequestInternal *)objc_msgSend( -[NSMutableArray firstObject]( self->_pendingRequests,  "firstObject"),  "copy");
      -[NSMutableArray removeObjectAtIndex:](self->_pendingRequests, "removeObjectAtIndex:", 0LL);
      v6[0] = 0LL;
      v6[1] = v6;
      v6[2] = 0x3052000000LL;
      v6[3] = sub_1000381CC;
      v6[4] = sub_1000381DC;
      uint64_t v4 = os_transaction_create("com.apple.wifivelocity.diagnostics");
      objc_msgSend( +[W5ActivityManager sharedActivityManager](W5ActivityManager, "sharedActivityManager"),  "osTransactionCreate:transaction:",  "com.apple.wifivelocity.diagnostics",  v4);
      v6[5] = v4;
      v5[0] = _NSConcreteStackBlock;
      v5[1] = 3221225472LL;
      v5[2] = sub_100038574;
      v5[3] = &unk_1000D2638;
      v5[4] = self;
      v5[5] = v3;
      void v5[6] = v6;
      -[W5DiagnosticsManager __runRequest:reply:](self, "__runRequest:reply:", v3, v5);
      _Block_object_dispose(v6, 8);
    }
  }

- (id)__defaultDiagnosticsTests
{
  id v2 = +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array");
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
  objc_msgSend( v2,  "addObject:",  +[W5DiagnosticsTestRequest requestWithTestID:configuration:]( W5DiagnosticsTestRequest,  "requestWithTestID:configuration:",  52,  &off_1000E1C50));
  objc_msgSend( v2,  "addObject:",  +[W5DiagnosticsTestRequest requestWithTestID:configuration:]( W5DiagnosticsTestRequest,  "requestWithTestID:configuration:",  57,  &off_1000E1C50));
  objc_msgSend( v2,  "addObject:",  +[W5DiagnosticsTestRequest requestWithTestID:configuration:]( W5DiagnosticsTestRequest,  "requestWithTestID:configuration:",  58,  &off_1000E1C50));
  objc_msgSend( v2,  "addObject:",  +[W5DiagnosticsTestRequest requestWithTestID:configuration:]( W5DiagnosticsTestRequest,  "requestWithTestID:configuration:",  v5,  &off_1000E1C50));
  objc_msgSend( v2,  "addObject:",  +[W5DiagnosticsTestRequest requestWithTestID:configuration:]( W5DiagnosticsTestRequest,  "requestWithTestID:configuration:",  v6,  &off_1000E1C50));
  if (v4) {
    objc_msgSend( v2,  "addObject:",  +[W5DiagnosticsTestRequest requestWithTestID:configuration:]( W5DiagnosticsTestRequest,  "requestWithTestID:configuration:",  59,  &off_1000E1C50));
  }
  objc_msgSend( v2,  "addObject:",  +[W5DiagnosticsTestRequest requestWithTestID:configuration:]( W5DiagnosticsTestRequest,  "requestWithTestID:configuration:",  12,  &off_1000E1C50));
  objc_msgSend( v2,  "addObject:",  +[W5DiagnosticsTestRequest requestWithTestID:configuration:]( W5DiagnosticsTestRequest,  "requestWithTestID:configuration:",  13,  &off_1000E1C50));
  objc_msgSend( v2,  "addObject:",  +[W5DiagnosticsTestRequest requestWithTestID:configuration:]( W5DiagnosticsTestRequest,  "requestWithTestID:configuration:",  7,  &off_1000E1C50));
  objc_msgSend( v2,  "addObject:",  +[W5DiagnosticsTestRequest requestWithTestID:configuration:]( W5DiagnosticsTestRequest,  "requestWithTestID:configuration:",  8,  &off_1000E1C50));
  objc_msgSend( v2,  "addObject:",  +[W5DiagnosticsTestRequest requestWithTestID:configuration:]( W5DiagnosticsTestRequest,  "requestWithTestID:configuration:",  9,  &off_1000E1C50));
  objc_msgSend( v2,  "addObject:",  +[W5DiagnosticsTestRequest requestWithTestID:configuration:]( W5DiagnosticsTestRequest,  "requestWithTestID:configuration:",  11,  &off_1000E1C50));
  objc_msgSend( v2,  "addObject:",  +[W5DiagnosticsTestRequest requestWithTestID:configuration:]( W5DiagnosticsTestRequest,  "requestWithTestID:configuration:",  54,  &off_1000E1C50));
  objc_msgSend( v2,  "addObject:",  +[W5DiagnosticsTestRequest requestWithTestID:configuration:]( W5DiagnosticsTestRequest,  "requestWithTestID:configuration:",  14,  &off_1000E1C50));
  objc_msgSend( v2,  "addObject:",  +[W5DiagnosticsTestRequest requestWithTestID:configuration:]( W5DiagnosticsTestRequest,  "requestWithTestID:configuration:",  15,  &off_1000E1C50));
  objc_msgSend( v2,  "addObject:",  +[W5DiagnosticsTestRequest requestWithTestID:configuration:]( W5DiagnosticsTestRequest,  "requestWithTestID:configuration:",  16,  &off_1000E1C50));
  objc_msgSend( v2,  "addObject:",  +[W5DiagnosticsTestRequest requestWithTestID:configuration:]( W5DiagnosticsTestRequest,  "requestWithTestID:configuration:",  17,  &off_1000E1C50));
  objc_msgSend( v2,  "addObject:",  +[W5DiagnosticsTestRequest requestWithTestID:configuration:]( W5DiagnosticsTestRequest,  "requestWithTestID:configuration:",  18,  &off_1000E1C50));
  objc_msgSend( v2,  "addObject:",  +[W5DiagnosticsTestRequest requestWithTestID:configuration:]( W5DiagnosticsTestRequest,  "requestWithTestID:configuration:",  19,  &off_1000E1C50));
  objc_msgSend( v2,  "addObject:",  +[W5DiagnosticsTestRequest requestWithTestID:configuration:]( W5DiagnosticsTestRequest,  "requestWithTestID:configuration:",  20,  &off_1000E1C50));
  objc_msgSend( v2,  "addObject:",  +[W5DiagnosticsTestRequest requestWithTestID:configuration:]( W5DiagnosticsTestRequest,  "requestWithTestID:configuration:",  21,  &off_1000E1C50));
  objc_msgSend( v2,  "addObject:",  +[W5DiagnosticsTestRequest requestWithTestID:configuration:]( W5DiagnosticsTestRequest,  "requestWithTestID:configuration:",  22,  &off_1000E1C50));
  objc_msgSend( v2,  "addObject:",  +[W5DiagnosticsTestRequest requestWithTestID:configuration:]( W5DiagnosticsTestRequest,  "requestWithTestID:configuration:",  51,  &off_1000E1C50));
  objc_msgSend( v2,  "addObject:",  +[W5DiagnosticsTestRequest requestWithTestID:configuration:]( W5DiagnosticsTestRequest,  "requestWithTestID:configuration:",  24,  &off_1000E1C50));
  objc_msgSend( v2,  "addObject:",  +[W5DiagnosticsTestRequest requestWithTestID:configuration:]( W5DiagnosticsTestRequest,  "requestWithTestID:configuration:",  27,  &off_1000E1C50));
  objc_msgSend( v2,  "addObject:",  +[W5DiagnosticsTestRequest requestWithTestID:configuration:]( W5DiagnosticsTestRequest,  "requestWithTestID:configuration:",  28,  &off_1000E1C50));
  objc_msgSend( v2,  "addObject:",  +[W5DiagnosticsTestRequest requestWithTestID:configuration:]( W5DiagnosticsTestRequest,  "requestWithTestID:configuration:",  29,  &off_1000E1C50));
  objc_msgSend( v2,  "addObject:",  +[W5DiagnosticsTestRequest requestWithTestID:configuration:]( W5DiagnosticsTestRequest,  "requestWithTestID:configuration:",  30,  &off_1000E1C50));
  objc_msgSend( v2,  "addObject:",  +[W5DiagnosticsTestRequest requestWithTestID:configuration:]( W5DiagnosticsTestRequest,  "requestWithTestID:configuration:",  31,  &off_1000E1C50));
  objc_msgSend( v2,  "addObject:",  +[W5DiagnosticsTestRequest requestWithTestID:configuration:]( W5DiagnosticsTestRequest,  "requestWithTestID:configuration:",  32,  &off_1000E1C50));
  objc_msgSend( v2,  "addObject:",  +[W5DiagnosticsTestRequest requestWithTestID:configuration:]( W5DiagnosticsTestRequest,  "requestWithTestID:configuration:",  34,  &off_1000E1C50));
  objc_msgSend( v2,  "addObject:",  +[W5DiagnosticsTestRequest requestWithTestID:configuration:]( W5DiagnosticsTestRequest,  "requestWithTestID:configuration:",  35,  &off_1000E1C50));
  objc_msgSend( v2,  "addObject:",  +[W5DiagnosticsTestRequest requestWithTestID:configuration:]( W5DiagnosticsTestRequest,  "requestWithTestID:configuration:",  36,  &off_1000E1C50));
  objc_msgSend( v2,  "addObject:",  +[W5DiagnosticsTestRequest requestWithTestID:configuration:]( W5DiagnosticsTestRequest,  "requestWithTestID:configuration:",  37,  &off_1000E1C50));
  objc_msgSend( v2,  "addObject:",  +[W5DiagnosticsTestRequest requestWithTestID:configuration:]( W5DiagnosticsTestRequest,  "requestWithTestID:configuration:",  38,  &off_1000E1C50));
  objc_msgSend( v2,  "addObject:",  +[W5DiagnosticsTestRequest requestWithTestID:configuration:]( W5DiagnosticsTestRequest,  "requestWithTestID:configuration:",  40,  &off_1000E1C50));
  objc_msgSend( v2,  "addObject:",  +[W5DiagnosticsTestRequest requestWithTestID:configuration:]( W5DiagnosticsTestRequest,  "requestWithTestID:configuration:",  39,  &off_1000E1C50));
  objc_msgSend( v2,  "addObject:",  +[W5DiagnosticsTestRequest requestWithTestID:configuration:]( W5DiagnosticsTestRequest,  "requestWithTestID:configuration:",  41,  &off_1000E1C50));
  objc_msgSend( v2,  "addObject:",  +[W5DiagnosticsTestRequest requestWithTestID:configuration:]( W5DiagnosticsTestRequest,  "requestWithTestID:configuration:",  44,  &off_1000E1C50));
  objc_msgSend( v2,  "addObject:",  +[W5DiagnosticsTestRequest requestWithTestID:configuration:]( W5DiagnosticsTestRequest,  "requestWithTestID:configuration:",  45,  &off_1000E1C50));
  objc_msgSend( v2,  "addObject:",  +[W5DiagnosticsTestRequest requestWithTestID:configuration:]( W5DiagnosticsTestRequest,  "requestWithTestID:configuration:",  46,  &off_1000E1C50));
  objc_msgSend( v2,  "addObject:",  +[W5DiagnosticsTestRequest requestWithTestID:configuration:]( W5DiagnosticsTestRequest,  "requestWithTestID:configuration:",  47,  &off_1000E1C50));
  objc_msgSend( v2,  "addObject:",  +[W5DiagnosticsTestRequest requestWithTestID:configuration:]( W5DiagnosticsTestRequest,  "requestWithTestID:configuration:",  48,  &off_1000E1C50));
  objc_msgSend( v2,  "addObject:",  +[W5DiagnosticsTestRequest requestWithTestID:configuration:]( W5DiagnosticsTestRequest,  "requestWithTestID:configuration:",  43,  &off_1000E1C50));
  objc_msgSend( v2,  "addObject:",  +[W5DiagnosticsTestRequest requestWithTestID:configuration:]( W5DiagnosticsTestRequest,  "requestWithTestID:configuration:",  42,  &off_1000E1C50));
  return v2;
}

- (void)__purgeDiagnosticsHistory
{
  double v4 = v3;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  id obj = -[NSMutableDictionary allKeys](self->_diagnosticsHistory, "allKeys");
  id v5 = [obj countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v18 = *(void *)v24;
    do
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v24 != v18) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void *)(*((void *)&v23 + 1) + 8LL * (void)i);
        id v9 = -[NSMutableDictionary objectForKeyedSubscript:](self->_diagnosticsHistory, "objectForKeyedSubscript:", v8);
        __int128 v19 = 0u;
        __int128 v20 = 0u;
        __int128 v21 = 0u;
        __int128 v22 = 0u;
        id v10 = [v9 allKeys];
        id v11 = [v10 countByEnumeratingWithState:&v19 objects:v27 count:16];
        if (v11)
        {
          id v12 = v11;
          uint64_t v13 = *(void *)v20;
          do
          {
            for (j = 0LL; j != v12; j = (char *)j + 1)
            {
              if (*(void *)v20 != v13) {
                objc_enumerationMutation(v10);
              }
              uint64_t v15 = *(void *)(*((void *)&v19 + 1) + 8LL * (void)j);
              objc_msgSend(objc_msgSend(v9, "objectForKeyedSubscript:", v15), "testCompleted");
              if (v4 - v16 > 86400.0) {
                [v9 setObject:0 forKeyedSubscript:v15];
              }
            }

            id v12 = [v10 countByEnumeratingWithState:&v19 objects:v27 count:16];
          }

          while (v12);
        }

        if (!objc_msgSend(objc_msgSend(v9, "allKeys"), "count")) {
          -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_diagnosticsHistory,  "setObject:forKeyedSubscript:",  0LL,  v8);
        }
      }

      id v6 = [obj countByEnumeratingWithState:&v23 objects:v28 count:16];
    }

    while (v6);
  }

- (void)__updateDiagnosticsHistoryWithResult:(id)a3
{
  if (a3 && ([a3 didPass] & 1) == 0)
  {
    id v5 = -[CWFInterface networkName](-[W5StatusManager corewifi](self->_status, "corewifi"), "networkName");
    if ([a3 testID] == (id)52) {
      id v5 = -[W5WiFiInterface lastAssociatedSSIDString]( -[W5StatusManager wifi](self->_status, "wifi"),  "lastAssociatedSSIDString");
    }
    if (v5)
    {
      id v6 = -[NSMutableDictionary objectForKeyedSubscript:](self->_diagnosticsHistory, "objectForKeyedSubscript:", v5);
      if (!v6)
      {
        id v6 = +[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary");
        -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_diagnosticsHistory,  "setObject:forKeyedSubscript:",  v6,  v5);
      }

      objc_msgSend( v6,  "setObject:forKeyedSubscript:",  a3,  +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(a3, "testID")));
    }
  }

  -[W5DiagnosticsManager __purgeDiagnosticsHistory](self, "__purgeDiagnosticsHistory");
}

- (void)__runRequest:(id)a3 reply:(id)a4
{
  id v7 = [a3 testRequests];
  if (!v7) {
    id v7 = -[W5DiagnosticsManager __defaultDiagnosticsTests](self, "__defaultDiagnosticsTests");
  }
  if (!-[NSArray count](self->_wifiScanResults, "count"))
  {

    self->_wifiScanResults = (NSArray *) -[W5WiFiInterface scanCache:]( -[W5StatusManager wifi](self->_status, "wifi"),  "scanCache:",  1LL);
  }

  uint64_t v8 = -[W5StatusManager concurrentQueue](self->_status, "concurrentQueue");
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_100039018;
  v9[3] = &unk_1000D1FC8;
  v9[4] = a3;
  v9[5] = v7;
  v9[6] = self;
  v9[7] = a4;
  -[NSOperationQueue addOperationWithBlock:](v8, "addOperationWithBlock:", v9);
}

- (id)__testDetectDoubleNAT
{
  double v3 = objc_alloc_init(&OBJC_CLASS___W5DiagnosticsTestResult);
  -[W5DiagnosticsTestResult setTestID:](v3, "setTestID:", 8LL);
  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  -[W5DiagnosticsTestResult setTestStarted:](v3, "setTestStarted:");
  if (-[CWFInterface SSID](-[W5StatusManager corewifi](self->_status, "corewifi"), "SSID"))
  {
    if (+[W5DiagnosticsManager __isDoubleNATWithTracerouteOutput:]( &OBJC_CLASS___W5DiagnosticsManager,  "__isDoubleNATWithTracerouteOutput:",  -[W5DiagnosticsManager __performTracerouteWithAddress:maxTTL:waittime:queries:]( self,  "__performTracerouteWithAddress:maxTTL:waittime:queries:",  @"captive.apple.com",  2LL,  1LL,  1LL)))
    {
      -[W5DiagnosticsTestResult setResult:](v3, "setResult:", 1LL);
    }

    else
    {
      -[W5DiagnosticsTestResult setDidPass:](v3, "setDidPass:", 1LL);
    }
  }

  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  -[W5DiagnosticsTestResult setTestCompleted:](v3, "setTestCompleted:");
  return v3;
}

- (id)__testPingLANWithConfiguration:(id)a3
{
  id v5 = objc_alloc_init(&OBJC_CLASS___W5DiagnosticsTestResult);
  uint64_t v6 = 1LL;
  -[W5DiagnosticsTestResult setTestID:](v5, "setTestID:", 1LL);
  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  -[W5DiagnosticsTestResult setTestStarted:](v5, "setTestStarted:");
  id v7 = [a3 objectForKeyedSubscript:@"PingCount"];
  id v8 = [a3 objectForKeyedSubscript:@"PingTimeout"];
  id v9 = [a3 objectForKeyedSubscript:@"PingInterval"];
  id v10 = [a3 objectForKeyedSubscript:@"PingWait"];
  id v11 = [a3 objectForKeyedSubscript:@"PingDataLength"];
  if (v7) {
    uint64_t v6 = (uint64_t)[v7 integerValue];
  }
  if (v8)
  {
    [v8 doubleValue];
    double v13 = v12;
    if (v9) {
      goto LABEL_5;
    }
  }

  else
  {
    double v13 = 2.0;
    if (v9)
    {
LABEL_5:
      [v9 doubleValue];
      double v15 = v14;
      if (v10) {
        goto LABEL_6;
      }
      goto LABEL_19;
    }
  }

  double v15 = 0.1;
  if (v10)
  {
LABEL_6:
    [v10 doubleValue];
    double v17 = v16;
    if (!v11) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }

- (id)__testPing6AWDLWithConfiguration:(id)a3
{
  id v5 = objc_alloc_init(&OBJC_CLASS___W5DiagnosticsTestResult);
  -[W5DiagnosticsTestResult setTestID:](v5, "setTestID:", 59LL);
  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  -[W5DiagnosticsTestResult setTestStarted:](v5, "setTestStarted:");
  id v6 = [a3 objectForKeyedSubscript:@"PingCount"];
  id v7 = [a3 objectForKeyedSubscript:@"PingWait"];
  id v8 = [a3 objectForKeyedSubscript:@"PingDataLength"];
  if (v6)
  {
    uint64_t v9 = (uint64_t)[v6 integerValue];
    if (v7) {
      goto LABEL_3;
    }
LABEL_13:
    double v11 = 2.0;
    if (!v8) {
      goto LABEL_5;
    }
    goto LABEL_4;
  }

  uint64_t v9 = 1LL;
  if (!v7) {
    goto LABEL_13;
  }
LABEL_3:
  [v7 doubleValue];
  double v11 = v10;
  if (v8) {
LABEL_4:
  }
    id v8 = [v8 unsignedIntegerValue];
LABEL_5:
  id v12 = [a3 objectForKeyedSubscript:@"PingTrafficClass"];
  if (objc_msgSend( objc_msgSend( -[CWFInterface AWDL](-[W5StatusManager corewifi](self->_status, "corewifi"), "AWDL"),  "IPv6Addresses"),  "count"))
  {
    id v13 = -[W5DiagnosticsManager __performPing6WithAddress:count:wait:trafficClass:interfaceName:dataLength:]( self,  "__performPing6WithAddress:count:wait:trafficClass:interfaceName:dataLength:",  @"ff02::fb",  v9,  v12,  -[W5WiFiInterface interfaceName](-[W5StatusManager awdl](self->_status, "awdl"), "interfaceName"),  v8,  v11);
    if (v13)
    {
      double v14 = v13;
      if ((uint64_t)[v13 count] >= 1)
      {
        [v14 packetLoss];
        if (v15 < 100.0)
        {
          -[W5DiagnosticsTestResult setResult:](v5, "setResult:", 1LL);
          -[W5DiagnosticsTestResult setDidPass:](v5, "setDidPass:", 1LL);
        }
      }

      double v17 = @"PingResult";
      id v18 = v14;
      -[W5DiagnosticsTestResult setInfo:]( v5,  "setInfo:",  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v18,  &v17,  1LL));
    }
  }

  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  -[W5DiagnosticsTestResult setTestCompleted:](v5, "setTestCompleted:");
  return v5;
}

- (id)__testPingWANWithConfiguration:(id)a3
{
  id v5 = objc_alloc_init(&OBJC_CLASS___W5DiagnosticsTestResult);
  -[W5DiagnosticsTestResult setTestID:](v5, "setTestID:", 4LL);
  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  v52 = v5;
  -[W5DiagnosticsTestResult setTestStarted:](v5, "setTestStarted:");
  id v6 = [a3 objectForKeyedSubscript:@"PingCount"];
  id v7 = [a3 objectForKeyedSubscript:@"PingTimeout"];
  id v8 = [a3 objectForKeyedSubscript:@"PingInterval"];
  id v9 = [a3 objectForKeyedSubscript:@"PingWait"];
  id v10 = [a3 objectForKeyedSubscript:@"PingDataLength"];
  id v11 = [a3 objectForKeyedSubscript:@"PingWANUseAppleDNS"];
  id v12 = [a3 objectForKeyedSubscript:@"PingDataLength"];
  id v13 = [a3 objectForKeyedSubscript:@"IPAddress"];
  if (v6)
  {
    uint64_t v53 = (uint64_t)[v6 integerValue];
    if (v7) {
      goto LABEL_3;
    }
  }

  else
  {
    uint64_t v53 = 1LL;
    if (v7)
    {
LABEL_3:
      [v7 doubleValue];
      double v15 = v14;
      if (v8) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }

  double v15 = 2.0;
  if (v8)
  {
LABEL_4:
    [v8 doubleValue];
    double v17 = v16;
    if (v9) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }

- (id)__testPingLANUsingIMFoundation
{
  double v3 = objc_alloc_init(&OBJC_CLASS___W5DiagnosticsTestResult);
  -[W5DiagnosticsTestResult setTestID:](v3, "setTestID:", 2LL);
  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  -[W5DiagnosticsTestResult setTestStarted:](v3, "setTestStarted:");
  if (-[CWFInterface SSID](-[W5StatusManager corewifi](self->_status, "corewifi"), "SSID"))
  {
    id v4 = -[CWFInterface IPv4RouterAddress](-[W5StatusManager corewifi](self->_status, "corewifi"), "IPv4RouterAddress");
    id v5 = -[CWFInterface IPv6RouterAddress](-[W5StatusManager corewifi](self->_status, "corewifi"), "IPv6RouterAddress");
    if (v4 || (id v4 = v5) != 0LL)
    {
      id v6 = -[W5DiagnosticsManager __performPingUsingIMFoundationWithAddress:timeout:]( self,  "__performPingUsingIMFoundationWithAddress:timeout:",  v4,  1LL);
      if (v6)
      {
        id v7 = v6;
        if ((uint64_t)[v6 count] >= 1)
        {
          [v7 packetLoss];
          if (v8 < 100.0)
          {
            -[W5DiagnosticsTestResult setDidPass:](v3, "setDidPass:", 1LL);
            -[W5DiagnosticsTestResult setResult:](v3, "setResult:", 1LL);
          }
        }

        id v10 = @"PingResult";
        id v11 = v7;
        -[W5DiagnosticsTestResult setInfo:]( v3,  "setInfo:",  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v11,  &v10,  1LL));
      }
    }
  }

  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  -[W5DiagnosticsTestResult setTestCompleted:](v3, "setTestCompleted:");
  return v3;
}

- (id)__testPingWANUsingIMFoundation
{
  double v3 = objc_alloc_init(&OBJC_CLASS___W5DiagnosticsTestResult);
  -[W5DiagnosticsTestResult setTestID:](v3, "setTestID:", 5LL);
  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  -[W5DiagnosticsTestResult setTestStarted:](v3, "setTestStarted:");
  if (-[CWFInterface SSID](-[W5StatusManager corewifi](self->_status, "corewifi"), "SSID"))
  {
    id v4 = +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array");
    id v5 = sub_10008C29C();
    __int128 v36 = 0u;
    __int128 v37 = 0u;
    __int128 v38 = 0u;
    __int128 v39 = 0u;
    id v6 = [v5 countByEnumeratingWithState:&v36 objects:v44 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v37;
LABEL_4:
      uint64_t v9 = 0LL;
      while (1)
      {
        if (*(void *)v37 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = -[W5DiagnosticsManager __performPingUsingIMFoundationWithAddress:timeout:]( self,  "__performPingUsingIMFoundationWithAddress:timeout:",  *(void *)(*((void *)&v36 + 1) + 8 * v9),  1LL);
        if (v10)
        {
          id v11 = v10;
          [v4 addObject:v10];
          [v11 packetLoss];
          if (v12 < 100.0) {
            break;
          }
        }

        if (v7 == (id)++v9)
        {
          id v7 = [v5 countByEnumeratingWithState:&v36 objects:v44 count:16];
          if (v7) {
            goto LABEL_4;
          }
          break;
        }
      }
    }

    id v13 = -[CWFInterface DNSServerAddresses]( -[W5StatusManager corewifi](self->_status, "corewifi"),  "DNSServerAddresses");
    __int128 v32 = 0u;
    __int128 v33 = 0u;
    __int128 v34 = 0u;
    __int128 v35 = 0u;
    id v14 = [v13 countByEnumeratingWithState:&v32 objects:v43 count:16];
    if (v14)
    {
      id v15 = v14;
      uint64_t v16 = *(void *)v33;
LABEL_13:
      uint64_t v17 = 0LL;
      while (1)
      {
        if (*(void *)v33 != v16) {
          objc_enumerationMutation(v13);
        }
        id v18 = -[W5DiagnosticsManager __performPingUsingIMFoundationWithAddress:timeout:]( self,  "__performPingUsingIMFoundationWithAddress:timeout:",  *(void *)(*((void *)&v32 + 1) + 8 * v17),  1LL);
        if (v18)
        {
          double v19 = v18;
          [v4 addObject:v18];
          [v19 packetLoss];
          if (v20 < 100.0) {
            break;
          }
        }

        if (v15 == (id)++v17)
        {
          id v15 = [v13 countByEnumeratingWithState:&v32 objects:v43 count:16];
          if (v15) {
            goto LABEL_13;
          }
          break;
        }
      }
    }

    __int128 v30 = 0u;
    __int128 v31 = 0u;
    __int128 v28 = 0u;
    __int128 v29 = 0u;
    id v21 = [v4 countByEnumeratingWithState:&v28 objects:v42 count:16];
    if (v21)
    {
      id v22 = v21;
      uint64_t v23 = *(void *)v29;
      while (2)
      {
        for (i = 0LL; i != v22; i = (char *)i + 1)
        {
          if (*(void *)v29 != v23) {
            objc_enumerationMutation(v4);
          }
          __int128 v25 = *(void **)(*((void *)&v28 + 1) + 8LL * (void)i);
          if ((uint64_t)[v25 count] >= 1)
          {
            [v25 packetLoss];
            if (v26 < 100.0)
            {
              -[W5DiagnosticsTestResult setDidPass:](v3, "setDidPass:", 1LL);
              -[W5DiagnosticsTestResult setResult:](v3, "setResult:", 1LL);
              goto LABEL_31;
            }
          }
        }

        id v22 = [v4 countByEnumeratingWithState:&v28 objects:v42 count:16];
        if (v22) {
          continue;
        }
        break;
      }
    }

- (id)__testPingLANUsingCFNetworkWithConfiguration:(id)a3
{
  id v5 = objc_alloc_init(&OBJC_CLASS___W5DiagnosticsTestResult);
  -[W5DiagnosticsTestResult setTestID:](v5, "setTestID:", 3LL);
  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  -[W5DiagnosticsTestResult setTestStarted:](v5, "setTestStarted:");
  id v6 = [a3 objectForKeyedSubscript:@"PingCount"];
  id v7 = [a3 objectForKeyedSubscript:@"PingTimeout"];
  id v8 = [a3 objectForKeyedSubscript:@"PingDataLength"];
  if (v6)
  {
    uint64_t v9 = (uint64_t)[v6 integerValue];
    if (v7) {
      goto LABEL_3;
    }
  }

  else
  {
    uint64_t v9 = 1LL;
    if (v7)
    {
LABEL_3:
      [v7 doubleValue];
      double v11 = v10;
      if (!v8) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }

  double v11 = 2.0;
  if (v8) {
LABEL_4:
  }
    id v8 = [v8 unsignedIntegerValue];
LABEL_5:
  id v12 = [a3 objectForKeyedSubscript:@"PingTrafficClass"];
  if (-[CWFInterface SSID](-[W5StatusManager corewifi](self->_status, "corewifi"), "SSID"))
  {
    id v13 = -[CWFInterface IPv4RouterAddress](-[W5StatusManager corewifi](self->_status, "corewifi"), "IPv4RouterAddress");
    id v14 = -[CWFInterface IPv6RouterAddress](-[W5StatusManager corewifi](self->_status, "corewifi"), "IPv6RouterAddress");
    if (v13 || (id v13 = v14) != 0LL)
    {
      id v15 = -[W5DiagnosticsManager __performCFPingWithAddress:count:timeout:trafficClass:networkServiceType:dataLength:]( self,  "__performCFPingWithAddress:count:timeout:trafficClass:networkServiceType:dataLength:",  v13,  v9,  v12,  0LL,  v8,  v11);
      if (v15)
      {
        uint64_t v16 = v15;
        if ((uint64_t)[v15 count] >= 1)
        {
          [v16 packetLoss];
          if (v17 < 100.0)
          {
            -[W5DiagnosticsTestResult setDidPass:](v5, "setDidPass:", 1LL);
            -[W5DiagnosticsTestResult setResult:](v5, "setResult:", 1LL);
          }
        }

        double v19 = @"PingResult";
        double v20 = v16;
        -[W5DiagnosticsTestResult setInfo:]( v5,  "setInfo:",  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v20,  &v19,  1LL));
      }
    }
  }

  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  -[W5DiagnosticsTestResult setTestCompleted:](v5, "setTestCompleted:");
  return v5;
}

- (id)__testPingWANUsingCFNetworkWithConfiguration:(id)a3
{
  id v4 = objc_alloc_init(&OBJC_CLASS___W5DiagnosticsTestResult);
  -[W5DiagnosticsTestResult setTestID:](v4, "setTestID:", 6LL);
  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  -[W5DiagnosticsTestResult setTestStarted:](v4, "setTestStarted:");
  id v5 = [a3 objectForKeyedSubscript:@"PingCount"];
  id v6 = [a3 objectForKeyedSubscript:@"PingTimeout"];
  id v7 = [a3 objectForKeyedSubscript:@"PingDataLength"];
  id v8 = [a3 objectForKeyedSubscript:@"PingWANUseAppleDNS"];
  id v9 = [a3 objectForKeyedSubscript:@"PingDataLength"];
  id v10 = [a3 objectForKeyedSubscript:@"IPAddress"];
  if (v5)
  {
    uint64_t v11 = (uint64_t)[v5 integerValue];
    if (v6) {
      goto LABEL_3;
    }
  }

  else
  {
    uint64_t v11 = 1LL;
    if (v6)
    {
LABEL_3:
      [v6 doubleValue];
      double v13 = v12;
      if (!v7) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }

  double v13 = 2.0;
  if (v7) {
LABEL_4:
  }
    id v7 = [v7 unsignedIntegerValue];
LABEL_5:
  if (v8)
  {
    char v14 = [v8 BOOLValue] ^ 1;
    if (v9)
    {
LABEL_7:
      unsigned __int8 v15 = [v9 BOOLValue];
      goto LABEL_13;
    }
  }

  else
  {
    char v14 = 1;
    if (v9) {
      goto LABEL_7;
    }
  }

  unsigned __int8 v15 = 1;
LABEL_13:
  id v16 = [a3 objectForKeyedSubscript:@"PingTrafficClass"];
  if (-[CWFInterface SSID](-[W5StatusManager corewifi](self->_status, "corewifi"), "SSID"))
  {
    id v17 = +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array");
    char v44 = v4;
    if ((v14 & 1) != 0)
    {
      if (v10)
      {
        id v18 = -[W5DiagnosticsManager __performCFPingWithAddress:count:timeout:trafficClass:networkServiceType:dataLength:]( self,  "__performCFPingWithAddress:count:timeout:trafficClass:networkServiceType:dataLength:",  v10,  v11,  v16,  0LL,  v7,  v13);
        if (v18) {
          [v17 addObject:v18];
        }
      }

      else
      {
        id v28 = -[CWFInterface DNSServerAddresses]( -[W5StatusManager corewifi](self->_status, "corewifi"),  "DNSServerAddresses");
        __int128 v51 = 0u;
        __int128 v52 = 0u;
        __int128 v53 = 0u;
        __int128 v54 = 0u;
        id v29 = [v28 countByEnumeratingWithState:&v51 objects:v62 count:16];
        if (v29)
        {
          id v30 = v29;
          uint64_t v31 = *(void *)v52;
          do
          {
            for (i = 0LL; i != v30; i = (char *)i + 1)
            {
              if (*(void *)v52 != v31) {
                objc_enumerationMutation(v28);
              }
              id v33 = -[W5DiagnosticsManager __performCFPingWithAddress:count:timeout:trafficClass:networkServiceType:dataLength:]( self,  "__performCFPingWithAddress:count:timeout:trafficClass:networkServiceType:dataLength:",  *(void *)(*((void *)&v51 + 1) + 8LL * (void)i),  v11,  v16,  0LL,  v7,  v13,  v44);
              if (v33)
              {
                __int128 v34 = v33;
                [v17 addObject:v33];
                [v34 packetLoss];
                if (v35 < 100.0) {
                  char v36 = 1;
                }
                else {
                  char v36 = v15;
                }
                if ((v36 & 1) != 0) {
                  goto LABEL_47;
                }
              }

              else if ((v15 & 1) != 0)
              {
                goto LABEL_47;
              }
            }

            id v30 = [v28 countByEnumeratingWithState:&v51 objects:v62 count:16];
          }

          while (v30);
        }
      }
    }

    else
    {
      double v19 = sub_10008C29C();
      __int128 v55 = 0u;
      __int128 v56 = 0u;
      __int128 v57 = 0u;
      __int128 v58 = 0u;
      id v20 = [v19 countByEnumeratingWithState:&v55 objects:v63 count:16];
      if (v20)
      {
        id v21 = v20;
        uint64_t v22 = *(void *)v56;
        do
        {
          for (j = 0LL; j != v21; j = (char *)j + 1)
          {
            if (*(void *)v56 != v22) {
              objc_enumerationMutation(v19);
            }
            id v24 = -[W5DiagnosticsManager __performCFPingWithAddress:count:timeout:trafficClass:networkServiceType:dataLength:]( self,  "__performCFPingWithAddress:count:timeout:trafficClass:networkServiceType:dataLength:",  *(void *)(*((void *)&v55 + 1) + 8LL * (void)j),  v11,  v16,  0LL,  v7,  v13,  v44);
            if (v24)
            {
              __int128 v25 = v24;
              [v17 addObject:v24];
              [v25 packetLoss];
              if (v26 < 100.0) {
                char v27 = 1;
              }
              else {
                char v27 = v15;
              }
              if ((v27 & 1) != 0) {
                goto LABEL_47;
              }
            }

            else if ((v15 & 1) != 0)
            {
              goto LABEL_47;
            }
          }

          id v21 = [v19 countByEnumeratingWithState:&v55 objects:v63 count:16];
        }

        while (v21);
      }
    }

- (id)__testConcurrentWithConfiguration:(id)a3
{
  id v5 = objc_alloc_init(&OBJC_CLASS___W5DiagnosticsTestResult);
  -[W5DiagnosticsTestResult setTestID:](v5, "setTestID:", 53LL);
  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  -[W5DiagnosticsTestResult setTestStarted:](v5, "setTestStarted:");
  id v20 = v5;
  -[W5DiagnosticsTestResult setDidPass:](v5, "setDidPass:", 1LL);
  id v6 = [a3 objectForKeyedSubscript:@"InternalUUID"];
  id v7 = [a3 objectForKeyedSubscript:@"ConcurrentRequests"];
  id obj = +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array");
  id v21 = dispatch_queue_create(0LL, 0LL);
  id v8 = dispatch_group_create();
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  id v9 = [v7 countByEnumeratingWithState:&v29 objects:v34 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v30;
    do
    {
      for (i = 0LL; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v30 != v11) {
          objc_enumerationMutation(v7);
        }
        uint64_t v13 = *(void *)(*((void *)&v29 + 1) + 8LL * (void)i);
        dispatch_group_enter(v8);
        char v14 = -[W5StatusManager concurrentQueue](self->_status, "concurrentQueue");
        v28[0] = _NSConcreteStackBlock;
        v28[1] = 3221225472LL;
        v28[2] = sub_10003B2FC;
        v28[3] = &unk_1000D2700;
        v28[4] = v13;
        v28[5] = v6;
        v28[6] = self;
        v28[7] = v21;
        v28[8] = obj;
        v28[9] = v8;
        -[NSOperationQueue addOperationWithBlock:](v14, "addOperationWithBlock:", v28);
      }

      id v10 = [v7 countByEnumeratingWithState:&v29 objects:v34 count:16];
    }

    while (v10);
  }

  dispatch_group_wait(v8, 0xFFFFFFFFFFFFFFFFLL);
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  id v15 = [obj countByEnumeratingWithState:&v24 objects:v33 count:16];
  if (v15)
  {
    id v16 = v15;
    uint64_t v17 = *(void *)v25;
    while (2)
    {
      for (j = 0LL; j != v16; j = (char *)j + 1)
      {
        if (*(void *)v25 != v17) {
          objc_enumerationMutation(obj);
        }
        if (([*(id *)(*((void *)&v24 + 1) + 8 * (void)j) didPass] & 1) == 0)
        {
          -[W5DiagnosticsTestResult setDidPass:](v20, "setDidPass:", 0LL);
          goto LABEL_18;
        }
      }

      id v16 = [obj countByEnumeratingWithState:&v24 objects:v33 count:16];
      if (v16) {
        continue;
      }
      break;
    }
  }

- (id)__testResolveDNS
{
  double v3 = objc_alloc_init(&OBJC_CLASS___W5DiagnosticsTestResult);
  -[W5DiagnosticsTestResult setTestID:](v3, "setTestID:", 7LL);
  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  -[W5DiagnosticsTestResult setTestStarted:](v3, "setTestStarted:");
  if (-[CWFInterface SSID](-[W5StatusManager corewifi](self->_status, "corewifi"), "SSID"))
  {
    id v4 = +[W5DiagnosticsManager __performDNSResolution:]( &OBJC_CLASS___W5DiagnosticsManager,  "__performDNSResolution:",  @"captive.apple.com");
    if ([v4 count])
    {
      -[W5DiagnosticsTestResult setDidPass:](v3, "setDidPass:", 1LL);
      -[W5DiagnosticsTestResult setResult:](v3, "setResult:", 1LL);
      __int128 v15 = 0u;
      __int128 v16 = 0u;
      __int128 v13 = 0u;
      __int128 v14 = 0u;
      id v5 = [v4 countByEnumeratingWithState:&v13 objects:v20 count:16];
      if (v5)
      {
        id v6 = v5;
        uint64_t v7 = *(void *)v14;
        while (2)
        {
          for (i = 0LL; i != v6; i = (char *)i + 1)
          {
            if (*(void *)v14 != v7) {
              objc_enumerationMutation(v4);
            }
            id v9 = *(void **)(*((void *)&v13 + 1) + 8LL * (void)i);
            id v10 = (const sockaddr *)[v9 bytes];
            if ((unint64_t)[v9 length] >= 0x10
              && v10->sa_family == 2
              && !getnameinfo(v10, v10->sa_len, v19, 0x10u, 0LL, 0, 2))
            {
              uint64_t v11 = +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v19,  1LL);
              if (v11)
              {
                uint64_t v17 = @"DNSResolution";
                id v18 = v11;
                -[W5DiagnosticsTestResult setInfo:]( v3,  "setInfo:",  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v18,  &v17,  1LL));
              }

              goto LABEL_16;
            }
          }

          id v6 = [v4 countByEnumeratingWithState:&v13 objects:v20 count:16];
          if (v6) {
            continue;
          }
          break;
        }
      }
    }
  }

- (id)__testReachApple
{
  double v3 = objc_alloc_init(&OBJC_CLASS___W5DiagnosticsTestResult);
  -[W5DiagnosticsTestResult setTestID:](v3, "setTestID:", 9LL);
  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  -[W5DiagnosticsTestResult setTestStarted:](v3, "setTestStarted:");
  if ((-[CWFInterface reachabilityFlags]( -[W5StatusManager corewifi](self->_status, "corewifi"),  "reachabilityFlags") & 6) == 2)
  {
    -[W5DiagnosticsTestResult setDidPass:](v3, "setDidPass:", 1LL);
    -[W5DiagnosticsTestResult setResult:](v3, "setResult:", 1LL);
  }

  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  -[W5DiagnosticsTestResult setTestCompleted:](v3, "setTestCompleted:");
  return v3;
}

- (id)__testRetrieveApple
{
  double v3 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"https://%@",  @"captive.apple.com");
  id v4 = objc_alloc_init(&OBJC_CLASS___W5DiagnosticsTestResult);
  -[W5DiagnosticsTestResult setTestID:](v4, "setTestID:", 10LL);
  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  -[W5DiagnosticsTestResult setTestStarted:](v4, "setTestStarted:");
  if (-[W5DiagnosticsManager __performLoadViaNSURLSessionWithAddress:usingTimeout:andForceWiFiInterface:]( self,  "__performLoadViaNSURLSessionWithAddress:usingTimeout:andForceWiFiInterface:",  v3,  0LL,  0LL))
  {
    -[W5DiagnosticsTestResult setDidPass:](v4, "setDidPass:", 1LL);
    -[W5DiagnosticsTestResult setResult:](v4, "setResult:", 1LL);
  }

  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  -[W5DiagnosticsTestResult setTestCompleted:](v4, "setTestCompleted:");
  return v4;
}

- (id)__testRetrieveAppleForceWiFiWithConfiguration:(id)a3
{
  id v5 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"https://%@",  @"captive.apple.com");
  id v6 = [a3 objectForKeyedSubscript:@"Timeout"];
  uint64_t v7 = objc_alloc_init(&OBJC_CLASS___W5DiagnosticsTestResult);
  -[W5DiagnosticsTestResult setTestID:](v7, "setTestID:", 11LL);
  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  -[W5DiagnosticsTestResult setTestStarted:](v7, "setTestStarted:");
  if (-[W5DiagnosticsManager __performLoadViaNSURLSessionWithAddress:usingTimeout:andForceWiFiInterface:]( self,  "__performLoadViaNSURLSessionWithAddress:usingTimeout:andForceWiFiInterface:",  v5,  v6,  1LL))
  {
    -[W5DiagnosticsTestResult setDidPass:](v7, "setDidPass:", 1LL);
    -[W5DiagnosticsTestResult setResult:](v7, "setResult:", 1LL);
  }

  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  -[W5DiagnosticsTestResult setTestCompleted:](v7, "setTestCompleted:");
  return v7;
}

- (id)__testCurlApple
{
  double v3 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"https://%@",  @"captive.apple.com");
  id v4 = objc_alloc_init(&OBJC_CLASS___W5DiagnosticsTestResult);
  -[W5DiagnosticsTestResult setTestID:](v4, "setTestID:", 54LL);
  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  -[W5DiagnosticsTestResult setTestStarted:](v4, "setTestStarted:");
  if (-[W5DiagnosticsManager __performCurlWithAddress:](self, "__performCurlWithAddress:", v3))
  {
    -[W5DiagnosticsTestResult setDidPass:](v4, "setDidPass:", 1LL);
    -[W5DiagnosticsTestResult setResult:](v4, "setResult:", 1LL);
  }

  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  -[W5DiagnosticsTestResult setTestCompleted:](v4, "setTestCompleted:");
  return v4;
}

- (id)__testIPv4Assigned
{
  double v3 = objc_alloc_init(&OBJC_CLASS___W5DiagnosticsTestResult);
  -[W5DiagnosticsTestResult setTestID:](v3, "setTestID:", 12LL);
  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  -[W5DiagnosticsTestResult setTestStarted:](v3, "setTestStarted:");
  id v4 = -[CWFInterface IPv4Addresses](-[W5StatusManager corewifi](self->_status, "corewifi"), "IPv4Addresses");
  id v5 = -[CWFInterface IPv4RouterAddress](-[W5StatusManager corewifi](self->_status, "corewifi"), "IPv4RouterAddress");
  if ([v4 count]) {
    BOOL v6 = v5 == 0LL;
  }
  else {
    BOOL v6 = 1;
  }
  if (!v6)
  {
    -[W5DiagnosticsTestResult setDidPass:](v3, "setDidPass:", 1LL);
    -[W5DiagnosticsTestResult setResult:](v3, "setResult:", 1LL);
    v8[0] = @"IPv4Addresses";
    v8[1] = @"IPv4Router";
    v9[0] = v4;
    v9[1] = v5;
    -[W5DiagnosticsTestResult setInfo:]( v3,  "setInfo:",  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v9,  v8,  2LL));
  }

  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  -[W5DiagnosticsTestResult setTestCompleted:](v3, "setTestCompleted:");
  return v3;
}

- (id)__testPeerDiagnostics
{
  double v3 = objc_alloc_init(&OBJC_CLASS___W5DiagnosticsTestResult);
  -[W5DiagnosticsTestResult setTestID:](v3, "setTestID:", 60LL);
  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  -[W5DiagnosticsTestResult setTestStarted:](v3, "setTestStarted:");
  id v4 = -[W5PeerDiagnosticsManager gatherPeerDiagnostics](self->_peerDiagnostics, "gatherPeerDiagnostics");
  if ([v4 count])
  {
    -[W5DiagnosticsTestResult setResult:](v3, "setResult:", 1LL);
    -[W5DiagnosticsTestResult setDidPass:](v3, "setDidPass:", 1LL);
    BOOL v6 = @"PeerDiagnosticsResults";
    id v7 = v4;
    -[W5DiagnosticsTestResult setInfo:]( v3,  "setInfo:",  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v7,  &v6,  1LL));
  }

  else
  {
    -[W5DiagnosticsTestResult setDidPass:](v3, "setDidPass:", 1LL);
  }

  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  -[W5DiagnosticsTestResult setTestCompleted:](v3, "setTestCompleted:");
  return v3;
}

- (id)__testPeerTypes
{
  double v3 = objc_alloc_init(&OBJC_CLASS___W5DiagnosticsTestResult);
  -[W5DiagnosticsTestResult setTestID:](v3, "setTestID:", 61LL);
  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  -[W5DiagnosticsTestResult setTestStarted:](v3, "setTestStarted:");
  id v4 = -[W5PeerDiagnosticsManager gatherPeerTypes](self->_peerDiagnostics, "gatherPeerTypes");
  if (v4)
  {
    id v5 = v4;
    -[W5DiagnosticsTestResult setResult:](v3, "setResult:", 1LL);
    -[W5DiagnosticsTestResult setDidPass:](v3, "setDidPass:", 1LL);
    id v7 = @"PeerDevicesInfo";
    id v8 = v5;
    -[W5DiagnosticsTestResult setInfo:]( v3,  "setInfo:",  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v8,  &v7,  1LL));
  }

  else
  {
    -[W5DiagnosticsTestResult setDidPass:](v3, "setDidPass:", 1LL);
  }

  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  -[W5DiagnosticsTestResult setTestCompleted:](v3, "setTestCompleted:");
  return v3;
}

- (id)__testDiscoverPeerTypes
{
  double v3 = objc_alloc_init(&OBJC_CLASS___W5DiagnosticsTestResult);
  -[W5DiagnosticsTestResult setTestID:](v3, "setTestID:", 62LL);
  -[W5DiagnosticsTestResult setDidPass:](v3, "setDidPass:", 1LL);
  -[W5DiagnosticsTestResult setResult:](v3, "setResult:", 1LL);
  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  -[W5DiagnosticsTestResult setTestStarted:](v3, "setTestStarted:");
  -[W5PeerDiagnosticsManager beginPeerDiscovery](self->_peerDiagnostics, "beginPeerDiscovery");
  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  -[W5DiagnosticsTestResult setTestCompleted:](v3, "setTestCompleted:");
  return v3;
}

- (id)__testIPv6Assigned
{
  double v3 = objc_alloc_init(&OBJC_CLASS___W5DiagnosticsTestResult);
  -[W5DiagnosticsTestResult setTestID:](v3, "setTestID:", 13LL);
  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  -[W5DiagnosticsTestResult setTestStarted:](v3, "setTestStarted:");
  id v4 = -[CWFInterface IPv6Addresses](-[W5StatusManager corewifi](self->_status, "corewifi"), "IPv6Addresses");
  id v5 = -[CWFInterface IPv6RouterAddress](-[W5StatusManager corewifi](self->_status, "corewifi"), "IPv6RouterAddress");
  if ([v4 count]) {
    BOOL v6 = v5 == 0LL;
  }
  else {
    BOOL v6 = 1;
  }
  if (!v6)
  {
    -[W5DiagnosticsTestResult setDidPass:](v3, "setDidPass:", 1LL);
    -[W5DiagnosticsTestResult setResult:](v3, "setResult:", 1LL);
    v8[0] = @"IPv6Addresses";
    v8[1] = @"IPv6Router";
    v9[0] = v4;
    v9[1] = v5;
    -[W5DiagnosticsTestResult setInfo:]( v3,  "setInfo:",  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v9,  v8,  2LL));
  }

  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  -[W5DiagnosticsTestResult setTestCompleted:](v3, "setTestCompleted:");
  return v3;
}

- (id)__testCustomIPv4
{
  double v3 = objc_alloc_init(&OBJC_CLASS___W5DiagnosticsTestResult);
  -[W5DiagnosticsTestResult setTestID:](v3, "setTestID:", 14LL);
  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  -[W5DiagnosticsTestResult setTestStarted:](v3, "setTestStarted:");
  int64_t v4 = -[W5WiFiInterface ipv4ConfigMethod](-[W5StatusManager wifi](self->_status, "wifi"), "ipv4ConfigMethod");
  if (v4 == 3) {
    -[W5DiagnosticsTestResult setDidPass:](v3, "setDidPass:", 1LL);
  }
  else {
    -[W5DiagnosticsTestResult setResult:](v3, "setResult:", 1LL);
  }
  BOOL v6 = @"IPv4ConfigMethod";
  id v7 = +[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v4);
  -[W5DiagnosticsTestResult setInfo:]( v3,  "setInfo:",  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v7,  &v6,  1LL));
  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  -[W5DiagnosticsTestResult setTestCompleted:](v3, "setTestCompleted:");
  return v3;
}

- (id)__testCustomIPv6
{
  double v3 = objc_alloc_init(&OBJC_CLASS___W5DiagnosticsTestResult);
  -[W5DiagnosticsTestResult setTestID:](v3, "setTestID:", 15LL);
  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  -[W5DiagnosticsTestResult setTestStarted:](v3, "setTestStarted:");
  int64_t v4 = -[W5WiFiInterface ipv6ConfigMethod](-[W5StatusManager wifi](self->_status, "wifi"), "ipv6ConfigMethod");
  if (v4 == 1) {
    -[W5DiagnosticsTestResult setDidPass:](v3, "setDidPass:", 1LL);
  }
  else {
    -[W5DiagnosticsTestResult setResult:](v3, "setResult:", 1LL);
  }
  BOOL v6 = @"IPv6ConfigMethod";
  id v7 = +[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v4);
  -[W5DiagnosticsTestResult setInfo:]( v3,  "setInfo:",  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v7,  &v6,  1LL));
  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  -[W5DiagnosticsTestResult setTestCompleted:](v3, "setTestCompleted:");
  return v3;
}

- (id)__testCustomDNS
{
  double v3 = objc_alloc_init(&OBJC_CLASS___W5DiagnosticsTestResult);
  -[W5DiagnosticsTestResult setTestID:](v3, "setTestID:", 16LL);
  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  -[W5DiagnosticsTestResult setTestStarted:](v3, "setTestStarted:");
  if (-[W5WiFiInterface isUsingCustomDNSSettings]( -[W5StatusManager wifi](self->_status, "wifi"),  "isUsingCustomDNSSettings"))
  {
    -[W5DiagnosticsTestResult setResult:](v3, "setResult:", 1LL);
  }

  else
  {
    -[W5DiagnosticsTestResult setDidPass:](v3, "setDidPass:", 1LL);
  }

  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  -[W5DiagnosticsTestResult setTestCompleted:](v3, "setTestCompleted:");
  return v3;
}

- (id)__testCustomWebProxy
{
  double v3 = objc_alloc_init(&OBJC_CLASS___W5DiagnosticsTestResult);
  -[W5DiagnosticsTestResult setTestID:](v3, "setTestID:", 17LL);
  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  -[W5DiagnosticsTestResult setTestStarted:](v3, "setTestStarted:");
  if (-[W5WiFiInterface isUsingCustomProxySetting]( -[W5StatusManager wifi](self->_status, "wifi"),  "isUsingCustomProxySetting"))
  {
    -[W5DiagnosticsTestResult setResult:](v3, "setResult:", 1LL);
  }

  else
  {
    -[W5DiagnosticsTestResult setDidPass:](v3, "setDidPass:", 1LL);
  }

  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  -[W5DiagnosticsTestResult setTestCompleted:](v3, "setTestCompleted:");
  return v3;
}

- (id)__testCongestedChannelUsingCCAWithConfiguration:(id)a3
{
  id v3 = -[W5DiagnosticsManager __testCongestedChannelWithConfiguration:]( self,  "__testCongestedChannelWithConfiguration:",  a3);
  [v3 setTestID:23];
  return v3;
}

- (id)__testCongestedChannelWithConfiguration:(id)a3
{
  id v5 = objc_alloc_init(&OBJC_CLASS___W5DiagnosticsTestResult);
  -[W5DiagnosticsTestResult setTestID:](v5, "setTestID:", 24LL);
  -[W5DiagnosticsTestResult setConfiguration:](v5, "setConfiguration:", a3);
  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  -[W5DiagnosticsTestResult setTestStarted:](v5, "setTestStarted:");
  uint64_t v6 = (uint64_t)objc_msgSend(objc_msgSend(a3, "objectForKeyedSubscript:", @"MaxScanCacheAge"), "integerValue");
  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  if ((v6 & 0x8000000000000000LL) == 0)
  {
    double v8 = v7;
    if (v7 - self->_wifiScanTimestamp > (double)v6)
    {

      self->_wifiScanResults = (NSArray *) -[W5WiFiInterface performScanOnChannels:translate:]( -[W5StatusManager wifi](self->_status, "wifi"),  "performScanOnChannels:translate:",  0LL,  1LL);
      self->_wifiScanTimestamp = v8;
    }
  }

  id v9 = [a3 objectForKeyedSubscript:@"NetworkName"];
  if (v9) {
    id v10 = -[W5DiagnosticsManager __scanResultWithNetworkName:](self, "__scanResultWithNetworkName:", v9);
  }
  else {
    id v10 = -[W5StatusManager wifi](self->_status, "wifi");
  }
  id v11 = -[W5WiFiInterface channel](v10, "channel");
  id v12 = -[W5WiFiInterface supportedChannels](-[W5StatusManager wifi](self->_status, "wifi"), "supportedChannels");
  id v13 = -[W5DiagnosticsManager __overlappingChannelsForChannel:supportedChannels:]( self,  "__overlappingChannelsForChannel:supportedChannels:",  v11,  v12);
  id v14 = -[W5DiagnosticsManager __occupiedChannelsForScanResults:supportedChannels:rssiThreshold:ignoreChannel:]( self,  "__occupiedChannelsForScanResults:supportedChannels:rssiThreshold:ignoreChannel:",  self->_wifiScanResults,  v12,  -80LL,  v11);
  id v15 = -[W5DiagnosticsManager __orderedChannelWeights:]( self,  "__orderedChannelWeights:",  -[W5DiagnosticsManager __adjust5GHzWeights:]( self,  "__adjust5GHzWeights:",  -[W5DiagnosticsManager __applyChannelWeights:supportedChannels:]( self,  "__applyChannelWeights:supportedChannels:",  -[W5DiagnosticsManager __channelWeightsForScanResults:supportedChannels:rssiThreshold:]( self,  "__channelWeightsForScanResults:supportedChannels:rssiThreshold:",  self->_wifiScanResults,  v12,  -80LL),  v12)));
  id v42 = -[W5DiagnosticsManager __only2GHz_1_6_11_14_Channels:](self, "__only2GHz_1_6_11_14_Channels:", v15);
  id v43 = -[W5DiagnosticsManager __only5GHz20MHz40MHzChannels:](self, "__only5GHz20MHz40MHzChannels:", v15);
  id v44 = -[W5DiagnosticsManager __only5GHz40MHzChannels:](self, "__only5GHz40MHzChannels:", v43);
  id v45 = -[W5DiagnosticsManager __only5GHzNonDFSChannels:](self, "__only5GHzNonDFSChannels:", v43);
  __int128 v50 = 0u;
  __int128 v51 = 0u;
  __int128 v52 = 0u;
  __int128 v53 = 0u;
  id v16 = [v13 countByEnumeratingWithState:&v50 objects:v55 count:16];
  if (v16)
  {
    id v17 = v16;
    uint64_t v18 = 0LL;
    uint64_t v19 = 0LL;
    uint64_t v20 = *(void *)v51;
    do
    {
      for (i = 0LL; i != v17; i = (char *)i + 1)
      {
        if (*(void *)v51 != v20) {
          objc_enumerationMutation(v13);
        }
        v18 += [v14 containsObject:*(void *)(*((void *)&v50 + 1) + 8 * (void)i)];
      }

      v19 += (uint64_t)v17;
      id v17 = [v13 countByEnumeratingWithState:&v50 objects:v55 count:16];
    }

    while (v17);
    float v22 = (float)v18;
    float v23 = (float)v19;
  }

  else
  {
    float v22 = 0.0;
    float v23 = 0.0;
  }

  id v24 = +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array");
  __int128 v46 = 0u;
  __int128 v47 = 0u;
  __int128 v48 = 0u;
  __int128 v49 = 0u;
  wifiScanResults = self->_wifiScanResults;
  id v26 = -[NSArray countByEnumeratingWithState:objects:count:]( wifiScanResults,  "countByEnumeratingWithState:objects:count:",  &v46,  v54,  16LL);
  if (v26)
  {
    id v27 = v26;
    uint64_t v28 = *(void *)v47;
    do
    {
      for (j = 0LL; j != v27; j = (char *)j + 1)
      {
        if (*(void *)v47 != v28) {
          objc_enumerationMutation(wifiScanResults);
        }
        __int128 v30 = *(void **)(*((void *)&v46 + 1) + 8LL * (void)j);
        id v31 = objc_msgSend(objc_msgSend(v30, "channel"), "channel");
        if (v31 == [v11 channel]) {
          [v24 addObject:v30];
        }
      }

      id v27 = -[NSArray countByEnumeratingWithState:objects:count:]( wifiScanResults,  "countByEnumeratingWithState:objects:count:",  &v46,  v54,  16LL);
    }

    while (v27);
  }

  id v32 = -[CWFInterface cachedLinkQualityMetric]( -[W5StatusManager corewifi](self->_status, "corewifi"),  "cachedLinkQualityMetric");
  id v33 = objc_msgSend(objc_msgSend(v32, "linkQualityMetricData"), "bytes");
  if (v33 && v33[18])
  {
    double v35 = v44;
    __int128 v34 = v45;
    char v36 = v43;
    else {
      -[W5DiagnosticsTestResult setDidPass:](v5, "setDidPass:", 1LL);
    }
    id v38 = &Apple80211BindToInterface_ptr;
    id v40 = +[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary");
    objc_msgSend( v40,  "setObject:forKeyedSubscript:",  +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  objc_msgSend(v32, "CCA")),  @"CCA");
    uint64_t v39 = v42;
    if (!v11) {
      goto LABEL_36;
    }
LABEL_35:
    [v40 setObject:v11 forKeyedSubscript:@"CurrentChannel"];
    goto LABEL_36;
  }

  else {
    -[W5DiagnosticsTestResult setDidPass:](v5, "setDidPass:", 1LL, v37);
  }
  id v38 = &Apple80211BindToInterface_ptr;
  double v35 = v44;
  __int128 v34 = v45;
  uint64_t v39 = v42;
  char v36 = v43;
  id v40 = +[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary");
  if (v11) {
    goto LABEL_35;
  }
LABEL_36:
  if ([v39 count]) {
    objc_msgSend(v40, "setObject:forKeyedSubscript:", objc_msgSend(v39, "firstObject"), @"2GHzChannel");
  }
  if ([v36 count]) {
    objc_msgSend(v40, "setObject:forKeyedSubscript:", objc_msgSend(v36, "firstObject"), @"5GHzChannel");
  }
  if ([v35 count]) {
    objc_msgSend(v40, "setObject:forKeyedSubscript:", objc_msgSend(v35, "firstObject"), @"5GHz40MHzChannel");
  }
  if ([v34 count]) {
    objc_msgSend(v40, "setObject:forKeyedSubscript:", objc_msgSend(v34, "firstObject"), @"5GHzNonDFSChannel");
  }
  -[W5DiagnosticsTestResult setInfo:](v5, "setInfo:", [v40 copy]);
  [v38[116] timeIntervalSinceReferenceDate];
  -[W5DiagnosticsTestResult setTestCompleted:](v5, "setTestCompleted:");
  return v5;
}

- (id)__testCongested2GHzWithConfiguration:(id)a3
{
  id v5 = objc_alloc_init(&OBJC_CLASS___W5DiagnosticsTestResult);
  -[W5DiagnosticsTestResult setTestID:](v5, "setTestID:", 25LL);
  -[W5DiagnosticsTestResult setConfiguration:](v5, "setConfiguration:", a3);
  uint64_t v6 = &Apple80211BindToInterface_ptr;
  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  -[W5DiagnosticsTestResult setTestStarted:](v5, "setTestStarted:");
  uint64_t v7 = (uint64_t)objc_msgSend(objc_msgSend(a3, "objectForKeyedSubscript:", @"MaxScanCacheAge"), "integerValue");
  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  if ((v7 & 0x8000000000000000LL) == 0)
  {
    double v9 = v8;
    if (v8 - self->_wifiScanTimestamp > (double)v7)
    {

      self->_wifiScanResults = (NSArray *) -[W5WiFiInterface performScanOnChannels:translate:]( -[W5StatusManager wifi](self->_status, "wifi"),  "performScanOnChannels:translate:",  0LL,  1LL);
      self->_wifiScanTimestamp = v9;
    }
  }

  id v10 = -[W5WiFiInterface supportedChannels](-[W5StatusManager wifi](self->_status, "wifi"), "supportedChannels");
  id v11 = -[W5DiagnosticsManager __only2GHzChannels:](self, "__only2GHzChannels:", v10);
  id v12 = -[W5DiagnosticsManager __occupiedChannelsForScanResults:supportedChannels:rssiThreshold:ignoreChannel:]( self,  "__occupiedChannelsForScanResults:supportedChannels:rssiThreshold:ignoreChannel:",  self->_wifiScanResults,  v11,  -80LL,  0LL);
  id v13 = -[W5DiagnosticsManager __orderedChannelWeights:]( self,  "__orderedChannelWeights:",  -[W5DiagnosticsManager __adjust5GHzWeights:]( self,  "__adjust5GHzWeights:",  -[W5DiagnosticsManager __applyChannelWeights:supportedChannels:]( self,  "__applyChannelWeights:supportedChannels:",  -[W5DiagnosticsManager __channelWeightsForScanResults:supportedChannels:rssiThreshold:]( self,  "__channelWeightsForScanResults:supportedChannels:rssiThreshold:",  self->_wifiScanResults,  v10,  -80LL),  v10)));
  id v14 = -[W5DiagnosticsManager __only2GHz_1_6_11_14_Channels:](self, "__only2GHz_1_6_11_14_Channels:", v13);
  id v15 = -[W5DiagnosticsManager __only5GHz20MHz40MHzChannels:](self, "__only5GHz20MHz40MHzChannels:", v13);
  id v16 = -[W5DiagnosticsManager __only5GHz40MHzChannels:](self, "__only5GHz40MHzChannels:", v15);
  id v17 = -[W5DiagnosticsManager __only5GHzNonDFSChannels:](self, "__only5GHzNonDFSChannels:", v15);
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  id v18 = [v11 countByEnumeratingWithState:&v31 objects:v35 count:16];
  if (!v18) {
    goto LABEL_13;
  }
  id v19 = v18;
  id v27 = v14;
  id v28 = v16;
  id v29 = v17;
  __int128 v30 = v5;
  uint64_t v20 = 0LL;
  uint64_t v21 = 0LL;
  uint64_t v22 = *(void *)v32;
  do
  {
    for (i = 0LL; i != v19; i = (char *)i + 1)
    {
      if (*(void *)v32 != v22) {
        objc_enumerationMutation(v11);
      }
      v20 += objc_msgSend( v12,  "containsObject:",  +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  objc_msgSend(*(id *)(*((void *)&v31 + 1) + 8 * (void)i), "channel", v27, v28, v29)));
    }

    v21 += (uint64_t)v19;
    id v19 = [v11 countByEnumeratingWithState:&v31 objects:v35 count:16];
  }

  while (v19);
  float v24 = (float)v20 / (float)v21;
  id v17 = v29;
  id v5 = v30;
  uint64_t v6 = &Apple80211BindToInterface_ptr;
  id v14 = v27;
  id v16 = v28;
  if (v24 > 0.75) {
    -[W5DiagnosticsTestResult setResult:](v30, "setResult:", 1LL);
  }
  else {
LABEL_13:
  }
    -[W5DiagnosticsTestResult setDidPass:](v5, "setDidPass:", 1LL);
  id v25 = +[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary");
  if ([v14 count]) {
    objc_msgSend(v25, "setObject:forKeyedSubscript:", objc_msgSend(v14, "firstObject"), @"2GHzChannel");
  }
  if ([v15 count]) {
    objc_msgSend(v25, "setObject:forKeyedSubscript:", objc_msgSend(v15, "firstObject"), @"5GHzChannel");
  }
  if ([v16 count]) {
    objc_msgSend(v25, "setObject:forKeyedSubscript:", objc_msgSend(v16, "firstObject"), @"5GHz40MHzChannel");
  }
  if ([v17 count]) {
    objc_msgSend(v25, "setObject:forKeyedSubscript:", objc_msgSend(v17, "firstObject"), @"5GHzNonDFSChannel");
  }
  -[W5DiagnosticsTestResult setInfo:](v5, "setInfo:", [v25 copy]);
  [v6[116] timeIntervalSinceReferenceDate];
  -[W5DiagnosticsTestResult setTestCompleted:](v5, "setTestCompleted:");
  return v5;
}

- (id)__testCongested5GHzWithConfiguration:(id)a3
{
  id v5 = objc_alloc_init(&OBJC_CLASS___W5DiagnosticsTestResult);
  -[W5DiagnosticsTestResult setTestID:](v5, "setTestID:", 26LL);
  -[W5DiagnosticsTestResult setConfiguration:](v5, "setConfiguration:", a3);
  uint64_t v6 = &Apple80211BindToInterface_ptr;
  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  -[W5DiagnosticsTestResult setTestStarted:](v5, "setTestStarted:");
  uint64_t v7 = (uint64_t)objc_msgSend(objc_msgSend(a3, "objectForKeyedSubscript:", @"MaxScanCacheAge"), "integerValue");
  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  if ((v7 & 0x8000000000000000LL) == 0)
  {
    double v9 = v8;
    if (v8 - self->_wifiScanTimestamp > (double)v7)
    {

      self->_wifiScanResults = (NSArray *) -[W5WiFiInterface performScanOnChannels:translate:]( -[W5StatusManager wifi](self->_status, "wifi"),  "performScanOnChannels:translate:",  0LL,  1LL);
      self->_wifiScanTimestamp = v9;
    }
  }

  id v10 = -[W5WiFiInterface supportedChannels](-[W5StatusManager wifi](self->_status, "wifi"), "supportedChannels");
  id v11 = -[W5DiagnosticsManager __only5GHzChannels:](self, "__only5GHzChannels:", v10);
  id v12 = -[W5DiagnosticsManager __occupiedChannelsForScanResults:supportedChannels:rssiThreshold:ignoreChannel:]( self,  "__occupiedChannelsForScanResults:supportedChannels:rssiThreshold:ignoreChannel:",  self->_wifiScanResults,  v11,  -80LL,  0LL);
  id v13 = -[W5DiagnosticsManager __orderedChannelWeights:]( self,  "__orderedChannelWeights:",  -[W5DiagnosticsManager __adjust5GHzWeights:]( self,  "__adjust5GHzWeights:",  -[W5DiagnosticsManager __applyChannelWeights:supportedChannels:]( self,  "__applyChannelWeights:supportedChannels:",  -[W5DiagnosticsManager __channelWeightsForScanResults:supportedChannels:rssiThreshold:]( self,  "__channelWeightsForScanResults:supportedChannels:rssiThreshold:",  self->_wifiScanResults,  v10,  -80LL),  v10)));
  id v14 = -[W5DiagnosticsManager __only2GHz_1_6_11_14_Channels:](self, "__only2GHz_1_6_11_14_Channels:", v13);
  id v15 = -[W5DiagnosticsManager __only5GHz20MHz40MHzChannels:](self, "__only5GHz20MHz40MHzChannels:", v13);
  id v16 = -[W5DiagnosticsManager __only5GHz40MHzChannels:](self, "__only5GHz40MHzChannels:", v15);
  id v17 = -[W5DiagnosticsManager __only5GHzNonDFSChannels:](self, "__only5GHzNonDFSChannels:", v15);
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  id v18 = [v11 countByEnumeratingWithState:&v31 objects:v35 count:16];
  if (!v18) {
    goto LABEL_13;
  }
  id v19 = v18;
  id v27 = v14;
  id v28 = v16;
  id v29 = v17;
  __int128 v30 = v5;
  uint64_t v20 = 0LL;
  uint64_t v21 = 0LL;
  uint64_t v22 = *(void *)v32;
  do
  {
    for (i = 0LL; i != v19; i = (char *)i + 1)
    {
      if (*(void *)v32 != v22) {
        objc_enumerationMutation(v11);
      }
      v20 += objc_msgSend( v12,  "containsObject:",  +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  objc_msgSend(*(id *)(*((void *)&v31 + 1) + 8 * (void)i), "channel", v27, v28, v29)));
    }

    v21 += (uint64_t)v19;
    id v19 = [v11 countByEnumeratingWithState:&v31 objects:v35 count:16];
  }

  while (v19);
  float v24 = (float)v20 / (float)v21;
  id v17 = v29;
  id v5 = v30;
  uint64_t v6 = &Apple80211BindToInterface_ptr;
  id v14 = v27;
  id v16 = v28;
  if (v24 > 0.75) {
    -[W5DiagnosticsTestResult setResult:](v30, "setResult:", 1LL);
  }
  else {
LABEL_13:
  }
    -[W5DiagnosticsTestResult setDidPass:](v5, "setDidPass:", 1LL);
  id v25 = +[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary");
  if ([v14 count]) {
    objc_msgSend(v25, "setObject:forKeyedSubscript:", objc_msgSend(v14, "firstObject"), @"2GHzChannel");
  }
  if ([v15 count]) {
    objc_msgSend(v25, "setObject:forKeyedSubscript:", objc_msgSend(v15, "firstObject"), @"5GHzChannel");
  }
  if ([v16 count]) {
    objc_msgSend(v25, "setObject:forKeyedSubscript:", objc_msgSend(v16, "firstObject"), @"5GHz40MHzChannel");
  }
  if ([v17 count]) {
    objc_msgSend(v25, "setObject:forKeyedSubscript:", objc_msgSend(v17, "firstObject"), @"5GHzNonDFSChannel");
  }
  -[W5DiagnosticsTestResult setInfo:](v5, "setInfo:", [v25 copy]);
  [v6[116] timeIntervalSinceReferenceDate];
  -[W5DiagnosticsTestResult setTestCompleted:](v5, "setTestCompleted:");
  return v5;
}

- (id)__testHT402GHzWithConfiguration:(id)a3
{
  id v5 = objc_alloc_init(&OBJC_CLASS___W5DiagnosticsTestResult);
  -[W5DiagnosticsTestResult setTestID:](v5, "setTestID:", 27LL);
  -[W5DiagnosticsTestResult setConfiguration:](v5, "setConfiguration:", a3);
  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  -[W5DiagnosticsTestResult setTestStarted:](v5, "setTestStarted:");
  uint64_t v6 = (uint64_t)objc_msgSend(objc_msgSend(a3, "objectForKeyedSubscript:", @"MaxScanCacheAge"), "integerValue");
  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  if ((v6 & 0x8000000000000000LL) == 0)
  {
    double v8 = v7;
    if (v7 - self->_wifiScanTimestamp > (double)v6)
    {

      self->_wifiScanResults = (NSArray *) -[W5WiFiInterface performScanOnChannels:translate:]( -[W5StatusManager wifi](self->_status, "wifi"),  "performScanOnChannels:translate:",  0LL,  1LL);
      self->_wifiScanTimestamp = v8;
    }
  }

  id v9 = +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array");
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  wifiScanResults = self->_wifiScanResults;
  id v11 = -[NSArray countByEnumeratingWithState:objects:count:]( wifiScanResults,  "countByEnumeratingWithState:objects:count:",  &v24,  v28,  16LL);
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v25;
    do
    {
      for (i = 0LL; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v25 != v13) {
          objc_enumerationMutation(wifiScanResults);
        }
        id v15 = *(void **)(*((void *)&v24 + 1) + 8LL * (void)i);
        if ((objc_msgSend(objc_msgSend(v15, "channel"), "flags") & 8) != 0
          && (objc_msgSend(objc_msgSend(v15, "channel"), "flags") & 4) != 0)
        {
          [v9 addObject:v15];
        }
      }

      id v12 = -[NSArray countByEnumeratingWithState:objects:count:]( wifiScanResults,  "countByEnumeratingWithState:objects:count:",  &v24,  v28,  16LL);
    }

    while (v12);
  }

  id v16 = +[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary");
  if ([v9 count])
  {
    -[W5DiagnosticsTestResult setResult:](v5, "setResult:", 1LL);
    objc_msgSend(v16, "setObject:forKeyedSubscript:", objc_msgSend(v9, "copy"), @"ScanResults");
  }

  else
  {
    -[W5DiagnosticsTestResult setDidPass:](v5, "setDidPass:", 1LL);
  }

  id v17 = -[W5WiFiInterface supportedChannels](-[W5StatusManager wifi](self->_status, "wifi"), "supportedChannels");
  id v18 = -[W5DiagnosticsManager __orderedChannelWeights:]( self,  "__orderedChannelWeights:",  -[W5DiagnosticsManager __adjust5GHzWeights:]( self,  "__adjust5GHzWeights:",  -[W5DiagnosticsManager __applyChannelWeights:supportedChannels:]( self,  "__applyChannelWeights:supportedChannels:",  -[W5DiagnosticsManager __channelWeightsForScanResults:supportedChannels:rssiThreshold:]( self,  "__channelWeightsForScanResults:supportedChannels:rssiThreshold:",  self->_wifiScanResults,  v17,  -80LL),  v17)));
  id v19 = -[W5DiagnosticsManager __only2GHz_1_6_11_14_Channels:](self, "__only2GHz_1_6_11_14_Channels:", v18);
  id v20 = -[W5DiagnosticsManager __only5GHz20MHz40MHzChannels:](self, "__only5GHz20MHz40MHzChannels:", v18);
  id v21 = -[W5DiagnosticsManager __only5GHz40MHzChannels:](self, "__only5GHz40MHzChannels:", v20);
  id v22 = -[W5DiagnosticsManager __only5GHzNonDFSChannels:](self, "__only5GHzNonDFSChannels:", v20);
  if ([v19 count]) {
    objc_msgSend(v16, "setObject:forKeyedSubscript:", objc_msgSend(v19, "firstObject"), @"2GHzChannel");
  }
  if ([v20 count]) {
    objc_msgSend(v16, "setObject:forKeyedSubscript:", objc_msgSend(v20, "firstObject"), @"5GHzChannel");
  }
  if ([v21 count]) {
    objc_msgSend(v16, "setObject:forKeyedSubscript:", objc_msgSend(v21, "firstObject"), @"5GHz40MHzChannel");
  }
  if ([v22 count]) {
    objc_msgSend(v16, "setObject:forKeyedSubscript:", objc_msgSend(v22, "firstObject"), @"5GHzNonDFSChannel");
  }
  -[W5DiagnosticsTestResult setInfo:](v5, "setInfo:", [v16 copy]);
  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  -[W5DiagnosticsTestResult setTestCompleted:](v5, "setTestCompleted:");
  return v5;
}

- (id)__testNoSecurityWithConfiguration:(id)a3
{
  id v5 = objc_alloc_init(&OBJC_CLASS___W5DiagnosticsTestResult);
  -[W5DiagnosticsTestResult setTestID:](v5, "setTestID:", 38LL);
  -[W5DiagnosticsTestResult setConfiguration:](v5, "setConfiguration:", a3);
  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  -[W5DiagnosticsTestResult setTestStarted:](v5, "setTestStarted:");
  id v6 = [a3 objectForKeyedSubscript:@"NetworkName"];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = (uint64_t)objc_msgSend(objc_msgSend(a3, "objectForKeyedSubscript:", @"MaxScanCacheAge"), "integerValue");
    +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
    if ((v8 & 0x8000000000000000LL) == 0)
    {
      double v10 = v9;
      if (v9 - self->_wifiScanTimestamp > (double)v8)
      {

        self->_wifiScanResults = (NSArray *) -[W5WiFiInterface performScanOnChannels:translate:]( -[W5StatusManager wifi](self->_status, "wifi"),  "performScanOnChannels:translate:",  0LL,  1LL);
        self->_wifiScanTimestamp = v10;
      }
    }

    id v11 = -[W5DiagnosticsManager __scanResultWithNetworkName:](self, "__scanResultWithNetworkName:", v7);
    if (v11)
    {
      id v12 = v11;
      id v13 = [v11 strongestSupportedSecurity];
      if (v13) {
        -[W5DiagnosticsTestResult setDidPass:](v5, "setDidPass:", 1LL);
      }
      else {
        -[W5DiagnosticsTestResult setResult:](v5, "setResult:", 1LL);
      }
      v21[0] = @"ScanResult";
      v21[1] = @"Security";
      v22[0] = v12;
      v22[1] = +[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v13);
      id v15 = (NSNumber **)v22;
      id v16 = (const __CFString **)v21;
      uint64_t v17 = 2LL;
LABEL_15:
      -[W5DiagnosticsTestResult setInfo:]( v5,  "setInfo:",  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v15,  v16,  v17));
    }
  }

  else if (-[CWFInterface SSID](-[W5StatusManager corewifi](self->_status, "corewifi"), "SSID"))
  {
    int64_t v14 = -[W5WiFiInterface security](-[W5StatusManager wifi](self->_status, "wifi"), "security");
    if (v14) {
      -[W5DiagnosticsTestResult setDidPass:](v5, "setDidPass:", 1LL);
    }
    else {
      -[W5DiagnosticsTestResult setResult:](v5, "setResult:", 1LL);
    }
    id v19 = @"Security";
    id v20 = +[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v14);
    id v15 = &v20;
    id v16 = &v19;
    uint64_t v17 = 1LL;
    goto LABEL_15;
  }

  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  -[W5DiagnosticsTestResult setTestCompleted:](v5, "setTestCompleted:");
  return v5;
}

- (id)__testLegacySecurityWEPWithConfiguration:(id)a3
{
  id v5 = objc_alloc_init(&OBJC_CLASS___W5DiagnosticsTestResult);
  -[W5DiagnosticsTestResult setTestID:](v5, "setTestID:", 39LL);
  -[W5DiagnosticsTestResult setConfiguration:](v5, "setConfiguration:", a3);
  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  -[W5DiagnosticsTestResult setTestStarted:](v5, "setTestStarted:");
  id v6 = [a3 objectForKeyedSubscript:@"NetworkName"];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = (uint64_t)objc_msgSend(objc_msgSend(a3, "objectForKeyedSubscript:", @"MaxScanCacheAge"), "integerValue");
    +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
    if ((v8 & 0x8000000000000000LL) == 0)
    {
      double v10 = v9;
      if (v9 - self->_wifiScanTimestamp > (double)v8)
      {

        self->_wifiScanResults = (NSArray *) -[W5WiFiInterface performScanOnChannels:translate:]( -[W5StatusManager wifi](self->_status, "wifi"),  "performScanOnChannels:translate:",  0LL,  1LL);
        self->_wifiScanTimestamp = v10;
      }
    }

    id v11 = -[W5DiagnosticsManager __scanResultWithNetworkName:](self, "__scanResultWithNetworkName:", v7);
    if (v11)
    {
      id v12 = v11;
      id v13 = [v11 supportedSecurityTypes];
      if (([v13 containsObject:&off_1000DED18] & 1) != 0
        || ([v13 containsObject:&off_1000DED30] & 1) != 0
        || [v12 supportsWEPCipher])
      {
        -[W5DiagnosticsTestResult setResult:](v5, "setResult:", 1LL);
      }

      else
      {
        -[W5DiagnosticsTestResult setDidPass:](v5, "setDidPass:", 1LL);
      }

      v22[0] = @"ScanResult";
      v22[1] = @"Security";
      v23[0] = v12;
      v23[1] = +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [v12 strongestSupportedSecurity]);
      int64_t v14 = (NSNumber **)v23;
      id v15 = (const __CFString **)v22;
      uint64_t v16 = 2LL;
LABEL_17:
      -[W5DiagnosticsTestResult setInfo:]( v5,  "setInfo:",  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v14,  v15,  v16));
    }
  }

  else if (-[CWFInterface SSID](-[W5StatusManager corewifi](self->_status, "corewifi"), "SSID"))
  {
    int64_t v17 = -[W5WiFiInterface security](-[W5StatusManager wifi](self->_status, "wifi"), "security");
    id v18 = -[W5WiFiInterface currentNetwork](-[W5StatusManager wifi](self->_status, "wifi"), "currentNetwork");
    else {
      -[W5DiagnosticsTestResult setDidPass:](v5, "setDidPass:", 1LL);
    }
    id v20 = @"Security";
    id v21 = +[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v17);
    int64_t v14 = &v21;
    id v15 = &v20;
    uint64_t v16 = 1LL;
    goto LABEL_17;
  }

  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  -[W5DiagnosticsTestResult setTestCompleted:](v5, "setTestCompleted:");
  return v5;
}

- (id)__testLegacySecurityWPAWithConfiguration:(id)a3
{
  id v5 = objc_alloc_init(&OBJC_CLASS___W5DiagnosticsTestResult);
  -[W5DiagnosticsTestResult setTestID:](v5, "setTestID:", 40LL);
  -[W5DiagnosticsTestResult setConfiguration:](v5, "setConfiguration:", a3);
  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  -[W5DiagnosticsTestResult setTestStarted:](v5, "setTestStarted:");
  id v6 = [a3 objectForKeyedSubscript:@"NetworkName"];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = (uint64_t)objc_msgSend(objc_msgSend(a3, "objectForKeyedSubscript:", @"MaxScanCacheAge"), "integerValue");
    +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
    if ((v8 & 0x8000000000000000LL) == 0)
    {
      double v10 = v9;
      if (v9 - self->_wifiScanTimestamp > (double)v8)
      {

        self->_wifiScanResults = (NSArray *) -[W5WiFiInterface performScanOnChannels:translate:]( -[W5StatusManager wifi](self->_status, "wifi"),  "performScanOnChannels:translate:",  0LL,  1LL);
        self->_wifiScanTimestamp = v10;
      }
    }

    id v11 = -[W5DiagnosticsManager __scanResultWithNetworkName:](self, "__scanResultWithNetworkName:", v7);
    if (v11)
    {
      id v12 = v11;
      id v13 = [v11 supportedSecurityTypes];
      if (([v13 containsObject:&off_1000DED48] & 1) != 0
        || ([v13 containsObject:&off_1000DED60] & 1) != 0
        || [v12 supportsTKIPCipher])
      {
        -[W5DiagnosticsTestResult setResult:](v5, "setResult:", 1LL);
      }

      else
      {
        -[W5DiagnosticsTestResult setDidPass:](v5, "setDidPass:", 1LL);
      }

      v22[0] = @"ScanResult";
      v22[1] = @"Security";
      v23[0] = v12;
      v23[1] = +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [v12 strongestSupportedSecurity]);
      int64_t v14 = (NSNumber **)v23;
      id v15 = (const __CFString **)v22;
      uint64_t v16 = 2LL;
LABEL_16:
      -[W5DiagnosticsTestResult setInfo:]( v5,  "setInfo:",  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v14,  v15,  v16));
    }
  }

  else if (-[CWFInterface SSID](-[W5StatusManager corewifi](self->_status, "corewifi"), "SSID"))
  {
    unint64_t v17 = -[W5WiFiInterface security](-[W5StatusManager wifi](self->_status, "wifi"), "security");
    id v18 = -[W5WiFiInterface currentNetwork](-[W5StatusManager wifi](self->_status, "wifi"), "currentNetwork");
    else {
      -[W5DiagnosticsTestResult setDidPass:](v5, "setDidPass:", 1LL);
    }
    id v20 = @"Security";
    id v21 = +[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v17);
    int64_t v14 = &v21;
    id v15 = &v20;
    uint64_t v16 = 1LL;
    goto LABEL_16;
  }

  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  -[W5DiagnosticsTestResult setTestCompleted:](v5, "setTestCompleted:");
  return v5;
}

- (id)__testLegacyRates11bWithConfiguration:(id)a3
{
  id v5 = objc_alloc_init(&OBJC_CLASS___W5DiagnosticsTestResult);
  -[W5DiagnosticsTestResult setTestID:](v5, "setTestID:", 41LL);
  -[W5DiagnosticsTestResult setConfiguration:](v5, "setConfiguration:", a3);
  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  -[W5DiagnosticsTestResult setTestStarted:](v5, "setTestStarted:");
  id v6 = [a3 objectForKeyedSubscript:@"NetworkName"];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = (uint64_t)objc_msgSend(objc_msgSend(a3, "objectForKeyedSubscript:", @"MaxScanCacheAge"), "integerValue");
    +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
    if ((v8 & 0x8000000000000000LL) == 0)
    {
      double v10 = v9;
      if (v9 - self->_wifiScanTimestamp > (double)v8)
      {

        self->_wifiScanResults = (NSArray *) -[W5WiFiInterface performScanOnChannels:translate:]( -[W5StatusManager wifi](self->_status, "wifi"),  "performScanOnChannels:translate:",  0LL,  1LL);
        self->_wifiScanTimestamp = v10;
      }
    }

    id v11 = -[W5DiagnosticsManager __scanResultWithNetworkName:](self, "__scanResultWithNetworkName:", v7);
    if (v11)
    {
      id v12 = v11;
      else {
        -[W5DiagnosticsTestResult setDidPass:](v5, "setDidPass:", 1LL);
      }
      int64_t v14 = @"ScanResult";
      id v15 = v12;
      -[W5DiagnosticsTestResult setInfo:]( v5,  "setInfo:",  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v15,  &v14,  1LL));
    }
  }

  else if (-[CWFInterface SSID](-[W5StatusManager corewifi](self->_status, "corewifi"), "SSID"))
  {
    else {
      -[W5DiagnosticsTestResult setDidPass:](v5, "setDidPass:", 1LL);
    }
  }

  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  -[W5DiagnosticsTestResult setTestCompleted:](v5, "setTestCompleted:");
  return v5;
}

- (id)__testAirPortBaseStationWithConfiguration:(id)a3
{
  id v5 = objc_alloc_init(&OBJC_CLASS___W5DiagnosticsTestResult);
  -[W5DiagnosticsTestResult setTestID:](v5, "setTestID:", 33LL);
  -[W5DiagnosticsTestResult setConfiguration:](v5, "setConfiguration:", a3);
  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  -[W5DiagnosticsTestResult setTestStarted:](v5, "setTestStarted:");
  id v6 = [a3 objectForKeyedSubscript:@"NetworkName"];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = (uint64_t)objc_msgSend(objc_msgSend(a3, "objectForKeyedSubscript:", @"MaxScanCacheAge"), "integerValue");
    +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
    if ((v8 & 0x8000000000000000LL) == 0)
    {
      double v10 = v9;
      if (v9 - self->_wifiScanTimestamp > (double)v8)
      {

        self->_wifiScanResults = (NSArray *) -[W5WiFiInterface performScanOnChannels:translate:]( -[W5StatusManager wifi](self->_status, "wifi"),  "performScanOnChannels:translate:",  0LL,  1LL);
        self->_wifiScanTimestamp = v10;
      }
    }

    id v11 = -[W5DiagnosticsManager __scanResultWithNetworkName:](self, "__scanResultWithNetworkName:", v7);
  }

  else
  {
    id v11 = -[W5WiFiInterface currentNetwork](-[W5StatusManager wifi](self->_status, "wifi"), "currentNetwork");
  }

  id v12 = v11;
  if (v11)
  {
    id v13 = [v11 airPortBaseStationModelName];
    if (v13)
    {
      id v14 = v13;
      -[W5DiagnosticsTestResult setDidPass:](v5, "setDidPass:", 1LL);
      -[W5DiagnosticsTestResult setResult:](v5, "setResult:", 1LL);
      v16[0] = @"ScanResult";
      v16[1] = @"AirPortModelName";
      v17[0] = v12;
      v17[1] = v14;
      -[W5DiagnosticsTestResult setInfo:]( v5,  "setInfo:",  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v17,  v16,  2LL));
    }
  }

  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  -[W5DiagnosticsTestResult setTestCompleted:](v5, "setTestCompleted:");
  return v5;
}

- (id)__testiOSPersonalHotspotWithConfiguration:(id)a3
{
  id v5 = objc_alloc_init(&OBJC_CLASS___W5DiagnosticsTestResult);
  -[W5DiagnosticsTestResult setTestID:](v5, "setTestID:", 44LL);
  -[W5DiagnosticsTestResult setConfiguration:](v5, "setConfiguration:", a3);
  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  -[W5DiagnosticsTestResult setTestStarted:](v5, "setTestStarted:");
  id v6 = [a3 objectForKeyedSubscript:@"NetworkName"];
  if (!v6)
  {
    id v11 = -[W5WiFiInterface currentNetwork](-[W5StatusManager wifi](self->_status, "wifi"), "currentNetwork");
    if (!v11) {
      goto LABEL_11;
    }
    goto LABEL_8;
  }

  id v7 = v6;
  uint64_t v8 = (uint64_t)objc_msgSend(objc_msgSend(a3, "objectForKeyedSubscript:", @"MaxScanCacheAge"), "integerValue");
  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  if ((v8 & 0x8000000000000000LL) == 0)
  {
    double v10 = v9;
    if (v9 - self->_wifiScanTimestamp > (double)v8)
    {

      self->_wifiScanResults = (NSArray *) -[W5WiFiInterface performScanOnChannels:translate:]( -[W5StatusManager wifi](self->_status, "wifi"),  "performScanOnChannels:translate:",  0LL,  1LL);
      self->_wifiScanTimestamp = v10;
    }
  }

  id v11 = -[W5DiagnosticsManager __scanResultWithNetworkName:](self, "__scanResultWithNetworkName:", v7);
  if (v11)
  {
LABEL_8:
    else {
      -[W5DiagnosticsTestResult setDidPass:](v5, "setDidPass:", 1LL);
    }
  }

- (id)__testPasspointWithConfiguration:(id)a3
{
  id v5 = objc_alloc_init(&OBJC_CLASS___W5DiagnosticsTestResult);
  -[W5DiagnosticsTestResult setTestID:](v5, "setTestID:", 45LL);
  -[W5DiagnosticsTestResult setConfiguration:](v5, "setConfiguration:", a3);
  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  -[W5DiagnosticsTestResult setTestStarted:](v5, "setTestStarted:");
  id v6 = [a3 objectForKeyedSubscript:@"NetworkName"];
  if (!v6)
  {
    if (!-[W5WiFiInterface currentNetwork](-[W5StatusManager wifi](self->_status, "wifi"), "currentNetwork")) {
      goto LABEL_11;
    }
    goto LABEL_8;
  }

  id v7 = v6;
  uint64_t v8 = (uint64_t)objc_msgSend(objc_msgSend(a3, "objectForKeyedSubscript:", @"MaxScanCacheAge"), "integerValue");
  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  if ((v8 & 0x8000000000000000LL) == 0)
  {
    double v10 = v9;
    if (v9 - self->_wifiScanTimestamp > (double)v8)
    {

      self->_wifiScanResults = (NSArray *) -[W5WiFiInterface performScanOnChannels:translate:]( -[W5StatusManager wifi](self->_status, "wifi"),  "performScanOnChannels:translate:",  0LL,  1LL);
      self->_wifiScanTimestamp = v10;
    }
  }

  if (-[W5DiagnosticsManager __scanResultWithNetworkName:](self, "__scanResultWithNetworkName:", v7))
  {
LABEL_8:
    if (objc_msgSend( -[W5WiFiInterface currentNetwork]( -[W5StatusManager wifi](self->_status, "wifi"),  "currentNetwork"),  "isPasspoint")) {
      -[W5DiagnosticsTestResult setResult:](v5, "setResult:", 1LL);
    }
    else {
      -[W5DiagnosticsTestResult setDidPass:](v5, "setDidPass:", 1LL);
    }
  }

- (BOOL)__isDefaultCountryCode:(id)a3
{
  if (a3) {
    return objc_msgSend(&off_1000E3BB8, "containsObject:", objc_msgSend(a3, "lowercaseString"));
  }
  else {
    return 0;
  }
}

- (id)__testConflictingCountryCodeWithConfiguration:(id)a3
{
  id v5 = objc_alloc_init(&OBJC_CLASS___W5DiagnosticsTestResult);
  -[W5DiagnosticsTestResult setTestID:](v5, "setTestID:", 28LL);
  -[W5DiagnosticsTestResult setConfiguration:](v5, "setConfiguration:", a3);
  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  id v21 = v5;
  -[W5DiagnosticsTestResult setTestStarted:](v5, "setTestStarted:");
  id v6 = [a3 objectForKeyedSubscript:@"NetworkName"];
  uint64_t v7 = (uint64_t)objc_msgSend(objc_msgSend(a3, "objectForKeyedSubscript:", @"MaxScanCacheAge"), "integerValue");
  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  if ((v7 & 0x8000000000000000LL) == 0)
  {
    double v9 = v8;
    if (v8 - self->_wifiScanTimestamp > (double)v7)
    {

      self->_wifiScanResults = (NSArray *) -[W5WiFiInterface performScanOnChannels:translate:]( -[W5StatusManager wifi](self->_status, "wifi"),  "performScanOnChannels:translate:",  0LL,  1LL);
      self->_wifiScanTimestamp = v9;
    }
  }

  id v10 = objc_msgSend( objc_msgSend( -[CWFInterface countryCode](-[W5StatusManager corewifi](self->_status, "corewifi"), "countryCode"),  "stringByTrimmingCharactersInSet:",  +[NSCharacterSet whitespaceCharacterSet](NSCharacterSet, "whitespaceCharacterSet")),  "lowercaseString");
  id v11 = +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array");
  if (!-[W5DiagnosticsManager __isDefaultCountryCode:](self, "__isDefaultCountryCode:", v10))
  {
    __int128 v24 = 0u;
    __int128 v25 = 0u;
    __int128 v22 = 0u;
    __int128 v23 = 0u;
    wifiScanResults = self->_wifiScanResults;
    id v13 = -[NSArray countByEnumeratingWithState:objects:count:]( wifiScanResults,  "countByEnumeratingWithState:objects:count:",  &v22,  v26,  16LL);
    if (v13)
    {
      id v14 = v13;
      uint64_t v15 = *(void *)v23;
      do
      {
        for (i = 0LL; i != v14; i = (char *)i + 1)
        {
          if (*(void *)v23 != v15) {
            objc_enumerationMutation(wifiScanResults);
          }
          unint64_t v17 = *(void **)(*((void *)&v22 + 1) + 8LL * (void)i);
          id v18 = objc_msgSend( objc_msgSend( objc_msgSend(v17, "countryCode"),  "stringByTrimmingCharactersInSet:",  +[NSCharacterSet whitespaceCharacterSet](NSCharacterSet, "whitespaceCharacterSet")),  "lowercaseString");
          if (v10
            && v18
            && ([v18 isEqualToString:v10] & 1) == 0
            && (!v6 || objc_msgSend(objc_msgSend(v17, "ssidString"), "isEqualToString:", v6))
            && ([v11 containsObject:v17] & 1) == 0)
          {
            [v11 addObject:v17];
          }
        }

        id v14 = -[NSArray countByEnumeratingWithState:objects:count:]( wifiScanResults,  "countByEnumeratingWithState:objects:count:",  &v22,  v26,  16LL);
      }

      while (v14);
    }
  }

  id v19 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  if (v10) {
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v19,  "setObject:forKeyedSubscript:",  [v10 copy],  @"AdoptedCountryCode");
  }
  if ([v11 count])
  {
    -[W5DiagnosticsTestResult setResult:](v21, "setResult:", 1LL);
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v19,  "setObject:forKeyedSubscript:",  [v11 copy],  @"ScanResults");
  }

  else
  {
    -[W5DiagnosticsTestResult setDidPass:](v21, "setDidPass:", 1LL);
  }

  if (objc_msgSend(-[NSMutableDictionary allKeys](v19, "allKeys"), "count")) {
    -[W5DiagnosticsTestResult setInfo:](v21, "setInfo:", v19);
  }
  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  -[W5DiagnosticsTestResult setTestCompleted:](v21, "setTestCompleted:");
  return v21;
}

- (id)__testConflictingSecurityTypePNLWithConfiguration:(id)a3
{
  id v5 = objc_alloc_init(&OBJC_CLASS___W5DiagnosticsTestResult);
  -[W5DiagnosticsTestResult setTestID:](v5, "setTestID:", 29LL);
  -[W5DiagnosticsTestResult setConfiguration:](v5, "setConfiguration:", a3);
  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  __int128 v33 = v5;
  -[W5DiagnosticsTestResult setTestStarted:](v5, "setTestStarted:");
  id v6 = [a3 objectForKeyedSubscript:@"NetworkName"];
  uint64_t v7 = (uint64_t)objc_msgSend(objc_msgSend(a3, "objectForKeyedSubscript:", @"MaxScanCacheAge"), "integerValue");
  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  if ((v7 & 0x8000000000000000LL) == 0)
  {
    double v9 = v8;
    if (v8 - self->_wifiScanTimestamp > (double)v7)
    {

      self->_wifiScanResults = (NSArray *) -[W5WiFiInterface performScanOnChannels:translate:]( -[W5StatusManager wifi](self->_status, "wifi"),  "performScanOnChannels:translate:",  0LL,  1LL);
      self->_wifiScanTimestamp = v9;
    }
  }

  id v10 = +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array");
  id v11 = +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array");
  id v12 = +[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary");
  id v13 = [a3 objectForKeyedSubscript:@"InternalUUID"];
  unsigned int v14 = objc_msgSend(objc_msgSend(a3, "objectForKeyedSubscript:", @"UseCachedPNL"), "BOOLValue");
  uint64_t v15 = -[W5StatusManager wifi](self->_status, "wifi");
  if (v14) {
    id v16 = v13;
  }
  else {
    id v16 = 0LL;
  }
  id v17 = -[W5WiFiInterface cachedPreferredNetworksListWithUUID:](v15, "cachedPreferredNetworksListWithUUID:", v16);
  __int128 v38 = 0u;
  __int128 v39 = 0u;
  __int128 v40 = 0u;
  __int128 v41 = 0u;
  id v18 = [v17 countByEnumeratingWithState:&v38 objects:v45 count:16];
  if (v18)
  {
    id v19 = v18;
    uint64_t v20 = *(void *)v39;
    do
    {
      for (i = 0LL; i != v19; i = (char *)i + 1)
      {
        if (*(void *)v39 != v20) {
          objc_enumerationMutation(v17);
        }
        __int128 v22 = *(void **)(*((void *)&v38 + 1) + 8LL * (void)i);
        if ([v22 ssidString]
          && (!v6 || objc_msgSend(objc_msgSend(v22, "ssidString"), "isEqualToString:", v6)))
        {
          objc_msgSend(v12, "setObject:forKeyedSubscript:", v22, objc_msgSend(v22, "ssidString"));
        }
      }

      id v19 = [v17 countByEnumeratingWithState:&v38 objects:v45 count:16];
    }

    while (v19);
  }

  __int128 v36 = 0u;
  __int128 v37 = 0u;
  __int128 v34 = 0u;
  __int128 v35 = 0u;
  wifiScanResults = self->_wifiScanResults;
  id v24 = -[NSArray countByEnumeratingWithState:objects:count:]( wifiScanResults,  "countByEnumeratingWithState:objects:count:",  &v34,  v44,  16LL);
  if (v24)
  {
    id v25 = v24;
    uint64_t v26 = *(void *)v35;
    do
    {
      for (j = 0LL; j != v25; j = (char *)j + 1)
      {
        if (*(void *)v35 != v26) {
          objc_enumerationMutation(wifiScanResults);
        }
        id v28 = *(void **)(*((void *)&v34 + 1) + 8LL * (void)j);
        id v29 = objc_msgSend(v12, "objectForKeyedSubscript:", objc_msgSend(v28, "ssidString"));
        if (v29)
        {
          id v30 = v29;
          if ((objc_msgSend(v28, "supportsSecurity:", objc_msgSend(v29, "security")) & 1) == 0)
          {
          }
        }
      }

      id v25 = -[NSArray countByEnumeratingWithState:objects:count:]( wifiScanResults,  "countByEnumeratingWithState:objects:count:",  &v34,  v44,  16LL);
    }

    while (v25);
  }

  if ([v11 count])
  {
    -[W5DiagnosticsTestResult setResult:](v33, "setResult:", 1LL);
    v42[0] = @"ScanResults";
    id v31 = [v10 copy];
    v42[1] = @"PreferredNetworks";
    v43[0] = v31;
    v43[1] = [v11 copy];
    -[W5DiagnosticsTestResult setInfo:]( v33,  "setInfo:",  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v43,  v42,  2LL));
  }

  else
  {
    -[W5DiagnosticsTestResult setDidPass:](v33, "setDidPass:", 1LL);
  }

  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  -[W5DiagnosticsTestResult setTestCompleted:](v33, "setTestCompleted:");
  return v33;
}

- (id)__testCaptivePortalWithConfiguration:(id)a3
{
  id v5 = objc_alloc_init(&OBJC_CLASS___W5DiagnosticsTestResult);
  -[W5DiagnosticsTestResult setTestID:](v5, "setTestID:", 46LL);
  -[W5DiagnosticsTestResult setConfiguration:](v5, "setConfiguration:", a3);
  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  -[W5DiagnosticsTestResult setTestStarted:](v5, "setTestStarted:");
  id v6 = [a3 objectForKeyedSubscript:@"NetworkName"];
  if (v6) {
    id v7 = -[W5DiagnosticsManager __preferredNetworkWithNetworkName:configuration:]( self,  "__preferredNetworkWithNetworkName:configuration:",  v6,  a3);
  }
  else {
    id v7 = -[W5WiFiInterface currentPreferredNetwork]( -[W5StatusManager wifi](self->_status, "wifi"),  "currentPreferredNetwork");
  }
  id v8 = v7;
  if (v7)
  {
    else {
      -[W5DiagnosticsTestResult setDidPass:](v5, "setDidPass:", 1LL);
    }
    id v10 = @"PreferredNetwork";
    id v11 = v8;
    -[W5DiagnosticsTestResult setInfo:]( v5,  "setInfo:",  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v11,  &v10,  1LL));
  }

  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  -[W5DiagnosticsTestResult setTestCompleted:](v5, "setTestCompleted:");
  return v5;
}

- (id)__testAWDLRealtimeWithConfiguration:(id)a3
{
  id v5 = objc_alloc_init(&OBJC_CLASS___W5DiagnosticsTestResult);
  -[W5DiagnosticsTestResult setTestID:](v5, "setTestID:", 22LL);
  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  -[W5DiagnosticsTestResult setTestStarted:](v5, "setTestStarted:");
  id v6 = [a3 objectForKeyedSubscript:@"InternalUUID"];
  unsigned int v7 = objc_msgSend(objc_msgSend(a3, "objectForKeyedSubscript:", @"UseCachedStatus"), "BOOLValue");
  status = self->_status;
  if (v7) {
    id v9 = objc_msgSend(-[W5StatusManager cachedStatusWithUUID:](status, "cachedStatusWithUUID:", v6), "awdl");
  }
  else {
    id v9 = -[W5StatusManager awdlStatus](status, "awdlStatus");
  }
  id v10 = v9;
  if ([v9 awdlStrategy]
    && *((_DWORD *)objc_msgSend(objc_msgSend(v10, "awdlStrategy"), "bytes") + 2) == 9)
  {
    -[W5DiagnosticsTestResult setResult:](v5, "setResult:", 1LL);
  }

  else
  {
    -[W5DiagnosticsTestResult setDidPass:](v5, "setDidPass:", 1LL);
  }

  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  -[W5DiagnosticsTestResult setTestCompleted:](v5, "setTestCompleted:");
  return v5;
}

- (id)__testAWDLEnabledWithConfiguration:(id)a3
{
  id v5 = objc_alloc_init(&OBJC_CLASS___W5DiagnosticsTestResult);
  -[W5DiagnosticsTestResult setTestID:](v5, "setTestID:", 21LL);
  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  -[W5DiagnosticsTestResult setTestStarted:](v5, "setTestStarted:");
  id v6 = [a3 objectForKeyedSubscript:@"InternalUUID"];
  unsigned int v7 = objc_msgSend(objc_msgSend(a3, "objectForKeyedSubscript:", @"UseCachedStatus"), "BOOLValue");
  status = self->_status;
  if (v7) {
    id v9 = objc_msgSend(-[W5StatusManager cachedStatusWithUUID:](status, "cachedStatusWithUUID:", v6), "awdl");
  }
  else {
    id v9 = -[W5StatusManager awdlStatus](status, "awdlStatus");
  }
  id v10 = v9;
  if ([v9 awdlSyncEnabled]
    && *((_DWORD *)objc_msgSend(objc_msgSend(v10, "awdlSyncEnabled"), "bytes") + 2))
  {
    -[W5DiagnosticsTestResult setResult:](v5, "setResult:", 1LL);
  }

  else
  {
    -[W5DiagnosticsTestResult setDidPass:](v5, "setDidPass:", 1LL);
  }

  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  -[W5DiagnosticsTestResult setTestCompleted:](v5, "setTestCompleted:");
  return v5;
}

- (id)__testBTCoexWithConfiguration:(id)a3
{
  id v5 = objc_alloc_init(&OBJC_CLASS___W5DiagnosticsTestResult);
  -[W5DiagnosticsTestResult setTestID:](v5, "setTestID:", 20LL);
  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  -[W5DiagnosticsTestResult setTestStarted:](v5, "setTestStarted:");
  id v6 = [a3 objectForKeyedSubscript:@"InternalUUID"];
  unsigned int v7 = objc_msgSend(objc_msgSend(a3, "objectForKeyedSubscript:", @"UseCachedStatus"), "BOOLValue");
  status = self->_status;
  if (v7) {
    id v9 = objc_msgSend(-[W5StatusManager cachedStatusWithUUID:](status, "cachedStatusWithUUID:", v6), "wifi");
  }
  else {
    id v9 = -[W5StatusManager wifiStatus](status, "wifiStatus");
  }
  else {
    -[W5DiagnosticsTestResult setDidPass:](v5, "setDidPass:", 1LL);
  }
  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  -[W5DiagnosticsTestResult setTestCompleted:](v5, "setTestCompleted:");
  return v5;
}

- (id)__testHighBTConnectedWithConfiguration:(id)a3
{
  id v5 = objc_alloc_init(&OBJC_CLASS___W5DiagnosticsTestResult);
  -[W5DiagnosticsTestResult setTestID:](v5, "setTestID:", 19LL);
  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  -[W5DiagnosticsTestResult setTestStarted:](v5, "setTestStarted:");
  id v6 = [a3 objectForKeyedSubscript:@"InternalUUID"];
  unsigned int v7 = objc_msgSend(objc_msgSend(a3, "objectForKeyedSubscript:", @"UseCachedStatus"), "BOOLValue");
  status = self->_status;
  if (v7) {
    id v9 = objc_msgSend(-[W5StatusManager cachedStatusWithUUID:](status, "cachedStatusWithUUID:", v6), "bluetooth");
  }
  else {
    id v9 = -[W5StatusManager bluetoothStatus](status, "bluetoothStatus");
  }
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  id v10 = objc_msgSend(v9, "devices", 0);
  id v11 = [v10 countByEnumeratingWithState:&v20 objects:v26 count:16];
  if (!v11)
  {
    uint64_t v14 = 0LL;
    uint64_t v13 = 0LL;
LABEL_14:
    -[W5DiagnosticsTestResult setDidPass:](v5, "setDidPass:", 1LL);
    goto LABEL_15;
  }

  id v12 = v11;
  uint64_t v13 = 0LL;
  uint64_t v14 = 0LL;
  uint64_t v15 = *(void *)v21;
  do
  {
    for (i = 0LL; i != v12; i = (char *)i + 1)
    {
      if (*(void *)v21 != v15) {
        objc_enumerationMutation(v10);
      }
      id v17 = *(void **)(*((void *)&v20 + 1) + 8LL * (void)i);
      v14 += [v17 isConnected];
      v13 += [v17 isAppleDevice];
    }

    id v12 = [v10 countByEnumeratingWithState:&v20 objects:v26 count:16];
  }

  while (v12);
  if (v14 < 1) {
    goto LABEL_14;
  }
  -[W5DiagnosticsTestResult setResult:](v5, "setResult:", 1LL);
LABEL_15:
  v24[0] = @"BTConnectedCount";
  id v18 = +[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v14);
  v24[1] = @"BTAppleDeviceConnectedCount";
  v25[0] = v18;
  v25[1] = +[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v13);
  -[W5DiagnosticsTestResult setInfo:]( v5,  "setInfo:",  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v25,  v24,  2LL));
  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  -[W5DiagnosticsTestResult setTestCompleted:](v5, "setTestCompleted:");
  return v5;
}

- (id)__testHighBTPairedWithConfiguration:(id)a3
{
  id v5 = objc_alloc_init(&OBJC_CLASS___W5DiagnosticsTestResult);
  -[W5DiagnosticsTestResult setTestID:](v5, "setTestID:", 18LL);
  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  -[W5DiagnosticsTestResult setTestStarted:](v5, "setTestStarted:");
  id v6 = [a3 objectForKeyedSubscript:@"InternalUUID"];
  unsigned int v7 = objc_msgSend(objc_msgSend(a3, "objectForKeyedSubscript:", @"UseCachedStatus"), "BOOLValue");
  status = self->_status;
  if (v7) {
    id v9 = objc_msgSend(-[W5StatusManager cachedStatusWithUUID:](status, "cachedStatusWithUUID:", v6), "bluetooth");
  }
  else {
    id v9 = -[W5StatusManager bluetoothStatus](status, "bluetoothStatus");
  }
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  id v10 = objc_msgSend(v9, "devices", 0);
  id v11 = [v10 countByEnumeratingWithState:&v18 objects:v24 count:16];
  if (!v11)
  {
    uint64_t v13 = 0LL;
LABEL_17:
    -[W5DiagnosticsTestResult setDidPass:](v5, "setDidPass:", 1LL);
    goto LABEL_18;
  }

  id v12 = v11;
  uint64_t v13 = 0LL;
  uint64_t v14 = *(void *)v19;
  do
  {
    for (i = 0LL; i != v12; i = (char *)i + 1)
    {
      if (*(void *)v19 != v14) {
        objc_enumerationMutation(v10);
      }
      id v16 = *(void **)(*((void *)&v18 + 1) + 8LL * (void)i);
    }

    id v12 = [v10 countByEnumeratingWithState:&v18 objects:v24 count:16];
  }

  while (v12);
  if (v13 < 1) {
    goto LABEL_17;
  }
  -[W5DiagnosticsTestResult setResult:](v5, "setResult:", 1LL);
LABEL_18:
  __int128 v22 = @"BTPairedCount";
  __int128 v23 = +[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v13);
  -[W5DiagnosticsTestResult setInfo:]( v5,  "setInfo:",  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v23,  &v22,  1LL));
  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  -[W5DiagnosticsTestResult setTestCompleted:](v5, "setTestCompleted:");
  return v5;
}

- (id)__testLargePNLWithConfiguration:(id)a3
{
  id v5 = objc_alloc_init(&OBJC_CLASS___W5DiagnosticsTestResult);
  -[W5DiagnosticsTestResult setTestID:](v5, "setTestID:", 47LL);
  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  -[W5DiagnosticsTestResult setTestStarted:](v5, "setTestStarted:");
  id v6 = [a3 objectForKeyedSubscript:@"InternalUUID"];
  LODWORD(a3) = objc_msgSend( objc_msgSend(a3, "objectForKeyedSubscript:", @"UseCachedPNL"),  "BOOLValue");
  unsigned int v7 = -[W5StatusManager wifi](self->_status, "wifi");
  if ((_DWORD)a3) {
    id v8 = v6;
  }
  else {
    id v8 = 0LL;
  }
  id v9 = objc_msgSend( -[W5WiFiInterface cachedPreferredNetworksListWithUUID:](v7, "cachedPreferredNetworksListWithUUID:", v8),  "count");
  else {
    -[W5DiagnosticsTestResult setResult:](v5, "setResult:", 1LL);
  }
  id v11 = @"PNLCount";
  id v12 = +[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", v9);
  -[W5DiagnosticsTestResult setInfo:]( v5,  "setInfo:",  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v12,  &v11,  1LL));
  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  -[W5DiagnosticsTestResult setTestCompleted:](v5, "setTestCompleted:");
  return v5;
}

- (id)__testLongBeaconIntervalWithConfiguration:(id)a3
{
  id v5 = objc_alloc_init(&OBJC_CLASS___W5DiagnosticsTestResult);
  -[W5DiagnosticsTestResult setTestID:](v5, "setTestID:", 34LL);
  -[W5DiagnosticsTestResult setConfiguration:](v5, "setConfiguration:", a3);
  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  -[W5DiagnosticsTestResult setTestStarted:](v5, "setTestStarted:");
  id v6 = [a3 objectForKeyedSubscript:@"NetworkName"];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = (uint64_t)objc_msgSend(objc_msgSend(a3, "objectForKeyedSubscript:", @"MaxScanCacheAge"), "integerValue");
    +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
    if ((v8 & 0x8000000000000000LL) == 0)
    {
      double v10 = v9;
      if (v9 - self->_wifiScanTimestamp > (double)v8)
      {

        self->_wifiScanResults = (NSArray *) -[W5WiFiInterface performScanOnChannels:translate:]( -[W5StatusManager wifi](self->_status, "wifi"),  "performScanOnChannels:translate:",  0LL,  1LL);
        self->_wifiScanTimestamp = v10;
      }
    }

    id v11 = -[W5DiagnosticsManager __scanResultWithNetworkName:](self, "__scanResultWithNetworkName:", v7);
  }

  else
  {
    id v11 = -[W5WiFiInterface currentNetwork](-[W5StatusManager wifi](self->_status, "wifi"), "currentNetwork");
  }

  id v12 = v11;
  if (v11)
  {
    id v13 = [v11 beaconInterval];
    if (v13 == (id)100) {
      -[W5DiagnosticsTestResult setDidPass:](v5, "setDidPass:", 1LL);
    }
    else {
      -[W5DiagnosticsTestResult setResult:](v5, "setResult:", 1LL);
    }
    v15[0] = @"ScanResult";
    v15[1] = @"BeaconInterval";
    v16[0] = v12;
    v16[1] = +[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v13);
    -[W5DiagnosticsTestResult setInfo:]( v5,  "setInfo:",  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v16,  v15,  2LL));
  }

  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  -[W5DiagnosticsTestResult setTestCompleted:](v5, "setTestCompleted:");
  return v5;
}

- (id)__testLongDTIMInterval
{
  id v3 = objc_alloc_init(&OBJC_CLASS___W5DiagnosticsTestResult);
  -[W5DiagnosticsTestResult setTestID:](v3, "setTestID:", 35LL);
  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  -[W5DiagnosticsTestResult setTestStarted:](v3, "setTestStarted:");
  if (-[CWFInterface SSID](-[W5StatusManager corewifi](self->_status, "corewifi"), "SSID"))
  {
    id v4 = -[CWFInterface DTIMInterval](-[W5StatusManager corewifi](self->_status, "corewifi"), "DTIMInterval");
    if (v4 == (id)3) {
      -[W5DiagnosticsTestResult setDidPass:](v3, "setDidPass:", 1LL);
    }
    else {
      -[W5DiagnosticsTestResult setResult:](v3, "setResult:", 1LL);
    }
    id v6 = @"DTIMInterval";
    id v7 = +[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", v4);
    -[W5DiagnosticsTestResult setInfo:]( v3,  "setInfo:",  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v7,  &v6,  1LL));
  }

  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  -[W5DiagnosticsTestResult setTestCompleted:](v3, "setTestCompleted:");
  return v3;
}

- (id)__testConflictingPHYMode11acWithConfiguration:(id)a3
{
  id v5 = objc_alloc_init(&OBJC_CLASS___W5DiagnosticsTestResult);
  -[W5DiagnosticsTestResult setTestID:](v5, "setTestID:", 36LL);
  -[W5DiagnosticsTestResult setConfiguration:](v5, "setConfiguration:", a3);
  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  -[W5DiagnosticsTestResult setTestStarted:](v5, "setTestStarted:");
  id v6 = [a3 objectForKeyedSubscript:@"NetworkName"];
  uint64_t v7 = (uint64_t)objc_msgSend(objc_msgSend(a3, "objectForKeyedSubscript:", @"MaxScanCacheAge"), "integerValue");
  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  if ((v7 & 0x8000000000000000LL) == 0)
  {
    double v9 = v8;
    if (v8 - self->_wifiScanTimestamp > (double)v7)
    {

      self->_wifiScanResults = (NSArray *) -[W5WiFiInterface performScanOnChannels:translate:]( -[W5StatusManager wifi](self->_status, "wifi"),  "performScanOnChannels:translate:",  0LL,  1LL);
      self->_wifiScanTimestamp = v9;
    }
  }

  id v10 = -[CWFInterface supportedPHYModes](-[W5StatusManager corewifi](self->_status, "corewifi"), "supportedPHYModes");
  if ((v10 & 0x80) != 0)
  {
    -[W5DiagnosticsTestResult setDidPass:](v5, "setDidPass:", 1LL);
    __int128 v27 = @"SupportedPHYModes";
    id v28 = +[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v10);
    __int128 v19 = &v28;
    __int128 v20 = &v27;
LABEL_22:
    uint64_t v21 = 1LL;
    goto LABEL_23;
  }

  id v11 = +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array");
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  wifiScanResults = self->_wifiScanResults;
  id v13 = -[NSArray countByEnumeratingWithState:objects:count:]( wifiScanResults,  "countByEnumeratingWithState:objects:count:",  &v23,  v33,  16LL);
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v24;
    do
    {
      for (i = 0LL; i != v14; i = (char *)i + 1)
      {
        if (*(void *)v24 != v15) {
          objc_enumerationMutation(wifiScanResults);
        }
        id v17 = *(void **)(*((void *)&v23 + 1) + 8LL * (void)i);
        if ([v17 supportsPHYMode:128]
          && ([v17 supportsPHYMode:16] & 1) == 0
          && (!v6 || objc_msgSend(objc_msgSend(v17, "ssidString"), "isEqualToString:", v6))
          && ([v11 containsObject:v17] & 1) == 0)
        {
          [v11 addObject:v17];
        }
      }

      id v14 = -[NSArray countByEnumeratingWithState:objects:count:]( wifiScanResults,  "countByEnumeratingWithState:objects:count:",  &v23,  v33,  16LL);
    }

    while (v14);
  }

  if (![v11 count])
  {
    -[W5DiagnosticsTestResult setDidPass:](v5, "setDidPass:", 1LL);
    id v29 = @"SupportedPHYModes";
    id v30 = +[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v10);
    __int128 v19 = &v30;
    __int128 v20 = &v29;
    goto LABEL_22;
  }

  -[W5DiagnosticsTestResult setResult:](v5, "setResult:", 1LL);
  v31[0] = @"SupportedPHYModes";
  __int128 v18 = +[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v10);
  v31[1] = @"ScanResults";
  v32[0] = v18;
  v32[1] = [v11 copy];
  __int128 v19 = (NSNumber **)v32;
  __int128 v20 = (const __CFString **)v31;
  uint64_t v21 = 2LL;
LABEL_23:
  -[W5DiagnosticsTestResult setInfo:]( v5,  "setInfo:",  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v19,  v20,  v21));
  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  -[W5DiagnosticsTestResult setTestCompleted:](v5, "setTestCompleted:");
  return v5;
}

- (id)__testConflictingPHYMode11nWithConfiguration:(id)a3
{
  id v5 = objc_alloc_init(&OBJC_CLASS___W5DiagnosticsTestResult);
  -[W5DiagnosticsTestResult setTestID:](v5, "setTestID:", 37LL);
  -[W5DiagnosticsTestResult setConfiguration:](v5, "setConfiguration:", a3);
  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  -[W5DiagnosticsTestResult setTestStarted:](v5, "setTestStarted:");
  id v6 = [a3 objectForKeyedSubscript:@"NetworkName"];
  uint64_t v7 = (uint64_t)objc_msgSend(objc_msgSend(a3, "objectForKeyedSubscript:", @"MaxScanCacheAge"), "integerValue");
  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  if ((v7 & 0x8000000000000000LL) == 0)
  {
    double v9 = v8;
    if (v8 - self->_wifiScanTimestamp > (double)v7)
    {

      self->_wifiScanResults = (NSArray *) -[W5WiFiInterface performScanOnChannels:translate:]( -[W5StatusManager wifi](self->_status, "wifi"),  "performScanOnChannels:translate:",  0LL,  1LL);
      self->_wifiScanTimestamp = v9;
    }
  }

  id v10 = -[CWFInterface supportedPHYModes](-[W5StatusManager corewifi](self->_status, "corewifi"), "supportedPHYModes");
  if ((v10 & 0x10) != 0)
  {
    -[W5DiagnosticsTestResult setDidPass:](v5, "setDidPass:", 1LL);
    __int128 v27 = @"SupportedPHYModes";
    id v28 = +[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v10);
    __int128 v19 = &v28;
    __int128 v20 = &v27;
LABEL_23:
    uint64_t v21 = 1LL;
    goto LABEL_24;
  }

  id v11 = +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array");
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  wifiScanResults = self->_wifiScanResults;
  id v13 = -[NSArray countByEnumeratingWithState:objects:count:]( wifiScanResults,  "countByEnumeratingWithState:objects:count:",  &v23,  v33,  16LL);
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v24;
    do
    {
      for (i = 0LL; i != v14; i = (char *)i + 1)
      {
        if (*(void *)v24 != v15) {
          objc_enumerationMutation(wifiScanResults);
        }
        id v17 = *(void **)(*((void *)&v23 + 1) + 8LL * (void)i);
        if ([v17 supportsPHYMode:16]
          && ([v17 supportsPHYMode:2] & 1) == 0
          && ([v17 supportsPHYMode:8] & 1) == 0
          && (!v6 || objc_msgSend(objc_msgSend(v17, "ssidString"), "isEqualToString:", v6))
          && ([v11 containsObject:v17] & 1) == 0)
        {
          [v11 addObject:v17];
        }
      }

      id v14 = -[NSArray countByEnumeratingWithState:objects:count:]( wifiScanResults,  "countByEnumeratingWithState:objects:count:",  &v23,  v33,  16LL);
    }

    while (v14);
  }

  if (![v11 count])
  {
    -[W5DiagnosticsTestResult setDidPass:](v5, "setDidPass:", 1LL);
    id v29 = @"SupportedPHYModes";
    id v30 = +[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v10);
    __int128 v19 = &v30;
    __int128 v20 = &v29;
    goto LABEL_23;
  }

  -[W5DiagnosticsTestResult setResult:](v5, "setResult:", 1LL);
  v31[0] = @"SupportedPHYModes";
  __int128 v18 = +[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v10);
  v31[1] = @"ScanResults";
  v32[0] = v18;
  v32[1] = [v11 copy];
  __int128 v19 = (NSNumber **)v32;
  __int128 v20 = (const __CFString **)v31;
  uint64_t v21 = 2LL;
LABEL_24:
  -[W5DiagnosticsTestResult setInfo:]( v5,  "setInfo:",  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v19,  v20,  v21));
  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  -[W5DiagnosticsTestResult setTestCompleted:](v5, "setTestCompleted:");
  return v5;
}

- (id)__testPoorSignalWithConfiguration:(id)a3
{
  id v5 = objc_alloc_init(&OBJC_CLASS___W5DiagnosticsTestResult);
  -[W5DiagnosticsTestResult setTestID:](v5, "setTestID:", 32LL);
  -[W5DiagnosticsTestResult setConfiguration:](v5, "setConfiguration:", a3);
  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  -[W5DiagnosticsTestResult setTestStarted:](v5, "setTestStarted:");
  id v6 = [a3 objectForKeyedSubscript:@"NetworkName"];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = (uint64_t)objc_msgSend(objc_msgSend(a3, "objectForKeyedSubscript:", @"MaxScanCacheAge"), "integerValue");
    +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
    if ((v8 & 0x8000000000000000LL) == 0)
    {
      double v10 = v9;
      if (v9 - self->_wifiScanTimestamp > (double)v8)
      {

        self->_wifiScanResults = (NSArray *) -[W5WiFiInterface performScanOnChannels:translate:]( -[W5StatusManager wifi](self->_status, "wifi"),  "performScanOnChannels:translate:",  0LL,  1LL);
        self->_wifiScanTimestamp = v10;
      }
    }

    id v11 = -[W5DiagnosticsManager __scanResultWithNetworkName:](self, "__scanResultWithNetworkName:", v7);
    uint64_t v12 = (uint64_t)[v11 rssi];
    id v13 = [v11 noise];
    id v14 = v13;
    else {
      -[W5DiagnosticsTestResult setDidPass:](v5, "setDidPass:", 1LL);
    }
    v23[0] = @"RSSI";
    v23[1] = @"Noise";
    v24[0] = +[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v12);
    v24[1] = +[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v14);
    __int128 v18 = (NSDictionary *) -[NSDictionary mutableCopy]( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v24,  v23,  2LL),  "mutableCopy");
    __int128 v19 = v18;
    if (v11) {
      -[NSDictionary setObject:forKeyedSubscript:](v18, "setObject:forKeyedSubscript:", v11, @"ScanResult");
    }
    goto LABEL_17;
  }

  if (-[CWFInterface SSID](-[W5StatusManager corewifi](self->_status, "corewifi"), "SSID"))
  {
    uint64_t v15 = (uint64_t)-[CWFInterface RSSI](-[W5StatusManager corewifi](self->_status, "corewifi"), "RSSI");
    id v16 = -[CWFInterface noise](-[W5StatusManager corewifi](self->_status, "corewifi"), "noise");
    id v17 = v16;
    else {
      -[W5DiagnosticsTestResult setDidPass:](v5, "setDidPass:", 1LL);
    }
    v21[0] = @"RSSI";
    v21[1] = @"Noise";
    v22[0] = +[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v15);
    v22[1] = +[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v17);
    __int128 v19 = +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v22,  v21,  2LL);
LABEL_17:
    -[W5DiagnosticsTestResult setInfo:](v5, "setInfo:", v19);
  }

  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  -[W5DiagnosticsTestResult setTestCompleted:](v5, "setTestCompleted:");
  return v5;
}

- (id)__testPNLContainsHiddenWithConfiguration:(id)a3
{
  id v5 = objc_alloc_init(&OBJC_CLASS___W5DiagnosticsTestResult);
  -[W5DiagnosticsTestResult setTestID:](v5, "setTestID:", 48LL);
  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  -[W5DiagnosticsTestResult setTestStarted:](v5, "setTestStarted:");
  id v6 = +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array");
  id v7 = [a3 objectForKeyedSubscript:@"InternalUUID"];
  LODWORD(a3) = objc_msgSend( objc_msgSend(a3, "objectForKeyedSubscript:", @"UseCachedPNL"),  "BOOLValue");
  uint64_t v8 = -[W5StatusManager wifi](self->_status, "wifi");
  if ((_DWORD)a3) {
    id v9 = v7;
  }
  else {
    id v9 = 0LL;
  }
  id v10 = -[W5WiFiInterface cachedPreferredNetworksListWithUUID:](v8, "cachedPreferredNetworksListWithUUID:", v9);
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  id v11 = [v10 countByEnumeratingWithState:&v17 objects:v23 count:16];
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
        uint64_t v15 = *(void **)(*((void *)&v17 + 1) + 8LL * (void)i);
      }

      id v12 = [v10 countByEnumeratingWithState:&v17 objects:v23 count:16];
    }

    while (v12);
  }

  if ([v6 count])
  {
    -[W5DiagnosticsTestResult setResult:](v5, "setResult:", 1LL);
    uint64_t v21 = @"PreferredNetworks";
    id v22 = [v6 copy];
    -[W5DiagnosticsTestResult setInfo:]( v5,  "setInfo:",  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v22,  &v21,  1LL));
  }

  else
  {
    -[W5DiagnosticsTestResult setDidPass:](v5, "setDidPass:", 1LL);
  }

  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  -[W5DiagnosticsTestResult setTestCompleted:](v5, "setTestCompleted:");
  return v5;
}

- (id)__preferredNetworkWithNetworkName:(id)a3 configuration:(id)a4
{
  id v4 = a4;
  id v7 = [a4 objectForKeyedSubscript:@"InternalUUID"];
  LODWORD(v4) = objc_msgSend( objc_msgSend(v4, "objectForKeyedSubscript:", @"UseCachedPNL"),  "BOOLValue");
  uint64_t v8 = -[W5StatusManager wifi](self->_status, "wifi");
  if ((_DWORD)v4) {
    id v9 = v7;
  }
  else {
    id v9 = 0LL;
  }
  id v10 = -[W5WiFiInterface cachedPreferredNetworksListWithUUID:](v8, "cachedPreferredNetworksListWithUUID:", v9);
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  id v11 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (!v11) {
    return 0LL;
  }
  id v12 = v11;
  uint64_t v13 = *(void *)v18;
LABEL_6:
  uint64_t v14 = 0LL;
  while (1)
  {
    if (*(void *)v18 != v13) {
      objc_enumerationMutation(v10);
    }
    uint64_t v15 = *(void **)(*((void *)&v17 + 1) + 8 * v14);
    if (v12 == (id)++v14)
    {
      id v12 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v12) {
        goto LABEL_6;
      }
      return 0LL;
    }
  }

- (id)__scanResultWithNetworkName:(id)a3
{
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  wifiScanResults = self->_wifiScanResults;
  id v5 = -[NSArray countByEnumeratingWithState:objects:count:]( wifiScanResults,  "countByEnumeratingWithState:objects:count:",  &v13,  v17,  16LL);
  if (!v5) {
    return 0LL;
  }
  id v6 = v5;
  id v7 = 0LL;
  uint64_t v8 = *(void *)v14;
  do
  {
    for (i = 0LL; i != v6; i = (char *)i + 1)
    {
      if (*(void *)v14 != v8) {
        objc_enumerationMutation(wifiScanResults);
      }
      id v10 = *(void **)(*((void *)&v13 + 1) + 8LL * (void)i);
      if (objc_msgSend(objc_msgSend(v10, "ssidString"), "isEqualToString:", a3))
      {
      }
    }

    id v6 = -[NSArray countByEnumeratingWithState:objects:count:]( wifiScanResults,  "countByEnumeratingWithState:objects:count:",  &v13,  v17,  16LL);
  }

  while (v6);
  return v7;
}

- (id)__testHiddenNetworkWithConfiguration:(id)a3
{
  id v5 = objc_alloc_init(&OBJC_CLASS___W5DiagnosticsTestResult);
  -[W5DiagnosticsTestResult setTestID:](v5, "setTestID:", 43LL);
  -[W5DiagnosticsTestResult setConfiguration:](v5, "setConfiguration:", a3);
  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  -[W5DiagnosticsTestResult setTestStarted:](v5, "setTestStarted:");
  id v6 = [a3 objectForKeyedSubscript:@"NetworkName"];
  if (v6) {
    id v7 = -[W5DiagnosticsManager __preferredNetworkWithNetworkName:configuration:]( self,  "__preferredNetworkWithNetworkName:configuration:",  v6,  a3);
  }
  else {
    id v7 = -[W5WiFiInterface currentPreferredNetwork]( -[W5StatusManager wifi](self->_status, "wifi"),  "currentPreferredNetwork");
  }
  else {
    -[W5DiagnosticsTestResult setDidPass:](v5, "setDidPass:", 1LL);
  }
  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  -[W5DiagnosticsTestResult setTestCompleted:](v5, "setTestCompleted:");
  return v5;
}

- (id)__testAmbiguousNetworkNameWithConfiguration:(id)a3
{
  id v5 = objc_alloc_init(&OBJC_CLASS___W5DiagnosticsTestResult);
  -[W5DiagnosticsTestResult setTestID:](v5, "setTestID:", 42LL);
  -[W5DiagnosticsTestResult setConfiguration:](v5, "setConfiguration:", a3);
  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  -[W5DiagnosticsTestResult setTestStarted:](v5, "setTestStarted:");
  id v6 = [a3 objectForKeyedSubscript:@"NetworkName"];
  if (v6
    || (id v6 = -[CWFInterface networkName](-[W5StatusManager corewifi](self->_status, "corewifi"), "networkName")) != 0LL)
  {
    if (objc_msgSend( +[W5DiagnosticsManager __ambiguousSSIDs]( W5DiagnosticsManager,  "__ambiguousSSIDs"),  "containsObject:",  v6)) {
      -[W5DiagnosticsTestResult setResult:](v5, "setResult:", 1LL);
    }
    else {
      -[W5DiagnosticsTestResult setDidPass:](v5, "setDidPass:", 1LL);
    }
    uint64_t v8 = @"NetworkName";
    id v9 = v6;
    -[W5DiagnosticsTestResult setInfo:]( v5,  "setInfo:",  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v9,  &v8,  1LL));
  }

  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  -[W5DiagnosticsTestResult setTestCompleted:](v5, "setTestCompleted:");
  return v5;
}

- (id)__testWiFiHiddenScanResultsWithConfiguration:(id)a3
{
  id v5 = objc_alloc_init(&OBJC_CLASS___W5DiagnosticsTestResult);
  -[W5DiagnosticsTestResult setTestID:](v5, "setTestID:", 30LL);
  -[W5DiagnosticsTestResult setConfiguration:](v5, "setConfiguration:", a3);
  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  -[W5DiagnosticsTestResult setTestStarted:](v5, "setTestStarted:");
  uint64_t v6 = (uint64_t)objc_msgSend(objc_msgSend(a3, "objectForKeyedSubscript:", @"MaxScanCacheAge"), "integerValue");
  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  if ((v6 & 0x8000000000000000LL) == 0)
  {
    double v8 = v7;
    if (v7 - self->_wifiScanTimestamp > (double)v6)
    {

      self->_wifiScanResults = (NSArray *) -[W5WiFiInterface performScanOnChannels:translate:]( -[W5StatusManager wifi](self->_status, "wifi"),  "performScanOnChannels:translate:",  0LL,  1LL);
      self->_wifiScanTimestamp = v8;
    }
  }

  id v9 = +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array");
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  wifiScanResults = self->_wifiScanResults;
  id v11 = -[NSArray countByEnumeratingWithState:objects:count:]( wifiScanResults,  "countByEnumeratingWithState:objects:count:",  &v17,  v23,  16LL);
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v18;
    do
    {
      for (i = 0LL; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v18 != v13) {
          objc_enumerationMutation(wifiScanResults);
        }
        __int128 v15 = *(void **)(*((void *)&v17 + 1) + 8LL * (void)i);
        if (![v15 ssid]) {
          [v9 addObject:v15];
        }
      }

      id v12 = -[NSArray countByEnumeratingWithState:objects:count:]( wifiScanResults,  "countByEnumeratingWithState:objects:count:",  &v17,  v23,  16LL);
    }

    while (v12);
  }

  if ([v9 count])
  {
    -[W5DiagnosticsTestResult setResult:](v5, "setResult:", 1LL);
    uint64_t v21 = @"ScanResults";
    id v22 = [v9 copy];
    -[W5DiagnosticsTestResult setInfo:]( v5,  "setInfo:",  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v22,  &v21,  1LL));
  }

  else
  {
    -[W5DiagnosticsTestResult setDidPass:](v5, "setDidPass:", 1LL);
  }

  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  -[W5DiagnosticsTestResult setTestCompleted:](v5, "setTestCompleted:");
  return v5;
}

- (id)__testWiFiNoScanResultsWithConfiguration:(id)a3
{
  id v5 = objc_alloc_init(&OBJC_CLASS___W5DiagnosticsTestResult);
  -[W5DiagnosticsTestResult setTestID:](v5, "setTestID:", 31LL);
  -[W5DiagnosticsTestResult setConfiguration:](v5, "setConfiguration:", a3);
  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  -[W5DiagnosticsTestResult setTestStarted:](v5, "setTestStarted:");
  uint64_t v6 = (uint64_t)objc_msgSend(objc_msgSend(a3, "objectForKeyedSubscript:", @"MaxScanCacheAge"), "integerValue");
  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  if ((v6 & 0x8000000000000000LL) == 0)
  {
    double v8 = v7;
    if (v7 - self->_wifiScanTimestamp > (double)v6)
    {

      self->_wifiScanResults = (NSArray *) -[W5WiFiInterface performScanOnChannels:translate:]( -[W5StatusManager wifi](self->_status, "wifi"),  "performScanOnChannels:translate:",  0LL,  1LL);
      self->_wifiScanTimestamp = v8;
    }
  }

  if (-[NSArray count](self->_wifiScanResults, "count")) {
    -[W5DiagnosticsTestResult setDidPass:](v5, "setDidPass:", 1LL);
  }
  else {
    -[W5DiagnosticsTestResult setResult:](v5, "setResult:", 1LL);
  }
  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  -[W5DiagnosticsTestResult setTestCompleted:](v5, "setTestCompleted:");
  return v5;
}

- (id)__testDownloadSpeedWithConfiguration:(id)a3
{
  id v4 = objc_alloc_init(&OBJC_CLASS___W5DiagnosticsTestResult);
  -[W5DiagnosticsTestResult setTestID:](v4, "setTestID:", 49LL);
  -[W5DiagnosticsTestResult setConfiguration:](v4, "setConfiguration:", a3);
  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  -[W5DiagnosticsTestResult setTestStarted:](v4, "setTestStarted:");
  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  -[W5DiagnosticsTestResult setTestCompleted:](v4, "setTestCompleted:");
  return v4;
}

- (id)__testUploadSpeedWithConfiguration:(id)a3
{
  id v4 = objc_alloc_init(&OBJC_CLASS___W5DiagnosticsTestResult);
  -[W5DiagnosticsTestResult setTestID:](v4, "setTestID:", 50LL);
  -[W5DiagnosticsTestResult setConfiguration:](v4, "setConfiguration:", a3);
  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  -[W5DiagnosticsTestResult setTestStarted:](v4, "setTestStarted:");
  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  -[W5DiagnosticsTestResult setTestCompleted:](v4, "setTestCompleted:");
  return v4;
}

- (id)__testLeakyAP
{
  id v3 = objc_alloc_init(&OBJC_CLASS___W5DiagnosticsTestResult);
  -[W5DiagnosticsTestResult setTestID:](v3, "setTestID:", 51LL);
  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  -[W5DiagnosticsTestResult setTestStarted:](v3, "setTestStarted:");
  id v4 = -[W5WiFiInterface currentNetwork](-[W5StatusManager wifi](self->_status, "wifi"), "currentNetwork");
  uint64_t v5 = WiFiNetworkCreate(kCFAllocatorDefault, [v4 scanRecord]);
  if (v5
    && (uint64_t v6 = (const void *)v5, IsAPLeaky = WiFiNetworkIsAPLeaky(v5, [v4 bssid]), CFRelease(v6), IsAPLeaky))
  {
    -[W5DiagnosticsTestResult setResult:](v3, "setResult:", 1LL);
  }

  else
  {
    -[W5DiagnosticsTestResult setDidPass:](v3, "setDidPass:", 1LL);
  }

  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  -[W5DiagnosticsTestResult setTestCompleted:](v3, "setTestCompleted:");
  return v3;
}

- (id)__testWiFiLink
{
  id v3 = objc_alloc_init(&OBJC_CLASS___W5DiagnosticsTestResult);
  -[W5DiagnosticsTestResult setTestID:](v3, "setTestID:", 52LL);
  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  -[W5DiagnosticsTestResult setTestStarted:](v3, "setTestStarted:");
  id v4 = -[CWFInterface networkName](-[W5StatusManager corewifi](self->_status, "corewifi"), "networkName");
  if (v4)
  {
    uint64_t v6 = @"NetworkName";
    id v7 = v4;
    -[W5DiagnosticsTestResult setInfo:]( v3,  "setInfo:",  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v7,  &v6,  1LL));
    -[W5DiagnosticsTestResult setResult:](v3, "setResult:", 1LL);
    -[W5DiagnosticsTestResult setDidPass:](v3, "setDidPass:", 1LL);
  }

  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  -[W5DiagnosticsTestResult setTestCompleted:](v3, "setTestCompleted:");
  return v3;
}

- (id)__testWiFiIsPrimaryIPv4
{
  id v3 = objc_alloc_init(&OBJC_CLASS___W5DiagnosticsTestResult);
  -[W5DiagnosticsTestResult setTestID:](v3, "setTestID:", 57LL);
  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  -[W5DiagnosticsTestResult setTestStarted:](v3, "setTestStarted:");
  id v4 = -[CWFInterface globalIPv4InterfaceName]( -[W5StatusManager corewifi](self->_status, "corewifi"),  "globalIPv4InterfaceName");
  id v5 = -[CWFInterface globalIPv4NetworkServiceName]( -[W5StatusManager corewifi](self->_status, "corewifi"),  "globalIPv4NetworkServiceName");
  id v6 = -[CWFInterface globalIPv4NetworkServiceID]( -[W5StatusManager corewifi](self->_status, "corewifi"),  "globalIPv4NetworkServiceID");
  if (objc_msgSend( -[CWFInterface networkServiceID]( -[W5StatusManager corewifi](self->_status, "corewifi"),  "networkServiceID"),  "isEqualToString:",  v6))
  {
    -[W5DiagnosticsTestResult setResult:](v3, "setResult:", 1LL);
    -[W5DiagnosticsTestResult setDidPass:](v3, "setDidPass:", 1LL);
  }

  id v7 = +[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary");
  [v7 setObject:v4 forKeyedSubscript:@"IPv4InterfaceName"];
  [v7 setObject:v5 forKeyedSubscript:@"IPv4ServiceName"];
  [v7 setObject:v6 forKeyedSubscript:@"IPv4ServiceID"];
  -[W5DiagnosticsTestResult setInfo:](v3, "setInfo:", v7);
  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  -[W5DiagnosticsTestResult setTestCompleted:](v3, "setTestCompleted:");
  return v3;
}

- (id)__testWiFiIsPrimaryIPv6
{
  id v3 = objc_alloc_init(&OBJC_CLASS___W5DiagnosticsTestResult);
  -[W5DiagnosticsTestResult setTestID:](v3, "setTestID:", 58LL);
  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  -[W5DiagnosticsTestResult setTestStarted:](v3, "setTestStarted:");
  id v4 = -[CWFInterface globalIPv6InterfaceName]( -[W5StatusManager corewifi](self->_status, "corewifi"),  "globalIPv6InterfaceName");
  id v5 = -[CWFInterface globalIPv6NetworkServiceName]( -[W5StatusManager corewifi](self->_status, "corewifi"),  "globalIPv6NetworkServiceName");
  id v6 = -[CWFInterface globalIPv6NetworkServiceID]( -[W5StatusManager corewifi](self->_status, "corewifi"),  "globalIPv6NetworkServiceID");
  if (objc_msgSend( -[CWFInterface networkServiceID]( -[W5StatusManager corewifi](self->_status, "corewifi"),  "networkServiceID"),  "isEqualToString:",  v6))
  {
    -[W5DiagnosticsTestResult setResult:](v3, "setResult:", 1LL);
    -[W5DiagnosticsTestResult setDidPass:](v3, "setDidPass:", 1LL);
  }

  id v7 = +[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary");
  [v7 setObject:v4 forKeyedSubscript:@"IPv6InterfaceName"];
  [v7 setObject:v5 forKeyedSubscript:@"IPv6ServiceName"];
  [v7 setObject:v6 forKeyedSubscript:@"IPv6ServiceID"];
  -[W5DiagnosticsTestResult setInfo:](v3, "setInfo:", v7);
  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  -[W5DiagnosticsTestResult setTestCompleted:](v3, "setTestCompleted:");
  return v3;
}

- (id)__testReachabilityToPeersWithConfiguration:(id)a3
{
  id v5 = objc_alloc_init(&OBJC_CLASS___W5DiagnosticsTestResult);
  -[W5DiagnosticsTestResult setTestID:](v5, "setTestID:", 63LL);
  id v6 = &Apple80211BindToInterface_ptr;
  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  -[W5DiagnosticsTestResult setTestStarted:](v5, "setTestStarted:");
  id v7 = [a3 objectForKeyedSubscript:@"PingCount"];
  id v8 = [a3 objectForKeyedSubscript:@"PingTimeout"];
  id v9 = [a3 objectForKeyedSubscript:@"PingInterval"];
  id v10 = [a3 objectForKeyedSubscript:@"PingWait"];
  id v11 = [a3 objectForKeyedSubscript:@"PingDataLength"];
  if (v7)
  {
    uint64_t v32 = (uint64_t)[v7 integerValue];
    if (v8) {
      goto LABEL_3;
    }
  }

  else
  {
    uint64_t v32 = 1LL;
    if (v8)
    {
LABEL_3:
      [v8 doubleValue];
      double v13 = v12;
      if (v9) {
        goto LABEL_4;
      }
      goto LABEL_22;
    }
  }

  double v13 = 2.0;
  if (v9)
  {
LABEL_4:
    [v9 doubleValue];
    double v15 = v14;
    if (v10) {
      goto LABEL_5;
    }
LABEL_23:
    double v17 = 2.0;
    if (!v11) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }

- (id)__orderedChannelWeights:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_100040F94;
  v4[3] = &unk_1000D2728;
  v4[4] = a3;
  return objc_msgSend(objc_msgSend(a3, "allKeys"), "sortedArrayUsingComparator:", v4);
}

- (id)__overlappingChannelsForChannel:(id)a3 supportedChannels:(id)a4
{
  id v6 = +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array");
  id v7 = +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array");
  id v8 = [a3 channel];
  if (([a3 flags] & 0x800) != 0)
  {
    objc_msgSend( v7,  "addObject:",  +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)v8 - 16));
    objc_msgSend( v7,  "addObject:",  +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)v8 - 15));
    objc_msgSend( v7,  "addObject:",  +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)v8 - 14));
    objc_msgSend( v7,  "addObject:",  +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)v8 - 13));
    objc_msgSend( v7,  "addObject:",  +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)v8 - 12));
    objc_msgSend( v7,  "addObject:",  +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)v8 - 11));
    objc_msgSend( v7,  "addObject:",  +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)v8 - 10));
    objc_msgSend( v7,  "addObject:",  +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)v8 - 9));
    objc_msgSend( v7,  "addObject:",  +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)v8 - 8));
    objc_msgSend( v7,  "addObject:",  +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)v8 - 7));
    objc_msgSend( v7,  "addObject:",  +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)v8 - 6));
    objc_msgSend( v7,  "addObject:",  +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)v8 - 5));
    objc_msgSend( v7,  "addObject:",  +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)v8 - 4));
    objc_msgSend( v7,  "addObject:",  +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)v8 - 3));
    objc_msgSend( v7,  "addObject:",  +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)v8 - 2));
    objc_msgSend( v7,  "addObject:",  +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)v8 - 1));
    objc_msgSend(v7, "addObject:", +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v8));
    objc_msgSend( v7,  "addObject:",  +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)v8 + 1));
    objc_msgSend( v7,  "addObject:",  +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)v8 + 2));
    objc_msgSend( v7,  "addObject:",  +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)v8 + 3));
    objc_msgSend( v7,  "addObject:",  +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)v8 + 4));
    objc_msgSend( v7,  "addObject:",  +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)v8 + 5));
    objc_msgSend( v7,  "addObject:",  +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)v8 + 6));
    objc_msgSend( v7,  "addObject:",  +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)v8 + 7));
    objc_msgSend( v7,  "addObject:",  +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)v8 + 8));
    objc_msgSend( v7,  "addObject:",  +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)v8 + 9));
    objc_msgSend( v7,  "addObject:",  +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)v8 + 10));
    objc_msgSend( v7,  "addObject:",  +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)v8 + 11));
    objc_msgSend( v7,  "addObject:",  +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)v8 + 12));
    objc_msgSend( v7,  "addObject:",  +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)v8 + 13));
    objc_msgSend( v7,  "addObject:",  +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)v8 + 14));
    objc_msgSend( v7,  "addObject:",  +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)v8 + 15));
    id v11 = (char *)v8 + 16;
  }

  else if (([a3 flags] & 0x400) != 0)
  {
    objc_msgSend( v7,  "addObject:",  +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)v8 - 8));
    objc_msgSend( v7,  "addObject:",  +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)v8 - 7));
    objc_msgSend( v7,  "addObject:",  +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)v8 - 6));
    objc_msgSend( v7,  "addObject:",  +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)v8 - 5));
    objc_msgSend( v7,  "addObject:",  +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)v8 - 4));
    objc_msgSend( v7,  "addObject:",  +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)v8 - 3));
    objc_msgSend( v7,  "addObject:",  +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)v8 - 2));
    objc_msgSend( v7,  "addObject:",  +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)v8 - 1));
    objc_msgSend(v7, "addObject:", +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v8));
    objc_msgSend( v7,  "addObject:",  +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)v8 + 1));
    objc_msgSend( v7,  "addObject:",  +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)v8 + 2));
    objc_msgSend( v7,  "addObject:",  +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)v8 + 3));
    objc_msgSend( v7,  "addObject:",  +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)v8 + 4));
    objc_msgSend( v7,  "addObject:",  +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)v8 + 5));
    objc_msgSend( v7,  "addObject:",  +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)v8 + 6));
    objc_msgSend( v7,  "addObject:",  +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)v8 + 7));
    id v11 = (char *)v8 + 8;
  }

  else
  {
    unsigned __int8 v9 = [a3 flags];
    unsigned __int16 v10 = (unsigned __int16)[a3 flags];
    if ((v9 & 4) != 0)
    {
      uint64_t v12 = -2LL;
      if ((v10 & 0x200) != 0) {
        uint64_t v12 = 2LL;
      }
      uint64_t v13 = (v12 + 2 * (uint64_t)v8) >> 1;
      objc_msgSend( v7,  "addObject:",  +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v13 - 4));
      objc_msgSend( v7,  "addObject:",  +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v13 - 3));
      objc_msgSend( v7,  "addObject:",  +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v13 - 2));
      objc_msgSend( v7,  "addObject:",  +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v13 - 1));
      objc_msgSend(v7, "addObject:", +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v13));
      objc_msgSend( v7,  "addObject:",  +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v13 + 1));
      objc_msgSend( v7,  "addObject:",  +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v13 + 2));
      objc_msgSend( v7,  "addObject:",  +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v13 + 3));
      id v11 = (char *)(v13 + 4);
    }

    else
    {
      if ((v10 & 2) == 0) {
        goto LABEL_12;
      }
      objc_msgSend( v7,  "addObject:",  +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)v8 - 2));
      objc_msgSend( v7,  "addObject:",  +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)v8 - 1));
      objc_msgSend(v7, "addObject:", +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v8));
      objc_msgSend( v7,  "addObject:",  +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)v8 + 1));
      id v11 = (char *)v8 + 2;
    }
  }

  objc_msgSend(v7, "addObject:", +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v11));
LABEL_12:
  id v14 = +[W5DiagnosticsManager __channelNumbersForWiFiChannels:]( &OBJC_CLASS___W5DiagnosticsManager,  "__channelNumbersForWiFiChannels:",  a4);
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  id v15 = [v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v15)
  {
    id v16 = v15;
    uint64_t v17 = *(void *)v22;
    do
    {
      for (i = 0LL; i != v16; i = (char *)i + 1)
      {
        if (*(void *)v22 != v17) {
          objc_enumerationMutation(v7);
        }
        uint64_t v19 = *(void *)(*((void *)&v21 + 1) + 8LL * (void)i);
      }

      id v16 = [v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }

    while (v16);
  }

  return [v6 copy];
}

+ (id)__channelNumbersForWiFiChannels:(id)a3
{
  id v4 = +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array");
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  id v5 = [a3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      id v8 = 0LL;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(a3);
        }
        objc_msgSend( v4,  "addObject:",  +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * (void)v8), "channel")));
        id v8 = (char *)v8 + 1;
      }

      while (v6 != v8);
      id v6 = [a3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }

    while (v6);
  }

  return [v4 copy];
}

- (id)__only5GHzNonDFSChannels:(id)a3
{
  id v4 = +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array");
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  id v5 = [a3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(a3);
        }
        unsigned __int8 v9 = *(void **)(*((void *)&v11 + 1) + 8LL * (void)i);
        if (([v9 flags] & 0x10) != 0
          && ([v9 flags] & 0x100) == 0)
        {
          [v4 addObject:v9];
        }
      }

      id v6 = [a3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }

    while (v6);
  }

  return [v4 copy];
}

- (id)__only2GHzChannels:(id)a3
{
  id v4 = +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array");
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  id v5 = [a3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(a3);
        }
        unsigned __int8 v9 = *(void **)(*((void *)&v11 + 1) + 8LL * (void)i);
      }

      id v6 = [a3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }

    while (v6);
  }

  return [v4 copy];
}

- (id)__only5GHzChannels:(id)a3
{
  id v4 = +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array");
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  id v5 = [a3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(a3);
        }
        unsigned __int8 v9 = *(void **)(*((void *)&v11 + 1) + 8LL * (void)i);
      }

      id v6 = [a3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }

    while (v6);
  }

  return [v4 copy];
}

- (id)__only2GHz_1_6_11_14_Channels:(id)a3
{
  id v4 = +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array");
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  id v5 = [a3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(a3);
        }
        unsigned __int8 v9 = *(void **)(*((void *)&v11 + 1) + 8LL * (void)i);
        if (([v9 flags] & 8) != 0
          && ([v9 flags] & 2) != 0
          && ([v9 channel] == (id)1
           || [v9 channel] == (id)6
           || [v9 channel] == (id)11
           || [v9 channel] == (id)14))
        {
          [v4 addObject:v9];
        }
      }

      id v6 = [a3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }

    while (v6);
  }

  return [v4 copy];
}

- (id)__only5GHz20MHz40MHzChannels:(id)a3
{
  id v4 = +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array");
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  id v5 = [a3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(a3);
        }
        unsigned __int8 v9 = *(void **)(*((void *)&v11 + 1) + 8LL * (void)i);
        if (([v9 flags] & 0x10) != 0
          && (([v9 flags] & 2) != 0 || (objc_msgSend(v9, "flags") & 4) != 0))
        {
          [v4 addObject:v9];
        }
      }

      id v6 = [a3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }

    while (v6);
  }

  return [v4 copy];
}

- (id)__only5GHz40MHzChannels:(id)a3
{
  id v4 = +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array");
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  id v5 = [a3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(a3);
        }
        unsigned __int8 v9 = *(void **)(*((void *)&v11 + 1) + 8LL * (void)i);
      }

      id v6 = [a3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }

    while (v6);
  }

  return [v4 copy];
}

- (id)__filteredChannelWeights:(id)a3 channels:(id)a4
{
  id v6 = +[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary");
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  id v7 = objc_msgSend(a3, "allKeys", 0);
  id v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v15;
    do
    {
      for (i = 0LL; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v14 + 1) + 8LL * (void)i);
      }

      id v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }

    while (v9);
  }

  return [v6 copy];
}

- (id)__adjust5GHzWeights:(id)a3
{
  id v4 = +[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary");
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  id v5 = objc_msgSend(a3, "allKeys", 0);
  id v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v14 + 1) + 8LL * (void)i);
        else {
          double v11 = 0.0;
        }
        objc_msgSend(objc_msgSend(a3, "objectForKeyedSubscript:", v10), "floatValue");
        objc_msgSend( v4,  "setObject:forKeyedSubscript:",  +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v11 + v12),  v10);
      }

      id v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }

    while (v7);
  }

  return [v4 copy];
}

- (id)__applyChannelWeights:(id)a3 supportedChannels:(id)a4
{
  id v23 = +[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary");
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  id v6 = [a4 countByEnumeratingWithState:&v28 objects:v33 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v29;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v29 != v8) {
          objc_enumerationMutation(a4);
        }
        uint64_t v10 = *(void *)(*((void *)&v28 + 1) + 8LL * (void)i);
        id v11 = -[W5DiagnosticsManager __overlappingChannelsForChannel:supportedChannels:]( self,  "__overlappingChannelsForChannel:supportedChannels:",  v10,  a4);
        __int128 v24 = 0u;
        __int128 v25 = 0u;
        __int128 v26 = 0u;
        __int128 v27 = 0u;
        id v12 = [v11 countByEnumeratingWithState:&v24 objects:v32 count:16];
        if (v12)
        {
          id v13 = v12;
          uint64_t v14 = *(void *)v25;
          float v15 = 0.0;
          float v16 = 0.0;
          do
          {
            for (j = 0LL; j != v13; j = (char *)j + 1)
            {
              if (*(void *)v25 != v14) {
                objc_enumerationMutation(v11);
              }
              float v16 = v16 + 1.0;
              objc_msgSend( objc_msgSend(a3, "objectForKeyedSubscript:", *(void *)(*((void *)&v24 + 1) + 8 * (void)j)),  "floatValue");
              float v15 = v15 + v18;
            }

            id v13 = [v11 countByEnumeratingWithState:&v24 objects:v32 count:16];
          }

          while (v13);
          id v20 = (NSNumber *)&off_1000E44D8;
          if (v15 > 0.0)
          {
            *(float *)&double v19 = v15 / v16;
            id v20 = +[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:", &off_1000E44D8, v19);
          }
        }

        else
        {
          id v20 = (NSNumber *)&off_1000E44D8;
        }

        [v23 setObject:v20 forKeyedSubscript:v10];
      }

      id v7 = [a4 countByEnumeratingWithState:&v28 objects:v33 count:16];
    }

    while (v7);
  }

  return [v23 copy];
}

- (id)__channelWeightsForScanResults:(id)a3 supportedChannels:(id)a4 rssiThreshold:(int64_t)a5
{
  id v6 = +[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary");
  id v7 = +[W5DiagnosticsManager __channelNumbersForWiFiChannels:]( &OBJC_CLASS___W5DiagnosticsManager,  "__channelNumbersForWiFiChannels:",  a4);
  __int128 v41 = 0u;
  __int128 v42 = 0u;
  __int128 v43 = 0u;
  __int128 v44 = 0u;
  id v8 = [v7 countByEnumeratingWithState:&v41 objects:v47 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v42;
    do
    {
      for (i = 0LL; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v42 != v10) {
          objc_enumerationMutation(v7);
        }
        [v6 setObject:&off_1000DED78 forKeyedSubscript:*(void *)(*((void *)&v41 + 1) + 8 * (void)i)];
      }

      id v9 = [v7 countByEnumeratingWithState:&v41 objects:v47 count:16];
    }

    while (v9);
  }

  __int128 v39 = 0u;
  __int128 v40 = 0u;
  __int128 v37 = 0u;
  __int128 v38 = 0u;
  id v31 = [a3 countByEnumeratingWithState:&v37 objects:v46 count:16];
  if (v31)
  {
    uint64_t v29 = *(void *)v38;
    do
    {
      uint64_t v12 = 0LL;
      do
      {
        if (*(void *)v38 != v29) {
          objc_enumerationMutation(a3);
        }
        uint64_t v32 = v12;
        id v13 = *(void **)(*((void *)&v37 + 1) + 8 * v12);
        if ((uint64_t)[v13 rssi] >= a5)
        {
          id v14 = -[W5DiagnosticsManager __channelWeightsForChannel:]( self,  "__channelWeightsForChannel:",  [v13 channel]);
          __int128 v33 = 0u;
          __int128 v34 = 0u;
          __int128 v35 = 0u;
          __int128 v36 = 0u;
          id v15 = [v14 allKeys];
          id v16 = [v15 countByEnumeratingWithState:&v33 objects:v45 count:16];
          if (v16)
          {
            id v17 = v16;
            uint64_t v18 = *(void *)v34;
            do
            {
              for (j = 0LL; j != v17; j = (char *)j + 1)
              {
                if (*(void *)v34 != v18) {
                  objc_enumerationMutation(v15);
                }
                uint64_t v20 = *(void *)(*((void *)&v33 + 1) + 8LL * (void)j);
                id v21 = [v14 objectForKeyedSubscript:v20];
                objc_msgSend(objc_msgSend(v6, "objectForKeyedSubscript:", v20), "floatValue");
                float v23 = v22;
                [v21 floatValue];
                *(float *)&double v25 = v23 + v24;
                objc_msgSend( v6,  "setObject:forKeyedSubscript:",  +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v25),  v20);
              }

              id v17 = [v15 countByEnumeratingWithState:&v33 objects:v45 count:16];
            }

            while (v17);
          }
        }

        uint64_t v12 = v32 + 1;
      }

      while ((id)(v32 + 1) != v31);
      id v31 = [a3 countByEnumeratingWithState:&v37 objects:v46 count:16];
    }

    while (v31);
  }

  return -[W5DiagnosticsManager __filteredChannelWeights:channels:](self, "__filteredChannelWeights:channels:", v6, v7);
}

- (id)__occupiedChannelsForScanResults:(id)a3 supportedChannels:(id)a4 rssiThreshold:(int64_t)a5 ignoreChannel:(id)a6
{
  id v10 = +[NSMutableOrderedSet orderedSet](&OBJC_CLASS___NSMutableOrderedSet, "orderedSet");
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  id v11 = [a3 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v20;
    do
    {
      for (i = 0LL; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v20 != v13) {
          objc_enumerationMutation(a3);
        }
        id v15 = *(void **)(*((void *)&v19 + 1) + 8LL * (void)i);
        if ((uint64_t)[v15 rssi] >= a5)
        {
          id v16 = [a6 channel];
          if (v16 != objc_msgSend(objc_msgSend(v15, "channel"), "channel")) {
            objc_msgSend( v10,  "addObjectsFromArray:",  -[W5DiagnosticsManager __overlappingChannelsForChannel:supportedChannels:]( self,  "__overlappingChannelsForChannel:supportedChannels:",  objc_msgSend(v15, "channel"),  a4));
          }
        }
      }

      id v12 = [a3 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }

    while (v12);
  }

  return objc_msgSend(objc_msgSend(v10, "array"), "copy");
}

- (id)__channelWeightsForChannel:(id)a3
{
  id v4 = +[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary");
  id v5 = [a3 channel];
  if (([a3 flags] & 0x800) != 0)
  {
    objc_msgSend( v4,  "setObject:forKeyedSubscript:",  &off_1000DED00,  +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)v5 + 16));
    objc_msgSend( v4,  "setObject:forKeyedSubscript:",  &off_1000DED90,  +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)v5 + 15));
    objc_msgSend( v4,  "setObject:forKeyedSubscript:",  &off_1000DED90,  +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)v5 + 14));
    objc_msgSend( v4,  "setObject:forKeyedSubscript:",  &off_1000DED90,  +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)v5 + 13));
    objc_msgSend( v4,  "setObject:forKeyedSubscript:",  &off_1000DED90,  +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)v5 + 12));
    objc_msgSend( v4,  "setObject:forKeyedSubscript:",  &off_1000DED90,  +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)v5 + 11));
    objc_msgSend( v4,  "setObject:forKeyedSubscript:",  &off_1000DED90,  +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)v5 + 10));
    objc_msgSend( v4,  "setObject:forKeyedSubscript:",  &off_1000DED90,  +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)v5 + 9));
    objc_msgSend( v4,  "setObject:forKeyedSubscript:",  &off_1000DED90,  +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)v5 + 8));
    objc_msgSend( v4,  "setObject:forKeyedSubscript:",  &off_1000DED90,  +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)v5 + 7));
    objc_msgSend( v4,  "setObject:forKeyedSubscript:",  &off_1000DED90,  +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)v5 + 6));
    objc_msgSend( v4,  "setObject:forKeyedSubscript:",  &off_1000DED90,  +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)v5 + 5));
    objc_msgSend( v4,  "setObject:forKeyedSubscript:",  &off_1000DED90,  +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)v5 + 4));
    objc_msgSend( v4,  "setObject:forKeyedSubscript:",  &off_1000DED90,  +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)v5 + 3));
    objc_msgSend( v4,  "setObject:forKeyedSubscript:",  &off_1000DED90,  +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)v5 + 2));
    objc_msgSend( v4,  "setObject:forKeyedSubscript:",  &off_1000DED90,  +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)v5 + 1));
    objc_msgSend( v4,  "setObject:forKeyedSubscript:",  &off_1000DED90,  +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v5));
    objc_msgSend( v4,  "setObject:forKeyedSubscript:",  &off_1000DED90,  +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)v5 - 1));
    objc_msgSend( v4,  "setObject:forKeyedSubscript:",  &off_1000DED90,  +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)v5 - 2));
    objc_msgSend( v4,  "setObject:forKeyedSubscript:",  &off_1000DED90,  +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)v5 - 3));
    objc_msgSend( v4,  "setObject:forKeyedSubscript:",  &off_1000DED90,  +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)v5 - 4));
    objc_msgSend( v4,  "setObject:forKeyedSubscript:",  &off_1000DED90,  +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)v5 - 5));
    objc_msgSend( v4,  "setObject:forKeyedSubscript:",  &off_1000DED90,  +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)v5 - 6));
    objc_msgSend( v4,  "setObject:forKeyedSubscript:",  &off_1000DED90,  +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)v5 - 7));
    objc_msgSend( v4,  "setObject:forKeyedSubscript:",  &off_1000DED90,  +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)v5 - 8));
    objc_msgSend( v4,  "setObject:forKeyedSubscript:",  &off_1000DED90,  +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)v5 - 9));
    objc_msgSend( v4,  "setObject:forKeyedSubscript:",  &off_1000DED90,  +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)v5 - 10));
    objc_msgSend( v4,  "setObject:forKeyedSubscript:",  &off_1000DED90,  +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)v5 - 11));
    objc_msgSend( v4,  "setObject:forKeyedSubscript:",  &off_1000DED90,  +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)v5 - 12));
    objc_msgSend( v4,  "setObject:forKeyedSubscript:",  &off_1000DED90,  +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)v5 - 13));
    objc_msgSend( v4,  "setObject:forKeyedSubscript:",  &off_1000DED90,  +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)v5 - 14));
    objc_msgSend( v4,  "setObject:forKeyedSubscript:",  &off_1000DED90,  +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)v5 - 15));
    id v8 = (char *)v5 - 16;
    goto LABEL_11;
  }

  if (([a3 flags] & 0x400) != 0)
  {
    objc_msgSend( v4,  "setObject:forKeyedSubscript:",  &off_1000DED00,  +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)v5 + 8));
    objc_msgSend( v4,  "setObject:forKeyedSubscript:",  &off_1000DED90,  +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)v5 + 7));
    objc_msgSend( v4,  "setObject:forKeyedSubscript:",  &off_1000DED90,  +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)v5 + 6));
    objc_msgSend( v4,  "setObject:forKeyedSubscript:",  &off_1000DED90,  +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)v5 + 5));
    objc_msgSend( v4,  "setObject:forKeyedSubscript:",  &off_1000DED90,  +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)v5 + 4));
    objc_msgSend( v4,  "setObject:forKeyedSubscript:",  &off_1000DED90,  +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)v5 + 3));
    objc_msgSend( v4,  "setObject:forKeyedSubscript:",  &off_1000DED90,  +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)v5 + 2));
    objc_msgSend( v4,  "setObject:forKeyedSubscript:",  &off_1000DED90,  +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)v5 + 1));
    objc_msgSend( v4,  "setObject:forKeyedSubscript:",  &off_1000DED90,  +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v5));
    objc_msgSend( v4,  "setObject:forKeyedSubscript:",  &off_1000DED90,  +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)v5 - 1));
    objc_msgSend( v4,  "setObject:forKeyedSubscript:",  &off_1000DED90,  +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)v5 - 2));
    objc_msgSend( v4,  "setObject:forKeyedSubscript:",  &off_1000DED90,  +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)v5 - 3));
    objc_msgSend( v4,  "setObject:forKeyedSubscript:",  &off_1000DED90,  +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)v5 - 4));
    objc_msgSend( v4,  "setObject:forKeyedSubscript:",  &off_1000DED90,  +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)v5 - 5));
    objc_msgSend( v4,  "setObject:forKeyedSubscript:",  &off_1000DED90,  +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)v5 - 6));
    objc_msgSend( v4,  "setObject:forKeyedSubscript:",  &off_1000DED90,  +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)v5 - 7));
    id v8 = (char *)v5 - 8;
    goto LABEL_11;
  }

  unsigned __int8 v6 = [a3 flags];
  unsigned __int16 v7 = (unsigned __int16)[a3 flags];
  if ((v6 & 4) != 0)
  {
    uint64_t v9 = -2LL;
    if ((v7 & 0x200) != 0) {
      uint64_t v9 = 2LL;
    }
    uint64_t v10 = (v9 + 2 * (uint64_t)v5) >> 1;
    objc_msgSend( v4,  "setObject:forKeyedSubscript:",  &off_1000DED00,  +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v10 + 4));
    objc_msgSend( v4,  "setObject:forKeyedSubscript:",  &off_1000DED90,  +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v10 + 3));
    objc_msgSend( v4,  "setObject:forKeyedSubscript:",  &off_1000DED90,  +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v10 + 2));
    objc_msgSend( v4,  "setObject:forKeyedSubscript:",  &off_1000DED90,  +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v10 + 1));
    objc_msgSend( v4,  "setObject:forKeyedSubscript:",  &off_1000DED90,  +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v10));
    objc_msgSend( v4,  "setObject:forKeyedSubscript:",  &off_1000DED90,  +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v10 - 1));
    objc_msgSend( v4,  "setObject:forKeyedSubscript:",  &off_1000DED90,  +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v10 - 2));
    objc_msgSend( v4,  "setObject:forKeyedSubscript:",  &off_1000DED90,  +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v10 - 3));
    id v8 = (char *)(v10 - 4);
    goto LABEL_11;
  }

  if ((v7 & 2) != 0)
  {
    objc_msgSend( v4,  "setObject:forKeyedSubscript:",  &off_1000DED00,  +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)v5 + 2));
    objc_msgSend( v4,  "setObject:forKeyedSubscript:",  &off_1000DED90,  +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)v5 + 1));
    objc_msgSend( v4,  "setObject:forKeyedSubscript:",  &off_1000DED90,  +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v5));
    objc_msgSend( v4,  "setObject:forKeyedSubscript:",  &off_1000DED90,  +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)v5 - 1));
    id v8 = (char *)v5 - 2;
LABEL_11:
    objc_msgSend( v4,  "setObject:forKeyedSubscript:",  &off_1000DED00,  +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v8));
  }

  return [v4 copy];
}

+ (id)__ambiguousSSIDs
{
  if (qword_1000F7538 != -1) {
    dispatch_once(&qword_1000F7538, &stru_1000D2748);
  }
  return (id)qword_1000F7530;
}

- (BOOL)__isUsingCustomProxySettings:(id)a3
{
  if ([a3 count] != (id)2) {
    return [a3 count] != 0;
  }
  id v4 = [a3 objectForKeyedSubscript:kSCPropNetProxiesExceptionsList];
  if ([v4 count] == (id)2
    && [v4 containsObject:@"*.local"]
    && [v4 containsObject:@"169.254/16"])
  {
    return objc_msgSend( objc_msgSend(a3, "objectForKeyedSubscript:", kSCPropNetProxiesFTPPassive),  "BOOLValue") ^ 1;
  }

  else
  {
    return 1;
  }

- (int64_t)__ipv6ConfigMethodForDescription:(id)a3
{
  return 0x7FFFFFFFFFFFFFFFLL;
}

- (int64_t)__ipv4ConfigMethodForDescription:(id)a3
{
  return 0x7FFFFFFFFFFFFFFFLL;
}

- (id)__runDiagnosticsTest:(id)a3
{
  uint64_t v5 = W5DescriptionForDiagnosticsTestID([a3 testID]);
  if (-[NSArray containsObject:]( -[W5StatusManager bootArgs](self->_status, "bootArgs"),  "containsObject:",  +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@=%ld",  @"wifivelocity-exclude-test",  [a3 testID]))
    || -[NSArray containsObject:]( -[W5StatusManager bootArgs](self->_status, "bootArgs"),  "containsObject:",  +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@='%@'",  @"wifivelocity-exclude-test",  v5)))
  {
    unsigned __int8 v6 = (os_log_s *)sub_10008C90C();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v22 = 138543618;
      uint64_t v23 = v5;
      __int16 v24 = 2048;
      id v25 = [a3 testID];
      LODWORD(v21) = 22;
      _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v6,  0LL,  "[wifivelocity] EXCLUDING [%{public}@] (testID=%ld) via boot-arg!!!",  &v22,  v21);
    }

    return 0LL;
  }

  else
  {
    uint64_t v9 = (os_log_s *)sub_10008C90C();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = -[NSDateFormatter stringFromDate:]( self->_dateFormatter,  "stringFromDate:",  +[NSDate date](&OBJC_CLASS___NSDate, "date"));
      int v22 = 138543874;
      uint64_t v23 = (uint64_t)v10;
      __int16 v24 = 2114;
      id v25 = objc_msgSend(objc_msgSend(objc_msgSend(a3, "uuid"), "UUIDString"), "substringToIndex:", 5);
      __int16 v26 = 2114;
      uint64_t v27 = v5;
      LODWORD(v21) = 32;
      _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v9,  0LL,  "[wifivelocity] %{public}@ [%{public}@] BEGIN   %{public}@",  &v22,  v21);
    }

    switch((unint64_t)[a3 testID])
    {
      case 1uLL:
        id v11 = -[W5DiagnosticsManager __testPingLANWithConfiguration:]( self,  "__testPingLANWithConfiguration:",  [a3 configuration]);
        goto LABEL_75;
      case 2uLL:
        id v11 = -[W5DiagnosticsManager __testPingLANUsingIMFoundation](self, "__testPingLANUsingIMFoundation");
        goto LABEL_75;
      case 3uLL:
        id v11 = -[W5DiagnosticsManager __testPingLANUsingCFNetworkWithConfiguration:]( self,  "__testPingLANUsingCFNetworkWithConfiguration:",  [a3 configuration]);
        goto LABEL_75;
      case 4uLL:
        id v11 = -[W5DiagnosticsManager __testPingWANWithConfiguration:]( self,  "__testPingWANWithConfiguration:",  [a3 configuration]);
        goto LABEL_75;
      case 5uLL:
        id v11 = -[W5DiagnosticsManager __testPingWANUsingIMFoundation](self, "__testPingWANUsingIMFoundation");
        goto LABEL_75;
      case 6uLL:
        id v11 = -[W5DiagnosticsManager __testPingWANUsingCFNetworkWithConfiguration:]( self,  "__testPingWANUsingCFNetworkWithConfiguration:",  [a3 configuration]);
        goto LABEL_75;
      case 7uLL:
        id v11 = -[W5DiagnosticsManager __testResolveDNS](self, "__testResolveDNS");
        goto LABEL_75;
      case 8uLL:
        id v11 = -[W5DiagnosticsManager __testDetectDoubleNAT](self, "__testDetectDoubleNAT");
        goto LABEL_75;
      case 9uLL:
        id v11 = -[W5DiagnosticsManager __testReachApple](self, "__testReachApple");
        goto LABEL_75;
      case 0xAuLL:
        id v11 = -[W5DiagnosticsManager __testRetrieveApple](self, "__testRetrieveApple");
        goto LABEL_75;
      case 0xBuLL:
        id v11 = -[W5DiagnosticsManager __testRetrieveAppleForceWiFiWithConfiguration:]( self,  "__testRetrieveAppleForceWiFiWithConfiguration:",  [a3 configuration]);
        goto LABEL_75;
      case 0xCuLL:
        id v11 = -[W5DiagnosticsManager __testIPv4Assigned](self, "__testIPv4Assigned");
        goto LABEL_75;
      case 0xDuLL:
        id v11 = -[W5DiagnosticsManager __testIPv6Assigned](self, "__testIPv6Assigned");
        goto LABEL_75;
      case 0xEuLL:
        id v11 = -[W5DiagnosticsManager __testCustomIPv4](self, "__testCustomIPv4");
        goto LABEL_75;
      case 0xFuLL:
        id v11 = -[W5DiagnosticsManager __testCustomIPv6](self, "__testCustomIPv6");
        goto LABEL_75;
      case 0x10uLL:
        id v11 = -[W5DiagnosticsManager __testCustomDNS](self, "__testCustomDNS");
        goto LABEL_75;
      case 0x11uLL:
        id v11 = -[W5DiagnosticsManager __testCustomWebProxy](self, "__testCustomWebProxy");
        goto LABEL_75;
      case 0x12uLL:
        id v11 = -[W5DiagnosticsManager __testHighBTPairedWithConfiguration:]( self,  "__testHighBTPairedWithConfiguration:",  [a3 configuration]);
        goto LABEL_75;
      case 0x13uLL:
        id v11 = -[W5DiagnosticsManager __testHighBTConnectedWithConfiguration:]( self,  "__testHighBTConnectedWithConfiguration:",  [a3 configuration]);
        goto LABEL_75;
      case 0x14uLL:
        id v11 = -[W5DiagnosticsManager __testBTCoexWithConfiguration:]( self,  "__testBTCoexWithConfiguration:",  [a3 configuration]);
        goto LABEL_75;
      case 0x15uLL:
        id v11 = -[W5DiagnosticsManager __testAWDLEnabledWithConfiguration:]( self,  "__testAWDLEnabledWithConfiguration:",  [a3 configuration]);
        goto LABEL_75;
      case 0x16uLL:
        id v11 = -[W5DiagnosticsManager __testAWDLRealtimeWithConfiguration:]( self,  "__testAWDLRealtimeWithConfiguration:",  [a3 configuration]);
        goto LABEL_75;
      case 0x17uLL:
        id v11 = -[W5DiagnosticsManager __testCongestedChannelUsingCCAWithConfiguration:]( self,  "__testCongestedChannelUsingCCAWithConfiguration:",  [a3 configuration]);
        goto LABEL_75;
      case 0x18uLL:
        id v11 = -[W5DiagnosticsManager __testCongestedChannelWithConfiguration:]( self,  "__testCongestedChannelWithConfiguration:",  [a3 configuration]);
        goto LABEL_75;
      case 0x19uLL:
        id v11 = -[W5DiagnosticsManager __testCongested2GHzWithConfiguration:]( self,  "__testCongested2GHzWithConfiguration:",  [a3 configuration]);
        goto LABEL_75;
      case 0x1AuLL:
        id v11 = -[W5DiagnosticsManager __testCongested5GHzWithConfiguration:]( self,  "__testCongested5GHzWithConfiguration:",  [a3 configuration]);
        goto LABEL_75;
      case 0x1BuLL:
        id v11 = -[W5DiagnosticsManager __testHT402GHzWithConfiguration:]( self,  "__testHT402GHzWithConfiguration:",  [a3 configuration]);
        goto LABEL_75;
      case 0x1CuLL:
        id v11 = -[W5DiagnosticsManager __testConflictingCountryCodeWithConfiguration:]( self,  "__testConflictingCountryCodeWithConfiguration:",  [a3 configuration]);
        goto LABEL_75;
      case 0x1DuLL:
        id v11 = -[W5DiagnosticsManager __testConflictingSecurityTypePNLWithConfiguration:]( self,  "__testConflictingSecurityTypePNLWithConfiguration:",  [a3 configuration]);
        goto LABEL_75;
      case 0x1EuLL:
        id v11 = -[W5DiagnosticsManager __testWiFiHiddenScanResultsWithConfiguration:]( self,  "__testWiFiHiddenScanResultsWithConfiguration:",  [a3 configuration]);
        goto LABEL_75;
      case 0x1FuLL:
        id v11 = -[W5DiagnosticsManager __testWiFiNoScanResultsWithConfiguration:]( self,  "__testWiFiNoScanResultsWithConfiguration:",  [a3 configuration]);
        goto LABEL_75;
      case 0x20uLL:
        id v11 = -[W5DiagnosticsManager __testPoorSignalWithConfiguration:]( self,  "__testPoorSignalWithConfiguration:",  [a3 configuration]);
        goto LABEL_75;
      case 0x21uLL:
        id v11 = -[W5DiagnosticsManager __testAirPortBaseStationWithConfiguration:]( self,  "__testAirPortBaseStationWithConfiguration:",  [a3 configuration]);
        goto LABEL_75;
      case 0x22uLL:
        id v11 = -[W5DiagnosticsManager __testLongBeaconIntervalWithConfiguration:]( self,  "__testLongBeaconIntervalWithConfiguration:",  [a3 configuration]);
        goto LABEL_75;
      case 0x23uLL:
        id v11 = -[W5DiagnosticsManager __testLongDTIMInterval](self, "__testLongDTIMInterval");
        goto LABEL_75;
      case 0x24uLL:
        id v11 = -[W5DiagnosticsManager __testConflictingPHYMode11acWithConfiguration:]( self,  "__testConflictingPHYMode11acWithConfiguration:",  [a3 configuration]);
        goto LABEL_75;
      case 0x25uLL:
        id v11 = -[W5DiagnosticsManager __testConflictingPHYMode11nWithConfiguration:]( self,  "__testConflictingPHYMode11nWithConfiguration:",  [a3 configuration]);
        goto LABEL_75;
      case 0x26uLL:
        id v11 = -[W5DiagnosticsManager __testNoSecurityWithConfiguration:]( self,  "__testNoSecurityWithConfiguration:",  [a3 configuration]);
        goto LABEL_75;
      case 0x27uLL:
        id v11 = -[W5DiagnosticsManager __testLegacySecurityWEPWithConfiguration:]( self,  "__testLegacySecurityWEPWithConfiguration:",  [a3 configuration]);
        goto LABEL_75;
      case 0x28uLL:
        id v11 = -[W5DiagnosticsManager __testLegacySecurityWPAWithConfiguration:]( self,  "__testLegacySecurityWPAWithConfiguration:",  [a3 configuration]);
        goto LABEL_75;
      case 0x29uLL:
        id v11 = -[W5DiagnosticsManager __testLegacyRates11bWithConfiguration:]( self,  "__testLegacyRates11bWithConfiguration:",  [a3 configuration]);
        goto LABEL_75;
      case 0x2AuLL:
        id v11 = -[W5DiagnosticsManager __testAmbiguousNetworkNameWithConfiguration:]( self,  "__testAmbiguousNetworkNameWithConfiguration:",  [a3 configuration]);
        goto LABEL_75;
      case 0x2BuLL:
        id v11 = -[W5DiagnosticsManager __testHiddenNetworkWithConfiguration:]( self,  "__testHiddenNetworkWithConfiguration:",  [a3 configuration]);
        goto LABEL_75;
      case 0x2CuLL:
        id v11 = -[W5DiagnosticsManager __testiOSPersonalHotspotWithConfiguration:]( self,  "__testiOSPersonalHotspotWithConfiguration:",  [a3 configuration]);
        goto LABEL_75;
      case 0x2DuLL:
        id v11 = -[W5DiagnosticsManager __testPasspointWithConfiguration:]( self,  "__testPasspointWithConfiguration:",  [a3 configuration]);
        goto LABEL_75;
      case 0x2EuLL:
        id v11 = -[W5DiagnosticsManager __testCaptivePortalWithConfiguration:]( self,  "__testCaptivePortalWithConfiguration:",  [a3 configuration]);
        goto LABEL_75;
      case 0x2FuLL:
        id v11 = -[W5DiagnosticsManager __testLargePNLWithConfiguration:]( self,  "__testLargePNLWithConfiguration:",  [a3 configuration]);
        goto LABEL_75;
      case 0x30uLL:
        id v11 = -[W5DiagnosticsManager __testPNLContainsHiddenWithConfiguration:]( self,  "__testPNLContainsHiddenWithConfiguration:",  [a3 configuration]);
        goto LABEL_75;
      case 0x31uLL:
        id v11 = -[W5DiagnosticsManager __testDownloadSpeedWithConfiguration:]( self,  "__testDownloadSpeedWithConfiguration:",  [a3 configuration]);
        goto LABEL_75;
      case 0x32uLL:
        id v11 = -[W5DiagnosticsManager __testUploadSpeedWithConfiguration:]( self,  "__testUploadSpeedWithConfiguration:",  [a3 configuration]);
        goto LABEL_75;
      case 0x33uLL:
        id v11 = -[W5DiagnosticsManager __testLeakyAP](self, "__testLeakyAP");
        goto LABEL_75;
      case 0x34uLL:
        id v11 = -[W5DiagnosticsManager __testWiFiLink](self, "__testWiFiLink");
        goto LABEL_75;
      case 0x35uLL:
        id v11 = -[W5DiagnosticsManager __testConcurrentWithConfiguration:]( self,  "__testConcurrentWithConfiguration:",  [a3 configuration]);
        goto LABEL_75;
      case 0x36uLL:
        id v11 = -[W5DiagnosticsManager __testCurlApple](self, "__testCurlApple");
        goto LABEL_75;
      case 0x37uLL:
        unsigned __int16 v7 = objc_alloc_init(&OBJC_CLASS___W5DiagnosticsTestResult);
        -[W5DiagnosticsTestResult setTestID:](v7, "setTestID:", [a3 testID]);
        -[W5DiagnosticsTestResult setDidPass:](v7, "setDidPass:", 1LL);
        -[W5DiagnosticsTestResult setResult:](v7, "setResult:", 1LL);
        +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
        -[W5DiagnosticsTestResult setTestStarted:](v7, "setTestStarted:");
        -[W5DiagnosticsManager beginWiFiDefaultRoute](self, "beginWiFiDefaultRoute");
        goto LABEL_70;
      case 0x38uLL:
        unsigned __int16 v7 = objc_alloc_init(&OBJC_CLASS___W5DiagnosticsTestResult);
        -[W5DiagnosticsTestResult setTestID:](v7, "setTestID:", [a3 testID]);
        -[W5DiagnosticsTestResult setDidPass:](v7, "setDidPass:", 1LL);
        -[W5DiagnosticsTestResult setResult:](v7, "setResult:", 1LL);
        +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
        -[W5DiagnosticsTestResult setTestStarted:](v7, "setTestStarted:");
        -[W5DiagnosticsManager endWiFiDefaultRoute](self, "endWiFiDefaultRoute");
LABEL_70:
        +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
        -[W5DiagnosticsTestResult setTestCompleted:](v7, "setTestCompleted:");
        break;
      case 0x39uLL:
        id v11 = -[W5DiagnosticsManager __testWiFiIsPrimaryIPv4](self, "__testWiFiIsPrimaryIPv4");
        goto LABEL_75;
      case 0x3AuLL:
        id v11 = -[W5DiagnosticsManager __testWiFiIsPrimaryIPv6](self, "__testWiFiIsPrimaryIPv6");
        goto LABEL_75;
      case 0x3BuLL:
        id v11 = -[W5DiagnosticsManager __testPing6AWDLWithConfiguration:]( self,  "__testPing6AWDLWithConfiguration:",  [a3 configuration]);
        goto LABEL_75;
      case 0x3CuLL:
        id v11 = -[W5DiagnosticsManager __testPeerDiagnostics](self, "__testPeerDiagnostics");
        goto LABEL_75;
      case 0x3DuLL:
        id v11 = -[W5DiagnosticsManager __testPeerTypes](self, "__testPeerTypes");
        goto LABEL_75;
      case 0x3EuLL:
        id v11 = -[W5DiagnosticsManager __testDiscoverPeerTypes](self, "__testDiscoverPeerTypes");
        goto LABEL_75;
      case 0x3FuLL:
        id v11 = -[W5DiagnosticsManager __testReachabilityToPeersWithConfiguration:]( self,  "__testReachabilityToPeersWithConfiguration:",  [a3 configuration]);
LABEL_75:
        unsigned __int16 v7 = v11;
        break;
      default:
        unsigned __int16 v7 = 0LL;
        break;
    }

    id v12 = (os_log_s *)sub_10008C90C();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v13 = -[NSDateFormatter stringFromDate:]( self->_dateFormatter,  "stringFromDate:",  +[NSDate date](&OBJC_CLASS___NSDate, "date"));
      id v14 = objc_msgSend(objc_msgSend(objc_msgSend(a3, "uuid"), "UUIDString"), "substringToIndex:", 5);
      -[W5DiagnosticsTestResult testCompleted](v7, "testCompleted");
      double v16 = v15;
      -[W5DiagnosticsTestResult testStarted](v7, "testStarted");
      double v18 = v16 - v17;
      unsigned int v19 = -[W5DiagnosticsTestResult result](v7, "result");
      unsigned int v20 = -[W5DiagnosticsTestResult didPass](v7, "didPass");
      int v22 = 138544642;
      uint64_t v23 = (uint64_t)v13;
      __int16 v24 = 2114;
      id v25 = v14;
      __int16 v26 = 2114;
      uint64_t v27 = v5;
      __int16 v28 = 2048;
      double v29 = v18;
      __int16 v30 = 1024;
      unsigned int v31 = v19;
      __int16 v32 = 1024;
      unsigned int v33 = v20;
      LODWORD(v21) = 54;
      _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v12,  0LL,  "[wifivelocity] %{public}@ [%{public}@] END     %{public}@, took %.6fs, result=%d, didPass=%d",  &v22,  v21);
    }
  }

  return v7;
}

+ (void)__parsePingOutput:(id)a3 result:(id)a4
{
  if (a3)
  {
    if (a4)
    {
      uint64_t v5 = -[NSString initWithData:encoding:](objc_alloc(&OBJC_CLASS___NSString), "initWithData:encoding:", a3, 4LL);
      if (v5)
      {
        unsigned __int8 v6 = -[NSString componentsSeparatedByString:](v5, "componentsSeparatedByString:", @"\n");
        __int128 v14 = 0u;
        __int128 v15 = 0u;
        __int128 v16 = 0u;
        __int128 v17 = 0u;
        id v7 = -[NSArray countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v14,  v18,  16LL);
        if (v7)
        {
          id v8 = v7;
          uint64_t v9 = *(void *)v15;
          do
          {
            uint64_t v10 = 0LL;
            do
            {
              if (*(void *)v15 != v9) {
                objc_enumerationMutation(v6);
              }
              id v11 = objc_msgSend( *(id *)(*((void *)&v14 + 1) + 8 * (void)v10),  "componentsSeparatedByCharactersInSet:",  +[NSCharacterSet whitespaceCharacterSet](NSCharacterSet, "whitespaceCharacterSet"));
              if ([v11 containsObject:@"loss"]
                && (unint64_t)[v11 count] >= 7)
              {
                id v12 = [v11 objectAtIndexedSubscript:6];
                objc_msgSend( objc_msgSend(v12, "substringToIndex:", (char *)objc_msgSend(v12, "length") - 1),  "doubleValue");
                objc_msgSend(a4, "setPacketLoss:");
              }

              else if ([v11 containsObject:@"round-trip"] {
                     && (unint64_t)[v11 count] >= 4)
              }
              {
                id v13 = objc_msgSend( objc_msgSend(v11, "objectAtIndexedSubscript:", 3),  "componentsSeparatedByString:",  @"/");
                if ((unint64_t)[v13 count] >= 4)
                {
                  objc_msgSend(objc_msgSend(v13, "objectAtIndexedSubscript:", 0), "doubleValue");
                  objc_msgSend(a4, "setMin:");
                  objc_msgSend(objc_msgSend(v13, "objectAtIndexedSubscript:", 1), "doubleValue");
                  objc_msgSend(a4, "setAvg:");
                  objc_msgSend(objc_msgSend(v13, "objectAtIndexedSubscript:", 2), "doubleValue");
                  objc_msgSend(a4, "setMax:");
                  objc_msgSend(objc_msgSend(v13, "objectAtIndexedSubscript:", 3), "doubleValue");
                  objc_msgSend(a4, "setStddev:");
                }
              }

              uint64_t v10 = (char *)v10 + 1;
            }

            while (v8 != v10);
            id v8 = -[NSArray countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v14,  v18,  16LL);
          }

          while (v8);
        }
      }
    }
  }

+ (BOOL)__detectLocalIPv4Address:(id)a3
{
  id v3 = [a3 componentsSeparatedByString:@"."];
  return (unint64_t)[v3 count] >= 2
      && (objc_msgSend(objc_msgSend(v3, "objectAtIndexedSubscript:", 0), "integerValue") == (id)10
       || objc_msgSend(objc_msgSend(v3, "objectAtIndexedSubscript:", 0), "integerValue") == (id)172
       && objc_msgSend(objc_msgSend(v3, "objectAtIndexedSubscript:", 1), "integerValue") == (id)16
       || objc_msgSend(objc_msgSend(v3, "objectAtIndexedSubscript:", 0), "integerValue") == (id)192
       && objc_msgSend(objc_msgSend(v3, "objectAtIndexedSubscript:", 1), "integerValue") == (id)168);
}

+ (BOOL)__isDoubleNATWithTracerouteOutput:(id)a3
{
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  id obj = [a3 componentsSeparatedByString:@"\n"];
  id v4 = [obj countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = 0LL;
    uint64_t v7 = *(void *)v16;
    do
    {
      for (i = 0LL; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void **)(*((void *)&v15 + 1) + 8LL * (void)i);
        unint64_t v10 = (unint64_t)objc_msgSend(v9, "rangeOfString:", @"(");
        id v11 = (char *)[v9 rangeOfString:@""]);
        if (v10 != 0x7FFFFFFFFFFFFFFFLL && v11 != (char *)0x7FFFFFFFFFFFFFFFLL) {
          v6 += objc_msgSend( a1,  "__detectLocalIPv4Address:",  objc_msgSend(v9, "substringWithRange:", v10 + 1, &v11[~v10]));
        }
      }

      id v5 = [obj countByEnumeratingWithState:&v15 objects:v19 count:16];
    }

    while (v5);
  }

  else
  {
    uint64_t v6 = 0LL;
  }

  return v6 > 1;
}

- (id)__performTracerouteWithAddress:(id)a3 maxTTL:(int64_t)a4 waittime:(int64_t)a5 queries:(int64_t)a6
{
  id result = -[W5WiFiInterface interfaceName]( -[W5StatusManager wifi](self->_status, "wifi", a3, a4, a5, a6),  "interfaceName");
  if (result)
  {
    v9[0] = @"-n";
    v9[1] = @"-m";
    void v9[2] = @"6";
    v9[3] = @"-i";
    v9[4] = result;
    v9[5] = @"-w";
    v9[6] = @"2";
    v9[7] = @"-q";
    void v9[8] = @"1";
    v9[9] = @"captive.apple.com";
    uint64_t v7 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v9, 10LL);
    id v8 = +[NSMutableData dataWithCapacity:](&OBJC_CLASS___NSMutableData, "dataWithCapacity:", 0LL);
    if (+[NSTask runTaskWithLaunchPath:arguments:outputData:error:]( &OBJC_CLASS___NSTask,  "runTaskWithLaunchPath:arguments:outputData:error:",  @"/usr/sbin/traceroute",  v7,  v8,  0LL))
    {
      return -[NSString initWithData:encoding:](objc_alloc(&OBJC_CLASS___NSString), "initWithData:encoding:", v8, 4LL);
    }

    else
    {
      return 0LL;
    }
  }

  return result;
}

- (id)__performPingUsingIMFoundationWithAddress:(id)a3 timeout:(int64_t)a4
{
  uint64_t v18 = 0LL;
  unsigned int v19 = &v18;
  uint64_t v20 = 0x3052000000LL;
  uint64_t v21 = sub_1000381CC;
  int v22 = sub_1000381DC;
  uint64_t v23 = 0LL;
  if (!qword_1000F7540)
  {
    *(_OWORD *)buf = off_1000D27F8;
    uint64_t v28 = 0LL;
    qword_1000F7540 = _sl_dlopen(buf, 0LL);
  }

  if (a4 <= 2147483646 && a3 && qword_1000F7540)
  {
    uint64_t v7 = dispatch_semaphore_create(0LL);
    +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
    uint64_t v9 = v8;
    *(void *)buf = 0LL;
    *(void *)&buf[8] = buf;
    uint64_t v28 = 0x3052000000LL;
    double v29 = sub_1000381CC;
    __int16 v30 = sub_1000381DC;
    unint64_t v10 = (objc_class *)qword_1000F7548;
    uint64_t v31 = qword_1000F7548;
    if (!qword_1000F7548)
    {
      v24[0] = _NSConcreteStackBlock;
      v24[1] = 3221225472LL;
      void v24[2] = sub_100045A44;
      v24[3] = &unk_1000D12E0;
      v24[4] = buf;
      sub_100045A44((uint64_t)v24);
      unint64_t v10 = *(objc_class **)(*(void *)&buf[8] + 40LL);
    }

    _Block_object_dispose(buf, 8);
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472LL;
    void v17[2] = sub_10004458C;
    v17[3] = &unk_1000D2770;
    v17[4] = a3;
    v17[5] = self;
    v17[8] = v9;
    v17[6] = v7;
    v17[7] = &v18;
    objc_msgSend( objc_msgSend([v10 alloc], "initWithAddress:wifi:", a3, 1),  "startWithTimeout:queue:completionHandler:",  dispatch_get_global_queue(0, 0),  v17,  (double)a4);
    dispatch_time_t v11 = dispatch_time(0LL, 80000000000LL);
    if (dispatch_semaphore_wait(v7, v11) >= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134349056;
      *(void *)&buf[4] = 0x4054000000000000LL;
      _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "[wifivelocity] FAILED to complete operation within %{public}.1fs, continuing",  buf,  0xCu);
    }

    id v12 = (id)v19[5];
  }

  if (v19[5])
  {
    id v13 = objc_alloc_init(&OBJC_CLASS___W5Event);
    -[W5Event setEventID:](v13, "setEventID:", 34LL);
    [(id)v19[5] endedAt];
    -[W5Event setTimestamp:](v13, "setTimestamp:");
    id v25 = @"PingResult";
    uint64_t v26 = v19[5];
    -[W5Event setInfo:]( v13,  "setInfo:",  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v26,  &v25,  1LL));
    pingCallback = (void (**)(id, W5Event *))self->_pingCallback;
    if (pingCallback) {
      pingCallback[2](pingCallback, v13);
    }
  }

  __int128 v15 = (void *)v19[5];
  _Block_object_dispose(&v18, 8);
  return v15;
}

- (id)__performPingWithAddress:(id)a3 count:(int64_t)a4 timeout:(double)a5 wait:(double)a6 interval:(double)a7 trafficClass:(id)a8 interfaceName:(id)a9 dataLength:(unint64_t)a10
{
  if (a5 >= 2147483650.0 || a4 > 2147483646 || a3 == 0LL || a9 == 0LL) {
    return 0LL;
  }
  if (a8 && (uint64_t v21 = W5DescriptionForPingTrafficClass([a8 integerValue])) != 0)
  {
    uint64_t v22 = v21;
    v37[0] = @"-c";
    v37[1] = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%ld", a4);
    v37[2] = @"-b";
    v37[3] = a9;
    v37[4] = @"-k";
    v37[5] = v22;
    v37[6] = @"-i";
    v37[7] = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%.1f", *(void *)&a7);
    v37[8] = @"-t";
    v37[9] = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%.2f", *(void *)&a5);
    v37[10] = @"-W";
    v37[11] = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%ld",  (uint64_t)(a6 * 1000.0));
    v37[12] = @"-s";
    v37[13] = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%ld", a10 + 56);
    v37[14] = a3;
    uint64_t v23 = v37;
    uint64_t v24 = 15LL;
  }

  else
  {
    v36[0] = @"-c";
    v36[1] = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%ld", a4);
    v36[2] = @"-b";
    v36[3] = a9;
    v36[4] = @"-i";
    v36[5] = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%.1f", *(void *)&a7);
    v36[6] = @"-t";
    v36[7] = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%.2f", *(void *)&a5);
    v36[8] = @"-W";
    v36[9] = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%ld",  (uint64_t)(a6 * 1000.0));
    v36[10] = @"-s";
    v36[11] = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%ld", a10 + 56);
    v36[12] = a3;
    uint64_t v23 = v36;
    uint64_t v24 = 13LL;
  }

  id v25 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v23, v24);
  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  double v27 = v26;
  uint64_t v28 = +[NSMutableData dataWithCapacity:](&OBJC_CLASS___NSMutableData, "dataWithCapacity:", 0LL);
  +[NSTask runTaskWithLaunchPath:arguments:outputData:error:]( &OBJC_CLASS___NSTask,  "runTaskWithLaunchPath:arguments:outputData:error:",  @"/sbin/ping",  v25,  v28,  0LL);
  id v29 = objc_alloc_init(&OBJC_CLASS___W5PingResult);
  [v29 setInterfaceName:a9];
  [v29 setAddress:a3];
  [v29 setCount:a4];
  [v29 setTimeout:a5];
  [v29 setWait:a6];
  [v29 setInterval:a7];
  objc_msgSend(v29, "setTrafficClass:", objc_msgSend(a8, "integerValue"));
  [v29 setDataLength:a10];
  [v29 setStartedAt:v27];
  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v29, "setEndedAt:");
  [v29 setCommand:+[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"/sbin/ping %@", -[NSArray componentsJoinedByString:](v25, "componentsJoinedByString:", @" "))];
  objc_msgSend( v29,  "setOutput:",  -[NSString initWithData:encoding:]([NSString alloc], "initWithData:encoding:", v28, 4));
  +[W5DiagnosticsManager __parsePingOutput:result:]( &OBJC_CLASS___W5DiagnosticsManager,  "__parsePingOutput:result:",  v28,  v29);
  if (v29)
  {
    __int16 v30 = objc_alloc_init(&OBJC_CLASS___W5Event);
    -[W5Event setEventID:](v30, "setEventID:", 34LL);
    [v29 endedAt];
    -[W5Event setTimestamp:](v30, "setTimestamp:");
    __int128 v34 = @"PingResult";
    id v35 = v29;
    -[W5Event setInfo:]( v30,  "setInfo:",  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v35,  &v34,  1LL));
    pingCallback = (void (**)(id, W5Event *))self->_pingCallback;
    if (pingCallback) {
      pingCallback[2](pingCallback, v30);
    }
  }

  return v29;
}

- (id)__performPing6WithAddress:(id)a3 count:(int64_t)a4 wait:(double)a5 trafficClass:(id)a6 interfaceName:(id)a7 dataLength:(unint64_t)a8
{
  id v8 = 0LL;
  if (a3 && a4 <= 2147483646 && a7)
  {
    if (a6 && (uint64_t v15 = W5DescriptionForPingTrafficClass([a6 integerValue])) != 0)
    {
      uint64_t v16 = v15;
      v30[0] = @"-c";
      v30[1] = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%ld", a4);
      v30[2] = @"-B";
      v30[3] = a7;
      v30[4] = @"-I";
      v30[5] = a7;
      v30[6] = @"-k";
      v30[7] = v16;
      v30[8] = @"-i";
      v30[9] = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%f", *(void *)&a5);
      v30[10] = @"-s";
      v30[11] = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%ld", a8 + 56);
      v30[12] = a3;
      __int128 v17 = v30;
      uint64_t v18 = 13LL;
    }

    else
    {
      v29[0] = @"-c";
      v29[1] = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%ld", a4);
      v29[2] = @"-B";
      v29[3] = a7;
      v29[4] = @"-I";
      v29[5] = a7;
      v29[6] = @"-i";
      v29[7] = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%f", *(void *)&a5);
      v29[8] = @"-s";
      v29[9] = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%ld", a8 + 56);
      v29[10] = a3;
      __int128 v17 = v29;
      uint64_t v18 = 11LL;
    }

    unsigned int v19 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v17, v18);
    +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
    double v21 = v20;
    uint64_t v22 = +[NSMutableData dataWithCapacity:](&OBJC_CLASS___NSMutableData, "dataWithCapacity:", 0LL);
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
    +[W5DiagnosticsManager __parsePingOutput:result:]( &OBJC_CLASS___W5DiagnosticsManager,  "__parsePingOutput:result:",  v22,  v8);
    if (v8)
    {
      uint64_t v23 = objc_alloc_init(&OBJC_CLASS___W5Event);
      -[W5Event setEventID:](v23, "setEventID:", 34LL);
      [v8 endedAt];
      -[W5Event setTimestamp:](v23, "setTimestamp:");
      double v27 = @"PingResult";
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

- (id)__performCFPingWithAddress:(id)a3 count:(int64_t)a4 timeout:(double)a5 trafficClass:(id)a6 networkServiceType:(id)a7 dataLength:(unint64_t)a8
{
  id v8 = 0LL;
  if (a3 && a4 <= 2147483646 && a5 < 2147483650.0)
  {
    +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
    double v14 = v13;
    id v15 = +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array");
    double v16 = 0.0;
    double v17 = 0.0;
    int64_t v47 = a4;
    if (a4 >= 1)
    {
      uint64_t v18 = kCFNetDiagnosticPingOptionTimeout;
      uint64_t v19 = kCFNetDiagnosticPingOptionPacketCount;
      uint64_t v20 = kCFNetDiagnosticPingOptionDataLength;
      uint64_t v49 = kCFNetDiagnosticPingOptionTrafficClass;
      uint64_t v48 = kCFNetDiagnosticPingOptionTypeOfService;
      int64_t v21 = v47;
      do
      {
        v60[0] = v18;
        v61[0] = +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", a5);
        v61[1] = &off_1000DED00;
        v60[1] = v19;
        v60[2] = v20;
        v61[2] = +[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a8);
        id v22 =  -[NSDictionary mutableCopy]( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v61,  v60,  3LL),  "mutableCopy");
        uint64_t v23 = v22;
        if (a6) {
          [v22 setObject:a6 forKeyedSubscript:v49];
        }
        if (a7) {
          [v23 setObject:a7 forKeyedSubscript:v48];
        }
        +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
        double v25 = v24;
        CFTypeRef cf = 0LL;
        int v26 = CFNetDiagnosticPingWithOptions(a3, v23, &cf);
        +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
        if (v26)
        {
          double v17 = v17 + 1.0;
          objc_msgSend( v15,  "addObject:",  +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", (v27 - v25) * 1000.0));
        }

        if (cf) {
          CFRelease(cf);
        }
        --v21;
      }

      while (v21);
    }

    double v28 = 0.0;
    double v29 = 0.0;
    if ([v15 count])
    {
      unint64_t v30 = 0LL;
      double v16 = 0.0;
      do
      {
        objc_msgSend(objc_msgSend(v15, "objectAtIndexedSubscript:", v30), "doubleValue");
        double v29 = v29 + v31;
        if (v31 <= v16) {
          double v32 = v16;
        }
        else {
          double v32 = v31;
        }
        if (v31 < v28) {
          double v33 = v31;
        }
        else {
          double v33 = v28;
        }
        if (v30) {
          double v16 = v32;
        }
        else {
          double v16 = v31;
        }
        if (v30) {
          double v28 = v33;
        }
        else {
          double v28 = v31;
        }
        ++v30;
      }

      while (v30 < (unint64_t)[v15 count]);
    }

    __int128 v52 = 0u;
    __int128 v53 = 0u;
    double v34 = v29 / (double)(unint64_t)[v15 count];
    __int128 v54 = 0u;
    __int128 v55 = 0u;
    id v35 = [v15 countByEnumeratingWithState:&v52 objects:v59 count:16];
    if (v35)
    {
      id v36 = v35;
      uint64_t v37 = *(void *)v53;
      double v38 = 0.0;
      do
      {
        for (i = 0LL; i != v36; i = (char *)i + 1)
        {
          if (*(void *)v53 != v37) {
            objc_enumerationMutation(v15);
          }
          [*(id *)(*((void *)&v52 + 1) + 8 * (void)i) doubleValue];
          double v38 = v38 + (v40 - v34) * (v40 - v34);
        }

        id v36 = [v15 countByEnumeratingWithState:&v52 objects:v59 count:16];
      }

      while (v36);
    }

    else
    {
      double v38 = 0.0;
    }

    double v41 = sqrt(v38 / (double)(unint64_t)[v15 count]);
    id v8 = objc_alloc_init(&OBJC_CLASS___W5PingResult);
    objc_msgSend( v8,  "setInterfaceName:",  -[W5WiFiInterface interfaceName](-[W5StatusManager wifi](self->_status, "wifi"), "interfaceName"));
    [v8 setAddress:a3];
    [v8 setCount:v47];
    [v8 setTimeout:a5];
    [v8 setWait:1.0];
    [v8 setInterval:1.0];
    objc_msgSend(v8, "setTrafficClass:", objc_msgSend(a6, "integerValue"));
    [v8 setDataLength:a8];
    [v8 setMin:v28];
    [v8 setMax:v16];
    [v8 setAvg:v34];
    [v8 setStddev:v41];
    [v8 setPacketLoss:((double)v47 - v17) / (double)v47];
    [v8 setStartedAt:v14];
    +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
    objc_msgSend(v8, "setEndedAt:");
    id v42 = v8;
    if (v8)
    {
      __int128 v43 = objc_alloc_init(&OBJC_CLASS___W5Event);
      -[W5Event setEventID:](v43, "setEventID:", 34LL);
      [v8 endedAt];
      -[W5Event setTimestamp:](v43, "setTimestamp:");
      __int128 v57 = @"PingResult";
      id v58 = v8;
      -[W5Event setInfo:]( v43,  "setInfo:",  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v58,  &v57,  1LL));
      pingCallback = (void (**)(id, W5Event *))self->_pingCallback;
      if (pingCallback) {
        pingCallback[2](pingCallback, v43);
      }
    }
  }

  return v8;
}

- (BOOL)__performCurlWithAddress:(id)a3
{
  id v4 = -[W5WiFiInterface interfaceName](-[W5StatusManager wifi](self->_status, "wifi"), "interfaceName");
  LOBYTE(v5) = 0;
  if (a3)
  {
    if (v4)
    {
      id v9 = a3;
      uint64_t v6 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v9, 1LL);
      uint64_t v7 = +[NSMutableData dataWithCapacity:](&OBJC_CLASS___NSMutableData, "dataWithCapacity:", 0LL);
      BOOL v5 = +[NSTask runTaskWithLaunchPath:arguments:timeout:outputData:errorData:launchHandler:didLaunch:error:]( &OBJC_CLASS___NSTask,  "runTaskWithLaunchPath:arguments:timeout:outputData:errorData:launchHandler:didLaunch:error:",  @"/usr/local/bin/curl",  v6,  v7,  0LL,  0LL,  0LL,  1.6,  0LL);
      if (v5) {
        LOBYTE(v5) = -[NSString length](  -[NSString initWithData:encoding:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithData:encoding:",  v7,  4LL),  "length") != 0;
      }
    }
  }

  return v5;
}

+ (id)__performDNSResolution:(id)a3
{
  id v3 = CFHostCreateWithName(kCFAllocatorDefault, (CFStringRef)a3);
  if (!v3) {
    return 0LL;
  }
  id v4 = v3;
  int started = CFHostStartInfoResolution(v3, kCFHostAddresses, 0LL);
  CFRetain(v4);
  dispatch_time_t v6 = dispatch_time(0LL, 1600000LL);
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100045608;
  block[3] = &unk_1000D2790;
  block[4] = v4;
  dispatch_after(v6, global_queue, block);
  if (!started) {
    goto LABEL_8;
  }
  Addressing = CFHostGetAddressing(v4, 0LL);
  id v9 = Addressing;
  if (Addressing)
  {
    if (CFArrayGetCount(Addressing))
    {
      id v9 = (const __CFArray *)-[__CFArray copy](v9, "copy");
      goto LABEL_6;
    }

+ (id)__networkServiceOrder
{
  id v2 = SCPreferencesCreate(kCFAllocatorDefault, @"wifivelocityd", 0LL);
  if (!v2) {
    return 0LL;
  }
  id v3 = v2;
  id v4 = SCNetworkSetCopyCurrent(v2);
  if (v4)
  {
    BOOL v5 = v4;
    ServiceOrder = SCNetworkSetGetServiceOrder(v4);
    uint64_t v7 = ServiceOrder;
    if (ServiceOrder)
    {
      if (CFArrayGetCount(ServiceOrder)) {
        uint64_t v7 = (const __CFArray *)-[__CFArray copy](v7, "copy");
      }
      else {
        uint64_t v7 = 0LL;
      }
    }

    CFRelease(v5);
  }

  else
  {
    uint64_t v7 = 0LL;
  }

  CFRelease(v3);
  return v7;
}

+ (BOOL)__setNetworkServiceOrder:(id)a3
{
  id v4 = SCPreferencesCreate(kCFAllocatorDefault, @"wifivelocityd", 0LL);
  if (!v4) {
    return 0;
  }
  BOOL v5 = v4;
  if (SCPreferencesLock(v4, 1u))
  {
    dispatch_time_t v6 = SCNetworkSetCopyCurrent(v5);
    if (v6)
    {
      uint64_t v7 = v6;
      if (SCNetworkSetSetServiceOrder(v6, (CFArrayRef)a3)
        && SCPreferencesCommitChanges(v5)
        && SCPreferencesApplyChanges(v5))
      {
        usleep(0x186A0u);
        BOOL v8 = 1;
      }

      else
      {
        BOOL v8 = 0;
      }

      SCPreferencesUnlock(v5);
      CFRelease(v7);
      goto LABEL_9;
    }

    SCPreferencesUnlock(v5);
  }

  BOOL v8 = 0;
LABEL_9:
  CFRelease(v5);
  return v8;
}

- (BOOL)__performLoadViaNSURLSessionWithAddress:(id)a3 usingTimeout:(id)a4 andForceWiFiInterface:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v20 = 0LL;
  int64_t v21 = &v20;
  uint64_t v22 = 0x2020000000LL;
  char v23 = 0;
  id v9 = dispatch_semaphore_create(0LL);
  unint64_t v10 = +[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", a3);
  if (v10)
  {
    if (a4) {
      [a4 doubleValue];
    }
    else {
      double v11 = 1.6;
    }
    id v12 = +[NSURLRequest requestWithURL:cachePolicy:timeoutInterval:]( &OBJC_CLASS___NSURLRequest,  "requestWithURL:cachePolicy:timeoutInterval:",  v10,  1LL,  v11);
    if (v12)
    {
      urlSession = self->_urlSession;
      if (urlSession
        || (double v14 = +[NSURLSessionConfiguration ephemeralSessionConfiguration]( &OBJC_CLASS___NSURLSessionConfiguration,  "ephemeralSessionConfiguration"),  (v15 = v14) != 0LL)
        && (-[NSURLSessionConfiguration setRequestCachePolicy:](v14, "setRequestCachePolicy:", 1LL),
            -[NSURLSessionConfiguration setHTTPMaximumConnectionsPerHost:]( v15,  "setHTTPMaximumConnectionsPerHost:",  1LL),  -[NSURLSessionConfiguration setAllowsCellularAccess:](v15, "setAllowsCellularAccess:", !v5),  urlSession =  +[NSURLSession sessionWithConfiguration:]( &OBJC_CLASS___NSURLSession,  "sessionWithConfiguration:",  v15),  (self->_urlSession = urlSession) != 0LL))
      {
        v19[0] = _NSConcreteStackBlock;
        v19[1] = 3221225472LL;
        v19[2] = sub_1000459F0;
        v19[3] = &unk_1000D27B8;
        v19[4] = v9;
        v19[5] = &v20;
        -[NSURLSessionDataTask resume]( -[NSURLSession dataTaskWithRequest:completionHandler:]( urlSession,  "dataTaskWithRequest:completionHandler:",  v12,  v19),  "resume");
        dispatch_time_t v16 = dispatch_time(0LL, 80000000000LL);
        if (dispatch_semaphore_wait(v9, v16) >= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 134349056;
          uint64_t v25 = 0x4054000000000000LL;
          _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "[wifivelocity] FAILED to complete operation within %{public}.1fs, continuing",  buf,  0xCu);
        }

        -[NSURLSession resetWithCompletionHandler:](self->_urlSession, "resetWithCompletionHandler:", &stru_1000D27D8);
      }
    }
  }

  char v17 = *((_BYTE *)v21 + 24);
  _Block_object_dispose(&v20, 8);
  return v17;
}

- (id)completedTestCallback
{
  return self->_completedTestCallback;
}

- (id)pingCallback
{
  return self->_pingCallback;
}

@end
@interface WiFiManagerAnalytics
+ (id)sharedInstance;
- (BOOL)hasRegisteredWithDaemon;
- (OS_dispatch_queue)serialQ;
- (OS_dispatch_queue)wifiManagerQueue;
- (WAClient)waClient;
- (WiFiManagerAnalytics)init;
- (id)__copyHashOfSSID:(id)a3;
- (id)_initPrivate;
- (int)_getAssociationEventIDForEventTypeString:(id)a3;
- (void)_populateDPSAPInfoMessage:(__CFDictionary *)a3 andReply:(id)a4;
- (void)_populateDPSLinkStateChangeMessage:(id *)a3 andReply:(id)a4;
- (void)_populateDPSNotificationMessage:(__CFDictionary *)a3 andReply:(id)a4;
- (void)_populateDPSProbeResultMessage:(id *)a3 andReply:(id)a4;
- (void)_populateSlowWiFiNotificationMessage:(__CFDictionary *)a3 andReply:(id)a4;
- (void)_populateWiFiConnectionQualityMessageWithScorecard:(id)a3 andReply:(id)a4;
- (void)_register;
- (void)_runReplyBlock:(id)a3 withMessage:(id)a4 andError:(id)a5;
- (void)getDeviceAnalyticsConfigurationWithCompletion:(id)a3;
- (void)prepareMessageForSubmission:(unsigned int)a3 withData:(void *)a4 andReply:(id)a5;
- (void)setDeviceAnalyticsConfiguration:(id)a3;
- (void)setHasRegisteredWithDaemon:(BOOL)a3;
- (void)setSerialQ:(id)a3;
- (void)setWaClient:(id)a3;
- (void)setWiFiManagerQueue:(id)a3;
- (void)setWifiManagerQueue:(id)a3;
- (void)submitGeoServicesMessage:(id)a3;
- (void)submitWiFiAnalyticsMessage:(id)a3;
- (void)triggerDatapathDiagnosticsNoReply:(id)a3;
- (void)triggerDeviceAnalyticsStoreMigrationWithCompletion:(id)a3;
@end

@implementation WiFiManagerAnalytics

+ (id)sharedInstance
{
  if (qword_100219E50 != -1) {
    dispatch_once(&qword_100219E50, &stru_1001E5C28);
  }
  return (id)qword_100219E48;
}

- (void)_register
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[WAClient sharedClient](&OBJC_CLASS___WAClient, "sharedClient"));
  [v3 registerMessageGroup:2 andReply:&stru_1001E5C48];

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[WAClient sharedClient](&OBJC_CLASS___WAClient, "sharedClient"));
  [v4 registerMessageGroup:5 andReply:&stru_1001E5C68];

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[WAClient sharedClient](&OBJC_CLASS___WAClient, "sharedClient"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_10012A1F0;
  v6[3] = &unk_1001E5C90;
  v6[4] = self;
  [v5 registerMessageGroup:4 andReply:v6];
}

- (void)setWiFiManagerQueue:(id)a3
{
  v4 = (OS_dispatch_queue *)a3;
  v5 = objc_autoreleasePoolPush();
  if (qword_100219F60) {
    objc_msgSend( (id)qword_100219F60,  "WFLog:message:",  2,  "%s WiFiManagerQueue was set",  "-[WiFiManagerAnalytics setWiFiManagerQueue:]");
  }
  objc_autoreleasePoolPop(v5);
  wifiManagerQueue = self->_wifiManagerQueue;
  self->_wifiManagerQueue = v4;
}

- (void)submitWiFiAnalyticsMessage:(id)a3
{
  id v8 = a3;
  v4 = objc_autoreleasePoolPush();
  v5 = (void *)qword_100219F60;
  if (qword_100219F60)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue([v8 metricName]);
    [v5 WFLog:3, "%s Received call to submit WiFi Analytics message with (%@) value", "-[WiFiManagerAnalytics submitWiFiAnalyticsMessage:]", v6 message];
  }

  objc_autoreleasePoolPop(v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiManagerAnalytics waClient](self, "waClient"));
  [v7 submitWiFiAnalyticsMessageAdvanced:v8];
}

- (void)submitGeoServicesMessage:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiManagerAnalytics waClient](self, "waClient"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10012A44C;
  v7[3] = &unk_1001E5CB8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 submitMessage:v6 groupType:2 andReply:v7];
}

- (void)triggerDatapathDiagnosticsNoReply:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiManagerAnalytics waClient](self, "waClient"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10012A5C0;
  v7[3] = &unk_1001E5C90;
  id v8 = v4;
  id v6 = v4;
  [v5 triggerDatapathDiagnosticsAndCollectUpdates:0 waMessage:v6 andReply:v7];
}

- (void)setDeviceAnalyticsConfiguration:(id)a3
{
  id v4 = a3;
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiManagerAnalytics waClient](self, "waClient"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_10012A764;
  v6[3] = &unk_1001E5CE0;
  objc_copyWeak(&v7, &location);
  [v5 setDeviceAnalyticsConfiguration:v4 andReply:v6];

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

- (void)getDeviceAnalyticsConfigurationWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiManagerAnalytics waClient](self, "waClient"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10012A8A0;
  v7[3] = &unk_1001E5D08;
  id v8 = v4;
  id v6 = v4;
  [v5 getDeviceAnalyticsConfigurationAndReply:v7];
}

- (void)triggerDeviceAnalyticsStoreMigrationWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[WAClient sharedClient](&OBJC_CLASS___WAClient, "sharedClient"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10012AA30;
  v7[3] = &unk_1001E5D30;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 triggerDeviceAnalyticsStoreMigrationAndReply:v7];
}

- (void)_runReplyBlock:(id)a3 withMessage:(id)a4 andError:(id)a5
{
}

- (void)prepareMessageForSubmission:(unsigned int)a3 withData:(void *)a4 andReply:(id)a5
{
  uint64_t v6 = *(void *)&a3;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_10012AD88;
  v19[3] = &unk_1001E5D80;
  unsigned int v21 = a3;
  id v8 = a5;
  v19[4] = self;
  id v20 = v8;
  v9 = objc_retainBlock(v19);
  if ((_DWORD)v6)
  {
    wifiManagerQueue = self->_wifiManagerQueue;
    v11 = objc_autoreleasePoolPush();
    if (wifiManagerQueue)
    {
      if (qword_100219F60) {
        objc_msgSend( (id)qword_100219F60,  "WFLog:message:",  3,  "%s Received call to prepare message with identifier: 0x%x",  "-[WiFiManagerAnalytics prepareMessageForSubmission:withData:andReply:]",  v6);
      }
      objc_autoreleasePoolPop(v11);
      v12 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[WiFiManagerAnalytics serialQ](self, "serialQ"));
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_10012B044;
      block[3] = &unk_1001E5DA8;
      int v18 = v6;
      block[4] = self;
      v17 = a4;
      v16 = v9;
      dispatch_async(v12, block);
    }

    else
    {
      if (qword_100219F60) {
        objc_msgSend( (id)qword_100219F60,  "WFLog:message:",  4,  "Nobody set the _wifiManagerQueue, can't prepare metric with id: %u. Bailing",  v6);
      }
      objc_autoreleasePoolPop(v11);
    }
  }

  else
  {
    v13 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      objc_msgSend((id)qword_100219F60, "WFLog:message:", 4, "Zero(0) message identifier, bail.");
    }
    objc_autoreleasePoolPop(v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.wifi.analytics.errordomain",  9010LL,  0LL));
    (*((void (**)(id, void, void *))v8 + 2))(v8, 0LL, v14);
  }
}

- (WiFiManagerAnalytics)init
{
  id v2 = (id)objc_claimAutoreleasedReturnValue( +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  NSInternalInconsistencyException,  @"-[WAClient init] unavailable",  0LL));
  objc_exception_throw(v2);
  return (WiFiManagerAnalytics *)-[WiFiManagerAnalytics _initPrivate](v3, v4);
}

- (id)_initPrivate
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___WiFiManagerAnalytics;
  id v2 = -[WiFiManagerAnalytics init](&v10, "init");
  if (v2)
  {
    uint64_t v3 = objc_claimAutoreleasedReturnValue( +[WAClient sharedClientWithIdentifier:]( &OBJC_CLASS___WAClient,  "sharedClientWithIdentifier:",  @"wifid"));
    waClient = v2->_waClient;
    v2->_waClient = (WAClient *)v3;

    dispatch_queue_attr_t v5 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    uint64_t v6 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v5);
    dispatch_queue_t v7 = dispatch_queue_create("com.apple.wifid.wifimanageranalytics.serialQ", v6);
    serialQ = v2->_serialQ;
    v2->_serialQ = (OS_dispatch_queue *)v7;
  }

  return v2;
}

- (id)__copyHashOfSSID:(id)a3
{
  id v3 = a3;
  SEL v4 = objc_autoreleasePoolPush();
  dispatch_queue_attr_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[LSApplicationWorkspace defaultWorkspace](&OBJC_CLASS___LSApplicationWorkspace, "defaultWorkspace"));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 deviceIdentifierForVendor]);

  if (v6)
  {
    id v7 = objc_claimAutoreleasedReturnValue([v6 UUIDString]);
    id v8 = (const char *)[v7 cStringUsingEncoding:4];

    v9 = (const char *)[v3 cStringUsingEncoding:4];
    *(void *)&__int128 v10 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v10 + 1) = 0xAAAAAAAAAAAAAAAALL;
    macOut[0] = v10;
    macOut[1] = v10;
    size_t v11 = strlen(v8);
    size_t v12 = strlen(v9);
    CCHmac(2u, v8, v11, v9, v12, macOut);
    v13 = -[NSMutableString initWithCapacity:](objc_alloc(&OBJC_CLASS___NSMutableString), "initWithCapacity:", 64LL);
    for (uint64_t i = 0LL; i != 32; ++i)
      -[NSMutableString appendFormat:](v13, "appendFormat:", @"%02x", *((unsigned __int8 *)macOut + i));
  }

  else
  {
    v16 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      objc_msgSend( (id)qword_100219F60,  "WFLog:message:",  3,  "%s: failed to get deviceIdentifier",  "-[WiFiManagerAnalytics __copyHashOfSSID:]");
    }
    objc_autoreleasePoolPop(v16);
    v13 = 0LL;
  }

  objc_autoreleasePoolPop(v4);
  return v13;
}

- (void)_populateWiFiConnectionQualityMessageWithScorecard:(id)a3 andReply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void (**)(void, void, void))v7;
  if (v6 && v7)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[WAClient sharedClient](&OBJC_CLASS___WAClient, "sharedClient"));
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_10012B4E8;
    v11[3] = &unk_1001E5E98;
    id v12 = v6;
    v13 = self;
    v14 = v8;
    [v9 registerMessageGroup:2 andReply:v11];
  }

  else
  {
    __int128 v10 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      objc_msgSend( (id)qword_100219F60,  "WFLog:message:",  4,  "%s NULL SCORECARD, bail",  "-[WiFiManagerAnalytics _populateWiFiConnectionQualityMessageWithScorecard:andReply:]");
    }
    objc_autoreleasePoolPop(v10);
    v8[2](v8, 0LL, 0LL);
  }
}

- (int)_getAssociationEventIDForEventTypeString:(id)a3
{
  int v3 = 6;
  if (a3)
  {
    id v4 = a3;
    else {
      int v5 = 6;
    }
    else {
      int v6 = v5;
    }
    unsigned int v7 = [v4 isEqualToString:@"SSID CHANGED"];

    if (v7) {
      return 5;
    }
    else {
      return v6;
    }
  }

  return v3;
}

- (void)_populateDPSNotificationMessage:(__CFDictionary *)a3 andReply:(id)a4
{
  id v5 = a4;
  int v6 = (void *)objc_claimAutoreleasedReturnValue(+[WAClient sharedClient](&OBJC_CLASS___WAClient, "sharedClient"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_10012D204;
  v8[3] = &unk_1001E5EC0;
  id v9 = v5;
  __int128 v10 = a3;
  id v7 = v5;
  [v6 getNewMessageForKey:@"DPSN" groupType:4 andReply:v8];
}

- (void)_populateDPSProbeResultMessage:(id *)a3 andReply:(id)a4
{
  id v5 = a4;
  int v6 = (void *)objc_claimAutoreleasedReturnValue(+[WAClient sharedClient](&OBJC_CLASS___WAClient, "sharedClient"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_10012D528;
  v8[3] = &unk_1001E5EC0;
  id v9 = v5;
  __int128 v10 = a3;
  id v7 = v5;
  [v6 getNewMessageForKey:@"DPSAPS" groupType:4 andReply:v8];
}

- (void)_populateDPSLinkStateChangeMessage:(id *)a3 andReply:(id)a4
{
  id v5 = a4;
  int v6 = (void *)objc_claimAutoreleasedReturnValue(+[WAClient sharedClient](&OBJC_CLASS___WAClient, "sharedClient"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_10012D7A0;
  v8[3] = &unk_1001E5EC0;
  id v9 = v5;
  __int128 v10 = a3;
  id v7 = v5;
  [v6 getNewMessageForKey:@"WFAAWDWADAAD" groupType:4 andReply:v8];
}

- (void)_populateDPSAPInfoMessage:(__CFDictionary *)a3 andReply:(id)a4
{
  id v5 = a4;
  int v6 = (void *)objc_claimAutoreleasedReturnValue(+[WAClient sharedClient](&OBJC_CLASS___WAClient, "sharedClient"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_10012DA28;
  v8[3] = &unk_1001E5EC0;
  id v9 = v5;
  __int128 v10 = a3;
  id v7 = v5;
  [v6 getNewMessageForKey:@"WFAAWDWAAAPI" groupType:4 andReply:v8];
}

- (void)_populateSlowWiFiNotificationMessage:(__CFDictionary *)a3 andReply:(id)a4
{
  id v5 = a4;
  int v6 = (void *)objc_claimAutoreleasedReturnValue(+[WAClient sharedClient](&OBJC_CLASS___WAClient, "sharedClient"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_10012DCB8;
  v8[3] = &unk_1001E5EC0;
  id v9 = v5;
  __int128 v10 = a3;
  id v7 = v5;
  [v6 getNewMessageForKey:@"WFAAWDSWFN" groupType:4 andReply:v8];
}

- (OS_dispatch_queue)wifiManagerQueue
{
  return self->_wifiManagerQueue;
}

- (void)setWifiManagerQueue:(id)a3
{
}

- (WAClient)waClient
{
  return self->_waClient;
}

- (void)setWaClient:(id)a3
{
}

- (BOOL)hasRegisteredWithDaemon
{
  return self->_hasRegisteredWithDaemon;
}

- (void)setHasRegisteredWithDaemon:(BOOL)a3
{
  self->_hasRegisteredWithDaemon = a3;
}

- (OS_dispatch_queue)serialQ
{
  return self->_serialQ;
}

- (void)setSerialQ:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
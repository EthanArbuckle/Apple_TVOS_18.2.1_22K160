@interface WiFiUserNotificationManager
+ (BOOL)canRepromptForNotificationType:(int)a3 blacklistType:(int)a4 atDate:(id)a5 count:(unint64_t)a6;
+ (unint64_t)defaultThrottlingPeriodForBlacklistingType:(int)a3 count:(unint64_t)a4;
- (BOOL)enableTestMode;
- (BOOL)shouldTimeOutRecommendation;
- (BOOL)supportsWAPI;
- (CLLocation)lastRecommendationLocation;
- (NSMutableDictionary)notificationMapping;
- (NSMutableDictionary)recentNotifications;
- (NSString)visibleRequest;
- (OS_dispatch_queue)queue;
- (OS_dispatch_source)timeoutTimer;
- (UNUserNotificationCenter)userNotificationCenterWiFi;
- (WiFiUserNotificationHistory)notificationHistory;
- (WiFiUserNotificationManager)initWithQueue:(id)a3 supportsWAPI:(BOOL)a4;
- (id)callback;
- (int)deviceClass;
- (int)dispatchNotificationWithAskToJoinHotspotRecommendation:(id)a3;
- (int)dispatchNotificationWithRecommendation:(id)a3 currentLocation:(id)a4 force:(BOOL)a5;
- (unint64_t)timeoutPeriod;
- (void)_startTimerForNotificationWithUserInfo:(id)a3;
- (void)_submitAnalyticsEventForJoinAlertReason:(int)a3 action:(unint64_t)a4 visibleDuration:(double)a5;
- (void)_submitAnalyticsEventForRecommendation:(id)a3 action:(unint64_t)a4 visibleDuration:(double)a5 location:(id)a6;
- (void)_timeoutTimerDidFire:(id)a3;
- (void)callbackContext;
- (void)dealloc;
- (void)dismissJoinAlerts;
- (void)dispatchAccessoryJoinAlertForNetwork:(id)a3 unsecured:(BOOL)a4;
- (void)dispatchJoinAlertForNetwork:(id)a3 withProviderName:(id)a4 andReason:(int)a5;
- (void)dispatchLowDataModeAlertForNetwork:(id)a3 withReason:(int)a4;
- (void)dispatchNotificationWithColocatedScanResult:(id)a3 fromScanResult:(id)a4;
- (void)dispatchNotificationWithRandomMAC:(id)a3;
- (void)enableTestMode:(BOOL)a3;
- (void)registerCallback:(id)a3 withContext:(void *)a4;
- (void)reset;
- (void)setCallback:(id)a3;
- (void)setCallbackContext:(void *)a3;
- (void)setDeviceClass:(int)a3;
- (void)setEnableTestMode:(BOOL)a3;
- (void)setLastRecommendationLocation:(id)a3;
- (void)setNotificationHistory:(id)a3;
- (void)setNotificationMapping:(id)a3;
- (void)setQueue:(id)a3;
- (void)setRecentNotifications:(id)a3;
- (void)setShouldTimeOutRecommendation:(BOOL)a3;
- (void)setSupportsWAPI:(BOOL)a3;
- (void)setTimeoutPeriod:(unint64_t)a3;
- (void)setTimeoutTimer:(id)a3;
- (void)setUserNotificationCenterWiFi:(id)a3;
- (void)setVisibleRequest:(id)a3;
- (void)startListening;
- (void)userNotificationCenter:(id)a3 didReceiveNotificationResponse:(id)a4 withCompletionHandler:(id)a5;
@end

@implementation WiFiUserNotificationManager

- (WiFiUserNotificationManager)initWithQueue:(id)a3 supportsWAPI:(BOOL)a4
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___WiFiUserNotificationManager;
  v6 = -[WiFiUserNotificationManager init](&v10, "init");
  v7 = v6;
  if (v6)
  {
    v6->_queue = (OS_dispatch_queue *)a3;
    v6->_supportsWAPI = a4;
    v8 = -[UNUserNotificationCenter initWithBundleIdentifier:]( objc_alloc(&OBJC_CLASS___UNUserNotificationCenter),  "initWithBundleIdentifier:",  @"com.apple.wifid.usernotification");
    v7->_userNotificationCenterWiFi = v8;
    -[UNUserNotificationCenter setDelegate:](v8, "setDelegate:", v7);
    -[UNUserNotificationCenter requestAuthorizationWithOptions:completionHandler:]( v7->_userNotificationCenterWiFi,  "requestAuthorizationWithOptions:completionHandler:",  3LL,  &stru_1001E6358);
    -[UNUserNotificationCenter removeAllDeliveredNotifications]( v7->_userNotificationCenterWiFi,  "removeAllDeliveredNotifications");
    v7->_notificationMapping = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    v7->_recentNotifications = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    v7->_timeoutPeriod = 30LL;
    v7->_shouldTimeOutRecommendation = 1;
    v7->_deviceClass = MGGetSInt32Answer(@"DeviceClassNumber", 0LL);
    v7->_notificationHistory = objc_alloc_init(&OBJC_CLASS___WiFiUserNotificationHistory);
  }

  return v7;
}

- (void)dealloc
{
  id callback = self->_callback;
  if (callback) {
    _Block_release(callback);
  }

  timeoutTimer = self->_timeoutTimer;
  if (timeoutTimer) {
    dispatch_source_cancel((dispatch_source_t)timeoutTimer);
  }

  self->_queue = 0LL;
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___WiFiUserNotificationManager;
  -[WiFiUserNotificationManager dealloc](&v5, "dealloc");
}

- (void)startListening
{
  v2 = objc_autoreleasePoolPush();
  if (qword_100219F60) {
    [qword_100219F60 WFLog:@"%s: listening for user notifications" message:3];
  }
  objc_autoreleasePoolPop(v2);
}

+ (BOOL)canRepromptForNotificationType:(int)a3 blacklistType:(int)a4 atDate:(id)a5 count:(unint64_t)a6
{
  uint64_t v7 = *(void *)&a4;
  [a5 timeIntervalSinceNow:a3];
  return -v8 > (double)+[WiFiUserNotificationManager defaultThrottlingPeriodForBlacklistingType:count:]( &OBJC_CLASS___WiFiUserNotificationManager,  "defaultThrottlingPeriodForBlacklistingType:count:",  v7,  a6);
}

+ (unint64_t)defaultThrottlingPeriodForBlacklistingType:(int)a3 count:(unint64_t)a4
{
  unint64_t v4 = 86400LL;
  uint64_t v5 = 604800LL;
  if (a4 != 2) {
    uint64_t v5 = 2592000LL;
  }
  if (a4 >= 2) {
    unint64_t v4 = v5;
  }
  if (a3 == 1) {
    return 2592000LL;
  }
  else {
    return v4;
  }
}

- (void)userNotificationCenter:(id)a3 didReceiveNotificationResponse:(id)a4 withCompletionHandler:(id)a5
{
  if (self->_timeoutTimer)
  {
    double v8 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      [qword_100219F60 WFLog:@"%s: canceling timer" message:3];
    }
    objc_autoreleasePoolPop(v8);
    dispatch_source_cancel((dispatch_source_t)self->_timeoutTimer);
  }

  id v45 = [[[a4 notification:a3] request] identifier];
  id v9 = -[NSMutableDictionary objectForKey:]( -[WiFiUserNotificationManager notificationMapping](self, "notificationMapping"),  "objectForKey:",  v45);
  id v10 = [v9 objectForKey:@"SSID"];
  [ -[NSMutableDictionary objectForKey:] [ -[WiFiUserNotificationManager recentNotifications](self, "recentNotifications")  "objectForKey:" v10] "timeIntervalSinceNow"];
  double v12 = v11;
  id v13 = [a4 actionIdentifier];
  id v14 = objc_msgSend( objc_msgSend(objc_msgSend(objc_msgSend(a4, "notification"), "request"), "content"),  "categoryIdentifier");
  v15 = objc_autoreleasePoolPush();
  id v48 = v10;
  if (!v10)
  {
    if (qword_100219F60) {
      [(id)qword_100219F60 WFLog:4, "%s: ssid not found for notification (%@)", "-[WiFiUserNotificationManager userNotificationCenter:didReceiveNotificationResponse:withCompletionHandler:]", v45 message];
    }
    objc_autoreleasePoolPop(v15);
    uint64_t v26 = 0LL;
    uint64_t v25 = 0LL;
    id v22 = 0LL;
    goto LABEL_25;
  }

  double v16 = -v12;
  if (qword_100219F60) {
    [(id)qword_100219F60 WFLog:3, "%s: Handle action %@ for notification %@ (SSID: %@, category: %@) visibleDuration %f", "-[WiFiUserNotificationManager userNotificationCenter:didReceiveNotificationResponse:withCompletionHandler:]", v13, v45, v10, v14, *(void *)&v16 message];
  }
  objc_autoreleasePoolPop(v15);
  unsigned int v17 = [v14 isEqualToString:@"joinalert"];
  id v47 = a5;
  if ((v17 & 1) != 0)
  {
    int v18 = 0;
    int v19 = 0;
    uint64_t v20 = 2LL;
LABEL_16:
    uint64_t v46 = v20;
    goto LABEL_17;
  }

  if ([v14 isEqualToString:@"recommendation"])
  {
    int v19 = 0;
    int v18 = 1;
    uint64_t v20 = 1LL;
    goto LABEL_16;
  }

  if ([v14 isEqualToString:@"lowdatamodealert"])
  {
    int v18 = 0;
    int v19 = 0;
    uint64_t v20 = 3LL;
    goto LABEL_16;
  }

  if ([v14 isEqualToString:@"randommac"])
  {
    int v18 = 0;
    int v19 = 0;
    uint64_t v20 = 4LL;
    goto LABEL_16;
  }

  if ([v14 isEqualToString:@"colocatedssid"])
  {
    int v18 = 0;
    uint64_t v46 = 5LL;
    int v19 = 1;
  }

  else
  {
    if ([v14 isEqualToString:@"asktojoinpersonalhotspot"])
    {
      uint64_t v25 = 1LL;
      uint64_t v46 = 6LL;
      if ([v13 isEqualToString:@"join"])
      {
        id v27 = v10;
        id v22 = v10;
        uint64_t v26 = 6LL;
        goto LABEL_37;
      }

      int v19 = 0;
      int v18 = 0;
      goto LABEL_27;
    }

    v36 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      [(id)qword_100219F60 WFLog:4, "%s: unknown notificationType for category %@", "-[WiFiUserNotificationManager userNotificationCenter:didReceiveNotificationResponse:withCompletionHandler:]", v14 message];
    }
    objc_autoreleasePoolPop(v36);
    int v18 = 0;
    int v19 = 0;
    uint64_t v46 = 0LL;
  }

- (int)dispatchNotificationWithRecommendation:(id)a3 currentLocation:(id)a4 force:(BOOL)a5
{
  if (a3)
  {
    BOOL v5 = a5;
    unsigned int v9 = -[WiFiUserNotificationHistory canPresentRecommendationForSSID:currentLocation:]( -[WiFiUserNotificationManager notificationHistory](self, "notificationHistory"),  "canPresentRecommendationForSSID:currentLocation:",  [a3 SSID],  a4);
    int v10 = v9;
    if (!v5 && v9)
    {
      double v11 = objc_autoreleasePoolPush();
      if (qword_100219F60) {
        [qword_100219F60 WFLog:3, "%s: unable to dispatch recommendation for %@, reason: %@", "-[WiFiUserNotificationManager dispatchNotificationWithRecommendation:currentLocation:force:]", [a3 SSID], sub_10008FA54(v10) message];
      }
      objc_autoreleasePoolPop(v11);
      if (v10 == 2) {
        -[WiFiUserNotificationHistory resetAttemptsForSSID:]( -[WiFiUserNotificationManager notificationHistory](self, "notificationHistory"),  "resetAttemptsForSSID:",  [a3 SSID]);
      }
      return v10;
    }

    if (v5)
    {
      id v13 = objc_autoreleasePoolPush();
      if (qword_100219F60) {
        [(id)qword_100219F60 WFLog:3, "%s: forcing notification for %@", "-[WiFiUserNotificationManager dispatchNotificationWithRecommendation:currentLocation:force:]", a3 message];
      }
      objc_autoreleasePoolPop(v13);
      int v10 = 0;
    }

    if (-[WiFiUserNotificationManager visibleRequest](self, "visibleRequest"))
    {
      v31[0] = _NSConcreteStackBlock;
      v31[1] = 3221225472LL;
      v31[2] = sub_1001361B8;
      v31[3] = &unk_1001E63D0;
      v31[4] = self;
      v31[5] = a3;
      v31[6] = a4;
      BOOL v32 = v5;
      -[UNUserNotificationCenter getDeliveredNotificationsWithCompletionHandler:]( -[WiFiUserNotificationManager userNotificationCenterWiFi](self, "userNotificationCenterWiFi"),  "getDeliveredNotificationsWithCompletionHandler:",  v31);
      return v10;
    }

    if (objc_msgSend(objc_msgSend(a3, "network"), "source") == (id)2) {
      unsigned __int8 v14 = -[WiFiUserNotificationManager shouldTimeOutRecommendation](self, "shouldTimeOutRecommendation");
    }
    else {
      unsigned __int8 v14 = 0;
    }
    v15 = -[NSUUID UUIDString](+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"), "UUIDString");
    double v16 = objc_alloc_init(&OBJC_CLASS___UNMutableNotificationContent);
    if (self->_supportsWAPI) {
      unsigned int v17 = @"WIFI_RECOMMENDATION_TITLE_CH";
    }
    else {
      unsigned int v17 = @"WIFI_RECOMMENDATION_TITLE";
    }
    -[UNMutableNotificationContent setTitle:](v16, "setTitle:", sub_10012FD94((uint64_t)v17));
    if (objc_msgSend(objc_msgSend(a3, "network"), "source") == (id)1) {
      int v18 = @"WIFI_RECOMMENDATION_BODY_WALLET";
    }
    else {
      int v18 = @"WIFI_RECOMMENDATION_BODY";
    }
    int v19 = +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  sub_10012FD94((uint64_t)v18),  objc_msgSend(objc_msgSend(a3, "network"), "SSID"));
    if (!self->_enableTestMode) {
      goto LABEL_32;
    }
    id v20 = objc_msgSend(objc_msgSend(a3, "network"), "source");
    id v21 = [a3 network];
    if (v20 == (id)2)
    {
      id v22 = -[NSString stringByAppendingFormat:]( v19,  "stringByAppendingFormat:",  @"\nSource: 3Bars\nScore: %lu\nAccessPoints: %lu\nBSSID: %@",  objc_msgSend(objc_msgSend(v21, "popularityScore"), "score"),  objc_msgSend(objc_msgSend(objc_msgSend(a3, "network"), "accessPoints"), "count"),  objc_msgSend(objc_msgSend(a3, "scannedNetwork"), "BSSID"));
    }

    else
    {
      if ([v21 source] != (id)1)
      {
LABEL_32:
        -[UNMutableNotificationContent setBody:](v16, "setBody:", v19);
        -[UNMutableNotificationContent setCategoryIdentifier:](v16, "setCategoryIdentifier:", @"recommendation");
        -[UNMutableNotificationContent setShouldSuppressDefaultAction:](v16, "setShouldSuppressDefaultAction:", 1LL);
        v30[0] = 0LL;
        v30[1] = v30;
        v30[2] = 0x3052000000LL;
        v30[3] = sub_100136334;
        v30[4] = sub_100136344;
        v30[5] = self;
        v28[0] = _NSConcreteStackBlock;
        v28[1] = 3221225472LL;
        v28[2] = sub_100136350;
        v28[3] = &unk_1001E63F8;
        unsigned __int8 v29 = v14;
        v28[4] = v15;
        v28[5] = a3;
        v28[6] = a4;
        v28[7] = v30;
        -[UNUserNotificationCenter addNotificationRequest:withCompletionHandler:]( -[WiFiUserNotificationManager userNotificationCenterWiFi](self, "userNotificationCenterWiFi"),  "addNotificationRequest:withCompletionHandler:",  +[UNNotificationRequest requestWithIdentifier:content:trigger:destinations:]( &OBJC_CLASS___UNNotificationRequest,  "requestWithIdentifier:content:trigger:destinations:",  v15,  v16,  0LL,  5LL),  v28);
        id v23 = +[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary");
        v24 = v23;
        if (a4) {
          [v23 setObject:a4 forKey:@"Location"];
        }
        [v24 setObject:a3 forKey:@"Recommendation"];
        objc_msgSend(v24, "setObject:forKey:", objc_msgSend(a3, "SSID"), @"SSID");
        -[NSMutableDictionary setObject:forKey:]( -[WiFiUserNotificationManager notificationMapping](self, "notificationMapping"),  "setObject:forKey:",  v24,  v15);
        -[WiFiUserNotificationHistory presentedNotificationForSSID:type:currentLocation:]( -[WiFiUserNotificationManager notificationHistory](self, "notificationHistory"),  "presentedNotificationForSSID:type:currentLocation:",  [a3 SSID],  1,  a4);
        -[WiFiUserNotificationManager setLastRecommendationLocation:](self, "setLastRecommendationLocation:", a4);
        if (v16) {
          CFRelease(v16);
        }
        _Block_object_dispose(v30, 8);
        return v10;
      }

      id v22 = -[NSString stringByAppendingFormat:]( v19,  "stringByAppendingFormat:",  @"\nSource: Wallet\nIdentifier: %@",  objc_msgSend(objc_msgSend(a3, "network"), "uniqueIdentifier"),  v26,  v27);
    }

    int v19 = v22;
    goto LABEL_32;
  }

  double v12 = objc_autoreleasePoolPush();
  if (qword_100219F60) {
    [qword_100219F60 WFLog:@"%s: nil recommendation" message:4 "-[WiFiUserNotificationManager dispatchNotificationWithRecommendation:currentLocation:force:]"];
  }
  objc_autoreleasePoolPop(v12);
  return 1;
}

- (void)dispatchNotificationWithRandomMAC:(id)a3
{
  if (a3)
  {
    if (-[WiFiUserNotificationManager visibleRequest](self, "visibleRequest"))
    {
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472LL;
      v14[2] = sub_1001367C4;
      v14[3] = &unk_1001E6420;
      v14[4] = self;
      v14[5] = a3;
      -[UNUserNotificationCenter getDeliveredNotificationsWithCompletionHandler:]( -[WiFiUserNotificationManager userNotificationCenterWiFi](self, "userNotificationCenterWiFi"),  "getDeliveredNotificationsWithCompletionHandler:",  v14);
    }

    else
    {
      v6 = -[NSUUID UUIDString](+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"), "UUIDString");
      uint64_t v7 = objc_alloc_init(&OBJC_CLASS___UNMutableNotificationContent);
      if (self->_supportsWAPI) {
        double v8 = @"WIFI_RANDOM_MAC_TITLE_CH";
      }
      else {
        double v8 = @"WIFI_RANDOM_MAC_TITLE";
      }
      unsigned int v9 = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", sub_10012FD94((uint64_t)v8), a3);
      id v10 = sub_10012FD94((uint64_t)@"WIFI_RANDOM_MAC_BODY");
      -[UNMutableNotificationContent setTitle:](v7, "setTitle:", v9);
      -[UNMutableNotificationContent setBody:](v7, "setBody:", v10);
      -[UNMutableNotificationContent setCategoryIdentifier:](v7, "setCategoryIdentifier:", @"randommac");
      -[UNMutableNotificationContent setShouldSuppressDefaultAction:](v7, "setShouldSuppressDefaultAction:", 1LL);
      v13[0] = 0LL;
      v13[1] = v13;
      v13[2] = 0x3052000000LL;
      v13[3] = sub_100136334;
      v13[4] = sub_100136344;
      v13[5] = self;
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472LL;
      v12[2] = sub_1001368AC;
      v12[3] = &unk_1001E6448;
      v12[4] = v6;
      v12[5] = v13;
      -[UNUserNotificationCenter addNotificationRequest:withCompletionHandler:]( -[WiFiUserNotificationManager userNotificationCenterWiFi](self, "userNotificationCenterWiFi"),  "addNotificationRequest:withCompletionHandler:",  +[UNNotificationRequest requestWithIdentifier:content:trigger:destinations:]( &OBJC_CLASS___UNNotificationRequest,  "requestWithIdentifier:content:trigger:destinations:",  v6,  v7,  0LL,  1LL),  v12);
      double v11 = -[WiFiUserNotificationManager notificationMapping](self, "notificationMapping");
      v15 = @"SSID";
      id v16 = a3;
      -[NSMutableDictionary setObject:forKey:]( v11,  "setObject:forKey:",  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v16,  &v15,  1LL),  v6);
      -[NSMutableDictionary setObject:forKey:]( -[WiFiUserNotificationManager recentNotifications](self, "recentNotifications"),  "setObject:forKey:",  +[NSDate date](&OBJC_CLASS___NSDate, "date"),  a3);
      if (v7) {
        CFRelease(v7);
      }
      _Block_object_dispose(v13, 8);
    }
  }

  else
  {
    BOOL v5 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      [qword_100219F60 WFLog:@"%s: nil ssid" message:4 "-[WiFiUserNotificationManager dispatchNotificationWithRandomMAC:]"];
    }
    objc_autoreleasePoolPop(v5);
  }

- (void)dispatchAccessoryJoinAlertForNetwork:(id)a3 unsecured:(BOOL)a4
{
  if (a4) {
    uint64_t v4 = 7LL;
  }
  else {
    uint64_t v4 = 6LL;
  }
  -[WiFiUserNotificationManager dispatchJoinAlertForNetwork:withProviderName:andReason:]( self,  "dispatchJoinAlertForNetwork:withProviderName:andReason:",  a3,  0LL,  v4);
}

- (void)dispatchJoinAlertForNetwork:(id)a3 withProviderName:(id)a4 andReason:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  unsigned int v9 = objc_autoreleasePoolPush();
  if (a3)
  {
    if (qword_100219F60) {
      [(id)qword_100219F60 WFLog:3, "%s: ssid='%@' provider='%@'", "-[WiFiUserNotificationManager dispatchJoinAlertForNetwork:withProviderName:andReason:]", a3, a4 message];
    }
    objc_autoreleasePoolPop(v9);
    if (-[WiFiUserNotificationManager visibleRequest](self, "visibleRequest"))
    {
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472LL;
      v21[2] = sub_100136DA4;
      v21[3] = &unk_1001E6498;
      v21[4] = self;
      v21[5] = a3;
      v21[6] = a4;
      int v22 = v5;
      -[UNUserNotificationCenter getDeliveredNotificationsWithCompletionHandler:]( -[WiFiUserNotificationManager userNotificationCenterWiFi](self, "userNotificationCenterWiFi"),  "getDeliveredNotificationsWithCompletionHandler:",  v21);
    }

    else
    {
      id v10 = -[NSUUID UUIDString](+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"), "UUIDString");
      double v11 = objc_alloc_init(&OBJC_CLASS___UNMutableNotificationContent);
      if ((v5 & 0xFFFFFFFE) == 6)
      {
        if ((_DWORD)v5 == 7) {
          double v12 = @"WIFI_ACCESSORY_JOIN_ALERT_JOINED_WIFI_NETWORK_TITLE_UNSECURED";
        }
        else {
          double v12 = @"WIFI_ACCESSORY_JOIN_ALERT_JOINED_WIFI_NETWORK_TITLE";
        }
        id v13 = (NSString *)sub_10012FD94((uint64_t)v12);
        unsigned __int8 v14 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  sub_10012FD94((uint64_t)@"WIFI_ACCESSORY_JOIN_ALERT_JOINED_NETWORK_BODY"),  a3);
      }

      else
      {
        if (self->_supportsWAPI) {
          v15 = @"WIFI_JOIN_ALERT_JOINED_WIFI_NETWORK_TITLE_CH";
        }
        else {
          v15 = @"WIFI_JOIN_ALERT_JOINED_WIFI_NETWORK_TITLE";
        }
        id v13 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  sub_10012FD94((uint64_t)v15),  a3);
        if (a4)
        {
          if (self->_supportsWAPI) {
            id v16 = @"WIFI_JOIN_ALERT_JOINED_PROVIDED_NETWORK_BODY_CH";
          }
          else {
            id v16 = @"WIFI_JOIN_ALERT_JOINED_PROVIDED_NETWORK_BODY";
          }
          unsigned __int8 v14 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  sub_10012FD94((uint64_t)v16),  a4);
        }

        else
        {
          unsigned __int8 v14 = (NSString *)sub_10012FD94((uint64_t)@"WIFI_JOIN_ALERT_JOINED_NETWORK_BODY");
        }
      }

      unsigned int v17 = v14;
      if ((_DWORD)v5 == 6) {
        -[UNMutableNotificationContent setShouldIgnoreDoNotDisturb:](v11, "setShouldIgnoreDoNotDisturb:", 1LL);
      }
      -[UNMutableNotificationContent setTitle:](v11, "setTitle:", v13);
      -[UNMutableNotificationContent setBody:](v11, "setBody:", v17);
      -[UNMutableNotificationContent setShouldSuppressDefaultAction:](v11, "setShouldSuppressDefaultAction:", 1LL);
      -[UNMutableNotificationContent setCategoryIdentifier:](v11, "setCategoryIdentifier:", @"joinalert");
      v20[0] = 0LL;
      v20[1] = v20;
      v20[2] = 0x3052000000LL;
      v20[3] = sub_100136334;
      v20[4] = sub_100136344;
      v20[5] = self;
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472LL;
      v19[2] = sub_100136EA4;
      v19[3] = &unk_1001E6448;
      v19[4] = v10;
      v19[5] = v20;
      -[UNUserNotificationCenter addNotificationRequest:withCompletionHandler:]( -[WiFiUserNotificationManager userNotificationCenterWiFi](self, "userNotificationCenterWiFi"),  "addNotificationRequest:withCompletionHandler:",  +[UNNotificationRequest requestWithIdentifier:content:trigger:destinations:]( &OBJC_CLASS___UNNotificationRequest,  "requestWithIdentifier:content:trigger:destinations:",  v10,  v11,  0LL,  1LL),  v19);
      int v18 = -[WiFiUserNotificationManager notificationMapping](self, "notificationMapping");
      v23[0] = @"SSID";
      v23[1] = @"Reason";
      v24[0] = a3;
      v24[1] = +[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v5);
      -[NSMutableDictionary setObject:forKey:]( v18,  "setObject:forKey:",  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v24,  v23,  2LL),  v10);
      -[NSMutableDictionary setObject:forKey:]( -[WiFiUserNotificationManager recentNotifications](self, "recentNotifications"),  "setObject:forKey:",  +[NSDate date](&OBJC_CLASS___NSDate, "date"),  a3);
      if (v11) {
        CFRelease(v11);
      }
      _Block_object_dispose(v20, 8);
    }
  }

  else
  {
    if (qword_100219F60) {
      [qword_100219F60 WFLog:@"%s: nil ssid" message:4 "-[WiFiUserNotificationManager dispatchJoinAlertForNetwork:withProviderName:andReason:]"];
    }
    objc_autoreleasePoolPop(v9);
  }

- (void)dispatchLowDataModeAlertForNetwork:(id)a3 withReason:(int)a4
{
  if (a3)
  {
    uint64_t v4 = *(void *)&a4;
    if (-[WiFiUserNotificationManager visibleRequest](self, "visibleRequest"))
    {
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472LL;
      v17[2] = sub_100137340;
      v17[3] = &unk_1001E64C0;
      v17[4] = self;
      v17[5] = a3;
      int v18 = v4;
      -[UNUserNotificationCenter getDeliveredNotificationsWithCompletionHandler:]( -[WiFiUserNotificationManager userNotificationCenterWiFi](self, "userNotificationCenterWiFi"),  "getDeliveredNotificationsWithCompletionHandler:",  v17);
    }

    else
    {
      if (-[NSMutableDictionary objectForKey:]( -[WiFiUserNotificationManager recentNotifications](self, "recentNotifications"),  "objectForKey:",  a3))
      {
        double v8 = objc_autoreleasePoolPush();
        if (qword_100219F60) {
          [(id)qword_100219F60 WFLog:3, "%s: showing the notification again for %@", "-[WiFiUserNotificationManager dispatchLowDataModeAlertForNetwork:withReason:]", a3 message];
        }
        objc_autoreleasePoolPop(v8);
        -[NSMutableDictionary removeObjectForKey:]( -[WiFiUserNotificationManager recentNotifications](self, "recentNotifications"),  "removeObjectForKey:",  a3);
      }

      unsigned int v9 = -[NSUUID UUIDString](+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"), "UUIDString");
      id v10 = objc_alloc_init(&OBJC_CLASS___UNMutableNotificationContent);
      id v11 = sub_10012FD94((uint64_t)@"WIFI_LOW_DATA_MODE_ALERT_JOINED_NETWORK_TITLE");
      if (-[WiFiUserNotificationManager deviceClass](self, "deviceClass") == 1)
      {
        double v12 = @"WIFI_LOW_DATA_MODE_ALERT_JOINED_NETWORK_BODY_IPHONE";
      }

      else if (-[WiFiUserNotificationManager deviceClass](self, "deviceClass") == 3)
      {
        double v12 = @"WIFI_LOW_DATA_MODE_ALERT_JOINED_NETWORK_BODY_IPAD";
      }

      else if (-[WiFiUserNotificationManager deviceClass](self, "deviceClass") == 2)
      {
        double v12 = @"WIFI_LOW_DATA_MODE_ALERT_JOINED_NETWORK_BODY_IPOD";
      }

      else
      {
        double v12 = @"WIFI_LOW_DATA_MODE_ALERT_JOINED_NETWORK_BODY";
      }

      id v13 = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", sub_10012FD94((uint64_t)v12), a3);
      -[UNMutableNotificationContent setTitle:](v10, "setTitle:", v11);
      -[UNMutableNotificationContent setBody:](v10, "setBody:", v13);
      -[UNMutableNotificationContent setShouldSuppressDefaultAction:](v10, "setShouldSuppressDefaultAction:", 1LL);
      -[UNMutableNotificationContent setCategoryIdentifier:](v10, "setCategoryIdentifier:", @"lowdatamodealert");
      v16[0] = 0LL;
      v16[1] = v16;
      v16[2] = 0x3052000000LL;
      v16[3] = sub_100136334;
      v16[4] = sub_100136344;
      v16[5] = self;
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472LL;
      v15[2] = sub_100137434;
      v15[3] = &unk_1001E6448;
      v15[4] = v9;
      v15[5] = v16;
      -[UNUserNotificationCenter addNotificationRequest:withCompletionHandler:]( -[WiFiUserNotificationManager userNotificationCenterWiFi](self, "userNotificationCenterWiFi"),  "addNotificationRequest:withCompletionHandler:",  +[UNNotificationRequest requestWithIdentifier:content:trigger:destinations:]( &OBJC_CLASS___UNNotificationRequest,  "requestWithIdentifier:content:trigger:destinations:",  v9,  v10,  0LL,  1LL),  v15);
      unsigned __int8 v14 = -[WiFiUserNotificationManager notificationMapping](self, "notificationMapping");
      v19[0] = @"SSID";
      v19[1] = @"Reason";
      v20[0] = a3;
      v20[1] = +[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v4);
      -[NSMutableDictionary setObject:forKey:]( v14,  "setObject:forKey:",  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v20,  v19,  2LL),  v9);
      -[NSMutableDictionary setObject:forKey:]( -[WiFiUserNotificationManager recentNotifications](self, "recentNotifications"),  "setObject:forKey:",  +[NSDate date](&OBJC_CLASS___NSDate, "date"),  a3);
      if (v10) {
        CFRelease(v10);
      }
      _Block_object_dispose(v16, 8);
    }
  }

  else
  {
    uint64_t v7 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      [qword_100219F60 WFLog:@"%s: nil ssid" message:4 "-[WiFiUserNotificationManager dispatchLowDataModeAlertForNetwork:withReason:]"];
    }
    objc_autoreleasePoolPop(v7);
  }

- (void)dispatchNotificationWithColocatedScanResult:(id)a3 fromScanResult:(id)a4
{
  if (![a3 networkName])
  {
    uint64_t v7 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      [qword_100219F60 WFLog:@"%s: nil toScanResult.networkName" message:4 "-[WiFiUserNotificationManager dispatchNotificationWithColocatedScanResult:fromScanResult:]"];
    }
    goto LABEL_9;
  }

  if (![a4 networkName])
  {
    uint64_t v7 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      [qword_100219F60 WFLog:@"%s: nil fromScanResult.networkName" message:4 "-[WiFiUserNotificationManager dispatchNotificationWithColocatedScanResult:fromScanResult:]"];
    }
LABEL_9:
    objc_autoreleasePoolPop(v7);
    return;
  }

  if (-[WiFiUserNotificationManager visibleRequest](self, "visibleRequest"))
  {
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472LL;
    void v23[2] = sub_100137A40;
    v23[3] = &unk_1001E64E8;
    v23[4] = self;
    v23[5] = a3;
    v23[6] = a4;
    -[UNUserNotificationCenter getDeliveredNotificationsWithCompletionHandler:]( -[WiFiUserNotificationManager userNotificationCenterWiFi](self, "userNotificationCenterWiFi"),  "getDeliveredNotificationsWithCompletionHandler:",  v23);
    return;
  }

  double v8 = -[NSUUID UUIDString](+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"), "UUIDString");
  unsigned int v9 = objc_alloc_init(&OBJC_CLASS___UNMutableNotificationContent);
  if (self->_supportsWAPI) {
    id v10 = @"WIFI_COLOCATED_SSID_TITLE_CH";
  }
  else {
    id v10 = @"WIFI_COLOCATED_SSID_TITLE";
  }
  if (self->_supportsWAPI) {
    id v11 = @"WIFI_COLOCATED_SSID_BODY_CH";
  }
  else {
    id v11 = @"WIFI_COLOCATED_SSID_BODY";
  }
  double v12 = +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  sub_10012FD94((uint64_t)v10),  [a3 networkName]);
  id v13 = +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  sub_10012FD94((uint64_t)v11),  [a3 networkName]);
  if (os_variant_has_internal_content("com.apple.WiFiManager"))
  {
    unsigned __int8 v14 = -[NSUserDefaults objectForKey:]( +[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"),  "objectForKey:",  @"ColocatedSSIDNotificationTitleOverride");
    if (v14) {
      double v12 = v14;
    }
    v15 = -[NSUserDefaults objectForKey:]( +[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"),  "objectForKey:",  @"ColocatedSSIDNotificationBodyOverride");
    if (v15) {
      id v13 = v15;
    }
  }

  -[UNMutableNotificationContent setTitle:](v9, "setTitle:", v12);
  -[UNMutableNotificationContent setBody:](v9, "setBody:", v13);
  -[UNMutableNotificationContent setShouldSuppressDefaultAction:](v9, "setShouldSuppressDefaultAction:", 1LL);
  -[UNMutableNotificationContent setCategoryIdentifier:](v9, "setCategoryIdentifier:", @"colocatedssid");
  id v16 = +[UNNotificationRequest requestWithIdentifier:content:trigger:destinations:]( &OBJC_CLASS___UNNotificationRequest,  "requestWithIdentifier:content:trigger:destinations:",  v8,  v9,  0LL,  1LL);
  unsigned int v17 = -[WiFiUserNotificationManager notificationMapping](self, "notificationMapping");
  v24[0] = @"SSID";
  v25[0] = [a3 networkName];
  v24[1] = @"ToScanResult";
  v25[1] = [a3 scanRecord];
  void v24[2] = @"FromScanResult";
  v25[2] = [a4 scanRecord];
  -[NSMutableDictionary setObject:forKey:]( v17,  "setObject:forKey:",  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v25,  v24,  3LL),  v8);
  -[NSMutableDictionary setObject:forKey:]( -[WiFiUserNotificationManager recentNotifications](self, "recentNotifications"),  "setObject:forKey:",  +[NSDate date](NSDate, "date"),  [a3 networkName]);
  if (!os_variant_has_internal_content("com.apple.WiFiManager")
    || (id v18 = -[NSUserDefaults objectForKey:]( +[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"),  "objectForKey:",  @"ColocatedSSIDNotificationTestAction")) == 0LL)
  {
    v21[0] = 0LL;
    v21[1] = v21;
    v21[2] = 0x3052000000LL;
    v21[3] = sub_100136334;
    v21[4] = sub_100136344;
    v21[5] = self;
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472LL;
    void v20[2] = sub_100137B94;
    v20[3] = &unk_1001E6448;
    v20[4] = v8;
    v20[5] = v21;
    -[UNUserNotificationCenter addNotificationRequest:withCompletionHandler:]( -[WiFiUserNotificationManager userNotificationCenterWiFi](self, "userNotificationCenterWiFi"),  "addNotificationRequest:withCompletionHandler:",  v16,  v20);
    _Block_object_dispose(v21, 8);
    if (!v9) {
      return;
    }
    goto LABEL_28;
  }

  int v19 = objc_autoreleasePoolPush();
  if (qword_100219F60) {
    [(id)qword_100219F60 WFLog:3, "%s: Will invoke -[UNUserNotificationCenter didReceiveNotificationResponse:withCompletionHandler:] with test action %@", "-[WiFiUserNotificationManager dispatchNotificationWithColocatedScanResult:fromScanResult:]", v18 message];
  }
  objc_autoreleasePoolPop(v19);
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472LL;
  v22[2] = sub_100137B34;
  v22[3] = &unk_1001E2AF0;
  v22[4] = v18;
  -[WiFiUserNotificationManager userNotificationCenter:didReceiveNotificationResponse:withCompletionHandler:]( self,  "userNotificationCenter:didReceiveNotificationResponse:withCompletionHandler:",  -[WiFiUserNotificationManager userNotificationCenterWiFi](self, "userNotificationCenterWiFi"),  +[UNNotificationResponse responseWithNotification:actionIdentifier:]( &OBJC_CLASS___UNNotificationResponse,  "responseWithNotification:actionIdentifier:",  +[UNNotification notificationWithRequest:date:sourceIdentifier:intentIdentifiers:]( &OBJC_CLASS___UNNotification,  "notificationWithRequest:date:sourceIdentifier:intentIdentifiers:",  v16,  +[NSDate date](&OBJC_CLASS___NSDate, "date"),  &stru_1001EB6E0,  &__NSArray0__struct),  v18),  v22);
  if (v9) {
LABEL_28:
  }
    CFRelease(v9);
}

- (int)dispatchNotificationWithAskToJoinHotspotRecommendation:(id)a3
{
  if (a3)
  {
    if (-[WiFiUserNotificationManager visibleRequest](self, "visibleRequest"))
    {
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472LL;
      v14[2] = sub_100137F40;
      v14[3] = &unk_1001E6510;
      v14[4] = self;
      -[UNUserNotificationCenter getDeliveredNotificationsWithCompletionHandler:]( -[WiFiUserNotificationManager userNotificationCenterWiFi](self, "userNotificationCenterWiFi"),  "getDeliveredNotificationsWithCompletionHandler:",  v14);
      return 5;
    }

    else
    {
      unsigned __int8 v7 = -[WiFiUserNotificationManager shouldTimeOutRecommendation](self, "shouldTimeOutRecommendation");
      double v8 = -[NSUUID UUIDString](+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"), "UUIDString");
      unsigned int v9 = objc_alloc_init(&OBJC_CLASS___UNMutableNotificationContent);
      -[UNMutableNotificationContent setTitle:]( v9,  "setTitle:",  sub_10012FD94((uint64_t)@"PERSONAL_HOTSPOT_NEARBY_BANNER_TITLE"));
      -[UNMutableNotificationContent setBody:]( v9,  "setBody:",  +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  sub_10012FD94((uint64_t)@"PERSONAL_HOTSPOT_NEARBY_BANNER_BODY"),  a3));
      -[UNMutableNotificationContent setCategoryIdentifier:]( v9,  "setCategoryIdentifier:",  @"asktojoinpersonalhotspot");
      -[UNMutableNotificationContent setShouldSuppressDefaultAction:](v9, "setShouldSuppressDefaultAction:", 1LL);
      -[UNMutableNotificationContent setIcon:]( v9,  "setIcon:",  +[UNNotificationIcon iconNamed:](&OBJC_CLASS___UNNotificationIcon, "iconNamed:", @"personal-hotspot"));
      v13[0] = 0LL;
      v13[1] = v13;
      v13[2] = 0x3052000000LL;
      v13[3] = sub_100136334;
      v13[4] = sub_100136344;
      v13[5] = self;
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472LL;
      v11[2] = sub_100138024;
      v11[3] = &unk_1001E6538;
      v11[5] = a3;
      v11[6] = v13;
      unsigned __int8 v12 = v7;
      v11[4] = v8;
      -[UNUserNotificationCenter addNotificationRequest:withCompletionHandler:]( -[WiFiUserNotificationManager userNotificationCenterWiFi](self, "userNotificationCenterWiFi"),  "addNotificationRequest:withCompletionHandler:",  +[UNNotificationRequest requestWithIdentifier:content:trigger:destinations:]( &OBJC_CLASS___UNNotificationRequest,  "requestWithIdentifier:content:trigger:destinations:",  v8,  v9,  0LL,  1LL),  v11);
      id v10 = +[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary");
      [v10 setObject:a3 forKey:@"SSID"];
      [v10 setObject:&off_100205400 forKey:@"type"];
      -[NSMutableDictionary setObject:forKey:]( -[WiFiUserNotificationManager notificationMapping](self, "notificationMapping"),  "setObject:forKey:",  v10,  v8);
      -[NSMutableDictionary setObject:forKey:]( -[WiFiUserNotificationManager recentNotifications](self, "recentNotifications"),  "setObject:forKey:",  +[NSDate date](&OBJC_CLASS___NSDate, "date"),  a3);
      if (v9) {
        CFRelease(v9);
      }
      _Block_object_dispose(v13, 8);
      return 0;
    }
  }

  else
  {
    v6 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      [qword_100219F60 WFLog:@"%s: nil SSID" message:4 "-[WiFiUserNotificationManager dispatchNotificationWithAskToJoinHotspotRecommendation:]"];
    }
    objc_autoreleasePoolPop(v6);
    return 1;
  }

- (void)registerCallback:(id)a3 withContext:(void *)a4
{
}

- (void)dismissJoinAlerts
{
  if (-[WiFiUserNotificationManager visibleRequest](self, "visibleRequest"))
  {
    -[UNUserNotificationCenter removeAllDeliveredNotifications]( -[WiFiUserNotificationManager userNotificationCenterWiFi](self, "userNotificationCenterWiFi"),  "removeAllDeliveredNotifications");
    id v3 = -[NSMutableDictionary objectForKey:]( -[WiFiUserNotificationManager notificationMapping](self, "notificationMapping"),  "objectForKey:",  -[WiFiUserNotificationManager visibleRequest](self, "visibleRequest"));
    if (v3)
    {
      uint64_t v4 = v3;
      id v5 = [v3 objectForKey:@"type"];
      if (v5)
      {
        unsigned int v6 = [v5 integerValue];
        id v7 = [v4 objectForKey:@"SSID"];
        if (v6 == 6)
        {
          id v8 = v7;
          if (v7)
          {
            unsigned int v9 = objc_autoreleasePoolPush();
            if (qword_100219F60) {
              [(id)qword_100219F60 WFLog:3, "%s: Dismissing join alert for %@", "-[WiFiUserNotificationManager dismissJoinAlerts]", -[WiFiUserNotificationManager visibleRequest](self, "visibleRequest") message];
            }
            objc_autoreleasePoolPop(v9);
            id v10 = -[WiFiUserNotificationManager callback](self, "callback");
            ((void (**)(id, uint64_t, id, uint64_t, void *))v10)[2]( v10,  6LL,  v8,  5LL,  -[WiFiUserNotificationManager callbackContext](self, "callbackContext"));
            timeoutTimer = self->_timeoutTimer;
            if (timeoutTimer) {
              dispatch_source_cancel((dispatch_source_t)timeoutTimer);
            }
            -[WiFiUserNotificationManager setVisibleRequest:](self, "setVisibleRequest:", 0LL);
            -[NSMutableDictionary removeAllObjects]( -[WiFiUserNotificationManager notificationMapping](self, "notificationMapping"),  "removeAllObjects");
          }
        }
      }
    }
  }

- (void)enableTestMode:(BOOL)a3
{
  if (self->_enableTestMode != a3)
  {
    BOOL v3 = a3;
    id v5 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      [qword_100219F60 WFLog:@"-[WiFiUserNotificationManager enableTestMode:] test mode %d" message:3];
    }
    objc_autoreleasePoolPop(v5);
    self->_enableTestMode = v3;
  }

- (void)_startTimerForNotificationWithUserInfo:(id)a3
{
  timeoutTimer = self->_timeoutTimer;
  unsigned int v6 = objc_autoreleasePoolPush();
  if (timeoutTimer)
  {
    if (qword_100219F60) {
      [(id)qword_100219F60 WFLog:3, "%s: previous timer already in progress, bailing for new userInfo %@", "-[WiFiUserNotificationManager _startTimerForNotificationWithUserInfo:]", a3 message];
    }
    objc_autoreleasePoolPop(v6);
  }

  else
  {
    if (qword_100219F60) {
      [(id)qword_100219F60 WFLog:3, "%s: starting timer for userInfo %@", "-[WiFiUserNotificationManager _startTimerForNotificationWithUserInfo:]", a3 message];
    }
    objc_autoreleasePoolPop(v6);
    id v7 = (OS_dispatch_source *)dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_timer,  0LL,  0LL,  (dispatch_queue_t)self->_queue);
    self->_timeoutTimer = v7;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472LL;
    handler[2] = sub_1001384F4;
    handler[3] = &unk_1001E2778;
    handler[4] = self;
    handler[5] = a3;
    dispatch_source_set_event_handler((dispatch_source_t)v7, handler);
    id v8 = self->_timeoutTimer;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_100138500;
    v11[3] = &unk_1001E2AF0;
    v11[4] = self;
    dispatch_source_set_cancel_handler((dispatch_source_t)v8, v11);
    unsigned int v9 = self->_timeoutTimer;
    dispatch_time_t v10 = dispatch_time(0LL, 1000000000 * self->_timeoutPeriod);
    dispatch_source_set_timer((dispatch_source_t)v9, v10, 0xFFFFFFFFFFFFFFFFLL, 0LL);
    dispatch_activate((dispatch_object_t)self->_timeoutTimer);
  }

- (void)_timeoutTimerDidFire:(id)a3
{
  timeoutTimer = self->_timeoutTimer;
  if (timeoutTimer) {
    dispatch_source_cancel((dispatch_source_t)timeoutTimer);
  }
  id v6 = [a3 objectForKeyedSubscript:@"identifier"];
  id v7 = objc_autoreleasePoolPush();
  if (qword_100219F60) {
    [(id)qword_100219F60 WFLog:3, "%s: timeout timer fired for identifier %@ (self.visibleRequest %@)", "-[WiFiUserNotificationManager _timeoutTimerDidFire:]", v6, -[WiFiUserNotificationManager visibleRequest](self, "visibleRequest") message];
  }
  objc_autoreleasePoolPop(v7);
  if (-[NSString isEqualToString:]( -[WiFiUserNotificationManager visibleRequest](self, "visibleRequest"),  "isEqualToString:",  v6))
  {
    id v8 = [a3 objectForKeyedSubscript:@"ssid"];
    id v9 = objc_msgSend(objc_msgSend(a3, "objectForKeyedSubscript:", @"type"), "integerValue");
    id v16 = v6;
    -[UNUserNotificationCenter removeDeliveredNotificationsWithIdentifiers:]( -[WiFiUserNotificationManager userNotificationCenterWiFi](self, "userNotificationCenterWiFi"),  "removeDeliveredNotificationsWithIdentifiers:",  +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v16, 1LL));
    dispatch_time_t v10 = -[WiFiUserNotificationManager callback](self, "callback");
    v10[2](v10, v9, v8, 5LL, -[WiFiUserNotificationManager callbackContext](self, "callbackContext"));
    id v11 = -[NSMutableDictionary objectForKey:]( -[WiFiUserNotificationManager notificationMapping](self, "notificationMapping"),  "objectForKey:",  v6);
    [ -[NSMutableDictionary objectForKey:] [ -[WiFiUserNotificationManager recentNotifications](self, "recentNotifications") objectForKey:v8] timeIntervalSinceNow];
    double v13 = -v12;
    if ((_DWORD)v9 == 1)
    {
      id v14 = [a3 objectForKeyedSubscript:@"location"];
      if (!v14)
      {
        v15 = objc_autoreleasePoolPush();
        if (qword_100219F60) {
          [qword_100219F60 WFLog:@"%s: location is not present" message:3];
        }
        objc_autoreleasePoolPop(v15);
      }

      -[WiFiUserNotificationManager _submitAnalyticsEventForRecommendation:action:visibleDuration:location:]( self,  "_submitAnalyticsEventForRecommendation:action:visibleDuration:location:",  [v11 objectForKey:@"Recommendation"],  3,  v14,  v13);
    }

    else if ((_DWORD)v9 == 2)
    {
      -[WiFiUserNotificationManager _submitAnalyticsEventForJoinAlertReason:action:visibleDuration:]( self,  "_submitAnalyticsEventForJoinAlertReason:action:visibleDuration:",  [v11 objectForKey:@"Reason"].integerValue,  3,  v13);
    }

    -[WiFiUserNotificationHistory handleNotificationResponseForSSID:type:response:]( -[WiFiUserNotificationManager notificationHistory](self, "notificationHistory"),  "handleNotificationResponseForSSID:type:response:",  v8,  v9,  5LL);
    -[WiFiUserNotificationManager setVisibleRequest:](self, "setVisibleRequest:", 0LL);
    -[NSMutableDictionary removeAllObjects]( -[WiFiUserNotificationManager notificationMapping](self, "notificationMapping"),  "removeAllObjects");
  }

- (void)_submitAnalyticsEventForRecommendation:(id)a3 action:(unint64_t)a4 visibleDuration:(double)a5 location:(id)a6
{
  id v10 = objc_msgSend(objc_msgSend(a3, "scannedNetwork"), "BSSID");
  if (objc_msgSend(objc_msgSend(a3, "network"), "popularityScore")) {
    id v11 = +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  objc_msgSend(objc_msgSend(objc_msgSend(a3, "network"), "popularityScore"), "score"));
  }
  else {
    id v11 = 0LL;
  }
  id v12 = objc_msgSend(objc_msgSend(a3, "network"), "source");
  if (a6)
  {
    [a6 coordinate];
    double v13 = +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:");
    [a6 coordinate];
    a6 = +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v14);
  }

  else
  {
    double v13 = 0LL;
  }

  if (v12 == (id)2) {
    uint64_t v15 = 1LL;
  }
  else {
    uint64_t v15 = 2LL * (v12 == (id)1);
  }
  +[TBAnalytics captureEvent:]( &OBJC_CLASS___TBAnalytics,  "captureEvent:",  +[TBJoinAnalyticsEvent joinRecommendationEventWithSource:action:BSSID:latitude:longitude:score:visibleDuration:]( &OBJC_CLASS___TBJoinAnalyticsEvent,  "joinRecommendationEventWithSource:action:BSSID:latitude:longitude:score:visibleDuration:",  v15,  a4,  v10,  v13,  a6,  v11,  +[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", llround(a5))));
}

- (void)_submitAnalyticsEventForJoinAlertReason:(int)a3 action:(unint64_t)a4 visibleDuration:(double)a5
{
  uint64_t v5 = (a3 - 1);
  else {
    uint64_t v6 = v5 + 3;
  }
  +[TBAnalytics captureEvent:]( &OBJC_CLASS___TBAnalytics,  "captureEvent:",  +[TBJoinAnalyticsEvent joinAlertEventWithSource:action:visibleDuration:]( &OBJC_CLASS___TBJoinAnalyticsEvent,  "joinAlertEventWithSource:action:visibleDuration:",  v6,  a4,  +[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", llround(a5))));
}

- (void)reset
{
  BOOL v3 = objc_autoreleasePoolPush();
  if (qword_100219F60) {
    [qword_100219F60 WFLog:@"%s: resetting states" message:3];
  }
  objc_autoreleasePoolPop(v3);
  uint64_t v4 = objc_autoreleasePoolPush();
  if (qword_100219F60) {
    [(id)qword_100219F60 WFLog:3, "%s: last recommendation location %@", "-[WiFiUserNotificationManager reset]", -[WiFiUserNotificationManager lastRecommendationLocation](self, "lastRecommendationLocation") message];
  }
  objc_autoreleasePoolPop(v4);
  -[WiFiUserNotificationManager setLastRecommendationLocation:](self, "setLastRecommendationLocation:", 0LL);
  uint64_t v5 = objc_autoreleasePoolPush();
  if (qword_100219F60) {
    [(id)qword_100219F60 WFLog:3, "%s: recentNotifications %@", "-[WiFiUserNotificationManager reset]", -[WiFiUserNotificationManager recentNotifications](self, "recentNotifications") message];
  }
  objc_autoreleasePoolPop(v5);
  -[NSMutableDictionary removeAllObjects]( -[WiFiUserNotificationManager recentNotifications](self, "recentNotifications"),  "removeAllObjects");
  -[WiFiUserNotificationHistory reset]( -[WiFiUserNotificationManager notificationHistory](self, "notificationHistory"),  "reset");
}

- (id)callback
{
  return self->_callback;
}

- (void)setCallback:(id)a3
{
  self->_id callback = a3;
}

- (void)callbackContext
{
  return self->_callbackContext;
}

- (void)setCallbackContext:(void *)a3
{
  self->_callbackContext = a3;
}

- (NSMutableDictionary)notificationMapping
{
  return self->_notificationMapping;
}

- (void)setNotificationMapping:(id)a3
{
}

- (UNUserNotificationCenter)userNotificationCenterWiFi
{
  return self->_userNotificationCenterWiFi;
}

- (void)setUserNotificationCenterWiFi:(id)a3
{
}

- (NSString)visibleRequest
{
  return self->_visibleRequest;
}

- (void)setVisibleRequest:(id)a3
{
}

- (NSMutableDictionary)recentNotifications
{
  return self->_recentNotifications;
}

- (void)setRecentNotifications:(id)a3
{
}

- (OS_dispatch_source)timeoutTimer
{
  return self->_timeoutTimer;
}

- (void)setTimeoutTimer:(id)a3
{
}

- (unint64_t)timeoutPeriod
{
  return self->_timeoutPeriod;
}

- (void)setTimeoutPeriod:(unint64_t)a3
{
  self->_timeoutPeriod = a3;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  self->_queue = (OS_dispatch_queue *)a3;
}

- (BOOL)supportsWAPI
{
  return self->_supportsWAPI;
}

- (void)setSupportsWAPI:(BOOL)a3
{
  self->_supportsWAPI = a3;
}

- (BOOL)shouldTimeOutRecommendation
{
  return self->_shouldTimeOutRecommendation;
}

- (void)setShouldTimeOutRecommendation:(BOOL)a3
{
  self->_shouldTimeOutRecommendation = a3;
}

- (int)deviceClass
{
  return self->_deviceClass;
}

- (void)setDeviceClass:(int)a3
{
  self->_deviceClass = a3;
}

- (CLLocation)lastRecommendationLocation
{
  return self->_lastRecommendationLocation;
}

- (void)setLastRecommendationLocation:(id)a3
{
}

- (WiFiUserNotificationHistory)notificationHistory
{
  return self->_notificationHistory;
}

- (void)setNotificationHistory:(id)a3
{
}

- (BOOL)enableTestMode
{
  return self->_enableTestMode;
}

- (void)setEnableTestMode:(BOOL)a3
{
  self->_enableTestMode = a3;
}

@end
@interface WiFiUserNotificationHistory
- (NSMutableDictionary)notifications;
- (NSString)lastRecommendedSSID;
- (WiFiUserNotificationHistory)init;
- (double)recommendationDistanceThreshold;
- (int)canPresentRecommendationForSSID:(id)a3 currentLocation:(id)a4;
- (int64_t)maxSystemCancellationAttempts;
- (void)dealloc;
- (void)handleNotificationResponseForSSID:(id)a3 type:(int)a4 response:(int)a5;
- (void)presentedNotificationForSSID:(id)a3 type:(int)a4 currentLocation:(id)a5;
- (void)reset;
- (void)resetAttemptsForSSID:(id)a3;
- (void)setLastRecommendedSSID:(id)a3;
- (void)setMaxSystemCancellationAttempts:(int64_t)a3;
- (void)setNotifications:(id)a3;
- (void)setRecommendationDistanceThreshold:(double)a3;
@end

@implementation WiFiUserNotificationHistory

- (WiFiUserNotificationHistory)init
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___WiFiUserNotificationHistory;
  v2 = -[WiFiUserNotificationHistory init](&v5, "init");
  v3 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  v2->_maxSystemCancellationAttempts = 2LL;
  v2->_notifications = v3;
  v2->_recommendationDistanceThreshold = 4000.0;
  return v2;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___WiFiUserNotificationHistory;
  -[WiFiUserNotificationHistory dealloc](&v3, "dealloc");
}

- (void)presentedNotificationForSSID:(id)a3 type:(int)a4 currentLocation:(id)a5
{
  if (-[NSMutableDictionary objectForKey:]( -[WiFiUserNotificationHistory notifications](self, "notifications", a3, *(void *)&a4),  "objectForKey:",  a3))
  {
    v8 = [ -[NSMutableDictionary objectForKey:]( -[WiFiUserNotificationHistory notifications](self, "notifications"),  "objectForKey:",  a3) mutableCopy];
  }

  else
  {
    v8 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  }

  v11 = v8;
  if (a5) {
    -[NSMutableDictionary setObject:forKey:](v8, "setObject:forKey:", a5, @"location");
  }
  v9 = +[NSDate date](&OBJC_CLASS___NSDate, "date");
  if (v9) {
    -[NSMutableDictionary setObject:forKey:](v11, "setObject:forKey:", v9, @"date");
  }
  -[NSMutableDictionary setObject:forKey:]( -[WiFiUserNotificationHistory notifications](self, "notifications"),  "setObject:forKey:",  v11,  a3);
  v10 = objc_autoreleasePoolPush();
  if (qword_100219F60) {
    [(id)qword_100219F60 WFLog:3, "%s: notification info %@", "-[WiFiUserNotificationHistory presentedNotificationForSSID:type:currentLocation:]", -[WiFiUserNotificationHistory notifications](self, "notifications") message];
  }
  objc_autoreleasePoolPop(v10);
}

- (void)handleNotificationResponseForSSID:(id)a3 type:(int)a4 response:(int)a5
{
  if (!a3)
  {
    v12 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      [qword_100219F60 WFLog:@"%s: nil ssid" message:4 "-[WiFiUserNotificationHistory handleNotificationResponseForSSID:type:response:]"];
    }
    v13 = v12;
    goto LABEL_11;
  }

  uint64_t v5 = *(void *)&a5;
  -[WiFiUserNotificationHistory setLastRecommendedSSID:](self, "setLastRecommendedSSID:", a3, *(void *)&a4);
  id v8 = -[NSMutableDictionary objectForKey:]( -[WiFiUserNotificationHistory notifications](self, "notifications"),  "objectForKey:",  a3);
  if (!v8)
  {
    v14 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      [(id)qword_100219F60 WFLog:4, "%s: unable to find notification info for ssid %@", "-[WiFiUserNotificationHistory handleNotificationResponseForSSID:type:response:]", a3 message];
    }
    v13 = v14;
LABEL_11:
    objc_autoreleasePoolPop(v13);
    return;
  }

  id v9 = [v8 mutableCopy];
  [v9 setObject:[NSNumber numberWithUnsignedInt:v5] forKey:@"response"];
  id v10 = [v9 objectForKey:@"attempt"];
  if (v10) {
    v11 = +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  (char *)[v10 integerValue] + 1);
  }
  else {
    v11 = (NSNumber *)&off_1002046F8;
  }
  [v9 setObject:v11 forKey:@"attempt"];
  -[NSMutableDictionary removeObjectForKey:]( -[WiFiUserNotificationHistory notifications](self, "notifications"),  "removeObjectForKey:",  a3);
  -[NSMutableDictionary setObject:forKey:]( -[WiFiUserNotificationHistory notifications](self, "notifications"),  "setObject:forKey:",  v9,  a3);
  v15 = objc_autoreleasePoolPush();
  if (qword_100219F60) {
    [(id)qword_100219F60 WFLog:3, "%s: updating notification info %@", "-[WiFiUserNotificationHistory handleNotificationResponseForSSID:type:response:]", v9 message];
  }
  objc_autoreleasePoolPop(v15);
  if (v9) {
    CFRelease(v9);
  }
}

- (int)canPresentRecommendationForSSID:(id)a3 currentLocation:(id)a4
{
  if (!-[WiFiUserNotificationHistory lastRecommendedSSID](self, "lastRecommendedSSID")
    || !-[NSMutableDictionary count](-[WiFiUserNotificationHistory notifications](self, "notifications"), "count"))
  {
    return 0;
  }

  if (!a3)
  {
    id v10 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      [qword_100219F60 WFLog:@"%s: nil ssid" message:4 v22];
    }
    goto LABEL_26;
  }

  unsigned int v7 = -[NSString isEqualToString:]( -[WiFiUserNotificationHistory lastRecommendedSSID](self, "lastRecommendedSSID"),  "isEqualToString:",  a3);
  id v8 = -[NSMutableDictionary objectForKey:]( -[WiFiUserNotificationHistory notifications](self, "notifications"),  "objectForKey:",  -[WiFiUserNotificationHistory lastRecommendedSSID](self, "lastRecommendedSSID"));
  if ([v8 objectForKey:@"response"]) {
    BOOL v9 = [[v8 objectForKey:@"response"] integerValue] == 5;
  }
  else {
    BOOL v9 = 0;
  }
  objc_msgSend(objc_msgSend(v8, "objectForKey:", @"date"), "timeIntervalSinceNow");
  double v12 = v11;
  v13 = objc_autoreleasePoolPush();
  if (qword_100219F60) {
    [(id)qword_100219F60 WFLog:3, "%s: ssid: %@ lastRecommendedSSID: %@ lastResponseWasSystemCancelled: %d lessThan24Hours: %d", "-[WiFiUserNotificationHistory canPresentRecommendationForSSID:currentLocation:]", a3, -[WiFiUserNotificationHistory lastRecommendedSSID](self, "lastRecommendedSSID", -86400.0), v9, v12 >= -86400.0 message];
  }
  objc_autoreleasePoolPop(v13);
  id v14 = [v8 objectForKey:@"attempt"];
  if (!v14 || ((v7 ^ 1) & 1) != 0 || !v9)
  {
    id v17 = [v8 objectForKey:@"location"];
    if (v17)
    {
      if (a4)
      {
        [a4 distanceFromLocation:v17];
        double v19 = v18;
        if (v18 <= 4000.0 && v12 >= -86400.0)
        {
          id v10 = objc_autoreleasePoolPush();
          int v16 = 3;
          if (qword_100219F60) {
            [(id)qword_100219F60 WFLog:3, "%s: suppressing notification, is at less than %.2fm since last recommendation (diff=%.2fm)", "-[WiFiUserNotificationHistory canPresentRecommendationForSSID:currentLocation:]", 0x40AF400000000000, *(void *)&v19 message];
          }
          goto LABEL_27;
        }

        goto LABEL_34;
      }

      v20 = objc_autoreleasePoolPush();
      if (qword_100219F60) {
        [qword_100219F60 WFLog:@"%s: no current location available" message:3];
      }
    }

    else
    {
      v20 = objc_autoreleasePoolPush();
      if (qword_100219F60) {
        [qword_100219F60 WFLog:@"%s: no location available from last recommendation" message:3];
      }
    }

    objc_autoreleasePoolPop(v20);
LABEL_34:
    if (v12 >= -86400.0)
    {
      id v10 = objc_autoreleasePoolPush();
      if (qword_100219F60) {
        [qword_100219F60 WFLog:@"%s: supressing notification, has been less than a day since last notification and we have no location" message:3];
      }
      int v16 = 4;
      goto LABEL_27;
    }

    return 0;
  }

  id v15 = [v14 unsignedIntegerValue];
  id v10 = objc_autoreleasePoolPush();
  if ((unint64_t)v15 >= 2)
  {
    if (qword_100219F60) {
      [(id)qword_100219F60 WFLog:3, "%s: hit max attempts for system cancelled for ssid %@", "-[WiFiUserNotificationHistory canPresentRecommendationForSSID:currentLocation:]", a3 message];
    }
    int v16 = 2;
    goto LABEL_27;
  }

  if (qword_100219F60) {
    objc_msgSend( (id)qword_100219F60,  "WFLog:message:",  3,  "%s: allowing a re-prompting due to last response was system cancelled (total attempts: %lu)",  "-[WiFiUserNotificationHistory canPresentRecommendationForSSID:currentLocation:]",  v15);
  }
LABEL_26:
  int v16 = 0;
LABEL_27:
  objc_autoreleasePoolPop(v10);
  return v16;
}

- (void)resetAttemptsForSSID:(id)a3
{
  uint64_t v5 = objc_autoreleasePoolPush();
  if (qword_100219F60) {
    [(id)qword_100219F60 WFLog:3, "%s: resetting attempts for ssid %@", "-[WiFiUserNotificationHistory resetAttemptsForSSID:]", a3 message];
  }
  objc_autoreleasePoolPop(v5);
  id v6 = -[NSMutableDictionary objectForKey:]( -[WiFiUserNotificationHistory notifications](self, "notifications"),  "objectForKey:",  a3);
  if (v6)
  {
    id v10 = [v6 mutableCopy];
    [v10 removeObjectForKey:@"attempt"];
    -[NSMutableDictionary setObject:forKey:]( -[WiFiUserNotificationHistory notifications](self, "notifications"),  "setObject:forKey:",  v10,  a3);
    unsigned int v7 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      [(id)qword_100219F60 WFLog:3, "%s: history for %@: %@", "-[WiFiUserNotificationHistory resetAttemptsForSSID:]", v10, a3 message];
    }
    objc_autoreleasePoolPop(v7);
  }

  else
  {
    id v8 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      [(id)qword_100219F60 WFLog:3, "%s: no history found for ssid %@", "-[WiFiUserNotificationHistory resetAttemptsForSSID:]", a3 message];
    }
    objc_autoreleasePoolPop(v8);
    BOOL v9 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      [(id)qword_100219F60 WFLog:3, "%s: history %@", "-[WiFiUserNotificationHistory resetAttemptsForSSID:]", -[WiFiUserNotificationHistory notifications](self, "notifications") message];
    }
    objc_autoreleasePoolPop(v9);
  }

- (void)reset
{
  objc_super v3 = objc_autoreleasePoolPush();
  if (qword_100219F60) {
    [(id)qword_100219F60 WFLog:3, "%s: reseting state for notifications: %@", "-[WiFiUserNotificationHistory reset]", -[WiFiUserNotificationHistory notifications](self, "notifications") message];
  }
  objc_autoreleasePoolPop(v3);
  -[NSMutableDictionary removeAllObjects]( -[WiFiUserNotificationHistory notifications](self, "notifications"),  "removeAllObjects");
}

- (double)recommendationDistanceThreshold
{
  return self->_recommendationDistanceThreshold;
}

- (void)setRecommendationDistanceThreshold:(double)a3
{
  self->_recommendationDistanceThreshold = a3;
}

- (int64_t)maxSystemCancellationAttempts
{
  return self->_maxSystemCancellationAttempts;
}

- (void)setMaxSystemCancellationAttempts:(int64_t)a3
{
  self->_maxSystemCancellationAttempts = a3;
}

- (NSMutableDictionary)notifications
{
  return self->_notifications;
}

- (void)setNotifications:(id)a3
{
}

- (NSString)lastRecommendedSSID
{
  return self->_lastRecommendedSSID;
}

- (void)setLastRecommendedSSID:(id)a3
{
}

@end
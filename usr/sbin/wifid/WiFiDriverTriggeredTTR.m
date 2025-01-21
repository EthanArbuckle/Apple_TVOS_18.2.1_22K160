@interface WiFiDriverTriggeredTTR
+ (id)sharedWiFiDriverTriggeredTTRManagerwithStringRef:(__CFString *)a3 withInterval:(double)a4;
- (BOOL)WiFiDriverTriggeredTTRForReason:(id)a3;
- (BOOL)WiFiDriverTriggeredTTRHandler:(id)a3;
- (NSMutableDictionary)_lastTriggeredTTR;
- (WiFiDriverTriggeredTTR)initWithWiFiManagerwithStringRef:(__CFString *)a3 withInterval:(double)a4;
- (WiFiSoftError)_softError;
- (id)WiFiDriverTriggeredTTRSoftErrorCreatewithStringRef:(__CFString *)a3 withInterval:(double)a4;
- (void)set_lastTriggeredTTR:(id)a3;
- (void)set_softError:(id)a3;
@end

@implementation WiFiDriverTriggeredTTR

+ (id)sharedWiFiDriverTriggeredTTRManagerwithStringRef:(__CFString *)a3 withInterval:(double)a4
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1001281B4;
  v5[3] = &unk_1001E2C30;
  v5[4] = a3;
  *(double *)&v5[5] = a4;
  if (qword_100219E30 != -1) {
    dispatch_once(&qword_100219E30, v5);
  }
  return (id)qword_100219E28;
}

- (WiFiDriverTriggeredTTR)initWithWiFiManagerwithStringRef:(__CFString *)a3 withInterval:(double)a4
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___WiFiDriverTriggeredTTR;
  v6 = -[WiFiDriverTriggeredTTR init](&v9, "init");
  if (v6)
  {
    -[WiFiDriverTriggeredTTR set_lastTriggeredTTR:]( v6,  "set_lastTriggeredTTR:",  +[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    if (-[WiFiDriverTriggeredTTR _lastTriggeredTTR](v6, "_lastTriggeredTTR"))
    {
      -[WiFiDriverTriggeredTTR set_softError:]( v6,  "set_softError:",  -[WiFiDriverTriggeredTTR WiFiDriverTriggeredTTRSoftErrorCreatewithStringRef:withInterval:]( v6,  "WiFiDriverTriggeredTTRSoftErrorCreatewithStringRef:withInterval:",  a3,  a4));
      if (-[WiFiDriverTriggeredTTR _softError](v6, "_softError")) {
        return v6;
      }
      v8 = objc_autoreleasePoolPush();
      if (qword_100219F60) {
        objc_msgSend( (id)qword_100219F60,  "WFLog:message:",  3,  "%s: Unable to create softError object\n",  "-[WiFiDriverTriggeredTTR initWithWiFiManagerwithStringRef:withInterval:]");
      }
    }

    else
    {
      v8 = objc_autoreleasePoolPush();
      if (qword_100219F60) {
        [qword_100219F60 WFLog:@"%s: null self._lastTriggeredTTR" message:3];
      }
    }

    objc_autoreleasePoolPop(v8);
    return 0LL;
  }

  return v6;
}

- (id)WiFiDriverTriggeredTTRSoftErrorCreatewithStringRef:(__CFString *)a3 withInterval:(double)a4
{
  if (a4 < 0.0) {
    a4 = 86400.0;
  }
  v7[0] = @"maxUIActions";
  v8[0] = +[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", 5LL);
  v7[1] = @"intervalForMaxUIActions";
  v8[1] = +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", a4);
  v7[2] = @"maxOccurrences";
  v8[2] = +[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", 100LL);
  return -[WiFiSoftError initWithName:andParams:]( objc_alloc(&OBJC_CLASS___WiFiSoftError),  "initWithName:andParams:",  a3,  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v8,  v7,  3LL));
}

- (BOOL)WiFiDriverTriggeredTTRHandler:(id)a3
{
  id v5 = [a3 objectForKey:@"DRIVER_TTR_Reason"];
  if (!v5
    || (unsigned int v6 = [v5 intValue],
        id v7 = [a3 objectForKey:@"DRIVER_TTR_Reason_String"],
        v6 == -1))
  {
    v10 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      objc_msgSend( (id)qword_100219F60,  "WFLog:message:",  3,  "%s: Unknown TTR request\n",  "-[WiFiDriverTriggeredTTR WiFiDriverTriggeredTTRHandler:]");
    }
    objc_autoreleasePoolPop(v10);
  }

  else
  {
    id v8 = v7;
    if (!-[NSMutableDictionary objectForKey:]( -[WiFiDriverTriggeredTTR _lastTriggeredTTR](self, "_lastTriggeredTTR"),  "objectForKey:",  v7)) {
      return -[WiFiDriverTriggeredTTR WiFiDriverTriggeredTTRForReason:](self, "WiFiDriverTriggeredTTRForReason:", v8);
    }
    [ -[NSMutableDictionary objectForKey:]( -[WiFiDriverTriggeredTTR _lastTriggeredTTR](self, "_lastTriggeredTTR"),  "objectForKey:",  v8) timeIntervalSinceNow];
    if (v9 < -86400.0) {
      return -[WiFiDriverTriggeredTTR WiFiDriverTriggeredTTRForReason:](self, "WiFiDriverTriggeredTTRForReason:", v8);
    }
  }

  return 0;
}

- (BOOL)WiFiDriverTriggeredTTRForReason:(id)a3
{
  uint64_t v6 = 0LL;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000LL;
  char v9 = 0;
  if (a3)
  {
    v3 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      [qword_100219F60 WFLog:@"%s unsupported platform" message:3];
    }
    objc_autoreleasePoolPop(v3);
    BOOL v4 = *((_BYTE *)v7 + 24) != 0;
  }

  else
  {
    BOOL v4 = 0;
  }

  _Block_object_dispose(&v6, 8);
  return v4;
}

- (WiFiSoftError)_softError
{
  return (WiFiSoftError *)objc_getProperty(self, a2, 8LL, 1);
}

- (void)set_softError:(id)a3
{
}

- (NSMutableDictionary)_lastTriggeredTTR
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)set_lastTriggeredTTR:(id)a3
{
}

@end
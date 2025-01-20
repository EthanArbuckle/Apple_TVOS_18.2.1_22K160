@interface TMTimeSynthesizerMonitor
- (BOOL)shouldReset;
- (NSMutableDictionary)sourceRejects;
- (TMTimeSynthesizerMonitor)init;
- (void)dealloc;
- (void)resetRejectCountsForReason:(int64_t)a3 rtc:(double)a4;
- (void)sendConsecutiveRejectsAnalyticsAtRtc:(double)a3 forReason:(int64_t)a4 withTime:(id)a5;
- (void)setSourceRejects:(id)a3;
- (void)synthesizer:(id)a3 rejectedTimeInput:(id)a4;
@end

@implementation TMTimeSynthesizerMonitor

- (TMTimeSynthesizerMonitor)init
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___TMTimeSynthesizerMonitor;
  v2 = -[TMTimeSynthesizerMonitor init](&v4, "init");
  if (v2) {
    v2->_sourceRejects =  +[NSMutableDictionary dictionaryWithSharedKeySet:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithSharedKeySet:",  +[NSDictionary sharedKeySetForKeys:]( &OBJC_CLASS___NSDictionary,  "sharedKeySetForKeys:",  &off_10002C900));
  }
  return v2;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___TMTimeSynthesizerMonitor;
  -[TMTimeSynthesizerMonitor dealloc](&v3, "dealloc");
}

- (void)resetRejectCountsForReason:(int64_t)a3 rtc:(double)a4
{
  v7 = (os_log_s *)qword_1000338F8;
  if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "resetting reject counts", v8, 2u);
  }

  -[TMTimeSynthesizerMonitor sendConsecutiveRejectsAnalyticsAtRtc:forReason:withTime:]( self,  "sendConsecutiveRejectsAnalyticsAtRtc:forReason:withTime:",  a3,  0LL,  a4);
  -[NSMutableDictionary removeAllObjects]( -[TMTimeSynthesizerMonitor sourceRejects](self, "sourceRejects"),  "removeAllObjects");
}

- (void)synthesizer:(id)a3 rejectedTimeInput:(id)a4
{
  if (objc_msgSend(&off_10002C900, "containsObject:", objc_msgSend(a4, "source", a3)))
  {
    id v6 = -[NSMutableDictionary objectForKey:]( -[TMTimeSynthesizerMonitor sourceRejects](self, "sourceRejects"),  "objectForKey:",  [a4 source]);
    if (v6) {
      -[NSMutableDictionary setObject:forKeyedSubscript:]( -[TMTimeSynthesizerMonitor sourceRejects](self, "sourceRejects"),  "setObject:forKeyedSubscript:",  +[NSNumber numberWithInt:]( NSNumber,  "numberWithInt:",  [v6 intValue] + 1),  objc_msgSend(a4, "source"));
    }
    else {
      -[NSMutableDictionary setObject:forKey:]( -[TMTimeSynthesizerMonitor sourceRejects](self, "sourceRejects"),  "setObject:forKey:",  &off_10002C7F0,  [a4 source]);
    }
    v8 = (os_log_s *)qword_1000338F8;
    if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138412290;
      id v10 = [a4 source];
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "source %@ has been rejected by Secure Filter, incrementing count",  (uint8_t *)&v9,  0xCu);
    }

    objc_msgSend(a4, "rtc_s");
    -[TMTimeSynthesizerMonitor sendConsecutiveRejectsAnalyticsAtRtc:forReason:withTime:]( self,  "sendConsecutiveRejectsAnalyticsAtRtc:forReason:withTime:",  3LL,  a4);
  }

  else
  {
    v7 = (os_log_s *)qword_1000338F8;
    if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138412290;
      id v10 = [a4 source];
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "source %@ is not being tracked by TMTimeSynthesizerMonitor",  (uint8_t *)&v9,  0xCu);
    }
  }

- (BOOL)shouldReset
{
  unsigned int v3 = objc_msgSend( -[NSMutableDictionary objectForKeyedSubscript:]( -[TMTimeSynthesizerMonitor sourceRejects](self, "sourceRejects"),  "objectForKeyedSubscript:",  @"NTP"),  "intValue");
  unsigned int v4 = objc_msgSend( -[NSMutableDictionary objectForKeyedSubscript:]( -[TMTimeSynthesizerMonitor sourceRejects](self, "sourceRejects"),  "objectForKeyedSubscript:",  @"APNS"),  "intValue");
  v5 = (os_log_s *)qword_1000338F8;
  if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_DEFAULT))
  {
    v7[0] = 67109376;
    v7[1] = v3;
    __int16 v8 = 1024;
    unsigned int v9 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "SynthesizerMonitor: ntp_rejects: %d apns_rejects: %d",  (uint8_t *)v7,  0xEu);
  }

  return 0;
}

- (void)sendConsecutiveRejectsAnalyticsAtRtc:(double)a3 forReason:(int64_t)a4 withTime:(id)a5
{
  __int16 v8 = +[NSMutableDictionary dictionaryWithDictionary:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithDictionary:",  -[TMTimeSynthesizerMonitor sourceRejects](self, "sourceRejects"));
  if (a5)
  {
    double Current = CFAbsoluteTimeGetCurrent();
    objc_msgSend(a5, "utc_s");
    -[NSMutableDictionary setObject:forKey:]( v8,  "setObject:forKey:",  +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", Current - v10),  @"difference");
  }

  -[NSMutableDictionary setObject:forKey:]( v8,  "setObject:forKey:",  +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", a3),  @"rtc_s");
  -[NSMutableDictionary setObject:forKey:]( v8,  "setObject:forKey:",  +[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a4),  @"report_reason");
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_100015BBC;
  v11[3] = &unk_100028F70;
  v11[4] = v8;
  AnalyticsSendEventLazy(@"com.apple.timed.consecutiveRejectsByInput", v11);
}

- (NSMutableDictionary)sourceRejects
{
  return self->_sourceRejects;
}

- (void)setSourceRejects:(id)a3
{
  self->_sourceRejects = (NSMutableDictionary *)a3;
}

@end
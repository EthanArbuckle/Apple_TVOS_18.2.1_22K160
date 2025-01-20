@interface HangDataStreamStatusTracker
+ (id)sharedInstance;
- (BOOL)isHangEndedWithDuration:(double)a3 updateInterval:(double)a4 hangID:(id)a5;
- (HangDataStreamStatusTracker)init;
- (NSMutableDictionary)hangHUDStatusDict;
- (void)initializeStatus;
- (void)setHangHUDStatusDict:(id)a3;
@end

@implementation HangDataStreamStatusTracker

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10001C17C;
  block[3] = &unk_100049168;
  block[4] = a1;
  if (qword_10005BB58 != -1) {
    dispatch_once(&qword_10005BB58, block);
  }
  return (id)qword_10005BB50;
}

- (HangDataStreamStatusTracker)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___HangDataStreamStatusTracker;
  v2 = -[HangDataStreamStatusTracker init](&v6, "init");
  if (v2)
  {
    v3 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    hangHUDStatusDict = v2->_hangHUDStatusDict;
    v2->_hangHUDStatusDict = v3;
  }

  return v2;
}

- (void)initializeStatus
{
}

- (BOOL)isHangEndedWithDuration:(double)a3 updateInterval:(double)a4 hangID:(id)a5
{
  id v8 = a5;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_hangHUDStatusDict, "objectForKey:", v8));

  if (!v9)
  {
    hangHUDStatusDict = self->_hangHUDStatusDict;
    v11 = objc_alloc_init(&OBJC_CLASS___HangDataStreamStatus);
    -[NSMutableDictionary setObject:forKey:](hangHUDStatusDict, "setObject:forKey:", v11, v8);
  }

  v12 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_hangHUDStatusDict,  "objectForKeyedSubscript:",  v8));
  [v12 previousDurationSinceLastUpdateMs];
  double v14 = v13;
  id v15 = sub_100024414();
  v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    [v12 previousDurationSinceLastUpdateMs];
    int v29 = 134219522;
    double v30 = a3;
    __int16 v31 = 2048;
    uint64_t v32 = v28;
    __int16 v33 = 1024;
    unsigned int v34 = [v12 countsOfMeetingEndingConditions];
    __int16 v35 = 1024;
    BOOL v36 = a3 > a4;
    __int16 v37 = 1024;
    BOOL v38 = v14 < a3;
    __int16 v39 = 2048;
    double v40 = a4;
    __int16 v41 = 2112;
    id v42 = v8;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEBUG,  "isHangEndedWithDuration %f, previous_durationSinceLastUpdateMs:%f, counter:%i, is_latency_high:%i, is_latency_incr easing:%i, hudUpdateInterval:%f, hangID:%@",  (uint8_t *)&v29,  0x3Cu);
  }

  if (a3 <= a4 || v14 >= a3)
  {
    [v12 initStatus];
  }

  else
  {
    objc_msgSend( v12,  "setCountsOfMeetingEndingConditions:",  objc_msgSend(v12, "countsOfMeetingEndingConditions") + 1);
    [v12 setPreviousDurationSinceLastUpdateMs:a3];
  }

  int v17 = [v12 countsOfMeetingEndingConditions];
  id v18 = sub_100024414();
  v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
  BOOL v20 = os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG);
  if (v17 < 3)
  {
    if (v20) {
      sub_10002CEC4((uint64_t)v8, v19, v21, v22, v23, v24, v25, v26);
    }
  }

  else
  {
    if (v20) {
      sub_10002CE5C((uint64_t)v8, v19, v21, v22, v23, v24, v25, v26);
    }

    [v12 initStatus];
  }

  return v17 > 2;
}

- (NSMutableDictionary)hangHUDStatusDict
{
  return self->_hangHUDStatusDict;
}

- (void)setHangHUDStatusDict:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
@interface _AFClockTimerIntentSupportProxy
- (NSDate)lastModifiedDate;
- (NSDictionary)siriContext;
- (NSString)description;
- (NSString)title;
- (NSUUID)timerID;
- (_AFClockTimerIntentSupportProxy)initWithTimerID:(id)a3 state:(unint64_t)a4 duration:(double)a5 remainingTime:(double)a6 lastModifiedDate:(id)a7 title:(id)a8 siriContext:(id)a9;
- (double)duration;
- (double)remainingTime;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (int64_t)type;
- (unint64_t)state;
- (void)setDuration:(double)a3;
- (void)setState:(unint64_t)a3;
@end

@implementation _AFClockTimerIntentSupportProxy

- (_AFClockTimerIntentSupportProxy)initWithTimerID:(id)a3 state:(unint64_t)a4 duration:(double)a5 remainingTime:(double)a6 lastModifiedDate:(id)a7 title:(id)a8 siriContext:(id)a9
{
  id v17 = a3;
  id v18 = a7;
  id v19 = a8;
  id v20 = a9;
  v26.receiver = self;
  v26.super_class = (Class)&OBJC_CLASS____AFClockTimerIntentSupportProxy;
  v21 = -[_AFClockTimerIntentSupportProxy init](&v26, "init");
  v22 = v21;
  if (v21)
  {
    objc_storeStrong((id *)&v21->_timerID, a3);
    v22->_state = a4;
    v22->_duration = a5;
    v22->_remainingTime = a6;
    objc_storeStrong((id *)&v22->_lastModifiedDate, a7);
    v23 = (NSString *)[v19 copy];
    title = v22->_title;
    v22->_title = v23;

    objc_storeStrong((id *)&v22->_siriContext, a9);
  }

  return v22;
}

- (int64_t)type
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( -[NSDictionary objectForKeyedSubscript:]( self->_siriContext,  "objectForKeyedSubscript:",  SOMTTimerIntentSupportSiriContextTimerTypeKey));
  if (v2 && (uint64_t v3 = objc_opt_class(&OBJC_CLASS___NSNumber), (objc_opt_isKindOfClass(v2, v3) & 1) != 0)) {
    int64_t v4 = (int64_t)[v2 integerValue];
  }
  else {
    int64_t v4 = 1LL;
  }

  return v4;
}

- (NSString)description
{
  uint64_t v3 = objc_alloc(&OBJC_CLASS___NSString);
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS____AFClockTimerIntentSupportProxy;
  int64_t v4 = -[_AFClockTimerIntentSupportProxy description](&v8, "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = -[NSString initWithFormat:]( v3,  "initWithFormat:",  @"%@ {timerID = %@, state = %ld, duration = %f, remainingTime = %f, lastModifiedDate = %@, title = %@, siriContext = %@}",  v5,  self->_timerID,  self->_state,  *(void *)&self->_duration,  *(void *)&self->_remainingTime,  self->_lastModifiedDate,  self->_title,  self->_siriContext);

  return v6;
}

- (void)setState:(unint64_t)a3
{
  if (self->_state != a3)
  {
    if (a3 == 1) {
      self->_remainingTime = self->_duration;
    }
    self->_state = a3;
  }

- (void)setDuration:(double)a3
{
  if (self->_state != 1)
  {
    uint64_t v3 = (os_log_s *)AFSiriLogContextDaemon;
    if (!os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR)) {
      return;
    }
    int v5 = 136315138;
    v6 = "-[_AFClockTimerIntentSupportProxy setDuration:]";
    int64_t v4 = "%s Timer duration can only be modified while stopped.";
LABEL_9:
    _os_log_error_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, v4, (uint8_t *)&v5, 0xCu);
    return;
  }

  if (a3 > 0.0)
  {
    self->_duration = a3;
    return;
  }

  uint64_t v3 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
  {
    int v5 = 136315138;
    v6 = "-[_AFClockTimerIntentSupportProxy setDuration:]";
    int64_t v4 = "%s Timer duration must be positive.";
    goto LABEL_9;
  }

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[_AFClockTimerIntentSupportProxy initWithTimerID:state:duration:remainingTime:lastModifiedDate:title:siriContext:]( +[_AFClockTimerIntentSupportMutableProxy allocWithZone:]( &OBJC_CLASS____AFClockTimerIntentSupportMutableProxy,  "allocWithZone:",  a3),  "initWithTimerID:state:duration:remainingTime:lastModifiedDate:title:siriContext:",  self->_timerID,  self->_state,  self->_lastModifiedDate,  self->_title,  self->_siriContext,  self->_duration,  self->_remainingTime);
}

- (NSUUID)timerID
{
  return self->_timerID;
}

- (unint64_t)state
{
  return self->_state;
}

- (double)duration
{
  return self->_duration;
}

- (double)remainingTime
{
  return self->_remainingTime;
}

- (NSDate)lastModifiedDate
{
  return self->_lastModifiedDate;
}

- (NSString)title
{
  return self->_title;
}

- (NSDictionary)siriContext
{
  return self->_siriContext;
}

- (void).cxx_destruct
{
}

@end
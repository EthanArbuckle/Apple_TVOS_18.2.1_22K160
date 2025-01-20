@interface NRAnalyticsALUAdviceStats
- (void)submit;
@end

@implementation NRAnalyticsALUAdviceStats

- (void)submit
{
  if (self) {
    double v3 = self->_timeSinceLastAdvice * 1000.0;
  }
  else {
    double v3 = 0.0;
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", round(v3) * 0.001));
  if (!self)
  {
    v8 = @"timeSinceLastAdvice";
    eventDictionary = 0LL;
    goto LABEL_8;
  }

  -[NSMutableDictionary setObject:forKeyedSubscript:]( self->super._eventDictionary,  "setObject:forKeyedSubscript:",  v4,  @"timeSinceLastAdvice");

  double timeSinceLastNonDefaultAdvice = self->_timeSinceLastNonDefaultAdvice;
  if (timeSinceLastNonDefaultAdvice > 0.0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithDouble:]( &OBJC_CLASS___NSNumber,  "numberWithDouble:",  round(timeSinceLastNonDefaultAdvice * 1000.0) * 0.001));
    -[NSMutableDictionary setObject:forKeyedSubscript:]( self->super._eventDictionary,  "setObject:forKeyedSubscript:",  v6,  @"timeSinceLastNonDefaultAdvice");
  }

  if (self->_receivedSameAdvice)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:"));
    eventDictionary = self->super._eventDictionary;
    v8 = @"receivedSameAdvice";
LABEL_8:
    -[NSMutableDictionary setObject:forKeyedSubscript:](eventDictionary, "setObject:forKeyedSubscript:", v4, v8);
  }

  sub_100119D38((uint64_t)self, @"com.apple.networkrelay.analytics.aluAdviceStats");
}

@end
@interface NRAnalyticsALUAdviceAggregateStats
- (void)submit;
@end

@implementation NRAnalyticsALUAdviceAggregateStats

- (void)submit
{
  if (self)
  {
    double avgIntervalForNonDefaultAdvice = self->_avgIntervalForNonDefaultAdvice;
    if (avgIntervalForNonDefaultAdvice > 0.0)
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithDouble:]( &OBJC_CLASS___NSNumber,  "numberWithDouble:",  round(avgIntervalForNonDefaultAdvice * 1000.0) * 0.001));
      -[NSMutableDictionary setObject:forKeyedSubscript:]( self->super._eventDictionary,  "setObject:forKeyedSubscript:",  v4,  @"avgIntervalForNonDefaultAdvice");
    }

    double v5 = self->_avgDurationForWiFiAdvice * 1000.0;
  }

  else
  {
    double v5 = 0.0;
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", round(v5) * 0.001));
  if (self) {
    eventDictionary = self->super._eventDictionary;
  }
  else {
    eventDictionary = 0LL;
  }
  -[NSMutableDictionary setObject:forKeyedSubscript:]( eventDictionary,  "setObject:forKeyedSubscript:",  v6,  @"avgDurationForWiFiAdvice");

  if (self) {
    double v8 = self->_avgDurationForBTClassicAdvice * 1000.0;
  }
  else {
    double v8 = 0.0;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", round(v8) * 0.001));
  if (!self)
  {
    v13 = @"avgDurationForBTClassicAdvice";
    v12 = 0LL;
    goto LABEL_16;
  }

  -[NSMutableDictionary setObject:forKeyedSubscript:]( self->super._eventDictionary,  "setObject:forKeyedSubscript:",  v9,  @"avgDurationForBTClassicAdvice");

  if (self->_totalAdviceCount)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:"));
    -[NSMutableDictionary setObject:forKeyedSubscript:]( self->super._eventDictionary,  "setObject:forKeyedSubscript:",  v10,  @"totalAdviceCount");
  }

  if (self->_totalAdviceCountForWiFi)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:"));
    -[NSMutableDictionary setObject:forKeyedSubscript:]( self->super._eventDictionary,  "setObject:forKeyedSubscript:",  v11,  @"totalAdviceCountForWiFi");
  }

  if (self->_totalAdviceCountForBTClassic)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:"));
    v12 = self->super._eventDictionary;
    v13 = @"totalAdviceCountForBTClassic";
LABEL_16:
    -[NSMutableDictionary setObject:forKeyedSubscript:](v12, "setObject:forKeyedSubscript:", v9, v13);
  }

  sub_100119D38((uint64_t)self, @"com.apple.networkrelay.analytics.aluAdviceAggregateStats");
}

@end
@interface AFClockTimer
- (id)timerProxyForIntentSupport;
@end

@implementation AFClockTimer

- (id)timerProxyForIntentSupport
{
  v3 = (char *)-[AFClockTimer state](self, "state");
  if (-[AFClockTimer state](self, "state") == (id)1 || (double v4 = 0.0, -[AFClockTimer state](self, "state") == (id)2))
  {
    -[AFClockTimer fireTimeInterval](self, "fireTimeInterval");
    double v4 = v5;
  }

  if (-[AFClockTimer state](self, "state") == (id)3)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[AFClockTimer fireDate](self, "fireDate"));
    [v6 timeIntervalSinceNow];
    double v4 = v7;
  }

  if (-[AFClockTimer type](self, "type") == (id)2) {
    uint64_t v8 = 2LL;
  }
  else {
    uint64_t v8 = 1LL;
  }
  uint64_t v19 = SOMTTimerIntentSupportSiriContextTimerTypeKey;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v8));
  v20 = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v20,  &v19,  1LL));

  v11 = objc_alloc(&OBJC_CLASS____AFClockTimerIntentSupportProxy);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[AFClockTimer timerID](self, "timerID"));
  -[AFClockTimer duration](self, "duration");
  double v14 = v13;
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[AFClockTimer lastModifiedDate](self, "lastModifiedDate"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[AFClockTimer title](self, "title"));
  v17 = -[_AFClockTimerIntentSupportProxy initWithTimerID:state:duration:remainingTime:lastModifiedDate:title:siriContext:]( v11,  "initWithTimerID:state:duration:remainingTime:lastModifiedDate:title:siriContext:",  v12,  v3,  v15,  v16,  v10,  v14,  v4);

  return v17;
}

@end
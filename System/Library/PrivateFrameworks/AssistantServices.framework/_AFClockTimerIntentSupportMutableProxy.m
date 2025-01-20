@interface _AFClockTimerIntentSupportMutableProxy
- (NSArray)trackedChanges;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setDuration:(double)a3;
- (void)setState:(unint64_t)a3;
@end

@implementation _AFClockTimerIntentSupportMutableProxy

- (void)setState:(unint64_t)a3
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS____AFClockTimerIntentSupportMutableProxy;
  -[_AFClockTimerIntentSupportProxy setState:](&v10, "setState:");
  trackedChanges = self->_trackedChanges;
  if (!trackedChanges)
  {
    v6 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    v7 = self->_trackedChanges;
    self->_trackedChanges = v6;

    trackedChanges = self->_trackedChanges;
  }

  v11 = @"state";
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a3));
  v12 = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v12,  &v11,  1LL));
  -[NSMutableArray addObject:](trackedChanges, "addObject:", v9);
}

- (void)setDuration:(double)a3
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS____AFClockTimerIntentSupportMutableProxy;
  -[_AFClockTimerIntentSupportProxy setDuration:](&v10, "setDuration:");
  trackedChanges = self->_trackedChanges;
  if (!trackedChanges)
  {
    v6 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    v7 = self->_trackedChanges;
    self->_trackedChanges = v6;

    trackedChanges = self->_trackedChanges;
  }

  v11 = @"duration";
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", a3));
  v12 = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v12,  &v11,  1LL));
  -[NSMutableArray addObject:](trackedChanges, "addObject:", v9);
}

- (NSArray)trackedChanges
{
  if (-[NSMutableArray count](self->_trackedChanges, "count")) {
    id v3 = -[NSMutableArray copy](self->_trackedChanges, "copy");
  }
  else {
    id v3 = &__NSArray0__struct;
  }
  return (NSArray *)v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = +[_AFClockTimerIntentSupportProxy allocWithZone:]( &OBJC_CLASS____AFClockTimerIntentSupportProxy,  "allocWithZone:",  a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[_AFClockTimerIntentSupportProxy timerID](self, "timerID"));
  unint64_t v6 = -[_AFClockTimerIntentSupportProxy state](self, "state");
  -[_AFClockTimerIntentSupportProxy duration](self, "duration");
  double v8 = v7;
  -[_AFClockTimerIntentSupportProxy remainingTime](self, "remainingTime");
  double v10 = v9;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[_AFClockTimerIntentSupportProxy lastModifiedDate](self, "lastModifiedDate"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[_AFClockTimerIntentSupportProxy title](self, "title"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[_AFClockTimerIntentSupportProxy siriContext](self, "siriContext"));
  v14 = -[_AFClockTimerIntentSupportProxy initWithTimerID:state:duration:remainingTime:lastModifiedDate:title:siriContext:]( v4,  "initWithTimerID:state:duration:remainingTime:lastModifiedDate:title:siriContext:",  v5,  v6,  v11,  v12,  v13,  v8,  v10);

  return v14;
}

- (void).cxx_destruct
{
}

@end
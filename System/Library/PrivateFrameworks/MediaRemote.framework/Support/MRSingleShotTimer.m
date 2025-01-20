@interface MRSingleShotTimer
- (BOOL)isValid;
- (MRSingleShotTimer)initWithInterval:(double)a3 queue:(id)a4 block:(id)a5;
- (NSDate)endDate;
- (NSDate)startDate;
- (double)interval;
- (double)remainingDuration;
- (void)invalidateWithReason:(id)a3;
@end

@implementation MRSingleShotTimer

- (MRSingleShotTimer)initWithInterval:(double)a3 queue:(id)a4 block:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v24.receiver = self;
  v24.super_class = (Class)&OBJC_CLASS___MRSingleShotTimer;
  v10 = -[MRSingleShotTimer init](&v24, "init");
  if (v10)
  {
    uint64_t v11 = objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
    startDate = v10->_startDate;
    v10->_startDate = (NSDate *)v11;

    uint64_t v13 = objc_claimAutoreleasedReturnValue(-[NSDate dateByAddingTimeInterval:](v10->_startDate, "dateByAddingTimeInterval:", a3));
    endDate = v10->_endDate;
    v10->_endDate = (NSDate *)v13;

    v10->_interval = a3;
    id v15 = [v9 copy];
    id block = v10->_block;
    v10->_id block = v15;

    objc_initWeak(&location, v10);
    v17 = objc_alloc(&OBJC_CLASS___MSVTimer);
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472LL;
    v21[2] = sub_1000E8B94;
    v21[3] = &unk_10039A668;
    objc_copyWeak(&v22, &location);
    v18 = -[MSVTimer initWithInterval:repeats:queue:block:]( v17,  "initWithInterval:repeats:queue:block:",  0LL,  v8,  v21,  a3);
    timer = v10->_timer;
    v10->_timer = v18;

    objc_destroyWeak(&v22);
    objc_destroyWeak(&location);
  }

  return v10;
}

- (void)invalidateWithReason:(id)a3
{
  id v8 = a3;
  v4 = self;
  objc_sync_enter(v4);
  v5 = (void (**)(id, id))objc_retainBlock(v4->_block);
  timer = v4->_timer;
  v4->_timer = 0LL;

  id block = v4->_block;
  v4->_id block = 0LL;

  objc_sync_exit(v4);
  if (v5) {
    v5[2](v5, v8);
  }
}

- (double)remainingDuration
{
  return result;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (double)interval
{
  return self->_interval;
}

- (BOOL)isValid
{
  return self->_valid;
}

- (void).cxx_destruct
{
}

@end
@interface InAppDownloadTimeEstimator
- (InAppDownloadTimeEstimator)initWithMaxValue:(unint64_t)a3;
- (double)estimatedTimeRemaining;
- (void)_updateStatisticsFromSnapshots;
- (void)setCurrentValue:(unint64_t)a3;
@end

@implementation InAppDownloadTimeEstimator

- (InAppDownloadTimeEstimator)initWithMaxValue:(unint64_t)a3
{
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___InAppDownloadTimeEstimator;
  v4 = -[InAppDownloadTimeEstimator init](&v12, "init");
  if (v4)
  {
    dispatch_queue_t v5 = dispatch_queue_create("com.apple.storekit.time", 0LL);
    dispatchQueue = v4->_dispatchQueue;
    v4->_dispatchQueue = (OS_dispatch_queue *)v5;

    v4->_changeRate = -1.0;
    v4->_currentValue = 0LL;
    v4->_estimatedTimeRemaining = -1.0;
    v4->_maxValue = a3;
    v7 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
    times = v4->_times;
    v4->_times = v7;

    v9 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
    values = v4->_values;
    v4->_values = v9;
  }

  return v4;
}

- (double)estimatedTimeRemaining
{
  uint64_t v6 = 0LL;
  v7 = (double *)&v6;
  uint64_t v8 = 0x2020000000LL;
  unint64_t v9 = 0xBFF0000000000000LL;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_100006DD4;
  v5[3] = &unk_1002E6A00;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync((dispatch_queue_t)dispatchQueue, v5);
  double v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)setCurrentValue:(unint64_t)a3
{
  dispatchQueue = self->_dispatchQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_100006E40;
  v4[3] = &unk_1002E6A28;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync((dispatch_queue_t)dispatchQueue, v4);
}

- (void)_updateStatisticsFromSnapshots
{
  id v3 = -[NSMutableArray count](self->_times, "count");
  double v4 = -1.0;
  if ((unint64_t)v3 < 6)
  {
    double v18 = -1.0;
  }

  else
  {
    unint64_t v5 = (unint64_t)v3;
    double v6 = 0.0;
    for (uint64_t i = 1LL; i != v5; ++i)
    {
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](self->_times, "objectAtIndexedSubscript:", i));
      [v8 doubleValue];
      double v10 = v9;
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](self->_times, "objectAtIndexedSubscript:", i - 1));
      [v11 doubleValue];
      double v13 = v10 - v12;

      v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](self->_values, "objectAtIndexedSubscript:", i));
      v15 = [v14 longLongValue];
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](self->_values, "objectAtIndexedSubscript:", i - 1));
      uint64_t v17 = v15 - (_BYTE *)[v16 longLongValue];

      double v6 = v6 + (double)v17 / v13;
    }

    double v18 = v6 / (double)v5;
    if (v18 > 0.00000011920929)
    {
      int64_t v19 = self->_maxValue - self->_currentValue;
      if ((v19 & 0x8000000000000000LL) == 0) {
        double v4 = (double)v19 / v18;
      }
    }
  }

  self->_changeRate = v18;
  self->_estimatedTimeRemaining = v4;
}

- (void).cxx_destruct
{
}

@end
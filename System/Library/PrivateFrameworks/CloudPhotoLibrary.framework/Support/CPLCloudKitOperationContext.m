@interface CPLCloudKitOperationContext
- (BOOL)isCancelled;
- (BOOL)mightBeBlocked;
- (CKOperation)operation;
- (NSArray)bundleIdentifiers;
- (NSDate)lastBatchDate;
- (NSDate)startDate;
- (double)approximativeBlockedInterval;
- (double)progress;
- (id)extendedStatusDescriptionStrings;
- (id)operationDescription;
- (id)startDateDescriptionWithNow:(id)a3;
- (void)setBundleIdentifiers:(id)a3;
- (void)setCancelled:(BOOL)a3;
- (void)setLastBatchDate:(id)a3;
- (void)setOperation:(id)a3;
- (void)setProgress:(double)a3;
- (void)setStartDate:(id)a3;
@end

@implementation CPLCloudKitOperationContext

- (id)extendedStatusDescriptionStrings
{
  return 0LL;
}

- (id)operationDescription
{
  return 0LL;
}

- (id)startDateDescriptionWithNow:(id)a3
{
  id v4 = a3;
  v5 = v4;
  startDate = self->_startDate;
  if (startDate)
  {
    if (!v4)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
      startDate = self->_startDate;
    }

    [v5 timeIntervalSinceDate:startDate];
    v7 = self->_startDate;
    if (v8 <= 600.0) {
      uint64_t v9 = objc_claimAutoreleasedReturnValue( +[CPLDateFormatter stringForTimeIntervalAgo:now:]( &OBJC_CLASS___CPLDateFormatter,  "stringForTimeIntervalAgo:now:",  v7,  v5));
    }
    else {
      uint64_t v9 = objc_claimAutoreleasedReturnValue( +[CPLDateFormatter stringFromDateAgo:now:]( &OBJC_CLASS___CPLDateFormatter,  "stringFromDateAgo:now:",  v7,  v5));
    }
    v10 = (__CFString *)v9;
    firstProgressDate = self->_firstProgressDate;
    if (firstProgressDate)
    {
      -[NSDate timeIntervalSinceDate:](firstProgressDate, "timeIntervalSinceDate:", self->_startDate);
      double v13 = v12;
      if (v12 > 1.0)
      {
        v14 = objc_alloc(&OBJC_CLASS___NSString);
        v15 = (void *)objc_claimAutoreleasedReturnValue( +[CPLDateFormatter stringForTimeInterval:]( &OBJC_CLASS___CPLDateFormatter,  "stringForTimeInterval:",  v13));
        v16 = -[NSString initWithFormat:](v14, "initWithFormat:", @"%@ (blocked %@)", v10, v15);

        v10 = v16;
      }
    }

    if (self->_lastBatchDate)
    {
      v17 = objc_alloc(&OBJC_CLASS___NSString);
      v18 = (void *)objc_claimAutoreleasedReturnValue( +[CPLDateFormatter stringForTimeIntervalAgo:now:]( &OBJC_CLASS___CPLDateFormatter,  "stringForTimeIntervalAgo:now:",  self->_lastBatchDate,  v5));
      v19 = -[NSString initWithFormat:](v17, "initWithFormat:", @"%@ / last batch %@", v10, v18);

      v10 = v19;
    }
  }

  else
  {
    v10 = @"not started";
  }

  return v10;
}

- (void)setProgress:(double)a3
{
  v5 = (NSDate *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  lastProgressDate = self->_lastProgressDate;
  self->_lastProgressDate = v5;

  if (!self->_firstProgressDate) {
    objc_storeStrong((id *)&self->_firstProgressDate, self->_lastProgressDate);
  }
  double v7 = 2.22507386e-308;
  if (a3 != 0.0) {
    double v7 = a3;
  }
  self->_progress = v7;
}

- (double)approximativeBlockedInterval
{
  v3 = self->_startDate;
  lastProgressDate = self->_lastProgressDate;
  if (lastProgressDate)
  {
    v5 = lastProgressDate;

    v3 = v5;
  }

  if (self->_lastBatchDate)
  {
    uint64_t v6 = objc_claimAutoreleasedReturnValue(-[NSDate laterDate:](v3, "laterDate:"));

    v3 = (NSDate *)v6;
  }

  -[NSDate timeIntervalSinceNow](v3, "timeIntervalSinceNow");
  double v8 = -v7;

  return v8;
}

- (BOOL)mightBeBlocked
{
  return v2 > 10.0;
}

- (CKOperation)operation
{
  return (CKOperation *)objc_loadWeakRetained((id *)&self->_operation);
}

- (void)setOperation:(id)a3
{
}

- (NSArray)bundleIdentifiers
{
  return self->_bundleIdentifiers;
}

- (void)setBundleIdentifiers:(id)a3
{
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (void)setStartDate:(id)a3
{
}

- (NSDate)lastBatchDate
{
  return self->_lastBatchDate;
}

- (void)setLastBatchDate:(id)a3
{
}

- (double)progress
{
  return self->_progress;
}

- (BOOL)isCancelled
{
  return self->_cancelled;
}

- (void)setCancelled:(BOOL)a3
{
  self->_cancelled = a3;
}

- (void).cxx_destruct
{
}

@end
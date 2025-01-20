@interface OSLogPosition
- (NSDate)date;
- (OSLogPosition)initWithDate:(id)a3;
- (OSLogPosition)initWithEventSource:(id)a3 timeIntervalSinceEnd:(double)a4;
- (OSLogPosition)initWithTimeIntervalSinceLatestBoot:(double)a3;
- (double)offset;
- (int64_t)precision;
@end

@implementation OSLogPosition

- (OSLogPosition)initWithDate:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___OSLogPosition;
  v6 = -[OSLogPosition init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_precision = 1LL;
    objc_storeStrong((id *)&v6->_date, a3);
    v8 = v7;
  }

  return v7;
}

- (OSLogPosition)initWithEventSource:(id)a3 timeIntervalSinceEnd:(double)a4
{
  id v6 = a3;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___OSLogPosition;
  v7 = -[OSLogPosition init](&v14, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_precision = 1LL;
    [v6 newestDate];
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v10 = [v9 dateByAddingTimeInterval:a4];
    date = v8->_date;
    v8->_date = (NSDate *)v10;

    v12 = v8;
  }

  return v8;
}

- (OSLogPosition)initWithTimeIntervalSinceLatestBoot:(double)a3
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___OSLogPosition;
  v4 = -[OSLogPosition init](&v8, sel_init);
  id v5 = v4;
  if (v4)
  {
    v4->_precision = 2LL;
    v4->_offset = a3;
    id v6 = v4;
  }

  return v5;
}

- (int64_t)precision
{
  return self->_precision;
}

- (NSDate)date
{
  return self->_date;
}

- (double)offset
{
  return self->_offset;
}

- (void).cxx_destruct
{
}

@end
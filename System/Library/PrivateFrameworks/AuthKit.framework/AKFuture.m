@interface AKFuture
- (AKFuture)init;
- (AKFuture)initWithMaxWait:(double)a3 description:(id)a4;
- (BOOL)resolved;
- (NSCondition)valueCondition;
- (NSDate)beginDate;
- (NSMutableArray)internalWrapper;
- (double)maxWait;
- (id)value;
- (void)setBeginDate:(id)a3;
- (void)setInternalWrapper:(id)a3;
- (void)setMaxWait:(double)a3;
- (void)setResolved:(BOOL)a3;
- (void)setValue:(id)a3;
- (void)setValueCondition:(id)a3;
@end

@implementation AKFuture

- (AKFuture)init
{
  return -[AKFuture initWithMaxWait:description:](self, "initWithMaxWait:description:", 0LL, 0.0);
}

- (AKFuture)initWithMaxWait:(double)a3 description:(id)a4
{
  id v6 = a4;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___AKFuture;
  v7 = -[AKFuture init](&v15, "init");
  if (v7)
  {
    v8 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    internalWrapper = v7->_internalWrapper;
    v7->_internalWrapper = v8;

    v10 = objc_opt_new(&OBJC_CLASS___NSCondition);
    valueCondition = v7->_valueCondition;
    v7->_valueCondition = v10;

    -[NSCondition setName:](v7->_valueCondition, "setName:", v6);
    if (a3 > 0.0)
    {
      uint64_t v12 = objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
      beginDate = v7->_beginDate;
      v7->_beginDate = (NSDate *)v12;

      v7->_maxWait = a3;
    }
  }

  return v7;
}

- (void)setValue:(id)a3
{
  valueCondition = self->_valueCondition;
  id v5 = a3;
  -[NSCondition lock](valueCondition, "lock");
  -[NSMutableArray setObject:atIndexedSubscript:](self->_internalWrapper, "setObject:atIndexedSubscript:", v5, 0LL);

  self->_resolved = 1;
  -[NSCondition signal](self->_valueCondition, "signal");
  -[NSCondition unlock](self->_valueCondition, "unlock");
}

- (id)value
{
  while (!self->_resolved)
  {
    if (self->_maxWait > 0.0 && self->_beginDate)
    {
      v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
      [v3 timeIntervalSinceDate:self->_beginDate];
      double v5 = v4;

      if (self->_maxWait - v5 <= 0.0) {
        break;
      }
      id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](&OBJC_CLASS___NSDate, "dateWithTimeIntervalSinceNow:"));
      -[NSCondition waitUntilDate:](self->_valueCondition, "waitUntilDate:", v6);
    }

    else
    {
      -[NSCondition wait](self->_valueCondition, "wait");
    }
  }

  -[NSCondition unlock](self->_valueCondition, "unlock");
  return (id)objc_claimAutoreleasedReturnValue(-[NSMutableArray firstObject](self->_internalWrapper, "firstObject"));
}

- (BOOL)resolved
{
  return self->_resolved;
}

- (void)setResolved:(BOOL)a3
{
  self->_resolved = a3;
}

- (double)maxWait
{
  return self->_maxWait;
}

- (void)setMaxWait:(double)a3
{
  self->_maxWait = a3;
}

- (NSDate)beginDate
{
  return self->_beginDate;
}

- (void)setBeginDate:(id)a3
{
}

- (NSCondition)valueCondition
{
  return self->_valueCondition;
}

- (void)setValueCondition:(id)a3
{
}

- (NSMutableArray)internalWrapper
{
  return self->_internalWrapper;
}

- (void)setInternalWrapper:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
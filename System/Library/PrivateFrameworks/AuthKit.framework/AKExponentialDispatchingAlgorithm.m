@interface AKExponentialDispatchingAlgorithm
- (AKExponentialDispatchingAlgorithm)initWithBase:(double)a3 maxQueueSize:(unint64_t)a4;
- (BOOL)_incrementQueueSize;
- (NSString)debugDescription;
- (double)base;
- (id)nextCalculation;
- (unint64_t)maxQueueSize;
- (void)_decrementQueueSize;
- (void)_incrementCounter;
@end

@implementation AKExponentialDispatchingAlgorithm

- (AKExponentialDispatchingAlgorithm)initWithBase:(double)a3 maxQueueSize:(unint64_t)a4
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___AKExponentialDispatchingAlgorithm;
  result = -[AKExponentialDispatchingAlgorithm init](&v7, "init");
  if (result)
  {
    result->_base = a3;
    result->_maxQueueSize = a4;
  }

  return result;
}

- (id)nextCalculation
{
  if (!-[AKExponentialDispatchingAlgorithm _incrementQueueSize](self, "_incrementQueueSize")) {
    return 0LL;
  }
  -[AKExponentialDispatchingAlgorithm _incrementCounter](self, "_incrementCounter");
  v3 = +[NSDate dateWithTimeIntervalSinceNow:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceNow:",  pow(self->_base, (double)self->_counter));
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  objc_initWeak(&location, self);
  unint64_t counter = self->_counter;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_10001E8BC;
  v8[3] = &unk_1001C6EE8;
  objc_copyWeak(&v9, &location);
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[AKDispatchingCalculation calculationWithDate:counter:algorithm:relinquisher:]( &OBJC_CLASS___AKDispatchingCalculation,  "calculationWithDate:counter:algorithm:relinquisher:",  v4,  counter,  @"E",  v8));
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

  return v6;
}

- (NSString)debugDescription
{
  v3 = (objc_class *)objc_opt_class(self, a2);
  v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@: %p {\n\tbase: %f,\n\tmaxQueueSize: %lu,\n\t_counter: %lu,\n\t_queueSize: %lu,\n}>",  v5,  self,  *(void *)&self->_base,  self->_maxQueueSize,  self->_counter,  self->_queueSize));

  return (NSString *)v6;
}

- (void)_incrementCounter
{
  unint64_t counter = self->_counter;
  if (counter < self->_maxQueueSize) {
    self->_unint64_t counter = counter + 1;
  }
}

- (BOOL)_incrementQueueSize
{
  unint64_t queueSize = self->_queueSize;
  unint64_t maxQueueSize = self->_maxQueueSize;
  if (queueSize < maxQueueSize) {
    self->_unint64_t queueSize = queueSize + 1;
  }
  return queueSize < maxQueueSize;
}

- (void)_decrementQueueSize
{
  unint64_t queueSize = self->_queueSize;
  if (queueSize) {
    self->_unint64_t queueSize = queueSize - 1;
  }
}

- (double)base
{
  return self->_base;
}

- (unint64_t)maxQueueSize
{
  return self->_maxQueueSize;
}

@end
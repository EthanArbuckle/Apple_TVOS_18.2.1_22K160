@interface AKConstantDispatchingAlgorithm
- (AKConstantDispatchingAlgorithm)initWithDelay:(double)a3 maxQueueSize:(unint64_t)a4;
- (BOOL)_incrementQueueSize;
- (NSString)debugDescription;
- (double)delay;
- (id)nextCalculation;
- (unint64_t)maxQueueSize;
- (void)_decrementQueueSize;
@end

@implementation AKConstantDispatchingAlgorithm

- (AKConstantDispatchingAlgorithm)initWithDelay:(double)a3 maxQueueSize:(unint64_t)a4
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___AKConstantDispatchingAlgorithm;
  result = -[AKConstantDispatchingAlgorithm init](&v7, "init");
  if (result)
  {
    result->_delay = a3;
    result->_maxQueueSize = a4;
  }

  return result;
}

- (id)nextCalculation
{
  if (!-[AKConstantDispatchingAlgorithm _incrementQueueSize](self, "_incrementQueueSize")) {
    return 0LL;
  }
  ++self->_counter;
  -[AKConstantDispatchingAlgorithm delay](self, "delay");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](&OBJC_CLASS___NSDate, "dateWithTimeIntervalSinceNow:"));
  objc_initWeak(&location, self);
  unint64_t counter = self->_counter;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10001EB40;
  v7[3] = &unk_1001C6EE8;
  objc_copyWeak(&v8, &location);
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[AKDispatchingCalculation calculationWithDate:counter:algorithm:relinquisher:]( &OBJC_CLASS___AKDispatchingCalculation,  "calculationWithDate:counter:algorithm:relinquisher:",  v3,  counter,  @"D",  v7));
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);

  return v5;
}

- (NSString)debugDescription
{
  v3 = (objc_class *)objc_opt_class(self, a2);
  v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@: %p {\n\tdelay: %f,\n\tmaxQueueSize: %lu,\n\t_counter: %lu,\n\t_queueSize: %lu,\n}>",  v5,  self,  *(void *)&self->_delay,  self->_maxQueueSize,  self->_counter,  self->_queueSize));

  return (NSString *)v6;
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

- (double)delay
{
  return self->_delay;
}

- (unint64_t)maxQueueSize
{
  return self->_maxQueueSize;
}

@end
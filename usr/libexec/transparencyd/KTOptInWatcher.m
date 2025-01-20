@interface KTOptInWatcher
- (KTCondition)targetResolved;
- (KTOptInWatcher)initWithTargetState:(unint64_t)a3;
- (NSArray)loggableData;
- (NSError)error;
- (unint64_t)targetState;
- (void)setError:(id)a3;
- (void)setLoggableData:(id)a3;
- (void)setTargetResolved:(id)a3;
- (void)setTargetState:(unint64_t)a3;
@end

@implementation KTOptInWatcher

- (KTOptInWatcher)initWithTargetState:(unint64_t)a3
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___KTOptInWatcher;
  v4 = -[KTOptInWatcher init](&v8, "init");
  if (v4)
  {
    v5 = objc_alloc_init(&OBJC_CLASS___KTCondition);
    -[KTOptInWatcher setTargetResolved:](v4, "setTargetResolved:", v5);

    -[KTOptInWatcher setTargetState:](v4, "setTargetState:", a3);
    v6 = v4;
  }

  return v4;
}

- (unint64_t)targetState
{
  return self->_targetState;
}

- (void)setTargetState:(unint64_t)a3
{
  self->_targetState = a3;
}

- (KTCondition)targetResolved
{
  return (KTCondition *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setTargetResolved:(id)a3
{
}

- (NSError)error
{
  return (NSError *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setError:(id)a3
{
}

- (NSArray)loggableData
{
  return (NSArray *)objc_getProperty(self, a2, 32LL, 1);
}

- (void)setLoggableData:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
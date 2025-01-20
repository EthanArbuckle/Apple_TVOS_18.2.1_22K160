@interface PDExpressTransactionEvent
- (PDExpressTransactionEvent)init;
- (id)_initWithType:(int64_t)a3;
- (int64_t)type;
@end

@implementation PDExpressTransactionEvent

- (PDExpressTransactionEvent)init
{
  return 0LL;
}

- (id)_initWithType:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___PDExpressTransactionEvent;
  id result = -[PDExpressTransactionEvent init](&v5, "init");
  if (result) {
    *((void *)result + 1) = a3;
  }
  return result;
}

- (int64_t)type
{
  return self->_type;
}

@end
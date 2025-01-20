@interface PDExpressTransactionEventExited
- (PDExpressTransactionEventExited)init;
- (id)_initWithType:(int64_t)a3;
@end

@implementation PDExpressTransactionEventExited

- (id)_initWithType:(int64_t)a3
{
  return 0LL;
}

- (PDExpressTransactionEventExited)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___PDExpressTransactionEventExited;
  return (PDExpressTransactionEventExited *)-[PDExpressTransactionEvent _initWithType:](&v3, "_initWithType:", 1LL);
}

@end
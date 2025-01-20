@interface PaymentTransactionDeserializationContext
- (PaymentTransactionDeserializationContext)init;
- (void)dealloc;
@end

@implementation PaymentTransactionDeserializationContext

- (PaymentTransactionDeserializationContext)init
{
  return 0LL;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)&OBJC_CLASS___PaymentTransactionDeserializationContext;
  -[PaymentTransactionDeserializationContext dealloc](&v2, "dealloc");
}

- (void).cxx_destruct
{
}

@end
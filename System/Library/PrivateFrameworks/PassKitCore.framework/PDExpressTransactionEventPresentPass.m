@interface PDExpressTransactionEventPresentPass
- (NSString)applicationIdentifier;
- (NSString)keyIdentifier;
- (PDExpressTransactionEventPresentPass)init;
- (id)_initWithType:(int64_t)a3;
- (void)setApplicationIdentifier:(id)a3;
- (void)setKeyIdentifier:(id)a3;
@end

@implementation PDExpressTransactionEventPresentPass

- (id)_initWithType:(int64_t)a3
{
  return 0LL;
}

- (PDExpressTransactionEventPresentPass)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___PDExpressTransactionEventPresentPass;
  return (PDExpressTransactionEventPresentPass *)-[PDExpressTransactionEvent _initWithType:](&v3, "_initWithType:", 7LL);
}

- (NSString)applicationIdentifier
{
  return self->_applicationIdentifier;
}

- (void)setApplicationIdentifier:(id)a3
{
}

- (NSString)keyIdentifier
{
  return self->_keyIdentifier;
}

- (void)setKeyIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
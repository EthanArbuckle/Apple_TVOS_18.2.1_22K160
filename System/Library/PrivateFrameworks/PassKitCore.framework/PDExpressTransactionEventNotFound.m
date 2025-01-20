@interface PDExpressTransactionEventNotFound
- (NSString)applicationIdentifier;
- (NSString)keyIdentifier;
- (PDExpressTransactionEventNotFound)init;
- (id)_initWithType:(int64_t)a3;
- (void)setApplicationIdentifier:(id)a3;
- (void)setKeyIdentifier:(id)a3;
@end

@implementation PDExpressTransactionEventNotFound

- (id)_initWithType:(int64_t)a3
{
  return 0LL;
}

- (PDExpressTransactionEventNotFound)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___PDExpressTransactionEventNotFound;
  return (PDExpressTransactionEventNotFound *)-[PDExpressTransactionEvent _initWithType:](&v3, "_initWithType:", 5LL);
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
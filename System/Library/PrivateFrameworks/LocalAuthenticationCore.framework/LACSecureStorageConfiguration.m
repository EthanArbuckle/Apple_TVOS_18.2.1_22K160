@interface LACSecureStorageConfiguration
- (BOOL)bypassEntitlementChecks;
- (LACSecureStorageConfiguration)initWithBypassEntitlementChecks:(BOOL)a3;
@end

@implementation LACSecureStorageConfiguration

- (LACSecureStorageConfiguration)initWithBypassEntitlementChecks:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___LACSecureStorageConfiguration;
  result = -[LACSecureStorageConfiguration init](&v5, sel_init);
  if (result) {
    result->_bypassEntitlementChecks = a3;
  }
  return result;
}

- (BOOL)bypassEntitlementChecks
{
  return self->_bypassEntitlementChecks;
}

@end
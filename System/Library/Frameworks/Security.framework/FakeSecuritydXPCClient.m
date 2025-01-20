@interface FakeSecuritydXPCClient
- (FakeSecuritydXPCClient)init;
- (id)protocolWithSync:(BOOL)a3 errorHandler:(id)a4;
@end

@implementation FakeSecuritydXPCClient

- (FakeSecuritydXPCClient)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___FakeSecuritydXPCClient;
  return -[FakeSecuritydXPCClient init](&v3, sel_init);
}

- (id)protocolWithSync:(BOOL)a3 errorHandler:(id)a4
{
  else {
    return 0LL;
  }
}

@end
@interface CSDIncomingCallFilterDataSource
- (CSDIncomingCallFilterDataSource)init;
- (id)_callFilterIdentifier;
- (void)dealloc;
@end

@implementation CSDIncomingCallFilterDataSource

- (CSDIncomingCallFilterDataSource)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CSDIncomingCallFilterDataSource;
  return -[CSDIncomingCallFilterDataSource init](&v3, "init");
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)&OBJC_CLASS___CSDIncomingCallFilterDataSource;
  -[CSDIncomingCallFilterDataSource dealloc](&v2, "dealloc");
}

- (id)_callFilterIdentifier
{
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@.%@.%p",  TUBundleIdentifierCallServicesDaemon,  objc_opt_class(self, a2),  self);
}

@end
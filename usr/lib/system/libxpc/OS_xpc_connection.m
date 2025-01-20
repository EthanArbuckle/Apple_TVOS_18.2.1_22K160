@interface OS_xpc_connection
- (void)_xref_dispose;
@end

@implementation OS_xpc_connection

- (void)_xref_dispose
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___OS_xpc_connection;
  -[OS_object _xref_dispose](&v9, sel__xref_dispose);
}

@end
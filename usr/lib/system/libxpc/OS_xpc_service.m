@interface OS_xpc_service
- (void)_xref_dispose;
@end

@implementation OS_xpc_service

- (void)_xref_dispose
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___OS_xpc_service;
  -[OS_object _xref_dispose](&v3, sel__xref_dispose);
}

@end
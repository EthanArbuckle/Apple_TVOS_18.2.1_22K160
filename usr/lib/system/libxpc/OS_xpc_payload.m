@interface OS_xpc_payload
- (void)dealloc;
@end

@implementation OS_xpc_payload

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___OS_xpc_payload;
  -[OS_xpc_payload dealloc](&v3, sel_dealloc);
}

@end
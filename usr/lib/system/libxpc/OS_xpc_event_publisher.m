@interface OS_xpc_event_publisher
- (OS_xpc_event_publisher)init;
- (id)description;
- (void)_xref_dispose;
- (void)dealloc;
@end

@implementation OS_xpc_event_publisher

- (OS_xpc_event_publisher)init
{
  v2 = _xpc_asprintf("Calling -init", a2);
  _xpc_api_misuse(v2);
}

- (void)_xref_dispose
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___OS_xpc_event_publisher;
  -[OS_object _xref_dispose](&v3, sel__xref_dispose);
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___OS_xpc_event_publisher;
  -[OS_xpc_event_publisher dealloc](&v3, sel_dealloc);
}

- (id)description
{
  return 0LL;
}

@end
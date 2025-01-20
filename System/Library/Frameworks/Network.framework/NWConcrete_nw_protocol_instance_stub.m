@interface NWConcrete_nw_protocol_instance_stub
- (nw_protocol)getProtocolStructure;
- (void)dealloc;
@end

@implementation NWConcrete_nw_protocol_instance_stub

- (nw_protocol)getProtocolStructure
{
  return self->protocol;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)&OBJC_CLASS___NWConcrete_nw_protocol_instance_stub;
  -[NWConcrete_nw_protocol_instance_stub dealloc](&v2, sel_dealloc);
}

@end
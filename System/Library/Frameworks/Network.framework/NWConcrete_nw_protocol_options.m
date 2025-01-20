@interface NWConcrete_nw_protocol_options
- (void)dealloc;
@end

@implementation NWConcrete_nw_protocol_options

- (void)dealloc
{
  if (self->handle)
  {
    definition = self->definition;
    if (definition)
    {
      deallocate_options = (void (*)(void))definition->deallocate_options;
      if (deallocate_options) {
        deallocate_options();
      }
    }
  }

  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___NWConcrete_nw_protocol_options;
  -[NWConcrete_nw_protocol_options dealloc](&v5, sel_dealloc);
}

- (void).cxx_destruct
{
}

@end
@interface NWConcrete_nw_agent_client
- (void)dealloc;
@end

@implementation NWConcrete_nw_agent_client

- (void)dealloc
{
  if (self->framer_protocol)
  {
    id v3 = nw_parameters_copy_context(self->parameters);
    framer_protocol = self->framer_protocol;
    uint64_t v5 = MEMORY[0x1895F87A8];
    self->framer_protocol = 0LL;
    v7[0] = v5;
    v7[1] = 3221225472LL;
    v7[2] = __37__NWConcrete_nw_agent_client_dealloc__block_invoke;
    v7[3] = &__block_descriptor_40_e5_v8__0l;
    v7[4] = framer_protocol;
    nw_queue_context_async(v3, v7);
  }

  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___NWConcrete_nw_agent_client;
  -[NWConcrete_nw_agent_client dealloc](&v6, sel_dealloc);
}

- (void).cxx_destruct
{
}

@end
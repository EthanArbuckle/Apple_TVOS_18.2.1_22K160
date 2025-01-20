@interface NENexusFlowManager
- (void)dealloc;
@end

@implementation NENexusFlowManager

- (void)dealloc
{
  if (self)
  {
    protocol = self->_protocol;
    if (protocol)
    {
      free(protocol);
      self->_protocol = 0LL;
    }

    id v4 = objc_getProperty(self, a2, 8LL, 1);
    if (v4)
    {
      v5 = v4;
      v6 = (void *)nw_context_copy_implicit_context();
      uint64_t v9 = MEMORY[0x1895F87A8];
      uint64_t v10 = 3221225472LL;
      v11 = __29__NENexusFlowManager_dealloc__block_invoke;
      v12 = &unk_18A090390;
      id v13 = v5;
      id v7 = v5;
      nw_queue_context_async_if_needed();
    }
  }

  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___NENexusFlowManager;
  -[NENexusFlowManager dealloc](&v8, sel_dealloc);
}

- (void).cxx_destruct
{
}

uint64_t __29__NENexusFlowManager_dealloc__block_invoke()
{
  return nw_channel_close();
}

@end
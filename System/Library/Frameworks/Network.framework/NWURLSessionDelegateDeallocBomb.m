@interface NWURLSessionDelegateDeallocBomb
- (uint64_t)disarm;
- (void)dealloc;
@end

@implementation NWURLSessionDelegateDeallocBomb

- (void)dealloc
{
  uint64_t v28 = *MEMORY[0x1895F89C0];
  if (!self || !self->__disarmed)
  {
    uint64_t v14 = 0LL;
    __int128 v26 = 0u;
    __int128 v27 = 0u;
    __int128 v24 = 0u;
    __int128 v25 = 0u;
    __int128 v23 = 0u;
    v3 = (os_log_s *)MEMORY[0x1895F8DA0];
    id v4 = MEMORY[0x1895F8DA0];
    os_log_type_enabled(v3, OS_LOG_TYPE_ERROR);
    if (self)
    {
      Name = sel_getName(self->__method);
      object = self->__object;
    }

    else
    {
      Name = sel_getName(0LL);
      object = 0LL;
    }

    v7 = object;
    v8 = (void *)objc_opt_class();
    if (self)
    {
      v9 = self->__object;
      v10 = self->__object;
    }

    else
    {
      v9 = 0LL;
      v10 = 0LL;
    }

    int v15 = 136315906;
    v16 = Name;
    __int16 v17 = 2112;
    v18 = v8;
    __int16 v19 = 2112;
    v20 = v9;
    __int16 v21 = 2048;
    v22 = v10;
    id v11 = v8;
    v12 = (void *)MEMORY[0x1895F8DA0];
    _os_log_send_and_compose_impl();

    _os_crash_msg();
    __break(1u);
  }

  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___NWURLSessionDelegateDeallocBomb;
  -[NWURLSessionDelegateDeallocBomb dealloc](&v13, sel_dealloc);
}

- (void).cxx_destruct
{
}

- (uint64_t)disarm
{
  if (result)
  {
    uint64_t v1 = result;
    if (*(_BYTE *)(result + 8))
    {
      os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR);
      sel_getName(*(SEL *)(v1 + 24));
      id v2 = *(id *)(v1 + 16);
      v5 = (void *)objc_opt_class();
      id v3 = *(id *)(v1 + 16);
      id v4 = v5;
      _os_log_send_and_compose_impl();

      _os_crash_msg();
      __break(1u);
    }

    *(_BYTE *)(result + 8) = 1;
  }

  return result;
}

@end
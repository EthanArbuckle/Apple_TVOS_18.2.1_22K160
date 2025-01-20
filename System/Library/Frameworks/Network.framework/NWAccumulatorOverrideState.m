@interface NWAccumulatorOverrideState
- (NSString)name;
- (NSString)state;
- (NWAccumulatorOverrideState)init;
- (id)description;
- (void)setName:(id)a3;
- (void)setState:(id)a3;
- (void)updateWithState:(id)a3;
@end

@implementation NWAccumulatorOverrideState

- (NWAccumulatorOverrideState)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NWAccumulatorOverrideState;
  result = -[NWAccumulatorOverrideState init](&v3, sel_init);
  if (result) {
    result->_lock._os_unfair_lock_opaque = 0;
  }
  return result;
}

- (id)description
{
  id v3 = objc_alloc(NSString);
  v4 = -[NWAccumulatorOverrideState name](self, "name");
  v5 = -[NWAccumulatorOverrideState state](self, "state");
  v6 = (void *)[v3 initWithFormat:@"<NWAccumulatorOverrideState %@, state: %@>", v4, v5];

  return v6;
}

- (void)updateWithState:(id)a3
{
  uint64_t v22 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    p_lock = &self->_lock;
    v15[0] = MEMORY[0x1895F87A8];
    v15[1] = 3221225472LL;
    v15[2] = __46__NWAccumulatorOverrideState_updateWithState___block_invoke;
    v15[3] = &unk_189BC9238;
    v15[4] = self;
    id v7 = v4;
    v15[5] = v7;
    os_unfair_lock_lock(p_lock);
    __46__NWAccumulatorOverrideState_updateWithState___block_invoke((uint64_t)v15);
    os_unfair_lock_unlock(p_lock);

    goto LABEL_3;
  }

  __nwlog_obj();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)buf = 136446210;
  v19 = "-[NWAccumulatorOverrideState updateWithState:]";
  v9 = (char *)_os_log_send_and_compose_impl();

  os_log_type_t v17 = OS_LOG_TYPE_ERROR;
  char v16 = 0;
  if (__nwlog_fault(v9, &v17, &v16))
  {
    if (v17 == OS_LOG_TYPE_FAULT)
    {
      __nwlog_obj();
      v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_log_type_t v11 = v17;
      if (os_log_type_enabled(v10, v17))
      {
        *(_DWORD *)buf = 136446210;
        v19 = "-[NWAccumulatorOverrideState updateWithState:]";
        v12 = "%{public}s called with null state";
LABEL_17:
        _os_log_impl(&dword_181A5C000, v10, v11, v12, buf, 0xCu);
      }
    }

    else
    {
      if (v16)
      {
        backtrace_string = (char *)__nw_create_backtrace_string();
        __nwlog_obj();
        v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        os_log_type_t v11 = v17;
        BOOL v14 = os_log_type_enabled(v10, v17);
        if (backtrace_string)
        {
          if (v14)
          {
            *(_DWORD *)buf = 136446466;
            v19 = "-[NWAccumulatorOverrideState updateWithState:]";
            __int16 v20 = 2082;
            v21 = backtrace_string;
            _os_log_impl( &dword_181A5C000,  v10,  v11,  "%{public}s called with null state, dumping backtrace:%{public}s",  buf,  0x16u);
          }

          free(backtrace_string);
          goto LABEL_19;
        }

        if (!v14) {
          goto LABEL_18;
        }
        *(_DWORD *)buf = 136446210;
        v19 = "-[NWAccumulatorOverrideState updateWithState:]";
        v12 = "%{public}s called with null state, no backtrace";
        goto LABEL_17;
      }

      __nwlog_obj();
      v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_log_type_t v11 = v17;
      if (os_log_type_enabled(v10, v17))
      {
        *(_DWORD *)buf = 136446210;
        v19 = "-[NWAccumulatorOverrideState updateWithState:]";
        v12 = "%{public}s called with null state, backtrace limit exceeded";
        goto LABEL_17;
      }
    }

- (NSString)state
{
  return self->_state;
}

- (void)setState:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (void).cxx_destruct
{
}

void __46__NWAccumulatorOverrideState_updateWithState___block_invoke(uint64_t a1)
{
}

@end
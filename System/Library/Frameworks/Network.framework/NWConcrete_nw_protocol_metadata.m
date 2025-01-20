@interface NWConcrete_nw_protocol_metadata
- (id)initWithDefinition:(_OWORD *)a3 identifier:;
- (void)dealloc;
@end

@implementation NWConcrete_nw_protocol_metadata

- (id)initWithDefinition:(_OWORD *)a3 identifier:
{
  uint64_t v35 = *MEMORY[0x1895F89C0];
  v6 = a2;
  v7 = v6;
  if (!a1) {
    goto LABEL_6;
  }
  if (!v6)
  {
    __nwlog_obj();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136446210;
    v32 = "-[NWConcrete_nw_protocol_metadata initWithDefinition:identifier:]";
    v13 = (char *)_os_log_send_and_compose_impl();

    os_log_type_t type = OS_LOG_TYPE_ERROR;
    char v29 = 0;
    if (__nwlog_fault(v13, &type, &v29))
    {
      if (type == OS_LOG_TYPE_FAULT)
      {
        __nwlog_obj();
        v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        os_log_type_t v15 = type;
        if (os_log_type_enabled(v14, type))
        {
          *(_DWORD *)buf = 136446210;
          v32 = "-[NWConcrete_nw_protocol_metadata initWithDefinition:identifier:]";
          _os_log_impl(&dword_181A5C000, v14, v15, "%{public}s called with null _definition", buf, 0xCu);
        }
      }

      else if (v29)
      {
        backtrace_string = (char *)__nw_create_backtrace_string();
        __nwlog_obj();
        v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        os_log_type_t v21 = type;
        BOOL v22 = os_log_type_enabled(v14, type);
        if (backtrace_string)
        {
          if (v22)
          {
            *(_DWORD *)buf = 136446466;
            v32 = "-[NWConcrete_nw_protocol_metadata initWithDefinition:identifier:]";
            __int16 v33 = 2082;
            v34 = backtrace_string;
            _os_log_impl( &dword_181A5C000,  v14,  v21,  "%{public}s called with null _definition, dumping backtrace:%{public}s",  buf,  0x16u);
          }

          free(backtrace_string);
          goto LABEL_39;
        }

        if (v22)
        {
          *(_DWORD *)buf = 136446210;
          v32 = "-[NWConcrete_nw_protocol_metadata initWithDefinition:identifier:]";
          _os_log_impl(&dword_181A5C000, v14, v21, "%{public}s called with null _definition, no backtrace", buf, 0xCu);
        }
      }

      else
      {
        __nwlog_obj();
        v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        os_log_type_t v26 = type;
        if (os_log_type_enabled(v14, type))
        {
          *(_DWORD *)buf = 136446210;
          v32 = "-[NWConcrete_nw_protocol_metadata initWithDefinition:identifier:]";
          _os_log_impl( &dword_181A5C000,  v14,  v26,  "%{public}s called with null _definition, backtrace limit exceeded",  buf,  0xCu);
        }
      }
    }

- (void)dealloc
{
  if (self->handle)
  {
    definition = self->definition;
    if (definition)
    {
      deallocate_metadata = (void (*)(void))definition->deallocate_metadata;
      if (deallocate_metadata
        || (extended_state = definition->extended_state) != 0LL
        && (deallocate_metadata = (void (*)(void))extended_state->var30) != 0LL)
      {
        deallocate_metadata();
      }
    }
  }

  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___NWConcrete_nw_protocol_metadata;
  -[NWConcrete_nw_protocol_metadata dealloc](&v6, sel_dealloc);
}

- (void).cxx_destruct
{
}

@end
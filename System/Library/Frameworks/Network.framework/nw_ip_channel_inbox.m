@interface nw_ip_channel_inbox
- (BOOL)cancel;
- (id)description;
- (id)initWithPath:(void *)a3 flow:(void *)a4 parameters:(void *)a5 delegate:;
@end

@implementation nw_ip_channel_inbox

- (id)description
{
  uint64_t v6 = 0LL;
  v7 = &v6;
  uint64_t v8 = 0x3032000000LL;
  v9 = __Block_byref_object_copy__52210;
  v10 = __Block_byref_object_dispose__52211;
  id v11 = 0LL;
  p_lock = &self->super._lock;
  v5[0] = MEMORY[0x1895F87A8];
  v5[1] = 3221225472LL;
  v5[2] = __34__nw_ip_channel_inbox_description__block_invoke;
  v5[3] = &unk_189BC9210;
  v5[4] = self;
  v5[5] = &v6;
  os_unfair_lock_lock(&self->super._lock);
  __34__nw_ip_channel_inbox_description__block_invoke((uint64_t)v5);
  os_unfair_lock_unlock(p_lock);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (BOOL)cancel
{
  p_protocol = &self->_protocol;
  output_handler = self->_protocol.output_handler;
  if (output_handler) {
    ((void (*)(void))output_handler->callbacks->remove_input_handler)();
  }
  handle = p_protocol->handle;
  if (handle)
  {
    p_protocol->handle = 0LL;
  }

  return 0;
}

- (void).cxx_destruct
{
}

- (id)initWithPath:(void *)a3 flow:(void *)a4 parameters:(void *)a5 delegate:
{
  uint64_t v141 = *MEMORY[0x1895F89C0];
  id v10 = a2;
  id v11 = a3;
  id v134 = a4;
  id v12 = a5;
  v13 = v12;
  v133 = v10;
  if (!a1) {
    goto LABEL_103;
  }
  if (!v10)
  {
    __nwlog_obj();
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136446210;
    *(void *)&buf[4] = "-[nw_ip_channel_inbox initWithPath:flow:parameters:delegate:]";
    v79 = (char *)_os_log_send_and_compose_impl();

    uu[0] = OS_LOG_TYPE_ERROR;
    char v136 = 0;
    if (__nwlog_fault(v79, uu, &v136))
    {
      if (uu[0] == OS_LOG_TYPE_FAULT)
      {
        __nwlog_obj();
        v80 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        os_log_type_t v81 = uu[0];
        if (os_log_type_enabled(v80, uu[0]))
        {
          *(_DWORD *)buf = 136446210;
          *(void *)&buf[4] = "-[nw_ip_channel_inbox initWithPath:flow:parameters:delegate:]";
          _os_log_impl(&dword_181A5C000, v80, v81, "%{public}s called with null path", buf, 0xCu);
        }
      }

      else if (v136)
      {
        backtrace_string = (char *)__nw_create_backtrace_string();
        __nwlog_obj();
        v80 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        os_log_type_t v95 = uu[0];
        BOOL v96 = os_log_type_enabled(v80, uu[0]);
        if (backtrace_string)
        {
          if (v96)
          {
            *(_DWORD *)buf = 136446466;
            *(void *)&buf[4] = "-[nw_ip_channel_inbox initWithPath:flow:parameters:delegate:]";
            *(_WORD *)&buf[12] = 2082;
            *(void *)&buf[14] = backtrace_string;
            _os_log_impl( &dword_181A5C000,  v80,  v95,  "%{public}s called with null path, dumping backtrace:%{public}s",  buf,  0x16u);
          }

          free(backtrace_string);
          goto LABEL_188;
        }

        if (v96)
        {
          *(_DWORD *)buf = 136446210;
          *(void *)&buf[4] = "-[nw_ip_channel_inbox initWithPath:flow:parameters:delegate:]";
          _os_log_impl(&dword_181A5C000, v80, v95, "%{public}s called with null path, no backtrace", buf, 0xCu);
        }
      }

      else
      {
        __nwlog_obj();
        v80 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        os_log_type_t v121 = uu[0];
        if (os_log_type_enabled(v80, uu[0]))
        {
          *(_DWORD *)buf = 136446210;
          *(void *)&buf[4] = "-[nw_ip_channel_inbox initWithPath:flow:parameters:delegate:]";
          _os_log_impl( &dword_181A5C000,  v80,  v121,  "%{public}s called with null path, backtrace limit exceeded",  buf,  0xCu);
        }
      }
    }

@end
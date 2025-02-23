@interface NWConcrete_nw_custom_endpoint
- (BOOL)isEqualToEndpoint:(id)a3 matchFlags:(unsigned __int8)a4;
- (char)createDescription:(BOOL)a3;
- (id)copyDictionary;
- (id)copyEndpoint;
- (unint64_t)getHash;
- (unsigned)type;
@end

@implementation NWConcrete_nw_custom_endpoint

- (unsigned)type
{
  return self->type;
}

- (id)copyDictionary
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
  networkd_settings_init();
  id v2 = (id)gLogObj;
  *(_DWORD *)buf = 136446210;
  v16 = "-[NWConcrete_nw_custom_endpoint copyDictionary]";
  v3 = (char *)_os_log_send_and_compose_impl();

  os_log_type_t type = OS_LOG_TYPE_ERROR;
  char v13 = 0;
  if (__nwlog_fault(v3, &type, &v13))
  {
    if (type == OS_LOG_TYPE_FAULT)
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v4 = (os_log_s *)(id)gLogObj;
      os_log_type_t v5 = type;
      if (!os_log_type_enabled(v4, type)) {
        goto LABEL_17;
      }
      *(_DWORD *)buf = 136446210;
      v16 = "-[NWConcrete_nw_custom_endpoint copyDictionary]";
      v6 = "%{public}s copyDictionary not supported";
LABEL_15:
      v11 = v4;
      os_log_type_t v12 = v5;
      goto LABEL_16;
    }

    if (!v13)
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v4 = (os_log_s *)(id)gLogObj;
      os_log_type_t v5 = type;
      if (!os_log_type_enabled(v4, type)) {
        goto LABEL_17;
      }
      *(_DWORD *)buf = 136446210;
      v16 = "-[NWConcrete_nw_custom_endpoint copyDictionary]";
      v6 = "%{public}s copyDictionary not supported, backtrace limit exceeded";
      goto LABEL_15;
    }

    backtrace_string = (char *)__nw_create_backtrace_string();
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v4 = (os_log_s *)(id)gLogObj;
    os_log_type_t v8 = type;
    BOOL v9 = os_log_type_enabled(v4, type);
    if (!backtrace_string)
    {
      if (!v9)
      {
LABEL_17:

        if (!v3) {
          return 0LL;
        }
        goto LABEL_11;
      }

      *(_DWORD *)buf = 136446210;
      v16 = "-[NWConcrete_nw_custom_endpoint copyDictionary]";
      v6 = "%{public}s copyDictionary not supported, no backtrace";
      v11 = v4;
      os_log_type_t v12 = v8;
LABEL_16:
      _os_log_impl(&dword_181A5C000, v11, v12, v6, buf, 0xCu);
      goto LABEL_17;
    }

    if (v9)
    {
      *(_DWORD *)buf = 136446466;
      v16 = "-[NWConcrete_nw_custom_endpoint copyDictionary]";
      __int16 v17 = 2082;
      v18 = backtrace_string;
      _os_log_impl( &dword_181A5C000,  v4,  v8,  "%{public}s copyDictionary not supported, dumping backtrace:%{public}s",  buf,  0x16u);
    }

    free(backtrace_string);
  }

  if (v3) {
LABEL_11:
  }
    free(v3);
  return 0LL;
}

- (char)createDescription:(BOOL)a3
{
  v6 = 0LL;
  unsigned int type = self->type;
  data = (dispatch_data_s *)self->data;
  if (data) {
    data = (dispatch_data_s *)dispatch_data_get_size(data);
  }
  asprintf(&v6, "<type:%u,length:%zu>", type, (size_t)data);
  return v6;
}

- (BOOL)isEqualToEndpoint:(id)a3 matchFlags:(unsigned __int8)a4
{
  uint64_t v4 = a4;
  v6 = (NWConcrete_nw_custom_endpoint *)a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___NWConcrete_nw_custom_endpoint;
  BOOL v7 = -[NWConcrete_nw_endpoint isEqualToEndpoint:matchFlags:](&v9, sel_isEqualToEndpoint_matchFlags_, v6, v4)
    && !self->resolver_block
    && !v6->resolver_block
    && (self == v6 || nw_dispatch_data_is_equal((dispatch_data_t)self->data, (dispatch_data_s *)v6->data));

  return v7;
}

- (id)copyEndpoint
{
  return nw_endpoint_create_custom(self->type, self->data, self->resolver_block);
}

- (unint64_t)getHash
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  uint64_t v9 = 0LL;
  v10 = &v9;
  uint64_t v11 = 0x9812000000LL;
  os_log_type_t v12 = __Block_byref_object_copy__25636;
  char v13 = __Block_byref_object_dispose__25637;
  v14 = &unk_18296448D;
  memset(&v15, 0, sizeof(v15));
  CC_SHA256_Init(&v15);
  CC_SHA256_Update((CC_SHA256_CTX *)(v10 + 6), &self->type, 4u);
  data = (dispatch_data_s *)self->data;
  applier[0] = MEMORY[0x1895F87A8];
  applier[1] = 3221225472LL;
  applier[2] = __40__NWConcrete_nw_custom_endpoint_getHash__block_invoke;
  applier[3] = &unk_189BB9C38;
  applier[4] = &v9;
  dispatch_data_apply(data, applier);
  CC_SHA256_Final(md, (CC_SHA256_CTX *)(v10 + 6));
  int8x16_t v6 = *(int8x16_t *)md;
  int8x16_t v7 = v17;
  _Block_object_dispose(&v9, 8);
  int8x16_t v4 = veorq_s8(v6, v7);
  return (unint64_t)veor_s8(*(int8x8_t *)v4.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v4, v4, 8uLL));
}

- (void).cxx_destruct
{
}

@end
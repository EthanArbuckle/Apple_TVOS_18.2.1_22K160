@interface NWConcrete_nw_endpoint
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToEndpoint:(id)a3 matchFlags:(unsigned __int8)a4;
- (NSString)description;
- (NWConcrete_nw_endpoint)init;
- (OS_dispatch_data)echConfig;
- (char)createDescription:(BOOL)a3;
- (const)domainForPolicy;
- (const)hostname;
- (id).cxx_construct;
- (id)copyDictionary;
- (id)copyEndpoint;
- (id)redactedDescription;
- (unint64_t)getHash;
- (unsigned)port;
- (unsigned)priority;
- (unsigned)type;
- (unsigned)weight;
- (void)dealloc;
- (void)setEchConfig:(id)a3;
- (void)setPriority:(unsigned __int16)a3;
- (void)setWeight:(unsigned __int16)a3;
@end

@implementation NWConcrete_nw_endpoint

- (id).cxx_construct
{
  *((void *)self + 18) = 0LL;
  *((void *)self + 19) = 0LL;
  return self;
}

- (NWConcrete_nw_endpoint)init
{
  uint64_t v25 = *MEMORY[0x1895F89C0];
  v20.receiver = self;
  v20.super_class = (Class)&OBJC_CLASS___NWConcrete_nw_endpoint;
  v2 = -[NWConcrete_nw_endpoint init](&v20, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->alternative_list.tqh_first = 0LL;
    v2->alternative_list.tqh_last = &v2->alternative_list.tqh_first;
    *(void *)&v2->endpoint_lock._os_unfair_lock_opaque = 0LL;
    context = v2->context;
    v2->context = 0LL;

    cname_array = v3->cname_array;
    v3->cname_array = 0LL;

    v3->selected_key = 0;
    *((_BYTE *)v3 + 231) &= 0xC3u;
    endpoint = v3->first_alternative.endpoint;
    v3->first_alternative.endpoint = 0LL;

    applicable_protocol = v3->first_alternative.applicable_protocol;
    v3->first_alternative.applicable_protocol = 0LL;

    v8 = v3;
    goto LABEL_3;
  }

  __nwlog_obj();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)buf = 136446210;
  v22 = "-[NWConcrete_nw_endpoint init]";
  v11 = (char *)_os_log_send_and_compose_impl();

  os_log_type_t type = OS_LOG_TYPE_ERROR;
  char v18 = 0;
  if (__nwlog_fault(v11, &type, &v18))
  {
    if (type == OS_LOG_TYPE_FAULT)
    {
      __nwlog_obj();
      v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_log_type_t v13 = type;
      if (os_log_type_enabled(v12, type))
      {
        *(_DWORD *)buf = 136446210;
        v22 = "-[NWConcrete_nw_endpoint init]";
        _os_log_impl(&dword_181A5C000, v12, v13, "%{public}s [super init] failed", buf, 0xCu);
      }
    }

    else if (v18)
    {
      backtrace_string = (char *)__nw_create_backtrace_string();
      __nwlog_obj();
      v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_log_type_t v15 = type;
      BOOL v16 = os_log_type_enabled(v12, type);
      if (backtrace_string)
      {
        if (v16)
        {
          *(_DWORD *)buf = 136446466;
          v22 = "-[NWConcrete_nw_endpoint init]";
          __int16 v23 = 2082;
          v24 = backtrace_string;
          _os_log_impl( &dword_181A5C000,  v12,  v15,  "%{public}s [super init] failed, dumping backtrace:%{public}s",  buf,  0x16u);
        }

        free(backtrace_string);
        goto LABEL_20;
      }

      if (v16)
      {
        *(_DWORD *)buf = 136446210;
        v22 = "-[NWConcrete_nw_endpoint init]";
        _os_log_impl(&dword_181A5C000, v12, v15, "%{public}s [super init] failed, no backtrace", buf, 0xCu);
      }
    }

    else
    {
      __nwlog_obj();
      v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_log_type_t v17 = type;
      if (os_log_type_enabled(v12, type))
      {
        *(_DWORD *)buf = 136446210;
        v22 = "-[NWConcrete_nw_endpoint init]";
        _os_log_impl(&dword_181A5C000, v12, v17, "%{public}s [super init] failed, backtrace limit exceeded", buf, 0xCu);
      }
    }
  }

- (void)dealloc
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  nw_endpoint_clear_alternatives(self);
  associations = self->associations;
  if (associations)
  {
    if (!*((_DWORD *)associations + 10)) {
      goto LABEL_5;
    }
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v5 = (os_log_s *)(id)gLogObj;
    os_log_type_enabled(v5, OS_LOG_TYPE_ERROR);
    int v15 = 136446466;
    BOOL v16 = "-[NWConcrete_nw_endpoint dealloc]";
    __int16 v17 = 2082;
    logging_description = nw_endpoint_get_logging_description(self);
    v6 = (void *)_os_log_send_and_compose_impl();

    if (__nwlog_abort((uint64_t)v6))
    {
      __break(1u);
      return;
    }

    free(v6);
    associations = self->associations;
    if (associations)
    {
LABEL_5:
      _nw_hash_table_release((os_unfair_lock_s *)associations, v3);
      self->associations = 0LL;
    }
  }

  known_tracker_name = self->known_tracker_name;
  if (known_tracker_name)
  {
    free(known_tracker_name);
    self->known_tracker_name = 0LL;
  }

  tracker_owner = self->tracker_owner;
  if (tracker_owner)
  {
    free(tracker_owner);
    self->tracker_owner = 0LL;
  }

  device_id = self->device_id;
  if (device_id)
  {
    free(device_id);
    self->device_id = 0LL;
  }

  registrar = self->registrar;
  self->registrar = 0LL;

  uint64_t v11 = MEMORY[0x1895F87A8];
  v14[0] = MEMORY[0x1895F87A8];
  v14[1] = 3221225472LL;
  v14[2] = __33__NWConcrete_nw_endpoint_dealloc__block_invoke;
  v14[3] = &unk_189BC93A0;
  v14[4] = self;
  nw_endpoint_locked(self, v14);
  v13[0] = v11;
  v13[1] = 3221225472LL;
  v13[2] = __33__NWConcrete_nw_endpoint_dealloc__block_invoke_2;
  v13[3] = &unk_189BC93A0;
  v13[4] = self;
  os_unfair_lock_lock(&self->description_lock);
  __33__NWConcrete_nw_endpoint_dealloc__block_invoke_2((uint64_t)v13);
  os_unfair_lock_unlock(&self->description_lock);
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___NWConcrete_nw_endpoint;
  -[NWConcrete_nw_endpoint dealloc](&v12, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->cname_array, 0LL);
  objc_storeStrong((id *)&self->parent_endpoint, 0LL);
  objc_storeStrong((id *)&self->ns_redacted_description, 0LL);
  objc_storeStrong((id *)&self->ns_description, 0LL);
  objc_storeStrong((id *)&self->public_keys, 0LL);
  objc_storeStrong((id *)&self->interface, 0LL);
  objc_storeStrong((id *)&self->context, 0LL);
}

- (BOOL)isEqualToEndpoint:(id)a3 matchFlags:(unsigned __int8)a4
{
  uint64_t v4 = a4;
  uint64_t v38 = *MEMORY[0x1895F89C0];
  v6 = (NWConcrete_nw_endpoint *)a3;
  unsigned int v7 = -[NWConcrete_nw_endpoint type](self, "type");
  if ((v4 & 1) != 0)
  {
    interface = self->interface;
    v9 = v6->interface;
    if (v9) {
      LODWORD(v9) = *((_DWORD *)v9 + 2);
    }
  }

  if (!nw_txt_record_is_equal(self->txt_record, v6->txt_record)) {
    goto LABEL_49;
  }
  if ((v4 & 2) != 0)
  {
    signature = v6->signature;
    os_log_type_t v13 = self->signature;
    v14 = signature;
    int v15 = v14;
    BOOL v16 = v13 == v14;
    if (v13 != v14 && v13 && v14) {
      BOOL v16 = xpc_equal(v13, v14);
    }

    if (!v16) {
      goto LABEL_49;
    }
    parent_endpoint = v6->parent_endpoint;
    if (parent_endpoint || self->parent_endpoint)
    {
      int v18 = *((unsigned __int8 *)v6 + 231);
      int v19 = *((unsigned __int8 *)self + 231);
      if (((v18 | v19) & 2) == 0) {
        goto LABEL_64;
      }
      if (((v19 ^ v18) & 2) != 0) {
        goto LABEL_49;
      }
      if ((v4 & 4) != 0)
      {
LABEL_64:
        objc_super v20 = self->parent_endpoint;
        if (!v20) {
          goto LABEL_49;
        }
        if (parent_endpoint == v6 || v20 == self)
        {
          __nwlog_obj();
          v21 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          os_log_type_enabled(v21, OS_LOG_TYPE_ERROR);
          *(_DWORD *)uu = 136446210;
          *(void *)&uu[4] = "-[NWConcrete_nw_endpoint isEqualToEndpoint:matchFlags:]";
          LODWORD(v35) = 12;
          v34 = uu;
          v22 = (void *)_os_log_send_and_compose_impl();

          BOOL v23 = __nwlog_abort((uint64_t)v22);
          if (v23)
          {
LABEL_60:
            __break(1u);
            return v23;
          }

          free(v22);
          parent_endpoint = v6->parent_endpoint;
          objc_super v20 = self->parent_endpoint;
        }

        if (!-[NWConcrete_nw_endpoint isEqualToEndpoint:matchFlags:]( parent_endpoint,  "isEqualToEndpoint:matchFlags:",  v20,  v4,  v34,  v35)) {
          goto LABEL_49;
        }
      }
    }
  }

  if ((v4 & 8) != 0)
  {
    tqh_first = self->alternative_list.tqh_first;
    unint64_t v11 = (unint64_t)v6->alternative_list.tqh_first;
    if (v11 | (unint64_t)tqh_first)
    {
      while (1)
      {
        char v25 = 0;
        if (!v11 || !tqh_first) {
          goto LABEL_50;
        }
        if (*(OS_nw_protocol_definition **)(v11 + 24) != tqh_first->applicable_protocol) {
          goto LABEL_49;
        }
        v26 = *(NWConcrete_nw_endpoint **)(v11 + 16);
        if (v26 == v6 || (endpoint = tqh_first->endpoint, endpoint == self))
        {
          pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
          networkd_settings_init();
          v27 = (os_log_s *)(id)gLogObj;
          os_log_type_enabled(v27, OS_LOG_TYPE_ERROR);
          *(_DWORD *)uu = 136446210;
          *(void *)&uu[4] = "-[NWConcrete_nw_endpoint isEqualToEndpoint:matchFlags:]";
          v28 = (void *)_os_log_send_and_compose_impl();

          BOOL v23 = __nwlog_abort((uint64_t)v28);
          if (v23) {
            goto LABEL_60;
          }
          free(v28);
          v26 = *(NWConcrete_nw_endpoint **)(v11 + 16);
          endpoint = tqh_first->endpoint;
        }

        if (!-[NWConcrete_nw_endpoint isEqualToEndpoint:matchFlags:]( v26,  "isEqualToEndpoint:matchFlags:",  endpoint,  v4)) {
          goto LABEL_49;
        }
LABEL_34:
        tqh_first = tqh_first->chain.tqe_next;
        unint64_t v11 = *(void *)v11;
      }

      endpoint = (NWConcrete_nw_endpoint *)&__block_literal_global_6237;
LABEL_33:
      goto LABEL_34;
    }

- (unsigned)weight
{
  return 0;
}

- (const)domainForPolicy
{
  return 0LL;
}

- (id)copyDictionary
{
  uint64_t v38 = *MEMORY[0x1895F89C0];
  xpc_object_t v3 = xpc_dictionary_create(0LL, 0LL, 0LL);
  if (v3)
  {
    xpc_dictionary_set_uint64(v3, "type", -[NWConcrete_nw_endpoint type](self, "type"));
    if ((*((_BYTE *)self + 231) & 1) != 0) {
      xpc_dictionary_set_BOOL(v3, "is_local_domain", 1);
    }
    interface = self->interface;
    if (interface)
    {
      v5 = nw_interface_copy_dictionary(interface);
      if (v5) {
        xpc_dictionary_set_value(v3, "interface", v5);
      }
    }

    if (self->alternate_port) {
      xpc_dictionary_set_uint64(v3, "alternate_port", self->alternate_port);
    }
    if (!uuid_is_null(self->agent_identifier)) {
      xpc_dictionary_set_uuid(v3, "agent_identifier", self->agent_identifier);
    }
    txt_record = self->txt_record;
    if (txt_record) {
      xpc_dictionary_set_data(v3, "txt_record", *((const void **)txt_record + 1), *((void *)txt_record + 2));
    }
    signature = self->signature;
    if (signature) {
      xpc_dictionary_set_value(v3, "signature", signature);
    }
    device_id = self->device_id;
    if (device_id) {
      xpc_dictionary_set_string(v3, "device_id", device_id);
    }
    public_keys = self->public_keys;
    if (public_keys)
    {
      v10 = public_keys;
      xpc_object_t empty = xpc_array_create_empty();
      __int128 v29 = 0u;
      __int128 v30 = 0u;
      __int128 v27 = 0u;
      __int128 v28 = 0u;
      objc_super v12 = v10;
      uint64_t v13 = -[NSArray countByEnumeratingWithState:objects:count:]( v12,  "countByEnumeratingWithState:objects:count:",  &v27,  v33,  16LL);
      if (v13)
      {
        uint64_t v14 = *(void *)v28;
        do
        {
          for (uint64_t i = 0LL; i != v13; ++i)
          {
            if (*(void *)v28 != v14) {
              objc_enumerationMutation(v12);
            }
            xpc_object_t v16 = xpc_data_create( (const void *)[*(id *)(*((void *)&v27 + 1) + 8 * i) bytes],  objc_msgSend(*(id *)(*((void *)&v27 + 1) + 8 * i), "length"));
            xpc_array_append_value(empty, v16);
          }

          uint64_t v13 = -[NSArray countByEnumeratingWithState:objects:count:]( v12,  "countByEnumeratingWithState:objects:count:",  &v27,  v33,  16LL);
        }

        while (v13);
      }

      xpc_dictionary_set_value(v3, "public_keys", empty);
    }

    id v17 = v3;
    goto LABEL_47;
  }

  pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
  networkd_settings_init();
  id v18 = (id)gLogObj;
  *(_DWORD *)buf = 136446210;
  uint64_t v35 = "-[NWConcrete_nw_endpoint copyDictionary]";
  int v19 = (char *)_os_log_send_and_compose_impl();

  os_log_type_t type = OS_LOG_TYPE_ERROR;
  char v31 = 0;
  if (type == OS_LOG_TYPE_FAULT)
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    objc_super v20 = (os_log_s *)(id)gLogObj;
    os_log_type_t v21 = type;
    if (os_log_type_enabled(v20, type))
    {
      *(_DWORD *)buf = 136446210;
      uint64_t v35 = "-[NWConcrete_nw_endpoint copyDictionary]";
      _os_log_impl(&dword_181A5C000, v20, v21, "%{public}s xpc_dictionary_create failed", buf, 0xCu);
    }

- (NSString)description
{
  uint64_t v6 = 0LL;
  unsigned int v7 = &v6;
  uint64_t v8 = 0x3032000000LL;
  v9 = __Block_byref_object_copy__6408;
  v10 = __Block_byref_object_dispose__6409;
  id v11 = 0LL;
  p_description_lock = &self->description_lock;
  v5[0] = MEMORY[0x1895F87A8];
  v5[1] = 3221225472LL;
  v5[2] = __37__NWConcrete_nw_endpoint_description__block_invoke;
  v5[3] = &unk_189BC9210;
  v5[4] = self;
  v5[5] = &v6;
  os_unfair_lock_lock(&self->description_lock);
  __37__NWConcrete_nw_endpoint_description__block_invoke((uint64_t)v5);
  os_unfair_lock_unlock(p_description_lock);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSString *)v3;
}

- (unsigned)type
{
  return 0;
}

- (const)hostname
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
  networkd_settings_init();
  id v3 = (os_log_s *)(id)gLogObj;
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    int v5 = 136446466;
    uint64_t v6 = "-[NWConcrete_nw_endpoint hostname]";
    __int16 v7 = 1024;
    unsigned int v8 = -[NWConcrete_nw_endpoint type](self, "type");
    _os_log_impl( &dword_181A5C000,  v3,  OS_LOG_TYPE_ERROR,  "%{public}s endpoint type %u does not support hostname",  (uint8_t *)&v5,  0x12u);
  }

  return 0LL;
}

- (unsigned)port
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
  networkd_settings_init();
  id v3 = (os_log_s *)(id)gLogObj;
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    int v5 = 136446466;
    uint64_t v6 = "-[NWConcrete_nw_endpoint port]";
    __int16 v7 = 1024;
    unsigned int v8 = -[NWConcrete_nw_endpoint type](self, "type");
    _os_log_impl( &dword_181A5C000,  v3,  OS_LOG_TYPE_ERROR,  "%{public}s endpoint type %u does not support port",  (uint8_t *)&v5,  0x12u);
  }

  return 0;
}

- (unsigned)priority
{
  return 0;
}

- (void)setPriority:(unsigned __int16)a3
{
  uint64_t v25 = *MEMORY[0x1895F89C0];
  pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
  networkd_settings_init();
  id v4 = (id)gLogObj;
  *(_DWORD *)buf = 136446466;
  objc_super v20 = "-[NWConcrete_nw_endpoint setPriority:]";
  __int16 v21 = 1024;
  unsigned int v22 = -[NWConcrete_nw_endpoint type](self, "type");
  LODWORD(v16) = 18;
  int v5 = (char *)_os_log_send_and_compose_impl();

  os_log_type_t type = OS_LOG_TYPE_ERROR;
  char v17 = 0;
  if ((__nwlog_fault(v5, &type, &v17) & 1) == 0)
  {
LABEL_6:
    if (!v5) {
      return;
    }
    goto LABEL_7;
  }

  if (type == OS_LOG_TYPE_FAULT)
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    uint64_t v6 = (os_log_s *)(id)gLogObj;
    os_log_type_t v7 = type;
    if (os_log_type_enabled(v6, type))
    {
      unsigned int v8 = -[NWConcrete_nw_endpoint type](self, "type", buf, v16);
      *(_DWORD *)buf = 136446466;
      objc_super v20 = "-[NWConcrete_nw_endpoint setPriority:]";
      __int16 v21 = 1024;
      unsigned int v22 = v8;
      _os_log_impl(&dword_181A5C000, v6, v7, "%{public}s incorrect endpoint type %u", buf, 0x12u);
    }

- (void)setWeight:(unsigned __int16)a3
{
  uint64_t v25 = *MEMORY[0x1895F89C0];
  pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
  networkd_settings_init();
  id v4 = (id)gLogObj;
  *(_DWORD *)buf = 136446466;
  objc_super v20 = "-[NWConcrete_nw_endpoint setWeight:]";
  __int16 v21 = 1024;
  unsigned int v22 = -[NWConcrete_nw_endpoint type](self, "type");
  LODWORD(v16) = 18;
  int v5 = (char *)_os_log_send_and_compose_impl();

  os_log_type_t type = OS_LOG_TYPE_ERROR;
  char v17 = 0;
  if ((__nwlog_fault(v5, &type, &v17) & 1) == 0)
  {
LABEL_6:
    if (!v5) {
      return;
    }
    goto LABEL_7;
  }

  if (type == OS_LOG_TYPE_FAULT)
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    uint64_t v6 = (os_log_s *)(id)gLogObj;
    os_log_type_t v7 = type;
    if (os_log_type_enabled(v6, type))
    {
      unsigned int v8 = -[NWConcrete_nw_endpoint type](self, "type", buf, v16);
      *(_DWORD *)buf = 136446466;
      objc_super v20 = "-[NWConcrete_nw_endpoint setWeight:]";
      __int16 v21 = 1024;
      unsigned int v22 = v8;
      _os_log_impl(&dword_181A5C000, v6, v7, "%{public}s incorrect endpoint type %u", buf, 0x12u);
    }

- (OS_dispatch_data)echConfig
{
  return 0LL;
}

- (void)setEchConfig:(id)a3
{
  uint64_t v25 = *MEMORY[0x1895F89C0];
  pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
  networkd_settings_init();
  id v4 = (id)gLogObj;
  *(_DWORD *)buf = 136446466;
  objc_super v20 = "-[NWConcrete_nw_endpoint setEchConfig:]";
  __int16 v21 = 1024;
  unsigned int v22 = -[NWConcrete_nw_endpoint type](self, "type");
  LODWORD(v16) = 18;
  int v5 = (char *)_os_log_send_and_compose_impl();

  os_log_type_t type = OS_LOG_TYPE_ERROR;
  char v17 = 0;
  if (!__nwlog_fault(v5, &type, &v17))
  {
LABEL_6:
    if (!v5) {
      return;
    }
    goto LABEL_7;
  }

  if (type == OS_LOG_TYPE_FAULT)
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    uint64_t v6 = (os_log_s *)(id)gLogObj;
    os_log_type_t v7 = type;
    if (os_log_type_enabled(v6, type))
    {
      unsigned int v8 = -[NWConcrete_nw_endpoint type](self, "type", buf, v16);
      *(_DWORD *)buf = 136446466;
      objc_super v20 = "-[NWConcrete_nw_endpoint setEchConfig:]";
      __int16 v21 = 1024;
      unsigned int v22 = v8;
      _os_log_impl(&dword_181A5C000, v6, v7, "%{public}s incorrect endpoint type %u", buf, 0x12u);
    }

- (char)createDescription:(BOOL)a3
{
  uint64_t v26 = *MEMORY[0x1895F89C0];
  pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
  networkd_settings_init();
  id v4 = (id)gLogObj;
  *(_DWORD *)buf = 136446466;
  __int16 v21 = "-[NWConcrete_nw_endpoint createDescription:]";
  __int16 v22 = 1024;
  unsigned int v23 = -[NWConcrete_nw_endpoint type](self, "type");
  LODWORD(v17) = 18;
  int v5 = (char *)_os_log_send_and_compose_impl();

  os_log_type_t type = OS_LOG_TYPE_ERROR;
  char v18 = 0;
  if ((__nwlog_fault(v5, &type, &v18) & 1) != 0)
  {
    if (type == OS_LOG_TYPE_FAULT)
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      uint64_t v6 = (os_log_s *)(id)gLogObj;
      os_log_type_t v7 = type;
      if (os_log_type_enabled(v6, type))
      {
        unsigned int v8 = -[NWConcrete_nw_endpoint type](self, "type", buf, v17);
        *(_DWORD *)buf = 136446466;
        __int16 v21 = "-[NWConcrete_nw_endpoint createDescription:]";
        __int16 v22 = 1024;
        unsigned int v23 = v8;
        _os_log_impl(&dword_181A5C000, v6, v7, "%{public}s incorrect endpoint type %u", buf, 0x12u);
      }
    }

    else if (v18)
    {
      backtrace_string = (char *)__nw_create_backtrace_string();
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      uint64_t v6 = (os_log_s *)(id)gLogObj;
      os_log_type_t v11 = type;
      BOOL v12 = os_log_type_enabled(v6, type);
      if (backtrace_string)
      {
        if (v12)
        {
          unsigned int v13 = -[NWConcrete_nw_endpoint type](self, "type", buf, v17);
          *(_DWORD *)buf = 136446722;
          __int16 v21 = "-[NWConcrete_nw_endpoint createDescription:]";
          __int16 v22 = 1024;
          unsigned int v23 = v13;
          __int16 v24 = 2082;
          uint64_t v25 = backtrace_string;
          _os_log_impl( &dword_181A5C000,  v6,  v11,  "%{public}s incorrect endpoint type %u, dumping backtrace:%{public}s",  buf,  0x1Cu);
        }

        free(backtrace_string);
        if (v5) {
          goto LABEL_7;
        }
        return 0LL;
      }

      if (v12)
      {
        unsigned int v16 = -[NWConcrete_nw_endpoint type](self, "type", buf, v17);
        *(_DWORD *)buf = 136446466;
        __int16 v21 = "-[NWConcrete_nw_endpoint createDescription:]";
        __int16 v22 = 1024;
        unsigned int v23 = v16;
        _os_log_impl(&dword_181A5C000, v6, v11, "%{public}s incorrect endpoint type %u, no backtrace", buf, 0x12u);
      }
    }

    else
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      uint64_t v6 = (os_log_s *)(id)gLogObj;
      os_log_type_t v14 = type;
      if (os_log_type_enabled(v6, type))
      {
        unsigned int v15 = -[NWConcrete_nw_endpoint type](self, "type", buf, v17);
        *(_DWORD *)buf = 136446466;
        __int16 v21 = "-[NWConcrete_nw_endpoint createDescription:]";
        __int16 v22 = 1024;
        unsigned int v23 = v15;
        _os_log_impl( &dword_181A5C000,  v6,  v14,  "%{public}s incorrect endpoint type %u, backtrace limit exceeded",  buf,  0x12u);
      }
    }
  }

  if (v5) {
LABEL_7:
  }
    free(v5);
  return 0LL;
}

- (id)redactedDescription
{
  if (nw_endpoint_get_do_not_redact(self))
  {
    -[NWConcrete_nw_endpoint description](self, "description");
    return (id)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    uint64_t v6 = 0LL;
    os_log_type_t v7 = &v6;
    uint64_t v8 = 0x3032000000LL;
    uint64_t v9 = __Block_byref_object_copy__6408;
    os_log_type_t v10 = __Block_byref_object_dispose__6409;
    id v11 = 0LL;
    v5[0] = MEMORY[0x1895F87A8];
    v5[1] = 3221225472LL;
    v5[2] = __45__NWConcrete_nw_endpoint_redactedDescription__block_invoke;
    v5[3] = &unk_189BC9210;
    v5[4] = self;
    v5[5] = &v6;
    os_unfair_lock_lock(&self->description_lock);
    __45__NWConcrete_nw_endpoint_redactedDescription__block_invoke((uint64_t)v5);
    os_unfair_lock_unlock(&self->description_lock);
    id v4 = (id)v7[5];
    _Block_object_dispose(&v6, 8);

    return v4;
  }

- (BOOL)isEqual:(id)a3
{
  id v4 = (NWConcrete_nw_endpoint *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }

  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
      && -[NWConcrete_nw_endpoint isEqualToEndpoint:matchFlags:](self, "isEqualToEndpoint:matchFlags:", v4, 31LL);
  }

  return v5;
}

- (id)copyEndpoint
{
  return 0LL;
}

- (unint64_t)getHash
{
  return 4095LL;
}

@end
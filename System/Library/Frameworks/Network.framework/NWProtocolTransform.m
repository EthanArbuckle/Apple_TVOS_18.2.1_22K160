@interface NWProtocolTransform
- (BOOL)disablePathFallback;
- (BOOL)fastOpenForceEnable;
- (BOOL)isEqual:(id)a3;
- (BOOL)noProxy;
- (BOOL)prohibitDirect;
- (BOOL)tfo;
- (BOOL)tfoNoCookie;
- (NWEndpoint)replacementEndpoint;
- (NWProtocolTransform)init;
- (NWProtocolTransform)initWithCTransform:(id)a3;
- (OS_nw_protocol_transform)internalTransform;
- (id)description;
- (id)descriptionWithIndent:(int)a3 showFullContent:(BOOL)a4;
- (id)privateDescription;
- (int)dataMode;
- (int)multipathService;
- (unint64_t)fallbackMode;
- (unint64_t)hash;
- (void)appendProtocol:(id)a3 atLevel:(int)a4;
- (void)clearProtocolsAtLevel:(int)a3;
- (void)disableProtocol:(nw_protocol_identifier *)a3;
- (void)setDataMode:(int)a3;
- (void)setDisablePathFallback:(BOOL)a3;
- (void)setFallbackMode:(unint64_t)a3;
- (void)setFastOpenForceEnable:(BOOL)a3;
- (void)setInternalTransform:(id)a3;
- (void)setMultipathService:(int)a3;
- (void)setNoProxy:(BOOL)a3;
- (void)setProhibitDirect:(BOOL)a3;
- (void)setReplacementEndpoint:(id)a3;
- (void)setTfo:(BOOL)a3;
- (void)setTfoNoCookie:(BOOL)a3;
@end

@implementation NWProtocolTransform

- (NWProtocolTransform)init
{
  uint64_t v31 = *MEMORY[0x1895F89C0];
  v26.receiver = self;
  v26.super_class = (Class)&OBJC_CLASS___NWProtocolTransform;
  v2 = -[NWProtocolTransform init](&v26, sel_init);
  if (!v2)
  {
    __nwlog_obj();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136446210;
    v28 = "-[NWProtocolTransform init]";
    v7 = (char *)_os_log_send_and_compose_impl();

    os_log_type_t type = OS_LOG_TYPE_ERROR;
    char v24 = 0;
    if (type == OS_LOG_TYPE_FAULT)
    {
      __nwlog_obj();
      v19 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_log_type_t v20 = type;
      if (os_log_type_enabled(v19, type))
      {
        *(_DWORD *)buf = 136446210;
        v28 = "-[NWProtocolTransform init]";
        v21 = "%{public}s [super init] failed";
LABEL_39:
        _os_log_impl(&dword_181A5C000, v19, v20, v21, buf, 0xCu);
      }
    }

    else
    {
      if (v24)
      {
        backtrace_string = __nw_create_backtrace_string();
        __nwlog_obj();
        v19 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        os_log_type_t v20 = type;
        BOOL v23 = os_log_type_enabled(v19, type);
        if (backtrace_string)
        {
          if (v23)
          {
            *(_DWORD *)buf = 136446466;
            v28 = "-[NWProtocolTransform init]";
            __int16 v29 = 2082;
            v30 = backtrace_string;
            _os_log_impl( &dword_181A5C000,  v19,  v20,  "%{public}s [super init] failed, dumping backtrace:%{public}s",  buf,  0x16u);
          }

          v14 = (char *)backtrace_string;
LABEL_13:
          free(v14);
          goto LABEL_14;
        }

        if (!v23) {
          goto LABEL_40;
        }
        *(_DWORD *)buf = 136446210;
        v28 = "-[NWProtocolTransform init]";
        v21 = "%{public}s [super init] failed, no backtrace";
        goto LABEL_39;
      }

      __nwlog_obj();
      v19 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_log_type_t v20 = type;
      if (os_log_type_enabled(v19, type))
      {
        *(_DWORD *)buf = 136446210;
        v28 = "-[NWProtocolTransform init]";
        v21 = "%{public}s [super init] failed, backtrace limit exceeded";
        goto LABEL_39;
      }
    }

- (NWProtocolTransform)initWithCTransform:(id)a3
{
  uint64_t v30 = *MEMORY[0x1895F89C0];
  id v5 = a3;
  if (v5)
  {
    v23.receiver = self;
    v23.super_class = (Class)&OBJC_CLASS___NWProtocolTransform;
    id v6 = -[NWProtocolTransform init](&v23, sel_init);
    if (v6)
    {
      v7 = v6;
      objc_storeStrong((id *)&v6->_internalTransform, a3);
      goto LABEL_4;
    }

    __nwlog_obj();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136446210;
    v27 = "-[NWProtocolTransform initWithCTransform:]";
    v15 = (char *)_os_log_send_and_compose_impl();

    os_log_type_t type = OS_LOG_TYPE_ERROR;
    char v24 = 0;
    if (type == OS_LOG_TYPE_FAULT)
    {
      __nwlog_obj();
      v16 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_log_type_t v17 = type;
      if (os_log_type_enabled(v16, type))
      {
        *(_DWORD *)buf = 136446210;
        v27 = "-[NWProtocolTransform initWithCTransform:]";
        v18 = "%{public}s [super init] failed";
LABEL_36:
        _os_log_impl(&dword_181A5C000, v16, v17, v18, buf, 0xCu);
      }
    }

    else if (v24)
    {
      backtrace_string = (char *)__nw_create_backtrace_string();
      __nwlog_obj();
      v16 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_log_type_t v17 = type;
      BOOL v22 = os_log_type_enabled(v16, type);
      if (backtrace_string)
      {
        if (v22)
        {
          *(_DWORD *)buf = 136446466;
          v27 = "-[NWProtocolTransform initWithCTransform:]";
          __int16 v28 = 2082;
          __int16 v29 = backtrace_string;
          _os_log_impl( &dword_181A5C000,  v16,  v17,  "%{public}s [super init] failed, dumping backtrace:%{public}s",  buf,  0x16u);
        }

        free(backtrace_string);
        goto LABEL_38;
      }

      if (v22)
      {
        *(_DWORD *)buf = 136446210;
        v27 = "-[NWProtocolTransform initWithCTransform:]";
        v18 = "%{public}s [super init] failed, no backtrace";
        goto LABEL_36;
      }
    }

    else
    {
      __nwlog_obj();
      v16 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_log_type_t v17 = type;
      if (os_log_type_enabled(v16, type))
      {
        *(_DWORD *)buf = 136446210;
        v27 = "-[NWProtocolTransform initWithCTransform:]";
        v18 = "%{public}s [super init] failed, backtrace limit exceeded";
        goto LABEL_36;
      }
    }

LABEL_38:
    if (v15) {
      free(v15);
    }
    v7 = 0LL;
    goto LABEL_4;
  }

  __nwlog_obj();
  os_log_type_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)buf = 136446210;
  v27 = "-[NWProtocolTransform initWithCTransform:]";
  v10 = (char *)_os_log_send_and_compose_impl();

  os_log_type_t type = OS_LOG_TYPE_ERROR;
  char v24 = 0;
  if (__nwlog_fault(v10, &type, &v24))
  {
    if (type == OS_LOG_TYPE_FAULT)
    {
      __nwlog_obj();
      v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_log_type_t v12 = type;
      if (os_log_type_enabled(v11, type))
      {
        *(_DWORD *)buf = 136446210;
        v27 = "-[NWProtocolTransform initWithCTransform:]";
        BOOL v13 = "%{public}s called with null cTransform";
LABEL_29:
        _os_log_impl(&dword_181A5C000, v11, v12, v13, buf, 0xCu);
      }
    }

    else
    {
      if (v24)
      {
        v19 = (char *)__nw_create_backtrace_string();
        __nwlog_obj();
        v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        os_log_type_t v12 = type;
        BOOL v20 = os_log_type_enabled(v11, type);
        if (v19)
        {
          if (v20)
          {
            *(_DWORD *)buf = 136446466;
            v27 = "-[NWProtocolTransform initWithCTransform:]";
            __int16 v28 = 2082;
            __int16 v29 = v19;
            _os_log_impl( &dword_181A5C000,  v11,  v12,  "%{public}s called with null cTransform, dumping backtrace:%{public}s",  buf,  0x16u);
          }

          free(v19);
          goto LABEL_31;
        }

        if (!v20) {
          goto LABEL_30;
        }
        *(_DWORD *)buf = 136446210;
        v27 = "-[NWProtocolTransform initWithCTransform:]";
        BOOL v13 = "%{public}s called with null cTransform, no backtrace";
        goto LABEL_29;
      }

      __nwlog_obj();
      v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_log_type_t v12 = type;
      if (os_log_type_enabled(v11, type))
      {
        *(_DWORD *)buf = 136446210;
        v27 = "-[NWProtocolTransform initWithCTransform:]";
        BOOL v13 = "%{public}s called with null cTransform, backtrace limit exceeded";
        goto LABEL_29;
      }
    }

- (id)descriptionWithIndent:(int)a3 showFullContent:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v5 = *(void *)&a3;
  id v7 = objc_alloc_init(MEMORY[0x189607940]);
  if (-[NWProtocolTransform fallbackMode](self, "fallbackMode") == 1)
  {
    v8 = @"Failover";
  }

  else if (-[NWProtocolTransform fallbackMode](self, "fallbackMode") == 2)
  {
    v8 = @"RTT-Timer";
  }

  else
  {
    if (-[NWProtocolTransform fallbackMode](self, "fallbackMode") != 3) {
      goto LABEL_8;
    }
    v8 = @"Immediate";
  }

  [v7 appendPrettyObject:v8 withName:@"fallbackMode" indent:v5 showFullContent:v4];
LABEL_8:
  -[NWProtocolTransform replacementEndpoint](self, "replacementEndpoint");
  os_log_type_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 appendPrettyObject:v9 withName:@"replacementEndpoint" indent:v5 showFullContent:v4];

  if (-[NWProtocolTransform prohibitDirect](self, "prohibitDirect")) {
    objc_msgSend( v7,  "appendPrettyBOOL:withName:indent:",  -[NWProtocolTransform prohibitDirect](self, "prohibitDirect"),  @"prohibitDirect",  v5);
  }
  if (-[NWProtocolTransform noProxy](self, "noProxy")) {
    objc_msgSend( v7,  "appendPrettyBOOL:withName:indent:",  -[NWProtocolTransform noProxy](self, "noProxy"),  @"noProxy",  v5);
  }
  if (-[NWProtocolTransform multipathService](self, "multipathService")) {
    objc_msgSend( v7,  "appendPrettyInt:withName:indent:",  -[NWProtocolTransform multipathService](self, "multipathService"),  @"multipathService",  v5);
  }
  return v7;
}

- (id)description
{
  return  -[NWProtocolTransform descriptionWithIndent:showFullContent:]( self,  "descriptionWithIndent:showFullContent:",  0LL,  0LL);
}

- (id)privateDescription
{
  return  -[NWProtocolTransform descriptionWithIndent:showFullContent:]( self,  "descriptionWithIndent:showFullContent:",  0LL,  1LL);
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (v4 && [v4 isMemberOfClass:objc_opt_class()])
  {
    id v5 = v4;
    -[NWProtocolTransform internalTransform](self, "internalTransform");
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
    [v5 internalTransform];
    id v7 = (void *)objc_claimAutoreleasedReturnValue();

    char v8 = nw_protocol_transform_compare(v6, v7, 0);
  }

  else
  {
    char v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  unint64_t hash = nw_protocol_transform_get_hash(v2);

  return hash;
}

- (void)disableProtocol:(nw_protocol_identifier *)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  nw_protocol_transform_disable_protocol(v4, a3);
}

- (void)clearProtocolsAtLevel:(int)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  nw_protocol_transform_clear_protocols_at_level(v4, a3);
}

- (void)appendProtocol:(id)a3 atLevel:(int)a4
{
  id v6 = a3;
  -[NWProtocolTransform internalTransform](self, "internalTransform");
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  nw_protocol_transform_append_protocol(v7, a4, v6);
}

- (NWEndpoint)replacementEndpoint
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  id v3 = nw_protocol_transform_copy_endpoint(v2);

  if (v3)
  {
    +[NWEndpoint endpointWithInternalEndpoint:](&OBJC_CLASS___NWEndpoint, "endpointWithInternalEndpoint:", v3);
    id v4 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    id v4 = 0LL;
  }

  return (NWEndpoint *)v4;
}

- (void)setReplacementEndpoint:(id)a3
{
  id v4 = a3;
  -[NWProtocolTransform internalTransform](self, "internalTransform");
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [v4 internalEndpoint];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();

  nw_protocol_transform_replace_endpoint(v6, v5);
}

- (unint64_t)fallbackMode
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  unint64_t fallback_mode = nw_protocol_transform_get_fallback_mode(v2);

  return fallback_mode;
}

- (void)setFallbackMode:(unint64_t)a3
{
  int v3 = a3;
  -[NWProtocolTransform internalTransform](self, "internalTransform");
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  nw_protocol_transform_set_fallback_mode(v4, v3);
}

- (BOOL)prohibitDirect
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  char prohibit_direct = nw_protocol_transform_get_prohibit_direct(v2);

  return prohibit_direct;
}

- (void)setProhibitDirect:(BOOL)a3
{
  BOOL v3 = a3;
  -[NWProtocolTransform internalTransform](self, "internalTransform");
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  nw_protocol_transform_set_prohibit_direct(v4, v3);
}

- (BOOL)noProxy
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  char no_proxy = nw_protocol_transform_get_no_proxy(v2);

  return no_proxy;
}

- (void)setNoProxy:(BOOL)a3
{
  BOOL v3 = a3;
  -[NWProtocolTransform internalTransform](self, "internalTransform");
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  nw_protocol_transform_set_no_proxy(v4, v3);
}

- (int)multipathService
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  int multipath_service = nw_protocol_transform_get_multipath_service(v2);

  return multipath_service;
}

- (void)setMultipathService:(int)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  nw_protocol_transform_set_multipath_service(v4, a3);
}

- (BOOL)tfo
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  char tfo = nw_protocol_transform_get_tfo(v2);

  return tfo;
}

- (void)setTfo:(BOOL)a3
{
  BOOL v3 = a3;
  -[NWProtocolTransform internalTransform](self, "internalTransform");
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  nw_protocol_transform_set_tfo(v4, v3);
}

- (BOOL)tfoNoCookie
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  char tfo_no_cookie = nw_protocol_transform_get_tfo_no_cookie(v2);

  return tfo_no_cookie;
}

- (void)setTfoNoCookie:(BOOL)a3
{
  BOOL v3 = a3;
  -[NWProtocolTransform internalTransform](self, "internalTransform");
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  nw_protocol_transform_set_tfo_no_cookie(v4, v3);
}

- (BOOL)fastOpenForceEnable
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  char fast_open_force_enable = nw_protocol_transform_get_fast_open_force_enable(v2);

  return fast_open_force_enable;
}

- (void)setFastOpenForceEnable:(BOOL)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  nw_protocol_transform_set_fast_open_force_enable(v4, a3);
}

- (int)dataMode
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  int data_mode = nw_protocol_transform_get_data_mode(v2);

  return data_mode;
}

- (void)setDataMode:(int)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  nw_protocol_transform_set_data_mode(v4, a3);
}

- (BOOL)disablePathFallback
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL no_path_fallback = nw_protocol_transform_get_no_path_fallback(v2);

  return no_path_fallback;
}

- (void)setDisablePathFallback:(BOOL)a3
{
  BOOL v3 = a3;
  -[NWProtocolTransform internalTransform](self, "internalTransform");
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  nw_protocol_transform_set_no_path_fallback(v4, v3);
}

- (OS_nw_protocol_transform)internalTransform
{
  return (OS_nw_protocol_transform *)objc_getProperty(self, a2, 8LL, 1);
}

- (void)setInternalTransform:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
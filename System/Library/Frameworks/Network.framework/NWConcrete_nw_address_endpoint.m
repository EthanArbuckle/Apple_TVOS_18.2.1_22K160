@interface NWConcrete_nw_address_endpoint
- (BOOL)isEqualToEndpoint:(id)a3 matchFlags:(unsigned __int8)a4;
- (char)createDescription:(BOOL)a3;
- (char)initWithAddress:(const char *)a3 overridePort:;
- (const)hostname;
- (id)copyDictionary;
- (id)copyEndpoint;
- (id)echConfig;
- (unint64_t)getHash;
- (unsigned)port;
- (unsigned)priority;
- (unsigned)type;
- (void)dealloc;
- (void)setEchConfig:(id)a3;
- (void)setPriority:(unsigned __int16)a3;
@end

@implementation NWConcrete_nw_address_endpoint

- (char)initWithAddress:(const char *)a3 overridePort:
{
  *(void *)&v59[13] = *MEMORY[0x1895F89C0];
  if (!a1) {
    return 0LL;
  }
  v55.receiver = a1;
  v55.super_class = (Class)&OBJC_CLASS___NWConcrete_nw_address_endpoint;
  v5 = (char *)objc_msgSendSuper2(&v55, sel_init);
  if (!v5)
  {
    __nwlog_obj();
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136446210;
    v57 = "-[NWConcrete_nw_address_endpoint initWithAddress:overridePort:]";
    v46 = (char *)_os_log_send_and_compose_impl();

    os_log_type_t type = OS_LOG_TYPE_ERROR;
    char v53 = 0;
    if (__nwlog_fault(v46, &type, &v53))
    {
      if (type == OS_LOG_TYPE_FAULT)
      {
        __nwlog_obj();
        v47 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        os_log_type_t v48 = type;
        if (os_log_type_enabled(v47, type))
        {
          *(_DWORD *)buf = 136446210;
          v57 = "-[NWConcrete_nw_address_endpoint initWithAddress:overridePort:]";
          _os_log_impl(&dword_181A5C000, v47, v48, "%{public}s [super init] failed", buf, 0xCu);
        }
      }

      else if (v53)
      {
        backtrace_string = (char *)__nw_create_backtrace_string();
        __nwlog_obj();
        v47 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        os_log_type_t v50 = type;
        BOOL v51 = os_log_type_enabled(v47, type);
        if (backtrace_string)
        {
          if (v51)
          {
            *(_DWORD *)buf = 136446466;
            v57 = "-[NWConcrete_nw_address_endpoint initWithAddress:overridePort:]";
            __int16 v58 = 2082;
            *(void *)v59 = backtrace_string;
            _os_log_impl( &dword_181A5C000,  v47,  v50,  "%{public}s [super init] failed, dumping backtrace:%{public}s",  buf,  0x16u);
          }

          free(backtrace_string);
          goto LABEL_108;
        }

        if (v51)
        {
          *(_DWORD *)buf = 136446210;
          v57 = "-[NWConcrete_nw_address_endpoint initWithAddress:overridePort:]";
          _os_log_impl(&dword_181A5C000, v47, v50, "%{public}s [super init] failed, no backtrace", buf, 0xCu);
        }
      }

      else
      {
        __nwlog_obj();
        v47 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        os_log_type_t v52 = type;
        if (os_log_type_enabled(v47, type))
        {
          *(_DWORD *)buf = 136446210;
          v57 = "-[NWConcrete_nw_address_endpoint initWithAddress:overridePort:]";
          _os_log_impl( &dword_181A5C000,  v47,  v52,  "%{public}s [super init] failed, backtrace limit exceeded",  buf,  0xCu);
        }
      }
    }

- (unsigned)type
{
  return 1;
}

- (void)setPriority:(unsigned __int16)a3
{
  self->priority = a3;
}

- (unsigned)port
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  p_address = &self->address;
  int ss_family = self->address.ss_family;
  if (ss_family == 30 || ss_family == 2) {
    return *(_WORD *)self->address.__ss_pad1;
  }
  pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
  networkd_settings_init();
  v5 = (os_log_s *)(id)gLogObj;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v6 = p_address->ss_family;
    int v7 = 136446466;
    int v8 = "-[NWConcrete_nw_address_endpoint port]";
    __int16 v9 = 1024;
    int v10 = v6;
    _os_log_impl( &dword_181A5C000,  v5,  OS_LOG_TYPE_INFO,  "%{public}s Can't fetch port for address family: %u",  (uint8_t *)&v7,  0x12u);
  }

  return 0;
}

- (unsigned)priority
{
  return self->priority;
}

- (void)dealloc
{
  hostname = self->hostname;
  if (hostname)
  {
    free(hostname);
    self->hostname = 0LL;
  }

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___NWConcrete_nw_address_endpoint;
  -[NWConcrete_nw_endpoint dealloc](&v4, sel_dealloc);
}

- (void).cxx_destruct
{
}

- (unint64_t)getHash
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  memset(&v5, 0, sizeof(v5));
  CC_SHA256_Init(&v5);
  CC_SHA256_Update(&v5, &self->address, self->address.ss_len);
  CC_SHA256_Update(&v5, &self->ethernet_address, 6u);
  CC_SHA256_Final(md, &v5);
  int8x16_t v3 = veorq_s8(*(int8x16_t *)md, v7);
  return (unint64_t)veor_s8(*(int8x8_t *)v3.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v3, v3, 8uLL));
}

- (char)createDescription:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v56 = *MEMORY[0x1895F89C0];
  __s1[0] = 0;
  v46 = 0LL;
  CC_SHA256_CTX v5 = (char *)nw_endpoint_copy_interface(self);
  p_address = &self->address;
  int ss_family = self->address.ss_family;
  if (ss_family == 30 || ss_family == 2)
  {
    __s1[0] = 0;
    if (ss_family == 30)
    {
      p_ss_align = &self->address.__ss_align;
      int ss_align_low = LOBYTE(self->address.__ss_align);
      *(void *)__str = 0LL;
      uint64_t v52 = 0LL;
      __int16 v53 = 0;
      if (ss_align_low == 254 && (BYTE1(self->address.__ss_align) & 0xC0) == 0x80)
      {
        unsigned int v24 = *(_DWORD *)&self->address.__ss_pad2[8];
        if (v24)
        {
          v25 = nw_interface_create_with_index(v24);
          if (v25) {
            snprintf(__str, 0x12uLL, "%%%s");
          }
          else {
            snprintf(__str, 0x12uLL, "%%%u");
          }
        }
      }

      if (v3
        && (*(_DWORD *)p_ss_align
         || HIDWORD(self->address.__ss_align)
         || *(_DWORD *)self->address.__ss_pad2
         || (*(_DWORD *)&self->address.__ss_pad2[4] | 0x1000000) != 0x1000000))
      {
        __nwlog_salted_hash(p_ss_align, 16LL, v54);
        snprintf(__s1, 0x64uLL, "IPv6#%s%s.");
        goto LABEL_59;
      }

      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      id v26 = (id)gLogObj;
      int v47 = 68289282;
      *(_DWORD *)os_log_type_t v48 = 16;
      *(_WORD *)&v48[4] = 2098;
      *(void *)&v48[6] = &self->address.__ss_align;
      __int16 v49 = 2082;
      os_log_type_t v50 = __str;
      int v12 = (char *)_os_log_send_and_compose_impl();

      if (v12 == __s1) {
        goto LABEL_59;
      }
      if (!v12)
      {
        __nwlog_obj();
        os_log_type_t v44 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        os_log_type_enabled(v44, OS_LOG_TYPE_ERROR);
        int v47 = 136446210;
        *(void *)os_log_type_t v48 = "_strict_strlcpy";
        v45 = (void *)_os_log_send_and_compose_impl();

        result = (char *)__nwlog_abort((uint64_t)v45);
        if ((_DWORD)result) {
          goto LABEL_73;
        }
        free(v45);
      }

      uint64_t v27 = 0LL;
      while (1)
      {
        int v28 = __s1[v27];
        v12[v27] = v28;
        if (!v28) {
          break;
        }
        if (++v27 == 99)
        {
LABEL_56:
          v12[99] = 0;
          break;
        }
      }
    }

    else
    {
      if (ss_family != 2)
      {
LABEL_59:
        unsigned int alternate_port = nw_endpoint_get_alternate_port(self);
        unsigned int v30 = -[NWConcrete_nw_address_endpoint port](self, "port");
        v31 = v5 + 104;
        unsigned int v32 = __rev16(v30);
        id v33 = "/";
        if (!alternate_port) {
          id v33 = "";
        }
        unsigned int v34 = __rev16(alternate_port);
        v35 = "@";
        if (!v5)
        {
          v35 = "";
          v31 = "";
        }

        asprintf(&v46, "%s%u%s%.0u%s%s", __s1, v32, v33, v34, v35, v31);
        goto LABEL_64;
      }

      int v9 = *(_DWORD *)&self->address.__ss_pad1[2];
      *(_DWORD *)__str = v9;
      if (v3 && v9 && v9 != 16777343)
      {
        __nwlog_salted_hash(__str, 4LL, v54);
        snprintf(__s1, 0x64uLL, "IPv4#%s:");
        goto LABEL_59;
      }

      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      id v11 = (id)gLogObj;
      int v47 = 67240192;
      *(_DWORD *)os_log_type_t v48 = v9;
      int v12 = (char *)_os_log_send_and_compose_impl();

      if (v12 == __s1) {
        goto LABEL_59;
      }
      if (!v12)
      {
        __nwlog_obj();
        v40 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        os_log_type_enabled(v40, OS_LOG_TYPE_ERROR);
        int v47 = 136446210;
        *(void *)os_log_type_t v48 = "_strict_strlcpy";
        os_log_type_t v41 = (void *)_os_log_send_and_compose_impl();

        result = (char *)__nwlog_abort((uint64_t)v41);
        if ((_DWORD)result) {
          goto LABEL_73;
        }
        free(v41);
      }

      uint64_t v13 = 0LL;
      while (1)
      {
        int v14 = __s1[v13];
        v12[v13] = v14;
        if (!v14) {
          break;
        }
        if (++v13 == 99) {
          goto LABEL_56;
        }
      }
    }

    if (v12) {
      free(v12);
    }
    goto LABEL_59;
  }

  if (ss_family == 1 || !v3)
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    id v16 = (id)gLogObj;
    int ss_len = p_address->ss_len;
    int v47 = 68157954;
    *(_DWORD *)os_log_type_t v48 = ss_len;
    *(_WORD *)&v48[4] = 2098;
    *(void *)&v48[6] = &self->address;
    BOOL v18 = (char *)_os_log_send_and_compose_impl();

    if (v18 != __s1)
    {
      if (!v18)
      {
        __nwlog_obj();
        BOOL v42 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        os_log_type_enabled(v42, OS_LOG_TYPE_ERROR);
        int v47 = 136446210;
        *(void *)os_log_type_t v48 = "_strict_strlcpy";
        os_log_type_t v43 = (void *)_os_log_send_and_compose_impl();

        result = (char *)__nwlog_abort((uint64_t)v43);
        if ((_DWORD)result) {
          goto LABEL_73;
        }
        free(v43);
      }

      uint64_t v19 = 0LL;
      while (1)
      {
        int v20 = __s1[v19];
        v18[v19] = v20;
        if (!v20) {
          break;
        }
        if (++v19 == 99)
        {
          v18[99] = 0;
          break;
        }
      }

      if (v18) {
        free(v18);
      }
    }

    if (!__s1[0])
    {
LABEL_42:
      asprintf(&v46, "<af:%u>", p_address->ss_family);
      goto LABEL_64;
    }
  }

  else
  {
    __nwlog_salted_hash(p_address, p_address->ss_len, (char *)&v47);
    snprintf(__s1, 0x64uLL, "sockaddr#%s", (const char *)&v47);
    if (!__s1[0]) {
      goto LABEL_42;
    }
  }

  int v21 = strdup(__s1);
  if (v21)
  {
LABEL_35:
    v46 = v21;
LABEL_64:
    os_log_type_t v36 = v46;

    return v36;
  }

  __nwlog_obj();
  os_log_type_t v38 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  os_log_type_enabled(v38, OS_LOG_TYPE_ERROR);
  int v47 = 136446210;
  *(void *)os_log_type_t v48 = "strict_strdup";
  BOOL v39 = (void *)_os_log_send_and_compose_impl();

  result = (char *)__nwlog_abort((uint64_t)v39);
  if (!(_DWORD)result)
  {
    free(v39);
    goto LABEL_35;
  }

- (id)copyEndpoint
{
  nw_endpoint_t address_with_ethernet = nw_endpoint_create_address_with_ethernet( (const sockaddr *)&self->address,  (int *)&self->ethernet_address);
  *((_DWORD *)address_with_ethernet + 96) = self->original_fd;
  objc_storeStrong((id *)address_with_ethernet + 46, self->ech_config);
  return address_with_ethernet;
}

- (BOOL)isEqualToEndpoint:(id)a3 matchFlags:(unsigned __int8)a4
{
  uint64_t v4 = a4;
  id v6 = a3;
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___NWConcrete_nw_address_endpoint;
  if (-[NWConcrete_nw_endpoint isEqualToEndpoint:matchFlags:](&v16, sel_isEqualToEndpoint_matchFlags_, v6, v4))
  {
    int8x16_t v7 = v6;
    if (self->original_fd == *((_DWORD *)v7 + 96))
    {
      size_t ss_len = self->address.ss_len;
      if ((_DWORD)ss_len == *((unsigned __int8 *)v7 + 232))
      {
        int ss_family = self->address.ss_family;
        if (ss_family == *((unsigned __int8 *)v7 + 233))
        {
          if (ss_family == 30)
          {
            if (*(unsigned __int16 *)self->address.__ss_pad1 == *((unsigned __int16 *)v7 + 117)
              && *(_DWORD *)&self->address.__ss_pad1[2] == *((_DWORD *)v7 + 59))
            {
              BOOL v12 = *(_OWORD *)&self->address.__ss_align == v7[15];
              if ((v4 & 1) == 0 || *(_OWORD *)&self->address.__ss_align != v7[15]) {
                goto LABEL_18;
              }
              if (*(_DWORD *)&self->address.__ss_pad2[8] == *((_DWORD *)v7 + 64)) {
                goto LABEL_22;
              }
            }
          }

          else
          {
            if (ss_family != 2)
            {
              int v14 = memcmp(&self->address, (char *)v7 + 232, ss_len);
              BOOL v12 = v14 == 0;
              if ((v4 & 1) == 0 || v14) {
                goto LABEL_18;
              }
              goto LABEL_22;
            }

            if (*(unsigned __int16 *)self->address.__ss_pad1 == *((unsigned __int16 *)v7 + 117))
            {
              int v10 = *(_DWORD *)&self->address.__ss_pad1[2];
              int v11 = *((_DWORD *)v7 + 59);
              BOOL v12 = v10 == v11;
              if ((v4 & 1) == 0 || v10 != v11) {
                goto LABEL_18;
              }
LABEL_22:
              BOOL v12 = *(_DWORD *)self->ethernet_address.octet == *((_DWORD *)v7 + 90)
                 && *(unsigned __int16 *)&self->ethernet_address.octet[4] == *((unsigned __int16 *)v7 + 182);
              goto LABEL_18;
            }
          }
        }
      }
    }

    BOOL v12 = 0;
LABEL_18:

    goto LABEL_19;
  }

  BOOL v12 = 0;
LABEL_19:

  return v12;
}

- (id)copyDictionary
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___NWConcrete_nw_address_endpoint;
  id v3 = -[NWConcrete_nw_endpoint copyDictionary](&v6, sel_copyDictionary);
  uint64_t v4 = v3;
  if (v3) {
    xpc_dictionary_set_data(v3, "address", &self->address, self->address.ss_len);
  }
  return v4;
}

- (const)hostname
{
  if ((*((_BYTE *)self + 390) & 1) == 0)
  {
    v4[0] = MEMORY[0x1895F87A8];
    v4[1] = 3221225472LL;
    v4[2] = __42__NWConcrete_nw_address_endpoint_hostname__block_invoke;
    v4[3] = &unk_189BC93A0;
    v4[4] = self;
    nw_endpoint_locked(self, v4);
  }

  return self->hostname;
}

- (id)echConfig
{
  return self->ech_config;
}

- (void)setEchConfig:(id)a3
{
}

@end
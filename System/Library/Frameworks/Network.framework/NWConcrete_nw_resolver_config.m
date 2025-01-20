@interface NWConcrete_nw_resolver_config
- (NSString)description;
- (NWConcrete_nw_resolver_config)init;
- (id).cxx_construct;
- (void)dealloc;
@end

@implementation NWConcrete_nw_resolver_config

- (id).cxx_construct
{
  *((void *)self + 1) = 0LL;
  *((void *)self + 5) = 0LL;
  *((void *)self + 7) = 0LL;
  *((void *)self + 9) = 0LL;
  *((_DWORD *)self + 22) = 0;
  return self;
}

- (NWConcrete_nw_resolver_config)init
{
  uint64_t v21 = *MEMORY[0x1895F89C0];
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___NWConcrete_nw_resolver_config;
  v2 = -[NWConcrete_nw_resolver_config init](&v16, sel_init);
  v3 = v2;
  if (v2)
  {
    v4 = v2;
    goto LABEL_3;
  }

  __nwlog_obj();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)buf = 136446210;
  v18 = "-[NWConcrete_nw_resolver_config init]";
  v7 = (char *)_os_log_send_and_compose_impl();

  os_log_type_t type = OS_LOG_TYPE_ERROR;
  char v14 = 0;
  if (__nwlog_fault(v7, &type, &v14))
  {
    if (type == OS_LOG_TYPE_FAULT)
    {
      __nwlog_obj();
      v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_log_type_t v9 = type;
      if (os_log_type_enabled(v8, type))
      {
        *(_DWORD *)buf = 136446210;
        v18 = "-[NWConcrete_nw_resolver_config init]";
        _os_log_impl(&dword_181A5C000, v8, v9, "%{public}s [super init] failed", buf, 0xCu);
      }
    }

    else if (v14)
    {
      backtrace_string = (char *)__nw_create_backtrace_string();
      __nwlog_obj();
      v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_log_type_t v11 = type;
      BOOL v12 = os_log_type_enabled(v8, type);
      if (backtrace_string)
      {
        if (v12)
        {
          *(_DWORD *)buf = 136446466;
          v18 = "-[NWConcrete_nw_resolver_config init]";
          __int16 v19 = 2082;
          v20 = backtrace_string;
          _os_log_impl( &dword_181A5C000,  v8,  v11,  "%{public}s [super init] failed, dumping backtrace:%{public}s",  buf,  0x16u);
        }

        free(backtrace_string);
        goto LABEL_20;
      }

      if (v12)
      {
        *(_DWORD *)buf = 136446210;
        v18 = "-[NWConcrete_nw_resolver_config init]";
        _os_log_impl(&dword_181A5C000, v8, v11, "%{public}s [super init] failed, no backtrace", buf, 0xCu);
      }
    }

    else
    {
      __nwlog_obj();
      v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_log_type_t v13 = type;
      if (os_log_type_enabled(v8, type))
      {
        *(_DWORD *)buf = 136446210;
        v18 = "-[NWConcrete_nw_resolver_config init]";
        _os_log_impl(&dword_181A5C000, v8, v13, "%{public}s [super init] failed, backtrace limit exceeded", buf, 0xCu);
      }
    }
  }

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)&OBJC_CLASS___NWConcrete_nw_resolver_config;
  -[NWConcrete_nw_resolver_config dealloc](&v2, sel_dealloc);
}

- (void).cxx_destruct
{
  m_obj = self->agent_fd.m_obj;
  if ((*((_BYTE *)&self->agent_fd + 8) & 1) != 0 && m_obj)
  {
    self->agent_fd.m_obj = 0LL;

    m_obj = self->agent_fd.m_obj;
  }

  self->agent_fd.m_obj = 0LL;

  v4 = self->kernel_event_wrapper.m_obj;
  if ((*((_BYTE *)&self->kernel_event_wrapper + 8) & 1) != 0 && v4)
  {
    self->kernel_event_wrapper.m_obj = 0LL;

    v4 = self->kernel_event_wrapper.m_obj;
  }

  self->kernel_event_wrapper.m_obj = 0LL;

  v5 = self->kernel_event_source.m_obj;
  if ((*((_BYTE *)&self->kernel_event_source + 8) & 1) != 0 && v5)
  {
    self->kernel_event_source.m_obj = 0LL;

    v5 = self->kernel_event_source.m_obj;
  }

  self->kernel_event_source.m_obj = 0LL;

  v6 = self->dictionary.m_obj;
  if ((*((_BYTE *)&self->dictionary + 8) & 1) != 0 && v6)
  {
    self->dictionary.m_obj = 0LL;

    v6 = self->dictionary.m_obj;
  }

  self->dictionary.m_obj = 0LL;
}

- (NSString)description
{
  uint64_t v43 = 0LL;
  v44 = &v43;
  uint64_t v45 = 0x13812000000LL;
  v46 = __Block_byref_object_copy__52869;
  v47 = __Block_byref_object_dispose__52870;
  uint64_t v3 = MEMORY[0x189614768];
  uint64_t v4 = MEMORY[0x189614768] + 64LL;
  v54[0] = MEMORY[0x189614768] + 64LL;
  v5 = (uint64_t *)MEMORY[0x189614738];
  uint64_t v6 = *(void *)(MEMORY[0x189614738] + 8LL);
  uint64_t v7 = *(void *)(MEMORY[0x189614738] + 16LL);
  v48 = &unk_18296448D;
  uint64_t v49 = v6;
  *(uint64_t *)((char *)&v50[-1] + *(void *)(v6 - 24)) = v7;
  v8 = (std::ios_base *)((char *)&v50[-1] + *(void *)(v49 - 24));
  std::ios_base::init(v8, v50);
  v8[1].__vftable = 0LL;
  v8[1].__fmtflags_ = -1;
  uint64_t v49 = v3 + 24;
  v54[0] = v4;
  std::streambuf::basic_streambuf();
  uint64_t v9 = MEMORY[0x189614750];
  v50[0] = MEMORY[0x189614750] + 16LL;
  __int128 v51 = 0u;
  __int128 v52 = 0u;
  int v53 = 16;
  v10 = v44;
  unsigned int v11 = nw_resolver_config_get_class(self);
  BOOL v12 = v10 + 6;
  if (v11 > 4) {
    os_log_type_t v13 = "unknown";
  }
  else {
    os_log_type_t v13 = off_189BC0CB0[v11];
  }
  size_t v14 = strlen(v13);
  v15 = std::__put_character_sequence[abi:nn180100]<char,std::char_traits<char>>(v12, (uint64_t)v13, v14);
  std::__put_character_sequence[abi:nn180100]<char,std::char_traits<char>>(v15, (uint64_t)" ", 1LL);
  unsigned int protocol = nw_resolver_config_get_protocol(self);
  if (protocol > 3) {
    v17 = "unknown";
  }
  else {
    v17 = off_189BC0CD8[protocol];
  }
  size_t v18 = strlen(v17);
  std::__put_character_sequence[abi:nn180100]<char,std::char_traits<char>>(v12, (uint64_t)v17, v18);
  std::__put_character_sequence[abi:nn180100]<char,std::char_traits<char>>(v44 + 6, (uint64_t)"servers = [ ", 12LL);
  uint64_t v19 = MEMORY[0x1895F87A8];
  v42[0] = MEMORY[0x1895F87A8];
  v42[1] = 3221225472LL;
  v42[2] = __44__NWConcrete_nw_resolver_config_description__block_invoke;
  v42[3] = &unk_189BC3B88;
  v42[4] = &v43;
  nw_resolver_config_enumerate_name_servers(self, v42);
  std::__put_character_sequence[abi:nn180100]<char,std::char_traits<char>>(v44 + 6, (uint64_t)"] domains = [ ", 14LL);
  v41[0] = v19;
  v41[1] = 3221225472LL;
  v41[2] = __44__NWConcrete_nw_resolver_config_description__block_invoke_2;
  v41[3] = &unk_189BC3B88;
  v41[4] = &v43;
  nw_resolver_config_enumerate_search_domains(self, v41);
  std::__put_character_sequence[abi:nn180100]<char,std::char_traits<char>>(v44 + 6, (uint64_t)"]", 1LL);
  provider_name = (const char *)nw_resolver_config_get_provider_name(self);
  uint64_t provider_path = nw_resolver_config_get_provider_path(self);
  if (provider_name)
  {
    v22 = (const char *)provider_path;
    v23 = v44 + 6;
    std::__put_character_sequence[abi:nn180100]<char,std::char_traits<char>>(v44 + 6, (uint64_t)" provider = ", 12LL);
    if (v22)
    {
      size_t v24 = strlen(provider_name);
      std::__put_character_sequence[abi:nn180100]<char,std::char_traits<char>>(v23, (uint64_t)provider_name, v24);
    }

    else
    {
      v22 = provider_name;
    }

    size_t v25 = strlen(v22);
    std::__put_character_sequence[abi:nn180100]<char,std::char_traits<char>>(v23, (uint64_t)v22, v25);
  }

  v26 = v44;
  int v27 = *((_DWORD *)v44 + 38);
  if ((v27 & 0x10) != 0)
  {
    unint64_t v30 = v44[18];
    unint64_t v31 = v44[13];
    if (v30 < v31)
    {
      v44[18] = v31;
      unint64_t v30 = v31;
    }

    v32 = (const void **)(v26 + 12);
  }

  else
  {
    if ((v27 & 8) == 0)
    {
      size_t v28 = 0LL;
      HIBYTE(v40) = 0;
      v29 = __p;
      goto LABEL_27;
    }

    v32 = (const void **)(v44 + 9);
    unint64_t v30 = v44[11];
  }

  v33 = *v32;
  size_t v28 = v30 - (void)*v32;
  if (v28 >= 0x7FFFFFFFFFFFFFF8LL) {
    abort();
  }
  if (v28 >= 0x17)
  {
    uint64_t v34 = (v28 & 0xFFFFFFFFFFFFFFF8LL) + 8;
    if ((v28 | 7) != 0x17) {
      uint64_t v34 = v28 | 7;
    }
    uint64_t v35 = v34 + 1;
    v29 = operator new(v34 + 1);
    __p[1] = (void *)v28;
    int64_t v40 = v35 | 0x8000000000000000LL;
    __p[0] = v29;
    goto LABEL_26;
  }

  HIBYTE(v40) = v30 - *(_BYTE *)v32;
  v29 = __p;
  if (v28) {
LABEL_26:
  }
    memmove(v29, v33, v28);
LABEL_27:
  *((_BYTE *)v29 + v28) = 0;
  if (v40 >= 0) {
    v36 = __p;
  }
  else {
    v36 = (void **)__p[0];
  }
  v37 = (__CFString *)CFStringCreateWithCString(0LL, (const char *)v36, 0x8000100u);
  if (SHIBYTE(v40) < 0) {
    operator delete(__p[0]);
  }
  _Block_object_dispose(&v43, 8);
  uint64_t v49 = *v5;
  *(uint64_t *)((char *)&v50[-1] + *(void *)(v49 - 24)) = v5[3];
  v50[0] = v9 + 16;
  if (SBYTE7(v52) < 0) {
    operator delete((void *)v51);
  }
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  MEMORY[0x186E10044](v54);
  return (NSString *)v37;
}

@end
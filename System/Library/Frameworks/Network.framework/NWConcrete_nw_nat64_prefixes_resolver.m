@interface NWConcrete_nw_nat64_prefixes_resolver
- (id).cxx_construct;
- (void)dealloc;
@end

@implementation NWConcrete_nw_nat64_prefixes_resolver

- (void)dealloc
{
  uint64_t v31 = *MEMORY[0x1895F89C0];
  if (*((void *)self + 4))
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    id v3 = (id)gLogObj;
    *(_DWORD *)buf = 136446210;
    v28 = "-[NWConcrete_nw_nat64_prefixes_resolver dealloc]";
    int v22 = 12;
    v21 = buf;
    v4 = (char *)_os_log_send_and_compose_impl();

    os_log_type_t v26 = OS_LOG_TYPE_ERROR;
    char v25 = 0;
    if (v26 == OS_LOG_TYPE_FAULT)
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v5 = (os_log_s *)(id)gLogObj;
      os_log_type_t v6 = v26;
      if (os_log_type_enabled(v5, v26))
      {
        *(_DWORD *)buf = 136446210;
        v28 = "-[NWConcrete_nw_nat64_prefixes_resolver dealloc]";
        _os_log_impl( &dword_181A5C000,  v5,  v6,  "%{public}s over-release of nw_nat64_prefixes_resolver_t! Object should not be internally retained and deallocating",  buf,  0xCu);
      }

- (void).cxx_destruct
{
}

- (id).cxx_construct
{
  *((_DWORD *)self + 2) = 0;
  return self;
}

@end
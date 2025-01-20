@interface NWConcrete_nw_protocol_instance_registrar
- (NSString)description;
- (id).cxx_construct;
- (void)dealloc;
@end

@implementation NWConcrete_nw_protocol_instance_registrar

- (void)dealloc
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  if (gLogDatapath)
  {
    __nwlog_obj();
    v3 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136446466;
      v6 = "-[NWConcrete_nw_protocol_instance_registrar dealloc]";
      __int16 v7 = 2048;
      v8 = self;
      _os_log_impl( &dword_181A5C000,  v3,  OS_LOG_TYPE_DEBUG,  "%{public}s <nw_protocol_instance_registrar %p> dealloc",  buf,  0x16u);
    }
  }

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___NWConcrete_nw_protocol_instance_registrar;
  -[NWConcrete_nw_protocol_instance_registrar dealloc](&v4, sel_dealloc);
}

- (NSString)description
{
  return (NSString *)(id)CFStringCreateWithFormat( (CFAllocatorRef)*MEMORY[0x189604DB0],  0LL,  @"<nw_protocol_instance_registrar %p %s>",  self,  (char *)self + 24);
}

- (id).cxx_construct
{
  *((_DWORD *)self + 2) = 0;
  return self;
}

@end
@interface MCMCodeSignInfo
- (MCMCodeSignInfo)initWithAuditToken:(id *)a3;
- (MCMCodeSignInfo)initWithURL:(id)a3 error:(unint64_t *)a4;
- (NSDictionary)entitlements;
- (NSString)identifier;
- (unsigned)platform;
@end

@implementation MCMCodeSignInfo

- (MCMCodeSignInfo)initWithURL:(id)a3 error:(unint64_t *)a4
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___MCMCodeSignInfo;

  if (a4) {
    *a4 = 72LL;
  }
  return 0LL;
}

- (MCMCodeSignInfo)initWithAuditToken:(id *)a3
{
  uint64_t v27 = *MEMORY[0x1895F89C0];

  __int128 v4 = *(_OWORD *)&a3->var0[4];
  *(_OWORD *)buf = *(_OWORD *)a3->var0;
  *(_OWORD *)&buf[16] = v4;
  int pid = container_audit_token_get_pid();
  __int128 v6 = *(_OWORD *)&a3->var0[4];
  *(_OWORD *)buf = *(_OWORD *)a3->var0;
  *(_OWORD *)&buf[16] = v6;
  uint64_t v7 = container_audit_token_copy_codesign_identifier();
  uint64_t __s = v7;
  if (!v7)
  {
    container_log_handle_for_category();
    v19 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = pid;
      _os_log_error_impl( &dword_188846000,  v19,  OS_LOG_TYPE_ERROR,  "[pid:%d] could not get codesign identifier",  buf,  8u);
    }

    v12 = 0LL;
    v14 = 0LL;
    v9 = 0LL;
    goto LABEL_16;
  }

  v8 = (void *)v7;
  [NSString stringWithUTF8String:v7];
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  free(v8);
  memset_s(&__s, 8uLL, 0, 8uLL);
  __int128 v10 = *(_OWORD *)&a3->var0[4];
  *(_OWORD *)buf = *(_OWORD *)a3->var0;
  *(_OWORD *)&buf[16] = v10;
  uint64_t v11 = container_audit_token_copy_entitlement();
  if (!v11)
  {
    container_log_handle_for_category();
    v20 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      *(void *)&buf[4] = v9;
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = pid;
      _os_log_error_impl( &dword_188846000,  v20,  OS_LOG_TYPE_ERROR,  "[%@ (pid:%d)] could not get entitlements (assuming none)",  buf,  0x12u);
    }

    v12 = 0LL;
    goto LABEL_15;
  }

  v12 = (void *)v11;
  uint64_t v13 = _CFXPCCreateCFObjectFromXPCObject();
  if (!v13)
  {
    container_log_handle_for_category();
    v21 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      *(void *)&buf[4] = v9;
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = pid;
      _os_log_error_impl( &dword_188846000,  v21,  OS_LOG_TYPE_ERROR,  "[%@ (pid:%d)] could not translate entitlements (assuming none)",  buf,  0x12u);
    }

LABEL_15:
    v14 = 0LL;
LABEL_16:
    v18 = 0LL;
    goto LABEL_17;
  }

  v14 = (void *)v13;
  __int128 v15 = *(_OWORD *)&a3->var0[4];
  *(_OWORD *)buf = *(_OWORD *)a3->var0;
  *(_OWORD *)&buf[16] = v15;
  unsigned int platform = container_audit_token_get_platform();
  v24.receiver = 0LL;
  v24.super_class = (Class)&OBJC_CLASS___MCMCodeSignInfo;
  v17 = -[MCMCodeSignInfo init](&v24, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_identifier, v9);
    objc_storeStrong((id *)&v18->_entitlements, v14);
    v18->_unsigned int platform = platform;
  }

- (NSDictionary)entitlements
{
  return self->_entitlements;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (unsigned)platform
{
  return self->_platform;
}

- (void).cxx_destruct
{
}

@end
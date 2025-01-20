@interface NSExtension
- (id)extensionHostContextForUUID:(void *)a1;
@end

@implementation NSExtension

- (id)extensionHostContextForUUID:(void *)a1
{
  if (a1)
  {
    uint64_t v2 = [a1 _extensionContextForUUID:a2];
    v3 = (void *)v2;
    if (v2)
    {
      id v4 = *(id *)(v2 + 72);
      if (v4 || ([v3 _auxiliaryConnection], (id v4 = (id)objc_claimAutoreleasedReturnValue()) != 0))
      {
        v5 = objc_alloc(&OBJC_CLASS___NEProcessIdentity);
        [v4 _xpcConnection];
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        id v7 = -[NEProcessIdentity initFromXPCConnection:](v5, "initFromXPCConnection:", v6);
        objc_setProperty_atomic(v3, v8, v7, 64LL);

        if (objc_getProperty(v3, v9, 64LL, 1))
        {

          goto LABEL_7;
        }

        ne_log_obj();
        v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)v13 = 0;
          _os_log_error_impl( &dword_1876B1000,  v11,  OS_LOG_TYPE_ERROR,  "Failed to create a NEProcessIdentity object",  v13,  2u);
        }
      }

      else
      {
        ne_log_obj();
        id v4 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled((os_log_t)v4, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl( &dword_1876B1000,  (os_log_t)v4,  OS_LOG_TYPE_ERROR,  "Failed to derive the process identity, no vendor connection available",  buf,  2u);
        }
      }

      id v10 = 0LL;
      goto LABEL_14;
    }

@end
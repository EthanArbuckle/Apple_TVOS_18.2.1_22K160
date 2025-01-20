@interface PKSandboxExtension
- (BOOL)isEqual:(id)a3;
- (NSString)token;
- (PKSandboxExtension)initWithExtension:(id)a3 provider:(id)a4;
- (PKSandboxProvider)provider;
- (int64_t)handle;
- (void)consume;
- (void)dealloc;
- (void)expel;
- (void)setHandle:(int64_t)a3;
@end

@implementation PKSandboxExtension

- (PKSandboxExtension)initWithExtension:(id)a3 provider:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___PKSandboxExtension;
  v9 = -[PKSandboxExtension init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_token, a3);
    v10->_handle = -1LL;
    objc_storeStrong((id *)&v10->_provider, a4);
  }

  return v10;
}

- (void)dealloc
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___PKSandboxExtension;
  -[PKSandboxExtension dealloc](&v6, sel_dealloc);
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend_token(self, v5, v6, v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_token(v4, v10, v11, v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    char isEqualToString = objc_msgSend_isEqualToString_(v9, v15, (uint64_t)v14, v16, v17);
  }

  else
  {
    char isEqualToString = 0;
  }

  return isEqualToString;
}

- (void)consume
{
  if (objc_msgSend_handle(self, a2, v2, v3, v4) == -1)
  {
    objc_msgSend_provider(self, v6, v7, v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    id v15 = objc_msgSend_token(self, v11, v12, v13, v14);
    uint64_t v20 = objc_msgSend_UTF8String(v15, v16, v17, v18, v19);
    uint64_t v24 = objc_msgSend_sandbox_extension_consume_(v10, v21, v20, v22, v23);
    objc_msgSend_setHandle_(self, v25, v24, v26, v27);

    uint64_t v32 = objc_msgSend_handle(self, v28, v29, v30, v31);
    pklog_handle_for_category(4);
    v33 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    v34 = v33;
    if (v32 == -1)
    {
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
        sub_186A26B64(v34);
      }
    }

    else if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
    {
      sub_186A26BEC(self, (const char *)v34, v35, v36, v37);
    }
  }

- (void)expel
{
  if (objc_msgSend_handle(self, a2, v2, v3, v4) != -1)
  {
    objc_msgSend_provider(self, v6, v7, v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v15 = objc_msgSend_handle(self, v11, v12, v13, v14);
    int v19 = objc_msgSend_sandbox_extension_release_(v10, v16, v15, v17, v18);

    pklog_handle_for_category(4);
    uint64_t v20 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    v21 = (char *)v20;
    if (v19)
    {
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        sub_186A26CAC(self, v21, v22, v23, v24);
      }
    }

    else if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    {
      sub_186A26C4C(self, v21, v25, v26, v27);
    }

    objc_msgSend_setHandle_(self, v28, -1, v29, v30);
  }

- (int64_t)handle
{
  return self->_handle;
}

- (void)setHandle:(int64_t)a3
{
  self->_handle = a3;
}

- (NSString)token
{
  return self->_token;
}

- (PKSandboxProvider)provider
{
  return self->_provider;
}

- (void).cxx_destruct
{
}

  ;
}

@end
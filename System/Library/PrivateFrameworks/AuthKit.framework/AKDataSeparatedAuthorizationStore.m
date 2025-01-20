@interface AKDataSeparatedAuthorizationStore
- (AKDataSeparatedAuthorizationStore)initWithContainerPath:(id)a3 withSandboxToken:(char *)a4;
- (NSString)containerPath;
- (char)token;
- (void)cleanup;
- (void)perform:(id)a3;
- (void)prepare;
- (void)setContainerPath:(id)a3;
- (void)setToken:(char *)a3;
@end

@implementation AKDataSeparatedAuthorizationStore

- (AKDataSeparatedAuthorizationStore)initWithContainerPath:(id)a3 withSandboxToken:(char *)a4
{
  id v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___AKDataSeparatedAuthorizationStore;
  v7 = -[AKAuthorizationStore initWithPath:](&v10, "initWithPath:", v6);
  v8 = v7;
  if (v7)
  {
    -[AKDataSeparatedAuthorizationStore setContainerPath:](v7, "setContainerPath:", v6);
    -[AKDataSeparatedAuthorizationStore setToken:](v8, "setToken:", a4);
  }

  return v8;
}

- (void)prepare
{
  v3 = -[AKDataSeparatedAuthorizationStore token](self, "token");
  if (v3)
  {
    v3 = (char *)sandbox_extension_consume(-[AKDataSeparatedAuthorizationStore token](self, "token"));
    p_handle = &self->handle;
    int64_t *p_handle = (int64_t)v3;
  }

  else
  {
    p_handle = &self->handle;
    int64_t *p_handle = -1LL;
  }

  uint64_t v6 = _AKLogSiwa(v3, v4);
  v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    sub_10012E838(p_handle, v7);
  }
}

- (void)cleanup
{
}

- (void)perform:(id)a3
{
  id v4 = a3;
  -[AKDataSeparatedAuthorizationStore prepare](self, "prepare");
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___AKDataSeparatedAuthorizationStore;
  -[AKAuthorizationStore perform:](&v5, "perform:", v4);

  -[AKDataSeparatedAuthorizationStore cleanup](self, "cleanup");
}

- (NSString)containerPath
{
  return self->_containerPath;
}

- (void)setContainerPath:(id)a3
{
}

- (char)token
{
  return self->_token;
}

- (void)setToken:(char *)a3
{
  self->_token = a3;
}

- (void).cxx_destruct
{
}

@end
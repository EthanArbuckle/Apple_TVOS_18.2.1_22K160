@interface SandboxManager
+ (id)getManager;
- (NSMutableDictionary)sandboxHandles;
- (OS_os_log)log_handle;
- (SandboxManager)init;
- (void)setLog_handle:(id)a3;
- (void)setSandboxHandles:(id)a3;
@end

@implementation SandboxManager

- (SandboxManager)init
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___SandboxManager;
  v2 = -[SandboxManager init](&v8, "init");
  if (v2)
  {
    os_log_t v3 = os_log_create("com.apple.libcryptex", "SandboxManager");
    -[SandboxManager setLog_handle:](v2, "setLog_handle:", v3);

    v4 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    -[SandboxManager setSandboxHandles:](v2, "setSandboxHandles:", v4);

    v5 = (void *)objc_claimAutoreleasedReturnValue(-[SandboxManager sandboxHandles](v2, "sandboxHandles"));
    if (!v5) {
      sub_10003F92C(&v7, v9);
    }
  }

  return v2;
}

+ (id)getManager
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10001EE94;
  block[3] = &unk_100056268;
  block[4] = a1;
  if (qword_10005A858 != -1) {
    dispatch_once(&qword_10005A858, block);
  }
  return (id)qword_10005A860;
}

- (OS_os_log)log_handle
{
  return self->_log_handle;
}

- (void)setLog_handle:(id)a3
{
}

- (NSMutableDictionary)sandboxHandles
{
  return self->_sandboxHandles;
}

- (void)setSandboxHandles:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
@interface UARPSandboxExtension
+ (id)readWriteTokenStringWithURL:(id)a3;
- (UARPSandboxExtension)initWithTokenString:(id)a3;
- (void)dealloc;
@end

@implementation UARPSandboxExtension

+ (id)readWriteTokenStringWithURL:(id)a3
{
  if (!-[NSFileManager fileExistsAtPath:]( +[NSFileManager defaultManager](NSFileManager, "defaultManager"),  "fileExistsAtPath:",  [a3 path]))
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100047F8C((uint64_t)a3);
    }
    return 0LL;
  }

  v4 = (void *)sandbox_extension_issue_file( "com.apple.app-sandbox.read-write",  objc_msgSend(objc_msgSend(a3, "path"), "UTF8String"),  0);
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    int v7 = 136315394;
    v8 = "+[UARPSandboxExtension readWriteTokenStringWithURL:]";
    __int16 v9 = 2112;
    id v10 = a3;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "%s: Generating Read-Write Sandbox Extension Token for %@ ",  (uint8_t *)&v7,  0x16u);
  }

  if (!v4) {
    return 0LL;
  }
  v5 = +[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v4);
  free(v4);
  return v5;
}

- (UARPSandboxExtension)initWithTokenString:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___UARPSandboxExtension;
  v4 = -[UARPSandboxExtension init](&v7, "init");
  if (v4)
  {
    uint64_t v5 = sandbox_extension_consume([a3 UTF8String]);
    v4->_sandboxExtensionHandle = v5;
    if (v5 == -1)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_10004801C();
      }
      return 0LL;
    }
  }

  return v4;
}

- (void)dealloc
{
  int64_t sandboxExtensionHandle = self->_sandboxExtensionHandle;
  if (sandboxExtensionHandle != -1)
  {
    sandbox_extension_release(sandboxExtensionHandle, a2);
    self->_int64_t sandboxExtensionHandle = -1LL;
  }

@end
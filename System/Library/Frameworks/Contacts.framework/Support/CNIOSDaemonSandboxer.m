@interface CNIOSDaemonSandboxer
+ (void)enterSandbox;
@end

@implementation CNIOSDaemonSandboxer

+ (void)enterSandbox
{
  if ((_set_user_dir_suffix("com.apple.contactsd", a2) & 1) == 0)
  {
    v2 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[CNContactsDaemonLogs xpc](&OBJC_CLASS___CNContactsDaemonLogs, "xpc"));
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      sub_10000DD6C(v2);
    }
  }

@end
@interface DMPluginpreferencesInternationalSupportMigrator
- (id)activity;
- (void)faultWithLog:(id)a3 message:(id)a4;
@end

@implementation DMPluginpreferencesInternationalSupportMigrator

- (id)activity
{
  return  _os_activity_create( (void *)&_mh_execute_header,  "plugin.preferencesInternationalSupportMigrator",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_DEFAULT);
}

- (void)faultWithLog:(id)a3 message:(id)a4
{
  if (os_log_type_enabled((os_log_t)a3, OS_LOG_TYPE_FAULT)) {
    sub_100007C40();
  }
}

@end
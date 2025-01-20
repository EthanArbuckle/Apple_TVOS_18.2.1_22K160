@interface DTMemlimitAssertionFactory
- (id)_removeMemoryLimitsForPid:(int)a3;
- (id)assertionForPid:(int)a3;
@end

@implementation DTMemlimitAssertionFactory

- (id)assertionForPid:(int)a3
{
  return -[DTMemlimitAssertionFactory _removeMemoryLimitsForPid:](self, "_removeMemoryLimitsForPid:", *(void *)&a3);
}

- (id)_removeMemoryLimitsForPid:(int)a3
{
  unint64_t v12 = 0xFFFFFFFF00000000LL;
  int v11 = -1;
  int v13 = 0;
  int v4 = memorystatus_control(7LL, *(void *)&a3, 0LL, &v11, 16LL);
  if (v4)
  {
    int v5 = v4;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109376;
      int v15 = a3;
      __int16 v16 = 1024;
      int v17 = v5;
      v6 = "DTMemlimitAssertionFactory: failed to remove active and inactive memory limits for pid %d (result = %d)";
      os_log_type_t v7 = OS_LOG_TYPE_ERROR;
LABEL_7:
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, v7, v6, buf, 0xEu);
    }
  }

  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
    unsigned int v9 = [v8 BOOLForKey:@"DTMemlimitAssertionFactoryLog"];

    if (v9 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109376;
      int v15 = a3;
      __int16 v16 = 1024;
      int v17 = 0;
      v6 = "DTMemlimitAssertionFactory: removed active and inactive memory limits for pid %d (result = %d)";
      os_log_type_t v7 = OS_LOG_TYPE_INFO;
      goto LABEL_7;
    }
  }

  return 0LL;
}

@end
@interface DeviceStateMonitor
- (DeviceStateMonitor)init;
@end

@implementation DeviceStateMonitor

- (DeviceStateMonitor)init
{
  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___DeviceStateMonitor;
  id v2 = -[DeviceStateMonitor init](&v19, "init");
  if (v2)
  {
    dispatch_queue_attr_t v3 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v3);
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(17LL, 0LL);
    v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
    dispatch_queue_t v7 = dispatch_queue_create_with_target_V2("com.apple.appstored.DeviceStateMonitor", v4, v6);
    v8 = (void *)*((void *)v2 + 1);
    *((void *)v2 + 1) = v7;

    v9 = sem_open("appstored.run-once", 0);
    v10 = v9;
    if (v9 != (sem_t *)-1LL) {
      sem_close(v9);
    }
    uint64_t v11 = ASDLogHandleForCategory(14LL);
    v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
    if (v10 == (sem_t *)-1LL)
    {
      if (v13)
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "[Device] First boot. Clearing once per boot items",  buf,  2u);
      }

      sub_1002F97C0((uint64_t)&OBJC_CLASS___AppDefaultsManager, 0LL);
      v14 = sem_open("appstored.run-once", 512, 256LL, 0LL);
      if (v14 != (sem_t *)-1LL)
      {
        sem_close(v14);
LABEL_14:
        dispatch_async(*((dispatch_queue_t *)v2 + 1), &stru_1003EBEB0);
        return (DeviceStateMonitor *)v2;
      }

      uint64_t v15 = ASDLogHandleForCategory(14LL);
      v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v17 = __error();
        v18 = strerror(*v17);
        *(_DWORD *)buf = 136315394;
        v21 = v18;
        __int16 v22 = 2080;
        v23 = "appstored.run-once";
        _os_log_error_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_ERROR,  "[Device] Failed to create first-run semaphore: %s sem: %s",  buf,  0x16u);
      }
    }

    else if (v13)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "[Device] Starting", buf, 2u);
    }

    goto LABEL_14;
  }

  return (DeviceStateMonitor *)v2;
}

- (void).cxx_destruct
{
}

@end
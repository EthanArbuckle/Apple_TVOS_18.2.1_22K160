@interface IDSDevicePolicyController
+ (id)sharedInstance;
- (BOOL)shouldBlackOutDeviceWithCbuuid:(id)a3;
- (IDSDevicePolicyController)init;
- (void)endFairplayAuthenticationForDeviceWithCbuuid:(id)a3;
- (void)startFairplayAuthenticationForDeviceWithCbuuid:(id)a3;
@end

@implementation IDSDevicePolicyController

+ (id)sharedInstance
{
  if (qword_1009C0D28 != -1) {
    dispatch_once(&qword_1009C0D28, &stru_1009042B8);
  }
  return (id)qword_1009C0D30;
}

- (IDSDevicePolicyController)init
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___IDSDevicePolicyController;
  v2 = -[IDSDevicePolicyController init](&v7, "init");
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    v4 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    devices = v3->_devices;
    v3->_devices = v4;
  }

  return v3;
}

- (void)startFairplayAuthenticationForDeviceWithCbuuid:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_devices, "objectForKey:", v4));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:@"start-count"]);
  objc_super v7 = (char *)[v6 integerValue];

  devices = self->_devices;
  v21[0] = @"start-count";
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v7 + 1));
  v21[1] = @"start-time";
  v22[0] = v9;
  v10 = +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", ids_monotonic_time(v9));
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  v22[1] = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v22,  v21,  2LL));
  -[NSMutableDictionary setObject:forKey:](devices, "setObject:forKey:", v12, v4);

  uint64_t v13 = OSLogHandleForIDSCategory("DevicePolicy");
  v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v15 = self->_devices;
    *(_DWORD *)buf = 138412546;
    id v18 = v4;
    __int16 v19 = 2112;
    v20 = v15;
    _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "started policy for %@, devices: %@",  buf,  0x16u);
  }

  os_unfair_lock_unlock(&self->_lock);
}

- (void)endFairplayAuthenticationForDeviceWithCbuuid:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  -[NSMutableDictionary removeObjectForKey:](self->_devices, "removeObjectForKey:", v4);
  os_unfair_lock_unlock(&self->_lock);
}

- (BOOL)shouldBlackOutDeviceWithCbuuid:(id)a3
{
  id v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  uint64_t v6 = OSLogHandleForIDSCategory("DevicePolicy");
  objc_super v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    devices = self->_devices;
    *(_DWORD *)buf = 138412290;
    double v32 = *(double *)&devices;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "checking blackout for %@", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled(v9) && _IDSShouldLog(2LL, @"DevicePolicy"))
  {
    v30 = self->_devices;
    *(void *)&double v10 = _IDSLogV(2LL, @"IDSFoundation", @"DevicePolicy", @"checking blackout for %@").n128_u64[0];
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_devices, "objectForKey:", v4, v10, v30));
  v12 = v11;
  if (!v11) {
    goto LABEL_22;
  }
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKey:@"start-time"]);
  [v13 doubleValue];
  double v15 = v14;

  double v17 = ids_monotonic_time(v16) - v15;
  if (v17 >= 10800.0)
  {
    -[NSMutableDictionary removeObjectForKey:](self->_devices, "removeObjectForKey:", v4);
    uint64_t v25 = OSLogHandleForTransportCategory("DevicePolicy");
    v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218240;
      double v32 = v17;
      __int16 v33 = 1024;
      int v34 = 10800;
      _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEFAULT,  "repeated fairplay failure blackout lifted (elapse %0.6lf > window %0.1d)",  buf,  0x12u);
    }

    uint64_t v28 = os_log_shim_legacy_logging_enabled(v27);
    if ((_DWORD)v28)
    {
      if (_IDSShouldLogTransport(v28))
      {
        _IDSLogTransport( @"DevicePolicy",  @"IDS",  @"repeated fairplay failure blackout lifted (elapse %0.6lf > window %0.1d)");
        if (_IDSShouldLog(0LL, @"DevicePolicy"))
        {
          _IDSLogV( 0LL,  @"IDSFoundation",  @"DevicePolicy",  @"repeated fairplay failure blackout lifted (elapse %0.6lf > window %0.1d)");
          BOOL v24 = 0;
          goto LABEL_23;
        }
      }
    }

- (void).cxx_destruct
{
}

@end
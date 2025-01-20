@interface CSSmartSiriVolumeServiceProxy
- (CSSmartSiriVolumeManager)ssvManager;
- (CSSmartSiriVolumeServiceProxy)init;
- (OS_dispatch_queue)queue;
- (OS_xpc_object)xpcConnection;
- (void)getVolumeForTTSType:(unint64_t)a3 withContext:(id)a4 reply:(id)a5;
- (void)setListenerDelegate:(id)a3;
- (void)setPermanentVolumeOffsetWithDirection:(BOOL)a3;
- (void)setQueue:(id)a3;
- (void)setSmartSiriVolumeDirection:(BOOL)a3;
- (void)setSmartSiriVolumePercentage:(float)a3;
- (void)setSsvManager:(id)a3;
- (void)setXpcConnection:(id)a3;
@end

@implementation CSSmartSiriVolumeServiceProxy

- (CSSmartSiriVolumeServiceProxy)init
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___CSSmartSiriVolumeServiceProxy;
  v2 = -[CSSmartSiriVolumeServiceProxy init](&v8, "init");
  if (v2
    && (uint64_t v3 = objc_claimAutoreleasedReturnValue(+[CSSmartSiriVolumeManager sharedInstance](&OBJC_CLASS___CSSmartSiriVolumeManager, "sharedInstance")),
        ssvManager = v2->_ssvManager,
        v2->_ssvManager = (CSSmartSiriVolumeManager *)v3,
        ssvManager,
        !v2->_ssvManager))
  {
    v6 = (os_log_s *)CSLogCategoryASV;
    if (os_log_type_enabled(CSLogCategoryASV, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v10 = "-[CSSmartSiriVolumeServiceProxy init]";
      _os_log_error_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_ERROR,  "%s ERR: Failed to initialize SSV Manager!",  buf,  0xCu);
    }

    v5 = 0LL;
  }

  else
  {
    v5 = v2;
  }

  return v5;
}

- (void)setListenerDelegate:(id)a3
{
}

- (void)getVolumeForTTSType:(unint64_t)a3 withContext:(id)a4 reply:(id)a5
{
  v7 = (void (**)(id, void *, void *))a5;
  objc_super v8 = (void *)objc_claimAutoreleasedReturnValue([a4 objectForKeyedSubscript:@"overrideMediaVolume"]);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[CSSmartSiriVolumeManager sharedInstance](&OBJC_CLASS___CSSmartSiriVolumeManager, "sharedInstance"));
  if (v9)
  {
    id v10 = [v9 getVolumeForTTSType:a3 withOverrideMediaVolume:v8 WithRequestTime:mach_absolute_time()];
    uint64_t v11 = objc_claimAutoreleasedReturnValue(v10);
    if (v11)
    {
      v12 = (void *)v11;
      v13 = 0LL;
      if (!v7) {
        goto LABEL_13;
      }
      goto LABEL_12;
    }

    v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"SSV Manager returned estimate as nil"));
    v20 = (os_log_s *)CSLogCategoryASV;
    if (os_log_type_enabled(CSLogCategoryASV, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v27 = "-[CSSmartSiriVolumeServiceProxy getVolumeForTTSType:withContext:reply:]";
      __int16 v28 = 2114;
      v29 = v14;
      _os_log_error_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "%s ERR: %{public}@", buf, 0x16u);
    }

    uint64_t v21 = CSErrorDomain;
    v24 = @"reason";
    v25 = v14;
    v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v25,  &v24,  1LL));
    uint64_t v18 = v21;
    uint64_t v19 = 1701LL;
  }

  else
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"SmartSiriVolume not supported on this device type. smartSiriVolume : %p",  0LL));
    v15 = (os_log_s *)CSLogCategoryASV;
    if (os_log_type_enabled(CSLogCategoryASV, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v27 = "-[CSSmartSiriVolumeServiceProxy getVolumeForTTSType:withContext:reply:]";
      __int16 v28 = 2114;
      v29 = v14;
      _os_log_error_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%s ERR: %{public}@", buf, 0x16u);
    }

    uint64_t v16 = CSErrorDomain;
    v22 = @"reason";
    v23 = v14;
    v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v23,  &v22,  1LL));
    uint64_t v18 = v16;
    uint64_t v19 = 1702LL;
  }

  v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v18,  v19,  v17));

  v12 = 0LL;
  if (v7) {
LABEL_12:
  }
    v7[2](v7, v13, v12);
LABEL_13:
}

- (void)setSmartSiriVolumePercentage:(float)a3
{
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[CSSmartSiriVolumeManager sharedInstance](&OBJC_CLASS___CSSmartSiriVolumeManager, "sharedInstance"));
  v6 = v4;
  if (v4)
  {
    *(float *)&double v5 = a3;
    [v4 setSmartSiriVolumePercentage:v5];
  }

  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"SmartSiriVolume not supported on this device type. smartSiriVolume : %p",  0LL));
    objc_super v8 = (os_log_s *)CSLogCategoryASV;
    if (os_log_type_enabled(CSLogCategoryASV, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      id v10 = "-[CSSmartSiriVolumeServiceProxy setSmartSiriVolumePercentage:]";
      __int16 v11 = 2114;
      v12 = v7;
      _os_log_error_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "%s ERR: %{public}@", buf, 0x16u);
    }
  }
}

- (void)setSmartSiriVolumeDirection:(BOOL)a3
{
  BOOL v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[CSSmartSiriVolumeManager sharedInstance](&OBJC_CLASS___CSSmartSiriVolumeManager, "sharedInstance"));
  double v5 = v4;
  if (v4)
  {
    [v4 setSmartSiriVolumeDirection:v3];
  }

  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"SmartSiriVolume not supported on this device type. smartSiriVolume : %p",  0LL));
    v7 = (os_log_s *)CSLogCategoryASV;
    if (os_log_type_enabled(CSLogCategoryASV, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v9 = "-[CSSmartSiriVolumeServiceProxy setSmartSiriVolumeDirection:]";
      __int16 v10 = 2114;
      __int16 v11 = v6;
      _os_log_error_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "%s ERR: %{public}@", buf, 0x16u);
    }
  }
}

- (void)setPermanentVolumeOffsetWithDirection:(BOOL)a3
{
  BOOL v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[CSSmartSiriVolumeManager sharedInstance](&OBJC_CLASS___CSSmartSiriVolumeManager, "sharedInstance"));
  double v5 = v4;
  if (v4)
  {
    [v4 setPermanentVolumeOffsetWithDirection:v3];
  }

  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"SmartSiriVolume not supported on this device type. smartSiriVolume : %p",  0LL));
    v7 = (os_log_s *)CSLogCategoryASV;
    if (os_log_type_enabled(CSLogCategoryASV, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v9 = "-[CSSmartSiriVolumeServiceProxy setPermanentVolumeOffsetWithDirection:]";
      __int16 v10 = 2114;
      __int16 v11 = v6;
      _os_log_error_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "%s ERR: %{public}@", buf, 0x16u);
    }
  }
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (OS_xpc_object)xpcConnection
{
  return self->_xpcConnection;
}

- (void)setXpcConnection:(id)a3
{
}

- (CSSmartSiriVolumeManager)ssvManager
{
  return self->_ssvManager;
}

- (void)setSsvManager:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
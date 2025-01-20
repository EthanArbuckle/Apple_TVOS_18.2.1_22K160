@interface WAApple80211Manager
+ (id)sharedObject;
- (NSMutableDictionary)interfaceNameToApple80211InstanceMap;
- (NSString)infraInterfaceName;
- (OS_dispatch_queue)serialQueue;
- (WAApple80211Manager)init;
- (id)_getInfraApple80211;
- (id)getInfraApple80211;
- (void)setInfraInterfaceName:(id)a3;
- (void)setInterfaceNameToApple80211InstanceMap:(id)a3;
- (void)setSerialQueue:(id)a3;
@end

@implementation WAApple80211Manager

+ (id)sharedObject
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10002BA1C;
  block[3] = &unk_1000CCCE0;
  block[4] = a1;
  if (qword_1000ECF38 != -1) {
    dispatch_once(&qword_1000ECF38, block);
  }
  return (id)qword_1000ECF30;
}

- (WAApple80211Manager)init
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___WAApple80211Manager;
  v2 = -[WAApple80211Manager init](&v9, "init");
  if (v2)
  {
    v3 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    interfaceNameToApple80211InstanceMap = v2->_interfaceNameToApple80211InstanceMap;
    v2->_interfaceNameToApple80211InstanceMap = v3;

    dispatch_queue_t v5 = dispatch_queue_create("WAApple80211ManagerQueue", 0LL);
    serialQueue = v2->_serialQueue;
    v2->_serialQueue = (OS_dispatch_queue *)v5;
  }

  else
  {
    id v8 = WALogCategoryDefaultHandle();
    serialQueue = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(serialQueue, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v11 = "-[WAApple80211Manager init]";
      __int16 v12 = 1024;
      int v13 = 51;
      _os_log_impl( (void *)&_mh_execute_header,  serialQueue,  OS_LOG_TYPE_ERROR,  "%{public}s::%d:FAILED to initialize!",  buf,  0x12u);
    }
  }

  return v2;
}

- (id)getInfraApple80211
{
  uint64_t v8 = 0LL;
  objc_super v9 = &v8;
  uint64_t v10 = 0x3032000000LL;
  v11 = sub_10002BC40;
  __int16 v12 = sub_10002BC50;
  id v13 = 0LL;
  block[0] = _NSConcreteStackBlock;
  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  block[2] = sub_10002BC58;
  block[3] = &unk_1000CCD30;
  block[1] = 3221225472LL;
  objc_copyWeak(&v7, &location);
  block[4] = &v8;
  dispatch_sync(serialQueue, block);
  id v4 = (id)v9[5];
  objc_destroyWeak(&v7);
  _Block_object_dispose(&v8, 8);

  objc_destroyWeak(&location);
  return v4;
}

- (id)_getInfraApple80211
{
  if (self->_infraInterfaceName)
  {
    interfaceNameToApple80211InstanceMap = self->_interfaceNameToApple80211InstanceMap;
    if (interfaceNameToApple80211InstanceMap)
    {
      uint64_t v4 = objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](interfaceNameToApple80211InstanceMap, "objectForKey:"));
      if (v4)
      {
        uint64_t v8 = (void *)v4;
        goto LABEL_10;
      }
    }
  }

  id v5 = WALogCategoryDefaultHandle();
  v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v25 = 136446466;
    v26 = "-[WAApple80211Manager _getInfraApple80211]";
    __int16 v27 = 1024;
    int v28 = 78;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "%{public}s::%d:Finding interface name and alloc WAApple80211",  (uint8_t *)&v25,  0x12u);
  }

  id v7 = -[WAApple80211 initByFindingInterfaceName](objc_alloc(&OBJC_CLASS___WAApple80211), "initByFindingInterfaceName");
  uint64_t v8 = v7;
  if (v7)
  {
    objc_super v9 = (NSString *)objc_claimAutoreleasedReturnValue([v7 ifName]);
    infraInterfaceName = self->_infraInterfaceName;
    self->_infraInterfaceName = v9;

    v11 = self->_infraInterfaceName;
    if (v11 && -[NSString length](v11, "length"))
    {
      -[NSMutableDictionary setObject:forKey:]( self->_interfaceNameToApple80211InstanceMap,  "setObject:forKey:",  v8,  self->_infraInterfaceName);
      goto LABEL_10;
    }

    id v14 = WALogCategoryDefaultHandle();
    v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      int v25 = 136446466;
      v26 = "-[WAApple80211Manager _getInfraApple80211]";
      __int16 v27 = 1024;
      int v28 = 84;
      v16 = "%{public}s::%d:WAApple80211 bad infraInterfaceName";
LABEL_15:
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, v16, (uint8_t *)&v25, 0x12u);
    }
  }

  else
  {
    id v17 = WALogCategoryDefaultHandle();
    v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      int v25 = 136446466;
      v26 = "-[WAApple80211Manager _getInfraApple80211]";
      __int16 v27 = 1024;
      int v28 = 81;
      v16 = "%{public}s::%d:WAApple80211 initByFindingInterfaceName failed";
      goto LABEL_15;
    }
  }

  id v18 = WALogCategoryDefaultHandle();
  v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
  {
    int v25 = 136446466;
    v26 = "-[WAApple80211Manager _getInfraApple80211]";
    __int16 v27 = 1024;
    int v28 = 91;
    _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_ERROR,  "%{public}s::%d:Failed to create WAApple80211",  (uint8_t *)&v25,  0x12u);
  }

  if (self->_infraInterfaceName)
  {
    v20 = self->_interfaceNameToApple80211InstanceMap;
    if (v20)
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v20, "objectForKey:"));

      if (v21)
      {
        id v22 = WALogCategoryDefaultHandle();
        v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          int v25 = 136446466;
          v26 = "-[WAApple80211Manager _getInfraApple80211]";
          __int16 v27 = 1024;
          int v28 = 97;
          _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_ERROR,  "%{public}s::%d:Removing existing entry in interface map",  (uint8_t *)&v25,  0x12u);
        }

        -[NSMutableDictionary removeObjectForKey:]( self->_interfaceNameToApple80211InstanceMap,  "removeObjectForKey:",  self->_infraInterfaceName);
      }
    }
  }

  v24 = self->_infraInterfaceName;
  self->_infraInterfaceName = 0LL;

  uint64_t v8 = 0LL;
LABEL_10:
  id v12 = v8;

  return v12;
}

- (NSMutableDictionary)interfaceNameToApple80211InstanceMap
{
  return self->_interfaceNameToApple80211InstanceMap;
}

- (void)setInterfaceNameToApple80211InstanceMap:(id)a3
{
}

- (NSString)infraInterfaceName
{
  return self->_infraInterfaceName;
}

- (void)setInfraInterfaceName:(id)a3
{
}

- (OS_dispatch_queue)serialQueue
{
  return self->_serialQueue;
}

- (void)setSerialQueue:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
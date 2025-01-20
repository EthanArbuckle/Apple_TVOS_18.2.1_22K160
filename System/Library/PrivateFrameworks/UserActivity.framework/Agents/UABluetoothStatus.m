@interface UABluetoothStatus
+ (UABluetoothStatus)sharedInstance;
- (BOOL)poweredOn;
- (BTLocalDeviceImpl)localDevice;
- (BTSessionImpl)session;
- (UABluetoothStatus)init;
- (id)registerCallback:(id)a3;
- (void)attachSession:(BTSessionImpl *)a3;
- (void)attachToBluetoothSession;
- (void)dealloc;
- (void)detachFromBluetoothSession;
- (void)detachSession:(BTSessionImpl *)a3;
- (void)handleLocalDeviceCallback:(BTLocalDeviceImpl *)a3 event:(int)a4 result:(int)a5;
- (void)handleSessionEvent:(BTSessionImpl *)a3 event:(int)a4 result:(int)a5;
- (void)processCallbacks;
- (void)terminateSession:(BTSessionImpl *)a3;
- (void)unregisterCallback:(id)a3;
@end

@implementation UABluetoothStatus

- (BTSessionImpl)session
{
  return self->_session;
}

- (BTLocalDeviceImpl)localDevice
{
  return self->_localDevice;
}

- (UABluetoothStatus)init
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___UABluetoothStatus;
  v2 = -[UABluetoothStatus init](&v5, "init");
  v3 = v2;
  if (v2) {
    -[UABluetoothStatus attachToBluetoothSession](v2, "attachToBluetoothSession");
  }
  return v3;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___UABluetoothStatus;
  -[UABluetoothStatus dealloc](&v3, "dealloc");
}

+ (UABluetoothStatus)sharedInstance
{
  if (qword_1000DE410 != -1) {
    dispatch_once(&qword_1000DE410, &stru_1000BDC20);
  }
  return (UABluetoothStatus *)(id)qword_1000DE408;
}

- (BOOL)poweredOn
{
  v2 = self;
  objc_sync_enter(v2);
  if (v2->_poweredOnValid) {
    goto LABEL_18;
  }
  v2->_BOOL poweredOn = 0;
  if (v2->_terminated)
  {
    os_log_t v3 = sub_100039584(0LL);
    v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_INFO,  "BLUETOOTH: Returning NO for .poweredOn because our session has been terminated.",  buf,  2u);
    }

    goto LABEL_17;
  }

  if (v2->_attached)
  {
    int v21 = 0;
    int ModulePower = BTLocalDeviceGetModulePower(-[UABluetoothStatus localDevice](v2, "localDevice"), 1LL, &v21);
    if (ModulePower)
    {
      os_log_t v6 = sub_100039584(0LL);
      v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        session = v2->_session;
        localDevice = v2->_localDevice;
        *(_DWORD *)buf = 134349568;
        v23 = session;
        __int16 v24 = 2050;
        v25 = localDevice;
        __int16 v26 = 1026;
        int v27 = ModulePower;
        v10 = "BLUETOOTH: Failed to get device powered status, for local device %{public}p from BTSession %{public}p, result=%{public}d.";
        v11 = v7;
        os_log_type_t v12 = OS_LOG_TYPE_ERROR;
        uint32_t v13 = 28;
LABEL_15:
        _os_log_impl((void *)&_mh_execute_header, v11, v12, v10, buf, v13);
      }
    }

    else
    {
      v2->_BOOL poweredOn = v21 == -1;
      v2->_poweredOnValid = 1;
      os_log_t v16 = sub_100039584(0LL);
      v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        v17 = v2->_localDevice;
        BOOL poweredOn = v2->_poweredOn;
        *(_DWORD *)buf = 134349312;
        v23 = v17;
        __int16 v24 = 1024;
        LODWORD(v25) = poweredOn;
        v10 = "BLUETOOTH: Setting powered status for device %{public}p to %{BOOL}d";
        v11 = v7;
        os_log_type_t v12 = OS_LOG_TYPE_DEBUG;
        uint32_t v13 = 18;
        goto LABEL_15;
      }
    }

    goto LABEL_17;
  }

  os_log_t v14 = sub_100039584(0LL);
  v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_INFO,  "BLUETOOTH: Returning NO for .poweredOn because our session has been detached, so also triggering a re-attach.",  buf,  2u);
  }

  -[UABluetoothStatus attachToBluetoothSession](v2, "attachToBluetoothSession");
LABEL_17:
  if (!v2->_poweredOnValid)
  {
    BOOL v19 = 0;
    goto LABEL_19;
  }

- (void)attachToBluetoothSession
{
  v2 = self;
  objc_sync_enter(v2);
  if (!*(_WORD *)&v2->_attached)
  {
    v2->_attachInProcess = 1;
    id v3 = sub_1000401A4();
    v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v3);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000401E4;
    block[3] = &unk_1000BCC58;
    block[4] = v2;
    dispatch_async(v4, block);
  }

  objc_sync_exit(v2);
}

- (void)detachFromBluetoothSession
{
  v2 = self;
  objc_sync_enter(v2);
  if (v2->_attached)
  {
    v2->_attached = 0;
    v2->_poweredOnValid = 0;
    v6[0] = 0LL;
    v6[1] = v6;
    v6[2] = 0x2020000000LL;
    v6[3] = v2->_session;
    v2->_session = 0LL;
    id v3 = sub_1000401A4();
    v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v3);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100040458;
    block[3] = &unk_1000BD728;
    block[4] = v6;
    dispatch_async(v4, block);

    _Block_object_dispose(v6, 8);
  }

  objc_sync_exit(v2);
}

- (id)registerCallback:(id)a3
{
  id v4 = a3;
  objc_super v5 = self;
  objc_sync_enter(v5);
  if (!v5->_callbacks)
  {
    v7 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
    callbacks = v5->_callbacks;
    v5->_callbacks = v7;
  }

  *(void *)&__int128 v6 = 138543618LL;
  __int128 v17 = v6;
  do
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID", v17));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v5->_callbacks, "objectForKeyedSubscript:", v9));

    if (v10)
    {
      id v11 = 0LL;
    }

    else
    {
      id v12 = objc_retainBlock(v4);
      -[NSMutableDictionary setObject:forKeyedSubscript:](v5->_callbacks, "setObject:forKeyedSubscript:", v12, v9);

      os_log_t v13 = sub_100039584(0LL);
      os_log_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        id v15 = objc_retainBlock(v4);
        *(_DWORD *)buf = v17;
        BOOL v19 = v9;
        __int16 v20 = 2050;
        id v21 = v15;
        _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEBUG,  "BLUETOOTH: Registering callback %{public}@ to %{public}p",  buf,  0x16u);
      }

      id v11 = v9;
    }
  }

  while (!v11);
  objc_sync_exit(v5);

  return v11;
}

- (void)unregisterCallback:(id)a3
{
  id v4 = a3;
  objc_super v5 = self;
  objc_sync_enter(v5);
  __int128 v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v5->_callbacks, "objectForKeyedSubscript:", v4));

  if (v6)
  {
    os_log_t v7 = sub_100039584(0LL);
    v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      int v9 = 138543362;
      id v10 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEBUG,  "BLUETOOTH: Unregistering callback %{public}@",  (uint8_t *)&v9,  0xCu);
    }

    -[NSMutableDictionary removeObjectForKey:](v5->_callbacks, "removeObjectForKey:", v4);
  }

  objc_sync_exit(v5);
}

- (void)processCallbacks
{
  v2 = self;
  objc_sync_enter(v2);
  callbacks = v2->_callbacks;
  if (callbacks
    && -[NSMutableDictionary count](callbacks, "count")
    && (poweredOn = v2->_poweredOn, unsigned int v5 = -[UABluetoothStatus poweredOn](v2, "poweredOn"), v6 = v5, poweredOn != v5))
  {
    id v8 = -[NSMutableDictionary copy](v2->_callbacks, "copy");
  }

  else
  {
    char v6 = 0;
    id v8 = 0LL;
  }

  objc_sync_exit(v2);

  os_log_t v7 = v8;
  if (v8)
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_1000408C8;
    v9[3] = &unk_1000BDC40;
    char v10 = v6;
    [v8 enumerateKeysAndObjectsUsingBlock:v9];
    os_log_t v7 = v8;
  }
}

- (void)handleSessionEvent:(BTSessionImpl *)a3 event:(int)a4 result:(int)a5
{
  switch(a4)
  {
    case 0:
      -[UABluetoothStatus attachSession:](self, "attachSession:");
      break;
    case 1:
      -[UABluetoothStatus detachSession:](self, "detachSession:", a3);
      break;
    case 2:
      -[UABluetoothStatus detachFromBluetoothSession](self, "detachFromBluetoothSession");
      -[UABluetoothStatus terminateSession:](self, "terminateSession:");
      break;
    case 3:
      os_log_t v6 = sub_100039584(0LL);
      os_log_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        v8[0] = 67240192;
        v8[1] = 3;
        _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_ERROR,  "BLUETOOTH: Unexpected error %{public}d, so ignoring it.",  (uint8_t *)v8,  8u);
      }

      break;
    default:
      return;
  }

- (void)attachSession:(BTSessionImpl *)a3
{
  os_log_t v5 = sub_100039584(0LL);
  os_log_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134349056;
    id v21 = a3;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_INFO,  "BLUETOOTH: Attached to BTSession %{public}p",  buf,  0xCu);
  }

  os_log_t v7 = self;
  objc_sync_enter(v7);
  v7->_session = a3;
  p_localDevice = &v7->_localDevice;
  int Default = BTLocalDeviceGetDefault(a3, &v7->_localDevice);
  if (Default)
  {
    os_log_t v10 = sub_100039584(0LL);
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134349312;
      id v21 = a3;
      __int16 v22 = 1026;
      LODWORD(v23) = Default;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_ERROR,  "BLUETOOTH: Failed to get local device for session %{public}p, result=%{public}d",  buf,  0x12u);
    }

    v7->_poweredOnValid = 0;
    v7->_localDevice = 0LL;
  }

  else
  {
    os_log_t v12 = sub_100039584(0LL);
    os_log_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      os_log_t v14 = *p_localDevice;
      *(_DWORD *)buf = 134349568;
      id v21 = a3;
      __int16 v22 = 2050;
      v23 = v14;
      __int16 v24 = 1026;
      int v25 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_INFO,  "BLUETOOTH: Local device %{public}p from BTSession %{public}p, result=%{public}d.",  buf,  0x1Cu);
    }

    v19[1] = 0LL;
    v19[2] = 0LL;
    v19[0] = sub_100040DE4;
    int v15 = BTLocalDeviceAddCallbacks(-[UABluetoothStatus localDevice](v7, "localDevice"), v19, v7);
    if (v15 || (int v15 = BTLocalDeviceMaskCallbacks(*p_localDevice, 4294966782LL)) != 0)
    {
      os_log_t v16 = sub_100039584(0LL);
      __int128 v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        v18 = *p_localDevice;
        *(_DWORD *)buf = 134349568;
        id v21 = a3;
        __int16 v22 = 2050;
        v23 = v18;
        __int16 v24 = 1026;
        int v25 = v15;
        _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_ERROR,  "BLUETOOTH: Failed to add callbacks for local device %{public}p from BTSession %{public}p, result=%{public}d.",  buf,  0x1Cu);
      }
    }
  }

  objc_sync_exit(v7);
}

- (void)detachSession:(BTSessionImpl *)a3
{
  os_log_t v5 = sub_100039584(0LL);
  os_log_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    localDevice = self->_localDevice;
    *(_DWORD *)buf = 134349312;
    *(void *)&uint8_t buf[4] = a3;
    *(_WORD *)&buf[12] = 2050;
    *(void *)&buf[14] = localDevice;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_INFO,  "BLUETOOTH: Detached from BTSession %{public}p localDevice=%{public}p",  buf,  0x16u);
  }

  id v8 = self;
  objc_sync_enter(v8);
  if (-[UABluetoothStatus localDevice](v8, "localDevice"))
  {
    *(_OWORD *)&buf[8] = 0uLL;
    *(void *)buf = sub_100040DE4;
    int v9 = BTLocalDeviceRemoveCallbacks(-[UABluetoothStatus localDevice](v8, "localDevice"), buf);
    if (v9)
    {
      os_log_t v10 = sub_100039584(0LL);
      id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        v12[0] = 67240448;
        v12[1] = v9;
        __int16 v13 = 2050;
        os_log_t v14 = -[UABluetoothStatus localDevice](v8, "localDevice");
        _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_ERROR,  "BLUETOOTH: Error %{public}d removing device callbacks, device=%{public}p",  (uint8_t *)v12,  0x12u);
      }
    }

    v8->_localDevice = 0LL;
  }

  v8->_attached = 0;
  objc_sync_exit(v8);
}

- (void)terminateSession:(BTSessionImpl *)a3
{
  os_log_t v5 = sub_100039584(0LL);
  os_log_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    localDevice = self->_localDevice;
    int v9 = 134349312;
    os_log_t v10 = a3;
    __int16 v11 = 2050;
    os_log_t v12 = localDevice;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_INFO,  "BLUETOOTH: Terminated from BTSession %{public}p localDevice=%{public}p",  (uint8_t *)&v9,  0x16u);
  }

  -[UABluetoothStatus detachSession:](self, "detachSession:", a3);
  id v8 = self;
  objc_sync_enter(v8);
  -[UABluetoothStatus detachSession:](v8, "detachSession:", a3);
  objc_sync_exit(v8);
}

- (void)handleLocalDeviceCallback:(BTLocalDeviceImpl *)a3 event:(int)a4 result:(int)a5
{
  if (!a4)
  {
    os_log_t v7 = sub_100039584(0LL);
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134349056;
      os_log_t v14 = a3;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_INFO,  "BLUETOOTH: Setting powered-status-validity for device %{public}p to NO",  buf,  0xCu);
    }

    int v9 = self;
    objc_sync_enter(v9);
    v9->_poweredOnValid = 0;
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
    __int16 v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000411C8;
    block[3] = &unk_1000BCC58;
    block[4] = v9;
    dispatch_async(v11, block);

    objc_sync_exit(v9);
  }

- (void).cxx_destruct
{
}

@end
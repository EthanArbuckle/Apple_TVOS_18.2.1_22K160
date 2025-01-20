@interface CLHidManager
- (CLHidManager)initWithDelegate:(id)a3 queue:(id)a4;
- (CLHidManagerDelegate)delegate;
- (HIDManager)manager;
- (NSMutableArray)clientDevices;
- (OS_dispatch_queue)delegateQueue;
- (id)createDeviceForMatchingDictionary:(id)a3;
- (id)getClientDeviceMatchingDict:(id)a3;
- (id)getClientDeviceMatchingHIDDevice:(id)a3;
- (id)getHidDeviceFromEnumeratedDevicesMatching:(id)a3;
- (id)registerForDeviceMatching:(id)a3;
- (void)activateClientDevice:(id)a3;
- (void)dealloc;
- (void)sendMonitorUpdateForDevice:(id)a3 added:(BOOL)a4;
- (void)setClientDevices:(id)a3;
- (void)setDelegate:(id)a3;
- (void)unregisterForDeviceMatching:(id)a3;
- (void)updateClientDeviceWithHidDevice:(id)a3 added:(BOOL)a4;
@end

@implementation CLHidManager

- (CLHidManager)initWithDelegate:(id)a3 queue:(id)a4
{
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___CLHidManager;
  v6 = -[CLHidManager init](&v17, "init");
  if (v6)
  {
    v6->_clientDevices = objc_opt_new(&OBJC_CLASS___NSMutableArray);
    v6->_delegate = (CLHidManagerDelegate *)a3;
    v6->_delegateQueue = (OS_dispatch_queue *)a4;
    v7 = -[HIDManager initWithOptions:](objc_alloc(&OBJC_CLASS___HIDManager), "initWithOptions:", 8LL);
    v6->_manager = v7;
    -[HIDManager setDeviceMatching:](v7, "setDeviceMatching:", &__NSDictionary0__struct);
    -[HIDManager setDispatchQueue:](v6->_manager, "setDispatchQueue:", v6->_delegateQueue);
    manager = v6->_manager;
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472LL;
    v16[2] = sub_100785334;
    v16[3] = &unk_10184E5D8;
    v16[4] = v6;
    -[HIDManager setDeviceNotificationHandler:](manager, "setDeviceNotificationHandler:", v16);
    -[HIDManager activate](v6->_manager, "activate");
    if (qword_1019344B0 != -1) {
      dispatch_once(&qword_1019344B0, &stru_10184E648);
    }
    v9 = (os_log_s *)qword_1019344B8;
    if (os_log_type_enabled((os_log_t)qword_1019344B8, OS_LOG_TYPE_DEBUG))
    {
      id v10 = -[HIDManager devices](v6->_manager, "devices");
      *(_DWORD *)buf = 138412290;
      id v21 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEBUG,  "[CLHidManager] enumerated these devices: %@",  buf,  0xCu);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1019344B0 != -1) {
        dispatch_once(&qword_1019344B0, &stru_10184E648);
      }
      uint64_t v12 = qword_1019344B8;
      id v13 = -[HIDManager devices](v6->_manager, "devices");
      int v18 = 138412290;
      id v19 = v13;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  v12,  2LL,  "[CLHidManager] enumerated these devices: %@",  &v18,  12);
      v15 = (uint8_t *)v14;
      sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLHidManager initWithDelegate:queue:]", "%s\n", v14);
      if (v15 != buf) {
        free(v15);
      }
    }
  }

  return v6;
}

- (void)dealloc
{
  -[NSMutableArray removeAllObjects](self->_clientDevices, "removeAllObjects");
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CLHidManager;
  -[CLHidManager dealloc](&v3, "dealloc");
}

- (void)sendMonitorUpdateForDevice:(id)a3 added:(BOOL)a4
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10078546C;
  block[3] = &unk_10184E600;
  block[4] = self;
  block[5] = a3;
  BOOL v5 = a4;
  dispatch_async((dispatch_queue_t)-[CLHidManager delegateQueue](self, "delegateQueue"), block);
}

- (id)createDeviceForMatchingDictionary:(id)a3
{
  id v5 = -[CLHidManager getHidDeviceFromEnumeratedDevicesMatching:](self, "getHidDeviceFromEnumeratedDevicesMatching:");
  v6 = -[CLHidManager getClientDeviceMatchingDict:](self, "getClientDeviceMatchingDict:", a3);
  if (!v6)
  {
    v6 = -[CLHidDevice initWithHidDevice:matchingDict:]( objc_alloc(&OBJC_CLASS___CLHidDevice),  "initWithHidDevice:matchingDict:",  v5,  a3);
    -[NSMutableArray addObject:](-[CLHidManager clientDevices](self, "clientDevices"), "addObject:", v6);
    -[CLHidManager activateClientDevice:](self, "activateClientDevice:", v6);
    if (!v5) {
      return v6;
    }
    goto LABEL_3;
  }

  if (v5) {
LABEL_3:
  }
    -[CLHidManager sendMonitorUpdateForDevice:added:](self, "sendMonitorUpdateForDevice:added:", v6, 1LL);
  return v6;
}

- (void)updateClientDeviceWithHidDevice:(id)a3 added:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = -[CLHidManager getClientDeviceMatchingHIDDevice:](self, "getClientDeviceMatchingHIDDevice:");
  if (v7)
  {
    id v8 = v7;
    if (v4)
    {
      [v7 setHidDevice:a3];
      -[CLHidManager activateClientDevice:](self, "activateClientDevice:", v8);
    }

    else
    {
      [v7 setHidDevice:0];
    }

    -[CLHidManager sendMonitorUpdateForDevice:added:](self, "sendMonitorUpdateForDevice:added:", v8, v4);
  }

- (void)activateClientDevice:(id)a3
{
  if ([a3 hidDevice])
  {
    objc_msgSend( objc_msgSend(a3, "hidDevice"),  "setDispatchQueue:",  -[CLHidManager delegateQueue](self, "delegateQueue"));
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472LL;
    v5[2] = sub_100785690;
    v5[3] = &unk_10184E628;
    v5[4] = self;
    v5[5] = a3;
    v5[6] = self;
    objc_msgSend(objc_msgSend(a3, "hidDevice"), "setInputReportHandler:", v5);
    objc_msgSend(objc_msgSend(a3, "hidDevice"), "open");
    objc_msgSend(objc_msgSend(a3, "hidDevice"), "activate");
  }

- (id)getClientDeviceMatchingDict:(id)a3
{
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  BOOL v4 = -[CLHidManager clientDevices](self, "clientDevices");
  id v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v14,  v22,  16LL);
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v15;
    while (2)
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v14 + 1) + 8LL * (void)i);
        if (objc_msgSend(objc_msgSend(v9, "matching"), "isEqual:", a3))
        {
          if (qword_1019344B0 != -1) {
            dispatch_once(&qword_1019344B0, &stru_10184E648);
          }
          id v10 = (os_log_s *)qword_1019344B8;
          if (os_log_type_enabled((os_log_t)qword_1019344B8, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            id v21 = a3;
            _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_INFO,  "[CLHidManager], matched CLHidDevice for %@",  buf,  0xCu);
          }

          if (sub_1002921D0(115, 2))
          {
            bzero(buf, 0x65CuLL);
            if (qword_1019344B0 != -1) {
              dispatch_once(&qword_1019344B0, &stru_10184E648);
            }
            int v18 = 138412290;
            id v19 = a3;
            _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019344B8,  1LL,  "[CLHidManager], matched CLHidDevice for %@",  &v18,  12);
            id v13 = (uint8_t *)v12;
            sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLHidManager getClientDeviceMatchingDict:]", "%s\n", v12);
            if (v13 != buf) {
              free(v13);
            }
          }

          return v9;
        }
      }

      id v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v14,  v22,  16LL);
      if (v6) {
        continue;
      }
      break;
    }
  }

  return 0LL;
}

- (id)getHidDeviceFromEnumeratedDevicesMatching:(id)a3
{
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  id obj = -[HIDManager devices](-[CLHidManager manager](self, "manager"), "devices");
  id v4 = [obj countByEnumeratingWithState:&v22 objects:v31 count:16];
  if (!v4) {
    return 0LL;
  }
  id v5 = v4;
  uint64_t v6 = *(void *)v23;
  while (1)
  {
    uint64_t v7 = 0LL;
LABEL_4:
    if (*(void *)v23 != v6) {
      objc_enumerationMutation(obj);
    }
    id v8 = *(void **)(*((void *)&v22 + 1) + 8 * v7);
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    __int128 v20 = 0u;
    __int128 v21 = 0u;
    id v9 = [a3 countByEnumeratingWithState:&v18 objects:v30 count:16];
    if (!v9) {
      break;
    }
    id v10 = v9;
    uint64_t v11 = *(void *)v19;
LABEL_8:
    uint64_t v12 = 0LL;
    while (1)
    {
      if (*(void *)v19 != v11) {
        objc_enumerationMutation(a3);
      }
      if (!objc_msgSend( objc_msgSend(v8, "propertyForKey:", *(void *)(*((void *)&v18 + 1) + 8 * v12)),  "isEqual:",  objc_msgSend(a3, "objectForKey:", *(void *)(*((void *)&v18 + 1) + 8 * v12)))) {
        break;
      }
      if (v10 == (id)++v12)
      {
        id v10 = [a3 countByEnumeratingWithState:&v18 objects:v30 count:16];
        if (v10) {
          goto LABEL_8;
        }
        goto LABEL_18;
      }
    }

    if ((id)++v7 != v5) {
      goto LABEL_4;
    }
    id v5 = [obj countByEnumeratingWithState:&v22 objects:v31 count:16];
    id v8 = 0LL;
    if (!v5) {
      return v8;
    }
  }

- (id)getClientDeviceMatchingHIDDevice:(id)a3
{
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  id obj = -[CLHidManager clientDevices](self, "clientDevices");
  id v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v20,  v25,  16LL);
  if (!v4) {
    return 0LL;
  }
  id v5 = v4;
  uint64_t v15 = *(void *)v21;
  do
  {
    uint64_t v6 = 0LL;
LABEL_4:
    if (*(void *)v21 != v15) {
      objc_enumerationMutation(obj);
    }
    uint64_t v7 = *(void **)(*((void *)&v20 + 1) + 8 * v6);
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    id v8 = [v7 matching];
    id v9 = [v8 countByEnumeratingWithState:&v16 objects:v24 count:16];
    if (!v9) {
      break;
    }
    id v10 = v9;
    uint64_t v11 = *(void *)v17;
LABEL_8:
    uint64_t v12 = 0LL;
    while (1)
    {
      if (*(void *)v17 != v11) {
        objc_enumerationMutation(v8);
      }
      if (!objc_msgSend( objc_msgSend(a3, "propertyForKey:", *(void *)(*((void *)&v16 + 1) + 8 * v12)),  "isEqual:",  objc_msgSend( objc_msgSend(v7, "matching"),  "objectForKey:",  *(void *)(*((void *)&v16 + 1) + 8 * v12)))) {
        break;
      }
      if (v10 == (id)++v12)
      {
        id v10 = [v8 countByEnumeratingWithState:&v16 objects:v24 count:16];
        if (v10) {
          goto LABEL_8;
        }
        return v7;
      }
    }

    if ((id)++v6 != v5) {
      goto LABEL_4;
    }
    id v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v20,  v25,  16LL);
    uint64_t v7 = 0LL;
  }

  while (v5);
  return v7;
}

- (id)registerForDeviceMatching:(id)a3
{
  return -[CLHidManager createDeviceForMatchingDictionary:](self, "createDeviceForMatchingDictionary:", a3);
}

- (void)unregisterForDeviceMatching:(id)a3
{
}

- (CLHidManagerDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (CLHidManagerDelegate *)a3;
}

- (OS_dispatch_queue)delegateQueue
{
  return self->_delegateQueue;
}

- (HIDManager)manager
{
  return self->_manager;
}

- (NSMutableArray)clientDevices
{
  return self->_clientDevices;
}

- (void)setClientDevices:(id)a3
{
}

@end
@interface BTIdentityDaemon
+ (id)sharedBTIdentityDaemon;
- (BOOL)diagnosticControl:(id)a3 completion:(id)a4;
- (BTIdentityDaemon)init;
- (id)descriptionWithLevel:(int)a3;
- (void)_idsDevicesChanged:(id)a3;
- (void)_idsScheduleUpdateIdentities;
- (void)_idsUpdateIdentities;
- (void)activate;
- (void)invalidate;
@end

@implementation BTIdentityDaemon

+ (id)sharedBTIdentityDaemon
{
  if (qword_100237298 != -1) {
    dispatch_once(&qword_100237298, &stru_100208F48);
  }
  return (id)qword_100237290;
}

- (BTIdentityDaemon)init
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___BTIdentityDaemon;
  v2 = -[BTIdentityDaemon init](&v9, "init");
  if (v2)
  {
    dispatch_queue_attr_t v3 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v3);
    dispatch_queue_t v5 = dispatch_queue_create("BTIdentityDaemon", v4);
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v5;

    v2->_cbDaemonNotifyToken = -1;
    v7 = v2;
  }

  return v2;
}

- (id)descriptionWithLevel:(int)a3
{
  id v4 = 0LL;
  NSAppendPrintF( &v4,  "-- BTIdentityDaemon: IDS devices %d, Identities %d --\n",  -[NSArray count](self->_idsDevices, "count", *(void *)&a3),  -[NSMutableDictionary count](self->_identityMap, "count"));
  return v4;
}

- (void)activate
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100086E84;
  block[3] = &unk_100206058;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)invalidate
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000871F8;
  block[3] = &unk_100206058;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (BOOL)diagnosticControl:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  CFTypeID TypeID = CFStringGetTypeID();
  uint64_t TypedValue = CFDictionaryGetTypedValue(v7, @"_input", TypeID, 0LL);
  v10 = (void *)objc_claimAutoreleasedReturnValue(TypedValue);

  if (!v10
    || [v10 caseInsensitiveCompare:@"idsUp"]
    && [v10 caseInsensitiveCompare:@"idsUpForce"])
  {
    BOOL v11 = 0;
  }

  else
  {
    dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000873E8;
    block[3] = &unk_100206220;
    block[4] = v10;
    void block[5] = self;
    id v15 = v6;
    dispatch_async(dispatchQueue, block);

    BOOL v11 = 1;
  }

  return v11;
}

- (void)_idsDevicesChanged:(id)a3
{
  id v4 = a3;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100087508;
  v7[3] = &unk_100206358;
  id v8 = v4;
  objc_super v9 = self;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

- (void)_idsScheduleUpdateIdentities
{
  p_idsDeviceCoalescer = &self->_idsDeviceCoalescer;
  id v4 = self->_idsDeviceCoalescer;
  if (!v4)
  {
    dispatch_queue_t v5 = objc_alloc_init(&OBJC_CLASS___CUCoalescer);
    objc_storeStrong((id *)p_idsDeviceCoalescer, v5);
    -[CUCoalescer setDispatchQueue:](v5, "setDispatchQueue:", self->_dispatchQueue);
    -[CUCoalescer setMinDelay:](v5, "setMinDelay:", 2.0);
    -[CUCoalescer setMaxDelay:](v5, "setMaxDelay:", 5.0);
    id v6 = _NSConcreteStackBlock;
    uint64_t v7 = 3221225472LL;
    id v8 = sub_1000876C0;
    objc_super v9 = &unk_100206358;
    id v4 = v5;
    v10 = v4;
    BOOL v11 = self;
    -[CUCoalescer setActionHandler:](v4, "setActionHandler:", &v6);
  }

  -[CUCoalescer trigger](v4, "trigger", v6, v7, v8, v9);
}

- (void)_idsUpdateIdentities
{
  v2 = self;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:]( self->_identityMap,  "enumerateKeysAndObjectsUsingBlock:",  &stru_100208F88);
  __int128 v60 = 0u;
  __int128 v61 = 0u;
  __int128 v58 = 0u;
  __int128 v59 = 0u;
  obj = v2->_idsDevices;
  v52 = v2;
  id v50 = -[NSArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v58,  v63,  16LL);
  if (!v50)
  {
    int v46 = 0;
    int v47 = 0;
    goto LABEL_60;
  }

  int v46 = 0;
  int v47 = 0;
  uint64_t v49 = *(void *)v59;
  do
  {
    dispatch_queue_attr_t v3 = 0LL;
    do
    {
      if (*(void *)v59 != v49) {
        objc_enumerationMutation(obj);
      }
      id v4 = *(void **)(*((void *)&v58 + 1) + 8LL * (void)v3);
      dispatch_queue_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 uniqueIDOverride]);
      if (v5)
      {
        uint64_t v6 = objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v2->_identityMap, "objectForKeyedSubscript:", v5));
        uint64_t v7 = (CBDeviceIdentity *)v6;
        if (!v6)
        {
          uint64_t v7 = objc_alloc_init(&OBJC_CLASS___CBDeviceIdentity);
          -[CBDeviceIdentity setIdentifier:](v7, "setIdentifier:", v5);
          -[CBDeviceIdentity setIdsDeviceID:](v7, "setIdsDeviceID:", v5);
          identityMap = v2->_identityMap;
          if (!identityMap)
          {
            objc_super v9 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
            v10 = v2->_identityMap;
            v2->_identityMap = v9;

            identityMap = v2->_identityMap;
          }

          -[NSMutableDictionary setObject:forKeyedSubscript:](identityMap, "setObject:forKeyedSubscript:", v7, v5);
        }

        -[CBDeviceIdentity setType:](v7, "setType:", 2LL);
        uint64_t v11 = objc_claimAutoreleasedReturnValue([v4 nsuuid]);
        v51 = (void *)v11;
        if (v11)
        {
          v12 = (void *)v11;
          v13 = (void *)objc_claimAutoreleasedReturnValue(-[CBDeviceIdentity bluetoothIdentifier](v7, "bluetoothIdentifier"));
          id v14 = v12;
          id v15 = v13;
          if (v14 == v15)
          {
          }

          else
          {
            v16 = v15;
            if (!v15)
            {

              goto LABEL_19;
            }

            unsigned __int8 v17 = [v14 isEqual:v15];

            if ((v17 & 1) == 0)
            {
LABEL_19:
              -[CBDeviceIdentity setBluetoothIdentifier:](v7, "setBluetoothIdentifier:", v14);
              int v18 = 1;
LABEL_20:
              v19 = (void *)objc_claimAutoreleasedReturnValue([v4 modelIdentifier]);
              if (v19)
              {
                v20 = (void *)objc_claimAutoreleasedReturnValue(-[CBDeviceIdentity model](v7, "model"));
                id v21 = v19;
                id v22 = v20;
                if (v21 == v22)
                {

                  goto LABEL_28;
                }

                v23 = v22;
                if (v22)
                {
                  unsigned __int8 v24 = [v21 isEqual:v22];

                  if ((v24 & 1) != 0) {
                    goto LABEL_28;
                  }
                }

                else
                {
                }

                -[CBDeviceIdentity setModel:](v7, "setModel:", v21);
                int v18 = 1;
              }

- (void).cxx_destruct
{
}

@end
@interface CBStackDeviceMonitorBTStack
- (CBStackDeviceMonitorBTStack)init;
- (OS_dispatch_queue)dispatchQueue;
- (id)description;
- (id)descriptionWithLevel:(int)a3;
- (id)deviceFoundHandler;
- (id)deviceLostHandler;
- (id)invalidationHandler;
- (int)_updatePowerSources;
- (unint64_t)discoveryFlags;
- (void)_invalidated;
- (void)_updateDeviceBLE:(id)a3 flags:(unint64_t)a4;
- (void)_updateDeviceClassic:(void *)a3 flags:(unint64_t)a4;
- (void)_updateDevicesConnected;
- (void)_updateDevicesPaired;
- (void)activate;
- (void)invalidate;
- (void)localDeviceEvent:(int)a3;
- (void)setDeviceFoundHandler:(id)a3;
- (void)setDeviceLostHandler:(id)a3;
- (void)setDiscoveryFlags:(unint64_t)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setInvalidationHandler:(id)a3;
- (void)updateDevices;
@end

@implementation CBStackDeviceMonitorBTStack

- (CBStackDeviceMonitorBTStack)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___CBStackDeviceMonitorBTStack;
  v2 = -[CBStackDeviceMonitorBTStack init](&v6, "init");
  v3 = v2;
  if (v2)
  {
    v2->_powerTimeRemainingToken = -1;
    v4 = v2;
  }

  return v3;
}

- (id)description
{
  return -[CBStackDeviceMonitorBTStack descriptionWithLevel:](self, "descriptionWithLevel:", 50LL);
}

- (id)descriptionWithLevel:(int)a3
{
  unsigned int v4 = a3;
  v5 = (char *)-[NSMutableDictionary count](self->_deviceMap, "count");
  if (v4 < 0x15)
  {
    uint64_t v27 = 0LL;
    v28 = (id *)&v27;
    uint64_t v29 = 0x3032000000LL;
    v30 = sub_100005CE0;
    v31 = sub_100005CF0;
    id v32 = 0LL;
    id v26 = 0LL;
    uint64_t v11 = CUPrintFlags64(self->_discoveryFlags, &unk_1006BA068);
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    NSAppendPrintF_safe(&v26, "== CBStackDeviceMonitor: DF %@, Devices %d ==\n", v12, v5);
    objc_storeStrong(&v32, v26);

    uint64_t v22 = 0LL;
    v23 = &v22;
    uint64_t v24 = 0x2020000000LL;
    uint64_t v25 = 0LL;
    deviceMap = self->_deviceMap;
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472LL;
    v20[2] = sub_100005CF8;
    v20[3] = &unk_10087EA20;
    v20[4] = &v27;
    v20[5] = &v22;
    unsigned int v21 = v4;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](deviceMap, "enumerateKeysAndObjectsUsingBlock:", v20);
    unint64_t v14 = v23[3];
    BOOL v15 = (unint64_t)v5 >= v14;
    v16 = &v5[-v14];
    if (v16 != 0LL && v15)
    {
      v17 = v28;
      id obj = v28[5];
      NSAppendPrintF_safe(&obj, "... %d more, %d total\n", (_DWORD)v16, (_DWORD)v5);
      objc_storeStrong(v17 + 5, obj);
    }

    id v18 = v28[5];
    _Block_object_dispose(&v22, 8);
    _Block_object_dispose(&v27, 8);

    return v18;
  }

  else
  {
    uint64_t v6 = CUPrintFlags64(self->_discoveryFlags, &unk_1006BA068);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    uint64_t v8 = NSPrintF_safe("CBStackDeviceMonitor: DF %@, Devices %d", v7, v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);

    return v9;
  }

- (void)activate
{
  if (!self->_deviceFoundHandler)
  {
    FatalErrorF("CBStackDeviceMonitor: No deviceFoundHandler", a2);
    goto LABEL_19;
  }

  if (!self->_deviceLostHandler)
  {
LABEL_19:
    FatalErrorF("CBStackDeviceMonitor: No deviceLostHandler", a2);
    goto LABEL_20;
  }

  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  if (!dispatchQueue)
  {
LABEL_20:
    FatalErrorF("CBStackDeviceMonitor: No dispatchQueue", a2);
LABEL_21:
    v10 = (_Unwind_Exception *)FatalErrorF("CBStackDeviceMonitor: Activate after invalidate", v5);

    _Unwind_Resume(v10);
  }

  dispatch_assert_queue_V2(dispatchQueue);
  if (self->_invalidateCalled) {
    goto LABEL_21;
  }
  if (!self->_addedMonitor)
  {
    os_unfair_lock_lock((os_unfair_lock_t)&unk_1008D9E00);
    uint64_t v6 = (void *)qword_1008D9E08;
    if (!qword_1008D9E08)
    {
      uint64_t v6 = operator new(0x40uLL);
      *uint64_t v6 = off_10087EB98;
      v6[1] = off_10087EC50;
      v6[2] = &off_10087EC80;
      v6[3] = off_10087EC98;
      v6[4] = off_10087ECD8;
      v6[5] = &off_10087ED88;
      v6[6] = 0LL;
      *((_BYTE *)v6 + 56) = 0;
      qword_1008D9E08 = (uint64_t)v6;
    }

    sub_100006034((uint64_t)v6, self);
    os_unfair_lock_unlock((os_unfair_lock_t)&unk_1008D9E00);
    self->_addedMonitor = 1;
  }

  v7 = self->_powerTimeRemainingCoalescer;
  if (!v7)
  {
    uint64_t v8 = objc_alloc_init(&OBJC_CLASS___CUCoalescer);
    objc_storeStrong((id *)&self->_powerTimeRemainingCoalescer, v8);
    -[CUCoalescer setDispatchQueue:](v8, "setDispatchQueue:", self->_dispatchQueue);
    -[CUCoalescer setMinDelay:](v8, "setMinDelay:", 1.0);
    -[CUCoalescer setMaxDelay:](v8, "setMaxDelay:", 5.0);
    -[CUCoalescer setLeeway:](v8, "setLeeway:", 1.0);
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_10000626C;
    v12[3] = &unk_10087EA48;
    v12[4] = self;
    -[CUCoalescer setActionHandler:](v8, "setActionHandler:", v12);
    v7 = v8;
  }

  if (self->_powerTimeRemainingToken == -1)
  {
    v9 = (dispatch_queue_s *)self->_dispatchQueue;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_1000062DC;
    v11[3] = &unk_10087EA70;
    v11[4] = self;
    notify_register_dispatch("com.apple.system.accpowersources.timeremaining", &self->_powerTimeRemainingToken, v9, v11);
  }

  -[CBStackDeviceMonitorBTStack updateDevices](self, "updateDevices");
}

- (void)invalidate
{
  if (!self->_invalidateCalled)
  {
    self->_invalidateCalled = 1;
    if (dword_1008D5E28 <= 30
      && (dword_1008D5E28 != -1 || _LogCategory_Initialize(&dword_1008D5E28, 30LL)))
    {
      LogPrintF_safe(&dword_1008D5E28, "-[CBStackDeviceMonitorBTStack invalidate]", 30LL, "Invalidate");
    }

    int powerTimeRemainingToken = self->_powerTimeRemainingToken;
    if (powerTimeRemainingToken != -1)
    {
      notify_cancel(powerTimeRemainingToken);
      self->_int powerTimeRemainingToken = -1;
    }

    -[CUCoalescer invalidate](self->_powerTimeRemainingCoalescer, "invalidate");
    powerTimeRemainingCoalescer = self->_powerTimeRemainingCoalescer;
    self->_powerTimeRemainingCoalescer = 0LL;

    if (self->_addedMonitor)
    {
      os_unfair_lock_lock((os_unfair_lock_t)&unk_1008D9E00);
      if (qword_1008D9E08) {
        sub_100006448(qword_1008D9E08, self);
      }
      os_unfair_lock_unlock((os_unfair_lock_t)&unk_1008D9E00);
      self->_addedMonitor = 0;
    }

    -[CBStackDeviceMonitorBTStack _invalidated](self, "_invalidated");
  }

- (void)_invalidated
{
  if (!self->_invalidateDone)
  {
    id deviceFoundHandler = self->_deviceFoundHandler;
    self->_id deviceFoundHandler = 0LL;

    id deviceLostHandler = self->_deviceLostHandler;
    self->_id deviceLostHandler = 0LL;

    uint64_t v6 = (void (**)(void))objc_retainBlock(self->_invalidationHandler);
    id invalidationHandler = self->_invalidationHandler;
    self->_id invalidationHandler = 0LL;

    if (v6) {
      v6[2]();
    }
    self->_invalidateDone = 1;
    if (dword_1008D5E28 <= 30
      && (dword_1008D5E28 != -1 || _LogCategory_Initialize(&dword_1008D5E28, 30LL)))
    {
      LogPrintF_safe(&dword_1008D5E28, "-[CBStackDeviceMonitorBTStack _invalidated]", 30LL, "Invalidated");
    }
  }

- (void)localDeviceEvent:(int)a3
{
  if (self->_addedMonitor)
  {
    if (a3 == 4)
    {
      if ((self->_discoveryFlags & 0x800000) != 0)
      {
        if (dword_1008D5E28 <= 30
          && (dword_1008D5E28 != -1 || _LogCategory_Initialize(&dword_1008D5E28, 30LL)))
        {
          LogPrintF_safe( &dword_1008D5E28,  "-[CBStackDeviceMonitorBTStack localDeviceEvent:]",  30LL,  "Pairing status changed");
        }

        goto LABEL_16;
      }
    }

    else if (a3 == 5 && (self->_discoveryFlags & 0x200000) != 0)
    {
      if (dword_1008D5E28 <= 30
        && (dword_1008D5E28 != -1 || _LogCategory_Initialize(&dword_1008D5E28, 30LL)))
      {
        LogPrintF_safe( &dword_1008D5E28,  "-[CBStackDeviceMonitorBTStack localDeviceEvent:]",  30LL,  "Connection status changed");
      }

- (void)updateDevices
{
  if (self->_addedMonitor)
  {
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:]( self->_deviceMap,  "enumerateKeysAndObjectsUsingBlock:",  &stru_10087EAB0);
    unint64_t discoveryFlags = self->_discoveryFlags;
    if ((discoveryFlags & 0x800000) != 0)
    {
      -[CBStackDeviceMonitorBTStack _updateDevicesPaired](self, "_updateDevicesPaired");
      unint64_t discoveryFlags = self->_discoveryFlags;
    }

    if ((discoveryFlags & 0x200000) != 0) {
      -[CBStackDeviceMonitorBTStack _updateDevicesConnected](self, "_updateDevicesConnected");
    }
    deviceMap = self->_deviceMap;
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472LL;
    v17[2] = sub_100006A94;
    v17[3] = &unk_10087EAD8;
    v17[4] = self;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](deviceMap, "enumerateKeysAndObjectsUsingBlock:", v17);
    __int128 v15 = 0u;
    __int128 v16 = 0u;
    __int128 v13 = 0u;
    __int128 v14 = 0u;
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](self->_deviceMap, "allKeys"));
    id v6 = [v5 countByEnumeratingWithState:&v13 objects:v18 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v14;
      do
      {
        for (i = 0LL; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v14 != v7) {
            objc_enumerationMutation(v5);
          }
          uint64_t v9 = *(void *)(*((void *)&v13 + 1) + 8LL * (void)i);
          v10 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_deviceMap,  "objectForKeyedSubscript:",  v9));
          if (((unint64_t)[v10 discoveryFlags] & 0xA00000) == 0)
          {
            -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_deviceMap,  "setObject:forKeyedSubscript:",  0LL,  v9);
            if (dword_1008D5E28 <= 30
              && (dword_1008D5E28 != -1 || _LogCategory_Initialize(&dword_1008D5E28, 30LL)))
            {
              LogPrintF_safe( &dword_1008D5E28,  "-[CBStackDeviceMonitorBTStack updateDevices]",  30LL,  "Device lost: %@",  v10);
            }

            id v11 = objc_retainBlock(self->_deviceLostHandler);
            v12 = v11;
            if (v11) {
              (*((void (**)(id, void *))v11 + 2))(v11, v10);
            }
          }
        }

        id v6 = [v5 countByEnumeratingWithState:&v13 objects:v18 count:16];
      }

      while (v6);
    }
  }

- (void)_updateDevicesConnected
{
  __p = 0LL;
  unsigned int v21 = 0LL;
  uint64_t v22 = 0LL;
  if (qword_1008D5F00 != -1) {
    dispatch_once(&qword_1008D5F00, &stru_10087EDB8);
  }
  int v3 = sub_10040A790((uint64_t)off_1008D5EF8, &__p);
  if (v3)
  {
    if (dword_1008D5E28 > 90) {
      goto LABEL_12;
    }
    if (dword_1008D5E28 != -1 || _LogCategory_Initialize(&dword_1008D5E28, 90LL))
    {
      uint64_t v4 = CUPrintErrorCode((v3 + 310000));
      uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
      LogPrintF_safe( &dword_1008D5E28,  "-[CBStackDeviceMonitorBTStack _updateDevicesConnected]",  90LL,  "### GetConnectedDevices failed: %@",  v5);
    }
  }

  if (dword_1008D5E28 <= 30 && (dword_1008D5E28 != -1 || _LogCategory_Initialize(&dword_1008D5E28, 30LL))) {
    LogPrintF_safe( &dword_1008D5E28,  "-[CBStackDeviceMonitorBTStack _updateDevicesConnected]",  30LL,  "Update devices: connected, classic, %zu total",  (v21 - (_BYTE *)__p) >> 3);
  }
LABEL_12:
  id v6 = __p;
  uint64_t v7 = v21;
  while (v6 != v7)
    -[CBStackDeviceMonitorBTStack _updateDeviceClassic:flags:](self, "_updateDeviceClassic:flags:", *v6++, 0x200000LL);
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  if (qword_1008D5F10 != -1) {
    dispatch_once(&qword_1008D5F10, &stru_10087EDD8);
  }
  id v8 = sub_10059A34C((uint64_t)off_1008D5F08);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  int v10 = 0;
  id v11 = [v9 countByEnumeratingWithState:&v16 objects:v23 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v17;
    do
    {
      __int128 v13 = 0LL;
      v10 += (int)v11;
      do
      {
        if (*(void *)v17 != v12) {
          objc_enumerationMutation(v9);
        }
        -[CBStackDeviceMonitorBTStack _updateDeviceBLE:flags:]( self,  "_updateDeviceBLE:flags:",  *(void *)(*((void *)&v16 + 1) + 8LL * (void)v13),  0x200000LL);
        __int128 v13 = (char *)v13 + 1;
      }

      while (v11 != v13);
      id v11 = [v9 countByEnumeratingWithState:&v16 objects:v23 count:16];
    }

    while (v11);
  }

  unsigned int v14 = -[CBStackDeviceMonitorBTStack _updatePowerSources](self, "_updatePowerSources");
  if (dword_1008D5E28 <= 30)
  {
    unsigned int v15 = v14;
    if (dword_1008D5E28 != -1 || _LogCategory_Initialize(&dword_1008D5E28, 30LL)) {
      LogPrintF_safe( &dword_1008D5E28,  "-[CBStackDeviceMonitorBTStack _updateDevicesConnected]",  30LL,  "Update devices: connected, BLE, %d total, power sources %d",  v10,  v15);
    }
  }

  if (__p)
  {
    unsigned int v21 = __p;
    operator delete(__p);
  }

- (void)_updateDevicesPaired
{
  __p = 0LL;
  __int128 v19 = 0LL;
  uint64_t v20 = 0LL;
  if (qword_1008D5F00 != -1) {
    dispatch_once(&qword_1008D5F00, &stru_10087EDB8);
  }
  int v3 = sub_10040A6A8((uint64_t)off_1008D5EF8, (void ***)&__p);
  if (v3)
  {
    if (dword_1008D5E28 > 90) {
      goto LABEL_12;
    }
    if (dword_1008D5E28 != -1 || _LogCategory_Initialize(&dword_1008D5E28, 90LL))
    {
      uint64_t v4 = CUPrintErrorCode((v3 + 310000));
      uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
      LogPrintF_safe( &dword_1008D5E28,  "-[CBStackDeviceMonitorBTStack _updateDevicesPaired]",  90LL,  "### GetPairedDevices failed: %@",  v5);
    }
  }

  if (dword_1008D5E28 <= 30 && (dword_1008D5E28 != -1 || _LogCategory_Initialize(&dword_1008D5E28, 30LL))) {
    LogPrintF_safe( &dword_1008D5E28,  "-[CBStackDeviceMonitorBTStack _updateDevicesPaired]",  30LL,  "Update devices: paired, classic, %zu total",  (v19 - (_BYTE *)__p) >> 3);
  }
LABEL_12:
  id v6 = __p;
  uint64_t v7 = v19;
  while (v6 != v7)
    -[CBStackDeviceMonitorBTStack _updateDeviceClassic:flags:](self, "_updateDeviceClassic:flags:", *v6++, 0x800000LL);
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  if (qword_1008D5F20 != -1) {
    dispatch_once(&qword_1008D5F20, &stru_10087EDF8);
  }
  id v8 = sub_100626468(qword_1008D5F18);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  int v10 = 0;
  id v11 = [v9 countByEnumeratingWithState:&v14 objects:v21 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v15;
    do
    {
      __int128 v13 = 0LL;
      v10 += (int)v11;
      do
      {
        if (*(void *)v15 != v12) {
          objc_enumerationMutation(v9);
        }
        -[CBStackDeviceMonitorBTStack _updateDeviceBLE:flags:]( self,  "_updateDeviceBLE:flags:",  *(void *)(*((void *)&v14 + 1) + 8LL * (void)v13),  0x800000LL);
        __int128 v13 = (char *)v13 + 1;
      }

      while (v11 != v13);
      id v11 = [v9 countByEnumeratingWithState:&v14 objects:v21 count:16];
    }

    while (v11);
  }

  if (dword_1008D5E28 <= 30 && (dword_1008D5E28 != -1 || _LogCategory_Initialize(&dword_1008D5E28, 30LL))) {
    LogPrintF_safe( &dword_1008D5E28,  "-[CBStackDeviceMonitorBTStack _updateDevicesPaired]",  30LL,  "Update devices: paired, BLE, %d total",  v10);
  }
  if (__p)
  {
    __int128 v19 = __p;
    operator delete(__p);
  }

- (void)_updateDeviceBLE:(id)a3 flags:(unint64_t)a4
{
  id v6 = a3;
  uint64_t v14 = 0LL;
  __int128 v15 = &v14;
  uint64_t v16 = 0x2020000000LL;
  uint64_t v17 = 0LL;
  if (qword_1008D5F30 != -1) {
    dispatch_once(&qword_1008D5F30, &stru_10087EE18);
  }
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_100007474;
  v13[3] = &unk_10087EB00;
  v13[4] = &v14;
  if (sub_1005D5604((uint64_t)off_1008D5F28, v6, v13) && v15[3])
  {
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 UUIDString]);
    id v8 = (CBDevice *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_deviceMap, "objectForKeyedSubscript:", v7));
    if (v8)
    {
      uint64_t v9 = 0LL;
    }

    else
    {
      id v8 = objc_alloc_init(&OBJC_CLASS___CBDevice);
      -[CBDevice setIdentifier:](v8, "setIdentifier:", v7);
      -[CBDevice setInternalFlags:](v8, "setInternalFlags:", 4LL);
      deviceMap = self->_deviceMap;
      if (!deviceMap)
      {
        id v11 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
        uint64_t v12 = self->_deviceMap;
        self->_deviceMap = v11;

        deviceMap = self->_deviceMap;
      }

      -[NSMutableDictionary setObject:forKeyedSubscript:](deviceMap, "setObject:forKeyedSubscript:", v8, v7);
      uint64_t v9 = 0x4000000LL;
    }

    -[CBDevice setChangeFlags:]( v8,  "setChangeFlags:",  -[CBDevice updateWithBLEDevice:btAddr:](v8, "updateWithBLEDevice:btAddr:", v6, v15[3]) | v9 | (unint64_t)-[CBDevice changeFlags](v8, "changeFlags"));
    -[CBDevice setDiscoveryFlags:]( v8,  "setDiscoveryFlags:",  (unint64_t)-[CBDevice discoveryFlags](v8, "discoveryFlags") | a4);
  }

  _Block_object_dispose(&v14, 8);
}

- (void)_updateDeviceClassic:(void *)a3 flags:(unint64_t)a4
{
  uint64_t v7 = *((unsigned __int8 *)a3 + 128);
  uint64_t v8 = *((unsigned __int8 *)a3 + 129);
  uint64_t v9 = *((unsigned __int8 *)a3 + 130);
  uint64_t v10 = *((unsigned __int8 *)a3 + 131);
  uint64_t v11 = *((unsigned __int8 *)a3 + 132);
  uint64_t v12 = *((unsigned __int8 *)a3 + 133);
  if (qword_1008D5F30 != -1) {
    dispatch_once(&qword_1008D5F30, &stru_10087EE18);
  }
  v22[0] = 0LL;
  v22[1] = 0LL;
  sub_1005C8684( (uint64_t)off_1008D5F28,  (v7 << 40) | (v8 << 32) | (v9 << 24) | (v10 << 16) | (v11 << 8) | v12,  1u,  1u,  0LL,  0LL,  (unsigned __int8 *)v22);
  __int128 v13 = sub_100241F94((const unsigned __int8 *)v22);
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  __int128 v15 = (void *)objc_claimAutoreleasedReturnValue([v14 UUIDString]);
  if (v15)
  {
    uint64_t v16 = (CBDevice *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_deviceMap,  "objectForKeyedSubscript:",  v15));
    if (v16)
    {
      uint64_t v17 = 0LL;
    }

    else
    {
      uint64_t v16 = objc_alloc_init(&OBJC_CLASS___CBDevice);
      -[CBDevice setIdentifier:](v16, "setIdentifier:", v15);
      -[CBDevice setInternalFlags:](v16, "setInternalFlags:", 4LL);
      deviceMap = self->_deviceMap;
      if (!deviceMap)
      {
        __int128 v19 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
        unsigned int v21 = self->_deviceMap;
        p_deviceMap = &self->_deviceMap;
        *p_deviceMap = v19;

        deviceMap = *p_deviceMap;
      }

      -[NSMutableDictionary setObject:forKeyedSubscript:](deviceMap, "setObject:forKeyedSubscript:", v16, v15);
      uint64_t v17 = 0x4000000LL;
    }

    -[CBDevice setChangeFlags:]( v16,  "setChangeFlags:",  -[CBDevice updateWithClassicDevice:deviceUUID:](v16, "updateWithClassicDevice:deviceUUID:", a3, v14) | v17 | (unint64_t)-[CBDevice changeFlags](v16, "changeFlags"));
    -[CBDevice setDiscoveryFlags:]( v16,  "setDiscoveryFlags:",  (unint64_t)-[CBDevice discoveryFlags](v16, "discoveryFlags") | a4);
  }

  else if (dword_1008D5E28 <= 90 {
         && (dword_1008D5E28 != -1 || _LogCategory_Initialize(&dword_1008D5E28, 90LL)))
  }
  {
    LogPrintF_safe( &dword_1008D5E28,  "-[CBStackDeviceMonitorBTStack _updateDeviceClassic:flags:]",  90LL,  "### Get identifier failed");
  }
}

- (int)_updatePowerSources
{
  uint64_t v3 = IOPSCopyPowerSourcesByType(4LL, a2);
  if (v3)
  {
    uint64_t v4 = (const void *)v3;
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472LL;
    v23[2] = sub_100007A50;
    v23[3] = &unk_10087EB20;
    v23[4] = v3;
    unsigned int v21 = objc_retainBlock(v23);
    CFArrayRef v5 = IOPSCopyPowerSourcesList(v4);
    id v6 = v5;
    if (v5)
    {
      v22[0] = _NSConcreteStackBlock;
      v22[1] = 3221225472LL;
      void v22[2] = sub_100007A58;
      v22[3] = &unk_10087EB20;
      v22[4] = v5;
      __int128 v19 = objc_retainBlock(v22);
      CFIndex Count = CFArrayGetCount(v6);
      if (Count < 1)
      {
        int v20 = 0;
        uint64_t v9 = (void (**)(void))v21;
      }

      else
      {
        CFIndex v8 = 0LL;
        int v20 = 0;
        uint64_t v9 = (void (**)(void))v21;
        do
        {
          ValueAtIndex = CFArrayGetValueAtIndex(v6, v8);
          CFDictionaryRef v11 = IOPSGetPowerSourceDescription(v4, ValueAtIndex);
          uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
          __int128 v13 = v12;
          if (v12)
          {
            uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:@"Accessory Identifier"]);
            if (v14)
            {
              __int128 v15 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_deviceMap,  "objectForKeyedSubscript:",  v14));
              uint64_t v16 = v15;
              if (v15 && ([v15 connectedServices] & 0x400000) != 0)
              {
                [v16 setChangeFlags:[v16 changeFlags] | [v16 updateWithPowerSourceDescription:v13]];
                ++v20;
              }

              uint64_t v9 = (void (**)(void))v21;
            }
          }

          else if (dword_1008D5E28 <= 90 {
                 && (dword_1008D5E28 != -1 || _LogCategory_Initialize(&dword_1008D5E28, 90LL)))
          }
          {
            LogPrintF_safe( &dword_1008D5E28,  "-[CBStackDeviceMonitorBTStack _updatePowerSources]",  90LL,  "### Get power source desc failed");
          }

          ++v8;
        }

        while (Count != v8);
      }

      ((void (*)(void *))v19[2])(v19);

      int v17 = v20;
    }

    else
    {
      if (dword_1008D5E28 <= 90
        && (dword_1008D5E28 != -1 || _LogCategory_Initialize(&dword_1008D5E28, 90LL)))
      {
        LogPrintF_safe( &dword_1008D5E28,  "-[CBStackDeviceMonitorBTStack _updatePowerSources]",  90LL,  "### Get power source array failed");
      }

      int v17 = 0;
      uint64_t v9 = (void (**)(void))v21;
    }

    v9[2](v9);
  }

  else
  {
    if (dword_1008D5E28 <= 90
      && (dword_1008D5E28 != -1 || _LogCategory_Initialize(&dword_1008D5E28, 90LL)))
    {
      LogPrintF_safe( &dword_1008D5E28,  "-[CBStackDeviceMonitorBTStack _updatePowerSources]",  90LL,  "### Get power sources info failed");
    }

    return 0;
  }

  return v17;
}

- (id)deviceFoundHandler
{
  return self->_deviceFoundHandler;
}

- (void)setDeviceFoundHandler:(id)a3
{
}

- (id)deviceLostHandler
{
  return self->_deviceLostHandler;
}

- (void)setDeviceLostHandler:(id)a3
{
}

- (unint64_t)discoveryFlags
{
  return self->_discoveryFlags;
}

- (void)setDiscoveryFlags:(unint64_t)a3
{
  self->_unint64_t discoveryFlags = a3;
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void)setInvalidationHandler:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
@interface CBStackClassicScannerBTStack
- (OS_dispatch_queue)dispatchQueue;
- (id)description;
- (id)descriptionWithLevel:(int)a3;
- (id)deviceFoundHandler;
- (id)deviceLostHandler;
- (id)invalidationHandler;
- (void)_deviceFound:(void *)a3 deviceUUID:(id)a4;
- (void)_deviceLost:(id)a3;
- (void)_discoveryEvent:(int)a3 device:(BTDeviceImpl *)a4 attributes:(unsigned int)a5;
- (void)_invalidated;
- (void)_statusEvent:(int)a3 device:(BTDeviceImpl *)a4 result:(int)a5;
- (void)activate;
- (void)invalidate;
- (void)setDeviceFoundHandler:(id)a3;
- (void)setDeviceLostHandler:(id)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setInvalidationHandler:(id)a3;
@end

@implementation CBStackClassicScannerBTStack

- (id)description
{
  return -[CBStackClassicScannerBTStack descriptionWithLevel:](self, "descriptionWithLevel:", 50LL);
}

- (id)descriptionWithLevel:(int)a3
{
  unsigned int v4 = a3;
  v5 = (char *)-[NSMutableDictionary count](self->_deviceMap, "count");
  if (v4 < 0x15)
  {
    uint64_t v29 = 0LL;
    v30 = (id *)&v29;
    uint64_t v31 = 0x3032000000LL;
    v32 = sub_100031410;
    v33 = sub_100031420;
    id v34 = 0LL;
    id v28 = 0LL;
    id v11 = [(id)objc_opt_class(self) description];
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    NSAppendPrintF_safe(&v28, "== %@: devices %d ==", v12, v5);
    objc_storeStrong(&v34, v28);

    v13 = v30;
    id obj = v30[5];
    NSAppendPrintF_safe(&obj, "\n");
    objc_storeStrong(v13 + 5, obj);
    uint64_t v23 = 0LL;
    v24 = &v23;
    uint64_t v25 = 0x2020000000LL;
    uint64_t v26 = 0LL;
    deviceMap = self->_deviceMap;
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472LL;
    v21[2] = sub_100031428;
    v21[3] = &unk_10087EA20;
    v21[4] = &v29;
    v21[5] = &v23;
    unsigned int v22 = v4;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](deviceMap, "enumerateKeysAndObjectsUsingBlock:", v21);
    unint64_t v15 = v24[3];
    BOOL v16 = (unint64_t)v5 >= v15;
    v17 = &v5[-v15];
    if (v17 != 0LL && v16)
    {
      v18 = v30;
      id v20 = v30[5];
      NSAppendPrintF_safe(&v20, "... %d more, %d total\n", (_DWORD)v17, (_DWORD)v5);
      objc_storeStrong(v18 + 5, v20);
    }

    _Block_object_dispose(&v23, 8);
    id v19 = v30[5];
    _Block_object_dispose(&v29, 8);

    return v19;
  }

  else
  {
    id v6 = [(id)objc_opt_class(self) description];
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    uint64_t v8 = NSPrintF_safe("%@: devices %d", v7, v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);

    return v9;
  }

- (void)activate
{
  if (!self->_deviceFoundHandler)
  {
    CUFatalErrorF(&dword_1008D6300, "No deviceFoundHandler");
    goto LABEL_52;
  }

  v2 = self;
  if (!self->_deviceLostHandler)
  {
LABEL_52:
    CUFatalErrorF(&dword_1008D6300, "No deviceLostHandler");
    goto LABEL_53;
  }

  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  if (!dispatchQueue)
  {
LABEL_53:
    CUFatalErrorF(&dword_1008D6300, "No dispatchQueue");
    goto LABEL_54;
  }

  dispatch_assert_queue_V2(dispatchQueue);
  if (v2->_invalidateCalled)
  {
LABEL_54:
    CUFatalErrorF(&dword_1008D6300, "Activate after invalidate");
LABEL_55:
    dispatch_once(&qword_1008D61A8, &stru_10087FC10);
    goto LABEL_13;
  }

  os_unfair_lock_lock((os_unfair_lock_t)&unk_1008D9EB8);
  v7 = (void *)qword_1008D9EB0;
  if (!qword_1008D9EB0)
  {
    uint64_t v8 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    v9 = (void *)qword_1008D9EB0;
    qword_1008D9EB0 = (uint64_t)v8;

    v7 = (void *)qword_1008D9EB0;
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLong:](&OBJC_CLASS___NSNumber, "numberWithLong:", v2));
  [v7 setObject:v2 forKeyedSubscript:v10];

  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1008D9EB8);
  p_btSession = (unint64_t *)&v2->_btSession;
  if (v2->_btSession) {
    goto LABEL_22;
  }
  v5 = &unk_1008D6000;
  unsigned int v4 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"CBDaemon-0x%X",  CBXPCGetNextClientID());
  if (qword_1008D61A8 != -1) {
    goto LABEL_55;
  }
LABEL_13:
  uint64_t v11 = qword_1008D61A0;
  v12 = v4;
  sub_10002418C(&__p, (char *)-[NSString UTF8String](v12, "UTF8String"));
  int v13 = sub_100496120(v11, (uint64_t)&__p, p_btSession, 2LL);
  int v14 = v13;
  if (v35 < 0)
  {
    operator delete(__p);
    if (!v14) {
      goto LABEL_21;
    }
  }

  else if (!v13)
  {
    goto LABEL_21;
  }

  int v15 = v5[192];
  if (v15 <= 90 && (v15 != -1 || _LogCategory_Initialize(&dword_1008D6300, 90LL)))
  {
    uint64_t v16 = CUPrintErrorCode((v14 + 310000));
    v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    LogPrintF_safe( &dword_1008D6300,  "-[CBStackClassicScannerBTStack activate]",  90LL,  "### Attach session failed: %@",  v17);
  }

- (void)invalidate
{
  if (!self->_invalidateCalled)
  {
    self->_invalidateCalled = 1;
    if (dword_1008D6300 <= 30
      && (dword_1008D6300 != -1 || _LogCategory_Initialize(&dword_1008D6300, 30LL)))
    {
      LogPrintF_safe(&dword_1008D6300, "-[CBStackClassicScannerBTStack invalidate]", 30LL, "Invalidate");
    }

    os_unfair_lock_lock((os_unfair_lock_t)&unk_1008D9EB8);
    v3 = (void *)qword_1008D9EB0;
    unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLong:](&OBJC_CLASS___NSNumber, "numberWithLong:", self));
    [v3 setObject:0 forKeyedSubscript:v4];

    os_unfair_lock_unlock((os_unfair_lock_t)&unk_1008D9EB8);
    if (self->_btDiscoveryAgent)
    {
      if (qword_1008D63D8 != -1) {
        dispatch_once(&qword_1008D63D8, &stru_10087FC30);
      }
      sub_100452BA4(off_1008D63D0, (unint64_t)self->_btDiscoveryAgent);
      self->_btDiscoveryAgent = 0LL;
      if (dword_1008D6300 <= 30
        && (dword_1008D6300 != -1 || _LogCategory_Initialize(&dword_1008D6300, 30LL)))
      {
        LogPrintF_safe(&dword_1008D6300, "-[CBStackClassicScannerBTStack invalidate]", 30LL, "Scan stopped");
      }
    }

    if (self->_btSession)
    {
      if (qword_1008D61A8 != -1) {
        dispatch_once(&qword_1008D61A8, &stru_10087FC10);
      }
      sub_1004966BC(qword_1008D61A0, (unint64_t)self->_btSession);
      self->_btSession = 0LL;
    }

    -[CBStackClassicScannerBTStack _invalidated](self, "_invalidated");
  }

- (void)_invalidated
{
  if (!self->_invalidateDone)
  {
    id deviceFoundHandler = self->_deviceFoundHandler;
    self->_id deviceFoundHandler = 0LL;

    id deviceLostHandler = self->_deviceLostHandler;
    self->_id deviceLostHandler = 0LL;

    id v6 = (void (**)(void))objc_retainBlock(self->_invalidationHandler);
    id invalidationHandler = self->_invalidationHandler;
    self->_id invalidationHandler = 0LL;

    self->_invalidateDone = 1;
    if (v6) {
      v6[2]();
    }
    if (dword_1008D6300 <= 30
      && (dword_1008D6300 != -1 || _LogCategory_Initialize(&dword_1008D6300, 30LL)))
    {
      LogPrintF_safe(&dword_1008D6300, "-[CBStackClassicScannerBTStack _invalidated]", 30LL, "Invalidated");
    }
  }

- (void)_deviceFound:(void *)a3 deviceUUID:(id)a4
{
  id v6 = a4;
  if (!self->_invalidateCalled)
  {
    id v17 = v6;
    v7 = (void *)objc_claimAutoreleasedReturnValue([v6 UUIDString]);
    uint64_t v8 = (CBDevice *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_deviceMap, "objectForKeyedSubscript:", v7));
    if (v8)
    {
      uint64_t v9 = 0LL;
    }

    else
    {
      v10 = objc_alloc_init(&OBJC_CLASS___CBDevice);
      -[CBDevice setIdentifier:](v10, "setIdentifier:", v7);
      -[CBDevice setInternalFlags:](v10, "setInternalFlags:", 128LL);
      uint64_t v9 = 0x4000000LL;
      uint64_t v8 = v10;
    }

    -[CBDevice setDiscoveryFlags:]( v8,  "setDiscoveryFlags:",  (unint64_t)-[CBDevice discoveryFlags](v8, "discoveryFlags") | 0x4000000000000LL);
    -[CBDevice setChangeFlags:](v8, "setChangeFlags:", 0LL);
    unint64_t v11 = -[CBDevice updateWithClassicDevice:deviceUUID:](v8, "updateWithClassicDevice:deviceUUID:", a3, v17) | v9;
    -[CBDevice setChangeFlags:]( v8,  "setChangeFlags:",  (unint64_t)-[CBDevice changeFlags](v8, "changeFlags") | v11);
    -[CBDevice setLastSeenTicks:](v8, "setLastSeenTicks:", mach_absolute_time());
    if ((v11 & 0x4000000) != 0)
    {
      deviceMap = self->_deviceMap;
      if (!deviceMap)
      {
        int v13 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
        int v14 = self->_deviceMap;
        self->_deviceMap = v13;

        deviceMap = self->_deviceMap;
      }

      -[NSMutableDictionary setObject:forKeyedSubscript:](deviceMap, "setObject:forKeyedSubscript:", v8, v7);
      if (dword_1008D6300 <= 30
        && (dword_1008D6300 != -1 || _LogCategory_Initialize(&dword_1008D6300, 30LL)))
      {
        LogPrintF_safe( &dword_1008D6300,  "-[CBStackClassicScannerBTStack _deviceFound:deviceUUID:]",  30LL,  "Device found new: %@",  v8);
      }

      id v15 = objc_retainBlock(self->_deviceFoundHandler);
      uint64_t v16 = v15;
      if (!v15) {
        goto LABEL_20;
      }
    }

    else
    {
      if (dword_1008D6300 <= 30
        && (dword_1008D6300 != -1 || _LogCategory_Initialize(&dword_1008D6300, 30LL)))
      {
        LogPrintF_safe( &dword_1008D6300,  "-[CBStackClassicScannerBTStack _deviceFound:deviceUUID:]",  30LL,  "Device found changed: %@",  v8);
      }

      id v15 = objc_retainBlock(self->_deviceFoundHandler);
      uint64_t v16 = v15;
      if (!v15) {
        goto LABEL_20;
      }
    }

    (*((void (**)(id, CBDevice *))v15 + 2))(v15, v8);
LABEL_20:

    id v6 = v17;
  }
}

- (void)_deviceLost:(id)a3
{
  id v8 = a3;
  unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue([v8 UUIDString]);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_deviceMap, "objectForKeyedSubscript:", v4));
  if (v5)
  {
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_deviceMap, "setObject:forKeyedSubscript:", 0LL, v4);
    if (dword_1008D6300 <= 30
      && (dword_1008D6300 != -1 || _LogCategory_Initialize(&dword_1008D6300, 30LL)))
    {
      LogPrintF_safe(&dword_1008D6300, "-[CBStackClassicScannerBTStack _deviceLost:]", 30LL, "Device lost: %@", v5);
    }

    id v6 = objc_retainBlock(self->_deviceLostHandler);
    v7 = v6;
    if (v6) {
      (*((void (**)(id, void *))v6 + 2))(v6, v5);
    }
  }

  else if (dword_1008D6300 <= 20 {
         && (dword_1008D6300 != -1 || _LogCategory_Initialize(&dword_1008D6300, 20LL)))
  }
  {
    LogPrintF_safe( &dword_1008D6300,  "-[CBStackClassicScannerBTStack _deviceLost:]",  20LL,  "Device lost unknown: %@",  v4);
  }
}

- (void)_discoveryEvent:(int)a3 device:(BTDeviceImpl *)a4 attributes:(unsigned int)a5
{
  if (self->_invalidateCalled) {
    return;
  }
  if (qword_1008D5F50 != -1) {
    dispatch_once(&qword_1008D5F50, &stru_10087FC50);
  }
  uint64_t v9 = (unsigned __int8 *)sub_1003FEF18((uint64_t)off_1008D5F48, (unint64_t)a4);
  if (dword_1008D6300 <= 30 && (dword_1008D6300 != -1 || _LogCategory_Initialize(&dword_1008D6300, 30LL)))
  {
    if (a3 > 2)
    {
      v10 = "?";
      if (v9)
      {
LABEL_8:
        sub_1003CF00C((uint64_t)v9, __p);
        if (v21 >= 0) {
          unint64_t v11 = __p;
        }
        else {
          unint64_t v11 = (void **)__p[0];
        }
LABEL_15:
        LogPrintF_safe( &dword_1008D6300,  "-[CBStackClassicScannerBTStack _discoveryEvent:device:attributes:]",  30LL,  "Discovery event: %s, device %s, attrs 0x%X",  v10,  (const char *)v11,  a5);
        if (v9 && v21 < 0) {
          operator delete(__p[0]);
        }
        goto LABEL_18;
      }
    }

    else
    {
      v10 = off_10087FC90[a3];
      if (v9) {
        goto LABEL_8;
      }
    }

    unint64_t v11 = 0LL;
    goto LABEL_15;
  }

- (void)_statusEvent:(int)a3 device:(BTDeviceImpl *)a4 result:(int)a5
{
  if (self->_invalidateCalled || !self->_btDiscoveryAgent) {
    return;
  }
  if (qword_1008D5F50 != -1) {
    dispatch_once(&qword_1008D5F50, &stru_10087FC50);
  }
  unint64_t v9 = sub_1003FEF18((uint64_t)off_1008D5F48, (unint64_t)a4);
  if (dword_1008D6300 <= 30)
  {
    uint64_t v10 = v9;
    if (dword_1008D6300 != -1 || _LogCategory_Initialize(&dword_1008D6300, 30LL))
    {
      if (a3 > 3)
      {
        unint64_t v11 = "?";
        if (v10)
        {
LABEL_10:
          uint64_t v12 = __p;
          sub_1003CF00C(v10, __p);
          if (v32 < 0) {
            uint64_t v12 = (void **)__p[0];
          }
          goto LABEL_17;
        }
      }

      else
      {
        unint64_t v11 = off_10087FCA8[a3];
        if (v10) {
          goto LABEL_10;
        }
      }

      uint64_t v12 = 0LL;
LABEL_17:
      uint64_t v13 = CUPrintErrorCode((a5 + 310000));
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
      LogPrintF_safe( &dword_1008D6300,  "-[CBStackClassicScannerBTStack _statusEvent:device:result:]",  30LL,  "Status event: %s, device %s, result %@",  v11,  v12,  v14);

      if (v10 && v32 < 0) {
        operator delete(__p[0]);
      }
    }
  }

  if (a3 != 1) {
    return;
  }
  uint64_t v29 = 0LL;
  v30 = 0LL;
  if (qword_1008D63D8 != -1) {
    dispatch_once(&qword_1008D63D8, &stru_10087FC30);
  }
  sub_1004529CC((uint64_t)off_1008D63D0, (unint64_t)self->_btDiscoveryAgent, &v29);
  if (!v29)
  {
    if (dword_1008D6300 <= 90
      && (dword_1008D6300 != -1 || _LogCategory_Initialize(&dword_1008D6300, 90LL)))
    {
      LogPrintF_safe( &dword_1008D6300,  "-[CBStackClassicScannerBTStack _statusEvent:device:result:]",  90LL,  "### Get scan agent failed");
    }

    goto LABEL_43;
  }

  if (qword_1008D63D8 != -1) {
    dispatch_once(&qword_1008D63D8, &stru_10087FC30);
  }
  uint64_t v15 = off_1008D63D0;
  uint64_t v27 = v29;
  id v28 = v30;
  if (v30)
  {
    p_shared_owners = (unint64_t *)&v30->__shared_owners_;
    do
      unint64_t v17 = __ldxr(p_shared_owners);
    while (__stxr(v17 + 1, p_shared_owners));
  }

  int v18 = sub_100453844((uint64_t)v15, &v27, 0, -1);
  id v19 = v28;
  if (v28)
  {
    unint64_t v20 = (unint64_t *)&v28->__shared_owners_;
    do
      unint64_t v21 = __ldaxr(v20);
    while (__stlxr(v21 - 1, v20));
    if (!v21)
    {
      ((void (*)(std::__shared_weak_count *))v19->__on_zero_shared)(v19);
      std::__shared_weak_count::__release_weak(v19);
    }
  }

  if (!v18) {
    goto LABEL_39;
  }
  if (dword_1008D6300 <= 90)
  {
    if (dword_1008D6300 != -1 || _LogCategory_Initialize(&dword_1008D6300, 90LL))
    {
      uint64_t v22 = CUPrintErrorCode((v18 + 310000));
      uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
      LogPrintF_safe( &dword_1008D6300,  "-[CBStackClassicScannerBTStack _statusEvent:device:result:]",  90LL,  "### Scan start failed: rescan, %@",  v23);
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
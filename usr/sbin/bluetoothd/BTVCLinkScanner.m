@interface BTVCLinkScanner
- (BOOL)_needActiveScan;
- (BOOL)scanCache;
- (BTVCLinkScanner)initWithType:(int64_t)a3;
- (NSData)payloadFilterData;
- (NSData)payloadFilterMask;
- (NSSet)trackedPeers;
- (NSString)description;
- (OS_dispatch_queue)dispatchQueue;
- (double)timeout;
- (id)advReportReceiveHandler;
- (id)invalidationHandler;
- (id)timeoutHandler;
- (int64_t)scanInterval;
- (int64_t)scanState;
- (int64_t)scanWindow;
- (void)_activateWithCompletion:(id)a3;
- (void)_invalidate;
- (void)_invokeBlockActivateSafe:(id)a3;
- (void)_restartIfNeeded;
- (void)_restartIfNeeded:(BOOL)a3;
- (void)_scanEnable:(BOOL)a3;
- (void)_startTimeoutIfNeeded;
- (void)_timeoutTimerFired;
- (void)activateWithCompletion:(id)a3;
- (void)btvcBonjourLink:(id)a3 didDiscoverType:(int64_t)a4 withData:(id)a5 fromPeer:(id)a6 peerInfo:(id)a7;
- (void)btvcBonjourLink:(id)a3 didFailToStartScanningForType:(int64_t)a4 WithError:(id)a5;
- (void)btvcBonjourLink:(id)a3 didLosePeer:(id)a4 type:(int64_t)a5;
- (void)btvcBonjourLink:(id)a3 didStartScanningForType:(int64_t)a4;
- (void)btvcBonjourLinkDidUpdateState:(id)a3;
- (void)dealloc;
- (void)invalidate;
- (void)performUpdate:(id)a3;
- (void)scanEnable:(BOOL)a3;
- (void)setAdvReportReceiveHandler:(id)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setInvalidationHandler:(id)a3;
- (void)setPayloadFilterData:(id)a3 mask:(id)a4;
- (void)setScanCache:(BOOL)a3;
- (void)setScanInterval:(int64_t)a3;
- (void)setScanWindow:(int64_t)a3;
- (void)setTimeout:(double)a3;
- (void)setTimeoutHandler:(id)a3;
- (void)setTrackedPeers:(id)a3;
@end

@implementation BTVCLinkScanner

- (BTVCLinkScanner)initWithType:(int64_t)a3
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___BTVCLinkScanner;
  v4 = -[BTVCLinkScanner init](&v8, "init");
  v5 = v4;
  if (v4)
  {
    objc_storeStrong((id *)&v4->_dispatchQueue, &_dispatch_main_q);
    v5->_linktType = a3;
    v6 = v5;
  }

  return v5;
}

- (void)dealloc
{
  if (self->_startRetrier)
  {
    v9 = "StartRetrier still active during dealloc";
LABEL_11:
    FatalErrorF(v9, a2);
    __break(1u);
    return;
  }

  if (self->_btvcBonjourLink)
  {
    v9 = "BTVCBonjourLink still active during dealloc";
    goto LABEL_11;
  }

  dispatchQueue = self->_dispatchQueue;
  if (dispatchQueue)
  {
    self->_dispatchQueue = 0LL;
  }

  id invalidationHandler = self->_invalidationHandler;
  self->_id invalidationHandler = 0LL;

  payloadFilterData = self->_payloadFilterData;
  self->_payloadFilterData = 0LL;

  payloadFilterMask = self->_payloadFilterMask;
  self->_payloadFilterMask = 0LL;

  id timeoutHandler = self->_timeoutHandler;
  self->_id timeoutHandler = 0LL;

  ucat = self->_ucat;
  if (ucat)
  {
    if ((ucat->var3 & 0x40000) != 0)
    {
      LogCategory_Remove();
      self->_ucat = 0LL;
    }
  }

  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___BTVCLinkScanner;
  -[BTVCLinkScanner dealloc](&v10, "dealloc");
}

- (NSString)description
{
  if (self->_invalidateCalled)
  {
    id v15 = 0LL;
    NSAppendPrintF(&v15, ", Invalidated");
    id v3 = v15;
  }

  else
  {
    id v3 = 0LL;
  }

  if (self->_activeScan)
  {
    id v14 = v3;
    NSAppendPrintF(&v14, ", ActiveScan");
    id v4 = v14;

    id v3 = v4;
  }

  if (self->_needDups)
  {
    id v13 = v3;
    NSAppendPrintF(&v13, ", NeedDups");
    id v5 = v13;

    id v3 = v5;
  }

  if (self->_scanCache)
  {
    id v12 = v3;
    NSAppendPrintF(&v12, ", ScanCache");
    id v6 = v12;

    id v3 = v6;
  }

  payloadFilterData = self->_payloadFilterData;
  payloadFilterMask = self->_payloadFilterMask;
  if (!payloadFilterData)
  {
    if (!payloadFilterMask) {
      return (NSString *)v3;
    }
    payloadFilterData = (NSData *)&stru_1008A57D8;
  }

  id v11 = v3;
  if (!payloadFilterMask) {
    payloadFilterMask = (NSData *)&stru_1008A57D8;
  }
  NSAppendPrintF(&v11, ", blob <%@>/<%@>", payloadFilterData, payloadFilterMask);
  id v9 = v11;

  id v3 = v9;
  return (NSString *)v3;
}

- (void)setDispatchQueue:(id)a3
{
  id v4 = (OS_dispatch_queue *)a3;
  obj = self;
  objc_sync_enter(obj);
  if (obj->_activateCalled)
  {
    FatalErrorF("Attempt to set dispatch queue after activate has been called", v5);
    __break(1u);
  }

  else
  {
    dispatchQueue = obj->_dispatchQueue;
    obj->_dispatchQueue = v4;

    objc_sync_exit(obj);
  }

- (void)setPayloadFilterData:(id)a3 mask:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_super v8 = (os_log_s *)qword_1008F7710;
  if (os_log_type_enabled((os_log_t)qword_1008F7710, OS_LOG_TYPE_DEBUG)) {
    sub_100683CB0((uint64_t)v6, (uint64_t)v7, v8);
  }
  id v9 = [v6 length];
  if (v9 == [v7 length])
  {
    id v10 = [v6 copy];
    id v11 = [v7 copy];
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_100488E24;
    v15[3] = &unk_100880CD0;
    v15[4] = self;
    id v12 = v10;
    id v16 = v12;
    id v17 = v11;
    id v13 = v11;
    -[BTVCLinkScanner _invokeBlockActivateSafe:](self, "_invokeBlockActivateSafe:", v15);
  }

  else
  {
    [v6 length];
    [v7 length];
    FatalErrorF("Mismatched data (%ld) vs mask (%ld) lengths", v14);
    __break(1u);
  }

- (void)setTimeout:(double)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_100488EB0;
  v3[3] = &unk_1008800B8;
  v3[4] = self;
  *(double *)&v3[5] = a3;
  -[BTVCLinkScanner _invokeBlockActivateSafe:](self, "_invokeBlockActivateSafe:", v3);
}

- (void)activateWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  objc_sync_enter(v5);
  v5->_activateCalled = 1;
  dispatchQueue = (dispatch_queue_s *)v5->_dispatchQueue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_100488FAC;
  v8[3] = &unk_10088AC78;
  v8[4] = v5;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(dispatchQueue, v8);

  objc_sync_exit(v5);
}

- (void)_activateWithCompletion:(id)a3
{
  uint64_t v5 = (void (**)(id, void *))a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  id v6 = (os_log_s *)qword_1008F7710;
  if (os_log_type_enabled((os_log_t)qword_1008F7710, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v23 = "-[BTVCLinkScanner _activateWithCompletion:]";
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s Activate\n", buf, 0xCu);
  }

  if (self->_invalidateCalled)
  {
    uint64_t v15 = 4294960572LL;
  }

  else if (self->_startRetrier)
  {
    uint64_t v15 = 4294960575LL;
  }

  else
  {
    int64_t linktType = self->_linktType;
    if ((unint64_t)(linktType - 1) > 1)
    {
      id v12 = (os_log_s *)qword_1008F7710;
      if (os_log_type_enabled((os_log_t)qword_1008F7710, OS_LOG_TYPE_DEFAULT))
      {
        unint64_t v13 = self->_linktType;
        if (v13 > 2) {
          uint64_t v14 = "?";
        }
        else {
          uint64_t v14 = off_10089A848[v13];
        }
        *(_DWORD *)buf = 134218242;
        v23 = (const char *)v13;
        __int16 v24 = 2080;
        v25 = v14;
        _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Warning: [BTVCLinkScanner] ### Activate with unsupported type: %ld (%s)\n",  buf,  0x16u);
      }

      uint64_t v15 = 4294960561LL;
    }

    else
    {
      self->_btvcBonjourLinkType = linktType != 1;
      if (self->_btvcBonjourLink
        || (id v3 = (void *)objc_claimAutoreleasedReturnValue(+[BTVCLinkClient btvcLinkClient](&OBJC_CLASS___BTVCLinkClient, "btvcLinkClient")),
            objc_super v8 = (objc_class *)objc_claimAutoreleasedReturnValue([v3 addBTVCBonjourLinkDelegate:self]),
            btvcBonjourLink = self->_btvcBonjourLink,
            self = (BTVCLinkScanner *)((char *)self + 136),
            self->super.isa = v8,
            btvcBonjourLink,
            v3,
            self->super.isa))
      {
        if (!v5) {
          goto LABEL_24;
        }
        id v10 = 0LL;
        char v11 = 1;
        goto LABEL_22;
      }

      uint64_t v15 = 4294960567LL;
    }
  }

  id v16 = (os_log_s *)qword_1008F7710;
  if (os_log_type_enabled((os_log_t)qword_1008F7710, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v23) = v15;
    _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "Warning: [BTVCLinkScanner] ### Activate failed: %d\n",  buf,  8u);
  }

  if (v5)
  {
    id v17 = +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  DebugGetErrorString(v15, 0LL, 0LL),  NSLocalizedDescriptionKey);
    v18 = [v17 autorelease];
    self = v18;
    v19 = @"?";
    if (v18) {
      v19 = (const __CFString *)v18;
    }
    v21 = v19;
    id v3 = [NSDictionary dictionaryWithObjects:forKeys:count:&v21, &v20, 1LL];
    id v10 = [NSError errorWithDomain:NSOSStatusErrorDomain code:(int)v15 userInfo:v3];
    char v11 = 0;
LABEL_22:
    v5[2](v5, v10);
    if ((v11 & 1) == 0)
    {
    }
  }

- (void)scanEnable:(BOOL)a3
{
  id v4 = self;
  objc_sync_enter(v4);
  dispatchQueue = (dispatch_queue_s *)v4->_dispatchQueue;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_100489378;
  v6[3] = &unk_100880230;
  v6[4] = v4;
  BOOL v7 = a3;
  dispatch_async(dispatchQueue, v6);
  objc_sync_exit(v4);
}

- (void)_scanEnable:(BOOL)a3
{
  BOOL v3 = a3;
  id location = 0LL;
  objc_initWeak(&location, self);
  uint64_t v5 = (os_log_s *)qword_1008F7710;
  if (os_log_type_enabled((os_log_t)qword_1008F7710, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v20 = "-[BTVCLinkScanner _scanEnable:]";
    __int16 v21 = 1024;
    BOOL v22 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s scanEnable: %d\n", buf, 0x12u);
  }

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  startRetrier = self->_startRetrier;
  if (v3)
  {
    if (startRetrier)
    {
LABEL_7:
      -[CURetrier startDirect](startRetrier, "startDirect", v13, v14, v15, v16);
      goto LABEL_13;
    }

    BOOL v7 = objc_alloc_init(&OBJC_CLASS___CURetrier);
    objc_super v8 = self->_startRetrier;
    self->_startRetrier = v7;

    id v9 = self->_startRetrier;
    if (v9)
    {
      -[CURetrier setDispatchQueue:](v9, "setDispatchQueue:", self->_dispatchQueue);
      unint64_t v13 = _NSConcreteStackBlock;
      uint64_t v14 = 3221225472LL;
      uint64_t v15 = sub_1004895A4;
      id v16 = &unk_100887098;
      objc_copyWeak(&v17, &location);
      -[CURetrier setActionHandler:](self->_startRetrier, "setActionHandler:", &v13);
      objc_destroyWeak(&v17);
      startRetrier = self->_startRetrier;
      goto LABEL_7;
    }

    id v12 = (os_log_s *)qword_1008F7710;
    if (os_log_type_enabled((os_log_t)qword_1008F7710, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v20) = -6729;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Warning: [BTVCLinkScanner] ### scanEnable failed: %d\n",  buf,  8u);
    }
  }

  else
  {
    if (startRetrier)
    {
      -[CURetrier invalidateDirect](startRetrier, "invalidateDirect");
      id v10 = self->_startRetrier;
      self->_startRetrier = 0LL;
    }

    btvcBonjourLink = self->_btvcBonjourLink;
    if (btvcBonjourLink) {
      -[BTVCBonjourLink stopScanningForType:](btvcBonjourLink, "stopScanningForType:", 1LL);
    }
    self->_scanStarted = 0;
  }

- (void)invalidate
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1004896D4;
  block[3] = &unk_10087EA48;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_invalidate
{
  if (!self->_invalidateCalled)
  {
    if (os_log_type_enabled((os_log_t)qword_1008F7710, OS_LOG_TYPE_DEBUG)) {
      sub_100683D60();
    }
    self->_invalidateCalled = 1;
    timeoutTimer = self->_timeoutTimer;
    if (timeoutTimer)
    {
      id v4 = timeoutTimer;
      dispatch_source_cancel(v4);
      uint64_t v5 = self->_timeoutTimer;
      self->_timeoutTimer = 0LL;
    }

    startRetrier = self->_startRetrier;
    if (startRetrier)
    {
      -[CURetrier invalidateDirect](startRetrier, "invalidateDirect");
      BOOL v7 = self->_startRetrier;
      self->_startRetrier = 0LL;
    }

    if (self->_linktType == 2)
    {
      -[BTVCBonjourLink stopScanningForType:](self->_btvcBonjourLink, "stopScanningForType:", 1LL);
      btvcBonjourLink = self->_btvcBonjourLink;
      if (btvcBonjourLink)
      {
        id v9 = [BTVCLinkClient btvcLinkClient];
        [v9 removeBTVCBonjourLinkDelegate:self];

        btvcBonjourLink = self->_btvcBonjourLink;
      }

      self->_btvcBonjourLink = 0LL;
    }

    else
    {
      id v10 = (os_log_s *)qword_1008F7710;
      if (os_log_type_enabled((os_log_t)qword_1008F7710, OS_LOG_TYPE_DEFAULT))
      {
        unint64_t linktType = self->_linktType;
        if (linktType > 2) {
          id v12 = "?";
        }
        else {
          id v12 = off_10089A848[linktType];
        }
        int v16 = 134218242;
        unint64_t v17 = linktType;
        __int16 v18 = 2080;
        v19 = v12;
        _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Warning: [BTVCLinkScanner] ### Invalidate unsupported type: %ld (%s)\n",  (uint8_t *)&v16,  0x16u);
      }
    }

    self->_scanStarted = 0;
    if (os_log_type_enabled((os_log_t)qword_1008F7710, OS_LOG_TYPE_DEBUG)) {
      sub_100683D34();
    }
    id invalidationHandler = (void (**)(void))self->_invalidationHandler;
    if (invalidationHandler)
    {
      invalidationHandler[2]();
      id v14 = self->_invalidationHandler;
    }

    else
    {
      id v14 = 0LL;
    }

    self->_id invalidationHandler = 0LL;

    id timeoutHandler = self->_timeoutHandler;
    self->_id timeoutHandler = 0LL;
  }

- (void)performUpdate:(id)a3
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1004899A8;
  block[3] = &unk_10087EA48;
  block[4] = self;
  uint64_t v5 = (void (**)(void))a3;
  dispatch_async(dispatchQueue, block);
  v5[2](v5);

  id v6 = (dispatch_queue_s *)self->_dispatchQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1004899B8;
  v7[3] = &unk_10087EA48;
  v7[4] = self;
  dispatch_async(v6, v7);
}

- (void)_invokeBlockActivateSafe:(id)a3
{
  id v4 = (void (**)(void))a3;
  uint64_t v5 = self;
  objc_sync_enter(v5);
  if (v5->_activateCalled)
  {
    dispatchQueue = (dispatch_queue_s *)v5->_dispatchQueue;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_100489AAC;
    v7[3] = &unk_100880C58;
    v7[4] = v5;
    objc_super v8 = v4;
    dispatch_async(dispatchQueue, v7);
  }

  else
  {
    v4[2](v4);
  }

  objc_sync_exit(v5);
}

- (BOOL)_needActiveScan
{
  return 0;
}

- (void)_restartIfNeeded
{
}

- (void)_restartIfNeeded:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = (os_log_s *)qword_1008F7710;
  if (os_log_type_enabled((os_log_t)qword_1008F7710, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v26 = "-[BTVCLinkScanner _restartIfNeeded:]";
    __int16 v27 = 1024;
    LODWORD(v28) = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s inForce: %d\n", buf, 0x12u);
  }

  if ((unint64_t)(self->_linktType - 1) > 1)
  {
    id v9 = (os_log_s *)qword_1008F7710;
    if (os_log_type_enabled((os_log_t)qword_1008F7710, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t linktType = self->_linktType;
      if (linktType > 2) {
        char v11 = "?";
      }
      else {
        char v11 = off_10089A848[linktType];
      }
      *(_DWORD *)buf = 134218242;
      v26 = (const char *)linktType;
      __int16 v27 = 2080;
      v28 = v11;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Warning: [BTVCLinkScanner] ### Restart unsupported type: %ld (%s)\n",  buf,  0x16u);
    }

    uint64_t v13 = qword_1008F7710;
    if (!os_log_type_enabled((os_log_t)qword_1008F7710, OS_LOG_TYPE_DEFAULT)) {
      return;
    }
    *(_DWORD *)buf = 67109120;
    LODWORD(v26) = -6735;
    id v14 = "Warning: [BTVCLinkScanner] ### RestartIfNeeded failed: %d\n";
    uint64_t v15 = (os_log_s *)v13;
    uint32_t v16 = 8;
LABEL_20:
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, v14, buf, v16);
    return;
  }

  btvcBonjourLink = self->_btvcBonjourLink;
  if (!btvcBonjourLink) {
    return;
  }
  if (self->_scanCache && self->_scanStarted)
  {
    uint64_t v23 = qword_1008F7710;
    if (!os_log_type_enabled((os_log_t)qword_1008F7710, OS_LOG_TYPE_DEFAULT)) {
      return;
    }
    *(_WORD *)buf = 0;
    id v14 = "[BTVCLinkScanner] Scan restart skipped while scan cache scanning\n";
    uint64_t v15 = (os_log_s *)v23;
    uint32_t v16 = 2;
    goto LABEL_20;
  }

  unint64_t v7 = -[BTVCBonjourLink state](btvcBonjourLink, "state");
  if (v7 == 3)
  {
    if (v3)
    {
      BOOL scanStarted = self->_scanStarted;
    }

    else
    {
      if (self->_scanStarted)
      {
        id v12 = (os_log_s *)qword_1008F7710;
        if (os_log_type_enabled((os_log_t)qword_1008F7710, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "[BTVCLinkScanner] Scan restart skipped when unchanged\n",  buf,  2u);
        }

        goto LABEL_29;
      }

      BOOL scanStarted = 0;
    }

    if (os_log_type_enabled((os_log_t)qword_1008F7710, OS_LOG_TYPE_DEBUG)) {
      sub_100683DB8();
    }
    if (scanStarted && v3)
    {
      if (os_log_type_enabled((os_log_t)qword_1008F7710, OS_LOG_TYPE_DEBUG)) {
        sub_100683D8C();
      }
      -[BTVCBonjourLink stopScanningForType:]( self->_btvcBonjourLink,  "stopScanningForType:",  self->_btvcBonjourLinkType);
    }

    BYTE1(v24) = self->_scanCache;
    LOBYTE(v24) = self->_needDups;
    -[BTVCBonjourLink startScanningForType:data:mask:peers:scanMode:rssi:duplicates:scanCache:useCaseList:]( self->_btvcBonjourLink,  "startScanningForType:data:mask:peers:scanMode:rssi:duplicates:scanCache:useCaseList:",  self->_btvcBonjourLinkType,  self->_payloadFilterData,  self->_payloadFilterMask,  0LL,  10LL,  0LL,  v24,  0LL);
    unint64_t v17 = (NSData *)-[NSData copy](self->_payloadFilterData, "copy");
    scanParamFilterData = self->_scanParamFilterData;
    self->_scanParamFilterData = v17;

    v19 = (NSData *)-[NSData copy](self->_payloadFilterMask, "copy");
    scanParamFilterMask = self->_scanParamFilterMask;
    self->_scanParamFilterMask = v19;

    self->_scanParamDups = self->_needDups;
    self->_scanParamCache = self->_scanCache;
LABEL_29:
    self->_BOOL scanStarted = 1;
    -[CURetrier succeededDirect](self->_startRetrier, "succeededDirect");
    return;
  }

  uint64_t v21 = qword_1008F7710;
  if (os_log_type_enabled((os_log_t)qword_1008F7710, OS_LOG_TYPE_DEFAULT))
  {
    if (v7 > 5) {
      BOOL v22 = "?";
    }
    else {
      BOOL v22 = off_10089A818[v7];
    }
    *(_DWORD *)buf = 136315138;
    v26 = v22;
    id v14 = "[BTVCLinkScanner] Scan start deferred while in Bluetooth state: %s\n";
    uint64_t v15 = (os_log_s *)v21;
    uint32_t v16 = 12;
    goto LABEL_20;
  }

- (void)_startTimeoutIfNeeded
{
  if (!self->_timeoutFired && self->_timeout > 0.0 && !self->_timeoutTimer)
  {
    BOOL v3 = (os_log_s *)qword_1008F7710;
    if (os_log_type_enabled((os_log_t)qword_1008F7710, OS_LOG_TYPE_DEFAULT))
    {
      double timeout = self->_timeout;
      *(_DWORD *)buf = 134217984;
      double v14 = timeout;
      _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "[BTVCLinkScanner] Start timeout timer for %f seconds\n",  buf,  0xCu);
    }

    uint64_t v5 = (OS_dispatch_source *)dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_timer,  0LL,  0LL,  (dispatch_queue_t)self->_dispatchQueue);
    timeoutTimer = self->_timeoutTimer;
    self->_timeoutTimer = v5;

    objc_super v8 = self->_timeoutTimer;
    if (!v8) {
      FatalErrorF("Create timeout timer failed", v7);
    }
    unint64_t v9 = (unint64_t)(self->_timeout * 1000000000.0);
    dispatch_time_t v10 = dispatch_time(0LL, v9);
    dispatch_source_set_timer((dispatch_source_t)v8, v10, v9, v9 >> 2);
    char v11 = self->_timeoutTimer;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472LL;
    handler[2] = sub_10048A010;
    handler[3] = &unk_10087EA48;
    handler[4] = self;
    dispatch_source_set_event_handler((dispatch_source_t)v11, handler);
    dispatch_resume((dispatch_object_t)self->_timeoutTimer);
  }

- (void)_timeoutTimerFired
{
  BOOL v3 = (os_log_s *)qword_1008F7710;
  if (os_log_type_enabled((os_log_t)qword_1008F7710, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)unint64_t v9 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "[BTVCLinkScanner] Timeout timer fired\n",  v9,  2u);
  }

  self->_timeoutFired = 1;
  timeoutTimer = self->_timeoutTimer;
  if (timeoutTimer)
  {
    uint64_t v5 = timeoutTimer;
    dispatch_source_cancel(v5);
    id v6 = self->_timeoutTimer;
    self->_timeoutTimer = 0LL;
  }

  id timeoutHandler = (void (**)(void))self->_timeoutHandler;
  if (timeoutHandler)
  {
    timeoutHandler[2]();
    id v8 = self->_timeoutHandler;
  }

  else
  {
    id v8 = 0LL;
  }

  self->_id timeoutHandler = 0LL;
}

- (void)btvcBonjourLinkDidUpdateState:(id)a3
{
  id v4 = (BTVCBonjourLink *)a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  btvcBonjourLink = self->_btvcBonjourLink;
  if (btvcBonjourLink) {
    BOOL v6 = btvcBonjourLink == v4;
  }
  else {
    BOOL v6 = 0;
  }
  if (v6)
  {
    unint64_t v7 = -[BTVCBonjourLink state](v4, "state");
    id v8 = (os_log_s *)qword_1008F7710;
    if (os_log_type_enabled((os_log_t)qword_1008F7710, OS_LOG_TYPE_INFO))
    {
      if (v7 > 5) {
        unint64_t v9 = "?";
      }
      else {
        unint64_t v9 = off_10089A860[v7];
      }
      int v10 = 136315138;
      char v11 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_INFO,  "[BTVCLinkScanner] Bluetooth state updated: %s\n",  (uint8_t *)&v10,  0xCu);
    }
  }
}

- (void)btvcBonjourLink:(id)a3 didStartScanningForType:(int64_t)a4
{
  BOOL v6 = (BTVCBonjourLink *)a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  btvcBonjourLink = self->_btvcBonjourLink;
  if (btvcBonjourLink) {
    BOOL v8 = btvcBonjourLink == v6;
  }
  else {
    BOOL v8 = 0;
  }
  if (v8 && self->_btvcBonjourLinkType == a4)
  {
    unint64_t v9 = (os_log_s *)qword_1008F7710;
    if (os_log_type_enabled((os_log_t)qword_1008F7710, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)int v10 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "[BTVCLinkScanner] Bluetooth scanning started\n",  v10,  2u);
    }

    if (self->_scanState != 1) {
      self->_scanState = 1LL;
    }
    -[BTVCLinkScanner _startTimeoutIfNeeded](self, "_startTimeoutIfNeeded");
  }
}

- (void)btvcBonjourLink:(id)a3 didFailToStartScanningForType:(int64_t)a4 WithError:(id)a5
{
  BOOL v8 = (BTVCBonjourLink *)a3;
  id v9 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  btvcBonjourLink = self->_btvcBonjourLink;
  if (btvcBonjourLink) {
    BOOL v11 = btvcBonjourLink == v8;
  }
  else {
    BOOL v11 = 0;
  }
  if (v11 && self->_btvcBonjourLinkType == a4)
  {
    id v12 = (os_log_s *)qword_1008F7710;
    if (os_log_type_enabled((os_log_t)qword_1008F7710, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 138412290;
      id v14 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Warning: [BTVCLinkScanner] ### Bluetooth scan failed: %@\n",  (uint8_t *)&v13,  0xCu);
    }

    self->_BOOL scanStarted = 0;
    -[CURetrier failedDirect](self->_startRetrier, "failedDirect");
  }
}

- (void)btvcBonjourLink:(id)a3 didDiscoverType:(int64_t)a4 withData:(id)a5 fromPeer:(id)a6 peerInfo:(id)a7
{
  id v12 = (BTVCBonjourLink *)a3;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  btvcBonjourLink = self->_btvcBonjourLink;
  if (btvcBonjourLink && btvcBonjourLink == v12 && self->_btvcBonjourLinkType == a4)
  {
    unint64_t v17 = (os_log_s *)qword_1008F7710;
    if (os_log_type_enabled((os_log_t)qword_1008F7710, OS_LOG_TYPE_DEFAULT))
    {
      v23[0] = 67109890;
      v23[1] = a4;
      __int16 v24 = 2112;
      id v25 = v13;
      __int16 v26 = 2112;
      id v27 = v14;
      __int16 v28 = 2112;
      id v29 = v15;
      _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "[BTVCLinkScanner] DiscoverType %d, data:%@ peer:%@ peerInfo:%@\n",  (uint8_t *)v23,  0x26u);
    }

    __int16 v18 = (void *)objc_claimAutoreleasedReturnValue(-[BTVCLinkScanner advReportReceiveHandler](self, "advReportReceiveHandler"));
    BOOL v19 = v18 == 0LL;

    if (!v19)
    {
      uint64_t v20 = [self advReportReceiveHandler];
      uint64_t v21 = (void *)v20;
      if (a4 == 1) {
        uint64_t v22 = 2LL;
      }
      else {
        uint64_t v22 = 1LL;
      }
      (*(void (**)(uint64_t, uint64_t, id, id, id))(v20 + 16))(v20, v22, v13, v14, v15);
    }
  }
}

- (void)btvcBonjourLink:(id)a3 didLosePeer:(id)a4 type:(int64_t)a5
{
  int v5 = a5;
  id v7 = a4;
  BOOL v8 = (os_log_s *)qword_1008F7710;
  if (os_log_type_enabled((os_log_t)qword_1008F7710, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412546;
    id v10 = v7;
    __int16 v11 = 1024;
    int v12 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "[BTVCLinkScanner] Lose peer device:%@, link type:%d\n",  (uint8_t *)&v9,  0x12u);
  }

  -[BTVCLinkScanner _restartIfNeeded:](self, "_restartIfNeeded:", 1LL);
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (id)advReportReceiveHandler
{
  return self->_advReportReceiveHandler;
}

- (void)setAdvReportReceiveHandler:(id)a3
{
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void)setInvalidationHandler:(id)a3
{
}

- (NSData)payloadFilterData
{
  return self->_payloadFilterData;
}

- (NSData)payloadFilterMask
{
  return self->_payloadFilterMask;
}

- (BOOL)scanCache
{
  return self->_scanCache;
}

- (void)setScanCache:(BOOL)a3
{
  self->_scanCache = a3;
}

- (int64_t)scanInterval
{
  return self->_scanInterval;
}

- (void)setScanInterval:(int64_t)a3
{
  self->_scanInterval = a3;
}

- (int64_t)scanState
{
  return self->_scanState;
}

- (int64_t)scanWindow
{
  return self->_scanWindow;
}

- (void)setScanWindow:(int64_t)a3
{
  self->_scanWindow = a3;
}

- (double)timeout
{
  return self->_timeout;
}

- (id)timeoutHandler
{
  return self->_timeoutHandler;
}

- (void)setTimeoutHandler:(id)a3
{
}

- (NSSet)trackedPeers
{
  return self->_trackedPeers;
}

- (void)setTrackedPeers:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
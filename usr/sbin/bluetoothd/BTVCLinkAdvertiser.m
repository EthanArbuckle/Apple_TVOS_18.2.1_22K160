@interface BTVCLinkAdvertiser
- (BTVCLinkAdvertiser)initWithType:(int64_t)a3;
- (NSString)description;
- (OS_dispatch_queue)dispatchQueue;
- (id)advertiseStateChangedHandler;
- (id)invalidationHandler;
- (int)_preparePayload:(BOOL)a3;
- (void)_activateWithCompletion:(id)a3;
- (void)_advertisingEnable:(BOOL)a3;
- (void)_invalidate;
- (void)_restartIfNeeded:(BOOL)a3;
- (void)activateWithCompletion:(id)a3;
- (void)advertisingEnable:(BOOL)a3;
- (void)btvcBonjourLink:(id)a3 didConnectToPeer:(id)a4 error:(id)a5;
- (void)btvcBonjourLink:(id)a3 didStartAdvertisingType:(int64_t)a4;
- (void)btvcBonjourLink:(id)a3 didStopAdvertisingType:(int64_t)a4 withError:(id)a5;
- (void)btvcBonjourLinkDidUpdateState:(id)a3;
- (void)dealloc;
- (void)invalidate;
- (void)nearby:(id)a3 didDeferAdvertisingType:(int64_t)a4;
- (void)nearby:(id)a3 didFailToStartAdvertisingOfType:(int64_t)a4 withError:(id)a5;
- (void)setAdvertiseStateChangedHandler:(id)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setInvalidationHandler:(id)a3;
- (void)setPayloadData:(id)a3;
- (void)setPayloadFields:(id)a3;
@end

@implementation BTVCLinkAdvertiser

- (BTVCLinkAdvertiser)initWithType:(int64_t)a3
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___BTVCLinkAdvertiser;
  v4 = -[BTVCLinkAdvertiser init](&v8, "init");
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
    FatalErrorF("StartRetrier still active during dealloc", a2);
    __break(1u);
  }

  else
  {
    id advertiseStateChangedHandler = self->_advertiseStateChangedHandler;
    self->_id advertiseStateChangedHandler = 0LL;

    dispatchQueue = self->_dispatchQueue;
    if (dispatchQueue)
    {
      self->_dispatchQueue = 0LL;
    }

    id invalidationHandler = self->_invalidationHandler;
    self->_id invalidationHandler = 0LL;

    payloadDataCurrent = self->_payloadDataCurrent;
    self->_payloadDataCurrent = 0LL;

    payloadDataPrevious = self->_payloadDataPrevious;
    self->_payloadDataPrevious = 0LL;

    payloadFields = self->_payloadFields;
    self->_payloadFields = 0LL;

    payloadIdentifier = self->_payloadIdentifier;
    self->_payloadIdentifier = 0LL;

    v10.receiver = self;
    v10.super_class = (Class)&OBJC_CLASS___BTVCLinkAdvertiser;
    -[BTVCLinkAdvertiser dealloc](&v10, "dealloc");
  }

- (NSString)description
{
  id v14 = 0LL;
  unint64_t linktType = self->_linktType;
  if (linktType > 2) {
    v4 = "?";
  }
  else {
    v4 = off_10088ACB8[linktType];
  }
  NSAppendPrintF(&v14, "BTVCLinkAdvertiser, Type %s", v4);
  id v5 = v14;
  v6 = v5;
  if (self->_invalidateCalled)
  {
    id v13 = v5;
    NSAppendPrintF(&v13, ", Invalidated");
    id v7 = v13;

    v6 = v7;
  }

  id v12 = v6;
  unint64_t advertiseState = self->_advertiseState;
  if (advertiseState > 3) {
    v9 = "?";
  }
  else {
    v9 = off_10088AC98[advertiseState];
  }
  NSAppendPrintF(&v12, ", State %s", v9);
  id v10 = v12;

  return (NSString *)v10;
}

- (void)setDispatchQueue:(id)a3
{
  v4 = (OS_dispatch_queue *)a3;
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

- (void)setPayloadData:(id)a3
{
  id v4 = a3;
  id v5 = [v4 copy];
  v6 = self;
  objc_sync_enter(v6);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_10026B34C;
  v13[3] = &unk_10087FB90;
  v13[4] = v6;
  id v7 = v5;
  id v14 = v7;
  objc_super v8 = objc_retainBlock(v13);
  v9 = v8;
  if (v6->_activateCalled)
  {
    dispatchQueue = (dispatch_queue_s *)v6->_dispatchQueue;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_10026B390;
    v11[3] = &unk_100880C58;
    v11[4] = v6;
    id v12 = v8;
    dispatch_async(dispatchQueue, v11);
  }

  else
  {
    ((void (*)(void *))v8[2])(v8);
  }

  objc_sync_exit(v6);
}

- (void)setPayloadFields:(id)a3
{
  id v4 = a3;
  id v5 = [v4 copy];
  v6 = self;
  objc_sync_enter(v6);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_10026B51C;
  v13[3] = &unk_10087FB90;
  v13[4] = v6;
  id v7 = v5;
  id v14 = v7;
  objc_super v8 = objc_retainBlock(v13);
  v9 = v8;
  if (v6->_activateCalled)
  {
    dispatchQueue = (dispatch_queue_s *)v6->_dispatchQueue;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_10026B560;
    v11[3] = &unk_100880C58;
    v11[4] = v6;
    id v12 = v8;
    dispatch_async(dispatchQueue, v11);
  }

  else
  {
    ((void (*)(void *))v8[2])(v8);
  }

  objc_sync_exit(v6);
}

- (void)activateWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = self;
  objc_sync_enter(v5);
  v5->_activateCalled = 1;
  dispatchQueue = (dispatch_queue_s *)v5->_dispatchQueue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_10026B64C;
  v8[3] = &unk_10088AC78;
  v8[4] = v5;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(dispatchQueue, v8);

  objc_sync_exit(v5);
}

- (void)_activateWithCompletion:(id)a3
{
  id v5 = (void (**)(id, void *))a3;
  v6 = (os_log_s *)qword_1008F7710;
  if (os_log_type_enabled((os_log_t)qword_1008F7710, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t linktType = self->_linktType;
    if (linktType > 2) {
      objc_super v8 = "?";
    }
    else {
      objc_super v8 = off_10088ACB8[linktType];
    }
    *(_DWORD *)buf = 136315650;
    v22 = "-[BTVCLinkAdvertiser _activateWithCompletion:]";
    __int16 v23 = 2048;
    unint64_t v24 = linktType;
    __int16 v25 = 2080;
    v26 = v8;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s: %ld (%s)\n", buf, 0x20u);
  }

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (self->_invalidateCalled)
  {
    uint64_t v14 = 4294960572LL;
  }

  else if (self->_startRetrier)
  {
    uint64_t v14 = 4294960575LL;
  }

  else
  {
    int64_t v9 = self->_linktType;
    if ((unint64_t)(v9 - 1) > 1)
    {
      if (os_log_type_enabled((os_log_t)qword_1008F7710, OS_LOG_TYPE_ERROR)) {
        sub_100665098();
      }
      uint64_t v14 = 4294960561LL;
    }

    else
    {
      self->_btvcBonjourLinkType = v9 != 1;
      if (self->_btvcBonjourLink
        || (v3 = (void *)objc_claimAutoreleasedReturnValue(+[BTVCLinkClient btvcLinkClient](&OBJC_CLASS___BTVCLinkClient, "btvcLinkClient")),
            id v10 = (objc_class *)objc_claimAutoreleasedReturnValue([v3 addBTVCBonjourLinkDelegate:self]),
            btvcBonjourLink = self->_btvcBonjourLink,
            self = (BTVCLinkAdvertiser *)((char *)self + 80),
            self->super.isa = v10,
            btvcBonjourLink,
            v3,
            self->super.isa))
      {
        if (!v5) {
          goto LABEL_24;
        }
        id v12 = 0LL;
        char v13 = 1;
        goto LABEL_22;
      }

      uint64_t v14 = 4294960567LL;
    }
  }

  v15 = (os_log_s *)qword_1008F7710;
  if (os_log_type_enabled((os_log_t)qword_1008F7710, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v22) = v14;
    _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "Warning: [BTVCLinkAdvertiser] ### Activate failed: %d\n",  buf,  8u);
  }

  if (v5)
  {
    NSErrorUserInfoKey v19 = NSLocalizedDescriptionKey;
    v16 = +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  DebugGetErrorString(v14, 0LL, 0LL));
    v17 = (BTVCLinkAdvertiser *)objc_claimAutoreleasedReturnValue(v16);
    self = v17;
    v18 = @"?";
    if (v17) {
      v18 = (const __CFString *)v17;
    }
    v20 = v18;
    v3 = [NSDictionary dictionaryWithObjects:forKeys:count:&v20, &v19, 1LL];
    id v12 = [NSError errorWithDomain:NSOSStatusErrorDomain code:(int)v14 userInfo:v3];
    char v13 = 0;
LABEL_22:
    v5[2](v5, v12);
    if ((v13 & 1) == 0)
    {
    }
  }

- (void)advertisingEnable:(BOOL)a3
{
  id v4 = self;
  objc_sync_enter(v4);
  dispatchQueue = (dispatch_queue_s *)v4->_dispatchQueue;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_10026B9F4;
  v6[3] = &unk_100880230;
  v6[4] = v4;
  BOOL v7 = a3;
  dispatch_async(dispatchQueue, v6);
  objc_sync_exit(v4);
}

- (void)_advertisingEnable:(BOOL)a3
{
  BOOL v3 = a3;
  id location = 0LL;
  objc_initWeak(&location, self);
  id v5 = (os_log_s *)qword_1008F7710;
  if (os_log_type_enabled((os_log_t)qword_1008F7710, OS_LOG_TYPE_DEFAULT))
  {
    BOOL advertisingEnabled = self->_advertisingEnabled;
    *(_DWORD *)buf = 67109376;
    int v23 = advertisingEnabled;
    __int16 v24 = 1024;
    BOOL v25 = v3;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "[BTVCLinkAdvertiser] _advertisingEnabled:%d inEnable: %d\n",  buf,  0xEu);
  }

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (self->_advertisingEnabled != v3)
  {
    self->_BOOL advertisingEnabled = v3;
    if (v3)
    {
      if (self->_payloadFields)
      {
        BOOL v7 = objc_alloc_init(&OBJC_CLASS___CURetrier);
        startRetrier = self->_startRetrier;
        self->_startRetrier = v7;

        int64_t v9 = self->_startRetrier;
        if (!v9)
        {
          uint64_t v15 = qword_1008F7710;
          if (!os_log_type_enabled((os_log_t)qword_1008F7710, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_12;
          }
          *(_DWORD *)buf = 67109120;
          int v23 = -6729;
          char v13 = "Warning: [BTVCLinkAdvertiser] ### scanEnable failed: %d\n";
          uint64_t v14 = (os_log_s *)v15;
          goto LABEL_11;
        }

        -[CURetrier setDispatchQueue:](v9, "setDispatchQueue:", self->_dispatchQueue);
        v16 = _NSConcreteStackBlock;
        uint64_t v17 = 3221225472LL;
        v18 = sub_10026BC64;
        NSErrorUserInfoKey v19 = &unk_100887098;
        objc_copyWeak(&v20, &location);
        -[CURetrier setActionHandler:](self->_startRetrier, "setActionHandler:", &v16);
        objc_destroyWeak(&v20);
        -[CURetrier startDirect](self->_startRetrier, "startDirect", v16, v17, v18, v19);
      }
    }

    else
    {
      -[CURetrier invalidateDirect](self->_startRetrier, "invalidateDirect");
      id v10 = self->_startRetrier;
      self->_startRetrier = 0LL;

      -[BTVCBonjourLink stopAdvertisingOfType:](self->_btvcBonjourLink, "stopAdvertisingOfType:", 1LL);
    }

    uint64_t v11 = qword_1008F7710;
    if (os_log_type_enabled((os_log_t)qword_1008F7710, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v12 = self->_advertisingEnabled;
      *(_DWORD *)buf = 67109120;
      int v23 = v12;
      char v13 = "[BTVCLinkAdvertiser] complete _advertisingEnabled:%d\n";
      uint64_t v14 = (os_log_s *)v11;
LABEL_11:
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, v13, buf, 8u);
    }
  }

- (void)invalidate
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10026BD94;
  block[3] = &unk_10087EA48;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_invalidate
{
  if (self->_invalidateCalled) {
    return;
  }
  BOOL v3 = (os_log_s *)qword_1008F7710;
  if (os_log_type_enabled((os_log_t)qword_1008F7710, OS_LOG_TYPE_DEBUG)) {
    sub_1006651C0(v3, v4, v5, v6, v7, v8, v9, v10);
  }
  self->_invalidateCalled = 1;
  -[CURetrier invalidateDirect](self->_startRetrier, "invalidateDirect");
  startRetrier = self->_startRetrier;
  self->_startRetrier = 0LL;

  int64_t linktType = self->_linktType;
  if (linktType == 2)
  {
    -[BTVCBonjourLink stopAdvertisingOfType:](self->_btvcBonjourLink, "stopAdvertisingOfType:", 1LL);
    btvcBonjourLink = self->_btvcBonjourLink;
    if (btvcBonjourLink)
    {
LABEL_9:
      uint64_t v14 = (void *)[BTVCLinkClient btvcLinkClient];
      [v14 removeBTVCBonjourLinkDelegate:self];

      btvcBonjourLink = self->_btvcBonjourLink;
    }
  }

  else
  {
    if (linktType != 1)
    {
      if (os_log_type_enabled((os_log_t)qword_1008F7710, OS_LOG_TYPE_ERROR)) {
        sub_100665144();
      }
      goto LABEL_13;
    }

    -[BTVCBonjourLink stopAdvertisingOfType:](self->_btvcBonjourLink, "stopAdvertisingOfType:", 0LL);
    btvcBonjourLink = self->_btvcBonjourLink;
    if (btvcBonjourLink) {
      goto LABEL_9;
    }
  }

  self->_btvcBonjourLink = 0LL;

LABEL_13:
  uint64_t v15 = (os_log_s *)qword_1008F7710;
  if (os_log_type_enabled((os_log_t)qword_1008F7710, OS_LOG_TYPE_DEBUG)) {
    sub_100665114(v15, v16, v17, v18, v19, v20, v21, v22);
  }
  id invalidationHandler = (void (**)(void))self->_invalidationHandler;
  if (invalidationHandler) {
    invalidationHandler[2]();
  }
  id advertiseStateChangedHandler = self->_advertiseStateChangedHandler;
  self->_id advertiseStateChangedHandler = 0LL;

  id v25 = self->_invalidationHandler;
  self->_id invalidationHandler = 0LL;
}

- (void)_restartIfNeeded:(BOOL)a3
{
  BOOL v3 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  uint64_t v5 = (os_log_s *)qword_1008F7710;
  if (os_log_type_enabled((os_log_t)qword_1008F7710, OS_LOG_TYPE_DEBUG)) {
    sub_10066526C(v3, v5);
  }
  if ((unint64_t)(self->_linktType - 1) > 1)
  {
    if (os_log_type_enabled((os_log_t)qword_1008F7710, OS_LOG_TYPE_ERROR)) {
      sub_1006651F0();
    }
    int v8 = -6735;
  }

  else
  {
    btvcBonjourLink = self->_btvcBonjourLink;
    if (!btvcBonjourLink || (id)-[BTVCBonjourLink state](btvcBonjourLink, "state") != (id)3) {
      return;
    }
    unsigned int v7 = -[BTVCLinkAdvertiser _preparePayload:](self, "_preparePayload:", v3);
    int v8 = v7;
    if (v7 == -6757)
    {
LABEL_14:
      -[CURetrier succeededDirect](self->_startRetrier, "succeededDirect");
      return;
    }

    if (!v7)
    {
      if (self->_payloadDataCurrent)
      {
        uint64_t v9 = (os_log_s *)qword_1008F7710;
        if (os_log_type_enabled((os_log_t)qword_1008F7710, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v10 = "no";
          payloadDataCurrent = self->_payloadDataCurrent;
          if (v3) {
            uint64_t v10 = "yes";
          }
          int v13 = 138412546;
          uint64_t v14 = payloadDataCurrent;
          __int16 v15 = 2080;
          uint64_t v16 = v10;
          _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "[BTVCLinkAdvertiser] Advertise update: data '%@', force %s\n",  (uint8_t *)&v13,  0x16u);
        }

        -[BTVCBonjourLink stopAdvertisingOfType:]( self->_btvcBonjourLink,  "stopAdvertisingOfType:",  self->_btvcBonjourLinkType);
        -[BTVCBonjourLink startAdvertisingOfType:withData:]( self->_btvcBonjourLink,  "startAdvertisingOfType:withData:",  self->_btvcBonjourLinkType,  self->_payloadDataCurrent);
        goto LABEL_14;
      }

      int v8 = -6745;
    }
  }

  BOOL v12 = (os_log_s *)qword_1008F7710;
  if (os_log_type_enabled((os_log_t)qword_1008F7710, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 67109120;
    LODWORD(v14) = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Warning: [BTVCLinkAdvertiser] ### RestartIfNeeded failed: %d\n",  (uint8_t *)&v13,  8u);
  }

- (int)_preparePayload:(BOOL)a3
{
  p_payloadDataCurrent = &self->_payloadDataCurrent;
  if (!self->_payloadDataCurrent)
  {
    int64_t linktType = self->_linktType;
    if (linktType == 2 || linktType == 1)
    {
      objc_storeStrong((id *)&self->_payloadDataCurrent, self->_payloadFields);
    }

    else
    {
      unsigned int v7 = (os_log_s *)qword_1008F7710;
      if (os_log_type_enabled((os_log_t)qword_1008F7710, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v17 = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Warning: [BTVCLinkAdvertiser] ### Skipping unsupported payload type\n",  v17,  2u);
      }
    }
  }

  if (!a3
    && self->_payloadDataPrevious
    && (-[NSArray isEqual:](*p_payloadDataCurrent, "isEqual:") & 1) != 0)
  {
    int v8 = (os_log_s *)qword_1008F7710;
    if (os_log_type_enabled((os_log_t)qword_1008F7710, OS_LOG_TYPE_DEBUG)) {
      sub_1006652F4(v8, v9, v10, v11, v12, v13, v14, v15);
    }
    return -6757;
  }

  else
  {
    objc_storeStrong((id *)&self->_payloadDataPrevious, self->_payloadDataCurrent);
    return 0;
  }

- (void)btvcBonjourLinkDidUpdateState:(id)a3
{
  uint64_t v4 = (BTVCBonjourLink *)a3;
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
    int v8 = (os_log_s *)qword_1008F7710;
    if (os_log_type_enabled((os_log_t)qword_1008F7710, OS_LOG_TYPE_INFO))
    {
      if (v7 > 5) {
        uint64_t v9 = "?";
      }
      else {
        uint64_t v9 = off_10088ACD0[v7];
      }
      int v10 = 136315138;
      uint64_t v11 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_INFO,  "[BTVCLinkAdvertiser] Bluetooth state updated: %s\n",  (uint8_t *)&v10,  0xCu);
    }

    if (v7 == 3) {
      -[BTVCLinkAdvertiser _restartIfNeeded:](self, "_restartIfNeeded:", 1LL);
    }
  }
}

- (void)btvcBonjourLink:(id)a3 didStartAdvertisingType:(int64_t)a4
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
  if (!v8 || self->_btvcBonjourLinkType != a4) {
    goto LABEL_16;
  }
  int64_t advertiseState = self->_advertiseState;
  int v10 = (os_log_s *)qword_1008F7710;
  BOOL v11 = os_log_type_enabled((os_log_t)qword_1008F7710, OS_LOG_TYPE_DEFAULT);
  if (advertiseState == 2)
  {
    if (v11)
    {
      __int16 v16 = 0;
      uint64_t v12 = "[BTVCLinkAdvertiser] Bluetooth advertising started after being deferred\n";
      uint64_t v13 = (uint8_t *)&v16;
LABEL_12:
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, v12, v13, 2u);
    }
  }

  else if (v11)
  {
    __int16 v15 = 0;
    uint64_t v12 = "[BTVCLinkAdvertiser] Bluetooth advertising started\n";
    uint64_t v13 = (uint8_t *)&v15;
    goto LABEL_12;
  }

  if (self->_advertiseState != 1)
  {
    self->_int64_t advertiseState = 1LL;
    id advertiseStateChangedHandler = (void (**)(id, uint64_t))self->_advertiseStateChangedHandler;
    if (advertiseStateChangedHandler) {
      advertiseStateChangedHandler[2](advertiseStateChangedHandler, 1LL);
    }
  }

- (void)btvcBonjourLink:(id)a3 didStopAdvertisingType:(int64_t)a4 withError:(id)a5
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
    uint64_t v12 = (os_log_s *)qword_1008F7710;
    if (os_log_type_enabled((os_log_t)qword_1008F7710, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 138412290;
      id v15 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "[BTVCLinkAdvertiser] Bluetooth advertising stopped: %@\n",  (uint8_t *)&v14,  0xCu);
    }

    if (self->_advertiseState)
    {
      self->_int64_t advertiseState = 0LL;
      id advertiseStateChangedHandler = (void (**)(id, void))self->_advertiseStateChangedHandler;
      if (advertiseStateChangedHandler) {
        advertiseStateChangedHandler[2](advertiseStateChangedHandler, 0LL);
      }
    }
  }
}

- (void)nearby:(id)a3 didDeferAdvertisingType:(int64_t)a4
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
  if (v8 && self->_btvcBonjourLinkType == a4 && self->_advertiseState != 2)
  {
    id v9 = (os_log_s *)qword_1008F7710;
    if (os_log_type_enabled((os_log_t)qword_1008F7710, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)BOOL v11 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "[BTVCLinkAdvertiser] Bluetooth advertising deferred\n",  v11,  2u);
    }

    self->_int64_t advertiseState = 2LL;
    id advertiseStateChangedHandler = (void (**)(id, uint64_t))self->_advertiseStateChangedHandler;
    if (advertiseStateChangedHandler) {
      advertiseStateChangedHandler[2](advertiseStateChangedHandler, 2LL);
    }
  }
}

- (void)nearby:(id)a3 didFailToStartAdvertisingOfType:(int64_t)a4 withError:(id)a5
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
    uint64_t v12 = (os_log_s *)qword_1008F7710;
    if (os_log_type_enabled((os_log_t)qword_1008F7710, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 138412290;
      id v15 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "[BTVCLinkAdvertiser] ### Bluetooth advertise failed: %@\n",  (uint8_t *)&v14,  0xCu);
    }

    -[CURetrier failedDirect](self->_startRetrier, "failedDirect");
    if (self->_advertiseState != 3)
    {
      self->_int64_t advertiseState = 3LL;
      id advertiseStateChangedHandler = (void (**)(id, uint64_t))self->_advertiseStateChangedHandler;
      if (advertiseStateChangedHandler) {
        advertiseStateChangedHandler[2](advertiseStateChangedHandler, 3LL);
      }
    }
  }
}

- (void)btvcBonjourLink:(id)a3 didConnectToPeer:(id)a4 error:(id)a5
{
  BOOL v8 = (BTVCBonjourLink *)a3;
  id v9 = a4;
  id v10 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  btvcBonjourLink = self->_btvcBonjourLink;
  if (btvcBonjourLink && btvcBonjourLink == v8)
  {
    uint64_t v12 = (os_log_s *)qword_1008F7710;
    if (os_log_type_enabled((os_log_t)qword_1008F7710, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 138412546;
      id v15 = v9;
      __int16 v16 = 2112;
      id v17 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "[BTVCLinkAdvertiser] DidConnectToPeer: %@, %@\n",  (uint8_t *)&v14,  0x16u);
    }

    if (v10)
    {
      uint64_t v13 = (os_log_s *)qword_1008F7710;
      if (os_log_type_enabled((os_log_t)qword_1008F7710, OS_LOG_TYPE_DEFAULT))
      {
        int v14 = 138412546;
        id v15 = v9;
        __int16 v16 = 2112;
        id v17 = v10;
        _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "[BTVCLinkAdvertiser] ### Accept connection from peer %@ failed: %@\n",  (uint8_t *)&v14,  0x16u);
      }
    }
  }
}

- (id)advertiseStateChangedHandler
{
  return self->_advertiseStateChangedHandler;
}

- (void)setAdvertiseStateChangedHandler:(id)a3
{
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
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

  ;
}

@end
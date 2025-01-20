@interface BTShareAudioService
- (BTShareAudioService)init;
- (OS_dispatch_queue)dispatchQueue;
- (SDStatusMonitor)statusMonitor;
- (SFSession)sfSession;
- (id)configRequestHandler;
- (id)connectRequestHandler;
- (void)_handleSessionEnded:(id)a3 error:(id)a4;
- (void)_handleSessionStarted:(id)a3;
- (void)_handleShareAudioPairingCompleted:(id)a3 error:(id)a4;
- (void)_handleShareAudioRequest:(id)a3 responseHandler:(id)a4;
- (void)_handleShareAudioSearchTimeout;
- (void)_invalidate;
- (void)_sfServiceStart;
- (void)activate;
- (void)invalidate;
- (void)setConfigRequestHandler:(id)a3;
- (void)setConnectRequestHandler:(id)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setSfSession:(id)a3;
- (void)setStatusMonitor:(id)a3;
@end

@implementation BTShareAudioService

- (BTShareAudioService)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___BTShareAudioService;
  v2 = -[BTShareAudioService init](&v6, "init");
  v3 = v2;
  if (v2)
  {
    objc_storeStrong((id *)&v2->_dispatchQueue, &_dispatch_main_q);
    v4 = v3;
  }

  return v3;
}

- (void)activate
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10004EB88;
  block[3] = &unk_100206058;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)invalidate
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10004EC50;
  block[3] = &unk_100206058;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_invalidate
{
  if (!self->_invalidateDone)
  {
    self->_invalidateDone = 1;
    -[BTShareAudioService _handleSessionEnded:error:](self, "_handleSessionEnded:error:", self->_sfSession, 0LL);
    id configRequestHandler = self->_configRequestHandler;
    self->_id configRequestHandler = 0LL;

    id connectRequestHandler = self->_connectRequestHandler;
    self->_id connectRequestHandler = 0LL;

    -[SFService invalidate](self->_sfService, "invalidate");
    sfService = self->_sfService;
    self->_sfService = 0LL;

    if (dword_100234478 <= 30
      && (dword_100234478 != -1 || _LogCategory_Initialize(&dword_100234478, 30LL)))
    {
      LogPrintF(&dword_100234478, "-[BTShareAudioService _invalidate]", 30LL, "Invalidated\n");
    }
  }

- (void)_sfServiceStart
{
  v3 = objc_alloc_init(&OBJC_CLASS___SFService);
  sfService = self->_sfService;
  self->_sfService = v3;
  v5 = v3;

  -[SFService setDispatchQueue:](v5, "setDispatchQueue:", self->_dispatchQueue);
  -[SFService setFixedPIN:](v5, "setFixedPIN:", @"public");
  -[SFService setIdentifier:](v5, "setIdentifier:", @"com.apple.sharing.ShareAudio");
  -[SFService setLabel:](v5, "setLabel:", @"ShareAudio");
  -[SFService setSessionFlags:](v5, "setSessionFlags:", 2305LL);
  -[SFService setServiceType:](v5, "setServiceType:", 21LL);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_10004EF34;
  v8[3] = &unk_100207BF0;
  v8[4] = v5;
  v8[5] = self;
  -[SFService setSessionStartedHandler:](v5, "setSessionStartedHandler:", v8);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10004EF50;
  v7[3] = &unk_100207C18;
  v7[4] = v5;
  v7[5] = self;
  -[SFService setSessionEndedHandler:](v5, "setSessionEndedHandler:", v7);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_10004EF70;
  v6[3] = &unk_100206380;
  v6[4] = v5;
  v6[5] = self;
  -[SFService activateWithCompletion:](v5, "activateWithCompletion:", v6);
}

- (void)_handleSessionStarted:(id)a3
{
  id v5 = a3;
  sfSession = self->_sfSession;
  if (sfSession)
  {
    if (dword_100234478 <= 60)
    {
      if (dword_100234478 == -1)
      {
        sfSession = self->_sfSession;
      }

      v8 = (void *)objc_claimAutoreleasedReturnValue(-[SFSession peer](sfSession, "peer"));
      v9 = (void *)objc_claimAutoreleasedReturnValue([v5 peer]);
      LogPrintF( &dword_100234478,  "-[BTShareAudioService _handleSessionStarted:]",  60LL,  "### Ignoring session when already active: existing peer %@, new peer %@\n",  v8,  v9);
    }
  }

  else
  {
    if (dword_100234478 <= 30
      && (dword_100234478 != -1 || _LogCategory_Initialize(&dword_100234478, 30LL)))
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue([v5 peer]);
      LogPrintF(&dword_100234478, "-[BTShareAudioService _handleSessionStarted:]", 30LL, "Session start: peer %@\n", v7);
    }

    [v5 setStatusMonitor:self->_statusMonitor];
    objc_storeStrong((id *)&self->_sfSession, a3);
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_10004F284;
    v12[3] = &unk_100207C40;
    v12[4] = self;
    [v5 registerRequestID:@"_shAu" options:&off_100218D50 handler:v12];
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_10004F28C;
    v11[3] = &unk_100207C40;
    v11[4] = self;
    [v5 registerRequestID:@"_shCf" options:&off_100218D78 handler:v11];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_10004F39C;
    v10[3] = &unk_100207C40;
    v10[4] = self;
    [v5 registerRequestID:@"_shCn" options:&off_100218DA0 handler:v10];
  }

- (void)_handleSessionEnded:(id)a3 error:(id)a4
{
  v19 = (SFSession *)a3;
  id v6 = a4;
  if (self->_sfSession == v19)
  {
    if (v19)
    {
      sfSession = v19;
      if (dword_100234478 <= 30)
      {
        sfSession = v19;
        if (dword_100234478 != -1
          || (int v17 = _LogCategory_Initialize(&dword_100234478, 30LL), sfSession = self->_sfSession, v17))
        {
          v8 = (void *)objc_claimAutoreleasedReturnValue(-[SFSession peer](sfSession, "peer"));
          LogPrintF( &dword_100234478,  "-[BTShareAudioService _handleSessionEnded:error:]",  30LL,  "Session end: peer %@, %{error}\n",  v8,  v6);

          sfSession = self->_sfSession;
        }
      }
    }

    else
    {
      sfSession = 0LL;
    }

    self->_sfSession = 0LL;

    -[SFBluetoothPairingSession invalidate](self->_pairingSession, "invalidate");
    pairingSession = self->_pairingSession;
    self->_pairingSession = 0LL;

    searchTimer = self->_searchTimer;
    if (searchTimer)
    {
      v11 = searchTimer;
      dispatch_source_cancel(v11);
      v12 = self->_searchTimer;
      self->_searchTimer = 0LL;
    }

    -[CUBluetoothClient invalidate](self->_searchBTClient, "invalidate");
    searchBTClient = self->_searchBTClient;
    self->_searchBTClient = 0LL;

    id v14 = objc_retainBlock(self->_responseHandler);
    if (v14)
    {
      uint64_t v15 = NSErrorF(NSOSStatusErrorDomain, 4294960544LL, "Session ended");
      v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
      if (dword_100234478 < 91
        && (dword_100234478 != -1 || _LogCategory_Initialize(&dword_100234478, 90LL)))
      {
        LogPrintF( &dword_100234478,  "-[BTShareAudioService _handleSessionEnded:error:]",  90LL,  "### ShareAudio request aborted: %{error}\n",  v16);
      }

      (*((void (**)(id, void *, void, void))v14 + 2))(v14, v16, 0LL, 0LL);
      id responseHandler = self->_responseHandler;
      self->_id responseHandler = 0LL;
    }
  }
}

- (void)_handleShareAudioRequest:(id)a3 responseHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (dword_100234478 <= 30 && (dword_100234478 != -1 || _LogCategory_Initialize(&dword_100234478, 30LL))) {
    LogPrintF( &dword_100234478,  "-[BTShareAudioService _handleShareAudioRequest:responseHandler:]",  30LL,  "ShareAudio request received: %##.16@\n",  v6);
  }
  uint64_t v24 = 0LL;
  v25 = &v24;
  uint64_t v26 = 0x3032000000LL;
  v27 = sub_10004F8C8;
  v28 = sub_10004F8D8;
  id v29 = 0LL;
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472LL;
  v21[2] = sub_10004F8E0;
  v21[3] = &unk_100206810;
  v23 = &v24;
  id v8 = v7;
  id v22 = v8;
  v9 = objc_retainBlock(v21);
  if (self->_responseHandler)
  {
    uint64_t v15 = NSErrorF(NSOSStatusErrorDomain, 4294960575LL, "Requesting");
    uint64_t v16 = objc_claimAutoreleasedReturnValue(v15);
    int v17 = (void *)v25[5];
    v25[5] = v16;
  }

  else
  {
    CFTypeID TypeID = CFStringGetTypeID();
    uint64_t TypedValue = CFDictionaryGetTypedValue(v6, @"btAd", TypeID, &v20);
    v12 = (void *)objc_claimAutoreleasedReturnValue(TypedValue);
    if (v12)
    {
      objc_storeStrong((id *)&self->_guestDeviceAddress, v12);
      id v13 = objc_retainBlock(v8);
      id responseHandler = self->_responseHandler;
      self->_id responseHandler = v13;
    }

    else
    {
      uint64_t v18 = NSErrorF(NSOSStatusErrorDomain, v20, "No BT addr");
      uint64_t v19 = objc_claimAutoreleasedReturnValue(v18);
      id responseHandler = (id)v25[5];
      v25[5] = v19;
    }
  }

  ((void (*)(void *))v9[2])(v9);

  _Block_object_dispose(&v24, 8);
}

- (void)_handleShareAudioPairingCompleted:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  -[SFBluetoothPairingSession invalidate](self->_pairingSession, "invalidate");
  pairingSession = self->_pairingSession;
  self->_pairingSession = 0LL;

  id v9 = objc_retainBlock(self->_responseHandler);
  if (v9)
  {
    id responseHandler = self->_responseHandler;
    self->_id responseHandler = 0LL;

    if (v7)
    {
      if (dword_100234478 <= 90
        && (dword_100234478 != -1 || _LogCategory_Initialize(&dword_100234478, 90LL)))
      {
        LogPrintF( &dword_100234478,  "-[BTShareAudioService _handleShareAudioPairingCompleted:error:]",  90LL,  "### Configure device failed: %{error}\n",  v7);
      }

      (*((void (**)(id, id, void, void))v9 + 2))(v9, v7, 0LL, 0LL);
    }

    else
    {
      v11 = self->_sfSession;
      if (v11)
      {
        v12 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
        id v13 = [v6 colorCode];
        if ((_DWORD)v13)
        {
          id v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v13));
          -[NSMutableDictionary setObject:forKeyedSubscript:]( v12,  "setObject:forKeyedSubscript:",  v14,  @"colorCode");
        }

        id v15 = [v6 productIdentifier];
        if ((_DWORD)v15)
        {
          uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v15));
          -[NSMutableDictionary setObject:forKeyedSubscript:]( v12,  "setObject:forKeyedSubscript:",  v16,  @"productID");
        }

        dispatchQueue = self->_dispatchQueue;
        v20[0] = _NSConcreteStackBlock;
        v20[1] = 3221225472LL;
        v20[2] = sub_10004FC14;
        v20[3] = &unk_100207C68;
        v20[4] = v11;
        v20[5] = self;
        v20[6] = v12;
        v20[7] = v9;
        -[SFSession appleIDAddProof:dispatchQueue:completion:]( v11,  "appleIDAddProof:dispatchQueue:completion:",  v12,  dispatchQueue,  v20);
      }

      else
      {
        uint64_t v18 = SFErrorF(4294960596LL, "No session");
        uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
        if (dword_100234478 <= 90
          && (dword_100234478 != -1 || _LogCategory_Initialize(&dword_100234478, 90LL)))
        {
          LogPrintF( &dword_100234478,  "-[BTShareAudioService _handleShareAudioPairingCompleted:error:]",  90LL,  "### Configure device failed: %{error}\n",  v19);
        }

        (*((void (**)(id, void *, void, void))v9 + 2))(v9, v19, 0LL, 0LL);
      }
    }
  }
}

- (void)_handleShareAudioSearchTimeout
{
  if (dword_100234478 <= 90 && (dword_100234478 != -1 || _LogCategory_Initialize(&dword_100234478, 90LL))) {
    LogPrintF( &dword_100234478,  "-[BTShareAudioService _handleShareAudioSearchTimeout]",  90LL,  "### Connected device search timeout\n");
  }
  searchTimer = self->_searchTimer;
  if (searchTimer)
  {
    v4 = searchTimer;
    dispatch_source_cancel(v4);
    id v5 = self->_searchTimer;
    self->_searchTimer = 0LL;
  }

  -[CUBluetoothClient invalidate](self->_searchBTClient, "invalidate");
  searchBTClient = self->_searchBTClient;
  self->_searchBTClient = 0LL;

  id v7 = objc_retainBlock(self->_responseHandler);
  if (v7)
  {
    id responseHandler = self->_responseHandler;
    self->_id responseHandler = 0LL;
    id v11 = v7;

    uint64_t v9 = NSErrorF(NSOSStatusErrorDomain, 4294960569LL, "No connected device found");
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    (*((void (**)(id, void *, void, void))v11 + 2))(v11, v10, 0LL, 0LL);

    id v7 = v11;
  }
}

- (id)configRequestHandler
{
  return self->_configRequestHandler;
}

- (void)setConfigRequestHandler:(id)a3
{
}

- (id)connectRequestHandler
{
  return self->_connectRequestHandler;
}

- (void)setConnectRequestHandler:(id)a3
{
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
}

- (SFSession)sfSession
{
  return self->_sfSession;
}

- (void)setSfSession:(id)a3
{
}

- (SDStatusMonitor)statusMonitor
{
  return self->_statusMonitor;
}

- (void)setStatusMonitor:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
@interface RPSiriDaemon
- (BOOL)activateAndReturnError:(id *)a3;
- (RPMessageable)messenger;
- (RPSiriDaemon)init;
- (void)_handleSiriAudio:(id)a3;
- (void)_handleSiriStart:(id)a3 options:(id)a4 responseHandler:(id)a5;
- (void)_handleSiriStartWhileRecording:(id)a3 options:(id)a4 responseHandler:(id)a5;
- (void)_handleSiriStop:(id)a3 options:(id)a4 responseHandler:(id)a5;
- (void)invalidate;
- (void)setMessenger:(id)a3;
- (void)siriAudioSessionDidReceiveStopRecordingWithDeviceId:(id)a3;
@end

@implementation RPSiriDaemon

- (RPSiriDaemon)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___RPSiriDaemon;
  v2 = -[RPSiriDaemon init](&v6, "init");
  v3 = v2;
  if (v2)
  {
    objc_storeStrong((id *)&v2->_dispatchQueue, &_dispatch_main_q);
    v4 = v3;
  }

  return v3;
}

- (BOOL)activateAndReturnError:(id *)a3
{
  v5 = (OS_dispatch_queue *)objc_claimAutoreleasedReturnValue(-[RPMessageable dispatchQueue](self->_messenger, "dispatchQueue"));
  dispatchQueue = v5;
  if (!v5) {
    dispatchQueue = self->_dispatchQueue;
  }
  objc_storeStrong((id *)&self->_dispatchQueue, dispatchQueue);

  v13 = self->_messenger;
  if (v13)
  {
    if (dword_100132E50 <= 30
      && (dword_100132E50 != -1 || _LogCategory_Initialize(&dword_100132E50, 30LL)))
    {
      LogPrintF(&dword_100132E50, "-[RPSiriDaemon activateAndReturnError:]", 30LL, "Activate\n");
    }

    v23 = @"statusFlags";
    v24 = &off_10011B0D8;
    v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v24,  &v23,  1LL));
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472LL;
    v22[2] = sub_1000ABC34;
    v22[3] = &unk_100112B38;
    v22[4] = self;
    -[RPMessageable registerEventID:options:handler:](v13, "registerEventID:options:handler:", @"_siA", v16, v22);
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472LL;
    v21[2] = sub_1000ABC40;
    v21[3] = &unk_100111BE8;
    v21[4] = self;
    -[RPMessageable registerRequestID:options:handler:]( v13,  "registerRequestID:options:handler:",  @"_siriStart",  v16,  v21);
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472LL;
    v20[2] = sub_1000ABCE4;
    v20[3] = &unk_100111BE8;
    v20[4] = self;
    -[RPMessageable registerRequestID:options:handler:]( v13,  "registerRequestID:options:handler:",  @"_siriStop",  v16,  v20);
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472LL;
    v19[2] = sub_1000ABCF8;
    v19[3] = &unk_100111BE8;
    v19[4] = self;
    -[RPMessageable registerRequestID:options:handler:]( v13,  "registerRequestID:options:handler:",  @"_siriStartWhileRecording",  v16,  v19);
  }

  else
  {
    id v14 = RPErrorF(4294960591LL, (uint64_t)"No messenger provided", v7, v8, v9, v10, v11, v12, v18);
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    if (dword_100132E50 <= 90
      && (dword_100132E50 != -1 || _LogCategory_Initialize(&dword_100132E50, 90LL)))
    {
      LogPrintF( &dword_100132E50,  "-[RPSiriDaemon activateAndReturnError:]",  90LL,  "### Activate failed: %{error}\n",  v15);
    }

    if (a3) {
      *a3 = v15;
    }
  }

  return v13 != 0LL;
}

- (void)invalidate
{
  siriAudioSession = self->_siriAudioSession;
  self->_siriAudioSession = 0LL;

  siriContext = self->_siriContext;
  self->_siriContext = 0LL;

  siriProxy = self->_siriProxy;
  self->_siriProxy = 0LL;

  -[RPMessageable deregisterEventID:](self->_messenger, "deregisterEventID:", @"_siA");
  -[RPMessageable deregisterRequestID:](self->_messenger, "deregisterRequestID:", @"_siriStart");
  -[RPMessageable deregisterRequestID:](self->_messenger, "deregisterRequestID:", @"_siriStop");
  messenger = self->_messenger;
  self->_messenger = 0LL;
}

- (void)_handleSiriAudio:(id)a3
{
  id v4 = a3;
  siriAudioSession = self->_siriAudioSession;
  if (siriAudioSession)
  {
    id v7 = v4;
    -[RPSiriAudioSession receivedSiriAudioEvent:](siriAudioSession, "receivedSiriAudioEvent:");
LABEL_3:
    id v4 = v7;
    goto LABEL_8;
  }

  if (dword_100132E50 <= 60)
  {
    id v7 = v4;
    if (dword_100132E50 != -1 || (int v6 = _LogCategory_Initialize(&dword_100132E50, 60LL), v4 = v7, v6))
    {
      LogPrintF( &dword_100132E50,  "-[RPSiriDaemon _handleSiriAudio:]",  60LL,  "### Ignoring Siri audio message without audio session\n");
      goto LABEL_3;
    }
  }

- (void)_handleSiriStart:(id)a3 options:(id)a4 responseHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (dword_100132E50 <= 30 && (dword_100132E50 != -1 || _LogCategory_Initialize(&dword_100132E50, 30LL))) {
    LogPrintF( &dword_100132E50,  "-[RPSiriDaemon _handleSiriStart:options:responseHandler:]",  30LL,  "SiriStart: %##.32@\n",  v8);
  }
  int v11 = _os_feature_enabled_impl("Siri", "tv_push_to_talk");
  BOOL v12 = 0LL;
  if (v9 && v11)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKey:@"_pttEligible"]);
    BOOL v12 = [v13 intValue] != 0;
  }

  siriAudioSession = self->_siriAudioSession;
  if (siriAudioSession)
  {
    if (dword_100132E50 <= 30)
    {
      if (dword_100132E50 != -1
        || (int v15 = _LogCategory_Initialize(&dword_100132E50, 30LL), siriAudioSession = self->_siriAudioSession, v15))
      {
        LogPrintF( &dword_100132E50,  "-[RPSiriDaemon _handleSiriStart:options:responseHandler:]",  30LL,  "Invalidating previous Siri audio session: %@\n",  siriAudioSession);
        siriAudioSession = self->_siriAudioSession;
      }
    }

    -[RPSiriAudioSession invalidate](siriAudioSession, "invalidate");
    v16 = self->_siriAudioSession;
    self->_siriAudioSession = 0LL;
  }

  v17 = self->_siriProxy;
  if (v17) {
    goto LABEL_17;
  }
  id v18 = -[objc_class sharedConnection](off_100132EC0(), "sharedConnection");
  v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
  v17 = (PBSMediaRemoteServiceInterface *)objc_claimAutoreleasedReturnValue([v19 mediaRemoteServiceProxy]);

  if (v17)
  {
    objc_storeStrong((id *)&self->_siriProxy, v17);
LABEL_17:
    v26 = self->_siriContext;
    if (!v26)
    {
      v26 = (PBSMediaRemoteSiriContext *)objc_alloc_init(off_100132EC8());
      uint32_t v27 = arc4random();
      uint64_t v28 = NSPrintF("%u", v27);
      v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
      -[PBSMediaRemoteSiriContext setDeviceID:](v26, "setDeviceID:", v29);

      objc_storeStrong((id *)&self->_siriContext, v26);
    }

    if ((objc_opt_respondsToSelector(v26, "isSourcePTTEligible") & 1) != 0) {
      -[PBSMediaRemoteSiriContext setIsSourcePTTEligible:](v26, "setIsSourcePTTEligible:", v12);
    }
    dispatch_time_t v30 = dispatch_time(0LL, 250000000LL);
    dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000AC280;
    block[3] = &unk_100111708;
    block[4] = self;
    v32 = v17;
    v47 = v32;
    v33 = v26;
    v48 = v33;
    dispatch_after(v30, dispatchQueue, block);
    v34 = self->_siriAudioSession;
    if (!v34)
    {
      v35 = objc_alloc_init(&OBJC_CLASS___RPSiriAudioSession);
      v36 = self->_siriAudioSession;
      self->_siriAudioSession = v35;

      v34 = self->_siriAudioSession;
    }

    -[RPSiriAudioSession setDelegate:](v34, "setDelegate:", self);
    -[RPSiriAudioSession setDispatchQueue:](self->_siriAudioSession, "setDispatchQueue:", self->_dispatchQueue);
    v37 = (void *)objc_claimAutoreleasedReturnValue(-[PBSMediaRemoteSiriContext deviceID](v33, "deviceID"));
    -[RPSiriAudioSession setSessionID:](self->_siriAudioSession, "setSessionID:", v37);

    v38 = self->_siriAudioSession;
    v43[0] = _NSConcreteStackBlock;
    v43[1] = 3221225472LL;
    v43[2] = sub_1000AC3A0;
    v43[3] = &unk_100111EB8;
    v44 = v33;
    id v45 = v10;
    v39 = v33;
    -[RPSiriAudioSession activateWithCompletion:](v38, "activateWithCompletion:", v43);

    goto LABEL_24;
  }

  id v40 = RPErrorF(4294960596LL, (uint64_t)"Get PBS Siri Proxy Failed", v20, v21, v22, v23, v24, v25, v42);
  v41 = (void *)objc_claimAutoreleasedReturnValue(v40);
  if (dword_100132E50 <= 90 && (dword_100132E50 != -1 || _LogCategory_Initialize(&dword_100132E50, 90LL))) {
    LogPrintF( &dword_100132E50,  "-[RPSiriDaemon _handleSiriStart:options:responseHandler:]",  90LL,  "### SiriStart failed: %{error}\n",  v41);
  }
  (*((void (**)(id, void, void, void *))v10 + 2))(v10, 0LL, 0LL, v41);

LABEL_24:
}

- (void)_handleSiriStop:(id)a3 options:(id)a4 responseHandler:(id)a5
{
  id v17 = a3;
  id v8 = a4;
  id v9 = a5;
  if (dword_100132E50 <= 30 && (dword_100132E50 != -1 || _LogCategory_Initialize(&dword_100132E50, 30LL))) {
    LogPrintF( &dword_100132E50,  "-[RPSiriDaemon _handleSiriStop:options:responseHandler:]",  30LL,  "SiriStop: %##.32@\n",  v17);
  }
  int v10 = _os_feature_enabled_impl("Siri", "tv_push_to_talk");
  BOOL v11 = 0LL;
  if (v8 && v10)
  {
    BOOL v12 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:@"_pttEligible"]);
    BOOL v11 = [v12 intValue] != 0;
  }

  v13 = self->_siriProxy;
  siriProxy = self->_siriProxy;
  self->_siriProxy = 0LL;

  int v15 = self->_siriContext;
  siriContext = self->_siriContext;
  self->_siriContext = 0LL;

  if (v13 && v15 && self->_siriStarted)
  {
    if ((objc_opt_respondsToSelector(v15, "isSourcePTTEligible") & 1) != 0) {
      -[PBSMediaRemoteSiriContext setIsSourcePTTEligible:](v15, "setIsSourcePTTEligible:", v11);
    }
    -[PBSMediaRemoteServiceInterface stopSiriWithContext:](v13, "stopSiriWithContext:", v15);
    if (dword_100132E50 <= 30
      && (dword_100132E50 != -1 || _LogCategory_Initialize(&dword_100132E50, 30LL)))
    {
      LogPrintF(&dword_100132E50, "-[RPSiriDaemon _handleSiriStop:options:responseHandler:]", 30LL, "SiriStopped\n");
    }

    self->_siriStarted = 0;
  }

  (*((void (**)(id, void *, void, void))v9 + 2))(v9, &__NSDictionary0__struct, 0LL, 0LL);
}

- (void)_handleSiriStartWhileRecording:(id)a3 options:(id)a4 responseHandler:(id)a5
{
  id v30 = a3;
  id v8 = a4;
  id v9 = a5;
  if (dword_100132E50 <= 30 && (dword_100132E50 != -1 || _LogCategory_Initialize(&dword_100132E50, 30LL))) {
    LogPrintF( &dword_100132E50,  "-[RPSiriDaemon _handleSiriStartWhileRecording:options:responseHandler:]",  30LL,  "SiriStartWhileRecording: %##.32@\n",  v30);
  }
  int v10 = _os_feature_enabled_impl("Siri", "tv_push_to_talk");
  BOOL v11 = 0LL;
  if (v8 && v10)
  {
    BOOL v12 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:@"_pttEligible"]);
    BOOL v11 = [v12 intValue] != 0;
  }

  v13 = self->_siriProxy;
  if (v13) {
    goto LABEL_11;
  }
  id v14 = -[objc_class sharedConnection](off_100132EC0(), "sharedConnection");
  int v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  v13 = (PBSMediaRemoteServiceInterface *)objc_claimAutoreleasedReturnValue([v15 mediaRemoteServiceProxy]);

  if (v13)
  {
    objc_storeStrong((id *)&self->_siriProxy, v13);
LABEL_11:
    siriContext = self->_siriContext;
    p_siriContext = &self->_siriContext;
    uint64_t v24 = siriContext;
    if (!v24)
    {
      uint64_t v24 = (PBSMediaRemoteSiriContext *)objc_alloc_init(off_100132EC8());
      uint32_t v25 = arc4random();
      uint64_t v26 = NSPrintF("%u", v25);
      uint32_t v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
      -[PBSMediaRemoteSiriContext setDeviceID:](v24, "setDeviceID:", v27);

      if ((objc_opt_respondsToSelector(v24, "isListening") & 1) != 0) {
        -[PBSMediaRemoteSiriContext setIsListening:](v24, "setIsListening:", 1LL);
      }
      if ((objc_opt_respondsToSelector(v24, "isSourcePTTEligible") & 1) != 0) {
        -[PBSMediaRemoteSiriContext setIsSourcePTTEligible:](v24, "setIsSourcePTTEligible:", v11);
      }
      objc_storeStrong((id *)p_siriContext, v24);
    }

    -[PBSMediaRemoteServiceInterface startSiriWithContext:](v13, "startSiriWithContext:", v24);

    goto LABEL_18;
  }

  id v28 = RPErrorF(4294960596LL, (uint64_t)"Get PBS Siri Proxy Failed", v16, v17, v18, v19, v20, v21, v29);
  v13 = (PBSMediaRemoteServiceInterface *)objc_claimAutoreleasedReturnValue(v28);
  if (dword_100132E50 <= 90 && (dword_100132E50 != -1 || _LogCategory_Initialize(&dword_100132E50, 90LL))) {
    LogPrintF( &dword_100132E50,  "-[RPSiriDaemon _handleSiriStartWhileRecording:options:responseHandler:]",  90LL,  "### SiriStart failed: %{error}\n",  v13);
  }
  (*((void (**)(id, void, void, PBSMediaRemoteServiceInterface *))v9 + 2))(v9, 0LL, 0LL, v13);
LABEL_18:
}

- (void)siriAudioSessionDidReceiveStopRecordingWithDeviceId:(id)a3
{
  if (_os_feature_enabled_impl("Siri", "tv_push_to_talk"))
  {
    if (dword_100132E50 <= 30
      && (dword_100132E50 != -1 || _LogCategory_Initialize(&dword_100132E50, 30LL)))
    {
      LogPrintF( &dword_100132E50,  "-[RPSiriDaemon siriAudioSessionDidReceiveStopRecordingWithDeviceId:]",  30LL,  "#ptt Daemon Recieved Stop recording Sending to - %@",  self->_siriSenderIDS);
    }

    if (-[NSString length](self->_siriSenderIDS, "length")) {
      -[RPMessageable sendRequestID:request:destinationID:options:responseHandler:]( self->_messenger,  "sendRequestID:request:destinationID:options:responseHandler:",  @"_siriEndpoint",  &__NSDictionary0__struct,  self->_siriSenderIDS,  0LL,  &stru_100114F10);
    }
  }

  id v4 = self->_siriAudioSession;
  siriAudioSession = self->_siriAudioSession;
  self->_siriAudioSession = 0LL;

  if (v4)
  {
    dispatch_time_t v6 = dispatch_time(0LL, 5000000000LL);
    dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000ACB18;
    block[3] = &unk_1001110A8;
    block[4] = v4;
    dispatch_after(v6, dispatchQueue, block);
  }

  self->_siriStarted = 0;
}

- (RPMessageable)messenger
{
  return self->_messenger;
}

- (void)setMessenger:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
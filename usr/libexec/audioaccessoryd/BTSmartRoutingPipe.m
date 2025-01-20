@interface BTSmartRoutingPipe
- (BOOL)_isPipeCleared;
- (BTSmartRoutingPipe)init;
- (void)_activateWithDispatch:(id)a3;
- (void)_invalidate;
- (void)_pipeCleanup;
- (void)_pipeConnectionComplete:(id)a3 andWxHeadset:(id)a4 isSender:(BOOL)a5;
- (void)_pipeDone;
- (void)_pipeEnsureStarted;
- (void)_pipeEnsureStopped;
- (void)_pipeReceivedRouteRequest:(id)a3 options:(id)a4 responseHandler:(id)a5;
- (void)_pipeRequestCompleted:(id)a3 error:(id)a4;
- (void)_pipeRequestResponse:(id)a3 error:(id)a4;
- (void)_pipeSendRouteRequestToSFDevice:(id)a3 andWxHeadset:(id)a4 newPipe:(BOOL)a5 connectionResult:(id)a6 completion:(id)a7;
- (void)_runPipeStates;
@end

@implementation BTSmartRoutingPipe

- (BTSmartRoutingPipe)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___BTSmartRoutingPipe;
  v2 = -[BTSmartRoutingPipe init](&v6, "init");
  v3 = v2;
  if (v2) {
    v4 = v2;
  }

  return v3;
}

- (void)_activateWithDispatch:(id)a3
{
}

- (void)_invalidate
{
  self->_invalidateCalled = 1;
  -[BTSmartRoutingPipe _pipeCleanup](self, "_pipeCleanup");
}

- (BOOL)_isPipeCleared
{
  return self->_client == 0LL;
}

- (void)_runPipeStates
{
  if (!self->_invalidateCalled)
  {
    int state = self->_state;
    switch(state)
    {
      case 12:
        if (dword_100234408 <= 90
          && (dword_100234408 != -1 || _LogCategory_Initialize(&dword_100234408, 90LL)))
        {
          LogPrintF( &dword_100234408,  "-[BTSmartRoutingPipe _runPipeStates]",  90LL,  "### Pipe error: %{error}",  self->_inError);
        }

        -[BTSmartRoutingPipe _pipeCleanup](self, "_pipeCleanup");
        break;
      case 11:
        if (dword_100234408 <= 30
          && (dword_100234408 != -1 || _LogCategory_Initialize(&dword_100234408, 30LL)))
        {
          LogPrintF(&dword_100234408, "-[BTSmartRoutingPipe _runPipeStates]", 30LL, "Pipe done");
        }

        -[BTSmartRoutingPipe _pipeDone](self, "_pipeDone");
        break;
      case 10:
        self->_int state = 11;
        break;
    }

    if (dword_100234408 <= 30
      && (dword_100234408 != -1 || _LogCategory_Initialize(&dword_100234408, 30LL)))
    {
      if (state > 10)
      {
        if (state == 11)
        {
          v4 = "BTSmartRoutingPipeDone";
          goto LABEL_30;
        }

        if (state == 12)
        {
          v4 = "BTSmartRoutingPipeError";
          goto LABEL_30;
        }
      }

      else
      {
        if (!state)
        {
          v4 = "Init";
          goto LABEL_30;
        }

        if (state == 10)
        {
          v4 = "BTSmartRoutingPipeRequest";
          goto LABEL_30;
        }
      }

      v4 = "?";
LABEL_30:
      int v5 = self->_state;
      if (v5 > 10)
      {
        if (v5 == 11)
        {
          objc_super v6 = "BTSmartRoutingPipeDone";
          goto LABEL_40;
        }

        if (v5 == 12)
        {
          objc_super v6 = "BTSmartRoutingPipeError";
          goto LABEL_40;
        }
      }

      else
      {
        if (!v5)
        {
          objc_super v6 = "Init";
          goto LABEL_40;
        }

        if (v5 == 10)
        {
          objc_super v6 = "BTSmartRoutingPipeRequest";
LABEL_40:
          LogPrintF(&dword_100234408, "-[BTSmartRoutingPipe _runPipeStates]", 30LL, "State: %s -> %s", v4, v6);
          return;
        }
      }

      objc_super v6 = "?";
      goto LABEL_40;
    }
  }

- (void)_pipeEnsureStarted
{
  p_pipeResponder = &self->_pipeResponder;
  v4 = self->_pipeResponder;
  if (!v4)
  {
    if (dword_100234408 <= 30
      && (dword_100234408 != -1 || _LogCategory_Initialize(&dword_100234408, 30LL)))
    {
      LogPrintF(&dword_100234408, "-[BTSmartRoutingPipe _pipeEnsureStarted]", 30LL, "Route request register");
    }

    v4 = objc_alloc_init(&OBJC_CLASS___RPCompanionLinkClient);
    objc_storeStrong((id *)p_pipeResponder, v4);
    -[RPCompanionLinkClient setControlFlags:]( v4,  "setControlFlags:",  (unint64_t)-[RPCompanionLinkClient controlFlags](v4, "controlFlags") | 2);
    -[RPCompanionLinkClient setDispatchQueue:](v4, "setDispatchQueue:", self->_dispatchQueue);
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472LL;
    v6[2] = sub_10004C168;
    v6[3] = &unk_100206080;
    v6[4] = self;
    -[RPCompanionLinkClient activateWithCompletion:](v4, "activateWithCompletion:", v6);
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472LL;
    v5[2] = sub_10004C210;
    v5[3] = &unk_100207520;
    v5[4] = self;
    -[RPCompanionLinkClient registerRequestID:options:handler:]( v4,  "registerRequestID:options:handler:",  @"com.apple.SmartRoutingRequest",  0LL,  v5);
  }
}

- (void)_pipeEnsureStopped
{
  if (self->_pipeResponder)
  {
    if (dword_100234408 <= 30
      && (dword_100234408 != -1 || _LogCategory_Initialize(&dword_100234408, 30LL)))
    {
      LogPrintF(&dword_100234408, "-[BTSmartRoutingPipe _pipeEnsureStopped]", 30LL, "Route request deregister");
    }

    -[RPCompanionLinkClient invalidate](self->_pipeResponder, "invalidate");
    pipeResponder = self->_pipeResponder;
    self->_pipeResponder = 0LL;
  }

  -[BTSmartRoutingPipe _pipeCleanup](self, "_pipeCleanup");
  client = self->_client;
  if (client)
  {
    self->_client = 0LL;
  }

- (void)_pipeCleanup
{
  inCompletion = (void (**)(id))self->_inCompletion;
  if (inCompletion)
  {
    if (self->_inError)
    {
      inCompletion[2](self->_inCompletion);
    }

    else
    {
      uint64_t v4 = NSErrorF(NSOSStatusErrorDomain, 4294960596LL, "Cleanup before done");
      int v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
      ((void (*)(void (**)(id), void *))inCompletion[2])(inCompletion, v5);
    }

    id v6 = self->_inCompletion;
    self->_inCompletion = 0LL;
  }

  self->_invalidateCalled = 0;
  senderIDS = self->_senderIDS;
  if (senderIDS)
  {
    self->_senderIDS = 0LL;
  }

  self->_score = 0;
  client = self->_client;
  if (client)
  {
    -[RPCompanionLinkClient invalidate](client, "invalidate");
    v9 = self->_client;
    self->_client = 0LL;
  }

- (void)_pipeConnectionComplete:(id)a3 andWxHeadset:(id)a4 isSender:(BOOL)a5
{
  BOOL v30 = a5;
  v7 = (__CFString *)a4;
  if (a3) {
    int v8 = 12;
  }
  else {
    int v8 = 11;
  }
  v31 = self;
  self->_int state = v8;
  id v9 = a3;
  uint64_t v10 = CUPrintNSError(v9);
  uint64_t v11 = objc_claimAutoreleasedReturnValue(v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue( +[BTSmartRoutingDaemon sharedBTSmartRoutingDaemon]( &OBJC_CLASS___BTSmartRoutingDaemon,  "sharedBTSmartRoutingDaemon"));
  v13 = (void *)objc_claimAutoreleasedReturnValue([v12 pipePendingRequest]);
  v14 = (dispatch_source_s *)objc_claimAutoreleasedReturnValue([v13 timer]);

  if (v14) {
    dispatch_source_cancel(v14);
  }
  v15 = (void *)objc_claimAutoreleasedReturnValue([v12 pipePendingRequest]);
  [v15 setTimer:0];

  [v12 setPipePendingRequest:0];
  [v12 _setTipiElectionInProgress:0];
  [v12 _setTipiElectionReceivedLePipe:&stru_100212678];
  [v12 _startTipiSetupTicks];
  if (!a3) {
    [v12 _setIsFirstConnentionAfterSREnable:0 forDevice:v7];
  }
  if (v7) {
    v16 = v7;
  }
  else {
    v16 = &stru_100212678;
  }
  v17 = v16;
  uint64_t v18 = objc_claimAutoreleasedReturnValue([v12 _getWxFWVersion:v17]);
  v19 = (void *)v18;
  if (v18) {
    v20 = (__CFString *)v18;
  }
  else {
    v20 = &stru_100212678;
  }
  v21 = v20;

  id v22 = [v12 _getWxProductID:v17];
  v32[0] = @"pipeError";
  v32[1] = @"pipeError2";
  v33[0] = v11;
  v33[1] = v11;
  v32[2] = @"pipeErrorCode";
  v29 = (void *)v11;
  id v23 = [v9 code];

  v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v23));
  v33[2] = v24;
  v33[3] = v21;
  v32[3] = @"wxBuildVersion";
  v32[4] = @"wxPD";
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v22));
  v33[4] = v25;
  v32[5] = @"isSender";
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v30));
  v33[5] = v26;
  v32[6] = @"isSender2";
  v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v30));
  v33[6] = v27;
  v28 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v33,  v32,  7LL));

  CUMetricsLogEx(&dword_100234408, @"com.apple.bluetooth.SmartRoutingPipe", v28);
  -[BTSmartRoutingPipe _runPipeStates](v31, "_runPipeStates");
}

- (void)_pipeSendRouteRequestToSFDevice:(id)a3 andWxHeadset:(id)a4 newPipe:(BOOL)a5 connectionResult:(id)a6 completion:(id)a7
{
  BOOL v9 = a5;
  id v13 = a3;
  id v14 = a4;
  id v33 = a6;
  id v15 = a7;
  v43[0] = 0LL;
  v43[1] = v43;
  v43[2] = 0x2020000000LL;
  BOOL v44 = v9;
  v16 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  v17 = v16;
  if (v9)
  {
    id v18 = objc_alloc_init(&OBJC_CLASS___RPCompanionLinkDevice);
    [v18 setIdentifier:v13];
    inError = self->_inError;
    self->_inError = 0LL;

    id v20 = objc_retainBlock(v15);
    id inCompletion = self->_inCompletion;
    self->_id inCompletion = v20;

    objc_storeStrong((id *)&self->_senderIDS, a3);
    id v22 = objc_alloc_init(&OBJC_CLASS___RPCompanionLinkClient);
    objc_storeStrong((id *)&self->_client, v22);
    -[RPCompanionLinkClient setControlFlags:]( v22,  "setControlFlags:",  (unint64_t)-[RPCompanionLinkClient controlFlags](v22, "controlFlags") | 0x600100);
    -[RPCompanionLinkClient setDestinationDevice:](v22, "setDestinationDevice:", v18);
    -[RPCompanionLinkClient setDispatchQueue:](v22, "setDispatchQueue:", self->_dispatchQueue);
    if ((objc_opt_respondsToSelector(v22, "setBleClientUseCase:") & 1) != 0) {
      -[RPCompanionLinkClient setBleClientUseCase:](v22, "setBleClientUseCase:", 18LL);
    }
    v41[0] = _NSConcreteStackBlock;
    v41[1] = 3221225472LL;
    v41[2] = sub_10004CB04;
    v41[3] = &unk_100206380;
    v41[4] = self;
    id v23 = v14;
    id v42 = v23;
    -[RPCompanionLinkClient activateWithCompletion:](v22, "activateWithCompletion:", v41);
    self->_int state = 10;
    v24 = (void *)objc_claimAutoreleasedReturnValue( +[BTSmartRoutingDaemon sharedBTSmartRoutingDaemon]( &OBJC_CLASS___BTSmartRoutingDaemon,  "sharedBTSmartRoutingDaemon"));
    v25 = (void *)objc_claimAutoreleasedReturnValue([v24 _myBluetoothAddressString]);
    -[NSMutableDictionary setObject:forKeyedSubscript:](v17, "setObject:forKeyedSubscript:", v25, @"btAddress");

    v26 = (void *)GestaltCopyAnswer(@"DeviceName", 0LL, 0LL);
    -[NSMutableDictionary setObject:forKeyedSubscript:](v17, "setObject:forKeyedSubscript:", v26, @"btName");

    v27 = +[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", arc4random());
    v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
    -[NSMutableDictionary setObject:forKeyedSubscript:](v17, "setObject:forKeyedSubscript:", v28, @"btXID");

    -[NSMutableDictionary setObject:forKeyedSubscript:](v17, "setObject:forKeyedSubscript:", v23, @"wxAddress");
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v17,  "setObject:forKeyedSubscript:",  &off_100218938,  @"version");
  }

  else
  {
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v16,  "setObject:forKeyedSubscript:",  v33,  @"btConnectionResult");
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v17,  "setObject:forKeyedSubscript:",  &off_100218938,  @"version");
    -[NSMutableDictionary setObject:forKeyedSubscript:](v17, "setObject:forKeyedSubscript:", v14, @"wxAddress");
  }

  v29 = self->_client;
  if (dword_100234408 <= 30 && (dword_100234408 != -1 || _LogCategory_Initialize(&dword_100234408, 30LL))) {
    LogPrintF( &dword_100234408,  "-[BTSmartRoutingPipe _pipeSendRouteRequestToSFDevice:andWxHeadset:newPipe:connectionResult:completion:]",  30LL,  "Send route request start: peer %@, %##@",  v13,  v17);
  }
  v40[0] = 0LL;
  v40[1] = v40;
  v40[2] = 0x2020000000LL;
  v40[3] = mach_absolute_time();
  uint64_t v45 = RPOptionTimeoutSeconds;
  v46 = &off_1002190F8;
  BOOL v30 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v46,  &v45,  1LL));
  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472LL;
  v34[2] = sub_10004CB80;
  v34[3] = &unk_100207548;
  id v31 = v13;
  id v35 = v31;
  v36 = self;
  id v32 = v14;
  id v37 = v32;
  v38 = v40;
  v39 = v43;
  -[RPCompanionLinkClient sendRequestID:request:options:responseHandler:]( v29,  "sendRequestID:request:options:responseHandler:",  @"com.apple.SmartRoutingRequest",  v17,  v30,  v34);

  _Block_object_dispose(v40, 8);
  _Block_object_dispose(v43, 8);
}

- (void)_pipeReceivedRouteRequest:(id)a3 options:(id)a4 responseHandler:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = RPOptionSenderIDSDeviceID;
  CFTypeID TypeID = CFStringGetTypeID();
  v93 = v8;
  uint64_t TypedValue = CFDictionaryGetTypedValue(v8, v10, TypeID, 0LL);
  id v13 = (void *)objc_claimAutoreleasedReturnValue(TypedValue);
  id v14 = (void *)objc_claimAutoreleasedReturnValue( +[BTSmartRoutingDaemon sharedBTSmartRoutingDaemon]( &OBJC_CLASS___BTSmartRoutingDaemon,  "sharedBTSmartRoutingDaemon"));
  id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 pipePendingRequest]);
  if (!v15
    || (v16 = (void *)objc_claimAutoreleasedReturnValue([v14 pipePendingRequest]),
        v17 = (void *)objc_claimAutoreleasedReturnValue([v16 senderIDS]),
        unsigned __int8 v18 = [v17 isEqualToString:v13],
        v17,
        v16,
        v15,
        (v18 & 1) != 0))
  {
    v19 = objc_alloc_init(&OBJC_CLASS___BTSmartRoutingRouteRequest);
    uint64_t NSNumber = NSDictionaryGetNSNumber(v7, @"btXID", 0LL);
    v21 = (void *)objc_claimAutoreleasedReturnValue(NSNumber);
    -[BTSmartRoutingRouteRequest setBtXID:](v19, "setBtXID:", v21);

    -[BTSmartRoutingRouteRequest setRequest:](v19, "setRequest:", v7);
    -[BTSmartRoutingRouteRequest setResponseHandler:](v19, "setResponseHandler:", v9);
    -[BTSmartRoutingRouteRequest setSenderIDS:](v19, "setSenderIDS:", v13);
    uint64_t v115 = 0LL;
    v116 = &v115;
    uint64_t v117 = 0x3032000000LL;
    v118 = sub_100019A08;
    v119 = sub_100019A18;
    id v120 = 0LL;
    v109[0] = _NSConcreteStackBlock;
    v109[1] = 3221225472LL;
    v109[2] = sub_10004DBB8;
    v109[3] = &unk_100207570;
    v114 = &v115;
    id v22 = v13;
    id v110 = v22;
    id v23 = v7;
    id v111 = v23;
    v112 = self;
    v113 = v19;
    v24 = objc_retainBlock(v109);
    if (dword_100234408 <= 30
      && (dword_100234408 != -1 || _LogCategory_Initialize(&dword_100234408, 30LL)))
    {
      LogPrintF( &dword_100234408,  "-[BTSmartRoutingPipe _pipeReceivedRouteRequest:options:responseHandler:]",  30LL,  "Received route request: from %@, %##@",  v22,  v23);
    }

    [v14 _powerLogSmartIncomingConnection];
    v27 = (void *)objc_claimAutoreleasedReturnValue( +[BTSmartRoutingDaemon sharedBTSmartRoutingDaemon]( &OBJC_CLASS___BTSmartRoutingDaemon,  "sharedBTSmartRoutingDaemon"));
    unsigned int v28 = [v27 _isForceRejectPipe];

    if (v28)
    {
      if (dword_100234408 <= 30
        && (dword_100234408 != -1 || _LogCategory_Initialize(&dword_100234408, 30LL)))
      {
        LogPrintF( &dword_100234408,  "-[BTSmartRoutingPipe _pipeReceivedRouteRequest:options:responseHandler:]",  30LL,  "Reject any LE pipe because default write is enabled");
      }

      uint64_t v33 = NSErrorF( NSOSStatusErrorDomain,  4294960596LL,  "The device is forced to reject any LE pipe as default write enabled");
      uint64_t v34 = objc_claimAutoreleasedReturnValue(v33);
      id v35 = (void *)v116[5];
      v116[5] = v34;
      goto LABEL_56;
    }

    CFTypeID v29 = CFStringGetTypeID();
    uint64_t v30 = CFDictionaryGetTypedValue(v23, @"btConnectionResult", v29, 0LL);
    v90 = (void *)objc_claimAutoreleasedReturnValue(v30);
    CFTypeID v31 = CFStringGetTypeID();
    uint64_t v32 = CFDictionaryGetTypedValue(v23, @"wxAddress", v31, 0LL);
    v91 = (void *)objc_claimAutoreleasedReturnValue(v32);
    v92 = (void *)objc_claimAutoreleasedReturnValue([v23 objectForKey:@"version"]);
    if (dword_100234408 <= 30
      && (dword_100234408 != -1 || _LogCategory_Initialize(&dword_100234408, 30LL)))
    {
      LogPrintF( &dword_100234408,  "-[BTSmartRoutingPipe _pipeReceivedRouteRequest:options:responseHandler:]",  30LL,  "Version %@",  v92);
    }

    -[BTSmartRoutingRouteRequest setVersion:](v19, "setVersion:", v92);
    [v92 doubleValue];
    if (v36 >= 1.2)
    {
      if (v90)
      {
        id v37 = (void *)objc_claimAutoreleasedReturnValue([v14 pipePendingRequest]);
        BOOL v38 = v37 == 0LL;

        if (!v38)
        {
          v39 = (void *)objc_claimAutoreleasedReturnValue([v14 pipePendingRequest]);
          unsigned int v40 = [v39 progressStarted];

          if (v40)
          {
            v41 = (void *)objc_claimAutoreleasedReturnValue([v14 pipePendingRequest]);
            [v41 setProgressStarted:0];

            [v14 _setTipiElectionInProgress:0];
            [v14 _setTipiElectionReceivedLePipe:&stru_100212678];
            -[BTSmartRoutingPipe _pipeRequestCompleted:error:](self, "_pipeRequestCompleted:error:", v19, 0LL);
            if ([v90 isEqual:@"connectionResultError"])
            {
              if (dword_100234408 <= 90
                && (dword_100234408 != -1 || _LogCategory_Initialize(&dword_100234408, 90LL)))
              {
                LogPrintF( &dword_100234408,  "-[BTSmartRoutingPipe _pipeReceivedRouteRequest:options:responseHandler:]",  90LL,  "Connection result is failure. Remove knowledge of other %@",  v92);
              }

              v66 = (void *)objc_claimAutoreleasedReturnValue([v14 pipePendingRequest]);
              v86 = (void *)objc_claimAutoreleasedReturnValue([v66 wxAddress]);

              v67 = (void *)objc_claimAutoreleasedReturnValue( +[BTSmartRoutingDaemon sharedBTSmartRoutingDaemon]( &OBJC_CLASS___BTSmartRoutingDaemon,  "sharedBTSmartRoutingDaemon"));
              uint64_t v68 = NSErrorF(NSOSStatusErrorDomain, 4294960595LL, "Connection failed");
              v69 = (void *)objc_claimAutoreleasedReturnValue(v68);
              [v67 _updateOtherTipiDevice:v86 otherAddress:0 otherName:0 otherVersion:0 withResult:v69];

              uint64_t v70 = NSErrorF(NSOSStatusErrorDomain, 4294960595LL, "Connection failed");
              v84 = (void *)objc_claimAutoreleasedReturnValue(v70);
              -[BTSmartRoutingPipe _pipeConnectionComplete:andWxHeadset:isSender:]( self,  "_pipeConnectionComplete:andWxHeadset:isSender:",  v84,  v86,  0LL);

LABEL_54:
              goto LABEL_55;
            }

            -[BTSmartRoutingPipe _pipeConnectionComplete:andWxHeadset:isSender:]( self,  "_pipeConnectionComplete:andWxHeadset:isSender:",  0LL,  v91,  0LL);
            v87 = (void *)objc_claimAutoreleasedReturnValue( +[BTSmartRoutingDaemon sharedBTSmartRoutingDaemon]( &OBJC_CLASS___BTSmartRoutingDaemon,  "sharedBTSmartRoutingDaemon"));
            [v87 _notifyOtherTipiDeviceTipiScoreChanged:0 andNewScore:0];
          }

- (void)_pipeRequestCompleted:(id)a3 error:(id)a4
{
  id v17 = a3;
  id v5 = a4;
  id v6 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v7 = v6;
  if (v5) {
    id v8 = @"NO";
  }
  else {
    id v8 = @"YES";
  }
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v6,  "setObject:forKeyedSubscript:",  v8,  @"connectionResultACK");
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v17 wxAddress]);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v7, "setObject:forKeyedSubscript:", v9, @"wxAddress");

  -[NSMutableDictionary setObject:forKeyedSubscript:]( v7,  "setObject:forKeyedSubscript:",  &off_100218938,  @"version");
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v17 btXID]);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v7, "setObject:forKeyedSubscript:", v10, @"btXID");

  if (dword_100234408 <= 30 && (dword_100234408 != -1 || _LogCategory_Initialize(&dword_100234408, 30LL)))
  {
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v17 senderIDS]);
    v12 = (void *)objc_claimAutoreleasedReturnValue([v17 request]);
    LogPrintF( &dword_100234408,  "-[BTSmartRoutingPipe _pipeRequestCompleted:error:]",  30LL,  "Route request completed: senderIDS %@ version %@, request %##@, response %##@",  v11,  &off_100218938,  v12,  v7);
  }

  uint64_t v13 = objc_claimAutoreleasedReturnValue([v17 responseHandler]);
  id v14 = (void *)v13;
  if (v13) {
    (*(void (**)(uint64_t, NSMutableDictionary *, void, id))(v13 + 16))(v13, v7, 0LL, v5);
  }

  [v17 setResponseHandler:0];
  id v15 = (dispatch_source_s *)objc_claimAutoreleasedReturnValue([v17 timer]);
  v16 = v15;
  if (v15) {
    dispatch_source_cancel(v15);
  }
  [v17 setTimer:0];
}

- (void)_pipeRequestResponse:(id)a3 error:(id)a4
{
  id v22 = a3;
  id v6 = a4;
  if (v6)
  {
    if (dword_100234408 <= 90
      && (dword_100234408 != -1 || _LogCategory_Initialize(&dword_100234408, 90LL)))
    {
      id v7 = (void *)objc_claimAutoreleasedReturnValue([v22 senderIDS]);
      id v8 = (void *)objc_claimAutoreleasedReturnValue([v22 request]);
      LogPrintF( &dword_100234408,  "-[BTSmartRoutingPipe _pipeRequestResponse:error:]",  90LL,  "### Route request failed: senderIDS %@, request %##@, %{error}",  v7,  v8,  v6);
    }

    uint64_t v16 = objc_claimAutoreleasedReturnValue([v22 responseHandler]);
    id v17 = (void *)v16;
    if (v16) {
      (*(void (**)(uint64_t, void, void, id))(v16 + 16))(v16, 0LL, 0LL, v6);
    }

    [v22 setResponseHandler:0];
    unsigned __int8 v18 = (dispatch_source_s *)objc_claimAutoreleasedReturnValue([v22 timer]);
    id v9 = (NSMutableDictionary *)v18;
    if (v18) {
      dispatch_source_cancel(v18);
    }
    [v22 setTimer:0];
    v19 = (void *)objc_claimAutoreleasedReturnValue([v22 wxAddress]);
    -[BTSmartRoutingPipe _pipeConnectionComplete:andWxHeadset:isSender:]( self,  "_pipeConnectionComplete:andWxHeadset:isSender:",  v6,  v19,  0LL);
  }

  else
  {
    id v9 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( +[BTSmartRoutingDaemon sharedBTSmartRoutingDaemon]( &OBJC_CLASS___BTSmartRoutingDaemon,  "sharedBTSmartRoutingDaemon"));
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 _myBluetoothAddressString]);
    -[NSMutableDictionary setObject:forKeyedSubscript:](v9, "setObject:forKeyedSubscript:", v11, @"btAddress");

    v12 = (void *)GestaltCopyAnswer(@"DeviceName", 0LL, 0LL);
    -[NSMutableDictionary setObject:forKeyedSubscript:](v9, "setObject:forKeyedSubscript:", v12, @"btName");

    -[NSMutableDictionary setObject:forKeyedSubscript:]( v9,  "setObject:forKeyedSubscript:",  &off_100218938,  @"version");
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v22 btXID]);
    -[NSMutableDictionary setObject:forKeyedSubscript:](v9, "setObject:forKeyedSubscript:", v13, @"btXID");

    if (dword_100234408 <= 30
      && (dword_100234408 != -1 || _LogCategory_Initialize(&dword_100234408, 30LL)))
    {
      id v14 = (void *)objc_claimAutoreleasedReturnValue([v22 senderIDS]);
      id v15 = (void *)objc_claimAutoreleasedReturnValue([v22 request]);
      LogPrintF( &dword_100234408,  "-[BTSmartRoutingPipe _pipeRequestResponse:error:]",  30LL,  "Route request response: senderIDS %@ version %@, request %##@, response %##@",  v14,  &off_100218938,  v15,  v9);
    }

    uint64_t v20 = objc_claimAutoreleasedReturnValue([v22 responseHandler]);
    v21 = (void *)v20;
    if (v20) {
      (*(void (**)(uint64_t, NSMutableDictionary *, void, void))(v20 + 16))(v20, v9, 0LL, 0LL);
    }

    [v22 setResponseHandler:0];
  }
}

- (void)_pipeDone
{
  id inCompletion = (void (**)(id, void))self->_inCompletion;
  if (inCompletion)
  {
    inCompletion[2](inCompletion, 0LL);
    id v4 = self->_inCompletion;
    self->_id inCompletion = 0LL;
  }

  -[BTSmartRoutingPipe _pipeCleanup](self, "_pipeCleanup");
}

- (void).cxx_destruct
{
}

@end
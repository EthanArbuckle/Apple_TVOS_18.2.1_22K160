@interface RPNearFieldDaemonController
+ (id)_legacyApplicationLabels;
- (BOOL)_supportsApplicationLabel:(id)a3;
- (BOOL)enabled;
- (BOOL)hasCurrentTransaction;
- (BOOL)isActive;
- (NSXPCConnection)connection;
- (OS_dispatch_queue)dispatchQueue;
- (RPNFCTransaction)currentTransaction;
- (RPNFCTransactionController)transactionController;
- (RPNearFieldContext)currentContext;
- (RPNearFieldDaemonController)initWithConnection:(id)a3 dispatchQueue:(id)a4;
- (RPNearFieldDataSource)dataSource;
- (id)_convertToLegacyApplicationLabelIfNeeded:(id)a3 forVersion:(id)a4;
- (id)_convertToUpdatedApplicationLabelIfNeeded:(id)a3 forVersion:(id)a4;
- (id)_createAuthenticationPayload;
- (id)_createValidationPayload;
- (id)_payloadForType:(int64_t)a3;
- (id)_remoteObjectProxy;
- (id)transactionChangedHandler;
- (id)transactionController:(id)a3 requestMessageForType:(int64_t)a4;
- (id)transactionController:(id)a3 responseMessageForRequestMessage:(id)a4;
- (id)transactionController:(id)a3 tapEventForApplicationLabel:(id)a4 singleBandAWDLModeRequested:(BOOL)a5 pkData:(id)a6 bonjourListenerUUID:(id)a7 identity:(id)a8;
- (int64_t)currentPreferredPollingType;
- (unsigned)_flagsForVersion:(id)a3;
- (void)_clearCurrentTransaction;
- (void)_startTransactionControllerIfNeeded;
- (void)_stopTransactionControllerIfNeeded;
- (void)didChangeStateForTransaction:(id)a3;
- (void)invalidate;
- (void)invalidateTransactionWithIdentifier:(id)a3;
- (void)invalidateTransactionWithIdentifier:(id)a3 context:(id)a4;
- (void)setConnection:(id)a3;
- (void)setCurrentContext:(id)a3;
- (void)setCurrentPreferredPollingType:(int64_t)a3;
- (void)setCurrentTransaction:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setIsActive:(BOOL)a3;
- (void)setTransactionChangedHandler:(id)a3;
- (void)startPolling:(int64_t)a3 context:(id)a4;
- (void)stop;
- (void)transactionController:(id)a3 didBeginTransaction:(id)a4;
- (void)transactionController:(id)a3 didDetectDeviceNearbyWithInitiatorRole:(BOOL)a4;
- (void)transactionController:(id)a3 didFinishTransaction:(id)a4 error:(id)a5;
@end

@implementation RPNearFieldDaemonController

+ (id)_legacyApplicationLabels
{
  if (qword_100133290 != -1) {
    dispatch_once(&qword_100133290, &stru_1001127C8);
  }
  return (id)qword_100133288;
}

- (RPNearFieldDaemonController)initWithConnection:(id)a3 dispatchQueue:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___RPNearFieldDaemonController;
  v9 = -[RPNearFieldDaemonController init](&v13, "init");
  if (v9)
  {
    if (dword_1001315C0 <= 30
      && (dword_1001315C0 != -1 || _LogCategory_Initialize(&dword_1001315C0, 30LL)))
    {
      LogPrintF(&dword_1001315C0, "-[RPNearFieldDaemonController initWithConnection:dispatchQueue:]", 30LL, "init");
    }

    objc_storeStrong((id *)&v9->_connection, a3);
    objc_storeStrong((id *)&v9->_dispatchQueue, a4);
    v10 = -[RPNearFieldDataSource initWithDispatchQueue:]( objc_alloc(&OBJC_CLASS___RPNearFieldDataSource),  "initWithDispatchQueue:",  v8);
    dataSource = v9->_dataSource;
    v9->_dataSource = v10;
  }

  return v9;
}

- (void)invalidate
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RPNearFieldDaemonController connection](self, "connection"));
  [v3 invalidate];

  -[RPNearFieldDaemonController setConnection:](self, "setConnection:", 0LL);
  -[RPNearFieldDaemonController setTransactionChangedHandler:](self, "setTransactionChangedHandler:", 0LL);
}

- (void)setEnabled:(BOOL)a3
{
  if (self->_enabled != a3)
  {
    BOOL v3 = a3;
    self->_BOOL enabled = a3;
    if (dword_1001315C0 <= 30)
    {
      BOOL enabled = a3;
      if (dword_1001315C0 != -1)
      {
LABEL_4:
        v6 = "no";
        BOOL v7 = !enabled;
        if (enabled) {
          id v8 = "no";
        }
        else {
          id v8 = "yes";
        }
        if (!v7) {
          v6 = "yes";
        }
        LogPrintF( &dword_1001315C0,  "-[RPNearFieldDaemonController setEnabled:]",  30LL,  "NFC Discovery enabled: %s -> %s\n",  v8,  v6);
        goto LABEL_11;
      }

      if (_LogCategory_Initialize(&dword_1001315C0, 30LL))
      {
        BOOL enabled = self->_enabled;
        goto LABEL_4;
      }
    }

- (BOOL)hasCurrentTransaction
{
  v2 = self;
  BOOL v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[RPNearFieldDaemonController dispatchQueue](self, "dispatchQueue"));
  dispatch_assert_queue_V2(v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RPNearFieldDaemonController currentTransaction](v2, "currentTransaction"));
  LOBYTE(v2) = v4 != 0LL;

  return (char)v2;
}

- (void)startPolling:(int64_t)a3 context:(id)a4
{
  id v17 = a4;
  if (dword_1001315C0 <= 30 && (dword_1001315C0 != -1 || _LogCategory_Initialize(&dword_1001315C0, 30LL)))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue([v17 applicationLabel]);
    LogPrintF( &dword_1001315C0,  "-[RPNearFieldDaemonController startPolling:context:]",  30LL,  "Start polling for applicationLabel:%@ pollingType:%d\n",  v6,  a3);
  }

  if (!-[RPNearFieldDaemonController isActive](self, "isActive")) {
    goto LABEL_15;
  }
  id v7 = (id)objc_claimAutoreleasedReturnValue(-[RPNearFieldDaemonController currentContext](self, "currentContext"));
  id v8 = v17;
  v9 = v8;
  if (v7 == v8) {
    unsigned int v10 = 0;
  }
  else {
    unsigned int v10 = (v8 != 0) == (v7 == 0) ? 1 : [v7 isEqual:v8] ^ 1;
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[RPNearFieldDaemonController transactionController](self, "transactionController"));
  if (v11)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[RPNearFieldDaemonController transactionController](self, "transactionController"));
    BOOL v13 = [v12 preferredPollingType] != (id)a3;
  }

  else
  {
    BOOL v13 = 0;
  }

  if (((v10 | v13) & 1) == 0)
  {
    if (dword_1001315C0 <= 30
      && (dword_1001315C0 != -1 || _LogCategory_Initialize(&dword_1001315C0, 30LL)))
    {
      LogPrintF( &dword_1001315C0,  "-[RPNearFieldDaemonController startPolling:context:]",  30LL,  "We are already polling with this configuration.\n");
    }
  }

  else
  {
LABEL_15:
    -[RPNearFieldDaemonController setCurrentContext:](self, "setCurrentContext:", v17);
    -[RPNearFieldDaemonController setCurrentPreferredPollingType:](self, "setCurrentPreferredPollingType:", a3);
    -[RPNearFieldDaemonController setIsActive:](self, "setIsActive:", 1LL);
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[RPNearFieldDaemonController currentTransaction](self, "currentTransaction"));

    if (v14)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[RPNearFieldDaemonController currentTransaction](self, "currentTransaction"));
      v16 = (void *)objc_claimAutoreleasedReturnValue([v15 identifier]);
      -[RPNearFieldDaemonController invalidateTransactionWithIdentifier:]( self,  "invalidateTransactionWithIdentifier:",  v16);
    }

    else
    {
      -[RPNearFieldDaemonController _startTransactionControllerIfNeeded](self, "_startTransactionControllerIfNeeded");
    }
  }
}

- (void)setCurrentPreferredPollingType:(int64_t)a3
{
  if (self->_currentPreferredPollingType != a3)
  {
    self->_currentPreferredPollingType = a3;
    id v4 = (id)objc_claimAutoreleasedReturnValue(-[RPNearFieldDaemonController transactionController](self, "transactionController"));
    [v4 setPreferredPollingType:a3];
  }

- (void)stop
{
  if (-[RPNearFieldDaemonController isActive](self, "isActive"))
  {
    if (dword_1001315C0 <= 30
      && (dword_1001315C0 != -1 || _LogCategory_Initialize(&dword_1001315C0, 30LL)))
    {
      LogPrintF(&dword_1001315C0, "-[RPNearFieldDaemonController stop]", 30LL, "Stop\n");
    }

    -[RPNearFieldDaemonController setIsActive:](self, "setIsActive:", 0LL);
    -[RPNearFieldDaemonController setCurrentContext:](self, "setCurrentContext:", 0LL);
    -[RPNearFieldDaemonController setCurrentPreferredPollingType:](self, "setCurrentPreferredPollingType:", 0LL);
    -[RPNearFieldDaemonController _stopTransactionControllerIfNeeded](self, "_stopTransactionControllerIfNeeded");
    BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[RPNearFieldDaemonController currentTransaction](self, "currentTransaction"));

    if (v3)
    {
      id v5 = (id)objc_claimAutoreleasedReturnValue(-[RPNearFieldDaemonController currentTransaction](self, "currentTransaction"));
      id v4 = (void *)objc_claimAutoreleasedReturnValue([v5 identifier]);
      -[RPNearFieldDaemonController invalidateTransactionWithIdentifier:]( self,  "invalidateTransactionWithIdentifier:",  v4);
    }
  }

- (void)invalidateTransactionWithIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[RPNearFieldDaemonController currentContext](self, "currentContext"));
  -[RPNearFieldDaemonController invalidateTransactionWithIdentifier:context:]( self,  "invalidateTransactionWithIdentifier:context:",  v4,  v5);
}

- (void)invalidateTransactionWithIdentifier:(id)a3 context:(id)a4
{
  id v16 = a3;
  id v6 = a4;
  if (dword_1001315C0 <= 30 && (dword_1001315C0 != -1 || _LogCategory_Initialize(&dword_1001315C0, 30LL)))
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[RPNearFieldDaemonController currentTransaction](self, "currentTransaction"));
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 identifier]);
    LogPrintF( &dword_1001315C0,  "-[RPNearFieldDaemonController invalidateTransactionWithIdentifier:context:]",  30LL,  "invalidate transaction with identifier:%@\n current transaction identifier:%@\n context:%@\n",  v16,  v8,  v6);
  }

  -[RPNearFieldDaemonController setCurrentContext:](self, "setCurrentContext:", v6);
  uint64_t v9 = objc_claimAutoreleasedReturnValue(-[RPNearFieldDaemonController currentTransaction](self, "currentTransaction"));
  if (v9
    && (unsigned int v10 = (void *)v9,
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[RPNearFieldDaemonController currentTransaction](self, "currentTransaction")),
        v12 = (void *)objc_claimAutoreleasedReturnValue([v11 identifier]),
        unsigned __int8 v13 = [v12 isEqual:v16],
        v12,
        v11,
        v10,
        (v13 & 1) != 0))
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[RPNearFieldDaemonController transactionController](self, "transactionController"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[RPNearFieldDaemonController currentTransaction](self, "currentTransaction"));
    [v14 invalidateTransaction:v15];

    -[RPNearFieldDaemonController _clearCurrentTransaction](self, "_clearCurrentTransaction");
    -[RPNearFieldDaemonController _startTransactionControllerIfNeeded](self, "_startTransactionControllerIfNeeded");
  }

  else if (dword_1001315C0 <= 90 {
         && (dword_1001315C0 != -1 || _LogCategory_Initialize(&dword_1001315C0, 90LL)))
  }
  {
    LogPrintF( &dword_1001315C0,  "-[RPNearFieldDaemonController invalidateTransactionWithIdentifier:context:]",  90LL,  "failed to invalidate transaction with identifier:%@\n",  v16);
  }
}

- (void)_startTransactionControllerIfNeeded
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[RPNearFieldDaemonController transactionController](self, "transactionController"));
  unsigned __int8 v4 = [v3 isRunning];

  if ((v4 & 1) == 0 && -[RPNearFieldDaemonController isActive](self, "isActive"))
  {
    if (dword_1001315C0 <= 30
      && (dword_1001315C0 != -1 || _LogCategory_Initialize(&dword_1001315C0, 30LL)))
    {
      LogPrintF( &dword_1001315C0,  "-[RPNearFieldDaemonController _startTransactionControllerIfNeeded]",  30LL,  "start transaction controller\n");
    }

    if (-[RPNearFieldDaemonController enabled](self, "enabled"))
    {
      id v5 = (void *)objc_claimAutoreleasedReturnValue(-[RPNearFieldDaemonController currentTransaction](self, "currentTransaction"));

      if (v5)
      {
        if (dword_1001315C0 > 90
          || dword_1001315C0 == -1 && !_LogCategory_Initialize(&dword_1001315C0, 90LL))
        {
          return;
        }

        id v6 = "failed to start transaction controller: we already have an active transaction\n";
LABEL_15:
        LogPrintF(&dword_1001315C0, "-[RPNearFieldDaemonController _startTransactionControllerIfNeeded]", 90LL, v6);
        return;
      }

      id v7 = (void *)objc_claimAutoreleasedReturnValue(-[RPNearFieldDaemonController transactionController](self, "transactionController"));

      if (!v7)
      {
        id v8 = -[RPNFCTransactionController initWithPreferredPollingType:dispatchQueue:]( objc_alloc(&OBJC_CLASS___RPNFCTransactionController),  "initWithPreferredPollingType:dispatchQueue:",  -[RPNearFieldDaemonController currentPreferredPollingType](self, "currentPreferredPollingType"),  self->_dispatchQueue);
        transactionController = self->_transactionController;
        self->_transactionController = v8;
      }

      unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue(-[RPNearFieldDaemonController transactionController](self, "transactionController"));
      [v10 setDataSource:self];

      v11 = (void *)objc_claimAutoreleasedReturnValue(-[RPNearFieldDaemonController transactionController](self, "transactionController"));
      [v11 setDelegate:self];

      id v12 = (id)objc_claimAutoreleasedReturnValue(-[RPNearFieldDaemonController transactionController](self, "transactionController"));
      [v12 start];
    }

    else if (dword_1001315C0 <= 90 {
           && (dword_1001315C0 != -1 || _LogCategory_Initialize(&dword_1001315C0, 90LL)))
    }
    {
      id v6 = "Failed to start transaction controller: NFC Discovery is disabled.\n";
      goto LABEL_15;
    }
  }

- (void)_stopTransactionControllerIfNeeded
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[RPNearFieldDaemonController transactionController](self, "transactionController"));
  unsigned int v4 = [v3 isRunning];

  if (v4)
  {
    if (dword_1001315C0 <= 30
      && (dword_1001315C0 != -1 || _LogCategory_Initialize(&dword_1001315C0, 30LL)))
    {
      LogPrintF( &dword_1001315C0,  "-[RPNearFieldDaemonController _stopTransactionControllerIfNeeded]",  30LL,  "stop transaction controller\n");
    }

    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[RPNearFieldDaemonController transactionController](self, "transactionController"));
    [v5 setDataSource:0];

    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[RPNearFieldDaemonController transactionController](self, "transactionController"));
    [v6 setDelegate:0];

    id v7 = (id)objc_claimAutoreleasedReturnValue(-[RPNearFieldDaemonController transactionController](self, "transactionController"));
    [v7 stop];
  }

- (void)_clearCurrentTransaction
{
  if (dword_1001315C0 <= 30 && (dword_1001315C0 != -1 || _LogCategory_Initialize(&dword_1001315C0, 30LL)))
  {
    BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[RPNearFieldDaemonController currentTransaction](self, "currentTransaction"));
    LogPrintF( &dword_1001315C0,  "-[RPNearFieldDaemonController _clearCurrentTransaction]",  30LL,  "clearing current transaction:%@\n",  v3);
  }

  unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue(-[RPNearFieldDaemonController currentTransaction](self, "currentTransaction"));
  [v4 setDelegate:0];

  -[RPNearFieldDaemonController setCurrentTransaction:](self, "setCurrentTransaction:", 0LL);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[RPNearFieldDaemonController transactionChangedHandler](self, "transactionChangedHandler"));

  if (v5)
  {
    id v6 = (void (**)(void))objc_claimAutoreleasedReturnValue(-[RPNearFieldDaemonController transactionChangedHandler](self, "transactionChangedHandler"));
    v6[2]();
  }

- (id)_remoteObjectProxy
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RPNearFieldDaemonController connection](self, "connection"));
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue([v2 remoteObjectProxyWithErrorHandler:&stru_1001127E8]);

  return v3;
}

- (void)didChangeStateForTransaction:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[RPNearFieldDaemonController currentTransaction](self, "currentTransaction"));

  if (v5 == v4)
  {
    if (dword_1001315C0 <= 30
      && (dword_1001315C0 != -1 || _LogCategory_Initialize(&dword_1001315C0, 30LL)))
    {
      LogPrintF( &dword_1001315C0,  "-[RPNearFieldDaemonController didChangeStateForTransaction:]",  30LL,  "did change state for transaction:%@\n",  v4);
    }

    if ([v4 state] == (id)2)
    {
      id v6 = (void *)objc_claimAutoreleasedReturnValue(+[RPIdentityDaemon sharedIdentityDaemon](&OBJC_CLASS___RPIdentityDaemon, "sharedIdentityDaemon"));
      id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 remoteIdentity]);
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472LL;
      v9[2] = sub_10003CD84;
      v9[3] = &unk_100112810;
      v9[4] = self;
      id v10 = v4;
      [v6 isContactValidForIdentity:v7 completionBlock:v9];
    }

    else
    {
      id v8 = (void *)objc_claimAutoreleasedReturnValue(-[RPNearFieldDaemonController _remoteObjectProxy](self, "_remoteObjectProxy"));
      [v8 didUpdateTransaction:v4];
    }
  }
}

- (void)transactionController:(id)a3 didDetectDeviceNearbyWithInitiatorRole:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[RPNearFieldDaemonController currentTransaction](self, "currentTransaction", a3));

  if (!v6)
  {
    if (dword_1001315C0 <= 30
      && (dword_1001315C0 != -1 || _LogCategory_Initialize(&dword_1001315C0, 30LL)))
    {
      LogPrintF( &dword_1001315C0,  "-[RPNearFieldDaemonController transactionController:didDetectDeviceNearbyWithInitiatorRole:]",  30LL,  "did detect device nearby\n");
    }

    id v7 = (id)objc_claimAutoreleasedReturnValue(-[RPNearFieldDaemonController _remoteObjectProxy](self, "_remoteObjectProxy"));
    [v7 didDetectDeviceNearbyWithInitiatorRole:v4];
  }

- (void)transactionController:(id)a3 didBeginTransaction:(id)a4
{
  id v9 = a4;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[RPNearFieldDaemonController currentTransaction](self, "currentTransaction"));

  if (!v5)
  {
    if (dword_1001315C0 <= 30
      && (dword_1001315C0 != -1 || _LogCategory_Initialize(&dword_1001315C0, 30LL)))
    {
      LogPrintF( &dword_1001315C0,  "-[RPNearFieldDaemonController transactionController:didBeginTransaction:]",  30LL,  "did begin new transaction:%@\n",  v9);
    }

    -[RPNearFieldDaemonController setCurrentTransaction:](self, "setCurrentTransaction:", v9);
    [v9 setDelegate:self];
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[RPNearFieldDaemonController _remoteObjectProxy](self, "_remoteObjectProxy"));
    [v6 didBeginTransaction:v9];

    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[RPNearFieldDaemonController transactionChangedHandler](self, "transactionChangedHandler"));
    if (v7)
    {
      id v8 = (void (**)(void))objc_claimAutoreleasedReturnValue( -[RPNearFieldDaemonController transactionChangedHandler]( self,  "transactionChangedHandler"));
      v8[2]();
    }
  }
}

- (void)transactionController:(id)a3 didFinishTransaction:(id)a4 error:(id)a5
{
  id v8 = a4;
  id v6 = (id)objc_claimAutoreleasedReturnValue(-[RPNearFieldDaemonController currentTransaction](self, "currentTransaction"));

  id v7 = v8;
  if (v6 == v8)
  {
    if ([v8 state] == (id)2)
    {
      if (dword_1001315C0 <= 30
        && (dword_1001315C0 != -1 || _LogCategory_Initialize(&dword_1001315C0, 30LL)))
      {
        LogPrintF( &dword_1001315C0,  "-[RPNearFieldDaemonController transactionController:didFinishTransaction:error:]",  30LL,  "exchange completed for current transaction:%@\n stop listening for new transactions until client invalidates the current one.",  v8);
      }

      -[RPNearFieldDaemonController _stopTransactionControllerIfNeeded](self, "_stopTransactionControllerIfNeeded");
    }

    else
    {
      -[RPNearFieldDaemonController _clearCurrentTransaction](self, "_clearCurrentTransaction");
    }

    id v7 = v8;
  }
}

- (id)_createAuthenticationPayload
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[RPNearFieldDaemonController dataSource](self, "dataSource"));
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(-[RPNearFieldDaemonController currentContext](self, "currentContext"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 pkData]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[RPNearFieldDaemonController currentContext](self, "currentContext"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 bonjourListenerUUID]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v3 createAuthenticationPayloadWithPkData:v5 bonjourListenerUUID:v7]);

  return v8;
}

- (BOOL)_supportsApplicationLabel:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[RPNearFieldDaemonController currentContext](self, "currentContext"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 supportedApplicationLabels]);
  id v7 = [v6 count];

  if (v7)
  {
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    __int128 v14 = 0u;
    __int128 v15 = 0u;
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[RPNearFieldDaemonController currentContext](self, "currentContext"));
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 supportedApplicationLabels]);

    id v10 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v15;
      while (2)
      {
        for (i = 0LL; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v15 != v11) {
            objc_enumerationMutation(v9);
          }
          if ([v4 hasPrefix:*(void *)(*((void *)&v14 + 1) + 8 * (void)i)])
          {
            if (dword_1001315C0 <= 30
              && (dword_1001315C0 != -1 || _LogCategory_Initialize(&dword_1001315C0, 30LL)))
            {
              LogPrintF( &dword_1001315C0,  "-[RPNearFieldDaemonController _supportsApplicationLabel:]",  30LL,  "applicationLabel:%@ is supported.\n",  v4);
            }

            LOBYTE(v10) = 1;
            goto LABEL_17;
          }
        }

        id v10 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
        if (v10) {
          continue;
        }
        break;
      }
    }

- (id)_createValidationPayload
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[RPNearFieldDaemonController currentTransaction](self, "currentTransaction"));

  if (!v3
    && dword_1001315C0 <= 115
    && (dword_1001315C0 != -1 || _LogCategory_Initialize(&dword_1001315C0, 115LL)))
  {
    LogPrintF( &dword_1001315C0,  "-[RPNearFieldDaemonController _createValidationPayload]",  115LL,  "creating validation payload with a nil current transaction.");
  }

  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[RPNearFieldDaemonController currentTransaction](self, "currentTransaction"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 remoteIdentity]);
  BOOL v6 = v5 != 0LL;

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[RPNearFieldDaemonController currentTransaction](self, "currentTransaction"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 remoteAuthenticationMessage]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 applicationLabel]);

  BOOL v10 = -[RPNearFieldDaemonController _supportsApplicationLabel:](self, "_supportsApplicationLabel:", v9);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[RPNearFieldDaemonController dataSource](self, "dataSource"));
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 createValidationPayloadWithKnownIdentity:v6 supportsApplicationLabel:v10]);

  return v12;
}

- (id)_payloadForType:(int64_t)a3
{
  if (sub_10004D898(a3))
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[RPNearFieldDaemonController _createAuthenticationPayload](self, "_createAuthenticationPayload"));
  }

  else if (a3 == 2)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[RPNearFieldDaemonController _createValidationPayload](self, "_createValidationPayload"));
  }

  else
  {
    id v5 = 0LL;
  }

  return v5;
}

- (id)_convertToLegacyApplicationLabelIfNeeded:(id)a3 forVersion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (qword_1001332A0 != -1) {
    dispatch_once(&qword_1001332A0, &stru_100112830);
  }
  id v7 = v5;
  id v8 = v7;
  if ([v6 isEqualToString:@"1.0"])
  {
    uint64_t v9 = objc_claimAutoreleasedReturnValue([(id)qword_100133298 objectForKeyedSubscript:v7]);
    BOOL v10 = (void *)v9;
    if (v9) {
      uint64_t v11 = (void *)v9;
    }
    else {
      uint64_t v11 = v7;
    }
    id v8 = v11;
  }

  return v8;
}

- (id)_convertToUpdatedApplicationLabelIfNeeded:(id)a3 forVersion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (qword_1001332B0 != -1) {
    dispatch_once(&qword_1001332B0, &stru_100112850);
  }
  id v7 = v5;
  id v8 = v7;
  if ([v6 isEqualToString:@"1.0"])
  {
    uint64_t v9 = objc_claimAutoreleasedReturnValue([(id)qword_1001332A8 objectForKeyedSubscript:v7]);
    BOOL v10 = (void *)v9;
    if (v9) {
      uint64_t v11 = (void *)v9;
    }
    else {
      uint64_t v11 = v7;
    }
    id v8 = v11;
  }

  return v8;
}

- (id)transactionController:(id)a3 requestMessageForType:(int64_t)a4
{
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[RPNearFieldDaemonController currentTransaction](self, "currentTransaction", a3));

  if (v6)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[RPNearFieldDaemonController _payloadForType:](self, "_payloadForType:", a4));
    id v8 = @"1.1";
    if (a4 == 2)
    {
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[RPNearFieldDaemonController currentTransaction](self, "currentTransaction"));
      BOOL v10 = (void *)objc_claimAutoreleasedReturnValue([v9 remoteAuthenticationMessage]);
      uint64_t v11 = objc_claimAutoreleasedReturnValue([v10 version]);

      id v8 = (__CFString *)v11;
    }

    id v12 = (void *)objc_claimAutoreleasedReturnValue(-[RPNearFieldDaemonController currentContext](self, "currentContext"));
    unsigned __int8 v13 = (void *)objc_claimAutoreleasedReturnValue([v12 applicationLabel]);
    __int128 v14 = (void *)objc_claimAutoreleasedReturnValue( -[RPNearFieldDaemonController _convertToLegacyApplicationLabelIfNeeded:forVersion:]( self,  "_convertToLegacyApplicationLabelIfNeeded:forVersion:",  v13,  v8));

    if (dword_1001315C0 <= 30
      && (dword_1001315C0 != -1 || _LogCategory_Initialize(&dword_1001315C0, 30LL)))
    {
      LogPrintF( &dword_1001315C0,  "-[RPNearFieldDaemonController transactionController:requestMessageForType:]",  30LL,  "type:%d version:%@ applicationLabel:%@\n",  a4,  v8,  v14);
    }

    __int128 v16 = (void *)objc_claimAutoreleasedReturnValue(-[RPNearFieldDaemonController dataSource](self, "dataSource"));
    __int128 v15 = (void *)objc_claimAutoreleasedReturnValue([v16 createRequestMessageWithApplicationLabel:v14 payload:v7]);
  }

  else
  {
    __int128 v15 = 0LL;
  }

  return v15;
}

- (id)transactionController:(id)a3 responseMessageForRequestMessage:(id)a4
{
  id v5 = a4;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[RPNearFieldDaemonController currentTransaction](self, "currentTransaction"));

  if (v6)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 payload]);
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[RPNearFieldDaemonController _payloadForType:](self, "_payloadForType:", [v7 type]));

    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[RPNearFieldDaemonController currentContext](self, "currentContext"));
    BOOL v10 = (void *)objc_claimAutoreleasedReturnValue([v9 applicationLabel]);
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v5 version]);
    id v12 = (void *)objc_claimAutoreleasedReturnValue( -[RPNearFieldDaemonController _convertToLegacyApplicationLabelIfNeeded:forVersion:]( self,  "_convertToLegacyApplicationLabelIfNeeded:forVersion:",  v10,  v11));

    unsigned __int8 v13 = (void *)objc_claimAutoreleasedReturnValue(-[RPNearFieldDaemonController dataSource](self, "dataSource"));
    __int128 v14 = (void *)objc_claimAutoreleasedReturnValue([v13 createResponseWithApplicationLabel:v12 payload:v8 forRequestMessage:v5]);
  }

  else
  {
    __int128 v14 = 0LL;
  }

  return v14;
}

- (id)transactionController:(id)a3 tapEventForApplicationLabel:(id)a4 singleBandAWDLModeRequested:(BOOL)a5 pkData:(id)a6 bonjourListenerUUID:(id)a7 identity:(id)a8
{
  BOOL v10 = a5;
  id v13 = a8;
  id v14 = a7;
  id v15 = a6;
  id v16 = a4;
  __int128 v17 = (void *)objc_claimAutoreleasedReturnValue(-[RPNearFieldDaemonController currentTransaction](self, "currentTransaction"));
  v18 = (void *)objc_claimAutoreleasedReturnValue([v17 localValidationMessage]);
  v19 = (void *)objc_claimAutoreleasedReturnValue([v18 payload]);

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[RPNearFieldDaemonController currentTransaction](self, "currentTransaction"));
  v21 = (void *)objc_claimAutoreleasedReturnValue([v20 remoteValidationMessage]);
  v22 = (void *)objc_claimAutoreleasedReturnValue([v21 payload]);

  v23 = (void *)objc_claimAutoreleasedReturnValue([v19 supportsApplicationLabel]);
  LODWORD(v21) = [v23 BOOLValue];

  v51 = v13;
  BOOL v50 = v10;
  if ((_DWORD)v21)
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue([v22 supportsApplicationLabel]);

    if (v24)
    {
      v25 = (void *)objc_claimAutoreleasedReturnValue([v22 supportsApplicationLabel]);
      uint64_t v26 = [v25 BOOLValue] ^ 1;
    }

    else
    {
      v27 = (void *)objc_claimAutoreleasedReturnValue(-[RPNearFieldDaemonController currentContext](self, "currentContext"));
      v28 = (void *)objc_claimAutoreleasedReturnValue([v27 applicationLabel]);
      v25 = (void *)objc_claimAutoreleasedReturnValue( -[RPNearFieldDaemonController _convertToLegacyApplicationLabelIfNeeded:forVersion:]( self,  "_convertToLegacyApplicationLabelIfNeeded:forVersion:",  v28,  @"1.0"));

      v29 = (void *)objc_claimAutoreleasedReturnValue(-[RPNearFieldDaemonController currentTransaction](self, "currentTransaction"));
      v30 = (void *)objc_claimAutoreleasedReturnValue([v29 remoteValidationMessage]);
      v49 = (void *)objc_claimAutoreleasedReturnValue([v30 applicationLabel]);

      id v33 = objc_msgSend((id)objc_opt_class(self, v31, v32), "_legacyApplicationLabels");
      v34 = (void *)objc_claimAutoreleasedReturnValue(v33);
      else {
        unsigned int v35 = [v25 hasPrefix:@"com.apple.airdrop"] ^ 1;
      }
      HIDWORD(v48) = v35;

      id v38 = objc_msgSend((id)objc_opt_class(self, v36, v37), "_legacyApplicationLabels");
      v39 = (void *)objc_claimAutoreleasedReturnValue(v38);
      unsigned int v40 = [v39 containsObject:v49];

      uint64_t v26 = HIDWORD(v48) | v40 ^ 1;
    }
  }

  else
  {
    uint64_t v26 = 1LL;
  }

  v41 = (void *)objc_claimAutoreleasedReturnValue(-[RPNearFieldDaemonController currentTransaction](self, "currentTransaction"));
  v42 = (void *)objc_claimAutoreleasedReturnValue([v41 remoteValidationMessage]);
  v43 = (void *)objc_claimAutoreleasedReturnValue([v42 version]);

  v44 = (void *)objc_claimAutoreleasedReturnValue( -[RPNearFieldDaemonController _convertToUpdatedApplicationLabelIfNeeded:forVersion:]( self,  "_convertToUpdatedApplicationLabelIfNeeded:forVersion:",  v16,  v43));
  v45 = (void *)objc_claimAutoreleasedReturnValue(-[RPNearFieldDaemonController dataSource](self, "dataSource"));
  LODWORD(v48) = -[RPNearFieldDaemonController _flagsForVersion:](self, "_flagsForVersion:", v43);
  v46 = (void *)objc_claimAutoreleasedReturnValue( [v45 createTapEventWithApplicationLabel:v44 singleBandAWDLModeRequested:v50 pkData:v15 bonjourListenerUUID:v14 identity:v51 i sUnsupportedApplicationLabel:v26 flags:v48]);

  return v46;
}

- (unsigned)_flagsForVersion:(id)a3
{
  return [a3 isEqualToString:@"1.1"];
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (id)transactionChangedHandler
{
  return self->_transactionChangedHandler;
}

- (void)setTransactionChangedHandler:(id)a3
{
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (RPNearFieldContext)currentContext
{
  return self->_currentContext;
}

- (void)setCurrentContext:(id)a3
{
}

- (int64_t)currentPreferredPollingType
{
  return self->_currentPreferredPollingType;
}

- (RPNearFieldDataSource)dataSource
{
  return self->_dataSource;
}

- (RPNFCTransactionController)transactionController
{
  return self->_transactionController;
}

- (RPNFCTransaction)currentTransaction
{
  return self->_currentTransaction;
}

- (void)setCurrentTransaction:(id)a3
{
}

- (BOOL)isActive
{
  return self->_isActive;
}

- (void)setIsActive:(BOOL)a3
{
  self->_isActive = a3;
}

- (void).cxx_destruct
{
}

@end
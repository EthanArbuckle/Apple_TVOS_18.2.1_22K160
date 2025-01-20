@interface RPNFCTransactionController
- (BOOL)isRunning;
- (BOOL)pendingInitiator;
- (BOOL)pendingReceiver;
- (OS_dispatch_queue)dispatchQueue;
- (OS_dispatch_source)becomeInitiatorTimer;
- (OS_dispatch_source)connectToReceiverTimer;
- (OS_dispatch_source)initiatorLimitTimer;
- (OS_dispatch_source)pollingCoolDownTimer;
- (RPNFCTransaction)currentTransaction;
- (RPNFCTransactionController)initWithPreferredPollingType:(int64_t)a3 dispatchQueue:(id)a4;
- (RPNFCTransactionControllerDataSource)dataSource;
- (RPNFCTransactionControllerDelegate)delegate;
- (id)_createOneShotTimerWithInterval:(double)a3 completionHandler:(id)a4;
- (int64_t)initiatorState;
- (int64_t)preferredPollingType;
- (int64_t)receiverState;
- (void)_beginTransactionForRole:(int64_t)a3;
- (void)_finishCurrentTransactionWithError:(id)a3;
- (void)_startBecomeInitiatorTimer;
- (void)_startConnectToReceiverTimer;
- (void)_startInitiatorLimitTimer;
- (void)_startPollingCoolDownTimer;
- (void)_stopBecomeInitiatorTimer;
- (void)_stopConnectToReceiverTimer;
- (void)_stopInitiatorLimitTimer;
- (void)_stopPollingCoolDownTimer;
- (void)_stopTimers;
- (void)_updatePolling;
- (void)invalidateTransaction:(id)a3;
- (void)setBecomeInitiatorTimer:(id)a3;
- (void)setConnectToReceiverTimer:(id)a3;
- (void)setCurrentTransaction:(id)a3;
- (void)setDataSource:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setInitiatorLimitTimer:(id)a3;
- (void)setInitiatorState:(int64_t)a3;
- (void)setIsRunning:(BOOL)a3;
- (void)setPendingInitiator:(BOOL)a3;
- (void)setPendingReceiver:(BOOL)a3;
- (void)setPollingCoolDownTimer:(id)a3;
- (void)setPreferredPollingType:(int64_t)a3;
- (void)setReceiverState:(int64_t)a3;
@end

@implementation RPNFCTransactionController

- (RPNFCTransactionController)initWithPreferredPollingType:(int64_t)a3 dispatchQueue:(id)a4
{
  id v7 = a4;
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___RPNFCTransactionController;
  v8 = -[RPNFCTransactionController init](&v10, "init");
  if (v8)
  {
    if (dword_100132538 <= 30
      && (dword_100132538 != -1 || _LogCategory_Initialize(&dword_100132538, 30LL)))
    {
      LogPrintF( &dword_100132538,  "-[RPNFCTransactionController initWithPreferredPollingType:dispatchQueue:]",  30LL,  "init with preferred polling type:%d\n",  a3);
    }

    v8->_preferredPollingType = a3;
    objc_storeStrong((id *)&v8->_dispatchQueue, a4);
    v8->_receiverState = 0LL;
    v8->_initiatorState = 0LL;
  }

  return v8;
}

- (void)setPreferredPollingType:(int64_t)a3
{
  if (self->_preferredPollingType != a3)
  {
    self->_preferredPollingType = a3;
    -[RPNFCTransactionController _updatePolling](self, "_updatePolling");
  }

- (void)_updatePolling
{
  if (-[RPNFCTransactionController isRunning](self, "isRunning"))
  {
    if (dword_100132538 <= 30
      && (dword_100132538 != -1 || _LogCategory_Initialize(&dword_100132538, 30LL)))
    {
      LogPrintF( &dword_100132538,  "-[RPNFCTransactionController _updatePolling]",  30LL,  "update polling for type:%d\n",  -[RPNFCTransactionController preferredPollingType](self, "preferredPollingType"));
    }

    -[RPNFCTransactionController _finishCurrentTransactionWithError:](self, "_finishCurrentTransactionWithError:", 0LL);
    -[RPNFCTransactionController _startReceiver](self, "_startReceiver");
    if ((id)-[RPNFCTransactionController preferredPollingType](self, "preferredPollingType") == (id)2) {
      -[RPNFCTransactionController _startInitiator](self, "_startInitiator");
    }
    else {
      -[RPNFCTransactionController _stopInitiator](self, "_stopInitiator");
    }
  }

- (void)setInitiatorState:(int64_t)a3
{
  if (self->_initiatorState != a3)
  {
    self->_initiatorState = a3;
    if (dword_100132538 <= 30
      && (dword_100132538 != -1 || _LogCategory_Initialize(&dword_100132538, 30LL)))
    {
      v4 = @"Stopped";
      if (a3 == 1) {
        v4 = @"Started";
      }
      if (a3 == 2) {
        v4 = @"Stopping";
      }
      LogPrintF( &dword_100132538,  "-[RPNFCTransactionController setInitiatorState:]",  30LL,  "initiator state changed:%@\n",  v4);
    }
  }

- (void)setReceiverState:(int64_t)a3
{
  if (self->_receiverState != a3)
  {
    self->_receiverState = a3;
    if (dword_100132538 <= 30
      && (dword_100132538 != -1 || _LogCategory_Initialize(&dword_100132538, 30LL)))
    {
      v4 = @"Stopped";
      if (a3 == 1) {
        v4 = @"Started";
      }
      if (a3 == 2) {
        v4 = @"Stopping";
      }
      LogPrintF( &dword_100132538,  "-[RPNFCTransactionController setReceiverState:]",  30LL,  "receiver state changed:%@\n",  v4);
    }
  }

- (void)invalidateTransaction:(id)a3
{
  id v12 = a3;
  if (dword_100132538 <= 30 && (dword_100132538 != -1 || _LogCategory_Initialize(&dword_100132538, 30LL)))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue([v12 identifier]);
    LogPrintF( &dword_100132538,  "-[RPNFCTransactionController invalidateTransaction:]",  30LL,  "invalidate transaction:%@\n",  v4);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RPNFCTransactionController currentTransaction](self, "currentTransaction"));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[RPNFCTransactionController currentTransaction](self, "currentTransaction"));
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 identifier]);
    v8 = (void *)objc_claimAutoreleasedReturnValue([v12 identifier]);
    unsigned __int8 v9 = [v7 isEqual:v8];

    if ((v9 & 1) != 0)
    {
      -[RPNFCTransactionController _finishCurrentTransactionWithError:]( self,  "_finishCurrentTransactionWithError:",  0LL);
    }

    else if (dword_100132538 <= 90 {
           && (dword_100132538 != -1 || _LogCategory_Initialize(&dword_100132538, 90LL)))
    }
    {
      objc_super v10 = (void *)objc_claimAutoreleasedReturnValue(-[RPNFCTransactionController currentTransaction](self, "currentTransaction"));
      v11 = (void *)objc_claimAutoreleasedReturnValue([v10 identifier]);
      LogPrintF( &dword_100132538,  "-[RPNFCTransactionController invalidateTransaction:]",  90LL,  "failed to invalidate current transaction:%@ - mismatching\n",  v11);
    }
  }
}

- (void)_stopTimers
{
}

- (id)_createOneShotTimerWithInterval:(double)a3 completionHandler:(id)a4
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  id v7 = a4;
  dispatch_assert_queue_V2(dispatchQueue);
  v8 = dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_timer,  0LL,  0LL,  (dispatch_queue_t)self->_dispatchQueue);
  dispatch_source_set_event_handler(v8, v7);

  CUDispatchTimerSet(v8, a3, -1.0, 0.0);
  return v8;
}

- (void)_startPollingCoolDownTimer
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_100072BD4;
  v4[3] = &unk_1001110A8;
  v4[4] = self;
  v3 = (dispatch_object_s *)objc_claimAutoreleasedReturnValue( -[RPNFCTransactionController _createOneShotTimerWithInterval:completionHandler:]( self,  "_createOneShotTimerWithInterval:completionHandler:",  v4,  10.0));
  -[RPNFCTransactionController setPollingCoolDownTimer:](self, "setPollingCoolDownTimer:", v3);
  dispatch_activate(v3);
}

- (void)_stopPollingCoolDownTimer
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RPNFCTransactionController pollingCoolDownTimer](self, "pollingCoolDownTimer"));

  if (v3)
  {
    if (dword_100132538 <= 30
      && (dword_100132538 != -1 || _LogCategory_Initialize(&dword_100132538, 30LL)))
    {
      LogPrintF( &dword_100132538,  "-[RPNFCTransactionController _stopPollingCoolDownTimer]",  30LL,  "stop timer for polling cool down\n");
    }

    pollingCoolDownTimer = self->_pollingCoolDownTimer;
    if (pollingCoolDownTimer)
    {
      v5 = pollingCoolDownTimer;
      dispatch_source_cancel(v5);
      v6 = self->_pollingCoolDownTimer;
      self->_pollingCoolDownTimer = 0LL;
    }

    -[RPNFCTransactionController setPollingCoolDownTimer:](self, "setPollingCoolDownTimer:", 0LL);
  }

- (void)_startConnectToReceiverTimer
{
  double v3 = (double)(arc4random_uniform(3u) + 3);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_100072E08;
  v5[3] = &unk_1001110A8;
  v5[4] = self;
  v4 = (dispatch_object_s *)objc_claimAutoreleasedReturnValue( -[RPNFCTransactionController _createOneShotTimerWithInterval:completionHandler:]( self,  "_createOneShotTimerWithInterval:completionHandler:",  v5,  v3));
  -[RPNFCTransactionController setConnectToReceiverTimer:](self, "setConnectToReceiverTimer:", v4);
  dispatch_activate(v4);
  if (dword_100132538 <= 30 && (dword_100132538 != -1 || _LogCategory_Initialize(&dword_100132538, 30LL))) {
    LogPrintF( &dword_100132538,  "-[RPNFCTransactionController _startConnectToReceiverTimer]",  30LL,  "start timer to connect with the receiver:%f\n",  v3);
  }
}

- (void)_stopConnectToReceiverTimer
{
  double v3 = (void *)objc_claimAutoreleasedReturnValue(-[RPNFCTransactionController connectToReceiverTimer](self, "connectToReceiverTimer"));

  if (v3)
  {
    if (dword_100132538 <= 30
      && (dword_100132538 != -1 || _LogCategory_Initialize(&dword_100132538, 30LL)))
    {
      LogPrintF( &dword_100132538,  "-[RPNFCTransactionController _stopConnectToReceiverTimer]",  30LL,  "stop timer to connect with the receiver\n");
    }

    connectToReceiverTimer = self->_connectToReceiverTimer;
    if (connectToReceiverTimer)
    {
      v5 = connectToReceiverTimer;
      dispatch_source_cancel(v5);
      v6 = self->_connectToReceiverTimer;
      self->_connectToReceiverTimer = 0LL;
    }

    -[RPNFCTransactionController setConnectToReceiverTimer:](self, "setConnectToReceiverTimer:", 0LL);
  }

- (void)_startInitiatorLimitTimer
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_100073000;
  v4[3] = &unk_1001110A8;
  v4[4] = self;
  double v3 = (dispatch_object_s *)objc_claimAutoreleasedReturnValue( -[RPNFCTransactionController _createOneShotTimerWithInterval:completionHandler:]( self,  "_createOneShotTimerWithInterval:completionHandler:",  v4,  60.0));
  -[RPNFCTransactionController setInitiatorLimitTimer:](self, "setInitiatorLimitTimer:", v3);
  dispatch_activate(v3);
}

- (void)_stopInitiatorLimitTimer
{
  double v3 = (void *)objc_claimAutoreleasedReturnValue(-[RPNFCTransactionController initiatorLimitTimer](self, "initiatorLimitTimer"));

  if (v3)
  {
    initiatorLimitTimer = self->_initiatorLimitTimer;
    if (initiatorLimitTimer)
    {
      v5 = initiatorLimitTimer;
      dispatch_source_cancel(v5);
      v6 = self->_initiatorLimitTimer;
      self->_initiatorLimitTimer = 0LL;
    }

    -[RPNFCTransactionController setInitiatorLimitTimer:](self, "setInitiatorLimitTimer:", 0LL);
  }

- (void)_startBecomeInitiatorTimer
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10007317C;
  v4[3] = &unk_1001110A8;
  v4[4] = self;
  double v3 = (dispatch_object_s *)objc_claimAutoreleasedReturnValue( -[RPNFCTransactionController _createOneShotTimerWithInterval:completionHandler:]( self,  "_createOneShotTimerWithInterval:completionHandler:",  v4,  0.7));
  -[RPNFCTransactionController setBecomeInitiatorTimer:](self, "setBecomeInitiatorTimer:", v3);
  dispatch_activate(v3);
}

- (void)_stopBecomeInitiatorTimer
{
  double v3 = (void *)objc_claimAutoreleasedReturnValue(-[RPNFCTransactionController becomeInitiatorTimer](self, "becomeInitiatorTimer"));

  if (v3)
  {
    becomeInitiatorTimer = self->_becomeInitiatorTimer;
    if (becomeInitiatorTimer)
    {
      v5 = becomeInitiatorTimer;
      dispatch_source_cancel(v5);
      v6 = self->_becomeInitiatorTimer;
      self->_becomeInitiatorTimer = 0LL;
    }

    -[RPNFCTransactionController setBecomeInitiatorTimer:](self, "setBecomeInitiatorTimer:", 0LL);
  }

- (void)_beginTransactionForRole:(int64_t)a3
{
  if (dword_100132538 <= 30 && (dword_100132538 != -1 || _LogCategory_Initialize(&dword_100132538, 30LL))) {
    LogPrintF( &dword_100132538,  "-[RPNFCTransactionController _beginTransactionForRole:]",  30LL,  "begin new transaction for role:%lld\n",  a3);
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RPNFCTransactionController currentTransaction](self, "currentTransaction"));

  if (v5)
  {
    if (dword_100132538 <= 90
      && (dword_100132538 != -1 || _LogCategory_Initialize(&dword_100132538, 90LL)))
    {
      LogPrintF( &dword_100132538,  "-[RPNFCTransactionController _beginTransactionForRole:]",  90LL,  "begin new transaction while we already have an existing transaction.\n",  a3);
    }

    -[RPNFCTransactionController _finishCurrentTransactionWithError:](self, "_finishCurrentTransactionWithError:", 0LL);
  }

  v6 = -[RPNFCTransaction initWithRole:](objc_alloc(&OBJC_CLASS___RPNFCTransaction), "initWithRole:", a3);
  -[RPNFCTransactionController setCurrentTransaction:](self, "setCurrentTransaction:", v6);

  id v8 = (id)objc_claimAutoreleasedReturnValue(-[RPNFCTransactionController delegate](self, "delegate"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[RPNFCTransactionController currentTransaction](self, "currentTransaction"));
  [v8 transactionController:self didBeginTransaction:v7];
}

- (void)_finishCurrentTransactionWithError:(id)a3
{
  id v8 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RPNFCTransactionController currentTransaction](self, "currentTransaction"));

  if (v4)
  {
    -[RPNFCTransactionController _stopInitiator](self, "_stopInitiator");
    if (dword_100132538 <= 30
      && (dword_100132538 != -1 || _LogCategory_Initialize(&dword_100132538, 30LL)))
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[RPNFCTransactionController currentTransaction](self, "currentTransaction"));
      LogPrintF( &dword_100132538,  "-[RPNFCTransactionController _finishCurrentTransactionWithError:]",  30LL,  "finish current transaction:%@ error:%@\n",  v5,  v8);
    }

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[RPNFCTransactionController currentTransaction](self, "currentTransaction"));
    [v6 setError:v8];
    -[RPNFCTransactionController setCurrentTransaction:](self, "setCurrentTransaction:", 0LL);
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[RPNFCTransactionController delegate](self, "delegate"));
    [v7 transactionController:self didFinishTransaction:v6 error:v8];

    -[RPNFCTransactionController _updatePolling](self, "_updatePolling");
  }
}

- (int64_t)preferredPollingType
{
  return self->_preferredPollingType;
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (RPNFCTransactionControllerDataSource)dataSource
{
  return (RPNFCTransactionControllerDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (void)setDataSource:(id)a3
{
}

- (RPNFCTransactionControllerDelegate)delegate
{
  return (RPNFCTransactionControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)isRunning
{
  return self->_isRunning;
}

- (void)setIsRunning:(BOOL)a3
{
  self->_isRunning = a3;
}

- (RPNFCTransaction)currentTransaction
{
  return self->_currentTransaction;
}

- (void)setCurrentTransaction:(id)a3
{
}

- (OS_dispatch_source)pollingCoolDownTimer
{
  return self->_pollingCoolDownTimer;
}

- (void)setPollingCoolDownTimer:(id)a3
{
}

- (OS_dispatch_source)initiatorLimitTimer
{
  return self->_initiatorLimitTimer;
}

- (void)setInitiatorLimitTimer:(id)a3
{
}

- (OS_dispatch_source)connectToReceiverTimer
{
  return self->_connectToReceiverTimer;
}

- (void)setConnectToReceiverTimer:(id)a3
{
}

- (OS_dispatch_source)becomeInitiatorTimer
{
  return self->_becomeInitiatorTimer;
}

- (void)setBecomeInitiatorTimer:(id)a3
{
}

- (int64_t)receiverState
{
  return self->_receiverState;
}

- (int64_t)initiatorState
{
  return self->_initiatorState;
}

- (BOOL)pendingReceiver
{
  return self->_pendingReceiver;
}

- (void)setPendingReceiver:(BOOL)a3
{
  self->_pendingReceiver = a3;
}

- (BOOL)pendingInitiator
{
  return self->_pendingInitiator;
}

- (void)setPendingInitiator:(BOOL)a3
{
  self->_pendingInitiator = a3;
}

- (void).cxx_destruct
{
}

@end
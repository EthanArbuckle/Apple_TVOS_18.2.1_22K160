@interface RPNIProximityEstimator
- (NISession)session;
- (NSString)innerRegionName;
- (NSString)outerRegionName;
- (OS_dispatch_queue)dispatchQueue;
- (RPNIProximityEstimator)init;
- (id)_createAndRunSession;
- (id)deviceRegionChangedHandler;
- (int64_t)innerPresencePreset;
- (int64_t)outerPresencePreset;
- (void)activateWithCompletion:(id)a3;
- (void)invalidate;
- (void)sendSampleForDevice:(id)a3;
- (void)session:(id)a3 didFailWithError:(id)a4;
- (void)session:(id)a3 didInvalidateWithError:(id)a4;
- (void)session:(id)a3 object:(id)a4 didUpdateRegion:(id)a5 previousRegion:(id)a6;
- (void)sessionDidStartRunning:(id)a3;
- (void)sessionSuspensionEnded:(id)a3;
- (void)sessionWasSuspended:(id)a3;
- (void)setDeviceRegionChangedHandler:(id)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setInnerPresencePreset:(int64_t)a3;
- (void)setInnerRegionName:(id)a3;
- (void)setOuterPresencePreset:(int64_t)a3;
- (void)setOuterRegionName:(id)a3;
- (void)setSession:(id)a3;
@end

@implementation RPNIProximityEstimator

- (RPNIProximityEstimator)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___RPNIProximityEstimator;
  v2 = -[RPNIProximityEstimator init](&v6, "init");
  v3 = v2;
  if (v2)
  {
    objc_storeStrong((id *)&v2->_dispatchQueue, &_dispatch_main_q);
    v4 = v3;
  }

  return v3;
}

- (void)activateWithCompletion:(id)a3
{
  id v4 = a3;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100073760;
  v7[3] = &unk_100113A48;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

- (void)invalidate
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10007392C;
  block[3] = &unk_1001110A8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)sendSampleForDevice:(id)a3
{
  id v4 = a3;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100073A20;
  v7[3] = &unk_100111968;
  id v8 = v4;
  v9 = self;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

- (id)_createAndRunSession
{
  unint64_t innerPresencePreset = self->_innerPresencePreset;
  if (innerPresencePreset <= 1) {
    unint64_t innerPresencePreset = 1LL;
  }
  self->_unint64_t innerPresencePreset = innerPresencePreset;
  int64_t outerPresencePreset = self->_outerPresencePreset;
  if (!outerPresencePreset) {
    int64_t outerPresencePreset = 5LL;
  }
  self->_int64_t outerPresencePreset = outerPresencePreset;
  id v5 = [objc_alloc(off_100132620()) initWithName:self->_innerRegionName devicePresencePreset:self->_innerPresencePreset];
  id v6 = [objc_alloc(off_100132620()) initWithName:self->_outerRegionName devicePresencePreset:self->_outerPresencePreset];
  id v22 = 0LL;
  id v7 = [objc_alloc(off_100132628()) initWithInnerBoundary:v5 outerBoundary:v6 error:&v22];
  id v14 = v22;
  if (!v14)
  {
    if (v7)
    {
      [v7 setAllowedDevices:0];
      session = self->_session;
      self->_session = 0LL;
      v16 = session;

      -[NISession invalidate](v16, "invalidate");
      v17 = (NISession *)objc_alloc_init(off_100132630());
      v18 = self->_session;
      self->_session = v17;

      -[NISession setDelegate:](self->_session, "setDelegate:", self);
      -[NISession setDelegateQueue:](self->_session, "setDelegateQueue:", self->_dispatchQueue);
      -[NISession runWithConfiguration:](self->_session, "runWithConfiguration:", v7);

      id v14 = 0LL;
    }

    else
    {
      id v19 = RPErrorF( 4294960534LL,  (uint64_t)"Failed to create device presence configuration",  v8,  v9,  v10,  v11,  v12,  v13,  v21);
      id v14 = (id)objc_claimAutoreleasedReturnValue(v19);
    }
  }

  return v14;
}

- (void)sessionDidStartRunning:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (dword_1001325A8 <= 30
    && ((id v6 = v3, dword_1001325A8 != -1) || (v5 = _LogCategory_Initialize(&dword_1001325A8, 30LL), v4 = v6, v5)))
  {
    LogPrintF( &dword_1001325A8,  "-[RPNIProximityEstimator sessionDidStartRunning:]",  30LL,  "Session did start running: %@\n",  v4);
  }

  else
  {
  }

- (void)session:(id)a3 object:(id)a4 didUpdateRegion:(id)a5 previousRegion:(id)a6
{
  id v18 = a4;
  id v9 = a5;
  id v10 = a6;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  id deviceRegionChangedHandler = self->_deviceRegionChangedHandler;
  if (deviceRegionChangedHandler)
  {
    uint64_t v12 = (void (**)(id, void *, BOOL))objc_retainBlock(deviceRegionChangedHandler);
    id v13 = [v9 devicePresencePreset];
    int64_t innerPresencePreset = self->_innerPresencePreset;
    if (dword_1001325A8 <= 30
      && (dword_1001325A8 != -1 || _LogCategory_Initialize(&dword_1001325A8, 30LL)))
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue([v10 name]);
      v16 = (void *)objc_claimAutoreleasedReturnValue([v9 name]);
      LogPrintF( &dword_1001325A8,  "-[RPNIProximityEstimator session:object:didUpdateRegion:previousRegion:]",  30LL,  "Device moved '%@' -> '%@': %@\n",  v15,  v16,  v18);
    }

    v17 = (void *)objc_claimAutoreleasedReturnValue([v18 deviceIdentifer]);
    v12[2](v12, v17, v13 == (id)innerPresencePreset);

    goto LABEL_10;
  }

  if (dword_1001325A8 <= 30 && (dword_1001325A8 != -1 || _LogCategory_Initialize(&dword_1001325A8, 30LL)))
  {
    uint64_t v12 = (void (**)(id, void *, BOOL))objc_claimAutoreleasedReturnValue([v18 deviceIdentifer]);
    LogPrintF( &dword_1001325A8,  "-[RPNIProximityEstimator session:object:didUpdateRegion:previousRegion:]",  30LL,  "Ignoring region updates for device %@, update handler is not specified\n",  v12);
LABEL_10:
  }
}

- (void)session:(id)a3 didFailWithError:(id)a4
{
  id v6 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (dword_1001325A8 <= 30 && (dword_1001325A8 != -1 || _LogCategory_Initialize(&dword_1001325A8, 30LL))) {
    LogPrintF( &dword_1001325A8,  "-[RPNIProximityEstimator session:didFailWithError:]",  30LL,  "didFailWithError error: %@\n",  v6);
  }
  id v5 = -[RPNIProximityEstimator _createAndRunSession](self, "_createAndRunSession");
}

- (void)session:(id)a3 didInvalidateWithError:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (dword_1001325A8 <= 30 && (dword_1001325A8 != -1 || _LogCategory_Initialize(&dword_1001325A8, 30LL))) {
    LogPrintF( &dword_1001325A8,  "-[RPNIProximityEstimator session:didInvalidateWithError:]",  30LL,  "didInvalidateWithError error: %@\n",  v6);
  }
  if (-[NISession isEqual:](self->_session, "isEqual:", v9))
  {
    session = self->_session;
    self->_session = 0LL;

    id v8 = -[RPNIProximityEstimator _createAndRunSession](self, "_createAndRunSession");
  }
}

- (void)sessionWasSuspended:(id)a3
{
  if (dword_1001325A8 <= 30 && (dword_1001325A8 != -1 || _LogCategory_Initialize(&dword_1001325A8, 30LL))) {
    LogPrintF( &dword_1001325A8,  "-[RPNIProximityEstimator sessionWasSuspended:]",  30LL,  "sessionWasSuspended waiting for ended suspension to resume. This should happen when bt is toggled back on\n");
  }
}

- (void)sessionSuspensionEnded:(id)a3
{
  if (dword_1001325A8 <= 30 && (dword_1001325A8 != -1 || _LogCategory_Initialize(&dword_1001325A8, 30LL))) {
    LogPrintF( &dword_1001325A8,  "-[RPNIProximityEstimator sessionSuspensionEnded:]",  30LL,  "sessionSuspensionEnded attempting to resume\n");
  }
  id v4 = -[RPNIProximityEstimator _createAndRunSession](self, "_createAndRunSession");
}

- (int64_t)innerPresencePreset
{
  return self->_innerPresencePreset;
}

- (void)setInnerPresencePreset:(int64_t)a3
{
  self->_int64_t innerPresencePreset = a3;
}

- (NSString)innerRegionName
{
  return self->_innerRegionName;
}

- (void)setInnerRegionName:(id)a3
{
}

- (int64_t)outerPresencePreset
{
  return self->_outerPresencePreset;
}

- (void)setOuterPresencePreset:(int64_t)a3
{
  self->_int64_t outerPresencePreset = a3;
}

- (NSString)outerRegionName
{
  return self->_outerRegionName;
}

- (void)setOuterRegionName:(id)a3
{
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
}

- (id)deviceRegionChangedHandler
{
  return self->_deviceRegionChangedHandler;
}

- (void)setDeviceRegionChangedHandler:(id)a3
{
}

- (NISession)session
{
  return self->_session;
}

- (void)setSession:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
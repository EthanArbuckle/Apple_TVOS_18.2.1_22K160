@interface CBAdvertiserDaemon
- (BOOL)_wiProxUpdateLinger:(id *)a3 active:(BOOL)a4;
- (BOOL)advertiserEnableEPA;
- (BOOL)needsToRun;
- (CBAdvertiserDaemon)init;
- (CBDaemonServer)daemonServer;
- (CBStackAdaptor)stackAdaptor;
- (NSArray)advertiserArray;
- (NSArray)spatialInteractionIdentifiers;
- (NSData)selfAuthTag;
- (NSData)spatialInteractionPresenceConfigData;
- (NSData)spatialInteractionUWBConfigData;
- (OS_dispatch_queue)dispatchQueue;
- (id)_encryptInvitationPayload:(const void *)a3 payloadLength:(unint64_t)a4 authTag:(id)a5 irkData:(id)a6 keyInfo:(const void *)a7 keyInfoLength:(unint64_t)a8;
- (id)description;
- (id)descriptionWithLevel:(int)a3;
- (id)invalidationHandler;
- (id)stateChangedHandler;
- (int)spatialInteractionAdvertiseRate;
- (unsigned)spatialInteractionConfigFlags;
- (unsigned)spatialInteractionFlags;
- (void)_activateWithCompletion:(id)a3;
- (void)_invalidate;
- (void)_invalidated;
- (void)_stackAppleTypeUpdateAdvertising:(id *)a3;
- (void)_update;
- (void)_updateAirDropPayload:(id *)a3;
- (void)_updateAirPlaySourcePayload:(id *)a3;
- (void)_updateAirPlayTargetPayload:(id *)a3;
- (void)_updateDSInfoPayload:(id *)a3;
- (void)_updateFIDOAdvertising;
- (void)_updateFIDOPayload;
- (void)_updateHeySiriPayload:(id *)a3;
- (void)_updateIfNeededWithBlock:(id)a3;
- (void)_updateNearbyActionNoWakePayload:(id *)a3;
- (void)_updateNearbyActionV1Payload:(id *)a3;
- (void)_updateNearbyActionV2Payload:(id *)a3;
- (void)_updateNearbyInfoPayload:(id *)a3;
- (void)_updateNearbyInfoV2Payload:(id *)a3;
- (void)_updateSafetyAlertsAdvertising;
- (void)_updateSafetyAlertsPayload;
- (void)_updateSpatialInteractionAdvertising:(id *)a3;
- (void)_updateSpatialInteractionPayload:(id *)a3;
- (void)_updateWatchSetupAdvertising;
- (void)_updateWatchSetupPayload;
- (void)_wiProxInvalidate:(id *)a3;
- (void)_wiProxUpdateAdvertising:(id *)a3;
- (void)_wiProxUpdatePayload:(id *)a3 payloadData:(id)a4 advertiseRate:(int)a5 advertiseEnableEPA:(BOOL)a6;
- (void)_wiproxAppendDescription:(id *)a3 context:(id *)a4 verbose:(BOOL)a5;
- (void)_wiproxChanged:(id)a3;
- (void)activateWithCompletion:(id)a3;
- (void)advertisingAddressChanged;
- (void)invalidate;
- (void)setAdvertiserArray:(id)a3;
- (void)setAdvertiserEnableEPA:(BOOL)a3;
- (void)setDaemonServer:(id)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setInvalidationHandler:(id)a3;
- (void)setSelfAuthTag:(id)a3;
- (void)setSpatialInteractionAdvertiseRate:(int)a3;
- (void)setSpatialInteractionConfigFlags:(unsigned __int8)a3;
- (void)setSpatialInteractionFlags:(unsigned __int8)a3;
- (void)setSpatialInteractionIdentifiers:(id)a3;
- (void)setSpatialInteractionPresenceConfigData:(id)a3;
- (void)setSpatialInteractionUWBConfigData:(id)a3;
- (void)setStackAdaptor:(id)a3;
- (void)setStateChangedHandler:(id)a3;
@end

@implementation CBAdvertiserDaemon

- (CBAdvertiserDaemon)init
{
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___CBAdvertiserDaemon;
  v2 = -[CBAdvertiserDaemon init](&v16, "init");
  if (v2)
  {
    v2->_clientID = CBXPCGetNextClientID();
    objc_storeStrong((id *)&v2->_dispatchQueue, &_dispatch_main_q);
    label = v2->_airdropWiProxContext.label;
    v2->_airdropWiProxContext.label = (NSString *)@"AirDrop";

    v2->_airdropWiProxContext.payloadType = 5;
    v4 = v2->_airplaySourceWiProxContext.label;
    v2->_airplaySourceWiProxContext.label = (NSString *)@"AirPlaySource";

    v2->_airplaySourceWiProxContext.payloadType = 10;
    v5 = v2->_airplayTargetWiProxContext.label;
    v2->_airplayTargetWiProxContext.label = (NSString *)@"AirPlayTarget";

    v2->_airplayTargetWiProxContext.payloadType = 9;
    v2->_dsInfoWiProxContext.connectable = 1;
    v6 = v2->_dsInfoWiProxContext.label;
    v2->_dsInfoWiProxContext.label = (NSString *)@"DSInfo";

    v2->_dsInfoWiProxContext.payloadType = 24;
    v7 = v2->_heySiriWiProxContext.label;
    v2->_heySiriWiProxContext.label = (NSString *)@"HeySiri";

    v2->_heySiriWiProxContext.payloadType = 8;
    v2->_nearbyActionV1WiProxContext.connectable = 1;
    v8 = v2->_nearbyActionV1WiProxContext.label;
    v2->_nearbyActionV1WiProxContext.label = (NSString *)@"NearbyActionV1";

    v2->_nearbyActionV1WiProxContext.payloadType = 15;
    v9 = v2->_nearbyActionV2WiProxContext.label;
    v2->_nearbyActionV2WiProxContext.label = (NSString *)@"NearbyActionV2";

    v2->_nearbyActionV2WiProxContext.payloadType = 21;
    v2->_nearbyInfoWiProxContext.connectable = 1;
    v10 = v2->_nearbyInfoWiProxContext.label;
    v2->_nearbyInfoWiProxContext.label = (NSString *)@"NearbyInfo";

    v2->_nearbyInfoWiProxContext.payloadType = 16;
    v11 = v2->_nearbyInfoV2WiProxContext.label;
    v2->_nearbyInfoV2WiProxContext.label = (NSString *)@"NearbyInfoV2";

    v2->_nearbyInfoV2WiProxContext.payloadType = 22;
    v2->_nearbyActionNoWakeWiProxContext.connectable = 1;
    v12 = v2->_nearbyActionNoWakeWiProxContext.label;
    v2->_nearbyActionNoWakeWiProxContext.label = (NSString *)@"NearbyActionNoWake";

    v2->_nearbyActionNoWakeWiProxContext.payloadType = 26;
    v2->_spatialInteractionWiProxContext.advertiseEnableEPA = 0;
    v13 = v2->_spatialInteractionWiProxContext.label;
    v2->_spatialInteractionWiProxContext.label = (NSString *)@"SpatialInteraction";

    v2->_spatialInteractionWiProxContext.payloadType = 19;
    v14 = v2;
  }

  return v2;
}

- (id)description
{
  return -[CBAdvertiserDaemon descriptionWithLevel:](self, "descriptionWithLevel:", 50LL);
}

- (id)descriptionWithLevel:(int)a3
{
  unsigned int v4 = a3;
  id v57 = 0LL;
  id v5 = [(id)objc_opt_class(self) description];
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  NSAppendPrintF_safe( &v57,  "%@: CID 0x%X, clients %d",  v6,  self->_clientID,  -[NSArray count](self->_advertiserArray, "count"));
  id v7 = v57;
  id location = v7;

  fidoPayloadData = self->_fidoPayloadData;
  if (fidoPayloadData)
  {
    id v56 = v7;
    v9 = fidoPayloadData;
    uint64_t v10 = CUPrintNSDataHex(v9, 100LL, 1LL);
    uint64_t v11 = [v10 autorelease];
    v12 = (void *)v11;
    int fidoAdvertiseRate = self->_fidoAdvertiseRate;
    if (fidoAdvertiseRate <= 39)
    {
      if (fidoAdvertiseRate > 19)
      {
        if (fidoAdvertiseRate == 20)
        {
          v14 = "350 ms";
          goto LABEL_22;
        }
      }

      else
      {
        if (fidoAdvertiseRate == 10)
        {
          v14 = "2 seconds";
          goto LABEL_22;
        }

        if (fidoAdvertiseRate == 15)
        {
          v14 = "1022.5 ms";
          goto LABEL_22;
        }
      }
    }

    else if (fidoAdvertiseRate <= 44)
    {
      if (fidoAdvertiseRate == 40)
      {
        v14 = "181.25 ms";
        goto LABEL_22;
      }

      if (fidoAdvertiseRate == 42)
      {
        v14 = "120 ms";
        goto LABEL_22;
      }
    }

    else
    {
      switch(fidoAdvertiseRate)
      {
        case '-':
          v14 = "60 ms";
          goto LABEL_22;
        case '2':
          v14 = "30 ms";
          goto LABEL_22;
        case '<':
          v14 = "20 ms";
LABEL_22:
          NSAppendPrintF_safe(&v56, ", fdPD <%@>, %s", v11, v14);
          objc_storeStrong(&location, v56);

          goto LABEL_23;
      }
    }

    v14 = "270 ms";
    goto LABEL_22;
  }

- (void)advertisingAddressChanged
{
  if (dword_1008D6460 <= 30 && (dword_1008D6460 != -1 || _LogCategory_Initialize(&dword_1008D6460, 30LL))) {
    LogPrintF_safe( &dword_1008D6460,  "-[CBAdvertiserDaemon advertisingAddressChanged]",  30LL,  "Advertising address changed");
  }
  self->_addressChanged = 1;
  -[CBAdvertiserDaemon _updateIfNeededWithBlock:](self, "_updateIfNeededWithBlock:", &stru_10087FFA0);
}

- (void)setAdvertiserArray:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10003C808;
  v5[3] = &unk_10087FFC8;
  id v6 = [a3 copy];
  id v7 = self;
  id v4 = v6;
  -[CBAdvertiserDaemon _updateIfNeededWithBlock:](self, "_updateIfNeededWithBlock:", v5);
}

- (void)setSpatialInteractionAdvertiseRate:(int)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_10003C910;
  v3[3] = &unk_10087FFF0;
  int v4 = a3;
  v3[4] = self;
  -[CBAdvertiserDaemon _updateIfNeededWithBlock:](self, "_updateIfNeededWithBlock:", v3);
}

- (void)setSpatialInteractionFlags:(unsigned __int8)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_10003C994;
  v3[3] = &unk_100880018;
  unsigned __int8 v4 = a3;
  v3[4] = self;
  -[CBAdvertiserDaemon _updateIfNeededWithBlock:](self, "_updateIfNeededWithBlock:", v3);
}

- (void)setSpatialInteractionIdentifiers:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10003CA34;
  v5[3] = &unk_10087FFC8;
  id v6 = [a3 copy];
  id v7 = self;
  id v4 = v6;
  -[CBAdvertiserDaemon _updateIfNeededWithBlock:](self, "_updateIfNeededWithBlock:", v5);
}

- (void)setSpatialInteractionUWBConfigData:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10003CB64;
  v5[3] = &unk_10087FFC8;
  id v6 = [a3 copy];
  id v7 = self;
  id v4 = v6;
  -[CBAdvertiserDaemon _updateIfNeededWithBlock:](self, "_updateIfNeededWithBlock:", v5);
}

- (void)setSpatialInteractionPresenceConfigData:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10003CC94;
  v5[3] = &unk_10087FFC8;
  id v6 = [a3 copy];
  id v7 = self;
  id v4 = v6;
  -[CBAdvertiserDaemon _updateIfNeededWithBlock:](self, "_updateIfNeededWithBlock:", v5);
}

- (void)activateWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (!self->_activateCalled)
  {
    self->_activateCalled = 1;
    dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_10003CDE0;
    v7[3] = &unk_100880040;
    v7[4] = self;
    id v8 = v4;
    dispatch_async(dispatchQueue, v7);
  }
}

- (void)_activateWithCompletion:(id)a3
{
  uint64_t v10 = (void (**)(id, void *))a3;
  if (self->_invalidateCalled)
  {
    uint64_t v4 = CBErrorF(4294896148LL, "Activate after invalidate");
    id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
    if (dword_1008D6460 <= 90
      && (dword_1008D6460 != -1 || _LogCategory_Initialize(&dword_1008D6460, 90LL)))
    {
      uint64_t clientID = self->_clientID;
      uint64_t v7 = CUPrintNSError(v5);
      id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
      LogPrintF_safe( &dword_1008D6460,  "-[CBAdvertiserDaemon _activateWithCompletion:]",  90LL,  "### Activate failed: CID 0x%X, %@",  clientID,  v8);
    }

    v10[2](v10, v5);
  }

  else
  {
    if (dword_1008D6460 <= 30
      && (dword_1008D6460 != -1 || _LogCategory_Initialize(&dword_1008D6460, 30LL)))
    {
      LogPrintF_safe( &dword_1008D6460,  "-[CBAdvertiserDaemon _activateWithCompletion:]",  30LL,  "Activate: CID 0x%X",  self->_clientID);
    }

    if (!self->_wiproxObservering)
    {
      v9 = [NSNotificationCenter defaultCenter];
      [v9 addObserver:self selector:"_wiproxChanged:" name:@"WPDaemonServerStateChanged" object:0];
      self->_wiproxObservering = 1;
    }

    -[CBAdvertiserDaemon _update](self, "_update");
    v10[2](v10, 0LL);
  }
}

- (void)invalidate
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10003CFE4;
  block[3] = &unk_10087EEC8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_invalidate
{
  if (self->_wiproxObservering)
  {
    v3 = [NSNotificationCenter defaultCenter];
    [v3 removeObserver:self name:@"WPDaemonServerStateChanged" object:0];
    self->_wiproxObservering = 0;
  }

  id v11 = [qword_1008F1F50 advertisingManager];
  -[CBStackBLEAdvertiser invalidate](self->_fidoStackAdvertiser, "invalidate");
  fidoStackAdvertiser = self->_fidoStackAdvertiser;
  self->_fidoStackAdvertiser = 0LL;

  -[CBAdvertiserDaemon _wiProxInvalidate:](self, "_wiProxInvalidate:", &self->_airdropWiProxContext);
  -[CBAdvertiserDaemon _wiProxInvalidate:](self, "_wiProxInvalidate:", &self->_airplaySourceWiProxContext);
  -[CBAdvertiserDaemon _wiProxInvalidate:](self, "_wiProxInvalidate:", &self->_airplayTargetWiProxContext);
  -[CBAdvertiserDaemon _wiProxInvalidate:](self, "_wiProxInvalidate:", &self->_dsInfoWiProxContext);
  -[CBAdvertiserDaemon _wiProxInvalidate:](self, "_wiProxInvalidate:", &self->_heySiriWiProxContext);
  -[CBAdvertiserDaemon _wiProxInvalidate:](self, "_wiProxInvalidate:", &self->_nearbyActionV1WiProxContext);
  -[CBAdvertiserDaemon _wiProxInvalidate:](self, "_wiProxInvalidate:", &self->_nearbyActionV2WiProxContext);
  -[CBAdvertiserDaemon _wiProxInvalidate:](self, "_wiProxInvalidate:", &self->_nearbyInfoWiProxContext);
  -[CBAdvertiserDaemon _wiProxInvalidate:](self, "_wiProxInvalidate:", &self->_nearbyInfoV2WiProxContext);
  -[CBAdvertiserDaemon _wiProxInvalidate:](self, "_wiProxInvalidate:", &self->_nearbyActionNoWakeWiProxContext);
  -[CBAdvertiserDaemon _wiProxInvalidate:](self, "_wiProxInvalidate:", &self->_spatialInteractionWiProxContext);
  -[CBStackBLEAdvertiser invalidate](self->_saStackAdvertiser, "invalidate");
  saStackAdvertiser = self->_saStackAdvertiser;
  self->_saStackAdvertiser = 0LL;

  id v6 = self->_spatialInteractionWiProxUUID;
  uint64_t v7 = self->_spatialInteractionAdvertisingRequest;
  if (v7)
  {
    if (v11 && v6)
    {
      if (dword_1008D6460 <= 30
        && (dword_1008D6460 != -1 || _LogCategory_Initialize(&dword_1008D6460, 30LL)))
      {
        LogPrintF_safe( &dword_1008D6460,  "-[CBAdvertiserDaemon _invalidate]",  30LL,  "Spatial advertise stop for invalidate");
      }

      [v11 removeAdvertisingRequest:v7 forDaemon:v6];
    }

    spatialInteractionAdvertisingRequest = self->_spatialInteractionAdvertisingRequest;
    self->_spatialInteractionAdvertisingRequest = 0LL;
  }

  -[CBStackBLEAdvertiser invalidate](self->_appleTypeStackAdvertiser, "invalidate");
  appleTypeStackAdvertiser = self->_appleTypeStackAdvertiser;
  self->_appleTypeStackAdvertiser = 0LL;

  -[CBStackBLEAdvertiser invalidate](self->_watchSetupStackAdvertiser, "invalidate");
  watchSetupStackAdvertiser = self->_watchSetupStackAdvertiser;
  self->_watchSetupStackAdvertiser = 0LL;

  -[CBAdvertiserDaemon _invalidated](self, "_invalidated");
}

- (void)_invalidated
{
  if (self->_invalidateCalled && !self->_invalidateDone)
  {
    self->_invalidateCalled = 1;
    id v7 = objc_retainBlock(self->_invalidationHandler);
    id invalidationHandler = self->_invalidationHandler;
    self->_id invalidationHandler = 0LL;

    id stateChangedHandler = self->_stateChangedHandler;
    self->_id stateChangedHandler = 0LL;

    id v5 = v7;
    if (v7)
    {
      (*((void (**)(id))v7 + 2))(v7);
      id v5 = v7;
    }

    self->_invalidateDone = 1;
    if (dword_1008D6460 <= 30)
    {
      if (dword_1008D6460 != -1 || (v6 = _LogCategory_Initialize(&dword_1008D6460, 30LL), id v5 = v7, v6))
      {
        LogPrintF_safe(&dword_1008D6460, "-[CBAdvertiserDaemon _invalidated]", 30LL, "Invalidated");
        id v5 = v7;
      }
    }
  }

- (BOOL)needsToRun
{
  return self->_airdropWiProxContext.payloadData
      || self->_airplaySourceWiProxContext.payloadData
      || self->_airplayTargetWiProxContext.payloadData
      || self->_nearbyActionV1WiProxContext.payloadData
      || self->_nearbyActionV2WiProxContext.payloadData
      || self->_nearbyInfoWiProxContext.payloadData
      || self->_nearbyInfoV2WiProxContext.payloadData
      || self->_nearbyActionNoWakeWiProxContext.payloadData
      || -[NSArray count](self->_saPayloadSegments, "count") != 0;
}

- (void)_updateIfNeededWithBlock:(id)a3
{
  if ((*((unsigned int (**)(id, SEL))a3 + 2))(a3, a2) && self->_activateCalled && !self->_changesPending)
  {
    self->_changesPending = 1;
    dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10003D458;
    block[3] = &unk_10087EEC8;
    block[4] = self;
    dispatch_async(dispatchQueue, block);
  }

- (void)_update
{
  if (!self->_invalidateCalled)
  {
    if (self->_changesPending)
    {
      self->_changesPending = 0;
      -[CBAdvertiserDaemon _updateFIDOPayload](self, "_updateFIDOPayload");
      -[CBAdvertiserDaemon _updateAirDropPayload:](self, "_updateAirDropPayload:", &self->_airdropWiProxContext);
      -[CBAdvertiserDaemon _updateAirPlaySourcePayload:]( self,  "_updateAirPlaySourcePayload:",  &self->_airplaySourceWiProxContext);
      -[CBAdvertiserDaemon _updateAirPlayTargetPayload:]( self,  "_updateAirPlayTargetPayload:",  &self->_airplayTargetWiProxContext);
      -[CBAdvertiserDaemon _updateDSInfoPayload:](self, "_updateDSInfoPayload:", &self->_dsInfoWiProxContext);
      -[CBAdvertiserDaemon _updateHeySiriPayload:](self, "_updateHeySiriPayload:", &self->_heySiriWiProxContext);
      -[CBAdvertiserDaemon _updateNearbyActionV1Payload:]( self,  "_updateNearbyActionV1Payload:",  &self->_nearbyActionV1WiProxContext);
      -[CBAdvertiserDaemon _updateNearbyActionV2Payload:]( self,  "_updateNearbyActionV2Payload:",  &self->_nearbyActionV2WiProxContext);
      -[CBAdvertiserDaemon _updateNearbyInfoPayload:]( self,  "_updateNearbyInfoPayload:",  &self->_nearbyInfoWiProxContext);
      -[CBAdvertiserDaemon _updateNearbyInfoV2Payload:]( self,  "_updateNearbyInfoV2Payload:",  &self->_nearbyInfoV2WiProxContext);
      -[CBAdvertiserDaemon _updateNearbyActionNoWakePayload:]( self,  "_updateNearbyActionNoWakePayload:",  &self->_nearbyActionNoWakeWiProxContext);
      uint64_t v3 = _os_feature_enabled_impl("BluetoothFeatures", "SafetyAlerts");
      -[CBAdvertiserDaemon _updateSpatialInteractionPayload:]( self,  "_updateSpatialInteractionPayload:",  &self->_spatialInteractionWiProxContext);
      -[CBAdvertiserDaemon _updateWatchSetupPayload](self, "_updateWatchSetupPayload");
    }

    -[CBAdvertiserDaemon _updateFIDOAdvertising](self, "_updateFIDOAdvertising");
    -[CBAdvertiserDaemon _wiProxUpdateAdvertising:](self, "_wiProxUpdateAdvertising:", &self->_airdropWiProxContext);
    -[CBAdvertiserDaemon _wiProxUpdateAdvertising:]( self,  "_wiProxUpdateAdvertising:",  &self->_airplaySourceWiProxContext);
    -[CBAdvertiserDaemon _wiProxUpdateAdvertising:]( self,  "_wiProxUpdateAdvertising:",  &self->_airplayTargetWiProxContext);
    -[CBAdvertiserDaemon _wiProxUpdateAdvertising:](self, "_wiProxUpdateAdvertising:", &self->_dsInfoWiProxContext);
    -[CBAdvertiserDaemon _wiProxUpdateAdvertising:](self, "_wiProxUpdateAdvertising:", &self->_heySiriWiProxContext);
    -[CBAdvertiserDaemon _wiProxUpdateAdvertising:]( self,  "_wiProxUpdateAdvertising:",  &self->_nearbyActionV1WiProxContext);
    -[CBAdvertiserDaemon _wiProxUpdateAdvertising:]( self,  "_wiProxUpdateAdvertising:",  &self->_nearbyActionV2WiProxContext);
    -[CBAdvertiserDaemon _wiProxUpdateAdvertising:](self, "_wiProxUpdateAdvertising:", &self->_nearbyInfoWiProxContext);
    -[CBAdvertiserDaemon _wiProxUpdateAdvertising:]( self,  "_wiProxUpdateAdvertising:",  &self->_nearbyInfoV2WiProxContext);
    uint64_t v4 = _os_feature_enabled_impl("BluetoothFeatures", "SafetyAlerts");
    -[CBAdvertiserDaemon _updateSpatialInteractionAdvertising:]( self,  "_updateSpatialInteractionAdvertising:",  &self->_spatialInteractionWiProxContext);
    -[CBAdvertiserDaemon _wiProxUpdateAdvertising:]( self,  "_wiProxUpdateAdvertising:",  &self->_nearbyActionNoWakeWiProxContext);
    -[CBAdvertiserDaemon _updateWatchSetupAdvertising](self, "_updateWatchSetupAdvertising");
    self->_addressChanged = 0;
    if (self->_stateChanged)
    {
      self->_stateChanged = 0;
      id v5 = (void (**)(void))objc_retainBlock(self->_stateChangedHandler);
      if (v5)
      {
        int v6 = v5;
        v5[2]();
        id v5 = v6;
      }
    }
  }

- (id)_encryptInvitationPayload:(const void *)a3 payloadLength:(unint64_t)a4 authTag:(id)a5 irkData:(id)a6 keyInfo:(const void *)a7 keyInfoLength:(unint64_t)a8
{
  id v13 = a5;
  id v14 = a6;
  if (!a3)
  {
LABEL_33:
    uint64_t v27 = 0LL;
    goto LABEL_11;
  }

  if (![v13 length])
  {
    if (dword_1008D6460 <= 90
      && (dword_1008D6460 != -1 || _LogCategory_Initialize(&dword_1008D6460, 90LL)))
    {
      LogPrintF_safe( &dword_1008D6460,  "-[CBAdvertiserDaemon _encryptInvitationPayload:payloadLength:authTag:irkData:keyInfo:keyInfoLength:]",  90LL,  "Not encrypting invitation because BLE AuthTag is not available");
    }

    goto LABEL_33;
  }

  if (![v14 length])
  {
    if (dword_1008D6460 <= 90
      && (dword_1008D6460 != -1 || _LogCategory_Initialize(&dword_1008D6460, 90LL)))
    {
      LogPrintF_safe( &dword_1008D6460,  "-[CBAdvertiserDaemon _encryptInvitationPayload:payloadLength:authTag:irkData:keyInfo:keyInfoLength:]",  90LL,  "Not encrypting invitation because self IRK is not available");
    }

    goto LABEL_33;
  }

  if (a4 >= 2) {
    a4 = 2LL;
  }
  memset(v35, 0, sizeof(v35));
  uint64_t v15 = kCryptoHashDescriptor_SHA512;
  id v31 = v14;
  id v16 = v14;
  id v17 = [v16 bytes];
  id v18 = [v16 length];
  id v19 = v13;
  id v20 = v13;
  CryptoHKDF(v15, v17, v18, [v20 bytes], [v20 length], a7, a8, 32, v35);
  __int16 v34 = 0;
  uint64_t v21 = __memcpy_chk(&v34, a3, a4, 2LL);
  uint64_t v22 = ccaes_ecb_encrypt_mode(v21);
  size_t v23 = (((uint64_t (*)(void))ccecb_context_size)() + 15) & 0xFFFFFFFFFFFFFFF0LL;
  v24 = (char *)&v30 - v23;
  bzero((char *)&v30 - v23, v23);
  int v25 = ccecb_init(v22, v24, 32LL, v35);
  if (v25)
  {
    if (dword_1008D6460 > 90)
    {
      uint64_t v27 = 0LL;
      id v13 = v19;
      goto LABEL_10;
    }

    int v29 = v25;
    id v13 = v19;
    if (dword_1008D6460 != -1 || _LogCategory_Initialize(&dword_1008D6460, 90LL)) {
      LogPrintF_safe( &dword_1008D6460,  "-[CBAdvertiserDaemon _encryptInvitationPayload:payloadLength:authTag:irkData:keyInfo:keyInfoLength:]",  90LL,  "Unable to start encrypting invitation due to %d",  v29);
    }
    goto LABEL_35;
  }

  uint64_t v33 = 0LL;
  memset(v32, 0, sizeof(v32));
  if (cclr_aes_init(v32, v22, v24, 8 * a4, 10LL))
  {
    id v13 = v19;
    if (dword_1008D6460 <= 90)
    {
      id v14 = v31;
      if (dword_1008D6460 != -1 || _LogCategory_Initialize(&dword_1008D6460, 90LL)) {
        LogPrintF_safe( &dword_1008D6460,  "-[CBAdvertiserDaemon _encryptInvitationPayload:payloadLength:authTag:irkData:keyInfo:keyInfoLength:]",  90LL,  "Unable to init encryption process for invitation due to %d");
      }
      goto LABEL_39;
    }

- (void)_stackAppleTypeUpdateAdvertising:(id *)a3
{
  id v5 = a3->var10;
  p_appleTypeStackAdvertiser = &self->_appleTypeStackAdvertiser;
  appleTypeStackAdvertiser = self->_appleTypeStackAdvertiser;
  id v23 = v5;
  if (!v5)
  {
    if (!appleTypeStackAdvertiser)
    {
LABEL_65:
      a3->var7 = 0;
      goto LABEL_66;
    }

    if (dword_1008D6460 <= 30
      && (dword_1008D6460 != -1 || _LogCategory_Initialize(&dword_1008D6460, 30LL)))
    {
      LogPrintF_safe( &dword_1008D6460,  "-[CBAdvertiserDaemon _stackAppleTypeUpdateAdvertising:]",  30LL,  "%@ advertise SA stop",  a3->var2);
    }

    -[CBStackBLEAdvertiser invalidate](*p_appleTypeStackAdvertiser, "invalidate");
    v9 = *p_appleTypeStackAdvertiser;
    *p_appleTypeStackAdvertiser = 0LL;
LABEL_64:

    goto LABEL_65;
  }

  id v8 = appleTypeStackAdvertiser;
  if (v8)
  {
    v9 = v8;
    id var2 = a3->var2;
    uint64_t v11 = CUPrintNSDataHex(v23, 100LL, 1LL);
    uint64_t v12 = objc_claimAutoreleasedReturnValue(v11);
    id v13 = (void *)v12;
    int var5 = a3->var5;
    if (var5 <= 39)
    {
      if (var5 > 19)
      {
        if (var5 == 20)
        {
          uint64_t v15 = "350 ms";
          goto LABEL_52;
        }
      }

      else
      {
        if (var5 == 10)
        {
          uint64_t v15 = "2 seconds";
          goto LABEL_52;
        }

        if (var5 == 15)
        {
          uint64_t v15 = "1022.5 ms";
          goto LABEL_52;
        }
      }
    }

    else if (var5 <= 44)
    {
      if (var5 == 40)
      {
        uint64_t v15 = "181.25 ms";
        goto LABEL_52;
      }

      if (var5 == 42)
      {
        uint64_t v15 = "120 ms";
        goto LABEL_52;
      }
    }

    else
    {
      switch(var5)
      {
        case '-':
          uint64_t v15 = "60 ms";
          goto LABEL_52;
        case '2':
          uint64_t v15 = "30 ms";
          goto LABEL_52;
        case '<':
          uint64_t v15 = "20 ms";
LABEL_52:
          LogPrintF_safe( &dword_1008D6460,  "-[CBAdvertiserDaemon _stackAppleTypeUpdateAdvertising:]",  30LL,  "%@ advertise SA update: <%@>, rate %s",  var2,  v12,  v15);

LABEL_61:
          -[CBStackBLEAdvertiser setAdvertiseRate:](v9, "setAdvertiseRate:", a3->var5);
          -[CBStackBLEAdvertiser setAdvertiseEnableEPA:](v9, "setAdvertiseEnableEPA:", a3->var4);
          if (a3->var3 == 15) {
            -[CBStackBLEAdvertiser setNearbyActionData:](v9, "setNearbyActionData:", v23);
          }
          -[CBStackBLEAdvertiser activate](v9, "activate");
          goto LABEL_64;
      }
    }

    uint64_t v15 = "270 ms";
    goto LABEL_52;
  }

  if (dword_1008D6460 <= 30 && (dword_1008D6460 != -1 || _LogCategory_Initialize(&dword_1008D6460, 30LL)))
  {
    id v16 = a3->var2;
    uint64_t v17 = CUPrintNSDataHex(v23, 100LL, 1LL);
    uint64_t v18 = objc_claimAutoreleasedReturnValue(v17);
    id v19 = (void *)v18;
    int v20 = a3->var5;
    if (v20 <= 39)
    {
      if (v20 > 19)
      {
        if (v20 == 20)
        {
          uint64_t v21 = "350 ms";
          goto LABEL_58;
        }
      }

      else
      {
        if (v20 == 10)
        {
          uint64_t v21 = "2 seconds";
          goto LABEL_58;
        }

        if (v20 == 15)
        {
          uint64_t v21 = "1022.5 ms";
          goto LABEL_58;
        }
      }
    }

    else if (v20 <= 44)
    {
      if (v20 == 40)
      {
        uint64_t v21 = "181.25 ms";
        goto LABEL_58;
      }

      if (v20 == 42)
      {
        uint64_t v21 = "120 ms";
        goto LABEL_58;
      }
    }

    else
    {
      switch(v20)
      {
        case '-':
          uint64_t v21 = "60 ms";
          goto LABEL_58;
        case '2':
          uint64_t v21 = "30 ms";
          goto LABEL_58;
        case '<':
          uint64_t v21 = "20 ms";
LABEL_58:
          LogPrintF_safe( &dword_1008D6460,  "-[CBAdvertiserDaemon _stackAppleTypeUpdateAdvertising:]",  30LL,  "%@ advertise SA start: <%@>, rate %s",  v16,  v18,  v21);

          goto LABEL_59;
      }
    }

    uint64_t v21 = "270 ms";
    goto LABEL_58;
  }

- (void)_wiproxAppendDescription:(id *)a3 context:(id *)a4 verbose:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a4->var10;
  if (!v8) {
    goto LABEL_26;
  }
  id v22 = *a3;
  id var2 = a4->var2;
  id v10 = v22;
  uint64_t v11 = CUPrintNSDataHex(v8, 100LL, 1LL);
  uint64_t v12 = [v11 claimAutoreleasedReturnValue];
  id v13 = (void *)v12;
  int var5 = a4->var5;
  if (var5 <= 39)
  {
    if (var5 > 19)
    {
      if (var5 != 20)
      {
LABEL_16:
        uint64_t v15 = "270 ms";
        goto LABEL_22;
      }

      uint64_t v15 = "350 ms";
    }

    else
    {
      if (var5 != 10)
      {
        if (var5 == 15)
        {
          uint64_t v15 = "1022.5 ms";
          goto LABEL_22;
        }

        goto LABEL_16;
      }

      uint64_t v15 = "2 seconds";
    }
  }

  else if (var5 <= 44)
  {
    if (var5 != 40)
    {
      if (var5 == 42)
      {
        uint64_t v15 = "120 ms";
        goto LABEL_22;
      }

      goto LABEL_16;
    }

    uint64_t v15 = "181.25 ms";
  }

  else
  {
    switch(var5)
    {
      case '-':
        uint64_t v15 = "60 ms";
        break;
      case '2':
        uint64_t v15 = "30 ms";
        break;
      case '<':
        uint64_t v15 = "20 ms";
        break;
      default:
        goto LABEL_16;
    }
  }

- (void)_wiproxChanged:(id)a3
{
  id v4 = a3;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10003E0E8;
  block[3] = &unk_10087EEC8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_wiProxInvalidate:(id *)a3
{
  if (a3->var8
    && dword_1008D6460 <= 30
    && (dword_1008D6460 != -1 || _LogCategory_Initialize(&dword_1008D6460, 30LL)))
  {
    LogPrintF_safe( &dword_1008D6460,  "-[CBAdvertiserDaemon _wiProxInvalidate:]",  30LL,  "%@ linger cancel for invalidate",  a3->var2);
  }

  a3->var8 = 0;
  id var9 = a3->var9;
  if (var9)
  {
    BOOL v5 = (dispatch_source_s *)var9;
    dispatch_source_cancel(v5);
    id v6 = a3->var9;
    a3->id var9 = 0LL;
  }

  id v11 = a3->var11;
  id v7 = a3->var6;
  if (v7)
  {
    id v8 = [qword_1008F1F50 advertisingManager];
    if (v8) {
      BOOL v9 = v11 == 0LL;
    }
    else {
      BOOL v9 = 1;
    }
    if (!v9)
    {
      if (dword_1008D6460 <= 30
        && (dword_1008D6460 != -1 || _LogCategory_Initialize(&dword_1008D6460, 30LL)))
      {
        LogPrintF_safe( &dword_1008D6460,  "-[CBAdvertiserDaemon _wiProxInvalidate:]",  30LL,  "%@ advertise WP stop for invalidate",  a3->var2);
      }

      [v8 removeAdvertisingRequest:v7 forDaemon:v11];
    }

    id var6 = a3->var6;
    a3->id var6 = 0LL;
  }
}

- (void)_wiProxUpdateAdvertising:(id *)a3
{
  if (a3->var7 || self->_addressChanged)
  {
    if (-[CBDaemonServer prefWiProxAdvertising](self->_daemonServer, "prefWiProxAdvertising")
      && (BOOL v5 = (void *)objc_claimAutoreleasedReturnValue([(id)qword_1008F1F50 advertisingManager])) != 0)
    {
      id v29 = v5;
      id v6 = [v5 state];
      if (v6 == (id)3)
      {
        id v7 = a3->var11;
        if (!v7)
        {
          id v7 = [NSUUID UUID];
          objc_storeStrong(&a3->var11, v7);
        }

        id v8 = a3->var10;
        p_id var6 = &a3->var6;
        id v10 = a3->var6;
        if (v10)
        {
          if (v8) {
            id v11 = "for restart";
          }
          else {
            id v11 = "";
          }
          if (dword_1008D6460 < 31
            && (dword_1008D6460 != -1 || _LogCategory_Initialize(&dword_1008D6460, 30LL)))
          {
            if (self->_addressChanged) {
              uint64_t v12 = "for address change";
            }
            else {
              uint64_t v12 = v11;
            }
            LogPrintF_safe( &dword_1008D6460,  "-[CBAdvertiserDaemon _wiProxUpdateAdvertising:]",  30LL,  "%@ advertise WP stop %s",  a3->var2,  v12);
          }

          [v29 removeAdvertisingRequest:v10 forDaemon:v7];
          id v14 = *p_var6;
          *p_id var6 = 0LL;
        }

        if (v8)
        {
          uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue( +[WPAdvertisingRequest requestForClientType:]( &OBJC_CLASS___WPAdvertisingRequest,  "requestForClientType:",  a3->var3));
          objc_storeStrong(&a3->var6, v15);
          [v15 setAdvertisingData:v8];
          int var5 = a3->var5;
          uint64_t v17 = 290LL;
          uint64_t v18 = 48LL;
          uint64_t v19 = 32LL;
          if (var5 != 60) {
            uint64_t v19 = 290LL;
          }
          if (var5 != 50) {
            uint64_t v18 = v19;
          }
          uint64_t v20 = 192LL;
          uint64_t v21 = 96LL;
          if (var5 != 45) {
            uint64_t v21 = 290LL;
          }
          if (var5 != 42) {
            uint64_t v20 = v21;
          }
          if (var5 <= 49) {
            uint64_t v18 = v20;
          }
          uint64_t v22 = 996LL;
          uint64_t v23 = 432LL;
          if (var5 != 30) {
            uint64_t v23 = 290LL;
          }
          if (var5 != 20) {
            uint64_t v22 = v23;
          }
          if (var5 == 15) {
            uint64_t v17 = 1636LL;
          }
          if (var5 == 10) {
            uint64_t v17 = 3200LL;
          }
          if (var5 > 19) {
            uint64_t v17 = v22;
          }
          if (var5 <= 41) {
            uint64_t v24 = v17;
          }
          else {
            uint64_t v24 = v18;
          }
          [v15 setAdvertisingRate:v24];
          [v15 setConnectable:a3->var0];
          [v15 setIsRanging:a3->var1];
          [v15 setEnableEPAForAdvertising:a3->var4];
          [v15 setStopOnAdvertisingAddressChange:1];
          if (dword_1008D6460 <= 30
            && (dword_1008D6460 != -1 || _LogCategory_Initialize(&dword_1008D6460, 30LL)))
          {
            id var2 = a3->var2;
            uint64_t v26 = CUPrintNSDataHex(v8, 100LL, 1LL);
            uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
            LogPrintF_safe( &dword_1008D6460,  "-[CBAdvertiserDaemon _wiProxUpdateAdvertising:]",  30,  "%@ advertise WP start: <%@>, rate %.2f ms",  var2,  v27,  (double)(uint64_t)[v15 advertisingRate] * 0.625);
          }

          [v29 addAdvertisingRequest:v15 forDaemon:v7];
        }

        a3->var7 = 0;
      }

      else if (dword_1008D6460 <= 30)
      {
        id v28 = v6;
        if (dword_1008D6460 != -1 || _LogCategory_Initialize(&dword_1008D6460, 30LL)) {
          LogPrintF_safe( &dword_1008D6460,  "-[CBAdvertiserDaemon _wiProxUpdateAdvertising:]",  30LL,  "%@ advertise WP defer state: %d",  a3->var2,  v28);
        }
      }

      id v13 = v29;
    }

    else
    {
      if (a3->var3 == 15) {
        -[CBAdvertiserDaemon _stackAppleTypeUpdateAdvertising:](self, "_stackAppleTypeUpdateAdvertising:", a3);
      }
      id v13 = 0LL;
    }
  }

- (BOOL)_wiProxUpdateLinger:(id *)a3 active:(BOOL)a4
{
  if (a4)
  {
    if (a3->var8
      && dword_1008D6460 <= 30
      && (dword_1008D6460 != -1 || _LogCategory_Initialize(&dword_1008D6460, 30LL)))
    {
      LogPrintF_safe( &dword_1008D6460,  "-[CBAdvertiserDaemon _wiProxUpdateLinger:active:]",  30LL,  "%@ linger cancel for active",  a3->var2);
    }

    a3->var8 = 0;
    id var9 = a3->var9;
    if (var9)
    {
      id v8 = (dispatch_source_s *)var9;
      dispatch_source_cancel(v8);
      id v9 = a3->var9;
      a3->id var9 = 0LL;
    }

    return 0;
  }

  if (a3->var8)
  {
    if (!a3->var9)
    {
      if (dword_1008D6460 <= 30
        && (dword_1008D6460 != -1 || _LogCategory_Initialize(&dword_1008D6460, 30LL)))
      {
        LogPrintF_safe( &dword_1008D6460,  "-[CBAdvertiserDaemon _wiProxUpdateLinger:active:]",  30LL,  "%@ linger ended",  a3->var2);
      }

      BOOL v6 = 0;
      a3->var8 = 0;
      self->_stateChanged = 1;
      return v6;
    }

    return 1;
  }

  if (!a3->var10) {
    return 0;
  }
  if (a3->var9) {
    return 1;
  }
  if (dword_1008D6460 <= 30 && (dword_1008D6460 != -1 || _LogCategory_Initialize(&dword_1008D6460, 30LL))) {
    LogPrintF_safe( &dword_1008D6460,  "-[CBAdvertiserDaemon _wiProxUpdateLinger:active:]",  30LL,  "%@ linger start: %d seconds",  a3->var2,  5LL);
  }
  BOOL v6 = 1;
  a3->var8 = 1;
  dispatch_source_t v11 = dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_timer,  0LL,  0LL,  (dispatch_queue_t)self->_dispatchQueue);
  id v12 = a3->var9;
  a3->id var9 = v11;
  id v13 = v11;

  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472LL;
  handler[2] = sub_10003E8C8;
  handler[3] = &unk_100880068;
  handler[5] = self;
  handler[6] = a3;
  handler[4] = v13;
  dispatch_source_set_event_handler(v13, handler);
  CUDispatchTimerSet(v13, 5.0, -1.0, 1.0);
  dispatch_activate(v13);

  return v6;
}

- (void)_wiProxUpdatePayload:(id *)a3 payloadData:(id)a4 advertiseRate:(int)a5 advertiseEnableEPA:(BOOL)a6
{
  id v10 = a4;
  id var10 = a3->var10;
  id v26 = v10;
  id v12 = var10;
  if (v12 == v26)
  {
  }

  else
  {
    if ((v26 == 0LL) == (v12 != 0LL))
    {

      goto LABEL_11;
    }

    unsigned int v13 = [v26 isEqual:v12];

    if (!v13) {
      goto LABEL_11;
    }
  }

  if (a3->var5 != a5)
  {
LABEL_11:
    id var2 = a3->var2;
    uint64_t v18 = CUPrintNSDataHex(a3->var10, 100LL, 1LL);
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
    uint64_t v20 = CUPrintNSDataHex(v26, 100LL, 1LL);
    uint64_t v21 = [v20 autorelease];
    uint64_t v22 = (void *)v21;
    int var5 = a3->var5;
    if (var5 > 39)
    {
      if (var5 <= 44)
      {
        if (var5 == 40)
        {
          uint64_t v24 = "Medium";
          goto LABEL_41;
        }

        if (var5 == 42)
        {
          uint64_t v24 = "MediumMid";
          goto LABEL_41;
        }
      }

      else
      {
        switch(var5)
        {
          case '-':
            uint64_t v24 = "MediumHigh";
            goto LABEL_41;
          case '2':
            uint64_t v24 = "High";
            goto LABEL_41;
          case '<':
            uint64_t v24 = "Max";
            goto LABEL_41;
        }
      }
    }

    else if (var5 <= 14)
    {
      if (!var5)
      {
        uint64_t v24 = "Default";
        goto LABEL_41;
      }

      if (var5 == 10)
      {
        uint64_t v24 = "Periodic";
        goto LABEL_41;
      }
    }

    else
    {
      switch(var5)
      {
        case 15:
          uint64_t v24 = "PeriodicHigh";
          goto LABEL_41;
        case 20:
          uint64_t v24 = "Background";
          goto LABEL_41;
        case 30:
          uint64_t v24 = "Low";
          goto LABEL_41;
      }
    }

    uint64_t v24 = "?";
LABEL_41:
    if (a5 > 39)
    {
      if (a5 <= 44)
      {
        if (a5 == 40)
        {
          int v25 = "Medium";
          goto LABEL_65;
        }

        if (a5 == 42)
        {
          int v25 = "MediumMid";
          goto LABEL_65;
        }
      }

      else
      {
        switch(a5)
        {
          case '-':
            int v25 = "MediumHigh";
            goto LABEL_65;
          case '2':
            int v25 = "High";
            goto LABEL_65;
          case '<':
            int v25 = "Max";
            goto LABEL_65;
        }
      }
    }

    else if (a5 <= 14)
    {
      if (!a5)
      {
        int v25 = "Default";
        goto LABEL_65;
      }

      if (a5 == 10)
      {
        int v25 = "Periodic";
        goto LABEL_65;
      }
    }

    else
    {
      switch(a5)
      {
        case 15:
          int v25 = "PeriodicHigh";
          goto LABEL_65;
        case 20:
          int v25 = "Background";
          goto LABEL_65;
        case 30:
          int v25 = "Low";
LABEL_65:
          LogPrintF_safe( &dword_1008D6460,  "-[CBAdvertiserDaemon _wiProxUpdatePayload:payloadData:advertiseRate:advertiseEnableEPA:]",  30LL,  "%@ updated: <%@> -> <%@>, rate %s -> %s",  var2,  v19,  v21,  v24,  v25);

LABEL_66:
          a3->int var5 = a5;
          objc_storeStrong(&a3->var10, a4);
          a3->var7 = 1;
          a3->var4 = a6;
          goto LABEL_67;
      }
    }

    int v25 = "?";
    goto LABEL_65;
  }

  if (dword_1008D6460 <= 10 && (dword_1008D6460 != -1 || _LogCategory_Initialize(&dword_1008D6460, 10LL)))
  {
    id v14 = a3->var2;
    uint64_t v15 = CUPrintNSDataHex(v26, 100LL, 1LL);
    id v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    LogPrintF_safe( &dword_1008D6460,  "-[CBAdvertiserDaemon _wiProxUpdatePayload:payloadData:advertiseRate:advertiseEnableEPA:]",  10LL,  "%@ unchanged: <%@>",  v14,  v16);
  }

- (void)_updateAirPlaySourcePayload:(id *)a3
{
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  BOOL v5 = self->_advertiserArray;
  id v6 = -[NSArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v22,  v26,  16LL);
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v23;
    while (2)
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v23 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v22 + 1) + 8LL * (void)i);
        unsigned int v11 = [v10 airplaySourceFlags];
        if (v11)
        {
          char v17 = v11;
          id v14 = [v10 airplaySourceUWBConfigData];
          id v15 = [v10 advertiseRate];
          unsigned int v13 = (void *)[v10 airplaySourceAuthTagData];

          id v16 = objc_alloc_init(&OBJC_CLASS___NSMutableData);
          if ([v13 length] == (id)3) {
            char v18 = v17 | 0x10;
          }
          else {
            char v18 = v17 & 0xEF;
          }
          char v21 = v18;
          -[NSMutableData appendBytes:length:](v16, "appendBytes:length:", &v21, 1LL);
          if ((v18 & 8) != 0 && [v14 length] == (id)1) {
            -[NSMutableData appendData:](v16, "appendData:", v14);
          }
          if ([v13 length] == (id)3) {
            -[NSMutableData appendData:](v16, "appendData:", v13);
          }
          uint64_t v12 = 1LL;
          goto LABEL_19;
        }
      }

      id v7 = -[NSArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v22,  v26,  16LL);
      if (v7) {
        continue;
      }
      break;
    }
  }

  uint64_t v12 = 0LL;
  unsigned int v13 = 0LL;
  id v14 = 0LL;
  id v15 = 0LL;
  id v16 = 0LL;
LABEL_19:
  if (-[CBAdvertiserDaemon _wiProxUpdateLinger:active:](self, "_wiProxUpdateLinger:active:", a3, v12))
  {
    char v20 = 0x80;
    uint64_t v19 = -[NSData initWithBytes:length:](objc_alloc(&OBJC_CLASS___NSData), "initWithBytes:length:", &v20, 1LL);

    id v16 = (NSMutableData *)v19;
  }

  -[CBAdvertiserDaemon _wiProxUpdatePayload:payloadData:advertiseRate:advertiseEnableEPA:]( self,  "_wiProxUpdatePayload:payloadData:advertiseRate:advertiseEnableEPA:",  a3,  v16,  v15,  0LL);
}

- (void)_updateAirPlayTargetPayload:(id *)a3
{
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  BOOL v5 = self->_advertiserArray;
  id v6 = -[NSArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v21,  v26,  16LL);
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v22;
    while (2)
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v22 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v21 + 1) + 8LL * (void)i);
        unsigned int v11 = [v10 airplayTargetFlags];
        if (v11)
        {
          unsigned __int8 v15 = v11;
          unsigned __int8 v16 = [v10 airplayTargetConfigSeed];
          unsigned int v17 = [v10 airplayTargetIPv4];
          unsigned int v18 = [v10 airplayTargetPort];
          id v13 = [v10 advertiseRate];

          uint64_t v25 = v15;
          BYTE1(v25) = v16;
          BYTE2(v25) = HIBYTE(v17);
          BYTE3(v25) = BYTE2(v17);
          BYTE4(v25) = BYTE1(v17);
          BYTE5(v25) = v17;
          if ((v15 & 0x10) != 0)
          {
            HIWORD(v25) = __rev16(v18);
            uint64_t v19 = 8LL;
          }

          else
          {
            uint64_t v19 = 6LL;
          }

          id v14 = -[NSData initWithBytes:length:](objc_alloc(&OBJC_CLASS___NSData), "initWithBytes:length:", &v25, v19);
          uint64_t v12 = 1LL;
          goto LABEL_14;
        }
      }

      id v7 = -[NSArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v21,  v26,  16LL);
      if (v7) {
        continue;
      }
      break;
    }
  }

  uint64_t v12 = 0LL;
  id v13 = 0LL;
  id v14 = 0LL;
LABEL_14:
  if (-[CBAdvertiserDaemon _wiProxUpdateLinger:active:](self, "_wiProxUpdateLinger:active:", a3, v12, (void)v21))
  {
    LOBYTE(v25) = 0x80;
    char v20 = -[NSData initWithBytes:length:](objc_alloc(&OBJC_CLASS___NSData), "initWithBytes:length:", &v25, 1LL);

    id v14 = v20;
  }

  -[CBAdvertiserDaemon _wiProxUpdatePayload:payloadData:advertiseRate:advertiseEnableEPA:]( self,  "_wiProxUpdatePayload:payloadData:advertiseRate:advertiseEnableEPA:",  a3,  v14,  v13,  0LL);
}

- (void)_updateDSInfoPayload:(id *)a3
{
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  BOOL v5 = self->_advertiserArray;
  id v6 = -[NSArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v15,  v19,  16LL);
  if (v6)
  {
    uint64_t v7 = *(void *)v16;
    while (2)
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v5);
        }
        id v9 = *(void **)(*((void *)&v15 + 1) + 8LL * (void)i);
        unsigned int v10 = [v9 dsInfoVehicleConfidence];
        unsigned int v11 = [v9 dsInfoVehicleState];
        if (v10 | v11)
        {
          unsigned int v12 = v11;
          id v6 = [v9 advertiseRate];
          goto LABEL_11;
        }
      }

      id v6 = -[NSArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v15,  v19,  16LL);
      if (v6) {
        continue;
      }
      break;
    }
  }

  unsigned int v10 = 0;
  unsigned int v12 = 0;
LABEL_11:

  if (v10 | v12)
  {
    char v14 = v12 & 3 | (4 * (v10 & 0xF));
    id v13 = -[NSData initWithBytes:length:](objc_alloc(&OBJC_CLASS___NSData), "initWithBytes:length:", &v14, 1LL);
  }

  else
  {
    id v13 = 0LL;
  }

  -[CBAdvertiserDaemon _wiProxUpdatePayload:payloadData:advertiseRate:advertiseEnableEPA:]( self,  "_wiProxUpdatePayload:payloadData:advertiseRate:advertiseEnableEPA:",  a3,  v13,  v6,  0LL);
}

- (void)_updateFIDOAdvertising
{
  if (self->_fidoChanged)
  {
    uint64_t v3 = self->_fidoPayloadData;
    if (!v3)
    {
      if (dword_1008D6460 <= 30
        && (dword_1008D6460 != -1 || _LogCategory_Initialize(&dword_1008D6460, 30LL)))
      {
        LogPrintF_safe(&dword_1008D6460, "-[CBAdvertiserDaemon _updateFIDOAdvertising]", 30LL, "FIDO advertise stop");
      }

      -[CBStackBLEAdvertiser invalidate](self->_fidoStackAdvertiser, "invalidate");
      fidoStackAdvertiser = self->_fidoStackAdvertiser;
      self->_fidoStackAdvertiser = 0LL;

      goto LABEL_62;
    }

    id v4 = self->_fidoStackAdvertiser;
    if (v4)
    {
      BOOL v5 = v4;
      if (dword_1008D6460 > 30
        || dword_1008D6460 == -1 && !_LogCategory_Initialize(&dword_1008D6460, 30LL))
      {
        goto LABEL_61;
      }

      uint64_t v6 = CUPrintNSDataHex(v3, 100LL, 1LL);
      uint64_t v7 = objc_claimAutoreleasedReturnValue(v6);
      uint64_t v8 = (void *)v7;
      int fidoAdvertiseRate = self->_fidoAdvertiseRate;
      if (fidoAdvertiseRate <= 39)
      {
        if (fidoAdvertiseRate > 19)
        {
          if (fidoAdvertiseRate == 20)
          {
            unsigned int v10 = "350 ms";
            goto LABEL_52;
          }
        }

        else
        {
          if (fidoAdvertiseRate == 10)
          {
            unsigned int v10 = "2 seconds";
            goto LABEL_52;
          }

          if (fidoAdvertiseRate == 15)
          {
            unsigned int v10 = "1022.5 ms";
            goto LABEL_52;
          }
        }
      }

      else if (fidoAdvertiseRate <= 44)
      {
        if (fidoAdvertiseRate == 40)
        {
          unsigned int v10 = "181.25 ms";
          goto LABEL_52;
        }

        if (fidoAdvertiseRate == 42)
        {
          unsigned int v10 = "120 ms";
          goto LABEL_52;
        }
      }

      else
      {
        switch(fidoAdvertiseRate)
        {
          case '-':
            unsigned int v10 = "60 ms";
            goto LABEL_52;
          case '2':
            unsigned int v10 = "30 ms";
            goto LABEL_52;
          case '<':
            unsigned int v10 = "20 ms";
LABEL_52:
            LogPrintF_safe( &dword_1008D6460,  "-[CBAdvertiserDaemon _updateFIDOAdvertising]",  30LL,  "FIDO advertise update: <%@>, rate %s",  v7,  v10);

LABEL_61:
            -[CBStackBLEAdvertiser setAdvertiseRate:](v5, "setAdvertiseRate:", self->_fidoAdvertiseRate);
            id v18 = objc_alloc_init(&OBJC_CLASS___CBBLEServiceDataInfo);
            [v18 setServiceUUID16:65529];
            [v18 setServiceData:v3];
            id v20 = v18;
            uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  &v20,  1LL));
            -[CBStackBLEAdvertiser setServiceDataArray:](v5, "setServiceDataArray:", v19);

            -[CBStackBLEAdvertiser activate](v5, "activate");
LABEL_62:
            self->_fidoChanged = 0;
LABEL_63:

            return;
        }
      }

      unsigned int v10 = "270 ms";
      goto LABEL_52;
    }

    if (dword_1008D6460 > 30 || dword_1008D6460 == -1 && !_LogCategory_Initialize(&dword_1008D6460, 30LL))
    {
LABEL_59:
      __int128 v17 = (CBStackBLEAdvertiser *)objc_alloc_init((Class)objc_opt_class( -[CBStackAdaptor bleAdvertiserClass]( self->_stackAdaptor,  "bleAdvertiserClass")));
      if (!v17)
      {
        if (dword_1008D6460 <= 90
          && (dword_1008D6460 != -1 || _LogCategory_Initialize(&dword_1008D6460, 90LL)))
        {
          LogPrintF_safe( &dword_1008D6460,  "-[CBAdvertiserDaemon _updateFIDOAdvertising]",  90LL,  "### FIDO advertiser create failed");
        }

        goto LABEL_63;
      }

      BOOL v5 = v17;
      objc_storeStrong((id *)&self->_fidoStackAdvertiser, v17);
      -[CBStackBLEAdvertiser setDispatchQueue:](v5, "setDispatchQueue:", self->_dispatchQueue);
      goto LABEL_61;
    }

    uint64_t v11 = CUPrintNSDataHex(v3, 100LL, 1LL);
    uint64_t v12 = objc_claimAutoreleasedReturnValue(v11);
    id v13 = (void *)v12;
    int v14 = self->_fidoAdvertiseRate;
    if (v14 <= 39)
    {
      if (v14 > 19)
      {
        if (v14 == 20)
        {
          __int128 v15 = "350 ms";
          goto LABEL_58;
        }
      }

      else
      {
        if (v14 == 10)
        {
          __int128 v15 = "2 seconds";
          goto LABEL_58;
        }

        if (v14 == 15)
        {
          __int128 v15 = "1022.5 ms";
          goto LABEL_58;
        }
      }
    }

    else if (v14 <= 44)
    {
      if (v14 == 40)
      {
        __int128 v15 = "181.25 ms";
        goto LABEL_58;
      }

      if (v14 == 42)
      {
        __int128 v15 = "120 ms";
        goto LABEL_58;
      }
    }

    else
    {
      switch(v14)
      {
        case '-':
          __int128 v15 = "60 ms";
          goto LABEL_58;
        case '2':
          __int128 v15 = "30 ms";
          goto LABEL_58;
        case '<':
          __int128 v15 = "20 ms";
LABEL_58:
          LogPrintF_safe( &dword_1008D6460,  "-[CBAdvertiserDaemon _updateFIDOAdvertising]",  30LL,  "FIDO advertise start: <%@>, rate %s",  v12,  v15);

          goto LABEL_59;
      }
    }

    __int128 v15 = "270 ms";
    goto LABEL_58;
  }

- (void)_updateFIDOPayload
{
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  uint64_t v3 = self->_advertiserArray;
  id v4 = -[NSArray countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v25,  v29,  16LL);
  if (v4)
  {
    uint64_t v5 = *(void *)v26;
    while (2)
    {
      for (i = 0LL; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v26 != v5) {
          objc_enumerationMutation(v3);
        }
        uint64_t v7 = *(void **)(*((void *)&v25 + 1) + 8LL * (void)i);
        uint64_t v8 = [v7 fidoPayloadData];
        if (v8)
        {
          id v9 = (void *)v8;
          LODWORD(v4) = [v7 advertiseRate];
          goto LABEL_11;
        }
      }

      id v4 = -[NSArray countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v25,  v29,  16LL);
      if (v4) {
        continue;
      }
      break;
    }
  }

  id v9 = 0LL;
LABEL_11:

  fidoPayloadData = self->_fidoPayloadData;
  uint64_t v11 = v9;
  uint64_t v12 = fidoPayloadData;
  if (v11 == v12)
  {
  }

  else
  {
    id v13 = v12;
    if ((v11 == 0LL) == (v12 != 0LL))
    {

      goto LABEL_21;
    }

    unsigned int v14 = -[NSData isEqual:](v11, "isEqual:", v12);

    if (!v14) {
      goto LABEL_21;
    }
  }

  if ((_DWORD)v4 != self->_fidoAdvertiseRate)
  {
LABEL_21:
    uint64_t v17 = CUPrintNSDataHex(self->_fidoPayloadData, 100LL, 1LL);
    id v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
    uint64_t v19 = CUPrintNSDataHex(v11, 100LL, 1LL);
    uint64_t v20 = [v19 claimAutoreleasedReturnValue];
    __int128 v21 = (void *)v20;
    int fidoAdvertiseRate = self->_fidoAdvertiseRate;
    if (fidoAdvertiseRate > 39)
    {
      if (fidoAdvertiseRate <= 44)
      {
        if (fidoAdvertiseRate == 40)
        {
          __int128 v23 = "Medium";
          goto LABEL_51;
        }

        if (fidoAdvertiseRate == 42)
        {
          __int128 v23 = "MediumMid";
          goto LABEL_51;
        }
      }

      else
      {
        switch(fidoAdvertiseRate)
        {
          case '-':
            __int128 v23 = "MediumHigh";
            goto LABEL_51;
          case '2':
            __int128 v23 = "High";
            goto LABEL_51;
          case '<':
            __int128 v23 = "Max";
            goto LABEL_51;
        }
      }
    }

    else if (fidoAdvertiseRate <= 14)
    {
      if (!fidoAdvertiseRate)
      {
        __int128 v23 = "Default";
        goto LABEL_51;
      }

      if (fidoAdvertiseRate == 10)
      {
        __int128 v23 = "Periodic";
        goto LABEL_51;
      }
    }

    else
    {
      switch(fidoAdvertiseRate)
      {
        case 15:
          __int128 v23 = "PeriodicHigh";
          goto LABEL_51;
        case 20:
          __int128 v23 = "Background";
          goto LABEL_51;
        case 30:
          __int128 v23 = "Low";
          goto LABEL_51;
      }
    }

    __int128 v23 = "?";
LABEL_51:
    if ((int)v4 > 39)
    {
      if ((int)v4 <= 44)
      {
        if ((_DWORD)v4 == 40)
        {
          __int128 v24 = "Medium";
          goto LABEL_75;
        }

        if ((_DWORD)v4 == 42)
        {
          __int128 v24 = "MediumMid";
          goto LABEL_75;
        }
      }

      else
      {
        switch((_DWORD)v4)
        {
          case '-':
            __int128 v24 = "MediumHigh";
            goto LABEL_75;
          case '2':
            __int128 v24 = "High";
            goto LABEL_75;
          case '<':
            __int128 v24 = "Max";
            goto LABEL_75;
        }
      }
    }

    else if ((int)v4 <= 14)
    {
      if (!(_DWORD)v4)
      {
        __int128 v24 = "Default";
        goto LABEL_75;
      }

      if ((_DWORD)v4 == 10)
      {
        __int128 v24 = "Periodic";
        goto LABEL_75;
      }
    }

    else
    {
      switch((_DWORD)v4)
      {
        case 0xF:
          __int128 v24 = "PeriodicHigh";
          goto LABEL_75;
        case 0x14:
          __int128 v24 = "Background";
          goto LABEL_75;
        case 0x1E:
          __int128 v24 = "Low";
LABEL_75:
          LogPrintF_safe( &dword_1008D6460,  "-[CBAdvertiserDaemon _updateFIDOPayload]",  30LL,  "FIDO updated: <%@> -> <%@>, rate %s -> %s",  v18,  v20,  v23,  v24,  (void)v25);

LABEL_76:
          self->_int fidoAdvertiseRate = (int)v4;
          objc_storeStrong((id *)&self->_fidoPayloadData, v9);
          self->_fidoChanged = 1;
          goto LABEL_77;
      }
    }

    __int128 v24 = "?";
    goto LABEL_75;
  }

  if (dword_1008D6460 <= 10 && (dword_1008D6460 != -1 || _LogCategory_Initialize(&dword_1008D6460, 10LL)))
  {
    uint64_t v15 = CUPrintNSDataHex(v11, 100LL, 1LL);
    __int128 v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    LogPrintF_safe(&dword_1008D6460, "-[CBAdvertiserDaemon _updateFIDOPayload]", 10LL, "FIDO unchanged: <%@>", v16);
  }

- (void)_updateHeySiriPayload:(id *)a3
{
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  uint64_t v5 = self->_advertiserArray;
  id v6 = -[NSArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v20,  v25,  16LL);
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v21;
    while (2)
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v21 != v8) {
          objc_enumerationMutation(v5);
        }
        unsigned int v10 = *(void **)(*((void *)&v20 + 1) + 8LL * (void)i);
        unsigned int v11 = [v10 heySiriDeviceClass];
        if (v11)
        {
          __int16 v14 = v11;
          id v12 = [v10 advertiseRate];
          unsigned __int8 v15 = [v10 heySiriConfidence];
          unsigned __int16 v16 = (unsigned __int16)[v10 heySiriPerceptualHash];
          unsigned __int8 v17 = [v10 heySiriProductType];
          unsigned __int8 v18 = [v10 heySiriRandom];
          unsigned __int8 v19 = [v10 heySiriSNR];

          v24[0] = HIBYTE(v16);
          v24[1] = v16;
          v24[2] = v19;
          v24[3] = v15;
          v24[4] = HIBYTE(v14);
          v24[5] = v14;
          v24[6] = v18;
          v24[7] = v17;
          id v13 = -[NSData initWithBytes:length:](objc_alloc(&OBJC_CLASS___NSData), "initWithBytes:length:", v24, 8LL);
          goto LABEL_11;
        }
      }

      id v7 = -[NSArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v20,  v25,  16LL);
      if (v7) {
        continue;
      }
      break;
    }
  }

  id v12 = 0LL;
  id v13 = 0LL;
LABEL_11:
  -[CBAdvertiserDaemon _wiProxUpdatePayload:payloadData:advertiseRate:advertiseEnableEPA:]( self,  "_wiProxUpdatePayload:payloadData:advertiseRate:advertiseEnableEPA:",  a3,  v13,  v12,  0LL,  (void)v20);
}

- (void)_updateNearbyActionV1Payload:(id *)a3
{
  int v42 = 0;
  __int128 v38 = 0u;
  __int128 v39 = 0u;
  __int128 v40 = 0u;
  __int128 v41 = 0u;
  uint64_t v5 = self->_advertiserArray;
  id v6 = -[NSArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v38,  v43,  16LL);
  if (v6)
  {
    uint64_t v7 = *(void *)v39;
LABEL_3:
    uint64_t v8 = 0LL;
    while (1)
    {
      if (*(void *)v39 != v7) {
        objc_enumerationMutation(v5);
      }
      id v9 = *(void **)(*((void *)&v38 + 1) + 8 * v8);
      unsigned int v10 = [v9 nearbyActionType];
      if (v10) {
        break;
      }
      if (v6 == (id)++v8)
      {
        id v6 = -[NSArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v38,  v43,  16LL);
        if (v6) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }

    unsigned int v17 = v10;
    __int128 v28 = a3;
    unsigned int v18 = [v9 nearbyActionFlags];
    __int16 v19 = v18;
    int v20 = (v18 >> 8) & 0xF;
    int v42 = v20;
    uint64_t v15 = (uint64_t)[v9 advertiseRate];
    __int128 v21 = (void *)[v9 nearbyActionAuthTagData];
    if ([v21 length] == (id)3) {
      id v22 = v21;
    }
    else {
      id v22 = [CBAdvertiserDaemon selfAuthTag];
    }
    id v6 = v22;
    uint64_t v29 = [v9 nearbyActionTargetData];
    id v13 = v9;
    uint64_t v30 = [v13 watchSetupData];

    unsigned __int16 v16 = objc_alloc_init(&OBJC_CLASS___NSMutableData);
    char v37 = v19;
    -[NSMutableData appendBytes:length:](v16, "appendBytes:length:", &v37, 1LL);
    char v36 = v17;
    -[NSMutableData appendBytes:length:](v16, "appendBytes:length:", &v36, 1LL);
    uint64_t v23 = v17 - 37;
    if (v23 <= 0x30)
    {
      if (((1LL << (v17 - 37)) & 0x1000000000581LL) != 0)
      {
LABEL_18:
        unsigned int v24 = MGGetSInt32Answer(@"DeviceClassNumber", 0xFFFFFFFFLL);
        char v25 = 16 * v24;
        if (v24 > 0xF) {
          char v25 = 0;
        }
        char v35 = v25;
        __int128 v26 = (unsigned __int8 *)&v35;
        goto LABEL_21;
      }

      if (v23 == 17)
      {
        unsigned __int8 v34 = [v13 dsActionFlags];
        -[NSMutableData appendBytes:length:](v16, "appendBytes:length:", &v34, 1LL);
        unsigned __int8 v33 = [v13 dsActionMeasuredPower];
        -[NSMutableData appendBytes:length:](v16, "appendBytes:length:", &v33, 1LL);
        unsigned __int8 v32 = [v13 dsActionTieBreaker];
        __int128 v26 = &v32;
LABEL_21:
        -[NSMutableData appendBytes:length:](v16, "appendBytes:length:", v26, 1LL);
LABEL_22:
        uint64_t v5 = [v13 nearbyActionExtraData];
        if (v5) {
          -[NSMutableData appendData:](v16, "appendData:", v5);
        }
        uint64_t v11 = 1LL;
        if (v20 && (-[NSMutableData appendBytes:length:](v16, "appendBytes:length:", &v42, 1LL), v17 == 56))
        {
          __int16 v14 = (void *)v29;
          id v12 = (void *)v30;
          if ((v19 & 0x200) != 0 && v29)
          {
            -[NSMutableData appendData:](v16, "appendData:", v29);
            uint64_t v11 = 1LL;
          }

          a3 = v28;
        }

        else
        {
          a3 = v28;
          __int16 v14 = (void *)v29;
          id v12 = (void *)v30;
        }

        goto LABEL_31;
      }
    }

    if (v17 != 2)
    {
      if (v17 == 5 && v30) {
        -[NSMutableData appendData:](v16, "appendData:", v30);
      }
      goto LABEL_22;
    }

    goto LABEL_18;
  }

- (void)_updateNearbyActionV2Payload:(id *)a3
{
  id v4 = self;
  char v40 = 0;
  __int128 v36 = 0u;
  __int128 v37 = 0u;
  __int128 v38 = 0u;
  __int128 v39 = 0u;
  uint64_t v5 = self->_advertiserArray;
  id v6 = -[NSArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v36,  v42,  16LL);
  if (v6)
  {
    id v7 = v6;
    char v8 = 0;
    char v9 = 0;
    uint64_t v10 = *(void *)v37;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v37 != v10) {
          objc_enumerationMutation(v5);
        }
        unsigned int v12 = [*(id *)(*((void *)&v36 + 1) + 8 * (void)i) nearbyActionV2Type];
        unsigned int v13 = v12;
        char v40 = v12;
        if (v12)
        {
          if (v12 == 41) {
            char v8 = 1;
          }
          else {
            char v9 = 1;
          }
        }
      }

      id v7 = -[NSArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v36,  v42,  16LL);
    }

    while (v7);
  }

  else
  {
    unsigned int v13 = 0;
    char v8 = 0;
    char v9 = 0;
  }

  __int128 v34 = 0u;
  __int128 v35 = 0u;
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  __int16 v14 = v4->_advertiserArray;
  id v15 = -[NSArray countByEnumeratingWithState:objects:count:]( v14,  "countByEnumeratingWithState:objects:count:",  &v32,  v41,  16LL);
  if (v15)
  {
    id v16 = v15;
    uint64_t v29 = v4;
    uint64_t v17 = *(void *)v33;
    unsigned __int8 v18 = v8 & v9;
    while (2)
    {
      for (j = 0LL; j != v16; j = (char *)j + 1)
      {
        if (*(void *)v33 != v17) {
          objc_enumerationMutation(v14);
        }
        int v20 = *(void **)(*((void *)&v32 + 1) + 8LL * (void)j);
        unsigned int v21 = [v20 nearbyActionV2Type];
        unsigned int v13 = v21;
        char v40 = v21;
        if (v21)
        {
          if ((v18 & (v21 == 41)) != 1)
          {
            unsigned __int8 v27 = [v20 nearbyActionV2Flags];
            uint64_t v24 = (uint64_t)[v20 advertiseRate];
            uint64_t v23 = (void *)[v20 nearbyActionV2TargetData];
            char v22 = v27 & 0xFE;

            BOOL v26 = 1LL;
            id v4 = v29;
            goto LABEL_31;
          }

          if (dword_1008D6460 <= 90
            && (dword_1008D6460 != -1 || _LogCategory_Initialize(&dword_1008D6460, 90LL)))
          {
            LogPrintF_safe( &dword_1008D6460,  "-[CBAdvertiserDaemon _updateNearbyActionV2Payload:]",  90LL,  "### NearbyActionV2: Not advertising remote pairing");
          }
        }
      }

      id v16 = -[NSArray countByEnumeratingWithState:objects:count:]( v14,  "countByEnumeratingWithState:objects:count:",  &v32,  v41,  16LL);
      if (v16) {
        continue;
      }
      break;
    }

    id v4 = v29;
  }

  char v22 = 0;
  uint64_t v23 = 0LL;
  uint64_t v24 = 0LL;
  char v25 = 0LL;
  BOOL v26 = v13 != 0;
  if (v13)
  {
LABEL_31:
    char v25 = objc_alloc_init(&OBJC_CLASS___NSMutableData);
    char v31 = v22 | ([v23 length] == (id)3);
    -[NSMutableData appendBytes:length:](v25, "appendBytes:length:", &v31, 1LL);
    -[NSMutableData appendBytes:length:](v25, "appendBytes:length:", &v40, 1LL);
    if ([v23 length] == (id)3) {
      -[NSMutableData appendData:](v25, "appendData:", v23);
    }
  }

  if (-[CBAdvertiserDaemon _wiProxUpdateLinger:active:](v4, "_wiProxUpdateLinger:active:", a3, v26))
  {
    __int16 v30 = 13312;
    __int128 v28 = -[NSData initWithBytes:length:](objc_alloc(&OBJC_CLASS___NSData), "initWithBytes:length:", &v30, 2LL);

    uint64_t v24 = 50LL;
    char v25 = (NSMutableData *)v28;
  }

  -[CBAdvertiserDaemon _wiProxUpdatePayload:payloadData:advertiseRate:advertiseEnableEPA:]( v4,  "_wiProxUpdatePayload:payloadData:advertiseRate:advertiseEnableEPA:",  a3,  v25,  v24,  0LL);
}

- (void)_updateNearbyInfoPayload:(id *)a3
{
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  uint64_t v5 = self->_advertiserArray;
  id v6 = -[NSArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v23,  v27,  16LL);
  double v7 = 0.0;
  if (v6)
  {
    uint64_t v8 = *(void *)v24;
    while (2)
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v24 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v23 + 1) + 8LL * (void)i);
        unsigned int v11 = [v10 nearbyInfoFlags];
        unsigned int v12 = [v10 nearbyInfoStatusType];
        if (v11 | v12)
        {
          unsigned int v14 = v12;
          id v6 = [v10 advertiseRate];
          [v10 nearbyInfoStatusProgress];
          double v7 = v15;
          unsigned __int8 v13 = [v10 nearbyInfoStatusTime];
          goto LABEL_11;
        }
      }

      id v6 = -[NSArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v23,  v27,  16LL);
      if (v6) {
        continue;
      }
      break;
    }
  }

  unsigned int v11 = 0;
  unsigned __int8 v13 = 0;
  unsigned int v14 = 0;
LABEL_11:

  if (v11 | v14)
  {
    id v16 = objc_alloc_init(&OBJC_CLASS___NSMutableData);
    LOBYTE(v22) = (__rbit32(v11) >> 25) & 0x70;
    -[NSMutableData appendBytes:length:](v16, "appendBytes:length:", &v22, 1LL);
    LOBYTE(v22) = (v11 >> 6) & 4 | (v11 >> 4) & 8 | v11 & 0x20 | (16 * v11) & 0x80 | (((v11 & 0x10) != 0) << 6);
    if (v14)
    {
      LOBYTE(v22) = (v11 >> 6) & 4 | (v11 >> 4) & 8 | v11 & 0x20 | (16 * v11) & 0x80 | (((v11 & 0x10) != 0) << 6) | 1;
      -[NSMutableData appendBytes:length:](v16, "appendBytes:length:", &v22, 1LL);
      LOBYTE(v22) = 4;
      -[NSMutableData appendBytes:length:](v16, "appendBytes:length:", &v22, 1LL);
      LOBYTE(v22) = v14;
      -[NSMutableData appendBytes:length:](v16, "appendBytes:length:", &v22, 1LL);
      double v17 = 1.0;
      if (v7 <= 1.0) {
        double v17 = v7;
      }
      double v18 = v17 * 100.0;
      BOOL v19 = v17 < 0.0;
      double v20 = 0.0;
      if (!v19) {
        double v20 = v18;
      }
      LOBYTE(v22) = (int)v20;
      -[NSMutableData appendBytes:length:](v16, "appendBytes:length:", &v22, 1LL);
      LOBYTE(v22) = v13;
    }

    -[NSMutableData appendBytes:length:](v16, "appendBytes:length:", &v22, 1LL);
  }

  else
  {
    id v16 = 0LL;
  }

  if (-[CBAdvertiserDaemon _wiProxUpdateLinger:active:](self, "_wiProxUpdateLinger:active:", a3, (v11 | v14) != 0))
  {
    __int16 v22 = 0;
    unsigned int v21 = -[NSData initWithBytes:length:](objc_alloc(&OBJC_CLASS___NSData), "initWithBytes:length:", &v22, 2LL);

    id v16 = (NSMutableData *)v21;
  }

  -[CBAdvertiserDaemon _wiProxUpdatePayload:payloadData:advertiseRate:advertiseEnableEPA:]( self,  "_wiProxUpdatePayload:payloadData:advertiseRate:advertiseEnableEPA:",  a3,  v16,  v6,  0LL);
}

- (void)_updateNearbyInfoV2Payload:(id *)a3
{
  __int128 v34 = a3;
  __int16 v47 = 0;
  __int16 v46 = 0;
  __int128 v42 = 0u;
  __int128 v43 = 0u;
  __int128 v44 = 0u;
  __int128 v45 = 0u;
  id obj = self->_advertiserArray;
  id v3 = -[NSArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v42,  v48,  16LL);
  if (v3)
  {
    id v4 = v3;
    int v5 = 0;
    unsigned int v6 = 0;
    unsigned int v36 = 0;
    unsigned int v7 = 0;
    unsigned int v8 = 0;
    uint64_t v9 = 0LL;
    __int128 v41 = 0LL;
    int v40 = 0;
    uint64_t v38 = *(void *)v43;
    __int128 v39 = 0LL;
    while (1)
    {
      for (i = 0LL; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v43 != v38) {
          objc_enumerationMutation(obj);
        }
        unsigned int v11 = *(void **)(*((void *)&v42 + 1) + 8LL * (void)i);
        v6 |= objc_msgSend(v11, "nearbyInfoV2DecryptedFlags", v34);
        HIBYTE(v47) = v6;
        if (([v11 nearbyInfoV2Flags] & 4) != 0)
        {
          v5 |= 4u;
          LOBYTE(v47) = v5;
        }

        else if (!v5 && !(_BYTE)v6)
        {
          int v5 = 0;
          continue;
        }

        uint64_t v12 = v9;
        unsigned __int8 v13 = (void *)[v11 nearbyInfoV2AuthTagData];
        id v14 = [v13 length];

        uint64_t v15 = (uint64_t)v41;
        if (!v41 && v14 == (id)3) {
          uint64_t v15 = [v11 nearbyInfoV2AuthTagData];
        }
        __int128 v41 = (void *)v15;
        id v16 = [v11 nearbyInfoV2AuthIntegrityTagData];
        id v17 = [v16 length];

        uint64_t v9 = v12;
        if (!v12 && v17 == (id)3) {
          uint64_t v9 = [v11 nearbyInfoV2AuthIntegrityTagData];
        }
        if (v39)
        {
          if (!v8) {
            goto LABEL_27;
          }
        }

        else
        {
          double v18 = [v11 nearbyInfoV2RapportIRKData];
          id v19 = [v18 length];

          if (v19)
          {
            __int128 v39 = (void *)[v11 nearbyInfoV2RapportIRKData];
            if (!v8) {
              goto LABEL_27;
            }
          }

          else
          {
            __int128 v39 = 0LL;
            if (!v8)
            {
LABEL_27:
              unsigned int v8 = [v11 nearbyInfoV2InvitationCounter];
              HIBYTE(v46) = v8;
              if (v7) {
                continue;
              }
              goto LABEL_28;
            }
          }
        }

        if (v7) {
          continue;
        }
LABEL_28:
        if ([v11 nearbyInfoV2InvitationRouteType])
        {
          unsigned int v7 = [v11 nearbyInfoV2InvitationRouteType];
          LOBYTE(v46) = v7;
          unsigned int v36 = v7;
        }

        else
        {
          unsigned int v7 = 0;
        }
      }

      id v4 = -[NSArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v42,  v48,  16LL);
      if (!v4) {
        goto LABEL_35;
      }
    }
  }

  unsigned int v36 = 0;
  unsigned int v8 = 0;
  unsigned int v6 = 0;
  int v5 = 0;
  __int128 v39 = 0LL;
  uint64_t v9 = 0LL;
  __int128 v41 = 0LL;
  int v40 = 0;
LABEL_35:

  if (!v5 && !(_BYTE)v6)
  {
    double v20 = (void *)v9;
    unsigned int v21 = 0LL;
    __int16 v22 = 0LL;
    __int128 v23 = v34;
    __int128 v24 = self;
LABEL_55:
    -[CBAdvertiserDaemon _wiProxUpdatePayload:payloadData:advertiseRate:advertiseEnableEPA:]( v24,  "_wiProxUpdatePayload:payloadData:advertiseRate:advertiseEnableEPA:",  v23,  v22,  v40,  0LL,  v34);

    __int16 v22 = v21;
    goto LABEL_56;
  }

  __int128 v25 = objc_alloc_init(&OBJC_CLASS___NSMutableData);
  __int16 v22 = v25;
  if (v8) {
    BOOL v26 = v36 == 0;
  }
  else {
    BOOL v26 = 1;
  }
  char v27 = !v26;
  double v20 = (void *)v9;
  char v28 = v6 & 0xFC | v27;
  if (((v41 != 0LL) & (v6 >> 1) & (v9 != 0)) != 0) {
    char v29 = 2;
  }
  else {
    char v29 = 0;
  }
  HIBYTE(v47) = v28 | v29;
  -[NSMutableData appendBytes:length:](v25, "appendBytes:length:", &v47, 1LL, v34);
  __int128 v24 = self;
  uint64_t v30 = objc_claimAutoreleasedReturnValue( -[CBAdvertiserDaemon _encryptInvitationPayload:payloadLength:authTag:irkData:keyInfo:keyInfoLength:]( self,  "_encryptInvitationPayload:payloadLength:authTag:irkData:keyInfo:keyInfoLength:",  (char *)&v47 + 1,  1LL,  v41,  v39,  "BT_CBNearbyInfoV2EncryptedFlagsV1",  33LL));
  if (v30)
  {
    unsigned int v21 = (NSMutableData *)v30;
    -[NSMutableData appendData:](v22, "appendData:", v30);
    if (v41) {
      -[NSMutableData appendData:](v22, "appendData:", v41);
    }
    __int128 v23 = v34;
    if (v20) {
      -[NSMutableData appendData:](v22, "appendData:", v20);
    }
    char v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableData dataWithCapacity:](&OBJC_CLASS___NSMutableData, "dataWithCapacity:", 2LL));
    __int128 v32 = v31;
    if (HIBYTE(v46))
    {
      [v31 appendBytes:(char *)&v46 + 1 length:1];
      [v32 appendBytes:&v46 length:1];
      __int128 v33 = (void *)objc_claimAutoreleasedReturnValue( -[CBAdvertiserDaemon _encryptInvitationPayload:payloadLength:authTag:irkData:keyInfo:keyInfoLength:]( self, "_encryptInvitationPayload:payloadLength:authTag:irkData:keyInfo:keyInfoLength:", [v32 bytes], 2, v41, v39, "BT_CBNearbyInfoV2EncryptedPayloadV1", 35));
      -[NSMutableData appendData:](v22, "appendData:", v33);
    }

    goto LABEL_55;
  }

- (void)_updateAirDropPayload:(id *)a3
{
  id v4 = self;
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  __int128 v35 = 0u;
  __int128 v36 = 0u;
  int v5 = self->_advertiserArray;
  id v6 = -[NSArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v33,  v38,  16LL);
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v34;
    while (2)
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v34 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v33 + 1) + 8LL * (void)i);
        unsigned int v11 = [v10 airdropVersion];
        if (v11)
        {
          char v15 = v11;
          char v31 = v4;
          __int128 v32 = a3;
          unsigned __int8 v16 = [v10 airdropFlags];
          uint64_t v12 = (void *)[v10 airdropTempAuthTagData];
          unsigned int v17 = [v10 airdropModel];
          unsigned __int16 v18 = (unsigned __int16)[v10 airdropHash1];
          unsigned __int16 v19 = (unsigned __int16)[v10 airdropHash2];
          unsigned __int16 v20 = (unsigned __int16)[v10 airdropHash3];
          unsigned __int16 v21 = (unsigned __int16)[v10 airdropHash4];
          unsigned int v30 = [v10 advertiseRate];
          unsigned int v22 = [v10 airdropConfigData];

          memset(&v37[1], 0, 7);
          id v23 = [v12 length];
          char v24 = v16 | 0x40;
          if (v23 != (id)3) {
            char v24 = v16 & 0xBF;
          }
          char v25 = v24 | 0x80;
          char v26 = v24 & 0x7F;
          if (v17) {
            char v26 = v25;
          }
          v37[0] = v26;
          if ([v12 length] == (id)3)
          {
            char v27 = [v12 bytes];
            char v28 = v27[2];
            *(_WORD *)&v37[1] = *(_WORD *)v27;
            v37[3] = v28;
          }

          v37[4] = v17;
          v37[8] = v15;
          v37[9] = HIBYTE(v18);
          v37[10] = v18;
          v37[11] = HIBYTE(v19);
          v37[12] = v19;
          v37[13] = HIBYTE(v20);
          v37[14] = v20;
          v37[15] = HIBYTE(v21);
          v37[16] = v21;
          char v29 = v22 | 1;
          if (!v22) {
            char v29 = 0;
          }
          v37[17] = v29;
          id v14 = -[NSData initWithBytes:length:](objc_alloc(&OBJC_CLASS___NSData), "initWithBytes:length:", v37, 18LL);
          id v4 = v31;
          a3 = v32;
          uint64_t v13 = v30;
          goto LABEL_19;
        }
      }

      id v7 = -[NSArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v33,  v38,  16LL);
      if (v7) {
        continue;
      }
      break;
    }
  }

  uint64_t v12 = 0LL;
  uint64_t v13 = 0LL;
  id v14 = 0LL;
LABEL_19:
  -[CBAdvertiserDaemon _wiProxUpdatePayload:payloadData:advertiseRate:advertiseEnableEPA:]( v4,  "_wiProxUpdatePayload:payloadData:advertiseRate:advertiseEnableEPA:",  a3,  v14,  v13,  0LL);
}

- (void)_updateSafetyAlertsAdvertising
{
  if (self->_saChanged)
  {
    id v3 = self->_saAdvAddresses;
    id v4 = self->_saPayloadSegments;
    if ((id)-[NSArray count](v3, "count") != (id)3 || (id)-[NSArray count](v4, "count") != (id)3)
    {
      if (dword_1008D6460 <= 30
        && (dword_1008D6460 != -1 || _LogCategory_Initialize(&dword_1008D6460, 30LL)))
      {
        LogPrintF_safe( &dword_1008D6460,  "-[CBAdvertiserDaemon _updateSafetyAlertsAdvertising]",  30LL,  "Safety Alerts advertise stop");
      }

      -[CBStackBLEAdvertiser invalidate](self->_saStackAdvertiser, "invalidate");
      saStackAdvertiser = self->_saStackAdvertiser;
      self->_saStackAdvertiser = 0LL;

      goto LABEL_49;
    }

    int v5 = self->_saStackAdvertiser;
    if (!v5)
    {
      if (dword_1008D6460 <= 30
        && (dword_1008D6460 != -1 || _LogCategory_Initialize(&dword_1008D6460, 30LL)))
      {
        uint64_t v15 = CUPrintNSObjectOneLine(v3);
        unsigned __int8 v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
        uint64_t v17 = CUPrintNSObjectOneLine(v4);
        unsigned __int16 v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
        unsigned __int16 v19 = sub_10003C63C(self->_saAdvertiseRate);
        LogPrintF_safe( &dword_1008D6460,  "-[CBAdvertiserDaemon _updateSafetyAlertsAdvertising]",  30LL,  "Safety Alerts advertise start: saAD <%@>, saPD <%@>, rate %s",  v16,  v18,  v19);
      }

      unsigned __int16 v20 = (CBStackBLEAdvertiser *)objc_alloc_init((Class)objc_opt_class( -[CBStackAdaptor bleAdvertiserClass]( self->_stackAdaptor,  "bleAdvertiserClass")));
      if (!v20)
      {
        if (dword_1008D6460 <= 90
          && (dword_1008D6460 != -1 || _LogCategory_Initialize(&dword_1008D6460, 90LL)))
        {
          LogPrintF_safe( &dword_1008D6460,  "-[CBAdvertiserDaemon _updateSafetyAlertsAdvertising]",  90LL,  "### Safety Alerts advertiser create failed");
        }

        goto LABEL_50;
      }

      id v6 = v20;
      objc_storeStrong((id *)&self->_saStackAdvertiser, v20);
      -[CBStackBLEAdvertiser setDispatchQueue:](v6, "setDispatchQueue:", self->_dispatchQueue);
      goto LABEL_41;
    }

    id v6 = v5;
    if (dword_1008D6460 > 30 || dword_1008D6460 == -1 && !_LogCategory_Initialize(&dword_1008D6460, 30LL))
    {
LABEL_41:
      -[CBStackBLEAdvertiser setAdvertiseRate:](v6, "setAdvertiseRate:", self->_saAdvertiseRate);
      char v29 = v3;
      -[CBStackBLEAdvertiser setSaAddressDataArray:](v6, "setSaAddressDataArray:", v3);
      unsigned __int16 v21 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
      __int128 v30 = 0u;
      __int128 v31 = 0u;
      __int128 v32 = 0u;
      __int128 v33 = 0u;
      unsigned int v22 = v4;
      id v23 = -[NSArray countByEnumeratingWithState:objects:count:]( v22,  "countByEnumeratingWithState:objects:count:",  &v30,  v34,  16LL);
      if (v23)
      {
        id v24 = v23;
        uint64_t v25 = *(void *)v31;
        do
        {
          for (i = 0LL; i != v24; i = (char *)i + 1)
          {
            if (*(void *)v31 != v25) {
              objc_enumerationMutation(v22);
            }
            uint64_t v27 = *(void *)(*((void *)&v30 + 1) + 8LL * (void)i);
            id v28 = objc_alloc_init(&OBJC_CLASS___CBBLEServiceDataInfo);
            [v28 setServiceUUID16:64672];
            [v28 setServiceData:v27];
            -[NSMutableArray addObject:](v21, "addObject:", v28);
          }

          id v24 = -[NSArray countByEnumeratingWithState:objects:count:]( v22,  "countByEnumeratingWithState:objects:count:",  &v30,  v34,  16LL);
        }

        while (v24);
      }

      -[CBStackBLEAdvertiser setSaServiceDataArray:](v6, "setSaServiceDataArray:", v21);
      -[CBStackBLEAdvertiser activate](v6, "activate");

      id v3 = v29;
LABEL_49:
      self->_saChanged = 0;
LABEL_50:

      return;
    }

    uint64_t v7 = CUPrintNSObjectOneLine(v3);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    uint64_t v9 = CUPrintNSObjectOneLine(v4);
    uint64_t v10 = [v9 autorelease];
    unsigned int v11 = (void *)v10;
    int saAdvertiseRate = self->_saAdvertiseRate;
    if (saAdvertiseRate <= 39)
    {
      if (saAdvertiseRate > 19)
      {
        if (saAdvertiseRate == 20)
        {
          uint64_t v13 = "350 ms";
          goto LABEL_40;
        }
      }

      else
      {
        if (saAdvertiseRate == 10)
        {
          uint64_t v13 = "2 seconds";
          goto LABEL_40;
        }

        if (saAdvertiseRate == 15)
        {
          uint64_t v13 = "1022.5 ms";
          goto LABEL_40;
        }
      }
    }

    else if (saAdvertiseRate <= 44)
    {
      if (saAdvertiseRate == 40)
      {
        uint64_t v13 = "181.25 ms";
        goto LABEL_40;
      }

      if (saAdvertiseRate == 42)
      {
        uint64_t v13 = "120 ms";
        goto LABEL_40;
      }
    }

    else
    {
      switch(saAdvertiseRate)
      {
        case '-':
          uint64_t v13 = "60 ms";
          goto LABEL_40;
        case '2':
          uint64_t v13 = "30 ms";
          goto LABEL_40;
        case '<':
          uint64_t v13 = "20 ms";
LABEL_40:
          LogPrintF_safe( &dword_1008D6460,  "-[CBAdvertiserDaemon _updateSafetyAlertsAdvertising]",  30LL,  "Safety Alerts advertise update: saAD <%@>, saPD <%@>, rate %s",  v8,  v10,  v13);

          goto LABEL_41;
      }
    }

    uint64_t v13 = "270 ms";
    goto LABEL_40;
  }

- (void)_updateSafetyAlertsPayload
{
  v2 = self;
  __int128 v76 = 0u;
  __int128 v77 = 0u;
  __int128 v78 = 0u;
  __int128 v79 = 0u;
  id obj = self->_advertiserArray;
  id v3 = -[NSArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v76,  v80,  16LL);
  v66 = v2;
  if (v3)
  {
    id v4 = v3;
    int v5 = 0LL;
    id v6 = 0LL;
    uint64_t v7 = 0LL;
    uint64_t v8 = *(void *)v77;
    do
    {
      uint64_t v9 = 0LL;
      uint64_t v10 = v5;
      unsigned int v11 = v6;
      do
      {
        if (*(void *)v77 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = *(void **)(*((void *)&v76 + 1) + 8LL * (void)v9);
        uint64_t v13 = (void *)[v12 safetyAlertsAlertData];

        id v6 = [v12 safetyAlertsAlertID];
        id v14 = [v12 safetyAlertsSignature];

        unsigned int v15 = [v12 safetyAlertsVersion];
        unsigned int v16 = v15;
        if (v13) {
          BOOL v17 = v6 == 0LL;
        }
        else {
          BOOL v17 = 1;
        }
        if (!v17 && v14 != 0LL && v15 != 0)
        {
          int v20 = [v12 advertiseRate];
          v2 = v66;
          goto LABEL_21;
        }

        uint64_t v9 = (char *)v9 + 1;
        uint64_t v10 = v14;
        unsigned int v11 = v6;
        int v5 = v14;
        uint64_t v7 = v13;
      }

      while (v4 != v9);
      id v4 = -[NSArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v76,  v80,  16LL);
      uint64_t v7 = v13;
    }

    while (v4);
    int v20 = 0;
    v2 = v66;
    id v14 = v5;
  }

  else
  {
    unsigned int v16 = 0;
    id v14 = 0LL;
    id v6 = 0LL;
    uint64_t v13 = 0LL;
    int v20 = 0;
  }

- (void)_updateSpatialInteractionAdvertising:(id *)a3
{
  if (self->_spatialInteractionChanged)
  {
    int v5 = (void *)[qword_1008F1F50 advertisingManager];
    id v22 = v5;
    if (v5)
    {
      if ([v5 state] == (id)3)
      {
        id v6 = self->_spatialInteractionWiProxUUID;
        if (!v6)
        {
          id v6 = [NSUUID UUID];
          objc_storeStrong((id *)&self->_spatialInteractionWiProxUUID, v6);
        }

        uint64_t v7 = self->_spatialInteractionPayloadData;
        p_spatialInteractionAdvertisingRequest = &self->_spatialInteractionAdvertisingRequest;
        uint64_t v9 = self->_spatialInteractionAdvertisingRequest;
        if (v9)
        {
          if (v7) {
            uint64_t v10 = "for restart";
          }
          else {
            uint64_t v10 = "";
          }
          if (dword_1008D6460 < 31
            && (dword_1008D6460 != -1 || _LogCategory_Initialize(&dword_1008D6460, 30LL)))
          {
            LogPrintF_safe( &dword_1008D6460,  "-[CBAdvertiserDaemon _updateSpatialInteractionAdvertising:]",  30LL,  "Spatial advertise stop %s",  v10);
          }

          [v22 removeAdvertisingRequest:v9 forDaemon:v6];
          unsigned int v11 = *p_spatialInteractionAdvertisingRequest;
          *p_spatialInteractionAdvertisingRequest = 0LL;
        }

        if (v7)
        {
          uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( +[WPAdvertisingRequest requestForClientType:]( &OBJC_CLASS___WPAdvertisingRequest,  "requestForClientType:",  19LL));
          objc_storeStrong((id *)&self->_spatialInteractionAdvertisingRequest, v12);
          [v12 setAdvertisingData:v7];
          int spatialInteractionAdvertiseRate = self->_spatialInteractionAdvertiseRate;
          uint64_t v14 = 290LL;
          uint64_t v15 = 48LL;
          uint64_t v16 = 32LL;
          if (spatialInteractionAdvertiseRate != 60) {
            uint64_t v16 = 290LL;
          }
          if (spatialInteractionAdvertiseRate != 50) {
            uint64_t v15 = v16;
          }
          uint64_t v17 = 192LL;
          uint64_t v18 = 96LL;
          if (spatialInteractionAdvertiseRate != 45) {
            uint64_t v18 = 290LL;
          }
          if (spatialInteractionAdvertiseRate != 42) {
            uint64_t v17 = v18;
          }
          if (spatialInteractionAdvertiseRate <= 49) {
            uint64_t v15 = v17;
          }
          uint64_t v19 = 996LL;
          uint64_t v20 = 432LL;
          if (spatialInteractionAdvertiseRate != 30) {
            uint64_t v20 = 290LL;
          }
          if (spatialInteractionAdvertiseRate != 20) {
            uint64_t v19 = v20;
          }
          if (spatialInteractionAdvertiseRate == 15) {
            uint64_t v14 = 1636LL;
          }
          if (spatialInteractionAdvertiseRate == 10) {
            uint64_t v14 = 3200LL;
          }
          if (spatialInteractionAdvertiseRate > 19) {
            uint64_t v14 = v19;
          }
          if (spatialInteractionAdvertiseRate <= 41) {
            uint64_t v21 = v14;
          }
          else {
            uint64_t v21 = v15;
          }
          [v12 setAdvertisingRate:v21];
          [v12 setConnectable:0];
          [v12 setIsRanging:1];
          [v12 setStopOnAdvertisingAddressChange:1];
          [v12 setEnableEPAForAdvertising:a3->var4];
          if (dword_1008D6460 <= 30
            && (dword_1008D6460 != -1 || _LogCategory_Initialize(&dword_1008D6460, 30LL)))
          {
            LogPrintF_safe( &dword_1008D6460,  "-[CBAdvertiserDaemon _updateSpatialInteractionAdvertising:]",  30,  "Spatial advertise start: <%@>, rate %.2f ms",  v7,  (double)(uint64_t)[v12 advertisingRate] * 0.625);
          }

          [v22 addAdvertisingRequest:v12 forDaemon:v6];
        }

        self->_spatialInteractionChanged = 0;
      }

      else if (dword_1008D6460 <= 30 {
             && (dword_1008D6460 != -1 || _LogCategory_Initialize(&dword_1008D6460, 30LL)))
      }
      {
        LogPrintF_safe( &dword_1008D6460,  "-[CBAdvertiserDaemon _updateSpatialInteractionAdvertising:]",  30LL,  "Spatial: Defer due to WiProx state: %d");
      }
    }

    else if (dword_1008D6460 <= 90 {
           && (dword_1008D6460 != -1 || _LogCategory_Initialize(&dword_1008D6460, 90LL)))
    }
    {
      LogPrintF_safe( &dword_1008D6460,  "-[CBAdvertiserDaemon _updateSpatialInteractionAdvertising:]",  90LL,  "### Spatial: No WiProx advertising manager");
    }
  }

- (void)_updateSpatialInteractionPayload:(id *)a3
{
  BOOL advertiserEnableEPA = self->_advertiserEnableEPA;
  id v6 = self->_spatialInteractionIdentifiers;
  if (v6)
  {
    uint64_t v7 = objc_alloc_init(&OBJC_CLASS___NSMutableData);
    p_uint64_t spatialInteractionFlags = &self->_spatialInteractionFlags;
    -[NSMutableData appendBytes:length:](v7, "appendBytes:length:", &self->_spatialInteractionFlags, 1LL);
    __int128 v26 = 0u;
    __int128 v27 = 0u;
    __int128 v24 = 0u;
    __int128 v25 = 0u;
    uint64_t v9 = self->_spatialInteractionIdentifiers;
    id v10 = -[NSArray countByEnumeratingWithState:objects:count:]( v9,  "countByEnumeratingWithState:objects:count:",  &v24,  v28,  16LL);
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v25;
      do
      {
        for (i = 0LL; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v25 != v12) {
            objc_enumerationMutation(v9);
          }
          -[NSMutableData appendData:](v7, "appendData:", *(void *)(*((void *)&v24 + 1) + 8LL * (void)i));
        }

        id v11 = -[NSArray countByEnumeratingWithState:objects:count:]( v9,  "countByEnumeratingWithState:objects:count:",  &v24,  v28,  16LL);
      }

      while (v11);
    }

    uint64_t v14 = self->_spatialInteractionUWBConfigData;
    if (v14)
    {
      -[NSMutableData appendData:](v7, "appendData:", v14);
      if ((char *)-[NSData length](v14, "length") - 1 > (char *)4)
      {
        char v23 = 0;
        int v15 = 5;
        do
        {
LABEL_22:
          -[NSMutableData appendBytes:length:](v7, "appendBytes:length:", &v23, 1LL);
          --v15;
        }

        while (v15);
LABEL_23:
        -[NSMutableData appendBytes:length:](v7, "appendBytes:length:", &self->_spatialInteractionConfigFlags, 1LL);
LABEL_24:
        uint64_t v16 = self->_spatialInteractionPresenceConfigData;
        if (v16) {
          -[NSMutableData appendData:](v7, "appendData:", v16);
        }
        spatialInteractionPayloadData = self->_spatialInteractionPayloadData;
        uint64_t v18 = v7;
        uint64_t v19 = spatialInteractionPayloadData;
        if (v18 == (NSMutableData *)v19)
        {
        }

        else
        {
          uint64_t v20 = v19;
          if ((v18 == 0LL) == (v19 != 0LL))
          {

            goto LABEL_35;
          }

          unsigned int v21 = -[NSMutableData isEqual:](v18, "isEqual:", v19);

          if (!v21)
          {
LABEL_35:
            if (dword_1008D6460 <= 30
              && (dword_1008D6460 != -1 || _LogCategory_Initialize(&dword_1008D6460, 30LL)))
            {
              LogPrintF_safe( &dword_1008D6460,  "-[CBAdvertiserDaemon _updateSpatialInteractionPayload:]",  30LL,  "Spatial updated: <%@> -> <%@>",  self->_spatialInteractionPayloadData,  v18);
            }

            objc_storeStrong((id *)&self->_spatialInteractionPayloadData, v7);
            self->_spatialInteractionChanged = 1;
            -[CBAdvertiserDaemon _wiProxUpdatePayload:payloadData:advertiseRate:advertiseEnableEPA:]( self,  "_wiProxUpdatePayload:payloadData:advertiseRate:advertiseEnableEPA:",  a3,  v18,  0LL,  advertiserEnableEPA);
LABEL_42:

            goto LABEL_45;
          }
        }

        if (dword_1008D6460 <= 10
          && (dword_1008D6460 != -1 || _LogCategory_Initialize(&dword_1008D6460, 10LL)))
        {
          LogPrintF_safe( &dword_1008D6460,  "-[CBAdvertiserDaemon _updateSpatialInteractionPayload:]",  10LL,  "Spatial unchanged: <%@>",  v18);
        }

        goto LABEL_42;
      }

      int v15 = (5 - -[NSData length](v14, "length"));
    }

    else
    {
      int v15 = 0;
    }

    char v23 = 0;
    if (!v15) {
      goto LABEL_23;
    }
    goto LABEL_22;
  }

  if (self->_spatialInteractionPayloadData)
  {
    if (dword_1008D6460 <= 30
      && (dword_1008D6460 != -1 || _LogCategory_Initialize(&dword_1008D6460, 30LL)))
    {
      LogPrintF_safe( &dword_1008D6460,  "-[CBAdvertiserDaemon _updateSpatialInteractionPayload:]",  30LL,  "Spatial cleared");
    }

    id v22 = self->_spatialInteractionPayloadData;
    self->_spatialInteractionPayloadData = 0LL;

    self->_spatialInteractionChanged = 1;
  }

- (void)_updateNearbyActionNoWakePayload:(id *)a3
{
  __int16 v22 = 0;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  int v5 = self->_advertiserArray;
  id v6 = -[NSArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v18,  v23,  16LL);
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v19;
    while (2)
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v19 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v18 + 1) + 8LL * (void)i);
        unsigned int v11 = [v10 nearbyActionNoWakeType];
        LOBYTE(v22) = v11;
        if (v11)
        {
          unsigned __int8 v17 = [v10 nearbyActionNWPrecisionFindingStatus];
          int v15 = (void *)[v10 nearbyActionNoWakeAuthTagData];
          uint64_t v14 = (void *)[v10 nearbyActionNoWakeConfigData];
          id v13 = [v10 advertiseRate];
          id v12 = [v10 enableEPAForLEAdvertisement];

          uint64_t v16 = objc_alloc_init(&OBJC_CLASS___NSMutableData);
          HIBYTE(v22) = v17 & 0xFE | ([v14 length] == (id)1);
          -[NSMutableData appendBytes:length:](v16, "appendBytes:length:", &v22, 1LL);
          -[NSMutableData appendBytes:length:](v16, "appendBytes:length:", (char *)&v22 + 1, 1LL);
          if ([v15 length] == (id)3) {
            -[NSMutableData appendData:](v16, "appendData:", v15);
          }
          if ([v14 length] == (id)1) {
            -[NSMutableData appendData:](v16, "appendData:", v14);
          }
          goto LABEL_14;
        }
      }

      id v7 = -[NSArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v18,  v23,  16LL);
      if (v7) {
        continue;
      }
      break;
    }
  }

  id v12 = 0LL;
  id v13 = 0LL;
  uint64_t v14 = 0LL;
  int v15 = 0LL;
  uint64_t v16 = 0LL;
LABEL_14:
  -[CBAdvertiserDaemon _wiProxUpdatePayload:payloadData:advertiseRate:advertiseEnableEPA:]( self,  "_wiProxUpdatePayload:payloadData:advertiseRate:advertiseEnableEPA:",  a3,  v16,  v13,  v12,  (void)v18);
}

- (void)_updateWatchSetupAdvertising
{
  if (self->_watchSetupChanged)
  {
    id v3 = self->_watchSetupPayloadData;
    if (!v3)
    {
      if (dword_1008D6460 <= 30
        && (dword_1008D6460 != -1 || _LogCategory_Initialize(&dword_1008D6460, 30LL)))
      {
        LogPrintF_safe( &dword_1008D6460,  "-[CBAdvertiserDaemon _updateWatchSetupAdvertising]",  30LL,  "WatchSetup advertise stop");
      }

      -[CBStackBLEAdvertiser invalidate](self->_watchSetupStackAdvertiser, "invalidate");
      watchSetupStackAdvertiser = self->_watchSetupStackAdvertiser;
      self->_watchSetupStackAdvertiser = 0LL;

      goto LABEL_62;
    }

    id v4 = self->_watchSetupStackAdvertiser;
    if (v4)
    {
      int v5 = v4;
      if (dword_1008D6460 > 30
        || dword_1008D6460 == -1 && !_LogCategory_Initialize(&dword_1008D6460, 30LL))
      {
        goto LABEL_61;
      }

      uint64_t v6 = CUPrintNSDataHex(v3, 100LL, 1LL);
      uint64_t v7 = objc_claimAutoreleasedReturnValue(v6);
      uint64_t v8 = (void *)v7;
      int watchSetupAdvertiseRate = self->_watchSetupAdvertiseRate;
      if (watchSetupAdvertiseRate <= 39)
      {
        if (watchSetupAdvertiseRate > 19)
        {
          if (watchSetupAdvertiseRate == 20)
          {
            id v10 = "350 ms";
            goto LABEL_52;
          }
        }

        else
        {
          if (watchSetupAdvertiseRate == 10)
          {
            id v10 = "2 seconds";
            goto LABEL_52;
          }

          if (watchSetupAdvertiseRate == 15)
          {
            id v10 = "1022.5 ms";
            goto LABEL_52;
          }
        }
      }

      else if (watchSetupAdvertiseRate <= 44)
      {
        if (watchSetupAdvertiseRate == 40)
        {
          id v10 = "181.25 ms";
          goto LABEL_52;
        }

        if (watchSetupAdvertiseRate == 42)
        {
          id v10 = "120 ms";
          goto LABEL_52;
        }
      }

      else
      {
        switch(watchSetupAdvertiseRate)
        {
          case '-':
            id v10 = "60 ms";
            goto LABEL_52;
          case '2':
            id v10 = "30 ms";
            goto LABEL_52;
          case '<':
            id v10 = "20 ms";
LABEL_52:
            LogPrintF_safe( &dword_1008D6460,  "-[CBAdvertiserDaemon _updateWatchSetupAdvertising]",  30LL,  "WatchSetup advertise update: <%@>, rate %s",  v7,  v10);

LABEL_61:
            -[CBStackBLEAdvertiser setAdvertiseRate:]( v5,  "setAdvertiseRate:",  self->_watchSetupAdvertiseRate);
            __int128 v18 = objc_alloc_init(&OBJC_CLASS___NSMutableData);
            char v21 = 6;
            -[NSMutableData appendBytes:length:](v18, "appendBytes:length:", &v21, 1LL);
            -[NSMutableData appendData:](v18, "appendData:", v3);
            id v19 = objc_alloc_init(&OBJC_CLASS___CBBLEServiceDataInfo);
            [v19 setServiceUUID16:65061];
            [v19 setServiceData:v18];
            [v19 setConnectable:1];
            id v22 = v19;
            __int128 v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  &v22,  1LL));
            -[CBStackBLEAdvertiser setServiceDataArray:](v5, "setServiceDataArray:", v20);

            -[CBStackBLEAdvertiser activate](v5, "activate");
LABEL_62:
            self->_watchSetupChanged = 0;
LABEL_63:

            return;
        }
      }

      id v10 = "270 ms";
      goto LABEL_52;
    }

    if (dword_1008D6460 > 30 || dword_1008D6460 == -1 && !_LogCategory_Initialize(&dword_1008D6460, 30LL))
    {
LABEL_59:
      unsigned __int8 v17 = (CBStackBLEAdvertiser *)objc_alloc_init((Class)objc_opt_class( -[CBStackAdaptor bleAdvertiserClass]( self->_stackAdaptor,  "bleAdvertiserClass")));
      if (!v17)
      {
        if (dword_1008D6460 <= 90
          && (dword_1008D6460 != -1 || _LogCategory_Initialize(&dword_1008D6460, 90LL)))
        {
          LogPrintF_safe( &dword_1008D6460,  "-[CBAdvertiserDaemon _updateWatchSetupAdvertising]",  90LL,  "### WatchSetup advertiser create failed");
        }

        goto LABEL_63;
      }

      int v5 = v17;
      objc_storeStrong((id *)&self->_watchSetupStackAdvertiser, v17);
      -[CBStackBLEAdvertiser setDispatchQueue:](v5, "setDispatchQueue:", self->_dispatchQueue);
      goto LABEL_61;
    }

    uint64_t v11 = CUPrintNSDataHex(v3, 100LL, 1LL);
    uint64_t v12 = objc_claimAutoreleasedReturnValue(v11);
    id v13 = (void *)v12;
    int v14 = self->_watchSetupAdvertiseRate;
    if (v14 <= 39)
    {
      if (v14 > 19)
      {
        if (v14 == 20)
        {
          int v15 = "350 ms";
          goto LABEL_58;
        }
      }

      else
      {
        if (v14 == 10)
        {
          int v15 = "2 seconds";
          goto LABEL_58;
        }

        if (v14 == 15)
        {
          int v15 = "1022.5 ms";
          goto LABEL_58;
        }
      }
    }

    else if (v14 <= 44)
    {
      if (v14 == 40)
      {
        int v15 = "181.25 ms";
        goto LABEL_58;
      }

      if (v14 == 42)
      {
        int v15 = "120 ms";
        goto LABEL_58;
      }
    }

    else
    {
      switch(v14)
      {
        case '-':
          int v15 = "60 ms";
          goto LABEL_58;
        case '2':
          int v15 = "30 ms";
          goto LABEL_58;
        case '<':
          int v15 = "20 ms";
LABEL_58:
          LogPrintF_safe( &dword_1008D6460,  "-[CBAdvertiserDaemon _updateWatchSetupAdvertising]",  30LL,  "WatchSetup advertise start: <%@>, rate %s",  v12,  v15);

          goto LABEL_59;
      }
    }

    int v15 = "270 ms";
    goto LABEL_58;
  }

- (void)_updateWatchSetupPayload
{
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  id v3 = self->_advertiserArray;
  id v4 = -[NSArray countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v25,  v29,  16LL);
  if (v4)
  {
    uint64_t v5 = *(void *)v26;
    while (2)
    {
      for (i = 0LL; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v26 != v5) {
          objc_enumerationMutation(v3);
        }
        uint64_t v7 = *(void **)(*((void *)&v25 + 1) + 8LL * (void)i);
        if ([v7 nearbyActionType] != 5)
        {
          uint64_t v8 = [v7 watchSetupData];
          if (v8)
          {
            uint64_t v9 = (void *)v8;
            LODWORD(v4) = [v7 advertiseRate];
            goto LABEL_12;
          }
        }
      }

      id v4 = -[NSArray countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v25,  v29,  16LL);
      if (v4) {
        continue;
      }
      break;
    }
  }

  uint64_t v9 = 0LL;
LABEL_12:

  watchSetupPayloadData = self->_watchSetupPayloadData;
  uint64_t v11 = v9;
  uint64_t v12 = watchSetupPayloadData;
  if (v11 == v12)
  {
  }

  else
  {
    id v13 = v12;
    if ((v11 == 0LL) == (v12 != 0LL))
    {

      goto LABEL_22;
    }

    unsigned int v14 = -[NSData isEqual:](v11, "isEqual:", v12);

    if (!v14) {
      goto LABEL_22;
    }
  }

  if ((_DWORD)v4 != self->_watchSetupAdvertiseRate)
  {
LABEL_22:
    uint64_t v17 = CUPrintNSDataHex(self->_watchSetupPayloadData, 100LL, 1LL);
    __int128 v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
    uint64_t v19 = CUPrintNSDataHex(v11, 100LL, 1LL);
    uint64_t v20 = [v19 autorelease];
    char v21 = (void *)v20;
    int watchSetupAdvertiseRate = self->_watchSetupAdvertiseRate;
    if (watchSetupAdvertiseRate > 39)
    {
      if (watchSetupAdvertiseRate <= 44)
      {
        if (watchSetupAdvertiseRate == 40)
        {
          char v23 = "Medium";
          goto LABEL_52;
        }

        if (watchSetupAdvertiseRate == 42)
        {
          char v23 = "MediumMid";
          goto LABEL_52;
        }
      }

      else
      {
        switch(watchSetupAdvertiseRate)
        {
          case '-':
            char v23 = "MediumHigh";
            goto LABEL_52;
          case '2':
            char v23 = "High";
            goto LABEL_52;
          case '<':
            char v23 = "Max";
            goto LABEL_52;
        }
      }
    }

    else if (watchSetupAdvertiseRate <= 14)
    {
      if (!watchSetupAdvertiseRate)
      {
        char v23 = "Default";
        goto LABEL_52;
      }

      if (watchSetupAdvertiseRate == 10)
      {
        char v23 = "Periodic";
        goto LABEL_52;
      }
    }

    else
    {
      switch(watchSetupAdvertiseRate)
      {
        case 15:
          char v23 = "PeriodicHigh";
          goto LABEL_52;
        case 20:
          char v23 = "Background";
          goto LABEL_52;
        case 30:
          char v23 = "Low";
          goto LABEL_52;
      }
    }

    char v23 = "?";
LABEL_52:
    if ((int)v4 > 39)
    {
      if ((int)v4 <= 44)
      {
        if ((_DWORD)v4 == 40)
        {
          __int128 v24 = "Medium";
          goto LABEL_76;
        }

        if ((_DWORD)v4 == 42)
        {
          __int128 v24 = "MediumMid";
          goto LABEL_76;
        }
      }

      else
      {
        switch((_DWORD)v4)
        {
          case '-':
            __int128 v24 = "MediumHigh";
            goto LABEL_76;
          case '2':
            __int128 v24 = "High";
            goto LABEL_76;
          case '<':
            __int128 v24 = "Max";
            goto LABEL_76;
        }
      }
    }

    else if ((int)v4 <= 14)
    {
      if (!(_DWORD)v4)
      {
        __int128 v24 = "Default";
        goto LABEL_76;
      }

      if ((_DWORD)v4 == 10)
      {
        __int128 v24 = "Periodic";
        goto LABEL_76;
      }
    }

    else
    {
      switch((_DWORD)v4)
      {
        case 0xF:
          __int128 v24 = "PeriodicHigh";
          goto LABEL_76;
        case 0x14:
          __int128 v24 = "Background";
          goto LABEL_76;
        case 0x1E:
          __int128 v24 = "Low";
LABEL_76:
          LogPrintF_safe( &dword_1008D6460,  "-[CBAdvertiserDaemon _updateWatchSetupPayload]",  30LL,  "WatchSetup updated: <%@> -> <%@>, rate %s -> %s",  v18,  v20,  v23,  v24,  (void)v25);

LABEL_77:
          self->_int watchSetupAdvertiseRate = (int)v4;
          objc_storeStrong((id *)&self->_watchSetupPayloadData, v9);
          self->_watchSetupChanged = 1;
          goto LABEL_78;
      }
    }

    __int128 v24 = "?";
    goto LABEL_76;
  }

  if (dword_1008D6460 <= 10 && (dword_1008D6460 != -1 || _LogCategory_Initialize(&dword_1008D6460, 10LL)))
  {
    uint64_t v15 = CUPrintNSDataHex(v11, 100LL, 1LL);
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    LogPrintF_safe( &dword_1008D6460,  "-[CBAdvertiserDaemon _updateWatchSetupPayload]",  10LL,  "WatchSetup unchanged: <%@>",  v16);
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

- (NSArray)advertiserArray
{
  return self->_advertiserArray;
}

- (BOOL)advertiserEnableEPA
{
  return self->_advertiserEnableEPA;
}

- (void)setAdvertiserEnableEPA:(BOOL)a3
{
  self->_BOOL advertiserEnableEPA = a3;
}

- (CBDaemonServer)daemonServer
{
  return self->_daemonServer;
}

- (void)setDaemonServer:(id)a3
{
}

- (NSData)selfAuthTag
{
  return self->_selfAuthTag;
}

- (void)setSelfAuthTag:(id)a3
{
}

- (CBStackAdaptor)stackAdaptor
{
  return self->_stackAdaptor;
}

- (void)setStackAdaptor:(id)a3
{
}

- (id)stateChangedHandler
{
  return self->_stateChangedHandler;
}

- (void)setStateChangedHandler:(id)a3
{
}

- (int)spatialInteractionAdvertiseRate
{
  return self->_spatialInteractionAdvertiseRate;
}

- (unsigned)spatialInteractionConfigFlags
{
  return self->_spatialInteractionConfigFlags;
}

- (void)setSpatialInteractionConfigFlags:(unsigned __int8)a3
{
  self->_spatialInteractionConfigFlags = a3;
}

- (unsigned)spatialInteractionFlags
{
  return self->_spatialInteractionFlags;
}

- (NSArray)spatialInteractionIdentifiers
{
  return self->_spatialInteractionIdentifiers;
}

- (NSData)spatialInteractionPresenceConfigData
{
  return self->_spatialInteractionPresenceConfigData;
}

- (NSData)spatialInteractionUWBConfigData
{
  return self->_spatialInteractionUWBConfigData;
}

- (void).cxx_destruct
{
}

@end
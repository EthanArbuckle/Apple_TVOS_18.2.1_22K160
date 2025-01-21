@interface CBStackBLEScannerBTStack
- ($F9CA75CC5B4E604BACB273E5A2091FCB)aggregateDiscoveryTypes;
- (BOOL)_addMfgScanIfNeeded:(unint64_t)a3 scanRequest:(void *)a4;
- (BOOL)screenOn;
- (NSArray)discoveryArray;
- (NSData)selfAuthTag;
- (NSData)selfAuthTagNonConnectable;
- (NSString)identifier;
- (OS_dispatch_queue)dispatchQueue;
- (id).cxx_construct;
- (id)_deviceFilterUUIDs:(id)a3;
- (id)_packetTypeForDiscovery:(id)a3;
- (id)_scanSummary:(void *)a3;
- (id)description;
- (id)descriptionWithLevel:(int)a3;
- (id)deviceFoundHandler;
- (id)deviceLostHandler;
- (id)devicesBufferedHandler;
- (id)invalidationHandler;
- (unint64_t)aggregateDiscoveryFlags;
- (void)_activate:(BOOL)a3;
- (void)_addBufferedTypesIfNeeded:(id *)a3 scanRequest:(void *)a4;
- (void)_addServiceUUIDsWithParametersToScanRequestIfNeeded:(void *)a3 matchFlags:(unint64_t)a4 matchTypes:(id *)a5 uuids:(void *)a6;
- (void)_addTypeIfNeeded:(unsigned __int8)a3 matchFlags:(unint64_t)a4 matchTypes:(id *)a5 scanRequest:(void *)a6;
- (void)_addTypeWithParamsIfNeeded:(unsigned __int8)a3 matchFlags:(unint64_t)a4 matchTypes:(id *)a5 scanRequest:(void *)a6;
- (void)_addUUIDIfNeeded:(LeUuid *)a3 matchFlags:(unint64_t)a4 matchTypes:(id *)a5 uuids:(void *)a6;
- (void)_addUUIDIfNeededWithParams:(LeUuid *)a3 matchFlags:(unint64_t)a4 matchTypes:(id *)a5 scanRequest:(void *)a6;
- (void)_advBufferDrained;
- (void)_aopBTBufferDrained;
- (void)_deviceSegmentFound:(id)a3;
- (void)_deviceSegmentLost:(id)a3;
- (void)_invalidated;
- (void)_oobKeysRemoveAll;
- (void)_oobKeysUpdate;
- (void)_proxyOOBKeysUpdateOnDeviceFound:(id)a3;
- (void)_reportAggressiveScanIfNeeded;
- (void)_rescanTimerFired;
- (void)_rescanTimerUpdate:(BOOL)a3;
- (void)_scanRequestCreate;
- (void)_sensorTrackingUpdate;
- (void)_typeToRssiThresholdUpdate;
- (void)activate;
- (void)clearDuplicateFilterCache:(id)a3;
- (void)deviceBuffered:(id)a3;
- (void)deviceFound:(id)a3;
- (void)deviceLost:(id)a3;
- (void)finishDiscovery:(id)a3 completionHandler:(id)a4;
- (void)invalidate;
- (void)sessionHandle;
- (void)setDeviceFoundHandler:(id)a3;
- (void)setDeviceLostHandler:(id)a3;
- (void)setDevicesBufferedHandler:(id)a3;
- (void)setDiscoveryArray:(id)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setInvalidationHandler:(id)a3;
- (void)setScreenOn:(BOOL)a3;
- (void)setSelfAuthTag:(id)a3;
- (void)setSelfAuthTagNonConnectable:(id)a3;
@end

@implementation CBStackBLEScannerBTStack

- (id)description
{
  return -[CBStackBLEScannerBTStack descriptionWithLevel:](self, "descriptionWithLevel:", 50LL);
}

- (id)descriptionWithLevel:(int)a3
{
  unsigned int v4 = a3;
  v5 = (char *)-[NSMutableDictionary count](self->_deviceMap, "count");
  bufferedDevices = self->_bufferedDevices;
  if (bufferedDevices) {
    bufferedDevices = (NSMutableArray *)-[NSMutableArray count](bufferedDevices, "count");
  }
  if (v4 < 0x15)
  {
    uint64_t v27 = 0LL;
    v28 = (id *)&v27;
    uint64_t v29 = 0x3032000000LL;
    v30 = sub_100043220;
    v31 = sub_100043230;
    id v32 = 0LL;
    id v26 = 0LL;
    v10 = "yes";
    if (!self->_screenOn) {
      v10 = "no";
    }
    NSAppendPrintF_safe( &v26,  "== CBStackBLEScanner: ID %@, devices %d, bufferedDevices %d, screenOn %s, scan %@ ==",  self->_identifier,  v5,  bufferedDevices,  v10,  self->_scanSummary);
    objc_storeStrong(&v32, v26);
    v11 = v28;
    id v25 = v28[5];
    NSAppendPrintF_safe(&v25, "\n");
    objc_storeStrong(v11 + 5, v25);
    uint64_t v21 = 0LL;
    v22 = &v21;
    uint64_t v23 = 0x2020000000LL;
    uint64_t v24 = 0LL;
    deviceMap = self->_deviceMap;
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472LL;
    v19[2] = sub_100043238;
    v19[3] = &unk_10087EA20;
    v19[4] = &v27;
    v19[5] = &v21;
    unsigned int v20 = v4;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](deviceMap, "enumerateKeysAndObjectsUsingBlock:", v19);
    unint64_t v13 = v22[3];
    BOOL v14 = (unint64_t)v5 >= v13;
    v15 = &v5[-v13];
    if (v15 != 0LL && v14)
    {
      v16 = v28;
      id obj = v28[5];
      NSAppendPrintF_safe(&obj, "... %d more, %d total\n", (_DWORD)v15, (_DWORD)v5);
      objc_storeStrong(v16 + 5, obj);
    }

    _Block_object_dispose(&v21, 8);
    id v17 = v28[5];
    _Block_object_dispose(&v27, 8);

    return v17;
  }

  else
  {
    v7 = "yes";
    if (!self->_screenOn) {
      v7 = "no";
    }
    uint64_t v8 = NSPrintF_safe( "CBStackBLEScanner: ID %@, devices %d, buffered devices %d, screenOn %s, scan %@",  self->_identifier,  v5,  bufferedDevices,  v7,  self->_scanSummary);
    return (id)objc_claimAutoreleasedReturnValue(v8);
  }

- (void)activate
{
}

- (void)_activate:(BOOL)a3
{
  if (!self->_deviceFoundHandler)
  {
    FatalErrorF("CBStackBLEScanner: No deviceFoundHandler", a2);
    goto LABEL_24;
  }

  v3 = self;
  if (!self->_deviceLostHandler)
  {
LABEL_24:
    FatalErrorF("CBStackBLEScanner: No deviceLostHandler", a2);
    goto LABEL_25;
  }

  if (!self->_discoveryArray)
  {
LABEL_25:
    FatalErrorF("CBStackBLEScanner: No discoveryArray", a2);
    goto LABEL_26;
  }

  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  if (!dispatchQueue)
  {
LABEL_26:
    FatalErrorF("CBStackBLEScanner: No dispatchQueue", a2);
    goto LABEL_27;
  }

  if (!v3->_identifier)
  {
LABEL_27:
    FatalErrorF("CBStackBLEScanner: No identifier", a2);
    goto LABEL_28;
  }

  BOOL v4 = a3;
  dispatch_assert_queue_V2(dispatchQueue);
  if (v3->_invalidateCalled)
  {
LABEL_28:
    FatalErrorF("CBStackBLEScanner: Activate after invalidate", v9);
LABEL_29:
    dispatch_once(&qword_1008D61A8, &stru_1008802B0);
    goto LABEL_9;
  }

  p_btSession = (unint64_t *)&v3->_btSession;
  if (v3->_btSession) {
    goto LABEL_14;
  }
  v5 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"%@-0x%X",  v3->_identifier,  CBXPCGetNextClientID());
  v7 = &unk_1008D6000;
  if (qword_1008D61A8 != -1) {
    goto LABEL_29;
  }
LABEL_9:
  uint64_t v10 = qword_1008D61A0;
  v11 = v5;
  sub_10002418C(__p, (char *)-[NSString UTF8String](v11, "UTF8String"));
  sub_100496120(v10, (uint64_t)__p, p_btSession, 2LL);
  if (v22 < 0) {
    operator delete(__p[0]);
  }
  if (v7[53] != -1LL) {
    dispatch_once(&qword_1008D61A8, &stru_1008802B0);
  }
  uint64_t v12 = sub_100496954((void *)qword_1008D61A0, *p_btSession);
  v3->_proxyoobKeysHash = 0LL;
  v3->_sessionHandle = (void *)v12;
  v3->_typeToRssiThresholdHash = 0LL;

LABEL_14:
  if (!v3->_bleScannerCPP._bleScannerObjC)
  {
    if (dword_1008D6530 <= 30
      && (dword_1008D6530 != -1 || _LogCategory_Initialize(&dword_1008D6530, 30LL)))
    {
      LogPrintF_safe(&dword_1008D6530, "-[CBStackBLEScannerBTStack _activate:]", 30LL, "Activate");
    }

    objc_storeStrong((id *)&v3->_bleScannerCPP._bleScannerObjC, v3);
    objc_storeStrong((id *)&v3->_bleScannerCPP._dispatchQueue, v3->_dispatchQueue);
    if (qword_1008D6608 != -1) {
      dispatch_once(&qword_1008D6608, &stru_1008802D0);
    }
    sub_10004FAD0((uint64_t)off_1008D6600 + 1872, (uint64_t)&v3->_bleScannerCPP);
  }

  *(unint64_t *)((char *)&v3->_aggregateDiscoveryFlags + 5) = 0LL;
  v3->_aggregateDiscoveryFlags = 0LL;
  -[CBStackBLEScannerBTStack _oobKeysUpdate](v3, "_oobKeysUpdate");
  -[CBStackBLEScannerBTStack _sensorTrackingUpdate](v3, "_sensorTrackingUpdate");
  id v13 = -[CBStackBLEScannerBTStack _scanRequestCreate](v3, "_scanRequestCreate");
  BOOL scanning = v3->_scanning;
  v3->_BOOL scanning = v13 != 0LL;
  sessionHandle = v3->_sessionHandle;
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[CBStackBLEScannerBTStack _scanSummary:](v3, "_scanSummary:", v13));
  objc_storeStrong((id *)&v3->_scanSummary, v16);
  v3->_scanTicks = mach_absolute_time();
  uint64_t v17 = sub_100404FE8();
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_10004364C;
  v18[3] = &unk_100880090;
  BOOL v19 = scanning;
  BOOL v20 = v4;
  v18[4] = v16;
  v18[5] = v13;
  v18[6] = sessionHandle;
  sub_100405384(v17, v18);
  -[CBStackBLEScannerBTStack _rescanTimerUpdate:](v3, "_rescanTimerUpdate:", 1LL);
}

- (void)invalidate
{
  if (!self->_invalidateCalled)
  {
    self->_invalidateCalled = 1;
    if (self->_bleScannerCPP._bleScannerObjC)
    {
      if (dword_1008D6530 <= 30
        && (dword_1008D6530 != -1 || _LogCategory_Initialize(&dword_1008D6530, 30LL)))
      {
        LogPrintF_safe(&dword_1008D6530, "-[CBStackBLEScannerBTStack invalidate]", 30LL, "Invalidate");
      }

      if (qword_1008D6608 != -1) {
        dispatch_once(&qword_1008D6608, &stru_1008802D0);
      }
      sub_100009168((uint64_t)off_1008D6600 + 1872, (uint64_t)&self->_bleScannerCPP);
      bleScannerObjC = self->_bleScannerCPP._bleScannerObjC;
      self->_bleScannerCPP._bleScannerObjC = 0LL;

      BOOL v4 = self;
      uint64_t v5 = sub_100404FE8();
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472LL;
      v12[2] = nullsub_49;
      v12[3] = &unk_10087EA48;
      v12[4] = v4;
      sub_100405384(v5, v12);
    }

    if (self->_scanning)
    {
      sessionHandle = self->_sessionHandle;
      uint64_t v7 = sub_100404FE8();
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472LL;
      v11[2] = sub_100043AC0;
      v11[3] = &unk_1008800B8;
      v11[4] = self;
      v11[5] = sessionHandle;
      sub_100405384(v7, v11);
    }

    rescanTimer = self->_rescanTimer;
    if (rescanTimer)
    {
      uint64_t v9 = rescanTimer;
      dispatch_source_cancel(v9);
      uint64_t v10 = self->_rescanTimer;
      self->_rescanTimer = 0LL;
    }

    -[CBStackBLEScannerBTStack _invalidated](self, "_invalidated");
  }

- (void)_invalidated
{
  if (!self->_scanning && !self->_invalidateDone)
  {
    btSession = self->_btSession;
    if (btSession)
    {
      sessionHandle = self->_sessionHandle;
      uint64_t v5 = sub_100404FE8();
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472LL;
      v14[2] = sub_100043D38;
      v14[3] = &unk_10087F8E0;
      v14[4] = sessionHandle;
      v14[5] = btSession;
      sub_100405384(v5, v14);
      self->_btSession = 0LL;
    }

    -[CBStackBLEScannerBTStack _oobKeysRemoveAll](self, "_oobKeysRemoveAll");
    v6 = (void (**)(void))objc_retainBlock(self->_invalidationHandler);
    self->_sessionHandle = 0LL;
    id deviceFoundHandler = self->_deviceFoundHandler;
    self->_id deviceFoundHandler = 0LL;

    id deviceLostHandler = self->_deviceLostHandler;
    self->_id deviceLostHandler = 0LL;

    id devicesBufferedHandler = self->_devicesBufferedHandler;
    self->_id devicesBufferedHandler = 0LL;

    discoveryArray = self->_discoveryArray;
    self->_discoveryArray = 0LL;

    id invalidationHandler = self->_invalidationHandler;
    self->_id invalidationHandler = 0LL;

    suppressedOobKeys = self->_suppressedOobKeys;
    self->_suppressedOobKeys = 0LL;

    suppressedDeviceFilter = self->_suppressedDeviceFilter;
    self->_suppressedDeviceFilter = 0LL;

    self->_invalidateDone = 1;
    if (v6) {
      v6[2](v6);
    }
    if (dword_1008D6530 <= 30
      && (dword_1008D6530 != -1 || _LogCategory_Initialize(&dword_1008D6530, 30LL)))
    {
      LogPrintF_safe(&dword_1008D6530, "-[CBStackBLEScannerBTStack _invalidated]", 30LL, "Invalidated");
    }
  }

- (void)deviceFound:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (!self->_invalidateCalled)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);
    if (!v6)
    {
LABEL_42:

      goto LABEL_43;
    }

    uint64_t v7 = (CBDevice *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_deviceMap, "objectForKeyedSubscript:", v6));
    if (v7)
    {
      uint64_t v8 = 0LL;
    }

    else
    {
      uint64_t v9 = objc_alloc_init(&OBJC_CLASS___CBDevice);
      -[CBDevice setIdentifier:](v9, "setIdentifier:", v6);
      -[CBDevice setInternalFlags:](v9, "setInternalFlags:", [v5 internalFlags]);
      uint64_t v8 = 0x4000000LL;
      uint64_t v7 = v9;
    }

    -[CBDevice changedTypesRemoveAll](v7, "changedTypesRemoveAll");
    unint64_t v10 = (unint64_t)-[CBDevice updateWithCBDevice:](v7, "updateWithCBDevice:", v5);
    unint64_t v11 = v10 | v8;
    -[CBDevice setChangeFlags:]( v7,  "setChangeFlags:",  (unint64_t)-[CBDevice changeFlags](v7, "changeFlags") | v10 | v8);
    -[CBDevice setLastSeenTicks:](v7, "setLastSeenTicks:", mach_absolute_time());
    unint64_t v12 = (unint64_t)-[CBDevice discoveryFlags](v7, "discoveryFlags");
    unint64_t aggregateDiscoveryFlags = self->_aggregateDiscoveryFlags;
    char v25 = 0;
    int v24 = 0;
    CBDiscoveryTypesAddTypes(&v24, &self->_aggregateDiscoveryTypes);
    uint64_t v14 = aggregateDiscoveryFlags & 0x5CFAA6C5B14FFFFFLL;
    if ((v24 & 0x600000) != 0) {
      LOBYTE(v24) = v24 | 0x10;
    }
    if ((v14 & (v12 | v10)) == 0
      && (-[CBDevice discoveryTypesContainTypes:](v7, "discoveryTypesContainTypes:", &v24) & 1) == 0
      && (-[CBDevice changedTypesContainTypes:](v7, "changedTypesContainTypes:", &v24) & 1) == 0)
    {
      if (dword_1008D6530 <= 5
        && (dword_1008D6530 != -1 || _LogCategory_Initialize(&dword_1008D6530, 5LL)))
      {
        uint64_t v18 = CUPrintFlags64(v14, &unk_1006BAF3C);
        BOOL v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
        uint64_t v20 = CBDiscoveryTypesToString(&v24);
        uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
        LogPrintF_safe( &dword_1008D6530,  "-[CBStackBLEScannerBTStack deviceFound:]",  5LL,  "Device found mismatch: %@, DsFl %@, DsTy %@",  v7,  v19,  v21);
      }

      goto LABEL_41;
    }

    if ((v11 & 0x4000000) != 0)
    {
      deviceMap = self->_deviceMap;
      if (!deviceMap)
      {
        v16 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
        uint64_t v17 = self->_deviceMap;
        self->_deviceMap = v16;

        deviceMap = self->_deviceMap;
      }

      -[NSMutableDictionary setObject:forKeyedSubscript:](deviceMap, "setObject:forKeyedSubscript:", v7, v6);
      if (dword_1008D6530 <= 20
        && (dword_1008D6530 != -1 || _LogCategory_Initialize(&dword_1008D6530, 20LL)))
      {
        LogPrintF_safe(&dword_1008D6530, "-[CBStackBLEScannerBTStack deviceFound:]", 20LL, "Device found new: %@", v7);
      }

      if ((-[CBDevice internalFlags](v7, "internalFlags") & 0x4000) == 0)
      {
        id v22 = objc_retainBlock(self->_deviceFoundHandler);
        uint64_t v23 = v22;
        if (v22) {
          goto LABEL_35;
        }
        goto LABEL_36;
      }
    }

    else
    {
      if ((self->_aggregateDiscoveryFlags & (v11 | 0x100000)) == 0
        && !-[CBDevice changedTypesContainTypes:](v7, "changedTypesContainTypes:", &v24))
      {
        if (dword_1008D6530 <= 10
          && (dword_1008D6530 != -1 || _LogCategory_Initialize(&dword_1008D6530, 10LL)))
        {
          LogPrintF_safe( &dword_1008D6530,  "-[CBStackBLEScannerBTStack deviceFound:]",  10LL,  "Device found unchanged: %@",  v7);
        }

        goto LABEL_38;
      }

      if (dword_1008D6530 <= 15
        && (dword_1008D6530 != -1 || _LogCategory_Initialize(&dword_1008D6530, 15LL)))
      {
        LogPrintF_safe( &dword_1008D6530,  "-[CBStackBLEScannerBTStack deviceFound:]",  15LL,  "Device found changed: %@",  v7);
      }

      if ((-[CBDevice internalFlags](v7, "internalFlags") & 0x4000) == 0)
      {
        id v22 = objc_retainBlock(self->_deviceFoundHandler);
        uint64_t v23 = v22;
        if (v22) {
LABEL_35:
        }
          (*((void (**)(id, CBDevice *))v22 + 2))(v22, v7);
LABEL_36:

LABEL_38:
        -[CBStackBLEScannerBTStack _rescanTimerUpdate:](self, "_rescanTimerUpdate:", 0LL);
LABEL_41:

        goto LABEL_42;
      }
    }

    -[CBStackBLEScannerBTStack _deviceSegmentFound:](self, "_deviceSegmentFound:", v7);
    goto LABEL_38;
  }

- (void)deviceLost:(id)a3
{
  id v8 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v8 UUIDString]);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_deviceMap, "objectForKeyedSubscript:", v4));
  if (v5)
  {
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_deviceMap, "setObject:forKeyedSubscript:", 0LL, v4);
    if (dword_1008D6530 <= 15
      && (dword_1008D6530 != -1 || _LogCategory_Initialize(&dword_1008D6530, 15LL)))
    {
      LogPrintF_safe(&dword_1008D6530, "-[CBStackBLEScannerBTStack deviceLost:]", 15LL, "Device lost: %@", v5);
    }

    id v6 = objc_retainBlock(self->_deviceLostHandler);
    uint64_t v7 = v6;
    if (v6) {
      (*((void (**)(id, void *))v6 + 2))(v6, v5);
    }
  }

  else if (dword_1008D6530 <= 20 {
         && (dword_1008D6530 != -1 || _LogCategory_Initialize(&dword_1008D6530, 20LL)))
  }
  {
    LogPrintF_safe(&dword_1008D6530, "-[CBStackBLEScannerBTStack deviceLost:]", 20LL, "Device lost unknown: %@", v4);
  }
}

- (void)deviceBuffered:(id)a3
{
  id v7 = a3;
  if (!self->_invalidateCalled)
  {
    bufferedDevices = self->_bufferedDevices;
    if (!bufferedDevices)
    {
      uint64_t v5 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
      id v6 = self->_bufferedDevices;
      self->_bufferedDevices = v5;

      bufferedDevices = self->_bufferedDevices;
    }

    -[NSMutableArray addObject:](bufferedDevices, "addObject:", v7);
    if (dword_1008D6530 <= 30
      && (dword_1008D6530 != -1 || _LogCategory_Initialize(&dword_1008D6530, 30LL)))
    {
      LogPrintF_safe(&dword_1008D6530, "-[CBStackBLEScannerBTStack deviceBuffered:]", 30LL, "inDevice buffered: %@", v7);
    }
  }
}

- (void)_deviceSegmentFound:(id)a3
{
  id v4 = a3;
  if ([v4 discoveryTypesContainType:26])
  {
    if (!self->_safetyAlertsDevices)
    {
      uint64_t v5 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
      safetyAlertsDevices = self->_safetyAlertsDevices;
      self->_safetyAlertsDevices = v5;
    }

    id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 safetyAlertsAlertID]);
    if (v7)
    {
      unsigned int v8 = [v4 safetyAlertsVersion];
      char v24 = v8;
      if (v8)
      {
        id v9 = [v7 mutableCopy];
        [v9 appendBytes:&v24 length:1];
        unint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_safetyAlertsDevices,  "objectForKeyedSubscript:",  v9));

        if (!v10)
        {
          unint64_t v11 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
          -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_safetyAlertsDevices,  "setObject:forKeyedSubscript:",  v11,  v9);
        }

        unint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedChar:]( NSNumber,  "numberWithUnsignedChar:",  [v4 safetyAlertsSegmentSegmentNumber]));
        id v13 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_safetyAlertsDevices,  "objectForKeyedSubscript:",  v9));
        [v13 setObject:v4 forKeyedSubscript:v12];

        if (dword_1008D6530 <= 30
          && (dword_1008D6530 != -1 || _LogCategory_Initialize(&dword_1008D6530, 30LL)))
        {
          LogPrintF_safe( &dword_1008D6530,  "-[CBStackBLEScannerBTStack _deviceSegmentFound:]",  30LL,  "Safety Alerts segment found: %@",  v4);
        }

        uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_safetyAlertsDevices,  "objectForKeyedSubscript:",  v9));
        id v15 = [v14 count];
        unsigned int v16 = [v4 safetyAlertsSegmentSegmentsTotal];

        if (v15 == (id)v16)
        {
          uint64_t v17 = objc_alloc_init(&OBJC_CLASS___CBDevice);
          uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);
          -[CBDevice setIdentifier:](v17, "setIdentifier:", v18);

          -[CBDevice setInternalFlags:](v17, "setInternalFlags:", [v4 internalFlags]);
          -[CBDevice updateWithCBDevice:](v17, "updateWithCBDevice:", v4);
          BOOL v19 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_safetyAlertsDevices,  "objectForKeyedSubscript:",  v9));
          id v23 = 0LL;
          -[CBDevice updateWithSafetyAlertsSegments:error:](v17, "updateWithSafetyAlertsSegments:error:", v19, &v23);
          id v20 = v23;

          if (v20)
          {
            if (dword_1008D6530 <= 90
              && (dword_1008D6530 != -1 || _LogCategory_Initialize(&dword_1008D6530, 90LL)))
            {
              LogPrintF_safe( &dword_1008D6530,  "-[CBStackBLEScannerBTStack _deviceSegmentFound:]",  90LL,  "Safety Alerts update failed with error: %@",  v20);
            }
          }

          else
          {
            if (dword_1008D6530 <= 30
              && (dword_1008D6530 != -1 || _LogCategory_Initialize(&dword_1008D6530, 30LL)))
            {
              LogPrintF_safe( &dword_1008D6530,  "-[CBStackBLEScannerBTStack _deviceSegmentFound:]",  30LL,  "Safety Alerts found: %@",  v17);
            }

            id v21 = objc_retainBlock(self->_deviceFoundHandler);
            id v22 = v21;
            if (v21) {
              (*((void (**)(id, CBDevice *))v21 + 2))(v21, v17);
            }
          }
        }
      }

      else if (dword_1008D6530 <= 90 {
             && (dword_1008D6530 != -1 || _LogCategory_Initialize(&dword_1008D6530, 90LL)))
      }
      {
        LogPrintF_safe( &dword_1008D6530,  "-[CBStackBLEScannerBTStack _deviceSegmentFound:]",  90LL,  "Safety Alerts segment has no version");
      }
    }

    else if (dword_1008D6530 <= 90 {
           && (dword_1008D6530 != -1 || _LogCategory_Initialize(&dword_1008D6530, 90LL)))
    }
    {
      LogPrintF_safe( &dword_1008D6530,  "-[CBStackBLEScannerBTStack _deviceSegmentFound:]",  90LL,  "Safety Alerts segment has no alert ID");
    }
  }
}

- (void)_deviceSegmentLost:(id)a3
{
  id v4 = a3;
  if ([v4 discoveryTypesContainType:26])
  {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 safetyAlertsAlertID]);
    if (v5)
    {
      unsigned int v6 = [v4 safetyAlertsVersion];
      char v13 = v6;
      if (v6)
      {
        id v7 = [v5 mutableCopy];
        [v7 appendBytes:&v13 length:1];
        unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedChar:]( NSNumber,  "numberWithUnsignedChar:",  [v4 safetyAlertsSegmentSegmentNumber]));
        id v9 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_safetyAlertsDevices,  "objectForKeyedSubscript:",  v7));

        if (v9)
        {
          unint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_safetyAlertsDevices,  "objectForKeyedSubscript:",  v7));
          [v10 removeObjectForKey:v8];

          unint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_safetyAlertsDevices,  "objectForKeyedSubscript:",  v7));
          id v12 = [v11 count];

          if (!v12) {
            -[NSMutableDictionary removeObjectForKey:](self->_safetyAlertsDevices, "removeObjectForKey:", v7);
          }
        }
      }
    }
  }
}

- (void)finishDiscovery:(id)a3 completionHandler:(id)a4
{
  unsigned int v6 = (void (**)(id, id, void))a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  id v5 = objc_alloc_init(&OBJC_CLASS___CBDiscoverySummary);
  v6[2](v6, v5, 0LL);
}

- (id)_packetTypeForDiscovery:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  unint64_t v5 = (unint64_t)[v3 discoveryFlags];
  unint64_t v6 = (unint64_t)[v3 extraDiscoveryFlags];
  unint64_t v7 = v6 | v5;
  if ((v7 & 0x4000000000LL) != 0) {
    unint64_t v6 = (unint64_t)-[NSMutableArray addObject:](v4, "addObject:", &off_1008C26D8);
  }
  if ((v7 & 0x8000000000LL) != 0) {
    unint64_t v6 = (unint64_t)-[NSMutableArray addObject:](v4, "addObject:", &off_1008C26F0);
  }
  if ((v7 & 0x800000000000000LL) != 0) {
    unint64_t v6 = (unint64_t)-[NSMutableArray addObject:](v4, "addObject:", &off_1008C2708);
  }
  if ((v7 & 0x400000000000000LL) != 0) {
    unint64_t v6 = (unint64_t)-[NSMutableArray addObject:](v4, "addObject:", &off_1008C2720);
  }
  if ((v7 & 0x400000) != 0) {
    unint64_t v6 = (unint64_t)-[NSMutableArray addObject:](v4, "addObject:", &off_1008C2738);
  }
  if ((v7 & 0x1000000) != 0) {
    unint64_t v6 = (unint64_t)-[NSMutableArray addObject:](v4, "addObject:", &off_1008C2750);
  }
  if ((v7 & 0x40) != 0) {
    unint64_t v6 = (unint64_t)-[NSMutableArray addObject:](v4, "addObject:", &off_1008C2768);
  }
  if ((v7 & 0x60000000000LL) != 0) {
    unint64_t v6 = (unint64_t)-[NSMutableArray addObject:](v4, "addObject:", &off_1008C2780);
  }
  if ((v7 & 0x40) != 0) {
    unint64_t v6 = (unint64_t)-[NSMutableArray addObject:](v4, "addObject:", &off_1008C2768);
  }
  if ((v7 & 0x40000) != 0) {
    unint64_t v6 = (unint64_t)-[NSMutableArray addObject:](v4, "addObject:", &off_1008C2798);
  }
  if ((v7 & 0x5030800010083E37LL) != 0) {
    unint64_t v6 = (unint64_t)-[NSMutableArray addObject:](v4, "addObject:", &off_1008C27B0);
  }
  if ((v7 & 0x400020108LL) != 0) {
    unint64_t v6 = (unint64_t)-[NSMutableArray addObject:](v4, "addObject:", &off_1008C27C8);
  }
  if ((v7 & 0x5030800010083E37LL) != 0
    || (id v8 = [v3 discoveryTypesContainTypes:CBDiscoveryTypesNearbyActionV1(v6)], (_DWORD)v8))
  {
    id v8 = -[NSMutableArray addObject:](v4, "addObject:", &off_1008C27B0);
  }

  if ((v7 & 0x400020108LL) != 0
    || [v3 discoveryTypesContainTypes:CBDiscoveryTypesNearbyActionV2(v8)])
  {
    -[NSMutableArray addObject:](v4, "addObject:", &off_1008C27C8);
  }

  int v19 = 1024;
  char v20 = 0;
  int v18 = 0;
  char v17 = 0x80;
  int v16 = 0;
  char v15 = 2;
  id v9 = [v3 discoveryTypesContainTypes:&v15];
  if ((_DWORD)v9) {
    id v9 = -[NSMutableArray addObject:](v4, "addObject:", &off_1008C2810);
  }
  int v14 = 0;
  char v13 = 32;
  int v11 = 768;
  char v12 = 0;

  return v4;
}

- (void)clearDuplicateFilterCache:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  sessionHandle = self->_sessionHandle;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  id v6 = (id)objc_claimAutoreleasedReturnValue(-[CBStackBLEScannerBTStack _packetTypeForDiscovery:](self, "_packetTypeForDiscovery:", v4));
  id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v15;
    do
    {
      id v9 = 0LL;
      do
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v6);
        }
        unsigned __int8 v10 = [*(id *)(*((void *)&v14 + 1) + 8 * (void)v9) unsignedCharValue];
        uint64_t v11 = sub_100404FE8();
        v12[0] = _NSConcreteStackBlock;
        v12[1] = 3221225472LL;
        v12[2] = sub_100044FE4;
        v12[3] = &unk_1008800D8;
        unsigned __int8 v13 = v10;
        v12[4] = sessionHandle;
        sub_100405384(v11, v12);
        id v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }

    while (v7);
  }
}

- (void)_advBufferDrained
{
}

- (void)_aopBTBufferDrained
{
  bufferedDevices = self->_bufferedDevices;
  if (bufferedDevices)
  {
    if (dword_1008D6530 <= 30)
    {
      if (dword_1008D6530 == -1)
      {
        bufferedDevices = self->_bufferedDevices;
      }

      LogPrintF_safe( &dword_1008D6530,  "-[CBStackBLEScannerBTStack _aopBTBufferDrained]",  30LL,  "AOP BT buffer drained reporting %d devices",  -[NSMutableArray count](bufferedDevices, "count"));
    }

- (void)_oobKeysUpdate
{
  __int128 v98 = 0u;
  __int128 v99 = 0u;
  __int128 v100 = 0u;
  __int128 v101 = 0u;
  id obj = self->_discoveryArray;
  id v69 = -[NSArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v98,  v103,  16LL);
  if (v69)
  {
    v75 = 0LL;
    v2 = 0LL;
    int64_t v72 = 0LL;
    v73 = 0LL;
    unint64_t v71 = 0LL;
    int v74 = 0;
    uint64_t v68 = *(void *)v99;
    do
    {
      for (i = 0LL; i != v69; i = (char *)i + 1)
      {
        v77 = v2;
        if (*(void *)v99 != v68) {
          objc_enumerationMutation(obj);
        }
        id v3 = *(void **)(*((void *)&v98 + 1) + 8LL * (void)i);
        __int128 v94 = 0u;
        __int128 v95 = 0u;
        __int128 v96 = 0u;
        __int128 v97 = 0u;
        id v76 = (id)objc_claimAutoreleasedReturnValue([v3 oobKeys]);
        id v4 = [v76 countByEnumeratingWithState:&v94 objects:v102 count:16];
        if (v4)
        {
          uint64_t v79 = *(void *)v95;
          do
          {
            for (j = 0LL; j != v4; j = (char *)j + 1)
            {
              if (*(void *)v95 != v79) {
                objc_enumerationMutation(v76);
              }
              id v6 = *(void **)(*((void *)&v94 + 1) + 8LL * (void)j);
              unsigned int v7 = [v6 btAddressType];
              unsigned int v8 = [v6 addressType];
              id v9 = (id)objc_claimAutoreleasedReturnValue([v6 btAddressData]);
              if ([v9 length] == (id)6 || objc_msgSend(v9, "length") == (id)7)
              {
                unsigned int v10 = v8 | v7;
                if (v10)
                {
                  LOBYTE(v90) = v10;
                  id v11 = v9;
                  char v12 = v11;
                  if (v11)
                  {
                    if ([v11 length] == (id)7 || v10 > 1 || objc_msgSend(v12, "length") != (id)6)
                    {
                      id v9 = v12;
                    }

                    else
                    {
                      unsigned __int8 v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableData dataWithBytes:length:]( &OBJC_CLASS___NSMutableData,  "dataWithBytes:length:",  &v90,  1LL));
                      [v13 appendBytes:[v12 bytes] length:6];
                      id v9 = [v13 copy];
                    }
                  }

                  else
                  {
                    id v9 = 0LL;
                  }
                }

                if ([v9 length] == (id)7) {
                  id v14 = [v9 subdataWithRange:1, 6];
                }
                else {
                  id v14 = v9;
                }
                __int128 v15 = v14;
                __int128 v16 = (void *)objc_claimAutoreleasedReturnValue([v6 irkData]);
                if ([v16 length] == (id)16)
                {
                  id v17 = [v6 keyType];
                  id v18 = v17;
                  if ((_DWORD)v17)
                  {
                    if ((_DWORD)v17 == 255)
                    {
                      if (dword_1008D6530 <= 30
                        && (dword_1008D6530 != -1 || _LogCategory_Initialize(&dword_1008D6530, 30LL)))
                      {
                        uint64_t v19 = CUPrintNSDataAddress(v15);
                        char v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
                        uint64_t v21 = CUPrintNSObjectMasked(v16);
                        id v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
                        uint64_t v23 = CUPrintFlags32(255LL, &unk_1006BB29F);
                        char v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
                        LogPrintF_safe( &dword_1008D6530,  "-[CBStackBLEScannerBTStack _oobKeysUpdate]",  30LL,  "OOB key skip: something went wrong with oobkey type, Addr %@, IRK %@, keyType: %@",  v20,  v22,  v24);
                      }
                    }

                    else
                    {
                      uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  v17));
                      v30 = v75;
                      if (!v75) {
                        v30 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
                      }
                      v75 = v30;
                      v31 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( v30,  "objectForKeyedSubscript:",  v29));
                      BOOL v32 = v31 == 0LL;

                      if (v32)
                      {
                        v33 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
                        -[NSMutableDictionary setObject:forKeyedSubscript:]( v75,  "setObject:forKeyedSubscript:",  v33,  v29);
                      }

                      v34 = v77;
                      if (!v77) {
                        v34 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
                      }
                      v77 = v34;
                      v35 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( v34,  "objectForKeyedSubscript:",  v29));
                      BOOL v36 = v35 == 0LL;

                      if (v36)
                      {
                        v37 = objc_alloc_init(&OBJC_CLASS___NSMutableOrderedSet);
                        -[NSMutableDictionary setObject:forKeyedSubscript:]( v77,  "setObject:forKeyedSubscript:",  v37,  v29);
                      }

                      v38 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( v77,  "objectForKeyedSubscript:",  v29));
                      id v39 = [v38 count];

                      v40 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( v77,  "objectForKeyedSubscript:",  v29));
                      [v40 addObject:v16];

                      v41 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( v77,  "objectForKeyedSubscript:",  v29));
                      LODWORD(v39) = v39 == [v41 count];

                      if ((_DWORD)v39)
                      {
                        if (dword_1008D6530 <= 30
                          && (dword_1008D6530 != -1 || _LogCategory_Initialize(&dword_1008D6530, 30LL)))
                        {
                          uint64_t v42 = CUPrintNSObjectMasked(v16);
                          v43 = (void *)objc_claimAutoreleasedReturnValue(v42);
                          uint64_t v44 = CUPrintNSDataAddress(v15);
                          v45 = (void *)objc_claimAutoreleasedReturnValue(v44);
                          uint64_t v46 = CUPrintFlags32(v18, &unk_1006BB29F);
                          v47 = (void *)objc_claimAutoreleasedReturnValue(v46);
                          LogPrintF_safe( &dword_1008D6530,  "-[CBStackBLEScannerBTStack _oobKeysUpdate]",  30LL,  "OOB key skip: Duplicate irkData %@, its address %@ and keyType %@",  v43,  v45,  v47);
                        }
                      }

                      else
                      {
                        if ((_DWORD)v18 == 1)
                        {
                          v49 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( v75,  "objectForKeyedSubscript:",  v29));
                          [v49 addObject:v6];

                          unint64_t v71 = (v71 + 1);
                          if (dword_1008D6530 <= 20
                            && (dword_1008D6530 != -1 || _LogCategory_Initialize(&dword_1008D6530, 20LL)))
                          {
                            uint64_t v50 = CUPrintNSDataAddress(v15);
                            v51 = (void *)objc_claimAutoreleasedReturnValue(v50);
                            uint64_t v52 = CUPrintNSObjectMasked(v16);
                            v53 = (void *)objc_claimAutoreleasedReturnValue(v52);
                            uint64_t v54 = CUPrintFlags32(1LL, &unk_1006BB29F);
                            v55 = (void *)objc_claimAutoreleasedReturnValue(v54);
                            LogPrintF_safe( &dword_1008D6530,  "-[CBStackBLEScannerBTStack _oobKeysUpdate]",  20LL,  "OOB key add: Addr %@, IRK %@, keyType: %@",  v51,  v53,  v55);
                          }
                        }

                        v72 ^= (unint64_t)[v6 hash];
                      }
                    }
                  }

                  else if (v74 < 10)
                  {
                    v48 = v73;
                    if (!v73) {
                      v48 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
                    }
                    v73 = v48;
                    -[NSMutableDictionary setObject:forKeyedSubscript:](v48, "setObject:forKeyedSubscript:", v16, v9);
                    ++v74;
                  }

                  else if (dword_1008D6530 <= 30 {
                         && (dword_1008D6530 != -1 || _LogCategory_Initialize(&dword_1008D6530, 30LL)))
                  }
                  {
                    uint64_t v25 = CUPrintNSDataAddress(v15);
                    id v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
                    uint64_t v27 = CUPrintNSObjectMasked(v16);
                    v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
                    LogPrintF_safe( &dword_1008D6530,  "-[CBStackBLEScannerBTStack _oobKeysUpdate]",  30LL,  "OOB key skip: too many, Addr %@, IRK %@",  v26,  v28);
                  }
                }
              }
            }

            id v4 = [v76 countByEnumeratingWithState:&v94 objects:v102 count:16];
          }

          while (v4);
        }

        v2 = v77;
      }

      id v69 = -[NSArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v98,  v103,  16LL);
    }

    while (v69);
  }

  else
  {
    v75 = 0LL;
    v2 = 0LL;
    int64_t v72 = 0LL;
    v73 = 0LL;
    unint64_t v71 = 0LL;
  }

  v78 = v2;

  uint64_t v90 = 0LL;
  v91 = &v90;
  uint64_t v92 = 0x2020000000LL;
  int v93 = 0;
  oobKeyMap = self->_oobKeyMap;
  v87[0] = _NSConcreteStackBlock;
  v87[1] = 3221225472LL;
  v87[2] = sub_100045E28;
  v87[3] = &unk_100880128;
  v57 = v73;
  v88 = v57;
  v89 = &v90;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](oobKeyMap, "enumerateKeysAndObjectsUsingBlock:", v87);
  uint64_t v83 = 0LL;
  v84 = &v83;
  uint64_t v85 = 0x2020000000LL;
  int v86 = 0;
  v82[0] = _NSConcreteStackBlock;
  v82[1] = 3221225472LL;
  v82[2] = sub_1000463A0;
  v82[3] = &unk_100880128;
  v82[4] = self;
  v82[5] = &v83;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](v57, "enumerateKeysAndObjectsUsingBlock:", v82);
  if (v72 != self->_proxyoobKeysHash)
  {
    if (!v75) {
      v75 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    }
    uint64_t v58 = sub_1004051A8();
    v80[0] = _NSConcreteStackBlock;
    v80[1] = 3221225472LL;
    v80[2] = sub_100046940;
    v80[3] = &unk_10087EA48;
    v75 = v75;
    v81 = v75;
    sub_100405384(v58, v80);
  }

  if (*((_DWORD *)v84 + 6) || *((_DWORD *)v91 + 6) || v72 != self->_proxyoobKeysHash)
  {
    if (dword_1008D6530 <= 30
      && (dword_1008D6530 != -1 || _LogCategory_Initialize(&dword_1008D6530, 30LL)))
    {
      unsigned int v62 = -[NSMutableDictionary count](self->_oobKeyMap, "count");
      unsigned int v63 = -[NSMutableDictionary count](v57, "count");
      LogPrintF_safe( &dword_1008D6530,  "-[CBStackBLEScannerBTStack _oobKeysUpdate]",  30LL,  "OOB keys update: changed, %d -> %d total, %d started, %d stopped",  v62,  v63,  *((_DWORD *)v84 + 6),  *((_DWORD *)v91 + 6));
    }

    if ((_DWORD)v71
      && dword_1008D6530 <= 30
      && (dword_1008D6530 != -1 || _LogCategory_Initialize(&dword_1008D6530, 30LL)))
    {
      v60 = "Non Default OOB keys wiped and replaced: %d";
      uint64_t v61 = 30LL;
      goto LABEL_88;
    }
  }

  else if (dword_1008D6530 <= 10 {
         && (dword_1008D6530 != -1 || _LogCategory_Initialize(&dword_1008D6530, 10LL)))
  }
  {
    id v59 = -[NSMutableDictionary count](v57, "count");
    v60 = "OOB keys update: unchanged, %d total";
    uint64_t v61 = 10LL;
    unint64_t v71 = (unint64_t)v59;
LABEL_88:
    LogPrintF_safe(&dword_1008D6530, "-[CBStackBLEScannerBTStack _oobKeysUpdate]", v61, v60, v71);
  }

  v64 = self->_oobKeyMap;
  self->_oobKeyMap = v57;
  v65 = v57;

  self->_proxyoobKeysHash = v72;
  _Block_object_dispose(&v83, 8);

  _Block_object_dispose(&v90, 8);
}

- (void)_oobKeysRemoveAll
{
  oobKeyMap = self->_oobKeyMap;
  self->_oobKeyMap = 0LL;

  if (qword_1008D6628 != -1) {
    dispatch_once(&qword_1008D6628, &stru_100880350);
  }
  uint64_t v4 = qword_1008D6620;
  unint64_t v5 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  sub_100333834(v4, v5);

  self->_proxyoobKeysHash = 0LL;
}

- (void)_proxyOOBKeysUpdateOnDeviceFound:(id)a3
{
  id v13 = a3;
  __int128 v15 = (void *)objc_claimAutoreleasedReturnValue([v13 nearbyActionNoWakeAuthTagData]);
  __int128 v16 = (void *)objc_claimAutoreleasedReturnValue([v13 btAddressData]);
  uint64_t v4 = sub_1002E6E9C();
  char v5 = (*(uint64_t (**)(uint64_t))(*(void *)v4 + 2360LL))(v4);
  if (v16) {
    char v6 = v5;
  }
  else {
    char v6 = 0;
  }
  if ((v6 & 1) != 0 && ([v13 nearbyActionNoWakeType] & 1) != 0 && v15)
  {
    v28[0] = 0LL;
    v28[1] = v28;
    v28[2] = 0x3032000000LL;
    v28[3] = sub_100043220;
    v28[4] = sub_100043230;
    id v29 = 0LL;
    __int128 v24 = 0u;
    __int128 v25 = 0u;
    __int128 v26 = 0u;
    __int128 v27 = 0u;
    id obj = self->_discoveryArray;
    id v7 = -[NSArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v24,  v30,  16LL);
    if (v7)
    {
      uint64_t v8 = *(void *)v25;
      do
      {
        for (i = 0LL; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v25 != v8) {
            objc_enumerationMutation(obj);
          }
          unsigned int v10 = *(void **)(*((void *)&v24 + 1) + 8LL * (void)i);
          uint64_t v18 = 0LL;
          uint64_t v19 = &v18;
          uint64_t v20 = 0x3032000000LL;
          uint64_t v21 = sub_100043220;
          id v22 = sub_100043230;
          id v23 = 0LL;
          id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 oobKeys]);
          v17[0] = _NSConcreteStackBlock;
          v17[1] = 3221225472LL;
          v17[2] = sub_1000471E8;
          v17[3] = &unk_100880190;
          v17[4] = v16;
          v17[5] = v15;
          v17[7] = v28;
          v17[8] = &v18;
          v17[6] = v10;
          [v11 enumerateObjectsUsingBlock:v17];

          if (v19[5])
          {
            [v10 setOobKeys:];
            if (dword_1008D6530 <= 20
              && (dword_1008D6530 != -1 || _LogCategory_Initialize(&dword_1008D6530, 20LL)))
            {
              char v12 = (void *)objc_claimAutoreleasedReturnValue([v10 oobKeys]);
              LogPrintF_safe( &dword_1008D6530,  "-[CBStackBLEScannerBTStack _proxyOOBKeysUpdateOnDeviceFound:]",  20LL,  "Updated discoveryObject.oobKeys: %@",  v12);
            }
          }

          _Block_object_dispose(&v18, 8);
        }

        id v7 = -[NSArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v24,  v30,  16LL);
      }

      while (v7);
    }

    _Block_object_dispose(v28, 8);
  }
}

- (void)_rescanTimerFired
{
  if (dword_1008D6530 <= 15 && (dword_1008D6530 != -1 || _LogCategory_Initialize(&dword_1008D6530, 15LL))) {
    LogPrintF_safe( &dword_1008D6530,  "-[CBStackBLEScannerBTStack _rescanTimerFired]",  15LL,  "Rescan timer: %d device(s)",  -[NSMutableDictionary count](self->_deviceMap, "count"));
  }
  id v3 = (void (**)(id, void *))objc_retainBlock(self->_deviceLostHandler);
  unint64_t scanTicks = self->_scanTicks;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](self->_deviceMap, "allKeys"));
  id v5 = [obj countByEnumeratingWithState:&v17 objects:v22 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v18;
    do
    {
      id v7 = 0LL;
      do
      {
        if (*(void *)v18 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void *)(*((void *)&v17 + 1) + 8LL * (void)v7);
        id v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_deviceMap, "objectForKeyedSubscript:", v8));
        if ((unint64_t)[v9 lastSeenTicks] < scanTicks)
        {
          unsigned int v10 = -[NSUUID initWithUUIDString:](objc_alloc(&OBJC_CLASS___NSUUID), "initWithUUIDString:", v8);
          if (!v10) {
            goto LABEL_19;
          }
          if (qword_1008D5F10 != -1) {
            dispatch_once(&qword_1008D5F10, &stru_100880370);
          }
          uint64_t v11 = (uint64_t)off_1008D5F08;
          sub_100241F90(v21, v10);
          LOBYTE(v11) = sub_100595874(v11, v21);

          if ((v11 & 1) != 0)
          {
            if (dword_1008D6530 <= 20
              && (dword_1008D6530 != -1 || _LogCategory_Initialize(&dword_1008D6530, 20LL)))
            {
              LogPrintF_safe( &dword_1008D6530,  "-[CBStackBLEScannerBTStack _rescanTimerFired]",  20LL,  "Device connected without adv: %@",  v9);
            }

            [v9 setLastSeenTicks:mach_absolute_time()];
          }

          else
          {
LABEL_19:
            -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_deviceMap,  "setObject:forKeyedSubscript:",  0LL,  v8);
            if (dword_1008D6530 <= 20
              && (dword_1008D6530 != -1 || _LogCategory_Initialize(&dword_1008D6530, 20LL)))
            {
              uint64_t v12 = mach_absolute_time();
              uint64_t v13 = UpTicksToSeconds(v12 - (void)[v9 lastSeenTicks]);
              uint64_t v14 = CUPrintDuration64(v13);
              __int128 v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
              LogPrintF_safe( &dword_1008D6530,  "-[CBStackBLEScannerBTStack _rescanTimerFired]",  20LL,  "Device lost: %@, lastSeen %@",  v9,  v15);
            }

            if (v3) {
              v3[2](v3, v9);
            }
          }
        }

        id v7 = (char *)v7 + 1;
      }

      while (v5 != v7);
      id v5 = [obj countByEnumeratingWithState:&v17 objects:v22 count:16];
    }

    while (v5);
  }

  -[CBStackBLEScannerBTStack _activate:](self, "_activate:", 1LL);
}

- (void)_rescanTimerUpdate:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = -[NSMutableDictionary count](self->_deviceMap, "count");
  p_rescanTimer = &self->_rescanTimer;
  rescanTimer = self->_rescanTimer;
  if (v5)
  {
    uint64_t v8 = rescanTimer;
    if (v8)
    {
      id v9 = (dispatch_source_s *)v8;
      if (v3) {
        CUDispatchTimerSet(v8, 20.0, -1.0, 1.0);
      }
    }

    else
    {
      dispatch_source_t v11 = dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_timer,  0LL,  0LL,  (dispatch_queue_t)self->_dispatchQueue);
      objc_storeStrong((id *)&self->_rescanTimer, v11);
      handler[0] = _NSConcreteStackBlock;
      handler[1] = 3221225472LL;
      handler[2] = sub_100047AF0;
      handler[3] = &unk_10087FB90;
      id v9 = v11;
      uint64_t v14 = v9;
      __int128 v15 = self;
      dispatch_source_set_event_handler(v9, handler);
      CUDispatchTimerSet(v9, 20.0, -1.0, 1.0);
      dispatch_activate(v9);
    }
  }

  else if (rescanTimer)
  {
    uint64_t v12 = rescanTimer;
    dispatch_source_cancel(v12);
    unsigned int v10 = *p_rescanTimer;
    *p_rescanTimer = 0LL;
  }

- (void)_scanRequestCreate
{
  BOOL v3 = operator new(0x188uLL);
  sub_100050070((uint64_t)v3);
  *(_DWORD *)&self->_BOOL anyActiveScan = 0;
  self->_aopBTTypes = 0;
  self->_scanRateAnyDefault = 0;
  self->_int scanRateHighest = 0;
  *(_WORD *)&self->_anyRangeScan = 0;
  uint64_t v4 = sub_1002E6BF0();
  else {
    unsigned __int8 v5 = 1;
  }
  self->_targetCore = v5;
  unsigned __int8 v6 = -[CBStackBLEScannerBTStack _addMfgScanIfNeeded:scanRequest:]( self,  "_addMfgScanIfNeeded:scanRequest:",  0x80000000000000LL,  v3);
  unsigned int v62 = 0LL;
  unsigned int v63 = 0LL;
  uint64_t v64 = 0LL;
  sub_100634348((uint64_t)v73, 65529);
  -[CBStackBLEScannerBTStack _addUUIDIfNeeded:matchFlags:matchTypes:uuids:]( self,  "_addUUIDIfNeeded:matchFlags:matchTypes:uuids:",  v73,  0x8000000000000LL,  0LL,  &v62);
  sub_100634348((uint64_t)v72, 65068);
  -[CBStackBLEScannerBTStack _addUUIDIfNeeded:matchFlags:matchTypes:uuids:]( self,  "_addUUIDIfNeeded:matchFlags:matchTypes:uuids:",  v72,  0x40000000000000LL,  0LL,  &v62);
  sub_100634348((uint64_t)v71, 6162);
  -[CBStackBLEScannerBTStack _addUUIDIfNeeded:matchFlags:matchTypes:uuids:]( self,  "_addUUIDIfNeeded:matchFlags:matchTypes:uuids:",  v71,  0x2000000000000LL,  0LL,  &v62);
  int v60 = 4096;
  char v61 = 0;
  __int128 v68 = xmmword_1006BDC88;
  int v69 = -815610143;
  -[CBStackBLEScannerBTStack _addUUIDIfNeeded:matchFlags:matchTypes:uuids:]( self,  "_addUUIDIfNeeded:matchFlags:matchTypes:uuids:",  &v70,  0LL,  &v60,  &v62,  sub_100634334(&v70, (__n128 *)&v68).n128_f64[0]);
  uint64_t v7 = _os_feature_enabled_impl("BluetoothFeatures", "SafetyAlerts");
  if ((_DWORD)v7 && GestaltGetDeviceClass(v7) == 1)
  {
    int v58 = 0x40000000;
    char v59 = 0;
    sub_100634348((uint64_t)v67, 64672);
    -[CBStackBLEScannerBTStack _addUUIDIfNeeded:matchFlags:matchTypes:uuids:]( self,  "_addUUIDIfNeeded:matchFlags:matchTypes:uuids:",  v67,  0LL,  &v58,  &v62);
  }

  int v58 = 0x20000000;
  char v59 = 0;
  -[CBStackBLEScannerBTStack _addServiceUUIDsWithParametersToScanRequestIfNeeded:matchFlags:matchTypes:uuids:]( self,  "_addServiceUUIDsWithParametersToScanRequestIfNeeded:matchFlags:matchTypes:uuids:",  v3,  0LL,  &v58,  &v62);
  if (v63 != v62)
  {
    __p = 0LL;
    v56 = 0LL;
    uint64_t v57 = 0LL;
    sub_100050EE8((char *)&__p, (__int128 *)v62, v63, 0xCCCCCCCCCCCCCCCDLL * (((char *)v63 - (_BYTE *)v62) >> 2));
    sub_100050224(v3 + 1, (__int128 *)__p, v56, 0xCCCCCCCCCCCCCCCDLL * (((char *)v56 - (_BYTE *)__p) >> 2));
    if (__p)
    {
      v56 = (__int128 *)__p;
      operator delete(__p);
    }

    unsigned __int8 v6 = 1;
    self->_BOOL anyNonLeechBufferScan = 1;
  }

  uint64_t v8 = sub_100634348((uint64_t)v66, 65061);
  -[CBStackBLEScannerBTStack _addUUIDIfNeededWithParams:matchFlags:matchTypes:scanRequest:]( self,  "_addUUIDIfNeededWithParams:matchFlags:matchTypes:scanRequest:",  v66,  0x180000000LL,  CBDiscoveryTypesProximityService(v8),  v3);
  int v54 = 0;
  char v53 = 0x80;
  -[CBStackBLEScannerBTStack _addTypeIfNeeded:matchFlags:matchTypes:scanRequest:]( self,  "_addTypeIfNeeded:matchFlags:matchTypes:scanRequest:",  5LL,  0LL,  &v53,  v3);
  -[CBStackBLEScannerBTStack _addTypeIfNeeded:matchFlags:matchTypes:scanRequest:]( self,  "_addTypeIfNeeded:matchFlags:matchTypes:scanRequest:",  10LL,  0x4000000000LL,  0LL,  v3);
  -[CBStackBLEScannerBTStack _addTypeIfNeeded:matchFlags:matchTypes:scanRequest:]( self,  "_addTypeIfNeeded:matchFlags:matchTypes:scanRequest:",  9LL,  0x8000000000LL,  0LL,  v3);
  -[CBStackBLEScannerBTStack _addTypeIfNeeded:matchFlags:matchTypes:scanRequest:]( self,  "_addTypeIfNeeded:matchFlags:matchTypes:scanRequest:",  24LL,  0x800000000000000LL,  0LL,  v3);
  -[CBStackBLEScannerBTStack _addTypeIfNeeded:matchFlags:matchTypes:scanRequest:]( self,  "_addTypeIfNeeded:matchFlags:matchTypes:scanRequest:",  8LL,  0x400000000000000LL,  0LL,  v3);
  -[CBStackBLEScannerBTStack _addTypeIfNeeded:matchFlags:matchTypes:scanRequest:]( self,  "_addTypeIfNeeded:matchFlags:matchTypes:scanRequest:",  6LL,  0x400000LL,  0LL,  v3);
  id v9 = -[CBStackBLEScannerBTStack _addTypeIfNeeded:matchFlags:matchTypes:scanRequest:]( self,  "_addTypeIfNeeded:matchFlags:matchTypes:scanRequest:",  15LL,  0x5030800010083E37LL,  CBDiscoveryTypesNearbyActionV1( -[CBStackBLEScannerBTStack _addTypeIfNeeded:matchFlags:matchTypes:scanRequest:]( self,  "_addTypeIfNeeded:matchFlags:matchTypes:scanRequest:",  17LL,  0x1000000LL,  0LL,  v3)),  v3);
  -[CBStackBLEScannerBTStack _addTypeWithParamsIfNeeded:matchFlags:matchTypes:scanRequest:]( self,  "_addTypeWithParamsIfNeeded:matchFlags:matchTypes:scanRequest:",  21LL,  0x400020108LL,  CBDiscoveryTypesNearbyActionV2(v9),  v3);
  -[CBStackBLEScannerBTStack _addTypeIfNeeded:matchFlags:matchTypes:scanRequest:]( self,  "_addTypeIfNeeded:matchFlags:matchTypes:scanRequest:",  16LL,  64LL,  0LL,  v3);
  -[CBStackBLEScannerBTStack _addTypeIfNeeded:matchFlags:matchTypes:scanRequest:]( self,  "_addTypeIfNeeded:matchFlags:matchTypes:scanRequest:",  18LL,  0x60000000000LL,  0LL,  v3);
  int v51 = 1024;
  char v52 = 0;
  -[CBStackBLEScannerBTStack _addTypeIfNeeded:matchFlags:matchTypes:scanRequest:]( self,  "_addTypeIfNeeded:matchFlags:matchTypes:scanRequest:",  7LL,  114816LL,  &v51,  v3);
  -[CBStackBLEScannerBTStack _addTypeIfNeeded:matchFlags:matchTypes:scanRequest:]( self,  "_addTypeIfNeeded:matchFlags:matchTypes:scanRequest:",  19LL,  0x40000LL,  0LL,  v3);
  int v50 = 0;
  char v49 = 2;
  -[CBStackBLEScannerBTStack _addTypeIfNeeded:matchFlags:matchTypes:scanRequest:]( self,  "_addTypeIfNeeded:matchFlags:matchTypes:scanRequest:",  3LL,  0LL,  &v49,  v3);
  int v48 = 0;
  char v47 = 32;
  -[CBStackBLEScannerBTStack _addTypeIfNeeded:matchFlags:matchTypes:scanRequest:]( self,  "_addTypeIfNeeded:matchFlags:matchTypes:scanRequest:",  22LL,  0LL,  CBDiscoveryTypesNearbyInfoV2( -[CBStackBLEScannerBTStack _addTypeIfNeeded:matchFlags:matchTypes:scanRequest:]( self,  "_addTypeIfNeeded:matchFlags:matchTypes:scanRequest:",  2LL,  0LL,  &v47,  v3)),  v3);
  int v45 = 768;
  char v46 = 0;
  -[CBStackBLEScannerBTStack _addTypeIfNeeded:matchFlags:matchTypes:scanRequest:]( self,  "_addTypeIfNeeded:matchFlags:matchTypes:scanRequest:",  26LL,  0LL,  &v45,  v3);
  int v43 = 0;
  char v44 = 0x80;
  -[CBStackBLEScannerBTStack _addTypeIfNeeded:matchFlags:matchTypes:scanRequest:]( self,  "_addTypeIfNeeded:matchFlags:matchTypes:scanRequest:",  19LL,  0LL,  &v43,  v3);
  if (v3[8] != v3[9])
  {
    unsigned __int8 v6 = 1;
    self->_BOOL anyNonLeechBufferScan = 1;
  }

  uint64_t v10 = sub_1002E6E9C();
  if ((*(unsigned int (**)(uint64_t))(*(void *)v10 + 2352LL))(v10))
  {
    char v42 = 0;
    int v41 = 0;
    -[CBStackBLEScannerBTStack _typeToRssiThresholdUpdate](self, "_typeToRssiThresholdUpdate");
    -[CBStackBLEScannerBTStack _addBufferedTypesIfNeeded:scanRequest:]( self,  "_addBufferedTypesIfNeeded:scanRequest:",  &v41,  v3);
  }

  if (self->_aopBTTypes)
  {
    uint64_t v11 = sub_1002E6E9C();
    if ((*(unsigned int (**)(uint64_t))(*(void *)v11 + 2344LL))(v11))
    {
      *((_WORD *)v3 + 62) = self->_aopBTTypes;
      unsigned __int8 v6 = 1;
    }
  }

  -[CBStackBLEScannerBTStack _reportAggressiveScanIfNeeded](self, "_reportAggressiveScanIfNeeded");
  if ((v6 & 1) == 0)
  {
    v34 = (void *)sub_10004FD94((uint64_t)v3);
    operator delete(v34);
    v33 = 0LL;
    goto LABEL_49;
  }

  uint64_t v12 = self;
  *(_BYTE *)BOOL v3 = self->_anyNeedsDups;
  *((_BYTE *)v3 + 3) = 0;
  *((_BYTE *)v3 + 1) = 1;
  if (self->_objectDiscoveryFlags)
  {
    uint64_t v13 = sub_1002E6BF0();
    int v14 = (*(uint64_t (**)(uint64_t))(*(void *)v13 + 704LL))(v13);
    uint64_t v12 = self;
    if (v14) {
      *((_BYTE *)v3 + 122) = self->_objectDiscoveryFlags;
    }
  }

  if (v12->_anyRangeScan) {
    *((_BYTE *)v3 + 140) = 1;
  }
  BOOL v36 = v3;
  __int128 v15 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  __int128 v16 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  unsigned __int8 v17 = [(id)qword_1008F1F50 scanWithRetainDuplicates];
  __int128 v39 = 0u;
  __int128 v40 = 0u;
  __int128 v37 = 0u;
  __int128 v38 = 0u;
  __int128 v18 = self->_discoveryArray;
  id v19 = -[NSArray countByEnumeratingWithState:objects:count:]( v18,  "countByEnumeratingWithState:objects:count:",  &v37,  v65,  16LL);
  if (v19)
  {
    uint64_t v20 = *(void *)v38;
    do
    {
      for (i = 0LL; i != v19; i = (char *)i + 1)
      {
        if (*(void *)v38 != v20) {
          objc_enumerationMutation(v18);
        }
        id v22 = *(void **)(*((void *)&v37 + 1) + 8LL * (void)i);
        id v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( NSNumber,  "numberWithUnsignedInt:",  [v22 useCase]));
        -[NSMutableSet addObject:](v16, "addObject:", v23);

        __int128 v24 = (void *)objc_claimAutoreleasedReturnValue([v22 appID]);
        if (v24) {
          -[NSMutableSet addObject:](v15, "addObject:", v24);
        }
        BOOL v25 = (uint64_t)[v22 discoveryFlags] < 0;

        v17 &= v25;
      }

      id v19 = -[NSArray countByEnumeratingWithState:objects:count:]( v18,  "countByEnumeratingWithState:objects:count:",  &v37,  v65,  16LL);
    }

    while (v19);
  }

  *((_BYTE *)v36 + 144) = v17;
  objc_storeStrong((id *)v36 + 19, v15);
  __int128 v26 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableSet allObjects](v16, "allObjects"));
  uint64_t v27 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithArray:](&OBJC_CLASS___NSArray, "arrayWithArray:", v26));
  v28 = (void *)*((void *)v36 + 22);
  *((void *)v36 + 22) = v27;

  BOOL anyNonLeechBufferScan = self->_anyNonLeechBufferScan;
  if (!self->_anyNonLeechBufferScan && self->_anyLeechBufferScan) {
    *((_DWORD *)v36 + 42) = 269;
  }
  int scanRateHighest = self->_scanRateHighest;
  if (!self->_scanRateAnyDefault || scanRateHighest > 29)
  {
    if (scanRateHighest > 39)
    {
      switch(scanRateHighest)
      {
        case '(':
          int v31 = 60;
          goto LABEL_45;
        case '2':
          int v31 = 40;
          goto LABEL_45;
        case '<':
          int v31 = 30;
          goto LABEL_45;
      }
    }

    else
    {
      int v31 = 300;
      if (!scanRateHighest || scanRateHighest == 30) {
        goto LABEL_45;
      }
      if (scanRateHighest == 35)
      {
        int v31 = 90;
        goto LABEL_45;
      }
    }

    int v31 = 966;
    goto LABEL_45;
  }

  self->_int scanRateHighest = 30;
  int v31 = 300;
LABEL_45:
  if (anyNonLeechBufferScan)
  {
    BOOL anyActiveScan = self->_anyActiveScan;
    *((_BYTE *)v36 + 120) = 1;
    *((_DWORD *)v36 + 32) = v31;
    *((_DWORD *)v36 + 33) = 30;
    *((_BYTE *)v36 + 136) = anyActiveScan;
  }

  v33 = v36;
LABEL_49:
  if (v62)
  {
    unsigned int v63 = (__int128 *)v62;
    operator delete(v62);
  }

  return v33;
}

- (void)sessionHandle
{
  return self->_sessionHandle;
}

- (void)_typeToRssiThresholdUpdate
{
  BOOL v3 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  __int128 v34 = 0u;
  __int128 v35 = 0u;
  __int128 v36 = 0u;
  __int128 v37 = 0u;
  id v23 = self;
  id obj = self->_discoveryArray;
  id v4 = -[NSArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v34,  v43,  16LL);
  if (v4)
  {
    int64_t v5 = 0LL;
    uint64_t v25 = *(void *)v35;
    id v26 = v4;
    do
    {
      for (i = 0LL; i != v26; i = (char *)i + 1)
      {
        if (*(void *)v35 != v25) {
          objc_enumerationMutation(obj);
        }
        unsigned __int8 v6 = *(void **)(*((void *)&v34 + 1) + 8LL * (void)i);
        uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 typeToRssiThresholds]);
        if (v7)
        {
          id v8 = v6;
          BOOL v9 = *((char *)[v8 discoveryTypesInternalPtr] + 3) >= 0;

          if (!v9)
          {
            __int128 v32 = 0u;
            __int128 v33 = 0u;
            __int128 v30 = 0u;
            __int128 v31 = 0u;
            uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v8 typeToRssiThresholds]);
            id v11 = [v10 countByEnumeratingWithState:&v30 objects:v42 count:16];
            if (v11)
            {
              uint64_t v12 = *(void *)v31;
              do
              {
                for (j = 0LL; j != v11; j = (char *)j + 1)
                {
                  if (*(void *)v31 != v12) {
                    objc_enumerationMutation(v10);
                  }
                  int v14 = *(void **)(*((void *)&v30 + 1) + 8LL * (void)j);
                  __int128 v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( NSNumber,  "numberWithUnsignedInt:",  [v14 applePayloadType]));
                  __int128 v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInt:]( NSNumber,  "numberWithInt:",  [v14 rssiThreshold]));
                  -[NSMutableDictionary setObject:forKey:](v3, "setObject:forKey:", v16, v15);
                  unint64_t v17 = (unint64_t)[v14 hash];

                  v5 ^= v17;
                }

                id v11 = [v10 countByEnumeratingWithState:&v30 objects:v42 count:16];
              }

              while (v11);
            }
          }
        }
      }

      id v26 = -[NSArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v34,  v43,  16LL);
    }

    while (v26);
  }

  else
  {
    int64_t v5 = 0LL;
  }

  if (self->_typeToRssiThresholdHash != v5)
  {
    v40[1] = @"descriptor";
    v41[0] = &off_1008C2870;
    v40[0] = @"type";
    __int128 v38 = @"TypeToRssiThresholdMapping";
    id v18 = -[NSMutableDictionary copy](v3, "copy");
    id v39 = v18;
    id v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v39,  &v38,  1LL));
    v41[1] = v19;
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v41,  v40,  2LL));

    if (dword_1008D6530 <= 40
      && (dword_1008D6530 != -1 || _LogCategory_Initialize(&dword_1008D6530, 40LL)))
    {
      LogPrintF_safe( &dword_1008D6530,  "-[CBStackBLEScannerBTStack _typeToRssiThresholdUpdate]",  40LL,  "typeToRssiThresholdHash changed from %ld to %ld. Sending report : %@",  v23->_typeToRssiThresholdHash,  v5,  v20);
    }

    uint64_t v21 = sub_1004051A8();
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472LL;
    v28[2] = sub_1000488B4;
    v28[3] = &unk_10087EA48;
    id v22 = v20;
    id v29 = v22;
    sub_100405384(v21, v28);
    v23->_typeToRssiThresholdHash = v5;
  }
}

- (BOOL)_addMfgScanIfNeeded:(unint64_t)a3 scanRequest:(void *)a4
{
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  unsigned __int8 v6 = self->_discoveryArray;
  id v7 = -[NSArray countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v15,  v19,  16LL);
  if (v7)
  {
    uint64_t v8 = *(void *)v16;
    while (2)
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v6);
        }
        uint64_t v10 = *(void **)(*((void *)&v15 + 1) + 8LL * (void)i);
        unint64_t v11 = [v10 discoveryFlags];
        unint64_t v12 = (unint64_t)[v10 extraDiscoveryFlags] | v11;
        if ((v12 & a3) != 0)
        {
          self->_aggregateDiscoveryFlags |= v12;
          BOOL v13 = 1;
          goto LABEL_11;
        }
      }

      id v7 = -[NSArray countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v15,  v19,  16LL);
      if (v7) {
        continue;
      }
      break;
    }
  }

  BOOL v13 = 0;
LABEL_11:

  return v13;
}

- (void)_addTypeIfNeeded:(unsigned __int8)a3 matchFlags:(unint64_t)a4 matchTypes:(id *)a5 scanRequest:(void *)a6
{
  unsigned int v124 = a3;
  if (a5) {
    BOOL v123 = (a5->var0[4] & 0x80u) != 0;
  }
  else {
    BOOL v123 = 0;
  }
  uint64_t v8 = "Invalid";
  switch(v124)
  {
    case 0u:
      break;
    case 1u:
      uint64_t v8 = "Hash";
      break;
    case 2u:
      uint64_t v8 = "iBeacon";
      break;
    case 3u:
      uint64_t v8 = "AirPrint";
      break;
    case 4u:
      uint64_t v8 = "LegacyATVSetup";
      break;
    case 5u:
      uint64_t v8 = "AirDrop";
      break;
    case 6u:
      uint64_t v8 = "HomeKitV1";
      break;
    case 7u:
      uint64_t v8 = "ProxPairing";
      break;
    case 8u:
      uint64_t v8 = "HeySiri";
      break;
    case 9u:
      uint64_t v8 = "AirPlayTarget";
      break;
    case 0xAu:
      uint64_t v8 = "AirPlaySource";
      break;
    case 0xBu:
      uint64_t v8 = "MagicSwitch";
      break;
    case 0xCu:
      uint64_t v8 = "Continuity";
      break;
    case 0xDu:
      uint64_t v8 = "TetheringTarget";
      break;
    case 0xEu:
      uint64_t v8 = "TetheringSource";
      break;
    case 0xFu:
      uint64_t v8 = "NearbyAction";
      break;
    case 0x10u:
      uint64_t v8 = "NearbyInfo";
      break;
    case 0x11u:
      uint64_t v8 = "HomeKitV2";
      break;
    case 0x12u:
      uint64_t v8 = "ObjectDiscovery";
      break;
    case 0x13u:
      uint64_t v8 = "SpatialInteraction";
      break;
    case 0x14u:
      uint64_t v8 = "DCKit";
      break;
    case 0x15u:
      uint64_t v8 = "NearbyActionV2";
      break;
    case 0x16u:
      uint64_t v8 = "NearbyInfoV2";
      break;
    case 0x17u:
    case 0x19u:
      goto LABEL_8;
    case 0x18u:
      uint64_t v8 = "DSInfo";
      break;
    case 0x1Au:
      uint64_t v8 = "NearbyActionNoWake";
      break;
    default:
      if (v124 == 100) {
        uint64_t v8 = "FastLEConnection";
      }
      else {
LABEL_8:
      }
        uint64_t v8 = "?";
      break;
  }

  v122 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v8,  4LL));
  uint64_t v9 = sub_1002E6E00();
  int v116 = (*(uint64_t (**)(uint64_t))(*(void *)v9 + 872LL))(v9);
  uint64_t __dst = 0LL;
  v153[0] = 0LL;
  *(void *)((char *)v153 + 6) = 0LL;
  uint64_t v150 = 0LL;
  v151[0] = 0LL;
  *(void *)((char *)v151 + 6) = 0LL;
  __int128 v144 = 0u;
  __int128 v145 = 0u;
  __int128 v146 = 0u;
  __int128 v147 = 0u;
  id obj = self->_discoveryArray;
  id v10 = -[NSArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v144,  v149,  16LL);
  if (v10)
  {
    BOOL v11 = 0;
    uint64_t v121 = 0LL;
    char v125 = 0;
    int v126 = 0;
    v113 = 0LL;
    v111 = 0LL;
    char v110 = 0;
    uint64_t v117 = 0LL;
    id v130 = *(id *)v145;
    v128 = 0LL;
    BOOL v13 = (a4 & 0x40000) == 0 || v124 != 19;
    BOOL v114 = v13;
    char v115 = 1;
    BOOL v127 = 1;
    BOOL v118 = 0;
    char v119 = 1;
    do
    {
      id v134 = v10;
      for (i = 0LL; i != v134; i = (char *)i + 1)
      {
        if (*(id *)v145 != v130) {
          objc_enumerationMutation(obj);
        }
        __int128 v15 = *(void **)(*((void *)&v144 + 1) + 8LL * (void)i);
        unint64_t v16 = (unint64_t)[v15 discoveryFlags];
        unint64_t v17 = (unint64_t)[v15 extraDiscoveryFlags] | v16;
        unsigned int v18 = (v17 & a4) != 0;
        if (a5 && (v17 & a4) == 0) {
          unsigned int v18 = [v15 discoveryTypesContainTypes:a5];
        }
        if (v18)
        {
          self->_aggregateDiscoveryFlags |= v17;
          if (a5) {
            CBDiscoveryTypesAddTypes( &self->_aggregateDiscoveryTypes, [v15 discoveryTypesInternalPtr]);
          }
          if ((v17 & 0x100000000000LL) == 0)
          {
            id v19 = v15;
            uint64_t v20 = (char *)[v19 discoveryTypesInternalPtr];
            int v21 = v20[4];
            if (((v123 ^ (v21 < 0)) & 1) == 0)
            {
              switch(v124)
              {
                case 0xFu:
                  if ((v17 & 0x2000000) != 0)
                  {
                    if ((v110 & 1) != 0)
                    {
                      char v110 = 1;
                    }

                    else
                    {
                      id v63 = v19;
                      if ((*(_BYTE *)[v63 discoveryTypesInternalPtr] & 4) != 0)
                      {
                        uint64_t v64 = (void *)objc_claimAutoreleasedReturnValue([v63 deviceFilter]);
                        uint64_t v65 = objc_claimAutoreleasedReturnValue(-[CBStackBLEScannerBTStack _deviceFilterUUIDs:](self, "_deviceFilterUUIDs:", v64));

                        char v110 = 1;
                        v128 = (void *)v65;
                      }

                      else
                      {
                        char v110 = 0;
                      }
                    }

                    if (!v111)
                    {
                      if ((id)-[NSData length](self->_selfAuthTagNonConnectable, "length") == (id)3
                        && (*((_BYTE *)[v19 discoveryTypesInternalPtr] + 1) & 0x40) != 0)
                      {
                        v111 = self->_selfAuthTagNonConnectable;
                      }

                      else
                      {
                        v111 = 0LL;
                      }
                    }
                  }

                  goto LABEL_92;
                case 0x13u:
                  unsigned int v22 = [v19 bleRSSIThresholdOrder];
                  BOOL v118 = (char)[v19 bleRSSIThresholdOrder] < 0;
                  id v23 = (void *)objc_claimAutoreleasedReturnValue([v19 spatialInteractionfilter]);
                  BOOL v24 = v23 == 0LL;

                  HIDWORD(v117) = (v22 >> 2) & 1;
                  if (!v24)
                  {
                    for (uint64_t j = 0LL; j != 22; ++j)
                      *((_BYTE *)&v153[-1] + j) = 0;
                    for (uint64_t k = 0LL; k != 22; ++k)
                      *((_BYTE *)&v151[-1] + k) = 0;
                    uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue([v19 spatialInteractionfilter]);
                    id v112 = (id)objc_claimAutoreleasedReturnValue([v27 blob]);

                    v28 = (void *)objc_claimAutoreleasedReturnValue([v19 spatialInteractionfilter]);
                    id v29 = (void *)objc_claimAutoreleasedReturnValue([v28 mask]);

                    id v30 = v112;
                    memcpy(&__dst, [v30 bytes], (size_t)[v30 length]);
                    id v31 = v29;
                    memcpy(&v150, [v31 bytes], (size_t)[v31 length]);
                  }

                  goto LABEL_92;
                case 0x15u:
                  if ((v17 & 0x400020108LL) == 0
                    && ![v19 discoveryTypesContainTypes:CBDiscoveryTypesNearbyActionV2(v20)])
                  {
                    goto LABEL_92;
                  }

                  if (v113) {
                    continue;
                  }
                  if ((id)-[NSData length](self->_selfAuthTag, "length") == (id)3)
                  {
                    v113 = self->_selfAuthTag;
                    goto LABEL_92;
                  }

                  v113 = 0LL;
                  continue;
                case 0x16u:
                  id v32 = v19;
                  char v33 = *((_BYTE *)[v32 discoveryTypesInternalPtr] + 2);
                  id v34 = v32;
                  LOBYTE(v117) = ((v33 & 0x40 | *(_BYTE *)[v34 discoveryTypesInternalPtr] & 0x10) != 0) | v117;
                  if ((self->_aggregateDiscoveryFlags & 0x40000) != 0)
                  {
                    int v48 = (void *)objc_claimAutoreleasedReturnValue([v34 oobKeys]);
                    BOOL v49 = v48 == 0LL;

                    if (v49) {
                      goto LABEL_92;
                    }
                    if (!self->_suppressedOobKeys)
                    {
                      int v50 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
                      suppressedOobKeys = self->_suppressedOobKeys;
                      self->_suppressedOobKeys = v50;

                      char v52 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
                      suppressedDeviceFilter = self->_suppressedDeviceFilter;
                      self->_suppressedDeviceFilter = v52;
                    }

                    int v54 = (void *)objc_claimAutoreleasedReturnValue([v34 oobKeys]);
                    v55 = self->_suppressedOobKeys;
                    v56 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( NSNumber,  "numberWithUnsignedInt:",  [v34 useCase]));
                    -[NSMutableDictionary setObject:forKeyedSubscript:](v55, "setObject:forKeyedSubscript:", v54, v56);

                    uint64_t v57 = (void *)objc_claimAutoreleasedReturnValue([v34 deviceFilter]);
                    int v58 = self->_suppressedDeviceFilter;
                    char v59 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( NSNumber,  "numberWithUnsignedInt:",  [v34 useCase]));
                    -[NSMutableDictionary setObject:forKeyedSubscript:](v58, "setObject:forKeyedSubscript:", v57, v59);

                    if (dword_1008D6530 <= 30
                      && (dword_1008D6530 != -1 || _LogCategory_Initialize(&dword_1008D6530, 30LL)))
                    {
                      int v60 = (void *)objc_claimAutoreleasedReturnValue([v34 oobKeys]);
                      id v61 = [v60 count];
                      unsigned int v62 = (void *)objc_claimAutoreleasedReturnValue([v34 deviceFilter]);
                      LogPrintF_safe( &dword_1008D6530,  "-[CBStackBLEScannerBTStack _addTypeIfNeeded:matchFlags:matchTypes:scanRequest:]",  30,  "Removing oob keys count :%lu and device filter count:%lu from controller",  v61,  [v62 count]);
                    }

                    [v34 setOobKeys:0];
                    [v34 setDeviceFilter:0];
                    goto LABEL_91;
                  }

                  __int128 v35 = self->_suppressedOobKeys;
                  if (v35)
                  {
                    __int128 v36 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( NSNumber,  "numberWithUnsignedInt:",  [v34 useCase]));
                    __int128 v37 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( v35,  "objectForKeyedSubscript:",  v36));
                    BOOL v38 = v37 == 0LL;

                    if (!v38)
                    {
                      id v39 = self->_suppressedOobKeys;
                      __int128 v40 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( NSNumber,  "numberWithUnsignedInt:",  [v34 useCase]));
                      int v41 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( v39,  "objectForKeyedSubscript:",  v40));
                      [v34 setOobKeys:v41];

                      char v42 = self->_suppressedDeviceFilter;
                      int v43 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( NSNumber,  "numberWithUnsignedInt:",  [v34 useCase]));
                      char v44 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( v42,  "objectForKeyedSubscript:",  v43));
                      [v34 setDeviceFilter:v44];

                      if (dword_1008D6530 <= 30
                        && (dword_1008D6530 != -1 || _LogCategory_Initialize(&dword_1008D6530, 30LL)))
                      {
                        int v45 = (void *)objc_claimAutoreleasedReturnValue([v34 oobKeys]);
                        id v46 = [v45 count];
                        char v47 = (void *)objc_claimAutoreleasedReturnValue([v34 deviceFilter]);
                        LogPrintF_safe( &dword_1008D6530,  "-[CBStackBLEScannerBTStack _addTypeIfNeeded:matchFlags:matchTypes:scanRequest:]",  30,  "Adding oob keys count :%lu and device filter count:%lu to controller",  v46,  [v47 count]);
                      }

                      v66 = self->_suppressedOobKeys;
                      v67 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( NSNumber,  "numberWithUnsignedInt:",  [v34 useCase]));
                      -[NSMutableDictionary setObject:forKeyedSubscript:](v66, "setObject:forKeyedSubscript:", 0LL, v67);

                      __int128 v68 = self->_suppressedDeviceFilter;
                      int v69 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( NSNumber,  "numberWithUnsignedInt:",  [v34 useCase]));
                      -[NSMutableDictionary setObject:forKeyedSubscript:](v68, "setObject:forKeyedSubscript:", 0LL, v69);

LABEL_91:
                      -[CBStackBLEScannerBTStack _oobKeysUpdate](self, "_oobKeysUpdate");
                    }
                  }

- (void)_addTypeWithParamsIfNeeded:(unsigned __int8)a3 matchFlags:(unint64_t)a4 matchTypes:(id *)a5 scanRequest:(void *)a6
{
  unsigned int v32 = a3;
  uint64_t v51 = 0LL;
  v52[0] = 0LL;
  *(void *)((char *)v52 + 6) = 0LL;
  uint64_t v49 = 0LL;
  v50[0] = 0LL;
  *(void *)((char *)v50 + 6) = 0LL;
  __int128 v44 = 0u;
  __int128 v45 = 0u;
  __int128 v46 = 0u;
  __int128 v47 = 0u;
  id obj = self->_discoveryArray;
  id v8 = -[NSArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v44,  v48,  16LL);
  if (!v8)
  {
    id v30 = 0LL;
    goto LABEL_95;
  }

  int v33 = 0;
  uint64_t v37 = *(void *)v45;
  id v30 = 0LL;
  while (2)
  {
    id v39 = v8;
    for (i = 0LL; i != v39; i = (char *)i + 1)
    {
      if (*(void *)v45 != v37) {
        objc_enumerationMutation(obj);
      }
      id v10 = *(void **)(*((void *)&v44 + 1) + 8LL * (void)i);
      unint64_t v11 = (unint64_t)[v10 discoveryFlags];
      unint64_t v12 = (unint64_t)[v10 extraDiscoveryFlags] | v11;
      unsigned int v13 = (v12 & a4) != 0;
      if (a5 && (v12 & a4) == 0) {
        unsigned int v13 = [v10 discoveryTypesContainTypes:a5];
      }
      if (v13)
      {
        self->_aggregateDiscoveryFlags |= v12;
        if (a5) {
          CBDiscoveryTypesAddTypes( &self->_aggregateDiscoveryTypes, [v10 discoveryTypesInternalPtr]);
        }
        if ((v12 & 0x100000000000LL) == 0)
        {
          if ((v12 & 0x2000000000LL) != 0)
          {
            self->_BOOL anyActiveScan = 1;
            if ((v12 & 0x100000000000000LL) == 0)
            {
LABEL_15:
              if ((v12 & 0x200000000000000LL) == 0) {
                goto LABEL_16;
              }
              goto LABEL_27;
            }
          }

          else if ((v12 & 0x100000000000000LL) == 0)
          {
            goto LABEL_15;
          }

          self->_objectDiscoveryFlags |= 2u;
          if ((v12 & 0x200000000000000LL) == 0)
          {
LABEL_16:
            if ((v12 & 0x10000000000LL) == 0) {
              goto LABEL_18;
            }
            goto LABEL_17;
          }

- (void)_addUUIDIfNeeded:(LeUuid *)a3 matchFlags:(unint64_t)a4 matchTypes:(id *)a5 uuids:(void *)a6
{
  int v33 = a3;
  __int128 v35 = 0u;
  __int128 v36 = 0u;
  __int128 v37 = 0u;
  __int128 v38 = 0u;
  uint64_t v9 = self->_discoveryArray;
  id v10 = -[NSArray countByEnumeratingWithState:objects:count:]( v9,  "countByEnumeratingWithState:objects:count:",  &v35,  v39,  16LL);
  if (v10)
  {
    uint64_t v11 = *(void *)v36;
    while (2)
    {
      for (i = 0LL; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v36 != v11) {
          objc_enumerationMutation(v9);
        }
        unsigned int v13 = *(void **)(*((void *)&v35 + 1) + 8LL * (void)i);
        unint64_t v14 = [v13 discoveryFlags];
        unint64_t v15 = (unint64_t)[v13 extraDiscoveryFlags] | v14;
        unsigned int v16 = (v15 & a4) != 0;
        if (a5 && (v15 & a4) == 0) {
          unsigned int v16 = [v13 discoveryTypesContainTypes:a5];
        }
        if (v16)
        {
          self->_aggregateDiscoveryFlags |= v15;
          if (a5) {
            CBDiscoveryTypesAddTypes( &self->_aggregateDiscoveryTypes, [v13 discoveryTypesInternalPtr]);
          }
          if ((v15 & 0x100000000000LL) == 0)
          {
            if ((v15 & 0x2000000000LL) != 0) {
              self->_BOOL anyActiveScan = 1;
            }
            if ((v15 & 0x200000000LL) != 0) {
              self->_anyNeedsDups = 1;
            }
            if ((v15 & 0x10000000000LL) != 0) {
              self->_anyRangeScauint64_t n = 1;
            }
            signed int v17 = [v13 bleScanRateOverride];
            if (!v17 && (self->_screenOn || (signed int v17 = [v13 bleScanRateScreenOff]) == 0))
            {
              signed int v17 = [v13 bleScanRate];
              if (!v17) {
                self->_scanRateAnyDefault = 1;
              }
            }

            if (v17 > self->_scanRateHighest) {
              self->_int scanRateHighest = v17;
            }
            unint64_t v18 = *((void *)a6 + 2);
            unint64_t v19 = *((void *)a6 + 1);
            if (v19 >= v18)
            {
              unint64_t v22 = 0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(v19 - *(void *)a6) >> 2);
              unint64_t v23 = v22 + 1;
              if (v22 + 1 > 0xCCCCCCCCCCCCCCCLL) {
                abort();
              }
              unint64_t v24 = 0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(v18 - *(void *)a6) >> 2);
              if (2 * v24 > v23) {
                unint64_t v23 = 2 * v24;
              }
              if (v24 >= 0x666666666666666LL) {
                unint64_t v25 = 0xCCCCCCCCCCCCCCCLL;
              }
              else {
                unint64_t v25 = v23;
              }
              if (v25) {
                char v26 = (char *)sub_100050420((uint64_t)a6 + 16, v25);
              }
              else {
                char v26 = 0LL;
              }
              char v27 = &v26[20 * v22];
              char v28 = &v26[20 * v25];
              __int128 v29 = *(_OWORD *)&v33->var0.var0;
              *((_DWORD *)v27 + 4) = *(_DWORD *)&v33->var0.var1.var2[12];
              *(_OWORD *)char v27 = v29;
              uint64_t v21 = v27 + 20;
              id v31 = *(char **)a6;
              id v30 = (char *)*((void *)a6 + 1);
              if (v30 != *(char **)a6)
              {
                do
                {
                  __int128 v32 = *(_OWORD *)(v30 - 20);
                  *((_DWORD *)v27 - 1) = *((_DWORD *)v30 - 1);
                  *(_OWORD *)(v27 - 20) = v32;
                  v27 -= 20;
                  v30 -= 20;
                }

                while (v30 != v31);
                id v30 = *(char **)a6;
              }

              *(void *)a6 = v27;
              *((void *)a6 + 1) = v21;
              *((void *)a6 + 2) = v28;
              if (v30) {
                operator delete(v30);
              }
            }

            else
            {
              __int128 v20 = *(_OWORD *)&v33->var0.var0;
              *(_DWORD *)(v19 + 16) = *(_DWORD *)&v33->var0.var1.var2[12];
              *(_OWORD *)unint64_t v19 = v20;
              uint64_t v21 = (char *)(v19 + 20);
            }

            *((void *)a6 + 1) = v21;
            goto LABEL_46;
          }
        }
      }

      id v10 = -[NSArray countByEnumeratingWithState:objects:count:]( v9,  "countByEnumeratingWithState:objects:count:",  &v35,  v39,  16LL);
      if (v10) {
        continue;
      }
      break;
    }
  }

- (void)_addUUIDIfNeededWithParams:(LeUuid *)a3 matchFlags:(unint64_t)a4 matchTypes:(id *)a5 scanRequest:(void *)a6
{
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  id obj = self->_discoveryArray;
  id v9 = -[NSArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v31,  v41,  16LL);
  if (v9)
  {
    uint64_t v10 = *(void *)v32;
    do
    {
      for (i = 0LL; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v32 != v10) {
          objc_enumerationMutation(obj);
        }
        unint64_t v12 = *(void **)(*((void *)&v31 + 1) + 8LL * (void)i);
        unint64_t v13 = (unint64_t)[v12 discoveryFlags];
        unint64_t v14 = (unint64_t)[v12 extraDiscoveryFlags] | v13;
        unsigned int v15 = (v14 & a4) != 0;
        if (a5 && (v14 & a4) == 0) {
          unsigned int v15 = [v12 discoveryTypesContainTypes:a5];
        }
        if (v15)
        {
          self->_aggregateDiscoveryFlags |= v14;
          if (a5) {
            CBDiscoveryTypesAddTypes( &self->_aggregateDiscoveryTypes, [v12 discoveryTypesInternalPtr]);
          }
          if ((v14 & 0x100000000000LL) == 0)
          {
            if ((v14 & 0x2000000000LL) != 0)
            {
              self->_BOOL anyActiveScan = 1;
              if ((v14 & 0x200000000LL) != 0) {
                goto LABEL_22;
              }
LABEL_15:
              if ((v14 & 0x10000000000LL) == 0)
              {
LABEL_17:
                signed int v16 = [v12 bleScanRateOverride];
                if (!v16 && (self->_screenOn || (signed int v16 = [v12 bleScanRateScreenOff]) == 0))
                {
                  signed int v16 = [v12 bleScanRate];
                  if (!v16) {
                    self->_scanRateAnyDefault = 1;
                  }
                }

                if (v16 > self->_scanRateHighest) {
                  self->_int scanRateHighest = v16;
                }
                int v17 = [v12 bleRSSIThresholdHint];
                if ((v17 & (v17 >> 31)) <= -90) {
                  char v18 = -90;
                }
                else {
                  char v18 = v17 & (v17 >> 31);
                }
                sub_100634348((uint64_t)&v39, 65061);
                BOOL v19 = sub_1001BEC7C(&a3->var0.var0, (unsigned __int8 *)&v39);
                if (v19)
                {
                  if ([v12 discoveryTypesContainTypes:CBDiscoveryTypesProximityService(v19)])
                  {
                    uint64_t v39 = 0LL;
                    v40[0] = 0LL;
                    *(void *)((char *)v40 + 6) = 0LL;
                    uint64_t v37 = 0LL;
                    v38[0] = 0LL;
                    *(void *)((char *)v38 + 6) = 0LL;
                    if ((*((_BYTE *)[v12 discoveryTypesInternalPtr] + 2) & 2) != 0)
                    {
                      for (uint64_t j = 0LL; j != 22; ++j)
                        *((_BYTE *)&v40[-1] + j) = 0;
                      for (uint64_t k = 0LL; k != 22; ++k)
                        *((_BYTE *)&v38[-1] + k) = 0;
                      LOBYTE(v39) = 6;
                      LOBYTE(v37) = 6;
                      __int128 v29 = 0LL;
                      id v30 = 0LL;
                      sub_10056AB04(&v29, &v39, 0x16uLL);
                      char v27 = 0LL;
                      char v28 = 0LL;
                      sub_10056AB04(&v27, &v37, 0x16uLL);
                      unint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([&off_1008C2888 stringValue]);
                      unint64_t v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "WatchSetup"));
                      __int128 v35 = *(_OWORD *)&a3->var0.var0;
                      int v36 = *(_DWORD *)&a3->var0.var1.var2[12];
                      sub_10004B5A8( a6,  v22,  v23,  &v35,  (uint64_t)&v29,  (uint64_t)&v27,  v18,  0,  0,  self->_targetCore,  1,  0,  0,  1);

                      char v27 = &off_10087FAA8;
                      if (v28) {
                        sub_1002CD254(v28);
                      }
                      __int128 v29 = &off_10087FAA8;
                      if (v30) {
                        sub_1002CD254(v30);
                      }
                    }
                  }
                }

                continue;
              }
            }

            else
            {
              if ((v14 & 0x200000000LL) == 0) {
                goto LABEL_15;
              }
LABEL_22:
              self->_anyNeedsDups = 1;
              if ((v14 & 0x10000000000LL) == 0) {
                goto LABEL_17;
              }
            }

            self->_anyRangeScauint64_t n = 1;
            goto LABEL_17;
          }
        }
      }

      id v9 = -[NSArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v31,  v41,  16LL);
    }

    while (v9);
  }
}

- (void)_addServiceUUIDsWithParametersToScanRequestIfNeeded:(void *)a3 matchFlags:(unint64_t)a4 matchTypes:(id *)a5 uuids:(void *)a6
{
  __int128 v73 = 0u;
  __int128 v74 = 0u;
  __int128 v75 = 0u;
  __int128 v76 = 0u;
  id obj = self->_discoveryArray;
  id v55 = -[NSArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v73,  v84,  16LL);
  if (v55)
  {
    uint64_t v53 = *(void *)v74;
    do
    {
      for (i = 0LL; i != v55; i = (char *)i + 1)
      {
        if (*(void *)v74 != v53) {
          objc_enumerationMutation(obj);
        }
        unsigned __int8 v6 = *(void **)(*((void *)&v73 + 1) + 8LL * (void)i);
        unint64_t v7 = (unint64_t)[v6 discoveryFlags];
        id v62 = v6;
        unint64_t v8 = (unint64_t)[v6 extraDiscoveryFlags] | v7;
        unsigned int v9 = (v8 & a4) != 0;
        if (a5 && (v8 & a4) == 0) {
          unsigned int v9 = [v62 discoveryTypesContainTypes:a5];
        }
        if (!v9) {
          continue;
        }
        self->_aggregateDiscoveryFlags |= v8;
        if (a5) {
          CBDiscoveryTypesAddTypes( &self->_aggregateDiscoveryTypes, [v62 discoveryTypesInternalPtr]);
        }
        if ((v8 & 0x100000000000LL) != 0) {
          continue;
        }
        if ((v8 & 0x2000000000LL) != 0)
        {
          self->_BOOL anyActiveScan = 1;
          if ((v8 & 0x200000000LL) != 0)
          {
LABEL_22:
            self->_anyNeedsDups = 1;
            if ((v8 & 0x10000000000LL) == 0) {
              goto LABEL_17;
            }
LABEL_16:
            self->_anyRangeScauint64_t n = 1;
            goto LABEL_17;
          }
        }

        else if ((v8 & 0x200000000LL) != 0)
        {
          goto LABEL_22;
        }

        if ((v8 & 0x10000000000LL) != 0) {
          goto LABEL_16;
        }
LABEL_17:
        signed int v10 = [v62 bleScanRateOverride];
        if (!v10 && (self->_screenOn || (signed int v10 = [v62 bleScanRateScreenOff]) == 0))
        {
          signed int v10 = [v62 bleScanRate];
          if (!v10) {
            self->_scanRateAnyDefault = 1;
          }
        }

        if (v10 > self->_scanRateHighest) {
          self->_int scanRateHighest = v10;
        }
        int v11 = [v62 bleRSSIThresholdHint];
        int v12 = v11 & (v11 >> 31);
        __int128 v71 = 0u;
        __int128 v72 = 0u;
        if (v12 <= -90) {
          LOBYTE(v12) = -90;
        }
        char v60 = v12;
        __int128 v69 = 0uLL;
        __int128 v70 = 0uLL;
        unint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v62 serviceUUIDs]);
        id v14 = [v13 countByEnumeratingWithState:&v69 objects:v83 count:16];
        if (v14)
        {
          LODWORD(v15) = 0;
          id v63 = v13;
          uint64_t v64 = *(void *)v70;
          do
          {
            for (uint64_t j = 0LL; j != v14; uint64_t j = (char *)j + 1)
            {
              if (*(void *)v70 != v64) {
                objc_enumerationMutation(v63);
              }
              int v17 = *(void **)(*((void *)&v69 + 1) + 8LL * (void)j);
              char v18 = (void *)objc_claimAutoreleasedReturnValue([v17 serviceUUID]);
              BOOL v19 = v18;
              if (v18 && (unint64_t)[v18 length] <= 0xFF)
              {
                __int128 v81 = 0uLL;
                int v82 = 0;
                id v20 = v19;
                sub_1006343C4( (uint64_t)&v81,  (int8x16_t *)[v20 bytes],  [v20 length]);
                uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v17 blobData]);
                if ([v21 length])
                {

LABEL_39:
                  memset(__dst, 0, 22);
                  memset(v79, 0, 22);
                  id v24 = objc_claimAutoreleasedReturnValue([v17 blobData]);
                  unint64_t v25 = (char *)[v24 bytes];
                  char v26 = (void *)objc_claimAutoreleasedReturnValue([v17 blobData]);
                  if ((unint64_t)[v26 length] > 0x15)
                  {
                    __int128 v28 = *(_OWORD *)v25;
                    *(void *)((char *)__dst + 14) = *(void *)(v25 + 14);
                    __dst[0] = v28;
                  }

                  else
                  {
                    char v27 = (void *)objc_claimAutoreleasedReturnValue([v17 blobData]);
                    memcpy(__dst, v25, (size_t)[v27 length]);
                  }

                  id v29 = objc_claimAutoreleasedReturnValue([v17 maskData]);
                  id v30 = (char *)[v29 bytes];
                  __int128 v31 = (void *)objc_claimAutoreleasedReturnValue([v17 maskData]);
                  if ((unint64_t)[v31 length] > 0x15)
                  {
                    __int128 v33 = *(_OWORD *)v30;
                    *(void *)((char *)v79 + 14) = *(void *)(v30 + 14);
                    v79[0] = v33;
                  }

                  else
                  {
                    __int128 v32 = (void *)objc_claimAutoreleasedReturnValue([v17 maskData]);
                    memcpy(v79, v30, (size_t)[v32 length]);
                  }

                  v67 = 0LL;
                  __int128 v68 = 0LL;
                  sub_10056AB04(&v67, __dst, 0x16uLL);
                  uint64_t v65 = 0LL;
                  v66 = 0LL;
                  sub_10056AB04(&v65, v79, 0x16uLL);
                  uint64_t v15 = (v15 + 1);
                  __int128 v34 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"ServiceUUIDwithBlobMask-%d",  v15));
                  __int128 v35 = (void *)objc_claimAutoreleasedReturnValue([v62 appID]);
                  __int128 v77 = v81;
                  int v78 = v82;
                  sub_10004B5A8( a3,  v34,  v35,  &v77,  (uint64_t)&v67,  (uint64_t)&v65,  v60,  0,  0,  self->_targetCore,  1,  0,  0,  1);

                  uint64_t v65 = &off_10087FAA8;
                  if (v66) {
                    sub_1002CD254(v66);
                  }
                  v67 = &off_10087FAA8;
                  if (v68) {
                    sub_1002CD254(v68);
                  }
                  goto LABEL_67;
                }

                unint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v17 maskData]);
                BOOL v23 = [v22 length] == 0;

                if (!v23) {
                  goto LABEL_39;
                }
                unint64_t v37 = *((void *)a6 + 1);
                unint64_t v36 = *((void *)a6 + 2);
                if (v37 >= v36)
                {
                  unint64_t v40 = 0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(v37 - *(void *)a6) >> 2);
                  unint64_t v41 = v40 + 1;
                  if (v40 + 1 > 0xCCCCCCCCCCCCCCCLL) {
                    abort();
                  }
                  unint64_t v42 = 0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(v36 - *(void *)a6) >> 2);
                  if (2 * v42 > v41) {
                    unint64_t v41 = 2 * v42;
                  }
                  if (v42 >= 0x666666666666666LL) {
                    unint64_t v43 = 0xCCCCCCCCCCCCCCCLL;
                  }
                  else {
                    unint64_t v43 = v41;
                  }
                  if (v43) {
                    __int128 v44 = (char *)sub_100050420((uint64_t)a6 + 16, v43);
                  }
                  else {
                    __int128 v44 = 0LL;
                  }
                  __int128 v45 = &v44[20 * v40];
                  __int128 v46 = v81;
                  *((_DWORD *)v45 + 4) = v82;
                  *(_OWORD *)__int128 v45 = v46;
                  int v48 = *(char **)a6;
                  __int128 v47 = (char *)*((void *)a6 + 1);
                  uint64_t v49 = v45;
                  if (v47 == *(char **)a6)
                  {
                    uint64_t v51 = a6;
                  }

                  else
                  {
                    do
                    {
                      __int128 v50 = *(_OWORD *)(v47 - 20);
                      *((_DWORD *)v49 - 1) = *((_DWORD *)v47 - 1);
                      *(_OWORD *)(v49 - 20) = v50;
                      v49 -= 20;
                      v47 -= 20;
                    }

                    while (v47 != v48);
                    uint64_t v51 = a6;
                    __int128 v47 = *(char **)a6;
                  }

                  uint64_t v39 = v45 + 20;
                  void *v51 = v49;
                  v51[1] = v45 + 20;
                  v51[2] = &v44[20 * v43];
                  if (v47) {
                    operator delete(v47);
                  }
                }

                else
                {
                  __int128 v38 = v81;
                  *(_DWORD *)(v37 + 16) = v82;
                  *(_OWORD *)unint64_t v37 = v38;
                  uint64_t v39 = (char *)(v37 + 20);
                }

                *((void *)a6 + 1) = v39;
              }

- (void)_addBufferedTypesIfNeeded:(id *)a3 scanRequest:(void *)a4
{
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  unsigned __int8 v6 = self->_discoveryArray;
  id v7 = -[NSArray countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v21,  v25,  16LL);
  if (v7)
  {
    uint64_t v8 = *(void *)v22;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v22 != v8) {
          objc_enumerationMutation(v6);
        }
        signed int v10 = *(void **)(*((void *)&v21 + 1) + 8LL * (void)i);
        if ([v10 discoveryTypesContainTypes:a3])
        {
          id v11 = v10;
          CBDiscoveryTypesAddTypes(&self->_aggregateDiscoveryTypes, [v11 discoveryTypesInternalPtr]);
          unint64_t v12 = (unint64_t)[v11 discoveryFlags];
          unint64_t v13 = (unint64_t)[v11 extraDiscoveryFlags] | v12;
          self->_aggregateDiscoveryFlags |= v13;
          if ((v13 & 0x100000000000LL) == 0)
          {
            int v19 = 0x2000;
            char v20 = 0;
            unsigned int v17 = 0x80000000;
            char v18 = 0;
            int v15 = 0x8000000;
            char v16 = 0;
            if ([v11 useCase] == 269)
            {
              self->_anyLeechBufferScauint64_t n = 1;
            }

            else
            {
              self->_BOOL anyNonLeechBufferScan = 1;
              signed int v14 = [v11 bleScanRateOverride];
              if (!v14 && (self->_screenOn || (signed int v14 = [v11 bleScanRateScreenOff]) == 0))
              {
                signed int v14 = [v11 bleScanRate];
                if (!v14) {
                  self->_scanRateAnyDefault = 1;
                }
              }

              if (v14 > self->_scanRateHighest) {
                self->_int scanRateHighest = v14;
              }
            }
          }
        }
      }

      id v7 = -[NSArray countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v21,  v25,  16LL);
    }

    while (v7);
  }
}

- (void)_reportAggressiveScanIfNeeded
{
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  id obj = self->_discoveryArray;
  id v3 = -[NSArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v15,  v19,  16LL);
  if (v3)
  {
    uint64_t v4 = *(void *)v16;
    do
    {
      for (i = 0LL; i != v3; i = (char *)i + 1)
      {
        if (*(void *)v16 != v4) {
          objc_enumerationMutation(obj);
        }
        unsigned __int8 v6 = *(void **)(*((void *)&v15 + 1) + 8LL * (void)i);
        signed int v7 = [v6 bleScanRateOverride];
        screenOuint64_t n = self->_screenOn;
        if (self->_screenOn) {
          int v9 = 31;
        }
        else {
          int v9 = 21;
        }
        if (v7 < v9)
        {
          screenOuint64_t n = self->_screenOn;
        }

        BOOL v10 = !screenOn;
        id v11 = @"agsN";
        if (v10) {
          id v11 = @"agsF";
        }
        unint64_t v12 = v11;
        unint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[CBMetricsDaemon sharedCBMetricsDaemon](&OBJC_CLASS___CBMetricsDaemon, "sharedCBMetricsDaemon"));
        [v13 reportAggressiveScan:v6 action:v12];
      }

      id v3 = -[NSArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v15,  v19,  16LL);
    }

    while (v3);
  }
}

- (id)_deviceFilterUUIDs:(id)a3
{
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  id v3 = a3;
  uint64_t v4 = 0LL;
  id v5 = [v3 countByEnumeratingWithState:&v15 objects:v20 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v16;
    do
    {
      signed int v7 = 0LL;
      do
      {
        if (*(void *)v16 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v15 + 1) + 8LL * (void)v7);
        int v9 = objc_alloc(&OBJC_CLASS___NSUUID);
        BOOL v10 = -[NSUUID initWithUUIDString:](v9, "initWithUUIDString:", v8, (void)v15);
        if (v10) {
          goto LABEL_10;
        }
        unint64_t v11 = sub_1005C02B0(v8);
        v19[0] = 0LL;
        v19[1] = 0LL;
        if (qword_1008D5F30 != -1) {
          dispatch_once(&qword_1008D5F30, &stru_100880310);
        }
        sub_1005C8684((uint64_t)off_1008D5F28, v11, 1u, 1u, 0LL, 0LL, (unsigned __int8 *)v19);
        unint64_t v12 = sub_100241F94((const unsigned __int8 *)v19);
        BOOL v10 = (NSUUID *)objc_claimAutoreleasedReturnValue(v12);
        if (v10)
        {
LABEL_10:
          if (!v4) {
            uint64_t v4 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
          }
          -[NSMutableSet addObject:](v4, "addObject:", v10);
        }

        signed int v7 = (char *)v7 + 1;
      }

      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v15 objects:v20 count:16];
    }

    while (v5);
  }

  if (-[NSMutableSet count](v4, "count")) {
    unint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableSet allObjects](v4, "allObjects"));
  }
  else {
    unint64_t v13 = 0LL;
  }

  return v13;
}

- (id)_scanSummary:(void *)a3
{
  uint64_t v138 = 0LL;
  __int128 v139 = &v138;
  uint64_t v140 = 0x3032000000LL;
  v141 = sub_100043220;
  v142 = sub_100043230;
  id v143 = 0LL;
  id obj = 0LL;
  uint64_t v5 = CUPrintFlags64(self->_aggregateDiscoveryFlags, &unk_1006BAF3C);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v87 = a3;
  NSAppendPrintF_safe(&obj, "DsFl %@", v6);
  objc_storeStrong(&v143, obj);

  signed int v7 = (id *)(v139 + 5);
  id v136 = (id)v139[5];
  CBDiscoveryTypesAppendString(&v136, ", DsTy", &self->_aggregateDiscoveryTypes);
  objc_storeStrong(v7, v136);
  if (-[NSSet count](self->_sensorTrackingDevices, "count"))
  {
    uint64_t v8 = (id *)(v139 + 5);
    id v135 = (id)v139[5];
    NSAppendPrintF_safe(&v135, ", DeviceFilter: [ ");
    objc_storeStrong(v8, v135);
    __int128 v133 = 0u;
    __int128 v134 = 0u;
    __int128 v131 = 0u;
    __int128 v132 = 0u;
    int v9 = self->_sensorTrackingDevices;
    id v10 = -[NSSet countByEnumeratingWithState:objects:count:]( v9,  "countByEnumeratingWithState:objects:count:",  &v131,  v144,  16LL);
    if (v10)
    {
      uint64_t v11 = *(void *)v132;
      unint64_t v12 = "";
      do
      {
        for (i = 0LL; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v132 != v11) {
            objc_enumerationMutation(v9);
          }
          signed int v14 = *(void **)(*((void *)&v131 + 1) + 8LL * (void)i);
          __int128 v15 = (id *)(v139 + 5);
          id v130 = (id)v139[5];
          __int128 v16 = (void *)objc_claimAutoreleasedReturnValue([v14 UUIDString]);
          NSAppendPrintF_safe(&v130, "%s%@", v12, v16);
          objc_storeStrong(v15, v130);

          unint64_t v12 = ", ";
        }

        id v10 = -[NSSet countByEnumeratingWithState:objects:count:]( v9,  "countByEnumeratingWithState:objects:count:",  &v131,  v144,  16LL);
        unint64_t v12 = ", ";
      }

      while (v10);
    }

    __int128 v17 = (id *)(v139 + 5);
    id v129 = (id)v139[5];
    NSAppendPrintF_safe(&v129, " ]");
    objc_storeStrong(v17, v129);
  }

  if (-[NSMutableDictionary count](self->_oobKeyMap, "count"))
  {
    __int128 v18 = (id *)(v139 + 5);
    id v128 = (id)v139[5];
    NSAppendPrintF_safe(&v128, ", OOBKeys: [ ");
    objc_storeStrong(v18, v128);
    unsigned int v124 = 0LL;
    char v125 = &v124;
    uint64_t v126 = 0x2020000000LL;
    char v127 = 1;
    oobKeyMap = self->_oobKeyMap;
    v123[0] = _NSConcreteStackBlock;
    v123[1] = 3221225472LL;
    v123[2] = sub_10004DA34;
    v123[3] = &unk_1008801B8;
    v123[4] = &v138;
    v123[5] = &v124;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](oobKeyMap, "enumerateKeysAndObjectsUsingBlock:", v123);
    char v20 = (id *)(v139 + 5);
    id v122 = (id)v139[5];
    NSAppendPrintF_safe(&v122, " ]");
    objc_storeStrong(v20, v122);
    _Block_object_dispose(&v124, 8);
  }

  __int128 v21 = (id *)(v139 + 5);
  id v121 = (id)v139[5];
  if (self->_screenOn) {
    __int128 v22 = "yes";
  }
  else {
    __int128 v22 = "no";
  }
  NSAppendPrintF_safe(&v121, ", ScreenOn %s", v22);
  objc_storeStrong(v21, v121);
  __int128 v23 = (unsigned __int8 *)a3;
  if (a3)
  {
    if (*((_BYTE *)a3 + 144))
    {
      __int128 v24 = (id *)(v139 + 5);
      id v120 = (id)v139[5];
      NSAppendPrintF_safe(&v120, ", RetainDups %s", "yes");
      objc_storeStrong(v24, v120);
      __int128 v23 = (unsigned __int8 *)a3;
    }

    if (v23[120])
    {
      unsigned int v26 = *((_DWORD *)v23 + 32);
      int v25 = *((_DWORD *)v23 + 33);
      unsigned int v27 = v26 ? 100 * v25 / v26 : 0;
      int v28 = v23[136];
      id v29 = (id *)(v139 + 5);
      id v119 = (id)v139[5];
      NSAppendPrintF_safe(&v119, ", %u/%u ms (%u%%)", v25, v26, v27);
      objc_storeStrong(v29, v119);
      __int128 v23 = (unsigned __int8 *)a3;
      if (v28)
      {
        id v30 = (id *)(v139 + 5);
        id v118 = (id)v139[5];
        NSAppendPrintF_safe(&v118, ", ActiveScan %s", "yes");
        objc_storeStrong(v30, v118);
        __int128 v23 = (unsigned __int8 *)a3;
      }
    }

    if (*v23)
    {
      __int128 v31 = (id *)(v139 + 5);
      id v117 = (id)v139[5];
      NSAppendPrintF_safe(&v117, ", OverallDups %s", "yes");
      objc_storeStrong(v31, v117);
      __int128 v23 = (unsigned __int8 *)a3;
    }

    if (v23[140])
    {
      __int128 v32 = (id *)(v139 + 5);
      id v116 = (id)v139[5];
      NSAppendPrintF_safe(&v116, ", RangeScan %s", "yes");
      objc_storeStrong(v32, v116);
      __int128 v23 = (unsigned __int8 *)a3;
    }

    unsigned int v124 = 0LL;
    char v125 = 0LL;
    uint64_t v126 = 0LL;
    sub_1000516DC( &v124,  *((void *)v23 + 8),  *((void *)v23 + 9),  0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((void *)v23 + 9) - *((void *)v23 + 8)) >> 5));
    if (v124 != v125)
    {
      __int128 v33 = (id *)(v139 + 5);
      id v115 = (id)v139[5];
      NSAppendPrintF_safe(&v115, ", Filters: ");
      objc_storeStrong(v33, v115);
      __int128 v34 = v124;
      NSUInteger v88 = v125;
      if (v124 != v125)
      {
        __int128 v35 = "";
        unint64_t v36 = " ";
        unint64_t v37 = "%s..";
        __int128 v38 = "";
        do
        {
          uint64_t v39 = (id *)(v139 + 5);
          id v114 = (id)v139[5];
          NSAppendPrintF_safe(&v114, "%s{Type %d", v38, *((unsigned __int8 *)v34 + 8));
          objc_storeStrong(v39, v114);
          unint64_t v40 = (id *)(v139 + 5);
          id v113 = (id)v139[5];
          unint64_t v41 = "yes";
          if (!*((_BYTE *)v34 + 50)) {
            unint64_t v41 = "no";
          }
          NSAppendPrintF_safe(&v113, ", Dups %s", v41);
          objc_storeStrong(v40, v113);
          unint64_t v42 = (id *)(v139 + 5);
          id v112 = (id)v139[5];
          NSAppendPrintF_safe(&v112, ", RSSI %d", *((char *)v34 + 48));
          objc_storeStrong(v42, v112);
          if (*((_BYTE *)v34 + 64))
          {
            unint64_t v43 = (id *)(v139 + 5);
            id v111 = (id)v139[5];
            NSAppendPrintF_safe(&v111, ", ObjL");
            objc_storeStrong(v43, v111);
          }

          if (!*((_BYTE *)v34 + 68))
          {
            __int128 v44 = (id *)(v139 + 5);
            id v110 = (id)v139[5];
            NSAppendPrintF_safe(&v110, ", NoConfigController");
            objc_storeStrong(v44, v110);
          }

          if (!*((_BYTE *)v34 + 65))
          {
            __int128 v45 = (id *)(v139 + 5);
            id v109 = (id)v139[5];
            NSAppendPrintF_safe(&v109, ", NoConsolidateRule");
            objc_storeStrong(v45, v109);
          }

          __int128 v46 = (unsigned int *)v34[5];
          int v97 = &off_10087FAA8;
          uint64_t v98 = v46;
          if (v46) {
            sub_1002CD1E0((uint64_t)v46);
          }
          uint64_t v47 = sub_10056AAF0((uint64_t)&v97);
          unint64_t v48 = sub_10056AAD8((uint64_t)&v97);
          unint64_t v49 = 0LL;
          if (v48)
          {
            while (!*(_BYTE *)(v47 + v49))
            {
              if (v48 == ++v49) {
                goto LABEL_80;
              }
            }
          }

          if (v49 != v48)
          {
            if (v49 >= v48) {
              unint64_t v50 = v48;
            }
            else {
              unint64_t v50 = v49;
            }
            while (v48 > v49)
            {
              unint64_t v51 = v48 - 1;
              if (*(unsigned __int8 *)(v47 - 1 + v48--))
              {
                unint64_t v50 = v51 + 1;
                break;
              }
            }

            uint64_t v53 = (unsigned int *)v34[3];
            __p = &off_10087FAA8;
            int v93 = v53;
            if (v53) {
              sub_1002CD1E0((uint64_t)v53);
            }
            uint64_t v89 = sub_10056AAF0((uint64_t)&__p);
            unint64_t v90 = sub_10056AAD8((uint64_t)&__p);
            int v54 = (id *)(v139 + 5);
            id v108 = (id)v139[5];
            NSAppendPrintF_safe(&v108, ", Blob [");
            objc_storeStrong(v54, v108);
            if (v49)
            {
              for (uint64_t j = 0LL; j != v49; ++j)
              {
                v56 = (id *)(v139 + 5);
                id v107 = (id)v139[5];
                if (j) {
                  uint64_t v57 = v36;
                }
                else {
                  uint64_t v57 = v35;
                }
                NSAppendPrintF_safe(&v107, v37, v57);
                objc_storeStrong(v56, v107);
              }
            }

            unint64_t v58 = v49;
            if (v49 < v50)
            {
              do
              {
                unint64_t v59 = v50;
                char v60 = v37;
                id v61 = v34;
                id v62 = v36;
                id v63 = v35;
                uint64_t v64 = v62;
                if (!v58) {
                  id v62 = v35;
                }
                uint64_t v65 = (id *)(v139 + 5);
                if (v58 >= v90)
                {
                  uint64_t v105 = v139[5];
                  v66 = (id *)&v105;
                  NSAppendPrintF_safe(&v105, "%s~~", v62);
                }

                else
                {
                  uint64_t v106 = v139[5];
                  v66 = (id *)&v106;
                  NSAppendPrintF_safe(&v106, "%s%02X", v62, *(unsigned __int8 *)(v89 + v58));
                }

                objc_storeStrong(v65, *v66);
                __int128 v35 = v63;
                unint64_t v36 = v64;
                __int128 v34 = v61;
                unint64_t v37 = v60;
                unint64_t v50 = v59;
                ++v58;
              }

              while (v59 != v58);
            }

            v67 = (id *)(v139 + 5);
            id v104 = (id)v139[5];
            NSAppendPrintF_safe(&v104, "], Mask [");
            objc_storeStrong(v67, v104);
            if (v49)
            {
              for (uint64_t k = 0LL; k != v49; ++k)
              {
                __int128 v69 = (id *)(v139 + 5);
                id v103 = (id)v139[5];
                if (k) {
                  __int128 v70 = v36;
                }
                else {
                  __int128 v70 = v35;
                }
                NSAppendPrintF_safe(&v103, v37, v70);
                objc_storeStrong(v69, v103);
              }
            }

            if (v49 < v50)
            {
              do
              {
                __int128 v71 = (id *)(v139 + 5);
                id v102 = (id)v139[5];
                if (v49) {
                  __int128 v72 = v36;
                }
                else {
                  __int128 v72 = v35;
                }
                NSAppendPrintF_safe(&v102, "%s%02X", v72, *(unsigned __int8 *)(v47 + v49));
                objc_storeStrong(v71, v102);
                ++v49;
              }

              while (v50 != v49);
            }

            __int128 v73 = (id *)(v139 + 5);
            id v101 = (id)v139[5];
            NSAppendPrintF_safe(&v101, "]");
            objc_storeStrong(v73, v101);
            __p = &off_10087FAA8;
            if (v93) {
              sub_1002CD254(v93);
            }
          }

- (void)_sensorTrackingUpdate
{
  __int128 v59 = 0u;
  __int128 v60 = 0u;
  __int128 v61 = 0u;
  __int128 v62 = 0u;
  id obj = self->_discoveryArray;
  id v2 = -[NSArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v59,  v69,  16LL);
  if (v2)
  {
    id v3 = 0LL;
    uint64_t v39 = *(void *)v60;
    id v40 = v2;
    uint64_t v4 = &AMFDRSealingMapCopyLocalDictForClass_ptr;
    do
    {
      for (i = 0LL; i != v40; i = (char *)i + 1)
      {
        if (*(void *)v60 != v39) {
          objc_enumerationMutation(obj);
        }
        uint64_t v5 = *(void **)(*((void *)&v59 + 1) + 8LL * (void)i);
        if (([v5 discoveryFlags] & 0x20000000) != 0)
        {
          __int128 v57 = 0u;
          __int128 v58 = 0u;
          __int128 v55 = 0u;
          __int128 v56 = 0u;
          uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 deviceFilter]);
          id v7 = [v6 countByEnumeratingWithState:&v55 objects:v68 count:16];
          if (v7)
          {
            uint64_t v8 = *(void *)v56;
            unint64_t v42 = v5;
            unint64_t v43 = v6;
            do
            {
              int v9 = 0LL;
              do
              {
                if (*(void *)v56 != v8) {
                  objc_enumerationMutation(v6);
                }
                id v10 = *(void **)(*((void *)&v55 + 1) + 8LL * (void)v9);
                id v11 = [objc_alloc((Class)v4[397]) initWithUUIDString:v10];
                if (v11) {
                  goto LABEL_13;
                }
                __int16 v54 = 0;
                int v53 = 0;
                if (TextToHardwareAddress( [v10 UTF8String], -1, 6, &v53)) {
                  goto LABEL_17;
                }
                __int128 v44 = v3;
                unint64_t v12 = v4;
                uint64_t v13 = v53;
                uint64_t v14 = BYTE1(v53);
                uint64_t v15 = BYTE2(v53);
                uint64_t v16 = HIBYTE(v53);
                uint64_t v17 = v54;
                uint64_t v18 = HIBYTE(v54);
                uint64_t v63 = 0LL;
                uint64_t v64 = 0LL;
                if (qword_1008D5F30 != -1) {
                  dispatch_once(&qword_1008D5F30, &stru_100880310);
                }
                sub_1005C8684( (uint64_t)off_1008D5F28,  (v13 << 40) | (v14 << 32) | (v15 << 24) | (v16 << 16) | (v17 << 8) | v18,  1u,  1u,  0LL,  0LL,  (unsigned __int8 *)&v63);
                int v19 = sub_100241F94((const unsigned __int8 *)&v63);
                id v11 = (id)objc_claimAutoreleasedReturnValue(v19);
                uint64_t v4 = v12;
                uint64_t v6 = v43;
                id v3 = v44;
                uint64_t v5 = v42;
                if (v11)
                {
LABEL_13:
                  if (!v3) {
                    id v3 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
                  }
                  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v5, v11);
                }

                else
                {
LABEL_17:
                  id v11 = 0LL;
                }

                int v9 = (char *)v9 + 1;
              }

              while (v7 != v9);
              id v20 = [v6 countByEnumeratingWithState:&v55 objects:v68 count:16];
              id v7 = v20;
            }

            while (v20);
          }
        }
      }

      id v40 = -[NSArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v59,  v69,  16LL);
    }

    while (v40);
  }

  else
  {
    id v3 = 0LL;
  }

  __int128 v51 = 0u;
  __int128 v52 = 0u;
  __int128 v49 = 0u;
  __int128 v50 = 0u;
  __int128 v21 = self->_sensorTrackingDevices;
  id v22 = -[NSSet countByEnumeratingWithState:objects:count:]( v21,  "countByEnumeratingWithState:objects:count:",  &v49,  v67,  16LL);
  int v23 = 0;
  if (v22)
  {
    uint64_t v24 = *(void *)v50;
    do
    {
      for (uint64_t j = 0LL; j != v22; uint64_t j = (char *)j + 1)
      {
        if (*(void *)v50 != v24) {
          objc_enumerationMutation(v21);
        }
        uint64_t v26 = *(void *)(*((void *)&v49 + 1) + 8LL * (void)j);
        unsigned int v27 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v3, "objectForKeyedSubscript:", v26));
        BOOL v28 = v27 == 0LL;

        if (v28)
        {
          if (dword_1008D6530 <= 30
            && (dword_1008D6530 != -1 || _LogCategory_Initialize(&dword_1008D6530, 30LL)))
          {
            LogPrintF_safe( &dword_1008D6530,  "-[CBStackBLEScannerBTStack _sensorTrackingUpdate]",  30LL,  "SensorTracking stop %@",  v26);
          }

          sessionHandle = self->_sessionHandle;
          uint64_t v30 = sub_100404FE8();
          v48[0] = _NSConcreteStackBlock;
          v48[1] = 3221225472LL;
          v48[2] = sub_10004E284;
          v48[3] = &unk_1008800B8;
          v48[4] = v26;
          v48[5] = sessionHandle;
          sub_100405384(v30, v48);
          ++v23;
        }
      }

      id v22 = -[NSSet countByEnumeratingWithState:objects:count:]( v21,  "countByEnumeratingWithState:objects:count:",  &v49,  v67,  16LL);
    }

    while (v22);
  }

  uint64_t v63 = 0LL;
  uint64_t v64 = &v63;
  uint64_t v65 = 0x2020000000LL;
  int v66 = 0;
  v45[0] = _NSConcreteStackBlock;
  v45[1] = 3221225472LL;
  v45[2] = sub_10004E2D8;
  v45[3] = &unk_100880208;
  char v47 = 1;
  int v46 = -127;
  v45[4] = self;
  v45[5] = &v63;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](v3, "enumerateKeysAndObjectsUsingBlock:", v45);
  if (*((_DWORD *)v64 + 6) | v23)
  {
    if (dword_1008D6530 <= 30
      && (dword_1008D6530 != -1 || _LogCategory_Initialize(&dword_1008D6530, 30LL)))
    {
      unsigned int v31 = -[NSSet count](self->_sensorTrackingDevices, "count");
      unsigned int v32 = -[NSMutableDictionary count](v3, "count");
      LogPrintF_safe( &dword_1008D6530,  "-[CBStackBLEScannerBTStack _sensorTrackingUpdate]",  30LL,  "SensorTracking update: %d -> %d total, %d started, %d stopped",  v31,  v32,  *((_DWORD *)v64 + 6),  v23);
    }
  }

  else if (dword_1008D6530 <= 10 {
         && (dword_1008D6530 != -1 || _LogCategory_Initialize(&dword_1008D6530, 10LL)))
  }
  {
    LogPrintF_safe( &dword_1008D6530,  "-[CBStackBLEScannerBTStack _sensorTrackingUpdate]",  10LL,  "SensorTracking update: unchanged, %d total",  -[NSMutableDictionary count](v3, "count"));
  }

  if (v3)
  {
    __int128 v33 = objc_alloc(&OBJC_CLASS___NSSet);
    __int128 v34 = (NSSet *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](v3, "allKeys"));
    __int128 v35 = -[NSSet initWithArray:](v33, "initWithArray:", v34);
    sensorTrackingDevices = self->_sensorTrackingDevices;
    self->_sensorTrackingDevices = v35;
  }

  else
  {
    __int128 v34 = self->_sensorTrackingDevices;
    self->_sensorTrackingDevices = 0LL;
  }

  self->_unint64_t aggregateDiscoveryFlags = self->_aggregateDiscoveryFlags & 0xFFFFFFFFDFFFFFFFLL | ((unint64_t)(-[NSMutableDictionary count](v3, "count") != 0LL) << 29);
  _Block_object_dispose(&v63, 8);
}

- (unint64_t)aggregateDiscoveryFlags
{
  id v2 = self;
  objc_sync_enter(v2);
  unint64_t aggregateDiscoveryFlags = v2->_aggregateDiscoveryFlags;
  objc_sync_exit(v2);

  return aggregateDiscoveryFlags;
}

- ($F9CA75CC5B4E604BACB273E5A2091FCB)aggregateDiscoveryTypes
{
  id v2 = self;
  objc_sync_enter(v2);
  unint64_t v3 = *(unsigned int *)v2->_aggregateDiscoveryTypes.bitArray | ((unint64_t)v2->_aggregateDiscoveryTypes.bitArray[4] << 32);
  objc_sync_exit(v2);

  return ($F9CA75CC5B4E604BACB273E5A2091FCB)v3;
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

- (id)devicesBufferedHandler
{
  return self->_devicesBufferedHandler;
}

- (void)setDevicesBufferedHandler:(id)a3
{
}

- (NSArray)discoveryArray
{
  return self->_discoveryArray;
}

- (void)setDiscoveryArray:(id)a3
{
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void)setInvalidationHandler:(id)a3
{
}

- (BOOL)screenOn
{
  return self->_screenOn;
}

- (void)setScreenOn:(BOOL)a3
{
  self->_screenOuint64_t n = a3;
}

- (NSData)selfAuthTag
{
  return self->_selfAuthTag;
}

- (void)setSelfAuthTag:(id)a3
{
}

- (NSData)selfAuthTagNonConnectable
{
  return self->_selfAuthTagNonConnectable;
}

- (void)setSelfAuthTagNonConnectable:(id)a3
{
}

- (void).cxx_destruct
{
}

- (id).cxx_construct
{
  self->_bleScannerCPP._vptr$LeObserverListener = (void **)&off_100880260;
  self->_bleScannerCPP._bleScannerObjC = 0LL;
  unint64_t v3 = &_dispatch_main_q;
  self->_bleScannerCPP._dispatchQueue = (OS_dispatch_queue *)&_dispatch_main_q;
  self->_bleScannerCPP._reportedNonLeech = 0;
  return self;
}

@end
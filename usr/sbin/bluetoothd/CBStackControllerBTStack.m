@interface CBStackControllerBTStack
- (BOOL)_deleteDevice:(id)a3 error:(id *)a4;
- (BOOL)_disconnectDevice:(id)a3 serviceFlags:(unsigned int)a4 error:(id *)a5;
- (BOOL)addDiscoverableController:(id)a3 error:(id *)a4;
- (BOOL)addPairingClient:(id)a3 error:(id *)a4;
- (BOOL)connectDevice:(id)a3 connectionFlags:(unsigned int)a4 serviceFlags:(unsigned int)a5 error:(id *)a6;
- (BOOL)deleteDevice:(id)a3 error:(id *)a4;
- (BOOL)disconnectDevice:(id)a3 serviceFlags:(unsigned int)a4 error:(id *)a5;
- (BOOL)isDeviceConnected:(id)a3 error:(id *)a4;
- (BOOL)modifyDevice:(id)a3 btDevice:(void *)a4 settings:(id)a5 error:(id *)a6;
- (BOOL)modifyDevice:(id)a3 error:(id *)a4;
- (BOOL)modifyDevice:(id)a3 leDevice:(void *)a4 settings:(id)a5 error:(id *)a6;
- (BOOL)modifyDevice:(id)a3 peerSourceDevice:(id)a4 peerSourceState:(char)a5 requestFlags:(unsigned int)a6 error:(id *)a7;
- (BOOL)modifyDevice:(id)a3 settings:(id)a4 error:(id *)a5;
- (BOOL)pairingContinueWithPairingInfo:(id)a3 error:(id *)a4;
- (BOOL)poweredOn;
- (BOOL)sendAudioAccessoryConfig:(id)a3 device:(id)a4 error:(id *)a5;
- (BOOL)sendAudioAccessoryEventMessage:(id)a3 eventType:(unsigned __int8)a4 device:(id)a5 error:(id *)a6;
- (BOOL)sendConversationDetectMessage:(id)a3 device:(id)a4 error:(id *)a5;
- (BOOL)sendRelayMessageType:(unsigned __int8)a3 messageData:(id)a4 conduitDevice:(id)a5 destinationDevice:(id)a6 error:(id *)a7;
- (BOOL)sendSmartRoutingInformation:(id)a3 device:(id)a4 error:(id *)a5;
- (BOOL)setLowPowerModeWithReason:(int)a3 error:(id *)a4;
- (BOOL)setPowerState:(int64_t)a3 error:(id *)a4;
- (BOOL)updateControllerInfo:(id)a3 error:(id *)a4;
- (CBControllerInfo)controllerInfo;
- (CBStackControllerBTStack)init;
- (NSData)fastLEConnectionInfoData;
- (OS_dispatch_queue)dispatchQueue;
- (id)_btUUIDWithID:(id)a3 error:(id *)a4;
- (id)controllerDataChangedHandler;
- (id)description;
- (id)descriptionWithLevel:(int)a3;
- (id)diagnosticControl:(id)a3;
- (id)discoverableStateChangedHandler;
- (id)getDevicesWithFlags:(unsigned int)a3 error:(id *)a4;
- (id)inquiryStateChangedHandler;
- (id)invalidationHandler;
- (id)powerChangedHandler;
- (id)relayMessageHandler;
- (int)discoverableState;
- (int)inquiryState;
- (int64_t)powerState;
- (unsigned)fastLEConnectionInfoVersion;
- (void)_accessoryCommandStatusWithDevice:(id)a3 type:(int)a4 result:(unsigned __int16)a5 reason:(unsigned __int16)a6;
- (void)_accessoryReceivedRelayMessageType:(unsigned __int8)a3 messageData:(id)a4 conduitDevice:(id)a5 sourceDevice:(id)a6;
- (void)_btDeviceWithID:(id)a3 createIfNeeded:(BOOL)a4 error:(id *)a5;
- (void)_btDeviceWithID:(id)a3 error:(id *)a4;
- (void)_completePerformDeviceRequest:(id)a3 error:(id)a4;
- (void)_connectDeviceCompleteRequest:(id)a3 error:(id)a4;
- (void)_connectDeviceUpdateRequests:(id)a3 btResult:(int)a4;
- (void)_deleteAllDevices;
- (void)_disconnectAllDevicesWithServiceFlags:(unsigned int)a3;
- (void)_modifyDeviceCompleteRequest:(id)a3 error:(id)a4;
- (void)_pairingAgentTearDown;
- (void)_pairingCompletedWithBTDevice:(void *)a3 result:(int)a4;
- (void)_pairingPromptWithBTDevice:(void *)a3 pairingType:(int64_t)a4 pinString:(id)a5 flags:(unsigned int)a6;
- (void)_readRSSIWithConnectionHandle:(_OI_HCI_CONNECTION *)a3 status:(int)a4 rssi:(char)a5;
- (void)_readTxPowerWithFlags:(unsigned int)a3 status:(int)a4 connectionHandle:(_OI_HCI_CONNECTION *)a5 txPowerLevel:(char)a6;
- (void)activate;
- (void)connectWithCBConnection:(id)a3 completionHandler:(id)a4;
- (void)invalidate;
- (void)localDeviceEvent:(int)a3;
- (void)modifyDevice:(id)a3 connectionPriorityDevices:(id)a4 timeoutSeconds:(double)a5 completionHandler:(id)a6;
- (void)performDeviceRequest:(id)a3 device:(id)a4 completionHandler:(id)a5;
- (void)removeDiscoverableController:(id)a3;
- (void)removePairingClient:(id)a3;
- (void)setControllerDataChangedHandler:(id)a3;
- (void)setDiscoverableStateChangedHandler:(id)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setFastLEConnectionInfoData:(id)a3;
- (void)setFastLEConnectionInfoVersion:(unsigned __int8)a3;
- (void)setInquiryStateChangedHandler:(id)a3;
- (void)setInvalidationHandler:(id)a3;
- (void)setLowPowerModeWithReason:(int)a3 completionHandler:(id)a4;
- (void)setOfflineAdvertisingParams:(id)a3;
- (void)setPowerChangedHandler:(id)a3;
- (void)setRelayMessageHandler:(id)a3;
@end

@implementation CBStackControllerBTStack

- (CBStackControllerBTStack)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___CBStackControllerBTStack;
  v2 = -[CBStackControllerBTStack init](&v6, "init");
  v3 = v2;
  if (v2)
  {
    v2->_powerStateNotifyToken = -1;
    v4 = v2;
  }

  return v3;
}

- (CBControllerInfo)controllerInfo
{
  v3 = objc_alloc_init(&OBJC_CLASS___CBControllerInfo);
  if (qword_1008D6778 != -1) {
    dispatch_once(&qword_1008D6778, &stru_1008810E8);
  }
  id v4 = sub_100200F28(qword_1008D6770);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  -[CBControllerInfo setAudioLinkQualityArray:](v3, "setAudioLinkQualityArray:", v5);

  -[CBControllerInfo setBluetoothState:]( v3,  "setBluetoothState:",  -[CBStackControllerBTStack powerState](self, "powerState"));
  uint64_t v6 = sub_1002E6E9C();
  unsigned int v7 = *(_DWORD *)(v6 + 708);
  v8 = +[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", sub_1002CF02C(v6, v7));
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  -[CBControllerInfo setChipsetID:](v3, "setChipsetID:", v9);

  -[CBControllerInfo setDiscoverableState:]( v3,  "setDiscoverableState:",  -[CBStackControllerBTStack discoverableState](self, "discoverableState"));
  if (v7)
  {
    __s1 = 0LL;
    uint64_t v48 = 0LL;
    uint64_t v49 = 0LL;
    uint64_t v10 = sub_1002E6B38();
    (*(void (**)(uint64_t, void **))(*(void *)v10 + 64LL))(v10, &__s1);
    if (SHIBYTE(v49) < 0)
    {
      if (!v48) {
        goto LABEL_16;
      }
      if (v48 != 43)
      {
        p_s1 = __s1;
        goto LABEL_15;
      }

      p_s1 = __s1;
      v12 = __s1;
    }

    else
    {
      if (!HIBYTE(v49)) {
        goto LABEL_16;
      }
      if (HIBYTE(v49) != 43)
      {
        p_s1 = &__s1;
        goto LABEL_15;
      }

      p_s1 = &__s1;
      v12 = &__s1;
    }

    if (!memcmp(v12, "No Bluetooth automatic firmware update file", 0x2BuLL))
    {
LABEL_16:
      uint64_t v14 = sub_1002E6B38();
      int v15 = (*(uint64_t (**)(uint64_t))(*(void *)v14 + 80LL))(v14);
      if (v15 > 11)
      {
        switch(v15)
        {
          case 12:
            uint64_t v20 = CBErrorF(310012LL, "Bluetooth not initialized");
            v17 = (void *)objc_claimAutoreleasedReturnValue(v20);
            -[CBControllerInfo setLastChipsetInitError:](v3, "setLastChipsetInitError:", v17);
            goto LABEL_29;
          case 213:
            uint64_t v21 = CBErrorF(310213LL, "Bluetooth chipboot timeout");
            v17 = (void *)objc_claimAutoreleasedReturnValue(v21);
            -[CBControllerInfo setLastChipsetInitError:](v3, "setLastChipsetInitError:", v17);
            goto LABEL_29;
          case 214:
            uint64_t v18 = CBErrorF(310214LL, "Bluetooth chipboot crash loop");
            v17 = (void *)objc_claimAutoreleasedReturnValue(v18);
            -[CBControllerInfo setLastChipsetInitError:](v3, "setLastChipsetInitError:", v17);
            goto LABEL_29;
        }
      }

      else
      {
        switch(v15)
        {
          case 0:
            goto LABEL_30;
          case 1:
            uint64_t v19 = CBErrorF(310001LL, "Bluetooth error");
            v17 = (void *)objc_claimAutoreleasedReturnValue(v19);
            -[CBControllerInfo setLastChipsetInitError:](v3, "setLastChipsetInitError:", v17);
            goto LABEL_29;
          case 2:
            uint64_t v16 = CBErrorF(310002LL, "Bluetooth chipboot FW Update not implemented");
            v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
            -[CBControllerInfo setLastChipsetInitError:](v3, "setLastChipsetInitError:", v17);
LABEL_29:

LABEL_30:
            if (SHIBYTE(v49) < 0) {
              operator delete(__s1);
            }
            goto LABEL_32;
        }
      }

      uint64_t v22 = CBErrorF((v15 + 310000), "Undefined error");
      v17 = (void *)objc_claimAutoreleasedReturnValue(v22);
      -[CBControllerInfo setLastChipsetInitError:](v3, "setLastChipsetInitError:", v17);
      goto LABEL_29;
    }

- (int)discoverableState
{
  char v3 = 0;
  if (qword_1008D5F00 != -1) {
    dispatch_once(&qword_1008D5F00, &stru_100881128);
  }
  sub_10040A574((uint64_t)off_1008D5EF8, &v3);
  if (v3) {
    return 2;
  }
  else {
    return 1;
  }
}

- (BOOL)addDiscoverableController:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v32 = 0LL;
  uint64_t v33 = &v32;
  uint64_t v34 = 0x2020000000LL;
  uint64_t v35 = 0LL;
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472LL;
  v31[2] = sub_100066CDC;
  v31[3] = &unk_100880C30;
  v31[4] = &v32;
  unsigned int v7 = objc_retainBlock(v31);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithNonretainedObject:](&OBJC_CLASS___NSValue, "valueWithNonretainedObject:", v6));
  v9 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_discoverableSessionMap,  "objectForKeyedSubscript:",  v8));

  if (!v9)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue([v6 appID]);
    if (!v11)
    {
      if (a4)
      {
        uint64_t v24 = CBErrorF(4294960591LL, "No app ID");
        BOOL v10 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue(v24);
      }

      else
      {
        BOOL v10 = 0;
      }

      goto LABEL_25;
    }

    v12 = -[NSString initWithFormat:]( [NSString alloc], "initWithFormat:", @"%@-0x%08X", v11, [v6 clientID]);
    v13 = -[NSString UTF8String](v12, "UTF8String");
    if (qword_1008D61A8 != -1) {
      dispatch_once(&qword_1008D61A8, &stru_1008810A8);
    }
    uint64_t v14 = qword_1008D61A0;
    sub_10002418C(__p, v13);
    int v15 = sub_100496120(v14, (uint64_t)__p, (unint64_t *)v33 + 3, 2LL);
    if (v30 < 0) {
      operator delete(__p[0]);
    }
    if (v15 && v15 != -310000)
    {
      if (a4)
      {
        uint64_t v25 = CBErrorF((v15 + 310000), "Attach session failed");
        BOOL v10 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue(v25);
LABEL_24:

LABEL_25:
        goto LABEL_26;
      }
    }

    else
    {
      if (qword_1008D5F00 != -1) {
        dispatch_once(&qword_1008D5F00, &stru_100881128);
      }
      unint64_t v16 = sub_1004065D4(off_1008D5EF8, v33[3]);
      if (v16)
      {
        if (dword_1008D66A0 <= 30
          && (dword_1008D66A0 != -1 || _LogCategory_Initialize(&dword_1008D66A0, 30LL)))
        {
          LogPrintF_safe( &dword_1008D66A0,  "-[CBStackControllerBTStack addDiscoverableController:error:]",  30LL,  "AddDiscoverableController: %@",  v12);
        }

        if (qword_1008D5F00 != -1) {
          dispatch_once(&qword_1008D5F00, &stru_100881128);
        }
        int v17 = sub_100407008(off_1008D5EF8, v16, 1);
        if (!v17 || (uint64_t v18 = (v17 + 310000), !(_DWORD)v18))
        {
          uint64_t v19 = objc_alloc_init(&OBJC_CLASS___CBStackDiscoverableSession);
          -[CBStackDiscoverableSession setBtSessionHandle:](v19, "setBtSessionHandle:", v33[3]);
          discoverableSessionMap = self->_discoverableSessionMap;
          if (!discoverableSessionMap)
          {
            uint64_t v21 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
            uint64_t v22 = self->_discoverableSessionMap;
            self->_discoverableSessionMap = v21;

            discoverableSessionMap = self->_discoverableSessionMap;
          }

          -[NSMutableDictionary setObject:forKeyedSubscript:]( discoverableSessionMap,  "setObject:forKeyedSubscript:",  v19,  v8);
          v33[3] = 0LL;

          BOOL v10 = 1;
          goto LABEL_24;
        }

        if (a4)
        {
          uint64_t v28 = CBErrorF(v18, "setDiscoverable failed");
          BOOL v27 = (void *)objc_claimAutoreleasedReturnValue(v28);
          goto LABEL_35;
        }
      }

      else if (a4)
      {
        uint64_t v26 = CBErrorF(0LL, "Get LocalDevice handle failed");
        BOOL v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
LABEL_35:
        BOOL v10 = 0;
        *a4 = v27;
        goto LABEL_24;
      }
    }

    BOOL v10 = 0;
    goto LABEL_24;
  }

  BOOL v10 = 1;
LABEL_26:

  ((void (*)(void *))v7[2])(v7);
  _Block_object_dispose(&v32, 8);

  return v10;
}

- (void)removeDiscoverableController:(id)a3
{
  id v8 = a3;
  if (dword_1008D66A0 <= 30 && (dword_1008D66A0 != -1 || _LogCategory_Initialize(&dword_1008D66A0, 30LL)))
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue([v8 appID]);
    LogPrintF_safe( &dword_1008D66A0,  "-[CBStackControllerBTStack removeDiscoverableController:]",  30,  "RemoveDiscoverableController: %@-0x%08X",  v4,  [v8 clientID]);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithNonretainedObject:](&OBJC_CLASS___NSValue, "valueWithNonretainedObject:", v8));
  id v6 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_discoverableSessionMap,  "objectForKeyedSubscript:",  v5));
  if (v6)
  {
    -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_discoverableSessionMap,  "setObject:forKeyedSubscript:",  0LL,  v5);
    id v7 = [v6 btSessionHandle];
    if (qword_1008D61A8 != -1) {
      dispatch_once(&qword_1008D61A8, &stru_1008810A8);
    }
    sub_1004966BC(qword_1008D61A0, (unint64_t)v7);
  }
}

- (int)inquiryState
{
  if (qword_1008D5F00 != -1) {
    dispatch_once(&qword_1008D5F00, &stru_100881128);
  }
  else {
    return 1;
  }
}

- (BOOL)poweredOn
{
  if (qword_1008D6788 != -1) {
    dispatch_once(&qword_1008D6788, &stru_100881148);
  }
  return sub_1002075B4((uint64_t)off_1008D6780) == 1;
}

- (int64_t)powerState
{
  if (qword_1008D6788 != -1) {
    dispatch_once(&qword_1008D6788, &stru_100881148);
  }
  sub_1002075B4((uint64_t)off_1008D6780);
  return 4LL;
}

- (BOOL)setPowerState:(int64_t)a3 error:(id *)a4
{
  switch(a3)
  {
    case 4LL:
      if (qword_1008D6788 != -1) {
        dispatch_once(&qword_1008D6788, &stru_100881148);
      }
      int v9 = sub_10040D774((uint64_t)off_1008D6780);
      uint64_t v10 = (v9 + 310000);
      if (v9) {
        BOOL v11 = (_DWORD)v10 == 0;
      }
      else {
        BOOL v11 = 1;
      }
      if (!v11)
      {
        if (a4)
        {
          uint64_t v14 = CBErrorF(v10, "Power off failed");
          goto LABEL_35;
        }

        goto LABEL_38;
      }

      LOBYTE(v6) = 1;
      break;
    case 10LL:
      if (qword_1008D5F00 != -1) {
        dispatch_once(&qword_1008D5F00, &stru_100881128);
      }
      sub_100409094((uint64_t)off_1008D5EF8, 0LL, 1);
      if (qword_1008D6788 != -1) {
        dispatch_once(&qword_1008D6788, &stru_100881148);
      }
      int v6 = sub_1002075B4((uint64_t)off_1008D6780);
      if (v6 != 1)
      {
        if (qword_1008D6788 != -1) {
          dispatch_once(&qword_1008D6788, &stru_100881148);
        }
        int v12 = sub_10040D3E4((uint64_t)off_1008D6780);
        LOBYTE(v6) = 1;
        if (v12)
        {
          uint64_t v7 = (v12 + 310000);
          if ((_DWORD)v7)
          {
            if (a4)
            {
              id v8 = "Power on restricted failed";
              goto LABEL_31;
            }

- (void)setLowPowerModeWithReason:(int)a3 completionHandler:(id)a4
{
  id v6 = a4;
  dispatch_queue_attr_t v7 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  id v8 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v7);
  int v9 = dispatch_queue_create("CBStackSetLowPowerMode", v8);

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100067380;
  block[3] = &unk_100880C80;
  int v13 = a3;
  block[4] = self;
  id v12 = v6;
  id v10 = v6;
  dispatch_async(v9, block);
}

- (BOOL)setLowPowerModeWithReason:(int)a3 error:(id *)a4
{
  uint64_t v5 = *(void *)&a3;
  uint64_t v6 = sub_1000B05D8();
  dispatch_queue_attr_t v7 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0LL, 0LL, 0LL);
  dispatch_time_t v8 = dispatch_time(0LL, 9000000000LL);
  dispatch_source_set_timer(v7, v8, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472LL;
  handler[2] = sub_1000677D4;
  handler[3] = &unk_10087EB20;
  handler[4] = v6;
  dispatch_source_set_event_handler(v7, handler);
  dispatch_activate(v7);
  uint64_t v9 = sub_1002E8D54();
  if (((*(uint64_t (**)(uint64_t, uint64_t))(*(void *)v9 + 88LL))(v9, v5) & 1) == 0)
  {
    if (a4)
    {
      uint64_t v20 = CBErrorF(4294960587LL, "notifySystemWillShutdown returned disallowed");
      uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
LABEL_24:
      BOOL v18 = 0;
      *a4 = v21;
      goto LABEL_19;
    }

- (void)setOfflineAdvertisingParams:(id)a3
{
  id v3 = a3;
  dispatch_queue_attr_t v4 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  uint64_t v5 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v4);
  uint64_t v6 = dispatch_queue_create("CBStackSetOfflineAdvertisingParams", v5);

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100067A68;
  block[3] = &unk_10087EA48;
  id v9 = v3;
  id v7 = v3;
  dispatch_async(v6, block);
}

- (id)description
{
  return -[CBStackControllerBTStack descriptionWithLevel:](self, "descriptionWithLevel:", 50LL);
}

- (id)descriptionWithLevel:(int)a3
{
  id v71 = 0LL;
  unint64_t v3 = -[CBStackControllerBTStack powerState](self, "powerState", *(void *)&a3);
  if (v3 > 0xA) {
    dispatch_queue_attr_t v4 = "?";
  }
  else {
    dispatch_queue_attr_t v4 = off_100881360[v3];
  }
  unsigned int v5 = -[CBStackControllerBTStack discoverableState](self, "discoverableState");
  if (v5 > 2) {
    uint64_t v6 = "?";
  }
  else {
    uint64_t v6 = off_100881348[v5];
  }
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[CBStackControllerBTStack controllerInfo](self, "controllerInfo"));
  unsigned int v8 = [v7 fastLEConnectionInfoVersion];
  unint64_t stackControllerInfoCloudSyncStatus = (char)self->_stackControllerInfoCloudSyncStatus;
  if (stackControllerInfoCloudSyncStatus > 3) {
    int v10 = "?";
  }
  else {
    int v10 = off_100881328[stackControllerInfoCloudSyncStatus];
  }
  unsigned int v11 = -[CBStackControllerBTStack inquiryState](self, "inquiryState");
  if (v11 > 2) {
    uint64_t v12 = "?";
  }
  else {
    uint64_t v12 = off_100881348[v11];
  }
  if (self->_btSessionPtr) {
    int v13 = "yes";
  }
  else {
    int v13 = "no";
  }
  NSAppendPrintF_safe( &v71,  "CBStackController: state %s, discoverable %s, fastLE v%d (%s), inquiry %s, session %s",  v4,  v6,  v8,  v10,  v12,  v13);
  id v14 = v71;

  v45 = self->_connectDeviceRequests;
  if (-[NSMutableSet count](v45, "count"))
  {
    id v70 = v14;
    NSAppendPrintF_safe(&v70, ", connectDeviceRequests [");
    id v15 = v70;

    __int128 v68 = 0u;
    __int128 v69 = 0u;
    __int128 v66 = 0u;
    __int128 v67 = 0u;
    obj = v45;
    id v16 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v66,  v74,  16LL);
    if (v16)
    {
      uint64_t v17 = *(void *)v67;
      BOOL v18 = "";
      do
      {
        uint64_t v19 = 0LL;
        uint64_t v20 = v15;
        do
        {
          if (*(void *)v67 != v17) {
            objc_enumerationMutation(obj);
          }
          uint64_t v21 = *(void **)(*((void *)&v66 + 1) + 8LL * (void)v19);
          id v65 = v20;
          uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v21 connection]);
          v23 = (void *)objc_claimAutoreleasedReturnValue([v22 peerDevice]);
          NSAppendPrintF_safe(&v65, "%s%@", v18, v23);
          id v15 = v65;

          uint64_t v19 = (char *)v19 + 1;
          BOOL v18 = ", ";
          uint64_t v20 = v15;
        }

        while (v16 != v19);
        id v16 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v66,  v74,  16LL);
        BOOL v18 = ", ";
      }

      while (v16);
    }

    id v64 = v15;
    NSAppendPrintF_safe(&v64, "]");
    id v14 = v64;
  }

  v44 = self->_modifyDeviceRequests;
  if (-[NSMutableSet count](v44, "count"))
  {
    id v63 = v14;
    NSAppendPrintF_safe(&v63, ", modifyDeviceRequests [");
    id v24 = v63;

    __int128 v61 = 0u;
    __int128 v62 = 0u;
    __int128 v59 = 0u;
    __int128 v60 = 0u;
    uint64_t v25 = v44;
    id v26 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v25,  "countByEnumeratingWithState:objects:count:",  &v59,  v73,  16LL);
    if (v26)
    {
      uint64_t v27 = *(void *)v60;
      uint64_t v28 = "";
      do
      {
        uint64_t v29 = 0LL;
        char v30 = v24;
        do
        {
          if (*(void *)v60 != v27) {
            objc_enumerationMutation(v25);
          }
          v31 = *(void **)(*((void *)&v59 + 1) + 8LL * (void)v29);
          id v58 = v30;
          uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue([v31 device]);
          NSAppendPrintF_safe(&v58, "%s%@", v28, v32);
          id v24 = v58;

          uint64_t v29 = (char *)v29 + 1;
          uint64_t v28 = ", ";
          char v30 = v24;
        }

        while (v26 != v29);
        id v26 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v25,  "countByEnumeratingWithState:objects:count:",  &v59,  v73,  16LL);
        uint64_t v28 = ", ";
      }

      while (v26);
    }

    id v57 = v24;
    NSAppendPrintF_safe(&v57, "]");
    id v14 = v57;
  }

  v47 = self->_performDeviceRequests;
  if (-[NSMutableSet count](v47, "count"))
  {
    id v56 = v14;
    NSAppendPrintF_safe(&v56, ", performDeviceRequests [");
    id v33 = v56;

    __int128 v54 = 0u;
    __int128 v55 = 0u;
    __int128 v52 = 0u;
    __int128 v53 = 0u;
    obja = v47;
    id v34 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( obja,  "countByEnumeratingWithState:objects:count:",  &v52,  v72,  16LL);
    if (v34)
    {
      uint64_t v35 = *(void *)v53;
      v36 = "";
      do
      {
        v37 = 0LL;
        int v38 = v33;
        do
        {
          if (*(void *)v53 != v35) {
            objc_enumerationMutation(obja);
          }
          uint64_t v39 = *(void **)(*((void *)&v52 + 1) + 8LL * (void)v37);
          id v51 = v38;
          BOOL v40 = (void *)objc_claimAutoreleasedReturnValue([v39 device]);
          BOOL v41 = (void *)objc_claimAutoreleasedReturnValue([v39 request]);
          NSAppendPrintF_safe(&v51, "%s{%@, %@}", v36, v40, v41);
          id v33 = v51;

          v37 = (char *)v37 + 1;
          int v38 = v33;
          v36 = ", ";
        }

        while (v34 != v37);
        id v34 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( obja,  "countByEnumeratingWithState:objects:count:",  &v52,  v72,  16LL);
        v36 = ", ";
      }

      while (v34);
    }

    id v50 = v33;
    NSAppendPrintF_safe(&v50, "]");
    id v14 = v50;
  }

  id v42 = v14;

  return v42;
}

- (void)activate
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  if (!dispatchQueue)
  {
    FatalErrorF("CBStackController: No dispatchQueue", a2);
LABEL_29:
    dispatch_once(&qword_1008D61A8, &stru_1008810A8);
    goto LABEL_8;
  }

  dispatch_assert_queue_V2(dispatchQueue);
  objc_storeStrong((id *)&qword_1008D9ED0, self);
  p_btSessionHandle = (unint64_t *)&self->_btSessionHandle;
  if (self->_btSessionHandle) {
    goto LABEL_21;
  }
  dispatch_queue_attr_t v4 = &unk_1008D6000;
  unint64_t v3 = &unk_1008D6000;
  if (qword_1008D61A8 != -1) {
    goto LABEL_29;
  }
LABEL_8:
  uint64_t v7 = qword_1008D61A0;
  sub_10002418C(__p, "CBDaemon");
  int v8 = sub_100496120(v7, (uint64_t)__p, p_btSessionHandle, 2LL);
  int v9 = v8;
  if (v16 < 0)
  {
    operator delete(__p[0]);
    if (!v9) {
      goto LABEL_17;
    }
LABEL_12:
    uint64_t v10 = (v9 + 310000);
    if ((_DWORD)v10)
    {
      int v11 = v4[424];
      if (v11 <= 90 && (v11 != -1 || _LogCategory_Initialize(&dword_1008D66A0, 90LL)))
      {
        uint64_t v12 = CUPrintErrorCode(v10);
        int v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
        LogPrintF_safe( &dword_1008D66A0,  "-[CBStackControllerBTStack activate]",  90LL,  "### Attach session failed: %@",  v13);
      }
    }

    goto LABEL_17;
  }

  if (v8) {
    goto LABEL_12;
  }
LABEL_17:
  if (*p_btSessionHandle)
  {
    if (v3[53] != -1LL) {
      dispatch_once(&qword_1008D61A8, &stru_1008810A8);
    }
    self->_btSessionPtr = (void *)sub_100496954((void *)qword_1008D61A0, (unint64_t)self->_btSessionHandle);
  }

- (void)invalidate
{
  if (self->_addedController)
  {
    if (dword_1008D66A0 <= 30
      && (dword_1008D66A0 != -1 || _LogCategory_Initialize(&dword_1008D66A0, 30LL)))
    {
      LogPrintF_safe(&dword_1008D66A0, "-[CBStackControllerBTStack invalidate]", 30LL, "Invalidate");
    }

    os_unfair_lock_lock((os_unfair_lock_t)&unk_1008D9ED8);
    if (qword_1008D9EE0) {
      sub_100068B7C(qword_1008D9EE0, self);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)&unk_1008D9ED8);
    self->_addedController = 0;
  }

  __int128 v48 = 0u;
  __int128 v49 = 0u;
  __int128 v46 = 0u;
  __int128 v47 = 0u;
  unint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableSet allObjects](self->_connectDeviceRequests, "allObjects"));
  id v4 = [v3 countByEnumeratingWithState:&v46 objects:v52 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v47;
    do
    {
      for (i = 0LL; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v47 != v5) {
          objc_enumerationMutation(v3);
        }
        uint64_t v7 = *(void *)(*((void *)&v46 + 1) + 8LL * (void)i);
        uint64_t v8 = CBErrorF(4294896148LL, "StackController invalidated");
        int v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
        -[CBStackControllerBTStack _connectDeviceCompleteRequest:error:]( self,  "_connectDeviceCompleteRequest:error:",  v7,  v9);
      }

      id v4 = [v3 countByEnumeratingWithState:&v46 objects:v52 count:16];
    }

    while (v4);
  }

  __int128 v44 = 0u;
  __int128 v45 = 0u;
  __int128 v42 = 0u;
  __int128 v43 = 0u;
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableSet allObjects](self->_modifyDeviceRequests, "allObjects"));
  id v11 = [v10 countByEnumeratingWithState:&v42 objects:v51 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v43;
    do
    {
      for (j = 0LL; j != v11; j = (char *)j + 1)
      {
        if (*(void *)v43 != v12) {
          objc_enumerationMutation(v10);
        }
        uint64_t v14 = *(void *)(*((void *)&v42 + 1) + 8LL * (void)j);
        uint64_t v15 = CBErrorF(4294896148LL, "StackController invalidated");
        char v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
        -[CBStackControllerBTStack _modifyDeviceCompleteRequest:error:]( self,  "_modifyDeviceCompleteRequest:error:",  v14,  v16);
      }

      id v11 = [v10 countByEnumeratingWithState:&v42 objects:v51 count:16];
    }

    while (v11);
  }

  __int128 v40 = 0u;
  __int128 v41 = 0u;
  __int128 v38 = 0u;
  __int128 v39 = 0u;
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableSet allObjects](self->_performDeviceRequests, "allObjects"));
  id v18 = [v17 countByEnumeratingWithState:&v38 objects:v50 count:16];
  if (v18)
  {
    uint64_t v19 = *(void *)v39;
    do
    {
      for (k = 0LL; k != v18; k = (char *)k + 1)
      {
        if (*(void *)v39 != v19) {
          objc_enumerationMutation(v17);
        }
        uint64_t v21 = *(void *)(*((void *)&v38 + 1) + 8LL * (void)k);
        uint64_t v22 = CBErrorF(4294896148LL, "StackController invalidated");
        v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
        -[CBStackControllerBTStack _completePerformDeviceRequest:error:]( self,  "_completePerformDeviceRequest:error:",  v21,  v23);
      }

      id v18 = [v17 countByEnumeratingWithState:&v38 objects:v50 count:16];
    }

    while (v18);
  }

  -[CBStackControllerBTStack _pairingAgentTearDown](self, "_pairingAgentTearDown");
  btSessionHandle = self->_btSessionHandle;
  if (btSessionHandle)
  {
    if (qword_1008D61A8 != -1) {
      dispatch_once(&qword_1008D61A8, &stru_1008810A8);
    }
    int v25 = sub_1004966BC(qword_1008D61A0, (unint64_t)btSessionHandle);
    if (v25)
    {
      uint64_t v26 = (v25 + 310000);
      if (v25 != -310000
        && dword_1008D66A0 <= 90
        && (dword_1008D66A0 != -1 || _LogCategory_Initialize(&dword_1008D66A0, 90LL)))
      {
        uint64_t v27 = CUPrintErrorCode(v26);
        uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
        LogPrintF_safe( &dword_1008D66A0,  "-[CBStackControllerBTStack invalidate]",  90LL,  "### Detach session failed: %@",  v28);
      }
    }
  }

  int powerStateNotifyToken = self->_powerStateNotifyToken;
  if (powerStateNotifyToken != -1)
  {
    notify_cancel(powerStateNotifyToken);
    self->_int powerStateNotifyToken = -1;
  }

  self->_btSessionHandle = 0LL;
  self->_btSessionPtr = 0LL;
  id controllerDataChangedHandler = self->_controllerDataChangedHandler;
  self->_id controllerDataChangedHandler = 0LL;

  id discoverableStateChangedHandler = self->_discoverableStateChangedHandler;
  self->_id discoverableStateChangedHandler = 0LL;

  id inquiryStateChangedHandler = self->_inquiryStateChangedHandler;
  self->_id inquiryStateChangedHandler = 0LL;

  id v33 = (void (**)(void))objc_retainBlock(self->_invalidationHandler);
  id invalidationHandler = self->_invalidationHandler;
  self->_id invalidationHandler = 0LL;

  id powerChangedHandler = self->_powerChangedHandler;
  self->_id powerChangedHandler = 0LL;

  id relayMessageHandler = self->_relayMessageHandler;
  self->_id relayMessageHandler = 0LL;

  v37 = (void *)qword_1008D9ED0;
  qword_1008D9ED0 = 0LL;

  if (v33) {
    v33[2](v33);
  }
}

- (void)_accessoryCommandStatusWithDevice:(id)a3 type:(int)a4 result:(unsigned __int16)a5 reason:(unsigned __int16)a6
{
  int v18 = a5;
  int v19 = a6;
  id v8 = a3;
  if (a4 == 1 && self->_addedController)
  {
    __int128 v22 = 0u;
    __int128 v23 = 0u;
    __int128 v20 = 0u;
    __int128 v21 = 0u;
    int v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableSet allObjects](self->_modifyDeviceRequests, "allObjects"));
    id v10 = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v21;
      do
      {
        for (i = 0LL; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v21 != v11) {
            objc_enumerationMutation(v9);
          }
          int v13 = *(void **)(*((void *)&v20 + 1) + 8LL * (void)i);
          uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v13 device]);
          unsigned __int8 v15 = [v14 isEquivalentToCBDevice:v8 compareFlags:8];

          if ((v15 & 1) != 0)
          {
            if (v19 | v18)
            {
              uint64_t v16 = CBErrorF(4294960584LL, "Connection priority update failed: result %u, reason %u", v18, v19);
              uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
            }

            else
            {
              uint64_t v17 = 0LL;
            }

            -[CBStackControllerBTStack _modifyDeviceCompleteRequest:error:]( self,  "_modifyDeviceCompleteRequest:error:",  v13,  v17);
          }
        }

        id v10 = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }

      while (v10);
    }
  }
}

- (void)_accessoryReceivedRelayMessageType:(unsigned __int8)a3 messageData:(id)a4 conduitDevice:(id)a5 sourceDevice:(id)a6
{
  uint64_t v8 = a3;
  id v14 = a4;
  id v10 = a5;
  id v11 = a6;
  if (self->_addedController)
  {
    id v12 = objc_retainBlock(self->_relayMessageHandler);
    int v13 = v12;
    if (v12) {
      (*((void (**)(id, id, id, uint64_t, id))v12 + 2))(v12, v10, v11, v8, v14);
    }
  }
}

- (void)_btDeviceWithID:(id)a3 error:(id *)a4
{
  return -[CBStackControllerBTStack _btDeviceWithID:createIfNeeded:error:]( self,  "_btDeviceWithID:createIfNeeded:error:",  a3,  0LL,  a4);
}

- (void)_btDeviceWithID:(id)a3 createIfNeeded:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  id v7 = a3;
  if (v7)
  {
    uint64_t v8 = -[NSUUID initWithUUIDString:](objc_alloc(&OBJC_CLASS___NSUUID), "initWithUUIDString:", v7);
    if (v8)
    {
      if (qword_1008D5F30 != -1) {
        dispatch_once(&qword_1008D5F30, &stru_100881188);
      }
      uint64_t v9 = sub_1005CC198((uint64_t)off_1008D5F28, v8, 0);
      if (v9)
      {
        if (qword_1008D5F50 != -1) {
          dispatch_once(&qword_1008D5F50, &stru_1008811A8);
        }
        id v10 = sub_10040007C(off_1008D5F48, v9, v6);
        if (v10) {
          goto LABEL_15;
        }
        if (a5)
        {
          uint64_t v11 = CBErrorF(4294960569LL, "No BT device %@", v8);
          id v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
LABEL_26:
          id v10 = 0LL;
          *a5 = v12;
LABEL_15:

          goto LABEL_16;
        }
      }

      else if (a5)
      {
        uint64_t v17 = CBErrorF(4294960569LL, "No LE device %@", v8);
        id v12 = (void *)objc_claimAutoreleasedReturnValue(v17);
        goto LABEL_26;
      }
    }

    else
    {
      __int16 v21 = 0;
      int v20 = 0;
      id v13 = v7;
      if (TextToHardwareAddress([v13 UTF8String], -1, 6, &v20))
      {
        if (a5)
        {
          uint64_t v18 = CBErrorF(4294960588LL, "Bad device ID '%@'", v13);
          id v12 = (void *)objc_claimAutoreleasedReturnValue(v18);
          goto LABEL_26;
        }
      }

      else
      {
        unint64_t v14 = ((unint64_t)v20 << 40) | ((unint64_t)BYTE1(v20) << 32) | ((unint64_t)BYTE2(v20) << 24) | ((unint64_t)HIBYTE(v20) << 16) | ((unint64_t)v21 << 8) | HIBYTE(v21);
        if (qword_1008D5F50 != -1) {
          dispatch_once(&qword_1008D5F50, &stru_1008811A8);
        }
        id v10 = sub_10040007C(off_1008D5F48, v14, v6);
        if (v10) {
          goto LABEL_15;
        }
        if (a5)
        {
          uint64_t v19 = CBErrorF(4294960569LL, "No BT device %@", v13);
          id v12 = (void *)objc_claimAutoreleasedReturnValue(v19);
          goto LABEL_26;
        }
      }
    }

    id v10 = 0LL;
    goto LABEL_15;
  }

  if (a5)
  {
    uint64_t v16 = CBErrorF(4294960591LL, "No device ID");
    id v10 = 0LL;
    *a5 = (id)objc_claimAutoreleasedReturnValue(v16);
  }

  else
  {
    id v10 = 0LL;
  }

- (id)_btUUIDWithID:(id)a3 error:(id *)a4
{
  id v5 = a3;
  BOOL v6 = -[NSUUID initWithUUIDString:](objc_alloc(&OBJC_CLASS___NSUUID), "initWithUUIDString:", v5);
  if (!v6)
  {
    __int16 v18 = 0;
    int v17 = 0;
    id v8 = v5;
    if (TextToHardwareAddress([v8 UTF8String], -1, 6, &v17))
    {
      if (!a4)
      {
        id v7 = 0LL;
        goto LABEL_8;
      }

      uint64_t v14 = CBErrorF(4294960588LL, "Bad device ID '%@'", v8);
      id v15 = (id)objc_claimAutoreleasedReturnValue(v14);
      id v7 = 0LL;
    }

    else
    {
      unint64_t v9 = ((unint64_t)v17 << 40) | ((unint64_t)BYTE1(v17) << 32) | ((unint64_t)BYTE2(v17) << 24) | ((unint64_t)HIBYTE(v17) << 16) | ((unint64_t)v18 << 8) | HIBYTE(v18);
      v19[0] = 0LL;
      v19[1] = 0LL;
      if (qword_1008D5F30 != -1) {
        dispatch_once(&qword_1008D5F30, &stru_100881188);
      }
      sub_1005C8684((uint64_t)off_1008D5F28, v9, 0, 1u, 0LL, 0LL, (unsigned __int8 *)v19);
      id v10 = sub_100241F94((const unsigned __int8 *)v19);
      uint64_t v11 = (NSUUID *)objc_claimAutoreleasedReturnValue(v10);
      id v7 = v11;
      if (v11)
      {
        id v12 = v11;
        goto LABEL_8;
      }

      if (!a4) {
        goto LABEL_8;
      }
      uint64_t v16 = CBErrorF(4294960569LL, "ID not found");
      id v15 = (id)objc_claimAutoreleasedReturnValue(v16);
    }

    *a4 = v15;
    goto LABEL_8;
  }

  id v7 = v6;
LABEL_8:

  return v7;
}

- (BOOL)connectDevice:(id)a3 connectionFlags:(unsigned int)a4 serviceFlags:(unsigned int)a5 error:(id *)a6
{
  id v10 = a3;
  if (qword_1008D60B0 != -1) {
    dispatch_once(&qword_1008D60B0, &stru_1008810C8);
  }
  if (*((_BYTE *)off_1008D60A8 + 76))
  {
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 identifier]);
    id v12 = -[CBStackControllerBTStack _btDeviceWithID:createIfNeeded:error:]( self,  "_btDeviceWithID:createIfNeeded:error:",  v11,  (a4 >> 5) & 1,  a6);
    uint64_t v13 = (uint64_t)v12;
    if (v12)
    {
      sub_1003DE1B8((uint64_t)v12, (a4 & 4) != 0);
      if (qword_1008D60E0 != -1) {
        dispatch_once(&qword_1008D60E0, &stru_1008811C8);
      }
      sub_10023BAB8((uint64_t)off_1008D60D8, v13, (a4 & 4) != 0);
      if ((a4 & 1) != 0) {
        sub_1003DE174(v13, 1);
      }
      if ((a4 & 8) != 0)
      {
        if (qword_1008D60E0 != -1) {
          dispatch_once(&qword_1008D60E0, &stru_1008811C8);
        }
        sub_10021B4BC((uint64_t)off_1008D60D8, v13, 1);
      }

      if ((a4 & 0x10) != 0)
      {
        sub_10002418C(&__str, "");
        *(_BYTE *)(v13 + 1435) = 1;
        std::string::operator=((std::string *)(v13 + 1480), &__str);
      }

      if (qword_1008D60D0 != -1) {
        dispatch_once(&qword_1008D60D0, &stru_100881108);
      }
      memset(&__str, 0, sizeof(__str));
      int v14 = sub_100424360((int64x2_t *)off_1008D60C8, v13, a5, &__str, 2LL);
      if (!v14)
      {
        BOOL v15 = 1;
LABEL_22:

        goto LABEL_23;
      }

      if (a6)
      {
        if (v14 == -310000) {
          uint64_t v18 = 4294960596LL;
        }
        else {
          uint64_t v18 = (v14 + 310000);
        }
        uint64_t v19 = CBErrorF(v18, "Connect failed %@", v11);
        BOOL v15 = 0;
        *a6 = (id)objc_claimAutoreleasedReturnValue(v19);
        goto LABEL_22;
      }
    }

    BOOL v15 = 0;
    goto LABEL_22;
  }

  if (a6)
  {
    uint64_t v17 = CBErrorF(4294896144LL, "Bluetooth powered off");
    BOOL v15 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue(v17);
  }

  else
  {
    BOOL v15 = 0;
  }

- (void)connectWithCBConnection:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v35 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  uint64_t v44 = 0LL;
  __int128 v45 = (id *)&v44;
  uint64_t v46 = 0x3032000000LL;
  __int128 v47 = sub_100069D3C;
  __int128 v48 = sub_100069D4C;
  id v49 = 0LL;
  v41[0] = _NSConcreteStackBlock;
  v41[1] = 3221225472LL;
  v41[2] = sub_100069D54;
  v41[3] = &unk_100880CA8;
  __int128 v43 = &v44;
  id v7 = v35;
  id v42 = v7;
  v36 = objc_retainBlock(v41);
  if (dword_1008D66A0 <= 30 && (dword_1008D66A0 != -1 || _LogCategory_Initialize(&dword_1008D66A0, 30LL))) {
    LogPrintF_safe( &dword_1008D66A0,  "-[CBStackControllerBTStack connectWithCBConnection:completionHandler:]",  30LL,  "ConnectDevice start: %@",  v6);
  }
  if (qword_1008D60B0 != -1) {
    dispatch_once(&qword_1008D60B0, &stru_1008810C8);
  }
  if (!*((_BYTE *)off_1008D60A8 + 76))
  {
    uint64_t v27 = CBErrorF(4294896144LL, "Bluetooth powered off");
    uint64_t v28 = objc_claimAutoreleasedReturnValue(v27);
    id v9 = v45[5];
    v45[5] = (id)v28;
    goto LABEL_40;
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 peerDevice]);
  id v9 = (id)objc_claimAutoreleasedReturnValue([v8 identifier]);

  if (!v9)
  {
    uint64_t v29 = CBErrorF(4294960588LL, "No device ID");
    uint64_t v30 = objc_claimAutoreleasedReturnValue(v29);
LABEL_44:
    id v32 = v45[5];
    v45[5] = (id)v30;

    goto LABEL_40;
  }

  int v10 = [v6 serviceFlags];
  if (!v10)
  {
    uint64_t v31 = CBErrorF(4294960591LL, "No service flags");
    uint64_t v30 = objc_claimAutoreleasedReturnValue(v31);
    goto LABEL_44;
  }

  uint64_t v11 = v45;
  id obj = v45[5];
  id v12 = -[CBStackControllerBTStack _btDeviceWithID:error:](self, "_btDeviceWithID:error:", v9, &obj);
  objc_storeStrong(v11 + 5, obj);
  if (v12)
  {
    unsigned int v13 = [v6 connectionFlags];
    __int16 v14 = v13;
    int v15 = (v13 >> 2) & 1;
    sub_1003DE1B8((uint64_t)v12, (v13 & 4) != 0);
    if (qword_1008D60E0 != -1) {
      dispatch_once(&qword_1008D60E0, &stru_1008811C8);
    }
    sub_10023BAB8((uint64_t)off_1008D60D8, (uint64_t)v12, v15);
    if ((v14 & 1) != 0) {
      sub_1003DE174((uint64_t)v12, 1);
    }
    if ((v14 & 8) != 0)
    {
      if (qword_1008D60E0 != -1) {
        dispatch_once(&qword_1008D60E0, &stru_1008811C8);
      }
      sub_10021B4BC((uint64_t)off_1008D60D8, (uint64_t)v12, 1);
    }

    if ((v14 & 0x10) != 0)
    {
      sub_10002418C(&__str, "");
      v12[1435] = 1;
      std::string::operator=((std::string *)(v12 + 1480), &__str);
    }

    memset(&__str, 0, sizeof(__str));
    sub_10002418C(&__str, "Unknown");
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v6 clientBundleID]);
    id v17 = [v16 length];

    if (v17)
    {
      id v18 = objc_claimAutoreleasedReturnValue([v6 clientBundleID]);
      sub_10002418C(&v38, (char *)[v18 UTF8String]);
      std::string __str = v38;
      v38.__r_.__value_.__s.__size_ = 0;
      v38.__r_.__value_.__s.__data_[0] = 0;
    }

    if (qword_1008D60D0 != -1) {
      dispatch_once(&qword_1008D60D0, &stru_100881108);
    }
    int v19 = sub_100424360((int64x2_t *)off_1008D60C8, (uint64_t)v12, v10, &__str, 2LL);
    if (v19 && (uint64_t v20 = (v19 + 310000), (_DWORD)v20))
    {
      uint64_t v33 = CBErrorF(v20, "connectServices failed %@", v9);
      uint64_t v34 = objc_claimAutoreleasedReturnValue(v33);
      __int16 v21 = (CBStackConnectDeviceRequest *)v45[5];
      v45[5] = (id)v34;
    }

    else
    {
      __int16 v21 = objc_alloc_init(&OBJC_CLASS___CBStackConnectDeviceRequest);
      -[CBStackConnectDeviceRequest setCompletionHandler:](v21, "setCompletionHandler:", v7);
      -[CBStackConnectDeviceRequest setConnection:](v21, "setConnection:", v6);
      -[CBStackConnectDeviceRequest setStartTicks:](v21, "setStartTicks:", mach_absolute_time());
      __int128 v22 = dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_timer,  0LL,  0LL,  (dispatch_queue_t)self->_dispatchQueue);
      -[CBStackConnectDeviceRequest setTimer:](v21, "setTimer:", v22);
      handler[0] = _NSConcreteStackBlock;
      handler[1] = 3221225472LL;
      handler[2] = sub_100069E30;
      handler[3] = &unk_100880CD0;
      handler[4] = v22;
      void handler[5] = v21;
      handler[6] = self;
      dispatch_source_set_event_handler(v22, handler);
      [v6 connectTimeoutSeconds];
      if (v23 <= 0.0) {
        double v23 = 10.0;
      }
      CUDispatchTimerSet(v22, v23, -1.0, 1.0);
      dispatch_activate(v22);
      connectDeviceRequests = self->_connectDeviceRequests;
      if (!connectDeviceRequests)
      {
        int v25 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
        uint64_t v26 = self->_connectDeviceRequests;
        self->_connectDeviceRequests = v25;

        connectDeviceRequests = self->_connectDeviceRequests;
      }

      -[NSMutableSet addObject:](connectDeviceRequests, "addObject:", v21);
    }
  }

- (void)_connectDeviceCompleteRequest:(id)a3 error:(id)a4
{
  id v16 = a3;
  id v6 = a4;
  if (dword_1008D66A0 <= 30 && (dword_1008D66A0 != -1 || _LogCategory_Initialize(&dword_1008D66A0, 30LL)))
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v16 connection]);
    uint64_t v8 = CUPrintNSError(v6);
    id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    uint64_t v10 = mach_absolute_time();
    uint64_t v11 = UpTicksToMilliseconds(v10 - (void)[v16 startTicks]);
    LogPrintF_safe( &dword_1008D66A0,  "-[CBStackControllerBTStack _connectDeviceCompleteRequest:error:]",  30LL,  "ConnectDevice completed: %@, %@, %llu ms",  v7,  v9,  v11);
  }

  id v12 = (dispatch_source_s *)objc_claimAutoreleasedReturnValue([v16 timer]);
  unsigned int v13 = v16;
  if (v12)
  {
    dispatch_source_cancel(v12);
    [v16 setTimer:0];
    unsigned int v13 = v16;
  }

  uint64_t v14 = objc_claimAutoreleasedReturnValue([v13 completionHandler]);
  int v15 = (void *)v14;
  if (v14)
  {
    (*(void (**)(uint64_t, id))(v14 + 16))(v14, v6);
    [v16 setCompletionHandler:0];
  }

  -[NSMutableSet removeObject:](self->_connectDeviceRequests, "removeObject:", v16);
}

- (void)_connectDeviceUpdateRequests:(id)a3 btResult:(int)a4
{
  id v6 = a3;
  if (self->_addedController)
  {
    __int128 v23 = 0u;
    __int128 v24 = 0u;
    __int128 v21 = 0u;
    __int128 v22 = 0u;
    int v19 = self;
    id obj = (id)objc_claimAutoreleasedReturnValue(-[NSMutableSet allObjects](self->_connectDeviceRequests, "allObjects"));
    id v7 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v22;
      int v9 = a4 + 310000;
      if (a4 == -310000) {
        int v9 = -6700;
      }
      unsigned int v18 = v9;
      do
      {
        for (i = 0LL; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v22 != v8) {
            objc_enumerationMutation(obj);
          }
          uint64_t v11 = *(void **)(*((void *)&v21 + 1) + 8LL * (void)i);
          id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 connection]);
          unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue([v12 peerDevice]);
          if ([v13 isEquivalentToCBDevice:v6 compareFlags:8])
          {
            if (a4)
            {
              uint64_t v14 = CBErrorF(v18, "Connect failed");
              int v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
              -[CBStackControllerBTStack _connectDeviceCompleteRequest:error:]( v19,  "_connectDeviceCompleteRequest:error:",  v11,  v15);
            }

            else
            {
              unsigned int v16 = [v12 serviceFlags];
              unsigned int v17 = [v6 supportedServices];
              if ((v17 & v16 & ~[v6 connectedServices]) == 0) {
                -[CBStackControllerBTStack _connectDeviceCompleteRequest:error:]( v19,  "_connectDeviceCompleteRequest:error:",  v11,  0LL);
              }
            }
          }
        }

        id v7 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
      }

      while (v7);
    }
  }
}

- (id)diagnosticControl:(id)a3
{
  id v4 = a3;
  string = xpc_dictionary_get_string(v4, "iStr");
  if (string) {
    id v6 = string;
  }
  else {
    id v6 = "";
  }
  if (!strcasecmp(v6, "coredump"))
  {
    if (dword_1008D66A0 <= 30
      && (dword_1008D66A0 != -1 || _LogCategory_Initialize(&dword_1008D66A0, 30LL)))
    {
      LogPrintF_safe(&dword_1008D66A0, "-[CBStackControllerBTStack diagnosticControl:]", 30LL, "Diag: CoreDump");
    }

    if (qword_1008D60B0 != -1) {
      dispatch_once(&qword_1008D60B0, &stru_1008810C8);
    }
    __int128 v23 = off_1008D60A8;
    sub_10002418C(&v46, "");
    sub_1004319D0((uint64_t)v23, 3703, &v46);
  }

  if (!strcasecmp(v6, "crash-FE"))
  {
    LOBYTE(v44) = 0;
    sub_100242CA4(&v44);
    sub_1000AFE20(4004LL);
  }

  else
  {
    if (!strcasecmp(v6, "crash-RC"))
    {
      LOBYTE(v44) = 0;
      sub_100242CA4(&v44);
      sub_1000B034C(4058LL, "Test Context");
    }

    if (!strcasecmp(v6, "crash-sim"))
    {
      uint64_t v9 = _os_log_pack_size(12LL);
      uint64_t v10 = (char *)v42 - ((__chkstk_darwin() + 15) & 0xFFFFFFFFFFFFFFF0LL);
      uint64_t v11 = __error();
      uint64_t v12 = _os_log_pack_fill( v10,  v9,  *v11,  &_mh_execute_header,  "Diag crash simulated: '%s'",  (const char *)v42[0]);
      *(_DWORD *)uint64_t v12 = 136315138;
      *(void *)(v12 + 4) = v6;
      os_log_t v13 = os_log_create("com.apple.bluetooth", "CBCrash");
      os_log_t v14 = v13;
      if (v13) {
        os_log_t v15 = v13;
      }
      else {
        os_log_t v15 = (os_log_t)&_os_log_default;
      }
      qword_1008D9DB8 = os_log_pack_send_and_compose(v10, v15, 16LL, 0LL, 0LL);
      os_fault_with_payload(18LL, 2LL, v10, v9, qword_1008D9DB8, 0LL);

      goto LABEL_41;
    }

    if (strcasecmp(v6, "crash"))
    {
      if (!stricmp_prefix(v6, "fakeAccessoryCrash"))
      {
        unsigned __int16 v45 = 0;
        unsigned int v44 = 0;
        if (stricmp_prefix(v6, "fakeAccessoryCrash-"))
        {
          RandomBytes(&v44, 6LL);
        }

        else if (TextToHardwareAddress(v6 + 19, -1LL, 6LL, &v44))
        {
          uint64_t v8 = @"Bad Bluetooth address";
          goto LABEL_42;
        }

        uint64_t v28 = sub_1002E8E64();
        (*(void (**)(uint64_t, unint64_t, uint64_t, const __CFString *, const __CFString *))(*(void *)v28 + 144LL))( v28,  v44 | ((unint64_t)v45 << 32),  8206LL,  @"Fake Accessory",  @"Fake Version");
        goto LABEL_41;
      }

      if (!strcasecmp(v6, "gapa"))
      {
        unsigned int v16 = (void *)CUXPCCreateCFObjectFromXPCObject(v4);
        if (v16)
        {
          CFTypeID TypeID = CFStringGetTypeID();
          uint64_t TypedValue = CFDictionaryGetTypedValue(v16, @"deviceID", TypeID, 0LL);
          int v19 = (void *)objc_claimAutoreleasedReturnValue(TypedValue);
          if (v19)
          {
            uint64_t v20 = -[CBStackControllerBTStack _btDeviceWithID:error:](self, "_btDeviceWithID:error:", v19, 0LL);
            if (v20)
            {
              int Int64Ranged = CFDictionaryGetInt64Ranged(v16, @"flags", 0LL, 0xFFFFFFFFLL, 0LL);
              int v22 = CFDictionaryGetInt64Ranged(v16, @"mask", 0LL, 0xFFFFFFFFLL, 0LL);
              sub_1003D84C8((uint64_t)v20, Int64Ranged, v22);
LABEL_52:
              uint64_t v8 = &stru_1008A57D8;
LABEL_53:

LABEL_54:
              goto LABEL_42;
            }

- (BOOL)disconnectDevice:(id)a3 serviceFlags:(unsigned int)a4 error:(id *)a5
{
  uint64_t v6 = *(void *)&a4;
  id v8 = a3;
  if (qword_1008D60B0 != -1) {
    dispatch_once(&qword_1008D60B0, &stru_1008810C8);
  }
  if (*((_BYTE *)off_1008D60A8 + 76))
  {
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 identifier]);
    uint64_t v10 = v9;
    if (v9)
    {
      if ([v9 caseInsensitiveCompare:@"all"])
      {
        BOOL v11 = -[CBStackControllerBTStack _disconnectDevice:serviceFlags:error:]( self,  "_disconnectDevice:serviceFlags:error:",  v8,  v6,  a5);
      }

      else
      {
        -[CBStackControllerBTStack _disconnectAllDevicesWithServiceFlags:]( self,  "_disconnectAllDevicesWithServiceFlags:",  v6);
        BOOL v11 = 1;
      }
    }

    else if (a5)
    {
      uint64_t v14 = CBErrorF(4294960588LL, "No device identifier");
      BOOL v11 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue(v14);
    }

    else
    {
      BOOL v11 = 0;
    }
  }

  else if (a5)
  {
    uint64_t v13 = CBErrorF(4294896144LL, "Bluetooth powered off");
    BOOL v11 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue(v13);
  }

  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

- (void)_disconnectAllDevicesWithServiceFlags:(unsigned int)a3
{
  if (dword_1008D66A0 <= 30 && (dword_1008D66A0 != -1 || _LogCategory_Initialize(&dword_1008D66A0, 30LL))) {
    LogPrintF_safe( &dword_1008D66A0,  "-[CBStackControllerBTStack _disconnectAllDevicesWithServiceFlags:]",  30LL,  "Disconnected all devices");
  }
  __p = 0LL;
  uint64_t v36 = 0LL;
  uint64_t v37 = 0LL;
  if (qword_1008D5F00 != -1) {
    dispatch_once(&qword_1008D5F00, &stru_100881128);
  }
  int v4 = sub_10040A790((uint64_t)off_1008D5EF8, &__p);
  uint64_t v5 = (v4 + 310000);
  if (v4) {
    BOOL v6 = (_DWORD)v5 == 0;
  }
  else {
    BOOL v6 = 1;
  }
  if (!v6
    && dword_1008D66A0 <= 90
    && (dword_1008D66A0 != -1 || _LogCategory_Initialize(&dword_1008D66A0, 90LL)))
  {
    uint64_t v7 = CUPrintErrorCode(v5);
    id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    LogPrintF_safe( &dword_1008D66A0,  "-[CBStackControllerBTStack _disconnectAllDevicesWithServiceFlags:]",  90LL,  "### GetConnectedDevices failed: %@",  v8);
  }

  uint64_t v9 = (uint64_t *)__p;
  uint64_t v10 = v36;
  if (__p != v36)
  {
    do
    {
      uint64_t v11 = *v9;
      if (qword_1008D60D0 != -1) {
        dispatch_once(&qword_1008D60D0, &stru_100881108);
      }
      int v12 = sub_1004287C4((int64x2_t *)off_1008D60C8, v11, a3);
      if (v12) {
        uint64_t v13 = (v12 + 310000);
      }
      else {
        uint64_t v13 = 0LL;
      }
      if (dword_1008D66A0 < 31
        && (dword_1008D66A0 != -1 || _LogCategory_Initialize(&dword_1008D66A0, 30LL)))
      {
        sub_1003CF00C(v11, v39);
        int v14 = v40;
        os_log_t v15 = (void **)v39[0];
        uint64_t v16 = CUPrintErrorCode(v13);
        uint64_t v17 = objc_claimAutoreleasedReturnValue(v16);
        unsigned int v18 = (void *)v17;
        int v19 = v39;
        if (v14 < 0) {
          int v19 = v15;
        }
        LogPrintF_safe( &dword_1008D66A0,  "-[CBStackControllerBTStack _disconnectAllDevicesWithServiceFlags:]",  30LL,  "Disconnect: classic, %s, %@",  v19,  v17);

        if (v40 < 0) {
          operator delete(v39[0]);
        }
      }

      ++v9;
    }

    while (v9 != v10);
  }

  __int128 v33 = 0u;
  __int128 v34 = 0u;
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  if (qword_1008D5F10 != -1) {
    dispatch_once(&qword_1008D5F10, &stru_100881208);
  }
  id v20 = sub_10059A34C((uint64_t)off_1008D5F08);
  __int128 v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
  id v22 = [v21 countByEnumeratingWithState:&v31 objects:v38 count:16];
  if (v22)
  {
    uint64_t v23 = *(void *)v32;
    do
    {
      CFTypeID v24 = 0LL;
      do
      {
        if (*(void *)v32 != v23) {
          objc_enumerationMutation(v21);
        }
        uint64_t v25 = *(void *)(*((void *)&v31 + 1) + 8LL * (void)v24);
        if (qword_1008D5F10 != -1) {
          dispatch_once(&qword_1008D5F10, &stru_100881208);
        }
        uint64_t v26 = off_1008D5F08;
        sub_100241F90(v39, v25);
        int v27 = sub_100597F98((uint64_t)v26, (unsigned __int8 *)v39, 2u);
        if (v27) {
          uint64_t v28 = (v27 + 310000);
        }
        else {
          uint64_t v28 = 0LL;
        }
        if (dword_1008D66A0 < 31
          && (dword_1008D66A0 != -1 || _LogCategory_Initialize(&dword_1008D66A0, 30LL)))
        {
          uint64_t v29 = CUPrintErrorCode(v28);
          CFTypeID v30 = (void *)objc_claimAutoreleasedReturnValue(v29);
          LogPrintF_safe( &dword_1008D66A0,  "-[CBStackControllerBTStack _disconnectAllDevicesWithServiceFlags:]",  30LL,  "Disconnect: BLE, %@, %@",  v25,  v30,  (void)v31);
        }

        CFTypeID v24 = (char *)v24 + 1;
      }

      while (v22 != v24);
      id v22 = [v21 countByEnumeratingWithState:&v31 objects:v38 count:16];
    }

    while (v22);
  }

  if (__p)
  {
    uint64_t v36 = (uint64_t *)__p;
    operator delete(__p);
  }

- (BOOL)_disconnectDevice:(id)a3 serviceFlags:(unsigned int)a4 error:(id *)a5
{
  id v8 = a3;
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 identifier]);
  if (v9)
  {
    uint64_t v10 = -[CBStackControllerBTStack _btDeviceWithID:error:](self, "_btDeviceWithID:error:", v9, 0LL);
    uint64_t v11 = (uint64_t)v10;
    if (v10 && sub_1003D0670((uint64_t)v10))
    {
      if (qword_1008D60D0 != -1) {
        dispatch_once(&qword_1008D60D0, &stru_100881108);
      }
      int v12 = sub_1004287C4((int64x2_t *)off_1008D60C8, v11, a4);
      if (v12) {
        uint64_t v13 = (v12 + 310000);
      }
      else {
        uint64_t v13 = 0LL;
      }
      if (dword_1008D66A0 < 31
        && (dword_1008D66A0 != -1 || _LogCategory_Initialize(&dword_1008D66A0, 30LL)))
      {
        uint64_t v14 = CUPrintErrorCode(v13);
        os_log_t v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
        LogPrintF_safe( &dword_1008D66A0,  "-[CBStackControllerBTStack _disconnectDevice:serviceFlags:error:]",  30LL,  "Disconnect: classic, %@, %@",  v8,  v15);
      }

      char v16 = 1;
    }

    else
    {
      char v16 = 0;
      uint64_t v13 = 1LL;
    }

    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(-[CBStackControllerBTStack _btUUIDWithID:error:](self, "_btUUIDWithID:error:", v9, 0LL));
    if (v17)
    {
      if (qword_1008D5F10 != -1) {
        dispatch_once(&qword_1008D5F10, &stru_100881208);
      }
      unsigned int v18 = off_1008D5F08;
      sub_100241F90(v36, v17);
      if (sub_100595874((uint64_t)v18, v36))
      {
        if (qword_1008D5F10 != -1) {
          dispatch_once(&qword_1008D5F10, &stru_100881208);
        }
        int v19 = off_1008D5F08;
        sub_100241F90(v36, v17);
        int v20 = sub_100597F98((uint64_t)v19, v36, 2u);
        if (v20) {
          uint64_t v21 = (v20 + 310000);
        }
        else {
          uint64_t v21 = 0LL;
        }
        if (dword_1008D66A0 < 31
          && (dword_1008D66A0 != -1 || _LogCategory_Initialize(&dword_1008D66A0, 30LL)))
        {
          uint64_t v22 = CUPrintErrorCode(v21);
          uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
          LogPrintF_safe( &dword_1008D66A0,  "-[CBStackControllerBTStack _disconnectDevice:serviceFlags:error:]",  30LL,  "Disconnect: BLE, %@, %@",  v8,  v23);
        }

        int v25 = 1;
        goto LABEL_44;
      }
    }

    if (v11) {
      char v24 = v16;
    }
    else {
      char v24 = 1;
    }
    if ((v24 & 1) != 0)
    {
      if ((v16 & 1) != 0)
      {
        int v25 = 0;
        uint64_t v21 = 1LL;
LABEL_44:
        if ((_DWORD)v13) {
          char v31 = v16;
        }
        else {
          char v31 = 0;
        }
        if ((v31 & 1) != 0)
        {
          uint64_t v30 = CBErrorF(v13, "Disconnect failed, classic");
          goto LABEL_53;
        }

        if (!(_DWORD)v21) {
          int v25 = 0;
        }
        if (v25 == 1)
        {
          uint64_t v30 = CBErrorF(v21, "Disconnect failed, BLE");
          goto LABEL_53;
        }

        LOBYTE(v27) = 0;
LABEL_57:
        id v32 = 0LL;
LABEL_58:

        char v33 = v27 ^ 1;
        goto LABEL_59;
      }
    }

    else
    {
      v36[0] = 0;
      sub_100242CA4(v36);
      int v26 = sub_10010D064(v11 + 128);
      sub_100242CD0(v36);
      if (v26) {
        uint64_t v27 = (v26 + 330000);
      }
      else {
        uint64_t v27 = 0LL;
      }
      if (dword_1008D66A0 < 31
        && (dword_1008D66A0 != -1 || _LogCategory_Initialize(&dword_1008D66A0, 30LL)))
      {
        uint64_t v28 = CUPrintErrorCode(v27);
        uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
        LogPrintF_safe( &dword_1008D66A0,  "-[CBStackControllerBTStack _disconnectDevice:serviceFlags:error:]",  30LL,  "Disconnect: HCI, %@, %@",  v8,  v29);
      }

      sub_100242CD8(v36);
      if (!(_DWORD)v27) {
        goto LABEL_57;
      }
    }

    uint64_t v30 = CBErrorF(4294960569LL, "Not connected");
LABEL_53:
    id v32 = (id)objc_claimAutoreleasedReturnValue(v30);
    LOBYTE(v27) = v32 != 0LL;
    if (a5 && v32)
    {
      id v32 = v32;
      *a5 = v32;
      LOBYTE(v27) = 1;
    }

    goto LABEL_58;
  }

  if (a5)
  {
    uint64_t v35 = CBErrorF(4294960588LL, "No device identifier");
    char v33 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue(v35);
  }

  else
  {
    char v33 = 0;
  }

- (BOOL)deleteDevice:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (qword_1008D60B0 != -1) {
    dispatch_once(&qword_1008D60B0, &stru_1008810C8);
  }
  if (*((_BYTE *)off_1008D60A8 + 76))
  {
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 identifier]);
    id v8 = v7;
    if (v7)
    {
      if ([v7 caseInsensitiveCompare:@"all"])
      {
        BOOL v9 = -[CBStackControllerBTStack _deleteDevice:error:](self, "_deleteDevice:error:", v6, a4);
      }

      else
      {
        -[CBStackControllerBTStack _deleteAllDevices](self, "_deleteAllDevices");
        BOOL v9 = 1;
      }
    }

    else if (a4)
    {
      uint64_t v12 = CBErrorF(4294960588LL, "No device identifier");
      BOOL v9 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue(v12);
    }

    else
    {
      BOOL v9 = 0;
    }
  }

  else if (a4)
  {
    uint64_t v11 = CBErrorF(4294896144LL, "Bluetooth off");
    BOOL v9 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue(v11);
  }

  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (void)_deleteAllDevices
{
  uint64_t v35 = 0LL;
  uint64_t v36 = 0LL;
  uint64_t v37 = 0LL;
  if (qword_1008D5F00 != -1) {
    dispatch_once(&qword_1008D5F00, &stru_100881128);
  }
  int v2 = sub_10040A6A8((uint64_t)off_1008D5EF8, (void ***)&v35);
  uint64_t v3 = (v2 + 310000);
  if (v2) {
    BOOL v4 = (_DWORD)v3 == 0;
  }
  else {
    BOOL v4 = 1;
  }
  if (!v4
    && dword_1008D66A0 <= 90
    && (dword_1008D66A0 != -1 || _LogCategory_Initialize(&dword_1008D66A0, 90LL)))
  {
    uint64_t v5 = CUPrintErrorCode(v3);
    id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    LogPrintF_safe( &dword_1008D66A0,  "-[CBStackControllerBTStack _deleteAllDevices]",  90LL,  "### GetPairedDevices failed: %@",  v6);
  }

  uint64_t v7 = (unsigned __int8 **)v35;
  id v8 = v36;
  if (v35 != v36)
  {
    do
    {
      BOOL v9 = *v7;
      if (qword_1008D67A8 != -1) {
        dispatch_once(&qword_1008D67A8, &stru_100881228);
      }
      int v10 = sub_10052F37C((uint64_t)off_1008D67A0, v9);
      if (v10) {
        uint64_t v11 = (v10 + 310000);
      }
      else {
        uint64_t v11 = 0LL;
      }
      if (dword_1008D66A0 < 31
        && (dword_1008D66A0 != -1 || _LogCategory_Initialize(&dword_1008D66A0, 30LL)))
      {
        sub_1003CF00C((uint64_t)v9, &__p);
        int v12 = SHIBYTE(v29);
        uint64_t v13 = (void **)__p;
        uint64_t v14 = CUPrintErrorCode(v11);
        uint64_t v15 = objc_claimAutoreleasedReturnValue(v14);
        char v16 = (void *)v15;
        p_p = &__p;
        if (v12 < 0) {
          p_p = v13;
        }
        LogPrintF_safe( &dword_1008D66A0,  "-[CBStackControllerBTStack _deleteAllDevices]",  30LL,  "Delete pairing: classic, %s, %@",  p_p,  v15);

        if (SHIBYTE(v29) < 0) {
          operator delete(__p);
        }
      }

      ++v7;
    }

    while (v7 != v8);
  }

  __int128 v33 = 0u;
  __int128 v34 = 0u;
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  if (qword_1008D5F20 != -1) {
    dispatch_once(&qword_1008D5F20, &stru_100881248);
  }
  id v18 = sub_100626468(qword_1008D5F18);
  id obj = (id)objc_claimAutoreleasedReturnValue(v18);
  id v19 = [obj countByEnumeratingWithState:&v31 objects:v38 count:16];
  if (v19)
  {
    uint64_t v20 = *(void *)v32;
    do
    {
      uint64_t v21 = 0LL;
      do
      {
        if (*(void *)v32 != v20) {
          objc_enumerationMutation(obj);
        }
        uint64_t v22 = *(void **)(*((void *)&v31 + 1) + 8LL * (void)v21);
        __p = 0LL;
        uint64_t v28 = &__p;
        uint64_t v29 = 0x2020000000LL;
        char v30 = 0;
        if (qword_1008D5F30 != -1) {
          dispatch_once(&qword_1008D5F30, &stru_100881188);
        }
        v26[0] = _NSConcreteStackBlock;
        v26[1] = 3221225472LL;
        v26[2] = sub_10006BB5C;
        v26[3] = &unk_10087EB00;
        v26[4] = &__p;
        if (sub_1005D5604((uint64_t)off_1008D5F28, v22, v26) && !*((_BYTE *)v28 + 24))
        {
          if (dword_1008D66A0 <= 30
            && (dword_1008D66A0 != -1 || _LogCategory_Initialize(&dword_1008D66A0, 30LL)))
          {
            LogPrintF_safe( &dword_1008D66A0,  "-[CBStackControllerBTStack _deleteAllDevices]",  30LL,  "Delete pairing: BLE, %@",  v22);
          }

          uint64_t v23 = sub_100404FE8();
          v25[0] = _NSConcreteStackBlock;
          v25[1] = 3221225472LL;
          v25[2] = sub_10006BBEC;
          void v25[3] = &unk_10087EA48;
          v25[4] = v22;
          sub_100405384(v23, v25);
        }

        _Block_object_dispose(&__p, 8);
        uint64_t v21 = (char *)v21 + 1;
      }

      while (v19 != v21);
      id v19 = [obj countByEnumeratingWithState:&v31 objects:v38 count:16];
    }

    while (v19);
  }

  if (v35)
  {
    uint64_t v36 = (unsigned __int8 **)v35;
    operator delete(v35);
  }

- (BOOL)_deleteDevice:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 identifier]);
  if (v7)
  {
    id v8 = -[CBStackControllerBTStack _btDeviceWithID:error:](self, "_btDeviceWithID:error:", v7, 0LL);
    if (!v8) {
      goto LABEL_14;
    }
    if (qword_1008D67A8 != -1) {
      dispatch_once(&qword_1008D67A8, &stru_100881228);
    }
    if (sub_10052F32C((uint64_t)off_1008D67A0, v8))
    {
      if (qword_1008D67A8 != -1) {
        dispatch_once(&qword_1008D67A8, &stru_100881228);
      }
      int v9 = sub_10052F37C((uint64_t)off_1008D67A0, v8);
      if (v9) {
        uint64_t v10 = (v9 + 310000);
      }
      else {
        uint64_t v10 = 0LL;
      }
      if (dword_1008D66A0 < 31
        && (dword_1008D66A0 != -1 || _LogCategory_Initialize(&dword_1008D66A0, 30LL)))
      {
        uint64_t v11 = CUPrintErrorCode(v10);
        int v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
        LogPrintF_safe( &dword_1008D66A0,  "-[CBStackControllerBTStack _deleteDevice:error:]",  30LL,  "Delete pairing: classic, %@, %@",  v6,  v12);
      }

      int v13 = 1;
    }

    else
    {
LABEL_14:
      int v13 = 0;
      uint64_t v10 = 1LL;
    }

    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[CBStackControllerBTStack _btUUIDWithID:error:](self, "_btUUIDWithID:error:", v7, 0LL));
    if (!v14) {
      goto LABEL_24;
    }
    if (qword_1008D5F20 != -1) {
      dispatch_once(&qword_1008D5F20, &stru_100881248);
    }
    if (sub_10061C0F8(qword_1008D5F18, v14))
    {
      if (dword_1008D66A0 <= 30
        && (dword_1008D66A0 != -1 || _LogCategory_Initialize(&dword_1008D66A0, 30LL)))
      {
        LogPrintF_safe( &dword_1008D66A0,  "-[CBStackControllerBTStack _deleteDevice:error:]",  30LL,  "Delete pairing: BLE, %@",  v6);
      }

      uint64_t v16 = sub_100404FE8();
      v23[0] = _NSConcreteStackBlock;
      v23[1] = 3221225472LL;
      v23[2] = sub_10006BF74;
      v23[3] = &unk_10087EA48;
      v23[4] = v14;
      sub_100405384(v16, v23);
    }

    else
    {
LABEL_24:
      if ((v13 & 1) == 0)
      {
        uint64_t v15 = CBErrorF(4294960569LL, "Not paired");
        goto LABEL_33;
      }
    }

    if ((_DWORD)v10) {
      int v17 = v13;
    }
    else {
      int v17 = 0;
    }
    if (v17 != 1)
    {
      BOOL v19 = 0;
      id v18 = 0LL;
LABEL_37:
      BOOL v20 = !v19;

      goto LABEL_38;
    }

    uint64_t v15 = CBErrorF(v10, "Delete pairing failed");
LABEL_33:
    id v18 = (id)objc_claimAutoreleasedReturnValue(v15);
    BOOL v19 = v18 != 0LL;
    if (a4 && v18)
    {
      id v18 = v18;
      *a4 = v18;
      BOOL v19 = 1;
    }

    goto LABEL_37;
  }

  if (a4)
  {
    uint64_t v22 = CBErrorF(4294960588LL, "No device identifier");
    BOOL v20 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue(v22);
  }

  else
  {
    BOOL v20 = 0;
  }

- (id)getDevicesWithFlags:(unsigned int)a3 error:(id *)a4
{
  char v63 = a3;
  __int128 v60 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v69 = 0u;
  __int128 v70 = 0u;
  __int128 v71 = 0u;
  __int128 v72 = 0u;
  if (qword_1008D5F20 != -1) {
    dispatch_once(&qword_1008D5F20, &stru_100881248);
  }
  id v4 = sub_100626468(qword_1008D5F18);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  id obj = v5;
  id v6 = [v5 countByEnumeratingWithState:&v69 objects:v88 count:16];
  if (v6)
  {
    uint64_t v62 = *(void *)v70;
    do
    {
      uint64_t v7 = 0LL;
      do
      {
        if (*(void *)v70 != v62) {
          objc_enumerationMutation(obj);
        }
        id v8 = *(void **)(*((void *)&v69 + 1) + 8LL * (void)v7);
        uint64_t v84 = 0LL;
        v85 = &v84;
        uint64_t v86 = 0x2020000000LL;
        uint64_t v87 = 0LL;
        __p.n128_u64[0] = 0LL;
        __p.n128_u64[1] = (unint64_t)&__p;
        uint64_t v80 = 0x3032000000LL;
        v81 = sub_100069D3C;
        v82 = sub_100069D4C;
        id v83 = 0LL;
        if (qword_1008D5F30 != -1) {
          dispatch_once(&qword_1008D5F30, &stru_100881188);
        }
        v68[0] = _NSConcreteStackBlock;
        v68[1] = 3221225472LL;
        v68[2] = sub_10006CB1C;
        v68[3] = &unk_100880CF8;
        v68[4] = &v84;
        v68[5] = &__p;
        if (sub_1005D5604((uint64_t)off_1008D5F28, v8, v68))
        {
          int v9 = objc_alloc_init(&OBJC_CLASS___CBDevice);
          uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v8 UUIDString]);
          -[CBDevice setIdentifier:](v9, "setIdentifier:", v10);

          -[CBDevice setName:](v9, "setName:", *(void *)(__p.n128_u64[1] + 40));
          uint64_t v11 = v85[3];
          LOBYTE(v73) = BYTE5(v11);
          BYTE1(v73) = BYTE4(v11);
          BYTE2(v73) = BYTE3(v11);
          BYTE3(v73) = BYTE2(v11);
          BYTE4(v73) = BYTE1(v11);
          BYTE5(v73) = v11;
          int v12 = -[NSData initWithBytes:length:](objc_alloc(&OBJC_CLASS___NSData), "initWithBytes:length:", &v73, 6LL);
          -[CBDevice setBtAddressData:](v9, "setBtAddressData:", v12);

          if ((v63 & 2) != 0)
          {
            if (qword_1008D5F30 != -1) {
              dispatch_once(&qword_1008D5F30, &stru_100881188);
            }
            int v13 = off_1008D5F28;
            id v14 = sub_1005D7D88((uint64_t)off_1008D5F28, v8);
            uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
            if ([v15 length])
            {
              id v16 = sub_1005D77C0((uint64_t)v13, v15);
              int v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
              if (v17)
              {
                if (sub_1005D7E40((uint64_t)v13, v17) == 2)
                {
                  id v18 = (void *)objc_claimAutoreleasedReturnValue([v17 UUIDString]);
                  -[CBDevice setFindMyCaseIdentifier:](v9, "setFindMyCaseIdentifier:", v18);
                }

                id v19 = sub_1005D7C70((uint64_t)v13, v17);
                BOOL v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
                uint64_t v21 = v20;
                if (v20)
                {
                  uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v20 UUIDString]);
                  -[CBDevice setFindMyGroupIdentifier:](v9, "setFindMyGroupIdentifier:", v22);
                }
              }
            }
          }

          if ((v63 & 1) != 0)
          {
            int v78 = 0;
            memset(v77, 0, sizeof(v77));
            __int128 v75 = 0u;
            __int128 v76 = 0u;
            __int128 v74 = 0u;
            if (qword_1008D5F20 != -1) {
              dispatch_once(&qword_1008D5F20, &stru_100881248);
            }
            sub_10062923C(qword_1008D5F18, v8, (uint64_t)&v74);
            char v23 = v78;
            if ((v78 & 0x40) != 0)
            {
              char v24 = -[NSData initWithBytes:length:]( objc_alloc(&OBJC_CLASS___NSData),  "initWithBytes:length:",  &v77[8],  16LL);
              -[CBDevice setIrkData:](v9, "setIrkData:", v24);

              char v23 = v78;
            }

            if ((v23 & 1) != 0)
            {
              uint64_t v27 = objc_alloc(&OBJC_CLASS___NSData);
              int v26 = -[NSData initWithBytes:length:](v27, "initWithBytes:length:", &v74, v75);
              -[CBDevice setLtkData:](v9, "setLtkData:", v26);
LABEL_32:
            }

            else if ((v23 & 8) != 0)
            {
              int v25 = objc_alloc(&OBJC_CLASS___NSData);
              int v26 = -[NSData initWithBytes:length:](v25, "initWithBytes:length:", (char *)&v75 + 12, BYTE12(v76));
              -[CBDevice setLtkData:](v9, "setLtkData:", v26);
              goto LABEL_32;
            }
          }

          -[NSMutableArray addObject:](v60, "addObject:", v9);
        }

        _Block_object_dispose(&__p, 8);

        _Block_object_dispose(&v84, 8);
        uint64_t v7 = (char *)v7 + 1;
      }

      while (v6 != v7);
      uint64_t v5 = obj;
      id v6 = [obj countByEnumeratingWithState:&v69 objects:v88 count:16];
    }

    while (v6);
  }

  __int128 v74 = 0uLL;
  *(void *)&__int128 v75 = 0LL;
  if (qword_1008D5F00 != -1) {
    dispatch_once(&qword_1008D5F00, &stru_100881128);
  }
  int v28 = sub_10040A6A8((uint64_t)off_1008D5EF8, (void ***)&v74);
  if (v28)
  {
    uint64_t v29 = (v28 + 310000);
    if (v28 != -310000
      && dword_1008D66A0 <= 90
      && (dword_1008D66A0 != -1 || _LogCategory_Initialize(&dword_1008D66A0, 90LL)))
    {
      uint64_t v30 = CUPrintErrorCode(v29);
      __int128 v31 = (void *)objc_claimAutoreleasedReturnValue(v30);
      LogPrintF_safe( &dword_1008D66A0,  "-[CBStackControllerBTStack getDevicesWithFlags:error:]",  90LL,  "### GetPairedDevices failed: %@",  v31);
    }
  }

  __int128 v32 = (uint64_t *)*((void *)&v74 + 1);
  for (i = (uint64_t *)v74; i != v32; ++i)
  {
    uint64_t v34 = *i;
    int v66 = *(_DWORD *)(*i + 128);
    __int16 v67 = *(_WORD *)(v34 + 132);
    uint64_t v84 = 0LL;
    v85 = 0LL;
    if (qword_1008D5F30 != -1) {
      dispatch_once(&qword_1008D5F30, &stru_100881188);
    }
    sub_1005C8684( (uint64_t)off_1008D5F28,  ((unint64_t)v66 << 40) | ((unint64_t)BYTE1(v66) << 32) | ((unint64_t)BYTE2(v66) << 24) | ((unint64_t)HIBYTE(v66) << 16) | ((unint64_t)v67 << 8) | HIBYTE(v67),  1u,  1u,  0LL,  0LL,  (unsigned __int8 *)&v84);
    uint64_t v35 = sub_100241F94((const unsigned __int8 *)&v84);
    uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue(v35);
    if (v36)
    {
      uint64_t v64 = 0LL;
      uint64_t v65 = 0LL;
      BOOL v37 = sub_1003D55EC(v34, (_DWORD *)&v65 + 1, &v65, (_DWORD *)&v64 + 1, &v64);
      std::string v38 = objc_alloc_init(&OBJC_CLASS___CBDevice);
      -[CBDevice setColorInfo:](v38, "setColorInfo:", (unsigned __int16)sub_1003E16E4(v34));
      uint64_t v39 = (void *)objc_claimAutoreleasedReturnValue([v36 UUIDString]);
      -[CBDevice setIdentifier:](v38, "setIdentifier:", v39);

      sub_1003D0100(v34, (uint64_t)&__p);
      if (v80 >= 0) {
        p_p = &__p;
      }
      else {
        p_p = (__n128 *)__p.n128_u64[0];
      }
      os_log_t v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", p_p));
      -[CBDevice setName:](v38, "setName:", v41);

      if (SHIBYTE(v80) < 0) {
        operator delete((void *)__p.n128_u64[0]);
      }
      if (v37) {
        uint64_t v42 = HIDWORD(v64);
      }
      else {
        uint64_t v42 = 0LL;
      }
      -[CBDevice setProductID:](v38, "setProductID:", v42);
      char v43 = -[NSData initWithBytes:length:](objc_alloc(&OBJC_CLASS___NSData), "initWithBytes:length:", &v66, 6LL);
      -[CBDevice setBtAddressData:](v38, "setBtAddressData:", v43);

      if ((v63 & 2) != 0)
      {
        __n128 __p = 0uLL;
        uint64_t v80 = 0LL;
        sub_1003D8F04(v34, (uint64_t)&__p);
        if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)(__p.n128_u64[1] - __p.n128_u64[0]) >> 3) < 4)
        {
          unsigned __int16 v45 = 0LL;
        }

        else
        {
          unsigned int v44 = (void *)(__p.n128_u64[0] + 72);
          unsigned __int16 v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v44));
        }

        if ([v45 length])
        {
          if (qword_1008D5F30 != -1) {
            dispatch_once(&qword_1008D5F30, &stru_100881188);
          }
          __int128 v46 = off_1008D5F28;
          id v47 = sub_1005D77C0((uint64_t)off_1008D5F28, v45);
          __int128 v48 = (void *)objc_claimAutoreleasedReturnValue(v47);
          if (v48)
          {
            if (sub_1005D7E40((uint64_t)v46, v48) == 2)
            {
              id v49 = (void *)objc_claimAutoreleasedReturnValue([v48 UUIDString]);
              -[CBDevice setFindMyCaseIdentifier:](v38, "setFindMyCaseIdentifier:", v49);
            }

            id v50 = sub_1005D7C70((uint64_t)v46, v48);
            id v51 = (void *)objc_claimAutoreleasedReturnValue(v50);
            __int128 v52 = v51;
            if (v51)
            {
              __int128 v53 = (void *)objc_claimAutoreleasedReturnValue([v51 UUIDString]);
              -[CBDevice setFindMyGroupIdentifier:](v38, "setFindMyGroupIdentifier:", v53);
            }
          }
        }

        v73 = &__p;
        sub_100024304((void ***)&v73);
      }

      if ((v63 & 1) != 0)
      {
        __n128 __p = 0uLL;
        LODWORD(v80) = 0;
        sub_10052523C((uint64_t)&__p);
        if (qword_1008D67B8 != -1) {
          dispatch_once(&qword_1008D67B8, &stru_100881268);
        }
        if (!sub_100535750((uint64_t)off_1008D67B0, (unsigned __int8 *)v34, &__p))
        {
          __int128 v55 = objc_alloc(&OBJC_CLASS___NSData);
          uint64_t v57 = nullsub_63(&__p, v56);
          id v58 = -[NSData initWithBytes:length:](v55, "initWithBytes:length:", v57, sub_1005252DC());
          -[CBDevice setLinkKeyData:](v38, "setLinkKeyData:", v58);
        }

        nullsub_63(&__p, v54);
      }

      -[NSMutableArray addObject:](v60, "addObject:", v38);
    }
  }

  if ((void)v74)
  {
    *((void *)&v74 + 1) = v74;
    operator delete((void *)v74);
  }

  return v60;
}

- (void)localDeviceEvent:(int)a3
{
  switch(a3)
  {
    case 0:
      if (dword_1008D66A0 <= 30
        && (dword_1008D66A0 != -1 || _LogCategory_Initialize(&dword_1008D66A0, 30LL)))
      {
        unint64_t v6 = -[CBStackControllerBTStack powerState](self, "powerState");
        if (v6 > 0xA) {
          uint64_t v7 = "?";
        }
        else {
          uint64_t v7 = off_100881360[v6];
        }
        LogPrintF_safe( &dword_1008D66A0,  "-[CBStackControllerBTStack localDeviceEvent:]",  30LL,  "Power state changed: %s",  v7);
      }

      uint64_t v15 = (void (**)(void))objc_retainBlock(self->_controllerDataChangedHandler);
      if (v15) {
        v15[2]();
      }

      id v16 = (void (**)(void))objc_retainBlock(self->_discoverableStateChangedHandler);
      if (v16) {
        v16[2]();
      }

      int v17 = (void (**)(void))objc_retainBlock(self->_inquiryStateChangedHandler);
      if (v17) {
        v17[2]();
      }

      id v14 = (void (**)(void))objc_retainBlock(self->_powerChangedHandler);
      if (!v14) {
        goto LABEL_44;
      }
      goto LABEL_43;
    case 2:
      if (dword_1008D66A0 <= 30
        && (dword_1008D66A0 != -1 || _LogCategory_Initialize(&dword_1008D66A0, 30LL)))
      {
        unsigned int v8 = -[CBStackControllerBTStack discoverableState](self, "discoverableState");
        if (v8 > 2) {
          int v9 = "?";
        }
        else {
          int v9 = off_100881348[v8];
        }
        LogPrintF_safe( &dword_1008D66A0,  "-[CBStackControllerBTStack localDeviceEvent:]",  30LL,  "Discoverable state changed: %s",  v9);
      }

      int v13 = (void (**)(void))objc_retainBlock(self->_discoverableStateChangedHandler);
      if (v13) {
        goto LABEL_48;
      }
      goto LABEL_49;
    case 6:
    case 7:
      if (dword_1008D66A0 <= 30
        && (dword_1008D66A0 != -1 || _LogCategory_Initialize(&dword_1008D66A0, 30LL)))
      {
        unsigned int v4 = -[CBStackControllerBTStack inquiryState](self, "inquiryState");
        if (v4 > 2) {
          uint64_t v5 = "?";
        }
        else {
          uint64_t v5 = off_100881348[v4];
        }
        LogPrintF_safe( &dword_1008D66A0,  "-[CBStackControllerBTStack localDeviceEvent:]",  30LL,  "Inquiry state changed: %s",  v5);
      }

      int v13 = (void (**)(void))objc_retainBlock(self->_inquiryStateChangedHandler);
      if (v13) {
LABEL_48:
      }
        v13[2]();
LABEL_49:

      break;
    case 10:
      if (qword_1008D60B0 != -1) {
        dispatch_once(&qword_1008D60B0, &stru_1008810C8);
      }
      int v10 = sub_1004313B0((uint64_t)off_1008D60A8);
      if (dword_1008D66A0 <= 30)
      {
        int v11 = v10;
        if (dword_1008D66A0 != -1 || _LogCategory_Initialize(&dword_1008D66A0, 30LL))
        {
          int v12 = "no";
          if (v11) {
            int v12 = "yes";
          }
          LogPrintF_safe( &dword_1008D66A0,  "-[CBStackControllerBTStack localDeviceEvent:]",  30LL,  "Restricted mode changed: %s",  v12);
        }
      }

      id v14 = (void (**)(void))objc_retainBlock(self->_powerChangedHandler);
      if (v14) {
LABEL_43:
      }
        v14[2]();
LABEL_44:

      notify_set_state(self->_powerStateNotifyToken, -[CBStackControllerBTStack powerState](self, "powerState"));
      notify_post("com.apple.bluetooth.state");
      break;
    default:
      return;
  }

- (BOOL)modifyDevice:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = objc_alloc_init(&OBJC_CLASS___CBDeviceSettings);
  [v7 setDoubleTapActionLeft:[v6 doubleTapActionLeft]];
  [v7 setDoubleTapActionRight:[v6 doubleTapActionRight]];
  [v7 setMicrophoneMode:[v6 microphoneMode]];
  [v7 setPlacementMode:[v6 placementMode]];
  [v7 setSmartRoutingMode:[v6 smartRoutingMode]];
  LOBYTE(a4) = -[CBStackControllerBTStack modifyDevice:settings:error:]( self,  "modifyDevice:settings:error:",  v6,  v7,  a4);

  return (char)a4;
}

- (void)modifyDevice:(id)a3 connectionPriorityDevices:(id)a4 timeoutSeconds:(double)a5 completionHandler:(id)a6
{
  id v46 = a3;
  id v47 = a4;
  id v44 = a6;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  uint64_t v59 = 0LL;
  __int128 v60 = &v59;
  uint64_t v61 = 0x3032000000LL;
  uint64_t v62 = sub_100069D3C;
  char v63 = sub_100069D4C;
  id v64 = 0LL;
  v56[0] = _NSConcreteStackBlock;
  v56[1] = 3221225472LL;
  v56[2] = sub_10006D688;
  v56[3] = &unk_100880CA8;
  id v58 = &v59;
  id v10 = v44;
  id v57 = v10;
  unsigned __int16 v45 = objc_retainBlock(v56);
  if (dword_1008D66A0 <= 30 && (dword_1008D66A0 != -1 || _LogCategory_Initialize(&dword_1008D66A0, 30LL)))
  {
    uint64_t v11 = CUPrintNSObjectOneLine(v47);
    int v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    LogPrintF_safe( &dword_1008D66A0,  "-[CBStackControllerBTStack modifyDevice:connectionPriorityDevices:timeoutSeconds:completionHandler:]",  30LL,  "ModifyDevice CnxPri start: %@, %@",  v46,  v12,  v44);
  }

  int v13 = (void *)objc_claimAutoreleasedReturnValue([v46 identifier]);
  id v14 = (id *)(v60 + 5);
  id obj = (id)v60[5];
  uint64_t v15 = -[CBStackControllerBTStack _btDeviceWithID:error:](self, "_btDeviceWithID:error:", v13, &obj);
  objc_storeStrong(v14, obj);

  if (v15)
  {
    id v16 = [v47 count];
    unsigned __int8 v17 = v16;
    if ((unint64_t)v16 >= 0x100)
    {
      uint64_t v40 = CBErrorF(4294960591LL, "Too many devices");
      uint64_t v41 = objc_claimAutoreleasedReturnValue(v40);
      id v18 = (NSMutableData *)v60[5];
      v60[5] = v41;
    }

    else
    {
      id v18 = objc_alloc_init(&OBJC_CLASS___NSMutableData);
      __int128 v53 = 0u;
      __int128 v54 = 0u;
      __int128 v51 = 0u;
      __int128 v52 = 0u;
      id v19 = (CBStackModifyDeviceRequest *)v47;
      id v20 = -[CBStackModifyDeviceRequest countByEnumeratingWithState:objects:count:]( v19,  "countByEnumeratingWithState:objects:count:",  &v51,  v65,  16LL);
      if (v20)
      {
        uint64_t v21 = *(void *)v52;
        while (2)
        {
          for (i = 0LL; i != v20; i = (char *)i + 1)
          {
            if (*(void *)v52 != v21) {
              objc_enumerationMutation(v19);
            }
            char v23 = (const char *)[*(id *)(*((void *)&v51 + 1) + 8 * (void)i) UTF8String];
            char v24 = v23;
            if (!v23)
            {
              uint64_t v34 = CBErrorF(4294960591LL, "Bad deviceAddress");
              uint64_t v35 = objc_claimAutoreleasedReturnValue(v34);
              uint64_t v36 = (void *)v60[5];
              v60[5] = v35;

              goto LABEL_25;
            }

            __int16 v50 = 0;
            int v49 = 0;
            uint64_t v25 = TextToHardwareAddress(v23, -1LL, 6LL, &v49);
            if ((_DWORD)v25)
            {
              uint64_t v37 = CBErrorF(v25, "Bad deviceAddress: '%s'", v24);
              uint64_t v38 = objc_claimAutoreleasedReturnValue(v37);
              uint64_t v39 = (void *)v60[5];
              v60[5] = v38;

              goto LABEL_25;
            }

            -[NSMutableData appendBytes:length:](v18, "appendBytes:length:", &v49, 6LL);
          }

          id v20 = -[CBStackModifyDeviceRequest countByEnumeratingWithState:objects:count:]( v19,  "countByEnumeratingWithState:objects:count:",  &v51,  v65,  16LL);
          if (v20) {
            continue;
          }
          break;
        }
      }

      if (qword_1008D60E0 != -1) {
        dispatch_once(&qword_1008D60E0, &stru_1008811C8);
      }
      int v26 = sub_1002186B0( (uint64_t)off_1008D60D8, (uint64_t)v15, 1, (int *)-[NSMutableData bytes](v18, "bytes"), v17);
      if (v26 && (uint64_t v27 = (v26 + 310000), (_DWORD)v27))
      {
        uint64_t v42 = CBErrorF(v27, "AACP updateConnPriorityList failed");
        uint64_t v43 = objc_claimAutoreleasedReturnValue(v42);
        id v19 = (CBStackModifyDeviceRequest *)v60[5];
        v60[5] = v43;
      }

      else
      {
        id v19 = objc_alloc_init(&OBJC_CLASS___CBStackModifyDeviceRequest);
        -[CBStackModifyDeviceRequest setCompletionHandler:](v19, "setCompletionHandler:", v10);
        -[CBStackModifyDeviceRequest setDevice:](v19, "setDevice:", v46);
        int v28 = dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_timer,  0LL,  0LL,  (dispatch_queue_t)self->_dispatchQueue);
        -[CBStackModifyDeviceRequest setTimer:](v19, "setTimer:", v28);
        handler[0] = _NSConcreteStackBlock;
        handler[1] = 3221225472LL;
        handler[2] = sub_10006D764;
        handler[3] = &unk_100880CD0;
        handler[4] = v28;
        void handler[5] = v19;
        handler[6] = self;
        dispatch_source_set_event_handler(v28, handler);
        double v29 = 10.0;
        if (a5 > 0.0) {
          double v29 = a5;
        }
        CUDispatchTimerSet(v28, v29, -1.0, 1.0);
        dispatch_activate(v28);
        modifyDeviceRequests = self->_modifyDeviceRequests;
        if (!modifyDeviceRequests)
        {
          __int128 v31 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
          __int128 v33 = self->_modifyDeviceRequests;
          p_modifyDeviceRequests = &self->_modifyDeviceRequests;
          *p_modifyDeviceRequests = v31;

          modifyDeviceRequests = *p_modifyDeviceRequests;
        }

        -[NSMutableSet addObject:](modifyDeviceRequests, "addObject:", v19);
      }

- (BOOL)modifyDevice:(id)a3 peerSourceDevice:(id)a4 peerSourceState:(char)a5 requestFlags:(unsigned int)a6 error:(id *)a7
{
  char v8 = a6;
  int v9 = a5;
  id v12 = a3;
  id v13 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  id v14 = (void *)objc_claimAutoreleasedReturnValue([v12 identifier]);
  uint64_t v15 = -[CBStackControllerBTStack _btDeviceWithID:error:](self, "_btDeviceWithID:error:", v14, a7);

  if (!v15)
  {
    BOOL v20 = 0;
    goto LABEL_9;
  }

  id v16 = (void *)objc_claimAutoreleasedReturnValue([v13 identifier]);
  unsigned __int8 v17 = v16;
  if (v16)
  {
    WORD2(v27) = 0;
    LODWORD(v27) = 0;
    id v18 = v16;
    if (!TextToHardwareAddress([v18 UTF8String], -1, 6, &v27))
    {
      if (qword_1008D60E0 != -1) {
        dispatch_once(&qword_1008D60E0, &stru_1008811C8);
      }
      int v19 = sub_10021ABE4((uint64_t)off_1008D60D8, (uint64_t)v15, (uint64_t)&v27, v9, (v8 & 0x10) != 0);
      BOOL v20 = 1;
      if (!v19) {
        goto LABEL_8;
      }
      uint64_t v21 = (v19 + 310000);
      if (!(_DWORD)v21) {
        goto LABEL_8;
      }
      if (a7)
      {
        uint64_t v26 = CBErrorF(v21, "setDeviceStateOnPeerSrc failed");
        char v24 = (void *)objc_claimAutoreleasedReturnValue(v26);
        goto LABEL_17;
      }

- (BOOL)modifyDevice:(id)a3 settings:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v8 identifier]);
  if (v10)
  {
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v8 idsDeviceID]);
    if (v11)
    {
      id v12 = (void *)objc_claimAutoreleasedReturnValue([v8 idsDeviceID]);
      id v13 = [v12 length];

      if (v13)
      {
        uint64_t v45 = 0LL;
        id v46 = &v45;
        uint64_t v47 = 0x3032000000LL;
        __int128 v48 = sub_100069D3C;
        int v49 = sub_100069D4C;
        id v50 = 0LL;
        if (qword_1008D5F30 != -1) {
          dispatch_once(&qword_1008D5F30, &stru_100881188);
        }
        id v14 = off_1008D5F28;
        uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v8 idsDeviceID]);
        v41[0] = _NSConcreteStackBlock;
        v41[1] = 3221225472LL;
        v41[2] = sub_10006DE94;
        v41[3] = &unk_100880D20;
        void v41[4] = self;
        id v42 = v8;
        id v43 = v9;
        id v44 = &v45;
        char v16 = sub_1005D5374((uint64_t)v14, v15, v41);

        if ((v16 & 1) != 0)
        {
          unsigned __int8 v17 = (void *)v46[5];
          if (!v17)
          {
            BOOL v18 = 1;
LABEL_9:

LABEL_20:
            _Block_object_dispose(&v45, 8);

            goto LABEL_21;
          }

          if (a5)
          {
            id v26 = v17;
            goto LABEL_28;
          }
        }

        else if (a5)
        {
          uint64_t v25 = CBErrorF(4294960569LL, "Cloud Paired Device not found '%@'", v10);
          id v26 = (id)objc_claimAutoreleasedReturnValue(v25);
LABEL_28:
          BOOL v18 = 0;
          *a5 = v26;
          goto LABEL_9;
        }

        BOOL v18 = 0;
        goto LABEL_9;
      }
    }

    int v19 = -[CBStackControllerBTStack _btDeviceWithID:error:](self, "_btDeviceWithID:error:", v10, 0LL);
    if (v19)
    {
      BOOL v18 = -[CBStackControllerBTStack modifyDevice:btDevice:settings:error:]( self,  "modifyDevice:btDevice:settings:error:",  v8,  v19,  v9,  a5);
      goto LABEL_21;
    }

    uint64_t v45 = 0LL;
    id v46 = &v45;
    uint64_t v47 = 0x3032000000LL;
    __int128 v48 = sub_100069D3C;
    int v49 = sub_100069D4C;
    id v50 = 0LL;
    id obj = 0LL;
    BOOL v20 = (void *)objc_claimAutoreleasedReturnValue(-[CBStackControllerBTStack _btUUIDWithID:error:](self, "_btUUIDWithID:error:", v10, &obj));
    objc_storeStrong(&v50, obj);
    if (!v20)
    {
      if (a5)
      {
        uint64_t v27 = (void *)v46[5];
        if (v27)
        {
          BOOL v18 = 0;
          *a5 = v27;
          goto LABEL_19;
        }

        uint64_t v30 = CBErrorF(4294960534LL, "Bad device UUID: '%@'", v10);
        id v31 = objc_claimAutoreleasedReturnValue(v30);
        *a5 = v31;
      }

      BOOL v18 = 0;
      goto LABEL_19;
    }

    if (qword_1008D5F30 != -1) {
      dispatch_once(&qword_1008D5F30, &stru_100881188);
    }
    uint64_t v21 = off_1008D5F28;
    __int128 v32 = _NSConcreteStackBlock;
    uint64_t v33 = 3221225472LL;
    uint64_t v34 = sub_10006DEE4;
    uint64_t v35 = &unk_100880D20;
    uint64_t v36 = self;
    id v37 = v8;
    id v38 = v9;
    uint64_t v39 = &v45;
    if (sub_1005D5604((uint64_t)v21, v20, &v32))
    {
      uint64_t v22 = (void *)v46[5];
      if (!v22)
      {
        BOOL v18 = 1;
LABEL_18:

LABEL_19:
        goto LABEL_20;
      }

      if (a5)
      {
        id v29 = v22;
        goto LABEL_38;
      }
    }

    else if (a5)
    {
      uint64_t v28 = CBErrorF(4294960569LL, "Device not found '%@'", v10, v32, v33, v34, v35, v36, v37);
      id v29 = (id)objc_claimAutoreleasedReturnValue(v28);
LABEL_38:
      BOOL v18 = 0;
      *a5 = v29;
      goto LABEL_18;
    }

    BOOL v18 = 0;
    goto LABEL_18;
  }

  if (a5)
  {
    uint64_t v24 = CBErrorF(4294960588LL, "No device ID");
    BOOL v18 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue(v24);
  }

  else
  {
    BOOL v18 = 0;
  }

- (BOOL)modifyDevice:(id)a3 btDevice:(void *)a4 settings:(id)a5 error:(id *)a6
{
  id v9 = a3;
  id v10 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v9 identifier]);
  if (!v11)
  {
    if (!a6) {
      goto LABEL_328;
    }
    uint64_t v127 = CBErrorF(4294960588LL, "No device ID");
    v128 = (void *)objc_claimAutoreleasedReturnValue(v127);
LABEL_327:
    BOOL v122 = 0;
    *a6 = v128;
    goto LABEL_290;
  }

  if (qword_1008D5F40 != -1) {
    dispatch_once(&qword_1008D5F40, &stru_100881288);
  }
  v150 = off_1008D5F38;
  int v12 = [v10 aclPriority];
  if (v12)
  {
    uint64_t v13 = sub_1002E6E9C();
    if (((*(uint64_t (**)(uint64_t))(*(void *)v13 + 2712LL))(v13) & 1) == 0)
    {
      if (!a6) {
        goto LABEL_328;
      }
      uint64_t v130 = CBErrorF(4294960561LL, "ACL priority not supported");
      v128 = (void *)objc_claimAutoreleasedReturnValue(v130);
      goto LABEL_327;
    }

    if (v12 <= 19)
    {
      if (v12 == 1)
      {
        id v14 = "Default";
        goto LABEL_20;
      }
    }

    else
    {
      switch(v12)
      {
        case 20:
          id v14 = "Low";
          goto LABEL_20;
        case 50:
          id v14 = "Medium";
          goto LABEL_20;
        case 80:
          id v14 = "High";
LABEL_20:
          LogPrintF_safe( &dword_1008D66A0,  "-[CBStackControllerBTStack modifyDevice:btDevice:settings:error:]",  30LL,  "aclPriority: device %@, priority %s",  v11,  v14);
LABEL_21:
          uint64_t v15 = sub_1002E6E9C();
          uint64_t v16 = *((unsigned __int16 *)a4 + 66);
          uint64_t v17 = *((unsigned int *)a4 + 32);
          uint64_t v18 = sub_1003D0268((uint64_t)a4);
          int v19 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, BOOL, BOOL, uint64_t, uint64_t))(*(void *)v15 + 72LL))( v15,  (v17 | (v16 << 32)) & 0xFFFFFFFFFFFFLL,  v18,  32LL,  v12 == 80,  v12 == 80,  1LL,  1LL);
          if (v19)
          {
            uint64_t v20 = (v19 + 310000);
            if ((_DWORD)v20)
            {
              if (!a6) {
                goto LABEL_328;
              }
              uint64_t v131 = CBErrorF(v20, "aclPriority failed");
              v128 = (void *)objc_claimAutoreleasedReturnValue(v131);
              goto LABEL_327;
            }
          }

          goto LABEL_23;
      }
    }

    id v14 = "?";
    goto LABEL_20;
  }

- (BOOL)modifyDevice:(id)a3 leDevice:(void *)a4 settings:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a5;
  id v47 = v11;
  int v48 = (void *)objc_claimAutoreleasedReturnValue([v11 name]);
  if (!v48) {
    goto LABEL_24;
  }
  btSessionPtr = self->_btSessionPtr;
  if (btSessionPtr)
  {
    if (*((char *)a4 + 127) < 0)
    {
      sub_100024238(&__dst, *((void **)a4 + 13), *((void *)a4 + 14));
    }

    else
    {
      __int128 __dst = *(_OWORD *)((char *)a4 + 104);
      uint64_t v59 = *((void *)a4 + 15);
    }

    if (v59 >= 0) {
      p_dst = &__dst;
    }
    else {
      p_dst = (__int128 *)__dst;
    }
    id v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", p_dst));
    if (SHIBYTE(v59) < 0) {
      operator delete((void *)__dst);
    }
    id v15 = v48;
    id v16 = v14;
    uint64_t v17 = v16;
    if (v15 == v16)
    {
    }

    else
    {
      if (v16)
      {
        unsigned __int8 v18 = [v15 isEqual:v16];

        if ((v18 & 1) != 0) {
          goto LABEL_23;
        }
      }

      else
      {
      }

      id v19 = *(id *)a4;
      if (dword_1008D66A0 <= 30
        && (dword_1008D66A0 != -1 || _LogCategory_Initialize(&dword_1008D66A0, 30LL)))
      {
        uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v19 UUIDString]);
        LogPrintF_safe( &dword_1008D66A0,  "-[CBStackControllerBTStack modifyDevice:leDevice:settings:error:]",  30LL,  "setName: device %@, '%@' -> '%@'",  v20,  v17,  v15);
      }

      uint64_t v21 = sub_100404FE8();
      v57[0] = _NSConcreteStackBlock;
      v57[1] = 3221225472LL;
      v57[2] = sub_10006FCC8;
      v57[3] = &unk_100880D48;
      v57[4] = v15;
      v57[5] = v19;
      v57[6] = btSessionPtr;
      sub_100405384(v21, v57);
      id v15 = v19;
    }

LABEL_23:
    id v11 = v47;
LABEL_24:
    unsigned int v22 = [v10 internalFlags] & 0x400;
    if (dword_1008D66A0 <= 40
      && (dword_1008D66A0 != -1 || _LogCategory_Initialize(&dword_1008D66A0, 40LL)))
    {
      int v23 = (void *)objc_claimAutoreleasedReturnValue([v10 identifier]);
      id v24 = *(id *)a4;
      unsigned int v25 = (void *)objc_claimAutoreleasedReturnValue([v10 controllerInfo]);
      id v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedChar:]( NSNumber,  "numberWithUnsignedChar:",  [v25 fastLEConnectionInfoVersion]));
      int v27 = (void *)objc_claimAutoreleasedReturnValue([v10 controllerInfo]);
      uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue([v27 fastLEConnectionInfoData]);
      unsigned int v29 = (void *)objc_claimAutoreleasedReturnValue([v10 controllerInfo]);
      LogPrintF_safe( &dword_1008D66A0,  "-[CBStackControllerBTStack modifyDevice:leDevice:settings:error:]",  40,  "FastLEConnection:modifyDevice changed:%d cloudID:%@ deviceUUID:%@ inDevice.controllerInfo.fastLEConnectionInfoVe rsion %@ data:%@ allowed:%d",  v22 >> 10,  v23,  v24,  v26,  v28,  [v29 fastLEConnectionAllowed]);

      id v11 = v47;
    }

    id v30 = *(id *)a4;
    if (v22)
    {
      int v31 = (void *)objc_claimAutoreleasedReturnValue([v10 controllerInfo]);
      unsigned __int8 v32 = [v31 fastLEConnectionInfoVersion];

      unsigned int v33 = (void *)objc_claimAutoreleasedReturnValue([v10 controllerInfo]);
      unsigned int v34 = (void *)objc_claimAutoreleasedReturnValue([v33 fastLEConnectionInfoData]);

      uint64_t v35 = sub_100404FE8();
      v52[0] = _NSConcreteStackBlock;
      v52[1] = 3221225472LL;
      v52[2] = sub_10006FEBC;
      v52[3] = &unk_100880100;
      id v53 = v30;
      unsigned __int8 v56 = v32;
      id v36 = v34;
      id v54 = v36;
      id v55 = v10;
      sub_100405384(v35, v52);
    }

    uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue([v10 model]);
    if (v37)
    {
      id v38 = (void *)objc_claimAutoreleasedReturnValue([v10 model]);
      id v39 = [v38 length];

      if (v39)
      {
        int v40 = (void *)objc_claimAutoreleasedReturnValue([v10 model]);
        uint64_t v41 = sub_100404FE8();
        v49[0] = _NSConcreteStackBlock;
        v49[1] = 3221225472LL;
        v49[2] = sub_10006FF90;
        v49[3] = &unk_10087FB90;
        id v50 = v30;
        id v51 = v40;
        id v42 = v40;
        sub_100405384(v41, v49);
      }
    }

    BOOL v43 = 1;
    goto LABEL_34;
  }

  if (a6)
  {
    __int16 v44 = v48;
    uint64_t v46 = CBErrorF(4294960534LL, "No BT session");
    BOOL v43 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue(v46);
    goto LABEL_35;
  }

  BOOL v43 = 0;
LABEL_34:
  __int16 v44 = v48;
LABEL_35:

  return v43;
}

- (void)_modifyDeviceCompleteRequest:(id)a3 error:(id)a4
{
  id v14 = a3;
  id v6 = a4;
  if (dword_1008D66A0 <= 30 && (dword_1008D66A0 != -1 || _LogCategory_Initialize(&dword_1008D66A0, 30LL)))
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v14 device]);
    uint64_t v8 = CUPrintNSError(v6);
    id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    LogPrintF_safe( &dword_1008D66A0,  "-[CBStackControllerBTStack _modifyDeviceCompleteRequest:error:]",  30LL,  "ModifyDevice CnxPri completed: %@, %@",  v7,  v9);
  }

  id v10 = (dispatch_source_s *)objc_claimAutoreleasedReturnValue([v14 timer]);
  id v11 = v14;
  if (v10)
  {
    dispatch_source_cancel(v10);
    [v14 setTimer:0];
    id v11 = v14;
  }

  uint64_t v12 = objc_claimAutoreleasedReturnValue([v11 completionHandler]);
  uint64_t v13 = (void *)v12;
  if (v12)
  {
    (*(void (**)(uint64_t, id))(v12 + 16))(v12, v6);
    [v14 setCompletionHandler:0];
  }

  -[NSMutableSet removeObject:](self->_modifyDeviceRequests, "removeObject:", v14);
}

- (void)performDeviceRequest:(id)a3 device:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = self;
  uint64_t v126 = 0LL;
  uint64_t v127 = &v126;
  uint64_t v128 = 0x3032000000LL;
  uint64_t v129 = sub_100069D3C;
  uint64_t v130 = sub_100069D4C;
  id v131 = 0LL;
  v123[0] = _NSConcreteStackBlock;
  v123[1] = 3221225472LL;
  v123[2] = sub_100070F30;
  v123[3] = &unk_100880CA8;
  uint64_t v125 = &v126;
  id v12 = v10;
  id v124 = v12;
  uint64_t v13 = objc_retainBlock(v123);
  if (qword_1008D60B0 != -1) {
    dispatch_once(&qword_1008D60B0, &stru_1008810C8);
  }
  if (!*((_BYTE *)off_1008D60A8 + 76))
  {
    uint64_t v69 = CBErrorF(4294896144LL, "Bluetooth off");
    uint64_t v70 = objc_claimAutoreleasedReturnValue(v69);
    id v109 = (id)v127[5];
    v127[5] = v70;

    goto LABEL_100;
  }

  id v108 = (id)objc_claimAutoreleasedReturnValue([v9 identifier]);
  if (!v108)
  {
    uint64_t v71 = CBErrorF(4294960588LL, "No device ID");
    uint64_t v72 = objc_claimAutoreleasedReturnValue(v71);
    uint64_t v73 = (void *)v127[5];
    v127[5] = v72;

    goto LABEL_99;
  }

  __int16 v122 = 0;
  int v121 = 0;
  v107 = -[NSUUID initWithUUIDString:](objc_alloc(&OBJC_CLASS___NSUUID), "initWithUUIDString:", v108);
  if (!v107)
  {
    if (!TextToHardwareAddress( [v108 UTF8String], -1, 6, &v121)) {
      goto LABEL_11;
    }
    uint64_t v95 = CBErrorF(4294960569LL, "Device address not found");
    uint64_t v75 = objc_claimAutoreleasedReturnValue(v95);
LABEL_115:
    int v112 = (void *)v127[5];
    v127[5] = v75;

    goto LABEL_98;
  }

  if (qword_1008D5F30 != -1) {
    dispatch_once(&qword_1008D5F30, &stru_100881188);
  }
  uint64_t v14 = sub_1005CC198((uint64_t)off_1008D5F28, v107, 0);
  if (!v14)
  {
    uint64_t v74 = CBErrorF(4294960569LL, "Device UUID not found");
    uint64_t v75 = objc_claimAutoreleasedReturnValue(v74);
    goto LABEL_115;
  }

  LOBYTE(v121) = BYTE5(v14);
  BYTE1(v121) = BYTE4(v14);
  BYTE2(v121) = BYTE3(v14);
  HIBYTE(v121) = BYTE2(v14);
  LOBYTE(v122) = BYTE1(v14);
  HIBYTE(v122) = v14;
LABEL_11:
  if (dword_1008D66A0 <= 20 && (dword_1008D66A0 != -1 || _LogCategory_Initialize(&dword_1008D66A0, 20LL))) {
    LogPrintF_safe( &dword_1008D66A0,  "-[CBStackControllerBTStack performDeviceRequest:device:completionHandler:]",  20LL,  "PerformDeviceRequest start: %@, %@",  v9,  v8);
  }
  v111 = objc_alloc_init(&OBJC_CLASS___CBDeviceResponse);
  unsigned int v15 = [v8 requestFlags];
  unsigned int v16 = v15;
  if ((v15 & 0x28) == 0)
  {
    unsigned int v106 = 0;
    uint64_t v110 = 0LL;
    if ((v15 & 0x40) == 0) {
      goto LABEL_18;
    }
LABEL_21:
    v137[0] = 0LL;
    v137[1] = 0LL;
    if (qword_1008D5F30 != -1) {
      dispatch_once(&qword_1008D5F30, &stru_100881188);
    }
    sub_1005D0B84((uint64_t)off_1008D5F28, (unsigned __int8 *)&v121, (unsigned __int8 *)v137);
    id v19 = sub_100241F94((const unsigned __int8 *)v137);
    id v20 = (id)objc_claimAutoreleasedReturnValue(v19);
    if (!v20)
    {
      __int128 v119 = 0u;
      __int128 v120 = 0u;
      __int128 v117 = 0u;
      __int128 v118 = 0u;
      if (qword_1008D5F20 != -1) {
        dispatch_once(&qword_1008D5F20, &stru_100881248);
      }
      id v105 = v8;
      uint64_t v104 = v13;
      id v21 = sub_100626468(qword_1008D5F18);
      unsigned int v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
      id v23 = [v22 countByEnumeratingWithState:&v117 objects:v136 count:16];
      if (!v23)
      {
LABEL_40:

        id v8 = v105;
        uint64_t v13 = v104;
LABEL_41:
        uint64_t v29 = CBErrorF(4294960588LL, "Device not found");
        uint64_t v30 = objc_claimAutoreleasedReturnValue(v29);
        int v31 = (void *)v127[5];
        v127[5] = v30;

        goto LABEL_97;
      }

      uint64_t v24 = *(void *)v118;
LABEL_28:
      uint64_t v25 = 0LL;
      while (1)
      {
        if (*(void *)v118 != v24) {
          objc_enumerationMutation(v22);
        }
        id v26 = *(void **)(*((void *)&v117 + 1) + 8 * v25);
        uint64_t v132 = 0LL;
        uint64_t v133 = &v132;
        uint64_t v134 = 0x2020000000LL;
        uint64_t v135 = 0LL;
        if (qword_1008D5F30 != -1) {
          dispatch_once(&qword_1008D5F30, &stru_100881188);
        }
        v116[0] = _NSConcreteStackBlock;
        v116[1] = 3221225472LL;
        v116[2] = sub_100071010;
        v116[3] = &unk_10087EB00;
        v116[4] = &v132;
        sub_1005D5604((uint64_t)off_1008D5F28, v26, v116);
        uint64_t v27 = v133[3];
        if (v27)
        {
          LOBYTE(v114) = (unsigned __int16)WORD2(v133[3]) >> 8;
          BYTE1(v114) = BYTE4(v27);
          BYTE2(v114) = BYTE3(v27);
          HIBYTE(v114) = BYTE2(v27);
          LOBYTE(v115) = BYTE1(v27);
          HIBYTE(v115) = v27;
          if (v114 == v121 && v115 == v122) {
            break;
          }
        }

        _Block_object_dispose(&v132, 8);
        if (v23 == (id)++v25)
        {
          id v23 = [v22 countByEnumeratingWithState:&v117 objects:v136 count:16];
          if (v23) {
            goto LABEL_28;
          }
          goto LABEL_40;
        }
      }

      id v20 = v26;
      _Block_object_dispose(&v132, 8);

      id v8 = v105;
      uint64_t v13 = v104;
      if (!v20) {
        goto LABEL_41;
      }
    }

    unsigned __int8 v32 = (void *)objc_claimAutoreleasedReturnValue([v20 UUIDString]);
    -[CBDeviceResponse setIdentifier:](v111, "setIdentifier:", v32);

    uint64_t v18 = v106 | 0x40;
    if ((v16 & 1) == 0) {
      goto LABEL_50;
    }
    goto LABEL_44;
  }

  LOBYTE(v132) = 0;
  sub_100242CA4(&v132);
  uint64_t v17 = (unsigned __int16 *)sub_10012D9F4((uint64_t)&v121);
  uint64_t v110 = (uint64_t)v17;
  if (!v17)
  {
    uint64_t v76 = CBErrorF(4294960543LL, "Device not connected");
    uint64_t v77 = objc_claimAutoreleasedReturnValue(v76);
    uint64_t v78 = (void *)v127[5];
    v127[5] = v77;

    goto LABEL_122;
  }

  -[CBDeviceResponse setConnectionHandle:](v111, "setConnectionHandle:", sub_10012D7D4(v17));
  sub_100242CD8(&v132);
  unsigned int v106 = 8;
  if ((v16 & 0x40) != 0) {
    goto LABEL_21;
  }
LABEL_18:
  uint64_t v18 = v106;
  if ((v16 & 1) == 0) {
    goto LABEL_50;
  }
LABEL_44:
  LOBYTE(v132) = 0;
  uint64_t v33 = sub_1002E6E9C();
  if ((*(unsigned int (**)(uint64_t, int *, uint64_t *))(*(void *)v33 + 304LL))(v33, &v121, &v132))
  {
    LOBYTE(v137[0]) = 0;
    sub_100242CA4(v137);
    uint64_t v40 = sub_10012D9F4((uint64_t)&v121);
    if (v40)
    {
      int v41 = sub_10011EA40((uint64_t)sub_100071024, v40, v34, v35, v36, v37, v38, v39);
      uint64_t v110 = v40;
      if (!v41 || (uint64_t v42 = (v41 + 330000), !(_DWORD)v42))
      {
        sub_100242CD8(v137);
        goto LABEL_50;
      }

      uint64_t v98 = CBErrorF(v42, "Read RSSI start failed");
      uint64_t v97 = objc_claimAutoreleasedReturnValue(v98);
    }

    else
    {
      uint64_t v96 = CBErrorF(4294960543LL, "Device not connected");
      uint64_t v97 = objc_claimAutoreleasedReturnValue(v96);
    }

    v99 = (void *)v127[5];
    v127[5] = v97;

    unsigned __int8 v100 = v137;
LABEL_123:
    sub_100242CD8(v100);
    goto LABEL_97;
  }

  -[CBDeviceResponse setRssi:](v111, "setRssi:", (char)v132);
  uint64_t v18 = v18 | 1;
LABEL_50:
  if ((v16 & 6) != 0)
  {
    LOBYTE(v132) = 0;
    sub_100242CA4(&v132);
    uint64_t v110 = sub_10012D9F4((uint64_t)&v121);
    if (!v110)
    {
LABEL_105:
      uint64_t v79 = CBErrorF(4294960543LL, "Device not connected");
      uint64_t v80 = objc_claimAutoreleasedReturnValue(v79);
LABEL_121:
      int v103 = (void *)v127[5];
      v127[5] = v80;

      goto LABEL_122;
    }

    if ((v16 & 2) != 0)
    {
      int v48 = sub_10011ED50((uint64_t)sub_1000710DC, v110, 0LL, v43, v44, v45, v46, v47);
      if (v48)
      {
        uint64_t v49 = (v48 + 330000);
        if ((_DWORD)v49)
        {
          uint64_t v101 = CBErrorF(v49, "ReadTransmitPowerLevel current failed");
          uint64_t v80 = objc_claimAutoreleasedReturnValue(v101);
          goto LABEL_121;
        }
      }
    }

    if ((v16 & 4) != 0)
    {
      int v50 = sub_10011ED50((uint64_t)sub_100071194, v110, 1LL, v43, v44, v45, v46, v47);
      if (v50)
      {
        uint64_t v51 = (v50 + 330000);
        if ((_DWORD)v51)
        {
          uint64_t v102 = CBErrorF(v51, "ReadTransmitPowerLevel max failed");
          uint64_t v80 = objc_claimAutoreleasedReturnValue(v102);
          goto LABEL_121;
        }
      }
    }

    sub_100242CD8(&v132);
  }

  if ((v16 & 0x20) == 0) {
    goto LABEL_64;
  }
  LODWORD(v133) = 0;
  uint64_t v132 = 0LL;
  LOBYTE(v137[0]) = 0;
  uint64_t v52 = sub_1002E6E9C();
  int v53 = (*(uint64_t (**)(uint64_t, id, uint64_t *, void *, uint64_t))(*(void *)v52 + 1664LL))( v52,  -[CBDeviceResponse connectionHandle](v111, "connectionHandle"),  &v132,  v137,  1LL);
  if (v53)
  {
    uint64_t v54 = (v53 + 310000);
    if ((_DWORD)v54)
    {
      uint64_t v81 = CBErrorF(v54, "ReadPowerCapState failed");
      uint64_t v82 = objc_claimAutoreleasedReturnValue(v81);
LABEL_108:
      uint64_t v84 = (void *)v127[5];
      v127[5] = v82;

      goto LABEL_97;
    }
  }

  if (LOBYTE(v137[0]) != 12)
  {
    uint64_t v83 = CBErrorF(0LL, "ReadPowerCapState bad length: %d", LOBYTE(v137[0]));
    uint64_t v82 = objc_claimAutoreleasedReturnValue(v83);
    goto LABEL_108;
  }

  -[CBDeviceResponse setCurrentPCAP:](v111, "setCurrentPCAP:", SBYTE4(v132));
  -[CBDeviceResponse setCore0TargetPower:](v111, "setCore0TargetPower:", SBYTE2(v133));
  -[CBDeviceResponse setCore1TargetPower:](v111, "setCore1TargetPower:", SBYTE3(v133));
  uint64_t v18 = v18 | 0x20;
LABEL_64:
  if ((v16 & 0x80) != 0)
  {
    if (qword_1008D67D8 != -1) {
      dispatch_once(&qword_1008D67D8, &stru_1008812E8);
    }
    int v55 = sub_100353ED0(qword_1008D67D0, (uint64_t)&v121, 5, 1u);
    if (v55)
    {
      uint64_t v56 = (v55 + 310000);
      if ((_DWORD)v56)
      {
        uint64_t v85 = CBErrorF(v56, "Send LogReport failed");
        uint64_t v86 = objc_claimAutoreleasedReturnValue(v85);
        uint64_t v87 = (void *)v127[5];
        v127[5] = v86;

        goto LABEL_97;
      }
    }

    uint64_t v18 = v18 | 0x80;
  }

  if ((v16 & 0x100) == 0)
  {
LABEL_76:
    if ((v16 & 0x200) == 0) {
      goto LABEL_79;
    }
    LOBYTE(v132) = 0;
    sub_100242CA4(&v132);
    uint64_t v59 = sub_10012D890((uint64_t)&v121);
    if (v59)
    {
      -[CBDeviceResponse setSniffInterval:]( v111,  "setSniffInterval:",  625 * *(unsigned __int16 *)(v59 + 136));
      uint64_t v18 = v18 | 0x200;
      sub_100242CD8(&v132);
LABEL_79:
      if ((v16 & 0x400) == 0) {
        goto LABEL_86;
      }
      LOBYTE(v132) = 0;
      sub_100242CA4(&v132);
      uint64_t v110 = sub_10012D9F4((uint64_t)&v121);
      if (v110)
      {
        uint64_t v60 = sub_1002E6E9C();
        if (((*(uint64_t (**)(uint64_t))(*(void *)v60 + 2480LL))(v60) & 1) != 0)
        {
          else {
            uint64_t v61 = *(unsigned __int8 *)(v110 + 289);
          }
          -[CBDeviceResponse setBtBand:](v111, "setBtBand:", v61);
          uint64_t v18 = v18 | 0x400;
          sub_100242CD8(&v132);
LABEL_86:
          if ((v16 & ~(_DWORD)v18) != 0)
          {
            uint64_t v62 = objc_alloc_init(&OBJC_CLASS___CBStackPerformDeviceRequest);
            -[CBStackPerformDeviceRequest setDevice:](v62, "setDevice:", v9);
            -[CBStackPerformDeviceRequest setCompletedFlags:](v62, "setCompletedFlags:", v18);
            -[CBStackPerformDeviceRequest setCompletionHandler:](v62, "setCompletionHandler:", v12);
            -[CBStackPerformDeviceRequest setConnectionHandle:](v62, "setConnectionHandle:", v110);
            -[CBStackPerformDeviceRequest setRequest:](v62, "setRequest:", v8);
            -[CBStackPerformDeviceRequest setResponse:](v62, "setResponse:", v111);
            uint64_t v63 = dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_timer,  0LL,  0LL,  (dispatch_queue_t)v11->_dispatchQueue);
            -[CBStackPerformDeviceRequest setTimer:](v62, "setTimer:", v63);
            handler[0] = _NSConcreteStackBlock;
            handler[1] = 3221225472LL;
            handler[2] = sub_10007124C;
            handler[3] = &unk_100880CD0;
            handler[4] = v63;
            void handler[5] = v62;
            handler[6] = v11;
            dispatch_source_set_event_handler(v63, handler);
            [v8 timeoutSeconds];
            if (v64 <= 0.0) {
              double v64 = 10.0;
            }
            CUDispatchTimerSet(v63, v64, -1.0, 1.0);
            dispatch_activate(v63);
            performDeviceRequests = v11->_performDeviceRequests;
            if (!performDeviceRequests)
            {
              __int16 v66 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
              unsigned int v68 = v11->_performDeviceRequests;
              p_performDeviceRequests = &v11->_performDeviceRequests;
              *p_performDeviceRequests = v66;

              performDeviceRequests = *p_performDeviceRequests;
            }

            -[NSMutableSet addObject:](performDeviceRequests, "addObject:", v62);
          }

          else
          {
            if (dword_1008D66A0 <= 20
              && (dword_1008D66A0 != -1 || _LogCategory_Initialize(&dword_1008D66A0, 20LL)))
            {
              LogPrintF_safe( &dword_1008D66A0,  "-[CBStackControllerBTStack performDeviceRequest:device:completionHandler:]",  20LL,  "PerformDeviceRequest completed: %@, %@, %@",  v9,  v8,  v111);
            }

            (*((void (**)(id, CBDeviceResponse *, void))v12 + 2))(v12, v111, 0LL);
          }

          goto LABEL_97;
        }

        uint64_t v94 = CBErrorF(4294960561LL, "HRB is not supported");
        uint64_t v80 = objc_claimAutoreleasedReturnValue(v94);
        goto LABEL_121;
      }

      goto LABEL_105;
    }

    uint64_t v91 = CBErrorF(4294960543LL, "Device not connected");
    uint64_t v92 = objc_claimAutoreleasedReturnValue(v91);
    uint64_t v93 = (void *)v127[5];
    v127[5] = v92;

LABEL_122:
    unsigned __int8 v100 = &v132;
    goto LABEL_123;
  }

  if (qword_1008D67D8 != -1) {
    dispatch_once(&qword_1008D67D8, &stru_1008812E8);
  }
  int v57 = sub_100353ED0(qword_1008D67D0, (uint64_t)&v121, 6, 1u);
  if (!v57 || (uint64_t v58 = (v57 + 310000), !(_DWORD)v58))
  {
    uint64_t v18 = v18 | 0x100;
    goto LABEL_76;
  }

  uint64_t v88 = CBErrorF(v58, "Send LogClear failed");
  uint64_t v89 = objc_claimAutoreleasedReturnValue(v88);
  uint64_t v90 = (void *)v127[5];
  v127[5] = v89;

LABEL_97:
LABEL_98:

LABEL_99:
LABEL_100:
  ((void (*)(void *))v13[2])(v13);

  _Block_object_dispose(&v126, 8);
}

- (void)_completePerformDeviceRequest:(id)a3 error:(id)a4
{
  id v15 = a3;
  id v6 = a4;
  if (dword_1008D66A0 <= 20 && (dword_1008D66A0 != -1 || _LogCategory_Initialize(&dword_1008D66A0, 20LL)))
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v15 device]);
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v15 request]);
    uint64_t v9 = CUPrintNSError(v6);
    id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    LogPrintF_safe( &dword_1008D66A0,  "-[CBStackControllerBTStack _completePerformDeviceRequest:error:]",  20LL,  "PerformDeviceRequest completed: %@, %@, %@",  v7,  v8,  v10);
  }

  id v11 = (dispatch_source_s *)objc_claimAutoreleasedReturnValue([v15 timer]);
  id v12 = v15;
  if (v11)
  {
    dispatch_source_cancel(v11);
    [v15 setTimer:0];
    id v12 = v15;
  }

  uint64_t v13 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue([v12 completionHandler]);
  if (v13)
  {
    if (v6) {
      uint64_t v14 = 0LL;
    }
    else {
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v15 response]);
    }
    ((void (**)(void, void *, id))v13)[2](v13, v14, v6);
    if (!v6) {

    }
    [v15 setCompletionHandler:0];
  }

  -[NSMutableSet removeObject:](self->_performDeviceRequests, "removeObject:", v15);
}

- (void)_readRSSIWithConnectionHandle:(_OI_HCI_CONNECTION *)a3 status:(int)a4 rssi:(char)a5
{
  uint64_t v20 = a5;
  if (dword_1008D66A0 <= 20 && (dword_1008D66A0 != -1 || _LogCategory_Initialize(&dword_1008D66A0, 20LL))) {
    LogPrintF_safe( &dword_1008D66A0,  "-[CBStackControllerBTStack _readRSSIWithConnectionHandle:status:rssi:]",  20LL,  "ReadRSSI completed: Status %d, RSSI %d, Requests %d",  a4,  v20,  -[NSMutableSet count](self->_performDeviceRequests, "count"));
  }
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableSet allObjects](self->_performDeviceRequests, "allObjects"));
  id v8 = [v7 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v23;
    int v10 = a4 + 330000;
    if (!a4) {
      int v10 = -6700;
    }
    unsigned int v19 = v10;
    if ((_DWORD)v20) {
      BOOL v11 = a4 != 0;
    }
    else {
      BOOL v11 = 1;
    }
    do
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v23 != v9) {
          objc_enumerationMutation(v7);
        }
        uint64_t v13 = *(void **)(*((void *)&v22 + 1) + 8LL * (void)i);
        if ([v13 connectionHandle] == a3)
        {
          uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v13 request]);
          unsigned int v15 = [v14 requestFlags];

          if ((v15 & 1) != 0)
          {
            if (v11)
            {
              uint64_t v16 = CBErrorF(v19, "ReadRSSI failed");
              uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
              -[CBStackControllerBTStack _completePerformDeviceRequest:error:]( self,  "_completePerformDeviceRequest:error:",  v13,  v17);
            }

            else
            {
              uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v13 response]);
              [v17 setRssi:v20];
              uint64_t v18 = [v13 completedFlags] | 1;
              [v13 setCompletedFlags:v18];
              if ((v15 & ~(_DWORD)v18) == 0) {
                -[CBStackControllerBTStack _completePerformDeviceRequest:error:]( self,  "_completePerformDeviceRequest:error:",  v13,  0LL);
              }
            }
          }
        }
      }

      id v8 = [v7 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }

    while (v8);
  }
}

- (void)_readTxPowerWithFlags:(unsigned int)a3 status:(int)a4 connectionHandle:(_OI_HCI_CONNECTION *)a5 txPowerLevel:(char)a6
{
  uint64_t v21 = a6;
  uint64_t v7 = *(void *)&a4;
  if (dword_1008D66A0 <= 20 && (dword_1008D66A0 != -1 || _LogCategory_Initialize(&dword_1008D66A0, 20LL)))
  {
    uint64_t v8 = CUPrintFlags32(a3, &unk_1006BB4B6);
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    LogPrintF_safe( &dword_1008D66A0,  "-[CBStackControllerBTStack _readTxPowerWithFlags:status:connectionHandle:txPowerLevel:]",  20LL,  "ReadTxPower completed: Flags %@, Status %d, TxPower %d, Requests %d",  v9,  v7,  (int)v21,  -[NSMutableSet count](self->_performDeviceRequests, "count"));
  }

  __int128 v26 = 0u;
  __int128 v27 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  int v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableSet allObjects](self->_performDeviceRequests, "allObjects"));
  id v11 = [v10 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v25;
    do
    {
      for (i = 0LL; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v25 != v12) {
          objc_enumerationMutation(v10);
        }
        uint64_t v14 = *(void **)(*((void *)&v24 + 1) + 8LL * (void)i);
        if ([v14 connectionHandle] == a5)
        {
          unsigned int v15 = (void *)objc_claimAutoreleasedReturnValue([v14 request]);
          unsigned int v16 = [v15 requestFlags];

          if ((v16 & a3) != 0)
          {
            if ((_DWORD)v7)
            {
              uint64_t v17 = CBErrorF((v7 + 330000), "ReadTransmitPowerLevel failed");
              uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
              -[CBStackControllerBTStack _completePerformDeviceRequest:error:]( self,  "_completePerformDeviceRequest:error:",  v14,  v18);
            }

            else
            {
              unsigned int v19 = (void *)objc_claimAutoreleasedReturnValue([v14 response]);
              uint64_t v18 = v19;
              if ((a3 & 2) != 0) {
                [v19 setTxPower:v21];
              }
              if ((a3 & 4) != 0) {
                [v18 setTxPowerMax:v21];
              }
              uint64_t v20 = [v14 completedFlags] | a3;
              [v14 setCompletedFlags:v20];
              if ((v16 & ~(_DWORD)v20) == 0) {
                -[CBStackControllerBTStack _completePerformDeviceRequest:error:]( self,  "_completePerformDeviceRequest:error:",  v14,  0LL);
              }
            }
          }
        }
      }

      id v11 = [v10 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }

    while (v11);
  }
}

- (BOOL)sendRelayMessageType:(unsigned __int8)a3 messageData:(id)a4 conduitDevice:(id)a5 destinationDevice:(id)a6 error:(id *)a7
{
  int v10 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  unsigned int v15 = (void *)objc_claimAutoreleasedReturnValue([v13 identifier]);
  unsigned int v16 = -[CBStackControllerBTStack _btDeviceWithID:error:](self, "_btDeviceWithID:error:", v15, a7);

  if (!v16)
  {
    BOOL v23 = 0;
    goto LABEL_10;
  }

  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v14 identifier]);
  uint64_t v18 = v17;
  if (v17)
  {
    __int16 v32 = 0;
    int v31 = 0;
    id v19 = v17;
    if (TextToHardwareAddress([v19 UTF8String], -1, 6, &v31))
    {
      if (!a7) {
        goto LABEL_21;
      }
      uint64_t v28 = CBErrorF(4294960591LL, "Bad destination address: '%@'", v19);
      __int128 v27 = (void *)objc_claimAutoreleasedReturnValue(v28);
    }

    else
    {
      id v20 = [v12 length];
      unsigned __int16 v21 = (unsigned __int16)v20;
      if ((unint64_t)v20 < 0x3E7)
      {
        if (qword_1008D60E0 != -1) {
          dispatch_once(&qword_1008D60E0, &stru_1008811C8);
        }
        int v22 = sub_1002182E4( (uint64_t)off_1008D60D8, (uint64_t)v16, (uint64_t)&v31, v10, v21, [v12 bytes]);
        BOOL v23 = 1;
        if (!v22) {
          goto LABEL_9;
        }
        uint64_t v24 = (v22 + 310000);
        if (!(_DWORD)v24) {
          goto LABEL_9;
        }
        if (a7)
        {
          uint64_t v30 = CBErrorF(v24, "AACP sendRelayMsg failed");
          __int128 v27 = (void *)objc_claimAutoreleasedReturnValue(v30);
          goto LABEL_20;
        }

- (BOOL)sendSmartRoutingInformation:(id)a3 device:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  int v10 = (void *)objc_claimAutoreleasedReturnValue([v9 identifier]);
  if (!v10)
  {
    if (!a5) {
      goto LABEL_20;
    }
    uint64_t v17 = CBErrorF(4294960588LL, "No device ID");
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
LABEL_19:
    LOBYTE(v11) = 0;
    *a5 = v18;
    goto LABEL_12;
  }

  id v11 = -[CBStackControllerBTStack _btDeviceWithID:error:](self, "_btDeviceWithID:error:", v10, 0LL);
  if (!v11) {
    goto LABEL_12;
  }
  id v12 = [v8 length];
  id v13 = v12;
  if (v12 >= 0x3E7)
  {
    if (!a5) {
      goto LABEL_20;
    }
    uint64_t v19 = CBErrorF(4294960553LL, "AACP message too big: %u vs %u", (_DWORD)v12, 998);
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(v19);
    goto LABEL_19;
  }

  if (dword_1008D66A0 <= 30 && (dword_1008D66A0 != -1 || _LogCategory_Initialize(&dword_1008D66A0, 30LL))) {
    LogPrintF_safe( &dword_1008D66A0,  "-[CBStackControllerBTStack sendSmartRoutingInformation:device:error:]",  30LL,  "SendSmartRoutingInformation: device %@ with length %hu",  v10,  v13);
  }
  if (qword_1008D60E0 != -1) {
    dispatch_once(&qword_1008D60E0, &stru_1008811C8);
  }
  int v14 = sub_1002221D8( (uint64_t)off_1008D60D8, (uint64_t)v11, [v8 bytes], (unsigned __int16)v13);
  LOBYTE(v11) = 1;
  if (v14)
  {
    uint64_t v15 = (v14 + 310000);
    if ((_DWORD)v15)
    {
      if (a5)
      {
        uint64_t v20 = CBErrorF(v15, "SendSmartRoutingInformation failed");
        uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(v20);
        goto LABEL_19;
      }

- (BOOL)sendConversationDetectMessage:(id)a3 device:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  int v10 = (void *)objc_claimAutoreleasedReturnValue([v9 identifier]);
  if (!v10)
  {
    if (!a5) {
      goto LABEL_20;
    }
    uint64_t v17 = CBErrorF(4294960588LL, "No device ID");
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
LABEL_19:
    LOBYTE(v11) = 0;
    *a5 = v18;
    goto LABEL_12;
  }

  id v11 = -[CBStackControllerBTStack _btDeviceWithID:error:](self, "_btDeviceWithID:error:", v10, 0LL);
  if (!v11) {
    goto LABEL_12;
  }
  id v12 = [v8 length];
  id v13 = v12;
  if (v12 >= 0x3E7)
  {
    if (!a5) {
      goto LABEL_20;
    }
    uint64_t v19 = CBErrorF(4294960553LL, "AACP message too big: %u vs %u", (_DWORD)v12, 998);
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(v19);
    goto LABEL_19;
  }

  if (dword_1008D66A0 <= 30 && (dword_1008D66A0 != -1 || _LogCategory_Initialize(&dword_1008D66A0, 30LL))) {
    LogPrintF_safe( &dword_1008D66A0,  "-[CBStackControllerBTStack sendConversationDetectMessage:device:error:]",  30LL,  "SendConversationDetectMessage: device %@ with length %hu",  v10,  v13);
  }
  if (qword_1008D60E0 != -1) {
    dispatch_once(&qword_1008D60E0, &stru_1008811C8);
  }
  int v14 = sub_1002223BC( (uint64_t)off_1008D60D8, (uint64_t)v11, [v8 bytes], (unsigned __int16)v13);
  LOBYTE(v11) = 1;
  if (v14)
  {
    uint64_t v15 = (v14 + 310000);
    if ((_DWORD)v15)
    {
      if (a5)
      {
        uint64_t v20 = CBErrorF(v15, "SendConversationDetectMessage failed");
        uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(v20);
        goto LABEL_19;
      }

- (BOOL)sendAudioAccessoryConfig:(id)a3 device:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  int v10 = (void *)objc_claimAutoreleasedReturnValue([v9 identifier]);
  if (v10)
  {
    id v11 = -[CBStackControllerBTStack _btDeviceWithID:error:](self, "_btDeviceWithID:error:", v10, 0LL);
    if (v11)
    {
      id v31 = 0LL;
      id v12 = -[AudioAccessoryDeviceConfig initWithXPCObject:error:]( objc_alloc(&OBJC_CLASS___AudioAccessoryDeviceConfig),  "initWithXPCObject:error:",  v8,  &v31);
      id v13 = v31;
      if (v13)
      {
        if (a5)
        {
          uint64_t v28 = CBErrorF(4294960591LL, "failed to receive accessory data");
          uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
LABEL_94:
          LOBYTE(v11) = 0;
          *a5 = v29;
LABEL_86:

          goto LABEL_87;
        }

- (BOOL)sendAudioAccessoryEventMessage:(id)a3 eventType:(unsigned __int8)a4 device:(id)a5 error:(id *)a6
{
  unsigned int v8 = a4;
  id v10 = a3;
  id v11 = a5;
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 identifier]);
  if (!v12)
  {
    if (a6)
    {
      uint64_t v23 = CBErrorF(4294960588LL, "No device ID");
      int v20 = (void *)objc_claimAutoreleasedReturnValue(v23);
      goto LABEL_38;
    }

- (BOOL)updateControllerInfo:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = v6;
  if (v6)
  {
    self->_unint64_t stackControllerInfoCloudSyncStatus = [v6 cloudSyncStatus];
  }

  else if (a4)
  {
    uint64_t v9 = CBErrorF(4294960588LL, "No Controller Info");
    *a4 = (id)objc_claimAutoreleasedReturnValue(v9);
  }

  return v7 != 0LL;
}

- (BOOL)isDeviceConnected:(id)a3 error:(id *)a4
{
  id v6 = (void *)objc_claimAutoreleasedReturnValue([a3 identifier]);
  if (v6)
  {
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[CBStackControllerBTStack _btUUIDWithID:error:](self, "_btUUIDWithID:error:", v6, 0LL));
    if (qword_1008D5F10 != -1) {
      dispatch_once(&qword_1008D5F10, &stru_100881208);
    }
    unsigned int v8 = off_1008D5F08;
    sub_100241F90(v12, v7);
    BOOL v9 = sub_100595874((uint64_t)v8, v12);
  }

  else if (a4)
  {
    uint64_t v11 = CBErrorF(4294960588LL, "No device identifier");
    BOOL v9 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue(v11);
  }

  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (void)_pairingAgentTearDown
{
  pairingAgentHandle = self->_pairingAgentHandle;
  self->_pairingAgentHandle = 0LL;
  BOOL pairingAgentStarted = self->_pairingAgentStarted;
  self->_BOOL pairingAgentStarted = 0;
  pairingClients = self->_pairingClients;
  self->_pairingClients = 0LL;

  if (pairingAgentHandle)
  {
    if (qword_1008D67A8 != -1) {
      dispatch_once(&qword_1008D67A8, &stru_100881228);
    }
    uint64_t v5 = sub_1005297C0(off_1008D67A0, (uint64_t)pairingAgentHandle);
    if (v5)
    {
      if (pairingAgentStarted)
      {
        int v6 = sub_100525590(v5, (unint64_t)pairingAgentHandle);
        if (!v6 || (uint64_t v7 = (v6 + 310000), v6 == -310000))
        {
          if (dword_1008D66A0 <= 30
            && (dword_1008D66A0 != -1 || _LogCategory_Initialize(&dword_1008D66A0, 30LL)))
          {
            LogPrintF_safe( &dword_1008D66A0,  "-[CBStackControllerBTStack _pairingAgentTearDown]",  30LL,  "Pairing agent stopped");
          }
        }

        else if (dword_1008D66A0 <= 90 {
               && (dword_1008D66A0 != -1 || _LogCategory_Initialize(&dword_1008D66A0, 90LL)))
        }
        {
          uint64_t v8 = CUPrintErrorCode(v7);
          BOOL v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
          LogPrintF_safe( &dword_1008D66A0,  "-[CBStackControllerBTStack _pairingAgentTearDown]",  90LL,  "### Stop pairing agent failed: %@",  v9);
        }
      }

      if (qword_1008D67A8 != -1) {
        dispatch_once(&qword_1008D67A8, &stru_100881228);
      }
      sub_1005294E8(off_1008D67A0, (unint64_t)pairingAgentHandle);
    }

    else if (dword_1008D66A0 <= 90 {
           && (dword_1008D66A0 != -1 || _LogCategory_Initialize(&dword_1008D66A0, 90LL)))
    }
    {
      LogPrintF_safe( &dword_1008D66A0,  "-[CBStackControllerBTStack _pairingAgentTearDown]",  90LL,  "### Get pairing agent to stop failed");
    }
  }

- (BOOL)addPairingClient:(id)a3 error:(id *)a4
{
  id v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  pairingClients = self->_pairingClients;
  if (!pairingClients)
  {
    uint64_t v8 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    BOOL v9 = self->_pairingClients;
    self->_pairingClients = (CBPairable *)v8;

    pairingClients = self->_pairingClients;
  }

  -[CBPairable addObject:](pairingClients, "addObject:", v6);
  if (dword_1008D66A0 <= 30 && (dword_1008D66A0 != -1 || _LogCategory_Initialize(&dword_1008D66A0, 30LL))) {
    LogPrintF_safe( &dword_1008D66A0,  "-[CBStackControllerBTStack addPairingClient:error:]",  30LL,  "AddPairingClient: %d total",  -[CBPairable count](self->_pairingClients, "count"));
  }
  if (!self->_pairingAgentHandle)
  {
    uint64_t v29 = 0LL;
    uint64_t v30 = &v29;
    uint64_t v31 = 0x3032000000LL;
    __int16 v32 = sub_100069D3C;
    uint64_t v33 = sub_100069D4C;
    id v34 = 0LL;
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472LL;
    v28[2] = sub_1000732D8;
    v28[3] = &unk_100880D70;
    v28[4] = &v29;
    v28[5] = a4;
    uint64_t v11 = objc_retainBlock(v28);
    if (self->_btSessionHandle)
    {
      uint64_t v27 = 0LL;
      if (qword_1008D67A8 != -1) {
        dispatch_once(&qword_1008D67A8, &stru_100881228);
      }
      int v12 = sub_1005291C0( off_1008D67A0,  (unint64_t)self->_btSessionHandle,  &v27,  (unint64_t *)&self->_pairingAgentHandle);
      if (v12 && (uint64_t v13 = (v12 + 310000), (_DWORD)v13))
      {
        uint64_t v20 = CBErrorF(v13, "Create pairing agent failed");
        uint64_t v19 = objc_claimAutoreleasedReturnValue(v20);
      }

      else
      {
        if (v27)
        {
          v26[0] = *(_OWORD *)off_100880D90;
          v26[1] = *(_OWORD *)off_100880DA0;
          v26[2] = *(_OWORD *)off_100880DB0;
          sub_100525724(v27, (unint64_t *)self->_pairingAgentHandle, v26, (uint64_t)self);
          int v14 = sub_1005259BC(v27, (unint64_t)self->_pairingAgentHandle);
          BOOL v16 = v14 == 0;
          uint64_t v15 = (v14 + 310000);
          BOOL v16 = v16 || (_DWORD)v15 == 0;
          BOOL v10 = v16;
          if (v16)
          {
            self->_BOOL pairingAgentStarted = 1;
            if (dword_1008D66A0 <= 30
              && (dword_1008D66A0 != -1 || _LogCategory_Initialize(&dword_1008D66A0, 30LL)))
            {
              LogPrintF_safe( &dword_1008D66A0,  "-[CBStackControllerBTStack addPairingClient:error:]",  30LL,  "Pairing agent started");
            }
          }

          else
          {
            uint64_t v23 = CBErrorF(v15, "Start pairing agent failed");
            uint64_t v24 = objc_claimAutoreleasedReturnValue(v23);
            uint64_t v25 = (void *)v30[5];
            v30[5] = v24;
          }

          goto LABEL_27;
        }

        uint64_t v21 = CBErrorF(4294960534LL, "Create pairing agent null");
        uint64_t v19 = objc_claimAutoreleasedReturnValue(v21);
      }
    }

    else
    {
      uint64_t v18 = CBErrorF(4294960534LL, "No BTSession");
      uint64_t v19 = objc_claimAutoreleasedReturnValue(v18);
    }

    uint64_t v22 = (void *)v30[5];
    v30[5] = v19;

    BOOL v10 = 0;
LABEL_27:
    ((void (*)(void *))v11[2])(v11);

    _Block_object_dispose(&v29, 8);
    goto LABEL_28;
  }

  BOOL v10 = 1;
LABEL_28:

  return v10;
}

- (void)removePairingClient:(id)a3
{
  id v5 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  -[CBPairable removeObject:](self->_pairingClients, "removeObject:", v5);
  id v4 = -[CBPairable count](self->_pairingClients, "count");
  if (dword_1008D66A0 <= 30 && (dword_1008D66A0 != -1 || _LogCategory_Initialize(&dword_1008D66A0, 30LL))) {
    LogPrintF_safe( &dword_1008D66A0,  "-[CBStackControllerBTStack removePairingClient:]",  30LL,  "RemovePairingClient: %d total",  (_DWORD)v4);
  }
  if (!v4) {
    -[CBStackControllerBTStack _pairingAgentTearDown](self, "_pairingAgentTearDown");
  }
}

- (BOOL)pairingContinueWithPairingInfo:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 device]);
  uint64_t v8 = v7;
  if (v7)
  {
    BOOL v9 = (void *)objc_claimAutoreleasedReturnValue([v7 identifier]);
    BOOL v10 = -[CBStackControllerBTStack _btDeviceWithID:error:](self, "_btDeviceWithID:error:", v9, a4);
    if (!v10)
    {
LABEL_21:

      goto LABEL_22;
    }

    if (self->_pairingAgentHandle)
    {
      if (qword_1008D67A8 != -1) {
        dispatch_once(&qword_1008D67A8, &stru_100881228);
      }
      uint64_t v11 = sub_1005297C0(off_1008D67A0, (uint64_t)self->_pairingAgentHandle);
      if (v11)
      {
        int v12 = (void *)objc_claimAutoreleasedReturnValue([v6 error]);
        if (!v12)
        {
          id v20 = objc_claimAutoreleasedReturnValue([v6 pin]);
          uint64_t v21 = (char *)[v20 UTF8String];

          if (v21)
          {
            sub_100532E28((char *)&v30, v21);
            int v22 = sub_100526EC0(v11, (unint64_t)v10, &v30);
            nullsub_63(&v30, v23);
            LOBYTE(v10) = 1;
            if (!v22 || v22 == -310000) {
              goto LABEL_20;
            }
            if (a4)
            {
              uint64_t v29 = CBErrorF((v22 + 310000), "Set pairing pincode failed");
              BOOL v16 = (void *)objc_claimAutoreleasedReturnValue(v29);
              goto LABEL_34;
            }

- (void)_pairingCompletedWithBTDevice:(void *)a3 result:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  id v6 = self->_pairingClients;
  id v7 = -[CBPairable countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v28,  v32,  16LL);
  if (v7)
  {
    uint64_t v8 = 0LL;
    uint64_t v9 = *(void *)v29;
    while (2)
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v29 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v28 + 1) + 8LL * (void)i);
        int v12 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue([v11 pairingCompletedHandler]);
        if (v12)
        {
          int v13 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v11 dispatchQueue]);
          dispatch_assert_queue_V2(v13);

          if (!v8)
          {
            uint64_t v14 = objc_alloc(&OBJC_CLASS___CBDevice);
            id v27 = 0LL;
            uint64_t v8 = -[CBDevice initWithBTStackDevice:error:](v14, "initWithBTStackDevice:error:", a3, &v27);
            id v15 = v27;
            BOOL v16 = v15;
            if (!v8)
            {
              if (dword_1008D66A0 <= 90
                && (dword_1008D66A0 != -1 || _LogCategory_Initialize(&dword_1008D66A0, 90LL)))
              {
                sub_1003CF00C((uint64_t)a3, __p);
                int v19 = v26;
                id v20 = (void **)__p[0];
                uint64_t v21 = CUPrintNSError(v16);
                uint64_t v22 = objc_claimAutoreleasedReturnValue(v21);
                uint64_t v23 = (void *)v22;
                uint64_t v24 = __p;
                if (v19 < 0) {
                  uint64_t v24 = v20;
                }
                LogPrintF_safe( &dword_1008D66A0,  "-[CBStackControllerBTStack _pairingCompletedWithBTDevice:result:]",  90LL,  "### Pairing completed failed init device: %s, %@",  v24,  v22);

                if (v26 < 0) {
                  operator delete(__p[0]);
                }
              }

              goto LABEL_25;
            }
          }

          if ((_DWORD)v4)
          {
            uint64_t v17 = CBErrorF(v4, "Pairing error");
            int v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
          }

          else
          {
            int v18 = 0LL;
          }

          ((void (**)(void, CBDevice *, void *))v12)[2](v12, v8, v18);
        }
      }

      id v7 = -[CBPairable countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v28,  v32,  16LL);
      if (v7) {
        continue;
      }
      break;
    }
  }

  else
  {
LABEL_25:
    uint64_t v8 = 0LL;
  }
}

- (void)_pairingPromptWithBTDevice:(void *)a3 pairingType:(int64_t)a4 pinString:(id)a5 flags:(unsigned int)a6
{
  uint64_t v6 = *(void *)&a6;
  id v9 = a5;
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  __int128 v35 = 0u;
  id obj = self->_pairingClients;
  id v10 = -[CBPairable countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v32,  v36,  16LL);
  if (v10)
  {
    uint64_t v11 = 0LL;
    uint64_t v12 = *(void *)v33;
    while (2)
    {
      for (i = 0LL; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v33 != v12) {
          objc_enumerationMutation(obj);
        }
        uint64_t v14 = *(void **)(*((void *)&v32 + 1) + 8LL * (void)i);
        id v15 = (void (**)(void, void))objc_claimAutoreleasedReturnValue([v14 pairingPromptHandler]);
        if (v15)
        {
          BOOL v16 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v14 dispatchQueue]);
          dispatch_assert_queue_V2(v16);

          if (!v11)
          {
            uint64_t v17 = objc_alloc(&OBJC_CLASS___CBDevice);
            id v31 = 0LL;
            uint64_t v11 = -[CBDevice initWithBTStackDevice:error:](v17, "initWithBTStackDevice:error:", a3, &v31);
            id v18 = v31;
            int v19 = v18;
            if (!v11)
            {
              if (dword_1008D66A0 <= 90
                && (dword_1008D66A0 != -1 || _LogCategory_Initialize(&dword_1008D66A0, 90LL)))
              {
                sub_1003CF00C((uint64_t)a3, __p);
                int v21 = v30;
                uint64_t v22 = (void **)__p[0];
                uint64_t v23 = CUPrintNSError(v19);
                uint64_t v24 = objc_claimAutoreleasedReturnValue(v23);
                uint64_t v25 = (void *)v24;
                char v26 = __p;
                if (v21 < 0) {
                  char v26 = v22;
                }
                LogPrintF_safe( &dword_1008D66A0,  "-[CBStackControllerBTStack _pairingPromptWithBTDevice:pairingType:pinString:flags:]",  90LL,  "### Pairing prompt failed init device: %s, %@",  v26,  v24);

                if (v30 < 0) {
                  operator delete(__p[0]);
                }
              }

              goto LABEL_22;
            }
          }

          id v20 = objc_alloc_init(&OBJC_CLASS___CBPairingInfo);
          [v20 setDevice:v11];
          [v20 setFlags:v6];
          [v20 setPairingType:a4];
          [v20 setPin:v9];
          ((void (**)(void, id))v15)[2](v15, v20);
        }
      }

      id v10 = -[CBPairable countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v32,  v36,  16LL);
      if (v10) {
        continue;
      }
      break;
    }
  }

  else
  {
LABEL_22:
    uint64_t v11 = 0LL;
  }
}

- (id)controllerDataChangedHandler
{
  return self->_controllerDataChangedHandler;
}

- (void)setControllerDataChangedHandler:(id)a3
{
}

- (id)discoverableStateChangedHandler
{
  return self->_discoverableStateChangedHandler;
}

- (void)setDiscoverableStateChangedHandler:(id)a3
{
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
}

- (id)inquiryStateChangedHandler
{
  return self->_inquiryStateChangedHandler;
}

- (void)setInquiryStateChangedHandler:(id)a3
{
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void)setInvalidationHandler:(id)a3
{
}

- (id)powerChangedHandler
{
  return self->_powerChangedHandler;
}

- (void)setPowerChangedHandler:(id)a3
{
}

- (id)relayMessageHandler
{
  return self->_relayMessageHandler;
}

- (void)setRelayMessageHandler:(id)a3
{
}

- (NSData)fastLEConnectionInfoData
{
  return self->_fastLEConnectionInfoData;
}

- (void)setFastLEConnectionInfoData:(id)a3
{
}

- (unsigned)fastLEConnectionInfoVersion
{
  return self->_fastLEConnectionInfoVersion;
}

- (void)setFastLEConnectionInfoVersion:(unsigned __int8)a3
{
  self->_fastLEConnectionInfoVersion = a3;
}

- (void).cxx_destruct
{
}

@end
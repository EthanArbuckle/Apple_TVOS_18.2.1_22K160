@interface AAServicesXPCConnection
- (AAAudioSessionControl)audioSessionControl;
- (AADeviceManager)deviceManager;
- (AAServicesDaemon)daemon;
- (BOOL)_entitledAndReturnError:(id *)a3;
- (BOOL)_shouldSendXPCMessage;
- (BOOL)entitled;
- (NSMutableDictionary)devices;
- (NSXPCConnection)xpcCnx;
- (OS_dispatch_queue)dispatchQueue;
- (void)activeHRMSessionChanged:(id)a3 hrmState:(BOOL)a4 completion:(id)a5;
- (void)audioRoutingControlActivate:(id)a3 completion:(id)a4;
- (void)audioSessionControlActivate:(id)a3 completion:(id)a4;
- (void)audioSessionControlUpdate:(id)a3;
- (void)deviceManagerActivate:(id)a3 completion:(id)a4;
- (void)deviceManagerHeadGestureDetected:(id)a3;
- (void)deviceManagerReportDeviceFound:(id)a3;
- (void)deviceManagerReportDeviceLost:(id)a3;
- (void)deviceManagerSendDeviceConfig:(id)a3 identifier:(id)a4 completion:(id)a5;
- (void)deviceManagerUpdate:(id)a3 completion:(id)a4;
- (void)setAudioSessionControl:(id)a3;
- (void)setDaemon:(id)a3;
- (void)setDeviceManager:(id)a3;
- (void)setDevices:(id)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setEntitled:(BOOL)a3;
- (void)setHijackBlockingMode:(id)a3 mode:(BOOL)a4 completion:(id)a5;
- (void)setMuteAction:(int)a3 auditToken:(id *)a4 bundleIdentifier:(id)a5;
- (void)setXpcCnx:(id)a3;
- (void)xpcConnectionInvalidated;
@end

@implementation AAServicesXPCConnection

- (BOOL)_entitledAndReturnError:(id *)a3
{
  if (self->_entitled) {
    return 1;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue( -[NSXPCConnection cuValueForEntitlementNoCache:]( self->_xpcCnx,  "cuValueForEntitlementNoCache:",  @"com.apple.AudioAccessoryServices"));
  unsigned int v7 = [v6 isEqual:&__kCFBooleanTrue];

  if (v7)
  {
    BOOL result = 1;
    self->_entitled = 1;
  }

  else
  {
    if (dword_100234330 <= 90
      && (dword_100234330 != -1 || _LogCategory_Initialize(&dword_100234330, 90LL)))
    {
      LogPrintF( &dword_100234330,  "-[AAServicesXPCConnection _entitledAndReturnError:]",  90LL,  "### Missing entitlement: %#{pid}, '%@'",  -[NSXPCConnection processIdentifier](self->_xpcCnx, "processIdentifier"),  @"com.apple.AudioAccessoryServices");
    }

    if (a3)
    {
      uint64_t v8 = BTErrorF(4294896128LL, "Missing entitlement '%@'", @"com.apple.AudioAccessoryServices");
      id v9 = (id)objc_claimAutoreleasedReturnValue(v8);
      BOOL result = 0;
      *a3 = v9;
    }

    else
    {
      return 0;
    }
  }

  return result;
}

- (void)xpcConnectionInvalidated
{
  v13 = self->_audioSessionControl;
  audioSessionControl = self->_audioSessionControl;
  self->_audioSessionControl = 0LL;

  if (v13)
  {
    if (dword_100234330 <= 30
      && (dword_100234330 != -1 || _LogCategory_Initialize(&dword_100234330, 30LL)))
    {
      LogPrintF(&dword_100234330, "-[AAServicesXPCConnection xpcConnectionInvalidated]", 30LL, "Invalidate: %@", v13);
    }

    -[NSMutableSet removeObject:](self->_daemon->_activatedAudioSessionControlSet, "removeObject:", v13);
    currentAudioSessionControl = self->_daemon->_currentAudioSessionControl;
    v5 = v13;
    v6 = currentAudioSessionControl;
    if (v5 == v6)
    {
    }

    else
    {
      unsigned int v7 = v6;
      uint64_t v8 = v5;
      if (!v6)
      {
LABEL_12:

LABEL_13:
        -[AAAudioSessionControl invalidate](v5, "invalidate");
        goto LABEL_14;
      }

      unsigned int v9 = -[AAAudioSessionControl isEqual:](v5, "isEqual:", v6);

      if (!v9) {
        goto LABEL_13;
      }
    }

    daemon = self->_daemon;
    uint64_t v8 = daemon->_currentAudioSessionControl;
    daemon->_currentAudioSessionControl = 0LL;
    goto LABEL_12;
  }

- (void)audioRoutingControlActivate:(id)a3 completion:(id)a4
{
  id v7 = a3;
  uint64_t v20 = 0LL;
  v21 = &v20;
  uint64_t v22 = 0x3032000000LL;
  v23 = sub_100013E9C;
  v24 = sub_100013EAC;
  id v25 = 0LL;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_1000167C4;
  v17[3] = &unk_100206810;
  v19 = &v20;
  id v8 = a4;
  id v18 = v8;
  unsigned int v9 = objc_retainBlock(v17);
  if (dword_100234330 <= 30 && (dword_100234330 != -1 || _LogCategory_Initialize(&dword_100234330, 30LL))) {
    LogPrintF( &dword_100234330,  "-[AAServicesXPCConnection audioRoutingControlActivate:completion:]",  30LL,  "Activate: %@",  v7);
  }
  v10 = (id *)(v21 + 5);
  id obj = (id)v21[5];
  unsigned __int8 v11 = -[AAServicesXPCConnection _entitledAndReturnError:](self, "_entitledAndReturnError:", &obj);
  objc_storeStrong(v10, obj);
  if ((v11 & 1) != 0)
  {
    activatedAudioRoutingControlSet = self->_daemon->_activatedAudioRoutingControlSet;
    if (!activatedAudioRoutingControlSet)
    {
      v13 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
      daemon = self->_daemon;
      v15 = daemon->_activatedAudioRoutingControlSet;
      daemon->_activatedAudioRoutingControlSet = v13;

      activatedAudioRoutingControlSet = self->_daemon->_activatedAudioRoutingControlSet;
    }

    -[NSMutableSet addObject:](activatedAudioRoutingControlSet, "addObject:", v7);
    objc_storeStrong((id *)&self->_daemon->_currentAudioRoutingControl, a3);
    if (v8) {
      (*((void (**)(id, void))v8 + 2))(v8, 0LL);
    }
    -[AAServicesDaemon _update](self->_daemon, "_update");
  }

  ((void (*)(void *))v9[2])(v9);

  _Block_object_dispose(&v20, 8);
}

- (void)setHijackBlockingMode:(id)a3 mode:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  id v7 = a3;
  id v8 = a5;
  if (dword_100234330 <= 30 && (dword_100234330 != -1 || _LogCategory_Initialize(&dword_100234330, 30LL)))
  {
    unsigned int v9 = "no";
    if (v6) {
      unsigned int v9 = "yes";
    }
    LogPrintF( &dword_100234330,  "-[AAServicesXPCConnection setHijackBlockingMode:mode:completion:]",  30LL,  "SetHijackBlockingMode %s %@",  v9,  v7);
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue( +[BTSmartRoutingDaemon sharedBTSmartRoutingDaemon]( &OBJC_CLASS___BTSmartRoutingDaemon,  "sharedBTSmartRoutingDaemon"));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_1000169A4;
  v12[3] = &unk_100206030;
  id v13 = v8;
  id v11 = v8;
  [v10 _hijackBlockingModeChangedFromClient:v7 mode:v6 completion:v12];
}

- (void)activeHRMSessionChanged:(id)a3 hrmState:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  uint64_t v17 = 0LL;
  id v18 = &v17;
  uint64_t v19 = 0x3032000000LL;
  uint64_t v20 = sub_100013E9C;
  v21 = sub_100013EAC;
  id v22 = 0LL;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_100016B24;
  v14[3] = &unk_100206810;
  v16 = &v17;
  id v9 = a5;
  id v15 = v9;
  v10 = objc_retainBlock(v14);
  id v11 = (id *)(v18 + 5);
  id obj = (id)v18[5];
  LOBYTE(self) = -[AAServicesXPCConnection _entitledAndReturnError:](self, "_entitledAndReturnError:", &obj);
  objc_storeStrong(v11, obj);
  if ((self & 1) != 0)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue( +[BTSmartRoutingDaemon sharedBTSmartRoutingDaemon]( &OBJC_CLASS___BTSmartRoutingDaemon,  "sharedBTSmartRoutingDaemon"));
    [v12 _handleHRMSessionChanged:v6];
  }

  ((void (*)(void *))v10[2])(v10);

  _Block_object_dispose(&v17, 8);
}

- (void)audioSessionControlActivate:(id)a3 completion:(id)a4
{
  id v7 = a3;
  uint64_t v20 = 0LL;
  v21 = &v20;
  uint64_t v22 = 0x3032000000LL;
  v23 = sub_100013E9C;
  v24 = sub_100013EAC;
  id v25 = 0LL;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_100016E10;
  v17[3] = &unk_100206810;
  uint64_t v19 = &v20;
  id v8 = a4;
  id v18 = v8;
  id v9 = objc_retainBlock(v17);
  if (dword_100234330 <= 30 && (dword_100234330 != -1 || _LogCategory_Initialize(&dword_100234330, 30LL))) {
    LogPrintF( &dword_100234330,  "-[AAServicesXPCConnection audioSessionControlActivate:completion:]",  30LL,  "Activate: %@",  v7);
  }
  v10 = (id *)(v21 + 5);
  id obj = (id)v21[5];
  unsigned __int8 v11 = -[AAServicesXPCConnection _entitledAndReturnError:](self, "_entitledAndReturnError:", &obj);
  objc_storeStrong(v10, obj);
  if ((v11 & 1) != 0)
  {
    objc_storeStrong((id *)&self->_audioSessionControl, a3);
    activatedAudioSessionControlSet = self->_daemon->_activatedAudioSessionControlSet;
    if (!activatedAudioSessionControlSet)
    {
      id v13 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
      daemon = self->_daemon;
      id v15 = daemon->_activatedAudioSessionControlSet;
      daemon->_activatedAudioSessionControlSet = v13;

      activatedAudioSessionControlSet = self->_daemon->_activatedAudioSessionControlSet;
    }

    -[NSMutableSet addObject:](activatedAudioSessionControlSet, "addObject:", v7);
    objc_storeStrong((id *)&self->_daemon->_currentAudioSessionControl, a3);
    if (v8) {
      (*((void (**)(id, void))v8 + 2))(v8, 0LL);
    }
    -[AAServicesDaemon _update](self->_daemon, "_update");
  }

  ((void (*)(void *))v9[2])(v9);

  _Block_object_dispose(&v20, 8);
}

- (void)audioSessionControlUpdate:(id)a3
{
  id v4 = a3;
  uint64_t v14 = 0LL;
  id v15 = &v14;
  uint64_t v16 = 0x3032000000LL;
  uint64_t v17 = sub_100013E9C;
  id v18 = sub_100013EAC;
  id v19 = 0LL;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_100017110;
  v13[3] = &unk_100206270;
  v13[4] = &v14;
  v5 = objc_retainBlock(v13);
  BOOL v6 = (id *)(v15 + 5);
  id obj = (id)v15[5];
  unsigned __int8 v7 = -[AAServicesXPCConnection _entitledAndReturnError:](self, "_entitledAndReturnError:", &obj);
  objc_storeStrong(v6, obj);
  if ((v7 & 1) != 0)
  {
    if (dword_100234330 <= 30
      && (dword_100234330 != -1 || _LogCategory_Initialize(&dword_100234330, 30LL)))
    {
      LogPrintF(&dword_100234330, "-[AAServicesXPCConnection audioSessionControlUpdate:]", 30LL, "Update: %@", v4);
    }

    unsigned int v8 = -[AAAudioSessionControl conversationDetectSignal](self->_audioSessionControl, "conversationDetectSignal");
    id v9 = [v4 conversationDetectSignal];
    if (v8 != (_DWORD)v9)
    {
      if (dword_100234330 <= 30
        && (dword_100234330 != -1 || _LogCategory_Initialize(&dword_100234330, 30LL)))
      {
        if (v8 > 0xB) {
          v10 = "?";
        }
        else {
          v10 = (&off_100206988)[v8];
        }
        else {
          unsigned __int8 v11 = (&off_100206988)[(int)v9];
        }
        LogPrintF( &dword_100234330,  "-[AAServicesXPCConnection audioSessionControlUpdate:]",  30LL,  "Updating conversation detect signal from %s to %s",  v10,  v11);
      }

      -[AAAudioSessionControl setConversationDetectSignal:]( self->_audioSessionControl,  "setConversationDetectSignal:",  v9);
      -[AAServicesDaemon _update](self->_daemon, "_update");
    }
  }

  ((void (*)(void *))v5[2])(v5);

  _Block_object_dispose(&v14, 8);
}

- (void)setMuteAction:(int)a3 auditToken:(id *)a4 bundleIdentifier:(id)a5
{
  uint64_t v6 = *(void *)&a3;
  id v8 = a5;
  uint64_t v18 = 0LL;
  id v19 = &v18;
  uint64_t v20 = 0x3032000000LL;
  v21 = sub_100013E9C;
  uint64_t v22 = sub_100013EAC;
  id v23 = 0LL;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_100017370;
  v17[3] = &unk_100206270;
  void v17[4] = &v18;
  id v9 = objc_retainBlock(v17);
  v10 = (id *)(v19 + 5);
  id obj = (id)v19[5];
  unsigned __int8 v11 = -[AAServicesXPCConnection _entitledAndReturnError:](self, "_entitledAndReturnError:", &obj);
  objc_storeStrong(v10, obj);
  if ((v11 & 1) != 0)
  {
    if (dword_100234330 <= 30
      && (dword_100234330 != -1 || _LogCategory_Initialize(&dword_100234330, 30LL)))
    {
      else {
        v12 = (&off_1002069E8)[(int)v6];
      }
      LogPrintF( &dword_100234330,  "-[AAServicesXPCConnection setMuteAction:auditToken:bundleIdentifier:]",  30LL,  "Mute Control: Updating mute action %s",  v12);
    }

    daemon = self->_daemon;
    __int128 v14 = *(_OWORD *)&a4->var0[4];
    v15[0] = *(_OWORD *)a4->var0;
    v15[1] = v14;
    -[AAServicesDaemon _updateMuteAction:auditToken:bundleIdentifier:]( daemon,  "_updateMuteAction:auditToken:bundleIdentifier:",  v6,  v15,  v8);
  }

  ((void (*)(void *))v9[2])(v9);

  _Block_object_dispose(&v18, 8);
}

- (void)deviceManagerActivate:(id)a3 completion:(id)a4
{
  id v7 = a3;
  uint64_t v23 = 0LL;
  v24 = &v23;
  uint64_t v25 = 0x3032000000LL;
  v26 = sub_100013E9C;
  v27 = sub_100013EAC;
  id v28 = 0LL;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472LL;
  v20[2] = sub_1000176D4;
  v20[3] = &unk_100206810;
  uint64_t v22 = &v23;
  id v8 = a4;
  id v21 = v8;
  id v9 = objc_retainBlock(v20);
  if (dword_100234330 <= 30 && (dword_100234330 != -1 || _LogCategory_Initialize(&dword_100234330, 30LL))) {
    LogPrintF( &dword_100234330,  "-[AAServicesXPCConnection deviceManagerActivate:completion:]",  30LL,  "Activate: %@",  v7);
  }
  v10 = (id *)(v24 + 5);
  id obj = (id)v24[5];
  unsigned __int8 v11 = -[AAServicesXPCConnection _entitledAndReturnError:](self, "_entitledAndReturnError:", &obj);
  objc_storeStrong(v10, obj);
  if ((v11 & 1) != 0)
  {
    objc_storeStrong((id *)&self->_deviceManager, a3);
    activatedDeviceManagerSet = self->_daemon->_activatedDeviceManagerSet;
    if (!activatedDeviceManagerSet)
    {
      id v13 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
      daemon = self->_daemon;
      id v15 = daemon->_activatedDeviceManagerSet;
      daemon->_activatedDeviceManagerSet = v13;

      activatedDeviceManagerSet = self->_daemon->_activatedDeviceManagerSet;
    }

    -[NSMutableSet addObject:](activatedDeviceManagerSet, "addObject:", v7);
    if (v8) {
      (*((void (**)(id, void))v8 + 2))(v8, 0LL);
    }
    -[AAServicesDaemon _update](self->_daemon, "_update");
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue( +[AADeviceManagerDaemon sharedAADeviceManagerDaemon]( &OBJC_CLASS___AADeviceManagerDaemon,  "sharedAADeviceManagerDaemon"));
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v16 availableDevices]);

    if (dword_100234330 <= 30
      && (dword_100234330 != -1 || _LogCategory_Initialize(&dword_100234330, 30LL)))
    {
      LogPrintF( &dword_100234330,  "-[AAServicesXPCConnection deviceManagerActivate:completion:]",  30,  "available devices count: %lu",  [v17 count]);
    }

    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472LL;
    v18[2] = sub_100017794;
    v18[3] = &unk_100206688;
    v18[4] = self;
    [v17 enumerateKeysAndObjectsUsingBlock:v18];
  }

  ((void (*)(void *))v9[2])(v9);

  _Block_object_dispose(&v23, 8);
}

- (void)deviceManagerUpdate:(id)a3 completion:(id)a4
{
  id v6 = a3;
  v14[0] = 0LL;
  v14[1] = v14;
  v14[2] = 0x3032000000LL;
  v14[3] = sub_100013E9C;
  void v14[4] = sub_100013EAC;
  id v15 = 0LL;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_100017A38;
  v11[3] = &unk_100206810;
  id v13 = v14;
  id v7 = a4;
  id v12 = v7;
  id v8 = objc_retainBlock(v11);
  unsigned int v9 = -[AADeviceManager headGestureUpdateFlags](self->_deviceManager, "headGestureUpdateFlags");
  id v10 = [v6 headGestureUpdateFlags];
  if (v9 != (_DWORD)v10)
  {
    if (dword_100234330 <= 30
      && (dword_100234330 != -1 || _LogCategory_Initialize(&dword_100234330, 30LL)))
    {
      LogPrintF( &dword_100234330,  "-[AAServicesXPCConnection deviceManagerUpdate:completion:]",  30LL,  "Updating headgestureSignal from %d to %d",  v9,  (_DWORD)v10);
    }

    -[AADeviceManager setHeadGestureUpdateFlags:](self->_deviceManager, "setHeadGestureUpdateFlags:", v10);
    -[AAServicesDaemon _update](self->_daemon, "_update");
  }

  ((void (*)(void *))v8[2])(v8);

  _Block_object_dispose(v14, 8);
}

- (void)deviceManagerSendDeviceConfig:(id)a3 identifier:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v22 = 0LL;
  uint64_t v23 = &v22;
  uint64_t v24 = 0x3032000000LL;
  uint64_t v25 = sub_100013E9C;
  v26 = sub_100013EAC;
  id v27 = 0LL;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_100017D7C;
  v19[3] = &unk_100206810;
  id v21 = &v22;
  id v10 = a5;
  id v20 = v10;
  unsigned __int8 v11 = objc_retainBlock(v19);
  id v12 = (id *)(v23 + 5);
  id obj = (id)v23[5];
  unsigned __int8 v13 = -[AAServicesXPCConnection _entitledAndReturnError:](self, "_entitledAndReturnError:", &obj);
  objc_storeStrong(v12, obj);
  if ((v13 & 1) != 0)
  {
    if (dword_100234330 <= 30
      && (dword_100234330 != -1 || _LogCategory_Initialize(&dword_100234330, 30LL)))
    {
      LogPrintF( &dword_100234330,  "-[AAServicesXPCConnection deviceManagerSendDeviceConfig:identifier:completion:]",  30LL,  "AADeviceManager: send config: %@, to device with identifier: %@",  v8,  v9);
    }

    __int128 v14 = self->_deviceManager;
    if (v14)
    {
      id v15 = (void *)objc_claimAutoreleasedReturnValue( +[AADeviceManagerDaemon sharedAADeviceManagerDaemon]( &OBJC_CLASS___AADeviceManagerDaemon,  "sharedAADeviceManagerDaemon"));
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472LL;
      v16[2] = sub_100017E3C;
      v16[3] = &unk_100206030;
      id v17 = v10;
      [v15 sendDeviceConfig:v8 identifier:v9 completion:v16];
    }

    else if (dword_100234330 <= 90 {
           && (dword_100234330 != -1 || _LogCategory_Initialize(&dword_100234330, 90LL)))
    }
    {
      LogPrintF( &dword_100234330,  "-[AAServicesXPCConnection deviceManagerSendDeviceConfig:identifier:completion:]",  90LL,  "### AADeviceManager send device config failed: object not activated");
    }
  }

  ((void (*)(void *))v11[2])(v11);

  _Block_object_dispose(&v22, 8);
}

- (void)deviceManagerReportDeviceFound:(id)a3
{
  id v11 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v11 identifier]);
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue([v11 bluetoothAddress]);
    if (v5)
    {
      id v6 = self->_deviceManager;
      if (v6)
      {
        devices = self->_devices;
        if (!devices)
        {
          id v8 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
          id v9 = self->_devices;
          self->_devices = v8;

          devices = self->_devices;
        }

        -[NSMutableDictionary setObject:forKeyedSubscript:](devices, "setObject:forKeyedSubscript:", v11, v4);
        if (-[AAServicesXPCConnection _shouldSendXPCMessage](self, "_shouldSendXPCMessage"))
        {
          id v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSXPCConnection remoteObjectProxy](self->_xpcCnx, "remoteObjectProxy"));
          [v10 deviceManagerFoundDevice:v11];
        }
      }
    }
  }
}

- (void)deviceManagerReportDeviceLost:(id)a3
{
  id v8 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v8 identifier]);
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_devices, "objectForKeyedSubscript:", v4));

    if (v5)
    {
      id v6 = self->_deviceManager;
      if (v6)
      {
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_devices, "setObject:forKeyedSubscript:", 0LL, v4);
        if (-[AAServicesXPCConnection _shouldSendXPCMessage](self, "_shouldSendXPCMessage"))
        {
          id v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSXPCConnection remoteObjectProxy](self->_xpcCnx, "remoteObjectProxy"));
          [v7 deviceManagerLostDevice:v8];
        }
      }
    }
  }
}

- (void)deviceManagerHeadGestureDetected:(id)a3
{
  id v8 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v8 identifier]);
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_devices, "objectForKeyedSubscript:", v4));

    if (v5)
    {
      id v6 = self->_deviceManager;
      if (v6 && -[AAServicesXPCConnection _shouldSendXPCMessage](self, "_shouldSendXPCMessage"))
      {
        id v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSXPCConnection remoteObjectProxy](self->_xpcCnx, "remoteObjectProxy"));
        [v7 deviceHeadGestureDetected:v8];
      }
    }
  }
}

- (BOOL)_shouldSendXPCMessage
{
  unsigned int xpcMessageCounter = self->_xpcMessageCounter;
  if (xpcMessageCounter != -1)
  {
    self->_unsigned int xpcMessageCounter = xpcMessageCounter + 1;
    if (xpcMessageCounter <= 0xC7)
    {
      if (xpcMessageCounter == 99)
      {
        xpcCnx = self->_xpcCnx;
        v7[0] = _NSConcreteStackBlock;
        v7[1] = 3221225472LL;
        v7[2] = sub_100018188;
        v7[3] = &unk_100206058;
        v7[4] = self;
        -[NSXPCConnection scheduleSendBarrierBlock:](xpcCnx, "scheduleSendBarrierBlock:", v7);
      }

      else if (xpcMessageCounter == 199)
      {
        if (dword_100234330 <= 30
          && (dword_100234330 != -1 || _LogCategory_Initialize(&dword_100234330, 30LL)))
        {
          LogPrintF( &dword_100234330,  "-[AAServicesXPCConnection _shouldSendXPCMessage]",  30LL,  "AAServicesXPCConnection[%#{pid}]: Reached max outstanding messages (%d), issue require reset",  -[NSXPCConnection processIdentifier](self->_xpcCnx, "processIdentifier"),  self->_xpcMessageCounter);
        }

        id v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSXPCConnection remoteObjectProxy](self->_xpcCnx, "remoteObjectProxy"));
        [v6 aaServicesRequireReset];

        return 0;
      }

      return 1;
    }
  }

  return 0;
}

- (AAAudioSessionControl)audioSessionControl
{
  return self->_audioSessionControl;
}

- (void)setAudioSessionControl:(id)a3
{
}

- (AAServicesDaemon)daemon
{
  return self->_daemon;
}

- (void)setDaemon:(id)a3
{
}

- (NSMutableDictionary)devices
{
  return self->_devices;
}

- (void)setDevices:(id)a3
{
}

- (AADeviceManager)deviceManager
{
  return self->_deviceManager;
}

- (void)setDeviceManager:(id)a3
{
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
}

- (BOOL)entitled
{
  return self->_entitled;
}

- (void)setEntitled:(BOOL)a3
{
  self->_entitled = a3;
}

- (NSXPCConnection)xpcCnx
{
  return self->_xpcCnx;
}

- (void)setXpcCnx:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
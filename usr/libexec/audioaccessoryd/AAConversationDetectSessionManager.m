@interface AAConversationDetectSessionManager
+ ($E580289CEBE4DC5F92950CBF83AE8F80)defaultAudioTunings;
+ (id)sharedCDSessionManager;
- ($06D0163FE0D7AFE752A9F21F38483579)_getResetMessage:(unsigned __int8)a3;
- ($F52B7ECEF61F33743E51AFD28469D665)_getPauseMessage;
- (AAConversationDetectSessionManager)init;
- (BOOL)_getCDTunings:(id *)a3 FromData:(id)a4;
- (BOOL)cdSignalAudioInterrupted;
- (BOOL)getCdSignalAudioInterrupted;
- (NSString)currentCDDeviceIdentifier;
- (float)_duckingLevelForCoefficients:(id)a3 volume:(float)a4;
- (id)descriptionWithLevel:(int)a3;
- (id)getCurrentCDDeviceIdentifier;
- (void)_aaControllerEnsureStarted;
- (void)_aaControllerEnsureStopped;
- (void)_activateCDSession;
- (void)_asyncAudioSessionDuckWithLevel:(id)a3 completion:(id)a4;
- (void)_audioSessionEnsureStarted;
- (void)_audioSessionEnsureStopped;
- (void)_audioSessionReset;
- (void)_calibrateDuckingLevelForVolumeLevel:(float)a3;
- (void)_cdMsgNotificationReceivedHandler:(id)a3;
- (void)_cdSessionEnsureActivated:(BOOL)a3;
- (void)_cdSessionEnsureDeactivated:(unsigned __int8)a3;
- (void)_cdSessionSignalUpdate;
- (void)_conversationDetectMessageReceived:(id)a3 fromDeviceIdentifier:(id)a4;
- (void)_deregisterFromAVAudioSessionSpeechDetectionStyleChanges;
- (void)_deregisterFromAudioSessionResetNotifications;
- (void)_deregisterFromWirelessSplitterStateChanges;
- (void)_deviceFound:(id)a3;
- (void)_deviceLost:(id)a3;
- (void)_getSignalTypeFromData:(id)a3 signal:(int *)a4;
- (void)_invalidate;
- (void)_invalidateCDSession;
- (void)_prefsChanged;
- (void)_registerForAVAudioSessionSpeechDetectionStyleChanges;
- (void)_registerForAudioSessionResetNotifications;
- (void)_registerForWirelessSplitterStateChanges;
- (void)_sendConversationDetectMessage:(id)a3 destinationIdentifier:(id)a4 completion:(id)a5;
- (void)_setCDSignalAudioTunings:(id *)a3;
- (void)_speechDetectionStyleChanged:(unint64_t)a3;
- (void)_speechDetectionUserVolumeChanged:(unint64_t)a3;
- (void)_startQueuedRampForDuration:(id)a3 startLevel:(id)a4 endLevel:(id)a5;
- (void)_updateAccessoriesWithMotionState:(unsigned int)a3;
- (void)_updateAccessoriesWithPauseState;
- (void)_updateAccessoriesWithResetState:(unsigned __int8)a3;
- (void)_updateConversationDetectSignal:(int)a3;
- (void)_updatePauseState;
- (void)activate;
- (void)activateCDSession;
- (void)invalidate;
- (void)invalidateCDSession;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setCDTunings:(id *)a3;
- (void)setCdSignalAudioInterrupted:(BOOL)a3;
- (void)setConversationDetectSignal:(int)a3;
- (void)setCurrentCDDeviceIdentifier:(id)a3;
@end

@implementation AAConversationDetectSessionManager

+ ($E580289CEBE4DC5F92950CBF83AE8F80)defaultAudioTunings
{
  *(_OWORD *)&retstr->var0.var0 = xmmword_1001A5B90;
  *(_OWORD *)&retstr->var2.var0 = xmmword_1001A5BA0;
  *(_OWORD *)&retstr->var4.var0 = xmmword_1001A5BB0;
  *(int64x2_t *)&retstr->var6.var0 = vdupq_n_s64(0x3E99999A3F800000uLL);
  return result;
}

+ (id)sharedCDSessionManager
{
  if (qword_1002371E8 != -1) {
    dispatch_once(&qword_1002371E8, &stru_1002062E0);
  }
  return (id)qword_1002371E0;
}

- (AAConversationDetectSessionManager)init
{
  v22.receiver = self;
  v22.super_class = (Class)&OBJC_CLASS___AAConversationDetectSessionManager;
  v2 = -[AAConversationDetectSessionManager init](&v22, "init");
  if (v2)
  {
    dispatch_queue_attr_t v3 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v3);
    dispatch_queue_t v5 = dispatch_queue_create("AACDSessionManager", v4);
    v6 = (void *)*((void *)v2 + 18);
    *((void *)v2 + 18) = v5;

    dispatch_queue_attr_t v7 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v8 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v7);
    dispatch_queue_t v9 = dispatch_queue_create("AACDChunkedRampQueue", v8);
    v10 = (void *)*((void *)v2 + 19);
    *((void *)v2 + 19) = v9;

    v11 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    v12 = (void *)*((void *)v2 + 11);
    *((void *)v2 + 11) = v11;

    *((_DWORD *)v2 + 51) = -1;
    +[AAConversationDetectSessionManager defaultAudioTunings]( &OBJC_CLASS___AAConversationDetectSessionManager,  "defaultAudioTunings");
    __int128 v14 = v20;
    __int128 v13 = v21;
    __int128 v15 = v19;
    *(_OWORD *)(v2 + 24) = v18;
    *(_OWORD *)(v2 + 40) = v15;
    *(_OWORD *)(v2 + 56) = v14;
    *(_OWORD *)(v2 + 72) = v13;
    *((_DWORD *)v2 + 43) = -1;
    v16 = v2;
  }

  return (AAConversationDetectSessionManager *)v2;
}

- (void)activate
{
  if (dword_1002341F0 <= 30 && (dword_1002341F0 != -1 || _LogCategory_Initialize(&dword_1002341F0, 30LL))) {
    LogPrintF( &dword_1002341F0,  "-[AAConversationDetectSessionManager activate]",  30LL,  "AAConversationDetectSessionManager activate");
  }
  if (self->_prefsChangedNotifyToken == -1)
  {
    dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472LL;
    handler[2] = sub_1000073A0;
    handler[3] = &unk_100206308;
    handler[4] = self;
    notify_register_dispatch( "com.apple.AudioAccessory.prefsChanged",  &self->_prefsChangedNotifyToken,  dispatchQueue,  handler);
  }

  -[AAConversationDetectSessionManager _prefsChanged](self, "_prefsChanged");
  v4 = self->_connectedDeviceDiscovery;
  if (!v4)
  {
    dispatch_queue_t v5 = objc_alloc_init(&OBJC_CLASS___CBDiscovery);
    -[CBDiscovery setDispatchQueue:](v5, "setDispatchQueue:", self->_dispatchQueue);
    objc_storeStrong((id *)&self->_connectedDeviceDiscovery, v5);
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472LL;
    v26[2] = sub_100007410;
    v26[3] = &unk_100206330;
    v6 = v5;
    v27 = v6;
    v28 = self;
    -[CBDiscovery setDeviceFoundHandler:](v6, "setDeviceFoundHandler:", v26);
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472LL;
    v23[2] = sub_10000742C;
    v23[3] = &unk_100206330;
    dispatch_queue_attr_t v7 = v6;
    v24 = v7;
    v25 = self;
    -[CBDiscovery setDeviceLostHandler:](v7, "setDeviceLostHandler:", v23);
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472LL;
    v20[2] = sub_100007448;
    v20[3] = &unk_100206358;
    v8 = v7;
    __int128 v21 = v8;
    objc_super v22 = self;
    -[CBDiscovery setInterruptionHandler:](v8, "setInterruptionHandler:", v20);
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472LL;
    v18[2] = sub_1000074D8;
    v18[3] = &unk_100206058;
    dispatch_queue_t v9 = v8;
    __int128 v19 = v9;
    -[CBDiscovery setInvalidationHandler:](v9, "setInvalidationHandler:", v18);
    -[CBDiscovery setDiscoveryFlags:]( v9,  "setDiscoveryFlags:",  (unint64_t)-[CBDiscovery discoveryFlags](v9, "discoveryFlags") | 0x80000200000LL);
    v12 = _NSConcreteStackBlock;
    uint64_t v13 = 3221225472LL;
    __int128 v14 = sub_100007554;
    __int128 v15 = &unk_100206380;
    v4 = v9;
    v16 = v4;
    v17 = self;
    -[CBDiscovery activateWithCompletion:](v4, "activateWithCompletion:", &v12);
  }

  id v10 = -[AAConversationDetectSessionManager _aaControllerEnsureStarted]( self,  "_aaControllerEnsureStarted",  v12,  v13,  v14,  v15);
  if (!self->_cdMsgReceivedObserving && IsAppleInternalBuild(v10))
  {
    if (dword_1002341F0 <= 30
      && (dword_1002341F0 != -1 || _LogCategory_Initialize(&dword_1002341F0, 30LL)))
    {
      LogPrintF( &dword_1002341F0,  "-[AAConversationDetectSessionManager activate]",  30LL,  "Registering for Conversation Detect Tunings Messages");
    }

    v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSDistributedNotificationCenter defaultCenter]( &OBJC_CLASS___NSDistributedNotificationCenter,  "defaultCenter"));
    [v11 addObserver:self selector:"_cdMsgNotificationReceivedHandler:" name:@"com.apple.AudioAccessory.cdMsgNotification" object:0];
    self->_cdMsgReceivedObserving = 1;
  }
}

- (void)_aaControllerEnsureStarted
{
  p_aaController = &self->_aaController;
  v4 = self->_aaController;
  if (!v4)
  {
    dispatch_queue_t v5 = objc_alloc_init(&OBJC_CLASS___AAController);
    -[AAController setDispatchQueue:](v5, "setDispatchQueue:", self->_dispatchQueue);
    objc_storeStrong((id *)p_aaController, v5);
    -[AAController setInvalidationHandler:](v5, "setInvalidationHandler:", &stru_1002063A0);
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_100007834;
    v10[3] = &unk_1002063C8;
    v6 = v5;
    v11 = v6;
    v12 = self;
    -[AAController setConversationDetectMessageHandler:](v6, "setConversationDetectMessageHandler:", v10);
    if (dword_1002341F0 <= 30
      && (dword_1002341F0 != -1 || _LogCategory_Initialize(&dword_1002341F0, 30LL)))
    {
      LogPrintF( &dword_1002341F0,  "-[AAConversationDetectSessionManager _aaControllerEnsureStarted]",  30LL,  "Activating AAController: %@",  v6);
    }

    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_100007850;
    v7[3] = &unk_100206380;
    v4 = v6;
    v8 = v4;
    dispatch_queue_t v9 = self;
    -[AAController activateWithCompletion:](v4, "activateWithCompletion:", v7);
  }
}

- (void)_aaControllerEnsureStopped
{
  aaController = self->_aaController;
  if (aaController)
  {
    -[AAController invalidate](aaController, "invalidate");
    v4 = self->_aaController;
    self->_aaController = 0LL;
  }

- (void)activateCDSession
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000079F0;
  block[3] = &unk_100206058;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_activateCDSession
{
  if (!self->_activateCDSessionCalled)
  {
    self->_activateCDSessionCalled = 1;
    if (dword_1002341F0 <= 30
      && (dword_1002341F0 != -1 || _LogCategory_Initialize(&dword_1002341F0, 30LL)))
    {
      LogPrintF( &dword_1002341F0,  "-[AAConversationDetectSessionManager _activateCDSession]",  30LL,  "CD Session activate");
    }

    -[AAConversationDetectSessionManager _registerForAudioSessionResetNotifications]( self,  "_registerForAudioSessionResetNotifications");
    -[AAConversationDetectSessionManager _registerForAVAudioSessionSpeechDetectionStyleChanges]( self,  "_registerForAVAudioSessionSpeechDetectionStyleChanges");
    -[AAConversationDetectSessionManager _registerForWirelessSplitterStateChanges]( self,  "_registerForWirelessSplitterStateChanges");
  }

- (void)_conversationDetectMessageReceived:(id)a3 fromDeviceIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v7)
  {
    __int128 v18 = "Invalid identifier for received CD message";
LABEL_14:
    uint64_t v19 = 30LL;
LABEL_40:
    LogPrintF( &dword_1002341F0,  "-[AAConversationDetectSessionManager _conversationDetectMessageReceived:fromDeviceIdentifier:]",  v19,  v18,  v22,  v23);
    goto LABEL_41;
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_cdSupportedAccessories,  "objectForKeyedSubscript:",  v7));

  if (!v8)
  {
    id v22 = v7;
    __int128 v18 = "Received CD message from unknown identifier %@";
    goto LABEL_14;
  }

  unsigned int v35 = 0;
  __int128 v33 = 0u;
  memset(v34, 0, sizeof(v34));
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  __int128 v26 = 0u;
  dispatch_queue_t v9 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_cdSupportedAccessories,  "objectForKeyedSubscript:",  v7));
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 btAddressData]);
  uint64_t v11 = CUPrintNSDataAddress();
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  -[AAConversationDetectSessionManager setCurrentCDDeviceIdentifier:](self, "setCurrentCDDeviceIdentifier:", v12);

  if (v6)
  {
    id v13 = v6;
    __int128 v14 = (unsigned __int8 *)[v13 bytes];
    uint64_t v15 = (char)*v14;
    v16 = (void *)*v14;
    if (dword_1002341F0 <= 30
      && (dword_1002341F0 != -1 || _LogCategory_Initialize(&dword_1002341F0, 30LL)))
    {
      else {
        v17 = (&off_1002064B0)[v15];
      }
      LogPrintF( &dword_1002341F0,  "-[AAConversationDetectSessionManager _conversationDetectMessageReceived:fromDeviceIdentifier:]",  30LL,  "Conversation Detect: messageType %s",  v17);
    }

    if ((_DWORD)v16 == 2)
    {
      if (-[AAConversationDetectSessionManager _getCDTunings:FromData:](self, "_getCDTunings:FromData:", &v26, v13))
      {
        if (dword_1002341F0 <= 30
          && (dword_1002341F0 != -1 || _LogCategory_Initialize(&dword_1002341F0, 30LL)))
        {
          LogPrintF( &dword_1002341F0,  "-[AAConversationDetectSessionManager _conversationDetectMessageReceived:fromDeviceIdentifier:]",  30LL,  "CD tunings received");
        }

        v24[6] = v32;
        v24[7] = v33;
        v25[0] = *(_OWORD *)v34;
        *(_DWORD *)((char *)v25 + 15) = *(_DWORD *)&v34[15];
        v24[2] = v28;
        v24[3] = v29;
        v24[4] = v30;
        v24[5] = v31;
        v24[0] = v26;
        v24[1] = v27;
        -[AAConversationDetectSessionManager setCDTunings:](self, "setCDTunings:", v24);
      }

      goto LABEL_41;
    }

    if ((_DWORD)v16 == 1)
    {
      -[AAConversationDetectSessionManager _getSignalTypeFromData:signal:]( self,  "_getSignalTypeFromData:signal:",  v13,  &v35);
      -[AAConversationDetectSessionManager _updateConversationDetectSignal:]( self,  "_updateConversationDetectSignal:",  v35);
      goto LABEL_41;
    }

    unsigned int v20 = v16;
  }

  else
  {
    v16 = 0LL;
    unsigned int v20 = 0;
  }

  if (dword_1002341F0 <= 90 && (dword_1002341F0 != -1 || _LogCategory_Initialize(&dword_1002341F0, 90LL)))
  {
    if (v20 > 5) {
      __int128 v21 = "?";
    }
    else {
      __int128 v21 = (&off_1002064E0)[(char)v20];
    }
    id v22 = v16;
    v23 = v21;
    __int128 v18 = "Received undesired CD msg of type %u %s";
    uint64_t v19 = 90LL;
    goto LABEL_40;
  }

- (void)_cdMsgNotificationReceivedHandler:(id)a3
{
  id v4 = a3;
  if (dword_1002341F0 <= 30 && (dword_1002341F0 != -1 || _LogCategory_Initialize(&dword_1002341F0, 30LL))) {
    LogPrintF( &dword_1002341F0,  "-[AAConversationDetectSessionManager _cdMsgNotificationReceivedHandler:]",  30LL,  "Conversation Detect: _cdMessageReceived");
  }
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100007ED8;
  v7[3] = &unk_100206358;
  id v8 = v4;
  dispatch_queue_t v9 = self;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

- (id)descriptionWithLevel:(int)a3
{
  id v10 = 0LL;
  uint64_t cdSignal = self->_cdSignal;
  else {
    id v4 = (&off_100206510)[cdSignal];
  }
  dispatch_queue_t v5 = "yes";
  if (!self->_audioSessionActivated) {
    dispatch_queue_t v5 = "no";
  }
  NSAppendPrintF_safe( &v10,  "-- AAConversationDetectSessionManager: CDSignal %s, CDActivated: %s, duckLevel: %@, unduckLevel: %@, ramp duration: %@ --\n",  *(void *)&a3,  v4,  v5,  self->_duckLevel,  self->_unduckLevel,  self->_rampDuration);
  id v6 = v10;
  id v9 = v6;
  NSAppendPrintF(&v9, "\n");
  id v7 = v9;

  return v7;
}

- (void)invalidateCDSession
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000080DC;
  block[3] = &unk_100206058;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_invalidateCDSession
{
  if (dword_1002341F0 <= 30 && (dword_1002341F0 != -1 || _LogCategory_Initialize(&dword_1002341F0, 30LL))) {
    LogPrintF( &dword_1002341F0,  "-[AAConversationDetectSessionManager _invalidateCDSession]",  30LL,  "CD Session invalidate");
  }
  self->_uint64_t cdSignal = 0;
  -[AAConversationDetectSessionManager _cdSessionEnsureDeactivated:](self, "_cdSessionEnsureDeactivated:", 0LL);
  dispatch_queue_attr_t v3 = self;
  objc_sync_enter(v3);
  v3->_audioSessionActivated = 0;
  objc_sync_exit(v3);

  -[AAConversationDetectSessionManager setCdSignalAudioInterrupted:](v3, "setCdSignalAudioInterrupted:", 0LL);
  if (dword_1002341F0 <= 30 && (dword_1002341F0 != -1 || _LogCategory_Initialize(&dword_1002341F0, 30LL))) {
    LogPrintF( &dword_1002341F0,  "-[AAConversationDetectSessionManager _invalidateCDSession]",  30LL,  "Posting CdSignalAudioInterruptedChanged notification");
  }
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v4 postNotificationName:@"CdSignalAudioInterruptedChanged" object:v3];

  if (-[NSMutableDictionary count](v3->_cdSupportedAccessories, "count"))
  {
    if (dword_1002341F0 <= 90
      && (dword_1002341F0 != -1 || _LogCategory_Initialize(&dword_1002341F0, 90LL)))
    {
      LogPrintF( &dword_1002341F0,  "-[AAConversationDetectSessionManager _invalidateCDSession]",  90LL,  "connected CD supported accessories count %d, keep state change notifications registered",  -[NSMutableDictionary count](v3->_cdSupportedAccessories, "count"));
    }
  }

  else
  {
    -[AAConversationDetectSessionManager _deregisterFromAudioSessionResetNotifications]( v3,  "_deregisterFromAudioSessionResetNotifications");
    -[AAConversationDetectSessionManager _deregisterFromWirelessSplitterStateChanges]( v3,  "_deregisterFromWirelessSplitterStateChanges");
    -[AAConversationDetectSessionManager _deregisterFromAVAudioSessionSpeechDetectionStyleChanges]( v3,  "_deregisterFromAVAudioSessionSpeechDetectionStyleChanges");
    v3->_activateCDSessionCalled = 0;
  }

- (void)invalidate
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000082E8;
  block[3] = &unk_100206058;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_invalidate
{
  connectedDeviceDiscovery = self->_connectedDeviceDiscovery;
  self->_connectedDeviceDiscovery = 0LL;

  -[NSMutableDictionary removeAllObjects](self->_cdSupportedAccessories, "removeAllObjects");
  cdSupportedAccessories = self->_cdSupportedAccessories;
  self->_cdSupportedAccessories = 0LL;

  if (self->_cdMsgReceivedObserving)
  {
    dispatch_queue_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSDistributedNotificationCenter defaultCenter]( &OBJC_CLASS___NSDistributedNotificationCenter,  "defaultCenter"));
    [v5 removeObserver:self name:@"com.apple.AudioAccessory.cdMsgNotification" object:0];
    self->_cdMsgReceivedObserving = 0;
  }

  int prefsChangedNotifyToken = self->_prefsChangedNotifyToken;
  if (prefsChangedNotifyToken != -1)
  {
    notify_cancel(prefsChangedNotifyToken);
    self->_int prefsChangedNotifyToken = -1;
  }

  notify_cancel(self->_conversationAwarenessNotificationDispatchToken);
}

- ($F52B7ECEF61F33743E51AFD28469D665)_getPauseMessage
{
  return ($F52B7ECEF61F33743E51AFD28469D665)((self->_currentPauseReason << 16) | (self->_pauseConversationDetect << 8) | 3);
}

- ($06D0163FE0D7AFE752A9F21F38483579)_getResetMessage:(unsigned __int8)a3
{
  return ($06D0163FE0D7AFE752A9F21F38483579)((a3 << 8) | 5);
}

- (void)_getSignalTypeFromData:(id)a3 signal:(int *)a4
{
  id v5 = a3;
  id v6 = v5;
  if (v5)
  {
    id v11 = v5;
    id v7 = v5;
    id v8 = (unsigned __int8 *)[v7 bytes];
    if ((unint64_t)[v7 length] <= 1)
    {
      id v6 = v11;
      if (dword_1002341F0 <= 30)
      {
        if (dword_1002341F0 != -1 || (int v10 = _LogCategory_Initialize(&dword_1002341F0, 30LL), v6 = v11, v10))
        {
          LogPrintF( &dword_1002341F0,  "-[AAConversationDetectSessionManager _getSignalTypeFromData:signal:]",  30LL,  "Invalid length of CD signal data: %lu");
LABEL_14:
          id v6 = v11;
        }
      }
    }

    else
    {
      *a4 = v8[1];
      id v6 = v11;
      if (dword_1002341F0 <= 30)
      {
        if (dword_1002341F0 != -1 || (int v9 = _LogCategory_Initialize(&dword_1002341F0, 30LL), v6 = v11, v9))
        {
          LogPrintF( &dword_1002341F0,  "-[AAConversationDetectSessionManager _getSignalTypeFromData:signal:]",  30LL,  "_getSignalFromData returning signal - %s");
          goto LABEL_14;
        }
      }
    }
  }
}

- (BOOL)_getCDTunings:(id *)a3 FromData:(id)a4
{
  id v5 = a4;
  id v6 = v5;
  if (!v5)
  {
LABEL_15:
    BOOL v16 = 0;
    goto LABEL_16;
  }

  id v7 = v5;
  id v8 = (char *)[v7 bytes];
  if ((unint64_t)[v7 length] <= 0x93)
  {
    if (dword_1002341F0 <= 30
      && (dword_1002341F0 != -1 || _LogCategory_Initialize(&dword_1002341F0, 30LL)))
    {
      LogPrintF( &dword_1002341F0,  "-[AAConversationDetectSessionManager _getCDTunings:FromData:]",  30LL,  "Invalid length of CD tunings data: %lu");
    }

    goto LABEL_15;
  }

  if (!a3)
  {
    if (dword_1002341F0 <= 30
      && (dword_1002341F0 != -1 || _LogCategory_Initialize(&dword_1002341F0, 30LL)))
    {
      LogPrintF( &dword_1002341F0,  "-[AAConversationDetectSessionManager _getCDTunings:FromData:]",  30LL,  "Invalid tunings pointer");
    }

    goto LABEL_15;
  }

  __int128 v9 = *(_OWORD *)(v8 + 17);
  *(_OWORD *)&a3->var0.var0 = *(_OWORD *)(v8 + 1);
  *(_OWORD *)&a3->var0.var4 = v9;
  __int128 v10 = *(_OWORD *)(v8 + 33);
  __int128 v11 = *(_OWORD *)(v8 + 49);
  __int128 v12 = *(_OWORD *)(v8 + 81);
  *(_OWORD *)&a3->var0.var16 = *(_OWORD *)(v8 + 65);
  *(_OWORD *)&a3->var0.var21 = v12;
  *(_OWORD *)&a3->var0.var8 = v10;
  *(_OWORD *)&a3->var0.var12 = v11;
  __int128 v13 = *(_OWORD *)(v8 + 97);
  __int128 v14 = *(_OWORD *)(v8 + 113);
  __int128 v15 = *(_OWORD *)(v8 + 129);
  *(float *)((char *)&a3->var2.var6.var0 + 3) = *((float *)v8 + 36);
  *(_OWORD *)&a3->var2.var2.var1 = v14;
  *(_OWORD *)&a3->var2.var4.var1 = v15;
  *(_OWORD *)&a3->var2.var0.var1 = v13;
  BOOL v16 = 1;
LABEL_16:

  return v16;
}

- (BOOL)getCdSignalAudioInterrupted
{
  v2 = self;
  objc_sync_enter(v2);
  BOOL cdSignalAudioInterrupted = v2->_cdSignalAudioInterrupted;
  objc_sync_exit(v2);

  return cdSignalAudioInterrupted;
}

- (id)getCurrentCDDeviceIdentifier
{
  v2 = self;
  objc_sync_enter(v2);
  dispatch_queue_attr_t v3 = v2->_currentCDDeviceIdentifier;
  objc_sync_exit(v2);

  return v3;
}

- (void)_prefsChanged
{
  if (v22) {
    BOOL v4 = 1;
  }
  else {
    BOOL v4 = v3 < 0.0;
  }
  if (v4) {
    double v5 = 3.0;
  }
  else {
    double v5 = v3;
  }
  double signalRampDurationSecs = self->_cdSignalAudioTunings.unlatchSignalTunables.signalRampDurationSecs;
  if (v5 == signalRampDurationSecs) {
    goto LABEL_13;
  }
  if (dword_1002341F0 <= 30)
  {
    if (dword_1002341F0 == -1)
    {
      double signalRampDurationSecs = self->_cdSignalAudioTunings.unlatchSignalTunables.signalRampDurationSecs;
    }

    LogPrintF( &dword_1002341F0,  "-[AAConversationDetectSessionManager _prefsChanged]",  30LL,  "Unlatch signal ramp duration: %0.2f --> %0.2f",  signalRampDurationSecs,  v5);
  }

- (void)_sendConversationDetectMessage:(id)a3 destinationIdentifier:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  -[AAConversationDetectSessionManager _aaControllerEnsureStarted](self, "_aaControllerEnsureStarted");
  aaController = self->_aaController;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_100008ABC;
  v15[3] = &unk_1002063F0;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  -[AAController sendConversationDetectMessage:destinationIdentifier:completionHandler:]( aaController,  "sendConversationDetectMessage:destinationIdentifier:completionHandler:",  v14,  v13,  v15);
}

- (void)setConversationDetectSignal:(int)a3
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_100008C18;
  v4[3] = &unk_100205F18;
  v4[4] = self;
  int v5 = a3;
  dispatch_async(dispatchQueue, v4);
}

- (void)setCDTunings:(id *)a3
{
  v8[1] = 3221225472LL;
  __int128 v3 = *(_OWORD *)&a3->var2.var2.var1;
  __int128 v15 = *(_OWORD *)&a3->var2.var0.var1;
  __int128 v16 = v3;
  *(_OWORD *)id v17 = *(_OWORD *)&a3->var2.var4.var1;
  __int128 v4 = *(_OWORD *)&a3->var0.var12;
  __int128 v11 = *(_OWORD *)&a3->var0.var8;
  __int128 v12 = v4;
  __int128 v5 = *(_OWORD *)&a3->var0.var21;
  __int128 v13 = *(_OWORD *)&a3->var0.var16;
  __int128 v14 = v5;
  __int128 v6 = *(_OWORD *)&a3->var0.var4;
  __int128 v9 = *(_OWORD *)&a3->var0.var0;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v8[0] = _NSConcreteStackBlock;
  v8[2] = sub_100008CC4;
  v8[3] = &unk_100206418;
  *(float *)&v17[15] = *(float *)((char *)&a3->var2.var6.var0 + 3);
  __int128 v10 = v6;
  v8[4] = self;
  dispatch_async(dispatchQueue, v8);
}

- (void)setCdSignalAudioInterrupted:(BOOL)a3
{
  obj = self;
  objc_sync_enter(obj);
  obj->_BOOL cdSignalAudioInterrupted = a3;
  objc_sync_exit(obj);
}

- (void)_setCDSignalAudioTunings:(id *)a3
{
  uint64_t v4 = 0LL;
  __int128 v5 = *(_OWORD *)&a3->var2.var0;
  v45[0] = *(_OWORD *)&a3->var0.var0;
  v45[1] = v5;
  p_cdSignalAudioTunings = &self->_cdSignalAudioTunings;
  __int128 v7 = *(_OWORD *)&a3->var6.var0;
  v45[2] = *(_OWORD *)&a3->var4.var0;
  v45[3] = v7;
  do
  {
    float v8 = *((float *)v45 + v4);
    if (v8 >= 0.0)
    {
      float v9 = flt_1001A5C00[v4];
      if (v8 <= v9)
      {
        float v9 = *((float *)v45 + v4);
      }

      else if (dword_1002341F0 <= 30 {
             && (dword_1002341F0 != -1 || _LogCategory_Initialize(&dword_1002341F0, 30LL)))
      }
      {
        double v10 = v9;
LABEL_11:
        LogPrintF( &dword_1002341F0,  "-[AAConversationDetectSessionManager _setCDSignalAudioTunings:]",  30LL,  "Invalid audio tunings %f, Audio tunings %f set at index %d",  v8,  v10,  v4);
      }
    }

    else
    {
      float v9 = 0.0;
      if (dword_1002341F0 <= 30)
      {
        double v10 = 0.0;
      }
    }

    *(&p_cdSignalAudioTunings->startSignalTunables.signalDuckingLevel + v4++) = v9;
  }

  while (v4 != 16);
  if (dword_1002341F0 < 31 && (dword_1002341F0 != -1 || _LogCategory_Initialize(&dword_1002341F0, 30LL)))
  {
    float signalDuckingLevel = self->_cdSignalAudioTunings.startSignalTunables.signalDuckingLevel;
    float signalRampDurationSecs = self->_cdSignalAudioTunings.startSignalTunables.signalRampDurationSecs;
    float v14 = self->_cdSignalAudioTunings.latch1SignalTunables.signalDuckingLevel;
    float v13 = self->_cdSignalAudioTunings.latch1SignalTunables.signalRampDurationSecs;
    float v16 = self->_cdSignalAudioTunings.latch2SignalTunables.signalDuckingLevel;
    float v15 = self->_cdSignalAudioTunings.latch2SignalTunables.signalRampDurationSecs;
    float v18 = self->_cdSignalAudioTunings.unlatchSignalTunables.signalDuckingLevel;
    float v17 = self->_cdSignalAudioTunings.unlatchSignalTunables.signalRampDurationSecs;
    float v37 = self->_cdSignalAudioTunings.end1SignalTunables.signalDuckingLevel;
    float v38 = self->_cdSignalAudioTunings.end1SignalTunables.signalRampDurationSecs;
    float v39 = self->_cdSignalAudioTunings.end2SignalTunables.signalDuckingLevel;
    float v40 = self->_cdSignalAudioTunings.end2SignalTunables.signalRampDurationSecs;
    float v41 = self->_cdSignalAudioTunings.resetSignalTunables.signalDuckingLevel;
    float v42 = self->_cdSignalAudioTunings.resetSignalTunables.signalRampDurationSecs;
    float v43 = self->_cdSignalAudioTunings.pauseSignalTunables.signalDuckingLevel;
    float v44 = self->_cdSignalAudioTunings.pauseSignalTunables.signalRampDurationSecs;
    id v63 = 0LL;
    NSAppendPrintF(&v63, "\n-- CD Audio Tunings Begin --\n");
    id v19 = v63;
    id v62 = v19;
    NSAppendPrintF(&v62, "    Start signal duck level: %0.2f\n", signalDuckingLevel);
    id v20 = v62;

    id v61 = v20;
    NSAppendPrintF(&v61, "    Start signal ramp duration: %0.2f s\n", signalRampDurationSecs);
    id v21 = v61;

    id v60 = v21;
    NSAppendPrintF(&v60, "    Latch1 signal duck level: %0.2f\n", v14);
    id v22 = v60;

    id v59 = v22;
    NSAppendPrintF(&v59, "    Latch1 signal ramp duration: %0.2f s\n", v13);
    id v23 = v59;

    id v58 = v23;
    NSAppendPrintF(&v58, "    Latch2 signal duck level: %0.2f\n", v16);
    id v24 = v58;

    id v57 = v24;
    NSAppendPrintF(&v57, "    Latch2 signal ramp duration: %0.2f s\n", v15);
    id v25 = v57;

    id v56 = v25;
    NSAppendPrintF(&v56, "    Unlatch signal duck level: %0.2f\n", v18);
    id v26 = v56;

    id v55 = v26;
    NSAppendPrintF(&v55, "    Unlatch signal ramp duration: %0.2f s\n", v17);
    id v27 = v55;

    id v54 = v27;
    NSAppendPrintF(&v54, "    End1 signal duck level: %0.2f\n", v37);
    id v28 = v54;

    id v53 = v28;
    NSAppendPrintF(&v53, "    End1 signal ramp duration: %0.2f s\n", v38);
    id v29 = v53;

    id v52 = v29;
    NSAppendPrintF(&v52, "    End2 signal duck level: %0.2f\n", v39);
    id v30 = v52;

    id v51 = v30;
    NSAppendPrintF(&v51, "    End2 signal ramp duration: %0.2f s\n", v40);
    id v31 = v51;

    id v50 = v31;
    NSAppendPrintF(&v50, "    Reset signal duck level: %0.2f\n", v41);
    id v32 = v50;

    id v49 = v32;
    NSAppendPrintF(&v49, "    Reset signal ramp duration: %0.2f s\n", v42);
    id v33 = v49;

    id v48 = v33;
    NSAppendPrintF(&v48, "    Pause signal duck level: %0.2f\n", v43);
    id v34 = v48;

    id v47 = v34;
    NSAppendPrintF(&v47, "    Pause signal ramp duration: %0.2f s\n", v44);
    id v35 = v47;

    id v46 = v35;
    NSAppendPrintF(&v46, "-- CD Audio Tunings End --\n");
    id v36 = v46;

    LogPrintF(&dword_1002341F0, "-[AAConversationDetectSessionManager _setCDSignalAudioTunings:]", 30LL, "%@", v36);
  }

- (void)setCurrentCDDeviceIdentifier:(id)a3
{
  uint64_t v4 = (NSString *)a3;
  obj = self;
  objc_sync_enter(obj);
  currentCDDeviceIdentifier = obj->_currentCDDeviceIdentifier;
  obj->_currentCDDeviceIdentifier = v4;

  objc_sync_exit(obj);
}

- (void)_updateAccessoriesWithMotionState:(unsigned int)a3
{
  if (-[NSMutableDictionary count](self->_cdSupportedAccessories, "count"))
  {
    char v10 = 4;
    unsigned int v11 = a3;
    __int128 v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:", &v10, 5LL));
    cdSupportedAccessories = self->_cdSupportedAccessories;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_100009918;
    v8[3] = &unk_100206440;
    v8[4] = self;
    id v9 = v5;
    id v7 = v5;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:]( cdSupportedAccessories,  "enumerateKeysAndObjectsUsingBlock:",  v8);
  }

  else if (dword_1002341F0 <= 30 {
         && (dword_1002341F0 != -1 || _LogCategory_Initialize(&dword_1002341F0, 30LL)))
  }
  {
    LogPrintF( &dword_1002341F0,  "-[AAConversationDetectSessionManager _updateAccessoriesWithMotionState:]",  30LL,  "No CD supported accessories are connected");
  }

- (void)_updateAccessoriesWithPauseState
{
  if (-[NSMutableDictionary count](self->_cdSupportedAccessories, "count"))
  {
    uint64_t v3 = (uint64_t)-[AAConversationDetectSessionManager _getPauseMessage](self, "_getPauseMessage");
    __int16 v9 = v3;
    char v10 = BYTE2(v3);
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:", &v9, 3LL));
    cdSupportedAccessories = self->_cdSupportedAccessories;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_100009A70;
    v7[3] = &unk_100206440;
    void v7[4] = self;
    id v8 = v4;
    id v6 = v4;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:]( cdSupportedAccessories,  "enumerateKeysAndObjectsUsingBlock:",  v7);
  }

  else if (dword_1002341F0 <= 30 {
         && (dword_1002341F0 != -1 || _LogCategory_Initialize(&dword_1002341F0, 30LL)))
  }
  {
    LogPrintF( &dword_1002341F0,  "-[AAConversationDetectSessionManager _updateAccessoriesWithPauseState]",  30LL,  "No accessories connected");
  }

- (void)_updateAccessoriesWithResetState:(unsigned __int8)a3
{
  uint64_t v3 = a3;
  if (-[NSMutableDictionary count](self->_cdSupportedAccessories, "count"))
  {
    unsigned __int16 v10 = (unsigned __int16)-[AAConversationDetectSessionManager _getResetMessage:](self, "_getResetMessage:", v3);
    __int128 v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:", &v10, 2LL));
    cdSupportedAccessories = self->_cdSupportedAccessories;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_100009BC8;
    v8[3] = &unk_100206440;
    v8[4] = self;
    id v9 = v5;
    id v7 = v5;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:]( cdSupportedAccessories,  "enumerateKeysAndObjectsUsingBlock:",  v8);
  }

  else if (dword_1002341F0 <= 30 {
         && (dword_1002341F0 != -1 || _LogCategory_Initialize(&dword_1002341F0, 30LL)))
  }
  {
    LogPrintF( &dword_1002341F0,  "-[AAConversationDetectSessionManager _updateAccessoriesWithResetState:]",  30LL,  "No accessories connected");
  }

- (void)_updateConversationDetectSignal:(int)a3
{
  unsigned int cdSignal = self->_cdSignal;
  if (cdSignal != a3)
  {
    if (dword_1002341F0 <= 30)
    {
      if (dword_1002341F0 != -1)
      {
LABEL_4:
        if (cdSignal > 0xB) {
          id v6 = "?";
        }
        else {
          id v6 = (&off_100206510)[cdSignal];
        }
        else {
          id v7 = (&off_100206510)[a3];
        }
        LogPrintF( &dword_1002341F0,  "-[AAConversationDetectSessionManager _updateConversationDetectSignal:]",  30LL,  "Conversation detect signal updated %s -> %s",  v6,  v7);
        goto LABEL_13;
      }

      if (_LogCategory_Initialize(&dword_1002341F0, 30LL))
      {
        unsigned int cdSignal = self->_cdSignal;
        goto LABEL_4;
      }
    }

- (void)_updatePauseState
{
  unint64_t currentSpeechDetectionStyle = self->_currentSpeechDetectionStyle;
  BOOL isWirelessSplitterOn = self->_isWirelessSplitterOn;
  BOOL pauseConversationDetect = self->_isWirelessSplitterOn || currentSpeechDetectionStyle == 4;
  self->_BOOL pauseConversationDetect = pauseConversationDetect;
  if (dword_1002341F0 <= 30)
  {
    if (dword_1002341F0 == -1)
    {
      if (!_LogCategory_Initialize(&dword_1002341F0, 30LL))
      {
LABEL_19:
        BOOL pauseConversationDetect = self->_pauseConversationDetect;
        goto LABEL_20;
      }

      BOOL pauseConversationDetect = self->_pauseConversationDetect;
      BOOL isWirelessSplitterOn = self->_isWirelessSplitterOn;
    }

    id v7 = "yes";
    if (pauseConversationDetect) {
      id v8 = "yes";
    }
    else {
      id v8 = "no";
    }
    if (isWirelessSplitterOn) {
      id v9 = "yes";
    }
    else {
      id v9 = "no";
    }
    if (currentSpeechDetectionStyle != 4) {
      id v7 = "no";
    }
    LogPrintF( &dword_1002341F0,  "-[AAConversationDetectSessionManager _updatePauseState]",  30LL,  "Updated pause conversation state to: %s, isWirelessSplitterOn: %s, isSpeechDetectionStyleDisallowed: %s",  v8,  v9,  v7);
    goto LABEL_19;
  }

- (void)_audioSessionEnsureStarted
{
  if (!self->_audioSessionActivated)
  {
    uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[AVAudioSession sharedInstance](&OBJC_CLASS___AVAudioSession, "sharedInstance"));
    uint64_t v4 = kMXSessionProperty_InterruptionStyle;
    __int128 v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", 32LL));
    id v11 = 0LL;
    [v3 setMXSessionProperty:v4 value:v5 error:&v11];
    id v6 = v11;

    if (dword_1002341F0 <= 30
      && (dword_1002341F0 != -1 || _LogCategory_Initialize(&dword_1002341F0, 30LL)))
    {
      LogPrintF( &dword_1002341F0,  "-[AAConversationDetectSessionManager _audioSessionEnsureStarted]",  30LL,  "Activating AVAudioSession");
    }

    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[AVAudioSession sharedInstance](&OBJC_CLASS___AVAudioSession, "sharedInstance"));
    id v10 = v6;
    [v7 setActive:1 error:&v10];
    id v8 = v10;

    if (v8)
    {
      if (dword_1002341F0 <= 90
        && (dword_1002341F0 != -1 || _LogCategory_Initialize(&dword_1002341F0, 90LL)))
      {
        LogPrintF( &dword_1002341F0,  "-[AAConversationDetectSessionManager _audioSessionEnsureStarted]",  90LL,  "Failed to activate the AVAudioSession with error %@",  v8);
      }
    }

    else
    {
      id v9 = self;
      objc_sync_enter(v9);
      self->_audioSessionActivated = 1;
      objc_sync_exit(v9);
    }
  }

- (void)_audioSessionEnsureStopped
{
  obj = self;
  objc_sync_enter(obj);
  if (obj->_audioSessionActivated)
  {
    if (dword_1002341F0 <= 30
      && (dword_1002341F0 != -1 || _LogCategory_Initialize(&dword_1002341F0, 30LL)))
    {
      LogPrintF( &dword_1002341F0,  "-[AAConversationDetectSessionManager _audioSessionEnsureStopped]",  30LL,  "Deactivating AVAudioSession");
    }

    v2 = (void *)objc_claimAutoreleasedReturnValue(+[AVAudioSession sharedInstance](&OBJC_CLASS___AVAudioSession, "sharedInstance"));
    id v9 = 0LL;
    [v2 setDuckingFadeOutDuration:0 fadeInDuration:0 error:&v9];
    id v3 = v9;

    if (v3
      && dword_1002341F0 <= 90
      && (dword_1002341F0 != -1 || _LogCategory_Initialize(&dword_1002341F0, 90LL)))
    {
      LogPrintF( &dword_1002341F0,  "-[AAConversationDetectSessionManager _audioSessionEnsureStopped]",  90LL,  "Failed to reset AVAudioSession ramp duration");
    }

    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[AVAudioSession sharedInstance](&OBJC_CLASS___AVAudioSession, "sharedInstance"));
    id v8 = v3;
    [v4 setActive:0 withOptions:1 error:&v8];
    id v5 = v8;

    if (v5
      && dword_1002341F0 <= 90
      && (dword_1002341F0 != -1 || _LogCategory_Initialize(&dword_1002341F0, 90LL)))
    {
      LogPrintF( &dword_1002341F0,  "-[AAConversationDetectSessionManager _audioSessionEnsureStopped]",  90LL,  "Failed to invalidate AVAudioSession");
    }

    obj->_audioSessionActivated = 0;

    objc_sync_exit(obj);
    -[AAConversationDetectSessionManager setCdSignalAudioInterrupted:](obj, "setCdSignalAudioInterrupted:", 0LL);
    if (dword_1002341F0 <= 30
      && (dword_1002341F0 != -1 || _LogCategory_Initialize(&dword_1002341F0, 30LL)))
    {
      LogPrintF( &dword_1002341F0,  "-[AAConversationDetectSessionManager _audioSessionEnsureStopped]",  30LL,  "Posting CdSignalAudioInterruptedChanged notification");
    }

    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v6 postNotificationName:@"CdSignalAudioInterruptedChanged" object:obj];
  }

  else
  {
    objc_sync_exit(obj);
  }

- (void)_calibrateDuckingLevelForVolumeLevel:(float)a3
{
  LODWORD(v8) = 1051663008;
  LODWORD(v3) = -1088088021;
  LODWORD(v4) = 1052974986;
  *(float *)&double v5 = a3;
  -[AAConversationDetectSessionManager _duckingLevelForCoefficients:volume:]( self,  "_duckingLevelForCoefficients:volume:",  v8,  v3,  v4,  v5);
  float v10 = v9;
  LODWORD(v11) = 1052069016;
  LODWORD(v12) = -1088373234;
  LODWORD(v13) = 1049629609;
  *(float *)&double v14 = a3;
  -[AAConversationDetectSessionManager _duckingLevelForCoefficients:volume:]( self,  "_duckingLevelForCoefficients:volume:",  v11,  v12,  v13,  v14);
  float v16 = v15;
  LODWORD(v17) = 1054847323;
  LODWORD(v18) = -1085663714;
  LODWORD(v19) = 1058727893;
  *(float *)&double v20 = a3;
  -[AAConversationDetectSessionManager _duckingLevelForCoefficients:volume:]( self,  "_duckingLevelForCoefficients:volume:",  v17,  v18,  v19,  v20);
  float v22 = v21;
  if (dword_1002341F0 <= 30 && (dword_1002341F0 != -1 || _LogCategory_Initialize(&dword_1002341F0, 30LL))) {
    LogPrintF( &dword_1002341F0,  "-[AAConversationDetectSessionManager _calibrateDuckingLevelForVolumeLevel:]",  30LL,  "Calibrated levels for custom ducking curve, start: %0.2f, latch: %0.2f, unlatch: %0.2f",  v10,  v16,  v22);
  }
  self->_cdSignalAudioTunings.startSignalTunables.float signalDuckingLevel = v10;
  self->_cdSignalAudioTunings.latch1SignalTunables.float signalDuckingLevel = v16;
  self->_cdSignalAudioTunings.latch2SignalTunables.float signalDuckingLevel = v16;
  self->_cdSignalAudioTunings.unlatchSignalTunables.float signalDuckingLevel = v22;
}

- (void)_cdSessionSignalUpdate
{
  double v3 = self->_duckLevel;
  duckLevel = self->_duckLevel;
  self->_duckLevel = 0LL;

  rampDuration = self->_rampDuration;
  self->_rampDuration = 0LL;

  id v6 = self;
  objc_sync_enter(v6);
  v6->_shouldQueueRamp = 0;
  objc_sync_exit(v6);

  unduckLevel = v6->_unduckLevel;
  v6->_unduckLevel = 0LL;

  int v9 = 0;
  uint64_t v10 = 28LL;
  uint64_t v11 = 3LL;
  switch(v6->_cdSignal)
  {
    case 1:
      goto LABEL_4;
    case 2:
      *(float *)&double v8 = v6->_cdSignalAudioTunings.latch1SignalTunables.signalRampDurationSecs;
      double v12 = (NSNumber *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:", v8));
      double v13 = self->_rampDuration;
      self->_rampDuration = v12;

      *(float *)&double v14 = v6->_cdSignalAudioTunings.latch1SignalTunables.signalDuckingLevel;
      float v15 = (NSNumber *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:", v14));
      float v16 = self->_duckLevel;
      self->_duckLevel = v15;

      int v17 = 0;
      int v18 = 0;
      int v9 = 1;
      goto LABEL_23;
    case 3:
      *(float *)&double v8 = v6->_cdSignalAudioTunings.unlatchSignalTunables.signalRampDurationSecs;
      id v24 = (NSNumber *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:", v8));
      id v25 = self->_rampDuration;
      self->_rampDuration = v24;

      *(float *)&double v26 = v6->_cdSignalAudioTunings.unlatchSignalTunables.signalDuckingLevel;
      uint64_t v27 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:", v26));
      id v28 = v6->_unduckLevel;
      v6->_unduckLevel = (NSNumber *)v27;

      id v29 = v6;
      objc_sync_enter(v29);
      v6->_shouldQueueRamp = _os_feature_enabled_impl("MediaExperience", "AsyncDucking") ^ 1;
      objc_sync_exit(v29);

      goto LABEL_22;
    case 4:
      *(float *)&double v8 = v6->_cdSignalAudioTunings.end1SignalTunables.signalRampDurationSecs;
      id v30 = (NSNumber *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:", v8));
      id v31 = self->_rampDuration;
      self->_rampDuration = v30;

      *(float *)&double v32 = v6->_cdSignalAudioTunings.end1SignalTunables.signalDuckingLevel;
      goto LABEL_18;
    case 5:
      int v9 = 1;
      uint64_t v10 = 44LL;
      uint64_t v11 = 5LL;
LABEL_4:
      LODWORD(v8) = *(_DWORD *)((char *)&v6->super.isa + v10);
      double v19 = (NSNumber *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:", v8));
      double v20 = self->_rampDuration;
      self->_rampDuration = v19;

      LODWORD(v21) = (&v6->super.isa)[v11];
      float v22 = (NSNumber *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:", v21));
      id v23 = self->_duckLevel;
      self->_duckLevel = v22;

      if (!v6->_audioSessionActivated)
      {
        if (v6->_prefCDShouldDisableCustomDuckingCurve)
        {
          if (dword_1002341F0 <= 30
            && (dword_1002341F0 != -1 || _LogCategory_Initialize(&dword_1002341F0, 30LL)))
          {
            LogPrintF( &dword_1002341F0,  "-[AAConversationDetectSessionManager _cdSessionSignalUpdate]",  30LL,  "Custom ducking curve disabled, use default ducking levels");
          }
        }

        else
        {
          id v52 = (void *)objc_claimAutoreleasedReturnValue(+[AVSystemController sharedInstance](&OBJC_CLASS___AVSystemController, "sharedInstance"));
          [v52 getActiveCategoryVolume:&v6->_currentVolume andName:0];

          if (dword_1002341F0 <= 30
            && (dword_1002341F0 != -1 || _LogCategory_Initialize(&dword_1002341F0, 30LL)))
          {
            LogPrintF( &dword_1002341F0,  "-[AAConversationDetectSessionManager _cdSessionSignalUpdate]",  30LL,  "Custom ducking curve enabled, current volume level %f",  v6->_currentVolume);
          }

          *(float *)&double v53 = v6->_currentVolume;
          -[AAConversationDetectSessionManager _calibrateDuckingLevelForVolumeLevel:]( v6,  "_calibrateDuckingLevelForVolumeLevel:",  v53);
        }
      }

      int v17 = 0;
      int v18 = 1;
      goto LABEL_23;
    case 6:
      *(float *)&double v8 = v6->_cdSignalAudioTunings.end2SignalTunables.signalRampDurationSecs;
      id v33 = (NSNumber *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:", v8));
      id v34 = self->_rampDuration;
      self->_rampDuration = v33;

      *(float *)&double v32 = v6->_cdSignalAudioTunings.end2SignalTunables.signalDuckingLevel;
      goto LABEL_18;
    case 7:
      *(float *)&double v8 = v6->_cdSignalAudioTunings.resetSignalTunables.signalRampDurationSecs;
      id v35 = (NSNumber *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:", v8));
      id v36 = self->_rampDuration;
      self->_rampDuration = v35;

      *(float *)&double v32 = v6->_cdSignalAudioTunings.resetSignalTunables.signalDuckingLevel;
      goto LABEL_18;
    case 8:
      *(float *)&double v8 = v6->_cdSignalAudioTunings.pauseSignalTunables.signalRampDurationSecs;
      float v37 = (NSNumber *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:", v8));
      float v38 = self->_rampDuration;
      self->_rampDuration = v37;

      *(float *)&double v32 = v6->_cdSignalAudioTunings.pauseSignalTunables.signalDuckingLevel;
LABEL_18:
      uint64_t v39 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:", v32));
      float v40 = v6->_unduckLevel;
      v6->_unduckLevel = (NSNumber *)v39;
      goto LABEL_19;
    case 9:
      float v40 = self->_rampDuration;
      self->_rampDuration = (NSNumber *)&off_100218928;
LABEL_19:

      int v9 = 0;
      int v18 = 0;
      int v17 = 1;
      goto LABEL_23;
    case 0xA:
      if (dword_1002341F0 <= 30
        && (dword_1002341F0 != -1 || _LogCategory_Initialize(&dword_1002341F0, 30LL)))
      {
        LogPrintF( &dword_1002341F0,  "-[AAConversationDetectSessionManager _cdSessionSignalUpdate]",  30LL,  "Ignoring pause signal due to siri");
      }

      goto LABEL_67;
    case 0xB:
      -[AAConversationDetectSessionManager _audioSessionEnsureStopped](v6, "_audioSessionEnsureStopped");
LABEL_22:
      int v17 = 0;
      int v9 = 0;
      int v18 = 0;
LABEL_23:
      int v41 = 0;
      unint64_t currentSpeechDetectionStyle = v6->_currentSpeechDetectionStyle;
      if (currentSpeechDetectionStyle < 2)
      {
        BOOL v43 = 0LL;
        goto LABEL_36;
      }

      if (currentSpeechDetectionStyle == 3) {
        goto LABEL_34;
      }
      if (currentSpeechDetectionStyle != 2)
      {
        if (dword_1002341F0 <= 30)
        {
          if (dword_1002341F0 == -1)
          {
            unint64_t currentSpeechDetectionStyle = v6->_currentSpeechDetectionStyle;
          }

          if (currentSpeechDetectionStyle > 6) {
            float v44 = "?";
          }
          else {
            float v44 = (&off_100206598)[currentSpeechDetectionStyle];
          }
          LogPrintF( &dword_1002341F0,  "-[AAConversationDetectSessionManager _cdSessionSignalUpdate]",  30LL,  "AVAudioSessionSpeechDetectionStyle: %s, stop CD session",  v44);
        }

- (void)_cdSessionEnsureActivated:(BOOL)a3
{
  if (self->_pauseConversationDetect)
  {
    if (dword_1002341F0 <= 30
      && (dword_1002341F0 != -1 || _LogCategory_Initialize(&dword_1002341F0, 30LL)))
    {
      LogPrintF( &dword_1002341F0,  "-[AAConversationDetectSessionManager _cdSessionEnsureActivated:]",  30LL,  "Failed to activate session, CD is currently paused on host");
    }
  }

  else if (a3)
  {
    -[AAConversationDetectSessionManager _audioSessionEnsureStarted](self, "_audioSessionEnsureStarted");
  }

- (void)_cdSessionEnsureDeactivated:(unsigned __int8)a3
{
  uint64_t v3 = a3;
  -[AAConversationDetectSessionManager _audioSessionEnsureStopped](self, "_audioSessionEnsureStopped");
  if ((_DWORD)v3)
  {
    if (dword_1002341F0 <= 30
      && (dword_1002341F0 != -1 || _LogCategory_Initialize(&dword_1002341F0, 30LL)))
    {
      double v5 = "?";
      if ((_DWORD)v3 == 1) {
        double v5 = "MediaStyleChange";
      }
      if ((_DWORD)v3 == 2) {
        double v5 = "VolumeUp";
      }
      LogPrintF( &dword_1002341F0,  "-[AAConversationDetectSessionManager _cdSessionEnsureDeactivated:]",  30LL,  "Sending reset to accessories, reset reason: %s ",  v5);
    }

    -[AAConversationDetectSessionManager _updateAccessoriesWithResetState:]( self,  "_updateAccessoriesWithResetState:",  v3);
  }

- (float)_duckingLevelForCoefficients:(id)a3 volume:(float)a4
{
  return a3.var2 + (float)((float)(a3.var1 * a4) + (float)((float)(a3.var0 * a4) * a4));
}

- (void)_asyncAudioSessionDuckWithLevel:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  chunkedRampingQueue = (dispatch_queue_s *)self->_chunkedRampingQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10000ACE8;
  block[3] = &unk_100206220;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(chunkedRampingQueue, block);
}

- (void)_audioSessionReset
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10000AFD8;
  block[3] = &unk_100206058;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_deregisterFromAudioSessionResetNotifications
{
  if (self->_avAudioSessionResetNotificationRegistered)
  {
    if (dword_1002341F0 <= 30
      && (dword_1002341F0 != -1 || _LogCategory_Initialize(&dword_1002341F0, 30LL)))
    {
      LogPrintF( &dword_1002341F0,  "-[AAConversationDetectSessionManager _deregisterFromAudioSessionResetNotifications]",  30LL,  "Deregistering from AVAudioSessionMediaServicesWereResetNotification");
    }

    uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v3 removeObserver:self name:AVAudioSessionMediaServicesWereResetNotification object:0];

    self->_avAudioSessionResetNotificationRegistered = 0;
  }

- (void)_deregisterFromAVAudioSessionSpeechDetectionStyleChanges
{
  if (self->_cdStyleChangeNotificationRegistered)
  {
    if (dword_1002341F0 <= 30
      && (dword_1002341F0 != -1 || _LogCategory_Initialize(&dword_1002341F0, 30LL)))
    {
      LogPrintF( &dword_1002341F0,  "-[AAConversationDetectSessionManager _deregisterFromAVAudioSessionSpeechDetectionStyleChanges]",  30LL,  "Deregistering from AVAudioSessionSpeechDetectionStyle changes");
    }

    uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[AVAudioSession sharedInstance](&OBJC_CLASS___AVAudioSession, "sharedInstance"));
    [v3 removeObserver:self forKeyPath:@"speechDetectionStyle"];

    self->_cdStyleChangeNotificationRegistered = 0;
  }

- (void)_startQueuedRampForDuration:(id)a3 startLevel:(id)a4 endLevel:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = v10;
  if (v9 && v10 && ([v9 floatValue], float v13 = v12, objc_msgSend(v11, "floatValue"), v13 < v14))
  {
    if (dword_1002341F0 <= 30
      && (dword_1002341F0 != -1 || _LogCategory_Initialize(&dword_1002341F0, 30LL)))
    {
      LogPrintF( &dword_1002341F0,  "-[AAConversationDetectSessionManager _startQueuedRampForDuration:startLevel:endLevel:]",  30LL,  "Queued Ramp: startLevel: %@, endLevel: %@, rampDuration: %@",  v9,  v11,  v8);
    }

    [v8 floatValue];
    unint64_t v16 = (unint64_t)(v15 / self->_prefCDRampChunkDuration);
    uint64_t v44 = 0LL;
    id v45 = (float *)&v44;
    uint64_t v46 = 0x2020000000LL;
    [v11 floatValue];
    float v18 = v17;
    [v9 floatValue];
    float v47 = (float)(v18 - v19) / (float)v16;
    uint64_t v40 = 0LL;
    int v41 = (float *)&v40;
    uint64_t v42 = 0x2020000000LL;
    [v9 floatValue];
    float v43 = v20 + v45[6];
    float v21 = v41[6];
    [v11 floatValue];
    if (v21 > v22)
    {
      [v11 floatValue];
      *((_DWORD *)v41 + 6) = v23;
    }

    if (dword_1002341F0 <= 30
      && (dword_1002341F0 != -1 || _LogCategory_Initialize(&dword_1002341F0, 30LL)))
    {
      LogPrintF( &dword_1002341F0,  "-[AAConversationDetectSessionManager _startQueuedRampForDuration:startLevel:endLevel:]",  30LL,  "Queued Ramp: number of ramps: %d, Delta duck Level: %f",  v16,  v45[6]);
    }

    uint64_t v34 = 0LL;
    id v35 = &v34;
    uint64_t v36 = 0x3032000000LL;
    float v37 = sub_10000B508;
    float v38 = sub_10000B530;
    id v39 = 0LL;
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472LL;
    v28[2] = sub_10000B538;
    v28[3] = &unk_100206468;
    id v31 = &v40;
    id v29 = v11;
    id v30 = self;
    double v32 = &v44;
    id v33 = &v34;
    id v24 = objc_retainBlock(v28);
    id v25 = (void *)v35[5];
    v35[5] = (uint64_t)v24;

    *(float *)&double v26 = v41[6];
    uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:", v26));
    -[AAConversationDetectSessionManager _asyncAudioSessionDuckWithLevel:completion:]( self,  "_asyncAudioSessionDuckWithLevel:completion:",  v27,  v35[5]);

    _Block_object_dispose(&v34, 8);
    _Block_object_dispose(&v40, 8);
    _Block_object_dispose(&v44, 8);
  }

  else if (dword_1002341F0 <= 30 {
         && (dword_1002341F0 != -1 || _LogCategory_Initialize(&dword_1002341F0, 30LL)))
  }
  {
    LogPrintF( &dword_1002341F0,  "-[AAConversationDetectSessionManager _startQueuedRampForDuration:startLevel:endLevel:]",  30LL,  "Queued Ramp: only supported during an unduck, startLevel: %@, endLevel: %@",  v9,  v11);
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v8 = a3;
  id v9 = a5;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10000B744;
  block[3] = &unk_100206490;
  id v14 = v8;
  id v15 = v9;
  unint64_t v16 = self;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(dispatchQueue, block);
}

- (void)_registerForAudioSessionResetNotifications
{
  if (!self->_avAudioSessionResetNotificationRegistered)
  {
    if (dword_1002341F0 <= 30
      && (dword_1002341F0 != -1 || _LogCategory_Initialize(&dword_1002341F0, 30LL)))
    {
      LogPrintF( &dword_1002341F0,  "-[AAConversationDetectSessionManager _registerForAudioSessionResetNotifications]",  30LL,  "Registering for AVAudioSessionMediaServicesWereResetNotification");
    }

    uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    double v4 = (void *)objc_claimAutoreleasedReturnValue(+[AVAudioSession sharedInstance](&OBJC_CLASS___AVAudioSession, "sharedInstance"));
    [v3 addObserver:self selector:"_audioSessionReset" name:AVAudioSessionMediaServicesWereResetNotification object:v4];

    self->_avAudioSessionResetNotificationRegistered = 1;
  }

- (void)_registerForAVAudioSessionSpeechDetectionStyleChanges
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[AVAudioSession sharedInstance](&OBJC_CLASS___AVAudioSession, "sharedInstance"));
  id v9 = 0LL;
  [v3 setCategory:AVAudioSessionCategorySpeechDetection withOptions:2 error:&v9];
  id v4 = v9;

  if (v4
    && dword_1002341F0 <= 90
    && (dword_1002341F0 != -1 || _LogCategory_Initialize(&dword_1002341F0, 90LL)))
  {
    LogPrintF( &dword_1002341F0,  "-[AAConversationDetectSessionManager _registerForAVAudioSessionSpeechDetectionStyleChanges]",  90LL,  "Failed to set AVAudioSession Category for Speech Detect with error %@",  v4);
  }

  if (!self->_cdStyleChangeNotificationRegistered)
  {
    if (dword_1002341F0 <= 30
      && (dword_1002341F0 != -1 || _LogCategory_Initialize(&dword_1002341F0, 30LL)))
    {
      LogPrintF( &dword_1002341F0,  "-[AAConversationDetectSessionManager _registerForAVAudioSessionSpeechDetectionStyleChanges]",  30LL,  "Registering for AVAudioSessionSpeechDetectionStyle changes");
    }

    double v5 = (void *)objc_claimAutoreleasedReturnValue(+[AVAudioSession sharedInstance](&OBJC_CLASS___AVAudioSession, "sharedInstance"));
    [v5 addObserver:self forKeyPath:@"speechDetectionStyle" options:5 context:0];

    self->_cdStyleChangeNotificationRegistered = 1;
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[AVAudioSession sharedInstance](&OBJC_CLASS___AVAudioSession, "sharedInstance"));
  self->_unint64_t currentSpeechDetectionStyle = (unint64_t)[v6 speechDetectionStyle];

  if (dword_1002341F0 <= 30 && (dword_1002341F0 != -1 || _LogCategory_Initialize(&dword_1002341F0, 30LL)))
  {
    unint64_t currentSpeechDetectionStyle = self->_currentSpeechDetectionStyle;
    if (currentSpeechDetectionStyle > 6) {
      id v8 = "?";
    }
    else {
      id v8 = (&off_100206598)[currentSpeechDetectionStyle];
    }
    LogPrintF( &dword_1002341F0,  "-[AAConversationDetectSessionManager _registerForAVAudioSessionSpeechDetectionStyleChanges]",  30LL,  "AVAudioSessionSpeechDetectionStyle current value : %s",  v8);
  }

  if (self->_currentSpeechDetectionStyle == 4) {
    self->_currentPauseReason = 2;
  }
  -[AAConversationDetectSessionManager _updatePauseState](self, "_updatePauseState");
}

- (void)_speechDetectionStyleChanged:(unint64_t)a3
{
  if (a3 - 5 <= 1)
  {
    -[AAConversationDetectSessionManager _speechDetectionUserVolumeChanged:](self, "_speechDetectionUserVolumeChanged:");
    return;
  }

  unint64_t currentSpeechDetectionStyle = self->_currentSpeechDetectionStyle;
  if (currentSpeechDetectionStyle != a3)
  {
    if (dword_1002341F0 <= 30)
    {
      unint64_t v6 = self->_currentSpeechDetectionStyle;
      if (dword_1002341F0 == -1)
      {
        unint64_t v6 = self->_currentSpeechDetectionStyle;
      }

      if (v6 > 6) {
        id v7 = "?";
      }
      else {
        id v7 = (&off_100206598)[v6];
      }
      if (a3 > 4) {
        id v8 = "?";
      }
      else {
        id v8 = (&off_100206570)[a3];
      }
      LogPrintF( &dword_1002341F0,  "-[AAConversationDetectSessionManager _speechDetectionStyleChanged:]",  30LL,  "AVAudioSessionSpeechDetectionStyle changed from %s -> %s",  v7,  v8);
    }

- (void)_speechDetectionUserVolumeChanged:(unint64_t)a3
{
  if (dword_1002341F0 <= 30 && (dword_1002341F0 != -1 || _LogCategory_Initialize(&dword_1002341F0, 30LL)))
  {
    if (a3 > 6) {
      double v5 = "?";
    }
    else {
      double v5 = (&off_100206598)[a3];
    }
    LogPrintF( &dword_1002341F0,  "-[AAConversationDetectSessionManager _speechDetectionUserVolumeChanged:]",  30LL,  "User %s change notification received",  v5);
  }

  if (a3 == 5 && self->_audioSessionActivated && !self->_cdSignalAudioInterrupted) {
    -[AAConversationDetectSessionManager _cdSessionEnsureDeactivated:](self, "_cdSessionEnsureDeactivated:", 2LL);
  }
}

- (void)_deviceFound:(id)a3
{
  id v9 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v9 identifier]);
  if (v4)
  {
    if ([v9 conversationDetectCapability] == 1)
    {
      double v5 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_cdSupportedAccessories,  "objectForKeyedSubscript:",  v4));
      cdSupportedAccessories = self->_cdSupportedAccessories;
      if (!cdSupportedAccessories)
      {
        id v7 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
        id v8 = self->_cdSupportedAccessories;
        self->_cdSupportedAccessories = v7;

        cdSupportedAccessories = self->_cdSupportedAccessories;
      }

      if (!-[NSMutableDictionary count](cdSupportedAccessories, "count")) {
        -[AAConversationDetectSessionManager _activateCDSession](self, "_activateCDSession");
      }
      -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_cdSupportedAccessories,  "setObject:forKeyedSubscript:",  v9,  v4);
      if (v5)
      {
        if (dword_1002341F0 <= 10
          && (dword_1002341F0 != -1 || _LogCategory_Initialize(&dword_1002341F0, 10LL)))
        {
          LogPrintF( &dword_1002341F0,  "-[AAConversationDetectSessionManager _deviceFound:]",  10LL,  "Ignoring existing CBDevice: %@",  v9);
        }
      }

      else
      {
        if (dword_1002341F0 <= 30
          && (dword_1002341F0 != -1 || _LogCategory_Initialize(&dword_1002341F0, 30LL)))
        {
          LogPrintF( &dword_1002341F0,  "-[AAConversationDetectSessionManager _deviceFound:]",  30LL,  "Connected device found: %@\n",  v9);
        }

        -[AAConversationDetectSessionManager _updatePauseState](self, "_updatePauseState");
      }
    }

    else if (dword_1002341F0 <= 10 {
           && (dword_1002341F0 != -1 || _LogCategory_Initialize(&dword_1002341F0, 10LL)))
    }
    {
      LogPrintF( &dword_1002341F0,  "-[AAConversationDetectSessionManager _deviceFound:]",  10LL,  "Connected device not conversation detect capable %@",  v9);
    }
  }

  else if (dword_1002341F0 <= 90 {
         && (dword_1002341F0 != -1 || _LogCategory_Initialize(&dword_1002341F0, 90LL)))
  }
  {
    LogPrintF( &dword_1002341F0,  "-[AAConversationDetectSessionManager _deviceFound:]",  90LL,  "CBDevice identifier not found, %@",  v9);
  }
}

- (void)_deviceLost:(id)a3
{
  id v6 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v6 identifier]);
  if (v4)
  {
    double v5 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_cdSupportedAccessories,  "objectForKeyedSubscript:",  v4));
    if (v5)
    {
      -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_cdSupportedAccessories,  "setObject:forKeyedSubscript:",  0LL,  v4);
      if (dword_1002341F0 <= 30
        && (dword_1002341F0 != -1 || _LogCategory_Initialize(&dword_1002341F0, 30LL)))
      {
        LogPrintF( &dword_1002341F0,  "-[AAConversationDetectSessionManager _deviceLost:]",  30LL,  "Connected device lost: %@",  v6);
      }

      if (!-[NSMutableDictionary count](self->_cdSupportedAccessories, "count")) {
        -[AAConversationDetectSessionManager _invalidateCDSession](self, "_invalidateCDSession");
      }
    }
  }

  else if (dword_1002341F0 <= 90 {
         && (dword_1002341F0 != -1 || _LogCategory_Initialize(&dword_1002341F0, 90LL)))
  }
  {
    LogPrintF( &dword_1002341F0,  "-[AAConversationDetectSessionManager _deviceLost:]",  90LL,  "CBDevice identifier not found, %@",  v6);
  }
}

- (void)_registerForWirelessSplitterStateChanges
{
  p_splitterStateOnToken = &self->_splitterStateOnToken;
  if (self->_splitterStateOnToken == -1)
  {
    if (dword_1002341F0 <= 30
      && (dword_1002341F0 != -1 || _LogCategory_Initialize(&dword_1002341F0, 30LL)))
    {
      LogPrintF( &dword_1002341F0,  "-[AAConversationDetectSessionManager _registerForWirelessSplitterStateChanges]",  30LL,  "Registering for wireless splitter state changes");
    }

    dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472LL;
    handler[2] = sub_10000C214;
    handler[3] = &unk_100206308;
    handler[4] = self;
    notify_register_dispatch("com.apple.bluetooth.WirelessSplitterOn", p_splitterStateOnToken, dispatchQueue, handler);
  }

- (void)_deregisterFromWirelessSplitterStateChanges
{
  int splitterStateOnToken = self->_splitterStateOnToken;
  if (splitterStateOnToken != -1)
  {
    if (dword_1002341F0 > 30) {
      goto LABEL_7;
    }
    if (dword_1002341F0 != -1 || _LogCategory_Initialize(&dword_1002341F0, 30LL)) {
      LogPrintF( &dword_1002341F0,  "-[AAConversationDetectSessionManager _deregisterFromWirelessSplitterStateChanges]",  30LL,  "Deregistering from wireless splitter state changes");
    }
    int splitterStateOnToken = self->_splitterStateOnToken;
    if (splitterStateOnToken != -1)
    {
LABEL_7:
      notify_cancel(splitterStateOnToken);
      self->_int splitterStateOnToken = -1;
    }
  }

  self->_BOOL isWirelessSplitterOn = 0;
  -[AAConversationDetectSessionManager _updatePauseState](self, "_updatePauseState");
}

- (BOOL)cdSignalAudioInterrupted
{
  return self->_cdSignalAudioInterrupted;
}

- (NSString)currentCDDeviceIdentifier
{
  return self->_currentCDDeviceIdentifier;
}

- (void).cxx_destruct
{
}

@end
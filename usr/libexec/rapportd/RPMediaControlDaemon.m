@interface RPMediaControlDaemon
- (BOOL)activateAndReturnError:(id *)a3;
- (RPMediaControlDaemon)init;
- (RPMessageable)messenger;
- (id)sendInterestEventHandler;
- (void)_handleCommand:(id)a3 responseHandler:(id)a4;
- (void)_handleGetVolume:(id)a3 responseHandler:(id)a4;
- (void)_handleMediaCaptionGet:(id)a3 responseHandler:(id)a4;
- (void)_handleMediaCaptionSet:(id)a3 responseHandler:(id)a4;
- (void)_handleMovementCommand:(unsigned int)a3 endCommand:(unsigned int)a4;
- (void)_handleSetVolume:(id)a3 responseHandler:(id)a4;
- (void)_handleSkipByRequest:(id)a3 responseHandler:(id)a4;
- (void)_mediaControlEnsureStarted;
- (void)_mediaControlEnsureStopped;
- (void)_mediaControlFlagsUpdate:(unint64_t)a3 mask:(unint64_t)a4;
- (void)_mediaRemoteSupportedCommandsChanged;
- (void)_mediaRemoteSupportedCommandsGet;
- (void)_mediaRemoteVolumeControlChanged:(id)a3;
- (void)_mediaRemoteVolumeControlUpdate;
- (void)_update;
- (void)deregisteredEventID:(id)a3;
- (void)invalidate;
- (void)registeredEventID:(id)a3;
- (void)setMessenger:(id)a3;
- (void)setSendInterestEventHandler:(id)a3;
@end

@implementation RPMediaControlDaemon

- (RPMediaControlDaemon)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___RPMediaControlDaemon;
  v2 = -[RPMediaControlDaemon init](&v6, "init");
  v3 = v2;
  if (v2)
  {
    objc_storeStrong((id *)&v2->_dispatchQueue, &_dispatch_main_q);
    v3->_volumeControlNotifyToken = -1;
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
    if (dword_100132260 <= 30
      && (dword_100132260 != -1 || _LogCategory_Initialize(&dword_100132260, 30LL)))
    {
      LogPrintF(&dword_100132260, "-[RPMediaControlDaemon activateAndReturnError:]", 30LL, "Activate\n");
    }

    v20 = @"statusFlags";
    v21 = &off_10011B018;
    v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v21,  &v20,  1LL));
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472LL;
    v19[2] = sub_10006AAD4;
    v19[3] = &unk_100111BE8;
    v19[4] = self;
    -[RPMessageable registerRequestID:options:handler:]( v13,  "registerRequestID:options:handler:",  @"_mcc",  v16,  v19);
  }

  else
  {
    id v14 = RPErrorF(4294960591LL, (uint64_t)"No messenger provided", v7, v8, v9, v10, v11, v12, v18);
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    if (dword_100132260 <= 90
      && (dword_100132260 != -1 || _LogCategory_Initialize(&dword_100132260, 90LL)))
    {
      LogPrintF( &dword_100132260,  "-[RPMediaControlDaemon activateAndReturnError:]",  90LL,  "### Activate failed: %{error}\n",  v15);
    }

    if (a3) {
      *a3 = v15;
    }
  }

  return v13 != 0LL;
}

- (void)invalidate
{
  if (self->_movementEndTimer)
  {
    if (dword_100132260 <= 30
      && (dword_100132260 != -1 || _LogCategory_Initialize(&dword_100132260, 30LL)))
    {
      LogPrintF(&dword_100132260, "-[RPMediaControlDaemon invalidate]", 30LL, "Auto-ending movement on invalidate\n");
    }

    MRMediaRemoteSendCommand(self->_movementEndCommand, 0LL);
    self->_movementCommand = 3;
    movementEndTimer = self->_movementEndTimer;
    if (movementEndTimer)
    {
      v4 = movementEndTimer;
      dispatch_source_cancel(v4);
      v5 = self->_movementEndTimer;
      self->_movementEndTimer = 0LL;
    }
  }

  -[RPMessageable deregisterRequestID:](self->_messenger, "deregisterRequestID:", @"_mcc");
  messenger = self->_messenger;
  self->_messenger = 0LL;

  id sendInterestEventHandler = self->_sendInterestEventHandler;
  self->_id sendInterestEventHandler = 0LL;

  -[RPMediaControlDaemon _mediaControlEnsureStopped](self, "_mediaControlEnsureStopped");
}

- (void)registeredEventID:(id)a3
{
  if ([a3 isEqual:@"_iMC"])
  {
    self->_mediaControlInterest = 1;
    -[RPMediaControlDaemon _update](self, "_update");
  }

- (void)deregisteredEventID:(id)a3
{
  if ([a3 isEqual:@"_iMC"])
  {
    self->_mediaControlInterest = 0;
    -[RPMediaControlDaemon _update](self, "_update");
  }

- (void)_update
{
  if (self->_mediaControlInterest) {
    -[RPMediaControlDaemon _mediaControlEnsureStarted](self, "_mediaControlEnsureStarted");
  }
  else {
    -[RPMediaControlDaemon _mediaControlEnsureStopped](self, "_mediaControlEnsureStopped");
  }
}

- (void)_mediaControlEnsureStarted
{
  if (!self->_mediaRemoteCommandObserving)
  {
    if (dword_100132260 <= 30
      && (dword_100132260 != -1 || _LogCategory_Initialize(&dword_100132260, 30LL)))
    {
      LogPrintF( &dword_100132260,  "-[RPMediaControlDaemon _mediaControlEnsureStarted]",  30LL,  "MediaRemote changes start\n");
    }

    MRMediaRemoteSetWantsSupportedCommandsChangedNotifications(1LL);
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v3 addObserver:self selector:"_mediaRemoteSupportedCommandsChanged" name:kMRMediaRemoteSupportedCommandsDidChangeNotification object:0];
    self->_mediaRemoteCommandObserving = 1;
    -[RPMediaControlDaemon _mediaRemoteSupportedCommandsGet](self, "_mediaRemoteSupportedCommandsGet");
  }

  if (self->_mediaRemoteVolumeObserving)
  {
    if (!self->_sendInterestEventHandler) {
      goto LABEL_17;
    }
    if (dword_100132260 <= 30
      && (dword_100132260 != -1 || _LogCategory_Initialize(&dword_100132260, 30LL)))
    {
      LogPrintF( &dword_100132260,  "-[RPMediaControlDaemon _mediaControlEnsureStarted]",  30LL,  "Sending current media control flags\n");
    }

    id sendInterestEventHandler = (void (**)(id, const __CFString *, void *))self->_sendInterestEventHandler;
    v17 = @"_mcF";
    v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  self->_mediaControlFlags));
    uint64_t v18 = v4;
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v18,  &v17,  1LL));
    sendInterestEventHandler[2](sendInterestEventHandler, @"_iMC", v8);
  }

  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v4 addObserver:self selector:"_mediaRemoteVolumeControlChanged:" name:kMRAVEndpointVolumeControlCapabilitiesDidChangeNotification object:0];
    self->_mediaRemoteVolumeObserving = 1;
    self->_mediaRemoteVolumeCaps = 0;
    uint64_t LocalEndpoint = MRAVEndpointGetLocalEndpoint(0LL);
    if (LocalEndpoint)
    {
      dispatchQueue = self->_dispatchQueue;
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472LL;
      v16[2] = sub_10006B060;
      v16[3] = &unk_1001134B8;
      v16[4] = self;
      MRAVEndpointGetVolumeControlCapabilities(LocalEndpoint, dispatchQueue, v16);
    }
  }

LABEL_17:
  if (self->_volumeControlNotifyToken != -1) {
    return;
  }
  uint64_t v9 = (dispatch_queue_s *)self->_dispatchQueue;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472LL;
  handler[2] = sub_10006B11C;
  handler[3] = &unk_1001115C8;
  handler[4] = self;
  notify_register_dispatch( "com.apple.PineBoard.volume-control-available",  &self->_volumeControlNotifyToken,  v9,  handler);
  id v10 = [(Class)off_1001322D0[0]() sharedConnection];
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 mediaRemoteServiceProxy]);

  if (!v12)
  {
    if (dword_100132260 <= 90
      && (dword_100132260 != -1 || _LogCategory_Initialize(&dword_100132260, 90LL)))
    {
      LogPrintF( &dword_100132260,  "-[RPMediaControlDaemon _mediaControlEnsureStarted]",  90LL,  "Get PBS mediaRemoteServiceProxy failed. Unable to obtain volume control availability.");
    }

    self->_unsigned int volumeControlEnabledPB = 0;
    goto LABEL_31;
  }

  unsigned int volumeControlEnabledPB = [v12 volumeControlAvailable];
  self->_unsigned int volumeControlEnabledPB = volumeControlEnabledPB;
  if (dword_100132260 <= 30)
  {
    if (dword_100132260 != -1)
    {
LABEL_21:
      id v14 = "yes";
      if (!volumeControlEnabledPB) {
        id v14 = "no";
      }
      LogPrintF( &dword_100132260,  "-[RPMediaControlDaemon _mediaControlEnsureStarted]",  30LL,  "Volume control available initial PB: %s\n",  v14);
      goto LABEL_31;
    }

    if (_LogCategory_Initialize(&dword_100132260, 30LL))
    {
      unsigned int volumeControlEnabledPB = self->_volumeControlEnabledPB;
      goto LABEL_21;
    }
  }

- (void)_mediaControlEnsureStopped
{
  if (self->_mediaRemoteCommandObserving)
  {
    if (dword_100132260 <= 30
      && (dword_100132260 != -1 || _LogCategory_Initialize(&dword_100132260, 30LL)))
    {
      LogPrintF( &dword_100132260,  "-[RPMediaControlDaemon _mediaControlEnsureStopped]",  30LL,  "MediaRemote changes stop\n");
    }

    MRMediaRemoteSetWantsSupportedCommandsChangedNotifications(0LL);
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v3 removeObserver:self name:kMRMediaRemoteSupportedCommandsDidChangeNotification object:0];
    self->_mediaRemoteCommandObserving = 0;
  }

  if (self->_mediaRemoteVolumeObserving)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v4 removeObserver:self name:kMRAVEndpointVolumeControlCapabilitiesDidChangeNotification object:0];
    self->_mediaRemoteVolumeObserving = 0;
  }

  int volumeControlNotifyToken = self->_volumeControlNotifyToken;
  if (volumeControlNotifyToken != -1)
  {
    notify_cancel(volumeControlNotifyToken);
    self->_int volumeControlNotifyToken = -1;
  }

  self->_mediaControlFlags = 0LL;
}

- (void)_mediaControlFlagsUpdate:(unint64_t)a3 mask:(unint64_t)a4
{
  unint64_t mediaControlFlags = self->_mediaControlFlags;
  unint64_t v5 = mediaControlFlags & ~a4 | a4 & a3;
  if (v5 != mediaControlFlags)
  {
    if (dword_100132260 <= 30
      && (dword_100132260 != -1 || _LogCategory_Initialize(&dword_100132260, 30LL)))
    {
      LogPrintF( &dword_100132260,  "-[RPMediaControlDaemon _mediaControlFlagsUpdate:mask:]",  30LL,  "MediaControl flags changed: %ll{flags}\n",  v5,  &unk_10010A5F0);
    }

    self->_unint64_t mediaControlFlags = v5;
    uint64_t v7 = (void (**)(id, const __CFString *, void *))objc_retainBlock(self->_sendInterestEventHandler);
    if (v7)
    {
      id v10 = @"_mcF";
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", v5));
      uint64_t v11 = v8;
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v11,  &v10,  1LL));
      v7[2](v7, @"_iMC", v9);
    }
  }

- (void)_mediaRemoteSupportedCommandsChanged
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10006B4AC;
  block[3] = &unk_1001110A8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_mediaRemoteSupportedCommandsGet
{
  if (!self->_mediaRemoteCommandGetting)
  {
    if (dword_100132260 <= 30
      && (dword_100132260 != -1 || _LogCategory_Initialize(&dword_100132260, 30LL)))
    {
      LogPrintF( &dword_100132260,  "-[RPMediaControlDaemon _mediaRemoteSupportedCommandsGet]",  30LL,  "MediaRemote supported commands get\n");
    }

    self->_mediaRemoteCommandGetting = 1;
    dispatchQueue = self->_dispatchQueue;
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472LL;
    v4[2] = sub_10006B5F4;
    v4[3] = &unk_1001134E0;
    v4[4] = self;
    MRMediaRemoteGetSupportedCommands(dispatchQueue, v4);
  }

- (void)_mediaRemoteVolumeControlChanged:(id)a3
{
  id v4 = a3;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10006B8A0;
  v7[3] = &unk_100111968;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

- (void)_mediaRemoteVolumeControlUpdate
{
  if (self->_mediaRemoteVolumeCaps) {
    unint64_t v2 = 256LL;
  }
  else {
    unint64_t v2 = (unint64_t)self->_volumeControlEnabledPB << 8;
  }
  -[RPMediaControlDaemon _mediaControlFlagsUpdate:mask:](self, "_mediaControlFlagsUpdate:mask:", v2, 256LL);
}

- (void)_handleCommand:(id)a3 responseHandler:(id)a4
{
  id v25 = a3;
  id v6 = a4;
  uint64_t Int64Ranged = CFDictionaryGetInt64Ranged(v25, @"_mcc", 0xFFFFFFFF80000000LL, 0x7FFFFFFFLL, 0LL);
  if (dword_100132260 <= 30 && (dword_100132260 != -1 || _LogCategory_Initialize(&dword_100132260, 30LL)))
  {
    else {
      id v14 = off_100113560[(int)Int64Ranged];
    }
    LogPrintF( &dword_100132260,  "-[RPMediaControlDaemon _handleCommand:responseHandler:]",  30LL,  "Command <%s>, %##.16@\n",  v14,  v25);
  }

  switch((int)Int64Ranged)
  {
    case 1:
      uint64_t v15 = 0LL;
      goto LABEL_17;
    case 2:
      uint64_t v15 = 1LL;
      goto LABEL_17;
    case 3:
      uint64_t v15 = 4LL;
      goto LABEL_17;
    case 4:
      uint64_t v15 = 5LL;
LABEL_17:
      MRMediaRemoteSendCommand(v15, 0LL);
      goto LABEL_28;
    case 5:
      -[RPMediaControlDaemon _handleGetVolume:responseHandler:](self, "_handleGetVolume:responseHandler:", v25, v6);
      break;
    case 6:
      -[RPMediaControlDaemon _handleSetVolume:responseHandler:](self, "_handleSetVolume:responseHandler:", v25, v6);
      break;
    case 7:
      -[RPMediaControlDaemon _handleSkipByRequest:responseHandler:]( self,  "_handleSkipByRequest:responseHandler:",  v25,  v6);
      break;
    case 8:
      uint64_t v18 = self;
      uint64_t v19 = 8LL;
      uint64_t v20 = 9LL;
      goto LABEL_24;
    case 9:
      uint64_t v21 = 9LL;
      goto LABEL_26;
    case 10:
      uint64_t v18 = self;
      uint64_t v19 = 10LL;
      uint64_t v20 = 11LL;
LABEL_24:
      -[RPMediaControlDaemon _handleMovementCommand:endCommand:](v18, "_handleMovementCommand:endCommand:", v19, v20);
      goto LABEL_28;
    case 11:
      uint64_t v21 = 11LL;
LABEL_26:
      MRMediaRemoteSendCommand(v21, 0LL);
      self->_movementCommand = 3;
      movementEndTimer = self->_movementEndTimer;
      if (movementEndTimer)
      {
        v23 = movementEndTimer;
        dispatch_source_cancel(v23);
        v24 = self->_movementEndTimer;
        self->_movementEndTimer = 0LL;
      }

- (void)_handleMediaCaptionGet:(id)a3 responseHandler:(id)a4
{
  id v10 = a3;
  id v5 = a4;
  unint64_t v6 = ((uint64_t (*)(uint64_t))off_1001322E0[0])(1LL);
  if (v6 > 2) {
    uint64_t v7 = 0LL;
  }
  else {
    uint64_t v7 = dword_10010A654[v6];
  }
  if (dword_100132260 <= 30 && (dword_100132260 != -1 || _LogCategory_Initialize(&dword_100132260, 30LL))) {
    LogPrintF( &dword_100132260,  "-[RPMediaControlDaemon _handleMediaCaptionGet:responseHandler:]",  30LL,  "MediaCaptionGet: %s\n",  off_1001135D0[(int)v7]);
  }
  uint64_t v8 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v7));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v8, "setObject:forKeyedSubscript:", v9, @"_mcs");

  (*((void (**)(id, NSMutableDictionary *, void, void))v5 + 2))(v5, v8, 0LL, 0LL);
}

- (void)_handleMediaCaptionSet:(id)a3 responseHandler:(id)a4
{
  id v5 = a4;
  uint64_t Int64Ranged = CFDictionaryGetInt64Ranged(a3, @"_mcs", 0xFFFFFFFF80000000LL, 0x7FFFFFFFLL, &v19);
  if (v19)
  {
    id v13 = RPErrorF(4294960591LL, (uint64_t)"No media caption setting", v7, v8, v9, v10, v11, v12, v18);
LABEL_3:
    id v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    if (dword_100132260 <= 90
      && (dword_100132260 != -1 || _LogCategory_Initialize(&dword_100132260, 90LL)))
    {
      LogPrintF( &dword_100132260,  "-[RPMediaControlDaemon _handleMediaCaptionSet:responseHandler:]",  90LL,  "### MediaCaptionSet failed: %{error}\n",  v14);
    }

    (*((void (**)(id, void, void, void *))v5 + 2))(v5, 0LL, 0LL, v14);
  }

  else
  {
    unsigned int v15 = Int64Ranged - 1;
    uint64_t v16 = 0LL;
    switch((int)Int64Ranged)
    {
      case 1:
        uint64_t v16 = 1LL;
        break;
      case 2:
        uint64_t v16 = 2LL;
        break;
      case 3:
        break;
      case 4:
        uint64_t v16 = 2LL * (((uint64_t (*)(uint64_t))off_1001322E0[0])(1LL) != 2);
        break;
      default:
        id v13 = RPErrorF(4294960591LL, (uint64_t)"Bad media caption setting: %d", v7, v8, v9, v10, v11, v12, Int64Ranged);
        goto LABEL_3;
    }

    if (dword_100132260 <= 30
      && (dword_100132260 != -1 || _LogCategory_Initialize(&dword_100132260, 30LL)))
    {
      if (v15 > 3) {
        v17 = "?";
      }
      else {
        v17 = off_1001135F0[v15];
      }
      LogPrintF( &dword_100132260,  "-[RPMediaControlDaemon _handleMediaCaptionSet:responseHandler:]",  30LL,  "MediaCaptionSet: %s (%d)\n",  v17,  v16);
    }

    off_1001322E8(1LL, v16);
    (*((void (**)(id, void *, void, void))v5 + 2))(v5, &__NSDictionary0__struct, 0LL, 0LL);
  }
}

- (void)_handleMovementCommand:(unsigned int)a3 endCommand:(unsigned int)a4
{
  if (self->_movementCommand != a3)
  {
    MRMediaRemoteSendCommand(*(void *)&a3, 0LL);
    self->_movementCommand = a3;
  }

  self->_movementEndCommand = a4;
  movementEndTimer = self->_movementEndTimer;
  if (movementEndTimer)
  {
    CUDispatchTimerSet(movementEndTimer, 15.0, -1.0, -4.0);
  }

  else
  {
    uint64_t v8 = (OS_dispatch_source *)dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_timer,  0LL,  0LL,  (dispatch_queue_t)self->_dispatchQueue);
    uint64_t v9 = self->_movementEndTimer;
    self->_movementEndTimer = v8;

    uint64_t v10 = self->_movementEndTimer;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472LL;
    handler[2] = sub_10006C080;
    handler[3] = &unk_1001110A8;
    handler[4] = self;
    dispatch_source_set_event_handler((dispatch_source_t)v10, handler);
    CUDispatchTimerSet(self->_movementEndTimer, 15.0, -1.0, -4.0);
    dispatch_resume((dispatch_object_t)self->_movementEndTimer);
  }

- (void)_handleSkipByRequest:(id)a3 responseHandler:(id)a4
{
  id v5 = a4;
  double Double = CFDictionaryGetDouble(a3, @"_skpS", &v9);
  if (v9) {
    double Double = 10.0;
  }
  if (Double < 0.0) {
    uint64_t v7 = 18LL;
  }
  else {
    uint64_t v7 = 17LL;
  }
  uint64_t v10 = kMRMediaRemoteOptionSkipInterval;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", fabs(Double)));
  uint64_t v11 = v8;
  MRMediaRemoteSendCommand( v7,  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v11,  &v10,  1LL));

  (*((void (**)(id, void *, void, void))v5 + 2))(v5, &__NSDictionary0__struct, 0LL, 0LL);
}

- (void)_handleGetVolume:(id)a3 responseHandler:(id)a4
{
  id v4 = a4;
  id v5 = [(Class)off_1001322D8[0]() sharedAVSystemController];
  unint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  float v19 = 0.0;
  unsigned __int8 v13 = [v6 getVolume:&v19 forCategory:@"MediaPlayback"];
  if (dword_100132260 <= 30 && (dword_100132260 != -1 || _LogCategory_Initialize(&dword_100132260, 30LL))) {
    LogPrintF( &dword_100132260,  "-[RPMediaControlDaemon _handleGetVolume:responseHandler:]",  30LL,  "Get volume: %f, %#m\n",  v19);
  }
  if ((v13 & 1) != 0)
  {
    id v14 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    *(float *)&double v15 = v19;
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:", v15));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v14, "setObject:forKeyedSubscript:", v16, @"_vol");

    (*((void (**)(id, NSMutableDictionary *, void, void))v4 + 2))(v4, v14, 0LL, 0LL);
  }

  else
  {
    id v17 = RPErrorF(4294960596LL, (uint64_t)"AVSystemController getVolume failed", v7, v8, v9, v10, v11, v12, v18);
    id v14 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(v17);
    if (dword_100132260 <= 90
      && (dword_100132260 != -1 || _LogCategory_Initialize(&dword_100132260, 90LL)))
    {
      LogPrintF( &dword_100132260,  "-[RPMediaControlDaemon _handleGetVolume:responseHandler:]",  90LL,  "### Get volume failed: %{error}\n",  v14);
    }

    (*((void (**)(id, void, void, NSMutableDictionary *))v4 + 2))(v4, 0LL, 0LL, v14);
  }
}

- (void)_handleSetVolume:(id)a3 responseHandler:(id)a4
{
  id v5 = a4;
  double Double = CFDictionaryGetDouble(a3, @"_vol", &v36);
  uint64_t v13 = v36;
  if (v36)
  {
    id v14 = "No volume";
    goto LABEL_8;
  }

  double v15 = Double;
  if (Double < 0.0 || Double > 1.0)
  {
    uint64_t v34 = *(void *)&Double;
    id v14 = "Volume ouf of range (%f)";
    uint64_t v13 = 4294960586LL;
LABEL_8:
    id v17 = RPErrorF(v13, (uint64_t)v14, v6, v7, v8, v9, v10, v11, v34);
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
    if (dword_100132260 <= 90
      && (dword_100132260 != -1 || _LogCategory_Initialize(&dword_100132260, 90LL)))
    {
      LogPrintF( &dword_100132260,  "-[RPMediaControlDaemon _handleSetVolume:responseHandler:]",  90LL,  "### Set volume failed: %{error}\n",  v18);
    }

    (*((void (**)(id, void, void, void *))v5 + 2))(v5, 0LL, 0LL, v18);
    goto LABEL_16;
  }

  if (dword_100132260 <= 30 && (dword_100132260 != -1 || _LogCategory_Initialize(&dword_100132260, 30LL))) {
    LogPrintF( &dword_100132260,  "-[RPMediaControlDaemon _handleSetVolume:responseHandler:]",  30LL,  "Set volume: %f\n",  v15);
  }
  id v19 = [(Class)off_1001322D8[0]() sharedAVSystemController];
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(v19);
  float v20 = v15;
  *(float *)&double v21 = v20;
  unsigned int v22 = [v18 setVolumeTo:@"MediaPlayback" forCategory:v21];
  if (v22) {
    int v29 = 0;
  }
  else {
    int v29 = -6700;
  }
  unsigned int v36 = v29;
  if ((v22 & 1) != 0)
  {
    float v35 = 0.0;
    if (([v18 getVolume:&v35 forCategory:@"MediaPlayback"] & 1) == 0)
    {
      if (dword_100132260 <= 90
        && (dword_100132260 != -1 || _LogCategory_Initialize(&dword_100132260, 90LL)))
      {
        LogPrintF( &dword_100132260,  "-[RPMediaControlDaemon _handleSetVolume:responseHandler:]",  90LL,  "### Get volume after set failed\n");
      }

      float v35 = v20;
    }

    v31 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    *(float *)&double v32 = v35;
    v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:", v32));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v31, "setObject:forKeyedSubscript:", v33, @"_vol");

    (*((void (**)(id, NSMutableDictionary *, void, void))v5 + 2))(v5, v31, 0LL, 0LL);
  }

  else
  {
    id v30 = RPErrorF(4294960596LL, (uint64_t)"AVSystemController getVolume failed", v23, v24, v25, v26, v27, v28, v34);
    v31 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(v30);
    if (dword_100132260 <= 90
      && (dword_100132260 != -1 || _LogCategory_Initialize(&dword_100132260, 90LL)))
    {
      LogPrintF( &dword_100132260,  "-[RPMediaControlDaemon _handleSetVolume:responseHandler:]",  90LL,  "### Get volume failed: %{error}\n",  v31);
    }

    (*((void (**)(id, void, void, NSMutableDictionary *))v5 + 2))(v5, 0LL, 0LL, v31);
  }

LABEL_16:
}

- (RPMessageable)messenger
{
  return self->_messenger;
}

- (void)setMessenger:(id)a3
{
}

- (id)sendInterestEventHandler
{
  return self->_sendInterestEventHandler;
}

- (void)setSendInterestEventHandler:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
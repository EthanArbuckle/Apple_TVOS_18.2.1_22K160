@interface PBScreenSharingObserver
+ (id)sharedInstance;
+ (unint64_t)nextSessionID;
- (BOOL)_isScreenSharingActive;
- (BOOL)isObserving;
- (PBBulletinService)bulletinService;
- (PBSBulletin)currentBulletin;
- (PBScreenSharingObserver)init;
- (id)_screenSharingDeviceName;
- (unint64_t)currentSessionID;
- (void)_delayedScreenSharingBulletinRefresh;
- (void)_handleScreenSharingActiveDidChange:(BOOL)a3;
- (void)_pairedDevicesChanged;
- (void)_resetBulletinState:(BOOL)a3;
- (void)_terminateScreenSharing;
- (void)_updateHUDStateForSessionID:(unint64_t)a3;
- (void)bulletinService:(id)a3 didDismissBulletin:(id)a4 withReason:(unint64_t)a5;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setBulletinService:(id)a3;
- (void)setCurrentBulletin:(id)a3;
- (void)setCurrentSessionID:(unint64_t)a3;
- (void)setObserving:(BOOL)a3;
- (void)startObserving;
- (void)stopObserving;
@end

@implementation PBScreenSharingObserver

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100193A9C;
  block[3] = &unk_1003D0680;
  block[4] = a1;
  if (qword_100471220 != -1) {
    dispatch_once(&qword_100471220, block);
  }
  return (id)qword_100471218;
}

- (PBScreenSharingObserver)init
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___PBScreenSharingObserver;
  v2 = -[PBScreenSharingObserver init](&v10, "init");
  if (v2)
  {
    v3 = -[PBBulletinService initWithRemoteConnection:]( objc_alloc(&OBJC_CLASS___PBBulletinService),  "initWithRemoteConnection:",  0LL);
    bulletinService = v2->_bulletinService;
    v2->_bulletinService = v3;

    -[PBBulletinService setDelegate:](v2->_bulletinService, "setDelegate:", v2);
    dispatch_time_t v5 = dispatch_time(0LL, 5000000000LL);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100193BB4;
    block[3] = &unk_1003CFF08;
    v6 = v2;
    v9 = v6;
    dispatch_after(v5, &_dispatch_main_q, block);
    v6->_pairedDevicesNotifier = -1;
  }

  return v2;
}

- (void)startObserving
{
  if (!self->_observing)
  {
    self->_observing = 1;
    v3 = (void *)objc_claimAutoreleasedReturnValue( +[PBAVSystemControllerCache sharedInstance]( &OBJC_CLASS___PBAVSystemControllerCache,  "sharedInstance"));
    [v3 addObserver:self forKeyPath:@"airplayDisplayActive" options:4 context:off_10046CD18];
    id v4 = sub_100083D20();
    dispatch_time_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Start observing external screen changes.",  buf,  2u);
    }

    int pairedDevicesNotifier = self->_pairedDevicesNotifier;
    self->_observing = 1;
    if (pairedDevicesNotifier == -1)
    {
      handler[0] = _NSConcreteStackBlock;
      handler[1] = 3221225472LL;
      handler[2] = sub_100193D38;
      handler[3] = &unk_1003DAB78;
      handler[4] = self;
      notify_register_dispatch( "com.apple.pairing.peerChanged",  &self->_pairedDevicesNotifier,  &_dispatch_main_q,  handler);
    }
  }

- (void)stopObserving
{
  if (self->_observing)
  {
    self->_observing = 0;
    v3 = (void *)objc_claimAutoreleasedReturnValue( +[PBAVSystemControllerCache sharedInstance]( &OBJC_CLASS___PBAVSystemControllerCache,  "sharedInstance"));
    [v3 removeObserver:self forKeyPath:@"airplayDisplayActive" context:off_10046CD18];
    id v4 = sub_100083D20();
    dispatch_time_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Stop observing external screen changes.",  v7,  2u);
    }

    int pairedDevicesNotifier = self->_pairedDevicesNotifier;
    if (pairedDevicesNotifier != -1)
    {
      notify_cancel(pairedDevicesNotifier);
      self->_int pairedDevicesNotifier = -1;
    }
  }

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (off_10046CD18 == a6)
  {
    -[PBScreenSharingObserver _handleScreenSharingActiveDidChange:]( self,  "_handleScreenSharingActiveDidChange:",  objc_msgSend(a5, "tvs_BOOLForKey:defaultValue:", NSKeyValueChangeNewKey, 0));
  }

  else
  {
    v6.receiver = self;
    v6.super_class = (Class)&OBJC_CLASS___PBScreenSharingObserver;
    -[PBScreenSharingObserver observeValueForKeyPath:ofObject:change:context:]( &v6,  "observeValueForKeyPath:ofObject:change:context:",  a3,  a4,  a5);
  }

- (void)_handleScreenSharingActiveDidChange:(BOOL)a3
{
  BOOL v3 = a3;
  dispatch_assert_queue_V2(&_dispatch_main_q);
  if (self->_observing)
  {
    id v5 = sub_100083D20();
    objc_super v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
    if (v3)
    {
      if (v7)
      {
        __int16 v11 = 0;
        v8 = "External Screen Change Notification: remote viewing is active.";
        v9 = (uint8_t *)&v11;
LABEL_7:
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, v8, v9, 2u);
      }
    }

    else if (v7)
    {
      __int16 v10 = 0;
      v8 = "External Screen Change Notification: remote viewing is not active.";
      v9 = (uint8_t *)&v10;
      goto LABEL_7;
    }

    -[PBScreenSharingObserver _resetBulletinState:](self, "_resetBulletinState:", v3);
  }

- (BOOL)_isScreenSharingActive
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[PBAVSystemControllerCache sharedInstance](&OBJC_CLASS___PBAVSystemControllerCache, "sharedInstance"));
  unsigned __int8 v3 = [v2 isAirplayDisplayActive];

  return v3;
}

- (id)_screenSharingDeviceName
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( +[AVOutputContext sharedSystemScreenContext]( &OBJC_CLASS___AVOutputContext,  "sharedSystemScreenContext"));
  unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue([v2 outputDevice]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 name]);

  return v4;
}

- (void)_terminateScreenSharing
{
  id v2 = sub_100083D20();
  unsigned __int8 v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)objc_super v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Tearing down screen sharing session.", v6, 2u);
  }

  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[AVOutputContext sharedSystemScreenContext]( &OBJC_CLASS___AVOutputContext,  "sharedSystemScreenContext"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[AVOutputDevice sharedLocalDevice](&OBJC_CLASS___AVOutputDevice, "sharedLocalDevice"));
  [v4 setOutputDevice:v5 options:0];
}

- (void)_resetBulletinState:(BOOL)a3
{
  if (a3)
  {
    self->_currentSessionID = +[PBScreenSharingObserver nextSessionID]( &OBJC_CLASS___PBScreenSharingObserver,  "nextSessionID");
    id v4 = sub_100083D20();
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Resetting sharing bulletin state (is visible).",  buf,  2u);
    }

    objc_super v6 = (void *)objc_claimAutoreleasedReturnValue(-[PBScreenSharingObserver _screenSharingDeviceName](self, "_screenSharingDeviceName"));
    if (v6)
    {
      id v7 = sub_1001C307C(@"ScreenSharingAlertMessage", 0LL);
      v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v8, v6));
    }

    else
    {
      id v13 = sub_1001C307C(@"ScreenSharingAlertUnknownDeviceMessage", 0LL);
      v9 = (void *)objc_claimAutoreleasedReturnValue(v13);
    }

    v14 = objc_alloc(&OBJC_CLASS___NSAttributedString);
    id v15 = sub_1001C307C(@"ScreenSharingAlertSubmessage", 0LL);
    v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    v17 = -[NSAttributedString initWithString:](v14, "initWithString:", v16);

    id v18 = sub_1001C307C(@"ScreenSharingAlertTitle", 0LL);
    v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
    v20 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertController alertControllerWithTitle:message:preferredStyle:]( &OBJC_CLASS___UIAlertController,  "alertControllerWithTitle:message:preferredStyle:",  v19,  v9,  1LL));

    [v20 _setAttributedDetailMessage:v17];
    id v21 = sub_1001C307C(@"ScreenSharingAlertAllowSession", 0LL);
    v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472LL;
    v31[2] = sub_100194448;
    v31[3] = &unk_1003DABA0;
    v31[4] = self;
    v23 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v22,  0LL,  v31));

    id v24 = sub_1001C307C(@"ScreenSharingAlertCancelSession", 0LL);
    v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472LL;
    v30[2] = sub_1001944B8;
    v30[3] = &unk_1003DABA0;
    v30[4] = self;
    v26 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v25,  1LL,  v30));

    [v20 addAction:v23];
    [v20 addAction:v26];
    [v20 setPreferredAction:v26];
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[PBScreenSaverManager sharedInstance](&OBJC_CLASS___PBScreenSaverManager, "sharedInstance"));
    [v27 dismissScreenSaver];

    v28 = (void *)objc_claimAutoreleasedReturnValue( +[PBDialogContext contextWithViewController:]( &OBJC_CLASS___PBDialogContext,  "contextWithViewController:",  v20));
    v29 = (void *)objc_claimAutoreleasedReturnValue(+[PBDialogManager sharedInstance](&OBJC_CLASS___PBDialogManager, "sharedInstance"));
    [v29 presentDialogWithContext:v28 options:0 completion:0];
  }

  else
  {
    id v10 = sub_100083D20();
    __int16 v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Resetting sharing bulletin state (not visible).",  buf,  2u);
    }

    if (self->_currentBulletin)
    {
      -[PBBulletinService dismissBulletin:](self->_bulletinService, "dismissBulletin:");
      currentBulletin = self->_currentBulletin;
      self->_currentBulletin = 0LL;

      self->_currentSessionID = 0LL;
    }
  }

+ (unint64_t)nextSessionID
{
  return ++qword_100471228;
}

- (void)_updateHUDStateForSessionID:(unint64_t)a3
{
  id v5 = sub_100083D20();
  objc_super v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t currentSessionID = self->_currentSessionID;
    *(_DWORD *)buf = 134218240;
    unint64_t v30 = a3;
    __int16 v31 = 2048;
    unint64_t v32 = currentSessionID;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Updating screen sharing HUD state (in: %lu current: %lu).",  buf,  0x16u);
  }

  if (self->_currentSessionID == a3)
  {
    if (!self->_bulletinService)
    {
      v8 = -[PBBulletinService initWithRemoteConnection:]( objc_alloc(&OBJC_CLASS___PBBulletinService),  "initWithRemoteConnection:",  0LL);
      bulletinService = self->_bulletinService;
      self->_bulletinService = v8;

      -[PBBulletinService setDelegate:](self->_bulletinService, "setDelegate:", self);
    }

    if (self->_currentBulletin)
    {
      -[PBBulletinService dismissBulletin:](self->_bulletinService, "dismissBulletin:");
      currentBulletin = self->_currentBulletin;
      self->_currentBulletin = 0LL;
    }

    unsigned int v11 = -[PBScreenSharingObserver _isScreenSharingActive](self, "_isScreenSharingActive");
    id v12 = sub_100083D20();
    id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
    if (v11)
    {
      if (v14)
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Screen sharing is active.  Displaying HUD.",  buf,  2u);
      }

      id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
      -[os_log_s setObject:forKeyedSubscript:]( v13,  "setObject:forKeyedSubscript:",  &off_1003FDEC0,  PBSSystemBulletinStyleKey);
      id v15 = (void *)objc_claimAutoreleasedReturnValue(-[PBScreenSharingObserver _screenSharingDeviceName](self, "_screenSharingDeviceName"));
      if ([v15 length])
      {
        id v16 = sub_1001C307C(@"ScreenSharingActiveBulletinTitle", 0LL);
        v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
        id v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v17, v15));

        id v19 = sub_1001C307C(@"ScreenSharingActiveBulletinMessage", 0LL);
        v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
        id v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v20, v15));
      }

      else
      {
        id v22 = sub_1001C307C(@"ScreenSharingActiveUnknownDeviceBulletinTitle", 0LL);
        id v18 = (void *)objc_claimAutoreleasedReturnValue(v22);
        id v23 = sub_1001C307C(@"ScreenSharingActiveUnknownDeviceBulletinMessage", 0LL);
        id v21 = (void *)objc_claimAutoreleasedReturnValue(v23);
      }

      if ([v18 length]) {
        -[os_log_s setObject:forKeyedSubscript:](v13, "setObject:forKeyedSubscript:", v18, PBSSystemBulletinTitleKey);
      }
      if ([v21 length]) {
        -[os_log_s setObject:forKeyedSubscript:](v13, "setObject:forKeyedSubscript:", v21, PBSSystemBulletinMessageKey);
      }
      -[os_log_s setObject:forKeyedSubscript:]( v13,  "setObject:forKeyedSubscript:",  &off_1003FDED8,  PBSSystemBulletinTimeoutKey);
      -[os_log_s setObject:forKeyedSubscript:]( v13,  "setObject:forKeyedSubscript:",  PBSSystemBulletinImageIDScreenSharing,  PBSSystemBulletinImageIDKey);
      id v24 = objc_alloc_init(&OBJC_CLASS___PBSBulletin);
      -[PBSBulletin setMessage:](v24, "setMessage:", v13);
      -[PBSBulletin setViewControllerClassName:]( v24,  "setViewControllerClassName:",  PBSSystemBulletinViewControllerClassName);
      -[PBSBulletin setServiceIdentifier:](v24, "setServiceIdentifier:", PBSSystemBulletinServiceName);
      v25 = self->_bulletinService;
      v27[0] = _NSConcreteStackBlock;
      v27[1] = 3221225472LL;
      v27[2] = sub_100194904;
      v27[3] = &unk_1003D4A98;
      v27[4] = self;
      v28 = v24;
      v26 = v24;
      -[PBBulletinService presentBulletin:withCompletion:](v25, "presentBulletin:withCompletion:", v26, v27);
      -[PBScreenSharingObserver _delayedScreenSharingBulletinRefresh](self, "_delayedScreenSharingBulletinRefresh");
    }

    else if (v14)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Screen sharing inactive.", buf, 2u);
    }
  }

- (void)_delayedScreenSharingBulletinRefresh
{
  unint64_t v3 = -[PBScreenSharingObserver currentSessionID](self, "currentSessionID");
  dispatch_time_t v4 = dispatch_time(0LL, 1800000000000LL);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1001949A4;
  v5[3] = &unk_1003D05A8;
  v5[4] = self;
  v5[5] = v3;
  dispatch_after(v4, &_dispatch_main_q, v5);
}

- (void)bulletinService:(id)a3 didDismissBulletin:(id)a4 withReason:(unint64_t)a5
{
  objc_super v6 = (PBSBulletin *)a4;
  id v7 = v6;
  if (self->_currentBulletin == v6)
  {
    self->_currentBulletin = 0LL;

    self->_unint64_t currentSessionID = 0LL;
  }
}

- (void)_pairedDevicesChanged
{
  id v3 = sub_100083D20();
  dispatch_time_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    id v22 = "-[PBScreenSharingObserver _pairedDevicesChanged]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  if (-[PBScreenSharingObserver _isScreenSharingActive](self, "_isScreenSharingActive"))
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue( +[AVSystemController sharedAVSystemController]( &OBJC_CLASS___AVSystemController,  "sharedAVSystemController"));
    objc_super v6 = (void *)objc_claimAutoreleasedReturnValue([v5 attributeForKey:AVSystemController_PickedRouteAttribute]);

    if (v6)
    {
      id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:@"AirPlayPortExtendedInfo"]);
      if ((objc_opt_respondsToSelector(v7, "objectForKey:") & 1) != 0)
      {
        v8 = (os_log_s *)objc_claimAutoreleasedReturnValue([v7 objectForKey:@"deviceID"]);
        if (v8 && (uint64_t v9 = objc_opt_class(&OBJC_CLASS___NSString), (objc_opt_isKindOfClass(v8, v9) & 1) != 0))
        {
          id v10 = objc_alloc_init(&OBJC_CLASS___CUPairingManager);
          id v11 = objc_alloc_init(&OBJC_CLASS___CUPairedPeer);
          id v12 = -[NSUUID initWithUUIDString:](objc_alloc(&OBJC_CLASS___NSUUID), "initWithUUIDString:", v8);
          [v11 setIdentifier:v12];

          v18[0] = _NSConcreteStackBlock;
          v18[1] = 3221225472LL;
          v18[2] = sub_100194D78;
          v18[3] = &unk_1003DABC8;
          id v19 = v10;
          v20 = self;
          id v13 = v10;
          [v13 findPairedPeer:v11 options:4 completion:v18];
        }

        else
        {
          id v17 = sub_100083D20();
          id v11 = (id)objc_claimAutoreleasedReturnValue(v17);
          if (os_log_type_enabled((os_log_t)v11, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315394;
            id v22 = "-[PBScreenSharingObserver _pairedDevicesChanged]";
            __int16 v23 = 2048;
            id v24 = v8;
            _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v11,  OS_LOG_TYPE_DEFAULT,  "%s Device UUID not found or not a string (%p).  Ignoring.",  buf,  0x16u);
          }
        }
      }

      else
      {
        id v16 = sub_100083D20();
        v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315138;
          id v22 = "-[PBScreenSharingObserver _pairedDevicesChanged]";
          _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "%s Extended info not of the exptected type.  Ignoring.",  buf,  0xCu);
        }
      }
    }

    else
    {
      id v15 = sub_100083D20();
      id v7 = (void *)objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        id v22 = "-[PBScreenSharingObserver _pairedDevicesChanged]";
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v7,  OS_LOG_TYPE_DEFAULT,  "%s screen sharing claims to be active.  No external route found.",  buf,  0xCu);
      }
    }
  }

  else
  {
    id v14 = sub_100083D20();
    objc_super v6 = (void *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled((os_log_t)v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      id v22 = "-[PBScreenSharingObserver _pairedDevicesChanged]";
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v6,  OS_LOG_TYPE_DEFAULT,  "%s Screen sharing not active.  Ignoring.",  buf,  0xCu);
    }
  }
}

- (PBBulletinService)bulletinService
{
  return self->_bulletinService;
}

- (void)setBulletinService:(id)a3
{
}

- (PBSBulletin)currentBulletin
{
  return self->_currentBulletin;
}

- (void)setCurrentBulletin:(id)a3
{
}

- (BOOL)isObserving
{
  return self->_observing;
}

- (void)setObserving:(BOOL)a3
{
  self->_observing = a3;
}

- (unint64_t)currentSessionID
{
  return self->_currentSessionID;
}

- (void)setCurrentSessionID:(unint64_t)a3
{
  self->_unint64_t currentSessionID = a3;
}

- (void).cxx_destruct
{
}

@end
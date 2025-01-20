@interface MSCRODBrailleDisplayManager
+ (id)allocWithZone:(_NSZone *)a3;
+ (id)sharedManager;
+ (void)initialize;
- (BOOL)_brailleConfigMatch:(id)a3 withConfig:(id)a4;
- (BOOL)_hasActiveDisplay;
- (BOOL)_hasUserInteractedWithDeviceRecently;
- (BOOL)_registerSleepNotifications;
- (BOOL)airplaneMode;
- (BOOL)isBrailleSystemSleeping;
- (BOOL)isConfigured;
- (MSCRODBrailleDisplayManager)init;
- (RadiosPreferences)radiosPrefs;
- (id)_displayWithIOElement:(id)a3 driverIdentifier:(id)a4 delegate:(id)a5;
- (id)brailleInputManager;
- (id)driverConfiguration;
- (id)newBrailleDisplayCommandDispatcher;
- (unsigned)_rootPowerPort;
- (void)_delayedHandleSystemSleep;
- (void)_delayedPowerChangedNotification:(id)a3;
- (void)_delayedWakeFromSleep;
- (void)_eventQueue_begin;
- (void)_eventQueue_brailleDriverDisconnected:(id)a3;
- (void)_eventQueue_setMasterStatusCellIndex:(int64_t)a3;
- (void)_eventQueue_setVirtualStatusAlignment:(int)a3;
- (void)_handleSystemSleep;
- (void)_loadBluetoothDriverFromPreferences;
- (void)_loadBluetoothDriverWithAddress:(id)a3;
- (void)_reallyDelayedWakeFromSleep;
- (void)_registerHasBlankedScreenNotification;
- (void)_removeBluetoothDriverWithAddress:(id)a3;
- (void)_removeBluetoothDriverWithIOElement:(id)a3 removeFromPreferences:(BOOL)a4;
- (void)_saveBluetoothDisplayConfiguration:(id)a3;
- (void)_setupBluetooth;
- (void)_updateScreenUILock:(int)a3 screenBlank:(int)a4;
- (void)_wakeFromSleep;
- (void)addToDisplays:(id)a3;
- (void)airplaneModeChanged;
- (void)handleSettingsChange:(id)a3;
- (void)invalidate;
- (void)loadBluetoothDriverWithAddress:(id)a3;
- (void)powerChangedNotification:(id)a3;
- (void)removeBluetoothDriverWithAddress:(id)a3;
- (void)setAirplaneMode:(BOOL)a3;
- (void)setIsBrailleSystemSleeping:(BOOL)a3;
- (void)setLastUserInteractionTime:(double)a3;
- (void)setRadiosPrefs:(id)a3;
@end

@implementation MSCRODBrailleDisplayManager

+ (id)sharedManager
{
  return (id)qword_100019C18;
}

+ (void)initialize
{
  if ((id)objc_opt_class(&OBJC_CLASS___MSCRODBrailleDisplayManager, a2) == a1)
  {
    id v2 = [objc_allocWithZone((Class)MSCRODBrailleDisplayManager) init];
    v3 = (void *)qword_100019C18;
    qword_100019C18 = (uint64_t)v2;

    +[SCROBrailleDisplayManager _setSharedManager:]( &OBJC_CLASS___SCROBrailleDisplayManager,  "_setSharedManager:",  qword_100019C18);
  }

+ (id)allocWithZone:(_NSZone *)a3
{
  if (qword_100019C18) {
    return 0LL;
  }
  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___MSCRODBrailleDisplayManager;
  return objc_msgSendSuper2(&v4, "allocWithZone:", a3);
}

- (MSCRODBrailleDisplayManager)init
{
  id v2 = self;
  if (!qword_100019C18)
  {
    v23.receiver = self;
    v23.super_class = (Class)&OBJC_CLASS___MSCRODBrailleDisplayManager;
    v3 = -[MSCRODBrailleDisplayManager init](&v23, "init");
    id v2 = v3;
    if (v3)
    {
      [*(id *)&v3->SCROBrailleDisplayManager_opaque[OBJC_IVAR___SCROBrailleDisplayManager__managedDisplayQueue] setActiveQueueMaximumSize:32];
      objc_super v4 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
      displays = v2->_displays;
      v2->_displays = v4;

      v6 = (void *)_AXSVoiceOverTouchCopyBrailleTableIdentifier();
      uint64_t v8 = objc_opt_class(&OBJC_CLASS___NSString, v7);
      if ((objc_opt_isKindOfClass(v6, v8) & 1) != 0)
      {
        id v9 = [[BRLTTable alloc] initWithIdentifier:v6];
        v10 = (void *)objc_claimAutoreleasedReturnValue( +[SCROBrailleTranslationManager sharedManager]( &OBJC_CLASS___SCROBrailleTranslationManager,  "sharedManager"));
        v11 = (void *)objc_claimAutoreleasedReturnValue([v9 serviceIdentifier]);
        [v10 loadTranslatorWithServiceIdentifier:v11];

        v12 = (void *)objc_claimAutoreleasedReturnValue([v9 language]);
        [v10 setDefaultLanguage:v12];
      }

      *(_DWORD *)&v2->SCROBrailleDisplayManager_opaque[OBJC_IVAR___SCROBrailleDisplayManager__inputAccessMode] = 0;
      v2->SCROBrailleDisplayManager_opaque[OBJC_IVAR___SCROBrailleDisplayManager__showDotsSevenAndEight] = 1;
      DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterAddObserver( DarwinNotifyCenter,  v2,  (CFNotificationCallback)sub_100003AF8,  kAXSVoiceOverTouchBrailleMasterStatusCellIndexChangedNotification,  0LL,  CFNotificationSuspensionBehaviorDeliverImmediately);
      v14 = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterAddObserver( v14,  v2,  (CFNotificationCallback)sub_100003AF8,  kAXSVoiceOverTouchBrailleVirtualStatusAlignmentChangedNotification,  0LL,  CFNotificationSuspensionBehaviorDeliverImmediately);
      uint64_t v15 = _AXSVoiceOverTouchBrailleVirtualStatusAlignment();
      objc_msgSend( *(id *)&v2->SCROBrailleDisplayManager_opaque[OBJC_IVAR___SCROBrailleDisplayManager__status],  "setMasterStatusCellIndex:",  _AXSVoiceOverTouchBrailleMasterStatusCellIndex( objc_msgSend( *(id *)&v2->SCROBrailleDisplayManager_opaque[OBJC_IVAR___SCROBrailleDisplayManager__status],  "setVirtualAlignment:",  v15)));
      v2->SCROBrailleDisplayManager_opaque[OBJC_IVAR___SCROBrailleDisplayManager__isValid] = 1;
      v16 = objc_opt_new(&OBJC_CLASS___RadiosPreferences);
      -[MSCRODBrailleDisplayManager setRadiosPrefs:](v2, "setRadiosPrefs:", v16);

      v17 = (void *)objc_claimAutoreleasedReturnValue(-[MSCRODBrailleDisplayManager radiosPrefs](v2, "radiosPrefs"));
      [v17 setDelegate:v2];

      v18 = (void *)objc_claimAutoreleasedReturnValue(-[MSCRODBrailleDisplayManager radiosPrefs](v2, "radiosPrefs"));
      -[MSCRODBrailleDisplayManager setAirplaneMode:](v2, "setAirplaneMode:", [v18 airplaneMode]);

      v19 = *(dispatch_queue_s **)&v2->SCROBrailleDisplayManager_opaque[OBJC_IVAR___SCROBrailleDisplayManager__eventQueue];
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_100003B10;
      block[3] = &unk_100014770;
      id v2 = v2;
      v22 = v2;
      dispatch_async(v19, block);
    }
  }

  return v2;
}

- (void)handleSettingsChange:(id)a3
{
  id v5 = a3;
  if ([v5 isEqualToString:kAXSVoiceOverTouchBrailleContractionModeChangedNotification])
  {
    -[MSCRODBrailleDisplayManager setContractionMode:]( self,  "setContractionMode:",  _AXSVoiceOverTouchBrailleContractionMode());
  }

  else if ([v5 isEqualToString:kAXSVoiceOverTouchBrailleEightDotModeChangedNotification])
  {
    -[MSCRODBrailleDisplayManager setShowEightDotBraille:]( self,  "setShowEightDotBraille:",  _AXSVoiceOverTouchBrailleEightDotMode() != 0);
  }

  else if ([v5 isEqualToString:kAXSVoiceOverTouchBrailleVirtualStatusAlignmentChangedNotification])
  {
    -[MSCRODBrailleDisplayManager setVirtualStatusAlignment:]( self,  "setVirtualStatusAlignment:",  _AXSVoiceOverTouchBrailleVirtualStatusAlignment());
  }

  else
  {
    id v4 = [v5 isEqualToString:kAXSVoiceOverTouchBrailleMasterStatusCellIndexChangedNotification];
    if ((_DWORD)v4) {
      -[MSCRODBrailleDisplayManager setMasterStatusCellIndex:]( self,  "setMasterStatusCellIndex:",  _AXSVoiceOverTouchBrailleMasterStatusCellIndex(v4));
    }
  }
}

- (void)_eventQueue_begin
{
  if (self->SCROBrailleDisplayManager_opaque[OBJC_IVAR___SCROBrailleDisplayManager__isValid])
  {
    -[MSCRODBrailleDisplayManager _registerHasBlankedScreenNotification](self, "_registerHasBlankedScreenNotification");
    -[MSCRODBrailleDisplayManager _registerSleepNotifications](self, "_registerSleepNotifications");
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100003C98;
    block[3] = &unk_100014770;
    void block[4] = self;
    dispatch_async(&_dispatch_main_q, block);
    -[MSCRODBrailleDisplayManager _loadStealthDisplay](self, "_loadStealthDisplay");
  }

- (void)invalidate
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___MSCRODBrailleDisplayManager;
  -[MSCRODBrailleDisplayManager invalidate](&v4, "invalidate");
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);
}

- (void)_eventQueue_brailleDriverDisconnected:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___MSCRODBrailleDisplayManager;
  -[MSCRODBrailleDisplayManager _eventQueue_brailleDriverDisconnected:]( &v8,  "_eventQueue_brailleDriverDisconnected:",  v4);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_100003DC4;
  v6[3] = &unk_100014798;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  AXPerformBlockAsynchronouslyOnMainThread(v6);
}

- (void)_eventQueue_setVirtualStatusAlignment:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v5 = OBJC_IVAR___SCROBrailleDisplayManager__status;
  unsigned int v6 = [*(id *)&self->SCROBrailleDisplayManager_opaque[OBJC_IVAR___SCROBrailleDisplayManager__status] virtualAlignment];
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___MSCRODBrailleDisplayManager;
  -[MSCRODBrailleDisplayManager _eventQueue_setVirtualStatusAlignment:]( &v7,  "_eventQueue_setVirtualStatusAlignment:",  v3);
  if (v6 != (_DWORD)v3
    && [*(id *)&self->SCROBrailleDisplayManager_opaque[v5] virtualAlignment] == (_DWORD)v3)
  {
    _AXSVoiceOverTouchSetBrailleVirtualStatusAlignment(v3);
  }

- (void)_eventQueue_setMasterStatusCellIndex:(int64_t)a3
{
  uint64_t v5 = OBJC_IVAR___SCROBrailleDisplayManager__status;
  id v6 = [*(id *)&self->SCROBrailleDisplayManager_opaque[OBJC_IVAR___SCROBrailleDisplayManager__status] masterStatusCellIndex];
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___MSCRODBrailleDisplayManager;
  -[MSCRODBrailleDisplayManager _eventQueue_setMasterStatusCellIndex:](&v7, "_eventQueue_setMasterStatusCellIndex:", a3);
  if (v6 != (id)a3
    && [*(id *)&self->SCROBrailleDisplayManager_opaque[v5] masterStatusCellIndex] == (id)a3)
  {
    _AXSVoiceOverTouchSetBrailleMasterStatusCellIndex(a3);
  }

- (void)_setupBluetooth
{
  id v3 = +[BluetoothManager sharedInstance](&OBJC_CLASS___BluetoothManager, "sharedInstance");
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v4 addObserver:self selector:"powerChangedNotification:" name:BluetoothPowerChangedNotification object:0];

  id v5 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v5 addObserver:self selector:"powerChangedNotification:" name:BluetoothAvailabilityChangedNotification object:0];
}

- (void)powerChangedNotification:(id)a3
{
}

- (void)_delayedPowerChangedNotification:(id)a3
{
  id v4 = a3;
  uint64_t v5 = AXLogBrailleHW(v4);
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v30 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Handing power change: %@", buf, 0xCu);
  }

  dispatch_assert_queue_V2(&_dispatch_main_q);
  objc_super v7 = (void *)objc_claimAutoreleasedReturnValue(+[BluetoothManager sharedInstance](&OBJC_CLASS___BluetoothManager, "sharedInstance"));
  if ([v7 enabled] && !self->_isScreenBlank)
  {
    unsigned __int8 v22 = -[MSCRODBrailleDisplayManager airplaneMode](self, "airplaneMode");

    if ((v22 & 1) == 0)
    {
      -[MSCRODBrailleDisplayManager _loadBluetoothDriverFromPreferences](self, "_loadBluetoothDriverFromPreferences");
      goto LABEL_18;
    }
  }

  else
  {
  }

  id v23 = v4;
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  id v8 = -[NSMutableArray copy](self->_displays, "copy");
  id v9 = [v8 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v25;
    do
    {
      for (i = 0LL; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v25 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = *(void **)(*((void *)&v24 + 1) + 8LL * (void)i);
        v14 = (void *)objc_claimAutoreleasedReturnValue([v13 ioElement]);
        uint64_t v16 = objc_opt_class(&OBJC_CLASS___MSCRODIOBluetoothElement, v15);
        char isKindOfClass = objc_opt_isKindOfClass(v14, v16);

        if ((isKindOfClass & 1) != 0)
        {
          uint64_t v19 = AXLogBrailleHW(v18);
          v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            id v30 = v13;
            _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "Call _removeBluetoothDriverWithIOElement for Display: %@",  buf,  0xCu);
          }

          v21 = (void *)objc_claimAutoreleasedReturnValue([v13 ioElement]);
          -[MSCRODBrailleDisplayManager _removeBluetoothDriverWithIOElement:removeFromPreferences:]( self,  "_removeBluetoothDriverWithIOElement:removeFromPreferences:",  v21,  0LL);
        }
      }

      id v10 = [v8 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }

    while (v10);
  }

  id v4 = v23;
LABEL_18:
}

- (id)_displayWithIOElement:(id)a3 driverIdentifier:(id)a4 delegate:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if ([v7 conformsToProtocol:&OBJC_PROTOCOL___SCROIOBluetoothElementProtocol])
  {
    id v10 = &OBJC_CLASS___MSCRODMobileBrailleDisplay;
  }

  else
  {
    if (!v7)
    {
      uint64_t v11 = 0LL;
      goto LABEL_7;
    }

    id v10 = (__objc2_class *)&OBJC_CLASS___SCROBrailleDisplay;
  }

  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( -[__objc2_class displayWithIOElement:driverIdentifier:delegate:]( v10,  "displayWithIOElement:driverIdentifier:delegate:",  v7,  v8,  v9));
LABEL_7:

  return v11;
}

- (void)loadBluetoothDriverWithAddress:(id)a3
{
}

- (void)_loadBluetoothDriverWithAddress:(id)a3
{
  id v39 = a3;
  dispatch_assert_queue_V2(&_dispatch_main_q);
  __int128 v57 = 0u;
  __int128 v58 = 0u;
  __int128 v55 = 0u;
  __int128 v56 = 0u;
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[BluetoothManager sharedInstance](&OBJC_CLASS___BluetoothManager, "sharedInstance"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 pairedDevices]);

  id v5 = [v4 countByEnumeratingWithState:&v55 objects:v64 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v56;
LABEL_3:
    uint64_t v7 = 0LL;
    while (1)
    {
      if (*(void *)v56 != v6) {
        objc_enumerationMutation(v4);
      }
      id v8 = *(void **)(*((void *)&v55 + 1) + 8 * v7);
      id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 address]);
      unsigned __int8 v10 = [v9 isEqualToString:v39];

      if ((v10 & 1) != 0) {
        break;
      }
      if (v5 == (id)++v7)
      {
        id v5 = [v4 countByEnumeratingWithState:&v55 objects:v64 count:16];
        if (v5) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }

    id v11 = v8;

    if (!v11) {
      goto LABEL_35;
    }
    id v38 = v11;
    v36 = (void *)objc_claimAutoreleasedReturnValue( +[NSBundle brailleDriverDeviceDetectionInfo]( &OBJC_CLASS___NSBundle,  "brailleDriverDeviceDetectionInfo"));
    if ([v36 count])
    {
      v40 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v36 count]));
      v12 = (void *)objc_claimAutoreleasedReturnValue([v38 name]);
      v45 = (void *)objc_claimAutoreleasedReturnValue( +[NSExpression expressionForEvaluatedObject]( &OBJC_CLASS___NSExpression,  "expressionForEvaluatedObject"));
      __int128 v77 = 0u;
      __int128 v78 = 0u;
      *(_OWORD *)buf = 0u;
      __int128 v76 = 0u;
      id obj = v36;
      id v42 = [obj countByEnumeratingWithState:buf objects:&v69 count:16];
      if (v42)
      {
        uint64_t v41 = *(void *)v76;
        do
        {
          for (i = 0LL; i != v42; i = (char *)i + 1)
          {
            if (*(void *)v76 != v41) {
              objc_enumerationMutation(obj);
            }
            uint64_t v43 = *(void *)(*(void *)&buf[8] + 8LL * (void)i);
            v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(obj, "objectForKey:"));
            uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKey:kSCROBrailleDriverBluetoothSearchDictionary]);

            if (v15)
            {
              if (v12)
              {
                uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v15 objectForKey:kSCROBrailleDriverBluetoothDeviceNameRegexPatterns]);
                __int128 v61 = 0u;
                __int128 v62 = 0u;
                __int128 v59 = 0u;
                __int128 v60 = 0u;
                id v17 = v16;
                id v18 = [v17 countByEnumeratingWithState:&v59 objects:&v65 count:16];
                if (v18)
                {
                  uint64_t v19 = *(void *)v60;
                  while (2)
                  {
                    for (j = 0LL; j != v18; j = (char *)j + 1)
                    {
                      if (*(void *)v60 != v19) {
                        objc_enumerationMutation(v17);
                      }
                      id v21 = [objc_allocWithZone(NSConstantValueExpression) initWithObject:*(void *)(*((void *)&v59 + 1) + 8 * (void)j)];
                      id v22 = [objc_allocWithZone(NSComparisonPredicate) initWithLeftExpression:v45 rightExpression:v21 modifier:0 type:6 options:0];
                      unsigned __int8 v23 = [v22 evaluateWithObject:v12];

                      if ((v23 & 1) != 0)
                      {

                        [v40 insertObject:v43 atIndex:0];
                        goto LABEL_31;
                      }
                    }

                    id v18 = [v17 countByEnumeratingWithState:&v59 objects:&v65 count:16];
                    if (v18) {
                      continue;
                    }
                    break;
                  }
                }

LABEL_31:
              }

              else
              {
                [v40 addObject:v43];
              }
            }
          }

          id v42 = [obj countByEnumeratingWithState:buf objects:&v69 count:16];
        }

        while (v42);
      }
    }

    else
    {
      v40 = 0LL;
    }

    if ([v40 count]
      && (id v24 = [objc_allocWithZone((Class)MSCRODIOBluetoothElement) initWithAddress:v39]) != 0)
    {
      uint64_t v65 = 0LL;
      v66 = &v65;
      uint64_t v67 = 0x2020000000LL;
      char v68 = 0;
      uint64_t v69 = 0LL;
      v70 = &v69;
      uint64_t v71 = 0x3032000000LL;
      v72 = sub_100004A94;
      v73 = sub_100004AA4;
      __int128 v25 = *(dispatch_queue_s **)&self->SCROBrailleDisplayManager_opaque[OBJC_IVAR___SCROBrailleDisplayManager__eventQueue];
      id v74 = 0LL;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_100004AAC;
      block[3] = &unk_1000147C0;
      void block[4] = self;
      id v26 = v24;
      id v51 = v26;
      v53 = &v65;
      v54 = &v69;
      id v52 = v40;
      dispatch_sync(v25, block);
      if (!*((_BYTE *)v66 + 24))
      {
        -[MSCRODBrailleDisplayManager _loadNextDriverForIOElement:](self, "_loadNextDriverForIOElement:", v26);
        __int128 v48 = 0u;
        __int128 v49 = 0u;
        __int128 v46 = 0u;
        __int128 v47 = 0u;
        __int128 v27 = (void *)objc_claimAutoreleasedReturnValue( [*(id *)&self->SCROBrailleDisplayManager_opaque[OBJC_IVAR___SCROBrailleDisplayManager__managedDisplayQueue] loadingDisplays]);
        id v28 = [v27 countByEnumeratingWithState:&v46 objects:v63 count:16];
        if (v28)
        {
          uint64_t v29 = *(void *)v47;
          while (2)
          {
            for (k = 0LL; k != v28; k = (char *)k + 1)
            {
              if (*(void *)v47 != v29) {
                objc_enumerationMutation(v27);
              }
              v31 = *(void **)(*((void *)&v46 + 1) + 8LL * (void)k);
              v32 = (void *)objc_claimAutoreleasedReturnValue([v31 ioElement]);
              unsigned int v33 = [v32 isEqual:v26];

              if (v33)
              {
                uint64_t v34 = AXLogBrailleHW(-[NSMutableArray addObject:](self->_displays, "addObject:", v31));
                v35 = (os_log_s *)objc_claimAutoreleasedReturnValue(v34);
                if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412290;
                  *(void *)&uint8_t buf[4] = v31;
                  _os_log_impl( (void *)&_mh_execute_header,  v35,  OS_LOG_TYPE_DEFAULT,  "Adding BT display: %@",  buf,  0xCu);
                }

                goto LABEL_53;
              }
            }

            id v28 = [v27 countByEnumeratingWithState:&v46 objects:v63 count:16];
            if (v28) {
              continue;
            }
            break;
          }
        }

- (void)_loadBluetoothDriverFromPreferences
{
  __int128 v57 = self;
  dispatch_assert_queue_V2(&_dispatch_main_q);
  __int128 v95 = 0u;
  __int128 v96 = 0u;
  __int128 v93 = 0u;
  __int128 v94 = 0u;
  id v2 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  id obj = (id)objc_claimAutoreleasedReturnValue([v2 voiceOverBrailleDisplays]);

  uint64_t isKindOfClass = (uint64_t)[obj countByEnumeratingWithState:&v93 objects:v108 count:16];
  uint64_t v60 = isKindOfClass;
  if (isKindOfClass)
  {
    uint64_t v59 = *(void *)v94;
    do
    {
      uint64_t v4 = 0LL;
      do
      {
        if (*(void *)v94 != v59)
        {
          uint64_t v5 = v4;
          objc_enumerationMutation(obj);
          uint64_t v4 = v5;
        }

        uint64_t v61 = v4;
        uint64_t v6 = *(void **)(*((void *)&v93 + 1) + 8 * v4);
        uint64_t v7 = AXLogBrailleHW(isKindOfClass);
        id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)&uint8_t buf[4] = v6;
          _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Processing BT device: %@", buf, 0xCu);
        }

        uint64_t v10 = objc_opt_class(&OBJC_CLASS___NSDictionary, v9);
        uint64_t isKindOfClass = objc_opt_isKindOfClass(v6, v10);
        if ((isKindOfClass & 1) != 0)
        {
          id v11 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:kSCROBrailleDisplayBluetoothAddress]);
          uint64_t v13 = objc_opt_class(&OBJC_CLASS___NSString, v12);
          if ((objc_opt_isKindOfClass(v11, v13) & 1) != 0)
          {
            v14 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:kSCROBrailleDisplayTransport]);
            id v15 = [v14 intValue];

            uint64_t v17 = AXLogBrailleHW(v16);
            id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
            if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v15));
              *(_DWORD *)buf = 138412290;
              *(void *)&uint8_t buf[4] = v19;
              _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "BT transport type: %@", buf, 0xCu);
            }

            if ((_DWORD)v15 == 2)
            {
              id v37 = [objc_allocWithZone((Class)MSCRODIOBluetoothElement) initWithAddress:v11];
              id v62 = v37;
              if (!v37) {
                goto LABEL_35;
              }
LABEL_37:
              uint64_t v40 = AXLogBrailleHW(v37);
              uint64_t v41 = (os_log_s *)objc_claimAutoreleasedReturnValue(v40);
              if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
              {
                displays = v57->_displays;
                *(_DWORD *)buf = 138412290;
                *(void *)&uint8_t buf[4] = displays;
                _os_log_impl( (void *)&_mh_execute_header,  v41,  OS_LOG_TYPE_DEFAULT,  "In _loadBluetoothDriverFromPreferences: _displays = %@",  buf,  0xCu);
              }

              __int128 v83 = 0u;
              __int128 v84 = 0u;
              __int128 v81 = 0u;
              __int128 v82 = 0u;
              uint64_t v43 = v57->_displays;
              id v44 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v43,  "countByEnumeratingWithState:objects:count:",  &v81,  v105,  16LL);
              if (v44)
              {
                uint64_t v45 = *(void *)v82;
                while (2)
                {
                  for (i = 0LL; i != v44; i = (char *)i + 1)
                  {
                    if (*(void *)v82 != v45) {
                      objc_enumerationMutation(v43);
                    }
                    unsigned __int8 v48 = [v47 isEqual:v62];

                    if ((v48 & 1) != 0)
                    {

                      uint64_t v55 = AXLogBrailleHW(v54);
                      __int128 v56 = (os_log_s *)objc_claimAutoreleasedReturnValue(v55);
                      if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
                      {
                        *(_DWORD *)buf = 138412290;
                        *(void *)&uint8_t buf[4] = v11;
                        _os_log_impl( (void *)&_mh_execute_header,  v56,  OS_LOG_TYPE_DEFAULT,  "Not remaking display, we already have a cached version: %@",  buf,  0xCu);
                      }

                      goto LABEL_55;
                    }
                  }

                  id v44 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v43,  "countByEnumeratingWithState:objects:count:",  &v81,  v105,  16LL);
                  if (v44) {
                    continue;
                  }
                  break;
                }
              }

              *(void *)buf = 0LL;
              *(void *)&buf[8] = buf;
              *(void *)&uint8_t buf[16] = 0x3032000000LL;
              v102 = sub_100004A94;
              v103 = sub_100004AA4;
              id v104 = 0LL;
              uint64_t v77 = 0LL;
              __int128 v78 = &v77;
              uint64_t v79 = 0x2020000000LL;
              char v80 = 0;
              uint64_t v71 = 0LL;
              v72 = &v71;
              uint64_t v73 = 0x3032000000LL;
              id v74 = sub_100004A94;
              v75 = sub_100004AA4;
              __int128 v49 = *(dispatch_queue_s **)&v57->SCROBrailleDisplayManager_opaque[OBJC_IVAR___SCROBrailleDisplayManager__eventQueue];
              id v76 = 0LL;
              block[0] = _NSConcreteStackBlock;
              block[1] = 3221225472LL;
              block[2] = sub_100005410;
              block[3] = &unk_1000147E8;
              void block[4] = v57;
              id v62 = v62;
              id v66 = v62;
              uint64_t v67 = v6;
              char v68 = buf;
              uint64_t v69 = &v77;
              v70 = &v71;
              dispatch_sync(v49, block);
              uint64_t v51 = AXLogBrailleHW(v50);
              id v52 = (os_log_s *)objc_claimAutoreleasedReturnValue(v51);
              if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
              {
                v53 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  *((unsigned __int8 *)v78 + 24)));
                *(_DWORD *)v97 = 138412546;
                v98 = v53;
                __int16 v99 = 2112;
                id v100 = v62;
                _os_log_impl( (void *)&_mh_execute_header,  v52,  OS_LOG_TYPE_DEFAULT,  "Adding new display element? %@ %@",  v97,  0x16u);
              }

              if (*((_BYTE *)v78 + 24))
              {
                -[NSMutableArray addObject:](v57->_displays, "addObject:", *(void *)(*(void *)&buf[8] + 40LL));
                [(id)v72[5] configurationDidChange];
              }

              _Block_object_dispose(&v71, 8);
              _Block_object_dispose(&v77, 8);
              _Block_object_dispose(buf, 8);

LABEL_55:
            }

            else
            {
              if ((_DWORD)v15 == 8)
              {
                __int128 v91 = 0u;
                __int128 v92 = 0u;
                __int128 v89 = 0u;
                __int128 v90 = 0u;
                v20 = (void *)objc_claimAutoreleasedReturnValue(+[BluetoothManager sharedInstance](&OBJC_CLASS___BluetoothManager, "sharedInstance"));
                id v62 = (id)objc_claimAutoreleasedReturnValue([v20 pairedDevices]);

                id v64 = [v62 countByEnumeratingWithState:&v89 objects:v107 count:16];
                if (v64)
                {
                  uint64_t v63 = *(void *)v90;
                  do
                  {
                    for (j = 0LL; j != v64; j = (char *)j + 1)
                    {
                      if (*(void *)v90 != v63) {
                        objc_enumerationMutation(v62);
                      }
                      id v22 = *(void **)(*((void *)&v89 + 1) + 8LL * (void)j);
                      unsigned __int8 v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "address", v57));
                      unsigned int v24 = [v23 isEqualToString:v11];

                      if (v24)
                      {
                        __int128 v87 = 0u;
                        __int128 v88 = 0u;
                        __int128 v85 = 0u;
                        __int128 v86 = 0u;
                        __int128 v25 = (void *)objc_claimAutoreleasedReturnValue( +[BluetoothManager sharedInstance]( &OBJC_CLASS___BluetoothManager,  "sharedInstance"));
                        id v26 = (void *)objc_claimAutoreleasedReturnValue([v25 connectingDevices]);

                        int v27 = 0;
                        id v28 = [v26 countByEnumeratingWithState:&v85 objects:v106 count:16];
                        if (v28)
                        {
                          uint64_t v29 = *(void *)v86;
                          do
                          {
                            for (k = 0LL; k != v28; k = (char *)k + 1)
                            {
                              if (*(void *)v86 != v29) {
                                objc_enumerationMutation(v26);
                              }
                              unsigned int v32 = [v31 isEqualToString:v11];

                              v27 |= v32;
                            }

                            id v28 = [v26 countByEnumeratingWithState:&v85 objects:v106 count:16];
                          }

                          while (v28);
                        }

                        if ((([v22 connected] | v27) & 1) == 0)
                        {
                          uint64_t v33 = BTDeviceConnectServices([v22 device], 32);
                          uint64_t v34 = AXLogBrailleHW(v33);
                          v35 = (os_log_s *)objc_claimAutoreleasedReturnValue(v34);
                          if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
                          {
                            v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v33));
                            *(_DWORD *)buf = 138412546;
                            *(void *)&uint8_t buf[4] = v36;
                            *(_WORD *)&buf[12] = 2112;
                            *(void *)&buf[14] = v22;
                            _os_log_impl( (void *)&_mh_execute_header,  v35,  OS_LOG_TYPE_DEFAULT,  "Connected to device[%@]: %@",  buf,  0x16u);
                          }
                        }
                      }
                    }

                    id v64 = [v62 countByEnumeratingWithState:&v89 objects:v107 count:16];
                  }

                  while (v64);
                }

                goto LABEL_55;
              }

- (void)removeBluetoothDriverWithAddress:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_100005690;
  v4[3] = &unk_100014798;
  v4[4] = self;
  id v5 = a3;
  id v3 = v5;
  dispatch_async(&_dispatch_main_q, v4);
}

- (void)_removeBluetoothDriverWithAddress:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2(&_dispatch_main_q);
  id v6 = [objc_allocWithZone((Class)MSCRODIOBluetoothElement) initWithAddress:v4];

  id v5 = v6;
  if (v6)
  {
    -[MSCRODBrailleDisplayManager _removeBluetoothDriverWithIOElement:removeFromPreferences:]( self,  "_removeBluetoothDriverWithIOElement:removeFromPreferences:",  v6,  1LL);
    id v5 = v6;
  }
}

- (void)_removeBluetoothDriverWithIOElement:(id)a3 removeFromPreferences:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v7 = AXLogBrailleHW(v6);
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Removing BT driver: %@", (uint8_t *)&buf, 0xCu);
  }

  dispatch_assert_queue_V2(&_dispatch_main_q);
  if (v6)
  {
    *(void *)&__int128 buf = 0LL;
    *((void *)&buf + 1) = &buf;
    uint64_t v102 = 0x3032000000LL;
    v103 = sub_100004A94;
    id v104 = sub_100004AA4;
    id v105 = 0LL;
    v94[0] = 0LL;
    v94[1] = v94;
    v94[2] = 0x2020000000LL;
    char v95 = 0;
    uint64_t v88 = 0LL;
    __int128 v89 = &v88;
    uint64_t v90 = 0x3032000000LL;
    __int128 v91 = sub_100004A94;
    __int128 v92 = sub_100004AA4;
    id v93 = 0LL;
    uint64_t v82 = 0LL;
    __int128 v83 = &v82;
    uint64_t v84 = 0x3032000000LL;
    __int128 v85 = sub_100004A94;
    __int128 v86 = sub_100004AA4;
    id v87 = 0LL;
    uint64_t v76 = 0LL;
    uint64_t v77 = &v76;
    uint64_t v78 = 0x3032000000LL;
    uint64_t v79 = sub_100004A94;
    char v80 = sub_100004AA4;
    id v81 = 0LL;
    uint64_t v72 = 0LL;
    uint64_t v73 = &v72;
    uint64_t v74 = 0x2020000000LL;
    char v75 = 0;
    uint64_t v68 = 0LL;
    uint64_t v69 = &v68;
    uint64_t v70 = 0x2020000000LL;
    char v71 = 0;
    uint64_t v64 = 0LL;
    uint64_t v65 = &v64;
    uint64_t v66 = 0x2020000000LL;
    int v67 = 0;
    uint64_t v60 = 0LL;
    uint64_t v61 = &v60;
    uint64_t v62 = 0x2020000000LL;
    uint64_t v63 = 0LL;
    uint64_t v56 = 0LL;
    __int128 v57 = &v56;
    uint64_t v58 = 0x2020000000LL;
    int v59 = 2;
    uint64_t v50 = 0LL;
    uint64_t v51 = &v50;
    uint64_t v52 = 0x3032000000LL;
    v53 = sub_100004A94;
    uint64_t v54 = sub_100004AA4;
    id v55 = 0LL;
    displays = self->_displays;
    v48[0] = _NSConcreteStackBlock;
    v48[1] = 3221225472LL;
    v48[2] = sub_100005E30;
    v48[3] = &unk_100014810;
    id v10 = v6;
    id v49 = v10;
    id v11 = -[NSMutableArray indexOfObjectPassingTest:](displays, "indexOfObjectPassingTest:", v48);
    if (v11 == (id)0x7FFFFFFFFFFFFFFFLL || v11 >= -[NSMutableArray count](self->_displays, "count")) {
      goto LABEL_27;
    }
    uint64_t v12 = objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](self->_displays, "objectAtIndexedSubscript:", v11));
    uint64_t v13 = *(void **)(*((void *)&buf + 1) + 40LL);
    *(void *)(*((void *)&buf + 1) + 40LL) = v12;

    v14 = *(dispatch_queue_s **)&self->SCROBrailleDisplayManager_opaque[OBJC_IVAR___SCROBrailleDisplayManager__eventQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100005E70;
    block[3] = &unk_100014838;
    void block[4] = self;
    p___int128 buf = &buf;
    id v38 = &v68;
    unsigned __int8 v39 = &v76;
    uint64_t v40 = &v72;
    uint64_t v41 = &v64;
    id v42 = &v60;
    uint64_t v43 = &v56;
    id v44 = &v50;
    uint64_t v45 = v94;
    id v36 = v10;
    __int128 v46 = &v88;
    __int128 v47 = &v82;
    dispatch_sync(v14, block);
    if (!*(void *)(*((void *)&buf + 1) + 40LL))
    {
LABEL_26:
      [(id)v89[5] handleBrailleDriverDisconnected];
      [(id)v83[5] configurationDidChange];

LABEL_27:
      _Block_object_dispose(&v50, 8);

      _Block_object_dispose(&v56, 8);
      _Block_object_dispose(&v60, 8);
      _Block_object_dispose(&v64, 8);
      _Block_object_dispose(&v68, 8);
      _Block_object_dispose(&v72, 8);
      _Block_object_dispose(&v76, 8);

      _Block_object_dispose(&v82, 8);
      _Block_object_dispose(&v88, 8);

      _Block_object_dispose(v94, 8);
      _Block_object_dispose(&buf, 8);

      goto LABEL_28;
    }

    uint64_t v15 = AXLogBrailleHW(-[NSMutableArray removeObject:](self->_displays, "removeObject:"));
    uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v17 = *(void *)(*((void *)&buf + 1) + 40LL);
      LODWORD(v98) = 138412290;
      *(void *)((char *)&v98 + 4) = v17;
      _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "Removing BT display: %@",  (uint8_t *)&v98,  0xCu);
    }

    *(void *)&__int128 v98 = 0LL;
    *((void *)&v98 + 1) = &v98;
    uint64_t v99 = 0x2020000000LL;
    uint64_t v100 = 0x7FFFFFFFFFFFFFFFLL;
    id v18 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&buf + 1) + 40) configuration]);
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
    v20 = (void *)objc_claimAutoreleasedReturnValue([v19 voiceOverBrailleDisplays]);
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472LL;
    v32[2] = sub_100006100;
    v32[3] = &unk_100014860;
    v32[4] = self;
    id v21 = v18;
    id v33 = v21;
    uint64_t v34 = &v98;
    [v20 enumerateObjectsUsingBlock:v32];

    if (v4 && *(void *)(*((void *)&v98 + 1) + 24LL) != 0x7FFFFFFFFFFFFFFFLL)
    {
      id v22 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
      unsigned __int8 v23 = (void *)objc_claimAutoreleasedReturnValue([v22 voiceOverBrailleDisplays]);
      id v24 = [v23 mutableCopy];

      [v24 removeObjectAtIndex:*(void *)(*((void *)&v98 + 1) + 24)];
      __int128 v25 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
      [v25 setVoiceOverBrailleDisplays:v24];

      uint64_t v27 = AXLogBrailleHW(v26);
      id v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)__int128 v96 = 138412290;
        id v97 = v21;
        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "Removed display from list: %@", v96, 0xCu);
      }
    }

    [*(id *)(*((void *)&buf + 1) + 40) invalidate];
    if (!*((_BYTE *)v69 + 24))
    {
      -[MSCRODBrailleDisplayManager setUIDisplayMode](self, "setUIDisplayMode");
      -[MSCRODBrailleDisplayManager performSelector:withObject:afterDelay:]( self,  "performSelector:withObject:afterDelay:",  "_loadStealthDisplay",  0LL,  0.0);
LABEL_25:

      _Block_object_dispose(&v98, 8);
      goto LABEL_26;
    }

    int v29 = *((_DWORD *)v57 + 6);
    if (v29)
    {
      BOOL v30 = v29 == 1;
      if (!*((_BYTE *)v73 + 24)) {
        goto LABEL_23;
      }
    }

    else
    {
      if (!*((_BYTE *)v73 + 24))
      {
        BOOL v30 = 0LL;
LABEL_23:
        BOOL v31 = 0LL;
        goto LABEL_24;
      }

      BOOL v30 = 1LL;
    }

    BOOL v31 = self->SCROBrailleDisplayManager_opaque[OBJC_IVAR___SCROBrailleDisplayManager__lineDescriptorDisplayCallbackEnabled] != 0;
LABEL_24:
    _updateNewlyActiveDisplay( v77[5],  v51[5],  v31,  v30,  v61[3],  *((unsigned int *)v65 + 6),  self->SCROBrailleDisplayManager_opaque[OBJC_IVAR___SCROBrailleDisplayManager__automaticBrailleTranslation]);
    goto LABEL_25;
  }

- (id)driverConfiguration
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___MSCRODBrailleDisplayManager;
  id v3 = -[MSCRODBrailleDisplayManager driverConfiguration](&v7, "driverConfiguration");
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000061F4;
  block[3] = &unk_100014770;
  void block[4] = self;
  dispatch_async(&_dispatch_main_q, block);
  return v4;
}

- (BOOL)_brailleConfigMatch:(id)a3 withConfig:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  objc_super v7 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:kSCROBrailleDisplayBluetoothAddress]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:kSCROBrailleDisplayBluetoothAddress]);
  unsigned __int8 v9 = [v7 isEqualToString:v8];

  if ((v9 & 1) != 0)
  {
    unsigned __int8 v10 = 1;
  }

  else
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:kSCROBrailleDisplayBrailleVendorProductId]);
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:kSCROBrailleDisplayBrailleVendorProductId]);
    unsigned __int8 v10 = [v11 isEqualToString:v12];
  }

  return v10;
}

- (void)_saveBluetoothDisplayConfiguration:(id)a3
{
  id v4 = [a3 mutableCopyWithZone:0];
  [v4 removeObjectForKey:kSCROBrailleDisplayToken];
  id v24 = v4;
  id v5 = [v4 copyWithZone:0];
  uint64_t v32 = 0LL;
  id v33 = &v32;
  uint64_t v34 = 0x2020000000LL;
  uint64_t v35 = 0x7FFFFFFFFFFFFFFFLL;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  objc_super v7 = (void *)objc_claimAutoreleasedReturnValue([v6 voiceOverBrailleDisplays]);
  id v8 = [v7 mutableCopy];

  if (!v8) {
    id v8 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  }
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472LL;
  v29[2] = sub_100006724;
  v29[3] = &unk_100014860;
  v29[4] = self;
  id v9 = v5;
  id v30 = v9;
  BOOL v31 = &v32;
  [v8 enumerateObjectsUsingBlock:v29];
  uint64_t v10 = v33[3];
  if (v10 == 0x7FFFFFFFFFFFFFFFLL) {
    [v8 addObject:v9];
  }
  else {
    [v8 replaceObjectAtIndex:v10 withObject:v9];
  }
  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  [v11 setVoiceOverBrailleDisplays:v8];

  uint64_t v13 = AXLogBrailleHW(v12);
  v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v8 count]));
    *(_DWORD *)__int128 buf = 138412290;
    id v38 = v15;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Saving VO braille configs: %@", buf, 0xCu);
  }

  __int128 v27 = 0u;
  __int128 v28 = 0u;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  id v16 = v8;
  id v17 = [v16 countByEnumeratingWithState:&v25 objects:v36 count:16];
  id v18 = v17;
  if (v17)
  {
    uint64_t v19 = *(void *)v26;
    do
    {
      v20 = 0LL;
      do
      {
        if (*(void *)v26 != v19) {
          objc_enumerationMutation(v16);
        }
        id v21 = *(void **)(*((void *)&v25 + 1) + 8LL * (void)v20);
        uint64_t v22 = AXLogBrailleHW(v17);
        unsigned __int8 v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)__int128 buf = 138412290;
          id v38 = v21;
          _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "-- Braille configs: %@", buf, 0xCu);
        }

        v20 = (char *)v20 + 1;
      }

      while (v18 != v20);
      id v17 = [v16 countByEnumeratingWithState:&v25 objects:v36 count:16];
      id v18 = v17;
    }

    while (v17);
  }

  _Block_object_dispose(&v32, 8);
}

- (BOOL)isConfigured
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___MSCRODBrailleDisplayManager;
  BOOL v3 = -[MSCRODBrailleDisplayManager isConfigured](&v6, "isConfigured");
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100006814;
  block[3] = &unk_100014770;
  void block[4] = self;
  dispatch_async(&_dispatch_main_q, block);
  return v3;
}

- (BOOL)_registerSleepNotifications
{
  p_sleepWake = &self->_sleepWake;
  p_notifyPortRef = &self->_sleepWake.notifyPortRef;
  io_connect_t v4 = IORegisterForSystemPower( 0LL,  &self->_sleepWake.notifyPortRef,  (IOServiceInterestCallback)sub_10000699C,  &self->_sleepWake.notifierObject);
  p_sleepWake->rootPort = v4;
  if (v4)
  {
    Current = CFRunLoopGetCurrent();
    RunLoopSource = IONotificationPortGetRunLoopSource(*p_notifyPortRef);
    CFRunLoopAddSource(Current, RunLoopSource, kCFRunLoopCommonModes);
  }

  else
  {
    NSLog(@"Error: IORegisterForSystemPower failed");
  }

  return v4 != 0;
}

- (unsigned)_rootPowerPort
{
  return self->_sleepWake.rootPort;
}

- (void)setLastUserInteractionTime:(double)a3
{
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___MSCRODBrailleDisplayManager;
  id v4 = -[MSCRODBrailleDisplayManager setLastUserInteractionTime:](&v12, "setLastUserInteractionTime:", a3);
  uint64_t v5 = AXLogBrailleHW(v4);
  objc_super v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    sub_10000D68C(self, v6);
  }

  BOOL v7 = -[MSCRODBrailleDisplayManager isBrailleSystemSleeping](self, "isBrailleSystemSleeping");
  if (v7)
  {
    uint64_t v8 = AXLogBrailleHW(v7);
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)__int128 buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Received user interaction but system was asleep - rewaking",  buf,  2u);
    }

    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_100006B44;
    v10[3] = &unk_100014770;
    v10[4] = self;
    AXPerformBlockOnMainThreadAfterDelay(v10, 1.0);
  }

- (BOOL)_hasUserInteractedWithDeviceRecently
{
  double Current = CFAbsoluteTimeGetCurrent();
  id v4 = -[MSCRODBrailleDisplayManager lastUserInteractionTime](self, "lastUserInteractionTime");
  double v6 = Current - v5;
  uint64_t v7 = AXLogBrailleHW(v4);
  uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 134217984;
    double v11 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Last interaction time happened: %f",  (uint8_t *)&v10,  0xCu);
  }

  return v6 < 2.0;
}

- (BOOL)_hasActiveDisplay
{
  uint64_t v16 = 0LL;
  id v17 = &v16;
  uint64_t v18 = 0x2020000000LL;
  char v19 = 0;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  BOOL v3 = self->_displays;
  id v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v12,  v20,  16LL);
  if (v4)
  {
    uint64_t v5 = *(void *)v13;
LABEL_3:
    uint64_t v6 = 0LL;
    while (1)
    {
      if (*(void *)v13 != v5) {
        objc_enumerationMutation(v3);
      }
      uint64_t v7 = *(void *)(*((void *)&v12 + 1) + 8 * v6);
      uint64_t v8 = *(dispatch_queue_s **)&self->SCROBrailleDisplayManager_opaque[OBJC_IVAR___SCROBrailleDisplayManager__eventQueue];
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_100006E34;
      block[3] = &unk_100014888;
      void block[5] = v7;
      block[6] = &v16;
      void block[4] = self;
      dispatch_sync(v8, block);
      if (*((_BYTE *)v17 + 24)) {
        break;
      }
      if (v4 == (id)++v6)
      {
        id v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v12,  v20,  16LL);
        if (v4) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  char v9 = *((_BYTE *)v17 + 24);
  _Block_object_dispose(&v16, 8);
  return v9;
}

- (void)_reallyDelayedWakeFromSleep
{
  uint64_t v4 = AXLogBrailleHW(v3);
  uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)__int128 buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Processing wake from sleep to auto detect",  buf,  2u);
  }

  if (-[MSCRODBrailleDisplayManager _hasActiveDisplay](self, "_hasActiveDisplay"))
  {
    uint64_t v6 = *(dispatch_queue_s **)&self->SCROBrailleDisplayManager_opaque[OBJC_IVAR___SCROBrailleDisplayManager__eventQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100006F6C;
    block[3] = &unk_100014770;
    void block[4] = self;
    dispatch_async(v6, block);
  }

  -[MSCRODBrailleDisplayManager _enableAutoDetect](self, "_enableAutoDetect");
  -[MSCRODBrailleDisplayManager powerChangedNotification:](self, "powerChangedNotification:", 0LL);
  [0 configurationDidChange];
  -[MSCRODBrailleDisplayManager setIsBrailleSystemSleeping:](self, "setIsBrailleSystemSleeping:", 0LL);
}

- (void)_delayedWakeFromSleep
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472LL;
  v2[2] = sub_1000070BC;
  v2[3] = &unk_100014770;
  v2[4] = self;
  AXPerformBlockOnMainThreadAfterDelay(v2, 1.0);
}

- (void)_wakeFromSleep
{
}

- (void)_delayedHandleSystemSleep
{
  uint64_t v3 = AXLogBrailleHW(self);
  uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)__int128 buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Handled system sleep in Braille", buf, 2u);
  }

  dispatch_assert_queue_V2(&_dispatch_main_q);
  +[NSObject cancelPreviousPerformRequestsWithTarget:selector:object:]( &OBJC_CLASS___NSObject,  "cancelPreviousPerformRequestsWithTarget:selector:object:",  self,  "_reallyDelayedWakeFromSleep",  0LL);
  -[MSCRODBrailleDisplayManager _disableAutoDetect](self, "_disableAutoDetect");
  unsigned int v5 = -[MSCRODBrailleDisplayManager _hasActiveDisplay](self, "_hasActiveDisplay");
  uint64_t v6 = *(dispatch_queue_s **)&self->SCROBrailleDisplayManager_opaque[OBJC_IVAR___SCROBrailleDisplayManager__eventQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100007440;
  block[3] = &unk_100014770;
  void block[4] = self;
  dispatch_async(v6, block);
  if (v5)
  {
    uint64_t v7 = CFRunLoopRunInMode(kCFRunLoopDefaultMode, 0.25, 0);
    uint64_t v8 = _AXSVoiceOverTouchBrailleDisplayDisconnectOnSleep(v7);
    if ((_DWORD)v8)
    {
      uint64_t v9 = AXLogBrailleHW(v8);
      int v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        displays = self->_displays;
        *(_DWORD *)__int128 buf = 138412290;
        uint64_t v35 = displays;
        _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "In _delayedHandleSystemSleep: remove certain drivers in _displays: %@",  buf,  0xCu);
      }

      __int128 v30 = 0u;
      __int128 v31 = 0u;
      __int128 v28 = 0u;
      __int128 v29 = 0u;
      id v12 = -[NSMutableArray copy](self->_displays, "copy");
      id v13 = [v12 countByEnumeratingWithState:&v28 objects:v33 count:16];
      if (v13)
      {
        id v15 = v13;
        uint64_t v16 = *(void *)v29;
        *(void *)&__int128 v14 = 138412290LL;
        __int128 v27 = v14;
        do
        {
          for (i = 0LL; i != v15; i = (char *)i + 1)
          {
            if (*(void *)v29 != v16) {
              objc_enumerationMutation(v12);
            }
            uint64_t v18 = *(NSMutableArray **)(*((void *)&v28 + 1) + 8LL * (void)i);
            if ((-[NSMutableArray requiresPersistentConnection](v18, "requiresPersistentConnection", v27) & 1) == 0)
            {
              char v19 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray ioElement](v18, "ioElement"));
              uint64_t v21 = objc_opt_class(&OBJC_CLASS___MSCRODIOBluetoothElement, v20);
              char isKindOfClass = objc_opt_isKindOfClass(v19, v21);

              if ((isKindOfClass & 1) != 0)
              {
                unsigned __int8 v23 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray ioElement](v18, "ioElement"));
                -[MSCRODBrailleDisplayManager _removeBluetoothDriverWithIOElement:removeFromPreferences:]( self,  "_removeBluetoothDriverWithIOElement:removeFromPreferences:",  v23,  0LL);

                uint64_t v25 = AXLogBrailleHW(v24);
                __int128 v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
                if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)__int128 buf = v27;
                  uint64_t v35 = v18;
                  _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEFAULT,  "Call _removeBluetoothDriverWithIOElement for Display: %@",  buf,  0xCu);
                }
              }
            }
          }

          id v15 = [v12 countByEnumeratingWithState:&v28 objects:v33 count:16];
        }

        while (v15);
      }
    }
  }

  else
  {
    +[NSThread sleepForTimeInterval:](&OBJC_CLASS___NSThread, "sleepForTimeInterval:", 0.25);
  }

  -[MSCRODBrailleDisplayManager setIsBrailleSystemSleeping:](self, "setIsBrailleSystemSleeping:", 1LL);
}

- (void)_handleSystemSleep
{
}

- (void)_updateScreenUILock:(int)a3 screenBlank:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v5 = *(void *)&a3;
  sub_1000079C4((uint64_t)self);
  uint64_t v8 = _SCROD_LOG(v7);
  uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v5));
    double v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v4));
    id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", 0LL));
    *(_DWORD *)__int128 buf = 138412802;
    *(void *)&uint8_t buf[4] = v10;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v11;
    *(_WORD *)&buf[22] = 2112;
    __int128 v29 = v12;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Updating system ui lock status: %@, screen blank status: %@, system lock: %@",  buf,  0x20u);
  }

  self->_isScreenUILocked = (_DWORD)v5 != 0;
  self->_isScreenBlank = (_DWORD)v4 != 0;
  *(void *)__int128 buf = 0LL;
  *(void *)&buf[8] = buf;
  *(void *)&uint8_t buf[16] = 0x2020000000LL;
  LOBYTE(v29) = 0;
  if (byte_100019C20 != 1 || self->_isInDisconnectedState)
  {
    uint64_t v14 = _SCROD_LOG(v13);
    id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  byte_100019C20));
      id v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  *(unsigned __int8 *)(*(void *)&buf[8] + 24LL)));
      uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  self->_isInDisconnectedState));
      *(_DWORD *)uint64_t v22 = 138412802;
      unsigned __int8 v23 = v16;
      __int16 v24 = 2112;
      uint64_t v25 = v17;
      __int16 v26 = 2112;
      __int128 v27 = v18;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "Initialized: %@, should disconnected %@, is disconnected: %@",  v22,  0x20u);
    }

    if (*(_BYTE *)(*(void *)&buf[8] + 24LL))
    {
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472LL;
      v21[2] = sub_100007AA8;
      v21[3] = &unk_1000148B0;
      v21[4] = self;
      v21[5] = buf;
      AXPerformBlockOnMainThreadAfterDelay(v21, 0.0);
    }

    else
    {
      uint64_t v19 = _SCROD_LOG(-[MSCRODBrailleDisplayManager _wakeFromSleep](self, "_wakeFromSleep"));
      uint64_t v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v22 = 0;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Braille Device: Waking", v22, 2u);
      }
    }

    byte_100019C20 = 1;
    self->_isInDisconnectedState = *(_BYTE *)(*(void *)&buf[8] + 24LL);
  }

  _Block_object_dispose(buf, 8);
}

- (void)_registerHasBlankedScreenNotification
{
  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472LL;
  v32[2] = sub_100007F94;
  v32[3] = &unk_1000148D8;
  objc_copyWeak(&v33, &location);
  uint64_t v3 = objc_retainBlock(v32);
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472LL;
  v30[2] = sub_100008098;
  v30[3] = &unk_1000148D8;
  objc_copyWeak(&v31, &location);
  uint64_t v4 = objc_retainBlock(v30);
  uint64_t v25 = _NSConcreteStackBlock;
  uint64_t v26 = 3221225472LL;
  __int128 v27 = sub_1000081A0;
  __int128 v28 = &unk_1000148D8;
  objc_copyWeak(&v29, &location);
  uint64_t v5 = objc_retainBlock(&v25);
  p_keybagLockStateToken = &self->_keybagLockStateToken;
  uint64_t v7 = &_dispatch_main_q;
  BOOL v8 = notify_register_dispatch( "com.apple.mobile.keybagd.lock_status",  &self->_keybagLockStateToken,  &_dispatch_main_q,  v3) == 0;

  if (v8)
  {
    uint64_t v9 = ((uint64_t (*)(void *, void))v3[2])(v3, *p_keybagLockStateToken);
    uint64_t v10 = AXLogBrailleHW(v9);
    double v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      id v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInt:]( &OBJC_CLASS___NSNumber,  "numberWithInt:",  *p_keybagLockStateToken,  v25,  v26,  v27,  v28));
      *(_DWORD *)__int128 buf = 138412546;
      id v36 = self;
      __int16 v37 = 2112;
      id v38 = v12;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Registered keybag lock state: %@ %@",  buf,  0x16u);
    }
  }

  else
  {
    int *p_keybagLockStateToken = -1;
  }

  p_notifyLockStateToken = &self->_notifyLockStateToken;
  BOOL v14 = notify_register_dispatch("com.apple.springboard.lockstate", &self->_notifyLockStateToken, &_dispatch_main_q, v4) == 0;

  if (v14)
  {
    uint64_t v15 = ((uint64_t (*)(void *, void))v4[2])(v4, *p_notifyLockStateToken);
    uint64_t v16 = AXLogBrailleHW(v15);
    id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInt:]( &OBJC_CLASS___NSNumber,  "numberWithInt:",  *p_notifyLockStateToken));
      *(_DWORD *)__int128 buf = 138412546;
      id v36 = self;
      __int16 v37 = 2112;
      id v38 = v18;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Registered lock state: %@ %@", buf, 0x16u);
    }
  }

  else
  {
    int *p_notifyLockStateToken = -1;
  }

  p_blankScreenToken = &self->_blankScreenToken;
  BOOL v20 = notify_register_dispatch( "com.apple.springboard.hasBlankedScreen",  &self->_blankScreenToken,  &_dispatch_main_q,  v5) == 0;

  if (v20)
  {
    uint64_t v21 = ((uint64_t (*)(void ***, void))v5[2])(v5, *p_blankScreenToken);
    uint64_t v22 = AXLogBrailleHW(v21);
    unsigned __int8 v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInt:]( &OBJC_CLASS___NSNumber,  "numberWithInt:",  *p_blankScreenToken));
      *(_DWORD *)__int128 buf = 138412546;
      id v36 = self;
      __int16 v37 = 2112;
      id v38 = v24;
      _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEFAULT,  "Registered blank screen state: %@ %@",  buf,  0x16u);
    }
  }

  else
  {
    int *p_blankScreenToken = -1;
  }

  objc_destroyWeak(&v29);
  objc_destroyWeak(&v31);

  objc_destroyWeak(&v33);
  objc_destroyWeak(&location);
}

- (void)airplaneModeChanged
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100008300;
  block[3] = &unk_100014770;
  void block[4] = self;
  dispatch_async(&_dispatch_main_q, block);
}

- (id)newBrailleDisplayCommandDispatcher
{
  return [objc_allocWithZone(SCROBrailleDisplayCommandDispatcher) init];
}

- (id)brailleInputManager
{
  return +[SCROMobileBrailleDisplayInputManager sharedManager]( &OBJC_CLASS___SCROMobileBrailleDisplayInputManager,  "sharedManager");
}

- (void)addToDisplays:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10000840C;
  v4[3] = &unk_100014798;
  v4[4] = self;
  id v5 = a3;
  id v3 = v5;
  dispatch_async(&_dispatch_main_q, v4);
}

- (BOOL)airplaneMode
{
  return self->_airplaneMode;
}

- (void)setAirplaneMode:(BOOL)a3
{
  self->_airplaneMode = a3;
}

- (RadiosPreferences)radiosPrefs
{
  return self->_radiosPrefs;
}

- (void)setRadiosPrefs:(id)a3
{
}

- (BOOL)isBrailleSystemSleeping
{
  return self->_isBrailleSystemSleeping;
}

- (void)setIsBrailleSystemSleeping:(BOOL)a3
{
  self->_isBrailleSystemSleeping = a3;
}

- (void).cxx_destruct
{
}

@end
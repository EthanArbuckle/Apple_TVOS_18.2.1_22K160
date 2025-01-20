@interface PBUpsellManager
+ (id)sharedInstance;
- (AFSettingsConnection)siriConnection;
- (BOOL)_isHeadBoardAppFocused;
- (BOOL)_isManateeAvailable;
- (BOOL)retryUpsell;
- (BSInvalidatable)tipsKioskIdleAction;
- (OS_dispatch_queue)queue;
- (PBUpsellManager)init;
- (TVSBackgroundTask)checkTask;
- (double)_audioCheckTimeInterval;
- (double)_tipsKioskIdleStateNotifyDelay;
- (double)checkTimeInterval;
- (id)_currentAudioDestinationIdentifier;
- (id)_selectedUserProfile;
- (int)tipsKioskIdleStateNotifyToken;
- (void)_presentOdeonUpsellIfNeeded;
- (void)_presentRMVUpsellIfNeeded;
- (void)_presentRepairFlow;
- (void)_queue_notifyTipsKioskStateIsIdle:(BOOL)a3;
- (void)_scheduleAudioUpsellCheckTaskWithInterval:(double)a3;
- (void)_shouldPresentRMVUpsell:(id)a3;
- (void)noteGoodTimeToShowUpsell;
- (void)sceneManager:(id)a3 didChangeFocusFromScene:(id)a4 toScene:(id)a5;
- (void)setCheckTask:(id)a3;
- (void)setCheckTimeInterval:(double)a3;
- (void)setRetryUpsell:(BOOL)a3;
- (void)setSiriConnection:(id)a3;
- (void)startUpsellMonitoringIfNeeded;
@end

@implementation PBUpsellManager

+ (id)sharedInstance
{
  if (qword_100471058 != -1) {
    dispatch_once(&qword_100471058, &stru_1003D9140);
  }
  return (id)qword_100471050;
}

- (PBUpsellManager)init
{
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___PBUpsellManager;
  v2 = -[PBUpsellManager init](&v16, "init");
  if (v2)
  {
    dispatch_queue_attr_t v3 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v3);
    dispatch_queue_attr_t v5 = dispatch_queue_attr_make_with_qos_class(v4, QOS_CLASS_BACKGROUND, 0);
    v6 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v5);

    dispatch_queue_t v7 = dispatch_queue_create("com.apple.PineBoard.upsell", v6);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v7;

    uint32_t v9 = notify_register_check( "com.apple.PineBoard.TipsKioskIdle.State.Notification",  &v2->_tipsKioskIdleStateNotifyToken);
    if (v9)
    {
      uint32_t v10 = v9;
      id v11 = sub_1000843B0();
      v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        uint32_t v18 = v10;
        _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Failed to register kiosk idle state notification {result=%x}",  buf,  8u);
      }
    }

    v13 = objc_alloc_init(&OBJC_CLASS___AFSettingsConnection);
    siriConnection = v2->_siriConnection;
    v2->_siriConnection = v13;
  }

  return v2;
}

- (void)startUpsellMonitoringIfNeeded
{
  dispatch_queue_attr_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[PBDialogManager sharedInstance](&OBJC_CLASS___PBDialogManager, "sharedInstance"));
  [v3 addObserver:self];

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[PBSceneManager sharedInstance](&OBJC_CLASS___PBSceneManager, "sharedInstance"));
  [v4 addObserver:self];

  -[PBUpsellManager _audioCheckTimeInterval](self, "_audioCheckTimeInterval");
  -[PBUpsellManager _scheduleAudioUpsellCheckTaskWithInterval:](self, "_scheduleAudioUpsellCheckTaskWithInterval:");
}

- (void)noteGoodTimeToShowUpsell
{
  if (-[PBUpsellManager retryUpsell](self, "retryUpsell"))
  {
    -[PBUpsellManager _presentOdeonUpsellIfNeeded](self, "_presentOdeonUpsellIfNeeded");
    -[PBUpsellManager _presentRMVUpsellIfNeeded](self, "_presentRMVUpsellIfNeeded");
    -[PBUpsellManager setRetryUpsell:](self, "setRetryUpsell:", 0LL);
  }

- (BOOL)_isHeadBoardAppFocused
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[PBSceneManager sharedInstance](&OBJC_CLASS___PBSceneManager, "sharedInstance"));
  dispatch_queue_attr_t v3 = (void *)objc_claimAutoreleasedReturnValue([v2 focusedSceneHandle]);
  unsigned __int8 v4 = [v3 isDefaultKioskAppScene];

  return v4;
}

- (double)_audioCheckTimeInterval
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  [v2 odeonDestinationCheckTimeIntervalInSeconds];
  double v4 = v3;

  return v4;
}

- (id)_currentAudioDestinationIdentifier
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[TVCSHomeManager sharedInstance](&OBJC_CLASS___TVCSHomeManager, "sharedInstance"));
  double v3 = (void *)objc_claimAutoreleasedReturnValue([v2 localAccessory]);
  double v4 = (void *)objc_claimAutoreleasedReturnValue([v3 hmAccessory]);
  dispatch_queue_attr_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 audioDestinationController]);

  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 destination]);
  dispatch_queue_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 audioDestinationIdentifier]);

  return v7;
}

- (double)_tipsKioskIdleStateNotifyDelay
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  [v2 tipsKioskIdleNotifyDelayInSeconds];
  double v4 = v3;

  return v4;
}

- (void)_queue_notifyTipsKioskStateIsIdle:(BOOL)a3
{
  unsigned int v3 = a3;
  if (!notify_is_valid_token(self->_tipsKioskIdleStateNotifyToken))
  {
    if (!v3) {
      goto LABEL_9;
    }
    goto LABEL_6;
  }

  uint64_t v10 = 0LL;
  int tipsKioskIdleStateNotifyToken = self->_tipsKioskIdleStateNotifyToken;
  if ((v3 & 1) == 0)
  {
    notify_set_state(tipsKioskIdleStateNotifyToken, v3);
    goto LABEL_9;
  }

  if (notify_get_state(tipsKioskIdleStateNotifyToken, &v10))
  {
    notify_set_state(self->_tipsKioskIdleStateNotifyToken, v3);
    goto LABEL_6;
  }

  uint64_t v9 = v10;
  notify_set_state(self->_tipsKioskIdleStateNotifyToken, v3);
  if (v9 != v3)
  {
LABEL_6:
    notify_post("com.apple.PineBoard.TipsKioskIdle.State.Notification");
    id v6 = sub_1000843B0();
    dispatch_queue_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      LODWORD(v10) = 67109120;
      HIDWORD(v10) = v3;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "Updated kiosk idle state {idle=%{BOOL}d}",  (uint8_t *)&v10,  8u);
    }

    goto LABEL_11;
  }

- (void)_scheduleAudioUpsellCheckTaskWithInterval:(double)a3
{
  if (self->_checkTask)
  {
    dispatch_queue_attr_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[TVSBackgroundTaskManager sharedInstance](&OBJC_CLASS___TVSBackgroundTaskManager, "sharedInstance"));
    [v5 unregisterBackgroundTask:self->_checkTask];

    checkTask = self->_checkTask;
    self->_checkTask = 0LL;
  }

  dispatch_queue_t v7 = -[TVSBackgroundTask initWithType:interval:delay:async:]( objc_alloc(&OBJC_CLASS___TVSBackgroundTask),  "initWithType:interval:delay:async:",  1LL,  1LL,  a3,  a3);
  id v8 = self->_checkTask;
  self->_checkTask = v7;

  objc_initWeak(&location, self);
  uint64_t v9 = self->_checkTask;
  id v11 = _NSConcreteStackBlock;
  uint64_t v12 = 3221225472LL;
  v13 = sub_100145EC4;
  v14 = &unk_1003D0890;
  objc_copyWeak(&v15, &location);
  -[TVSBackgroundTask setPerformBlock:](v9, "setPerformBlock:", &v11);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( +[TVSBackgroundTaskManager sharedInstance]( &OBJC_CLASS___TVSBackgroundTaskManager,  "sharedInstance",  v11,  v12,  v13,  v14));
  [v10 registerBackgroundTask:self->_checkTask];

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

- (void)_presentOdeonUpsellIfNeeded
{
  if (MGGetProductType(self, a2) == 1110205732)
  {
    uint64_t v3 = TVCSHomeLog(1110205732LL);
    double v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      dispatch_queue_attr_t v5 = "Skipping Odeon upsell on unsupported device";
LABEL_7:
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, v5, buf, 2u);
    }
  }

  else
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[PBUpsellManager _currentAudioDestinationIdentifier](self, "_currentAudioDestinationIdentifier"));

    if (v6)
    {
      uint64_t v8 = TVCSHomeLog(v7);
      double v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        dispatch_queue_attr_t v5 = "Skipping Odeon upsell because Odeon is already configured";
        goto LABEL_7;
      }
    }

    else
    {
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[TVCSHomeManager sharedInstance](&OBJC_CLASS___TVCSHomeManager, "sharedInstance"));
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 localAccessory]);
      id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 hmAccessory]);
      double v4 = (os_log_s *)objc_claimAutoreleasedReturnValue([v11 audioDestinationController]);

      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s availableDestinations](v4, "availableDestinations"));
      id v13 = [v12 count];

      if (v13)
      {
        v53 = self;
        id v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
        objc_super v16 = (void *)objc_claimAutoreleasedReturnValue([v15 odeonPromptHistory]);

        v54 = v4;
        v17 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s availableDestinations](v4, "availableDestinations"));
        uint32_t v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v17 count]));
        __int128 v66 = 0u;
        __int128 v67 = 0u;
        __int128 v68 = 0u;
        __int128 v69 = 0u;
        id v19 = v17;
        id v56 = v19;
        id v60 = [v19 countByEnumeratingWithState:&v66 objects:v72 count:16];
        if (v60)
        {
          uint64_t v59 = *(void *)v67;
          v58 = (void *)PBSHomeTheaterSpeakerTypeHomePodStereoPair;
          v57 = (void *)PBSHomeTheaterSpeakerTypeHomePod;
          v55 = v18;
          do
          {
            v20 = 0LL;
            do
            {
              if (*(void *)v67 != v59) {
                objc_enumerationMutation(v19);
              }
              v21 = *(void **)(*((void *)&v66 + 1) + 8LL * (void)v20);
              uint64_t v22 = objc_opt_class(&OBJC_CLASS___HMMediaSystem);
              if ((objc_opt_isKindOfClass(v21, v22) & 1) != 0
                || (uint64_t v23 = objc_opt_class(&OBJC_CLASS___HMAccessory), (objc_opt_isKindOfClass(v21, v23) & 1) != 0))
              {
                v24 = (void *)objc_claimAutoreleasedReturnValue([v21 uniqueIdentifier]);
                v25 = (void *)objc_claimAutoreleasedReturnValue([v24 UUIDString]);
              }

              else
              {
                v25 = 0LL;
              }

              id v26 = [v16 containsObject:v25];
              if ((v26 & 1) != 0
                || (v27 = (void *)objc_claimAutoreleasedReturnValue([v21 audioDestinationIdentifier]),
                    unsigned int v28 = [v16 containsObject:v27],
                    v27,
                    v28))
              {
                uint64_t v29 = TVCSHomeLog(v26);
                v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
                if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412290;
                  id v71 = v25;
                  _os_log_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_DEFAULT,  "Skipping Odeon upsell for %@ because it was already shown",  buf,  0xCu);
                }
              }

              else
              {
                v30 = (os_log_s *)objc_claimAutoreleasedReturnValue([v21 audioDestinationName]);
                uint64_t v31 = objc_opt_class(&OBJC_CLASS___HMMediaSystem);
                char isKindOfClass = objc_opt_isKindOfClass(v21, v31);
                v33 = v58;
                if ((isKindOfClass & 1) == 0) {
                  v33 = v57;
                }
                id v34 = v33;
                if ((isKindOfClass & 1) != 0)
                {
                  v35 = (void *)objc_claimAutoreleasedReturnValue([v21 components]);
                  v36 = (void *)objc_claimAutoreleasedReturnValue([v35 firstObject]);
                  v37 = v16;
                  v38 = (void *)objc_claimAutoreleasedReturnValue([v36 mediaProfile]);
                  v39 = (void *)objc_claimAutoreleasedReturnValue([v38 accessory]);
                  id v40 = [v39 homePodVariant];

                  objc_super v16 = v37;
                  id v19 = v56;

                  uint32_t v18 = v55;
                }

                else
                {
                  id v40 = [v21 homePodVariant];
                }

                id v41 = [[TVSUIHomeTheaterSpeaker alloc] initWithName:v30 type:v34 destinationIdentifier:v25 homePodVariant:v40];
                uint64_t v42 = TVCSHomeLog(v41);
                v43 = (os_log_s *)objc_claimAutoreleasedReturnValue(v42);
                if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 138412290;
                  id v71 = v41;
                  _os_log_debug_impl( (void *)&_mh_execute_header,  v43,  OS_LOG_TYPE_DEBUG,  "Adding speaker: %@",  buf,  0xCu);
                }

                [v18 addObject:v41];
              }

              v20 = (char *)v20 + 1;
            }

            while (v60 != v20);
            id v60 = [v19 countByEnumeratingWithState:&v66 objects:v72 count:16];
          }

          while (v60);
        }

        if ([v18 count])
        {
          -[PBUpsellManager setRetryUpsell:](v53, "setRetryUpsell:", 0LL);
          id v44 = objc_alloc(&OBJC_CLASS___TVSUIHomeTheaterSpeakerPickerViewController);
          v45 = (void *)objc_claimAutoreleasedReturnValue(+[PBSSiriSettings sharedInstance](&OBJC_CLASS___PBSSiriSettings, "sharedInstance"));
          id v46 = objc_msgSend(v44, "initWithSpeakers:isSiriEnabled:", v18, objc_msgSend(v45, "isSiriEnabled"));

          v64[0] = _NSConcreteStackBlock;
          v64[1] = 3221225472LL;
          v64[2] = sub_10014664C;
          v64[3] = &unk_1003D9188;
          id v65 = (id)objc_claimAutoreleasedReturnValue( +[PBDialogContext contextWithViewController:]( &OBJC_CLASS___PBDialogContext,  "contextWithViewController:",  v46));
          id v47 = v65;
          uint64_t v48 = TVCSHomeLog([v46 setCompletionHandler:v64]);
          v49 = (os_log_s *)objc_claimAutoreleasedReturnValue(v48);
          if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            id v71 = v18;
            _os_log_impl( (void *)&_mh_execute_header,  v49,  OS_LOG_TYPE_DEFAULT,  "Presenting Odeon upsell with speakers: %@",  buf,  0xCu);
          }

          v50 = (void *)objc_claimAutoreleasedReturnValue(+[PBDialogManager sharedInstance](&OBJC_CLASS___PBDialogManager, "sharedInstance"));
          v61[0] = _NSConcreteStackBlock;
          v61[1] = 3221225472LL;
          v61[2] = sub_100146CCC;
          v61[3] = &unk_1003D4A98;
          id v62 = v16;
          id v63 = v18;
          [v50 presentDialogWithContext:v47 options:0 completion:v61];

          double v4 = v54;
          id v19 = v56;
        }

        else
        {
          uint64_t v52 = TVCSHomeLog(0LL);
          id v46 = (id)objc_claimAutoreleasedReturnValue(v52);
          if (os_log_type_enabled((os_log_t)v46, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v46,  OS_LOG_TYPE_DEFAULT,  "Skipping Odeon upsell because there are no eligible destinations.",  buf,  2u);
          }

          double v4 = v54;
        }
      }

      else
      {
        uint64_t v51 = TVCSHomeLog(v14);
        objc_super v16 = (void *)objc_claimAutoreleasedReturnValue(v51);
        if (os_log_type_enabled((os_log_t)v16, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v16,  OS_LOG_TYPE_DEFAULT,  "Skipping Odeon upsell because there are no available destinations",  buf,  2u);
        }
      }
    }
  }
}

- (id)_selectedUserProfile
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[PBUserProfileManager sharedInstance](&OBJC_CLASS___PBUserProfileManager, "sharedInstance"));
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v2 userProfilesSnapshot]);
  double v4 = (void *)objc_claimAutoreleasedReturnValue([v3 selectedUserProfile]);

  return v4;
}

- (BOOL)_isManateeAvailable
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[PBUpsellManager _selectedUserProfile](self, "_selectedUserProfile"));
  double v4 = (void *)objc_claimAutoreleasedReturnValue([v3 iCloudAltDSID]);

  if (v4)
  {
    dispatch_queue_attr_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[CDPContext contextForAccountWithAltDSID:]( &OBJC_CLASS___CDPContext,  "contextForAccountWithAltDSID:",  v4));
    id v6 = [[CDPStateController alloc] initWithContext:v5];
    unsigned __int8 v7 = [v6 isManateeAvailable:0];
  }

  else
  {
    unsigned __int8 v7 = 0;
  }

  return v7;
}

- (void)_presentRMVUpsellIfNeeded
{
  v17[0] = 0LL;
  v17[1] = v17;
  v17[2] = 0x2020000000LL;
  char v18 = 0;
  v15[0] = 0LL;
  v15[1] = v15;
  v15[2] = 0x2020000000LL;
  char v16 = 0;
  uint64_t v3 = dispatch_group_create();
  objc_initWeak(&location, self);
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(21LL, 0LL);
  dispatch_queue_attr_t v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100147190;
  block[3] = &unk_1003D91B0;
  block[4] = v17;
  objc_copyWeak(&v13, &location);
  dispatch_group_async(v3, v5, block);

  dispatch_group_enter(v3);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_1001471CC;
  v9[3] = &unk_1003D91D8;
  id v11 = v15;
  id v6 = v3;
  uint64_t v10 = v6;
  -[PBUpsellManager _shouldPresentRMVUpsell:](self, "_shouldPresentRMVUpsell:", v9);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1001471F0;
  v7[3] = &unk_1003D92B8;
  objc_copyWeak(&v8, &location);
  v7[4] = v15;
  v7[5] = v17;
  dispatch_group_notify(v6, &_dispatch_main_q, v7);
  objc_destroyWeak(&v8);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);

  _Block_object_dispose(v15, 8);
  _Block_object_dispose(v17, 8);
}

- (void)_shouldPresentRMVUpsell:(id)a3
{
  double v4 = (void (**)(id, void))a3;
  dispatch_queue_attr_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[PBUpsellManager _selectedUserProfile](self, "_selectedUserProfile"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 iCloudAltDSID]);
  unsigned __int8 v7 = (void *)objc_claimAutoreleasedReturnValue([v5 identifier]);
  if (!v6)
  {
    id v12 = sub_1000843B0();
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Skipping RMV upsell due to no iCloud altDSID",  (uint8_t *)&buf,  2u);
    }

    goto LABEL_13;
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSUserDefaults pineBoardServicesUserDefaults]( &OBJC_CLASS___NSUserDefaults,  "pineBoardServicesUserDefaults"));
  unsigned int v9 = objc_msgSend(v8, "pbs_rmvShownToUserWithIdentifier:", v7);

  if (v9)
  {
    id v10 = sub_1000843B0();
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138543362;
      *(void *)((char *)&buf + 4) = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Skipping RMV upsell because it was already shown. {userIdentifier=%{public}@}",  (uint8_t *)&buf,  0xCu);
    }

- (void)_presentRepairFlow
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PBUpsellManager _selectedUserProfile](self, "_selectedUserProfile"));
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v2 identifier]);
  double v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"prefs:root=USERS&userIdentifier=%@&action=repairCDPThenEnableRMV",  v3));
  dispatch_queue_attr_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v4));

  dispatch_queue_global_t global_queue = dispatch_get_global_queue(25LL, 0LL);
  unsigned __int8 v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001482DC;
  block[3] = &unk_1003CFF08;
  id v10 = v5;
  id v8 = v5;
  dispatch_async(v7, block);
}

- (void)sceneManager:(id)a3 didChangeFocusFromScene:(id)a4 toScene:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = -[PBSceneHandle initWithScene:](objc_alloc(&OBJC_CLASS___PBSceneHandle), "initWithScene:", v10);
  if (-[PBSceneHandle isDefaultKioskAppScene](v11, "isDefaultKioskAppScene"))
  {
    objc_initWeak(&location, self);
    -[PBUpsellManager _tipsKioskIdleStateNotifyDelay](self, "_tipsKioskIdleStateNotifyDelay");
    double v13 = v12;
    queue = self->_queue;
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472LL;
    v25[2] = sub_100148534;
    v25[3] = &unk_1003D0890;
    id v15 = &v26;
    objc_copyWeak(&v26, &location);
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472LL;
    v23[2] = sub_100148590;
    v23[3] = &unk_1003D0890;
    objc_copyWeak(&v24, &location);
    char v16 = (BSInvalidatable *)objc_claimAutoreleasedReturnValue( +[PBAttentionMonitor afterIdleInterval:reason:queue:perform:invalidationHandler:]( &OBJC_CLASS___PBAttentionMonitor,  "afterIdleInterval:reason:queue:perform:invalidationHandler:",  @"UpsellTips",  queue,  v25,  v23,  v13));
    tipsKioskIdleAction = self->_tipsKioskIdleAction;
    self->_tipsKioskIdleAction = v16;

    objc_destroyWeak(&v24);
LABEL_6:
    objc_destroyWeak(v15);
    objc_destroyWeak(&location);
    goto LABEL_7;
  }

  char v18 = self->_tipsKioskIdleAction;
  if (!v18)
  {
    objc_initWeak(&location, self);
    v20 = (dispatch_queue_s *)self->_queue;
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472LL;
    v21[2] = sub_1001485C0;
    v21[3] = &unk_1003D0890;
    id v15 = &v22;
    objc_copyWeak(&v22, &location);
    dispatch_async(v20, v21);
    goto LABEL_6;
  }

  -[BSInvalidatable invalidate](v18, "invalidate");
  id v19 = self->_tipsKioskIdleAction;
  self->_tipsKioskIdleAction = 0LL;

LABEL_7:
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (TVSBackgroundTask)checkTask
{
  return self->_checkTask;
}

- (void)setCheckTask:(id)a3
{
}

- (double)checkTimeInterval
{
  return self->_checkTimeInterval;
}

- (void)setCheckTimeInterval:(double)a3
{
  self->_checkTimeInterval = a3;
}

- (BOOL)retryUpsell
{
  return self->_retryUpsell;
}

- (void)setRetryUpsell:(BOOL)a3
{
  self->_retryUpsell = a3;
}

- (AFSettingsConnection)siriConnection
{
  return self->_siriConnection;
}

- (void)setSiriConnection:(id)a3
{
}

- (BSInvalidatable)tipsKioskIdleAction
{
  return self->_tipsKioskIdleAction;
}

- (int)tipsKioskIdleStateNotifyToken
{
  return self->_tipsKioskIdleStateNotifyToken;
}

- (void).cxx_destruct
{
}

@end
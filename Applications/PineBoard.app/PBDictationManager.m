@interface PBDictationManager
+ (BOOL)_isDictationEnabled;
+ (PBDependencyDescription)dependencyDescription;
+ (id)sharedInstance;
- (BOOL)isPresenting;
- (NSHashTable)observers;
- (NSString)dictationDeviceIdentifier;
- (PBCoordinatedTransitionToken)coordinatedTransitionToken;
- (PBDictationManager)init;
- (PBSystemGestureHandle)dismissGesture;
- (PBSystemGestureHandle)listenGesture;
- (PBSystemGestureHandle)presentGesture;
- (PBSystemUIServiceDictationDeviceIdentifierPublishing)dictationPresentationStatePublisher;
- (id)_currentSceneHandle;
- (id)_init;
- (id)transitionCoordinator:(id)a3 willDismissTransitionWithToken:(id)a4 withContext:(id)a5;
- (int64_t)activateDictationWithContext:(id)a3;
- (int64_t)startDictationWithContext:(id)a3;
- (int64_t)stopDictationWithContext:(id)a3;
- (void)_notifyObserversDictationDidHandleActivationWithResult:(int64_t)a3;
- (void)_setupGesturesWithManager:(id)a3;
- (void)_updateGesturesWithDictationDeviceIdentifier:(id)a3 forReason:(id)a4;
- (void)addObserver:(id)a3;
- (void)removeObserver:(id)a3;
- (void)resetAfterDictation;
- (void)sceneManager:(id)a3 didUpdateSystemInputActive:(BOOL)a4 forFocusedScene:(id)a5;
- (void)setDictationDeviceIdentifier:(id)a3;
- (void)setDictationPresentationStatePublisher:(id)a3;
- (void)setObservers:(id)a3;
- (void)siriManager:(id)a3 didUpdateEnabledState:(BOOL)a4;
- (void)siriManagerDidUpdatePresenting:(id)a3;
@end

@implementation PBDictationManager

+ (PBDependencyDescription)dependencyDescription
{
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_1000BA9FC;
  v14[3] = &unk_1003CFF78;
  v14[4] = a1;
  v2 = -[PBDependencyDescription initWithInstanceProvider:]( objc_alloc(&OBJC_CLASS___PBDependencyDescription),  "initWithInstanceProvider:",  v14);
  uint64_t v4 = objc_opt_self(&OBJC_CLASS___PBSystemGestureManager, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v15[0] = v5;
  uint64_t v7 = objc_opt_self(&OBJC_CLASS___PBSceneManager, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v15[1] = v8;
  uint64_t v10 = objc_opt_self(&OBJC_CLASS___PBSiriManager, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  v15[2] = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v15, 3LL));
  -[PBDependencyDescription addDependencies:](v2, "addDependencies:", v12);

  return v2;
}

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000BAA94;
  block[3] = &unk_1003D0680;
  block[4] = a1;
  if (qword_1004709E0 != -1) {
    dispatch_once(&qword_1004709E0, block);
  }
  return (id)qword_1004709D8;
}

- (PBDictationManager)init
{
  id v2 = (id)objc_claimAutoreleasedReturnValue( +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  @"Unimplemented",  @"-[PBDictationManager init] not supported, use +sharedInstance instead",  0LL));
  objc_exception_throw(v2);
  return (PBDictationManager *)-[PBDictationManager _init](v3, v4);
}

- (id)_init
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___PBDictationManager;
  id v2 = -[PBDictationManager init](&v8, "init");
  if (v2)
  {
    uint64_t v3 = objc_claimAutoreleasedReturnValue(+[NSHashTable weakObjectsHashTable](&OBJC_CLASS___NSHashTable, "weakObjectsHashTable"));
    observers = v2->_observers;
    v2->_observers = (NSHashTable *)v3;

    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472LL;
    v6[2] = sub_1000BABAC;
    v6[3] = &unk_1003D0FA8;
    uint64_t v7 = v2;
    +[PBDependencyCoordinator registerInstance:dependencyBlock:]( &OBJC_CLASS___PBDependencyCoordinator,  "registerInstance:dependencyBlock:",  v7,  v6);
  }

  return v2;
}

- (int64_t)activateDictationWithContext:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[PBSSiriSettings sharedInstance](&OBJC_CLASS___PBSSiriSettings, "sharedInstance"));
  else {
    int64_t v6 = 0LL;
  }

  id v7 = sub_100082A24();
  objc_super v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[PBSSiriSettings sharedInstance](&OBJC_CLASS___PBSSiriSettings, "sharedInstance"));
    *(_DWORD *)buf = 136315394;
    v110 = "-[PBDictationManager activateDictationWithContext:]";
    __int16 v111 = 1024;
    *(_DWORD *)v112 = [v9 isDictationEnabled];
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s; enabled = %{BOOL}d", buf, 0x12u);
  }

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[PBSSiriSettings sharedInstance](&OBJC_CLASS___PBSSiriSettings, "sharedInstance"));
  unsigned int v11 = [v10 isDictationEnabled];

  if (!v11) {
    goto LABEL_70;
  }
  id v90 = v4;
  int v12 = _os_feature_enabled_impl("PineBoard", "PressToDictateSystemOverlay");
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[PBSceneManager sharedInstance](&OBJC_CLASS___PBSceneManager, "sharedInstance"));
  v14 = (void *)objc_claimAutoreleasedReturnValue([v13 focusedSceneHandle]);
  v15 = (void *)objc_claimAutoreleasedReturnValue([v14 uiClientSettings]);
  unsigned int v94 = [v15 systemInputActive];

  v92 = (void *)objc_claimAutoreleasedReturnValue(-[PBDictationManager dictationDeviceIdentifier](self, "dictationDeviceIdentifier"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[PBDictationManager _currentSceneHandle](self, "_currentSceneHandle"));
  v17 = (void *)objc_claimAutoreleasedReturnValue([v16 uiClientSettings]);
  unsigned int v93 = [v17 containsSearchView];

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[PBDictationManager _currentSceneHandle](self, "_currentSceneHandle"));
  unsigned int v89 = [v18 isDefaultKioskAppScene];

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[PBDictationManager _currentSceneHandle](self, "_currentSceneHandle"));
  v20 = (void *)objc_claimAutoreleasedReturnValue([v19 clientProcessBundleIdentifier]);

  id v21 = v20;
  id v22 = [[LNMetadataProvider alloc] initWithOptions:0];
  v23 = (void *)objc_claimAutoreleasedReturnValue( +[LNSystemProtocol showInAppStringSearchResultsProtocol]( &OBJC_CLASS___LNSystemProtocol,  "showInAppStringSearchResultsProtocol"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](&OBJC_CLASS___NSSet, "setWithObject:", v23));
  id v105 = 0LL;
  v25 = (void *)objc_claimAutoreleasedReturnValue( [v22 actionsConformingToSystemProtocols:v24 logicalType:1 bundleIdentifier:v21 error:&v105]);
  id v26 = v105;

  v96 = v26;
  if (v26)
  {
    id v27 = sub_100082A24();
    v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
      sub_10027BC80((uint64_t)v21, (uint64_t)v26, v28);
    }
  }

  int v95 = v12;
  v91 = v25;
  __int128 v101 = 0u;
  __int128 v102 = 0u;
  __int128 v103 = 0u;
  __int128 v104 = 0u;
  id v29 = (id)objc_claimAutoreleasedReturnValue([v25 objectForKey:v21]);
  id v98 = [v29 countByEnumeratingWithState:&v101 objects:buf count:16];
  if (v98)
  {
    id v85 = v22;
    int64_t v86 = v6;
    id v87 = v21;
    v88 = self;
    uint64_t v30 = *(void *)v102;
    uint64_t v31 = LNSystemProtocolIdentifierShowInAppStringSearchResults;
    v32 = &MRMediaRemoteGetActivePlayerPathsForOrigin_ptr;
    id v97 = v29;
    while (2)
    {
      for (i = 0LL; i != v98; i = (char *)i + 1)
      {
        if (*(void *)v102 != v30) {
          objc_enumerationMutation(v29);
        }
        v34 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v29,  "objectForKey:",  *(void *)(*((void *)&v101 + 1) + 8 * (void)i),  v85,  v86));
        v35 = (void *)objc_claimAutoreleasedReturnValue([v34 systemProtocols]);
        v36 = (void *)objc_claimAutoreleasedReturnValue([v32[223] showInAppStringSearchResultsProtocol]);
        unsigned int v37 = [v35 containsObject:v36];

        if (v37)
        {
          v38 = (void *)objc_claimAutoreleasedReturnValue([v34 systemProtocolMetadata]);
          v39 = (void *)objc_claimAutoreleasedReturnValue([v38 objectForKey:v31]);

          uint64_t v40 = objc_opt_class(&OBJC_CLASS___LNShowInAppStringSearchResultsSystemProtocolMetadata);
          if ((objc_opt_isKindOfClass(v39, v40) & 1) != 0)
          {
            id v41 = v39;
            v42 = (void *)objc_claimAutoreleasedReturnValue([v41 searchScopes]);
            unsigned int v43 = [v42 containsObject:@"general"];

            if (v43)
            {
              id v45 = sub_100082A24();
              v46 = (os_log_s *)objc_claimAutoreleasedReturnValue(v45);
              id v21 = v87;
              id v29 = v97;
              if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)v107 = 138543362;
                id v108 = v87;
                _os_log_impl( (void *)&_mh_execute_header,  v46,  OS_LOG_TYPE_DEFAULT,  "Foreground app supports ShowInAppStringSearchResultsIntent. Client app bundleID = %{public}@",  v107,  0xCu);
              }

              int v44 = 1;
              id v4 = v90;
              self = v88;
              goto LABEL_27;
            }

            v32 = &MRMediaRemoteGetActivePlayerPathsForOrigin_ptr;
            id v29 = v97;
          }
        }
      }

      id v98 = [v29 countByEnumeratingWithState:&v101 objects:buf count:16];
      if (v98) {
        continue;
      }
      break;
    }

    int v44 = 0;
    id v4 = v90;
    id v21 = v87;
    self = v88;
LABEL_27:
    id v22 = v85;
    int64_t v6 = v86;
    int v47 = v95;
  }

  else
  {
    int v44 = 0;
    int v47 = v95;
    id v4 = v90;
  }

  int v48 = v93 & ~v94;
  if (v92) {
    char v49 = 1;
  }
  else {
    char v49 = v94;
  }
  if ((v49 & 1) == 0 && !v48)
  {
    int v50 = v44 ^ 1;
    if ((v47 & 1) != 0 || !(v89 | v50))
    {
      if ((((v47 & v89 | v44) ^ 1 | v93) & 1) != 0)
      {
        int v59 = v47 & (v50 | v93);
        v60 = (void *)objc_claimAutoreleasedReturnValue(+[PBScreenSaverManager sharedInstance](&OBJC_CLASS___PBScreenSaverManager, "sharedInstance"));
        unsigned int v61 = [v60 isPresenting];

        if (v61)
        {
          v62 = (void *)objc_claimAutoreleasedReturnValue(+[PBScreenSaverManager sharedInstance](&OBJC_CLASS___PBScreenSaverManager, "sharedInstance"));
          [v62 dismissScreenSaver];
        }

        if (v59)
        {
          id v63 = sub_100082A24();
          v64 = (os_log_s *)objc_claimAutoreleasedReturnValue(v63);
          if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543618;
            v110 = (const char *)v21;
            __int16 v111 = 1024;
            *(_DWORD *)v112 = v47;
            _os_log_impl( (void *)&_mh_execute_header,  v64,  OS_LOG_TYPE_DEFAULT,  "Unsuccessful dictation activation. Playing feedback audio (Single press). Foreground app: %{public}@; Pres"
              "sToDictate enabled system wide: %{BOOL}d",
              buf,
              0x12u);
          }

          sub_1001C9114(0LL);
          int64_t v6 = 3LL;
        }
      }

      else if (v47 && AFPreferencesTypeToSiriEnabled())
      {
        if ((v89 & 1) != 0)
        {
          int64_t v6 = 0LL;
        }

        else
        {
          id v76 = sub_100082A24();
          v77 = (os_log_s *)objc_claimAutoreleasedReturnValue(v76);
          if (os_log_type_enabled(v77, OS_LOG_TYPE_DEBUG)) {
            sub_10027BC1C((uint64_t)v21, v77, v78, v79, v80, v81, v82, v83);
          }

          v84 = objc_alloc_init(&OBJC_CLASS____TtC9PineBoard45PBShowInAppStringSearchResultsIntentPrototype);
          v99[0] = _NSConcreteStackBlock;
          v99[1] = 3221225472LL;
          v99[2] = sub_1000BB670;
          v99[3] = &unk_1003D1F08;
          id v100 = v21;
          -[PBShowInAppStringSearchResultsIntentPrototype performWithBundleIdentifier:term:completionHandler:]( v84,  "performWithBundleIdentifier:term:completionHandler:",  v100,  &stru_1003E2910,  v99);

          int64_t v6 = 4LL;
        }
      }

      else
      {
        int64_t v65 = v6;
        v66 = (char *)objc_claimAutoreleasedReturnValue(+[NSLocale _deviceLanguage](&OBJC_CLASS___NSLocale, "_deviceLanguage"));
        uint64_t v67 = AFPreferencesSupportedDictationLanguages();
        v68 = (void *)objc_claimAutoreleasedReturnValue(v67);
        v106 = v66;
        v69 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v106, 1LL));
        v70 = (void *)objc_claimAutoreleasedReturnValue( +[NSLocale matchedLanguagesFromAvailableLanguages:forPreferredLanguages:]( &OBJC_CLASS___NSLocale,  "matchedLanguagesFromAvailableLanguages:forPreferredLanguages:",  v68,  v69));

        if (v70 && [v70 count])
        {
          id v71 = sub_100082A24();
          v72 = (os_log_s *)objc_claimAutoreleasedReturnValue(v71);
          if (os_log_type_enabled(v72, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543874;
            v110 = (const char *)v21;
            __int16 v111 = 1024;
            *(_DWORD *)v112 = v95;
            *(_WORD *)&v112[4] = 1024;
            *(_DWORD *)&v112[6] = v44;
            _os_log_impl( (void *)&_mh_execute_header,  v72,  OS_LOG_TYPE_DEFAULT,  "Activating Dictation UI display (Single press). Foreground app: %{public}@; PressToDictate enabled system "
              "wide: %{BOOL}d; app receives search intent: %{BOOL}d",
              buf,
              0x18u);
          }

          v73 = (os_log_s *)objc_claimAutoreleasedReturnValue([v4 deviceID]);
          -[PBDictationManager setDictationDeviceIdentifier:](self, "setDictationDeviceIdentifier:", v73);
          int64_t v6 = 5LL;
        }

        else
        {
          id v74 = sub_100082A24();
          v73 = (os_log_s *)objc_claimAutoreleasedReturnValue(v74);
          if (os_log_type_enabled(v73, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v110 = v66;
            _os_log_impl( (void *)&_mh_execute_header,  v73,  OS_LOG_TYPE_INFO,  "Attempted to activate dictation with unsupported UI language %@.",  buf,  0xCu);
          }

          int64_t v6 = v65;
        }
      }
    }

    else
    {
      id v51 = sub_100082A24();
      v52 = (os_log_s *)objc_claimAutoreleasedReturnValue(v51);
      if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543874;
        v110 = (const char *)v21;
        __int16 v111 = 1024;
        *(_DWORD *)v112 = v47;
        *(_WORD *)&v112[4] = 1024;
        *(_DWORD *)&v112[6] = v44;
        _os_log_impl( (void *)&_mh_execute_header,  v52,  OS_LOG_TYPE_DEFAULT,  "Activating Siri (Single press). Foreground app: %{public}@; PressToDictate enabled system wide: %{BOOL}d; app "
          "receives search intent: %{BOOL}d",
          buf,
          0x18u);
      }

      v53 = (void *)objc_claimAutoreleasedReturnValue( +[PBAppDelegate sharedApplicationDelegate]( &OBJC_CLASS___PBAppDelegate,  "sharedApplicationDelegate"));
      [v53 activateSiriWithContext:v4];

      int64_t v6 = 2LL;
    }

LABEL_70:
    -[PBDictationManager _notifyObserversDictationDidHandleActivationWithResult:]( self,  "_notifyObserversDictationDidHandleActivationWithResult:",  v6);
    goto LABEL_71;
  }

  unsigned int v54 = [v4 isSourcePTTEligible] | v48;
  id v55 = sub_100082A24();
  v56 = (os_log_s *)objc_claimAutoreleasedReturnValue(v55);
  BOOL v57 = os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT);
  if (v54 == 1)
  {
    if (v57)
    {
      v58 = @"NO";
      if (v94) {
        v58 = @"YES";
      }
      *(_DWORD *)buf = 138543618;
      v110 = (const char *)v21;
      __int16 v111 = 2112;
      *(void *)v112 = v58;
      _os_log_impl( (void *)&_mh_execute_header,  v56,  OS_LOG_TYPE_DEFAULT,  "Forwarding mic press to foreground app (Single press): %{public}@. Keyboard focused: %@",  buf,  0x16u);
    }

    v56 = (os_log_s *)objc_claimAutoreleasedReturnValue([v4 deviceID]);
    int64_t v6 = 4LL;
    sub_1000319D8(12LL, 4LL, (uint64_t)-[os_log_s longLongValue](v56, "longLongValue"), 3uLL);
  }

  else
  {
    if (v57)
    {
      *(_DWORD *)buf = 138543362;
      v110 = (const char *)v21;
      _os_log_impl( (void *)&_mh_execute_header,  v56,  OS_LOG_TYPE_DEFAULT,  "Consuming mic press, source is ineligible for PTT (Single press): %{public}@. Keyboard focused: YES",  buf,  0xCu);
    }

    int64_t v6 = 5LL;
  }

LABEL_71:
  return v6;
}

- (void)setDictationDeviceIdentifier:(id)a3
{
  id v5 = a3;
  if ((BSEqualObjects(self->_dictationDeviceIdentifier, v5) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_dictationDeviceIdentifier, a3);
    int64_t v6 = (void *)objc_claimAutoreleasedReturnValue( -[PBDictationManager dictationPresentationStatePublisher]( self,  "dictationPresentationStatePublisher"));
    [v6 setDictationDeviceIdentifier:v5];

    -[PBDictationManager _updateGesturesWithDictationDeviceIdentifier:forReason:]( self,  "_updateGesturesWithDictationDeviceIdentifier:forReason:",  v5,  @"DictationDeviceChanged");
    if (self->_dictationDeviceIdentifier)
    {
      id v7 = -[PBCoordinatedTransitionFragmentDescriptor initWithType:provider:]( objc_alloc(&OBJC_CLASS___PBCoordinatedTransitionFragmentDescriptor),  "initWithType:provider:",  @"DismissDictationOverlay",  self);
      objc_super v8 = objc_alloc_init(&OBJC_CLASS___PBCoordinatedTransitionToken);
      coordinatedTransitionToken = self->_coordinatedTransitionToken;
      self->_coordinatedTransitionToken = v8;

      -[PBCoordinatedTransitionToken setRespondingFragmentDescriptor:]( self->_coordinatedTransitionToken,  "setRespondingFragmentDescriptor:",  v7);
      uint64_t v10 = objc_alloc_init(&OBJC_CLASS___PBCoordinatedTransition);
      -[PBCoordinatedTransition setCoordinatedTransitionToken:]( v10,  "setCoordinatedTransitionToken:",  self->_coordinatedTransitionToken);
      -[PBCoordinatedTransition begin](v10, "begin");
    }

    else
    {
      id v7 = (PBCoordinatedTransitionFragmentDescriptor *)self->_coordinatedTransitionToken;
      self->_coordinatedTransitionToken = 0LL;
    }
  }
}

- (int64_t)startDictationWithContext:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[PBSSiriSettings sharedInstance](&OBJC_CLASS___PBSSiriSettings, "sharedInstance"));
  unsigned __int8 v6 = [v5 isSiriEnabled];

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[PBDictationManager dictationDeviceIdentifier](self, "dictationDeviceIdentifier"));
  objc_super v8 = (void *)objc_claimAutoreleasedReturnValue(+[PBSceneManager sharedInstance](&OBJC_CLASS___PBSceneManager, "sharedInstance"));
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 focusedSceneHandle]);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 uiClientSettings]);
  unsigned __int8 v11 = [v10 systemInputActive];

  id v12 = sub_100082A24();
  v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
  if ((v6 & 1) != 0 || v7 || (v11 & 1) != 0)
  {
    if (v14)
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue([v4 deviceID]);
      int v20 = 134217984;
      v21[0] = [v18 longLongValue];
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Activating dictation (press and hold); deviceID: %lli",
        (uint8_t *)&v20,
        0xCu);
    }

    v16 = (void *)objc_claimAutoreleasedReturnValue([v4 deviceID]);
    sub_1000319D8(12, 4, (uint64_t)[v16 longLongValue], 1uLL);
    int64_t v17 = 6LL;
  }

  else
  {
    if (v14)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue([v4 deviceID]);
      int v20 = 67109376;
      LODWORD(v21[0]) = 0;
      WORD2(v21[0]) = 2048;
      *(void *)((char *)v21 + 6) = [v15 longLongValue];
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Activating dictation overlay (press and hold); isSiriDisabled:%{BOOL}d deviceID: %lli",
        (uint8_t *)&v20,
        0x12u);
    }

    v16 = (void *)objc_claimAutoreleasedReturnValue(+[PBAppDelegate sharedApplicationDelegate](&OBJC_CLASS___PBAppDelegate, "sharedApplicationDelegate"));
    [v16 activateDictationWithContext:v4];
    int64_t v17 = 5LL;
  }

  return v17;
}

- (int64_t)stopDictationWithContext:(id)a3
{
  id v3 = a3;
  id v4 = sub_100082A24();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue([v3 deviceID]);
    int v9 = 134217984;
    id v10 = [v6 longLongValue];
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Stopping dictation (press and hold); deviceID: %lli",
      (uint8_t *)&v9,
      0xCu);
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue([v3 deviceID]);
  sub_1000319D8(12, 4, (uint64_t)[v7 longLongValue], 2uLL);

  return 7LL;
}

- (void)resetAfterDictation
{
  dictationDeviceIdentifier = self->_dictationDeviceIdentifier;
  self->_dictationDeviceIdentifier = 0LL;

  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[PBDictationManager dictationPresentationStatePublisher](self, "dictationPresentationStatePublisher"));
  [v4 setDictationDeviceIdentifier:0];

  -[PBDictationManager _updateGesturesWithDictationDeviceIdentifier:forReason:]( self,  "_updateGesturesWithDictationDeviceIdentifier:forReason:",  0LL,  @"ResetAfterDictation");
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[PBDictationManager observers](self, "observers"));
  [v5 addObject:v4];
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[PBDictationManager observers](self, "observers"));
  [v5 removeObject:v4];
}

- (void)_notifyObserversDictationDidHandleActivationWithResult:(int64_t)a3
{
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[PBDictationManager observers](self, "observers", 0LL));
  id v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v11 + 1) + 8LL * (void)i);
        if ((objc_opt_respondsToSelector(v10, "dictationManager:didHandleActivationWithResult:") & 1) != 0) {
          [v10 dictationManager:self didHandleActivationWithResult:a3];
        }
      }

      id v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }

    while (v7);
  }
}

- (void)sceneManager:(id)a3 didUpdateSystemInputActive:(BOOL)a4 forFocusedScene:(id)a5
{
}

- (void)siriManager:(id)a3 didUpdateEnabledState:(BOOL)a4
{
}

- (void)siriManagerDidUpdatePresenting:(id)a3
{
}

- (id)transitionCoordinator:(id)a3 willDismissTransitionWithToken:(id)a4 withContext:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  __int128 v11 = self->_dictationDeviceIdentifier;
  if (v11)
  {
    objc_initWeak(&location, self);
    id v12 = objc_alloc(&OBJC_CLASS___BSBlockTransaction);
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_1000BBE90;
    void v15[3] = &unk_1003D22F0;
    objc_copyWeak(&v16, &location);
    v15[4] = v11;
    id v13 = [v12 initWithBlock:v15];
    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }

  else
  {
    id v13 = 0LL;
  }

  return v13;
}

+ (BOOL)_isDictationEnabled
{
  uint64_t v8 = 0LL;
  id v9 = &v8;
  uint64_t v10 = 0x2050000000LL;
  id v2 = (void *)qword_1004709E8;
  uint64_t v11 = qword_1004709E8;
  if (!qword_1004709E8)
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_1000BC774;
    v7[3] = &unk_1003D0790;
    v7[4] = &v8;
    sub_1000BC774((uint64_t)v7);
    id v2 = (void *)v9[3];
  }

  id v3 = v2;
  _Block_object_dispose(&v8, 8);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 sharedPreferences]);
  unsigned __int8 v5 = [v4 assistantIsEnabled];

  return v5;
}

- (id)_currentSceneHandle
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(+[PBScreenSaverManager sharedInstance](&OBJC_CLASS___PBScreenSaverManager, "sharedInstance"));
  unsigned int v3 = [v2 isPresenting];

  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[PBSceneManager sharedInstance](&OBJC_CLASS___PBSceneManager, "sharedInstance"));
  unsigned __int8 v5 = v4;
  if (v3) {
    uint64_t v6 = objc_claimAutoreleasedReturnValue([v4 currentApplicationSceneHandle]);
  }
  else {
    uint64_t v6 = objc_claimAutoreleasedReturnValue([v4 focusedSceneHandle]);
  }
  id v7 = (void *)v6;

  return v7;
}

- (void)_setupGesturesWithManager:(id)a3
{
  id v4 = a3;
  if (_os_feature_enabled_impl("PineBoard", "PressToDictate"))
  {
    objc_initWeak(&location, self);
    unsigned __int8 v5 = (PBSystemGestureHandle *)[v4 newHandleForSystemGesture:40 actionHandler:&stru_1003D55D0];
    presentGesture = self->_presentGesture;
    self->_presentGesture = v5;

    -[PBSystemGestureHandle acquire](self->_presentGesture, "acquire");
    id v7 = (PBSystemGestureHandle *)[v4 newHandleForSystemGesture:41 actionHandler:&stru_1003D55F0];
    listenGesture = self->_listenGesture;
    self->_listenGesture = v7;

    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_1000BC2B8;
    v11[3] = &unk_1003D1020;
    objc_copyWeak(&v12, &location);
    id v9 = (PBSystemGestureHandle *)[v4 newHandleForSystemGesture:42 actionHandler:v11];
    dismissGesture = self->_dismissGesture;
    self->_dismissGesture = v9;

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
}

- (void)_updateGesturesWithDictationDeviceIdentifier:(id)a3 forReason:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = _os_activity_create( (void *)&_mh_execute_header,  "dictation/manager/updateGestures",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v8, &v46);

  id v9 = sub_100082A24();
  uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    *(void *)int v48 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_INFO,  "Updating system dictation gestures {reason=%{public}@}",  buf,  0xCu);
  }

  id v11 = sub_100082A24();
  id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    sub_10027BF44(v12, v13, v14, v15, v16, v17, v18, v19);
  }

  -[PBSystemGestureHandle relinquish](self->_presentGesture, "relinquish");
  -[PBSystemGestureHandle relinquish](self->_listenGesture, "relinquish");
  -[PBSystemGestureHandle relinquish](self->_dismissGesture, "relinquish");
  int v20 = (void *)objc_claimAutoreleasedReturnValue(+[PBSiriManager sharedInstance](&OBJC_CLASS___PBSiriManager, "sharedInstance"));
  unsigned int v21 = [v20 isVisible];

  if (v21)
  {
    id v22 = sub_100082A24();
    v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      *(void *)int v48 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEFAULT,  "Done updating without any enablement. Siri is on screen. {reason=%{public}@}",  buf,  0xCu);
    }
  }

  else
  {
    _os_feature_enabled_impl("PineBoard", "PressToDictateSystemOverlay");
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[PBSceneManager sharedInstance](&OBJC_CLASS___PBSceneManager, "sharedInstance"));
    v25 = (void *)objc_claimAutoreleasedReturnValue([v24 focusedSceneHandle]);
    id v26 = (void *)objc_claimAutoreleasedReturnValue([v25 uiClientSettings]);
    unsigned int v27 = [v26 systemInputActive];

    v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
    unsigned int v29 = [v28 BOOLForKey:@"UseLegacyKeyboardMicButtonBehavior"];

    uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue(+[PBSiriManager sharedInstance](&OBJC_CLASS___PBSiriManager, "sharedInstance"));
    unsigned int v31 = [v30 isSiriEnabled];

    id v32 = sub_100082A24();
    v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG)) {
      sub_10027BED4(v33, v34, v35, v36, v37, v38, v39, v40);
    }

    -[PBSystemGestureHandle acquire](self->_presentGesture, "acquire");
    if (v6) {
      char v41 = 1;
    }
    else {
      char v41 = v27;
    }
    if ((v41 & 1) != 0 || v31 != 1)
    {
      id v42 = sub_100082A24();
      unsigned int v43 = (os_log_s *)objc_claimAutoreleasedReturnValue(v42);
      if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67110402;
        *(_DWORD *)int v48 = 0;
        *(_WORD *)&v48[4] = 1024;
        *(_DWORD *)&v48[6] = v27;
        __int16 v49 = 1024;
        unsigned int v50 = v29;
        __int16 v51 = 1024;
        int v52 = 0;
        __int16 v53 = 1024;
        unsigned int v54 = v31;
        __int16 v55 = 2114;
        id v56 = v7;
        _os_log_impl( (void *)&_mh_execute_header,  v43,  OS_LOG_TYPE_DEFAULT,  "Enabling LISTEN gesture. isSiriHidden: %{BOOL}d; isKeyboardFocused: %{BOOL}d; useLegacyBehavior:%{BOOL}d; supp"
          "ortsPushToTalk:%{BOOL}d; isSiriEnabled:%{BOOL}d {reason=%{public}@}",
          buf,
          0x2Au);
      }

      -[PBSystemGestureHandle acquireWithReason:](self->_listenGesture, "acquireWithReason:", v7);
      if (v6)
      {
        id v44 = sub_100082A24();
        id v45 = (os_log_s *)objc_claimAutoreleasedReturnValue(v44);
        if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG)) {
          sub_10027BE48(v45);
        }

        -[PBSystemGestureHandle acquire](self->_dismissGesture, "acquire");
      }
    }
  }

  os_activity_scope_leave(&v46);
}

- (BOOL)isPresenting
{
  return self->_presenting;
}

- (PBSystemUIServiceDictationDeviceIdentifierPublishing)dictationPresentationStatePublisher
{
  return self->_dictationPresentationStatePublisher;
}

- (void)setDictationPresentationStatePublisher:(id)a3
{
}

- (PBCoordinatedTransitionToken)coordinatedTransitionToken
{
  return self->_coordinatedTransitionToken;
}

- (PBSystemGestureHandle)presentGesture
{
  return self->_presentGesture;
}

- (PBSystemGestureHandle)listenGesture
{
  return self->_listenGesture;
}

- (PBSystemGestureHandle)dismissGesture
{
  return self->_dismissGesture;
}

- (NSString)dictationDeviceIdentifier
{
  return self->_dictationDeviceIdentifier;
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
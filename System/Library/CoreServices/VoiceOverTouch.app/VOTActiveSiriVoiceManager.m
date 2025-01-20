@interface VOTActiveSiriVoiceManager
+ (id)sharedInstance;
- (id)_init;
- (id)siriVoiceIdentifierForLanguage:(id)a3;
- (void)_deregisterForNotifications;
- (void)_handleSiriVoiceUpdate;
- (void)_registerForNotifications;
- (void)dealloc;
@end

@implementation VOTActiveSiriVoiceManager

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10009D5D4;
  block[3] = &unk_100176EE0;
  block[4] = a1;
  if (qword_1001ACF30 != -1) {
    dispatch_once(&qword_1001ACF30, block);
  }
  return (id)qword_1001ACF38;
}

- (id)_init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___VOTActiveSiriVoiceManager;
  v2 = -[VOTActiveSiriVoiceManager init](&v6, "init");
  if (v2)
  {
    v3 = objc_alloc_init(&OBJC_CLASS___NSLock);
    cachedSiriVoiceLock = v2->_cachedSiriVoiceLock;
    v2->_cachedSiriVoiceLock = v3;

    -[VOTActiveSiriVoiceManager _registerForNotifications](v2, "_registerForNotifications");
  }

  return v2;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___VOTActiveSiriVoiceManager;
  -[VOTActiveSiriVoiceManager dealloc](&v3, "dealloc");
}

- (void)_registerForNotifications
{
  p_gryphonInstallNotifyToken = &self->_gryphonInstallNotifyToken;
  if (self->_gryphonInstallNotifyToken == -1)
  {
    objc_initWeak(&location, self);
    v4 = &_dispatch_main_q;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472LL;
    v6[2] = sub_10009D7B0;
    v6[3] = &unk_100179380;
    objc_copyWeak(&v7, &location);
    notify_register_dispatch( "com.apple.MobileAsset.VoiceServices.GryphonVoice.ma.new-asset-installed",  p_gryphonInstallNotifyToken,  &_dispatch_main_q,  v6);

    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver( DarwinNotifyCenter,  self,  (CFNotificationCallback)sub_10009D7DC,  @"com.apple.ttsasset.NewAssetNotification",  0LL,  CFNotificationSuspensionBehaviorDeliverImmediately);
}

- (void)_deregisterForNotifications
{
  int gryphonInstallNotifyToken = self->_gryphonInstallNotifyToken;
  if (gryphonInstallNotifyToken != -1)
  {
    notify_cancel(gryphonInstallNotifyToken);
    self->_int gryphonInstallNotifyToken = -1;
  }

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, @"com.apple.ttsasset.NewAssetNotification", 0LL);
}

- (void)_handleSiriVoiceUpdate
{
  uint64_t v3 = AXLogCommon(self, a2);
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)objc_super v6 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_INFO,  "Siri voice updated, refetching active siri",  v6,  2u);
  }

  -[NSLock lock](self->_cachedSiriVoiceLock, "lock");
  cachedSiriVoiceAsset = self->_cachedSiriVoiceAsset;
  self->_cachedSiriVoiceAsset = 0LL;

  -[NSLock unlock](self->_cachedSiriVoiceLock, "unlock");
}

- (id)siriVoiceIdentifierForLanguage:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[AFConnection outputVoice](&OBJC_CLASS___AFConnection, "outputVoice"));
  uint64_t v7 = AXLogCommon(v5, v6);
  v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v35 = v5;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Active siri: %@", buf, 0xCu);
  }

  if (v5)
  {
    -[NSLock lock](self->_cachedSiriVoiceLock, "lock");
    if (-[TTSVoiceAsset isEligibleForVOTWithVoiceInfo:language:]( self->_cachedSiriVoiceAsset,  "isEligibleForVOTWithVoiceInfo:language:",  v5,  v4))
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[TTSVoiceAsset identifier](self->_cachedSiriVoiceAsset, "identifier"));
      -[NSLock unlock](self->_cachedSiriVoiceLock, "unlock");
      if (v9)
      {
        id v10 = v9;
LABEL_26:

        goto LABEL_27;
      }
    }

    else
    {
      -[NSLock unlock](self->_cachedSiriVoiceLock, "unlock");
    }

    __int128 v29 = 0u;
    __int128 v30 = 0u;
    __int128 v31 = 0u;
    __int128 v32 = 0u;
    id v11 = (id)objc_claimAutoreleasedReturnValue( +[TTSSiriAssetManager installedAssetsForLanguage:voiceType:]( &OBJC_CLASS___TTSSiriAssetManager,  "installedAssetsForLanguage:voiceType:",  0LL,  4LL));
    id v12 = [v11 countByEnumeratingWithState:&v29 objects:v33 count:16];
    v14 = "ementManager _nextExplorerElementInDirection:fromElement:didWrap:]";
    if (v12)
    {
      id v15 = v12;
      id location = (id *)&self->_cachedSiriVoiceAsset;
      v28 = self;
      uint64_t v16 = *(void *)v30;
      while (2)
      {
        v17 = 0LL;
        do
        {
          if (*(void *)v30 != v16) {
            objc_enumerationMutation(v11);
          }
          v18 = *(void **)(*((void *)&v29 + 1) + 8LL * (void)v17);
          uint64_t v19 = AXLogCommon(v12, v13);
          v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
          if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v35 = v18;
            _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "checking asset: %@", buf, 0xCu);
          }

          id v12 = [v18 isEligibleForVOTWithVoiceInfo:v5 language:v4];
          if ((_DWORD)v12)
          {
            -[NSLock lock](v28->_cachedSiriVoiceLock, "lock");
            objc_storeStrong(location, v18);
            -[NSLock unlock](v28->_cachedSiriVoiceLock, "unlock");
            v21 = (void *)objc_claimAutoreleasedReturnValue([v18 identifier]);
            goto LABEL_21;
          }

          v17 = (char *)v17 + 1;
        }

        while (v15 != v17);
        id v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v29, v33, 16, location);
        id v15 = v12;
        if (v12) {
          continue;
        }
        break;
      }

      v21 = 0LL;
LABEL_21:
      v14 = "-[VOTExplorerElementManager _nextExplorerElementInDirection:fromElement:didWrap:]" + 15;
    }

    else
    {
      v21 = 0LL;
    }

    uint64_t v24 = AXLogCommon(v22, v23);
    v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = *((void *)v14 + 183);
      v35 = v21;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_INFO, "Using siri identifier: %@", buf, 0xCu);
    }

    id v10 = v21;
    goto LABEL_26;
  }

  id v10 = 0LL;
LABEL_27:

  return v10;
}

- (void).cxx_destruct
{
}

@end
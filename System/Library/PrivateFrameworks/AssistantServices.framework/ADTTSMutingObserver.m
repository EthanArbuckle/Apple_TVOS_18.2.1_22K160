@interface ADTTSMutingObserver
+ (id)sharedInstance;
- (ADTTSMutingObserver)init;
- (BOOL)_currentRouteIsHandsFree;
- (void)_cleanupAudioRouteOnMainThread;
- (void)_listenForAudioRouteChanges;
- (void)_listenForMuteStateChanges;
- (void)_muteStateChanged:(id)a3;
- (void)_notifyObservers:(BOOL)a3;
- (void)_stopListeningForAudioRouteChanges;
- (void)_stopListeningForMuteStateChanges;
- (void)_updateAudioRouteOnMainThread;
- (void)_useDeviceSpeakerForTTSPreferenceChanged;
- (void)addHandsFreeStateObserver:(id)a3;
- (void)audioSessionController:(id)a3 didReceiveAudioSessionOwnerLostNotification:(id)a4;
- (void)audioSessionController:(id)a3 didReceiveAudioSessionOwnerResetNotification:(id)a4;
- (void)audioSessionController:(id)a3 didReceiveAudioSessionRouteChangeNotificationWithUserInfo:(id)a4;
- (void)dealloc;
- (void)removeHandsFreeStateObserver:(id)a3;
@end

@implementation ADTTSMutingObserver

- (ADTTSMutingObserver)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___ADTTSMutingObserver;
  v2 = -[ADTTSMutingObserver init](&v6, "init");
  if (v2)
  {
    v2->_observers = CFBagCreateMutable(0LL, 0LL, 0LL);
    v2->_handsFreeLock._os_unfair_lock_opaque = 0;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1001EA320;
    block[3] = &unk_1004FD940;
    v5 = v2;
    dispatch_async(&_dispatch_main_q, block);
  }

  return v2;
}

- (void)dealloc
{
  observers = self->_observers;
  if (observers) {
    CFRelease(observers);
  }
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___ADTTSMutingObserver;
  -[ADTTSMutingObserver dealloc](&v4, "dealloc");
}

- (BOOL)_currentRouteIsHandsFree
{
  v2 = self;
  p_handsFreeLock = &self->_handsFreeLock;
  os_unfair_lock_lock(&self->_handsFreeLock);
  LOBYTE(v2) = v2->_currentRouteIsHandsFree;
  os_unfair_lock_unlock(p_handsFreeLock);
  return (char)v2;
}

- (void)_cleanupAudioRouteOnMainThread
{
  p_handsFreeLock = &self->_handsFreeLock;
  os_unfair_lock_lock(&self->_handsFreeLock);
  self->_currentRouteIsHandsFree = 0;
  os_unfair_lock_unlock(p_handsFreeLock);
}

- (void)_updateAudioRouteOnMainThread
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[ADSpeechManager sharedManager](&OBJC_CLASS___ADSpeechManager, "sharedManager"));
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue([v3 audioSessionController]);
  id v5 = [v4 getAudioSessionID];

  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue(+[AVAudioSession retrieveSessionWithID:](&OBJC_CLASS___AVAudioSession, "retrieveSessionWithID:", v5));
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 currentRoute]);
  v8 = (void *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    v9 = v8;
    v10 = (void *)objc_claimAutoreleasedReturnValue([v7 outputs]);
    v11 = (void *)objc_claimAutoreleasedReturnValue([v10 lastObject]);
    v12 = (void *)objc_claimAutoreleasedReturnValue([v11 portType]);
    *(_DWORD *)buf = 136315394;
    v27 = "-[ADTTSMutingObserver _updateAudioRouteOnMainThread]";
    __int16 v28 = 2112;
    v29 = v12;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%s Checking if route is hands free %@", buf, 0x16u);
  }

  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "outputs", 0));
  id v14 = [v13 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = *(void *)v22;
    while (2)
    {
      v17 = 0LL;
      do
      {
        if (*(void *)v22 != v16) {
          objc_enumerationMutation(v13);
        }
        v18 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v21 + 1) + 8 * (void)v17) portType]);
        unsigned int v19 = [v18 isEqualToString:AVAudioSessionPortBuiltInSpeaker];

        if (!v19)
        {
          BOOL v20 = 1;
          goto LABEL_13;
        }

        v17 = (char *)v17 + 1;
      }

      while (v15 != v17);
      id v15 = [v13 countByEnumeratingWithState:&v21 objects:v25 count:16];
      if (v15) {
        continue;
      }
      break;
    }
  }

  BOOL v20 = 0;
LABEL_13:

  os_unfair_lock_lock(&self->_handsFreeLock);
  self->_currentRouteIsHandsFree = v20;
  os_unfair_lock_unlock(&self->_handsFreeLock);
}

- (void)_notifyObservers:(BOOL)a3
{
  observers = self->_observers;
  objc_super v4 = (void **)&kCFBooleanTrue;
  if (!a3) {
    objc_super v4 = (void **)&kCFBooleanFalse;
  }
  CFBagApplyFunction(observers, (CFBagApplierFunction)sub_1001EA308, *v4);
}

- (void)_muteStateChanged:(id)a3
{
  id v4 = a3;
  id v5 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v8 = "-[ADTTSMutingObserver _muteStateChanged:]";
    __int16 v9 = 2112;
    id v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s Mute state changed %@", buf, 0x16u);
  }

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001EA2E0;
  block[3] = &unk_1004FD940;
  void block[4] = self;
  dispatch_async(&_dispatch_main_q, block);
}

- (void)_listenForAudioRouteChanges
{
  v3 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v6 = 136315138;
    v7 = "-[ADTTSMutingObserver _listenForAudioRouteChanges]";
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_INFO,  "%s Listening for audio route changes",  (uint8_t *)&v6,  0xCu);
  }

  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[ADSpeechManager sharedManager](&OBJC_CLASS___ADSpeechManager, "sharedManager"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 audioSessionController]);
  [v5 registerObserver:self];
}

- (void)_stopListeningForAudioRouteChanges
{
  v3 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v6 = 136315138;
    v7 = "-[ADTTSMutingObserver _stopListeningForAudioRouteChanges]";
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_INFO,  "%s Stopping listening for audio route changes",  (uint8_t *)&v6,  0xCu);
  }

  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[ADSpeechManager sharedManager](&OBJC_CLASS___ADSpeechManager, "sharedManager"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 audioSessionController]);
  [v5 unregisterObserver:self];
}

- (void)_listenForMuteStateChanges
{
  v3 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v6 = 136315138;
    v7 = "-[ADTTSMutingObserver _listenForMuteStateChanges]";
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_INFO,  "%s Listening for mute state changes",  (uint8_t *)&v6,  0xCu);
  }

  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[ADSystemMuteModeObserver sharedInstance](&OBJC_CLASS___ADSystemMuteModeObserver, "sharedInstance"));
  [v4 addObserver:self selector:"_muteStateChanged:" name:@"ADMuteModeDidChangeNotification" object:v5];
}

- (void)_stopListeningForMuteStateChanges
{
  v3 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v5 = 136315138;
    int v6 = "-[ADTTSMutingObserver _stopListeningForMuteStateChanges]";
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_INFO,  "%s Stopping listening for mute state changes",  (uint8_t *)&v5,  0xCu);
  }

  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v4 removeObserver:self name:@"ADMuteModeDidChangeNotification" object:0];
}

- (void)_useDeviceSpeakerForTTSPreferenceChanged
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[AFPreferences sharedPreferences](&OBJC_CLASS___AFPreferences, "sharedPreferences"));
  id v4 = [v3 useDeviceSpeakerForTTS];

  if (v4 != (id)self->_useDeviceSpeakerForTTSPreference)
  {
    int v5 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      int v6 = 136315138;
      v7 = "-[ADTTSMutingObserver _useDeviceSpeakerForTTSPreferenceChanged]";
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_INFO,  "%s Use device speaker for TTS preference changed!",  (uint8_t *)&v6,  0xCu);
    }

    self->_useDeviceSpeakerForTTSPreference = (int64_t)v4;
    if (v4 == (id)1) {
      -[ADTTSMutingObserver _listenForMuteStateChanges](self, "_listenForMuteStateChanges");
    }
    else {
      -[ADTTSMutingObserver _stopListeningForMuteStateChanges](self, "_stopListeningForMuteStateChanges");
    }
    -[ADTTSMutingObserver _notifyObservers:](self, "_notifyObservers:", sub_1001EA01C());
  }

- (void)addHandsFreeStateObserver:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_1001EA1DC;
  v4[3] = &unk_1004FD968;
  v4[4] = self;
  id v5 = a3;
  id v3 = v5;
  dispatch_async(&_dispatch_main_q, v4);
}

- (void)removeHandsFreeStateObserver:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_1001EA16C;
  v4[3] = &unk_1004FD968;
  v4[4] = self;
  id v5 = a3;
  id v3 = v5;
  dispatch_async(&_dispatch_main_q, v4);
}

- (void)audioSessionController:(id)a3 didReceiveAudioSessionRouteChangeNotificationWithUserInfo:(id)a4
{
  id v5 = a4;
  int v6 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    __int16 v9 = "-[ADTTSMutingObserver audioSessionController:didReceiveAudioSessionRouteChangeNotificationWithUserInfo:]";
    __int16 v10 = 2112;
    id v11 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%s Audio route changed %@", buf, 0x16u);
  }

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001EA138;
  block[3] = &unk_1004FD940;
  void block[4] = self;
  dispatch_async(&_dispatch_main_q, block);
}

- (void)audioSessionController:(id)a3 didReceiveAudioSessionOwnerLostNotification:(id)a4
{
  id v5 = a4;
  int v6 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    __int16 v9 = "-[ADTTSMutingObserver audioSessionController:didReceiveAudioSessionOwnerLostNotification:]";
    __int16 v10 = 2112;
    id v11 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%s Audio owner lost %@", buf, 0x16u);
  }

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001EA104;
  block[3] = &unk_1004FD940;
  void block[4] = self;
  dispatch_async(&_dispatch_main_q, block);
}

- (void)audioSessionController:(id)a3 didReceiveAudioSessionOwnerResetNotification:(id)a4
{
  id v5 = a4;
  int v6 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    __int16 v9 = "-[ADTTSMutingObserver audioSessionController:didReceiveAudioSessionOwnerResetNotification:]";
    __int16 v10 = 2112;
    id v11 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%s Audio owner reset %@", buf, 0x16u);
  }

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001E9FE8;
  block[3] = &unk_1004FD940;
  void block[4] = self;
  dispatch_async(&_dispatch_main_q, block);
}

+ (id)sharedInstance
{
  if (qword_100578098 != -1) {
    dispatch_once(&qword_100578098, &stru_1004F5FC0);
  }
  return (id)qword_100578090;
}

@end
@interface VOTOutputSoundComponent
- (VOTOutputSoundComponent)init;
- (double)_soundVolume;
- (double)outputMutedActivityLastToggleTime;
- (id)_findSound:(id)a3;
- (id)outputMutedActivityValue:(id)a3;
- (id)soundThread;
- (void)_handlePerformAction:(id)a3;
- (void)_handleSoundThreadMediaSessionDied;
- (void)_initializeThread;
- (void)_mediaSessionDied:(id)a3;
- (void)_playSoundFast:(id)a3 startedBlock:(id)a4 completionBlock:(id)a5;
- (void)handleEvent:(id)a3;
- (void)playSoundFast:(id)a3 completionBlock:(id)a4;
- (void)playSoundFast:(id)a3 startedBlock:(id)a4 completionBlock:(id)a5;
- (void)sound:(id)a3 didFinishPlaying:(BOOL)a4;
@end

@implementation VOTOutputSoundComponent

- (VOTOutputSoundComponent)init
{
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___VOTOutputSoundComponent;
  v2 = -[VOTOutputComponent init](&v11, "init");
  if (v2)
  {
    v3 = (NSMutableDictionary *)[objc_allocWithZone(NSMutableDictionary) init];
    cachedSounds = v2->_cachedSounds;
    v2->_cachedSounds = v3;

    v5 = objc_alloc_init(&OBJC_CLASS___SCRCThread);
    soundThread = v2->_soundThread;
    v2->_soundThread = v5;

    -[SCRCThread performSelector:onTarget:count:objects:]( v2->_soundThread,  "performSelector:onTarget:count:objects:",  "_initializeThread",  v2,  0LL,  0LL);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v7 addObserver:v2 selector:"_mediaSessionDied:" name:AVAudioSessionMediaServicesWereLostNotification object:0];

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v8 addObserver:v2 selector:"_mediaSessionDied:" name:AVAudioSessionMediaServicesWereResetNotification object:0];

    v9 = v2;
  }

  return v2;
}

- (void)_initializeThread
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(+[NSThread currentThread](&OBJC_CLASS___NSThread, "currentThread"));
  [v2 setName:@"SoundThread"];
}

- (void)_mediaSessionDied:(id)a3
{
}

- (void)_handleSoundThreadMediaSessionDied
{
  __int128 v7 = 0u;
  __int128 v8 = 0u;
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  id v2 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](self->_cachedSounds, "allValues", 0LL));
  id v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      v6 = 0LL;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v7 + 1) + 8 * (void)v6) resetSoundForLostMediaSession];
        v6 = (char *)v6 + 1;
      }

      while (v4 != v6);
      id v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }

    while (v4);
  }
}

- (void)handleEvent:(id)a3
{
  id v6 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForIndex:1]);
  unsigned int v5 = [v4 unsignedIntValue];

  if (v5 == 6) {
    -[SCRCThread performSelector:onTarget:count:objects:]( self->_soundThread,  "performSelector:onTarget:count:objects:",  "_handlePerformAction:",  self,  1LL,  v6);
  }
}

- (id)_findSound:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue([a3 soundPath]);
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_cachedSounds, "objectForKey:", v4));
  if (!v5)
  {
    id v5 = [objc_allocWithZone((Class)VOTSound) initWithSoundPath:v4 thread:self->_soundThread];
    id v6 = [[VOSDefaultSoundPack alloc] init];
    __int128 v7 = (void *)objc_claimAutoreleasedReturnValue(+[VOSOutputEvent DidChangeVolume](&OBJC_CLASS___VOSOutputEvent, "DidChangeVolume"));
    __int128 v8 = (void *)objc_claimAutoreleasedReturnValue([v6 soundAssetURLForOutputEvent:v7]);
    __int128 v9 = (void *)objc_claimAutoreleasedReturnValue([v8 lastPathComponent]);

    __int128 v10 = (void *)objc_claimAutoreleasedReturnValue([v4 lastPathComponent]);
    LODWORD(v7) = [v10 isEqualToString:v9];

    if ((_DWORD)v7) {
      [v5 setIsVolumeSound:1];
    }
    if (v5) {
      -[NSMutableDictionary setObject:forKey:](self->_cachedSounds, "setObject:forKey:", v5, v4);
    }
    else {
      -[VOTOutputSoundComponent sound:didFinishPlaying:](self, "sound:didFinishPlaying:", 0LL, 0LL);
    }
  }

  return v5;
}

- (id)soundThread
{
  return self->_soundThread;
}

- (double)_soundVolume
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  unsigned int v3 = [v2 voiceOverAdjustSoundVolumeIndependently];

  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  id v5 = v4;
  if (v3)
  {
    [v4 voiceOverSoundVolume];
    double v7 = v6;
  }

  else
  {
    [v4 voiceOverEffectiveSpeakingVolume];
    double v7 = v8;
  }

  return v7;
}

- (void)_handlePerformAction:(id)a3
{
  id v4 = a3;
  id v7 = (id)objc_claimAutoreleasedReturnValue([v4 objectForIndex:14]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForIndex:13]);

  double v6 = (void *)objc_claimAutoreleasedReturnValue(-[VOTOutputSoundComponent _findSound:](self, "_findSound:", v7));
  [v6 setOwner:v5];
  [v6 setDelegate:self];
  [v6 play];
}

- (id)outputMutedActivityValue:(id)a3
{
  return [a3 soundMuted];
}

- (double)outputMutedActivityLastToggleTime
{
  return result;
}

- (void)playSoundFast:(id)a3 completionBlock:(id)a4
{
}

- (void)playSoundFast:(id)a3 startedBlock:(id)a4 completionBlock:(id)a5
{
  soundThread = self->_soundThread;
  id v9 = a5;
  id v10 = a3;
  id v12 = [a4 copy];
  id v11 = [v9 copy];

  -[SCRCThread performSelector:onTarget:count:objects:]( soundThread,  "performSelector:onTarget:count:objects:",  "_playSoundFast:startedBlock:completionBlock:",  self,  3LL,  v10,  v12,  v11);
}

- (void)_playSoundFast:(id)a3 startedBlock:(id)a4 completionBlock:(id)a5
{
  id v8 = a3;
  id v9 = (void (**)(id, void *))a4;
  id v10 = a5;
  uint64_t v12 = VOTLogAudio(v10, v11);
  v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    *(void *)v49 = v8;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Sound component play: %@", buf, 0xCu);
  }

  unsigned int v14 = [(id)VOTSharedWorkspace soundEffectsEnabled];
  unsigned int v15 = [(id)VOTSharedWorkspace soundMuted];
  unsigned int v16 = [(id)VOTSharedWorkspace voiceOverIsIdle];
  BOOL v17 = -[VOTOutputComponent determineOutputMutedForActivity:](self, "determineOutputMutedForActivity:", v8);
  BOOL v19 = v17;
  if (!(v14 ^ 1 | v15 | v16 | v17))
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[VOTOutputSoundComponent _findSound:](self, "_findSound:", v8));
    id v23 = [v8 outputActionID];
    v24 = (void *)objc_claimAutoreleasedReturnValue([v22 soundPath]);
    v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%llu-%@",  v23,  v24));

    id v26 = [v22 isPlaying];
    if ((v26 & 1) != 0)
    {
LABEL_22:

      goto LABEL_23;
    }

    uint64_t v28 = VOTLogAudio(v26, v27);
    v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      *(void *)v49 = v22;
      *(_WORD *)&v49[8] = 2112;
      v50 = v25;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_INFO, "Sound not playing, start %@, %@", buf, 0x16u);
    }

    v30 = (void *)objc_claimAutoreleasedReturnValue(+[VOTOutputManager outputManager](&OBJC_CLASS___VOTOutputManager, "outputManager"));
    unsigned __int8 v31 = [v30 audioSessionActive];

    v32 = (void *)objc_claimAutoreleasedReturnValue(+[VOTOutputManager outputManager](&OBJC_CLASS___VOTOutputManager, "outputManager"));
    [v32 enableAudioSession:v25];

    objc_initWeak(&location, v22);
    v43[0] = _NSConcreteStackBlock;
    v43[1] = 3221225472LL;
    v43[2] = sub_1000251F8;
    v43[3] = &unk_100177228;
    id v33 = v25;
    id v44 = v33;
    id v45 = v10;
    objc_copyWeak(&v46, &location);
    [v22 setCompletionBlock:v43];
    -[VOTOutputSoundComponent _soundVolume](self, "_soundVolume");
    *(float *)&double v34 = v34;
    [v22 setVolume:v34];
    if ((v31 & 1) != 0)
    {
      id v35 = [v22 play];
      uint64_t v37 = VOTLogAudio(v35, v36);
      v38 = (os_log_s *)objc_claimAutoreleasedReturnValue(v37);
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)v49 = v33;
        v39 = "play with SSS: %@";
LABEL_18:
        _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, v39, buf, 0xCu);
      }
    }

    else
    {
      id v40 = [v22 playAvoidingSSS];
      uint64_t v42 = VOTLogAudio(v40, v41);
      v38 = (os_log_s *)objc_claimAutoreleasedReturnValue(v42);
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)v49 = v33;
        v39 = "play no SSS: %@";
        goto LABEL_18;
      }
    }

    if (v9) {
      v9[2](v9, v22);
    }
    objc_destroyWeak(&v46);

    objc_destroyWeak(&location);
    goto LABEL_22;
  }

  uint64_t v20 = VOTLogAudio(v17, v18);
  v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109888;
    *(_DWORD *)v49 = v14;
    *(_WORD *)&v49[4] = 1024;
    *(_DWORD *)&v49[6] = v15;
    LOWORD(v50) = 1024;
    *(_DWORD *)((char *)&v50 + 2) = v16;
    HIWORD(v50) = 1024;
    BOOL v51 = v19;
    _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_INFO,  "Sound effects enabled: %d, sound muted: %d, idle: %d, activity: %d",  buf,  0x1Au);
  }

  [v8 setObject:&__kCFBooleanTrue forVariant:82];
  if (v9) {
    v9[2](v9, 0LL);
  }
  if (v10) {
    (*((void (**)(id, void))v10 + 2))(v10, 0LL);
  }
LABEL_23:
}

- (void)sound:(id)a3 didFinishPlaying:(BOOL)a4
{
  BOOL v4 = a4;
  id v11 = a3;
  double v6 = (void *)objc_claimAutoreleasedReturnValue([v11 action]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForVariant:12]);
  id v8 = v7;
  if (v7) {
    [v7 sound:v11 didFinishPlaying:v4];
  }
  if (([v6 synchronization] & 2) != 0)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v11 owner]);
    id v10 = [objc_allocWithZone(AXIndexMap) init];
    [v10 setObject:v6 forIndex:11];
    [v10 setObject:v9 forIndex:13];
    -[VOTOutputComponent notifyActionComplete:](self, "notifyActionComplete:", v10);
  }
}

- (void).cxx_destruct
{
}

@end
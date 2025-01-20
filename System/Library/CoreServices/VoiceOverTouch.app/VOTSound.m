@interface VOTSound
- (BOOL)isPlaying;
- (BOOL)isVolumeSound;
- (BOOL)shouldUseAVAudioPlayer;
- (NSString)resolvedSoundPath;
- (SCRCThread)soundThread;
- (VOTSound)initWithSoundPath:(id)a3 thread:(id)a4;
- (id)action;
- (id)completionBlock;
- (id)delegate;
- (id)owner;
- (id)soundPath;
- (void)__updateAudioSessionProperties;
- (void)_cancelHelperFired:(unint64_t)a3;
- (void)_finishedPlaying;
- (void)_sendFinishPlayingNotificationsWithCompletionBlock:(id)a3 delegate:(id)a4;
- (void)_updateAudioSessionProperties;
- (void)_updatePlayerWithAudioFile:(BOOL)a3;
- (void)audioPlayerDecodeErrorDidOccur:(id)a3 error:(id)a4;
- (void)audioPlayerDidFinishPlaying:(id)a3 successfully:(BOOL)a4;
- (void)dealloc;
- (void)play;
- (void)playAvoidingSSS;
- (void)playAvoidingSSS:(BOOL)a3;
- (void)resetSoundForLostMediaSession;
- (void)setAction:(id)a3;
- (void)setCompletionBlock:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setIsPlaying:(BOOL)a3;
- (void)setIsVolumeSound:(BOOL)a3;
- (void)setOwner:(id)a3;
- (void)setResolvedSoundPath:(id)a3;
- (void)setSoundThread:(id)a3;
- (void)setVolume:(float)a3;
@end

@implementation VOTSound

- (VOTSound)initWithSoundPath:(id)a3 thread:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v34.receiver = self;
  v34.super_class = (Class)&OBJC_CLASS___VOTSound;
  v9 = -[VOTSound init](&v34, "init");
  v10 = v9;
  v11 = 0LL;
  if (v7)
  {
    if (v9)
    {
      -[VOTSound setSoundThread:](v9, "setSoundThread:", v8);
      objc_storeStrong((id *)&v10->_soundPath, a3);
      v12 = -[SCRCTargetSelectorTimer initWithTarget:selector:thread:]( objc_alloc(&OBJC_CLASS___SCRCTargetSelectorTimer),  "initWithTarget:selector:thread:",  v10,  0LL,  v8);
      cancelHelperTimer = v10->_cancelHelperTimer;
      v10->_cancelHelperTimer = v12;

      dispatch_queue_t v14 = dispatch_queue_create("com.apple.accessibility.VOTSound.hearingAidStreamSerialQueue", 0LL);
      hearingAidStreamSerialQueue = v10->_hearingAidStreamSerialQueue;
      v10->_hearingAidStreamSerialQueue = (OS_dispatch_queue *)v14;

      v11 = 0LL;
      if (([v7 isEqualToString:@"KeyboardClick"] & 1) == 0)
      {
        v17 = +[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", objc_opt_class(v10, v16));
        v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
        uint64_t v19 = objc_claimAutoreleasedReturnValue([v18 resourcePath]);

        id v20 = objc_allocWithZone(&OBJC_CLASS___NSURL);
        v29 = (void *)v19;
        v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@/%@",  v19,  v7));
        v22 = (const __CFURL *)[v20 initFileURLWithPath:v21 isDirectory:0];

        OSStatus SystemSoundID = AudioServicesCreateSystemSoundID(v22, &v10->_soundID);
        v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
        v24 = (void *)objc_claimAutoreleasedReturnValue(+[AVAudioSession sharedInstance](&OBJC_CLASS___AVAudioSession, "sharedInstance"));
        [v23 addObserver:v10 selector:"_updateAudioSessionProperties" name:AVAudioSessionRouteChangeNotification object:v24];

        v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
        v26 = (void *)objc_claimAutoreleasedReturnValue(+[AVAudioSession sharedInstance](&OBJC_CLASS___AVAudioSession, "sharedInstance"));
        [v25 addObserver:v10 selector:"_updateAudioSessionProperties" name:AVAudioSessionInterruptionNotification object:v26];

        if (SystemSoundID)
        {
          v11 = 0LL;
          v10->_soundID = 0;
        }

        else
        {
          objc_storeStrong((id *)&v10->_soundPath, a3);
          v10->_completionBlockLock._os_unfair_lock_opaque = 0;
          v10->_volume = 1.0;
          objc_initWeak(&from, v10);
          v27 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
          v31[0] = _NSConcreteStackBlock;
          v31[1] = 3221225472LL;
          v31[2] = sub_100012FDC;
          v31[3] = &unk_100176F08;
          objc_copyWeak(&v32, &from);
          [v27 registerUpdateBlock:v31 forRetrieveSelector:"_audioHardwareChannelLayout" withListener:v10];

          objc_destroyWeak(&v32);
          -[VOTSound __updateAudioSessionProperties](v10, "__updateAudioSessionProperties");
          v11 = v10;
          objc_destroyWeak(&from);
        }
      }
    }
  }

  return v11;
}

- (void)resetSoundForLostMediaSession
{
  player = self->_player;
  self->_player = 0LL;

  uint64_t v6 = VOTLogAudio(v4, v5);
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    sub_1000EF2F8((uint64_t)self, v7);
  }

  -[VOTSound _updateAudioSessionProperties](self, "_updateAudioSessionProperties");
}

- (BOOL)shouldUseAVAudioPlayer
{
  v2 = self;
  if (!self->_soundChannels && !self->_hearingAidStreamSelected)
  {
    self = (VOTSound *)-[VOTSound isVolumeSound](self, "isVolumeSound");
    if (!(_DWORD)self)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[VOTWorkspace sharedWorkspace](&OBJC_CLASS___VOTWorkspace, "sharedWorkspace"));
      LODWORD(soundChannels) = [v11 currentCallState];

      if ((_DWORD)soundChannels == 1)
      {
        uint64_t v14 = VOTLogAudio(v12, v13);
        uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
        if (!os_log_type_enabled(v4, OS_LOG_TYPE_INFO)) {
          goto LABEL_7;
        }
        LOWORD(v22) = 0;
        id v7 = "Should use AVAudioPlayer for sound. Call is active";
      }

      else
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue(+[AXAudioHardwareManager defaultPort](&OBJC_CLASS___AXAudioHardwareManager, "defaultPort"));
        uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v15 portType]);
        unsigned __int8 v17 = [v16 isEqualToString:AVAudioSessionPortBuiltInSpeaker];

        uint64_t v20 = VOTLogAudio(v18, v19);
        uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
        BOOL v21 = os_log_type_enabled(v4, OS_LOG_TYPE_INFO);
        if ((v17 & 1) != 0)
        {
          if (v21)
          {
            LOWORD(v22) = 0;
            _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_INFO,  "Should not use AVAudioPlayer for sound",  (uint8_t *)&v22,  2u);
          }

          LOBYTE(soundChannels) = 0;
          goto LABEL_7;
        }

        if (!v21)
        {
          LOBYTE(soundChannels) = 1;
          goto LABEL_7;
        }

        LOWORD(v22) = 0;
        id v7 = "Should use AVAudioPlayer for sound. Default port is not builtin-speaker";
      }

      LOBYTE(soundChannels) = 1;
      id v8 = v4;
      uint32_t v9 = 2;
      goto LABEL_6;
    }
  }

  uint64_t v3 = VOTLogAudio(self, a2);
  uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  LOBYTE(soundChannels) = 1;
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int64_t soundChannels = v2->_soundChannels;
    BOOL hearingAidStreamSelected = v2->_hearingAidStreamSelected;
    int v22 = 134218496;
    int64_t v23 = soundChannels;
    __int16 v24 = 2048;
    BOOL v25 = hearingAidStreamSelected;
    __int16 v26 = 2048;
    uint64_t v27 = -[VOTSound isVolumeSound](v2, "isVolumeSound");
    id v7 = "Should use AVAudioPlayer for sound. soundChannels=%ld _hearingAidStreamSelected=%ld isVolumeSound=%ld";
    LOBYTE(soundChannels) = 1;
    id v8 = v4;
    uint32_t v9 = 32;
LABEL_6:
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, v7, (uint8_t *)&v22, v9);
  }

- (void)_updatePlayerWithAudioFile:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[VOTSound soundPath](self, "soundPath"));
  id v7 = v5;
  if (v3)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v5 pathExtension]);
    uint32_t v9 = (void *)objc_claimAutoreleasedReturnValue([v7 stringByDeletingPathExtension]);
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@-mono", v9));
    uint64_t v11 = objc_claimAutoreleasedReturnValue([v10 stringByAppendingPathExtension:v8]);

    id v7 = (void *)v11;
  }

  uint64_t v12 = +[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", objc_opt_class(self, v6));
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v13 resourcePath]);
  v15 = (void *)objc_claimAutoreleasedReturnValue([v14 stringByAppendingPathComponent:v7]);

  id v16 = [objc_allocWithZone(NSURL) initFileURLWithPath:v15 isDirectory:0];
  id v25 = 0LL;
  unsigned __int8 v17 = -[AVAudioPlayer initWithContentsOfURL:error:]( objc_alloc(&OBJC_CLASS___AVAudioPlayer),  "initWithContentsOfURL:error:",  v16,  &v25);
  id v18 = v25;
  p_player = &self->_player;
  player = self->_player;
  self->_player = v17;

  -[AVAudioPlayer setDelegate:](self->_player, "setDelegate:", self);
  id v21 = -[VOTSound setResolvedSoundPath:](self, "setResolvedSoundPath:", v7);
  uint64_t v23 = VOTLogAudio(v21, v22);
  __int16 v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG)) {
    sub_1000EF36C((uint64_t)v7, (id *)p_player, v24);
  }
}

- (void)__updateAudioSessionProperties
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(+[AXAudioHardwareManager sharedManager](&OBJC_CLASS___AXAudioHardwareManager, "sharedManager"));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[AXAudioHardwareManager defaultRouteDescription]( &OBJC_CLASS___AXAudioHardwareManager,  "defaultRouteDescription"));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v3 savedChannelsForOutput:v4 forSource:2]);

  uint64_t v8 = VOTLogAudio(v6, v7);
  uint32_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    int v27 = 138543362;
    v28[0] = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_INFO,  "Updating sound properties with new channels: %{public}@",  (uint8_t *)&v27,  0xCu);
  }

  uint64_t v12 = VOTLogAudio(v10, v11);
  uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
    sub_1000EF400((uint64_t)self, v13, v14, v15, v16, v17, v18, v19);
  }

  id soundChannels = (id)self->_soundChannels;
  if (soundChannels != [v5 count] || !self->_player) {
    -[VOTSound _updatePlayerWithAudioFile:](self, "_updatePlayerWithAudioFile:", [v5 count] != (id)2);
  }
  self->_id soundChannels = (int64_t)[v5 count];
  id v21 = -[AVAudioPlayer numberOfChannels](self->_player, "numberOfChannels");
  uint64_t v23 = VOTLogAudio(v21, v22);
  __int16 v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
  if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
  {
    unsigned int v25 = [v5 count];
    int v27 = 67109376;
    LODWORD(v28[0]) = (_DWORD)v21;
    WORD2(v28[0]) = 1024;
    *(_DWORD *)((char *)v28 + 6) = v25;
    _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_INFO,  "Player channels: %d, selected channels: %d",  (uint8_t *)&v27,  0xEu);
  }

  if ([v5 count] && objc_msgSend(v5, "count") == v21)
  {
    __int16 v26 = (void *)objc_claimAutoreleasedReturnValue( +[TTSAudioSessionChannel convertChannels:]( &OBJC_CLASS___TTSAudioSessionChannel,  "convertChannels:",  v5));
    -[AVAudioPlayer setChannelAssignments:](self->_player, "setChannelAssignments:", v26);
  }

  else
  {
    -[AVAudioPlayer setChannelAssignments:](self->_player, "setChannelAssignments:", 0LL);
  }
}

- (void)_updateAudioSessionProperties
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(-[VOTSound soundThread](self, "soundThread"));
  [v3 performSelector:"__updateAudioSessionProperties" onTarget:self count:0 objects:0];
}

- (id)soundPath
{
  return self->_soundPath;
}

- (void)setVolume:(float)a3
{
  self->_volume = a3;
  -[AVAudioPlayer setVolume:](self->_player, "setVolume:");
}

- (void)dealloc
{
  SystemSoundID soundID = self->_soundID;
  if (soundID) {
    AudioServicesDisposeSystemSoundID(soundID);
  }
  id completionBlock = self->_completionBlock;
  if (completionBlock)
  {
    self->_id completionBlock = 0LL;
  }

  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___VOTSound;
  -[VOTSound dealloc](&v5, "dealloc");
}

- (void)setCompletionBlock:(id)a3
{
  id v4 = a3;
  id completionBlock = self->_completionBlock;
  if (completionBlock != v4)
  {
    id v9 = v4;
    if (completionBlock)
    {
      -[VOTSound _finishedPlaying](self, "_finishedPlaying");
      os_unfair_lock_lock(&self->_completionBlockLock);
      id v6 = self->_completionBlock;
      self->_id completionBlock = 0LL;

      os_unfair_lock_unlock(&self->_completionBlockLock);
      id v4 = v9;
    }

    if (v4)
    {
      os_unfair_lock_lock(&self->_completionBlockLock);
      id v7 = [v9 copy];
      id v8 = self->_completionBlock;
      self->_id completionBlock = v7;

      os_unfair_lock_unlock(&self->_completionBlockLock);
      id v4 = v9;
    }
  }
}

- (void)setDelegate:(id)a3
{
}

- (id)delegate
{
  return self->_delegate;
}

- (void)setOwner:(id)a3
{
}

- (id)owner
{
  return self->_owner;
}

- (void)setAction:(id)a3
{
}

- (id)action
{
  return self->_action;
}

- (void)_finishedPlaying
{
  p_completionBlockLock = &self->_completionBlockLock;
  os_unfair_lock_lock(&self->_completionBlockLock);
  id v4 = objc_retainBlock(self->_completionBlock);
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(-[VOTSound delegate](self, "delegate"));
  id v6 = objc_retainBlock(v4);
  id AssociatedObject = objc_getAssociatedObject(v6, &unk_1001ACC30);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(AssociatedObject);

  uint64_t v11 = VOTLogAudio(v9, v10);
  uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    sub_1000EF468();
  }

  if (([v8 BOOLValue] & 1) == 0)
  {
    if (v4)
    {
      id v13 = objc_retainBlock(v4);
      objc_setAssociatedObject(v13, &unk_1001ACC30, &__kCFBooleanTrue, (void *)1);
    }

    soundThread = self->_soundThread;
    id v15 = objc_retainBlock(v4);
    -[SCRCThread performSelector:onTarget:count:objects:]( soundThread,  "performSelector:onTarget:count:objects:",  "_sendFinishPlayingNotificationsWithCompletionBlock:delegate:",  self,  2LL,  v15,  v5);
  }

  if (!-[VOTSound shouldUseAVAudioPlayer](self, "shouldUseAVAudioPlayer")) {
    self->_isPlaying = 0;
  }
  os_unfair_lock_unlock(p_completionBlockLock);
}

- (void)_sendFinishPlayingNotificationsWithCompletionBlock:(id)a3 delegate:(id)a4
{
  if (a3) {
    (*((void (**)(id, VOTSound *))a3 + 2))(a3, self);
  }
  else {
    [a4 sound:self didFinishPlaying:1];
  }
}

- (BOOL)isPlaying
{
  if (!self->_isPlaying) {
    return 0;
  }
  if (-[AVAudioPlayer isPlaying](self->_player, "isPlaying")) {
    return self->_isPlaying;
  }
  -[VOTSound _finishedPlaying](self, "_finishedPlaying");
  BOOL result = 0;
  self->_isPlaying = 0;
  return result;
}

- (void)_cancelHelperFired:(unint64_t)a3
{
  uint64_t v5 = VOTLogAudio(self, a2);
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    unint64_t soundPlayGeneration = self->_soundPlayGeneration;
    BOOL isPlaying = self->_isPlaying;
    int v9 = 134218496;
    unint64_t v10 = soundPlayGeneration;
    __int16 v11 = 2048;
    unint64_t v12 = a3;
    __int16 v13 = 1024;
    BOOL v14 = isPlaying;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_INFO,  "Cancel helper fired, %llu = %llu, playing: %d",  (uint8_t *)&v9,  0x1Cu);
  }

  if (self->_soundPlayGeneration == a3 && self->_isPlaying) {
    -[VOTSound _finishedPlaying](self, "_finishedPlaying");
  }
}

- (void)playAvoidingSSS:(BOOL)a3
{
  BOOL v3 = a3;
  -[SCRCTargetSelectorTimer cancel](self->_cancelHelperTimer, "cancel");
  ++self->_soundPlayGeneration;
  self->_BOOL isPlaying = 1;
  if (([(id)VOTSharedWorkspace soundMuted] & 1) != 0
    || [(id)VOTSharedWorkspace voiceOverIsIdle])
  {
    -[VOTSound _finishedPlaying](self, "_finishedPlaying");
    self->_BOOL isPlaying = 0;
  }

  else
  {
    BOOL v5 = -[VOTSound shouldUseAVAudioPlayer](self, "shouldUseAVAudioPlayer");
    BOOL v6 = v5;
    uint64_t v8 = VOTLogAudio(v5, v7);
    int v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_INFO);
    if (v6 || v3)
    {
      if (v10)
      {
        BOOL v16 = v3;
        uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(-[VOTSound soundPath](self, "soundPath"));
        *(_DWORD *)buf = 134218498;
        unint64_t v25 = v6;
        __int16 v26 = 2048;
        int v27 = (void *)v16;
        __int16 v28 = 2112;
        v29 = v17;
        _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_INFO,  "Will play sound via AVAudioPlayer. useAVAudioPlayer=%ld avoidSSS=%ld path=%@",  buf,  0x20u);
      }

      -[AVAudioPlayer play](self->_player, "play");
      unint64_t soundPlayGeneration = self->_soundPlayGeneration;
      cancelHelperTimer = self->_cancelHelperTimer;
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472LL;
      v21[2] = sub_100013D88;
      v21[3] = &unk_100176F30;
      v21[4] = self;
      v21[5] = soundPlayGeneration;
      -[SCRCTargetSelectorTimer dispatchAfterDelay:withBlock:]( cancelHelperTimer,  "dispatchAfterDelay:withBlock:",  v21,  0.5);
    }

    else
    {
      if (v10)
      {
        __int16 v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", 0LL));
        unint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[VOTSound soundPath](self, "soundPath"));
        *(_DWORD *)buf = 138412546;
        unint64_t v25 = (unint64_t)v11;
        __int16 v26 = 2112;
        int v27 = v12;
        _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_INFO,  "Will play sound via AudioServices. avoidSSS=%@ path=%@",  buf,  0x16u);
      }

      *(_DWORD *)buf = 1;
      AudioServicesSetProperty(0x61637421u, 4u, &self->_soundID, 4u, buf);
      v23[0] = &off_100187430;
      v22[0] = kAudioServicesPlaySystemSoundOptionBehaviorKey;
      v22[1] = kAudioServicesPlaySystemSoundOptionVolumeKey;
      __int16 v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", self->_volume));
      v22[2] = kAudioServicesPlaySystemSoundOptionIgnoreRingerSwitchKey;
      v23[1] = v13;
      v23[2] = &__kCFBooleanTrue;
      BOOL v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v23,  v22,  3LL));

      uint64_t soundID = self->_soundID;
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472LL;
      v20[2] = sub_100013D94;
      v20[3] = &unk_100176D38;
      v20[4] = self;
      AudioServicesPlaySystemSoundWithOptions(soundID, v14, v20);
    }
  }

- (void)play
{
}

- (void)playAvoidingSSS
{
}

- (void)audioPlayerDecodeErrorDidOccur:(id)a3 error:(id)a4
{
  id v5 = a4;
  uint64_t v7 = VOTLogAudio(v5, v6);
  uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
    sub_1000EF578();
  }

  -[VOTSound _finishedPlaying](self, "_finishedPlaying");
  self->_BOOL isPlaying = 0;
}

- (void)audioPlayerDidFinishPlaying:(id)a3 successfully:(BOOL)a4
{
  id v6 = -[SCRCTargetSelectorTimer cancel](self->_cancelHelperTimer, "cancel", a3);
  uint64_t v8 = VOTLogAudio(v6, v7);
  int v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    sub_1000EF5E8(a4, (uint64_t)self, v9);
  }

  -[VOTSound _finishedPlaying](self, "_finishedPlaying");
  self->_BOOL isPlaying = 0;
}

- (id)completionBlock
{
  return self->_completionBlock;
}

- (void)setIsPlaying:(BOOL)a3
{
  self->_BOOL isPlaying = a3;
}

- (SCRCThread)soundThread
{
  return self->_soundThread;
}

- (void)setSoundThread:(id)a3
{
}

- (BOOL)isVolumeSound
{
  return self->_isVolumeSound;
}

- (void)setIsVolumeSound:(BOOL)a3
{
  self->_isVolumeSound = a3;
}

- (NSString)resolvedSoundPath
{
  return self->_resolvedSoundPath;
}

- (void)setResolvedSoundPath:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
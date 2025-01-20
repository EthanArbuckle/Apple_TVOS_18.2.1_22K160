@interface MRDMediaServerNowPlayingDataSource
- (AVSystemController)mediaServerController;
- (BOOL)nowPlayingApplicationIsInterrupted;
- (BOOL)nowPlayingApplicationIsPlaying;
- (BOOL)shouldSendCommand:(id)a3;
- (MRDMediaServerNowPlayingDataSource)init;
- (NSDictionary)nowPlayingApplications;
- (NSDictionary)nowPlayingAudioFormatContentInfos;
- (NSDictionary)nowPlayingSessions;
- (NSString)nowPlayingApplicationDisplayID;
- (id)_createMediaServerController;
- (id)audioFormatContentInfoForApplication:(id)a3 cachedAudioFormatContentInfo:(id)a4;
- (id)bestAvailableContentForConsolidatedSourceContentInfo:(id)a3;
- (id)contentInfoForConsolidatedSourceContentInfo:(id)a3;
- (id)description;
- (id)nowPlayingApplicationsFromSessionsArray:(id)a3;
- (id)nowPlayingAudioFormatContentInfosFromNowPlayingApplications:(id)a3;
- (id)nowPlayingSessionsFromAVSessionsArray:(id)a3;
- (id)topOfNowPlayingAppStack;
- (int)nowPlayingApplicationPID;
- (void)_avSessionMediaServicesResetNotification:(id)a3;
- (void)_nowPlayingAppDidChangeNotification:(id)a3;
- (void)_nowPlayingAppIsPlayingDidChangeNotification:(id)a3;
- (void)_nowPlayingSessionIsPlayingDidChangeNotification:(id)a3;
- (void)_popNowPlayingAppStack;
- (void)_renderingModeChangeNotification:(id)a3;
- (void)_someSessionIsPlayingDidChangeNotification:(id)a3;
- (void)_sourceFormatInfoDidChangeNotification:(id)a3;
- (void)_updateNowPlayingAudioFormatContentInfo;
- (void)addCachedAudioSession:(id)a3 forID:(unsigned int)a4;
- (void)dealloc;
- (void)loadMediaServerState;
- (void)loadMediaServerStateWithController:(id)a3;
- (void)resetMediaServerState;
- (void)setMediaServerController:(id)a3;
- (void)setNowPlayingApplicationDisplayID:(id)a3;
- (void)setNowPlayingApplicationIsPlaying:(BOOL)a3;
- (void)setNowPlayingApplicationPID:(int)a3;
- (void)setNowPlayingApplications:(id)a3;
- (void)setNowPlayingAudioFormatContentInfos:(id)a3;
- (void)setNowPlayingSessions:(id)a3;
@end

@implementation MRDMediaServerNowPlayingDataSource

- (MRDMediaServerNowPlayingDataSource)init
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___MRDMediaServerNowPlayingDataSource;
  v2 = -[MRDNowPlayingDataSource init](&v10, "init");
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create( "com.apple.mediaremote.MRDMediaServerNowPlayingDataSource",  &_dispatch_queue_attr_concurrent);
    mediaServerControllerLock = v2->_mediaServerControllerLock;
    v2->_mediaServerControllerLock = (OS_dispatch_queue *)v3;

    -[MRDMediaServerNowPlayingDataSource loadMediaServerState](v2, "loadMediaServerState");
    v5 = -[MSVLRUDictionary initWithMaximumCapacity:]( objc_alloc(&OBJC_CLASS___MSVLRUDictionary),  "initWithMaximumCapacity:",  10LL);
    cachedAudioSessions = v2->_cachedAudioSessions;
    v2->_cachedAudioSessions = v5;

    v7 = (CXCallObserver *)objc_alloc_init((Class)MSVWeakLinkClass(@"CXCallObserver", @"CallKit"));
    callObserver = v2->_callObserver;
    v2->_callObserver = v7;
  }

  return v2;
}

- (void)dealloc
{
  dispatch_queue_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___MRDMediaServerNowPlayingDataSource;
  -[MRDMediaServerNowPlayingDataSource dealloc](&v4, "dealloc");
}

- (NSDictionary)nowPlayingApplications
{
  v2 = self;
  objc_sync_enter(v2);
  id v3 = -[NSDictionary copy](v2->_cachedNowPlayingApplications, "copy");
  objc_sync_exit(v2);

  return (NSDictionary *)v3;
}

- (void)setNowPlayingApplications:(id)a3
{
  id v4 = a3;
  uint64_t v6 = _MRLogForCategory(1LL, v5);
  v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = objc_opt_class(self);
    v9 = (void *)objc_claimAutoreleasedReturnValue([v4 allValues]);
    uint64_t v10 = MRCreateIndentedDebugDescriptionFromArray(v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    int v15 = 138543874;
    uint64_t v16 = v8;
    __int16 v17 = 2114;
    v18 = @"nowPlayingApplications";
    __int16 v19 = 2112;
    v20 = v11;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Set: %{public}@ setting %{public}@ to <%@>",  (uint8_t *)&v15,  0x20u);
  }

  v12 = self;
  objc_sync_enter(v12);
  v13 = (NSDictionary *)[v4 copy];
  cachedNowPlayingApplications = v12->_cachedNowPlayingApplications;
  v12->_cachedNowPlayingApplications = v13;

  objc_sync_exit(v12);
}

- (NSDictionary)nowPlayingSessions
{
  v2 = self;
  objc_sync_enter(v2);
  id v3 = -[NSDictionary copy](v2->_cachedNowPlayingSessions, "copy");
  objc_sync_exit(v2);

  return (NSDictionary *)v3;
}

- (void)setNowPlayingSessions:(id)a3
{
  id v4 = a3;
  uint64_t v6 = _MRLogForCategory(1LL, v5);
  v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = objc_opt_class(self);
    v9 = (void *)objc_claimAutoreleasedReturnValue([v4 allValues]);
    uint64_t v10 = MRCreateIndentedDebugDescriptionFromArray(v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    int v15 = 138543874;
    uint64_t v16 = v8;
    __int16 v17 = 2114;
    v18 = @"nowPlayingSessions";
    __int16 v19 = 2112;
    v20 = v11;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Set: %{public}@ setting %{public}@ to <%@>",  (uint8_t *)&v15,  0x20u);
  }

  v12 = self;
  objc_sync_enter(v12);
  v13 = (NSDictionary *)[v4 copy];
  cachedNowPlayingSessions = v12->_cachedNowPlayingSessions;
  v12->_cachedNowPlayingSessions = v13;

  objc_sync_exit(v12);
}

- (NSDictionary)nowPlayingAudioFormatContentInfos
{
  v2 = self;
  objc_sync_enter(v2);
  id v3 = -[NSDictionary copy](v2->_cachedAudioFormatContentInfos, "copy");
  objc_sync_exit(v2);

  return (NSDictionary *)v3;
}

- (void)setNowPlayingAudioFormatContentInfos:(id)a3
{
  id v4 = a3;
  uint64_t v6 = _MRLogForCategory(1LL, v5);
  v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = objc_opt_class(self);
    v9 = (void *)objc_claimAutoreleasedReturnValue([v4 allValues]);
    uint64_t v10 = MRCreateIndentedDebugDescriptionFromArray(v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    int v15 = 138543874;
    uint64_t v16 = v8;
    __int16 v17 = 2114;
    v18 = @"nowPlayingAudioFormatContentInfos";
    __int16 v19 = 2112;
    v20 = v11;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Set: %{public}@ setting %{public}@ to <%@>",  (uint8_t *)&v15,  0x20u);
  }

  v12 = self;
  objc_sync_enter(v12);
  v13 = (NSDictionary *)[v4 copy];
  cachedAudioFormatContentInfos = v12->_cachedAudioFormatContentInfos;
  v12->_cachedAudioFormatContentInfos = v13;

  objc_sync_exit(v12);
}

- (NSString)nowPlayingApplicationDisplayID
{
  v2 = self;
  objc_sync_enter(v2);
  id v3 = v2->_cachedNowPlayingAppDisplayID;
  if (-[NSString isEqualToString:](v2->_cachedNowPlayingAppDisplayID, "isEqualToString:", @"AirMusic")
    || -[NSString isEqualToString:](v2->_cachedNowPlayingAppDisplayID, "isEqualToString:", @"com.apple.AirMusic"))
  {
    id v4 = @"com.apple.Music";
LABEL_4:

    id v3 = (__CFString *)v4;
    goto LABEL_5;
  }

  if (-[NSString isEqualToString:](v2->_cachedNowPlayingAppDisplayID, "isEqualToString:", @"AirPodcasts")
    || -[NSString isEqualToString:]( v2->_cachedNowPlayingAppDisplayID,  "isEqualToString:",  @"com.apple.AirPodcasts"))
  {
    id v4 = @"com.apple.podcasts";
    goto LABEL_4;
  }

- (void)setNowPlayingApplicationDisplayID:(id)a3
{
  id v4 = a3;
  uint64_t v6 = _MRLogForCategory(1LL, v5);
  v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138543874;
    uint64_t v12 = objc_opt_class(self);
    __int16 v13 = 2114;
    v14 = @"nowPlayingApplicationDisplayID";
    __int16 v15 = 2112;
    id v16 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Set: %{public}@ setting %{public}@ to <%@>",  (uint8_t *)&v11,  0x20u);
  }

  uint64_t v8 = self;
  objc_sync_enter(v8);
  v9 = (NSString *)[v4 copy];
  cachedNowPlayingAppDisplayID = v8->_cachedNowPlayingAppDisplayID;
  v8->_cachedNowPlayingAppDisplayID = v9;

  objc_sync_exit(v8);
}

- (int)nowPlayingApplicationPID
{
  v2 = self;
  objc_sync_enter(v2);
  int cachedNowPlayingAppPID = v2->_cachedNowPlayingAppPID;
  objc_sync_exit(v2);

  return cachedNowPlayingAppPID;
}

- (void)setNowPlayingApplicationPID:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v5 = _MRLogForCategory(1LL, a2);
  uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = objc_opt_class(self);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v3));
    int v10 = 138543874;
    uint64_t v11 = v7;
    __int16 v12 = 2114;
    __int16 v13 = @"nowPlayingApplicationPID";
    __int16 v14 = 2112;
    __int16 v15 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Set: %{public}@ setting %{public}@ to <%@>",  (uint8_t *)&v10,  0x20u);
  }

  v9 = self;
  objc_sync_enter(v9);
  v9->_int cachedNowPlayingAppPID = v3;
  objc_sync_exit(v9);
}

- (BOOL)nowPlayingApplicationIsPlaying
{
  v2 = self;
  objc_sync_enter(v2);
  BOOL cachedNowPlayingAppIsPlaying = v2->_cachedNowPlayingAppIsPlaying;
  objc_sync_exit(v2);

  return cachedNowPlayingAppIsPlaying;
}

- (void)setNowPlayingApplicationIsPlaying:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = _MRLogForCategory(1LL, a2);
  uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = objc_opt_class(self);
    uint64_t v8 = @"NO";
    if (v3) {
      uint64_t v8 = @"YES";
    }
    int v10 = 138543874;
    uint64_t v11 = v7;
    __int16 v12 = 2114;
    __int16 v13 = @"nowPlayingApplicationIsPlaying";
    __int16 v14 = 2112;
    __int16 v15 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Set: %{public}@ setting %{public}@ to <%@>",  (uint8_t *)&v10,  0x20u);
  }

  v9 = self;
  objc_sync_enter(v9);
  v9->_BOOL cachedNowPlayingAppIsPlaying = v3;
  objc_sync_exit(v9);
}

- (BOOL)shouldSendCommand:(id)a3
{
  if ([a3 originatedFromAccessory])
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MRDMediaServerNowPlayingDataSource mediaServerController](self, "mediaServerController"));
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( [v4 attributeForKey:AVSystemController_ShouldIgnorePlayCommandsFromAccessoryAttribute]);

    if (v5 && (objc_opt_respondsToSelector(v5, "BOOLValue") & 1) != 0)
    {
      unsigned int v6 = [v5 BOOLValue] ^ 1;
      uint64_t v8 = _MRLogForCategory(0LL, v7);
      v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        int v11 = 138412546;
        uint64_t v12 = AVSystemController_ShouldIgnorePlayCommandsFromAccessoryAttribute;
        __int16 v13 = 2112;
        __int16 v14 = v5;
        _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "[MediaServerNowPlayingDataSource] AVSystemController.%@=%@",  (uint8_t *)&v11,  0x16u);
      }
    }

    else
    {
      LOBYTE(v6) = 1;
    }
  }

  else
  {
    LOBYTE(v6) = 1;
  }

  return v6;
}

- (BOOL)nowPlayingApplicationIsInterrupted
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MRDMediaServerNowPlayingDataSource mediaServerController](self, "mediaServerController"));
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue([v2 attributeForKey:AVSystemController_NowPlayingAppIsInterruptedAttribute]);
  unsigned __int8 v4 = [v3 BOOLValue];

  return v4;
}

- (id)topOfNowPlayingAppStack
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MRDMediaServerNowPlayingDataSource mediaServerController](self, "mediaServerController"));
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue([v2 topOfNowPlayingAppStack]);

  return v3;
}

- (void)_popNowPlayingAppStack
{
  uint64_t v3 = _MRLogForCategory(0LL, a2);
  unsigned __int8 v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)unsigned int v6 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "[MediaServerNowPlayingDataSource] Popping nowPlayingAppStack..",  v6,  2u);
  }

  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[MRDMediaServerNowPlayingDataSource mediaServerController](self, "mediaServerController"));
  [v5 popNowPlayingAppStack];
}

- (void)_nowPlayingAppDidChangeNotification:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[MRDMediaServerNowPlayingDataSource mediaServerController](self, "mediaServerController"));
  unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue([v5 attributeForKey:AVSystemController_NowPlayingAppDisplayIDAttribute]);
  id v7 = [v6 copy];

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v5 attributeForKey:AVSystemController_NowPlayingAppIsPlayingAttribute]);
  id v9 = [v8 BOOLValue];

  int v10 = (void *)objc_claimAutoreleasedReturnValue([v5 attributeForKey:AVSystemController_NowPlayingAppPIDAttribute]);
  id v11 = [v10 intValue];

  uint64_t v12 = self;
  objc_sync_enter(v12);
  -[MRDMediaServerNowPlayingDataSource setNowPlayingApplicationDisplayID:]( v12,  "setNowPlayingApplicationDisplayID:",  v7);
  -[MRDMediaServerNowPlayingDataSource setNowPlayingApplicationPID:](v12, "setNowPlayingApplicationPID:", v11);
  -[MRDMediaServerNowPlayingDataSource setNowPlayingApplicationIsPlaying:]( v12,  "setNowPlayingApplicationIsPlaying:",  v9);
  objc_sync_exit(v12);

  __int16 v13 = (void *)objc_claimAutoreleasedReturnValue( -[MRDNowPlayingDataSource observersForSelector:]( v12,  "observersForSelector:",  "nowPlayingDataSourceNowPlayingApplicationDidChange:"));
  if ([v13 count])
  {
    __int128 v20 = 0u;
    __int128 v21 = 0u;
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    id v14 = v13;
    id v15 = [v14 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v15)
    {
      uint64_t v16 = *(void *)v19;
      do
      {
        __int16 v17 = 0LL;
        do
        {
          if (*(void *)v19 != v16) {
            objc_enumerationMutation(v14);
          }
          objc_msgSend( *(id *)(*((void *)&v18 + 1) + 8 * (void)v17),  "nowPlayingDataSourceNowPlayingApplicationDidChange:",  v12,  (void)v18);
          __int16 v17 = (char *)v17 + 1;
        }

        while (v15 != v17);
        id v15 = [v14 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }

      while (v15);
    }
  }
}

- (void)_nowPlayingAppIsPlayingDidChangeNotification:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MRDMediaServerNowPlayingDataSource mediaServerController](self, "mediaServerController", a3));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 attributeForKey:AVSystemController_NowPlayingAppIsPlayingAttribute]);
  -[MRDMediaServerNowPlayingDataSource setNowPlayingApplicationIsPlaying:]( self,  "setNowPlayingApplicationIsPlaying:",  [v5 BOOLValue]);

  unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue( -[MRDNowPlayingDataSource observersForSelector:]( self,  "observersForSelector:",  "nowPlayingDataSourceNowPlayingApplicationPlaybackStateDidChange:"));
  if ([v6 count])
  {
    __int128 v15 = 0u;
    __int128 v16 = 0u;
    __int128 v13 = 0u;
    __int128 v14 = 0u;
    id v7 = v6;
    id v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v14;
      do
      {
        id v11 = 0LL;
        do
        {
          if (*(void *)v14 != v10) {
            objc_enumerationMutation(v7);
          }
          objc_msgSend( *(id *)(*((void *)&v13 + 1) + 8 * (void)v11),  "nowPlayingDataSourceNowPlayingApplicationPlaybackStateDidChange:",  self,  (void)v13);
          id v11 = (char *)v11 + 1;
        }

        while (v9 != v11);
        id v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }

      while (v9);
    }
  }

  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( +[MRAVConcreteOutputContext sharedAudioPresentationContext]( &OBJC_CLASS___MRAVConcreteOutputContext,  "sharedAudioPresentationContext",  (void)v13));
  [v12 attemptLogicalDeviceRecovery];
}

- (void)_someSessionIsPlayingDidChangeNotification:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MRDMediaServerNowPlayingDataSource mediaServerController](self, "mediaServerController", a3));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 attributeForKey:AVSystemController_PlayingSessionsDescriptionAttribute]);

  if (v5)
  {
    unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue( -[MRDMediaServerNowPlayingDataSource nowPlayingApplicationsFromSessionsArray:]( self,  "nowPlayingApplicationsFromSessionsArray:",  v5));
    -[MRDMediaServerNowPlayingDataSource setNowPlayingApplications:](self, "setNowPlayingApplications:", v6);

    id v7 = (void *)objc_claimAutoreleasedReturnValue( -[MRDNowPlayingDataSource observersForSelector:]( self,  "observersForSelector:",  "nowPlayingDataSourceNowPlayingApplicationsPlaybackStateDidChange:"));
    if ([v7 count])
    {
      __int128 v15 = 0u;
      __int128 v16 = 0u;
      __int128 v13 = 0u;
      __int128 v14 = 0u;
      id v8 = v7;
      id v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v9)
      {
        id v10 = v9;
        uint64_t v11 = *(void *)v14;
        do
        {
          uint64_t v12 = 0LL;
          do
          {
            if (*(void *)v14 != v11) {
              objc_enumerationMutation(v8);
            }
            objc_msgSend( *(id *)(*((void *)&v13 + 1) + 8 * (void)v12),  "nowPlayingDataSourceNowPlayingApplicationsPlaybackStateDidChange:",  self,  (void)v13);
            uint64_t v12 = (char *)v12 + 1;
          }

          while (v10 != v12);
          id v10 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
        }

        while (v10);
      }
    }
  }
}

- (void)_nowPlayingSessionIsPlayingDidChangeNotification:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MRDMediaServerNowPlayingDataSource mediaServerController](self, "mediaServerController", a3));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 attributeForKey:AVSystemController_NowPlayingInfoAttribute]);

  if (v5)
  {
    unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue( -[MRDMediaServerNowPlayingDataSource nowPlayingSessionsFromAVSessionsArray:]( self,  "nowPlayingSessionsFromAVSessionsArray:",  v5));
    -[MRDMediaServerNowPlayingDataSource setNowPlayingSessions:](self, "setNowPlayingSessions:", v6);

    id v7 = (void *)objc_claimAutoreleasedReturnValue( -[MRDNowPlayingDataSource observersForSelector:]( self,  "observersForSelector:",  "nowPlayingDataSourceNowPlayingSessionsPlaybackStateDidChange:"));
    if ([v7 count])
    {
      __int128 v15 = 0u;
      __int128 v16 = 0u;
      __int128 v13 = 0u;
      __int128 v14 = 0u;
      id v8 = v7;
      id v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v9)
      {
        id v10 = v9;
        uint64_t v11 = *(void *)v14;
        do
        {
          uint64_t v12 = 0LL;
          do
          {
            if (*(void *)v14 != v11) {
              objc_enumerationMutation(v8);
            }
            objc_msgSend( *(id *)(*((void *)&v13 + 1) + 8 * (void)v12),  "nowPlayingDataSourceNowPlayingSessionsPlaybackStateDidChange:",  self,  (void)v13);
            uint64_t v12 = (char *)v12 + 1;
          }

          while (v10 != v12);
          id v10 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
        }

        while (v10);
      }
    }
  }
}

- (void)_sourceFormatInfoDidChangeNotification:(id)a3
{
  id v4 = a3;
  uint64_t v6 = _MRLogForCategory(0LL, v5);
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412546;
    uint64_t v10 = objc_opt_class(self);
    __int16 v11 = 2112;
    id v12 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "[MediaServerNowPlayingDataSource] %@ Handling %@",  (uint8_t *)&v9,  0x16u);
  }

  id v8 = self;
  objc_sync_enter(v8);
  -[MRDMediaServerNowPlayingDataSource _updateNowPlayingAudioFormatContentInfo]( v8,  "_updateNowPlayingAudioFormatContentInfo");
  objc_sync_exit(v8);
}

- (void)_renderingModeChangeNotification:(id)a3
{
  id v4 = a3;
  uint64_t v6 = _MRLogForCategory(0LL, v5);
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412546;
    uint64_t v10 = objc_opt_class(self);
    __int16 v11 = 2112;
    id v12 = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%@ Handling %@", (uint8_t *)&v9, 0x16u);
  }

  id v8 = self;
  objc_sync_enter(v8);
  -[MRDMediaServerNowPlayingDataSource _updateNowPlayingAudioFormatContentInfo]( v8,  "_updateNowPlayingAudioFormatContentInfo");
  objc_sync_exit(v8);
}

- (void)_avSessionMediaServicesResetNotification:(id)a3
{
  id v4 = a3;
  uint64_t v6 = _MRLogForCategory(0LL, v5);
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v4 object]);
    int v9 = 138412290;
    uint64_t v10 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "[MediaServerNowPlayingDataSource] AVAudioSessionMediaServicesWereReset notification received %@",  (uint8_t *)&v9,  0xCu);
  }

  -[MRDMediaServerNowPlayingDataSource resetMediaServerState](self, "resetMediaServerState");
  -[MRDMediaServerNowPlayingDataSource loadMediaServerState](self, "loadMediaServerState");
}

- (id)_createMediaServerController
{
  return +[AVSystemController sharedAVSystemController](&OBJC_CLASS___AVSystemController, "sharedAVSystemController");
}

- (void)setMediaServerController:(id)a3
{
  id v4 = a3;
  uint64_t v6 = _MRLogForCategory(1LL, v5);
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = objc_opt_class(self);
    int v9 = @"YES";
    if (!v4) {
      int v9 = @"NO";
    }
    *(_DWORD *)buf = 138543874;
    uint64_t v19 = v8;
    __int16 v20 = 2114;
    __int128 v21 = @"mediaServerController";
    __int16 v22 = 2112;
    v23 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Set: %{public}@ setting %{public}@ to <%@>",  buf,  0x20u);
  }

  mediaServerControllerLock = (dispatch_queue_s *)self->_mediaServerControllerLock;
  id v12 = _NSConcreteStackBlock;
  uint64_t v13 = 3221225472LL;
  __int128 v14 = sub_100119B5C;
  __int128 v15 = &unk_100398E60;
  __int128 v16 = self;
  id v17 = v4;
  id v11 = v4;
  dispatch_barrier_sync(mediaServerControllerLock, &v12);
  -[MRDMediaServerNowPlayingDataSource loadMediaServerStateWithController:]( self,  "loadMediaServerStateWithController:",  v11,  v12,  v13,  v14,  v15,  v16);
}

- (AVSystemController)mediaServerController
{
  uint64_t v6 = 0LL;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000LL;
  int v9 = sub_100119C2C;
  uint64_t v10 = sub_100119C3C;
  id v11 = 0LL;
  mediaServerControllerLock = (dispatch_queue_s *)self->_mediaServerControllerLock;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_100119C44;
  v5[3] = &unk_100399278;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(mediaServerControllerLock, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (AVSystemController *)v3;
}

- (void)loadMediaServerState
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(-[MRDMediaServerNowPlayingDataSource _createMediaServerController](self, "_createMediaServerController"));
  -[MRDMediaServerNowPlayingDataSource setMediaServerController:](self, "setMediaServerController:", v3);
}

- (void)loadMediaServerStateWithController:(id)a3
{
  id v4 = a3;
  uint64_t v6 = _MRLogForCategory(0LL, v5);
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v93 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "[MediaServerNowPlayingDataSource] loadMediaServerState: %@",  buf,  0xCu);
  }

  uint64_t v8 = off_1003F7940[0]();
  int v9 = (void *)objc_claimAutoreleasedReturnValue(v8);

  if (v9)
  {
    uint64_t v10 = off_1003F7940[0]();
    id v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    v91 = v11;
    id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v91, 1LL));
    [v4 setAttribute:v12 forKey:AVSystemController_SubscribeToNotificationsAttribute error:0];

    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    uint64_t v14 = off_1003F7940[0]();
    __int128 v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    [v13 addObserver:self selector:"_avSessionMediaServicesResetNotification:" name:v15 object:v4];
  }

  if (AVSystemController_NowPlayingAppPIDDidChangeNotification)
  {
    uint64_t v90 = AVSystemController_NowPlayingAppPIDDidChangeNotification;
    __int128 v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v90, 1LL));
    [v4 setAttribute:v16 forKey:AVSystemController_SubscribeToNotificationsAttribute error:0];

    id v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v17 addObserver:self selector:"_nowPlayingAppDidChangeNotification:" name:AVSystemController_NowPlayingAppPIDDidChangeNotification object:v4];
  }

  if (AVSystemController_NowPlayingAppIsPlayingDidChangeNotification)
  {
    uint64_t v89 = AVSystemController_NowPlayingAppIsPlayingDidChangeNotification;
    __int128 v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v89, 1LL));
    [v4 setAttribute:v18 forKey:AVSystemController_SubscribeToNotificationsAttribute error:0];

    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v19 addObserver:self selector:"_nowPlayingAppIsPlayingDidChangeNotification:" name:AVSystemController_NowPlayingAppIsPlayingDidChangeNotification object:v4];
  }

  __int16 v20 = (void *)objc_claimAutoreleasedReturnValue(+[MRUserSettings currentSettings](&OBJC_CLASS___MRUserSettings, "currentSettings"));
  unsigned int v21 = [v20 needsMXApplications];

  if (v21)
  {
    if (AVSystemController_SomeSessionIsPlayingDidChangeNotification)
    {
      uint64_t v88 = AVSystemController_SomeSessionIsPlayingDidChangeNotification;
      __int16 v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v88, 1LL));
      [v4 setAttribute:v22 forKey:AVSystemController_SubscribeToNotificationsAttribute error:0];

      v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
      [v23 addObserver:self selector:"_someSessionIsPlayingDidChangeNotification:" name:AVSystemController_SomeSessionIsPlayingDidChangeNotification object:v4];
    }

    if (AVSystemController_SourceFormatInfoDidChangeNotification)
    {
      uint64_t v87 = AVSystemController_SourceFormatInfoDidChangeNotification;
      v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v87, 1LL));
      [v4 setAttribute:v24 forKey:AVSystemController_SubscribeToNotificationsAttribute error:0];

      v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
      [v25 addObserver:self selector:"_sourceFormatInfoDidChangeNotification:" name:AVSystemController_SourceFormatInfoDidChangeNotification object:v4];
    }
  }

  v26 = (void *)objc_claimAutoreleasedReturnValue([v4 attributeForKey:AVSystemController_NowPlayingAppDisplayIDAttribute]);
  id v27 = [v26 copy];

  v28 = (void *)objc_claimAutoreleasedReturnValue([v4 attributeForKey:AVSystemController_NowPlayingAppIsPlayingAttribute]);
  id v29 = [v28 BOOLValue];

  v30 = (void *)objc_claimAutoreleasedReturnValue([v4 attributeForKey:AVSystemController_NowPlayingAppPIDAttribute]);
  id v31 = [v30 intValue];

  v32 = (void *)objc_claimAutoreleasedReturnValue([v4 attributeForKey:AVSystemController_NowPlayingInfoAttribute]);
  v33 = (void *)objc_claimAutoreleasedReturnValue( -[MRDMediaServerNowPlayingDataSource nowPlayingSessionsFromAVSessionsArray:]( self,  "nowPlayingSessionsFromAVSessionsArray:",  v32));

  v34 = (void *)objc_claimAutoreleasedReturnValue(+[MRUserSettings currentSettings](&OBJC_CLASS___MRUserSettings, "currentSettings"));
  unsigned int v35 = [v34 needsMXApplications];

  if (v35)
  {
    v36 = (void *)objc_claimAutoreleasedReturnValue([v4 attributeForKey:AVSystemController_PlayingSessionsDescriptionAttribute]);
    v37 = (void *)objc_claimAutoreleasedReturnValue( -[MRDMediaServerNowPlayingDataSource nowPlayingApplicationsFromSessionsArray:]( self,  "nowPlayingApplicationsFromSessionsArray:",  v36));

    v38 = (void *)objc_claimAutoreleasedReturnValue( -[MRDMediaServerNowPlayingDataSource nowPlayingAudioFormatContentInfosFromNowPlayingApplications:]( self,  "nowPlayingAudioFormatContentInfosFromNowPlayingApplications:",  v37));
  }

  else
  {
    v37 = 0LL;
    v38 = 0LL;
  }

  v39 = self;
  objc_sync_enter(v39);
  -[MRDMediaServerNowPlayingDataSource setNowPlayingApplicationDisplayID:]( v39,  "setNowPlayingApplicationDisplayID:",  v27);
  -[MRDMediaServerNowPlayingDataSource setNowPlayingApplicationIsPlaying:]( v39,  "setNowPlayingApplicationIsPlaying:",  v29);
  -[MRDMediaServerNowPlayingDataSource setNowPlayingApplicationPID:](v39, "setNowPlayingApplicationPID:", v31);
  -[MRDMediaServerNowPlayingDataSource setNowPlayingSessions:](v39, "setNowPlayingSessions:", v33);
  -[MRDMediaServerNowPlayingDataSource setNowPlayingApplications:](v39, "setNowPlayingApplications:", v37);
  -[MRDMediaServerNowPlayingDataSource setNowPlayingAudioFormatContentInfos:]( v39,  "setNowPlayingAudioFormatContentInfos:",  v38);
  objc_sync_exit(v39);

  __int128 v80 = 0u;
  __int128 v81 = 0u;
  __int128 v78 = 0u;
  __int128 v79 = 0u;
  v40 = (void *)objc_claimAutoreleasedReturnValue( -[MRDNowPlayingDataSource observersForSelector:]( v39,  "observersForSelector:",  "nowPlayingDataSourceNowPlayingApplicationDidChange:"));
  id v41 = [v40 countByEnumeratingWithState:&v78 objects:v86 count:16];
  if (v41)
  {
    uint64_t v42 = *(void *)v79;
    do
    {
      v43 = 0LL;
      do
      {
        if (*(void *)v79 != v42) {
          objc_enumerationMutation(v40);
        }
        [*(id *)(*((void *)&v78 + 1) + 8 * (void)v43) nowPlayingDataSourceNowPlayingApplicationDidChange:v39];
        v43 = (char *)v43 + 1;
      }

      while (v41 != v43);
      id v41 = [v40 countByEnumeratingWithState:&v78 objects:v86 count:16];
    }

    while (v41);
  }

  __int128 v76 = 0u;
  __int128 v77 = 0u;
  __int128 v74 = 0u;
  __int128 v75 = 0u;
  v44 = (void *)objc_claimAutoreleasedReturnValue( -[MRDNowPlayingDataSource observersForSelector:]( v39,  "observersForSelector:",  "nowPlayingDataSourceNowPlayingApplicationPlaybackStateDidChange:"));
  id v45 = [v44 countByEnumeratingWithState:&v74 objects:v85 count:16];
  if (v45)
  {
    uint64_t v46 = *(void *)v75;
    do
    {
      v47 = 0LL;
      do
      {
        if (*(void *)v75 != v46) {
          objc_enumerationMutation(v44);
        }
        [*(id *)(*((void *)&v74 + 1) + 8 * (void)v47) nowPlayingDataSourceNowPlayingApplicationPlaybackStateDidChange:v39];
        v47 = (char *)v47 + 1;
      }

      while (v45 != v47);
      id v45 = [v44 countByEnumeratingWithState:&v74 objects:v85 count:16];
    }

    while (v45);
  }

  __int128 v72 = 0u;
  __int128 v73 = 0u;
  __int128 v70 = 0u;
  __int128 v71 = 0u;
  v48 = (void *)objc_claimAutoreleasedReturnValue( -[MRDNowPlayingDataSource observersForSelector:]( v39,  "observersForSelector:",  "nowPlayingDataSourceNowPlayingSessionsPlaybackStateDidChange:"));
  id v49 = [v48 countByEnumeratingWithState:&v70 objects:v84 count:16];
  if (v49)
  {
    uint64_t v50 = *(void *)v71;
    do
    {
      v51 = 0LL;
      do
      {
        if (*(void *)v71 != v50) {
          objc_enumerationMutation(v48);
        }
        [*(id *)(*((void *)&v70 + 1) + 8 * (void)v51) nowPlayingDataSourceNowPlayingSessionsPlaybackStateDidChange:v39];
        v51 = (char *)v51 + 1;
      }

      while (v49 != v51);
      id v49 = [v48 countByEnumeratingWithState:&v70 objects:v84 count:16];
    }

    while (v49);
  }

  v52 = (void *)objc_claimAutoreleasedReturnValue(+[MRUserSettings currentSettings](&OBJC_CLASS___MRUserSettings, "currentSettings"));
  unsigned int v53 = [v52 needsMXApplications];

  if (v53)
  {
    __int128 v68 = 0u;
    __int128 v69 = 0u;
    __int128 v66 = 0u;
    __int128 v67 = 0u;
    v54 = (void *)objc_claimAutoreleasedReturnValue( -[MRDNowPlayingDataSource observersForSelector:]( v39,  "observersForSelector:",  "nowPlayingDataSourceNowPlayingApplicationsPlaybackStateDidChange:"));
    id v55 = [v54 countByEnumeratingWithState:&v66 objects:v83 count:16];
    if (v55)
    {
      uint64_t v56 = *(void *)v67;
      do
      {
        v57 = 0LL;
        do
        {
          if (*(void *)v67 != v56) {
            objc_enumerationMutation(v54);
          }
          [*(id *)(*((void *)&v66 + 1) + 8 * (void)v57) nowPlayingDataSourceNowPlayingApplicationsPlaybackStateDidChange:v39];
          v57 = (char *)v57 + 1;
        }

        while (v55 != v57);
        id v55 = [v54 countByEnumeratingWithState:&v66 objects:v83 count:16];
      }

      while (v55);
    }

    __int128 v64 = 0u;
    __int128 v65 = 0u;
    __int128 v62 = 0u;
    __int128 v63 = 0u;
    v58 = (void *)objc_claimAutoreleasedReturnValue( -[MRDNowPlayingDataSource observersForSelector:]( v39,  "observersForSelector:",  "nowPlayingDataSourceNowPlayingAudioFormatContentInfosDidChange:",  0LL));
    id v59 = [v58 countByEnumeratingWithState:&v62 objects:v82 count:16];
    if (v59)
    {
      uint64_t v60 = *(void *)v63;
      do
      {
        v61 = 0LL;
        do
        {
          if (*(void *)v63 != v60) {
            objc_enumerationMutation(v58);
          }
          [*(id *)(*((void *)&v62 + 1) + 8 * (void)v61) nowPlayingDataSourceNowPlayingAudioFormatContentInfosDidChange:v39];
          v61 = (char *)v61 + 1;
        }

        while (v59 != v61);
        id v59 = [v58 countByEnumeratingWithState:&v62 objects:v82 count:16];
      }

      while (v59);
    }
  }
}

- (void)resetMediaServerState
{
  uint64_t v3 = _MRLogForCategory(0LL, a2);
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v8 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "[MediaServerNowPlayingDataSource] resetMediaServerState",  v8,  2u);
  }

  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  uint64_t v6 = off_1003F7940[0]();
  id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  [v5 removeObserver:self name:v7 object:0];

  [v5 removeObserver:self name:AVSystemController_NowPlayingAppPIDDidChangeNotification object:0];
  [v5 removeObserver:self name:AVSystemController_NowPlayingAppIsPlayingDidChangeNotification object:0];
  [v5 removeObserver:self name:AVSystemController_SomeSessionIsPlayingDidChangeNotification object:0];
  [v5 removeObserver:self name:AVSystemController_NowPlayingInfoDidChangeNotification object:0];
  [v5 removeObserver:self name:AVSystemController_SourceFormatInfoDidChangeNotification object:0];
}

- (id)nowPlayingApplicationsFromSessionsArray:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithCapacity:]( NSMutableDictionary,  "dictionaryWithCapacity:",  [v3 count]));
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  id obj = v3;
  id v5 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v20;
    do
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v20 != v7) {
          objc_enumerationMutation(obj);
        }
        int v9 = *(void **)(*((void *)&v19 + 1) + 8LL * (void)i);
        uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( [v9 objectForKeyedSubscript:AVSystemController_PlayingSessionsDescriptionKey_ClientPID]);
        id v11 = (void *)objc_claimAutoreleasedReturnValue( [v9 objectForKeyedSubscript:AVSystemController_PlayingSessionsDescriptionKey_AudioSessionID]);
        id v12 = (void *)objc_claimAutoreleasedReturnValue( [v9 objectForKeyedSubscript:AVSystemController_PlayingSessionsDescriptionKey_MXSessionIDs]);
        uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v12));

        uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( [v9 objectForKeyedSubscript:AVSystemController_PlayingSessionsDescriptionKey_IsNowPlayingEligible]);
        __int128 v15 = -[MRDNowPlayingDataSourceApplication initWithPID:audioSessionID:mxSessionIDs:isEligible:]( [MRDNowPlayingDataSourceApplication alloc],  "initWithPID:audioSessionID:mxSessionIDs:isEligible:",  [v10 intValue],  v11,  v13,  objc_msgSend(v14, "BOOLValue"));
        [v4 setObject:v15 forKeyedSubscript:v11];
      }

      id v6 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
    }

    while (v6);
  }

  id v16 = [v4 copy];
  return v16;
}

- (id)nowPlayingSessionsFromAVSessionsArray:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithCapacity:]( NSMutableDictionary,  "dictionaryWithCapacity:",  [v3 count]));
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v18;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v18 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v17 + 1) + 8LL * (void)i);
        id v11 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v10,  "objectForKeyedSubscript:",  AVSystemController_NowPlayingInfoDescriptionKey_AudioSessionID,  (void)v17));
        if (v11)
        {
          id v12 = (void *)objc_claimAutoreleasedReturnValue( [v10 objectForKeyedSubscript:AVSystemController_NowPlayingInfoDescriptionKey_BundleID]);
          uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( [v10 objectForKeyedSubscript:AVSystemController_NowPlayingInfoDescriptionKey_IsPlaying]);
          id v14 = [v13 BOOLValue];

          __int128 v15 = -[MRDNowPlayingDataSourceSession initWithBundleID:audioSessionID:isPlaying:]( objc_alloc(&OBJC_CLASS___MRDNowPlayingDataSourceSession),  "initWithBundleID:audioSessionID:isPlaying:",  v12,  v11,  v14);
          [v4 setObject:v15 forKeyedSubscript:v11];
        }
      }

      id v7 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }

    while (v7);
  }

  return v4;
}

- (id)nowPlayingAudioFormatContentInfosFromNowPlayingApplications:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithCapacity:]( NSMutableDictionary,  "dictionaryWithCapacity:",  [v4 count]));
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "allValues", 0));
  id v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v15 + 1) + 8LL * (void)i);
        id v12 = (void *)objc_claimAutoreleasedReturnValue( -[MRDMediaServerNowPlayingDataSource audioFormatContentInfoForApplication:cachedAudioFormatContentInfo:]( self,  "audioFormatContentInfoForApplication:cachedAudioFormatContentInfo:",  v11,  0LL));
        uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v11 audioSessionID]);
        [v5 setObject:v12 forKeyedSubscript:v13];
      }

      id v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }

    while (v8);
  }

  return v5;
}

- (void)_updateNowPlayingAudioFormatContentInfo
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[MRDMediaServerNowPlayingDataSource nowPlayingApplications](self, "nowPlayingApplications"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithCapacity:]( NSMutableDictionary,  "dictionaryWithCapacity:",  [v3 count]));
  id v5 = (void *)objc_claimAutoreleasedReturnValue( -[MRDMediaServerNowPlayingDataSource nowPlayingAudioFormatContentInfos]( self,  "nowPlayingAudioFormatContentInfos"));
  if ([v3 count])
  {
    __int128 v34 = 0u;
    __int128 v35 = 0u;
    __int128 v32 = 0u;
    __int128 v33 = 0u;
    id v27 = v3;
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v3 allValues]);
    id v8 = [v7 countByEnumeratingWithState:&v32 objects:v41 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v33;
      do
      {
        for (i = 0LL; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v33 != v10) {
            objc_enumerationMutation(v7);
          }
          id v12 = *(void **)(*((void *)&v32 + 1) + 8LL * (void)i);
          uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v12 audioSessionID]);
          id v14 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:v13]);

          __int128 v15 = (void *)objc_claimAutoreleasedReturnValue( -[MRDMediaServerNowPlayingDataSource audioFormatContentInfoForApplication:cachedAudioFormatContentInfo:]( self,  "audioFormatContentInfoForApplication:cachedAudioFormatContentInfo:",  v12,  v14));
          __int128 v16 = (void *)objc_claimAutoreleasedReturnValue([v12 audioSessionID]);
          [v4 setObject:v15 forKeyedSubscript:v16];
        }

        id v9 = [v7 countByEnumeratingWithState:&v32 objects:v41 count:16];
      }

      while (v9);
    }

    __int128 v17 = (NSDictionary *)[v4 copy];
    cachedAudioFormatContentInfos = self->_cachedAudioFormatContentInfos;
    self->_cachedAudioFormatContentInfos = v17;

    id v19 = (id)objc_claimAutoreleasedReturnValue( -[MRDNowPlayingDataSource observersForSelector:]( self,  "observersForSelector:",  "nowPlayingDataSourceNowPlayingAudioFormatContentInfosDidChange:"));
    if ([v19 count])
    {
      __int128 v30 = 0u;
      __int128 v31 = 0u;
      __int128 v28 = 0u;
      __int128 v29 = 0u;
      id v19 = v19;
      id v20 = [v19 countByEnumeratingWithState:&v28 objects:v40 count:16];
      if (v20)
      {
        id v21 = v20;
        uint64_t v22 = *(void *)v29;
        do
        {
          for (j = 0LL; j != v21; j = (char *)j + 1)
          {
            if (*(void *)v29 != v22) {
              objc_enumerationMutation(v19);
            }
            [*(id *)(*((void *)&v28 + 1) + 8 * (void)j) nowPlayingDataSourceNowPlayingAudioFormatContentInfosDidChange:self];
          }

          id v21 = [v19 countByEnumeratingWithState:&v28 objects:v40 count:16];
        }

        while (v21);
      }
    }

    id v3 = v27;
  }

  else
  {
    uint64_t v24 = _MRLogForCategory(0LL, v6);
    id v19 = (id)objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled((os_log_t)v19, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v25 = objc_opt_class(self);
      v26 = self->_cachedAudioFormatContentInfos;
      *(_DWORD *)buf = 138543618;
      uint64_t v37 = v25;
      __int16 v38 = 2114;
      v39 = v26;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v19,  OS_LOG_TYPE_DEFAULT,  "%{public}@ skipping update with no now playing applications | cached audio format content info: %{public}@",  buf,  0x16u);
    }
  }
}

- (id)audioFormatContentInfoForApplication:(id)a3 cachedAudioFormatContentInfo:(id)a4
{
  id v6 = a3;
  id v68 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 audioSessionID]);

  if (!v7)
  {
    __int128 v17 = 0LL;
    goto LABEL_32;
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 audioSessionID]);
  id v9 = [v8 unsignedIntValue];

  id v10 = sub_10013D200((int)[v6 pid]);
  __int128 v66 = (void *)objc_claimAutoreleasedReturnValue(v10);
  id v11 = self;
  objc_sync_enter(v11);
  cachedAudioSessions = v11->_cachedAudioSessions;
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v9));
  id v14 = (id)objc_claimAutoreleasedReturnValue(-[MSVLRUDictionary objectForKeyedSubscript:](cachedAudioSessions, "objectForKeyedSubscript:", v13));

  if (!v14)
  {
    __int128 v15 = (void *)objc_claimAutoreleasedReturnValue(+[RBSProcessHandle currentProcess](&OBJC_CLASS___RBSProcessHandle, "currentProcess"));
    __int128 v16 = v15;
    if (v15) {
      [v15 auditToken];
    }
    else {
      memset(v70, 0, 32);
    }

    id v18 = objc_alloc((Class)off_1003F7948[0]());
    *(_OWORD *)buf = *(_OWORD *)v70;
    *(_OWORD *)&buf[16] = *(_OWORD *)&v70[16];
    id v14 = [v18 initSiblingSession:v9 auditToken:buf clientIdentifier:@"MediaRemote" autoReconnect:0];
    uint64_t v20 = _MRLogForCategory(0LL, v19);
    id v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v22 = objc_opt_class(v11);
      *(_DWORD *)buf = 138543874;
      *(void *)&uint8_t buf[4] = v22;
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = (_DWORD)v9;
      *(_WORD *)&buf[18] = 2114;
      *(void *)&buf[20] = v14;
      _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "%{public}@ getting sibling audio session for: %u | session: %{public}@",  buf,  0x1Cu);
    }

    -[MRDMediaServerNowPlayingDataSource addCachedAudioSession:forID:](v11, "addCachedAudioSession:forID:", v14, v9);
    if (!v14)
    {
      id v23 = [(Class)off_1003F7948[0]() retrieveSessionWithID:v9];
      uint64_t v24 = objc_claimAutoreleasedReturnValue(v23);
      uint64_t v26 = _MRLogForCategory(0LL, v25);
      id v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v28 = objc_opt_class(v11);
        *(_DWORD *)__int128 v70 = 138543874;
        *(void *)&v70[4] = v28;
        *(_WORD *)&v70[12] = 1024;
        *(_DWORD *)&v70[14] = (_DWORD)v9;
        *(_WORD *)&v70[18] = 2114;
        *(void *)&v70[20] = v24;
        _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_DEFAULT,  "%{public}@ falling back to retrieve audio session for: %u | session: %{public}@",  v70,  0x1Cu);
      }

      id v14 = (id)v24;
      -[MRDMediaServerNowPlayingDataSource addCachedAudioSession:forID:](v11, "addCachedAudioSession:forID:", v24, v9);
    }
  }

  __int128 v65 = v14;
  objc_sync_exit(v11);

  __int128 v67 = (void *)objc_claimAutoreleasedReturnValue([v14 consolidatedSourceContentInfo]);
  uint64_t v30 = _MRLogForCategory(0LL, v29);
  __int128 v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v32 = objc_opt_class(v11);
    unsigned int v33 = [v6 pid];
    __int128 v34 = (void *)objc_claimAutoreleasedReturnValue([v6 audioSessionID]);
    *(_DWORD *)__int128 v70 = 138544386;
    *(void *)&v70[4] = v32;
    *(_WORD *)&v70[12] = 1024;
    *(_DWORD *)&v70[14] = v33;
    *(_WORD *)&v70[18] = 2114;
    *(void *)&v70[20] = v66;
    *(_WORD *)&v70[28] = 2114;
    *(void *)&v70[30] = v34;
    __int16 v71 = 2114;
    __int128 v72 = v67;
    _os_log_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_DEFAULT,  "%{public}@ pid: %i | bundle id: %{public}@ | session id: %{public}@ | consolidated info: %{public}@",  v70,  0x30u);
  }

  __int128 v35 = (void *)objc_claimAutoreleasedReturnValue( -[MRDMediaServerNowPlayingDataSource contentInfoForConsolidatedSourceContentInfo:]( v11,  "contentInfoForConsolidatedSourceContentInfo:",  v67));
  __int128 v69 = (void *)objc_claimAutoreleasedReturnValue( -[MRDMediaServerNowPlayingDataSource bestAvailableContentForConsolidatedSourceContentInfo:]( v11,  "bestAvailableContentForConsolidatedSourceContentInfo:",  v67));
  uint64_t v36 = off_1003F7950[0]();
  uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue(v36);
  __int16 v38 = (void *)objc_claimAutoreleasedReturnValue([v35 objectForKeyedSubscript:v37]);

  uint64_t v39 = off_1003F7958[0]();
  v40 = (void *)objc_claimAutoreleasedReturnValue(v39);
  id v41 = (void *)objc_claimAutoreleasedReturnValue([v35 objectForKeyedSubscript:v40]);

  uint64_t v42 = off_1003F7960[0]();
  v43 = (void *)objc_claimAutoreleasedReturnValue(v42);
  v44 = (void *)objc_claimAutoreleasedReturnValue([v35 objectForKeyedSubscript:v43]);

  uint64_t v45 = off_1003F7968[0]();
  uint64_t v46 = (void *)objc_claimAutoreleasedReturnValue(v45);
  v47 = (void *)objc_claimAutoreleasedReturnValue([v35 objectForKeyedSubscript:v46]);

  id v64 = [v65 renderingMode];
  uint64_t v49 = _MRLogForCategory(0LL, v48);
  uint64_t v50 = (os_log_s *)objc_claimAutoreleasedReturnValue(v49);
  if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v51 = objc_opt_class(v11);
    v52 = (void *)objc_claimAutoreleasedReturnValue([v6 audioSessionID]);
    unsigned int v53 = [v6 pid];
    *(_DWORD *)__int128 v70 = 138545666;
    *(void *)&v70[4] = v51;
    *(_WORD *)&v70[12] = 2114;
    *(void *)&v70[14] = v52;
    *(_WORD *)&v70[22] = 1024;
    *(_DWORD *)&v70[24] = v53;
    *(_WORD *)&v70[28] = 2114;
    *(void *)&v70[30] = v66;
    __int16 v71 = 2114;
    __int128 v72 = v38;
    __int16 v73 = 2114;
    __int128 v74 = v41;
    __int16 v75 = 2114;
    __int128 v76 = v69;
    __int16 v77 = 2114;
    __int128 v78 = v44;
    __int16 v79 = 2114;
    __int128 v80 = v47;
    __int16 v81 = 2048;
    id v82 = v64;
    _os_log_impl( (void *)&_mh_execute_header,  v50,  OS_LOG_TYPE_DEFAULT,  "%{public}@ selected audio format info | session id: %{public}@ | pid: %i | bundle id: %{public}@ | audio format: % {public}@ | channel #: %{public}@ | available: %{public}@ | eligible: %{public}@ | active: %{public}@ | rendering mode: %ld",  v70,  0x62u);
  }

  if (v38)
  {
    if (v41) {
      goto LABEL_22;
    }
  }

  else
  {
    __int16 v38 = (void *)objc_claimAutoreleasedReturnValue([v68 audioFormat]);
    if (v41) {
      goto LABEL_22;
    }
  }

  id v41 = (void *)objc_claimAutoreleasedReturnValue([v68 channelCount]);
LABEL_22:
  if (!v69) {
    __int128 v69 = (void *)objc_claimAutoreleasedReturnValue([v68 bestAvailableContent]);
  }
  if (v44)
  {
    if (!v47) {
      goto LABEL_28;
    }
  }

  else
  {
    v44 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v68 isEligibleForSpatialization]));
    if (!v47) {
LABEL_28:
    }
      v47 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v68 isSpatialized]));
  }

  v54 = objc_alloc(&OBJC_CLASS___MRNowPlayingAudioFormatContentInfo);
  id v55 = [v6 pid];
  uint64_t v56 = (void *)objc_claimAutoreleasedReturnValue([v6 audioSessionID]);
  __int128 v17 = -[MRNowPlayingAudioFormatContentInfo initWithPid:bundleID:audioSessionID:audioFormat:channelCount:bestAvailableContent:isEligibleForSpatialization:isSpatialized:]( v54,  "initWithPid:bundleID:audioSessionID:audioFormat:channelCount:bestAvailableContent:isEligibleForSpatialization:isSpatialized:",  v55,  v66,  v56,  v38,  v41,  v69,  v44,  v47);

  -[MRNowPlayingAudioFormatContentInfo setRenderingMode:](v17, "setRenderingMode:", v64);
  uint64_t v58 = _MRLogForCategory(0LL, v57);
  id v59 = (os_log_s *)objc_claimAutoreleasedReturnValue(v58);
  if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v60 = objc_opt_class(v11);
    v61 = (void *)objc_claimAutoreleasedReturnValue([v6 audioSessionID]);
    unsigned int v62 = [v6 pid];
    *(_DWORD *)__int128 v70 = 138545410;
    *(void *)&v70[4] = v60;
    *(_WORD *)&v70[12] = 2114;
    *(void *)&v70[14] = v61;
    *(_WORD *)&v70[22] = 1024;
    *(_DWORD *)&v70[24] = v62;
    *(_WORD *)&v70[28] = 2114;
    *(void *)&v70[30] = v66;
    __int16 v71 = 2114;
    __int128 v72 = v38;
    __int16 v73 = 2114;
    __int128 v74 = v41;
    __int16 v75 = 2114;
    __int128 v76 = v69;
    __int16 v77 = 2114;
    __int128 v78 = v44;
    __int16 v79 = 2114;
    __int128 v80 = v47;
    _os_log_impl( (void *)&_mh_execute_header,  v59,  OS_LOG_TYPE_DEFAULT,  "%{public}@ cached selected audio format info | session id: %{public}@ | pid: %i | bundle id: %{public}@ | audio fo rmat: %{public}@ | channel #: %{public}@ | available: %{public}@ | eligible: %{public}@ | active: %{public}@",  v70,  0x58u);
  }

LABEL_32:
  return v17;
}

- (id)contentInfoForConsolidatedSourceContentInfo:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 firstObject]);
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  id obj = v3;
  id v5 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v5)
  {
    id v6 = v5;
    unsigned int v7 = 0;
    unsigned int v8 = 0;
    uint64_t v23 = *(void *)v25;
    do
    {
      id v9 = 0LL;
      do
      {
        if (*(void *)v25 != v23) {
          objc_enumerationMutation(obj);
        }
        id v10 = *(void **)(*((void *)&v24 + 1) + 8LL * (void)v9);
        uint64_t v11 = off_1003F7958[0]();
        id v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
        uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:v12]);
        unsigned int v14 = [v13 unsignedIntValue];

        uint64_t v15 = off_1003F7960[0]();
        __int128 v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
        __int128 v17 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:v16]);
        unsigned int v18 = [v17 BOOLValue];

        if (v14 > v8 || ((v18 & ~v7) == 1 ? (BOOL v19 = v14 == v8) : (BOOL v19 = 0), v19))
        {
          id v20 = v10;

          unsigned int v7 = v18;
          unsigned int v8 = v14;
          id v4 = v20;
        }

        id v9 = (char *)v9 + 1;
      }

      while (v6 != v9);
      id v6 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
    }

    while (v6);
  }

  return v4;
}

- (id)bestAvailableContentForConsolidatedSourceContentInfo:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableSet setWithCapacity:]( NSMutableSet,  "setWithCapacity:",  [v3 count]));
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v20;
    do
    {
      id v9 = 0LL;
      do
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v19 + 1) + 8LL * (void)v9);
        uint64_t v11 = off_1003F7970[0]();
        id v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
        uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", v12, (void)v19));

        if (v13) {
          [v4 addObject:v13];
        }

        id v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }

    while (v7);
  }

  id v14 = kMXSession_SourceFormatInfoKey_BestAvailableContentType_Atmos;
  id v15 = kMXSession_SourceFormatInfoKey_BestAvailableContentType_Multichannel;
  if ([v4 containsObject:v14])
  {
    id v16 = v14;
  }

  else if ([v4 containsObject:v15])
  {
    id v16 = v15;
  }

  else
  {
    id v16 = (id)objc_claimAutoreleasedReturnValue([v4 anyObject]);
  }

  __int128 v17 = v16;

  return v17;
}

- (void)addCachedAudioSession:(id)a3 forID:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  cachedAudioSessions = self->_cachedAudioSessions;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v4));
  -[MSVLRUDictionary setObject:forKeyedSubscript:](cachedAudioSessions, "setObject:forKeyedSubscript:", v6, v8);

  uint64_t v9 = off_1003F7978[0]();
  uint64_t v10 = objc_claimAutoreleasedReturnValue(v9);
  id v12 = (void *)v10;
  id v13 = 0LL;
  if (v6 && v10)
  {
    uint64_t v24 = v10;
    id v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v24, 1LL));
    id v19 = 0LL;
    [v6 subscribeToNotifications:v14 error:&v19];
    id v13 = v19;

    id v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v15 addObserver:self selector:"_renderingModeChangeNotification:" name:v12 object:v6];
  }

  uint64_t v16 = _MRLogForCategory(0LL, v11);
  __int128 v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    id v18 = -[MSVLRUDictionary count](self->_cachedAudioSessions, "count");
    *(_DWORD *)buf = 138412546;
    id v21 = v6;
    __int16 v22 = 2048;
    id v23 = v18;
    _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "[MediaServerNowPlayingDataSource] Adding new audioSession %@ for a total of %ld",  buf,  0x16u);
  }
}

- (id)description
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue( -[MRDMediaServerNowPlayingDataSource _createMediaServerController]( self,  "_createMediaServerController"));
  uint64_t v4 = self;
  objc_sync_enter(v4);
  id v5 = (objc_class *)objc_opt_class(v4);
  id v6 = NSStringFromClass(v5);
  __int128 v31 = (void *)objc_claimAutoreleasedReturnValue(v6);
  uint64_t cachedNowPlayingAppPID = v4->_cachedNowPlayingAppPID;
  mediaServerController = v4->_mediaServerController;
  unsigned int v33 = (void *)objc_claimAutoreleasedReturnValue([v3 attributeForKey:AVSystemController_NowPlayingAppPIDAttribute]);
  id v25 = [v33 intValue];
  cachedNowPlayingAppDisplayID = v4->_cachedNowPlayingAppDisplayID;
  uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue([v3 attributeForKey:AVSystemController_NowPlayingAppDisplayIDAttribute]);
  if (v4->_cachedNowPlayingAppIsPlaying) {
    id v7 = @"true";
  }
  else {
    id v7 = @"false";
  }
  id v23 = v7;
  uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue([v3 attributeForKey:AVSystemController_NowPlayingAppIsPlayingAttribute]);
  else {
    uint64_t v8 = @"false";
  }
  __int16 v22 = v8;
  uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary allValues](v4->_cachedNowPlayingApplications, "allValues"));
  uint64_t v9 = MRCreateIndentedDebugDescriptionFromArray(v30);
  uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue(v9);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v3 attributeForKey:AVSystemController_PlayingSessionsDescriptionAttribute]);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary allValues](v4->_cachedNowPlayingSessions, "allValues"));
  uint64_t v12 = MRCreateIndentedDebugDescriptionFromArray(v11);
  id v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  id v14 = (void *)objc_claimAutoreleasedReturnValue([v3 attributeForKey:AVSystemController_NowPlayingInfoAttribute]);
  id v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary allValues](v4->_cachedAudioFormatContentInfos, "allValues"));
  uint64_t v16 = MRCreateIndentedDebugDescriptionFromArray(v15);
  __int128 v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
  id v18 = -[MSVLRUDictionary count](v4->_cachedAudioSessions, "count");
  id v19 = (void *)objc_claimAutoreleasedReturnValue([v3 topOfNowPlayingAppStack]);
  __int128 v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ %p {\n  %@ vs %@\n  cachedPID %d vs coreMedia %d\n  cachedDisplayID %@ vs CoreMedia %@\n  cachedIsPlaying %@ vs CoreMedia %@\n  cachedApplications %@ vs CoreMedia %@\n  cachedSessions %@ vs CoreMedia %@\n  cachedAudioFormatContentInfo = %@\n  audioSessions = %ld\n  topOfNowPlayingAppStack = %@\n}",  v31,  v4,  mediaServerController,  v3,  cachedNowPlayingAppPID,  v25,  cachedNowPlayingAppDisplayID,  v29,  v23,  v22,  v28,  v10,  v13,  v14,  v17,  v18,  v19));

  objc_sync_exit(v4);
  return v20;
}

- (void).cxx_destruct
{
}

@end
@interface BTAVRCP_NowPlayingInfo
- ($2825F4736939C4A6D3AD43837233062D)currentSettings;
- (BOOL)isBrowsablePlayer;
- (BOOL)isLocalOrigin;
- (BOOL)isMusicApp;
- (BOOL)mrAppIsPlaying;
- (BTAVRCP_NowPlayingInfo)init;
- (BTAVRCP_NowPlayingInfoDelegate)delegate;
- (NSDictionary)mrInfo;
- (NSSet)browsablePlayers;
- (NSString)currentArtworkIdentifier;
- (NSString)mrAppIdentifier;
- (float)_defaultPlaybackRate;
- (float)_playbackRate;
- (id)encodings;
- (id)heights;
- (id)playerName;
- (id)trackAlbum;
- (id)trackArtist;
- (id)trackDuration;
- (id)trackGenre;
- (id)trackImageHandle;
- (id)trackPosition;
- (id)trackQueueCount;
- (id)trackQueueIndex;
- (id)trackTitle;
- (id)widths;
- (int)playerId;
- (int64_t)currentPlaybackState;
- (int64_t)playbackState;
- (unint64_t)_getEncodingForMimeType:(id)a3;
- (unint64_t)_trackHash;
- (unint64_t)currentTrackHash;
- (unint64_t)trackId;
- (void)_activeOriginDidChange:(void *)a3;
- (void)_activeOriginDidChangeNotification;
- (void)_appDidChange:(id)a3;
- (void)_appDidChangeNotification:(id)a3;
- (void)_appIsPlayingDidChange:(BOOL)a3;
- (void)_appIsPlayingDidChangeNotification:(id)a3;
- (void)_infoDidChange:(id)a3;
- (void)_infoDidChangeNotification;
- (void)_initializeState;
- (void)_playbackQueueDidChange;
- (void)_playbackQueueDidChangeNotification;
- (void)_playbackStateDidChange;
- (void)_refreshActiveOrigin;
- (void)_refreshApp;
- (void)_refreshAppIsPlaying;
- (void)_refreshInfo;
- (void)_refreshSupportedCommands;
- (void)_settingsDidChange:(id)a3;
- (void)_supportedCommandsDidChange:(id)a3;
- (void)_supportedCommandsDidChangeNotification;
- (void)_trackDidChange;
- (void)dealloc;
- (void)mrActiveOrigin;
- (void)setCurrentArtworkIdentifier:(id)a3;
- (void)setCurrentPlaybackState:(int64_t)a3;
- (void)setCurrentSettings:(id)a3;
- (void)setCurrentTrackHash:(unint64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setMrActiveOrigin:(void *)a3;
- (void)setMrAppIdentifier:(id)a3;
- (void)setMrAppIsPlaying:(BOOL)a3;
- (void)setMrInfo:(id)a3;
@end

@implementation BTAVRCP_NowPlayingInfo

- (BTAVRCP_NowPlayingInfo)init
{
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___BTAVRCP_NowPlayingInfo;
  v2 = -[BTAVRCP_NowPlayingInfo init](&v14, "init");
  if (v2)
  {
    v3 = objc_alloc(&OBJC_CLASS___NSSet);
    v15[0] = off_10001F048;
    v15[1] = off_10001F050;
    v15[2] = off_10001F058;
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v15, 3LL));
    v5 = -[NSSet initWithArray:](v3, "initWithArray:", v4);
    v6 = (void *)*((void *)v2 + 3);
    *((void *)v2 + 3) = v5;

    objc_storeStrong((id *)v2 + 5, off_10001F048);
    v2[8] = 0;
    *(_OWORD *)(v2 + 56) = xmmword_1000141F0;
    *((void *)v2 + 9) = 0x100000001LL;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v7 addObserver:v2 selector:"_infoDidChangeNotification" name:kMRMediaRemoteNowPlayingInfoDidChangeNotification object:0];

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v8 addObserver:v2 selector:"_appDidChangeNotification:" name:kMRMediaRemoteNowPlayingApplicationDidChangeNotification object:0];

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v9 addObserver:v2 selector:"_appIsPlayingDidChangeNotification:" name:kMRMediaRemoteNowPlayingApplicationIsPlayingDidChangeNotification object:0];

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v10 addObserver:v2 selector:"_playbackQueueDidChangeNotification" name:MPMusicPlayerControllerQueueDidChangeNotification object:0];

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v11 addObserver:v2 selector:"_activeOriginDidChangeNotification" name:kMRMediaRemoteActiveOriginDidChangeNotification object:0];

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v12 addObserver:v2 selector:"_supportedCommandsDidChangeNotification" name:kMRMediaRemoteSupportedCommandsDidChangeNotification object:0];

    MRMediaRemoteRegisterForNowPlayingNotifications(&_dispatch_main_q);
    MRMediaRemoteSetWantsOriginChangeNotifications(1LL);
    MRMediaRemoteSetWantsSupportedCommandsChangedNotifications(1LL);
    [v2 _initializeState];
  }

  return (BTAVRCP_NowPlayingInfo *)v2;
}

- (void)_initializeState
{
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(2LL, 0LL);
  v4 = (void *)objc_claimAutoreleasedReturnValue(global_queue);
  v5 = objc_alloc_init(&OBJC_CLASS___BTAVRCP_Syncifier);
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472LL;
  v24[2] = sub_10000D950;
  v24[3] = &unk_100018BA8;
  id v6 = (id)objc_claimAutoreleasedReturnValue(-[BTAVRCP_Syncifier createSwitcher](v5, "createSwitcher"));
  v24[4] = self;
  id v25 = v6;
  MRMediaRemoteGetNowPlayingInfoWithOptionalArtwork(0LL, 0LL, v4, v24);
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472LL;
  v22[2] = sub_10000D9E4;
  v22[3] = &unk_100018BD0;
  id v7 = (id)objc_claimAutoreleasedReturnValue(-[BTAVRCP_Syncifier createSwitcher](v5, "createSwitcher"));
  v22[4] = self;
  id v23 = v7;
  MRMediaRemoteGetNowPlayingApplicationDisplayID(v4, v22);
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472LL;
  v20[2] = sub_10000DA78;
  v20[3] = &unk_100018C20;
  id v8 = (id)objc_claimAutoreleasedReturnValue(-[BTAVRCP_Syncifier createSwitcher](v5, "createSwitcher"));
  v20[4] = self;
  id v21 = v8;
  MRMediaRemoteGetNowPlayingApplicationIsPlaying(v4, v20);
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_10000DB1C;
  v18[3] = &unk_100018C70;
  id v9 = (id)objc_claimAutoreleasedReturnValue(-[BTAVRCP_Syncifier createSwitcher](v5, "createSwitcher"));
  v18[4] = self;
  id v19 = v9;
  MRMediaRemoteGetActiveOrigin(v4, v18);
  v12 = _NSConcreteStackBlock;
  uint64_t v13 = 3221225472LL;
  objc_super v14 = sub_10000DBC0;
  v15 = &unk_100018C98;
  id v10 = (id)objc_claimAutoreleasedReturnValue(-[BTAVRCP_Syncifier createSwitcher](v5, "createSwitcher"));
  v16 = self;
  id v17 = v10;
  MRMediaRemoteCopySupportedCommands(v4, &v12);
  if (!-[BTAVRCP_Syncifier wait:](v5, "wait:", 3.0, v12, v13, v14, v15))
  {
    v11 = (os_log_s *)qword_10001F1C0;
    if (os_log_type_enabled((os_log_t)qword_10001F1C0, OS_LOG_TYPE_ERROR)) {
      sub_10001014C(v11);
    }
  }
}

- (void)dealloc
{
  v3 = (os_log_s *)qword_10001F1C0;
  if (os_log_type_enabled((os_log_t)qword_10001F1C0, OS_LOG_TYPE_DEBUG)) {
    sub_100010188(v3, v4, v5, v6, v7, v8, v9, v10);
  }
  MRMediaRemoteUnregisterForNowPlayingNotifications();
  MRMediaRemoteSetWantsOriginChangeNotifications(0LL);
  MRMediaRemoteSetWantsSupportedCommandsChangedNotifications(0LL);
  if (-[BTAVRCP_NowPlayingInfo mrActiveOrigin](self, "mrActiveOrigin")) {
    CFRelease(-[BTAVRCP_NowPlayingInfo mrActiveOrigin](self, "mrActiveOrigin"));
  }
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___BTAVRCP_NowPlayingInfo;
  -[BTAVRCP_NowPlayingInfo dealloc](&v11, "dealloc");
}

- (void)_refreshInfo
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472LL;
  v2[2] = sub_10000DD68;
  v2[3] = &unk_100018CC0;
  v2[4] = self;
  MRMediaRemoteGetNowPlayingInfoWithOptionalArtwork(0LL, 0LL, &_dispatch_main_q, v2);
}

- (void)_refreshApp
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472LL;
  v2[2] = sub_10000DDCC;
  v2[3] = &unk_100018CE8;
  v2[4] = self;
  MRMediaRemoteGetNowPlayingApplicationDisplayID(&_dispatch_main_q, v2);
}

- (void)_refreshAppIsPlaying
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472LL;
  v2[2] = sub_10000DE30;
  v2[3] = &unk_100018D10;
  v2[4] = self;
  MRMediaRemoteGetNowPlayingApplicationIsPlaying(&_dispatch_main_q, v2);
}

- (void)_refreshActiveOrigin
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472LL;
  v2[2] = sub_10000DE98;
  v2[3] = &unk_100018D38;
  v2[4] = self;
  MRMediaRemoteGetActiveOrigin(&_dispatch_main_q, v2);
}

- (void)_refreshSupportedCommands
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472LL;
  v2[2] = sub_10000DF00;
  v2[3] = &unk_100018D60;
  v2[4] = self;
  MRMediaRemoteCopySupportedCommands(&_dispatch_main_q, v2);
}

- (unint64_t)_getEncodingForMimeType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"image/jpeg"])
  {
    unint64_t v4 = 1LL;
  }

  else if ([v3 isEqualToString:@"image/png"])
  {
    unint64_t v4 = 2LL;
  }

  else
  {
    unint64_t v4 = 0LL;
  }

  return v4;
}

- (void)_infoDidChangeNotification
{
}

- (void)_appDidChangeNotification:(id)a3
{
}

- (void)_appIsPlayingDidChangeNotification:(id)a3
{
  unint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([a3 userInfo]);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:kMRMediaRemoteNowPlayingApplicationIsPlayingUserInfoKey]);
  id v6 = [v5 BOOLValue];

  -[BTAVRCP_NowPlayingInfo _appIsPlayingDidChange:](self, "_appIsPlayingDidChange:", v6);
}

- (void)_playbackQueueDidChangeNotification
{
}

- (void)_activeOriginDidChangeNotification
{
}

- (void)_supportedCommandsDidChangeNotification
{
}

- (void)_infoDidChange:(id)a3
{
  id v4 = a3;
  if (os_log_type_enabled((os_log_t)qword_10001F1C0, OS_LOG_TYPE_DEBUG)) {
    sub_1000101B8();
  }
  -[BTAVRCP_NowPlayingInfo setMrInfo:](self, "setMrInfo:", v4);
  -[BTAVRCP_NowPlayingInfo _playbackStateDidChange](self, "_playbackStateDidChange");
  -[BTAVRCP_NowPlayingInfo _trackDidChange](self, "_trackDidChange");
}

- (void)_appDidChange:(id)a3
{
  id v4 = (__CFString *)a3;
  uint64_t v5 = v4;
  id v6 = off_10001F048;
  if (v4) {
    id v6 = v4;
  }
  uint64_t v7 = v6;
  if (os_log_type_enabled((os_log_t)qword_10001F1C0, OS_LOG_TYPE_DEBUG)) {
    sub_100010218();
  }
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[BTAVRCP_NowPlayingInfo mrAppIdentifier](self, "mrAppIdentifier"));
  unsigned __int8 v9 = -[__CFString isEqualToString:](v7, "isEqualToString:", v8);

  if ((v9 & 1) == 0)
  {
    -[BTAVRCP_NowPlayingInfo setMrAppIdentifier:](self, "setMrAppIdentifier:", v7);
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[BTAVRCP_NowPlayingInfo delegate](self, "delegate"));
    objc_msgSend(v10, "playerDidChange:", -[BTAVRCP_NowPlayingInfo playerId](self, "playerId"));
  }
}

- (void)_appIsPlayingDidChange:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = (os_log_s *)qword_10001F1C0;
  if (os_log_type_enabled((os_log_t)qword_10001F1C0, OS_LOG_TYPE_DEBUG)) {
    sub_100010278(v3, v5, v6, v7, v8, v9, v10, v11);
  }
  -[BTAVRCP_NowPlayingInfo setMrAppIsPlaying:](self, "setMrAppIsPlaying:", v3);
  -[BTAVRCP_NowPlayingInfo _playbackStateDidChange](self, "_playbackStateDidChange");
  -[BTAVRCP_NowPlayingInfo _trackDidChange](self, "_trackDidChange");
}

- (void)_playbackQueueDidChange
{
  BOOL v3 = (os_log_s *)qword_10001F1C0;
  if (os_log_type_enabled((os_log_t)qword_10001F1C0, OS_LOG_TYPE_DEBUG)) {
    sub_1000102F4(v3, v4, v5, v6, v7, v8, v9, v10);
  }
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[BTAVRCP_NowPlayingInfo delegate](self, "delegate"));
  [v11 playbackQueueDidChange];
}

- (void)_activeOriginDidChange:(void *)a3
{
  uint64_t v5 = (void *)qword_10001F1C0;
  if (os_log_type_enabled((os_log_t)qword_10001F1C0, OS_LOG_TYPE_DEBUG)) {
    sub_100010324(v5, a3);
  }
  if (-[BTAVRCP_NowPlayingInfo mrActiveOrigin](self, "mrActiveOrigin") != a3)
  {
    if (-[BTAVRCP_NowPlayingInfo mrActiveOrigin](self, "mrActiveOrigin")) {
      CFRelease(-[BTAVRCP_NowPlayingInfo mrActiveOrigin](self, "mrActiveOrigin"));
    }
    -[BTAVRCP_NowPlayingInfo setMrActiveOrigin:](self, "setMrActiveOrigin:", a3);
    if (-[BTAVRCP_NowPlayingInfo mrActiveOrigin](self, "mrActiveOrigin")) {
      CFRetain(-[BTAVRCP_NowPlayingInfo mrActiveOrigin](self, "mrActiveOrigin"));
    }
  }

- (void)_supportedCommandsDidChange:(id)a3
{
  id v4 = a3;
  if (os_log_type_enabled((os_log_t)qword_10001F1C0, OS_LOG_TYPE_DEBUG)) {
    sub_1000103C0();
  }
  if ([v4 count])
  {
    unint64_t v5 = 0LL;
    uint64_t v6 = kMRMediaRemoteCommandInfoShuffleMode;
    uint64_t v7 = kMRMediaRemoteCommandInfoRepeatMode;
    unsigned int v8 = 1;
    uint64_t IntegerValueForKey = 1LL;
    do
    {
      id v10 = [v4 objectAtIndex:v5];
      int Command = MRMediaRemoteCommandInfoGetCommand();
      if (Command == 26)
      {
        uint64_t IntegerValueForKey = MRMediaRemoteCommandInfoGetIntegerValueForKey(v10, v6);
      }

      else if (Command == 25)
      {
        unsigned int v8 = MRMediaRemoteCommandInfoGetIntegerValueForKey(v10, v7);
      }

      ++v5;
    }

    while (v5 < (unint64_t)[v4 count]);
  }

  else
  {
    uint64_t IntegerValueForKey = 1LL;
    unsigned int v8 = 1;
  }

  -[BTAVRCP_NowPlayingInfo _settingsDidChange:]( self,  "_settingsDidChange:",  v8 | (unint64_t)(IntegerValueForKey << 32));
}

- (id)trackTitle
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BTAVRCP_NowPlayingInfo mrInfo](self, "mrInfo"));
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKeyedSubscript:kMRMediaRemoteNowPlayingInfoTitle]);

  return v3;
}

- (id)trackAlbum
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[BTAVRCP_NowPlayingInfo mrInfo](self, "mrInfo"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:kMRMediaRemoteNowPlayingInfoAlbum]);

  if (!v4)
  {
    unint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[BTAVRCP_NowPlayingInfo mrInfo](self, "mrInfo"));
    id v4 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:kMRMediaRemoteNowPlayingInfoRadioStationName]);
  }

  return v4;
}

- (id)trackArtist
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BTAVRCP_NowPlayingInfo mrInfo](self, "mrInfo"));
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKeyedSubscript:kMRMediaRemoteNowPlayingInfoArtist]);

  return v3;
}

- (id)trackGenre
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BTAVRCP_NowPlayingInfo mrInfo](self, "mrInfo"));
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKeyedSubscript:kMRMediaRemoteNowPlayingInfoGenre]);

  return v3;
}

- (id)trackQueueIndex
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[BTAVRCP_NowPlayingInfo mrInfo](self, "mrInfo"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:kMRMediaRemoteNowPlayingInfoQueueIndex]);

  if (v4)
  {
    unint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( NSNumber,  "numberWithUnsignedInt:",  [v4 unsignedIntValue] + 1));
  }

  else
  {
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[BTAVRCP_NowPlayingInfo mrInfo](self, "mrInfo"));
    unint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:kMRMediaRemoteNowPlayingInfoTrackNumber]);
  }

  return v5;
}

- (id)trackQueueCount
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[BTAVRCP_NowPlayingInfo mrInfo](self, "mrInfo"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:kMRMediaRemoteNowPlayingInfoQueueIndex]);

  unint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[BTAVRCP_NowPlayingInfo mrInfo](self, "mrInfo"));
  uint64_t v6 = v5;
  uint64_t v7 = &kMRMediaRemoteNowPlayingInfoTotalTrackCount;
  if (v4) {
    uint64_t v7 = &kMRMediaRemoteNowPlayingInfoTotalQueueCount;
  }
  unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:*v7]);

  return v8;
}

- (id)trackDuration
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BTAVRCP_NowPlayingInfo mrInfo](self, "mrInfo"));
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKeyedSubscript:kMRMediaRemoteNowPlayingInfoDuration]);

  if (v3)
  {
    [v3 doubleValue];
    unint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v4 * 1000.0));
  }

  else
  {
    unint64_t v5 = 0LL;
  }

  return v5;
}

- (id)trackPosition
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[BTAVRCP_NowPlayingInfo mrInfo](self, "mrInfo"));
  double v4 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:kMRMediaRemoteNowPlayingInfoTimestamp]);

  if (v4)
  {
    unint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[BTAVRCP_NowPlayingInfo mrInfo](self, "mrInfo"));
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:kMRMediaRemoteNowPlayingInfoElapsedTime]);

    if (v6)
    {
      [v6 doubleValue];
      double v8 = v7 * 1000.0 + 0.0;
    }

    else
    {
      double v8 = 0.0;
    }

    -[BTAVRCP_NowPlayingInfo _playbackRate](self, "_playbackRate");
    if (v10 != 0.0)
    {
      float v11 = v10;
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
      [v12 timeIntervalSinceDate:v4];
      double v14 = v13;

      double v8 = v8 + v14 * v11 * 1000.0;
    }

    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v8));
  }

  else
  {
    uint64_t v9 = 0LL;
  }

  return v9;
}

- (id)trackImageHandle
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[BTAVRCP_NowPlayingInfo mrInfo](self, "mrInfo"));
  double v4 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:kMRMediaRemoteNowPlayingInfoArtworkIdentifier]);

  if (v4)
  {
    currentArtworkIdentifier = self->_currentArtworkIdentifier;
    p_currentArtworkIdentifier = &self->_currentArtworkIdentifier;
    if (([v4 isEqualToString:currentArtworkIdentifier] & 1) == 0)
    {
      ++qword_10001F180;
      objc_storeStrong((id *)p_currentArtworkIdentifier, v4);
    }

    double v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%tu",  qword_10001F180));
  }

  else
  {
    double v8 = (os_log_s *)qword_10001F1C0;
    if (os_log_type_enabled((os_log_t)qword_10001F1C0, OS_LOG_TYPE_ERROR)) {
      sub_100010420((uint64_t)self, v8);
    }
    double v7 = 0LL;
  }

  return v7;
}

- (BOOL)isBrowsablePlayer
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[BTAVRCP_NowPlayingInfo browsablePlayers](self, "browsablePlayers"));
  double v4 = (void *)objc_claimAutoreleasedReturnValue(-[BTAVRCP_NowPlayingInfo mrAppIdentifier](self, "mrAppIdentifier"));
  unsigned __int8 v5 = [v3 containsObject:v4];

  return v5;
}

- (int)playerId
{
  if (-[BTAVRCP_NowPlayingInfo isBrowsablePlayer](self, "isBrowsablePlayer")) {
    return 1;
  }
  else {
    return 2;
  }
}

- (id)playerName
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BTAVRCP_NowPlayingInfo mrAppIdentifier](self, "mrAppIdentifier"));
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue( +[LSApplicationProxy applicationProxyForIdentifier:]( &OBJC_CLASS___LSApplicationProxy,  "applicationProxyForIdentifier:",  v2));

  double v4 = (void *)objc_claimAutoreleasedReturnValue([v3 localizedName]);
  if (v4)
  {
    unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue([v3 localizedName]);
  }

  else
  {
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mobileBluetoothBundle](&OBJC_CLASS___NSBundle, "mobileBluetoothBundle"));
    unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue( [v6 localizedStringForKey:@"UNKNOWN_MEDIA_PLAYER" value:@"Unknown Media Player" table:0]);
  }

  return v5;
}

- (float)_playbackRate
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[BTAVRCP_NowPlayingInfo mrInfo](self, "mrInfo"));
  double v4 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:kMRMediaRemoteNowPlayingInfoPlaybackRate]);

  if (v4)
  {
    [v4 floatValue];
    float v6 = v5;
  }

  else if (-[BTAVRCP_NowPlayingInfo mrAppIsPlaying](self, "mrAppIsPlaying"))
  {
    float v6 = 1.0;
  }

  else
  {
    float v6 = 0.0;
  }

  return v6;
}

- (float)_defaultPlaybackRate
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BTAVRCP_NowPlayingInfo mrInfo](self, "mrInfo"));
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKeyedSubscript:kMRMediaRemoteNowPlayingInfoDefaultPlaybackRate]);

  if (v3)
  {
    [v3 floatValue];
    float v5 = v4;
  }

  else
  {
    float v5 = 1.0;
  }

  return v5;
}

- (int64_t)playbackState
{
  if (!-[BTAVRCP_NowPlayingInfo mrAppIsPlaying](self, "mrAppIsPlaying")) {
    return 2LL * (-[BTAVRCP_NowPlayingInfo trackId](self, "trackId") != -1LL);
  }
  -[BTAVRCP_NowPlayingInfo _playbackRate](self, "_playbackRate");
  if (v3 < 0.0) {
    return 4LL;
  }
  float v5 = v3;
  if (v3 <= 1.0) {
    return 1LL;
  }
  -[BTAVRCP_NowPlayingInfo _defaultPlaybackRate](self, "_defaultPlaybackRate");
  if (v5 <= v6) {
    return 1LL;
  }
  else {
    return 3LL;
  }
}

- (void)_playbackStateDidChange
{
  float v3 = -[BTAVRCP_NowPlayingInfo playbackState](self, "playbackState");
  if (v3 != (void *)-[BTAVRCP_NowPlayingInfo currentPlaybackState](self, "currentPlaybackState"))
  {
    -[BTAVRCP_NowPlayingInfo setCurrentPlaybackState:](self, "setCurrentPlaybackState:", v3);
    id v4 = (id)objc_claimAutoreleasedReturnValue(-[BTAVRCP_NowPlayingInfo delegate](self, "delegate"));
    [v4 playbackStateDidChange:v3];
  }

- (unint64_t)_trackHash
{
  float v3 = (void *)objc_claimAutoreleasedReturnValue(-[BTAVRCP_NowPlayingInfo mrInfo](self, "mrInfo"));

  if (v3)
  {
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[BTAVRCP_NowPlayingInfo mrInfo](self, "mrInfo"));
    v30 = (void *)objc_claimAutoreleasedReturnValue([v31 objectForKeyedSubscript:kMRMediaRemoteNowPlayingInfoAlbum]);
    unint64_t v4 = (unint64_t)[v30 hash];
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[BTAVRCP_NowPlayingInfo mrInfo](self, "mrInfo"));
    v28 = (void *)objc_claimAutoreleasedReturnValue([v29 objectForKeyedSubscript:kMRMediaRemoteNowPlayingInfoArtist]);
    unint64_t v5 = (unint64_t)[v28 hash] ^ v4;
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[BTAVRCP_NowPlayingInfo mrInfo](self, "mrInfo"));
    v26 = (void *)objc_claimAutoreleasedReturnValue([v27 objectForKeyedSubscript:kMRMediaRemoteNowPlayingInfoTitle]);
    unint64_t v6 = (unint64_t)[v26 hash];
    id v25 = (void *)objc_claimAutoreleasedReturnValue(-[BTAVRCP_NowPlayingInfo mrInfo](self, "mrInfo"));
    v24 = (void *)objc_claimAutoreleasedReturnValue([v25 objectForKeyedSubscript:kMRMediaRemoteNowPlayingInfoGenre]);
    unint64_t v7 = v5 ^ v6 ^ (unint64_t)[v24 hash];
    id v23 = (void *)objc_claimAutoreleasedReturnValue(-[BTAVRCP_NowPlayingInfo mrInfo](self, "mrInfo"));
    v22 = (void *)objc_claimAutoreleasedReturnValue([v23 objectForKeyedSubscript:kMRMediaRemoteNowPlayingInfoQueueIndex]);
    unint64_t v8 = (unint64_t)[v22 hash];
    id v21 = (void *)objc_claimAutoreleasedReturnValue(-[BTAVRCP_NowPlayingInfo mrInfo](self, "mrInfo"));
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v21 objectForKeyedSubscript:kMRMediaRemoteNowPlayingInfoTotalQueueCount]);
    unint64_t v10 = v8 ^ (unint64_t)[v9 hash];
    float v11 = (void *)objc_claimAutoreleasedReturnValue(-[BTAVRCP_NowPlayingInfo mrInfo](self, "mrInfo"));
    v12 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:kMRMediaRemoteNowPlayingInfoTrackNumber]);
    unint64_t v13 = v7 ^ v10 ^ (unint64_t)[v12 hash];
    double v14 = (void *)objc_claimAutoreleasedReturnValue(-[BTAVRCP_NowPlayingInfo mrInfo](self, "mrInfo"));
    v15 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKeyedSubscript:kMRMediaRemoteNowPlayingInfoTotalTrackCount]);
    unint64_t v16 = (unint64_t)[v15 hash];
    id v17 = (void *)objc_claimAutoreleasedReturnValue(-[BTAVRCP_NowPlayingInfo mrInfo](self, "mrInfo"));
    v18 = (void *)objc_claimAutoreleasedReturnValue([v17 objectForKeyedSubscript:kMRMediaRemoteNowPlayingInfoDuration]);
    unint64_t v19 = v13 ^ v16 ^ (unint64_t)[v18 hash];
  }

  else if (-[BTAVRCP_NowPlayingInfo isBrowsablePlayer](self, "isBrowsablePlayer"))
  {
    return -1LL;
  }

  else
  {
    return -[BTAVRCP_NowPlayingInfo mrAppIsPlaying](self, "mrAppIsPlaying") - 1LL;
  }

  return v19;
}

- (unint64_t)trackId
{
  unsigned int v3 = -[BTAVRCP_NowPlayingInfo isBrowsablePlayer](self, "isBrowsablePlayer");
  unint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[BTAVRCP_NowPlayingInfo mrInfo](self, "mrInfo"));
  unint64_t v5 = v4;
  if (v3)
  {
    unint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:kMRMediaRemoteNowPlayingInfoUniqueIdentifier]);

    if (v6) {
      goto LABEL_7;
    }
    unint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[BTAVRCP_NowPlayingInfo mrInfo](self, "mrInfo"));
    unint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:kMRMediaRemoteNowPlayingInfoiTunesStoreIdentifier]);

    if (v6) {
      goto LABEL_7;
    }
    unint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[BTAVRCP_NowPlayingInfo mrInfo](self, "mrInfo"));
    unint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:kMRMediaRemoteNowPlayingInfoExternalContentIdentifier]);

    if (v6
      || (uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[BTAVRCP_NowPlayingInfo mrInfo](self, "mrInfo")),
          unint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( [v9 objectForKeyedSubscript:kMRMediaRemoteNowPlayingInfoiTunesStoreSubscriptionAdamIdentifier]),  v9,  v6)
      || (unint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[BTAVRCP_NowPlayingInfo mrInfo](self, "mrInfo")),
          unint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( [v10 objectForKeyedSubscript:kMRMediaRemoteNowPlayingInfoRadioStationIdentifier]),  v10,  v6))
    {
LABEL_7:
      uint64_t v11 = objc_opt_class(&OBJC_CLASS___NSNumber);
      if ((objc_opt_isKindOfClass(v6, v11) & 1) != 0) {
        id v12 = [v6 unsignedLongLongValue];
      }
      else {
        id v12 = [v6 hash];
      }
      unint64_t v13 = (unint64_t)v12;
    }

    else
    {
      return -1LL;
    }
  }

  else if (v4)
  {

    return 0LL;
  }

  else
  {
    return -[BTAVRCP_NowPlayingInfo mrAppIsPlaying](self, "mrAppIsPlaying") - 1LL;
  }

  return v13;
}

- (void)_trackDidChange
{
  unsigned int v3 = -[BTAVRCP_NowPlayingInfo _trackHash](self, "_trackHash");
  if (v3 != (void *)-[BTAVRCP_NowPlayingInfo currentTrackHash](self, "currentTrackHash"))
  {
    -[BTAVRCP_NowPlayingInfo setCurrentTrackHash:](self, "setCurrentTrackHash:", v3);
    id v4 = (id)objc_claimAutoreleasedReturnValue(-[BTAVRCP_NowPlayingInfo delegate](self, "delegate"));
    objc_msgSend(v4, "trackDidChange:", -[BTAVRCP_NowPlayingInfo trackId](self, "trackId"));
  }

- (void)_settingsDidChange:(id)a3
{
  if (a3.var0 != -[BTAVRCP_NowPlayingInfo currentSettings](self, "currentSettings")
    || a3.var1 != (unint64_t)-[BTAVRCP_NowPlayingInfo currentSettings](self, "currentSettings") >> 32)
  {
    -[BTAVRCP_NowPlayingInfo setCurrentSettings:](self, "setCurrentSettings:", a3);
    id v5 = (id)objc_claimAutoreleasedReturnValue(-[BTAVRCP_NowPlayingInfo delegate](self, "delegate"));
    objc_msgSend(v5, "settingsDidChange:", -[BTAVRCP_NowPlayingInfo currentSettings](self, "currentSettings"));
  }

- (BOOL)isLocalOrigin
{
  return MROriginIsLocalOrigin(-[BTAVRCP_NowPlayingInfo mrActiveOrigin](self, "mrActiveOrigin")) != 0;
}

- (BOOL)isMusicApp
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BTAVRCP_NowPlayingInfo mrAppIdentifier](self, "mrAppIdentifier"));
  unsigned __int8 v3 = [v2 isEqualToString:off_10001F048];

  return v3;
}

- (id)encodings
{
  return &off_100019C00;
}

- (id)widths
{
  return &off_100019C18;
}

- (id)heights
{
  return &off_100019C30;
}

- (BTAVRCP_NowPlayingInfoDelegate)delegate
{
  return (BTAVRCP_NowPlayingInfoDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (NSSet)browsablePlayers
{
  return self->_browsablePlayers;
}

- (NSDictionary)mrInfo
{
  return self->_mrInfo;
}

- (void)setMrInfo:(id)a3
{
}

- (NSString)mrAppIdentifier
{
  return self->_mrAppIdentifier;
}

- (void)setMrAppIdentifier:(id)a3
{
}

- (BOOL)mrAppIsPlaying
{
  return self->_mrAppIsPlaying;
}

- (void)setMrAppIsPlaying:(BOOL)a3
{
  self->_mrAppIsPlaying = a3;
}

- (void)mrActiveOrigin
{
  return self->_mrActiveOrigin;
}

- (void)setMrActiveOrigin:(void *)a3
{
  self->_mrActiveOrigin = a3;
}

- (int64_t)currentPlaybackState
{
  return self->_currentPlaybackState;
}

- (void)setCurrentPlaybackState:(int64_t)a3
{
  self->_currentPlaybackState = a3;
}

- (unint64_t)currentTrackHash
{
  return self->_currentTrackHash;
}

- (void)setCurrentTrackHash:(unint64_t)a3
{
  self->_currentTrackHash = a3;
}

- ($2825F4736939C4A6D3AD43837233062D)currentSettings
{
  return ($2825F4736939C4A6D3AD43837233062D)self->_currentSettings;
}

- (void)setCurrentSettings:(id)a3
{
  self->_currentSettings = ($8A243AA3C134A41ABEE9DB00E2BD061F)a3;
}

- (NSString)currentArtworkIdentifier
{
  return self->_currentArtworkIdentifier;
}

- (void)setCurrentArtworkIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
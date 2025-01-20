@interface TVMusicPlayerManager
+ (TVMusicPlayer)defaultPlayer;
+ (TVMusicPlayerManager)sharedInstance;
- (BOOL)isItemPlayingWithIdentifiers:(id)a3;
- (BOOL)isItemPlayingWithIdentifiers:(id)a3 inContainer:(id)a4;
- (TVMusicPlaybackStatusController)playbackStatusController;
- (TVMusicPlayer)player;
- (TVMusicPlayerManager)init;
- (void)setPlaybackStatusController:(id)a3;
- (void)setPlayer:(id)a3;
@end

@implementation TVMusicPlayerManager

+ (TVMusicPlayerManager)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100026754;
  block[3] = &unk_100269BE8;
  block[4] = a1;
  if (qword_1002BE7D8 != -1) {
    dispatch_once(&qword_1002BE7D8, block);
  }
  return (TVMusicPlayerManager *)(id)qword_1002BE7D0;
}

+ (TVMusicPlayer)defaultPlayer
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[TVMusicPlayerManager sharedInstance](&OBJC_CLASS___TVMusicPlayerManager, "sharedInstance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 player]);

  return (TVMusicPlayer *)v3;
}

- (TVMusicPlayerManager)init
{
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___TVMusicPlayerManager;
  v2 = -[TVMusicPlayerManager init](&v11, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue( +[TVMusicAgeGateInfo ageGateInfoFromURLBag]( &OBJC_CLASS___TVMusicAgeGateInfo,  "ageGateInfoFromURLBag"));
    v4 = -[TVMusicPlayer initWithAgeGateInfo:](objc_alloc(&OBJC_CLASS___TVMusicPlayer), "initWithAgeGateInfo:", v3);
    player = v2->_player;
    v2->_player = v4;

    v6 = (void *)objc_claimAutoreleasedReturnValue( +[TVMusicMPLibraryRequestFactory songsLibraryRequest]( &OBJC_CLASS___TVMusicMPLibraryRequestFactory,  "songsLibraryRequest"));
    v7 = (void *)objc_claimAutoreleasedReturnValue([v6 playbackIntentWithStartItemIdentifiers:0]);
    [v7 setShuffleMode:1];
    [v7 setPlayActivityFeatureName:@"fallback_library"];
    -[TVMusicPlayer setFallbackPlaybackIntent:](v2->_player, "setFallbackPlaybackIntent:", v7);
    v8 = objc_opt_new(&OBJC_CLASS___TVMusicPlaybackStatusController);
    playbackStatusController = v2->_playbackStatusController;
    v2->_playbackStatusController = v8;
  }

  return v2;
}

- (BOOL)isItemPlayingWithIdentifiers:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicPlayerManager playbackStatusController](self, "playbackStatusController"));
  id v6 = [v5 playbackStateforItemWithIdentifiers:v4];

  return v6 == (id)2;
}

- (BOOL)isItemPlayingWithIdentifiers:(id)a3 inContainer:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicPlayerManager playbackStatusController](self, "playbackStatusController"));
  id v9 = [v8 playbackStateforItemWithIdentifiers:v7 inContainer:v6];

  return v9 == (id)2;
}

- (TVMusicPlaybackStatusController)playbackStatusController
{
  return self->_playbackStatusController;
}

- (void)setPlaybackStatusController:(id)a3
{
}

- (TVMusicPlayer)player
{
  return self->_player;
}

- (void)setPlayer:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
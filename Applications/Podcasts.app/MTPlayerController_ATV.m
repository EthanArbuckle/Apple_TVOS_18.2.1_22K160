@interface MTPlayerController_ATV
- (BOOL)isPlayingEpisodeUuid:(id)a3;
- (BOOL)isTargetPlaying;
- (MTPlayerController_ATV)init;
- (id)playingEpisodeUuid;
- (void)dismissNowPlayingAnimated:(BOOL)a3;
- (void)openExternalEpisode:(id)a3;
@end

@implementation MTPlayerController_ATV

- (MTPlayerController_ATV)init
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___MTPlayerController_ATV;
  v2 = -[MTPlayerController init](&v5, "init");
  if (v2) {
    id v3 = +[MTTVPlayerManager defaultPlayer](&OBJC_CLASS___MTTVPlayerManager, "defaultPlayer");
  }
  return v2;
}

- (void)openExternalEpisode:(id)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle", a3));
  id v12 = (id)objc_claimAutoreleasedReturnValue( [v3 localizedStringForKey:@"ATV_EXTERNAL_MEDIA_UNSUPPORTED_TITLE" value:&stru_100248948 table:0]);

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue( [v4 localizedStringForKey:@"ATV_EXTERNAL_MEDIA_UNSUPPORTED_MESSAGE" value:&stru_100248948 table:0]);

  v6 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertController alertControllerWithTitle:message:preferredStyle:]( &OBJC_CLASS___UIAlertController,  "alertControllerWithTitle:message:preferredStyle:",  v12,  v5,  1LL));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 localizedStringForKey:@"OK" value:&stru_100248948 table:0]);
  v9 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v8,  1LL,  0LL));
  [v6 addAction:v9];

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIViewController mt_rootViewController](&OBJC_CLASS___UIViewController, "mt_rootViewController"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "mt_topViewController"));

  [v11 presentViewController:v6 animated:1 completion:0];
}

- (BOOL)isTargetPlaying
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MTTVPlayerManager defaultPlayer](&OBJC_CLASS___MTTVPlayerManager, "defaultPlayer"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 state]);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[TVPPlaybackState playing](&OBJC_CLASS___TVPPlaybackState, "playing"));
  BOOL v5 = v3 == v4;

  return v5;
}

- (id)playingEpisodeUuid
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MTTVPlayerManager defaultPlayer](&OBJC_CLASS___MTTVPlayerManager, "defaultPlayer"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 currentMediaItem]);

  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 mediaItemMetadataForProperty:@"TVMusicMediaItemMetadataMPModelObject"]);
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue([v4 podcastEpisode]);
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[MTMediaPlayerEpisodeLookupUtil findEpisodeFromModelObject:]( &OBJC_CLASS___MTMediaPlayerEpisodeLookupUtil,  "findEpisodeFromModelObject:",  v5));
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 uuid]);

  return v7;
}

- (BOOL)isPlayingEpisodeUuid:(id)a3
{
  id v4 = a3;
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayerController_ATV playingEpisodeUuid](self, "playingEpisodeUuid"));
  unsigned __int8 v6 = [v5 isEqualToString:v4];

  return v6;
}

- (void)dismissNowPlayingAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  id v6 = (id)objc_claimAutoreleasedReturnValue(+[MTApplication sharedApplication](&OBJC_CLASS___MTApplication, "sharedApplication"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v6 delegate]);
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue([v4 appController]);
  [v5 dismissNowPlayingAnimated:v3];
}

@end
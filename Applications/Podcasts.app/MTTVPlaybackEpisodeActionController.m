@interface MTTVPlaybackEpisodeActionController
- (id)allActions;
@end

@implementation MTTVPlaybackEpisodeActionController

- (id)allActions
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MTTVEpisodeActionFactory goToShowAction](&OBJC_CLASS___MTTVEpisodeActionFactory, "goToShowAction"));
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[MTTVEpisodeActionFactory removeFromUpNext]( &OBJC_CLASS___MTTVEpisodeActionFactory,  "removeFromUpNext",  v2));
  v11[1] = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[MTTVEpisodeActionFactory markBookmarkedAction]( &OBJC_CLASS___MTTVEpisodeActionFactory,  "markBookmarkedAction"));
  v11[2] = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[MTTVEpisodeActionFactory markUnbookmarkedAction]( &OBJC_CLASS___MTTVEpisodeActionFactory,  "markUnbookmarkedAction"));
  v11[3] = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[MTTVEpisodeActionFactory markUnplayedAction]( &OBJC_CLASS___MTTVEpisodeActionFactory,  "markUnplayedAction"));
  v11[4] = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[MTTVEpisodeActionFactory markPlayedAction]( &OBJC_CLASS___MTTVEpisodeActionFactory,  "markPlayedAction"));
  v11[5] = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue( +[MTTVEpisodeActionFactory viewDescriptionAction]( &OBJC_CLASS___MTTVEpisodeActionFactory,  "viewDescriptionAction"));
  v11[6] = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v11, 7LL));

  return v9;
}

@end
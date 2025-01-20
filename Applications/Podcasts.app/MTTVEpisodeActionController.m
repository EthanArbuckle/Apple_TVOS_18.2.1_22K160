@interface MTTVEpisodeActionController
- (MPCPlayerResponseItem)responseItem;
- (NSArray)auxilaryActions;
- (id)allActions;
- (id)dependentKeys;
- (void)reloadActions;
- (void)setAuxilaryActions:(id)a3;
- (void)setResponseItem:(id)a3;
@end

@implementation MTTVEpisodeActionController

- (id)allActions
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MTTVEpisodeActionFactory goToShowAction](&OBJC_CLASS___MTTVEpisodeActionFactory, "goToShowAction"));
  v16[0] = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MTTVEpisodeActionFactory playNextAction](&OBJC_CLASS___MTTVEpisodeActionFactory, "playNextAction"));
  v16[1] = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[MTTVEpisodeActionFactory addToUpNextAction]( &OBJC_CLASS___MTTVEpisodeActionFactory,  "addToUpNextAction"));
  v16[2] = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[MTTVEpisodeActionFactory markBookmarkedAction]( &OBJC_CLASS___MTTVEpisodeActionFactory,  "markBookmarkedAction"));
  v16[3] = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[MTTVEpisodeActionFactory markUnbookmarkedAction]( &OBJC_CLASS___MTTVEpisodeActionFactory,  "markUnbookmarkedAction"));
  v16[4] = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue( +[MTTVEpisodeActionFactory markUnplayedAction]( &OBJC_CLASS___MTTVEpisodeActionFactory,  "markUnplayedAction"));
  v16[5] = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue( +[MTTVEpisodeActionFactory markPlayedAction]( &OBJC_CLASS___MTTVEpisodeActionFactory,  "markPlayedAction"));
  v16[6] = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue( +[MTTVEpisodeActionFactory viewDescriptionAction]( &OBJC_CLASS___MTTVEpisodeActionFactory,  "viewDescriptionAction"));
  v16[7] = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v16, 8LL));

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVEpisodeActionController auxilaryActions](self, "auxilaryActions"));
  if (v12)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVEpisodeActionController auxilaryActions](self, "auxilaryActions"));
    uint64_t v14 = objc_claimAutoreleasedReturnValue([v11 arrayByAddingObjectsFromArray:v13]);

    v11 = (void *)v14;
  }

  return v11;
}

- (void)reloadActions
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[IMActionController actionObject](self, "actionObject"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVEpisodeActionController dependentKeys](self, "dependentKeys"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v3 dictionaryWithValuesForKeys:v4]);

  if (!-[NSDictionary isEqualToDictionary:](self->_episodeDict, "isEqualToDictionary:", v5)
    && [v5 count])
  {
    objc_storeStrong((id *)&self->_episodeDict, v5);
    v6.receiver = self;
    v6.super_class = (Class)&OBJC_CLASS___MTTVEpisodeActionController;
    -[IMActionController reloadActions](&v6, "reloadActions");
  }
}

- (id)dependentKeys
{
  v3[0] = kEpisodeUuid;
  v3[1] = kEpisodeAssetURL;
  v3[2] = kEpisodePersistentID;
  v3[3] = kEpisodePlayState;
  v3[4] = kEpisodePlayStateManuallySet;
  v3[5] = kEpisodeIsFromiTunesSync;
  v3[6] = kEpisodeExternalType;
  v3[7] = kEpisodeAudio;
  v3[8] = kEpisodeVideo;
  v3[9] = kEpisodeIsBookmarked;
  return (id)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  v3,  10LL));
}

- (MPCPlayerResponseItem)responseItem
{
  return self->_responseItem;
}

- (void)setResponseItem:(id)a3
{
}

- (NSArray)auxilaryActions
{
  return self->_auxilaryActions;
}

- (void)setAuxilaryActions:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
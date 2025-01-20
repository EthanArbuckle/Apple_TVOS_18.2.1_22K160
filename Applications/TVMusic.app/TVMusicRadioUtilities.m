@interface TVMusicRadioUtilities
+ (BOOL)_isUserSubscribed;
+ (BOOL)canPlayFromArtistID:(id)a3;
+ (BOOL)canPlayFromMPAlbum:(id)a3;
+ (BOOL)canPlayFromMPArtist:(id)a3;
+ (BOOL)canPlayFromMPSong:(id)a3;
+ (BOOL)canPlayFromStationStringID:(id)a3 isFreeRadioStation:(BOOL)a4;
+ (BOOL)isRadioPlaying;
+ (id)_playbackIntentForArtistID:(id)a3;
+ (void)playFromArtistID:(id)a3 playActivityFeatureName:(id)a4 playActivityRecommendationData:(id)a5;
+ (void)playFromMPAlbum:(id)a3;
+ (void)playFromMPArtist:(id)a3;
+ (void)playFromMPSong:(id)a3;
+ (void)playFromStationStringID:(id)a3 playActivityFeatureName:(id)a4 playActivityRecommendationData:(id)a5;
@end

@implementation TVMusicRadioUtilities

+ (BOOL)isRadioPlaying
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[TVMusicPlayerManager defaultPlayer](&OBJC_CLASS___TVMusicPlayerManager, "defaultPlayer"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 playQueue]);
  unsigned __int8 v4 = [v3 isRadioPlayback];

  return v4;
}

+ (BOOL)canPlayFromStationStringID:(id)a3 isFreeRadioStation:(BOOL)a4
{
  id v6 = a3;
  if (a4 || [a1 _isUserSubscribed])
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue( +[MPCPlaybackIntent radioPlaybackIntentWithStationStringID:]( &OBJC_CLASS___MPCPlaybackIntent,  "radioPlaybackIntentWithStationStringID:",  v6));
    BOOL v8 = v7 != 0LL;
  }

  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

+ (void)playFromStationStringID:(id)a3 playActivityFeatureName:(id)a4 playActivityRecommendationData:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v11 = (id)objc_claimAutoreleasedReturnValue( +[MPIdentifierSet tvm_identiferSetForRadioStationStringID:]( &OBJC_CLASS___MPIdentifierSet,  "tvm_identiferSetForRadioStationStringID:",  a3));
  id v9 = [[MPModelRadioStation alloc] initWithIdentifiers:v11 block:&stru_10026A288];
  v10 = (void *)objc_claimAutoreleasedReturnValue( +[MPCPlaybackIntent radioPlaybackIntentWithStation:]( &OBJC_CLASS___MPCPlaybackIntent,  "radioPlaybackIntentWithStation:",  v9));
  [v10 setPlayActivityFeatureName:v8];

  [v10 setPlayActivityRecommendationData:v7];
  +[TVMusicPlaybackHelper playRadioWithPlaybackIntent:]( &OBJC_CLASS___TVMusicPlaybackHelper,  "playRadioWithPlaybackIntent:",  v10);
}

+ (BOOL)canPlayFromArtistID:(id)a3
{
  id v4 = a3;
  if ([a1 _isUserSubscribed])
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue([a1 _playbackIntentForArtistID:v4]);
    BOOL v6 = v5 != 0LL;
  }

  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

+ (void)playFromArtistID:(id)a3 playActivityFeatureName:(id)a4 playActivityRecommendationData:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = (id)objc_claimAutoreleasedReturnValue([a1 _playbackIntentForArtistID:a3]);
  [v10 setPlayActivityFeatureName:v9];

  [v10 setPlayActivityRecommendationData:v8];
  +[TVMusicPlaybackHelper playRadioWithPlaybackIntent:]( &OBJC_CLASS___TVMusicPlaybackHelper,  "playRadioWithPlaybackIntent:",  v10);
}

+ (BOOL)canPlayFromMPSong:(id)a3
{
  id v4 = a3;
  if (![a1 _isUserSubscribed]
    || [v4 hasLoadedValueForKey:MPModelPropertySongHasVideo]
    && ([v4 hasVideo] & 1) != 0)
  {
    unsigned __int8 v5 = 0;
  }

  else
  {
    BOOL v6 = (void *)objc_claimAutoreleasedReturnValue( +[MPCPlaybackIntent radioPlaybackIntentFromSong:]( &OBJC_CLASS___MPCPlaybackIntent,  "radioPlaybackIntentFromSong:",  v4));
    if (v6)
    {
      id v7 = (void *)objc_claimAutoreleasedReturnValue(+[TVMusicPlayerManager sharedInstance](&OBJC_CLASS___TVMusicPlayerManager, "sharedInstance"));
      id v8 = (void *)objc_claimAutoreleasedReturnValue([v4 identifiers]);
      unsigned int v9 = [v7 isItemPlayingWithIdentifiers:v8];

      if (v9)
      {
        id v10 = (void *)objc_claimAutoreleasedReturnValue(+[TVMusicPlayerManager defaultPlayer](&OBJC_CLASS___TVMusicPlayerManager, "defaultPlayer"));
        id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 playQueue]);
        unsigned __int8 v5 = [v11 canAddToPlayQueueNextWithPlaybackIntent:v6];
      }

      else
      {
        unsigned __int8 v5 = 1;
      }
    }

    else
    {
      unsigned __int8 v5 = 0;
    }
  }

  return v5;
}

+ (void)playFromMPSong:(id)a3
{
}

+ (BOOL)canPlayFromMPAlbum:(id)a3
{
  return 0;
}

+ (void)playFromMPAlbum:(id)a3
{
  id v3 = (id)objc_claimAutoreleasedReturnValue( +[MPCPlaybackIntent radioPlaybackIntentFromAlbum:]( &OBJC_CLASS___MPCPlaybackIntent,  "radioPlaybackIntentFromAlbum:",  a3));
  +[TVMusicPlaybackHelper playRadioWithPlaybackIntent:]( &OBJC_CLASS___TVMusicPlaybackHelper,  "playRadioWithPlaybackIntent:",  v3);
}

+ (BOOL)canPlayFromMPArtist:(id)a3
{
  id v4 = a3;
  if ([a1 _isUserSubscribed]
    && (unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue([v4 identifiers]),
        BOOL v6 = (void *)objc_claimAutoreleasedReturnValue([v5 universalStore]),
        id v7 = [v6 adamID],
        v6,
        v5,
        v7))
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue( +[MPCPlaybackIntent radioPlaybackIntentFromArtist:]( &OBJC_CLASS___MPCPlaybackIntent,  "radioPlaybackIntentFromArtist:",  v4));

    BOOL v9 = v8 != 0LL;
  }

  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

+ (void)playFromMPArtist:(id)a3
{
  id v3 = (id)objc_claimAutoreleasedReturnValue( +[MPCPlaybackIntent radioPlaybackIntentFromArtist:]( &OBJC_CLASS___MPCPlaybackIntent,  "radioPlaybackIntentFromArtist:",  a3));
  +[TVMusicPlaybackHelper playRadioWithPlaybackIntent:]( &OBJC_CLASS___TVMusicPlaybackHelper,  "playRadioWithPlaybackIntent:",  v3);
}

+ (id)_playbackIntentForArtistID:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[MPModelArtistKind identityKind](&OBJC_CLASS___MPModelArtistKind, "identityKind"));
  id v5 = [v3 longLongValue];

  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue( +[MPIdentifierSet tvm_identifierSetForModelKind:withStoreID:subscriptionID:]( &OBJC_CLASS___MPIdentifierSet,  "tvm_identifierSetForModelKind:withStoreID:subscriptionID:",  v4,  v5,  0LL));
  id v7 = -[MPModelArtist initWithIdentifiers:block:]( objc_alloc(&OBJC_CLASS___MPModelArtist),  "initWithIdentifiers:block:",  v6,  &stru_10026A2A8);
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[MPCPlaybackIntent radioPlaybackIntentFromArtist:]( &OBJC_CLASS___MPCPlaybackIntent,  "radioPlaybackIntentFromArtist:",  v7));

  return v8;
}

+ (BOOL)_isUserSubscribed
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[TVMSubscriptionManager sharedInstance](&OBJC_CLASS___TVMSubscriptionManager, "sharedInstance"));
  unsigned __int8 v3 = [v2 hasMusicSubscription];

  return v3;
}

@end
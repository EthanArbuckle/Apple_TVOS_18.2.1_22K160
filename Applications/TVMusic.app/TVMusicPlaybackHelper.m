@interface TVMusicPlaybackHelper
+ (BOOL)_isPlayingOnLocalDevice;
+ (BOOL)_isRemotePlaybackAuthorized;
+ (BOOL)_isVideoItemType:(unint64_t)a3;
+ (BOOL)canPlayItemType:(unint64_t)a3 playbackAction:(unint64_t)a4;
+ (BOOL)canPlayItemWithStoreID:(id)a3 playbackAction:(unint64_t)a4;
+ (id)_currentFeatureName;
+ (id)_songsRequestForContainer:(id)a3;
+ (id)_songsRequestForContainer:(id)a3 filterObject:(id)a4;
+ (id)_stringForItemType:(unint64_t)a3;
+ (id)modelKindForPlaybackType:(unint64_t)a3;
+ (id)playbackIntentForSongsInContainer:(id)a3 filterObject:(id)a4 startIdentifiers:(id)a5 initialPlaybackType:(unint64_t)a6;
+ (id)playbackIntentForSongsInContainer:(id)a3 startIdentifiers:(id)a4 initialPlaybackType:(unint64_t)a5;
+ (id)playbackIntentForSongsInContainer:(id)a3 startIdentifiers:(id)a4 shuffle:(BOOL)a5;
+ (id)playbackIntentForSongsInContainer:(id)a3 startIdentifiers:(id)a4 shuffle:(BOOL)a5 initialPlaybackType:(unint64_t)a6;
+ (void)_observeMediaPlayerCommandCompletionWithIdentifier:(id)a3 playbackType:(unint64_t)a4;
+ (void)_playLibraryItemWithRequest:(id)a3 identifiers:(id)a4 playbackType:(unint64_t)a5;
+ (void)_playRequestWithItemType:(unint64_t)a3 requestBlock:(id)a4;
+ (void)_playSongsWithRequest:(id)a3 playbackAction:(unint64_t)a4;
+ (void)_playSongsWithRequest:(id)a3 playbackAction:(unint64_t)a4 initialPlaybackType:(unint64_t)a5;
+ (void)_playSongsWithRequest:(id)a3 startIdentifiers:(id)a4 shuffle:(BOOL)a5 initialPlaybackType:(unint64_t)a6;
+ (void)_playUsingAirPlayWithPlaybackIntent:(id)a3 initialPlaybackType:(unint64_t)a4 playbackAction:(unint64_t)a5;
+ (void)_playVideoItemWithRequest:(id)a3 item:(id)a4;
+ (void)_playWithPlaybackIntent:(id)a3 initialPlaybackType:(unint64_t)a4 playbackAction:(unint64_t)a5 checkSubscriptionStatus:(BOOL)a6;
+ (void)_removeMediaPlayerCommandCompletionObserver;
+ (void)checkPrerequisitesAndPlayPlaybackIntent:(id)a3;
+ (void)playFromRequest:(id)a3 shuffle:(BOOL)a4 initialPlaybackType:(unint64_t)a5;
+ (void)playFromRequest:(id)a3 startItemIdentifiers:(id)a4 initialPlaybackType:(unint64_t)a5;
+ (void)playItemType:(unint64_t)a3 withMPObject:(id)a4;
+ (void)playItemType:(unint64_t)a3 withPersistentID:(id)a4;
+ (void)playItemType:(unint64_t)a3 withPersistentID:(id)a4 inContainer:(id)a5 playbackAction:(unint64_t)a6;
+ (void)playItemType:(unint64_t)a3 withPersistentID:(id)a4 playbackAction:(unint64_t)a5;
+ (void)playRadioFromMPSong:(id)a3;
+ (void)playRadioWithPlaybackIntent:(id)a3;
+ (void)playSongsInContainer:(id)a3 startIdentifiers:(id)a4 initialPlaybackType:(unint64_t)a5;
+ (void)playSongsInContainer:(id)a3 startIdentifiers:(id)a4 shuffle:(BOOL)a5;
+ (void)playSongsInContainer:(id)a3 startIdentifiers:(id)a4 shuffle:(BOOL)a5 initialPlaybackType:(unint64_t)a6;
+ (void)playSongsInContainer:(id)a3 startIdentifiers:(id)a4 shuffle:(BOOL)a5 itemSortDescriptors:(id)a6;
+ (void)playWithPlaybackIntent:(id)a3;
+ (void)queueRadioWithPlaybackIntent:(id)a3;
+ (void)shuffleAllLibrarySongs;
@end

@implementation TVMusicPlaybackHelper

+ (BOOL)canPlayItemType:(unint64_t)a3 playbackAction:(unint64_t)a4
{
  if (a4
    && ([a1 _isRemotePlaybackAuthorized] & 1) == 0
    && ![a1 _isPlayingOnLocalDevice])
  {
    return 0;
  }

  uint64_t v10 = 0LL;
  v11 = &v10;
  uint64_t v12 = 0x2020000000LL;
  char v13 = 0;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_10009EB80;
  v9[3] = &unk_10026CF98;
  v9[4] = &v10;
  v9[5] = a4;
  [a1 _playRequestWithItemType:a3 requestBlock:v9];
  BOOL v7 = *((_BYTE *)v11 + 24) != 0;
  _Block_object_dispose(&v10, 8);
  return v7;
}

+ (BOOL)canPlayItemWithStoreID:(id)a3 playbackAction:(unint64_t)a4
{
  id v6 = a3;
  if (!a4
    || ([a1 _isRemotePlaybackAuthorized] & 1) != 0
    || [a1 _isPlayingOnLocalDevice])
  {
    BOOL v7 = (void *)objc_claimAutoreleasedReturnValue(+[TVMusicPlayerManager defaultPlayer](&OBJC_CLASS___TVMusicPlayerManager, "defaultPlayer"));
    v8 = (void *)objc_claimAutoreleasedReturnValue([v7 playQueue]);

    v9 = objc_alloc(&OBJC_CLASS___TVMusicPlaybackIntent);
    id v17 = v6;
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v17, 1LL));
    v11 = -[TVMusicPlaybackIntent initWithStoreIDs:shuffle:playbackAction:startItemIdentifiers:]( v9,  "initWithStoreIDs:shuffle:playbackAction:startItemIdentifiers:",  v10,  0LL,  a4,  0LL);

    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicPlaybackIntent mpcPlaybackIntent](v11, "mpcPlaybackIntent"));
    if (v12)
    {
      switch(a4)
      {
        case 0uLL:
          BOOL v13 = 1;
          break;
        case 1uLL:
          v14 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicPlaybackIntent mpcPlaybackIntent](v11, "mpcPlaybackIntent"));
          unsigned __int8 v15 = [v8 canAddToPlayQueueNextWithPlaybackIntent:v14];
          goto LABEL_13;
        case 2uLL:
          v14 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicPlaybackIntent mpcPlaybackIntent](v11, "mpcPlaybackIntent"));
          unsigned __int8 v15 = [v8 canAddToPlayQueueAtEndWithPlaybackIntent:v14];
          goto LABEL_13;
        case 3uLL:
          v14 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicPlaybackIntent mpcPlaybackIntent](v11, "mpcPlaybackIntent"));
          unsigned __int8 v15 = [v8 canAddToEndOfUpNextWithPlaybackIntent:v14];
          goto LABEL_13;
        case 4uLL:
          v14 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicPlaybackIntent mpcPlaybackIntent](v11, "mpcPlaybackIntent"));
          unsigned __int8 v15 = [v8 canAddAfterSectionWithPlaybackIntent:v14];
LABEL_13:
          BOOL v13 = v15;

          break;
        default:
          goto LABEL_7;
      }
    }

    else
    {
LABEL_7:
      BOOL v13 = 0;
    }
  }

  else
  {
    BOOL v13 = 0;
  }

  return v13;
}

+ (void)playItemType:(unint64_t)a3 withMPObject:(id)a4
{
  id v6 = a4;
  id v7 = sub_10009F114();
  v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue([a1 _stringForItemType:a3]);
    *(_DWORD *)buf = 136315906;
    v23 = "+[TVMusicPlaybackHelper playItemType:withMPObject:]";
    __int16 v24 = 2080;
    v25 = "+[TVMusicPlaybackHelper playItemType:withMPObject:]";
    __int16 v26 = 2112;
    v27 = v9;
    __int16 v28 = 2112;
    id v29 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s: %s: itemType: %@, object: %@", buf, 0x2Au);
  }

  switch(a3)
  {
    case 0uLL:
      id v15 = sub_10009F114();
      v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
      if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_11;
      }
      *(_WORD *)buf = 0;
      uint64_t v12 = "Unknown item type for playback";
      BOOL v13 = v11;
      uint32_t v14 = 2;
      goto LABEL_10;
    case 1uLL:
    case 3uLL:
    case 4uLL:
    case 5uLL:
      [a1 playSongsInContainer:v6 startIdentifiers:0 shuffle:0];
      break;
    case 2uLL:
      v16 = (void *)objc_claimAutoreleasedReturnValue( +[TVMusicMPLibraryRequestFactory songsLibraryRequest]( &OBJC_CLASS___TVMusicMPLibraryRequestFactory,  "songsLibraryRequest"));
      id v17 = (void *)objc_claimAutoreleasedReturnValue([v6 identifiers]);
      [a1 _playLibraryItemWithRequest:v16 identifiers:v17 playbackType:1];

      goto LABEL_17;
    case 6uLL:
      uint64_t v18 = objc_claimAutoreleasedReturnValue( +[TVMusicMPLibraryRequestFactory musicVideosLibraryRequest]( &OBJC_CLASS___TVMusicMPLibraryRequestFactory,  "musicVideosLibraryRequest"));
      goto LABEL_16;
    case 7uLL:
      uint64_t v18 = objc_claimAutoreleasedReturnValue( +[TVMusicMPLibraryRequestFactory moviesLibraryRequest]( &OBJC_CLASS___TVMusicMPLibraryRequestFactory,  "moviesLibraryRequest"));
      goto LABEL_16;
    case 8uLL:
      uint64_t v18 = objc_claimAutoreleasedReturnValue( +[TVMusicMPLibraryRequestFactory TVEpisodesLibraryRequestForShow:season:]( &OBJC_CLASS___TVMusicMPLibraryRequestFactory,  "TVEpisodesLibraryRequestForShow:season:",  0LL,  0LL));
LABEL_16:
      v16 = (void *)v18;
      [a1 _playVideoItemWithRequest:v18 item:v6];
LABEL_17:

      break;
    case 9uLL:
    case 0xAuLL:
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472LL;
      v19[2] = sub_10009F154;
      v19[3] = &unk_10026B830;
      id v21 = a1;
      id v20 = v6;
      +[TVMusicRestrictionsUI presentVideoRestrictionAlertIfNeededWithCompletion:]( &OBJC_CLASS___TVMusicRestrictionsUI,  "presentVideoRestrictionAlertIfNeededWithCompletion:",  v19);

      break;
    default:
      id v10 = sub_10009F114();
      v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        v23 = (const char *)a3;
        uint64_t v12 = "Unsupported item type for playback: %ld";
        BOOL v13 = v11;
        uint32_t v14 = 12;
LABEL_10:
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, v12, buf, v14);
      }

+ (void)playFromRequest:(id)a3 shuffle:(BOOL)a4 initialPlaybackType:(unint64_t)a5
{
}

+ (void)playFromRequest:(id)a3 startItemIdentifiers:(id)a4 initialPlaybackType:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = sub_10009F114();
  v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 136316162;
    BOOL v13 = "+[TVMusicPlaybackHelper playFromRequest:startItemIdentifiers:initialPlaybackType:]";
    __int16 v14 = 2080;
    id v15 = "+[TVMusicPlaybackHelper playFromRequest:startItemIdentifiers:initialPlaybackType:]";
    __int16 v16 = 2112;
    id v17 = v8;
    __int16 v18 = 2112;
    id v19 = v9;
    __int16 v20 = 2048;
    unint64_t v21 = a5;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "%s: %s: Playing with request: %@, startItemIdentifiers: %@, initialPlaybackType %ld",  (uint8_t *)&v12,  0x34u);
  }

  [a1 _playSongsWithRequest:v8 startIdentifiers:v9 shuffle:0 initialPlaybackType:a5];
}

+ (void)playRadioWithPlaybackIntent:(id)a3
{
  id v4 = a3;
  id v5 = sub_10009F114();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315650;
    id v8 = "+[TVMusicPlaybackHelper playRadioWithPlaybackIntent:]";
    __int16 v9 = 2080;
    id v10 = "+[TVMusicPlaybackHelper playRadioWithPlaybackIntent:]";
    __int16 v11 = 2112;
    id v12 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "%s: %s: Playing radio with playbackIntent: %@",  (uint8_t *)&v7,  0x20u);
  }

  [a1 _playWithPlaybackIntent:v4 initialPlaybackType:0 playbackAction:0 checkSubscriptionStatus:1];
}

+ (void)queueRadioWithPlaybackIntent:(id)a3
{
  id v4 = a3;
  id v5 = sub_10009F114();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315650;
    id v8 = "+[TVMusicPlaybackHelper queueRadioWithPlaybackIntent:]";
    __int16 v9 = 2080;
    id v10 = "+[TVMusicPlaybackHelper queueRadioWithPlaybackIntent:]";
    __int16 v11 = 2112;
    id v12 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "%s: %s: Queueing radio with playbackIntent: %@",  (uint8_t *)&v7,  0x20u);
  }

  [a1 _playWithPlaybackIntent:v4 initialPlaybackType:0 playbackAction:3 checkSubscriptionStatus:0];
}

+ (void)playRadioFromMPSong:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[MPCPlaybackIntent radioPlaybackIntentFromSong:]( &OBJC_CLASS___MPCPlaybackIntent,  "radioPlaybackIntentFromSong:",  v4));
  if (!v5)
  {
    id v14 = sub_10009F114();
    BOOL v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 136315650;
      __int16 v16 = "+[TVMusicPlaybackHelper playRadioFromMPSong:]";
      __int16 v17 = 2080;
      __int16 v18 = "+[TVMusicPlaybackHelper playRadioFromMPSong:]";
      __int16 v19 = 2112;
      id v20 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "%s: %s: Can't play radio station from song %@",  (uint8_t *)&v15,  0x20u);
    }

    goto LABEL_8;
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[TVMusicPlayerManager sharedInstance](&OBJC_CLASS___TVMusicPlayerManager, "sharedInstance"));
  int v7 = (void *)objc_claimAutoreleasedReturnValue([v4 identifiers]);
  uint64_t v8 = [v6 isItemPlayingWithIdentifiers:v7];

  id v9 = sub_10009F114();
  id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 136315650;
    __int16 v16 = "+[TVMusicPlaybackHelper playRadioFromMPSong:]";
    __int16 v17 = 2080;
    __int16 v18 = "+[TVMusicPlaybackHelper playRadioFromMPSong:]";
    __int16 v19 = 2112;
    id v20 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "%s: %s: Playing radio for song: %@",  (uint8_t *)&v15,  0x20u);
  }

  [a1 _playWithPlaybackIntent:v5 initialPlaybackType:0 playbackAction:v8 checkSubscriptionStatus:1];
  __int16 v11 = (void *)objc_claimAutoreleasedReturnValue(+[TVMusicNowPlayingManager sharedInstance](&OBJC_CLASS___TVMusicNowPlayingManager, "sharedInstance"));
  unsigned int v12 = [v11 isNowPlayingVisible];

  if (v12)
  {
    BOOL v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[TVMusicHUDController sharedInstance](&OBJC_CLASS___TVMusicHUDController, "sharedInstance"));
    -[os_log_s showWithType:](v13, "showWithType:", 8LL);
LABEL_8:
  }
}

+ (void)playWithPlaybackIntent:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [v4 isValidPlaybackIntent];
  id v6 = sub_10009F114();
  int v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v8)
    {
      int v11 = 136315650;
      unsigned int v12 = "+[TVMusicPlaybackHelper playWithPlaybackIntent:]";
      __int16 v13 = 2080;
      id v14 = "+[TVMusicPlaybackHelper playWithPlaybackIntent:]";
      __int16 v15 = 2112;
      id v16 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "%s: %s: Playing with TVMusicPlaybackIntent: %@",  (uint8_t *)&v11,  0x20u);
    }

    id v9 = (void *)objc_claimAutoreleasedReturnValue([v4 playActivityFeatureName]);
    if (!v9)
    {
      id v10 = (void *)objc_claimAutoreleasedReturnValue([a1 _currentFeatureName]);
      [v4 setPlayActivityFeatureName:v10];
    }

    int v7 = (os_log_s *)objc_claimAutoreleasedReturnValue([v4 mpcPlaybackIntent]);
    objc_msgSend( a1,  "_playWithPlaybackIntent:initialPlaybackType:playbackAction:checkSubscriptionStatus:",  v7,  objc_msgSend(v4, "playbackType"),  objc_msgSend(v4, "playbackAction"),  1);
  }

  else if (v8)
  {
    int v11 = 136315650;
    unsigned int v12 = "+[TVMusicPlaybackHelper playWithPlaybackIntent:]";
    __int16 v13 = 2080;
    id v14 = "+[TVMusicPlaybackHelper playWithPlaybackIntent:]";
    __int16 v15 = 2112;
    id v16 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "%s: %s: Can't play due to invalid playback intent: %@",  (uint8_t *)&v11,  0x20u);
  }
}

+ (void)playItemType:(unint64_t)a3 withPersistentID:(id)a4
{
}

+ (void)playItemType:(unint64_t)a3 withPersistentID:(id)a4 inContainer:(id)a5 playbackAction:(unint64_t)a6
{
  id v9 = a4;
  id v10 = sub_10009F114();
  int v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue([a1 _stringForItemType:a3]);
    *(_DWORD *)buf = 136316162;
    id v20 = "+[TVMusicPlaybackHelper playItemType:withPersistentID:inContainer:playbackAction:]";
    __int16 v21 = 2080;
    v22 = "+[TVMusicPlaybackHelper playItemType:withPersistentID:inContainer:playbackAction:]";
    __int16 v23 = 2112;
    __int16 v24 = v12;
    __int16 v25 = 2112;
    id v26 = v9;
    __int16 v27 = 2048;
    unint64_t v28 = a6;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "%s: %s: itemType: %@, persistent ID: %@, action=%ld",  buf,  0x34u);
  }

  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_10009F998;
  v14[3] = &unk_10026D010;
  id v15 = v9;
  id v16 = a1;
  unint64_t v17 = a3;
  unint64_t v18 = a6;
  id v13 = v9;
  [a1 _playRequestWithItemType:a3 requestBlock:v14];
}

+ (void)playItemType:(unint64_t)a3 withPersistentID:(id)a4 playbackAction:(unint64_t)a5
{
}

+ (void)shuffleAllLibrarySongs
{
  id v3 = (id)objc_claimAutoreleasedReturnValue( +[TVMusicMPLibraryRequestFactory songsLibraryRequest]( &OBJC_CLASS___TVMusicMPLibraryRequestFactory,  "songsLibraryRequest"));
  [a1 playFromRequest:v3 shuffle:1 initialPlaybackType:1];
}

+ (void)playSongsInContainer:(id)a3 startIdentifiers:(id)a4 shuffle:(BOOL)a5
{
  id v6 = (id)objc_claimAutoreleasedReturnValue([a1 playbackIntentForSongsInContainer:a3 startIdentifiers:a4 shuffle:a5]);
  [a1 playWithPlaybackIntent:v6];
}

+ (void)playSongsInContainer:(id)a3 startIdentifiers:(id)a4 initialPlaybackType:(unint64_t)a5
{
}

+ (void)playSongsInContainer:(id)a3 startIdentifiers:(id)a4 shuffle:(BOOL)a5 itemSortDescriptors:(id)a6
{
}

+ (id)playbackIntentForSongsInContainer:(id)a3 startIdentifiers:(id)a4 shuffle:(BOOL)a5
{
  return [a1 playbackIntentForSongsInContainer:a3 startIdentifiers:a4 shuffle:a5 initialPlaybackType:1];
}

+ (id)playbackIntentForSongsInContainer:(id)a3 startIdentifiers:(id)a4 initialPlaybackType:(unint64_t)a5
{
  return [a1 playbackIntentForSongsInContainer:a3 startIdentifiers:a4 shuffle:0 initialPlaybackType:a5];
}

+ (id)playbackIntentForSongsInContainer:(id)a3 filterObject:(id)a4 startIdentifiers:(id)a5 initialPlaybackType:(unint64_t)a6
{
  id v10 = a5;
  int v11 = (void *)objc_claimAutoreleasedReturnValue([a1 _songsRequestForContainer:a3 filterObject:a4]);
  unsigned int v12 = -[TVMusicPlaybackIntent initWithRequest:shuffle:startItemIdentifiers:]( objc_alloc(&OBJC_CLASS___TVMusicPlaybackIntent),  "initWithRequest:shuffle:startItemIdentifiers:",  v11,  0LL,  v10);

  -[TVMusicPlaybackIntent setPlaybackType:](v12, "setPlaybackType:", a6);
  return v12;
}

+ (id)playbackIntentForSongsInContainer:(id)a3 startIdentifiers:(id)a4 shuffle:(BOOL)a5 initialPlaybackType:(unint64_t)a6
{
  BOOL v7 = a5;
  id v10 = a4;
  int v11 = (void *)objc_claimAutoreleasedReturnValue([a1 _songsRequestForContainer:a3]);
  unsigned int v12 = -[TVMusicPlaybackIntent initWithRequest:shuffle:startItemIdentifiers:]( objc_alloc(&OBJC_CLASS___TVMusicPlaybackIntent),  "initWithRequest:shuffle:startItemIdentifiers:",  v11,  v7,  v10);

  -[TVMusicPlaybackIntent setPlaybackType:](v12, "setPlaybackType:", a6);
  return v12;
}

+ (void)playSongsInContainer:(id)a3 startIdentifiers:(id)a4 shuffle:(BOOL)a5 initialPlaybackType:(unint64_t)a6
{
  id v7 = (id)objc_claimAutoreleasedReturnValue( [a1 playbackIntentForSongsInContainer:a3 startIdentifiers:a4 shuffle:a5 initialPlaybackType:a6]);
  [a1 playWithPlaybackIntent:v7];
}

+ (id)modelKindForPlaybackType:(unint64_t)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[MPModelSong kindWithVariants:](&OBJC_CLASS___MPModelSong, "kindWithVariants:", 3LL));
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(+[MPModelAlbum kindWithSongKind:](&OBJC_CLASS___MPModelAlbum, "kindWithSongKind:", v4));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[MPModelTVEpisode kindWithVariants:](&OBJC_CLASS___MPModelTVEpisode, "kindWithVariants:", 2LL));
  uint64_t v7 = objc_claimAutoreleasedReturnValue(+[MPModelMovie kindWithVariants:](&OBJC_CLASS___MPModelMovie, "kindWithVariants:", 2LL));
  BOOL v8 = (void *)v7;
  switch(a3)
  {
    case 1uLL:
      id v9 = v5;
      goto LABEL_12;
    case 2uLL:
    case 6uLL:
      id v9 = v4;
      goto LABEL_12;
    case 3uLL:
      v17[0] = v4;
      v17[1] = v6;
      v17[2] = v7;
      int v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v17, 3LL));
      unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue(+[MPModelPlaylistEntry kindWithKinds:](&OBJC_CLASS___MPModelPlaylistEntry, "kindWithKinds:", v11));

      id v10 = (void *)objc_claimAutoreleasedReturnValue( +[MPModelPlaylist kindWithVariants:playlistEntryKind:options:]( &OBJC_CLASS___MPModelPlaylist,  "kindWithVariants:playlistEntryKind:options:",  87LL,  v12,  0LL));
      break;
    case 4uLL:
      id v13 = &OBJC_CLASS___MPModelArtist;
      goto LABEL_8;
    case 5uLL:
      id v13 = (objc_class *)&OBJC_CLASS___MPModelComposer;
LABEL_8:
      id v9 = (id)objc_claimAutoreleasedReturnValue(-[objc_class kindWithAlbumKind:](v13, "kindWithAlbumKind:", v5));
      goto LABEL_12;
    case 7uLL:
      id v9 = (id)objc_claimAutoreleasedReturnValue(+[MPModelMovie kindWithVariants:](&OBJC_CLASS___MPModelMovie, "kindWithVariants:", 2LL));
      goto LABEL_12;
    case 8uLL:
      id v9 = v6;
      goto LABEL_12;
    case 9uLL:
      id v9 = (id)objc_claimAutoreleasedReturnValue(+[MPModelTVSeason kindWithEpisodeKind:](&OBJC_CLASS___MPModelTVSeason, "kindWithEpisodeKind:", v6));
LABEL_12:
      id v10 = v9;
      break;
    case 0xAuLL:
      id v16 = (void *)objc_claimAutoreleasedReturnValue(+[MPModelTVSeason kindWithEpisodeKind:](&OBJC_CLASS___MPModelTVSeason, "kindWithEpisodeKind:", v6));
      id v10 = (void *)objc_claimAutoreleasedReturnValue(+[MPModelTVShow kindWithSeasonKind:](&OBJC_CLASS___MPModelTVShow, "kindWithSeasonKind:", v16));

      break;
    default:
      id v10 = 0LL;
      break;
  }

  id v14 = v10;

  return v14;
}

+ (void)checkPrerequisitesAndPlayPlaybackIntent:(id)a3
{
  id v3 = a3;
  unint64_t v4 = (unint64_t)[v3 playbackType];
  id v5 = [v3 playbackAction];
  id v6 = (char *)[v3 firstItemType];
  if (v5) {
    goto LABEL_2;
  }
  id v9 = v6;
  if (![v3 isFirstTrackExplicit])
  {
    if ((v4 & 0xFFFFFFFFFFFFFFFELL) == 2
      && +[TVMusicRestrictionsUI isVideoRestricted](&OBJC_CLASS___TVMusicRestrictionsUI, "isVideoRestricted"))
    {
      BOOL v8 = (void *)objc_claimAutoreleasedReturnValue( +[TVMusicNowPlayingManager sharedInstance]( &OBJC_CLASS___TVMusicNowPlayingManager,  "sharedInstance"));
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472LL;
      v17[2] = sub_1000A0680;
      void v17[3] = &unk_100268CF0;
      uint64_t v7 = &v18;
      id v18 = v3;
      [v8 hideCurrentPlaybackControllerWithCompletion:v17];
LABEL_7:

      goto LABEL_8;
    }

    if ((unint64_t)(v9 - 7) <= 1)
    {
      id v10 = [v3 videoContentRating];
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472LL;
      v15[2] = sub_1000A0888;
      v15[3] = &unk_10026D038;
      uint64_t v7 = &v16;
      id v16 = v3;
      +[TVMusicRestrictionsUI presentRatingRestrictionAlertIfNeededOfType:forRating:completionBlock:]( &OBJC_CLASS___TVMusicRestrictionsUI,  "presentRatingRestrictionAlertIfNeededOfType:forRating:completionBlock:",  v9,  v10,  v15);
      goto LABEL_8;
    }

+ (id)_songsRequestForContainer:(id)a3
{
  return [a1 _songsRequestForContainer:a3 filterObject:0];
}

+ (id)_songsRequestForContainer:(id)a3 filterObject:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v8 = objc_opt_class(&OBJC_CLASS___MPModelPlaylist, v7);
  if ((objc_opt_isKindOfClass(v5, v8) & 1) != 0)
  {
    uint64_t v10 = objc_claimAutoreleasedReturnValue( +[TVMusicMPLibraryRequestFactory songsLibraryRequestForPlaylist:]( &OBJC_CLASS___TVMusicMPLibraryRequestFactory,  "songsLibraryRequestForPlaylist:",  v5));
LABEL_10:
    id v18 = (void *)v10;
    goto LABEL_11;
  }

  uint64_t v11 = objc_opt_class(&OBJC_CLASS___MPModelAlbum, v9);
  if ((objc_opt_isKindOfClass(v5, v11) & 1) != 0)
  {
    uint64_t v10 = objc_claimAutoreleasedReturnValue( +[TVMusicMPLibraryRequestFactory songsLibraryRequestForAlbum:]( &OBJC_CLASS___TVMusicMPLibraryRequestFactory,  "songsLibraryRequestForAlbum:",  v5));
    goto LABEL_10;
  }

  uint64_t v13 = objc_opt_class(&OBJC_CLASS___MPModelTVSeason, v12);
  if ((objc_opt_isKindOfClass(v5, v13) & 1) != 0)
  {
    id v15 = 0LL;
    id v16 = v5;
LABEL_9:
    uint64_t v10 = objc_claimAutoreleasedReturnValue( +[TVMusicMPLibraryRequestFactory TVEpisodesLibraryRequestForShow:season:]( &OBJC_CLASS___TVMusicMPLibraryRequestFactory,  "TVEpisodesLibraryRequestForShow:season:",  v15,  v16));
    goto LABEL_10;
  }

  uint64_t v17 = objc_opt_class(&OBJC_CLASS___MPModelTVShow, v14);
  if ((objc_opt_isKindOfClass(v5, v17) & 1) != 0)
  {
    id v15 = v5;
    id v16 = 0LL;
    goto LABEL_9;
  }

  id v18 = (void *)objc_claimAutoreleasedReturnValue( +[TVMusicMPLibraryRequestFactory songsLibraryRequest]( &OBJC_CLASS___TVMusicMPLibraryRequestFactory,  "songsLibraryRequest"));
  __int16 v23 = (void *)objc_claimAutoreleasedReturnValue(+[MPModelSong kindWithVariants:](&OBJC_CLASS___MPModelSong, "kindWithVariants:", 3LL));
  [v18 setItemKind:v23];

  if (v5)
  {
    id v26 = v5;
    __int16 v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v26, 1LL));
    [v18 setScopedContainers:v24];
  }

+ (void)_playVideoItemWithRequest:(id)a3 item:(id)a4
{
  id v6 = a3;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_1000A0DDC;
  v9[3] = &unk_10026D060;
  id v11 = a4;
  id v12 = a1;
  id v10 = v6;
  id v7 = v11;
  id v8 = v6;
  +[TVMusicRestrictionsUI presentVideoRestrictionAlertIfNeededWithCompletion:]( &OBJC_CLASS___TVMusicRestrictionsUI,  "presentVideoRestrictionAlertIfNeededWithCompletion:",  v9);
}

+ (void)_playWithPlaybackIntent:(id)a3 initialPlaybackType:(unint64_t)a4 playbackAction:(unint64_t)a5 checkSubscriptionStatus:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a3;
  if (v10)
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue(+[TVMusicPlayerManager defaultPlayer](&OBJC_CLASS___TVMusicPlayerManager, "defaultPlayer"));
    id v12 = v11;
    if (a5)
    {
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v11 playQueue]);
      [v13 addToPlayQueueWithPlaybackIntent:v10 playAction:a5];
    }

    else if (!v6 {
           || ([a1 _isRemotePlaybackAuthorized] & 1) != 0
    }
           || ([a1 _isPlayingOnLocalDevice] & 1) != 0)
    {
      id v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
      id v16 = (void *)objc_claimAutoreleasedReturnValue([v15 UUIDString]);

      uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v12 playQueue]);
      v25[0] = _NSConcreteStackBlock;
      v25[1] = 3221225472LL;
      v25[2] = sub_1000A1084;
      v25[3] = &unk_10026A408;
      id v18 = v10;
      id v26 = v18;
      [v17 replacePlayQueueWithPlaybackIntent:v18 commandIdentifier:v16 completionHandler:v25];

      __int16 v19 = (void *)objc_claimAutoreleasedReturnValue([v12 playQueue]);
      LODWORD(v18) = [v19 canAddToEndOfUpNextWithPlaybackIntent:v18];

      id v20 = sub_10009F114();
      __int16 v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
      BOOL v22 = os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT);
      if ((_DWORD)v18)
      {
        if (v22)
        {
          *(_WORD *)__int16 v24 = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "Delaying display of Now Playing",  v24,  2u);
        }

        [a1 _observeMediaPlayerCommandCompletionWithIdentifier:v16 playbackType:a4];
      }

      else
      {
        if (v22)
        {
          *(_WORD *)__int16 v24 = 0;
          _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Showing Now Playing", v24, 2u);
        }

        __int16 v23 = (void *)objc_claimAutoreleasedReturnValue( +[TVMusicNowPlayingManager sharedInstance]( &OBJC_CLASS___TVMusicNowPlayingManager,  "sharedInstance"));
        [v23 showPlaybackControllerWithInitialPlaybackType:a4];

        [a1 _removeMediaPlayerCommandCompletionObserver];
      }
    }

    else
    {
      [a1 _playUsingAirPlayWithPlaybackIntent:v10 initialPlaybackType:a4 playbackAction:0];
    }
  }

  else
  {
    id v14 = sub_10009F114();
    id v12 = (void *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled((os_log_t)v12, OS_LOG_TYPE_ERROR)) {
      sub_1001B9B90((os_log_t)v12);
    }
  }
}

+ (void)_removeMediaPlayerCommandCompletionObserver
{
}

+ (void)_observeMediaPlayerCommandCompletionWithIdentifier:(id)a3 playbackType:(unint64_t)a4
{
  id v5 = a3;
  if (qword_1002BEB40)
  {
    BOOL v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v6 removeObserver:qword_1002BEB40];

    id v7 = (void *)qword_1002BEB40;
    qword_1002BEB40 = 0LL;
  }

  if (v5)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSNotification mediaPlayerCommandCompletion]( &OBJC_CLASS___NSNotification,  "mediaPlayerCommandCompletion"));
    id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSOperationQueue mainQueue](&OBJC_CLASS___NSOperationQueue, "mainQueue"));
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_1000A127C;
    v13[3] = &unk_10026D088;
    id v14 = v5;
    unint64_t v15 = a4;
    uint64_t v11 = objc_claimAutoreleasedReturnValue([v8 addObserverForName:v9 object:0 queue:v10 usingBlock:v13]);
    id v12 = (void *)qword_1002BEB40;
    qword_1002BEB40 = v11;
  }
}

+ (void)_playUsingAirPlayWithPlaybackIntent:(id)a3 initialPlaybackType:(unint64_t)a4 playbackAction:(unint64_t)a5
{
  id v8 = a3;
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[TVMusicPlayerManager defaultPlayer](&OBJC_CLASS___TVMusicPlayerManager, "defaultPlayer"));
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 playQueue]);

  id v11 = [[MPAVRoutingController alloc] initWithName:@"TVMusicPlaybackHelper"];
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v10 audioRoute]);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_1000A16EC;
  v15[3] = &unk_10026D0B0;
  id v16 = v10;
  id v17 = v8;
  id v18 = a1;
  unint64_t v19 = a4;
  unint64_t v20 = a5;
  id v13 = v8;
  id v14 = v10;
  [v11 selectRoute:v12 operation:0 completion:v15];
}

+ (void)_playRequestWithItemType:(unint64_t)a3 requestBlock:(id)a4
{
  id v5 = (void (**)(id, void *, uint64_t, void *))a4;
  switch(a3)
  {
    case 1uLL:
      uint64_t v6 = objc_claimAutoreleasedReturnValue( +[TVMusicMPLibraryRequestFactory albumsLibraryRequest]( &OBJC_CLASS___TVMusicMPLibraryRequestFactory,  "albumsLibraryRequest"));
      goto LABEL_10;
    case 2uLL:
      uint64_t v12 = objc_claimAutoreleasedReturnValue( +[TVMusicMPLibraryRequestFactory songsLibraryRequest]( &OBJC_CLASS___TVMusicMPLibraryRequestFactory,  "songsLibraryRequest"));
      goto LABEL_14;
    case 3uLL:
      uint64_t v6 = objc_claimAutoreleasedReturnValue( +[TVMusicMPLibraryRequestFactory playlistsLibraryRequestWithParentPlaylistFolder:]( &OBJC_CLASS___TVMusicMPLibraryRequestFactory,  "playlistsLibraryRequestWithParentPlaylistFolder:",  0LL));
      goto LABEL_10;
    case 4uLL:
      uint64_t v6 = objc_claimAutoreleasedReturnValue( +[TVMusicMPLibraryRequestFactory artistsLibraryRequest]( &OBJC_CLASS___TVMusicMPLibraryRequestFactory,  "artistsLibraryRequest"));
      goto LABEL_10;
    case 5uLL:
      uint64_t v6 = objc_claimAutoreleasedReturnValue( +[TVMusicMPLibraryRequestFactory composersLibraryRequest]( &OBJC_CLASS___TVMusicMPLibraryRequestFactory,  "composersLibraryRequest"));
LABEL_10:
      id v11 = (void *)v6;
      uint64_t v9 = 0LL;
      goto LABEL_18;
    case 6uLL:
      uint64_t v12 = objc_claimAutoreleasedReturnValue( +[TVMusicMPLibraryRequestFactory musicVideosLibraryRequest]( &OBJC_CLASS___TVMusicMPLibraryRequestFactory,  "musicVideosLibraryRequest"));
      goto LABEL_14;
    case 7uLL:
      uint64_t v12 = objc_claimAutoreleasedReturnValue( +[TVMusicMPLibraryRequestFactory moviesLibraryRequest]( &OBJC_CLASS___TVMusicMPLibraryRequestFactory,  "moviesLibraryRequest"));
      goto LABEL_14;
    case 8uLL:
      uint64_t v12 = objc_claimAutoreleasedReturnValue( +[TVMusicMPLibraryRequestFactory TVEpisodesLibraryRequestForShow:season:]( &OBJC_CLASS___TVMusicMPLibraryRequestFactory,  "TVEpisodesLibraryRequestForShow:season:",  0LL,  0LL));
LABEL_14:
      id v11 = (void *)v12;
      uint64_t v9 = 0LL;
      uint64_t v10 = 0LL;
      break;
    case 9uLL:
      id v11 = (void *)objc_claimAutoreleasedReturnValue( +[TVMusicMPLibraryRequestFactory TVSeasonsLibraryRequestForShow:]( &OBJC_CLASS___TVMusicMPLibraryRequestFactory,  "TVSeasonsLibraryRequestForShow:",  0LL));
      id v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSSortDescriptor sortDescriptorWithKey:ascending:]( &OBJC_CLASS___NSSortDescriptor,  "sortDescriptorWithKey:ascending:",  MPModelPropertyTVEpisodeLibraryAddedDate,  0LL));
      v21[0] = v13;
      id v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSSortDescriptor sortDescriptorWithKey:ascending:]( &OBJC_CLASS___NSSortDescriptor,  "sortDescriptorWithKey:ascending:",  MPModelPropertyTVEpisodeReleaseDate,  0LL));
      v21[1] = v14;
      unint64_t v15 = v21;
      goto LABEL_17;
    case 0xAuLL:
      id v11 = (void *)objc_claimAutoreleasedReturnValue( +[TVMusicMPLibraryRequestFactory TVShowsLibraryRequest]( &OBJC_CLASS___TVMusicMPLibraryRequestFactory,  "TVShowsLibraryRequest"));
      id v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSSortDescriptor sortDescriptorWithKey:ascending:]( &OBJC_CLASS___NSSortDescriptor,  "sortDescriptorWithKey:ascending:",  MPModelPropertyTVEpisodeLibraryAddedDate,  0LL));
      v20[0] = v13;
      id v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSSortDescriptor sortDescriptorWithKey:ascending:]( &OBJC_CLASS___NSSortDescriptor,  "sortDescriptorWithKey:ascending:",  MPModelPropertyTVEpisodeReleaseDate,  0LL));
      v20[1] = v14;
      unint64_t v15 = v20;
LABEL_17:
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v15, 2LL));

LABEL_18:
      uint64_t v10 = 1LL;
      break;
    default:
      id v7 = sub_10009F114();
      id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        int v16 = 136315394;
        id v17 = "+[TVMusicPlaybackHelper _playRequestWithItemType:requestBlock:]";
        __int16 v18 = 2080;
        unint64_t v19 = "+[TVMusicPlaybackHelper _playRequestWithItemType:requestBlock:]";
        _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "%s: %s: Unknown playback type",  (uint8_t *)&v16,  0x16u);
      }

      uint64_t v9 = 0LL;
      uint64_t v10 = 0LL;
      id v11 = 0LL;
      break;
  }

  v5[2](v5, v11, v10, v9);
}

+ (void)_playLibraryItemWithRequest:(id)a3 identifiers:(id)a4 playbackType:(unint64_t)a5
{
  id v11 = a4;
  id v8 = a4;
  id v9 = a3;
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v11, 1LL));
  objc_msgSend(v9, "setAllowedItemIdentifiers:", v10, v11);

  [a1 _playSongsWithRequest:v9 startIdentifiers:v8 shuffle:0 initialPlaybackType:a5];
}

+ (void)_playSongsWithRequest:(id)a3 startIdentifiers:(id)a4 shuffle:(BOOL)a5 initialPlaybackType:(unint64_t)a6
{
  BOOL v7 = a5;
  id v10 = a4;
  id v11 = a3;
  id v12 = sub_10009F114();
  id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    id v14 = @"NO";
    int v16 = 136316162;
    __int16 v18 = 2080;
    id v17 = "+[TVMusicPlaybackHelper _playSongsWithRequest:startIdentifiers:shuffle:initialPlaybackType:]";
    unint64_t v19 = "+[TVMusicPlaybackHelper _playSongsWithRequest:startIdentifiers:shuffle:initialPlaybackType:]";
    if (v7) {
      id v14 = @"YES";
    }
    __int16 v20 = 2112;
    id v21 = v10;
    __int16 v22 = 2112;
    __int16 v23 = v14;
    __int16 v24 = 2048;
    unint64_t v25 = a6;
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "%s: %s: start IDs: %@, shuffle: %@, playback type: %ld",  (uint8_t *)&v16,  0x34u);
  }

  unint64_t v15 = -[TVMusicPlaybackIntent initWithRequest:shuffle:startItemIdentifiers:]( objc_alloc(&OBJC_CLASS___TVMusicPlaybackIntent),  "initWithRequest:shuffle:startItemIdentifiers:",  v11,  v7,  v10);
  -[TVMusicPlaybackIntent setPlaybackType:](v15, "setPlaybackType:", a6);
  [a1 playWithPlaybackIntent:v15];
}

+ (void)_playSongsWithRequest:(id)a3 playbackAction:(unint64_t)a4
{
}

+ (void)_playSongsWithRequest:(id)a3 playbackAction:(unint64_t)a4 initialPlaybackType:(unint64_t)a5
{
  id v8 = a3;
  if (a4)
  {
    id v9 = sub_10009F114();
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      id v11 = (void *)objc_claimAutoreleasedReturnValue( +[TVMusicPlaybackIntent playbackActionStringFromType:]( &OBJC_CLASS___TVMusicPlaybackIntent,  "playbackActionStringFromType:",  a4));
      int v16 = 136315650;
      id v17 = "+[TVMusicPlaybackHelper _playSongsWithRequest:playbackAction:initialPlaybackType:]";
      __int16 v18 = 2080;
      unint64_t v19 = "+[TVMusicPlaybackHelper _playSongsWithRequest:playbackAction:initialPlaybackType:]";
      __int16 v20 = 2112;
      id v21 = v11;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "%s: %s: Queue songs with action type: %@",  (uint8_t *)&v16,  0x20u);
    }

    id v12 = (void *)objc_claimAutoreleasedReturnValue([v8 playbackIntentWithStartItemIdentifiers:0]);
    id v13 = (void *)objc_claimAutoreleasedReturnValue([a1 _currentFeatureName]);
    [v12 setPlayActivityFeatureName:v13];

    id v14 = (void *)objc_claimAutoreleasedReturnValue(+[TVMusicPlayerManager defaultPlayer](&OBJC_CLASS___TVMusicPlayerManager, "defaultPlayer"));
    unint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v14 playQueue]);
    [v15 addToPlayQueueWithPlaybackIntent:v12 playAction:a4];

    id v8 = v12;
  }

  else
  {
    [a1 _playSongsWithRequest:v8 startIdentifiers:0 shuffle:0 initialPlaybackType:a5];
  }
}

+ (BOOL)_isVideoItemType:(unint64_t)a3
{
  return a3 - 6 < 5;
}

+ (BOOL)_isRemotePlaybackAuthorized
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[TVMSubscriptionManager sharedInstance](&OBJC_CLASS___TVMSubscriptionManager, "sharedInstance"));
  if ([v2 hasMusicSubscription])
  {
    unsigned __int8 v3 = 1;
  }

  else
  {
    unint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[TVMSubscriptionManager sharedInstance](&OBJC_CLASS___TVMSubscriptionManager, "sharedInstance"));
    unsigned __int8 v3 = [v4 hasPlaybackRestrictions];
  }

  return v3;
}

+ (BOOL)_isPlayingOnLocalDevice
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[TVMusicPlayerManager defaultPlayer](&OBJC_CLASS___TVMusicPlayerManager, "defaultPlayer"));
  unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue([v2 playQueue]);
  unsigned __int8 v4 = [v3 isLocalDeviceQueue];

  return v4;
}

+ (id)_stringForItemType:(unint64_t)a3
{
  if (a3 >= 0xE) {
    return (id)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<Undefined type: %ld>",  a3));
  }
  else {
    return *(&off_10026D0F0 + a3);
  }
}

+ (id)_currentFeatureName
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[TVMusicLibraryUITracker sharedTracker](&OBJC_CLASS___TVMusicLibraryUITracker, "sharedTracker"));
  unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue([v2 currentPAFFeatureName]);

  if (!v3)
  {
    unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue(+[TVMusicAppDelegate theApp](&OBJC_CLASS___TVMusicAppDelegate, "theApp"));
    unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue([v4 itmlPageFeatureName]);
  }

  return v3;
}

@end
@interface UIAction
+ (id)_tvh_player;
+ (id)_tvh_playerPlaylist;
+ (id)_tvh_rootViewController;
+ (id)tvh_gotoAlbumActionWithMediaItem:(id)a3;
+ (id)tvh_gotoAlbumArtistActionWithMediaItem:(id)a3;
+ (id)tvh_playLaterActionWithMediaItem:(id)a3;
+ (id)tvh_playLaterActionWithMediaItems:(id)a3 title:(id)a4;
+ (id)tvh_playNextActionWithMediaItem:(id)a3;
+ (id)tvh_playNextActionWithMediaItems:(id)a3 title:(id)a4;
@end

@implementation UIAction

+ (id)tvh_gotoAlbumActionWithMediaItem:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 localizedStringForKey:@"GOTO_ALBUM_TITLE" value:0 table:0]);

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_100007300;
  v10[3] = &unk_1000FCE50;
  id v11 = v4;
  id v12 = a1;
  id v7 = v4;
  v8 = (void *)objc_claimAutoreleasedReturnValue( +[UIAction actionWithTitle:image:identifier:handler:]( &OBJC_CLASS___UIAction,  "actionWithTitle:image:identifier:handler:",  v6,  0LL,  0LL,  v10));

  return v8;
}

+ (id)tvh_gotoAlbumArtistActionWithMediaItem:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 localizedStringForKey:@"GOTO_ALBUM_ARTIST_TITLE" value:0 table:0]);

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_100007420;
  v10[3] = &unk_1000FCE50;
  id v11 = v4;
  id v12 = a1;
  id v7 = v4;
  v8 = (void *)objc_claimAutoreleasedReturnValue( +[UIAction actionWithTitle:image:identifier:handler:]( &OBJC_CLASS___UIAction,  "actionWithTitle:image:identifier:handler:",  v6,  0LL,  0LL,  v10));

  return v8;
}

+ (id)tvh_playNextActionWithMediaItem:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 type]);
  id v6 = [v5 mediaCategoryType];

  if (v6 == (id)8)
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    v9 = v11;
    v10 = @"PLAY_AUDIOBOOKS_NEXT_TITLE";
  }

  else
  {
    if (v6 == (id)7)
    {
      id v12 = (void *)objc_claimAutoreleasedReturnValue([v4 type]);
      id v13 = [v12 mediaItemType];

      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
      if (v13 == (id)2) {
        v10 = @"PLAY_ITUNESU_VIDEO_NEXT_TITLE";
      }
      else {
        v10 = @"PLAY_ITUNESU_AUDIO_NEXT_TITLE";
      }
    }

    else if (v6 == (id)6)
    {
      id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 type]);
      id v8 = [v7 mediaItemType];

      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
      if (v8 == (id)2) {
        v10 = @"PLAY_PODCASTS_VIDEO_NEXT_TITLE";
      }
      else {
        v10 = @"PLAY_PODCASTS_AUDIO_NEXT_TITLE";
      }
    }

    else
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue([v4 type]);
      id v15 = [v14 mediaItemType];

      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
      if (v15 == (id)2) {
        v10 = @"PLAY_MUSIC_VIDEO_NEXT_TITLE";
      }
      else {
        v10 = @"PLAY_MUSIC_AUDIO_NEXT_TITLE";
      }
    }

    id v11 = v9;
  }

  v16 = (void *)objc_claimAutoreleasedReturnValue([v11 localizedStringForKey:v10 value:0 table:0]);

  id v20 = v4;
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v20, 1LL));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "tvh_playNextActionWithMediaItems:title:", v17, v16));

  return v18;
}

+ (id)tvh_playNextActionWithMediaItems:(id)a3 title:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 firstObject]);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "tvh_mediaLibrary"));

  if (v9)
  {
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_100007758;
    v12[3] = &unk_1000FCE78;
    id v15 = a1;
    id v13 = v6;
    id v14 = v9;
    v10 = (void *)objc_claimAutoreleasedReturnValue( +[UIAction actionWithTitle:image:identifier:handler:]( &OBJC_CLASS___UIAction,  "actionWithTitle:image:identifier:handler:",  v7,  0LL,  0LL,  v12));
  }

  else
  {
    v10 = 0LL;
  }

  return v10;
}

+ (id)tvh_playLaterActionWithMediaItem:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 type]);
  id v6 = [v5 mediaCategoryType];

  if (v6 == (id)8)
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    v9 = v11;
    v10 = @"PLAY_AUDIOBOOKS_LAST_TITLE";
  }

  else
  {
    if (v6 == (id)7)
    {
      id v12 = (void *)objc_claimAutoreleasedReturnValue([v4 type]);
      id v13 = [v12 mediaItemType];

      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
      if (v13 == (id)2) {
        v10 = @"PLAY_ITUNESU_VIDEO_LAST_TITLE";
      }
      else {
        v10 = @"PLAY_ITUNESU_AUDIO_LAST_TITLE";
      }
    }

    else if (v6 == (id)6)
    {
      id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 type]);
      id v8 = [v7 mediaItemType];

      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
      if (v8 == (id)2) {
        v10 = @"PLAY_PODCASTS_VIDEO_LAST_TITLE";
      }
      else {
        v10 = @"PLAY_PODCASTS_AUDIO_LAST_TITLE";
      }
    }

    else
    {
      id v14 = (void *)objc_claimAutoreleasedReturnValue([v4 type]);
      id v15 = [v14 mediaItemType];

      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
      if (v15 == (id)2) {
        v10 = @"PLAY_MUSIC_VIDEO_LAST_TITLE";
      }
      else {
        v10 = @"PLAY_MUSIC_AUDIO_LAST_TITLE";
      }
    }

    id v11 = v9;
  }

  v16 = (void *)objc_claimAutoreleasedReturnValue([v11 localizedStringForKey:v10 value:0 table:0]);

  id v20 = v4;
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v20, 1LL));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "tvh_playLaterActionWithMediaItems:title:", v17, v16));

  return v18;
}

+ (id)tvh_playLaterActionWithMediaItems:(id)a3 title:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 firstObject]);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "tvh_mediaLibrary"));

  if (v9)
  {
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_100007AA8;
    v12[3] = &unk_1000FCE78;
    id v15 = a1;
    id v13 = v6;
    id v14 = v9;
    v10 = (void *)objc_claimAutoreleasedReturnValue( +[UIAction actionWithTitle:image:identifier:handler:]( &OBJC_CLASS___UIAction,  "actionWithTitle:image:identifier:handler:",  v7,  0LL,  0LL,  v12));
  }

  else
  {
    v10 = 0LL;
  }

  return v10;
}

+ (id)_tvh_rootViewController
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( +[TVHApplicationDelegate sharedApplicationDelegate]( &OBJC_CLASS___TVHApplicationDelegate,  "sharedApplicationDelegate"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 mainSceneDelegate]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 rootViewController]);

  return v4;
}

+ (id)_tvh_player
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( +[TVHApplicationDelegate sharedApplicationDelegate]( &OBJC_CLASS___TVHApplicationDelegate,  "sharedApplicationDelegate"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 mainSceneDelegate]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 rootViewController]);

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "tvh_playbackManager"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 interactivePlaylistPlayer]);

  return v6;
}

+ (id)_tvh_playerPlaylist
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_tvh_player"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 playlist]);
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___TVHPlayerPlaylist);
  id v5 = v3;
  id v6 = v5;
  if (v4)
  {
    if ((objc_opt_isKindOfClass(v5, v4) & 1) != 0) {
      id v7 = v6;
    }
    else {
      id v7 = 0LL;
    }
  }

  else
  {
    id v7 = 0LL;
  }

  id v8 = v7;

  return v8;
}

@end
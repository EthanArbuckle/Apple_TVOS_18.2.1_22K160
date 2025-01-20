@interface UIAlertController
+ (id)tvh_mediaItemContextMenuAlertControllerWithMediaItem:(id)a3 mediaLibrary:(id)a4 navigationController:(id)a5 options:(unint64_t)a6;
+ (id)tvh_moreAlertControllerWithMediaEntityCollection:(id)a3 mediaItems:(id)a4 mediaLibrary:(id)a5 player:(id)a6;
+ (id)tvh_sortOptionAlertControllerWithSortOptions:(id)a3 currentSortOptionIndex:(unint64_t)a4 completionHandler:(id)a5;
+ (void)_tvh_mediaItemContextMenuButtonTitlesWithMediaItem:(id)a3 outPlayNextTitle:(id *)a4 outPlayLaterTitle:(id *)a5;
@end

@implementation UIAlertController

+ (id)tvh_mediaItemContextMenuAlertControllerWithMediaItem:(id)a3 mediaLibrary:(id)a4 navigationController:(id)a5 options:(unint64_t)a6
{
  char v6 = a6;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v13 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  v14 = &AKAuthenticationPasswordKey_ptr;
  if ((v6 & 1) != 0)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    v16 = (void *)objc_claimAutoreleasedReturnValue([v15 localizedStringForKey:@"GOTO_ALBUM_TITLE" value:0 table:0]);

    v77[0] = _NSConcreteStackBlock;
    v77[1] = 3221225472LL;
    v77[2] = sub_100058438;
    v77[3] = &unk_1000FE3C0;
    id v78 = v10;
    id v79 = v11;
    id v80 = v12;
    v17 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v16,  0LL,  v77));
    -[NSMutableArray addObject:](v13, "addObject:", v17);
  }

  if ((v6 & 2) != 0)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    v19 = (void *)objc_claimAutoreleasedReturnValue([v18 localizedStringForKey:@"GOTO_ALBUM_ARTIST_TITLE" value:0 table:0]);

    v73[0] = _NSConcreteStackBlock;
    v73[1] = 3221225472LL;
    v73[2] = sub_1000584A4;
    v73[3] = &unk_1000FE3C0;
    id v74 = v10;
    id v75 = v11;
    id v76 = v12;
    v20 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v19,  0LL,  v73));
    -[NSMutableArray addObject:](v13, "addObject:", v20);
  }

  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "tvh_playbackManager"));
  v22 = (void *)objc_claimAutoreleasedReturnValue([v21 interactivePlaylistPlayer]);

  v23 = (void *)objc_claimAutoreleasedReturnValue([v22 playlist]);
  uint64_t v24 = objc_opt_class(&OBJC_CLASS___TVHPlayerPlaylist);
  id v25 = v23;
  v26 = v25;
  v57 = v12;
  if (v24)
  {
    if ((objc_opt_isKindOfClass(v25, v24) & 1) != 0) {
      v27 = v26;
    }
    else {
      v27 = 0LL;
    }
  }

  else
  {
    v27 = 0LL;
  }

  id v28 = v27;

  id v29 = (id)objc_claimAutoreleasedReturnValue([v22 state]);
  uint64_t v30 = objc_claimAutoreleasedReturnValue(+[TVPPlaybackState stopped](&OBJC_CLASS___TVPPlaybackState, "stopped"));
  v56 = v22;
  v58 = v28;
  if (v29 == (id)v30)
  {
    id v33 = v29;
  }

  else
  {
    v31 = (void *)v30;
    unsigned int v32 = [v28 canItemsBeAdded];

    if (!v32) {
      goto LABEL_15;
    }
    id v71 = 0LL;
    id v72 = 0LL;
    objc_msgSend( a1,  "_tvh_mediaItemContextMenuButtonTitlesWithMediaItem:outPlayNextTitle:outPlayLaterTitle:",  v10,  &v72,  &v71);
    id v33 = v72;
    id v29 = v71;
    v67[0] = _NSConcreteStackBlock;
    v67[1] = 3221225472LL;
    v67[2] = sub_100058510;
    v67[3] = &unk_1000FE3C0;
    id v34 = v58;
    id v68 = v34;
    id v35 = v10;
    id v69 = v35;
    id v36 = v11;
    id v37 = v11;
    id v70 = v37;
    v38 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v33,  0LL,  v67));
    -[NSMutableArray addObject:](v13, "addObject:", v38);
    v63[0] = _NSConcreteStackBlock;
    v63[1] = 3221225472LL;
    v63[2] = sub_1000585BC;
    v63[3] = &unk_1000FE3C0;
    id v64 = v34;
    id v65 = v35;
    id v39 = v37;
    id v11 = v36;
    v22 = v56;
    id v66 = v39;
    v14 = &AKAuthenticationPasswordKey_ptr;
    v40 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v29,  0LL,  v63));
    -[NSMutableArray addObject:](v13, "addObject:", v40);
  }

LABEL_15:
  if (-[NSMutableArray count](v13, "count"))
  {
    id v54 = v11;
    v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "tvh_displayTitle"));
    v42 = (void *)objc_claimAutoreleasedReturnValue([v10 artistTitle]);
    id v55 = v10;
    if ([v42 length])
    {
      v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
      v44 = (void *)objc_claimAutoreleasedReturnValue( [v43 localizedStringForKey:@"MEDIA_ITEM_CONTEXT_MENU_TITLE_FORMAT" value:0 table:0]);

      id v45 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v44, v41, v42));
    }

    else
    {
      id v45 = v41;
    }

    v47 = (void *)objc_claimAutoreleasedReturnValue([v14[179] actionWithTitle:0 style:1 handler:0]);
    -[NSMutableArray addObject:](v13, "addObject:", v47);
    v46 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertController alertControllerWithTitle:message:preferredStyle:]( &OBJC_CLASS___UIAlertController,  "alertControllerWithTitle:message:preferredStyle:",  v45,  0LL,  0LL));
    __int128 v59 = 0u;
    __int128 v60 = 0u;
    __int128 v61 = 0u;
    __int128 v62 = 0u;
    v48 = v13;
    id v49 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v48,  "countByEnumeratingWithState:objects:count:",  &v59,  v81,  16LL);
    if (v49)
    {
      id v50 = v49;
      uint64_t v51 = *(void *)v60;
      do
      {
        v52 = 0LL;
        do
        {
          if (*(void *)v60 != v51) {
            objc_enumerationMutation(v48);
          }
          [v46 addAction:*(void *)(*((void *)&v59 + 1) + 8 * (void)v52)];
          v52 = (char *)v52 + 1;
        }

        while (v50 != v52);
        id v50 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v48,  "countByEnumeratingWithState:objects:count:",  &v59,  v81,  16LL);
      }

      while (v50);
    }

    id v11 = v54;
    id v10 = v55;
    v22 = v56;
  }

  else
  {
    v46 = 0LL;
  }

  return v46;
}

+ (id)tvh_moreAlertControllerWithMediaEntityCollection:(id)a3 mediaItems:(id)a4 mediaLibrary:(id)a5 player:(id)a6
{
  id v33 = a4;
  id v9 = a5;
  id v10 = a6;
  id v11 = a3;
  id v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "tvh_displayTitle"));
  v13 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertController alertControllerWithTitle:message:preferredStyle:]( &OBJC_CLASS___UIAlertController,  "alertControllerWithTitle:message:preferredStyle:",  v12,  0LL,  0LL));

  v14 = (void *)objc_claimAutoreleasedReturnValue([v11 type]);
  id v15 = [v14 mediaEntityCollectionType];

  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle", v33));
  if (v15 == (id)5)
  {
    uint64_t v17 = objc_claimAutoreleasedReturnValue([v16 localizedStringForKey:@"PLAY_PLAYLIST_NEXT_TITLE" value:0 table:0]);

    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    v19 = v18;
    v20 = @"PLAY_PLAYLIST_LAST_TITLE";
  }

  else
  {
    uint64_t v17 = objc_claimAutoreleasedReturnValue([v16 localizedStringForKey:@"PLAY_ALBUM_NEXT_TITLE" value:0 table:0]);

    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    v19 = v18;
    v20 = @"PLAY_ALBUM_LAST_TITLE";
  }

  id v35 = (void *)objc_claimAutoreleasedReturnValue([v18 localizedStringForKey:v20 value:0 table:0]);

  v40[0] = _NSConcreteStackBlock;
  v40[1] = 3221225472LL;
  v40[2] = sub_100058964;
  v40[3] = &unk_1000FE3C0;
  id v21 = v10;
  id v41 = v21;
  id v22 = v34;
  id v42 = v22;
  id v23 = v9;
  id v43 = v23;
  uint64_t v24 = (void *)v17;
  id v25 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v17,  0LL,  v40));
  [v13 addAction:v25];
  v26 = v13;
  v36[0] = _NSConcreteStackBlock;
  v36[1] = 3221225472LL;
  v36[2] = sub_1000589C0;
  v36[3] = &unk_1000FE3C0;
  id v37 = v21;
  id v38 = v22;
  id v39 = v23;
  id v27 = v23;
  id v28 = v22;
  id v29 = v21;
  uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v35,  0LL,  v36));
  [v13 addAction:v30];
  v31 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  0LL,  1LL,  0LL));
  [v26 addAction:v31];

  return v26;
}

+ (id)tvh_sortOptionAlertControllerWithSortOptions:(id)a3 currentSortOptionIndex:(unint64_t)a4 completionHandler:(id)a5
{
  id v7 = a5;
  id v8 = a3;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 localizedStringForKey:@"SORT_BY_TITLE" value:0 table:0]);

  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_100058B68;
  v16[3] = &unk_1000FE410;
  id v18 = v7;
  unint64_t v19 = a4;
  id v11 = (id)objc_claimAutoreleasedReturnValue( +[UIAlertController alertControllerWithTitle:message:preferredStyle:]( &OBJC_CLASS___UIAlertController,  "alertControllerWithTitle:message:preferredStyle:",  v10,  0LL,  0LL));
  id v17 = v11;
  id v12 = v7;
  [v8 enumerateObjectsUsingBlock:v16];

  v13 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  0LL,  1LL,  0LL));
  [v11 addAction:v13];
  id v14 = v11;

  return v14;
}

+ (void)_tvh_mediaItemContextMenuButtonTitlesWithMediaItem:(id)a3 outPlayNextTitle:(id *)a4 outPlayLaterTitle:(id *)a5
{
  id v29 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v29 type]);
  id v8 = [v7 mediaCategoryType];

  if (v8 == (id)8)
  {
    id v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    v13 = (void *)objc_claimAutoreleasedReturnValue( [v17 localizedStringForKey:@"PLAY_AUDIOBOOKS_NEXT_TITLE" value:0 table:0]);

    id v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    id v15 = v14;
    v16 = @"PLAY_AUDIOBOOKS_LAST_TITLE";
  }

  else if (v8 == (id)7)
  {
    id v18 = (void *)objc_claimAutoreleasedReturnValue([v29 type]);
    id v19 = [v18 mediaItemType];

    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    id v21 = v20;
    if (v19 == (id)2)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue( [v20 localizedStringForKey:@"PLAY_ITUNESU_VIDEO_NEXT_TITLE" value:0 table:0]);

      id v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
      id v15 = v14;
      v16 = @"PLAY_ITUNESU_VIDEO_LAST_TITLE";
    }

    else
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue( [v20 localizedStringForKey:@"PLAY_ITUNESU_AUDIO_NEXT_TITLE" value:0 table:0]);

      id v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
      id v15 = v14;
      v16 = @"PLAY_ITUNESU_AUDIO_LAST_TITLE";
    }
  }

  else if (v8 == (id)6)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v29 type]);
    id v10 = [v9 mediaItemType];

    id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    id v12 = v11;
    if (v10 == (id)2)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue( [v11 localizedStringForKey:@"PLAY_PODCASTS_VIDEO_NEXT_TITLE" value:0 table:0]);

      id v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
      id v15 = v14;
      v16 = @"PLAY_PODCASTS_VIDEO_LAST_TITLE";
    }

    else
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue( [v11 localizedStringForKey:@"PLAY_PODCASTS_AUDIO_NEXT_TITLE" value:0 table:0]);

      id v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
      id v15 = v14;
      v16 = @"PLAY_PODCASTS_AUDIO_LAST_TITLE";
    }
  }

  else
  {
    id v22 = (void *)objc_claimAutoreleasedReturnValue([v29 type]);
    id v23 = [v22 mediaItemType];

    uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    id v25 = v24;
    if (v23 == (id)2)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue( [v24 localizedStringForKey:@"PLAY_MUSIC_VIDEO_NEXT_TITLE" value:0 table:0]);

      id v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
      id v15 = v14;
      v16 = @"PLAY_MUSIC_VIDEO_LAST_TITLE";
    }

    else
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue( [v24 localizedStringForKey:@"PLAY_MUSIC_AUDIO_NEXT_TITLE" value:0 table:0]);

      id v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
      id v15 = v14;
      v16 = @"PLAY_MUSIC_AUDIO_LAST_TITLE";
    }
  }

  v26 = (void *)objc_claimAutoreleasedReturnValue([v14 localizedStringForKey:v16 value:0 table:0]);

  id v27 = v13;
  *a4 = v27;
  id v28 = v26;
  *a5 = v28;
}

@end
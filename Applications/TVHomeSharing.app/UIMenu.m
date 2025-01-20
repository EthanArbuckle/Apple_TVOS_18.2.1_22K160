@interface UIMenu
+ (id)_tvh_contextMenuActionsWithMediaItem:(id)a3 options:(unint64_t)a4;
+ (id)_tvh_player;
+ (id)tvh_contextMenuWithMediaItem:(id)a3 options:(unint64_t)a4;
@end

@implementation UIMenu

+ (id)tvh_contextMenuWithMediaItem:(id)a3 options:(unint64_t)a4
{
  id v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_tvh_contextMenuActionsWithMediaItem:options:", v6, a4));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "tvh_displayTitle"));
  v9 = (void *)objc_claimAutoreleasedReturnValue([v6 artistTitle]);

  if ([v9 length])
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    v11 = (void *)objc_claimAutoreleasedReturnValue( [v10 localizedStringForKey:@"MEDIA_ITEM_CONTEXT_MENU_TITLE_FORMAT" value:0 table:0]);

    id v12 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v11, v8, v9));
  }

  else
  {
    id v12 = v8;
  }

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIMenu menuWithTitle:children:](&OBJC_CLASS___UIMenu, "menuWithTitle:children:", v12, v7));

  return v13;
}

+ (id)_tvh_contextMenuActionsWithMediaItem:(id)a3 options:(unint64_t)a4
{
  char v4 = a4;
  id v6 = a3;
  v7 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  if ((v4 & 1) != 0)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue( +[UIAction tvh_gotoAlbumActionWithMediaItem:]( &OBJC_CLASS___UIAction,  "tvh_gotoAlbumActionWithMediaItem:",  v6));
    -[NSMutableArray addObject:](v7, "addObject:", v8);
  }

  if ((v4 & 2) != 0)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue( +[UIAction tvh_gotoAlbumArtistActionWithMediaItem:]( &OBJC_CLASS___UIAction,  "tvh_gotoAlbumArtistActionWithMediaItem:",  v6));
    -[NSMutableArray addObject:](v7, "addObject:", v9);
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_tvh_player"));
  v11 = (void *)objc_claimAutoreleasedReturnValue([v10 state]);
  id v12 = (void *)objc_claimAutoreleasedReturnValue(+[TVPPlaybackState stopped](&OBJC_CLASS___TVPPlaybackState, "stopped"));

  if (v11 != v12)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue([v10 playlist]);
    objc_opt_class(&OBJC_CLASS___TVHPlayerPlaylist);
    uint64_t v15 = v14;
    id v16 = v13;
    v17 = v16;
    if (v15)
    {
      if ((objc_opt_isKindOfClass(v16, v15) & 1) != 0) {
        v18 = v17;
      }
      else {
        v18 = 0LL;
      }
    }

    else
    {
      v18 = 0LL;
    }

    id v19 = v18;

    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "tvh_mediaLibrary"));
    unsigned int v21 = [v19 canItemsBeAdded];

    if (v21 && v20)
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue( +[UIAction tvh_playNextActionWithMediaItem:]( &OBJC_CLASS___UIAction,  "tvh_playNextActionWithMediaItem:",  v6));
      -[NSMutableArray addObject:](v7, "addObject:", v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue( +[UIAction tvh_playLaterActionWithMediaItem:]( &OBJC_CLASS___UIAction,  "tvh_playLaterActionWithMediaItem:",  v6));
      -[NSMutableArray addObject:](v7, "addObject:", v23);
    }
  }

  id v24 = -[NSMutableArray copy](v7, "copy");

  return v24;
}

+ (id)_tvh_player
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( +[TVHApplicationDelegate sharedApplicationDelegate]( &OBJC_CLASS___TVHApplicationDelegate,  "sharedApplicationDelegate"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 mainSceneDelegate]);
  char v4 = (void *)objc_claimAutoreleasedReturnValue([v3 rootViewController]);

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "tvh_playbackManager"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 interactivePlaylistPlayer]);

  return v6;
}

@end
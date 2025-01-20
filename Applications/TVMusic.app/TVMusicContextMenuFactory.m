@interface TVMusicContextMenuFactory
+ (BOOL)_hasCloudLibrary;
+ (BOOL)allowAnyCatalogAccess;
+ (BOOL)allowFullCatalogAccess;
+ (id)_contextMenuForAlbum:(id)a3;
+ (id)_contextMenuForArtist:(id)a3;
+ (id)_contextMenuForMPTVSeason:(id)a3;
+ (id)_contextMenuForMovie:(id)a3;
+ (id)_contextMenuForPlaylist:(id)a3;
+ (id)_contextMenuForPlaylistFolder:(id)a3;
+ (id)_contextMenuForSong:(id)a3;
+ (id)_contextMenuForTVEpisode:(id)a3;
+ (id)_kindForGenericObjectType:(int64_t)a3;
+ (id)_menuDataWithTitle:(id)a3 addItemsBlock:(id)a4;
+ (id)_menuItemForAddAlbumToLibrary:(id)a3;
+ (id)_menuItemForAddMPObject:(id)a3 isExplicit:(BOOL)a4;
+ (id)_menuItemForAddOrRemoveAlbum:(id)a3;
+ (id)_menuItemForAddOrRemoveSong:(id)a3;
+ (id)_menuItemForAddOrRemoveTVorMovie:(id)a3;
+ (id)_menuItemForAddToPlaylist:(id)a3;
+ (id)_menuItemForAddToQueue:(id)a3 actionBlock:(id)a4;
+ (id)_menuItemForAddToQueue:(id)a3 playbackAction:(unint64_t)a4 actionBlock:(id)a5;
+ (id)_menuItemForCatalogPlaylistSubscribe:(id)a3;
+ (id)_menuItemForCatalogPlaylistUnsubscribe:(id)a3;
+ (id)_menuItemForCatalogShuffle;
+ (id)_menuItemForCreateStationFromAlbum:(id)a3;
+ (id)_menuItemForCreateStationFromArtist:(id)a3;
+ (id)_menuItemForCreateStationFromSong:(id)a3;
+ (id)_menuItemForFavoriteMPObject:(id)a3 isInLibrary:(BOOL)a4 currentState:(int64_t)a5;
+ (id)_menuItemForGoToAlbumWithSong:(id)a3;
+ (id)_menuItemForGoToArtist:(id)a3;
+ (id)_menuItemForGoToMovie:(id)a3;
+ (id)_menuItemForGoToMovieWithStoreID:(int64_t)a3;
+ (id)_menuItemForGoToTVShow:(id)a3;
+ (id)_menuItemForGoToTVShowWithEpisodeStoreID:(int64_t)a3;
+ (id)_menuItemForHateMPObject:(id)a3 isInLibrary:(BOOL)a4;
+ (id)_menuItemForLibraryGoToArtist:(id)a3;
+ (id)_menuItemForLibraryPlayback:(id)a3 itemType:(unint64_t)a4 persistentID:(int64_t)a5 playbackAction:(unint64_t)a6;
+ (id)_menuItemForLibraryRemoveSong:(id)a3 fromPlaylist:(id)a4 atPosition:(int64_t)a5;
+ (id)_menuItemForLoveMPObject:(id)a3 isInLibrary:(BOOL)a4;
+ (id)_menuItemForNoAccessWithSubject:(id)a3 title:(id)a4 identifier:(id)a5;
+ (id)_menuItemForPlayLast:(id)a3 actionBlock:(id)a4;
+ (id)_menuItemForPlayNext:(id)a3 actionBlock:(id)a4;
+ (id)_menuItemForPlaySong:(id)a3 inContainer:(id)a4 playbackAction:(unint64_t)a5;
+ (id)_menuItemForRemoveAlbumFromLibrary:(id)a3;
+ (id)_menuItemForRemoveMPObject:(id)a3 title:(id)a4;
+ (id)_menuItemForRemoveMPObjectFromLibrary:(id)a3 title:(id)a4;
+ (id)_menuItemForRenamePlaylist:(id)a3;
+ (id)_menuItemForRenamePlaylistFolder:(id)a3;
+ (id)_menuItemForSongLyrics:(id)a3;
+ (id)_menuItemForSuggestLessMPObject:(id)a3 isInLibrary:(BOOL)a4 currentState:(int64_t)a5;
+ (id)_menuItemForTasteType:(int64_t)a3 tasteTitleKey:(id)a4 neutralTitleKey:(id)a5 mpObject:(id)a6 isInLibrary:(BOOL)a7;
+ (id)_menuItemGoToPlaylist:(id)a3;
+ (id)_menuItemGoToPlaylistWithSong:(id)a3;
+ (id)_menuTitleForMPSong:(id)a3;
+ (id)_menuTitleForPlaybackAction:(unint64_t)a3 mpObject:(id)a4;
+ (id)_player;
+ (id)_propertiesForGenericObjectType:(int64_t)a3;
+ (id)contextMenuForSubject:(id)a3;
+ (void)_contextMenuForLibraryObject:(id)a3 inContainer:(id)a4 completion:(id)a5;
+ (void)_contextMenuForLibraryPlaylistEntry:(id)a3 completionHandler:(id)a4;
+ (void)_deleteConfirmationDialogWithTitle:(id)a3 CompletionHandler:(id)a4;
+ (void)_findAlbumWithPersistentID:(int64_t)a3 completionHandler:(id)a4;
+ (void)_findLibraryItemMatchingIdentifiers:(id)a3 itemKind:(id)a4 completionHandler:(id)a5;
+ (void)_goToPlaylistAction:(id)a3;
+ (void)_openJavascriptWithURL:(id)a3;
+ (void)_performWithAppInForeground:(id)a3;
+ (void)_presentExplicitRestrictAlertIfNeededOfType:(int64_t)a3 isExplicit:(BOOL)a4 completion:(id)a5;
+ (void)_presentViewController:(id)a3;
+ (void)_removeLibraryItemItemMatchingIdentifiers:(id)a3 itemKind:(id)a4;
+ (void)_renamePlaylist:(id)a3 title:(id)a4;
+ (void)_showLibraryArtistWithPID:(int64_t)a3 completion:(id)a4;
+ (void)_showLyricsForContextMenuSubject:(id)a3;
+ (void)_showPageForAlbum:(id)a3;
+ (void)_showPageForArtist:(id)a3;
+ (void)_showPageForPlaylist:(id)a3;
+ (void)contextMenuForLibraryObject:(id)a3 completionHandler:(id)a4;
+ (void)contextMenuForLibraryObject:(id)a3 inContainer:(id)a4 completionHandler:(id)a5;
+ (void)contextMenuForLibraryPlaylistEntry:(id)a3 inPlaylist:(id)a4 atPosition:(int64_t)a5 completionHandler:(id)a6;
+ (void)contextMenuForMediaItem:(id)a3 completionHandler:(id)a4;
+ (void)contextMenuForStoreObject:(id)a3 inContainer:(id)a4 isInLibrary:(BOOL)a5 favoriteState:(int64_t)a6 playbackReportingDictionary:(id)a7 completionHandler:(id)a8;
+ (void)initialize;
@end

@implementation TVMusicContextMenuFactory

+ (void)initialize
{
  os_log_t v2 = os_log_create("com.apple.TVMusic", "TVMusicContextMenuFactory");
  v3 = (void *)qword_1002BE960;
  qword_1002BE960 = (uint64_t)v2;
}

+ (BOOL)allowFullCatalogAccess
{
  os_log_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[TVMSubscriptionManager sharedInstance](&OBJC_CLASS___TVMSubscriptionManager, "sharedInstance"));
  unsigned __int8 v3 = [v2 allowsFullCatalogPlayback];

  return v3;
}

+ (BOOL)allowAnyCatalogAccess
{
  os_log_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[TVMSubscriptionManager sharedInstance](&OBJC_CLASS___TVMSubscriptionManager, "sharedInstance"));
  unsigned __int8 v3 = [v2 allowsAnyCatalogPlayback];

  return v3;
}

+ (void)contextMenuForMediaItem:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue([v6 mediaItemMetadataForProperty:@"TVMusicMediaItemMetadataMPModelObject"]);
  v9 = (void *)objc_claimAutoreleasedReturnValue([v6 mediaItemMetadataForProperty:@"TVMusicMediaItemMetadataMPModelContainer"]);
  if (v8 && [v8 type] == (id)1)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue([v8 song]);
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_1000656E4;
    v12[3] = &unk_10026B618;
    id v13 = v7;
    id v14 = a1;
    +[TVMusicContextMenuSubject subjectWithSongInPlayQueue:container:completion:]( &OBJC_CLASS___TVMusicContextMenuSubject,  "subjectWithSongInPlayQueue:container:completion:",  v10,  v9,  v12);
  }

  else
  {
    v11 = (os_log_s *)qword_1002BE960;
    if (os_log_type_enabled((os_log_t)qword_1002BE960, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v16 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Can't show menu: no MP song object found in media item: %@",  buf,  0xCu);
    }

    (*((void (**)(id, void))v7 + 2))(v7, 0LL);
  }
}

+ (void)contextMenuForStoreObject:(id)a3 inContainer:(id)a4 isInLibrary:(BOOL)a5 favoriteState:(int64_t)a6 playbackReportingDictionary:(id)a7 completionHandler:(id)a8
{
  id v14 = a8;
  id v15 = a7;
  id v16 = a3;
  v17 = (void *)objc_claimAutoreleasedReturnValue( +[MPModelGenericObject genericObjectWithModelObject:]( &OBJC_CLASS___MPModelGenericObject,  "genericObjectWithModelObject:",  a4));
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_100065828;
  v19[3] = &unk_10026B640;
  BOOL v23 = a5;
  id v20 = v14;
  int64_t v21 = a6;
  id v22 = a1;
  id v18 = v14;
  +[TVMusicContextMenuSubject subjectWithObject:playbackReportingDictionary:container:completion:]( &OBJC_CLASS___TVMusicContextMenuSubject,  "subjectWithObject:playbackReportingDictionary:container:completion:",  v16,  v15,  v17,  v19);
}

+ (void)contextMenuForLibraryObject:(id)a3 completionHandler:(id)a4
{
}

+ (void)contextMenuForLibraryObject:(id)a3 inContainer:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_propertiesForGenericObjectType:", objc_msgSend(v8, "type")));
  if (v11)
  {
    id v12 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_kindForGenericObjectType:", objc_msgSend(v8, "type")));
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v8 identifiers]);
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472LL;
    v17[2] = sub_100065A44;
    v17[3] = &unk_10026B6B8;
    id v18 = v8;
    id v21 = a1;
    id v19 = v9;
    id v20 = v10;
    id v14 = v10;
    +[TVMusicLibraryUtilities findMPObjectWithIdentifiers:itemKind:itemProperties:completionHandler:]( &OBJC_CLASS___TVMusicLibraryUtilities,  "findMPObjectWithIdentifiers:itemKind:itemProperties:completionHandler:",  v13,  v12,  v11,  v17);
  }

  else
  {
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_100065D0C;
    v15[3] = &unk_10026B668;
    id v16 = v10;
    id v12 = v10;
    [a1 _contextMenuForLibraryObject:v8 inContainer:v9 completion:v15];
    id v14 = v16;
  }
}

+ (void)contextMenuForLibraryPlaylistEntry:(id)a3 inPlaylist:(id)a4 atPosition:(int64_t)a5 completionHandler:(id)a6
{
  id v10 = a6;
  id v11 = a4;
  id v12 = (void *)objc_claimAutoreleasedReturnValue( +[MPModelGenericObject genericObjectWithModelObject:]( &OBJC_CLASS___MPModelGenericObject,  "genericObjectWithModelObject:",  a3));
  id v13 = (void *)objc_claimAutoreleasedReturnValue( +[MPModelGenericObject genericObjectWithModelObject:]( &OBJC_CLASS___MPModelGenericObject,  "genericObjectWithModelObject:",  v11));

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_100065E10;
  v15[3] = &unk_10026B6E0;
  int64_t v17 = a5;
  id v18 = a1;
  id v16 = v10;
  id v14 = v10;
  +[TVMusicContextMenuSubject subjectWithLibraryObject:container:completion:]( &OBJC_CLASS___TVMusicContextMenuSubject,  "subjectWithLibraryObject:container:completion:",  v12,  v13,  v15);
}

+ (id)contextMenuForSubject:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 mpObject]);
  switch((unint64_t)[v5 type])
  {
    case 1uLL:
      goto LABEL_7;
    case 2uLL:
      uint64_t v6 = objc_claimAutoreleasedReturnValue([a1 _contextMenuForAlbum:v4]);
      goto LABEL_14;
    case 3uLL:
      uint64_t v6 = objc_claimAutoreleasedReturnValue([a1 _contextMenuForArtist:v4]);
      goto LABEL_14;
    case 4uLL:
      id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 playlist]);
      id v8 = [v7 type];

      if (v8 == (id)3) {
        uint64_t v6 = objc_claimAutoreleasedReturnValue([a1 _contextMenuForPlaylistFolder:v4]);
      }
      else {
        uint64_t v6 = objc_claimAutoreleasedReturnValue([a1 _contextMenuForPlaylist:v4]);
      }
      goto LABEL_14;
    case 5uLL:
      id v9 = (void *)objc_claimAutoreleasedReturnValue([v5 playlistEntry]);
      id v10 = [v9 type];

      if (v10 == (id)1)
      {
LABEL_7:
        uint64_t v6 = objc_claimAutoreleasedReturnValue([a1 _contextMenuForSong:v4]);
LABEL_14:
        id v12 = (void *)v6;
      }

      else
      {
        id v14 = (void *)qword_1002BE960;
        if (os_log_type_enabled((os_log_t)qword_1002BE960, OS_LOG_TYPE_DEFAULT))
        {
          id v15 = v14;
          id v16 = (void *)objc_claimAutoreleasedReturnValue([v5 playlistEntry]);
          int v17 = 138412290;
          id v18 = v16;
          _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "Playlist entry type not supported: %@",  (uint8_t *)&v17,  0xCu);
        }

+ (void)_contextMenuForLibraryObject:(id)a3 inContainer:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v10 = (void *)objc_claimAutoreleasedReturnValue( +[MPModelGenericObject genericObjectWithModelObject:]( &OBJC_CLASS___MPModelGenericObject,  "genericObjectWithModelObject:",  a4));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_100066178;
  v12[3] = &unk_10026B618;
  id v13 = v8;
  id v14 = a1;
  id v11 = v8;
  +[TVMusicContextMenuSubject subjectWithLibraryObject:container:completion:]( &OBJC_CLASS___TVMusicContextMenuSubject,  "subjectWithLibraryObject:container:completion:",  v9,  v10,  v12);
}

+ (void)_contextMenuForLibraryPlaylistEntry:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 container]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 playlist]);

  id v10 = (void *)objc_claimAutoreleasedReturnValue( +[TVMusicMPLibraryRequestFactory songsLibraryRequestForContextMenuWithPlaylist:]( &OBJC_CLASS___TVMusicMPLibraryRequestFactory,  "songsLibraryRequestForContextMenuWithPlaylist:",  v9));
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_1000662C4;
  v14[3] = &unk_10026B730;
  id v17 = v7;
  id v18 = a1;
  id v15 = v6;
  id v16 = v9;
  id v11 = v9;
  id v12 = v7;
  id v13 = v6;
  [v10 performWithResponseHandler:v14];
}

+ (id)_contextMenuForMPTVSeason:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 mpObject]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 season]);

  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](&OBJC_CLASS___NSMutableArray, "arrayWithCapacity:", 2LL));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 representativeEpisode]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 identifiers]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 universalStore]);
  id v11 = [v10 adamID];
  if (!v11)
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v8 identifiers]);
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 universalStore]);
    id v11 = [v13 subscriptionAdamID];
  }

  id v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "tvm_seasonTitle"));
  id v15 = (void *)objc_claimAutoreleasedReturnValue([a1 _menuItemForGoToTVShowWithEpisodeStoreID:v11]);
  objc_msgSend(v7, "tvs_addObjectIfNotNil:", v15);

  LODWORD(v15) = [v4 libraryAdded];
  if ((_DWORD)v15)
  {
    id v16 = (void *)objc_claimAutoreleasedReturnValue([a1 _menuItemForRemoveMPObjectFromLibrary:v6 title:v14]);
    objc_msgSend(v7, "tvs_addObjectIfNotNil:", v16);
  }

  id v17 = -[TVPMusicContextMenuData initWithHeading:menuItems:]( objc_alloc(&OBJC_CLASS___TVPMusicContextMenuData),  "initWithHeading:menuItems:",  v14,  v7);

  return v17;
}

+ (void)_findAlbumWithPersistentID:(int64_t)a3 completionHandler:(id)a4
{
  id v5 = a4;
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[TVMusicMPLibraryRequestFactory albumsLibraryRequest]( &OBJC_CLASS___TVMusicMPLibraryRequestFactory,  "albumsLibraryRequest"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 itemKind]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 itemProperties]);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_1000667C8;
  v10[3] = &unk_10026A6E8;
  id v11 = v5;
  id v9 = v5;
  +[TVMusicLibraryUtilities findItemInLibraryWithPersistentID:itemKind:itemProperties:completionHandler:]( &OBJC_CLASS___TVMusicLibraryUtilities,  "findItemInLibraryWithPersistentID:itemKind:itemProperties:completionHandler:",  a3,  v7,  v8,  v10);
}

+ (id)_menuItemForGoToAlbumWithSong:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 identifiers]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 album]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 identifiers]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 universalStore]);
  id v9 = [v8 adamID];
  if (!v9)
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v4 album]);
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 identifiers]);
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 universalStore]);
    id v9 = [v12 subscriptionAdamID];
  }

  id v13 = (void *)objc_claimAutoreleasedReturnValue(+[TVMSubscriptionManager sharedInstance](&OBJC_CLASS___TVMSubscriptionManager, "sharedInstance"));
  if ([v13 hasMusicSubscription])
  {
    unsigned int v14 = 1;
  }

  else
  {
    id v15 = (void *)objc_claimAutoreleasedReturnValue(+[TVMSubscriptionManager sharedInstance](&OBJC_CLASS___TVMSubscriptionManager, "sharedInstance"));
    unsigned int v14 = [v15 hasPlaybackRestrictions];
  }

  if (v14 && v9) {
    goto LABEL_10;
  }
  id v16 = (void *)objc_claimAutoreleasedReturnValue([v5 library]);
  if (![v16 persistentID])
  {

    goto LABEL_12;
  }

  id v17 = (void *)objc_claimAutoreleasedReturnValue([v4 album]);
  id v18 = (void *)objc_claimAutoreleasedReturnValue([v17 identifiers]);
  id v19 = (void *)objc_claimAutoreleasedReturnValue([v18 library]);
  id v20 = [v19 persistentID];

  if (!v20)
  {
LABEL_12:
    id v24 = 0LL;
    goto LABEL_13;
  }

+ (void)_showLibraryArtistWithPID:(int64_t)a3 completion:(id)a4
{
  id v5 = a4;
  id v6 = v5;
  if (a3)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue( +[TVMusicMPLibraryRequestFactory artistsLibraryRequest]( &OBJC_CLASS___TVMusicMPLibraryRequestFactory,  "artistsLibraryRequest"));
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 itemKind]);
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 itemProperties]);
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_100066CBC;
    v10[3] = &unk_10026A6E8;
    id v11 = v6;
    +[TVMusicLibraryUtilities findItemInLibraryWithPersistentID:itemKind:itemProperties:completionHandler:]( &OBJC_CLASS___TVMusicLibraryUtilities,  "findItemInLibraryWithPersistentID:itemKind:itemProperties:completionHandler:",  a3,  v8,  v9,  v10);
  }

  else
  {
    (*((void (**)(id, void))v5 + 2))(v5, 0LL);
  }
}

+ (id)_menuItemForLibraryRemoveSong:(id)a3 fromPlaylist:(id)a4 atPosition:(int64_t)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = objc_alloc(&OBJC_CLASS___TVPMusicContextMenuDataItem);
  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  id v11 = (void *)objc_claimAutoreleasedReturnValue( [v10 localizedStringForKey:@"ContextMenuRemoveFromPlaylist" value:&stru_100279068 table:0]);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_100066F1C;
  v16[3] = &unk_100269EF8;
  id v17 = v7;
  id v18 = v8;
  int64_t v19 = a5;
  id v12 = v8;
  id v13 = v7;
  id v14 = [v9 initWithTitle:v11 actionBlock:v16];

  [v14 setMenuItemType:7];
  return v14;
}

+ (id)_menuTitleForMPSong:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 artist]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 name]);
  id v6 = [v5 length];

  if (v6)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v3 title]);
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v3 artist]);
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 name]);
    id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ — %@",  v7,  v9));
  }

  else
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v3 title]);
  }

  return v10;
}

+ (void)_deleteConfirmationDialogWithTitle:(id)a3 CompletionHandler:(id)a4
{
  id v5 = (id)objc_claimAutoreleasedReturnValue( +[TVMusicAlerts alertForLibraryDeleteConfirmationWithItemName:completion:]( &OBJC_CLASS___TVMusicAlerts,  "alertForLibraryDeleteConfirmationWithItemName:completion:",  a3,  a4));
  [a1 _presentViewController:v5];
}

+ (id)_menuItemForRemoveMPObjectFromLibrary:(id)a3 title:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = (id)objc_claimAutoreleasedReturnValue([v5 identifiers]);

  if (v7)
  {
    id v8 = objc_alloc(&OBJC_CLASS___TVPMusicContextMenuDataItem);
    id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    id v10 = (void *)objc_claimAutoreleasedReturnValue( [v9 localizedStringForKey:@"ContextMenuRemoveFromLibrary" value:&stru_100279068 table:0]);
    id v12 = _NSConcreteStackBlock;
    uint64_t v13 = 3221225472LL;
    id v14 = sub_100067340;
    id v15 = &unk_100268B30;
    id v16 = v6;
    id v17 = v5;
    id v7 = [v8 initWithTitle:v10 actionBlock:&v12];

    objc_msgSend(v7, "setMenuItemType:", 5, v12, v13, v14, v15);
  }

  return v7;
}

+ (id)_menuItemForFavoriteMPObject:(id)a3 isInLibrary:(BOOL)a4 currentState:(int64_t)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  if ((_os_feature_enabled_impl("MediaPlayer", "Favoriting") & 1) == 0)
  {
    id v9 = (id)objc_claimAutoreleasedReturnValue([a1 _menuItemForLoveMPObject:v8 isInLibrary:v6]);
    goto LABEL_11;
  }

  if (a5 != 3)
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    id v11 = v10;
    BOOL v12 = a5 == 2;
    if (a5 == 2) {
      uint64_t v13 = @"ContextMenuUndoFavorite";
    }
    else {
      uint64_t v13 = @"ContextMenuFavorite";
    }
    id v14 = (void *)objc_claimAutoreleasedReturnValue([v10 localizedStringForKey:v13 value:&stru_100279068 table:0]);

    id v15 = objc_alloc(&OBJC_CLASS___TVPMusicContextMenuDataItem);
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472LL;
    v17[2] = sub_100067528;
    v17[3] = &unk_100268F28;
    BOOL v19 = v12;
    id v18 = v8;
    id v9 = [v15 initWithTitle:v14 actionBlock:v17];
  }

  else
  {
LABEL_3:
    id v9 = 0LL;
  }

+ (id)_menuItemForSuggestLessMPObject:(id)a3 isInLibrary:(BOOL)a4 currentState:(int64_t)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  if (([a1 allowFullCatalogAccess] & 1) != 0 || v6)
  {
    if ((_os_feature_enabled_impl("MediaPlayer", "Favoriting") & 1) == 0)
    {
      id v9 = (id)objc_claimAutoreleasedReturnValue([a1 _menuItemForHateMPObject:v8 isInLibrary:v6]);
      goto LABEL_15;
    }

    if (a5 != 2)
    {
      BOOL v11 = a5 == 3;
      if (a5 == 3 || v6)
      {
        if (a5 == 3)
        {
          uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
          id v14 = v13;
          id v15 = @"ContextMenuUnhate";
LABEL_14:
          id v16 = (void *)objc_claimAutoreleasedReturnValue([v13 localizedStringForKey:v15 value:&stru_100279068 table:0]);

          id v17 = objc_alloc(&OBJC_CLASS___TVPMusicContextMenuDataItem);
          v19[0] = _NSConcreteStackBlock;
          v19[1] = 3221225472LL;
          v19[2] = sub_1000676DC;
          v19[3] = &unk_100268F28;
          BOOL v21 = v11;
          id v20 = v8;
          id v9 = [v17 initWithTitle:v16 actionBlock:v19];

          goto LABEL_15;
        }

+ (id)_menuItemForLoveMPObject:(id)a3 isInLibrary:(BOOL)a4
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue( [a1 _menuItemForTasteType:1 tasteTitleKey:@"ContextMenuLove" neutralTitleKey:@"ContextMenuUnlove" mpObject:a3 isInLibrary:a4]);
  id v5 = v4;
  if (v4) {
    [v4 setMenuItemType:14];
  }
  return v5;
}

+ (id)_menuItemForHateMPObject:(id)a3 isInLibrary:(BOOL)a4
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue( [a1 _menuItemForTasteType:2 tasteTitleKey:@"ContextMenuHate" neutralTitleKey:@"ContextMenuUnhate" mpObject:a3 isInLibrary:a4]);
  id v5 = v4;
  if (v4) {
    [v4 setMenuItemType:15];
  }
  return v5;
}

+ (id)_menuItemForTasteType:(int64_t)a3 tasteTitleKey:(id)a4 neutralTitleKey:(id)a5 mpObject:(id)a6 isInLibrary:(BOOL)a7
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( +[MPContentTasteController sharedController]( &OBJC_CLASS___MPContentTasteController,  "sharedController"));
  id v14 = [v13 tasteTypeForModel:v12];
  if (v14) {
    BOOL v15 = v14 == (id)a3;
  }
  else {
    BOOL v15 = 1;
  }
  if (v15)
  {
    id v16 = v14;
    id v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    id v18 = v17;
    BOOL v19 = v16 == (id)a3;
    if (v16 == (id)a3) {
      id v20 = v11;
    }
    else {
      id v20 = v10;
    }
    BOOL v21 = (void *)objc_claimAutoreleasedReturnValue([v17 localizedStringForKey:v20 value:&stru_100279068 table:0]);

    id v22 = objc_alloc(&OBJC_CLASS___TVPMusicContextMenuDataItem);
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472LL;
    v25[2] = sub_100067904;
    v25[3] = &unk_10026B7C0;
    BOOL v29 = v19;
    int64_t v28 = a3;
    id v26 = v13;
    id v27 = v12;
    id v23 = [v22 initWithTitle:v21 actionBlock:v25];
  }

  else
  {
    id v23 = 0LL;
  }

  return v23;
}

+ (id)_menuItemForPlayNext:(id)a3 actionBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 mpObject]);
  id v9 = [v8 type];

  id v10 = (void *)objc_claimAutoreleasedReturnValue([v6 mpObject]);
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 identifiers]);
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 universalStore]);
  uint64_t v13 = v12;
  if (v9 == (id)4)
  {
    id v14 = (id)objc_claimAutoreleasedReturnValue([v12 globalPlaylistID]);
  }

  else
  {
    id v14 = [v12 adamID];
    if (!v14)
    {
      BOOL v15 = (void *)objc_claimAutoreleasedReturnValue([v6 mpObject]);
      id v16 = (void *)objc_claimAutoreleasedReturnValue([v15 identifiers]);
      id v17 = (void *)objc_claimAutoreleasedReturnValue([v16 universalStore]);
      id v14 = [v17 subscriptionAdamID];
    }

    if (!v14) {
      goto LABEL_9;
    }
    id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", v14));
    id v14 = (id)objc_claimAutoreleasedReturnValue([v10 stringValue]);
  }

  if (v14
    && !+[TVMusicPlaybackHelper canPlayItemWithStoreID:playbackAction:]( &OBJC_CLASS___TVMusicPlaybackHelper,  "canPlayItemWithStoreID:playbackAction:",  v14,  1LL))
  {
    id v19 = 0LL;
    goto LABEL_13;
  }

+ (id)_menuTitleForPlaybackAction:(unint64_t)a3 mpObject:(id)a4
{
  id v5 = a4;
  id v6 = [v5 type];
  if (v6 == (id)4)
  {
    id v9 = &off_100282180;
  }

  else if (v6 == (id)2)
  {
    id v9 = &off_100282168;
  }

  else if (v6 == (id)1)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 song]);
    unsigned int v8 = [v7 hasVideo];

    if (v8) {
      id v9 = &off_100282138;
    }
    else {
      id v9 = &off_100282150;
    }
  }

  else
  {
    id v9 = &off_100282198;
  }

  if (a3 == 3) {
    uint64_t v10 = 2LL;
  }
  else {
    uint64_t v10 = a3 == 2;
  }
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v9 objectAtIndexedSubscript:v10]);
  id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v12 localizedStringForKey:v11 value:&stru_100279068 table:0]);

  return v13;
}

+ (id)_menuItemForPlayLast:(id)a3 actionBlock:(id)a4
{
  return _[a1 _menuItemForAddToQueue:a3 playbackAction:2 actionBlock:a4];
}

+ (id)_menuItemForAddToQueue:(id)a3 actionBlock:(id)a4
{
  return _[a1 _menuItemForAddToQueue:a3 playbackAction:3 actionBlock:a4];
}

+ (id)_menuItemForAddToQueue:(id)a3 playbackAction:(unint64_t)a4 actionBlock:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v8 mpObject]);
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 identifiers]);

  id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 universalStore]);
  id v13 = [v12 adamID];
  if (v13)
  {
    id v14 = v13;

LABEL_4:
    id v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", v14));
    uint64_t v17 = objc_claimAutoreleasedReturnValue([v16 stringValue]);
    goto LABEL_5;
  }

  BOOL v15 = (void *)objc_claimAutoreleasedReturnValue([v11 universalStore]);
  id v14 = [v15 subscriptionAdamID];

  if (v14) {
    goto LABEL_4;
  }
  id v22 = (void *)objc_claimAutoreleasedReturnValue([v11 universalStore]);
  id v23 = (void *)objc_claimAutoreleasedReturnValue([v22 globalPlaylistID]);
  id v24 = [v23 length];

  if (!v24)
  {
    id v18 = 0LL;
LABEL_12:
    id v21 = 0LL;
    goto LABEL_13;
  }

  id v16 = (void *)objc_claimAutoreleasedReturnValue([v11 universalStore]);
  uint64_t v17 = objc_claimAutoreleasedReturnValue([v16 globalPlaylistID]);
LABEL_5:
  id v18 = (void *)v17;

  if (!v18
    || !+[TVMusicPlaybackHelper canPlayItemWithStoreID:playbackAction:]( &OBJC_CLASS___TVMusicPlaybackHelper,  "canPlayItemWithStoreID:playbackAction:",  v18,  a4)
    || [v8 origin] == (id)3)
  {
    goto LABEL_12;
  }

  id v19 = (void *)objc_claimAutoreleasedReturnValue([v8 mpObject]);
  id v20 = (void *)objc_claimAutoreleasedReturnValue([a1 _menuTitleForPlaybackAction:a4 mpObject:v19]);

  id v21 = [[TVPMusicContextMenuDataItem alloc] initWithTitle:v20 actionBlock:v9];
  [v21 setMenuItemType:11];

LABEL_13:
  return v21;
}

+ (id)_menuItemForPlaySong:(id)a3 inContainer:(id)a4 playbackAction:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v8 identifiers]);
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 library]);
  id v12 = [v11 persistentID];

  if (v12
    && +[TVMusicPlaybackHelper canPlayItemType:playbackAction:]( &OBJC_CLASS___TVMusicPlaybackHelper,  "canPlayItemType:playbackAction:",  2LL,  a5))
  {
    id v13 = (void *)objc_claimAutoreleasedReturnValue( +[MPModelGenericObject genericObjectWithModelObject:]( &OBJC_CLASS___MPModelGenericObject,  "genericObjectWithModelObject:",  v8));
    id v14 = (void *)objc_claimAutoreleasedReturnValue([a1 _menuTitleForPlaybackAction:a5 mpObject:v13]);

    id v15 = objc_alloc(&OBJC_CLASS___TVPMusicContextMenuDataItem);
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472LL;
    v18[2] = sub_100067F64;
    v18[3] = &unk_100269EF8;
    id v19 = v8;
    id v20 = v9;
    unint64_t v21 = a5;
    id v16 = [v15 initWithTitle:v14 actionBlock:v18];
    [v16 setMenuItemType:10];
  }

  else
  {
    id v16 = 0LL;
  }

  return v16;
}

+ (id)_menuItemForLibraryPlayback:(id)a3 itemType:(unint64_t)a4 persistentID:(int64_t)a5 playbackAction:(unint64_t)a6
{
  id v10 = a3;
  if (a5)
  {
    if (+[TVMusicPlaybackHelper canPlayItemType:playbackAction:]( &OBJC_CLASS___TVMusicPlaybackHelper,  "canPlayItemType:playbackAction:",  a4,  a6))
    {
      id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 mpObject]);
      id v12 = (void *)objc_claimAutoreleasedReturnValue([a1 _menuTitleForPlaybackAction:a6 mpObject:v11]);

      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472LL;
      v16[2] = sub_100068118;
      v16[3] = &unk_10026B7E0;
      void v16[4] = a4;
      v16[5] = a5;
      v16[6] = a6;
      id v13 = [[TVPMusicContextMenuDataItem alloc] initWithTitle:v12 actionBlock:v16];
      a5 = (int64_t)v13;
      if (a6 == 1) {
        uint64_t v14 = 10LL;
      }
      else {
        uint64_t v14 = 11LL;
      }
      [v13 setMenuItemType:v14];
    }

    else
    {
      a5 = 0LL;
    }
  }

  return (id)a5;
}

+ (void)_showLyricsForContextMenuSubject:(id)a3
{
  id v19 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v19 mpObject]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 song]);

  if (v5)
  {
    id v6 = objc_alloc(&OBJC_CLASS____TtC7TVMusic22LyricsViewDataSourceMP);
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v19 mpObject]);
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 song]);
    id v9 = -[LyricsViewDataSourceMP initWithSong:](v6, "initWithSong:", v8);

    id v10 = -[TVMusicLyricsViewController initWithDataSource:]( objc_alloc(&OBJC_CLASS___TVMusicLyricsViewController),  "initWithDataSource:",  v9);
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v19 featureName]);
    -[TVMusicLyricsViewController setPAFFeatureName:](v10, "setPAFFeatureName:", v11);

    id v12 = (void *)objc_claimAutoreleasedReturnValue([v19 recommendationData]);
    -[TVMusicLyricsViewController setPAFRecommendationData:](v10, "setPAFRecommendationData:", v12);

    id v13 = (void *)objc_claimAutoreleasedReturnValue([v19 container]);
    uint64_t v14 = objc_claimAutoreleasedReturnValue([v13 identifiers]);
    if (v14)
    {
      id v15 = (void *)v14;
      id v16 = (void *)objc_claimAutoreleasedReturnValue([v19 container]);
      uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v16 anyObject]);

      if (!v17)
      {
LABEL_6:
        [a1 _presentViewController:v10];

        goto LABEL_7;
      }

      id v13 = (void *)objc_claimAutoreleasedReturnValue([v19 container]);
      id v18 = (void *)objc_claimAutoreleasedReturnValue([v13 playEvent]);
      -[TVMusicLyricsViewController setPAFContainerData:](v10, "setPAFContainerData:", v18);
    }

    goto LABEL_6;
  }

+ (id)_menuItemForAddOrRemoveAlbum:(id)a3
{
  id v4 = a3;
  if ([v4 libraryAdded])
  {
    uint64_t v5 = objc_claimAutoreleasedReturnValue([a1 _menuItemForRemoveAlbumFromLibrary:v4]);
LABEL_6:
    id v6 = (void *)v5;
    goto LABEL_10;
  }

  if ([a1 allowFullCatalogAccess] && objc_msgSend(a1, "_hasCloudLibrary"))
  {
    uint64_t v5 = objc_claimAutoreleasedReturnValue([a1 _menuItemForAddAlbumToLibrary:v4]);
    goto LABEL_6;
  }

  if ([a1 allowAnyCatalogAccess])
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    id v8 = (void *)objc_claimAutoreleasedReturnValue( [v7 localizedStringForKey:@"ContextMenuAddToLibrary" value:&stru_100279068 table:0]);
    id v6 = (void *)objc_claimAutoreleasedReturnValue([a1 _menuItemForNoAccessWithSubject:v4 title:v8 identifier:@"AddToLibrary"]);
  }

  else
  {
    id v6 = 0LL;
  }

+ (id)_menuItemForAddAlbumToLibrary:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue([a3 mpObject]);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 album]);

  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 identifiers]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 universalStore]);
  id v8 = [v7 adamID];
  if (v8)
  {
    id v9 = v8;

LABEL_4:
    id v12 = objc_alloc(&OBJC_CLASS___TVPMusicContextMenuDataItem);
    id v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( [v13 localizedStringForKey:@"ContextMenuAddToLibrary" value:&stru_100279068 table:0]);
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472LL;
    v20[2] = sub_100068628;
    v20[3] = &unk_10026B858;
    id v22 = a1;
    id v21 = v5;
    id v23 = v9;
    id v15 = [v12 initWithTitle:v14 actionBlock:v20];

    [v15 setMenuItemType:5];
    goto LABEL_5;
  }

  id v10 = (void *)objc_claimAutoreleasedReturnValue([v5 identifiers]);
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 universalStore]);
  id v9 = [v11 subscriptionAdamID];

  if (v9) {
    goto LABEL_4;
  }
  uint64_t v17 = (void *)qword_1002BE960;
  if (os_log_type_enabled((os_log_t)qword_1002BE960, OS_LOG_TYPE_DEFAULT))
  {
    id v18 = v17;
    id v19 = (void *)objc_claimAutoreleasedReturnValue([v5 title]);
    *(_DWORD *)buf = 138412290;
    v25 = v19;
    _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "No adamID for album (%@), can't delete it.",  buf,  0xCu);
  }

  id v15 = 0LL;
LABEL_5:

  return v15;
}

+ (id)_menuItemForNoAccessWithSubject:(id)a3 title:(id)a4 identifier:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  id v9 = a4;
  if ([v7 origin] == (id)3)
  {
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_100068920;
    v13[3] = &unk_100268B30;
    id v14 = v8;
    id v15 = v7;
    id v10 = objc_retainBlock(v13);
  }

  else
  {
    id v10 = 0LL;
  }

  id v11 = [[TVPMusicContextMenuDataItem alloc] initWithTitle:v9 identifier:v8 actionBlock:v10];

  return v11;
}

+ (void)_presentExplicitRestrictAlertIfNeededOfType:(int64_t)a3 isExplicit:(BOOL)a4 completion:(id)a5
{
  id v6 = a5;
  id v7 = v6;
  if (a4)
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_100068A8C;
    v8[3] = &unk_100269590;
    id v9 = v6;
    +[TVMusicRestrictionsUI presentExplicitRestrictionAlertIfNeededOfType:completionBlock:]( &OBJC_CLASS___TVMusicRestrictionsUI,  "presentExplicitRestrictionAlertIfNeededOfType:completionBlock:",  4LL,  v8);
  }

  else
  {
    (*((void (**)(id, uint64_t))v6 + 2))(v6, 1LL);
  }
}

+ (id)_menuItemForRemoveAlbumFromLibrary:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 mpObject]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 album]);

  id v7 = objc_alloc(&OBJC_CLASS___TVPMusicContextMenuDataItem);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue( [v8 localizedStringForKey:@"ContextMenuRemoveFromLibrary" value:&stru_100279068 table:0]);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_100068BC0;
  v14[3] = &unk_100269EF8;
  id v16 = v6;
  id v17 = a1;
  id v15 = v4;
  id v10 = v6;
  id v11 = v4;
  id v12 = [v7 initWithTitle:v9 actionBlock:v14];

  [v12 setMenuItemType:5];
  return v12;
}

+ (id)_menuItemForAddOrRemoveSong:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 mpObject]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 song]);

  if (!v6) {
    goto LABEL_10;
  }
  if ([v4 libraryAdded])
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 title]);
    id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 _menuItemForRemoveMPObject:v6 title:v7]);
LABEL_9:

    goto LABEL_11;
  }

  if (![a1 allowFullCatalogAccess])
  {
    if ([a1 allowAnyCatalogAccess])
    {
      id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
      id v9 = (void *)objc_claimAutoreleasedReturnValue( [v7 localizedStringForKey:@"ContextMenuAddToLibrary" value:&stru_100279068 table:0]);
      id v8 = (void *)objc_claimAutoreleasedReturnValue( [a1 _menuItemForNoAccessWithSubject:v4 title:v9 identifier:@"AddToLibrary"]);

      goto LABEL_9;
    }

+ (id)_menuItemForAddOrRemoveTVorMovie:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 mpObject]);
  if ([v5 type] != (id)6 && objc_msgSend(v5, "type") != (id)9)
  {
    id v8 = (os_log_s *)qword_1002BE960;
    if (os_log_type_enabled((os_log_t)qword_1002BE960, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v14 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Incorrect object type passed to _menuItemForAddOrRemoveTVorMovie",  v14,  2u);
    }

    goto LABEL_14;
  }

  if (![v4 libraryAdded])
  {
    if ([a1 allowFullCatalogAccess])
    {
      id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _menuItemForAddMPObject:v5 isExplicit:0]);
      goto LABEL_15;
    }

    if ([a1 allowAnyCatalogAccess])
    {
      id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
      id v12 = (void *)objc_claimAutoreleasedReturnValue( [v11 localizedStringForKey:@"ContextMenuAddToLibrary" value:&stru_100279068 table:0]);
      id v7 = (void *)objc_claimAutoreleasedReturnValue( [a1 _menuItemForNoAccessWithSubject:v4 title:v12 identifier:@"AddToLibrary"]);

      goto LABEL_15;
    }

+ (id)_menuItemForRemoveMPObject:(id)a3 title:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_alloc(&OBJC_CLASS___TVPMusicContextMenuDataItem);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue( [v8 localizedStringForKey:@"ContextMenuRemoveFromLibrary" value:&stru_100279068 table:0]);
  id v14 = _NSConcreteStackBlock;
  uint64_t v15 = 3221225472LL;
  id v16 = sub_100069078;
  id v17 = &unk_100268B30;
  id v18 = v6;
  id v19 = v5;
  id v10 = v5;
  id v11 = v6;
  id v12 = [v7 initWithTitle:v9 actionBlock:&v14];

  objc_msgSend(v12, "setMenuItemType:", 5, v14, v15, v16, v17);
  return v12;
}

+ (id)_menuItemForAddMPObject:(id)a3 isExplicit:(BOOL)a4
{
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 identifiers]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 universalStore]);
  id v9 = [v8 adamID];
  if (v9)
  {
    id v10 = v9;
  }

  else
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v6 identifiers]);
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 universalStore]);
    id v10 = [v12 subscriptionAdamID];

    if (!v10) {
      goto LABEL_7;
    }
  }

  if ([a1 _hasCloudLibrary] && objc_msgSend(a1, "allowFullCatalogAccess"))
  {
    id v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    id v14 = (void *)objc_claimAutoreleasedReturnValue( [v13 localizedStringForKey:@"ContextMenuAddToLibrary" value:&stru_100279068 table:0]);

    id v15 = objc_alloc(&OBJC_CLASS___TVPMusicContextMenuDataItem);
    id v20 = _NSConcreteStackBlock;
    uint64_t v21 = 3221225472LL;
    id v22 = sub_100069470;
    id v23 = &unk_10026B8C0;
    id v24 = v14;
    id v25 = a1;
    BOOL v27 = a4;
    id v26 = v10;
    id v16 = v14;
    id v17 = [v15 initWithTitle:v16 actionBlock:&v20];
    objc_msgSend(v17, "setMenuItemType:", 4, v20, v21, v22, v23);

    goto LABEL_10;
  }

+ (id)_menuItemForCreateStationFromSong:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [a1 allowFullCatalogAccess];
  id v6 = 0LL;
  if (v4 && v5)
  {
    if (([v4 hasVideo] & 1) != 0
      || !+[TVMusicRadioUtilities canPlayFromMPSong:](&OBJC_CLASS___TVMusicRadioUtilities, "canPlayFromMPSong:", v4))
    {
      id v6 = 0LL;
    }

    else
    {
      id v7 = objc_alloc(&OBJC_CLASS___TVPMusicContextMenuDataItem);
      id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
      id v9 = (void *)objc_claimAutoreleasedReturnValue( [v8 localizedStringForKey:@"ContextMenuCreateStation" value:&stru_100279068 table:0]);
      id v11 = _NSConcreteStackBlock;
      uint64_t v12 = 3221225472LL;
      id v13 = sub_1000697EC;
      id v14 = &unk_100268E30;
      id v16 = a1;
      id v15 = v4;
      id v6 = [v7 initWithTitle:v9 actionBlock:&v11];

      objc_msgSend(v6, "setMenuItemType:", 12, v11, v12, v13, v14);
    }
  }

  return v6;
}

+ (id)_menuItemForCreateStationFromAlbum:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [a1 allowFullCatalogAccess];
  id v6 = 0LL;
  if (v4 && v5)
  {
    if (+[TVMusicRadioUtilities canPlayFromMPAlbum:](&OBJC_CLASS___TVMusicRadioUtilities, "canPlayFromMPAlbum:", v4))
    {
      id v7 = objc_alloc(&OBJC_CLASS___TVPMusicContextMenuDataItem);
      id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
      id v9 = (void *)objc_claimAutoreleasedReturnValue( [v8 localizedStringForKey:@"ContextMenuCreateStation" value:&stru_100279068 table:0]);
      id v11 = _NSConcreteStackBlock;
      uint64_t v12 = 3221225472LL;
      id v13 = sub_10006998C;
      id v14 = &unk_100268E30;
      id v16 = a1;
      id v15 = v4;
      id v6 = [v7 initWithTitle:v9 actionBlock:&v11];

      objc_msgSend(v6, "setMenuItemType:", 12, v11, v12, v13, v14);
    }

    else
    {
      id v6 = 0LL;
    }
  }

  return v6;
}

+ (id)_menuItemForCreateStationFromArtist:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [a1 allowFullCatalogAccess];
  id v6 = 0LL;
  if (v4 && v5)
  {
    if (+[TVMusicRadioUtilities canPlayFromMPArtist:](&OBJC_CLASS___TVMusicRadioUtilities, "canPlayFromMPArtist:", v4))
    {
      id v7 = objc_alloc(&OBJC_CLASS___TVPMusicContextMenuDataItem);
      id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
      id v9 = (void *)objc_claimAutoreleasedReturnValue( [v8 localizedStringForKey:@"ContextMenuCreateStation" value:&stru_100279068 table:0]);
      id v11 = _NSConcreteStackBlock;
      uint64_t v12 = 3221225472LL;
      id v13 = sub_100069B2C;
      id v14 = &unk_100268E30;
      id v16 = a1;
      id v15 = v4;
      id v6 = [v7 initWithTitle:v9 actionBlock:&v11];

      objc_msgSend(v6, "setMenuItemType:", 12, v11, v12, v13, v14);
    }

    else
    {
      id v6 = 0LL;
    }
  }

  return v6;
}

+ (id)_menuItemGoToPlaylist:(id)a3
{
  id v4 = a3;
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue([v4 identifiers]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 universalStore]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 globalPlaylistID]);
  if ([v7 length])
  {
  }

  else
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v4 identifiers]);
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 library]);
    id v10 = [v9 persistentID];

    if (!v10)
    {
      id v14 = 0LL;
      goto LABEL_5;
    }
  }

  id v11 = objc_alloc(&OBJC_CLASS___TVPMusicContextMenuDataItem);
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  id v13 = (void *)objc_claimAutoreleasedReturnValue( [v12 localizedStringForKey:@"ContextMenuGoToPlaylist" value:&stru_100279068 table:0]);
  id v16 = _NSConcreteStackBlock;
  uint64_t v17 = 3221225472LL;
  id v18 = sub_100069D24;
  id v19 = &unk_100268E30;
  id v21 = a1;
  id v20 = v4;
  id v14 = [v11 initWithTitle:v13 actionBlock:&v16];

  objc_msgSend(v14, "setMenuItemType:", 23, v16, v17, v18, v19);
LABEL_5:

  return v14;
}

+ (id)_menuItemGoToPlaylistWithSong:(id)a3
{
  id v4 = a3;
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue([v4 identifiers]);

  if (v5)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[TVMusicPlayerManager defaultPlayer](&OBJC_CLASS___TVMusicPlayerManager, "defaultPlayer"));
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 playQueue]);
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v4 identifiers]);
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 sectionForItemWithIdentifiers:v8]);

    if ([v9 type] == (id)4
      && (id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 playlist]), v10, v10))
    {
      id v11 = (void *)objc_claimAutoreleasedReturnValue([v9 playlist]);
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([a1 _menuItemGoToPlaylist:v11]);
    }

    else
    {
      uint64_t v12 = 0LL;
    }
  }

  else
  {
    uint64_t v12 = 0LL;
  }

  return v12;
}

+ (id)_menuItemForLibraryGoToArtist:(id)a3
{
  id v4 = a3;
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue([v4 mpObject]);
  if ([v5 type] == (id)1)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 mpObject]);
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 song]);

    if (v7)
    {
      id v8 = (void *)objc_claimAutoreleasedReturnValue([v4 mpObject]);
      id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 song]);
      unsigned int v10 = [v9 isLibraryAdded];

      if (!v10)
      {
        id v19 = 0LL;
        goto LABEL_21;
      }

      id v11 = (void *)objc_claimAutoreleasedReturnValue([v7 album]);
      if (!v11)
      {
        uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v4 container]);
        id v13 = [v12 type];

        if (v13 == (id)2)
        {
          id v14 = (void *)objc_claimAutoreleasedReturnValue([v4 container]);
          id v11 = (void *)objc_claimAutoreleasedReturnValue([v14 album]);
        }

        else
        {
          id v11 = 0LL;
        }
      }

      uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v7 artist]);
      id v20 = (void *)objc_claimAutoreleasedReturnValue([v17 identifiers]);
      id v21 = (void *)objc_claimAutoreleasedReturnValue([v20 library]);
      unint64_t v18 = (unint64_t)[v21 persistentID];

      goto LABEL_14;
    }
  }

  else
  {
  }

  id v15 = (void *)objc_claimAutoreleasedReturnValue([v4 mpObject]);
  id v16 = [v15 type];

  if (v16 != (id)2)
  {
    unint64_t v18 = 0LL;
    id v11 = 0LL;
    id v7 = 0LL;
    goto LABEL_16;
  }

  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v4 mpObject]);
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v17 album]);
  id v7 = 0LL;
  unint64_t v18 = 0LL;
LABEL_14:

  if (v11 && ([v11 isCompilation] & 1) == 0)
  {
    BOOL v27 = (void *)objc_claimAutoreleasedReturnValue([v11 artist]);
    int64_t v28 = (void *)objc_claimAutoreleasedReturnValue([v27 identifiers]);
    id v29 = (void *)objc_claimAutoreleasedReturnValue([v28 library]);
    unint64_t v22 = (unint64_t)[v29 persistentID];

    goto LABEL_17;
  }

+ (id)_menuItemForGoToArtist:(id)a3
{
  id v4 = a3;
  if ([v4 origin] != (id)1
    || (unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(+[TVMSubscriptionManager sharedInstance](&OBJC_CLASS___TVMSubscriptionManager, "sharedInstance")),
        unsigned __int8 v6 = [v5 hasMusicSubscription],
        v5,
        (v6 & 1) != 0))
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 mpObject]);
    if ([v7 type] == (id)3)
    {
      id v8 = (id)objc_claimAutoreleasedReturnValue([v7 artist]);
      if (!v8) {
        goto LABEL_15;
      }
    }

    else
    {
      if ([v7 type] == (id)1)
      {
        id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 song]);
      }

      else
      {
        if ([v7 type] != (id)2
          || (unint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v7 album]),
              unsigned __int8 v19 = [v18 isCompilation],
              v18,
              (v19 & 1) != 0))
        {
          id v8 = 0LL;
          goto LABEL_15;
        }

        id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 album]);
      }

      unsigned int v10 = v9;
      id v8 = (id)objc_claimAutoreleasedReturnValue([v9 artist]);

      if (!v8)
      {
LABEL_15:
        id v17 = 0LL;
        goto LABEL_16;
      }
    }

    id v11 = (void *)objc_claimAutoreleasedReturnValue([v8 identifiers]);
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 universalStore]);
    id v13 = [v12 adamID];

    if (v13)
    {
      id v14 = objc_alloc(&OBJC_CLASS___TVPMusicContextMenuDataItem);
      id v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
      id v16 = (void *)objc_claimAutoreleasedReturnValue( [v15 localizedStringForKey:@"ContextMenuGoToArtist" value:&stru_100279068 table:0]);
      id v21 = _NSConcreteStackBlock;
      uint64_t v22 = 3221225472LL;
      id v23 = sub_10006A5E4;
      id v24 = &unk_100268E30;
      id v26 = a1;
      id v8 = v8;
      id v25 = v8;
      id v17 = [v14 initWithTitle:v16 actionBlock:&v21];

      objc_msgSend(v17, "setMenuItemType:", 2, v21, v22, v23, v24);
LABEL_16:

      goto LABEL_17;
    }

    goto LABEL_15;
  }

  id v17 = (id)objc_claimAutoreleasedReturnValue([a1 _menuItemForLibraryGoToArtist:v4]);
LABEL_17:

  return v17;
}

+ (void)_goToPlaylistAction:(id)a3
{
  id v4 = a3;
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue([v4 identifiers]);
  unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue([v5 universalStore]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 globalPlaylistID]);
  id v8 = [v7 length];

  if (v8)
  {
    if (+[TVMusicApplication usingMusicUI](&OBJC_CLASS___TVMusicApplication, "usingMusicUI"))
    {
      [a1 _showPageForPlaylist:v4];
    }

    else
    {
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v4 identifiers]);
      id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 universalStore]);
      id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 globalPlaylistID]);
      id v15 = sub_100092F4C(v14, 0LL);
      id v16 = (void *)objc_claimAutoreleasedReturnValue(v15);

      [a1 _openJavascriptWithURL:v16];
    }
  }

  else if ([v4 isLibraryAdded])
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue( +[TVMusicMPLibraryRequestFactory playlistsLibraryRequestWithParentPlaylistFolder:]( &OBJC_CLASS___TVMusicMPLibraryRequestFactory,  "playlistsLibraryRequestWithParentPlaylistFolder:",  0LL));
    unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue([v4 identifiers]);
    uint64_t v22 = v10;
    id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v22, 1LL));
    [v9 setAllowedItemIdentifiers:v11];

    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472LL;
    v18[2] = sub_10006A8C0;
    v18[3] = &unk_10026B938;
    id v19 = v4;
    [v9 performWithResponseHandler:v18];
  }

  else
  {
    id v17 = (os_log_s *)qword_1002BE960;
    if (os_log_type_enabled((os_log_t)qword_1002BE960, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v21 = v4;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Can't show playlist: %@", buf, 0xCu);
    }
  }
}

+ (id)_menuItemForAddToPlaylist:(id)a3
{
  id v4 = a3;
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue([v4 mpObject]);
  if ([v4 origin] != (id)2)
  {
    unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue([v5 identifiers]);
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 universalStore]);
    id v8 = [v7 subscriptionAdamID];

    if (!v8) {
      goto LABEL_6;
    }
  }

  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue( [v9 localizedStringForKey:@"ContextMenuAddToPlaylist" value:&stru_100279068 table:0]);
  id v11 = (id)objc_claimAutoreleasedReturnValue([a1 _menuItemForNoAccessWithSubject:v4 title:v10 identifier:@"AddToPlaylist"]);

  if (!v11)
  {
LABEL_6:
    if (![a1 _hasCloudLibrary])
    {
LABEL_15:
      id v11 = 0LL;
      goto LABEL_16;
    }

    if ([v5 type] == (id)1)
    {
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v5 song]);
      if ([v12 hasLoadedValueForKey:MPModelPropertySongLibraryAddEligible])
      {
        unsigned int v13 = [v12 isLibraryAddEligible];

        if (!v13) {
          goto LABEL_15;
        }
      }

      else
      {
      }
    }

    id v14 = objc_alloc(&OBJC_CLASS___TVPMusicContextMenuDataItem);
    id v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    id v16 = (void *)objc_claimAutoreleasedReturnValue( [v15 localizedStringForKey:@"ContextMenuAddToPlaylist" value:&stru_100279068 table:0]);
    unint64_t v18 = _NSConcreteStackBlock;
    uint64_t v19 = 3221225472LL;
    id v20 = sub_10006AC1C;
    id v21 = &unk_100268E30;
    id v22 = v5;
    id v23 = a1;
    id v11 = [v14 initWithTitle:v16 actionBlock:&v18];

    objc_msgSend(v11, "setMenuItemType:", 6, v18, v19, v20, v21);
  }

+ (id)_menuItemForRenamePlaylist:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue([a3 mpObject]);
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue([v4 playlist]);

  if (v5 && ([v5 userEditableComponents] & 2) != 0)
  {
    id v7 = objc_alloc(&OBJC_CLASS___TVPMusicContextMenuDataItem);
    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    id v9 = (void *)objc_claimAutoreleasedReturnValue( [v8 localizedStringForKey:@"ContextMenuRenamePlaylist" value:&stru_100279068 table:0]);
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_10006AD7C;
    v11[3] = &unk_100268E30;
    id v13 = a1;
    id v12 = v5;
    id v6 = [v7 initWithTitle:v9 actionBlock:v11];
  }

  else
  {
    id v6 = 0LL;
  }

  return v6;
}

+ (id)_menuItemForRenamePlaylistFolder:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue([a3 mpObject]);
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue([v4 playlist]);

  if (v5 && ([v5 userEditableComponents] & 2) != 0)
  {
    id v7 = objc_alloc(&OBJC_CLASS___TVPMusicContextMenuDataItem);
    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    id v9 = (void *)objc_claimAutoreleasedReturnValue( [v8 localizedStringForKey:@"ContextMenuRenamePlaylistFolder" value:&stru_100279068 table:0]);
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_10006AF08;
    v11[3] = &unk_100268E30;
    id v13 = a1;
    id v12 = v5;
    id v6 = [v7 initWithTitle:v9 actionBlock:v11];
  }

  else
  {
    id v6 = 0LL;
  }

  return v6;
}

+ (void)_renamePlaylist:(id)a3 title:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[TVMusicKeyboardController sharedInstance](&OBJC_CLASS___TVMusicKeyboardController, "sharedInstance"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v5 name]);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_10006B048;
  v10[3] = &unk_100269AE8;
  id v11 = v5;
  id v9 = v5;
  [v7 presentKeyboardWithHeaderText:v6 initialText:v8 completion:v10];
}

+ (id)_menuItemForSongLyrics:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 mpObject]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 song]);

  if ([v4 storefrontSupportsLyrics])
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 lyrics]);
    unsigned __int8 v8 = [v7 hasStoreLyrics];

    char v9 = v8 ^ 1;
  }

  else
  {
    char v9 = 1;
  }

  unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue(+[TVMSubscriptionManager sharedInstance](&OBJC_CLASS___TVMSubscriptionManager, "sharedInstance"));
  unsigned int v11 = [v10 allowsLyricsFromCatalog];

  if ((v9 & 1) == 0 && v11
    || [v4 libraryAdded]
    && (id v12 = (void *)objc_claimAutoreleasedReturnValue([v6 lyrics]),
        id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 text]),
        id v14 = [v13 length],
        v13,
        v12,
        v14))
  {
    id v15 = [v4 origin];
    id v16 = @"ContextMenuLyrics";
    if (v15 == (id)3) {
      id v16 = @"ContextMenuLyricsNowPlaying";
    }
    id v17 = v16;
    id v18 = objc_alloc(&OBJC_CLASS___TVPMusicContextMenuDataItem);
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    id v20 = (void *)objc_claimAutoreleasedReturnValue([v19 localizedStringForKey:v17 value:&stru_100279068 table:0]);

    id v23 = _NSConcreteStackBlock;
    uint64_t v24 = 3221225472LL;
    id v25 = sub_10006B314;
    id v26 = &unk_100268E30;
    id v28 = a1;
    id v27 = v4;
    id v21 = [v18 initWithTitle:v20 actionBlock:&v23];

    objc_msgSend(v21, "setMenuItemType:", 13, v23, v24, v25, v26);
  }

  else
  {
    id v21 = 0LL;
  }

  return v21;
}

+ (id)_menuItemForCatalogPlaylistSubscribe:(id)a3
{
  id v4 = a3;
  if (([a1 allowFullCatalogAccess] & 1) == 0
    && [a1 allowAnyCatalogAccess])
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    id v6 = (void *)objc_claimAutoreleasedReturnValue( [v5 localizedStringForKey:@"ContextMenuAddToLibrary" value:&stru_100279068 table:0]);
    id v7 = (id)objc_claimAutoreleasedReturnValue([a1 _menuItemForNoAccessWithSubject:v4 title:v6 identifier:@"AddToLibrary"]);
LABEL_12:

    goto LABEL_13;
  }

  unsigned __int8 v8 = (void *)objc_claimAutoreleasedReturnValue([v4 mpObject]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v8 playlist]);

  if (v5
    && [a1 _hasCloudLibrary]
    && [a1 allowFullCatalogAccess])
  {
    char v9 = (void *)objc_claimAutoreleasedReturnValue([v5 identifiers]);
    unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue([v9 universalStore]);
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v10 globalPlaylistID]);

    if ([v6 length] && (objc_msgSend(v4, "libraryAdded") & 1) == 0)
    {
      id v11 = objc_alloc(&OBJC_CLASS___TVPMusicContextMenuDataItem);
      id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
      id v13 = (void *)objc_claimAutoreleasedReturnValue( [v12 localizedStringForKey:@"ContextMenuAddToLibrary" value:&stru_100279068 table:0]);
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472LL;
      v15[2] = sub_10006B534;
      v15[3] = &unk_100269EF8;
      id v18 = a1;
      id v16 = v5;
      id v17 = v6;
      id v7 = [v11 initWithTitle:v13 actionBlock:v15];

      [v7 setMenuItemType:4];
    }

    else
    {
      id v7 = 0LL;
    }

    goto LABEL_12;
  }

  id v7 = 0LL;
LABEL_13:

  return v7;
}

+ (id)_menuItemForCatalogPlaylistUnsubscribe:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 mpObject]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 playlist]);

  if (v6 && [a1 _hasCloudLibrary])
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 identifiers]);
    unsigned __int8 v8 = (void *)objc_claimAutoreleasedReturnValue([v7 universalStore]);
    char v9 = (void *)objc_claimAutoreleasedReturnValue([v8 globalPlaylistID]);

    if ([v9 length] && objc_msgSend(v4, "libraryAdded"))
    {
      id v10 = objc_alloc(&OBJC_CLASS___TVPMusicContextMenuDataItem);
      id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
      id v12 = (void *)objc_claimAutoreleasedReturnValue( [v11 localizedStringForKey:@"ContextMenuRemoveFromLibrary" value:&stru_100279068 table:0]);
      id v15 = _NSConcreteStackBlock;
      uint64_t v16 = 3221225472LL;
      id v17 = sub_10006B89C;
      id v18 = &unk_100268E30;
      id v20 = a1;
      id v19 = v6;
      id v13 = [v10 initWithTitle:v12 actionBlock:&v15];

      objc_msgSend(v13, "setMenuItemType:", 5, v15, v16, v17, v18);
    }

    else
    {
      id v13 = 0LL;
    }
  }

  else
  {
    id v13 = 0LL;
  }

  return v13;
}

+ (id)_menuItemForCatalogShuffle
{
  if ([a1 allowFullCatalogAccess])
  {
    id v2 = objc_alloc(&OBJC_CLASS___TVPMusicContextMenuDataItem);
    id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    id v4 = (void *)objc_claimAutoreleasedReturnValue( [v3 localizedStringForKey:@"ContextMenuShuffle" value:&stru_100279068 table:0]);
    id v5 = [v2 initWithTitle:v4 actionBlock:0];

    [v5 setMenuItemType:9];
  }

  else
  {
    id v5 = 0LL;
  }

  return v5;
}

+ (id)_menuItemForGoToTVShow:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue([a3 mpObject]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 tvEpisode]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 identifiers]);

  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 universalStore]);
  id v8 = [v7 adamID];
  if (!v8)
  {
    char v9 = (void *)objc_claimAutoreleasedReturnValue([v6 universalStore]);
    id v8 = [v9 subscriptionAdamID];
  }

  id v10 = (void *)objc_claimAutoreleasedReturnValue([a1 _menuItemForGoToTVShowWithEpisodeStoreID:v8]);
  return v10;
}

+ (id)_menuItemForGoToTVShowWithEpisodeStoreID:(int64_t)a3
{
  if (!a3 || +[TVMusicRestrictionsUI isVideoRestricted](&OBJC_CLASS___TVMusicRestrictionsUI, "isVideoRestricted")) {
    return 0LL;
  }
  id v6 = objc_alloc(&OBJC_CLASS___TVPMusicContextMenuDataItem);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue( [v7 localizedStringForKey:@"ContextMenuGoToTVShow" value:&stru_100279068 table:0]);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_10006BBE8;
  v10[3] = &unk_10026B978;
  void v10[4] = a3;
  v10[5] = a1;
  id v9 = [v6 initWithTitle:v8 actionBlock:v10];

  [v9 setMenuItemType:21];
  return v9;
}

+ (id)_menuItemForGoToMovie:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue([a3 mpObject]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 movie]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 identifiers]);

  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 universalStore]);
  id v8 = [v7 adamID];
  if (!v8)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v6 universalStore]);
    id v8 = [v9 subscriptionAdamID];
  }

  id v10 = (void *)objc_claimAutoreleasedReturnValue([a1 _menuItemForGoToMovieWithStoreID:v8]);
  return v10;
}

+ (id)_menuItemForGoToMovieWithStoreID:(int64_t)a3
{
  if (!a3 || +[TVMusicRestrictionsUI isVideoRestricted](&OBJC_CLASS___TVMusicRestrictionsUI, "isVideoRestricted")) {
    return 0LL;
  }
  id v6 = objc_alloc(&OBJC_CLASS___TVPMusicContextMenuDataItem);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue( [v7 localizedStringForKey:@"ContextMenuGoToMovie" value:&stru_100279068 table:0]);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_10006BDEC;
  v10[3] = &unk_10026B978;
  void v10[4] = a3;
  v10[5] = a1;
  id v9 = [v6 initWithTitle:v8 actionBlock:v10];

  [v9 setMenuItemType:21];
  return v9;
}

+ (id)_kindForGenericObjectType:(int64_t)a3
{
  id v3 = 0LL;
  int64_t v4 = a3 - 1;
  uint64_t v5 = 7LL;
  switch(v4)
  {
    case 0LL:
      uint64_t v5 = 2LL;
      goto LABEL_8;
    case 1LL:
      uint64_t v5 = 1LL;
      goto LABEL_8;
    case 2LL:
      uint64_t v5 = 4LL;
      goto LABEL_8;
    case 3LL:
      uint64_t v5 = 3LL;
      goto LABEL_8;
    case 5LL:
      uint64_t v5 = 8LL;
      goto LABEL_8;
    case 6LL:
      uint64_t v5 = 9LL;
      goto LABEL_8;
    case 7LL:
      id v7 = (void *)objc_claimAutoreleasedReturnValue(+[MPModelTVEpisode kindWithVariants:](&OBJC_CLASS___MPModelTVEpisode, "kindWithVariants:", 2LL));
      id v8 = (void *)objc_claimAutoreleasedReturnValue(+[MPModelTVSeason kindWithEpisodeKind:](&OBJC_CLASS___MPModelTVSeason, "kindWithEpisodeKind:", v7));
      id v3 = (void *)objc_claimAutoreleasedReturnValue(+[MPModelTVShow kindWithSeasonKind:](&OBJC_CLASS___MPModelTVShow, "kindWithSeasonKind:", v8));

      return v3;
    case 8LL:
LABEL_8:
      id v3 = (void *)objc_claimAutoreleasedReturnValue( +[TVMusicPlaybackHelper modelKindForPlaybackType:]( &OBJC_CLASS___TVMusicPlaybackHelper,  "modelKindForPlaybackType:",  v5));
      break;
    default:
      return v3;
  }

  return v3;
}

+ (id)_propertiesForGenericObjectType:(int64_t)a3
{
  id v3 = 0LL;
  switch(a3)
  {
    case 1LL:
      uint64_t v4 = objc_claimAutoreleasedReturnValue( +[TVMusicMPLibraryRequestFactory propertySetForSongsInContextMenu]( &OBJC_CLASS___TVMusicMPLibraryRequestFactory,  "propertySetForSongsInContextMenu"));
      goto LABEL_9;
    case 2LL:
      uint64_t v4 = objc_claimAutoreleasedReturnValue( +[TVMusicMPLibraryRequestFactory propertySetForAlbumDetails]( &OBJC_CLASS___TVMusicMPLibraryRequestFactory,  "propertySetForAlbumDetails"));
      goto LABEL_9;
    case 3LL:
      uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[TVMusicMPLibraryRequestFactory artistsLibraryRequest]( &OBJC_CLASS___TVMusicMPLibraryRequestFactory,  "artistsLibraryRequest"));
      goto LABEL_6;
    case 4LL:
      uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[TVMusicMPLibraryRequestFactory playlistsLibraryRequestWithParentPlaylistFolder:]( &OBJC_CLASS___TVMusicMPLibraryRequestFactory,  "playlistsLibraryRequestWithParentPlaylistFolder:",  0LL));
LABEL_6:
      id v6 = v5;
      id v3 = (void *)objc_claimAutoreleasedReturnValue([v5 itemProperties]);

      return v3;
    case 6LL:
      uint64_t v4 = objc_claimAutoreleasedReturnValue( +[TVMusicMPLibraryRequestFactory propertySetForTVEpisode]( &OBJC_CLASS___TVMusicMPLibraryRequestFactory,  "propertySetForTVEpisode"));
      goto LABEL_9;
    case 9LL:
      uint64_t v4 = objc_claimAutoreleasedReturnValue( +[TVMusicMPLibraryRequestFactory propertySetForMovie]( &OBJC_CLASS___TVMusicMPLibraryRequestFactory,  "propertySetForMovie"));
LABEL_9:
      id v3 = (void *)v4;
      break;
    default:
      return v3;
  }

  return v3;
}

+ (id)_player
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(+[TVMusicPlayerManager sharedInstance](&OBJC_CLASS___TVMusicPlayerManager, "sharedInstance"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 player]);

  return v3;
}

+ (void)_findLibraryItemMatchingIdentifiers:(id)a3 itemKind:(id)a4 completionHandler:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = objc_opt_new(&OBJC_CLASS___MPModelLibraryRequest);
  -[MPModelLibraryRequest setItemKind:](v10, "setItemKind:", v8);

  id v15 = v9;
  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v15, 1LL));
  -[MPModelLibraryRequest setAllowedItemIdentifiers:](v10, "setAllowedItemIdentifiers:", v11);

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_10006C164;
  v13[3] = &unk_10026A188;
  id v14 = v7;
  id v12 = v7;
  -[MPModelLibraryRequest performWithResponseHandler:](v10, "performWithResponseHandler:", v13);
}

+ (void)_removeLibraryItemItemMatchingIdentifiers:(id)a3 itemKind:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10006C248;
  v7[3] = &unk_10026B9A0;
  id v8 = a3;
  id v6 = v8;
  [a1 _findLibraryItemMatchingIdentifiers:v6 itemKind:a4 completionHandler:v7];
}

+ (void)_openJavascriptWithURL:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4)
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472LL;
    v6[2] = sub_10006C3A0;
    v6[3] = &unk_100268F50;
    id v7 = v4;
    [a1 _performWithAppInForeground:v6];
  }
}

+ (void)_performWithAppInForeground:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](&OBJC_CLASS___UIApplication, "sharedApplication"));
  id v5 = [v4 applicationState];

  if (v5)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[TVMusicNowPlayingManager sharedInstance](&OBJC_CLASS___TVMusicNowPlayingManager, "sharedInstance"));
    unsigned int v7 = [v6 isNowPlayingVisible];

    if (v7)
    {
      +[TVMusicSystemNowPlayingViewController dismissCurrentRemoteViewController]( &OBJC_CLASS___TVMusicSystemNowPlayingViewController,  "dismissCurrentRemoteViewController");
      block = 0LL;
      uint64_t p_block = (uint64_t)&block;
      uint64_t v23 = 0x3032000000LL;
      uint64_t v24 = sub_10006C618;
      id v25 = sub_10006C628;
      id v26 = 0LL;
      id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
      id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSOperationQueue mainQueue](&OBJC_CLASS___NSOperationQueue, "mainQueue"));
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472LL;
      v18[2] = sub_10006C630;
      v18[3] = &unk_10026B9C8;
      id v20 = &block;
      id v19 = v3;
      uint64_t v10 = objc_claimAutoreleasedReturnValue( [v8 addObserverForName:@"TVMusicNowPlayingWillDisappear" object:0 queue:v9 usingBlock:v18]);
      id v11 = *(void **)(p_block + 40);
      *(void *)(p_block + 40) = v10;

      _Block_object_dispose(&block, 8);
      id v12 = v19;
    }

    else
    {
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472LL;
      id v15 = sub_10006C700;
      uint64_t v16 = &unk_100268D60;
      id v17 = v3;
      id v13 = v14;
      if (+[NSThread isMainThread](&OBJC_CLASS___NSThread, "isMainThread"))
      {
        v15((uint64_t)v13);
      }

      else
      {
        block = _NSConcreteStackBlock;
        uint64_t p_block = 3221225472LL;
        uint64_t v23 = (uint64_t)sub_10006DFB0;
        uint64_t v24 = (uint64_t (*)(uint64_t, uint64_t))&unk_100268D60;
        id v25 = v13;
        dispatch_async(&_dispatch_main_q, &block);
      }

      id v12 = v17;
    }
  }

  else
  {
    (*((void (**)(id, void))v3 + 2))(v3, 0LL);
  }
}

+ (void)_presentViewController:(id)a3
{
  id v3 = a3;
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[TVMusicAppDelegate theApp](&OBJC_CLASS___TVMusicAppDelegate, "theApp"));
  [v4 presentViewController:v3];
}

+ (void)_showPageForArtist:(id)a3
{
  id v3 = a3;
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[TVMusicUIMainViewController shared](&OBJC_CLASS____TtC7TVMusic27TVMusicUIMainViewController, "shared"));
  [v4 showPageForArtist:v3];
}

+ (void)_showPageForAlbum:(id)a3
{
  id v3 = a3;
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[TVMusicUIMainViewController shared](&OBJC_CLASS____TtC7TVMusic27TVMusicUIMainViewController, "shared"));
  [v4 showCatalogPageForAlbum:v3];
}

+ (void)_showPageForPlaylist:(id)a3
{
  id v3 = a3;
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[TVMusicUIMainViewController shared](&OBJC_CLASS____TtC7TVMusic27TVMusicUIMainViewController, "shared"));
  [v4 showCatalogPageForPlaylist:v3];
}

+ (BOOL)_hasCloudLibrary
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(+[TVMusicLibraryManager sharedInstance](&OBJC_CLASS___TVMusicLibraryManager, "sharedInstance"));
  BOOL v3 = [v2 cloudStatus] == (id)1;

  return v3;
}

+ (id)_contextMenuForSong:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 mpObject]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 song]);

  unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue([v4 container]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 anyObject]);

  id v9 = (void *)objc_claimAutoreleasedReturnValue([v4 title]);
  if (!v9)
  {
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([a1 _menuTitleForMPSong:v6]);
    [v4 setTitle:v10];
  }

  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](&OBJC_CLASS___NSMutableArray, "arrayWithCapacity:", 15LL));
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v6 album]);
  uint64_t v13 = objc_claimAutoreleasedReturnValue([v12 title]);
  if (!v13) {
    goto LABEL_9;
  }
  id v14 = (void *)v13;
  id v15 = (void *)objc_claimAutoreleasedReturnValue([v4 container]);
  if ([v15 type] != (id)2)
  {

    goto LABEL_8;
  }

  id v16 = [v4 origin];

  if (v16 == (id)3)
  {
LABEL_8:
    id v12 = (void *)objc_claimAutoreleasedReturnValue([a1 _menuItemForGoToAlbumWithSong:v6]);
    objc_msgSend(v11, "tvs_addObjectIfNotNil:", v12);
LABEL_9:
  }

  id v17 = (void *)objc_claimAutoreleasedReturnValue([a1 _menuItemForGoToArtist:v4]);
  objc_msgSend(v11, "tvs_addObjectIfNotNil:", v17);

  if ([v4 origin] == (id)3)
  {
    id v18 = (void *)objc_claimAutoreleasedReturnValue([a1 _menuItemGoToPlaylistWithSong:v6]);
    objc_msgSend(v11, "tvs_addObjectIfNotNil:", v18);
  }

  id v19 = (void *)objc_claimAutoreleasedReturnValue([a1 _menuItemForAddOrRemoveSong:v4]);
  objc_msgSend(v11, "tvs_addObjectIfNotNil:", v19);

  if ([v4 origin] == (id)1)
  {
    id v20 = (void *)objc_claimAutoreleasedReturnValue([v4 container]);
    id v21 = [v20 type];

    if (v21 == (id)4)
    {
      id v22 = (void *)objc_claimAutoreleasedReturnValue([v4 container]);
      uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([v22 playlist]);
      unsigned __int8 v24 = [v23 userEditableComponents];

      if ((v24 & 1) != 0)
      {
        id v25 = (void *)objc_claimAutoreleasedReturnValue([v4 container]);
        id v26 = (void *)objc_claimAutoreleasedReturnValue([v25 playlist]);
        id v27 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( a1,  "_menuItemForLibraryRemoveSong:fromPlaylist:atPosition:",  v6,  v26,  objc_msgSend(v4, "playlistIndex")));
        objc_msgSend(v11, "tvs_addObjectIfNotNil:", v27);
      }
    }
  }

  id v28 = (void *)objc_claimAutoreleasedReturnValue([a1 _menuItemForAddToPlaylist:v4]);
  objc_msgSend(v11, "tvs_addObjectIfNotNil:", v28);

  if ([v4 origin] == (id)2)
  {
    id v29 = (void *)objc_claimAutoreleasedReturnValue([a1 _menuItemForCatalogShuffle]);
    objc_msgSend(v11, "tvs_addObjectIfNotNil:", v29);
  }

  if ([v4 origin] == (id)3)
  {
    if (([v4 libraryAdded] & 1) == 0
      && ![a1 allowFullCatalogAccess])
    {
      goto LABEL_28;
    }

    id v30 = objc_alloc(&OBJC_CLASS___TVPMusicContextMenuDataItem);
    id v31 = [v30 initWithIdentifier:TVPMusicContextMenuPlayNextIdentifier actionBlock:0];
    [v11 addObject:v31];
  }

  else
  {
    if ([v4 origin] == (id)2)
    {
      id v32 = (void *)objc_claimAutoreleasedReturnValue([a1 _menuItemForPlayNext:v4 actionBlock:0]);
      objc_msgSend(v11, "tvs_addObjectIfNotNil:", v32);

      id v33 = (void *)objc_claimAutoreleasedReturnValue([a1 _menuItemForPlayLast:v4 actionBlock:0]);
      objc_msgSend(v11, "tvs_addObjectIfNotNil:", v33);

      uint64_t v34 = objc_claimAutoreleasedReturnValue([a1 _menuItemForAddToQueue:v4 actionBlock:0]);
    }

    else
    {
      unint64_t v35 = (void *)objc_claimAutoreleasedReturnValue([a1 _menuItemForPlaySong:v6 inContainer:v8 playbackAction:1]);
      objc_msgSend(v11, "tvs_addObjectIfNotNil:", v35);

      v36 = (void *)objc_claimAutoreleasedReturnValue([a1 _menuItemForPlaySong:v6 inContainer:v8 playbackAction:2]);
      objc_msgSend(v11, "tvs_addObjectIfNotNil:", v36);

      uint64_t v34 = objc_claimAutoreleasedReturnValue([a1 _menuItemForPlaySong:v6 inContainer:v8 playbackAction:3]);
    }

    id v31 = (id)v34;
    objc_msgSend(v11, "tvs_addObjectIfNotNil:", v34);
  }

LABEL_28:
  v37 = (void *)objc_claimAutoreleasedReturnValue([a1 _menuItemForCreateStationFromSong:v6]);
  objc_msgSend(v11, "tvs_addObjectIfNotNil:", v37);

  v38 = (void *)objc_claimAutoreleasedReturnValue([a1 _menuItemForSongLyrics:v4]);
  objc_msgSend(v11, "tvs_addObjectIfNotNil:", v38);

  v39 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( a1,  "_menuItemForFavoriteMPObject:isInLibrary:currentState:",  v6,  objc_msgSend(v4, "libraryAdded"),  objc_msgSend(v4, "favoriteState")));
  objc_msgSend(v11, "tvs_addObjectIfNotNil:", v39);

  v40 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( a1,  "_menuItemForSuggestLessMPObject:isInLibrary:currentState:",  v6,  objc_msgSend(v4, "libraryAdded"),  objc_msgSend(v4, "favoriteState")));
  objc_msgSend(v11, "tvs_addObjectIfNotNil:", v40);

  if ([v11 count])
  {
    v41 = objc_alloc(&OBJC_CLASS___TVPMusicContextMenuData);
    v42 = (void *)objc_claimAutoreleasedReturnValue([v4 title]);
    v43 = -[TVPMusicContextMenuData initWithHeading:menuItems:](v41, "initWithHeading:menuItems:", v42, v11);
  }

  else
  {
    v43 = 0LL;
  }

  return v43;
}

+ (id)_contextMenuForAlbum:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 mpObject]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 album]);

  unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue([v4 title]);
  if (!v7)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 title]);
    id v9 = [v8 length];

    if (v9)
    {
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v6 title]);
      [v4 setTitle:v10];
    }

    else
    {
      if ([v6 trackCount] == (id)1
        && (id v11 = (void *)objc_claimAutoreleasedReturnValue([v6 representativeSong]),
            id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 title]),
            id v13 = [v12 length],
            v12,
            v11,
            v13))
      {
        uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v6 representativeSong]);
        uint64_t v14 = objc_claimAutoreleasedReturnValue([v10 title]);
      }

      else
      {
        uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
        uint64_t v14 = objc_claimAutoreleasedReturnValue([v10 localizedStringForKey:@"UnknownAlbum" value:&stru_100279068 table:0]);
      }

      id v15 = (void *)v14;
      [v4 setTitle:v14];
    }
  }

  id v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](&OBJC_CLASS___NSMutableArray, "arrayWithCapacity:", 15LL));
  id v17 = (void *)objc_claimAutoreleasedReturnValue([a1 _menuItemForGoToArtist:v4]);
  objc_msgSend(v16, "tvs_addObjectIfNotNil:", v17);

  id v18 = (void *)objc_claimAutoreleasedReturnValue([a1 _menuItemForAddOrRemoveAlbum:v4]);
  objc_msgSend(v16, "tvs_addObjectIfNotNil:", v18);

  id v19 = (void *)objc_claimAutoreleasedReturnValue([a1 _menuItemForAddToPlaylist:v4]);
  objc_msgSend(v16, "tvs_addObjectIfNotNil:", v19);

  if ([v4 origin] == (id)1)
  {
    id v20 = (void *)objc_claimAutoreleasedReturnValue([v6 identifiers]);
    id v21 = (void *)objc_claimAutoreleasedReturnValue([v20 library]);
    id v22 = [v21 persistentID];

    uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue( [a1 _menuItemForLibraryPlayback:v4 itemType:1 persistentID:v22 playbackAction:1]);
    objc_msgSend(v16, "tvs_addObjectIfNotNil:", v23);

    unsigned __int8 v24 = (void *)objc_claimAutoreleasedReturnValue( [a1 _menuItemForLibraryPlayback:v4 itemType:1 persistentID:v22 playbackAction:2]);
    objc_msgSend(v16, "tvs_addObjectIfNotNil:", v24);

    uint64_t v25 = objc_claimAutoreleasedReturnValue([a1 _menuItemForLibraryPlayback:v4 itemType:1 persistentID:v22 playbackAction:3]);
  }

  else
  {
    id v26 = (void *)objc_claimAutoreleasedReturnValue([a1 _menuItemForPlayNext:v4 actionBlock:0]);
    objc_msgSend(v16, "tvs_addObjectIfNotNil:", v26);

    id v27 = (void *)objc_claimAutoreleasedReturnValue([a1 _menuItemForPlayLast:v4 actionBlock:0]);
    objc_msgSend(v16, "tvs_addObjectIfNotNil:", v27);

    uint64_t v25 = objc_claimAutoreleasedReturnValue([a1 _menuItemForAddToQueue:v4 actionBlock:0]);
  }

  id v28 = (void *)v25;
  objc_msgSend(v16, "tvs_addObjectIfNotNil:", v25);

LABEL_15:
  id v29 = (void *)objc_claimAutoreleasedReturnValue([a1 _menuItemForCreateStationFromAlbum:v6]);
  objc_msgSend(v16, "tvs_addObjectIfNotNil:", v29);

  id v30 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( a1,  "_menuItemForFavoriteMPObject:isInLibrary:currentState:",  v6,  objc_msgSend(v4, "libraryAdded"),  objc_msgSend(v4, "favoriteState")));
  objc_msgSend(v16, "tvs_addObjectIfNotNil:", v30);

  id v31 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( a1,  "_menuItemForSuggestLessMPObject:isInLibrary:currentState:",  v6,  objc_msgSend(v4, "libraryAdded"),  objc_msgSend(v4, "favoriteState")));
  objc_msgSend(v16, "tvs_addObjectIfNotNil:", v31);

  if ([v16 count])
  {
    id v32 = objc_alloc(&OBJC_CLASS___TVPMusicContextMenuData);
    id v33 = (void *)objc_claimAutoreleasedReturnValue([v4 title]);
    uint64_t v34 = -[TVPMusicContextMenuData initWithHeading:menuItems:](v32, "initWithHeading:menuItems:", v33, v16);
  }

  else
  {
    uint64_t v34 = 0LL;
  }

  return v34;
}

+ (id)_contextMenuForPlaylist:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 mpObject]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 playlist]);

  unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue([v4 title]);
  if (!v7)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 name]);
    [v4 setTitle:v8];
  }

  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](&OBJC_CLASS___NSMutableArray, "arrayWithCapacity:", 15LL));
  if ([v6 type] != (id)9)
  {
    if ([v4 libraryAdded]
      && ([v6 isSubscribed] & 1) == 0
      && (uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v6 identifiers]),
          id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 library]),
          id v12 = [v11 persistentID],
          v11,
          v10,
          v12))
    {
      id v13 = (void *)objc_claimAutoreleasedReturnValue([v6 name]);
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([a1 _menuItemForRemoveMPObjectFromLibrary:v6 title:v13]);
      objc_msgSend(v9, "tvs_addObjectIfNotNil:", v14);
    }

    else
    {
      id v15 = (void *)objc_claimAutoreleasedReturnValue([a1 _menuItemForCatalogPlaylistSubscribe:v4]);
      objc_msgSend(v9, "tvs_addObjectIfNotNil:", v15);

      id v13 = (void *)objc_claimAutoreleasedReturnValue([a1 _menuItemForCatalogPlaylistUnsubscribe:v4]);
      objc_msgSend(v9, "tvs_addObjectIfNotNil:", v13);
    }
  }

  id v16 = (void *)objc_claimAutoreleasedReturnValue([a1 _menuItemForRenamePlaylist:v4]);
  objc_msgSend(v9, "tvs_addObjectIfNotNil:", v16);

  id v17 = (void *)objc_claimAutoreleasedReturnValue([a1 _menuItemForAddToPlaylist:v4]);
  objc_msgSend(v9, "tvs_addObjectIfNotNil:", v17);

  if ([v4 origin] == (id)2)
  {
    id v18 = (void *)objc_claimAutoreleasedReturnValue([a1 _menuItemForCatalogShuffle]);
    objc_msgSend(v9, "tvs_addObjectIfNotNil:", v18);
  }

  if ([v4 origin] == (id)2)
  {
    id v19 = (void *)objc_claimAutoreleasedReturnValue([a1 _menuItemForPlayNext:v4 actionBlock:0]);
    objc_msgSend(v9, "tvs_addObjectIfNotNil:", v19);

    id v20 = (void *)objc_claimAutoreleasedReturnValue([a1 _menuItemForPlayLast:v4 actionBlock:0]);
    objc_msgSend(v9, "tvs_addObjectIfNotNil:", v20);

    uint64_t v21 = objc_claimAutoreleasedReturnValue([a1 _menuItemForAddToQueue:v4 actionBlock:0]);
  }

  else
  {
    id v22 = (void *)objc_claimAutoreleasedReturnValue([v6 identifiers]);
    uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([v22 library]);
    id v24 = [v23 persistentID];

    uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue( [a1 _menuItemForLibraryPlayback:v4 itemType:3 persistentID:v24 playbackAction:1]);
    objc_msgSend(v9, "tvs_addObjectIfNotNil:", v25);

    id v26 = (void *)objc_claimAutoreleasedReturnValue( [a1 _menuItemForLibraryPlayback:v4 itemType:3 persistentID:v24 playbackAction:2]);
    objc_msgSend(v9, "tvs_addObjectIfNotNil:", v26);

    uint64_t v21 = objc_claimAutoreleasedReturnValue([a1 _menuItemForLibraryPlayback:v4 itemType:3 persistentID:v24 playbackAction:3]);
  }

  id v27 = (void *)v21;
  objc_msgSend(v9, "tvs_addObjectIfNotNil:", v21);

LABEL_17:
  id v28 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( a1,  "_menuItemForFavoriteMPObject:isInLibrary:currentState:",  v6,  objc_msgSend(v4, "libraryAdded"),  objc_msgSend(v4, "favoriteState")));
  objc_msgSend(v9, "tvs_addObjectIfNotNil:", v28);

  id v29 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( a1,  "_menuItemForSuggestLessMPObject:isInLibrary:currentState:",  v6,  objc_msgSend(v4, "libraryAdded"),  objc_msgSend(v4, "favoriteState")));
  objc_msgSend(v9, "tvs_addObjectIfNotNil:", v29);

  if ([v9 count])
  {
    id v30 = objc_alloc(&OBJC_CLASS___TVPMusicContextMenuData);
    id v31 = (void *)objc_claimAutoreleasedReturnValue([v4 title]);
    id v32 = -[TVPMusicContextMenuData initWithHeading:menuItems:](v30, "initWithHeading:menuItems:", v31, v9);
  }

  else
  {
    id v32 = 0LL;
  }

  return v32;
}

+ (id)_contextMenuForPlaylistFolder:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 mpObject]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 playlist]);

  unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue([v4 title]);
  id v8 = v7;
  if (v7) {
    id v9 = v7;
  }
  else {
    id v9 = (id)objc_claimAutoreleasedReturnValue([v6 name]);
  }
  uint64_t v10 = v9;

  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  if ([v6 type] == (id)3)
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue([a1 _menuItemForRenamePlaylistFolder:v4]);
    objc_msgSend(v11, "tvs_addObjectIfNotNil:", v12);
  }

  if ([v11 count]) {
    id v13 = -[TVPMusicContextMenuData initWithHeading:menuItems:]( objc_alloc(&OBJC_CLASS___TVPMusicContextMenuData),  "initWithHeading:menuItems:",  v10,  v11);
  }
  else {
    id v13 = 0LL;
  }

  return v13;
}

+ (id)_menuDataWithTitle:(id)a3 addItemsBlock:(id)a4
{
  id v5 = a3;
  id v6 = (void (**)(id, void *))a4;
  unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](&OBJC_CLASS___NSMutableArray, "arrayWithCapacity:", 20LL));
  v6[2](v6, v7);

  if ([v7 count]) {
    id v8 = -[TVPMusicContextMenuData initWithHeading:menuItems:]( objc_alloc(&OBJC_CLASS___TVPMusicContextMenuData),  "initWithHeading:menuItems:",  v5,  v7);
  }
  else {
    id v8 = 0LL;
  }

  return v8;
}

+ (id)_contextMenuForTVEpisode:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 mpObject]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 tvEpisode]);

  unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue([v4 title]);
  if (!v7)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 title]);
    [v4 setTitle:v8];
  }

  id v9 = (void *)objc_claimAutoreleasedReturnValue([v4 title]);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  void v14[2] = sub_10006D97C;
  v14[3] = &unk_10026B9F0;
  id v16 = v6;
  id v17 = a1;
  id v15 = v4;
  id v10 = v6;
  id v11 = v4;
  id v12 = (void *)objc_claimAutoreleasedReturnValue([a1 _menuDataWithTitle:v9 addItemsBlock:v14]);

  return v12;
}

+ (id)_contextMenuForMovie:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 mpObject]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 movie]);

  unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue([v4 title]);
  if (!v7)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 title]);
    [v4 setTitle:v8];
  }

  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](&OBJC_CLASS___NSMutableArray, "arrayWithCapacity:", 5LL));
  if ([v4 origin] == (id)1)
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v4 container]);
    id v11 = [v10 type];

    if (v11 != (id)9)
    {
      id v12 = (void *)objc_claimAutoreleasedReturnValue([v6 identifiers]);
      id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 universalStore]);
      id v14 = [v13 adamID];
      if (!v14)
      {
        id v15 = (void *)objc_claimAutoreleasedReturnValue([v6 identifiers]);
        id v16 = (void *)objc_claimAutoreleasedReturnValue([v15 universalStore]);
        id v14 = [v16 subscriptionAdamID];
      }

      id v17 = (void *)objc_claimAutoreleasedReturnValue([a1 _menuItemForGoToMovieWithStoreID:v14]);
      objc_msgSend(v9, "tvs_addObjectIfNotNil:", v17);
    }
  }

  id v18 = (void *)objc_claimAutoreleasedReturnValue([a1 _menuItemForAddOrRemoveTVorMovie:v4]);
  objc_msgSend(v9, "tvs_addObjectIfNotNil:", v18);

  if ((_os_feature_enabled_impl("MediaPlayer", "Favoriting") & 1) == 0)
  {
    id v19 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( a1,  "_menuItemForFavoriteMPObject:isInLibrary:currentState:",  v6,  objc_msgSend(v4, "libraryAdded"),  objc_msgSend(v4, "favoriteState")));
    objc_msgSend(v9, "tvs_addObjectIfNotNil:", v19);

    id v20 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( a1,  "_menuItemForSuggestLessMPObject:isInLibrary:currentState:",  v6,  objc_msgSend(v4, "libraryAdded"),  objc_msgSend(v4, "favoriteState")));
    objc_msgSend(v9, "tvs_addObjectIfNotNil:", v20);
  }

  if ([v9 count])
  {
    uint64_t v21 = objc_alloc(&OBJC_CLASS___TVPMusicContextMenuData);
    id v22 = (void *)objc_claimAutoreleasedReturnValue([v4 title]);
    uint64_t v23 = -[TVPMusicContextMenuData initWithHeading:menuItems:](v21, "initWithHeading:menuItems:", v22, v9);
  }

  else
  {
    uint64_t v23 = 0LL;
  }

  return v23;
}

+ (id)_contextMenuForArtist:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 mpObject]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 artist]);

  unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue([v4 title]);
  if (!v7)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 name]);
    [v4 setTitle:v8];
  }

  id v9 = (void *)objc_claimAutoreleasedReturnValue([v4 title]);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  void v14[2] = sub_10006DE2C;
  v14[3] = &unk_10026B9F0;
  id v16 = v4;
  id v17 = a1;
  id v15 = v6;
  id v10 = v4;
  id v11 = v6;
  id v12 = (void *)objc_claimAutoreleasedReturnValue([a1 _menuDataWithTitle:v9 addItemsBlock:v14]);

  return v12;
}

@end
@interface TVMusicLibraryUtilities
+ (BOOL)isItemDisliked:(id)a3;
+ (BOOL)isItemFavorited:(id)a3;
+ (BOOL)isItemPendingAddToLibraryForAdamID:(int64_t)a3;
+ (BOOL)isPendingAddForMPObject:(id)a3;
+ (BOOL)isPlaylistPendingAddToLibraryForGlobalID:(id)a3;
+ (BOOL)playlistExistsWithPersistentID:(int64_t)a3;
+ (BOOL)playlistFolderExistsWithPersistentID:(int64_t)a3;
+ (id)_libraryAddRemoveQueue;
+ (id)_modelAlbumForAdamID:(int64_t)a3;
+ (id)_modelPlaylistForGlobalID:(id)a3;
+ (id)_modelSongForAdamID:(int64_t)a3;
+ (id)descriptionForUpdatedDate:(id)a3;
+ (id)playlistChangeRequestQueue;
+ (id)playlistWithPersistentID:(int64_t)a3;
+ (id)stringWithAppendedExplicitIndicator:(id)a3;
+ (id)urlForDisplayingPlaylist:(id)a3;
+ (int64_t)transientFavoriteStateForItem:(id)a3;
+ (void)_addGlobalPlaylistToLibrary:(id)a3 completionHandler:(id)a4;
+ (void)_addItemToPlaylist:(id)a3 objectToAdd:(id)a4 itemsToAdd:(id)a5 completionHandler:(id)a6;
+ (void)_checkForDuplicatesInPlaylist:(id)a3 songsToAdd:(id)a4 completion:(id)a5;
+ (void)_setFavoriteAction:(int64_t)a3 forItem:(id)a4 completion:(id)a5;
+ (void)_showHUDNotificationForAddToPlaylist:(id)a3 songs:(id)a4;
+ (void)_showToastForFavoriteAction:(int64_t)a3 isArtist:(BOOL)a4 isVideo:(BOOL)a5;
+ (void)_storeProductRequestForID:(id)a3 completionHandler:(id)a4;
+ (void)_storeRequestForID:(id)a3 profile:(id)a4 completionHandler:(id)a5;
+ (void)addAlbum:(id)a3 toPlaylist:(id)a4 songsToAdd:(id)a5 completionHandler:(id)a6;
+ (void)addGlobalPlaylistToLibraryWithID:(id)a3 completionHandler:(id)a4;
+ (void)addItemToLibraryWithAdamID:(int64_t)a3 completionHandler:(id)a4;
+ (void)addItemToLibraryWithMPObject:(id)a3;
+ (void)addPlaylist:(id)a3 toPlaylist:(id)a4 songsToAdd:(id)a5 completionHandler:(id)a6;
+ (void)addSong:(id)a3 toPlaylist:(id)a4 completionHandler:(id)a5;
+ (void)allPlaylistsInFolder:(id)a3 completion:(id)a4;
+ (void)createPlaylistWithName:(id)a3 parentPlaylist:(id)a4 completion:(id)a5;
+ (void)findItemInLibraryWithPersistentID:(int64_t)a3 itemKind:(id)a4 itemProperties:(id)a5 completionHandler:(id)a6;
+ (void)findMPObjectWithIdentifiers:(id)a3 itemKind:(id)a4 itemProperties:(id)a5 completionHandler:(id)a6;
+ (void)findMPSongInLibraryWithSubscriptionAdamID:(int64_t)a3 itemProperties:(id)a4 completionHandler:(id)a5;
+ (void)findMPSongWithIdentifiers:(id)a3 itemProperties:(id)a4 completionHandler:(id)a5;
+ (void)findPlaylistWithCloudGlobalID:(id)a3 completionHandler:(id)a4;
+ (void)findSingleMusicVideoInAlbum:(id)a3 completionHandler:(id)a4;
+ (void)getDurationForPlaylist:(id)a3 completion:(id)a4;
+ (void)getEntriesInLibraryPlaylist:(id)a3 songProperties:(id)a4 completion:(id)a5;
+ (void)getSongsInAlbum:(id)a3 completionHandler:(id)a4;
+ (void)getSongsInLibraryPlaylist:(id)a3 songProperties:(id)a4 completion:(id)a5;
+ (void)getSongsInPlaylist:(id)a3 completionHandler:(id)a4;
+ (void)isSongInLibrary:(id)a3 completionHandler:(id)a4;
+ (void)recentlyEditedPlaylistsWithMaxCount:(int64_t)a3 completion:(id)a4;
+ (void)removeMPObjectFromLibrary:(id)a3;
+ (void)removeSong:(id)a3 fromPlaylist:(id)a4 atPosition:(int64_t)a5 completionHandler:(id)a6;
+ (void)renamePlaylist:(id)a3 newName:(id)a4 completion:(id)a5;
+ (void)setFavoriteFlag:(BOOL)a3 forItem:(id)a4 completion:(id)a5;
+ (void)setSuggestLessFlag:(BOOL)a3 forItem:(id)a4 completion:(id)a5;
+ (void)showContextMenuForLibraryObject:(id)a3;
+ (void)showContextMenuForLibraryObject:(id)a3 inContainer:(id)a4;
+ (void)showPageForAlbum:(id)a3;
+ (void)showPageForArtist:(id)a3;
+ (void)showPageForComposer:(id)a3;
+ (void)showPageForPlaylist:(id)a3;
+ (void)storeURLRequestForID:(id)a3 completionHandler:(id)a4;
+ (void)updateArtist:(id)a3 completionHandler:(id)a4;
@end

@implementation TVMusicLibraryUtilities

+ (void)addItemToLibraryWithAdamID:(int64_t)a3 completionHandler:(id)a4
{
  id v6 = a4;
  v7 = (void (**)(void, void, void, void))v6;
  if (a3)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue( +[MPModelLibraryTransientStateController sharedDeviceLibraryController]( &OBJC_CLASS___MPModelLibraryTransientStateController,  "sharedDeviceLibraryController"));
    v9 = (void *)objc_opt_new(&OBJC_CLASS___MPMutableSectionedCollection);
    [v9 appendSection:&stru_100279068];
    v10 = (void *)objc_claimAutoreleasedReturnValue([a1 _modelSongForAdamID:a3]);
    [v9 appendItem:v10];

    v11 = (void *)objc_claimAutoreleasedReturnValue([a1 _modelAlbumForAdamID:a3]);
    [v9 appendItem:v11];

    v12 = (void *)objc_claimAutoreleasedReturnValue([v8 registerTransientAddState:1 forModelObjects:v9 relatedModelObjects:0]);
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472LL;
    v23 = sub_100040730;
    v24 = &unk_100269BE8;
    int64_t v25 = a3;
    v13 = v22;
    if (+[NSThread isMainThread](&OBJC_CLASS___NSThread, "isMainThread"))
    {
      v23((uint64_t)v13);
    }

    else
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_100046B48;
      block[3] = &unk_100268D60;
      v27 = v13;
      dispatch_async(&_dispatch_main_q, block);
    }

    v14 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([a1 _libraryAddRemoveQueue]);
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472LL;
    v17[2] = sub_100040808;
    v17[3] = &unk_10026A678;
    int64_t v21 = a3;
    id v19 = v12;
    v20 = v7;
    id v18 = v8;
    id v15 = v12;
    id v16 = v8;
    dispatch_async(v14, v17);

    goto LABEL_8;
  }

  if (v6)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  off_1002B60C8,  2LL,  0LL));
    ((void (**)(void, void, void, void *))v7)[2](v7, 0LL, 0LL, v9);
LABEL_8:
  }
}

+ (void)addItemToLibraryWithMPObject:(id)a3
{
  id v3 = a3;
  id v6 = (id)objc_opt_new(&OBJC_CLASS___MPMutableSectionedCollection);
  [v6 appendSection:&stru_100279068];
  [v6 appendItem:v3];
  v4 = (void *)objc_opt_new(&OBJC_CLASS___MPModelLibraryImportChangeRequest);
  [v4 setReferralObject:v3];

  [v4 setModelObjects:v6];
  [v4 setShouldLibraryAdd:1];
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[MPModelLibraryTransientStateController sharedDeviceLibraryController]( &OBJC_CLASS___MPModelLibraryTransientStateController,  "sharedDeviceLibraryController"));
  [v5 performLibraryImportChangeRequest:v4 withRelatedModelObjects:0];
}

+ (BOOL)isPendingAddForMPObject:(id)a3
{
  id v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[MPModelLibraryTransientStateController sharedDeviceLibraryController]( &OBJC_CLASS___MPModelLibraryTransientStateController,  "sharedDeviceLibraryController"));
  id v5 = [v4 transientAddStateForModelObject:v3];

  return v5 == (id)1;
}

+ (void)removeMPObjectFromLibrary:(id)a3
{
  id v4 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([a1 _libraryAddRemoveQueue]);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100040D10;
  block[3] = &unk_100268CF0;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, block);
}

+ (BOOL)isItemPendingAddToLibraryForAdamID:(int64_t)a3
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[MPModelLibraryTransientStateController sharedDeviceLibraryController]( &OBJC_CLASS___MPModelLibraryTransientStateController,  "sharedDeviceLibraryController"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([a1 _modelSongForAdamID:a3]);
  id v7 = [v5 transientAddStateForModelObject:v6];

  if (v7 == (id)1)
  {
    BOOL v8 = 1;
  }

  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue([a1 _modelAlbumForAdamID:a3]);
    id v10 = [v5 transientAddStateForModelObject:v9];

    BOOL v8 = v10 == (id)1;
  }

  return v8;
}

+ (BOOL)isPlaylistPendingAddToLibraryForGlobalID:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[MPModelLibraryTransientStateController sharedDeviceLibraryController]( &OBJC_CLASS___MPModelLibraryTransientStateController,  "sharedDeviceLibraryController"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([a1 _modelPlaylistForGlobalID:v4]);

  id v7 = [v5 transientAddStateForModelObject:v6];
  return v7 == (id)1;
}

+ (void)addGlobalPlaylistToLibraryWithID:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = (id)objc_claimAutoreleasedReturnValue([a1 _modelPlaylistForGlobalID:a3]);
  [a1 _addGlobalPlaylistToLibrary:v7 completionHandler:v6];
}

+ (void)_addGlobalPlaylistToLibrary:(id)a3 completionHandler:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  BOOL v7 = +[NSThread isMainThread](&OBJC_CLASS___NSThread, "isMainThread");
  if (v7)
  {
    sub_1000411A4((id)v7);
  }

  else
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100046B48;
    block[3] = &unk_100268D60;
    id v16 = &stru_10026A698;
    dispatch_async(&_dispatch_main_q, block);
  }

  BOOL v8 = (void *)objc_opt_new(&OBJC_CLASS___MPModelLibraryImportChangeRequest);
  [v8 setReferralObject:v5];
  v9 = (void *)objc_opt_new(&OBJC_CLASS___MPMutableSectionedCollection);
  [v9 appendSection:&stru_100279068];
  [v9 appendItem:v5];
  [v8 setModelObjects:v9];
  [v8 setShouldLibraryAdd:1];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_1000411E4;
  v12[3] = &unk_10026A6C0;
  id v13 = v5;
  id v14 = v6;
  id v10 = v5;
  id v11 = v6;
  [v8 performWithResponseHandler:v12];
}

+ (void)findMPObjectWithIdentifiers:(id)a3 itemKind:(id)a4 itemProperties:(id)a5 completionHandler:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  id v13 = objc_opt_new(&OBJC_CLASS___MPModelLibraryRequest);
  -[MPModelLibraryRequest setItemKind:](v13, "setItemKind:", v11);

  id v18 = v12;
  id v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v18, 1LL));
  -[MPModelLibraryRequest setAllowedItemIdentifiers:](v13, "setAllowedItemIdentifiers:", v14);

  -[MPModelLibraryRequest setItemProperties:](v13, "setItemProperties:", v10);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_100041514;
  v16[3] = &unk_10026A188;
  id v17 = v9;
  id v15 = v9;
  -[MPModelLibraryRequest performWithResponseHandler:](v13, "performWithResponseHandler:", v16);
}

+ (void)findItemInLibraryWithPersistentID:(int64_t)a3 itemKind:(id)a4 itemProperties:(id)a5 completionHandler:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = (id)objc_claimAutoreleasedReturnValue( +[MPIdentifierSet tvm_identifierSetForModelKind:withPersistentID:]( &OBJC_CLASS___MPIdentifierSet,  "tvm_identifierSetForModelKind:withPersistentID:",  v12,  a3));
  [a1 findMPObjectWithIdentifiers:v13 itemKind:v12 itemProperties:v11 completionHandler:v10];
}

+ (void)findMPSongInLibraryWithSubscriptionAdamID:(int64_t)a3 itemProperties:(id)a4 completionHandler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = (id)objc_claimAutoreleasedReturnValue( +[MPIdentifierSet tvm_identiferSetForSongWithStoreID:subscriptionID:]( &OBJC_CLASS___MPIdentifierSet,  "tvm_identiferSetForSongWithStoreID:subscriptionID:",  0LL,  a3));
  [a1 findMPSongWithIdentifiers:v10 itemProperties:v9 completionHandler:v8];
}

+ (void)findMPSongWithIdentifiers:(id)a3 itemProperties:(id)a4 completionHandler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[MPModelSong kindWithVariants:](&OBJC_CLASS___MPModelSong, "kindWithVariants:", 3LL));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_1000417AC;
  v13[3] = &unk_10026A6E8;
  id v14 = v8;
  id v12 = v8;
  [a1 findMPObjectWithIdentifiers:v10 itemKind:v11 itemProperties:v9 completionHandler:v13];
}

+ (void)isSongInLibrary:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  BOOL v7 = (void (**)(id, uint64_t))a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 identifiers]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 universalStore]);
  id v10 = [v9 adamID];
  if (!v10)
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v6 identifiers]);
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 universalStore]);
    id v10 = [v12 subscriptionAdamID];
  }

  if ([a1 isItemPendingAddToLibraryForAdamID:v10])
  {
    v7[2](v7, 1LL);
  }

  else
  {
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v6 identifiers]);
    uint64_t v18 = MPModelPropertySongLibraryAdded;
    id v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v18, 1LL));
    id v15 = (void *)objc_claimAutoreleasedReturnValue( +[MPPropertySet propertySetWithProperties:]( &OBJC_CLASS___MPPropertySet,  "propertySetWithProperties:",  v14));
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472LL;
    v16[2] = sub_1000419C8;
    v16[3] = &unk_10026A710;
    id v17 = v7;
    [a1 findMPSongWithIdentifiers:v13 itemProperties:v15 completionHandler:v16];
  }
}

+ (void)findPlaylistWithCloudGlobalID:(id)a3 completionHandler:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue( +[TVMusicMPLibraryRequestFactory playlistsLibraryRequestWithParentPlaylistFolder:userEditableOnly:allowEmptyPlaylists:]( &OBJC_CLASS___TVMusicMPLibraryRequestFactory,  "playlistsLibraryRequestWithParentPlaylistFolder:userEditableOnly:allowEmptyPlaylists:",  0LL,  0LL,  1LL));
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[MPIdentifierSet tvm_identifierSetForPlaylistWithGlobalID:]( &OBJC_CLASS___MPIdentifierSet,  "tvm_identifierSetForPlaylistWithGlobalID:",  v6));

  id v13 = v8;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v13, 1LL));
  [v7 setAllowedItemIdentifiers:v9];

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_100041B2C;
  v11[3] = &unk_10026A188;
  id v12 = v5;
  id v10 = v5;
  [v7 performWithResponseHandler:v11];
}

+ (void)removeSong:(id)a3 fromPlaylist:(id)a4 atPosition:(int64_t)a5 completionHandler:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a6;
  id v12 = (void *)objc_claimAutoreleasedReturnValue( +[TVMusicMPLibraryRequestFactory songsLibraryRequestForPlaylist:]( &OBJC_CLASS___TVMusicMPLibraryRequestFactory,  "songsLibraryRequestForPlaylist:",  v10));
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_100041C8C;
  v16[3] = &unk_10026A7D8;
  id v17 = v9;
  id v18 = v10;
  id v19 = v11;
  int64_t v20 = a5;
  id v13 = v11;
  id v14 = v10;
  id v15 = v9;
  [v12 performWithResponseHandler:v16];
}

+ (void)addSong:(id)a3 toPlaylist:(id)a4 completionHandler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = objc_alloc_init(&OBJC_CLASS___MPMutableSectionedCollection);
  [v11 appendSection:&stru_100279068];
  [v11 appendItem:v10];
  [a1 _addItemToPlaylist:v9 objectToAdd:v10 itemsToAdd:v11 completionHandler:v8];
}

+ (void)addAlbum:(id)a3 toPlaylist:(id)a4 songsToAdd:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  if (a5)
  {
    [a1 _addItemToPlaylist:v11 objectToAdd:v10 itemsToAdd:a5 completionHandler:v12];
  }

  else
  {
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_1000423D0;
    v13[3] = &unk_10026A800;
    id v17 = a1;
    id v14 = v11;
    id v15 = v10;
    id v16 = v12;
    [a1 getSongsInAlbum:v15 completionHandler:v13];
  }
}

+ (void)addPlaylist:(id)a3 toPlaylist:(id)a4 songsToAdd:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  if (a5)
  {
    [a1 _addItemToPlaylist:v11 objectToAdd:v10 itemsToAdd:a5 completionHandler:v12];
  }

  else
  {
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_1000425C4;
    v13[3] = &unk_10026A800;
    id v17 = a1;
    id v14 = v11;
    id v15 = v10;
    id v16 = v12;
    [a1 getSongsInPlaylist:v15 completionHandler:v13];
  }
}

+ (void)getEntriesInLibraryPlaylist:(id)a3 songProperties:(id)a4 completion:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if ([v7 isLibraryAdded]
    && (id v10 = (void *)objc_claimAutoreleasedReturnValue([v7 identifiers]),
        id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 library]),
        id v12 = [v11 persistentID],
        v11,
        v10,
        v12))
  {
    if (v8) {
      id v13 = v8;
    }
    else {
      id v13 = (id)objc_claimAutoreleasedReturnValue(+[MPPropertySet emptyPropertySet](&OBJC_CLASS___MPPropertySet, "emptyPropertySet"));
    }
    id v14 = v13;
    id v15 = (void *)objc_claimAutoreleasedReturnValue( +[TVMusicMPLibraryRequestFactory songsLibraryRequestWithPlaylist:songProperties:]( &OBJC_CLASS___TVMusicMPLibraryRequestFactory,  "songsLibraryRequestWithPlaylist:songProperties:",  v7,  v13));
    id v16 = (void *)objc_claimAutoreleasedReturnValue(+[MPModelSong kindWithVariants:](&OBJC_CLASS___MPModelSong, "kindWithVariants:", 3LL));
    int64_t v21 = v16;
    id v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v21, 1LL));
    id v18 = (void *)objc_claimAutoreleasedReturnValue(+[MPModelPlaylistEntry kindWithKinds:](&OBJC_CLASS___MPModelPlaylistEntry, "kindWithKinds:", v17));
    [v15 setItemKind:v18];

    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472LL;
    v19[2] = sub_1000428C0;
    v19[3] = &unk_10026A188;
    id v20 = v9;
    [v15 performWithResponseHandler:v19];
  }

  else
  {
    id v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  off_1002B60C8,  1LL,  0LL));
    (*((void (**)(id, void, void *))v9 + 2))(v9, 0LL, v14);
  }
}

+ (void)getSongsInLibraryPlaylist:(id)a3 songProperties:(id)a4 completion:(id)a5
{
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_1000429BC;
  v9[3] = &unk_10026A850;
  id v10 = a5;
  id v8 = v10;
  [a1 getEntriesInLibraryPlaylist:a3 songProperties:a4 completion:v9];
}

+ (void)getDurationForPlaylist:(id)a3 completion:(id)a4
{
  id v5 = a4;
  uint64_t v18 = MPModelPropertySongDuration;
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v18, 1LL));
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[MPPropertySet propertySetWithProperties:]( &OBJC_CLASS___MPPropertySet,  "propertySetWithProperties:",  v7));

  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[TVMusicMPLibraryRequestFactory songsLibraryRequestForPlaylist:]( &OBJC_CLASS___TVMusicMPLibraryRequestFactory,  "songsLibraryRequestForPlaylist:",  v6));
  id v10 = objc_alloc(&OBJC_CLASS___MPPropertySet);
  uint64_t v16 = MPModelRelationshipPlaylistEntrySong;
  id v17 = v8;
  id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v17,  &v16,  1LL));
  id v12 = [v10 initWithProperties:0 relationships:v11];
  [v9 setItemProperties:v12];

  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_100042C84;
  v14[3] = &unk_10026A188;
  id v15 = v5;
  id v13 = v5;
  [v9 performWithResponseHandler:v14];
}

+ (void)getSongsInPlaylist:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 isLibraryAdded]
    && (id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 identifiers]),
        id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 library]),
        id v10 = [v9 persistentID],
        v9,
        v8,
        v10))
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue( +[TVMusicMPLibraryRequestFactory propertySetForSongsWithDetails:]( &OBJC_CLASS___TVMusicMPLibraryRequestFactory,  "propertySetForSongsWithDetails:",  1LL));
    [a1 getSongsInLibraryPlaylist:v6 songProperties:v11 completion:v7];
  }

  else
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v6 identifiers]);
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 universalStore]);
    id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 globalPlaylistID]);

    if (v14)
    {
      id v15 = (void *)objc_claimAutoreleasedReturnValue([v6 identifiers]);
      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v15 universalStore]);
      id v17 = (void *)objc_claimAutoreleasedReturnValue([v16 globalPlaylistID]);
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472LL;
      v19[2] = sub_1000430A4;
      v19[3] = &unk_10026A8C8;
      id v21 = v7;
      id v20 = v6;
      [a1 _storeProductRequestForID:v17 completionHandler:v19];
    }

    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v23 = v6;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Unable to get items for playlist %@.",  buf,  0xCu);
      }

      uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  off_1002B60C8,  3LL,  0LL));
      (*((void (**)(id, void, void *))v7 + 2))(v7, 0LL, v18);
    }
  }
}

+ (void)getSongsInAlbum:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 identifiers]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 universalStore]);
  id v10 = [v9 adamID];
  if (!v10)
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v6 identifiers]);
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 universalStore]);
    id v10 = [v12 subscriptionAdamID];
  }

  id v13 = (void *)objc_claimAutoreleasedReturnValue([v6 identifiers]);
  id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 library]);
  if ([v14 persistentID])
  {
    unsigned int v15 = [v6 isLibraryAdded];

    if (v15)
    {
      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue( +[TVMusicMPLibraryRequestFactory songsLibraryRequestForAlbum:]( &OBJC_CLASS___TVMusicMPLibraryRequestFactory,  "songsLibraryRequestForAlbum:",  v6));
      v22[0] = _NSConcreteStackBlock;
      v22[1] = 3221225472LL;
      void v22[2] = sub_100043840;
      v22[3] = &unk_10026A8F0;
      id v24 = v7;
      id v23 = v6;
      [v16 performWithResponseHandler:v22];

      goto LABEL_12;
    }
  }

  else
  {
  }

  if (v10)
  {
    id v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", v10));
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v17 stringValue]);
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472LL;
    v19[2] = sub_100043994;
    v19[3] = &unk_10026A8C8;
    id v21 = v7;
    id v20 = v6;
    [a1 _storeProductRequestForID:v18 completionHandler:v19];

    uint64_t v16 = v21;
  }

  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v26 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Unable to get items for album %@.",  buf,  0xCu);
    }

    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  off_1002B60C8,  3LL,  0LL));
    (*((void (**)(id, void, void *))v7 + 2))(v7, 0LL, v16);
  }

+ (id)playlistChangeRequestQueue
{
  if (qword_1002BE878 != -1) {
    dispatch_once(&qword_1002BE878, &stru_10026A930);
  }
  return (id)qword_1002BE870;
}

+ (void)storeURLRequestForID:(id)a3 completionHandler:(id)a4
{
}

+ (void)showContextMenuForLibraryObject:(id)a3
{
}

+ (void)showContextMenuForLibraryObject:(id)a3 inContainer:(id)a4
{
  id v7 = a4;
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[MPModelGenericObject genericObjectWithModelObject:]( &OBJC_CLASS___MPModelGenericObject,  "genericObjectWithModelObject:",  a3));
  if (v7) {
    id v6 = (void *)objc_claimAutoreleasedReturnValue( +[MPModelGenericObject genericObjectWithModelObject:]( &OBJC_CLASS___MPModelGenericObject,  "genericObjectWithModelObject:",  v7));
  }
  else {
    id v6 = 0LL;
  }
  +[TVMusicContextMenuFactory contextMenuForLibraryObject:inContainer:completionHandler:]( &OBJC_CLASS___TVMusicContextMenuFactory,  "contextMenuForLibraryObject:inContainer:completionHandler:",  v5,  v6,  &stru_10026A950);
}

+ (void)_storeProductRequestForID:(id)a3 completionHandler:(id)a4
{
}

+ (void)_storeRequestForID:(id)a3 profile:(id)a4 completionHandler:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = objc_alloc_init(&OBJC_CLASS___ICStorePlatformRequest);
  id v19 = v9;
  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v19, 1LL));
  [v10 setItemIdentifiers:v11];

  [v10 setPersonalizationStyle:0];
  [v10 setKeyProfile:v8];

  id v12 = objc_alloc(&OBJC_CLASS___ICStoreRequestContext);
  id v13 = (void *)objc_claimAutoreleasedReturnValue(+[ICUserIdentity activeAccount](&OBJC_CLASS___ICUserIdentity, "activeAccount"));
  id v14 = -[ICStoreRequestContext initWithIdentity:](v12, "initWithIdentity:", v13);
  [v10 setRequestContext:v14];

  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_100043F5C;
  v17[3] = &unk_10026A978;
  id v18 = v7;
  id v15 = v7;
  id v16 = [v10 performWithResponseHandler:v17];
}

+ (void)_addItemToPlaylist:(id)a3 objectToAdd:(id)a4 itemsToAdd:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  id v12 = a5;
  id v13 = a4;
  id v14 = objc_alloc_init(&OBJC_CLASS___MPModelLibraryAddToPlaylistChangeRequest);
  [v14 setPlaylist:v10];
  [v14 setRepresentativeModelObject:v13];

  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_1000440FC;
  v18[3] = &unk_10026A9A0;
  id v21 = v11;
  id v22 = a1;
  id v19 = v14;
  id v20 = v10;
  id v15 = v10;
  id v16 = v11;
  id v17 = v14;
  [a1 _checkForDuplicatesInPlaylist:v15 songsToAdd:v12 completion:v18];
}

+ (void)_showHUDNotificationForAddToPlaylist:(id)a3 songs:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v6 totalItemCount];
  v17[0] = 0LL;
  v17[1] = v17;
  v17[2] = 0x2020000000LL;
  v17[3] = 0LL;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_100044358;
  v16[3] = &unk_10026A9C8;
  void v16[4] = v17;
  [v6 enumerateItemsUsingBlock:v16];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  id v11 = sub_1000443BC;
  id v12 = &unk_10026A9F0;
  id v14 = v17;
  id v15 = v7;
  id v8 = v5;
  id v13 = v8;
  id v9 = v10;
  if (+[NSThread isMainThread](&OBJC_CLASS___NSThread, "isMainThread"))
  {
    v11((uint64_t)v9);
  }

  else
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100046B48;
    block[3] = &unk_100268D60;
    id v19 = v9;
    dispatch_async(&_dispatch_main_q, block);
  }

  _Block_object_dispose(v17, 8);
}

+ (void)_checkForDuplicatesInPlaylist:(id)a3 songsToAdd:(id)a4 completion:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[TVMusicMPLibraryRequestFactory songsLibraryRequestForPlaylist:]( &OBJC_CLASS___TVMusicMPLibraryRequestFactory,  "songsLibraryRequestForPlaylist:",  a3));
  id v10 = objc_alloc(&OBJC_CLASS___MPPropertySet);
  uint64_t v19 = MPModelRelationshipPlaylistEntrySong;
  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[MPPropertySet emptyPropertySet](&OBJC_CLASS___MPPropertySet, "emptyPropertySet"));
  id v20 = v11;
  id v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v20,  &v19,  1LL));
  id v13 = [v10 initWithProperties:&__NSArray0__struct relationships:v12];
  [v9 setItemProperties:v13];

  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_1000446A0;
  v16[3] = &unk_100268C38;
  id v17 = v7;
  id v18 = v8;
  id v14 = v8;
  id v15 = v7;
  [v9 performWithResponseHandler:v16];
}

+ (id)_libraryAddRemoveQueue
{
  if (qword_1002BE888 != -1) {
    dispatch_once(&qword_1002BE888, &stru_10026AAB0);
  }
  return (id)qword_1002BE880;
}

+ (id)_modelSongForAdamID:(int64_t)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue( +[MPIdentifierSet tvm_identiferSetForSongWithStoreID:subscriptionID:]( &OBJC_CLASS___MPIdentifierSet,  "tvm_identiferSetForSongWithStoreID:subscriptionID:",  a3,  0LL));
  id v4 = -[MPModelObject initWithIdentifiers:block:]( objc_alloc(&OBJC_CLASS___MPModelObject),  "initWithIdentifiers:block:",  v3,  &stru_10026AAD0);

  return v4;
}

+ (id)_modelAlbumForAdamID:(int64_t)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue( +[MPIdentifierSet tvm_identiferSetForAlbumWithStoreID:subscriptionID:]( &OBJC_CLASS___MPIdentifierSet,  "tvm_identiferSetForAlbumWithStoreID:subscriptionID:",  a3,  0LL));
  id v4 = -[MPModelObject initWithIdentifiers:block:]( objc_alloc(&OBJC_CLASS___MPModelObject),  "initWithIdentifiers:block:",  v3,  &stru_10026AAF0);

  return v4;
}

+ (id)_modelPlaylistForGlobalID:(id)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue( +[MPIdentifierSet tvm_identifierSetForPlaylistWithGlobalID:]( &OBJC_CLASS___MPIdentifierSet,  "tvm_identifierSetForPlaylistWithGlobalID:",  a3));
  id v4 = -[MPModelPlaylist initWithIdentifiers:block:]( objc_alloc(&OBJC_CLASS___MPModelPlaylist),  "initWithIdentifiers:block:",  v3,  &stru_10026AB10);

  return v4;
}

+ (void)findSingleMusicVideoInAlbum:(id)a3 completionHandler:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = objc_opt_new(&OBJC_CLASS___MPModelLibraryRequest);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[MPModelSong kindWithVariants:](&OBJC_CLASS___MPModelSong, "kindWithVariants:", 3LL));
  -[MPModelLibraryRequest setItemKind:](v7, "setItemKind:", v8);

  id v16 = v6;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v16, 1LL));
  -[MPModelLibraryRequest setScopedContainers:](v7, "setScopedContainers:", v9);

  uint64_t v15 = MPModelPropertySongHasVideo;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v15, 1LL));
  id v11 = (void *)objc_claimAutoreleasedReturnValue( +[MPPropertySet propertySetWithProperties:]( &OBJC_CLASS___MPPropertySet,  "propertySetWithProperties:",  v10));
  -[MPModelLibraryRequest setItemProperties:](v7, "setItemProperties:", v11);

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_10004517C;
  v13[3] = &unk_10026A188;
  id v14 = v5;
  id v12 = v5;
  -[MPModelLibraryRequest performWithResponseHandler:](v7, "performWithResponseHandler:", v13);
}

+ (id)stringWithAppendedExplicitIndicator:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[ICAgeVerificationManager defaultManager](&OBJC_CLASS___ICAgeVerificationManager, "defaultManager"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 ageVerificationState]);
  id v6 = [v5 treatment];

  if (v6 == (id)1) {
    id v7 = @" ⓳";
  }
  else {
    id v7 = @" 🅴";
  }
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v3 stringByAppendingString:v7]);

  return v8;
}

+ (id)urlForDisplayingPlaylist:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](&OBJC_CLASS___NSMutableArray, "arrayWithCapacity:", 2LL));
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[TVMusicLibraryUITracker sharedTracker](&OBJC_CLASS___TVMusicLibraryUITracker, "sharedTracker"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 currentPAFFeatureName]);

  if ([v6 length])
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSURLQueryItem queryItemWithName:value:]( &OBJC_CLASS___NSURLQueryItem,  "queryItemWithName:value:",  @"featureName",  v6));
    objc_msgSend(v4, "tvs_addObjectIfNotNil:", v7);
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue([v3 identifiers]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 library]);
  id v10 = [v9 persistentID];

  if (v10)
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v3 identifiers]);
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 library]);
    id v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithLongLong:]( NSNumber,  "numberWithLongLong:",  [v12 persistentID]));
    id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 stringValue]);
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSURLQueryItem queryItemWithName:value:]( &OBJC_CLASS___NSURLQueryItem,  "queryItemWithName:value:",  @"libraryID",  v14));
    objc_msgSend(v4, "tvs_addObjectIfNotNil:", v15);
  }

  id v16 = (void *)objc_claimAutoreleasedReturnValue([v3 cloudVersionHash]);
  if ([v16 length])
  {
    id v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSURLQueryItem queryItemWithName:value:]( &OBJC_CLASS___NSURLQueryItem,  "queryItemWithName:value:",  @"playlistVersionHash",  v16));
    objc_msgSend(v4, "tvs_addObjectIfNotNil:", v17);
  }

  id v18 = (void *)objc_claimAutoreleasedReturnValue([v3 identifiers]);
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v18 universalStore]);
  id v20 = (void *)objc_claimAutoreleasedReturnValue([v19 globalPlaylistID]);
  id v21 = sub_100092F4C(v20, v4);
  id v22 = (void *)objc_claimAutoreleasedReturnValue(v21);

  return v22;
}

+ (BOOL)playlistExistsWithPersistentID:(int64_t)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[MPMediaLibrary defaultMediaLibrary](&OBJC_CLASS___MPMediaLibrary, "defaultMediaLibrary"));
  LOBYTE(a3) = [v4 playlistExistsWithPersistentID:a3];

  return a3;
}

+ (BOOL)playlistFolderExistsWithPersistentID:(int64_t)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[MPMediaLibrary defaultMediaLibrary](&OBJC_CLASS___MPMediaLibrary, "defaultMediaLibrary"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 playlistWithPersistentID:a3]);

  if (v5)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:MPMediaPlaylistPropertyIsFolder]);
    unsigned __int8 v7 = [v6 BOOLValue];
  }

  else
  {
    unsigned __int8 v7 = 0;
  }

  return v7;
}

+ (id)playlistWithPersistentID:(int64_t)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[MPMediaLibrary defaultMediaLibrary](&OBJC_CLASS___MPMediaLibrary, "defaultMediaLibrary"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 playlistWithPersistentID:a3]);

  if (v5)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue( +[MPIdentifierSet tvm_identifierSetForPlaylistWithPersistentID:]( &OBJC_CLASS___MPIdentifierSet,  "tvm_identifierSetForPlaylistWithPersistentID:",  a3));
    unsigned __int8 v7 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:MPMediaPlaylistPropertyIsFolder]);
    unsigned __int8 v8 = [v7 BOOLValue];

    id v9 = objc_alloc(&OBJC_CLASS___MPModelPlaylist);
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_1000456E0;
    v12[3] = &unk_10026AB38;
    unsigned __int8 v14 = v8;
    id v13 = v5;
    id v10 = -[MPModelPlaylist initWithIdentifiers:block:](v9, "initWithIdentifiers:block:", v6, v12);
  }

  else
  {
    id v10 = 0LL;
  }

  return v10;
}

+ (id)descriptionForUpdatedDate:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](&OBJC_CLASS___NSCalendar, "currentCalendar"));
  if (![v4 isDateInToday:v3])
  {
    if ([v4 isDateInYesterday:v3])
    {
      id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
      id v6 = v5;
      unsigned __int8 v7 = @"MusicLibraryUpdatedYesterday";
      goto LABEL_5;
    }

    id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 components:16 fromDate:v10 toDate:v3 options:0]);

    id v11 = [v6 day];
    if ((unint64_t)v11 < 0xFFFFFFFFFFFFFFFALL)
    {
      if ((unint64_t)v11 >= 0xFFFFFFFFFFFFFFF3LL)
      {
        id v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
        unsigned __int8 v8 = (void *)objc_claimAutoreleasedReturnValue( [v17 localizedStringForKey:@"MusicLibraryPlaylistUpdatedLastWeek" value:&stru_100279068 table:0]);
        goto LABEL_13;
      }
    }

    else
    {
      uint64_t v12 = (uint64_t)[v4 component:512 fromDate:v3];
      unint64_t v13 = v12 - 1;
      if (v12 >= 1)
      {
        unsigned __int8 v14 = (void *)objc_claimAutoreleasedReturnValue([v4 weekdaySymbols]);
        id v15 = [v14 count];

        if (v13 < (unint64_t)v15)
        {
          id v16 = (void *)objc_claimAutoreleasedReturnValue([v4 weekdaySymbols]);
          id v17 = (void *)objc_claimAutoreleasedReturnValue([v16 objectAtIndexedSubscript:v13]);

          id v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
          uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue( [v18 localizedStringForKey:@"MusicLibraryPlaylistUpdatedDescriptiveFormat" value:&stru_100279068 table:0]);
          unsigned __int8 v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v19, v17));

LABEL_13:
          goto LABEL_6;
        }
      }
    }

    unsigned __int8 v8 = 0LL;
    goto LABEL_6;
  }

  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  id v6 = v5;
  unsigned __int8 v7 = @"MusicLibraryUpdatedToday";
LABEL_5:
  unsigned __int8 v8 = (void *)objc_claimAutoreleasedReturnValue([v5 localizedStringForKey:v7 value:&stru_100279068 table:0]);
LABEL_6:

  return v8;
}

+ (void)renamePlaylist:(id)a3 newName:(id)a4 completion:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = objc_alloc_init(&OBJC_CLASS___MPModelLibraryPlaylistEditChangeRequest);
  [v10 setPlaylist:v9];

  [v10 setPlaylistName:v8];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_100045A7C;
  v14[3] = &unk_10026A788;
  id v15 = v7;
  id v11 = v7;
  id v12 = [v10 newOperationWithLocalPersistenceResponseHandler:&stru_10026AB78 completeResponseHandler:v14];
  unint64_t v13 = objc_alloc_init(&OBJC_CLASS___NSOperationQueue);
  -[NSOperationQueue addOperation:](v13, "addOperation:", v12);
}

+ (void)recentlyEditedPlaylistsWithMaxCount:(int64_t)a3 completion:(id)a4
{
  id v5 = a4;
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[TVMusicMPLibraryRequestFactory playlistsLibraryRequestWithParentPlaylistFolder:userEditableOnly:allowEmptyPlaylists:]( &OBJC_CLASS___TVMusicMPLibraryRequestFactory,  "playlistsLibraryRequestWithParentPlaylistFolder:userEditableOnly:allowEmptyPlaylists:",  0LL,  1LL,  1LL));
  objc_msgSend(v6, "setContentRange:", 0, a3);
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSSortDescriptor sortDescriptorWithKey:ascending:]( &OBJC_CLASS___NSSortDescriptor,  "sortDescriptorWithKey:ascending:",  MPModelPropertyPlaylistLastModifiedDateComponents,  0LL));
  id v12 = v7;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v12, 1LL));
  [v6 setItemSortDescriptors:v8];

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  void v10[2] = sub_100045BC0;
  v10[3] = &unk_10026A188;
  id v11 = v5;
  id v9 = v5;
  [v6 performWithResponseHandler:v10];
}

+ (void)allPlaylistsInFolder:(id)a3 completion:(id)a4
{
  id v5 = a4;
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[TVMusicMPLibraryRequestFactory playlistsLibraryRequestWithParentPlaylistFolder:userEditableOnly:allowEmptyPlaylists:]( &OBJC_CLASS___TVMusicMPLibraryRequestFactory,  "playlistsLibraryRequestWithParentPlaylistFolder:userEditableOnly:allowEmptyPlaylists:",  a3,  1LL,  1LL));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_100045CE8;
  v8[3] = &unk_10026A188;
  id v9 = v5;
  id v7 = v5;
  [v6 performWithResponseHandler:v8];
}

+ (void)createPlaylistWithName:(id)a3 parentPlaylist:(id)a4 completion:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  id v9 = a4;
  id v10 = (void *)objc_opt_new(&OBJC_CLASS___MPModelLibraryPlaylistEditChangeRequest);
  [v10 setPlaylistName:v7];
  [v10 setParentPlaylist:v9];

  [v10 setShouldCreatePlaylist:1];
  id v11 = objc_alloc_init(&OBJC_CLASS___NSOperationQueue);
  -[NSOperationQueue setQualityOfService:](v11, "setQualityOfService:", 25LL);
  -[NSOperationQueue setName:](v11, "setName:", @"com.apple.TVMusic.TVMusicLibraryUtilities.CreatePlaylist");
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_100045ED8;
  v17[3] = &unk_10026ABC8;
  id v18 = v7;
  id v19 = v8;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_100046004;
  v15[3] = &unk_10026ABF0;
  id v16 = v18;
  id v12 = v18;
  id v13 = v8;
  id v14 = [v10 newOperationWithLocalPersistenceResponseHandler:v17 completeResponseHandler:v15];
  -[NSOperationQueue addOperation:](v11, "addOperation:", v14);
}

+ (void)showPageForAlbum:(id)a3
{
  id v4 = a3;
  if (+[TVMusicApplication usingMusicUI](&OBJC_CLASS___TVMusicApplication, "usingMusicUI"))
  {
    id v3 = (void *)objc_claimAutoreleasedReturnValue( +[TVMusicUIMainViewController shared]( &OBJC_CLASS____TtC7TVMusic27TVMusicUIMainViewController,  "shared"));
    [v3 showLibraryPageForAlbum:v4];
  }

  else
  {
    +[TVMusicLibraryViewController albumDetailsViewController:completion:]( &OBJC_CLASS___TVMusicLibraryViewController,  "albumDetailsViewController:completion:",  v4,  &stru_10026AC30);
  }
}

+ (void)showPageForPlaylist:(id)a3
{
  id v4 = a3;
  if (+[TVMusicApplication usingMusicUI](&OBJC_CLASS___TVMusicApplication, "usingMusicUI"))
  {
    id v3 = (void *)objc_claimAutoreleasedReturnValue( +[TVMusicUIMainViewController shared]( &OBJC_CLASS____TtC7TVMusic27TVMusicUIMainViewController,  "shared"));
    [v3 showLibraryPageForPlaylist:v4];
  }

  else
  {
    +[TVMusicLibraryViewController playlistDetailsViewController:completion:]( &OBJC_CLASS___TVMusicLibraryViewController,  "playlistDetailsViewController:completion:",  v4,  &stru_10026AC50);
  }
}

+ (void)showPageForArtist:(id)a3
{
  id v6 = a3;
  if (+[TVMusicApplication usingMusicUI](&OBJC_CLASS___TVMusicApplication, "usingMusicUI"))
  {
    id v3 = (void *)objc_claimAutoreleasedReturnValue( +[TVMusicUIMainViewController shared]( &OBJC_CLASS____TtC7TVMusic27TVMusicUIMainViewController,  "shared"));
    [v3 showLibraryAlbumsPageForArtist:v6];
  }

  else
  {
    id v3 = (void *)objc_claimAutoreleasedReturnValue( +[TVMusicLibraryViewController albumsViewControllerForArtist:]( &OBJC_CLASS___TVMusicLibraryViewController,  "albumsViewControllerForArtist:",  v6));
    id v4 = (void *)objc_claimAutoreleasedReturnValue(+[TVMusicAppDelegate theApp](&OBJC_CLASS___TVMusicAppDelegate, "theApp"));
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 navigationController]);
    [v5 pushViewController:v3 animated:1];
  }
}

+ (void)showPageForComposer:(id)a3
{
  id v6 = a3;
  if (+[TVMusicApplication usingMusicUI](&OBJC_CLASS___TVMusicApplication, "usingMusicUI"))
  {
    id v3 = (void *)objc_claimAutoreleasedReturnValue( +[TVMusicUIMainViewController shared]( &OBJC_CLASS____TtC7TVMusic27TVMusicUIMainViewController,  "shared"));
    [v3 showLibraryAlbumsPageForComposer:v6];
  }

  else
  {
    id v3 = (void *)objc_claimAutoreleasedReturnValue( +[TVMusicLibraryViewController albumsViewControllerForComposer:]( &OBJC_CLASS___TVMusicLibraryViewController,  "albumsViewControllerForComposer:",  v6));
    id v4 = (void *)objc_claimAutoreleasedReturnValue(+[TVMusicAppDelegate theApp](&OBJC_CLASS___TVMusicAppDelegate, "theApp"));
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 navigationController]);
    [v5 pushViewController:v3 animated:1];
  }
}

+ (void)updateArtist:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  v17[0] = MPModelPropertyArtistIsFavorite;
  v17[1] = MPModelPropertyArtistName;
  id v7 = a3;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v17, 2LL));
  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[MPPropertySet propertySetWithProperties:]( &OBJC_CLASS___MPPropertySet,  "propertySetWithProperties:",  v8));

  id v10 = (void *)objc_claimAutoreleasedReturnValue([v7 identifiers]);
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 library]);
  id v12 = [v11 persistentID];
  id v13 = (void *)objc_claimAutoreleasedReturnValue(+[MPModelArtistKind identityKind](&OBJC_CLASS___MPModelArtistKind, "identityKind"));
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_100046520;
  v15[3] = &unk_10026A6E8;
  id v16 = v6;
  id v14 = v6;
  [a1 findItemInLibraryWithPersistentID:v12 itemKind:v13 itemProperties:v9 completionHandler:v15];
}

+ (void)setFavoriteFlag:(BOOL)a3 forItem:(id)a4 completion:(id)a5
{
  if (a3) {
    _[a1 _setFavoriteAction:2 forItem:a4 completion:a5];
  }
  else {
    _[a1 _setFavoriteAction:3 forItem:a4 completion:a5];
  }
}

+ (void)setSuggestLessFlag:(BOOL)a3 forItem:(id)a4 completion:(id)a5
{
}

+ (void)_setFavoriteAction:(int64_t)a3 forItem:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = [[MPModelLibraryFavoriteEntityRequestAction alloc] initWithChangeAction:a3];
  id v11 = (void *)objc_opt_new(&OBJC_CLASS___MPModelLibraryFavoriteEntityChangeRequest);
  [v11 setRequestAction:v10];
  [v11 setModelObject:v8];
  id v12 = (void *)objc_claimAutoreleasedReturnValue( +[MPModelLibraryTransientStateController sharedDeviceLibraryController]( &OBJC_CLASS___MPModelLibraryTransientStateController,  "sharedDeviceLibraryController"));
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_1000466BC;
  v15[3] = &unk_10026AC78;
  id v18 = a1;
  int64_t v19 = a3;
  id v16 = v8;
  id v17 = v9;
  id v13 = v9;
  id v14 = v8;
  [v12 performFavoriteStateChangeRequest:v11 withRelatedModelObjects:0 completion:v15];
}

+ (void)_showToastForFavoriteAction:(int64_t)a3 isArtist:(BOOL)a4 isVideo:(BOOL)a5
{
  if (a3 != 1)
  {
    uint64_t v5 = 6LL;
    uint64_t v6 = 10LL;
    if (a5) {
      uint64_t v6 = 12LL;
    }
    uint64_t v7 = 9LL;
    if (a5) {
      uint64_t v7 = 11LL;
    }
    if (a4) {
      uint64_t v7 = 7LL;
    }
    if (a3 == 2) {
      uint64_t v5 = v7;
    }
    if (a3 == 3) {
      uint64_t v8 = v6;
    }
    else {
      uint64_t v8 = v5;
    }
    id v9 = (id)objc_claimAutoreleasedReturnValue(+[TVMusicHUDController sharedInstance](&OBJC_CLASS___TVMusicHUDController, "sharedInstance"));
    [v9 showWithType:v8];
  }

+ (BOOL)isItemFavorited:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[MPModelLibraryTransientStateController sharedDeviceLibraryController]( &OBJC_CLASS___MPModelLibraryTransientStateController,  "sharedDeviceLibraryController"));
  id v5 = [v4 transientFavoriteStateForModelObject:v3];

  if (v5 == (id)2)
  {
    unsigned __int8 v6 = 1;
    goto LABEL_7;
  }

  if (!v5 && (objc_opt_respondsToSelector(v3, "isFavorite") & 1) != 0) {
    unsigned __int8 v6 = [v3 isFavorite];
  }
  else {
LABEL_6:
  }
    unsigned __int8 v6 = 0;
LABEL_7:

  return v6;
}

+ (BOOL)isItemDisliked:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[MPModelLibraryTransientStateController sharedDeviceLibraryController]( &OBJC_CLASS___MPModelLibraryTransientStateController,  "sharedDeviceLibraryController"));
  id v5 = [v4 transientFavoriteStateForModelObject:v3];

  if (v5 != (id)3)
  {
    if (!v5 && (objc_opt_respondsToSelector(v3, "isDisliked") & 1) != 0)
    {
      uint64_t v8 = objc_opt_class(&OBJC_CLASS___MPModelAlbum, v6);
      if ((objc_opt_isKindOfClass(v3, v8) & 1) != 0)
      {
        id v9 = (void *)objc_claimAutoreleasedReturnValue( +[MPContentTasteController sharedController]( &OBJC_CLASS___MPContentTasteController,  "sharedController"));
        BOOL v7 = [v9 tasteTypeForModel:v3] == (id)2;

        goto LABEL_10;
      }
    }

+ (int64_t)transientFavoriteStateForItem:(id)a3
{
  id v3 = a3;
  if (_os_feature_enabled_impl("MediaPlayer", "Favoriting"))
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue( +[MPModelLibraryTransientStateController sharedDeviceLibraryController]( &OBJC_CLASS___MPModelLibraryTransientStateController,  "sharedDeviceLibraryController"));
    id v5 = [v4 transientFavoriteStateForModelObject:v3];
  }

  else
  {
    id v5 = 0LL;
  }

  return (int64_t)v5;
}

@end
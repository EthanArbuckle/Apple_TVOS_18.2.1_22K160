@interface TVMusicJSObject
+ (BOOL)_needsSubscriptionForPlayItem:(id)a3;
+ (id)_dictionaryForPlaylistEntry:(id)a3 playlistPID:(id)a4 index:(int64_t)a5;
+ (id)_dictionaryForSong:(id)a3 inAlbum:(id)a4 index:(int64_t)a5;
+ (id)_getRecommendationDataFromOptions:(id)a3;
+ (id)_propertyGenericRelationships;
+ (id)_requestForSongWithIdentifiers:(id)a3;
+ (id)_resultForLibraryObject:(id)a3 itemType:(id)a4 requestedID:(id)a5 error:(id)a6;
+ (id)clientDataForItemType:(id)a3 persistentID:(id)a4;
+ (id)clientDataForSongPID:(id)a3 containerPID:(id)a4 songIndex:(int64_t)a5;
+ (id)dictionaryFromNSError:(id)a3;
+ (id)featureNameForPageIdentifier:(id)a3;
+ (id)imageProxyForClientDataString:(id)a3;
+ (id)propertySetForAlbum;
+ (id)songDictionariesForMPCollection:(id)a3 containerPID:(id)a4 album:(id)a5 inRange:(_NSRange)a6;
+ (void)_addClassicalSongData:(id)a3 toDictionary:(id)a4;
+ (void)_addPlaylistEntryData:(id)a3 toDictionary:(id)a4 index:(int64_t)a5;
+ (void)_addSongData:(id)a3 toDictionary:(id)a4 index:(int64_t)a5;
+ (void)_getURLForArtworkCatalog:(id)a3 completionHandler:(id)a4;
+ (void)checkAlbumInLibrary:(id)a3 songs:(id)a4 completionHandler:(id)a5;
+ (void)findItemInLibraryWithType:(id)a3 cloudID:(id)a4 options:(id)a5 completionHandler:(id)a6;
+ (void)getURLForArtworkCatalog:(id)a3 mpObject:(id)a4 completionHandler:(id)a5;
+ (void)initialize;
+ (void)personalizeSong:(id)a3 withProperties:(id)a4 completionHandler:(id)a5;
+ (void)playItems:(id)a3 options:(id)a4 completion:(id)a5;
+ (void)playRadioStation:(id)a3 options:(id)a4 completion:(id)a5;
+ (void)queryMediaLibrary:(id)a3 maxItems:(int64_t)a4 searchTerm:(id)a5 options:(id)a6 completionHandler:(id)a7;
+ (void)queryMusicLibraryForPlaylistWithCloudGlobalID:(id)a3 completionHandler:(id)a4;
+ (void)querySongsForAlbumWithPersistentID:(id)a3 range:(_NSRange)a4 completionHandler:(id)a5;
+ (void)querySongsForPlaylistWithPersistentID:(id)a3 range:(_NSRange)a4 completionHandler:(id)a5;
+ (void)removePlaylistFromMusicLibraryWithGlobalID:(id)a3 completionHandler:(id)a4;
- (BOOL)_isAlbumInLibrary:(id)a3 storeSongArray:(id)a4;
- (BOOL)_isItemInLibraryWithIdentifiers:(id)a3 itemKind:(id)a4;
- (BOOL)_isItemInLibraryWithStoreDictionary:(id)a3;
- (BOOL)allowMotion;
- (BOOL)allowVideo;
- (BOOL)artistMotionEnabled;
- (BOOL)favoritingEnabled;
- (BOOL)isMusicLibraryInitialized;
- (BOOL)isMusicLibrarySynced;
- (BOOL)isStoreItemInLibrary:(id)a3;
- (BOOL)marketingOffersEnabled;
- (BOOL)oasisEnabled;
- (BOOL)supportsPlaybackRestrictions;
- (TVMusicJSBag)bag;
- (TVMusicJSObject)initWithAppContext:(id)a3;
- (TVMusicLibraryManager)libraryManager;
- (id)_artistFromAlbumMediaData:(id)a3;
- (id)_favoritingPropertiesForMPModelKind:(id)a3;
- (id)_genericObjectFromPlatformDictionary:(id)a3;
- (id)_getPlaybackContainerFromOptions:(id)a3;
- (id)_identifierSetForMusicKitType:(id)a3 identifier:(id)a4;
- (id)_modelKindForGenericObjectType:(int64_t)a3;
- (id)_modelKindForItemTypeString:(id)a3;
- (id)_prepareCallback:(id)a3;
- (id)_storeObjectFromPlatformDictionary:(id)a3 getProperties:(BOOL)a4;
- (id)_urlWithAlbumTrackLimitRemovedFromURL:(id)a3;
- (unint64_t)musicAppAPIVersion;
- (void)_callCallbackWithCallbackIdentifier:(id)a3 command:(id)a4 success:(BOOL)a5;
- (void)_callJSMethodNamed:(id)a3 withArgs:(id)a4;
- (void)_callJSMusicInitializedNotification;
- (void)_callJSMusicUpdatedNotification;
- (void)_callJSPlaybackErrorNotification:(id)a3 error:(id)a4 methodName:(id)a5;
- (void)_didAttemptAddToLibrary:(id)a3;
- (void)_getDictionaryForGenericObject:(id)a3 completionHandler:(id)a4;
- (void)_getLibraryInfoForGenericObject:(id)a3 completionHandler:(id)a4;
- (void)_getLibraryInfoForStoreDictionary:(id)a3 genericObject:(id)a4 completionHandler:(id)a5;
- (void)_handleMenuResponseWithItem:(id)a3 options:(id)a4 menuData:(id)a5 jsCallbackIdentifier:(id)a6;
- (void)_jsCallbackWithIdentifier:(id)a3 args:(id)a4;
- (void)_libraryManagerStateChanged:(id)a3;
- (void)_libraryWasUpdated:(id)a3;
- (void)_playbackContainerDidChange:(id)a3;
- (void)_playbackErrorDidOccur:(id)a3;
- (void)_setupMusicLibraryNotifications;
- (void)_subscriptionRequired:(id)a3;
- (void)_subscriptionStatusDidChange:(id)a3;
- (void)_transientStateChanged:(id)a3;
- (void)addPlaylistToMusicLibraryWithGlobalID:(id)a3 :(id)a4;
- (void)addToMusicLibraryWithAdamID:(id)a3 :(id)a4;
- (void)dealloc;
- (void)findItemInLibraryByCloudID:(id)a3 :(id)a4 :(id)a5 :(id)a6;
- (void)getBookmarkDataForItems:(id)a3 :(id)a4;
- (void)getDurationForPlaylistWithPersistentID:(id)a3 :(id)a4;
- (void)getFavoriteStateWithStoreID:(id)a3 :(id)a4 :(id)a5 :(id)a6;
- (void)getNowPlayingInfo:(id)a3;
- (void)getSubscriptionStatus:(id)a3 :(id)a4;
- (void)musicLog:(id)a3 :(id)a4;
- (void)pageDidAppear:(id)a3;
- (void)performMediaRequestWithPath:(id)a3 :(id)a4 :(id)a5;
- (void)performMediaRequestWithURL:(id)a3 :(id)a4 :(id)a5;
- (void)playItems:(id)a3 :(id)a4 :(id)a5;
- (void)playRadioStation:(id)a3 :(id)a4 :(id)a5;
- (void)presentContextMenuForItemWithOptions:(id)a3 :(id)a4 :(id)a5;
- (void)presentDetailView:(id)a3 :(id)a4 :(id)a5;
- (void)presentDetailViewWithOptions:(id)a3 :(id)a4 :(id)a5 :(id)a6;
- (void)presentExplicitRestrictionAlertIfNeededOfType:(id)a3 :(id)a4;
- (void)queryMediaLibrary:(id)a3 :(int64_t)a4 :(id)a5 :(id)a6 :(id)a7;
- (void)queryMediaLibraryWithStoreID:(id)a3 :(id)a4 :(id)a5 :(id)a6;
- (void)queryMusicLibraryForPlaylistWithCloudGlobalID:(id)a3 :(id)a4;
- (void)queryMusicLibraryForSongsWithAdamIDs:(id)a3 :(id)a4;
- (void)querySongsForAlbumWithPersistentID:(id)a3 :(id)a4 :(_NSRange)a5 :(id)a6;
- (void)querySongsForPlaylistWithPersistentID:(id)a3 :(id)a4 :(_NSRange)a5 :(id)a6;
- (void)removeItemFromMediaLibraryWithPersistentID:(id)a3 :(id)a4 :(id)a5;
- (void)removePlaylistFromMusicLibraryWithGlobalID:(id)a3 :(id)a4;
- (void)setArtistFavoriteStateWithStoreID:(id)a3 :(id)a4 :(BOOL)a5 :(id)a6 :(id)a7;
- (void)setBag:(id)a3;
- (void)setIsMusicLibrarySynced:(BOOL)a3;
- (void)setLibraryManager:(id)a3;
- (void)showPrivacyNotice;
- (void)showToast:(id)a3 :(id)a4;
@end

@implementation TVMusicJSObject

- (TVMusicJSObject)initWithAppContext:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[TVCKCloudDataClient cloudDataClient](&OBJC_CLASS___TVCKCloudDataClient, "cloudDataClient"));
  [v5 setClientStatus:2];
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v6 removeObserver:v5];

  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___TVMusicJSObject;
  v7 = -[TVMusicJSObject initWithAppContext:](&v19, "initWithAppContext:", v4);

  if (v7)
  {
    if (qword_1002BE9B8 != -1) {
      dispatch_once(&qword_1002BE9B8, &stru_10026BF40);
    }
    v8 = (os_log_s *)off_1002B6938;
    if (os_log_type_enabled((os_log_t)off_1002B6938, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v21 = v7;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "TVMusicJSObject init: %@", buf, 0xCu);
    }

    uint64_t v9 = objc_claimAutoreleasedReturnValue(+[TVMusicLibraryManager sharedInstance](&OBJC_CLASS___TVMusicLibraryManager, "sharedInstance"));
    libraryManager = v7->_libraryManager;
    v7->_libraryManager = (TVMusicLibraryManager *)v9;

    v11 = objc_alloc_init(&OBJC_CLASS___TVMusicJSBag);
    bag = v7->_bag;
    v7->_bag = v11;

    v13 = (void *)objc_claimAutoreleasedReturnValue(+[TVMusicPlayerManager defaultPlayer](&OBJC_CLASS___TVMusicPlayerManager, "defaultPlayer"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    uint64_t v15 = TVMusicSubscriptionStatusChangedNotification;
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[TVMSubscriptionManager sharedInstance](&OBJC_CLASS___TVMSubscriptionManager, "sharedInstance"));
    [v14 addObserver:v7 selector:"_subscriptionStatusDidChange:" name:v15 object:v16];

    [v14 addObserver:v7 selector:"_playbackContainerDidChange:" name:@"TVMusicPlaybackContainerChangedNotification" object:v13];
    [v14 addObserver:v7 selector:"_playbackErrorDidOccur:" name:TVPPlaybackErrorNotification object:v13];
    [v14 addObserver:v7 selector:"_didAttemptAddToLibrary:" name:@"TVMusicNowPlayingContextMenuAddToLibraryNotification" object:0];
    [v14 addObserver:v7 selector:"_subscriptionRequired:" name:@"_TVMusicSubscriptionRequiredNotification" object:0];
    [v14 addObserver:v7 selector:"_transientStateChanged:" name:MPModelLibraryTransientStateControllerDidChangeNotification object:0];
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver( DarwinNotifyCenter,  v7,  (CFNotificationCallback)sub_100086B74,  ICRecentlyPlayedDidChangeNotification,  0LL,  CFNotificationSuspensionBehaviorDrop);
    -[TVMusicJSObject _setupMusicLibraryNotifications](v7, "_setupMusicLibraryNotifications");
  }

  return v7;
}

- (void)dealloc
{
  v3 = (os_log_s *)off_1002B6938;
  if (os_log_type_enabled((os_log_t)off_1002B6938, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v8 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "TVMusicJSObject dealloc: %@", buf, 0xCu);
  }

  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v4 removeObserver:self];

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, ICRecentlyPlayedDidChangeNotification, 0LL);
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___TVMusicJSObject;
  -[TVMusicJSObject dealloc](&v6, "dealloc");
}

- (unint64_t)musicAppAPIVersion
{
  return 28LL;
}

- (void)playItems:(id)a3 :(id)a4 :(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicJSObject _prepareCallback:](self, "_prepareCallback:", v10));
  objc_initWeak(&location, self);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_100086E2C;
  v13[3] = &unk_10026BF68;
  objc_copyWeak(&v15, &location);
  id v12 = v11;
  id v14 = v12;
  +[TVMusicJSObject playItems:options:completion:]( &OBJC_CLASS___TVMusicJSObject,  "playItems:options:completion:",  v8,  v9,  v13);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

+ (void)playItems:(id)a3 options:(id)a4 completion:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  id v9 = a4;
  id v10 = -[TVMusicPlayItemsParser initWithItems:options:]( objc_alloc(&OBJC_CLASS___TVMusicPlayItemsParser),  "initWithItems:options:",  v7,  v9);

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_100086FB0;
  v13[3] = &unk_10026BF90;
  id v14 = v7;
  id v15 = v8;
  id v11 = v8;
  id v12 = v7;
  -[TVMusicPlayItemsParser getPlaybackIntent:](v10, "getPlaybackIntent:", v13);
}

- (void)playRadioStation:(id)a3 :(id)a4 :(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicJSObject _prepareCallback:](self, "_prepareCallback:", v10));
  objc_initWeak(&location, self);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_100087358;
  v13[3] = &unk_10026BFB8;
  objc_copyWeak(&v15, &location);
  id v12 = v11;
  id v14 = v12;
  +[TVMusicJSObject playRadioStation:options:completion:]( &OBJC_CLASS___TVMusicJSObject,  "playRadioStation:options:completion:",  v8,  v9,  v13);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

+ (void)playRadioStation:(id)a3 options:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:@"radio-station-id"]);
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:@"seed-store-id"]);
  uint64_t v14 = objc_opt_class(&OBJC_CLASS___NSString, v13);
  if ((objc_opt_isKindOfClass(v12, v14) & 1) != 0)
  {
    id v15 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:@"seed-store-id"]);

    if (v15) {
      v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithLongLong:]( NSNumber,  "numberWithLongLong:",  [v15 longLongValue]));
    }
    else {
      v16 = 0LL;
    }
  }

  else
  {

    v16 = 0LL;
    id v15 = 0LL;
  }

  v17 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:@"isFreeRadioStation"]);
  unsigned __int8 v18 = [v17 BOOLValue];

  objc_super v19 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:@"action"]);
  +[TVMusicPlaybackIntent playbackActionTypeFromString:]( &OBJC_CLASS___TVMusicPlaybackIntent,  "playbackActionTypeFromString:",  v19);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100087628;
  block[3] = &unk_10026BFE8;
  id v26 = v9;
  id v27 = v11;
  unsigned __int8 v32 = v18;
  id v28 = v16;
  id v29 = v8;
  id v30 = v10;
  id v31 = a1;
  id v20 = v10;
  id v21 = v8;
  id v22 = v16;
  id v23 = v11;
  id v24 = v9;
  dispatch_async(&_dispatch_main_q, block);
}

- (void)queryMusicLibraryForPlaylistWithCloudGlobalID:(id)a3 :(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicJSObject _prepareCallback:](self, "_prepareCallback:", v7));
  objc_initWeak(&location, self);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_100087908;
  v10[3] = &unk_10026BF68;
  objc_copyWeak(&v12, &location);
  id v9 = v8;
  id v11 = v9;
  +[TVMusicJSObject queryMusicLibraryForPlaylistWithCloudGlobalID:completionHandler:]( &OBJC_CLASS___TVMusicJSObject,  "queryMusicLibraryForPlaylistWithCloudGlobalID:completionHandler:",  v6,  v10);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

- (void)addToMusicLibraryWithAdamID:(id)a3 :(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicJSObject _prepareCallback:](self, "_prepareCallback:", v7));
  objc_initWeak(&location, self);
  id v9 = [v6 longLongValue];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_100087AD8;
  v11[3] = &unk_10026C010;
  objc_copyWeak(&v13, &location);
  id v10 = v8;
  id v12 = v10;
  +[TVMusicLibraryUtilities addItemToLibraryWithAdamID:completionHandler:]( &OBJC_CLASS___TVMusicLibraryUtilities,  "addItemToLibraryWithAdamID:completionHandler:",  v9,  v11);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

- (void)addPlaylistToMusicLibraryWithGlobalID:(id)a3 :(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicJSObject libraryManager](self, "libraryManager"));
  id v9 = [v8 cloudStatus];

  if (v9 == (id)1)
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicJSObject _prepareCallback:](self, "_prepareCallback:", v7));
    objc_initWeak(&location, self);
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_100087E0C;
    v14[3] = &unk_10026C038;
    id v15 = v6;
    objc_copyWeak(&v17, &location);
    id v11 = v10;
    id v16 = v11;
    +[TVMusicLibraryUtilities addGlobalPlaylistToLibraryWithID:completionHandler:]( &OBJC_CLASS___TVMusicLibraryUtilities,  "addGlobalPlaylistToLibraryWithID:completionHandler:",  v15,  v14);

    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }

  else
  {
    v20[0] = @"success";
    v20[1] = @"error";
    v21[0] = &__kCFBooleanFalse;
    v21[1] = @"No cloud library";
    id v11 = (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v21,  v20,  2LL));
    id v19 = v11;
    id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v19, 1LL));
    id v13 = [v7 callWithArguments:v12];
  }
}

- (void)removePlaylistFromMusicLibraryWithGlobalID:(id)a3 :(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicJSObject _prepareCallback:](self, "_prepareCallback:", v7));
  objc_initWeak(&location, self);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_100088080;
  v10[3] = &unk_10026BFB8;
  objc_copyWeak(&v12, &location);
  id v9 = v8;
  id v11 = v9;
  +[TVMusicJSObject removePlaylistFromMusicLibraryWithGlobalID:completionHandler:]( &OBJC_CLASS___TVMusicJSObject,  "removePlaylistFromMusicLibraryWithGlobalID:completionHandler:",  v6,  v10);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

- (void)queryMediaLibrary:(id)a3 :(int64_t)a4 :(id)a5 :(id)a6 :(id)a7
{
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  id v16 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicJSObject _prepareCallback:](self, "_prepareCallback:", v15));
  objc_initWeak(&location, self);
  id v17 = (void *)objc_claimAutoreleasedReturnValue([v13 toString]);
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_1000882E4;
  v19[3] = &unk_10026C060;
  objc_copyWeak(&v21, &location);
  id v18 = v16;
  id v20 = v18;
  +[TVMusicJSObject queryMediaLibrary:maxItems:searchTerm:options:completionHandler:]( &OBJC_CLASS___TVMusicJSObject,  "queryMediaLibrary:maxItems:searchTerm:options:completionHandler:",  v12,  a4,  v17,  v14,  v19);

  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);
}

- (void)queryMediaLibraryWithStoreID:(id)a3 :(id)a4 :(id)a5 :(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v24 = a5;
  id v12 = a6;
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicJSObject _prepareCallback:](self, "_prepareCallback:", v12));
  id v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  id v14 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicJSObject _modelKindForItemTypeString:](self, "_modelKindForItemTypeString:", v11));
  if ([v11 isEqualToString:@"playlist"]) {
    uint64_t v15 = objc_claimAutoreleasedReturnValue( +[MPIdentifierSet tvm_identifierSetForPlaylistWithGlobalID:]( &OBJC_CLASS___MPIdentifierSet,  "tvm_identifierSetForPlaylistWithGlobalID:",  v10));
  }
  else {
    uint64_t v15 = objc_claimAutoreleasedReturnValue( +[MPIdentifierSet tvm_identifierSetForModelKind:withStoreID:subscriptionID:]( MPIdentifierSet,  "tvm_identifierSetForModelKind:withStoreID:subscriptionID:",  v14,  [v10 longLongValue],  objc_msgSend(v10, "longLongValue")));
  }
  id v16 = (void *)v15;
  if ([v11 isEqualToString:@"album"])
  {
    id v17 = -[MPModelAlbum initWithIdentifiers:block:]( objc_alloc(&OBJC_CLASS___MPModelAlbum),  "initWithIdentifiers:block:",  v16,  &stru_10026C090);
    id v18 = (void *)objc_claimAutoreleasedReturnValue( +[TVMusicMPLibraryRequestFactory songsLibraryRequest]( &OBJC_CLASS___TVMusicMPLibraryRequestFactory,  "songsLibraryRequest"));
    id v19 = (void *)objc_claimAutoreleasedReturnValue(+[MPModelSong kindWithVariants:](&OBJC_CLASS___MPModelSong, "kindWithVariants:", 3LL));
    [v18 setItemKind:v19];

    v37 = v17;
    id v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v37, 1LL));
    [v18 setScopedContainers:v20];

    objc_initWeak(&location, self);
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472LL;
    v30[2] = sub_1000887AC;
    v30[3] = &unk_10026C0F0;
    id v31 = v10;
    id v32 = v13;
    objc_copyWeak(&v34, &location);
    id v33 = v25;
    [v18 performWithResponseHandler:v30];

    objc_destroyWeak(&v34);
    objc_destroyWeak(&location);
  }

  else if (v14)
  {
    objc_initWeak(&location, self);
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472LL;
    v26[2] = sub_100088BF8;
    v26[3] = &unk_10026C118;
    id v27 = v13;
    objc_copyWeak(&v29, &location);
    id v28 = v25;
    +[TVMusicLibraryUtilities findMPObjectWithIdentifiers:itemKind:itemProperties:completionHandler:]( &OBJC_CLASS___TVMusicLibraryUtilities,  "findMPObjectWithIdentifiers:itemKind:itemProperties:completionHandler:",  v16,  v14,  0LL,  v26);

    objc_destroyWeak(&v29);
    objc_destroyWeak(&location);
  }

  else
  {
    [v13 setObject:&__kCFBooleanFalse forKeyedSubscript:@"success"];
    id v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Unsupported kind \"%@\"",  v11));
    [v13 setObject:v21 forKeyedSubscript:@"error"];

    v36 = v13;
    id v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v36, 1LL));
    id v23 = [v12 callWithArguments:v22];
  }
}

- (BOOL)isStoreItemInLibrary:(id)a3
{
  return -[TVMusicJSObject _isItemInLibraryWithStoreDictionary:](self, "_isItemInLibraryWithStoreDictionary:", a3);
}

- (void)removeItemFromMediaLibraryWithPersistentID:(id)a3 :(id)a4 :(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicJSObject _prepareCallback:](self, "_prepareCallback:", v10));
  id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  id v13 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicJSObject _modelKindForItemTypeString:](self, "_modelKindForItemTypeString:", v9));
  uint64_t v15 = objc_opt_class(&OBJC_CLASS___NSString, v14);
  if ((objc_opt_isKindOfClass(v8, v15) & 1) != 0
    && (id v16 = [v8 longLongValue], v13)
    && (id v17 = v16) != 0LL)
  {
    objc_initWeak(&location, self);
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472LL;
    v22[2] = sub_10008901C;
    v22[3] = &unk_10026C118;
    id v23 = v12;
    objc_copyWeak(&v25, &location);
    id v24 = v11;
    +[TVMusicLibraryUtilities findItemInLibraryWithPersistentID:itemKind:itemProperties:completionHandler:]( &OBJC_CLASS___TVMusicLibraryUtilities,  "findItemInLibraryWithPersistentID:itemKind:itemProperties:completionHandler:",  v17,  v13,  0LL,  v22);

    objc_destroyWeak(&v25);
    objc_destroyWeak(&location);
  }

  else
  {
    [v12 setObject:&__kCFBooleanFalse forKeyedSubscript:@"success"];
    if (v13) {
      uint64_t v18 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid persistentID \"%@\"",  v8));
    }
    else {
      uint64_t v18 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Unsupported kind \"%@\"",  v9));
    }
    id v19 = (void *)v18;
    [v12 setObject:v18 forKeyedSubscript:@"error"];

    id v27 = v12;
    id v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v27, 1LL));
    id v21 = [v10 callWithArguments:v20];
  }
}

- (void)queryMusicLibraryForSongsWithAdamIDs:(id)a3 :(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicJSObject _prepareCallback:](self, "_prepareCallback:", v7));
  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[TVMusicMPLibraryRequestFactory songsLibraryRequest]( &OBJC_CLASS___TVMusicMPLibraryRequestFactory,  "songsLibraryRequest"));
  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[MPModelSong kindWithVariants:](&OBJC_CLASS___MPModelSong, "kindWithVariants:", 3LL));
  [v9 setItemKind:v10];

  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_100089308;
  v18[3] = &unk_10026C140;
  id v11 = v9;
  id v19 = v11;
  id v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "tvs_arrayByMappingObjectsUsingBlock:", v18));
  [v11 setAllowedItemIdentifiers:v12];

  objc_initWeak(&location, self);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_100089380;
  v14[3] = &unk_10026C168;
  objc_copyWeak(&v16, &location);
  id v13 = v8;
  id v15 = v13;
  [v11 performWithResponseHandler:v14];

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

- (void)querySongsForAlbumWithPersistentID:(id)a3 :(id)a4 :(_NSRange)a5 :(id)a6
{
  NSUInteger length = a5.length;
  NSUInteger v8 = a5.location;
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicJSObject _prepareCallback:](self, "_prepareCallback:", v13));
  objc_initWeak(&location, self);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_1000898F0;
  v16[3] = &unk_10026C060;
  objc_copyWeak(&v18, &location);
  id v15 = v14;
  id v17 = v15;
  +[TVMusicJSObject querySongsForAlbumWithPersistentID:range:completionHandler:]( &OBJC_CLASS___TVMusicJSObject,  "querySongsForAlbumWithPersistentID:range:completionHandler:",  v11,  v8,  length,  v16);

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);
}

- (void)querySongsForPlaylistWithPersistentID:(id)a3 :(id)a4 :(_NSRange)a5 :(id)a6
{
  NSUInteger length = a5.length;
  NSUInteger v8 = a5.location;
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicJSObject _prepareCallback:](self, "_prepareCallback:", v13));
  objc_initWeak(&location, self);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_100089AD4;
  v16[3] = &unk_10026C060;
  objc_copyWeak(&v18, &location);
  id v15 = v14;
  id v17 = v15;
  +[TVMusicJSObject querySongsForPlaylistWithPersistentID:range:completionHandler:]( &OBJC_CLASS___TVMusicJSObject,  "querySongsForPlaylistWithPersistentID:range:completionHandler:",  v11,  v8,  length,  v16);

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);
}

- (void)getDurationForPlaylistWithPersistentID:(id)a3 :(id)a4
{
  id v6 = a3;
  id v7 = a4;
  NSUInteger v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicJSObject _prepareCallback:](self, "_prepareCallback:", v7));
  id v9 = [v6 longLongValue];
  id v10 = (void *)objc_claimAutoreleasedReturnValue( +[TVMusicMPLibraryRequestFactory playlistsLibraryRequestWithParentPlaylistFolder:userEditableOnly:allowEmptyPlaylists:]( &OBJC_CLASS___TVMusicMPLibraryRequestFactory,  "playlistsLibraryRequestWithParentPlaylistFolder:userEditableOnly:allowEmptyPlaylists:",  0LL,  0LL,  1LL));
  objc_initWeak(&location, self);
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 itemKind]);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_100089CEC;
  v13[3] = &unk_10026C1B8;
  objc_copyWeak(&v15, &location);
  id v12 = v8;
  id v14 = v12;
  +[TVMusicLibraryUtilities findItemInLibraryWithPersistentID:itemKind:itemProperties:completionHandler:]( &OBJC_CLASS___TVMusicLibraryUtilities,  "findItemInLibraryWithPersistentID:itemKind:itemProperties:completionHandler:",  v9,  v11,  0LL,  v13);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

- (void)musicLog:(id)a3 :(id)a4
{
  id v5 = a3;
  id v6 = off_1002B6938;
  if (os_log_type_enabled((os_log_t)off_1002B6938, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = v6;
    NSUInteger v8 = (void *)objc_claimAutoreleasedReturnValue([a4 toObject]);
    int v9 = 138412546;
    id v10 = v5;
    __int16 v11 = 2112;
    id v12 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "JS LOG: %@ (%@)", (uint8_t *)&v9, 0x16u);
  }
}

- (void)pageDidAppear:(id)a3
{
  id v4 = a3;
  id v5 = (os_log_s *)off_1002B6938;
  if (os_log_type_enabled((os_log_t)off_1002B6938, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "pageDidAppear: %@", (uint8_t *)&buf, 0xCu);
  }

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_10008A0E4;
  v8[3] = &unk_100268B30;
  id v9 = v4;
  id v10 = self;
  id v6 = v8;
  *(void *)&__int128 buf = _NSConcreteStackBlock;
  *((void *)&buf + 1) = 3221225472LL;
  id v12 = sub_100093454;
  id v13 = &unk_100268D60;
  id v14 = v6;
  id v7 = v4;
  dispatch_async(&_dispatch_main_q, &buf);
}

- (void)findItemInLibraryByCloudID:(id)a3 :(id)a4 :(id)a5 :(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicJSObject _prepareCallback:](self, "_prepareCallback:", v13));
  objc_initWeak(&location, self);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_10008A3E4;
  v16[3] = &unk_10026BF68;
  objc_copyWeak(&v18, &location);
  id v15 = v14;
  id v17 = v15;
  +[TVMusicJSObject findItemInLibraryWithType:cloudID:options:completionHandler:]( &OBJC_CLASS___TVMusicJSObject,  "findItemInLibraryWithType:cloudID:options:completionHandler:",  v10,  v11,  v12,  v16);

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);
}

- (void)getNowPlayingInfo:(id)a3
{
  id v3 = a3;
  if ([v3 isObject])
  {
    NSUInteger v8 = @"error";
    id v9 = @"Not Implemented";
    id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v9,  &v8,  1LL));
    id v7 = v4;
    id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v7, 1LL));
    id v6 = [v3 callWithArguments:v5];
  }
}

- (BOOL)isMusicLibraryInitialized
{
  return -[TVMusicJSObject isMusicLibrarySynced](self, "isMusicLibrarySynced");
}

- (void)presentExplicitRestrictionAlertIfNeededOfType:(id)a3 :(id)a4
{
  id v6 = a3;
  id v7 = a4;
  NSUInteger v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicJSObject _prepareCallback:](self, "_prepareCallback:", v7));
  int64_t v9 = +[TVMusicRestrictionsUI explicitRestrictionAlertTypeForTypeString:]( &OBJC_CLASS___TVMusicRestrictionsUI,  "explicitRestrictionAlertTypeForTypeString:",  v6);
  objc_initWeak(&location, self);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_10008A68C;
  v11[3] = &unk_10026BFB8;
  objc_copyWeak(&v13, &location);
  id v10 = v8;
  id v12 = v10;
  +[TVMusicRestrictionsUI presentExplicitRestrictionAlertIfNeededOfType:completionBlock:]( &OBJC_CLASS___TVMusicRestrictionsUI,  "presentExplicitRestrictionAlertIfNeededOfType:completionBlock:",  v9,  v11);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

- (void)presentDetailView:(id)a3 :(id)a4 :(id)a5
{
}

- (void)presentDetailViewWithOptions:(id)a3 :(id)a4 :(id)a5 :(id)a6
{
  id v10 = a3;
  id v37 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicJSObject _prepareCallback:](self, "_prepareCallback:", v12));
  id v14 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:@"playbackReporting"]);
  uint64_t v16 = objc_opt_class(&OBJC_CLASS___NSDictionary, v15);
  id v34 = v12;
  v35 = v11;
  if ((objc_opt_isKindOfClass(v14, v16) & 1) != 0)
  {
    uint64_t v17 = objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:@"playbackReporting"]);

    if (v17)
    {
      id v33 = (void *)v17;
      v36 = (void *)objc_claimAutoreleasedReturnValue( +[TVMusicPlayItemsPAFData PAFDataFromDictionary:]( &OBJC_CLASS___TVMusicPlayItemsPAFData,  "PAFDataFromDictionary:",  v17));
      goto LABEL_6;
    }
  }

  else
  {
  }

  id v33 = 0LL;
  v36 = 0LL;
LABEL_6:
  objc_initWeak(&location, self);
  v47[0] = _NSConcreteStackBlock;
  v47[1] = 3221225472LL;
  v47[2] = sub_10008AD1C;
  v47[3] = &unk_10026C1E0;
  id v18 = v13;
  id v48 = v18;
  objc_copyWeak(&v49, &location);
  id v19 = objc_retainBlock(v47);
  if ([v10 isEqualToString:@"album"])
  {
    id v20 = (id)objc_claimAutoreleasedReturnValue( +[TVMusicMPLibraryRequestFactory albumsLibraryRequest]( &OBJC_CLASS___TVMusicMPLibraryRequestFactory,  "albumsLibraryRequest"));
    id v21 = [v37 longLongValue];
    id v22 = (void *)objc_claimAutoreleasedReturnValue([v20 itemKind]);
    id v23 = (void *)objc_claimAutoreleasedReturnValue([v20 itemProperties]);
    v46[0] = _NSConcreteStackBlock;
    v46[1] = 3221225472LL;
    v46[2] = sub_10008AF34;
    v46[3] = &unk_10026B4A8;
    id v24 = v46;
    v46[4] = v36;
    v46[5] = v19;
    +[TVMusicLibraryUtilities findItemInLibraryWithPersistentID:itemKind:itemProperties:completionHandler:]( &OBJC_CLASS___TVMusicLibraryUtilities,  "findItemInLibraryWithPersistentID:itemKind:itemProperties:completionHandler:",  v21,  v22,  v23,  v46);
LABEL_8:
    id v25 = (id *)(v24 + 4);
    id v26 = (id *)(v24 + 5);
LABEL_9:

    goto LABEL_10;
  }

  if (![v10 isEqualToString:@"playlist"])
  {
    if ([v10 isEqualToString:@"artist"])
    {
      id v20 = (id)objc_claimAutoreleasedReturnValue( +[TVMusicMPLibraryRequestFactory artistsLibraryRequest]( &OBJC_CLASS___TVMusicMPLibraryRequestFactory,  "artistsLibraryRequest"));
      id v30 = [v37 longLongValue];
      id v22 = (void *)objc_claimAutoreleasedReturnValue([v20 itemKind]);
      id v23 = (void *)objc_claimAutoreleasedReturnValue([v20 itemProperties]);
      v39[0] = _NSConcreteStackBlock;
      v39[1] = 3221225472LL;
      v39[2] = sub_10008B22C;
      v39[3] = &unk_10026C2C8;
      id v24 = v39;
      v39[4] = &stru_10026C220;
      v39[5] = v19;
      +[TVMusicLibraryUtilities findItemInLibraryWithPersistentID:itemKind:itemProperties:completionHandler:]( &OBJC_CLASS___TVMusicLibraryUtilities,  "findItemInLibraryWithPersistentID:itemKind:itemProperties:completionHandler:",  v30,  v22,  v23,  v39);
    }

    else
    {
      if (![v10 isEqualToString:@"tvShow"])
      {
        ((void (*)(void *, void))v19[2])(v19, 0LL);
        goto LABEL_12;
      }

      id v20 = (id)objc_claimAutoreleasedReturnValue( +[TVMusicMPLibraryRequestFactory TVShowsLibraryRequest]( &OBJC_CLASS___TVMusicMPLibraryRequestFactory,  "TVShowsLibraryRequest"));
      id v31 = [v37 longLongValue];
      id v22 = (void *)objc_claimAutoreleasedReturnValue([v20 itemKind]);
      id v23 = (void *)objc_claimAutoreleasedReturnValue([v20 itemProperties]);
      v38[0] = _NSConcreteStackBlock;
      v38[1] = 3221225472LL;
      v38[2] = sub_10008B30C;
      v38[3] = &unk_10026C2C8;
      id v24 = v38;
      v38[4] = &stru_10026C220;
      v38[5] = v19;
      +[TVMusicLibraryUtilities findItemInLibraryWithPersistentID:itemKind:itemProperties:completionHandler:]( &OBJC_CLASS___TVMusicLibraryUtilities,  "findItemInLibraryWithPersistentID:itemKind:itemProperties:completionHandler:",  v31,  v22,  v23,  v38);
    }

    goto LABEL_8;
  }

  id v27 = [v37 longLongValue];
  if (!+[TVMusicLibraryUtilities playlistFolderExistsWithPersistentID:]( &OBJC_CLASS___TVMusicLibraryUtilities,  "playlistFolderExistsWithPersistentID:",  v27))
  {
    id v20 = (id)objc_claimAutoreleasedReturnValue( +[TVMusicMPLibraryRequestFactory playlistsLibraryRequestWithParentPlaylistFolder:userEditableOnly:allowEmptyPlaylists:]( &OBJC_CLASS___TVMusicMPLibraryRequestFactory,  "playlistsLibraryRequestWithParentPlaylistFolder:userEditableOnly:allowEmptyPlaylists:",  0LL,  0LL,  1LL));
    id v22 = (void *)objc_claimAutoreleasedReturnValue([v20 itemKind]);
    id v23 = (void *)objc_claimAutoreleasedReturnValue([v20 itemProperties]);
    v40[0] = _NSConcreteStackBlock;
    v40[1] = 3221225472LL;
    v40[2] = sub_10008B0F8;
    v40[3] = &unk_10026B4A8;
    id v41 = v36;
    v42 = v19;
    +[TVMusicLibraryUtilities findItemInLibraryWithPersistentID:itemKind:itemProperties:completionHandler:]( &OBJC_CLASS___TVMusicLibraryUtilities,  "findItemInLibraryWithPersistentID:itemKind:itemProperties:completionHandler:",  v27,  v22,  v23,  v40);
    id v25 = &v41;
    id v26 = (id *)&v42;
    goto LABEL_9;
  }

  id v28 = (void *)objc_claimAutoreleasedReturnValue( +[TVMusicLibraryUtilities playlistWithPersistentID:]( &OBJC_CLASS___TVMusicLibraryUtilities,  "playlistWithPersistentID:",  v27));
  id v20 = v28;
  if (!v28)
  {
    id v32 = (os_log_s *)off_1002B6938;
    if (os_log_type_enabled((os_log_t)off_1002B6938, OS_LOG_TYPE_ERROR)) {
      sub_1001B9AA4((uint64_t)v37, v32);
    }
    ((void (*)(void *, void))v19[2])(v19, 0LL);
    goto LABEL_11;
  }

  v43[0] = _NSConcreteStackBlock;
  v43[1] = 3221225472LL;
  v43[2] = sub_10008B06C;
  v43[3] = &unk_100269CD8;
  id v25 = &v44;
  id v20 = v28;
  id v44 = v20;
  id v26 = (id *)&v45;
  v45 = v19;
  id v29 = v43;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100093454;
  block[3] = &unk_100268D60;
  id v52 = v29;
  dispatch_async(&_dispatch_main_q, block);

LABEL_10:
LABEL_11:

LABEL_12:
  objc_destroyWeak(&v49);

  objc_destroyWeak(&location);
}

- (void)_callCallbackWithCallbackIdentifier:(id)a3 command:(id)a4 success:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  id v10 = v9;
  if (v8)
  {
    if (v9)
    {
      v20[0] = @"success";
      id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v5));
      v20[1] = @"commandToHandle";
      v21[0] = v11;
      v21[1] = v10;
      id v12 = (void **)v21;
      id v13 = (const __CFString **)v20;
      uint64_t v14 = 2LL;
    }

    else
    {
      id v18 = @"success";
      id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v5));
      id v19 = v11;
      id v12 = &v19;
      id v13 = &v18;
      uint64_t v14 = 1LL;
    }

    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v12,  v13,  v14));

    uint64_t v17 = v15;
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v17, 1LL));
    -[TVMusicJSObject _jsCallbackWithIdentifier:args:](self, "_jsCallbackWithIdentifier:args:", v8, v16);
  }
}

- (void)presentContextMenuForItemWithOptions:(id)a3 :(id)a4 :(id)a5
{
  id v8 = a3;
  id v9 = a4;
  v111[0] = _NSConcreteStackBlock;
  v111[1] = 3221225472LL;
  v111[2] = sub_10008C1A4;
  v111[3] = &unk_10026C370;
  v111[4] = self;
  id v90 = (id)objc_claimAutoreleasedReturnValue(-[TVMusicJSObject _prepareCallback:](self, "_prepareCallback:", a5));
  id v112 = v90;
  id v10 = objc_retainBlock(v111);
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicJSObject _getPlaybackContainerFromOptions:](self, "_getPlaybackContainerFromOptions:", v9));
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:@"persistentID"]);
  id v13 = [v12 longLongValue];

  v91 = v9;
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "tvs_dictionaryForKey:", @"playbackReporting"));
  if (!v14)
  {
    uint64_t v15 = (os_log_s *)off_1002B6938;
    if (os_log_type_enabled((os_log_t)off_1002B6938, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 138412290;
      id v114 = v9;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "No PAF data in options: %@", buf, 0xCu);
    }
  }

  v89 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "tvs_stringForKey:", @"containerType"));
  if ([v89 isEqualToString:@"movie"])
  {
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "tvs_stringForKey:", @"featureName"));
    if ([v16 length])
    {

      id v11 = 0LL;
    }
  }

  v88 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "tvs_arrayForKey:", @"data"));
  uint64_t v17 = objc_claimAutoreleasedReturnValue([v88 firstObject]);
  id v18 = (void *)v17;
  if (v17) {
    id v19 = (void *)v17;
  }
  else {
    id v19 = v8;
  }
  id v20 = v19;

  id v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "tvs_stringForKey:", @"storeAdamID"));
  if (v21
    || (uint64_t v37 = objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "tvs_stringForKey:", @"id")),
        id v21 = (void *)v37,
        !v13)
    || v37)
  {
    id v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "tvs_stringForKey:", @"type"));
    id v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "tvs_dictionaryForKey:", @"attributes"));
    if (!v22 || !v21)
    {
      if (v22)
      {
        id v24 = 0LL;
LABEL_54:
        -[TVMusicJSObject _handleMenuResponseWithItem:options:menuData:jsCallbackIdentifier:]( self,  "_handleMenuResponseWithItem:options:menuData:jsCallbackIdentifier:",  v8,  v91,  0LL,  v90);
        goto LABEL_55;
      }

      v86 = v10;
      v87 = v14;
      id v25 = (MPModelGenericObject *)objc_claimAutoreleasedReturnValue( -[TVMusicJSObject _genericObjectFromPlatformDictionary:]( self,  "_genericObjectFromPlatformDictionary:",  v8));
      id v24 = 0LL;
      if (v25)
      {
LABEL_47:
        v92[0] = _NSConcreteStackBlock;
        v92[1] = 3221225472LL;
        v92[2] = sub_10008C528;
        v92[3] = &unk_10026C420;
        v93 = v25;
        id v94 = v11;
        id v95 = v87;
        v96 = self;
        id v57 = v8;
        id v85 = v8;
        v58 = v21;
        id v59 = v20;
        v60 = v24;
        v61 = v23;
        v62 = v22;
        v63 = v11;
        id v64 = v57;
        id v97 = v57;
        id v98 = v91;
        id v99 = v90;
        v65 = v25;
        uint64_t v14 = v87;
        v66 = v65;
        id v67 = v64;
        id v11 = v63;
        id v22 = v62;
        id v23 = v61;
        id v24 = v60;
        id v20 = v59;
        id v21 = v58;
        id v8 = v85;
        -[TVMusicJSObject _getLibraryInfoForStoreDictionary:genericObject:completionHandler:]( self,  "_getLibraryInfoForStoreDictionary:genericObject:completionHandler:",  v67,  v65,  v92);

        id v10 = v86;
LABEL_55:

        goto LABEL_56;
      }

      goto LABEL_53;
    }

    v86 = v10;
    v87 = v14;
    id v24 = (void *)objc_claimAutoreleasedReturnValue( -[TVMusicJSObject _identifierSetForMusicKitType:identifier:]( self,  "_identifierSetForMusicKitType:identifier:",  v22,  v21));
    id v25 = 0LL;
    if (!v24 || !v23)
    {
LABEL_42:
      if (!v24 || v25)
      {
LABEL_46:
        if (v25) {
          goto LABEL_47;
        }
        goto LABEL_53;
      }

      if ([v22 isEqualToString:MPStoreItemMetadataMusicKitItemKindTVEpisode])
      {
        v54 = v11;
        v55 = objc_alloc(&OBJC_CLASS___MPModelTVEpisode);
        v102[0] = _NSConcreteStackBlock;
        v102[1] = 3221225472LL;
        v102[2] = sub_10008C448;
        v102[3] = &unk_10026BD48;
        id v103 = v8;
        v56 = -[MPModelTVEpisode initWithIdentifiers:block:](v55, "initWithIdentifiers:block:", v24, v102);
        id v25 = (MPModelGenericObject *)objc_claimAutoreleasedReturnValue( +[MPModelGenericObject genericObjectWithModelObject:]( &OBJC_CLASS___MPModelGenericObject,  "genericObjectWithModelObject:",  v56));

        id v11 = v54;
        goto LABEL_46;
      }

      if ([v22 isEqualToString:@"music-movies"])
      {
        v78 = v22;
        v68 = v11;
        v69 = (void *)objc_claimAutoreleasedReturnValue(+[MPModelMovieKind identityKind](&OBJC_CLASS___MPModelMovieKind, "identityKind"));
        uint64_t v70 = objc_claimAutoreleasedReturnValue( +[MPIdentifierSet tvm_identifierSetForModelKind:withStoreID:subscriptionID:]( MPIdentifierSet,  "tvm_identifierSetForModelKind:withStoreID:subscriptionID:",  v69,  [v21 longLongValue],  0));

        v71 = objc_alloc(&OBJC_CLASS___MPModelMovie);
        v100[0] = _NSConcreteStackBlock;
        v100[1] = 3221225472LL;
        v100[2] = sub_10008C4B8;
        v100[3] = &unk_10026BD20;
        id v101 = v8;
        v72 = -[MPModelMovie initWithIdentifiers:block:](v71, "initWithIdentifiers:block:", v70, v100);
        id v25 = (MPModelGenericObject *)objc_claimAutoreleasedReturnValue( +[MPModelGenericObject genericObjectWithModelObject:]( &OBJC_CLASS___MPModelGenericObject,  "genericObjectWithModelObject:",  v72));

        id v24 = (void *)v70;
        id v11 = v68;
        id v22 = v78;
        if (v25) {
          goto LABEL_47;
        }
      }

      else
      {
        v73 = (os_log_s *)off_1002B6938;
        if (os_log_type_enabled((os_log_t)off_1002B6938, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)__int128 buf = 138412546;
          id v114 = v22;
          __int16 v115 = 2112;
          v116 = v21;
          _os_log_impl( (void *)&_mh_execute_header,  v73,  OS_LOG_TYPE_DEFAULT,  "Can't create menu for MediaAPI response of type %@, id=%@",  buf,  0x16u);
        }
      }

- (id)_artistFromAlbumMediaData:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "tvs_dictionaryForKey:", @"relationships"));
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "tvs_dictionaryForKey:", @"artists"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "tvs_arrayForKey:", @"data"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 firstObject]);
  uint64_t v9 = objc_opt_class(&OBJC_CLASS___NSDictionary, v8);
  if ((objc_opt_isKindOfClass(v7, v9) & 1) != 0)
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "tvs_dictionaryForKey:", @"relationships"));
    id v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "tvs_dictionaryForKey:", @"artists"));
    id v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "tvs_arrayForKey:", @"data"));
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 firstObject]);
  }

  else
  {
    id v13 = 0LL;
  }

  if (v13)
  {
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKeyedSubscript:@"id"]);
    uint64_t v15 = (MPModelArtist *)[v14 longLongValue];

    if (v15)
    {
      uint64_t v16 = objc_alloc(&OBJC_CLASS___MPIdentifierSet);
      uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(+[MPModelAlbumKind identityKind](&OBJC_CLASS___MPModelAlbumKind, "identityKind"));
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472LL;
      void v20[2] = sub_10008C918;
      v20[3] = &unk_10026C460;
      v20[4] = v15;
      id v18 = -[MPIdentifierSet initWithModelKind:block:](v16, "initWithModelKind:block:", v17, v20);

      uint64_t v15 = -[MPModelArtist initWithIdentifiers:block:]( objc_alloc(&OBJC_CLASS___MPModelArtist),  "initWithIdentifiers:block:",  v18,  &stru_10026C480);
    }
  }

  else
  {
    uint64_t v15 = 0LL;
  }

  return v15;
}

- (id)_identifierSetForMusicKitType:(id)a3 identifier:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 isEqualToString:MPStoreItemMetadataMusicKitItemKindAlbum])
  {
    uint64_t v7 = objc_claimAutoreleasedReturnValue( +[MPIdentifierSet tvm_identiferSetForAlbumWithStoreID:subscriptionID:]( MPIdentifierSet,  "tvm_identiferSetForAlbumWithStoreID:subscriptionID:",  [v6 longLongValue],  objc_msgSend(v6, "longLongValue")));
LABEL_11:
    id v10 = (void *)v7;
    goto LABEL_12;
  }

  if ([v5 isEqualToString:MPStoreItemMetadataMusicKitItemKindArtist])
  {
    uint64_t v8 = &OBJC_CLASS___MPModelArtistKind;
  }

  else
  {
    if ([v5 isEqualToString:MPStoreItemMetadataMusicKitItemKindPlaylist])
    {
      uint64_t v7 = objc_claimAutoreleasedReturnValue( +[MPIdentifierSet tvm_identifierSetForPlaylistWithGlobalID:]( &OBJC_CLASS___MPIdentifierSet,  "tvm_identifierSetForPlaylistWithGlobalID:",  v6));
      goto LABEL_11;
    }

    if ([v5 isEqualToString:MPStoreItemMetadataMusicKitItemKindMusicVideo]
      || [v5 isEqualToString:MPStoreItemMetadataMusicKitItemKindSong])
    {
      uint64_t v7 = objc_claimAutoreleasedReturnValue( +[MPIdentifierSet tvm_identiferSetForSongWithStoreID:subscriptionID:]( MPIdentifierSet,  "tvm_identiferSetForSongWithStoreID:subscriptionID:",  [v6 longLongValue],  objc_msgSend(v6, "longLongValue")));
      goto LABEL_11;
    }

    if ([v5 isEqualToString:MPStoreItemMetadataMusicKitItemKindRadioStation])
    {
      uint64_t v7 = objc_claimAutoreleasedReturnValue( +[MPIdentifierSet tvm_identiferSetForRadioStationStringID:]( &OBJC_CLASS___MPIdentifierSet,  "tvm_identiferSetForRadioStationStringID:",  v6));
      goto LABEL_11;
    }

    if ([v5 isEqualToString:MPStoreItemMetadataMusicKitItemKindShow])
    {
      uint64_t v8 = &OBJC_CLASS___MPModelTVShowKind;
    }

    else if ([v5 isEqualToString:MPStoreItemMetadataMusicKitItemKindTVEpisode])
    {
      uint64_t v8 = &OBJC_CLASS___MPModelTVEpisodeKind;
    }

    else if ([v5 isEqualToString:MPStoreItemMetadataMusicKitItemKindTVSeason])
    {
      uint64_t v8 = &OBJC_CLASS___MPModelTVSeasonKind;
    }

    else
    {
      if (![v5 isEqualToString:@"music-movies"])
      {
        id v10 = 0LL;
        goto LABEL_12;
      }

      uint64_t v8 = &OBJC_CLASS___MPModelMovieKind;
    }
  }

  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 identityKind]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue( +[MPIdentifierSet tvm_identifierSetForModelKind:withStoreID:subscriptionID:]( MPIdentifierSet,  "tvm_identifierSetForModelKind:withStoreID:subscriptionID:",  v9,  [v6 longLongValue],  0));

LABEL_12:
  return v10;
}

- (void)_handleMenuResponseWithItem:(id)a3 options:(id)a4 menuData:(id)a5 jsCallbackIdentifier:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = (TVPMusicContextMenuData *)a5;
  id v12 = a6;
  v91[0] = &off_100281970;
  v91[1] = &off_100281988;
  v92[0] = @"GoToAlbum";
  v92[1] = @"GoToArtist";
  v91[2] = &off_1002819A0;
  v91[3] = &off_1002819B8;
  v92[2] = @"Shuffle";
  v92[3] = @"PlayNext";
  v91[4] = &off_1002819D0;
  v91[5] = &off_1002819E8;
  void v92[4] = @"AddToUpNext";
  v92[5] = @"GoToTVShow";
  v69 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v92,  v91,  6LL));
  uint64_t v70 = v12;
  if (v11)
  {
    id v13 = (void *)objc_claimAutoreleasedReturnValue(-[TVPMusicContextMenuData menuItems](v11, "menuItems"));

    if (!v13) {
      -[TVPMusicContextMenuData setMenuItems:](v11, "setMenuItems:", &__NSArray0__struct);
    }
  }

  else
  {
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:@"name"]);
    id v11 = -[TVPMusicContextMenuData initWithHeading:menuItems:]( objc_alloc(&OBJC_CLASS___TVPMusicContextMenuData),  "initWithHeading:menuItems:",  v14,  &__NSArray0__struct);
  }

  v63 = v11;
  v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", @"addedMenuItems", v9));
  id v61 = v10;
  if (v60)
  {
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[TVPMusicContextMenuData menuItems](v11, "menuItems"));
    id v16 = [v15 mutableCopy];

    __int128 v85 = 0u;
    __int128 v86 = 0u;
    __int128 v83 = 0u;
    __int128 v84 = 0u;
    id obj = v60;
    id v67 = [obj countByEnumeratingWithState:&v83 objects:v90 count:16];
    if (v67)
    {
      uint64_t v66 = *(void *)v84;
      do
      {
        for (i = 0LL; i != v67; i = (char *)i + 1)
        {
          if (*(void *)v84 != v66) {
            objc_enumerationMutation(obj);
          }
          id v18 = *(void **)(*((void *)&v83 + 1) + 8LL * (void)i);
          id v19 = objc_alloc(&OBJC_CLASS___TVPMusicContextMenuDataItem);
          id v20 = (void *)objc_claimAutoreleasedReturnValue([v18 objectForKeyedSubscript:@"displayText"]);
          id v21 = (void *)objc_claimAutoreleasedReturnValue([v18 objectForKeyedSubscript:@"identifier"]);
          id v22 = [v19 initWithTitle:v20 identifier:v21 actionBlock:0];

          id v23 = (void *)objc_claimAutoreleasedReturnValue([v18 objectForKeyedSubscript:@"menuPosition"]);
          id v24 = [v23 integerValue];
          id v25 = [v16 count];
          if (v24 >= v25)
          {
            [v16 count];
          }

          else
          {
            v65 = (void *)objc_claimAutoreleasedReturnValue([v18 objectForKeyedSubscript:@"menuPosition"]);
            [v65 integerValue];
          }

          id v26 = (void *)objc_claimAutoreleasedReturnValue([v18 objectForKeyedSubscript:@"menuPosition"]);
          id v27 = [v26 integerValue];
          if (v27 >= [v16 count])
          {
            id v29 = [v16 count];
          }

          else
          {
            uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue([v18 objectForKeyedSubscript:@"menuPosition"]);
            id v29 = [v28 integerValue];
          }

          if (v24 < v25) {
          [v16 insertObject:v22 atIndex:v29];
          }
        }

        id v67 = [obj countByEnumeratingWithState:&v83 objects:v90 count:16];
      }

      while (v67);
    }

    id v30 = [v16 count];
    id v11 = v63;
    id v31 = (void *)objc_claimAutoreleasedReturnValue(-[TVPMusicContextMenuData menuItems](v63, "menuItems"));
    id v32 = [v31 count];

    if (v30 > v32) {
      -[TVPMusicContextMenuData setMenuItems:](v63, "setMenuItems:", v16);
    }

    id v10 = v61;
  }

  v68 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:@"pageType"]);
  unsigned int v33 = [v68 isEqualToString:@"artist"];
  __int128 v79 = 0u;
  __int128 v80 = 0u;
  __int128 v81 = 0u;
  __int128 v82 = 0u;
  id v34 = (void *)objc_claimAutoreleasedReturnValue(-[TVPMusicContextMenuData menuItems](v11, "menuItems"));
  id v35 = [v34 copy];

  id v36 = [v35 countByEnumeratingWithState:&v79 objects:v89 count:16];
  uint64_t v37 = self;
  if (v36)
  {
    id v38 = v36;
    uint64_t v39 = *(void *)v80;
    do
    {
      v40 = 0LL;
      do
      {
        if (*(void *)v80 != v39) {
          objc_enumerationMutation(v35);
        }
        id v41 = *(void **)(*((void *)&v79 + 1) + 8LL * (void)v40);
        if (v33 && [*(id *)(*((void *)&v79 + 1) + 8 * (void)v40) menuItemType] == (id)2)
        {
          v42 = (void *)objc_claimAutoreleasedReturnValue(-[TVPMusicContextMenuData menuItems](v63, "menuItems"));
          id v43 = [v42 mutableCopy];

          [v43 removeObjectIdenticalTo:v41];
          uint64_t v37 = self;
          -[TVPMusicContextMenuData setMenuItems:](v63, "setMenuItems:", v43);
        }

        else
        {
          id v44 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [v41 menuItemType]));
          BOOL v45 = (void *)objc_claimAutoreleasedReturnValue([v69 objectForKeyedSubscript:v44]);

          if (v45
            || (uint64_t v47 = objc_claimAutoreleasedReturnValue([v41 identifier])) != 0
            && (id v48 = (void *)v47,
                id v49 = (void *)objc_claimAutoreleasedReturnValue([v41 actionBlock]),
                v49,
                v48,
                !v49)
            && (BOOL v45 = (void *)objc_claimAutoreleasedReturnValue([v41 identifier])) != 0)
          {
            v76[0] = _NSConcreteStackBlock;
            v76[1] = 3221225472LL;
            v76[2] = sub_10008D39C;
            v76[3] = &unk_1002691D8;
            v76[4] = v37;
            id v77 = v70;
            id v78 = v45;
            id v43 = v45;
            [v41 setActionBlock:v76];

            v46 = v77;
          }

          else
          {
            v50 = (void *)objc_claimAutoreleasedReturnValue([v41 actionBlock]);
            id v51 = [v50 copy];

            v73[0] = _NSConcreteStackBlock;
            v73[1] = 3221225472LL;
            v73[2] = sub_10008D3B0;
            v73[3] = &unk_100269CB0;
            id v75 = v51;
            v73[4] = v37;
            id v74 = v70;
            id v43 = v51;
            [v41 setActionBlock:v73];

            v46 = v75;
          }
        }

        v40 = (char *)v40 + 1;
      }

      while (v38 != v40);
      id v52 = [v35 countByEnumeratingWithState:&v79 objects:v89 count:16];
      id v38 = v52;
    }

    while (v52);
  }

  id v53 = (void *)objc_claimAutoreleasedReturnValue(-[TVPMusicContextMenuData menuItems](v63, "menuItems"));
  id v54 = [v53 count];

  if (v54)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10008D3E8;
    block[3] = &unk_100268CF0;
    v72 = v63;
    dispatch_async(&_dispatch_main_q, block);

    v55 = v59;
    v56 = v61;
    id v57 = v70;
  }

  else
  {
    v58 = (os_log_s *)off_1002B6938;
    v55 = v59;
    if (os_log_type_enabled((os_log_t)off_1002B6938, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 138412290;
      v88 = v59;
      _os_log_impl((void *)&_mh_execute_header, v58, OS_LOG_TYPE_DEFAULT, "Can't display menu for item: %@", buf, 0xCu);
    }

    id v57 = v70;
    -[TVMusicJSObject _callCallbackWithCallbackIdentifier:command:success:]( v37,  "_callCallbackWithCallbackIdentifier:command:success:",  v70,  0LL,  0LL);
    v56 = v61;
  }
}

- (void)performMediaRequestWithURL:(id)a3 :(id)a4 :(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = a3;
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicJSObject _prepareCallback:](self, "_prepareCallback:", v9));
  uint64_t v13 = objc_opt_class(&OBJC_CLASS___NSDictionary, v12);
  if ((objc_opt_isKindOfClass(v8, v13) & 1) != 0) {
    uint64_t v14 = v8;
  }
  else {
    uint64_t v14 = 0LL;
  }
  if (!v14) {
    uint64_t v14 = &__NSDictionary0__struct;
  }
  id v15 = v14;
  id v16 = (void *)objc_claimAutoreleasedReturnValue( -[TVMusicJSObject _urlWithAlbumTrackLimitRemovedFromURL:]( self,  "_urlWithAlbumTrackLimitRemovedFromURL:",  v10));

  objc_initWeak(&location, self);
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(+[TVMusicMediaAPI sharedInstance](&OBJC_CLASS___TVMusicMediaAPI, "sharedInstance"));
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_10008D590;
  v19[3] = &unk_10026C4B0;
  objc_copyWeak(&v21, &location);
  id v18 = v11;
  id v20 = v18;
  [v17 performRequestWithURL:v16 options:v15 completion:v19];

  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);
}

- (void)performMediaRequestWithPath:(id)a3 :(id)a4 :(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicJSObject _prepareCallback:](self, "_prepareCallback:", v10));
  uint64_t v13 = objc_opt_class(&OBJC_CLASS___NSDictionary, v12);
  if ((objc_opt_isKindOfClass(v9, v13) & 1) != 0) {
    uint64_t v14 = v9;
  }
  else {
    uint64_t v14 = 0LL;
  }
  if (!v14) {
    uint64_t v14 = &__NSDictionary0__struct;
  }
  id v15 = v14;
  objc_initWeak(&location, self);
  id v16 = (void *)objc_claimAutoreleasedReturnValue(+[TVMusicMediaAPI sharedInstance](&OBJC_CLASS___TVMusicMediaAPI, "sharedInstance"));
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_10008D7D4;
  v18[3] = &unk_10026C4B0;
  objc_copyWeak(&v20, &location);
  id v17 = v11;
  id v19 = v17;
  [v16 performRequestWithPath:v8 options:v15 completion:v18];

  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);
}

- (id)_urlWithAlbumTrackLimitRemovedFromURL:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSRegularExpression regularExpressionWithPattern:options:error:]( &OBJC_CLASS___NSRegularExpression,  "regularExpressionWithPattern:options:error:",  @"/albums/\\d+/tracks\\?.*(&limit=\\d+)",  0LL,  0LL));
  id v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "firstMatchInString:options:range:", v3, 0, 0, objc_msgSend(v3, "length")));
  id v6 = v5;
  if (v5 && [v5 numberOfRanges] == (id)2)
  {
    id v7 = [v6 rangeAtIndex:1];
    id v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "stringByReplacingCharactersInRange:withString:", v7, v8, &stru_100279068));

    id v10 = (os_log_s *)off_1002B6938;
    if (os_log_type_enabled((os_log_t)off_1002B6938, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138412290;
      uint64_t v13 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Removing track limit from MediaAPI album request. Resulting URL: %@",  (uint8_t *)&v12,  0xCu);
    }
  }

  else
  {
    id v9 = v3;
  }

  return v9;
}

+ (id)_propertyGenericRelationships
{
  id v3 = (void *)qword_1002BE9C0;
  if (!qword_1002BE9C0)
  {
    v21[0] = MPModelRelationshipGenericAlbum;
    id v4 = objc_msgSend((id)objc_opt_class(a1, a2), "propertySetForAlbum");
    id v18 = (void *)objc_claimAutoreleasedReturnValue(v4);
    v22[0] = v18;
    v21[1] = MPModelRelationshipGenericArtist;
    v20[0] = MPModelPropertyArtistName;
    v20[1] = MPModelPropertyArtistIsDisliked;
    void v20[2] = MPModelPropertyArtistIsFavorite;
    id v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v20, 3LL));
    id v5 = (void *)objc_claimAutoreleasedReturnValue( +[MPPropertySet propertySetWithProperties:]( &OBJC_CLASS___MPPropertySet,  "propertySetWithProperties:",  v17));
    v22[1] = v5;
    void v21[2] = MPModelRelationshipGenericSong;
    id v6 = (void *)objc_claimAutoreleasedReturnValue( +[TVMusicMPLibraryRequestFactory propertySetForSongsInContextMenu]( &OBJC_CLASS___TVMusicMPLibraryRequestFactory,  "propertySetForSongsInContextMenu"));
    v22[2] = v6;
    v21[3] = MPModelRelationshipGenericPlaylist;
    id v7 = (void *)objc_claimAutoreleasedReturnValue( +[TVMusicMPLibraryRequestFactory playlistsLibraryRequestWithParentPlaylistFolder:]( &OBJC_CLASS___TVMusicMPLibraryRequestFactory,  "playlistsLibraryRequestWithParentPlaylistFolder:",  0LL));
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 itemProperties]);
    v22[3] = v8;
    v21[4] = MPModelRelationshipGenericRadioStation;
    v19[0] = MPModelPropertyRadioStationName;
    v19[1] = MPModelPropertyRadioStationBeats1;
    id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v19, 2LL));
    id v10 = (void *)objc_claimAutoreleasedReturnValue( +[MPPropertySet propertySetWithProperties:]( &OBJC_CLASS___MPPropertySet,  "propertySetWithProperties:",  v9));
    void v22[4] = v10;
    v21[5] = MPModelRelationshipGenericTVEpisode;
    id v11 = (void *)objc_claimAutoreleasedReturnValue( +[TVMusicMPLibraryRequestFactory propertySetForTVEpisode]( &OBJC_CLASS___TVMusicMPLibraryRequestFactory,  "propertySetForTVEpisode"));
    v22[5] = v11;
    v21[6] = MPModelRelationshipGenericMovie;
    int v12 = (void *)objc_claimAutoreleasedReturnValue( +[TVMusicMPLibraryRequestFactory moviesLibraryRequest]( &OBJC_CLASS___TVMusicMPLibraryRequestFactory,  "moviesLibraryRequest"));
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v12 itemProperties]);
    v22[6] = v13;
    uint64_t v14 = objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v22,  v21,  7LL));
    id v15 = (void *)qword_1002BE9C0;
    qword_1002BE9C0 = v14;

    id v3 = (void *)qword_1002BE9C0;
  }

  return v3;
}

+ (id)propertySetForAlbum
{
  id v2 = objc_alloc(&OBJC_CLASS___MPPropertySet);
  v18[0] = MPModelPropertyAlbumArtwork;
  v18[1] = MPModelPropertyAlbumDateFavorited;
  v18[2] = MPModelPropertyAlbumHasExplicitContent;
  v18[3] = MPModelPropertyAlbumIsCompilation;
  void v18[4] = MPModelPropertyAlbumIsClassical;
  v18[5] = MPModelPropertyAlbumIsDisliked;
  v18[6] = MPModelPropertyAlbumIsFavorite;
  v18[7] = MPModelPropertyAlbumLibraryAdded;
  v18[8] = MPModelPropertyAlbumReleaseDateComponents;
  v18[9] = MPModelPropertyAlbumSongPopularity;
  v18[10] = MPModelPropertyAlbumTitle;
  v18[11] = MPModelPropertyAlbumTrackCount;
  v18[12] = MPModelPropertyAlbumTraits;
  v18[13] = MPModelPropertyAlbumYear;
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v18, 14LL));
  v16[0] = MPModelRelationshipAlbumArtist;
  v15[0] = MPModelPropertyArtistIsDisliked;
  v15[1] = MPModelPropertyArtistIsFavorite;
  v15[2] = MPModelPropertyArtistName;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v15, 3LL));
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[MPPropertySet propertySetWithProperties:]( &OBJC_CLASS___MPPropertySet,  "propertySetWithProperties:",  v4));
  v17[0] = v5;
  v16[1] = MPModelRelationshipAlbumGenre;
  uint64_t v14 = MPModelPropertyGenreName;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v14, 1LL));
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[MPPropertySet propertySetWithProperties:]( &OBJC_CLASS___MPPropertySet,  "propertySetWithProperties:",  v6));
  v17[1] = v7;
  v16[2] = MPModelRelationshipAlbumRepresentativeSong;
  v13[0] = MPModelPropertySongIsDisliked;
  v13[1] = MPModelPropertySongIsFavorite;
  v13[2] = MPModelPropertySongHasVideo;
  v13[3] = MPModelPropertySongTitle;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v13, 4LL));
  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[MPPropertySet propertySetWithProperties:]( &OBJC_CLASS___MPPropertySet,  "propertySetWithProperties:",  v8));
  v17[2] = v9;
  id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v17,  v16,  3LL));
  id v11 = [v2 initWithProperties:v3 relationships:v10];

  return v11;
}

- (id)_storeObjectFromPlatformDictionary:(id)a3 getProperties:(BOOL)a4
{
  BOOL v4 = a4;
  id v21 = a3;
  if (v4)
  {
    v39[0] = MPModelStoreBrowseContentItemRelationshipAlbum;
    id v24 = (void *)objc_claimAutoreleasedReturnValue( +[TVMusicMPLibraryRequestFactory propertySetForAlbumDetails]( &OBJC_CLASS___TVMusicMPLibraryRequestFactory,  "propertySetForAlbumDetails"));
    v40[0] = v24;
    v39[1] = MPModelStoreBrowseContentItemRelationshipArtist;
    id v23 = (void *)objc_claimAutoreleasedReturnValue( +[TVMusicMPLibraryRequestFactory artistsLibraryRequest]( &OBJC_CLASS___TVMusicMPLibraryRequestFactory,  "artistsLibraryRequest"));
    id v22 = (void *)objc_claimAutoreleasedReturnValue([v23 itemProperties]);
    v40[1] = v22;
    v39[2] = MPModelStoreBrowseContentItemRelationshipSong;
    id v5 = (void *)objc_claimAutoreleasedReturnValue( +[TVMusicMPLibraryRequestFactory propertySetForSongsInContextMenu]( &OBJC_CLASS___TVMusicMPLibraryRequestFactory,  "propertySetForSongsInContextMenu"));
    v40[2] = v5;
    v39[3] = MPModelStoreBrowseContentItemRelationshipPlaylist;
    id v6 = (void *)objc_claimAutoreleasedReturnValue( +[TVMusicMPLibraryRequestFactory playlistsLibraryRequestWithParentPlaylistFolder:]( &OBJC_CLASS___TVMusicMPLibraryRequestFactory,  "playlistsLibraryRequestWithParentPlaylistFolder:",  0LL));
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 itemProperties]);
    v40[3] = v7;
    v39[4] = MPModelStoreBrowseContentItemRelationshipRadioStation;
    v38[0] = MPModelPropertyRadioStationName;
    v38[1] = MPModelPropertyRadioStationBeats1;
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v38, 2LL));
    id v9 = (void *)objc_claimAutoreleasedReturnValue( +[MPPropertySet propertySetWithProperties:]( &OBJC_CLASS___MPPropertySet,  "propertySetWithProperties:",  v8));
    void v40[4] = v9;
    v39[5] = MPModelStoreBrowseContentItemRelationshipTVEpisode;
    id v10 = (void *)objc_claimAutoreleasedReturnValue( +[TVMusicMPLibraryRequestFactory propertySetForTVEpisode]( &OBJC_CLASS___TVMusicMPLibraryRequestFactory,  "propertySetForTVEpisode"));
    v40[5] = v10;
    void v39[6] = MPModelStoreBrowseContentItemRelationshipMovie;
    id v11 = (void *)objc_claimAutoreleasedReturnValue( +[TVMusicMPLibraryRequestFactory moviesLibraryRequest]( &OBJC_CLASS___TVMusicMPLibraryRequestFactory,  "moviesLibraryRequest"));
    int v12 = (void *)objc_claimAutoreleasedReturnValue([v11 itemProperties]);
    v40[6] = v12;
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v40,  v39,  7LL));
  }

  else
  {
    v36[0] = MPModelStoreBrowseContentItemRelationshipAlbum;
    id v24 = (void *)objc_claimAutoreleasedReturnValue(+[MPPropertySet emptyPropertySet](&OBJC_CLASS___MPPropertySet, "emptyPropertySet"));
    v37[0] = v24;
    v36[1] = MPModelStoreBrowseContentItemRelationshipArtist;
    id v23 = (void *)objc_claimAutoreleasedReturnValue(+[MPPropertySet emptyPropertySet](&OBJC_CLASS___MPPropertySet, "emptyPropertySet"));
    v37[1] = v23;
    v36[2] = MPModelStoreBrowseContentItemRelationshipSong;
    id v22 = (void *)objc_claimAutoreleasedReturnValue(+[MPPropertySet emptyPropertySet](&OBJC_CLASS___MPPropertySet, "emptyPropertySet"));
    v37[2] = v22;
    v36[3] = MPModelStoreBrowseContentItemRelationshipPlaylist;
    id v5 = (void *)objc_claimAutoreleasedReturnValue(+[MPPropertySet emptyPropertySet](&OBJC_CLASS___MPPropertySet, "emptyPropertySet"));
    v37[3] = v5;
    v36[4] = MPModelStoreBrowseContentItemRelationshipRadioStation;
    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[MPPropertySet emptyPropertySet](&OBJC_CLASS___MPPropertySet, "emptyPropertySet"));
    v37[4] = v6;
    v36[5] = MPModelStoreBrowseContentItemRelationshipTVEpisode;
    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[MPPropertySet emptyPropertySet](&OBJC_CLASS___MPPropertySet, "emptyPropertySet"));
    v37[5] = v7;
    v36[6] = MPModelStoreBrowseContentItemRelationshipMovie;
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[MPPropertySet emptyPropertySet](&OBJC_CLASS___MPPropertySet, "emptyPropertySet"));
    v37[6] = v8;
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v37,  v36,  7LL));
  }

  id v14 = objc_alloc(&OBJC_CLASS___MPPropertySet);
  v35[0] = MPModelStoreBrowseContentItemPropertyItemType;
  v35[1] = MPModelStoreBrowseContentItemPropertyArtistUploadedContentType;
  id v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v35, 2LL));
  id v16 = [v14 initWithProperties:v15 relationships:v13];

  uint64_t v29 = 0LL;
  id v30 = &v29;
  uint64_t v31 = 0x3032000000LL;
  id v32 = sub_10008E46C;
  unsigned int v33 = sub_10008E47C;
  id v34 = 0LL;
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472LL;
  v25[2] = sub_10008E484;
  v25[3] = &unk_100269E60;
  id v17 = v16;
  id v26 = v17;
  uint64_t v28 = &v29;
  id v18 = v21;
  id v27 = v18;
  +[MPModelObject performWithoutEnforcement:](&OBJC_CLASS___MPModelObject, "performWithoutEnforcement:", v25);
  id v19 = (id)v30[5];

  _Block_object_dispose(&v29, 8);
  return v19;
}

- (id)_genericObjectFromPlatformDictionary:(id)a3
{
  id v4 = a3;
  uint64_t v13 = 0LL;
  id v14 = &v13;
  uint64_t v15 = 0x3032000000LL;
  id v16 = sub_10008E46C;
  id v17 = sub_10008E47C;
  id v18 = 0LL;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_10008E640;
  v9[3] = &unk_100269E60;
  id v5 = (id)objc_claimAutoreleasedReturnValue( -[TVMusicJSObject _storeObjectFromPlatformDictionary:getProperties:]( self,  "_storeObjectFromPlatformDictionary:getProperties:",  v4,  1LL));
  id v10 = v5;
  int v12 = &v13;
  id v6 = v4;
  id v11 = v6;
  +[MPModelObject performWithoutEnforcement:](&OBJC_CLASS___MPModelObject, "performWithoutEnforcement:", v9);
  id v7 = (id)v14[5];

  _Block_object_dispose(&v13, 8);
  return v7;
}

- (void)getBookmarkDataForItems:(id)a3 :(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (void *)qword_1002BE9C8;
  if (!qword_1002BE9C8)
  {
    id v9 = objc_alloc_init(&OBJC_CLASS___NSDateFormatter);
    id v10 = (void *)qword_1002BE9C8;
    qword_1002BE9C8 = (uint64_t)v9;

    [(id)qword_1002BE9C8 setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss"];
    uint64_t v8 = (void *)qword_1002BE9C8;
  }

  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale currentLocale](&OBJC_CLASS___NSLocale, "currentLocale"));
  [v8 setLocale:v11];

  int v12 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicJSObject _prepareCallback:](self, "_prepareCallback:", v7));
  objc_initWeak(&location, self);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_10008E8C0;
  void v15[3] = &unk_100269758;
  id v16 = v6;
  id v17 = v12;
  id v13 = v12;
  id v14 = v6;
  objc_copyWeak(&v18, &location);
  dispatch_async(&_dispatch_main_q, v15);
  objc_destroyWeak(&v18);

  objc_destroyWeak(&location);
}

- (BOOL)allowVideo
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](&OBJC_CLASS___MCProfileConnection, "sharedConnection"));
  BOOL v3 = [v2 effectiveBoolValueForSetting:MCFeatureMusicVideosAllowed] == 1;

  return v3;
}

- (BOOL)marketingOffersEnabled
{
  return 1;
}

- (BOOL)artistMotionEnabled
{
  return 1;
}

- (BOOL)oasisEnabled
{
  return 1;
}

- (BOOL)supportsPlaybackRestrictions
{
  return 1;
}

- (BOOL)favoritingEnabled
{
  return _os_feature_enabled_impl("MediaPlayer", "Favoriting");
}

- (BOOL)allowMotion
{
  return !UIAccessibilityIsReduceMotionEnabled();
}

- (void)showPrivacyNotice
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100093454;
  block[3] = &unk_100268D60;
  BOOL v3 = &stru_10026C4D8;
  dispatch_async(&_dispatch_main_q, block);
}

- (void)getSubscriptionStatus:(id)a3 :(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicJSObject _prepareCallback:](self, "_prepareCallback:", v7));
  id v9 = -[ICStoreRequestContext initWithBlock:]( objc_alloc(&OBJC_CLASS___ICStoreRequestContext),  "initWithBlock:",  &stru_10026C518);
  id v10 = [[ICMusicSubscriptionStatusRequest alloc] initWithStoreRequestContext:v9];
  [v10 setAllowsFallbackToExpiredStatus:1];
  [v10 setAllowsFallbackToStatusNeedingReload:1];
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"ignoreCache"]);
  unsigned int v12 = [v11 BOOLValue];

  if (v12) {
    [v10 setShouldIgnoreCache:1];
  }
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"returnLastKnownStatus"]);
  unsigned int v14 = [v13 BOOLValue];

  if (v14) {
    [v10 setShouldReturnLastKnownStatusOnly:1];
  }
  objc_initWeak(&location, self);
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue( +[ICMusicSubscriptionStatusController sharedStatusController]( &OBJC_CLASS___ICMusicSubscriptionStatusController,  "sharedStatusController"));
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_10008F174;
  void v17[3] = &unk_10026C540;
  objc_copyWeak(&v19, &location);
  id v16 = v8;
  id v18 = v16;
  [v15 performSubscriptionStatusRequest:v10 withStatusHandler:v17];

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);
}

- (void)showToast:(id)a3 :(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 isEqualToString:@"favorited.artist"])
  {
    *(void *)block = _NSConcreteStackBlock;
    *(void *)&block[8] = 3221225472LL;
    *(void *)&block[16] = sub_100093454;
    id v13 = &unk_100268D60;
    unsigned int v14 = &stru_10026C560;
    dispatch_async(&_dispatch_main_q, block);
    id v7 = v14;
LABEL_5:

    goto LABEL_6;
  }

  if ([v5 isEqualToString:@"custom"])
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_10008F6A8;
    v10[3] = &unk_100268CF0;
    id v11 = (Block_layout *)v6;
    uint64_t v8 = v10;
    *(void *)block = _NSConcreteStackBlock;
    *(void *)&block[8] = 3221225472LL;
    *(void *)&block[16] = sub_100093454;
    id v13 = &unk_100268D60;
    unsigned int v14 = v8;
    dispatch_async(&_dispatch_main_q, block);

    id v7 = v11;
    goto LABEL_5;
  }

  id v9 = (os_log_s *)off_1002B6938;
  if (os_log_type_enabled((os_log_t)off_1002B6938, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)block = 138412546;
    *(void *)&void block[4] = v5;
    *(_WORD *)&block[12] = 2112;
    *(void *)&block[14] = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "showToast Unrecognized type: %@, options: %@",  block,  0x16u);
  }

- (void)getFavoriteStateWithStoreID:(id)a3 :(id)a4 :(id)a5 :(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v20 = a5;
  id v12 = a6;
  id v13 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicJSObject _prepareCallback:](self, "_prepareCallback:", v12));
  unsigned int v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicJSObject _modelKindForItemTypeString:](self, "_modelKindForItemTypeString:", v11));
  if ([v11 isEqualToString:@"playlist"]) {
    uint64_t v16 = objc_claimAutoreleasedReturnValue( +[MPIdentifierSet tvm_identifierSetForPlaylistWithGlobalID:]( &OBJC_CLASS___MPIdentifierSet,  "tvm_identifierSetForPlaylistWithGlobalID:",  v10));
  }
  else {
    uint64_t v16 = objc_claimAutoreleasedReturnValue( +[MPIdentifierSet tvm_identifierSetForModelKind:withStoreID:subscriptionID:]( MPIdentifierSet,  "tvm_identifierSetForModelKind:withStoreID:subscriptionID:",  v15,  [v10 longLongValue],  objc_msgSend(v10, "longLongValue")));
  }
  id v17 = (void *)v16;
  if (v15 && v16)
  {
    objc_initWeak(&location, self);
    id v18 = (void *)objc_claimAutoreleasedReturnValue( -[TVMusicJSObject _favoritingPropertiesForMPModelKind:]( self,  "_favoritingPropertiesForMPModelKind:",  v15));
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472LL;
    void v21[2] = sub_10008FA00;
    v21[3] = &unk_10026C118;
    id v22 = v14;
    objc_copyWeak(&v24, &location);
    id v23 = v13;
    +[TVMusicLibraryUtilities findMPObjectWithIdentifiers:itemKind:itemProperties:completionHandler:]( &OBJC_CLASS___TVMusicLibraryUtilities,  "findMPObjectWithIdentifiers:itemKind:itemProperties:completionHandler:",  v17,  v15,  v18,  v21);

    objc_destroyWeak(&v24);
    objc_destroyWeak(&location);
  }

  else
  {
    [v14 setObject:&__kCFBooleanFalse forKeyedSubscript:@"success"];
    [v14 setObject:@"Invalid storeID or kind string" forKeyedSubscript:@"error"];
    id v26 = v14;
    id v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v26, 1LL));
    -[TVMusicJSObject _jsCallbackWithIdentifier:args:](self, "_jsCallbackWithIdentifier:args:", v13, v19);
  }
}

- (void)setArtistFavoriteStateWithStoreID:(id)a3 :(id)a4 :(BOOL)a5 :(id)a6 :(id)a7
{
  BOOL v9 = a5;
  id v12 = a3;
  id v13 = a4;
  id v22 = a6;
  id v14 = a7;
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicJSObject _prepareCallback:](self, "_prepareCallback:", v14));
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(+[MPModelArtistKind identityKind](&OBJC_CLASS___MPModelArtistKind, "identityKind"));
  id v17 = (void *)objc_claimAutoreleasedReturnValue( +[MPIdentifierSet tvm_identifierSetForModelKind:withStoreID:subscriptionID:]( MPIdentifierSet,  "tvm_identifierSetForModelKind:withStoreID:subscriptionID:",  v16,  [v12 longLongValue],  0));

  id v18 = objc_alloc(&OBJC_CLASS___MPModelArtist);
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472LL;
  v27[2] = sub_10008FDEC;
  v27[3] = &unk_10026C588;
  id v19 = v13;
  id v28 = v19;
  id v20 = -[MPModelArtist initWithIdentifiers:block:](v18, "initWithIdentifiers:block:", v17, v27);
  objc_initWeak(&location, self);
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472LL;
  v23[2] = sub_10008FDF8;
  v23[3] = &unk_10026C5B0;
  objc_copyWeak(&v25, &location);
  id v21 = v15;
  id v24 = v21;
  +[TVMusicLibraryUtilities setFavoriteFlag:forItem:completion:]( &OBJC_CLASS___TVMusicLibraryUtilities,  "setFavoriteFlag:forItem:completion:",  v9,  v20,  v23);

  objc_destroyWeak(&v25);
  objc_destroyWeak(&location);
}

- (void)_subscriptionStatusDidChange:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue([a3 object]);
  BOOL v9 = @"subscribed";
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v4 hasMusicSubscription]));
  id v10 = v5;
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v10,  &v9,  1LL));

  uint64_t v8 = v6;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v8, 1LL));
  -[TVMusicJSObject _callJSMethodNamed:withArgs:]( self,  "_callJSMethodNamed:withArgs:",  @"onSubscriptionStatusChanged",  v7);
}

- (void)_playbackContainerDidChange:(id)a3
{
  uint64_t v4 = objc_claimAutoreleasedReturnValue([a3 userInfo]);
  id v5 = (void *)v4;
  id v6 = &__NSDictionary0__struct;
  if (v4) {
    id v6 = (void *)v4;
  }
  id v7 = v6;

  id v9 = v7;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v9, 1LL));

  -[TVMusicJSObject _callJSMethodNamed:withArgs:]( self,  "_callJSMethodNamed:withArgs:",  @"onStorePushNotification",  v8);
}

- (void)_playbackErrorDidOccur:(id)a3
{
  id v16 = a3;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v16 userInfo]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:TVPPlaybackErrorKey]);

  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 userInfo]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:NSUnderlyingErrorKey]);

  if (v7)
  {
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v5 userInfo]);
    uint64_t v9 = objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:NSUnderlyingErrorKey]);

    id v5 = (void *)v9;
  }

  id v10 = (void *)objc_claimAutoreleasedReturnValue([v5 domain]);
  if ([v10 isEqual:MPCErrorDomain] && objc_msgSend(v5, "code") == (id)17)
  {

LABEL_8:
    id v13 = @"onSubscriptionRequired";
LABEL_13:
    -[TVMusicJSObject _callJSPlaybackErrorNotification:error:methodName:]( self,  "_callJSPlaybackErrorNotification:error:methodName:",  v16,  v5,  v13);
    goto LABEL_15;
  }

  id v11 = (void *)objc_claimAutoreleasedReturnValue([v5 domain]);
  if ([v11 isEqualToString:NSOSStatusErrorDomain])
  {
    id v12 = [v5 code];

    if (v12 == (id)-42585LL) {
      goto LABEL_8;
    }
  }

  else
  {
  }

  id v14 = (void *)objc_claimAutoreleasedReturnValue([v5 domain]);
  if (![v14 isEqualToString:ICErrorDomain])
  {

    goto LABEL_15;
  }

  id v15 = [v5 code];

  if (v15 == (id)-7007LL)
  {
    id v13 = @"onPrivacyAgreementRequired";
    goto LABEL_13;
  }

- (void)_callJSPlaybackErrorNotification:(id)a3 error:(id)a4 methodName:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = a3;
  if (+[NSThread isMainThread](&OBJC_CLASS___NSThread, "isMainThread"))
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue(+[TVMusicNowPlayingManager sharedInstance](&OBJC_CLASS___TVMusicNowPlayingManager, "sharedInstance"));
    [v11 hideCurrentPlaybackController];
  }

  else
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100093460;
    block[3] = &unk_100268D60;
    id v21 = &stru_10026C5D0;
    dispatch_async(&_dispatch_main_q, block);
  }

  id v12 = (void *)objc_claimAutoreleasedReturnValue([v10 userInfo]);

  id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:@"TVMusicPlayerErrorNotificationGenericObjectKey"]);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_100090450;
  void v16[3] = &unk_10026C5F8;
  id v17 = v8;
  id v18 = self;
  id v19 = v9;
  id v14 = v9;
  id v15 = v8;
  -[TVMusicJSObject _getDictionaryForGenericObject:completionHandler:]( self,  "_getDictionaryForGenericObject:completionHandler:",  v13,  v16);
}

- (void)_didAttemptAddToLibrary:(id)a3
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([a3 userInfo]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue( [v4 objectForKeyedSubscript:@"TVMusicNowPlayingContextMenuAddToLibraryMenuIdentifierKey"]);

  id v9 = @"reason";
  id v10 = v5;
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v10,  &v9,  1LL));
  id v8 = v6;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v8, 1LL));
  -[TVMusicJSObject _callJSMethodNamed:withArgs:]( self,  "_callJSMethodNamed:withArgs:",  @"onSubscriptionRequired",  v7);
}

- (void)_subscriptionRequired:(id)a3
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([a3 userInfo]);
  id v6 = v4;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v6, 1LL));
  -[TVMusicJSObject _callJSMethodNamed:withArgs:]( self,  "_callJSMethodNamed:withArgs:",  @"onSubscriptionRequired",  v5);
}

- (void)_transientStateChanged:(id)a3
{
}

- (void)_getDictionaryForGenericObject:(id)a3 completionHandler:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = (void (**)(void, void))v6;
  if (v5)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v5 identifiers]);
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 universalStore]);
    id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithLongLong:]( NSNumber,  "numberWithLongLong:",  [v10 subscriptionAdamID]));
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 stringValue]);
    [v8 setObject:v12 forKeyedSubscript:@"storeID"];

    id v13 = (void *)objc_claimAutoreleasedReturnValue([v5 identifiers]);
    id v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "tvm_dictionaryRepresentation"));
    [v8 setObject:v14 forKeyedSubscript:@"ids"];

    uint64_t v29 = 0LL;
    id v30 = &v29;
    uint64_t v31 = 0x3032000000LL;
    id v32 = sub_10008E46C;
    unsigned int v33 = sub_10008E47C;
    id v34 = 0LL;
    v27[0] = 0LL;
    v27[1] = v27;
    v27[2] = 0x2020000000LL;
    char v28 = 0;
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472LL;
    v22[2] = sub_1000909A0;
    v22[3] = &unk_10026C630;
    id v15 = v5;
    id v23 = v15;
    id v25 = &v29;
    id v26 = v27;
    id v16 = v8;
    id v24 = v16;
    +[MPModelObject performWithoutEnforcement:](&OBJC_CLASS___MPModelObject, "performWithoutEnforcement:", v22);
    uint64_t v17 = v30[5];
    if (v17)
    {
      id v18 = (void *)objc_claimAutoreleasedReturnValue([v15 anyObject]);
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472LL;
      void v19[2] = sub_100090D6C;
      v19[3] = &unk_10026C658;
      id v20 = v16;
      id v21 = v7;
      +[TVMusicJSObject getURLForArtworkCatalog:mpObject:completionHandler:]( &OBJC_CLASS___TVMusicJSObject,  "getURLForArtworkCatalog:mpObject:completionHandler:",  v17,  v18,  v19);
    }

    else
    {
      ((void (**)(void, id))v7)[2](v7, v16);
    }

    _Block_object_dispose(v27, 8);
    _Block_object_dispose(&v29, 8);
  }

  else
  {
    (*((void (**)(id, void))v6 + 2))(v6, 0LL);
  }
}

- (void)_setupMusicLibraryNotifications
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  uint64_t v4 = sub_100090E7C;
  id v5 = &unk_100268CF0;
  id v6 = self;
  id v2 = v3;
  if (+[NSThread isMainThread](&OBJC_CLASS___NSThread, "isMainThread"))
  {
    v4((uint64_t)v2);
  }

  else
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100093460;
    block[3] = &unk_100268D60;
    id v8 = v2;
    dispatch_async(&_dispatch_main_q, block);
  }
}

- (void)_libraryManagerStateChanged:(id)a3
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([a3 object]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicJSObject libraryManager](self, "libraryManager"));

  if (v4 == v5)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicJSObject libraryManager](self, "libraryManager"));
    id v7 = (char *)[v6 state];

    if ((unint64_t)(v7 - 1) >= 2)
    {
    }

    else
    {
      -[TVMusicJSObject setIsMusicLibrarySynced:](self, "setIsMusicLibrarySynced:", 0LL);
    }
  }

- (void)_libraryWasUpdated:(id)a3
{
}

- (void)_callJSMethodNamed:(id)a3 withArgs:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (os_log_s *)off_1002B6938;
  if (os_log_type_enabled((os_log_t)off_1002B6938, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)__int128 buf = 138412546;
    id v17 = v6;
    __int16 v18 = 2112;
    id v19 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Calling JS method %@ with args %@", buf, 0x16u);
  }

  objc_initWeak((id *)buf, self);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicJSObject appContext](self, "appContext"));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_1000911FC;
  v12[3] = &unk_10026C680;
  objc_copyWeak(&v15, (id *)buf);
  id v10 = v6;
  id v13 = v10;
  id v11 = v7;
  id v14 = v11;
  [v9 evaluate:v12 completionBlock:0];

  objc_destroyWeak(&v15);
  objc_destroyWeak((id *)buf);
}

+ (BOOL)_needsSubscriptionForPlayItem:(id)a3
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue([a3 objectForKeyedSubscript:@"isFreeContent"]);
  unsigned __int8 v4 = [v3 BOOLValue];

  if ((v4 & 1) != 0)
  {
    LOBYTE(v5) = 0;
  }

  else
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[TVMSubscriptionManager sharedInstance](&OBJC_CLASS___TVMSubscriptionManager, "sharedInstance"));
    unsigned int v5 = [v6 hasMusicSubscription] ^ 1;
  }

  return v5;
}

- (void)_callJSMusicInitializedNotification
{
}

- (void)_callJSMusicUpdatedNotification
{
}

- (BOOL)_isItemInLibraryWithStoreDictionary:(id)a3
{
  id v4 = a3;
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue( -[TVMusicJSObject _storeObjectFromPlatformDictionary:getProperties:]( self,  "_storeObjectFromPlatformDictionary:getProperties:",  v4,  0LL));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"kind"]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicJSObject _modelKindForItemTypeString:](self, "_modelKindForItemTypeString:", v6));

  if (v5 && v7)
  {
    if ([v5 itemType] == (id)1)
    {
      id v8 = (void *)objc_claimAutoreleasedReturnValue([v5 album]);
      id v9 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"children"]);
      id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 allValues]);
      BOOL v11 = -[TVMusicJSObject _isAlbumInLibrary:storeSongArray:](self, "_isAlbumInLibrary:storeSongArray:", v8, v10);
    }

    else
    {
      id v13 = (void *)objc_claimAutoreleasedReturnValue([v5 innerObject]);
      id v8 = (void *)objc_claimAutoreleasedReturnValue([v13 identifiers]);

      id v14 = (void *)objc_claimAutoreleasedReturnValue([v8 universalStore]);
      id v15 = [v14 adamID];

      if (v15)
      {
        id v16 = (void *)objc_claimAutoreleasedReturnValue([v8 universalStore]);
        id v17 = [v16 subscriptionAdamID];

        if (!v17)
        {
          uint64_t v18 = objc_claimAutoreleasedReturnValue( +[MPIdentifierSet tvm_identifierSetForModelKind:withStoreID:subscriptionID:]( &OBJC_CLASS___MPIdentifierSet,  "tvm_identifierSetForModelKind:withStoreID:subscriptionID:",  v7,  v15,  v15));

          id v8 = (void *)v18;
        }
      }

      BOOL v11 = -[TVMusicJSObject _isItemInLibraryWithIdentifiers:itemKind:]( self,  "_isItemInLibraryWithIdentifiers:itemKind:",  v8,  v7);
    }
  }

  else
  {
    id v12 = (os_log_s *)off_1002B6938;
    BOOL v11 = 0;
    if (os_log_type_enabled((os_log_t)off_1002B6938, OS_LOG_TYPE_DEFAULT))
    {
      int v20 = 138412290;
      id v21 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Unable to check for item in library: item = %@",  (uint8_t *)&v20,  0xCu);
      BOOL v11 = 0;
    }
  }

  return v11;
}

- (BOOL)_isItemInLibraryWithIdentifiers:(id)a3 itemKind:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = v6;
  uint64_t v17 = 0LL;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x2020000000LL;
  char v20 = 0;
  if (v5 && v6)
  {
    id v8 = dispatch_group_create();
    dispatch_group_enter(v8);
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_1000917B0;
    v14[3] = &unk_10026C6A8;
    id v16 = &v17;
    id v9 = v8;
    id v15 = v9;
    +[TVMusicLibraryUtilities findMPObjectWithIdentifiers:itemKind:itemProperties:completionHandler:]( &OBJC_CLASS___TVMusicLibraryUtilities,  "findMPObjectWithIdentifiers:itemKind:itemProperties:completionHandler:",  v5,  v7,  0LL,  v14);
    dispatch_time_t v10 = dispatch_time(0LL, 5000000000LL);
    dispatch_group_wait(v9, v10);
  }

  else
  {
    BOOL v11 = (os_log_s *)off_1002B6938;
    if (os_log_type_enabled((os_log_t)off_1002B6938, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 138412546;
      id v22 = v5;
      __int16 v23 = 2112;
      id v24 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Unable to check for item in library: identifiers = %@, kind = %@",  buf,  0x16u);
    }
  }

  BOOL v12 = *((_BYTE *)v18 + 24) != 0;
  _Block_object_dispose(&v17, 8);

  return v12;
}

- (BOOL)_isAlbumInLibrary:(id)a3 storeSongArray:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v31 = 0LL;
  id v32 = &v31;
  uint64_t v33 = 0x2020000000LL;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](&OBJC_CLASS___NSMutableArray, "arrayWithCapacity:", 20LL));
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  id v9 = v7;
  id v10 = [v9 countByEnumeratingWithState:&v27 objects:v34 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v28;
    do
    {
      for (i = 0LL; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v28 != v11) {
          objc_enumerationMutation(v9);
        }
        id v13 = (void *)objc_claimAutoreleasedReturnValue( -[TVMusicJSObject _storeObjectFromPlatformDictionary:getProperties:]( self,  "_storeObjectFromPlatformDictionary:getProperties:",  *(void *)(*((void *)&v27 + 1) + 8LL * (void)i),  0LL));
        if ([v13 itemType] == (id)7)
        {
          id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 song]);
          BOOL v15 = v14 == 0LL;

          if (!v15)
          {
            id v16 = (void *)objc_claimAutoreleasedReturnValue([v13 song]);
            [v8 addObject:v16];
          }
        }
      }

      id v10 = [v9 countByEnumeratingWithState:&v27 objects:v34 count:16];
    }

    while (v10);
  }

  uint64_t v17 = dispatch_group_create();
  dispatch_group_enter(v17);
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472LL;
  v24[2] = sub_100091A98;
  v24[3] = &unk_10026C6D0;
  id v26 = &v31;
  uint64_t v18 = v17;
  id v25 = v18;
  +[TVMusicJSObject checkAlbumInLibrary:songs:completionHandler:]( &OBJC_CLASS___TVMusicJSObject,  "checkAlbumInLibrary:songs:completionHandler:",  v6,  v8,  v24);
  dispatch_time_t v19 = dispatch_time(0LL, 5000000000LL);
  if (dispatch_group_wait(v18, v19))
  {
    char v20 = (os_log_s *)off_1002B6938;
    if (os_log_type_enabled((os_log_t)off_1002B6938, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)__int16 v23 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "Timed out checking for album in library",  v23,  2u);
    }
  }

  BOOL v21 = *((_BYTE *)v32 + 24) != 0;

  _Block_object_dispose(&v31, 8);
  return v21;
}

- (void)_getLibraryInfoForStoreDictionary:(id)a3 genericObject:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ((_os_feature_enabled_impl("MediaPlayer", "Favoriting") & 1) != 0)
  {
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v9 anyObject]);

    if (v11)
    {
      -[TVMusicJSObject _getLibraryInfoForGenericObject:completionHandler:]( self,  "_getLibraryInfoForGenericObject:completionHandler:",  v9,  v10);
    }

    else
    {
      BOOL v15 = (os_log_s *)off_1002B6938;
      if (os_log_type_enabled((os_log_t)off_1002B6938, OS_LOG_TYPE_DEFAULT))
      {
        int v16 = 138412290;
        id v17 = v8;
        _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "Unable to check library info for item: %@",  (uint8_t *)&v16,  0xCu);
      }

      (*((void (**)(id, void, void))v10 + 2))(v10, 0LL, 0LL);
    }
  }

  else
  {
    BOOL v12 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:@"isInLibrary"]);
    if (v12)
    {
      id v13 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:@"isInLibrary"]);
      id v14 = [v13 BOOLValue];
    }

    else
    {
      id v14 = (id)-[TVMusicJSObject isStoreItemInLibrary:](self, "isStoreItemInLibrary:", v8);
    }

    (*((void (**)(id, id, void))v10 + 2))(v10, v14, 0LL);
  }
}

- (void)_getLibraryInfoForGenericObject:(id)a3 completionHandler:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 identifiers]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 modelKind]);
  switch((unint64_t)[v5 type])
  {
    case 1uLL:
      id v9 = (void *)objc_claimAutoreleasedReturnValue([v5 song]);
      id v10 = objc_alloc_init(&OBJC_CLASS___MPModelLibraryRequest);
      -[MPModelLibraryRequest setItemKind:](v10, "setItemKind:", v8);
      id v36 = v7;
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v36, 1LL));
      -[MPModelLibraryRequest setAllowedItemIdentifiers:](v10, "setAllowedItemIdentifiers:", v11);

      v35[0] = MPModelPropertySongIsDisliked;
      v35[1] = MPModelPropertySongIsFavorite;
      void v35[2] = MPModelPropertySongLibraryAdded;
      BOOL v12 = v35;
      goto LABEL_7;
    case 2uLL:
      id v9 = (void *)objc_claimAutoreleasedReturnValue([v5 album]);
      id v10 = objc_alloc_init(&OBJC_CLASS___MPModelLibraryRequest);
      -[MPModelLibraryRequest setItemKind:](v10, "setItemKind:", v8);
      id v34 = v7;
      id v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v34, 1LL));
      -[MPModelLibraryRequest setAllowedItemIdentifiers:](v10, "setAllowedItemIdentifiers:", v13);

      v33[0] = MPModelPropertyAlbumIsDisliked;
      v33[1] = MPModelPropertyAlbumIsFavorite;
      v33[2] = MPModelPropertyAlbumLibraryAdded;
      BOOL v12 = v33;
      goto LABEL_7;
    case 3uLL:
      id v9 = (void *)objc_claimAutoreleasedReturnValue([v5 artist]);
      id v10 = objc_alloc_init(&OBJC_CLASS___MPModelLibraryRequest);
      -[MPModelLibraryRequest setItemKind:](v10, "setItemKind:", v8);
      __int128 v30 = v7;
      id v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v30, 1LL));
      -[MPModelLibraryRequest setAllowedItemIdentifiers:](v10, "setAllowedItemIdentifiers:", v14);

      v29[0] = MPModelPropertyArtistIsDisliked;
      v29[1] = MPModelPropertyArtistIsFavorite;
      BOOL v12 = v29;
      uint64_t v15 = 2LL;
      goto LABEL_8;
    case 4uLL:
      id v9 = (void *)objc_claimAutoreleasedReturnValue([v5 playlist]);
      id v10 = objc_alloc_init(&OBJC_CLASS___MPModelLibraryRequest);
      -[MPModelLibraryRequest setItemKind:](v10, "setItemKind:", v8);
      id v32 = v7;
      int v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v32, 1LL));
      -[MPModelLibraryRequest setAllowedItemIdentifiers:](v10, "setAllowedItemIdentifiers:", v16);

      v31[0] = MPModelPropertyPlaylistIsDisliked;
      v31[1] = MPModelPropertyPlaylistIsFavorite;
      v31[2] = MPModelPropertyPlaylistLibraryAdded;
      BOOL v12 = v31;
LABEL_7:
      uint64_t v15 = 3LL;
LABEL_8:
      id v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v12, v15));
      uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue( +[MPPropertySet propertySetWithProperties:]( &OBJC_CLASS___MPPropertySet,  "propertySetWithProperties:",  v17));
      -[MPModelLibraryRequest setItemProperties:](v10, "setItemProperties:", v18);

      if (!v9 || !v10) {
        goto LABEL_11;
      }
      id v19 = [[MPStoreLibraryPersonalizationContentDescriptor alloc] initWithModel:v9 personalizationStyle:2];
      id v20 = objc_alloc_init(&OBJC_CLASS___MPMutableSectionedCollection);
      [v20 appendSection:&stru_100279068];
      [v20 appendItem:v19];
      id v21 = [[MPStoreLibraryPersonalizationRequest alloc] initWithUnpersonalizedRequest:v10 unpersonalizedContentDescriptors:v20];
      v23[0] = _NSConcreteStackBlock;
      v23[1] = 3221225472LL;
      v23[2] = sub_1000920F8;
      v23[3] = &unk_100268C60;
      id v24 = v7;
      id v25 = v8;
      id v26 = v6;
      [v21 performWithResponseHandler:v23];

      break;
    default:
      id v10 = 0LL;
      id v9 = 0LL;
LABEL_11:
      id v22 = (os_log_s *)off_1002B6938;
      if (os_log_type_enabled((os_log_t)off_1002B6938, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)__int128 buf = 138412290;
        __int128 v28 = v9;
        _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "Can't get library info for item: %@",  buf,  0xCu);
      }

      (*((void (**)(id, void, void))v6 + 2))(v6, 0LL, 0LL);
      break;
  }
}

+ (id)_getRecommendationDataFromOptions:(id)a3
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "tvs_dictionaryForKey:", @"playbackReporting"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "tvs_stringForKey:", @"recommendationData"));
  if ([v4 length]) {
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 dataUsingEncoding:4]);
  }
  else {
    id v5 = 0LL;
  }

  return v5;
}

- (id)_getPlaybackContainerFromOptions:(id)a3
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "tvs_dictionaryForKey:", @"playbackReporting"));
  id v4 = v3;
  if (v3)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "tvs_stringForKey:", @"containerType"));
    id v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "tvs_stringForKey:", @"containerID"));
  }

  else
  {
    id v6 = 0LL;
    id v5 = 0LL;
  }

  if (![v6 length] || !objc_msgSend(v5, "length")) {
    goto LABEL_13;
  }
  if (![v5 isEqualToString:@"album"])
  {
    if ([v5 isEqualToString:@"playlist"])
    {
      id v7 = (void *)objc_claimAutoreleasedReturnValue( +[MPIdentifierSet tvm_identifierSetForPlaylistWithGlobalID:]( &OBJC_CLASS___MPIdentifierSet,  "tvm_identifierSetForPlaylistWithGlobalID:",  v6));
      id v8 = objc_alloc(&OBJC_CLASS___MPModelPlaylist);
      id v9 = &stru_10026C740;
      goto LABEL_12;
    }

    if ([v5 isEqualToString:@"movie"])
    {
      id v10 = (void *)objc_claimAutoreleasedReturnValue(+[MPModelMovieKind identityKind](&OBJC_CLASS___MPModelMovieKind, "identityKind"));
      id v7 = (void *)objc_claimAutoreleasedReturnValue( +[MPIdentifierSet tvm_identifierSetForModelKind:withStoreID:subscriptionID:]( MPIdentifierSet,  "tvm_identifierSetForModelKind:withStoreID:subscriptionID:",  v10,  [v6 longLongValue],  0));

      id v8 = objc_alloc(&OBJC_CLASS___MPModelMovie);
      id v9 = &stru_10026C760;
      goto LABEL_12;
    }

- (id)_modelKindForGenericObjectType:(int64_t)a3
{
  BOOL v3 = 0LL;
  switch(a3)
  {
    case 1LL:
      id v4 = &OBJC_CLASS___MPModelSong;
      uint64_t v5 = 1LL;
      goto LABEL_10;
    case 2LL:
      id v6 = (void *)objc_claimAutoreleasedReturnValue(+[MPModelSong kindWithVariants:](&OBJC_CLASS___MPModelSong, "kindWithVariants:", 3LL));
      uint64_t v7 = objc_claimAutoreleasedReturnValue(+[MPModelAlbum kindWithSongKind:](&OBJC_CLASS___MPModelAlbum, "kindWithSongKind:", v6));
      goto LABEL_6;
    case 3LL:
      id v6 = (void *)objc_claimAutoreleasedReturnValue( -[TVMusicJSObject _modelKindForItemTypeString:]( self,  "_modelKindForItemTypeString:",  @"album"));
      uint64_t v7 = objc_claimAutoreleasedReturnValue(+[MPModelArtist kindWithAlbumKind:](&OBJC_CLASS___MPModelArtist, "kindWithAlbumKind:", v6));
      goto LABEL_6;
    case 4LL:
      id v6 = (void *)objc_claimAutoreleasedReturnValue( +[TVMusicMPLibraryRequestFactory playlistsLibraryRequestWithParentPlaylistFolder:userEditableOnly:allowEmptyPlaylists:]( &OBJC_CLASS___TVMusicMPLibraryRequestFactory,  "playlistsLibraryRequestWithParentPlaylistFolder:userEditableOnly:allowEmptyPlaylists:",  0LL,  0LL,  1LL));
      uint64_t v7 = objc_claimAutoreleasedReturnValue([v6 itemKind]);
LABEL_6:
      BOOL v3 = (void *)v7;

      return v3;
    case 6LL:
      id v4 = &OBJC_CLASS___MPModelTVEpisode;
      goto LABEL_9;
    case 9LL:
      id v4 = &OBJC_CLASS___MPModelMovie;
LABEL_9:
      uint64_t v5 = 2LL;
LABEL_10:
      BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[objc_class kindWithVariants:](v4, "kindWithVariants:", v5));
      break;
    default:
      return v3;
  }

  return v3;
}

- (id)_modelKindForItemTypeString:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"album"])
  {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[MPModelSong kindWithVariants:](&OBJC_CLASS___MPModelSong, "kindWithVariants:", 3LL));
    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[MPModelAlbum kindWithSongKind:](&OBJC_CLASS___MPModelAlbum, "kindWithSongKind:", v5));
  }

  else
  {
    id v6 = 0LL;
  }

  if ([v4 isEqualToString:@"artist"])
  {
    uint64_t v7 = objc_claimAutoreleasedReturnValue(-[TVMusicJSObject _modelKindForItemTypeString:](self, "_modelKindForItemTypeString:", @"album"));
    uint64_t v8 = objc_claimAutoreleasedReturnValue(+[MPModelArtist kindWithAlbumKind:](&OBJC_CLASS___MPModelArtist, "kindWithAlbumKind:", v7));

    id v6 = (void *)v7;
LABEL_18:

    id v6 = (void *)v8;
    goto LABEL_19;
  }

  if ([v4 isEqualToString:@"playlist"])
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue( +[TVMusicMPLibraryRequestFactory playlistsLibraryRequestWithParentPlaylistFolder:userEditableOnly:allowEmptyPlaylists:]( &OBJC_CLASS___TVMusicMPLibraryRequestFactory,  "playlistsLibraryRequestWithParentPlaylistFolder:userEditableOnly:allowEmptyPlaylists:",  0LL,  0LL,  1LL));
    uint64_t v8 = objc_claimAutoreleasedReturnValue([v9 itemKind]);

    id v6 = v9;
    goto LABEL_18;
  }

  if ([v4 isEqualToString:@"song"])
  {
    id v10 = &OBJC_CLASS___MPModelSong;
    uint64_t v11 = 1LL;
LABEL_17:
    uint64_t v8 = objc_claimAutoreleasedReturnValue(-[objc_class kindWithVariants:](v10, "kindWithVariants:", v11));
    goto LABEL_18;
  }

  if ([v4 isEqualToString:@"musicVideo"])
  {
    id v10 = &OBJC_CLASS___MPModelSong;
LABEL_16:
    uint64_t v11 = 2LL;
    goto LABEL_17;
  }

  if ([v4 isEqualToString:@"tvEpisode"])
  {
    id v10 = &OBJC_CLASS___MPModelTVEpisode;
    goto LABEL_16;
  }

  if ([v4 isEqualToString:@"movie"])
  {
    id v10 = &OBJC_CLASS___MPModelMovie;
    goto LABEL_16;
  }

- (id)_favoritingPropertiesForMPModelKind:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 identityKind]);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[MPModelSongKind identityKind](&OBJC_CLASS___MPModelSongKind, "identityKind"));

  if (v4 == v5)
  {
    uint64_t v25 = MPModelPropertySongLibraryAdded;
    uint64_t v26 = MPModelPropertySongIsFavorite;
    uint64_t v27 = MPModelPropertySongIsDisliked;
    id v13 = &v25;
LABEL_9:
    uint64_t v14 = 3LL;
LABEL_10:
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  v13,  v14,  v17,  v18,  v19,  v20,  v21,  v22,  v23,  v24,  v25,  v26,  v27));
    BOOL v12 = (void *)objc_claimAutoreleasedReturnValue( +[MPPropertySet propertySetWithProperties:]( &OBJC_CLASS___MPPropertySet,  "propertySetWithProperties:",  v15));

    goto LABEL_11;
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue([v3 identityKind]);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[MPModelAlbumKind identityKind](&OBJC_CLASS___MPModelAlbumKind, "identityKind"));

  if (v6 == v7)
  {
    uint64_t v22 = MPModelPropertyAlbumLibraryAdded;
    uint64_t v23 = MPModelPropertyAlbumIsFavorite;
    uint64_t v24 = MPModelPropertyAlbumIsDisliked;
    id v13 = &v22;
    goto LABEL_9;
  }

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v3 identityKind]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[MPModelPlaylistKind identityKind](&OBJC_CLASS___MPModelPlaylistKind, "identityKind"));

  if (v8 == v9)
  {
    uint64_t v19 = MPModelPropertyPlaylistLibraryAdded;
    uint64_t v20 = MPModelPropertyPlaylistIsFavorite;
    uint64_t v21 = MPModelPropertyPlaylistIsDisliked;
    id v13 = &v19;
    goto LABEL_9;
  }

  id v10 = (void *)objc_claimAutoreleasedReturnValue([v3 identityKind]);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[MPModelArtistKind identityKind](&OBJC_CLASS___MPModelArtistKind, "identityKind"));

  if (v10 == v11)
  {
    uint64_t v17 = MPModelPropertyArtistIsFavorite;
    uint64_t v18 = MPModelPropertyArtistIsDisliked;
    id v13 = &v17;
    uint64_t v14 = 2LL;
    goto LABEL_10;
  }

  BOOL v12 = 0LL;
LABEL_11:

  return v12;
}

- (id)_prepareCallback:(id)a3
{
  id v4 = a3;
  if ([v4 isObject])
  {
    uint64_t v5 = qword_1002BE9D0++;
    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%p-%ld", v4, v5));
    -[TVMusicJSObject setJSValue:forProperty:](self, "setJSValue:forProperty:", v4, v6);
  }

  else
  {
    id v6 = 0LL;
  }

  return v6;
}

- (void)_jsCallbackWithIdentifier:(id)a3 args:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    objc_initWeak(&location, self);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicJSObject appContext](self, "appContext"));
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_100092B5C;
    v9[3] = &unk_10026C680;
    objc_copyWeak(&v12, &location);
    id v10 = v6;
    id v11 = v7;
    [v8 evaluate:v9 completionBlock:0];

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
}

- (BOOL)isMusicLibrarySynced
{
  return self->_isMusicLibrarySynced;
}

- (void)setIsMusicLibrarySynced:(BOOL)a3
{
  self->_isMusicLibrarySynced = a3;
}

- (TVMusicLibraryManager)libraryManager
{
  return self->_libraryManager;
}

- (void)setLibraryManager:(id)a3
{
}

- (TVMusicJSBag)bag
{
  return self->_bag;
}

- (void)setBag:(id)a3
{
}

- (void).cxx_destruct
{
}

+ (void)initialize
{
  os_log_t v2 = os_log_create("com.apple.TVMusic", "TVMusicJSObjectHelper");
  id v3 = (void *)qword_1002BEB88;
  qword_1002BEB88 = (uint64_t)v2;
}

+ (void)queryMusicLibraryForPlaylistWithCloudGlobalID:(id)a3 completionHandler:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[TVMusicLibraryManager sharedInstance](&OBJC_CLASS___TVMusicLibraryManager, "sharedInstance"));
  id v8 = [v7 state];

  if (v8 == (id)3)
  {
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_1000AFC4C;
    v11[3] = &unk_10026D6D0;
    id v12 = v6;
    +[TVMusicLibraryUtilities findPlaylistWithCloudGlobalID:completionHandler:]( &OBJC_CLASS___TVMusicLibraryUtilities,  "findPlaylistWithCloudGlobalID:completionHandler:",  v5,  v11);
    id v9 = v12;
  }

  else
  {
    id v10 = (os_log_s *)qword_1002BEB88;
    if (os_log_type_enabled((os_log_t)qword_1002BEB88, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)__int128 buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Can't perform query; cloud data client is not connected and synced.",
        buf,
        2u);
    }

    uint64_t v14 = @"success";
    uint64_t v15 = &__kCFBooleanFalse;
    id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v15,  &v14,  1LL));
    (*((void (**)(id, void *))v6 + 2))(v6, v9);
  }
}

+ (void)removePlaylistFromMusicLibraryWithGlobalID:(id)a3 completionHandler:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 length])
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_1000AFF08;
    v7[3] = &unk_10026D6D0;
    id v8 = v6;
    +[TVMusicLibraryUtilities findPlaylistWithCloudGlobalID:completionHandler:]( &OBJC_CLASS___TVMusicLibraryUtilities,  "findPlaylistWithCloudGlobalID:completionHandler:",  v5,  v7);
  }

  else
  {
    (*((void (**)(id, void))v6 + 2))(v6, 0LL);
  }
}

+ (void)queryMediaLibrary:(id)a3 maxItems:(int64_t)a4 searchTerm:(id)a5 options:(id)a6 completionHandler:(id)a7
{
  id v11 = a3;
  id v37 = a5;
  id v36 = a7;
  id v35 = (void *)objc_claimAutoreleasedReturnValue([a6 objectForKeyedSubscript:@"properties"]);
  unsigned __int8 v33 = [v35 containsObject:@"artworkAspect"];
  id v12 = objc_alloc_init(&OBJC_CLASS___MPModelLibrarySearchRequest);
  id v13 = v12;
  if (a4 >= 1) {
    [v12 setMaximumResultsPerScope:a4];
  }
  id v34 = v13;
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v11 count]));
  __int128 v42 = 0u;
  __int128 v43 = 0u;
  __int128 v44 = 0u;
  __int128 v45 = 0u;
  id obj = v11;
  id v15 = [obj countByEnumeratingWithState:&v42 objects:v49 count:16];
  if (v15)
  {
    id v16 = v15;
    uint64_t v17 = *(void *)v43;
    do
    {
      uint64_t v18 = 0LL;
      do
      {
        if (*(void *)v43 != v17) {
          objc_enumerationMutation(obj);
        }
        id v19 = *(id *)(*((void *)&v42 + 1) + 8LL * (void)v18);
        if ([v19 isEqualToString:@"songsAndMusicVideos"])
        {
          uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue( +[TVMusicMPLibraryRequestFactory songsLibraryRequest]( &OBJC_CLASS___TVMusicMPLibraryRequestFactory,  "songsLibraryRequest"));
          uint64_t v21 = 3LL;
          goto LABEL_12;
        }

        if ([v19 isEqualToString:@"song"])
        {
          uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue( +[TVMusicMPLibraryRequestFactory songsLibraryRequest]( &OBJC_CLASS___TVMusicMPLibraryRequestFactory,  "songsLibraryRequest"));
          uint64_t v21 = 1LL;
LABEL_12:
          uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(+[MPModelSong kindWithVariants:](&OBJC_CLASS___MPModelSong, "kindWithVariants:", v21));
          if (!v20) {
            goto LABEL_34;
          }
          goto LABEL_31;
        }

        if ([v19 isEqualToString:@"musicVideo"])
        {
          uint64_t v23 = objc_claimAutoreleasedReturnValue( +[TVMusicMPLibraryRequestFactory musicVideosLibraryRequest]( &OBJC_CLASS___TVMusicMPLibraryRequestFactory,  "musicVideosLibraryRequest"));
        }

        else if ([v19 isEqualToString:@"album"])
        {
          uint64_t v23 = objc_claimAutoreleasedReturnValue( +[TVMusicMPLibraryRequestFactory albumsLibraryRequest]( &OBJC_CLASS___TVMusicMPLibraryRequestFactory,  "albumsLibraryRequest"));
        }

        else if ([v19 isEqualToString:@"playlist"])
        {
          uint64_t v23 = objc_claimAutoreleasedReturnValue( +[TVMusicMPLibraryRequestFactory playlistsLibraryRequestWithParentPlaylistFolder:]( &OBJC_CLASS___TVMusicMPLibraryRequestFactory,  "playlistsLibraryRequestWithParentPlaylistFolder:",  0LL));
        }

        else if ([v19 isEqualToString:@"artist"])
        {
          uint64_t v23 = objc_claimAutoreleasedReturnValue( +[TVMusicMPLibraryRequestFactory artistsLibraryRequest]( &OBJC_CLASS___TVMusicMPLibraryRequestFactory,  "artistsLibraryRequest"));
        }

        else if ([v19 isEqualToString:@"tvEpisode"])
        {
          uint64_t v23 = objc_claimAutoreleasedReturnValue( +[TVMusicMPLibraryRequestFactory TVEpisodesLibraryRequestForShow:season:]( &OBJC_CLASS___TVMusicMPLibraryRequestFactory,  "TVEpisodesLibraryRequestForShow:season:",  0LL,  0LL));
        }

        else if ([v19 isEqualToString:@"movie"])
        {
          uint64_t v23 = objc_claimAutoreleasedReturnValue( +[TVMusicMPLibraryRequestFactory moviesLibraryRequest]( &OBJC_CLASS___TVMusicMPLibraryRequestFactory,  "moviesLibraryRequest"));
        }

        else if ([v19 isEqualToString:@"tvShow"])
        {
          uint64_t v23 = objc_claimAutoreleasedReturnValue( +[TVMusicMPLibraryRequestFactory TVShowsLibraryRequest]( &OBJC_CLASS___TVMusicMPLibraryRequestFactory,  "TVShowsLibraryRequest"));
        }

        else
        {
          if (![v19 isEqualToString:@"composer"])
          {
            uint64_t v22 = 0LL;
            goto LABEL_34;
          }

          uint64_t v23 = objc_claimAutoreleasedReturnValue( +[TVMusicMPLibraryRequestFactory composersLibraryRequest]( &OBJC_CLASS___TVMusicMPLibraryRequestFactory,  "composersLibraryRequest"));
        }

        uint64_t v20 = (void *)v23;
        uint64_t v22 = 0LL;
        if (!v23) {
          goto LABEL_34;
        }
LABEL_31:
        if (!v22) {
          uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v20 itemKind]);
        }
        id v24 = objc_alloc(&OBJC_CLASS___MPModelLibrarySearchScope);
        uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue([v20 itemProperties]);
        id v26 = [v24 initWithItemKind:v22 name:v19 properties:v25];

        [v14 addObject:v26];
LABEL_34:

        uint64_t v18 = (char *)v18 + 1;
      }

      while (v16 != v18);
      id v27 = [obj countByEnumeratingWithState:&v42 objects:v49 count:16];
      id v16 = v27;
    }

    while (v27);
  }

  if ([v14 count])
  {
    __int128 v28 = v34;
    [v34 setScopes:v14];
    __int128 v29 = v37;
    [v34 setSearchString:v37];
    v39[0] = _NSConcreteStackBlock;
    v39[1] = 3221225472LL;
    v39[2] = sub_1000B04E4;
    v39[3] = &unk_10026D770;
    unsigned __int8 v41 = v33;
    __int128 v30 = v36;
    id v40 = v36;
    [v34 performWithResponseHandler:v39];
    uint64_t v31 = v40;
  }

  else
  {
    uint64_t v47 = @"success";
    id v48 = &__kCFBooleanFalse;
    uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v48,  &v47,  1LL));
    v46 = v31;
    id v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v46, 1LL));
    __int128 v30 = v36;
    (*((void (**)(id, void *))v36 + 2))(v36, v32);

    __int128 v29 = v37;
    __int128 v28 = v34;
  }
}

+ (id)clientDataForItemType:(id)a3 persistentID:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithCapacity:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithCapacity:",  3LL));
  [v7 setObject:v6 forKeyedSubscript:@"ClientDataId"];
  [v7 setObject:v5 forKeyedSubscript:@"ClientDataKind"];
  id v15 = v5;
  id v16 = v6;
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v16,  &v15,  1LL));
  [v7 setObject:v8 forKeyedSubscript:@"ClientDataMPArtwork"];

  id v9 = [v7 copy];
  uint64_t v14 = 0LL;
  id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSJSONSerialization dataWithJSONObject:options:error:]( &OBJC_CLASS___NSJSONSerialization,  "dataWithJSONObject:options:error:",  v9,  0LL,  &v14));
  uint64_t v11 = v14;

  id v12 = 0LL;
  if (!v11 && v10) {
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v10 base64EncodedStringWithOptions:0]);
  }

  return v12;
}

+ (id)clientDataForSongPID:(id)a3 containerPID:(id)a4 songIndex:(int64_t)a5
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v20 = @"ClientDataMPArtwork";
  v18[0] = @"song";
  v18[1] = @"containerID";
  v19[0] = v7;
  v19[1] = v8;
  v18[2] = @"songIndex";
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a5));
  void v19[2] = v9;
  id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v19,  v18,  3LL));
  uint64_t v21 = v10;
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v21,  &v20,  1LL));

  id v12 = [v11 copy];
  uint64_t v17 = 0LL;
  id v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSJSONSerialization dataWithJSONObject:options:error:]( &OBJC_CLASS___NSJSONSerialization,  "dataWithJSONObject:options:error:",  v12,  0LL,  &v17));
  uint64_t v14 = v17;

  id v15 = 0LL;
  if (!v14 && v13) {
    id v15 = (void *)objc_claimAutoreleasedReturnValue([v13 base64EncodedStringWithOptions:0]);
  }

  return v15;
}

+ (void)querySongsForAlbumWithPersistentID:(id)a3 range:(_NSRange)a4 completionHandler:(id)a5
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v8 = a3;
  id v9 = a5;
  if ([v8 longLongValue])
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue( +[TVMusicCachedLibraryRequest sharedInstance]( &OBJC_CLASS___TVMusicCachedLibraryRequest,  "sharedInstance"));
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_1000B150C;
    v11[3] = &unk_10026D7E8;
    id v12 = v8;
    NSUInteger v14 = location;
    NSUInteger v15 = length;
    id v13 = v9;
    [v10 getResponseForIdentifier:v12 completion:v11];
  }

  else
  {
    (*((void (**)(id, void))v9 + 2))(v9, 0LL);
  }
}

+ (void)querySongsForPlaylistWithPersistentID:(id)a3 range:(_NSRange)a4 completionHandler:(id)a5
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v8 = a3;
  id v9 = a5;
  id v10 = (void *)objc_claimAutoreleasedReturnValue( +[TVMusicCachedLibraryRequest sharedInstance]( &OBJC_CLASS___TVMusicCachedLibraryRequest,  "sharedInstance"));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_1000B19F4;
  v13[3] = &unk_10026D7E8;
  NSUInteger v16 = location;
  NSUInteger v17 = length;
  id v14 = v8;
  id v15 = v9;
  id v11 = v9;
  id v12 = v8;
  [v10 getResponseForIdentifier:v12 completion:v13];
}

+ (id)_dictionaryForSong:(id)a3 inAlbum:(id)a4 index:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithCapacity:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithCapacity:",  10LL));
  [a1 _addSongData:v8 toDictionary:v10 index:a5];
  [a1 _addClassicalSongData:v8 toDictionary:v10];
  if (v9)
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v8 identifiers]);
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v9 songPopularityForIdentifiers:v11]);

    if (v12)
    {
      id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 stringValue]);
      [v10 setObject:v13 forKeyedSubscript:@"popularity"];
    }
  }

  id v14 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:@"persistentID"]);
  id v15 = (void *)objc_claimAutoreleasedReturnValue([a1 clientDataForItemType:@"song" persistentID:v14]);
  [v10 setObject:v15 forKeyedSubscript:@"artworkClientData"];

  return v10;
}

+ (id)_dictionaryForPlaylistEntry:(id)a3 playlistPID:(id)a4 index:(int64_t)a5
{
  id v8 = a4;
  id v9 = a3;
  id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithCapacity:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithCapacity:",  10LL));
  [a1 _addPlaylistEntryData:v9 toDictionary:v10 index:a5];

  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:@"persistentID"]);
  id v12 = (void *)objc_claimAutoreleasedReturnValue([a1 clientDataForSongPID:v11 containerPID:v8 songIndex:a5]);

  [v10 setObject:v12 forKeyedSubscript:@"artworkClientData"];
  return v10;
}

+ (void)_addPlaylistEntryData:(id)a3 toDictionary:(id)a4 index:(int64_t)a5
{
  id v8 = a4;
  id v9 = a3;
  id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [v9 position]));
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 stringValue]);
  [v8 setObject:v11 forKeyedSubscript:@"playlistPosition"];

  id v12 = (void *)objc_claimAutoreleasedReturnValue([v9 identifiers]);
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 library]);
  id v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithLongLong:]( NSNumber,  "numberWithLongLong:",  [v13 persistentID]));
  id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 stringValue]);
  [v8 setObject:v15 forKeyedSubscript:@"playlistEntryPersistentID"];

  id v16 = (id)objc_claimAutoreleasedReturnValue([v9 song]);
  [a1 _addSongData:v16 toDictionary:v8 index:a5];
}

+ (void)_addSongData:(id)a3 toDictionary:(id)a4 index:(int64_t)a5
{
  id v36 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v36 identifiers]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 library]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithLongLong:]( NSNumber,  "numberWithLongLong:",  [v9 persistentID]));
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 stringValue]);

  unsigned int v12 = [v36 hasVideo];
  id v13 = &off_10026C780;
  if (!v12) {
    id v13 = off_10026C618;
  }
  [v7 setObject:*v13 forKeyedSubscript:@"kind"];
  id v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "tvm_dictionaryRepresentation"));
  [v7 setObject:v14 forKeyedSubscript:@"ids"];

  id v15 = (void *)objc_claimAutoreleasedReturnValue([v36 title]);
  [v7 setObject:v15 forKeyedSubscript:@"name"];

  id v16 = (void *)objc_claimAutoreleasedReturnValue([v36 album]);
  NSUInteger v17 = (void *)objc_claimAutoreleasedReturnValue([v16 title]);
  [v7 setObject:v17 forKeyedSubscript:@"collectionName"];

  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v36 artist]);
  id v19 = (void *)objc_claimAutoreleasedReturnValue([v18 name]);
  [v7 setObject:v19 forKeyedSubscript:@"artistName"];

  [v7 setObject:v11 forKeyedSubscript:@"persistentID"];
  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [v36 trackNumber]));
  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v20 stringValue]);
  [v7 setObject:v21 forKeyedSubscript:@"trackNumber"];

  uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a5));
  uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([v22 stringValue]);
  [v7 setObject:v23 forKeyedSubscript:@"index"];

  [v36 duration];
  id v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
  [v7 setObject:v24 forKeyedSubscript:@"duration"];

  uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSValueTransformer valueTransformerForName:]( &OBJC_CLASS___NSValueTransformer,  "valueTransformerForName:",  @"TVDurationValueTransformer"));
  [v36 duration];
  id v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
  id v27 = (void *)objc_claimAutoreleasedReturnValue([v25 transformedValue:v26]);

  [v7 setObject:v27 forKeyedSubscript:@"formattedDuration"];
  __int128 v28 = (void *)objc_claimAutoreleasedReturnValue([v36 composer]);
  __int128 v29 = (void *)objc_claimAutoreleasedReturnValue([v28 name]);
  [v7 setObject:v29 forKeyedSubscript:@"composer"];

  __int128 v30 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v36 isFavorite]));
  [v7 setObject:v30 forKeyedSubscript:@"isFavorite"];

  uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v36 isDisliked]));
  [v7 setObject:v31 forKeyedSubscript:@"isDisliked"];

  id v32 = (void *)objc_claimAutoreleasedReturnValue([v36 storeAsset]);
  if (v32)
  {
    __int128 v29 = (void *)objc_claimAutoreleasedReturnValue([v36 storeAsset]);
    uint64_t v33 = (uint64_t)[v29 isRedownloadable];
  }

  else
  {
    uint64_t v33 = 1LL;
  }

  id v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v33));
  [v7 setObject:v34 forKeyedSubscript:@"isPlayable"];

  if (v32) {
  if ([v36 traits])
  }
  {
    id v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](&OBJC_CLASS___NSMutableArray, "arrayWithCapacity:", 4LL));
    [v7 setObject:v35 forKeyedSubscript:@"audioTraits"];
  }
}

+ (void)_addClassicalSongData:(id)a3 toDictionary:(id)a4
{
  id v13 = a3;
  id v5 = a4;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v13 classicalWork]);
  if (v6)
  {
  }

  else
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v13 classicalMovement]);

    if (!v7) {
      goto LABEL_5;
    }
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue([v13 classicalWork]);
  [v5 setObject:v8 forKeyedSubscript:@"classicalWork"];

  id v9 = (void *)objc_claimAutoreleasedReturnValue([v13 classicalMovement]);
  [v5 setObject:v9 forKeyedSubscript:@"classicalMovement"];

  id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [v13 classicalMovementCount]));
  [v5 setObject:v10 forKeyedSubscript:@"classicalMovementCount"];

  id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [v13 classicalMovementNumber]));
  [v5 setObject:v11 forKeyedSubscript:@"classicalMovementNumber"];

LABEL_5:
  unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue([v13 grouping]);
  [v5 setObject:v12 forKeyedSubscript:@"grouping"];
}

+ (id)songDictionariesForMPCollection:(id)a3 containerPID:(id)a4 album:(id)a5 inRange:(_NSRange)a6
{
  NSUInteger length = a6.length;
  NSUInteger location = a6.location;
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  uint64_t v14 = length;
  if (!length) {
    uint64_t v14 = (uint64_t)[v11 totalItemCount];
  }
  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472LL;
  v32[2] = sub_1000B2A2C;
  v32[3] = &unk_10026D838;
  id v15 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](&OBJC_CLASS___NSMutableArray, "arrayWithCapacity:", v14));
  id v33 = v15;
  id v36 = a1;
  id v25 = v12;
  id v34 = v25;
  id v27 = v13;
  id v35 = v27;
  id v16 = objc_retainBlock(v32);
  NSUInteger v17 = (void (**)(void, void, void))v16;
  if (length)
  {
    id v18 = objc_msgSend(v11, "numberOfItemsInSection:", 0, v25, v27);
    if (v14 + location > (unint64_t)v18)
    {
      id v19 = (os_log_s *)qword_1002BEB88;
      if (os_log_type_enabled((os_log_t)qword_1002BEB88, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)__int128 buf = 134218496;
        *(void *)&uint8_t buf[4] = location;
        *(_WORD *)&buf[12] = 2048;
        *(void *)&buf[14] = length;
        *(_WORD *)&buf[22] = 2048;
        id v38 = v18;
        _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "Range (%ld, %ld) out of bounds for track count %ld",  buf,  0x20u);
      }

      uint64_t v14 = (uint64_t)v18 - location;
    }

    if (v14 >= 1)
    {
      for (uint64_t i = 0LL; i < v14; ++i)
      {
        uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSIndexPath indexPathForRow:inSection:]( &OBJC_CLASS___NSIndexPath,  "indexPathForRow:inSection:",  location + i,  0LL));
        uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v11 itemAtIndexPath:v21]);

        ((void (**)(void, void *, NSUInteger))v17)[2](v17, v22, location + i);
      }
    }
  }

  else
  {
    *(void *)__int128 buf = 0LL;
    *(void *)&uint8_t buf[8] = buf;
    *(void *)&buf[16] = 0x2020000000LL;
    id v38 = 0LL;
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472LL;
    void v29[2] = sub_1000B2BE8;
    v29[3] = &unk_10026D860;
    __int128 v30 = v16;
    uint64_t v31 = buf;
    objc_msgSend(v11, "enumerateItemsUsingBlock:", v29, v25, v27);

    _Block_object_dispose(buf, 8);
  }

  id v23 = v15;

  return v23;
}

+ (void)findItemInLibraryWithType:(id)a3 cloudID:(id)a4 options:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if ([v11 length])
  {
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:@"useULID"]);
    if (v14)
    {
      id v15 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:@"useULID"]);
      LODWORD(v16) = [v15 BOOLValue];
    }

    else
    {
      LODWORD(v16) = +[MPIdentifierSet tvm_isIdentifierUniversalCloudLibraryID:]( &OBJC_CLASS___MPIdentifierSet,  "tvm_isIdentifierUniversalCloudLibraryID:",  v11);
    }

    id v18 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:@"personalized"]);
    if (v18)
    {
      id v19 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:@"personalized"]);
      unsigned int v20 = [v19 BOOLValue];
    }

    else
    {
      unsigned int v20 = 1;
    }

    if ([v10 isEqualToString:@"playlist"])
    {
      id v17 = (id)objc_claimAutoreleasedReturnValue( +[TVMusicMPLibraryRequestFactory playlistsLibraryRequestWithParentPlaylistFolder:]( &OBJC_CLASS___TVMusicMPLibraryRequestFactory,  "playlistsLibraryRequestWithParentPlaylistFolder:",  0LL));
      if ((_DWORD)v16)
      {
        uint64_t v21 = objc_claimAutoreleasedReturnValue( +[MPIdentifierSet tvm_identifierSetForPlaylistWithUniversalCloudLibraryID:]( &OBJC_CLASS___MPIdentifierSet,  "tvm_identifierSetForPlaylistWithUniversalCloudLibraryID:",  v11));
      }

      else if ([v11 longLongValue])
      {
        uint64_t v21 = objc_claimAutoreleasedReturnValue( +[MPIdentifierSet tvm_identifierSetForPlaylistWithCloudID:]( MPIdentifierSet,  "tvm_identifierSetForPlaylistWithCloudID:",  [v11 longLongValue]));
      }

      else
      {
        uint64_t v21 = objc_claimAutoreleasedReturnValue( +[MPIdentifierSet tvm_identifierSetForPlaylistWithGlobalID:]( &OBJC_CLASS___MPIdentifierSet,  "tvm_identifierSetForPlaylistWithGlobalID:",  v11));
      }

      id v24 = (void *)v21;
      id v26 = objc_alloc(&OBJC_CLASS___MPModelPlaylist);
      id v27 = &stru_10026D880;
    }

    else
    {
      if (![v10 isEqualToString:@"album"])
      {
        id v17 = 0LL;
        id v23 = 0LL;
        goto LABEL_27;
      }

      if ((v16 & 1) != 0)
      {
        uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue( +[MPIdentifierSet tvm_identifierSetForSongWithCloudAlbumID:]( &OBJC_CLASS___MPIdentifierSet,  "tvm_identifierSetForSongWithCloudAlbumID:",  v11));
        id v17 = (id)objc_claimAutoreleasedReturnValue([a1 _requestForSongWithIdentifiers:v22]);
        id v23 = -[MPModelSong initWithIdentifiers:block:]( objc_alloc(&OBJC_CLASS___MPModelSong),  "initWithIdentifiers:block:",  v22,  &stru_10026D8A0);

        if (v17 && v23) {
          goto LABEL_28;
        }
        goto LABEL_27;
      }

      id v17 = (id)objc_claimAutoreleasedReturnValue( +[TVMusicMPLibraryRequestFactory albumsLibraryRequest]( &OBJC_CLASS___TVMusicMPLibraryRequestFactory,  "albumsLibraryRequest"));
      id v24 = (void *)objc_claimAutoreleasedReturnValue( +[MPIdentifierSet tvm_identiferSetForAlbumWithCloudAlbumID:]( &OBJC_CLASS___MPIdentifierSet,  "tvm_identiferSetForAlbumWithCloudAlbumID:",  v11));
      id v40 = v24;
      id v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v40, 1LL));
      [v17 setAllowedItemIdentifiers:v25];

      id v26 = objc_alloc(&OBJC_CLASS___MPModelAlbum);
      id v27 = &stru_10026D8C0;
    }

    id v23 = -[MPModelPlaylist initWithIdentifiers:block:](v26, "initWithIdentifiers:block:", v24, v27);

    if (v17 && v23)
    {
      if (v20)
      {
        id v28 = [[MPStoreLibraryPersonalizationContentDescriptor alloc] initWithModel:v23 personalizationStyle:4];
        char v31 = (char)v16;
        id v16 = a1;
        id v29 = objc_alloc_init(&OBJC_CLASS___MPMutableSectionedCollection);
        [v29 appendSection:&stru_100279068];
        [v29 appendItem:v28];
        id v30 = [[MPStoreLibraryPersonalizationRequest alloc] initWithUnpersonalizedRequest:v17 unpersonalizedContentDescriptors:v29];

        a1 = v16;
        LOBYTE(v16) = v31;

LABEL_29:
        v32[0] = _NSConcreteStackBlock;
        v32[1] = 3221225472LL;
        v32[2] = sub_1000B30E4;
        v32[3] = &unk_10026D8E8;
        char v37 = (char)v16;
        id v33 = v10;
        id v36 = a1;
        id v34 = v11;
        id v35 = v13;
        [v30 performWithResponseHandler:v32];

        goto LABEL_30;
      }

+ (id)_resultForLibraryObject:(id)a3 itemType:(id)a4 requestedID:(id)a5 error:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  id v13 = a5;
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  if (v10)
  {
    if ((objc_opt_respondsToSelector(v10, "isLibraryAdded") & 1) != 0) {
      uint64_t v15 = (uint64_t)[v10 isLibraryAdded];
    }
    else {
      uint64_t v15 = 1LL;
    }
  }

  else
  {
    uint64_t v15 = 0LL;
  }

  id v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v12 == 0LL));
  [v14 setObject:v16 forKeyedSubscript:@"success"];

  id v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v15));
  [v14 setObject:v17 forKeyedSubscript:@"isInLibrary"];

  [v14 setObject:v11 forKeyedSubscript:@"kind"];
  [v14 setObject:v13 forKeyedSubscript:@"requestedID"];

  id v18 = (void *)objc_claimAutoreleasedReturnValue([v10 identifiers]);
  id v19 = (void *)objc_claimAutoreleasedReturnValue([v18 library]);
  id v20 = [v19 persistentID];

  if ((_DWORD)v15 && v20)
  {
    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", v20));
    uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v21 stringValue]);

    [v14 setObject:v22 forKeyedSubscript:@"persistentID"];
    id v23 = (void *)objc_claimAutoreleasedReturnValue([v10 identifiers]);
    id v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "tvm_dictionaryRepresentation"));
    [v14 setObject:v24 forKeyedSubscript:@"ids"];

    uint64_t v26 = objc_opt_class(&OBJC_CLASS___MPModelPlaylist, v25);
    if ((objc_opt_isKindOfClass(v10, v26) & 1) != 0)
    {
      id v28 = v10;
      id v29 = (void *)objc_claimAutoreleasedReturnValue([v28 name]);
      [v14 setObject:v29 forKeyedSubscript:@"name"];

      id v30 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v28 isSubscribed]));
      [v14 setObject:v30 forKeyedSubscript:@"isPlaylistSubscribed"];

      id v31 = [v28 isFavorite];
      id v32 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v31));
      [v14 setObject:v32 forKeyedSubscript:@"isFavorite"];
    }

    else
    {
      uint64_t v33 = objc_opt_class(&OBJC_CLASS___MPModelAlbum, v27);
      if ((objc_opt_isKindOfClass(v10, v33) & 1) == 0)
      {
LABEL_20:
        id v40 = (void *)objc_claimAutoreleasedReturnValue([a1 clientDataForItemType:v11 persistentID:v22]);
        [v14 setObject:v40 forKeyedSubscript:@"clientData"];

        goto LABEL_21;
      }

      id v32 = v10;
      id v34 = (void *)objc_claimAutoreleasedReturnValue([v32 title]);
      if (!v34)
      {
        if ([v32 trackCount] == (id)1)
        {
          id v34 = (void *)objc_claimAutoreleasedReturnValue([v32 representativeSong]);

          if (v34)
          {
            id v35 = (void *)objc_claimAutoreleasedReturnValue([v32 representativeSong]);
            id v34 = (void *)objc_claimAutoreleasedReturnValue([v35 title]);
          }
        }

        else
        {
          id v34 = 0LL;
        }
      }

      __int128 v42 = v34;
      [v14 setObject:v34 forKeyedSubscript:@"name"];
      id v36 = (void *)objc_claimAutoreleasedReturnValue([v32 artist]);
      id v37 = a1;
      id v38 = (void *)objc_claimAutoreleasedReturnValue([v36 name]);
      [v14 setObject:v38 forKeyedSubscript:@"artistName"];

      a1 = v37;
      uint64_t v39 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v32 isFavorite]));
      [v14 setObject:v39 forKeyedSubscript:@"isFavorite"];
    }

    goto LABEL_20;
  }

  if (v12)
  {
    uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue( +[TVMusicJSObject dictionaryFromNSError:]( &OBJC_CLASS___TVMusicJSObject,  "dictionaryFromNSError:",  v12));
    [v14 setObject:v22 forKeyedSubscript:@"error"];
LABEL_21:
  }

  return v14;
}

+ (id)_requestForSongWithIdentifiers:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(&OBJC_CLASS___MPModelLibraryRequest);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[MPModelSong kindWithVariants:](&OBJC_CLASS___MPModelSong, "kindWithVariants:", 3LL));
  -[MPModelLibraryRequest setItemKind:](v4, "setItemKind:", v5);

  id v26 = v3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v26, 1LL));
  -[MPModelLibraryRequest setAllowedItemIdentifiers:](v4, "setAllowedItemIdentifiers:", v6);

  id v18 = objc_alloc(&OBJC_CLASS___MPPropertySet);
  uint64_t v24 = MPModelRelationshipSongAlbum;
  id v7 = objc_alloc(&OBJC_CLASS___MPPropertySet);
  v23[0] = MPModelPropertyAlbumIsFavorite;
  v23[1] = MPModelPropertyAlbumLibraryAdded;
  v23[2] = MPModelPropertyAlbumTitle;
  v23[3] = MPModelPropertyAlbumTrackCount;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v23, 4LL));
  v21[0] = MPModelRelationshipAlbumArtist;
  uint64_t v20 = MPModelPropertyArtistName;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v20, 1LL));
  id v10 = (void *)objc_claimAutoreleasedReturnValue( +[MPPropertySet propertySetWithProperties:]( &OBJC_CLASS___MPPropertySet,  "propertySetWithProperties:",  v9));
  v22[0] = v10;
  v21[1] = MPModelRelationshipAlbumRepresentativeSong;
  uint64_t v19 = MPModelPropertySongTitle;
  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v19, 1LL));
  id v12 = (void *)objc_claimAutoreleasedReturnValue( +[MPPropertySet propertySetWithProperties:]( &OBJC_CLASS___MPPropertySet,  "propertySetWithProperties:",  v11));
  v22[1] = v12;
  id v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v22,  v21,  2LL));
  id v14 = [v7 initWithProperties:v8 relationships:v13];
  id v25 = v14;
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v25,  &v24,  1LL));

  id v16 = [v18 initWithProperties:&__NSArray0__struct relationships:v15];
  -[MPModelLibraryRequest setItemProperties:](v4, "setItemProperties:", v16);

  return v4;
}

+ (void)getURLForArtworkCatalog:(id)a3 mpObject:(id)a4 completionHandler:(id)a5
{
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_1000B399C;
  v10[3] = &unk_10026D938;
  id v11 = a4;
  id v12 = a5;
  id v8 = v11;
  id v9 = v12;
  [a1 _getURLForArtworkCatalog:a3 completionHandler:v10];
}

+ (void)_getURLForArtworkCatalog:(id)a3 completionHandler:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000B3BF8;
  v7[3] = &unk_10026D988;
  id v8 = a3;
  id v9 = a4;
  id v5 = v8;
  id v6 = v9;
  [v5 requestExportableArtworkPropertiesWithCompletion:v7];
}

+ (void)personalizeSong:(id)a3 withProperties:(id)a4 completionHandler:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = objc_alloc_init(&OBJC_CLASS___MPModelLibraryRequest);
  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[MPModelSong kindWithVariants:](&OBJC_CLASS___MPModelSong, "kindWithVariants:", 3LL));
  -[MPModelLibraryRequest setItemKind:](v10, "setItemKind:", v11);

  -[MPModelLibraryRequest setItemProperties:](v10, "setItemProperties:", v8);
  id v12 = [[MPStoreLibraryPersonalizationContentDescriptor alloc] initWithModel:v9 personalizationStyle:4];

  id v13 = objc_alloc_init(&OBJC_CLASS___MPMutableSectionedCollection);
  [v13 appendSection:&stru_100279068];
  [v13 appendItem:v12];
  id v14 = [[MPStoreLibraryPersonalizationRequest alloc] initWithUnpersonalizedRequest:v10 unpersonalizedContentDescriptors:v13];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_1000B3E80;
  void v16[3] = &unk_10026A188;
  id v17 = v7;
  id v15 = v7;
  [v14 performWithResponseHandler:v16];
}

+ (void)checkAlbumInLibrary:(id)a3 songs:(id)a4 completionHandler:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v26 = a5;
  id v9 = objc_alloc_init(&OBJC_CLASS___MPModelLibraryRequest);
  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[MPModelSong kindWithVariants:](&OBJC_CLASS___MPModelSong, "kindWithVariants:", 3LL));
  -[MPModelLibraryRequest setItemKind:](v9, "setItemKind:", v10);
  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[MPModelAlbum kindWithSongKind:](&OBJC_CLASS___MPModelAlbum, "kindWithSongKind:", v10));
  -[MPModelLibraryRequest setSectionKind:](v9, "setSectionKind:", v11);

  uint64_t v36 = MPModelPropertySongLibraryAdded;
  id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v36, 1LL));
  id v13 = (void *)objc_claimAutoreleasedReturnValue( +[MPPropertySet propertySetWithProperties:]( &OBJC_CLASS___MPPropertySet,  "propertySetWithProperties:",  v12));
  -[MPModelLibraryRequest setItemProperties:](v9, "setItemProperties:", v13);

  uint64_t v35 = MPModelPropertyAlbumLibraryAdded;
  id v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v35, 1LL));
  id v15 = (void *)objc_claimAutoreleasedReturnValue( +[MPPropertySet propertySetWithProperties:]( &OBJC_CLASS___MPPropertySet,  "propertySetWithProperties:",  v14));
  -[MPModelLibraryRequest setSectionProperties:](v9, "setSectionProperties:", v15);

  id v16 = objc_alloc_init(&OBJC_CLASS___MPMutableSectionedCollection);
  uint64_t v27 = v7;
  id v17 = [[MPStoreLibraryPersonalizationContentDescriptor alloc] initWithModel:v7 personalizationStyle:4];
  [v16 appendSection:v17];
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  id v18 = v8;
  id v19 = [v18 countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v19)
  {
    id v20 = v19;
    uint64_t v21 = *(void *)v31;
    do
    {
      uint64_t v22 = 0LL;
      do
      {
        if (*(void *)v31 != v21) {
          objc_enumerationMutation(v18);
        }
        id v23 = [[MPStoreLibraryPersonalizationContentDescriptor alloc] initWithModel:*(void *)(*((void *)&v30 + 1) + 8 * (void)v22) personalizationStyle:4];
        [v16 appendItem:v23];

        uint64_t v22 = (char *)v22 + 1;
      }

      while (v20 != v22);
      id v20 = [v18 countByEnumeratingWithState:&v30 objects:v34 count:16];
    }

    while (v20);
  }

  id v24 = [[MPStoreLibraryPersonalizationRequest alloc] initWithUnpersonalizedRequest:v9 unpersonalizedContentDescriptors:v16];
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472LL;
  v28[2] = sub_1000B41E8;
  v28[3] = &unk_10026D9B0;
  id v29 = v26;
  id v25 = v26;
  [v24 performWithResponseHandler:v28];
}

+ (id)imageProxyForClientDataString:(id)a3
{
  id v3 = a3;
  if ([v3 length])
  {
    id v4 = -[NSData initWithBase64EncodedString:options:]( objc_alloc(&OBJC_CLASS___NSData),  "initWithBase64EncodedString:options:",  v3,  0LL);
    if (v4)
    {
      id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSJSONSerialization JSONObjectWithData:options:error:]( &OBJC_CLASS___NSJSONSerialization,  "JSONObjectWithData:options:error:",  v4,  0LL,  0LL));
      id v6 = v5;
      if (v5)
      {
        id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"ClientDataMPArtwork"]);
        if (v7) {
          id v8 = -[TVMusicMPModelImageProxy initWithMPObject:]( objc_alloc(&OBJC_CLASS___TVMusicMPModelImageProxy),  "initWithMPObject:",  v7);
        }
        else {
          id v8 = 0LL;
        }
      }

      else
      {
        id v8 = 0LL;
      }
    }

    else
    {
      id v8 = 0LL;
    }
  }

  else
  {
    id v8 = 0LL;
  }

  return v8;
}

+ (id)featureNameForPageIdentifier:(id)a3
{
  id v3 = a3;
  else {
    id v4 = (__CFString *)[v3 copy];
  }

  return v4;
}

+ (id)dictionaryFromNSError:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithCapacity:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithCapacity:",  5LL));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 domain]);
  [v4 setObject:v5 forKeyedSubscript:@"domain"];

  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v3 code]));
  [v4 setObject:v6 forKeyedSubscript:@"code"];

  id v7 = (void *)objc_claimAutoreleasedReturnValue([v3 userInfo]);
  [v4 setObject:v7 forKeyedSubscript:@"userInfo"];

  id v8 = (void *)objc_claimAutoreleasedReturnValue([v3 localizedDescription]);
  [v4 setObject:v8 forKeyedSubscript:@"localizedDescription"];

  id v9 = (void *)objc_claimAutoreleasedReturnValue([v3 localizedFailureReason]);
  [v4 setObject:v9 forKeyedSubscript:@"localizedFailureReason"];

  return v4;
}

@end
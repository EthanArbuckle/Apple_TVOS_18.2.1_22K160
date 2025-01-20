@interface TVSettingsCloudMediaLibraryFacade
+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3;
+ (id)_debugNameForCloudStatus:(int64_t)a3;
+ (id)_debugNameForSyncState:(int64_t)a3;
+ (id)sharedInstance;
- (BOOL)_isEnhancedAudioAvailable;
- (BOOL)_mediaLibraryHasContent;
- (BOOL)addingToPlaylistAddsToLibrary;
- (BOOL)canAddToPlaylist;
- (BOOL)favoritingAddsToLibrary;
- (BOOL)isAppleMusicSubscribed;
- (BOOL)isITunesMatchSubscribed;
- (BOOL)supportsEnhancedAudio;
- (ICMusicSubscriptionStatus)cachedSubscriptionStatus;
- (id)_init;
- (int64_t)cloudStatus;
- (int64_t)syncState;
- (void)_addToPlaylistBehaviorDidChangeNotification:(id)a3;
- (void)_favoriteSongAddToLibraryBehaviorDidChangeNotification:(id)a3;
- (void)_handleIsCloudUpdateInProgressDidChangeNotification:(id)a3;
- (void)_handleMediaLibraryDidChangeNotification:(id)a3;
- (void)_handleMediaLibraryPathDidChangeNotification:(id)a3;
- (void)_handleSubscriptionStatusDidChangeNotification:(id)a3;
- (void)_initializeState;
- (void)_initializeSyncState;
- (void)_reinitializeState;
- (void)_updateAddToLibraryBehavior;
- (void)_updateSubscriptionStatusWithCompletion:(id)a3;
- (void)_updateSyncState;
- (void)setAddingToPlaylistAddsToLibrary:(BOOL)a3;
- (void)setAppleMusicSubscribed:(BOOL)a3;
- (void)setCachedSubscriptionStatus:(id)a3;
- (void)setCloudStatus:(int64_t)a3;
- (void)setFavoritingAddsToLibrary:(BOOL)a3;
- (void)setITunesMatchSubscribed:(BOOL)a3;
- (void)setSupportsEnhancedAudio:(BOOL)a3;
- (void)setSyncState:(int64_t)a3;
@end

@implementation TVSettingsCloudMediaLibraryFacade

+ (id)sharedInstance
{
  if (qword_1001E17E0 != -1) {
    dispatch_once(&qword_1001E17E0, &stru_100191038);
  }
  return (id)qword_1001E17D8;
}

- (id)_init
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___TVSettingsCloudMediaLibraryFacade;
  v2 = -[TVSettingsCloudMediaLibraryFacade init](&v9, "init");
  v3 = v2;
  if (v2)
  {
    v2->_syncState = 0LL;
    v2->_cloudStatus = 0LL;
    v2->_supportsEnhancedAudio = MSVDeviceSupportsEnhancedMusic( -[TVSettingsCloudMediaLibraryFacade _updateAddToLibraryBehavior]( v2,  "_updateAddToLibraryBehavior"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[MPMediaLibrary defaultMediaLibrary](&OBJC_CLASS___MPMediaLibrary, "defaultMediaLibrary"));
    [v4 beginGeneratingLibraryChangeNotifications];
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    uint64_t v6 = ICMusicSubscriptionStatusDidChangeNotification;
    v7 = (void *)objc_claimAutoreleasedReturnValue( +[ICMusicSubscriptionStatusController sharedStatusController]( &OBJC_CLASS___ICMusicSubscriptionStatusController,  "sharedStatusController"));
    [v5 addObserver:v3 selector:"_handleSubscriptionStatusDidChangeNotification:" name:v6 object:v7];

    [v5 addObserver:v3 selector:"_handleMediaLibraryPathDidChangeNotification:" name:MPMediaLibraryPathDidChangeNotification object:v4];
    [v5 addObserver:v3 selector:"_handleMediaLibraryDidChangeNotification:" name:MPMediaLibraryDidChangeNotification object:v4];
    [v5 addObserver:v3 selector:"_handleIsCloudUpdateInProgressDidChangeNotification:" name:MPCloudControllerIsUpdateInProgressDidChangeNotification object:0];
    [v5 addObserver:v3 selector:"_addToPlaylistBehaviorDidChangeNotification:" name:MPCloudControllerCloudAddToPlaylistBehaviorDidChangeNotification object:0];
    [v5 addObserver:v3 selector:"_favoriteSongAddToLibraryBehaviorDidChangeNotification:" name:MPCloudControllerCloudFavoriteSongAddToLibraryBehaviorDidChangeNotification object:0];
    -[TVSettingsCloudMediaLibraryFacade _initializeState](v3, "_initializeState");
  }

  return v3;
}

- (void)setAddingToPlaylistAddsToLibrary:(BOOL)a3
{
  self->_addingToPlaylistAddsToLibrary = a3;
  if (a3) {
    uint64_t v3 = 1LL;
  }
  else {
    uint64_t v3 = 2LL;
  }
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[MPCloudController sharedCloudController](&OBJC_CLASS___MPCloudController, "sharedCloudController"));
  [v4 setCloudAddToPlaylistBehavior:v3 completionHandler:&stru_100191058];
}

- (void)setFavoritingAddsToLibrary:(BOOL)a3
{
  self->_favoritingAddsToLibrary = a3;
  if (a3) {
    uint64_t v3 = 1LL;
  }
  else {
    uint64_t v3 = 2LL;
  }
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[MPCloudController sharedCloudController](&OBJC_CLASS___MPCloudController, "sharedCloudController"));
  [v4 setCloudFavoriteSongAddToLibraryBehavior:v3 completionHandler:&stru_100191078];
}

- (BOOL)canAddToPlaylist
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsCloudMediaLibraryFacade cachedSubscriptionStatus](self, "cachedSubscriptionStatus"));
  BOOL v3 = [v2 statusType] == (id)1;

  return v3;
}

+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3
{
  id v4 = a3;
  if (([v4 isEqualToString:@"syncState"] & 1) != 0
    || ([v4 isEqualToString:@"appleMusicSubscribed"] & 1) != 0
    || ([v4 isEqualToString:@"iTunesMatchSubscribed"] & 1) != 0
    || ([v4 isEqualToString:@"addingToPlaylistAddsToLibrary"] & 1) != 0
    || ([v4 isEqualToString:@"favoritingAddsToLibrary"] & 1) != 0)
  {
    unsigned __int8 v5 = 0;
  }

  else
  {
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS___TVSettingsCloudMediaLibraryFacade;
    unsigned __int8 v5 = objc_msgSendSuper2(&v7, "automaticallyNotifiesObserversForKey:", v4);
  }

  return v5;
}

- (void)_handleSubscriptionStatusDidChangeNotification:(id)a3
{
  id v4 = a3;
  id v5 = sub_100063A38();
  uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Received ICMusicSubscriptionStatusDidChangeNotification notification",  (uint8_t *)buf,  2u);
  }

  objc_initWeak(buf, self);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100063A78;
  v7[3] = &unk_10018F498;
  objc_copyWeak(&v8, buf);
  -[TVSettingsCloudMediaLibraryFacade _updateSubscriptionStatusWithCompletion:]( self,  "_updateSubscriptionStatusWithCompletion:",  v7);
  objc_destroyWeak(&v8);
  objc_destroyWeak(buf);
}

- (void)_handleMediaLibraryPathDidChangeNotification:(id)a3
{
  id v4 = sub_100063A38();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_INFO,  "Received MPMediaLibraryPathDidChangeNotification notification",  (uint8_t *)buf,  2u);
  }

  objc_initWeak(buf, self);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100063B80;
  block[3] = &unk_10018E810;
  objc_copyWeak(&v7, buf);
  dispatch_async(&_dispatch_main_q, block);
  objc_destroyWeak(&v7);
  objc_destroyWeak(buf);
}

- (void)_handleMediaLibraryDidChangeNotification:(id)a3
{
  id v4 = sub_100063A38();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_INFO,  "Received MPMediaLibraryDidChangeNotification notification",  (uint8_t *)buf,  2u);
  }

  objc_initWeak(buf, self);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100063C80;
  block[3] = &unk_10018E810;
  objc_copyWeak(&v7, buf);
  dispatch_async(&_dispatch_main_q, block);
  objc_destroyWeak(&v7);
  objc_destroyWeak(buf);
}

- (void)_handleIsCloudUpdateInProgressDidChangeNotification:(id)a3
{
  id v4 = sub_100063A38();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_INFO,  "Received MPCloudControllerIsUpdateInProgressDidChangeNotification notification",  (uint8_t *)buf,  2u);
  }

  objc_initWeak(buf, self);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100063D80;
  block[3] = &unk_10018E810;
  objc_copyWeak(&v7, buf);
  dispatch_async(&_dispatch_main_q, block);
  objc_destroyWeak(&v7);
  objc_destroyWeak(buf);
}

- (void)_addToPlaylistBehaviorDidChangeNotification:(id)a3
{
  id v4 = sub_100063A38();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_INFO,  "Received MPCloudControllerCloudAddToPlaylistBehaviorDidChangeNotification notification",  (uint8_t *)buf,  2u);
  }

  objc_initWeak(buf, self);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100063E80;
  block[3] = &unk_10018E810;
  objc_copyWeak(&v7, buf);
  dispatch_async(&_dispatch_main_q, block);
  objc_destroyWeak(&v7);
  objc_destroyWeak(buf);
}

- (void)_favoriteSongAddToLibraryBehaviorDidChangeNotification:(id)a3
{
  id v4 = sub_100063A38();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_INFO,  "Received MPCloudControllerCloudFavoriteSongAddToLibraryBehaviorDidChangeNotification notification",  (uint8_t *)buf,  2u);
  }

  objc_initWeak(buf, self);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100063F80;
  block[3] = &unk_10018E810;
  objc_copyWeak(&v7, buf);
  dispatch_async(&_dispatch_main_q, block);
  objc_destroyWeak(&v7);
  objc_destroyWeak(buf);
}

- (void)setSyncState:(int64_t)a3
{
  if (self->_syncState != a3)
  {
    id v5 = sub_100063A38();
    uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = [(id)objc_opt_class(self) _debugNameForSyncState:self->_syncState];
      id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
      id v9 = [(id)objc_opt_class(self) _debugNameForSyncState:a3];
      v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
      int v11 = 138412546;
      v12 = v8;
      __int16 v13 = 2112;
      v14 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Sync state changed from %@ to %@",  (uint8_t *)&v11,  0x16u);
    }

    -[TVSettingsCloudMediaLibraryFacade willChangeValueForKey:](self, "willChangeValueForKey:", @"syncState");
    self->_syncState = a3;
    -[TVSettingsCloudMediaLibraryFacade didChangeValueForKey:](self, "didChangeValueForKey:", @"syncState");
  }

- (void)setAppleMusicSubscribed:(BOOL)a3
{
  BOOL v3 = a3;
  dispatch_assert_queue_V2(&_dispatch_main_q);
  if (self->_appleMusicSubscribed != v3)
  {
    id v5 = sub_100063A38();
    uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      BOOL appleMusicSubscribed = self->_appleMusicSubscribed;
      v8[0] = 67109376;
      v8[1] = appleMusicSubscribed;
      __int16 v9 = 1024;
      BOOL v10 = v3;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Apple Music subscribed state changed from %{BOOL}d to %{BOOL}d",  (uint8_t *)v8,  0xEu);
    }

    -[TVSettingsCloudMediaLibraryFacade willChangeValueForKey:]( self,  "willChangeValueForKey:",  @"appleMusicSubscribed");
    self->_BOOL appleMusicSubscribed = v3;
    -[TVSettingsCloudMediaLibraryFacade didChangeValueForKey:]( self,  "didChangeValueForKey:",  @"appleMusicSubscribed");
  }

- (void)setITunesMatchSubscribed:(BOOL)a3
{
  BOOL v3 = a3;
  dispatch_assert_queue_V2(&_dispatch_main_q);
  if (self->_iTunesMatchSubscribed != v3)
  {
    id v5 = sub_100063A38();
    uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      BOOL iTunesMatchSubscribed = self->_iTunesMatchSubscribed;
      v8[0] = 67109376;
      v8[1] = iTunesMatchSubscribed;
      __int16 v9 = 1024;
      BOOL v10 = v3;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "iTunes Music subscribed state changed from %{BOOL}d to %{BOOL}d",  (uint8_t *)v8,  0xEu);
    }

    -[TVSettingsCloudMediaLibraryFacade willChangeValueForKey:]( self,  "willChangeValueForKey:",  @"iTunesMatchSubscribed");
    self->_BOOL iTunesMatchSubscribed = v3;
    -[TVSettingsCloudMediaLibraryFacade didChangeValueForKey:]( self,  "didChangeValueForKey:",  @"iTunesMatchSubscribed");
  }

- (void)_initializeState
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_100064378;
  v3[3] = &unk_10018F498;
  objc_copyWeak(&v4, &location);
  -[TVSettingsCloudMediaLibraryFacade _updateSubscriptionStatusWithCompletion:]( self,  "_updateSubscriptionStatusWithCompletion:",  v3);
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

- (void)_reinitializeState
{
  id v3 = sub_100063A38();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Reinitalizing media library state", v5, 2u);
  }

  -[TVSettingsCloudMediaLibraryFacade setSyncState:](self, "setSyncState:", 0LL);
  -[TVSettingsCloudMediaLibraryFacade setCloudStatus:](self, "setCloudStatus:", 0LL);
  -[TVSettingsCloudMediaLibraryFacade _initializeState](self, "_initializeState");
}

- (void)_updateSubscriptionStatusWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = -[ICStoreRequestContext initWithBlock:]( objc_alloc(&OBJC_CLASS___ICStoreRequestContext),  "initWithBlock:",  &stru_1001910B8);
  id v6 = [[ICMusicSubscriptionStatusRequest alloc] initWithStoreRequestContext:v5];
  [v6 setAllowsFallbackToExpiredStatus:1];
  [v6 setAllowsFallbackToStatusNeedingReload:1];
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[ICMusicSubscriptionStatusController sharedStatusController]( &OBJC_CLASS___ICMusicSubscriptionStatusController,  "sharedStatusController"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_1000645B4;
  v9[3] = &unk_100191108;
  v9[4] = self;
  id v10 = v4;
  id v8 = v4;
  [v7 performSubscriptionStatusRequest:v6 withCompletionHandler:v9];
}

- (void)_initializeSyncState
{
  if (-[TVSettingsCloudMediaLibraryFacade _mediaLibraryHasContent](self, "_mediaLibraryHasContent"))
  {
    -[TVSettingsCloudMediaLibraryFacade _updateSyncState](self, "_updateSyncState");
  }

  else
  {
    objc_initWeak(&location, self);
    dispatch_time_t v3 = dispatch_time(0LL, 5000000000LL);
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472LL;
    v4[2] = sub_100064A38;
    v4[3] = &unk_10018E810;
    objc_copyWeak(&v5, &location);
    dispatch_after(v3, &_dispatch_main_q, v4);

    objc_destroyWeak(&v5);
    objc_destroyWeak(&location);
  }

- (void)_updateAddToLibraryBehavior
{
  dispatch_time_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[MPCloudController sharedCloudController](&OBJC_CLASS___MPCloudController, "sharedCloudController"));
  BOOL v4 = (unint64_t)[v3 cloudAddToPlaylistBehavior] < 2;
  if (self->_addingToPlaylistAddsToLibrary != v4)
  {
    id v5 = sub_100063A38();
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      BOOL addingToPlaylistAddsToLibrary = self->_addingToPlaylistAddsToLibrary;
      int v12 = 67109376;
      BOOL v13 = addingToPlaylistAddsToLibrary;
      __int16 v14 = 1024;
      BOOL v15 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "addingToPlaylistAddsToLibrary changed from %{BOOL}d to %{BOOL}d",  (uint8_t *)&v12,  0xEu);
    }

    -[TVSettingsCloudMediaLibraryFacade willChangeValueForKey:]( self,  "willChangeValueForKey:",  @"addingToPlaylistAddsToLibrary");
    self->_BOOL addingToPlaylistAddsToLibrary = v4;
    -[TVSettingsCloudMediaLibraryFacade didChangeValueForKey:]( self,  "didChangeValueForKey:",  @"addingToPlaylistAddsToLibrary");
  }

  BOOL v8 = [v3 favoriteSongAddToLibraryBehavior] != (id)2;
  if (self->_favoritingAddsToLibrary != v8)
  {
    id v9 = sub_100063A38();
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      BOOL favoritingAddsToLibrary = self->_favoritingAddsToLibrary;
      int v12 = 67109376;
      BOOL v13 = favoritingAddsToLibrary;
      __int16 v14 = 1024;
      BOOL v15 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "favoritingAddsToLibrary changed from %{BOOL}d to %{BOOL}d",  (uint8_t *)&v12,  0xEu);
    }

    -[TVSettingsCloudMediaLibraryFacade willChangeValueForKey:]( self,  "willChangeValueForKey:",  @"favoritingAddsToLibrary");
    self->_BOOL favoritingAddsToLibrary = v8;
    -[TVSettingsCloudMediaLibraryFacade didChangeValueForKey:]( self,  "didChangeValueForKey:",  @"favoritingAddsToLibrary");
  }
}

- (void)_updateSyncState
{
  int64_t v3 = -[TVSettingsCloudMediaLibraryFacade cloudStatus](self, "cloudStatus");
  if (v3 == 2)
  {
    BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(+[MPCloudController sharedCloudController](&OBJC_CLASS___MPCloudController, "sharedCloudController"));
    unsigned int v5 = [v4 isJaliscoInitialImport];
    goto LABEL_5;
  }

  if (v3 == 1)
  {
    BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(+[MPCloudController sharedCloudController](&OBJC_CLASS___MPCloudController, "sharedCloudController"));
    unsigned int v5 = [v4 isCloudLibraryInitialImport];
LABEL_5:
    if (v5) {
      uint64_t v6 = 1LL;
    }
    else {
      uint64_t v6 = 2LL;
    }
    -[TVSettingsCloudMediaLibraryFacade setSyncState:](self, "setSyncState:", v6);
  }

  id v7 = sub_100063A38();
  BOOL v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = objc_msgSend( (id)objc_opt_class(self),  "_debugNameForSyncState:",  -[TVSettingsCloudMediaLibraryFacade syncState](self, "syncState"));
    id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    id v11 = objc_msgSend( (id)objc_opt_class(self),  "_debugNameForCloudStatus:",  -[TVSettingsCloudMediaLibraryFacade cloudStatus](self, "cloudStatus"));
    int v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    int v13 = 138412546;
    __int16 v14 = v10;
    __int16 v15 = 2112;
    v16 = v12;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Media library sync state: %@, Cloud status: %@",  (uint8_t *)&v13,  0x16u);
  }
}

- (BOOL)_mediaLibraryHasContent
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MPMediaLibrary defaultMediaLibrary](&OBJC_CLASS___MPMediaLibrary, "defaultMediaLibrary"));
  BOOL v3 = [v2 filterAvailableContentGroups:992 withOptions:0] != 0;

  return v3;
}

- (BOOL)_isEnhancedAudioAvailable
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue( +[MPCloudServiceStatusController sharedController]( &OBJC_CLASS___MPCloudServiceStatusController,  "sharedController"));
  unsigned __int8 v4 = [v3 matchStatus];
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsCloudMediaLibraryFacade cachedSubscriptionStatus](self, "cachedSubscriptionStatus"));
  unsigned __int8 v6 = [v5 hasCapability:128];

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsCloudMediaLibraryFacade cachedSubscriptionStatus](self, "cachedSubscriptionStatus"));
  unsigned int v8 = [v7 hasCapability:1];

  if ((v6 & 1) != 0 || (v4 & 4) != 0)
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue(+[MPCloudController sharedCloudController](&OBJC_CLASS___MPCloudController, "sharedCloudController"));
    id v11 = [v10 isEnhancedAudioAvailable];
    if ((_DWORD)v11) {
      int v9 = MSVDeviceSupportsEnhancedMusic(v11) & v8;
    }
    else {
      LOBYTE(v9) = 0;
    }
  }

  else
  {
    LOBYTE(v9) = 0;
  }

  return v9;
}

+ (id)_debugNameForSyncState:(int64_t)a3
{
  BOOL v3 = @"Initializing";
  if (a3 == 1) {
    BOOL v3 = @"Syncing";
  }
  if (a3 == 2) {
    return @"Synced";
  }
  else {
    return (id)v3;
  }
}

+ (id)_debugNameForCloudStatus:(int64_t)a3
{
  BOOL v3 = @"Unknown";
  if (a3 == 1) {
    BOOL v3 = @"Has Cloud Library";
  }
  if (a3 == 2) {
    return @"No Cloud Library";
  }
  else {
    return (id)v3;
  }
}

- (int64_t)syncState
{
  return self->_syncState;
}

- (BOOL)isAppleMusicSubscribed
{
  return self->_appleMusicSubscribed;
}

- (BOOL)isITunesMatchSubscribed
{
  return self->_iTunesMatchSubscribed;
}

- (BOOL)supportsEnhancedAudio
{
  return self->_supportsEnhancedAudio;
}

- (void)setSupportsEnhancedAudio:(BOOL)a3
{
  self->_supportsEnhancedAudio = a3;
}

- (BOOL)addingToPlaylistAddsToLibrary
{
  return self->_addingToPlaylistAddsToLibrary;
}

- (BOOL)favoritingAddsToLibrary
{
  return self->_favoritingAddsToLibrary;
}

- (ICMusicSubscriptionStatus)cachedSubscriptionStatus
{
  return self->_cachedSubscriptionStatus;
}

- (void)setCachedSubscriptionStatus:(id)a3
{
}

- (int64_t)cloudStatus
{
  return self->_cloudStatus;
}

- (void)setCloudStatus:(int64_t)a3
{
  self->_cloudStatus = a3;
}

- (void).cxx_destruct
{
}

@end
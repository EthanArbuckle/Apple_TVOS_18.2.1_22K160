@interface TVHAppSettings
+ (id)_mediaServersSortedByModifiedDate:(id)a3;
+ (id)_readMediaServersFromPreferences:(id)a3;
+ (id)sharedInstance;
+ (unint64_t)_cleanedMediaEntiyCoverArtShapeSetting:(unint64_t)a3;
- (BOOL)allowDAAPServerDiscovery;
- (NSArray)mediaServers;
- (NSArray)sortedMediaServers;
- (NSMutableDictionary)mediaServerByIdentifier;
- (TVHAppSettings)init;
- (TVHMediaServerSettings)mostRecentlyUsedMediaServer;
- (id)_init;
- (id)mediaServerSettingsForIdentifier:(id)a3;
- (int64_t)_readSortModeForKey:(id)a3 defaultValue:(int64_t)a4;
- (int64_t)mediaRepeatMode;
- (int64_t)musicAlbumsSortMode;
- (int64_t)musicArtistAlbumsSortMode;
- (int64_t)musicCompilationAlbumsSortMode;
- (int64_t)musicGenreAlbumsSortMode;
- (int64_t)musicSongsSortMode;
- (int64_t)musicVideosSortMode;
- (int64_t)playlistsSortMode;
- (unint64_t)movieCoverArtShape;
- (unint64_t)showCoverArtShape;
- (void)_initializeFromPreferences;
- (void)_refreshFromPreferences;
- (void)_refreshFromPreferencesAndShouldNotify:(BOOL)a3;
- (void)_updateMediaServersWithBlock:(id)a3 shouldNotify:(BOOL)a4;
- (void)_writeMediaServersToPreferences;
- (void)_writeMediaServersToPreferencesAndSynchronize:(BOOL)a3;
- (void)_writeSortMode:(int64_t)a3 withKey:(id)a4;
- (void)resetAccountRelatedSettings;
- (void)saveMediaServerSettings:(id)a3;
- (void)setAllowDAAPServerDiscovery:(BOOL)a3;
- (void)setMediaRepeatMode:(int64_t)a3;
- (void)setMediaServerByIdentifier:(id)a3;
- (void)setMovieCoverArtShape:(unint64_t)a3;
- (void)setMusicAlbumsSortMode:(int64_t)a3;
- (void)setMusicArtistAlbumsSortMode:(int64_t)a3;
- (void)setMusicCompilationAlbumsSortMode:(int64_t)a3;
- (void)setMusicGenreAlbumsSortMode:(int64_t)a3;
- (void)setMusicSongsSortMode:(int64_t)a3;
- (void)setMusicVideosSortMode:(int64_t)a3;
- (void)setPlaylistsSortMode:(int64_t)a3;
- (void)setShowCoverArtShape:(unint64_t)a3;
- (void)setSortedMediaServers:(id)a3;
@end

@implementation TVHAppSettings

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100021AC8;
  block[3] = &unk_1000FD0E8;
  block[4] = a1;
  if (qword_1001572E0 != -1) {
    dispatch_once(&qword_1001572E0, block);
  }
  return (id)qword_1001572D8;
}

- (TVHAppSettings)init
{
  v3 = NSStringFromSelector(a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"The %@ initializer is not available.",  v4);

  return 0LL;
}

- (id)_init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___TVHAppSettings;
  return -[TVHAppSettings initWithPreferencesDomain:]( &v3,  "initWithPreferencesDomain:",  @"com.apple.TVHomeSharing");
}

- (void)setAllowDAAPServerDiscovery:(BOOL)a3
{
  if (self->_allowDAAPServerDiscovery != a3)
  {
    BOOL v3 = a3;
    self->_allowDAAPServerDiscovery = a3;
    id v4 = (id)objc_claimAutoreleasedReturnValue(-[TVHAppSettings preferences](self, "preferences"));
    [v4 setBool:v3 forKey:@"AllowDAAPServerDiscovery"];
    [v4 synchronize];
  }

- (void)setMediaRepeatMode:(int64_t)a3
{
  if (self->_mediaRepeatMode != a3)
  {
    self->_mediaRepeatMode = a3;
    id v4 = (id)objc_claimAutoreleasedReturnValue(-[TVHAppSettings preferences](self, "preferences"));
    [v4 setInteger:a3 forKey:@"MediaRepeatMode"];
    [v4 synchronize];
  }

- (void)setMusicAlbumsSortMode:(int64_t)a3
{
  if (self->_musicAlbumsSortMode != a3)
  {
    self->_musicAlbumsSortMode = a3;
    -[TVHAppSettings _writeSortMode:withKey:](self, "_writeSortMode:withKey:");
  }

- (void)setMusicArtistAlbumsSortMode:(int64_t)a3
{
  if (self->_musicArtistAlbumsSortMode != a3)
  {
    self->_musicArtistAlbumsSortMode = a3;
    -[TVHAppSettings _writeSortMode:withKey:](self, "_writeSortMode:withKey:");
  }

- (void)setMusicCompilationAlbumsSortMode:(int64_t)a3
{
  if (self->_musicCompilationAlbumsSortMode != a3)
  {
    self->_musicCompilationAlbumsSortMode = a3;
    -[TVHAppSettings _writeSortMode:withKey:](self, "_writeSortMode:withKey:");
  }

- (void)setMusicGenreAlbumsSortMode:(int64_t)a3
{
  if (self->_musicGenreAlbumsSortMode != a3)
  {
    self->_musicGenreAlbumsSortMode = a3;
    -[TVHAppSettings _writeSortMode:withKey:](self, "_writeSortMode:withKey:");
  }

- (void)setMusicSongsSortMode:(int64_t)a3
{
  if (self->_musicSongsSortMode != a3)
  {
    self->_musicSongsSortMode = a3;
    -[TVHAppSettings _writeSortMode:withKey:](self, "_writeSortMode:withKey:");
  }

- (void)setMusicVideosSortMode:(int64_t)a3
{
  if (self->_musicVideosSortMode != a3)
  {
    self->_musicVideosSortMode = a3;
    -[TVHAppSettings _writeSortMode:withKey:](self, "_writeSortMode:withKey:");
  }

- (void)setPlaylistsSortMode:(int64_t)a3
{
  if (self->_playlistsSortMode != a3)
  {
    self->_playlistsSortMode = a3;
    -[TVHAppSettings _writeSortMode:withKey:](self, "_writeSortMode:withKey:");
  }

- (void)setMovieCoverArtShape:(unint64_t)a3
{
  self->_movieCoverArtShape = a3;
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[TVHAppSettings preferences](self, "preferences"));
  [v4 setInteger:a3 forKey:@"MovieCoverArtShape"];
  [v4 synchronize];
}

- (void)setShowCoverArtShape:(unint64_t)a3
{
  self->_showCoverArtShape = a3;
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[TVHAppSettings preferences](self, "preferences"));
  [v4 setInteger:a3 forKey:@"ShowCoverArtShape"];
  [v4 synchronize];
}

- (NSArray)mediaServers
{
  BOOL v3 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVHAppSettings mediaServerByIdentifier](self, "mediaServerByIdentifier", 0LL));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 allValues]);

  id v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      v9 = 0LL;
      do
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = [*(id *)(*((void *)&v14 + 1) + 8 * (void)v9) copy];
        -[NSMutableArray addObject:](v3, "addObject:", v10);

        v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }

    while (v7);
  }

  id v11 = [(id)objc_opt_class(self) _mediaServersSortedByModifiedDate:v3];
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);

  return (NSArray *)v12;
}

- (TVHMediaServerSettings)mostRecentlyUsedMediaServer
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVHAppSettings sortedMediaServers](self, "sortedMediaServers"));
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue([v2 firstObject]);
  id v4 = [v3 copy];

  return (TVHMediaServerSettings *)v4;
}

- (void)saveMediaServerSettings:(id)a3
{
  id v4 = a3;
  if (!v4) {
    +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"The %@ parameter must not be nil.",  @"mediaServer");
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  [v4 setModifiedDate:v5];

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000220D4;
  v7[3] = &unk_1000FCDB8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  -[TVHAppSettings _updateMediaServersWithBlock:shouldNotify:]( self,  "_updateMediaServersWithBlock:shouldNotify:",  v7,  1LL);
  -[TVHAppSettings _writeMediaServersToPreferences](self, "_writeMediaServersToPreferences");
}

- (id)mediaServerSettingsForIdentifier:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVHAppSettings mediaServerByIdentifier](self, "mediaServerByIdentifier"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:v4]);

  id v7 = [v6 copy];
  return v7;
}

- (void)resetAccountRelatedSettings
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_100022204;
  v3[3] = &unk_1000FCEA8;
  v3[4] = self;
  -[TVHAppSettings _updateMediaServersWithBlock:shouldNotify:]( self,  "_updateMediaServersWithBlock:shouldNotify:",  v3,  1LL);
  -[TVHAppSettings _writeMediaServersToPreferences](self, "_writeMediaServersToPreferences");
}

- (void)_initializeFromPreferences
{
}

- (void)_refreshFromPreferences
{
}

- (void)_writeSortMode:(int64_t)a3 withKey:(id)a4
{
  id v6 = a4;
  id v7 = (id)objc_claimAutoreleasedReturnValue(-[TVHAppSettings preferences](self, "preferences"));
  [v7 setInteger:a3 forKey:v6];

  [v7 synchronize];
}

- (int64_t)_readSortModeForKey:(id)a3 defaultValue:(int64_t)a4
{
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVHAppSettings preferences](self, "preferences"));
  unsigned int v8 = [v7 integerForKey:v6 defaultValue:a4];

  if (v8 <= 6) {
    return (int)v8;
  }
  else {
    return a4;
  }
}

- (void)_refreshFromPreferencesAndShouldNotify:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVHAppSettings preferences](self, "preferences"));
  unsigned int v6 = [v5 BOOLForKey:@"AllowDAAPServerDiscovery" defaultValue:0];
  if (self->_allowDAAPServerDiscovery != v6)
  {
    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472LL;
    v33[2] = sub_100022818;
    v33[3] = &unk_1000FD260;
    v33[4] = self;
    char v34 = v6;
    -[TVHAppSettings _updateSettingWithBlock:shouldNotify:forKey:]( self,  "_updateSettingWithBlock:shouldNotify:forKey:",  v33,  v3,  @"allowDAAPServerDiscovery");
  }

  signed int v7 = [v5 integerForKey:@"MediaRepeatMode" defaultValue:0];
  uint64_t v8 = v7;
  if ((v7 & 0xFFFFFFFD) != 0 && v7 != 1) {
    uint64_t v8 = 0LL;
  }
  if (v8 != self->_mediaRepeatMode)
  {
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472LL;
    v32[2] = sub_100022830;
    v32[3] = &unk_1000FD818;
    v32[4] = self;
    v32[5] = v8;
    -[TVHAppSettings _updateSettingWithBlock:shouldNotify:forKey:]( self,  "_updateSettingWithBlock:shouldNotify:forKey:",  v32,  v3,  @"mediaRepeatMode");
  }

  int64_t v10 = -[TVHAppSettings _readSortModeForKey:defaultValue:]( self,  "_readSortModeForKey:defaultValue:",  @"MusicAlbumsSortMode",  0LL);
  if (v10 != self->_musicAlbumsSortMode)
  {
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472LL;
    v31[2] = sub_100022844;
    v31[3] = &unk_1000FD818;
    v31[4] = self;
    v31[5] = v10;
    -[TVHAppSettings _updateSettingWithBlock:shouldNotify:forKey:]( self,  "_updateSettingWithBlock:shouldNotify:forKey:",  v31,  v3,  @"musicAlbumsSortMode");
  }

  int64_t v11 = -[TVHAppSettings _readSortModeForKey:defaultValue:]( self,  "_readSortModeForKey:defaultValue:",  @"MusicArtistAlbumsSortMode",  5LL);
  if (v11 != self->_musicArtistAlbumsSortMode)
  {
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472LL;
    v30[2] = sub_100022858;
    v30[3] = &unk_1000FD818;
    v30[4] = self;
    v30[5] = v11;
    -[TVHAppSettings _updateSettingWithBlock:shouldNotify:forKey:]( self,  "_updateSettingWithBlock:shouldNotify:forKey:",  v30,  v3,  @"musicArtistAlbumsSortMode");
  }

  int64_t v12 = -[TVHAppSettings _readSortModeForKey:defaultValue:]( self,  "_readSortModeForKey:defaultValue:",  @"MusicCompilationAlbumsSortMode",  0LL);
  if (v12 != self->_musicCompilationAlbumsSortMode)
  {
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472LL;
    v29[2] = sub_10002286C;
    v29[3] = &unk_1000FD818;
    v29[4] = self;
    v29[5] = v12;
    -[TVHAppSettings _updateSettingWithBlock:shouldNotify:forKey:]( self,  "_updateSettingWithBlock:shouldNotify:forKey:",  v29,  v3,  @"musicCompilationAlbumsSortMode");
  }

  int64_t v13 = -[TVHAppSettings _readSortModeForKey:defaultValue:]( self,  "_readSortModeForKey:defaultValue:",  @"MusicGenreAlbumsSortMode",  0LL);
  if (v13 != self->_musicGenreAlbumsSortMode)
  {
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472LL;
    v28[2] = sub_100022880;
    v28[3] = &unk_1000FD818;
    v28[4] = self;
    v28[5] = v13;
    -[TVHAppSettings _updateSettingWithBlock:shouldNotify:forKey:]( self,  "_updateSettingWithBlock:shouldNotify:forKey:",  v28,  v3,  @"musicGenreAlbumsSortMode");
  }

  int64_t v14 = -[TVHAppSettings _readSortModeForKey:defaultValue:]( self,  "_readSortModeForKey:defaultValue:",  @"MusicSongsSortMode",  5LL);
  if (v14 != self->_musicSongsSortMode)
  {
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472LL;
    v27[2] = sub_100022894;
    v27[3] = &unk_1000FD818;
    v27[4] = self;
    v27[5] = v14;
    -[TVHAppSettings _updateSettingWithBlock:shouldNotify:forKey:]( self,  "_updateSettingWithBlock:shouldNotify:forKey:",  v27,  v3,  @"musicSongsSortMode");
  }

  int64_t v15 = -[TVHAppSettings _readSortModeForKey:defaultValue:]( self,  "_readSortModeForKey:defaultValue:",  @"MusicVideosSortMode",  5LL);
  if (v15 != self->_musicVideosSortMode)
  {
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472LL;
    v26[2] = sub_1000228A8;
    v26[3] = &unk_1000FD818;
    v26[4] = self;
    v26[5] = v15;
    -[TVHAppSettings _updateSettingWithBlock:shouldNotify:forKey:]( self,  "_updateSettingWithBlock:shouldNotify:forKey:",  v26,  v3,  @"musicVideosSortMode");
  }

  int64_t v16 = -[TVHAppSettings _readSortModeForKey:defaultValue:]( self,  "_readSortModeForKey:defaultValue:",  @"PlaylistsSortMode",  3LL);
  if (v16 != self->_playlistsSortMode)
  {
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472LL;
    v25[2] = sub_1000228BC;
    v25[3] = &unk_1000FD818;
    v25[4] = self;
    v25[5] = v16;
    -[TVHAppSettings _updateSettingWithBlock:shouldNotify:forKey:]( self,  "_updateSettingWithBlock:shouldNotify:forKey:",  v25,  v3,  @"playlistsSortMode");
  }

  id v17 = objc_msgSend( (id)objc_opt_class(self),  "_cleanedMediaEntiyCoverArtShapeSetting:",  (int)objc_msgSend(v5, "integerForKey:defaultValue:", @"MovieCoverArtShape", 0));
  if (v17 != (id)self->_movieCoverArtShape)
  {
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472LL;
    v24[2] = sub_1000228D0;
    v24[3] = &unk_1000FD818;
    v24[4] = self;
    v24[5] = v17;
    -[TVHAppSettings _updateSettingWithBlock:shouldNotify:forKey:]( self,  "_updateSettingWithBlock:shouldNotify:forKey:",  v24,  v3,  @"movieCoverArtShape");
  }

  id v18 = objc_msgSend( (id)objc_opt_class(self),  "_cleanedMediaEntiyCoverArtShapeSetting:",  (int)objc_msgSend(v5, "integerForKey:defaultValue:", @"ShowCoverArtShape", 0));
  if (v18 != (id)self->_showCoverArtShape)
  {
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472LL;
    v23[2] = sub_1000228E4;
    v23[3] = &unk_1000FD818;
    v23[4] = self;
    v23[5] = v18;
    -[TVHAppSettings _updateSettingWithBlock:shouldNotify:forKey:]( self,  "_updateSettingWithBlock:shouldNotify:forKey:",  v23,  v3,  @"showCoverArtShape");
  }

  id v19 = [(id)objc_opt_class(self) _readMediaServersFromPreferences:v5];
  v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
  if (([v20 isEqual:self->_mediaServerByIdentifier] & 1) == 0)
  {
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472LL;
    v21[2] = sub_1000228F8;
    v21[3] = &unk_1000FCDB8;
    v21[4] = self;
    id v22 = v20;
    -[TVHAppSettings _updateMediaServersWithBlock:shouldNotify:]( self,  "_updateMediaServersWithBlock:shouldNotify:",  v21,  v3);
  }
}

- (void)_updateMediaServersWithBlock:(id)a3 shouldNotify:(BOOL)a4
{
  if (a4)
  {
    v5 = (void (**)(void))a3;
    -[TVHAppSettings willChangeValueForKey:](self, "willChangeValueForKey:", @"mediaServers");
    -[TVHAppSettings willChangeValueForKey:](self, "willChangeValueForKey:", @"mostRecentlyUsedMediaServer");
    v5[2](v5);

    -[TVHAppSettings setSortedMediaServers:](self, "setSortedMediaServers:", 0LL);
    -[TVHAppSettings didChangeValueForKey:](self, "didChangeValueForKey:", @"mediaServers");
    -[TVHAppSettings didChangeValueForKey:](self, "didChangeValueForKey:", @"mostRecentlyUsedMediaServer");
  }

  else
  {
    unsigned int v6 = (void (*)(void))*((void *)a3 + 2);
    id v7 = a3;
    v6();

    -[TVHAppSettings setSortedMediaServers:](self, "setSortedMediaServers:", 0LL);
  }

- (NSArray)sortedMediaServers
{
  sortedMediaServers = self->_sortedMediaServers;
  if (!sortedMediaServers)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVHAppSettings mediaServerByIdentifier](self, "mediaServerByIdentifier"));
    v5 = (void *)objc_claimAutoreleasedReturnValue([v4 allValues]);

    id v6 = [(id)objc_opt_class(self) _mediaServersSortedByModifiedDate:v5];
    id v7 = (NSArray *)objc_claimAutoreleasedReturnValue(v6);
    uint64_t v8 = self->_sortedMediaServers;
    self->_sortedMediaServers = v7;

    sortedMediaServers = self->_sortedMediaServers;
  }

  return sortedMediaServers;
}

+ (id)_mediaServersSortedByModifiedDate:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSSortDescriptor sortDescriptorWithKey:ascending:]( &OBJC_CLASS___NSSortDescriptor,  "sortDescriptorWithKey:ascending:",  @"modifiedDate",  0LL));
  uint64_t v8 = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v8, 1LL));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v3 sortedArrayUsingDescriptors:v5]);

  return v6;
}

+ (id)_readMediaServersFromPreferences:(id)a3
{
  id v3 = a3;
  if (!v3) {
    +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"The %@ parameter must not be nil.",  @"preferences");
  }
  id v4 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  v5 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:@"MediaServers"]);
  uint64_t v6 = objc_opt_class(&OBJC_CLASS___NSArray);
  if ((objc_opt_isKindOfClass(v5, v6) & 1) != 0)
  {
    id v18 = v5;
    id v7 = v5;
    __int128 v19 = 0u;
    __int128 v20 = 0u;
    __int128 v21 = 0u;
    __int128 v22 = 0u;
    id v8 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v20;
      do
      {
        for (i = 0LL; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v20 != v10) {
            objc_enumerationMutation(v7);
          }
          int64_t v12 = *(void **)(*((void *)&v19 + 1) + 8LL * (void)i);
          uint64_t v13 = objc_opt_class(&OBJC_CLASS___NSDictionary);
          if ((objc_opt_isKindOfClass(v12, v13) & 1) != 0)
          {
            id v14 = v12;
            int64_t v15 = -[TVHMediaServerSettings initWithDictionaryRepresentation:]( objc_alloc(&OBJC_CLASS___TVHMediaServerSettings),  "initWithDictionaryRepresentation:",  v14);

            if (v15)
            {
              int64_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaServerSettings mediaServerIdentifier](v15, "mediaServerIdentifier"));
              -[NSMutableDictionary setObject:forKey:](v4, "setObject:forKey:", v15, v16);
            }
          }
        }

        id v9 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }

      while (v9);
    }

    v5 = v18;
  }

  return v4;
}

- (void)_writeMediaServersToPreferences
{
}

- (void)_writeMediaServersToPreferencesAndSynchronize:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVHAppSettings sortedMediaServers](self, "sortedMediaServers"));
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  id v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      uint64_t v10 = 0LL;
      do
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        int64_t v11 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v13 + 1) + 8 * (void)v10) dictionaryRepresentation]);
        -[NSMutableArray addObject:](v5, "addObject:", v11);

        uint64_t v10 = (char *)v10 + 1;
      }

      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }

    while (v8);
  }

  int64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[TVHAppSettings preferences](self, "preferences"));
  [v12 setObject:v5 forKey:@"MediaServers"];
  if (v3) {
    [v12 synchronize];
  }
}

+ (unint64_t)_cleanedMediaEntiyCoverArtShapeSetting:(unint64_t)a3
{
  if (a3 <= 3) {
    return a3;
  }
  else {
    return 0LL;
  }
}

- (BOOL)allowDAAPServerDiscovery
{
  return self->_allowDAAPServerDiscovery;
}

- (int64_t)mediaRepeatMode
{
  return self->_mediaRepeatMode;
}

- (int64_t)musicAlbumsSortMode
{
  return self->_musicAlbumsSortMode;
}

- (int64_t)musicArtistAlbumsSortMode
{
  return self->_musicArtistAlbumsSortMode;
}

- (int64_t)musicCompilationAlbumsSortMode
{
  return self->_musicCompilationAlbumsSortMode;
}

- (int64_t)musicGenreAlbumsSortMode
{
  return self->_musicGenreAlbumsSortMode;
}

- (int64_t)musicSongsSortMode
{
  return self->_musicSongsSortMode;
}

- (int64_t)musicVideosSortMode
{
  return self->_musicVideosSortMode;
}

- (int64_t)playlistsSortMode
{
  return self->_playlistsSortMode;
}

- (unint64_t)movieCoverArtShape
{
  return self->_movieCoverArtShape;
}

- (unint64_t)showCoverArtShape
{
  return self->_showCoverArtShape;
}

- (void)setSortedMediaServers:(id)a3
{
}

- (NSMutableDictionary)mediaServerByIdentifier
{
  return self->_mediaServerByIdentifier;
}

- (void)setMediaServerByIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
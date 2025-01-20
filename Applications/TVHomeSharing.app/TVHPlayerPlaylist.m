@interface TVHPlayerPlaylist
+ (id)new;
+ (int64_t)_mediaRepeatModeForPlaylistRepeatMode:(int64_t)a3;
+ (int64_t)_playlistRepeatModeForMediaRepeatMode:(int64_t)a3;
- (BOOL)canItemsBeAdded;
- (BOOL)isEligibleForPictureInPicture;
- (TVHPlayerPlaylist)init;
- (TVHPlayerPlaylist)initWithHomeSharingMediaItem:(id)a3 mediaLibrary:(id)a4;
- (TVHPlayerPlaylist)initWithHomeSharingMediaItems:(id)a3 mediaLibrary:(id)a4;
- (TVHPlayerPlaylist)initWithHomeSharingMediaItems:(id)a3 mediaLibrary:(id)a4 index:(unint64_t)a5 options:(unint64_t)a6;
- (TVHPlayerPlaylist)initWithMediaItems:(id)a3 index:(int64_t)a4 isCollection:(BOOL)a5;
- (void)_setRepeatMode:(int64_t)a3 andUpdateSettings:(BOOL)a4;
- (void)addItem:(id)a3;
- (void)addItems:(id)a3;
- (void)insertItem:(id)a3 atIndex:(unint64_t)a4;
- (void)insertItems:(id)a3 atIndexes:(id)a4;
- (void)setRepeatMode:(int64_t)a3;
@end

@implementation TVHPlayerPlaylist

+ (id)new
{
  return 0LL;
}

- (TVHPlayerPlaylist)init
{
  v3 = NSStringFromSelector(a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"The %@ initializer is not available.",  v4);

  return 0LL;
}

- (TVHPlayerPlaylist)initWithMediaItems:(id)a3 index:(int64_t)a4 isCollection:(BOOL)a5
{
  v6 = NSStringFromSelector(a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"The %@ initializer is not available.",  v7);

  return 0LL;
}

- (TVHPlayerPlaylist)initWithHomeSharingMediaItems:(id)a3 mediaLibrary:(id)a4 index:(unint64_t)a5 options:(unint64_t)a6
{
  char v6 = a6;
  v9 = (void *)objc_claimAutoreleasedReturnValue( +[TVHMediaEntityUtilities playerMediaItemsForMediaItems:mediaLibrary:]( &OBJC_CLASS___TVHMediaEntityUtilities,  "playerMediaItemsForMediaItems:mediaLibrary:",  a3,  a4));
  id v10 = [v9 count];
  if (!v10)
  {
    id v11 = sub_100079EB8();
    v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_10009C3EC();
    }
  }

  if ((unint64_t)v10 <= a5)
  {
    id v13 = sub_100079EB8();
    v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_10009C378(a5, v14);
    }

    a5 = 0LL;
  }

  v32.receiver = self;
  v32.super_class = (Class)&OBJC_CLASS___TVHPlayerPlaylist;
  v15 = -[TVHPlayerPlaylist initWithMediaItems:index:isCollection:]( &v32,  "initWithMediaItems:index:isCollection:",  v9,  a5,  0LL);
  v16 = v15;
  if (v15)
  {
    v15->_isEligibleForPictureInPicture = 1;
    __int128 v28 = 0u;
    __int128 v29 = 0u;
    __int128 v30 = 0u;
    __int128 v31 = 0u;
    id v17 = v9;
    id v18 = [v17 countByEnumeratingWithState:&v28 objects:v33 count:16];
    if (v18)
    {
      id v19 = v18;
      uint64_t v20 = *(void *)v29;
      while (2)
      {
        for (i = 0LL; i != v19; i = (char *)i + 1)
        {
          if (*(void *)v29 != v20) {
            objc_enumerationMutation(v17);
          }
          v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((void *)&v28 + 1) + 8 * (void)i), "mediaItem", (void)v28));
          v23 = (void *)objc_claimAutoreleasedReturnValue([v22 type]);
          if ([v23 mediaItemType] != (id)2 || objc_msgSend(v23, "mediaCategoryType") == (id)1)
          {
            v16->_isEligibleForPictureInPicture = 0;

            goto LABEL_21;
          }
        }

        id v19 = [v17 countByEnumeratingWithState:&v28 objects:v33 count:16];
        if (v19) {
          continue;
        }
        break;
      }
    }

- (TVHPlayerPlaylist)initWithHomeSharingMediaItems:(id)a3 mediaLibrary:(id)a4
{
  return -[TVHPlayerPlaylist initWithHomeSharingMediaItems:mediaLibrary:index:options:]( self,  "initWithHomeSharingMediaItems:mediaLibrary:index:options:",  a3,  a4,  0LL,  0LL);
}

- (TVHPlayerPlaylist)initWithHomeSharingMediaItem:(id)a3 mediaLibrary:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  id v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v11, 1LL));

  v9 = -[TVHPlayerPlaylist initWithHomeSharingMediaItems:mediaLibrary:]( self,  "initWithHomeSharingMediaItems:mediaLibrary:",  v8,  v6,  v11);
  return v9;
}

- (void)addItem:(id)a3
{
  id v4 = a3;
  if (-[TVHPlayerPlaylist canItemsBeAdded](self, "canItemsBeAdded"))
  {
    v7.receiver = self;
    v7.super_class = (Class)&OBJC_CLASS___TVHPlayerPlaylist;
    -[TVHPlayerPlaylist addItem:](&v7, "addItem:", v4);
  }

  else
  {
    id v5 = sub_100079EB8();
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_10009C418();
    }
  }
}

- (void)addItems:(id)a3
{
  id v4 = a3;
  if (-[TVHPlayerPlaylist canItemsBeAdded](self, "canItemsBeAdded"))
  {
    v7.receiver = self;
    v7.super_class = (Class)&OBJC_CLASS___TVHPlayerPlaylist;
    -[TVHPlayerPlaylist addItems:](&v7, "addItems:", v4);
  }

  else
  {
    id v5 = sub_100079EB8();
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_10009C444();
    }
  }
}

- (void)insertItem:(id)a3 atIndex:(unint64_t)a4
{
  id v6 = a3;
  if (-[TVHPlayerPlaylist canItemsBeAdded](self, "canItemsBeAdded"))
  {
    v9.receiver = self;
    v9.super_class = (Class)&OBJC_CLASS___TVHPlayerPlaylist;
    -[TVHPlayerPlaylist insertItem:atIndex:](&v9, "insertItem:atIndex:", v6, a4);
  }

  else
  {
    id v7 = sub_100079EB8();
    v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_10009C470();
    }
  }
}

- (void)insertItems:(id)a3 atIndexes:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (-[TVHPlayerPlaylist canItemsBeAdded](self, "canItemsBeAdded"))
  {
    v10.receiver = self;
    v10.super_class = (Class)&OBJC_CLASS___TVHPlayerPlaylist;
    -[TVHPlayerPlaylist insertItems:atIndexes:](&v10, "insertItems:atIndexes:", v6, v7);
  }

  else
  {
    id v8 = sub_100079EB8();
    objc_super v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_10009C49C();
    }
  }
}

- (void)setRepeatMode:(int64_t)a3
{
}

- (void)_setRepeatMode:(int64_t)a3 andUpdateSettings:(BOOL)a4
{
  BOOL v4 = a4;
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___TVHPlayerPlaylist;
  -[TVHPlayerPlaylist setRepeatMode:](&v8, "setRepeatMode:");
  if (v4)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[TVHAppSettings sharedInstance](&OBJC_CLASS___TVHAppSettings, "sharedInstance"));
    objc_msgSend( v7,  "setMediaRepeatMode:",  objc_msgSend((id)objc_opt_class(self), "_mediaRepeatModeForPlaylistRepeatMode:", a3));
  }

+ (int64_t)_mediaRepeatModeForPlaylistRepeatMode:(int64_t)a3
{
  if (a3 == 2) {
    return 2LL;
  }
  else {
    return a3 == 1;
  }
}

+ (int64_t)_playlistRepeatModeForMediaRepeatMode:(int64_t)a3
{
  if (a3 == 2) {
    return 2LL;
  }
  else {
    return a3 == 1;
  }
}

- (BOOL)canItemsBeAdded
{
  return self->_canItemsBeAdded;
}

- (BOOL)isEligibleForPictureInPicture
{
  return self->_isEligibleForPictureInPicture;
}

@end
@interface TVHURLHandler
+ (id)_displayMediaEntityViewControllerForOpenURL:(id)a3 mediaLibrary:(id)a4;
+ (id)_playMediaEntityViewControllerForOpenURL:(id)a3 mediaLibrary:(id)a4;
+ (id)viewControllersForURL:(id)a3 mediaLibrary:(id)a4;
@end

@implementation TVHURLHandler

+ (id)viewControllersForURL:(id)a3 mediaLibrary:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 action];
  if (v8 == (id)3)
  {
    v9 = -[TVHScreenSaverPickerViewController initWithMediaLibrary:]( objc_alloc(&OBJC_CLASS___TVHScreenSaverPickerViewController),  "initWithMediaLibrary:",  v7);
    v18 = v9;
    id v13 = (id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v18, 1LL));
LABEL_14:

    goto LABEL_16;
  }

  if (v8 == (id)2)
  {
    v9 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    v10 = -[TVHMediaLibraryViewController initWithMediaLibrary:]( objc_alloc(&OBJC_CLASS___TVHMediaLibraryViewController),  "initWithMediaLibrary:",  v7);
    -[TVHScreenSaverPickerViewController addObject:](v9, "addObject:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue([a1 _displayMediaEntityViewControllerForOpenURL:v6 mediaLibrary:v7]);
    if (v11) {
      -[TVHScreenSaverPickerViewController addObject:](v9, "addObject:", v11);
    }
    id v13 = -[TVHScreenSaverPickerViewController copy](v9, "copy");
    goto LABEL_13;
  }

  if (v8 == (id)1)
  {
    v9 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    v10 = -[TVHMediaLibraryViewController initWithMediaLibrary:]( objc_alloc(&OBJC_CLASS___TVHMediaLibraryViewController),  "initWithMediaLibrary:",  v7);
    -[TVHScreenSaverPickerViewController addObject:](v9, "addObject:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue([a1 _displayMediaEntityViewControllerForOpenURL:v6 mediaLibrary:v7]);
    if (v11) {
      -[TVHScreenSaverPickerViewController addObject:](v9, "addObject:", v11);
    }
    v12 = (void *)objc_claimAutoreleasedReturnValue([a1 _playMediaEntityViewControllerForOpenURL:v6 mediaLibrary:v7]);
    if (v12) {
      -[TVHScreenSaverPickerViewController addObject:](v9, "addObject:", v12);
    }
    id v13 = -[TVHScreenSaverPickerViewController copy](v9, "copy");

LABEL_13:
    goto LABEL_14;
  }

  id v13 = 0LL;
LABEL_16:
  if (![v13 count])
  {
    v14 = -[TVHMediaLibraryViewController initWithMediaLibrary:]( objc_alloc(&OBJC_CLASS___TVHMediaLibraryViewController),  "initWithMediaLibrary:",  v7);
    v17 = v14;
    uint64_t v15 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v17, 1LL));

    id v13 = (id)v15;
  }

  return v13;
}

+ (id)_displayMediaEntityViewControllerForOpenURL:(id)a3 mediaLibrary:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  switch((unint64_t)[v5 mediaCategoryType])
  {
    case 0uLL:
      id v7 = sub_10007A158();
      id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        sub_10009C658((uint64_t)v5, v8, v9, v10, v11, v12, v13, v14);
      }
      goto LABEL_30;
    case 1uLL:
      id v15 = [v5 displayType];
      if (!v15)
      {
        id v23 = sub_10007A158();
        id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
          sub_10009C5C8((uint64_t)v5, v8, v24, v25, v26, v27, v28, v29);
        }
LABEL_30:

        goto LABEL_31;
      }

      if (v15 == (id)2)
      {
        v16 = (void *)objc_claimAutoreleasedReturnValue([v5 albumArtistIdentifier]);
        if (v16)
        {
          v17 = -[TVHMusicAlbumArtistLookupViewController initWithAlbumArtistIdentifier:mediaLibrary:]( objc_alloc(&OBJC_CLASS___TVHMusicAlbumArtistLookupViewController),  "initWithAlbumArtistIdentifier:mediaLibrary:",  v16,  v6);
          goto LABEL_25;
        }

+ (id)_playMediaEntityViewControllerForOpenURL:(id)a3 mediaLibrary:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  switch((unint64_t)[v5 mediaCategoryType])
  {
    case 0uLL:
      id v7 = sub_10007A158();
      id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        sub_10009C658((uint64_t)v5, v8, v9, v10, v11, v12, v13, v14);
      }
      goto LABEL_26;
    case 1uLL:
      id v15 = (void *)objc_claimAutoreleasedReturnValue([v5 albumIdentifier]);
      if (!v15) {
        goto LABEL_16;
      }
      v16 = -[TVHMediaItemsFetchPlaybackViewController initWithMediaLibrary:mediaCategoryType:mediaEntityCollectionType:mediaEntityCollectionIdentifier:]( objc_alloc(&OBJC_CLASS___TVHMediaItemsFetchPlaybackViewController),  "initWithMediaLibrary:mediaCategoryType:mediaEntityCollectionType:mediaEntityCollectionIdentifier:",  v6,  1LL,  1LL,  v15);
      goto LABEL_15;
    case 2uLL:
      id v15 = (void *)objc_claimAutoreleasedReturnValue([v5 mediaItemIdentifier]);
      if (!v15) {
        goto LABEL_16;
      }
      v17 = objc_alloc(&OBJC_CLASS___TVHMediaItemsFetchPlaybackViewController);
      id v18 = v6;
      uint64_t v19 = 2LL;
      goto LABEL_14;
    case 3uLL:
      id v15 = (void *)objc_claimAutoreleasedReturnValue([v5 mediaItemIdentifier]);
      if (!v15) {
        goto LABEL_16;
      }
      v17 = objc_alloc(&OBJC_CLASS___TVHMediaItemsFetchPlaybackViewController);
      id v18 = v6;
      uint64_t v19 = 3LL;
      goto LABEL_14;
    case 4uLL:
      id v20 = sub_10007A158();
      id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        sub_10009C76C();
      }
      goto LABEL_26;
    case 5uLL:
      id v15 = (void *)objc_claimAutoreleasedReturnValue([v5 mediaItemIdentifier]);
      if (v15)
      {
        v17 = objc_alloc(&OBJC_CLASS___TVHMediaItemsFetchPlaybackViewController);
        id v18 = v6;
        uint64_t v19 = 5LL;
LABEL_14:
        v16 = -[TVHMediaItemsFetchPlaybackViewController initWithMediaLibrary:mediaCategoryType:mediaItemIdentifier:]( v17,  "initWithMediaLibrary:mediaCategoryType:mediaItemIdentifier:",  v18,  v19,  v15);
LABEL_15:
        id v21 = v16;
      }

      else
      {
LABEL_16:
        id v21 = 0LL;
      }

      goto LABEL_28;
    case 6uLL:
      id v22 = sub_10007A158();
      id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        sub_10009C740();
      }
      goto LABEL_26;
    case 7uLL:
      id v23 = sub_10007A158();
      id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        sub_10009C6E8();
      }
      goto LABEL_26;
    case 8uLL:
      id v24 = sub_10007A158();
      id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        sub_10009C6BC();
      }
      goto LABEL_26;
    case 9uLL:
      id v25 = sub_10007A158();
      id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        sub_10009C714();
      }
LABEL_26:

      goto LABEL_27;
    default:
LABEL_27:
      id v21 = 0LL;
LABEL_28:

      return v21;
  }

@end
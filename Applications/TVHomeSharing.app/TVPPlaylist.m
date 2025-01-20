@interface TVPPlaylist
- (NSString)tvh_currentMediaItemTitle;
- (void)tvh_enumeratePlayerMediaItemsWithBlock:(id)a3;
- (void)tvh_playItemsNext:(id)a3;
- (void)tvh_playMediaItemsLast:(id)a3 mediaLibrary:(id)a4;
- (void)tvh_playMediaItemsNext:(id)a3 mediaLibrary:(id)a4;
- (void)tvh_updateMediaItemsAllowsDiskCaching:(BOOL)a3;
@end

@implementation TVPPlaylist

- (NSString)tvh_currentMediaItemTitle
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVPPlaylist currentMediaItem](self, "currentMediaItem"));
  uint64_t v3 = objc_opt_class(&OBJC_CLASS___TVHKPlayerMediaItem);
  id v4 = v2;
  v5 = v4;
  if (v3)
  {
    if ((objc_opt_isKindOfClass(v4, v3) & 1) != 0) {
      v6 = v5;
    }
    else {
      v6 = 0LL;
    }
  }

  else
  {
    v6 = 0LL;
  }

  id v7 = v6;

  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 mediaItem]);
  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 title]);

  return (NSString *)v9;
}

- (void)tvh_playItemsNext:(id)a3
{
  id v4 = a3;
  v5 = (char *)-[TVPPlaylist activeListIndex](self, "activeListIndex");
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVPPlaylist activeList](self, "activeList"));
  id v7 = (char *)[v6 count];

  if (v5 + 1 < v7) {
    v8 = v5 + 1;
  }
  else {
    v8 = v7;
  }
  id v9 = (id)objc_claimAutoreleasedReturnValue( +[NSIndexSet indexSetWithIndexesInRange:]( NSIndexSet,  "indexSetWithIndexesInRange:",  v8,  [v4 count]));
  -[TVPPlaylist insertItems:atIndexes:](self, "insertItems:atIndexes:", v4, v9);
}

- (void)tvh_playMediaItemsNext:(id)a3 mediaLibrary:(id)a4
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_100003DD0;
  v5[3] = &unk_1000FCDB8;
  v5[4] = self;
  id v6 = (id)objc_claimAutoreleasedReturnValue( +[TVHMediaEntityUtilities playerMediaItemsForMediaItems:mediaLibrary:]( &OBJC_CLASS___TVHMediaEntityUtilities,  "playerMediaItemsForMediaItems:mediaLibrary:",  a3,  a4));
  id v4 = v6;
  dispatch_async(&_dispatch_main_q, v5);
}

- (void)tvh_playMediaItemsLast:(id)a3 mediaLibrary:(id)a4
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_100003E64;
  v5[3] = &unk_1000FCDB8;
  v5[4] = self;
  id v6 = (id)objc_claimAutoreleasedReturnValue( +[TVHMediaEntityUtilities playerMediaItemsForMediaItems:mediaLibrary:]( &OBJC_CLASS___TVHMediaEntityUtilities,  "playerMediaItemsForMediaItems:mediaLibrary:",  a3,  a4));
  id v4 = v6;
  dispatch_async(&_dispatch_main_q, v5);
}

- (void)tvh_updateMediaItemsAllowsDiskCaching:(BOOL)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_100003EC0;
  v3[3] = &unk_1000FCDD8;
  BOOL v4 = a3;
  -[TVPPlaylist tvh_enumeratePlayerMediaItemsWithBlock:](self, "tvh_enumeratePlayerMediaItemsWithBlock:", v3);
}

- (void)tvh_enumeratePlayerMediaItemsWithBlock:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVPPlaylist activeList](self, "activeList"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100003F5C;
  v7[3] = &unk_1000FCE00;
  id v8 = v4;
  id v6 = v4;
  [v5 enumerateObjectsUsingBlock:v7];
}

@end
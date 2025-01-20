@interface MTTVPlaylist
- (BOOL)dummyTrackCreatedButNotInList;
- (BOOL)dummyTrackList;
- (BOOL)moreItemsAvailable:(int64_t)a3;
- (BOOL)shuffleEnabled;
- (BOOL)supportsRepeat;
- (BOOL)supportsShuffle;
- (IMPlayerManifest)manifest;
- (MTTVPlaylist)initWithManifest:(id)a3;
- (NSArray)activeList;
- (NSArray)trackList;
- (id)currentMediaItem;
- (id)name;
- (id)nextMediaItem;
- (id)previousMediaItem;
- (id)upcomingItems;
- (int64_t)repeatMode;
- (unint64_t)activeListIndex;
- (unint64_t)count;
- (unint64_t)currentIndex;
- (unint64_t)currentManifestIndex;
- (void)_reloadManifest;
- (void)dealloc;
- (void)setDummyTrackCreatedButNotInList:(BOOL)a3;
- (void)setDummyTrackList:(BOOL)a3;
- (void)setManifest:(id)a3;
- (void)setTrackList:(id)a3;
@end

@implementation MTTVPlaylist

- (MTTVPlaylist)initWithManifest:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___MTTVPlaylist;
  v5 = -[MTTVPlaylist init](&v14, "init");
  v6 = v5;
  if (v5)
  {
    -[MTTVPlaylist setManifest:](v5, "setManifest:", v4);
    -[MTTVPlaylist setEndAction:](v6, "setEndAction:", 0LL);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    uint64_t v8 = IMPlayerManifestDidChange;
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVPlaylist manifest](v6, "manifest"));
    [v7 addObserver:v6 selector:"_reloadManifest" name:v8 object:v9];

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    uint64_t v11 = IMPlayerManifestCurrentItemDidChange;
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVPlaylist manifest](v6, "manifest"));
    [v10 addObserver:v6 selector:"_currentItemDidChange" name:v11 object:v12];

    -[MTTVPlaylist _reloadManifest](v6, "_reloadManifest");
  }

  return v6;
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___MTTVPlaylist;
  -[MTTVPlaylist dealloc](&v4, "dealloc");
}

- (BOOL)moreItemsAvailable:(int64_t)a3
{
  if (a3 == 1)
  {
    objc_super v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVPlaylist manifest](self, "manifest"));
    unsigned __int8 v5 = [v4 hasPrevious];
    goto LABEL_5;
  }

  if (!a3)
  {
    objc_super v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVPlaylist manifest](self, "manifest"));
    unsigned __int8 v5 = [v4 hasNext];
LABEL_5:
    unsigned __int8 v3 = v5;
  }

  return v3 & 1;
}

- (id)currentMediaItem
{
  unint64_t v3 = -[MTTVPlaylist activeListIndex](self, "activeListIndex");
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVPlaylist activeList](self, "activeList"));
  id v5 = [v4 count];

  if (v3 >= (unint64_t)v5)
  {
    v7 = 0LL;
  }

  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVPlaylist activeList](self, "activeList"));
    v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectAtIndexedSubscript:v3]);
  }

  return v7;
}

- (id)nextMediaItem
{
  unint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVPlaylist manifest](self, "manifest"));
  [v3 next];

  return -[MTTVPlaylist currentMediaItem](self, "currentMediaItem");
}

- (id)previousMediaItem
{
  unint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVPlaylist manifest](self, "manifest"));
  [v3 previous];

  return -[MTTVPlaylist currentMediaItem](self, "currentMediaItem");
}

- (unint64_t)currentIndex
{
  return -[MTTVPlaylist activeListIndex](self, "activeListIndex") + 1;
}

- (unint64_t)count
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVPlaylist manifest](self, "manifest"));
  id v3 = [v2 count];

  return (unint64_t)v3;
}

- (NSArray)activeList
{
  return -[MTTVPlaylist trackList](self, "trackList");
}

- (unint64_t)activeListIndex
{
  unint64_t result = -[MTTVPlaylist currentManifestIndex](self, "currentManifestIndex");
  if (result == 0x7FFFFFFFFFFFFFFFLL) {
    return 0LL;
  }
  return result;
}

- (id)upcomingItems
{
  return -[MTTVPlaylist trackList](self, "trackList");
}

- (NSArray)trackList
{
  if (-[MTTVPlaylist dummyTrackCreatedButNotInList](self, "dummyTrackCreatedButNotInList"))
  {
    id v3 = (void *)objc_claimAutoreleasedReturnValue(+[IMLogger sharedLogger](&OBJC_CLASS___IMLogger, "sharedLogger"));
    [v3 logFile:"/Library/Caches/com.apple.xbs/Sources/Marmoset/Source/ATV/Playback/MTTVPlaylist.m" lineNumber:131 format:@"tracklist is not yet loaded"];

    trackList = self->_trackList;
    if (!trackList) {
      trackList = (NSArray *)&__NSArray0__struct;
    }
  }

  else
  {
    if (!self->_trackList
      || -[MTTVPlaylist dummyTrackList](self, "dummyTrackList")
      && (id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVPlaylist manifest](self, "manifest")),
          id v6 = [v5 count],
          v5,
          v6))
    {
      v7 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVPlaylist manifest](self, "manifest"));
      id v9 = [v8 count];

      if (v9)
      {
        unint64_t v10 = 0LL;
        do
        {
          uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVPlaylist manifest](self, "manifest"));
          v12 = (void *)objc_claimAutoreleasedReturnValue([v11 objectAtIndex:v10]);

          v13 = -[MTTVMediaItem initWithMediaItem:](objc_alloc(&OBJC_CLASS___MTTVMediaItem), "initWithMediaItem:", v12);
          -[NSMutableArray addObject:](v7, "addObject:", v13);

          ++v10;
          objc_super v14 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVPlaylist manifest](self, "manifest"));
          id v15 = [v14 count];
        }

        while (v10 < (unint64_t)v15);
      }

      if (-[NSMutableArray count](v7, "count"))
      {
        -[MTTVPlaylist setDummyTrackList:](self, "setDummyTrackList:", 0LL);
      }

      else
      {
        -[MTTVPlaylist setDummyTrackCreatedButNotInList:](self, "setDummyTrackCreatedButNotInList:", 1LL);
        id v16 = objc_alloc(&OBJC_CLASS___TVPURLMediaItem);
        v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", @"http://localhost"));
        id v18 = [v16 initWithURL:v17 traits:0];

        -[NSMutableArray addObject:](v7, "addObject:", v18);
        -[MTTVPlaylist setDummyTrackList:](self, "setDummyTrackList:", 1LL);
      }

      id v19 = -[NSMutableArray copy](v7, "copy");
      -[MTTVPlaylist setTrackList:](self, "setTrackList:", v19);

      -[MTTVPlaylist setDummyTrackCreatedButNotInList:](self, "setDummyTrackCreatedButNotInList:", 0LL);
    }

    trackList = self->_trackList;
  }

  return trackList;
}

- (id)name
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVPlaylist manifest](self, "manifest"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 title]);

  return v3;
}

- (BOOL)shuffleEnabled
{
  return 0;
}

- (BOOL)supportsShuffle
{
  return 0;
}

- (BOOL)supportsRepeat
{
  return 0;
}

- (int64_t)repeatMode
{
  return 0LL;
}

- (void)_reloadManifest
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100016844;
  block[3] = &unk_10023FF98;
  block[4] = self;
  dispatch_async(&_dispatch_main_q, block);
}

- (unint64_t)currentManifestIndex
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVPlaylist manifest](self, "manifest"));
  id v3 = [v2 currentIndex];

  return (unint64_t)v3;
}

- (void)setTrackList:(id)a3
{
}

- (IMPlayerManifest)manifest
{
  return self->_manifest;
}

- (void)setManifest:(id)a3
{
}

- (BOOL)dummyTrackList
{
  return self->_dummyTrackList;
}

- (void)setDummyTrackList:(BOOL)a3
{
  self->_dummyTrackList = a3;
}

- (BOOL)dummyTrackCreatedButNotInList
{
  return self->_dummyTrackCreatedButNotInList;
}

- (void)setDummyTrackCreatedButNotInList:(BOOL)a3
{
  self->_dummyTrackCreatedButNotInList = a3;
}

- (void).cxx_destruct
{
}

@end
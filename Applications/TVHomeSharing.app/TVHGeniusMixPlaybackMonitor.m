@interface TVHGeniusMixPlaybackMonitor
+ (id)sharedInstance;
- (TVHKAsynchronousWorkToken)fetchRequestWorkToken;
- (TVHKMediaEntitiesFetchRequest)fetchRequest;
- (TVHKMediaLibrary)mediaLibrary;
- (TVPPlayback)player;
- (unint64_t)monitorToken;
- (void)_handleCurrentPlaybackMediaItemDidChangeNotification:(id)a3;
- (void)_handleFetchResponse:(id)a3 player:(id)a4;
- (void)_handleMediaServerConnectionStateDidChangeNotification:(id)a3;
- (void)_handlePlaybackStateDidChangeNotification:(id)a3;
- (void)_startObservingMediaServer:(id)a3;
- (void)_stop;
- (void)_stopObservingMediaServer:(id)a3;
- (void)dealloc;
- (void)setFetchRequest:(id)a3;
- (void)setFetchRequestWorkToken:(id)a3;
- (void)setMediaLibrary:(id)a3;
- (void)setMonitorToken:(unint64_t)a3;
- (void)setPlayer:(id)a3;
- (void)startMonitoringPlaybackWithPlayer:(id)a3 fetchRequest:(id)a4 mediaLibrary:(id)a5;
@end

@implementation TVHGeniusMixPlaybackMonitor

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10000D388;
  block[3] = &unk_1000FD0E8;
  block[4] = a1;
  if (qword_100157288 != -1) {
    dispatch_once(&qword_100157288, block);
  }
  return (id)qword_100157280;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___TVHGeniusMixPlaybackMonitor;
  -[TVHGeniusMixPlaybackMonitor dealloc](&v3, "dealloc");
}

- (void)startMonitoringPlaybackWithPlayer:(id)a3 fetchRequest:(id)a4 mediaLibrary:(id)a5
{
  id v10 = a5;
  id v8 = a4;
  id v9 = a3;
  -[TVHGeniusMixPlaybackMonitor _stop](self, "_stop");
  -[TVHGeniusMixPlaybackMonitor setPlayer:](self, "setPlayer:", v9);

  -[TVHGeniusMixPlaybackMonitor setFetchRequest:](self, "setFetchRequest:", v8);
  -[TVHGeniusMixPlaybackMonitor setMediaLibrary:](self, "setMediaLibrary:", v10);
}

- (void)_handleMediaServerConnectionStateDidChangeNotification:(id)a3
{
  id v6 = (id)objc_claimAutoreleasedReturnValue([a3 userInfo]);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "tvhk_numberForKey:", TVHKMediaLibraryConnectionStateUserInfoKeyToState));
  id v5 = [v4 unsignedIntegerValue];

  if (v5 != (id)2) {
    -[TVHGeniusMixPlaybackMonitor _stop](self, "_stop");
  }
}

- (void)_handlePlaybackStateDidChangeNotification:(id)a3
{
  v4 = (void *)objc_claimAutoreleasedReturnValue([a3 userInfo]);
  id v7 = (id)objc_claimAutoreleasedReturnValue([v4 objectForKey:TVPPlaybackStateNewStateKey]);

  id v5 = (id)objc_claimAutoreleasedReturnValue(+[TVPPlaybackState stopped](&OBJC_CLASS___TVPPlaybackState, "stopped"));
  id v6 = v7;
  if (v7 == v5)
  {
    -[TVHGeniusMixPlaybackMonitor _stop](self, "_stop");
    id v6 = v7;
  }
}

- (void)_handleCurrentPlaybackMediaItemDidChangeNotification:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVHGeniusMixPlaybackMonitor fetchRequestWorkToken](self, "fetchRequestWorkToken"));

  if (!v5)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 object]);
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 playlist]);
    id v8 = [v7 activeListIndex];

    id v9 = (void *)objc_claimAutoreleasedReturnValue([v6 playlist]);
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 activeList]);
    unint64_t v11 = (unint64_t)[v10 count];

    if ((unint64_t)v8 >= v11 >> 1)
    {
      v12 = -[TVHGeniusMixPlaybackMonitor monitorToken](self, "monitorToken");
      objc_initWeak(&location, self);
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[TVHGeniusMixPlaybackMonitor mediaLibrary](self, "mediaLibrary"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[TVHGeniusMixPlaybackMonitor fetchRequest](self, "fetchRequest"));
      v24 = v14;
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v24, 1LL));
      v17 = _NSConcreteStackBlock;
      uint64_t v18 = 3221225472LL;
      v19 = sub_10000D780;
      v20 = &unk_1000FD138;
      objc_copyWeak(v22, &location);
      v22[1] = v12;
      id v21 = v6;
      v16 = (void *)objc_claimAutoreleasedReturnValue([v13 enqueueFetchRequests:v15 completionHandler:&v17]);

      -[TVHGeniusMixPlaybackMonitor setFetchRequestWorkToken:]( self,  "setFetchRequestWorkToken:",  v16,  v17,  v18,  v19,  v20);
      objc_destroyWeak(v22);
      objc_destroyWeak(&location);
    }
  }
}

- (void)_handleFetchResponse:(id)a3 player:(id)a4
{
  id v23 = a4;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([a3 mediaEntitiesResult]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 mediaEntities]);

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVHGeniusMixPlaybackMonitor mediaLibrary](self, "mediaLibrary"));
  uint64_t v9 = TVHKPlayerMediaItemsForMediaItems(v7, v8);
  id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);

  id v11 = [v10 count];
  if (v11)
  {
    int64_t v12 = (int64_t)v11;
    v13 = (void *)objc_claimAutoreleasedReturnValue([v23 playlist]);
    v14 = (void *)objc_claimAutoreleasedReturnValue([v13 activeList]);
    id v15 = [v14 count];

    if (((unint64_t)v15 + v12) >> 3 >= 0x271)
    {
      uint64_t v16 = v12 - 1;
      v17 = (void *)objc_claimAutoreleasedReturnValue([v23 playlist]);
      uint64_t v18 = (char *)[v17 activeListIndex];

      else {
        uint64_t v19 = v16;
      }
      if ((v19 & 0x8000000000000000LL) == 0)
      {
        v20 = -[NSIndexSet initWithIndexesInRange:]( objc_alloc(&OBJC_CLASS___NSIndexSet),  "initWithIndexesInRange:",  0LL,  v19 + 1);
        id v21 = (void *)objc_claimAutoreleasedReturnValue([v23 playlist]);
        [v21 removeItemsAtIndexes:v20];
      }
    }

    v22 = (void *)objc_claimAutoreleasedReturnValue([v23 playlist]);
    [v22 addItems:v10];
  }
}

- (void)setPlayer:(id)a3
{
  id v5 = (TVPPlayback *)a3;
  p_player = &self->_player;
  if (self->_player != v5)
  {
    uint64_t v9 = v5;
    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    id v8 = v7;
    if (*p_player)
    {
      objc_msgSend(v7, "removeObserver:name:object:", self, TVPPlaybackCurrentMediaItemDidChangeNotification);
      [v8 removeObserver:self name:TVPPlaybackStateDidChangeNotification object:self->_player];
    }

    objc_storeStrong((id *)&self->_player, a3);
    if (*p_player)
    {
      objc_msgSend( v8,  "addObserver:selector:name:object:",  self,  "_handleCurrentPlaybackMediaItemDidChangeNotification:",  TVPPlaybackCurrentMediaItemDidChangeNotification);
      [v8 addObserver:self selector:"_handlePlaybackStateDidChangeNotification:" name:TVPPlaybackStateDidChangeNotification object:self->_player];
    }

    id v5 = v9;
  }
}

- (void)setMediaLibrary:(id)a3
{
  id v5 = (TVHKMediaLibrary *)a3;
  mediaLibrary = self->_mediaLibrary;
  id v7 = v5;
  if (mediaLibrary != v5)
  {
    if (mediaLibrary) {
      -[TVHGeniusMixPlaybackMonitor _stopObservingMediaServer:](self, "_stopObservingMediaServer:");
    }
    objc_storeStrong((id *)&self->_mediaLibrary, a3);
    if (self->_mediaLibrary) {
      -[TVHGeniusMixPlaybackMonitor _startObservingMediaServer:](self, "_startObservingMediaServer:");
    }
  }
}

- (void)setFetchRequest:(id)a3
{
  if (self->_fetchRequest != a3)
  {
    id v4 = (TVHKMediaEntitiesFetchRequest *)[a3 copy];
    fetchRequest = self->_fetchRequest;
    self->_fetchRequest = v4;

    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVHKMediaEntitiesFetchRequest options](self->_fetchRequest, "options"));
    id v7 = [v6 mutableCopy];

    [v7 removeObjectForKey:TVHKMediaEntitiesFetchRequestOptionGeniusMixMakeNewContext];
    -[TVHKMediaEntitiesFetchRequest setOptions:](self->_fetchRequest, "setOptions:", v7);
  }

- (void)_startObservingMediaServer:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v5 addObserver:self selector:"_handleMediaServerConnectionStateDidChangeNotification:" name:TVHKMediaLibraryConnectionStateDidChangeNotification object:v4];
}

- (void)_stopObservingMediaServer:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v5 removeObserver:self name:TVHKMediaLibraryConnectionStateDidChangeNotification object:v4];
}

- (void)_stop
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVHGeniusMixPlaybackMonitor fetchRequestWorkToken](self, "fetchRequestWorkToken"));
  [v3 cancel];

  -[TVHGeniusMixPlaybackMonitor setPlayer:](self, "setPlayer:", 0LL);
  -[TVHGeniusMixPlaybackMonitor setFetchRequest:](self, "setFetchRequest:", 0LL);
  -[TVHGeniusMixPlaybackMonitor setFetchRequestWorkToken:](self, "setFetchRequestWorkToken:", 0LL);
  -[TVHGeniusMixPlaybackMonitor setMediaLibrary:](self, "setMediaLibrary:", 0LL);
}

- (TVPPlayback)player
{
  return self->_player;
}

- (TVHKMediaLibrary)mediaLibrary
{
  return self->_mediaLibrary;
}

- (TVHKMediaEntitiesFetchRequest)fetchRequest
{
  return self->_fetchRequest;
}

- (TVHKAsynchronousWorkToken)fetchRequestWorkToken
{
  return self->_fetchRequestWorkToken;
}

- (void)setFetchRequestWorkToken:(id)a3
{
}

- (unint64_t)monitorToken
{
  return self->_monitorToken;
}

- (void)setMonitorToken:(unint64_t)a3
{
  self->_monitorToken = a3;
}

- (void).cxx_destruct
{
}

@end
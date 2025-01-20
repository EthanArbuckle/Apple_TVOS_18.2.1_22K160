@interface MRDPlaybackQueue
- (MRDPlaybackQueue)initWithPlaybackQueue:(id)a3;
- (MRDPlaybackQueueArtworkCache)artworkCache;
- (MRPlaybackQueue)playbackQueue;
- (id)createPlaybackQueueForRequest:(id)a3 cachingPolicy:(unsigned int)a4 playerPath:(id)a5 partiallyCachedItems:(id *)a6 capabilities:(unint64_t)a7;
- (id)debugDescription;
- (void)clearArtwork;
- (void)clearArtworkForContentItems:(id)a3;
- (void)setArtworkCache:(id)a3;
- (void)updatePlaybackQueueWithContentItems:(id)a3 fromRequest:(id)a4;
@end

@implementation MRDPlaybackQueue

- (MRDPlaybackQueue)initWithPlaybackQueue:(id)a3
{
  id v5 = a3;
  v20.receiver = self;
  v20.super_class = (Class)&OBJC_CLASS___MRDPlaybackQueue;
  v6 = -[MRDPlaybackQueue init](&v20, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_playbackQueue, a3);
    v8 = objc_alloc_init(&OBJC_CLASS___MRDPlaybackQueueArtworkCache);
    artworkCache = v7->_artworkCache;
    v7->_artworkCache = v8;

    __int128 v18 = 0u;
    __int128 v19 = 0u;
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MRPlaybackQueue contentItems](v7->_playbackQueue, "contentItems", 0LL));
    id v11 = [v10 countByEnumeratingWithState:&v16 objects:v21 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v17;
      do
      {
        v14 = 0LL;
        do
        {
          if (*(void *)v17 != v13) {
            objc_enumerationMutation(v10);
          }
          -[MRDPlaybackQueueArtworkCache addArtworkFromItem:fromRequest:]( v7->_artworkCache,  "addArtworkFromItem:fromRequest:",  *(void *)(*((void *)&v16 + 1) + 8LL * (void)v14),  0LL);
          v14 = (char *)v14 + 1;
        }

        while (v12 != v14);
        id v12 = [v10 countByEnumeratingWithState:&v16 objects:v21 count:16];
      }

      while (v12);
    }
  }

  return v7;
}

- (id)debugDescription
{
  v3 = -[NSMutableString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSMutableString),  "initWithFormat:",  @"<%@:%p {\n",  objc_opt_class(self),  self);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MRPlaybackQueue mr_formattedDebugDescription](self->_playbackQueue, "mr_formattedDebugDescription"));
  -[NSMutableString appendFormat:](v3, "appendFormat:", @"  playbackQueue = %@\n", v4);

  id v5 = (void *)objc_claimAutoreleasedReturnValue( -[MRDPlaybackQueueArtworkCache mr_formattedDebugDescription]( self->_artworkCache,  "mr_formattedDebugDescription"));
  -[NSMutableString appendFormat:](v3, "appendFormat:", @"  artworkCache = %@\n", v5);

  -[NSMutableString appendFormat:](v3, "appendFormat:", @"}>");
  return v3;
}

- (void)updatePlaybackQueueWithContentItems:(id)a3 fromRequest:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  __int128 v34 = 0u;
  __int128 v35 = 0u;
  __int128 v36 = 0u;
  __int128 v37 = 0u;
  id v8 = [v6 countByEnumeratingWithState:&v34 objects:v38 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v35;
    do
    {
      for (i = 0LL; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v35 != v10) {
          objc_enumerationMutation(v6);
        }
        id v12 = *(void **)(*((void *)&v34 + 1) + 8LL * (void)i);
        playbackQueue = self->_playbackQueue;
        v14 = (void *)objc_claimAutoreleasedReturnValue([v12 identifier]);
        v15 = (void *)objc_claimAutoreleasedReturnValue(-[MRPlaybackQueue contentItemForIdentifier:](playbackQueue, "contentItemForIdentifier:", v14));

        if (v15) {
          -[MRDPlaybackQueueArtworkCache addArtworkFromItem:fromRequest:]( self->_artworkCache,  "addArtworkFromItem:fromRequest:",  v12,  v7);
        }
      }

      id v9 = [v6 countByEnumeratingWithState:&v34 objects:v38 count:16];
    }

    while (v9);
  }

  __int128 v16 = objc_alloc(&OBJC_CLASS___MRPlaybackQueue);
  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472LL;
  v32[2] = sub_100123878;
  v32[3] = &unk_1003A1980;
  id v17 = v7;
  id v33 = v17;
  __int128 v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "msv_map:", v32));
  __int128 v19 = -[MRPlaybackQueue initWithContentItems:](v16, "initWithContentItems:", v18);

  objc_super v20 = (void *)objc_claimAutoreleasedReturnValue(-[MRPlaybackQueue contentItems](v19, "contentItems"));
  v21 = (void *)objc_claimAutoreleasedReturnValue([v20 firstObject]);
  v22 = (void *)objc_claimAutoreleasedReturnValue([v21 metadata]);
  [v22 playbackRate];
  float v24 = v23;

  -[MRPlaybackQueue mergeFrom:](self->_playbackQueue, "mergeFrom:", v19);
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[MRPlaybackQueue contentItems](v19, "contentItems"));
  v26 = (void *)objc_claimAutoreleasedReturnValue([v25 firstObject]);
  v27 = (void *)objc_claimAutoreleasedReturnValue([v26 metadata]);
  [v27 playbackRate];
  float v29 = v28;

  if (v17)
  {
    v30 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(+[MRUserSettings currentSettings](&OBJC_CLASS___MRUserSettings, "currentSettings"));
    if (!-[dispatch_queue_s inconsistentPlaybackQueueCacheABC](v30, "inconsistentPlaybackQueueCacheABC"))
    {
LABEL_14:

      goto LABEL_15;
    }

    if ((float)(v24 - v29) > 0.00000011921)
    {
      dispatch_queue_global_t global_queue = dispatch_get_global_queue(-2LL, 0LL);
      v30 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
      dispatch_async(v30, &stru_1003A19A0);
      goto LABEL_14;
    }
  }

- (void)clearArtworkForContentItems:(id)a3
{
  id v4 = a3;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  id v5 = [v4 countByEnumeratingWithState:&v15 objects:v20 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v16;
    do
    {
      id v8 = 0LL;
      do
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v4);
        }
        playbackQueue = self->_playbackQueue;
        uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v15 + 1) + 8 * (void)v8) identifier]);
        id v11 = (void *)objc_claimAutoreleasedReturnValue(-[MRPlaybackQueue contentItemForIdentifier:](playbackQueue, "contentItemForIdentifier:", v10));

        if (v11)
        {
          id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 metadata]);
          [v12 setArtworkURLTemplates:0];

          [v11 setArtwork:0];
          [v11 setArtworks:0];
          [v11 setRemoteArtworks:0];
          artworkCache = self->_artworkCache;
          __int128 v19 = v11;
          v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  &v19,  1LL));
          -[MRDPlaybackQueueArtworkCache clearArtworkForItems:](artworkCache, "clearArtworkForItems:", v14);
        }

        id v8 = (char *)v8 + 1;
      }

      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v15 objects:v20 count:16];
    }

    while (v6);
  }
}

- (void)clearArtwork
{
  v3 = objc_alloc_init(&OBJC_CLASS___MRDPlaybackQueueArtworkCache);
  artworkCache = self->_artworkCache;
  self->_artworkCache = v3;
}

- (id)createPlaybackQueueForRequest:(id)a3 cachingPolicy:(unsigned int)a4 playerPath:(id)a5 partiallyCachedItems:(id *)a6 capabilities:(unint64_t)a7
{
  uint64_t v9 = *(void *)&a4;
  id v11 = a3;
  id v12 = a5;
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v11 requestByRemovingArtwork]);
  v46 = self;
  uint64_t v14 = MRPlaybackQueueCreateFromCache(self->_playbackQueue, v13, v9, v12);
  __int128 v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  if (v15)
  {
    if ([v11 includeArtwork])
    {
      v42 = a6;
      v39 = v13;
      id v40 = v12;
      __int128 v49 = 0u;
      __int128 v50 = 0u;
      __int128 v47 = 0u;
      __int128 v48 = 0u;
      id obj = (id)objc_claimAutoreleasedReturnValue(-[MRPlaybackQueue contentItems](v46->_playbackQueue, "contentItems"));
      id v16 = [obj countByEnumeratingWithState:&v47 objects:v54 count:16];
      if (v16)
      {
        id v17 = v16;
        int v41 = v9;
        v43 = 0LL;
        uint64_t v45 = *(void *)v48;
        uint64_t v18 = MRContentItemArtworkFormatStandard;
LABEL_5:
        uint64_t v19 = 0LL;
        while (1)
        {
          if (*(void *)v48 != v45) {
            objc_enumerationMutation(obj);
          }
          objc_super v20 = *(void **)(*((void *)&v47 + 1) + 8 * v19);
          v21 = (void *)objc_claimAutoreleasedReturnValue([v20 identifier]);
          v22 = (void *)objc_claimAutoreleasedReturnValue([v15 contentItemForIdentifier:v21]);

          float v23 = (void *)objc_claimAutoreleasedReturnValue([v20 metadata]);
          float v24 = (void *)objc_claimAutoreleasedReturnValue([v20 availableArtworkFormats]);
          id v25 = [v24 count];

          if (v25) {
            goto LABEL_11;
          }
LABEL_24:

          if (v17 == (id)++v19)
          {
            id v17 = [obj countByEnumeratingWithState:&v47 objects:v54 count:16];
            if (v17) {
              goto LABEL_5;
            }
            goto LABEL_30;
          }
        }

LABEL_11:
        v26 = (void *)objc_claimAutoreleasedReturnValue([v11 requestedArtworkFormats]);
        id v27 = [v26 count];

        if (v27)
        {
          float v28 = (void *)objc_claimAutoreleasedReturnValue([v11 requestedArtworkFormats]);
          uint64_t v53 = v18;
          float v29 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  &v53,  1LL));
          unsigned int v30 = [v28 isEqualToArray:v29];

          if (!v30) {
            goto LABEL_34;
          }
          v31 = (void *)objc_claimAutoreleasedReturnValue( -[MRDPlaybackQueueArtworkCache fittedArtworkDataForContentItem:withRequest:]( v46->_artworkCache,  "fittedArtworkDataForContentItem:withRequest:",  v20,  v11));
          id v32 = [[MRDataArtwork alloc] initWithImageData:v31];
          if (!v32)
          {

LABEL_34:
            id v37 = 0LL;
            goto LABEL_35;
          }

          id v33 = v32;
          uint64_t v51 = v18;
          id v52 = v32;
          __int128 v34 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v52,  &v51,  1LL));
          [v22 setArtworks:v34];
        }

        else
        {
          v31 = (void *)objc_claimAutoreleasedReturnValue( -[MRDPlaybackQueueArtworkCache fittedArtworkDataForContentItem:withRequest:]( v46->_artworkCache,  "fittedArtworkDataForContentItem:withRequest:",  v20,  v11));
          if (v31)
          {
            id v35 = [[MRArtwork alloc] initWithImageData:v31 height:0 width:0];
            [v22 setArtwork:v35];
          }

          else
          {
            if (v41 != 2) {
              goto LABEL_34;
            }
            if (v42)
            {
              __int128 v36 = v43;
              if (!v43) {
                __int128 v36 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
              }
            }

            else
            {
              __int128 v36 = v43;
            }

            v43 = v36;
            -[NSMutableArray addObject:](v36, "addObject:", v20);
          }
        }

        goto LABEL_24;
      }

      v43 = 0LL;
LABEL_30:

      if (v42) {
        id *v42 = v43;
      }
      id v37 = v15;
LABEL_35:
      uint64_t v13 = v39;
      id v12 = v40;
    }

    else
    {
      id v37 = v15;
    }
  }

  else
  {
    id v37 = 0LL;
  }

  return v37;
}

- (MRPlaybackQueue)playbackQueue
{
  return self->_playbackQueue;
}

- (MRDPlaybackQueueArtworkCache)artworkCache
{
  return self->_artworkCache;
}

- (void)setArtworkCache:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
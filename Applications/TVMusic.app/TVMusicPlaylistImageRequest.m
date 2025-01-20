@interface TVMusicPlaylistImageRequest
- (BOOL)isCancelled;
- (CGSize)scaleToSize;
- (NSArray)imageProxies;
- (NSString)playlistStyle;
- (TVMusicPlaylistImageRequest)initWithImageProxies:(id)a3 playlistStyle:(id)a4;
- (double)cornerRadius;
- (double)upscaleAdjustment;
- (id)completionHandler;
- (id)identifier;
- (void)loadImagesWithCompletionHandler:(id)a3;
- (void)setCancelled:(BOOL)a3;
- (void)setCompletionHandler:(id)a3;
- (void)setCornerRadius:(double)a3;
- (void)setScaleToSize:(CGSize)a3;
- (void)setUpscaleAdjustment:(double)a3;
@end

@implementation TVMusicPlaylistImageRequest

- (TVMusicPlaylistImageRequest)initWithImageProxies:(id)a3 playlistStyle:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___TVMusicPlaylistImageRequest;
  v8 = -[TVMusicPlaylistImageRequest init](&v14, "init");
  if (v8)
  {
    v9 = (NSArray *)[v6 copy];
    imageProxies = v8->_imageProxies;
    v8->_imageProxies = v9;

    v11 = (NSString *)[v7 copy];
    playlistStyle = v8->_playlistStyle;
    v8->_playlistStyle = v11;
  }

  return v8;
}

- (id)identifier
{
  v2 = self;
  objc_sync_enter(v2);
  requestIdentifier = v2->_requestIdentifier;
  if (!requestIdentifier)
  {
    v28 = v2;
    v4 = objc_alloc_init(&OBJC_CLASS___NSMutableString);
    __int128 v39 = 0u;
    __int128 v40 = 0u;
    __int128 v37 = 0u;
    __int128 v38 = 0u;
    obj = v2->_imageProxies;
    id v31 = -[NSArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v37,  v42,  16LL);
    if (v31)
    {
      uint64_t v30 = *(void *)v38;
      do
      {
        v32 = 0LL;
        do
        {
          if (*(void *)v38 != v30) {
            objc_enumerationMutation(obj);
          }
          id v6 = *(void **)(*((void *)&v37 + 1) + 8LL * (void)v32);
          uint64_t v7 = objc_opt_class(&OBJC_CLASS___NSArray, v5);
          if ((objc_opt_isKindOfClass(v6, v7) & 1) != 0)
          {
            id v8 = v6;
            __int128 v33 = 0u;
            __int128 v34 = 0u;
            __int128 v35 = 0u;
            __int128 v36 = 0u;
            id v9 = v8;
            id v10 = [v9 countByEnumeratingWithState:&v33 objects:v41 count:16];
            if (v10)
            {
              uint64_t v11 = *(void *)v34;
              do
              {
                v12 = 0LL;
                do
                {
                  if (*(void *)v34 != v11) {
                    objc_enumerationMutation(v9);
                  }
                  objc_super v14 = (void *)objc_claimAutoreleasedReturnValue([v13 absoluteString]);
                  v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v14 hash]));
                  v16 = (void *)objc_claimAutoreleasedReturnValue([v15 stringValue]);
                  -[NSMutableString appendFormat:](v4, "appendFormat:", @"%@", v16);

                  v12 = (char *)v12 + 1;
                }

                while (v10 != v12);
                id v10 = [v9 countByEnumeratingWithState:&v33 objects:v41 count:16];
              }

              while (v10);
            }

            v17 = v9;
          }

          else
          {
            v17 = (void *)objc_claimAutoreleasedReturnValue([v6 object]);
            id v9 = (id)objc_claimAutoreleasedReturnValue([v17 absoluteString]);
            v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v9 hash]));
            v19 = (void *)objc_claimAutoreleasedReturnValue([v18 stringValue]);
            -[NSMutableString appendFormat:](v4, "appendFormat:", @"%@", v19);
          }

          v32 = (char *)v32 + 1;
        }

        while (v32 != v31);
        id v31 = -[NSArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v37,  v42,  16LL);
      }

      while (v31);
    }

    id v20 = -[NSMutableString length](v4, "length");
    if ((unint64_t)[@"Playlist" length] + (void)v20 - 256 > 0xFFFFFFFFFFFFFEFELL)
    {
      uint64_t v25 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@_%@",  @"Playlist",  v4));
      v21 = v28->_requestIdentifier;
      v28->_requestIdentifier = (NSString *)v25;
    }

    else
    {
      v21 = (NSString *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  -[NSMutableString hash](v4, "hash")));
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[NSString stringValue](v21, "stringValue"));
      uint64_t v23 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@_%@",  @"Playlist",  v22));
      v24 = v28->_requestIdentifier;
      v28->_requestIdentifier = (NSString *)v23;
    }

    v2 = v28;
    requestIdentifier = v28->_requestIdentifier;
  }

  v26 = requestIdentifier;
  objc_sync_exit(v2);

  return v26;
}

- (void)loadImagesWithCompletionHandler:(id)a3
{
  v4 = (void (**)(id, void *))a3;
  val = self;
  id v5 = -[NSArray copy](self->_imageProxies, "copy");
  if (![v5 count]) {
    v4[2](v4, &__NSArray0__struct);
  }
  v19 = -[NSMutableDictionary initWithCapacity:]( [NSMutableDictionary alloc],  "initWithCapacity:",  [v5 count]);
  id v20 = -[NSMutableDictionary initWithCapacity:]( [NSMutableDictionary alloc],  "initWithCapacity:",  [v5 count]);
  v17 = v4;
  id v6 = [v4 copy];
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  id v7 = v5;
  id v8 = [v7 countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v30;
    do
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v30 != v9) {
          objc_enumerationMutation(v7);
        }
        uint64_t v11 = *(void **)(*((void *)&v29 + 1) + 8LL * (void)i);
        v12 = (void *)objc_claimAutoreleasedReturnValue([v11 object]);
        v13 = (void *)objc_claimAutoreleasedReturnValue([v12 absoluteString]);

        objc_initWeak(&location, val);
        v21[0] = _NSConcreteStackBlock;
        v21[1] = 3221225472LL;
        v21[2] = sub_100057428;
        v21[3] = &unk_10026B260;
        v22 = v20;
        objc_copyWeak(&v27, &location);
        id v14 = v13;
        id v23 = v14;
        v15 = v19;
        v24 = v15;
        id v16 = v7;
        id v25 = v16;
        id v26 = v6;
        [v11 setCompletionHandler:v21];
        -[NSMutableDictionary setObject:forKey:](v15, "setObject:forKey:", v11, v14);
        [v11 load];

        objc_destroyWeak(&v27);
        objc_destroyWeak(&location);
      }

      id v8 = [v16 countByEnumeratingWithState:&v29 objects:v33 count:16];
    }

    while (v8);
  }
}

- (NSArray)imageProxies
{
  return self->_imageProxies;
}

- (NSString)playlistStyle
{
  return self->_playlistStyle;
}

- (CGSize)scaleToSize
{
  double width = self->_scaleToSize.width;
  double height = self->_scaleToSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setScaleToSize:(CGSize)a3
{
  self->_scaleToSize = a3;
}

- (double)upscaleAdjustment
{
  return self->_upscaleAdjustment;
}

- (void)setUpscaleAdjustment:(double)a3
{
  self->_upscaleAdjustment = a3;
}

- (double)cornerRadius
{
  return self->_cornerRadius;
}

- (void)setCornerRadius:(double)a3
{
  self->_cornerRadius = a3;
}

- (BOOL)isCancelled
{
  return self->_cancelled;
}

- (void)setCancelled:(BOOL)a3
{
  self->_cancelled = a3;
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
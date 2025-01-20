@interface MRDPlaybackQueueArtworkCache
- (id)debugDescription;
- (id)fittedArtworkDataForContentItem:(id)a3 withRequest:(id)a4;
- (void)_pruneCache;
- (void)addArtworkFromItem:(id)a3 fromRequest:(id)a4;
- (void)clearArtworkForItems:(id)a3;
@end

@implementation MRDPlaybackQueueArtworkCache

- (void)addArtworkFromItem:(id)a3 fromRequest:(id)a4
{
  id v22 = a3;
  id v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue([v22 artworks]);
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:MRContentItemArtworkFormatStandard]);
  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 imageData]);

  if (v9
    || (v10 = (void *)objc_claimAutoreleasedReturnValue([v22 artwork]),
        v9 = (void *)objc_claimAutoreleasedReturnValue([v10 imageData]),
        v10,
        v9))
  {
    cache = self->_cache;
    v12 = (void *)objc_claimAutoreleasedReturnValue([v22 identifier]);
    v13 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( cache,  "objectForKeyedSubscript:",  v12));

    if (!v13)
    {
      v13 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
      v14 = self->_cache;
      if (!v14)
      {
        v15 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
        v16 = self->_cache;
        self->_cache = v15;

        v14 = self->_cache;
      }

      v17 = (void *)objc_claimAutoreleasedReturnValue([v22 identifier]);
      -[NSMutableDictionary setObject:forKeyedSubscript:](v14, "setObject:forKeyedSubscript:", v13, v17);
    }

    v18 = (void *)objc_claimAutoreleasedReturnValue([v6 artworkCacheSize]);
    v19 = v18;
    if (v18) {
      id v20 = v18;
    }
    else {
      id v20 = (id)objc_claimAutoreleasedReturnValue( +[MRDPlaybackQueueArtworkCacheSize defaultSize]( &OBJC_CLASS___MRDPlaybackQueueArtworkCacheSize,  "defaultSize"));
    }
    v21 = v20;

    -[NSMutableDictionary setObject:forKeyedSubscript:](v13, "setObject:forKeyedSubscript:", v9, v21);
    -[MRDPlaybackQueueArtworkCache _pruneCache](self, "_pruneCache");
  }
}

- (id)fittedArtworkDataForContentItem:(id)a3 withRequest:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  cache = self->_cache;
  v9 = (void *)objc_claimAutoreleasedReturnValue([v6 identifier]);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](cache, "objectForKeyedSubscript:", v9));
  v11 = (void *)objc_claimAutoreleasedReturnValue([v10 allKeys]);
  v12 = (void *)objc_claimAutoreleasedReturnValue([v11 sortedArrayUsingComparator:&stru_1003A19E0]);

  __int128 v42 = 0u;
  __int128 v43 = 0u;
  __int128 v40 = 0u;
  __int128 v41 = 0u;
  id v13 = v12;
  id v14 = [v13 countByEnumeratingWithState:&v40 objects:v44 count:16];
  if (v14)
  {
    id v15 = v14;
    v16 = 0LL;
    uint64_t v17 = *(void *)v41;
    do
    {
      for (i = 0LL; i != v15; i = (char *)i + 1)
      {
        if (*(void *)v41 != v17) {
          objc_enumerationMutation(v13);
        }
        v19 = *(void **)(*((void *)&v40 + 1) + 8LL * (void)i);
        objc_msgSend(v7, "artworkWidth", (void)v40);
        double v21 = v20;
        [v19 w];
        if (v21 <= v22 + 20.0)
        {
          [v7 artworkHeight];
          double v24 = v23;
          [v19 h];
          if (v24 <= v25 + 20.0)
          {
            id v26 = v19;

            v16 = v26;
          }
        }
      }

      id v15 = [v13 countByEnumeratingWithState:&v40 objects:v44 count:16];
    }

    while (v15);

    if (!v16)
    {
      v30 = 0LL;
      goto LABEL_20;
    }

    v27 = self->_cache;
    v28 = (void *)objc_claimAutoreleasedReturnValue([v6 identifier]);
    uint64_t v29 = objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v27, "objectForKeyedSubscript:", v28));
    v30 = (void *)objc_claimAutoreleasedReturnValue([(id)v29 objectForKeyedSubscript:v16]);

    v31 = (void *)objc_claimAutoreleasedReturnValue([v7 artworkCacheSize]);
    LOBYTE(v29) = [v16 isEqual:v31];

    if ((v29 & 1) == 0)
    {
      [v7 artworkWidth];
      double v33 = v32;
      [v7 artworkHeight];
      uint64_t v35 = objc_claimAutoreleasedReturnValue( +[MRImageUtilities resizeImageData:forFittingSize:error:]( &OBJC_CLASS___MRImageUtilities,  "resizeImageData:forFittingSize:error:",  v30,  0LL,  v33,  v34));
      v36 = (void *)v35;
      if (v35) {
        v37 = (void *)v35;
      }
      else {
        v37 = v30;
      }
      id v38 = v37;

      v30 = v38;
    }
  }

  else
  {
    v30 = 0LL;
    v16 = v13;
  }

LABEL_20:
  return v30;
}

- (void)clearArtworkForItems:(id)a3
{
  id v4 = a3;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  id v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      v8 = 0LL;
      do
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        cache = self->_cache;
        v10 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v11 + 1) + 8 * (void)v8) identifier]);
        -[NSMutableDictionary setObject:forKeyedSubscript:](cache, "setObject:forKeyedSubscript:", 0LL, v10);

        v8 = (char *)v8 + 1;
      }

      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }

    while (v6);
  }
}

- (void)_pruneCache
{
}

- (id)debugDescription
{
  v3 = -[NSMutableString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSMutableString),  "initWithFormat:",  @"<%@:%p> {\n",  objc_opt_class(self),  self);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary mr_formattedDebugDescription](self->_cache, "mr_formattedDebugDescription"));
  -[NSMutableString appendFormat:](v3, "appendFormat:", @"  cache = %@\n", v4);

  -[NSMutableString appendFormat:](v3, "appendFormat:", @"}");
  return v3;
}

- (void).cxx_destruct
{
}

@end
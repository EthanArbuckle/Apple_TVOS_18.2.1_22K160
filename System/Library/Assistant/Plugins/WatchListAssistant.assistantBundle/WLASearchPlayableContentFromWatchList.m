@interface WLASearchPlayableContentFromWatchList
- (void)performWithCompletion:(id)a3;
@end

@implementation WLASearchPlayableContentFromWatchList

- (void)performWithCompletion:(id)a3
{
  id v4 = a3;
  NSLog(@"WLASearchPlayableContentFromWatchList: Received search playable content request.");
  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472LL;
  v34[2] = __63__WLASearchPlayableContentFromWatchList_performWithCompletion___block_invoke;
  v34[3] = &unk_8400;
  id v5 = (id)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  id v35 = v5;
  id v6 = v4;
  id v36 = v6;
  v7 = objc_retainBlock(v34);
  if (!-[WLASearchPlayableContentFromWatchList onlyReturnNextItem](self, "onlyReturnNextItem"))
  {
    NSLog(@"WLASearchPlayableContentFromWatchList: Generic search.");
    v8 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[WLASearchPlayableContentFromWatchList canonicalId](self, "canonicalId"));
    id v11 = [v10 length];

    if (v11)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[WLASearchPlayableContentFromWatchList canonicalId](self, "canonicalId"));
      -[NSMutableDictionary setObject:forKey:](v8, "setObject:forKey:", v12, WLKSiriSearchRequestOptionCanonicalID);
    }

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[WLASearchPlayableContentFromWatchList title](self, "title"));
    id v14 = [v13 length];

    if (v14)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[WLASearchPlayableContentFromWatchList title](self, "title"));
      -[NSMutableDictionary setObject:forKey:](v8, "setObject:forKey:", v15, WLKSiriSearchRequestOptionTitle);

      v16 = (void *)objc_claimAutoreleasedReturnValue(-[WLASearchPlayableContentFromWatchList siriLocale](self, "siriLocale"));
      if (v16)
      {
        v17 = (void *)objc_claimAutoreleasedReturnValue(-[WLASearchPlayableContentFromWatchList siriLocale](self, "siriLocale"));
        -[NSMutableDictionary setObject:forKey:](v8, "setObject:forKey:", v17, @"locale");
      }
    }

    v18 = (void *)objc_claimAutoreleasedReturnValue(-[WLASearchPlayableContentFromWatchList contentType](self, "contentType"));
    unsigned __int8 v19 = [v18 isEqualToString:SAVCSContentTypeMovieValue];

    if ((v19 & 1) != 0)
    {
      v20 = &WLKSiriSearchRequestContentTypeMovie;
    }

    else
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[WLASearchPlayableContentFromWatchList contentType](self, "contentType"));
      unsigned __int8 v22 = [v21 isEqualToString:SAVCSContentTypeShowValue];

      if ((v22 & 1) != 0)
      {
        v20 = &WLKSiriSearchRequestContentTypeShow;
      }

      else
      {
        v23 = (void *)objc_claimAutoreleasedReturnValue(-[WLASearchPlayableContentFromWatchList contentType](self, "contentType"));
        unsigned __int8 v24 = [v23 isEqualToString:SAVCSContentTypeEpisodeValue];

        if ((v24 & 1) != 0)
        {
          v20 = &WLKSiriSearchRequestContentTypeEpisode;
        }

        else
        {
          v25 = (void *)objc_claimAutoreleasedReturnValue(-[WLASearchPlayableContentFromWatchList contentType](self, "contentType"));
          unsigned int v26 = [v25 isEqualToString:SAVCSContentTypeSeasonValue];

          if (!v26)
          {
LABEL_17:
            id v27 = [[WLKSiriSearchRequest alloc] initWithQuery:v8];
            NSLog( @"WLASearchPlayableContentFromWatchList: Will make search request %p with options: %@",  v27,  v8);
            v28[0] = _NSConcreteStackBlock;
            v28[1] = 3221225472LL;
            v28[2] = __63__WLASearchPlayableContentFromWatchList_performWithCompletion___block_invoke_3;
            v28[3] = &unk_8450;
            v29 = v7;
            [v27 makeRequestWithCompletion:v28];

            goto LABEL_18;
          }

          v20 = &WLKSiriSearchRequestContentTypeSeason;
        }
      }
    }

    -[NSMutableDictionary setObject:forKey:](v8, "setObject:forKey:", *v20, WLKSiriSearchRequestOptionContentType);
    goto LABEL_17;
  }

  NSLog(@"WLASearchPlayableContentFromWatchList: Play the next x request.");
  v8 = (NSMutableDictionary *)objc_alloc_init(&OBJC_CLASS___WLKContinueWatchingRequestOperation);
  objc_initWeak(&location, v8);
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472LL;
  v30[2] = __63__WLASearchPlayableContentFromWatchList_performWithCompletion___block_invoke_2;
  v30[3] = &unk_8428;
  objc_copyWeak(&v32, &location);
  v30[4] = self;
  v31 = v7;
  -[NSMutableDictionary setCompletionBlock:](v8, "setCompletionBlock:", v30);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSOperationQueue wlkDefaultQueue](&OBJC_CLASS___NSOperationQueue, "wlkDefaultQueue"));
  [v9 addOperation:v8];

  objc_destroyWeak(&v32);
  objc_destroyWeak(&location);
LABEL_18:
}

void __63__WLASearchPlayableContentFromWatchList_performWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  [v3 timeIntervalSinceDate:*(void *)(a1 + 32)];
  uint64_t v5 = v4;

  NSLog(@"WLASearchPlayableContentFromWatchList: Elapsed Time: %.4f", v5);
  uint64_t v6 = *(void *)(a1 + 40);
  if (v6) {
    (*(void (**)(uint64_t, id))(v6 + 16))(v6, v7);
  }
}

void __63__WLASearchPlayableContentFromWatchList_performWithCompletion___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v3 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained response]);

  if (v3)
  {
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained response]);
    NSLog(@"WLASearchPlayableContentFromWatchList: Continue watching response received: %@", v4);

    id v5 = objc_alloc_init(&OBJC_CLASS___SAWLWatchListSearchResults);
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) contentType]);
    unsigned int v7 = [v6 isEqualToString:SAVCSContentTypeMovieValue];

    if (v7)
    {
      __int128 v39 = 0u;
      __int128 v40 = 0u;
      __int128 v37 = 0u;
      __int128 v38 = 0u;
      v8 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained response]);
      v9 = (void *)objc_claimAutoreleasedReturnValue([v8 items]);

      id v10 = [v9 countByEnumeratingWithState:&v37 objects:v43 count:16];
      if (v10)
      {
        uint64_t v11 = *(void *)v38;
LABEL_5:
        uint64_t v12 = 0LL;
        while (1)
        {
          if (*(void *)v38 != v11) {
            objc_enumerationMutation(v9);
          }
          v13 = *(void **)(*((void *)&v37 + 1) + 8 * v12);
          id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 movieOrShowContent]);
          v15 = (char *)[v14 contentType];

          if (v15 == (_BYTE *)&dword_0 + 1) {
            break;
          }
          if (v10 == (id)++v12)
          {
            id v10 = [v9 countByEnumeratingWithState:&v37 objects:v43 count:16];
            if (v10) {
              goto LABEL_5;
            }
            goto LABEL_27;
          }
        }

void __63__WLASearchPlayableContentFromWatchList_performWithCompletion___block_invoke_3( uint64_t a1,  void *a2,  uint64_t a3)
{
  id v5 = a2;
  uint64_t v6 = v5;
  if (v5)
  {
    uint64_t v20 = a1;
    NSLog(@"WLASearchPlayableContentFromWatchList: Search response received: %@", v5);
    unsigned int v7 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    __int128 v21 = 0u;
    __int128 v22 = 0u;
    __int128 v23 = 0u;
    __int128 v24 = 0u;
    v8 = (void *)objc_claimAutoreleasedReturnValue([v6 items]);
    id v9 = [v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v22;
      do
      {
        for (i = 0LL; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v22 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void *)(*((void *)&v21 + 1) + 8LL * (void)i);
          id v14 = objc_alloc_init(&OBJC_CLASS___SAWLWatchListSearchResult);
          +[WLASearchUtilities populateSearchResult:withMetadata:]( &OBJC_CLASS___WLASearchUtilities,  "populateSearchResult:withMetadata:",  v14,  v13);
          -[NSMutableArray addObject:](v7, "addObject:", v14);
        }

        id v10 = [v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }

      while (v10);
    }

    id v15 = objc_alloc_init(&OBJC_CLASS___SAWLWatchListSearchResults);
    id v16 = -[NSMutableArray copy](v7, "copy");
    [v15 setMatchedResults:v16];

    NSLog(@"WLASearchPlayableContentFromWatchList: Returning results: %@", v15);
    uint64_t v17 = *(void *)(v20 + 32);
    v18 = (void *)objc_claimAutoreleasedReturnValue([v15 dictionary]);
    (*(void (**)(uint64_t, void *))(v17 + 16))(v17, v18);
  }

  else
  {
    NSLog(@"WLASearchPlayableContentFromWatchList: Search request failed: %@", a3);
    uint64_t v19 = *(void *)(a1 + 32);
    unsigned int v7 = (NSMutableArray *)objc_alloc_init(&OBJC_CLASS___SACommandFailed);
    id v15 = (id)objc_claimAutoreleasedReturnValue(-[NSMutableArray dictionary](v7, "dictionary"));
    (*(void (**)(uint64_t, id))(v19 + 16))(v19, v15);
  }
}

@end
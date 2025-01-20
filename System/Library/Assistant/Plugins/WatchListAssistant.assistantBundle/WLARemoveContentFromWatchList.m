@interface WLARemoveContentFromWatchList
- (void)performWithCompletion:(id)a3;
@end

@implementation WLARemoveContentFromWatchList

- (void)performWithCompletion:(id)a3
{
  v4 = (void (**)(id, void *))a3;
  NSLog(@"WLARemoveContentFromWatchList: Received remove content request.");
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[WLKSettingsStore sharedSettings](&OBJC_CLASS___WLKSettingsStore, "sharedSettings"));
  unsigned __int8 v6 = [v5 optedIn];

  if ((v6 & 1) == 0)
  {
    NSLog(@"WLARemoveContentFromWatchList: Not opted in.  Bailing.");
    if (!v4) {
      goto LABEL_8;
    }
    id v13 = [[SACommandFailed alloc] initWithErrorCode:9056];
LABEL_6:
    id v12 = v13;
    v14 = (void *)objc_claimAutoreleasedReturnValue([v13 dictionary]);
    v4[2](v4, v14);

    goto LABEL_7;
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[WLARemoveContentFromWatchList canonicalId](self, "canonicalId"));

  if (v7)
  {
    id v8 = objc_alloc(&OBJC_CLASS___WLKRemoveFavoriteRequest);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[WLARemoveContentFromWatchList canonicalId](self, "canonicalId"));
    id v10 = [v8 initWithCanonicalID:v9];

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[WLARemoveContentFromWatchList canonicalId](self, "canonicalId"));
    NSLog(@"WLARemoveContentFromWatchList: Will issue remove request %p for canonical ID %@", v10, v11);

    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472LL;
    v27[2] = __55__WLARemoveContentFromWatchList_performWithCompletion___block_invoke;
    v27[3] = &unk_8478;
    id v28 = v10;
    v29 = v4;
    id v12 = v10;
    [v12 makeRequestWithCompletion:v27];

LABEL_7:
    goto LABEL_8;
  }

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[WLARemoveContentFromWatchList title](self, "title"));
  id v16 = [v15 length];

  if (!v16)
  {
    NSLog(@"WLARemoveContentFromWatchList: No title to search.");
    if (!v4) {
      goto LABEL_8;
    }
    id v13 = objc_alloc_init(&OBJC_CLASS___SACommandFailed);
    goto LABEL_6;
  }

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[WLARemoveContentFromWatchList title](self, "title"));
  NSLog(@"WLARemoveContentFromWatchList: The title (%@) has a non-zero length.", v17);

  v18 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[WLARemoveContentFromWatchList title](self, "title"));
  id v20 = [v19 length];

  if (v20)
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[WLARemoveContentFromWatchList title](self, "title"));
    -[NSMutableDictionary setObject:forKey:](v18, "setObject:forKey:", v21, WLKSearchWatchListRequestOptionTitle);

    v22 = (void *)objc_claimAutoreleasedReturnValue(-[WLARemoveContentFromWatchList siriLocale](self, "siriLocale"));
    if (v22)
    {
      v23 = (void *)objc_claimAutoreleasedReturnValue(-[WLARemoveContentFromWatchList siriLocale](self, "siriLocale"));
      -[NSMutableDictionary setObject:forKey:](v18, "setObject:forKey:", v23, @"locale");
    }
  }

  id v24 = [[WLKSearchWatchListRequest alloc] initWithQuery:v18];
  NSLog(@"WLARemoveContentFromWatchList: Will enqueue search request %p with options %@", v24, v18);
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472LL;
  v25[2] = __55__WLARemoveContentFromWatchList_performWithCompletion___block_invoke_2;
  v25[3] = &unk_84C8;
  v26 = v4;
  [v24 makeRequestWithCompletion:v25];

LABEL_8:
}

void __55__WLARemoveContentFromWatchList_performWithCompletion___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  id v13 = v5;
  if (a2)
  {
    unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) response]);
    v7 = (char *)[v6 responseType];

    if (v7 == (_BYTE *)&dword_0 + 2)
    {
      NSLog(@"WLARemoveContentFromWatchList: Item was not on list.");
      id v8 = objc_alloc_init(&OBJC_CLASS___SACommandFailed);
      [v8 setErrorCode:SAWLItemNotInListErrorCode];
      uint64_t v9 = *(void *)(a1 + 40);
      if (!v9)
      {
LABEL_11:

        goto LABEL_12;
      }

      id v10 = v8;
LABEL_10:
      id v12 = (void *)objc_claimAutoreleasedReturnValue([v10 dictionary]);
      (*(void (**)(uint64_t, void *))(v9 + 16))(v9, v12);

      goto LABEL_11;
    }

    NSLog(@"WLARemoveContentFromWatchList: Successfully removed item from list.");
    uint64_t v9 = *(void *)(a1 + 40);
    if (v9)
    {
      v11 = &OBJC_CLASS___SACommandSucceeded;
      goto LABEL_9;
    }
  }

  else
  {
    NSLog(@"WLARemoveContentFromWatchList: Remove item request failed: %@", v5, v5);
    uint64_t v9 = *(void *)(a1 + 40);
    if (v9)
    {
      v11 = &OBJC_CLASS___SACommandFailed;
LABEL_9:
      id v10 = objc_alloc_init(v11);
      id v8 = v10;
      goto LABEL_10;
    }
  }

void __55__WLARemoveContentFromWatchList_performWithCompletion___block_invoke_2( uint64_t a1,  void *a2,  void *a3)
{
  id v5 = a2;
  id v6 = a3;
  NSLog(@"WLARemoveContentFromWatchList: Search request finished.");
  v7 = (void *)objc_claimAutoreleasedReturnValue([v5 items]);
  id v8 = [v7 count];

  if ((unint64_t)v8 < 2)
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue([v5 items]);
    v22 = (char *)[v21 count];

    if (v22 == (_BYTE *)&dword_0 + 1)
    {
      NSLog(@"WLARemoveContentFromWatchList: Singular response received.");
      v23 = (void *)objc_claimAutoreleasedReturnValue([v5 items]);
      id v24 = (id)objc_claimAutoreleasedReturnValue([v23 firstObject]);

      v25 = (void *)objc_claimAutoreleasedReturnValue([v24 canonicalID]);
      if ([v25 length])
      {
        id v26 = [[WLKRemoveFavoriteRequest alloc] initWithCanonicalID:v25];
        NSLog( @"WLARemoveContentFromWatchList: Will issue remove favorites request %p for canonical ID %@.",  v26,  v25);
        v30[0] = _NSConcreteStackBlock;
        v30[1] = 3221225472LL;
        v30[2] = __55__WLARemoveContentFromWatchList_performWithCompletion___block_invoke_3;
        v30[3] = &unk_84A0;
        id v31 = *(id *)(a1 + 32);
        [v26 makeRequestWithCompletion:v30];

LABEL_22:
        goto LABEL_23;
      }
    }
  }

  else
  {
    uint64_t v29 = a1;
    uint64_t v9 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    __int128 v32 = 0u;
    __int128 v33 = 0u;
    __int128 v34 = 0u;
    __int128 v35 = 0u;
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v5 items]);
    id v11 = [v10 countByEnumeratingWithState:&v32 objects:v36 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v33;
      do
      {
        for (i = 0LL; i != v12; i = (char *)i + 1)
        {
          if (*(void *)v33 != v13) {
            objc_enumerationMutation(v10);
          }
          uint64_t v15 = *(void *)(*((void *)&v32 + 1) + 8LL * (void)i);
          id v16 = objc_alloc_init(&OBJC_CLASS___SAWLWatchListSearchResult);
          +[WLASearchUtilities populateSearchResult:withMetadata:]( &OBJC_CLASS___WLASearchUtilities,  "populateSearchResult:withMetadata:",  v16,  v15);
          -[NSMutableArray addObject:](v9, "addObject:", v16);
        }

        id v12 = [v10 countByEnumeratingWithState:&v32 objects:v36 count:16];
      }

      while (v12);
    }

    id v17 = objc_alloc_init(&OBJC_CLASS___SAWLWatchListSearchResults);
    id v18 = -[NSMutableArray copy](v9, "copy");
    [v17 setMatchedResults:v18];

    NSLog(@"WLARemoveContentFromWatchList: Returning multiple results.");
    a1 = v29;
    uint64_t v19 = *(void *)(v29 + 32);
    if (v19)
    {
      id v20 = (void *)objc_claimAutoreleasedReturnValue([v17 dictionary]);
      (*(void (**)(uint64_t, void *))(v19 + 16))(v19, v20);
    }
  }

  NSLog(@"WLARemoveContentFromWatchList: Failed to find item.");
  if (v5)
  {
    NSLog(@"WLARemoveContentFromWatchList: Failure response: %@", v5);
    id v24 = objc_alloc_init(&OBJC_CLASS___SACommandFailed);
    [v24 setErrorCode:SAWLItemNotInListErrorCode];
    uint64_t v27 = *(void *)(a1 + 32);
    if (!v27)
    {
LABEL_23:

      goto LABEL_24;
    }

    id v28 = v24;
    goto LABEL_21;
  }

  NSLog(@"WLARemoveContentFromWatchList: No failure response: %@", v6);
  uint64_t v27 = *(void *)(a1 + 32);
  if (v27)
  {
    id v28 = objc_alloc_init(&OBJC_CLASS___SACommandFailed);
    id v24 = v28;
LABEL_21:
    v25 = (void *)objc_claimAutoreleasedReturnValue([v28 dictionary]);
    (*(void (**)(uint64_t, void *))(v27 + 16))(v27, v25);
    goto LABEL_22;
  }

void __55__WLARemoveContentFromWatchList_performWithCompletion___block_invoke_3( uint64_t a1,  int a2,  void *a3)
{
  id v5 = a3;
  id v10 = v5;
  if (a2)
  {
    NSLog(@"WLARemoveContentFromWatchList: Successfully removed item.");
    uint64_t v6 = *(void *)(a1 + 32);
    if (v6)
    {
      v7 = &OBJC_CLASS___SACommandSucceeded;
LABEL_6:
      id v8 = objc_alloc_init(v7);
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 dictionary]);
      (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v9);
    }
  }

  else
  {
    NSLog(@"WLARemoveContentFromWatchList: Failed to remove item: %@", v5, v5);
    uint64_t v6 = *(void *)(a1 + 32);
    if (v6)
    {
      v7 = &OBJC_CLASS___SACommandFailed;
      goto LABEL_6;
    }
  }
}

@end
@interface WLAAddContentToWatchList
- (void)performWithCompletion:(id)a3;
@end

@implementation WLAAddContentToWatchList

- (void)performWithCompletion:(id)a3
{
  id v4 = a3;
  NSLog(@"WLAAddContentToWatchList: Got add content request.");
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[WLKSettingsStore sharedSettings](&OBJC_CLASS___WLKSettingsStore, "sharedSettings"));
  unsigned __int8 v6 = [v5 optedIn];

  if ((v6 & 1) != 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[WLAAddContentToWatchList canonicalId](self, "canonicalId"));

    if (v7)
    {
      id v8 = objc_alloc(&OBJC_CLASS___WLKAddToUpNextRequest);
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[WLAAddContentToWatchList canonicalId](self, "canonicalId"));
      id v10 = [v8 initWithCanonicalID:v9];

      v11 = (void *)objc_claimAutoreleasedReturnValue(-[WLAAddContentToWatchList canonicalId](self, "canonicalId"));
      NSLog(@"WLAAddContentToWatchList: Will perform add favorite request: %p for canonical: %@", v10, v11);

      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472LL;
      v15[2] = __50__WLAAddContentToWatchList_performWithCompletion___block_invoke;
      v15[3] = &unk_8478;
      id v16 = v10;
      id v17 = v4;
      id v12 = v10;
      [v12 makeRequestWithCompletion:v15];

LABEL_9:
      goto LABEL_10;
    }

    NSLog(@"WLAAddContentToWatchList: No canonical ID provided.");
    if (v4)
    {
      id v13 = objc_alloc_init(&OBJC_CLASS___SACommandFailed);
      goto LABEL_8;
    }
  }

  else
  {
    NSLog(@"WLAAddContentToWatchList: Not opted in.  Bailing out.");
    if (v4)
    {
      id v13 = [[SACommandFailed alloc] initWithErrorCode:9056];
LABEL_8:
      id v12 = v13;
      v14 = (void *)objc_claimAutoreleasedReturnValue([v13 dictionary]);
      (*((void (**)(id, void *))v4 + 2))(v4, v14);

      goto LABEL_9;
    }
  }

void __50__WLAAddContentToWatchList_performWithCompletion___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  id v13 = v5;
  if (a2)
  {
    NSLog(@"WLAAddContentToWatchList: Add favorite request succeeded.");
    unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) response]);
    v7 = (char *)[v6 responseType];

    if (v7 == (_BYTE *)&dword_0 + 1)
    {
      NSLog(@"WLAAddContentToWatchList: Added favorite was already on the list.");
      id v8 = objc_alloc_init(&OBJC_CLASS___SACommandFailed);
      [v8 setErrorCode:SAWLAllItemsInListErrorCode];
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

    NSLog(@"WLAAddContentToWatchList: Added favorite was not on the list.");
    uint64_t v9 = *(void *)(a1 + 40);
    if (v9)
    {
      v11 = &OBJC_CLASS___SACommandSucceeded;
      goto LABEL_9;
    }
  }

  else
  {
    NSLog(@"WLAAddContentToWatchList: Add favorite request failed: %@", v5, v5);
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

@end
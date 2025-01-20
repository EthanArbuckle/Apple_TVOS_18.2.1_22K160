@interface WLAPlayContent
+ (unint64_t)_WLKContentTypeForSAVCSContentType:(id)a3;
- (NSOperationQueue)legacyPlaybackActionOperationQueue;
- (void)_performLegacyPlaybackActionForContentType:(id)a3 canonicalID:(id)a4 completionBlock:(id)a5;
- (void)performWithCompletion:(id)a3;
- (void)setLegacyPlaybackActionOperationQueue:(id)a3;
@end

@implementation WLAPlayContent

+ (unint64_t)_WLKContentTypeForSAVCSContentType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:SAVCSContentTypeMovieValue])
  {
    unint64_t v4 = 1LL;
  }

  else if ([v3 isEqualToString:SAVCSContentTypeShowValue])
  {
    unint64_t v4 = 2LL;
  }

  else if ([v3 isEqualToString:SAVCSContentTypeSeasonValue])
  {
    unint64_t v4 = 3LL;
  }

  else if ([v3 isEqualToString:SAVCSContentTypeEpisodeValue])
  {
    unint64_t v4 = 4LL;
  }

  else
  {
    unint64_t v4 = 0LL;
  }

  return v4;
}

- (void)performWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[WLAPlayContent utsId](self, "utsId"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[WLAPlayContent contentType](self, "contentType"));
  id v7 = [(id)objc_opt_class(self) _WLKContentTypeForSAVCSContentType:v6];
  NSLog(@"WLAPlayContent: Got play request for content type '%@', canonical ID '%@'", v6, v5);
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472LL;
  v22[2] = __40__WLAPlayContent_performWithCompletion___block_invoke;
  v22[3] = &unk_8310;
  id v8 = (id)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  id v23 = v8;
  id v25 = v7;
  id v9 = v4;
  id v24 = v9;
  v10 = objc_retainBlock(v22);
  if (([(id)objc_opt_class(WLKURLBagUtilities) isFullTVAppEnabled] & 1) == 0)
  {
    NSLog(@"WLAPlayContent: WatchList app is not available. Trying legacy playback approach.");
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472LL;
    v20[2] = __40__WLAPlayContent_performWithCompletion___block_invoke_2;
    v20[3] = &unk_8338;
    v21 = v10;
    -[WLAPlayContent _performLegacyPlaybackActionForContentType:canonicalID:completionBlock:]( self,  "_performLegacyPlaybackActionForContentType:canonicalID:completionBlock:",  v6,  v5,  v20);
    id v11 = v21;
    goto LABEL_11;
  }

  if ([v5 length]
    && (([v6 isEqualToString:SAVCSContentTypeMovieValue] & 1) != 0
     || ([v6 isEqualToString:SAVCSContentTypeEpisodeValue] & 1) != 0
     || ([v6 isEqualToString:SAVCSContentTypeShowValue] & 1) != 0
     || [v6 isEqualToString:SAVCSContentTypeSeasonValue]))
  {
    id v11 = [[WLKContentPlayRequest alloc] initWithCanonicalID:v5];
    NSLog(@"WLAPlayContent: Will enqueue playables request: %@", v11);
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = __40__WLAPlayContent_performWithCompletion___block_invoke_3;
    v14[3] = &unk_8388;
    id v15 = v6;
    id v16 = v5;
    id v19 = v7;
    v17 = v10;
    id v18 = v9;
    [v11 makeRequestWithCompletion:v14];

LABEL_11:
    goto LABEL_12;
  }

  NSLog(@"WLAPlayContent: Unsupported content type for play command: %@, canonical ID: %@", v6, v5);
  if (v9)
  {
    id v12 = objc_alloc(&OBJC_CLASS___SACommandFailed);
    id v11 = [v12 initWithErrorCode:SAVCSCannotPlayContentErrorCode];
    v13 = (void *)objc_claimAutoreleasedReturnValue([v11 dictionary]);
    (*((void (**)(id, void *))v9 + 2))(v9, v13);

    goto LABEL_11;
  }

void __40__WLAPlayContent_performWithCompletion___block_invoke(void *a1, int a2)
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  [v4 timeIntervalSinceDate:a1[4]];
  uint64_t v6 = v5;

  NSLog(@"WLAPlayContent: Elapsed Time: %.4f", v6);
  if (a2)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[PBSSystemService sharedInstance](&OBJC_CLASS___PBSSystemService, "sharedInstance"));
    [v7 wakeSystemForReason:PBSWakeReasonSiriCommand];

    uint64_t v8 = a1[6];
    id v9 = @"WLAPlayContent: Successfully opened playable directly.";
    if (v8 == 4) {
      id v9 = @"WLAPlayContent: Opening episode playable succeeded.";
    }
    if (v8 == 3) {
      NSLog(@"WLAPlayContent: Opening season playable succeeded.");
    }
    else {
      NSLog(&v9->isa);
    }
    uint64_t v10 = a1[5];
    if (v10)
    {
      id v11 = objc_alloc_init(&OBJC_CLASS___SACommandSucceeded);
LABEL_16:
      id v16 = v11;
      id v15 = (void *)objc_claimAutoreleasedReturnValue([v11 dictionary]);
      (*(void (**)(uint64_t, void *))(v10 + 16))(v10, v15);
    }
  }

  else
  {
    uint64_t v12 = a1[6];
    v13 = @"WLAPlayContent: Failed to open playable directly.";
    if (v12 == 4) {
      v13 = @"WLAPlayContent: Opening episode playable failed.";
    }
    if (v12 == 3) {
      NSLog(@"WLAPlayContent: Opening season playable failed.");
    }
    else {
      NSLog(&v13->isa);
    }
    uint64_t v10 = a1[5];
    if (v10)
    {
      id v14 = objc_alloc(&OBJC_CLASS___SACommandFailed);
      id v11 = [v14 initWithErrorCode:SAVCSCannotPlayContentErrorCode];
      goto LABEL_16;
    }
  }

uint64_t __40__WLAPlayContent_performWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void __40__WLAPlayContent_performWithCompletion___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = objc_claimAutoreleasedReturnValue([v5 playable]);
  uint64_t v8 = (void *)v7;
  if (v7)
  {
    NSLog(@"WLAPlayContent: Got a playable: %@", v7);
    if ([*(id *)(a1 + 32) isEqualToString:SAVCSContentTypeSeasonValue])
    {
      NSLog(@"WLAPlayContent: Will enqueue season content request operation.");
      id v9 = [[WLKBasicContentRequestOperation alloc] initWithContentID:*(void *)(a1 + 40) caller:0];
      objc_initWeak(&location, v9);
      v26[0] = _NSConcreteStackBlock;
      v26[1] = 3221225472LL;
      v26[2] = __40__WLAPlayContent_performWithCompletion___block_invoke_4;
      v26[3] = &unk_8360;
      uint64_t v10 = v30;
      objc_copyWeak(v30, &location);
      id v27 = *(id *)(a1 + 40);
      id v11 = v8;
      uint64_t v12 = *(void **)(a1 + 64);
      id v28 = v11;
      v30[1] = v12;
      id v29 = *(id *)(a1 + 48);
      [v9 setCompletionBlock:v26];
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSOperationQueue wlkDefaultQueue](&OBJC_CLASS___NSOperationQueue, "wlkDefaultQueue"));
      [v13 addOperation:v9];

      id v14 = v27;
    }

    else
    {
      if (![*(id *)(a1 + 32) isEqualToString:SAVCSContentTypeEpisodeValue])
      {
        +[WLKPlayableUtilities openPlayable:forContentType:canonicalID:showCanonicalID:seasonCanonicalID:]( &OBJC_CLASS___WLKPlayableUtilities,  "openPlayable:forContentType:canonicalID:showCanonicalID:seasonCanonicalID:",  v8,  *(void *)(a1 + 64),  *(void *)(a1 + 40),  0LL,  0LL);
        (*(void (**)(void))(*(void *)(a1 + 48) + 16LL))();
        goto LABEL_10;
      }

      NSLog(@"WLAPlayContent: Will enqueue episode content request operation.");
      id v9 = [[WLKBasicContentRequestOperation alloc] initWithContentID:*(void *)(a1 + 40) caller:0];
      objc_initWeak(&location, v9);
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472LL;
      v21[2] = __40__WLAPlayContent_performWithCompletion___block_invoke_5;
      v21[3] = &unk_8360;
      uint64_t v10 = v25;
      objc_copyWeak(v25, &location);
      id v22 = *(id *)(a1 + 40);
      id v18 = v8;
      id v19 = *(void **)(a1 + 64);
      id v23 = v18;
      v25[1] = v19;
      id v24 = *(id *)(a1 + 48);
      [v9 setCompletionBlock:v21];
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSOperationQueue wlkDefaultQueue](&OBJC_CLASS___NSOperationQueue, "wlkDefaultQueue"));
      [v20 addOperation:v9];

      id v14 = v22;
    }

    objc_destroyWeak(v10);
    objc_destroyWeak(&location);
    goto LABEL_9;
  }

  NSLog( @"WLAPlayContent: No playable returned for play request for content type: %@, canonical ID: %@, error: %@",  *(void *)(a1 + 32),  *(void *)(a1 + 40),  v6);
  uint64_t v15 = *(void *)(a1 + 56);
  if (v15)
  {
    id v16 = objc_alloc(&OBJC_CLASS___SACommandFailed);
    id v9 = [v16 initWithErrorCode:SAVCSCannotPlayContentErrorCode];
    v17 = (void *)objc_claimAutoreleasedReturnValue([v9 dictionary]);
    (*(void (**)(uint64_t, void *))(v15 + 16))(v15, v17);

LABEL_9:
  }

void __40__WLAPlayContent_performWithCompletion___block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v2 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained basicContentMetadata]);
  id v3 = *(id *)(a1 + 32);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v2 canonicalShowID]);
  +[WLKPlayableUtilities openPlayable:forContentType:canonicalID:showCanonicalID:seasonCanonicalID:]( &OBJC_CLASS___WLKPlayableUtilities,  "openPlayable:forContentType:canonicalID:showCanonicalID:seasonCanonicalID:",  *(void *)(a1 + 40),  *(void *)(a1 + 64),  v3,  v4,  0LL);
  (*(void (**)(void))(*(void *)(a1 + 48) + 16LL))();
}

void __40__WLAPlayContent_performWithCompletion___block_invoke_5(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v2 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained basicContentMetadata]);
  id v3 = *(id *)(a1 + 32);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v2 canonicalShowID]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v2 canonicalSeasonID]);
  +[WLKPlayableUtilities openPlayable:forContentType:canonicalID:showCanonicalID:seasonCanonicalID:]( &OBJC_CLASS___WLKPlayableUtilities,  "openPlayable:forContentType:canonicalID:showCanonicalID:seasonCanonicalID:",  *(void *)(a1 + 40),  *(void *)(a1 + 64),  v3,  v4,  v5);
  (*(void (**)(void))(*(void *)(a1 + 48) + 16LL))();
}

- (NSOperationQueue)legacyPlaybackActionOperationQueue
{
  legacyPlaybackActionOperationQueue = self->_legacyPlaybackActionOperationQueue;
  if (!legacyPlaybackActionOperationQueue)
  {
    id v4 = objc_alloc_init(&OBJC_CLASS___NSOperationQueue);
    id v5 = self->_legacyPlaybackActionOperationQueue;
    self->_legacyPlaybackActionOperationQueue = v4;

    -[NSOperationQueue setQualityOfService:](self->_legacyPlaybackActionOperationQueue, "setQualityOfService:", 25LL);
    legacyPlaybackActionOperationQueue = self->_legacyPlaybackActionOperationQueue;
  }

  return legacyPlaybackActionOperationQueue;
}

- (void)_performLegacyPlaybackActionForContentType:(id)a3 canonicalID:(id)a4 completionBlock:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[WLAPlayContent legacyPlaybackActionOperationQueue](self, "legacyPlaybackActionOperationQueue"));
  id v12 = [[TVSSPlaybackActionOperationRequest alloc] initWithCanonicalID:v9 contentType:v10];

  id v13 = [[TVSSPlaybackActionOperation alloc] initWithRequest:v12];
  [v11 addOperation:v13];
  v17 = _NSConcreteStackBlock;
  uint64_t v18 = 3221225472LL;
  id v19 = __89__WLAPlayContent__performLegacyPlaybackActionForContentType_canonicalID_completionBlock___block_invoke;
  v20 = &unk_83B0;
  id v21 = v13;
  id v22 = v8;
  id v14 = v8;
  id v15 = v13;
  id v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSBlockOperation blockOperationWithBlock:]( &OBJC_CLASS___NSBlockOperation,  "blockOperationWithBlock:",  &v17));
  objc_msgSend(v16, "addDependency:", v15, v17, v18, v19, v20);
  [v11 addOperation:v16];
}

void __89__WLAPlayContent__performLegacyPlaybackActionForContentType_canonicalID_completionBlock___block_invoke( uint64_t a1)
{
  v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) results]);
  id v10 = v2;
  if (v2)
  {
    if ([v2 count])
    {
      id v3 = (void *)objc_claimAutoreleasedReturnValue([v10 firstObject]);
      uint64_t v4 = objc_claimAutoreleasedReturnValue([v3 playbackURL]);
      id v5 = (void *)v4;
      if (v4)
      {
        NSLog(@"Opening playback URL from TVSSPlaybackActionOperation: %@", v4);
        uint64_t v6 = WLKLaunchOptionsForPlayback(1LL);
        uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
        id v8 = (void *)objc_claimAutoreleasedReturnValue( +[LSApplicationWorkspace defaultWorkspace]( &OBJC_CLASS___LSApplicationWorkspace,  "defaultWorkspace"));
        [v8 openURL:v5 withOptions:v7];
      }

      else
      {
        NSLog(@"No playback URL for first result from TVSSPlaybackActionOperation");
      }
    }

    else
    {
      NSLog(@"No results from TVSSPlaybackActionOperation");
    }
  }

  else
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) error]);
    NSLog(@"TVSSPlaybackActionOperation failed with error: %@", v9);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
}

- (void)setLegacyPlaybackActionOperationQueue:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
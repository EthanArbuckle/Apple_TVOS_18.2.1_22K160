@interface PBProfileServiceDelegate
- (void)profileService:(id)a3 presentConfirmMatchDialogWithOptions:(id)a4 completion:(id)a5;
- (void)profileService:(id)a3 presentMappingDialogWithOptions:(id)a4 completion:(id)a5;
- (void)profileServiceDidChangeActiveAccount:(id)a3;
@end

@implementation PBProfileServiceDelegate

- (void)profileService:(id)a3 presentConfirmMatchDialogWithOptions:(id)a4 completion:(id)a5
{
  id v6 = a4;
  id v7 = a5;
  v16[0] = PBSUPRDialogTypeKey;
  v16[1] = PBSUPRDialogCustomViewServiceNameKey;
  v17[0] = PBSUPRDialogTypeCustom;
  v17[1] = @"com.apple.TVProfileMappingService";
  v16[2] = PBSUPRDialogCustomViewControllerClassNameKey;
  v17[2] = @"TVProfileConfirmMatchRemoteViewController";
  id v8 = (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v17,  v16,  3LL));
  id v9 = v8;
  if (v6)
  {
    id v9 = [v6 mutableCopy];
    [v9 addEntriesFromDictionary:v8];
  }

  id v10 = [[PBSUserPresentationRequest alloc] initWithType:0 options:v9];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_1000607D0;
  v13[3] = &unk_1003D2588;
  v14 = -[PBUserPresentationService initWithRemoteConnection:]( objc_alloc(&OBJC_CLASS___PBUserPresentationService),  "initWithRemoteConnection:",  0LL);
  id v15 = v7;
  v11 = v14;
  id v12 = v7;
  -[PBUserPresentationService presentUIWithRequest:completion:](v11, "presentUIWithRequest:completion:", v10, v13);
}

- (void)profileService:(id)a3 presentMappingDialogWithOptions:(id)a4 completion:(id)a5
{
  id v6 = a4;
  id v7 = a5;
  v16[0] = PBSUPRDialogTypeKey;
  v16[1] = PBSUPRDialogCustomViewServiceNameKey;
  v17[0] = PBSUPRDialogTypeCustom;
  v17[1] = @"com.apple.TVProfileMappingService";
  v16[2] = PBSUPRDialogCustomViewControllerClassNameKey;
  v17[2] = @"TVProfileMappingRemoteViewController";
  id v8 = (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v17,  v16,  3LL));
  id v9 = v8;
  if (v6)
  {
    id v9 = [v6 mutableCopy];
    [v9 addEntriesFromDictionary:v8];
  }

  id v10 = [[PBSUserPresentationRequest alloc] initWithType:0 options:v9];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_100060A78;
  v13[3] = &unk_1003D2588;
  v14 = -[PBUserPresentationService initWithRemoteConnection:]( objc_alloc(&OBJC_CLASS___PBUserPresentationService),  "initWithRemoteConnection:",  0LL);
  id v15 = v7;
  v11 = v14;
  id v12 = v7;
  -[PBUserPresentationService presentUIWithRequest:completion:](v11, "presentUIWithRequest:completion:", v10, v13);
}

- (void)profileServiceDidChangeActiveAccount:(id)a3
{
  v3 = dispatch_group_create();
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  id v18 = [&off_1003FE5D8 countByEnumeratingWithState:&v28 objects:v33 count:16];
  if (v18)
  {
    uint64_t v17 = *(void *)v29;
    do
    {
      uint64_t v4 = 0LL;
      do
      {
        if (*(void *)v29 != v17) {
          objc_enumerationMutation(&off_1003FE5D8);
        }
        uint64_t v19 = v4;
        uint64_t v5 = *(void *)(*((void *)&v28 + 1) + 8 * v4);
        id v6 = (void *)objc_claimAutoreleasedReturnValue(+[FBProcessManager sharedInstance](&OBJC_CLASS___FBProcessManager, "sharedInstance"));
        id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 applicationProcessesForBundleIdentifier:v5]);

        __int128 v26 = 0u;
        __int128 v27 = 0u;
        __int128 v24 = 0u;
        __int128 v25 = 0u;
        id v8 = v7;
        id v9 = [v8 countByEnumeratingWithState:&v24 objects:v32 count:16];
        if (v9)
        {
          id v10 = v9;
          uint64_t v11 = *(void *)v25;
          do
          {
            id v12 = 0LL;
            do
            {
              if (*(void *)v25 != v11) {
                objc_enumerationMutation(v8);
              }
              v13 = *(void **)(*((void *)&v24 + 1) + 8LL * (void)v12);
              dispatch_group_enter(v3);
              v22[0] = _NSConcreteStackBlock;
              v22[1] = 3221225472LL;
              v22[2] = sub_100060E60;
              v22[3] = &unk_1003CFEE0;
              v23 = v3;
              [v13 killForReason:2 andReport:0 withDescription:@"DidChangeActiveAccount" completion:v22];

              id v12 = (char *)v12 + 1;
            }

            while (v10 != v12);
            id v10 = [v8 countByEnumeratingWithState:&v24 objects:v32 count:16];
          }

          while (v10);
        }

        uint64_t v4 = v19 + 1;
      }

      while ((id)(v19 + 1) != v18);
      id v18 = [&off_1003FE5D8 countByEnumeratingWithState:&v28 objects:v33 count:16];
    }

    while (v18);
  }

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100060E78;
  block[3] = &unk_1003CFF08;
  v21 = &off_1003FE5D8;
  dispatch_group_notify(v3, &_dispatch_main_q, block);
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[PBPictureInPictureManager sharedInstance](&OBJC_CLASS___PBPictureInPictureManager, "sharedInstance"));
  id v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  v16 = (void *)objc_claimAutoreleasedReturnValue([v15 bundleIdentifier]);
  [v14 cancelPictureInPictureWithReason:@"Active user account changed" sourceBundleID:v16 sourcePlayerInterface:0];
}

@end
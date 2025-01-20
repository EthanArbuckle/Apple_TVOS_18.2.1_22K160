@interface ACAccountStore
- (BOOL)_isGameCenterAccount:(id)a3;
- (id)tvsettings_gameCenterAccountWithAltDSID:(id)a3;
- (void)tvsettings_removeAccountsNotUsedByUserProfilesWithCompletion:(id)a3;
- (void)tvsettings_removeAccountsWithTuples:(id)a3 completion:(id)a4;
@end

@implementation ACAccountStore

- (id)tvsettings_gameCenterAccountWithAltDSID:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue( -[ACAccountStore accountTypeWithAccountTypeIdentifier:]( self,  "accountTypeWithAccountTypeIdentifier:",  ACAccountTypeIdentifierGameCenter));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ACAccountStore accountsWithAccountType:](self, "accountsWithAccountType:", v5));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_100072888;
  v10[3] = &unk_1001916C0;
  id v11 = v4;
  id v7 = v4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "bs_firstObjectPassingTest:", v10));

  return v8;
}

- (void)tvsettings_removeAccountsWithTuples:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v18 = a4;
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472LL;
  v29[2] = sub_100072B54;
  v29[3] = &unk_1001916E8;
  v29[4] = self;
  id v7 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  v30 = v7;
  v19 = v6;
  objc_msgSend(v6, "bs_each:", v29);
  v8 = dispatch_group_create();
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  v9 = v7;
  id v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v9,  "countByEnumeratingWithState:objects:count:",  &v25,  v33,  16LL);
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v26;
    do
    {
      for (i = 0LL; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v26 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v25 + 1) + 8LL * (void)i);
        dispatch_group_enter(v8);
        id v15 = sub_100072DA4();
        v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v32 = v14;
          _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_INFO,  "Removing account... {account=%@}",  buf,  0xCu);
        }

        v22[0] = _NSConcreteStackBlock;
        v22[1] = 3221225472LL;
        v22[2] = sub_100072DE4;
        v22[3] = &unk_100191710;
        v23 = v8;
        uint64_t v24 = v14;
        -[ACAccountStore removeAccount:withCompletionHandler:](self, "removeAccount:withCompletionHandler:", v14, v22);
      }

      id v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v9,  "countByEnumeratingWithState:objects:count:",  &v25,  v33,  16LL);
    }

    while (v11);
  }

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100072EB4;
  block[3] = &unk_10018FA98;
  id v21 = v18;
  id v17 = v18;
  dispatch_group_notify(v8, &_dispatch_main_q, block);
}

- (void)tvsettings_removeAccountsNotUsedByUserProfilesWithCompletion:(id)a3
{
  id v25 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[PBSUserProfileManager sharedInstance](&OBJC_CLASS___PBSUserProfileManager, "sharedInstance"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 userProfilesSnapshot]);

  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 userProfiles]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 allValues]);

  v8 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  v9 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  __int128 v35 = 0u;
  __int128 v36 = 0u;
  id v10 = v7;
  id v11 = [v10 countByEnumeratingWithState:&v33 objects:v38 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v34;
    do
    {
      for (i = 0LL; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v34 != v12) {
          objc_enumerationMutation(v10);
        }
        uint64_t v14 = *(void **)(*((void *)&v33 + 1) + 8LL * (void)i);
        id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 iCloudAltDSID]);
        BOOL v16 = v15 == 0LL;

        if (!v16)
        {
          id v17 = (void *)objc_claimAutoreleasedReturnValue([v14 iCloudAltDSID]);
          -[NSMutableSet addObject:](v8, "addObject:", v17);
        }

        id v18 = (void *)objc_claimAutoreleasedReturnValue([v14 gameCenterAltDSID]);
        BOOL v19 = v18 == 0LL;

        if (!v19)
        {
          v20 = (void *)objc_claimAutoreleasedReturnValue([v14 gameCenterAltDSID]);
          -[NSMutableSet addObject:](v9, "addObject:", v20);
        }
      }

      id v11 = [v10 countByEnumeratingWithState:&v33 objects:v38 count:16];
    }

    while (v11);
  }

  objc_initWeak(&location, self);
  v37[0] = ACAccountTypeIdentifierAppleAccount;
  v37[1] = ACAccountTypeIdentifierGameCenter;
  id v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v37, 2LL));
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472LL;
  v26[2] = sub_1000731BC;
  v26[3] = &unk_100191738;
  objc_copyWeak(&v31, &location);
  id v22 = v25;
  id v30 = v22;
  v23 = v8;
  __int128 v27 = v23;
  __int128 v28 = self;
  uint64_t v24 = v9;
  v29 = v24;
  -[ACAccountStore accountsWithAccountTypeIdentifiers:completion:]( self,  "accountsWithAccountTypeIdentifiers:completion:",  v21,  v26);

  objc_destroyWeak(&v31);
  objc_destroyWeak(&location);
}

- (BOOL)_isGameCenterAccount:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue([a3 accountType]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 identifier]);
  unsigned __int8 v5 = [v4 isEqualToString:ACAccountTypeIdentifierGameCenter];

  return v5;
}

@end
@interface MCUIAppSignerUninstallerUtilities
+ (id)_provisioningProfileUUIDsForAppSigner:(id)a3;
+ (void)_asyncUninstallApplicationsForAppsigner:(id)a3 withUninstaller:(id)a4 dispatchGroup:(id)a5;
+ (void)_asyncUninstallProvisioningProfilesForAppSigner:(id)a3 withUninstaller:(id)a4 dispatchGroup:(id)a5;
+ (void)uninstallAppSigner:(id)a3 withUninstaller:(id)a4 dispatchGroup:(id)a5 completion:(id)a6;
@end

@implementation MCUIAppSignerUninstallerUtilities

+ (void)uninstallAppSigner:(id)a3 withUninstaller:(id)a4 dispatchGroup:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_168C8;
  block[3] = &unk_28E98;
  id v21 = a6;
  id v22 = a1;
  id v18 = v10;
  id v19 = v11;
  id v20 = v12;
  id v13 = v21;
  v14 = (dispatch_group_s *)v12;
  id v15 = v11;
  id v16 = v10;
  dispatch_group_notify(v14, &_dispatch_main_q, block);
}

+ (void)_asyncUninstallProvisioningProfilesForAppSigner:(id)a3 withUninstaller:(id)a4 dispatchGroup:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(25LL, 0LL);
  id v12 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_16A54;
  v16[3] = &unk_28EE8;
  id v17 = v8;
  id v18 = v10;
  id v19 = v9;
  id v20 = a1;
  id v13 = v9;
  id v14 = v10;
  id v15 = v8;
  dispatch_async(v12, v16);
}

+ (void)_asyncUninstallApplicationsForAppsigner:(id)a3 withUninstaller:(id)a4 dispatchGroup:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(25LL, 0LL);
  id v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_16C98;
  block[3] = &unk_28F38;
  id v16 = v7;
  id v17 = v9;
  id v18 = v8;
  id v12 = v8;
  id v13 = v9;
  id v14 = v7;
  dispatch_async(v11, block);
}

+ (id)_provisioningProfileUUIDsForAppSigner:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "provisioningProfiles", 0));
  id v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v15 + 1) + 8LL * (void)i);
        id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 uuid]);
        id v12 = [v11 length];

        if (v12)
        {
          id v13 = (void *)objc_claimAutoreleasedReturnValue([v10 uuid]);
          -[NSMutableArray addObject:](v4, "addObject:", v13);
        }
      }

      id v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }

    while (v7);
  }

  return v4;
}

@end
@interface PBBulletinService
+ (BOOL)applicationDismissBulletinViewController:(id)a3;
+ (BOOL)applicationShouldActivateBulletinViewController:(id)a3 forAction:(unint64_t)a4;
+ (double)_timeoutForBulletin:(id)a3;
+ (id)_bulletinServiceForViewController:(id)a3;
+ (id)_bulletinServicesByBulletinIdentifier;
+ (id)_bulletinServicesByViewController;
+ (id)observingBulletinActionHandlerForBulletinWithIdentifier:(id)a3;
+ (unint64_t)applicationActivateBulletinViewController:(id)a3;
+ (unint64_t)applicationActivationActionsForBulletinViewController:(id)a3;
+ (void)_setBulletinService:(id)a3 forViewController:(id)a4;
+ (void)applicationBulletinHandleMenuButtonForViewController:(id)a3 withCompletion:(id)a4;
+ (void)applicationDeactivateBulletinViewController:(id)a3;
+ (void)applicationRetireBulletinViewController:(id)a3;
+ (void)applicationTerminateBulletinViewController:(id)a3;
+ (void)applicationToggleBulletinViewControllerSize:(id)a3;
- (BOOL)_bulletinIsPending:(id)a3;
- (BOOL)_shouldBeginUserInteractionOnActivationForViewController:(id)a3;
- (NSMapTable)bulletinInfoByBulletin;
- (NSMapTable)viewControllersByBulletin;
- (NSMutableDictionary)pendingBulletinsByRequestID;
- (PBBulletinService)init;
- (PBBulletinService)initWithRemoteConnection:(id)a3;
- (PBBulletinToBannerAdapter)bulletinToBannerAdapter;
- (PBSBulletinServiceDelegate)delegateProxy;
- (PBSBulletinServiceInteractionDelegate)interactionDelegateProxy;
- (PBSystemOverlayController)overlayController;
- (PBSystemServiceConnection)remoteConnection;
- (id)_bulletinForBulletinInfo:(id)a3;
- (id)_bulletinForRequestID:(unint64_t)a3;
- (id)_bulletinForViewController:(id)a3;
- (id)_bulletinInfoForBulletin:(id)a3;
- (id)_reserveTableSpaceForBulletin:(id)a3 error:(id *)a4;
- (id)_updateBulletin:(id)a3 withMessage:(id)a4 withCompletion:(id)a5;
- (id)_viewControllerForBulletin:(id)a3;
- (id)adapter:(id)a3 bulletinInfoForBulletin:(id)a4;
- (id)serviceDelegateForAdapter:(id)a3;
- (id)updateBulletin:(id)a3 withMessage:(id)a4 completionHandler:(id)a5;
- (void)_completeWithBulletin:(id)a3 success:(BOOL)a4 error:(id)a5 completion:(id)a6;
- (void)_handleApplicationDismissalForBulletin:(id)a3 withReason:(unint64_t)a4;
- (void)_handleApplicationDismissalForViewController:(id)a3 withReason:(unint64_t)a4;
- (void)_handleApplicationDismissalForViewController:(id)a3 withReason:(unint64_t)a4 completion:(id)a5;
- (void)_handleMenuButtonForViewController:(id)a3 withCompletion:(id)a4;
- (void)_mainqueue_dismissBulletin:(id)a3;
- (void)_prepareToPresentViewController:(id)a3;
- (void)_presentBulletin:(id)a3 prepared:(id)a4 withCompletion:(id)a5;
- (void)_setBulletin:(id)a3 forRequestID:(unint64_t)a4;
- (void)_setBulletinInfo:(id)a3 forBulletin:(id)a4;
- (void)_setUserInteractionEnabled:(BOOL)a3 forViewController:(id)a4;
- (void)_setViewController:(id)a3 forBulletin:(id)a4;
- (void)_updateRequestForBulletin:(id)a3 withBulletin:(id)a4;
- (void)_updateVideoBulletinViewController:(id)a3 withBulletin:(id)a4 completion:(id)a5;
- (void)adapter:(id)a3 cleanupForBulletin:(id)a4;
- (void)bulletinManager:(id)a3 willPresentBulletinViewController:(id)a4 withActivationActions:(unint64_t)a5;
- (void)dealloc;
- (void)dismissBulletin:(id)a3;
- (void)invalidate;
- (void)presentBulletin:(id)a3 withCompletion:(id)a4;
- (void)remoteBulletinViewController:(id)a3 didReceiveBulletinResponse:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setDelegateProxy:(id)a3;
- (void)setInteractionDelegate:(id)a3;
- (void)setInteractionDelegateProxy:(id)a3;
- (void)toggleBulletinSizeForViewController:(id)a3;
- (void)xpcUpdateBulletin:(id)a3 withMessage:(id)a4 withCompletion:(id)a5;
@end

@implementation PBBulletinService

+ (id)_bulletinServicesByViewController
{
  if (qword_100470A38 != -1) {
    dispatch_once(&qword_100470A38, &stru_1003D62F8);
  }
  return (id)qword_100470A30;
}

+ (id)_bulletinServicesByBulletinIdentifier
{
  if (qword_100470A48 != -1) {
    dispatch_once(&qword_100470A48, &stru_1003D6318);
  }
  return (id)qword_100470A40;
}

- (PBBulletinService)init
{
  return 0LL;
}

- (PBBulletinService)initWithRemoteConnection:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___PBBulletinService;
  v5 = -[PBBulletinService init](&v17, "init");
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_remoteConnection, v4);
    v7 = -[NSMapTable initWithKeyOptions:valueOptions:capacity:]( objc_alloc(&OBJC_CLASS___NSMapTable),  "initWithKeyOptions:valueOptions:capacity:",  0LL,  0LL,  1LL);
    viewControllersByBulletin = v6->_viewControllersByBulletin;
    v6->_viewControllersByBulletin = v7;

    v9 = -[NSMapTable initWithKeyOptions:valueOptions:capacity:]( objc_alloc(&OBJC_CLASS___NSMapTable),  "initWithKeyOptions:valueOptions:capacity:",  0LL,  0LL,  1LL);
    bulletinInfoByBulletin = v6->_bulletinInfoByBulletin;
    v6->_bulletinInfoByBulletin = v9;

    v11 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    pendingBulletinsByRequestID = v6->_pendingBulletinsByRequestID;
    v6->_pendingBulletinsByRequestID = v11;

    v13 = objc_alloc_init(&OBJC_CLASS___PBBulletinToBannerAdapter);
    bulletinToBannerAdapter = v6->_bulletinToBannerAdapter;
    v6->_bulletinToBannerAdapter = v13;

    -[PBBulletinToBannerAdapter setDelegate:](v6->_bulletinToBannerAdapter, "setDelegate:", v6);
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[PBBulletinManager sharedInstance](&OBJC_CLASS___PBBulletinManager, "sharedInstance"));
    [v15 addObserver:v6];
  }

  return v6;
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[PBBulletinManager sharedInstance](&OBJC_CLASS___PBBulletinManager, "sharedInstance"));
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___PBBulletinService;
  -[PBBulletinService dealloc](&v4, "dealloc");
}

- (void)invalidate
{
  v3 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  id v4 = sub_100082754();
  v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v57 = self;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "bulletinService invalidated %@", buf, 0xCu);
  }

  -[PBBulletinService setDelegateProxy:](self, "setDelegateProxy:", 0LL);
  uint64_t v6 = objc_opt_class(&OBJC_CLASS___PBBulletinService);
  id obj = (id)objc_claimAutoreleasedReturnValue(v6);
  objc_sync_enter(obj);
  __int128 v50 = 0u;
  __int128 v51 = 0u;
  __int128 v48 = 0u;
  __int128 v49 = 0u;
  id v7 = (id)objc_claimAutoreleasedReturnValue(-[PBBulletinService viewControllersByBulletin](self, "viewControllersByBulletin"));
  id v8 = [v7 countByEnumeratingWithState:&v48 objects:v55 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v49;
    do
    {
      v10 = 0LL;
      do
      {
        if (*(void *)v49 != v9) {
          objc_enumerationMutation(v7);
        }
        v11 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:*(void *)(*((void *)&v48 + 1) + 8 * (void)v10)]);
        if (v11) {
          -[NSMutableArray addObject:](v3, "addObject:", v11);
        }

        v10 = (char *)v10 + 1;
      }

      while (v8 != v10);
      id v8 = [v7 countByEnumeratingWithState:&v48 objects:v55 count:16];
    }

    while (v8);
  }

  [v7 removeAllObjects];
  id v12 = [(id)objc_opt_class(self) _bulletinServicesByViewController];
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  __int128 v46 = 0u;
  __int128 v47 = 0u;
  __int128 v44 = 0u;
  __int128 v45 = 0u;
  v14 = v3;
  id v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v14,  "countByEnumeratingWithState:objects:count:",  &v44,  v54,  16LL);
  if (v15)
  {
    uint64_t v16 = *(void *)v45;
    do
    {
      objc_super v17 = 0LL;
      do
      {
        if (*(void *)v45 != v16) {
          objc_enumerationMutation(v14);
        }
        [v13 removeObjectForKey:*(void *)(*((void *)&v44 + 1) + 8 * (void)v17)];
        objc_super v17 = (char *)v17 + 1;
      }

      while (v15 != v17);
      id v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v14,  "countByEnumeratingWithState:objects:count:",  &v44,  v54,  16LL);
    }

    while (v15);
  }

  __int128 v42 = 0u;
  __int128 v43 = 0u;
  __int128 v40 = 0u;
  __int128 v41 = 0u;
  id v18 = (id)objc_claimAutoreleasedReturnValue(-[PBBulletinService bulletinInfoByBulletin](self, "bulletinInfoByBulletin"));
  id v19 = [v18 countByEnumeratingWithState:&v40 objects:v53 count:16];
  if (v19)
  {
    uint64_t v20 = *(void *)v41;
    do
    {
      v21 = 0LL;
      do
      {
        if (*(void *)v41 != v20) {
          objc_enumerationMutation(v18);
        }
        v22 = (void *)objc_claimAutoreleasedReturnValue([v18 objectForKey:*(void *)(*((void *)&v40 + 1) + 8 * (void)v21)]);
        v23 = (void *)objc_claimAutoreleasedReturnValue([v22 bulletinViewController]);

        if (v23)
        {
          v24 = (void *)objc_claimAutoreleasedReturnValue([v22 bulletinViewController]);
          -[NSMutableArray addObject:](v14, "addObject:", v24);
        }

        v21 = (char *)v21 + 1;
      }

      while (v19 != v21);
      id v19 = [v18 countByEnumeratingWithState:&v40 objects:v53 count:16];
    }

    while (v19);
  }

  [v18 removeAllObjects];
  id v25 = [(id)objc_opt_class(self) _bulletinServicesByBulletinIdentifier];
  v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
  v39[0] = _NSConcreteStackBlock;
  v39[1] = 3221225472LL;
  v39[2] = sub_1000DC524;
  v39[3] = &unk_1003D6340;
  v39[4] = self;
  __int128 v37 = 0u;
  __int128 v38 = 0u;
  __int128 v35 = 0u;
  __int128 v36 = 0u;
  id v27 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "bs_filter:", v39));
  id v28 = [v27 countByEnumeratingWithState:&v35 objects:v52 count:16];
  if (v28)
  {
    uint64_t v29 = *(void *)v36;
    do
    {
      v30 = 0LL;
      do
      {
        if (*(void *)v36 != v29) {
          objc_enumerationMutation(v27);
        }
        [v26 removeObjectForKey:*(void *)(*((void *)&v35 + 1) + 8 * (void)v30)];
        v30 = (char *)v30 + 1;
      }

      while (v28 != v30);
      id v28 = [v27 countByEnumeratingWithState:&v35 objects:v52 count:16];
    }

    while (v28);
  }

  objc_sync_exit(obj);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000DC534;
  block[3] = &unk_1003CFEB8;
  block[4] = self;
  v34 = v14;
  v31 = v14;
  dispatch_async(&_dispatch_main_q, block);
}

- (void)bulletinManager:(id)a3 willPresentBulletinViewController:(id)a4 withActivationActions:(unint64_t)a5
{
  id v6 = a4;
  id v7 = [(id)objc_opt_class(self) _bulletinServiceForViewController:v6];
  id v8 = (PBBulletinService *)objc_claimAutoreleasedReturnValue(v7);
  uint64_t v9 = v8;
  if (v8)
  {
    if (v8 == self) {
      -[PBBulletinService _prepareToPresentViewController:](self, "_prepareToPresentViewController:", v6);
    }
  }

  else
  {
    id v10 = sub_100082754();
    v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138412290;
      id v13 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "windowManagerWillPresentBulletinViewController, no service! for viewController %@",  (uint8_t *)&v12,  0xCu);
    }
  }
}

+ (unint64_t)applicationActivationActionsForBulletinViewController:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue([a1 _bulletinServiceForViewController:v4]);
  if (!v5)
  {
    id v6 = sub_100082754();
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v18 = 138412290;
      id v19 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "applicationActivateBulletinViewController, no service! for viewController %@",  (uint8_t *)&v18,  0xCu);
    }
  }

  uint64_t v8 = objc_opt_class(&OBJC_CLASS___PBRemoteBulletinViewController);
  id v9 = v4;
  id v10 = v9;
  if (v8)
  {
    if ((objc_opt_isKindOfClass(v9, v8) & 1) != 0) {
      v11 = v10;
    }
    else {
      v11 = 0LL;
    }
  }

  else
  {
    v11 = 0LL;
  }

  id v12 = v11;

  id v13 = (void *)objc_claimAutoreleasedReturnValue([v5 _bulletinForViewController:v12]);
  v14 = (void *)objc_claimAutoreleasedReturnValue([v13 message]);
  id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 valueForKey:PBSSystemBulletinActivationActionKey]);

  if (v15) {
    unint64_t v16 = (unint64_t)[v15 unsignedIntegerValue];
  }
  else {
    unint64_t v16 = 1LL;
  }

  return v16;
}

+ (BOOL)applicationShouldActivateBulletinViewController:(id)a3 forAction:(unint64_t)a4
{
  return (a4 & ~(unint64_t)[a1 applicationActivationActionsForBulletinViewController:a3]) == 0;
}

+ (unint64_t)applicationActivateBulletinViewController:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue([a1 _bulletinServiceForViewController:v4]);
  if (!v5)
  {
    id v6 = sub_100082754();
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138412290;
      id v11 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "applicationActivateBulletinViewController, no service! for viewController %@",  (uint8_t *)&v10,  0xCu);
    }
  }

  if ([v5 _shouldBeginUserInteractionOnActivationForViewController:v4])
  {
    unint64_t v8 = 1LL;
    [v5 _setUserInteractionEnabled:1 forViewController:v4];
  }

  else
  {
    [v5 _handleApplicationDismissalForViewController:v4 withReason:1];
    unint64_t v8 = 0LL;
  }

  return v8;
}

+ (void)applicationToggleBulletinViewControllerSize:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue([a1 _bulletinServiceForViewController:v4]);
  [v5 toggleBulletinSizeForViewController:v4];
}

+ (void)applicationBulletinHandleMenuButtonForViewController:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([a1 _bulletinServiceForViewController:v6]);
  if (!v8)
  {
    id v9 = sub_100082754();
    int v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 138412290;
      id v12 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "applicationBulletinHandleMenuButtonForViewController, no service! for viewController %@",  (uint8_t *)&v11,  0xCu);
    }
  }

  [v8 _handleMenuButtonForViewController:v6 withCompletion:v7];
}

+ (void)applicationDeactivateBulletinViewController:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue([a1 _bulletinServiceForViewController:v4]);
  if (!v5)
  {
    id v6 = sub_100082754();
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138412290;
      id v9 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "applicationActivateBulletinViewController, no service! for viewController %@",  (uint8_t *)&v8,  0xCu);
    }
  }

  [v5 _setUserInteractionEnabled:0 forViewController:v4];
}

+ (BOOL)applicationDismissBulletinViewController:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue([a1 _bulletinServiceForViewController:v4]);
  id v6 = v5;
  if (v5)
  {
    [v5 _handleApplicationDismissalForViewController:v4 withReason:3];
  }

  else
  {
    id v7 = sub_100082754();
    int v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138412290;
      id v11 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "applicationDismissBulletinViewController, no service! for viewController %@",  (uint8_t *)&v10,  0xCu);
    }
  }

  return v6 != 0LL;
}

+ (void)applicationRetireBulletinViewController:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue([a1 _bulletinServiceForViewController:v4]);
  if (!v5)
  {
    id v6 = sub_100082754();
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138412290;
      id v9 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "applicationRetireBulletinViewController, no service! for viewController %@",  (uint8_t *)&v8,  0xCu);
    }
  }

  [v5 _handleApplicationDismissalForViewController:v4 withReason:2];
}

+ (void)applicationTerminateBulletinViewController:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue([a1 _bulletinServiceForViewController:v4]);
  if (!v5)
  {
    id v6 = sub_100082754();
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138412290;
      id v9 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "applicationTerminateBulletinViewController, no service! for viewController %@",  (uint8_t *)&v8,  0xCu);
    }
  }

  [v5 _handleApplicationDismissalForViewController:v4 withReason:5];
}

+ (id)observingBulletinActionHandlerForBulletinWithIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___PBBulletinService);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  objc_sync_enter(v6);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _bulletinServicesByBulletinIdentifier]);
  int v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:v4]);

  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 bulletinToBannerAdapter]);
  objc_sync_exit(v6);

  return v9;
}

- (void)presentBulletin:(id)a3 withCompletion:(id)a4
{
}

- (void)_presentBulletin:(id)a3 prepared:(id)a4 withCompletion:(id)a5
{
  id v66 = a3;
  id v64 = a4;
  v65 = (void (**)(id, void, void *))a5;
  id v7 = sub_100082754();
  int v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_remoteConnection);
    int v10 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained clientBundleIdentifier]);
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[PBBulletinService _presentBulletin:prepared:withCompletion:]";
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v10;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s from %{public}@", buf, 0x16u);
  }

  if ((char *)+[PBSSystemStatus systemAttentionState](&OBJC_CLASS___PBSSystemStatus, "systemAttentionState") - 6 <= (char *)2)
  {
    id v11 = sub_100082754();
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      id v13 = objc_loadWeakRetained((id *)&self->_remoteConnection);
      v14 = (void *)objc_claimAutoreleasedReturnValue([v13 clientBundleIdentifier]);
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = v14;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Present bulletin by %@ ignored - system is asleep.",  buf,  0xCu);
    }

    if (v65)
    {
      id v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  PineBoardServicesErrorDomain,  303LL,  0LL));
      v65[2](v65, 0LL, v15);
    }

    goto LABEL_46;
  }

  *(void *)buf = 0LL;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000LL;
  v83 = sub_1000DD674;
  v84 = sub_1000DD684;
  id v85 = 0LL;
  uint64_t v16 = objc_opt_class(&OBJC_CLASS___PBSBulletin);
  if ((objc_opt_isKindOfClass(v66, v16) & 1) != 0)
  {
    v63 = (void *)objc_claimAutoreleasedReturnValue([v66 viewControllerClassName]);
    v61 = (void *)objc_claimAutoreleasedReturnValue([v66 serviceIdentifier]);
    objc_super v17 = (void *)objc_claimAutoreleasedReturnValue([v66 message]);
    int v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "bs_safeNumberForKey:", @"_PBBulletinInsertAtFrontOfQueueKey"));
    unsigned __int8 v60 = [v18 BOOLValue];
  }

  else
  {
    unsigned __int8 v60 = 0;
    v61 = 0LL;
    v63 = 0LL;
  }

  uint64_t v19 = objc_opt_class(&OBJC_CLASS___NSString);
  if ((objc_opt_isKindOfClass(v63, v19) & 1) != 0
    && (uint64_t v20 = objc_opt_class(&OBJC_CLASS___NSString), (objc_opt_isKindOfClass(v61, v20) & 1) != 0))
  {
    char v21 = 1;
  }

  else
  {
    uint64_t v22 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  PineBoardServicesErrorDomain,  300LL,  0LL));
    v23 = *(void **)(*(void *)&buf[8] + 40LL);
    *(void *)(*(void *)&buf[8] + 40LL) = v22;

    char v21 = 0;
  }

  uint64_t v24 = PBSVideoSystemBulletinViewControllerClassName;
  unsigned int v25 = [v63 isEqualToString:PBSVideoSystemBulletinViewControllerClassName];
  uint64_t v26 = PBSMultiCamSystemBulletinViewControllerClassName;
  unsigned int v57 = [v63 isEqualToString:PBSMultiCamSystemBulletinViewControllerClassName];
  unsigned __int8 v58 = v25;
  char v59 = v21;
  if ((v25 | v57) != 1)
  {
    __int128 v42 = 0LL;
    __int128 v44 = 0LL;
    goto LABEL_32;
  }

  uint64_t v27 = objc_opt_class(&OBJC_CLASS___PBBulletinService);
  id v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
  objc_sync_enter(v28);
  __int128 v77 = 0u;
  __int128 v78 = 0u;
  __int128 v79 = 0u;
  __int128 v80 = 0u;
  id v56 = v28;
  id v29 = [(id)objc_opt_class(self) _bulletinServicesByViewController];
  v30 = (void *)objc_claimAutoreleasedReturnValue(v29);
  id v31 = [v30 countByEnumeratingWithState:&v77 objects:v81 count:16];
  id obj = v30;
  if (!v31)
  {
    __int128 v42 = 0LL;
    __int128 v43 = 0LL;
    goto LABEL_31;
  }

  uint64_t v32 = *(void *)v78;
  while (2)
  {
    for (i = 0LL; i != v31; i = (char *)i + 1)
    {
      if (*(void *)v78 != v32) {
        objc_enumerationMutation(obj);
      }
      v34 = *(void **)(*((void *)&v77 + 1) + 8LL * (void)i);
      id v35 = [(id)objc_opt_class(self) _bulletinServiceForViewController:v34];
      __int128 v36 = (void *)objc_claimAutoreleasedReturnValue(v35);
      __int128 v37 = (void *)objc_claimAutoreleasedReturnValue([v36 _bulletinForViewController:v34]);
      __int128 v38 = (void *)objc_claimAutoreleasedReturnValue([v37 viewControllerClassName]);
      unsigned __int8 v39 = [v38 isEqualToString:v24];

      if ((v39 & 1) != 0)
      {
        __int128 v43 = 0LL;
        __int128 v42 = v34;
LABEL_30:
        id v45 = v34;

        goto LABEL_31;
      }

      __int128 v40 = (void *)objc_claimAutoreleasedReturnValue([v37 viewControllerClassName]);
      unsigned int v41 = [v40 isEqualToString:v26];

      if (v41)
      {
        __int128 v42 = 0LL;
        __int128 v43 = v34;
        goto LABEL_30;
      }
    }

    id v31 = [obj countByEnumeratingWithState:&v77 objects:v81 count:16];
    __int128 v42 = 0LL;
    __int128 v43 = 0LL;
    if (v31) {
      continue;
    }
    break;
  }

- (void)xpcUpdateBulletin:(id)a3 withMessage:(id)a4 withCompletion:(id)a5
{
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_1000DDA94;
  v10[3] = &unk_1003D32D8;
  v10[4] = self;
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v7 = v13;
  id v8 = v12;
  id v9 = v11;
  dispatch_async(&_dispatch_main_q, v10);
}

- (id)updateBulletin:(id)a3 withMessage:(id)a4 completionHandler:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[PBBulletinService _bulletinInfoForBulletin:](self, "_bulletinInfoForBulletin:", v9));
  id v13 = (void *)objc_claimAutoreleasedReturnValue(-[PBBulletinService bulletinToBannerAdapter](self, "bulletinToBannerAdapter"));
  if ([v13 isForwardableBulletin:v9])
  {
    v14 = (PBSBulletin *)[v9 copy];
    -[PBSBulletin setMessage:](v14, "setMessage:", v10);
    if (v12)
    {
      -[PBBulletinService _setBulletinInfo:forBulletin:](self, "_setBulletinInfo:forBulletin:", 0LL, v9);
      -[PBBulletinService _setBulletinInfo:forBulletin:](self, "_setBulletinInfo:forBulletin:", v12, v14);
      [v13 forwardBulletin:v14 responseHandler:v11];
    }

    else
    {
      v29[0] = _NSConcreteStackBlock;
      v29[1] = 3221225472LL;
      v29[2] = sub_1000DDDC4;
      v29[3] = &unk_1003D0E50;
      id v31 = v11;
      v30 = v14;
      -[PBBulletinService presentBulletin:withCompletion:](self, "presentBulletin:withCompletion:", v30, v29);
    }

- (id)_updateBulletin:(id)a3 withMessage:(id)a4 withCompletion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [v8 copy];
  [v11 setMessage:v9];
  uint64_t v12 = objc_opt_class(&OBJC_CLASS___PBBulletinService);
  id v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  objc_sync_enter(v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[PBBulletinService _viewControllerForBulletin:](self, "_viewControllerForBulletin:", v8));
  if (v14)
  {
    -[PBBulletinService _setViewController:forBulletin:](self, "_setViewController:forBulletin:", 0LL, v8);
    -[PBBulletinService _setViewController:forBulletin:](self, "_setViewController:forBulletin:", v14, v11);
    id v15 = (void *)objc_claimAutoreleasedReturnValue(-[PBBulletinService _bulletinInfoForBulletin:](self, "_bulletinInfoForBulletin:", v8));
    -[PBBulletinService _setBulletinInfo:forBulletin:](self, "_setBulletinInfo:forBulletin:", 0LL, v8);
    -[PBBulletinService _setBulletinInfo:forBulletin:](self, "_setBulletinInfo:forBulletin:", v15, v11);

    objc_sync_exit(v13);
    [v14 updateViewServiceWithBulletin:v11];
    [(id)objc_opt_class(self) _timeoutForBulletin:v11];
    uint64_t v17 = v16;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000DE104;
    block[3] = &unk_1003D6090;
    id v24 = v14;
    uint64_t v26 = v17;
    id v25 = v10;
    dispatch_async(&_dispatch_main_q, block);

    id v18 = v24;
LABEL_3:

    goto LABEL_8;
  }

  if (!-[PBBulletinService _bulletinIsPending:](self, "_bulletinIsPending:", v8))
  {
    objc_sync_exit(v13);

    -[PBBulletinService presentBulletin:withCompletion:](self, "presentBulletin:withCompletion:", v11, v10);
    goto LABEL_8;
  }

  -[PBBulletinService _updateRequestForBulletin:withBulletin:](self, "_updateRequestForBulletin:withBulletin:", v8, v11);
  id v19 = (void *)objc_claimAutoreleasedReturnValue(-[PBBulletinService _bulletinInfoForBulletin:](self, "_bulletinInfoForBulletin:", v8));
  [(id)objc_opt_class(self) _timeoutForBulletin:v11];
  objc_msgSend(v19, "setTimeoutInSeconds:");
  -[PBBulletinService _setBulletinInfo:forBulletin:](self, "_setBulletinInfo:forBulletin:", 0LL, v8);
  -[PBBulletinService _setBulletinInfo:forBulletin:](self, "_setBulletinInfo:forBulletin:", v19, v11);

  objc_sync_exit(v13);
  if (v10)
  {
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472LL;
    v21[2] = sub_1000DE15C;
    v21[3] = &unk_1003D0110;
    id v22 = v10;
    dispatch_async(&_dispatch_main_q, v21);
    id v18 = v22;
    goto LABEL_3;
  }

- (void)dismissBulletin:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_1000DE1F4;
  v4[3] = &unk_1003CFEB8;
  v4[4] = self;
  id v5 = a3;
  id v3 = v5;
  BSDispatchMain(v4);
}

- (void)_mainqueue_dismissBulletin:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[PBBulletinService bulletinToBannerAdapter](self, "bulletinToBannerAdapter"));
  if (([v5 isPresentableBulletin:v4] & 1) != 0
    || [v5 isForwardableBulletin:v4])
  {
    [v5 dismissBulletin:v4];
  }

  else
  {
    unsigned int v6 = -[PBBulletinService _bulletinIsPending:](self, "_bulletinIsPending:", v4);
    uint64_t v7 = objc_opt_class(&OBJC_CLASS___PBBulletinService);
    id obj = (id)objc_claimAutoreleasedReturnValue(v7);
    objc_sync_enter(obj);
    if (v6)
    {
      if (v4) {
        id v8 = (void *)objc_claimAutoreleasedReturnValue(-[PBBulletinService pendingBulletinsByRequestID](self, "pendingBulletinsByRequestID"));
      }
      else {
        id v8 = 0LL;
      }
      id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
      __int128 v20 = 0u;
      __int128 v21 = 0u;
      __int128 v18 = 0u;
      __int128 v19 = 0u;
      id v11 = v8;
      id v12 = [v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v12)
      {
        uint64_t v13 = *(void *)v19;
        do
        {
          for (i = 0LL; i != v12; i = (char *)i + 1)
          {
            if (*(void *)v19 != v13) {
              objc_enumerationMutation(v11);
            }
            uint64_t v15 = *(void *)(*((void *)&v18 + 1) + 8LL * (void)i);
            uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKey:v15]);
          }

          id v12 = [v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
        }

        while (v12);
      }

      [v11 removeObjectsForKeys:v10];
      objc_sync_exit(obj);

      -[PBBulletinService _handleApplicationDismissalForBulletin:withReason:]( self,  "_handleApplicationDismissalForBulletin:withReason:",  v4,  4LL);
    }

    else
    {
      id v9 = (void *)objc_claimAutoreleasedReturnValue(-[PBBulletinService _viewControllerForBulletin:](self, "_viewControllerForBulletin:", v4));
      objc_sync_exit(obj);

      -[PBBulletinService _handleApplicationDismissalForViewController:withReason:]( self,  "_handleApplicationDismissalForViewController:withReason:",  v9,  4LL);
    }
  }
}

- (void)setDelegate:(id)a3
{
}

- (void)setInteractionDelegate:(id)a3
{
}

- (void)remoteBulletinViewController:(id)a3 didReceiveBulletinResponse:(id)a4
{
  id v5 = a4;
  unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue([v5 actionIdentifier]);
  unsigned int v7 = [v6 isEqualToString:PBSSystemBulletinCameraActionStartPiP];

  if (v7)
  {
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472LL;
    v30[2] = sub_1000DE758;
    v30[3] = &unk_1003D63D8;
    v30[4] = self;
    id v8 = (id)objc_claimAutoreleasedReturnValue([v5 bulletin]);
    id v31 = v8;
    id v9 = objc_retainBlock(v30);
    uint64_t v10 = objc_opt_class(&OBJC_CLASS___PBSVideoBulletinResponse);
    id v11 = v5;
    id v12 = v11;
    if (v10)
    {
      if ((objc_opt_isKindOfClass(v11, v10) & 1) != 0) {
        uint64_t v13 = v12;
      }
      else {
        uint64_t v13 = 0LL;
      }
    }

    else
    {
      uint64_t v13 = 0LL;
    }

    id v19 = v13;

    __int128 v20 = (void *)objc_claimAutoreleasedReturnValue([v19 accessoryIdentifier]);
    uint64_t v32 = v20;
    __int128 v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v32, 1LL));
    id v22 = (void *)objc_claimAutoreleasedReturnValue( +[PBUISystemHomeServiceCameraActivationContext contextWithAccessoryIdentifiers:]( &OBJC_CLASS___PBUISystemHomeServiceCameraActivationContext,  "contextWithAccessoryIdentifiers:",  v21));

    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000DE778;
    block[3] = &unk_1003D0070;
    id v28 = v22;
    id v29 = v9;
    v23 = v9;
    id v24 = v22;
    dispatch_async(&_dispatch_main_q, block);
  }

  else
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue([v5 actionIdentifier]);
    unsigned int v15 = [v14 isEqualToString:PBSSystemBulletinActionDismiss];

    if (v15)
    {
      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v5 bulletin]);
      -[PBBulletinService dismissBulletin:](self, "dismissBulletin:", v16);
    }

    else
    {
      dispatch_queue_global_t global_queue = dispatch_get_global_queue(21LL, 0LL);
      __int128 v18 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
      v25[0] = _NSConcreteStackBlock;
      v25[1] = 3221225472LL;
      v25[2] = sub_1000DE7B4;
      v25[3] = &unk_1003CFEB8;
      v25[4] = self;
      id v26 = v5;
      dispatch_async(v18, v25);
    }
  }
}

- (id)serviceDelegateForAdapter:(id)a3
{
  return (id)objc_claimAutoreleasedReturnValue(-[PBBulletinService delegateProxy](self, "delegateProxy", a3));
}

- (id)adapter:(id)a3 bulletinInfoForBulletin:(id)a4
{
  return (id)objc_claimAutoreleasedReturnValue( -[PBBulletinService _bulletinInfoForBulletin:]( self,  "_bulletinInfoForBulletin:",  a4));
}

- (void)adapter:(id)a3 cleanupForBulletin:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  -[PBBulletinService _setBulletinInfo:forBulletin:](self, "_setBulletinInfo:forBulletin:", 0LL, v7);
  uint64_t v8 = objc_opt_class(&OBJC_CLASS___PBBulletinService);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  objc_sync_enter(v9);
  id v10 = [(id)objc_opt_class(self) _bulletinServicesByBulletinIdentifier];
  id v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v7 identifier]);
  [v11 removeObjectForKey:v12];

  objc_sync_exit(v9);
}

- (id)_reserveTableSpaceForBulletin:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = objc_opt_class(&OBJC_CLASS___PBBulletinService);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  objc_sync_enter(v8);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[PBBulletinService _bulletinInfoForBulletin:](self, "_bulletinInfoForBulletin:", v6));

  if (v9 || -[PBBulletinService _bulletinIsPending:](self, "_bulletinIsPending:", v6))
  {
    id v10 = 0LL;
  }

  else
  {
    uint64_t v12 = ++qword_100470A50;
    -[PBBulletinService _setBulletin:forRequestID:](self, "_setBulletin:forRequestID:", v6, qword_100470A50);
    id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", v12));
  }

  objc_sync_exit(v8);

  if (a4 && !v10) {
    *a4 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  PineBoardServicesErrorDomain,  301LL,  0LL));
  }

  return v10;
}

- (void)_completeWithBulletin:(id)a3 success:(BOOL)a4 error:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  uint64_t v13 = v12;
  if (v12)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000DEB3C;
    block[3] = &unk_1003D0020;
    id v20 = v12;
    BOOL v21 = a4;
    id v19 = v11;
    dispatch_async(&_dispatch_main_q, block);
  }

  if (!a4)
  {
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(21LL, 0LL);
    unsigned int v15 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472LL;
    v16[2] = sub_1000DEB60;
    v16[3] = &unk_1003CFEB8;
    v16[4] = self;
    id v17 = v10;
    dispatch_async(v15, v16);
  }
}

- (void)_handleApplicationDismissalForBulletin:(id)a3 withReason:(unint64_t)a4
{
  id v6 = a3;
  uint64_t v7 = objc_opt_class(&OBJC_CLASS___PBBulletinService);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  objc_sync_enter(v8);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[PBBulletinService _bulletinInfoForBulletin:](self, "_bulletinInfoForBulletin:", v6));
  -[PBBulletinService _setBulletinInfo:forBulletin:](self, "_setBulletinInfo:forBulletin:", 0LL, v6);
  objc_sync_exit(v8);

  if (v6)
  {
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(21LL, 0LL);
    id v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000DECF4;
    block[3] = &unk_1003D1718;
    void block[4] = self;
    id v16 = v6;
    unint64_t v17 = a4;
    dispatch_async(v11, block);
  }

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_1000DED30;
  v13[3] = &unk_1003CFF08;
  id v14 = v9;
  id v12 = v9;
  dispatch_async(&_dispatch_main_q, v13);
}

- (void)_handleApplicationDismissalForViewController:(id)a3 withReason:(unint64_t)a4
{
}

- (void)_handleApplicationDismissalForViewController:(id)a3 withReason:(unint64_t)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = objc_opt_class(&OBJC_CLASS___PBRemoteBulletinViewController);
  id v11 = v8;
  id v12 = v11;
  if (v10)
  {
    if ((objc_opt_isKindOfClass(v11, v10) & 1) != 0) {
      uint64_t v13 = v12;
    }
    else {
      uint64_t v13 = 0LL;
    }
  }

  else
  {
    uint64_t v13 = 0LL;
  }

  id v14 = v13;

  uint64_t v15 = objc_opt_class(&OBJC_CLASS___PBBulletinService);
  id v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
  objc_sync_enter(v16);
  unint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(-[PBBulletinService _bulletinForViewController:](self, "_bulletinForViewController:", v14));
  -[PBBulletinService _setViewController:forBulletin:](self, "_setViewController:forBulletin:", 0LL, v17);
  -[PBBulletinService _setBulletinInfo:forBulletin:](self, "_setBulletinInfo:forBulletin:", 0LL, v17);
  [(id)objc_opt_class(self) _setBulletinService:0 forViewController:v14];
  objc_sync_exit(v16);

  if (!v17)
  {
    id v18 = sub_100082754();
    id v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      uint64_t v32 = self;
      __int16 v33 = 2112;
      id v34 = v14;
      _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "bulletinService %@ handle dismissal missing bulletin for viewController %@",  buf,  0x16u);
    }
  }

  if (!v14)
  {
    id v20 = sub_100082754();
    BOOL v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      uint64_t v32 = self;
      __int16 v33 = 2112;
      id v34 = v12;
      __int16 v35 = 2112;
      uint64_t v36 = 0LL;
      _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "bulletinService %@ handle dismissal missing viewController %@ remoteViewController %@",  buf,  0x20u);
    }
  }

  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472LL;
  v25[2] = sub_1000DF030;
  v25[3] = &unk_1003D6400;
  id v26 = v17;
  uint64_t v27 = self;
  id v29 = v9;
  unint64_t v30 = a4;
  id v28 = v14;
  id v22 = v9;
  id v23 = v14;
  id v24 = v17;
  [v23 dismissViewServiceWithReason:a4 completion:v25];
}

- (void)_prepareToPresentViewController:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[PBBulletinService _bulletinForViewController:](self, "_bulletinForViewController:", v4));
  if (v5)
  {
    uint64_t v6 = objc_opt_class(&OBJC_CLASS___PBRemoteBulletinViewController);
    id v7 = v4;
    id v8 = v7;
    if (v6)
    {
      if ((objc_opt_isKindOfClass(v7, v6) & 1) != 0) {
        id v9 = v8;
      }
      else {
        id v9 = 0LL;
      }
    }

    else
    {
      id v9 = 0LL;
    }

    id v10 = v9;

    [v10 prepareViewServiceWithBulletin:v5];
  }
}

- (void)_handleMenuButtonForViewController:(id)a3 withCompletion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = objc_opt_class(&OBJC_CLASS___PBRemoteBulletinViewController);
  id v8 = v5;
  id v9 = v8;
  if (v7)
  {
    if ((objc_opt_isKindOfClass(v8, v7) & 1) != 0) {
      id v10 = v9;
    }
    else {
      id v10 = 0LL;
    }
  }

  else
  {
    id v10 = 0LL;
  }

  id v11 = v10;

  [v11 handleMenuButtonWithCompletion:v6];
}

- (void)_setUserInteractionEnabled:(BOOL)a3 forViewController:(id)a4
{
  BOOL v4 = a3;
  id v5 = a4;
  uint64_t v6 = objc_opt_class(&OBJC_CLASS___PBRemoteBulletinViewController);
  id v7 = v5;
  id v8 = v7;
  if (v6)
  {
    if ((objc_opt_isKindOfClass(v7, v6) & 1) != 0) {
      id v9 = v8;
    }
    else {
      id v9 = 0LL;
    }
  }

  else
  {
    id v9 = 0LL;
  }

  id v10 = v9;

  [v10 setUserInteractionEnabled:v4];
}

- (void)toggleBulletinSizeForViewController:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___PBRemoteBulletinViewController);
  id v5 = v3;
  uint64_t v6 = v5;
  if (v4)
  {
    if ((objc_opt_isKindOfClass(v5, v4) & 1) != 0) {
      id v7 = v6;
    }
    else {
      id v7 = 0LL;
    }
  }

  else
  {
    id v7 = 0LL;
  }

  id v8 = v7;

  [v8 toggleBulletinSize];
}

- (void)_updateVideoBulletinViewController:(id)a3 withBulletin:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(id)objc_opt_class(self) _bulletinServiceForViewController:v8];
  id v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v12 _bulletinForViewController:v8]);
  [v12 _setViewController:0 forBulletin:v13];
  [(id)objc_opt_class(self) _setBulletinService:self forViewController:v8];
  -[PBBulletinService _setViewController:forBulletin:](self, "_setViewController:forBulletin:", v8, v9);
  uint64_t v14 = objc_opt_class(&OBJC_CLASS___PBBulletinService);
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  objc_sync_enter(v15);
  id v16 = (void *)objc_claimAutoreleasedReturnValue(-[PBBulletinService _bulletinInfoForBulletin:](self, "_bulletinInfoForBulletin:", v13));
  -[PBBulletinService _setBulletinInfo:forBulletin:](self, "_setBulletinInfo:forBulletin:", 0LL, v13);
  -[PBBulletinService _setBulletinInfo:forBulletin:](self, "_setBulletinInfo:forBulletin:", v16, v9);

  objc_sync_exit(v15);
  unint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v12 delegateProxy]);
  [v17 bulletinService:v12 didDismissBulletin:v13 withReason:4];

  [v8 updateViewServiceWithBulletin:v9];
  [(id)objc_opt_class(self) _timeoutForBulletin:v9];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000DF55C;
  block[3] = &unk_1003D6400;
  uint64_t v27 = v18;
  id v23 = v8;
  id v24 = self;
  id v25 = v9;
  id v26 = v10;
  id v19 = v10;
  id v20 = v9;
  id v21 = v8;
  dispatch_async(&_dispatch_main_q, block);
}

+ (double)_timeoutForBulletin:(id)a3
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([a3 message]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "bs_safeNumberForKey:", PBSSystemBulletinTimeoutKey));
  uint64_t v6 = v5;
  if (!v5)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "bs_safeNumberForKey:", PBSSystemBulletinActivationActionKey));
    if (v9
      && (id v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "bs_safeStringForKey:", PBSSystemBulletinFooterMessageKey)),
          [v3 length]))
    {
    }

    else
    {
      id v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "bs_safeArrayForKey:", PBSSystemBulletinActionsKey));
      id v11 = [v10 count];

      if (v9)
      {
      }

      if (!v11)
      {
        id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
        [v12 bulletinNotificationAutoDismissalTimeInSeconds];
        goto LABEL_11;
      }
    }

    id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
    [v12 actionableBulletinNotificationAutoDismissalTimeInSeconds];
LABEL_11:
    double v8 = v13;

    goto LABEL_12;
  }

  [v5 doubleValue];
  double v8 = v7;
LABEL_12:

  return v8;
}

- (void)_setBulletin:(id)a3 forRequestID:(unint64_t)a4
{
  id v6 = a3;
  uint64_t v7 = objc_opt_class(&OBJC_CLASS___PBBulletinService);
  double v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  objc_sync_enter(v8);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[PBBulletinService pendingBulletinsByRequestID](self, "pendingBulletinsByRequestID"));
  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a4));
  if (v6) {
    [v9 setObject:v6 forKey:v10];
  }
  else {
    [v9 removeObjectForKey:v10];
  }

  objc_sync_exit(v8);
}

- (id)_bulletinForRequestID:(unint64_t)a3
{
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___PBBulletinService);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  objc_sync_enter(v6);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[PBBulletinService pendingBulletinsByRequestID](self, "pendingBulletinsByRequestID"));
  double v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a3));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:v8]);

  objc_sync_exit(v6);
  return v9;
}

- (void)_updateRequestForBulletin:(id)a3 withBulletin:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = objc_opt_class(&OBJC_CLASS___PBBulletinService);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  objc_sync_enter(v9);
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  id v10 = self->_pendingBulletinsByRequestID;
  id v11 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v10,  "countByEnumeratingWithState:objects:count:",  &v18,  v22,  16LL);
  if (v11)
  {
    uint64_t v12 = *(void *)v19;
    while (2)
    {
      for (i = 0LL; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v19 != v12) {
          objc_enumerationMutation(v10);
        }
        uint64_t v14 = *(void **)(*((void *)&v18 + 1) + 8LL * (void)i);
        id v15 = (id)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKey:]( self->_pendingBulletinsByRequestID,  "objectForKey:",  v14,  (void)v18));
        BOOL v16 = v15 == v6;

        if (v16)
        {
          id v17 = v14;

          if (v17) {
            -[PBBulletinService _setBulletin:forRequestID:]( self,  "_setBulletin:forRequestID:",  v7,  [v17 unsignedIntegerValue]);
          }
          goto LABEL_12;
        }
      }

      id v11 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v10,  "countByEnumeratingWithState:objects:count:",  &v18,  v22,  16LL);
      if (v11) {
        continue;
      }
      break;
    }
  }

  id v17 = 0LL;
LABEL_12:

  objc_sync_exit(v9);
}

- (BOOL)_bulletinIsPending:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___PBBulletinService);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  objc_sync_enter(v6);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[PBBulletinService pendingBulletinsByRequestID](self, "pendingBulletinsByRequestID"));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 allValues]);
  unsigned __int8 v9 = [v8 containsObject:v4];

  objc_sync_exit(v6);
  return v9;
}

- (BOOL)_shouldBeginUserInteractionOnActivationForViewController:(id)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[PBBulletinService _bulletinForViewController:](self, "_bulletinForViewController:", a3));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  PBSVideoSystemBulletinViewControllerClassName,  PBSMultiCamSystemBulletinViewControllerClassName,  0LL));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v3 viewControllerClassName]);
  unsigned __int8 v6 = [v4 containsObject:v5];

  return v6;
}

- (id)_bulletinForViewController:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___PBBulletinService);
  unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  objc_sync_enter(v6);
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  id v7 = (id)objc_claimAutoreleasedReturnValue(-[PBBulletinService viewControllersByBulletin](self, "viewControllersByBulletin"));
  id v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v16;
    while (2)
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v7);
        }
        id v11 = *(void **)(*((void *)&v15 + 1) + 8LL * (void)i);
        id v12 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", v11, (void)v15));
        BOOL v13 = v12 == v4;

        if (v13)
        {
          id v8 = v11;
          goto LABEL_11;
        }
      }

      id v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }

- (id)_viewControllerForBulletin:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___PBBulletinService);
  unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  objc_sync_enter(v6);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[PBBulletinService viewControllersByBulletin](self, "viewControllersByBulletin"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:v4]);

  objc_sync_exit(v6);
  return v8;
}

- (void)_setViewController:(id)a3 forBulletin:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = objc_opt_class(&OBJC_CLASS___PBBulletinService);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  objc_sync_enter(v9);
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[PBBulletinService viewControllersByBulletin](self, "viewControllersByBulletin"));
  id v11 = v10;
  if (v6)
  {
    [v10 setObject:v6 forKey:v7];
  }

  else
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKey:v7]);
    BOOL v13 = v12 == 0LL;

    if (!v13)
    {
      id v14 = sub_100082754();
      __int128 v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        id v16 = (id)objc_claimAutoreleasedReturnValue([v11 objectForKey:v7]);
        __int128 v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](&OBJC_CLASS___NSThread, "callStackSymbols"));
        int v18 = 138413058;
        __int128 v19 = self;
        __int16 v20 = 2112;
        id v21 = v16;
        __int16 v22 = 2112;
        id v23 = v7;
        __int16 v24 = 2112;
        id v25 = v17;
        _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "%@ removing bulletinViewController %@ for bulletin %@ bt %@",  (uint8_t *)&v18,  0x2Au);
      }

      [v11 removeObjectForKey:v7];
    }
  }

  objc_sync_exit(v9);
}

- (id)_bulletinForBulletinInfo:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___PBBulletinService);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  objc_sync_enter(v6);
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  id v7 = (id)objc_claimAutoreleasedReturnValue(-[PBBulletinService bulletinInfoByBulletin](self, "bulletinInfoByBulletin"));
  id v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v16;
    while (2)
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v7);
        }
        id v11 = *(void **)(*((void *)&v15 + 1) + 8LL * (void)i);
        id v12 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", v11, (void)v15));
        BOOL v13 = v12 == v4;

        if (v13)
        {
          id v8 = v11;
          goto LABEL_11;
        }
      }

      id v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }

- (id)_bulletinInfoForBulletin:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___PBBulletinService);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  objc_sync_enter(v6);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[PBBulletinService bulletinInfoByBulletin](self, "bulletinInfoByBulletin"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:v4]);

  objc_sync_exit(v6);
  return v8;
}

- (void)_setBulletinInfo:(id)a3 forBulletin:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = objc_opt_class(&OBJC_CLASS___PBBulletinService);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  objc_sync_enter(v9);
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[PBBulletinService bulletinInfoByBulletin](self, "bulletinInfoByBulletin"));
  id v11 = v10;
  if (v6)
  {
    [v10 setObject:v6 forKey:v7];
  }

  else
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKey:v7]);
    BOOL v13 = v12 == 0LL;

    if (!v13)
    {
      id v14 = sub_100082754();
      __int128 v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        id v16 = (id)objc_claimAutoreleasedReturnValue([v11 objectForKey:v7]);
        __int128 v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](&OBJC_CLASS___NSThread, "callStackSymbols"));
        int v18 = 138413058;
        __int128 v19 = self;
        __int16 v20 = 2112;
        id v21 = v16;
        __int16 v22 = 2112;
        id v23 = v7;
        __int16 v24 = 2112;
        id v25 = v17;
        _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "%@ removing bulletinInfo %@ for bulletin %@ bt %@",  (uint8_t *)&v18,  0x2Au);
      }

      [v11 removeObjectForKey:v7];
    }
  }

  objc_sync_exit(v9);
}

+ (id)_bulletinServiceForViewController:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___PBBulletinService);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  objc_sync_enter(v6);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _bulletinServicesByViewController]);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:v4]);

  objc_sync_exit(v6);
  return v8;
}

+ (void)_setBulletinService:(id)a3 forViewController:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = objc_opt_class(&OBJC_CLASS___PBBulletinService);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  objc_sync_enter(v9);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([a1 _bulletinServicesByViewController]);
  id v11 = v10;
  if (v6)
  {
    [v10 setObject:v6 forKey:v7];
  }

  else
  {
    id v12 = sub_100082754();
    BOOL v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      id v14 = (id)objc_claimAutoreleasedReturnValue([v11 objectForKey:v7]);
      __int128 v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](&OBJC_CLASS___NSThread, "callStackSymbols"));
      int v16 = 138412802;
      id v17 = v14;
      __int16 v18 = 2112;
      id v19 = v7;
      __int16 v20 = 2112;
      id v21 = v15;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "removing bulletin service %@ for viewController %@ bt %@",  (uint8_t *)&v16,  0x20u);
    }

    [v11 removeObjectForKey:v7];
  }

  objc_sync_exit(v9);
}

- (PBSystemServiceConnection)remoteConnection
{
  return (PBSystemServiceConnection *)objc_loadWeakRetained((id *)&self->_remoteConnection);
}

- (NSMapTable)viewControllersByBulletin
{
  return self->_viewControllersByBulletin;
}

- (NSMapTable)bulletinInfoByBulletin
{
  return self->_bulletinInfoByBulletin;
}

- (NSMutableDictionary)pendingBulletinsByRequestID
{
  return self->_pendingBulletinsByRequestID;
}

- (PBSBulletinServiceDelegate)delegateProxy
{
  return (PBSBulletinServiceDelegate *)objc_getProperty(self, a2, 40LL, 1);
}

- (void)setDelegateProxy:(id)a3
{
}

- (PBSBulletinServiceInteractionDelegate)interactionDelegateProxy
{
  return (PBSBulletinServiceInteractionDelegate *)objc_getProperty(self, a2, 48LL, 1);
}

- (void)setInteractionDelegateProxy:(id)a3
{
}

- (PBSystemOverlayController)overlayController
{
  return self->_overlayController;
}

- (PBBulletinToBannerAdapter)bulletinToBannerAdapter
{
  return self->_bulletinToBannerAdapter;
}

- (void).cxx_destruct
{
}

@end
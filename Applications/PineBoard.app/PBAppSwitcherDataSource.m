@interface PBAppSwitcherDataSource
- (BOOL)canKillItem:(id)a3;
- (BOOL)canSwitchToItem:(id)a3;
- (NSArray)items;
- (NSArray)pendingUpdates;
- (NSMutableArray)itemsIncludingUpdates;
- (PBAppInfoController)appInfoController;
- (PBAppSwitcherDataSource)init;
- (PBAppSwitcherDataSource)initWithFocusedProcessBundleID:(id)a3;
- (PBAppSwitcherDataSourceDelegate)delegate;
- (PBAppSwitcherItem)focusedProcessItem;
- (PBAppSwitcherItem)kioskItem;
- (id)indexPathForItem:(id)a3;
- (void)_populateItems:(id)a3;
- (void)_recalculateUpdates:(BOOL)a3;
- (void)_updateWithRemovedItems:(id)a3;
- (void)appInfoController:(id)a3 didUpdate:(id)a4;
- (void)appTransitioner:(id)a3 didCompleteAppTransition:(id)a4;
- (void)applyPendingUpdates;
- (void)dealloc;
- (void)handleActivationRequestForItem:(id)a3 completion:(id)a4;
- (void)handleKillRequestForItem:(id)a3;
- (void)handleLaunchRequestForItemWithIdentifier:(id)a3 completion:(id)a4;
- (void)setDelegate:(id)a3;
@end

@implementation PBAppSwitcherDataSource

- (PBAppSwitcherDataSource)init
{
  return 0LL;
}

- (PBAppSwitcherDataSource)initWithFocusedProcessBundleID:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___PBAppSwitcherDataSource;
  v5 = -[PBAppSwitcherDataSource init](&v15, "init");
  if (v5)
  {
    v6 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
    itemsIncludingUpdates = v5->_itemsIncludingUpdates;
    v5->_itemsIncludingUpdates = v6;

    v8 = objc_opt_new(&OBJC_CLASS___NSArray);
    pendingUpdates = v5->_pendingUpdates;
    v5->_pendingUpdates = v8;

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[PineBoard sharedAppInfoStore](&OBJC_CLASS___PineBoard, "sharedAppInfoStore"));
    uint64_t v11 = objc_claimAutoreleasedReturnValue([v10 appInfoControllerWithEnabledAndVisibleApps]);
    appInfoController = v5->_appInfoController;
    v5->_appInfoController = (PBAppInfoController *)v11;

    -[PBAppInfoController setDelegate:](v5->_appInfoController, "setDelegate:", v5);
    v13 = (void *)objc_claimAutoreleasedReturnValue( +[PBDefaultOpenAppTransitioner sharedInstance]( &OBJC_CLASS___PBDefaultOpenAppTransitioner,  "sharedInstance"));
    [v13 addObserver:v5];

    -[PBAppSwitcherDataSource _populateItems:](v5, "_populateItems:", v4);
  }

  return v5;
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[PBDefaultOpenAppTransitioner sharedInstance]( &OBJC_CLASS___PBDefaultOpenAppTransitioner,  "sharedInstance"));
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___PBAppSwitcherDataSource;
  -[PBAppSwitcherDataSource dealloc](&v4, "dealloc");
}

- (BOOL)canSwitchToItem:(id)a3
{
  id v3 = a3;
  if ([v3 itemType]
    || (v5 = (void *)objc_claimAutoreleasedReturnValue([v3 identifier]), v5, !v5))
  {
    LOBYTE(v4) = 1;
  }

  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue([v3 appInfo]);
    unsigned int v4 = [v6 isAnyTerminationAssertionInEffect] ^ 1;
  }

  return v4;
}

- (BOOL)canKillItem:(id)a3
{
  id v3 = a3;
  if ([v3 itemType])
  {
    LOBYTE(v4) = 0;
  }

  else
  {
    unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue([v3 identifier]);

    if (v4)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue([v3 appInfo]);
      LODWORD(v4) = [v5 isAnyTerminationAssertionInEffect] ^ 1;
    }
  }

  return (char)v4;
}

- (void)handleActivationRequestForItem:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v6
    || ([v6 isPendingDeletion] & 1) != 0
    || (v8 = (void *)objc_claimAutoreleasedReturnValue(-[PBAppSwitcherDataSource items](self, "items")),
        unsigned __int8 v9 = [v8 containsObject:v6],
        v8,
        (v9 & 1) == 0))
  {
    uint64_t v10 = objc_claimAutoreleasedReturnValue(-[PBAppSwitcherDataSource kioskItem](self, "kioskItem"));

    id v6 = (id)v10;
  }

  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[PBProcessManager sharedInstance](&OBJC_CLASS___PBProcessManager, "sharedInstance"));
  v12 = (void *)objc_claimAutoreleasedReturnValue([v6 identifier]);
  [v11 openApplication:v12 launchURL:0 options:0 suspended:0 completion:v7];
}

- (void)handleLaunchRequestForItemWithIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  itemsIncludingUpdates = self->_itemsIncludingUpdates;
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472LL;
  v25[2] = sub_1000F2B14;
  v25[3] = &unk_1003D6B90;
  id v8 = v6;
  id v26 = v8;
  id v9 = a4;
  id v10 = -[NSMutableArray indexOfObjectPassingTest:](itemsIncludingUpdates, "indexOfObjectPassingTest:", v25);
  if (v10 == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[PBAppInfoController appInfos](self->_appInfoController, "appInfos"));
    v12 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKey:v8]);

    v13 = -[PBAppSwitcherItem initWithType:bundleIdentifier:appInfo:dataSource:live:]( objc_alloc(&OBJC_CLASS___PBAppSwitcherItem),  "initWithType:bundleIdentifier:appInfo:dataSource:live:",  0LL,  v8,  v12,  self,  0LL);
    -[PBAppSwitcherItem setPendingInsertion:](v13, "setPendingInsertion:", 1LL);
    v14 = (char *)-[NSMutableArray indexOfObject:](self->_itemsIncludingUpdates, "indexOfObject:", self->_kioskItem);
    if (v14 > -[NSMutableArray count](self->_itemsIncludingUpdates, "count"))
    {
      objc_super v15 = (void *)objc_claimAutoreleasedReturnValue(-[PBAppInfoController configuration](self->_appInfoController, "configuration"));
      v16 = (void *)objc_claimAutoreleasedReturnValue([v15 kioskAppBundleIdentifier]);
      unsigned int v17 = [@"com.apple.HeadBoard" isEqual:v16];

      id v18 = sub_100082664();
      v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
      {
        id v23 = -[NSMutableArray count](self->_itemsIncludingUpdates, "count");
        kioskItem = self->_kioskItem;
        *(_DWORD *)buf = 134218496;
        id v28 = v23;
        __int16 v29 = 2048;
        v30 = kioskItem;
        __int16 v31 = 1024;
        unsigned int v32 = v17;
        _os_log_fault_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_FAULT,  "Unable to locate kiosk item {items.count=%lu, kiosk_item=%p, kiosk_is_default=%{BOOL}d}",  buf,  0x1Cu);
      }

      v20 = (char *)-[NSMutableArray count](self->_itemsIncludingUpdates, "count");
      if (v20) {
        v14 = v20 - 1;
      }
      else {
        v14 = 0LL;
      }
    }

    -[NSMutableArray insertObject:atIndex:](self->_itemsIncludingUpdates, "insertObject:atIndex:", v13, v14);
    -[PBAppSwitcherDataSource _recalculateUpdates:](self, "_recalculateUpdates:", 0LL);
  }

  else
  {
    v13 = (PBAppSwitcherItem *)objc_claimAutoreleasedReturnValue( -[NSMutableArray objectAtIndexedSubscript:]( self->_itemsIncludingUpdates,  "objectAtIndexedSubscript:",  v10));
  }

  if (-[PBAppSwitcherItem isPendingDeletion](v13, "isPendingDeletion"))
  {
    v21 = self->_kioskItem;

    v13 = v21;
  }

  v22 = (void *)objc_claimAutoreleasedReturnValue(-[PBAppSwitcherDataSource delegate](self, "delegate"));
  [v22 dataSource:self didReceiveLaunchRequestForItem:v13 completion:v9];
}

- (void)handleKillRequestForItem:(id)a3
{
  unsigned int v4 = (PBAppSwitcherItem *)a3;
  -[PBAppSwitcherItem setPendingDeletion:](v4, "setPendingDeletion:", 1LL);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[PBProcessManager sharedInstance](&OBJC_CLASS___PBProcessManager, "sharedInstance"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[PBAppSwitcherItem identifier](v4, "identifier"));
  [v5 killApplication:v6 removeFromRecents:1];

  focusedProcessItem = self->_focusedProcessItem;
  if (focusedProcessItem == v4)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue( +[PBSceneLayoutViewController sceneLayoutViewControllerForMainDisplay]( &OBJC_CLASS___PBSceneLayoutViewController,  "sceneLayoutViewControllerForMainDisplay"));
    [v8 removeApplicationLevelSceneLayoutElementForReason:@"App Switcher Killed Live Scene"];
  }

  -[PBAppSwitcherDataSource _recalculateUpdates:](self, "_recalculateUpdates:", 1LL);
}

- (id)indexPathForItem:(id)a3
{
  NSUInteger v3 = -[NSArray indexOfObject:](self->_items, "indexOfObject:", a3);
  if (v3 == 0x7FFFFFFFFFFFFFFFLL) {
    unsigned int v4 = 0LL;
  }
  else {
    unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSIndexPath indexPathForRow:inSection:]( &OBJC_CLASS___NSIndexPath,  "indexPathForRow:inSection:",  v3,  0LL));
  }
  return v4;
}

- (void)applyPendingUpdates
{
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  NSUInteger v3 = self->_pendingUpdates;
  id v4 = -[NSArray countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v20,  v24,  16LL);
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v21;
    do
    {
      for (i = 0LL; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v21 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v20 + 1) + 8LL * (void)i);
        id v9 = objc_msgSend(v8, "type", (void)v20);
        if (v9)
        {
          if (v9 == (id)1)
          {
            id v10 = (void *)objc_claimAutoreleasedReturnValue([v8 item]);
            unsigned int v11 = [v10 isEqual:self->_focusedProcessItem];

            if (v11)
            {
              focusedProcessItem = self->_focusedProcessItem;
              self->_focusedProcessItem = 0LL;
            }

            v13 = (void *)objc_claimAutoreleasedReturnValue([v8 fromIndexPath]);
            id v14 = [v13 item];

            -[NSMutableArray removeObjectAtIndex:](self->_itemsIncludingUpdates, "removeObjectAtIndex:", v14);
          }
        }

        else
        {
          objc_super v15 = (void *)objc_claimAutoreleasedReturnValue([v8 item]);
          [v15 setPendingInsertion:0];
        }
      }

      id v5 = -[NSArray countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v20,  v24,  16LL);
    }

    while (v5);
  }

  v16 = objc_opt_new(&OBJC_CLASS___NSArray);
  pendingUpdates = self->_pendingUpdates;
  self->_pendingUpdates = v16;

  id v18 = (NSArray *)-[NSMutableArray copy](self->_itemsIncludingUpdates, "copy");
  items = self->_items;
  self->_items = v18;
}

- (void)appInfoController:(id)a3 didUpdate:(id)a4
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1000F2E78;
  v5[3] = &unk_1003CFEB8;
  v5[4] = self;
  id v6 = a4;
  id v4 = v6;
  dispatch_async(&_dispatch_main_q, v5);
}

- (void)_populateItems:(id)a3
{
  id v4 = a3;
  id v5 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  kioskItem = self->_kioskItem;
  self->_kioskItem = 0LL;

  p_focusedProcessItem = &self->_focusedProcessItem;
  focusedProcessItem = self->_focusedProcessItem;
  self->_focusedProcessItem = 0LL;

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[PBAppInfoController configuration](self->_appInfoController, "configuration"));
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 kioskAppBundleIdentifier]);

  unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue(-[PBAppInfoController appInfos](self->_appInfoController, "appInfos"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[PBProcessManager sharedInstance](&OBJC_CLASS___PBProcessManager, "sharedInstance"));
  v13 = (void *)objc_claimAutoreleasedReturnValue([v12 recentApplicationBundleIdentifiers]);
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472LL;
  v28[2] = sub_1000F3478;
  v28[3] = &unk_1003D6BB8;
  id v14 = v11;
  id v29 = v14;
  id v15 = v4;
  id v30 = v15;
  id v16 = v10;
  id v31 = v16;
  unsigned int v32 = self;
  unsigned int v17 = v5;
  v33 = v17;
  [v13 enumerateObjectsUsingBlock:v28];

  if (!self->_kioskItem)
  {
    id v18 = [v15 isEqual:v16];
    v19 = -[PBAppSwitcherItem initWithType:bundleIdentifier:appInfo:dataSource:live:]( objc_alloc(&OBJC_CLASS___PBAppSwitcherItem),  "initWithType:bundleIdentifier:appInfo:dataSource:live:",  1LL,  v16,  0LL,  self,  v18);
    -[NSMutableArray addObject:](v17, "addObject:", v19);
    __int128 v20 = self->_kioskItem;
    self->_kioskItem = v19;
    __int128 v21 = v19;

    __int128 v22 = v21;
    objc_storeStrong((id *)&self->_focusedProcessItem, v22);
  }

  __int128 v23 = *p_focusedProcessItem;
  if (!*p_focusedProcessItem) {
    __int128 v23 = self->_kioskItem;
  }
  objc_storeStrong((id *)&self->_focusedProcessItem, v23);
  itemsIncludingUpdates = self->_itemsIncludingUpdates;
  self->_itemsIncludingUpdates = v17;
  v25 = v17;

  id v26 = (NSArray *)-[NSMutableArray copy](v25, "copy");
  items = self->_items;
  self->_items = v26;
}

- (void)_updateWithRemovedItems:(id)a3
{
  id v4 = a3;
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  id v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      id v8 = 0LL;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * (void)v8) setPendingDeletion:1];
        id v8 = (char *)v8 + 1;
      }

      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }

    while (v6);
  }

  -[PBAppSwitcherDataSource _recalculateUpdates:](self, "_recalculateUpdates:", 1LL);
}

- (void)_recalculateUpdates:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  id v6 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableArray tvs_objectsPassingTest:]( self->_itemsIncludingUpdates,  "tvs_objectsPassingTest:",  &stru_1003D6BF8));
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_1000F381C;
  v17[3] = &unk_1003D6C20;
  uint64_t v7 = v5;
  id v18 = v7;
  [v6 enumerateObjectsWithOptions:2 usingBlock:v17];
  id v8 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableArray tvs_objectsPassingTest:]( self->_itemsIncludingUpdates,  "tvs_objectsPassingTest:",  &stru_1003D6C40));
  v16[0] = 0LL;
  v16[1] = v16;
  v16[2] = 0x2020000000LL;
  v16[3] = 0LL;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_1000F38C0;
  v13[3] = &unk_1003D6C68;
  id v15 = v16;
  __int128 v9 = v7;
  id v14 = v9;
  [v8 enumerateObjectsUsingBlock:v13];
  __int128 v10 = (NSArray *)-[NSMutableArray copy](v9, "copy");
  pendingUpdates = self->_pendingUpdates;
  self->_pendingUpdates = v10;

  if (-[NSArray count](self->_pendingUpdates, "count"))
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained dataSourceDidEnqueuePendingUpdates:self animated:v3];
  }

  _Block_object_dispose(v16, 8);
}

- (void)appTransitioner:(id)a3 didCompleteAppTransition:(id)a4
{
  id v5 = a4;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 openRequest]);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 toAppInfo]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 bundleIdentifier]);

  __int128 v9 = (void *)objc_claimAutoreleasedReturnValue(-[PBAppInfoController appInfos](self->_appInfoController, "appInfos"));
  __int128 v10 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKey:v8]);

  __int128 v11 = (void *)objc_claimAutoreleasedReturnValue([v5 openRequest]);
  LODWORD(v5) = [v11 isForeground];

  if ((_DWORD)v5 && v10)
  {
    itemsIncludingUpdates = self->_itemsIncludingUpdates;
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472LL;
    v19[2] = sub_1000F3B70;
    v19[3] = &unk_1003D6B90;
    id v13 = v8;
    id v20 = v13;
    if (-[NSMutableArray indexOfObjectPassingTest:](itemsIncludingUpdates, "indexOfObjectPassingTest:", v19) == (id)0x7FFFFFFFFFFFFFFFLL)
    {
      id v14 = sub_100082664();
      id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v22 = v13;
        _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "Updating app switcher due to new application launch %@",  buf,  0xCu);
      }

      id v16 = -[PBAppSwitcherItem initWithType:bundleIdentifier:appInfo:dataSource:live:]( objc_alloc(&OBJC_CLASS___PBAppSwitcherItem),  "initWithType:bundleIdentifier:appInfo:dataSource:live:",  0LL,  v13,  v10,  self,  1LL);
      -[PBAppSwitcherItem setPendingInsertion:](v16, "setPendingInsertion:", 1LL);
      focusedProcessItem = self->_focusedProcessItem;
      self->_focusedProcessItem = v16;
      id v18 = v16;

      -[NSMutableArray insertObject:atIndex:]( self->_itemsIncludingUpdates,  "insertObject:atIndex:",  v18,  -[NSMutableArray indexOfObject:](self->_itemsIncludingUpdates, "indexOfObject:", self->_kioskItem));
      -[PBAppSwitcherDataSource _recalculateUpdates:](self, "_recalculateUpdates:", 1LL);
    }
  }
}

- (PBAppSwitcherDataSourceDelegate)delegate
{
  return (PBAppSwitcherDataSourceDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (NSArray)items
{
  return self->_items;
}

- (PBAppSwitcherItem)kioskItem
{
  return self->_kioskItem;
}

- (PBAppSwitcherItem)focusedProcessItem
{
  return self->_focusedProcessItem;
}

- (NSArray)pendingUpdates
{
  return self->_pendingUpdates;
}

- (NSMutableArray)itemsIncludingUpdates
{
  return self->_itemsIncludingUpdates;
}

- (PBAppInfoController)appInfoController
{
  return self->_appInfoController;
}

- (void).cxx_destruct
{
}

@end
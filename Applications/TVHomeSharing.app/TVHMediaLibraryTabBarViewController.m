@interface TVHMediaLibraryTabBarViewController
+ (TVHMediaLibraryTabBarViewController)new;
- (BOOL)ignoreSelectionChanges;
- (NSArray)mediaCategoryTypes;
- (TVHKMediaLibrary)mediaLibrary;
- (TVHMediaLibraryTabBarItemViewController)selectedTabBarItemViewController;
- (TVHMediaLibraryTabBarViewController)init;
- (TVHMediaLibraryTabBarViewController)initWithCoder:(id)a3;
- (TVHMediaLibraryTabBarViewController)initWithMediaLibrary:(id)a3 mediaCategoryTypes:(id)a4;
- (TVHMediaLibraryTabBarViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (id)_existingTabBarItemViewControllerWithTabBarItemType:(unint64_t)a3;
- (id)_moreViewController;
- (id)_newTabBarItemViewControllerWithTabBarItemType:(unint64_t)a3 mediaCategoryTypes:(id)a4;
- (id)_newTabBarItemViewControllersWithTabBarItemTypes:(id)a3 mediaCategoryTypes:(id)a4;
- (id)_tabBarItemTypesWithMediaCategoryTypes:(id)a3;
- (id)_tabBarItemViewControllerAtIndex:(unint64_t)a3;
- (id)_tabBarItemViewControllers;
- (unint64_t)_indexOfTabBarItemViewControllerForMediaCategoryType:(unint64_t)a3;
- (unint64_t)_indexOfTabBarItemViewControllerForTabBarItemType:(unint64_t)a3;
- (unint64_t)_mediaCategoryTypeFromSettings;
- (unint64_t)_tabBarItemTypeWithMediaCategoryType:(unint64_t)a3;
- (void)_saveMediaCategoryTypeToSettings:(unint64_t)a3;
- (void)_saveMediaCategoryTypeToSettingsWithTabBarItemViewController:(id)a3;
- (void)_setSelectedViewController:(id)a3;
- (void)_startObservingTabBarItemViewControllers:(id)a3;
- (void)_stopObservingTabBarItemViewControllers:(id)a3;
- (void)_updateWithMediaCategoryTypes:(id)a3;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setIgnoreSelectionChanges:(BOOL)a3;
- (void)setMediaCategoryTypes:(id)a3;
- (void)setSelectedTabBarItemViewController:(id)a3;
- (void)updateWithMediaCategoryTypes:(id)a3 changeSet:(id)a4;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation TVHMediaLibraryTabBarViewController

+ (TVHMediaLibraryTabBarViewController)new
{
  return 0LL;
}

- (TVHMediaLibraryTabBarViewController)init
{
  v3 = NSStringFromSelector(a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"The %@ initializer is not available.",  v4);

  return 0LL;
}

- (TVHMediaLibraryTabBarViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v5 = NSStringFromSelector(a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"The %@ initializer is not available.",  v6);

  return 0LL;
}

- (TVHMediaLibraryTabBarViewController)initWithCoder:(id)a3
{
  v4 = NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"The %@ initializer is not available.",  v5);

  return 0LL;
}

- (TVHMediaLibraryTabBarViewController)initWithMediaLibrary:(id)a3 mediaCategoryTypes:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v7) {
    +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"The %@ parameter must not be nil.",  @"mediaLibrary");
  }
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___TVHMediaLibraryTabBarViewController;
  v9 = -[TVHMediaLibraryTabBarViewController initWithNibName:bundle:](&v12, "initWithNibName:bundle:", 0LL, 0LL);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_mediaLibrary, a3);
    -[TVHMediaLibraryTabBarViewController _updateWithMediaCategoryTypes:](v10, "_updateWithMediaCategoryTypes:", v8);
  }

  return v10;
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaLibraryTabBarViewController _tabBarItemViewControllers](self, "_tabBarItemViewControllers"));
  -[TVHMediaLibraryTabBarViewController _stopObservingTabBarItemViewControllers:]( self,  "_stopObservingTabBarItemViewControllers:",  v3);

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___TVHMediaLibraryTabBarViewController;
  -[TVHMediaLibraryTabBarViewController dealloc](&v4, "dealloc");
}

- (void)updateWithMediaCategoryTypes:(id)a3 changeSet:(id)a4
{
  id v5 = a3;
  -[TVHMediaLibraryTabBarViewController _updateWithMediaCategoryTypes:](self, "_updateWithMediaCategoryTypes:", v5);
  id v6 = (id)objc_claimAutoreleasedReturnValue(-[TVHMediaLibraryTabBarViewController _moreViewController](self, "_moreViewController"));
  [v6 updateWithMediaCategoryTypes:v5];
}

- (void)viewWillAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___TVHMediaLibraryTabBarViewController;
  -[TVHMediaLibraryTabBarViewController viewWillAppear:](&v5, "viewWillAppear:", a3);
  if ((-[TVHMediaLibraryTabBarViewController isMovingToParentViewController]( self,  "isMovingToParentViewController") & 1) == 0 && (-[TVHMediaLibraryTabBarViewController isBeingPresented](self, "isBeingPresented") & 1) == 0)
  {
    objc_super v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaLibraryTabBarViewController mediaCategoryTypes](self, "mediaCategoryTypes"));
    -[TVHMediaLibraryTabBarViewController _updateWithMediaCategoryTypes:](self, "_updateWithMediaCategoryTypes:", v4);
  }

- (void)_setSelectedViewController:(id)a3
{
  id v4 = a3;
  id v5 = -[TVHMediaLibraryTabBarViewController selectedIndex](self, "selectedIndex");
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___TVHMediaLibraryTabBarViewController;
  -[TVHMediaLibraryTabBarViewController _setSelectedViewController:](&v10, "_setSelectedViewController:", v4);
  if (!-[TVHMediaLibraryTabBarViewController ignoreSelectionChanges](self, "ignoreSelectionChanges"))
  {
    id v6 = -[TVHMediaLibraryTabBarViewController selectedIndex](self, "selectedIndex");
    uint64_t v7 = objc_claimAutoreleasedReturnValue( -[TVHMediaLibraryTabBarViewController selectedTabBarItemViewController]( self,  "selectedTabBarItemViewController"));
    id v8 = (void *)v7;
    if (v5 != v6 || !v7)
    {
      if ((objc_opt_respondsToSelector(v7, "didLoseSelection") & 1) != 0) {
        [v8 didLoseSelection];
      }
      id v9 = v4;
      -[TVHMediaLibraryTabBarViewController _saveMediaCategoryTypeToSettingsWithTabBarItemViewController:]( self,  "_saveMediaCategoryTypeToSettingsWithTabBarItemViewController:",  v9);
      if ((objc_opt_respondsToSelector(v9, "didReceiveSelection") & 1) != 0) {
        [v9 didReceiveSelection];
      }
      -[TVHMediaLibraryTabBarViewController setSelectedTabBarItemViewController:]( self,  "setSelectedTabBarItemViewController:",  v9);
    }
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a4;
  id v11 = a5;
  if (off_100157028 == a6)
  {
    objc_opt_class(&OBJC_CLASS___UIViewController);
    if ((objc_opt_isKindOfClass(v10, v12) & 1) != 0
      && [v10 conformsToProtocol:&OBJC_PROTOCOL___TVHMediaLibraryTabBarItemViewController])
    {
      id v13 = v10;
      id v14 = (id)objc_claimAutoreleasedReturnValue(-[TVHMediaLibraryTabBarViewController selectedViewController](self, "selectedViewController"));

      if (v14 == v13)
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "bs_safeNumberForKey:", NSKeyValueChangeNewKey));
        -[TVHMediaLibraryTabBarViewController _saveMediaCategoryTypeToSettings:]( self,  "_saveMediaCategoryTypeToSettings:",  [v15 unsignedIntegerValue]);
      }
    }
  }

  else
  {
    v16.receiver = self;
    v16.super_class = (Class)&OBJC_CLASS___TVHMediaLibraryTabBarViewController;
    -[TVHMediaLibraryTabBarViewController observeValueForKeyPath:ofObject:change:context:]( &v16,  "observeValueForKeyPath:ofObject:change:context:",  a3,  v10,  v11,  a6);
  }
}

- (void)setSelectedTabBarItemViewController:(id)a3
{
  id v5 = (TVHMediaLibraryTabBarItemViewController *)a3;
  if (self->_selectedTabBarItemViewController != v5)
  {
    objc_storeStrong((id *)&self->_selectedTabBarItemViewController, a3);
    id v6 = sub_10007A1C8();
    uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = sub_10008561C((unint64_t)-[TVHMediaLibraryTabBarItemViewController type](v5, "type"));
      id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
      int v10 = 138543362;
      id v11 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Tab bar view controller changed to: %{public}@",  (uint8_t *)&v10,  0xCu);
    }
  }
}

- (void)_updateWithMediaCategoryTypes:(id)a3
{
  id v4 = a3;
  id v5 = -[TVHMediaLibraryTabBarViewController selectedIndex](self, "selectedIndex");
  if (v5 == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    id v6 = -[TVHMediaLibraryTabBarViewController _mediaCategoryTypeFromSettings](self, "_mediaCategoryTypeFromSettings");
    uint64_t v7 = -1LL;
  }

  else
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue( -[TVHMediaLibraryTabBarViewController _tabBarItemViewControllerAtIndex:]( self,  "_tabBarItemViewControllerAtIndex:",  v5));
    id v6 = [v8 selectedMediaCategoryType];
    uint64_t v7 = (uint64_t)[v8 type];
  }

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaLibraryTabBarViewController _tabBarItemViewControllers](self, "_tabBarItemViewControllers"));
  int v10 = (void *)objc_claimAutoreleasedReturnValue([v9 valueForKey:@"type"]);
  id v11 = (void *)objc_claimAutoreleasedReturnValue( -[TVHMediaLibraryTabBarViewController _tabBarItemTypesWithMediaCategoryTypes:]( self,  "_tabBarItemTypesWithMediaCategoryTypes:",  v4));
  id v12 = objc_alloc_init(&OBJC_CLASS___TVHKCollectionComparator);
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 changeSetFromObjects:v10 toObjects:v11]);
  if ([v13 hasChanges])
  {
    uint64_t v18 = v7;
    id v14 = [v9 mutableCopy];
    -[TVHMediaLibraryTabBarViewController _stopObservingTabBarItemViewControllers:]( self,  "_stopObservingTabBarItemViewControllers:",  v14);
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472LL;
    v19[2] = sub_10008B564;
    v19[3] = &unk_1000FF8D0;
    id v20 = v11;
    v21 = self;
    id v22 = v4;
    objc_msgSend( v14,  "tvhk_applyChangeSetIfAvailable:destinationObjectsBlock:replaceContentsOnNilChangeSet:",  v13,  v19,  1);
    -[TVHMediaLibraryTabBarViewController _startObservingTabBarItemViewControllers:]( self,  "_startObservingTabBarItemViewControllers:",  v14);
    -[TVHMediaLibraryTabBarViewController setIgnoreSelectionChanges:](self, "setIgnoreSelectionChanges:", 1LL);
    -[TVHMediaLibraryTabBarViewController setViewControllers:animated:](self, "setViewControllers:animated:", v14, 0LL);
    -[TVHMediaLibraryTabBarViewController setIgnoreSelectionChanges:](self, "setIgnoreSelectionChanges:", 0LL);
    if (v6)
    {
      unint64_t v15 = -[TVHMediaLibraryTabBarViewController _indexOfTabBarItemViewControllerForMediaCategoryType:]( self,  "_indexOfTabBarItemViewControllerForMediaCategoryType:",  v6);
    }

    else
    {
      if (v18 == -1)
      {
        unint64_t v16 = 0LL;
LABEL_13:
        -[TVHMediaLibraryTabBarViewController setSelectedIndex:](self, "setSelectedIndex:", v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaLibraryTabBarViewController tabBar](self, "tabBar"));
        [v17 setNeedsLayout];

        goto LABEL_14;
      }

      unint64_t v15 = -[TVHMediaLibraryTabBarViewController _indexOfTabBarItemViewControllerForTabBarItemType:]( self,  "_indexOfTabBarItemViewControllerForTabBarItemType:");
    }

    if (v15 == 0x7FFFFFFFFFFFFFFFLL) {
      unint64_t v16 = 0LL;
    }
    else {
      unint64_t v16 = v15;
    }
    goto LABEL_13;
  }

- (id)_tabBarItemViewControllers
{
  v3 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaLibraryTabBarViewController viewControllers](self, "viewControllers", 0LL));
  id v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v12 + 1) + 8LL * (void)i);
        if ([v9 conformsToProtocol:&OBJC_PROTOCOL___TVHMediaLibraryTabBarItemViewController]) {
          -[NSMutableArray addObject:](v3, "addObject:", v9);
        }
      }

      id v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }

    while (v6);
  }

  id v10 = -[NSMutableArray copy](v3, "copy");
  return v10;
}

- (id)_tabBarItemViewControllerAtIndex:(unint64_t)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaLibraryTabBarViewController viewControllers](self, "viewControllers"));
  if ((unint64_t)[v4 count] <= a3)
  {
    id v6 = 0LL;
  }

  else
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectAtIndex:a3]);
    else {
      id v6 = 0LL;
    }
  }

  return v6;
}

- (id)_tabBarItemTypesWithMediaCategoryTypes:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(&OBJC_CLASS___NSMutableOrderedSet);
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v28 objects:v33 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v29;
    do
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v29 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = [*(id *)(*((void *)&v28 + 1) + 8 * (void)i) unsignedIntegerValue];
        if (v11)
        {
          __int128 v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  -[TVHMediaLibraryTabBarViewController _tabBarItemTypeWithMediaCategoryType:]( self,  "_tabBarItemTypeWithMediaCategoryType:",  v11)));
          -[NSMutableOrderedSet addObject:](v5, "addObject:", v12);
        }
      }

      id v8 = [v6 countByEnumeratingWithState:&v28 objects:v33 count:16];
    }

    while (v8);
  }

  if ((unint64_t)-[NSMutableOrderedSet count](v5, "count") >= 6)
  {
    __int128 v13 = objc_alloc_init(&OBJC_CLASS___NSMutableOrderedSet);
    __int128 v24 = 0u;
    __int128 v25 = 0u;
    __int128 v26 = 0u;
    __int128 v27 = 0u;
    __int128 v14 = v5;
    id v15 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:]( v14,  "countByEnumeratingWithState:objects:count:",  &v24,  v32,  16LL);
    if (v15)
    {
      id v16 = v15;
      uint64_t v17 = *(void *)v25;
      do
      {
        for (j = 0LL; j != v16; j = (char *)j + 1)
        {
          if (*(void *)v25 != v17) {
            objc_enumerationMutation(v14);
          }
          unint64_t v19 = (unint64_t)objc_msgSend( *(id *)(*((void *)&v24 + 1) + 8 * (void)j),  "unsignedIntegerValue",  (void)v24);
          if (v19 <= 8 && ((1LL << v19) & 0x10B) != 0)
          {
            v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  v19));
            -[NSMutableOrderedSet addObject:](v13, "addObject:", v21);
          }
        }

        id v16 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:]( v14,  "countByEnumeratingWithState:objects:count:",  &v24,  v32,  16LL);
      }

      while (v16);
    }

    id v5 = v13;
    -[NSMutableOrderedSet addObject:](v5, "addObject:", &off_1001064E0);
  }

  -[NSMutableOrderedSet addObject:](v5, "addObject:", &off_1001064F8, (void)v24);
  -[NSMutableOrderedSet addObject:](v5, "addObject:", &off_100106510);
  id v22 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableOrderedSet array](v5, "array"));

  return v22;
}

- (unint64_t)_tabBarItemTypeWithMediaCategoryType:(unint64_t)a3
{
  if (a3 > 9) {
    return 1LL;
  }
  else {
    return qword_1000C36E8[a3];
  }
}

- (id)_newTabBarItemViewControllersWithTabBarItemTypes:(id)a3 mediaCategoryTypes:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = -[NSMutableArray initWithCapacity:]( [NSMutableArray alloc],  "initWithCapacity:",  [v6 count]);
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  id v9 = v6;
  id v10 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v17;
    do
    {
      __int128 v13 = 0LL;
      do
      {
        if (*(void *)v17 != v12) {
          objc_enumerationMutation(v9);
        }
        id v14 = -[TVHMediaLibraryTabBarViewController _newTabBarItemViewControllerWithTabBarItemType:mediaCategoryTypes:]( self,  "_newTabBarItemViewControllerWithTabBarItemType:mediaCategoryTypes:",  objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * (void)v13), "unsignedIntegerValue", (void)v16),  v7);
        if (v14) {
          -[NSMutableArray addObject:](v8, "addObject:", v14);
        }

        __int128 v13 = (char *)v13 + 1;
      }

      while (v11 != v13);
      id v11 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }

    while (v11);
  }

  return v8;
}

- (id)_newTabBarItemViewControllerWithTabBarItemType:(unint64_t)a3 mediaCategoryTypes:(id)a4
{
  id v6 = a4;
  switch(a3)
  {
    case 0uLL:
      id v7 = objc_alloc(&OBJC_CLASS___TVHMusicTabBarItemViewController);
      id v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaLibraryTabBarViewController mediaLibrary](self, "mediaLibrary"));
      id v9 = -[TVHMusicTabBarItemViewController initWithMediaLibrary:](v7, "initWithMediaLibrary:", v8);

      id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
      id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 localizedStringForKey:@"MUSIC_TITLE" value:0 table:0]);

      uint64_t v12 = objc_alloc(&OBJC_CLASS___UITabBarItem);
      __int128 v13 = v11;
      uint64_t v14 = 0LL;
      goto LABEL_15;
    case 1uLL:
      __int128 v16 = objc_alloc(&OBJC_CLASS___TVHMoviesTabBarItemViewController);
      __int128 v17 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaLibraryTabBarViewController mediaLibrary](self, "mediaLibrary"));
      id v9 = -[TVHMoviesTabBarItemViewController initWithMediaLibrary:](v16, "initWithMediaLibrary:", v17);

      __int128 v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
      id v11 = (void *)objc_claimAutoreleasedReturnValue([v18 localizedStringForKey:@"MOVIES_TITLE" value:0 table:0]);

      uint64_t v12 = objc_alloc(&OBJC_CLASS___UITabBarItem);
      __int128 v13 = v11;
      uint64_t v14 = 1LL;
      goto LABEL_15;
    case 2uLL:
      __int128 v19 = objc_alloc(&OBJC_CLASS___TVHHomeVideosTabBarItemViewController);
      id v20 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaLibraryTabBarViewController mediaLibrary](self, "mediaLibrary"));
      id v9 = -[TVHHomeVideosTabBarItemViewController initWithMediaLibrary:](v19, "initWithMediaLibrary:", v20);

      v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
      id v11 = (void *)objc_claimAutoreleasedReturnValue([v21 localizedStringForKey:@"HOME_VIDEOS_TITLE" value:0 table:0]);

      uint64_t v12 = objc_alloc(&OBJC_CLASS___UITabBarItem);
      __int128 v13 = v11;
      uint64_t v14 = 2LL;
      goto LABEL_15;
    case 3uLL:
      id v22 = objc_alloc(&OBJC_CLASS___TVHShowsTabBarItemViewController);
      v23 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaLibraryTabBarViewController mediaLibrary](self, "mediaLibrary"));
      id v9 = -[TVHShowsTabBarItemViewController initWithMediaLibrary:](v22, "initWithMediaLibrary:", v23);

      __int128 v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
      id v11 = (void *)objc_claimAutoreleasedReturnValue([v24 localizedStringForKey:@"SHOWS_TITLE" value:0 table:0]);

      uint64_t v12 = objc_alloc(&OBJC_CLASS___UITabBarItem);
      __int128 v13 = v11;
      uint64_t v14 = 3LL;
      goto LABEL_15;
    case 4uLL:
      __int128 v25 = objc_alloc(&OBJC_CLASS___TVHMoreTabBarItemViewController);
      __int128 v26 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaLibraryTabBarViewController mediaLibrary](self, "mediaLibrary"));
      id v9 = -[TVHMoreTabBarItemViewController initWithMediaLibrary:mediaCategoryTypes:]( v25,  "initWithMediaLibrary:mediaCategoryTypes:",  v26,  v6);

      id v15 = -[UITabBarItem initWithTabBarSystemItem:tag:]( objc_alloc(&OBJC_CLASS___UITabBarItem),  "initWithTabBarSystemItem:tag:",  0LL,  4LL);
      __int128 v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
      __int128 v28 = v27;
      __int128 v29 = @"MORE_TITLE";
      goto LABEL_13;
    case 5uLL:
      __int128 v30 = objc_alloc(&OBJC_CLASS___TVHPodcastsTabBarItemViewController);
      __int128 v31 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaLibraryTabBarViewController mediaLibrary](self, "mediaLibrary"));
      id v9 = -[TVHPodcastsTabBarItemViewController initWithMediaLibrary:](v30, "initWithMediaLibrary:", v31);

      v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
      id v11 = (void *)objc_claimAutoreleasedReturnValue([v32 localizedStringForKey:@"PODCASTS_TITLE" value:0 table:0]);

      uint64_t v12 = objc_alloc(&OBJC_CLASS___UITabBarItem);
      __int128 v13 = v11;
      uint64_t v14 = 5LL;
      goto LABEL_15;
    case 6uLL:
      v33 = objc_alloc(&OBJC_CLASS___TVHAudiobooksTabBarItemViewController);
      v34 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaLibraryTabBarViewController mediaLibrary](self, "mediaLibrary"));
      id v9 = -[TVHAudiobooksTabBarItemViewController initWithMediaLibrary:](v33, "initWithMediaLibrary:", v34);

      v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
      id v11 = (void *)objc_claimAutoreleasedReturnValue([v35 localizedStringForKey:@"AUDIOBOOKS_TITLE" value:0 table:0]);

      uint64_t v12 = objc_alloc(&OBJC_CLASS___UITabBarItem);
      __int128 v13 = v11;
      uint64_t v14 = 6LL;
      goto LABEL_15;
    case 7uLL:
      v36 = objc_alloc(&OBJC_CLASS___TVHITunesUTabBarItemViewController);
      v37 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaLibraryTabBarViewController mediaLibrary](self, "mediaLibrary"));
      id v9 = -[TVHITunesUTabBarItemViewController initWithMediaLibrary:](v36, "initWithMediaLibrary:", v37);

      v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
      id v11 = (void *)objc_claimAutoreleasedReturnValue([v38 localizedStringForKey:@"ITUNES_U_TITLE" value:0 table:0]);

      uint64_t v12 = objc_alloc(&OBJC_CLASS___UITabBarItem);
      __int128 v13 = v11;
      uint64_t v14 = 7LL;
      goto LABEL_15;
    case 8uLL:
      v39 = objc_alloc(&OBJC_CLASS___TVHPhotosTabBarItemViewController);
      v40 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaLibraryTabBarViewController mediaLibrary](self, "mediaLibrary"));
      id v9 = -[TVHPhotosTabBarItemViewController initWithMediaLibrary:](v39, "initWithMediaLibrary:", v40);

      v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
      id v11 = (void *)objc_claimAutoreleasedReturnValue([v41 localizedStringForKey:@"PHOTOS_TITLE" value:0 table:0]);

      uint64_t v12 = objc_alloc(&OBJC_CLASS___UITabBarItem);
      __int128 v13 = v11;
      uint64_t v14 = 8LL;
      goto LABEL_15;
    case 9uLL:
      v42 = objc_alloc(&OBJC_CLASS___TVHSearchTabBarItemViewController);
      v43 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaLibraryTabBarViewController mediaLibrary](self, "mediaLibrary"));
      id v9 = -[TVHSearchTabBarItemViewController initWithMediaLibrary:](v42, "initWithMediaLibrary:", v43);

      id v15 = -[UITabBarItem initWithTabBarSystemItem:tag:]( objc_alloc(&OBJC_CLASS___UITabBarItem),  "initWithTabBarSystemItem:tag:",  8LL,  9LL);
      __int128 v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
      __int128 v28 = v27;
      __int128 v29 = @"SEARCH_TITLE";
LABEL_13:
      id v11 = (void *)objc_claimAutoreleasedReturnValue([v27 localizedStringForKey:v29 value:0 table:0]);

      break;
    case 0xAuLL:
      id v9 = objc_alloc_init(&OBJC_CLASS___TVHNowPlayingTabBarItemViewController);
      v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
      id v11 = (void *)objc_claimAutoreleasedReturnValue([v44 localizedStringForKey:@"NOW_PLAYING_TITLE" value:0 table:0]);

      uint64_t v12 = objc_alloc(&OBJC_CLASS___UITabBarItem);
      __int128 v13 = v11;
      uint64_t v14 = 10LL;
LABEL_15:
      id v15 = -[UITabBarItem initWithTitle:image:tag:](v12, "initWithTitle:image:tag:", v13, 0LL, v14);
      break;
    default:
      id v9 = 0LL;
      id v11 = 0LL;
      id v15 = 0LL;
      break;
  }

  -[TVHNowPlayingTabBarItemViewController setTabBarItem:](v9, "setTabBarItem:", v15);
  -[TVHNowPlayingTabBarItemViewController setTitle:](v9, "setTitle:", v11);
  v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a3));
  -[TVHNowPlayingTabBarItemViewController tvh_setIdentifier:](v9, "tvh_setIdentifier:", v45);

  v46 = v9;
  return v46;
}

- (id)_existingTabBarItemViewControllerWithTabBarItemType:(unint64_t)a3
{
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  id v4 = (id)objc_claimAutoreleasedReturnValue( -[TVHMediaLibraryTabBarViewController _tabBarItemViewControllers]( self,  "_tabBarItemViewControllers"));
  id v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v13;
    while (2)
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v12 + 1) + 8LL * (void)i);
        if (objc_msgSend(v9, "type", (void)v12) == (id)a3)
        {
          id v10 = v9;
          goto LABEL_11;
        }
      }

      id v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }

  id v10 = 0LL;
LABEL_11:

  return v10;
}

- (id)_moreViewController
{
  return -[TVHMediaLibraryTabBarViewController _existingTabBarItemViewControllerWithTabBarItemType:]( self,  "_existingTabBarItemViewControllerWithTabBarItemType:",  4LL);
}

- (unint64_t)_indexOfTabBarItemViewControllerForMediaCategoryType:(unint64_t)a3
{
  uint64_t v8 = 0LL;
  id v9 = &v8;
  uint64_t v10 = 0x2020000000LL;
  uint64_t v11 = 0x7FFFFFFFFFFFFFFFLL;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaLibraryTabBarViewController viewControllers](self, "viewControllers"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10008C3A4;
  v7[3] = &unk_1000FEC48;
  v7[4] = &v8;
  v7[5] = a3;
  [v4 enumerateObjectsUsingBlock:v7];
  unint64_t v5 = v9[3];

  _Block_object_dispose(&v8, 8);
  return v5;
}

- (unint64_t)_indexOfTabBarItemViewControllerForTabBarItemType:(unint64_t)a3
{
  uint64_t v8 = 0LL;
  id v9 = &v8;
  uint64_t v10 = 0x2020000000LL;
  uint64_t v11 = 0x7FFFFFFFFFFFFFFFLL;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaLibraryTabBarViewController viewControllers](self, "viewControllers"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10008C518;
  v7[3] = &unk_1000FEC48;
  v7[4] = &v8;
  v7[5] = a3;
  [v4 enumerateObjectsUsingBlock:v7];
  unint64_t v5 = v9[3];

  _Block_object_dispose(&v8, 8);
  return v5;
}

- (void)_startObservingTabBarItemViewControllers:(id)a3
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
      uint64_t v8 = 0LL;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * (void)v8) addObserver:self forKeyPath:@"selectedMediaCategoryType" options:1 context:off_100157028];
        uint64_t v8 = (char *)v8 + 1;
      }

      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }

    while (v6);
  }
}

- (void)_stopObservingTabBarItemViewControllers:(id)a3
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
      uint64_t v8 = 0LL;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * (void)v8) removeObserver:self forKeyPath:@"selectedMediaCategoryType" context:off_100157028];
        uint64_t v8 = (char *)v8 + 1;
      }

      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }

    while (v6);
  }
}

- (unint64_t)_mediaCategoryTypeFromSettings
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( -[TVHMediaLibraryTabBarViewController tvh_mediaLibrariesEnviroment]( self,  "tvh_mediaLibrariesEnviroment"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 appSettings]);

  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaLibraryTabBarViewController mediaLibrary](self, "mediaLibrary"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 identifier]);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v4 mediaServerSettingsForIdentifier:v6]);

  id v8 = [v7 mediaCategoryType];
  return (unint64_t)v8;
}

- (void)_saveMediaCategoryTypeToSettings:(unint64_t)a3
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue( -[TVHMediaLibraryTabBarViewController tvh_mediaLibrariesEnviroment]( self,  "tvh_mediaLibrariesEnviroment"));
  id v9 = (id)objc_claimAutoreleasedReturnValue([v5 appSettings]);

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaLibraryTabBarViewController mediaLibrary](self, "mediaLibrary"));
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 identifier]);

  id v8 = (TVHMediaServerSettings *)objc_claimAutoreleasedReturnValue([v9 mediaServerSettingsForIdentifier:v7]);
  if (!v8) {
    id v8 = -[TVHMediaServerSettings initWithMediaServerIdentifier:]( objc_alloc(&OBJC_CLASS___TVHMediaServerSettings),  "initWithMediaServerIdentifier:",  v7);
  }
  -[TVHMediaServerSettings setMediaCategoryType:](v8, "setMediaCategoryType:", a3);
  [v9 saveMediaServerSettings:v8];
}

- (void)_saveMediaCategoryTypeToSettingsWithTabBarItemViewController:(id)a3
{
}

- (NSArray)mediaCategoryTypes
{
  return self->_mediaCategoryTypes;
}

- (void)setMediaCategoryTypes:(id)a3
{
}

- (TVHKMediaLibrary)mediaLibrary
{
  return self->_mediaLibrary;
}

- (TVHMediaLibraryTabBarItemViewController)selectedTabBarItemViewController
{
  return self->_selectedTabBarItemViewController;
}

- (BOOL)ignoreSelectionChanges
{
  return self->_ignoreSelectionChanges;
}

- (void)setIgnoreSelectionChanges:(BOOL)a3
{
  self->_ignoreSelectionChanges = a3;
}

- (void).cxx_destruct
{
}

@end
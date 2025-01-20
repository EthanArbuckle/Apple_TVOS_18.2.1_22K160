@interface ATAPPTUtilities
+ (BOOL)_selectButtonWithTitle:(id)a3 inView:(id)a4;
+ (BOOL)performScrollViewTest:(id)a3 testOptions:(id)a4 scrollAxis:(unint64_t)a5 tabBarController:(id)a6 scrollViewBlock:(id)a7;
+ (BOOL)selectButtonWithTitle:(id)a3 inShelf:(id)a4 inTabBarController:(id)a5;
+ (BOOL)selectButtonWithTitle:(id)a3 inTabBarController:(id)a4;
+ (BOOL)selectFirstShelfWithButtonTitle:(id)a3 inTabBarController:(id)a4;
+ (BOOL)selectTabWithTitle:(id)a3 inTabBarController:(id)a4;
+ (id)_cellWithTitle:(id)a3 inViewController:(id)a4 returningCollectionView:(id *)a5;
+ (id)_findCollectionViewInView:(id)a3;
+ (id)_findLabelInView:(id)a3;
+ (id)_findLabelWithTitle:(id)a3 inView:(id)a4;
+ (id)_findScrollViewInViewController:(id)a3;
+ (id)_findShelfViewControllerInViewController:(id)a3 withShelfRow:(unint64_t)a4;
+ (id)_findShelfViewControllerInViewController:(id)a3 withTitle:(id)a4;
+ (id)_findTVButtonWithTitle:(id)a3 inView:(id)a4;
+ (id)_findUIButtonWithTitle:(id)a3 inView:(id)a4;
+ (id)_findVUIRoundButtonWithTitle:(id)a3 inView:(id)a4;
+ (id)_findViewOfType:(Class)a3 inView:(id)a4 withFilter:(id)a5;
+ (id)_topViewControllerInTabBarController:(id)a3;
+ (id)findScrollViewByIndexInStackCollectionView:(id)a3 index:(unint64_t)a4;
+ (id)findScrollViewInView:(id)a3 desiredScrollViewClass:(Class)a4;
+ (id)findScrollViewInView:(id)a3 desiredScrollViewClass:(Class)a4 numScrollViewsToSkip:(int)a5;
+ (id)prepareForPPT;
+ (id)testLog;
+ (id)testOperationQueue;
+ (id)topMostController;
+ (void)resetNumScrollViewFound;
+ (void)waitForNotificiation:(id)a3;
+ (void)waitForTabWithTitleToLoad:(id)a3 inTabBarController:(id)a4 totalChildren:(unint64_t)a5;
- (ATAPPTUtilities)init;
@end

@implementation ATAPPTUtilities

- (ATAPPTUtilities)init
{
  return 0LL;
}

+ (id)testLog
{
  if (qword_10001A3D8 != -1) {
    dispatch_once(&qword_10001A3D8, &stru_100014C40);
  }
  return (id)qword_10001A3D0;
}

+ (id)testOperationQueue
{
  if (qword_10001A3E8 != -1) {
    dispatch_once(&qword_10001A3E8, &stru_100014C60);
  }
  return (id)qword_10001A3E0;
}

+ (BOOL)performScrollViewTest:(id)a3 testOptions:(id)a4 scrollAxis:(unint64_t)a5 tabBarController:(id)a6 scrollViewBlock:(id)a7
{
  id v11 = a3;
  id v33 = a4;
  id v12 = a6;
  id v13 = a7;
  v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[ATAPPTUtilities testLog](&OBJC_CLASS___ATAPPTUtilities, "testLog"));
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v11;
    _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Running scrollview test '%@'",  (uint8_t *)&buf,  0xCu);
  }

  *(void *)&__int128 buf = 0LL;
  *((void *)&buf + 1) = &buf;
  uint64_t v61 = 0x3032000000LL;
  v62 = sub_100005C80;
  v63 = sub_100005C90;
  id v64 = 0LL;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100005C98;
  block[3] = &unk_100014C88;
  p___int128 buf = &buf;
  id v59 = a1;
  id v15 = v12;
  id v57 = v15;
  dispatch_sync(&_dispatch_main_q, block);
  usleep(0xF4240u);
  uint64_t v50 = 0LL;
  v51 = &v50;
  uint64_t v52 = 0x3032000000LL;
  v53 = sub_100005C80;
  v54 = sub_100005C90;
  id v55 = 0LL;
  v45[0] = _NSConcreteStackBlock;
  v45[1] = 3221225472LL;
  v45[2] = sub_100005D14;
  v45[3] = &unk_100014CB0;
  id v16 = v13;
  id v46 = v16;
  v47 = &v50;
  v48 = &buf;
  id v49 = a1;
  dispatch_sync(&_dispatch_main_q, v45);

  if (v51[5])
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue([v11 lowercaseString]);
    unsigned int v18 = [v17 containsString:@"landscape"];

    if (v18)
    {
      dispatch_semaphore_t v19 = dispatch_semaphore_create(0LL);
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](&OBJC_CLASS___UIScreen, "mainScreen"));
      [v20 bounds];
      double Height = CGRectGetHeight(v65);

      v38[0] = _NSConcreteStackBlock;
      v38[1] = 3221225472LL;
      v38[2] = sub_100005D78;
      v38[3] = &unk_100014D40;
      v41 = &v50;
      int v43 = 30;
      int v44 = (int)(Height * 5.0);
      unint64_t v42 = a5;
      id v39 = v11;
      dispatch_semaphore_t v40 = v19;
      v22 = v19;
      dispatch_sync(&_dispatch_main_q, v38);

      dispatch_time_t v23 = dispatch_time(0LL, 300000000000LL);
      dispatch_semaphore_wait(v22, v23);

LABEL_8:
      BOOL v24 = 1;
      goto LABEL_12;
    }

    if ([sub_100005E38() isRecapAvailable])
    {
      v34[0] = _NSConcreteStackBlock;
      v34[1] = 3221225472LL;
      v34[2] = sub_100005EEC;
      v34[3] = &unk_100014C88;
      v36 = &v50;
      unint64_t v37 = a5;
      v35 = (dispatch_semaphore_s *)v11;
      dispatch_sync(&_dispatch_main_q, v34);

      v22 = v35;
      goto LABEL_8;
    }
  }

  v22 = (dispatch_semaphore_s *)objc_claimAutoreleasedReturnValue(+[ATAPPTUtilities testLog](&OBJC_CLASS___ATAPPTUtilities, "testLog"));
  if (os_log_type_enabled((os_log_t)v22, OS_LOG_TYPE_ERROR)) {
    sub_10000D7D4((uint64_t)v11, (os_log_s *)v22, v25, v26, v27, v28, v29, v30);
  }
  BOOL v24 = 0;
LABEL_12:

  _Block_object_dispose(&v50, 8);
  _Block_object_dispose(&buf, 8);

  return v24;
}

+ (id)prepareForPPT
{
  uint64_t v5 = 0LL;
  v6 = &v5;
  uint64_t v7 = 0x3032000000LL;
  v8 = sub_100005C80;
  v9 = sub_100005C90;
  id v10 = 0LL;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000060D8;
  block[3] = &unk_100014D68;
  void block[4] = &v5;
  dispatch_sync(&_dispatch_main_q, block);
  usleep(0xC350u);
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

+ (BOOL)selectButtonWithTitle:(id)a3 inTabBarController:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _topViewControllerInTabBarController:a4]);
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 view]);
  if ([a1 _selectButtonWithTitle:v6 inView:v8])
  {
    unsigned __int8 v9 = 1;
  }

  else
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v7 navigationController]);
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 navigationBar]);

    if (v11)
    {
      id v12 = (void *)objc_claimAutoreleasedReturnValue([v7 navigationController]);
      id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 navigationBar]);
      unsigned __int8 v9 = [a1 _selectButtonWithTitle:v6 inView:v13];
    }

    else
    {
      unsigned __int8 v9 = 0;
    }
  }

  return v9;
}

+ (BOOL)selectButtonWithTitle:(id)a3 inShelf:(id)a4 inTabBarController:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void *)objc_claimAutoreleasedReturnValue([a1 _topViewControllerInTabBarController:a5]);
  id v11 = (void *)objc_claimAutoreleasedReturnValue([a1 _findShelfViewControllerInViewController:v10 withTitle:v9]);

  if (v11)
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 view]);
    unsigned __int8 v13 = [a1 _selectButtonWithTitle:v8 inView:v12];
  }

  else
  {
    unsigned __int8 v13 = 0;
  }

  return v13;
}

+ (BOOL)selectFirstShelfWithButtonTitle:(id)a3 inTabBarController:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _topViewControllerInTabBarController:a4]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 childViewControllers]);
  id v9 = [v8 count];

  id v10 = 0LL;
  if (v9)
  {
    unint64_t v11 = 0LL;
    while (1)
    {
      id v12 = v10;
      id v10 = (void *)objc_claimAutoreleasedReturnValue([a1 _findShelfViewControllerInViewController:v7 withShelfRow:v11]);

      if (v10)
      {
        unsigned __int8 v13 = (void *)objc_claimAutoreleasedReturnValue([v10 view]);
        unsigned __int8 v14 = [a1 _selectButtonWithTitle:v6 inView:v13];

        if ((v14 & 1) != 0) {
          break;
        }
      }

      ++v11;
      id v15 = (void *)objc_claimAutoreleasedReturnValue([v7 childViewControllers]);
      id v16 = [v15 count];
    }

    uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue([v10 view]);
    unsigned __int8 v24 = [a1 _selectButtonWithTitle:v6 inView:v25];
  }

  else
  {
LABEL_6:
    v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[ATAPPTUtilities testLog](&OBJC_CLASS___ATAPPTUtilities, "testLog"));
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      sub_10000D838((uint64_t)v6, v17, v18, v19, v20, v21, v22, v23);
    }

    unsigned __int8 v24 = 0;
  }

  return v24;
}

+ (BOOL)selectTabWithTitle:(id)a3 inTabBarController:(id)a4
{
  id v6 = a3;
  v20[0] = 0LL;
  v20[1] = v20;
  v20[2] = 0x2020000000LL;
  v20[3] = 0LL;
  v18[0] = 0LL;
  v18[1] = v18;
  v18[2] = 0x2020000000LL;
  char v19 = 0;
  id v10 = _NSConcreteStackBlock;
  uint64_t v11 = 3221225472LL;
  id v12 = sub_100006598;
  unsigned __int8 v13 = &unk_100014D90;
  id v7 = a4;
  id v14 = v7;
  id v8 = v6;
  id v15 = v8;
  id v16 = v18;
  v17 = v20;
  dispatch_sync(&_dispatch_main_q, &v10);
  LOBYTE(a1) = objc_msgSend( a1,  "_blockExecutionInTabBarController:documentRef:totalChildren:",  v7,  v8,  1,  v10,  v11,  v12,  v13);

  _Block_object_dispose(v18, 8);
  _Block_object_dispose(v20, 8);

  return (char)a1;
}

+ (void)waitForNotificiation:(id)a3
{
  id v4 = a3;
  dispatch_semaphore_t v5 = dispatch_semaphore_create(0LL);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 testOperationQueue]);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_1000068E8;
  v11[3] = &unk_100014DB8;
  dispatch_semaphore_t v12 = v5;
  id v8 = v5;
  id v9 = [v6 addObserverForName:v4 object:0 queue:v7 usingBlock:v11];

  dispatch_time_t v10 = dispatch_time(0LL, 180000000000LL);
  dispatch_semaphore_wait(v8, v10);
}

+ (void)waitForTabWithTitleToLoad:(id)a3 inTabBarController:(id)a4 totalChildren:(unint64_t)a5
{
}

+ (void)resetNumScrollViewFound
{
  dword_10001A3F0 = 0;
}

+ (id)findScrollViewInView:(id)a3 desiredScrollViewClass:(Class)a4
{
  id v6 = a3;
  id v7 = [(id)objc_opt_class(a1) findScrollViewInView:v6 desiredScrollViewClass:a4 numScrollViewsToSkip:0];
  id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

  return v8;
}

+ (id)findScrollViewInView:(id)a3 desiredScrollViewClass:(Class)a4 numScrollViewsToSkip:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  id v8 = a3;
  id v9 = v8;
  if (!v8) {
    goto LABEL_19;
  }
  if (a4)
  {
    Class v10 = a4;
LABEL_6:
    if ((objc_opt_isKindOfClass(v8, v10) & 1) != 0) {
      goto LABEL_7;
    }
    __int128 v23 = 0u;
    __int128 v24 = 0u;
    __int128 v21 = 0u;
    __int128 v22 = 0u;
    unsigned __int8 v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "subviews", 0));
    id v14 = [v13 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v14)
    {
      id v15 = v14;
      uint64_t v16 = *(void *)v22;
      while (2)
      {
        for (i = 0LL; i != v15; i = (char *)i + 1)
        {
          if (*(void *)v22 != v16) {
            objc_enumerationMutation(v13);
          }
          uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue( [a1 findScrollViewInView:*(void *)(*((void *)&v21 + 1) + 8 * (void)i) desiredScrollViewClass:a4 numScrollViewsToSkip:v5]);
          id v12 = v18;
          int v19 = dword_10001A3F0;
          if (v18) {
            int v19 = ++dword_10001A3F0;
          }
          if (v19 > (int)v5)
          {

            goto LABEL_21;
          }
        }

        id v15 = [v13 countByEnumeratingWithState:&v21 objects:v25 count:16];
        if (v15) {
          continue;
        }
        break;
      }
    }

LABEL_19:
    id v12 = 0LL;
    goto LABEL_21;
  }

  uint64_t v11 = objc_opt_class(&OBJC_CLASS___UICollectionView);
  if ((objc_opt_isKindOfClass(v9, v11) & 1) == 0)
  {
    Class v10 = (Class)objc_opt_class(&OBJC_CLASS___UITableView);
    id v8 = v9;
    goto LABEL_6;
  }

+ (id)findScrollViewByIndexInStackCollectionView:(id)a3 index:(unint64_t)a4
{
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([a3 view]);
  id v6 = +[ATAPPTUtilities findScrollViewInView:desiredScrollViewClass:]( &OBJC_CLASS___ATAPPTUtilities,  "findScrollViewInView:desiredScrollViewClass:",  v5,  NSClassFromString(@"VideosUI.StackCollectionView"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  id v8 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "subviews", 0));
  id v10 = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v21;
    do
    {
      unsigned __int8 v13 = 0LL;
      do
      {
        if (*(void *)v21 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v20 + 1) + 8LL * (void)v13);
        uint64_t v15 = objc_opt_class(&OBJC_CLASS___UIScrollView);
        if ((objc_opt_isKindOfClass(v14, v15) & 1) != 0) {
          -[NSMutableArray addObject:](v8, "addObject:", v14);
        }
        unsigned __int8 v13 = (char *)v13 + 1;
      }

      while (v11 != v13);
      id v11 = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }

    while (v11);
  }

  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray sortedArrayUsingComparator:](v8, "sortedArrayUsingComparator:", &stru_100014DF8));
  v17 = v16;
  else {
    uint64_t v18 = 0LL;
  }

  return v18;
}

+ (id)_cellWithTitle:(id)a3 inViewController:(id)a4 returningCollectionView:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 collectionView]);
    if (!v10) {
      goto LABEL_16;
    }
  }

  else
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v9 view]);
    id v10 = (void *)objc_claimAutoreleasedReturnValue([a1 _findCollectionViewInView:v11]);

    if (!v10)
    {
LABEL_16:
      uint64_t v18 = 0LL;
      goto LABEL_21;
    }
  }

  id v12 = [v10 visibleCells];
  id v26 = [v10 numberOfSections];
  if (!v26) {
    goto LABEL_16;
  }
  __int128 v24 = a5;
  id v25 = v9;
  uint64_t v13 = 0LL;
  while (1)
  {
    id v14 = [v10 numberOfItemsInSection:v13];
    if (v14) {
      break;
    }
LABEL_14:
    if ((id)++v13 == v26)
    {
      uint64_t v18 = 0LL;
      goto LABEL_20;
    }
  }

  id v15 = v14;
  uint64_t v16 = 0LL;
  while (1)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSIndexPath indexPathForItem:inSection:]( &OBJC_CLASS___NSIndexPath,  "indexPathForItem:inSection:",  v16,  v13));
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v10 cellForItemAtIndexPath:v17]);

    if (v18) {
      break;
    }
LABEL_13:

    if (v15 == (id)++v16) {
      goto LABEL_14;
    }
  }

  int v19 = (void *)objc_claimAutoreleasedReturnValue([a1 _findLabelInView:v18]);
  if ([v8 length])
  {
    id v20 = a1;
    __int128 v21 = (void *)objc_claimAutoreleasedReturnValue([v19 text]);
    unsigned int v22 = [v21 isEqualToString:v8];

    if (!v22)
    {
      a1 = v20;

      goto LABEL_13;
    }
  }

  if (v24) {
    *__int128 v24 = v10;
  }

LABEL_20:
  id v9 = v25;
LABEL_21:

  return v18;
}

+ (id)_findCollectionViewInView:(id)a3
{
  id v4 = a3;
  id v5 = [a1 _findViewOfType:objc_opt_class(UICollectionView) inView:v4 withFilter:0];
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  uint64_t v7 = objc_opt_class(&OBJC_CLASS___UICollectionView);
  id v8 = 0LL;
  if ((objc_opt_isKindOfClass(v6, v7) & 1) != 0) {
    id v8 = v6;
  }

  return v8;
}

+ (id)_findLabelInView:(id)a3
{
  id v4 = a3;
  id v5 = [a1 _findViewOfType:objc_opt_class(UILabel) inView:v4 withFilter:0];
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  uint64_t v7 = objc_opt_class(&OBJC_CLASS___UILabel);
  id v8 = 0LL;
  if ((objc_opt_isKindOfClass(v6, v7) & 1) != 0) {
    id v8 = v6;
  }

  return v8;
}

+ (id)_findLabelWithTitle:(id)a3 inView:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = objc_opt_class(&OBJC_CLASS___UILabel);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_10000752C;
  v14[3] = &unk_100014E48;
  id v9 = v6;
  id v15 = v9;
  id v10 = (void *)objc_claimAutoreleasedReturnValue([a1 _findViewOfType:v8 inView:v7 withFilter:v14]);

  uint64_t v11 = objc_opt_class(&OBJC_CLASS___UILabel);
  if ((objc_opt_isKindOfClass(v10, v11) & 1) != 0) {
    id v12 = v10;
  }
  else {
    id v12 = 0LL;
  }

  return v12;
}

+ (id)_findViewOfType:(Class)a3 inView:(id)a4 withFilter:(id)a5
{
  id v8 = a4;
  id v9 = (uint64_t (**)(id, id))a5;
  if (!v8)
  {
LABEL_17:
    id v10 = 0LL;
    goto LABEL_19;
  }

  if ((objc_opt_isKindOfClass(v8, a3) & 1) == 0)
  {
    __int128 v20 = 0u;
    __int128 v21 = 0u;
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "subviews", 0));
    id v12 = [v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void *)v19;
      while (2)
      {
        id v15 = 0LL;
        do
        {
          if (*(void *)v19 != v14) {
            objc_enumerationMutation(v11);
          }
          id v10 = (id)objc_claimAutoreleasedReturnValue( [a1 _findViewOfType:a3 inView:*(void *)(*((void *)&v18 + 1) + 8 * (void)v15) withFilter:v9]);
          char v16 = 1;
          if (v9 && v10) {
            char v16 = v9[2](v9, v10);
          }
          if (v10 && (v16 & 1) != 0)
          {

            goto LABEL_19;
          }

          id v15 = (char *)v15 + 1;
        }

        while (v13 != v15);
        id v13 = [v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
        if (v13) {
          continue;
        }
        break;
      }
    }

    goto LABEL_17;
  }

  id v10 = v8;
LABEL_19:

  return v10;
}

+ (id)_findScrollViewInViewController:(id)a3
{
  id v4 = a3;
  if (((((uint64_t (*)(void))objc_opt_respondsToSelector)() & 1) == 0
     || (id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 performSelector:"collectionView" withObject:0])) == 0)
    && ((objc_opt_respondsToSelector(v4, "tableView") & 1) == 0
     || (id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 performSelector:"tableView" withObject:0])) == 0))
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 view]);
    id v5 = (void *)objc_claimAutoreleasedReturnValue([a1 findScrollViewInView:v6 desiredScrollViewClass:0]);
  }

  return v5;
}

+ (id)_findShelfViewControllerInViewController:(id)a3 withTitle:(id)a4
{
  id v6 = a4;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "childViewControllers", 0));
  id v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v18;
    while (2)
    {
      for (i = 0LL; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = *(void **)(*((void *)&v17 + 1) + 8LL * (void)i);
        id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 view]);
        uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([a1 _findLabelWithTitle:v6 inView:v13]);

        if (v14)
        {
          id v15 = v12;

          goto LABEL_11;
        }
      }

      id v9 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }

  id v15 = 0LL;
LABEL_11:

  return v15;
}

+ (id)_findShelfViewControllerInViewController:(id)a3 withShelfRow:(unint64_t)a4
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue([a3 childViewControllers]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectAtIndexedSubscript:a4]);

  return v6;
}

+ (BOOL)_selectButtonWithTitle:(id)a3 inView:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 _findTVButtonWithTitle:v6 inView:v7]);
  if (v8
    || (id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 _findUIButtonWithTitle:v6 inView:v7])) != 0
    || (id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 _findVUIRoundButtonWithTitle:v6 inView:v7])) != 0)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100007A94;
    block[3] = &unk_100014C20;
    id v13 = v8;
    id v9 = v8;
    dispatch_sync(&_dispatch_main_q, block);

    BOOL v10 = 1;
  }

  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

+ (id)_findVUIRoundButtonWithTitle:(id)a3 inView:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472LL;
  v21[2] = sub_100007C54;
  v21[3] = &unk_100014E70;
  Class v23 = NSClassFromString(@"VUIRoundButton");
  id v8 = v6;
  id v22 = v8;
  id v9 = (void *)objc_claimAutoreleasedReturnValue([a1 _findViewOfType:v23 inView:v7 withFilter:v21]);
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  BOOL v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "subviews", 0));
  id v11 = [v10 countByEnumeratingWithState:&v17 objects:v24 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v18;
    while (2)
    {
      for (i = 0LL; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v18 != v12) {
          objc_enumerationMutation(v10);
        }
        uint64_t v14 = *(void **)(*((void *)&v17 + 1) + 8LL * (void)i);
        uint64_t v15 = objc_opt_class(&OBJC_CLASS___UIButton);
        if ((objc_opt_isKindOfClass(v14, v15) & 1) != 0)
        {
          id v11 = v14;
          goto LABEL_11;
        }
      }

      id v11 = [v10 countByEnumeratingWithState:&v17 objects:v24 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }

+ (id)_findTVButtonWithTitle:(id)a3 inView:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  Class v8 = NSClassFromString(@"TVButton");
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_100007E58;
  v12[3] = &unk_100014E48;
  id v13 = v6;
  id v9 = v6;
  BOOL v10 = (void *)objc_claimAutoreleasedReturnValue([a1 _findViewOfType:v8 inView:v7 withFilter:v12]);

  return v10;
}

+ (id)_findUIButtonWithTitle:(id)a3 inView:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = objc_opt_class(&OBJC_CLASS___UIButton);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_100007FE8;
  v12[3] = &unk_100014E48;
  id v13 = v6;
  id v9 = v6;
  BOOL v10 = (void *)objc_claimAutoreleasedReturnValue([a1 _findViewOfType:v8 inView:v7 withFilter:v12]);

  return v10;
}

+ (id)_topViewControllerInTabBarController:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue([a3 selectedViewController]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 topViewController]);
  uint64_t v5 = objc_opt_class(&OBJC_CLASS____TVAppDocumentController);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
  {
    uint64_t v6 = objc_claimAutoreleasedReturnValue([v4 templateViewController]);

    id v4 = (void *)v6;
  }

  return v4;
}

+ (id)topMostController
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIWindow keyWindow](&OBJC_CLASS___UIWindow, "keyWindow"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 rootViewController]);

  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 presentedViewController]);
  if (v4)
  {
    do
    {
      uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v3 presentedViewController]);

      uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 presentedViewController]);
      v3 = v5;
    }

    while (v6);
  }

  else
  {
    uint64_t v5 = v3;
  }

  return v5;
}

@end
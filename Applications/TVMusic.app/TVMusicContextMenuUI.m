@interface TVMusicContextMenuUI
+ (id)viewControllerForContextMenuData:(id)a3;
+ (void)showContextMenu:(id)a3;
@end

@implementation TVMusicContextMenuUI

+ (void)showContextMenu:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v8 = sub_10000BD94;
    v9 = &unk_100268E30;
    id v11 = a1;
    id v10 = v4;
    v6 = v7;
    if (+[NSThread isMainThread](&OBJC_CLASS___NSThread, "isMainThread"))
    {
      v8((uint64_t)v6);
    }

    else
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_10000C110;
      block[3] = &unk_100268D60;
      v13 = v6;
      dispatch_async(&_dispatch_main_q, block);
    }
  }
}

+ (id)viewControllerForContextMenuData:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 menuItems]);
  id v6 = [v5 count];

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertController alertControllerWithTitle:message:preferredStyle:]( &OBJC_CLASS___UIAlertController,  "alertControllerWithTitle:message:preferredStyle:",  0LL,  0LL,  1LL));
    v8 = (void *)objc_claimAutoreleasedReturnValue([v4 heading]);
    [v7 setTitle:v8];

    __int128 v28 = 0u;
    __int128 v29 = 0u;
    __int128 v26 = 0u;
    __int128 v27 = 0u;
    id v24 = v4;
    v9 = (void *)objc_claimAutoreleasedReturnValue([v4 menuItems]);
    id v10 = [v9 countByEnumeratingWithState:&v26 objects:v30 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v27;
      do
      {
        for (i = 0LL; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v27 != v12) {
            objc_enumerationMutation(v9);
          }
          v14 = *(void **)(*((void *)&v26 + 1) + 8LL * (void)i);
          v15 = (void *)objc_claimAutoreleasedReturnValue([v14 actionBlock]);

          if (v15)
          {
            uint64_t v16 = objc_claimAutoreleasedReturnValue([v14 title]);
            v17 = (void *)v16;
            v18 = &stru_100279068;
            if (v16) {
              v18 = (__CFString *)v16;
            }
            v19 = v18;

            v25[0] = _NSConcreteStackBlock;
            v25[1] = 3221225472LL;
            v25[2] = sub_10000C0DC;
            v25[3] = &unk_100268EE0;
            v25[4] = v14;
            v20 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v19,  0LL,  v25));

            objc_msgSend(v20, "_setChecked:", objc_msgSend(v14, "hasCheckmark"));
            [v7 addAction:v20];
          }
        }

        id v11 = [v9 countByEnumeratingWithState:&v26 objects:v30 count:16];
      }

      while (v11);
    }

    v21 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  0LL,  1LL,  0LL));
    [v7 addAction:v21];

    id v4 = v24;
  }

  else
  {
    if (_TVSLogInternalLogLevel >= 4)
    {
      pthread_main_np();
      pthread_self();
      v23 = (void *)objc_claimAutoreleasedReturnValue([v4 heading]);
      _TVSLogBase(v3, &_os_log_default, 1LL, 0LL, 4LL);
    }

    v7 = 0LL;
  }

  return v7;
}

@end
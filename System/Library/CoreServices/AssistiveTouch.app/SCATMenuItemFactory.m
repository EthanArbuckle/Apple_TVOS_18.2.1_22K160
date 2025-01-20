@interface SCATMenuItemFactory
+ (id)menuItemsForItem:(id)a3 menu:(id)a4 delegate:(id)a5;
@end

@implementation SCATMenuItemFactory

+ (id)menuItemsForItem:(id)a3 menu:(id)a4 delegate:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  v11 = (void *)objc_claimAutoreleasedReturnValue([v10 gestureKeys]);
  unsigned __int8 v12 = [v11 containsObject:v7];

  if ((v12 & 1) != 0)
  {
    v13 = off_100121308;
  }

  else
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue([v10 settingsKeys]);
    unsigned __int8 v15 = [v14 containsObject:v7];

    if ((v15 & 1) != 0)
    {
      v13 = &off_100121318;
    }

    else
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue([v10 deviceKeys]);
      unsigned __int8 v17 = [v16 containsObject:v7];

      if ((v17 & 1) != 0)
      {
        v13 = off_100121300;
      }

      else
      {
        v18 = (void *)objc_claimAutoreleasedReturnValue([v10 mediaControlsKeys]);
        unsigned int v19 = [v18 containsObject:v7];

        v13 = off_1001212F8;
        if (v19) {
          v13 = off_100121310;
        }
      }
    }
  }

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[__objc2_class menuItemsForItem:menu:delegate:](*v13, "menuItemsForItem:menu:delegate:", v7, v8, v9));

  return v20;
}

@end
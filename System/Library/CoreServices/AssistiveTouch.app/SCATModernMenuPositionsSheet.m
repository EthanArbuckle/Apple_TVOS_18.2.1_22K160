@interface SCATModernMenuPositionsSheet
+ (id)menuItemDictionary;
+ (id)menuItemWithIdentifier:(id)a3 menu:(id)a4 delegate:(id)a5;
- (id)makeMenuItemsIfNeeded;
@end

@implementation SCATModernMenuPositionsSheet

+ (id)menuItemDictionary
{
  if (AXDeviceIsPad(a1, a2))
  {
    v27[0] = @"settings_moveOriginal";
    id v2 = sub_10002B014(@"Position-Orig");
    v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
    v28[0] = v3;
    v27[1] = @"settings_moveTopLeft";
    id v4 = sub_10002B014(@"Position-Top-Left");
    v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
    v28[1] = v5;
    v27[2] = @"settings_moveTop";
    id v6 = sub_10002B014(@"Position-Top");
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    v28[2] = v7;
    v27[3] = @"settings_moveTopRight";
    id v8 = sub_10002B014(@"Position-Top-Right");
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    v28[3] = v9;
    v27[4] = @"settings_moveRight";
    id v10 = sub_10002B014(@"Position-Right");
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    v28[4] = v11;
    v27[5] = @"settings_moveBottomRight";
    id v12 = sub_10002B014(@"Position-Bottom-Right");
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    v28[5] = v13;
    v27[6] = @"settings_moveBottom";
    id v14 = sub_10002B014(@"Position-Bottom");
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    v28[6] = v15;
    v27[7] = @"settings_moveBottomLeft";
    id v16 = sub_10002B014(@"Position-Bottom-Left");
    v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    v28[7] = v17;
    v27[8] = @"settings_moveLeft";
    id v18 = sub_10002B014(@"Position-Left");
    v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
    v28[8] = v19;
    v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v28,  v27,  9LL));
  }

  else
  {
    v25[0] = @"settings_moveOriginal";
    id v21 = sub_10002B014(@"Position-Orig");
    v3 = (void *)objc_claimAutoreleasedReturnValue(v21);
    v26[0] = v3;
    v25[1] = @"settings_moveTop";
    id v22 = sub_10002B014(@"Position-Top");
    v5 = (void *)objc_claimAutoreleasedReturnValue(v22);
    v26[1] = v5;
    v25[2] = @"settings_moveBottom";
    id v23 = sub_10002B014(@"Position-Bottom");
    v7 = (void *)objc_claimAutoreleasedReturnValue(v23);
    v26[2] = v7;
    v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v26,  v25,  3LL));
  }

  return v20;
}

+ (id)menuItemWithIdentifier:(id)a3 menu:(id)a4 delegate:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  v9 = (void *)objc_claimAutoreleasedReturnValue([a1 menuItemDictionary]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKey:v7]);

  if (v10)
  {
    if ([v7 isEqualToString:@"settings_moveOriginal"])
    {
      v11 = &stru_1001243E8;
    }

    else if ([v7 isEqualToString:@"settings_moveTopLeft"])
    {
      v11 = &stru_100124408;
    }

    else if ([v7 isEqualToString:@"settings_moveTop"])
    {
      v11 = &stru_100124428;
    }

    else if ([v7 isEqualToString:@"settings_moveTopRight"])
    {
      v11 = &stru_100124448;
    }

    else if ([v7 isEqualToString:@"settings_moveRight"])
    {
      v11 = &stru_100124468;
    }

    else if ([v7 isEqualToString:@"settings_moveBottomRight"])
    {
      v11 = &stru_100124488;
    }

    else if ([v7 isEqualToString:@"settings_moveBottom"])
    {
      v11 = &stru_1001244A8;
    }

    else if ([v7 isEqualToString:@"settings_moveBottomLeft"])
    {
      v11 = &stru_1001244C8;
    }

    else if ([v7 isEqualToString:@"settings_moveLeft"])
    {
      v11 = &stru_1001244E8;
    }

    else
    {
      v11 = 0LL;
    }

    id v12 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:v7]);
    id v10 = (void *)objc_claimAutoreleasedReturnValue( +[SCATModernMenuItem itemWithIdentifier:delegate:title:imageName:activateBehavior:activateHandler:updateHandler:]( &OBJC_CLASS___SCATModernMenuItem,  "itemWithIdentifier:delegate:title:imageName:activateBehavior:activateHandler:updateHandler:",  v7,  v8,  v12,  0LL,  3LL,  v11,  0LL));
  }

  return v10;
}

- (id)makeMenuItemsIfNeeded
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  *(void *)&double v5 = objc_opt_class(self, v4).n128_u64[0];
  id v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "menuItemDictionary", v5, 0));
  id v8 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v8)
  {
    id v10 = v8;
    uint64_t v11 = *(void *)v21;
    do
    {
      id v12 = 0LL;
      do
      {
        if (*(void *)v21 != v11) {
          objc_enumerationMutation(v7);
        }
        uint64_t v13 = *(void *)(*((void *)&v20 + 1) + 8LL * (void)v12);
        *(void *)&double v14 = objc_opt_class(self, v9).n128_u64[0];
        id v16 = v15;
        v17 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuSheet menu](self, "menu", v14));
        id v18 = (void *)objc_claimAutoreleasedReturnValue([v16 menuItemWithIdentifier:v13 menu:v17 delegate:self]);
        [v3 addObject:v18];

        id v12 = (char *)v12 + 1;
      }

      while (v10 != v12);
      id v10 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }

    while (v10);
  }

  return v3;
}

@end
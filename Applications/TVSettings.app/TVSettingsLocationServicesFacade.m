@interface TVSettingsLocationServicesFacade
+ (id)sharedInstance;
- (BOOL)locationServicesEnabled;
- (NSArray)applicationItems;
- (NSArray)systemServiceItems;
- (NSFormatter)accessTypeFormatter;
- (NSMutableDictionary)items;
- (TVSettingsLocationItem)pineBoardItem;
- (TVSettingsLocationItem)timeZoneItem;
- (TVSettingsLocationServicesFacade)init;
- (id)_hiddenSystemServices;
- (id)itemForBundleID:(id)a3;
- (void)_updateItems:(BOOL)a3;
- (void)appInfoController:(id)a3 didUpdate:(id)a4;
- (void)setApplicationItems:(id)a3;
- (void)setItems:(id)a3;
- (void)setLocationServicesEnabled:(BOOL)a3;
- (void)setSystemServiceItems:(id)a3;
@end

@implementation TVSettingsLocationServicesFacade

+ (id)sharedInstance
{
  if (qword_1001E1A98 != -1) {
    dispatch_once(&qword_1001E1A98, &stru_100193378);
  }
  return (id)qword_1001E1A90;
}

- (TVSettingsLocationServicesFacade)init
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___TVSettingsLocationServicesFacade;
  v2 = -[TVSettingsLocationServicesFacade init](&v7, "init");
  v3 = v2;
  if (v2)
  {
    -[TVSettingsLocationServicesFacade _updateItems:](v2, "_updateItems:", 0LL);
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[PBSAppInfoController sharedInstance](&OBJC_CLASS___PBSAppInfoController, "sharedInstance"));
    [v4 addObserver:v3];

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver( DarwinNotifyCenter,  0LL,  (CFNotificationCallback)sub_1000ABAA0,  CLAppStatusChangedNotification,  0LL,  (CFNotificationSuspensionBehavior)0LL);
  }

  return v3;
}

- (BOOL)locationServicesEnabled
{
  return +[CLLocationManager locationServicesEnabled](&OBJC_CLASS___CLLocationManager, "locationServicesEnabled");
}

- (void)setLocationServicesEnabled:(BOOL)a3
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(+[TVSettingsAppearanceFacade sharedInstance](&OBJC_CLASS___TVSettingsAppearanceFacade, "sharedInstance"));
  [v3 invalidateSystemAppearance];
}

- (id)itemForBundleID:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsLocationServicesFacade applicationItems](self, "applicationItems"));
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_1000ABC88;
  v19[3] = &unk_1001933A0;
  id v6 = v4;
  id v20 = v6;
  id v7 = [v5 indexOfObjectPassingTest:v19];

  if (v7 == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsLocationServicesFacade systemServiceItems](self, "systemServiceItems"));
    v14 = _NSConcreteStackBlock;
    uint64_t v15 = 3221225472LL;
    v16 = sub_1000ABCC8;
    v17 = &unk_1001933A0;
    id v18 = v6;
    id v9 = [v8 indexOfObjectPassingTest:&v14];

    if (v9 == (id)0x7FFFFFFFFFFFFFFFLL)
    {
      v10 = 0LL;
    }

    else
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue( -[TVSettingsLocationServicesFacade systemServiceItems]( self,  "systemServiceItems",  v14,  v15,  v16,  v17));
      v10 = (void *)objc_claimAutoreleasedReturnValue([v12 objectAtIndex:v9]);
    }

    v11 = v18;
  }

  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsLocationServicesFacade applicationItems](self, "applicationItems"));
    v10 = (void *)objc_claimAutoreleasedReturnValue([v11 objectAtIndex:v7]);
  }

  return v10;
}

- (NSFormatter)accessTypeFormatter
{
  return (NSFormatter *) [[TVSBlockFormatter alloc] initWithFormattingBlock:&stru_1001933C0];
}

- (void)appInfoController:(id)a3 didUpdate:(id)a4
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000ABE1C;
  block[3] = &unk_10018E440;
  block[4] = self;
  dispatch_async(&_dispatch_main_q, block);
}

- (id)_hiddenSystemServices
{
  if (qword_1001E1AA8 != -1) {
    dispatch_once(&qword_1001E1AA8, &stru_1001933E0);
  }
  return (id)qword_1001E1AA0;
}

- (void)_updateItems:(BOOL)a3
{
  BOOL v28 = a3;
  if (!self->_items)
  {
    id v4 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
    items = self->_items;
    self->_items = v4;
  }

  id v6 = (void *)CLCopyAppsUsingLocation();
  id v7 = objc_alloc(&OBJC_CLASS___NSSet);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](self->_items, "allKeys"));
  id v9 = -[NSSet initWithArray:](v7, "initWithArray:", v8);

  v10 = objc_alloc(&OBJC_CLASS___NSSet);
  v11 = (void *)objc_claimAutoreleasedReturnValue([v6 allKeys]);
  v12 = -[NSSet initWithArray:](v10, "initWithArray:", v11);

  id v13 = -[NSSet mutableCopy](v9, "mutableCopy");
  [v13 minusSet:v12];
  if ([v13 count])
  {
    v14 = self->_items;
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v13 allObjects]);
    -[NSMutableDictionary removeObjectsForKeys:](v14, "removeObjectsForKeys:", v15);
  }

  v16 = self->_items;
  v37[0] = _NSConcreteStackBlock;
  v37[1] = 3221225472LL;
  v37[2] = sub_1000AC23C;
  v37[3] = &unk_100193408;
  id v29 = v6;
  id v38 = v29;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](v16, "enumerateKeysAndObjectsUsingBlock:", v37);
  id v17 = -[NSSet mutableCopy](v12, "mutableCopy");
  [v17 minusSet:v9];
  if ([v17 count])
  {
    v34[0] = _NSConcreteStackBlock;
    v34[1] = 3221225472LL;
    v34[2] = sub_1000AC29C;
    v34[3] = &unk_100193430;
    id v35 = v29;
    v36 = self;
    [v17 enumerateObjectsUsingBlock:v34];
  }

  timeZoneItem = self->_timeZoneItem;
  self->_timeZoneItem = 0LL;

  v19 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  id v20 = (void *)objc_claimAutoreleasedReturnValue( +[TVSettingsLocationItem allowedSystemServices]( &OBJC_CLASS___TVSettingsLocationItem,  "allowedSystemServices"));
  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472LL;
  v32[2] = sub_1000AC324;
  v32[3] = &unk_100193458;
  v32[4] = self;
  v21 = v19;
  v33 = v21;
  [v20 enumerateObjectsUsingBlock:v32];

  v22 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray sortedArrayUsingComparator:](v21, "sortedArrayUsingComparator:", &stru_100193498));
  unsigned int v23 = [v22 isEqual:self->_systemServiceItems];
  if ((v23 & 1) == 0) {
    -[TVSettingsLocationServicesFacade setSystemServiceItems:](self, "setSystemServiceItems:", v22);
  }
  v24 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  v25 = self->_items;
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472LL;
  v30[2] = sub_1000AC490;
  v30[3] = &unk_1001934C0;
  v30[4] = self;
  v26 = v24;
  v31 = v26;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](v25, "enumerateKeysAndObjectsUsingBlock:", v30);
  -[NSMutableArray sortUsingComparator:](v26, "sortUsingComparator:", &stru_1001934E0);
  if ((-[NSMutableArray isEqual:](v26, "isEqual:", self->_applicationItems) & 1) != 0)
  {
    if (((v23 | !v28) & 1) != 0) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }

  -[TVSettingsLocationServicesFacade setApplicationItems:](self, "setApplicationItems:", v26);
  if (v28)
  {
LABEL_13:
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v27 postNotificationName:@"TVSettingsLocationItemsChangedNotification" object:self];
  }

- (NSArray)applicationItems
{
  return self->_applicationItems;
}

- (void)setApplicationItems:(id)a3
{
}

- (NSArray)systemServiceItems
{
  return self->_systemServiceItems;
}

- (void)setSystemServiceItems:(id)a3
{
}

- (TVSettingsLocationItem)timeZoneItem
{
  return self->_timeZoneItem;
}

- (TVSettingsLocationItem)pineBoardItem
{
  return self->_pineBoardItem;
}

- (NSMutableDictionary)items
{
  return self->_items;
}

- (void)setItems:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
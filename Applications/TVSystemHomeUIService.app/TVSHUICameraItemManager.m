@interface TVSHUICameraItemManager
+ (BOOL)_isFilteringToFavoriteCameras;
+ (id)_disabledCameraIdentifiers;
- (id)_buildItemProvidersForHome:(id)a3;
- (id)_buildSectionsWithDisplayedItems:(id)a3;
@end

@implementation TVSHUICameraItemManager

+ (BOOL)_isFilteringToFavoriteCameras
{
  id v3 =  +[TVSPreferences sharedPineBoardServicesPreferences]( &OBJC_CLASS___TVSPreferences,  "sharedPineBoardServicesPreferences");
  BOOL v4 = objc_msgSend(v3, "pbs_homeKitCamerasFilter") == 0;

  return v4;
}

+ (id)_disabledCameraIdentifiers
{
  v5[2] = a1;
  v5[1] = (id)a2;
  id v3 =  +[TVSPreferences sharedPineBoardServicesPreferences]( &OBJC_CLASS___TVSPreferences,  "sharedPineBoardServicesPreferences");
  v5[0] = objc_msgSend(v3, "pbs_homeKitDisabledCameras");

  BOOL v4 = +[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v5[0]);
  objc_storeStrong(v5, 0LL);
  return v4;
}

- (id)_buildItemProvidersForHome:(id)a3
{
  v18 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  char v16 = [(id)objc_opt_class(v18) _isFilteringToFavoriteCameras] & 1;
  id v15 = [(id)objc_opt_class(v18) _disabledCameraIdentifiers];
  id v3 = objc_alloc(&OBJC_CLASS___HFCameraItemProvider);
  id v14 = [v3 initWithHome:location[0]];
  id v5 = v14;
  v7 = _NSConcreteStackBlock;
  int v8 = -1073741824;
  int v9 = 0;
  v10 = sub_100004C08;
  v11 = &unk_100014398;
  char v13 = v16 & 1;
  id v12 = v15;
  objc_msgSend(v5, "setFilter:");
  id v19 = v14;
  v6 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v19, 1LL);
  objc_storeStrong(&v12, 0LL);
  objc_storeStrong(&v14, 0LL);
  objc_storeStrong(&v15, 0LL);
  objc_storeStrong(location, 0LL);
  return v6;
}

- (id)_buildSectionsWithDisplayedItems:(id)a3
{
  char v13 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v5 = -[TVSHUICameraItemManager sourceItem](v13, "sourceItem");
  id v4 = [v5 latestResults];
  id v11 = [v4 objectForKeyedSubscript:HFResultDisplayReorderableCameraItemListKey];

  id v7 = [location[0] allObjects];
  id v6 = [v11 sortedHomeKitItemComparator];
  id v10 = objc_msgSend(v7, "sortedArrayUsingComparator:");

  id v9 = [[HFMutableItemSection alloc] initWithIdentifier:@"CamerasSection"];
  [v9 setItems:v10];
  id v14 = v9;
  int v8 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v14, 1LL);
  objc_storeStrong(&v9, 0LL);
  objc_storeStrong(&v10, 0LL);
  objc_storeStrong(&v11, 0LL);
  objc_storeStrong(location, 0LL);
  return v8;
}

@end
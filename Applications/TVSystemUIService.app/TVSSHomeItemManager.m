@interface TVSSHomeItemManager
+ (BOOL)isFilteringToFavoriteCameras;
- (HFActionSetItemProvider)actionSetItemProvider;
- (HFCameraItemProvider)cameraItemProvider;
- (NSArray)homeItemProviders;
- (id)_buildItemProvidersForHome:(id)a3;
- (id)_buildSectionsWithDisplayedItems:(id)a3;
- (id)_itemForSorting;
- (void)setActionSetItemProvider:(id)a3;
- (void)setCameraItemProvider:(id)a3;
- (void)setHomeItemProviders:(id)a3;
@end

@implementation TVSSHomeItemManager

+ (BOOL)isFilteringToFavoriteCameras
{
  id v3 =  +[TVSPreferences sharedPineBoardServicesPreferences]( &OBJC_CLASS___TVSPreferences,  "sharedPineBoardServicesPreferences");
  BOOL v4 = objc_msgSend(v3, "pbs_homeKitCamerasFilter") == 0;

  return v4;
}

- (id)_buildItemProvidersForHome:(id)a3
{
  v26 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  v13 = v26;
  id v3 = objc_alloc(&OBJC_CLASS___HFHomeItem);
  id v14 = [v3 initWithHome:location[0]];
  -[TVSSHomeItemManager setSourceItem:](v13, "setSourceItem:");

  id v15 =  +[TVSPreferences sharedPineBoardServicesPreferences]( &OBJC_CLASS___TVSPreferences,  "sharedPineBoardServicesPreferences");
  id v24 = objc_msgSend(v15, "pbs_homeKitDisabledCameras");

  BOOL v4 = objc_alloc(&OBJC_CLASS___HFCameraItemProvider);
  v5 = -[HFCameraItemProvider initWithHome:](v4, "initWithHome:", location[0]);
  cameraItemProvider = v26->_cameraItemProvider;
  v26->_cameraItemProvider = v5;

  v16 = v26->_cameraItemProvider;
  v18 = _NSConcreteStackBlock;
  int v19 = -1073741824;
  int v20 = 0;
  v21 = sub_100037A30;
  v22 = &unk_1001B7458;
  id v23 = v24;
  -[HFCameraItemProvider setFilter:](v16, "setFilter:");
  v7 = objc_alloc(&OBJC_CLASS___HFActionSetItemProvider);
  v8 = -[HFActionSetItemProvider initWithHome:](v7, "initWithHome:", location[0]);
  actionSetItemProvider = v26->_actionSetItemProvider;
  v26->_actionSetItemProvider = v8;

  -[HFActionSetItemProvider setFilter:](v26->_actionSetItemProvider, "setFilter:", &stru_1001B7498);
  v27[0] = v26->_cameraItemProvider;
  v27[1] = v26->_actionSetItemProvider;
  v10 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v27, 2LL);
  homeItemProviders = v26->_homeItemProviders;
  v26->_homeItemProviders = v10;

  v17 = v26->_homeItemProviders;
  objc_storeStrong(&v23, 0LL);
  objc_storeStrong(&v24, 0LL);
  objc_storeStrong(location, 0LL);
  return v17;
}

- (id)_itemForSorting
{
  return -[TVSSHomeItemManager sourceItem](self, "sourceItem", a2, self);
}

- (id)_buildSectionsWithDisplayedItems:(id)a3
{
  v32 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v16 = [[HFMutableItemSection alloc] initWithIdentifier:@"CamerasSection"];
  v34[0] = v16;
  id v15 = [[HFMutableItemSection alloc] initWithIdentifier:@"ScenesSection"];
  v34[1] = v15;
  v30 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v34, 2LL);

  id v29 = +[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary");
  memset(__b, 0, sizeof(__b));
  id obj = location[0];
  id v18 = [obj countByEnumeratingWithState:__b objects:v33 count:16];
  if (v18)
  {
    uint64_t v12 = *(void *)__b[2];
    uint64_t v13 = 0LL;
    id v14 = v18;
    while (1)
    {
      uint64_t v11 = v13;
      if (*(void *)__b[2] != v12) {
        objc_enumerationMutation(obj);
      }
      uint64_t v28 = *(void *)(__b[1] + 8 * v13);
      id v26 = 0LL;
      uint64_t v10 = v28;
      uint64_t v3 = objc_opt_class(&OBJC_CLASS___HFCameraItem);
      if ((objc_opt_isKindOfClass(v10, v3) & 1) != 0)
      {
        objc_storeStrong(&v26, @"CamerasSection");
      }

      else
      {
        uint64_t v9 = v28;
        uint64_t v4 = objc_opt_class(&OBJC_CLASS___HFActionSetItem);
        if ((objc_opt_isKindOfClass(v9, v4) & 1) != 0) {
          objc_storeStrong(&v26, @"ScenesSection");
        }
      }

      if (v26)
      {
        id v8 = objc_msgSend(v29, "na_objectForKey:withDefaultValue:", v26, &stru_1001B74D8);
        [v8 addObject:v28];
      }

      objc_storeStrong(&v26, 0LL);
      ++v13;
      if (v11 + 1 >= (unint64_t)v14)
      {
        uint64_t v13 = 0LL;
        id v14 = [obj countByEnumeratingWithState:__b objects:v33 count:16];
        if (!v14) {
          break;
        }
      }
    }
  }

  id v6 = v29;
  int v19 = _NSConcreteStackBlock;
  int v20 = -1073741824;
  int v21 = 0;
  v22 = sub_100037FFC;
  id v23 = &unk_1001B7528;
  id v24 = v30;
  v25 = v32;
  [v6 enumerateKeysAndObjectsUsingBlock:&v19];
  v7 = v30;
  objc_storeStrong((id *)&v25, 0LL);
  objc_storeStrong((id *)&v24, 0LL);
  objc_storeStrong(&v29, 0LL);
  objc_storeStrong((id *)&v30, 0LL);
  objc_storeStrong(location, 0LL);
  return v7;
}

- (NSArray)homeItemProviders
{
  return self->_homeItemProviders;
}

- (void)setHomeItemProviders:(id)a3
{
}

- (HFCameraItemProvider)cameraItemProvider
{
  return self->_cameraItemProvider;
}

- (void)setCameraItemProvider:(id)a3
{
}

- (HFActionSetItemProvider)actionSetItemProvider
{
  return self->_actionSetItemProvider;
}

- (void)setActionSetItemProvider:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
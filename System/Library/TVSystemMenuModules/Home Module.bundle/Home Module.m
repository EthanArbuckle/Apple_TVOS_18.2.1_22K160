}

uint64_t sub_2988(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(_BYTE *)result = 2;
  *(_BYTE *)(result + 1) = 3;
  *(_BYTE *)(result + 2) = 32;
  *(_BYTE *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 0;
  *(_BYTE *)(result + 13) = 8;
  *(void *)(result + 14) = a3;
  *(_BYTE *)(result + 22) = 32;
  *(_BYTE *)(result + 23) = 8;
  *(void *)(result + 24) = a4;
  return result;
}

void sub_29F0(id *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  [a1[4] _toggleActionSet];
  objc_storeStrong(location, 0LL);
}

void sub_2D24(id *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  v10[1] = a1;
  v10[0] = (id)home_module_log();
  os_log_type_t v9 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v10[0], OS_LOG_TYPE_DEFAULT))
  {
    log = (os_log_s *)v10[0];
    os_log_type_t type = v9;
    id v6 = [a1[4] homeItem];
    id v5 = [v6 actionSetName];
    id v8 = v5;
    sub_2EB4((uint64_t)v12, (uint64_t)v8);
    _os_log_impl(&dword_0, log, type, "Successfully executed %@ scene", v12, 0xCu);

    objc_storeStrong(&v8, 0LL);
  }

  objc_storeStrong(v10, 0LL);
  [a1[4] setSecondaryText:0];
  id v2 = (id)TVSMAnalyticsEventWithName(@"scene.selected.success");
  AnalyticsSendEventLazy();

  objc_storeStrong(location, 0LL);
}

uint64_t sub_2EB4(uint64_t result, uint64_t a2)
{
  *(_BYTE *)result = 2;
  *(_BYTE *)(result + 1) = 1;
  *(_BYTE *)(result + 2) = 64;
  *(_BYTE *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  return result;
}

NSDictionary *__cdecl sub_2EF4(id a1)
{
  return (NSDictionary *)&__NSDictionary0__struct;
}

void sub_2F14(id *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  v19[1] = a1;
  v19[0] = (id)home_module_log();
  os_log_type_t v18 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v19[0], OS_LOG_TYPE_DEFAULT))
  {
    log = (os_log_s *)v19[0];
    os_log_type_t type = v18;
    id v9 = [a1[4] homeItem];
    id v8 = [v9 actionSetName];
    id v17 = v8;
    sub_317C((uint64_t)v21, (uint64_t)v17, (uint64_t)location[0]);
    _os_log_impl(&dword_0, log, type, "Failed to execute %@ scene with error %@", v21, 0x16u);

    objc_storeStrong(&v17, 0LL);
  }

  objc_storeStrong(v19, 0LL);
  id v2 = a1[4];
  v4 =  +[NSBundle bundleWithIdentifier:]( &OBJC_CLASS___NSBundle,  "bundleWithIdentifier:",  @"com.apple.TVSystemMenu.Home-Module");
  v3 =  -[NSBundle localizedStringForKey:value:table:]( v4,  "localizedStringForKey:value:table:",  @"TVSMHomeModuleSceneFailedTitle",  &stru_192D0,  0LL);
  objc_msgSend(v2, "setSecondaryText:");

  id v5 = (id)TVSMAnalyticsEventWithName(@"scene.selected.failure");
  v11 = _NSConcreteStackBlock;
  int v12 = -1073741824;
  int v13 = 0;
  v14 = sub_31CC;
  v15 = &unk_185D0;
  id v16 = location[0];
  AnalyticsSendEventLazy(v5, &v11);

  objc_storeStrong(&v16, 0LL);
  objc_storeStrong(location, 0LL);
}

uint64_t sub_317C(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(_BYTE *)result = 2;
  *(_BYTE *)(result + 1) = 2;
  *(_BYTE *)(result + 2) = 64;
  *(_BYTE *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 64;
  *(_BYTE *)(result + 13) = 8;
  *(void *)(result + 14) = a3;
  return result;
}

NSDictionary *sub_31CC(uint64_t a1)
{
  v6[0] = @"errorCode";
  id v5 =  +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [*(id *)(a1 + 32) code]);
  v7[0] = v5;
  v6[1] = @"errorDomain";
  id v3 = [*(id *)(a1 + 32) domain];
  v7[1] = v3;
  v4 =  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v7,  v6,  2LL);

  return v4;
}

id sub_33AC(id a1)
{
  id v3 = (dispatch_once_t *)&unk_20250;
  id location = 0LL;
  objc_storeStrong(&location, &stru_18678);
  if (*v3 != -1) {
    dispatch_once(v3, location);
  }
  objc_storeStrong(&location, 0LL);
  return (id)qword_20258;
}

void sub_3430(id a1)
{
  v15[0] = HFSymbolIconIdentifierActionSetWakeUp;
  id v14 = +[UIColor systemYellowColor](&OBJC_CLASS___UIColor, "systemYellowColor");
  v16[0] = v14;
  v15[1] = HFSymbolIconIdentifierActionSetSleep;
  id v13 = +[UIColor systemIndigoColor](&OBJC_CLASS___UIColor, "systemIndigoColor");
  v16[1] = v13;
  v15[2] = HFSymbolIconIdentifierActionSetArrivingHome;
  id v12 = +[UIColor systemOrangeColor](&OBJC_CLASS___UIColor, "systemOrangeColor");
  v16[2] = v12;
  v15[3] = HFSymbolIconIdentifierActionSetLeavingHome;
  id v11 = +[UIColor systemOrangeColor](&OBJC_CLASS___UIColor, "systemOrangeColor");
  v16[3] = v11;
  v15[4] = HFSymbolIconIdentifierGeneric;
  id v10 = +[UIColor systemOrangeColor](&OBJC_CLASS___UIColor, "systemOrangeColor");
  v16[4] = v10;
  v15[5] = @"chair.lounge.fill";
  id v9 = +[UIColor systemBrownColor](&OBJC_CLASS___UIColor, "systemBrownColor");
  v16[5] = v9;
  v15[6] = @"popcorn.fill";
  id v8 = +[UIColor systemRedColor](&OBJC_CLASS___UIColor, "systemRedColor");
  v16[6] = v8;
  v15[7] = @"fork.knife";
  id v7 = +[UIColor systemGrayColor](&OBJC_CLASS___UIColor, "systemGrayColor");
  v16[7] = v7;
  v15[8] = @"cup.and.saucer.fill";
  id v6 = +[UIColor systemMintColor](&OBJC_CLASS___UIColor, "systemMintColor");
  v16[8] = v6;
  v15[9] = @"frying.pan.fill";
  id v5 = +[UIColor systemGrayColor](&OBJC_CLASS___UIColor, "systemGrayColor");
  v16[9] = v5;
  v15[10] = @"party.popper.fill";
  id v4 = +[UIColor systemYellowColor](&OBJC_CLASS___UIColor, "systemYellowColor");
  v16[10] = v4;
  v15[11] = @"heart.fill";
  id v3 = +[UIColor systemPinkColor](&OBJC_CLASS___UIColor, "systemPinkColor");
  v16[11] = v3;
  v1 =  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v16,  v15,  12LL);
  id v2 = (void *)qword_20258;
  qword_20258 = (uint64_t)v1;
}

uint64_t sub_4D9C(void *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  if (+[TVSMHomeModuleItemManager isFilteringToFavoriteCameras]( &OBJC_CLASS___TVSMHomeModuleItemManager,  "isFilteringToFavoriteCameras"))
  {
    char v8 = objc_msgSend(location[0], "hf_shouldBeOnForContextType:", 0) & 1;
  }

  else
  {
    id v3 = (void *)a1[4];
    id v5 = [location[0] uniqueIdentifier];
    id v4 = [v5 UUIDString];
    char v8 = (objc_msgSend(v3, "containsObject:") ^ 1) & 1;
  }

  objc_storeStrong(location, 0LL);
  return v8 & 1;
}

BOOL sub_4EA4(id a1, HMActionSet *a2)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  unsigned __int8 v3 = objc_msgSend(location[0], "hf_shouldBeOnForContextType:", 0);
  objc_storeStrong(location, 0LL);
  return v3 & 1;
}

NSMutableArray *__cdecl sub_5338(id a1)
{
  return (NSMutableArray *)+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array", a1, a1);
}

void sub_5368(uint64_t a1, void *a2, void *a3, void *a4)
{
  location[1] = (id)a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  id v28 = 0LL;
  objc_storeStrong(&v28, a3);
  v27[2] = a4;
  v27[1] = (id)a1;
  id v17 = *(void **)(a1 + 32);
  v21 = _NSConcreteStackBlock;
  int v22 = -1073741824;
  int v23 = 0;
  v24 = sub_5630;
  v25 = &unk_18898;
  id v26 = location[0];
  v27[0] = objc_msgSend(v17, "na_firstObjectPassingTest:", &v21);
  id v20 = 0LL;
  if ([location[0] isEqualToString:@"ScenesSection"])
  {
    id v13 = [*(id *)(a1 + 40) sourceItem];
    id v12 = [v13 latestResults];
    id v19 = [v12 objectForKeyedSubscript:HFResultDisplayReorderableActionSetItemListKey];

    id v4 = [v19 sortedHomeKitItemComparator];
    id v5 = v20;
    id v20 = v4;

    objc_storeStrong(&v19, 0LL);
  }

  else
  {
    id v11 = [*(id *)(a1 + 40) sourceItem];
    id v10 = [v11 latestResults];
    id v18 = [v10 objectForKeyedSubscript:HFResultDisplayReorderableCameraItemListKey];

    id v6 = [v18 sortedHomeKitItemComparator];
    id v7 = v20;
    id v20 = v6;

    objc_storeStrong(&v18, 0LL);
  }

  id v9 = objc_msgSend(v28, "sortedArrayUsingComparator:", v20, v27[0]);
  objc_msgSend(v8, "setItems:");

  objc_storeStrong(&v20, 0LL);
  objc_storeStrong(v27, 0LL);
  objc_storeStrong(&v26, 0LL);
  objc_storeStrong(&v28, 0LL);
  objc_storeStrong(location, 0LL);
}

uint64_t sub_5630(void *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  id v4 = [location[0] identifier];
  unsigned __int8 v5 = [v4 isEqualToString:a1[4]];

  objc_storeStrong(location, 0LL);
  return v5 & 1;
}

void sub_69C4(id a1, PBSSystemHomeUIStreamState *a2, NSError *a3)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  id v4 = 0LL;
  objc_storeStrong(&v4, a3);
  objc_storeStrong(&v4, 0LL);
  objc_storeStrong(location, 0LL);
}

void sub_75BC(uint64_t a1, int a2)
{
  *(void *)(v2 - 64) = a1;
  *(_DWORD *)(v2 - 68) = a2;
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(*(_Unwind_Exception **)(v2 - 64));
}

id sub_7640(id *a1, void *a2, void *a3, void *a4)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  id v25 = 0LL;
  objc_storeStrong(&v25, a3);
  id v24 = 0LL;
  objc_storeStrong(&v24, a4);
  v23[1] = a1;
  v23[0] = objc_loadWeakRetained(a1 + 4);
  id v17 = [v23[0] homeItemsByID];
  id v22 = [v17 objectForKey:v24];

  if ([v22 isActionSet])
  {
    id v12 = location[0];
    id v4 = (objc_class *)objc_opt_class(&OBJC_CLASS___TVSMHomeSceneCollectionViewCell);
    id v13 = NSStringFromClass(v4);
    id v21 = objc_msgSend(v12, "dequeueReusableCellWithReuseIdentifier:forIndexPath:");

    id v27 = v21;
    int v20 = 1;
    objc_storeStrong(&v21, 0LL);
  }

  else if ([v22 isCameraItem])
  {
    id v10 = location[0];
    unsigned __int8 v5 = (objc_class *)objc_opt_class(&OBJC_CLASS___TVHMCameraCollectionViewCell);
    id v11 = NSStringFromClass(v5);
    id v19 = objc_msgSend(v10, "dequeueReusableCellWithReuseIdentifier:forIndexPath:");

    id v27 = v19;
    int v20 = 1;
    objc_storeStrong(&v19, 0LL);
  }

  else
  {
    id v8 = location[0];
    id v6 = (objc_class *)objc_opt_class(&OBJC_CLASS___TVHMHomeAllCamerasCollectionViewCell);
    id v9 = NSStringFromClass(v6);
    id v18 = objc_msgSend(v8, "dequeueReusableCellWithReuseIdentifier:forIndexPath:");

    id v27 = v18;
    int v20 = 1;
    objc_storeStrong(&v18, 0LL);
  }

  objc_storeStrong(&v22, 0LL);
  objc_storeStrong(v23, 0LL);
  objc_storeStrong(&v24, 0LL);
  objc_storeStrong(&v25, 0LL);
  objc_storeStrong(location, 0LL);
  return v27;
}

id sub_78D0(id *a1, void *a2, void *a3, void *a4)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  id v30 = 0LL;
  objc_storeStrong(&v30, a3);
  id v29 = 0LL;
  objc_storeStrong(&v29, a4);
  v28[1] = a1;
  v28[0] =  [location[0] dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"header" forIndexPath:v29];
  id WeakRetained = objc_loadWeakRetained(a1 + 4);
  id v15 = [WeakRetained diffableDataSource];
  id v14 = [v15 snapshot];
  id v13 = [v14 sectionIdentifiers];
  id v12 = objc_msgSend(v13, "objectAtIndex:", objc_msgSend(v29, "section"));
  id v17 = (char *)[v12 unsignedIntegerValue];

  id v27 = v17;
  if (v17)
  {
    if (v27 == (_BYTE *)&dword_0 + 1)
    {
      id v8 =  +[NSBundle bundleWithIdentifier:]( &OBJC_CLASS___NSBundle,  "bundleWithIdentifier:",  @"com.apple.TVSystemMenu.Home-Module");
      id v7 =  -[NSBundle localizedStringForKey:value:table:]( v8,  "localizedStringForKey:value:table:",  @"TVSMHomeModuleScenesTitle",  &stru_192D0,  0LL);
      objc_msgSend(v28[0], "setTitle:");
    }
  }

  else
  {
    char v24 = 0;
    char v22 = 0;
    char v20 = 0;
    char v18 = 0;
    if (+[TVSMHomeModuleItemManager isFilteringToFavoriteCameras]( &OBJC_CLASS___TVSMHomeModuleItemManager,  "isFilteringToFavoriteCameras"))
    {
      id v25 =  +[NSBundle bundleWithIdentifier:]( &OBJC_CLASS___NSBundle,  "bundleWithIdentifier:",  @"com.apple.TVSystemMenu.Home-Module");
      char v24 = 1;
      int v23 =  -[NSBundle localizedStringForKey:value:table:]( v25,  "localizedStringForKey:value:table:",  @"TVSMHomeModuleFavoriteCamerasTitle",  &stru_192D0,  0LL);
      char v22 = 1;
      id v4 = v23;
    }

    else
    {
      id v21 =  +[NSBundle bundleWithIdentifier:]( &OBJC_CLASS___NSBundle,  "bundleWithIdentifier:",  @"com.apple.TVSystemMenu.Home-Module");
      char v20 = 1;
      id v19 =  -[NSBundle localizedStringForKey:value:table:]( v21,  "localizedStringForKey:value:table:",  @"TVSMHomeModuleCamerasTitle",  &stru_192D0,  0LL);
      char v18 = 1;
      id v4 = v19;
    }

    id v26 = v4;
    if ((v18 & 1) != 0) {

    }
    if ((v20 & 1) != 0) {
    if ((v22 & 1) != 0)
    }

    if ((v24 & 1) != 0) {
    [v28[0] setTitle:v26];
    }
    objc_storeStrong((id *)&v26, 0LL);
  }

  id v6 = v28[0];
  objc_storeStrong(v28, 0LL);
  objc_storeStrong(&v29, 0LL);
  objc_storeStrong(&v30, 0LL);
  objc_storeStrong(location, 0LL);
  return v6;
}

_BYTE *sub_7F70(_BYTE *result)
{
  *result = 0;
  result[1] = 0;
  return result;
}

void sub_91E0(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) favoritesCollectionView];
  id v1 = [v2 collectionViewLayout];
  [v1 invalidateLayout];
}

void sub_9248(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) favoritesCollectionView];
  id v1 = [v2 collectionViewLayout];
  [v1 invalidateLayout];
}

void sub_9394( uint64_t a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id *location)
{
  *(void *)(v11 - 40) = a1;
  *(_DWORD *)(v11 - 44) = a2;
  objc_destroyWeak((id *)(v11 - 24));
  _Unwind_Resume(*(_Unwind_Exception **)(v11 - 40));
}

id sub_93D4(uint64_t a1, uint64_t a2, id obj)
{
  uint64_t v68 = a1;
  uint64_t v67 = a2;
  id location = 0LL;
  objc_storeStrong(&location, obj);
  uint64_t v65 = a1;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v45 = [WeakRetained diffableDataSource];
  id v44 = [v45 snapshot];
  id v43 = [v44 sectionIdentifiers];
  id v42 = [v43 objectAtIndex:v67];
  v47 = (char *)[v42 unsignedIntegerValue];

  v64 = v47;
  if (v47)
  {
    if (v64 == (_BYTE *)&dword_0 + 1)
    {
      id v17 =  +[NSCollectionLayoutDimension absoluteDimension:]( &OBJC_CLASS___NSCollectionLayoutDimension,  "absoluteDimension:",  210.0);
      id v16 =  +[NSCollectionLayoutDimension absoluteDimension:]( &OBJC_CLASS___NSCollectionLayoutDimension,  "absoluteDimension:");
      v53 =  +[NSCollectionLayoutSize sizeWithWidthDimension:heightDimension:]( &OBJC_CLASS___NSCollectionLayoutSize,  "sizeWithWidthDimension:heightDimension:",  v17);

      v52 =  +[NSCollectionLayoutItem itemWithLayoutSize:]( &OBJC_CLASS___NSCollectionLayoutItem,  "itemWithLayoutSize:",  v53);
      id v19 =  +[NSCollectionLayoutDimension absoluteDimension:]( &OBJC_CLASS___NSCollectionLayoutDimension,  "absoluteDimension:",  440.0);
      char v18 =  +[NSCollectionLayoutDimension absoluteDimension:]( &OBJC_CLASS___NSCollectionLayoutDimension,  "absoluteDimension:",  114.0);
      v51 =  +[NSCollectionLayoutSize sizeWithWidthDimension:heightDimension:]( &OBJC_CLASS___NSCollectionLayoutSize,  "sizeWithWidthDimension:heightDimension:",  v19);

      char v20 = v51;
      v71 = v52;
      id v21 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v71);
      v50 =  +[NSCollectionLayoutGroup horizontalGroupWithLayoutSize:subitems:]( &OBJC_CLASS___NSCollectionLayoutGroup,  "horizontalGroupWithLayoutSize:subitems:",  v20);

      char v22 = v50;
      int v23 = +[NSCollectionLayoutSpacing fixedSpacing:](&OBJC_CLASS___NSCollectionLayoutSpacing, "fixedSpacing:");
      -[NSCollectionLayoutGroup setInterItemSpacing:](v22, "setInterItemSpacing:");

      id v26 =  +[NSCollectionLayoutDimension fractionalWidthDimension:]( &OBJC_CLASS___NSCollectionLayoutDimension,  "fractionalWidthDimension:",  1.0);
      id v25 =  +[NSCollectionLayoutDimension estimatedDimension:]( &OBJC_CLASS___NSCollectionLayoutDimension,  "estimatedDimension:",  78.0);
      char v24 =  +[NSCollectionLayoutSize sizeWithWidthDimension:heightDimension:]( &OBJC_CLASS___NSCollectionLayoutSize,  "sizeWithWidthDimension:heightDimension:",  v26);
      v49 =  +[NSCollectionLayoutBoundarySupplementaryItem boundarySupplementaryItemWithLayoutSize:elementKind:alignment:]( &OBJC_CLASS___NSCollectionLayoutBoundarySupplementaryItem,  "boundarySupplementaryItemWithLayoutSize:elementKind:alignment:");

      id v48 =  +[NSCollectionLayoutSection sectionWithGroup:]( &OBJC_CLASS___NSCollectionLayoutSection,  "sectionWithGroup:",  v50);
      [v48 setInterGroupSpacing:20.0];
      id v27 = v48;
      sub_9D00();
      objc_msgSend(v27, "setContentInsets:", v11, v12, v13, v14);
      id v28 = v48;
      v70 = v49;
      id v29 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v70, 1LL);
      objc_msgSend(v28, "setBoundarySupplementaryItems:");

      id v69 = v48;
      int v54 = 1;
      objc_storeStrong(&v48, 0LL);
      objc_storeStrong((id *)&v49, 0LL);
      objc_storeStrong((id *)&v50, 0LL);
      objc_storeStrong((id *)&v51, 0LL);
      objc_storeStrong((id *)&v52, 0LL);
      objc_storeStrong((id *)&v53, 0LL);
    }

    else
    {
      id v69 = 0LL;
      int v54 = 1;
    }
  }

  else
  {
    v31 =  +[NSCollectionLayoutDimension absoluteDimension:]( &OBJC_CLASS___NSCollectionLayoutDimension,  "absoluteDimension:",  440.0);
    id v30 =  +[NSCollectionLayoutDimension absoluteDimension:]( &OBJC_CLASS___NSCollectionLayoutDimension,  "absoluteDimension:",  247.0);
    v63 =  +[NSCollectionLayoutSize sizeWithWidthDimension:heightDimension:]( &OBJC_CLASS___NSCollectionLayoutSize,  "sizeWithWidthDimension:heightDimension:",  v31);

    v62 =  +[NSCollectionLayoutItem itemWithLayoutSize:]( &OBJC_CLASS___NSCollectionLayoutItem,  "itemWithLayoutSize:",  v63);
    v32 = v63;
    v73 = v62;
    v33 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v73);
    v61 =  +[NSCollectionLayoutGroup horizontalGroupWithLayoutSize:subitems:]( &OBJC_CLASS___NSCollectionLayoutGroup,  "horizontalGroupWithLayoutSize:subitems:",  v32);

    v36 =  +[NSCollectionLayoutDimension fractionalWidthDimension:]( &OBJC_CLASS___NSCollectionLayoutDimension,  "fractionalWidthDimension:",  1.0);
    v35 =  +[NSCollectionLayoutDimension estimatedDimension:]( &OBJC_CLASS___NSCollectionLayoutDimension,  "estimatedDimension:",  78.0);
    v34 =  +[NSCollectionLayoutSize sizeWithWidthDimension:heightDimension:]( &OBJC_CLASS___NSCollectionLayoutSize,  "sizeWithWidthDimension:heightDimension:",  v36);
    v60 =  +[NSCollectionLayoutBoundarySupplementaryItem boundarySupplementaryItemWithLayoutSize:elementKind:alignment:]( &OBJC_CLASS___NSCollectionLayoutBoundarySupplementaryItem,  "boundarySupplementaryItemWithLayoutSize:elementKind:alignment:");

    v37 = v60;
    sub_9D00();
    v59[1] = v3;
    v59[2] = v4;
    v59[3] = v5;
    v59[4] = v6;
    -[NSCollectionLayoutBoundarySupplementaryItem setContentInsets:]( v37,  "setContentInsets:",  *(double *)&v3,  *(double *)&v4,  *(double *)&v5,  *(double *)&v6);
    v59[0] =  +[NSCollectionLayoutSection sectionWithGroup:]( &OBJC_CLASS___NSCollectionLayoutSection,  "sectionWithGroup:",  v61);
    [v59[0] setInterGroupSpacing:25.0];
    [v59[0] setOrthogonalScrollingBehavior:2];
    id v38 = v59[0];
    sub_9D00();
    double v55 = v7;
    double v56 = v8;
    double v57 = v9;
    double v58 = v10;
    objc_msgSend(v38, "setContentInsets:", v7, v8, v9, v10);
    id v39 = v59[0];
    v72 = v60;
    v40 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v72, 1LL);
    objc_msgSend(v39, "setBoundarySupplementaryItems:");

    [v59[0] setSupplementaryContentInsetsReference:1];
    id v69 = v59[0];
    int v54 = 1;
    objc_storeStrong(v59, 0LL);
    objc_storeStrong((id *)&v60, 0LL);
    objc_storeStrong((id *)&v61, 0LL);
    objc_storeStrong((id *)&v62, 0LL);
    objc_storeStrong((id *)&v63, 0LL);
  }

  objc_storeStrong(&location, 0LL);
  return v69;
}

  ;
}

NSDictionary *__cdecl sub_A4A4(id a1)
{
  return (NSDictionary *)&__NSDictionary0__struct;
}

NSDictionary *sub_A744(uint64_t a1)
{
  v6[0] = @"cameraCount";
  unsigned __int8 v5 =  +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [*(id *)(a1 + 32) count]);
  v7[0] = v5;
  v6[1] = @"sceneCount";
  unsigned __int8 v3 =  +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [*(id *)(a1 + 40) count]);
  v7[1] = v3;
  id v4 =  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v7,  v6,  2LL);

  return v4;
}

uint64_t sub_B9E4(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) cameraView];
  id v3 = [v4 cameraContentView];
  id v2 = +[TVHMCameraContentViewStyle previewStyle](&OBJC_CLASS___TVHMCameraContentViewStyle, "previewStyle");
  objc_msgSend(v3, "applyStyle:");

  id v5 = [*(id *)(a1 + 40) cameraView];
  [v5 setCameraContentView:*(void *)(a1 + 48)];

  [*(id *)(a1 + 40) setCentered:*(_BYTE *)(a1 + 72) & 1];
  objc_msgSend(*(id *)(a1 + 56), "setSelectedCameraViewController:");
  [*(id *)(a1 + 56) setDismissedCameraViewController:0];
  uint64_t result = a1;
  if (*(void *)(a1 + 64)) {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 64) + 16LL))();
  }
  return result;
}

void sub_BF88(id *a1)
{
  v15[2] = a1;
  v15[1] = a1;
  id v4 = a1[4];
  id v2 = a1[5];
  uint64_t v3 = v4[14];
  id v5 = [v2 cameraContentView];
  id v6 = _NSConcreteStackBlock;
  int v7 = -1073741824;
  int v8 = 0;
  double v9 = sub_C140;
  double v10 = &unk_18CE8;
  id v11 = a1[5];
  id v12 = a1[4];
  id v13 = a1[6];
  v15[0] = a1[8];
  id v14 = a1[7];
  objc_msgSend( v4,  "viewControllerDidRequestDismissal:focusedIdentifier:focusedContentView:animated:centered:completion:",  v2,  v3,  v5,  0,  0);

  objc_storeStrong(&v14, 0LL);
  objc_storeStrong(v15, 0LL);
  objc_storeStrong(&v13, 0LL);
  objc_storeStrong(&v12, 0LL);
  objc_storeStrong(&v11, 0LL);
}

void sub_C140(uint64_t a1)
{
  v12[2] = (id)a1;
  v12[1] = (id)a1;
  id v1 = [*(id *)(a1 + 32) cameraContentView];
  [v1 setWantsCameraViewControls:0 animated:0];

  id v4 = *(void **)(a1 + 40);
  uint64_t v3 = *(void *)(a1 + 48);
  id v5 = _NSConcreteStackBlock;
  int v6 = -1073741824;
  int v7 = 0;
  int v8 = sub_C28C;
  double v9 = &unk_18CC0;
  id v10 = *(id *)(a1 + 40);
  v12[0] = *(id *)(a1 + 64);
  id v11 = *(id *)(a1 + 56);
  objc_msgSend(v4, "presentViewController:animated:completion:", v3, 0);
  objc_storeStrong(&v11, 0LL);
  objc_storeStrong(v12, 0LL);
  objc_storeStrong(&v10, 0LL);
}

void sub_C28C(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) view];
  id v4 = [v5 window];
  [v4 bringSubviewToFront:*(void *)(*(void *)(a1 + 32) + 120)];

  (*(void (**)(void))(*(void *)(a1 + 48) + 16LL))();
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 112LL), *(id *)(a1 + 40));
  id v1 = [*(id *)(*(void *)(a1 + 32) + 64) objectForKeyedSubscript:*(void *)(a1 + 40)];
  id v2 = (void **)(*(void *)(a1 + 32) + 88LL);
  uint64_t v3 = *v2;
  *id v2 = v1;

  int v7 = *(void **)(*(void *)(a1 + 32) + 40LL);
  id v8 = [*(id *)(*(void *)(a1 + 32) + 48) indexPathForItemIdentifier:*(void *)(a1 + 40)];
  objc_msgSend(v7, "scrollToItemAtIndexPath:atScrollPosition:animated:");
}

void sub_D404(id *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  v4[1] = a1;
  v4[0] = objc_loadWeakRetained(a1 + 4);
  id v3 = [v4[0] delegate];
  [v3 moduleDidRequestSystemMenuDismissal:v4[0] animated:0 result:0];

  objc_storeStrong(v4, 0LL);
  objc_storeStrong(location, 0LL);
}

id objc_msgSend_viewControllerDidRequestDismissal_focusedIdentifier_focusedContentView_animated_centered_completion_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "viewControllerDidRequestDismissal:focusedIdentifier:focusedContentView:animated:centered:completion:");
}

id objc_msgSend_windowScene(void *a1, const char *a2, ...)
{
  return [a1 windowScene];
}
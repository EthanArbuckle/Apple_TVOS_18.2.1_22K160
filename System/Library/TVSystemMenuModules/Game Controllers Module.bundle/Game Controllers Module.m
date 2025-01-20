}

id sub_606C(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateColors", a1, a1);
}

void sub_6364(id a1)
{
  v4[2] = a1;
  v4[1] = a1;
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___TVSMGameControllerCollectionViewCell);
  v1 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v5, 1LL);
  v4[0] =  +[_UIFloatingContentView appearanceWhenContainedInInstancesOfClasses:]( &OBJC_CLASS____UIFloatingContentView,  "appearanceWhenContainedInInstancesOfClasses:");

  id v2 = v4[0];
  v3 =  +[_UIFocusAnimationConfiguration configurationWithStyle:]( &OBJC_CLASS____UIFocusAnimationConfiguration,  "configurationWithStyle:",  2LL);
  objc_msgSend(v2, "setFocusAnimationConfiguration:");

  [v4[0] setCornerRadius:12.0];
  [v4[0] setContinuousCornerEnabled:1];
  objc_storeStrong(v4, 0LL);
}

BOOL sub_650C(id a1, UIPress *a2)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  BOOL v3 = 1;
  if ([location[0] type] != &dword_4) {
    BOOL v3 = [location[0] type] == (char *)&dword_4 + 2;
  }
  objc_storeStrong(location, 0LL);
  return v3;
}

void sub_6990(id a1)
{
  v1 = +[UIColor blackColor](&OBJC_CLASS___UIColor, "blackColor");
  id v2 = (void *)qword_1A478;
  qword_1A478 = (uint64_t)v1;

  BOOL v3 = +[UIColor whiteColor](&OBJC_CLASS___UIColor, "whiteColor");
  v4 = (void *)qword_1A480;
  qword_1A480 = (uint64_t)v3;

  uint64_t v5 = +[UIColor colorWithWhite:alpha:](&OBJC_CLASS___UIColor, "colorWithWhite:alpha:", 0.0);
  v6 = (void *)qword_1A488;
  qword_1A488 = (uint64_t)v5;

  v7 = +[UIColor colorWithWhite:alpha:](&OBJC_CLASS___UIColor, "colorWithWhite:alpha:", 1.0, 0.5);
  v8 = (void *)qword_1A490;
  qword_1A490 = (uint64_t)v7;
}

id TVSMGameControllersLog()
{
  predicate = (dispatch_once_t *)&unk_1A4A8;
  dispatch_block_t block = 0LL;
  objc_storeStrong(&block, &stru_14360);
  if (*predicate != -1) {
    dispatch_once(predicate, block);
  }
  objc_storeStrong(&block, 0LL);
  return (id)qword_1A4A0;
}

void sub_7CF0(id a1)
{
  os_log_t v1 = os_log_create("com.apple.TVSystemMenu.Game-Controllers-Module", "");
  id v2 = (void *)qword_1A4A0;
  qword_1A4A0 = (uint64_t)v1;
}

void sub_9B14( uint64_t a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id *a12, uint64_t a13, uint64_t a14, id *location)
{
  *(void *)(v15 - 112) = a1;
  *(_DWORD *)(v15 - 116) = a2;
  objc_destroyWeak((id *)(v15 - 72));
  objc_destroyWeak((id *)(v15 - 64));
  _Unwind_Resume(*(_Unwind_Exception **)(v15 - 112));
}

void sub_9BC4(id *a1)
{
  v2[2] = a1;
  v2[1] = a1;
  v2[0] = objc_loadWeakRetained(a1 + 4);
  id v1 = [v2[0] delegate];
  [v1 contentModuleViewControllerDidRequestDismissal:v2[0]];

  objc_storeStrong(v2, 0LL);
}

id sub_9C30(id *a1, void *a2, void *a3, void *a4)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  id v10 = 0LL;
  objc_storeStrong(&v10, a3);
  id v9 = 0LL;
  objc_storeStrong(&v9, a4);
  v8[1] = a1;
  v8[0] = objc_loadWeakRetained(a1 + 4);
  else {
    id v12 = [v8[0] _deviceCellWithItemIdentifier:v9 atIndexPath:v10];
  }
  objc_storeStrong(v8, 0LL);
  objc_storeStrong(&v9, 0LL);
  objc_storeStrong(&v10, 0LL);
  objc_storeStrong(location, 0LL);
  return v12;
}

id sub_9D40(id *a1, void *a2, void *a3, void *a4)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  id v17 = 0LL;
  objc_storeStrong(&v17, a3);
  id v16 = 0LL;
  objc_storeStrong(&v16, a4);
  v15[1] = a1;
  v15[0] = objc_loadWeakRetained(a1 + 4);
  id v14 = 0LL;
  if ([v17 isEqualToString:UICollectionElementKindSectionHeader])
  {
    id v13 =  [location[0] dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"SectionHeaderViewReuseIdentifier" forIndexPath:v16];
    id v12 = objc_msgSend(v15[0], "_sectionIdentifierAtIndex:", objc_msgSend(v16, "section"));
    if ([v12 isEqualToString:@"PairableDevicesSection"])
    {
      v8 =  +[NSBundle bundleWithIdentifier:]( &OBJC_CLASS___NSBundle,  "bundleWithIdentifier:",  @"com.apple.TVSystemMenu.Game-Controllers-Module");
      v7 =  -[NSBundle localizedStringForKey:value:table:]( v8,  "localizedStringForKey:value:table:",  @"TVSMGameControllersModuleOtherControllers",  &stru_14478,  0LL);
      v6 = -[NSString localizedUppercaseString](v7, "localizedUppercaseString");
      objc_msgSend(v13, "setTitle:");

      [v13 setShowingActivityIndicator:1];
    }

    objc_storeStrong(&v14, v13);
    objc_storeStrong(&v12, 0LL);
    objc_storeStrong(&v13, 0LL);
  }

  id v5 = v14;
  objc_storeStrong(&v14, 0LL);
  objc_storeStrong(v15, 0LL);
  objc_storeStrong(&v16, 0LL);
  objc_storeStrong(&v17, 0LL);
  objc_storeStrong(location, 0LL);
  return v5;
}

void sub_A314(uint64_t a1)
{
  id v2 = +[LSApplicationWorkspace defaultWorkspace](&OBJC_CLASS___LSApplicationWorkspace, "defaultWorkspace");
  objc_msgSend(v2, "openSensitiveURL:withOptions:error:", *(void *)(a1 + 32), 0);
}

void sub_B040()
{
}

uint64_t sub_B050(uint64_t result, uint64_t a2)
{
  *(_BYTE *)result = 2;
  *(_BYTE *)(result + 1) = 1;
  *(_BYTE *)(result + 2) = 64;
  *(_BYTE *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  return result;
}

void sub_B090(uint64_t a1, void *a2)
{
  location[1] = (id)a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _disconnectDevice:*(void *)(a1 + 32)];

  objc_storeStrong(location, 0LL);
}

void sub_B104(uint64_t a1, void *a2)
{
  location[1] = (id)a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _unpairDevice:*(void *)(a1 + 32)];

  objc_storeStrong(location, 0LL);
}

id sub_C984(void *a1, uint64_t a2)
{
  id location = 0LL;
  objc_storeStrong(&location, a1);
  uint64_t v7 = a2;
  if (a2 && (objc_opt_isKindOfClass(location, v7) & 1) != 0) {
    id v2 = location;
  }
  else {
    id v2 = 0LL;
  }
  id v6 = v2;
  id v4 = v2;
  objc_storeStrong(&v6, 0LL);
  objc_storeStrong(&location, 0LL);
  return v4;
}

void sub_CB64( uint64_t a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *location)
{
  *(void *)(v10 - 40) = a1;
  *(_DWORD *)(v10 - 44) = a2;
  objc_destroyWeak((id *)(v10 - 32));
  _Unwind_Resume(*(_Unwind_Exception **)(v10 - 40));
}

void sub_CBA4(uint64_t a1, void *a2)
{
  location[1] = (id)a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  if (location[0])
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    [WeakRetained _presentAlertWithError:location[0] forDevice:*(void *)(a1 + 32)];
  }

  objc_storeStrong(location, 0LL);
}

void sub_CD48( uint64_t a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *location)
{
  *(void *)(v10 - 40) = a1;
  *(_DWORD *)(v10 - 44) = a2;
  objc_destroyWeak((id *)(v10 - 32));
  _Unwind_Resume(*(_Unwind_Exception **)(v10 - 40));
}

void sub_CD88(uint64_t a1, void *a2)
{
  location[1] = (id)a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  if (location[0])
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    [WeakRetained _presentAlertWithError:location[0] forDevice:*(void *)(a1 + 32)];
  }

  objc_storeStrong(location, 0LL);
}

void sub_CF2C( uint64_t a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *location)
{
  *(void *)(v10 - 40) = a1;
  *(_DWORD *)(v10 - 44) = a2;
  objc_destroyWeak((id *)(v10 - 32));
  _Unwind_Resume(*(_Unwind_Exception **)(v10 - 40));
}

void sub_CF6C(uint64_t a1, void *a2)
{
  location[1] = (id)a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  if (location[0])
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    [WeakRetained _presentAlertWithError:location[0] forDevice:*(void *)(a1 + 32)];
  }

  objc_storeStrong(location, 0LL);
}

void sub_DA40(uint64_t a1, void *a2)
{
  location[1] = (id)a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _unpairDevice:*(void *)(a1 + 32)];

  objc_storeStrong(location, 0LL);
}

id objc_msgSend_widthAnchor(void *a1, const char *a2, ...)
{
  return [a1 widthAnchor];
}
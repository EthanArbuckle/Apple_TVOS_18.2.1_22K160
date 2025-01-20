void sub_100001FB0(uint64_t a1)
{
  uint64_t v1;
  NSNumber *v2;
  v1 = *(void *)(a1 + 32);
  v2 =  +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  *(void *)(a1 + 40));
  (*(void (**)(void))(v1 + 16))();
}

uint64_t sub_100002018(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16LL))(*(void *)(a1 + 32), 0LL);
}

uint64_t start(int a1, char **a2)
{
  context = objc_autoreleasePoolPush();
  v2 = (objc_class *)objc_opt_class(&OBJC_CLASS___AppDelegate);
  v4 = NSStringFromClass(v2);
  unsigned int v8 = UIApplicationMain(a1, a2, 0LL, v4);

  objc_autoreleasePoolPop(context);
  return v8;
}

id sub_100002FD4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "dismissWithResult:", &__kCFBooleanTrue, a1, a1);
}

id sub_10000300C(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "dismissWithResult:", &__kCFBooleanFalse, a1, a1);
}

void sub_100003658(uint64_t a1, void *a2, void *a3, void *a4)
{
  location[1] = (id)a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  id v10 = 0LL;
  objc_storeStrong(&v10, a3);
  v9[2] = a4;
  v9[1] = (id)a1;
  v9[0] = objc_alloc_init(&OBJC_CLASS____User);
  [v9[0] setName:v10];
  [v9[0] setIdentifier:location[0]];
  id v6 = v9[0];
  id v7 = [*(id *)(*(void *)(a1 + 32) + 16) objectForKeyedSubscript:location[0]];
  objc_msgSend(v6, "setAssignedProfileIndex:");

  [*(id *)(a1 + 40) addObject:v9[0]];
  objc_storeStrong(v9, 0LL);
  objc_storeStrong(&v10, 0LL);
  objc_storeStrong(location, 0LL);
}

void sub_100003F88(id *a1)
{
  v18[2] = a1;
  v18[1] = a1;
  v18[0] = objc_loadWeakRetained(a1 + 6);
  v3 = objc_alloc(&OBJC_CLASS___TVProfileMapSelectionViewController);
  uint64_t v2 = *((void *)a1[4] + 4);
  id v4 = [a1[5] name];
  id v17 = -[TVProfileMapSelectionViewController initWithProfiles:user:app:](v3, "initWithProfiles:user:app:", v2);

  objc_initWeak(&location, a1[4]);
  id v6 = v17;
  id v7 = _NSConcreteStackBlock;
  int v8 = -1073741824;
  int v9 = 0;
  id v10 = sub_1000041E0;
  v11 = &unk_100008468;
  objc_copyWeak(&v15, &location);
  id v12 = a1[5];
  id v13 = a1[4];
  id v14 = v18[0];
  [v6 setSelectedProfileIndex:&v7];
  id v1 = [a1[4] navigationController];
  [v1 pushViewController:v17 animated:1];

  objc_storeStrong(&v14, 0LL);
  objc_storeStrong(&v13, 0LL);
  objc_storeStrong(&v12, 0LL);
  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
  objc_storeStrong(&v17, 0LL);
  objc_storeStrong(v18, 0LL);
}

void sub_100004194( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, int a22, int a23, _Unwind_Exception *exception_object)
{
}

void sub_1000041E0(uint64_t a1, void *a2)
{
  location[1] = (id)a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  v20[1] = (id)a1;
  v20[0] = objc_loadWeakRetained((id *)(a1 + 56));
  [*(id *)(a1 + 32) setAssignedProfileIndex:location[0]];
  id v12 = location[0];
  id v13 = *(void **)(*(void *)(a1 + 40) + 16LL);
  id v14 = [*(id *)(a1 + 32) identifier];
  objc_msgSend(v13, "setObject:forKeyedSubscript:", v12);

  id v15 = +[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle");
  v19 =  -[NSBundle localizedStringForKey:value:table:]( v15,  "localizedStringForKey:value:table:",  @"MappingDialogNoProfileTitle",  &stru_1000084D0,  0LL);

  id v2 = [*(id *)(a1 + 32) assignedProfileIndex];
  BOOL v17 = v2 == 0LL;

  if (!v17)
  {
    id v7 = [*(id *)(a1 + 32) assignedProfileIndex];
    id v8 = [v7 integerValue];

    v18[1] = v8;
    v18[0] = [*(id *)(*(void *)(a1 + 40) + 32) objectAtIndexedSubscript:v8];
    v11 = +[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle");
    id v10 =  -[NSBundle localizedStringForKey:value:table:]( v11,  "localizedStringForKey:value:table:",  @"ProfileNameTitle",  &stru_1000084D0);
    id v9 = [v18[0] name];
    v3 = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v10, v9);
    id v4 = v19;
    v19 = v3;

    objc_storeStrong(v18, 0LL);
  }

  [*(id *)(a1 + 48) setDetailText:v19];
  id v6 = [v20[0] navigationController];
  id v5 = [v6 popViewControllerAnimated:1];

  objc_storeStrong((id *)&v19, 0LL);
  objc_storeStrong(v20, 0LL);
  objc_storeStrong(location, 0LL);
}

void sub_1000044D8(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8LL));
  [WeakRetained profileMappingViewController:*(void *)(a1 + 32) didFinishWithMap:*(void *)(*(void *)(a1 + 32) + 16)];
}

id objc_msgSend_window(void *a1, const char *a2, ...)
{
  return [a1 window];
}
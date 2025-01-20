void sub_1000046BC( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  id *v20;
  id *v21;
  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1000046F4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _showPasscodeEntry];
}

void sub_100004720(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _dismissViewServiceWithCancellationReason:2];
}

void sub_100004838(_Unwind_Exception *a1)
{
}

void sub_100004854(uint64_t a1, void *a2, uint64_t a3)
{
  id v8 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (a3 == 1)
    {
      [v8 shake];
    }

    else if (!a3)
    {
      id v6 = objc_alloc_init(&OBJC_CLASS___CPSRestrictedAccessResponse);
      v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  v6,  1LL,  0LL));

      [WeakRetained _dismissViewServiceWithResult:v7];
    }
  }
}

LABEL_15:
  return v14;
}

  return v14;
}

  return v14;
}

  return v14;
}

void sub_100005110(id a1)
{
  os_log_t v1 = os_log_create("com.apple.CompanionServices", "CSVSRestrictedAccessViewController");
  uint64_t v2 = (void *)qword_10002CB00;
  qword_10002CB00 = (uint64_t)v1;
}

void sub_1000052F4(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v6 = v5;
  if (a3 == 2)
  {
    [v5 _popAlphaValueForViews];
  }

  else if (a3 == 1)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) viewController]);
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 view]);

    if (v8)
    {
      v10 = v8;
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v10, 1LL));
      [v6 _pushAlphaValue:v9 forViews:0.0];
    }
  }
}

void sub_10000549C(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) viewController]);
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 view]);

  if (a3)
  {
    if (a3 == 2)
    {
      [v5 _popAlphaValueForViews];
      [v5 _popAlphaValueForViews];
      goto LABEL_10;
    }

    if (a3 == 1 && v7)
    {
      v11 = v7;
      id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v11, 1LL));
      double v9 = 1.0;
LABEL_8:
      [v5 _pushAlphaValue:v8 forViews:v9];
    }
  }

  else if (v7)
  {
    v10 = v7;
    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v10, 1LL));
    double v9 = 0.0;
    goto LABEL_8;
  }

LABEL_10:
}
}

LABEL_24:
  v65 = (void *)objc_claimAutoreleasedReturnValue([v88 arrayByAddingObjectsFromArray:v96]);
  +[NSLayoutConstraint activateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "activateConstraints:", v65);
}

void sub_100006508(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 setTranslatesAutoresizingMaskIntoConstraints:0];
  [*(id *)(a1 + 32) addSubview:v3];
}

void sub_10000661C(uint64_t a1)
{
  id v1 = (id)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(a1 + 32) + 32) layer]);
  [v1 setBeginTime:CACurrentMediaTime()];
}
}

id sub_1000072BC(uint64_t a1)
{
  switch(a1)
  {
    case 0LL:
    case 1LL:
      id v1 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
      uint64_t v2 = v1;
      id v3 = @"SIGN_IN_WITH_APPLE_DEVICE";
      break;
    case 4LL:
      id v1 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
      uint64_t v2 = v1;
      id v3 = @"SHARE_WITH_APPLE_DEVCE";
      break;
    case 5LL:
      id v1 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
      uint64_t v2 = v1;
      id v3 = @"APPROVE_WITH_APPLE_DEVICE";
      break;
    case 6LL:
      id v1 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
      uint64_t v2 = v1;
      id v3 = @"LEARN_MORE_WITH_APPLE_DEVICE";
      break;
    default:
      id v1 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
      uint64_t v2 = v1;
      id v3 = @"CONFIRM_WITH_APPLE_DEVICE";
      break;
  }

  v4 = (void *)objc_claimAutoreleasedReturnValue([v1 localizedStringForKey:v3 value:&stru_100024BC0 table:0]);

  return v4;
}

__CFString *sub_1000073B0(unint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](&OBJC_CLASS___UIApplication, "sharedApplication"));
  id v3 = [v2 userInterfaceLayoutDirection];

  if (a1 <= 5 && ((1LL << a1) & 0x2E) != 0)
  {
    v4 = @"device-animation-family-watch";
    id v5 = @"device-animation-family-rtl-watch";
  }

  else
  {
    v4 = @"device-animation-family";
    id v5 = @"device-animation-family-rtl";
  }

  if (v3 == (id)1) {
    id v6 = (__CFString *)v5;
  }
  else {
    id v6 = (__CFString *)v4;
  }
  return v6;
}

id sub_10000743C(void *a1, unint64_t a2)
{
  id v3 = a1;
  v4 = v3;
  if (a2 <= 5 && ((1LL << a2) & 0x2E) != 0) {
    id v5 = (id)objc_claimAutoreleasedReturnValue([v3 stringByAppendingString:@"_WATCH"]);
  }
  else {
    id v5 = v3;
  }
  id v6 = v5;

  return v6;
}

void sub_100007834( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
}

void sub_100007850(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    objc_msgSend( WeakRetained,  "__transitionToSceneWithIdentifier:animated:",  *(void *)(a1 + 32),  *(unsigned __int8 *)(a1 + 48));
    id WeakRetained = v3;
  }
}

void sub_100007B2C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
}

uint64_t sub_100007B48(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = *(void **)(a1 + 32);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 appearingScene]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 identifier]);
  LODWORD(v4) = [v4 isEqualToString:v6];

  v7 = *(void **)(a1 + 40);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v3 disappearingScene]);
  double v9 = (void *)objc_claimAutoreleasedReturnValue([v8 identifier]);
  unsigned int v10 = [v7 isEqualToString:v9];

  if ((_DWORD)v4)
  {
    if ((v10 & 1) != 0) {
      goto LABEL_8;
    }
    v11 = (void *)objc_claimAutoreleasedReturnValue([v3 disappearingScene]);
LABEL_6:
    v12 = v11;

    if (v12) {
      goto LABEL_7;
    }
LABEL_8:
    uint64_t v13 = 1LL;
    goto LABEL_9;
  }

  if (v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue([v3 appearingScene]);
    goto LABEL_6;
  }

LABEL_7:
  uint64_t v13 = 0LL;
LABEL_9:

  return v13;
}

void sub_100007C30(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained _removeSceneChildViewControllerForScene:*(void *)(a1 + 32)];
    __int128 v14 = 0u;
    __int128 v15 = 0u;
    __int128 v12 = 0u;
    __int128 v13 = 0u;
    id v4 = *(id *)(a1 + 40);
    id v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = *(void *)v13;
      do
      {
        for (i = 0LL; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v13 != v7) {
            objc_enumerationMutation(v4);
          }
          double v9 = *(void **)(*((void *)&v12 + 1) + 8LL * (void)i);
          unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "appearingScene", (void)v12));
          v11 = (void *)objc_claimAutoreleasedReturnValue([v9 disappearingScene]);
          if (v10) {
            [v3 _notifyScene:v10 ofTransitionToPhase:2 transition:v9 isAppearing:1];
          }
          if (v11) {
            [v3 _notifyScene:v11 ofTransitionToPhase:2 transition:v9 isAppearing:0];
          }
        }

        id v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }

      while (v6);
    }

    [v3 _decrementAnimationRefCount];
    [v3 _handleNextPendingTransition];
  }
}

void sub_1000081D0(_Unwind_Exception *a1)
{
}

id *sub_100008204(id *result)
{
  uint64_t v1 = result;
  id v2 = result[4];
  if (v2) {
    result = (id *)[result[5] _notifyScene:v2 ofTransitionToPhase:1 transition:result[6] isAppearing:1];
  }
  uint64_t v3 = (uint64_t)v1[7];
  if (v3) {
    return (id *)[v1[5] _notifyScene:v3 ofTransitionToPhase:1 transition:v1[6] isAppearing:0];
  }
  return result;
}

void sub_100008258(uint64_t a1)
{
}

uint64_t sub_100008260(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_10000826C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained _performTransitions:*(void *)(a1 + 32) animated:*(unsigned __int8 *)(a1 + 56) reversed:*(unsigned __int8 *)(a1 + 57) completion:*(void *)(a1 + 40)];
    id WeakRetained = v3;
  }
}

void sub_1000087AC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

uint64_t sub_1000087C4(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_1000087D4(uint64_t a1)
{
}

void sub_1000087DC(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t v5 = a1;
  id v6 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL);
  id v7 = a2;
  [v6 addObject:v7];
  LOBYTE(v6) = *(_BYTE *)(v5 + 40) != 0;
  LOBYTE(v5) = [v7 isAtomic];

  *a4 = v5 ^ v6;
}

void sub_100009854( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
}

void sub_100009F34( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
}

void sub_100009F5C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _dismissViewServiceWithCancellationReason:3];
}

void sub_100009F8C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _dismissViewServiceWithCancellationReason:2];
}

void sub_10000AD18(_Unwind_Exception *a1)
{
}

void sub_10000AD60(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10000AE04;
  v5[3] = &unk_1000247D8;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  id v6 = v3;
  id v4 = v3;
  dispatch_async(&_dispatch_main_q, v5);

  objc_destroyWeak(&v7);
}

void sub_10000AE04(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v5 = WeakRetained;
    id v3 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained authenticationViewController]);
    id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 deviceViewController]);
    [v4 performTappedNotificationTransitionWithDevice:*(void *)(a1 + 32)];

    id WeakRetained = v5;
  }
}

void sub_10000AE6C(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10000AF10;
  v5[3] = &unk_1000247D8;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  id v6 = v3;
  id v4 = v3;
  dispatch_async(&_dispatch_main_q, v5);

  objc_destroyWeak(&v7);
}

void sub_10000AF10(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v5 = WeakRetained;
    id v3 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained authenticationViewController]);
    id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 deviceViewController]);
    [v4 performStartedAuthenticationWithDevice:*(void *)(a1 + 32)];

    id WeakRetained = v5;
  }
}

void sub_10000AF78(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10000B01C;
  v5[3] = &unk_1000247D8;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  id v6 = v3;
  id v4 = v3;
  dispatch_async(&_dispatch_main_q, v5);

  objc_destroyWeak(&v7);
}

void sub_10000B01C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained authenticationViewController]);
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 deviceViewController]);
    [v5 performSessionCompletedTransitionWithError:*(void *)(a1 + 32)];

    dispatch_time_t v6 = dispatch_time(0LL, 2250000000LL);
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_10000B0F4;
    v7[3] = &unk_100024828;
    v7[4] = v3;
    id v8 = *(id *)(a1 + 32);
    dispatch_after(v6, &_dispatch_main_q, v7);
  }
}

id sub_10000B0F4(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 16);
  *(void *)(v2 + 16) = 0LL;

  return [*(id *)(a1 + 32) _dismissViewServiceWithResult:*(void *)(a1 + 40)];
}

void sub_10000B3E0(_Unwind_Exception *a1)
{
}

void sub_10000B430(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v3 = WeakRetained;
    uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained[3] deviceViewController]);
    [v2 performQRCodeTransition];

    id WeakRetained = v3;
  }
}

void sub_10000B484(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained _buttonHandler]);
  [v1 primaryButtonPressed];
}

void sub_10000B4C8(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained _buttonHandler]);
  [v1 secondaryButtonPressed];
}

void sub_10000B50C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _dismissWithCancellationReason:2];
}

id sub_10000BE30()
{
  if (qword_10002CB18 != -1) {
    dispatch_once(&qword_10002CB18, &stru_1000248B0);
  }
  return (id)qword_10002CB10;
}

void sub_10000C060(id a1, NSError *a2)
{
  uint64_t v2 = a2;
  id v3 = sub_10000BE30();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    sub_100017654((uint64_t)v2, v4, v5, v6, v7, v8, v9, v10);
  }
}

void sub_10000C26C(id a1)
{
  os_log_t v1 = os_log_create("com.apple.CompanionServices", "TVProviderViewController");
  uint64_t v2 = (void *)qword_10002CB10;
  qword_10002CB10 = (uint64_t)v1;
}

void sub_10000C29C( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

id sub_10000CB04(uint64_t a1, void *a2)
{
  id v3 = a2;
  else {
    id v4 = 0LL;
  }

  return v4;
}

void sub_10000CC48(_Unwind_Exception *a1)
{
}

void sub_10000CC6C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _dismissWithCustomAuthenticationMethod:*(void *)(a1 + 32)];
}

void sub_10000CD94( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
}

void sub_10000CDB8(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _cancelButtonPressed];
}

uint64_t sub_10000D4FC(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t start(int a1, char **a2)
{
  id v4 = objc_autoreleasePoolPush();
  uint64_t v5 = (objc_class *)objc_opt_class(&OBJC_CLASS___CSVSAppDelegate);
  uint64_t v6 = NSStringFromClass(v5);
  uint64_t v7 = (NSString *)objc_claimAutoreleasedReturnValue(v6);
  objc_autoreleasePoolPop(v4);
  uint64_t v8 = UIApplicationMain(a1, a2, 0LL, v7);

  return v8;
}

void sub_10000DAF8( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
}

void sub_10000DB30(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _dismissViewServiceWithCancellationReason:3];
}

void sub_10000DB60(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _dismissViewServiceWithCancellationReason:2];
}

void sub_10000E1F8(id a1)
{
  os_log_t v1 = os_log_create("com.apple.CompanionServices", "CSVSStoreAuthenticationViewController");
  uint64_t v2 = (void *)qword_10002CB20;
  qword_10002CB20 = (uint64_t)v1;
}

void sub_10000E774(_Unwind_Exception *a1)
{
}

void sub_10000E7CC(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10000E870;
  v5[3] = &unk_1000247D8;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  id v6 = v3;
  id v4 = v3;
  dispatch_async(&_dispatch_main_q, v5);

  objc_destroyWeak(&v7);
}

void sub_10000E870(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v5 = WeakRetained;
    id v3 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained authenticationViewController]);
    id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 deviceViewController]);
    [v4 performTappedNotificationTransitionWithDevice:*(void *)(a1 + 32)];

    id WeakRetained = v5;
  }
}

void sub_10000E8D8(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10000E97C;
  v5[3] = &unk_1000247D8;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  id v6 = v3;
  id v4 = v3;
  dispatch_async(&_dispatch_main_q, v5);

  objc_destroyWeak(&v7);
}

void sub_10000E97C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v5 = WeakRetained;
    id v3 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained authenticationViewController]);
    id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 deviceViewController]);
    [v4 performStartedAuthenticationWithDevice:*(void *)(a1 + 32)];

    id WeakRetained = v5;
  }
}

void sub_10000E9E4(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10000EA88;
  v5[3] = &unk_1000247D8;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  id v6 = v3;
  id v4 = v3;
  dispatch_async(&_dispatch_main_q, v5);

  objc_destroyWeak(&v7);
}

void sub_10000EA88(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    +[CPSMetrics sendStorePurchaseSessionCompletedEvent:]( &OBJC_CLASS___CPSMetrics,  "sendStorePurchaseSessionCompletedEvent:",  1LL);
    AudioServicesPlaySystemSound(0x572u);
    id v3 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained authenticationViewController]);
    id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 deviceViewController]);
    [v4 performSessionCompletedTransitionWithError:0];

    dispatch_time_t v5 = dispatch_time(0LL, 2250000000LL);
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472LL;
    v6[2] = sub_10000EB78;
    v6[3] = &unk_100024828;
    v6[4] = WeakRetained;
    id v7 = *(id *)(a1 + 32);
    dispatch_after(v5, &_dispatch_main_q, v6);
  }
}

void sub_10000EB78(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 16);
  *(void *)(v2 + 16) = 0LL;

  id v4 = *(void **)(a1 + 32);
  id v5 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) purchaseResult]);
  [v4 _dismissWithPurchaseResult:v5];
}

void sub_10000EBD4(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10000EC78;
  v5[3] = &unk_1000247D8;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  id v6 = v3;
  id v4 = v3;
  dispatch_async(&_dispatch_main_q, v5);

  objc_destroyWeak(&v7);
}

void sub_10000EC78(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    uint64_t v3 = AMSErrorDomain;
    if ((AMSErrorIsEqual(*(void *)(a1 + 32), AMSErrorDomain, 6LL) & 1) != 0
      || AMSErrorIsEqual(*(void *)(a1 + 32), v3, 508LL))
    {
      +[CPSMetrics sendStorePurchaseSessionCompletedEvent:]( &OBJC_CLASS___CPSMetrics,  "sendStorePurchaseSessionCompletedEvent:",  2LL);
      id v4 = (void *)WeakRetained[2];
      WeakRetained[2] = 0LL;

      [WeakRetained _dismissViewServiceWithResult:*(void *)(a1 + 32)];
    }

    else
    {
      +[CPSMetrics sendStorePurchaseSessionCompletedEvent:]( &OBJC_CLASS___CPSMetrics,  "sendStorePurchaseSessionCompletedEvent:",  3LL);
      AudioServicesPlaySystemSound(0x573u);
      id v5 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained authenticationViewController]);
      id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 deviceViewController]);
      [v6 performSessionCompletedTransitionWithError:*(void *)(a1 + 32)];

      dispatch_time_t v7 = dispatch_time(0LL, 2250000000LL);
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472LL;
      v8[2] = sub_10000EDD0;
      v8[3] = &unk_100024828;
      v8[4] = WeakRetained;
      id v9 = *(id *)(a1 + 32);
      dispatch_after(v7, &_dispatch_main_q, v8);
    }
  }
}

id sub_10000EDD0(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 16);
  *(void *)(v2 + 16) = 0LL;

  return [*(id *)(a1 + 32) _dismissViewServiceWithResult:*(void *)(a1 + 40)];
}

void sub_10000F03C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
}

void sub_10000F078(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _dismissWithCancellationReason:3];
}

void sub_10000F0C4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _dismissWithCancellationReason:2];
}

LABEL_20:
          v16 = 0LL;
          goto LABEL_21;
        }

        if (!a4) {
          goto LABEL_20;
        }
        v20 = @"Missing local payment request";
        v21 = 202LL;
      }

      else
      {
        if (!a4) {
          goto LABEL_20;
        }
        v20 = @"Missing delegate purchase request";
        v21 = 201LL;
      }

LABEL_18:
      v22 = CPSErrorMake(v21, v20);
      v19 = (void *)objc_claimAutoreleasedReturnValue(v22);
      goto LABEL_19;
    }

    if (a4)
    {
      v18 = CPSErrorUnderlyingMake(203LL, v12, @"Failed to unarchive presentation context");
      v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
LABEL_19:
      v16 = 0LL;
      *a4 = v19;
      goto LABEL_21;
    }

    goto LABEL_20;
  }

  if (a4)
  {
    v17 = CPSErrorMake(203LL, @"Missing presentation context data");
    v16 = 0LL;
    *a4 = (id)objc_claimAutoreleasedReturnValue(v17);
  }

  else
  {
    v16 = 0LL;
  }

LABEL_22:
  return v16;
}

id sub_10000F464()
{
  if (qword_10002CB38 != -1) {
    dispatch_once(&qword_10002CB38, &stru_1000249B8);
  }
  return (id)qword_10002CB30;
}

void sub_10000F6E4(id a1)
{
  os_log_t v1 = os_log_create("com.apple.CompanionServices", "PaymentSheetViewService");
  uint64_t v2 = (void *)qword_10002CB30;
  qword_10002CB30 = (uint64_t)v1;
}

void sub_10000FA1C(void *a1, void *a2, void *a3)
{
  if (a1)
  {
    id v5 = a3;
    id v6 = a2;
    id v7 = [(id)objc_opt_class(a1) deviceFromViewServiceMessage:v6];
    id v8 = (id)objc_claimAutoreleasedReturnValue(v7);

    [a1 _handleDeviceTappedNotificationMessage:v8];
    (*((void (**)(id, void, void))v5 + 2))(v5, 0LL, 0LL);
  }

void sub_10000FAA8(void *a1, void *a2, void *a3)
{
  if (a1)
  {
    id v5 = a3;
    id v6 = a2;
    id v7 = [(id)objc_opt_class(a1) deviceFromViewServiceMessage:v6];
    id v8 = (id)objc_claimAutoreleasedReturnValue(v7);

    [a1 _handleDeviceStartedAuthenticationMessage:v8];
    (*((void (**)(id, void, void))v5 + 2))(v5, 0LL, 0LL);
  }

void sub_10000FB34(void *a1, uint64_t a2, void *a3)
{
  if (a1)
  {
    id v4 = a3;
    [a1 _handleSessionFinishedMessage];
    (*((void (**)(id, void, void))v4 + 2))(v4, 0LL, 0LL);
  }

void sub_10000FB88(void *a1, void *a2, void *a3)
{
  if (a1)
  {
    id v5 = a3;
    id v6 = a2;
    uint64_t v7 = objc_opt_self(&OBJC_CLASS___NSError);
    id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    id v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "bs_safeObjectForKey:ofType:", @"error", v8));

    if (v9)
    {
      id v10 = v9;
    }

    else
    {
      uint64_t v11 = CPSErrorDomain;
      NSErrorUserInfoKey v13 = NSDebugDescriptionErrorKey;
      __int128 v14 = @"The session failed but no error was provided.";
      __int128 v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v14,  &v13,  1LL));
      id v10 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v11,  100LL,  v12));
    }

    [a1 _handleSessionFailedMessage:v10];
    (*((void (**)(id, void, void))v5 + 2))(v5, 0LL, 0LL);
  }

void sub_100011490(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 setTranslatesAutoresizingMaskIntoConstraints:0];
  id v4 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) view]);
  [v4 addSubview:v3];
}

LABEL_23:
    v24 = v22;
    goto LABEL_24;
  }

  __int128 v15 = (void *)objc_claimAutoreleasedReturnValue([v9 device]);
  v16 = (void *)objc_claimAutoreleasedReturnValue([v15 model]);
  v17 = GestaltProductTypeStringToDeviceClass();
  v18 = @"iPhone";
  if (v17 == 2) {
    v18 = @"iPod touch";
  }
  if (v17 == 3) {
    v18 = @"iPad";
  }
  v19 = v18;

  v20 = [v9 authenticationKind];
  uint64_t v11 = (id)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  if (v20 == (id)5)
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@_%@",  @"APPROVE_ON",  v19));

    NSErrorUserInfoKey v13 = (void *)objc_claimAutoreleasedReturnValue([v21 uppercaseString]);
    v22 = (id)objc_claimAutoreleasedReturnValue([v11 localizedStringForKey:v13 value:&stru_100024BC0 table:0]);
    goto LABEL_23;
  }

  v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@_%@",  @"CONFIRM_ON",  v19));

  v26 = (void *)objc_claimAutoreleasedReturnValue([v25 uppercaseString]);
  v27 = (void *)objc_claimAutoreleasedReturnValue([v11 localizedStringForKey:v26 value:&stru_100024BC0 table:0]);

  if ([v9 authType] == (id)12
    && (v28 = (void *)objc_claimAutoreleasedReturnValue([v9 qrCodeSubtitle]), v28, v28))
  {
    v29 = sub_100013584(v27, v9);
    v24 = (void *)objc_claimAutoreleasedReturnValue(v29);
    uint64_t v11 = v27;
  }

  else
  {
    uint64_t v11 = v27;
    v24 = v11;
  }

  -[UILabel setText:](v8, "setText:", v25);
  captionLabel = self->_captionLabel;
  self->_captionLabel = v8;
  v36 = v8;

  v59[0] = self->_micaPlayerView;
  v59[1] = v36;
  v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v59, 2LL));
  v57[0] = _NSConcreteStackBlock;
  v57[1] = 3221225472LL;
  v57[2] = sub_100012228;
  v57[3] = &unk_100024650;
  v57[4] = self;
  [v37 enumerateObjectsUsingBlock:v57];

  v38 = (void *)objc_claimAutoreleasedReturnValue(-[CSVSAuthenticationProgressViewController view](self, "view"));
  v56 = (void *)objc_claimAutoreleasedReturnValue(-[CSVSMicaPlayerView topAnchor](self->_micaPlayerView, "topAnchor"));
  v55 = (void *)objc_claimAutoreleasedReturnValue([v38 topAnchor]);
  v54 = (void *)objc_claimAutoreleasedReturnValue([v56 constraintEqualToAnchor:v55 constant:170.0]);
  v58[0] = v54;
  v53 = (void *)objc_claimAutoreleasedReturnValue(-[CSVSMicaPlayerView centerXAnchor](self->_micaPlayerView, "centerXAnchor"));
  v52 = (void *)objc_claimAutoreleasedReturnValue([v38 centerXAnchor]);
  v51 = (void *)objc_claimAutoreleasedReturnValue([v53 constraintEqualToAnchor:v52]);
  v58[1] = v51;
  v48 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel firstBaselineAnchor](v36, "firstBaselineAnchor"));
  v39 = (void *)objc_claimAutoreleasedReturnValue(-[CSVSMicaPlayerView bottomAnchor](self->_micaPlayerView, "bottomAnchor"));
  v40 = (void *)objc_claimAutoreleasedReturnValue([v48 constraintEqualToAnchor:v39 constant:50.0]);
  v58[2] = v40;
  v49 = v36;
  v41 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](v36, "leadingAnchor"));
  v42 = (void *)objc_claimAutoreleasedReturnValue([v38 leadingAnchor]);
  v43 = (void *)objc_claimAutoreleasedReturnValue([v41 constraintEqualToAnchor:v42 constant:40.0]);
  v58[3] = v43;
  v50 = v9;
  v44 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](v36, "trailingAnchor"));
  v45 = (void *)objc_claimAutoreleasedReturnValue([v38 trailingAnchor]);
  v46 = (void *)objc_claimAutoreleasedReturnValue([v44 constraintEqualToAnchor:v45 constant:-40.0]);
  v58[4] = v46;
  v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v58, 5LL));
  +[NSLayoutConstraint activateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "activateConstraints:", v47);
}

LABEL_25:
  -[UILabel setText:](v8, "setText:", v24);
  captionLabel = self->_captionLabel;
  self->_captionLabel = v8;
  v35 = v8;

  v58[0] = self->_micaPlayerView;
  v58[1] = v35;
  v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v58, 2LL));
  v56[0] = _NSConcreteStackBlock;
  v56[1] = 3221225472LL;
  v56[2] = sub_100011B68;
  v56[3] = &unk_100024650;
  v56[4] = self;
  [v36 enumerateObjectsUsingBlock:v56];

  v37 = (void *)objc_claimAutoreleasedReturnValue(-[CSVSAuthenticationProgressViewController view](self, "view"));
  v55 = (void *)objc_claimAutoreleasedReturnValue(-[CSVSMicaPlayerView topAnchor](self->_micaPlayerView, "topAnchor"));
  v54 = (void *)objc_claimAutoreleasedReturnValue([v37 topAnchor]);
  v53 = (void *)objc_claimAutoreleasedReturnValue([v55 constraintEqualToAnchor:v54 constant:170.0]);
  v57[0] = v53;
  v52 = (void *)objc_claimAutoreleasedReturnValue(-[CSVSMicaPlayerView centerXAnchor](self->_micaPlayerView, "centerXAnchor"));
  v51 = (void *)objc_claimAutoreleasedReturnValue([v37 centerXAnchor]);
  v50 = (void *)objc_claimAutoreleasedReturnValue([v52 constraintEqualToAnchor:v51]);
  v57[1] = v50;
  v47 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel firstBaselineAnchor](v35, "firstBaselineAnchor"));
  v38 = (void *)objc_claimAutoreleasedReturnValue(-[CSVSMicaPlayerView bottomAnchor](self->_micaPlayerView, "bottomAnchor"));
  v39 = (void *)objc_claimAutoreleasedReturnValue([v47 constraintEqualToAnchor:v38 constant:50.0]);
  v57[2] = v39;
  v48 = v35;
  v40 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](v35, "leadingAnchor"));
  v41 = (void *)objc_claimAutoreleasedReturnValue([v37 leadingAnchor]);
  v49 = v9;
  v42 = (void *)objc_claimAutoreleasedReturnValue([v40 constraintEqualToAnchor:v41 constant:40.0]);
  v57[3] = v42;
  v43 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](v35, "trailingAnchor"));
  v44 = (void *)objc_claimAutoreleasedReturnValue([v37 trailingAnchor]);
  v45 = (void *)objc_claimAutoreleasedReturnValue([v43 constraintEqualToAnchor:v44 constant:-40.0]);
  v57[4] = v45;
  v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v57, 5LL));
  +[NSLayoutConstraint activateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "activateConstraints:", v46);
}

void sub_100011B68(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 setTranslatesAutoresizingMaskIntoConstraints:0];
  id v4 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) view]);
  [v4 addSubview:v3];
}

void sub_100012228(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 setTranslatesAutoresizingMaskIntoConstraints:0];
  id v4 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) view]);
  [v4 addSubview:v3];
}

void sub_100012718(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 setTranslatesAutoresizingMaskIntoConstraints:0];
  id v4 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) view]);
  [v4 addSubview:v3];
}

void sub_100012F4C(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 setTranslatesAutoresizingMaskIntoConstraints:0];
  id v4 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) view]);
  [v4 addSubview:v3];
}

id sub_100013584(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = a1;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue( [v5 localizedStringForKey:@"ENTER_TV_PROVIDER_CODE" value:&stru_100024BC0 table:0]);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v3 providerCode]);

  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](&OBJC_CLASS___NSString, "localizedStringWithFormat:", v6, v7));
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@\n%@", v4, v8));

  return v9;
}

id sub_100013D04(uint64_t a1, void *a2)
{
  id v3 = a2;
  else {
    id v4 = 0LL;
  }

  return v4;
}

void sub_100013E48(_Unwind_Exception *a1)
{
}

void sub_100013E6C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _dismissWithCustomSharingMethod:*(void *)(a1 + 32)];
}

void sub_100013F94( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
}

void sub_100013FB8(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _cancelButtonPressed];
}

uint64_t sub_100014668(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void sub_100015644( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, id *location, uint64_t a11, id *a12, id *a13, uint64_t a14, id *a15, id *a16, id *a17, id *a18, id *a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, uint64_t a48, uint64_t a49, uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
}

void sub_100015764(uint64_t a1, void *a2)
{
  id v9 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = WeakRetained;
  if (WeakRetained)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained authenticationInfo]);
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v9 viewController]);
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v4 orderedCustomAuthenticationActions]);
    [v6 setOrderedCustomAuthenticationActions:v7];

    id v8 = (void *)objc_claimAutoreleasedReturnValue([v4 _learnMoreAction]);
    [v6 setAuthenticateWithCompanionAction:v8];

    [v6 setAuthenticationInfo:v5];
  }
}

void sub_100015824(uint64_t a1, void *a2)
{
  id v7 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = WeakRetained;
  if (WeakRetained)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained authenticationInfo]);
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v7 viewController]);
    [v6 setState:1];
    [v6 setAuthenticationInfo:v5];
  }
}

void sub_1000158AC(uint64_t a1, void *a2)
{
  id v7 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = WeakRetained;
  if (WeakRetained)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained authenticationInfo]);
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v7 viewController]);
    [v6 setState:2];
    [v6 setAuthenticationInfo:v5];
  }
}

void sub_100015934(uint64_t a1, void *a2)
{
  id v7 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = WeakRetained;
  if (WeakRetained)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained authenticationInfo]);
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v7 viewController]);
    [v6 setState:3];
    [v6 setAuthenticationInfo:v5];
  }
}

void sub_1000159BC(uint64_t a1, void *a2)
{
  id v7 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = WeakRetained;
  if (WeakRetained)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained authenticationInfo]);
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v7 viewController]);
    [v6 setState:4];
    [v6 setAuthenticationInfo:v5];
  }
}

void sub_100015A44(uint64_t a1, void *a2)
{
  id v7 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = WeakRetained;
  if (WeakRetained)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained authenticationInfo]);
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v7 viewController]);
    [v6 setState:5];
    [v6 setAuthenticationInfo:v5];
  }
}

void sub_100015ACC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = WeakRetained;
  if (a3 == 1)
  {
    if (WeakRetained)
    {
      id v9 = WeakRetained;
      unsigned int v6 = [WeakRetained cardIsPresented];
      id v5 = v9;
      if (v6)
      {
        [v9 setCardIsPresented:0];
        id v7 = (void *)objc_claimAutoreleasedReturnValue([v9 view]);
        [v7 setNeedsLayout];

        id v8 = (void *)objc_claimAutoreleasedReturnValue([v9 view]);
        [v8 layoutIfNeeded];

        id v5 = v9;
      }
    }
  }
}

void sub_100015B5C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = WeakRetained;
  if (a3 == 1)
  {
    if (WeakRetained)
    {
      id v9 = WeakRetained;
      unsigned __int8 v6 = [WeakRetained cardIsPresented];
      id v5 = v9;
      if ((v6 & 1) == 0)
      {
        [v9 setCardIsPresented:1];
        id v7 = (void *)objc_claimAutoreleasedReturnValue([v9 view]);
        [v7 setNeedsLayout];

        id v8 = (void *)objc_claimAutoreleasedReturnValue([v9 view]);
        [v8 layoutIfNeeded];

        id v5 = v9;
      }
    }
  }
}

void sub_100015BEC(id a1, CSVSUIScene *a2, int64_t a3, BOOL a4)
{
  id v5 = a2;
  unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue(-[CSVSUIScene viewController](v5, "viewController"));
  uint64_t v7 = objc_claimAutoreleasedReturnValue([v6 captionLabel]);
  id v8 = (void *)v7;
  if (a3 == 2)
  {
    -[CSVSUIScene _popAlphaValueForViews](v5, "_popAlphaValueForViews");
  }

  else if (a3 == 1 && v7)
  {
    uint64_t v10 = v7;
    id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v10, 1LL));
    -[CSVSUIScene _pushAlphaValue:forViews:](v5, "_pushAlphaValue:forViews:", v9, 0.0);
  }
}

void sub_100015CC4(id a1, CSVSUIScene *a2, int64_t a3, BOOL a4)
{
  id v5 = a2;
  unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue(-[CSVSUIScene viewController](v5, "viewController"));
  uint64_t v7 = objc_claimAutoreleasedReturnValue([v6 captionLabel]);
  id v8 = (void *)v7;
  if (a3 || !v7)
  {
    if (a3 == 1) {
      -[CSVSUIScene _popAlphaValueForViews](v5, "_popAlphaValueForViews");
    }
  }

  else
  {
    uint64_t v10 = v7;
    id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v10, 1LL));
    -[CSVSUIScene _pushAlphaValue:forViews:](v5, "_pushAlphaValue:forViews:", v9, 0.0);
  }
}

void sub_100015D98(id a1, CSVSUIScene *a2, int64_t a3, BOOL a4)
{
  id v5 = a2;
  unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue(-[CSVSUIScene viewController](v5, "viewController"));
  uint64_t v7 = objc_claimAutoreleasedReturnValue([v6 captionLabel]);
  id v8 = (void *)v7;
  if (a3 == 2)
  {
    -[CSVSUIScene _popAlphaValueForViews](v5, "_popAlphaValueForViews");
  }

  else if (a3 == 1)
  {
    uint64_t v10 = v7;
    id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v10, 1LL));
    -[CSVSUIScene _pushAlphaValue:forViews:](v5, "_pushAlphaValue:forViews:", v9, 0.0);
  }
}

UIViewPropertyAnimator *__cdecl sub_100015E6C(id a1, CSVSUISceneTransition *a2)
{
  uint64_t v2 = a2;
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[CSVSUISceneTransition identifier](v2, "identifier"));
  if ([v3 isEqualToString:@"menu-appear"])
  {
  }

  else
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[CSVSUISceneTransition identifier](v2, "identifier"));
    unsigned int v5 = [v4 isEqualToString:@"menu-disappear"];

    if (!v5)
    {
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[CSVSUISceneTransition identifier](v2, "identifier"));
      if ([v11 isEqualToString:@"card-appear"])
      {
      }

      else
      {
        __int128 v12 = (void *)objc_claimAutoreleasedReturnValue(-[CSVSUISceneTransition identifier](v2, "identifier"));
        unsigned int v13 = [v12 isEqualToString:@"card-disappear"];

        if (!v13)
        {
          v22 = (void *)objc_claimAutoreleasedReturnValue(-[CSVSUISceneTransition identifier](v2, "identifier"));
          unsigned int v23 = [v22 isEqualToString:@"confirm-appear"];

          if (!v23)
          {
            v24 = (void *)objc_claimAutoreleasedReturnValue(-[CSVSUISceneTransition identifier](v2, "identifier"));
            unsigned int v25 = [v24 isEqualToString:@"confirm-disappear"];

            if (!v25)
            {
              v26 = (void *)objc_claimAutoreleasedReturnValue(-[CSVSUISceneTransition identifier](v2, "identifier"));
              unsigned int v27 = [v26 isEqualToString:@"confirming-appear"];

              if (!v27)
              {
                v28 = (void *)objc_claimAutoreleasedReturnValue(-[CSVSUISceneTransition identifier](v2, "identifier"));
                unsigned int v29 = [v28 isEqualToString:@"confirming-disappear"];

                if (!v29)
                {
                  id v9 = 0LL;
                  goto LABEL_7;
                }
              }
            }
          }

          unsigned __int8 v6 = -[UICubicTimingParameters initWithControlPoint1:controlPoint2:]( objc_alloc(&OBJC_CLASS___UICubicTimingParameters),  "initWithControlPoint1:controlPoint2:",  0.25,  0.0,  0.75,  1.0);
          uint64_t v7 = objc_alloc(&OBJC_CLASS___UIViewPropertyAnimator);
          double v8 = 0.25;
          goto LABEL_5;
        }
      }

      unsigned __int8 v6 = objc_alloc_init(&OBJC_CLASS___CASpringAnimation);
      -[UICubicTimingParameters setMass:](v6, "setMass:", 2.0);
      -[UICubicTimingParameters setStiffness:](v6, "setStiffness:", 300.0);
      -[UICubicTimingParameters setDamping:](v6, "setDamping:", 50.0);
      -[UICubicTimingParameters setInitialVelocity:](v6, "setInitialVelocity:", 0.0);
      __int128 v14 = objc_alloc(&OBJC_CLASS___UISpringTimingParameters);
      -[UICubicTimingParameters mass](v6, "mass");
      double v16 = v15;
      -[UICubicTimingParameters stiffness](v6, "stiffness");
      double v18 = v17;
      -[UICubicTimingParameters damping](v6, "damping");
      v20 = -[UISpringTimingParameters initWithMass:stiffness:damping:initialVelocity:]( v14,  "initWithMass:stiffness:damping:initialVelocity:",  v16,  v18,  v19,  0.0,  0.0);
      v21 = objc_alloc(&OBJC_CLASS___UIViewPropertyAnimator);
      -[UICubicTimingParameters settlingDuration](v6, "settlingDuration");
      id v9 = -[UIViewPropertyAnimator initWithDuration:timingParameters:](v21, "initWithDuration:timingParameters:", v20);

      goto LABEL_6;
    }
  }

  unsigned __int8 v6 = -[UICubicTimingParameters initWithControlPoint1:controlPoint2:]( objc_alloc(&OBJC_CLASS___UICubicTimingParameters),  "initWithControlPoint1:controlPoint2:",  0.25,  0.0,  0.75,  1.0);
  uint64_t v7 = objc_alloc(&OBJC_CLASS___UIViewPropertyAnimator);
  double v8 = 0.15;
LABEL_5:
  id v9 = -[UIViewPropertyAnimator initWithDuration:timingParameters:](v7, "initWithDuration:timingParameters:", v6, v8);
LABEL_6:

LABEL_7:
  return v9;
}

void sub_100016724( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
}

void sub_100016748(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained transitionToState:1 animated:1];
}

void sub_100016A38( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

uint64_t sub_100016A58()
{
  return objc_opt_class(v0);
}

  ;
}

  ;
}

  ;
}

void sub_100016D90( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
}

void sub_100016DC8(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained[2] deviceViewController]);
    [v2 performQRCodeTransition];

    id WeakRetained = v3;
  }
}

void sub_100016E1C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _dismissViewServiceWithCancellationReason:2];
}

void sub_100017548(id a1)
{
  os_log_t v1 = os_log_create("com.apple.CompanionServices", "CSVSLearnMoreViewController");
  uint64_t v2 = (void *)qword_10002CB40;
  qword_10002CB40 = (uint64_t)v1;
}

void sub_100017578(uint64_t a1, os_log_s *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "Failed to decode presentation context: %@",  (uint8_t *)&v2,  0xCu);
}

void sub_1000175EC( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100017654( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000176BC()
{
  int v2 = NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue(v2);
  uint64_t v3 = (objc_class *)sub_100016A58();
  id v4 = NSStringFromClass(v3);
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  sub_100016A10();
  sub_100016A64();
  sub_100016A74();
  sub_100016A38( (void *)&_mh_execute_header,  (os_log_s *)&_os_log_default,  v6,  "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@",  v7,  v8,  v9,  v10,  v11);

  sub_100016A48();
}

void sub_100017764()
{
  int v2 = NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue(v2);
  uint64_t v3 = (objc_class *)sub_100016A58();
  id v4 = NSStringFromClass(v3);
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  sub_100016A10();
  sub_100016A64();
  sub_100016A74();
  sub_100016A38( (void *)&_mh_execute_header,  (os_log_s *)&_os_log_default,  v6,  "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@",  v7,  v8,  v9,  v10,  v11);

  sub_100016A48();
}

void sub_10001780C()
{
  int v2 = NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue(v2);
  uint64_t v3 = (objc_class *)sub_100016A58();
  id v4 = NSStringFromClass(v3);
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  sub_100016A10();
  sub_100016A64();
  sub_100016A74();
  sub_100016A38( (void *)&_mh_execute_header,  (os_log_s *)&_os_log_default,  v6,  "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@",  v7,  v8,  v9,  v10,  v11);

  sub_100016A48();
}

void sub_1000178B4()
{
  int v2 = NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue(v2);
  uint64_t v3 = (objc_class *)sub_100016A58();
  id v4 = NSStringFromClass(v3);
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  sub_100016A10();
  sub_100016A64();
  sub_100016A74();
  sub_100016A38( (void *)&_mh_execute_header,  (os_log_s *)&_os_log_default,  v6,  "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@",  v7,  v8,  v9,  v10,  v11);

  sub_100016A48();
}

id objc_msgSend_willMoveToParentViewController_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "willMoveToParentViewController:");
}
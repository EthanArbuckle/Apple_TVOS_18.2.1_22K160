}

uint64_t start(int a1, char **a2)
{
  v4 = objc_autoreleasePoolPush();
  if (os_variant_has_internal_content("com.apple.HeadBoard"))
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v13 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "HeadBoard is running on an internal build. Enabling CA_ASSERT_MAIN_THREAD_TRANSACTIONS and CA_DEBUG_TRANSACTIONS.",  v13,  2u);
    }

    setenv("CA_ASSERT_MAIN_THREAD_TRANSACTIONS", "1", 1);
    setenv("CA_DEBUG_TRANSACTIONS", "1", 1);
  }

  v5 = (objc_class *)objc_opt_class(&OBJC_CLASS___HBApplication);
  v6 = NSStringFromClass(v5);
  v7 = (NSString *)objc_claimAutoreleasedReturnValue(v6);
  v8 = (objc_class *)objc_opt_class(&OBJC_CLASS___HBAppDelegate);
  v9 = NSStringFromClass(v8);
  v10 = (NSString *)objc_claimAutoreleasedReturnValue(v9);
  uint64_t v11 = UIApplicationMain(a1, a2, v7, v10);

  objc_autoreleasePoolPop(v4);
  return v11;
}

LABEL_24:
  return v26;
}

void sub_100006B74( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, uint64_t a48, uint64_t a49, uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
}

id sub_100006BB8(void *a1, uint64_t a2)
{
  id v3 = a1;
  v4 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  if (a2 >= 1)
  {
    do
    {
      -[NSMutableArray addObjectsFromArray:](v4, "addObjectsFromArray:", v3);
      --a2;
    }

    while (a2);
  }

  id v5 = -[NSMutableArray copy](v4, "copy");

  return v5;
}

id sub_100006C28(void *a1)
{
  v1 = (void *)objc_claimAutoreleasedReturnValue([a1 componentsSeparatedByString:@"-"]);
  if ([v1 count] == (id)2)
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue([v1 objectAtIndexedSubscript:1]);
    id v3 = [v2 integerValue];
  }

  else
  {
    id v3 = 0LL;
  }

  return v3;
}

void sub_100006C98(uint64_t a1, int a2)
{
  if (a2)
  {
    id v13 = (id)objc_claimAutoreleasedReturnValue( +[TVRecapFocusCommand focusAction:direction:]( &OBJC_CLASS___TVRecapFocusCommand,  "focusAction:direction:",  0LL,  3LL));
    v15[0] = v13;
    id v3 = (void *)objc_claimAutoreleasedReturnValue( +[TVRecapFocusCommand focusAction:direction:]( &OBJC_CLASS___TVRecapFocusCommand,  "focusAction:direction:",  0LL,  3LL));
    v15[1] = v3;
    v4 = (void *)objc_claimAutoreleasedReturnValue( +[TVRecapFocusCommand focusAction:direction:]( &OBJC_CLASS___TVRecapFocusCommand,  "focusAction:direction:",  0LL,  3LL));
    v15[2] = v4;
    id v5 = (void *)objc_claimAutoreleasedReturnValue(+[TVRecapDelayCommand delay:](&OBJC_CLASS___TVRecapDelayCommand, "delay:", 0.5));
    v15[3] = v5;
    v6 = (void *)objc_claimAutoreleasedReturnValue( +[TVRecapFocusCommand focusAction:direction:]( &OBJC_CLASS___TVRecapFocusCommand,  "focusAction:direction:",  0LL,  2LL));
    v15[4] = v6;
    v7 = (void *)objc_claimAutoreleasedReturnValue( +[TVRecapFocusCommand focusAction:direction:]( &OBJC_CLASS___TVRecapFocusCommand,  "focusAction:direction:",  0LL,  2LL));
    v15[5] = v7;
    v8 = (void *)objc_claimAutoreleasedReturnValue( +[TVRecapFocusCommand focusAction:direction:]( &OBJC_CLASS___TVRecapFocusCommand,  "focusAction:direction:",  0LL,  2LL));
    v15[6] = v8;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[TVRecapDelayCommand delay:](&OBJC_CLASS___TVRecapDelayCommand, "delay:", 0.5));
    v15[7] = v9;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v15, 8LL));
    id v11 = sub_100006BB8(v10, *(void *)(a1 + 48));
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);

    [*(id *)(a1 + 32) _performTestCommands:v12 withTestName:*(void *)(a1 + 40)];
  }

  else
  {
    id v14 = (id)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](&OBJC_CLASS___UIApplication, "sharedApplication"));
    [v14 failedTest:*(void *)(a1 + 40) withFailure:@"Failed to move focus into the top shelf"];
  }

BOOL sub_100006EAC(uint64_t a1)
{
  id v1 = *(id *)(a1 + 32);
  v2 = (void *)objc_claimAutoreleasedReturnValue([v1 gridView]);
  id v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "hbui_indexPathForFocusedItem"));
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue([v1 layout]);
    id v5 = [v4 rowFromIndexPath:v3];
    BOOL v6 = v5 != [v4 indexOfLastRow];
  }

  else
  {
    BOOL v6 = 1LL;
  }

  return v6;
}

uint64_t sub_100006F44(uint64_t a1)
{
  id v1 = *(id *)(a1 + 32);
  v2 = (void *)objc_claimAutoreleasedReturnValue([v1 gridView]);
  id v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "hbui_indexPathForFocusedItem"));
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue([v1 layout]);
    unsigned int v5 = [v4 isIndexPathInDock:v3];

    uint64_t v6 = v5 ^ 1;
  }

  else
  {
    uint64_t v6 = 1LL;
  }

  return v6;
}

void sub_100006FD0(uint64_t a1)
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( +[TVRecapFocusCommand focusAction:direction:]( &OBJC_CLASS___TVRecapFocusCommand,  "focusAction:direction:",  1LL,  1LL));
  v9[0] = v2;
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[TVRecapDelayCommand delay:](&OBJC_CLASS___TVRecapDelayCommand, "delay:", 0.5));
  v9[1] = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[TVRecapFocusCommand focusAction:direction:]( &OBJC_CLASS___TVRecapFocusCommand,  "focusAction:direction:",  1LL,  0LL));
  v9[2] = v4;
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(+[TVRecapDelayCommand delay:](&OBJC_CLASS___TVRecapDelayCommand, "delay:", 0.5));
  v9[3] = v5;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v9, 4LL));
  id v7 = sub_100006BB8(v6, *(void *)(a1 + 48));
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

  [*(id *)(a1 + 32) _performTestCommands:v8 withTestName:*(void *)(a1 + 40)];
}

void sub_1000070F8(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v7 = a2;
  uint64_t v8 = objc_opt_class(&OBJC_CLASS___HBFolder);
  char isKindOfClass = objc_opt_isKindOfClass(v7, v8);

  if ((isKindOfClass & 1) != 0)
  {
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = a3;
    *a4 = 1;
  }

void sub_100007170(uint64_t a1)
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[TVRecapButtonCommand button:](&OBJC_CLASS___TVRecapButtonCommand, "button:", 5LL));
  v9[0] = v2;
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[TVRecapDelayCommand delay:](&OBJC_CLASS___TVRecapDelayCommand, "delay:", 1.0));
  v9[1] = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[TVRecapButtonCommand button:](&OBJC_CLASS___TVRecapButtonCommand, "button:", 8LL));
  v9[2] = v4;
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(+[TVRecapDelayCommand delay:](&OBJC_CLASS___TVRecapDelayCommand, "delay:", 1.0));
  v9[3] = v5;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v9, 4LL));
  id v7 = sub_100006BB8(v6, *(void *)(a1 + 48));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

  [*(id *)(a1 + 32) _performTestCommands:v8 withTestName:*(void *)(a1 + 40)];
}

void sub_100007290(uint64_t a1)
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( +[TVRecapButtonCommand button:longPress:]( &OBJC_CLASS___TVRecapButtonCommand,  "button:longPress:",  5LL,  1LL));
  v11[0] = v2;
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[TVRecapDelayCommand delay:](&OBJC_CLASS___TVRecapDelayCommand, "delay:", 0.5));
  v11[1] = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[TVRecapButtonCommand button:](&OBJC_CLASS___TVRecapButtonCommand, "button:", 5LL));
  v11[2] = v4;
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(+[TVRecapDelayCommand delay:](&OBJC_CLASS___TVRecapDelayCommand, "delay:", 2.0));
  v11[3] = v5;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[TVRecapButtonCommand button:](&OBJC_CLASS___TVRecapButtonCommand, "button:", 8LL));
  v11[4] = v6;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[TVRecapDelayCommand delay:](&OBJC_CLASS___TVRecapDelayCommand, "delay:", 0.5));
  v11[5] = v7;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v11, 6LL));
  id v9 = sub_100006BB8(v8, *(void *)(a1 + 48));
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);

  [*(id *)(a1 + 32) _performTestCommands:v10 withTestName:*(void *)(a1 + 40)];
}

void sub_1000073F4(uint64_t a1)
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( +[TVRecapButtonCommand button:longPress:]( &OBJC_CLASS___TVRecapButtonCommand,  "button:longPress:",  6LL,  1LL));
  v9[0] = v2;
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[TVRecapDelayCommand delay:](&OBJC_CLASS___TVRecapDelayCommand, "delay:", 1.0));
  v9[1] = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[TVRecapButtonCommand button:](&OBJC_CLASS___TVRecapButtonCommand, "button:", 8LL));
  v9[2] = v4;
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(+[TVRecapDelayCommand delay:](&OBJC_CLASS___TVRecapDelayCommand, "delay:", 1.0));
  v9[3] = v5;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v9, 4LL));
  id v7 = sub_100006BB8(v6, *(void *)(a1 + 48));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

  [*(id *)(a1 + 32) _performTestCommands:v8 withTestName:*(void *)(a1 + 40)];
}

void sub_1000075E4(uint64_t a1)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](&OBJC_CLASS___UIApplication, "sharedApplication"));
  [v2 finishedTest:*(void *)(a1 + 32) extraResults:0];
}

void sub_100007764(_Unwind_Exception *a1)
{
}

uint64_t sub_10000777C(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 40) + 8LL);
  uint64_t v2 = *(void *)(v1 + 24);
  if (v2 == 4) {
    return 0LL;
  }
  *(void *)(v1 + 24) = v2 + 1;
  return sub_1000077BC(*(void **)(a1 + 32)) ^ 1;
}

id sub_1000077BC(void *a1)
{
  id v1 = a1;
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([v1 window]);
  id v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "hbui_currentlyFocusedView"));

  v4 = (void *)objc_claimAutoreleasedReturnValue([v1 headerView]);
  id v5 = [v4 containsView:v3];

  return v5;
}

void sub_100007830(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[TVRecapDelayCommand delay:](&OBJC_CLASS___TVRecapDelayCommand, "delay:", 2.0));
  v9[0] = v2;
  id v3 = (void *)objc_claimAutoreleasedReturnValue( +[TVRecapFocusCommand focusAction:direction:condition:]( &OBJC_CLASS___TVRecapFocusCommand,  "focusAction:direction:condition:",  1LL,  0LL,  *(void *)(a1 + 40)));
  v9[1] = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v9, 2LL));

  id v5 = objc_alloc_init(&OBJC_CLASS___TVRecapCommandPerformer);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_100007968;
  v6[3] = &unk_10000C448;
  id v8 = *(id *)(a1 + 48);
  id v7 = *(id *)(a1 + 32);
  [v5 evaluateCommands:v4 completion:v6];
}

uint64_t sub_100007968(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 40);
  if (v1)
  {
    id v2 = sub_1000077BC(*(void **)(result + 32));
    return (*(uint64_t (**)(uint64_t, id))(v1 + 16))(v1, v2);
  }

  return result;
}

void sub_100007A88(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Ensure a display is attached", v1, 2u);
}

void sub_100007AC8(uint64_t a1, os_log_s *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "Folder on homescreen required for this test: %@",  (uint8_t *)&v2,  0xCu);
}

id objc_msgSend_zoneName(void *a1, const char *a2, ...)
{
  return [a1 zoneName];
}
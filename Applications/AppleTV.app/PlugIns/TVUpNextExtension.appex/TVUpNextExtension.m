}

id sub_100005454(uint64_t a1)
{
  return [*(id *)(a1 + 32) startTopShelfContentProvider];
}

void sub_100005550(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = sub_1000084A0();
  v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v12 = v3;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "--- TVUNTopShelfProvider - Top Shelf Content Provider startup result: %@",  buf,  0xCu);
  }

  v6 = *(void **)(a1 + 32);
  if (v3)
  {
    [v6 setContentProviderState:1];
    if ((uint64_t)[*(id *)(a1 + 32) contentProviderStartRetryCount] <= 5)
    {
      objc_msgSend( *(id *)(a1 + 32),  "setContentProviderStartRetryCount:",  (char *)objc_msgSend(*(id *)(a1 + 32), "contentProviderStartRetryCount") + 1);
      id v7 = sub_1000084A0();
      v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "--- TVUNTopShelfProvider - Top Shelf Content Provider startup: Retrying",  buf,  2u);
      }

      dispatch_time_t v9 = dispatch_time(0LL, 5000000000LL);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_1000056E4;
      block[3] = &unk_100030EA0;
      block[4] = *(void *)(a1 + 32);
      dispatch_after(v9, &_dispatch_main_q, block);
    }
  }

  else
  {
    [v6 setContentProviderState:3];
  }
}

id sub_1000056E4(uint64_t a1)
{
  return [*(id *)(a1 + 32) startTopShelfContentProvider];
}

void sub_10000577C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (!v5 && v6)
  {
    id v8 = sub_1000084A0();
    dispatch_time_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138412290;
      v11 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "--- TVUNTopShelfProvider - Error fetching Top Shelf Up Next Content: %@",  (uint8_t *)&v10,  0xCu);
    }
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_100005954(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (!v5 && v6)
  {
    id v8 = sub_1000084A0();
    dispatch_time_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138412290;
      v11 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "--- TVUNTopShelfProvider - Error fetching Top Shelf Featured Content: %@",  (uint8_t *)&v10,  0xCu);
    }
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_100005B6C(uint64_t a1)
{
  id v5 = objc_alloc_init(&OBJC_CLASS___TVTopShelfContentUpdate);
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](&OBJC_CLASS___NSSet, "setWithObject:", *(void *)(a1 + 32)));
  [v5 setItemIdentifiersToRemove:v2];

  id v3 = objc_alloc_init(&OBJC_CLASS___TVTopShelfActionResult);
  [v3 setSuccess:1];
  [v3 setContentChange:v5];
  +[TVTopShelfContentProvider topShelfContentDidChange]( &OBJC_CLASS___TVTopShelfContentProvider,  "topShelfContentDidChange");
  uint64_t v4 = *(void *)(a1 + 40);
  if (v4) {
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v3);
  }
}

void sub_100005EA0(_Unwind_Exception *a1)
{
}

void sub_100005ECC(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v5 = sub_1000084A0();
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
      [v7 timeIntervalSinceDate:*(void *)(a1 + 32)];
      int v11 = 134217984;
      uint64_t v12 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "--- TVUNTopShelfProvider - Completed request. Elapsed time: %.5f",  (uint8_t *)&v11,  0xCu);
    }

    id v9 = v3;
    [WeakRetained setLastKnownContent:v9];
    uint64_t v10 = *(void *)(a1 + 40);
    if (v10) {
      (*(void (**)(uint64_t, id))(v10 + 16))(v10, v9);
    }
  }
}

uint64_t sub_100005FE8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

uint64_t sub_100005FF4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_1000064C0(id a1)
{
  id v1 = sub_1000084A0();
  uint64_t v2 = (os_log_s *)objc_claimAutoreleasedReturnValue(v1);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v3 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_DEFAULT,  "--- TVUNTopShelfProvider - didStopShowingItemWithIdentifier: saveToTrackerWithCompletionHandler called",  v3,  2u);
  }
}

void sub_100006614(id a1)
{
  id v1 = sub_1000084A0();
  uint64_t v2 = (os_log_s *)objc_claimAutoreleasedReturnValue(v1);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v3 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_DEFAULT,  "--- TVUNTopShelfProvider - didStopShowingItemWithIdentifier: recordImpressionsWithCompletionHandler called",  v3,  2u);
  }
}

LABEL_60:
}

      if (!v19)
      {
LABEL_32:
        if (!v20) {
          return (void *)swift_bridgeObjectRelease(0LL);
        }
LABEL_33:
        swift_bridgeObjectRelease(v147);
        return (void *)swift_bridgeObjectRelease(0LL);
      }

uint64_t sub_100006F2C(uint64_t a1, int a2)
{
  if (a2)
  {
    id v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "wlk_stringForKey:", @"TVUNFeaturedItemUserInfoKeyPunchoutURL"));
    if ([v3 length])
    {
      uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[LSApplicationWorkspace defaultWorkspace]( &OBJC_CLASS___LSApplicationWorkspace,  "defaultWorkspace"));
      id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v3));
      id v13 = 0LL;
      unsigned int v6 = [v4 openURL:v5 withOptions:&__NSDictionary0__struct error:&v13];
      id v7 = (__CFString *)v13;

      id v8 = sub_1000084A0();
      id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v10 = @"NO";
        if (v6) {
          uint64_t v10 = @"YES";
        }
        int v11 = &stru_100032790;
        if (v7) {
          int v11 = v7;
        }
        *(_DWORD *)buf = 138412546;
        v15 = v10;
        __int16 v16 = 2112;
        v17 = v11;
        _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "--- TVUNTopShelfProvider - Punchout success: %@ %@",  buf,  0x16u);
      }
    }
  }

  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0LL);
  }
  return result;
}

uint64_t sub_1000070B4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a3);
  }
  return result;
}

void sub_100007360(uint64_t a1)
{
  id v2 = objc_alloc_init(&OBJC_CLASS___TVTopShelfContentUpdate);
  id v3 = objc_alloc(&OBJC_CLASS___TVTopShelfItemUpdate);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) identifier]);
  id v5 = [v3 initWithItemIdentifier:v4];

  unsigned int v6 = *(void **)(a1 + 40);
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[TVUNUpNextActionHandler buttonImageForState:]( &OBJC_CLASS___TVUNUpNextActionHandler,  "buttonImageForState:",  *(unsigned __int8 *)(a1 + 56)));
  [v6 _setImageName:v7];

  id v8 = *(void **)(a1 + 40);
  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[TVUNUpNextActionHandler buttonTitleForState:]( &OBJC_CLASS___TVUNUpNextActionHandler,  "buttonTitleForState:",  *(unsigned __int8 *)(a1 + 56)));
  [v8 _setTitle:v9];

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) _userInfo]);
  id v11 = [v10 mutableCopy];

  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKey:@"metricsData"]);
  id v13 = [v12 mutableCopy];

  if (*(_BYTE *)(a1 + 56)) {
    v14 = (id *)&VUIMetricsActionTypeRemove;
  }
  else {
    v14 = (id *)&VUIMetricsActionTypeAdd;
  }
  uint64_t v15 = VUIMetricsActionTypeKey;
  id v16 = *v14;
  objc_msgSend(v13, "wlk_setObjectUnlessNil:forKey:", v16, v15);
  objc_msgSend(v11, "wlk_setObjectUnlessNil:forKey:", v13, @"metricsData");
  v17 = *(void **)(a1 + 40);
  id v18 = [v11 copy];
  [v17 _setUserInfo:v18];

  [v5 setPlayAction:*(void *)(a1 + 40)];
  id v22 = v5;
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v22, 1LL));

  [v2 setItemUpdates:v19];
  id v20 = objc_alloc_init(&OBJC_CLASS___TVTopShelfActionResult);
  [v20 setSuccess:1];
  [v20 setContentChange:v2];
  uint64_t v21 = *(void *)(a1 + 48);
  if (v21) {
    (*(void (**)(uint64_t, uint64_t, id))(v21 + 16))(v21, 1LL, v20);
  }
}

void sub_10000770C(uint64_t a1, int a2)
{
  if (a2)
  {
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472LL;
    v4[2] = sub_1000077BC;
    v4[3] = &unk_100030F40;
    id v5 = *(id *)(a1 + 32);
    id v6 = *(id *)(a1 + 40);
    dispatch_async(&_dispatch_main_q, v4);
  }

  else
  {
    uint64_t v3 = *(void *)(a1 + 40);
    if (v3) {
      (*(void (**)(uint64_t, void))(v3 + 16))(v3, 0LL);
    }
  }

void sub_1000077BC(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue( +[VUIStoreAcquisitionProperties acquisitionPropertiesWithBuyParams:urlbagKey:]( &OBJC_CLASS___VUIStoreAcquisitionProperties,  "acquisitionPropertiesWithBuyParams:urlbagKey:",  *(void *)(a1 + 32),  VUIAcquireURLBagKey));
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[VUIStoreAcquisition sharedInstance](&OBJC_CLASS___VUIStoreAcquisition, "sharedInstance"));
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_100007894;
  v5[3] = &unk_1000310B8;
  id v6 = *(id *)(a1 + 32);
  id v7 = *(id *)(a1 + 40);
  id v4 = [v3 acquireWithProperties:v2 completionBlock:v5];
}

void sub_100007894(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  id v9 = sub_1000084A0();
  uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v18 = 138412290;
    v19 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "TVUNPurchaseHandler - Purchase flow response: %@",  (uint8_t *)&v18,  0xCu);
  }

  id v11 = sub_1000084A0();
  uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    int v18 = 138412290;
    v19 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "TVUNPurchaseHandler - Purchase flow error: %@",  (uint8_t *)&v18,  0xCu);
  }

  id v13 = sub_1000084A0();
  v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v15 = @"NO";
    if (a2 == 2) {
      uint64_t v15 = @"YES";
    }
    int v18 = 138412290;
    v19 = v15;
    _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "TVUNPurchaseHandler - Purchase completed: %@",  (uint8_t *)&v18,  0xCu);
  }

  if (a2 == 2)
  {
    id v16 = (void *)objc_claimAutoreleasedReturnValue(+[VUIPurchaser sharedInstance](&OBJC_CLASS___VUIPurchaser, "sharedInstance"));
    [v16 postCrossProcessNotificationWithBuyParams:*(void *)(a1 + 32) error:v8];
  }

  uint64_t v17 = *(void *)(a1 + 40);
  if (v17) {
    (*(void (**)(uint64_t, BOOL))(v17 + 16))(v17, a2 == 2);
  }
}

void sub_100007B78( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
}

void sub_100007B9C(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v5 = sub_1000084A0();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a2));
    int v8 = 138412290;
    id v9 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "TVUNPurchaseHandler - restriction validation output: %@",  (uint8_t *)&v8,  0xCu);
  }

  if (a2 == 1) {
    [WeakRetained _showMediaNotAllowedByProfileAlert];
  }
  (*(void (**)(void, BOOL))(*(void *)(a1 + 32) + 16LL))(*(void *)(a1 + 32), a2 == 0);
}

void sub_100007FF0(id a1)
{
}

LABEL_16:
  int v18 = 0LL;
LABEL_18:

  return v18;
}

id sub_1000084A0()
{
  if (qword_1000364C0 != -1) {
    dispatch_once(&qword_1000364C0, &stru_1000311D8);
  }
  return (id)qword_1000364B8;
}

void sub_1000084E0(id a1)
{
  os_log_t v1 = os_log_create("com.apple.tv.TVUpNext", "Default");
  id v2 = (void *)qword_1000364B8;
  qword_1000364B8 = (uint64_t)v1;
}

id sub_100008510()
{
  if (qword_1000364D0[0] != -1) {
    dispatch_once(qword_1000364D0, &stru_1000311F8);
  }
  return (id)qword_1000364C8;
}

void sub_100008550(id a1)
{
  os_log_t v1 = os_log_create("com.apple.tv.SportsWidget", "Default");
  id v2 = (void *)qword_1000364C8;
  qword_1000364C8 = (uint64_t)v1;
}

uint64_t sub_100008580()
{
  return 1LL;
}

void sub_100008588()
{
}

Swift::Int sub_1000085AC()
{
  return Hasher._finalize()();
}

Swift::Int sub_1000085EC(uint64_t a1)
{
  return Hasher._finalize()();
}

uint64_t static JetJSStack.createJSStack(name:bagKey:defaults:urlOverrideDefaultKey:dependencies:exceptionHandler:)( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v8[10] = a8;
  v8[11] = v13;
  v8[8] = a6;
  v8[9] = a7;
  v8[6] = a4;
  v8[7] = a5;
  v8[4] = a2;
  v8[5] = a3;
  v8[3] = a1;
  uint64_t v9 = type metadata accessor for InMemoryJetPackResourceBundle(0LL);
  v8[12] = v9;
  uint64_t v10 = *(void *)(v9 - 8);
  v8[13] = v10;
  v8[14] = swift_task_alloc((*(void *)(v10 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v11 = sub_100008A20(&qword_100035F00);
  v8[15] = swift_task_alloc((*(void *)(*(void *)(v11 - 8) + 64LL) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  return swift_task_switch(sub_1000086D0, 0LL, 0LL);
}

uint64_t sub_1000086D0()
{
  uint64_t v1 = v0[15];
  uint64_t v3 = v0[7];
  uint64_t v2 = v0[8];
  uint64_t v5 = v0[5];
  uint64_t v4 = v0[6];
  type metadata accessor for VUIJetPackController(0LL);
  id v6 = (void *)static VUIJetPackController.controller(bagKey:defaults:urlOverrideDefaultKey:)(v5, v4, v3, v2);
  uint64_t v7 = swift_allocObject(&unk_100031228, 24LL, 7LL);
  *(void *)(v7 + 16) = v6;
  sub_100008A20(&qword_100035F18);
  id v8 = v6;
  uint64_t v9 = Promise.__allocating_init()();
  v0[16] = v9;
  uint64_t v10 = type metadata accessor for TaskPriority(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56LL))(v1, 1LL, 1LL, v10);
  uint64_t v11 = (void *)swift_allocObject(&unk_100031250, 56LL, 7LL);
  v11[2] = 0LL;
  v11[3] = 0LL;
  v11[4] = &unk_100035F10;
  v11[5] = v7;
  v11[6] = v9;
  swift_retain(v9);
  uint64_t v12 = sub_1000091C4(v1, (uint64_t)&unk_100035F28, (uint64_t)v11);
  swift_release(v12);

  uint64_t v13 = (uint64_t **)swift_task_alloc(dword_100035F34);
  v0[17] = (uint64_t)v13;
  *uint64_t v13 = v0;
  v13[1] = (uint64_t *)sub_100008820;
  return sub_10000962C(v0[3], v0[4], v9, v0[9]);
}

uint64_t sub_100008820(uint64_t a1)
{
  uint64_t v4 = *v2;
  uint64_t v5 = *(void *)(*v2 + 136);
  *(void *)(*v2 + 144) = v1;
  swift_task_dealloc(v5);
  if (v1)
  {
    id v6 = sub_1000089D8;
  }

  else
  {
    *(void *)(v4 + 152) = a1;
    id v6 = sub_100008894;
  }

  return swift_task_switch(v6, 0LL, 0LL);
}

uint64_t sub_100008894()
{
  uint64_t v1 = *(void *)(v0 + 152);
  uint64_t v2 = *(void *)(v0 + 128);
  uint64_t v3 = *(void *)(v0 + 112);
  uint64_t v15 = *(void *)(v0 + 104);
  uint64_t v16 = *(void *)(v0 + 120);
  uint64_t v5 = *(void *)(v0 + 88);
  uint64_t v4 = *(void *)(v0 + 96);
  uint64_t v6 = *(void *)(v0 + 80);
  uint64_t v7 = type metadata accessor for JSStack(0LL);
  uint64_t v8 = type metadata accessor for BaseObjectGraph(0LL);
  inject<A, B>(_:from:)(v7, v1, v7, v8);
  uint64_t v9 = *(void *)(v0 + 16);
  inject<A, B>(_:from:)(v4, v1, v4, v8);
  uint64_t v10 = swift_allocObject(&unk_100031278, 32LL, 7LL);
  *(void *)(v10 + 16) = v6;
  *(void *)(v10 + 24) = v5;
  swift_retain(v5);
  JSStack.exceptionObserver.setter(sub_100009E78, v10);
  uint64_t v11 = JetPackResourceBundle.version.getter(v4, &protocol witness table for InMemoryJetPackResourceBundle);
  uint64_t v13 = v12;
  swift_release(v2);
  (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v3, v4);
  swift_task_dealloc(v16);
  swift_task_dealloc(v3);
  return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(v0 + 8))(v9, *(void *)(v0 + 152), v11, v13);
}

uint64_t sub_1000089D8()
{
  uint64_t v1 = *(void *)(v0 + 120);
  uint64_t v2 = *(void *)(v0 + 112);
  swift_release(*(void *)(v0 + 128));
  swift_task_dealloc(v1);
  swift_task_dealloc(v2);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_100008A20(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2((char *)a1 + (int)result, -(result >> 32), 0LL, 0LL);
    *a1 = result;
  }

  return result;
}

id sub_100008A60@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  v33 = a3;
  uint64_t v34 = a2;
  uint64_t v5 = type metadata accessor for JSStack.StandardGlobalConfiguration(0LL);
  __chkstk_darwin(v5);
  uint64_t v7 = (char *)&v33 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v8 = type metadata accessor for JetPackPath(0LL);
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v33 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v12 = type metadata accessor for InMemoryJetPackResourceBundle(0LL);
  uint64_t v13 = *(void *)(v12 - 8);
  __chkstk_darwin(v12);
  uint64_t v15 = (char *)&v33 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v16 = type metadata accessor for BaseObjectGraph(0LL);
  uint64_t v35 = a1;
  uint64_t v17 = inject<A, B>(_:from:)(v12, a1, v12, v16);
  static JetPackPath.sourcePath.getter(v17);
  InMemoryJetPackResourceBundle.inMemorySource(fromPath:)(v36, v11);
  if (v3)
  {
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
    return (id)(*(uint64_t (**)(char *, uint64_t))(v13 + 8))(v15, v12);
  }

  else
  {
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
    uint64_t v18 = sub_100008A20(&qword_100035FB0);
    uint64_t v19 = type metadata accessor for JSStack.Prerequisite(0LL);
    uint64_t v20 = *(void *)(v19 - 8);
    uint64_t v21 = *(unsigned __int8 *)(v20 + 80);
    uint64_t v22 = (v21 + 32) & ~v21;
    uint64_t v23 = swift_allocObject(v18, v22 + *(void *)(v20 + 72), v21 | 7);
    *(_OWORD *)(v23 + 16) = xmmword_100027590;
    uint64_t v24 = v23 + v22;
    sub_10000A240((uint64_t)v36, v24);
    (*(void (**)(uint64_t, void, uint64_t))(v20 + 104))( v24,  enum case for JSStack.Prerequisite.source(_:),  v19);
    uint64_t v37 = v23;
    uint64_t v25 = v35;
    swift_retain(v35);
    uint64_t v26 = swift_bridgeObjectRetain(v34);
    sub_1000093B8(v26);
    uint64_t v27 = v37;
    id result = [objc_allocWithZone(JSVirtualMachine) init];
    if (result)
    {
      id v28 = result;
      type metadata accessor for JSStack(0LL);
      static JSStack.StandardGlobalConfiguration.default.getter();
      uint64_t v29 = JSStack.__allocating_init(asPartOf:virtualMachine:configuration:customPrerequisites:)(v25, v28, v7, v27);
      v30 = v33;
      uint64_t v32 = v29;
      sub_10000A114(v36);
      id result = (id)(*(uint64_t (**)(char *, uint64_t))(v13 + 8))(v15, v12);
      uint64_t *v30 = v32;
    }

    else
    {
      __break(1u);
    }
  }

  return result;
}

uint64_t sub_100008CFC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = type metadata accessor for JSStack(0LL);
  *(void *)(a2 + 24) = v4;
  *(void *)(a2 + 32) = &protocol witness table for JSStack;
  uint64_t v5 = type metadata accessor for BaseObjectGraph(0LL);
  return inject<A, B>(_:from:)(v4, a1, v4, v5);
}

uint64_t sub_100008D64(uint64_t a1)
{
  uint64_t v3 = (void *)swift_task_alloc(async function pointer to VUIJetPackController.getJetPack()[1]);
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_100008DBC;
  return VUIJetPackController.getJetPack()(a1);
}

uint64_t sub_100008DBC()
{
  uint64_t v2 = *v0;
  swift_task_dealloc(*(void *)(*v0 + 16));
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_100008E04()
{
  return swift_deallocObject(v0, 24LL, 7LL);
}

uint64_t sub_100008E28(uint64_t a1)
{
  uint64_t v3 = (void *)swift_task_alloc(dword_100035F0C);
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_100008DBC;
  uint64_t v4 = (void *)swift_task_alloc(async function pointer to VUIJetPackController.getJetPack()[1]);
  v3[2] = v4;
  *uint64_t v4 = v3;
  v4[1] = sub_100008DBC;
  return VUIJetPackController.getJetPack()(a1);
}

id JetJSStack.__allocating_init()()
{
  return [objc_allocWithZone(v0) init];
}

id JetJSStack.init()()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for JetJSStack();
  return objc_msgSendSuper2(&v2, "init");
}

id JetJSStack.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for JetJSStack();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t sub_100008F60(uint64_t a1, uint64_t a2, uint64_t a3, int *a4, uint64_t a5, uint64_t a6)
{
  v6[2] = a6;
  uint64_t v8 = type metadata accessor for InMemoryJetPackResourceBundle(0LL);
  v6[3] = v8;
  uint64_t v9 = *(void *)(v8 - 8);
  v6[4] = v9;
  uint64_t v10 = swift_task_alloc((*(void *)(v9 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  v6[5] = v10;
  uint64_t v13 = (uint64_t (*)(uint64_t))((char *)a4 + *a4);
  uint64_t v11 = (void *)swift_task_alloc(a4[1]);
  v6[6] = v11;
  void *v11 = v6;
  v11[1] = sub_100008FF8;
  return v13(v10);
}

uint64_t sub_100008FF8()
{
  uint64_t v2 = *(void *)(*(void *)v1 + 48LL);
  *(void *)(*(void *)v1 + 56LL) = v0;
  swift_task_dealloc(v2);
  if (v0) {
    uint64_t v3 = sub_1000090B4;
  }
  else {
    uint64_t v3 = sub_10000905C;
  }
  return swift_task_switch(v3, 0LL, 0LL);
}

uint64_t sub_10000905C()
{
  uint64_t v2 = *(void *)(v0 + 32);
  uint64_t v1 = *(void *)(v0 + 40);
  uint64_t v3 = *(void *)(v0 + 24);
  Promise.resolve(_:)(v1);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  swift_task_dealloc(*(void *)(v0 + 40));
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1000090B4()
{
  uint64_t v1 = *(void *)(v0 + 56);
  Promise.reject(_:)(v1);
  swift_errorRelease(v1);
  swift_task_dealloc(*(void *)(v0 + 40));
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1000090FC()
{
  return swift_deallocObject(v0, 56LL, 7LL);
}

uint64_t sub_100009130(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = (int *)v1[4];
  uint64_t v7 = v1[5];
  uint64_t v8 = v1[6];
  uint64_t v9 = (void *)swift_task_alloc(dword_100035F24);
  *(void *)(v2 + 16) = v9;
  *uint64_t v9 = v2;
  v9[1] = sub_100008DBC;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, int *, uint64_t, uint64_t))((char *)&dword_100035F20
                                                                                     + dword_100035F20))( a1,  v4,  v5,  v6,  v7,  v8);
}

uint64_t sub_1000091C4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for TaskPriority(0LL);
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1LL, v6) == 1)
  {
    sub_10000A288(a1);
    uint64_t v8 = 7168LL;
    uint64_t v9 = *(void *)(a3 + 16);
    if (v9)
    {
LABEL_3:
      uint64_t v10 = *(void *)(a3 + 24);
      uint64_t ObjectType = swift_getObjectType(v9);
      swift_unknownObjectRetain(v9, v12);
      uint64_t v13 = dispatch thunk of Actor.unownedExecutor.getter(ObjectType, v10);
      uint64_t v15 = v14;
      swift_unknownObjectRelease(v9);
      goto LABEL_6;
    }
  }

  else
  {
    unsigned __int8 v16 = TaskPriority.rawValue.getter();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    uint64_t v8 = v16 | 0x1C00LL;
    uint64_t v9 = *(void *)(a3 + 16);
    if (v9) {
      goto LABEL_3;
    }
  }

  uint64_t v13 = 0LL;
  uint64_t v15 = 0LL;
LABEL_6:
  uint64_t v17 = swift_allocObject(&unk_100031468, 32LL, 7LL);
  *(void *)(v17 + 16) = a2;
  *(void *)(v17 + 24) = a3;
  if (v15 | v13)
  {
    v20[0] = 0LL;
    v20[1] = 0LL;
    uint64_t v18 = v20;
    v20[2] = v13;
    v20[3] = v15;
  }

  else
  {
    uint64_t v18 = 0LL;
  }

  return swift_task_create(v8, v18, (char *)&type metadata for () + 8, &unk_100035FC0, v17);
}

uint64_t sub_100009308(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc(a2[1]);
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_10000936C;
  return v6(a1);
}

uint64_t sub_10000936C()
{
  uint64_t v2 = *v0;
  swift_task_dealloc(*(void *)(*v0 + 16));
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_1000093B8(uint64_t result)
{
  uint64_t v2 = *(void *)(result + 16);
  uint64_t v3 = (void *)*v1;
  int64_t v4 = *(void *)(*v1 + 16LL);
  int64_t v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }

  uint64_t v6 = result;
  id result = swift_isUniquelyReferenced_nonNull_native(*v1);
  if ((_DWORD)result && v5 <= v3[3] >> 1)
  {
    if (*(void *)(v6 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }

  if (v4 <= v5) {
    int64_t v12 = v4 + v2;
  }
  else {
    int64_t v12 = v4;
  }
  id result = sub_1000094B8(result, v12, 1, v3);
  uint64_t v3 = (void *)result;
  if (!*(void *)(v6 + 16))
  {
LABEL_13:
    if (!v2) {
      goto LABEL_14;
    }
    goto LABEL_16;
  }

LABEL_5:
  uint64_t v7 = v3[2];
  uint64_t v8 = (v3[3] >> 1) - v7;
  id result = type metadata accessor for JSStack.Prerequisite(0LL);
  if (v8 < v2)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }

  id result = swift_arrayInitWithCopy( (char *)v3 + ((*(unsigned __int8 *)(*(void *)(result - 8) + 80LL) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(result - 8) + 80LL))
           + *(void *)(*(void *)(result - 8) + 72LL) * v7);
  if (!v2)
  {
LABEL_14:
    id result = swift_bridgeObjectRelease(v6);
    void *v1 = v3;
    return result;
  }

  uint64_t v9 = v3[2];
  BOOL v10 = __OFADD__(v9, v2);
  uint64_t v11 = v9 + v2;
  if (!v10)
  {
    v3[2] = v11;
    goto LABEL_14;
  }

        [v6 addObserver:v0 selector:"cacheInvalidationEventOccurred" name:VUIStoreAcquisitionCrossProcessNotification object:0];
        goto LABEL_6;
      }
    }

    else if ((v4 & 0x100) == 0)
    {
      goto LABEL_4;
    }

    [v6 addObserver:v0 selector:"cacheInvalidationEventOccurred" name:VUIUpNextRequestDidFinishCrossProcessNotification object:0];
    if ((v4 & 0x10000) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }

  *a1 = v8;
  if ((a6 & 0x8000000000000000LL) != 0) {
    return 0LL;
  }
  else {
    return swift_unknownObjectRetain(a6 & 0xFFFFFFFFFFFFFFFLL, __dst);
  }
}

LABEL_18:
  __break(1u);
  return result;
}

size_t sub_1000094B8(size_t result, int64_t a2, char a3, void *a4)
{
  char v5 = result;
  if ((a3 & 1) != 0)
  {
    unint64_t v6 = a4[3];
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000LL < 0)
      {
LABEL_30:
        __break(1u);
        return result;
      }

      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    }
  }

  else
  {
    int64_t v7 = a2;
  }

  uint64_t v8 = a4[2];
  if (v7 <= v8) {
    uint64_t v9 = a4[2];
  }
  else {
    uint64_t v9 = v7;
  }
  if (!v9)
  {
    uint64_t v15 = &_swiftEmptyArrayStorage;
    goto LABEL_19;
  }

  uint64_t v10 = sub_100008A20(&qword_100035FB0);
  uint64_t v11 = *(void *)(type metadata accessor for JSStack.Prerequisite(0LL) - 8);
  uint64_t v12 = *(void *)(v11 + 72);
  uint64_t v13 = *(unsigned __int8 *)(v11 + 80);
  uint64_t v14 = (v13 + 32) & ~v13;
  uint64_t v15 = (void *)swift_allocObject(v10, v14 + v12 * v9, v13 | 7);
  id result = j__malloc_size(v15);
  if (!v12)
  {
    __break(1u);
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }

  if (result - v14 == 0x8000000000000000LL && v12 == -1) {
    goto LABEL_29;
  }
  v15[2] = v8;
  v15[3] = 2 * ((uint64_t)(result - v14) / v12);
LABEL_19:
  uint64_t v17 = type metadata accessor for JSStack.Prerequisite(0LL);
  uint64_t v18 = *(void *)(v17 - 8);
  unint64_t v19 = (*(unsigned __int8 *)(v18 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v18 + 80);
  uint64_t v20 = (char *)v15 + v19;
  uint64_t v21 = (char *)a4 + v19;
  if ((v5 & 1) != 0)
  {
    if (v15 < a4 || v20 >= &v21[*(void *)(v18 + 72) * v8])
    {
      swift_arrayInitWithTakeFrontToBack(v20, v21, v8, v17);
    }

    else if (v15 != a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }

    a4[2] = 0LL;
  }

  else
  {
    swift_arrayInitWithCopy(v20);
  }

  swift_bridgeObjectRelease(a4);
  return (size_t)v15;
}

uint64_t sub_10000962C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[62] = a3;
  v4[63] = a4;
  v4[60] = a1;
  v4[61] = a2;
  uint64_t v5 = type metadata accessor for Bag(0LL);
  v4[64] = v5;
  uint64_t v6 = *(void *)(v5 - 8);
  v4[65] = v6;
  v4[66] = swift_task_alloc((*(void *)(v6 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  return swift_task_switch(sub_100009690, 0LL, 0LL);
}

uint64_t sub_100009690()
{
  id v1 = objc_msgSend((id)objc_opt_self(AMSBag), "vui_defaultBag");
  *(void *)(v0 + 536) = v1;
  if (v1)
  {
    uint64_t v2 = v1;
    uint64_t v3 = *(void *)(v0 + 528);
    uint64_t v4 = *(void *)(v0 + 512);
    uint64_t v47 = *(void *)(v0 + 504);
    uint64_t v5 = *(void *)(v0 + 488);
    uint64_t v46 = *(void *)(v0 + 496);
    uint64_t v6 = *(void *)(v0 + 480);
    int64_t v7 = (void *)objc_opt_self(&OBJC_CLASS___NSURLSessionConfiguration);
    id v44 = (id)objc_opt_self(&OBJC_CLASS___AMSProcessInfo);
    id v8 = [v44 currentProcess];
    id v45 = objc_msgSend(v7, "ams_configurationWithProcessInfo:bag:", v8, v2);
    *(void *)(v0 + 544) = v45;

    Bag.init(from:)(v2);
    type metadata accessor for BaseObjectGraph(0LL);
    static BaseObjectGraph.build(withName:)(v6, v5);
    uint64_t v9 = *(void *)(v0 + 40);
    uint64_t v10 = *(void *)(v0 + 48);
    sub_10000A0F0((void *)(v0 + 16), v9);
    AsyncObjectGraphBuilder.satisfying<A>(_:with:)(v4, v3, v9, v4, v10);
    uint64_t v12 = *(void *)(v0 + 80);
    uint64_t v11 = *(void *)(v0 + 88);
    sub_10000A0F0((void *)(v0 + 56), v12);
    uint64_t v13 = sub_100008A20(&qword_100035F78);
    id v14 = objc_msgSend((id)objc_opt_self(ACAccountStore), "ams_sharedAccountStore");
    *(void *)(v0 + 160) = sub_10000A134(0LL, &qword_100035F80, &OBJC_CLASS___ACAccountStore_ptr);
    *(void *)(v0 + 168) = &protocol witness table for ACAccountStore;
    *(void *)(v0 + 136) = v14;
    AsyncObjectGraphBuilder.satisfying<A>(_:with:)(v13, v0 + 136, v12, v13, v11);
    sub_10000A114((void *)(v0 + 136));
    uint64_t v16 = *(void *)(v0 + 120);
    uint64_t v15 = *(void *)(v0 + 128);
    sub_10000A0F0((void *)(v0 + 96), v16);
    uint64_t v17 = sub_10000A134(0LL, &qword_100035F88, &OBJC_CLASS___AMSProcessInfo_ptr);
    id v18 = [v44 currentProcess];
    *(void *)(v0 + 464) = v18;
    AsyncObjectGraphBuilder.satisfying<A>(_:with:)(v17, v0 + 464, v16, v17, v15);

    uint64_t v20 = *(void *)(v0 + 200);
    uint64_t v19 = *(void *)(v0 + 208);
    sub_10000A0F0((void *)(v0 + 176), v20);
    uint64_t v21 = sub_10000A134(0LL, &qword_100035F90, &OBJC_CLASS___AMSURLSession_ptr);
    id v22 = [objc_allocWithZone(AMSURLSession) initWithConfiguration:v45];
    *(void *)(v0 + 456) = v22;
    AsyncObjectGraphBuilder.satisfying<A>(_:with:)(v21, v0 + 456, v20, v21, v19);

    uint64_t v23 = *(void *)(v0 + 280);
    uint64_t v24 = *(void *)(v0 + 288);
    sub_10000A0F0((void *)(v0 + 256), v23);
    uint64_t v25 = type metadata accessor for InMemoryJetPackResourceBundle(0LL);
    swift_retain(v46);
    dispatch thunk of AsyncObjectGraphBuilder.satisfying<A>(_:with:)(v25, sub_10000A16C, v46, v25, v23, v24);
    swift_release(v46);
    uint64_t v27 = *(void *)(v0 + 360);
    uint64_t v26 = *(void *)(v0 + 368);
    sub_10000A0F0((void *)(v0 + 336), v27);
    AsyncObjectGraphBuilder.withDependenciesSatisfied.getter(v27, v26);
    uint64_t v29 = *(void *)(v0 + 400);
    uint64_t v28 = *(void *)(v0 + 408);
    sub_10000A0F0((void *)(v0 + 376), v29);
    uint64_t v30 = type metadata accessor for JSStack(0LL);
    uint64_t v31 = swift_allocObject(&unk_100031440, 24LL, 7LL);
    *(void *)(v31 + 16) = v47;
    swift_bridgeObjectRetain(v47);
    AsyncObjectGraphBuilder.satisfying<A>(_:with:)(v30, sub_10000A198, v31, v29, v30, v28);
    swift_release(v31);
    uint64_t v33 = *(void *)(v0 + 440);
    uint64_t v32 = *(void *)(v0 + 448);
    sub_10000A0F0((void *)(v0 + 416), v33);
    AsyncObjectGraphBuilder.withDependenciesSatisfied.getter(v33, v32);
    uint64_t v35 = *(void *)(v0 + 320);
    uint64_t v34 = *(void *)(v0 + 328);
    sub_10000A0F0((void *)(v0 + 296), v35);
    uint64_t v36 = sub_100008A20(&qword_100035F98);
    AsyncObjectGraphBuilder.satisfying<A>(_:with:)(v36, sub_100008CFC, 0LL, v35, v36, v34);
    uint64_t v37 = *(void *)(v0 + 240);
    uint64_t v38 = *(void *)(v0 + 248);
    sub_10000A0F0((void *)(v0 + 216), v37);
    *(void *)(v0 + 552) = dispatch thunk of AsyncObjectGraphBuilder.makeObjectGraph()(v37, v38);
    uint64_t v39 = sub_100008A20(&qword_100035FA0);
    unint64_t v40 = sub_10000A1B0();
    v41 = (void *)swift_task_alloc(async function pointer to dispatch thunk of Future.then()[1]);
    *(void *)(v0 + 560) = v41;
    void *v41 = v0;
    v41[1] = sub_100009BF8;
    return dispatch thunk of Future.then()(v0 + 472, v39, v40);
  }

  else
  {
    unint64_t v43 = sub_10000A0AC();
    swift_allocError(&type metadata for JetJSStackError, v43, 0LL, 0LL);
    swift_willThrow();
    swift_task_dealloc(*(void *)(v0 + 528));
    return (*(uint64_t (**)(void))(v0 + 8))();
  }

uint64_t sub_100009BF8()
{
  uint64_t v2 = *(void **)v1;
  uint64_t v3 = *(void *)(*(void *)v1 + 560LL);
  *(void *)(*(void *)v1 + 568LL) = v0;
  swift_task_dealloc(v3);
  swift_release(v2[69]);
  if (v0)
  {
    uint64_t v4 = sub_100009D74;
  }

  else
  {
    v2[72] = v2[59];
    uint64_t v4 = sub_100009C6C;
  }

  return swift_task_switch(v4, 0LL, 0LL);
}

uint64_t sub_100009C6C()
{
  uint64_t v1 = *(void **)(v0 + 536);
  uint64_t v2 = *(void *)(v0 + 528);
  uint64_t v3 = *(void *)(v0 + 520);
  uint64_t v4 = *(void *)(v0 + 512);

  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  sub_10000A114((void *)(v0 + 216));
  sub_10000A114((void *)(v0 + 296));
  sub_10000A114((void *)(v0 + 416));
  sub_10000A114((void *)(v0 + 376));
  sub_10000A114((void *)(v0 + 336));
  sub_10000A114((void *)(v0 + 256));
  sub_10000A114((void *)(v0 + 176));
  sub_10000A114((void *)(v0 + 96));
  sub_10000A114((void *)(v0 + 56));
  sub_10000A114((void *)(v0 + 16));
  swift_task_dealloc(v2);
  return (*(uint64_t (**)(void))(v0 + 8))(*(void *)(v0 + 576));
}

uint64_t sub_100009D74()
{
  uint64_t v1 = *(void **)(v0 + 536);
  uint64_t v2 = *(void *)(v0 + 528);
  uint64_t v3 = *(void *)(v0 + 520);
  uint64_t v4 = *(void *)(v0 + 512);

  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  sub_10000A114((void *)(v0 + 216));
  sub_10000A114((void *)(v0 + 296));
  sub_10000A114((void *)(v0 + 416));
  sub_10000A114((void *)(v0 + 376));
  sub_10000A114((void *)(v0 + 336));
  sub_10000A114((void *)(v0 + 256));
  sub_10000A114((void *)(v0 + 176));
  sub_10000A114((void *)(v0 + 96));
  sub_10000A114((void *)(v0 + 56));
  sub_10000A114((void *)(v0 + 16));
  swift_task_dealloc(*(void *)(v0 + 528));
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_100009E78(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = *(void (**)(uint64_t, uint64_t))(v2 + 16);
  uint64_t v6 = type metadata accessor for JSError(0LL);
  unint64_t v7 = sub_10000A064();
  uint64_t v8 = swift_allocError(v6, v7, 0LL, 0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16LL))(v9, a2, v6);
  v5(a1, v8);
  return swift_errorRelease(v8);
}

uint64_t type metadata accessor for JetJSStack()
{
  return objc_opt_self(&OBJC_CLASS____TtC17TVUpNextExtension10JetJSStack);
}

unint64_t sub_100009F20()
{
  unint64_t result = qword_100035F38;
  if (!qword_100035F38)
  {
    unint64_t result = swift_getWitnessTable(&unk_1000275AC, &type metadata for JetJSStackError);
    atomic_store(result, (unint64_t *)&qword_100035F38);
  }

  return result;
}

uint64_t getEnumTagSinglePayload for JetJSStackError(unsigned int *a1, int a2)
{
  if (!a2) {
    return 0LL;
  }
  else {
    int v2 = 2;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4) {
    return *a1;
  }
  if (v3 == 2) {
    return *(unsigned __int16 *)a1;
  }
  return *(unsigned __int8 *)a1;
}

uint64_t storeEnumTagSinglePayload for JetJSStackError(uint64_t a1, int a2, int a3)
{
  else {
    int v3 = 2;
  }
  else {
    LODWORD(v4) = v3;
  }
  if (a3) {
    uint64_t v4 = v4;
  }
  else {
    uint64_t v4 = 0LL;
  }
  if (a2) {
    return ((uint64_t (*)(void))((char *)sub_100009FFC + 4 * byte_1000275A0[v4]))();
  }
  else {
    return ((uint64_t (*)(void))((char *)sub_10000A01C + 4 * byte_1000275A5[v4]))();
  }
}

_BYTE *sub_100009FFC(_BYTE *result, char a2)
{
  *unint64_t result = a2;
  return result;
}

_BYTE *sub_10000A01C(_BYTE *result)
{
  *unint64_t result = 0;
  return result;
}

_DWORD *sub_10000A024(_DWORD *result, int a2)
{
  *unint64_t result = a2;
  return result;
}

_WORD *sub_10000A02C(_WORD *result, __int16 a2)
{
  *unint64_t result = a2;
  return result;
}

_WORD *sub_10000A034(_WORD *result)
{
  *unint64_t result = 0;
  return result;
}

_DWORD *sub_10000A03C(_DWORD *result)
{
  *unint64_t result = 0;
  return result;
}

uint64_t variable initialization expression of TopShelfContentProvider.startupComplete()
{
  return 0LL;
}

ValueMetadata *type metadata accessor for JetJSStackError()
{
  return &type metadata for JetJSStackError;
}

unint64_t sub_10000A064()
{
  unint64_t result = qword_100035F68;
  if (!qword_100035F68)
  {
    uint64_t v1 = type metadata accessor for JSError(255LL);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for JSError, v1);
    atomic_store(result, (unint64_t *)&qword_100035F68);
  }

  return result;
}

unint64_t sub_10000A0AC()
{
  unint64_t result = qword_100035F70;
  if (!qword_100035F70)
  {
    unint64_t result = swift_getWitnessTable(&unk_100027614, &type metadata for JetJSStackError);
    atomic_store(result, (unint64_t *)&qword_100035F70);
  }

  return result;
}

void *sub_10000A0F0(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80LL) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80LL) + 16LL) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80LL)));
  return result;
}

uint64_t sub_10000A114(void *a1)
{
  uint64_t v1 = *(void *)(a1[3] - 8LL);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0) {
    return swift_release(*a1);
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_10000A134(uint64_t a1, unint64_t *a2, void *a3)
{
  uint64_t result = *a2;
  if (!*a2)
  {
    uint64_t v5 = objc_opt_self(*a3);
    uint64_t result = swift_getObjCClassMetadata(v5);
    atomic_store(result, a2);
  }

  return result;
}

uint64_t sub_10000A16C()
{
  return swift_retain(v0);
}

uint64_t sub_10000A174()
{
  return swift_deallocObject(v0, 24LL, 7LL);
}

id sub_10000A198@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_100008A60(a1, *(void *)(v2 + 16), a2);
}

unint64_t sub_10000A1B0()
{
  unint64_t result = qword_100035FA8;
  if (!qword_100035FA8)
  {
    uint64_t v1 = sub_10000A1FC(&qword_100035FA0);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for Promise<A>, v1);
    atomic_store(result, (unint64_t *)&qword_100035FA8);
  }

  return result;
}

uint64_t sub_10000A1FC(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2( 255LL,  (char *)a1 + (int)result,  -(result >> 32),  0LL,  0LL);
    *a1 = result;
  }

  return result;
}

uint64_t sub_10000A240(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_10000A288(uint64_t a1)
{
  uint64_t v2 = sub_100008A20(&qword_100035F00);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8LL))(a1, v2);
  return a1;
}

uint64_t sub_10000A2C8()
{
  return swift_deallocObject(v0, 32LL, 7LL);
}

uint64_t sub_10000A2EC(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc(dword_100035FBC);
  *(void *)(v2 + 16) = v5;
  void *v5 = v2;
  v5[1] = sub_10000A35C;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_100035FB8 + dword_100035FB8))(a1, v4);
}

BOOL sub_10000A364(char a1, char a2)
{
  return a1 == a2;
}

void sub_10000A374(uint64_t a1, unsigned __int8 a2)
{
}

Swift::Int sub_10000A398(unsigned __int8 a1)
{
  return Hasher._finalize()();
}

uint64_t sub_10000A3E4(int a1)
{
  if (a1 == 1) {
    unsigned int v1 = 1;
  }
  else {
    unsigned int v1 = 2;
  }
  if (a1) {
    return v1;
  }
  else {
    return 0LL;
  }
}

uint64_t sub_10000A3FC(char a1)
{
  return a1 & 1;
}

BOOL sub_10000A404(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

Swift::Int sub_10000A41C()
{
  Swift::UInt32 v1 = *v0;
  Hasher.init(_seed:)(v3, 0LL);
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

void sub_10000A460()
{
}

Swift::Int sub_10000A488(uint64_t a1)
{
  Swift::UInt32 v2 = *v1;
  Hasher.init(_seed:)(v4, a1);
  Hasher._combine(_:)(v2);
  return Hasher._finalize()();
}

_DWORD *sub_10000A4C8@<X0>(_DWORD *result@<X0>, char *a2@<X8>)
{
  if (*result == 1) {
    char v2 = 1;
  }
  else {
    char v2 = 2;
  }
  if (*result) {
    char v3 = v2;
  }
  else {
    char v3 = 0;
  }
  *a2 = v3;
  return result;
}

void sub_10000A4E8(_DWORD *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t sub_10000A4F4(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_10000A4FC(uint64_t a1, uint64_t a2, char a3)
{
  return a3 & 1;
}

uint64_t sub_10000A504(uint64_t a1, uint64_t a2, unsigned int a3)
{
  return (a3 >> 8) & 1;
}

uint64_t sub_10000A50C(uint64_t a1, uint64_t a2, unsigned int a3)
{
  return HIWORD(a3) & 1;
}

uint64_t sub_10000A514(uint64_t a1, uint64_t a2, unsigned int a3)
{
  return HIBYTE(a3) & 1;
}

uint64_t sub_10000A51C(unsigned __int8 a1)
{
  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_10000A558 + 4 * byte_100027690[a1]))( 0x6143646C756F6873LL,  0xEB00000000656863LL);
}

unint64_t sub_10000A558()
{
  return 0xD000000000000020LL;
}

uint64_t sub_10000A5D0()
{
  return sub_10000A51C(*v0);
}

uint64_t sub_10000A5D8@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result = sub_1000160C0(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_10000A5FC()
{
  return 0LL;
}

void sub_10000A608(_BYTE *a1@<X8>)
{
  *a1 = 6;
}

uint64_t sub_10000A614(uint64_t a1)
{
  unint64_t v2 = sub_10000A828();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10000A63C(uint64_t a1)
{
  unint64_t v2 = sub_10000A828();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_10000A664(void *a1, uint64_t a2, uint64_t a3, unsigned int a4)
{
  uint64_t v17 = a3;
  uint64_t v8 = sub_100008A20(&qword_100035FC8);
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin();
  uint64_t v11 = (char *)&v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v12 = a1[3];
  uint64_t v13 = a1[4];
  sub_10000A0F0(a1, v12);
  unint64_t v14 = sub_10000A828();
  dispatch thunk of Encoder.container<A>(keyedBy:)( &type metadata for CachePolicyRelay.CodingKeys,  &type metadata for CachePolicyRelay.CodingKeys,  v14,  v12,  v13);
  char v23 = 0;
  KeyedEncodingContainer.encode(_:forKey:)(a2, &v23, v8);
  if (!v4)
  {
    char v22 = 1;
    KeyedEncodingContainer.encode(_:forKey:)(v17, &v22, v8);
    char v21 = 2;
    KeyedEncodingContainer.encode(_:forKey:)(a4 & 1, &v21, v8);
    char v20 = 3;
    KeyedEncodingContainer.encode(_:forKey:)((a4 >> 8) & 1, &v20, v8);
    char v19 = 4;
    KeyedEncodingContainer.encode(_:forKey:)(HIWORD(a4) & 1, &v19, v8);
    char v18 = 5;
    KeyedEncodingContainer.encode(_:forKey:)(HIBYTE(a4) & 1, &v18, v8);
  }

  return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

unint64_t sub_10000A828()
{
  unint64_t result = qword_100036690;
  if (!qword_100036690)
  {
    unint64_t result = swift_getWitnessTable(&unk_100028444, &type metadata for CachePolicyRelay.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_100036690);
  }

  return result;
}

uint64_t sub_10000A86C(void *a1)
{
  return sub_10001631C(a1) & 1;
}

uint64_t sub_10000A894(char a1)
{
  return a1 & 1;
}

uint64_t sub_10000A8CC@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result = sub_10001631C(a1);
  if (!v2)
  {
    *(_BYTE *)a2 = result & 1;
    *(void *)(a2 + 8) = v5;
    *(_BYTE *)(a2 + 16) = v6 & 1;
    *(_BYTE *)(a2 + 17) = BYTE1(v6) & 1;
    *(_BYTE *)(a2 + 18) = BYTE2(v6) & 1;
    *(_BYTE *)(a2 + 19) = HIBYTE(v6) & 1;
  }

  return result;
}

uint64_t sub_10000A91C(void *a1)
{
  if (v1[17]) {
    int v2 = 256;
  }
  else {
    int v2 = 0;
  }
  int v3 = v2 | v1[16];
  if (v1[18]) {
    int v4 = 0x10000;
  }
  else {
    int v4 = 0;
  }
  if (v1[19]) {
    int v5 = 0x1000000;
  }
  else {
    int v5 = 0;
  }
  return sub_10000A664(a1, *v1, *((void *)v1 + 1), v3 | v4 | v5);
}

uint64_t variable initialization expression of TopShelfContentProvider.delegate()
{
  return 0LL;
}

uint64_t TopShelfContentProvider.delegate.getter()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC17TVUpNextExtension23TopShelfContentProvider_delegate;
  swift_beginAccess(v0 + OBJC_IVAR____TtC17TVUpNextExtension23TopShelfContentProvider_delegate, v3, 0LL, 0LL);
  return swift_unknownObjectWeakLoadStrong(v1);
}

uint64_t TopShelfContentProvider.delegate.setter(uint64_t a1)
{
  uint64_t v3 = v1 + OBJC_IVAR____TtC17TVUpNextExtension23TopShelfContentProvider_delegate;
  swift_beginAccess(v3, v5, 1LL, 0LL);
  swift_unknownObjectWeakAssign(v3, a1);
  return swift_unknownObjectRelease(a1);
}

void (*TopShelfContentProvider.delegate.modify(void *a1))(uint64_t a1, char a2)
{
  uint64_t v3 = malloc(0x30uLL);
  *a1 = v3;
  uint64_t v4 = OBJC_IVAR____TtC17TVUpNextExtension23TopShelfContentProvider_delegate;
  v3[4] = v1;
  v3[5] = v4;
  uint64_t v5 = v1 + v4;
  swift_beginAccess(v1 + v4, v3, 33LL, 0LL);
  v3[3] = swift_unknownObjectWeakLoadStrong(v5);
  return sub_10000AB28;
}

void sub_10000AB28(uint64_t a1, char a2)
{
  uint64_t v3 = *(void **)a1;
  uint64_t v4 = *(void *)(*(void *)a1 + 24LL);
  swift_unknownObjectWeakAssign(*(void *)(*(void *)a1 + 32LL) + *(void *)(*(void *)a1 + 40LL), v4);
  if ((a2 & 1) != 0)
  {
    swift_unknownObjectRelease(v3[3]);
    swift_endAccess(v3);
  }

  else
  {
    swift_endAccess(v3);
    swift_unknownObjectRelease(v4);
  }

  free(v3);
}

const char *TopShelfContentProvider.IgnoreCache.unsafeMutableAddressor()
{
  return "ignoreCache";
}

uint64_t static TopShelfContentProvider.IgnoreCache.getter()
{
  return 0x614365726F6E6769LL;
}

void *TopShelfContentProvider.SquareImageShapeWidth.unsafeMutableAddressor()
{
  return &static TopShelfContentProvider.SquareImageShapeWidth;
}

unint64_t static TopShelfContentProvider.SquareImageShapeWidth.getter()
{
  return 0xD000000000000015LL;
}

void *TopShelfContentProvider.SquareImageShapeHeight.unsafeMutableAddressor()
{
  return &static TopShelfContentProvider.SquareImageShapeHeight;
}

unint64_t static TopShelfContentProvider.SquareImageShapeHeight.getter()
{
  return 0xD000000000000016LL;
}

void *TopShelfContentProvider.PosterImageShapeWidth.unsafeMutableAddressor()
{
  return &static TopShelfContentProvider.PosterImageShapeWidth;
}

unint64_t static TopShelfContentProvider.PosterImageShapeWidth.getter()
{
  return 0xD000000000000015LL;
}

void *TopShelfContentProvider.PosterImageShapeHeight.unsafeMutableAddressor()
{
  return &static TopShelfContentProvider.PosterImageShapeHeight;
}

unint64_t static TopShelfContentProvider.PosterImageShapeHeight.getter()
{
  return 0xD000000000000016LL;
}

void *TopShelfContentProvider.HDTVImageShapeWidth.unsafeMutableAddressor()
{
  return &static TopShelfContentProvider.HDTVImageShapeWidth;
}

unint64_t static TopShelfContentProvider.HDTVImageShapeWidth.getter()
{
  return 0xD000000000000013LL;
}

void *TopShelfContentProvider.HDTVImageShapeHeight.unsafeMutableAddressor()
{
  return &static TopShelfContentProvider.HDTVImageShapeHeight;
}

unint64_t static TopShelfContentProvider.HDTVImageShapeHeight.getter()
{
  return 0xD000000000000014LL;
}

void *TopShelfContentProvider.BadgeImageWidth.unsafeMutableAddressor()
{
  return &static TopShelfContentProvider.BadgeImageWidth;
}

uint64_t static TopShelfContentProvider.BadgeImageWidth.getter()
{
  return 0x616D496567646162LL;
}

void *TopShelfContentProvider.BadgeImageHeight.unsafeMutableAddressor()
{
  return &static TopShelfContentProvider.BadgeImageHeight;
}

unint64_t static TopShelfContentProvider.BadgeImageHeight.getter()
{
  return 0xD000000000000010LL;
}

void *TopShelfContentProvider.BadgeImageScale.unsafeMutableAddressor()
{
  return &static TopShelfContentProvider.BadgeImageScale;
}

uint64_t static TopShelfContentProvider.BadgeImageScale.getter()
{
  return 0x616D496567646162LL;
}

void *TopShelfContentProvider.InstalledAppBundleIDs.unsafeMutableAddressor()
{
  return &static TopShelfContentProvider.InstalledAppBundleIDs;
}

unint64_t static TopShelfContentProvider.InstalledAppBundleIDs.getter()
{
  return 0xD000000000000015LL;
}

const char *TopShelfContentProvider.DisplayType.unsafeMutableAddressor()
{
  return "displayType";
}

uint64_t static TopShelfContentProvider.DisplayType.getter()
{
  return 0x5479616C70736964LL;
}

uint64_t variable initialization expression of TopShelfContentProvider.impressionTracker()
{
  return BasicImpressionsTracker.__allocating_init(threshold:)(1.0);
}

void *variable initialization expression of TopShelfContentProvider.impressionsData()
{
  return &_swiftEmptyArrayStorage;
}

uint64_t (*sub_10000ADC4(uint64_t a1))(void)
{
  return j__swift_endAccess;
}

_BYTE *variable initialization expression of TopShelfContentProvider._cachePolicy()
{
  id v0 = objc_allocWithZone((Class)type metadata accessor for CachePolicy());
  return sub_100013244(2LL, 0LL, 0, 0);
}

uint64_t sub_10000AE44()
{
  uint64_t v0 = type metadata accessor for Logger(0LL);
  sub_100024B98(v0, qword_100036668);
  sub_100024B80(v0, (uint64_t)qword_100036668);
  return Logger.init(subsystem:category:)( 0xD000000000000015LL,  0x8000000100029970LL,  0xD00000000000001ALL,  0x8000000100029990LL);
}

NSString sub_10000AEC0()
{
  NSString result = String._bridgeToObjectiveC()();
  qword_100036688 = (uint64_t)result;
  return result;
}

id sub_10000AEF4()
{
  uint64_t v1 = OBJC_IVAR____TtC17TVUpNextExtension23TopShelfContentProvider_impressionTracker;
  type metadata accessor for BasicImpressionsTracker(0LL);
  int v2 = v0;
  *(void *)&v0[v1] = BasicImpressionsTracker.__allocating_init(threshold:)(1.0);
  *(void *)&v2[OBJC_IVAR____TtC17TVUpNextExtension23TopShelfContentProvider_impressionsData] = &_swiftEmptyArrayStorage;
  *(void *)&v2[OBJC_IVAR____TtC17TVUpNextExtension23TopShelfContentProvider_stack] = 0LL;
  *(void *)&v2[OBJC_IVAR____TtC17TVUpNextExtension23TopShelfContentProvider_objectGraph] = 0LL;
  *(void *)&v2[OBJC_IVAR____TtC17TVUpNextExtension23TopShelfContentProvider_startupInvocations] = 0LL;
  v2[OBJC_IVAR____TtC17TVUpNextExtension23TopShelfContentProvider_startupComplete] = 0;
  *(_DWORD *)&v2[OBJC_IVAR____TtC17TVUpNextExtension23TopShelfContentProvider_cachePolicyLock] = 0;
  uint64_t v3 = OBJC_IVAR____TtC17TVUpNextExtension23TopShelfContentProvider__cachePolicy;
  id v4 = objc_allocWithZone((Class)type metadata accessor for CachePolicy());
  *(void *)&v2[v3] = sub_100013244(2LL, 0LL, 0, 0);

  v7.receiver = v2;
  v7.super_class = (Class)type metadata accessor for TopShelfContentProvider();
  id v5 = objc_msgSendSuper2(&v7, "init");
  setenv("JSC_criticalGCMemoryThreshold", "0.25", 1);
  [(id)objc_opt_self(MPMediaQuery) setFilteringDisabled:1];

  return v5;
}

uint64_t TopShelfContentProvider.start(developerMode:)()
{
  uint64_t v3 = (uint64_t (__cdecl *)())((char *)&dword_100036020 + dword_100036020);
  uint64_t v1 = (void *)swift_task_alloc(unk_100036024);
  *(void *)(v0 + 16) = v1;
  void *v1 = v0;
  v1[1] = sub_10000B0B0;
  return v3();
}

uint64_t sub_10000B0B0(uint64_t a1)
{
  uint64_t v4 = *v1;
  swift_task_dealloc(*(void *)(*v1 + 16));
  return (*(uint64_t (**)(uint64_t))(v4 + 8))(a1);
}

uint64_t sub_10000B230(int a1, void *aBlock, void *a3)
{
  v3[2] = a3;
  v3[3] = _Block_copy(aBlock);
  uint64_t v5 = unk_100036024;
  uint64_t v8 = (uint64_t (*)(void))((char *)&dword_100036020 + dword_100036020);
  a3;
  int v6 = (void *)swift_task_alloc(v5);
  v3[4] = v6;
  void *v6 = v3;
  v6[1] = sub_10000B2AC;
  return v8();
}

uint64_t sub_10000B2AC(uint64_t a1)
{
  uint64_t v3 = *v1;
  uint64_t v4 = *(void *)(*v1 + 32);
  uint64_t v5 = *(void **)(*v1 + 16);
  uint64_t v6 = *v1;
  swift_task_dealloc(v4);

  if (a1)
  {
    objc_super v7 = (void *)_convertErrorToNSError(_:)(a1);
    swift_errorRelease(a1);
  }

  else
  {
    objc_super v7 = 0LL;
  }

  uint64_t v8 = *(void (***)(void, void))(v3 + 24);
  ((void (**)(void, void *))v8)[2](v8, v7);

  _Block_release(v8);
  return (*(uint64_t (**)(void))(v6 + 8))();
}

uint64_t TopShelfContentProvider.recordImpressions()()
{
  *(void *)(v1 + 16) = v0;
  return swift_task_switch(sub_10000B35C, 0LL, 0LL);
}

uint64_t sub_10000B35C()
{
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_10000B4A8(const void *a1, void *a2)
{
  *(void *)(v2 + 16) = a2;
  *(void *)(v2 + 24) = _Block_copy(a1);
  id v4 = a2;
  return swift_task_switch(sub_10000B4F0, 0LL, 0LL);
}

uint64_t sub_10000B4F0()
{
  uint64_t v2 = *(void **)(v0 + 16);
  uint64_t v1 = *(void (***)(void))(v0 + 24);
  sub_10000BC28();

  v1[2](v1);
  _Block_release(v1);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t TopShelfContentProvider.saveToTracker(userInfo:)(uint64_t a1)
{
  v2[30] = a1;
  v2[31] = v1;
  uint64_t v3 = type metadata accessor for Date(0LL);
  v2[32] = v3;
  uint64_t v4 = *(void *)(v3 - 8);
  v2[33] = v4;
  v2[34] = swift_task_alloc((*(void *)(v4 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v5 = type metadata accessor for ImpressionMetrics(0LL);
  v2[35] = v5;
  uint64_t v6 = *(void *)(v5 - 8);
  v2[36] = v6;
  v2[37] = swift_task_alloc((*(void *)(v6 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  return swift_task_switch(sub_10000B5C0, 0LL, 0LL);
}

uint64_t sub_10000B5C0()
{
  uint64_t v29 = *(void *)(v0 + 240);
  if (!v29)
  {
LABEL_39:
    uint64_t v22 = *(void *)(v0 + 272);
    swift_task_dealloc(*(void *)(v0 + 296));
    swift_task_dealloc(v22);
    return (*(uint64_t (**)(void))(v0 + 8))();
  }

  uint64_t v1 = (_OWORD *)(v0 + 192);
  uint64_t v2 = (uint64_t *)(v0 + 224);
  uint64_t v23 = *(void *)(v0 + 264);
  uint64_t v24 = *(void *)(v0 + 288);
  uint64_t v25 = v29 + 64;
  uint64_t v3 = -1LL;
  uint64_t v4 = -1LL << *(_BYTE *)(v29 + 32);
  if (-v4 < 64) {
    uint64_t v3 = ~(-1LL << -(char)v4);
  }
  unint64_t v5 = v3 & *(void *)(v29 + 64);
  int64_t v28 = (unint64_t)(63 - v4) >> 6;
  uint64_t result = swift_bridgeObjectRetain(v29);
  uint64_t v27 = 0LL;
  int64_t v30 = 0LL;
  while (1)
  {
    if (v5)
    {
      unint64_t v7 = __clz(__rbit64(v5));
      v5 &= v5 - 1;
      unint64_t v8 = v7 | (v30 << 6);
LABEL_9:
      sub_100016974(*(void *)(v29 + 48) + 40 * v8, v0 + 88);
      sub_1000169B0(*(void *)(v29 + 56) + 32 * v8, v0 + 128);
      goto LABEL_28;
    }

    int64_t v9 = v30 + 1;
    if (__OFADD__(v30, 1LL))
    {
      __break(1u);
LABEL_41:
      __break(1u);
      goto LABEL_42;
    }

    if (v9 < v28)
    {
      unint64_t v10 = *(void *)(v25 + 8 * v9);
      if (v10) {
        goto LABEL_13;
      }
      int64_t v11 = v30 + 2;
      ++v30;
      if (v9 + 1 < v28)
      {
        unint64_t v10 = *(void *)(v25 + 8 * v11);
        if (v10) {
          goto LABEL_16;
        }
        int64_t v30 = v9 + 1;
        if (v9 + 2 < v28)
        {
          unint64_t v10 = *(void *)(v25 + 8 * (v9 + 2));
          if (v10)
          {
            v9 += 2LL;
            goto LABEL_13;
          }

          int64_t v11 = v9 + 3;
          int64_t v30 = v9 + 2;
          if (v9 + 3 < v28) {
            break;
          }
        }
      }
    }

LABEL_27:
    unint64_t v5 = 0LL;
    *(void *)(v0 + 152) = 0LL;
    *(_OWORD *)(v0 + 120) = 0u;
    *(_OWORD *)(v0 + 136) = 0u;
    *(_OWORD *)(v0 + 88) = 0u;
    *(_OWORD *)(v0 + 104) = 0u;
LABEL_28:
    sub_100024A88(v0 + 88, v0 + 16, &qword_100036038);
    if (!*(void *)(v0 + 40))
    {
      swift_release(v29);
      goto LABEL_39;
    }

    sub_1000169EC((_OWORD *)(v0 + 56), (_OWORD *)(v0 + 160));
    uint64_t v12 = sub_100008A20(&qword_100036040);
    if ((swift_dynamicCast(v2, v0 + 160, (char *)&type metadata for Any + 8, v12, 6LL) & 1) != 0)
    {
      uint64_t v13 = *v2;
      if (*(void *)(*v2 + 16) && (unint64_t v14 = sub_1000142D8(0x447363697274656DLL, 0xEB00000000617461LL), (v15 & 1) != 0))
      {
        sub_1000169B0(*(void *)(v13 + 56) + 32 * v14, (uint64_t)v1);
      }

      else
      {
        _OWORD *v1 = 0u;
        v1[1] = 0u;
      }

      swift_bridgeObjectRelease(v13);
      if (*(void *)(v0 + 216))
      {
        if ((swift_dynamicCast(v0 + 232, v1, (char *)&type metadata for Any + 8, v12, 6LL) & 1) != 0)
        {
          uint64_t v16 = *(void *)(v0 + 232);
          type metadata accessor for MetricsJetEngine(0LL);
          uint64_t v17 = v27;
          uint64_t v18 = static MetricsJetEngine.convertClickDataToImpressionsData(_:index:ignoreHosted:)(v16, v27, 0LL);
          swift_bridgeObjectRelease(v16);
          type metadata accessor for BaseImpressionManager(0LL);
          static BaseImpressionManager.makeImpressionsData(_:parent:)(v18, 0LL, 0LL);
          uint64_t result = swift_bridgeObjectRelease(v18);
          ++v27;
          if (__OFADD__(v17, 1LL)) {
            goto LABEL_41;
          }
          uint64_t v19 = *(void *)(v0 + 296);
          uint64_t v20 = *(void *)(v0 + 272);
          uint64_t v26 = *(void *)(v0 + 280);
          uint64_t v21 = *(void *)(v0 + 256);
          Date.init()(result);
          BasicImpressionsTracker.elementDidEnterView(_:on:)(v19, v20);
          (*(void (**)(uint64_t, uint64_t))(v23 + 8))(v20, v21);
          (*(void (**)(uint64_t, uint64_t))(v24 + 8))(v19, v26);
          uint64_t v2 = (uint64_t *)(v0 + 224);
          uint64_t v1 = (_OWORD *)(v0 + 192);
        }
      }

      else
      {
        sub_100023F4C((uint64_t)v1, &qword_100036048);
      }
    }

    uint64_t result = sub_1000169FC(v0 + 16);
  }

  unint64_t v10 = *(void *)(v25 + 8 * v11);
  if (v10)
  {
LABEL_16:
    int64_t v9 = v11;
LABEL_13:
    unint64_t v5 = (v10 - 1) & v10;
    unint64_t v8 = __clz(__rbit64(v10)) + (v9 << 6);
    int64_t v30 = v9;
    goto LABEL_9;
  }

  while (1)
  {
    int64_t v9 = v11 + 1;
    if (__OFADD__(v11, 1LL)) {
      break;
    }
    if (v9 >= v28)
    {
      int64_t v30 = v28 - 1;
      goto LABEL_27;
    }

    unint64_t v10 = *(void *)(v25 + 8 * v9);
    ++v11;
    if (v10) {
      goto LABEL_13;
    }
  }

  __break(1u);
}

LABEL_42:
  __break(1u);
  return result;
}

  __break(1u);
  return result;
}

    swift_bridgeObjectRelease(v161);
    if ((v13 & 0x100) == 0)
    {
LABEL_13:
      if ((v13 & 0x200) == 0) {
        goto LABEL_14;
      }
      goto LABEL_44;
    }

uint64_t sub_10000BB10(uint64_t a1, void *aBlock, void *a3)
{
  v3[2] = a3;
  v3[3] = _Block_copy(aBlock);
  if (a1) {
    a1 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)( a1,  &type metadata for AnyHashable,  (char *)&type metadata for Any + 8,  &protocol witness table for AnyHashable);
  }
  v3[4] = a1;
  uint64_t v6 = dword_100036034;
  a3;
  unint64_t v7 = (void *)swift_task_alloc(v6);
  v3[5] = v7;
  *unint64_t v7 = v3;
  v7[1] = sub_10000BBB4;
  return TopShelfContentProvider.saveToTracker(userInfo:)(a1);
}

uint64_t sub_10000BBB4()
{
  uint64_t v1 = *(void *)(*v0 + 32);
  uint64_t v3 = *(void **)(*v0 + 16);
  uint64_t v2 = *(void (***)(void))(*v0 + 24);
  uint64_t v5 = *v0;
  swift_task_dealloc(*(void *)(*v0 + 40));

  swift_bridgeObjectRelease(v1);
  v2[2](v2);
  _Block_release(v2);
  return (*(uint64_t (**)(void))(v5 + 8))();
}

void sub_10000BC28()
{
  uint64_t v0 = type metadata accessor for Date(0LL);
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v18[-1] - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v4 = type metadata accessor for ImpressionsTrackerFormat(0LL);
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  unint64_t v7 = (char *)&v18[-1] - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v8 = (*(uint64_t (**)(char *, void, uint64_t))(v5 + 104))( v7,  enum case for ImpressionsTrackerFormat.v3(_:),  v4);
  Date.init()(v8);
  uint64_t v9 = BasicImpressionsTracker.consumeImpressions(in:on:)(v7, v3);
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  unint64_t v10 = sub_10000BE2C(v9);
  swift_bridgeObjectRelease(v9);
  if (v10)
  {
    id v11 = [(id)objc_opt_self(VUIMetricsController) sharedInstance];
    uint64_t v12 = sub_100008A20(&qword_1000363E0);
    uint64_t inited = swift_initStackObject(v12, v19);
    *(_OWORD *)(inited + 16) = xmmword_100027590;
    v18[0] = static String._unconditionallyBridgeFromObjectiveC(_:)(VUIMetricsEventTypeImpressions);
    v18[1] = v14;
    AnyHashable.init<A>(_:)(v18, &type metadata for String, &protocol witness table for String);
    *(void *)(inited + 96) = sub_100008A20(&qword_1000363E8);
    *(void *)(inited + 72) = v10;
    unint64_t v15 = sub_10000C0B4(inited);
    Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v15);
    [v11 recordImpressions:isa];
  }

void *sub_10000BE2C(uint64_t a1)
{
  int64_t v2 = *(void *)(a1 + 16);
  uint64_t v12 = &_swiftEmptyArrayStorage;
  sub_1000144E0(0, v2, 0);
  uint64_t v3 = &_swiftEmptyArrayStorage;
  if (v2)
  {
    for (uint64_t i = a1 + 32; ; i += 32LL)
    {
      sub_1000169B0(i, (uint64_t)v11);
      uint64_t v5 = sub_100008A20(&qword_100036040);
      uint64_t v6 = v10;
      if ((swift_isUniquelyReferenced_nonNull_native(v3) & 1) == 0)
      {
        sub_1000144E0(0, v3[2] + 1LL, 1);
        uint64_t v3 = v12;
      }

      unint64_t v8 = v3[2];
      unint64_t v7 = v3[3];
      if (v8 >= v7 >> 1)
      {
        sub_1000144E0(v7 > 1, v8 + 1, 1);
        uint64_t v3 = v12;
      }

      v3[2] = v8 + 1;
      v3[v8 + 4] = v6;
      if (!--v2) {
        return v3;
      }
    }

    uint64_t v10 = 0LL;
    swift_release(v3);
    swift_bridgeObjectRelease(v10);
    return 0LL;
  }

  return v3;
}

void *sub_10000BF70(uint64_t a1)
{
  int64_t v2 = *(void *)(a1 + 16);
  uint64_t v14 = &_swiftEmptyArrayStorage;
  sub_1000144FC(0, v2, 0);
  uint64_t v3 = &_swiftEmptyArrayStorage;
  if (v2)
  {
    for (uint64_t i = a1 + 32; ; i += 32LL)
    {
      sub_1000169B0(i, (uint64_t)v13);
      if (!swift_dynamicCast( &v11,  v13,  (char *)&type metadata for Any + 8,  &type metadata for String,  6LL)) {
        break;
      }
      uint64_t v5 = v11;
      uint64_t v6 = v12;
      if ((swift_isUniquelyReferenced_nonNull_native(v3) & 1) == 0)
      {
        sub_1000144FC(0, v3[2] + 1LL, 1);
        uint64_t v3 = v14;
      }

      unint64_t v8 = v3[2];
      unint64_t v7 = v3[3];
      if (v8 >= v7 >> 1)
      {
        sub_1000144FC(v7 > 1, v8 + 1, 1);
        uint64_t v3 = v14;
      }

      v3[2] = v8 + 1;
      uint64_t v9 = (char *)&v3[2 * v8];
      *((void *)v9 + 4) = v5;
      *((void *)v9 + 5) = v6;
      if (!--v2) {
        return v3;
      }
    }

    uint64_t v11 = 0LL;
    uint64_t v12 = 0LL;
    swift_release(v3);
    swift_bridgeObjectRelease(v12);
    return 0LL;
  }

  return v3;
}

unint64_t sub_10000C0B4(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  if (!v2)
  {
    uint64_t v4 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }

  sub_100008A20(&qword_100036228);
  uint64_t v3 = static _DictionaryStorage.allocate(capacity:)(v2);
  uint64_t v4 = (void *)v3;
  uint64_t v5 = *(void *)(a1 + 16);
  if (!v5)
  {
LABEL_9:
    swift_bridgeObjectRelease(a1);
    return (unint64_t)v4;
  }

  uint64_t v6 = v3 + 64;
  uint64_t v7 = a1 + 32;
  swift_retain(v3);
  while (1)
  {
    sub_100023F88(v7, (uint64_t)v16);
    unint64_t result = sub_1000142A8((uint64_t)v16);
    if ((v9 & 1) != 0) {
      break;
    }
    *(void *)(v6 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8LL)) |= 1LL << result;
    uint64_t v10 = v4[6] + 40 * result;
    __int128 v11 = v16[0];
    __int128 v12 = v16[1];
    *(void *)(v10 + 32) = v17;
    *(_OWORD *)uint64_t v10 = v11;
    *(_OWORD *)(v10 + 16) = v12;
    unint64_t result = (unint64_t)sub_1000169EC(&v18, (_OWORD *)(v4[7] + 32 * result));
    uint64_t v13 = v4[2];
    BOOL v14 = __OFADD__(v13, 1LL);
    uint64_t v15 = v13 + 1;
    if (v14) {
      goto LABEL_11;
    }
    v4[2] = v15;
    v7 += 72LL;
    if (!--v5)
    {
      swift_release(v4);
      goto LABEL_9;
    }
  }

  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

unint64_t sub_10000C1E0(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  if (!v2)
  {
    uint64_t v4 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }

  sub_100008A20(&qword_100036220);
  uint64_t v3 = static _DictionaryStorage.allocate(capacity:)(v2);
  uint64_t v4 = (void *)v3;
  uint64_t v5 = *(void *)(a1 + 16);
  if (!v5)
  {
LABEL_9:
    swift_bridgeObjectRelease(a1);
    return (unint64_t)v4;
  }

  swift_retain(v3);
  uint64_t v6 = (void *)(a1 + 56);
  while (1)
  {
    uint64_t v7 = *(v6 - 3);
    uint64_t v8 = *(v6 - 2);
    uint64_t v10 = *(v6 - 1);
    uint64_t v9 = *v6;
    swift_bridgeObjectRetain(*v6);
    swift_bridgeObjectRetain(v8);
    unint64_t result = sub_1000142D8(v7, v8);
    if ((v12 & 1) != 0) {
      break;
    }
    *(void *)((char *)v4 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8LL) + 64) |= 1LL << result;
    uint64_t v13 = (uint64_t *)(v4[6] + 16 * result);
    *uint64_t v13 = v7;
    v13[1] = v8;
    BOOL v14 = (void *)(v4[7] + 16 * result);
    void *v14 = v10;
    v14[1] = v9;
    uint64_t v15 = v4[2];
    BOOL v16 = __OFADD__(v15, 1LL);
    uint64_t v17 = v15 + 1;
    if (v16) {
      goto LABEL_11;
    }
    v6 += 4;
    v4[2] = v17;
    if (!--v5)
    {
      swift_release(v4);
      goto LABEL_9;
    }
  }

  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

uint64_t sub_10000C300()
{
  v1[10] = v0;
  uint64_t v2 = type metadata accessor for Net(0LL);
  v1[11] = v2;
  uint64_t v3 = *(void *)(v2 - 8);
  v1[12] = v3;
  v1[13] = swift_task_alloc((*(void *)(v3 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  return swift_task_switch(sub_10000C360, 0LL, 0LL);
}

uint64_t sub_10000C360()
{
  uint64_t v1 = v0[13];
  uint64_t v2 = (void *)v0[10];
  uint64_t v23 = v0[12];
  uint64_t v24 = v0[11];
  _s17TVUpNextExtension23TopShelfContentProviderC3logyySSFZ_0(0xD000000000000023LL, 0x80000001000295C0LL);
  _s17TVUpNextExtension23TopShelfContentProviderC3logyySSFZ_0(0xD000000000000013LL, 0x80000001000295F0LL);
  type metadata accessor for JetJSStack();
  NSString v26 = String._bridgeToObjectiveC()();
  v0[14] = v26;
  id v3 = objc_allocWithZone(&OBJC_CLASS___NSUserDefaults);
  NSString v4 = String._bridgeToObjectiveC()();
  id v25 = [v3 initWithSuiteName:v4];
  v0[15] = v25;

  uint64_t v5 = sub_100008A20(&qword_100035FB0);
  uint64_t v6 = type metadata accessor for JSStack.Prerequisite(0LL);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(void *)(v7 + 72);
  uint64_t v9 = *(unsigned __int8 *)(v7 + 80);
  uint64_t v10 = (v9 + 32) & ~v9;
  uint64_t v11 = swift_allocObject(v5, v10 + 2 * v8, v9 | 7);
  v0[16] = v11;
  *(_OWORD *)(v11 + 16) = xmmword_100028610;
  char v12 = (void *)(v11 + v10);
  *char v12 = 0xD000000000000017LL;
  v12[1] = 0x8000000100029690LL;
  v12[2] = v2;
  uint64_t v13 = enum case for JSStack.Prerequisite.dependency(_:);
  BOOL v14 = *(void (**)(void *, uint64_t, uint64_t))(v7 + 104);
  v14(v12, enum case for JSStack.Prerequisite.dependency(_:), v6);
  uint64_t v15 = (void *)((char *)v12 + v8);
  sub_1000242F4();
  sub_100024338();
  id v16 = v2;
  uint64_t v17 = Net.init<A, B>(encoder:fetcher:)();
  uint64_t v18 = Net.jsExport.getter(v17);
  (*(void (**)(uint64_t, uint64_t))(v23 + 8))(v1, v24);
  void *v15 = 7628142LL;
  v15[1] = 0xE300000000000000LL;
  v15[2] = v18;
  v14(v15, v13, v6);
  uint64_t v19 = swift_allocObject(&unk_1000321F0, 24LL, 7LL);
  v0[17] = v19;
  swift_unknownObjectWeakInit(v19 + 16, v16);
  uint64_t v20 = dword_100035EFC;
  swift_retain(v19);
  uint64_t v21 = (void *)swift_task_alloc(v20);
  v0[18] = v21;
  *uint64_t v21 = v0;
  v21[1] = sub_10000C624;
  return static JetJSStack.createJSStack(name:bagKey:defaults:urlOverrideDefaultKey:dependencies:exceptionHandler:)( 0xD000000000000015LL,  0x8000000100029610LL,  (uint64_t)v26,  (uint64_t)v25,  0xD000000000000012LL,  0x8000000100029670LL,  v11,  (uint64_t)sub_10002437C);
}

uint64_t sub_10000C624(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6 = (void *)*v5;
  v6[2] = v5;
  v6[3] = a1;
  v6[4] = a2;
  v6[5] = a3;
  v6[6] = a4;
  v6[7] = v4;
  uint64_t v7 = v6[18];
  v6[19] = a3;
  v6[20] = a4;
  v6[21] = v4;
  swift_task_dealloc(v7);
  if (v4)
  {
    uint64_t v8 = sub_10000C8C8;
  }

  else
  {
    uint64_t v10 = v6[16];
    uint64_t v9 = v6[17];
    uint64_t v13 = v6 + 14;
    uint64_t v11 = (void *)v6[14];
    char v12 = (void *)v13[1];
    swift_release_n(v9, 2LL);
    swift_bridgeObjectRelease(v10);

    uint64_t v8 = sub_10000C6C0;
  }

  return swift_task_switch(v8, 0LL, 0LL);
}

uint64_t sub_10000C6C0()
{
  id v1 = objc_allocWithZone(&OBJC_CLASS___NSUserDefaults);
  NSString v2 = String._bridgeToObjectiveC()();
  id v3 = [v1 initWithSuiteName:v2];

  if (v3)
  {
    uint64_t v5 = *(void *)(v0 + 152);
    uint64_t v4 = *(void *)(v0 + 160);
    if (v4) {
      unint64_t v6 = *(void *)(v0 + 160);
    }
    else {
      unint64_t v6 = 0xE700000000000000LL;
    }
    swift_bridgeObjectRetain(*(void *)(v0 + 160));
    NSString v7 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v6);
    NSString v8 = String._bridgeToObjectiveC()();
    [v3 setObject:v7 forKey:v8];

    _StringGuts.grow(_:)(32LL);
    swift_bridgeObjectRelease(0xE000000000000000LL);
    *(void *)(v0 + 64) = v5;
    *(void *)(v0 + 72) = v4;
    swift_bridgeObjectRetain(v4);
    uint64_t v9 = sub_100008A20(&qword_1000361E8);
    v10._countAndFlagsBits = String.init<A>(describing:)(v0 + 64, v9);
    object = v10._object;
    String.append(_:)(v10);
    swift_bridgeObjectRelease(object);
    _s17TVUpNextExtension23TopShelfContentProviderC3logyySSFZ_0(0xD00000000000001ELL, 0x80000001000296D0LL);
    swift_bridgeObjectRelease(0x80000001000296D0LL);
  }

  else
  {
    uint64_t v4 = *(void *)(v0 + 160);
  }

  uint64_t v12 = *(void *)(v0 + 24);
  uint64_t v13 = *(void *)(v0 + 32);
  uint64_t v14 = *(void *)(v0 + 104);
  uint64_t v15 = *(void *)(v0 + 80);
  uint64_t v16 = *(void *)(v15 + OBJC_IVAR____TtC17TVUpNextExtension23TopShelfContentProvider_stack);
  *(void *)(v15 + OBJC_IVAR____TtC17TVUpNextExtension23TopShelfContentProvider_stack) = v12;
  swift_retain(v12);
  swift_release(v16);
  uint64_t v17 = *(void *)(v15 + OBJC_IVAR____TtC17TVUpNextExtension23TopShelfContentProvider_objectGraph);
  *(void *)(v15 + OBJC_IVAR____TtC17TVUpNextExtension23TopShelfContentProvider_objectGraph) = v13;
  swift_release(v12);
  swift_bridgeObjectRelease(v4);
  swift_release(v17);
  swift_task_dealloc(v14);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_10000C8C8()
{
  uint64_t v1 = *(void *)(v0 + 128);
  id v3 = *(void **)(v0 + 112);
  NSString v2 = *(void **)(v0 + 120);
  uint64_t v4 = *(void *)(v0 + 104);
  swift_release_n(*(void *)(v0 + 136), 2LL);
  swift_bridgeObjectRelease(v1);

  swift_task_dealloc(v4);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

id TopShelfContentProvider.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for TopShelfContentProvider();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t sub_10000CA0C(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a1 + 24))
  {
    __int128 v4 = *(_OWORD *)(a1 + 16);
    v9[0] = *(_OWORD *)a1;
    v9[1] = v4;
    uint64_t v10 = *(void *)(a1 + 32);
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*v2);
    uint64_t v8 = *v2;
    void *v2 = 0x8000000000000000LL;
    sub_1000156C8((uint64_t)v9, a2, isUniquelyReferenced_nonNull_native);
    uint64_t v6 = *v2;
    void *v2 = v8;
    swift_bridgeObjectRelease(v6);
    return sub_1000169FC(a2);
  }

  else
  {
    sub_100023F4C(a1, &qword_100036218);
    sub_100014808(a2, (uint64_t)v9);
    sub_1000169FC(a2);
    return sub_100023F4C((uint64_t)v9, &qword_100036218);
  }

uint64_t sub_10000CAD0(uint64_t a1)
{
  unint64_t v2 = *(void *)(a1 + 16);
  id v3 = *v1;
  int64_t v4 = *((void *)*v1 + 2);
  int64_t v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
    goto LABEL_21;
  }

  char isUniquelyReferenced_nonNull_native = (char *)swift_isUniquelyReferenced_nonNull_native(*v1);
  if ((_DWORD)isUniquelyReferenced_nonNull_native && v5 <= *((void *)v3 + 3) >> 1)
  {
    unint64_t v8 = *(void *)(a1 + 16);
    if (v8) {
      goto LABEL_5;
    }
LABEL_18:
    if (!v2) {
      goto LABEL_19;
    }
    goto LABEL_21;
  }

  if (v4 <= v5) {
    int64_t v15 = v4 + v2;
  }
  else {
    int64_t v15 = v4;
  }
  id v3 = sub_100013930(isUniquelyReferenced_nonNull_native, v15, 1, v3);
  unint64_t v8 = *(void *)(a1 + 16);
  if (!v8) {
    goto LABEL_18;
  }
LABEL_5:
  uint64_t v9 = *((void *)v3 + 2);
  if ((*((void *)v3 + 3) >> 1) - v9 < (uint64_t)v8)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }

  unint64_t v10 = (unint64_t)&v3[16 * v9 + 32];
  if (a1 + 32 < v10 + 16 * v8 && v10 < a1 + 32 + 16 * v8) {
    goto LABEL_24;
  }
  swift_arrayInitWithCopy(v10);
  if (v8 < v2)
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }

  uint64_t v12 = *((void *)v3 + 2);
  BOOL v13 = __OFADD__(v12, v8);
  uint64_t v14 = v12 + v8;
  if (!v13)
  {
    *((void *)v3 + 2) = v14;
LABEL_19:
    uint64_t result = swift_bridgeObjectRelease(a1);
    void *v1 = v3;
    return result;
  }

LABEL_23:
  __break(1u);
LABEL_24:
  char v17 = 2;
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize overlapping range",  49LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  v17,  1092LL,  0);
  __break(1u);
  return result;
}

  __break(1u);
LABEL_24:
  char v17 = 2;
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize overlapping range",  49LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  v17,  1092LL,  0);
  __break(1u);
  return result;
}

uint64_t sub_10000CC24(uint64_t a1)
{
  unint64_t v2 = *(void *)(a1 + 16);
  id v3 = *v1;
  int64_t v4 = *((void *)*v1 + 2);
  int64_t v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
    goto LABEL_21;
  }

  char isUniquelyReferenced_nonNull_native = (char *)swift_isUniquelyReferenced_nonNull_native(*v1);
  if ((_DWORD)isUniquelyReferenced_nonNull_native && v5 <= *((void *)v3 + 3) >> 1)
  {
    unint64_t v8 = *(void *)(a1 + 16);
    if (v8) {
      goto LABEL_5;
    }
LABEL_18:
    if (!v2) {
      goto LABEL_19;
    }
    goto LABEL_21;
  }

  if (v4 <= v5) {
    int64_t v15 = v4 + v2;
  }
  else {
    int64_t v15 = v4;
  }
  id v3 = sub_100013A3C(isUniquelyReferenced_nonNull_native, v15, 1, v3);
  unint64_t v8 = *(void *)(a1 + 16);
  if (!v8) {
    goto LABEL_18;
  }
LABEL_5:
  uint64_t v9 = *((void *)v3 + 2);
  if ((*((void *)v3 + 3) >> 1) - v9 < (uint64_t)v8)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }

  unint64_t v10 = (unint64_t)&v3[40 * v9 + 32];
  if (a1 + 32 < v10 + 40 * v8 && v10 < a1 + 32 + 40 * v8) {
    goto LABEL_24;
  }
  sub_100008A20(&qword_1000363D8);
  swift_arrayInitWithCopy(v10);
  if (v8 < v2)
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }

  uint64_t v12 = *((void *)v3 + 2);
  BOOL v13 = __OFADD__(v12, v8);
  uint64_t v14 = v12 + v8;
  if (!v13)
  {
    *((void *)v3 + 2) = v14;
LABEL_19:
    uint64_t result = swift_bridgeObjectRelease(a1);
    void *v1 = v3;
    return result;
  }

void sub_10000CD98()
{
  uint64_t v1 = (void *)objc_opt_self(&OBJC_CLASS___NSDistributedNotificationCenter);
  id v2 = [v1 defaultCenter];
  [v2 removeObserver:v0 name:WLKDidReportPlaybackDistributedNotification object:0];

  id v3 = [v1 defaultCenter];
  [v3 removeObserver:v0 name:VUIUpNextRequestDidFinishCrossProcessNotification object:0];

  id v4 = [v1 defaultCenter];
  [v4 removeObserver:v0 name:VUIStoreAcquisitionCrossProcessNotification object:0];
}

void sub_10000CE84()
{
  uint64_t v1 = (os_unfair_lock_s *)(v0 + OBJC_IVAR____TtC17TVUpNextExtension23TopShelfContentProvider_cachePolicyLock);
  swift_beginAccess(v0 + OBJC_IVAR____TtC17TVUpNextExtension23TopShelfContentProvider_cachePolicyLock, v7, 33LL, 0LL);
  os_unfair_lock_lock(v1);
  id v2 = (unsigned __int8 *)objc_retain(*(id *)(v0
                                            + OBJC_IVAR____TtC17TVUpNextExtension23TopShelfContentProvider__cachePolicy));
  os_unfair_lock_unlock(v1);
  swift_endAccess(v7);
  uint64_t v3 = v2[OBJC_IVAR____TtC17TVUpNextExtensionP33_CEB3B327E539852F953463821CB150CF11CachePolicy_policy];
  int v4 = *(_DWORD *)&v2[OBJC_IVAR____TtC17TVUpNextExtensionP33_CEB3B327E539852F953463821CB150CF11CachePolicy_policy + 16];

  if (v3 != 2)
  {
    id v5 = [(id)objc_opt_self(NSDistributedNotificationCenter) defaultCenter];
    uint64_t v6 = v5;
    if ((v4 & 1) != 0)
    {
      [v5 addObserver:v0 selector:"cacheInvalidationEventOccurred" name:WLKDidReportPlaybackDistributedNotification object:0];
      if ((v4 & 0x100) == 0)
      {
LABEL_4:
        if ((v4 & 0x10000) == 0)
        {
LABEL_6:

          return;
        }

void sub_10000CFD4()
{
  uint64_t v1 = v0;
  id v2 = (os_unfair_lock_s *)(v0 + OBJC_IVAR____TtC17TVUpNextExtension23TopShelfContentProvider_cachePolicyLock);
  swift_beginAccess(v0 + OBJC_IVAR____TtC17TVUpNextExtension23TopShelfContentProvider_cachePolicyLock, v10, 33LL, 0LL);
  os_unfair_lock_lock(v2);
  uint64_t v3 = OBJC_IVAR____TtC17TVUpNextExtension23TopShelfContentProvider__cachePolicy;
  int v4 = *(id *)(v0 + OBJC_IVAR____TtC17TVUpNextExtension23TopShelfContentProvider__cachePolicy);
  os_unfair_lock_unlock(v2);
  swift_endAccess(v10);
  v4[OBJC_IVAR____TtC17TVUpNextExtensionP33_CEB3B327E539852F953463821CB150CF11CachePolicy_cacheIsValid] = 0;
  uint64_t v5 = OBJC_IVAR____TtC17TVUpNextExtensionP33_CEB3B327E539852F953463821CB150CF11CachePolicy_ttl;
  uint64_t v6 = *(void *)&v4[OBJC_IVAR____TtC17TVUpNextExtensionP33_CEB3B327E539852F953463821CB150CF11CachePolicy_ttl];
  if (v6)
  {
    uint64_t v7 = swift_retain(*(void *)&v4[OBJC_IVAR____TtC17TVUpNextExtensionP33_CEB3B327E539852F953463821CB150CF11CachePolicy_ttl]);
    dispatch thunk of DispatchWorkItem.cancel()(v7);
    swift_release(v6);
    uint64_t v6 = *(void *)&v4[v5];
  }

  *(void *)&v4[v5] = 0LL;

  swift_release(v6);
  swift_beginAccess(v2, v10, 33LL, 0LL);
  os_unfair_lock_lock(v2);
  unint64_t v8 = (unsigned __int8 *)*(id *)(v1 + v3);
  os_unfair_lock_unlock(v2);
  swift_endAccess(v10);
  int v9 = v8[OBJC_IVAR____TtC17TVUpNextExtensionP33_CEB3B327E539852F953463821CB150CF11CachePolicy_cacheReflectsUpNextContent];

  if (v9 == 1)
  {
    _s17TVUpNextExtension23TopShelfContentProviderC3logyySSFZ_0(0xD000000000000036LL, 0x8000000100029580LL);
    [(id)objc_opt_self(TVTopShelfContentProvider) topShelfContentDidChange];
  }

id sub_10000D170( void *a1, uint64_t a2, uint64_t a3, uint64_t a4, void (*a5)(uint64_t, uint64_t, uint64_t))
{
  uint64_t v8 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  uint64_t v10 = v9;
  uint64_t v11 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a4, (char *)&type metadata for Swift.AnyObject + 8);
  id v12 = a1;
  a5(v8, v10, v11);
  uint64_t v14 = v13;

  swift_bridgeObjectRelease(v10);
  swift_bridgeObjectRelease(v11);
  NSString v15 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v14);
  return v15;
}

void TopShelfContentProvider.getFeatureFlags()()
{
  id v0 = [(id)objc_opt_self(VUIFeatureManager) sharedInstance];
  if (v0)
  {
    uint64_t v1 = v0;
    id v2 = [v0 osFeatureFlagsJSON];

    if (v2)
    {
      static Dictionary._unconditionallyBridgeFromObjectiveC(_:)( v2,  &type metadata for AnyHashable,  (char *)&type metadata for Any + 8,  &protocol witness table for AnyHashable);

      return;
    }
  }

  else
  {
    __break(1u);
  }

  __break(1u);
}

void sub_10000D3EC(_BYTE *a1@<X8>)
{
  *a1 = 0;
}

uint64_t sub_10000D3F4@<X0>(_BYTE *a1@<X8>)
{
  uint64_t v2 = type metadata accessor for JSONObject(0LL);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin();
  uint64_t v5 = (char *)&v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v6 = JSONObject.subscript.getter(0x614365726F6E6769LL, 0xEB00000000656863LL);
  char v7 = JSONObject.BOOL.getter(v6);
  uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  *a1 = v7 & 1;
  return result;
}

uint64_t sub_10000D4B0()
{
  return static NetRequestProperty.value(from:)();
}

uint64_t sub_10000D4C4(char *a1)
{
  return sub_10001867C(*a1);
}

uint64_t sub_10000D4DC(uint64_t a1, uint64_t a2)
{
  uint64_t KeyPath = swift_getKeyPath(&unk_100028580);
  unint64_t v4 = sub_100024C50();
  uint64_t v5 = static NetRequestPropertyCollectionBuilder.buildExpression<A, B>(_:)(KeyPath, a2, v4);
  swift_release(KeyPath);
  uint64_t v6 = sub_100008A20(&qword_100036418);
  uint64_t v7 = swift_allocObject(v6, 40LL, 7LL);
  *(_OWORD *)(v7 + 16) = xmmword_100027590;
  *(void *)(v7 + 32) = v5;
  uint64_t v8 = static NetRequestPropertyCollectionBuilder.buildBlock(_:)();
  swift_bridgeObjectRelease(v7);
  return v8;
}

uint64_t sub_10000D568(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = a2;
  return swift_task_switch(sub_10000D580, 0LL, 0LL);
}

uint64_t sub_10000D580()
{
  uint64_t v1 = *(void *)(v0 + 16);
  uint64_t v2 = *(void *)(v0 + 24);
  uint64_t v3 = type metadata accessor for NetRequest(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 16LL))(v1, v2, v3);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

void sub_10000D5D0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = type metadata accessor for URL(0LL);
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v23 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  unint64_t v12 = sub_100024C50();
  uint64_t v13 = NetRequest.subscript.getter( aBlock,  &type metadata for TopShelfRequestEncoder.PropertyScope.IgnoreCacheProperty,  &type metadata for TopShelfRequestEncoder.PropertyScope.IgnoreCacheProperty,  v12);
  int v24 = LOBYTE(aBlock[0]);
  uint64_t v14 = NetRequest.url.getter(v13);
  uint64_t v15 = URL.path.getter(v14);
  uint64_t v17 = v16;
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  uint64_t v18 = (void *)swift_allocObject(&unk_100032460, 48LL, 7LL);
  void v18[2] = a3;
  v18[3] = a4;
  v18[4] = a1;
  v18[5] = a2;
  swift_retain(a4);
  swift_retain(a2);
  _s17TVUpNextExtension23TopShelfContentProviderC3logyySSFZ_0(0xD000000000000016LL, 0x8000000100029A10LL);
  id v19 = [(id)objc_opt_self(WLKConfigurationManager) sharedInstance];
  uint64_t v20 = swift_allocObject(&unk_100032488, 49LL, 7LL);
  *(void *)(v20 + 16) = sub_100024DE4;
  *(void *)(v20 + 24) = v18;
  *(void *)(v20 + 32) = v15;
  *(void *)(v20 + 40) = v17;
  *(_BYTE *)(v20 + 48) = v24;
  aBlock[4] = sub_100024E44;
  uint64_t v26 = v20;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256LL;
  aBlock[2] = sub_10000D978;
  aBlock[3] = &unk_1000324A0;
  uint64_t v21 = _Block_copy(aBlock);
  uint64_t v22 = v26;
  swift_retain(v18);
  swift_bridgeObjectRetain(v17);
  swift_release(v22);
  [v19 fetchConfigurationWithCompletionHandler:v21];
  _Block_release(v21);
  swift_bridgeObjectRelease(v17);
  swift_release(v18);
}

uint64_t sub_10000D7D4( uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, void (*a5)(void), uint64_t a6, uint64_t a7, uint64_t a8)
{
  v26[0] = a7;
  v26[1] = a8;
  uint64_t v13 = type metadata accessor for String.Encoding(0LL);
  __chkstk_darwin(v13);
  uint64_t v15 = (char *)v26 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v16 = type metadata accessor for NetResponse(0LL);
  uint64_t v17 = *(void *)(v16 - 8);
  __chkstk_darwin(v16);
  id v19 = (char *)v26 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  if (a4)
  {
    swift_errorRetain(a4);
    ((void (*)(uint64_t))a5)(a4);
    return swift_errorRelease(a4);
  }

  else if (a2 >> 60 == 15)
  {
    unint64_t v21 = sub_10002544C();
    uint64_t v22 = swift_allocError(&type metadata for TopShelfContentProviderError, v21, 0LL, 0LL);
    *uint64_t v23 = 2;
    a5();
    return swift_errorRelease(v22);
  }

  else
  {
    sub_1000254E8(a1, a2);
    uint64_t v24 = NetResponse.init(status:)(a3);
    static String.Encoding.utf8.getter(v24);
    uint64_t v25 = String.init(data:encoding:)(a1, a2, v15);
    NetResponse.body.setter(v25);
    ((void (*)(char *))v26[0])(v19);
    sub_100025490(a1, a2);
    return (*(uint64_t (**)(char *, uint64_t))(v17 + 8))(v19, v16);
  }

void sub_10000D978(uint64_t a1, void *a2, void *a3)
{
  uint64_t v6 = *(void (**)(id, void *))(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  swift_retain(v5);
  id v8 = a2;
  id v7 = a3;
  v6(v8, a3);
  swift_release(v5);
}

uint64_t sub_10000D9EC(uint64_t a1, uint64_t a2)
{
  v2[7] = a1;
  v2[8] = a2;
  uint64_t v3 = type metadata accessor for NetRequest(0LL);
  void v2[9] = v3;
  uint64_t v4 = *(void *)(v3 - 8);
  v2[10] = v4;
  uint64_t v5 = *(void *)(v4 + 64);
  v2[11] = v5;
  v2[12] = swift_task_alloc((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  return swift_task_switch(sub_10000DA50, 0LL, 0LL);
}

uint64_t sub_10000DA50()
{
  uint64_t v2 = v0[11];
  uint64_t v1 = v0[12];
  uint64_t v3 = v0[9];
  uint64_t v4 = v0[10];
  uint64_t v5 = v0[8];
  uint64_t v6 = sub_100008A20(&qword_100036420);
  v0[5] = type metadata accessor for SyncTaskScheduler(0LL);
  v0[6] = &protocol witness table for SyncTaskScheduler;
  sub_100024C94(v0 + 2);
  SyncTaskScheduler.init()();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16))(v1, v5, v3);
  uint64_t v7 = *(unsigned __int8 *)(v4 + 80);
  uint64_t v8 = (v7 + 16) & ~v7;
  uint64_t v9 = swift_allocObject(&unk_100032438, v8 + v2, v7 | 7);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 32))(v9 + v8, v1, v3);
  v0[13] = Promise.__allocating_init(on:executor:)(v0 + 2, sub_100024D30, v9);
  uint64_t v10 = sub_100024D94(&qword_100036428, &qword_100036420, (uint64_t)&protocol conformance descriptor for Promise<A>);
  uint64_t v11 = (void *)swift_task_alloc(async function pointer to dispatch thunk of Future.then()[1]);
  v0[14] = v11;
  void *v11 = v0;
  v11[1] = sub_10000DB98;
  return dispatch thunk of Future.then()(v0[7], v6, v10);
}

uint64_t sub_10000DB98()
{
  uint64_t v2 = *(void *)(*(void *)v1 + 112LL);
  *(void *)(*(void *)v1 + 12swift_unknownObjectWeakInit(&v0[OBJC_IVAR____TtC17TVUpNextExtension23TopShelfContentProvider_delegate], 0LL) = v0;
  swift_task_dealloc(v2);
  if (v0) {
    uint64_t v3 = sub_10000DC38;
  }
  else {
    uint64_t v3 = sub_10000DBFC;
  }
  return swift_task_switch(v3, 0LL, 0LL);
}

uint64_t sub_10000DBFC()
{
  uint64_t v1 = *(void *)(v0 + 96);
  swift_release(*(void *)(v0 + 104));
  swift_task_dealloc(v1);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_10000DC38()
{
  uint64_t v1 = *(void *)(v0 + 96);
  swift_release(*(void *)(v0 + 104));
  swift_task_dealloc(v1);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t TopShelfContentProvider.fetchUpNextContent(completion:)( uint64_t (*a1)(void, void), uint64_t a2)
{
  uint64_t v5 = (void *)swift_allocObject(&unk_100031590, 40LL, 7LL);
  v5[2] = v2;
  v5[3] = a1;
  void v5[4] = a2;
  int v6 = v2[OBJC_IVAR____TtC17TVUpNextExtension23TopShelfContentProvider_startupComplete];
  uint64_t v7 = v2;
  swift_retain_n(a2, 2LL);
  uint64_t v8 = v7;
  uint64_t v9 = v8;
  if (v6 == 1)
  {
    sub_10000DE7C(v8, a1, a2);
  }

  else
  {
    _s17TVUpNextExtension23TopShelfContentProviderC3logyySSFZ_0(0xD00000000000001BLL, 0x8000000100028CF0LL);
    uint64_t v10 = &v9[OBJC_IVAR____TtC17TVUpNextExtension23TopShelfContentProvider_startupInvocations];
    swift_beginAccess( &v9[OBJC_IVAR____TtC17TVUpNextExtension23TopShelfContentProvider_startupInvocations],  v22,  1LL,  0LL);
    if (!*(void *)v10)
    {
      *(void *)uint64_t v10 = &_swiftEmptyArrayStorage;
      swift_bridgeObjectRelease(0LL);
    }

    unint64_t v12 = sub_10000ADC4((uint64_t)v21);
    if (*v11)
    {
      uint64_t v13 = v11;
      uint64_t v14 = swift_allocObject(&unk_1000315B8, 32LL, 7LL);
      *(void *)(v14 + 16) = sub_100018650;
      *(void *)(v14 + 24) = v5;
      uint64_t v15 = *v13;
      swift_retain(v5);
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(v15);
      *uint64_t v13 = v15;
      if ((isUniquelyReferenced_nonNull_native & 1) == 0)
      {
        uint64_t v15 = sub_100013824(0LL, *((void *)v15 + 2) + 1LL, 1, v15);
        *uint64_t v13 = v15;
      }

      unint64_t v18 = *((void *)v15 + 2);
      unint64_t v17 = *((void *)v15 + 3);
      if (v18 >= v17 >> 1)
      {
        uint64_t v15 = sub_100013824((char *)(v17 > 1), v18 + 1, 1, v15);
        *uint64_t v13 = v15;
      }

      *((void *)v15 + 2) = v18 + 1;
      id v19 = &v15[16 * v18];
      *((void *)v19 + 4) = sub_10001865C;
      *((void *)v19 + 5) = v14;
    }

    ((void (*)(_BYTE *, void))v12)(v21, 0LL);
  }

  swift_release(v5);
  return swift_release(a2);
}

uint64_t sub_10000DE7C(char *a1, uint64_t (*a2)(void, void), uint64_t a3)
{
  uint64_t v6 = sub_100008A20(&qword_100035F00);
  __chkstk_darwin(v6);
  uint64_t v8 = (char *)&v34 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  v43[0] = 0LL;
  v43[1] = 0LL;
  char v44 = 1;
  v41[0] = 0LL;
  v41[1] = 0LL;
  char v42 = 1;
  v39[1] = 0LL;
  v39[0] = 0LL;
  char v40 = 1;
  v37[1] = 0LL;
  v37[0] = 0LL;
  char v38 = 1;
  int v35 = 0;
  uint64_t v9 = (os_unfair_lock_s *)&a1[OBJC_IVAR____TtC17TVUpNextExtension23TopShelfContentProvider_cachePolicyLock];
  char v36 = 1;
  swift_beginAccess(&a1[OBJC_IVAR____TtC17TVUpNextExtension23TopShelfContentProvider_cachePolicyLock], v45, 33LL, 0LL);
  os_unfair_lock_lock(v9);
  uint64_t v10 = *(id *)&a1[OBJC_IVAR____TtC17TVUpNextExtension23TopShelfContentProvider__cachePolicy];
  os_unfair_lock_unlock(v9);
  swift_endAccess(v45);
  char v11 = v10[OBJC_IVAR____TtC17TVUpNextExtensionP33_CEB3B327E539852F953463821CB150CF11CachePolicy_cacheIsValid];

  id v12 = sub_100016EB0();
  id v13 = [(id)objc_opt_self(WLKSystemPreferencesStore) sharedPreferences];
  LODWORD(v10) = [v13 upNextLockupsUseCoverArt];

  double v14 = sub_10000E164((uint64_t)v43, 0LL);
  double v16 = v15;
  double v17 = sub_10000E164((uint64_t)v41, 1LL);
  double v19 = v18;
  double v20 = sub_10000E164((uint64_t)v39, 2LL);
  double v22 = v21;
  double v23 = sub_10000E1EC((uint64_t)v37);
  double v25 = v24;
  float v26 = sub_10000E26C(&v35);
  sub_1000187BC((v11 & 1) == 0, (uint64_t)v12, (int)v10, (uint64_t)v45, v14, v16, v17, v19, v20, v22, v23, v25, v26);
  uint64_t v27 = *(void *)&a1[OBJC_IVAR____TtC17TVUpNextExtension23TopShelfContentProvider_objectGraph];
  if (v27)
  {
    uint64_t v28 = type metadata accessor for TaskPriority(0LL);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v28 - 8) + 56LL))(v8, 1LL, 1LL, v28);
    uint64_t v29 = swift_allocObject(&unk_1000323D0, 128LL, 7LL);
    __int128 v30 = v45[1];
    *(_OWORD *)(v29 + 40) = v45[0];
    *(void *)(v29 + 16) = 0LL;
    *(void *)(v29 + 24) = 0LL;
    *(void *)(v29 + 32) = a1;
    *(_OWORD *)(v29 + 56) = v30;
    *(_OWORD *)(v29 + 72) = v46[0];
    *(_OWORD *)(v29 + 84) = *(_OWORD *)((char *)v46 + 12);
    *(void *)(v29 + 104) = v27;
    *(void *)(v29 + 112) = a2;
    *(void *)(v29 + 120) = a3;
    swift_retain(v27);
    uint64_t v31 = a1;
    swift_retain(a3);
    uint64_t v32 = sub_10000EB34((uint64_t)v8, (uint64_t)&unk_100036380, v29);
    return swift_release(v32);
  }

  else
  {
    sub_100024000((uint64_t)v45);
    return a2(0LL, 0LL);
  }

double sub_10000E164(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(a1 + 16) & 1) == 0) {
    return *(double *)a1;
  }
  [(id)objc_opt_self(TVTopShelfSectionedContent) imageSizeForImageShape:a2];
  double v4 = v3;
  uint64_t v6 = v5;
  swift_beginAccess(a1, v8, 1LL, 0LL);
  *(double *)a1 = v4;
  *(void *)(a1 + 8) = v6;
  *(_BYTE *)(a1 + 16) = 0;
  return v4;
}

double sub_10000E1EC(uint64_t a1)
{
  if ((*(_BYTE *)(a1 + 16) & 1) == 0) {
    return *(double *)a1;
  }
  [(id)objc_opt_self(TVTopShelfSectionedItem) _topRightImageSize];
  double v3 = v2;
  uint64_t v5 = v4;
  swift_beginAccess(a1, v7, 1LL, 0LL);
  *(double *)a1 = v3;
  *(void *)(a1 + 8) = v5;
  *(_BYTE *)(a1 + 16) = 0;
  return v3;
}

float sub_10000E26C(_BYTE *a1)
{
  if ((a1[4] & 1) == 0) {
    return *(float *)a1;
  }
  if (qword_100036680 != -1) {
    swift_once(&qword_100036680, sub_10000AEC0);
  }
  float v2 = MGGetFloat32Answer(qword_100036688, 2.0);
  swift_beginAccess(a1, v4, 1LL, 0LL);
  *(float *)a1 = v2;
  a1[4] = 0;
  return v2;
}

double sub_10000E304@<D0>( uint64_t a1@<X0>, uint64_t a2@<X1>, int a3@<W2>, _OWORD *a4@<X8>, double a5@<D0>, double a6@<D1>, double a7@<D2>, double a8@<D3>, double a9@<D4>, double a10@<D5>, double a11@<D6>, double a12@<D7>, float a13)
{
  __int128 v14 = v16[1];
  *a4 = v16[0];
  a4[1] = v14;
  a4[2] = v17[0];
  double result = *(double *)((char *)v17 + 12);
  *(_OWORD *)((char *)a4 + 44) = *(_OWORD *)((char *)v17 + 12);
  return result;
}

uint64_t sub_10000E350( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v8[52] = a7;
  v8[53] = a8;
  v8[50] = a5;
  v8[51] = a6;
  v8[49] = a4;
  return swift_task_switch(sub_10000E370, 0LL, 0LL);
}

uint64_t sub_10000E370()
{
  uint64_t v1 = *(void *)(v0 + 392);
  _s17TVUpNextExtension23TopShelfContentProviderC3logyySSFZ_0(0xD00000000000001CLL, 0x8000000100029500LL);
  uint64_t v2 = *(void *)(v1 + OBJC_IVAR____TtC17TVUpNextExtension23TopShelfContentProvider_stack);
  *(void *)(v0 + 432) = v2;
  if (v2)
  {
    double v3 = *(_OWORD **)(v0 + 400);
    __int128 v5 = v3[1];
    __int128 v4 = v3[2];
    __int128 v6 = *(_OWORD *)((char *)v3 + 44);
    *(_OWORD *)(v0 + 248) = *v3;
    *(_OWORD *)(v0 + 292) = v6;
    *(_OWORD *)(v0 + 264) = v5;
    *(_OWORD *)(v0 + 280) = v4;
    uint64_t v7 = *((unsigned int *)&async function pointer to JSStack.dispatch<A>(_:objectGraph:) + 1);
    swift_retain(v2);
    uint64_t v8 = (void *)swift_task_alloc(v7);
    *(void *)(v0 + 440) = v8;
    unint64_t v9 = sub_1000240AC();
    void *v8 = v0;
    v8[1] = sub_10000E544;
    return JSStack.dispatch<A>(_:objectGraph:)( v0 + 312,  v0 + 248,  *(void *)(v0 + 408),  &type metadata for FetchUpNextContentIntent,  v9);
  }

  else
  {
    char v11 = *(void (**)(void, void))(v0 + 416);
    uint64_t v12 = *(void *)(v0 + 392);
    id v13 = objc_allocWithZone((Class)type metadata accessor for CachePolicy());
    __int128 v14 = sub_100013244(2LL, 0LL, 0, 1);
    double v15 = (os_unfair_lock_s *)(v12 + OBJC_IVAR____TtC17TVUpNextExtension23TopShelfContentProvider_cachePolicyLock);
    swift_beginAccess( v12 + OBJC_IVAR____TtC17TVUpNextExtension23TopShelfContentProvider_cachePolicyLock,  v0 + 344,  33LL,  0LL);
    double v16 = v14;
    os_unfair_lock_lock(v15);
    swift_endAccess(v0 + 344);
    double v17 = *(void **)(v12 + OBJC_IVAR____TtC17TVUpNextExtension23TopShelfContentProvider__cachePolicy);
    *(void *)(v12 + OBJC_IVAR____TtC17TVUpNextExtension23TopShelfContentProvider__cachePolicy) = v16;
    double v18 = v16;

    swift_beginAccess(v15, v0 + 368, 33LL, 0LL);
    os_unfair_lock_unlock(v15);
    swift_endAccess(v0 + 368);

    sub_10000CD98();
    sub_10000CE84();

    v11(0LL, 0LL);
    return (*(uint64_t (**)(void))(v0 + 8))();
  }

uint64_t sub_10000E544()
{
  uint64_t v3 = *(void *)(*(void *)v1 + 432LL);
  uint64_t v2 = *(void *)(*(void *)v1 + 440LL);
  *(void *)(*(void *)v1 + 448LL) = v0;
  swift_task_dealloc(v2);
  swift_release(v3);
  if (v0) {
    __int128 v4 = sub_10000EAD4;
  }
  else {
    __int128 v4 = sub_10000E5B0;
  }
  return swift_task_switch(v4, 0LL, 0LL);
}

uint64_t sub_10000E5B0()
{
  uint64_t v1 = *(void *)(v0 + 312);
  if (*(_BYTE *)(v0 + 337)) {
    int v2 = 256;
  }
  else {
    int v2 = 0;
  }
  if (*(_BYTE *)(v0 + 338)) {
    int v3 = 0x10000;
  }
  else {
    int v3 = 0;
  }
  if (*(_BYTE *)(v0 + 339)) {
    int v4 = 0x1000000;
  }
  else {
    int v4 = 0;
  }
  if (v1)
  {
    uint64_t v56 = *(void *)(v0 + 328);
    uint64_t v57 = *(unsigned __int8 *)(v0 + 320);
    int v5 = v2 | *(unsigned __int8 *)(v0 + 336) | v3 | v4;
    uint64_t v6 = *(void *)(v1 + 16);
    if (v6)
    {
      swift_bridgeObjectRetain(v1);
      uint64_t v7 = 32LL;
      do
      {
        __int128 v8 = *(_OWORD *)(v1 + v7);
        __int128 v9 = *(_OWORD *)(v1 + v7 + 32);
        *(_OWORD *)(v0 + 32) = *(_OWORD *)(v1 + v7 + 16);
        *(_OWORD *)(v0 + 48) = v9;
        *(_OWORD *)(v0 + 16) = v8;
        __int128 v10 = *(_OWORD *)(v1 + v7 + 48);
        __int128 v11 = *(_OWORD *)(v1 + v7 + 64);
        __int128 v12 = *(_OWORD *)(v1 + v7 + 96);
        *(_OWORD *)(v0 + 96) = *(_OWORD *)(v1 + v7 + 80);
        *(_OWORD *)(v0 + 112) = v12;
        *(_OWORD *)(v0 + 64) = v10;
        *(_OWORD *)(v0 + 80) = v11;
        __int128 v13 = *(_OWORD *)(v1 + v7 + 112);
        __int128 v14 = *(_OWORD *)(v1 + v7 + 128);
        __int128 v15 = *(_OWORD *)(v1 + v7 + 160);
        *(_OWORD *)(v0 + 160) = *(_OWORD *)(v1 + v7 + 144);
        *(_OWORD *)(v0 + 176) = v15;
        *(_OWORD *)(v0 + 128) = v13;
        *(_OWORD *)(v0 + 144) = v14;
        __int128 v16 = *(_OWORD *)(v1 + v7 + 176);
        __int128 v17 = *(_OWORD *)(v1 + v7 + 192);
        __int128 v18 = *(_OWORD *)(v1 + v7 + 208);
        *(void *)(v0 + 240) = *(void *)(v1 + v7 + 224);
        *(_OWORD *)(v0 + 208) = v17;
        *(_OWORD *)(v0 + 224) = v18;
        *(_OWORD *)(v0 + 192) = v16;
        sub_1000240F0((void *)(v0 + 16));
        double v19 = (void *)sub_100019090(v0 + 16);
        sub_1000241F0((void *)(v0 + 16));
        id v20 = v19;
        specialized Array._makeUniqueAndReserveCapacityIfNotUnique()(v20);
        unint64_t v22 = *(void *)(((unint64_t)&_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8LL) + 0x10);
        unint64_t v21 = *(void *)(((unint64_t)&_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8LL) + 0x18);
        if (v22 >= v21 >> 1) {
          specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v21 > 1, v22 + 1, 1LL);
        }
        uint64_t v23 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v22, v20);
        specialized Array._endMutation()(v23);

        v7 += 232LL;
        --v6;
      }

      while (v6);
      swift_bridgeObjectRelease(v1);
      if (!((unint64_t)&_swiftEmptyArrayStorage >> 62))
      {
LABEL_17:
        if (*(void *)(((unint64_t)&_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFF8LL) + 0x10))
        {
LABEL_18:
          id v24 = objc_allocWithZone(&OBJC_CLASS___TVTopShelfItemCollection);
          sub_10000A134(0LL, &qword_100036258, &OBJC_CLASS___TVTopShelfSectionedItem_ptr);
          swift_bridgeObjectRetain(&_swiftEmptyArrayStorage);
          Class isa = Array._bridgeToObjectiveC()().super.isa;
          swift_bridgeObjectRelease(&_swiftEmptyArrayStorage);
          id v26 = [v24 initWithItems:isa];

          char v27 = TVAppFeature.isEnabled.getter(25LL);
          if ((v27 & 1) != 0) {
            uint64_t v28 = 0xD000000000000011LL;
          }
          else {
            uint64_t v28 = 0x5458454E5F5055LL;
          }
          if ((v27 & 1) != 0) {
            uint64_t v29 = (void *)0x8000000100029540LL;
          }
          else {
            uint64_t v29 = (void *)0xE700000000000000LL;
          }
          __int128 v30 = (void *)objc_opt_self(&OBJC_CLASS___NSBundle);
          id v31 = v26;
          uint64_t v32 = (NSBundle *)[v30 mainBundle];
          v59._countAndFlagsBits = 0xD000000000000017LL;
          v59._object = (void *)0x8000000100029520LL;
          v33._countAndFlagsBits = v28;
          v33._object = v29;
          v34._countAndFlagsBits = 0LL;
          v34._object = (void *)0xE000000000000000LL;
          object = NSLocalizedString(_:tableName:bundle:value:comment:)(v33, (Swift::String_optional)0, v32, v34, v59)._object;
          swift_bridgeObjectRelease(v29);

          NSString v36 = String._bridgeToObjectiveC()();
          swift_bridgeObjectRelease(object);
          [v31 setTitle:v36];

          id v37 = v31;
          specialized Array._makeUniqueAndReserveCapacityIfNotUnique()(v37);
          unint64_t v39 = *(void *)(((unint64_t)&_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8LL) + 0x10);
          unint64_t v38 = *(void *)(((unint64_t)&_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8LL) + 0x18);
          if (v39 >= v38 >> 1) {
            specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v38 > 1, v39 + 1, 1LL);
          }
          uint64_t v40 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v39, v37);
          specialized Array._endMutation()(v40);
          swift_bridgeObjectRelease(&_swiftEmptyArrayStorage);
          id v41 = objc_allocWithZone(&OBJC_CLASS___TVTopShelfSectionedContent);
          sub_100008A20(&qword_100036260);
          Class v42 = Array._bridgeToObjectiveC()().super.isa;
          swift_bridgeObjectRelease(&_swiftEmptyArrayStorage);
          id v43 = [v41 initWithSections:v42];

          swift_bridgeObjectRelease(v1);
          goto LABEL_34;
        }

LABEL_33:
        swift_bridgeObjectRelease(&_swiftEmptyArrayStorage);
        swift_bridgeObjectRelease(v1);
        id v43 = 0LL;
LABEL_34:
        uint64_t v44 = v56;
        uint64_t v45 = v57;
        goto LABEL_35;
      }
    }

    else if (!((unint64_t)&_swiftEmptyArrayStorage >> 62))
    {
      goto LABEL_17;
    }

    else {
      uint64_t v46 = (void *)((unint64_t)&_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8LL);
    }
    swift_bridgeObjectRetain(&_swiftEmptyArrayStorage);
    uint64_t v47 = _CocoaArrayWrapper.endIndex.getter(v46);
    swift_bridgeObjectRelease(&_swiftEmptyArrayStorage);
    if (v47) {
      goto LABEL_18;
    }
    goto LABEL_33;
  }

  uint64_t v44 = 0LL;
  int v5 = 0;
  id v43 = 0LL;
  uint64_t v45 = 2LL;
LABEL_35:
  v58 = *(void (**)(id, void))(v0 + 416);
  uint64_t v48 = *(void *)(v0 + 392);
  id v49 = objc_allocWithZone((Class)type metadata accessor for CachePolicy());
  v50 = sub_100013244(v45, v44, v5, 1);
  v51 = (os_unfair_lock_s *)(v48 + OBJC_IVAR____TtC17TVUpNextExtension23TopShelfContentProvider_cachePolicyLock);
  swift_beginAccess( v48 + OBJC_IVAR____TtC17TVUpNextExtension23TopShelfContentProvider_cachePolicyLock,  v0 + 344,  33LL,  0LL);
  v52 = v50;
  os_unfair_lock_lock(v51);
  swift_endAccess(v0 + 344);
  v53 = *(void **)(v48 + OBJC_IVAR____TtC17TVUpNextExtension23TopShelfContentProvider__cachePolicy);
  *(void *)(v48 + OBJC_IVAR____TtC17TVUpNextExtension23TopShelfContentProvider__cachePolicy) = v52;
  v54 = v52;

  swift_beginAccess(v51, v0 + 368, 33LL, 0LL);
  os_unfair_lock_unlock(v51);
  swift_endAccess(v0 + 368);

  sub_10000CD98();
  sub_10000CE84();

  v58(v43, 0LL);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

    __int128 v11 = (v24 - 1) & v24;
    unint64_t v21 = __clz(__rbit64(v24)) + (v14 << 6);
LABEL_34:
    __int128 v30 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v21);
    uint64_t v32 = *v30;
    id v31 = v30[1];
    Swift::String v33 = *(void *)(*(void *)(v5 + 56) + 8 * v21);
    if ((v38 & 1) == 0) {
      swift_bridgeObjectRetain(v30[1]);
    }
    Hasher.init(_seed:)(v39, *(void *)(v8 + 40));
    String.hash(into:)(v39, v32, v31);
    double result = Hasher._finalize()();
    __int128 v15 = -1LL << *(_BYTE *)(v8 + 32);
    __int128 v16 = result & ~v15;
    __int128 v17 = v16 >> 6;
    if (((-1LL << v16) & ~*(void *)(v12 + 8 * (v16 >> 6))) != 0)
    {
      __int128 v18 = __clz(__rbit64((-1LL << v16) & ~*(void *)(v12 + 8 * (v16 >> 6)))) | v16 & 0x7FFFFFFFFFFFFFC0LL;
    }

    else
    {
      id v26 = 0;
      char v27 = (unint64_t)(63 - v15) >> 6;
      do
      {
        if (++v17 == v27 && (v26 & 1) != 0)
        {
          __break(1u);
          goto LABEL_44;
        }

        uint64_t v28 = v17 == v27;
        if (v17 == v27) {
          __int128 v17 = 0LL;
        }
        v26 |= v28;
        uint64_t v29 = *(void *)(v12 + 8 * v17);
      }

      while (v29 == -1);
      __int128 v18 = __clz(__rbit64(~v29)) + (v17 << 6);
    }

    *(void *)(v12 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8LL)) |= 1LL << v18;
    double v19 = (void *)(*(void *)(v8 + 48) + 16 * v18);
    void *v19 = v32;
    v19[1] = v31;
    *(void *)(*(void *)(v8 + 56) + 8 * v18) = v33;
    ++*(void *)(v8 + 16);
  }

  swift_release(v5);
  int v3 = v35;
  uint64_t v23 = (void *)(v5 + 64);
  if ((v38 & 1) == 0) {
    goto LABEL_43;
  }
LABEL_39:
  Swift::String v34 = 1LL << *(_BYTE *)(v5 + 32);
  if (v34 >= 64) {
    bzero(v23, ((unint64_t)(v34 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8LL);
  }
  else {
    *uint64_t v23 = -1LL << v34;
  }
  *(void *)(v5 + 16) = 0LL;
LABEL_43:
  double result = swift_release(v5);
  *int v3 = v8;
  return result;
}

      swift_bridgeObjectRelease(a3);
      goto LABEL_34;
    }
  }

  double result = _assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  0xD00000000000002BLL,  0x8000000100029760LL,  "TVUpNextExtension/TopShelfContentProvider.swift",  47LL,  2LL,  342LL,  0);
  __break(1u);
  return result;
}

uint64_t sub_10000EAD4()
{
  uint64_t v1 = *(void *)(v0 + 448);
  int v2 = *(void (**)(void, uint64_t))(v0 + 416);
  swift_errorRetain(v1);
  v2(0LL, v1);
  swift_errorRelease(v1);
  swift_errorRelease(v1);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_10000EB34(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for TaskPriority(0LL);
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1LL, v6) == 1)
  {
    sub_100023F4C(a1, &qword_100035F00);
    uint64_t v8 = 7168LL;
    uint64_t v9 = *(void *)(a3 + 16);
    if (v9)
    {
LABEL_3:
      uint64_t v10 = *(void *)(a3 + 24);
      uint64_t ObjectType = swift_getObjectType(v9);
      swift_unknownObjectRetain(v9, v12);
      uint64_t v13 = dispatch thunk of Actor.unownedExecutor.getter(ObjectType, v10);
      uint64_t v15 = v14;
      swift_unknownObjectRelease(v9);
      goto LABEL_6;
    }
  }

  else
  {
    unsigned __int8 v16 = TaskPriority.rawValue.getter();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    uint64_t v8 = v16 | 0x1C00LL;
    uint64_t v9 = *(void *)(a3 + 16);
    if (v9) {
      goto LABEL_3;
    }
  }

  uint64_t v13 = 0LL;
  uint64_t v15 = 0LL;
LABEL_6:
  uint64_t v17 = swift_allocObject(&unk_100032100, 32LL, 7LL);
  *(void *)(v17 + 16) = a2;
  *(void *)(v17 + 24) = a3;
  if (v15 | v13)
  {
    v20[0] = 0LL;
    v20[1] = 0LL;
    __int128 v18 = v20;
    v20[2] = v13;
    v20[3] = v15;
  }

  else
  {
    __int128 v18 = 0LL;
  }

  return swift_task_create(v8, v18, (char *)&type metadata for () + 8, &unk_1000361A8, v17);
}

void *sub_10000EC8C()
{
  return &unk_100031560;
}

unint64_t sub_10000EC98()
{
  return 0xD000000000000018LL;
}

uint64_t sub_10000ECB4()
{
  return *v0;
}

uint64_t sub_10000ECBC()
{
  return *(unsigned int *)(v0 + 4);
}

uint64_t sub_10000ECC4()
{
  return *(unsigned int *)(v0 + 8);
}

uint64_t sub_10000ECCC()
{
  return *(unsigned int *)(v0 + 12);
}

uint64_t sub_10000ECD4()
{
  return *(unsigned int *)(v0 + 16);
}

uint64_t sub_10000ECDC()
{
  return *(unsigned int *)(v0 + 20);
}

uint64_t sub_10000ECE4()
{
  return *(unsigned int *)(v0 + 24);
}

uint64_t sub_10000ECEC()
{
  return *(unsigned int *)(v0 + 28);
}

uint64_t sub_10000ECF4()
{
  return *(unsigned int *)(v0 + 32);
}

double sub_10000ECFC()
{
  return *(double *)(v0 + 40);
}

uint64_t sub_10000ED04()
{
  return swift_bridgeObjectRetain(*(void *)(v0 + 48));
}

uint64_t sub_10000ED0C()
{
  return *(unsigned int *)(v0 + 56);
}

void sub_10000ED14(void *a1)
{
  int v3 = (void *)objc_opt_self(&OBJC_CLASS___JSValue);
  if (![v3 valueWithNewObjectInContext:a1])
  {
    __break(1u);
    goto LABEL_16;
  }

  LOBYTE(v41) = *(_BYTE *)v1;
  id v4 = a1;
  uint64_t v5 = _bridgeAnythingNonVerbatimToObjectiveC<A>(_:)(&v41, &type metadata for Bool);
  id v6 = [v3 valueWithObject:v5 inContext:v4];
  swift_unknownObjectRelease(v5);

  if (!v6)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }

  JSValue.subscript.setter(v6, 0x614365726F6E6769LL, 0xEB00000000656863LL);
  LODWORD(v41) = *(_DWORD *)(v1 + 4);
  id v7 = v4;
  uint64_t v8 = _bridgeAnythingNonVerbatimToObjectiveC<A>(_:)(&v41, &type metadata for Int32);
  id v9 = [v3 valueWithObject:v8 inContext:v7];
  swift_unknownObjectRelease(v8);

  if (!v9)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }

  JSValue.subscript.setter(v9, 0xD000000000000015LL, 0x8000000100028BA0LL);
  LODWORD(v41) = *(_DWORD *)(v1 + 8);
  id v10 = v7;
  uint64_t v11 = _bridgeAnythingNonVerbatimToObjectiveC<A>(_:)(&v41, &type metadata for Int32);
  id v12 = [v3 valueWithObject:v11 inContext:v10];
  swift_unknownObjectRelease(v11);

  if (!v12)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }

  JSValue.subscript.setter(v12, 0xD000000000000016LL, 0x8000000100028BC0LL);
  LODWORD(v41) = *(_DWORD *)(v1 + 12);
  id v13 = v10;
  uint64_t v14 = _bridgeAnythingNonVerbatimToObjectiveC<A>(_:)(&v41, &type metadata for Int32);
  id v15 = [v3 valueWithObject:v14 inContext:v13];
  swift_unknownObjectRelease(v14);

  if (!v15)
  {
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }

  JSValue.subscript.setter(v15, 0xD000000000000015LL, 0x8000000100028BE0LL);
  LODWORD(v41) = *(_DWORD *)(v1 + 16);
  id v16 = v13;
  uint64_t v17 = _bridgeAnythingNonVerbatimToObjectiveC<A>(_:)(&v41, &type metadata for Int32);
  id v18 = [v3 valueWithObject:v17 inContext:v16];
  swift_unknownObjectRelease(v17);

  if (!v18)
  {
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }

  JSValue.subscript.setter(v18, 0xD000000000000016LL, 0x8000000100028C00LL);
  LODWORD(v41) = *(_DWORD *)(v1 + 20);
  id v19 = v16;
  uint64_t v20 = _bridgeAnythingNonVerbatimToObjectiveC<A>(_:)(&v41, &type metadata for Int32);
  id v21 = [v3 valueWithObject:v20 inContext:v19];
  swift_unknownObjectRelease(v20);

  if (!v21)
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }

  JSValue.subscript.setter(v21, 0xD000000000000013LL, 0x8000000100028C20LL);
  LODWORD(v41) = *(_DWORD *)(v1 + 24);
  id v22 = v19;
  uint64_t v23 = _bridgeAnythingNonVerbatimToObjectiveC<A>(_:)(&v41, &type metadata for Int32);
  id v24 = [v3 valueWithObject:v23 inContext:v22];
  swift_unknownObjectRelease(v23);

  if (!v24)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }

  JSValue.subscript.setter(v24, 0xD000000000000014LL, 0x8000000100028C40LL);
  LODWORD(v41) = *(_DWORD *)(v1 + 28);
  id v25 = v22;
  uint64_t v26 = _bridgeAnythingNonVerbatimToObjectiveC<A>(_:)(&v41, &type metadata for Int32);
  id v27 = [v3 valueWithObject:v26 inContext:v25];
  swift_unknownObjectRelease(v26);

  if (!v27)
  {
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }

  JSValue.subscript.setter(v27, 0x616D496567646162LL, 0xEF68746469576567LL);
  LODWORD(v41) = *(_DWORD *)(v1 + 32);
  id v28 = v25;
  uint64_t v29 = _bridgeAnythingNonVerbatimToObjectiveC<A>(_:)(&v41, &type metadata for Int32);
  id v30 = [v3 valueWithObject:v29 inContext:v28];
  swift_unknownObjectRelease(v29);

  if (!v30)
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }

  JSValue.subscript.setter(v30, 0xD000000000000010LL, 0x8000000100028C60LL);
  uint64_t v41 = *(void *)(v1 + 40);
  id v31 = v28;
  uint64_t v32 = _bridgeAnythingNonVerbatimToObjectiveC<A>(_:)(&v41, &type metadata for Double);
  id v33 = [v3 valueWithObject:v32 inContext:v31];
  swift_unknownObjectRelease(v32);

  if (!v33)
  {
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }

  JSValue.subscript.setter(v33, 0x616D496567646162LL, 0xEF656C6163536567LL);
  uint64_t v41 = *(void *)(v1 + 48);
  id v34 = v31;
  sub_100019EBC(v1);
  uint64_t v35 = sub_100008A20(&qword_100036050);
  uint64_t v36 = _bridgeAnythingNonVerbatimToObjectiveC<A>(_:)(&v41, v35);
  id v37 = [v3 valueWithObject:v36 inContext:v34];
  swift_unknownObjectRelease(v36);

  if (!v37)
  {
LABEL_26:
    __break(1u);
    goto LABEL_27;
  }

  JSValue.subscript.setter(v37, 0xD000000000000015LL, 0x8000000100028C80LL);
  LODWORD(v41) = *(_DWORD *)(v1 + 56);
  id v38 = v34;
  uint64_t v39 = _bridgeAnythingNonVerbatimToObjectiveC<A>(_:)(&v41, &type metadata for Int32);
  id v40 = [v3 valueWithObject:v39 inContext:v38];
  swift_unknownObjectRelease(v39);

  if (v40)
  {
    JSValue.subscript.setter(v40, 0x5479616C70736964LL, 0xEB00000000657079LL);
    return;
  }

uint64_t sub_10000F358(unsigned __int8 a1)
{
  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_10000F394 + 4 * byte_100027696[a1]))( 0x614365726F6E6769LL,  0xEB00000000656863LL);
}

unint64_t sub_10000F394()
{
  return 0xD000000000000015LL;
}

uint64_t sub_10000F480()
{
  return 0x5479616C70736964LL;
}

uint64_t sub_10000F498()
{
  return sub_10000F358(*v0);
}

uint64_t sub_10000F4A0@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result = sub_100019F28(a1, a2);
  *a3 = result;
  return result;
}

void sub_10000F4C4(_BYTE *a1@<X8>)
{
  *a1 = 12;
}

uint64_t sub_10000F4D0(uint64_t a1)
{
  unint64_t v2 = sub_100019EE4();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10000F4F8(uint64_t a1)
{
  unint64_t v2 = sub_100019EE4();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_10000F520(void *a1)
{
  int v3 = v1;
  uint64_t v5 = sub_100008A20(&qword_100036058);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v26 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = a1[3];
  uint64_t v10 = a1[4];
  sub_10000A0F0(a1, v9);
  unint64_t v11 = sub_100019EE4();
  dispatch thunk of Encoder.container<A>(keyedBy:)( &type metadata for FetchUpNextContentIntent.CodingKeys,  &type metadata for FetchUpNextContentIntent.CodingKeys,  v11,  v9,  v10);
  uint64_t v12 = *(unsigned __int8 *)v3;
  LOBYTE(v27) = 0;
  KeyedEncodingContainer.encode(_:forKey:)(v12, &v27, v5);
  if (!v2)
  {
    uint64_t v13 = *((unsigned int *)v3 + 1);
    LOBYTE(v27) = 1;
    KeyedEncodingContainer.encode(_:forKey:)(v13, &v27, v5);
    uint64_t v14 = *((unsigned int *)v3 + 2);
    LOBYTE(v27) = 2;
    KeyedEncodingContainer.encode(_:forKey:)(v14, &v27, v5);
    uint64_t v15 = *((unsigned int *)v3 + 3);
    LOBYTE(v27) = 3;
    KeyedEncodingContainer.encode(_:forKey:)(v15, &v27, v5);
    uint64_t v16 = *((unsigned int *)v3 + 4);
    LOBYTE(v27) = 4;
    KeyedEncodingContainer.encode(_:forKey:)(v16, &v27, v5);
    uint64_t v17 = *((unsigned int *)v3 + 5);
    LOBYTE(v27) = 5;
    KeyedEncodingContainer.encode(_:forKey:)(v17, &v27, v5);
    uint64_t v18 = *((unsigned int *)v3 + 6);
    LOBYTE(v27) = 6;
    KeyedEncodingContainer.encode(_:forKey:)(v18, &v27, v5);
    uint64_t v19 = *((unsigned int *)v3 + 7);
    LOBYTE(v27) = 7;
    KeyedEncodingContainer.encode(_:forKey:)(v19, &v27, v5);
    uint64_t v20 = *((unsigned int *)v3 + 8);
    LOBYTE(v27) = 8;
    KeyedEncodingContainer.encode(_:forKey:)(v20, &v27, v5);
    double v21 = v3[5];
    LOBYTE(v27) = 9;
    KeyedEncodingContainer.encode(_:forKey:)(&v27, v5, v21);
    uint64_t v27 = *((void *)v3 + 6);
    HIBYTE(v26) = 10;
    uint64_t v22 = sub_100008A20(&qword_100036050);
    uint64_t v23 = sub_100024838( &qword_100036060,  &qword_100036050,  (uint64_t)&protocol witness table for String,  (uint64_t)&protocol conformance descriptor for <A> [A]);
    KeyedEncodingContainer.encode<A>(_:forKey:)(&v27, (char *)&v26 + 7, v5, v22, v23);
    uint64_t v24 = *((unsigned int *)v3 + 14);
    LOBYTE(v27) = 11;
    KeyedEncodingContainer.encode(_:forKey:)(v24, &v27, v5);
  }

  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

double sub_10000F808@<D0>(void *a1@<X0>, _OWORD *a2@<X8>)
{
  if (!v2)
  {
    __int128 v5 = v6[1];
    *a2 = v6[0];
    a2[1] = v5;
    a2[2] = v7[0];
    double result = *(double *)((char *)v7 + 12);
    *(_OWORD *)((char *)a2 + 44) = *(_OWORD *)((char *)v7 + 12);
  }

  return result;
}

void sub_10000F850(void *a1@<X8>)
{
  *a1 = 0xD000000000000018LL;
  a1[1] = 0x8000000100027740LL;
}

uint64_t sub_10000F87C(void *a1)
{
  return sub_10000F520(a1);
}

uint64_t sub_10000F890()
{
  return CustomJSValueConvertible.jsRepresentation(in:)();
}

JSValue sub_10000F8A4(JSContext a1)
{
  return CustomJSValueConvertible._jsValue(in:)(a1);
}

void sub_10000F8B8(void *a1)
{
}

uint64_t sub_10000F8F8()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain(v0[1]);
  return v1;
}

uint64_t sub_10000F924(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease(v2[1]);
  void *v2 = a1;
  v2[1] = a2;
  return result;
}

uint64_t (*sub_10000F958())()
{
  return nullsub_1;
}

uint64_t sub_10000F968()
{
  uint64_t v1 = *(void *)(v0 + 16);
  swift_bridgeObjectRetain(*(void *)(v0 + 24));
  return v1;
}

uint64_t sub_10000F994(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease(*(void *)(v2 + 24));
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = a2;
  return result;
}

uint64_t (*sub_10000F9C8())()
{
  return nullsub_1;
}

uint64_t sub_10000F9D8()
{
  uint64_t v1 = *(void *)(v0 + 32);
  swift_bridgeObjectRetain(*(void *)(v0 + 40));
  return v1;
}

uint64_t sub_10000FA04(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease(*(void *)(v2 + 40));
  *(void *)(v2 + 32) = a1;
  *(void *)(v2 + 40) = a2;
  return result;
}

uint64_t (*sub_10000FA38())()
{
  return nullsub_1;
}

uint64_t sub_10000FA48()
{
  uint64_t v1 = *(void *)(v0 + 48);
  swift_bridgeObjectRetain(*(void *)(v0 + 56));
  return v1;
}

uint64_t sub_10000FA74(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease(*(void *)(v2 + 56));
  *(void *)(v2 + 48) = a1;
  *(void *)(v2 + 56) = a2;
  return result;
}

uint64_t (*sub_10000FAA8())()
{
  return nullsub_1;
}

double sub_10000FAB8()
{
  return *(double *)(v0 + 64);
}

void sub_10000FAC0(double a1)
{
  *(double *)(v1 + 64) = a1;
}

uint64_t (*sub_10000FAC8())()
{
  return nullsub_1;
}

double sub_10000FAD8()
{
  return *(double *)(v0 + 72);
}

void sub_10000FAE0(double a1)
{
  *(double *)(v1 + 72) = a1;
}

uint64_t (*sub_10000FAE8())()
{
  return nullsub_1;
}

uint64_t sub_10000FAF8()
{
  uint64_t v1 = *(void *)(v0 + 80);
  swift_bridgeObjectRetain(*(void *)(v0 + 88));
  return v1;
}

uint64_t sub_10000FB24(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease(*(void *)(v2 + 88));
  *(void *)(v2 + 80) = a1;
  *(void *)(v2 + 88) = a2;
  return result;
}

uint64_t (*sub_10000FB58())()
{
  return nullsub_1;
}

uint64_t sub_10000FB68()
{
  uint64_t v1 = *(void *)(v0 + 96);
  swift_bridgeObjectRetain(*(void *)(v0 + 104));
  return v1;
}

uint64_t sub_10000FB94(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease(*(void *)(v2 + 104));
  *(void *)(v2 + 96) = a1;
  *(void *)(v2 + 104) = a2;
  return result;
}

uint64_t (*sub_10000FBC8())()
{
  return nullsub_1;
}

uint64_t sub_10000FBD8()
{
  uint64_t v1 = *(void *)(v0 + 112);
  swift_bridgeObjectRetain(*(void *)(v0 + 120));
  return v1;
}

uint64_t sub_10000FC04(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease(*(void *)(v2 + 120));
  *(void *)(v2 + 112) = a1;
  *(void *)(v2 + 120) = a2;
  return result;
}

uint64_t (*sub_10000FC38())()
{
  return nullsub_1;
}

uint64_t sub_10000FC48()
{
  uint64_t v1 = *(void *)(v0 + 128);
  swift_bridgeObjectRetain(*(void *)(v0 + 136));
  return v1;
}

uint64_t sub_10000FC74(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease(*(void *)(v2 + 136));
  *(void *)(v2 + 128) = a1;
  *(void *)(v2 + 136) = a2;
  return result;
}

uint64_t (*sub_10000FCA8())()
{
  return nullsub_1;
}

uint64_t sub_10000FCB8()
{
  uint64_t v1 = *(void *)(v0 + 144);
  swift_bridgeObjectRetain(*(void *)(v0 + 152));
  return v1;
}

uint64_t sub_10000FCE4(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease(*(void *)(v2 + 152));
  *(void *)(v2 + 144) = a1;
  *(void *)(v2 + 152) = a2;
  return result;
}

uint64_t (*sub_10000FD18())()
{
  return nullsub_1;
}

uint64_t sub_10000FD28()
{
  return 0LL;
}

uint64_t sub_10000FD34()
{
  uint64_t v1 = *(void *)(v0 + 160);
  swift_bridgeObjectRetain(*(void *)(v0 + 168));
  return v1;
}

uint64_t sub_10000FD60(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease(*(void *)(v2 + 168));
  *(void *)(v2 + 160) = a1;
  *(void *)(v2 + 168) = a2;
  return result;
}

uint64_t (*sub_10000FD94())()
{
  return nullsub_1;
}

uint64_t sub_10000FDA4()
{
  uint64_t v1 = *(void *)(v0 + 176);
  swift_bridgeObjectRetain(*(void *)(v0 + 184));
  return v1;
}

uint64_t sub_10000FDD0(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease(*(void *)(v2 + 184));
  *(void *)(v2 + 176) = a1;
  *(void *)(v2 + 184) = a2;
  return result;
}

uint64_t (*sub_10000FE04())()
{
  return nullsub_1;
}

uint64_t sub_10000FE14()
{
  uint64_t v1 = *(void *)(v0 + 192);
  swift_bridgeObjectRetain(*(void *)(v0 + 200));
  return v1;
}

uint64_t sub_10000FE40(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease(*(void *)(v2 + 200));
  *(void *)(v2 + 192) = a1;
  *(void *)(v2 + 200) = a2;
  return result;
}

uint64_t (*sub_10000FE74())()
{
  return nullsub_1;
}

uint64_t sub_10000FE84()
{
  return swift_bridgeObjectRetain(*(void *)(v0 + 208));
}

uint64_t sub_10000FE8C(uint64_t a1)
{
  uint64_t result = swift_bridgeObjectRelease(*(void *)(v1 + 208));
  *(void *)(v1 + 208) = a1;
  return result;
}

uint64_t (*sub_10000FEB4())()
{
  return nullsub_1;
}

uint64_t sub_10000FEC4()
{
  return swift_bridgeObjectRetain(*(void *)(v0 + 216));
}

uint64_t sub_10000FECC(uint64_t a1)
{
  uint64_t result = swift_bridgeObjectRelease(*(void *)(v1 + 216));
  *(void *)(v1 + 216) = a1;
  return result;
}

uint64_t (*sub_10000FEF4())()
{
  return nullsub_1;
}

uint64_t sub_10000FF04()
{
  return swift_bridgeObjectRetain(*(void *)(v0 + 224));
}

uint64_t sub_10000FF0C(uint64_t a1)
{
  uint64_t result = swift_bridgeObjectRelease(*(void *)(v1 + 224));
  *(void *)(v1 + 224) = a1;
  return result;
}

uint64_t (*sub_10000FF34())()
{
  return nullsub_1;
}

uint64_t sub_10000FF44(unsigned __int8 a1)
{
  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_10000FF80 + 4 * byte_1000276A2[a1]))( 0x6163696E6F6E6163LL,  0xEB0000000044496CLL);
}

uint64_t sub_10000FF80()
{
  return 0x656C746974LL;
}

uint64_t sub_10000FF94()
{
  return 0x747865746E6F63LL;
}

uint64_t sub_10000FFAC()
{
  return 0x656C746974627573LL;
}

unint64_t sub_10000FFC4()
{
  return 0xD000000000000012LL;
}

unint64_t sub_1000100D8()
{
  return 0xD000000000000015LL;
}

void sub_1000100F0()
{
}

BOOL sub_100010110(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

void sub_100010124()
{
}

uint64_t sub_10001014C()
{
  return sub_10000FF44(*v0);
}

uint64_t sub_100010154@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result = sub_10001A7D0(a1, a2);
  *a3 = result;
  return result;
}

void sub_100010178(_BYTE *a1@<X8>)
{
  *a1 = 17;
}

uint64_t sub_100010184(uint64_t a1)
{
  unint64_t v2 = sub_10001A78C();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_1000101AC(uint64_t a1)
{
  unint64_t v2 = sub_10001A78C();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_1000101D4(void *a1)
{
  int v3 = v1;
  uint64_t v5 = sub_100008A20(&qword_100036068);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v41 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = a1[3];
  uint64_t v10 = a1[4];
  sub_10000A0F0(a1, v9);
  unint64_t v11 = sub_10001A78C();
  dispatch thunk of Encoder.container<A>(keyedBy:)( &type metadata for UpNextContent.CodingKeys,  &type metadata for UpNextContent.CodingKeys,  v11,  v9,  v10);
  double v12 = *v3;
  uint64_t v13 = *((void *)v3 + 1);
  v43[0] = 0;
  KeyedEncodingContainer.encode(_:forKey:)(*(void *)&v12, v13, v43, v5);
  if (!v2)
  {
    uint64_t v14 = *((void *)v3 + 2);
    uint64_t v15 = *((void *)v3 + 3);
    v43[0] = 1;
    KeyedEncodingContainer.encode(_:forKey:)(v14, v15, v43, v5);
    uint64_t v16 = *((void *)v3 + 4);
    uint64_t v17 = *((void *)v3 + 5);
    v43[0] = 2;
    KeyedEncodingContainer.encode(_:forKey:)(v16, v17, v43, v5);
    uint64_t v18 = *((void *)v3 + 6);
    uint64_t v19 = *((void *)v3 + 7);
    v43[0] = 3;
    KeyedEncodingContainer.encode(_:forKey:)(v18, v19, v43, v5);
    double v20 = v3[8];
    v43[0] = 4;
    KeyedEncodingContainer.encode(_:forKey:)(v43, v5, v20);
    double v21 = v3[9];
    v43[0] = 5;
    KeyedEncodingContainer.encode(_:forKey:)(v43, v5, v21);
    uint64_t v22 = *((void *)v3 + 10);
    uint64_t v23 = *((void *)v3 + 11);
    v43[0] = 6;
    KeyedEncodingContainer.encode(_:forKey:)(v22, v23, v43, v5);
    uint64_t v24 = *((void *)v3 + 12);
    uint64_t v25 = *((void *)v3 + 13);
    v43[0] = 7;
    KeyedEncodingContainer.encode(_:forKey:)(v24, v25, v43, v5);
    uint64_t v26 = *((void *)v3 + 14);
    uint64_t v27 = *((void *)v3 + 15);
    v43[0] = 8;
    KeyedEncodingContainer.encode(_:forKey:)(v26, v27, v43, v5);
    uint64_t v28 = *((void *)v3 + 16);
    uint64_t v29 = *((void *)v3 + 17);
    v43[0] = 9;
    KeyedEncodingContainer.encode(_:forKey:)(v28, v29, v43, v5);
    uint64_t v30 = *((void *)v3 + 18);
    uint64_t v31 = *((void *)v3 + 19);
    v43[0] = 10;
    KeyedEncodingContainer.encode(_:forKey:)(v30, v31, v43, v5);
    uint64_t v32 = *((void *)v3 + 20);
    uint64_t v33 = *((void *)v3 + 21);
    v43[0] = 11;
    KeyedEncodingContainer.encodeIfPresent(_:forKey:)(v32, v33, v43, v5);
    uint64_t v34 = *((void *)v3 + 22);
    uint64_t v35 = *((void *)v3 + 23);
    v43[0] = 12;
    KeyedEncodingContainer.encodeIfPresent(_:forKey:)(v34, v35, v43, v5);
    uint64_t v36 = *((void *)v3 + 24);
    uint64_t v37 = *((void *)v3 + 25);
    v43[0] = 13;
    KeyedEncodingContainer.encodeIfPresent(_:forKey:)(v36, v37, v43, v5);
    sub_100024A88((uint64_t)(v3 + 26), (uint64_t)v46, &qword_100036070);
    sub_100024A88((uint64_t)v46, (uint64_t)v43, &qword_100036070);
    char v42 = 14;
    uint64_t v38 = sub_100008A20(&qword_100036050);
    uint64_t v39 = sub_100024838( &qword_100036060,  &qword_100036050,  (uint64_t)&protocol witness table for String,  (uint64_t)&protocol conformance descriptor for <A> [A]);
    KeyedEncodingContainer.encodeIfPresent<A>(_:forKey:)(v43, &v42, v5, v38, v39);
    sub_100024A88((uint64_t)(v3 + 27), (uint64_t)v45, &qword_100036070);
    sub_100024A88((uint64_t)v45, (uint64_t)v43, &qword_100036070);
    char v42 = 15;
    KeyedEncodingContainer.encodeIfPresent<A>(_:forKey:)(v43, &v42, v5, v38, v39);
    sub_100024A88((uint64_t)(v3 + 28), (uint64_t)v44, &qword_100036070);
    sub_100024A88((uint64_t)v44, (uint64_t)v43, &qword_100036070);
    char v42 = 16;
    KeyedEncodingContainer.encodeIfPresent<A>(_:forKey:)(v43, &v42, v5, v38, v39);
  }

  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t sub_100010608@<X0>( uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, double a10@<D0>, double a11@<D1>, __int128 a12, __int128 a13, __int128 a14, __int128 a15, __int128 a16, __int128 a17, __int128 a18, __int128 a19, __int128 a20, uint64_t a21)
{
  *(void *)a9 = result;
  *(void *)(a9 + 8) = a2;
  *(void *)(a9 + 16) = a3;
  *(void *)(a9 + 24) = a4;
  *(void *)(a9 + 32) = a5;
  *(void *)(a9 + 40) = a6;
  *(void *)(a9 + 48) = a7;
  *(void *)(a9 + 56) = a8;
  *(double *)(a9 + 64) = a10;
  *(double *)(a9 + 72) = a11;
  *(_OWORD *)(a9 + 80) = a12;
  *(_OWORD *)(a9 + 96) = a13;
  *(_OWORD *)(a9 + 112) = a14;
  *(_OWORD *)(a9 + 128) = a15;
  *(_OWORD *)(a9 + 144) = a16;
  *(_OWORD *)(a9 + 160) = a17;
  *(_OWORD *)(a9 + 176) = a18;
  *(_OWORD *)(a9 + 192) = a19;
  *(_OWORD *)(a9 + 208) = a20;
  *(void *)(a9 + 224) = a21;
  return result;
}

__n128 sub_100010650@<Q0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  if (!v2)
  {
    __int128 v5 = v11[13];
    *(_OWORD *)(a2 + 192) = v11[12];
    *(_OWORD *)(a2 + 208) = v5;
    *(void *)(a2 + 224) = v12;
    __int128 v6 = v11[9];
    *(_OWORD *)(a2 + 128) = v11[8];
    *(_OWORD *)(a2 + 144) = v6;
    __int128 v7 = v11[11];
    *(_OWORD *)(a2 + 160) = v11[10];
    *(_OWORD *)(a2 + 176) = v7;
    __int128 v8 = v11[5];
    *(_OWORD *)(a2 + 64) = v11[4];
    *(_OWORD *)(a2 + 80) = v8;
    __int128 v9 = v11[7];
    *(_OWORD *)(a2 + 96) = v11[6];
    *(_OWORD *)(a2 + 112) = v9;
    __int128 v10 = v11[1];
    *(_OWORD *)a2 = v11[0];
    *(_OWORD *)(a2 + 16) = v10;
    __n128 result = (__n128)v11[3];
    *(_OWORD *)(a2 + 32) = v11[2];
    *(__n128 *)(a2 + 48) = result;
  }

  return result;
}

uint64_t sub_1000106DC(void *a1)
{
  return sub_1000101D4(a1);
}

uint64_t sub_100010748(uint64_t a1, char a2)
{
  return a2 & 1;
}

uint64_t sub_10001075C()
{
  if (*v0) {
    return 0xD000000000000010LL;
  }
  else {
    return 0x49746E65746E6F63LL;
  }
}

uint64_t sub_1000107A4@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result = sub_100020E3C(a1, a2);
  *a3 = result;
  return result;
}

void sub_1000107C8(_BYTE *a1@<X8>)
{
  *a1 = 2;
}

uint64_t sub_1000107D4(uint64_t a1)
{
  unint64_t v2 = sub_10001BC40();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_1000107FC(uint64_t a1)
{
  unint64_t v2 = sub_10001BC40();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_100010824(void *a1, uint64_t a2, int a3, uint64_t a4, int a5)
{
  uint64_t v20 = a4;
  int v25 = a3;
  uint64_t v9 = sub_100008A20(&qword_100036078);
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  uint64_t v12 = (char *)&v21[-1] - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v14 = a1[3];
  uint64_t v13 = a1[4];
  sub_10000A0F0(a1, v14);
  unint64_t v15 = sub_10001BC40();
  dispatch thunk of Encoder.container<A>(keyedBy:)( &type metadata for UpNextReturnType.CodingKeys,  &type metadata for UpNextReturnType.CodingKeys,  v15,  v14,  v13);
  v21[0] = a2;
  char v26 = 0;
  uint64_t v16 = sub_100008A20(&qword_100036080);
  uint64_t v17 = sub_100020D94( &qword_100036088,  &qword_100036080,  (void (*)(void))sub_10001BC84,  (uint64_t)&protocol conformance descriptor for <A> [A]);
  KeyedEncodingContainer.encode<A>(_:forKey:)(v21, &v26, v9, v16, v17);
  if (!v5)
  {
    LOBYTE(v21[0]) = v25 & 1;
    v21[1] = v20;
    __int16 v22 = a5 & 0x101;
    char v23 = BYTE2(a5) & 1;
    char v24 = HIBYTE(a5) & 1;
    char v26 = 1;
    unint64_t v18 = sub_10001BCC8();
    KeyedEncodingContainer.encode<A>(_:forKey:)(v21, &v26, v9, &type metadata for CachePolicyRelay, v18);
  }

  return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v12, v9);
}

  ;
}

uint64_t sub_1000109DC(uint64_t a1)
{
  return sub_100013124(a1, (uint64_t (*)(void))sub_10001BD0C);
}

uint64_t sub_1000109FC@<X0>(uint64_t a1@<X8>)
{
  return sub_100013170((uint64_t (*)(void))sub_10001BD0C, a1);
}

uint64_t sub_100010A18(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1000131E0(a1, a2, a3, (uint64_t (*)(uint64_t, void, void, void, void))sub_100010824);
}

uint64_t TopShelfContentProvider.fetchFeaturedContent(completion:)( uint64_t (*a1)(void, void), uint64_t a2)
{
  uint64_t v5 = (void *)swift_allocObject(&unk_1000315E0, 40LL, 7LL);
  v5[2] = v2;
  v5[3] = a1;
  void v5[4] = a2;
  int v6 = v2[OBJC_IVAR____TtC17TVUpNextExtension23TopShelfContentProvider_startupComplete];
  __int128 v7 = v2;
  swift_retain_n(a2, 2LL);
  __int128 v8 = v7;
  uint64_t v9 = v8;
  if (v6 == 1)
  {
    sub_100010C3C(v8, a1, a2);
  }

  else
  {
    _s17TVUpNextExtension23TopShelfContentProviderC3logyySSFZ_0(0xD00000000000001BLL, 0x8000000100028CF0LL);
    uint64_t v10 = &v9[OBJC_IVAR____TtC17TVUpNextExtension23TopShelfContentProvider_startupInvocations];
    swift_beginAccess( &v9[OBJC_IVAR____TtC17TVUpNextExtension23TopShelfContentProvider_startupInvocations],  v22,  1LL,  0LL);
    if (!*(void *)v10)
    {
      *(void *)uint64_t v10 = &_swiftEmptyArrayStorage;
      swift_bridgeObjectRelease(0LL);
    }

    uint64_t v12 = sub_10000ADC4((uint64_t)v21);
    if (*v11)
    {
      uint64_t v13 = v11;
      uint64_t v14 = swift_allocObject(&unk_100031608, 32LL, 7LL);
      *(void *)(v14 + 16) = sub_10001BF38;
      *(void *)(v14 + 24) = v5;
      unint64_t v15 = *v13;
      swift_retain(v5);
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(v15);
      *uint64_t v13 = v15;
      if ((isUniquelyReferenced_nonNull_native & 1) == 0)
      {
        unint64_t v15 = sub_100013824(0LL, *((void *)v15 + 2) + 1LL, 1, v15);
        *uint64_t v13 = v15;
      }

      unint64_t v18 = *((void *)v15 + 2);
      unint64_t v17 = *((void *)v15 + 3);
      if (v18 >= v17 >> 1)
      {
        unint64_t v15 = sub_100013824((char *)(v17 > 1), v18 + 1, 1, v15);
        *uint64_t v13 = v15;
      }

      *((void *)v15 + 2) = v18 + 1;
      uint64_t v19 = &v15[16 * v18];
      *((void *)v19 + 4) = sub_1000255E0;
      *((void *)v19 + 5) = v14;
    }

    ((void (*)(_BYTE *, void))v12)(v21, 0LL);
  }

  swift_release(v5);
  return swift_release(a2);
}

uint64_t sub_100010C3C(char *a1, uint64_t (*a2)(void, void), uint64_t a3)
{
  uint64_t v6 = sub_100008A20(&qword_100035F00);
  __chkstk_darwin(v6);
  __int128 v8 = &v22[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL) - 8];
  uint64_t v9 = (os_unfair_lock_s *)&a1[OBJC_IVAR____TtC17TVUpNextExtension23TopShelfContentProvider_cachePolicyLock];
  swift_beginAccess(&a1[OBJC_IVAR____TtC17TVUpNextExtension23TopShelfContentProvider_cachePolicyLock], v22, 33LL, 0LL);
  os_unfair_lock_lock(v9);
  uint64_t v10 = *(id *)&a1[OBJC_IVAR____TtC17TVUpNextExtension23TopShelfContentProvider__cachePolicy];
  os_unfair_lock_unlock(v9);
  swift_endAccess(v22);
  char v11 = v10[OBJC_IVAR____TtC17TVUpNextExtensionP33_CEB3B327E539852F953463821CB150CF11CachePolicy_cacheIsValid];

  id v12 = sub_100016EB0();
  id v13 = v12;
  uint64_t v14 = *(void *)&a1[OBJC_IVAR____TtC17TVUpNextExtension23TopShelfContentProvider_objectGraph];
  if (v14)
  {
    char v15 = v11 ^ 1;
    uint64_t v16 = type metadata accessor for TaskPriority(0LL);
    (*(void (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56LL))(v8, 1LL, 1LL, v16);
    uint64_t v17 = swift_allocObject(&unk_1000323A8, 80LL, 7LL);
    *(void *)(v17 + 16) = 0LL;
    *(void *)(v17 + 24) = 0LL;
    *(void *)(v17 + 32) = a1;
    *(_BYTE *)(v17 + 40) = v15;
    *(void *)(v17 + 48) = v13;
    *(void *)(v17 + 56) = v14;
    *(void *)(v17 + 64) = a2;
    *(void *)(v17 + 72) = a3;
    swift_retain(v14);
    unint64_t v18 = a1;
    swift_retain(a3);
    uint64_t v19 = sub_10000EB34((uint64_t)v8, (uint64_t)&unk_100036330, v17);
    return swift_release(v19);
  }

  else
  {
    swift_bridgeObjectRelease(v12);
    return a2(0LL, 0LL);
  }

uint64_t sub_100010DC4( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  *(void *)(v8 + 640) = v10;
  *(void *)(v8 + 632) = a8;
  *(void *)(v8 + 624) = a7;
  *(void *)(v8 + 616) = a6;
  *(_BYTE *)(v8 + 540) = a5;
  *(void *)(v8 + 608) = a4;
  return swift_task_switch(sub_100010DF8, 0LL, 0LL);
}

uint64_t sub_100010DF8()
{
  uint64_t v1 = *(void *)(v0 + 608);
  _s17TVUpNextExtension23TopShelfContentProviderC3logyySSFZ_0(0xD00000000000001DLL, 0x8000000100029420LL);
  uint64_t v2 = *(void *)(v1 + OBJC_IVAR____TtC17TVUpNextExtension23TopShelfContentProvider_stack);
  *(void *)(v0 + 648) = v2;
  if (v2)
  {
    uint64_t v3 = *(void *)(v0 + 616);
    *(_BYTE *)(v0 + 592) = *(_BYTE *)(v0 + 540);
    *(void *)(v0 + 600) = v3;
    uint64_t v4 = async function pointer to JSStack.dispatch<A>(_:objectGraph:)[1];
    swift_retain(v2);
    uint64_t v5 = (void *)swift_task_alloc(v4);
    *(void *)(v0 + 656) = v5;
    unint64_t v6 = sub_100023A08();
    void *v5 = v0;
    v5[1] = sub_100011048;
    return JSStack.dispatch<A>(_:objectGraph:)( v0 + 512,  v0 + 592,  *(void *)(v0 + 624),  &type metadata for FetchFeaturedContentIntent,  v6);
  }

  else
  {
    id v8 = objc_allocWithZone(&OBJC_CLASS___TVTopShelfCarouselContent);
    sub_10000A134(0LL, &qword_1000361B8, &OBJC_CLASS___TVTopShelfCarouselItem_ptr);
    Class isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(&_swiftEmptyArrayStorage);
    id v10 = [v8 initWithStyle:1 items:isa];

    char v11 = *(void (**)(id, void))(v0 + 632);
    uint64_t v12 = *(void *)(v0 + 608);
    id v13 = objc_allocWithZone((Class)type metadata accessor for CachePolicy());
    uint64_t v14 = sub_100013244(2LL, 0LL, 0, 0);
    char v15 = (os_unfair_lock_s *)(v12 + OBJC_IVAR____TtC17TVUpNextExtension23TopShelfContentProvider_cachePolicyLock);
    swift_beginAccess( v12 + OBJC_IVAR____TtC17TVUpNextExtension23TopShelfContentProvider_cachePolicyLock,  v0 + 544,  33LL,  0LL);
    uint64_t v16 = v14;
    os_unfair_lock_lock(v15);
    swift_endAccess(v0 + 544);
    uint64_t v17 = *(void **)(v12 + OBJC_IVAR____TtC17TVUpNextExtension23TopShelfContentProvider__cachePolicy);
    *(void *)(v12 + OBJC_IVAR____TtC17TVUpNextExtension23TopShelfContentProvider__cachePolicy) = v16;
    unint64_t v18 = v16;

    swift_beginAccess(v15, v0 + 568, 33LL, 0LL);
    os_unfair_lock_unlock(v15);
    swift_endAccess(v0 + 568);

    sub_10000CD98();
    sub_10000CE84();

    id v19 = v10;
    v11(v10, 0LL);

    return (*(uint64_t (**)(void))(v0 + 8))();
  }

uint64_t sub_100011048()
{
  uint64_t v2 = *(void *)(*(void *)v1 + 656LL);
  uint64_t v3 = *(void *)(*(void *)v1 + 648LL);
  *(void *)(*(void *)v1 + 664LL) = v0;
  swift_task_dealloc(v2);
  swift_release(v3);
  if (v0) {
    uint64_t v4 = sub_100011398;
  }
  else {
    uint64_t v4 = sub_1000110B8;
  }
  return swift_task_switch(v4, 0LL, 0LL);
}

uint64_t sub_1000110B8()
{
  uint64_t v1 = *(void *)(v0 + 512);
  uint64_t v2 = *(unsigned __int8 *)(v0 + 520);
  uint64_t v3 = *(void *)(v0 + 528);
  int v4 = *(unsigned __int8 *)(v0 + 536);
  if (*(_BYTE *)(v0 + 537)) {
    int v5 = 256;
  }
  else {
    int v5 = 0;
  }
  if (*(_BYTE *)(v0 + 538)) {
    int v6 = 0x10000;
  }
  else {
    int v6 = 0;
  }
  if (*(_BYTE *)(v0 + 539)) {
    int v7 = 0x1000000;
  }
  else {
    int v7 = 0;
  }
  int v32 = v7;
  if (v1)
  {
    int v31 = v6;
    uint64_t v8 = *(void *)(v1 + 16);
    if (v8)
    {
      int v29 = v5;
      int v30 = *(unsigned __int8 *)(v0 + 536);
      swift_bridgeObjectRetain(v1);
      uint64_t v9 = 32LL;
      do
      {
        memcpy((void *)(v0 + 16), (const void *)(v1 + v9), 0x1F0uLL);
        sub_100023A4C((void *)(v0 + 16));
        id v10 = sub_10001C514((double *)(v0 + 16));
        sub_100023C20((void *)(v0 + 16));
        id v11 = v10;
        specialized Array._makeUniqueAndReserveCapacityIfNotUnique()(v11);
        unint64_t v13 = *(void *)(((unint64_t)&_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8LL) + 0x10);
        unint64_t v12 = *(void *)(((unint64_t)&_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8LL) + 0x18);
        if (v13 >= v12 >> 1) {
          specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v12 > 1, v13 + 1, 1LL);
        }
        uint64_t v14 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v13, v11);
        specialized Array._endMutation()(v14);

        v9 += 496LL;
        --v8;
      }

      while (v8);
      swift_bridgeObjectRelease(v1);
      int v5 = v29;
      int v4 = v30;
    }

    int v6 = v31;
  }

  id v15 = objc_allocWithZone(&OBJC_CLASS___TVTopShelfCarouselContent);
  sub_10000A134(0LL, &qword_1000361B8, &OBJC_CLASS___TVTopShelfCarouselItem_ptr);
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(&_swiftEmptyArrayStorage);
  id v17 = [v15 initWithStyle:1 items:isa];

  if (v1)
  {
    int v18 = v5 | v4 | v6 | v32;
    swift_bridgeObjectRelease(v1);
  }

  else
  {
    uint64_t v3 = 0LL;
    int v18 = 0;
    uint64_t v2 = 2LL;
  }

  id v19 = *(void (**)(id, void))(v0 + 632);
  uint64_t v20 = *(void *)(v0 + 608);
  id v21 = objc_allocWithZone((Class)type metadata accessor for CachePolicy());
  __int16 v22 = sub_100013244(v2, v3, v18, 0);
  char v23 = (os_unfair_lock_s *)(v20 + OBJC_IVAR____TtC17TVUpNextExtension23TopShelfContentProvider_cachePolicyLock);
  swift_beginAccess( v20 + OBJC_IVAR____TtC17TVUpNextExtension23TopShelfContentProvider_cachePolicyLock,  v0 + 544,  33LL,  0LL);
  char v24 = v22;
  os_unfair_lock_lock(v23);
  swift_endAccess(v0 + 544);
  int v25 = *(void **)(v20 + OBJC_IVAR____TtC17TVUpNextExtension23TopShelfContentProvider__cachePolicy);
  *(void *)(v20 + OBJC_IVAR____TtC17TVUpNextExtension23TopShelfContentProvider__cachePolicy) = v24;
  char v26 = v24;

  swift_beginAccess(v23, v0 + 568, 33LL, 0LL);
  os_unfair_lock_unlock(v23);
  swift_endAccess(v0 + 568);

  sub_10000CD98();
  sub_10000CE84();

  id v27 = v17;
  v19(v17, 0LL);

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_100011398()
{
  uint64_t v1 = *(void *)(v0 + 664);
  uint64_t v2 = *(void (**)(void, uint64_t))(v0 + 632);
  swift_errorRetain(v1);
  v2(0LL, v1);
  swift_errorRelease(v1);
  swift_errorRelease(v1);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

void sub_100011404(void *a1, int a2, void *aBlock, void (*a4)(void))
{
  int v6 = _Block_copy(aBlock);
  _Block_copy(v6);
  id v7 = a1;
  a4();
  _Block_release(v6);
  _Block_release(v6);
}

void sub_100011468(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2) {
    uint64_t v5 = _convertErrorToNSError(_:)(a2);
  }
  else {
    uint64_t v5 = 0LL;
  }
  id v6 = (id)v5;
  (*(void (**)(uint64_t, uint64_t))(a3 + 16))(a3, a1);
}

void *sub_1000114C0()
{
  return &unk_100031570;
}

unint64_t sub_1000114CC()
{
  return 0xD00000000000001ALL;
}

uint64_t sub_1000114E8(uint64_t a1, uint64_t a2)
{
  return swift_bridgeObjectRetain(a2);
}

void sub_1000114F0(void *a1, char a2, uint64_t a3)
{
  id v6 = (void *)objc_opt_self(&OBJC_CLASS___JSValue);
  if (![v6 valueWithNewObjectInContext:a1])
  {
    __break(1u);
    goto LABEL_6;
  }

  char v15 = a2 & 1;
  id v7 = a1;
  uint64_t v8 = _bridgeAnythingNonVerbatimToObjectiveC<A>(_:)(&v15, &type metadata for Bool);
  id v9 = [v6 valueWithObject:v8 inContext:v7];
  swift_unknownObjectRelease(v8);

  if (!v9)
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }

  JSValue.subscript.setter(v9, 0x614365726F6E6769LL, 0xEB00000000656863LL);
  uint64_t v14 = a3;
  id v10 = v7;
  swift_bridgeObjectRetain(a3);
  uint64_t v11 = sub_100008A20(&qword_100036050);
  uint64_t v12 = _bridgeAnythingNonVerbatimToObjectiveC<A>(_:)(&v14, v11);
  id v13 = objc_msgSend(v6, "valueWithObject:inContext:", v12, v10, v14);
  swift_unknownObjectRelease(v12);

  if (v13)
  {
    JSValue.subscript.setter(v13, 0xD000000000000015LL, 0x8000000100028C80LL);
    return;
  }

LABEL_7:
  __break(1u);
}

uint64_t sub_100011670()
{
  if (*v0) {
    return 0xD000000000000015LL;
  }
  else {
    return 0x614365726F6E6769LL;
  }
}

uint64_t sub_1000116B8@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result = sub_10001DA0C(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1000116DC(uint64_t a1)
{
  unint64_t v2 = sub_10001BF44();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_100011704(uint64_t a1)
{
  unint64_t v2 = sub_10001BF44();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_10001172C(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = sub_100008A20(&qword_1000360A0);
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  id v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v11 = a1[3];
  uint64_t v12 = a1[4];
  sub_10000A0F0(a1, v11);
  unint64_t v13 = sub_10001BF44();
  dispatch thunk of Encoder.container<A>(keyedBy:)( &type metadata for FetchFeaturedContentIntent.CodingKeys,  &type metadata for FetchFeaturedContentIntent.CodingKeys,  v13,  v11,  v12);
  char v20 = 0;
  KeyedEncodingContainer.encode(_:forKey:)(a2, &v20, v7);
  if (!v3)
  {
    uint64_t v18 = a3;
    char v19 = 1;
    uint64_t v14 = sub_100008A20(&qword_100036050);
    uint64_t v15 = sub_100024838( &qword_100036060,  &qword_100036050,  (uint64_t)&protocol witness table for String,  (uint64_t)&protocol conformance descriptor for <A> [A]);
    KeyedEncodingContainer.encode<A>(_:forKey:)(&v18, &v19, v7, v14, v15);
  }

  return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

uint64_t sub_10001188C(void *a1)
{
  return sub_10001DB10(a1) & 1;
}

void sub_1000118A4(void *a1@<X8>)
{
  *a1 = 0xD00000000000001ALL;
  a1[1] = 0x8000000100027760LL;
}

uint64_t sub_1000118C4@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result = sub_10001DB10(a1);
  if (!v2)
  {
    *(_BYTE *)a2 = result & 1;
    *(void *)(a2 + 8) = v5;
  }

  return result;
}

uint64_t sub_1000118F4(void *a1)
{
  return sub_10001172C(a1, *v1, *((void *)v1 + 1));
}

void sub_100011910(void *a1)
{
}

uint64_t sub_10001191C()
{
  uint64_t v1 = *(void *)(v0 + 64);
  swift_bridgeObjectRetain(*(void *)(v0 + 72));
  return v1;
}

uint64_t sub_100011948(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease(*(void *)(v2 + 72));
  *(void *)(v2 + 64) = a1;
  *(void *)(v2 + 72) = a2;
  return result;
}

uint64_t sub_10001197C()
{
  return swift_bridgeObjectRetain(*(void *)(v0 + 160));
}

uint64_t sub_100011984(uint64_t a1)
{
  uint64_t result = swift_bridgeObjectRelease(*(void *)(v1 + 160));
  *(void *)(v1 + 160) = a1;
  return result;
}

uint64_t sub_1000119AC()
{
  uint64_t v1 = *(void *)(v0 + 168);
  swift_bridgeObjectRetain(*(void *)(v0 + 176));
  return v1;
}

uint64_t sub_1000119D8(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease(*(void *)(v2 + 176));
  *(void *)(v2 + 168) = a1;
  *(void *)(v2 + 176) = a2;
  return result;
}

uint64_t (*sub_100011A0C())()
{
  return nullsub_1;
}

uint64_t sub_100011A1C()
{
  return swift_bridgeObjectRetain(*(void *)(v0 + 184));
}

uint64_t sub_100011A24(uint64_t a1)
{
  uint64_t result = swift_bridgeObjectRelease(*(void *)(v1 + 184));
  *(void *)(v1 + 184) = a1;
  return result;
}

uint64_t (*sub_100011A4C())()
{
  return nullsub_1;
}

uint64_t sub_100011A5C()
{
  return *(void *)(v0 + 192);
}

uint64_t sub_100011A64(uint64_t result)
{
  *(void *)(v1 + 192) = result;
  return result;
}

uint64_t sub_100011A6C()
{
  return *(void *)(v0 + 200);
}

uint64_t sub_100011A74(uint64_t result)
{
  *(void *)(v1 + 200) = result;
  return result;
}

uint64_t (*sub_100011A7C())()
{
  return nullsub_1;
}

uint64_t sub_100011A8C()
{
  uint64_t v1 = *(void *)(v0 + 208);
  swift_bridgeObjectRetain(*(void *)(v0 + 216));
  return v1;
}

uint64_t sub_100011AB8(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease(*(void *)(v2 + 216));
  *(void *)(v2 + 208) = a1;
  *(void *)(v2 + 216) = a2;
  return result;
}

uint64_t sub_100011AEC()
{
  return *(void *)(v0 + 224);
}

uint64_t sub_100011AF4(uint64_t result)
{
  *(void *)(v1 + 224) = result;
  return result;
}

uint64_t sub_100011AFC()
{
  return *(unsigned int *)(v0 + 232);
}

uint64_t sub_100011B04(uint64_t result)
{
  *(_DWORD *)(v1 + 232) = result;
  return result;
}

uint64_t (*sub_100011B0C())()
{
  return nullsub_1;
}

double sub_100011B1C()
{
  return *(double *)(v0 + 240);
}

void sub_100011B24(double a1)
{
  *(double *)(v1 + 240) = a1;
}

uint64_t (*sub_100011B2C())()
{
  return nullsub_1;
}

uint64_t sub_100011B3C()
{
  return *(void *)(v0 + 248);
}

uint64_t sub_100011B44(uint64_t result)
{
  *(void *)(v1 + 248) = result;
  return result;
}

uint64_t (*sub_100011B4C())()
{
  return nullsub_1;
}

uint64_t sub_100011B5C()
{
  uint64_t v1 = *(void *)(v0 + 256);
  swift_bridgeObjectRetain(*(void *)(v0 + 264));
  return v1;
}

uint64_t sub_100011B88(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease(*(void *)(v2 + 264));
  *(void *)(v2 + 256) = a1;
  *(void *)(v2 + 264) = a2;
  return result;
}

uint64_t (*sub_100011BBC())()
{
  return nullsub_1;
}

uint64_t sub_100011BCC()
{
  uint64_t v1 = *(void *)(v0 + 272);
  swift_bridgeObjectRetain(*(void *)(v0 + 280));
  return v1;
}

uint64_t sub_100011BF8(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease(*(void *)(v2 + 280));
  *(void *)(v2 + 272) = a1;
  *(void *)(v2 + 280) = a2;
  return result;
}

uint64_t (*sub_100011C2C())()
{
  return nullsub_1;
}

uint64_t sub_100011C3C()
{
  uint64_t v1 = *(void *)(v0 + 288);
  swift_bridgeObjectRetain(*(void *)(v0 + 296));
  return v1;
}

uint64_t sub_100011C68(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease(*(void *)(v2 + 296));
  *(void *)(v2 + 288) = a1;
  *(void *)(v2 + 296) = a2;
  return result;
}

uint64_t (*sub_100011C9C())()
{
  return nullsub_1;
}

uint64_t sub_100011CAC()
{
  uint64_t v1 = *(void *)(v0 + 304);
  swift_bridgeObjectRetain(*(void *)(v0 + 312));
  return v1;
}

uint64_t sub_100011CD8(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease(*(void *)(v2 + 312));
  *(void *)(v2 + 304) = a1;
  *(void *)(v2 + 312) = a2;
  return result;
}

uint64_t (*sub_100011D0C())()
{
  return nullsub_1;
}

uint64_t sub_100011D1C()
{
  uint64_t v1 = *(void *)(v0 + 320);
  swift_bridgeObjectRetain(*(void *)(v0 + 328));
  return v1;
}

uint64_t sub_100011D48(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease(*(void *)(v2 + 328));
  *(void *)(v2 + 320) = a1;
  *(void *)(v2 + 328) = a2;
  return result;
}

uint64_t (*sub_100011D7C())()
{
  return nullsub_1;
}

uint64_t sub_100011D8C()
{
  return swift_bridgeObjectRetain(*(void *)(v0 + 336));
}

uint64_t sub_100011D94(uint64_t a1)
{
  uint64_t result = swift_bridgeObjectRelease(*(void *)(v1 + 336));
  *(void *)(v1 + 336) = a1;
  return result;
}

uint64_t (*sub_100011DBC())()
{
  return nullsub_1;
}

uint64_t sub_100011DCC()
{
  uint64_t v1 = *(void *)(v0 + 344);
  swift_bridgeObjectRetain(*(void *)(v0 + 352));
  return v1;
}

uint64_t sub_100011DF8(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease(*(void *)(v2 + 352));
  *(void *)(v2 + 344) = a1;
  *(void *)(v2 + 352) = a2;
  return result;
}

uint64_t (*sub_100011E2C())()
{
  return nullsub_1;
}

uint64_t sub_100011E3C()
{
  uint64_t v1 = *(void *)(v0 + 360);
  swift_bridgeObjectRetain(*(void *)(v0 + 368));
  return v1;
}

uint64_t sub_100011E68(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease(*(void *)(v2 + 368));
  *(void *)(v2 + 360) = a1;
  *(void *)(v2 + 368) = a2;
  return result;
}

uint64_t (*sub_100011E9C())()
{
  return nullsub_1;
}

uint64_t sub_100011EAC()
{
  uint64_t v1 = *(void *)(v0 + 376);
  swift_bridgeObjectRetain(*(void *)(v0 + 384));
  return v1;
}

uint64_t sub_100011ED8(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease(*(void *)(v2 + 384));
  *(void *)(v2 + 376) = a1;
  *(void *)(v2 + 384) = a2;
  return result;
}

uint64_t (*sub_100011F0C())()
{
  return nullsub_1;
}

uint64_t sub_100011F1C()
{
  uint64_t v1 = *(void *)(v0 + 392);
  swift_bridgeObjectRetain(*(void *)(v0 + 400));
  return v1;
}

uint64_t sub_100011F48(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease(*(void *)(v2 + 400));
  *(void *)(v2 + 392) = a1;
  *(void *)(v2 + 400) = a2;
  return result;
}

uint64_t (*sub_100011F7C())()
{
  return nullsub_1;
}

uint64_t sub_100011F8C()
{
  uint64_t v1 = *(void *)(v0 + 408);
  swift_bridgeObjectRetain(*(void *)(v0 + 416));
  return v1;
}

uint64_t sub_100011FB8(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease(*(void *)(v2 + 416));
  *(void *)(v2 + 408) = a1;
  *(void *)(v2 + 416) = a2;
  return result;
}

uint64_t (*sub_100011FEC())()
{
  return nullsub_1;
}

uint64_t sub_100011FFC()
{
  uint64_t v1 = *(void *)(v0 + 424);
  swift_bridgeObjectRetain(*(void *)(v0 + 432));
  return v1;
}

uint64_t sub_100012028(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease(*(void *)(v2 + 432));
  *(void *)(v2 + 424) = a1;
  *(void *)(v2 + 432) = a2;
  return result;
}

uint64_t (*sub_10001205C())()
{
  return nullsub_1;
}

uint64_t sub_10001206C()
{
  uint64_t v1 = *(void *)(v0 + 440);
  swift_bridgeObjectRetain(*(void *)(v0 + 448));
  return v1;
}

uint64_t sub_100012098(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease(*(void *)(v2 + 448));
  *(void *)(v2 + 440) = a1;
  *(void *)(v2 + 448) = a2;
  return result;
}

uint64_t (*sub_1000120CC())()
{
  return nullsub_1;
}

uint64_t sub_1000120DC()
{
  return swift_bridgeObjectRetain(*(void *)(v0 + 456));
}

uint64_t sub_1000120E4(uint64_t a1)
{
  uint64_t result = swift_bridgeObjectRelease(*(void *)(v1 + 456));
  *(void *)(v1 + 456) = a1;
  return result;
}

uint64_t (*sub_10001210C())()
{
  return nullsub_1;
}

uint64_t sub_10001211C()
{
  uint64_t v1 = *(void *)(v0 + 464);
  swift_bridgeObjectRetain(*(void *)(v0 + 472));
  return v1;
}

uint64_t sub_100012148(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease(*(void *)(v2 + 472));
  *(void *)(v2 + 464) = a1;
  *(void *)(v2 + 472) = a2;
  return result;
}

uint64_t (*sub_10001217C())()
{
  return nullsub_1;
}

uint64_t sub_10001218C()
{
  uint64_t v1 = *(void *)(v0 + 480);
  swift_bridgeObjectRetain(*(void *)(v0 + 488));
  return v1;
}

uint64_t sub_1000121B8(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease(*(void *)(v2 + 488));
  *(void *)(v2 + 480) = a1;
  *(void *)(v2 + 488) = a2;
  return result;
}

uint64_t (*sub_1000121EC())()
{
  return nullsub_1;
}

uint64_t sub_1000121FC(unsigned __int8 a1)
{
  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_100012238 + 4 * byte_1000276B3[a1]))( 0x6163696E6F6E6163LL,  0xEB0000000044496CLL);
}

uint64_t sub_100012238()
{
  return 0x656C746974LL;
}

uint64_t sub_10001224C()
{
  return 0x7972616D6D7573LL;
}

uint64_t sub_100012264()
{
  return 0x65726E6567LL;
}

uint64_t sub_100012278()
{
  return 0x616D49656C746974LL;
}

unint64_t sub_1000122AC()
{
  return 0xD000000000000014LL;
}

unint64_t sub_100012540()
{
  return 0xD000000000000016LL;
}

unint64_t sub_100012558()
{
  return 0xD000000000000018LL;
}

void sub_100012570()
{
}

Swift::Int sub_100012590()
{
  Swift::UInt v1 = *v0;
  Hasher.init(_seed:)(v3, 0LL);
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

Swift::Int sub_1000125D4(uint64_t a1)
{
  Swift::UInt v2 = *v1;
  Hasher.init(_seed:)(v4, a1);
  Hasher._combine(_:)(v2);
  return Hasher._finalize()();
}

uint64_t sub_100012614()
{
  return sub_1000121FC(*v0);
}

uint64_t sub_10001261C@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result = sub_10001DCE8(a1, a2);
  *a3 = result;
  return result;
}

void sub_100012640(_BYTE *a1@<X8>)
{
  *a1 = 36;
}

uint64_t sub_10001264C(uint64_t a1)
{
  unint64_t v2 = sub_10001DCA4();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_100012674(uint64_t a1)
{
  unint64_t v2 = sub_10001DCA4();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_10001269C(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = sub_100008A20(&qword_1000360A8);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v75 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = a1[3];
  uint64_t v10 = a1[4];
  sub_10000A0F0(a1, v9);
  unint64_t v11 = sub_10001DCA4();
  dispatch thunk of Encoder.container<A>(keyedBy:)( &type metadata for FeaturedContent.CodingKeys,  &type metadata for FeaturedContent.CodingKeys,  v11,  v9,  v10);
  double v12 = *v3;
  uint64_t v13 = *((void *)v3 + 1);
  LOBYTE(v76) = 0;
  KeyedEncodingContainer.encode(_:forKey:)(*(void *)&v12, v13, &v76, v5);
  if (!v2)
  {
    uint64_t v14 = *((void *)v3 + 2);
    uint64_t v15 = *((void *)v3 + 3);
    LOBYTE(v76) = 1;
    KeyedEncodingContainer.encode(_:forKey:)(v14, v15, &v76, v5);
    uint64_t v16 = *((void *)v3 + 4);
    uint64_t v17 = *((void *)v3 + 5);
    LOBYTE(v76) = 2;
    KeyedEncodingContainer.encode(_:forKey:)(v16, v17, &v76, v5);
    uint64_t v18 = *((void *)v3 + 6);
    uint64_t v19 = *((void *)v3 + 7);
    LOBYTE(v76) = 3;
    KeyedEncodingContainer.encode(_:forKey:)(v18, v19, &v76, v5);
    uint64_t v20 = *((void *)v3 + 8);
    uint64_t v21 = *((void *)v3 + 9);
    LOBYTE(v76) = 4;
    KeyedEncodingContainer.encode(_:forKey:)(v20, v21, &v76, v5);
    uint64_t v22 = *((void *)v3 + 10);
    uint64_t v23 = *((void *)v3 + 11);
    LOBYTE(v76) = 5;
    KeyedEncodingContainer.encode(_:forKey:)(v22, v23, &v76, v5);
    uint64_t v24 = *((void *)v3 + 12);
    uint64_t v25 = *((void *)v3 + 13);
    LOBYTE(v76) = 6;
    KeyedEncodingContainer.encode(_:forKey:)(v24, v25, &v76, v5);
    uint64_t v26 = *((void *)v3 + 14);
    uint64_t v27 = *((void *)v3 + 15);
    LOBYTE(v76) = 7;
    KeyedEncodingContainer.encode(_:forKey:)(v26, v27, &v76, v5);
    uint64_t v28 = *((void *)v3 + 16);
    uint64_t v29 = *((void *)v3 + 17);
    LOBYTE(v76) = 8;
    KeyedEncodingContainer.encode(_:forKey:)(v28, v29, &v76, v5);
    uint64_t v30 = *((void *)v3 + 18);
    uint64_t v31 = *((void *)v3 + 19);
    LOBYTE(v76) = 9;
    KeyedEncodingContainer.encode(_:forKey:)(v30, v31, &v76, v5);
    uint64_t v76 = *((void *)v3 + 20);
    HIBYTE(v75) = 10;
    uint64_t v32 = sub_100008A20(&qword_100036050);
    uint64_t v33 = sub_100024838( &qword_100036060,  &qword_100036050,  (uint64_t)&protocol witness table for String,  (uint64_t)&protocol conformance descriptor for <A> [A]);
    KeyedEncodingContainer.encode<A>(_:forKey:)(&v76, (char *)&v75 + 7, v5, v32, v33);
    uint64_t v34 = *((void *)v3 + 21);
    uint64_t v35 = *((void *)v3 + 22);
    LOBYTE(v76) = 11;
    KeyedEncodingContainer.encode(_:forKey:)(v34, v35, &v76, v5);
    uint64_t v76 = *((void *)v3 + 23);
    HIBYTE(v75) = 12;
    KeyedEncodingContainer.encode<A>(_:forKey:)(&v76, (char *)&v75 + 7, v5, v32, v33);
    uint64_t v36 = *((void *)v3 + 24);
    LOBYTE(v76) = 13;
    KeyedEncodingContainer.encode(_:forKey:)(v36, &v76, v5);
    uint64_t v37 = *((void *)v3 + 25);
    LOBYTE(v76) = 14;
    KeyedEncodingContainer.encode(_:forKey:)(v37, &v76, v5);
    uint64_t v38 = *((void *)v3 + 26);
    uint64_t v39 = *((void *)v3 + 27);
    LOBYTE(v76) = 15;
    KeyedEncodingContainer.encode(_:forKey:)(v38, v39, &v76, v5);
    uint64_t v40 = *((void *)v3 + 28);
    LOBYTE(v76) = 16;
    KeyedEncodingContainer.encode(_:forKey:)(v40, &v76, v5);
    uint64_t v41 = *((unsigned int *)v3 + 58);
    LOBYTE(v76) = 17;
    KeyedEncodingContainer.encode(_:forKey:)(v41, &v76, v5);
    double v42 = v3[30];
    LOBYTE(v76) = 18;
    KeyedEncodingContainer.encode(_:forKey:)(&v76, v5, v42);
    uint64_t v43 = *((void *)v3 + 31);
    LOBYTE(v76) = 19;
    KeyedEncodingContainer.encode(_:forKey:)(v43, &v76, v5);
    uint64_t v44 = *((void *)v3 + 32);
    uint64_t v45 = *((void *)v3 + 33);
    LOBYTE(v76) = 20;
    KeyedEncodingContainer.encode(_:forKey:)(v44, v45, &v76, v5);
    uint64_t v46 = *((void *)v3 + 34);
    uint64_t v47 = *((void *)v3 + 35);
    LOBYTE(v76) = 21;
    KeyedEncodingContainer.encode(_:forKey:)(v46, v47, &v76, v5);
    uint64_t v48 = *((void *)v3 + 36);
    uint64_t v49 = *((void *)v3 + 37);
    LOBYTE(v76) = 22;
    KeyedEncodingContainer.encode(_:forKey:)(v48, v49, &v76, v5);
    uint64_t v50 = *((void *)v3 + 38);
    uint64_t v51 = *((void *)v3 + 39);
    LOBYTE(v76) = 23;
    KeyedEncodingContainer.encode(_:forKey:)(v50, v51, &v76, v5);
    uint64_t v52 = *((void *)v3 + 40);
    uint64_t v53 = *((void *)v3 + 41);
    LOBYTE(v76) = 24;
    KeyedEncodingContainer.encode(_:forKey:)(v52, v53, &v76, v5);
    uint64_t v76 = *((void *)v3 + 42);
    HIBYTE(v75) = 25;
    uint64_t v54 = sub_100008A20(&qword_1000360B0);
    uint64_t v55 = sub_100024894( &qword_1000360B8,  (uint64_t)&protocol witness table for String,  (uint64_t)&protocol conformance descriptor for <> [A : B]);
    KeyedEncodingContainer.encode<A>(_:forKey:)(&v76, (char *)&v75 + 7, v5, v54, v55);
    uint64_t v56 = *((void *)v3 + 43);
    uint64_t v57 = *((void *)v3 + 44);
    LOBYTE(v76) = 26;
    KeyedEncodingContainer.encode(_:forKey:)(v56, v57, &v76, v5);
    uint64_t v58 = *((void *)v3 + 45);
    uint64_t v59 = *((void *)v3 + 46);
    LOBYTE(v76) = 27;
    KeyedEncodingContainer.encodeIfPresent(_:forKey:)(v58, v59, &v76, v5);
    uint64_t v60 = *((void *)v3 + 47);
    uint64_t v61 = *((void *)v3 + 48);
    LOBYTE(v76) = 28;
    KeyedEncodingContainer.encode(_:forKey:)(v60, v61, &v76, v5);
    uint64_t v62 = *((void *)v3 + 49);
    uint64_t v63 = *((void *)v3 + 50);
    LOBYTE(v76) = 29;
    KeyedEncodingContainer.encode(_:forKey:)(v62, v63, &v76, v5);
    uint64_t v64 = *((void *)v3 + 51);
    uint64_t v65 = *((void *)v3 + 52);
    LOBYTE(v76) = 30;
    KeyedEncodingContainer.encode(_:forKey:)(v64, v65, &v76, v5);
    uint64_t v66 = *((void *)v3 + 53);
    uint64_t v67 = *((void *)v3 + 54);
    LOBYTE(v76) = 31;
    KeyedEncodingContainer.encode(_:forKey:)(v66, v67, &v76, v5);
    uint64_t v68 = *((void *)v3 + 55);
    uint64_t v69 = *((void *)v3 + 56);
    LOBYTE(v76) = 32;
    KeyedEncodingContainer.encode(_:forKey:)(v68, v69, &v76, v5);
    uint64_t v76 = *((void *)v3 + 57);
    HIBYTE(v75) = 33;
    KeyedEncodingContainer.encode<A>(_:forKey:)(&v76, (char *)&v75 + 7, v5, v54, v55);
    uint64_t v70 = *((void *)v3 + 58);
    uint64_t v71 = *((void *)v3 + 59);
    LOBYTE(v76) = 34;
    KeyedEncodingContainer.encode(_:forKey:)(v70, v71, &v76, v5);
    uint64_t v72 = *((void *)v3 + 60);
    uint64_t v73 = *((void *)v3 + 61);
    LOBYTE(v76) = 35;
    KeyedEncodingContainer.encodeIfPresent(_:forKey:)(v72, v73, &v76, v5);
  }

  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t sub_100012DA8@<X0>( uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, double a10@<D0>, __int128 a11, __int128 a12, __int128 a13, __int128 a14, __int128 a15, __int128 a16, __int128 a17, __int128 a18, __int128 a19, __int128 a20, uint64_t a21, int a22, __int128 a23, __int128 a24, __int128 a25, __int128 a26, __int128 a27, __int128 a28, __int128 a29, __int128 a30, __int128 a31, __int128 a32, __int128 a33, __int128 a34, __int128 a35, __int128 a36, __int128 a37, uint64_t a38)
{
  *(void *)a9 = result;
  *(void *)(a9 + 8) = a2;
  *(void *)(a9 + 16) = a3;
  *(void *)(a9 + 24) = a4;
  *(void *)(a9 + 32) = a5;
  *(void *)(a9 + 40) = a6;
  *(void *)(a9 + 48) = a7;
  *(void *)(a9 + 56) = a8;
  *(_OWORD *)(a9 + 64) = a11;
  *(_OWORD *)(a9 + 80) = a12;
  *(_OWORD *)(a9 + 96) = a13;
  *(_OWORD *)(a9 + 112) = a14;
  *(_OWORD *)(a9 + 128) = a15;
  *(_OWORD *)(a9 + 144) = a16;
  *(_OWORD *)(a9 + 160) = a17;
  *(_OWORD *)(a9 + 176) = a18;
  *(_OWORD *)(a9 + 192) = a19;
  *(_OWORD *)(a9 + 208) = a20;
  *(void *)(a9 + 224) = a21;
  *(_DWORD *)(a9 + 232) = a22;
  *(double *)(a9 + 240) = a10;
  *(_OWORD *)(a9 + 248) = a23;
  *(_OWORD *)(a9 + 264) = a24;
  *(_OWORD *)(a9 + 280) = a25;
  *(_OWORD *)(a9 + 296) = a26;
  *(_OWORD *)(a9 + 312) = a27;
  *(_OWORD *)(a9 + 328) = a28;
  *(_OWORD *)(a9 + 344) = a29;
  *(_OWORD *)(a9 + 360) = a30;
  *(_OWORD *)(a9 + 376) = a31;
  *(_OWORD *)(a9 + 392) = a32;
  *(_OWORD *)(a9 + 408) = a33;
  *(_OWORD *)(a9 + 424) = a34;
  *(_OWORD *)(a9 + 440) = a35;
  *(_OWORD *)(a9 + 456) = a36;
  *(_OWORD *)(a9 + 472) = a37;
  *(void *)(a9 + 488) = a38;
  return result;
}

void *sub_100012EA4@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t result = sub_10001EAAC(a1, v5);
  if (!v2) {
    return memcpy(a2, v5, 0x1F0uLL);
  }
  return result;
}

uint64_t sub_100012EF4(void *a1)
{
  return sub_10001269C(a1);
}

uint64_t sub_100012F08(uint64_t a1)
{
  unint64_t v2 = sub_100020D50();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_100012F30(uint64_t a1)
{
  unint64_t v2 = sub_100020D50();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_100012F58(void *a1, uint64_t a2, int a3, uint64_t a4, int a5)
{
  uint64_t v20 = a4;
  int v25 = a3;
  uint64_t v9 = sub_100008A20(&qword_1000360C0);
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  double v12 = (char *)&v21[-1] - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v14 = a1[3];
  uint64_t v13 = a1[4];
  sub_10000A0F0(a1, v14);
  unint64_t v15 = sub_100020D50();
  dispatch thunk of Encoder.container<A>(keyedBy:)( &type metadata for FeaturedReturnType.CodingKeys,  &type metadata for FeaturedReturnType.CodingKeys,  v15,  v14,  v13);
  v21[0] = a2;
  char v26 = 0;
  uint64_t v16 = sub_100008A20(&qword_1000360C8);
  uint64_t v17 = sub_100020D94( &qword_1000360D0,  &qword_1000360C8,  (void (*)(void))sub_100020DF8,  (uint64_t)&protocol conformance descriptor for <A> [A]);
  KeyedEncodingContainer.encode<A>(_:forKey:)(v21, &v26, v9, v16, v17);
  if (!v5)
  {
    LOBYTE(v21[0]) = v25 & 1;
    v21[1] = v20;
    __int16 v22 = a5 & 0x101;
    char v23 = BYTE2(a5) & 1;
    char v24 = HIBYTE(a5) & 1;
    char v26 = 1;
    unint64_t v18 = sub_10001BCC8();
    KeyedEncodingContainer.encode<A>(_:forKey:)(v21, &v26, v9, &type metadata for CachePolicyRelay, v18);
  }

  return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v12, v9);
}

uint64_t sub_100013104(uint64_t a1)
{
  return sub_100013124(a1, (uint64_t (*)(void))sub_100020F40);
}

uint64_t sub_100013124(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t result = a2();
  if (v2) {
    return v4 & 0x1010101;
  }
  return result;
}

uint64_t sub_100013154@<X0>(uint64_t a1@<X8>)
{
  return sub_100013170((uint64_t (*)(void))sub_100020F40, a1);
}

uint64_t sub_100013170@<X0>(uint64_t (*a1)(void)@<X3>, uint64_t a2@<X8>)
{
  uint64_t result = a1();
  if (!v2)
  {
    *(void *)a2 = result;
    *(_BYTE *)(a2 + 8) = v5 & 1;
    *(void *)(a2 + 16) = v6;
    *(_BYTE *)(a2 + 24) = v7 & 1;
    *(_BYTE *)(a2 + 25) = BYTE1(v7) & 1;
    *(_BYTE *)(a2 + 26) = BYTE2(v7) & 1;
    *(_BYTE *)(a2 + 27) = HIBYTE(v7) & 1;
  }

  return result;
}

uint64_t sub_1000131C4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1000131E0(a1, a2, a3, (uint64_t (*)(uint64_t, void, void, void, void))sub_100012F58);
}

uint64_t sub_1000131E0( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(uint64_t, void, void, void, void))
{
  if (*(_BYTE *)(v4 + 25)) {
    int v5 = 256;
  }
  else {
    int v5 = 0;
  }
  int v6 = v5 | *(unsigned __int8 *)(v4 + 24);
  if (*(_BYTE *)(v4 + 26)) {
    int v7 = 0x10000;
  }
  else {
    int v7 = 0;
  }
  if (*(_BYTE *)(v4 + 27)) {
    int v8 = 0x1000000;
  }
  else {
    int v8 = 0;
  }
  return a4(a1, *(void *)v4, *(unsigned __int8 *)(v4 + 8), *(void *)(v4 + 16), v6 | v7 | v8);
}

_BYTE *sub_100013244(uint64_t a1, uint64_t a2, int a3, char a4)
{
  uint64_t v9 = &v4[OBJC_IVAR____TtC17TVUpNextExtensionP33_CEB3B327E539852F953463821CB150CF11CachePolicy_policy];
  *(_OWORD *)uint64_t v9 = xmmword_100028620;
  *((_DWORD *)v9 + 4) = 0;
  v4[OBJC_IVAR____TtC17TVUpNextExtensionP33_CEB3B327E539852F953463821CB150CF11CachePolicy_cacheIsValid] = 0;
  *(void *)&v4[OBJC_IVAR____TtC17TVUpNextExtensionP33_CEB3B327E539852F953463821CB150CF11CachePolicy_ttl] = 0LL;
  v4[OBJC_IVAR____TtC17TVUpNextExtensionP33_CEB3B327E539852F953463821CB150CF11CachePolicy_cacheReflectsUpNextContent] = 0;
  v19.receiver = v4;
  v19.super_class = (Class)type metadata accessor for CachePolicy();
  uint64_t v10 = (char *)objc_msgSendSuper2(&v19, "init");
  uint64_t v11 = v10;
  double v12 = &v10[OBJC_IVAR____TtC17TVUpNextExtensionP33_CEB3B327E539852F953463821CB150CF11CachePolicy_policy];
  *(void *)double v12 = a1;
  *((void *)v12 + 1) = a2;
  *((_DWORD *)v12 + 4) = a3;
  v10[OBJC_IVAR____TtC17TVUpNextExtensionP33_CEB3B327E539852F953463821CB150CF11CachePolicy_cacheReflectsUpNextContent] = a4;
  if ((a1 & 1) != 0)
  {
    v10[OBJC_IVAR____TtC17TVUpNextExtensionP33_CEB3B327E539852F953463821CB150CF11CachePolicy_cacheIsValid] = 1;
    uint64_t v14 = v10;
    sub_100013478();
  }

  else
  {
    v10[OBJC_IVAR____TtC17TVUpNextExtensionP33_CEB3B327E539852F953463821CB150CF11CachePolicy_cacheIsValid] = 0;
    uint64_t v13 = v10;
  }

  _StringGuts.grow(_:)(28LL);
  swift_bridgeObjectRelease(0xE000000000000000LL);
  if (v11[OBJC_IVAR____TtC17TVUpNextExtensionP33_CEB3B327E539852F953463821CB150CF11CachePolicy_cacheIsValid]) {
    uint64_t v15 = 1702195828LL;
  }
  else {
    uint64_t v15 = 0x65736C6166LL;
  }
  if (v11[OBJC_IVAR____TtC17TVUpNextExtensionP33_CEB3B327E539852F953463821CB150CF11CachePolicy_cacheIsValid]) {
    unint64_t v16 = 0xE400000000000000LL;
  }
  else {
    unint64_t v16 = 0xE500000000000000LL;
  }
  unint64_t v17 = v16;
  String.append(_:)(*(Swift::String *)&v15);
  swift_bridgeObjectRelease(v16);
  _s17TVUpNextExtension23TopShelfContentProviderC3logyySSFZ_0(0xD00000000000001ALL, 0x80000001000299F0LL);
  swift_bridgeObjectRelease(0x80000001000299F0LL);

  return v11;
}

id sub_1000133C8()
{
  Swift::UInt v1 = v0;
  uint64_t v2 = OBJC_IVAR____TtC17TVUpNextExtensionP33_CEB3B327E539852F953463821CB150CF11CachePolicy_ttl;
  uint64_t v3 = *(void *)&v0[OBJC_IVAR____TtC17TVUpNextExtensionP33_CEB3B327E539852F953463821CB150CF11CachePolicy_ttl];
  if (v3)
  {
    uint64_t v4 = swift_retain(v3);
    dispatch thunk of DispatchWorkItem.cancel()(v4);
    swift_release(v3);
    uint64_t v5 = *(void *)&v1[v2];
  }

  else
  {
    uint64_t v5 = 0LL;
  }

  *(void *)&v1[v2] = 0LL;
  swift_release(v5);
  v7.receiver = v1;
  v7.super_class = (Class)type metadata accessor for CachePolicy();
  return objc_msgSendSuper2(&v7, "dealloc");
}

uint64_t sub_100013478()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for DispatchTime(0LL);
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = ((uint64_t (*)(void))__chkstk_darwin)();
  int v6 = (char *)&v32 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v4);
  int v8 = (char *)&v32 - v7;
  uint64_t v9 = type metadata accessor for DispatchWorkItemFlags(0LL);
  uint64_t result = __chkstk_darwin(v9);
  double v12 = (char *)&v32 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v13 = *(void *)(v1 + OBJC_IVAR____TtC17TVUpNextExtensionP33_CEB3B327E539852F953463821CB150CF11CachePolicy_policy + 8);
  if (*(_BYTE *)(v1 + OBJC_IVAR____TtC17TVUpNextExtensionP33_CEB3B327E539852F953463821CB150CF11CachePolicy_policy) != 2LL
    && v13 >= 1)
  {
    uint64_t v15 = swift_allocObject(&unk_100031FE8, 24LL, 7LL);
    uint64_t v33 = v3;
    uint64_t v34 = v2;
    uint64_t v16 = v15;
    swift_unknownObjectWeakInit(v15 + 16, v1);
    aBlock[4] = sub_100023800;
    uint64_t v37 = v16;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256LL;
    aBlock[2] = sub_10000D974;
    aBlock[3] = &unk_100032000;
    uint64_t v32 = _Block_copy(aBlock);
    uint64_t v35 = &_swiftEmptyArrayStorage;
    uint64_t v17 = sub_100024A00( &qword_100036170,  (uint64_t (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags,  (uint64_t)&protocol conformance descriptor for DispatchWorkItemFlags);
    swift_retain(v16);
    uint64_t v18 = sub_100008A20(&qword_100036178);
    uint64_t v19 = sub_100024D94(&qword_100036180, &qword_100036178, (uint64_t)&protocol conformance descriptor for [A]);
    dispatch thunk of SetAlgebra.init<A>(_:)(&v35, v18, v19, v9, v17);
    uint64_t v20 = type metadata accessor for DispatchWorkItem(0LL);
    swift_allocObject(v20, *(unsigned int *)(v20 + 48), *(unsigned __int16 *)(v20 + 52));
    uint64_t v21 = DispatchWorkItem.init(flags:block:)(v12, v32);
    uint64_t v22 = v37;
    uint64_t v23 = v16;
    uint64_t v25 = v33;
    uint64_t v24 = v34;
    swift_release(v23);
    swift_release(v22);
    uint64_t v26 = OBJC_IVAR____TtC17TVUpNextExtensionP33_CEB3B327E539852F953463821CB150CF11CachePolicy_ttl;
    uint64_t v27 = *(void *)(v1 + OBJC_IVAR____TtC17TVUpNextExtensionP33_CEB3B327E539852F953463821CB150CF11CachePolicy_ttl);
    *(void *)(v1 + OBJC_IVAR____TtC17TVUpNextExtensionP33_CEB3B327E539852F953463821CB150CF11CachePolicy_ttl) = v21;
    uint64_t result = swift_release(v27);
    uint64_t v28 = *(void *)(v1 + v26);
    if (v28)
    {
      sub_10000A134(0LL, &qword_100036188, &OBJC_CLASS___OS_dispatch_queue_ptr);
      uint64_t v29 = swift_retain(v28);
      uint64_t v30 = (void *)static OS_dispatch_queue.main.getter(v29);
      static DispatchTime.now()();
      + infix(_:_:)(v6, (double)v13);
      uint64_t v31 = *(void (**)(char *, uint64_t))(v25 + 8);
      v31(v6, v24);
      OS_dispatch_queue.asyncAfter(deadline:execute:)(v8, v28);
      swift_release(v28);

      return ((uint64_t (*)(char *, uint64_t))v31)(v8, v24);
    }
  }

  return result;
}

uint64_t sub_100013724(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = swift_retain(v2);
  v1(v3);
  return swift_release(v2);
}

uint64_t sub_10001377C(uint64_t a1, uint64_t a2, int *a3)
{
  int v6 = (uint64_t (*)(void))((char *)a3 + *a3);
  uint64_t v4 = (void *)swift_task_alloc(a3[1]);
  *(void *)(v3 + 16) = v4;
  *uint64_t v4 = v3;
  v4[1] = sub_10000A35C;
  return v6();
}

uint64_t sub_1000137D0(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  uint64_t v7 = (uint64_t (*)(void))((char *)a4 + *a4);
  uint64_t v5 = (void *)swift_task_alloc(a4[1]);
  *(void *)(v4 + 16) = v5;
  void *v5 = v4;
  v5[1] = sub_10000A35C;
  return v7();
}

char *sub_100013824(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    uint64_t v7 = a2;
    goto LABEL_8;
  }

  unint64_t v6 = *((void *)a4 + 3);
  uint64_t v7 = v6 >> 1;
  if (v7 + 0x4000000000000000LL >= 0)
  {
    uint64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
LABEL_8:
    uint64_t v8 = *((void *)a4 + 2);
    if (v7 <= v8) {
      uint64_t v9 = *((void *)a4 + 2);
    }
    else {
      uint64_t v9 = v7;
    }
    if (v9)
    {
      uint64_t v10 = sub_100008A20(&qword_100036370);
      uint64_t v11 = (char *)swift_allocObject(v10, 16 * v9 + 32, 7LL);
      int64_t v12 = j__malloc_size(v11);
      uint64_t v13 = v12 - 32;
      if (v12 < 32) {
        uint64_t v13 = v12 - 17;
      }
      *((void *)v11 + 2) = v8;
      *((void *)v11 + 3) = 2 * (v13 >> 4);
      uint64_t v14 = v11 + 32;
      if ((v5 & 1) != 0) {
        goto LABEL_15;
      }
    }

    else
    {
      uint64_t v11 = (char *)&_swiftEmptyArrayStorage;
      uint64_t v14 = (char *)&_swiftEmptyArrayStorage + 32;
      if ((result & 1) != 0)
      {
LABEL_15:
        if (v11 != a4 || v14 >= &a4[16 * v8 + 32]) {
          memmove(v14, a4 + 32, 16 * v8);
        }
        *((void *)a4 + 2) = 0LL;
        goto LABEL_24;
      }
    }

    sub_100018D2C(0LL, v8, (unint64_t)v14, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease(a4);
    return v11;
  }

  __break(1u);
  return result;
}

char *sub_100013930(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    uint64_t v7 = a2;
    goto LABEL_8;
  }

  unint64_t v6 = *((void *)a4 + 3);
  uint64_t v7 = v6 >> 1;
  if (v7 + 0x4000000000000000LL >= 0)
  {
    uint64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
LABEL_8:
    uint64_t v8 = *((void *)a4 + 2);
    if (v7 <= v8) {
      uint64_t v9 = *((void *)a4 + 2);
    }
    else {
      uint64_t v9 = v7;
    }
    if (v9)
    {
      uint64_t v10 = sub_100008A20(&qword_100036238);
      uint64_t v11 = (char *)swift_allocObject(v10, 16 * v9 + 32, 7LL);
      int64_t v12 = j__malloc_size(v11);
      uint64_t v13 = v12 - 32;
      if (v12 < 32) {
        uint64_t v13 = v12 - 17;
      }
      *((void *)v11 + 2) = v8;
      *((void *)v11 + 3) = 2 * (v13 >> 4);
      uint64_t v14 = v11 + 32;
      if ((v5 & 1) != 0) {
        goto LABEL_15;
      }
    }

    else
    {
      uint64_t v11 = (char *)&_swiftEmptyArrayStorage;
      uint64_t v14 = (char *)&_swiftEmptyArrayStorage + 32;
      if ((result & 1) != 0)
      {
LABEL_15:
        if (v11 != a4 || v14 >= &a4[16 * v8 + 32]) {
          memmove(v14, a4 + 32, 16 * v8);
        }
        *((void *)a4 + 2) = 0LL;
        goto LABEL_24;
      }
    }

    sub_100016DC0(0LL, v8, (unint64_t)v14, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease(a4);
    return v11;
  }

  __break(1u);
  return result;
}

char *sub_100013A3C(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    uint64_t v7 = a2;
    goto LABEL_8;
  }

  unint64_t v6 = *((void *)a4 + 3);
  uint64_t v7 = v6 >> 1;
  if (v7 + 0x4000000000000000LL >= 0)
  {
    uint64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
LABEL_8:
    uint64_t v8 = *((void *)a4 + 2);
    if (v7 <= v8) {
      uint64_t v9 = *((void *)a4 + 2);
    }
    else {
      uint64_t v9 = v7;
    }
    if (v9)
    {
      uint64_t v10 = sub_100008A20(&qword_1000363B8);
      uint64_t v11 = (char *)swift_allocObject(v10, 40 * v9 + 32, 7LL);
      size_t v12 = j__malloc_size(v11);
      *((void *)v11 + 2) = v8;
      *((void *)v11 + 3) = 2 * ((uint64_t)(v12 - 32) / 40);
      uint64_t v13 = v11 + 32;
      if ((v5 & 1) != 0)
      {
LABEL_13:
        if (v11 != a4 || v13 >= &a4[40 * v8 + 32]) {
          memmove(v13, a4 + 32, 40 * v8);
        }
        *((void *)a4 + 2) = 0LL;
        goto LABEL_22;
      }
    }

    else
    {
      uint64_t v11 = (char *)&_swiftEmptyArrayStorage;
      uint64_t v13 = (char *)&_swiftEmptyArrayStorage + 32;
    }

    sub_100016FF8(0LL, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_22:
    swift_bridgeObjectRelease(a4);
    return v11;
  }

  __break(1u);
  return result;
}

char *sub_100013B5C(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    uint64_t v7 = a2;
    goto LABEL_8;
  }

  unint64_t v6 = *((void *)a4 + 3);
  uint64_t v7 = v6 >> 1;
  if (v7 + 0x4000000000000000LL >= 0)
  {
    uint64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
LABEL_8:
    uint64_t v8 = *((void *)a4 + 2);
    if (v7 <= v8) {
      uint64_t v9 = *((void *)a4 + 2);
    }
    else {
      uint64_t v9 = v7;
    }
    if (v9)
    {
      uint64_t v10 = sub_100008A20(&qword_1000363A8);
      uint64_t v11 = (char *)swift_allocObject(v10, 8 * v9 + 32, 7LL);
      int64_t v12 = j__malloc_size(v11);
      uint64_t v13 = v12 - 32;
      if (v12 < 32) {
        uint64_t v13 = v12 - 25;
      }
      *((void *)v11 + 2) = v8;
      *((void *)v11 + 3) = 2 * (v13 >> 3);
      uint64_t v14 = v11 + 32;
      if ((v5 & 1) != 0) {
        goto LABEL_15;
      }
    }

    else
    {
      uint64_t v11 = (char *)&_swiftEmptyArrayStorage;
      uint64_t v14 = (char *)&_swiftEmptyArrayStorage + 32;
      if ((result & 1) != 0)
      {
LABEL_15:
        if (v11 != a4 || v14 >= &a4[8 * v8 + 32]) {
          memmove(v14, a4 + 32, 8 * v8);
        }
        *((void *)a4 + 2) = 0LL;
        goto LABEL_24;
      }
    }

    sub_100017BD8(0LL, v8, (unint64_t)v14, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease(a4);
    return v11;
  }

  __break(1u);
  return result;
}

uint64_t sub_100013C68(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_100013D38(v12, 0LL, 0LL, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_1000169B0((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }

  else
  {
    uint64_t ObjectType = &type metadata for _StringGuts;
    v12[0] = a1;
    v12[1] = a2;
    uint64_t v10 = *a3;
    if (*a3)
    {
      sub_1000169B0((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }

    swift_bridgeObjectRetain(a2);
  }

  sub_10000A114(v12);
  return v7;
}

uint64_t sub_100013D38(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000LL) != 0)
  {
    if ((a4 & 1) == 0)
    {
      if (__dst)
      {
        uint64_t v12 = HIBYTE(a6) & 0xF;
        if (a3 - (uint64_t)__dst > v12)
        {
          __src[0] = a5;
          __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
          if (__src >= (void *)&__dst[v12] || (char *)__src + v12 <= __dst)
          {
            memcpy(__dst, __src, HIBYTE(a6) & 0xF);
            UnsafeMutableRawBufferPointer.subscript.setter(0LL, HIBYTE(a6) & 0xF, __dst, a3);
            uint64_t result = 0LL;
            *a1 = (uint64_t)__dst;
            return result;
          }

          goto LABEL_17;
        }
      }
    }

LABEL_13:
    uint64_t result = sub_100013EF0(a5, a6);
    *a1 = v13;
    return result;
  }

  if ((a6 & 0x1000000000000000LL) != 0) {
    goto LABEL_13;
  }
  if ((a5 & 0x1000000000000000LL) != 0)
  {
    uint64_t v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
    goto LABEL_5;
  }

  uint64_t v8 = _StringObject.sharedUTF8.getter(a5, a6);
  if (!v8)
  {
    _assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "Unexpectedly found nil while unwrapping an Optional value",  57LL,  2LL,  "Swift/StringTesting.swift",  25LL,  2,  151LL,  0);
    __break(1u);
LABEL_17:
    LOBYTE(v14) = 2;
    uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutableRawPointer.initializeMemory overlapping range",  58LL,  2LL,  "Swift/UnsafeRawPointer.swift",  28LL,  v14,  1173LL,  0);
    __break(1u);
    return result;
  }

uint64_t sub_100013EF0(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_100013F84(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_10001415C(0, *(void *)(v2 + 16) + 1LL, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_10001415C(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_100013F84(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0x1000000000000000LL) != 0) {
    goto LABEL_10;
  }
  if ((a2 & 0x2000000000000000LL) != 0) {
    uint64_t v4 = HIBYTE(a2) & 0xF;
  }
  else {
    uint64_t v4 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (v4)
  {
    while (1)
    {
      char v5 = sub_1000140F8(v4, 0LL);
      if (v4 < 0) {
        break;
      }
      uint64_t v6 = v5;
      uint64_t v7 = _StringGuts.copyUTF8(into:)(v5 + 4, v4, a1, a2);
      if ((v8 & 1) != 0) {
        goto LABEL_14;
      }
      if (v7 == v4) {
        return v6;
      }
      LOBYTE(v10) = 2;
      _assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "invalid Collection: less than 'count' elements in collection",  60LL,  2LL,  "Swift/ContiguousArrayBuffer.swift",  33LL,  v10,  1122LL,  0);
      __break(1u);
LABEL_10:
      uint64_t v4 = String.UTF8View._foreignCount()();
      if (!v4) {
        return &_swiftEmptyArrayStorage;
      }
    }

    LOBYTE(v10) = 2;
    _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutableBufferPointer with negative count",  46LL,  2LL,  "Swift/UnsafeBufferPointer.swift",  31LL,  v10,  71LL,  0);
    __break(1u);
LABEL_14:
    LOBYTE(v10) = 2;
    uint64_t result = (void *)_assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "Insufficient space allocated to copy string contents",  52LL,  2LL,  "Swift/StringUTF8View.swift",  26LL,  v10,  430LL,  0);
    __break(1u);
  }

  else
  {
    return &_swiftEmptyArrayStorage;
  }

  return result;
}

void *sub_1000140F8(uint64_t a1, uint64_t a2)
{
  if (a2 <= a1) {
    uint64_t v2 = a1;
  }
  else {
    uint64_t v2 = a2;
  }
  if (!v2) {
    return &_swiftEmptyArrayStorage;
  }
  uint64_t v4 = sub_100008A20(&qword_1000363F8);
  char v5 = (void *)swift_allocObject(v4, v2 + 32, 7LL);
  size_t v6 = j__malloc_size(v5);
  v5[2] = a1;
  v5[3] = 2 * v6 - 64;
  return v5;
}

uint64_t sub_10001415C(char a1, int64_t a2, char a3, char *a4)
{
  if ((a3 & 1) != 0)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000LL < 0)
      {
        __break(1u);
        goto LABEL_30;
      }

      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    }
  }

  else
  {
    int64_t v7 = a2;
  }

  int64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    int64_t v9 = *((void *)a4 + 2);
  }
  else {
    int64_t v9 = v7;
  }
  if (v9)
  {
    uint64_t v10 = sub_100008A20(&qword_1000363F8);
    uint64_t v11 = (char *)swift_allocObject(v10, v9 + 32, 7LL);
    size_t v12 = j__malloc_size(v11);
    *((void *)v11 + 2) = v8;
    *((void *)v11 + 3) = 2 * v12 - 64;
  }

  else
  {
    uint64_t v11 = (char *)&_swiftEmptyArrayStorage;
  }

  uint64_t v13 = v11 + 32;
  int v14 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v11 != a4 || v13 >= &v14[v8]) {
      memmove(v13, v14, v8);
    }
    *((void *)a4 + 2) = 0LL;
    goto LABEL_28;
  }

  if (v14 >= &v13[v8] || v13 >= &v14[v8])
  {
    memcpy(v13, v14, v8);
LABEL_28:
    swift_bridgeObjectRelease(a4);
    return (uint64_t)v11;
  }

LABEL_30:
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize overlapping range",  49LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1092LL,  0);
  __break(1u);
  return result;
}

unint64_t sub_1000142A8(uint64_t a1)
{
  uint64_t v2 = v1;
  Swift::Int v4 = AnyHashable._rawHashValue(seed:)(*(void *)(v2 + 40));
  return sub_10001433C(a1, v4);
}

unint64_t sub_1000142D8(uint64_t a1, uint64_t a2)
{
  Swift::Int v5 = Hasher._finalize()();
  return sub_100014400(a1, a2, v5);
}

unint64_t sub_10001433C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = -1LL << *(_BYTE *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if (((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v4) & 1) != 0)
  {
    uint64_t v6 = ~v3;
    do
    {
      sub_100016974(*(void *)(v2 + 48) + 40 * v4, (uint64_t)v9);
      char v7 = static AnyHashable.== infix(_:_:)(v9, a1);
      sub_1000169FC((uint64_t)v9);
      if ((v7 & 1) != 0) {
        break;
      }
      unint64_t v4 = (v4 + 1) & v6;
    }

    while (((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v4) & 1) != 0);
  }

  return v4;
}

unint64_t sub_100014400(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1LL << *(_BYTE *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if (((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v6) & 1) != 0)
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      do
      {
        unint64_t v6 = (v6 + 1) & v12;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v6) & 1) == 0) {
          break;
        }
        uint64_t v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }

      while (!v14 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0);
    }
  }

  return v6;
}

uint64_t sub_1000144E0(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_100014518(a1, a2, a3, (void *)*v3);
  *uint64_t v3 = result;
  return result;
}

uint64_t sub_1000144FC(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_1000146A0(a1, a2, a3, *v3);
  *uint64_t v3 = (char *)result;
  return result;
}

uint64_t sub_100014518(char a1, int64_t a2, char a3, void *a4)
{
  if ((a3 & 1) != 0)
  {
    unint64_t v6 = a4[3];
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000LL < 0)
      {
        __break(1u);
        goto LABEL_32;
      }

      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    }
  }

  else
  {
    int64_t v7 = a2;
  }

  uint64_t v8 = a4[2];
  if (v7 <= v8) {
    uint64_t v9 = a4[2];
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    uint64_t v10 = sub_100008A20(&qword_1000363F0);
    BOOL v11 = (void *)swift_allocObject(v10, 8 * v9 + 32, 7LL);
    int64_t v12 = j__malloc_size(v11);
    uint64_t v13 = v12 - 32;
    if (v12 < 32) {
      uint64_t v13 = v12 - 25;
    }
    v11[2] = v8;
    v11[3] = 2 * (v13 >> 3);
  }

  else
  {
    BOOL v11 = &_swiftEmptyArrayStorage;
  }

  unint64_t v14 = (unint64_t)(v11 + 4);
  unint64_t v15 = (unint64_t)(a4 + 4);
  if ((a1 & 1) != 0)
  {
    if (v11 != a4 || v14 >= v15 + 8 * v8) {
      memmove(v11 + 4, a4 + 4, 8 * v8);
    }
    a4[2] = 0LL;
    goto LABEL_30;
  }

  if (v15 >= v14 + 8 * v8 || v14 >= v15 + 8 * v8)
  {
    sub_100008A20(&qword_100036040);
    swift_arrayInitWithCopy(v11 + 4);
LABEL_30:
    swift_release(a4);
    return (uint64_t)v11;
  }

LABEL_32:
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize overlapping range",  49LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1092LL,  0);
  __break(1u);
  return result;
}

  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize overlapping range",  49LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1092LL,  0);
  __break(1u);
  return result;
}

uint64_t sub_1000146A0(char a1, int64_t a2, char a3, char *a4)
{
  if ((a3 & 1) != 0)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000LL < 0)
      {
        __break(1u);
        goto LABEL_32;
      }

      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    }
  }

  else
  {
    int64_t v7 = a2;
  }

  uint64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    uint64_t v9 = *((void *)a4 + 2);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    uint64_t v10 = sub_100008A20(&qword_100036238);
    BOOL v11 = (char *)swift_allocObject(v10, 16 * v9 + 32, 7LL);
    int64_t v12 = j__malloc_size(v11);
    uint64_t v13 = v12 - 32;
    if (v12 < 32) {
      uint64_t v13 = v12 - 17;
    }
    *((void *)v11 + 2) = v8;
    *((void *)v11 + 3) = 2 * (v13 >> 4);
  }

  else
  {
    BOOL v11 = (char *)&_swiftEmptyArrayStorage;
  }

  unint64_t v14 = v11 + 32;
  unint64_t v15 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v11 != a4 || v14 >= &v15[16 * v8]) {
      memmove(v14, v15, 16 * v8);
    }
    *((void *)a4 + 2) = 0LL;
    goto LABEL_30;
  }

  if (v15 >= &v14[16 * v8] || v14 >= &v15[16 * v8])
  {
    swift_arrayInitWithCopy(v14);
LABEL_30:
    swift_release(a4);
    return (uint64_t)v11;
  }

double sub_100014808@<D0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = v2;
  uint64_t v6 = *v3;
  swift_bridgeObjectRetain(*v3);
  unint64_t v7 = sub_1000142A8(a1);
  LOBYTE(a1) = v8;
  swift_bridgeObjectRelease(v6);
  if ((a1 & 1) != 0)
  {
    int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*v3);
    uint64_t v10 = *v3;
    uint64_t v15 = *v3;
    *uint64_t v3 = 0x8000000000000000LL;
    if (!isUniquelyReferenced_nonNull_native)
    {
      sub_100015B50();
      uint64_t v10 = v15;
    }

    sub_1000169FC(*(void *)(v10 + 48) + 40 * v7);
    uint64_t v11 = *(void *)(v10 + 56) + 40 * v7;
    __int128 v12 = *(_OWORD *)(v11 + 16);
    *(_OWORD *)a2 = *(_OWORD *)v11;
    *(_OWORD *)(a2 + 16) = v12;
    *(void *)(a2 + 32) = *(void *)(v11 + 32);
    sub_100015330(v7, v10);
    uint64_t v13 = *v3;
    *uint64_t v3 = v10;
    swift_bridgeObjectRelease(v13);
  }

  else
  {
    *(void *)(a2 + 32) = 0LL;
    double result = 0.0;
    *(_OWORD *)a2 = 0u;
    *(_OWORD *)(a2 + 16) = 0u;
  }

  return result;
}

double sub_100014900@<D0>(uint64_t a1@<X0>, _OWORD *a2@<X8>)
{
  uint64_t v3 = v2;
  uint64_t v6 = *v3;
  swift_bridgeObjectRetain(*v3);
  unint64_t v7 = sub_1000142A8(a1);
  LOBYTE(a1) = v8;
  swift_bridgeObjectRelease(v6);
  if ((a1 & 1) != 0)
  {
    int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*v3);
    uint64_t v10 = *v3;
    uint64_t v13 = *v3;
    *uint64_t v3 = 0x8000000000000000LL;
    if (!isUniquelyReferenced_nonNull_native)
    {
      sub_100015EDC();
      uint64_t v10 = v13;
    }

    sub_1000169FC(*(void *)(v10 + 48) + 40 * v7);
    sub_1000169EC((_OWORD *)(*(void *)(v10 + 56) + 32 * v7), a2);
    sub_100015500(v7, v10);
    uint64_t v11 = *v3;
    *uint64_t v3 = v10;
    swift_bridgeObjectRelease(v11);
  }

  else
  {
    double result = 0.0;
    *a2 = 0u;
    a2[1] = 0u;
  }

  return result;
}

Swift::Int sub_1000149E8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  if (*(void *)(*v2 + 24) <= a1) {
    uint64_t v6 = a1;
  }
  else {
    uint64_t v6 = *(void *)(*v2 + 24);
  }
  sub_100008A20(&qword_100036210);
  uint64_t v7 = static _DictionaryStorage.resize(original:capacity:move:)(v5, v6, a2);
  uint64_t v8 = v7;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_44;
  }
  uint64_t v9 = 1LL << *(_BYTE *)(v5 + 32);
  uint64_t v44 = v5 + 64;
  if (v9 < 64) {
    uint64_t v10 = ~(-1LL << v9);
  }
  else {
    uint64_t v10 = -1LL;
  }
  unint64_t v11 = v10 & *(void *)(v5 + 64);
  int64_t v12 = (unint64_t)(v9 + 63) >> 6;
  uint64_t v13 = v7 + 64;
  Swift::Int result = swift_retain(v5);
  int64_t v15 = 0LL;
  while (1)
  {
    if (v11)
    {
      unint64_t v24 = __clz(__rbit64(v11));
      v11 &= v11 - 1;
      unint64_t v25 = v24 | (v15 << 6);
      goto LABEL_25;
    }

    int64_t v26 = v15 + 1;
    if (__OFADD__(v15, 1LL))
    {
LABEL_45:
      __break(1u);
LABEL_46:
      __break(1u);
      return result;
    }

    if (v26 >= v12) {
      break;
    }
    uint64_t v27 = (void *)(v5 + 64);
    unint64_t v28 = *(void *)(v44 + 8 * v26);
    ++v15;
    if (!v28)
    {
      int64_t v15 = v26 + 1;
      if (v26 + 1 >= v12) {
        goto LABEL_37;
      }
      unint64_t v28 = *(void *)(v44 + 8 * v15);
      if (!v28)
      {
        int64_t v29 = v26 + 2;
        if (v29 >= v12)
        {
LABEL_37:
          swift_release(v5);
          if ((a2 & 1) == 0) {
            goto LABEL_44;
          }
          goto LABEL_40;
        }

        unint64_t v28 = *(void *)(v44 + 8 * v29);
        if (!v28)
        {
          while (1)
          {
            int64_t v15 = v29 + 1;
            if (__OFADD__(v29, 1LL)) {
              goto LABEL_46;
            }
            if (v15 >= v12) {
              goto LABEL_37;
            }
            unint64_t v28 = *(void *)(v44 + 8 * v15);
            ++v29;
            if (v28) {
              goto LABEL_24;
            }
          }
        }

        int64_t v15 = v29;
      }
    }

LABEL_24:
    unint64_t v11 = (v28 - 1) & v28;
    unint64_t v25 = __clz(__rbit64(v28)) + (v15 << 6);
LABEL_25:
    uint64_t v30 = *(void *)(v5 + 48) + 40 * v25;
    if ((a2 & 1) != 0)
    {
      __int128 v31 = *(_OWORD *)v30;
      __int128 v32 = *(_OWORD *)(v30 + 16);
      uint64_t v50 = *(void *)(v30 + 32);
      __int128 v48 = v31;
      __int128 v49 = v32;
      uint64_t v33 = *(void *)(v5 + 56) + 40 * v25;
      uint64_t v34 = *(void *)(v33 + 32);
      __int128 v35 = *(_OWORD *)(v33 + 16);
      __int128 v45 = *(_OWORD *)v33;
      __int128 v46 = v35;
      uint64_t v47 = v34;
    }

    else
    {
      sub_100016974(v30, (uint64_t)&v48);
      sub_100016974(*(void *)(v5 + 56) + 40 * v25, (uint64_t)&v45);
    }

    Swift::Int result = AnyHashable._rawHashValue(seed:)(*(void *)(v8 + 40));
    uint64_t v36 = -1LL << *(_BYTE *)(v8 + 32);
    unint64_t v37 = result & ~v36;
    unint64_t v38 = v37 >> 6;
    if (((-1LL << v37) & ~*(void *)(v13 + 8 * (v37 >> 6))) != 0)
    {
      unint64_t v16 = __clz(__rbit64((-1LL << v37) & ~*(void *)(v13 + 8 * (v37 >> 6)))) | v37 & 0x7FFFFFFFFFFFFFC0LL;
    }

    else
    {
      char v39 = 0;
      unint64_t v40 = (unint64_t)(63 - v36) >> 6;
      do
      {
        if (++v38 == v40 && (v39 & 1) != 0)
        {
          __break(1u);
          goto LABEL_45;
        }

        BOOL v41 = v38 == v40;
        if (v38 == v40) {
          unint64_t v38 = 0LL;
        }
        v39 |= v41;
        uint64_t v42 = *(void *)(v13 + 8 * v38);
      }

      while (v42 == -1);
      unint64_t v16 = __clz(__rbit64(~v42)) + (v38 << 6);
    }

    *(void *)(v13 + ((v16 >> 3) & 0x1FFFFFFFFFFFFFF8LL)) |= 1LL << v16;
    uint64_t v17 = 40 * v16;
    uint64_t v18 = *(void *)(v8 + 48) + v17;
    __int128 v19 = v48;
    __int128 v20 = v49;
    *(void *)(v18 + 32) = v50;
    *(_OWORD *)uint64_t v18 = v19;
    *(_OWORD *)(v18 + 16) = v20;
    uint64_t v21 = *(void *)(v8 + 56) + v17;
    __int128 v22 = v45;
    __int128 v23 = v46;
    *(void *)(v21 + 32) = v47;
    *(_OWORD *)uint64_t v21 = v22;
    *(_OWORD *)(v21 + 16) = v23;
    ++*(void *)(v8 + 16);
  }

  swift_release(v5);
  uint64_t v27 = (void *)(v5 + 64);
  if ((a2 & 1) == 0) {
    goto LABEL_44;
  }
LABEL_40:
  uint64_t v43 = 1LL << *(_BYTE *)(v5 + 32);
  if (v43 >= 64) {
    bzero(v27, ((unint64_t)(v43 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8LL);
  }
  else {
    *uint64_t v27 = -1LL << v43;
  }
  *(void *)(v5 + 16) = 0LL;
LABEL_44:
  Swift::Int result = swift_release(v5);
  *uint64_t v3 = v8;
  return result;
}

    unint64_t v11 = (v24 - 1) & v24;
    uint64_t v21 = __clz(__rbit64(v24)) + (v15 << 6);
LABEL_25:
    int64_t v26 = *(void *)(v5 + 48) + 40 * v21;
    if ((a2 & 1) != 0)
    {
      uint64_t v27 = *(_OWORD *)v26;
      unint64_t v28 = *(_OWORD *)(v26 + 16);
      BOOL v41 = *(void *)(v26 + 32);
      char v39 = v27;
      unint64_t v40 = v28;
      sub_1000169EC((_OWORD *)(*(void *)(v5 + 56) + 32 * v21), v38);
    }

    else
    {
      sub_100016974(v26, (uint64_t)&v39);
      sub_1000169B0(*(void *)(v5 + 56) + 32 * v21, (uint64_t)v38);
    }

    Swift::Int result = AnyHashable._rawHashValue(seed:)(*(void *)(v8 + 40));
    int64_t v29 = -1LL << *(_BYTE *)(v8 + 32);
    uint64_t v30 = result & ~v29;
    __int128 v31 = v30 >> 6;
    if (((-1LL << v30) & ~*(void *)(v13 + 8 * (v30 >> 6))) != 0)
    {
      unint64_t v16 = __clz(__rbit64((-1LL << v30) & ~*(void *)(v13 + 8 * (v30 >> 6)))) | v30 & 0x7FFFFFFFFFFFFFC0LL;
    }

    else
    {
      __int128 v32 = 0;
      uint64_t v33 = (unint64_t)(63 - v29) >> 6;
      do
      {
        if (++v31 == v33 && (v32 & 1) != 0)
        {
          __break(1u);
          goto LABEL_45;
        }

        uint64_t v34 = v31 == v33;
        if (v31 == v33) {
          __int128 v31 = 0LL;
        }
        v32 |= v34;
        __int128 v35 = *(void *)(v13 + 8 * v31);
      }

      while (v35 == -1);
      unint64_t v16 = __clz(__rbit64(~v35)) + (v31 << 6);
    }

    *(void *)(v13 + ((v16 >> 3) & 0x1FFFFFFFFFFFFFF8LL)) |= 1LL << v16;
    uint64_t v17 = *(void *)(v8 + 48) + 40 * v16;
    uint64_t v18 = v39;
    __int128 v19 = v40;
    *(void *)(v17 + 32) = v41;
    *(_OWORD *)uint64_t v17 = v18;
    *(_OWORD *)(v17 + 16) = v19;
    Swift::Int result = (uint64_t)sub_1000169EC(v38, (_OWORD *)(*(void *)(v8 + 56) + 32 * v16));
    ++*(void *)(v8 + 16);
  }

  swift_release(v5);
  __int128 v23 = (void *)(v5 + 64);
  if ((a2 & 1) == 0) {
    goto LABEL_44;
  }
LABEL_40:
  uint64_t v36 = 1LL << *(_BYTE *)(v5 + 32);
  if (v36 >= 64) {
    bzero(v23, ((unint64_t)(v36 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8LL);
  }
  else {
    *__int128 v23 = -1LL << v36;
  }
  *(void *)(v5 + 16) = 0LL;
LABEL_44:
  Swift::Int result = swift_release(v5);
  *uint64_t v3 = v8;
  return result;
}

Swift::Int sub_100014D14(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  if (*(void *)(*v2 + 24) <= a1) {
    uint64_t v6 = a1;
  }
  else {
    uint64_t v6 = *(void *)(*v2 + 24);
  }
  sub_100008A20(&qword_1000363B0);
  char v38 = a2;
  uint64_t v7 = static _DictionaryStorage.resize(original:capacity:move:)(v5, v6, a2);
  uint64_t v8 = v7;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_43;
  }
  uint64_t v9 = 1LL << *(_BYTE *)(v5 + 32);
  uint64_t v37 = v5 + 64;
  if (v9 < 64) {
    uint64_t v10 = ~(-1LL << v9);
  }
  else {
    uint64_t v10 = -1LL;
  }
  unint64_t v11 = v10 & *(void *)(v5 + 64);
  __int128 v35 = v3;
  int64_t v36 = (unint64_t)(v9 + 63) >> 6;
  uint64_t v12 = v7 + 64;
  Swift::Int result = swift_retain(v5);
  int64_t v14 = 0LL;
  while (1)
  {
    if (v11)
    {
      unint64_t v20 = __clz(__rbit64(v11));
      v11 &= v11 - 1;
      unint64_t v21 = v20 | (v14 << 6);
      goto LABEL_34;
    }

    int64_t v22 = v14 + 1;
    if (__OFADD__(v14, 1LL))
    {
LABEL_44:
      __break(1u);
LABEL_45:
      __break(1u);
      return result;
    }

    if (v22 >= v36) {
      break;
    }
    __int128 v23 = (void *)(v5 + 64);
    unint64_t v24 = *(void *)(v37 + 8 * v22);
    ++v14;
    if (!v24)
    {
      int64_t v14 = v22 + 1;
      if (v22 + 1 >= v36) {
        goto LABEL_36;
      }
      unint64_t v24 = *(void *)(v37 + 8 * v14);
      if (!v24)
      {
        int64_t v25 = v22 + 2;
        if (v25 >= v36)
        {
LABEL_36:
          swift_release(v5);
          uint64_t v3 = v35;
          if ((v38 & 1) == 0) {
            goto LABEL_43;
          }
          goto LABEL_39;
        }

        unint64_t v24 = *(void *)(v37 + 8 * v25);
        if (!v24)
        {
          while (1)
          {
            int64_t v14 = v25 + 1;
            if (__OFADD__(v25, 1LL)) {
              goto LABEL_45;
            }
            if (v14 >= v36) {
              goto LABEL_36;
            }
            unint64_t v24 = *(void *)(v37 + 8 * v14);
            ++v25;
            if (v24) {
              goto LABEL_33;
            }
          }
        }

        int64_t v14 = v25;
      }
    }

uint64_t sub_10001501C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  if (*(void *)(*v2 + 24) <= a1) {
    uint64_t v6 = a1;
  }
  else {
    uint64_t v6 = *(void *)(*v2 + 24);
  }
  sub_100008A20(&qword_100036228);
  uint64_t v7 = static _DictionaryStorage.resize(original:capacity:move:)(v5, v6, a2);
  uint64_t v8 = v7;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_44;
  }
  uint64_t v9 = 1LL << *(_BYTE *)(v5 + 32);
  uint64_t v37 = v5 + 64;
  if (v9 < 64) {
    uint64_t v10 = ~(-1LL << v9);
  }
  else {
    uint64_t v10 = -1LL;
  }
  unint64_t v11 = v10 & *(void *)(v5 + 64);
  int64_t v12 = (unint64_t)(v9 + 63) >> 6;
  uint64_t v13 = v7 + 64;
  uint64_t result = swift_retain(v5);
  int64_t v15 = 0LL;
  while (1)
  {
    if (v11)
    {
      unint64_t v20 = __clz(__rbit64(v11));
      v11 &= v11 - 1;
      unint64_t v21 = v20 | (v15 << 6);
      goto LABEL_25;
    }

    int64_t v22 = v15 + 1;
    if (__OFADD__(v15, 1LL))
    {
LABEL_45:
      __break(1u);
LABEL_46:
      __break(1u);
      return result;
    }

    if (v22 >= v12) {
      break;
    }
    __int128 v23 = (void *)(v5 + 64);
    unint64_t v24 = *(void *)(v37 + 8 * v22);
    ++v15;
    if (!v24)
    {
      int64_t v15 = v22 + 1;
      if (v22 + 1 >= v12) {
        goto LABEL_37;
      }
      unint64_t v24 = *(void *)(v37 + 8 * v15);
      if (!v24)
      {
        int64_t v25 = v22 + 2;
        if (v25 >= v12)
        {
LABEL_37:
          swift_release(v5);
          if ((a2 & 1) == 0) {
            goto LABEL_44;
          }
          goto LABEL_40;
        }

        unint64_t v24 = *(void *)(v37 + 8 * v25);
        if (!v24)
        {
          while (1)
          {
            int64_t v15 = v25 + 1;
            if (__OFADD__(v25, 1LL)) {
              goto LABEL_46;
            }
            if (v15 >= v12) {
              goto LABEL_37;
            }
            unint64_t v24 = *(void *)(v37 + 8 * v15);
            ++v25;
            if (v24) {
              goto LABEL_24;
            }
          }
        }

        int64_t v15 = v25;
      }
    }

unint64_t sub_100015330(unint64_t result, uint64_t a2)
{
  int64_t v3 = result;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1LL << *(_BYTE *)(a2 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1LL << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    uint64_t result = _HashTable.previousHole(before:)(result, a2 + 64, ~v5);
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1LL << v6)) != 0)
    {
      unint64_t v8 = (result + 1) & v7;
      do
      {
        sub_100016974(*(void *)(a2 + 48) + 40 * v6, (uint64_t)v29);
        Swift::Int v11 = AnyHashable._rawHashValue(seed:)(*(void *)(a2 + 40));
        uint64_t result = sub_1000169FC((uint64_t)v29);
        Swift::Int v12 = v11 & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v12 >= v8 && v3 >= v12)
          {
LABEL_16:
            uint64_t v15 = *(void *)(a2 + 48);
            unint64_t v16 = v15 + 40 * v3;
            uint64_t v17 = (__int128 *)(v15 + 40 * v6);
            if (v3 != v6 || v16 >= (unint64_t)v17 + 40)
            {
              __int128 v18 = *v17;
              __int128 v19 = v17[1];
              *(void *)(v16 + 32) = *((void *)v17 + 4);
              *(_OWORD *)unint64_t v16 = v18;
              *(_OWORD *)(v16 + 16) = v19;
            }

            uint64_t v20 = *(void *)(a2 + 56);
            unint64_t v21 = v20 + 40 * v3;
            int64_t v22 = (__int128 *)(v20 + 40 * v6);
            if (v3 != v6 || (int64_t v3 = v6, v21 >= (unint64_t)v22 + 40))
            {
              __int128 v9 = *v22;
              __int128 v10 = v22[1];
              *(void *)(v21 + 32) = *((void *)v22 + 4);
              *(_OWORD *)unint64_t v21 = v9;
              *(_OWORD *)(v21 + 16) = v10;
              int64_t v3 = v6;
            }
          }
        }

        else if (v12 >= v8 || v3 >= v12)
        {
          goto LABEL_16;
        }

        unint64_t v6 = (v6 + 1) & v7;
      }

      while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v6) & 1) != 0);
    }

    __int128 v23 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    uint64_t v24 = *v23;
    uint64_t v25 = (-1LL << v3) - 1;
  }

  else
  {
    __int128 v23 = (uint64_t *)(v4 + 8 * (result >> 6));
    uint64_t v25 = *v23;
    uint64_t v24 = (-1LL << result) - 1;
  }

  *__int128 v23 = v25 & v24;
  uint64_t v26 = *(void *)(a2 + 16);
  BOOL v27 = __OFSUB__(v26, 1LL);
  uint64_t v28 = v26 - 1;
  if (v27)
  {
    __break(1u);
  }

  else
  {
    *(void *)(a2 + 16) = v28;
    ++*(_DWORD *)(a2 + 36);
  }

  return result;
}

unint64_t sub_100015500(unint64_t result, uint64_t a2)
{
  int64_t v3 = result;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1LL << *(_BYTE *)(a2 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1LL << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    uint64_t result = _HashTable.previousHole(before:)(result, a2 + 64, ~v5);
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1LL << v6)) != 0)
    {
      unint64_t v8 = (result + 1) & v7;
      do
      {
        sub_100016974(*(void *)(a2 + 48) + 40 * v6, (uint64_t)v28);
        Swift::Int v10 = AnyHashable._rawHashValue(seed:)(*(void *)(a2 + 40));
        uint64_t result = sub_1000169FC((uint64_t)v28);
        Swift::Int v11 = v10 & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v11 >= v8 && v3 >= v11)
          {
LABEL_16:
            uint64_t v14 = *(void *)(a2 + 48);
            unint64_t v15 = v14 + 40 * v3;
            unint64_t v16 = (__int128 *)(v14 + 40 * v6);
            if (v3 != v6 || v15 >= (unint64_t)v16 + 40)
            {
              __int128 v17 = *v16;
              __int128 v18 = v16[1];
              *(void *)(v15 + 32) = *((void *)v16 + 4);
              *(_OWORD *)unint64_t v15 = v17;
              *(_OWORD *)(v15 + 16) = v18;
            }

            uint64_t v19 = *(void *)(a2 + 56);
            uint64_t v20 = (_OWORD *)(v19 + 32 * v3);
            unint64_t v21 = (_OWORD *)(v19 + 32 * v6);
            if (v3 != v6 || (int64_t v3 = v6, v20 >= v21 + 2))
            {
              __int128 v9 = v21[1];
              *uint64_t v20 = *v21;
              v20[1] = v9;
              int64_t v3 = v6;
            }
          }
        }

        else if (v11 >= v8 || v3 >= v11)
        {
          goto LABEL_16;
        }

        unint64_t v6 = (v6 + 1) & v7;
      }

      while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v6) & 1) != 0);
    }

    int64_t v22 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    uint64_t v23 = *v22;
    uint64_t v24 = (-1LL << v3) - 1;
  }

  else
  {
    int64_t v22 = (uint64_t *)(v4 + 8 * (result >> 6));
    uint64_t v24 = *v22;
    uint64_t v23 = (-1LL << result) - 1;
  }

  *int64_t v22 = v24 & v23;
  uint64_t v25 = *(void *)(a2 + 16);
  BOOL v26 = __OFSUB__(v25, 1LL);
  uint64_t v27 = v25 - 1;
  if (v26)
  {
    __break(1u);
  }

  else
  {
    *(void *)(a2 + 16) = v27;
    ++*(_DWORD *)(a2 + 36);
  }

  return result;
}

uint64_t sub_1000156C8(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v4 = v3;
  uint64_t v8 = *v3;
  unint64_t v10 = sub_1000142A8(a2);
  uint64_t v11 = *(void *)(v8 + 16);
  BOOL v12 = (v9 & 1) == 0;
  uint64_t v13 = v11 + v12;
  if (__OFADD__(v11, v12))
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }

  char v14 = v9;
  uint64_t v15 = *(void *)(v8 + 24);
  if (v15 >= v13 && (a3 & 1) != 0) {
    goto LABEL_7;
  }
  if (v15 >= v13 && (a3 & 1) == 0)
  {
    sub_100015B50();
LABEL_7:
    unint64_t v16 = (void *)*v4;
    if ((v14 & 1) != 0) {
      return sub_100023F10(a1, v16[7] + 40 * v10);
    }
LABEL_11:
    uint64_t result = sub_100016974(a2, (uint64_t)v29);
    v16[(v10 >> 6) + 8] |= 1LL << v10;
    uint64_t v20 = v16[6] + 40 * v10;
    __int128 v21 = v29[0];
    __int128 v22 = v29[1];
    *(void *)(v20 + 32) = v30;
    *(_OWORD *)uint64_t v20 = v21;
    *(_OWORD *)(v20 + 16) = v22;
    uint64_t v23 = v16[7] + 40 * v10;
    __int128 v25 = *(_OWORD *)a1;
    __int128 v24 = *(_OWORD *)(a1 + 16);
    *(void *)(v23 + 32) = *(void *)(a1 + 32);
    *(_OWORD *)uint64_t v23 = v25;
    *(_OWORD *)(v23 + 16) = v24;
    uint64_t v26 = v16[2];
    BOOL v27 = __OFADD__(v26, 1LL);
    uint64_t v28 = v26 + 1;
    if (!v27)
    {
      _OWORD v16[2] = v28;
      return result;
    }

    goto LABEL_14;
  }

  sub_1000149E8(v13, a3 & 1);
  unint64_t v18 = sub_1000142A8(a2);
  if ((v14 & 1) == (v19 & 1))
  {
    unint64_t v10 = v18;
    unint64_t v16 = (void *)*v4;
    if ((v14 & 1) != 0) {
      return sub_100023F10(a1, v16[7] + 40 * v10);
    }
    goto LABEL_11;
  }

LABEL_15:
  uint64_t result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)(&type metadata for AnyHashable);
  __break(1u);
  return result;
}

  uint64_t result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)(&type metadata for String);
  __break(1u);
  return result;
}

uint64_t sub_100015850(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5 = v4;
  uint64_t v10 = *v4;
  unint64_t v12 = sub_1000142D8(a2, a3);
  uint64_t v13 = *(void *)(v10 + 16);
  BOOL v14 = (v11 & 1) == 0;
  uint64_t result = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }

  char v16 = v11;
  uint64_t v17 = *(void *)(v10 + 24);
  if (v17 >= result && (a4 & 1) != 0) {
    goto LABEL_7;
  }
  if (v17 >= result && (a4 & 1) == 0)
  {
    uint64_t result = (uint64_t)sub_100015D30();
LABEL_7:
    unint64_t v18 = (void *)*v5;
    if ((v16 & 1) != 0)
    {
LABEL_8:
      *(void *)(v18[7] + 8 * v12) = a1;
      return result;
    }

LABEL_11:
    v18[(v12 >> 6) + 8] |= 1LL << v12;
    uint64_t v20 = (uint64_t *)(v18[6] + 16 * v12);
    *uint64_t v20 = a2;
    v20[1] = a3;
    *(void *)(v18[7] + 8 * v12) = a1;
    uint64_t v21 = v18[2];
    BOOL v22 = __OFADD__(v21, 1LL);
    uint64_t v23 = v21 + 1;
    if (!v22)
    {
      void v18[2] = v23;
      return swift_bridgeObjectRetain(a3);
    }

    goto LABEL_14;
  }

  sub_100014D14(result, a4 & 1);
  uint64_t result = sub_1000142D8(a2, a3);
  if ((v16 & 1) == (v19 & 1))
  {
    unint64_t v12 = result;
    unint64_t v18 = (void *)*v5;
    if ((v16 & 1) != 0) {
      goto LABEL_8;
    }
    goto LABEL_11;
  }

_OWORD *sub_1000159A0(_OWORD *a1, uint64_t a2, char a3)
{
  uint64_t v4 = (void **)v3;
  uint64_t v8 = (void *)*v3;
  unint64_t v10 = sub_1000142A8(a2);
  uint64_t v11 = v8[2];
  BOOL v12 = (v9 & 1) == 0;
  uint64_t v13 = v11 + v12;
  if (__OFADD__(v11, v12))
  {
    __break(1u);
  }

  else
  {
    char v14 = v9;
    uint64_t v15 = v8[3];
    if (v15 >= v13 && (a3 & 1) != 0)
    {
LABEL_7:
      char v16 = *v4;
      if ((v14 & 1) != 0)
      {
LABEL_8:
        uint64_t v17 = (void *)(v16[7] + 32 * v10);
        sub_10000A114(v17);
        return sub_1000169EC(a1, v17);
      }

      goto LABEL_11;
    }

    if (v15 >= v13 && (a3 & 1) == 0)
    {
      sub_100015EDC();
      goto LABEL_7;
    }

    sub_10001501C(v13, a3 & 1);
    unint64_t v19 = sub_1000142A8(a2);
    if ((v14 & 1) == (v20 & 1))
    {
      unint64_t v10 = v19;
      char v16 = *v4;
      if ((v14 & 1) != 0) {
        goto LABEL_8;
      }
LABEL_11:
      sub_100016974(a2, (uint64_t)v21);
      return sub_100015AD8(v10, (uint64_t)v21, a1, v16);
    }
  }

  uint64_t result = (_OWORD *)KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)(&type metadata for AnyHashable);
  __break(1u);
  return result;
}

_OWORD *sub_100015AD8(unint64_t a1, uint64_t a2, _OWORD *a3, void *a4)
{
  a4[(a1 >> 6) + 8] |= 1LL << a1;
  uint64_t v5 = a4[6] + 40 * a1;
  __int128 v6 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)uint64_t v5 = *(_OWORD *)a2;
  *(_OWORD *)(v5 + 16) = v6;
  *(void *)(v5 + 32) = *(void *)(a2 + 32);
  uint64_t result = sub_1000169EC(a3, (_OWORD *)(a4[7] + 32 * a1));
  uint64_t v8 = a4[2];
  BOOL v9 = __OFADD__(v8, 1LL);
  uint64_t v10 = v8 + 1;
  if (v9) {
    __break(1u);
  }
  else {
    a4[2] = v10;
  }
  return result;
}

void *sub_100015B50()
{
  uint64_t v1 = v0;
  sub_100008A20(&qword_100036210);
  uint64_t v2 = *v0;
  uint64_t v3 = static _DictionaryStorage.copy(original:)(*v0);
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    uint64_t result = (void *)swift_release(v2);
    uint64_t *v1 = v4;
    return result;
  }

  uint64_t result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1LL << *(_BYTE *)(v4 + 32)) + 63) >> 6;
  int64_t v9 = 0LL;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1LL << *(_BYTE *)(v2 + 32);
  uint64_t v11 = -1LL;
  if (v10 < 64) {
    uint64_t v11 = ~(-1LL << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 64);
  int64_t v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      unint64_t v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }

    int64_t v23 = v9 + 1;
    if (__OFADD__(v9, 1LL))
    {
      __break(1u);
      goto LABEL_28;
    }

    if (v23 >= v13) {
      goto LABEL_26;
    }
    unint64_t v24 = *(void *)(v6 + 8 * v23);
    ++v9;
    if (!v24)
    {
      int64_t v9 = v23 + 1;
      if (v23 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v24 = *(void *)(v6 + 8 * v9);
      if (!v24) {
        break;
      }
    }

LABEL_25:
    unint64_t v12 = (v24 - 1) & v24;
    unint64_t v15 = __clz(__rbit64(v24)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 40 * v15;
    sub_100016974(*(void *)(v2 + 48) + 40 * v15, (uint64_t)v28);
    uint64_t result = (void *)sub_100016974(*(void *)(v2 + 56) + v16, (uint64_t)v26);
    uint64_t v17 = *(void *)(v4 + 48) + v16;
    __int128 v18 = v28[1];
    __int128 v19 = v28[0];
    *(void *)(v17 + 32) = v29;
    *(_OWORD *)uint64_t v17 = v19;
    *(_OWORD *)(v17 + 16) = v18;
    uint64_t v20 = *(void *)(v4 + 56) + v16;
    uint64_t v21 = v27;
    __int128 v22 = v26[1];
    *(_OWORD *)uint64_t v20 = v26[0];
    *(_OWORD *)(v20 + 16) = v22;
    *(void *)(v20 + 32) = v21;
  }

  int64_t v25 = v23 + 2;
  if (v25 >= v13) {
    goto LABEL_26;
  }
  unint64_t v24 = *(void *)(v6 + 8 * v25);
  if (v24)
  {
    int64_t v9 = v25;
    goto LABEL_25;
  }

  while (1)
  {
    int64_t v9 = v25 + 1;
    if (__OFADD__(v25, 1LL)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v24 = *(void *)(v6 + 8 * v9);
    ++v25;
    if (v24) {
      goto LABEL_25;
    }
  }

    unint64_t v12 = (v24 - 1) & v24;
    unint64_t v15 = __clz(__rbit64(v24)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    uint64_t v17 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
    __int128 v19 = *v17;
    __int128 v18 = v17[1];
    uint64_t v20 = 8 * v15;
    uint64_t v21 = *(void *)(*(void *)(v2 + 56) + v20);
    __int128 v22 = (void *)(*(void *)(v4 + 48) + v16);
    *__int128 v22 = v19;
    v22[1] = v18;
    *(void *)(*(void *)(v4 + 56) + v20) = v21;
    uint64_t result = (void *)swift_bridgeObjectRetain(v18);
  }

  int64_t v25 = v23 + 2;
  if (v25 >= v13) {
    goto LABEL_26;
  }
  unint64_t v24 = *(void *)(v6 + 8 * v25);
  if (v24)
  {
    int64_t v9 = v25;
    goto LABEL_25;
  }

  while (1)
  {
    int64_t v9 = v25 + 1;
    if (__OFADD__(v25, 1LL)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v24 = *(void *)(v6 + 8 * v9);
    ++v25;
    if (v24) {
      goto LABEL_25;
    }
  }

    unint64_t v12 = (v22 - 1) & v22;
    unint64_t v15 = __clz(__rbit64(v22)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 40 * v15;
    sub_100016974(*(void *)(v2 + 48) + 40 * v15, (uint64_t)v25);
    uint64_t v17 = 32 * v15;
    sub_1000169B0(*(void *)(v2 + 56) + v17, (uint64_t)v24);
    __int128 v18 = *(void *)(v4 + 48) + v16;
    __int128 v19 = v25[0];
    uint64_t v20 = v25[1];
    *(void *)(v18 + 32) = v26;
    *(_OWORD *)__int128 v18 = v19;
    *(_OWORD *)(v18 + 16) = v20;
    uint64_t result = sub_1000169EC(v24, (_OWORD *)(*(void *)(v4 + 56) + v17));
  }

  int64_t v23 = v21 + 2;
  if (v23 >= v13) {
    goto LABEL_26;
  }
  __int128 v22 = *(void *)(v6 + 8 * v23);
  if (v22)
  {
    int64_t v9 = v23;
    goto LABEL_25;
  }

  while (1)
  {
    int64_t v9 = v23 + 1;
    if (__OFADD__(v23, 1LL)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    __int128 v22 = *(void *)(v6 + 8 * v9);
    ++v23;
    if (v22) {
      goto LABEL_25;
    }
  }

  __break(1u);
  return result;
}

LABEL_28:
  __break(1u);
  return result;
}

  __break(1u);
  return result;
}

  __break(1u);
  return result;
}

void *sub_100015D30()
{
  uint64_t v1 = v0;
  sub_100008A20(&qword_1000363B0);
  uint64_t v2 = *v0;
  uint64_t v3 = static _DictionaryStorage.copy(original:)(*v0);
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    uint64_t result = (void *)swift_release(v2);
    uint64_t *v1 = v4;
    return result;
  }

  uint64_t result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1LL << *(_BYTE *)(v4 + 32)) + 63) >> 6;
  int64_t v9 = 0LL;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1LL << *(_BYTE *)(v2 + 32);
  uint64_t v11 = -1LL;
  if (v10 < 64) {
    uint64_t v11 = ~(-1LL << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 64);
  int64_t v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      unint64_t v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }

    int64_t v23 = v9 + 1;
    if (__OFADD__(v9, 1LL))
    {
      __break(1u);
      goto LABEL_28;
    }

    if (v23 >= v13) {
      goto LABEL_26;
    }
    unint64_t v24 = *(void *)(v6 + 8 * v23);
    ++v9;
    if (!v24)
    {
      int64_t v9 = v23 + 1;
      if (v23 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v24 = *(void *)(v6 + 8 * v9);
      if (!v24) {
        break;
      }
    }

void *sub_100015EDC()
{
  uint64_t v1 = v0;
  sub_100008A20(&qword_100036228);
  uint64_t v2 = *v0;
  uint64_t v3 = static _DictionaryStorage.copy(original:)(*v0);
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    uint64_t result = (void *)swift_release(v2);
    uint64_t *v1 = v4;
    return result;
  }

  uint64_t result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1LL << *(_BYTE *)(v4 + 32)) + 63) >> 6;
  int64_t v9 = 0LL;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1LL << *(_BYTE *)(v2 + 32);
  uint64_t v11 = -1LL;
  if (v10 < 64) {
    uint64_t v11 = ~(-1LL << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 64);
  int64_t v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      unint64_t v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }

    int64_t v21 = v9 + 1;
    if (__OFADD__(v9, 1LL))
    {
      __break(1u);
      goto LABEL_28;
    }

    if (v21 >= v13) {
      goto LABEL_26;
    }
    unint64_t v22 = *(void *)(v6 + 8 * v21);
    ++v9;
    if (!v22)
    {
      int64_t v9 = v21 + 1;
      if (v21 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v22 = *(void *)(v6 + 8 * v9);
      if (!v22) {
        break;
      }
    }

uint64_t sub_1000160C0(uint64_t a1, unint64_t a2)
{
  if (a1 == 0x6143646C756F6873LL && a2 == 0xEB00000000656863LL)
  {
    unint64_t v5 = 0xEB00000000656863LL;
    goto LABEL_8;
  }

  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0x6143646C756F6873LL, 0xEB00000000656863LL, a1, a2, 0LL) & 1) != 0)
  {
    unint64_t v5 = a2;
LABEL_8:
    swift_bridgeObjectRelease(v5);
    return 0LL;
  }

  if (a1 == 0xD000000000000020LL)
  {
    unint64_t v7 = 0x8000000100028FC0LL;
    if (a2 == 0x8000000100028FC0LL) {
      goto LABEL_13;
    }
  }

  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0xD000000000000020LL, 0x8000000100028FC0LL, a1, a2, 0LL) & 1) != 0)
  {
    unint64_t v7 = a2;
LABEL_13:
    swift_bridgeObjectRelease(v7);
    return 1LL;
  }

  if (a1 == 0xD00000000000001ALL)
  {
    unint64_t v8 = 0x8000000100028FF0LL;
    if (a2 == 0x8000000100028FF0LL) {
      goto LABEL_18;
    }
  }

  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0xD00000000000001ALL, 0x8000000100028FF0LL, a1, a2, 0LL) & 1) != 0)
  {
    unint64_t v8 = a2;
LABEL_18:
    swift_bridgeObjectRelease(v8);
    return 2LL;
  }

  if (a1 == 0xD000000000000023LL && a2 == 0x8000000100029010LL)
  {
    unint64_t v9 = 0x8000000100029010LL;
LABEL_24:
    swift_bridgeObjectRelease(v9);
    return 3LL;
  }

  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0xD000000000000023LL, 0x8000000100029010LL, a1, a2, 0LL) & 1) != 0)
  {
    unint64_t v9 = a2;
    goto LABEL_24;
  }

  if (a1 == 0xD00000000000001ALL)
  {
    unint64_t v10 = 0x8000000100029040LL;
    if (a2 == 0x8000000100029040LL) {
      goto LABEL_29;
    }
  }

  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0xD00000000000001ALL, 0x8000000100029040LL, a1, a2, 0LL) & 1) != 0)
  {
    unint64_t v10 = a2;
LABEL_29:
    swift_bridgeObjectRelease(v10);
    return 4LL;
  }

  if (a1 == 0xD000000000000020LL && a2 == 0x8000000100029060LL)
  {
    swift_bridgeObjectRelease(0x8000000100029060LL);
    return 5LL;
  }

  else
  {
    char v11 = _stringCompareWithSmolCheck(_:_:expecting:)(0xD000000000000020LL, 0x8000000100029060LL, a1, a2, 0LL);
    swift_bridgeObjectRelease(a2);
    if ((v11 & 1) != 0) {
      return 5LL;
    }
    else {
      return 6LL;
    }
  }

uint64_t sub_10001631C(void *a1)
{
  uint64_t v2 = sub_100008A20(qword_100036400);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin();
  unint64_t v5 = (char *)v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v6 = a1[3];
  uint64_t v7 = a1[4];
  sub_10000A0F0(a1, v6);
  unint64_t v8 = sub_10000A828();
  dispatch thunk of Decoder.container<A>(keyedBy:)( &type metadata for CachePolicyRelay.CodingKeys,  &type metadata for CachePolicyRelay.CodingKeys,  v8,  v6,  v7);
  char v16 = 0;
  LOBYTE(v6) = KeyedDecodingContainer.decode(_:forKey:)(&v16, v2);
  char v15 = 1;
  KeyedDecodingContainer.decode(_:forKey:)(&v15, v2);
  char v14 = 2;
  KeyedDecodingContainer.decode(_:forKey:)(&v14, v2);
  char v13 = 3;
  v10[3] = KeyedDecodingContainer.decode(_:forKey:)(&v13, v2);
  char v12 = 4;
  v10[2] = KeyedDecodingContainer.decode(_:forKey:)(&v12, v2);
  char v11 = 5;
  KeyedDecodingContainer.decode(_:forKey:)(&v11, v2);
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  sub_10000A114(a1);
  return v6 & 1;
}

uint64_t type metadata accessor for CachePolicy()
{
  return objc_opt_self(&OBJC_CLASS____TtC17TVUpNextExtensionP33_CEB3B327E539852F953463821CB150CF11CachePolicy);
}

uint64_t type metadata accessor for TopShelfContentProvider()
{
  return objc_opt_self(&OBJC_CLASS____TtC17TVUpNextExtension23TopShelfContentProvider);
}

void _s17TVUpNextExtension23TopShelfContentProviderC3logyySSFZ_0(uint64_t a1, unint64_t a2)
{
  if (qword_100036660 != -1) {
    swift_once(&qword_100036660, sub_10000AE44);
  }
  uint64_t v4 = type metadata accessor for Logger(0LL);
  sub_100024B80(v4, (uint64_t)qword_100036668);
  uint64_t v5 = swift_bridgeObjectRetain_n(a2, 2LL);
  uint64_t v6 = (os_log_s *)Logger.logObject.getter(v5);
  os_log_type_t v7 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v6, v7))
  {
    unint64_t v8 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    uint64_t v9 = swift_slowAlloc(32LL, -1LL);
    uint64_t v11 = v9;
    *(_DWORD *)unint64_t v8 = 136315138;
    swift_bridgeObjectRetain(a2);
    uint64_t v10 = sub_100013C68(a1, a2, &v11);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v10, &v11, v8 + 4, v8 + 12);
    swift_bridgeObjectRelease_n(a2, 3LL);
    _os_log_impl((void *)&_mh_execute_header, v6, v7, " --- %s --- ", v8, 0xCu);
    swift_arrayDestroy(v9, 1LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v9, -1LL, -1LL);
    swift_slowDealloc(v8, -1LL, -1LL);
  }

  else
  {

    swift_bridgeObjectRelease_n(a2, 2LL);
  }

uint64_t sub_100016720()
{
  *(void *)(v1 + 48) = v0;
  uint64_t v2 = (void *)swift_task_alloc(dword_10003611C);
  *(void *)(v1 + 56) = v2;
  void *v2 = v1;
  v2[1] = sub_100016768;
  return sub_10000C300();
}

uint64_t sub_100016768()
{
  uint64_t v2 = *(void *)(*(void *)v1 + 56LL);
  *(void *)(*(void *)v1 + 64LL) = v0;
  swift_task_dealloc(v2);
  if (v0) {
    uint64_t v3 = sub_1000168B4;
  }
  else {
    uint64_t v3 = sub_1000167CC;
  }
  return swift_task_switch(v3, 0LL, 0LL);
}

uint64_t sub_1000167CC()
{
  uint64_t v1 = *(void *)(v0 + 48);
  _s17TVUpNextExtension23TopShelfContentProviderC3logyySSFZ_0(0xD000000000000013LL, 0x80000001000299D0LL);
  *(_BYTE *)(v1 + OBJC_IVAR____TtC17TVUpNextExtension23TopShelfContentProvider_startupComplete) = 1;
  uint64_t v2 = (void *)(v1 + OBJC_IVAR____TtC17TVUpNextExtension23TopShelfContentProvider_startupInvocations);
  swift_beginAccess(v2, v0 + 16, 1LL, 0LL);
  uint64_t v3 = *v2;
  if (*v2)
  {
    uint64_t v4 = *(void *)(v3 + 16);
    if (v4)
    {
      swift_bridgeObjectRetain(*v2);
      uint64_t v5 = (void *)(v3 + 40);
      do
      {
        os_log_type_t v7 = (void (*)(uint64_t))*(v5 - 1);
        uint64_t v6 = *v5;
        uint64_t v8 = swift_retain(*v5);
        v7(v8);
        swift_release(v6);
        v5 += 2;
        --v4;
      }

      while (v4);
      swift_bridgeObjectRelease(v3);
      uint64_t v3 = *v2;
    }
  }

  void *v2 = 0LL;
  swift_bridgeObjectRelease(v3);
  return (*(uint64_t (**)(void))(v0 + 8))(0LL);
}

uint64_t sub_1000168B4()
{
  uint64_t v1 = *(void *)(v0 + 64);
  _StringGuts.grow(_:)(20LL);
  swift_bridgeObjectRelease(0xE000000000000000LL);
  *(void *)(v0 + 40) = v1;
  swift_errorRetain(v1);
  uint64_t v2 = sub_100008A20(&qword_100036270);
  v3._countAndFlagsBits = String.init<A>(describing:)(v0 + 40, v2);
  object = v3._object;
  String.append(_:)(v3);
  swift_bridgeObjectRelease(object);
  _s17TVUpNextExtension23TopShelfContentProviderC3logyySSFZ_0(0xD000000000000012LL, 0x80000001000299B0LL);
  swift_bridgeObjectRelease(0x80000001000299B0LL);
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(v1);
}

uint64_t sub_100016974(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_1000169B0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

_OWORD *sub_1000169EC(_OWORD *a1, _OWORD *a2)
{
  __int128 v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_1000169FC(uint64_t a1)
{
  return a1;
}

uint64_t sub_100016A30(uint64_t a1)
{
  return a1;
}

uint64_t sub_100016A54(uint64_t a1, void (*a2)(uint64_t, uint64_t, uint64_t, uint64_t))
{
  uint64_t v22 = a1 + 64;
  uint64_t v4 = 1LL << *(_BYTE *)(a1 + 32);
  uint64_t v5 = -1LL;
  if (v4 < 64) {
    uint64_t v5 = ~(-1LL << v4);
  }
  unint64_t v6 = v5 & *(void *)(a1 + 64);
  int64_t v7 = (unint64_t)(v4 + 63) >> 6;
  uint64_t result = swift_bridgeObjectRetain(a1);
  int64_t v9 = 0LL;
  while (1)
  {
    if (v6)
    {
      unint64_t v10 = __clz(__rbit64(v6));
      v6 &= v6 - 1;
      unint64_t v11 = v10 | (v9 << 6);
      goto LABEL_5;
    }

    int64_t v19 = v9 + 1;
    if (__OFADD__(v9, 1LL))
    {
      __break(1u);
      goto LABEL_25;
    }

    if (v19 >= v7) {
      return swift_release(a1);
    }
    unint64_t v20 = *(void *)(v22 + 8 * v19);
    ++v9;
    if (!v20)
    {
      int64_t v9 = v19 + 1;
      if (v19 + 1 >= v7) {
        return swift_release(a1);
      }
      unint64_t v20 = *(void *)(v22 + 8 * v9);
      if (!v20)
      {
        int64_t v9 = v19 + 2;
        if (v19 + 2 >= v7) {
          return swift_release(a1);
        }
        unint64_t v20 = *(void *)(v22 + 8 * v9);
        if (!v20)
        {
          int64_t v9 = v19 + 3;
          if (v19 + 3 >= v7) {
            return swift_release(a1);
          }
          unint64_t v20 = *(void *)(v22 + 8 * v9);
          if (!v20) {
            break;
          }
        }
      }
    }

LABEL_22:
    unint64_t v6 = (v20 - 1) & v20;
    unint64_t v11 = __clz(__rbit64(v20)) + (v9 << 6);
LABEL_5:
    uint64_t v12 = 16 * v11;
    char v13 = (uint64_t *)(*(void *)(a1 + 48) + v12);
    uint64_t v14 = *v13;
    uint64_t v15 = v13[1];
    char v16 = (uint64_t *)(*(void *)(a1 + 56) + v12);
    uint64_t v17 = *v16;
    uint64_t v18 = v16[1];
    swift_bridgeObjectRetain(v15);
    swift_bridgeObjectRetain(v18);
    a2(v14, v15, v17, v18);
    swift_bridgeObjectRelease(v18);
    uint64_t result = swift_bridgeObjectRelease(v15);
  }

  int64_t v21 = v19 + 4;
  if (v21 >= v7) {
    return swift_release(a1);
  }
  unint64_t v20 = *(void *)(v22 + 8 * v21);
  if (v20)
  {
    int64_t v9 = v21;
    goto LABEL_22;
  }

  while (1)
  {
    int64_t v9 = v21 + 1;
    if (__OFADD__(v21, 1LL)) {
      break;
    }
    if (v9 >= v7) {
      return swift_release(a1);
    }
    unint64_t v20 = *(void *)(v22 + 8 * v9);
    ++v21;
    if (v20) {
      goto LABEL_22;
    }
  }

void *sub_100016C14(uint64_t a1)
{
  uint64_t result = &_swiftEmptyDictionarySingleton;
  unint64_t v20 = &_swiftEmptyDictionarySingleton;
  if (*(void *)(a1 + 16))
  {
    sub_100016A54(a1, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_100023DF4);
    v16[0] = static String._unconditionallyBridgeFromObjectiveC(_:)(VUIMetricsActionDetailsKey);
    v16[1] = v3;
    AnyHashable.init<A>(_:)(v16, &type metadata for String, &protocol witness table for String);
    uint64_t v4 = sub_100008A20(&qword_1000361F0);
    uint64_t inited = swift_initStackObject(v4, v18);
    *(_OWORD *)(inited + 16) = xmmword_100027590;
    *(void *)(inited + 32) = static String._unconditionallyBridgeFromObjectiveC(_:)(VUIMetricsActionDetailsBuyParams);
    *(void *)(inited + 40) = v6;
    if (*(void *)(a1 + 16) && (unint64_t v7 = sub_1000142D8(0x6D61726150797562LL, 0xE900000000000073LL), (v8 & 1) != 0))
    {
      int64_t v9 = (uint64_t *)(*(void *)(a1 + 56) + 16 * v7);
      uint64_t v10 = *v9;
      uint64_t v11 = swift_bridgeObjectRetain(v9[1]);
    }

    else
    {
      uint64_t v10 = 0LL;
      uint64_t v11 = 0LL;
    }

    *(void *)(inited + 48) = v10;
    *(void *)(inited + 56) = v11;
    unint64_t v17 = sub_10000C1E0(inited);
    uint64_t v12 = sub_100008A20(&qword_1000361F8);
    unint64_t v13 = sub_100023E8C();
    AnyHashable.init<A>(_:)(&v17, v12, v13);
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(v20);
    unint64_t v17 = (unint64_t)v20;
    unint64_t v20 = (void *)0x8000000000000000LL;
    sub_1000156C8((uint64_t)v16, (uint64_t)v19, isUniquelyReferenced_nonNull_native);
    uint64_t v15 = v20;
    unint64_t v20 = (void *)v17;
    swift_bridgeObjectRelease(v15);
    sub_1000169FC((uint64_t)v19);
    return v20;
  }

  return result;
}

uint64_t sub_100016DC0(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }

  else
  {
    if (v4 < 0)
    {
      uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize with negative count",  51LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1090LL,  0);
      goto LABEL_9;
    }

    unint64_t v5 = a4 + 16 * a1 + 32;
    unint64_t v6 = a3 + 16 * v4;
    if (v5 >= v6 || v5 + 16 * v4 <= a3)
    {
      swift_arrayInitWithCopy(a3);
      return v6;
    }
  }

  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize overlapping range",  49LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1092LL,  0);
LABEL_9:
  __break(1u);
  return result;
}

id sub_100016EB0()
{
  uint64_t v0 = (void *)objc_opt_self(&OBJC_CLASS___WLKAppLibrary);
  id result = [v0 defaultAppLibrary];
  if (!result)
  {
    __break(1u);
LABEL_11:
    __break(1u);
    return result;
  }

  __int128 v2 = result;
  id v3 = [result allAppBundleIdentifiers];

  if (v3)
  {
    uint64_t v4 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v3, (char *)&type metadata for Any + 8);

    unint64_t v5 = sub_10000BF70(v4);
    swift_bridgeObjectRelease(v4);
    if (v5) {
      sub_10000CAD0((uint64_t)v5);
    }
  }

  id result = [v0 defaultAppLibrary];
  if (!result) {
    goto LABEL_11;
  }
  unint64_t v6 = result;
  id v7 = [result _nonConformingAppBundleIdentifiers];

  if (v7)
  {
    uint64_t v8 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v7, (char *)&type metadata for Any + 8);

    int64_t v9 = sub_10000BF70(v8);
    swift_bridgeObjectRelease(v8);
    if (v9) {
      sub_10000CAD0((uint64_t)v9);
    }
  }

  return &_swiftEmptyArrayStorage;
}

uint64_t sub_100016FF8(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
    goto LABEL_9;
  }

  if (v4 < 0)
  {
LABEL_9:
    uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize with negative count",  51LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1090LL,  0);
    goto LABEL_11;
  }

  unint64_t v6 = a4 + 40 * a1 + 32;
  unint64_t v7 = a3 + 40 * v4;
  if (v6 >= v7 || v6 + 40 * v4 <= a3)
  {
    sub_100008A20(&qword_1000363D8);
    swift_arrayInitWithCopy(a3);
    return v7;
  }

  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize overlapping range",  49LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1092LL,  0);
LABEL_11:
  __break(1u);
  return result;
}

uint64_t _s17TVUpNextExtension23TopShelfContentProviderC8localizeyS2S_SayyXlGtF_0( uint64_t a1, void *a2, uint64_t a3)
{
  if ((unint64_t)a3 >> 62)
  {
    if (a3 < 0) {
      uint64_t v25 = a3;
    }
    else {
      uint64_t v25 = a3 & 0xFFFFFFFFFFFFFF8LL;
    }
    swift_bridgeObjectRetain(a3);
    uint64_t v26 = _CocoaArrayWrapper.endIndex.getter(v25);
    swift_bridgeObjectRelease(a3);
    if (v26 < 11)
    {
      uint64_t v41 = (char *)&_swiftEmptyArrayStorage;
      swift_bridgeObjectRetain(a3);
      uint64_t v6 = _CocoaArrayWrapper.endIndex.getter(v25);
      if (v6) {
        goto LABEL_4;
      }
      goto LABEL_33;
    }
  }

  else
  {
    uint64_t v6 = *(void *)((a3 & 0xFFFFFFFFFFFFF8LL) + 0x10);
    if ((unint64_t)v6 <= 0xA)
    {
      uint64_t v41 = (char *)&_swiftEmptyArrayStorage;
      swift_bridgeObjectRetain(a3);
      if (v6)
      {
LABEL_4:
        if (v6 < 1) {
          goto LABEL_55;
        }
        __int128 v39 = a2;
        uint64_t v8 = 0LL;
        int64_t v9 = (char *)&_swiftEmptyArrayStorage;
        do
        {
          if ((a3 & 0xC000000000000001LL) != 0)
          {
            uint64_t v11 = specialized _ArrayBuffer._getElementSlowPath(_:)(v8, a3);
          }

          else
          {
            uint64_t v11 = *(void *)(a3 + 8 * v8 + 32);
            swift_unknownObjectRetain(v11, v7);
          }

          *(void *)&__int128 v42 = v11;
          swift_unknownObjectRetain(v11, v10);
          if (swift_dynamicCast( &v40,  &v42,  (char *)&type metadata for Swift.AnyObject + 8,  &type metadata for Int,  6LL))
          {
            swift_unknownObjectRetain(v11, v12);
            uint64_t v13 = objc_opt_self(&OBJC_CLASS___NSNumber);
            uint64_t v14 = (void *)swift_dynamicCastObjCClass(v11, v13);
            if (v14)
            {
              id v15 = [v14 integerValue];
              if ((swift_isUniquelyReferenced_nonNull_native(v9) & 1) == 0) {
                int64_t v9 = sub_100013A3C(0LL, *((void *)v9 + 2) + 1LL, 1, v9);
              }
              unint64_t v17 = *((void *)v9 + 2);
              unint64_t v16 = *((void *)v9 + 3);
              if (v17 >= v16 >> 1) {
                int64_t v9 = sub_100013A3C((char *)(v16 > 1), v17 + 1, 1, v9);
              }
              uint64_t v44 = &protocol witness table for Int;
              uint64_t v43 = &type metadata for Int;
              *(void *)&__int128 v42 = v15;
              *((void *)v9 + 2) = v17 + 1;
              sub_100024B68(&v42, (uint64_t)&v9[40 * v17 + 32]);
              swift_unknownObjectRelease(v11);
              uint64_t v41 = v9;
            }

            else
            {
              swift_unknownObjectRelease(v11);
            }
          }

          uint64_t v40 = v11;
          swift_unknownObjectRetain(v11, v12);
          if (swift_dynamicCast( &v42,  &v40,  (char *)&type metadata for Swift.AnyObject + 8,  &type metadata for String,  6LL))
          {
            swift_bridgeObjectRelease(*((void *)&v42 + 1));
            swift_unknownObjectRetain(v11, v18);
            uint64_t v19 = objc_opt_self(&OBJC_CLASS___NSString);
            uint64_t v20 = swift_dynamicCastObjCClass(v11, v19);
            if (v20)
            {
              uint64_t v22 = v20;
              swift_unknownObjectRetain(v11, v21);
              if ((swift_isUniquelyReferenced_nonNull_native(v9) & 1) == 0) {
                int64_t v9 = sub_100013A3C(0LL, *((void *)v9 + 2) + 1LL, 1, v9);
              }
              unint64_t v24 = *((void *)v9 + 2);
              unint64_t v23 = *((void *)v9 + 3);
              if (v24 >= v23 >> 1) {
                int64_t v9 = sub_100013A3C((char *)(v23 > 1), v24 + 1, 1, v9);
              }
              uint64_t v43 = (void *)sub_10000A134(0LL, &qword_1000363C8, &OBJC_CLASS___NSString_ptr);
              uint64_t v44 = (void *)sub_100024B10();
              *(void *)&__int128 v42 = v22;
              *((void *)v9 + 2) = v24 + 1;
              sub_100024B68(&v42, (uint64_t)&v9[40 * v24 + 32]);
              swift_unknownObjectRelease_n(v11, 2LL);
              uint64_t v41 = v9;
            }

            else
            {
              swift_unknownObjectRelease_n(v11, 2LL);
            }
          }

          else
          {
            swift_unknownObjectRelease(v11);
          }

          ++v8;
        }

        while (v6 != v8);
        swift_bridgeObjectRelease(a3);
        a2 = v39;
LABEL_34:
        uint64_t v27 = sub_100008A20(&qword_1000363B8);
        uint64_t inited = swift_initStackObject(v27, v45);
        *(_OWORD *)(inited + 16) = xmmword_100028630;
        *(void *)(inited + 56) = &type metadata for String;
        unint64_t v29 = sub_100024ACC();
        *(void *)(inited + 32) = 0LL;
        *(void *)(inited + 40) = 0xE000000000000000LL;
        *(void *)(inited + 96) = &type metadata for String;
        *(void *)(inited + 104) = v29;
        *(void *)(inited + 64) = v29;
        *(void *)(inited + 72) = 0LL;
        *(void *)(inited + 80) = 0xE000000000000000LL;
        *(void *)(inited + 136) = &type metadata for String;
        *(void *)(inited + 144) = v29;
        *(void *)(inited + 112) = 0LL;
        *(void *)(inited + 120) = 0xE000000000000000LL;
        *(void *)(inited + 176) = &type metadata for String;
        *(void *)(inited + 184) = v29;
        *(void *)(inited + 152) = 0LL;
        *(void *)(inited + 160) = 0xE000000000000000LL;
        *(void *)(inited + 216) = &type metadata for String;
        *(void *)(inited + 224) = v29;
        *(void *)(inited + 192) = 0LL;
        *(void *)(inited + 200) = 0xE000000000000000LL;
        *(void *)(inited + 256) = &type metadata for String;
        *(void *)(inited + 264) = v29;
        *(void *)(inited + 232) = 0LL;
        *(void *)(inited + 240) = 0xE000000000000000LL;
        *(void *)(inited + 296) = &type metadata for String;
        *(void *)(inited + 304) = v29;
        *(void *)(inited + 272) = 0LL;
        *(void *)(inited + 280) = 0xE000000000000000LL;
        *(void *)(inited + 336) = &type metadata for String;
        *(void *)(inited + 344) = v29;
        *(void *)(inited + 312) = 0LL;
        *(void *)(inited + 320) = 0xE000000000000000LL;
        *(void *)(inited + 376) = &type metadata for String;
        *(void *)(inited + 384) = v29;
        *(void *)(inited + 352) = 0LL;
        *(void *)(inited + 360) = 0xE000000000000000LL;
        *(void *)(inited + 416) = &type metadata for String;
        *(void *)(inited + 424) = v29;
        *(void *)(inited + 392) = 0LL;
        *(void *)(inited + 400) = 0xE000000000000000LL;
        sub_10000CC24(inited);
        uint64_t v30 = (NSBundle *)[(id)objc_opt_self(NSBundle) mainBundle];
        v46._object = (void *)0xE700000000000000LL;
        v31._countAndFlagsBits = a1;
        v31._object = a2;
        v32._countAndFlagsBits = 0LL;
        v32._object = (void *)0xE000000000000000LL;
        v46._countAndFlagsBits = 0x746E656D6D6F63LL;
        Swift::String v33 = NSLocalizedString(_:tableName:bundle:value:comment:)(v31, (Swift::String_optional)0, v30, v32, v46);

        uint64_t v34 = swift_allocObject(v27, 432LL, 7LL);
        *(_OWORD *)(v34 + 16) = xmmword_100028630;
        uint64_t v35 = v41;
        if (*((void *)v41 + 2))
        {
          uint64_t v36 = v34;
          sub_10000A240((uint64_t)(v41 + 32), v34 + 32);
          if (*((void *)v35 + 2) >= 2uLL)
          {
            sub_10000A240((uint64_t)(v35 + 72), v36 + 72);
            if (*((void *)v35 + 2) >= 3uLL)
            {
              sub_10000A240((uint64_t)(v35 + 112), v36 + 112);
              if (*((void *)v35 + 2) >= 4uLL)
              {
                sub_10000A240((uint64_t)(v35 + 152), v36 + 152);
                if (*((void *)v35 + 2) >= 5uLL)
                {
                  sub_10000A240((uint64_t)(v35 + 192), v36 + 192);
                  if (*((void *)v35 + 2) >= 6uLL)
                  {
                    sub_10000A240((uint64_t)(v35 + 232), v36 + 232);
                    if (*((void *)v35 + 2) >= 7uLL)
                    {
                      sub_10000A240((uint64_t)(v35 + 272), v36 + 272);
                      if (*((void *)v35 + 2) >= 8uLL)
                      {
                        sub_10000A240((uint64_t)(v35 + 312), v36 + 312);
                        if (*((void *)v35 + 2) >= 9uLL)
                        {
                          sub_10000A240((uint64_t)(v35 + 352), v36 + 352);
                          if (*((void *)v35 + 2) >= 0xAuLL)
                          {
                            sub_10000A240((uint64_t)(v35 + 392), v36 + 392);
                            uint64_t v37 = static String.localizedStringWithFormat(_:_:)( v33._countAndFlagsBits,  v33._object,  v36);
                            swift_bridgeObjectRelease(v35);
                            swift_bridgeObjectRelease(v33._object);
                            swift_bridgeObjectRelease(v36);
                            return v37;
                          }

                          goto LABEL_54;
                        }

LABEL_53:
                        __break(1u);
LABEL_54:
                        __break(1u);
LABEL_55:
                        __break(1u);
                      }

    swift_bridgeObjectRelease(v152);
    if ((v13 & 0x2000000) == 0)
    {
LABEL_24:
      if ((v13 & 0x4000000) != 0)
      {
LABEL_25:
        unint64_t v17 = 0;
        uint64_t v18 = 0;
        uint64_t v19 = 0;
        uint64_t v20 = 0;
        goto LABEL_26;
      }

LABEL_52:
                      __break(1u);
                      goto LABEL_53;
                    }

    if ((v22 & 0x8000000000000000LL) != 0LL) {
      v109 = v22;
    }
    else {
      v109 = v22 & 0xFFFFFFFFFFFFFF8LL;
    }
    v110 = sub_10000A134(0LL, &qword_100036360, &OBJC_CLASS___TVTopShelfAction_ptr);
    v111 = v24;
    swift_bridgeObjectRetain(v22);
    v107 = _bridgeCocoaArray<A>(_:)(v109, v110);
    swift_bridgeObjectRelease(v22);
    goto LABEL_45;
  }

  v129 = *(void **)(v60 + 16);
  if (v129)
  {
    v112[0] = v24;
    uint64_t v22 = 0LL;
    v117 = @"TVUNItemUserInfoKeyCustomAction";
    v116 = @"TVUNItemUserInfoKeyCanonicalID";
    v115 = @"TVUNItemUserInfoKeyShowID";
    v114 = @"TVUNItemUserInfoKeyURL";
    v113 = @"TVUNItemUserInfoKeyShowURL";
    unint64_t v24 = (uint64_t *)(v60 + 40);
    uint64_t v62 = (uint64_t *)(v119 + 40);
    uint64_t v63 = (uint64_t *)(v118 + 40);
    v112[1] = (char *)&type metadata for Any + 8;
    while (1)
    {
      URL.init(string:)(v127, v126);
      if (v128((char *)v42, 1LL, v30) == 1)
      {
        sub_100023F4C(v42, &qword_1000361C0);
      }

      else
      {
        (*(void (**)(char *, uint64_t, uint64_t))(v40 + 32))(v125, v42, v30);
        uint64_t v64 = objc_allocWithZone(&OBJC_CLASS___TVTopShelfCustomAction);
        URL._bridgeToObjectiveC()(v65);
        uint64_t v67 = v66;
        uint64_t v68 = [v64 initWithURL:v66];

        uint64_t v69 = sub_10000C0B4((uint64_t)&_swiftEmptyArrayStorage);
        *(void *)&v132 = static String._unconditionallyBridgeFromObjectiveC(_:)(v117);
        *((void *)&v132 + 1) = v70;
        AnyHashable.init<A>(_:)(&v132, &type metadata for String, &protocol witness table for String);
        v133 = &type metadata for String;
        if (v22 >= (unint64_t)v129)
        {
          __break(1u);
LABEL_47:
          __break(1u);
LABEL_48:
          __break(1u);
LABEL_49:
          __break(1u);
          goto LABEL_50;
        }

        uint64_t v71 = *v24;
        *(void *)&v132 = *(v24 - 1);
        *((void *)&v132 + 1) = v71;
        sub_1000169EC(&v132, v131);
        swift_bridgeObjectRetain(v71);
        char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(v69);
        v135 = v69;
        sub_1000159A0(v131, (uint64_t)v134, isUniquelyReferenced_nonNull_native);
        uint64_t v73 = v135;
        swift_bridgeObjectRelease(0x8000000000000000LL);
        sub_1000169FC((uint64_t)v134);
        *(void *)&v132 = static String._unconditionallyBridgeFromObjectiveC(_:)(v116);
        *((void *)&v132 + 1) = v74;
        AnyHashable.init<A>(_:)(&v132, &type metadata for String, &protocol witness table for String);
        v133 = &type metadata for String;
        uint64_t v75 = v120;
        *(void *)&v132 = v121;
        *((void *)&v132 + 1) = v120;
        sub_1000169EC(&v132, v131);
        swift_bridgeObjectRetain(v75);
        uint64_t v76 = swift_isUniquelyReferenced_nonNull_native(v73);
        v130 = v73;
        sub_1000159A0(v131, (uint64_t)v134, v76);
        v77 = v130;
        v135 = v130;
        swift_bridgeObjectRelease(0x8000000000000000LL);
        sub_1000169FC((uint64_t)v134);
        *(void *)&v132 = static String._unconditionallyBridgeFromObjectiveC(_:)(v115);
        *((void *)&v132 + 1) = v78;
        AnyHashable.init<A>(_:)(&v132, &type metadata for String, &protocol witness table for String);
        v79 = *(void *)(a1 + 200);
        if (v79)
        {
          v80 = *(void *)(a1 + 192);
          v133 = &type metadata for String;
          *(void *)&v132 = v80;
          *((void *)&v132 + 1) = v79;
          sub_1000169EC(&v132, v131);
          swift_bridgeObjectRetain(v79);
          v81 = swift_isUniquelyReferenced_nonNull_native(v77);
          v130 = v77;
          sub_1000159A0(v131, (uint64_t)v134, v81);
          v135 = v130;
          swift_bridgeObjectRelease(0x8000000000000000LL);
          sub_1000169FC((uint64_t)v134);
        }

        else
        {
          sub_100014900((uint64_t)v134, &v132);
          sub_1000169FC((uint64_t)v134);
          sub_100023F4C((uint64_t)&v132, &qword_100036048);
        }

        *(void *)&v132 = static String._unconditionallyBridgeFromObjectiveC(_:)(v114);
        *((void *)&v132 + 1) = v82;
        AnyHashable.init<A>(_:)(&v132, &type metadata for String, &protocol witness table for String);
        v83 = *(void *)(a1 + 168);
        if (v83)
        {
          v84 = *(void *)(a1 + 160);
          v133 = &type metadata for String;
          *(void *)&v132 = v84;
          *((void *)&v132 + 1) = v83;
          sub_1000169EC(&v132, v131);
          swift_bridgeObjectRetain(v83);
          v85 = v135;
          v86 = swift_isUniquelyReferenced_nonNull_native(v135);
          v130 = v85;
          sub_1000159A0(v131, (uint64_t)v134, v86);
          v135 = v130;
          swift_bridgeObjectRelease(0x8000000000000000LL);
          sub_1000169FC((uint64_t)v134);
        }

        else
        {
          sub_100014900((uint64_t)v134, &v132);
          sub_1000169FC((uint64_t)v134);
          sub_100023F4C((uint64_t)&v132, &qword_100036048);
        }

        *(void *)&v132 = static String._unconditionallyBridgeFromObjectiveC(_:)(v113);
        *((void *)&v132 + 1) = v87;
        AnyHashable.init<A>(_:)(&v132, &type metadata for String, &protocol witness table for String);
        v88 = *(void *)(a1 + 184);
        if (v88)
        {
          v89 = *(void *)(a1 + 176);
          v133 = &type metadata for String;
          *(void *)&v132 = v89;
          *((void *)&v132 + 1) = v88;
          sub_1000169EC(&v132, v131);
          swift_bridgeObjectRetain(v88);
          v90 = v135;
          v91 = swift_isUniquelyReferenced_nonNull_native(v135);
          v130 = v90;
          sub_1000159A0(v131, (uint64_t)v134, v91);
          v135 = v130;
          swift_bridgeObjectRelease(0x8000000000000000LL);
          sub_1000169FC((uint64_t)v134);
        }

        else
        {
          sub_100014900((uint64_t)v134, &v132);
          sub_1000169FC((uint64_t)v134);
          sub_100023F4C((uint64_t)&v132, &qword_100036048);
        }

        if (v22 >= *(void *)(v119 + 16)) {
          goto LABEL_47;
        }
        v92 = *v62;
        v93 = v68;
        swift_bridgeObjectRetain(v92);
        v94 = String._bridgeToObjectiveC()();
        swift_bridgeObjectRelease(v92);
        [v93 _setTitle:v94];

        if (v22 >= *(void *)(v118 + 16)) {
          goto LABEL_48;
        }
        v95 = *v63;
        v96 = v93;
        swift_bridgeObjectRetain(v95);
        v97 = String._bridgeToObjectiveC()();
        swift_bridgeObjectRelease(v95);
        [v96 _setImageName:v97];

        v98 = v135;
        v99 = v96;
        v100 = Dictionary._bridgeToObjectiveC()().super.isa;
        swift_bridgeObjectRelease(v98);
        [v99 _setUserInfo:v100];

        v101 = v99;
        specialized Array._makeUniqueAndReserveCapacityIfNotUnique()(v101);
        v103 = *(void *)((v136 & 0xFFFFFFFFFFFFFF8LL) + 0x10);
        v102 = *(void *)((v136 & 0xFFFFFFFFFFFFFF8LL) + 0x18);
        if (v103 >= v102 >> 1) {
          specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v102 > 1, v103 + 1, 1LL);
        }
        v104 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v103, v101);
        specialized Array._endMutation()(v104);

        uint64_t v40 = v124;
        uint64_t v30 = v123;
        (*(void (**)(char *, uint64_t))(v124 + 8))(v125, v123);
        __int128 v42 = (uint64_t)v122;
      }

      ++v22;
      v24 += 2;
      v62 += 2;
      v63 += 2;
      if (v129 == (void *)v22)
      {
        uint64_t v22 = v136;
        unint64_t v24 = (uint64_t *)v112[0];
        goto LABEL_43;
      }
    }
  }

  __break(1u);
  return result;
}

    swift_bridgeObjectRelease(v154);
    if ((v13 & 0x1000000) == 0)
    {
LABEL_23:
      if ((v13 & 0x2000000) == 0) {
        goto LABEL_24;
      }
      goto LABEL_54;
    }

LABEL_51:
                    __break(1u);
                    goto LABEL_52;
                  }

    swift_bridgeObjectRelease(v155);
    if ((v13 & 0x800000) == 0)
    {
LABEL_22:
      if ((v13 & 0x1000000) == 0) {
        goto LABEL_23;
      }
      goto LABEL_53;
    }

LABEL_50:
                  __break(1u);
                  goto LABEL_51;
                }

    swift_bridgeObjectRelease(v156);
    if ((v13 & 0x400000) == 0)
    {
LABEL_21:
      if ((v13 & 0x800000) == 0) {
        goto LABEL_22;
      }
      goto LABEL_52;
    }

LABEL_49:
                __break(1u);
                goto LABEL_50;
              }

    swift_bridgeObjectRelease(v157);
    if ((v13 & 0x200000) == 0)
    {
LABEL_20:
      if ((v13 & 0x400000) == 0) {
        goto LABEL_21;
      }
      goto LABEL_51;
    }

LABEL_48:
              __break(1u);
              goto LABEL_49;
            }

    swift_bridgeObjectRelease(v158);
    if ((v13 & 0x100000) == 0)
    {
LABEL_19:
      if ((v13 & 0x200000) == 0) {
        goto LABEL_20;
      }
      goto LABEL_50;
    }

LABEL_47:
            __break(1u);
            goto LABEL_48;
          }
        }

        else
        {
          __break(1u);
        }

        __break(1u);
        goto LABEL_47;
      }

    swift_bridgeObjectRelease(v159);
    if ((v13 & 0x8000) == 0)
    {
LABEL_18:
      if ((v13 & 0x100000) == 0) {
        goto LABEL_19;
      }
      goto LABEL_49;
    }

id _s17TVUpNextExtension23TopShelfContentProviderC18localizeWithCountsyS2S_SayyXlGtF_0( uint64_t a1, void *a2, uint64_t a3)
{
  unint64_t v52 = (unint64_t)&_swiftEmptyArrayStorage;
  if ((unint64_t)a3 >> 62)
  {
    if (a3 < 0) {
      uint64_t v36 = a3;
    }
    else {
      uint64_t v36 = a3 & 0xFFFFFFFFFFFFFF8LL;
    }
    swift_bridgeObjectRetain(a3);
    id result = (id)_CocoaArrayWrapper.endIndex.getter(v36);
    uint64_t v6 = (uint64_t)result;
    if (result) {
      goto LABEL_3;
    }
LABEL_28:
    swift_bridgeObjectRelease(a3);
    goto LABEL_29;
  }

  uint64_t v6 = *(void *)((a3 & 0xFFFFFFFFFFFFF8LL) + 0x10);
  id result = (id)swift_bridgeObjectRetain(a3);
  if (!v6) {
    goto LABEL_28;
  }
LABEL_3:
  if (v6 < 1)
  {
    __break(1u);
    goto LABEL_35;
  }

  uint64_t v46 = a1;
  uint64_t v47 = a2;
  uint64_t v9 = 0LL;
  unint64_t v10 = a3 & 0xC000000000000001LL;
  uint64_t v11 = (char *)&type metadata for Swift.AnyObject;
  uint64_t v12 = (char *)&type metadata for Swift.AnyObject + 8;
  uint64_t v48 = v6;
  do
  {
    if (v10)
    {
      uint64_t v14 = specialized _ArrayBuffer._getElementSlowPath(_:)(v9, a3);
    }

    else
    {
      uint64_t v14 = *(void *)(a3 + 8 * v9 + 32);
      swift_unknownObjectRetain(v14, v8);
    }

    uint64_t v49 = v14;
    swift_unknownObjectRetain(v14, v13);
    if (swift_dynamicCast(&v51, &v49, v12, &type metadata for Int, 6LL))
    {
      swift_unknownObjectRetain(v14, v15);
      uint64_t v16 = objc_opt_self(&OBJC_CLASS___NSNumber);
      uint64_t v17 = swift_dynamicCastObjCClass(v14, v16);
      if (v17)
      {
        uint64_t v19 = v17;
        uint64_t v20 = swift_unknownObjectRetain(v14, v18);
        specialized Array._makeUniqueAndReserveCapacityIfNotUnique()(v20);
        unint64_t v22 = *(void *)((v52 & 0xFFFFFFFFFFFFFF8LL) + 0x10);
        unint64_t v21 = *(void *)((v52 & 0xFFFFFFFFFFFFFF8LL) + 0x18);
        if (v22 >= v21 >> 1) {
          specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v21 > 1, v22 + 1, 1LL);
        }
        uint64_t v23 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v22, v19);
        specialized Array._endMutation()(v23);
      }

      swift_unknownObjectRelease(v14);
    }

    uint64_t v51 = v14;
    swift_unknownObjectRetain(v14, v15);
    if ((swift_dynamicCast(&v49, &v51, v11 + 8, &type metadata for String, 6LL) & 1) != 0
      && (swift_bridgeObjectRelease(v50),
          uint64_t v51 = v14,
          swift_unknownObjectRetain(v14, v24),
          (swift_dynamicCast(&v49, &v51, v11 + 8, &type metadata for String, 6LL) & 1) != 0))
    {
      uint64_t v25 = v12;
      unint64_t v26 = v10;
      uint64_t v27 = v11;
      uint64_t v28 = v50;
      id v29 = [objc_allocWithZone(NSNumberFormatter) init];
      NSString v30 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease(v28);
      id v31 = [v29 numberFromString:v30];

      if (v31)
      {
        id v32 = v31;
        specialized Array._makeUniqueAndReserveCapacityIfNotUnique()(v32);
        unint64_t v34 = *(void *)((v52 & 0xFFFFFFFFFFFFFF8LL) + 0x10);
        unint64_t v33 = *(void *)((v52 & 0xFFFFFFFFFFFFFF8LL) + 0x18);
        if (v34 >= v33 >> 1) {
          specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v33 > 1, v34 + 1, 1LL);
        }
        uint64_t v35 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v34, v32);
        specialized Array._endMutation()(v35);
      }

      swift_unknownObjectRelease(v14);
      uint64_t v11 = v27;
      unint64_t v10 = v26;
      uint64_t v12 = v25;
      uint64_t v6 = v48;
    }

    else
    {
      swift_unknownObjectRelease(v14);
    }

    ++v9;
  }

  while (v6 != v9);
  swift_bridgeObjectRelease(a3);
  a1 = v46;
  a2 = v47;
LABEL_29:
  id result = [(id)objc_opt_self(VUILocalizationManager) sharedInstance];
  if (!result)
  {
LABEL_35:
    __break(1u);
    return result;
  }

  uint64_t v37 = result;
  char v38 = (NSBundle *)[(id)objc_opt_self(NSBundle) mainBundle];
  v53._object = (void *)0xE700000000000000LL;
  v39._countAndFlagsBits = a1;
  v39._object = a2;
  v40._countAndFlagsBits = 0LL;
  v40._object = (void *)0xE000000000000000LL;
  v53._countAndFlagsBits = 0x746E656D6D6F63LL;
  object = NSLocalizedString(_:tableName:bundle:value:comment:)(v39, (Swift::String_optional)0, v38, v40, v53)._object;

  NSString v42 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(object);
  unint64_t v43 = v52;
  sub_10000A134(0LL, &qword_1000363A0, &OBJC_CLASS___NSNumber_ptr);
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v43);
  id v45 = [v37 localizedStringForKey:v42 withCounts:isa];

  if (v45)
  {
    a1 = static String._unconditionallyBridgeFromObjectiveC(_:)(v45);
  }

  else
  {
    swift_bridgeObjectRetain(a2);
  }

  return (id)a1;
}

uint64_t sub_100017BD8(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }

  else
  {
    if (v4 < 0)
    {
      uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize with negative count",  51LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1090LL,  0);
      goto LABEL_9;
    }

    unint64_t v6 = a4 + 8 * a1 + 32;
    unint64_t v7 = a3 + 8 * v4;
    if (v6 >= v7 || v6 + 8 * v4 <= a3)
    {
      sub_100008A20(&qword_100036268);
      swift_arrayInitWithCopy(a3);
      return v7;
    }
  }

  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize overlapping range",  49LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1092LL,  0);
LABEL_9:
  __break(1u);
  return result;
}

void _s17TVUpNextExtension23TopShelfContentProviderC18fetchRentalDetailsSaySDySSs6UInt64VGGyF_0()
{
  id v0 = [(id)objc_opt_self(MPMediaQuery) movieRentalsQuery];
  id v1 = [objc_allocWithZone(NSNumber) initWithDouble:static Date.timeIntervalSinceReferenceDate.getter()];
  uint64_t v2 = MPMediaItemPropertyRentalExpirationDate;
  static String._unconditionallyBridgeFromObjectiveC(_:)(MPMediaItemPropertyRentalExpirationDate);
  uint64_t v4 = v3;
  NSString v5 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v4);
  unint64_t v6 = (void *)objc_opt_self(&OBJC_CLASS___MPMediaPropertyPredicate);
  id v7 = [v6 predicateWithValue:v1 forProperty:v5 comparisonType:101];

  id v8 = [objc_allocWithZone(NSNumber) initWithInteger:0];
  static String._unconditionallyBridgeFromObjectiveC(_:)(v2);
  uint64_t v10 = v9;
  NSString v11 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v10);
  id v12 = [v6 predicateWithValue:v8 forProperty:v11 comparisonType:0];

  uint64_t v13 = sub_100008A20(&qword_100036388);
  uint64_t v14 = swift_allocObject(v13, 96LL, 7LL);
  *(_OWORD *)(v14 + 16) = xmmword_100028610;
  uint64_t v15 = sub_10000A134(0LL, &qword_100036390, &OBJC_CLASS___MPMediaPropertyPredicate_ptr);
  *(void *)(v14 + 32) = v7;
  *(void *)(v14 + 88) = v15;
  *(void *)(v14 + 56) = v15;
  *(void *)(v14 + 64) = v12;
  id v16 = v7;
  id v17 = v12;
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v14);
  id v19 =  [(id)objc_opt_self(MPMediaCompoundAnyPredicate) predicateMatchingPredicates:isa];

  if (v19)
  {
    if (!v0)
    {

      return;
    }

    [v0 addFilterPredicate:v19];
  }

  else if (!v0)
  {

    return;
  }

  id v20 = [v0 items];
  if (!v20)
  {

    return;
  }

  unint64_t v21 = v20;
  uint64_t v22 = sub_10000A134(0LL, &qword_100036398, &OBJC_CLASS___MPMediaItem_ptr);
  uint64_t v23 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v21, v22);

  if ((unint64_t)v23 >> 62)
  {
    if (v23 < 0) {
      uint64_t v66 = v23;
    }
    else {
      uint64_t v66 = v23 & 0xFFFFFFFFFFFFFF8LL;
    }
    swift_bridgeObjectRetain(v23);
    uint64_t v24 = _CocoaArrayWrapper.endIndex.getter(v66);
    swift_bridgeObjectRelease(v23);
    if (v24) {
      goto LABEL_8;
    }
LABEL_66:

    swift_bridgeObjectRelease(v23);
LABEL_67:

    return;
  }

  uint64_t v24 = *(void *)((v23 & 0xFFFFFFFFFFFFF8LL) + 0x10);
  if (!v24) {
    goto LABEL_66;
  }
LABEL_8:
  if (v24 >= 1)
  {
    id v67 = v19;
    id v68 = v17;
    id v69 = v0;
    uint64_t v25 = 0LL;
    unint64_t v75 = v23 & 0xC000000000000001LL;
    uint64_t v74 = MPMediaItemPropertyStoreID;
    uint64_t v73 = MPMediaItemPropertyRentalStartTime;
    uint64_t v72 = MPMediaItemPropertyRentalDuration;
    unint64_t v26 = (char *)&_swiftEmptyArrayStorage;
    uint64_t v70 = MPMediaItemPropertyRentalPlaybackDuration;
    uint64_t v71 = MPMediaItemPropertyRentalPlaybackStartTime;
    uint64_t v76 = v23;
    while (1)
    {
      if (v75) {
        id v27 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v25, v23);
      }
      else {
        id v27 = *(id *)(v23 + 8 * v25 + 32);
      }
      uint64_t v28 = v27;
      id v29 = objc_msgSend(v27, "valueForProperty:", v74, v67);
      if (v29)
      {
        id v30 = v29;
        _bridgeAnyObjectToAny(_:)(&v78);
        swift_unknownObjectRelease(v30);
      }

      else
      {
        __int128 v78 = 0u;
        __int128 v79 = 0u;
      }

      sub_100024A88((uint64_t)&v78, (uint64_t)v80, &qword_100036048);
      if (v81)
      {
        uint64_t v31 = sub_10000A134(0LL, &qword_1000363A0, &OBJC_CLASS___NSNumber_ptr);
        if ((swift_dynamicCast(&v77, v80, (char *)&type metadata for Any + 8, v31, 6LL) & 1) != 0)
        {
          id v32 = v77;
          id v33 = [v77 unsignedLongLongValue];

          goto LABEL_21;
        }
      }

      else
      {
        sub_100023F4C((uint64_t)v80, &qword_100036048);
      }

      id v33 = 0LL;
LABEL_21:
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(&_swiftEmptyDictionarySingleton);
      v80[0] = &_swiftEmptyDictionarySingleton;
      sub_100015850((uint64_t)v33, 0x44496D616461LL, 0xE600000000000000LL, isUniquelyReferenced_nonNull_native);
      uint64_t v35 = v80[0];
      swift_bridgeObjectRelease(0x8000000000000000LL);
      id v36 = [v28 valueForProperty:v73];
      if (v36)
      {
        id v37 = v36;
        _bridgeAnyObjectToAny(_:)(&v78);
        swift_unknownObjectRelease(v37);
      }

      else
      {
        __int128 v78 = 0u;
        __int128 v79 = 0u;
      }

      sub_100024A88((uint64_t)&v78, (uint64_t)v80, &qword_100036048);
      if (v81)
      {
        uint64_t v38 = sub_10000A134(0LL, &qword_1000363A0, &OBJC_CLASS___NSNumber_ptr);
        if ((swift_dynamicCast(&v77, v80, (char *)&type metadata for Any + 8, v38, 6LL) & 1) != 0)
        {
          id v39 = v77;
          id v40 = [v77 unsignedLongLongValue];

          goto LABEL_29;
        }
      }

      else
      {
        sub_100023F4C((uint64_t)v80, &qword_100036048);
      }

      id v40 = 0LL;
LABEL_29:
      char v41 = swift_isUniquelyReferenced_nonNull_native(v35);
      v80[0] = v35;
      sub_100015850((uint64_t)v40, 0x74536C61746E6572LL, 0xEF656D6954747261LL, v41);
      uint64_t v42 = v80[0];
      swift_bridgeObjectRelease(0x8000000000000000LL);
      id v43 = [v28 valueForProperty:v72];
      if (v43)
      {
        id v44 = v43;
        _bridgeAnyObjectToAny(_:)(&v78);
        swift_unknownObjectRelease(v44);
      }

      else
      {
        __int128 v78 = 0u;
        __int128 v79 = 0u;
      }

      sub_100024A88((uint64_t)&v78, (uint64_t)v80, &qword_100036048);
      if (v81)
      {
        uint64_t v45 = sub_10000A134(0LL, &qword_1000363A0, &OBJC_CLASS___NSNumber_ptr);
        if ((swift_dynamicCast(&v77, v80, (char *)&type metadata for Any + 8, v45, 6LL) & 1) != 0)
        {
          id v46 = v77;
          id v47 = [v77 unsignedLongLongValue];

          goto LABEL_37;
        }
      }

      else
      {
        sub_100023F4C((uint64_t)v80, &qword_100036048);
      }

      id v47 = 0LL;
LABEL_37:
      char v48 = swift_isUniquelyReferenced_nonNull_native(v42);
      v80[0] = v42;
      sub_100015850((uint64_t)v47, 0x65506C61746E6572LL, 0xEC000000646F6972LL, v48);
      uint64_t v49 = v80[0];
      swift_bridgeObjectRelease(0x8000000000000000LL);
      id v50 = [v28 valueForProperty:v71];
      if (v50)
      {
        id v51 = v50;
        _bridgeAnyObjectToAny(_:)(&v78);
        swift_unknownObjectRelease(v51);
      }

      else
      {
        __int128 v78 = 0u;
        __int128 v79 = 0u;
      }

      sub_100024A88((uint64_t)&v78, (uint64_t)v80, &qword_100036048);
      if (v81)
      {
        uint64_t v52 = sub_10000A134(0LL, &qword_1000363A0, &OBJC_CLASS___NSNumber_ptr);
        if ((swift_dynamicCast(&v77, v80, (char *)&type metadata for Any + 8, v52, 6LL) & 1) != 0)
        {
          id v53 = v77;
          id v54 = [v77 unsignedLongLongValue];

          goto LABEL_45;
        }
      }

      else
      {
        sub_100023F4C((uint64_t)v80, &qword_100036048);
      }

      id v54 = 0LL;
LABEL_45:
      char v55 = swift_isUniquelyReferenced_nonNull_native(v49);
      v80[0] = v49;
      sub_100015850((uint64_t)v54, 0xD000000000000011LL, 0x8000000100029710LL, v55);
      uint64_t v56 = v80[0];
      swift_bridgeObjectRelease(0x8000000000000000LL);
      id v57 = [v28 valueForProperty:v70];
      if (v57)
      {
        id v58 = v57;
        _bridgeAnyObjectToAny(_:)(&v78);
        swift_unknownObjectRelease(v58);
      }

      else
      {
        __int128 v78 = 0u;
        __int128 v79 = 0u;
      }

      sub_100024A88((uint64_t)&v78, (uint64_t)v80, &qword_100036048);
      if (!v81)
      {
        sub_100023F4C((uint64_t)v80, &qword_100036048);
LABEL_52:
        id v61 = 0LL;
        goto LABEL_53;
      }

      uint64_t v59 = sub_10000A134(0LL, &qword_1000363A0, &OBJC_CLASS___NSNumber_ptr);
      id v60 = v77;
      id v61 = [v77 unsignedLongLongValue];

LABEL_53:
      char v62 = swift_isUniquelyReferenced_nonNull_native(v56);
      v80[0] = v56;
      sub_100015850((uint64_t)v61, 0x6B63616279616C70LL, 0xEE00646F69726550LL, v62);
      uint64_t v63 = v80[0];
      swift_bridgeObjectRelease(0x8000000000000000LL);
      if ((swift_isUniquelyReferenced_nonNull_native(v26) & 1) == 0) {
        unint64_t v26 = sub_100013B5C(0LL, *((void *)v26 + 2) + 1LL, 1, v26);
      }
      unint64_t v65 = *((void *)v26 + 2);
      unint64_t v64 = *((void *)v26 + 3);
      if (v65 >= v64 >> 1) {
        unint64_t v26 = sub_100013B5C((char *)(v64 > 1), v65 + 1, 1, v26);
      }
      ++v25;
      *((void *)v26 + 2) = v65 + 1;
      *(void *)&v26[8 * v65 + 32] = v63;

      uint64_t v23 = v76;
      if (v24 == v25)
      {

        swift_bridgeObjectRelease(v76);
        id v17 = v68;
        id v0 = v69;
        id v19 = v67;
        goto LABEL_67;
      }
    }
  }

  __break(1u);
}

uint64_t sub_100018650()
{
  return sub_10000DE7C(*(char **)(v0 + 16), *(uint64_t (**)(void, void))(v0 + 24), *(void *)(v0 + 32));
}

uint64_t sub_10001865C()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_10001867C(char a1)
{
  uint64_t v2 = type metadata accessor for EncodingError(0LL);
  swift_allocError(v2, &protocol witness table for EncodingError, 0LL, 0LL);
  uint64_t v4 = v3;
  sub_100008A20(&qword_100036440);
  *(void *)(v4 + 24) = &type metadata for Bool;
  *(_BYTE *)uint64_t v4 = a1;
  _StringGuts.grow(_:)(71LL);
  v5._countAndFlagsBits = 0xD00000000000001ALL;
  v5._object = (void *)0x8000000100029AF0LL;
  String.append(_:)(v5);
  v6._object = (void *)0x8000000100029B10LL;
  v6._countAndFlagsBits = 0xD000000000000018LL;
  String.append(_:)(v6);
  v7._countAndFlagsBits = 0xD00000000000002BLL;
  v7._object = (void *)0x8000000100029B30LL;
  String.append(_:)(v7);
  EncodingError.Context.init(codingPath:debugDescription:underlyingError:)( &_swiftEmptyArrayStorage,  0LL,  0xE000000000000000LL,  0LL);
  uint64_t v8 = (*(uint64_t (**)(uint64_t, void, uint64_t))(*(void *)(v2 - 8) + 104LL))( v4,  enum case for EncodingError.invalidValue(_:),  v2);
  return swift_willThrow(v8);
}

uint64_t sub_1000187BC@<X0>( uint64_t result@<X0>, uint64_t a2@<X1>, int a3@<W2>, uint64_t a4@<X8>, double a5@<D0>, double a6@<D1>, double a7@<D2>, double a8@<D3>, double a9@<D4>, double a10@<D5>, double a11@<D6>, double a12@<D7>, float a13)
{
  if (a5 <= -2147483650.0)
  {
    __break(1u);
    goto LABEL_27;
  }

  if (a5 >= 2147483650.0)
  {
LABEL_27:
    __break(1u);
    goto LABEL_28;
  }

  if (a6 <= -2147483650.0)
  {
LABEL_28:
    __break(1u);
    goto LABEL_29;
  }

  if (a6 >= 2147483650.0)
  {
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }

  if (a7 <= -2147483650.0)
  {
LABEL_30:
    __break(1u);
    goto LABEL_31;
  }

  if (a7 >= 2147483650.0)
  {
LABEL_31:
    __break(1u);
    goto LABEL_32;
  }

  if (a8 <= -2147483650.0)
  {
LABEL_32:
    __break(1u);
    goto LABEL_33;
  }

  if (a8 >= 2147483650.0)
  {
LABEL_33:
    __break(1u);
    goto LABEL_34;
  }

  if (a9 <= -2147483650.0)
  {
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }

  if (a9 >= 2147483650.0)
  {
LABEL_35:
    __break(1u);
    goto LABEL_36;
  }

  if (a10 <= -2147483650.0)
  {
LABEL_36:
    __break(1u);
    goto LABEL_37;
  }

  if (a10 >= 2147483650.0)
  {
LABEL_37:
    __break(1u);
    goto LABEL_38;
  }

  if (a11 <= -2147483650.0)
  {
LABEL_38:
    __break(1u);
    goto LABEL_39;
  }

  if (a11 >= 2147483650.0)
  {
LABEL_39:
    __break(1u);
LABEL_40:
    __break(1u);
    goto LABEL_41;
  }

  if ((*(void *)&a5 & 0x7FF0000000000000LL) == 0x7FF0000000000000LL
    || (*(void *)&a6 & 0x7FF0000000000000LL) == 0x7FF0000000000000LL
    || (*(void *)&a7 & 0x7FF0000000000000LL) == 0x7FF0000000000000LL
    || (*(void *)&a8 & 0x7FF0000000000000LL) == 0x7FF0000000000000LL
    || (*(void *)&a9 & 0x7FF0000000000000LL) == 0x7FF0000000000000LL
    || (*(void *)&a10 & 0x7FF0000000000000LL) == 0x7FF0000000000000LL
    || (*(void *)&a11 & 0x7FF0000000000000LL) == 0x7FF0000000000000LL
    || (*(void *)&a12 & 0x7FF0000000000000LL) == 0x7FF0000000000000LL)
  {
    goto LABEL_40;
  }

  if (a12 <= -2147483650.0)
  {
LABEL_41:
    __break(1u);
    goto LABEL_42;
  }

  if (a12 < 2147483650.0)
  {
    *(_BYTE *)a4 = result & 1;
    *(_DWORD *)(a4 + 4) = (int)a5;
    *(_DWORD *)(a4 + 8) = (int)a6;
    *(_DWORD *)(a4 + 12) = (int)a7;
    *(_DWORD *)(a4 + 16) = (int)a8;
    *(_DWORD *)(a4 + 20) = (int)a9;
    *(_DWORD *)(a4 + 24) = (int)a10;
    *(_DWORD *)(a4 + 28) = (int)a11;
    *(_DWORD *)(a4 + 32) = (int)a12;
    *(double *)(a4 + 40) = a13;
    *(void *)(a4 + 48) = a2;
    *(_DWORD *)(a4 + 56) = a3;
    return result;
  }

uint64_t sub_100018A00(char *a1, void (**a2)(void, void, void))
{
  uint64_t v4 = sub_100008A20(&qword_100035F00);
  __chkstk_darwin(v4);
  Swift::String v6 = (char *)&v34 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v7 = swift_allocObject(&unk_1000321A0, 24LL, 7LL);
  *(void *)(v7 + 16) = a2;
  v43[0] = 0LL;
  v43[1] = 0LL;
  char v44 = 1;
  v41[0] = 0LL;
  v41[1] = 0LL;
  char v42 = 1;
  v39[1] = 0LL;
  v39[0] = 0LL;
  char v40 = 1;
  v37[1] = 0LL;
  v37[0] = 0LL;
  char v38 = 1;
  int v35 = 0;
  uint64_t v8 = (os_unfair_lock_s *)&a1[OBJC_IVAR____TtC17TVUpNextExtension23TopShelfContentProvider_cachePolicyLock];
  char v36 = 1;
  swift_beginAccess(&a1[OBJC_IVAR____TtC17TVUpNextExtension23TopShelfContentProvider_cachePolicyLock], v45, 33LL, 0LL);
  _Block_copy(a2);
  os_unfair_lock_lock(v8);
  uint64_t v9 = *(id *)&a1[OBJC_IVAR____TtC17TVUpNextExtension23TopShelfContentProvider__cachePolicy];
  os_unfair_lock_unlock(v8);
  swift_endAccess(v45);
  char v10 = v9[OBJC_IVAR____TtC17TVUpNextExtensionP33_CEB3B327E539852F953463821CB150CF11CachePolicy_cacheIsValid];

  id v11 = sub_100016EB0();
  id v12 = [(id)objc_opt_self(WLKSystemPreferencesStore) sharedPreferences];
  LODWORD(v9) = [v12 upNextLockupsUseCoverArt];

  double v13 = sub_10000E164((uint64_t)v43, 0LL);
  double v15 = v14;
  double v16 = sub_10000E164((uint64_t)v41, 1LL);
  double v18 = v17;
  double v19 = sub_10000E164((uint64_t)v39, 2LL);
  double v21 = v20;
  double v22 = sub_10000E1EC((uint64_t)v37);
  double v24 = v23;
  float v25 = sub_10000E26C(&v35);
  sub_1000187BC((v10 & 1) == 0, (uint64_t)v11, (int)v9, (uint64_t)v45, v13, v15, v16, v18, v19, v21, v22, v24, v25);
  uint64_t v26 = *(void *)&a1[OBJC_IVAR____TtC17TVUpNextExtension23TopShelfContentProvider_objectGraph];
  if (v26)
  {
    uint64_t v27 = type metadata accessor for TaskPriority(0LL);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v27 - 8) + 56LL))(v6, 1LL, 1LL, v27);
    uint64_t v28 = swift_allocObject(&unk_1000321C8, 128LL, 7LL);
    __int128 v29 = v45[1];
    *(_OWORD *)(v28 + 40) = v45[0];
    *(void *)(v28 + 16) = 0LL;
    *(void *)(v28 + 24) = 0LL;
    *(void *)(v28 + 32) = a1;
    *(_OWORD *)(v28 + 56) = v29;
    *(_OWORD *)(v28 + 72) = v46[0];
    *(_OWORD *)(v28 + 84) = *(_OWORD *)((char *)v46 + 12);
    *(void *)(v28 + 104) = v26;
    *(void *)(v28 + 112) = sub_10002556C;
    *(void *)(v28 + 120) = v7;
    swift_retain(v26);
    id v30 = a1;
    swift_retain(v7);
    uint64_t v31 = sub_10000EB34((uint64_t)v6, (uint64_t)&unk_100036248, v28);
    swift_release(v7);
    uint64_t v32 = v31;
  }

  else
  {
    sub_100024000((uint64_t)v45);
    a2[2](a2, 0LL, 0LL);
    uint64_t v32 = v7;
  }

  return swift_release(v32);
}

uint64_t sub_100018D2C(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }

  else
  {
    if (v4 < 0)
    {
      uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize with negative count",  51LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1090LL,  0);
      goto LABEL_9;
    }

    unint64_t v6 = a4 + 16 * a1 + 32;
    unint64_t v7 = a3 + 16 * v4;
    if (v6 >= v7 || v6 + 16 * v4 <= a3)
    {
      sub_100008A20(&qword_100036378);
      swift_arrayInitWithCopy(a3);
      return v7;
    }
  }

  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize overlapping range",  49LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1092LL,  0);
LABEL_9:
  __break(1u);
  return result;
}

uint64_t sub_100018E34(unsigned __int8 *a1, void *a2)
{
  uint64_t v4 = swift_allocObject(&unk_100032128, 24LL, 7LL);
  *(void *)(v4 + 16) = a2;
  _Block_copy(a2);
  _s17TVUpNextExtension23TopShelfContentProviderC3logyySSFZ_0(0xD00000000000001ELL, 0x8000000100028CD0LL);
  uint64_t v5 = (void *)swift_allocObject(&unk_100032150, 40LL, 7LL);
  v5[2] = a1;
  v5[3] = sub_10002556C;
  void v5[4] = v4;
  int v6 = a1[OBJC_IVAR____TtC17TVUpNextExtension23TopShelfContentProvider_startupComplete];
  unint64_t v7 = a1;
  swift_retain(v4);
  if (v6 == 1)
  {
    _Block_copy(a2);
    uint64_t v8 = v7;
    swift_retain(v4);
    sub_100018A00(v8, (void (**)(void, void, void))a2);
    _Block_release(a2);
  }

  else
  {
    uint64_t v9 = v7;
    swift_retain(v4);
    _s17TVUpNextExtension23TopShelfContentProviderC3logyySSFZ_0(0xD00000000000001BLL, 0x8000000100028CF0LL);
    char v10 = &v9[OBJC_IVAR____TtC17TVUpNextExtension23TopShelfContentProvider_startupInvocations];
    swift_beginAccess( &v9[OBJC_IVAR____TtC17TVUpNextExtension23TopShelfContentProvider_startupInvocations],  v22,  1LL,  0LL);
    if (!*(void *)v10)
    {
      *(void *)char v10 = &_swiftEmptyArrayStorage;
      swift_bridgeObjectRelease(0LL);
    }

    id v12 = sub_10000ADC4((uint64_t)v21);
    if (*v11)
    {
      double v13 = v11;
      uint64_t v14 = swift_allocObject(&unk_100032178, 32LL, 7LL);
      *(void *)(v14 + 16) = sub_1000255C4;
      *(void *)(v14 + 24) = v5;
      double v15 = *v13;
      swift_retain(v5);
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(v15);
      *double v13 = v15;
      if ((isUniquelyReferenced_nonNull_native & 1) == 0)
      {
        double v15 = sub_100013824(0LL, *((void *)v15 + 2) + 1LL, 1, v15);
        *double v13 = v15;
      }

      unint64_t v18 = *((void *)v15 + 2);
      unint64_t v17 = *((void *)v15 + 3);
      if (v18 >= v17 >> 1)
      {
        double v15 = sub_100013824((char *)(v17 > 1), v18 + 1, 1, v15);
        *double v13 = v15;
      }

      *((void *)v15 + 2) = v18 + 1;
      double v19 = &v15[16 * v18];
      *((void *)v19 + 4) = sub_1000255E0;
      *((void *)v19 + 5) = v14;
    }

    ((void (*)(_BYTE *, void))v12)(v21, 0LL);
  }

  swift_release(v5);
  return swift_release_n(v4, 2LL);
}

uint64_t sub_100019090(uint64_t a1)
{
  uint64_t v123 = type metadata accessor for URL(0LL);
  uint64_t v124 = *(void *)(v123 - 8);
  uint64_t v2 = __chkstk_darwin(v123);
  v125 = (char *)v112 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)v112 - v4;
  uint64_t v6 = sub_100008A20(&qword_1000361C0);
  uint64_t v7 = __chkstk_darwin(v6);
  v122 = (char *)v112 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = __chkstk_darwin(v7);
  id v11 = (char *)v112 - v10;
  uint64_t v12 = __chkstk_darwin(v9);
  uint64_t v14 = (char *)v112 - v13;
  uint64_t v15 = __chkstk_darwin(v12);
  unint64_t v17 = (char *)v112 - v16;
  __chkstk_darwin(v15);
  double v19 = (char *)v112 - v18;
  uint64_t v20 = *(void *)a1;
  double v21 = *(void **)(a1 + 8);
  unint64_t v22 = (unint64_t)objc_allocWithZone(&OBJC_CLASS___TVTopShelfSectionedItem);
  swift_bridgeObjectRetain(v21);
  uint64_t v121 = v20;
  NSString v23 = String._bridgeToObjectiveC()();
  v120 = v21;
  swift_bridgeObjectRelease(v21);
  double v24 = (uint64_t *)[(id)v22 initWithIdentifier:v23];

  double v25 = *(double *)(a1 + 72);
  if ((~*(void *)&v25 & 0x7FF0000000000000LL) == 0) {
    goto LABEL_49;
  }
  if (v25 <= -9.22337204e18)
  {
LABEL_50:
    __break(1u);
    goto LABEL_51;
  }

  if (v25 >= 9.22337204e18)
  {
LABEL_51:
    __break(1u);
    goto LABEL_52;
  }

  [v24 setImageShape:(uint64_t)v25];
  uint64_t v27 = *(void *)(a1 + 16);
  uint64_t v26 = *(void **)(a1 + 24);
  double v24 = v24;
  uint64_t v119 = v27;
  v129 = v26;
  NSString v28 = String._bridgeToObjectiveC()();
  [v24 setTitle:v28];

  URL.init(string:)(*(void *)(a1 + 128), *(void *)(a1 + 136));
  uint64_t v29 = v124;
  uint64_t v30 = v123;
  v128 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v124 + 48);
  if (v128(v19, 1LL, v123) == 1)
  {
    uint64_t v32 = 0LL;
  }

  else
  {
    URL._bridgeToObjectiveC()(v31);
    uint64_t v32 = v33;
    (*(void (**)(char *, uint64_t))(v29 + 8))(v19, v30);
  }

  [v24 setImageURL:v32 forTraits:1];

  URL.init(string:)(*(void *)(a1 + 144), *(void *)(a1 + 152));
  if (v128(v17, 1LL, v30) == 1)
  {
    int v35 = 0LL;
  }

  else
  {
    URL._bridgeToObjectiveC()(v34);
    int v35 = v36;
    (*(void (**)(char *, uint64_t))(v124 + 8))(v17, v30);
  }

  [v24 setImageURL:v35 forTraits:2];

  [v24 _setAlwaysShowTitle:1];
  NSString v37 = String._bridgeToObjectiveC()();
  [v24 _setPlaybackTitle:v37];

  URL.init(string:)(*(void *)(a1 + 112), *(void *)(a1 + 120));
  if (v128(v14, 1LL, v30) == 1)
  {
    id v39 = 0LL;
    uint64_t v40 = v124;
  }

  else
  {
    URL._bridgeToObjectiveC()(v38);
    id v39 = v41;
    uint64_t v40 = v124;
    (*(void (**)(char *, uint64_t))(v124 + 8))(v14, v30);
  }

  uint64_t v42 = (uint64_t)v122;
  [v24 _setTopRightImageURL:v39];

  if (*(double *)(a1 + 64) <= 0.0)
  {
    NSString v43 = String._bridgeToObjectiveC()();
    [v24 _setPlaybackSubtitle:v43];
  }

  else
  {
    objc_msgSend(v24, "setPlaybackProgress:");
  }

  uint64_t v44 = *(void *)(a1 + 88);
  uint64_t v127 = *(void *)(a1 + 80);
  uint64_t v126 = v44;
  URL.init(string:)(v127, v44);
  if (v128(v11, 1LL, v30) == 1)
  {
    sub_100023F4C((uint64_t)v11, &qword_1000361C0);
  }

  else
  {
    (*(void (**)(char *, char *, uint64_t))(v40 + 32))(v5, v11, v30);
    v134[0] = 0LL;
    v134[1] = 0xE000000000000000LL;
    _StringGuts.grow(_:)(31LL);
    swift_bridgeObjectRelease(v134[1]);
    strcpy((char *)v134, "Action URL: ");
    BYTE5(v134[1]) = 0;
    HIWORD(v134[1]) = -5120;
    uint64_t v45 = sub_100024A00( &qword_100036368,  (uint64_t (*)(uint64_t))&type metadata accessor for URL,  (uint64_t)&protocol conformance descriptor for URL);
    v46._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter(v30, v45);
    object = v46._object;
    String.append(_:)(v46);
    swift_bridgeObjectRelease(object);
    v48._countAndFlagsBits = 0x65746920726F6620LL;
    v48._object = (void *)0xEA0000000000206DLL;
    String.append(_:)(v48);
    uint64_t v49 = v120;
    swift_bridgeObjectRetain(v120);
    v50._countAndFlagsBits = v121;
    v50._object = v49;
    String.append(_:)(v50);
    swift_bridgeObjectRelease(v49);
    v51._countAndFlagsBits = 2108704LL;
    v51._object = (void *)0xE300000000000000LL;
    String.append(_:)(v51);
    uint64_t v52 = v129;
    swift_bridgeObjectRetain(v129);
    v53._countAndFlagsBits = v119;
    v53._object = v52;
    String.append(_:)(v53);
    swift_bridgeObjectRelease(v52);
    uint64_t v54 = v134[1];
    _s17TVUpNextExtension23TopShelfContentProviderC3logyySSFZ_0(v134[0], v134[1]);
    swift_bridgeObjectRelease(v54);
    id v55 = objc_allocWithZone(&OBJC_CLASS___TVTopShelfAction);
    URL._bridgeToObjectiveC()(v56);
    id v58 = v57;
    id v59 = [v55 initWithURL:v57];

    [v24 setDisplayAction:v59];
    [v24 setPlayAction:v59];

    (*(void (**)(char *, uint64_t))(v40 + 8))(v5, v30);
  }

  unint64_t v22 = (unint64_t)&_swiftEmptyArrayStorage;
  unint64_t v136 = (unint64_t)&_swiftEmptyArrayStorage;
  sub_100024A88(a1 + 208, (uint64_t)v139, &qword_100036070);
  sub_100024A88((uint64_t)v139, (uint64_t)&v140, &qword_100036070);
  uint64_t v60 = v140;
  if (!v140
    || (sub_100024A88(a1 + 216, (uint64_t)v138, &qword_100036070),
        sub_100024A88((uint64_t)v138, (uint64_t)&v141, &qword_100036070),
        (uint64_t v119 = v141) == 0)
    || (sub_100024A88(a1 + 224, (uint64_t)v137, &qword_100036070),
        uint64_t result = sub_100024A88((uint64_t)v137, (uint64_t)&v142, &qword_100036070),
        (uint64_t v118 = v142) == 0))
  {
LABEL_43:
    if (!(v22 >> 62))
    {
      v105 = v24;
      uint64_t v106 = swift_bridgeObjectRetain(v22);
      dispatch thunk of __ContiguousArrayStorageBase.staticElementType.getter(v106);
      sub_10000A134(0LL, &qword_100036360, &OBJC_CLASS___TVTopShelfAction_ptr);
      uint64_t v107 = v22;
LABEL_45:
      swift_bridgeObjectRelease(v22);
      sub_10000A134(0LL, &qword_100036360, &OBJC_CLASS___TVTopShelfAction_ptr);
      Class isa = Array._bridgeToObjectiveC()().super.isa;
      swift_bridgeObjectRelease(v107);
      [v24 _setSecondaryActions:isa];

      return (uint64_t)v24;
    }

uint64_t sub_100019EBC(uint64_t a1)
{
  return a1;
}

unint64_t sub_100019EE4()
{
  unint64_t result = qword_100036698;
  if (!qword_100036698)
  {
    unint64_t result = swift_getWitnessTable(&unk_1000283F4, &type metadata for FetchUpNextContentIntent.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_100036698);
  }

  return result;
}

uint64_t sub_100019F28(uint64_t a1, unint64_t a2)
{
  if (a1 == 0x614365726F6E6769LL && a2 == 0xEB00000000656863LL)
  {
    unint64_t v5 = 0xEB00000000656863LL;
    goto LABEL_8;
  }

  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0x614365726F6E6769LL, 0xEB00000000656863LL, a1, a2, 0LL) & 1) != 0)
  {
    unint64_t v5 = a2;
LABEL_8:
    swift_bridgeObjectRelease(v5);
    return 0LL;
  }

  if (a1 == 0xD000000000000015LL)
  {
    unint64_t v7 = 0x8000000100028BA0LL;
    if (a2 == 0x8000000100028BA0LL) {
      goto LABEL_13;
    }
  }

  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0xD000000000000015LL, 0x8000000100028BA0LL, a1, a2, 0LL) & 1) != 0)
  {
    unint64_t v7 = a2;
LABEL_13:
    swift_bridgeObjectRelease(v7);
    return 1LL;
  }

  if (a1 == 0xD000000000000016LL)
  {
    unint64_t v8 = 0x8000000100028BC0LL;
    if (a2 == 0x8000000100028BC0LL) {
      goto LABEL_18;
    }
  }

  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0xD000000000000016LL, 0x8000000100028BC0LL, a1, a2, 0LL) & 1) != 0)
  {
    unint64_t v8 = a2;
LABEL_18:
    swift_bridgeObjectRelease(v8);
    return 2LL;
  }

  if (a1 == 0xD000000000000015LL)
  {
    unint64_t v9 = 0x8000000100028BE0LL;
    if (a2 == 0x8000000100028BE0LL) {
      goto LABEL_23;
    }
  }

  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0xD000000000000015LL, 0x8000000100028BE0LL, a1, a2, 0LL) & 1) != 0)
  {
    unint64_t v9 = a2;
LABEL_23:
    swift_bridgeObjectRelease(v9);
    return 3LL;
  }

  if (a1 == 0xD000000000000016LL)
  {
    unint64_t v10 = 0x8000000100028C00LL;
    if (a2 == 0x8000000100028C00LL) {
      goto LABEL_28;
    }
  }

  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0xD000000000000016LL, 0x8000000100028C00LL, a1, a2, 0LL) & 1) != 0)
  {
    unint64_t v10 = a2;
LABEL_28:
    swift_bridgeObjectRelease(v10);
    return 4LL;
  }

  if (a1 == 0xD000000000000013LL && a2 == 0x8000000100028C20LL)
  {
    unint64_t v11 = 0x8000000100028C20LL;
LABEL_34:
    swift_bridgeObjectRelease(v11);
    return 5LL;
  }

  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0xD000000000000013LL, 0x8000000100028C20LL, a1, a2, 0LL) & 1) != 0)
  {
    unint64_t v11 = a2;
    goto LABEL_34;
  }

  if (a1 == 0xD000000000000014LL && a2 == 0x8000000100028C40LL)
  {
    unint64_t v12 = 0x8000000100028C40LL;
LABEL_40:
    swift_bridgeObjectRelease(v12);
    return 6LL;
  }

  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0xD000000000000014LL, 0x8000000100028C40LL, a1, a2, 0LL) & 1) != 0)
  {
    unint64_t v12 = a2;
    goto LABEL_40;
  }

  if (a1 == 0x616D496567646162LL && a2 == 0xEF68746469576567LL)
  {
    unint64_t v13 = 0xEF68746469576567LL;
LABEL_46:
    swift_bridgeObjectRelease(v13);
    return 7LL;
  }

  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0x616D496567646162LL, 0xEF68746469576567LL, a1, a2, 0LL) & 1) != 0)
  {
    unint64_t v13 = a2;
    goto LABEL_46;
  }

  if (a1 == 0xD000000000000010LL && a2 == 0x8000000100028C60LL)
  {
    unint64_t v14 = 0x8000000100028C60LL;
LABEL_52:
    swift_bridgeObjectRelease(v14);
    return 8LL;
  }

  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0xD000000000000010LL, 0x8000000100028C60LL, a1, a2, 0LL) & 1) != 0)
  {
    unint64_t v14 = a2;
    goto LABEL_52;
  }

  if (a1 == 0x616D496567646162LL && a2 == 0xEF656C6163536567LL)
  {
    unint64_t v15 = 0xEF656C6163536567LL;
LABEL_58:
    swift_bridgeObjectRelease(v15);
    return 9LL;
  }

  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0x616D496567646162LL, 0xEF656C6163536567LL, a1, a2, 0LL) & 1) != 0)
  {
    unint64_t v15 = a2;
    goto LABEL_58;
  }

  if (a1 == 0xD000000000000015LL)
  {
    unint64_t v16 = 0x8000000100028C80LL;
    if (a2 == 0x8000000100028C80LL) {
      goto LABEL_63;
    }
  }

  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0xD000000000000015LL, 0x8000000100028C80LL, a1, a2, 0LL) & 1) != 0)
  {
    unint64_t v16 = a2;
LABEL_63:
    swift_bridgeObjectRelease(v16);
    return 10LL;
  }

  if (a1 == 0x5479616C70736964LL && a2 == 0xEB00000000657079LL)
  {
    swift_bridgeObjectRelease(0xEB00000000657079LL);
    return 11LL;
  }

  else
  {
    char v17 = _stringCompareWithSmolCheck(_:_:expecting:)(0x5479616C70736964LL, 0xEB00000000657079LL, a1, a2, 0LL);
    swift_bridgeObjectRelease(a2);
    if ((v17 & 1) != 0) {
      return 11LL;
    }
    else {
      return 12LL;
    }
  }

uint64_t sub_10001A3EC@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = sub_100008A20(&qword_100036358);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  unint64_t v8 = (char *)&v25 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = a1[3];
  uint64_t v10 = a1[4];
  sub_10000A0F0(a1, v9);
  unint64_t v11 = sub_100019EE4();
  dispatch thunk of Decoder.container<A>(keyedBy:)( &type metadata for FetchUpNextContentIntent.CodingKeys,  &type metadata for FetchUpNextContentIntent.CodingKeys,  v11,  v9,  v10);
  if (v2) {
    return sub_10000A114(a1);
  }
  LOBYTE(v34) = 0;
  char v12 = KeyedDecodingContainer.decode(_:forKey:)(&v34, v5);
  LOBYTE(v34) = 1;
  int v13 = KeyedDecodingContainer.decode(_:forKey:)(&v34, v5);
  LOBYTE(v34) = 2;
  int v32 = KeyedDecodingContainer.decode(_:forKey:)(&v34, v5);
  LOBYTE(v34) = 3;
  int v31 = KeyedDecodingContainer.decode(_:forKey:)(&v34, v5);
  LOBYTE(v34) = 4;
  int v30 = KeyedDecodingContainer.decode(_:forKey:)(&v34, v5);
  LOBYTE(v34) = 5;
  int v29 = KeyedDecodingContainer.decode(_:forKey:)(&v34, v5);
  LOBYTE(v34) = 6;
  int v28 = KeyedDecodingContainer.decode(_:forKey:)(&v34, v5);
  LOBYTE(v34) = 7;
  int v27 = KeyedDecodingContainer.decode(_:forKey:)(&v34, v5);
  LOBYTE(v34) = 8;
  int v26 = KeyedDecodingContainer.decode(_:forKey:)(&v34, v5);
  LOBYTE(v34) = 9;
  KeyedDecodingContainer.decode(_:forKey:)(&v34, v5);
  uint64_t v15 = v14;
  uint64_t v16 = sub_100008A20(&qword_100036050);
  char v33 = 10;
  uint64_t v17 = sub_100024838( &qword_100036318,  &qword_100036050,  (uint64_t)&protocol witness table for String,  (uint64_t)&protocol conformance descriptor for <A> [A]);
  KeyedDecodingContainer.decode<A>(_:forKey:)(&v34, v16, &v33, v5, v16, v17);
  uint64_t v18 = v34;
  LOBYTE(v34) = 11;
  uint64_t v25 = v18;
  swift_bridgeObjectRetain(v18);
  LODWORD(v16) = KeyedDecodingContainer.decode(_:forKey:)(&v34, v5);
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  sub_10000A114(a1);
  uint64_t v19 = v25;
  uint64_t result = swift_bridgeObjectRelease(v25);
  *(_BYTE *)a2 = v12 & 1;
  int v21 = v32;
  *(_DWORD *)(a2 + 4) = v13;
  *(_DWORD *)(a2 + 8) = v21;
  int v22 = v30;
  *(_DWORD *)(a2 + 12) = v31;
  *(_DWORD *)(a2 + 16) = v22;
  int v23 = v28;
  *(_DWORD *)(a2 + 20) = v29;
  *(_DWORD *)(a2 + 24) = v23;
  int v24 = v26;
  *(_DWORD *)(a2 + 28) = v27;
  *(_DWORD *)(a2 + 32) = v24;
  *(void *)(a2 + 40) = v15;
  *(void *)(a2 + 48) = v19;
  *(_DWORD *)(a2 + 56) = v16;
  return result;
}

unint64_t sub_10001A78C()
{
  unint64_t result = qword_1000366A0;
  if (!qword_1000366A0)
  {
    unint64_t result = swift_getWitnessTable(&unk_1000283A4, &type metadata for UpNextContent.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1000366A0);
  }

  return result;
}

uint64_t sub_10001A7D0(uint64_t a1, unint64_t a2)
{
  if (a1 == 0x6163696E6F6E6163LL && a2 == 0xEB0000000044496CLL)
  {
    unint64_t v5 = 0xEB0000000044496CLL;
    goto LABEL_8;
  }

  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0x6163696E6F6E6163LL, 0xEB0000000044496CLL, a1, a2, 0LL) & 1) != 0)
  {
    unint64_t v5 = a2;
LABEL_8:
    swift_bridgeObjectRelease(v5);
    return 0LL;
  }

  if (a1 == 0x656C746974LL && a2 == 0xE500000000000000LL)
  {
    unint64_t v7 = 0xE500000000000000LL;
LABEL_14:
    swift_bridgeObjectRelease(v7);
    return 1LL;
  }

  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0x656C746974LL, 0xE500000000000000LL, a1, a2, 0LL) & 1) != 0)
  {
    unint64_t v7 = a2;
    goto LABEL_14;
  }

  if (a1 == 0x747865746E6F63LL && a2 == 0xE700000000000000LL)
  {
    unint64_t v8 = 0xE700000000000000LL;
LABEL_20:
    swift_bridgeObjectRelease(v8);
    return 2LL;
  }

  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0x747865746E6F63LL, 0xE700000000000000LL, a1, a2, 0LL) & 1) != 0)
  {
    unint64_t v8 = a2;
    goto LABEL_20;
  }

  if (a1 == 0x656C746974627573LL && a2 == 0xE800000000000000LL)
  {
    unint64_t v9 = 0xE800000000000000LL;
LABEL_26:
    swift_bridgeObjectRelease(v9);
    return 3LL;
  }

  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0x656C746974627573LL, 0xE800000000000000LL, a1, a2, 0LL) & 1) != 0)
  {
    unint64_t v9 = a2;
    goto LABEL_26;
  }

  if (a1 == 0xD000000000000012LL)
  {
    unint64_t v10 = 0x8000000100029090LL;
    if (a2 == 0x8000000100029090LL) {
      goto LABEL_31;
    }
  }

  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0xD000000000000012LL, 0x8000000100029090LL, a1, a2, 0LL) & 1) != 0)
  {
    unint64_t v10 = a2;
LABEL_31:
    swift_bridgeObjectRelease(v10);
    return 4LL;
  }

  if (a1 == 0x6168536567616D69LL && a2 == 0xEA00000000006570LL)
  {
    unint64_t v11 = 0xEA00000000006570LL;
LABEL_37:
    swift_bridgeObjectRelease(v11);
    return 5LL;
  }

  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0x6168536567616D69LL, 0xEA00000000006570LL, a1, a2, 0LL) & 1) != 0)
  {
    unint64_t v11 = a2;
    goto LABEL_37;
  }

  if (a1 == 0x52556E6F69746361LL && a2 == 0xE90000000000004CLL)
  {
    unint64_t v12 = 0xE90000000000004CLL;
LABEL_43:
    swift_bridgeObjectRelease(v12);
    return 6LL;
  }

  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0x52556E6F69746361LL, 0xE90000000000004CLL, a1, a2, 0LL) & 1) != 0)
  {
    unint64_t v12 = a2;
    goto LABEL_43;
  }

  if (a1 == 0xD000000000000010LL && a2 == 0x80000001000290B0LL)
  {
    unint64_t v13 = 0x80000001000290B0LL;
LABEL_49:
    swift_bridgeObjectRelease(v13);
    return 7LL;
  }

  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0xD000000000000010LL, 0x80000001000290B0LL, a1, a2, 0LL) & 1) != 0)
  {
    unint64_t v13 = a2;
    goto LABEL_49;
  }

  if (a1 == 0x616D496567646162LL && a2 == 0xED00004C52556567LL)
  {
    unint64_t v14 = 0xED00004C52556567LL;
LABEL_55:
    swift_bridgeObjectRelease(v14);
    return 8LL;
  }

  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0x616D496567646162LL, 0xED00004C52556567LL, a1, a2, 0LL) & 1) != 0)
  {
    unint64_t v14 = a2;
    goto LABEL_55;
  }

  if (a1 == 0x4C52556567616D69LL && a2 == 0xEA00000000007831LL)
  {
    unint64_t v15 = 0xEA00000000007831LL;
LABEL_61:
    swift_bridgeObjectRelease(v15);
    return 9LL;
  }

  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0x4C52556567616D69LL, 0xEA00000000007831LL, a1, a2, 0LL) & 1) != 0)
  {
    unint64_t v15 = a2;
    goto LABEL_61;
  }

  if (a1 == 0x4C52556567616D69LL && a2 == 0xEA00000000007832LL)
  {
    unint64_t v16 = 0xEA00000000007832LL;
LABEL_67:
    swift_bridgeObjectRelease(v16);
    return 10LL;
  }

  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0x4C52556567616D69LL, 0xEA00000000007832LL, a1, a2, 0LL) & 1) != 0)
  {
    unint64_t v16 = a2;
    goto LABEL_67;
  }

  if (a1 == 7107189 && a2 == 0xE300000000000000LL)
  {
    unint64_t v17 = 0xE300000000000000LL;
LABEL_73:
    swift_bridgeObjectRelease(v17);
    return 11LL;
  }

  if ((_stringCompareWithSmolCheck(_:_:expecting:)(7107189LL, 0xE300000000000000LL, a1, a2, 0LL) & 1) != 0)
  {
    unint64_t v17 = a2;
    goto LABEL_73;
  }

  if (a1 == 0x6C7255776F6873LL && a2 == 0xE700000000000000LL)
  {
    unint64_t v18 = 0xE700000000000000LL;
LABEL_79:
    swift_bridgeObjectRelease(v18);
    return 12LL;
  }

  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0x6C7255776F6873LL, 0xE700000000000000LL, a1, a2, 0LL) & 1) != 0)
  {
    unint64_t v18 = a2;
    goto LABEL_79;
  }

  if (a1 == 0x6449776F6873LL && a2 == 0xE600000000000000LL)
  {
    unint64_t v19 = 0xE600000000000000LL;
LABEL_85:
    swift_bridgeObjectRelease(v19);
    return 13LL;
  }

  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0x6449776F6873LL, 0xE600000000000000LL, a1, a2, 0LL) & 1) != 0)
  {
    unint64_t v19 = a2;
    goto LABEL_85;
  }

  if (a1 == 0xD000000000000012LL)
  {
    unint64_t v20 = 0x80000001000290D0LL;
    if (a2 == 0x80000001000290D0LL) {
      goto LABEL_90;
    }
  }

  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0xD000000000000012LL, 0x80000001000290D0LL, a1, a2, 0LL) & 1) != 0)
  {
    unint64_t v20 = a2;
LABEL_90:
    swift_bridgeObjectRelease(v20);
    return 14LL;
  }

  if (a1 == 0xD000000000000015LL && a2 == 0x80000001000290F0LL)
  {
    unint64_t v21 = 0x80000001000290F0LL;
LABEL_96:
    swift_bridgeObjectRelease(v21);
    return 15LL;
  }

  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0xD000000000000015LL, 0x80000001000290F0LL, a1, a2, 0LL) & 1) != 0)
  {
    unint64_t v21 = a2;
    goto LABEL_96;
  }

  if (a1 == 0xD000000000000019LL && a2 == 0x8000000100029110LL)
  {
    swift_bridgeObjectRelease(0x8000000100029110LL);
    return 16LL;
  }

  else
  {
    char v22 = _stringCompareWithSmolCheck(_:_:expecting:)(0xD000000000000019LL, 0x8000000100029110LL, a1, a2, 0LL);
    swift_bridgeObjectRelease(a2);
    if ((v22 & 1) != 0) {
      return 16LL;
    }
    else {
      return 17LL;
    }
  }

void *sub_10001AE9C@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v87 = sub_100008A20(&qword_100036350);
  uint64_t v5 = *(void *)(v87 - 8);
  __chkstk_darwin(v87);
  unint64_t v7 = (char *)&v59 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v8 = a1[3];
  uint64_t v9 = a1[4];
  sub_10000A0F0(a1, v8);
  unint64_t v10 = sub_10001A78C();
  dispatch thunk of Decoder.container<A>(keyedBy:)( &type metadata for UpNextContent.CodingKeys,  &type metadata for UpNextContent.CodingKeys,  v10,  v8,  v9);
  if (v2)
  {
    uint64_t v88 = 0LL;
    sub_10000A114(a1);
    swift_bridgeObjectRelease(0LL);
    swift_bridgeObjectRelease(v88);
    swift_bridgeObjectRelease(0LL);
    swift_bridgeObjectRelease(0LL);
    swift_bridgeObjectRelease(0LL);
    return (void *)swift_bridgeObjectRelease(0LL);
  }

  else
  {
    uint64_t v86 = v5;
    LOBYTE(v104[0]) = 0;
    uint64_t v11 = v87;
    uint64_t v12 = KeyedDecodingContainer.decode(_:forKey:)(v104, v87);
    uint64_t v14 = v13;
    LOBYTE(v104[0]) = 1;
    swift_bridgeObjectRetain(v13);
    uint64_t v77 = KeyedDecodingContainer.decode(_:forKey:)(v104, v11);
    uint64_t v78 = v12;
    LOBYTE(v104[0]) = 2;
    uint64_t v16 = v15;
    swift_bridgeObjectRetain(v15);
    uint64_t v17 = KeyedDecodingContainer.decode(_:forKey:)(v104, v11);
    uint64_t v85 = v16;
    uint64_t v76 = v17;
    LOBYTE(v104[0]) = 3;
    uint64_t v19 = v18;
    swift_bridgeObjectRetain(v18);
    uint64_t v20 = KeyedDecodingContainer.decode(_:forKey:)(v104, v11);
    uint64_t v84 = v19;
    uint64_t v75 = v20;
    LOBYTE(v104[0]) = 4;
    uint64_t v22 = v21;
    swift_bridgeObjectRetain(v21);
    KeyedDecodingContainer.decode(_:forKey:)(v104, v11);
    uint64_t v83 = v22;
    uint64_t v24 = v23;
    LOBYTE(v104[0]) = 5;
    KeyedDecodingContainer.decode(_:forKey:)(v104, v11);
    uint64_t v26 = v25;
    LOBYTE(v104[0]) = 6;
    uint64_t v74 = KeyedDecodingContainer.decode(_:forKey:)(v104, v11);
    LOBYTE(v104[0]) = 7;
    uint64_t v28 = v27;
    swift_bridgeObjectRetain(v27);
    uint64_t v29 = KeyedDecodingContainer.decode(_:forKey:)(v104, v11);
    uint64_t v82 = v28;
    uint64_t v73 = v29;
    LOBYTE(v104[0]) = 8;
    uint64_t v31 = v30;
    swift_bridgeObjectRetain(v30);
    uint64_t v72 = KeyedDecodingContainer.decode(_:forKey:)(v104, v11);
    uint64_t v81 = v31;
    uint64_t v32 = v14;
    uint64_t v71 = a1;
    LOBYTE(v104[0]) = 9;
    uint64_t v80 = v33;
    swift_bridgeObjectRetain(v33);
    uint64_t v34 = KeyedDecodingContainer.decode(_:forKey:)(v104, v11);
    uint64_t v70 = v35;
    uint64_t v36 = v34;
    LOBYTE(v104[0]) = 10;
    swift_bridgeObjectRetain(v35);
    uint64_t v69 = KeyedDecodingContainer.decode(_:forKey:)(v104, v87);
    uint64_t v79 = v37;
    LOBYTE(v104[0]) = 11;
    swift_bridgeObjectRetain(v37);
    uint64_t v68 = KeyedDecodingContainer.decodeIfPresent(_:forKey:)(v104, v87);
    uint64_t v88 = v38;
    LOBYTE(v104[0]) = 12;
    swift_bridgeObjectRetain(v38);
    uint64_t v65 = KeyedDecodingContainer.decodeIfPresent(_:forKey:)(v104, v87);
    uint64_t v67 = v39;
    LOBYTE(v104[0]) = 13;
    swift_bridgeObjectRetain(v39);
    uint64_t v64 = KeyedDecodingContainer.decodeIfPresent(_:forKey:)(v104, v87);
    uint64_t v66 = v40;
    uint64_t v41 = sub_100008A20(&qword_100036050);
    LOBYTE(v89) = 14;
    uint64_t v42 = sub_100024838( &qword_100036318,  &qword_100036050,  (uint64_t)&protocol witness table for String,  (uint64_t)&protocol conformance descriptor for <A> [A]);
    swift_bridgeObjectRetain(v66);
    uint64_t v62 = v42;
    uint64_t v63 = v41;
    KeyedDecodingContainer.decodeIfPresent<A>(_:forKey:)(v104, v41, &v89, v87, v41, v42);
    uint64_t v43 = v104[0];
    LOBYTE(v89) = 15;
    swift_bridgeObjectRetain(v104[0]);
    KeyedDecodingContainer.decodeIfPresent<A>(_:forKey:)(v104, v63, &v89, v87, v63, v62);
    uint64_t v44 = v104[0];
    v105[0] = 16;
    swift_bridgeObjectRetain(v104[0]);
    KeyedDecodingContainer.decodeIfPresent<A>(_:forKey:)(&v106, v63, v105, v87, v63, v62);
    (*(void (**)(char *, uint64_t))(v86 + 8))(v7, v87);
    uint64_t v45 = v106;
    swift_bridgeObjectRetain(v106);
    swift_bridgeObjectRelease(0LL);
    *(void *)&__int128 v89 = v78;
    *((void *)&v89 + 1) = v32;
    uint64_t v61 = v32;
    uint64_t v47 = v84;
    uint64_t v46 = v85;
    *(void *)&__int128 v90 = v77;
    *((void *)&v90 + 1) = v85;
    *(void *)&__int128 v91 = v76;
    *((void *)&v91 + 1) = v84;
    *(void *)&__int128 v92 = v75;
    *((void *)&v92 + 1) = v83;
    *(void *)&__int128 v93 = v24;
    *((void *)&v93 + 1) = v26;
    *(void *)&__int128 v94 = v74;
    *((void *)&v94 + 1) = v82;
    *(void *)&__int128 v95 = v73;
    *((void *)&v95 + 1) = v81;
    *(void *)&__int128 v96 = v72;
    *((void *)&v96 + 1) = v80;
    uint64_t v60 = v36;
    *(void *)&__int128 v97 = v36;
    *((void *)&v97 + 1) = v70;
    *(void *)&__int128 v98 = v69;
    *((void *)&v98 + 1) = v79;
    *(void *)&__int128 v99 = v68;
    *((void *)&v99 + 1) = v88;
    uint64_t v48 = v66;
    *(void *)&__int128 v100 = v65;
    *((void *)&v100 + 1) = v67;
    *(void *)&__int128 v101 = v64;
    *((void *)&v101 + 1) = v66;
    *(void *)&__int128 v102 = v43;
    *((void *)&v102 + 1) = v44;
    uint64_t v103 = v45;
    sub_1000240F0(&v89);
    swift_bridgeObjectRelease(v61);
    swift_bridgeObjectRelease(v46);
    swift_bridgeObjectRelease(v47);
    swift_bridgeObjectRelease(v83);
    swift_bridgeObjectRelease(v82);
    swift_bridgeObjectRelease(v81);
    swift_bridgeObjectRelease(v80);
    swift_bridgeObjectRelease(v70);
    swift_bridgeObjectRelease(v79);
    uint64_t v49 = v88;
    swift_bridgeObjectRelease(v88);
    uint64_t v50 = v67;
    swift_bridgeObjectRelease(v67);
    swift_bridgeObjectRelease(v48);
    swift_bridgeObjectRelease(v43);
    swift_bridgeObjectRelease(v44);
    swift_bridgeObjectRelease(v45);
    sub_10000A114(v71);
    v104[0] = v78;
    v104[1] = v61;
    v104[2] = v77;
    v104[3] = v85;
    v104[4] = v76;
    v104[5] = v84;
    v104[6] = v75;
    v104[7] = v83;
    v104[8] = v24;
    v104[9] = v26;
    v104[10] = v74;
    v104[11] = v82;
    v104[12] = v73;
    v104[13] = v81;
    v104[14] = v72;
    v104[15] = v80;
    v104[16] = v60;
    v104[17] = v70;
    v104[18] = v69;
    v104[19] = v79;
    v104[20] = v68;
    v104[21] = v49;
    v104[22] = v65;
    v104[23] = v50;
    v104[24] = v64;
    v104[25] = v48;
    v104[26] = v43;
    v104[27] = v44;
    v104[28] = v45;
    unint64_t result = sub_1000241F0(v104);
    __int128 v52 = v102;
    *(_OWORD *)(a2 + 192) = v101;
    *(_OWORD *)(a2 + 208) = v52;
    *(void *)(a2 + 224) = v103;
    __int128 v53 = v98;
    *(_OWORD *)(a2 + 128) = v97;
    *(_OWORD *)(a2 + 144) = v53;
    __int128 v54 = v100;
    *(_OWORD *)(a2 + 160) = v99;
    *(_OWORD *)(a2 + 176) = v54;
    __int128 v55 = v94;
    *(_OWORD *)(a2 + 64) = v93;
    *(_OWORD *)(a2 + 80) = v55;
    __int128 v56 = v96;
    *(_OWORD *)(a2 + 96) = v95;
    *(_OWORD *)(a2 + 112) = v56;
    __int128 v57 = v90;
    *(_OWORD *)a2 = v89;
    *(_OWORD *)(a2 + 16) = v57;
    __int128 v58 = v92;
    *(_OWORD *)(a2 + 32) = v91;
    *(_OWORD *)(a2 + 48) = v58;
  }

  return result;
}

unint64_t sub_10001BC40()
{
  unint64_t result = qword_1000366A8;
  if (!qword_1000366A8)
  {
    unint64_t result = swift_getWitnessTable(&unk_100028354, &type metadata for UpNextReturnType.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1000366A8);
  }

  return result;
}

unint64_t sub_10001BC84()
{
  unint64_t result = qword_100036090;
  if (!qword_100036090)
  {
    unint64_t result = swift_getWitnessTable(&unk_100027A34, &type metadata for UpNextContent);
    atomic_store(result, (unint64_t *)&qword_100036090);
  }

  return result;
}

unint64_t sub_10001BCC8()
{
  unint64_t result = qword_100036098;
  if (!qword_100036098)
  {
    unint64_t result = swift_getWitnessTable(&unk_10002790C, &type metadata for CachePolicyRelay);
    atomic_store(result, (unint64_t *)&qword_100036098);
  }

  return result;
}

uint64_t sub_10001BD0C(void *a1)
{
  uint64_t v3 = sub_100008A20(&qword_100036338);
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)&v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v7 = a1[3];
  uint64_t v8 = a1[4];
  sub_10000A0F0(a1, v7);
  unint64_t v9 = sub_10001BC40();
  dispatch thunk of Decoder.container<A>(keyedBy:)( &type metadata for UpNextReturnType.CodingKeys,  &type metadata for UpNextReturnType.CodingKeys,  v9,  v7,  v8);
  if (v1)
  {
    sub_10000A114(a1);
  }

  else
  {
    uint64_t v10 = sub_100008A20(&qword_100036080);
    char v16 = 0;
    uint64_t v11 = sub_100020D94( &qword_100036340,  &qword_100036080,  (void (*)(void))sub_1000249BC,  (uint64_t)&protocol conformance descriptor for <A> [A]);
    KeyedDecodingContainer.decode<A>(_:forKey:)(&v15, v10, &v16, v3, v10, v11);
    uint64_t v7 = v15;
    char v16 = 1;
    unint64_t v13 = sub_1000247F4();
    swift_bridgeObjectRetain(v7);
    KeyedDecodingContainer.decode<A>(_:forKey:)( &v15,  &type metadata for CachePolicyRelay,  &v16,  v3,  &type metadata for CachePolicyRelay,  v13);
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
    sub_10000A114(a1);
    swift_bridgeObjectRelease(v7);
  }

  return v7;
}

uint64_t sub_10001BF38()
{
  return sub_100010C3C(*(char **)(v0 + 16), *(uint64_t (**)(void, void))(v0 + 24), *(void *)(v0 + 32));
}

unint64_t sub_10001BF44()
{
  unint64_t result = qword_1000366B0;
  if (!qword_1000366B0)
  {
    unint64_t result = swift_getWitnessTable(&unk_100028304, &type metadata for FetchFeaturedContentIntent.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1000366B0);
  }

  return result;
}

uint64_t sub_10001BF88(char *a1, void (**a2)(void, void, void))
{
  uint64_t v4 = sub_100008A20(&qword_100035F00);
  __chkstk_darwin(v4);
  uint64_t v6 = &v21[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL) - 8];
  uint64_t v7 = swift_allocObject(&unk_1000320B0, 24LL, 7LL);
  *(void *)(v7 + 16) = a2;
  uint64_t v8 = (os_unfair_lock_s *)&a1[OBJC_IVAR____TtC17TVUpNextExtension23TopShelfContentProvider_cachePolicyLock];
  swift_beginAccess(&a1[OBJC_IVAR____TtC17TVUpNextExtension23TopShelfContentProvider_cachePolicyLock], v21, 33LL, 0LL);
  _Block_copy(a2);
  os_unfair_lock_lock(v8);
  unint64_t v9 = *(id *)&a1[OBJC_IVAR____TtC17TVUpNextExtension23TopShelfContentProvider__cachePolicy];
  os_unfair_lock_unlock(v8);
  swift_endAccess(v21);
  char v10 = v9[OBJC_IVAR____TtC17TVUpNextExtensionP33_CEB3B327E539852F953463821CB150CF11CachePolicy_cacheIsValid];

  id v11 = sub_100016EB0();
  id v12 = v11;
  uint64_t v13 = *(void *)&a1[OBJC_IVAR____TtC17TVUpNextExtension23TopShelfContentProvider_objectGraph];
  if (v13)
  {
    uint64_t v14 = type metadata accessor for TaskPriority(0LL);
    (*(void (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56LL))(v6, 1LL, 1LL, v14);
    uint64_t v15 = swift_allocObject(&unk_1000320D8, 80LL, 7LL);
    *(void *)(v15 + 16) = 0LL;
    *(void *)(v15 + 24) = 0LL;
    *(void *)(v15 + 32) = a1;
    *(_BYTE *)(v15 + 40) = v10 ^ 1;
    *(void *)(v15 + 48) = v12;
    *(void *)(v15 + 56) = v13;
    *(void *)(v15 + 64) = sub_10002556C;
    *(void *)(v15 + 72) = v7;
    swift_retain(v13);
    char v16 = a1;
    swift_retain(v7);
    uint64_t v17 = sub_10000EB34((uint64_t)v6, (uint64_t)&unk_100036198, v15);
    swift_release(v7);
    uint64_t v18 = v17;
  }

  else
  {
    swift_bridgeObjectRelease(v11);
    a2[2](a2, 0LL, 0LL);
    uint64_t v18 = v7;
  }

  return swift_release(v18);
}

uint64_t sub_10001C154(unsigned __int8 *a1, void *a2)
{
  uint64_t v4 = swift_allocObject(&unk_100032038, 24LL, 7LL);
  *(void *)(v4 + 16) = a2;
  _Block_copy(a2);
  _s17TVUpNextExtension23TopShelfContentProviderC3logyySSFZ_0(0xD00000000000001FLL, 0x8000000100028D10LL);
  uint64_t v5 = (void *)swift_allocObject(&unk_100032060, 40LL, 7LL);
  v5[2] = a1;
  v5[3] = sub_1000238D4;
  void v5[4] = v4;
  int v6 = a1[OBJC_IVAR____TtC17TVUpNextExtension23TopShelfContentProvider_startupComplete];
  uint64_t v7 = a1;
  swift_retain(v4);
  if (v6 == 1)
  {
    _Block_copy(a2);
    uint64_t v8 = v7;
    swift_retain(v4);
    sub_10001BF88(v8, (void (**)(void, void, void))a2);
    _Block_release(a2);
  }

  else
  {
    unint64_t v9 = v7;
    swift_retain(v4);
    _s17TVUpNextExtension23TopShelfContentProviderC3logyySSFZ_0(0xD00000000000001BLL, 0x8000000100028CF0LL);
    char v10 = &v9[OBJC_IVAR____TtC17TVUpNextExtension23TopShelfContentProvider_startupInvocations];
    swift_beginAccess( &v9[OBJC_IVAR____TtC17TVUpNextExtension23TopShelfContentProvider_startupInvocations],  v22,  1LL,  0LL);
    if (!*(void *)v10)
    {
      *(void *)char v10 = &_swiftEmptyArrayStorage;
      swift_bridgeObjectRelease(0LL);
    }

    id v12 = sub_10000ADC4((uint64_t)v21);
    if (*v11)
    {
      uint64_t v13 = v11;
      uint64_t v14 = swift_allocObject(&unk_100032088, 32LL, 7LL);
      *(void *)(v14 + 16) = sub_1000255C0;
      *(void *)(v14 + 24) = v5;
      uint64_t v15 = *v13;
      swift_retain(v5);
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(v15);
      *uint64_t v13 = v15;
      if ((isUniquelyReferenced_nonNull_native & 1) == 0)
      {
        uint64_t v15 = sub_100013824(0LL, *((void *)v15 + 2) + 1LL, 1, v15);
        *uint64_t v13 = v15;
      }

      unint64_t v18 = *((void *)v15 + 2);
      unint64_t v17 = *((void *)v15 + 3);
      if (v18 >= v17 >> 1)
      {
        uint64_t v15 = sub_100013824((char *)(v17 > 1), v18 + 1, 1, v15);
        *uint64_t v13 = v15;
      }

      *((void *)v15 + 2) = v18 + 1;
      uint64_t v19 = &v15[16 * v18];
      *((void *)v19 + 4) = sub_1000255E0;
      *((void *)v19 + 5) = v14;
    }

    ((void (*)(_BYTE *, void))v12)(v21, 0LL);
  }

  swift_release(v5);
  return swift_release_n(v4, 2LL);
}

id sub_10001C3B0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(@"TVUNFeaturedItemCustomActionTypeSubscription");
  if (v4 == a1 && v5 == a2)
  {
    swift_bridgeObjectRelease(a2);
    goto LABEL_13;
  }

  uint64_t v7 = v5;
  char v8 = _stringCompareWithSmolCheck(_:_:expecting:)(a1, a2, v4, v5, 0LL);
  swift_bridgeObjectRelease(v7);
  if ((v8 & 1) != 0)
  {
LABEL_13:
    uint64_t v14 = &OBJC_CLASS___TVTopShelfCustomAction;
    goto LABEL_14;
  }

  uint64_t v9 = static String._unconditionallyBridgeFromObjectiveC(_:)(@"TVUNFeaturedItemCustomActionTypeUpNext");
  if (v9 == a1 && v10 == a2)
  {
    swift_bridgeObjectRelease(a2);
    goto LABEL_17;
  }

  uint64_t v12 = v10;
  char v13 = _stringCompareWithSmolCheck(_:_:expecting:)(a1, a2, v9, v10, 0LL);
  swift_bridgeObjectRelease(v12);
  if ((v13 & 1) != 0)
  {
LABEL_17:
    id v21 = objc_allocWithZone(&OBJC_CLASS___TVTopShelfCustomAction);
    URL._bridgeToObjectiveC()(v22);
    uint64_t v24 = v23;
    id v19 = [v21 initWithURL:v23];

    [v19 setShowsActivityIndicatorWhilePerforming:0];
    return v19;
  }

  uint64_t v14 = (objc_class *)&OBJC_CLASS___TVTopShelfAction;
LABEL_14:
  id v15 = objc_allocWithZone(v14);
  URL._bridgeToObjectiveC()(v16);
  unint64_t v18 = v17;
  id v19 = [v15 initWithURL:v17];

  return v19;
}

id sub_10001C514(double *a1)
{
  uint64_t v2 = type metadata accessor for URL(0LL);
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = __chkstk_darwin(v2);
  v184 = (char *)&v184 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v6 = __chkstk_darwin(v4);
  v187 = (char *)&v184 - v7;
  uint64_t v8 = __chkstk_darwin(v6);
  v185 = (char *)&v184 - v9;
  __chkstk_darwin(v8);
  v196 = (char *)&v184 - v10;
  unint64_t v189 = type metadata accessor for Date(0LL);
  uint64_t v188 = *(void *)(v189 - 8);
  __chkstk_darwin(v189);
  uint64_t v12 = (char *)&v184 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v13 = sub_100008A20(&qword_1000361C0);
  uint64_t v14 = __chkstk_darwin(v13);
  v186 = (char *)&v184 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v16 = __chkstk_darwin(v14);
  v193 = (char *)&v184 - v17;
  uint64_t v18 = __chkstk_darwin(v16);
  v191 = (char *)&v184 - v19;
  uint64_t v20 = __chkstk_darwin(v18);
  v197 = (unsigned int (*)(uint64_t, uint64_t, uint64_t))((char *)&v184 - v21);
  uint64_t v22 = __chkstk_darwin(v20);
  v195 = (char *)&v184 - v23;
  uint64_t v24 = __chkstk_darwin(v22);
  uint64_t v26 = (char *)&v184 - v25;
  __chkstk_darwin(v24);
  uint64_t v28 = (char *)&v184 - v27;
  double v30 = *a1;
  uint64_t v29 = *((void *)a1 + 1);
  id v31 = objc_allocWithZone(&OBJC_CLASS___TVTopShelfCarouselItem);
  swift_bridgeObjectRetain(v29);
  double v190 = v30;
  NSString v32 = String._bridgeToObjectiveC()();
  uint64_t v192 = v29;
  swift_bridgeObjectRelease(v29);
  id v33 = [v31 initWithIdentifier:v32];

  id v34 = v33;
  NSString v35 = String._bridgeToObjectiveC()();
  [v34 setTitle:v35];

  NSString v36 = String._bridgeToObjectiveC()();
  [v34 setGenre:v36];

  NSString v37 = String._bridgeToObjectiveC()();
  [v34 setSummary:v37];

  URL.init(string:)(*((void *)a1 + 16), *((void *)a1 + 17));
  uint64_t v198 = v3;
  uint64_t v38 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v3 + 48);
  uint64_t v40 = 0LL;
  if (v38(v28, 1LL, v2) != 1)
  {
    URL._bridgeToObjectiveC()(v39);
    uint64_t v40 = v41;
    (*(void (**)(char *, uint64_t))(v198 + 8))(v28, v2);
  }

  [v34 setPreviewVideoURL:v40];

  Date.init(timeIntervalSince1970:)( [v34 setDuration:(double)*((uint64_t *)a1 + 25)],  (double)*((uint64_t *)a1 + 28));
  Class isa = Date._bridgeToObjectiveC()().super.isa;
  (*(void (**)(char *, unint64_t))(v188 + 8))(v12, v189);
  [v34 setCreationDate:isa];

  [v34 setMediaOptions:*((void *)a1 + 24)];
  URL.init(string:)(*((void *)a1 + 12), *((void *)a1 + 13));
  uint64_t v44 = v2;
  if (v38(v26, 1LL, v2) == 1)
  {
    uint64_t v45 = 0LL;
    uint64_t v46 = v198;
  }

  else
  {
    URL._bridgeToObjectiveC()(v43);
    uint64_t v45 = v47;
    uint64_t v46 = v198;
    (*(void (**)(char *, uint64_t))(v198 + 8))(v26, v44);
  }

  uint64_t v48 = (uint64_t)v197;
  uint64_t v49 = v195;
  [v34 setImageURL:v45 forTraits:1];

  URL.init(string:)(*((void *)a1 + 14), *((void *)a1 + 15));
  if (v38(v49, 1LL, v44) == 1)
  {
    Swift::String v51 = 0LL;
  }

  else
  {
    URL._bridgeToObjectiveC()(v50);
    Swift::String v51 = v52;
    (*(void (**)(char *, uint64_t))(v46 + 8))(v49, v44);
  }

  [v34 setImageURL:v51 forTraits:2];

  v195 = (char *)sub_10000A134(0LL, &qword_1000361C8, &OBJC_CLASS___TVTopShelfNamedAttribute_ptr);
  Class v53 = Array._bridgeToObjectiveC()().super.isa;
  [v34 setNamedAttributes:v53];

  NSString v54 = String._bridgeToObjectiveC()();
  [v34 _setITunesContentRating:v54];

  unint64_t v189 = sub_10000C0B4((uint64_t)&_swiftEmptyArrayStorage);
  URL.init(string:)(*((void *)a1 + 32), *((void *)a1 + 33));
  v197 = (unsigned int (*)(uint64_t, uint64_t, uint64_t))v38;
  unsigned int v55 = v38((char *)v48, 1LL, v44);
  __int128 v56 = &off_100035000;
  uint64_t v194 = v44;
  if (v55 == 1)
  {
    sub_100023F4C(v48, &qword_1000361C0);
    uint64_t v57 = (uint64_t)v191;
    unint64_t v58 = v189;
  }

  else
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v46 + 32))(v196, v48, v44);
    unint64_t v59 = sub_10000C0B4((uint64_t)&_swiftEmptyArrayStorage);
    *(void *)&__int128 v201 = static String._unconditionallyBridgeFromObjectiveC(_:)(@"TVUNFeaturedItemUserInfoKeyCanonicalID");
    *((void *)&v201 + 1) = v60;
    AnyHashable.init<A>(_:)(&v201, &type metadata for String, &protocol witness table for String);
    v202 = &type metadata for String;
    uint64_t v61 = v192;
    *(double *)&__int128 v201 = v190;
    *((void *)&v201 + 1) = v192;
    sub_1000169EC(&v201, v200);
    swift_bridgeObjectRetain(v61);
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(v59);
    v206[0] = v59;
    sub_1000159A0(v200, (uint64_t)&v203, isUniquelyReferenced_nonNull_native);
    uint64_t v63 = v206[0];
    swift_bridgeObjectRelease(0x8000000000000000LL);
    sub_1000169FC((uint64_t)&v203);
    *(void *)&__int128 v201 = static String._unconditionallyBridgeFromObjectiveC(_:)(@"TVUNFeaturedItemUserInfoKeyCustomAction");
    *((void *)&v201 + 1) = v64;
    AnyHashable.init<A>(_:)(&v201, &type metadata for String, &protocol witness table for String);
    uint64_t v65 = *((void *)a1 + 38);
    uint64_t v66 = *((void *)a1 + 39);
    v202 = &type metadata for String;
    *(void *)&__int128 v201 = v65;
    *((void *)&v201 + 1) = v66;
    sub_1000169EC(&v201, v200);
    swift_bridgeObjectRetain(v66);
    char v67 = swift_isUniquelyReferenced_nonNull_native(v63);
    v206[0] = v63;
    sub_1000159A0(v200, (uint64_t)&v203, v67);
    uint64_t v68 = v206[0];
    swift_bridgeObjectRelease(0x8000000000000000LL);
    sub_1000169FC((uint64_t)&v203);
    *(void *)&__int128 v201 = static String._unconditionallyBridgeFromObjectiveC(_:)(@"TVUNFeaturedItemUserInfoKeyPunchoutURL");
    *((void *)&v201 + 1) = v69;
    AnyHashable.init<A>(_:)(&v201, &type metadata for String, &protocol witness table for String);
    uint64_t v70 = *((void *)a1 + 34);
    uint64_t v71 = *((void *)a1 + 35);
    v202 = &type metadata for String;
    *(void *)&__int128 v201 = v70;
    *((void *)&v201 + 1) = v71;
    sub_1000169EC(&v201, v200);
    swift_bridgeObjectRetain(v71);
    char v72 = swift_isUniquelyReferenced_nonNull_native(v68);
    v206[0] = v68;
    sub_1000159A0(v200, (uint64_t)&v203, v72);
    uint64_t v73 = v206[0];
    swift_bridgeObjectRelease(0x8000000000000000LL);
    sub_1000169FC((uint64_t)&v203);
    *(void *)&__int128 v201 = static String._unconditionallyBridgeFromObjectiveC(_:)(@"TVUNFeaturedItemUserInfoKeyBuyParams");
    *((void *)&v201 + 1) = v74;
    AnyHashable.init<A>(_:)(&v201, &type metadata for String, &protocol witness table for String);
    uint64_t v75 = *((void *)a1 + 43);
    uint64_t v76 = *((void *)a1 + 44);
    v202 = &type metadata for String;
    *(void *)&__int128 v201 = v75;
    *((void *)&v201 + 1) = v76;
    sub_1000169EC(&v201, v200);
    swift_bridgeObjectRetain(v76);
    char v77 = swift_isUniquelyReferenced_nonNull_native(v73);
    v206[0] = v73;
    sub_1000159A0(v200, (uint64_t)&v203, v77);
    uint64_t v78 = v206[0];
    swift_bridgeObjectRelease(0x8000000000000000LL);
    sub_1000169FC((uint64_t)&v203);
    *(void *)&__int128 v201 = 0x447363697274656DLL;
    *((void *)&v201 + 1) = 0xEB00000000617461LL;
    AnyHashable.init<A>(_:)(&v201, &type metadata for String, &protocol witness table for String);
    uint64_t v79 = sub_100016C14(*((void *)a1 + 42));
    v202 = (void *)sub_100008A20(&qword_1000361D8);
    *(void *)&__int128 v201 = v79;
    sub_1000169EC(&v201, v200);
    char v80 = swift_isUniquelyReferenced_nonNull_native(v78);
    v206[0] = v78;
    sub_1000159A0(v200, (uint64_t)&v203, v80);
    uint64_t v81 = v206[0];
    swift_bridgeObjectRelease(0x8000000000000000LL);
    sub_1000169FC((uint64_t)&v203);
    uint64_t v82 = v66;
    __int128 v56 = &off_100035000;
    id v83 = sub_10001C3B0(v65, v82);
    NSString v84 = String._bridgeToObjectiveC()();
    [v83 _setImageName:v84];

    NSString v85 = String._bridgeToObjectiveC()();
    [v83 _setTitle:v85];

    swift_bridgeObjectRetain(v81);
    Class v86 = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v81);
    [v83 _setUserInfo:v86];

    id v87 = v34;
    [v87 setPlayAction:v83];

    sub_100024A88((uint64_t)(a1 + 45), (uint64_t)v205, &qword_1000361E8);
    sub_100024A88((uint64_t)v205, (uint64_t)v206, &qword_1000361E8);
    if (v206[1]) {
      NSString v88 = String._bridgeToObjectiveC()();
    }
    else {
      NSString v88 = 0LL;
    }
    uint64_t v57 = (uint64_t)v191;
    unint64_t v89 = v189;
    [v87 _setTermsAndConditionsText:v88];

    *(void *)&__int128 v201 = 0x7972616D697250LL;
    *((void *)&v201 + 1) = 0xE700000000000000LL;
    AnyHashable.init<A>(_:)(&v201, &type metadata for String, &protocol witness table for String);
    v202 = (void *)sub_100008A20(&qword_1000361E0);
    *(void *)&__int128 v201 = v81;
    sub_1000169EC(&v201, v200);
    char v90 = swift_isUniquelyReferenced_nonNull_native(v89);
    unint64_t v199 = v89;
    sub_1000159A0(v200, (uint64_t)&v203, v90);
    unint64_t v58 = v199;
    swift_bridgeObjectRelease(0x8000000000000000LL);
    sub_1000169FC((uint64_t)&v203);

    uint64_t v46 = v198;
    uint64_t v44 = v194;
    (*(void (**)(char *, uint64_t))(v198 + 8))(v196, v194);
  }

  URL.init(string:)(*((void *)a1 + 47), *((void *)a1 + 48));
  if (v197(v57, 1LL, v44) == 1)
  {
    sub_100023F4C(v57, &qword_1000361C0);
  }

  else
  {
    __int128 v91 = v185;
    (*(void (**)(char *, uint64_t, uint64_t))(v46 + 32))(v185, v57, v44);
    unint64_t v92 = sub_10000C0B4((uint64_t)&_swiftEmptyArrayStorage);
    *(void *)&__int128 v201 = static String._unconditionallyBridgeFromObjectiveC(_:)(@"TVUNFeaturedItemUserInfoKeyCanonicalID");
    *((void *)&v201 + 1) = v93;
    AnyHashable.init<A>(_:)(&v201, &type metadata for String, &protocol witness table for String);
    v202 = &type metadata for String;
    uint64_t v94 = v192;
    *(double *)&__int128 v201 = v190;
    *((void *)&v201 + 1) = v192;
    sub_1000169EC(&v201, v200);
    swift_bridgeObjectRetain(v94);
    char v95 = swift_isUniquelyReferenced_nonNull_native(v92);
    unint64_t v199 = v92;
    sub_1000159A0(v200, (uint64_t)&v203, v95);
    unint64_t v96 = v199;
    swift_bridgeObjectRelease(0x8000000000000000LL);
    sub_1000169FC((uint64_t)&v203);
    *(void *)&__int128 v201 = static String._unconditionallyBridgeFromObjectiveC(_:)(@"TVUNFeaturedItemUserInfoKeyCustomAction");
    *((void *)&v201 + 1) = v97;
    AnyHashable.init<A>(_:)(&v201, &type metadata for String, &protocol witness table for String);
    uint64_t v98 = *((void *)a1 + 53);
    uint64_t v99 = *((void *)a1 + 54);
    v202 = &type metadata for String;
    *(void *)&__int128 v201 = v98;
    *((void *)&v201 + 1) = v99;
    sub_1000169EC(&v201, v200);
    swift_bridgeObjectRetain(v99);
    char v100 = swift_isUniquelyReferenced_nonNull_native(v96);
    unint64_t v199 = v96;
    sub_1000159A0(v200, (uint64_t)&v203, v100);
    unint64_t v101 = v199;
    swift_bridgeObjectRelease(0x8000000000000000LL);
    sub_1000169FC((uint64_t)&v203);
    *(void *)&__int128 v201 = static String._unconditionallyBridgeFromObjectiveC(_:)(@"TVUNFeaturedItemUserInfoKeyPunchoutURL");
    *((void *)&v201 + 1) = v102;
    AnyHashable.init<A>(_:)(&v201, &type metadata for String, &protocol witness table for String);
    uint64_t v103 = *((void *)a1 + 49);
    uint64_t v104 = *((void *)a1 + 50);
    v202 = &type metadata for String;
    *(void *)&__int128 v201 = v103;
    *((void *)&v201 + 1) = v104;
    sub_1000169EC(&v201, v200);
    swift_bridgeObjectRetain(v104);
    char v105 = swift_isUniquelyReferenced_nonNull_native(v101);
    unint64_t v199 = v101;
    sub_1000159A0(v200, (uint64_t)&v203, v105);
    unint64_t v106 = v199;
    swift_bridgeObjectRelease(0x8000000000000000LL);
    sub_1000169FC((uint64_t)&v203);
    *(void *)&__int128 v201 = static String._unconditionallyBridgeFromObjectiveC(_:)(@"TVUNFeaturedItemUserInfoKeyBuyParams");
    *((void *)&v201 + 1) = v107;
    AnyHashable.init<A>(_:)(&v201, &type metadata for String, &protocol witness table for String);
    uint64_t v108 = *((void *)a1 + 58);
    uint64_t v109 = *((void *)a1 + 59);
    v202 = &type metadata for String;
    *(void *)&__int128 v201 = v108;
    *((void *)&v201 + 1) = v109;
    sub_1000169EC(&v201, v200);
    swift_bridgeObjectRetain(v109);
    char v110 = swift_isUniquelyReferenced_nonNull_native(v106);
    unint64_t v199 = v106;
    sub_1000159A0(v200, (uint64_t)&v203, v110);
    unint64_t v111 = v199;
    swift_bridgeObjectRelease(0x8000000000000000LL);
    sub_1000169FC((uint64_t)&v203);
    *(void *)&__int128 v201 = 0x447363697274656DLL;
    *((void *)&v201 + 1) = 0xEB00000000617461LL;
    AnyHashable.init<A>(_:)(&v201, &type metadata for String, &protocol witness table for String);
    v112 = sub_100016C14(*((void *)a1 + 57));
    v202 = (void *)sub_100008A20(&qword_1000361D8);
    *(void *)&__int128 v201 = v112;
    sub_1000169EC(&v201, v200);
    char v113 = swift_isUniquelyReferenced_nonNull_native(v111);
    unint64_t v199 = v111;
    sub_1000159A0(v200, (uint64_t)&v203, v113);
    unint64_t v114 = v199;
    swift_bridgeObjectRelease(0x8000000000000000LL);
    sub_1000169FC((uint64_t)&v203);
    id v115 = sub_10001C3B0(v98, v99);
    uint64_t v46 = v198;
    NSString v116 = String._bridgeToObjectiveC()();
    [v115 _setImageName:v116];

    NSString v117 = String._bridgeToObjectiveC()();
    [v115 _setTitle:v117];

    swift_bridgeObjectRetain(v114);
    Class v118 = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v114);
    [v115 _setUserInfo:v118];

    *(void *)&__int128 v201 = 0x7261646E6F636553LL;
    *((void *)&v201 + 1) = 0xE900000000000079LL;
    AnyHashable.init<A>(_:)(&v201, &type metadata for String, &protocol witness table for String);
    v202 = (void *)sub_100008A20(&qword_1000361E0);
    *(void *)&__int128 v201 = v114;
    sub_1000169EC(&v201, v200);
    char v119 = swift_isUniquelyReferenced_nonNull_native(v58);
    unint64_t v199 = v58;
    sub_1000159A0(v200, (uint64_t)&v203, v119);
    unint64_t v58 = v199;
    swift_bridgeObjectRelease(0x8000000000000000LL);
    sub_1000169FC((uint64_t)&v203);
    id v120 = v34;
    [v120 setDisplayAction:v115];

    uint64_t v44 = v194;
    uint64_t v121 = v91;
    __int128 v56 = &off_100035000;
    (*(void (**)(char *, uint64_t))(v46 + 8))(v121, v194);
  }

  id v122 = v34;
  Class v123 = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v58);
  objc_msgSend(v122, v56[12], v123);

  uint64_t v203 = 0LL;
  unint64_t v204 = 0xE000000000000000LL;
  _StringGuts.grow(_:)(24LL);
  swift_bridgeObjectRelease(v204);
  uint64_t v203 = 0xD000000000000016LL;
  unint64_t v204 = 0x8000000100029440LL;
  id v124 = [v122 _userInfo];
  if (v124)
  {
    v125 = v124;
    uint64_t v126 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)( v124,  &type metadata for AnyHashable,  (char *)&type metadata for Any + 8,  &protocol witness table for AnyHashable);
  }

  else
  {
    uint64_t v126 = 0LL;
  }

  *(void *)&__int128 v201 = v126;
  uint64_t v127 = sub_100008A20(&qword_1000361D0);
  v128._countAndFlagsBits = String.init<A>(describing:)(&v201, v127);
  object = v128._object;
  String.append(_:)(v128);
  swift_bridgeObjectRelease(object);
  unint64_t v130 = v204;
  _s17TVUpNextExtension23TopShelfContentProviderC3logyySSFZ_0(v203, v204);
  swift_bridgeObjectRelease(v130);
  uint64_t v131 = (uint64_t)v193;
  URL.init(string:)(*((void *)a1 + 8), *((void *)a1 + 9));
  __int128 v132 = v197;
  if (v197(v131, 1LL, v44) == 1) {
    goto LABEL_24;
  }
  v133 = *(void (**)(char *, uint64_t, uint64_t))(v46 + 32);
  v134 = v187;
  v133(v187, v131, v44);
  uint64_t v131 = (uint64_t)v186;
  URL.init(string:)(*((void *)a1 + 10), *((void *)a1 + 11));
  if (v132(v131, 1LL, v44) == 1)
  {
    (*(void (**)(char *, uint64_t))(v46 + 8))(v134, v44);
LABEL_24:
    sub_100023F4C(v131, &qword_1000361C0);
    goto LABEL_26;
  }

  unint64_t v135 = v184;
  v133(v184, v131, v44);
  id v136 = objc_allocWithZone(&OBJC_CLASS___TVTopShelfImageRequest);
  URL._bridgeToObjectiveC()(v137);
  v139 = v138;
  id v140 = [v136 initWithURL:v138];

  id v141 = objc_allocWithZone(&OBJC_CLASS___TVTopShelfImageRequest);
  URL._bridgeToObjectiveC()(v142);
  v144 = v143;
  id v145 = [v141 initWithURL:v143];

  id v146 = [objc_allocWithZone(TVTopShelfImageRequestStorage) init];
  [v146 setImageRequest:v140 forTraits:1];
  [v146 setImageRequest:v145 forTraits:2];
  [v122 _setTitleImageStorage:v146];

  v147 = *(void (**)(char *, uint64_t))(v198 + 8);
  v147(v135, v44);
  v147(v134, v44);
LABEL_26:
  uint64_t v148 = *((void *)a1 + 20);
  if (*(void *)(v148 + 16))
  {
    uint64_t v149 = *((void *)a1 + 19);
    id v150 = objc_allocWithZone(&OBJC_CLASS___TVTopShelfNamedAttribute);
    swift_bridgeObjectRetain(v149);
    swift_bridgeObjectRetain(v148);
    NSString v151 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v149);
    Class v152 = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v148);
    id v153 = [v150 initWithName:v151 values:v152];

    id v154 = v153;
    id v155 = [v122 namedAttributes];
    uint64_t v156 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v155, v195);

    uint64_t v203 = v156;
    specialized Array._makeUniqueAndReserveCapacityIfNotUnique()(v157);
    unint64_t v159 = *(void *)((v203 & 0xFFFFFFFFFFFFFF8LL) + 0x10);
    unint64_t v158 = *(void *)((v203 & 0xFFFFFFFFFFFFFF8LL) + 0x18);
    if (v159 >= v158 >> 1) {
      specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v158 > 1, v159 + 1, 1LL);
    }
    uint64_t v160 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v159, v154);
    specialized Array._endMutation()(v160);
    uint64_t v161 = v203;
    Class v162 = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v161);
    [v122 setNamedAttributes:v162];
  }

  uint64_t v163 = *((void *)a1 + 23);
  if (*(void *)(v163 + 16))
  {
    uint64_t v164 = *((void *)a1 + 22);
    id v165 = objc_allocWithZone(&OBJC_CLASS___TVTopShelfNamedAttribute);
    swift_bridgeObjectRetain(v164);
    swift_bridgeObjectRetain(v163);
    NSString v166 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v164);
    Class v167 = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v163);
    id v168 = [v165 initWithName:v166 values:v167];

    id v169 = v168;
    id v170 = [v122 namedAttributes];
    uint64_t v171 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v170, v195);

    uint64_t v203 = v171;
    specialized Array._makeUniqueAndReserveCapacityIfNotUnique()(v172);
    unint64_t v174 = *(void *)((v203 & 0xFFFFFFFFFFFFFF8LL) + 0x10);
    unint64_t v173 = *(void *)((v203 & 0xFFFFFFFFFFFFFF8LL) + 0x18);
    if (v174 >= v173 >> 1) {
      specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v173 > 1, v174 + 1, 1LL);
    }
    uint64_t v175 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v174, v169);
    specialized Array._endMutation()(v175);
    uint64_t v176 = v203;
    Class v177 = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v176);
    [v122 setNamedAttributes:v177];
  }

  uint64_t v178 = *((unsigned int *)a1 + 58);
  if ((v178 & 0x80000000) == 0)
  {
    double v179 = a1[30];
    if (v179 >= 0.0)
    {
      id v180 = [objc_allocWithZone(TVTopShelfRottenTomatoesRating) initWithFreshnessType:v178 freshnessRating:v179];
      [v122 _setRottenTomatoesRating:v180];
    }
  }

  uint64_t v181 = *((void *)a1 + 31);
  if ((v181 & 0x8000000000000000LL) == 0)
  {
    id v182 = [objc_allocWithZone(NSNumber) initWithInteger:v181];
    [v122 _setCommonSenseRecommendedAge:v182];
  }

  return v122;
}

uint64_t sub_10001DA0C(uint64_t a1, unint64_t a2)
{
  if (a1 == 0x614365726F6E6769LL && a2 == 0xEB00000000656863LL)
  {
    unint64_t v5 = 0xEB00000000656863LL;
    goto LABEL_8;
  }

  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0x614365726F6E6769LL, 0xEB00000000656863LL, a1, a2, 0LL) & 1) != 0)
  {
    unint64_t v5 = a2;
LABEL_8:
    swift_bridgeObjectRelease(v5);
    return 0LL;
  }

  if (a1 == 0xD000000000000015LL && a2 == 0x8000000100028C80LL)
  {
    swift_bridgeObjectRelease(0x8000000100028C80LL);
    return 1LL;
  }

  else
  {
    char v7 = _stringCompareWithSmolCheck(_:_:expecting:)(0xD000000000000015LL, 0x8000000100028C80LL, a1, a2, 0LL);
    swift_bridgeObjectRelease(a2);
    if ((v7 & 1) != 0) {
      return 1LL;
    }
    else {
      return 2LL;
    }
  }

uint64_t sub_10001DB10(void *a1)
{
  uint64_t v3 = sub_100008A20(&qword_100036328);
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)&v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v7 = a1[3];
  uint64_t v8 = a1[4];
  sub_10000A0F0(a1, v7);
  unint64_t v9 = sub_10001BF44();
  dispatch thunk of Decoder.container<A>(keyedBy:)( &type metadata for FetchFeaturedContentIntent.CodingKeys,  &type metadata for FetchFeaturedContentIntent.CodingKeys,  v9,  v7,  v8);
  if (!v1)
  {
    char v16 = 0;
    LOBYTE(v7) = KeyedDecodingContainer.decode(_:forKey:)(&v16, v3);
    uint64_t v10 = sub_100008A20(&qword_100036050);
    char v14 = 1;
    uint64_t v11 = sub_100024838( &qword_100036318,  &qword_100036050,  (uint64_t)&protocol witness table for String,  (uint64_t)&protocol conformance descriptor for <A> [A]);
    KeyedDecodingContainer.decode<A>(_:forKey:)(&v15, v10, &v14, v3, v10, v11);
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  }

  sub_10000A114(a1);
  return v7 & 1;
}

unint64_t sub_10001DCA4()
{
  unint64_t result = qword_1000366B8;
  if (!qword_1000366B8)
  {
    unint64_t result = swift_getWitnessTable(&unk_1000282B4, &type metadata for FeaturedContent.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1000366B8);
  }

  return result;
}

uint64_t sub_10001DCE8(uint64_t a1, unint64_t a2)
{
  if (a1 == 0x6163696E6F6E6163LL && a2 == 0xEB0000000044496CLL)
  {
    unint64_t v5 = 0xEB0000000044496CLL;
    goto LABEL_8;
  }

  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0x6163696E6F6E6163LL, 0xEB0000000044496CLL, a1, a2, 0LL) & 1) != 0)
  {
    unint64_t v5 = a2;
LABEL_8:
    swift_bridgeObjectRelease(v5);
    return 0LL;
  }

  if (a1 == 0x656C746974LL && a2 == 0xE500000000000000LL)
  {
    unint64_t v7 = 0xE500000000000000LL;
LABEL_14:
    swift_bridgeObjectRelease(v7);
    return 1LL;
  }

  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0x656C746974LL, 0xE500000000000000LL, a1, a2, 0LL) & 1) != 0)
  {
    unint64_t v7 = a2;
    goto LABEL_14;
  }

  if (a1 == 0x7972616D6D7573LL && a2 == 0xE700000000000000LL)
  {
    unint64_t v8 = 0xE700000000000000LL;
LABEL_20:
    swift_bridgeObjectRelease(v8);
    return 2LL;
  }

  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0x7972616D6D7573LL, 0xE700000000000000LL, a1, a2, 0LL) & 1) != 0)
  {
    unint64_t v8 = a2;
    goto LABEL_20;
  }

  if (a1 == 0x65726E6567LL && a2 == 0xE500000000000000LL)
  {
    unint64_t v9 = 0xE500000000000000LL;
LABEL_26:
    swift_bridgeObjectRelease(v9);
    return 3LL;
  }

  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0x65726E6567LL, 0xE500000000000000LL, a1, a2, 0LL) & 1) != 0)
  {
    unint64_t v9 = a2;
    goto LABEL_26;
  }

  if (a1 == 0x616D49656C746974LL && a2 == 0xEF78314C52556567LL)
  {
    unint64_t v10 = 0xEF78314C52556567LL;
LABEL_32:
    swift_bridgeObjectRelease(v10);
    return 4LL;
  }

  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0x616D49656C746974LL, 0xEF78314C52556567LL, a1, a2, 0LL) & 1) != 0)
  {
    unint64_t v10 = a2;
    goto LABEL_32;
  }

  if (a1 == 0x616D49656C746974LL && a2 == 0xEF78324C52556567LL)
  {
    unint64_t v11 = 0xEF78324C52556567LL;
LABEL_38:
    swift_bridgeObjectRelease(v11);
    return 5LL;
  }

  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0x616D49656C746974LL, 0xEF78324C52556567LL, a1, a2, 0LL) & 1) != 0)
  {
    unint64_t v11 = a2;
    goto LABEL_38;
  }

  if (a1 == 0xD000000000000014LL)
  {
    unint64_t v12 = 0x8000000100029150LL;
    if (a2 == 0x8000000100029150LL) {
      goto LABEL_43;
    }
  }

  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0xD000000000000014LL, 0x8000000100029150LL, a1, a2, 0LL) & 1) != 0)
  {
    unint64_t v12 = a2;
LABEL_43:
    swift_bridgeObjectRelease(v12);
    return 6LL;
  }

  if (a1 == 0xD000000000000014LL)
  {
    unint64_t v13 = 0x8000000100029170LL;
    if (a2 == 0x8000000100029170LL) {
      goto LABEL_48;
    }
  }

  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0xD000000000000014LL, 0x8000000100029170LL, a1, a2, 0LL) & 1) != 0)
  {
    unint64_t v13 = a2;
LABEL_48:
    swift_bridgeObjectRelease(v13);
    return 7LL;
  }

  if (a1 == 0x5677656976657270LL && a2 == 0xEF4C52556F656469LL)
  {
    unint64_t v14 = 0xEF4C52556F656469LL;
LABEL_54:
    swift_bridgeObjectRelease(v14);
    return 8LL;
  }

  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0x5677656976657270LL, 0xEF4C52556F656469LL, a1, a2, 0LL) & 1) != 0)
  {
    unint64_t v14 = a2;
    goto LABEL_54;
  }

  if (a1 == 0x6C74695474736163LL && a2 == 0xE900000000000065LL)
  {
    unint64_t v15 = 0xE900000000000065LL;
LABEL_60:
    swift_bridgeObjectRelease(v15);
    return 9LL;
  }

  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0x6C74695474736163LL, 0xE900000000000065LL, a1, a2, 0LL) & 1) != 0)
  {
    unint64_t v15 = a2;
    goto LABEL_60;
  }

  if (a1 == 1953718627 && a2 == 0xE400000000000000LL)
  {
    unint64_t v16 = 0xE400000000000000LL;
LABEL_66:
    swift_bridgeObjectRelease(v16);
    return 10LL;
  }

  if ((_stringCompareWithSmolCheck(_:_:expecting:)(1953718627LL, 0xE400000000000000LL, a1, a2, 0LL) & 1) != 0)
  {
    unint64_t v16 = a2;
    goto LABEL_66;
  }

  if (a1 == 0x726F746365726964LL && a2 == 0xEE00656C74695473LL)
  {
    unint64_t v17 = 0xEE00656C74695473LL;
LABEL_72:
    swift_bridgeObjectRelease(v17);
    return 11LL;
  }

  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0x726F746365726964LL, 0xEE00656C74695473LL, a1, a2, 0LL) & 1) != 0)
  {
    unint64_t v17 = a2;
    goto LABEL_72;
  }

  if (a1 == 0x726F746365726964LL && a2 == 0xE900000000000073LL)
  {
    unint64_t v18 = 0xE900000000000073LL;
LABEL_78:
    swift_bridgeObjectRelease(v18);
    return 12LL;
  }

  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0x726F746365726964LL, 0xE900000000000073LL, a1, a2, 0LL) & 1) != 0)
  {
    unint64_t v18 = a2;
    goto LABEL_78;
  }

  if (a1 == 0x74704F616964656DLL && a2 == 0xEC000000736E6F69LL)
  {
    unint64_t v19 = 0xEC000000736E6F69LL;
LABEL_84:
    swift_bridgeObjectRelease(v19);
    return 13LL;
  }

  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0x74704F616964656DLL, 0xEC000000736E6F69LL, a1, a2, 0LL) & 1) != 0)
  {
    unint64_t v19 = a2;
    goto LABEL_84;
  }

  if (a1 == 0x6E6F697461727564LL && a2 == 0xE800000000000000LL)
  {
    unint64_t v20 = 0xE800000000000000LL;
LABEL_90:
    swift_bridgeObjectRelease(v20);
    return 14LL;
  }

  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0x6E6F697461727564LL, 0xE800000000000000LL, a1, a2, 0LL) & 1) != 0)
  {
    unint64_t v20 = a2;
    goto LABEL_90;
  }

  if (a1 == 0xD000000000000013LL)
  {
    unint64_t v21 = 0x8000000100029190LL;
    if (a2 == 0x8000000100029190LL) {
      goto LABEL_95;
    }
  }

  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0xD000000000000013LL, 0x8000000100029190LL, a1, a2, 0LL) & 1) != 0)
  {
    unint64_t v21 = a2;
LABEL_95:
    swift_bridgeObjectRelease(v21);
    return 15LL;
  }

  if (a1 == 0x44657361656C6572LL && a2 == 0xEB00000000657461LL)
  {
    unint64_t v22 = 0xEB00000000657461LL;
LABEL_101:
    swift_bridgeObjectRelease(v22);
    return 16LL;
  }

  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0x44657361656C6572LL, 0xEB00000000657461LL, a1, a2, 0LL) & 1) != 0)
  {
    unint64_t v22 = a2;
    goto LABEL_101;
  }

  if (a1 == 0x72466F74616D6F74LL && a2 == 0xEF7373656E687365LL)
  {
    unint64_t v23 = 0xEF7373656E687365LL;
LABEL_107:
    swift_bridgeObjectRelease(v23);
    return 17LL;
  }

  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0x72466F74616D6F74LL, 0xEF7373656E687365LL, a1, a2, 0LL) & 1) != 0)
  {
    unint64_t v23 = a2;
    goto LABEL_107;
  }

  if (a1 == 0xD000000000000010LL)
  {
    unint64_t v24 = 0x80000001000291B0LL;
    if (a2 == 0x80000001000291B0LL) {
      goto LABEL_112;
    }
  }

  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0xD000000000000010LL, 0x80000001000291B0LL, a1, a2, 0LL) & 1) != 0)
  {
    unint64_t v24 = a2;
LABEL_112:
    swift_bridgeObjectRelease(v24);
    return 18LL;
  }

  if (a1 == 0xD000000000000019LL && a2 == 0x80000001000291D0LL)
  {
    unint64_t v25 = 0x80000001000291D0LL;
LABEL_118:
    swift_bridgeObjectRelease(v25);
    return 19LL;
  }

  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0xD000000000000019LL, 0x80000001000291D0LL, a1, a2, 0LL) & 1) != 0)
  {
    unint64_t v25 = a2;
    goto LABEL_118;
  }

  if (a1 == 0xD000000000000010LL)
  {
    unint64_t v26 = 0x80000001000291F0LL;
    if (a2 == 0x80000001000291F0LL) {
      goto LABEL_123;
    }
  }

  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0xD000000000000010LL, 0x80000001000291F0LL, a1, a2, 0LL) & 1) != 0)
  {
    unint64_t v26 = a2;
LABEL_123:
    swift_bridgeObjectRelease(v26);
    return 20LL;
  }

  if (a1 == 0xD000000000000018LL)
  {
    unint64_t v27 = 0x8000000100029210LL;
    if (a2 == 0x8000000100029210LL) {
      goto LABEL_128;
    }
  }

  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0xD000000000000018LL, 0x8000000100029210LL, a1, a2, 0LL) & 1) != 0)
  {
    unint64_t v27 = a2;
LABEL_128:
    swift_bridgeObjectRelease(v27);
    return 21LL;
  }

  if (a1 == 0xD000000000000016LL)
  {
    unint64_t v28 = 0x8000000100029230LL;
    if (a2 == 0x8000000100029230LL) {
      goto LABEL_133;
    }
  }

  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0xD000000000000016LL, 0x8000000100029230LL, a1, a2, 0LL) & 1) != 0)
  {
    unint64_t v28 = a2;
LABEL_133:
    swift_bridgeObjectRelease(v28);
    return 22LL;
  }

  if (a1 == 0xD000000000000011LL && a2 == 0x8000000100029250LL)
  {
    unint64_t v29 = 0x8000000100029250LL;
LABEL_139:
    swift_bridgeObjectRelease(v29);
    return 23LL;
  }

  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0xD000000000000011LL, 0x8000000100029250LL, a1, a2, 0LL) & 1) != 0)
  {
    unint64_t v29 = a2;
    goto LABEL_139;
  }

  if (a1 == 0xD000000000000012LL)
  {
    unint64_t v30 = 0x8000000100029270LL;
    if (a2 == 0x8000000100029270LL) {
      goto LABEL_144;
    }
  }

  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0xD000000000000012LL, 0x8000000100029270LL, a1, a2, 0LL) & 1) != 0)
  {
    unint64_t v30 = a2;
LABEL_144:
    swift_bridgeObjectRelease(v30);
    return 24LL;
  }

  if (a1 == 0xD000000000000014LL)
  {
    unint64_t v31 = 0x8000000100029290LL;
    if (a2 == 0x8000000100029290LL) {
      goto LABEL_149;
    }
  }

  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0xD000000000000014LL, 0x8000000100029290LL, a1, a2, 0LL) & 1) != 0)
  {
    unint64_t v31 = a2;
LABEL_149:
    swift_bridgeObjectRelease(v31);
    return 25LL;
  }

  if (a1 == 0xD000000000000016LL)
  {
    unint64_t v32 = 0x80000001000292B0LL;
    if (a2 == 0x80000001000292B0LL) {
      goto LABEL_154;
    }
  }

  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0xD000000000000016LL, 0x80000001000292B0LL, a1, a2, 0LL) & 1) != 0)
  {
    unint64_t v32 = a2;
LABEL_154:
    swift_bridgeObjectRelease(v32);
    return 26LL;
  }

  if (a1 == 0xD000000000000014LL)
  {
    unint64_t v33 = 0x80000001000292D0LL;
    if (a2 == 0x80000001000292D0LL) {
      goto LABEL_159;
    }
  }

  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0xD000000000000014LL, 0x80000001000292D0LL, a1, a2, 0LL) & 1) != 0)
  {
    unint64_t v33 = a2;
LABEL_159:
    swift_bridgeObjectRelease(v33);
    return 27LL;
  }

  if (a1 == 0xD000000000000012LL)
  {
    unint64_t v34 = 0x80000001000292F0LL;
    if (a2 == 0x80000001000292F0LL) {
      goto LABEL_164;
    }
  }

  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0xD000000000000012LL, 0x80000001000292F0LL, a1, a2, 0LL) & 1) != 0)
  {
    unint64_t v34 = a2;
LABEL_164:
    swift_bridgeObjectRelease(v34);
    return 28LL;
  }

  if (a1 == 0xD00000000000001ALL && a2 == 0x8000000100029310LL)
  {
    unint64_t v35 = 0x8000000100029310LL;
LABEL_170:
    swift_bridgeObjectRelease(v35);
    return 29LL;
  }

  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0xD00000000000001ALL, 0x8000000100029310LL, a1, a2, 0LL) & 1) != 0)
  {
    unint64_t v35 = a2;
    goto LABEL_170;
  }

  if (a1 == 0xD000000000000018LL)
  {
    unint64_t v36 = 0x8000000100029330LL;
    if (a2 == 0x8000000100029330LL) {
      goto LABEL_175;
    }
  }

  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0xD000000000000018LL, 0x8000000100029330LL, a1, a2, 0LL) & 1) != 0)
  {
    unint64_t v36 = a2;
LABEL_175:
    swift_bridgeObjectRelease(v36);
    return 30LL;
  }

  if (a1 == 0xD000000000000013LL)
  {
    unint64_t v37 = 0x8000000100029350LL;
    if (a2 == 0x8000000100029350LL) {
      goto LABEL_180;
    }
  }

  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0xD000000000000013LL, 0x8000000100029350LL, a1, a2, 0LL) & 1) != 0)
  {
    unint64_t v37 = a2;
LABEL_180:
    swift_bridgeObjectRelease(v37);
    return 31LL;
  }

  if (a1 == 0xD000000000000014LL)
  {
    unint64_t v38 = 0x8000000100029370LL;
    if (a2 == 0x8000000100029370LL) {
      goto LABEL_185;
    }
  }

  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0xD000000000000014LL, 0x8000000100029370LL, a1, a2, 0LL) & 1) != 0)
  {
    unint64_t v38 = a2;
LABEL_185:
    swift_bridgeObjectRelease(v38);
    return 32LL;
  }

  if (a1 == 0xD000000000000016LL)
  {
    unint64_t v39 = 0x8000000100029390LL;
    if (a2 == 0x8000000100029390LL) {
      goto LABEL_190;
    }
  }

  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0xD000000000000016LL, 0x8000000100029390LL, a1, a2, 0LL) & 1) != 0)
  {
    unint64_t v39 = a2;
LABEL_190:
    swift_bridgeObjectRelease(v39);
    return 33LL;
  }

  if (a1 == 0xD000000000000018LL)
  {
    unint64_t v40 = 0x80000001000293B0LL;
    if (a2 == 0x80000001000293B0LL) {
      goto LABEL_195;
    }
  }

  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0xD000000000000018LL, 0x80000001000293B0LL, a1, a2, 0LL) & 1) != 0)
  {
    unint64_t v40 = a2;
LABEL_195:
    swift_bridgeObjectRelease(v40);
    return 34LL;
  }

  if (a1 == 0xD000000000000016LL && a2 == 0x80000001000293D0LL)
  {
    swift_bridgeObjectRelease(0x80000001000293D0LL);
    return 35LL;
  }

  else
  {
    char v41 = _stringCompareWithSmolCheck(_:_:expecting:)(0xD000000000000016LL, 0x80000001000293D0LL, a1, a2, 0LL);
    swift_bridgeObjectRelease(a2);
    if ((v41 & 1) != 0) {
      return 35LL;
    }
    else {
      return 36LL;
    }
  }

void *sub_10001EAAC@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = v2;
  uint64_t v6 = sub_100008A20(&qword_100036310);
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  unint64_t v9 = (char *)&v110 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v10 = a1[3];
  uint64_t v11 = a1[4];
  uint64_t v171 = a1;
  sub_10000A0F0(a1, v10);
  unint64_t v12 = sub_10001DCA4();
  dispatch thunk of Decoder.container<A>(keyedBy:)( &type metadata for FeaturedContent.CodingKeys,  &type metadata for FeaturedContent.CodingKeys,  v12,  v10,  v11);
  if (v2)
  {
    uint64_t v172 = 0LL;
    uint64_t v173 = v2;
    unint64_t v13 = 0x808000000LL;
    goto LABEL_4;
  }

  id v146 = a2;
  LOBYTE(v175[0]) = 0;
  uint64_t v24 = KeyedDecodingContainer.decode(_:forKey:)(v175, v6);
  uint64_t v26 = v25;
  LOBYTE(v175[0]) = 1;
  swift_bridgeObjectRetain(v25);
  uint64_t v27 = KeyedDecodingContainer.decode(_:forKey:)(v175, v6);
  uint64_t v168 = v26;
  uint64_t v29 = v28;
  uint64_t v145 = v27;
  LOBYTE(v175[0]) = 2;
  swift_bridgeObjectRetain(v28);
  uint64_t v30 = KeyedDecodingContainer.decode(_:forKey:)(v175, v6);
  uint64_t v167 = v29;
  uint64_t v31 = v30;
  uint64_t v33 = v32;
  LOBYTE(v175[0]) = 3;
  swift_bridgeObjectRetain(v32);
  uint64_t v34 = KeyedDecodingContainer.decode(_:forKey:)(v175, v6);
  uint64_t v166 = v33;
  uint64_t v143 = v34;
  uint64_t v144 = v31;
  LOBYTE(v175[0]) = 4;
  uint64_t v36 = v35;
  swift_bridgeObjectRetain(v35);
  uint64_t v37 = KeyedDecodingContainer.decode(_:forKey:)(v175, v6);
  uint64_t v165 = v36;
  uint64_t v142 = v37;
  LOBYTE(v175[0]) = 5;
  uint64_t v39 = v38;
  swift_bridgeObjectRetain(v38);
  uint64_t v40 = KeyedDecodingContainer.decode(_:forKey:)(v175, v6);
  uint64_t v164 = v39;
  uint64_t v141 = v40;
  LOBYTE(v175[0]) = 6;
  uint64_t v3 = v41;
  swift_bridgeObjectRetain(v41);
  uint64_t v42 = KeyedDecodingContainer.decode(_:forKey:)(v175, v6);
  uint64_t v163 = v3;
  uint64_t v140 = v42;
  LOBYTE(v175[0]) = 7;
  uint64_t v162 = v43;
  swift_bridgeObjectRetain(v43);
  uint64_t v139 = KeyedDecodingContainer.decode(_:forKey:)(v175, v6);
  LOBYTE(v175[0]) = 8;
  uint64_t v161 = v44;
  swift_bridgeObjectRetain(v44);
  uint64_t v138 = KeyedDecodingContainer.decode(_:forKey:)(v175, v6);
  LOBYTE(v175[0]) = 9;
  uint64_t v160 = v45;
  swift_bridgeObjectRetain(v45);
  uint64_t v136 = KeyedDecodingContainer.decode(_:forKey:)(v175, v6);
  uint64_t v137 = v46;
  uint64_t v173 = 0LL;
  uint64_t v10 = sub_100008A20(&qword_100036050);
  LOBYTE(v174[0]) = 10;
  uint64_t v47 = sub_100024838( &qword_100036318,  &qword_100036050,  (uint64_t)&protocol witness table for String,  (uint64_t)&protocol conformance descriptor for <A> [A]);
  swift_bridgeObjectRetain(v137);
  uint64_t v48 = v173;
  KeyedDecodingContainer.decode<A>(_:forKey:)(v175, v10, v174, v6, v10, v47);
  uint64_t v173 = v48;
  if (v48)
  {
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
    swift_bridgeObjectRelease(v168);
    swift_bridgeObjectRelease(v167);
    swift_bridgeObjectRelease(v166);
    swift_bridgeObjectRelease(v165);
    swift_bridgeObjectRelease(v164);
    swift_bridgeObjectRelease(v163);
    swift_bridgeObjectRelease(v162);
    swift_bridgeObjectRelease(v161);
    swift_bridgeObjectRelease(v160);
    uint64_t v6 = v137;
    swift_bridgeObjectRelease(v137);
    uint64_t v172 = 0LL;
    unint64_t v13 = 0x8080003FFLL;
    goto LABEL_4;
  }

  uint64_t v49 = v175[0];
  LOBYTE(v175[0]) = 11;
  uint64_t v135 = v49;
  swift_bridgeObjectRetain(v49);
  uint64_t v50 = v173;
  uint64_t v133 = KeyedDecodingContainer.decode(_:forKey:)(v175, v6);
  uint64_t v134 = v51;
  uint64_t v173 = v50;
  if (v50)
  {
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
    swift_bridgeObjectRelease(v168);
    swift_bridgeObjectRelease(v167);
    swift_bridgeObjectRelease(v166);
    swift_bridgeObjectRelease(v165);
    swift_bridgeObjectRelease(v164);
    swift_bridgeObjectRelease(v163);
    swift_bridgeObjectRelease(v162);
    swift_bridgeObjectRelease(v161);
    swift_bridgeObjectRelease(v160);
    uint64_t v6 = v137;
    swift_bridgeObjectRelease(v137);
    uint64_t v10 = v135;
    swift_bridgeObjectRelease(v135);
    uint64_t v172 = 0LL;
    unint64_t v13 = 0x8080007FFLL;
    goto LABEL_4;
  }

  LOBYTE(v174[0]) = 12;
  swift_bridgeObjectRetain(v134);
  uint64_t v52 = v173;
  KeyedDecodingContainer.decode<A>(_:forKey:)(v175, v10, v174, v6, v10, v47);
  uint64_t v173 = v52;
  if (v52)
  {
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
    swift_bridgeObjectRelease(v168);
    swift_bridgeObjectRelease(v167);
    swift_bridgeObjectRelease(v166);
    swift_bridgeObjectRelease(v165);
    swift_bridgeObjectRelease(v164);
    swift_bridgeObjectRelease(v163);
    swift_bridgeObjectRelease(v162);
    swift_bridgeObjectRelease(v161);
    swift_bridgeObjectRelease(v160);
    uint64_t v6 = v137;
    swift_bridgeObjectRelease(v137);
    uint64_t v10 = v135;
    swift_bridgeObjectRelease(v135);
    uint64_t v7 = v134;
    swift_bridgeObjectRelease(v134);
    uint64_t v172 = 0LL;
    unint64_t v13 = 0x808000FFFLL;
    goto LABEL_4;
  }

  uint64_t v53 = v175[0];
  LOBYTE(v175[0]) = 13;
  uint64_t v159 = v53;
  swift_bridgeObjectRetain(v53);
  uint64_t v54 = v173;
  uint64_t v55 = KeyedDecodingContainer.decode(_:forKey:)(v175, v6);
  uint64_t v173 = v54;
  if (v54)
  {
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
    swift_bridgeObjectRelease(v168);
    swift_bridgeObjectRelease(v167);
    swift_bridgeObjectRelease(v166);
    swift_bridgeObjectRelease(v165);
    swift_bridgeObjectRelease(v164);
    swift_bridgeObjectRelease(v163);
    swift_bridgeObjectRelease(v162);
    swift_bridgeObjectRelease(v161);
    swift_bridgeObjectRelease(v160);
    uint64_t v6 = v137;
    swift_bridgeObjectRelease(v137);
    uint64_t v10 = v135;
    swift_bridgeObjectRelease(v135);
    uint64_t v7 = v134;
    swift_bridgeObjectRelease(v134);
    swift_bridgeObjectRelease(v159);
    uint64_t v172 = 0LL;
    unint64_t v13 = 0x1808001FFFLL;
    goto LABEL_4;
  }

  uint64_t v56 = v55;
  LOBYTE(v175[0]) = 14;
  uint64_t v132 = KeyedDecodingContainer.decode(_:forKey:)(v175, v6);
  uint64_t v173 = 0LL;
  LOBYTE(v175[0]) = 15;
  uint64_t v131 = KeyedDecodingContainer.decode(_:forKey:)(v175, v6);
  uint64_t v158 = v57;
  uint64_t v173 = 0LL;
  LOBYTE(v175[0]) = 16;
  swift_bridgeObjectRetain(v158);
  uint64_t v58 = v173;
  uint64_t v130 = KeyedDecodingContainer.decode(_:forKey:)(v175, v6);
  uint64_t v173 = v58;
  if (v58)
  {
    unint64_t v13 = 0x808009FFFLL;
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
    swift_bridgeObjectRelease(v168);
    swift_bridgeObjectRelease(v167);
    swift_bridgeObjectRelease(v166);
    swift_bridgeObjectRelease(v165);
    swift_bridgeObjectRelease(v164);
    swift_bridgeObjectRelease(v163);
    swift_bridgeObjectRelease(v162);
    swift_bridgeObjectRelease(v161);
    swift_bridgeObjectRelease(v160);
    uint64_t v6 = v137;
    swift_bridgeObjectRelease(v137);
    uint64_t v10 = v135;
    swift_bridgeObjectRelease(v135);
    uint64_t v7 = v134;
    swift_bridgeObjectRelease(v134);
    swift_bridgeObjectRelease(v159);
    swift_bridgeObjectRelease(v158);
    uint64_t v172 = 0LL;
    goto LABEL_4;
  }

  LOBYTE(v175[0]) = 17;
  int v129 = KeyedDecodingContainer.decode(_:forKey:)(v175, v6);
  uint64_t v173 = 0LL;
  LOBYTE(v175[0]) = 18;
  KeyedDecodingContainer.decode(_:forKey:)(v175, v6);
  uint64_t v173 = 0LL;
  uint64_t v60 = v59;
  LOBYTE(v175[0]) = 19;
  uint64_t v128 = KeyedDecodingContainer.decode(_:forKey:)(v175, v6);
  uint64_t v173 = 0LL;
  LOBYTE(v175[0]) = 20;
  uint64_t v127 = KeyedDecodingContainer.decode(_:forKey:)(v175, v6);
  uint64_t v157 = v61;
  uint64_t v173 = 0LL;
  LOBYTE(v175[0]) = 21;
  swift_bridgeObjectRetain(v157);
  uint64_t v62 = v173;
  uint64_t v126 = KeyedDecodingContainer.decode(_:forKey:)(v175, v6);
  uint64_t v156 = v63;
  uint64_t v173 = v62;
  if (v62)
  {
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
    swift_bridgeObjectRelease(v168);
    swift_bridgeObjectRelease(v167);
    swift_bridgeObjectRelease(v166);
    swift_bridgeObjectRelease(v165);
    swift_bridgeObjectRelease(v164);
    swift_bridgeObjectRelease(v163);
    swift_bridgeObjectRelease(v162);
    swift_bridgeObjectRelease(v161);
    swift_bridgeObjectRelease(v160);
    uint64_t v6 = v137;
    swift_bridgeObjectRelease(v137);
    uint64_t v10 = v135;
    swift_bridgeObjectRelease(v135);
    uint64_t v7 = v134;
    swift_bridgeObjectRelease(v134);
    swift_bridgeObjectRelease(v159);
    swift_bridgeObjectRelease(v158);
    swift_bridgeObjectRelease(v157);
    uint64_t v172 = 0LL;
    unint64_t v13 = 0x808109FFFLL;
    goto LABEL_4;
  }

  LOBYTE(v175[0]) = 22;
  swift_bridgeObjectRetain(v156);
  uint64_t v64 = v173;
  uint64_t v125 = KeyedDecodingContainer.decode(_:forKey:)(v175, v6);
  uint64_t v155 = v65;
  uint64_t v173 = v64;
  if (v64)
  {
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
    swift_bridgeObjectRelease(v168);
    swift_bridgeObjectRelease(v167);
    swift_bridgeObjectRelease(v166);
    swift_bridgeObjectRelease(v165);
    swift_bridgeObjectRelease(v164);
    swift_bridgeObjectRelease(v163);
    swift_bridgeObjectRelease(v162);
    swift_bridgeObjectRelease(v161);
    swift_bridgeObjectRelease(v160);
    uint64_t v6 = v137;
    swift_bridgeObjectRelease(v137);
    uint64_t v10 = v135;
    swift_bridgeObjectRelease(v135);
    uint64_t v7 = v134;
    swift_bridgeObjectRelease(v134);
    swift_bridgeObjectRelease(v159);
    swift_bridgeObjectRelease(v158);
    swift_bridgeObjectRelease(v157);
    swift_bridgeObjectRelease(v156);
    uint64_t v172 = 0LL;
    unint64_t v13 = 0x808309FFFLL;
    goto LABEL_4;
  }

  LOBYTE(v175[0]) = 23;
  swift_bridgeObjectRetain(v155);
  uint64_t v66 = v173;
  uint64_t v124 = KeyedDecodingContainer.decode(_:forKey:)(v175, v6);
  uint64_t v154 = v67;
  uint64_t v173 = v66;
  if (v66)
  {
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
    swift_bridgeObjectRelease(v168);
    swift_bridgeObjectRelease(v167);
    swift_bridgeObjectRelease(v166);
    swift_bridgeObjectRelease(v165);
    swift_bridgeObjectRelease(v164);
    swift_bridgeObjectRelease(v163);
    swift_bridgeObjectRelease(v162);
    swift_bridgeObjectRelease(v161);
    swift_bridgeObjectRelease(v160);
    uint64_t v6 = v137;
    swift_bridgeObjectRelease(v137);
    uint64_t v10 = v135;
    swift_bridgeObjectRelease(v135);
    uint64_t v7 = v134;
    swift_bridgeObjectRelease(v134);
    swift_bridgeObjectRelease(v159);
    swift_bridgeObjectRelease(v158);
    swift_bridgeObjectRelease(v157);
    swift_bridgeObjectRelease(v156);
    swift_bridgeObjectRelease(v155);
    uint64_t v172 = 0LL;
    unint64_t v13 = 0x808709FFFLL;
    goto LABEL_4;
  }

  LOBYTE(v175[0]) = 24;
  swift_bridgeObjectRetain(v154);
  uint64_t v68 = v173;
  uint64_t v123 = KeyedDecodingContainer.decode(_:forKey:)(v175, v6);
  uint64_t v152 = v69;
  uint64_t v173 = v68;
  if (v68)
  {
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
    swift_bridgeObjectRelease(v168);
    swift_bridgeObjectRelease(v167);
    swift_bridgeObjectRelease(v166);
    swift_bridgeObjectRelease(v165);
    swift_bridgeObjectRelease(v164);
    swift_bridgeObjectRelease(v163);
    swift_bridgeObjectRelease(v162);
    swift_bridgeObjectRelease(v161);
    swift_bridgeObjectRelease(v160);
    uint64_t v6 = v137;
    swift_bridgeObjectRelease(v137);
    uint64_t v10 = v135;
    swift_bridgeObjectRelease(v135);
    uint64_t v7 = v134;
    swift_bridgeObjectRelease(v134);
    swift_bridgeObjectRelease(v159);
    swift_bridgeObjectRelease(v158);
    swift_bridgeObjectRelease(v157);
    swift_bridgeObjectRelease(v156);
    swift_bridgeObjectRelease(v155);
    swift_bridgeObjectRelease(v154);
    uint64_t v172 = 0LL;
    unint64_t v13 = 0x808F09FFFLL;
    goto LABEL_4;
  }

  uint64_t v70 = sub_100008A20(&qword_1000360B0);
  LOBYTE(v174[0]) = 25;
  uint64_t v71 = sub_100024894( &qword_100036320,  (uint64_t)&protocol witness table for String,  (uint64_t)&protocol conformance descriptor for <> [A : B]);
  swift_bridgeObjectRetain(v152);
  uint64_t v169 = v70;
  uint64_t v147 = v71;
  uint64_t v72 = v71;
  uint64_t v73 = v173;
  KeyedDecodingContainer.decode<A>(_:forKey:)(v175, v70, v174, v6, v70, v72);
  uint64_t v173 = v73;
  if (v73)
  {
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
    swift_bridgeObjectRelease(v168);
    swift_bridgeObjectRelease(v167);
    swift_bridgeObjectRelease(v166);
    swift_bridgeObjectRelease(v165);
    swift_bridgeObjectRelease(v164);
    swift_bridgeObjectRelease(v163);
    swift_bridgeObjectRelease(v162);
    swift_bridgeObjectRelease(v161);
    swift_bridgeObjectRelease(v160);
    uint64_t v6 = v137;
    swift_bridgeObjectRelease(v137);
    uint64_t v10 = v135;
    swift_bridgeObjectRelease(v135);
    uint64_t v7 = v134;
    swift_bridgeObjectRelease(v134);
    swift_bridgeObjectRelease(v159);
    swift_bridgeObjectRelease(v158);
    swift_bridgeObjectRelease(v157);
    swift_bridgeObjectRelease(v156);
    swift_bridgeObjectRelease(v155);
    swift_bridgeObjectRelease(v154);
    swift_bridgeObjectRelease(v152);
    uint64_t v172 = 0LL;
    unint64_t v13 = 0x809F09FFFLL;
    goto LABEL_4;
  }

  uint64_t v74 = v175[0];
  LOBYTE(v175[0]) = 26;
  uint64_t v3 = v74;
  swift_bridgeObjectRetain(v74);
  uint64_t v75 = v173;
  uint64_t v122 = KeyedDecodingContainer.decode(_:forKey:)(v175, v6);
  uint64_t v153 = v76;
  uint64_t v173 = v75;
  if (v75)
  {
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
    swift_bridgeObjectRelease(v168);
    swift_bridgeObjectRelease(v167);
    swift_bridgeObjectRelease(v166);
    swift_bridgeObjectRelease(v165);
    swift_bridgeObjectRelease(v164);
    swift_bridgeObjectRelease(v163);
    swift_bridgeObjectRelease(v162);
    swift_bridgeObjectRelease(v161);
    swift_bridgeObjectRelease(v160);
    uint64_t v6 = v137;
    swift_bridgeObjectRelease(v137);
    uint64_t v10 = v135;
    swift_bridgeObjectRelease(v135);
    uint64_t v7 = v134;
    swift_bridgeObjectRelease(v134);
    swift_bridgeObjectRelease(v159);
    swift_bridgeObjectRelease(v158);
    swift_bridgeObjectRelease(v157);
    swift_bridgeObjectRelease(v156);
    swift_bridgeObjectRelease(v155);
    swift_bridgeObjectRelease(v154);
    swift_bridgeObjectRelease(v152);
    swift_bridgeObjectRelease(v3);
    uint64_t v172 = 0LL;
    unint64_t v13 = 0x80BF09FFFLL;
    goto LABEL_4;
  }

  LOBYTE(v175[0]) = 27;
  swift_bridgeObjectRetain(v153);
  uint64_t v77 = v173;
  uint64_t v121 = KeyedDecodingContainer.decodeIfPresent(_:forKey:)(v175, v6);
  uint64_t v172 = v78;
  uint64_t v173 = v77;
  if (v77)
  {
    unint64_t v13 = 0x80FF09FFFLL;
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
    swift_bridgeObjectRelease(v168);
    swift_bridgeObjectRelease(v167);
    swift_bridgeObjectRelease(v166);
    swift_bridgeObjectRelease(v165);
    swift_bridgeObjectRelease(v164);
    swift_bridgeObjectRelease(v163);
    swift_bridgeObjectRelease(v162);
    swift_bridgeObjectRelease(v161);
    swift_bridgeObjectRelease(v160);
    uint64_t v6 = v137;
    swift_bridgeObjectRelease(v137);
    uint64_t v10 = v135;
    swift_bridgeObjectRelease(v135);
    uint64_t v7 = v134;
    swift_bridgeObjectRelease(v134);
    swift_bridgeObjectRelease(v159);
    swift_bridgeObjectRelease(v158);
    swift_bridgeObjectRelease(v157);
    swift_bridgeObjectRelease(v156);
    swift_bridgeObjectRelease(v155);
    swift_bridgeObjectRelease(v154);
    swift_bridgeObjectRelease(v152);
    swift_bridgeObjectRelease(v3);
    swift_bridgeObjectRelease(v153);
    uint64_t v172 = 0LL;
    goto LABEL_4;
  }

  LOBYTE(v175[0]) = 28;
  swift_bridgeObjectRetain(v172);
  uint64_t v79 = v173;
  uint64_t v120 = KeyedDecodingContainer.decode(_:forKey:)(v175, v6);
  uint64_t v151 = v80;
  uint64_t v173 = v79;
  if (v79)
  {
    unint64_t v13 = 0x80FF09FFFLL;
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
    swift_bridgeObjectRelease(v168);
    swift_bridgeObjectRelease(v167);
    swift_bridgeObjectRelease(v166);
    swift_bridgeObjectRelease(v165);
    swift_bridgeObjectRelease(v164);
    swift_bridgeObjectRelease(v163);
    swift_bridgeObjectRelease(v162);
    swift_bridgeObjectRelease(v161);
    swift_bridgeObjectRelease(v160);
    uint64_t v6 = v137;
    swift_bridgeObjectRelease(v137);
    uint64_t v10 = v135;
    swift_bridgeObjectRelease(v135);
    uint64_t v7 = v134;
    swift_bridgeObjectRelease(v134);
    swift_bridgeObjectRelease(v159);
    swift_bridgeObjectRelease(v158);
    swift_bridgeObjectRelease(v157);
    swift_bridgeObjectRelease(v156);
    swift_bridgeObjectRelease(v155);
    swift_bridgeObjectRelease(v154);
    swift_bridgeObjectRelease(v152);
    swift_bridgeObjectRelease(v3);
    swift_bridgeObjectRelease(v153);
    swift_bridgeObjectRelease(v172);
    goto LABEL_4;
  }

  LOBYTE(v175[0]) = 29;
  swift_bridgeObjectRetain(v151);
  uint64_t v81 = v173;
  uint64_t v119 = KeyedDecodingContainer.decode(_:forKey:)(v175, v6);
  uint64_t v150 = v82;
  uint64_t v173 = v81;
  if (v81)
  {
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
    swift_bridgeObjectRelease(v168);
    swift_bridgeObjectRelease(v167);
    swift_bridgeObjectRelease(v166);
    swift_bridgeObjectRelease(v165);
    swift_bridgeObjectRelease(v164);
    swift_bridgeObjectRelease(v163);
    swift_bridgeObjectRelease(v162);
    swift_bridgeObjectRelease(v161);
    swift_bridgeObjectRelease(v160);
    uint64_t v6 = v137;
    swift_bridgeObjectRelease(v137);
    uint64_t v10 = v135;
    swift_bridgeObjectRelease(v135);
    uint64_t v7 = v134;
    swift_bridgeObjectRelease(v134);
    swift_bridgeObjectRelease(v159);
    swift_bridgeObjectRelease(v158);
    swift_bridgeObjectRelease(v157);
    swift_bridgeObjectRelease(v156);
    swift_bridgeObjectRelease(v155);
    swift_bridgeObjectRelease(v154);
    swift_bridgeObjectRelease(v152);
    swift_bridgeObjectRelease(v3);
    swift_bridgeObjectRelease(v153);
    swift_bridgeObjectRelease(v172);
    swift_bridgeObjectRelease(v151);
    unint64_t v13 = 0x81FF09FFFLL;
    goto LABEL_4;
  }

  LOBYTE(v175[0]) = 30;
  swift_bridgeObjectRetain(v150);
  uint64_t v83 = v173;
  uint64_t v118 = KeyedDecodingContainer.decode(_:forKey:)(v175, v6);
  uint64_t v170 = v84;
  uint64_t v173 = v83;
  if (v83)
  {
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
    swift_bridgeObjectRelease(v168);
    swift_bridgeObjectRelease(v167);
    swift_bridgeObjectRelease(v166);
    swift_bridgeObjectRelease(v165);
    swift_bridgeObjectRelease(v164);
    swift_bridgeObjectRelease(v163);
    swift_bridgeObjectRelease(v162);
    swift_bridgeObjectRelease(v161);
    swift_bridgeObjectRelease(v160);
    uint64_t v6 = v137;
    swift_bridgeObjectRelease(v137);
    uint64_t v10 = v135;
    swift_bridgeObjectRelease(v135);
    uint64_t v7 = v134;
    swift_bridgeObjectRelease(v134);
    swift_bridgeObjectRelease(v159);
    swift_bridgeObjectRelease(v158);
    swift_bridgeObjectRelease(v157);
    swift_bridgeObjectRelease(v156);
    swift_bridgeObjectRelease(v155);
    swift_bridgeObjectRelease(v154);
    swift_bridgeObjectRelease(v152);
    swift_bridgeObjectRelease(v3);
    swift_bridgeObjectRelease(v153);
    swift_bridgeObjectRelease(v172);
    swift_bridgeObjectRelease(v151);
    swift_bridgeObjectRelease(v150);
    unint64_t v13 = 0x83FF09FFFLL;
    goto LABEL_4;
  }

  LOBYTE(v175[0]) = 31;
  swift_bridgeObjectRetain(v170);
  uint64_t v85 = v173;
  uint64_t v117 = KeyedDecodingContainer.decode(_:forKey:)(v175, v6);
  uint64_t v148 = v86;
  uint64_t v173 = v85;
  if (v85)
  {
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
    swift_bridgeObjectRelease(v168);
    swift_bridgeObjectRelease(v167);
    swift_bridgeObjectRelease(v166);
    swift_bridgeObjectRelease(v165);
    swift_bridgeObjectRelease(v164);
    swift_bridgeObjectRelease(v163);
    swift_bridgeObjectRelease(v162);
    swift_bridgeObjectRelease(v161);
    swift_bridgeObjectRelease(v160);
    uint64_t v6 = v137;
    swift_bridgeObjectRelease(v137);
    uint64_t v10 = v135;
    swift_bridgeObjectRelease(v135);
    uint64_t v7 = v134;
    swift_bridgeObjectRelease(v134);
    swift_bridgeObjectRelease(v159);
    swift_bridgeObjectRelease(v158);
    swift_bridgeObjectRelease(v157);
    swift_bridgeObjectRelease(v156);
    swift_bridgeObjectRelease(v155);
    swift_bridgeObjectRelease(v154);
    swift_bridgeObjectRelease(v152);
    swift_bridgeObjectRelease(v3);
    swift_bridgeObjectRelease(v153);
    swift_bridgeObjectRelease(v172);
    swift_bridgeObjectRelease(v151);
    swift_bridgeObjectRelease(v150);
    swift_bridgeObjectRelease(v170);
    unint64_t v13 = 0x87FF09FFFLL;
LABEL_4:
    sub_10000A114(v171);
    uint64_t v14 = (v13 >> 28) & 1;
    uint64_t v15 = (v13 >> 29) & 1;
    uint64_t v16 = (v13 >> 30) & 1;
    if ((v13 & 1) != 0)
    {
      swift_bridgeObjectRelease(v168);
      if ((v13 & 2) == 0)
      {
LABEL_6:
        if ((v13 & 4) == 0) {
          goto LABEL_7;
        }
        goto LABEL_37;
      }
    }

    else if ((v13 & 2) == 0)
    {
      goto LABEL_6;
    }

    swift_bridgeObjectRelease(v167);
    if ((v13 & 4) == 0)
    {
LABEL_7:
      if ((v13 & 8) == 0) {
        goto LABEL_8;
      }
      goto LABEL_38;
    }

LABEL_37:
    swift_bridgeObjectRelease(v166);
    if ((v13 & 8) == 0)
    {
LABEL_8:
      if ((v13 & 0x10) == 0) {
        goto LABEL_9;
      }
      goto LABEL_39;
    }

LABEL_38:
    swift_bridgeObjectRelease(v165);
    if ((v13 & 0x10) == 0)
    {
LABEL_9:
      if ((v13 & 0x20) == 0) {
        goto LABEL_10;
      }
      goto LABEL_40;
    }

LABEL_39:
    swift_bridgeObjectRelease(v164);
    if ((v13 & 0x20) == 0)
    {
LABEL_10:
      if ((v13 & 0x40) == 0) {
        goto LABEL_11;
      }
      goto LABEL_41;
    }

LABEL_40:
    swift_bridgeObjectRelease(v163);
    if ((v13 & 0x40) == 0)
    {
LABEL_11:
      if ((v13 & 0x80) == 0) {
        goto LABEL_12;
      }
      goto LABEL_42;
    }

LABEL_41:
    swift_bridgeObjectRelease(v162);
    if ((v13 & 0x80) == 0)
    {
LABEL_12:
      if ((v13 & 0x100) == 0) {
        goto LABEL_13;
      }
      goto LABEL_43;
    }

LABEL_43:
    swift_bridgeObjectRelease(v160);
    if ((v13 & 0x200) == 0)
    {
LABEL_14:
      if ((v13 & 0x400) == 0) {
        goto LABEL_15;
      }
      goto LABEL_45;
    }

LABEL_44:
    swift_bridgeObjectRelease(v6);
    if ((v13 & 0x400) == 0)
    {
LABEL_15:
      if ((v13 & 0x800) == 0) {
        goto LABEL_16;
      }
      goto LABEL_46;
    }

LABEL_45:
    swift_bridgeObjectRelease(v10);
    if ((v13 & 0x800) == 0)
    {
LABEL_16:
      if ((v13 & 0x1000) == 0) {
        goto LABEL_17;
      }
      goto LABEL_47;
    }

LABEL_46:
    swift_bridgeObjectRelease(v7);
    if ((v13 & 0x1000) == 0)
    {
LABEL_17:
      if ((v13 & 0x8000) == 0) {
        goto LABEL_18;
      }
      goto LABEL_48;
    }

LABEL_55:
      swift_bridgeObjectRelease(v172);
      int v20 = 0;
      int v19 = 0;
      BOOL v18 = 0;
      int v17 = 0;
      if ((v13 & 0x10000000) != 0)
      {
LABEL_27:
        swift_bridgeObjectRelease(v151);
        if ((v15 & 1) == 0) {
          goto LABEL_28;
        }
        goto LABEL_57;
      }

LABEL_56:
      if (!(_DWORD)v15)
      {
LABEL_28:
        uint64_t v22 = v169;
        uint64_t v21 = v170;
        if ((_DWORD)v16) {
          goto LABEL_29;
        }
        goto LABEL_58;
      }

LABEL_57:
      swift_bridgeObjectRelease(v150);
      uint64_t v22 = v169;
      uint64_t v21 = v170;
      if ((v16 & 1) != 0)
      {
LABEL_29:
        swift_bridgeObjectRelease(v21);
        if ((v17 & 1) == 0) {
          goto LABEL_30;
        }
        goto LABEL_59;
      }

LABEL_58:
      if (!v17)
      {
LABEL_30:
        if (v18) {
          goto LABEL_31;
        }
        goto LABEL_60;
      }

LABEL_59:
      swift_bridgeObjectRelease(v148);
      if (v18)
      {
LABEL_31:
        swift_bridgeObjectRelease(v149);
        if ((v19 & 1) == 0) {
          goto LABEL_32;
        }
        goto LABEL_61;
      }

LABEL_61:
      swift_bridgeObjectRelease(v22);
      if ((v20 & 1) == 0) {
        return (void *)swift_bridgeObjectRelease(0LL);
      }
      goto LABEL_33;
    }

LABEL_54:
    swift_bridgeObjectRelease(v3);
    if ((v13 & 0x4000000) != 0) {
      goto LABEL_25;
    }
    goto LABEL_55;
  }

  LOBYTE(v175[0]) = 32;
  swift_bridgeObjectRetain(v148);
  uint64_t v87 = v173;
  uint64_t v116 = KeyedDecodingContainer.decode(_:forKey:)(v175, v6);
  uint64_t v149 = v88;
  BOOL v18 = v87 == 0;
  uint64_t v173 = v87;
  if (v87)
  {
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
    swift_bridgeObjectRelease(v168);
    swift_bridgeObjectRelease(v167);
    swift_bridgeObjectRelease(v166);
    swift_bridgeObjectRelease(v165);
    swift_bridgeObjectRelease(v164);
    swift_bridgeObjectRelease(v163);
    swift_bridgeObjectRelease(v162);
    swift_bridgeObjectRelease(v161);
    swift_bridgeObjectRelease(v160);
    swift_bridgeObjectRelease(v137);
    swift_bridgeObjectRelease(v135);
    swift_bridgeObjectRelease(v134);
    swift_bridgeObjectRelease(v159);
    swift_bridgeObjectRelease(v158);
    swift_bridgeObjectRelease(v157);
    swift_bridgeObjectRelease(v156);
    swift_bridgeObjectRelease(v155);
    swift_bridgeObjectRelease(v154);
    swift_bridgeObjectRelease(v152);
    swift_bridgeObjectRelease(v3);
    swift_bridgeObjectRelease(v153);
    swift_bridgeObjectRelease(v172);
    swift_bridgeObjectRelease(v151);
    swift_bridgeObjectRelease(v150);
    swift_bridgeObjectRelease(v170);
    uint64_t v89 = v148;
LABEL_101:
    swift_bridgeObjectRelease(v89);
    int v19 = 0;
    int v20 = 0;
LABEL_102:
    sub_10000A114(v171);
    swift_bridgeObjectRelease(v3);
    swift_bridgeObjectRelease(v152);
    swift_bridgeObjectRelease(v154);
    swift_bridgeObjectRelease(v155);
    swift_bridgeObjectRelease(v156);
    swift_bridgeObjectRelease(v157);
    swift_bridgeObjectRelease(v158);
    swift_bridgeObjectRelease(v159);
    swift_bridgeObjectRelease(v134);
    swift_bridgeObjectRelease(v135);
    swift_bridgeObjectRelease(v137);
    swift_bridgeObjectRelease(v160);
    swift_bridgeObjectRelease(v161);
    swift_bridgeObjectRelease(v162);
    swift_bridgeObjectRelease(v163);
    swift_bridgeObjectRelease(v164);
    swift_bridgeObjectRelease(v165);
    swift_bridgeObjectRelease(v166);
    swift_bridgeObjectRelease(v167);
    swift_bridgeObjectRelease(v168);
    LOBYTE(v14) = 1;
    LODWORD(v15) = 1;
    LODWORD(v16) = 1;
    int v17 = 1;
LABEL_26:
    swift_bridgeObjectRelease(v153);
    swift_bridgeObjectRelease(v172);
    if ((v14 & 1) != 0) {
      goto LABEL_27;
    }
    goto LABEL_56;
  }

  LOBYTE(v174[0]) = 33;
  swift_bridgeObjectRetain(v149);
  uint64_t v90 = v173;
  KeyedDecodingContainer.decode<A>(_:forKey:)(v175, v169, v174, v6, v169, v147);
  uint64_t v173 = v90;
  if (v90)
  {
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
    swift_bridgeObjectRelease(v168);
    swift_bridgeObjectRelease(v167);
    swift_bridgeObjectRelease(v166);
    swift_bridgeObjectRelease(v165);
    swift_bridgeObjectRelease(v164);
    swift_bridgeObjectRelease(v163);
    swift_bridgeObjectRelease(v162);
    swift_bridgeObjectRelease(v161);
    swift_bridgeObjectRelease(v160);
    swift_bridgeObjectRelease(v137);
    swift_bridgeObjectRelease(v135);
    swift_bridgeObjectRelease(v134);
    swift_bridgeObjectRelease(v159);
    swift_bridgeObjectRelease(v158);
    swift_bridgeObjectRelease(v157);
    swift_bridgeObjectRelease(v156);
    swift_bridgeObjectRelease(v155);
    swift_bridgeObjectRelease(v154);
    swift_bridgeObjectRelease(v152);
    swift_bridgeObjectRelease(v3);
    swift_bridgeObjectRelease(v153);
    swift_bridgeObjectRelease(v172);
    swift_bridgeObjectRelease(v151);
    swift_bridgeObjectRelease(v150);
    swift_bridgeObjectRelease(v170);
    swift_bridgeObjectRelease(v148);
    uint64_t v89 = v149;
    goto LABEL_101;
  }

  uint64_t v91 = v175[0];
  LOBYTE(v175[0]) = 34;
  uint64_t v169 = v91;
  swift_bridgeObjectRetain(v91);
  uint64_t v92 = v173;
  uint64_t v115 = KeyedDecodingContainer.decode(_:forKey:)(v175, v6);
  uint64_t v147 = v93;
  uint64_t v173 = v92;
  if (v92)
  {
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
    swift_bridgeObjectRelease(v168);
    swift_bridgeObjectRelease(v167);
    swift_bridgeObjectRelease(v166);
    swift_bridgeObjectRelease(v165);
    swift_bridgeObjectRelease(v164);
    swift_bridgeObjectRelease(v163);
    swift_bridgeObjectRelease(v162);
    swift_bridgeObjectRelease(v161);
    swift_bridgeObjectRelease(v160);
    swift_bridgeObjectRelease(v137);
    swift_bridgeObjectRelease(v135);
    swift_bridgeObjectRelease(v134);
    swift_bridgeObjectRelease(v159);
    swift_bridgeObjectRelease(v158);
    swift_bridgeObjectRelease(v157);
    swift_bridgeObjectRelease(v156);
    swift_bridgeObjectRelease(v155);
    swift_bridgeObjectRelease(v154);
    swift_bridgeObjectRelease(v152);
    swift_bridgeObjectRelease(v3);
    swift_bridgeObjectRelease(v153);
    swift_bridgeObjectRelease(v172);
    swift_bridgeObjectRelease(v151);
    swift_bridgeObjectRelease(v150);
    swift_bridgeObjectRelease(v170);
    swift_bridgeObjectRelease(v148);
    swift_bridgeObjectRelease(v149);
    swift_bridgeObjectRelease(v169);
    int v20 = 0;
    int v19 = 1;
    goto LABEL_102;
  }

  v209[0] = 35;
  swift_bridgeObjectRetain(v147);
  uint64_t v94 = v173;
  uint64_t v114 = KeyedDecodingContainer.decodeIfPresent(_:forKey:)(v209, v6);
  uint64_t v173 = v94;
  if (v94)
  {
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
    swift_bridgeObjectRelease(v168);
    swift_bridgeObjectRelease(v167);
    swift_bridgeObjectRelease(v166);
    swift_bridgeObjectRelease(v165);
    swift_bridgeObjectRelease(v164);
    swift_bridgeObjectRelease(v163);
    swift_bridgeObjectRelease(v162);
    swift_bridgeObjectRelease(v161);
    swift_bridgeObjectRelease(v160);
    swift_bridgeObjectRelease(v137);
    swift_bridgeObjectRelease(v135);
    swift_bridgeObjectRelease(v134);
    swift_bridgeObjectRelease(v159);
    swift_bridgeObjectRelease(v158);
    swift_bridgeObjectRelease(v157);
    swift_bridgeObjectRelease(v156);
    swift_bridgeObjectRelease(v155);
    swift_bridgeObjectRelease(v154);
    swift_bridgeObjectRelease(v152);
    swift_bridgeObjectRelease(v3);
    swift_bridgeObjectRelease(v153);
    swift_bridgeObjectRelease(v172);
    swift_bridgeObjectRelease(v151);
    swift_bridgeObjectRelease(v150);
    swift_bridgeObjectRelease(v170);
    swift_bridgeObjectRelease(v148);
    swift_bridgeObjectRelease(v149);
    swift_bridgeObjectRelease(v169);
    swift_bridgeObjectRelease(v147);
    int v19 = 1;
    int v20 = 1;
    goto LABEL_102;
  }

  uint64_t v96 = v95;
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  uint64_t v113 = v96;
  swift_bridgeObjectRetain(v96);
  swift_bridgeObjectRelease(0LL);
  v174[0] = v24;
  v174[1] = v168;
  v174[2] = v145;
  v174[3] = v167;
  v174[4] = v144;
  uint64_t v97 = v165;
  v174[5] = v166;
  v174[6] = v143;
  v174[7] = v165;
  v174[8] = v142;
  uint64_t v98 = v163;
  v174[9] = v164;
  v174[10] = v141;
  v174[11] = v163;
  v174[12] = v140;
  uint64_t v100 = v161;
  uint64_t v99 = v162;
  v174[13] = v162;
  v174[14] = v139;
  v174[15] = v161;
  v174[16] = v138;
  v174[17] = v160;
  v174[18] = v136;
  v174[19] = v137;
  v174[20] = v135;
  v174[21] = v133;
  v174[22] = v134;
  v174[23] = v159;
  uint64_t v112 = v56;
  v174[24] = v56;
  v174[25] = v132;
  v174[26] = v131;
  uint64_t v101 = v157;
  v174[27] = v158;
  v174[28] = v130;
  LODWORD(v174[29]) = v129;
  v174[30] = v60;
  v174[31] = v128;
  v174[32] = v127;
  v174[33] = v157;
  v174[34] = v126;
  v174[35] = v156;
  v174[36] = v125;
  v174[37] = v155;
  v174[38] = v124;
  v174[39] = v154;
  v174[40] = v123;
  uint64_t v102 = v152;
  v174[41] = v152;
  v174[42] = v3;
  uint64_t v111 = v3;
  v174[43] = v122;
  v174[44] = v153;
  v174[45] = v121;
  v174[46] = v172;
  v174[47] = v120;
  v174[48] = v151;
  v174[49] = v119;
  v174[50] = v150;
  v174[51] = v118;
  v174[52] = v170;
  v174[53] = v117;
  v174[54] = v148;
  v174[55] = v116;
  v174[56] = v149;
  v174[57] = v169;
  v174[58] = v115;
  v174[59] = v147;
  v174[60] = v114;
  v174[61] = v113;
  sub_100023A4C(v174);
  swift_bridgeObjectRelease(v168);
  swift_bridgeObjectRelease(v167);
  swift_bridgeObjectRelease(v166);
  swift_bridgeObjectRelease(v97);
  swift_bridgeObjectRelease(v164);
  swift_bridgeObjectRelease(v98);
  swift_bridgeObjectRelease(v99);
  swift_bridgeObjectRelease(v100);
  swift_bridgeObjectRelease(v160);
  swift_bridgeObjectRelease(v137);
  swift_bridgeObjectRelease(v135);
  swift_bridgeObjectRelease(v134);
  swift_bridgeObjectRelease(v159);
  swift_bridgeObjectRelease(v158);
  swift_bridgeObjectRelease(v101);
  swift_bridgeObjectRelease(v156);
  swift_bridgeObjectRelease(v155);
  swift_bridgeObjectRelease(v154);
  swift_bridgeObjectRelease(v102);
  swift_bridgeObjectRelease(v3);
  swift_bridgeObjectRelease(v153);
  swift_bridgeObjectRelease(v172);
  swift_bridgeObjectRelease(v151);
  uint64_t v103 = v150;
  swift_bridgeObjectRelease(v150);
  uint64_t v104 = v170;
  swift_bridgeObjectRelease(v170);
  uint64_t v105 = v148;
  swift_bridgeObjectRelease(v148);
  uint64_t v106 = v149;
  swift_bridgeObjectRelease(v149);
  uint64_t v107 = v169;
  swift_bridgeObjectRelease(v169);
  uint64_t v108 = v147;
  swift_bridgeObjectRelease(v147);
  uint64_t v109 = v113;
  swift_bridgeObjectRelease(v113);
  sub_10000A114(v171);
  v175[0] = v24;
  v175[1] = v168;
  v175[2] = v145;
  v175[3] = v167;
  v175[4] = v144;
  v175[5] = v166;
  v175[6] = v143;
  v175[7] = v165;
  v175[8] = v142;
  v175[9] = v164;
  v175[10] = v141;
  v175[11] = v163;
  v175[12] = v140;
  v175[13] = v162;
  v175[14] = v139;
  v175[15] = v161;
  v175[16] = v138;
  v175[17] = v160;
  v175[18] = v136;
  v175[19] = v137;
  v175[20] = v135;
  v175[21] = v133;
  v175[22] = v134;
  v175[23] = v159;
  v175[24] = v112;
  v175[25] = v132;
  v175[26] = v131;
  v175[27] = v158;
  v175[28] = v130;
  int v176 = v129;
  uint64_t v177 = v60;
  uint64_t v178 = v128;
  uint64_t v179 = v127;
  uint64_t v180 = v157;
  uint64_t v181 = v126;
  uint64_t v182 = v156;
  uint64_t v183 = v125;
  uint64_t v184 = v155;
  uint64_t v185 = v124;
  uint64_t v186 = v154;
  uint64_t v187 = v123;
  uint64_t v188 = v152;
  uint64_t v189 = v111;
  uint64_t v190 = v122;
  uint64_t v191 = v153;
  uint64_t v192 = v121;
  uint64_t v193 = v172;
  uint64_t v194 = v120;
  uint64_t v195 = v151;
  uint64_t v196 = v119;
  uint64_t v197 = v103;
  uint64_t v198 = v118;
  uint64_t v199 = v104;
  uint64_t v200 = v117;
  uint64_t v201 = v105;
  uint64_t v202 = v116;
  uint64_t v203 = v106;
  uint64_t v204 = v107;
  uint64_t v205 = v115;
  uint64_t v206 = v108;
  uint64_t v207 = v114;
  uint64_t v208 = v109;
  sub_100023C20(v175);
  return memcpy(v146, v174, 0x1F0uLL);
}

unint64_t sub_100020D50()
{
  unint64_t result = qword_1000366C0[0];
  if (!qword_1000366C0[0])
  {
    unint64_t result = swift_getWitnessTable(&unk_100028264, &type metadata for FeaturedReturnType.CodingKeys);
    atomic_store(result, qword_1000366C0);
  }

  return result;
}

uint64_t sub_100020D94(unint64_t *a1, uint64_t *a2, void (*a3)(void), uint64_t a4)
{
  uint64_t result = *a1;
  if (!result)
  {
    uint64_t v8 = sub_10000A1FC(a2);
    a3();
    uint64_t result = swift_getWitnessTable(a4, v8);
    atomic_store(result, a1);
  }

  return result;
}

unint64_t sub_100020DF8()
{
  unint64_t result = qword_1000360D8;
  if (!qword_1000360D8)
  {
    unint64_t result = swift_getWitnessTable(&unk_100027BAC, &type metadata for FeaturedContent);
    atomic_store(result, (unint64_t *)&qword_1000360D8);
  }

  return result;
}

uint64_t sub_100020E3C(uint64_t a1, unint64_t a2)
{
  if (a1 == 0x49746E65746E6F63LL && a2 == 0xEC000000736D6574LL)
  {
    unint64_t v5 = 0xEC000000736D6574LL;
    goto LABEL_8;
  }

  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0x49746E65746E6F63LL, 0xEC000000736D6574LL, a1, a2, 0LL) & 1) != 0)
  {
    unint64_t v5 = a2;
LABEL_8:
    swift_bridgeObjectRelease(v5);
    return 0LL;
  }

  if (a1 == 0xD000000000000010LL && a2 == 0x8000000100029130LL)
  {
    swift_bridgeObjectRelease(0x8000000100029130LL);
    return 1LL;
  }

  else
  {
    char v7 = _stringCompareWithSmolCheck(_:_:expecting:)(0xD000000000000010LL, 0x8000000100029130LL, a1, a2, 0LL);
    swift_bridgeObjectRelease(a2);
    if ((v7 & 1) != 0) {
      return 1LL;
    }
    else {
      return 2LL;
    }
  }

uint64_t sub_100020F40(void *a1)
{
  uint64_t v3 = sub_100008A20(&qword_1000362F0);
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)&v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v7 = a1[3];
  uint64_t v8 = a1[4];
  sub_10000A0F0(a1, v7);
  unint64_t v9 = sub_100020D50();
  dispatch thunk of Decoder.container<A>(keyedBy:)( &type metadata for FeaturedReturnType.CodingKeys,  &type metadata for FeaturedReturnType.CodingKeys,  v9,  v7,  v8);
  if (v1)
  {
    sub_10000A114(a1);
  }

  else
  {
    uint64_t v10 = sub_100008A20(&qword_1000360C8);
    char v16 = 0;
    uint64_t v11 = sub_100020D94( &qword_1000362F8,  &qword_1000360C8,  (void (*)(void))sub_1000247B0,  (uint64_t)&protocol conformance descriptor for <A> [A]);
    KeyedDecodingContainer.decode<A>(_:forKey:)(&v15, v10, &v16, v3, v10, v11);
    uint64_t v7 = v15;
    char v16 = 1;
    unint64_t v13 = sub_1000247F4();
    swift_bridgeObjectRetain(v7);
    KeyedDecodingContainer.decode<A>(_:forKey:)( &v15,  &type metadata for CachePolicyRelay,  &v16,  v3,  &type metadata for CachePolicyRelay,  v13);
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
    sub_10000A114(a1);
    swift_bridgeObjectRelease(v7);
  }

  return v7;
}

unint64_t sub_10002116C()
{
  unint64_t result = qword_1000360E0;
  if (!qword_1000360E0)
  {
    unint64_t result = swift_getWitnessTable(&unk_10002779C, &type metadata for TopShelfContentProviderError);
    atomic_store(result, (unint64_t *)&qword_1000360E0);
  }

  return result;
}

unint64_t sub_1000211B4()
{
  unint64_t result = qword_1000360E8;
  if (!qword_1000360E8)
  {
    unint64_t result = swift_getWitnessTable(&unk_100027844, &type metadata for UpNextDisplayType);
    atomic_store(result, (unint64_t *)&qword_1000360E8);
  }

  return result;
}

_BYTE *initializeBufferWithCopyOfBuffer for TopShelfContentProviderError(_BYTE *result, _BYTE *a2)
{
  *unint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for TopShelfContentProviderError(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 < 0xFE) {
    goto LABEL_17;
  }
  if (a2 + 2 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 2) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 2;
    }
  }

  else
  {
    if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
      return (*a1 | (v4 << 8)) - 2;
    }

    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 2;
    }
  }

LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 3;
  int v8 = v6 - 3;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 0x24;
  int v8 = v6 - 36;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 2;
  int v8 = v6 - 2;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 0x11;
  int v8 = v6 - 17;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 0xC;
  int v8 = v6 - 12;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 6;
  int v8 = v6 - 6;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for TopShelfContentProviderError( _BYTE *a1, unsigned int a2, unsigned int a3)
{
  if (a3 + 2 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 2) >> 8 < 0xFF) {
    LODWORD(v4) = 1;
  }
  else {
    LODWORD(v4) = v3;
  }
  if (a3 >= 0xFE) {
    uint64_t v4 = v4;
  }
  else {
    uint64_t v4 = 0LL;
  }
  if (a2 <= 0xFD) {
    return ((uint64_t (*)(void))((char *)&loc_1000212E0 + 4 * byte_1000276DC[v4]))();
  }
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_100021314 + 4 * byte_1000276D7[v4]))();
}

uint64_t sub_100021314(uint64_t result)
{
  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_10002131C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2) {
    JUMPOUT(0x100021324LL);
  }
  return result;
}

uint64_t sub_100021330(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2) {
    JUMPOUT(0x100021338LL);
  }
  *(_BYTE *)unint64_t result = a2 + 2;
  return result;
}

uint64_t sub_10002133C(uint64_t result)
{
  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_100021344(uint64_t result)
{
  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for TopShelfContentProviderError()
{
  return &type metadata for TopShelfContentProviderError;
}

ValueMetadata *type metadata accessor for UpNextDisplayType()
{
  return &type metadata for UpNextDisplayType;
}

__n128 initializeBufferWithCopyOfBuffer for CachePolicyRelay(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u32[0] = a2[1].n128_u32[0];
  *a1 = result;
  return result;
}

uint64_t getEnumTagSinglePayload for CachePolicyRelay(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 >= 0xFF && a1[20]) {
    return (*(_DWORD *)a1 + 255);
  }
  unsigned int v3 = *a1;
  BOOL v4 = v3 >= 2;
  int v5 = (v3 + 2147483646) & 0x7FFFFFFF;
  if (!v4) {
    int v5 = -1;
  }
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for CachePolicyRelay(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(_DWORD *)(result + 16) = 0;
    *(void *)__n128 result = a2 - 255;
    *(void *)(result + 8) = 0LL;
    if (a3 >= 0xFF) {
      *(_BYTE *)(result + 20) = 1;
    }
  }

  else
  {
    if (a3 >= 0xFF) {
      *(_BYTE *)(result + 20) = 0;
    }
    if (a2) {
      *(_BYTE *)__n128 result = a2 + 1;
    }
  }

  return result;
}

ValueMetadata *type metadata accessor for CachePolicyRelay()
{
  return &type metadata for CachePolicyRelay;
}

uint64_t destroy for FetchUpNextContentIntent(uint64_t a1)
{
  return swift_bridgeObjectRelease(*(void *)(a1 + 48));
}

uint64_t initializeWithCopy for FetchUpNextContentIntent(uint64_t a1, uint64_t a2)
{
  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_OWORD *)(a1 + 4) = *(_OWORD *)(a2 + 4);
  *(_OWORD *)(a1 + 20) = *(_OWORD *)(a2 + 20);
  uint64_t v3 = *(void *)(a2 + 48);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = v3;
  *(_DWORD *)(a1 + 56) = *(_DWORD *)(a2 + 56);
  swift_bridgeObjectRetain(v3);
  return a1;
}

uint64_t assignWithCopy for FetchUpNextContentIntent(uint64_t a1, uint64_t a2)
{
  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_DWORD *)(a1 + 4) = *(_DWORD *)(a2 + 4);
  *(_DWORD *)(a1 + 8) = *(_DWORD *)(a2 + 8);
  *(_DWORD *)(a1 + 12) = *(_DWORD *)(a2 + 12);
  *(_DWORD *)(a1 + 16) = *(_DWORD *)(a2 + 16);
  *(_DWORD *)(a1 + 20) = *(_DWORD *)(a2 + 20);
  *(_DWORD *)(a1 + 24) = *(_DWORD *)(a2 + 24);
  *(_DWORD *)(a1 + 28) = *(_DWORD *)(a2 + 28);
  *(_DWORD *)(a1 + 32) = *(_DWORD *)(a2 + 32);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  uint64_t v4 = *(void *)(a2 + 48);
  uint64_t v5 = *(void *)(a1 + 48);
  *(void *)(a1 + 48) = v4;
  swift_bridgeObjectRetain(v4);
  swift_bridgeObjectRelease(v5);
  *(_DWORD *)(a1 + 56) = *(_DWORD *)(a2 + 56);
  return a1;
}

__n128 initializeWithTake for FetchUpNextContentIntent(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  __int128 v3 = *(_OWORD *)(a2 + 16);
  __int128 v4 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 44) = *(_OWORD *)(a2 + 44);
  *(_OWORD *)(a1 + 16) = v3;
  *(_OWORD *)(a1 + 32) = v4;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for FetchUpNextContentIntent(uint64_t a1, uint64_t a2)
{
  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_OWORD *)(a1 + 4) = *(_OWORD *)(a2 + 4);
  *(_OWORD *)(a1 + 20) = *(_OWORD *)(a2 + 20);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  swift_bridgeObjectRelease(v4);
  *(_DWORD *)(a1 + 56) = *(_DWORD *)(a2 + 56);
  return a1;
}

uint64_t getEnumTagSinglePayload for FetchUpNextContentIntent(uint64_t a1, int a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 < 0 && *(_BYTE *)(a1 + 60)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 48);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for FetchUpNextContentIntent(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_DWORD *)(result + 56) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(_BYTE *)(result + 60) = 1;
    }
  }

  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)(result + 48) = (a2 - 1);
      return result;
    }

    *(_BYTE *)(result + 60) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }

  return result;
}

ValueMetadata *type metadata accessor for FetchUpNextContentIntent()
{
  return &type metadata for FetchUpNextContentIntent;
}

uint64_t destroy for UpNextContent(void *a1)
{
  return swift_bridgeObjectRelease(a1[28]);
}

uint64_t initializeWithCopy for UpNextContent(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  uint64_t v16 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v16;
  uint64_t v15 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v15;
  uint64_t v4 = *(void *)(a2 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v4;
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  uint64_t v5 = *(void *)(a2 + 88);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(void *)(a1 + 88) = v5;
  uint64_t v6 = *(void *)(a2 + 104);
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  *(void *)(a1 + 104) = v6;
  uint64_t v7 = *(void *)(a2 + 120);
  *(void *)(a1 + 112) = *(void *)(a2 + 112);
  *(void *)(a1 + 120) = v7;
  uint64_t v8 = *(void *)(a2 + 136);
  *(void *)(a1 + 128) = *(void *)(a2 + 128);
  *(void *)(a1 + 136) = v8;
  uint64_t v9 = *(void *)(a2 + 152);
  *(void *)(a1 + 144) = *(void *)(a2 + 144);
  *(void *)(a1 + 152) = v9;
  uint64_t v10 = *(void *)(a2 + 168);
  *(void *)(a1 + 160) = *(void *)(a2 + 160);
  *(void *)(a1 + 168) = v10;
  uint64_t v11 = *(void *)(a2 + 184);
  *(void *)(a1 + 176) = *(void *)(a2 + 176);
  *(void *)(a1 + 184) = v11;
  uint64_t v12 = *(void *)(a2 + 200);
  *(void *)(a1 + 192) = *(void *)(a2 + 192);
  *(void *)(a1 + 200) = v12;
  uint64_t v14 = *(void *)(a2 + 208);
  uint64_t v17 = *(void *)(a2 + 216);
  *(void *)(a1 + 208) = v14;
  *(void *)(a1 + 216) = v17;
  uint64_t v18 = *(void *)(a2 + 224);
  *(void *)(a1 + 224) = v18;
  swift_bridgeObjectRetain(v3);
  swift_bridgeObjectRetain(v16);
  swift_bridgeObjectRetain(v15);
  swift_bridgeObjectRetain(v4);
  swift_bridgeObjectRetain(v5);
  swift_bridgeObjectRetain(v6);
  swift_bridgeObjectRetain(v7);
  swift_bridgeObjectRetain(v8);
  swift_bridgeObjectRetain(v9);
  swift_bridgeObjectRetain(v10);
  swift_bridgeObjectRetain(v11);
  swift_bridgeObjectRetain(v12);
  swift_bridgeObjectRetain(v14);
  swift_bridgeObjectRetain(v17);
  swift_bridgeObjectRetain(v18);
  return a1;
}

void *assignWithCopy for UpNextContent(void *a1, void *a2)
{
  *a1 = *a2;
  uint64_t v4 = a2[1];
  uint64_t v5 = a1[1];
  a1[1] = v4;
  swift_bridgeObjectRetain(v4);
  swift_bridgeObjectRelease(v5);
  a1[2] = a2[2];
  uint64_t v6 = a2[3];
  uint64_t v7 = a1[3];
  a1[3] = v6;
  swift_bridgeObjectRetain(v6);
  swift_bridgeObjectRelease(v7);
  a1[4] = a2[4];
  uint64_t v8 = a2[5];
  uint64_t v9 = a1[5];
  a1[5] = v8;
  swift_bridgeObjectRetain(v8);
  swift_bridgeObjectRelease(v9);
  a1[6] = a2[6];
  uint64_t v10 = a2[7];
  uint64_t v11 = a1[7];
  a1[7] = v10;
  swift_bridgeObjectRetain(v10);
  swift_bridgeObjectRelease(v11);
  a1[8] = a2[8];
  a1[9] = a2[9];
  a1[10] = a2[10];
  uint64_t v12 = a2[11];
  uint64_t v13 = a1[11];
  a1[11] = v12;
  swift_bridgeObjectRetain(v12);
  swift_bridgeObjectRelease(v13);
  a1[12] = a2[12];
  uint64_t v14 = a2[13];
  uint64_t v15 = a1[13];
  a1[13] = v14;
  swift_bridgeObjectRetain(v14);
  swift_bridgeObjectRelease(v15);
  a1[14] = a2[14];
  uint64_t v16 = a2[15];
  uint64_t v17 = a1[15];
  a1[15] = v16;
  swift_bridgeObjectRetain(v16);
  swift_bridgeObjectRelease(v17);
  a1[16] = a2[16];
  uint64_t v18 = a2[17];
  uint64_t v19 = a1[17];
  a1[17] = v18;
  swift_bridgeObjectRetain(v18);
  swift_bridgeObjectRelease(v19);
  a1[18] = a2[18];
  uint64_t v20 = a2[19];
  uint64_t v21 = a1[19];
  a1[19] = v20;
  swift_bridgeObjectRetain(v20);
  swift_bridgeObjectRelease(v21);
  a1[20] = a2[20];
  uint64_t v22 = a2[21];
  uint64_t v23 = a1[21];
  a1[21] = v22;
  swift_bridgeObjectRetain(v22);
  swift_bridgeObjectRelease(v23);
  a1[22] = a2[22];
  uint64_t v24 = a2[23];
  uint64_t v25 = a1[23];
  a1[23] = v24;
  swift_bridgeObjectRetain(v24);
  swift_bridgeObjectRelease(v25);
  a1[24] = a2[24];
  uint64_t v26 = a2[25];
  uint64_t v27 = a1[25];
  a1[25] = v26;
  swift_bridgeObjectRetain(v26);
  swift_bridgeObjectRelease(v27);
  uint64_t v28 = a1[26];
  uint64_t v29 = a2[26];
  a1[26] = v29;
  swift_bridgeObjectRetain(v29);
  swift_bridgeObjectRelease(v28);
  uint64_t v30 = a1[27];
  uint64_t v31 = a2[27];
  a1[27] = v31;
  swift_bridgeObjectRetain(v31);
  swift_bridgeObjectRelease(v30);
  uint64_t v32 = a1[28];
  uint64_t v33 = a2[28];
  a1[28] = v33;
  swift_bridgeObjectRetain(v33);
  swift_bridgeObjectRelease(v32);
  return a1;
}

__n128 initializeWithTake for UpNextContent(uint64_t a1, __int128 *a2)
{
  __int128 v2 = *a2;
  __int128 v3 = a2[2];
  *(_OWORD *)(a1 + 16) = a2[1];
  *(_OWORD *)(a1 + 32) = v3;
  *(_OWORD *)a1 = v2;
  __int128 v4 = a2[3];
  __int128 v5 = a2[4];
  __int128 v6 = a2[6];
  *(_OWORD *)(a1 + 80) = a2[5];
  *(_OWORD *)(a1 + 96) = v6;
  *(_OWORD *)(a1 + 48) = v4;
  *(_OWORD *)(a1 + 64) = v5;
  __int128 v7 = a2[7];
  __int128 v8 = a2[8];
  __int128 v9 = a2[10];
  *(_OWORD *)(a1 + 144) = a2[9];
  *(_OWORD *)(a1 + 160) = v9;
  *(_OWORD *)(a1 + 112) = v7;
  *(_OWORD *)(a1 + 128) = v8;
  __n128 result = (__n128)a2[11];
  __int128 v11 = a2[12];
  __int128 v12 = a2[13];
  *(void *)(a1 + 224) = *((void *)a2 + 28);
  *(_OWORD *)(a1 + 192) = v11;
  *(_OWORD *)(a1 + 208) = v12;
  *(__n128 *)(a1 + 176) = result;
  return result;
}

uint64_t assignWithTake for UpNextContent(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = *(void *)(a1 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease(v5);
  uint64_t v6 = *(void *)(a2 + 24);
  uint64_t v7 = *(void *)(a1 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v6;
  swift_bridgeObjectRelease(v7);
  uint64_t v8 = *(void *)(a2 + 40);
  uint64_t v9 = *(void *)(a1 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v8;
  swift_bridgeObjectRelease(v9);
  uint64_t v10 = *(void *)(a2 + 56);
  uint64_t v11 = *(void *)(a1 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v10;
  swift_bridgeObjectRelease(v11);
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  uint64_t v12 = *(void *)(a2 + 88);
  uint64_t v13 = *(void *)(a1 + 88);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(void *)(a1 + 88) = v12;
  swift_bridgeObjectRelease(v13);
  uint64_t v14 = *(void *)(a2 + 104);
  uint64_t v15 = *(void *)(a1 + 104);
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  *(void *)(a1 + 104) = v14;
  swift_bridgeObjectRelease(v15);
  uint64_t v16 = *(void *)(a2 + 120);
  uint64_t v17 = *(void *)(a1 + 120);
  *(void *)(a1 + 112) = *(void *)(a2 + 112);
  *(void *)(a1 + 120) = v16;
  swift_bridgeObjectRelease(v17);
  uint64_t v18 = *(void *)(a2 + 136);
  uint64_t v19 = *(void *)(a1 + 136);
  *(void *)(a1 + 128) = *(void *)(a2 + 128);
  *(void *)(a1 + 136) = v18;
  swift_bridgeObjectRelease(v19);
  uint64_t v20 = *(void *)(a2 + 152);
  uint64_t v21 = *(void *)(a1 + 152);
  *(void *)(a1 + 144) = *(void *)(a2 + 144);
  *(void *)(a1 + 152) = v20;
  swift_bridgeObjectRelease(v21);
  uint64_t v22 = *(void *)(a2 + 168);
  uint64_t v23 = *(void *)(a1 + 168);
  *(void *)(a1 + 160) = *(void *)(a2 + 160);
  *(void *)(a1 + 168) = v22;
  swift_bridgeObjectRelease(v23);
  uint64_t v24 = *(void *)(a2 + 184);
  uint64_t v25 = *(void *)(a1 + 184);
  *(void *)(a1 + 176) = *(void *)(a2 + 176);
  *(void *)(a1 + 184) = v24;
  swift_bridgeObjectRelease(v25);
  *(void *)(a1 + 192) = *(void *)(a2 + 192);
  swift_bridgeObjectRelease(*(void *)(a1 + 200));
  uint64_t v26 = *(void *)(a1 + 208);
  *(_OWORD *)(a1 + 200) = *(_OWORD *)(a2 + 200);
  swift_bridgeObjectRelease(v26);
  swift_bridgeObjectRelease(*(void *)(a1 + 216));
  uint64_t v27 = *(void *)(a1 + 224);
  *(_OWORD *)(a1 + 216) = *(_OWORD *)(a2 + 216);
  swift_bridgeObjectRelease(v27);
  return a1;
}

uint64_t getEnumTagSinglePayload for UpNextContent(uint64_t a1, int a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 < 0 && *(_BYTE *)(a1 + 232)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for UpNextContent(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 200) = 0u;
    *(_OWORD *)(result + 216) = 0u;
    *(_OWORD *)(result + 184) = 0u;
    *(_OWORD *)(result + 168) = 0u;
    *(_OWORD *)(result + 152) = 0u;
    *(_OWORD *)(result + 136) = 0u;
    *(_OWORD *)(result + 120) = 0u;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(_BYTE *)(result + 232) = 1;
    }
  }

  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }

    *(_BYTE *)(result + 232) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }

  return result;
}

ValueMetadata *type metadata accessor for UpNextContent()
{
  return &type metadata for UpNextContent;
}

uint64_t initializeBufferWithCopyOfBuffer for UpNextReturnType(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain(v2);
  return v3;
}

uint64_t destroy for UpNextReturnType(void *a1)
{
  return swift_bridgeObjectRelease(*a1);
}

uint64_t initializeWithCopy for UpNextReturnType(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  *(void *)a1 = *a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 1);
  *(_DWORD *)(a1 + 24) = *((_DWORD *)a2 + 6);
  swift_bridgeObjectRetain(v3);
  return a1;
}

__n128 initializeWithTake for UpNextReturnType(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  *(_OWORD *)(a1 + 12) = *(_OWORD *)(a2 + 12);
  *(__n128 *)a1 = result;
  return result;
}

ValueMetadata *type metadata accessor for UpNextReturnType()
{
  return &type metadata for UpNextReturnType;
}

uint64_t initializeBufferWithCopyOfBuffer for FetchFeaturedContentIntent(uint64_t a1, uint64_t a2)
{
  *(_BYTE *)a1 = *(_BYTE *)a2;
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)(a1 + 8) = v3;
  swift_bridgeObjectRetain(v3);
  return a1;
}

uint64_t destroy for FetchFeaturedContentIntent(uint64_t a1)
{
  return swift_bridgeObjectRelease(*(void *)(a1 + 8));
}

uint64_t assignWithCopy for FetchFeaturedContentIntent(uint64_t a1, uint64_t a2)
{
  *(_BYTE *)a1 = *(_BYTE *)a2;
  uint64_t v3 = *(void *)(a2 + 8);
  uint64_t v4 = *(void *)(a1 + 8);
  *(void *)(a1 + 8) = v3;
  swift_bridgeObjectRetain(v3);
  swift_bridgeObjectRelease(v4);
  return a1;
}

__n128 initializeWithTake for FetchFeaturedContentIntent(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t assignWithTake for FetchFeaturedContentIntent(uint64_t a1, uint64_t a2)
{
  *(_BYTE *)a1 = *(_BYTE *)a2;
  uint64_t v3 = *(void *)(a1 + 8);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRelease(v3);
  return a1;
}

uint64_t getEnumTagSinglePayload for FetchFeaturedContentIntent(uint64_t a1, int a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 < 0 && *(_BYTE *)(a1 + 16)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for FetchFeaturedContentIntent(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)__n128 result = a2 ^ 0x80000000;
    *(void *)(result + 8) = 0LL;
    if (a3 < 0) {
      *(_BYTE *)(result + 16) = 1;
    }
  }

  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }

    *(_BYTE *)(result + 16) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }

  return result;
}

ValueMetadata *type metadata accessor for FetchFeaturedContentIntent()
{
  return &type metadata for FetchFeaturedContentIntent;
}

uint64_t destroy for FeaturedContent(void *a1)
{
  return swift_bridgeObjectRelease(a1[61]);
}

uint64_t initializeWithCopy for FeaturedContent(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  uint64_t v39 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v39;
  uint64_t v38 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v38;
  uint64_t v37 = *(void *)(a2 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v37;
  uint64_t v36 = *(void *)(a2 + 72);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(void *)(a1 + 72) = v36;
  uint64_t v35 = *(void *)(a2 + 88);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(void *)(a1 + 88) = v35;
  uint64_t v34 = *(void *)(a2 + 104);
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  *(void *)(a1 + 104) = v34;
  uint64_t v33 = *(void *)(a2 + 120);
  *(void *)(a1 + 112) = *(void *)(a2 + 112);
  *(void *)(a1 + 120) = v33;
  uint64_t v32 = *(void *)(a2 + 136);
  *(void *)(a1 + 128) = *(void *)(a2 + 128);
  *(void *)(a1 + 136) = v32;
  uint64_t v31 = *(void *)(a2 + 152);
  *(void *)(a1 + 144) = *(void *)(a2 + 144);
  *(void *)(a1 + 152) = v31;
  uint64_t v4 = *(void *)(a2 + 168);
  uint64_t v41 = *(void *)(a2 + 160);
  *(void *)(a1 + 160) = v41;
  *(void *)(a1 + 168) = v4;
  uint64_t v40 = *(void *)(a2 + 176);
  uint64_t v43 = *(void *)(a2 + 184);
  *(void *)(a1 + 176) = v40;
  *(void *)(a1 + 184) = v43;
  *(_OWORD *)(a1 + 192) = *(_OWORD *)(a2 + 192);
  uint64_t v42 = *(void *)(a2 + 216);
  *(void *)(a1 + 208) = *(void *)(a2 + 208);
  *(void *)(a1 + 216) = v42;
  *(void *)(a1 + 224) = *(void *)(a2 + 224);
  *(_DWORD *)(a1 + 232) = *(_DWORD *)(a2 + 232);
  *(_OWORD *)(a1 + 240) = *(_OWORD *)(a2 + 240);
  uint64_t v5 = *(void *)(a2 + 264);
  *(void *)(a1 + 256) = *(void *)(a2 + 256);
  *(void *)(a1 + 264) = v5;
  uint64_t v6 = *(void *)(a2 + 280);
  *(void *)(a1 + 272) = *(void *)(a2 + 272);
  *(void *)(a1 + 280) = v6;
  uint64_t v7 = *(void *)(a2 + 296);
  *(void *)(a1 + 288) = *(void *)(a2 + 288);
  *(void *)(a1 + 296) = v7;
  uint64_t v8 = *(void *)(a2 + 312);
  *(void *)(a1 + 304) = *(void *)(a2 + 304);
  *(void *)(a1 + 312) = v8;
  uint64_t v9 = *(void *)(a2 + 328);
  *(void *)(a1 + 320) = *(void *)(a2 + 320);
  *(void *)(a1 + 328) = v9;
  uint64_t v10 = *(void *)(a2 + 344);
  uint64_t v29 = *(void *)(a2 + 336);
  *(void *)(a1 + 336) = v29;
  *(void *)(a1 + 344) = v10;
  uint64_t v11 = *(void *)(a2 + 360);
  uint64_t v28 = *(void *)(a2 + 352);
  *(void *)(a1 + 352) = v28;
  *(void *)(a1 + 360) = v11;
  uint64_t v12 = *(void *)(a2 + 376);
  uint64_t v27 = *(void *)(a2 + 368);
  *(void *)(a1 + 368) = v27;
  *(void *)(a1 + 376) = v12;
  uint64_t v13 = *(void *)(a2 + 392);
  uint64_t v26 = *(void *)(a2 + 384);
  *(void *)(a1 + 384) = v26;
  *(void *)(a1 + 392) = v13;
  uint64_t v14 = *(void *)(a2 + 408);
  uint64_t v25 = *(void *)(a2 + 400);
  *(void *)(a1 + 400) = v25;
  *(void *)(a1 + 408) = v14;
  uint64_t v16 = *(void *)(a2 + 416);
  uint64_t v15 = *(void *)(a2 + 424);
  *(void *)(a1 + 416) = v16;
  *(void *)(a1 + 424) = v15;
  uint64_t v18 = *(void *)(a2 + 432);
  uint64_t v17 = *(void *)(a2 + 440);
  *(void *)(a1 + 432) = v18;
  *(void *)(a1 + 440) = v17;
  uint64_t v19 = *(void *)(a2 + 464);
  uint64_t v24 = *(void *)(a2 + 472);
  uint64_t v20 = *(void *)(a2 + 480);
  uint64_t v30 = *(void *)(a2 + 488);
  *(void *)(a1 + 472) = v24;
  *(void *)(a1 + 480) = v20;
  uint64_t v22 = *(void *)(a2 + 448);
  uint64_t v21 = *(void *)(a2 + 456);
  *(void *)(a1 + 448) = v22;
  *(void *)(a1 + 456) = v21;
  *(void *)(a1 + 464) = v19;
  *(void *)(a1 + 488) = v30;
  swift_bridgeObjectRetain(v3);
  swift_bridgeObjectRetain(v39);
  swift_bridgeObjectRetain(v38);
  swift_bridgeObjectRetain(v37);
  swift_bridgeObjectRetain(v36);
  swift_bridgeObjectRetain(v35);
  swift_bridgeObjectRetain(v34);
  swift_bridgeObjectRetain(v33);
  swift_bridgeObjectRetain(v32);
  swift_bridgeObjectRetain(v31);
  swift_bridgeObjectRetain(v41);
  swift_bridgeObjectRetain(v40);
  swift_bridgeObjectRetain(v43);
  swift_bridgeObjectRetain(v42);
  swift_bridgeObjectRetain(v5);
  swift_bridgeObjectRetain(v6);
  swift_bridgeObjectRetain(v7);
  swift_bridgeObjectRetain(v8);
  swift_bridgeObjectRetain(v9);
  swift_bridgeObjectRetain(v29);
  swift_bridgeObjectRetain(v28);
  swift_bridgeObjectRetain(v27);
  swift_bridgeObjectRetain(v26);
  swift_bridgeObjectRetain(v25);
  swift_bridgeObjectRetain(v16);
  swift_bridgeObjectRetain(v18);
  swift_bridgeObjectRetain(v22);
  swift_bridgeObjectRetain(v21);
  swift_bridgeObjectRetain(v24);
  swift_bridgeObjectRetain(v30);
  return a1;
}

uint64_t assignWithCopy for FeaturedContent(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = *(void *)(a1 + 8);
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRetain(v4);
  swift_bridgeObjectRelease(v5);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  uint64_t v6 = *(void *)(a2 + 24);
  uint64_t v7 = *(void *)(a1 + 24);
  *(void *)(a1 + 24) = v6;
  swift_bridgeObjectRetain(v6);
  swift_bridgeObjectRelease(v7);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  uint64_t v8 = *(void *)(a2 + 40);
  uint64_t v9 = *(void *)(a1 + 40);
  *(void *)(a1 + 40) = v8;
  swift_bridgeObjectRetain(v8);
  swift_bridgeObjectRelease(v9);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  uint64_t v10 = *(void *)(a2 + 56);
  uint64_t v11 = *(void *)(a1 + 56);
  *(void *)(a1 + 56) = v10;
  swift_bridgeObjectRetain(v10);
  swift_bridgeObjectRelease(v11);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  uint64_t v12 = *(void *)(a2 + 72);
  uint64_t v13 = *(void *)(a1 + 72);
  *(void *)(a1 + 72) = v12;
  swift_bridgeObjectRetain(v12);
  swift_bridgeObjectRelease(v13);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  uint64_t v14 = *(void *)(a2 + 88);
  uint64_t v15 = *(void *)(a1 + 88);
  *(void *)(a1 + 88) = v14;
  swift_bridgeObjectRetain(v14);
  swift_bridgeObjectRelease(v15);
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  uint64_t v16 = *(void *)(a2 + 104);
  uint64_t v17 = *(void *)(a1 + 104);
  *(void *)(a1 + 104) = v16;
  swift_bridgeObjectRetain(v16);
  swift_bridgeObjectRelease(v17);
  *(void *)(a1 + 112) = *(void *)(a2 + 112);
  uint64_t v18 = *(void *)(a2 + 120);
  uint64_t v19 = *(void *)(a1 + 120);
  *(void *)(a1 + 120) = v18;
  swift_bridgeObjectRetain(v18);
  swift_bridgeObjectRelease(v19);
  *(void *)(a1 + 128) = *(void *)(a2 + 128);
  uint64_t v20 = *(void *)(a2 + 136);
  uint64_t v21 = *(void *)(a1 + 136);
  *(void *)(a1 + 136) = v20;
  swift_bridgeObjectRetain(v20);
  swift_bridgeObjectRelease(v21);
  *(void *)(a1 + 144) = *(void *)(a2 + 144);
  uint64_t v22 = *(void *)(a2 + 152);
  uint64_t v23 = *(void *)(a1 + 152);
  *(void *)(a1 + 152) = v22;
  swift_bridgeObjectRetain(v22);
  swift_bridgeObjectRelease(v23);
  uint64_t v24 = *(void *)(a2 + 160);
  uint64_t v25 = *(void *)(a1 + 160);
  *(void *)(a1 + 160) = v24;
  swift_bridgeObjectRetain(v24);
  swift_bridgeObjectRelease(v25);
  *(void *)(a1 + 168) = *(void *)(a2 + 168);
  uint64_t v26 = *(void *)(a2 + 176);
  uint64_t v27 = *(void *)(a1 + 176);
  *(void *)(a1 + 176) = v26;
  swift_bridgeObjectRetain(v26);
  swift_bridgeObjectRelease(v27);
  uint64_t v28 = *(void *)(a2 + 184);
  uint64_t v29 = *(void *)(a1 + 184);
  *(void *)(a1 + 184) = v28;
  swift_bridgeObjectRetain(v28);
  swift_bridgeObjectRelease(v29);
  *(void *)(a1 + 192) = *(void *)(a2 + 192);
  *(void *)(a1 + 200) = *(void *)(a2 + 200);
  *(void *)(a1 + 208) = *(void *)(a2 + 208);
  uint64_t v30 = *(void *)(a2 + 216);
  uint64_t v31 = *(void *)(a1 + 216);
  *(void *)(a1 + 216) = v30;
  swift_bridgeObjectRetain(v30);
  swift_bridgeObjectRelease(v31);
  *(void *)(a1 + 224) = *(void *)(a2 + 224);
  *(_DWORD *)(a1 + 232) = *(_DWORD *)(a2 + 232);
  *(void *)(a1 + 240) = *(void *)(a2 + 240);
  *(void *)(a1 + 248) = *(void *)(a2 + 248);
  *(void *)(a1 + 256) = *(void *)(a2 + 256);
  uint64_t v32 = *(void *)(a2 + 264);
  uint64_t v33 = *(void *)(a1 + 264);
  *(void *)(a1 + 264) = v32;
  swift_bridgeObjectRetain(v32);
  swift_bridgeObjectRelease(v33);
  *(void *)(a1 + 272) = *(void *)(a2 + 272);
  uint64_t v34 = *(void *)(a2 + 280);
  uint64_t v35 = *(void *)(a1 + 280);
  *(void *)(a1 + 280) = v34;
  swift_bridgeObjectRetain(v34);
  swift_bridgeObjectRelease(v35);
  *(void *)(a1 + 288) = *(void *)(a2 + 288);
  uint64_t v36 = *(void *)(a2 + 296);
  uint64_t v37 = *(void *)(a1 + 296);
  *(void *)(a1 + 296) = v36;
  swift_bridgeObjectRetain(v36);
  swift_bridgeObjectRelease(v37);
  *(void *)(a1 + 304) = *(void *)(a2 + 304);
  uint64_t v38 = *(void *)(a2 + 312);
  uint64_t v39 = *(void *)(a1 + 312);
  *(void *)(a1 + 312) = v38;
  swift_bridgeObjectRetain(v38);
  swift_bridgeObjectRelease(v39);
  *(void *)(a1 + 320) = *(void *)(a2 + 320);
  uint64_t v40 = *(void *)(a2 + 328);
  uint64_t v41 = *(void *)(a1 + 328);
  *(void *)(a1 + 328) = v40;
  swift_bridgeObjectRetain(v40);
  swift_bridgeObjectRelease(v41);
  uint64_t v42 = *(void *)(a2 + 336);
  uint64_t v43 = *(void *)(a1 + 336);
  *(void *)(a1 + 336) = v42;
  swift_bridgeObjectRetain(v42);
  swift_bridgeObjectRelease(v43);
  *(void *)(a1 + 344) = *(void *)(a2 + 344);
  uint64_t v44 = *(void *)(a2 + 352);
  uint64_t v45 = *(void *)(a1 + 352);
  *(void *)(a1 + 352) = v44;
  swift_bridgeObjectRetain(v44);
  swift_bridgeObjectRelease(v45);
  *(void *)(a1 + 360) = *(void *)(a2 + 360);
  uint64_t v46 = *(void *)(a2 + 368);
  uint64_t v47 = *(void *)(a1 + 368);
  *(void *)(a1 + 368) = v46;
  swift_bridgeObjectRetain(v46);
  swift_bridgeObjectRelease(v47);
  *(void *)(a1 + 376) = *(void *)(a2 + 376);
  uint64_t v48 = *(void *)(a2 + 384);
  uint64_t v49 = *(void *)(a1 + 384);
  *(void *)(a1 + 384) = v48;
  swift_bridgeObjectRetain(v48);
  swift_bridgeObjectRelease(v49);
  *(void *)(a1 + 392) = *(void *)(a2 + 392);
  uint64_t v50 = *(void *)(a2 + 400);
  uint64_t v51 = *(void *)(a1 + 400);
  *(void *)(a1 + 400) = v50;
  swift_bridgeObjectRetain(v50);
  swift_bridgeObjectRelease(v51);
  *(void *)(a1 + 408) = *(void *)(a2 + 408);
  uint64_t v52 = *(void *)(a2 + 416);
  uint64_t v53 = *(void *)(a1 + 416);
  *(void *)(a1 + 416) = v52;
  swift_bridgeObjectRetain(v52);
  swift_bridgeObjectRelease(v53);
  *(void *)(a1 + 424) = *(void *)(a2 + 424);
  uint64_t v54 = *(void *)(a2 + 432);
  uint64_t v55 = *(void *)(a1 + 432);
  *(void *)(a1 + 432) = v54;
  swift_bridgeObjectRetain(v54);
  swift_bridgeObjectRelease(v55);
  *(void *)(a1 + 440) = *(void *)(a2 + 440);
  uint64_t v56 = *(void *)(a2 + 448);
  uint64_t v57 = *(void *)(a1 + 448);
  *(void *)(a1 + 448) = v56;
  swift_bridgeObjectRetain(v56);
  swift_bridgeObjectRelease(v57);
  uint64_t v58 = *(void *)(a2 + 456);
  uint64_t v59 = *(void *)(a1 + 456);
  *(void *)(a1 + 456) = v58;
  swift_bridgeObjectRetain(v58);
  swift_bridgeObjectRelease(v59);
  *(void *)(a1 + 464) = *(void *)(a2 + 464);
  uint64_t v60 = *(void *)(a2 + 472);
  uint64_t v61 = *(void *)(a1 + 472);
  *(void *)(a1 + 472) = v60;
  swift_bridgeObjectRetain(v60);
  swift_bridgeObjectRelease(v61);
  *(void *)(a1 + 480) = *(void *)(a2 + 480);
  uint64_t v62 = *(void *)(a2 + 488);
  uint64_t v63 = *(void *)(a1 + 488);
  *(void *)(a1 + 488) = v62;
  swift_bridgeObjectRetain(v62);
  swift_bridgeObjectRelease(v63);
  return a1;
}

void *initializeWithTake for FeaturedContent(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x1F0uLL);
}

uint64_t assignWithTake for FeaturedContent(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = *(void *)(a1 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease(v5);
  uint64_t v6 = *(void *)(a2 + 24);
  uint64_t v7 = *(void *)(a1 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v6;
  swift_bridgeObjectRelease(v7);
  uint64_t v8 = *(void *)(a2 + 40);
  uint64_t v9 = *(void *)(a1 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v8;
  swift_bridgeObjectRelease(v9);
  uint64_t v10 = *(void *)(a2 + 56);
  uint64_t v11 = *(void *)(a1 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v10;
  swift_bridgeObjectRelease(v11);
  uint64_t v12 = *(void *)(a2 + 72);
  uint64_t v13 = *(void *)(a1 + 72);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(void *)(a1 + 72) = v12;
  swift_bridgeObjectRelease(v13);
  uint64_t v14 = *(void *)(a2 + 88);
  uint64_t v15 = *(void *)(a1 + 88);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(void *)(a1 + 88) = v14;
  swift_bridgeObjectRelease(v15);
  uint64_t v16 = *(void *)(a2 + 104);
  uint64_t v17 = *(void *)(a1 + 104);
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  *(void *)(a1 + 104) = v16;
  swift_bridgeObjectRelease(v17);
  uint64_t v18 = *(void *)(a2 + 120);
  uint64_t v19 = *(void *)(a1 + 120);
  *(void *)(a1 + 112) = *(void *)(a2 + 112);
  *(void *)(a1 + 120) = v18;
  swift_bridgeObjectRelease(v19);
  uint64_t v20 = *(void *)(a2 + 136);
  uint64_t v21 = *(void *)(a1 + 136);
  *(void *)(a1 + 128) = *(void *)(a2 + 128);
  *(void *)(a1 + 136) = v20;
  swift_bridgeObjectRelease(v21);
  uint64_t v22 = *(void *)(a2 + 152);
  uint64_t v23 = *(void *)(a1 + 152);
  *(void *)(a1 + 144) = *(void *)(a2 + 144);
  *(void *)(a1 + 152) = v22;
  swift_bridgeObjectRelease(v23);
  uint64_t v24 = *(void *)(a1 + 160);
  *(void *)(a1 + 160) = *(void *)(a2 + 160);
  swift_bridgeObjectRelease(v24);
  uint64_t v25 = *(void *)(a2 + 176);
  uint64_t v26 = *(void *)(a1 + 176);
  *(void *)(a1 + 168) = *(void *)(a2 + 168);
  *(void *)(a1 + 176) = v25;
  swift_bridgeObjectRelease(v26);
  uint64_t v27 = *(void *)(a1 + 184);
  *(void *)(a1 + 184) = *(void *)(a2 + 184);
  swift_bridgeObjectRelease(v27);
  *(_OWORD *)(a1 + 192) = *(_OWORD *)(a2 + 192);
  uint64_t v28 = *(void *)(a2 + 216);
  uint64_t v29 = *(void *)(a1 + 216);
  *(void *)(a1 + 208) = *(void *)(a2 + 208);
  *(void *)(a1 + 216) = v28;
  swift_bridgeObjectRelease(v29);
  *(void *)(a1 + 224) = *(void *)(a2 + 224);
  *(_DWORD *)(a1 + 232) = *(_DWORD *)(a2 + 232);
  *(void *)(a1 + 240) = *(void *)(a2 + 240);
  *(_OWORD *)(a1 + 248) = *(_OWORD *)(a2 + 248);
  uint64_t v30 = *(void *)(a1 + 264);
  *(void *)(a1 + 264) = *(void *)(a2 + 264);
  swift_bridgeObjectRelease(v30);
  uint64_t v31 = *(void *)(a2 + 280);
  uint64_t v32 = *(void *)(a1 + 280);
  *(void *)(a1 + 272) = *(void *)(a2 + 272);
  *(void *)(a1 + 280) = v31;
  swift_bridgeObjectRelease(v32);
  uint64_t v33 = *(void *)(a2 + 296);
  uint64_t v34 = *(void *)(a1 + 296);
  *(void *)(a1 + 288) = *(void *)(a2 + 288);
  *(void *)(a1 + 296) = v33;
  swift_bridgeObjectRelease(v34);
  uint64_t v35 = *(void *)(a2 + 312);
  uint64_t v36 = *(void *)(a1 + 312);
  *(void *)(a1 + 304) = *(void *)(a2 + 304);
  *(void *)(a1 + 312) = v35;
  swift_bridgeObjectRelease(v36);
  uint64_t v37 = *(void *)(a2 + 328);
  uint64_t v38 = *(void *)(a1 + 328);
  *(void *)(a1 + 320) = *(void *)(a2 + 320);
  *(void *)(a1 + 328) = v37;
  swift_bridgeObjectRelease(v38);
  uint64_t v39 = *(void *)(a1 + 336);
  *(void *)(a1 + 336) = *(void *)(a2 + 336);
  swift_bridgeObjectRelease(v39);
  uint64_t v40 = *(void *)(a2 + 352);
  uint64_t v41 = *(void *)(a1 + 352);
  *(void *)(a1 + 344) = *(void *)(a2 + 344);
  *(void *)(a1 + 352) = v40;
  swift_bridgeObjectRelease(v41);
  uint64_t v42 = *(void *)(a2 + 368);
  uint64_t v43 = *(void *)(a1 + 368);
  *(void *)(a1 + 360) = *(void *)(a2 + 360);
  *(void *)(a1 + 368) = v42;
  swift_bridgeObjectRelease(v43);
  uint64_t v44 = *(void *)(a2 + 384);
  uint64_t v45 = *(void *)(a1 + 384);
  *(void *)(a1 + 376) = *(void *)(a2 + 376);
  *(void *)(a1 + 384) = v44;
  swift_bridgeObjectRelease(v45);
  uint64_t v46 = *(void *)(a2 + 400);
  uint64_t v47 = *(void *)(a1 + 400);
  *(void *)(a1 + 392) = *(void *)(a2 + 392);
  *(void *)(a1 + 400) = v46;
  swift_bridgeObjectRelease(v47);
  uint64_t v48 = *(void *)(a2 + 416);
  uint64_t v49 = *(void *)(a1 + 416);
  *(void *)(a1 + 408) = *(void *)(a2 + 408);
  *(void *)(a1 + 416) = v48;
  swift_bridgeObjectRelease(v49);
  uint64_t v50 = *(void *)(a2 + 432);
  uint64_t v51 = *(void *)(a1 + 432);
  *(void *)(a1 + 424) = *(void *)(a2 + 424);
  *(void *)(a1 + 432) = v50;
  swift_bridgeObjectRelease(v51);
  uint64_t v52 = *(void *)(a2 + 448);
  uint64_t v53 = *(void *)(a1 + 448);
  *(void *)(a1 + 440) = *(void *)(a2 + 440);
  *(void *)(a1 + 448) = v52;
  swift_bridgeObjectRelease(v53);
  uint64_t v54 = *(void *)(a1 + 456);
  *(void *)(a1 + 456) = *(void *)(a2 + 456);
  swift_bridgeObjectRelease(v54);
  uint64_t v55 = *(void *)(a2 + 472);
  uint64_t v56 = *(void *)(a1 + 472);
  *(void *)(a1 + 464) = *(void *)(a2 + 464);
  *(void *)(a1 + 472) = v55;
  swift_bridgeObjectRelease(v56);
  uint64_t v57 = *(void *)(a2 + 488);
  uint64_t v58 = *(void *)(a1 + 488);
  *(void *)(a1 + 480) = *(void *)(a2 + 480);
  *(void *)(a1 + 488) = v57;
  swift_bridgeObjectRelease(v58);
  return a1;
}

uint64_t getEnumTagSinglePayload for FeaturedContent(uint64_t a1, int a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 < 0 && *(_BYTE *)(a1 + 496)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for FeaturedContent(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 488) = 0LL;
    *(_OWORD *)(result + 248) = 0u;
    *(_OWORD *)(result + 232) = 0u;
    *(_OWORD *)(result + 216) = 0u;
    *(_OWORD *)(result + 200) = 0u;
    *(_OWORD *)(result + 184) = 0u;
    *(_OWORD *)(result + 168) = 0u;
    *(_OWORD *)(result + 152) = 0u;
    *(_OWORD *)(result + 136) = 0u;
    *(_OWORD *)(result + 120) = 0u;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 472) = 0u;
    *(_OWORD *)(result + 456) = 0u;
    *(_OWORD *)(result + 440) = 0u;
    *(_OWORD *)(result + 424) = 0u;
    *(_OWORD *)(result + 408) = 0u;
    *(_OWORD *)(result + 392) = 0u;
    *(_OWORD *)(result + 376) = 0u;
    *(_OWORD *)(result + 360) = 0u;
    *(_OWORD *)(result + 344) = 0u;
    *(_OWORD *)(result + 328) = 0u;
    *(_OWORD *)(result + 312) = 0u;
    *(_OWORD *)(result + 296) = 0u;
    *(_OWORD *)(result + 280) = 0u;
    *(_OWORD *)(result + 264) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(_BYTE *)(result + 496) = 1;
    }
  }

  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }

    *(_BYTE *)(result + 496) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }

  return result;
}

ValueMetadata *type metadata accessor for FeaturedContent()
{
  return &type metadata for FeaturedContent;
}

uint64_t *_s17TVUpNextExtension16UpNextReturnTypeVwca_0(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4 = *a2;
  uint64_t v5 = *a1;
  *a1 = *a2;
  swift_bridgeObjectRetain(v4);
  swift_bridgeObjectRelease(v5);
  *((_BYTE *)a1 + 8) = *((_BYTE *)a2 + 8);
  a1[2] = a2[2];
  *((_BYTE *)a1 + 24) = *((_BYTE *)a2 + 24);
  *((_BYTE *)a1 + 25) = *((_BYTE *)a2 + 25);
  *((_BYTE *)a1 + 26) = *((_BYTE *)a2 + 26);
  *((_BYTE *)a1 + 27) = *((_BYTE *)a2 + 27);
  return a1;
}

uint64_t *_s17TVUpNextExtension16UpNextReturnTypeVwta_0(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4 = *a1;
  *a1 = *a2;
  swift_bridgeObjectRelease(v4);
  *((_BYTE *)a1 + 8) = *((_BYTE *)a2 + 8);
  a1[2] = a2[2];
  *((_BYTE *)a1 + 24) = *((_BYTE *)a2 + 24);
  *((_BYTE *)a1 + 25) = *((_BYTE *)a2 + 25);
  *((_BYTE *)a1 + 26) = *((_BYTE *)a2 + 26);
  *((_BYTE *)a1 + 27) = *((_BYTE *)a2 + 27);
  return a1;
}

uint64_t _s17TVUpNextExtension16UpNextReturnTypeVwet_0(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 < 0 && *((_BYTE *)a1 + 28)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  return (v2 + 1);
}

uint64_t sub_100022A44(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 8) = 0LL;
    *(void *)(result + 16) = 0LL;
    *(_DWORD *)(result + 24) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(_BYTE *)(result + 28) = 1;
    }
  }

  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)__n128 result = (a2 - 1);
      return result;
    }

    *(_BYTE *)(result + 28) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }

  return result;
}

ValueMetadata *type metadata accessor for FeaturedReturnType()
{
  return &type metadata for FeaturedReturnType;
}

void type metadata accessor for os_unfair_lock_s()
{
  if (!qword_100036168)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata(0LL, &unk_100031BD0);
    if (!v1) {
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_100036168);
    }
  }

ValueMetadata *type metadata accessor for FeaturedReturnType.CodingKeys()
{
  return &type metadata for FeaturedReturnType.CodingKeys;
}

uint64_t getEnumTagSinglePayload for FeaturedContent.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 < 0xDD) {
    goto LABEL_17;
  }
  if (a2 + 35 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 35) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 35;
    }
  }

  else
  {
    if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
      return (*a1 | (v4 << 8)) - 35;
    }

    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 35;
    }
  }

uint64_t storeEnumTagSinglePayload for FeaturedContent.CodingKeys( _BYTE *a1, unsigned int a2, unsigned int a3)
{
  if (a3 + 35 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 35) >> 8 < 0xFF) {
    LODWORD(v4) = 1;
  }
  else {
    LODWORD(v4) = v3;
  }
  if (a3 >= 0xDD) {
    uint64_t v4 = v4;
  }
  else {
    uint64_t v4 = 0LL;
  }
  if (a2 <= 0xDC) {
    return ((uint64_t (*)(void))((char *)&loc_100022BD8 + 4 * byte_1000276E6[v4]))();
  }
  *a1 = a2 + 35;
  return ((uint64_t (*)(void))((char *)sub_100022C0C + 4 * byte_1000276E1[v4]))();
}

uint64_t sub_100022C0C(uint64_t result)
{
  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_100022C14(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2) {
    JUMPOUT(0x100022C1CLL);
  }
  return result;
}

uint64_t sub_100022C28(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2) {
    JUMPOUT(0x100022C30LL);
  }
  *(_BYTE *)__n128 result = a2 + 35;
  return result;
}

uint64_t sub_100022C34(uint64_t result)
{
  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_100022C3C(uint64_t result)
{
  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for FeaturedContent.CodingKeys()
{
  return &type metadata for FeaturedContent.CodingKeys;
}

ValueMetadata *type metadata accessor for FetchFeaturedContentIntent.CodingKeys()
{
  return &type metadata for FetchFeaturedContentIntent.CodingKeys;
}

uint64_t _s17TVUpNextExtension17UpNextDisplayTypeOwet_0(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 < 0xFF) {
    goto LABEL_17;
  }
  if (a2 + 1 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 1) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 1;
    }
  }

  else
  {
    if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
      return (*a1 | (v4 << 8)) - 1;
    }

    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 1;
    }
  }

uint64_t _s17TVUpNextExtension17UpNextDisplayTypeOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  if (a3 + 1 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 1) >> 8 < 0xFF) {
    LODWORD(v4) = 1;
  }
  else {
    LODWORD(v4) = v3;
  }
  if (a3 >= 0xFF) {
    uint64_t v4 = v4;
  }
  else {
    uint64_t v4 = 0LL;
  }
  if (a2 <= 0xFE) {
    return ((uint64_t (*)(void))((char *)&loc_100022D44 + 4 * byte_1000276F0[v4]))();
  }
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_100022D78 + 4 * byte_1000276EB[v4]))();
}

uint64_t sub_100022D78(uint64_t result)
{
  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_100022D80(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2) {
    JUMPOUT(0x100022D88LL);
  }
  return result;
}

uint64_t sub_100022D94(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2) {
    JUMPOUT(0x100022D9CLL);
  }
  *(_BYTE *)__n128 result = a2 + 1;
  return result;
}

uint64_t sub_100022DA0(uint64_t result)
{
  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_100022DA8(uint64_t result)
{
  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_100022DB4(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_100022DBC(_BYTE *result, char a2)
{
  *__n128 result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for UpNextReturnType.CodingKeys()
{
  return &type metadata for UpNextReturnType.CodingKeys;
}

uint64_t getEnumTagSinglePayload for UpNextContent.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 < 0xF0) {
    goto LABEL_17;
  }
  if (a2 + 16 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 16) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 16;
    }
  }

  else
  {
    if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
      return (*a1 | (v4 << 8)) - 16;
    }

    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 16;
    }
  }

uint64_t storeEnumTagSinglePayload for UpNextContent.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  if (a3 + 16 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 16) >> 8 < 0xFF) {
    LODWORD(v4) = 1;
  }
  else {
    LODWORD(v4) = v3;
  }
  if (a3 >= 0xF0) {
    uint64_t v4 = v4;
  }
  else {
    uint64_t v4 = 0LL;
  }
  if (a2 <= 0xEF) {
    return ((uint64_t (*)(void))((char *)&loc_100022EB4 + 4 * byte_1000276FA[v4]))();
  }
  *a1 = a2 + 16;
  return ((uint64_t (*)(void))((char *)sub_100022EE8 + 4 * byte_1000276F5[v4]))();
}

uint64_t sub_100022EE8(uint64_t result)
{
  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_100022EF0(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2) {
    JUMPOUT(0x100022EF8LL);
  }
  return result;
}

uint64_t sub_100022F04(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2) {
    JUMPOUT(0x100022F0CLL);
  }
  *(_BYTE *)__n128 result = a2 + 16;
  return result;
}

uint64_t sub_100022F10(uint64_t result)
{
  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_100022F18(uint64_t result)
{
  *(_WORD *)(result + 1) = v1;
  return result;
}

_BYTE *sub_100022F24(_BYTE *result, char a2)
{
  *__n128 result = a2;
  return result;
}

ValueMetadata *type metadata accessor for UpNextContent.CodingKeys()
{
  return &type metadata for UpNextContent.CodingKeys;
}

uint64_t getEnumTagSinglePayload for FetchUpNextContentIntent.CodingKeys( unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 < 0xF5) {
    goto LABEL_17;
  }
  if (a2 + 11 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 11) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 11;
    }
  }

  else
  {
    if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
      return (*a1 | (v4 << 8)) - 11;
    }

    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 11;
    }
  }

uint64_t storeEnumTagSinglePayload for FetchUpNextContentIntent.CodingKeys( _BYTE *a1, unsigned int a2, unsigned int a3)
{
  if (a3 + 11 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 11) >> 8 < 0xFF) {
    LODWORD(v4) = 1;
  }
  else {
    LODWORD(v4) = v3;
  }
  if (a3 >= 0xF5) {
    uint64_t v4 = v4;
  }
  else {
    uint64_t v4 = 0LL;
  }
  if (a2 <= 0xF4) {
    return ((uint64_t (*)(void))((char *)&loc_100023018 + 4 * byte_100027704[v4]))();
  }
  *a1 = a2 + 11;
  return ((uint64_t (*)(void))((char *)sub_10002304C + 4 * byte_1000276FF[v4]))();
}

uint64_t sub_10002304C(uint64_t result)
{
  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_100023054(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2) {
    JUMPOUT(0x10002305CLL);
  }
  return result;
}

uint64_t sub_100023068(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2) {
    JUMPOUT(0x100023070LL);
  }
  *(_BYTE *)__n128 result = a2 + 11;
  return result;
}

uint64_t sub_100023074(uint64_t result)
{
  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_10002307C(uint64_t result)
{
  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for FetchUpNextContentIntent.CodingKeys()
{
  return &type metadata for FetchUpNextContentIntent.CodingKeys;
}

uint64_t getEnumTagSinglePayload for CachePolicyRelay.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 < 0xFB) {
    goto LABEL_17;
  }
  if (a2 + 5 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 5) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 5;
    }
  }

  else
  {
    if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
      return (*a1 | (v4 << 8)) - 5;
    }

    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 5;
    }
  }

uint64_t storeEnumTagSinglePayload for CachePolicyRelay.CodingKeys( _BYTE *a1, unsigned int a2, unsigned int a3)
{
  if (a3 + 5 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 5) >> 8 < 0xFF) {
    LODWORD(v4) = 1;
  }
  else {
    LODWORD(v4) = v3;
  }
  if (a3 >= 0xFB) {
    uint64_t v4 = v4;
  }
  else {
    uint64_t v4 = 0LL;
  }
  if (a2 <= 0xFA) {
    return ((uint64_t (*)(void))((char *)&loc_100023174 + 4 * byte_10002770E[v4]))();
  }
  *a1 = a2 + 5;
  return ((uint64_t (*)(void))((char *)sub_1000231A8 + 4 * byte_100027709[v4]))();
}

uint64_t sub_1000231A8(uint64_t result)
{
  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1000231B0(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2) {
    JUMPOUT(0x1000231B8LL);
  }
  return result;
}

uint64_t sub_1000231C4(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2) {
    JUMPOUT(0x1000231CCLL);
  }
  *(_BYTE *)__n128 result = a2 + 5;
  return result;
}

uint64_t sub_1000231D0(uint64_t result)
{
  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1000231D8(uint64_t result)
{
  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for CachePolicyRelay.CodingKeys()
{
  return &type metadata for CachePolicyRelay.CodingKeys;
}

unint64_t sub_1000231F8()
{
  unint64_t result = qword_1000373D0[0];
  if (!qword_1000373D0[0])
  {
    unint64_t result = swift_getWitnessTable(&unk_100027DEC, &type metadata for CachePolicyRelay.CodingKeys);
    atomic_store(result, qword_1000373D0);
  }

  return result;
}

unint64_t sub_100023240()
{
  unint64_t result = qword_1000375E0[0];
  if (!qword_1000375E0[0])
  {
    unint64_t result = swift_getWitnessTable(&unk_100027EA4, &type metadata for FetchUpNextContentIntent.CodingKeys);
    atomic_store(result, qword_1000375E0);
  }

  return result;
}

unint64_t sub_100023288()
{
  unint64_t result = qword_1000377F0[0];
  if (!qword_1000377F0[0])
  {
    unint64_t result = swift_getWitnessTable(&unk_100027F5C, &type metadata for UpNextContent.CodingKeys);
    atomic_store(result, qword_1000377F0);
  }

  return result;
}

unint64_t sub_1000232D0()
{
  unint64_t result = qword_100037A00[0];
  if (!qword_100037A00[0])
  {
    unint64_t result = swift_getWitnessTable(&unk_100028014, &type metadata for UpNextReturnType.CodingKeys);
    atomic_store(result, qword_100037A00);
  }

  return result;
}

unint64_t sub_100023318()
{
  unint64_t result = qword_100037C10[0];
  if (!qword_100037C10[0])
  {
    unint64_t result = swift_getWitnessTable(&unk_1000280CC, &type metadata for FetchFeaturedContentIntent.CodingKeys);
    atomic_store(result, qword_100037C10);
  }

  return result;
}

unint64_t sub_100023360()
{
  unint64_t result = qword_100037E20[0];
  if (!qword_100037E20[0])
  {
    unint64_t result = swift_getWitnessTable(&unk_100028184, &type metadata for FeaturedContent.CodingKeys);
    atomic_store(result, qword_100037E20);
  }

  return result;
}

unint64_t sub_1000233A8()
{
  unint64_t result = qword_100038030[0];
  if (!qword_100038030[0])
  {
    unint64_t result = swift_getWitnessTable(&unk_10002823C, &type metadata for FeaturedReturnType.CodingKeys);
    atomic_store(result, qword_100038030);
  }

  return result;
}

unint64_t sub_1000233F0()
{
  unint64_t result = qword_100038140;
  if (!qword_100038140)
  {
    unint64_t result = swift_getWitnessTable(&unk_1000281AC, &type metadata for FeaturedReturnType.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_100038140);
  }

  return result;
}

unint64_t sub_100023438()
{
  unint64_t result = qword_100038148[0];
  if (!qword_100038148[0])
  {
    unint64_t result = swift_getWitnessTable(&unk_1000281D4, &type metadata for FeaturedReturnType.CodingKeys);
    atomic_store(result, qword_100038148);
  }

  return result;
}

unint64_t sub_100023480()
{
  unint64_t result = qword_1000381D0;
  if (!qword_1000381D0)
  {
    unint64_t result = swift_getWitnessTable(&unk_1000280F4, &type metadata for FeaturedContent.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1000381D0);
  }

  return result;
}

unint64_t sub_1000234C8()
{
  unint64_t result = qword_1000381D8[0];
  if (!qword_1000381D8[0])
  {
    unint64_t result = swift_getWitnessTable(&unk_10002811C, &type metadata for FeaturedContent.CodingKeys);
    atomic_store(result, qword_1000381D8);
  }

  return result;
}

unint64_t sub_100023510()
{
  unint64_t result = qword_100038260;
  if (!qword_100038260)
  {
    unint64_t result = swift_getWitnessTable(&unk_10002803C, &type metadata for FetchFeaturedContentIntent.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_100038260);
  }

  return result;
}

unint64_t sub_100023558()
{
  unint64_t result = qword_100038268[0];
  if (!qword_100038268[0])
  {
    unint64_t result = swift_getWitnessTable(&unk_100028064, &type metadata for FetchFeaturedContentIntent.CodingKeys);
    atomic_store(result, qword_100038268);
  }

  return result;
}

unint64_t sub_1000235A0()
{
  unint64_t result = qword_1000382F0;
  if (!qword_1000382F0)
  {
    unint64_t result = swift_getWitnessTable(&unk_100027F84, &type metadata for UpNextReturnType.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1000382F0);
  }

  return result;
}

unint64_t sub_1000235E8()
{
  unint64_t result = qword_1000382F8[0];
  if (!qword_1000382F8[0])
  {
    unint64_t result = swift_getWitnessTable(&unk_100027FAC, &type metadata for UpNextReturnType.CodingKeys);
    atomic_store(result, qword_1000382F8);
  }

  return result;
}

unint64_t sub_100023630()
{
  unint64_t result = qword_100038380;
  if (!qword_100038380)
  {
    unint64_t result = swift_getWitnessTable(&unk_100027ECC, &type metadata for UpNextContent.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_100038380);
  }

  return result;
}

unint64_t sub_100023678()
{
  unint64_t result = qword_100038388[0];
  if (!qword_100038388[0])
  {
    unint64_t result = swift_getWitnessTable(&unk_100027EF4, &type metadata for UpNextContent.CodingKeys);
    atomic_store(result, qword_100038388);
  }

  return result;
}

unint64_t sub_1000236C0()
{
  unint64_t result = qword_100038410;
  if (!qword_100038410)
  {
    unint64_t result = swift_getWitnessTable(&unk_100027E14, &type metadata for FetchUpNextContentIntent.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_100038410);
  }

  return result;
}

unint64_t sub_100023708()
{
  unint64_t result = qword_100038418[0];
  if (!qword_100038418[0])
  {
    unint64_t result = swift_getWitnessTable(&unk_100027E3C, &type metadata for FetchUpNextContentIntent.CodingKeys);
    atomic_store(result, qword_100038418);
  }

  return result;
}

unint64_t sub_100023750()
{
  unint64_t result = qword_1000384A0;
  if (!qword_1000384A0)
  {
    unint64_t result = swift_getWitnessTable(&unk_100027D5C, &type metadata for CachePolicyRelay.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1000384A0);
  }

  return result;
}

unint64_t sub_100023798()
{
  unint64_t result = qword_1000384A8[0];
  if (!qword_1000384A8[0])
  {
    unint64_t result = swift_getWitnessTable(&unk_100027D84, &type metadata for CachePolicyRelay.CodingKeys);
    atomic_store(result, qword_1000384A8);
  }

  return result;
}

uint64_t sub_1000237DC()
{
  return swift_deallocObject(v0, 24LL, 7LL);
}

void sub_100023800()
{
  uint64_t Strong = swift_unknownObjectWeakLoadStrong(v0 + 16);
  if (Strong)
  {
    int v2 = (char *)Strong;
    *(_BYTE *)(Strong + OBJC_IVAR____TtC17TVUpNextExtensionP33_CEB3B327E539852F953463821CB150CF11CachePolicy_cacheIsValid) = 0;
    uint64_t v3 = OBJC_IVAR____TtC17TVUpNextExtensionP33_CEB3B327E539852F953463821CB150CF11CachePolicy_ttl;
    uint64_t v4 = *(void *)(Strong + OBJC_IVAR____TtC17TVUpNextExtensionP33_CEB3B327E539852F953463821CB150CF11CachePolicy_ttl);
    if (v4)
    {
      uint64_t v5 = swift_retain(*(void *)(Strong
                                  + OBJC_IVAR____TtC17TVUpNextExtensionP33_CEB3B327E539852F953463821CB150CF11CachePolicy_ttl));
      dispatch thunk of DispatchWorkItem.cancel()(v5);
      swift_release(v4);
      uint64_t v6 = *(void *)&v2[v3];
    }

    else
    {
      uint64_t v6 = 0LL;
    }

    *(void *)&v2[v3] = 0LL;
    swift_release(v6);
  }

uint64_t sub_100023898(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_1000238A8(uint64_t a1)
{
  return swift_release(*(void *)(a1 + 40));
}

uint64_t sub_1000238B0()
{
  return swift_deallocObject(v0, 24LL, 7LL);
}

void sub_1000238D4(uint64_t a1, uint64_t a2)
{
}

uint64_t sub_1000238F0()
{
  return swift_deallocObject(v0, 32LL, 7LL);
}

uint64_t sub_100023918()
{
  uint64_t v2 = *(void *)(v0 + 32);
  char v3 = *(_BYTE *)(v0 + 40);
  uint64_t v4 = swift_task_alloc(dword_100036194);
  __int128 v5 = *(_OWORD *)(v0 + 48);
  __int128 v6 = *(_OWORD *)(v0 + 64);
  *(void *)(v1 + swift_unknownObjectWeakDestroy(v0 + 16) = v4;
  *(void *)uint64_t v4 = v1;
  *(void *)(v4 + 8) = sub_10000A35C;
  *(_OWORD *)(v4 + 632) = v6;
  *(_OWORD *)(v4 + 6swift_unknownObjectWeakDestroy(v0 + 16) = v5;
  *(_BYTE *)(v4 + 540) = v3;
  *(void *)(v4 + 608) = v2;
  return swift_task_switch(sub_100010DF8, 0LL, 0LL);
}

uint64_t sub_100023998(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  __int128 v5 = (void *)swift_task_alloc(dword_1000361A4);
  *(void *)(v2 + swift_unknownObjectWeakDestroy(v0 + 16) = v5;
  void *v5 = v2;
  v5[1] = sub_100008DBC;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_1000361A0 + dword_1000361A0))(a1, v4);
}

unint64_t sub_100023A08()
{
  unint64_t result = qword_1000361B0;
  if (!qword_1000361B0)
  {
    unint64_t result = swift_getWitnessTable(&unk_100027AAC, &type metadata for FetchFeaturedContentIntent);
    atomic_store(result, (unint64_t *)&qword_1000361B0);
  }

  return result;
}

void *sub_100023A4C(void *a1)
{
  uint64_t v2 = a1[1];
  uint64_t v3 = a1[3];
  uint64_t v4 = a1[5];
  uint64_t v5 = a1[7];
  uint64_t v6 = a1[9];
  uint64_t v7 = a1[11];
  uint64_t v8 = a1[13];
  uint64_t v9 = a1[15];
  uint64_t v10 = a1[17];
  uint64_t v12 = a1[19];
  uint64_t v13 = a1[20];
  uint64_t v14 = a1[22];
  uint64_t v15 = a1[23];
  uint64_t v16 = a1[27];
  uint64_t v17 = a1[33];
  uint64_t v18 = a1[35];
  uint64_t v19 = a1[37];
  uint64_t v20 = a1[39];
  uint64_t v21 = a1[41];
  uint64_t v22 = a1[42];
  uint64_t v23 = a1[44];
  uint64_t v24 = a1[46];
  uint64_t v25 = a1[48];
  uint64_t v26 = a1[50];
  uint64_t v27 = a1[52];
  uint64_t v28 = a1[54];
  uint64_t v29 = a1[56];
  uint64_t v30 = a1[57];
  uint64_t v31 = a1[59];
  swift_bridgeObjectRetain(a1[61]);
  swift_bridgeObjectRetain(v2);
  swift_bridgeObjectRetain(v3);
  swift_bridgeObjectRetain(v4);
  swift_bridgeObjectRetain(v5);
  swift_bridgeObjectRetain(v6);
  swift_bridgeObjectRetain(v7);
  swift_bridgeObjectRetain(v8);
  swift_bridgeObjectRetain(v9);
  swift_bridgeObjectRetain(v10);
  swift_bridgeObjectRetain(v12);
  swift_bridgeObjectRetain(v13);
  swift_bridgeObjectRetain(v14);
  swift_bridgeObjectRetain(v15);
  swift_bridgeObjectRetain(v16);
  swift_bridgeObjectRetain(v17);
  swift_bridgeObjectRetain(v18);
  swift_bridgeObjectRetain(v19);
  swift_bridgeObjectRetain(v20);
  swift_bridgeObjectRetain(v21);
  swift_bridgeObjectRetain(v22);
  swift_bridgeObjectRetain(v23);
  swift_bridgeObjectRetain(v24);
  swift_bridgeObjectRetain(v25);
  swift_bridgeObjectRetain(v26);
  swift_bridgeObjectRetain(v27);
  swift_bridgeObjectRetain(v28);
  swift_bridgeObjectRetain(v29);
  swift_bridgeObjectRetain(v30);
  swift_bridgeObjectRetain(v31);
  return a1;
}

void *sub_100023C20(void *a1)
{
  uint64_t v30 = a1[3];
  uint64_t v31 = a1[1];
  uint64_t v28 = a1[7];
  uint64_t v29 = a1[5];
  uint64_t v26 = a1[9];
  uint64_t v23 = a1[13];
  uint64_t v24 = a1[11];
  uint64_t v21 = a1[17];
  uint64_t v22 = a1[15];
  uint64_t v19 = a1[20];
  uint64_t v20 = a1[19];
  uint64_t v17 = a1[23];
  uint64_t v18 = a1[22];
  uint64_t v15 = a1[33];
  uint64_t v16 = a1[27];
  uint64_t v13 = a1[37];
  uint64_t v14 = a1[35];
  uint64_t v12 = a1[39];
  uint64_t v2 = a1[41];
  uint64_t v3 = a1[42];
  uint64_t v4 = a1[44];
  uint64_t v27 = a1[46];
  uint64_t v5 = a1[48];
  uint64_t v6 = a1[50];
  uint64_t v7 = a1[52];
  uint64_t v8 = a1[54];
  uint64_t v9 = a1[56];
  uint64_t v10 = a1[57];
  uint64_t v25 = a1[61];
  swift_bridgeObjectRelease(a1[59]);
  swift_bridgeObjectRelease(v10);
  swift_bridgeObjectRelease(v9);
  swift_bridgeObjectRelease(v8);
  swift_bridgeObjectRelease(v7);
  swift_bridgeObjectRelease(v6);
  swift_bridgeObjectRelease(v5);
  swift_bridgeObjectRelease(v4);
  swift_bridgeObjectRelease(v3);
  swift_bridgeObjectRelease(v2);
  swift_bridgeObjectRelease(v12);
  swift_bridgeObjectRelease(v13);
  swift_bridgeObjectRelease(v14);
  swift_bridgeObjectRelease(v15);
  swift_bridgeObjectRelease(v16);
  swift_bridgeObjectRelease(v17);
  swift_bridgeObjectRelease(v18);
  swift_bridgeObjectRelease(v19);
  swift_bridgeObjectRelease(v20);
  swift_bridgeObjectRelease(v21);
  swift_bridgeObjectRelease(v22);
  swift_bridgeObjectRelease(v23);
  swift_bridgeObjectRelease(v24);
  swift_bridgeObjectRelease(v26);
  swift_bridgeObjectRelease(v28);
  swift_bridgeObjectRelease(v29);
  swift_bridgeObjectRelease(v30);
  swift_bridgeObjectRelease(v31);
  swift_bridgeObjectRelease(v27);
  swift_bridgeObjectRelease(v25);
  return a1;
}

uint64_t sub_100023DF4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v8[0] = a1;
  v8[1] = a2;
  swift_bridgeObjectRetain(a2);
  AnyHashable.init<A>(_:)(v8, &type metadata for String, &protocol witness table for String);
  v7[0] = a3;
  v7[1] = a4;
  swift_bridgeObjectRetain(a4);
  AnyHashable.init<A>(_:)(v7, &type metadata for String, &protocol witness table for String);
  return sub_10000CA0C((uint64_t)v8, (uint64_t)v9);
}

unint64_t sub_100023E8C()
{
  unint64_t result = qword_100036200;
  if (!qword_100036200)
  {
    uint64_t v1 = sub_10000A1FC(&qword_1000361F8);
    sub_100024838( &qword_100036208,  &qword_1000361E8,  (uint64_t)&protocol witness table for String,  (uint64_t)&protocol conformance descriptor for <A> A?);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for <> [A : B], v1);
    atomic_store(result, (unint64_t *)&qword_100036200);
  }

  return result;
}

uint64_t sub_100023F10(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_100023F4C(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_100008A20(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8LL))(a1, v3);
  return a1;
}

uint64_t sub_100023F88(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100008A20(&qword_100036230);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16LL))(a2, a1, v4);
  return a2;
}

uint64_t sub_100023FD4()
{
  swift_release(*(void *)(v0 + 32));
  return swift_deallocObject(v0, 40LL, 7LL);
}

uint64_t sub_100024000(uint64_t a1)
{
  return a1;
}

uint64_t sub_10002402C()
{
  uint64_t v2 = *(void *)(v0 + 32);
  uint64_t v3 = *(void *)(v0 + 120);
  uint64_t v4 = swift_task_alloc(dword_100036244);
  __int128 v5 = *(_OWORD *)(v0 + 104);
  *(void *)(v1 + swift_unknownObjectWeakDestroy(v0 + 16) = v4;
  *(void *)uint64_t v4 = v1;
  *(void *)(v4 + 8) = sub_10000A35C;
  *(void *)(v4 + 424) = v3;
  *(_OWORD *)(v4 + 408) = v5;
  *(void *)(v4 + 392) = v2;
  *(void *)(v4 + 400) = v0 + 40;
  return swift_task_switch(sub_10000E370, 0LL, 0LL);
}

unint64_t sub_1000240AC()
{
  unint64_t result = qword_100036250;
  if (!qword_100036250)
  {
    unint64_t result = swift_getWitnessTable(&unk_100027934, &type metadata for FetchUpNextContentIntent);
    atomic_store(result, (unint64_t *)&qword_100036250);
  }

  return result;
}

void *sub_1000240F0(void *a1)
{
  uint64_t v2 = a1[1];
  uint64_t v3 = a1[3];
  uint64_t v4 = a1[5];
  uint64_t v5 = a1[7];
  uint64_t v6 = a1[11];
  uint64_t v7 = a1[13];
  uint64_t v8 = a1[15];
  uint64_t v9 = a1[17];
  uint64_t v10 = a1[19];
  uint64_t v12 = a1[21];
  uint64_t v13 = a1[23];
  uint64_t v14 = a1[25];
  uint64_t v15 = a1[26];
  uint64_t v16 = a1[27];
  swift_bridgeObjectRetain(a1[28]);
  swift_bridgeObjectRetain(v2);
  swift_bridgeObjectRetain(v3);
  swift_bridgeObjectRetain(v4);
  swift_bridgeObjectRetain(v5);
  swift_bridgeObjectRetain(v6);
  swift_bridgeObjectRetain(v7);
  swift_bridgeObjectRetain(v8);
  swift_bridgeObjectRetain(v9);
  swift_bridgeObjectRetain(v10);
  swift_bridgeObjectRetain(v12);
  swift_bridgeObjectRetain(v13);
  swift_bridgeObjectRetain(v14);
  swift_bridgeObjectRetain(v15);
  swift_bridgeObjectRetain(v16);
  return a1;
}

void *sub_1000241F0(void *a1)
{
  uint64_t v2 = a1[3];
  uint64_t v3 = a1[5];
  uint64_t v4 = a1[7];
  uint64_t v5 = a1[11];
  uint64_t v6 = a1[13];
  uint64_t v7 = a1[15];
  uint64_t v8 = a1[17];
  uint64_t v9 = a1[21];
  uint64_t v10 = a1[23];
  uint64_t v12 = a1[1];
  uint64_t v13 = a1[25];
  uint64_t v14 = a1[26];
  uint64_t v15 = a1[27];
  uint64_t v16 = a1[28];
  swift_bridgeObjectRelease(a1[19]);
  swift_bridgeObjectRelease(v8);
  swift_bridgeObjectRelease(v7);
  swift_bridgeObjectRelease(v6);
  swift_bridgeObjectRelease(v5);
  swift_bridgeObjectRelease(v4);
  swift_bridgeObjectRelease(v3);
  swift_bridgeObjectRelease(v2);
  swift_bridgeObjectRelease(v12);
  swift_bridgeObjectRelease(v9);
  swift_bridgeObjectRelease(v10);
  swift_bridgeObjectRelease(v13);
  swift_bridgeObjectRelease(v14);
  swift_bridgeObjectRelease(v15);
  swift_bridgeObjectRelease(v16);
  return a1;
}

unint64_t sub_1000242F4()
{
  unint64_t result = qword_100038530;
  if (!qword_100038530)
  {
    unint64_t result = swift_getWitnessTable(&unk_100028518, &type metadata for TopShelfRequestEncoder);
    atomic_store(result, (unint64_t *)&qword_100038530);
  }

  return result;
}

unint64_t sub_100024338()
{
  unint64_t result = qword_100038538[0];
  if (!qword_100038538[0])
  {
    unint64_t result = swift_getWitnessTable(&unk_1000284D8, &type metadata for TopShelfNetworkFetcher);
    atomic_store(result, qword_100038538);
  }

  return result;
}

void sub_10002437C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = v2 + 16;
  uint64_t v12 = 0LL;
  unint64_t v13 = 0xE000000000000000LL;
  _StringGuts.grow(_:)(33LL);
  v5._object = (void *)0x80000001000296F0LL;
  v5._countAndFlagsBits = 0xD00000000000001FLL;
  String.append(_:)(v5);
  uint64_t v14 = a2;
  uint64_t v6 = sub_100008A20(&qword_100036270);
  _print_unlocked<A, B>(_:_:)( &v14,  &v12,  v6,  &type metadata for DefaultStringInterpolation,  &protocol witness table for DefaultStringInterpolation);
  unint64_t v7 = v13;
  _s17TVUpNextExtension23TopShelfContentProviderC3logyySSFZ_0(v12, v13);
  swift_bridgeObjectRelease(v7);
  swift_beginAccess(v4, &v12, 0LL, 0LL);
  uint64_t Strong = (void *)swift_unknownObjectWeakLoadStrong(v4);
  if (Strong)
  {
    uint64_t v9 = Strong;
    uint64_t v10 = (void *)(*(uint64_t (**)(void))((swift_isaMask & *Strong) + 0x98LL))();

    if (v10)
    {
      uint64_t v11 = (void *)_convertErrorToNSError(_:)(a2);
      [v10 stackDidErrorWithError:v11];
      swift_unknownObjectRelease(v10);
    }
  }

uint64_t sub_1000244A8()
{
  _Block_release(*(const void **)(v0 + 24));
  return swift_deallocObject(v0, 40LL, 7LL);
}

uint64_t sub_1000244DC()
{
  uint64_t v2 = v0[2];
  uint64_t v3 = (void *)v0[3];
  uint64_t v4 = (void *)v0[4];
  Swift::String v5 = (void *)swift_task_alloc(dword_10003627C);
  *(void *)(v1 + swift_unknownObjectWeakDestroy(v0 + 16) = v5;
  void *v5 = v1;
  v5[1] = sub_10000A35C;
  return ((uint64_t (*)(uint64_t, void *, void *))((char *)&dword_100036278 + dword_100036278))(v2, v3, v4);
}

uint64_t sub_10002454C()
{
  uint64_t v2 = v0[2];
  uint64_t v3 = v0[3];
  uint64_t v4 = (int *)v0[4];
  Swift::String v5 = (void *)swift_task_alloc(dword_10003628C);
  *(void *)(v1 + swift_unknownObjectWeakDestroy(v0 + 16) = v5;
  void *v5 = v1;
  v5[1] = sub_10000A35C;
  return ((uint64_t (*)(uint64_t, uint64_t, int *))((char *)&dword_100036288 + dword_100036288))(v2, v3, v4);
}

uint64_t sub_1000245C8(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = (int *)v1[4];
  unint64_t v7 = (void *)swift_task_alloc(dword_10003629C);
  *(void *)(v2 + swift_unknownObjectWeakDestroy(v0 + 16) = v7;
  *unint64_t v7 = v2;
  v7[1] = sub_10000A35C;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, int *))((char *)&dword_100036298 + dword_100036298))( a1,  v4,  v5,  v6);
}

uint64_t sub_10002464C()
{
  return swift_deallocObject(v0, 32LL, 7LL);
}

uint64_t sub_100024678()
{
  uint64_t v2 = *(const void **)(v0 + 16);
  uint64_t v3 = *(void **)(v0 + 24);
  uint64_t v4 = (void *)swift_task_alloc(dword_1000362B4);
  *(void *)(v1 + swift_unknownObjectWeakDestroy(v0 + 16) = v4;
  *uint64_t v4 = v1;
  v4[1] = sub_10000A35C;
  return ((uint64_t (*)(const void *, void *))((char *)&dword_1000362B0 + dword_1000362B0))(v2, v3);
}

uint64_t sub_1000246E4()
{
  return swift_deallocObject(v0, 40LL, 7LL);
}

uint64_t sub_100024710()
{
  int v2 = *(unsigned __int8 *)(v0 + 16);
  uint64_t v4 = *(void **)(v0 + 24);
  uint64_t v3 = *(void **)(v0 + 32);
  uint64_t v5 = (void *)swift_task_alloc(dword_1000362D4);
  *(void *)(v1 + swift_unknownObjectWeakDestroy(v0 + 16) = v5;
  void *v5 = v1;
  v5[1] = sub_10000A35C;
  return ((uint64_t (*)(int, void *, void *))((char *)&dword_1000362D0 + dword_1000362D0))(v2, v4, v3);
}

uint64_t sub_100024784()
{
  return swift_deallocObject(v0, 48LL, 7LL);
}

unint64_t sub_1000247B0()
{
  unint64_t result = qword_100036300;
  if (!qword_100036300)
  {
    unint64_t result = swift_getWitnessTable(&unk_100027B84, &type metadata for FeaturedContent);
    atomic_store(result, (unint64_t *)&qword_100036300);
  }

  return result;
}

unint64_t sub_1000247F4()
{
  unint64_t result = qword_100036308;
  if (!qword_100036308)
  {
    unint64_t result = swift_getWitnessTable(&unk_1000278E4, &type metadata for CachePolicyRelay);
    atomic_store(result, (unint64_t *)&qword_100036308);
  }

  return result;
}

uint64_t sub_100024838(unint64_t *a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  uint64_t result = *a1;
  if (!result)
  {
    uint64_t v7 = sub_10000A1FC(a2);
    uint64_t result = swift_getWitnessTable(a4, v7);
    atomic_store(result, a1);
  }

  return result;
}

uint64_t sub_100024894(unint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = *a1;
  if (!result)
  {
    uint64_t v6 = sub_10000A1FC(&qword_1000360B0);
    uint64_t result = swift_getWitnessTable(a3, v6);
    atomic_store(result, a1);
  }

  return result;
}

uint64_t sub_1000248F8()
{
  swift_bridgeObjectRelease(*(void *)(v0 + 48));
  swift_release(*(void *)(v0 + 56));
  swift_release(*(void *)(v0 + 72));
  return swift_deallocObject(v0, 80LL, 7LL);
}

uint64_t sub_10002493C()
{
  uint64_t v2 = *(void *)(v0 + 32);
  char v3 = *(_BYTE *)(v0 + 40);
  uint64_t v4 = swift_task_alloc(dword_100036194);
  __int128 v5 = *(_OWORD *)(v0 + 48);
  __int128 v6 = *(_OWORD *)(v0 + 64);
  *(void *)(v1 + swift_unknownObjectWeakDestroy(v0 + 16) = v4;
  *(void *)uint64_t v4 = v1;
  *(void *)(v4 + 8) = sub_100008DBC;
  *(_OWORD *)(v4 + 632) = v6;
  *(_OWORD *)(v4 + 6swift_unknownObjectWeakDestroy(v0 + 16) = v5;
  *(_BYTE *)(v4 + 540) = v3;
  *(void *)(v4 + 608) = v2;
  return swift_task_switch(sub_100010DF8, 0LL, 0LL);
}

unint64_t sub_1000249BC()
{
  unint64_t result = qword_100036348;
  if (!qword_100036348)
  {
    unint64_t result = swift_getWitnessTable(&unk_100027A0C, &type metadata for UpNextContent);
    atomic_store(result, (unint64_t *)&qword_100036348);
  }

  return result;
}

uint64_t sub_100024A00(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result = *a1;
  if (!result)
  {
    uint64_t v6 = a2(255LL);
    uint64_t result = swift_getWitnessTable(a3, v6);
    atomic_store(result, a1);
  }

  return result;
}

uint64_t sub_100024A44()
{
  swift_bridgeObjectRelease(*(void *)(v0 + 88));
  swift_release(*(void *)(v0 + 104));
  swift_release(*(void *)(v0 + 120));
  return swift_deallocObject(v0, 128LL, 7LL);
}

uint64_t sub_100024A88(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_100008A20(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32LL))(a2, a1, v5);
  return a2;
}

unint64_t sub_100024ACC()
{
  unint64_t result = qword_1000363C0;
  if (!qword_1000363C0)
  {
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for String, &type metadata for String);
    atomic_store(result, (unint64_t *)&qword_1000363C0);
  }

  return result;
}

unint64_t sub_100024B10()
{
  unint64_t result = qword_1000363D0;
  if (!qword_1000363D0)
  {
    uint64_t v1 = sub_10000A134(255LL, &qword_1000363C8, &OBJC_CLASS___NSString_ptr);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for NSObject, v1);
    atomic_store(result, (unint64_t *)&qword_1000363D0);
  }

  return result;
}

uint64_t sub_100024B68(__int128 *a1, uint64_t a2)
{
  __int128 v2 = *a1;
  __int128 v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + swift_unknownObjectWeakDestroy(v0 + 16) = v3;
  return a2;
}

uint64_t sub_100024B80(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(void *)(a1 - 8) + 82LL) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t *sub_100024B98(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = *(void *)(a1 - 8);
  if ((*(_DWORD *)(v3 + 80) & 0x20000) != 0)
  {
    uint64_t v4 = swift_slowAlloc(*(void *)(v3 + 64), *(_DWORD *)(v3 + 80));
    *a2 = v4;
    return (uint64_t *)v4;
  }

  return a2;
}

ValueMetadata *type metadata accessor for TopShelfNetworkFetcher()
{
  return &type metadata for TopShelfNetworkFetcher;
}

ValueMetadata *type metadata accessor for TopShelfRequestEncoder()
{
  return &type metadata for TopShelfRequestEncoder;
}

uint64_t sub_100024BF8(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_10002D3C8, 1LL);
}

unint64_t sub_100024C0C()
{
  unint64_t result = qword_1000385C0[0];
  if (!qword_1000385C0[0])
  {
    unint64_t result = swift_getWitnessTable(&unk_100028558, &type metadata for TopShelfRequestEncoder.PropertyScope);
    atomic_store(result, qword_1000385C0);
  }

  return result;
}

unint64_t sub_100024C50()
{
  unint64_t result = qword_1000386D8[0];
  if (!qword_1000386D8[0])
  {
    unint64_t result = swift_getWitnessTable( &unk_1000285C4,  &type metadata for TopShelfRequestEncoder.PropertyScope.IgnoreCacheProperty);
    atomic_store(result, qword_1000386D8);
  }

  return result;
}

void *sub_100024C94(void *a1)
{
  uint64_t v1 = a1;
  if ((*(_BYTE *)(*(void *)(a1[3] - 8LL) + 82LL) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (void *)v2;
  }

  return v1;
}

uint64_t sub_100024CD0()
{
  uint64_t v1 = type metadata accessor for NetRequest(0LL);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  return swift_deallocObject(v0, v5, v6);
}

void sub_100024D30(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
}

uint64_t sub_100024D94(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result = *a1;
  if (!result)
  {
    uint64_t v6 = sub_10000A1FC(a2);
    uint64_t result = swift_getWitnessTable(a3, v6);
    atomic_store(result, a1);
  }

  return result;
}

uint64_t sub_100024DD4()
{
  return sub_100024E00((void (*)(void))&_swift_release, 48LL);
}

uint64_t sub_100024DE4(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_10000D7D4( a1,  a2,  a3,  a4,  *(void (**)(void))(v4 + 16),  *(void *)(v4 + 24),  *(void *)(v4 + 32),  *(void *)(v4 + 40));
}

uint64_t sub_100024DF0()
{
  return sub_100024E00((void (*)(void))&_swift_bridgeObjectRelease, 49LL);
}

uint64_t sub_100024E00(void (*a1)(void), uint64_t a2)
{
  return swift_deallocObject(v2, a2, 7LL);
}

void sub_100024E44(void *a1, uint64_t a2)
{
  uint64_t v6 = *(void (**)(void, unint64_t, void, uint64_t))(v2 + 16);
  uint64_t v5 = *(void *)(v2 + 24);
  uint64_t v8 = *(void *)(v2 + 32);
  uint64_t v7 = *(void **)(v2 + 40);
  uint64_t v9 = *(unsigned __int8 *)(v2 + 48);
  _StringGuts.grow(_:)(29LL);
  swift_bridgeObjectRelease(0xE000000000000000LL);
  aBlock = (void **)0xD00000000000001BLL;
  unint64_t v39 = 0x8000000100029A70LL;
  uint64_t v44 = a2;
  swift_errorRetain(a2);
  uint64_t v10 = sub_100008A20(&qword_100036430);
  v11._countAndFlagsBits = String.init<A>(describing:)(&v44, v10);
  object = v11._object;
  String.append(_:)(v11);
  swift_bridgeObjectRelease(object);
  _s17TVUpNextExtension23TopShelfContentProviderC3logyySSFZ_0(0xD00000000000001BLL, 0x8000000100029A70LL);
  swift_bridgeObjectRelease(0x8000000100029A70LL);
  id v13 = [a1 features];
  uint64_t v14 = sub_10000A134(0LL, &qword_1000363A0, &OBJC_CLASS___NSNumber_ptr);
  uint64_t v15 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)( v13,  &type metadata for String,  v14,  &protocol witness table for String);

  uint64_t v16 = static String._unconditionallyBridgeFromObjectiveC(_:)(WLKServerConfigurationResponseKeyFeaturesTopShelf);
  uint64_t v18 = v17;
  if (*(void *)(v15 + 16) && (unint64_t v19 = sub_1000142D8(v16, v17), (v20 & 1) != 0))
  {
    id v21 = *(id *)(*(void *)(v15 + 56) + 8 * v19);
    swift_bridgeObjectRelease(v15);
    swift_bridgeObjectRelease(v18);
    if (([v21 BOOLValue] & 1) == 0)
    {
      unint64_t v35 = sub_10002544C();
      uint64_t v36 = swift_allocError(&type metadata for TopShelfContentProviderError, v35, 0LL, 0LL);
      *uint64_t v37 = 0;
      v6(0LL, 0xF000000000000000LL, 0LL, v36);
      swift_errorRelease(v36);
      goto LABEL_13;
    }
  }

  else
  {
    swift_bridgeObjectRelease(v15);
    swift_bridgeObjectRelease(v18);
  }

  _StringGuts.grow(_:)(42LL);
  swift_bridgeObjectRelease(0xE000000000000000LL);
  aBlock = (void **)0xD000000000000013LL;
  unint64_t v39 = 0x8000000100029A90LL;
  v22._countAndFlagsBits = v8;
  v22._object = v7;
  String.append(_:)(v22);
  v23._object = (void *)0x8000000100029AB0LL;
  v23._countAndFlagsBits = 0xD000000000000013LL;
  String.append(_:)(v23);
  if ((_DWORD)v9) {
    uint64_t v24 = 1702195828LL;
  }
  else {
    uint64_t v24 = 0x65736C6166LL;
  }
  if ((_DWORD)v9) {
    unint64_t v25 = 0xE400000000000000LL;
  }
  else {
    unint64_t v25 = 0xE500000000000000LL;
  }
  unint64_t v26 = v25;
  String.append(_:)(*(Swift::String *)&v24);
  swift_bridgeObjectRelease(v25);
  _s17TVUpNextExtension23TopShelfContentProviderC3logyySSFZ_0((uint64_t)aBlock, v39);
  swift_bridgeObjectRelease(v39);
  id v27 = objc_allocWithZone(&OBJC_CLASS___WLKTopShelfNetworkOperation);
  swift_bridgeObjectRetain(v7);
  NSString v28 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v7);
  id v29 = [v27 initWithEndPoint:v28 queryParameters:0 ignoreCache:v9];

  uint64_t v30 = swift_allocObject(&unk_1000324D8, 24LL, 7LL);
  swift_unknownObjectWeakInit(v30 + 16, v29);
  uint64_t v31 = (void *)swift_allocObject(&unk_100032500, 40LL, 7LL);
  v31[2] = v30;
  v31[3] = v6;
  v31[4] = v5;
  uint64_t v42 = sub_100025288;
  uint64_t v43 = v31;
  aBlock = _NSConcreteStackBlock;
  unint64_t v39 = 1107296256LL;
  uint64_t v40 = sub_10000D974;
  uint64_t v41 = &unk_100032518;
  uint64_t v32 = _Block_copy(&aBlock);
  uint64_t v33 = v43;
  id v34 = v29;
  swift_retain(v30);
  swift_retain(v5);
  sub_10002543C((uint64_t)sub_100025288, (uint64_t)v31);
  swift_release(v33);
  [v34 setCompletionBlock:v32];
  _Block_release(v32);
  swift_release(v31);

  id v21 = [(id)objc_opt_self(NSOperationQueue) wlkDefaultQueue];
  [v21 addOperation:v34];
  swift_release(v30);

LABEL_13:
}

uint64_t sub_10002525C()
{
  return swift_deallocObject(v0, 40LL, 7LL);
}

uint64_t sub_100025288()
{
  uint64_t v1 = *(void (**)(uint64_t, unint64_t, id, id))(v0 + 24);
  uint64_t v2 = *(void *)(v0 + 16) + 16LL;
  swift_beginAccess(v2, v20, 0LL, 0LL);
  uint64_t Strong = (void *)swift_unknownObjectWeakLoadStrong(v2);
  _StringGuts.grow(_:)(26LL);
  swift_bridgeObjectRelease(0xE000000000000000LL);
  uint64_t v18 = 0xD000000000000018LL;
  unint64_t v19 = 0x8000000100029AD0LL;
  if (Strong) {
    id v4 = [Strong error];
  }
  else {
    id v4 = 0LL;
  }
  id v17 = v4;
  uint64_t v5 = sub_100008A20(&qword_100036430);
  v6._countAndFlagsBits = String.init<A>(describing:)(&v17, v5);
  object = v6._object;
  String.append(_:)(v6);
  swift_bridgeObjectRelease(object);
  unint64_t v8 = v19;
  _s17TVUpNextExtension23TopShelfContentProviderC3logyySSFZ_0(v18, v19);
  swift_bridgeObjectRelease(v8);
  if (Strong)
  {
    id v9 = objc_msgSend(Strong, "data", v17);
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
      unint64_t v13 = v12;
    }

    else
    {
      uint64_t v11 = 0LL;
      unint64_t v13 = 0xF000000000000000LL;
    }

    id v15 = [Strong responseStatusCode];
    id v14 = [Strong error];
  }

  else
  {
    id v14 = 0LL;
    uint64_t v11 = 0LL;
    id v15 = 0LL;
    unint64_t v13 = 0xF000000000000000LL;
  }

  v1(v11, v13, v15, v14);

  sub_100025490(v11, v13);
  return swift_errorRelease(v14);
}

uint64_t sub_10002543C(uint64_t result, uint64_t a2)
{
  if (result) {
    return swift_retain(a2);
  }
  return result;
}

unint64_t sub_10002544C()
{
  unint64_t result = qword_100036438;
  if (!qword_100036438)
  {
    unint64_t result = swift_getWitnessTable(&unk_100027804, &type metadata for TopShelfContentProviderError);
    atomic_store(result, (unint64_t *)&qword_100036438);
  }

  return result;
}

uint64_t sub_100025490(uint64_t result, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_1000254A4(result, a2);
  }
  return result;
}

uint64_t sub_1000254A4(uint64_t result, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2) {
      return result;
    }
    swift_release(result);
  }

  return swift_release(a2 & 0x3FFFFFFFFFFFFFFFLL);
}

uint64_t sub_1000254E8(uint64_t result, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2) {
      return result;
    }
    swift_retain(result);
  }

  return swift_retain(a2 & 0x3FFFFFFFFFFFFFFFLL);
}

ValueMetadata *type metadata accessor for TopShelfRequestEncoder.PropertyScope.IgnoreCacheProperty()
{
  return &type metadata for TopShelfRequestEncoder.PropertyScope.IgnoreCacheProperty;
}

ValueMetadata *type metadata accessor for TopShelfRequestEncoder.PropertyScope()
{
  return &type metadata for TopShelfRequestEncoder.PropertyScope;
}

void *sub_10002554C()
{
  return &protocol witness table for NetResponse;
}

void sub_100025558()
{
}

id objc_msgSend_URLWithString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "URLWithString:");
}

id objc_msgSend__fetchFeaturedContentWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_fetchFeaturedContentWithCompletionHandler:");
}

id objc_msgSend__fetchUpNextContentWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_fetchUpNextContentWithCompletionHandler:");
}

id objc_msgSend__imageName(void *a1, const char *a2, ...)
{
  return _[a1 _imageName];
}

id objc_msgSend__initializeTopShelfContentProvider(void *a1, const char *a2, ...)
{
  return _[a1 _initializeTopShelfContentProvider];
}

id objc_msgSend__removeTopShelfItemWithIdentifier_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_removeTopShelfItemWithIdentifier:completionHandler:");
}

id objc_msgSend__setImageName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setImageName:");
}

id objc_msgSend__setTitle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setTitle:");
}

id objc_msgSend__setUserInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setUserInfo:");
}

id objc_msgSend__showMediaNotAllowedByProfileAlert(void *a1, const char *a2, ...)
{
  return _[a1 _showMediaNotAllowedByProfileAlert];
}

id objc_msgSend__showUpNext(void *a1, const char *a2, ...)
{
  return _[a1 _showUpNext];
}

id objc_msgSend__userInfo(void *a1, const char *a2, ...)
{
  return _[a1 _userInfo];
}

id objc_msgSend__validateRestrictionsForPurchase_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_validateRestrictionsForPurchase:");
}

id objc_msgSend_absoluteString(void *a1, const char *a2, ...)
{
  return _[a1 absoluteString];
}

id objc_msgSend_acquireWithProperties_completionBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "acquireWithProperties:completionBlock:");
}

id objc_msgSend_acquisitionPropertiesWithBuyParams_urlbagKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "acquisitionPropertiesWithBuyParams:urlbagKey:");
}

id objc_msgSend_addFilterPredicate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addFilterPredicate:");
}

id objc_msgSend_addObserver_selector_name_object_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObserver:selector:name:object:");
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_artworkURLFromTemplate_forSize_cropCode_format_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "artworkURLFromTemplate:forSize:cropCode:format:");
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return _[a1 BOOLValue];
}

id objc_msgSend_bundleWithIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bundleWithIdentifier:");
}

id objc_msgSend_buttonImageForState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "buttonImageForState:");
}

id objc_msgSend_buttonTitleForState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "buttonTitleForState:");
}

id objc_msgSend_buyParameters(void *a1, const char *a2, ...)
{
  return _[a1 buyParameters];
}

id objc_msgSend_contentProvider(void *a1, const char *a2, ...)
{
  return _[a1 contentProvider];
}

id objc_msgSend_contentProviderStartRetryCount(void *a1, const char *a2, ...)
{
  return _[a1 contentProviderStartRetryCount];
}

id objc_msgSend_contentProviderState(void *a1, const char *a2, ...)
{
  return _[a1 contentProviderState];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return _[a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return _[a1 count];
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_createWithPageId_andPageType_andEventData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createWithPageId:andPageType:andEventData:");
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return _[a1 date];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return _[a1 defaultCenter];
}

id objc_msgSend_defaultWorkspace(void *a1, const char *a2, ...)
{
  return _[a1 defaultWorkspace];
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_fetchFeaturedContentWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchFeaturedContentWithCompletion:");
}

id objc_msgSend_fetchUpNextContentWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchUpNextContentWithCompletion:");
}

id objc_msgSend_forceGDPRConsentStatus_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "forceGDPRConsentStatus:");
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return _[a1 identifier];
}

id objc_msgSend_initWithItemIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithItemIdentifier:");
}

id objc_msgSend_initWithSubscriptionDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithSubscriptionDictionary:");
}

id objc_msgSend_initWithSuiteName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithSuiteName:");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_items(void *a1, const char *a2, ...)
{
  return _[a1 items];
}

id objc_msgSend_lastKnownContent(void *a1, const char *a2, ...)
{
  return _[a1 lastKnownContent];
}

id objc_msgSend_lastPageIdRecorded(void *a1, const char *a2, ...)
{
  return _[a1 lastPageIdRecorded];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return _[a1 length];
}

id objc_msgSend_lightWeightUserHasActiveAccount(void *a1, const char *a2, ...)
{
  return _[a1 lightWeightUserHasActiveAccount];
}

id objc_msgSend_localizedStringForKey_value_table_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localizedStringForKey:value:table:");
}

id objc_msgSend_longLongValue(void *a1, const char *a2, ...)
{
  return _[a1 longLongValue];
}

id objc_msgSend_mainBundle(void *a1, const char *a2, ...)
{
  return _[a1 mainBundle];
}

id objc_msgSend_movieRentalsQuery(void *a1, const char *a2, ...)
{
  return _[a1 movieRentalsQuery];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return _[a1 mutableCopy];
}

id objc_msgSend_numberWithDouble_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithDouble:");
}

id objc_msgSend_numberWithUnsignedInteger_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithUnsignedInteger:");
}

id objc_msgSend_objectForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKey:");
}

id objc_msgSend_openURL_withOptions_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "openURL:withOptions:error:");
}

id objc_msgSend_physicalNetworkAvailable(void *a1, const char *a2, ...)
{
  return _[a1 physicalNetworkAvailable];
}

id objc_msgSend_playAction(void *a1, const char *a2, ...)
{
  return _[a1 playAction];
}

id objc_msgSend_postCrossProcessNotificationWithBuyParams_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "postCrossProcessNotificationWithBuyParams:error:");
}

id objc_msgSend_predicateMatchingPredicates_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateMatchingPredicates:");
}

id objc_msgSend_predicateWithValue_forProperty_comparisonType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateWithValue:forProperty:comparisonType:");
}

id objc_msgSend_purchaseItemWithBuyParams_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "purchaseItemWithBuyParams:completion:");
}

id objc_msgSend_recordClick_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "recordClick:");
}

id objc_msgSend_recordImpressionsWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "recordImpressionsWithCompletionHandler:");
}

id objc_msgSend_recordPage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "recordPage:");
}

id objc_msgSend_removeObserver_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObserver:");
}

id objc_msgSend_removeObserver_name_object_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObserver:name:object:");
}

id objc_msgSend_saveToTrackerWithUserInfo_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "saveToTrackerWithUserInfo:completionHandler:");
}

id objc_msgSend_sendRequestForCanonicalID_action_confirmationShouldWaitCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendRequestForCanonicalID:action:confirmationShouldWaitCompletion:");
}

id objc_msgSend_sendRequestForDeleteID_isContinueWatching_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendRequestForDeleteID:isContinueWatching:");
}

id objc_msgSend_sendRequestForItemID_itemType_channelID_adamID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendRequestForItemID:itemType:channelID:adamID:");
}

id objc_msgSend_setContentChange_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContentChange:");
}

id objc_msgSend_setContentProvider_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContentProvider:");
}

id objc_msgSend_setContentProviderStartRetryCount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContentProviderStartRetryCount:");
}

id objc_msgSend_setContentProviderState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContentProviderState:");
}

id objc_msgSend_setItemIdentifiersToRemove_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setItemIdentifiersToRemove:");
}

id objc_msgSend_setItemUpdates_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setItemUpdates:");
}

id objc_msgSend_setLastKnownContent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLastKnownContent:");
}

id objc_msgSend_setLastPageIdRecorded_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLastPageIdRecorded:");
}

id objc_msgSend_setPlayAction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPlayAction:");
}

id objc_msgSend_setSuccess_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSuccess:");
}

id objc_msgSend_setWithObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWithObject:");
}

id objc_msgSend_setupNetworkMonitoring(void *a1, const char *a2, ...)
{
  return _[a1 setupNetworkMonitoring];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return _[a1 sharedInstance];
}

id objc_msgSend_startTopShelfContentProvider(void *a1, const char *a2, ...)
{
  return _[a1 startTopShelfContentProvider];
}

id objc_msgSend_startWithDeveloperMode_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startWithDeveloperMode:completionHandler:");
}

id objc_msgSend_timeIntervalSinceDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "timeIntervalSinceDate:");
}

id objc_msgSend_timeIntervalSinceReferenceDate(void *a1, const char *a2, ...)
{
  return _[a1 timeIntervalSinceReferenceDate];
}

id objc_msgSend_toggleUpNextStateForItem_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "toggleUpNextStateForItem:completion:");
}

id objc_msgSend_topShelfContentDidChange(void *a1, const char *a2, ...)
{
  return _[a1 topShelfContentDidChange];
}

id objc_msgSend_tvun_isExpired(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "tvun_isExpired");
}

id objc_msgSend_updateGDPRConsentStatus(void *a1, const char *a2, ...)
{
  return _[a1 updateGDPRConsentStatus];
}

id objc_msgSend_validateRestrictionForSetting_allowInteraction_withCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "validateRestrictionForSetting:allowInteraction:withCompletion:");
}

id objc_msgSend_valueForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "valueForKey:");
}

id objc_msgSend_valueForProperty_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "valueForProperty:");
}

id objc_msgSend_wlk_dictionaryForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "wlk_dictionaryForKey:");
}

id objc_msgSend_wlk_setObjectUnlessNil_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "wlk_setObjectUnlessNil:forKey:");
}

id objc_msgSend_wlk_stringForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "wlk_stringForKey:");
}
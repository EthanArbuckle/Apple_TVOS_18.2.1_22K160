id sub_1000017E0(double a1)
{
  void *v2;
  void *v3;
  id v4;
  double v5;
  NSString *v6;
  if ((sub_100014948() & 1) != 0) {
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[HUDConfiguration sharedInstance](&OBJC_CLASS___HUDConfiguration, "sharedInstance"));
  }
  else {
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](&OBJC_CLASS___HTPrefs, "sharedPrefs"));
  }
  v3 = v2;
  v4 = [v2 runloopHangTimeoutDurationMSec];

  v5 = (double)(unint64_t)v4;
  if ((double)(unint64_t)v4 <= a1) {
    v6 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%.f+ ms",  v5,  (double)(unint64_t)v4);
  }
  else {
    v6 = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%.f ms", v5, *(void *)&a1);
  }
  return (id)objc_claimAutoreleasedReturnValue(v6);
}

void sub_100001B6C(uint64_t a1, double a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = *(dispatch_queue_s **)(v2 + 40);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_100001BD0;
  v4[3] = &unk_100028690;
  v4[4] = v2;
  *(double *)&v4[5] = a2;
  dispatch_sync(v3, v4);
}

void sub_100001BD0(uint64_t a1)
{
  id v2 = sub_1000017E0(*(double *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v5 = *(void **)(a1 + 32);
  v4 = (id *)(a1 + 32);
  [v5 setString:v3];

  id v6 = sub_1000031C4();
  v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    sub_100015804(v4, v7);
  }
}

void sub_100001C48(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = *(dispatch_queue_s **)(v1 + 40);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100001CA8;
  block[3] = &unk_1000286E0;
  block[4] = v1;
  dispatch_sync(v2, block);
}

void sub_100001CA8(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = *(void **)(v1 + 16);
  *(void *)(v1 + 16) = 0LL;
}

void sub_100001D64(void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
}

  ;
}

void sub_100001E5C(id a1)
{
  uint64_t v1 = objc_alloc_init(&OBJC_CLASS___HUDAnimator);
  id v2 = (void *)qword_100036490;
  qword_100036490 = (uint64_t)v1;
}

void sub_100001F98(uint64_t a1)
{
  v3 = objc_alloc_init(&OBJC_CLASS___HUDAnimation);
  -[HUDAnimation setFromValue:](v3, "setFromValue:", *(double *)(a1 + 64));
  -[HUDAnimation setToValue:](v3, "setToValue:", *(double *)(a1 + 72));
  -[HUDAnimation setStartTime:](v3, "setStartTime:", CACurrentMediaTime());
  -[HUDAnimation startTime](v3, "startTime");
  -[HUDAnimation setEndTime:](v3, "setEndTime:", v2 + *(double *)(a1 + 80));
  -[HUDAnimation setUpdateBlock:](v3, "setUpdateBlock:", *(void *)(a1 + 48));
  -[HUDAnimation setCompletionBlock:](v3, "setCompletionBlock:", *(void *)(a1 + 56));
  -[HUDAnimation setIdentifier:](v3, "setIdentifier:", *(void *)(a1 + 32));
  [*(id *)(*(void *)(a1 + 40) + 8) addObject:v3];
}

void sub_1000020D4(uint64_t a1)
{
  double v2 = *(void **)(a1 + 40);
  v3 = *(void **)(*(void *)(a1 + 32) + 8LL);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_100002248;
  v11[3] = &unk_100028778;
  id v12 = v2;
  id v4 = [v3 indexOfObjectPassingTest:v11];
  if (v4 != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    id v5 = v4;
    id v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(a1 + 32) + 8) objectAtIndexedSubscript:v4]);
    v7 = objc_alloc_init(&OBJC_CLASS___HUDAnimation);
    double v8 = CACurrentMediaTime();
    objc_msgSend(v6, "valueAtTime:");
    -[HUDAnimation setFromValue:](v7, "setFromValue:");
    -[HUDAnimation setToValue:](v7, "setToValue:", *(double *)(a1 + 48));
    -[HUDAnimation setStartTime:](v7, "setStartTime:", v8);
    -[HUDAnimation setEndTime:](v7, "setEndTime:", v8 + *(double *)(a1 + 56));
    v9 = (void *)objc_claimAutoreleasedReturnValue([v6 updateBlock]);
    -[HUDAnimation setUpdateBlock:](v7, "setUpdateBlock:", v9);

    v10 = (void *)objc_claimAutoreleasedReturnValue([v6 completionBlock]);
    -[HUDAnimation setCompletionBlock:](v7, "setCompletionBlock:", v10);

    -[HUDAnimation setRetargeted:](v7, "setRetargeted:", 1LL);
    -[HUDAnimation setIdentifier:](v7, "setIdentifier:", *(void *)(a1 + 40));
    [*(id *)(*(void *)(a1 + 32) + 8) replaceObjectAtIndex:v5 withObject:v7];
  }
}

id sub_100002248(uint64_t a1, void *a2)
{
  v3 = (void *)objc_claimAutoreleasedReturnValue([a2 identifier]);
  id v4 = [v3 isEqual:*(void *)(a1 + 32)];

  return v4;
}

void sub_100002304(uint64_t a1)
{
  double v2 = *(void **)(a1 + 40);
  v3 = *(void **)(*(void *)(a1 + 32) + 8LL);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_100002470;
  v10[3] = &unk_100028778;
  id v11 = v2;
  id v4 = [v3 indexOfObjectPassingTest:v10];
  if (v4 != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    id v5 = v4;
    id v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(a1 + 32) + 8) objectAtIndexedSubscript:v4]);
    v7 = objc_alloc_init(&OBJC_CLASS___HUDAnimation);
    [v6 fromValue];
    -[HUDAnimation setFromValue:](v7, "setFromValue:");
    [v6 toValue];
    -[HUDAnimation setToValue:](v7, "setToValue:");
    [v6 startTime];
    -[HUDAnimation setStartTime:](v7, "setStartTime:");
    [v6 endTime];
    -[HUDAnimation setEndTime:](v7, "setEndTime:");
    double v8 = (void *)objc_claimAutoreleasedReturnValue([v6 updateBlock]);
    -[HUDAnimation setUpdateBlock:](v7, "setUpdateBlock:", v8);

    v9 = (void *)objc_claimAutoreleasedReturnValue([v6 completionBlock]);
    -[HUDAnimation setCompletionBlock:](v7, "setCompletionBlock:", v9);

    -[HUDAnimation setCanceled:](v7, "setCanceled:", 1LL);
    -[HUDAnimation setIdentifier:](v7, "setIdentifier:", *(void *)(a1 + 40));
    [*(id *)(*(void *)(a1 + 32) + 8) replaceObjectAtIndex:v5 withObject:v7];
  }
}

id sub_100002470(uint64_t a1, void *a2)
{
  v3 = (void *)objc_claimAutoreleasedReturnValue([a2 identifier]);
  id v4 = [v3 isEqual:*(void *)(a1 + 32)];

  return v4;
}

void sub_100002508(uint64_t a1)
{
  if ([*(id *)(*(void *)(a1 + 32) + 8) count])
  {
    if (!*(void *)(*(void *)(a1 + 32) + 24LL))
    {
      uint64_t v2 = objc_claimAutoreleasedReturnValue( +[CADisplayLink displayLinkWithTarget:selector:]( &OBJC_CLASS___CADisplayLink,  "displayLinkWithTarget:selector:"));
      uint64_t v3 = *(void *)(a1 + 32);
      id v4 = *(void **)(v3 + 24);
      *(void *)(v3 + 24) = v2;

      id v5 = objc_alloc(&OBJC_CLASS___NSThread);
      v7[0] = _NSConcreteStackBlock;
      v7[1] = 3221225472LL;
      v7[2] = sub_100002600;
      v7[3] = &unk_1000286E0;
      v7[4] = *(void *)(a1 + 32);
      id v6 = -[NSThread initWithBlock:](v5, "initWithBlock:", v7);
      CAFrameRateRange v8 = CAFrameRateRangeMake(30.0, 30.0, 30.0);
      objc_msgSend( *(id *)(*(void *)(a1 + 32) + 24),  "setPreferredFrameRateRange:",  *(double *)&v8.minimum,  *(double *)&v8.maximum,  *(double *)&v8.preferred);
      -[NSThread setQualityOfService:](v6, "setQualityOfService:", 33LL);
      -[NSThread setName:](v6, "setName:", @"com.apple.hangtracerd.HUDAnimator");
      -[NSThread start](v6, "start");
    }
  }
}

void sub_100002600(uint64_t a1)
{
  uint64_t v1 = *(void **)(*(void *)(a1 + 32) + 24LL);
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop currentRunLoop](&OBJC_CLASS___NSRunLoop, "currentRunLoop"));
  [v1 addToRunLoop:v2 forMode:NSDefaultRunLoopMode];

  id v3 = (id)objc_claimAutoreleasedReturnValue(+[NSRunLoop currentRunLoop](&OBJC_CLASS___NSRunLoop, "currentRunLoop"));
  [v3 run];
}

void sub_100002808( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, char a31)
{
}

uint64_t sub_100002838(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_100002848(uint64_t a1)
{
}

void sub_100002850(void *a1)
{
  id v10 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1[4] + 8) indexesOfObjectsPassingTest:&stru_100028808]);
  uint64_t v2 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1[4] + 8), "objectsAtIndexes:"));
  uint64_t v3 = *(void *)(a1[5] + 8LL);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  id v5 = *(void **)(a1[4] + 8LL);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_100002988;
  v11[3] = &unk_100028828;
  void v11[4] = a1[8];
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 indexesOfObjectsPassingTest:v11]);
  if ([v6 count])
  {
    uint64_t v7 = objc_claimAutoreleasedReturnValue([*(id *)(a1[4] + 8) objectsAtIndexes:v6]);
    uint64_t v8 = *(void *)(a1[6] + 8LL);
    v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;

    [*(id *)(a1[4] + 8) removeObjectsAtIndexes:v6];
    if (![*(id *)(a1[4] + 8) count]) {
      *(_BYTE *)(*(void *)(a1[7] + 8LL) + 24LL) = 1;
    }
  }
}

BOOL sub_10000296C(id a1, HUDAnimation *a2, unint64_t a3, BOOL *a4)
{
  return !-[HUDAnimation canceled](a2, "canceled", a3, a4);
}

uint64_t sub_100002988(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 endTime];
  else {
    uint64_t v5 = (uint64_t)[v3 canceled];
  }

  return v5;
}

void sub_1000029D8(uint64_t a1)
{
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  id v2 = *(id *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL);
  id v3 = [v2 countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v22;
    do
    {
      for (i = 0LL; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v22 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void **)(*((void *)&v21 + 1) + 8LL * (void)i);
        uint64_t v8 = (void (**)(void))objc_claimAutoreleasedReturnValue([v7 updateBlock]);
        [v7 valueAtTime:*(double *)(a1 + 48)];
        v8[2](v8);
      }

      id v4 = [v2 countByEnumeratingWithState:&v21 objects:v26 count:16];
    }

    while (v4);
  }

  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  id v9 = *(id *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL);
  id v10 = [v9 countByEnumeratingWithState:&v17 objects:v25 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v18;
    do
    {
      for (j = 0LL; j != v11; j = (char *)j + 1)
      {
        if (*(void *)v18 != v12) {
          objc_enumerationMutation(v9);
        }
        v14 = *(void **)(*((void *)&v17 + 1) + 8LL * (void)j);
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "completionBlock", (void)v17));

        if (v15)
        {
          v16 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue([v14 completionBlock]);
          ((void (**)(void, void, id))v16)[2]( v16,  [v14 canceled] ^ 1,  objc_msgSend(v14, "retargeted"));
        }
      }

      id v11 = [v9 countByEnumeratingWithState:&v17 objects:v25 count:16];
    }

    while (v11);
  }
}

void sub_100002BE0(uint64_t a1)
{
  if (![*(id *)(*(void *)(a1 + 32) + 8) count])
  {
    [*(id *)(*(void *)(a1 + 32) + 24) invalidate];
    uint64_t v2 = *(void *)(a1 + 32);
    id v3 = *(void **)(v2 + 24);
    *(void *)(v2 + 24) = 0LL;
  }

id sub_100002D78(uint64_t a1, void *a2, unint64_t a3)
{
  double v6 = sub_100014BA8((unint64_t)(v5 * 1000.0));
  double v7 = sub_100014B48((unint64_t)(v6 - (double)a3) + a1);
  return +[NSDate dateWithTimeIntervalSinceReferenceDate:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceReferenceDate:",  v7);
}

void sub_100002EC0(uint64_t a1)
{
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  uint64_t v2 = (void *)qword_1000364A0;
  qword_1000364A0 = (uint64_t)v1;
}

void sub_1000031B4( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

id sub_1000031C4()
{
  if (qword_1000364B8 != -1) {
    dispatch_once(&qword_1000364B8, &stru_1000288B8);
  }
  return (id)qword_1000364B0;
}

void sub_100003204(id a1)
{
  os_log_t v1 = os_log_create("com.apple.hangtracer", "");
  uint64_t v2 = (void *)qword_1000364B0;
  qword_1000364B0 = (uint64_t)v1;
}

void sub_10000330C()
{
  id v0 = sub_1000031C4();
  os_log_t v1 = (os_log_s *)objc_claimAutoreleasedReturnValue(v0);
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEFAULT, "marking hangreporter as clean to exit", v3, 2u);
  }

  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([(id)qword_1000364C8 transaction]);
  if (v2) {
    [(id)qword_1000364C8 setTransaction:0];
  }
}

void sub_100003C70( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
}

void sub_100003CC4(id a1)
{
  os_log_t v1 = -[HTFixedSizeQueue initWithSize:](objc_alloc(&OBJC_CLASS___HTFixedSizeQueue), "initWithSize:", 128LL);
  uint64_t v2 = (void *)qword_1000364C8;
  qword_1000364C8 = (uint64_t)v1;

  if (!qword_1000364C8)
  {
    id v3 = sub_1000031C4();
    id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)double v5 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Unable to instantiate queue to hold process launch and exit records, exiting",  v5,  2u);
    }

    exit(12);
  }

void sub_100004420(id a1)
{
  id v1 = -[HUDRenderServer _init](objc_alloc(&OBJC_CLASS___HUDRenderServer), "_init");
  uint64_t v2 = (void *)qword_1000364D0;
  qword_1000364D0 = (uint64_t)v1;
}

void sub_1000045E4(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = sub_10000A4EC();
  double v5 = (char *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_DEBUG)) {
    sub_100015964(v3, v5);
  }

  if ([v3 count])
  {
    double v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(a1 + 32) + 24) acquireKeepAliveAssertion]);

    if (v6)
    {
      id v7 = [v3 mutableCopy];
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:off_1000361C0]);

      if ([v3 count] == (id)1 && v8) {
        [v7 removeAllObjects];
      }
      [v7 enumerateKeysAndObjectsUsingBlock:&stru_100028938];
      id v9 = sub_1000047A8();
      id v10 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v9);
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472LL;
      v12[2] = sub_1000047E8;
      v12[3] = &unk_1000287C8;
      id v13 = v7;
      id v14 = *(id *)(a1 + 32);
      id v11 = v7;
      dispatch_sync(v10, v12);
    }
  }
}

void sub_100004738(id a1, NSString *a2, HUDContentProtocol *a3, BOOL *a4)
{
  uint64_t v8 = a3;
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___HTProcessLaunchExitRecord);
  char isKindOfClass = objc_opt_isKindOfClass(v8, v4);
  double v6 = v8;
  if ((isKindOfClass & 1) != 0)
  {
    id v7 = v8;
    if (!-[HUDContentProtocol requestedToRenderTimestamp](v7, "requestedToRenderTimestamp")) {
      -[HUDContentProtocol setRequestedToRenderTimestamp:](v7, "setRequestedToRenderTimestamp:", mach_absolute_time());
    }

    double v6 = v8;
  }
}

id sub_1000047A8()
{
  if (qword_100036500 != -1) {
    dispatch_once(&qword_100036500, &stru_100028AA0);
  }
  return (id)qword_1000364F8;
}

void sub_1000047E8(uint64_t a1)
{
  if ([*(id *)(a1 + 32) count] || (uint64_t v2 = *(_BYTE **)(a1 + 40), v2[32]))
  {
    id v3 = &stru_100028958;
  }

  else
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472LL;
    v5[2] = sub_100004898;
    v5[3] = &unk_1000286E0;
    double v6 = v2;
    id v3 = objc_retainBlock(v5);
  }

  uint64_t v4 = *(void **)(*(void *)(a1 + 40) + 16LL);
  if (v4) {
    [v4 updateHUD:*(void *)(a1 + 32) withCompletion:v3];
  }
}

id sub_100004898(uint64_t a1)
{
  return _[*(id *)(*(void *)(a1 + 32) + 24) invalidateKeepAliveAssertion];
}

void sub_1000048A4(id a1, NSArray *a2)
{
  uint64_t v2 = a2;
  id v3 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  uint64_t v4 = v2;
  id v5 = -[NSArray countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v26,  v34,  16LL);
  if (v5)
  {
    id v7 = v5;
    uint64_t v8 = *(void *)v27;
    *(void *)&__int128 v6 = 138412546LL;
    __int128 v25 = v6;
    do
    {
      id v9 = 0LL;
      do
      {
        if (*(void *)v27 != v8) {
          objc_enumerationMutation(v4);
        }
        id v10 = *(void **)(*((void *)&v26 + 1) + 8LL * (void)v9);
        id v11 = sub_10000A4EC();
        uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        {
          __int128 v22 = (void *)objc_claimAutoreleasedReturnValue([v10 processName]);
          id v23 = [v10 exitTimestamp];
          *(_DWORD *)buf = v25;
          uint64_t v31 = v22;
          __int16 v32 = 2048;
          id v33 = v23;
          _os_log_debug_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEBUG,  "Adding proc exit record to the HUD update list: processName: %@, exitTimestamp:%llu",  buf,  0x16u);
        }

        id v13 = (void *)objc_claimAutoreleasedReturnValue([v10 processName]);
        id v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v3, "objectForKeyedSubscript:", v13));

        if (v14)
        {
          v15 = (void *)objc_claimAutoreleasedReturnValue([v10 processName]);
          v16 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v3, "objectForKeyedSubscript:", v15));

          id v17 = sub_10000A4EC();
          __int128 v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            __int128 v19 = (void *)objc_claimAutoreleasedReturnValue([v16 processName]);
            id v20 = [v16 exitTimestamp];
            *(_DWORD *)buf = v25;
            uint64_t v31 = v19;
            __int16 v32 = 2048;
            id v33 = v20;
            _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  " Overwriting the exiting proc exit item sharing the same process name %@ with exitTimestamp: %llu",  buf,  0x16u);
          }
        }

        __int128 v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "processName", v25, (void)v26));
        -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v10, v21);

        id v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      id v7 = -[NSArray countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v26,  v34,  16LL);
    }

    while (v7);
  }

  if (-[NSMutableDictionary count](v3, "count"))
  {
    __int128 v24 = (void *)objc_claimAutoreleasedReturnValue(+[HUDContextUpdater sharedInstance](&OBJC_CLASS___HUDContextUpdater, "sharedInstance"));
    [v24 addHUDContents:v3];
  }
}

void sub_100004B5C(uint64_t a1, void *a2)
{
  id v5 = a2;
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[HangHUDServiceSpecification domainName](&OBJC_CLASS___HangHUDServiceSpecification, "domainName"));
  [v5 setDomain:v3];

  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[HangHUDServiceSpecification identifier](&OBJC_CLASS___HangHUDServiceSpecification, "identifier"));
  [v5 setService:v4];

  [v5 setDelegate:*(void *)(a1 + 32)];
}

id sub_100004C8C(uint64_t a1)
{
  id v2 = sub_10000A4EC();
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_1000159D4(v3, v4, v5, v6, v7, v8, v9, v10);
  }

  id v11 = objc_alloc(&OBJC_CLASS___HUDContext);
  id v12 = sub_1000047A8();
  id v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  id v14 = -[HUDContext initWithQueue:](v11, "initWithQueue:", v13);
  uint64_t v15 = *(void *)(a1 + 32);
  v16 = *(void **)(v15 + 16);
  *(void *)(v15 + 16) = v14;

  return [*(id *)(*(void *)(a1 + 32) + 16) setHangHUDUpdaterLatencyInMS:50.0];
}

void sub_100004EF8(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = v3;
  if (*(void *)(a1 + 32)) {
    objc_msgSend(v3, "setUserInfo:");
  }
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[HangHUDServiceSpecification interface](&OBJC_CLASS___HangHUDServiceSpecification, "interface"));
  [v4 setInterface:v5];

  [v4 setInterfaceTarget:*(void *)(a1 + 40)];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( +[HangHUDServiceSpecification serviceQuality]( &OBJC_CLASS___HangHUDServiceSpecification,  "serviceQuality"));
  [v4 setServiceQuality:v6];

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100004FD0;
  v7[3] = &unk_100028A10;
  v7[4] = *(void *)(a1 + 40);
  [v4 setInvalidationHandler:v7];
}

void sub_100004FD0(uint64_t a1)
{
  id v2 = sub_1000047A8();
  id v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v2);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100005040;
  block[3] = &unk_1000286E0;
  block[4] = *(void *)(a1 + 32);
  dispatch_sync(v3, block);
}

id sub_100005040(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 16) clearHUDLinesAnimated:1];
}

id sub_1000058A4(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 16) clearHUDLinesAnimated:1];
}

LABEL_21:
LABEL_22:
      }

      uint64_t v6 = [v4 countByEnumeratingWithState:&v36 objects:v48 count:16];
      if (!v6) {
        goto LABEL_26;
      }
    }
  }

  v35 = 0;
LABEL_26:
  os_unfair_lock_unlock(lock);

  return v35 & 1;
}

      goto LABEL_22;
    }

    currentTheme = self->_currentTheme;
    [v8 hangDurationMS];
    id v14 = v13;
    -[HUDTheme hangDuration](self->_currentTheme, "hangDuration");
    -[HUDTheme setHangDuration:animated:](currentTheme, "setHangDuration:animated:", v15 > 0.0, v14);
    [v8 hangDurationMS];
    v16 = -[HangHUDLine statusForHangWithDuration:timedOut:](self, "statusForHangWithDuration:timedOut:", (a4 >> 1) & 1);
    id v17 = -[HUDLineDelegate currentHangTextColorForStatus:]( self->super._lineDelegate,  "currentHangTextColorForStatus:",  v16);
    [*(id *)&self->super._spacing setForegroundColor:v17];
    -[HUDTheme setForegroundColor:](self->_currentTheme, "setForegroundColor:", v17);
    __int128 v29 = v16;
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue( -[HUDLineDelegate textColorVibrantFilterForStatus:]( self->super._lineDelegate,  "textColorVibrantFilterForStatus:",  v16));
    __int128 v18 = (void *)objc_claimAutoreleasedReturnValue(-[HangHUDLine filters](self, "filters"));
    if (!v18 && v11) {
      goto LABEL_9;
    }
    id v20 = (void *)objc_claimAutoreleasedReturnValue(-[HangHUDLine filters](self, "filters"));
    __int128 v21 = v20;
    if (!v20 || v11)
    {
      if (v11)
      {
        __int128 v28 = (void *)objc_claimAutoreleasedReturnValue(-[HangHUDLine filters](self, "filters"));
        __int16 v32 = v11;
        __int128 v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v32, 1LL));
        __int128 v27 = [v28 isEqualToArray:v26];

        if ((v27 & 1) == 0)
        {
LABEL_9:
          uint64_t v31 = v11;
          __int128 v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  &v31,  1LL));
          -[HangHUDLine setFilters:](self, "setFilters:", v19);
        }
      }

      else
      {
      }
    }

    else
    {

      -[HangHUDLine setFilters:](self, "setFilters:", 0LL);
    }

    if ((a4 & 1) == 0)
    {
      __int128 v22 = sub_1000031C4();
      id v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG)) {
        sub_1000163B8(v8);
      }

      -[HUDLine setUpdatesComplete:](self, "setUpdatesComplete:", 1LL);
      __int128 v24 = (void *)objc_claimAutoreleasedReturnValue( +[CABasicAnimation animationWithKeyPath:]( &OBJC_CLASS___CABasicAnimation,  "animationWithKeyPath:",  @"foregroundColor"));
      [v24 setRemovedOnCompletion:0];
      [v24 setFillMode:kCAFillModeForwards];
      objc_msgSend( v24,  "setToValue:",  -[HUDLineDelegate previousHangTextColorForStatus:]( self->super._lineDelegate,  "previousHangTextColorForStatus:",  v29));
      [v24 setDuration:0.5];
      __int128 v25 = objc_alloc_init(&OBJC_CLASS___HUDLineAnimationDelegate);
      -[HUDLineAnimationDelegate setHudLine:](v25, "setHudLine:", self);
      [v24 setDelegate:v25];
      [*(id *)&self->super._spacing addAnimation:v24 forKey:@"foreground-color-fade-animation"];
      -[HUDTheme addAnimation:forKey:]( self->_currentTheme,  "addAnimation:forKey:",  v24,  @"foreground-color-fade-animation");
    }

    goto LABEL_21;
  }

  uint64_t v7 = sub_1000031C4();
  uint64_t v8 = (id)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_DEBUG)) {
    sub_100016344((uint64_t)self, (os_log_s *)v8);
  }
LABEL_22:
}

void sub_100005FAC(id a1)
{
  id v1 = objc_alloc_init(&OBJC_CLASS___HUDContextUpdater);
  id v2 = (void *)qword_1000364E0;
  qword_1000364E0 = (uint64_t)v1;
}

id sub_100006090(uint64_t a1)
{
  id v2 = sub_10000A4EC();
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_100015EB0(a1, v3);
  }

  return [*(id *)(a1 + 32) HandleUpdateAndClear];
}

void sub_1000066BC(id a1)
{
  dispatch_queue_t v1 = dispatch_queue_create("com.apple.HangHUD.HUDUpdateQueue", 0LL);
  id v2 = (void *)qword_1000364F8;
  qword_1000364F8 = (uint64_t)v1;
}

  ;
}

void sub_1000066F4( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

void sub_100006704( void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

  ;
}

id sub_100006738(void *a1, const char *a2)
{
  return [a1 count];
}

  ;
}

void sub_100006B08(id a1)
{
  dispatch_queue_t v1 = objc_alloc_init(&OBJC_CLASS___NSCache);
  id v2 = (void *)qword_100036510;
  qword_100036510 = (uint64_t)v1;

  [(id)qword_100036510 setCountLimit:20];
}

void sub_100007130(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) valueLayer]);
  [v2 preferredFrameSize];
  objc_msgSend(*(id *)(a1 + 32), "setMinimumValueLayerWidth:");

  id v3 = *(void **)(a1 + 32);
  id v5 = (id)objc_claimAutoreleasedReturnValue([v3 hudLines]);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"some-id"]);
  [v3 updateCornerRadiusAndSidePaddingIfNecessary:v4];
}

void sub_1000073D4(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  id v5 = (id)objc_claimAutoreleasedReturnValue([v2 hudLines]);
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v5 allValues]);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 firstObject]);
  [v2 updateCornerRadiusAndSidePaddingIfNecessary:v4];
}

LABEL_6:
}

id sub_1000076B4(uint64_t a1)
{
  id v2 = sub_1000031C4();
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) objectForKeyedSubscript:NSKeyValueChangeOldKey]);
    id v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) objectForKeyedSubscript:NSKeyValueChangeNewKey]);
    *(_DWORD *)buf = 138412546;
    uint64_t v10 = v4;
    __int16 v11 = 2112;
    id v12 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_INFO,  "HangTracer HUD new orientation %@ → %@",  buf,  0x16u);
  }

  sub_1000144D8();
  uint64_t v6 = *(void **)(a1 + 40);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_1000077E8;
  v8[3] = &unk_1000286E0;
  v8[4] = v6;
  return [v6 performHUDUpdate:v8];
}

void sub_1000077E8(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) hudLines]);
  id v5 = (id)objc_claimAutoreleasedReturnValue([v2 allKeys]);

  objc_msgSend(*(id *)(a1 + 32), "layoutHUDLines:ids:", objc_msgSend(v5, "count"), v5);
  objc_msgSend(*(id *)(a1 + 32), "determineNewFrameForRootLayer:numberOfLines:", objc_msgSend(v5, "count"), v3, v4);
}

id sub_10000787C(uint64_t a1)
{
  id v2 = sub_1000031C4();
  double v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    double v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) objectForKeyedSubscript:NSKeyValueChangeOldKey]);
    id v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) objectForKeyedSubscript:NSKeyValueChangeNewKey]);
    *(_DWORD *)buf = 138412546;
    uint64_t v10 = v4;
    __int16 v11 = 2112;
    id v12 = v5;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "HangTracer HUD new bounds %@ → %@", buf, 0x16u);
  }

  sub_1000144F4();
  [*(id *)(a1 + 40) setDisplayScaleDependentPropertiesOnLayers];
  uint64_t v6 = *(void **)(a1 + 40);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_1000079B8;
  v8[3] = &unk_1000286E0;
  v8[4] = v6;
  return [v6 performHUDUpdate:v8];
}

void sub_1000079B8(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) hudLines]);
  double v3 = (void *)objc_claimAutoreleasedReturnValue([v2 allKeys]);

  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  id v4 = v3;
  id v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v15;
    do
    {
      uint64_t v8 = 0LL;
      do
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v14 + 1) + 8LL * (void)v8);
        uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "hudLines", (void)v14));
        __int16 v11 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:v9]);
        sub_100013ED0();
        objc_msgSend(v11, "setFontSize:");

        uint64_t v8 = (char *)v8 + 1;
      }

      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }

    while (v6);
  }

  objc_msgSend(*(id *)(a1 + 32), "layoutHUDLines:ids:", objc_msgSend(v4, "count"), v4);
  objc_msgSend(*(id *)(a1 + 32), "determineNewFrameForRootLayer:numberOfLines:", objc_msgSend(v4, "count"), v12, v13);
}

void sub_100007D54(uint64_t a1)
{
  double v2 = -[HUDLine contentScaleForTexts]_0();
  CATransform3DMakeScale(&v12, v2, v2, v2);
  double v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) rootLayer]);
  CATransform3D v11 = v12;
  [v3 setTransform:&v11];

  else {
    double v4 = 2.0 / v2;
  }
  id v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) containerLayer]);
  [v5 setBorderWidth:v4];

  unsigned int v6 = [*(id *)(a1 + 32) accessibilityReducesTransparency];
  double v7 = 4.0;
  if (v6) {
    double v7 = 10.0;
  }
  double v8 = v7 / v2;
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) containerLayer]);
  objc_msgSend(v9, "setShadowOffset:", 0.0, v8);

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) containerLayer]);
  [v10 setShadowRadius:25.0 / v2];
}

void sub_1000081C0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_1000081EC(id a1, NSString *a2, HUDLine *a3, BOOL *a4)
{
  double v4 = a3;
  -[HUDLine removeFromSuperlayer](v4, "removeFromSuperlayer");
  -[HUDLine nilifyCALayers](v4, "nilifyCALayers");
}

void sub_10000821C(uint64_t a1, uint64_t a2)
{
}

void sub_100008228(uint64_t a1)
{
}

void sub_100008230(uint64_t a1)
{
  WeakRetained = (dispatch_queue_s **)objc_loadWeakRetained((id *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL));
  double v3 = WeakRetained;
  if (WeakRetained)
  {
    double v4 = WeakRetained[1];
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472LL;
    v6[2] = sub_1000082B0;
    v6[3] = &unk_1000287C8;
    uint64_t v5 = *(void *)(a1 + 32);
    v6[4] = v3;
    v6[5] = v5;
    dispatch_async(v4, v6);
  }
}

void sub_1000082B0(uint64_t a1)
{
  double v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) containerLayer]);

  if (v2)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 40) + 16LL));
    double v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) hudLines]);
    [v3 enumerateKeysAndObjectsUsingBlock:&stru_100028B48];

    double v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) hudLines]);
    [v4 removeAllObjects];

    double y = CGRectZero.origin.y;
    double width = CGRectZero.size.width;
    double height = CGRectZero.size.height;
    double v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) containerLayer]);
    objc_msgSend(v8, "setFrame:", CGRectZero.origin.x, y, width, height);

    [*(id *)(a1 + 40) recreateContainerLayerIfNecessary];
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) rootLayer]);
    [v9 setHidden:1];

    [*(id *)(a1 + 32) invalidate];
    os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 16LL));
  }

  else
  {
    id v10 = sub_1000031C4();
    CATransform3D v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      sub_100016108(v11, v12, v13, v14, v15, v16, v17, v18);
    }
  }

void sub_1000083E0(id a1, NSString *a2, HUDLine *a3, BOOL *a4)
{
  double v4 = a3;
  -[HUDLine removeFromSuperlayer](v4, "removeFromSuperlayer");
  -[HUDLine nilifyCALayers](v4, "nilifyCALayers");
}

void sub_100008624(uint64_t a1)
{
  double v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  double v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) hudLines]);
  v42[0] = _NSConcreteStackBlock;
  v42[1] = 3221225472LL;
  v42[2] = sub_100008998;
  v42[3] = &unk_100028B98;
  id v43 = *(id *)(a1 + 40);
  id v44 = *(id *)(a1 + 48);
  id v4 = v2;
  id v45 = v4;
  [v3 enumerateKeysAndObjectsUsingBlock:v42];

  __int128 v40 = 0u;
  __int128 v41 = 0u;
  __int128 v38 = 0u;
  __int128 v39 = 0u;
  id v5 = v4;
  id v6 = [v5 countByEnumeratingWithState:&v38 objects:v46 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v39;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v39 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v38 + 1) + 8LL * (void)i);
        CATransform3D v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "hudLines", (void)v38));
        uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:v10]);
        [v12 removeFromSuperlayer];

        uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) hudLines]);
        [v13 removeObjectForKey:v10];

        uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) hudContentWithPendingAnimations]);
        [v14 removeObject:v10];
      }

      id v7 = [v5 countByEnumeratingWithState:&v38 objects:v46 count:16];
    }

    while (v7);
  }

  id v15 = sub_1000031C4();
  uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
    sub_10001613C(a1, v16, v17, v18, v19, v20, v21, v22);
  }

  id v23 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) containerLayer]);
  [v23 removeAllAnimations];

  if (*(void *)(a1 + 56))
  {
    unint64_t v24 = 0LL;
    do
    {
      __int128 v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "objectAtIndexedSubscript:", v24, (void)v38));
      __int128 v26 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) objectForKeyedSubscript:v25]);
      objc_msgSend(*(id *)(a1 + 32), "HangHUD_updater_latency_in_ms");
      uint64_t v28 = sub_100014538(v26, *(void *)(a1 + 64), v27 + 50.0);
      else {
        uint64_t v29 = v28;
      }
      [*(id *)(a1 + 32) updateHUDLineWithId:v25 content:v26 options:v29];

      ++v24;
      unint64_t v30 = *(void *)(a1 + 56);
    }

    while (v24 < v30);
  }

  else
  {
    unint64_t v30 = 0LL;
  }

  objc_msgSend(*(id *)(a1 + 32), "layoutHUDLines:ids:", v30, *(void *)(a1 + 48), (void)v38);
  objc_msgSend(*(id *)(a1 + 32), "determineNewFrameForRootLayer:numberOfLines:", *(int *)(a1 + 56));
  uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) containerLayer]);
  __int16 v32 = (void *)objc_claimAutoreleasedReturnValue([v31 sublayers]);
  id v33 = [v32 count];

  if (v33)
  {
    v34 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) rootLayer]);
    [v34 setHidden:0];

    v35 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) containerLayer]);
    [v35 setHidden:0];

    v36 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) containerLayer]);
    LODWORD(v37) = 1.0;
    [v36 setOpacity:v37];
  }
}

void sub_100008998(id *a1, void *a2)
{
  id v6 = a2;
  uint64_t v3 = objc_claimAutoreleasedReturnValue(objc_msgSend(a1[4], "objectForKeyedSubscript:"));
  if (!v3
    || (id v4 = (void *)v3, v5 = [a1[5] indexOfObject:v6],
                         v4,
                         v5 == (id)0x7FFFFFFFFFFFFFFFLL))
  {
    [a1[6] addObject:v6];
  }
}

uint64_t sub_100008A14(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_100008BC4(uint64_t a1)
{
  double v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) hudLines]);
  v50[0] = _NSConcreteStackBlock;
  v50[1] = 3221225472LL;
  v50[2] = sub_100008FD8;
  v50[3] = &unk_100028B98;
  id v51 = *(id *)(a1 + 40);
  id v52 = *(id *)(a1 + 48);
  id v4 = v2;
  id v53 = v4;
  [v3 enumerateKeysAndObjectsUsingBlock:v50];

  __int128 v48 = 0u;
  __int128 v49 = 0u;
  __int128 v46 = 0u;
  __int128 v47 = 0u;
  id v5 = v4;
  id v6 = [v5 countByEnumeratingWithState:&v46 objects:v56 count:16];
  if (v6)
  {
    id v8 = v6;
    uint64_t v9 = *(void *)v47;
    *(void *)&__int128 v7 = 138412290LL;
    __int128 v45 = v7;
    do
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v47 != v9) {
          objc_enumerationMutation(v5);
        }
        uint64_t v11 = *(void *)(*((void *)&v46 + 1) + 8LL * (void)i);
        uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "hudLines", v45, (void)v46));
        uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:v11]);
        [v13 removeFromSuperlayer];

        uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) hudLines]);
        id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKeyedSubscript:v11]);
        [v15 nilifyCALayers];

        uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) hudLines]);
        [v16 removeObjectForKey:v11];

        id v17 = sub_1000031C4();
        uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = v45;
          uint64_t v55 = v11;
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Removed hudLines item %@", buf, 0xCu);
        }

        uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) hudContentWithPendingAnimations]);
        [v19 removeObject:v11];
      }

      id v8 = [v5 countByEnumeratingWithState:&v46 objects:v56 count:16];
    }

    while (v8);
  }

  id v20 = sub_1000031C4();
  uint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
    sub_1000161A4(a1, v21, v22, v23, v24, v25, v26, v27);
  }

  uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) containerLayer]);
  [v28 removeAllAnimations];

  if (*(void *)(a1 + 56))
  {
    unint64_t v29 = 0LL;
    do
    {
      unint64_t v30 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) objectAtIndexedSubscript:v29]);
      uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) objectForKeyedSubscript:v30]);
      objc_msgSend(*(id *)(a1 + 32), "HangHUD_updater_latency_in_ms");
      uint64_t v33 = [v31 isCurrent:*(void *)(a1 + 64) withHUDUpdateInterval:v32 + 50.0];
      else {
        uint64_t v34 = v33;
      }
      [*(id *)(a1 + 32) updateHUDLineWithId:v30 content:v31 options:v34];

      ++v29;
      unint64_t v35 = *(void *)(a1 + 56);
    }

    while (v29 < v35);
  }

  else
  {
    unint64_t v35 = 0LL;
  }

  [*(id *)(a1 + 32) layoutHUDLines:v35 ids:*(void *)(a1 + 48)];
  objc_msgSend(*(id *)(a1 + 32), "determineNewFrameForRootLayer:numberOfLines:", *(int *)(a1 + 56));
  v36 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) containerLayer]);
  double v37 = (void *)objc_claimAutoreleasedReturnValue([v36 sublayers]);
  id v38 = [v37 count];

  if (v38)
  {
    __int128 v39 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) rootLayer]);
    [v39 setHidden:0];

    __int128 v40 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) containerLayer]);
    [v40 setHidden:0];

    objc_msgSend(*(id *)(a1 + 32), "HUD_background_opacity");
    float v42 = v41;
    id v43 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) containerLayer]);
    *(float *)&double v44 = v42;
    [v43 setOpacity:v44];
  }
}

void sub_100008FD8(id *a1, void *a2)
{
  id v6 = a2;
  uint64_t v3 = objc_claimAutoreleasedReturnValue(objc_msgSend(a1[4], "objectForKeyedSubscript:"));
  if (!v3
    || (id v4 = (void *)v3, v5 = [a1[5] indexOfObject:v6],
                         v4,
                         v5 == (id)0x7FFFFFFFFFFFFFFFLL))
  {
    [a1[6] addObject:v6];
  }
}

uint64_t sub_100009054(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

LABEL_10:
  uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue(-[HUDContext hudLines](self, "hudLines"));
  uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue([v25 objectForKeyedSubscript:v8]);
  [v26 update:v9 options:a5];
}

void sub_100009884( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  uint64_t v8 = va_arg(va1, void);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_1000098BC(uint64_t a1, uint64_t a2, void *a3)
{
  id v20 = a3;
  uint64_t v4 = objc_claimAutoreleasedReturnValue([v20 keyLayer]);
  if (v4)
  {
    id v5 = (void *)v4;
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v20 keyLayer]);
    [v6 preferredFrameSize];
    double v8 = v7;
    double v9 = *(double *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);

    if (v8 > v9)
    {
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v20 keyLayer]);
      [v10 preferredFrameSize];
      *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = v11;
    }
  }

  uint64_t v12 = objc_claimAutoreleasedReturnValue([v20 valueLayer]);
  if (v12)
  {
    uint64_t v13 = (void *)v12;
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v20 valueLayer]);
    [v14 preferredFrameSize];
    double v16 = v15;
    double v17 = *(double *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL);

    if (v16 > v17)
    {
      uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v20 valueLayer]);
      [v18 preferredFrameSize];
      *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = v19;
    }
  }
}

void sub_100009BC4(_Unwind_Exception *a1)
{
}

void sub_100009BE8(uint64_t a1, uint64_t a2)
{
  WeakRetained = (dispatch_queue_s **)objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v4 = WeakRetained;
  if (WeakRetained)
  {
    id v5 = WeakRetained[1];
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472LL;
    v6[2] = sub_100009C5C;
    v6[3] = &unk_100028690;
    v6[4] = v4;
    v6[5] = a2;
    dispatch_async(v5, v6);
  }
}

id sub_100009C5C(uint64_t a1)
{
  if (*(void *)(a1 + 40)) {
    uint64_t v2 = objc_claimAutoreleasedReturnValue(+[HUDTheme darkModeTheme](&OBJC_CLASS___HUDTheme, "darkModeTheme"));
  }
  else {
    uint64_t v2 = objc_claimAutoreleasedReturnValue(+[HUDTheme lightModeTheme](&OBJC_CLASS___HUDTheme, "lightModeTheme"));
  }
  uint64_t v3 = (void *)v2;
  [*(id *)(a1 + 32) setCurrentTheme:v2];

  return _[*(id *)(a1 + 32) applyThemeColors];
}

void sub_100009D44(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained reloadThemeColors];
}

void sub_100009DE4(uint64_t a1)
{
  int v2 = sub_100014A14();
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) currentTheme]);
  uint64_t v4 = v3;
  if (v2) {
    id v5 = [v3 translucentBackgroundColor];
  }
  else {
    id v5 = [v3 backgroundColor];
  }
  id v6 = v5;
  double v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) containerLayer]);
  [v7 setBackgroundColor:v6];

  double v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) hudLines]);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_100009EF0;
  v12[3] = &unk_100028C88;
  void v12[4] = *(void *)(a1 + 32);
  [v8 enumerateKeysAndObjectsUsingBlock:v12];

  double v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) lastKnownHangs]);
  if (v9)
  {
    uint64_t v10 = *(void **)(a1 + 32);
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 lastKnownHangs]);
    [v10 updateHangs:v11 withCompletion:&stru_100028CA8];
  }

void sub_100009EF0(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___HangHUDLine);
  if ((objc_opt_isKindOfClass(v6, v4) & 1) != 0)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) currentTheme]);
    [v6 setCurrentTheme:v5];
  }
}

void sub_10000A160(uint64_t a1)
{
  int v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) getKeyForLine:*(void *)(a1 + 40)]);
  if (v2)
  {
    id v3 = sub_1000031C4();
    uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      sub_10001620C((uint64_t)v2, v4, v5, v6, v7, v8, v9, v10);
    }

    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) hudContentWithPendingAnimations]);
    [v11 removeObject:v2];
  }
}

void sub_10000A264(uint64_t a1)
{
  int v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) getKeyForLine:*(void *)(a1 + 40)]);
  if (v2)
  {
    id v3 = sub_1000031C4();
    uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      sub_100016270((uint64_t)v2, v4, v5, v6, v7, v8, v9, v10);
    }

    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) hudContentWithPendingAnimations]);
    [v11 addObject:v2];
  }
}

id sub_10000A4EC()
{
  if (qword_100036520 != -1) {
    dispatch_once(&qword_100036520, &stru_100028CC8);
  }
  return (id)qword_100036518;
}

void sub_10000A52C(id a1)
{
  os_log_t v1 = os_log_create("com.apple.HangHUD", "");
  int v2 = (void *)qword_100036518;
  qword_100036518 = (uint64_t)v1;
}

void sub_10000A55C(id a1)
{
  UIFontForLanguage = CTFontCreateUIFontForLanguage((CTFontUIFontType)0x6Au, 0.0, 0LL);
  int v2 = CTFontCopyFontDescriptor(UIFontForLanguage);
  CFStringRef v7 = kCTFontOpticalSizeAttribute;
  id v3 = +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", sub_100013C34());
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  uint64_t v8 = v4;
  uint64_t v5 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v8,  &v7,  1LL));
  CopyWithAttributes = CTFontDescriptorCreateCopyWithAttributes(v2, v5);

  qword_100036530 = (uint64_t)CTFontCreateWithFontDescriptor(CopyWithAttributes, 0.0, 0LL);
  CFRelease(UIFontForLanguage);
  CFRelease(v2);
  CFRelease(CopyWithAttributes);
}

void sub_10000A66C(id a1)
{
  UIFontForLanguage = CTFontCreateUIFontForLanguage((CTFontUIFontType)0x6Au, 0.0, 0LL);
  int v2 = CTFontCopyFontDescriptor(UIFontForLanguage);
  CopyWithFeature = CTFontDescriptorCreateCopyWithFeature(v2, (CFNumberRef)&off_10002D4A0, (CFNumberRef)&off_10002D4B8);
  CFStringRef v8 = kCTFontOpticalSizeAttribute;
  uint64_t v4 = +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", sub_100013C34());
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  uint64_t v9 = v5;
  uint64_t v6 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v9,  &v8,  1LL));
  CopyWithAttributes = CTFontDescriptorCreateCopyWithAttributes(CopyWithFeature, v6);

  qword_100036540 = (uint64_t)CTFontCreateWithFontDescriptor(CopyWithAttributes, 0.0, 0LL);
  CFRelease(UIFontForLanguage);
  CFRelease(v2);
  CFRelease(CopyWithFeature);
  CFRelease(CopyWithAttributes);
}

void sub_10000A79C(id a1)
{
  qword_100036550 = (uint64_t)CTFontCreateUIFontForLanguage((CTFontUIFontType)0x6Au, 0.0, 0LL);
}

void sub_10000B3DC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_10000B3F4(uint64_t a1, void *a2, uint64_t a3)
{
  id v9 = a2;
  [v9 preferredFrameSize];
  *(double *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 32LL) = v5
  double v6 = *(double *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL);
  [v9 preferredFrameSize];
  if (v6 < v7)
  {
    [v9 preferredFrameSize];
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL) = v8;
  }

  if (a3) {
    *(double *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 32LL) = *(double *)(*(void *)(a1 + 32) + 8LL)
  }
}

void sub_10000BE90( void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

void sub_10000BF18(uint64_t a1)
{
  int v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSProcessInfo processInfo](&OBJC_CLASS___NSProcessInfo, "processInfo"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 processName]);
  uint64_t v4 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ (%i) : %p",  v3,  getpid(),  *(void *)(a1 + 32));
  id v7 = (id)objc_claimAutoreleasedReturnValue(v4);

  id v5 = [objc_alloc(*(Class *)(a1 + 32)) initWithIdentifier:v7];
  double v6 = (void *)qword_100036558;
  qword_100036558 = (uint64_t)v5;
}

void sub_10000C1E0(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = a2;
  id v4 = (id)objc_claimAutoreleasedReturnValue( +[HangHUDServiceSpecification clientContextIdentifierKey]( &OBJC_CLASS___HangHUDServiceSpecification,  "clientContextIdentifierKey"));
  [v3 encodeObject:v2 forKey:v4];
}

void sub_10000C244(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[HangHUDServiceSpecification interface](&OBJC_CLASS___HangHUDServiceSpecification, "interface"));
  [v3 setInterface:v4];

  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[HangHUDServiceSpecification serviceQuality]( &OBJC_CLASS___HangHUDServiceSpecification,  "serviceQuality"));
  [v3 setServiceQuality:v5];

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_10000C380;
  v10[3] = &unk_100028A10;
  id v11 = *(id *)(a1 + 32);
  [v3 setActivationHandler:v10];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_10000C3C0;
  v8[3] = &unk_100028A10;
  id v9 = *(id *)(a1 + 32);
  [v3 setInterruptionHandler:v8];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_10000C418;
  v6[3] = &unk_100028A10;
  id v7 = *(id *)(a1 + 32);
  [v3 setInvalidationHandler:v6];
}

void sub_10000C380(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 24LL));
  [WeakRetained serverRunningDidChange:*(void *)(a1 + 32)];
}

void sub_10000C3C0(uint64_t a1, void *a2)
{
  id v3 = (id *)(*(void *)(a1 + 32) + 24LL);
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  [WeakRetained serverRunningDidChange:*(void *)(a1 + 32)];

  [v5 activate];
}

void sub_10000C418(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 24LL));
  [WeakRetained serverRunningDidChange:*(void *)(a1 + 32)];
}

__CFString *sub_10000CD58(unsigned int a1)
{
  if (a1 >= 0x2A) {
    return (__CFString *)(id)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%d",  a1));
  }
  else {
    return *(&off_100028DC0 + (char)a1);
  }
}

id sub_10000CDB0(unsigned int a1)
{
  char v1 = a1 - 4;
  if (a1 - 4 < 0x26 && ((0x3789044BDDuLL >> v1) & 1) != 0)
  {
    id v4 = *(&off_100028F10 + v1);
  }

  else
  {
    uint64_t v2 = sub_10000CD58(a1);
    id v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
    id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 capitalizedString]);
  }

  return v4;
}

__CFString *sub_10000CE1C(uint64_t a1)
{
  if ((a1 - 1) >= 0x1F) {
    return (__CFString *)(id)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"SIG%d",  a1));
  }
  else {
    return *(&off_100029040 + (int)a1 - 1);
  }
}

__CFString *sub_10000CE70(uint64_t a1)
{
  if (a1 >= 0x10) {
    return (__CFString *)(id)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%d",  a1));
  }
  else {
    return *(&off_100029138 + (int)a1);
  }
}

id sub_10000CEC0(uint64_t a1)
{
  int v1 = a1 - 2;
  if ((a1 - 2) < 0xE && ((0x2655u >> v1) & 1) != 0)
  {
    id v4 = *(&off_1000291B8 + v1);
  }

  else
  {
    uint64_t v2 = sub_10000CE70(a1);
    id v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
    id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 capitalizedString]);
  }

  return v4;
}

__CFString *sub_10000CF20(uint64_t a1)
{
  if (a1 > 3221229822LL)
  {
    if (a1 <= 3306925314LL)
    {
      switch(a1)
      {
        case 3221229823LL:
          return @"thermal pressure";
        case 3306925313LL:
          return @"cpu violation";
        case 3306925314LL:
          return @"walltime violation";
      }
    }

    else if (a1 > 3735943696LL)
    {
      if (a1 == 3735943697LL) {
        return @"user quit";
      }
      if (a1 == 4227595259LL) {
        return @"force quit";
      }
    }

    else
    {
      if (a1 == 3306925315LL) {
        return @"system busy";
      }
      if (a1 == 3735883980LL) {
        return @"resource exclusion";
      }
    }

    goto LABEL_36;
  }

  if (a1 <= 1539435072)
  {
    switch(a1)
    {
      case 95805101LL:
        return @"application assertion";
      case 439025681LL:
        return @"input ui scene";
      case 732775916LL:
        return @"secure draw violation";
    }

    goto LABEL_36;
  }

  if (a1 > 1539435076)
  {
    if (a1 == 1539435077) {
      return @"legacy clear the board";
    }
    if (a1 == 2343432205LL) {
      return @"watchdog";
    }
    goto LABEL_36;
  }

  if (a1 == 1539435073) {
    return @"languages changed";
  }
  if (a1 != 1539435076)
  {
LABEL_36:
    int v1 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%#llx", a1));
    return v1;
  }

  int v1 = @"clear the board";
  return v1;
}

__CFString *sub_10000D12C(uint64_t a1)
{
  if (a1 > 1539435076)
  {
    if (a1 == 1539435077)
    {
      int v1 = @"Legacy Clear the Board";
      return v1;
    }

    if (a1 == 3306925313LL)
    {
      int v1 = @"CPU Violation";
      return v1;
    }

LABEL_8:
    uint64_t v2 = sub_10000CF20(a1);
    id v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
    int v1 = (__CFString *)objc_claimAutoreleasedReturnValue([v3 capitalizedString]);

    return v1;
  }

  if (a1 == 439025681)
  {
    int v1 = @"InputUI Scene";
    return v1;
  }

  if (a1 != 1539435076) {
    goto LABEL_8;
  }
  int v1 = @"Clear the Board";
  return v1;
}

    id v9 = 0LL;
    goto LABEL_9;
  }

  uint64_t v10 = sub_100014AF4(a2 - (void)[v5 hangEndTime]);
  id v9 = 1LL;
  if (v10 >= 200.0 && v6 > a3) {
    goto LABEL_8;
  }
LABEL_9:

  return v9;
}

__CFString *sub_10000D1E4(uint64_t a1)
{
  if ((a1 - 1) >= 4) {
    return (__CFString *)(id)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%d",  a1));
  }
  else {
    return *(&off_100029228 + (int)a1 - 1);
  }
}

id sub_10000D238(uint64_t a1)
{
  int v1 = sub_10000D1E4(a1);
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(v1);
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 capitalizedString]);

  return v3;
}

__CFString *sub_10000D270(uint64_t a1)
{
  if ((a1 - 1) >= 0x13) {
    return (__CFString *)(id)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%d",  a1));
  }
  else {
    return *(&off_100029248 + (int)a1 - 1);
  }
}

id sub_10000D2C4(uint64_t a1)
{
  int v1 = a1 - 1;
  if ((a1 - 1) < 0x13 && ((0x55F7Fu >> v1) & 1) != 0)
  {
    id v4 = *(&off_1000292E0 + v1);
  }

  else
  {
    uint64_t v2 = sub_10000D270(a1);
    id v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
    id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 capitalizedString]);
  }

  return v4;
}

__CFString *sub_10000D328(uint64_t a1)
{
  if ((a1 - 1) >= 5) {
    return (__CFString *)(id)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%d",  a1));
  }
  else {
    return *(&off_100029378 + (int)a1 - 1);
  }
}

__CFString *sub_10000D37C(uint64_t a1)
{
  if ((_DWORD)a1 == 5)
  {
    int v1 = @"JIT";
  }

  else
  {
    uint64_t v2 = sub_10000D328(a1);
    id v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
    int v1 = (__CFString *)objc_claimAutoreleasedReturnValue([v3 capitalizedString]);
  }

  return v1;
}

__CFString *sub_10000D3C8(uint64_t a1)
{
  if ((a1 - 1) >= 9) {
    return (__CFString *)(id)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%u",  a1));
  }
  else {
    return *(&off_1000293A0 + (int)a1 - 1);
  }
}

__CFString *sub_10000D41C(uint64_t a1)
{
  switch((_DWORD)a1)
  {
    case 2:
      int v1 = @"Unknown IPC";
      break;
    case 6:
      int v1 = @"Sandbox Filtered IPC";
      break;
    case 4:
      int v1 = @"SIGTERM Timeout";
      break;
    default:
      uint64_t v2 = sub_10000D3C8(a1);
      id v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
      int v1 = (__CFString *)objc_claimAutoreleasedReturnValue([v3 capitalizedString]);

      break;
  }

  return v1;
}

id sub_10000D490(uint64_t a1)
{
  uint64_t v1 = a1 - 1;
  else {
    uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%llu", a1));
  }
  return v2;
}

id sub_10000D4F0(uint64_t a1)
{
  uint64_t v1 = a1 - 1;
  if ((unint64_t)(a1 - 1) < 7 && ((0x47u >> v1) & 1) != 0)
  {
    id v4 = *(&off_100029430 + v1);
  }

  else
  {
    id v2 = sub_10000D490(a1);
    id v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
    id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 capitalizedString]);
  }

  return v4;
}

__CFString *sub_10000D550(uint64_t a1)
{
  if (a1 <= 2343432204LL)
  {
    if (a1 <= 562215633)
    {
      if (a1)
      {
        if (a1 == 97132013)
        {
          return @"conditions changed";
        }

        else
        {
          if (a1 != 562215597) {
            goto LABEL_37;
          }
          return @"assertion timeout";
        }
      }

      else
      {
        return @"none";
      }
    }

    else if (a1 > 562215635)
    {
      if (a1 == 562215636)
      {
        return @"background fetch completion timeout";
      }

      else
      {
        if (a1 != 732775916) {
          goto LABEL_37;
        }
        return @"security violation";
      }
    }

    else if (a1 == 562215634)
    {
      return @"background task assertion timeout";
    }

    else
    {
      return @"background url session completion timeout";
    }
  }

  else if (a1 > 3490524076LL)
  {
    if (a1 > 3735905537LL)
    {
      if (a1 == 3735905538LL)
      {
        return @"termination assertion";
      }

      else
      {
        if (a1 != 3735943697LL) {
          goto LABEL_37;
        }
        return @"user initiated quit";
      }
    }

    else if (a1 == 3490524077LL)
    {
      return @"max assertions violation";
    }

    else
    {
      if (a1 != 3735883980LL) {
        goto LABEL_37;
      }
      return @"resource exclusion";
    }
  }

  else if (a1 > 2970726672LL)
  {
    if (a1 == 2970726673LL)
    {
      return @"process exited";
    }

    else
    {
      if (a1 != 3221229823LL) {
        goto LABEL_37;
      }
      return @"thermal pressure";
    }
  }

  else
  {
    if (a1 != 2343432205LL)
    {
      if (a1 == 2970405393LL)
      {
        uint64_t v1 = @"max states violation";
        return v1;
      }

LABEL_37:
      uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%#llx",  a1));
      return v1;
    }

    return @"watchdog violation";
  }

__CFString *sub_10000D780(uint64_t a1)
{
  if (a1 <= 2970405392LL)
  {
    if (!a1)
    {
      uint64_t v1 = @"None Provided";
      return v1;
    }

    if (a1 == 562215635)
    {
      uint64_t v1 = @"Background URL Session Completion Timeout";
      return v1;
    }

LABEL_12:
    id v2 = sub_10000D550(a1);
    id v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue([v3 capitalizedString]);

    return v1;
  }

  if (a1 == 2970405393LL)
  {
    uint64_t v1 = @"Maximum States Violation";
    return v1;
  }

  if (a1 == 3490524077LL)
  {
    uint64_t v1 = @"Maximum Assertions Violation";
    return v1;
  }

  if (a1 != 3735943697LL) {
    goto LABEL_12;
  }
  uint64_t v1 = @"User-Initiated Quit";
  return v1;
}

__CFString *sub_10000D848(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) >= 5) {
    return (__CFString *)(id)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%llu",  a1));
  }
  else {
    return *(&off_100029468 + a1 - 1);
  }
}

id sub_10000D89C(uint64_t a1)
{
  uint64_t v1 = a1 - 1;
  if ((unint64_t)(a1 - 1) < 5 && ((0x1Du >> v1) & 1) != 0)
  {
    id v4 = *(&off_100029490 + v1);
  }

  else
  {
    id v2 = sub_10000D848(a1);
    id v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
    id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 capitalizedString]);
  }

  return v4;
}

__CFString *sub_10000D8FC(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) >= 3) {
    return (__CFString *)(id)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%llu",  a1));
  }
  else {
    return *(&off_1000294B8 + a1 - 1);
  }
}

id sub_10000D950(uint64_t a1)
{
  uint64_t v1 = sub_10000D8FC(a1);
  id v2 = (void *)objc_claimAutoreleasedReturnValue(v1);
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 capitalizedString]);

  return v3;
}

__CFString *sub_10000D988(uint64_t a1)
{
  switch(a1)
  {
    case 1LL:
      return @"service timeout";
    case 1001LL:
      return @"chronokit";
    case 2LL:
      uint64_t v1 = @"timeout no diags";
      break;
    default:
      uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%llu", a1));
      break;
  }

  return v1;
}

__CFString *sub_10000D9FC(uint64_t a1)
{
  if (a1 == 2)
  {
    uint64_t v1 = @"Service Timeout Diagnostics Unavailable";
  }

  else if (a1 == 1001)
  {
    uint64_t v1 = @"ChronoKit";
  }

  else
  {
    id v2 = sub_10000D988(a1);
    id v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue([v3 capitalizedString]);
  }

  return v1;
}

__CFString *sub_10000DA5C(uint64_t a1)
{
  if (a1 == 1) {
    return @"api violation";
  }
  if (a1 == 2) {
    uint64_t v1 = @"internal error";
  }
  else {
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%llu", a1));
  }
  return v1;
}

__CFString *sub_10000DABC(uint64_t a1)
{
  if (a1 == 1)
  {
    uint64_t v1 = @"API Violation";
  }

  else
  {
    id v2 = sub_10000DA5C(a1);
    id v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue([v3 capitalizedString]);
  }

  return v1;
}

id sub_10000DB08(uint64_t a1)
{
  uint64_t v1 = a1 - 1;
  else {
    id v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%llu", a1));
  }
  return v2;
}

id sub_10000DB6C(uint64_t a1)
{
  uint64_t v1 = a1 - 11;
  if ((unint64_t)(a1 - 11) < 0xB && ((0x60Fu >> v1) & 1) != 0)
  {
    id v4 = *(&off_100029578 + v1);
  }

  else
  {
    id v2 = sub_10000DB08(a1);
    id v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
    id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 capitalizedString]);
  }

  return v4;
}

id sub_10000DBCC(int a1, uint64_t a2)
{
  switch(a1)
  {
    case 1:
      id v2 = sub_10000CE70(a2);
      id v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
      break;
    case 2:
      id v4 = sub_10000CE1C(a2);
      id v3 = (void *)objc_claimAutoreleasedReturnValue(v4);
      break;
    case 3:
      id v5 = sub_10000D1E4(a2);
      id v3 = (void *)objc_claimAutoreleasedReturnValue(v5);
      break;
    case 6:
      id v6 = sub_10000D490(a2);
      id v3 = (void *)objc_claimAutoreleasedReturnValue(v6);
      break;
    case 7:
      id v7 = sub_10000D3C8(a2);
      id v3 = (void *)objc_claimAutoreleasedReturnValue(v7);
      break;
    case 9:
      uint64_t v8 = sub_10000D270(a2);
      id v3 = (void *)objc_claimAutoreleasedReturnValue(v8);
      break;
    case 10:
      id v9 = sub_10000CF20(a2);
      id v3 = (void *)objc_claimAutoreleasedReturnValue(v9);
      break;
    case 15:
      uint64_t v10 = sub_10000D550(a2);
      id v3 = (void *)objc_claimAutoreleasedReturnValue(v10);
      break;
    case 18:
      id v11 = sub_10000D89C(a2);
      id v3 = (void *)objc_claimAutoreleasedReturnValue(v11);
      break;
    case 20:
      uint64_t v12 = sub_10000D988(a2);
      id v3 = (void *)objc_claimAutoreleasedReturnValue(v12);
      break;
    case 22:
      uint64_t v13 = sub_10000DA5C(a2);
      id v3 = (void *)objc_claimAutoreleasedReturnValue(v13);
      break;
    case 23:
      uint64_t v14 = sub_10000D328(a2);
      id v3 = (void *)objc_claimAutoreleasedReturnValue(v14);
      break;
    case 27:
      double v15 = sub_10000D8FC(a2);
      id v3 = (void *)objc_claimAutoreleasedReturnValue(v15);
      break;
    case 32:
      id v16 = sub_10000DB08(a2);
      id v3 = (void *)objc_claimAutoreleasedReturnValue(v16);
      break;
    default:
      id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%llu", a2));
      break;
  }

  return v3;
}

id sub_10000DD04(int a1, uint64_t a2)
{
  switch(a1)
  {
    case 1:
      id v2 = sub_10000CEC0(a2);
      id v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
      break;
    case 2:
      id v4 = sub_10000CE1C(a2);
      id v3 = (void *)objc_claimAutoreleasedReturnValue(v4);
      break;
    case 3:
      id v5 = sub_10000D238(a2);
      id v3 = (void *)objc_claimAutoreleasedReturnValue(v5);
      break;
    case 6:
      id v6 = sub_10000D4F0(a2);
      id v3 = (void *)objc_claimAutoreleasedReturnValue(v6);
      break;
    case 7:
      id v7 = sub_10000D41C(a2);
      id v3 = (void *)objc_claimAutoreleasedReturnValue(v7);
      break;
    case 9:
      id v8 = sub_10000D2C4(a2);
      id v3 = (void *)objc_claimAutoreleasedReturnValue(v8);
      break;
    case 10:
      id v9 = sub_10000D12C(a2);
      id v3 = (void *)objc_claimAutoreleasedReturnValue(v9);
      break;
    case 15:
      uint64_t v10 = sub_10000D780(a2);
      id v3 = (void *)objc_claimAutoreleasedReturnValue(v10);
      break;
    case 18:
      id v11 = sub_10000D89C(a2);
      id v3 = (void *)objc_claimAutoreleasedReturnValue(v11);
      break;
    case 20:
      uint64_t v12 = sub_10000D9FC(a2);
      id v3 = (void *)objc_claimAutoreleasedReturnValue(v12);
      break;
    case 22:
      uint64_t v13 = sub_10000DABC(a2);
      id v3 = (void *)objc_claimAutoreleasedReturnValue(v13);
      break;
    case 23:
      uint64_t v14 = sub_10000D37C(a2);
      id v3 = (void *)objc_claimAutoreleasedReturnValue(v14);
      break;
    case 27:
      id v15 = sub_10000D950(a2);
      id v3 = (void *)objc_claimAutoreleasedReturnValue(v15);
      break;
    case 32:
      id v16 = sub_10000DB6C(a2);
      id v3 = (void *)objc_claimAutoreleasedReturnValue(v16);
      break;
    default:
      id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%#llx", a2));
      break;
  }

  return v3;
}

void sub_10000DEB0(uint64_t a1)
{
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  id v2 = (void *)qword_100036568;
  qword_100036568 = (uint64_t)v1;
}

void sub_10000E004(uint64_t a1)
{
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  id v2 = (void *)qword_100036578;
  qword_100036578 = (uint64_t)v1;
}

void sub_10000E2D8(uint64_t a1)
{
  id v1 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) identifier]);
  id v5 = (id)objc_claimAutoreleasedReturnValue( +[BSMutableServiceInterface interfaceWithIdentifier:]( &OBJC_CLASS___BSMutableServiceInterface,  "interfaceWithIdentifier:",  v1));

  id v2 = (void *)objc_claimAutoreleasedReturnValue( +[BSObjCProtocol protocolForProtocol:]( &OBJC_CLASS___BSObjCProtocol,  "protocolForProtocol:",  &OBJC_PROTOCOL___HangHUDServerProtocol));
  [v5 setServer:v2];

  id v3 = [v5 copy];
  id v4 = (void *)qword_100036588;
  qword_100036588 = (uint64_t)v3;
}

uint64_t start()
{
  id v0 = sub_10000A4EC();
  id v1 = (os_log_s *)objc_claimAutoreleasedReturnValue(v0);
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEBUG)) {
    sub_1000166D8(v1);
  }

  id v2 = objc_autoreleasePoolPush();
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[HUDRenderServer sharedInstance](&OBJC_CLASS___HUDRenderServer, "sharedInstance"));
  [v3 start];

  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[HangHUDServiceSpecification domainName](&OBJC_CLASS___HangHUDServiceSpecification, "domainName"));
  id v5 =  +[BSServicesConfiguration activateManualDomain:]( &OBJC_CLASS___BSServicesConfiguration,  "activateManualDomain:",  v4);

  objc_autoreleasePoolPop(v2);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop mainRunLoop](&OBJC_CLASS___NSRunLoop, "mainRunLoop"));
  [v6 run];

  return 0LL;
}

void sub_10000E994(id a1)
{
  id v1 = -[ProcessExitFetcher initWithMonitorID:fetchIntervalMs:]( objc_alloc(&OBJC_CLASS___ProcessExitFetcher),  "initWithMonitorID:fetchIntervalMs:",  @"com.apple.HangHUD",  250.0);
  id v2 = (void *)qword_100036598;
  qword_100036598 = (uint64_t)v1;
}

void sub_10000EB18(id a1)
{
  dispatch_queue_t v1 = dispatch_queue_create("com.apple.HangHUD.ProcExitFetchQueue", 0LL);
  id v2 = (void *)qword_1000365A8;
  qword_1000365A8 = (uint64_t)v1;
}

void sub_10000EE4C(uint64_t a1)
{
  id v3 = [*(id *)(*(void *)(a1 + 32) + 32) copy];
  [*(id *)(a1 + 32) fetchProcessExitInfo];
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 24LL);
  if (v2) {
    (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);
  }
}

void sub_10000F020(id a1)
{
  v3[0] = @"HTProfile";
  v3[1] = @"HTEPL";
  v3[2] = @"HTThirdPartyDevSupport";
  v3[3] = @"PLTasking";
  v3[4] = &stru_100029C00;
  v3[5] = @"PDSEHangTracer";
  v3[6] = @"PDSEHTThirdParty";
  v3[7] = @"PDSEWorkflowResponsiveness";
  v3[8] = @"PDSEHTRateOnly";
  v3[9] = @"PDSESentry";
  v3[10] = @"PDSEAppLaunch";
  uint64_t v1 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v3, 11LL));
  uint64_t v2 = (void *)qword_1000365C0;
  qword_1000365C0 = v1;
}

void sub_100010E08(id a1)
{
  uint64_t v1 = objc_alloc_init(&OBJC_CLASS___HTPrefs);
  uint64_t v2 = (void *)qword_1000365C8;
  qword_1000365C8 = (uint64_t)v1;
}

void sub_100012D1C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, char a25, uint64_t a26, uint64_t a27, uint64_t a28, char a29, uint64_t a30, uint64_t a31, uint64_t a32, char a33)
{
}

void sub_100012D80(uint64_t a1, int a2)
{
  if (*(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) == a2)
  {
    id v3 = sub_1000031C4();
    id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      id v5 = "HTPrefs: Tasking Changed";
LABEL_16:
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, v5, buf, 2u);
    }
  }

  else if (*(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) == a2)
  {
    id v6 = sub_1000031C4();
    id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      id v5 = "HTPrefs: Telemetry Changed";
      goto LABEL_16;
    }
  }

  else if (*(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL) == a2)
  {
    id v7 = sub_1000031C4();
    id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      id v5 = "HTPrefs: Profile List Changed";
      goto LABEL_16;
    }
  }

  else if (*(_DWORD *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 24LL) == a2)
  {
    id v8 = sub_1000031C4();
    id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      id v5 = "HTPrefs: EPL State Changed";
      goto LABEL_16;
    }
  }

  else
  {
    if (*(_DWORD *)(*(void *)(*(void *)(a1 + 72) + 8LL) + 24LL) != a2) {
      goto LABEL_18;
    }
    id v9 = sub_1000031C4();
    id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      id v5 = "HTPrefs: HT Self-Enablement State Changed Triggered Refresh";
      goto LABEL_16;
    }
  }

LABEL_18:
  uint64_t v10 = (id *)(a1 + 80);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 80));
  unsigned int v12 = [WeakRetained hangtracerDaemonEnabled];

  [*(id *)(a1 + 32) refreshHTPrefs];
  id v13 = objc_loadWeakRetained((id *)(a1 + 80));
  LODWORD(WeakRetained) = [v13 hangtracerDaemonEnabled];

  if (v12 != (_DWORD)WeakRetained)
  {
    id v14 = sub_1000031C4();
    id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      if (v12) {
        id v16 = @"ON";
      }
      else {
        id v16 = @"OFF";
      }
      id v17 = objc_loadWeakRetained(v10);
      else {
        uint64_t v18 = @"OFF";
      }
      *(_DWORD *)buf = 138412546;
      uint64_t v27 = v16;
      __int16 v28 = 2112;
      unint64_t v29 = v18;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_INFO,  "HTPrefs: HangTracer Enabled State Changed: %@ -> %@",  buf,  0x16u);
    }

    id v19 = objc_loadWeakRetained(v10);
    id v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  objc_msgSend(v19, "hangtracerDaemonEnabled", @"Enabled")));
    uint64_t v25 = v20;
    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v25,  &v24,  1LL));

    uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    id v23 = objc_loadWeakRetained(v10);
    [v22 postNotificationName:@"com.apple.hangtracer.daemonstate" object:v23 userInfo:v21];
  }

void sub_1000130D0(uint64_t a1, int a2)
{
  if (*(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) == a2)
  {
    id v2 = sub_1000031C4();
    id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v4 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "HTPrefs: Test Reset Log Limits", v4, 2u);
    }
  }

void sub_100013B18(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
}

  ;
}

  ;
}

  ;
}

void sub_100013B50(id a1)
{
  byte_1000365E0 = MGGetBoolAnswer(@"8S7ydMJ4DlCUF38/hI/fJA");
}

void sub_100013B74(id a1)
{
  byte_1000365F0 = MGGetSInt32Answer(@"DeviceClassNumber", 0xFFFFFFFFLL) == 3;
}

void sub_100013BA4(id a1)
{
  byte_100036600 = MGGetSInt32Answer(@"DeviceClassNumber", 0xFFFFFFFFLL) == 6;
}

void sub_100013BD4(id a1)
{
  byte_100036610 = MGGetSInt32Answer(@"DeviceClassNumber", 0xFFFFFFFFLL) == 4;
}

void sub_100013C04(id a1)
{
  byte_100036620 = MGGetSInt32Answer(@"DeviceClassNumber", 0xFFFFFFFFLL) == 11;
}

double sub_100013C34()
{
  if (qword_100036608 != -1) {
    dispatch_once(&qword_100036608, &stru_100029A50);
  }
  if (byte_100036610)
  {
    id v0 = (void *)objc_claimAutoreleasedReturnValue(+[CADisplay mainDisplay](&OBJC_CLASS___CADisplay, "mainDisplay"));
    [v0 bounds];
    if (v1 <= 1920.0) {
      double v2 = 28.0;
    }
    else {
      double v2 = 42.0;
    }
  }

  else
  {
    if (qword_1000365F8 != -1) {
      dispatch_once(&qword_1000365F8, &stru_100029A30);
    }
    if (byte_100036600)
    {
      double v3 = sub_100013D78();
      if (v3 > 170.0 || v3 < 1.0) {
        return 24.0;
      }
      else {
        return 22.0;
      }
    }

    else
    {
      if (qword_100036618 != -1) {
        dispatch_once(&qword_100036618, &stru_100029A70);
      }
      double v2 = 22.0;
      if (!byte_100036620)
      {
        if (-[HUDLine contentScaleForTexts]_0() == 3.0) {
          return 40.0;
        }
        else {
          return 28.0;
        }
      }
    }
  }

  return v2;
}

double sub_100013D78()
{
  double result = *(double *)&qword_100036648;
  if (*(double *)&qword_100036648 <= 0.0)
  {
    if (qword_100036608 != -1) {
      dispatch_once(&qword_100036608, &stru_100029A50);
    }
    int v1 = byte_100036610;
    double v2 = (void *)objc_claimAutoreleasedReturnValue(+[CADisplay mainDisplay](&OBJC_CLASS___CADisplay, "mainDisplay"));
    [v2 bounds];
    double v4 = fmax(v3, 1920.0);
    if (!v1) {
      double v4 = v3;
    }
    qword_100036648 = *(void *)&v4;

    double result = *(double *)&qword_100036648 / -[HUDLine contentScaleForTexts]_0();
    qword_100036648 = *(void *)&result;
  }

  return result;
}

void sub_100013ED0()
{
  if (*(double *)&qword_100036628 <= 0.0)
  {
    double v0 = sub_100013C34();
    *(double *)&qword_100036628 = v0 / -[HUDLine contentScaleForTexts]_0();
  }

double sub_100013F14()
{
  double v0 = *(double *)&qword_100036630;
  int v1 = (void *)objc_claimAutoreleasedReturnValue(+[CADisplay mainDisplay](&OBJC_CLASS___CADisplay, "mainDisplay"));
  double v2 = (void *)objc_claimAutoreleasedReturnValue([v1 currentOrientation]);

  if (qword_1000365F8 != -1) {
    dispatch_once(&qword_1000365F8, &stru_100029A30);
  }
  double v3 = 20.0;
  if (!byte_100036600)
  {
    if (qword_1000365E8 != -1) {
      dispatch_once(&qword_1000365E8, &stru_100029A10);
    }
    double v3 = 50.0;
    if (!byte_1000365F0
      && v2 != (void *)kCADisplayOrientationRotation270
      && v2 != (void *)kCADisplayOrientationRotation90)
    {
      if (qword_1000365D8 != -1) {
        dispatch_once(&qword_1000365D8, &stru_1000299F0);
      }
      if (byte_1000365E0)
      {
        if (-[HUDLine contentScaleForTexts]_0() == 2.0)
        {
          double v3 = 100.0;
          goto LABEL_5;
        }

        if (qword_1000365D8 != -1) {
          dispatch_once(&qword_1000365D8, &stru_1000299F0);
        }
      }

      if (byte_1000365E0 && -[HUDLine contentScaleForTexts]_0() == 3.0)
      {
        double v3 = 150.0;
      }

      else
      {
        if (qword_100036608 != -1) {
          dispatch_once(&qword_100036608, &stru_100029A50);
        }
        int v7 = byte_100036610;
        double v8 = -[HUDLine contentScaleForTexts]_0();
        if (v7) {
          double v3 = dbl_10001C100[v8 > 1.0];
        }
        else {
          double v3 = v8 * 25.0;
        }
      }
    }
  }

LABEL_5:
  qword_100036630 = *(void *)&v3;
  *(double *)&qword_100036630 = v3 / -[HUDLine contentScaleForTexts]_0();
  id v4 = sub_1000031C4();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_100016BCC((uint64_t)v2, v5);
  }

  double v0 = *(double *)&qword_100036630;
  return v0;
}

void sub_100014150()
{
  if (*(double *)&qword_100036638 <= 0.0)
  {
    if (qword_1000365D8 != -1) {
      dispatch_once(&qword_1000365D8, &stru_1000299F0);
    }
    double v0 = 25.0;
    if (!byte_1000365E0) {
      double v0 = sub_100013F14();
    }
    qword_100036638 = *(void *)&v0;
  }

double sub_1000141B8()
{
  double result = *(double *)&qword_100036640;
  if (*(double *)&qword_100036640 <= 0.0)
  {
    if (qword_1000365F8 != -1) {
      dispatch_once(&qword_1000365F8, &stru_100029A30);
    }
    double v1 = 5.0;
    if (!byte_100036600)
    {
      double v2 = -[HUDLine contentScaleForTexts]_0();
      if (qword_1000365E8 != -1)
      {
        double v4 = v2;
        dispatch_once(&qword_1000365E8, &stru_100029A10);
        double v2 = v4;
      }

      double v3 = 10.0;
      if (!byte_1000365F0) {
        double v3 = 8.0;
      }
      double v1 = v2 * v3;
    }

    qword_100036640 = *(void *)&v1;
    double result = v1 / -[HUDLine contentScaleForTexts]_0();
    qword_100036640 = *(void *)&result;
  }

  return result;
}

double sub_100014284()
{
  double result = *(double *)&qword_100036650;
  if (*(double *)&qword_100036650 <= 0.0)
  {
    if (qword_100036608 != -1) {
      dispatch_once(&qword_100036608, &stru_100029A50);
    }
    int v1 = byte_100036610;
    double v2 = (void *)objc_claimAutoreleasedReturnValue(+[CADisplay mainDisplay](&OBJC_CLASS___CADisplay, "mainDisplay"));
    [v2 bounds];
    double v4 = fmax(v3, 1080.0);
    if (!v1) {
      double v4 = v3;
    }
    qword_100036650 = *(void *)&v4;

    double result = *(double *)&qword_100036650 / -[HUDLine contentScaleForTexts]_0();
    qword_100036650 = *(void *)&result;
  }

  return result;
}

void sub_100014328()
{
  if (*(double *)&qword_100036660 <= 0.0)
  {
    double v0 = sub_100013D78();
    double v1 = fmin(v0, sub_100014284());
    sub_100014150();
    *(double *)&qword_100036660 = v1 + v2 * -2.0;
  }

double sub_100014378()
{
  if (qword_100036668 != -1) {
    dispatch_once(&qword_100036668, &stru_100029A90);
  }
  return *(double *)&qword_100036670;
}

void sub_1000143B8(id a1)
{
  if (qword_1000365F8 != -1) {
    dispatch_once(&qword_1000365F8, &stru_100029A30);
  }
  double v1 = 2.0;
  if (!byte_100036600) {
    double v1 = 20.0;
  }
  qword_100036670 = *(void *)&v1;
  *(double *)&qword_100036670 = v1 / -[HUDLine contentScaleForTexts]_0();
}

double sub_100014428()
{
  if (qword_100036678 != -1) {
    dispatch_once(&qword_100036678, &stru_100029AB0);
  }
  return *(double *)&qword_100036680;
}

void sub_100014468(id a1)
{
  if (qword_1000365F8 != -1) {
    dispatch_once(&qword_1000365F8, &stru_100029A30);
  }
  double v1 = 2.0;
  if (!byte_100036600) {
    double v1 = 20.0;
  }
  qword_100036680 = *(void *)&v1;
  *(double *)&qword_100036680 = v1 / -[HUDLine contentScaleForTexts]_0();
}

void sub_1000144D8()
{
  qword_100036630 = 0LL;
  qword_100036638 = 0LL;
  qword_100036660 = 0LL;
}

void sub_1000144F4()
{
  qword_100036628 = 0LL;
  qword_100036630 = 0LL;
  qword_100036638 = 0LL;
  qword_100036640 = 0LL;
  qword_100036648 = 0LL;
  qword_100036650 = 0LL;
  qword_100036658 = 0LL;
  qword_100036660 = 0LL;
}

uint64_t sub_100014538(void *a1, uint64_t a2, double a3)
{
  id v5 = a1;
  double v6 = sub_100014AF4(a2 - (void)[v5 receivedTimestamp]);
  id v7 = sub_1000031C4();
  double v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    int v12 = 134217984;
    double v13 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_INFO,  "durationSinceLastUpdateMs: %f",  (uint8_t *)&v12,  0xCu);
  }

  if ([v5 hangEndTime] == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    if (v6 <= a3)
    {
      uint64_t v9 = 1LL;
      goto LABEL_9;
    }

id sub_100014660(void *a1, unsigned int a2)
{
  double v3 = (void *)objc_claimAutoreleasedReturnValue([a1 keysSortedByValueWithOptions:0 usingComparator:&stru_100029AF0]);
  double v4 = 0LL;
  id v5 = [v3 count];
  else {
    unint64_t v6 = (unint64_t)v5;
  }
  id v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "subarrayWithRange:", v4, v6));

  return v7;
}

int64_t sub_1000146E8(id a1, HTHangHUDInfo *a2, HTHangHUDInfo *a3)
{
  double v4 = a2;
  id v5 = a3;
  id v6 = -[HTHangHUDInfo hangStartTime](v4, "hangStartTime");
  if (v6 == (id)-[HTHangHUDInfo hangStartTime](v5, "hangStartTime"))
  {
    int64_t v7 = 0LL;
  }

  else
  {
    id v8 = -[HTHangHUDInfo hangStartTime](v4, "hangStartTime");
    if (v8 > (id)-[HTHangHUDInfo hangStartTime](v5, "hangStartTime")) {
      int64_t v7 = 1LL;
    }
    else {
      int64_t v7 = -1LL;
    }
  }

  return v7;
}

NSArray *sub_10001476C(void *a1, unsigned int a2)
{
  id v3 = a1;
  if ([v3 count])
  {
    double v4 = (void *)objc_claimAutoreleasedReturnValue([v3 keysSortedByValueUsingComparator:&stru_100029B30]);
    unint64_t v5 = a2;
    else {
      id v6 = 0LL;
    }
    id v8 = [v4 count];
    else {
      id v9 = v8;
    }
    int64_t v7 = (NSArray *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "subarrayWithRange:", v6, v9));
  }

  else
  {
    int64_t v7 = objc_alloc_init(&OBJC_CLASS___NSArray);
  }

  return v7;
}

int64_t sub_100014820(id a1, HUDContentProtocol *a2, HUDContentProtocol *a3)
{
  double v4 = a3;
  id v5 = -[HUDContentProtocol compareValue](a2, "compareValue");
  id v6 = -[HUDContentProtocol compareValue](v4, "compareValue");

  int64_t v7 = 1LL;
  if (v5 <= v6) {
    int64_t v7 = -1LL;
  }
  if (v5 == v6) {
    return 0LL;
  }
  else {
    return v7;
  }
}

uint64_t sub_100014878(void *a1, _BYTE *a2)
{
  id v3 = a1;
  double v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 persistentDomainForName:@"com.apple.HangHUD"]);
  id v6 = v5;
  if (v5)
  {
    int64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:v3]);
    if (v7 && (uint64_t v8 = objc_opt_class(&OBJC_CLASS___NSString), (objc_opt_isKindOfClass(v7, v8) & 1) != 0))
    {
      *a2 = [v7 isEqualToString:@"YES"];
      uint64_t v9 = 1LL;
    }

    else
    {
      uint64_t v9 = 0LL;
    }
  }

  else
  {
    uint64_t v9 = 0LL;
  }

  return v9;
}

uint64_t sub_100014948()
{
  double v0 = &v2;
  if ((sub_100014878(@"UseHangHUD", &v2) & 1) == 0)
  {
    if (qword_100036688 != -1) {
      dispatch_once(&qword_100036688, &stru_100029B60);
    }
    double v0 = &byte_100036690;
  }

  return *v0;
}

void sub_1000149B4(id a1)
{
  byte_100036690 = _os_feature_enabled_impl("HangTracer", "useHangHUD");
}

uint64_t sub_1000149E0()
{
  LODWORD(result) = sub_100014878(@"IgnoreHangInfoFromHangHUDClients", &v1);
  if (v1) {
    return result;
  }
  else {
    return 0LL;
  }
}

uint64_t sub_100014A14()
{
  double v0 = (void *)CFPreferencesCopyValue( @"EnhancedBackgroundContrastEnabled",  @"com.apple.Accessibility",  @"mobile",  kCFPreferencesAnyHost);
  uint64_t v1 = [v0 BOOLValue] ^ 1;

  return v1;
}

double sub_100014A6C()
{
  if (qword_1000366A0 != -1) {
    dispatch_once(&qword_1000366A0, &stru_100029B80);
  }
  return *(double *)&qword_100036698;
}

void sub_100014AAC(id a1)
{
  *(double *)&qword_100036698 = (float)((float)((float)info.numer * 0.000001) / (float)info.denom);
}

double sub_100014AF4(unint64_t a1)
{
  if (qword_1000366A0 != -1) {
    dispatch_once(&qword_1000366A0, &stru_100029B80);
  }
  return *(double *)&qword_100036698 * (double)a1;
}

double sub_100014B48(unint64_t a1)
{
  if (qword_1000366A0 != -1) {
    dispatch_once(&qword_1000366A0, &stru_100029B80);
  }
  return *(double *)&qword_100036698 * (double)a1 / 1000.0;
}

double sub_100014BA8(unint64_t a1)
{
  if (qword_1000366A0 != -1) {
    dispatch_once(&qword_1000366A0, &stru_100029B80);
  }
  return (double)a1 / *(double *)&qword_100036698;
}

void sub_100014E28(id a1)
{
  CGColorRef SRGB = CGColorCreateSRGB(1.0, 1.0, 1.0, 1.0);
  cf = CGColorCreateSRGB(0.996078431, 0.992156863, 1.0, 1.0);
  CGColorRef CopyWithAlpha = CGColorCreateCopyWithAlpha(cf, 0.67);
  uint64_t v2 = kCAFilterVibrantColorMatrix;
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[CAFilter filterWithType:](&OBJC_CLASS___CAFilter, "filterWithType:", kCAFilterVibrantColorMatrix));
  [v3 setName:@"vibrantColorLightOrange"];
  __int128 v22 = xmmword_10001C1B0;
  __int128 v23 = xmmword_10001C1C0;
  __int128 v24 = xmmword_10001C1D0;
  __int128 v25 = xmmword_10001C1E0;
  __int128 v26 = xmmword_10001C1F0;
  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithCAColorMatrix:](&OBJC_CLASS___NSValue, "valueWithCAColorMatrix:", &v22));
  uint64_t v4 = kCAFilterInputColorMatrix;
  [v3 setValue:v21 forKey:kCAFilterInputColorMatrix];
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[CAFilter filterWithType:](&OBJC_CLASS___CAFilter, "filterWithType:", v2));
  [v5 setName:@"vibrantColorLightRed"];
  __int128 v22 = xmmword_10001C1B0;
  __int128 v23 = xmmword_10001C200;
  __int128 v24 = xmmword_10001C210;
  __int128 v25 = xmmword_10001C220;
  __int128 v26 = xmmword_10001C1F0;
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithCAColorMatrix:](&OBJC_CLASS___NSValue, "valueWithCAColorMatrix:", &v22));
  id v6 = v5;
  id v16 = v5;
  [v5 setValue:v18 forKey:v4];
  CGColorRef v17 = CGColorCreateSRGB(0.0, 0.0, 0.0, 1.0);
  CGColorRef v7 = CGColorCreateSRGB(0.556862745, 0.556862745, 0.576470588, 1.0);
  uint64_t v8 = CGColorCreateSRGB(0.921568627, 0.537254902, 0.0, 1.0);
  CGColorRef v9 = CGColorCreateCopyWithAlpha(v8, 0.67);
  double v10 = CGColorCreateSRGB(0.949019608, 0.219607843, 0.180392157, 1.0);
  CGColorRef v11 = CGColorCreateCopyWithAlpha(v10, 0.67);
  CGColorRef v12 = CGColorCreateSRGB(0.0, 0.0, 0.0, 1.0);
  CGColorRef v13 = CGColorCreateSRGB(0.396078431, 0.396078431, 0.396078431, 1.0);
  id v14 = -[HUDTheme initWithPreviousHangTextColor:currentHangTextColor:currentHangSevereTextColor:previousHangSevereTextColor:currentHangCriticalTextColor:previousHangCriticalTextColor:backgroundColor:translucentBackgroundColor:textColorSevereVibrantFilter:textColorCriticalVibrantFilter:currentProcessExitTextColor:processExitReasonNamespaceTextColor:]( objc_alloc(&OBJC_CLASS___HUDTheme),  "initWithPreviousHangTextColor:currentHangTextColor:currentHangSevereTextColor:previousHangSevereTextColor:curr entHangCriticalTextColor:previousHangCriticalTextColor:backgroundColor:translucentBackgroundColor:textColorSev ereVibrantFilter:textColorCriticalVibrantFilter:currentProcessExitTextColor:processExitReasonNamespaceTextColor:",  v7,  v17,  v8,  v9,  v10,  v11,  SRGB,  CopyWithAlpha,  v3,  v6,  v12,  v13);
  id v15 = (void *)qword_1000366B0;
  qword_1000366B0 = (uint64_t)v14;

  CFRelease(SRGB);
  CFRelease(cf);
  CFRelease(CopyWithAlpha);
  CFRelease(v17);
  CFRelease(v8);
  CFRelease(v9);
  CFRelease(v7);
  CFRelease(v10);
  CFRelease(v11);
  CFRelease(v12);
  CFRelease(v13);
}

void sub_1000151A8(id a1)
{
  CGColorRef SRGB = CGColorCreateSRGB(0.141176471, 0.141176471, 0.156862745, 1.0);
  cf = CGColorCreateSRGB(0.117647059, 0.117647059, 0.117647059, 1.0);
  CGColorRef CopyWithAlpha = CGColorCreateCopyWithAlpha(cf, 0.5);
  uint64_t v2 = kCAFilterVibrantColorMatrix;
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[CAFilter filterWithType:](&OBJC_CLASS___CAFilter, "filterWithType:", kCAFilterVibrantColorMatrix));
  [v3 setName:@"vibrantColorDarkOrange"];
  __int128 v22 = xmmword_10001C1B0;
  __int128 v23 = xmmword_10001C230;
  __int128 v24 = xmmword_10001C240;
  __int128 v25 = xmmword_10001C250;
  __int128 v26 = xmmword_10001C1F0;
  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithCAColorMatrix:](&OBJC_CLASS___NSValue, "valueWithCAColorMatrix:", &v22));
  uint64_t v4 = kCAFilterInputColorMatrix;
  [v3 setValue:v21 forKey:kCAFilterInputColorMatrix];
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[CAFilter filterWithType:](&OBJC_CLASS___CAFilter, "filterWithType:", v2));
  [v5 setName:@"vibrantColorDarkRed"];
  __int128 v22 = xmmword_10001C260;
  __int128 v23 = xmmword_10001C270;
  __int128 v24 = xmmword_10001C280;
  __int128 v25 = xmmword_10001C290;
  __int128 v26 = xmmword_10001C1F0;
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithCAColorMatrix:](&OBJC_CLASS___NSValue, "valueWithCAColorMatrix:", &v22));
  id v6 = v5;
  id v16 = v5;
  [v5 setValue:v18 forKey:v4];
  CGColorRef v17 = CGColorCreateSRGB(1.0, 1.0, 1.0, 1.0);
  CGColorRef v7 = CGColorCreateSRGB(0.556862745, 0.556862745, 0.576470588, 1.0);
  uint64_t v8 = CGColorCreateSRGB(1.0, 0.584313725, 0.0392156863, 1.0);
  CGColorRef v9 = CGColorCreateCopyWithAlpha(v8, 0.67);
  double v10 = CGColorCreateSRGB(1.0, 0.270588235, 0.22745098, 1.0);
  CGColorRef v11 = CGColorCreateCopyWithAlpha(v10, 0.67);
  CGColorRef v12 = CGColorCreateSRGB(1.0, 1.0, 1.0, 1.0);
  CGColorRef v13 = CGColorCreateSRGB(0.556862745, 0.556862745, 0.576470588, 1.0);
  id v14 = -[HUDTheme initWithPreviousHangTextColor:currentHangTextColor:currentHangSevereTextColor:previousHangSevereTextColor:currentHangCriticalTextColor:previousHangCriticalTextColor:backgroundColor:translucentBackgroundColor:textColorSevereVibrantFilter:textColorCriticalVibrantFilter:currentProcessExitTextColor:processExitReasonNamespaceTextColor:]( objc_alloc(&OBJC_CLASS___HUDTheme),  "initWithPreviousHangTextColor:currentHangTextColor:currentHangSevereTextColor:previousHangSevereTextColor:curr entHangCriticalTextColor:previousHangCriticalTextColor:backgroundColor:translucentBackgroundColor:textColorSev ereVibrantFilter:textColorCriticalVibrantFilter:currentProcessExitTextColor:processExitReasonNamespaceTextColor:",  v7,  v17,  v8,  v9,  v10,  v11,  SRGB,  CopyWithAlpha,  v3,  v6,  v12,  v13);
  id v15 = (void *)qword_1000366C0;
  qword_1000366C0 = (uint64_t)v14;

  CFRelease(SRGB);
  CFRelease(cf);
  CFRelease(CopyWithAlpha);
  CFRelease(v17);
  CFRelease(v8);
  CFRelease(v9);
  CFRelease(v7);
  CFRelease(v10);
  CFRelease(v11);
  CFRelease(v12);
  CFRelease(v13);
}

void sub_100015614(os_log_s *a1, double a2, uint64_t a3, uint64_t a4)
{
  int v4 = 134217984;
  double v5 = a2;
  sub_100001D64( (void *)&_mh_execute_header,  a1,  a4,  "TextAnimation: no need to update duraton since _hangDuration is equal to the input %f.",  (uint8_t *)&v4);
  sub_100001D70();
}

void sub_100015680(os_log_s *a1, double a2, uint64_t a3, uint64_t a4)
{
  int v4 = 134217984;
  double v5 = a2;
  sub_100001D64( (void *)&_mh_execute_header,  a1,  a4,  "TextAnimation: duration layer's animation object updated with toValue = %f",  (uint8_t *)&v4);
  sub_100001D70();
}

void sub_1000156EC(void *a1, os_log_s *a2, double a3)
{
  double v5 = (void *)objc_claimAutoreleasedReturnValue([a1 string]);
  int v6 = 138412546;
  CGColorRef v7 = v5;
  __int16 v8 = 2048;
  double v9 = a3;
  _os_log_debug_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_DEBUG,  "TextAnimation: duration layer's animation object initialized: text set as %@ for a given duration %f",  (uint8_t *)&v6,  0x16u);
}

void sub_100015798(os_log_s *a1, double a2, uint64_t a3, uint64_t a4)
{
  int v4 = 134217984;
  double v5 = a2;
  sub_100001D64((void *)&_mh_execute_header, a1, a4, "TextAnimation: animation ended with duration %f", (uint8_t *)&v4);
  sub_100001D70();
}

void sub_100015804(id *a1, os_log_s *a2)
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue([*a1 string]);
  int v5 = 138412290;
  int v6 = v3;
  sub_100001D64((void *)&_mh_execute_header, a2, v4, "TextAnimation:  duration layer's text set as %@", (uint8_t *)&v5);
}

void sub_100015894( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000158FC( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100015964(void *a1, char *a2)
{
}

void sub_1000159D4( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100015A04()
{
}

void sub_100015A70(os_log_t log)
{
  int v1 = 138412546;
  uint64_t v2 = @"IgnoreHangInfoFromHangHUDClients";
  __int16 v3 = 2112;
  uint64_t v4 = @"com.apple.HangHUD";
  _os_log_debug_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_DEBUG,  "HangHUD is ignoring hang data from its client. This happens only when the user defaults %@ under %@ domain is set, a nd it's used for testing purpose.",  (uint8_t *)&v1,  0x16u);
  sub_100001D70();
}

void sub_100015B08( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100015B38(os_log_s *a1, uint64_t a2, uint64_t a3)
{
  int v3 = 136315138;
  uint64_t v4 = "-[HUDRenderServer receiveHangHUDInfo:completion:]";
  sub_100001D64( (void *)&_mh_execute_header,  a1,  a3,  " - clear request detected @ %s . Saving that request separately from hang data.",  (uint8_t *)&v3);
  sub_100001D70();
}

void sub_100015BAC(void *a1, const char *a2)
{
}

void sub_100015C20( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100015C50(void *a1, const char *a2)
{
}

void sub_100015CC4(void *a1, os_log_s *a2)
{
  unsigned int v3 = [a1 areProcessTerminationsMonitored];
  uint64_t v5 = @"NO";
  if (v3) {
    uint64_t v5 = @"YES";
  }
  int v6 = 138412290;
  uint64_t v7 = v5;
  sub_100001D64((void *)&_mh_execute_header, a2, v4, " Process Terminations: monitoring %@", (uint8_t *)&v6);
  sub_1000066E8();
}

void sub_100015D54(os_log_s *a1, uint64_t a2, uint64_t a3)
{
  int v3 = 136315138;
  uint64_t v4 = "-[HUDRenderServer receiveHudConfiguration:completion:]";
  sub_100001D64((void *)&_mh_execute_header, a1, a3, "%s called at Angel server", (uint8_t *)&v3);
  sub_100001D70();
}

void sub_100015DC8(os_log_s *a1, uint64_t a2, uint64_t a3)
{
  int v3 = 136315138;
  uint64_t v4 = "-[HUDRenderServer receiveMonitoredStates:completion:]";
  sub_100001D64((void *)&_mh_execute_header, a1, a3, "%s called at HangHUD Angel", (uint8_t *)&v3);
  sub_100001D70();
}

void sub_100015E3C(os_log_s *a1, uint64_t a2, uint64_t a3)
{
  int v3 = 136315138;
  uint64_t v4 = "-[HUDRenderServer clearHUDWithCompletion:]";
  sub_100001D64((void *)&_mh_execute_header, a1, a3, "%s called at Angel server", (uint8_t *)&v3);
  sub_100001D70();
}

void sub_100015EB0(uint64_t a1, os_log_s *a2)
{
  sub_100001D64((void *)&_mh_execute_header, a2, v3, " ====== updater called in Timer ====== dict.count:%lu", v4);
  sub_1000066E8();
}

void sub_100015F2C(os_log_s *a1, uint64_t a2, uint64_t a3)
{
  int v3 = 136315138;
  uint64_t v4 = "-[HUDContextUpdater HandleUpdateAndClear]";
  sub_100001D64( (void *)&_mh_execute_header,  a1,  a3,  " - clear request detected @ %s . Saving that request separately from HUD content data.",  (uint8_t *)&v3);
  sub_100001D70();
}

void sub_100015FA0(id *a1, uint64_t a2, os_log_s *a3)
{
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([*a1 target]);
  sub_100006718();
  __int16 v7 = 2114;
  uint64_t v8 = a2;
  _os_log_error_impl( (void *)&_mh_execute_header,  a3,  OS_LOG_TYPE_ERROR,  "Failed to acquire render HUD assertion for target %@: %{public}@",  v6,  0x16u);
}

void sub_10001604C(void *a1, os_log_s *a2)
{
  int v4 = 134217984;
  uint64_t v5 = v3;
  _os_log_debug_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_DEBUG,  "HUD_background_opacity set to %f",  (uint8_t *)&v4,  0xCu);
}

void sub_1000160D4( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100016108( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10001613C( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000161A4( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10001620C( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100016270( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000162D4(void *a1)
{
}

void sub_100016344(uint64_t a1, os_log_s *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_DEBUG,  "No more update happens as it's completed for %@ @ HangHUDLine::update:",  (uint8_t *)&v2,  0xCu);
}

void sub_1000163B8(void *a1)
{
}

void sub_100016428( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100016498( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100016508( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100016578( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000165E8( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100016658(uint64_t a1, os_log_s *a2, double a3)
{
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2048;
  double v6 = a3;
  _os_log_debug_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_DEBUG,  "Checking if hang is current with hangID %@: durationSinceLastUpdateMs:%f",  (uint8_t *)&v3,  0x16u);
}

void sub_1000166D8(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_DEBUG,  "\n ================================ HangHUD started! =================================== \n",  v1,  2u);
}

void sub_100016718( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10001674C(int a1, os_log_s *a2)
{
  uint64_t v2 = "already enabled";
  if (!a1) {
    uint64_t v2 = "enabled";
  }
  int v3 = 136315138;
  uint64_t v4 = v2;
  _os_log_debug_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_DEBUG,  "launch_service_stats has %s.",  (uint8_t *)&v3,  0xCu);
}

void sub_1000167D8( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10001680C(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_debug_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_DEBUG,  "HTPrefs: %@ was not found in the %@ domain, a profile, by EPL, by PowerLog Tasking domain, by HT Self Enablement or by HT Sentry Enablement",  (uint8_t *)&v3,  0x16u);
}

void sub_100016890(uint64_t a1, void *a2, os_log_s *a3)
{
  *(_DWORD *)int v3 = 138412802;
  *(void *)&v3[4] = @"enablementPrefix";
  *(_WORD *)&v3[12] = 2112;
  *(void *)&v3[14] = a1;
  *(_WORD *)&v3[22] = 2112;
  sub_100013B18( (void *)&_mh_execute_header,  (uint64_t)a2,  a3,  "HTPrefs: %@: %@ -> %@",  *(void *)v3,  *(void *)&v3[8],  *(void *)&v3[16],  *a2);
  sub_100013B3C();
}

void sub_100016914()
{
}

void sub_1000169A8()
{
}

void sub_100016A3C()
{
}

void sub_100016AD0()
{
}

void sub_100016B64(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "Preparing prefInitList", v1, 2u);
}

void sub_100016BA4()
{
  __assert_rtn("-[HTPrefs setupPrefsWithQueue:]", "HTPrefs.m", 1486, "prefsQueue != NULL");
}

void sub_100016BCC(uint64_t a1, os_log_s *a2)
{
  int v4 = 134218498;
  uint64_t v5 = qword_100036630;
  __int16 v6 = 2048;
  double v7 = -[HUDLine contentScaleForTexts]_0();
  __int16 v8 = 2112;
  uint64_t v9 = a1;
  _os_log_debug_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_DEBUG,  "cachedTopMargin is set to %f where DisplayScale is %f. The orientation is %@",  (uint8_t *)&v4,  0x20u);
}

id objc_msgSend_HUD_background_opacity(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "HUD_background_opacity");
}

id objc_msgSend_HandleUpdateAndClear(void *a1, const char *a2, ...)
{
  return _[a1 HandleUpdateAndClear];
}

id objc_msgSend_HangHUD_updater_latency_in_ms(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "HangHUD_updater_latency_in_ms");
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return _[a1 UTF8String];
}

id objc_msgSend_UUID(void *a1, const char *a2, ...)
{
  return _[a1 UUID];
}

id objc_msgSend___createInternalSettings(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "__createInternalSettings");
}

id objc_msgSend__init(void *a1, const char *a2, ...)
{
  return _[a1 _init];
}

id objc_msgSend_accessibilityReducesTransparency(void *a1, const char *a2, ...)
{
  return _[a1 accessibilityReducesTransparency];
}

id objc_msgSend_acquireKeepAliveAssertion(void *a1, const char *a2, ...)
{
  return _[a1 acquireKeepAliveAssertion];
}

id objc_msgSend_acquireWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "acquireWithError:");
}

id objc_msgSend_activate(void *a1, const char *a2, ...)
{
  return _[a1 activate];
}

id objc_msgSend_activateManualDomain_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "activateManualDomain:");
}

id objc_msgSend_addAnimation_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addAnimation:forKey:");
}

id objc_msgSend_addCommitHandler_forPhase_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addCommitHandler:forPhase:");
}

id objc_msgSend_addEntriesFromDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addEntriesFromDictionary:");
}

id objc_msgSend_addHUDContents_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addHUDContents:");
}

id objc_msgSend_addIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addIndex:");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObject:");
}

id objc_msgSend_addObserver_forKeyPath_options_context_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObserver:forKeyPath:options:context:");
}

id objc_msgSend_addObserver_selector_name_object_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObserver:selector:name:object:");
}

id objc_msgSend_addSublayer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addSublayer:");
}

id objc_msgSend_addTimer_forMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addTimer:forMode:");
}

id objc_msgSend_addToRunLoop_forMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addToRunLoop:forMode:");
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return _[a1 allKeys];
}

id objc_msgSend_allKeysForObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "allKeysForObject:");
}

id objc_msgSend_allValues(void *a1, const char *a2, ...)
{
  return _[a1 allValues];
}

id objc_msgSend_animationDidStartOnLine_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "animationDidStartOnLine:");
}

id objc_msgSend_animationDidStopOnLine_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "animationDidStopOnLine:");
}

id objc_msgSend_animationForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "animationForKey:");
}

id objc_msgSend_animationWithKeyPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "animationWithKeyPath:");
}

id objc_msgSend_areProcessTerminationsMonitored(void *a1, const char *a2, ...)
{
  return _[a1 areProcessTerminationsMonitored];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return _[a1 array];
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_attributeWithDomain_name_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "attributeWithDomain:name:");
}

id objc_msgSend_backgroundColor(void *a1, const char *a2, ...)
{
  return _[a1 backgroundColor];
}

id objc_msgSend_begin(void *a1, const char *a2, ...)
{
  return _[a1 begin];
}

id objc_msgSend_beginAnimationFromValue_toValue_duration_updateBlock_completionBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "beginAnimationFromValue:toValue:duration:updateBlock:completionBlock:");
}

id objc_msgSend_BOOLProperty_contextPrefixOut_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "BOOLProperty:contextPrefixOut:");
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return _[a1 BOOLValue];
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return _[a1 bounds];
}

id objc_msgSend_bundleId(void *a1, const char *a2, ...)
{
  return _[a1 bundleId];
}

id objc_msgSend_bundleIdToAppNameCache(void *a1, const char *a2, ...)
{
  return _[a1 bundleIdToAppNameCache];
}

id objc_msgSend_canceled(void *a1, const char *a2, ...)
{
  return _[a1 canceled];
}

id objc_msgSend_capitalizedString(void *a1, const char *a2, ...)
{
  return _[a1 capitalizedString];
}

id objc_msgSend_characterSetWithCharactersInString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "characterSetWithCharactersInString:");
}

id objc_msgSend_cleanUpExpiredHUDContents(void *a1, const char *a2, ...)
{
  return _[a1 cleanUpExpiredHUDContents];
}

id objc_msgSend_clearHUDLinesAnimated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearHUDLinesAnimated:");
}

id objc_msgSend_clearHUDLinesAnimated_withCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearHUDLinesAnimated:withCompletion:");
}

id objc_msgSend_clearHUDWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearHUDWithCompletion:");
}

id objc_msgSend_clientContextIdentifierKey(void *a1, const char *a2, ...)
{
  return _[a1 clientContextIdentifierKey];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return _[a1 code];
}

id objc_msgSend_commit(void *a1, const char *a2, ...)
{
  return _[a1 commit];
}

id objc_msgSend_compareValue(void *a1, const char *a2, ...)
{
  return _[a1 compareValue];
}

id objc_msgSend_completionBlock(void *a1, const char *a2, ...)
{
  return _[a1 completionBlock];
}

id objc_msgSend_componentsSeparatedByString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "componentsSeparatedByString:");
}

id objc_msgSend_configureConnection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "configureConnection:");
}

id objc_msgSend_connectionWithEndpoint_clientContextBuilder_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "connectionWithEndpoint:clientContextBuilder:");
}

id objc_msgSend_containerLayer(void *a1, const char *a2, ...)
{
  return _[a1 containerLayer];
}

id objc_msgSend_containsObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "containsObject:");
}

id objc_msgSend_contentScaleForTexts(void *a1, const char *a2, ...)
{
  return _[a1 contentScaleForTexts];
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

id objc_msgSend_countsOfMeetingEndingConditions(void *a1, const char *a2, ...)
{
  return _[a1 countsOfMeetingEndingConditions];
}

id objc_msgSend_createContainerLayer(void *a1, const char *a2, ...)
{
  return _[a1 createContainerLayer];
}

id objc_msgSend_createInstance(void *a1, const char *a2, ...)
{
  return _[a1 createInstance];
}

id objc_msgSend_currentHangTextColorForStatus_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "currentHangTextColorForStatus:");
}

id objc_msgSend_currentOrientation(void *a1, const char *a2, ...)
{
  return _[a1 currentOrientation];
}

id objc_msgSend_currentProcessExitTextColor(void *a1, const char *a2, ...)
{
  return _[a1 currentProcessExitTextColor];
}

id objc_msgSend_currentRunLoop(void *a1, const char *a2, ...)
{
  return _[a1 currentRunLoop];
}

id objc_msgSend_currentTheme(void *a1, const char *a2, ...)
{
  return _[a1 currentTheme];
}

id objc_msgSend_darkModeTheme(void *a1, const char *a2, ...)
{
  return _[a1 darkModeTheme];
}

id objc_msgSend_dateFormatter(void *a1, const char *a2, ...)
{
  return _[a1 dateFormatter];
}

id objc_msgSend_debugDescription(void *a1, const char *a2, ...)
{
  return _[a1 debugDescription];
}

id objc_msgSend_decodeArrayOfObjectsOfClass_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "decodeArrayOfObjectsOfClass:forKey:");
}

id objc_msgSend_decodeBoolForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "decodeBoolForKey:");
}

id objc_msgSend_decodeDoubleForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "decodeDoubleForKey:");
}

id objc_msgSend_decodeInt64ForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "decodeInt64ForKey:");
}

id objc_msgSend_decodeIntForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "decodeIntForKey:");
}

id objc_msgSend_decodeIntegerForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "decodeIntegerForKey:");
}

id objc_msgSend_decodeObjectOfClass_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "decodeObjectOfClass:forKey:");
}

id objc_msgSend_decodeStringForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "decodeStringForKey:");
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return _[a1 defaultCenter];
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return _[a1 description];
}

id objc_msgSend_determineNewFrameForRootLayer_numberOfLines_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "determineNewFrameForRootLayer:numberOfLines:");
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return _[a1 dictionary];
}

id objc_msgSend_dictionaryWithContentsOfFile_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithContentsOfFile:");
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_displayId(void *a1, const char *a2, ...)
{
  return _[a1 displayId];
}

id objc_msgSend_displayLinkWithTarget_selector_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "displayLinkWithTarget:selector:");
}

id objc_msgSend_displayNameForHangInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "displayNameForHangInfo:");
}

id objc_msgSend_distantFuture(void *a1, const char *a2, ...)
{
  return _[a1 distantFuture];
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return _[a1 domain];
}

id objc_msgSend_domainName(void *a1, const char *a2, ...)
{
  return _[a1 domainName];
}

id objc_msgSend_doubleProperty_contextPrefixOut_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "doubleProperty:contextPrefixOut:");
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return _[a1 doubleValue];
}

id objc_msgSend_earlyInitNecessaryPrefs(void *a1, const char *a2, ...)
{
  return _[a1 earlyInitNecessaryPrefs];
}

id objc_msgSend_encodeBool_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "encodeBool:forKey:");
}

id objc_msgSend_encodeDouble_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "encodeDouble:forKey:");
}

id objc_msgSend_encodeInt64_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "encodeInt64:forKey:");
}

id objc_msgSend_encodeInt_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "encodeInt:forKey:");
}

id objc_msgSend_encodeObject_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "encodeObject:forKey:");
}

id objc_msgSend_endAnimation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "endAnimation:");
}

id objc_msgSend_endTime(void *a1, const char *a2, ...)
{
  return _[a1 endTime];
}

id objc_msgSend_endpointForMachName_service_instance_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "endpointForMachName:service:instance:");
}

id objc_msgSend_enumerateKeysAndObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumerateKeysAndObjectsUsingBlock:");
}

id objc_msgSend_enumerateObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumerateObjectsUsingBlock:");
}

id objc_msgSend_exitReasonCode(void *a1, const char *a2, ...)
{
  return _[a1 exitReasonCode];
}

id objc_msgSend_exitReasonCodeTextLayer(void *a1, const char *a2, ...)
{
  return _[a1 exitReasonCodeTextLayer];
}

id objc_msgSend_exitReasonNamespace(void *a1, const char *a2, ...)
{
  return _[a1 exitReasonNamespace];
}

id objc_msgSend_exitReasonNamespaceTextLayer(void *a1, const char *a2, ...)
{
  return _[a1 exitReasonNamespaceTextLayer];
}

id objc_msgSend_exitTimestamp(void *a1, const char *a2, ...)
{
  return _[a1 exitTimestamp];
}

id objc_msgSend_extractProcessNameToDisplayFromBundleID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "extractProcessNameToDisplayFromBundleID:");
}

id objc_msgSend_fetchProcessExitInfo(void *a1, const char *a2, ...)
{
  return _[a1 fetchProcessExitInfo];
}

id objc_msgSend_fetchProcessRecords(void *a1, const char *a2, ...)
{
  return _[a1 fetchProcessRecords];
}

id objc_msgSend_filterWithType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "filterWithType:");
}

id objc_msgSend_filters(void *a1, const char *a2, ...)
{
  return _[a1 filters];
}

id objc_msgSend_fire(void *a1, const char *a2, ...)
{
  return _[a1 fire];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return _[a1 firstObject];
}

id objc_msgSend_flush(void *a1, const char *a2, ...)
{
  return _[a1 flush];
}

id objc_msgSend_forceUpdate(void *a1, const char *a2, ...)
{
  return _[a1 forceUpdate];
}

id objc_msgSend_frame(void *a1, const char *a2, ...)
{
  return _[a1 frame];
}

id objc_msgSend_fromValue(void *a1, const char *a2, ...)
{
  return _[a1 fromValue];
}

id objc_msgSend_getDescription_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getDescription:");
}

id objc_msgSend_getHangHUDInfoKey(void *a1, const char *a2, ...)
{
  return _[a1 getHangHUDInfoKey];
}

id objc_msgSend_getKeyForLine_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getKeyForLine:");
}

id objc_msgSend_hangDuration(void *a1, const char *a2, ...)
{
  return _[a1 hangDuration];
}

id objc_msgSend_hangDurationMS(void *a1, const char *a2, ...)
{
  return _[a1 hangDurationMS];
}

id objc_msgSend_hangEndTime(void *a1, const char *a2, ...)
{
  return _[a1 hangEndTime];
}

id objc_msgSend_hangHasPendingAnimation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hangHasPendingAnimation:");
}

id objc_msgSend_hangStartTime(void *a1, const char *a2, ...)
{
  return _[a1 hangStartTime];
}

id objc_msgSend_hangtracerDaemonEnabled(void *a1, const char *a2, ...)
{
  return _[a1 hangtracerDaemonEnabled];
}

id objc_msgSend_hasEntitlement_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasEntitlement:");
}

id objc_msgSend_hasHudRenderContextInvalidated(void *a1, const char *a2, ...)
{
  return _[a1 hasHudRenderContextInvalidated];
}

id objc_msgSend_hudContentWithPendingAnimations(void *a1, const char *a2, ...)
{
  return _[a1 hudContentWithPendingAnimations];
}

id objc_msgSend_hudEnabled(void *a1, const char *a2, ...)
{
  return _[a1 hudEnabled];
}

id objc_msgSend_hudLine(void *a1, const char *a2, ...)
{
  return _[a1 hudLine];
}

id objc_msgSend_hudLines(void *a1, const char *a2, ...)
{
  return _[a1 hudLines];
}

id objc_msgSend_hudRenderContext(void *a1, const char *a2, ...)
{
  return _[a1 hudRenderContext];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return _[a1 identifier];
}

id objc_msgSend_identityForAngelJobLabel_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "identityForAngelJobLabel:");
}

id objc_msgSend_identityOfCurrentProcess(void *a1, const char *a2, ...)
{
  return _[a1 identityOfCurrentProcess];
}

id objc_msgSend_indexOfObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "indexOfObject:");
}

id objc_msgSend_indexOfObjectPassingTest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "indexOfObjectPassingTest:");
}

id objc_msgSend_indexSet(void *a1, const char *a2, ...)
{
  return _[a1 indexSet];
}

id objc_msgSend_indexesOfObjectsPassingTest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "indexesOfObjectsPassingTest:");
}

id objc_msgSend_initStatus(void *a1, const char *a2, ...)
{
  return _[a1 initStatus];
}

id objc_msgSend_initWithBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithBlock:");
}

id objc_msgSend_initWithBundleIdentifier_allowPlaceholder_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithBundleIdentifier:allowPlaceholder:error:");
}

id objc_msgSend_initWithExplanation_target_attributes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithExplanation:target:attributes:");
}

id objc_msgSend_initWithHangStartTime_hangEndTime_receivedTimestamp_hangDurationMS_hudString_shortenedBundle_bundleId_timedOut_( void *a1, const char *a2, ...)
{
  return _objc_msgSend( a1,  "initWithHangStartTime:hangEndTime:receivedTimestamp:hangDurationMS:hudString:shortenedBundle:bundleId:timedOut:");
}

id objc_msgSend_initWithIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithIdentifier:");
}

id objc_msgSend_initWithInfo_pid_spawnTimestamp_exitTimestamp_exitReasonCode_exitReasonNamespace_jetsam_priority_( void *a1, const char *a2, ...)
{
  return _objc_msgSend( a1,  "initWithInfo:pid:spawnTimestamp:exitTimestamp:exitReasonCode:exitReasonNamespace:jetsam_priority:");
}

id objc_msgSend_initWithMonitorID_fetchIntervalMs_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithMonitorID:fetchIntervalMs:");
}

id objc_msgSend_initWithNamespaceLayer_codeLayer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithNamespaceLayer:codeLayer:");
}

id objc_msgSend_initWithPreviousHangTextColor_currentHangTextColor_currentHangSevereTextColor_previousHangSevereTextColor_currentHangCriticalTextColor_previousHangCriticalTextColor_backgroundColor_translucentBackgroundColor_textColorSevereVibrantFilter_textColorCriticalVibrantFilter_currentProcessExitTextColor_processExitReasonNamespaceTextColor_( void *a1, const char *a2, ...)
{
  return _objc_msgSend( a1,  "initWithPreviousHangTextColor:currentHangTextColor:currentHangSevereTextColor:previousHangSevereTextColor:cur rentHangCriticalTextColor:previousHangCriticalTextColor:backgroundColor:translucentBackgroundColor:textColorS evereVibrantFilter:textColorCriticalVibrantFilter:currentProcessExitTextColor:processExitReasonNamespaceTextColor:");
}

id objc_msgSend_initWithProcExitRecord_theme_lineDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithProcExitRecord:theme:lineDelegate:");
}

id objc_msgSend_initWithQueue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithQueue:");
}

id objc_msgSend_initWithQueue_processName_theme_fontSize_lineDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithQueue:processName:theme:fontSize:lineDelegate:");
}

id objc_msgSend_initWithRenderContext_queue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithRenderContext:queue:");
}

id objc_msgSend_initWithRunloopHangTimeoutDurationMSec_thirdPartyDevPreferredLanguages_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithRunloopHangTimeoutDurationMSec:thirdPartyDevPreferredLanguages:");
}

id objc_msgSend_initWithSize_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithSize:");
}

id objc_msgSend_initializeStatus(void *a1, const char *a2, ...)
{
  return _[a1 initializeStatus];
}

id objc_msgSend_insert_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "insert:");
}

id objc_msgSend_intProperty_contextPrefixOut_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "intProperty:contextPrefixOut:");
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return _[a1 intValue];
}

id objc_msgSend_interface(void *a1, const char *a2, ...)
{
  return _[a1 interface];
}

id objc_msgSend_interfaceWithIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "interfaceWithIdentifier:");
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return _[a1 invalidate];
}

id objc_msgSend_isCurrent_withHUDUpdateInterval_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isCurrent:withHUDUpdateInterval:");
}

id objc_msgSend_isEqual_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqual:");
}

id objc_msgSend_isEqualToArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToArray:");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_isHangEndedWithDuration_updateInterval_hangID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isHangEndedWithDuration:updateInterval:hangID:");
}

id objc_msgSend_isHidden(void *a1, const char *a2, ...)
{
  return _[a1 isHidden];
}

id objc_msgSend_isImmersionLevelControllerPresentOnScreen(void *a1, const char *a2, ...)
{
  return _[a1 isImmersionLevelControllerPresentOnScreen];
}

id objc_msgSend_isInternal(void *a1, const char *a2, ...)
{
  return _[a1 isInternal];
}

id objc_msgSend_isNoTaskPending(void *a1, const char *a2, ...)
{
  return _[a1 isNoTaskPending];
}

id objc_msgSend_isTimedOut(void *a1, const char *a2, ...)
{
  return _[a1 isTimedOut];
}

id objc_msgSend_jetsam_priority(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "jetsam_priority");
}

id objc_msgSend_keyLayer(void *a1, const char *a2, ...)
{
  return _[a1 keyLayer];
}

id objc_msgSend_keysSortedByValueUsingComparator_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "keysSortedByValueUsingComparator:");
}

id objc_msgSend_keysSortedByValueWithOptions_usingComparator_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "keysSortedByValueWithOptions:usingComparator:");
}

id objc_msgSend_kickOffFetchTimer(void *a1, const char *a2, ...)
{
  return _[a1 kickOffFetchTimer];
}

id objc_msgSend_kickOffUpdater(void *a1, const char *a2, ...)
{
  return _[a1 kickOffUpdater];
}

id objc_msgSend_lastKnownHangs(void *a1, const char *a2, ...)
{
  return _[a1 lastKnownHangs];
}

id objc_msgSend_lastKnownMaxKeyLayerWidth(void *a1, const char *a2, ...)
{
  return _[a1 lastKnownMaxKeyLayerWidth];
}

id objc_msgSend_layer(void *a1, const char *a2, ...)
{
  return _[a1 layer];
}

id objc_msgSend_layoutHUDLines_ids_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "layoutHUDLines:ids:");
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return _[a1 length];
}

id objc_msgSend_lightModeTheme(void *a1, const char *a2, ...)
{
  return _[a1 lightModeTheme];
}

id objc_msgSend_lineDelegate(void *a1, const char *a2, ...)
{
  return _[a1 lineDelegate];
}

id objc_msgSend_listenerWithConfigurator_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "listenerWithConfigurator:");
}

id objc_msgSend_localizedName(void *a1, const char *a2, ...)
{
  return _[a1 localizedName];
}

id objc_msgSend_localizedNameWithPreferredLocalizations_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localizedNameWithPreferredLocalizations:");
}

id objc_msgSend_machName(void *a1, const char *a2, ...)
{
  return _[a1 machName];
}

id objc_msgSend_mainDisplay(void *a1, const char *a2, ...)
{
  return _[a1 mainDisplay];
}

id objc_msgSend_mainRunLoop(void *a1, const char *a2, ...)
{
  return _[a1 mainRunLoop];
}

id objc_msgSend_minimumValueLayerWidth(void *a1, const char *a2, ...)
{
  return _[a1 minimumValueLayerWidth];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return _[a1 mutableCopy];
}

id objc_msgSend_nilifyCALayers(void *a1, const char *a2, ...)
{
  return _[a1 nilifyCALayers];
}

id objc_msgSend_now(void *a1, const char *a2, ...)
{
  return _[a1 now];
}

id objc_msgSend_numberWithBool_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithBool:");
}

id objc_msgSend_numberWithDouble_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithDouble:");
}

id objc_msgSend_numberWithInt_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithInt:");
}

id objc_msgSend_numberWithUnsignedChar_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithUnsignedChar:");
}

id objc_msgSend_numberWithUnsignedInt_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithUnsignedInt:");
}

id objc_msgSend_numberWithUnsignedShort_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithUnsignedShort:");
}

id objc_msgSend_objectAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectAtIndex:");
}

id objc_msgSend_objectAtIndexedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectAtIndexedSubscript:");
}

id objc_msgSend_objectForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKey:");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_objectProperty_matchingSelector_contextPrefixOut_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectProperty:matchingSelector:contextPrefixOut:");
}

id objc_msgSend_objectsAtIndexes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectsAtIndexes:");
}

id objc_msgSend_performHUDUpdate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performHUDUpdate:");
}

id objc_msgSend_performHUDUpdate_withCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performHUDUpdate:withCompletion:");
}

id objc_msgSend_persistentDomainForName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "persistentDomainForName:");
}

id objc_msgSend_pid(void *a1, const char *a2, ...)
{
  return _[a1 pid];
}

id objc_msgSend_postNotificationName_object_userInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "postNotificationName:object:userInfo:");
}

id objc_msgSend_prefContextPrefixPriorityOrder(void *a1, const char *a2, ...)
{
  return _[a1 prefContextPrefixPriorityOrder];
}

id objc_msgSend_prefInitList(void *a1, const char *a2, ...)
{
  return _[a1 prefInitList];
}

id objc_msgSend_prefNamed_domain_profile_matchingSelector_contextPrefixOut_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "prefNamed:domain:profile:matchingSelector:contextPrefixOut:");
}

id objc_msgSend_preferredFrameSize(void *a1, const char *a2, ...)
{
  return _[a1 preferredFrameSize];
}

id objc_msgSend_preferredKeyLayerWidth(void *a1, const char *a2, ...)
{
  return _[a1 preferredKeyLayerWidth];
}

id objc_msgSend_preferredLanguages(void *a1, const char *a2, ...)
{
  return _[a1 preferredLanguages];
}

id objc_msgSend_preferredValueLayerWidth(void *a1, const char *a2, ...)
{
  return _[a1 preferredValueLayerWidth];
}

id objc_msgSend_prepareHUDContextIfNeeded(void *a1, const char *a2, ...)
{
  return _[a1 prepareHUDContextIfNeeded];
}

id objc_msgSend_previousDurationSinceLastUpdateMs(void *a1, const char *a2, ...)
{
  return _[a1 previousDurationSinceLastUpdateMs];
}

id objc_msgSend_previousHangTextColorForStatus_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "previousHangTextColorForStatus:");
}

id objc_msgSend_processExitReasonNamespaceTextColor(void *a1, const char *a2, ...)
{
  return _[a1 processExitReasonNamespaceTextColor];
}

id objc_msgSend_processInfo(void *a1, const char *a2, ...)
{
  return _[a1 processInfo];
}

id objc_msgSend_processName(void *a1, const char *a2, ...)
{
  return _[a1 processName];
}

id objc_msgSend_protocolForProtocol_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "protocolForProtocol:");
}

id objc_msgSend_rangeOfCharacterFromSet_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rangeOfCharacterFromSet:");
}

id objc_msgSend_receiveHangHUDInfo_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "receiveHangHUDInfo:completion:");
}

id objc_msgSend_receiveHudConfiguration_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "receiveHudConfiguration:completion:");
}

id objc_msgSend_receiveMonitoredStates_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "receiveMonitoredStates:completion:");
}

id objc_msgSend_receiveProcExitRecord_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "receiveProcExitRecord:completion:");
}

id objc_msgSend_receivedTimestamp(void *a1, const char *a2, ...)
{
  return _[a1 receivedTimestamp];
}

id objc_msgSend_recreateContainerLayerIfNecessary(void *a1, const char *a2, ...)
{
  return _[a1 recreateContainerLayerIfNecessary];
}

id objc_msgSend_refreshHTPrefs(void *a1, const char *a2, ...)
{
  return _[a1 refreshHTPrefs];
}

id objc_msgSend_reloadThemeColors(void *a1, const char *a2, ...)
{
  return _[a1 reloadThemeColors];
}

id objc_msgSend_remoteContextWithOptions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "remoteContextWithOptions:");
}

id objc_msgSend_remoteProcess(void *a1, const char *a2, ...)
{
  return _[a1 remoteProcess];
}

id objc_msgSend_remoteTargetWithLaunchingAssertionAttributes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "remoteTargetWithLaunchingAssertionAttributes:");
}

id objc_msgSend_removeAllAnimations(void *a1, const char *a2, ...)
{
  return _[a1 removeAllAnimations];
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return _[a1 removeAllObjects];
}

id objc_msgSend_removeFromSuperlayer(void *a1, const char *a2, ...)
{
  return _[a1 removeFromSuperlayer];
}

id objc_msgSend_removeObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObject:");
}

id objc_msgSend_removeObjectAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObjectAtIndex:");
}

id objc_msgSend_removeObjectForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObjectForKey:");
}

id objc_msgSend_removeObjectsAtIndexes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObjectsAtIndexes:");
}

id objc_msgSend_removeObserver_forKeyPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObserver:forKeyPath:");
}

id objc_msgSend_removeStaleHangData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeStaleHangData:");
}

id objc_msgSend_replaceObjectAtIndex_withObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "replaceObjectAtIndex:withObject:");
}

id objc_msgSend_requestedToRenderTimestamp(void *a1, const char *a2, ...)
{
  return _[a1 requestedToRenderTimestamp];
}

id objc_msgSend_retargeted(void *a1, const char *a2, ...)
{
  return _[a1 retargeted];
}

id objc_msgSend_rootLayer(void *a1, const char *a2, ...)
{
  return _[a1 rootLayer];
}

id objc_msgSend_run(void *a1, const char *a2, ...)
{
  return _[a1 run];
}

id objc_msgSend_runloopHangTimeoutDurationMSec(void *a1, const char *a2, ...)
{
  return _[a1 runloopHangTimeoutDurationMSec];
}

id objc_msgSend_saveClearHUDRequest(void *a1, const char *a2, ...)
{
  return _[a1 saveClearHUDRequest];
}

id objc_msgSend_serverRunningDidChange_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "serverRunningDidChange:");
}

id objc_msgSend_serviceQuality(void *a1, const char *a2, ...)
{
  return _[a1 serviceQuality];
}

id objc_msgSend_set(void *a1, const char *a2, ...)
{
  return _[a1 set];
}

id objc_msgSend_setActivationHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setActivationHandler:");
}

id objc_msgSend_setAffineTransform_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAffineTransform:");
}

id objc_msgSend_setAlignmentMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAlignmentMode:");
}

id objc_msgSend_setAllowsGroupOpacity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAllowsGroupOpacity:");
}

id objc_msgSend_setBackgroundColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBackgroundColor:");
}

id objc_msgSend_setBorderColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBorderColor:");
}

id objc_msgSend_setBorderWidth_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBorderWidth:");
}

id objc_msgSend_setCachesInputImage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCachesInputImage:");
}

id objc_msgSend_setCanceled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCanceled:");
}

id objc_msgSend_setCompletionBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCompletionBlock:");
}

id objc_msgSend_setContainerLayer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContainerLayer:");
}

id objc_msgSend_setContentsScale_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContentsScale:");
}

id objc_msgSend_setCornerRadius_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCornerRadius:");
}

id objc_msgSend_setCountLimit_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCountLimit:");
}

id objc_msgSend_setCountsOfMeetingEndingConditions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCountsOfMeetingEndingConditions:");
}

id objc_msgSend_setCurrentTheme_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCurrentTheme:");
}

id objc_msgSend_setDateFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDateFormat:");
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDelegate:");
}

id objc_msgSend_setDisableActions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDisableActions:");
}

id objc_msgSend_setDisplayScaleDependentPropertiesOnLayers(void *a1, const char *a2, ...)
{
  return _[a1 setDisplayScaleDependentPropertiesOnLayers];
}

id objc_msgSend_setDomain_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDomain:");
}

id objc_msgSend_setDuration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDuration:");
}

id objc_msgSend_setEndTime_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEndTime:");
}

id objc_msgSend_setFillMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFillMode:");
}

id objc_msgSend_setFilters_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFilters:");
}

id objc_msgSend_setFont_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFont:");
}

id objc_msgSend_setFontSize_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFontSize:");
}

id objc_msgSend_setForegroundColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setForegroundColor:");
}

id objc_msgSend_setFrame_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFrame:");
}

id objc_msgSend_setFromValue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFromValue:");
}

id objc_msgSend_setHUD_background_opacity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHUD_background_opacity:");
}

id objc_msgSend_setHangDuration_animated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHangDuration:animated:");
}

id objc_msgSend_setHangHUDUpdaterLatencyInMS_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHangHUDUpdaterLatencyInMS:");
}

id objc_msgSend_setHangHUD_updater_latency_in_ms_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHangHUD_updater_latency_in_ms:");
}

id objc_msgSend_setHidden_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHidden:");
}

id objc_msgSend_setHudLine_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHudLine:");
}

id objc_msgSend_setHudRenderContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHudRenderContext:");
}

id objc_msgSend_setHudUpdateHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHudUpdateHandler:");
}

id objc_msgSend_setIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIdentifier:");
}

id objc_msgSend_setInterface_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInterface:");
}

id objc_msgSend_setInterfaceTarget_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInterfaceTarget:");
}

id objc_msgSend_setInterruptionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInterruptionHandler:");
}

id objc_msgSend_setInvalidationHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInvalidationHandler:");
}

id objc_msgSend_setKeyLayer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setKeyLayer:");
}

id objc_msgSend_setLastKnownHangs_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLastKnownHangs:");
}

id objc_msgSend_setLastKnownMaxKeyLayerWidth_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLastKnownMaxKeyLayerWidth:");
}

id objc_msgSend_setLayer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLayer:");
}

id objc_msgSend_setLevel_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLevel:");
}

id objc_msgSend_setLineDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLineDelegate:");
}

id objc_msgSend_setMemoryLoggingIntervalSec_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMemoryLoggingIntervalSec:");
}

id objc_msgSend_setMinimumValueLayerWidth_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMinimumValueLayerWidth:");
}

id objc_msgSend_setName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setName:");
}

id objc_msgSend_setObject_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObject:forKey:");
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObject:forKeyedSubscript:");
}

id objc_msgSend_setOpacity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setOpacity:");
}

id objc_msgSend_setPreferredFrameRateRange_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPreferredFrameRateRange:");
}

id objc_msgSend_setPreferredKeyLayerWidth_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPreferredKeyLayerWidth:");
}

id objc_msgSend_setPreferredValueLayerWidth_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPreferredValueLayerWidth:");
}

id objc_msgSend_setPreviousDurationSinceLastUpdateMs_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPreviousDurationSinceLastUpdateMs:");
}

id objc_msgSend_setProcessExitHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setProcessExitHandler:");
}

id objc_msgSend_setQualityOfService_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setQualityOfService:");
}

id objc_msgSend_setQueue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setQueue:");
}

id objc_msgSend_setReducesCaptureBitDepth_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setReducesCaptureBitDepth:");
}

id objc_msgSend_setRemovedOnCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRemovedOnCompletion:");
}

id objc_msgSend_setRenderParametersFromMonitoredStates_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRenderParametersFromMonitoredStates:");
}

id objc_msgSend_setRequestedToRenderTimestamp_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRequestedToRenderTimestamp:");
}

id objc_msgSend_setRetargeted_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRetargeted:");
}

id objc_msgSend_setScale_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setScale:");
}

id objc_msgSend_setSecure_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSecure:");
}

id objc_msgSend_setServer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setServer:");
}

id objc_msgSend_setService_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setService:");
}

id objc_msgSend_setServiceQuality_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setServiceQuality:");
}

id objc_msgSend_setShadowOffset_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShadowOffset:");
}

id objc_msgSend_setShadowOpacity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShadowOpacity:");
}

id objc_msgSend_setShadowPathIsBounds_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShadowPathIsBounds:");
}

id objc_msgSend_setShadowRadius_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShadowRadius:");
}

id objc_msgSend_setShouldPostHTPrefsChangedNotification_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShouldPostHTPrefsChangedNotification:");
}

id objc_msgSend_setSidePadding_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSidePadding:");
}

id objc_msgSend_setSpacing_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSpacing:");
}

id objc_msgSend_setStartTime_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setStartTime:");
}

id objc_msgSend_setString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setString:");
}

id objc_msgSend_setSublayerTransform_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSublayerTransform:");
}

id objc_msgSend_setToValue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setToValue:");
}

id objc_msgSend_setTransaction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTransaction:");
}

id objc_msgSend_setTransform_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTransform:");
}

id objc_msgSend_setTruncationMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTruncationMode:");
}

id objc_msgSend_setUpdateBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUpdateBlock:");
}

id objc_msgSend_setUpdatesComplete_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUpdatesComplete:");
}

id objc_msgSend_setUserInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUserInfo:");
}

id objc_msgSend_setValue_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setValue:forKey:");
}

id objc_msgSend_setValueLayer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setValueLayer:");
}

id objc_msgSend_setVibrancyFilter_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setVibrancyFilter:");
}

id objc_msgSend_setWithObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWithObject:");
}

id objc_msgSend_setupPrefsWithQueue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setupPrefsWithQueue:");
}

id objc_msgSend_setupPrefsWithQueue_profilePath_taskingDomainName_hangtracerDomain_setupInternalPrefs_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setupPrefsWithQueue:profilePath:taskingDomainName:hangtracerDomain:setupInternalPrefs:");
}

id objc_msgSend_sharedAnimator(void *a1, const char *a2, ...)
{
  return _[a1 sharedAnimator];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return _[a1 sharedInstance];
}

id objc_msgSend_sharedPrefs(void *a1, const char *a2, ...)
{
  return _[a1 sharedPrefs];
}

id objc_msgSend_shortenedBundle(void *a1, const char *a2, ...)
{
  return _[a1 shortenedBundle];
}

id objc_msgSend_shouldPostHTPrefsChangedNotification(void *a1, const char *a2, ...)
{
  return _[a1 shouldPostHTPrefsChangedNotification];
}

id objc_msgSend_spawnTimestamp(void *a1, const char *a2, ...)
{
  return _[a1 spawnTimestamp];
}

id objc_msgSend_standardUserDefaults(void *a1, const char *a2, ...)
{
  return _[a1 standardUserDefaults];
}

id objc_msgSend_start(void *a1, const char *a2, ...)
{
  return _[a1 start];
}

id objc_msgSend_startTime(void *a1, const char *a2, ...)
{
  return _[a1 startTime];
}

id objc_msgSend_statusForHangWithDuration_timedOut_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "statusForHangWithDuration:timedOut:");
}

id objc_msgSend_stopFetchTimer(void *a1, const char *a2, ...)
{
  return _[a1 stopFetchTimer];
}

id objc_msgSend_stopUpdater(void *a1, const char *a2, ...)
{
  return _[a1 stopUpdater];
}

id objc_msgSend_string(void *a1, const char *a2, ...)
{
  return _[a1 string];
}

id objc_msgSend_stringFromDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringFromDate:");
}

id objc_msgSend_stringProperty_contextPrefixOut_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringProperty:contextPrefixOut:");
}

id objc_msgSend_stringWithCString_encoding_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithCString:encoding:");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_subarrayWithRange_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "subarrayWithRange:");
}

id objc_msgSend_sublayers(void *a1, const char *a2, ...)
{
  return _[a1 sublayers];
}

id objc_msgSend_substringToIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "substringToIndex:");
}

id objc_msgSend_systemAppearanceWithReply_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "systemAppearanceWithReply:");
}

id objc_msgSend_target(void *a1, const char *a2, ...)
{
  return _[a1 target];
}

id objc_msgSend_targetWithProcessIdentity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "targetWithProcessIdentity:");
}

id objc_msgSend_textColorVibrantFilterForStatus_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "textColorVibrantFilterForStatus:");
}

id objc_msgSend_thirdPartyDevPreferredLanguages(void *a1, const char *a2, ...)
{
  return _[a1 thirdPartyDevPreferredLanguages];
}

id objc_msgSend_timeIntervalSinceReferenceDate(void *a1, const char *a2, ...)
{
  return _[a1 timeIntervalSinceReferenceDate];
}

id objc_msgSend_timedOut(void *a1, const char *a2, ...)
{
  return _[a1 timedOut];
}

id objc_msgSend_timer(void *a1, const char *a2, ...)
{
  return _[a1 timer];
}

id objc_msgSend_timerWithTimeInterval_repeats_block_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "timerWithTimeInterval:repeats:block:");
}

id objc_msgSend_toValue(void *a1, const char *a2, ...)
{
  return _[a1 toValue];
}

id objc_msgSend_transaction(void *a1, const char *a2, ...)
{
  return _[a1 transaction];
}

id objc_msgSend_translucentBackgroundColor(void *a1, const char *a2, ...)
{
  return _[a1 translucentBackgroundColor];
}

id objc_msgSend_turnOffProcessTerminationMonitoring(void *a1, const char *a2, ...)
{
  return _[a1 turnOffProcessTerminationMonitoring];
}

id objc_msgSend_turnOnProcessTerminationMonitoring(void *a1, const char *a2, ...)
{
  return _[a1 turnOnProcessTerminationMonitoring];
}

id objc_msgSend_unsignedIntProperty_contextPrefixOut_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unsignedIntProperty:contextPrefixOut:");
}

id objc_msgSend_unsignedIntValue(void *a1, const char *a2, ...)
{
  return _[a1 unsignedIntValue];
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return _[a1 unsignedIntegerValue];
}

id objc_msgSend_unsignedLongLongValue(void *a1, const char *a2, ...)
{
  return _[a1 unsignedLongLongValue];
}

id objc_msgSend_unsignedLongProperty_contextPrefixOut_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unsignedLongProperty:contextPrefixOut:");
}

id objc_msgSend_unsignedLongValue(void *a1, const char *a2, ...)
{
  return _[a1 unsignedLongValue];
}

id objc_msgSend_update_options_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "update:options:");
}

id objc_msgSend_updateAnimation_toValue_duration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateAnimation:toValue:duration:");
}

id objc_msgSend_updateBlock(void *a1, const char *a2, ...)
{
  return _[a1 updateBlock];
}

id objc_msgSend_updateCornerRadiusAndSidePaddingIfNecessary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateCornerRadiusAndSidePaddingIfNecessary:");
}

id objc_msgSend_updateCurrentTheme(void *a1, const char *a2, ...)
{
  return _[a1 updateCurrentTheme];
}

id objc_msgSend_updateDisplayLink(void *a1, const char *a2, ...)
{
  return _[a1 updateDisplayLink];
}

id objc_msgSend_updateHUD_withCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateHUD:withCompletion:");
}

id objc_msgSend_updateHUDLineWithId_content_options_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateHUDLineWithId:content:options:");
}

id objc_msgSend_updateHangs_withCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateHangs:withCompletion:");
}

id objc_msgSend_updateWithHUDConfiguration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateWithHUDConfiguration:");
}

id objc_msgSend_updatesComplete(void *a1, const char *a2, ...)
{
  return _[a1 updatesComplete];
}

id objc_msgSend_valid(void *a1, const char *a2, ...)
{
  return _[a1 valid];
}

id objc_msgSend_valueAtTime_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "valueAtTime:");
}

id objc_msgSend_valueLayer(void *a1, const char *a2, ...)
{
  return _[a1 valueLayer];
}

id objc_msgSend_valueWithCAColorMatrix_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "valueWithCAColorMatrix:");
}
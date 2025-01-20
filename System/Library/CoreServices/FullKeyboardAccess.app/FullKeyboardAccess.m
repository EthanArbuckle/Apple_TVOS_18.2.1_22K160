}

void sub_100002CC0(uint64_t a1)
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  [*(id *)(a1 + 32) setGestureStartTime:v2];

  v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) fingerController]);
  v4 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( *(id *)(a1 + 40),  "_fingerModelsForFingerControllerPoint:numberOfFingers:",  *(void *)(a1 + 64),  *(double *)(a1 + 48),  *(double *)(a1 + 56)));
  objc_msgSend(v3, "showFingerModels:animated:startPointForAnimation:", v4, 0, CGPointZero.x, CGPointZero.y);

  v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) fingerController]);
  [v5 pressFingersDownAnimated:0];

  v10 = _NSConcreteStackBlock;
  uint64_t v11 = 3221225472LL;
  v12 = sub_100002E0C;
  v13 = &unk_100020630;
  id v6 = *(id *)(a1 + 32);
  int8x16_t v7 = vextq_s8(*(int8x16_t *)(a1 + 64), *(int8x16_t *)(a1 + 64), 8uLL);
  __int128 v16 = *(_OWORD *)(a1 + 48);
  int8x16_t v17 = v7;
  uint64_t v8 = *(void *)(a1 + 40);
  id v14 = v6;
  uint64_t v15 = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSTimer scheduledTimerWithTimeInterval:repeats:block:]( &OBJC_CLASS___NSTimer,  "scheduledTimerWithTimeInterval:repeats:block:",  1LL,  &v10,  0.00833333333));
  objc_msgSend(*(id *)(a1 + 32), "setGestureUpdateTimer:", v9, v10, v11, v12, v13);
}

void sub_100002E0C(uint64_t a1)
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) gestureStartTime]);
  [v2 timeIntervalSinceDate:v3];
  double v5 = v4;

  double v6 = *(double *)(a1 + 48);
  double v7 = *(double *)(a1 + 56);
  double v8 = v5 * 50.0;
  switch(*(void *)(a1 + 64))
  {
    case 0LL:
      double v6 = v6 - v8;
      break;
    case 1LL:
      double v6 = v8 + v6;
      break;
    case 2LL:
      double v7 = v7 - v8;
      break;
    case 3LL:
      double v7 = v8 + v7;
      break;
    default:
      break;
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue( +[AXPIFingerUtilities defaultLocationsForNumberOfFingers:aroundPoint:]( &OBJC_CLASS___AXPIFingerUtilities,  "defaultLocationsForNumberOfFingers:aroundPoint:",  *(void *)(a1 + 72),  v6,  v7,  v8));
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  id v10 = v9;
  id v11 = [v10 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v26;
    while (2)
    {
      id v14 = 0LL;
      do
      {
        if (*(void *)v26 != v13) {
          objc_enumerationMutation(v10);
        }
        CGPoint v15 = CGPointFromString((NSString *)*(void *)(*((void *)&v25 + 1) + 8LL * (void)v14));
        __int128 v16 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) view]);
        [v16 bounds];
        BOOL v17 = CGRectContainsPoint(v30, v15);

        if (!v17)
        {
          uint64_t v20 = FKALogCommon(v18);
          v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
          if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_INFO,  "Gesture went out of bounds, so ending early.",  buf,  2u);
          }

          [*(id *)(a1 + 40) _cleanUpExistingIncrementalGesture];
          goto LABEL_18;
        }

        id v14 = (char *)v14 + 1;
      }

      while (v12 != v14);
      id v12 = [v10 countByEnumeratingWithState:&v25 objects:v29 count:16];
      if (v12) {
        continue;
      }
      break;
    }
  }

  v19 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) fingerController]);
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472LL;
  v22[2] = sub_10000308C;
  v22[3] = &unk_100020608;
  id v23 = v10;
  [v19 enumerateFingersUsingBlock:v22];

LABEL_18:
}

void sub_10000308C(uint64_t a1, void *a2, uint64_t a3)
{
  double v4 = *(void **)(a1 + 32);
  id v5 = a2;
  double v7 = (NSString *)objc_claimAutoreleasedReturnValue([v4 objectAtIndexedSubscript:a3]);
  CGPoint v6 = CGPointFromString(v7);
  objc_msgSend(v5, "setLocation:", v6.x, v6.y);
}

void sub_100003634(uint64_t a1)
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  [*(id *)(a1 + 32) setGestureStartTime:v2];

  v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) view]);
  [v3 bounds];
  double v8 = (void *)objc_claimAutoreleasedReturnValue( +[AXPIFingerUtilities defaultPinchLocationsAroundPoint:withinBounds:]( &OBJC_CLASS___AXPIFingerUtilities,  "defaultPinchLocationsAroundPoint:withinBounds:",  *(double *)(a1 + 48),  *(double *)(a1 + 56),  v4,  v5,  v6,  v7));

  v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) fingerController]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue( +[AXPIFingerUtilities fingerModelsForPointStrings:]( &OBJC_CLASS___AXPIFingerUtilities,  "fingerModelsForPointStrings:",  v8));
  objc_msgSend(v9, "showFingerModels:animated:startPointForAnimation:", v10, 0, CGPointZero.x, CGPointZero.y);

  id v11 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) fingerController]);
  [v11 pressFingersDownAnimated:0];

  id v12 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) fingerController]);
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v12 fingerModels]);
  id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 objectAtIndexedSubscript:0]);
  [v14 location];
  uint64_t v16 = v15;
  uint64_t v18 = v17;

  v19 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) fingerController]);
  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v19 fingerModels]);
  v21 = (void *)objc_claimAutoreleasedReturnValue([v20 objectAtIndexedSubscript:1]);
  [v21 location];
  uint64_t v23 = v22;
  uint64_t v25 = v24;

  v29 = _NSConcreteStackBlock;
  uint64_t v30 = 3221225472LL;
  v31 = sub_100003878;
  v32 = &unk_100020658;
  id v26 = *(id *)(a1 + 32);
  __int128 v35 = *(_OWORD *)(a1 + 64);
  uint64_t v36 = v16;
  uint64_t v37 = v18;
  uint64_t v38 = v23;
  uint64_t v39 = v25;
  uint64_t v27 = *(void *)(a1 + 40);
  id v33 = v26;
  uint64_t v34 = v27;
  __int128 v28 = (void *)objc_claimAutoreleasedReturnValue( +[NSTimer scheduledTimerWithTimeInterval:repeats:block:]( &OBJC_CLASS___NSTimer,  "scheduledTimerWithTimeInterval:repeats:block:",  1LL,  &v29,  0.00833333333));
  objc_msgSend(*(id *)(a1 + 32), "setGestureUpdateTimer:", v28, v29, v30, v31, v32);
}

void sub_100003878(uint64_t a1)
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) gestureStartTime]);
  [v2 timeIntervalSinceDate:v3];
  double v5 = v4;

  double v6 = v5 * *(double *)(a1 + 48);
  double v7 = v5 * *(double *)(a1 + 56) * 0.392699082;
  __int128 v8 = *(_OWORD *)(a1 + 64);
  __int128 v19 = *(_OWORD *)(a1 + 80);
  __int128 v20 = v8;
  +[AXPIFingerUtilities updateFirstLocation:secondLocation:forPinchWithRadiusDelta:angleDelta:]( &OBJC_CLASS___AXPIFingerUtilities,  "updateFirstLocation:secondLocation:forPinchWithRadiusDelta:angleDelta:",  &v20,  &v19,  v6,  v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) fingerController]);
  [v9 beginUpdates];

  __int128 v10 = v20;
  id v11 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) fingerController]);
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 fingerModels]);
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v12 objectAtIndexedSubscript:0]);
  [v13 setLocation:v10];

  __int128 v14 = v19;
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) fingerController]);
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v15 fingerModels]);
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v16 objectAtIndexedSubscript:1]);
  [v17 setLocation:v14];

  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) fingerController]);
  [v18 endUpdates];
}

void sub_100003C40(uint64_t a1, void *a2)
{
  id v3 = a2;
  double v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  double v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) gestureStartTime]);
  [v4 timeIntervalSinceDate:v5];
  double v7 = v6;

  if (v7 <= AXForceTouchDuration)
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) fingerController]);
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_100003D70;
    v13[3] = &unk_100020678;
    uint64_t v12 = *(void *)(a1 + 48);
    *(double *)&v13[4] = v7;
    v13[5] = v12;
    [v11 enumerateFingersUsingBlock:v13];
  }

  else
  {
    uint64_t v9 = FKALogCommon(v8);
    __int128 v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_INFO,  "Finished increasing force. Leaving fingers pressed, but performing no other updates.",  buf,  2u);
    }

    [v3 invalidate];
  }
}

id sub_100003D70(uint64_t a1, void *a2)
{
  return [a2 setForce:*(double *)(a1 + 32) * *(double *)(a1 + 40) / AXForceTouchDuration];
}

LABEL_29:
}

void sub_1000043CC( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
}

id sub_1000043F4(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  id v5 = [WeakRetained _handleEventRepresentation:v3];

  return v5;
}

void sub_10000457C(uint64_t a1)
{
  id v8 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) _keyboardEventForEventRepresentation:*(void *)(a1 + 40)]);
  if (v8)
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) delegate]);
    [v2 eventTap:*(void *)(a1 + 32) handleKeyboardEvent:v8];

    if (([v8 isDownEvent] & 1) == 0)
    {
      id v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) keyCodesRequiringRepostForUpEvent]);
      double v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v8 keyCode]));
      unsigned int v5 = [v3 containsObject:v4];

      if (v5)
      {
        double v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) keyCodesRequiringRepostForUpEvent]);
        double v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v8 keyCode]));
        [v6 removeObject:v7];

        [*(id *)(a1 + 32) _repostEventRepresentation:*(void *)(a1 + 40)];
      }
    }
  }
}

uint64_t start(int a1, char **a2)
{
  double v4 = objc_autoreleasePoolPush();
  unsigned int v5 = (objc_class *)objc_opt_class(&OBJC_CLASS___FKAApplication);
  double v6 = NSStringFromClass(v5);
  double v7 = (NSString *)objc_claimAutoreleasedReturnValue(v6);
  id v8 = (objc_class *)objc_opt_class(&OBJC_CLASS___FKAApplicationDelegate);
  uint64_t v9 = NSStringFromClass(v8);
  __int128 v10 = (NSString *)objc_claimAutoreleasedReturnValue(v9);
  uint64_t v11 = UIApplicationMain(a1, a2, v7, v10);

  objc_autoreleasePoolPop(v4);
  return v11;
}

void sub_1000082D8(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = (id)objc_claimAutoreleasedReturnValue([v3 delegate]);
  [v5 actionManager:*(void *)(a1 + 32) displaySysdiagnoseStatus:v4];
}

void sub_1000098BC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_1000098D4(id a1)
{
  v1 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  v2 = (void *)qword_100029638;
  qword_100029638 = (uint64_t)v1;
}

id sub_1000098FC(uint64_t a1)
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472LL;
  v2[2] = sub_100009964;
  v2[3] = &unk_100020798;
  int v3 = *(_DWORD *)(a1 + 40);
  v2[4] = *(void *)(a1 + 32);
  return +[UIScreen _enumerateScreensWithBlock:](&OBJC_CLASS___UIScreen, "_enumerateScreensWithBlock:", v2);
}

void sub_100009964(uint64_t a1, void *a2, _BYTE *a3)
{
  id v13 = a2;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v13 displayIdentity]);
  unsigned int v6 = [v5 displayID];
  int v7 = *(_DWORD *)(a1 + 40);

  if (v6 == v7)
  {
    [v13 _referenceBounds];
    id v8 = *(void **)(*(void *)(a1 + 32) + 8LL);
    v8[4] = v9;
    v8[5] = v10;
    v8[6] = v11;
    v8[7] = v12;
    *a3 = 1;
  }
}

id sub_100009E00(uint64_t a1)
{
  return [*(id *)(a1 + 40) updateRequiresNativeFocus];
}

void sub_100009E2C(uint64_t a1)
{
  id v1 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) view]);
  [v1 setAlpha:1.0];
}

uint64_t sub_100009E60(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

id sub_100009F88(uint64_t a1)
{
  v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) view]);
  [v2 removeFromSuperview];

  [*(id *)(a1 + 32) removeFromParentViewController];
  return [*(id *)(a1 + 40) updateRequiresNativeFocus];
}

void sub_100009FD4(uint64_t a1)
{
  id v1 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) view]);
  [v1 setAlpha:0.0];
}

uint64_t sub_10000A008(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

id sub_10000A218(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  return [*(id *)(a1 + 32) updateRequiresNativeFocus];
}

id sub_10000A310(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  return [*(id *)(a1 + 32) updateRequiresNativeFocus];
}

id sub_10000A3EC(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  return [*(id *)(a1 + 32) updateRequiresNativeFocus];
}

BOOL sub_10000A560(id a1, UIViewController *a2, unint64_t a3, BOOL *a4)
{
  return -[UIViewController requiresNativeFocus](a2, "requiresNativeFocus", a3, a4);
}

void sub_10000A7F8(uint64_t a1)
{
  id v1 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) delegate]);
  [v1 didReleaseNativeFocus];
}

void sub_10000A8A0(uint64_t a1)
{
  id v3 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) view]);
  id v1 = (void *)objc_claimAutoreleasedReturnValue([v3 window]);
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([v1 windowScene]);
  [v2 _accessibilitySetFocusEnabledInApplication:1];
}

void sub_10000A94C(uint64_t a1)
{
  id v3 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) view]);
  id v1 = (void *)objc_claimAutoreleasedReturnValue([v3 window]);
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([v1 windowScene]);
  [v2 _accessibilitySceneDidBecomeFocused];
}

void sub_10000AD74( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
}

void sub_10000AD90(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setCachedTypeaheadString:0];
}

void sub_10000BF10( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

void sub_10000C01C(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  _AXShouldDispatchNonMainThreadCallbacksOnMainThreadPushReason();
  __int128 v40 = 0u;
  __int128 v41 = 0u;
  __int128 v38 = 0u;
  __int128 v39 = 0u;
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[AXElement systemWideElement](&OBJC_CLASS___AXElement, "systemWideElement"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 systemApplication]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 currentApplications]);

  id obj = v5;
  id v27 = [v5 countByEnumeratingWithState:&v38 objects:v44 count:16];
  if (v27)
  {
    uint64_t v26 = *(void *)v39;
    do
    {
      unsigned int v6 = 0LL;
      do
      {
        if (*(void *)v39 != v26) {
          objc_enumerationMutation(obj);
        }
        int v7 = (void *)objc_claimAutoreleasedReturnValue( [*(id *)(*((void *)&v38 + 1) + 8 * (void)v6) focusContainersForCurrentSceneIdentifier:0]);
        __int128 v34 = 0u;
        __int128 v35 = 0u;
        __int128 v36 = 0u;
        __int128 v37 = 0u;
        id v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) view]);
        uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 window]);
        uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 screen]);
        uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 displayIdentity]);
        uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( NSNumber,  "numberWithUnsignedInt:",  [v11 displayID]));
        id v13 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:v12]);

        id v14 = [v13 countByEnumeratingWithState:&v34 objects:v43 count:16];
        if (v14)
        {
          id v15 = v14;
          uint64_t v16 = *(void *)v35;
          do
          {
            uint64_t v17 = 0LL;
            do
            {
              if (*(void *)v35 != v16) {
                objc_enumerationMutation(v13);
              }
              uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue( [*(id *)(*((void *)&v34 + 1) + 8 * (void)v17) elementsForAttribute:95246 parameter:*(void *)(a1 + 40)]);
              [v2 addObjectsFromArray:v18];

              uint64_t v17 = (char *)v17 + 1;
            }

            while (v15 != v17);
            id v15 = [v13 countByEnumeratingWithState:&v34 objects:v43 count:16];
          }

          while (v15);
        }

        unsigned int v6 = (char *)v6 + 1;
      }

      while (v6 != v27);
      id v27 = [obj countByEnumeratingWithState:&v38 objects:v44 count:16];
    }

    while (v27);
  }

  _AXShouldDispatchNonMainThreadCallbacksOnMainThreadPopReason();
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  id v19 = v2;
  id v20 = [v19 countByEnumeratingWithState:&v30 objects:v42 count:16];
  if (v20)
  {
    id v21 = v20;
    uint64_t v22 = *(void *)v31;
    do
    {
      uint64_t v23 = 0LL;
      do
      {
        if (*(void *)v31 != v22) {
          objc_enumerationMutation(v19);
        }
        [*(id *)(*((void *)&v30 + 1) + 8 * (void)v23) setTypeaheadQueryString:*(void *)(a1 + 40)];
        uint64_t v23 = (char *)v23 + 1;
      }

      while (v21 != v23);
      id v21 = [v19 countByEnumeratingWithState:&v30 objects:v42 count:16];
    }

    while (v21);
  }

  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472LL;
  v28[2] = sub_10000C384;
  v28[3] = &unk_100020708;
  v28[4] = *(void *)(a1 + 32);
  id v29 = v19;
  id v24 = v19;
  AXPerformBlockOnMainThread(v28);
}

void sub_10000C384(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) typeaheadNamesViewController]);
  [v2 setItems:v1];
}

void sub_10000C3C0(uint64_t a1)
{
  id v1 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) typeaheadNamesViewController]);
  [v1 setItems:&__NSArray0__struct];
}

void sub_10000D6BC( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, id location)
{
}

void sub_10000D700(uint64_t a1, void *a2)
{
  id v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 commandMap]);

  [WeakRetained _didUpdateAvailableCommandsWithUpdatedMap:v4];
}

void sub_10000D760(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _didUpdateFocusRingTimeout];
}

void sub_10000D78C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _didUpdateFocusRingTimeout];
}

id sub_10000D7B8(uint64_t a1, void *a2)
{
  return [a2 _didUpdateHardwareKeyboardAttachedStatus];
}

LABEL_16:
      uint64_t v10 = v16;
    }
  }

      -[FKAApplicationDelegate _handleUpdatedElementsForScreenChange:]( self,  "_handleUpdatedElementsForScreenChange:",  0LL);
      goto LABEL_22;
    }

    if (a4 == 1053)
    {
      -[FKAApplicationDelegate _handleNativeFocusItemChange:](self, "_handleNativeFocusItemChange:", a5);
      goto LABEL_22;
    }

    if (a4 == 1067) {
      goto LABEL_15;
    }
LABEL_19:
    id v14 = FKALogCommon(v8);
    id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT)) {
      sub_1000119EC((uint64_t)a5, a4, v15);
    }

    goto LABEL_22;
  }

  if (a4 == 1000)
  {
    +[NSObject cancelPreviousPerformRequestsWithTarget:selector:object:]( &OBJC_CLASS___NSObject,  "cancelPreviousPerformRequestsWithTarget:selector:object:",  self,  "_handleScreenChange",  0LL);
    -[FKAApplicationDelegate performSelector:withObject:afterDelay:]( self,  "performSelector:withObject:afterDelay:",  "_handleScreenChange",  0LL,  0.3);
    goto LABEL_22;
  }

  if (a4 == 1001) {
    goto LABEL_16;
  }
  if (a4 != 1004) {
    goto LABEL_19;
  }
  uint64_t v12 = FKALogCommon( -[FKAApplicationDelegate _handleUpdatedElementsForScreenChange:]( self,  "_handleUpdatedElementsForScreenChange:",  1LL));
  id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v16 = 0;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Disabling focus ring on screen lock.", v16, 2u);
  }

  -[FKAApplicationDelegate _disableFocusRing](self, "_disableFocusRing");
LABEL_22:
}

LABEL_17:
}

  return v14;
}

void sub_10000E7A4( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
}

void sub_10000E7C0(uint64_t a1)
{
  id v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _updateTypeaheadNamesViewControllerItemsForQueryString:*(void *)(a1 + 32)];

  id v5 = objc_loadWeakRetained(v2);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v5 actionManager]);
  [v4 moveFocusWithHeading:256 queryString:*(void *)(a1 + 32)];
}

void sub_10000E938(id a1, FKASceneDelegate *a2)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(-[FKASceneDelegate nonInteractiveWindow](a2, "nonInteractiveWindow"));
  id v5 = (id)objc_claimAutoreleasedReturnValue([v2 rootViewController]);

  id v3 = (void *)objc_claimAutoreleasedReturnValue([v5 typeaheadNamesViewController]);
  if (!v3)
  {
    id v4 = objc_opt_new(&OBJC_CLASS___FKATypeaheadNamesViewController);
    [v5 setTypeaheadNamesViewController:v4];
    [v5 showChildViewController:v4 animated:0];
  }
}

void sub_10000E9D0(id a1, FKASceneDelegate *a2)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(-[FKASceneDelegate nonInteractiveWindow](a2, "nonInteractiveWindow"));
  id v5 = (id)objc_claimAutoreleasedReturnValue([v2 rootViewController]);

  id v3 = (void *)objc_claimAutoreleasedReturnValue([v5 typeaheadNamesViewController]);
  if (v3)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue([v5 typeaheadNamesViewController]);
    [v5 dismissChildViewController:v4 animated:0];

    [v5 setTypeaheadNamesViewController:0];
  }
}

void sub_10000EB24(uint64_t a1, void *a2)
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue([a2 nonInteractiveWindow]);
  id v4 = (id)objc_claimAutoreleasedReturnValue([v3 rootViewController]);

  [v4 updateTypeaheadNamesForQueryString:*(void *)(a1 + 32)];
}

LABEL_18:
        goto LABEL_19;
      }
    }
  }

  else if (v8)
  {
    goto LABEL_9;
  }

  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v5 unicodeCharacter]);
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v5 unicodeCharacter]);
  id v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [v5 modifierMask]));
  AXUIAutomationHandleKeyComplete(v12, v13, v14);

  id v15 = 0;
LABEL_24:

  return v15;
}

id sub_10000F514(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___UIWindowScene);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) == 0) {
    goto LABEL_6;
  }
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 delegate]);
  uint64_t v6 = objc_opt_class(&OBJC_CLASS___FKASceneDelegate);
  if ((objc_opt_isKindOfClass(v5, v6) & 1) == 0)
  {

    goto LABEL_6;
  }

  unsigned __int8 v7 = [*(id *)(a1 + 32) _sceneVendedByOneness:v3];

  if ((v7 & 1) != 0)
  {
LABEL_6:
    id v8 = 0LL;
    goto LABEL_7;
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue([v3 delegate]);
LABEL_7:

  return v8;
}

uint64_t sub_10000F654(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

LABEL_15:
      id v14 = 0;
      goto LABEL_17;
    }
  }

  if (v3)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(+[AXSystemAppServer server](&OBJC_CLASS___AXSystemAppServer, "server"));
    uint64_t v6 = [v5 isSystemSleeping];

    id v8 = FKALogCommon(v7);
    uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    uint64_t v10 = os_log_type_enabled(v9, OS_LOG_TYPE_INFO);
    if ((v6 & 1) != 0)
    {
      if (v10)
      {
        id v20 = 0;
        uint64_t v11 = "Cannot enable focus ring: system sleeping.";
        uint64_t v12 = (uint8_t *)&v20;
LABEL_14:
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, v11, v12, 2u);
        goto LABEL_15;
      }

      goto LABEL_15;
    }

    if (!v10)
    {
      id v14 = 1;
      goto LABEL_17;
    }

    *(_WORD *)buf = 0;
    id v15 = "Can enable focus ring.";
    id v14 = 1;
    uint64_t v16 = buf;
    goto LABEL_11;
  }

  id v13 = FKALogCommon(IsHardwareKeyboardAttached);
  uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
  id v14 = 1;
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    id v19 = 0;
    id v15 = "Can enable focus ring. Ignored system sleeping state.";
    uint64_t v16 = (uint8_t *)&v19;
LABEL_11:
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, v15, v16, 2u);
  }

uint64_t sub_1000116C4()
{
  return swift_deallocClassInstance(v0, 16LL, 7LL);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return objc_opt_self(&OBJC_CLASS____TtC18FullKeyboardAccessP33_EB1B1AE705C3EB70A843790E91D1906C19ResourceBundleClass);
}

void sub_1000116F4(uint64_t a1, os_log_s *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "Tried to repost unexpected keyboard event: %@",  (uint8_t *)&v2,  0xCu);
}

void sub_100011768(os_log_t log)
{
  *(_WORD *)id v1 = 0;
  _os_log_fault_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_FAULT,  "Expected keyboard event in _keyboardEventForEventRepresentation:",  v1,  2u);
}

void sub_1000117A8(uint64_t a1, os_log_s *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "Unexpected type for connected scene: %@",  (uint8_t *)&v2,  0xCu);
}

void sub_10001181C(int a1, os_log_s *a2)
{
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "Unexpected orientation: %i",  (uint8_t *)v2,  8u);
}

void sub_100011890(uint64_t a1, os_log_s *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "Gesture attempted, but no visible point or center point AND frame was empty: %@",  (uint8_t *)&v2,  0xCu);
}

void sub_100011904( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100011938(uint64_t a1, os_log_s *a2)
{
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_fault_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_FAULT,  "Unexpected number of cell views: %lu",  (uint8_t *)&v2,  0xCu);
}

void sub_1000119AC(os_log_t log)
{
  *(_WORD *)id v1 = 0;
  _os_log_fault_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_FAULT,  "Unexpectedly had no identifier for transient commands, but was in gesture mode.",  v1,  2u);
}

void sub_1000119EC(uint64_t a1, int a2, os_log_t log)
{
  v3[0] = 67109378;
  v3[1] = a2;
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_fault_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_FAULT,  "Unhandled notification received: %i. Data: %@",  (uint8_t *)v3,  0x12u);
}

id objc_msgSend__beginPinchOrRotateFromPoint_type_pinchGestureSpeed_angleUpdateMultiplier_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_beginPinchOrRotateFromPoint:type:pinchGestureSpeed:angleUpdateMultiplier:");
}

id objc_msgSend_initWithHIDTapIdentifier_HIDEventTapPriority_systemEventTapIdentifier_systemEventTapPriority_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "initWithHIDTapIdentifier:HIDEventTapPriority:systemEventTapIdentifier:systemEventTapPriority:");
}

id objc_msgSend_yPrecisionLevel(void *a1, const char *a2, ...)
{
  return [a1 yPrecisionLevel];
}
}

void sub_100001F60( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *location, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, int a16, int a17, _Unwind_Exception *exception_object)
{
}

void sub_100001F98(uint64_t a1, void *a2)
{
  location[1] = (id)a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  v32[1] = (id)a1;
  v32[0] = objc_loadWeakRetained((id *)(a1 + 40));
  if (v32[0])
  {
    *(double *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = *(double *)(*(void *)(*(void *)(a1 + 32) + 8LL)
                                                                            + 24LL)
                                                                - 1.0;
    memset(__b, 0, sizeof(__b));
    id obj = [v32[0] timerStatusHandlers];
    id v19 = [obj countByEnumeratingWithState:__b objects:v36 count:16];
    if (v19)
    {
      uint64_t v15 = *(void *)__b[2];
      uint64_t v16 = 0LL;
      id v17 = v19;
      while (1)
      {
        uint64_t v14 = v16;
        if (*(void *)__b[2] != v15) {
          objc_enumerationMutation(obj);
        }
        uint64_t v30 = *(void *)(__b[1] + 8 * v16);
        (*(void (**)(double))(v30 + 16))(*(double *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL));
        ++v16;
        if (v14 + 1 >= (unint64_t)v17)
        {
          uint64_t v16 = 0LL;
          id v17 = [obj countByEnumeratingWithState:__b objects:v36 count:16];
          if (!v17) {
            break;
          }
        }
      }
    }

    if (*(double *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) == 0.0)
    {
      [v32[0] stopTimer];
      id v10 = [v32[0] handlers];
      id v28 = [v10 copy];

      id v11 = [v32[0] handlers];
      [v11 removeAllObjects];

      memset(v26, 0, sizeof(v26));
      id v12 = v28;
      id v13 = [v12 countByEnumeratingWithState:v26 objects:v35 count:16];
      if (v13)
      {
        uint64_t v7 = *(void *)v26[2];
        uint64_t v8 = 0LL;
        id v9 = v13;
        while (1)
        {
          uint64_t v6 = v8;
          if (*(void *)v26[2] != v7) {
            objc_enumerationMutation(v12);
          }
          uint64_t v27 = *(void *)(v26[1] + 8 * v8);
          id v25 = 0LL;
          id v24 = 0LL;
          char v5 = (*(uint64_t (**)(void))(v27 + 16))();
          objc_storeStrong(&v25, v24);
          if ((v5 & 1) == 0)
          {
            os_log_t oslog = (os_log_t)sub_10001A69C();
            os_log_type_t type = OS_LOG_TYPE_ERROR;
            if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
            {
              log = oslog;
              os_log_type_t v3 = type;
              id v4 = [v32[0] title];
              id v21 = v4;
              sub_1000024B4((uint64_t)v34, (uint64_t)v21, (uint64_t)v25);
              _os_log_error_impl( (void *)&_mh_execute_header,  log,  v3,  "Could not execute handler for action %{public}@ error: %{public}@",  v34,  0x16u);

              objc_storeStrong(&v21, 0LL);
            }

            objc_storeStrong((id *)&oslog, 0LL);
          }

          objc_storeStrong(&v25, 0LL);
          ++v8;
          if (v6 + 1 >= (unint64_t)v9)
          {
            uint64_t v8 = 0LL;
            id v9 = [v12 countByEnumeratingWithState:v26 objects:v35 count:16];
            if (!v9) {
              break;
            }
          }
        }
      }

      objc_storeStrong(&v28, 0LL);
    }

    int v31 = 0;
  }

  else
  {
    [location[0] invalidate];
    int v31 = 1;
  }

  objc_storeStrong(v32, 0LL);
  if (!v31) {
    int v31 = 0;
  }
  objc_storeStrong(location, 0LL);
}

uint64_t sub_1000024B4(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(_BYTE *)result = 2;
  *(_BYTE *)(result + 1) = 2;
  *(_BYTE *)(result + 2) = 66;
  *(_BYTE *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 66;
  *(_BYTE *)(result + 13) = 8;
  *(void *)(result + 14) = a3;
  return result;
}

_BYTE *sub_100002910(_BYTE *result)
{
  *result = 0;
  result[1] = 0;
  return result;
}

void sub_10000453C( uint64_t a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id *location)
{
  *(void *)(v14 - 4_Block_object_dispose((const void *)(v18 - 48), 8) = a1;
  *(_DWORD *)(v14 - 52) = a2;
  objc_destroyWeak((id *)(v14 - 40));
  _Unwind_Resume(*(_Unwind_Exception **)(v14 - 48));
}

uint64_t sub_100004598(id *a1, char a2, uint64_t a3)
{
  id v13 = a1;
  char v12 = a2 & 1;
  uint64_t v11 = a3;
  v10[1] = a1;
  v10[0] = objc_loadWeakRetained(a1 + 4);
  if (v10[0])
  {
    char v8 = 1;
    id v3 = [v10[0] actionHandler];
    BOOL v6 = v3 == 0LL;

    if (!v6)
    {
      char v5 = (uint64_t (**)(id, uint64_t, void))[v10[0] actionHandler];
      char v8 = v5[2](v5, 1LL, v11) & 1;
    }

    id location = [v10[0] completionHandler];
    [v10[0] setCompletionHandler:0];
    [v10[0] _invalidateIdleTimerAssertion];
    if (location) {
      (*((void (**)(id, void))location + 2))(location, 0LL);
    }
    char v14 = v8 & 1;
    int v9 = 1;
    objc_storeStrong(&location, 0LL);
  }

  else
  {
    char v14 = 0;
    int v9 = 1;
  }

  objc_storeStrong(v10, 0LL);
  return v14 & 1;
}

LABEL_27:
      objc_storeStrong(&v11, @"settings");
      goto LABEL_29;
    }
  }

  else if (v8 == (char *)538423556)
  {
    objc_storeStrong(&location, @"hdr");
    id v4 = v13->_aggKind;
    if (v4 != 1)
    {
      if (v4 != 2)
      {
        if (v4 != 3) {
          goto LABEL_29;
        }
        goto LABEL_28;
      }

      goto LABEL_27;
    }
  }

  else
  {
    objc_storeStrong(&location, @"sdr");
    id v3 = v13->_aggKind;
    if (v3 != 1)
    {
      if (v3 != 2)
      {
        if (v3 != 3) {
          goto LABEL_29;
        }
LABEL_28:
        objc_storeStrong(&v11, @"crossbandwidth");
        goto LABEL_29;
      }

      goto LABEL_27;
    }
  }

  objc_storeStrong(&v11, @"oob");
LABEL_29:
  -[TVDADataReporter _reportResult:reason:dynamicRange:HDMIVersion:]( v13,  "_reportResult:reason:dynamicRange:HDMIVersion:",  v12[0],  v11,  location,  v9);
  objc_storeStrong((id *)&v9, 0LL);
  objc_storeStrong(&location, 0LL);
  objc_storeStrong(&v11, 0LL);
  objc_storeStrong(v12, 0LL);
}

NSDictionary *sub_100006308(void *a1)
{
  v2[0] = @"result";
  v3[0] = a1[4];
  v2[1] = @"reason";
  v3[1] = a1[5];
  v2[2] = @"hdmi";
  v3[2] = a1[6];
  v2[3] = @"dynamicrange";
  v3[3] = a1[7];
  return +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v3,  v2,  4LL);
}

void sub_1000065B0(id *a1, char a2)
{
  id v4 = a1;
  char v3 = a2 & 1;
  location[1] = a1;
  location[0] = objc_loadWeakRetained(a1 + 4);
  if (location[0] && (v3 & 1) != 0) {
    [location[0] _handleTimeout];
  }
  objc_storeStrong(location, 0LL);
}

uint64_t sub_100006858(uint64_t result, int a2)
{
  *(_BYTE *)result = 0;
  *(_BYTE *)(result + 1) = 1;
  *(_BYTE *)(result + 2) = 0;
  *(_BYTE *)(result + 3) = 4;
  *(_DWORD *)(result + 4) = a2;
  return result;
}

void sub_100006C5C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, int a14, int a15, _Unwind_Exception *exception_object, char a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, id a23)
{
}

void sub_100006C88(uint64_t a1)
{
  v7[2] = (id)a1;
  v7[1] = (id)a1;
  v7[0] = objc_loadWeakRetained((id *)(a1 + 48));
  if (v7[0])
  {
    [*((id *)v7[0] + 3) invalidate];
    v2 = +[PBSEARCConfigurator sharedInstance](&OBJC_CLASS___PBSEARCConfigurator, "sharedInstance");
    -[PBSEARCConfigurator removeEARCObserver:](v2, "removeEARCObserver:", *(void *)(a1 + 32));

    id location = objc_retainBlock(*((id *)v7[0] + 4));
    v1 = (void *)*((void *)v7[0] + 4);
    *((void *)v7[0] + 4) = 0LL;

    *((void *)v7[0] + 2) = *(void *)(a1 + 56);
    if (location)
    {
      os_log_t oslog = (os_log_t)sub_10001A69C();
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
      {
        sub_100006E5C((uint64_t)v8, *(void *)(a1 + 56), *(void *)(a1 + 40));
        _os_log_impl( (void *)&_mh_execute_header,  oslog,  OS_LOG_TYPE_DEFAULT,  "DA calling (e)ARC completion with status: %ld, erorr: %@",  v8,  0x16u);
      }

      objc_storeStrong((id *)&oslog, 0LL);
      (*((void (**)(id, id, void))location + 2))(location, v7[0], *(void *)(a1 + 40));
    }

    objc_storeStrong(&location, 0LL);
    int v6 = 0;
  }

  else
  {
    int v6 = 1;
  }

  objc_storeStrong(v7, 0LL);
}

uint64_t sub_100006E5C(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(_BYTE *)result = 2;
  *(_BYTE *)(result + 1) = 2;
  *(_BYTE *)(result + 2) = 0;
  *(_BYTE *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 64;
  *(_BYTE *)(result + 13) = 8;
  *(void *)(result + 14) = a3;
  return result;
}

uint64_t sub_1000072F8(uint64_t result, uint64_t a2)
{
  *(_BYTE *)result = 0;
  *(_BYTE *)(result + 1) = 1;
  *(_BYTE *)(result + 2) = 0;
  *(_BYTE *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  return result;
}

void sub_100007458(id obj)
{
  id location = 0LL;
  objc_storeStrong(&location, obj);
  id v14 = [location internalDescriptionLabel];
  id v15 = [v14 superview];
  unsigned __int8 v16 = 0;
  if (!v15) {
    unsigned __int8 v16 = +[TVSDevice runningAnInternalBuild](&OBJC_CLASS___TVSDevice, "runningAnInternalBuild");
  }

  if ((v16 & 1) != 0)
  {
    id v17 = [location internalDescriptionLabel];
    [v17 setTranslatesAutoresizingMaskIntoConstraints:0];
    id v1 = v17;
    v2 = +[UIColor yellowColor](&OBJC_CLASS___UIColor, "yellowColor");
    objc_msgSend(v1, "setTextColor:");

    id v3 = v17;
    id v4 =  +[UIFont preferredFontForTextStyle:]( &OBJC_CLASS___UIFont,  "preferredFontForTextStyle:",  UIFontTextStyleCaption2);
    objc_msgSend(v3, "setFont:");

    [v17 setNumberOfLines:5];
    id v5 = [location view];
    [v5 addSubview:v17];

    id v9 = [v17 leadingAnchor];
    id v8 = [location view];
    id v7 = [v8 leadingAnchor];
    id v6 = objc_msgSend(v9, "constraintEqualToAnchor:constant:");
    [v6 setActive:1];

    id v13 = [v17 topAnchor];
    id v12 = [location view];
    id v11 = [v12 topAnchor];
    id v10 = objc_msgSend(v13, "constraintEqualToAnchor:constant:", 20.0);
    [v10 setActive:1];

    objc_storeStrong(&v17, 0LL);
  }

  objc_storeStrong(&location, 0LL);
}

void sub_100007958(id *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  v13[1] = a1;
  v13[0] = objc_loadWeakRetained(a1 + 5);
  if (v13[0])
  {
    if (location[0])
    {
      id v11 = sub_10001A69C();
      char v10 = 16;
      if (os_log_type_enabled((os_log_t)v11, OS_LOG_TYPE_ERROR))
      {
        log = (os_log_s *)v11;
        os_log_type_t type = v10;
        id v7 = [a1[4] title];
        id v9 = v7;
        sub_1000024B4((uint64_t)v15, (uint64_t)v9, (uint64_t)location[0]);
        _os_log_error_impl( (void *)&_mh_execute_header,  log,  type,  "Could not start loading step %{public}@: %{public}@",  v15,  0x16u);

        objc_storeStrong(&v9, 0LL);
      }

      objc_storeStrong(&v11, 0LL);
    }

    id v2 = [v13[0] completionHandler];
    BOOL v4 = v2 == 0LL;

    if (!v4)
    {
      id v3 = (void (**)(id, uint64_t))[v13[0] completionHandler];
      v3[2](v3, 1LL);
    }

    int v12 = 0;
  }

  else
  {
    int v12 = 1;
  }

  objc_storeStrong(v13, 0LL);
  if (!v12) {
    int v12 = 0;
  }
  objc_storeStrong(location, 0LL);
}

uint64_t sub_100009320(uint64_t result, uint64_t a2)
{
  *(_BYTE *)result = 2;
  *(_BYTE *)(result + 1) = 1;
  *(_BYTE *)(result + 2) = 66;
  *(_BYTE *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  return result;
}

void sub_100009F2C( uint64_t a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object, uint64_t a11, id *a12, uint64_t a13, id *a14, uint64_t a15, id *a16, uint64_t a17, id *a18, uint64_t a19, id *a20, uint64_t a21, uint64_t a22, uint64_t a23, id *a24, uint64_t a25, id *a26, uint64_t a27, id *a28, uint64_t a29, id *a30, uint64_t a31, id *a32, uint64_t a33, id *a34, uint64_t a35, uint64_t a36, uint64_t a37, id *a38, uint64_t a39, id *location)
{
  *(void *)(v40 - 12_Block_object_dispose((const void *)(v18 - 48), 8) = a1;
  *(_DWORD *)(v40 - 132) = a2;
  objc_destroyWeak(location);
  objc_destroyWeak((id *)(v40 - 80));
  _Unwind_Resume(*(_Unwind_Exception **)(v40 - 128));
}

__CFString *sub_10000A208(id *a1, void *a2, void *a3, void *a4, void *a5)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  id v19 = 0LL;
  objc_storeStrong(&v19, a3);
  id v18 = 0LL;
  objc_storeStrong(&v18, a4);
  id v17 = 0LL;
  objc_storeStrong(&v17, a5);
  v16[1] = a1;
  v16[0] = objc_loadWeakRetained(a1 + 4);
  if (v16[0])
  {
    id v14 = [v17 objectForKeyedSubscript:@"MeasurerKey"];
    [v16[0] _attemptToRunMeasurement:v14];
    [v16[0] _pushViewControllerForStep:v14];
    id v7 = (__CFString *)[location[0] currentState];
    char v12 = 0;
    if (v7 == @"Initial")
    {
      id v5 = @"IdleState";
    }

    else
    {
      id v13 = [location[0] currentState];
      char v12 = 1;
      id v5 = (__CFString *)v13;
    }

    id v21 = v5;
    if ((v12 & 1) != 0) {

    }
    int v15 = 1;
    objc_storeStrong(&v14, 0LL);
  }

  else
  {
    id v21 = @"IdleState";
    int v15 = 1;
  }

  objc_storeStrong(v16, 0LL);
  objc_storeStrong(&v17, 0LL);
  objc_storeStrong(&v18, 0LL);
  objc_storeStrong(&v19, 0LL);
  objc_storeStrong(location, 0LL);
  return v21;
}

__CFString *sub_10000A400(id *a1, void *a2, void *a3, void *a4, void *a5)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  id v13 = 0LL;
  objc_storeStrong(&v13, a3);
  id v12 = 0LL;
  objc_storeStrong(&v12, a4);
  id v11 = 0LL;
  objc_storeStrong(&v11, a5);
  v10[1] = a1;
  v10[0] = objc_loadWeakRetained(a1 + 4);
  if (v10[0])
  {
    [v10[0] _dismissDisplayAssistant];
    int v15 = @"Initial";
  }

  else
  {
    int v15 = @"IdleState";
  }

  objc_storeStrong(v10, 0LL);
  objc_storeStrong(&v11, 0LL);
  objc_storeStrong(&v12, 0LL);
  objc_storeStrong(&v13, 0LL);
  objc_storeStrong(location, 0LL);
  return v15;
}

__CFString *sub_10000A518(id *a1, void *a2, void *a3, void *a4, void *a5)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  id v18 = 0LL;
  objc_storeStrong(&v18, a3);
  id v17 = 0LL;
  objc_storeStrong(&v17, a4);
  id v16 = 0LL;
  objc_storeStrong(&v16, a5);
  v15[1] = a1;
  v15[0] = objc_loadWeakRetained(a1 + 4);
  if (v15[0])
  {
    id v13 = [v16 objectForKeyedSubscript:@"MeasurerKey"];
    id v12 = 0LL;
    if ([v17 isEqual:@"ForceDismissContext"])
    {
      [v15[0] _dismissDisplayAssistant];
      objc_storeStrong(&v12, @"Initial");
    }

    else
    {
      [v15[0] _enqueueMeasurement:v13];
      id v5 = [location[0] currentState];
      id v6 = v12;
      id v12 = v5;
    }

    v20 = (__CFString *)v12;
    int v14 = 1;
    objc_storeStrong(&v12, 0LL);
    objc_storeStrong(&v13, 0LL);
  }

  else
  {
    v20 = @"IdleState";
    int v14 = 1;
  }

  objc_storeStrong(v15, 0LL);
  objc_storeStrong(&v16, 0LL);
  objc_storeStrong(&v17, 0LL);
  objc_storeStrong(&v18, 0LL);
  objc_storeStrong(location, 0LL);
  return v20;
}

__CFString *sub_10000A6E0(id *a1, void *a2, void *a3, void *a4, void *a5)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  id v16 = 0LL;
  objc_storeStrong(&v16, a3);
  id v15 = 0LL;
  objc_storeStrong(&v15, a4);
  id v14 = 0LL;
  objc_storeStrong(&v14, a5);
  v13[1] = a1;
  v13[0] = objc_loadWeakRetained(a1 + 4);
  if (v13[0])
  {
    id v6 = [v13[0] currentTrack];
    id v11 = [v6 nextStepByAdvancing];

    if (v11)
    {
      [v13[0] _attemptToRunMeasurement:v11];
      [v13[0] _pushViewControllerForStep:v11];
    }

    else
    {
      [location[0] postEvent:@"CompleteSeriesOfStepsEvent" withContext:0 userInfo:v14];
    }

    id v18 = (__CFString *)[location[0] currentState];
    int v12 = 1;
    objc_storeStrong(&v11, 0LL);
  }

  else
  {
    id v18 = @"IdleState";
    int v12 = 1;
  }

  objc_storeStrong(v13, 0LL);
  objc_storeStrong(&v14, 0LL);
  objc_storeStrong(&v15, 0LL);
  objc_storeStrong(&v16, 0LL);
  objc_storeStrong(location, 0LL);
  return v18;
}

__CFString *sub_10000A890(id *a1, void *a2, void *a3, void *a4, void *a5)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  id v18 = 0LL;
  objc_storeStrong(&v18, a3);
  id v17 = 0LL;
  objc_storeStrong(&v17, a4);
  id v16 = 0LL;
  objc_storeStrong(&v16, a5);
  v15[1] = a1;
  v15[0] = objc_loadWeakRetained(a1 + 4);
  if (v15[0])
  {
    id v13 = [v16 objectForKeyedSubscript:@"MeasurerKey"];
    id v6 = [v15[0] queuedMeasurements];
    [v6 removeAllObjects];

    id v8 = [v15[0] currentMeasurement];
    id v7 = [v8 measurement];
    [v7 cancel];

    [v15[0] _goBackToPreviousStepForAction:v13];
    v20 = @"IdleState";
    int v14 = 1;
    objc_storeStrong(&v13, 0LL);
  }

  else
  {
    v20 = @"IdleState";
    int v14 = 1;
  }

  objc_storeStrong(v15, 0LL);
  objc_storeStrong(&v16, 0LL);
  objc_storeStrong(&v17, 0LL);
  objc_storeStrong(&v18, 0LL);
  objc_storeStrong(location, 0LL);
  return v20;
}

NSString *__cdecl sub_10000AA50(id a1, TVSStateMachine *a2, NSString *a3, id a4, NSDictionary *a5)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  id v25 = 0LL;
  objc_storeStrong(&v25, a3);
  id v24 = 0LL;
  objc_storeStrong(&v24, a4);
  id v23 = 0LL;
  objc_storeStrong(&v23, a5);
  v22[1] = a1;
  v22[0] = [v23 objectForKeyedSubscript:@"MeasurerKey"];
  id v21 = [v22[0] measurement];
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___TVDAStepAction);
  if ((objc_opt_isKindOfClass(v22[0], v5) & 1) != 0) {
    [v22[0] forceRunHandlers];
  }
  if (v21)
  {
    id v9 = v21;
    int v14 = _NSConcreteStackBlock;
    int v15 = -1073741824;
    int v16 = 0;
    id v17 = sub_10000AC78;
    id v18 = &unk_100028CF0;
    id v19 = location[0];
    id v20 = v23;
    [v9 measureWithCompletion:&v14];
    objc_storeStrong(&v20, 0LL);
    objc_storeStrong(&v19, 0LL);
  }

  else
  {
    [location[0] postEvent:@"DismissAssistantEvent" withContext:0 userInfo:v23];
  }

  id v8 = objc_msgSend(location[0], "currentState", location);
  objc_storeStrong(&v21, 0LL);
  objc_storeStrong(v22, 0LL);
  objc_storeStrong(&v23, 0LL);
  objc_storeStrong(&v24, 0LL);
  objc_storeStrong(&v25, 0LL);
  objc_storeStrong(v7, 0LL);
  return (NSString *)v8;
}

void sub_10000AC78(id *a1, void *a2, void *a3)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  id v6 = 0LL;
  objc_storeStrong(&v6, a3);
  oslog[1] = (os_log_t)a1;
  if (v6)
  {
    oslog[0] = (os_log_t)sub_10001A69C();
    if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEFAULT))
    {
      sub_100009320((uint64_t)v8, (uint64_t)v6);
      _os_log_impl( (void *)&_mh_execute_header,  oslog[0],  OS_LOG_TYPE_DEFAULT,  "No measurements taken: %{public}@",  v8,  0xCu);
    }

    objc_storeStrong((id *)oslog, 0LL);
  }

  objc_msgSend(a1[4], "postEvent:withContext:userInfo:", @"DismissAssistantEvent");
  objc_storeStrong(&v6, 0LL);
  objc_storeStrong(location, 0LL);
}

__CFString *sub_10000ADC4(id *a1, void *a2, void *a3, void *a4, void *a5)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  id v15 = 0LL;
  objc_storeStrong(&v15, a3);
  id v14 = 0LL;
  objc_storeStrong(&v14, a4);
  id v13 = 0LL;
  objc_storeStrong(&v13, a5);
  v12[1] = a1;
  v12[0] = objc_loadWeakRetained(a1 + 4);
  if (v12[0])
  {
    id v10 = [v12[0] _nextStepAfterSerieCompletion];
    if (v10)
    {
      [v12[0] _attemptToRunMeasurement:v10];
      [v12[0] _pushViewControllerForStep:v10];
    }

    else
    {
      [location[0] postEvent:@"DismissAssistantEvent" withContext:0 userInfo:v13];
    }

    id v17 = (__CFString *)[location[0] currentState];
    int v11 = 1;
    objc_storeStrong(&v10, 0LL);
  }

  else
  {
    id v17 = @"IdleState";
    int v11 = 1;
  }

  objc_storeStrong(v12, 0LL);
  objc_storeStrong(&v13, 0LL);
  objc_storeStrong(&v14, 0LL);
  objc_storeStrong(&v15, 0LL);
  objc_storeStrong(location, 0LL);
  return v17;
}

__CFString *sub_10000AF54(id *a1, void *a2, void *a3, void *a4, void *a5)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  id v15 = 0LL;
  objc_storeStrong(&v15, a3);
  id v14 = 0LL;
  objc_storeStrong(&v14, a4);
  id v13 = 0LL;
  objc_storeStrong(&v13, a5);
  v12[1] = a1;
  v12[0] = objc_loadWeakRetained(a1 + 4);
  if (v12[0])
  {
    id v10 = [v13 objectForKeyedSubscript:@"MeasurerKey"];
    if ([v10 flow] == (id)2) {
      [location[0] postEvent:@"DismissAssistantEvent" withContext:@"ForceDismissContext" userInfo:v13];
    }
    else {
      [v12[0] _attemptToRunMeasurement:v10];
    }
    id v17 = (__CFString *)[location[0] currentState];
    int v11 = 1;
    objc_storeStrong(&v10, 0LL);
  }

  else
  {
    id v17 = @"IdleState";
    int v11 = 1;
  }

  objc_storeStrong(v12, 0LL);
  objc_storeStrong(&v13, 0LL);
  objc_storeStrong(&v14, 0LL);
  objc_storeStrong(&v15, 0LL);
  objc_storeStrong(location, 0LL);
  return v17;
}

__CFString *sub_10000B0E8(id *a1, void *a2, void *a3, void *a4, void *a5)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  id v15 = 0LL;
  objc_storeStrong(&v15, a3);
  id v14 = 0LL;
  objc_storeStrong(&v14, a4);
  id v13 = 0LL;
  objc_storeStrong(&v13, a5);
  v12[1] = a1;
  v12[0] = objc_loadWeakRetained(a1 + 4);
  if (v12[0])
  {
    id v10 = [v13 objectForKeyedSubscript:@"MeasurerKey"];
    [v12[0] _measure:v10];
    id v17 = (__CFString *)[location[0] currentState];
    int v11 = 1;
    objc_storeStrong(&v10, 0LL);
  }

  else
  {
    id v17 = @"IdleState";
    int v11 = 1;
  }

  objc_storeStrong(v12, 0LL);
  objc_storeStrong(&v13, 0LL);
  objc_storeStrong(&v14, 0LL);
  objc_storeStrong(&v15, 0LL);
  objc_storeStrong(location, 0LL);
  return v17;
}

__CFString *sub_10000B244(id *a1, void *a2, void *a3, void *a4, void *a5)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  id v15 = 0LL;
  objc_storeStrong(&v15, a3);
  id v14 = 0LL;
  objc_storeStrong(&v14, a4);
  id v13 = 0LL;
  objc_storeStrong(&v13, a5);
  v12[1] = a1;
  v12[0] = objc_loadWeakRetained(a1 + 4);
  if (v12[0])
  {
    id v10 = [v13 objectForKeyedSubscript:@"MeasurerKey"];
    [v12[0] _enqueueMeasurement:v10];
    id v17 = (__CFString *)[location[0] currentState];
    int v11 = 1;
    objc_storeStrong(&v10, 0LL);
  }

  else
  {
    id v17 = @"IdleState";
    int v11 = 1;
  }

  objc_storeStrong(v12, 0LL);
  objc_storeStrong(&v13, 0LL);
  objc_storeStrong(&v14, 0LL);
  objc_storeStrong(&v15, 0LL);
  objc_storeStrong(location, 0LL);
  return v17;
}

__CFString *sub_10000B3A0(id *a1, void *a2, void *a3, void *a4, void *a5)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  id v17 = 0LL;
  objc_storeStrong(&v17, a3);
  id v16 = 0LL;
  objc_storeStrong(&v16, a4);
  id v15 = 0LL;
  objc_storeStrong(&v15, a5);
  v14[1] = a1;
  v14[0] = objc_loadWeakRetained(a1 + 4);
  if (v14[0])
  {
    id v12 = [v15 objectForKeyedSubscript:@"MeasurerKey"];
    [v14[0] setCurrentMeasurement:v12];
    id v11 = @"BackgroundMeasuringState";
    uint64_t v5 = objc_opt_class(&OBJC_CLASS___TVDAStepAction);
    if ((objc_opt_isKindOfClass(v12, v5) & 1) != 0)
    {
      [v14[0] _pushSpinnerViewController];
      objc_storeStrong(&v11, @"ForegroundMeasuringState");
    }

    id v19 = (__CFString *)v11;
    int v13 = 1;
    objc_storeStrong(&v11, 0LL);
    objc_storeStrong(&v12, 0LL);
  }

  else
  {
    id v19 = @"IdleState";
    int v13 = 1;
  }

  objc_storeStrong(v14, 0LL);
  objc_storeStrong(&v15, 0LL);
  objc_storeStrong(&v16, 0LL);
  objc_storeStrong(&v17, 0LL);
  objc_storeStrong(location, 0LL);
  return v19;
}

__CFString *sub_10000B558(id *a1, void *a2, void *a3, void *a4, void *a5)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  id v13 = 0LL;
  objc_storeStrong(&v13, a3);
  id v12 = 0LL;
  objc_storeStrong(&v12, a4);
  id v11 = 0LL;
  objc_storeStrong(&v11, a5);
  v10[1] = a1;
  v10[0] = objc_loadWeakRetained(a1 + 4);
  if (v10[0])
  {
    [v10[0] setCurrentMeasurement:0];
    [v10[0] _executeNextQueuedMeasurerIfAny];
  }

  id v15 = @"IdleState";
  objc_storeStrong(v10, 0LL);
  objc_storeStrong(&v11, 0LL);
  objc_storeStrong(&v12, 0LL);
  objc_storeStrong(&v13, 0LL);
  objc_storeStrong(location, 0LL);
  return v15;
}

__CFString *sub_10000B680(id *a1, void *a2, void *a3, void *a4, void *a5)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  id v35 = 0LL;
  objc_storeStrong(&v35, a3);
  id v34 = 0LL;
  objc_storeStrong(&v34, a4);
  id v33 = 0LL;
  objc_storeStrong(&v33, a5);
  v32[1] = a1;
  v32[0] = objc_loadWeakRetained(a1 + 4);
  if (v32[0])
  {
    id v30 = sub_10001A69C();
    os_log_type_t v29 = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled((os_log_t)v30, OS_LOG_TYPE_ERROR))
    {
      id v17 = [v33 objectForKeyedSubscript:@"ErrorKey"];
      sub_100009320((uint64_t)v38, (uint64_t)v17);
      _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)v30,  v29,  "Mode switching failed, taking the revert path out of Display Assistant. Error: %{public}@",  v38,  0xCu);
    }

    objc_storeStrong(&v30, 0LL);
    uint64_t v5 = (__CFString *)[location[0] currentState];
    BOOL v16 = v5 == @"ModeSwitchErrorState";

    if (!v16)
    {
      id v13 = [v32[0] queuedMeasurements];
      [v13 removeAllObjects];

      id v15 = [v32[0] currentMeasurement];
      id v14 = [v15 measurement];
      [v14 cancel];

      char v26 = 0;
      char v24 = 0;
      char v22 = 0;
      if ([v32[0] assistantKind] == (id)1)
      {
        id v27 = +[TVDAStepsFactory makeHDRBuddyRevertSteps](&OBJC_CLASS___TVDAStepsFactory, "makeHDRBuddyRevertSteps");
        char v26 = 1;
        id v6 = v27;
      }

      else
      {
        id v25 = [v32[0] destinationDisplayMode];
        char v24 = 1;
        id v23 =  +[TVDAStepsFactory makeUpgradeRevertStepsWithDestinationMode:]( &OBJC_CLASS___TVDAStepsFactory,  "makeUpgradeRevertStepsWithDestinationMode:");
        char v22 = 1;
        id v6 = v23;
      }

      id v28 = v6;
      if ((v22 & 1) != 0) {

      }
      if ((v24 & 1) != 0) {
      if ((v26 & 1) != 0)
      }

      id v10 = -[TVDAStepTrack initWithSteps:](objc_alloc(&OBJC_CLASS___TVDAStepTrack), "initWithSteps:", v28);
      id v7 = +[NSMutableArray arrayWithObject:](&OBJC_CLASS___NSMutableArray, "arrayWithObject:");
      id v8 = (void *)*((void *)v32[0] + 5);
      *((void *)v32[0] + 5) = v7;

      id v11 = v32[0];
      id v12 = [v28 firstObject];
      objc_msgSend(v11, "_pushViewControllerForStep:");

      objc_storeStrong(&v28, 0LL);
    }

    v37 = @"ModeSwitchErrorState";
    int v31 = 1;
  }

  else
  {
    v37 = @"IdleState";
    int v31 = 1;
  }

  objc_storeStrong(v32, 0LL);
  objc_storeStrong(&v33, 0LL);
  objc_storeStrong(&v34, 0LL);
  objc_storeStrong(&v35, 0LL);
  objc_storeStrong(location, 0LL);
  return v37;
}

__CFString *sub_10000BB30(id *a1, void *a2, void *a3, void *a4, void *a5)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  id v27 = 0LL;
  objc_storeStrong(&v27, a3);
  id v26 = 0LL;
  objc_storeStrong(&v26, a4);
  id v25 = 0LL;
  objc_storeStrong(&v25, a5);
  v24[1] = a1;
  v24[0] = objc_loadWeakRetained(a1 + 4);
  if (v24[0])
  {
    id v22 = sub_10001A69C();
    os_log_type_t v21 = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled((os_log_t)v22, OS_LOG_TYPE_ERROR))
    {
      id v12 = [v25 objectForKeyedSubscript:@"ErrorKey"];
      sub_100009320((uint64_t)v31, (uint64_t)v12);
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v22, v21, "%{public}@", v31, 0xCu);
    }

    objc_storeStrong(&v22, 0LL);
    id v20 =  +[TVDAStepsFactory makeInconclusiveCableWarningSteps]( &OBJC_CLASS___TVDAStepsFactory,  "makeInconclusiveCableWarningSteps");
    id v10 = -[TVDAStepTrack initWithSteps:](objc_alloc(&OBJC_CLASS___TVDAStepTrack), "initWithSteps:", v20);
    uint64_t v5 = +[NSMutableArray arrayWithObject:](&OBJC_CLASS___NSMutableArray, "arrayWithObject:");
    id v6 = (void *)*((void *)v24[0] + 5);
    *((void *)v24[0] + 5) = v5;

    id v19 = 0LL;
    id v11 = [v24[0] sourceDisplayMode];
    id v18 = v19;
    +[TVDADisplayUpdater updateDisplayWithMode:reason:error:]( &OBJC_CLASS___TVDADisplayUpdater,  "updateDisplayWithMode:reason:error:");
    objc_storeStrong(&v19, v18);

    if (v19)
    {
      id v17 = sub_10001A69C();
      if (os_log_type_enabled((os_log_t)v17, OS_LOG_TYPE_ERROR))
      {
        sub_100009320((uint64_t)v30, (uint64_t)v19);
        _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)v17,  OS_LOG_TYPE_ERROR,  "Could not revert to source mode. Error: %{public}@",  v30,  0xCu);
      }

      objc_storeStrong(&v17, 0LL);
    }

    id v8 = v24[0];
    id v9 = [v20 firstObject];
    objc_msgSend(v8, "_pushViewControllerForStep:");

    os_log_type_t v29 = @"IdleState";
    int v23 = 1;
    objc_storeStrong(&v19, 0LL);
    objc_storeStrong(&v20, 0LL);
  }

  else
  {
    os_log_type_t v29 = @"IdleState";
    int v23 = 1;
  }

  objc_storeStrong(v24, 0LL);
  objc_storeStrong(&v25, 0LL);
  objc_storeStrong(&v26, 0LL);
  objc_storeStrong(&v27, 0LL);
  objc_storeStrong(location, 0LL);
  return v29;
}

BOOL sub_10000C654(uint64_t a1)
{
  return (unint64_t)(a1 - 8) <= 2;
}

void sub_10000CE64( uint64_t a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id *location)
{
  *(void *)(v15 - 192) = a1;
  *(_DWORD *)(v15 - 196) = a2;
  objc_destroyWeak(location);
  objc_destroyWeak((id *)(v15 - 128));
  _Unwind_Resume(*(_Unwind_Exception **)(v15 - 192));
}

void sub_10000CEAC(id *a1, void *a2, void *a3)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  id v26 = 0LL;
  objc_storeStrong(&v26, a3);
  v25[1] = a1;
  v25[0] = objc_loadWeakRetained(a1 + 6);
  if (v25[0])
  {
    id v15 = location[0];
    id v16 = (id)objc_opt_self(&OBJC_CLASS___TVDAWiFiQualityMeasurement);
    char isKindOfClass = objc_opt_isKindOfClass(v15, v16);

    if ((isKindOfClass & 1) != 0)
    {
      if (v26)
      {
        id v23 = sub_10001A69C();
        os_log_type_t v22 = OS_LOG_TYPE_DEFAULT;
        if (os_log_type_enabled((os_log_t)v23, OS_LOG_TYPE_DEFAULT))
        {
          sub_100009320((uint64_t)v30, (uint64_t)v26);
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)v23, v22, "No measurements taken: %{public}@", v30, 0xCu);
        }

        objc_storeStrong(&v23, 0LL);
      }

      id v14 = [v25[0] takenWiFiQualityMeasurements];
      id v12 = location[0];
      id v13 = [location[0] measurementTitle];
      objc_msgSend(v14, "setObject:forKey:", v12);
    }

    else
    {
      id v9 = location[0];
      id v10 = (id)objc_opt_self(&OBJC_CLASS___TVDAToggleEARCMeasurement);
      char v11 = objc_opt_isKindOfClass(v9, v10);

      if ((v11 & 1) != 0)
      {
        [v25[0] setEARCMeasuremntError:v26];
        id v21 = location[0];
        id v8 = (char *)[v21 eARCStatus] + 1;
        if ((unint64_t)v8 <= 4) {
          __asm { BR              X8 }
        }

        [a1[4] setEARCStatus:v20];
        objc_storeStrong(&v21, 0LL);
      }
    }

    id v6 = [v25[0] stateMachine];
    id v28 = @"MeasurerKey";
    id v5 = [a1[5] copy];
    id v29 = v5;
    BOOL v4 =  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v29,  &v28,  1LL);
    objc_msgSend(v6, "postEvent:withContext:userInfo:", @"StopMeasuringEvent", 0);

    id v7 = a1[5];
    uint64_t v3 = objc_opt_class(&OBJC_CLASS___TVDAStepAction);
    if ((objc_opt_isKindOfClass(v7, v3) & 1) != 0) {
      [v25[0] _runAction:a1[5]];
    }
    int v24 = 0;
  }

  else
  {
    int v24 = 1;
  }

  objc_storeStrong(v25, 0LL);
  if (!v24) {
    int v24 = 0;
  }
  objc_storeStrong(&v26, 0LL);
  objc_storeStrong(location, 0LL);
}

LABEL_31:
  BOOL v4 = (id)v49[5];
  objc_storeStrong(&v47, 0LL);
  objc_storeStrong(v46, 0LL);
  _Block_object_dispose(&v48, 8);
  objc_storeStrong(v54, 0LL);
  return v4;
}

void sub_10000E420()
{
}

void sub_10000E454(uint64_t a1, uint64_t a2)
{
  id location = (id *)(a2 + 40);
  id v2 = *(void **)(a2 + 40);
  uint64_t v3 = (id *)(a1 + 40);
  *uint64_t v3 = 0LL;
  objc_storeStrong(v3, v2);
  objc_storeStrong(location, 0LL);
}

void sub_10000E4A8(uint64_t a1)
{
}

void sub_10000E4D4(void *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  id v2 = objc_alloc(&OBJC_CLASS___TVDAStepTrack);
  id v9 = -[TVDAStepTrack initWithSteps:](v2, "initWithSteps:", location[0]);
  uint64_t v3 = +[NSMutableArray arrayWithObject:](&OBJC_CLASS___NSMutableArray, "arrayWithObject:");
  BOOL v4 = (void **)(a1[4] + 40LL);
  id v5 = *v4;
  *BOOL v4 = v3;

  id v6 = [location[0] firstObject];
  uint64_t v7 = *(void *)(a1[5] + 8LL);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;

  objc_storeStrong(location, 0LL);
}

uint64_t sub_10000E5BC(uint64_t result, uint64_t a2)
{
  *(_BYTE *)result = 0;
  *(_BYTE *)(result + 1) = 1;
  *(_BYTE *)(result + 2) = 2;
  *(_BYTE *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  return result;
}

BOOL sub_10000E5F8(unint64_t a1)
{
  return a1 <= 2;
}

void sub_10000E63C(uint64_t a1)
{
  id location[2] = (id)a1;
  location[1] = (id)a1;
  location[0] = sub_10001A69C();
  if (os_log_type_enabled((os_log_t)location[0], OS_LOG_TYPE_DEFAULT))
  {
    sub_1000072F8((uint64_t)v6, (uint64_t)[*(id *)(a1 + 32) assistantKind]);
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)location[0],  OS_LOG_TYPE_DEFAULT,  "Poor cable connection detected in flow (%ld), warning users",  v6,  0xCu);
  }

  objc_storeStrong(location, 0LL);
  uint64_t v1 = *(void *)(a1 + 40);
  id v3 = [*(id *)(a1 + 32) destinationDisplayMode];
  id v2 =  +[TVDAStepsFactory makePoorCableWarningStepsWithDestinationMode:]( &OBJC_CLASS___TVDAStepsFactory,  "makePoorCableWarningStepsWithDestinationMode:");
  (*(void (**)(void))(v1 + 16))();
}

void sub_10000EE90(uint64_t a1)
{
  id v8 = [*(id *)(a1 + 32) sourceDisplayMode];
  uint64_t v7 = +[PBSDisplayManager sharedInstance](&OBJC_CLASS___PBSDisplayManager, "sharedInstance");
  id v6 = -[PBSDisplayManager currentDisplayMode](v7, "currentDisplayMode");
  BOOL v9 = (objc_msgSend(v8, "isEqual:") & 1) != 0;

  if (!v9)
  {
    id v4 = [*(id *)(a1 + 32) sourceDisplayMode];
    +[TVDADisplayUpdater updateDisplayWithMode:reason:error:]( &OBJC_CLASS___TVDADisplayUpdater,  "updateDisplayWithMode:reason:error:");
  }

  uint64_t v1 = *(void **)(*(void *)(a1 + 32) + 32LL);
  id v10 = @"MeasurerKey";
  id v3 = [*(id *)(a1 + 40) copy];
  id v11 = v3;
  id v2 =  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v11,  &v10,  1LL);
  objc_msgSend(v1, "postEvent:withContext:userInfo:", @"DismissAssistantEvent", @"ForceDismissContext");
}

void sub_10000F6C4()
{
}

void sub_10000F6D4(id *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  id WeakRetained = objc_loadWeakRetained(a1 + 4);
  id v5 = [WeakRetained stateMachine];
  id v8 = @"MeasurerKey";
  id v4 = [location[0] copy];
  id v9 = v4;
  id v3 =  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v9,  &v8,  1LL);
  objc_msgSend(v5, "postEvent:withContext:userInfo:", @"ReceivedNextStepActionEvent", 0);

  objc_storeStrong(location, 0LL);
}

void sub_10000F800(id *a1, char a2)
{
  id v11 = a1;
  char v10 = a2 & 1;
  location[1] = a1;
  location[0] = objc_loadWeakRetained(a1 + 5);
  if (location[0])
  {
    if ((v10 & 1) != 0)
    {
      id v7 = [location[0] stateMachine];
      id v14 = @"MeasurerKey";
      id v6 = [a1[4] copy];
      id v15 = v6;
      id v5 =  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v15,  &v14,  1LL);
      objc_msgSend(v7, "postEvent:withContext:userInfo:", @"ContinueToNextStepEvent", 0);
    }

    else
    {
      id v4 = [location[0] stateMachine];
      id v12 = @"MeasurerKey";
      id v3 = [a1[4] copy];
      id v13 = v3;
      id v2 =  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v13,  &v12,  1LL);
      objc_msgSend(v4, "postEvent:withContext:userInfo:", @"GoToPreviousStepEvent", 0);
    }
  }

  objc_storeStrong(location, 0LL);
}

NSString *__cdecl sub_1000115F8(id a1, int64_t a2)
{
  v13[3] = a1;
  id v13[2] = (id)a2;
  v13[1] = a1;
  v13[0] = 0LL;
  switch(a2)
  {
    case 538423810LL:
      id v12 =  +[NSBundle bundleWithIdentifier:]( &OBJC_CLASS___NSBundle,  "bundleWithIdentifier:",  @"com.apple.TVDisplayAssistant");
      id v2 = sub_10001B768(@"Chroma444", v12, 1, 0, @"Localizable");
      id v3 = v13[0];
      v13[0] = v2;

      break;
    case 538423811LL:
      id v11 =  +[NSBundle bundleWithIdentifier:]( &OBJC_CLASS___NSBundle,  "bundleWithIdentifier:",  @"com.apple.TVDisplayAssistant");
      id v4 = sub_10001B768(@"Chroma422", v11, 1, 0, @"Localizable");
      id v5 = v13[0];
      v13[0] = v4;

      break;
    case 538423812LL:
      char v10 =  +[NSBundle bundleWithIdentifier:]( &OBJC_CLASS___NSBundle,  "bundleWithIdentifier:",  @"com.apple.TVDisplayAssistant");
      id v6 = sub_10001B768(@"Chroma420", v10, 1, 0, @"Localizable");
      id v7 = v13[0];
      v13[0] = v6;

      break;
  }

  id v9 = v13[0];
  objc_storeStrong(v13, 0LL);
  return (NSString *)v9;
}

id sub_1000117F8(id *a1)
{
  v30[2] = a1;
  v30[1] = a1;
  v30[0] = 0LL;
  id v1 = [a1[4] resolution];
  if ((PBSDisplayResolutionIs4K(v1, v2, v3) & 1) != 0)
  {
    id v28 =  +[NSBundle bundleWithIdentifier:]( &OBJC_CLASS___NSBundle,  "bundleWithIdentifier:",  @"com.apple.TVDisplayAssistant");
    id v4 = sub_10001B768(@"UHDResolution", v28, 1, 0, @"Localizable");
    id v5 = v30[0];
    v30[0] = v4;
  }

  else
  {
    id v6 = [a1[4] resolution];
    if ((PBSDisplayResolutionIs1080p(v6, v7, v8) & 1) != 0
      || (id v9 = [a1[4] resolution], (PBSDisplayResolutionIs720p(v9, v10, v11) & 1) != 0)
      || (id v12 = [a1[4] resolution], (PBSDisplayResolutionIs576p(v12, v13, v14) & 1) != 0)
      || (id v15 = [a1[4] resolution], (PBSDisplayResolutionIs480p(v15, v16, v17) & 1) != 0))
    {
      [a1[4] resolution];
      id v19 = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%zup", llround(v18));
      id v20 = v30[0];
      v30[0] = v19;
    }

    else
    {
      [a1[4] resolution];
      unint64_t v27 = llround(v21);
      [a1[4] resolution];
      id v23 =  +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%zu x %zu",  v27,  llround(v22));
      id v24 = v30[0];
      v30[0] = v23;
    }
  }

  id v26 = v30[0];
  objc_storeStrong(v30, 0LL);
  return v26;
}

uint64_t sub_100012F58(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v5 = [*(id *)(a1 + 32) destination];
  unsigned __int8 v6 = +[TVDADisplayUpdater updateDisplayWithMode:reason:enableEARC:configureRequest:error:]( TVDADisplayUpdater,  "updateDisplayWithMode:reason:enableEARC:configureRequest:error:",  v5,  @"Trying HDR in HDR Buddy",  (unint64_t)[*(id *)(a1 + 32) shouldEnableEARC] & 1,  &stru_100028FC8,  a3);

  return v6 & 1;
}

void sub_100013010(id a1, PBSDisplayManagerUpdateRequest *a2)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  [location[0] setUseDisplayModeAsDefaultForNextWake:1];
  objc_storeStrong(location, 0LL);
}

uint64_t sub_100013070(id *a1, char a2, void *a3)
{
  id v9 = a1;
  char v8 = a2 & 1;
  v7[2] = a3;
  v7[1] = a1;
  id v5 = [a1[4] destination];
  v7[0] = a1[4];
  unsigned __int8 v6 = +[TVDADisplayUpdater updateDisplayWithMode:reason:enableEARC:configureRequest:error:]( &OBJC_CLASS___TVDADisplayUpdater,  "updateDisplayWithMode:reason:enableEARC:configureRequest:error:",  v5,  @"Confirming HDR in HDR Buddy",  0LL);
  objc_storeStrong(v7, 0LL);

  return v6 & 1;
}

void sub_100013180(id *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  id v3 = location[0];
  id v4 = [a1[4] destination];
  objc_msgSend(v3, "setUpgradeDisplayModeToNonVirtual:", (unint64_t)objc_msgSend(v4, "isVirtual") & 1);

  [location[0] setWriteDisplayModeToDisk:1];
  objc_storeStrong(location, 0LL);
}

uint64_t sub_100013230(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) source];
  unsigned __int8 v3 = +[TVDADisplayUpdater updateDisplayWithMode:reason:enableEARC:configureRequest:error:]( &OBJC_CLASS___TVDADisplayUpdater,  "updateDisplayWithMode:reason:enableEARC:configureRequest:error:");

  return v3 & 1;
}

void sub_1000132D0(id a1, PBSDisplayManagerUpdateRequest *a2)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  [location[0] setWriteDisplayModeToDisk:1];
  objc_storeStrong(location, 0LL);
}

uint64_t sub_1000144D4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v5 = [*(id *)(a1 + 32) destination];
  unsigned __int8 v6 = +[TVDADisplayUpdater updateDisplayWithMode:reason:enableEARC:configureRequest:error:]( TVDADisplayUpdater,  "updateDisplayWithMode:reason:enableEARC:configureRequest:error:",  v5,  @"Trying an upgraded mode in the Upgrade Buddy",  (unint64_t)[*(id *)(a1 + 32) shouldEnableEARC] & 1,  &stru_100029058,  a3);

  return v6 & 1;
}

void sub_10001458C(id a1, PBSDisplayManagerUpdateRequest *a2)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  [location[0] setUseDisplayModeAsDefaultForNextWake:1];
  objc_storeStrong(location, 0LL);
}

uint64_t sub_1000145EC(id *a1, char a2, void *a3)
{
  id v9 = a1;
  char v8 = a2 & 1;
  v7[2] = a3;
  v7[1] = a1;
  id v5 = [a1[4] destination];
  v7[0] = a1[4];
  unsigned __int8 v6 = +[TVDADisplayUpdater updateDisplayWithMode:reason:enableEARC:configureRequest:error:]( &OBJC_CLASS___TVDADisplayUpdater,  "updateDisplayWithMode:reason:enableEARC:configureRequest:error:",  v5,  @"Confirming an upgraded mode in the Upgrade Buddy",  0LL);
  objc_storeStrong(v7, 0LL);

  return v6 & 1;
}

void sub_1000146FC(id *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  id v4 = location[0];
  id v5 = [a1[4] destination];
  objc_msgSend(v4, "setUpgradeDisplayModeToNonVirtual:", (unint64_t)objc_msgSend(v5, "isVirtual") & 1);

  [location[0] setWriteDisplayModeToDisk:1];
  id v7 = [a1[4] destination];
  unsigned __int8 v8 = [v7 isAboveBandwidthThreshold];

  if ((v8 & 1) != 0)
  {
    id v2 = location[0];
    uint64_t v10 = PBSDisplayManagerUpdateRequestCanHandleHighBandwidthModesKey;
    __n128 v11 = &__kCFBooleanTrue;
    unsigned __int8 v3 =  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v11,  &v10,  1LL);
    objc_msgSend(v2, "setUserInfo:");
  }

  objc_storeStrong(location, 0LL);
}

uint64_t sub_10001487C(uint64_t a1, char a2, void *a3)
{
  uint64_t v8 = a1;
  char v7 = a2 & 1;
  v6[2] = a3;
  v6[1] = (id)a1;
  uint64_t v4 = *(void *)(a1 + 32);
  v6[0] = *(id *)(a1 + 40);
  unsigned __int8 v5 = +[TVDADisplayUpdater updateDisplayWithMode:reason:enableEARC:configureRequest:error:]( &OBJC_CLASS___TVDADisplayUpdater,  "updateDisplayWithMode:reason:enableEARC:configureRequest:error:",  v4,  @"Reverting to the fallback or source mode in the Upgrade Buddy",  0LL);
  objc_storeStrong(v6, 0LL);
  return v5 & 1;
}

void sub_100014968(id *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  [location[0] setWriteDisplayModeToDisk:1];
  id v5 = [a1[4] destination];
  unsigned __int8 v6 = [v5 isAboveBandwidthThreshold];

  if ((v6 & 1) != 0)
  {
    id v2 = location[0];
    uint64_t v8 = PBSDisplayManagerUpdateRequestCanHandleHighBandwidthModesKey;
    id v9 = &__kCFBooleanFalse;
    unsigned __int8 v3 =  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v9,  &v8,  1LL);
    objc_msgSend(v2, "setUserInfo:");
  }

  objc_storeStrong(location, 0LL);
}

uint64_t sub_1000150B4(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) destination];
  unsigned __int8 v3 = +[TVDADisplayUpdater updateDisplayWithMode:reason:enableEARC:configureRequest:error:]( &OBJC_CLASS___TVDADisplayUpdater,  "updateDisplayWithMode:reason:enableEARC:configureRequest:error:");

  return v3 & 1;
}

void sub_100015154(id a1, PBSDisplayManagerUpdateRequest *a2)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  [location[0] setUseDisplayModeAsDefaultForNextWake:1];
  objc_storeStrong(location, 0LL);
}

uint64_t sub_1000151B4(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) source];
  unsigned __int8 v3 = +[TVDADisplayUpdater updateDisplayWithMode:reason:enableEARC:configureRequest:error:]( &OBJC_CLASS___TVDADisplayUpdater,  "updateDisplayWithMode:reason:enableEARC:configureRequest:error:");

  return v3 & 1;
}

void sub_100015254(id a1, PBSDisplayManagerUpdateRequest *a2)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  id v2 = location[0];
  uint64_t v5 = PBSDisplayManagerUpdateRequestPassthroughKey;
  unsigned __int8 v6 = &__kCFBooleanTrue;
  unsigned __int8 v3 =  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v6,  &v5,  1LL);
  objc_msgSend(v2, "setUserInfo:");

  objc_storeStrong(location, 0LL);
}

uint64_t sub_100015DD0(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) destination];
  unsigned __int8 v3 = +[TVDADisplayUpdater updateDisplayWithMode:reason:error:]( &OBJC_CLASS___TVDADisplayUpdater,  "updateDisplayWithMode:reason:error:");

  return v3 & 1;
}

uint64_t sub_100015E60(id *a1, char a2, uint64_t *a3)
{
  __n128 v17 = a1;
  char v16 = a2 & 1;
  id v15 = a3;
  v14[1] = a1;
  id v7 = [a1[4] destination];
  id v9 = _NSConcreteStackBlock;
  int v10 = -1073741824;
  int v11 = 0;
  id v12 = sub_1000160B0;
  __n128 v13 = &unk_100029018;
  v14[0] = a1[4];
  +[TVDADisplayUpdater updateDisplayWithMode:reason:enableEARC:configureRequest:error:]( &OBJC_CLASS___TVDADisplayUpdater,  "updateDisplayWithMode:reason:enableEARC:configureRequest:error:",  v7,  @"Confirming a mode for Content Match",  0LL,  &v9,  v15);

  if (v15 && *v15)
  {
    os_log_t oslog = (os_log_t)sub_10001A69C();
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
    {
      sub_100009320((uint64_t)v18, *v15);
      _os_log_error_impl( (void *)&_mh_execute_header,  oslog,  OS_LOG_TYPE_ERROR,  "makeVerifyModeStepsWithModeSwitch Error: %{public}@",  v18,  0xCu);
    }

    objc_storeStrong((id *)&oslog, 0LL);
  }

  id v4 = [a1[4] source];
  unsigned __int8 v5 = +[TVDADisplayUpdater updateDisplayWithMode:reason:enableEARC:configureRequest:error:]( &OBJC_CLASS___TVDADisplayUpdater,  "updateDisplayWithMode:reason:enableEARC:configureRequest:error:");

  objc_storeStrong(v14, 0LL);
  return v5 & 1;
}

void sub_1000160B0(id *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  id v3 = location[0];
  id v4 = [a1[4] destination];
  objc_msgSend(v3, "setUpgradeDisplayModeToNonVirtual:", (unint64_t)objc_msgSend(v4, "isVirtual") & 1);

  objc_storeStrong(location, 0LL);
}

void sub_100016144(id a1, PBSDisplayManagerUpdateRequest *a2)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  id v2 = location[0];
  uint64_t v5 = PBSDisplayManagerUpdateRequestPassthroughKey;
  unsigned __int8 v6 = &__kCFBooleanTrue;
  id v3 =  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v6,  &v5,  1LL);
  objc_msgSend(v2, "setUserInfo:");

  objc_storeStrong(location, 0LL);
}

uint64_t sub_100016228(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) source];
  unsigned __int8 v3 = +[TVDADisplayUpdater updateDisplayWithMode:reason:error:]( &OBJC_CLASS___TVDADisplayUpdater,  "updateDisplayWithMode:reason:error:");

  return v3 & 1;
}

uint64_t sub_10001667C(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) destination];
  unsigned __int8 v3 = +[TVDADisplayUpdater updateDisplayWithMode:reason:error:]( &OBJC_CLASS___TVDADisplayUpdater,  "updateDisplayWithMode:reason:error:");

  return v3 & 1;
}

uint64_t sub_100016E18(id *a1, char a2, void *a3)
{
  id v9 = a1;
  char v8 = a2 & 1;
  v7[2] = a3;
  v7[1] = a1;
  id v5 = [a1[4] destination];
  v7[0] = a1[4];
  unsigned __int8 v6 = +[TVDADisplayUpdater updateDisplayWithMode:reason:enableEARC:configureRequest:error:]( &OBJC_CLASS___TVDADisplayUpdater,  "updateDisplayWithMode:reason:enableEARC:configureRequest:error:",  v5,  @"Confirming a manual user mode switch",  0LL);
  objc_storeStrong(v7, 0LL);

  return v6 & 1;
}

void sub_100016F28(id *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  id v3 = location[0];
  id v4 = [a1[4] destination];
  objc_msgSend(v3, "setUpgradeDisplayModeToNonVirtual:", (unint64_t)objc_msgSend(v4, "isVirtual") & 1);

  [location[0] setWriteDisplayModeToDisk:1];
  objc_storeStrong(location, 0LL);
}

uint64_t sub_100016FD8(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) source];
  unsigned __int8 v3 = +[TVDADisplayUpdater updateDisplayWithMode:reason:error:]( &OBJC_CLASS___TVDADisplayUpdater,  "updateDisplayWithMode:reason:error:");

  return v3 & 1;
}

uint64_t sub_100019014(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) destination];
  unsigned __int8 v3 = +[TVDADisplayUpdater updateDisplayWithMode:reason:error:]( &OBJC_CLASS___TVDADisplayUpdater,  "updateDisplayWithMode:reason:error:");

  return v3 & 1;
}

uint64_t sub_1000190A4(id *a1, char a2, void *a3)
{
  id v9 = a1;
  char v8 = a2 & 1;
  v7[2] = a3;
  v7[1] = a1;
  id v5 = [a1[4] destination];
  v7[0] = a1[4];
  unsigned __int8 v6 = +[TVDADisplayUpdater updateDisplayWithMode:reason:enableEARC:configureRequest:error:]( &OBJC_CLASS___TVDADisplayUpdater,  "updateDisplayWithMode:reason:enableEARC:configureRequest:error:",  v5,  @"Confirming a region specific mode",  0LL);
  objc_storeStrong(v7, 0LL);

  return v6 & 1;
}

void sub_1000191B4(id *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  id v3 = location[0];
  id v4 = [a1[4] destination];
  objc_msgSend(v3, "setUpgradeDisplayModeToNonVirtual:", (unint64_t)objc_msgSend(v4, "isVirtual") & 1);

  [location[0] setWriteDisplayModeToDisk:1];
  objc_storeStrong(location, 0LL);
}

uint64_t sub_100019264(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) source];
  unsigned __int8 v3 = +[TVDADisplayUpdater updateDisplayWithMode:reason:error:]( &OBJC_CLASS___TVDADisplayUpdater,  "updateDisplayWithMode:reason:error:");

  return v3 & 1;
}

id sub_10001A69C()
{
  predicate = (dispatch_once_t *)&unk_100031410;
  dispatch_block_t block = 0LL;
  objc_storeStrong(&block, &stru_100029260);
  if (*predicate != -1) {
    dispatch_once(predicate, block);
  }
  objc_storeStrong(&block, 0LL);
  return (id)qword_100031408;
}

void sub_10001A714(id a1)
{
  os_log_t v1 = os_log_create("com.apple.appletv.DisplayAssistant", "");
  id v2 = (void *)qword_100031408;
  qword_100031408 = (uint64_t)v1;
}

id sub_10001A760()
{
  predicate = (dispatch_once_t *)&unk_100031420;
  dispatch_block_t block = 0LL;
  objc_storeStrong(&block, &stru_100029280);
  if (*predicate != -1) {
    dispatch_once(predicate, block);
  }
  objc_storeStrong(&block, 0LL);
  return (id)qword_100031418;
}

void sub_10001A7D8(id a1)
{
  os_log_t v1 = os_log_create("com.apple.appletv.DisplayAssistant.stateMachine", "");
  id v2 = (void *)qword_100031418;
  qword_100031418 = (uint64_t)v1;
}

uint64_t start(int a1, char **a2)
{
  context = objc_autoreleasePoolPush();
  id v2 = (objc_class *)objc_opt_class(&OBJC_CLASS___TVDAAppDelegate);
  id v4 = NSStringFromClass(v2);
  unsigned int v8 = UIApplicationMain(a1, a2, 0LL, v4);

  objc_autoreleasePoolPop(context);
  return v8;
}

void sub_10001A9F8(id a1, PBSDisplayManagerUpdateRequest *a2)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  objc_storeStrong(location, 0LL);
}

uint64_t sub_10001AD88(uint64_t result, uint64_t a2, uint64_t a3, int a4)
{
  *(_BYTE *)result = 2;
  *(_BYTE *)(result + 1) = 3;
  *(_BYTE *)(result + 2) = 32;
  *(_BYTE *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 66;
  *(_BYTE *)(result + 13) = 8;
  *(void *)(result + 14) = a3;
  *(_BYTE *)(result + 22) = 0;
  *(_BYTE *)(result + 23) = 4;
  *(_DWORD *)(result + 24) = a4;
  return result;
}

void sub_10001B5D8(id *a1)
{
  v1[2] = a1;
  v1[1] = a1;
  v1[0] = [a1[4] _remoteViewControllerProxy];
  objc_msgSend(v1[0], "dismissWithResult:");
  objc_storeStrong(v1, 0LL);
}

id sub_10001B768(void *a1, void *a2, char a3, char a4, void *a5)
{
  id location = 0LL;
  objc_storeStrong(&location, a1);
  id v18 = 0LL;
  objc_storeStrong(&v18, a2);
  char v17 = a3 & 1;
  char v16 = a4 & 1;
  id v15 = 0LL;
  objc_storeStrong(&v15, a5);
  id v14 = location;
  if ((v16 & 1) != 0)
  {
    id v5 = (id)SFLocalizableWAPIStringKeyForKey(location);
    id v6 = v14;
    id v14 = v5;
  }

  id v13 = [v18 localizedStringForKey:v14 value:&stru_10002B710 table:v15];
  if ((v17 & 1) != 0) {
    objc_msgSend(v13, "tvda_setKey:", location);
  }
  id v8 = v13;
  objc_storeStrong(&v13, 0LL);
  objc_storeStrong(&v14, 0LL);
  objc_storeStrong(&v15, 0LL);
  objc_storeStrong(&v18, 0LL);
  objc_storeStrong(&location, 0LL);
  return v8;
}

void sub_10001BF04(uint64_t a1)
{
  id v14[2] = (id)a1;
  v14[1] = (id)a1;
  v14[0] = sub_10001A69C();
  os_log_type_t v13 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v14[0], OS_LOG_TYPE_DEFAULT))
  {
    id v2 = [*(id *)(a1 + 32) measurementType];
    id location = v2;
    sub_100009320((uint64_t)v15, (uint64_t)location);
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v14[0],  v13,  "TVSWiFiQualityMeasurement: began measuring %{public}@",  v15,  0xCu);

    objc_storeStrong(&location, 0LL);
  }

  objc_storeStrong(v14, 0LL);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v4 = _NSConcreteStackBlock;
  int v5 = -1073741824;
  int v6 = 0;
  id v7 = sub_10001C158;
  id v8 = &unk_100029AE8;
  objc_copyWeak(&v10, (id *)(a1 + 48));
  id v9 = *(id *)(a1 + 40);
  char v11 = *(_BYTE *)(a1 + 56) & 1;
  [WeakRetained measureQualityWithCompletion:&v4];

  objc_storeStrong(&v9, 0LL);
  objc_destroyWeak(&v10);
}

void sub_10001C11C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object, uint64_t a11, uint64_t a12, id *location, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, int a23, int a24, uint64_t a25)
{
}

void sub_10001C158(uint64_t a1, void *a2)
{
  location[1] = (id)a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  v23[1] = (id)a1;
  v23[0] = objc_loadWeakRetained((id *)(a1 + 40));
  id v22 = sub_10001A69C();
  os_log_type_t v21 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v22, OS_LOG_TYPE_DEFAULT))
  {
    log = (os_log_s *)v22;
    id v2 = [v23[0] measurementType];
    id v20 = v2;
    sub_100009320((uint64_t)v25, (uint64_t)v20);
    _os_log_impl( (void *)&_mh_execute_header,  log,  v21,  "TVSWiFiQualityMeasurement: completed measuring %{public}@",  v25,  0xCu);

    objc_storeStrong(&v20, 0LL);
  }

  objc_storeStrong(&v22, 0LL);
  char v11 = _NSConcreteStackBlock;
  int v12 = -1073741824;
  int v13 = 0;
  id v14 = sub_10001C4B4;
  id v15 = &unk_100029A98;
  objc_copyWeak(&v18, (id *)(a1 + 40));
  id v17 = *(id *)(a1 + 32);
  id v16 = location[0];
  id v19 = objc_retainBlock(&v11);
  if ((*(_BYTE *)(a1 + 48) & 1) != 0)
  {
    int v5 = _NSConcreteStackBlock;
    int v6 = -1073741824;
    int v7 = 0;
    id v8 = sub_10001C640;
    id v9 = &unk_100029AC0;
    id v10 = v19;
    sub_10001C530(0LL, &v5);
    objc_storeStrong(&v10, 0LL);
  }

  else
  {
    (*((void (**)(void))v19 + 2))();
  }

  objc_storeStrong(&v19, 0LL);
  objc_storeStrong(&v16, 0LL);
  objc_storeStrong(&v17, 0LL);
  objc_destroyWeak(&v18);
  objc_storeStrong(v23, 0LL);
  objc_storeStrong(location, 0LL);
}

void sub_10001C4A4()
{
}

void sub_10001C4B4(uint64_t a1)
{
  id location[2] = (id)a1;
  location[1] = (id)a1;
  location[0] = objc_loadWeakRetained((id *)(a1 + 48));
  if (*(void *)(a1 + 40)) {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
  }
  objc_storeStrong(location, 0LL);
}

void sub_10001C530(uint64_t a1, void *a2)
{
  uint64_t v11 = a1;
  id location = 0LL;
  objc_storeStrong(&location, a2);
  unsigned __int8 v3 = _NSConcreteStackBlock;
  int v4 = -1073741824;
  int v5 = 0;
  int v6 = sub_10001C748;
  int v7 = &unk_100029B38;
  id v8 = location;
  id v9 = objc_retainBlock(&v3);
  id v2 = +[PBSDisplayManager sharedInstance](&OBJC_CLASS___PBSDisplayManager, "sharedInstance");
  if (v11) {
    [v2 sleepDisplay:v9];
  }
  else {
    [v2 wakeDisplay:v9];
  }
  objc_storeStrong(&v2, 0LL);
  objc_storeStrong(&v9, 0LL);
  objc_storeStrong(&v8, 0LL);
  objc_storeStrong(&location, 0LL);
}

uint64_t sub_10001C640(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, uint64_t))(*(void *)(a1 + 32) + 16LL))(*(void *)(a1 + 32), a2);
}

uint64_t sub_10001C674(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, uint64_t))(*(void *)(a1 + 32) + 16LL))(*(void *)(a1 + 32), a2);
}

void sub_10001C748(dispatch_block_t *a1, void *a2, void *a3)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  id v7 = 0LL;
  objc_storeStrong(&v7, a3);
  oslog[1] = (os_log_t)a1;
  if (v7)
  {
    oslog[0] = (os_log_t)sub_10001A69C();
    if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_ERROR))
    {
      sub_100009320((uint64_t)v9, (uint64_t)v7);
      _os_log_error_impl( (void *)&_mh_execute_header,  oslog[0],  OS_LOG_TYPE_ERROR,  "Could not toggle the display, error: %{public}@",  v9,  0xCu);
    }

    objc_storeStrong((id *)oslog, 0LL);
  }

  if (a1[4])
  {
    unsigned __int8 v3 = &_dispatch_main_q;
    dispatch_async(v3, a1[4]);
  }

  objc_storeStrong(&v7, 0LL);
  objc_storeStrong(location, 0LL);
}

void sub_10001D330()
{
}

void sub_10001D340(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _triggerActionHandlerWithAction:*(void *)(a1 + 32)];
}

uint64_t sub_10001D390(uint64_t a1, char a2)
{
  if ((a2 & 1) != 0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    id v3 = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(WeakRetained, "_triggerActionHandlerWithAction:");
  }

  return 1LL;
}

void sub_10001D41C(uint64_t a1, double a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _handleActionTimerStatusChange:a2];
}

id objc_msgSend_yellowColor(void *a1, const char *a2, ...)
{
  return [a1 yellowColor];
}
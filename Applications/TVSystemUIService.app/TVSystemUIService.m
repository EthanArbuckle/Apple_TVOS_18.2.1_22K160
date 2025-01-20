NSOrderedSet *__cdecl sub_100005580(id a1, NSOrderedSet *a2)
{
  id v3;
  id location[2];
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  v3 = location[0];
  objc_storeStrong(location, 0LL);
  return (NSOrderedSet *)v3;
}

void sub_1000057F0(id *a1, void *a2)
{
}

uint64_t sub_10000583C(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6, uint64_t a7)
{
  *(_BYTE *)result = 2;
  *(_BYTE *)(result + 1) = 6;
  *(_BYTE *)(result + 2) = 66;
  *(_BYTE *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 66;
  *(_BYTE *)(result + 13) = 8;
  *(void *)(result + 14) = a3;
  *(_BYTE *)(result + 22) = 0;
  *(_BYTE *)(result + 23) = 8;
  *(void *)(result + 24) = a4;
  *(_BYTE *)(result + 32) = 66;
  *(_BYTE *)(result + 33) = 8;
  *(void *)(result + 34) = a5;
  *(_BYTE *)(result + 42) = 0;
  *(_BYTE *)(result + 43) = 4;
  *(_DWORD *)(result + 44) = a6;
  *(_BYTE *)(result + 48) = 66;
  *(_BYTE *)(result + 49) = 8;
  *(void *)(result + 50) = a7;
  return result;
}

void sub_100006250( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, int a27, int a28, _Unwind_Exception *exception_object, char a30, uint64_t a31, uint64_t a32, uint64_t a33, id a34)
{
}

id sub_10000629C(uint64_t a1)
{
  uint64_t v6 = a1;
  uint64_t v5 = a1;
  [*(id *)(a1 + 32) setAlpha:1.0];
  v3 = *(void **)(a1 + 32);
  memcpy(__dst, &CGAffineTransformIdentity, sizeof(__dst));
  return [v3 setTransform:__dst];
}

void sub_100006308(id *a1, void *a2)
{
  location[3] = a1;
  location[2] = a2;
  location[1] = a1;
  location[0] = objc_loadWeakRetained(a1 + 4);
  if (location[0]) {
    [location[0] satisfyMilestone:@"_TVSSMenuBarFadeInMenuBarAnimationComplete"];
  }
  objc_storeStrong(location, 0LL);
}

void sub_100006588(void *a1)
{
  id v22 = a1;
  if (a1)
  {
    v3 = objc_alloc(&OBJC_CLASS___UIViewPropertyAnimator);
    id v4 =  +[UISpringTimingParameters tvss_defaultSpringParameters]( &OBJC_CLASS___UISpringTimingParameters,  "tvss_defaultSpringParameters");
    v1 = -[UIViewPropertyAnimator initWithDuration:timingParameters:](v3, "initWithDuration:timingParameters:", 0.3);
    uint64_t v2 = (void *)*((void *)v22 + 3);
    *((void *)v22 + 3) = v1;

    id v5 = [v22 animationContext];
    id v21 = [v5 pillView];

    uint64_t v6 = (void *)*((void *)v22 + 3);
    v15 = _NSConcreteStackBlock;
    int v16 = -1073741824;
    int v17 = 0;
    v18 = sub_10000687C;
    v19 = &unk_1001B5A60;
    id v20 = v21;
    [v6 addAnimations:&v15];
    objc_initWeak(&location, v22);
    v7 = (void *)*((void *)v22 + 3);
    v8 = _NSConcreteStackBlock;
    int v9 = -1073741824;
    int v10 = 0;
    v11 = sub_1000068B0;
    v12 = &unk_1001B5A88;
    objc_copyWeak(&v13, &location);
    [v7 addCompletion:&v8];
    [v22 addMilestone:@"_TVSSMenuBarFadeOutMenuBarAnimationComplete"];
    [*((id *)v22 + 3) startAnimation];
    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
    objc_storeStrong(&v20, 0LL);
    objc_storeStrong(&v21, 0LL);
  }
}

  ;
}

void sub_1000067D0( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id *location, uint64_t a21, uint64_t a22, uint64_t a23, int a24, int a25, _Unwind_Exception *exception_object)
{
}

id sub_10000687C(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0, a1, a1);
}

void sub_1000068B0(id *a1, void *a2)
{
  location[3] = a1;
  location[2] = a2;
  location[1] = a1;
  location[0] = objc_loadWeakRetained(a1 + 4);
  if (location[0]) {
    [location[0] satisfyMilestone:@"_TVSSMenuBarFadeOutMenuBarAnimationComplete"];
  }
  objc_storeStrong(location, 0LL);
}

id sub_100006F2C()
{
  return +[UIFont monospacedSystemFontOfSize:weight:]( &OBJC_CLASS___UIFont,  "monospacedSystemFontOfSize:weight:",  14.0,  UIFontWeightMedium);
}

void sub_100006F58(id obj)
{
  id location = 0LL;
  objc_storeStrong(&location, obj);
  id v17 = [location centerXAnchor];
  id v16 = [location superview];
  id v15 = [v16 centerXAnchor];
  id v14 = objc_msgSend(v17, "constraintEqualToAnchor:");
  v19[0] = v14;
  id v13 = [location centerYAnchor];
  id v12 = [location superview];
  id v11 = [v12 centerYAnchor];
  id v10 = objc_msgSend(v13, "constraintEqualToAnchor:");
  v19[1] = v10;
  id v9 = [location widthAnchor];
  id v8 = [location superview];
  id v7 = [v8 widthAnchor];
  id v6 = objc_msgSend(v9, "constraintEqualToAnchor:");
  v19[2] = v6;
  id v5 = [location heightAnchor];
  id v4 = [location superview];
  id v3 = [v4 heightAnchor];
  id v2 = objc_msgSend(v5, "constraintEqualToAnchor:");
  v19[3] = v2;
  v1 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v19, 4LL);
  +[NSLayoutConstraint activateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "activateConstraints:");

  objc_storeStrong(&location, 0LL);
}

void sub_100007FA0(id *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  id WeakRetained = objc_loadWeakRetained(a1 + 4);
  [WeakRetained _timerTick];

  objc_storeStrong(location, 0LL);
}

void sub_100008824(id a1)
{
}

void sub_10000885C(id a1)
{
}

void sub_100008B08(uint64_t a1, void *a2, void *a3, void *a4)
{
  location[1] = (id)a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  v8[3] = a3;
  v8[2] = a4;
  v8[1] = (id)a1;
  id v4 = (void *)objc_opt_class(*(void *)(a1 + 40));
  v8[0] = [v4 identifierForPBSAXMenuOptions:location[0]];
  if (v8[0]) {
    [*(id *)(a1 + 32) addObject:v8[0]];
  }
  objc_storeStrong(v8, 0LL);
  objc_storeStrong(location, 0LL);
}

uint64_t sub_100008BC0(void *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  if (([location[0] isEqualToString:@"voiceover"] & 1) == 0
    || (char v4 = 1, (a1[4] & 1LL) == 0))
  {
    if (([location[0] isEqualToString:@"zoom"] & 1) == 0
      || (char v4 = 1, (a1[4] & 2LL) == 0))
    {
      if (([location[0] isEqualToString:@"hovertext"] & 1) == 0
        || (char v4 = 1, (a1[4] & 0x400LL) == 0))
      {
        if (([location[0] isEqualToString:@"closedcaption"] & 1) == 0
          || (char v4 = 1, (a1[4] & 4LL) == 0))
        {
          if (([location[0] isEqualToString:@"audiodecriptions"] & 1) == 0
            || (char v4 = 1, (a1[4] & 8LL) == 0))
          {
            if (([location[0] isEqualToString:@"switchcontrol"] & 1) == 0
              || (char v4 = 1, (a1[4] & 0x20LL) == 0))
            {
              if (([location[0] isEqualToString:@"colorfilters"] & 1) == 0
                || (char v4 = 1, (a1[4] & 0x80LL) == 0))
              {
                if (([location[0] isEqualToString:@"lightsensitivity"] & 1) == 0
                  || (char v4 = 1, (a1[4] & 0x100LL) == 0))
                {
                  if (([location[0] isEqualToString:@"reducewhitepoint"] & 1) == 0
                    || (char v4 = 1, (a1[4] & 0x200LL) == 0))
                  {
                    BOOL v3 = 0;
                    char v4 = v3;
                  }
                }
              }
            }
          }
        }
      }
    }
  }

  objc_storeStrong(location, 0LL);
  return v4 & 1;
}

void sub_100008F58(id a1)
{
  v3[0] = &off_1001C8828;
  v4[0] = @"voiceover";
  v3[1] = &off_1001C8840;
  v4[1] = @"zoom";
  v3[2] = &off_1001C8858;
  v4[2] = @"hovertext";
  v3[3] = &off_1001C8870;
  v4[3] = @"closedcaption";
  v3[4] = &off_1001C8888;
  v4[4] = @"audiodecriptions";
  v3[5] = &off_1001C88A0;
  v4[5] = @"switchcontrol";
  v3[6] = &off_1001C88B8;
  v4[6] = @"colorfilters";
  v3[7] = &off_1001C88D0;
  v4[7] = @"lightsensitivity";
  v3[8] = &off_1001C88E8;
  v4[8] = @"reducewhitepoint";
  v3[9] = &off_1001C8900;
  v4[9] = @"photosensitivemitigation";
  v1 =  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v4,  v3,  10LL);
  id v2 = (void *)qword_1002218C0;
  qword_1002218C0 = (uint64_t)v1;
}

void sub_1000091A0(id a1)
{
  v13[0] = @"voiceover";
  id v12 = TVSSLocString(@"TVSSAccessibilityVoiceOver");
  v14[0] = v12;
  v13[1] = @"zoom";
  id v11 = TVSSLocString(@"TVSSAccessibilityZoom");
  v14[1] = v11;
  v13[2] = @"hovertext";
  id v10 = TVSSLocString(@"TVSSAccessibilityHoverText");
  v14[2] = v10;
  v13[3] = @"closedcaption";
  id v9 = TVSSLocString(@"TVSSAccessibilityClosedCaptions");
  v14[3] = v9;
  v13[4] = @"audiodecriptions";
  id v8 = TVSSLocString(@"TVSSAccessibilityAudioDescriptions");
  v14[4] = v8;
  v13[5] = @"switchcontrol";
  id v7 = TVSSLocString(@"TVSSAccessibilitySwitchControl");
  v14[5] = v7;
  v13[6] = @"colorfilters";
  id v6 = TVSSLocString(@"TVSSAccessibilityColorFilters");
  v14[6] = v6;
  v13[7] = @"lightsensitivity";
  id v5 = TVSSLocString(@"TVSSAccessibilityLightSensitivity");
  v14[7] = v5;
  v13[8] = @"reducewhitepoint";
  id v4 = TVSSLocString(@"TVSSAccessibilityReduceWhitePoint");
  v14[8] = v4;
  v13[9] = @"photosensitivemitigation";
  id v3 = TVSSLocString(@"TVSSAccessibilityDimFlashingLights");
  v14[9] = v3;
  v1 =  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v14,  v13,  10LL);
  id v2 = (void *)qword_1002218D0;
  qword_1002218D0 = (uint64_t)v1;
}

void sub_10000954C(id a1)
{
  v13[0] = @"voiceover";
  id v12 = objc_retainBlock(&stru_1001B5ED8);
  v14[0] = v12;
  v13[1] = @"zoom";
  id v11 = objc_retainBlock(&stru_1001B5EF8);
  v14[1] = v11;
  v13[2] = @"hovertext";
  id v10 = objc_retainBlock(&stru_1001B5F18);
  v14[2] = v10;
  v13[3] = @"closedcaption";
  id v9 = objc_retainBlock(&stru_1001B5F38);
  v14[3] = v9;
  v13[4] = @"audiodecriptions";
  id v8 = objc_retainBlock(&stru_1001B5F78);
  v14[4] = v8;
  v13[5] = @"switchcontrol";
  id v7 = objc_retainBlock(&stru_1001B5F98);
  v14[5] = v7;
  v13[6] = @"colorfilters";
  id v6 = objc_retainBlock(&stru_1001B5FB8);
  v14[6] = v6;
  v13[7] = @"lightsensitivity";
  id v5 = objc_retainBlock(&stru_1001B5FD8);
  v14[7] = v5;
  v13[8] = @"reducewhitepoint";
  id v4 = objc_retainBlock(&stru_1001B5FF8);
  v14[8] = v4;
  v13[9] = @"photosensitivemitigation";
  id v3 = objc_retainBlock(&stru_1001B6018);
  v14[9] = v3;
  v1 =  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v14,  v13,  10LL);
  id v2 = (void *)qword_1002218E0;
  qword_1002218E0 = (uint64_t)v1;
}

unsigned __int8 sub_100009784(id a1)
{
  return ((uint64_t (*)(id))_AXSVoiceOverTouchEnabled)(a1);
}

unsigned __int8 sub_1000097B0(id a1)
{
  return ((uint64_t (*)(id))_AXSZoomTouchEnabled)(a1);
}

unsigned __int8 sub_1000097DC(id a1)
{
  return ((uint64_t (*)(id))_AXSHoverTextEnabled)(a1);
}

unsigned __int8 sub_100009808(id a1)
{
  return ((uint64_t (*)(id))_AXSClosedCaptionsEnabled)(a1);
}

BOOL sub_100009834(id a1)
{
  id v2 = (id)MAAudibleMediaPrefCopyPreferDescriptiveVideo();
  unsigned __int8 v3 = [v2 BOOLValue];

  return v3 & 1;
}

unsigned __int8 sub_100009894(id a1)
{
  return ((uint64_t (*)(id))_AXSAssistiveTouchScannerEnabled)(a1);
}

unsigned __int8 sub_1000098C0(id a1)
{
  return MADisplayFilterPrefGetCategoryEnabled(1LL);
}

unsigned __int8 sub_1000098F0(id a1)
{
  return MADisplayFilterPrefGetCategoryEnabled(2LL);
}

unsigned __int8 sub_100009920(id a1)
{
  return MADisplayFilterPrefGetCategoryEnabled(3LL);
}

unsigned __int8 sub_100009950(id a1)
{
  return ((uint64_t (*)(id))_AXSPhotosensitiveMitigationEnabled)(a1);
}

double sub_10000AD54(double a1, double a2)
{
  return fmin(a1, a2);
}

BOOL sub_10000B408(id a1, UIPress *a2)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  BOOL v3 = [location[0] type] == (id)4;
  objc_storeStrong(location, 0LL);
  return v3;
}

void sub_10000C2A8(id *a1)
{
  v16[2] = a1;
  v16[1] = a1;
  id v1 = [a1[4] tintableLayers];
  v10[1] = _NSConcreteStackBlock;
  int v11 = -1073741824;
  int v12 = 0;
  id v13 = sub_10000C464;
  id v14 = &unk_1001B6080;
  id v15 = a1[5];
  v16[0] = a1[6];
  objc_msgSend(v1, "enumerateObjectsUsingBlock:");

  id v3 = [a1[4] tintableViews];
  id v4 = _NSConcreteStackBlock;
  int v5 = -1073741824;
  int v6 = 0;
  id v7 = sub_10000C560;
  id v8 = &unk_1001B60A8;
  id v9 = a1[5];
  v10[0] = a1[6];
  objc_msgSend(v3, "enumerateObjectsUsingBlock:");

  objc_storeStrong(v10, 0LL);
  objc_storeStrong(&v9, 0LL);
  objc_storeStrong(v16, 0LL);
  objc_storeStrong(&v15, 0LL);
}

void sub_10000C464(uint64_t a1, void *a2)
{
  location[1] = (id)a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  id v4 = location[0];
  uint64_t v2 = objc_opt_class(&OBJC_CLASS___CAShapeLayer);
  if ((objc_opt_isKindOfClass(v4, v2) & 1) != 0) {
    objc_msgSend(location[0], "setFillColor:", objc_msgSend(*(id *)(a1 + 32), "CGColor"));
  }
  else {
    objc_msgSend(location[0], "setBackgroundColor:", objc_msgSend(*(id *)(a1 + 32), "CGColor"));
  }
  [location[0] setCompositingFilter:*(void *)(a1 + 40)];
  objc_storeStrong(location, 0LL);
}

void sub_10000C560(void *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  [location[0] setTintColor:a1[4]];
  id v3 = [location[0] layer];
  [v3 setCompositingFilter:a1[5]];

  objc_storeStrong(location, 0LL);
}

id sub_10000CC14(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "requesterIdentifier", a1, a1);
}

id sub_10000CC44(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "requestIdentifier", a1, a1);
}

id sub_10000CC74(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "uniquePresentableIdentifier", a1, a1);
}

void sub_10000CF88(id *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  id WeakRetained = objc_loadWeakRetained(a1 + 4);
  [WeakRetained loadConfigurations];

  objc_storeStrong(location, 0LL);
}

void sub_10000D108( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, int a15, int a16, _Unwind_Exception *exception_object, char a18, uint64_t a19, uint64_t a20, uint64_t a21, id a22)
{
}

void sub_10000D134(id *a1, void *a2, void *a3)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  id v7 = 0LL;
  objc_storeStrong(&v7, a3);
  oslog[1] = (os_log_t)a1;
  if (v7)
  {
    oslog[0] = (os_log_t)VPNControllerLog();
    if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_ERROR))
    {
      sub_10000D28C((uint64_t)v9, (uint64_t)v7);
      _os_log_error_impl( (void *)&_mh_execute_header,  oslog[0],  OS_LOG_TYPE_ERROR,  "Failed to load VPN configurations with error %@",  v9,  0xCu);
    }

    objc_storeStrong((id *)oslog, 0LL);
  }

  else
  {
    id WeakRetained = objc_loadWeakRetained(a1 + 4);
    [WeakRetained _updateConfigurationsWithNEConfigurations:location[0]];
  }

  objc_storeStrong(&v7, 0LL);
  objc_storeStrong(location, 0LL);
}

uint64_t sub_10000D28C(uint64_t result, uint64_t a2)
{
  *(_BYTE *)result = 2;
  *(_BYTE *)(result + 1) = 1;
  *(_BYTE *)(result + 2) = 64;
  *(_BYTE *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  return result;
}

void sub_10000D3DC( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, int a17, int a18, _Unwind_Exception *exception_object, char a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, id a25)
{
}

void sub_10000D408(uint64_t a1, void *a2)
{
  location[1] = (id)a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  oslog[1] = (os_log_t)a1;
  if (location[0])
  {
    oslog[0] = (os_log_t)VPNControllerLog();
    if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_ERROR))
    {
      sub_10000D540((uint64_t)v6, *(void *)(a1 + 32), (uint64_t)location[0]);
      _os_log_error_impl( (void *)&_mh_execute_header,  oslog[0],  OS_LOG_TYPE_ERROR,  "Failed to save VPN configuration %@ with error %@",  v6,  0x16u);
    }

    objc_storeStrong((id *)oslog, 0LL);
  }

  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    [WeakRetained loadConfigurations];
  }

  objc_storeStrong(location, 0LL);
}

uint64_t sub_10000D540(uint64_t result, uint64_t a2, uint64_t a3)
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

void sub_10000E028(id *a1)
{
  id location[2] = a1;
  location[1] = a1;
  objc_initWeak(location, a1[4]);
  uint64_t v2 = (void *)*((void *)a1[4] + 6);
  id v3 = _NSConcreteStackBlock;
  int v4 = -1073741824;
  int v5 = 0;
  int v6 = sub_10000E138;
  id v7 = &unk_1001B6198;
  objc_copyWeak(&v9, location);
  id v8 = a1[5];
  [v2 enumerateObserversUsingBlock:&v3];
  objc_storeStrong(&v8, 0LL);
  objc_destroyWeak(&v9);
  objc_destroyWeak(location);
}

void sub_10000E10C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, int a16, int a17, _Unwind_Exception *exception_object, char a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, id a24)
{
}

void sub_10000E138(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  location[1] = (id)a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  id v11 = 0LL;
  objc_storeStrong(&v11, a3);
  id v10 = 0LL;
  objc_storeStrong(&v10, a4);
  v9[2] = a5;
  v9[1] = (id)a1;
  v9[0] = objc_loadWeakRetained((id *)(a1 + 40));
  [location[0] vpnController:v9[0] didUpdateConfigurations:*(void *)(a1 + 32)];
  objc_storeStrong(v9, 0LL);
  objc_storeStrong(&v10, 0LL);
  objc_storeStrong(&v11, 0LL);
  objc_storeStrong(location, 0LL);
}

UIColor *__cdecl sub_10000EF6C(id a1, UITraitCollection *a2)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  char v6 = 0;
  char v4 = 0;
  if ([location[0] userInterfaceStyle] == (id)2)
  {
    id v7 =  +[TVSPConstants defaultDarkModeDetailTextColor]( &OBJC_CLASS___TVSPConstants,  "defaultDarkModeDetailTextColor");
    char v6 = 1;
    id v2 = v7;
  }

  else
  {
    id v5 =  +[TVSPConstants defaultLightModeDetailTextColor]( &OBJC_CLASS___TVSPConstants,  "defaultLightModeDetailTextColor");
    char v4 = 1;
    id v2 = v5;
  }

  id v9 = v2;
  if ((v4 & 1) != 0) {

  }
  if ((v6 & 1) != 0) {
  objc_storeStrong(location, 0LL);
  }
  return (UIColor *)v9;
}

void sub_10001044C(id *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  v7[1] = a1;
  [a1[4] dismissSystemMenuWithSourceIdentifier:@"decline"];
  v7[0] = FaceTimeControllerLog();
  char v6 = 1;
  if (os_log_type_enabled((os_log_t)v7[0], OS_LOG_TYPE_INFO))
  {
    log = (os_log_s *)v7[0];
    os_log_type_t type = v6;
    sub_100010524(v5);
    _os_log_impl((void *)&_mh_execute_header, log, type, "Decline Completion", v5, 2u);
  }

  objc_storeStrong(v7, 0LL);
  objc_storeStrong(location, 0LL);
}

_BYTE *sub_100010524(_BYTE *result)
{
  *result = 0;
  result[1] = 0;
  return result;
}

void sub_100010780(id *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  v7[1] = a1;
  [a1[4] dismissSystemMenuWithSourceIdentifier:@"accept"];
  v7[0] = FaceTimeControllerLog();
  char v6 = 1;
  if (os_log_type_enabled((os_log_t)v7[0], OS_LOG_TYPE_INFO))
  {
    log = (os_log_s *)v7[0];
    os_log_type_t type = v6;
    sub_100010524(v5);
    _os_log_impl((void *)&_mh_execute_header, log, type, "Accept Completion", v5, 2u);
  }

  objc_storeStrong(v7, 0LL);
  objc_storeStrong(location, 0LL);
}

void sub_100010AF0( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, int a19, int a20, _Unwind_Exception *exception_object, char a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, id a27)
{
}

void sub_100010B1C(id *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  v11[1] = a1;
  queue = &_dispatch_main_q;
  char v4 = _NSConcreteStackBlock;
  int v5 = -1073741824;
  int v6 = 0;
  id v7 = sub_100010C38;
  id v8 = &unk_1001B6298;
  objc_copyWeak(v11, a1 + 5);
  id v9 = a1[4];
  id v10 = location[0];
  dispatch_async(queue, &v4);

  objc_storeStrong(&v10, 0LL);
  objc_storeStrong(&v9, 0LL);
  objc_destroyWeak(v11);
  objc_storeStrong(location, 0LL);
}

void sub_100010C38(uint64_t a1)
{
  id location[2] = (id)a1;
  location[1] = (id)a1;
  location[0] = objc_loadWeakRetained((id *)(a1 + 48));
  char v7 = 0;
  char v5 = 0;
  char v3 = 0;
  unsigned __int8 v2 = 0;
  if (location[0])
  {
    id v8 = [location[0] incomingCallInfo];
    char v7 = 1;
    id v6 = [v8 conversation];
    char v5 = 1;
    id v4 = [v6 remoteMemberContactIdentifiers];
    char v3 = 1;
    unsigned __int8 v2 = [v4 isEqual:*(void *)(a1 + 32)];
  }

  if ((v3 & 1) != 0) {

  }
  if ((v5 & 1) != 0) {
  if ((v7 & 1) != 0)
  }

  if ((v2 & 1) != 0) {
    [location[0] setIncomingSnowglobeImage:*(void *)(a1 + 40)];
  }
  objc_storeStrong(location, 0LL);
}

void sub_100011908()
{
}

id sub_100011918(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = [WeakRetained stateDumpBuilder];
  id v4 = [v2 build];

  return v4;
}

void sub_100011EB0(void *a1, void *a2, void *a3, void *a4)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  id v8 = 0LL;
  objc_storeStrong(&v8, a3);
  id v7 = 0LL;
  objc_storeStrong(&v7, a4);
  if ((objc_opt_respondsToSelector(location[0], "menuModeStateProviderDidChange:") & 1) != 0) {
    [location[0] menuModeStateProviderDidChange:a1[4]];
  }
  objc_storeStrong(&v7, 0LL);
  objc_storeStrong(&v8, 0LL);
  objc_storeStrong(location, 0LL);
}

void sub_1000124D8(_BYTE *a1)
{
  id v6 = a1;
  if (a1)
  {
    if ((v6[8] & 1) != 0)
    {
      v6[9] = 1;
    }

    else
    {
      id v1 = [v6 provider];
      id v5 = [v1 state];

      unint64_t v4 = +[TVSSMenuModeController _modeFromState:](&OBJC_CLASS___TVSSMenuModeController, "_modeFromState:", v5);
      id v2 = (id *)v6;
      id v3 = [v5 bannerContext];
      sub_100012778(v2, v4, v3);

      objc_storeStrong(&v5, 0LL);
    }
  }

void sub_100012778(id *a1, unint64_t a2, id obj)
{
  v32 = a1;
  id v31 = (id)a2;
  id location = 0LL;
  objc_storeStrong(&location, obj);
  if (v32)
  {
    if (v32[3] == v31 && (BSEqualObjects(v32[4], location) & 1) != 0)
    {
      int v29 = 1;
    }

    else
    {
      id v28 = v32[3];
      id v27 = 0LL;
      if (v32[3] == v31 || (BSEqualObjects(v32[4], location) & 1) != 0)
      {
        if (v32[3] == v31)
        {
          if ((BSEqualObjects(v32[4], location) & 1) == 0)
          {
            os_log_t oslog = (os_log_t)MenuModeControllerLog();
            os_log_type_t v17 = OS_LOG_TYPE_DEFAULT;
            if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
            {
              id v3 = oslog;
              os_log_type_t v4 = v17;
              id v5 = TVSSMenuModeDescription((unint64_t)v32[3]);
              id v16 = v5;
              sub_100012D20((uint64_t)v33, (uint64_t)v16, (uint64_t)v32[4], (uint64_t)location);
              _os_log_impl( (void *)&_mh_execute_header,  v3,  v4,  "Banner context state changed. {Current Mode: '%@', Banner context change: '%{public}@' -> '%{public}@'}",  v33,  0x20u);

              objc_storeStrong(&v16, 0LL);
            }

            objc_storeStrong((id *)&oslog, 0LL);
            objc_storeStrong(&v27, v32[4]);
            objc_storeStrong(v32 + 4, location);
          }
        }

        else
        {
          id v22 = MenuModeControllerLog();
          os_log_type_t v21 = OS_LOG_TYPE_DEFAULT;
          if (os_log_type_enabled((os_log_t)v22, OS_LOG_TYPE_DEFAULT))
          {
            id v7 = (os_log_s *)v22;
            os_log_type_t v8 = v21;
            id v10 = TVSSMenuModeDescription((unint64_t)v32[3]);
            id v6 = v10;
            id v20 = v6;
            id v9 = TVSSMenuModeDescription((unint64_t)v31);
            id v19 = v9;
            sub_100012CB4((uint64_t)v34, (uint64_t)v6, (uint64_t)v19, (uint64_t)v32[4]);
            _os_log_impl( (void *)&_mh_execute_header,  v7,  v8,  "Menu mode state changed. {Mode change: '%@' -> '%@', Current banner context: '%{public}@'}",  v34,  0x20u);

            objc_storeStrong(&v19, 0LL);
            objc_storeStrong(&v20, 0LL);
          }

          objc_storeStrong(&v22, 0LL);
          v32[3] = v31;
        }
      }

      else
      {
        id v26 = MenuModeControllerLog();
        os_log_type_t v25 = OS_LOG_TYPE_DEFAULT;
        if (os_log_type_enabled((os_log_t)v26, OS_LOG_TYPE_DEFAULT))
        {
          log = (os_log_s *)v26;
          os_log_type_t type = v25;
          id v15 = TVSSMenuModeDescription((unint64_t)v32[3]);
          id v11 = v15;
          id v24 = v11;
          id v14 = TVSSMenuModeDescription((unint64_t)v31);
          id v23 = v14;
          sub_100012C34((uint64_t)v35, (uint64_t)v11, (uint64_t)v23, (uint64_t)v32[4], (uint64_t)location);
          _os_log_impl( (void *)&_mh_execute_header,  log,  type,  "Menu mode and banner context state changed. {Mode change: '%@' -> '%@', Banner context change: '%{public}@' -> '%{public}@'}",  v35,  0x2Au);

          objc_storeStrong(&v23, 0LL);
          objc_storeStrong(&v24, 0LL);
        }

        objc_storeStrong(&v26, 0LL);
        v32[3] = v31;
        objc_storeStrong(&v27, v32[4]);
        objc_storeStrong(v32 + 4, location);
      }

      sub_100012D8C(v32, (uint64_t)v28, v27);
      objc_storeStrong(&v27, 0LL);
      int v29 = 0;
    }
  }

  else
  {
    int v29 = 1;
  }

  objc_storeStrong(&location, 0LL);
}

uint64_t sub_100012C34(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  *(_BYTE *)result = 2;
  *(_BYTE *)(result + 1) = 4;
  *(_BYTE *)(result + 2) = 64;
  *(_BYTE *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 64;
  *(_BYTE *)(result + 13) = 8;
  *(void *)(result + 14) = a3;
  *(_BYTE *)(result + 22) = 66;
  *(_BYTE *)(result + 23) = 8;
  *(void *)(result + 24) = a4;
  *(_BYTE *)(result + 32) = 66;
  *(_BYTE *)(result + 33) = 8;
  *(void *)(result + 34) = a5;
  return result;
}

uint64_t sub_100012CB4(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(_BYTE *)result = 2;
  *(_BYTE *)(result + 1) = 3;
  *(_BYTE *)(result + 2) = 64;
  *(_BYTE *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 64;
  *(_BYTE *)(result + 13) = 8;
  *(void *)(result + 14) = a3;
  *(_BYTE *)(result + 22) = 66;
  *(_BYTE *)(result + 23) = 8;
  *(void *)(result + 24) = a4;
  return result;
}

uint64_t sub_100012D20(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(_BYTE *)result = 2;
  *(_BYTE *)(result + 1) = 3;
  *(_BYTE *)(result + 2) = 64;
  *(_BYTE *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 66;
  *(_BYTE *)(result + 13) = 8;
  *(void *)(result + 14) = a3;
  *(_BYTE *)(result + 22) = 66;
  *(_BYTE *)(result + 23) = 8;
  *(void *)(result + 24) = a4;
  return result;
}

void sub_100012D8C(void *a1, uint64_t a2, id obj)
{
  id v18 = a1;
  uint64_t v17 = a2;
  id location = 0LL;
  objc_storeStrong(&location, obj);
  if (v18)
  {
    id v14 = objc_alloc_init(&OBJC_CLASS____TVSSMenuModeControllerTransitionContext);
    [v14 setPreviousMenuMode:v17];
    [v14 setPreviousBannerContext:location];
    if (*((void *)v18 + 3) == 3LL)
    {
      id v4 = [v18 provider];
      id v13 = [v4 state];

      id v12 = [v13 interactionRequestReason];
      [v14 setInteractivePresentationReason:v12];
      objc_storeStrong(&v12, 0LL);
      objc_storeStrong(&v13, 0LL);
    }

    *((_BYTE *)v18 + 8) = 1;
    id v3 = [v18 observers];
    id v5 = _NSConcreteStackBlock;
    int v6 = -1073741824;
    int v7 = 0;
    os_log_type_t v8 = sub_100012FC8;
    id v9 = &unk_1001B6410;
    id v10 = v18;
    id v11 = v14;
    [v3 enumerateObserversUsingBlock:&v5];

    *((_BYTE *)v18 + 8) = 0;
    if ((*((_BYTE *)v18 + 9) & 1) != 0)
    {
      *((_BYTE *)v18 + 9) = 0;
      sub_1000124D8(v18);
    }

    objc_storeStrong(&v11, 0LL);
    objc_storeStrong(&v10, 0LL);
    objc_storeStrong(&v14, 0LL);
    int v15 = 0;
  }

  else
  {
    int v15 = 1;
  }

  objc_storeStrong(&location, 0LL);
}

void sub_100012FC8(void *a1, void *a2, void *a3, void *a4)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  id v8 = 0LL;
  objc_storeStrong(&v8, a3);
  id v7 = 0LL;
  objc_storeStrong(&v7, a4);
  [location[0] menuModeControllerModeDidChange:a1[4] withTransitionContext:a1[5]];
  objc_storeStrong(&v7, 0LL);
  objc_storeStrong(&v8, 0LL);
  objc_storeStrong(location, 0LL);
}

uint64_t sub_10001319C(uint64_t a1, void *a2)
{
  uint64_t v8 = a1;
  id location = 0LL;
  objc_storeStrong(&location, a2);
  uint64_t v8 = objc_opt_self(v8);
  if ([location isDictating])
  {
    char v9 = 0;
  }

  else
  {
    char v5 = 0;
    char v4 = 0;
    if ([location systemGestureRequestedFocus])
    {
      uint64_t v3 = v8;
      id v6 = [location bannerContext];
      char v5 = 1;
      char v4 = sub_1000137BC(v3, v6);
    }

    char v9 = v4 & 1;
    if ((v5 & 1) != 0) {
  }
    }

  objc_storeStrong(&location, 0LL);
  return v9 & 1;
}

BOOL sub_1000132BC(uint64_t a1, void *a2)
{
  uint64_t v7 = a1;
  id location = 0LL;
  objc_storeStrong(&location, a2);
  uint64_t v7 = objc_opt_self(v7);
  id v3 = [location bannerContext];
  id v4 = [v3 bannerPresentationState];

  BOOL v5 = 0;
  if (v4) {
    BOOL v5 = v4 != (id)3;
  }
  objc_storeStrong(&location, 0LL);
  return v5;
}

uint64_t sub_100013374(uint64_t a1, void *a2)
{
  uint64_t v4 = a1;
  id location = 0LL;
  objc_storeStrong(&location, a2);
  uint64_t v4 = objc_opt_self(v4);
  if ((TVSSDebugPassiveModeAlwaysEnabled() & 1) != 0)
  {
    char v5 = 1;
  }

  else if ([location isDictating])
  {
    char v5 = 0;
  }

  else if ([location isSplitViewVisible])
  {
    char v5 = 0;
  }

  else if ([location siriPresentationVisibility] == (id)2)
  {
    char v5 = 0;
  }

  else
  {
    char v5 = [location headboardRequestedVisibility] & 1;
  }

  objc_storeStrong(&location, 0LL);
  return v5 & 1;
}

uint64_t sub_10001349C(uint64_t a1, void *a2)
{
  uint64_t v13 = a1;
  id location = 0LL;
  objc_storeStrong(&location, a2);
  uint64_t v13 = objc_opt_self(v13);
  if ([location siriPresentationVisibility] == (id)2)
  {
    char v14 = 0;
    int v11 = 1;
  }

  else if ([location isDictating])
  {
    char v14 = 0;
    int v11 = 1;
  }

  else
  {
    char v10 = 0;
    if ([location isFaceTimeActive])
    {
      if ([location playbackControlsState]) {
        char v10 = [location playbackControlsState] == (id)2;
      }
      else {
        char v10 = [location hasUserAttention] & 1;
      }
    }

    if (!([location isSplitViewVisible] & 1))
    {
      id v7 = [location keyboardFocusedElement];
      id v3 = [v7 bundleIdentifier];
      unsigned __int8 v4 = [v3 isEqualToString:@"com.apple.facetime"];

      id v5 = [v7 identifier];
      unsigned __int8 v6 = [v5 isEqualToString:PBSDisplayLayoutElementPictureInPictureIdentifier];

      if ((v4 & 1) != 0 && (v6 & 1) == 0) {
        char v10 = 0;
      }
      objc_storeStrong(&v7, 0LL);
    }

    char v14 = v10 & 1;
    int v11 = 1;
  }

  objc_storeStrong(&location, 0LL);
  return v14 & 1;
}

uint64_t sub_1000136EC(uint64_t a1, void *a2)
{
  uint64_t v8 = a1;
  id location = 0LL;
  objc_storeStrong(&location, a2);
  uint64_t v8 = objc_opt_self(v8);
  char v6 = [location isMicInUse] & 1;
  char v5 = [location isCameraInUse] & 1;
  char v4 = [location isLocationInUse] & 1;
  char v3 = 1;
  if ((v6 & 1) == 0)
  {
    char v3 = 1;
    if ((v5 & 1) == 0) {
      char v3 = v4;
    }
  }

  objc_storeStrong(&location, 0LL);
  return v3 & 1;
}

uint64_t sub_1000137BC(uint64_t a1, void *a2)
{
  uint64_t v5 = a1;
  id location = 0LL;
  objc_storeStrong(&location, a2);
  uint64_t v5 = objc_opt_self(v5);
  unsigned __int8 v3 = 1;
  if ([location bannerPresentationState]) {
    unsigned __int8 v3 = [location supportsInteractiveMode];
  }
  objc_storeStrong(&location, 0LL);
  return v3 & 1;
}

id sub_100013EEC(void *a1, uint64_t a2)
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

void sub_1000142E4(uint64_t a1)
{
  id v1 = [objc_alloc(*(Class *)(a1 + 32)) _init];
  id v2 = (void *)qword_1002218F0;
  qword_1002218F0 = (uint64_t)v1;
}

uint64_t sub_100014A50(uint64_t result, uint64_t a2)
{
  *(_BYTE *)result = 2;
  *(_BYTE *)(result + 1) = 1;
  *(_BYTE *)(result + 2) = 32;
  *(_BYTE *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  return result;
}

void sub_1000150BC( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, int a14, int a15, _Unwind_Exception *exception_object, char a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, id a22)
{
}

void sub_1000150E8(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _update];
}

void sub_100015BA8()
{
}

uint64_t sub_100015BB8(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  *(_BYTE *)result = 2;
  *(_BYTE *)(result + 1) = 4;
  *(_BYTE *)(result + 2) = 32;
  *(_BYTE *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 66;
  *(_BYTE *)(result + 13) = 8;
  *(void *)(result + 14) = a3;
  *(_BYTE *)(result + 22) = 66;
  *(_BYTE *)(result + 23) = 8;
  *(void *)(result + 24) = a4;
  *(_BYTE *)(result + 32) = 64;
  *(_BYTE *)(result + 33) = 8;
  *(void *)(result + 34) = a5;
  return result;
}

uint64_t sub_100015C3C(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  *(_BYTE *)result = 2;
  *(_BYTE *)(result + 1) = 4;
  *(_BYTE *)(result + 2) = 32;
  *(_BYTE *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 66;
  *(_BYTE *)(result + 13) = 8;
  *(void *)(result + 14) = a3;
  *(_BYTE *)(result + 22) = 66;
  *(_BYTE *)(result + 23) = 8;
  *(void *)(result + 24) = a4;
  *(_BYTE *)(result + 32) = 66;
  *(_BYTE *)(result + 33) = 8;
  *(void *)(result + 34) = a5;
  return result;
}

void sub_100015CBC(id *a1, void *a2, void *a3)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  id v16 = 0LL;
  objc_storeStrong(&v16, a3);
  v15[1] = a1;
  queue = &_dispatch_main_q;
  id v6 = _NSConcreteStackBlock;
  int v7 = -1073741824;
  int v8 = 0;
  char v9 = sub_100015E4C;
  char v10 = &unk_1001B6480;
  objc_copyWeak(v15, a1 + 6);
  id v11 = a1[4];
  id v12 = location[0];
  id v13 = v16;
  id v14 = a1[5];
  dispatch_async(queue, &v6);

  objc_storeStrong(&v14, 0LL);
  objc_storeStrong(&v13, 0LL);
  objc_storeStrong(&v12, 0LL);
  objc_storeStrong(&v11, 0LL);
  objc_destroyWeak(v15);
  objc_storeStrong(&v16, 0LL);
  objc_storeStrong(location, 0LL);
}

void sub_100015E4C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  [WeakRetained _mediaRemoteNowPlayingRequestDidCompleteWithIdentifier:*(void *)(a1 + 32) mediaRemoteResponse:*(void *)(a1 + 40) error:*(void *)(a1 + 48) playerResponse:*(void *)(a1 + 56)];
}

uint64_t sub_100016194(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(_BYTE *)result = 2;
  *(_BYTE *)(result + 1) = 3;
  *(_BYTE *)(result + 2) = 32;
  *(_BYTE *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 66;
  *(_BYTE *)(result + 13) = 8;
  *(void *)(result + 14) = a3;
  *(_BYTE *)(result + 22) = 66;
  *(_BYTE *)(result + 23) = 8;
  *(void *)(result + 24) = a4;
  return result;
}

uint64_t sub_100016200(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(_BYTE *)result = 2;
  *(_BYTE *)(result + 1) = 2;
  *(_BYTE *)(result + 2) = 32;
  *(_BYTE *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 66;
  *(_BYTE *)(result + 13) = 8;
  *(void *)(result + 14) = a3;
  return result;
}

LABEL_12:
  v30 = 1;
  if ([v32 hasMediaSubType])
  {
    int v15 = [v32 mediaSubType];
    if ((unint64_t)v15 <= 7) {
      __asm { BR              X8 }
    }
  }

  else
  {
    v30 = v31;
  }

  int v29 = NowPlayingControllerLog();
  id v28 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v29, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = (os_log_s *)v29;
    id v12 = v28;
    uint64_t v5 = "";
    if ((v30 & 1) == 0) {
      uint64_t v5 = "*not* ";
    }
    int v8 = (uint64_t)v5;
    id v6 = "update";
    if ((v30 & 1) == 0) {
      id v6 = "reset";
    }
    char v9 = (uint64_t)v6;
    id v14 = sub_100016884((uint64_t)[v32 mediaType]);
    char v10 = v14;
    id v27 = v10;
    id v13 = sub_100016934((unint64_t)[v32 mediaSubType]);
    id v26 = v13;
    sub_100016A5C( (uint64_t)v45,  (uint64_t)"-[TVSSAudioNowPlayingController _handleMediaRemoteNowPlayingPlayerResponse:playerResponse:]",  v8,  v9,  (uint64_t)v10,  (uint64_t)v26);
    _os_log_impl( (void *)&_mh_execute_header,  v11,  v12,  "%s: Now playing item has been confirmed as %s'audio-only'. Will %s now playing state. mediaType=%{public}@, mediaS ubType=%{public}@",  v45,  0x34u);

    objc_storeStrong((id *)&v26, 0LL);
    objc_storeStrong((id *)&v27, 0LL);
  }

  objc_storeStrong(&v29, 0LL);
  if ((v30 & 1) != 0)
  {
    int v7 = 0;
    -[TVSSNowPlayingState _updateWithPlayerResponse:playerResponseItem:isPodcast:]( v44->_nowPlayingState,  "_updateWithPlayerResponse:playerResponseItem:isPodcast:",  v42,  v38,  v7);
  }

  else
  {
    -[TVSSNowPlayingState _updateWithPlayerResponse:playerResponseItem:isPodcast:]( v44->_nowPlayingState,  "_updateWithPlayerResponse:playerResponseItem:isPodcast:",  0LL,  0LL,  0LL);
  }

  objc_storeStrong(&v32, 0LL);
  v33 = 0;
LABEL_29:
  objc_storeStrong(&v38, 0LL);
  objc_storeStrong(&v39, 0LL);
  objc_storeStrong(&v40, 0LL);
  objc_storeStrong(&v41, 0LL);
  objc_storeStrong(&v42, 0LL);
  objc_storeStrong(location, 0LL);
}

  objc_storeStrong(location, 0LL);
}

__CFString *sub_100016884(uint64_t a1)
{
  switch(a1)
  {
    case 0LL:
      return @"None";
    case 1LL:
      return @"Audio";
    case 2LL:
      return @"Video";
  }

  return @"Unknown";
}

__CFString *sub_100016934(unint64_t a1)
{
  if (a1 <= 7) {
    __asm { BR              X8 }
  }

  return @"Unknown";
}

uint64_t sub_100016A5C(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  *(_BYTE *)result = 2;
  *(_BYTE *)(result + 1) = 5;
  *(_BYTE *)(result + 2) = 32;
  *(_BYTE *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 32;
  *(_BYTE *)(result + 13) = 8;
  *(void *)(result + 14) = a3;
  *(_BYTE *)(result + 22) = 32;
  *(_BYTE *)(result + 23) = 8;
  *(void *)(result + 24) = a4;
  *(_BYTE *)(result + 32) = 66;
  *(_BYTE *)(result + 33) = 8;
  *(void *)(result + 34) = a5;
  *(_BYTE *)(result + 42) = 66;
  *(_BYTE *)(result + 43) = 8;
  *(void *)(result + 44) = a6;
  return result;
}

id sub_10001712C(uint64_t a1)
{
  return objc_alloc_init(*(Class *)(a1 + 32));
}

void sub_100017F90(uint64_t a1, void *a2)
{
  location[1] = (id)a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  id v19 = (CGContext *)[location[0] CGContext];
  id v11 = [location[0] format];
  [v11 bounds];
  v18.origin.x = v2;
  v18.origin.y = v3;
  v18.size.width = v4;
  v18.size.height = v5;

  CGRect v17 = CGRectInset(v18, *(CGFloat *)(a1 + 40), *(CGFloat *)(a1 + 40));
  CGContextSetLineWidth(v19, *(CGFloat *)(a1 + 48));
  CGContextSetLineCap(v19, kCGLineCapRound);
  id v16 = (const CGPath *)objc_msgSend( *(id *)(a1 + 56),  "circlePathForBounds:timerSize:",  *(void *)(a1 + 64),  v17.origin.x,  v17.origin.y,  v17.size.width,  v17.size.height);
  CGContextSetGrayStrokeColor(v19, 0.0, 0.3);
  CGContextAddPath(v19, v16);
  CGContextStrokePath(v19);
  int v15 = (const CGPath *)objc_msgSend( *(id *)(a1 + 56),  "arcPathForBounds:percentComplete:timerSize:",  *(void *)(a1 + 64),  v17.origin.x,  v17.origin.y,  v17.size.width,  v17.size.height,  0.0611111111);
  CGContextSetGrayStrokeColor(v19, 0.0, 1.0);
  CGContextAddPath(v19, v15);
  CGContextStrokePath(v19);
  CGFloat tx = CGRectGetMidX(v18);
  CGFloat MidY = CGRectGetMidY(v18);
  CGContextTranslateCTM(v19, tx, MidY);
  CGContextRotateCTM(v19, 5.89921287);
  id v14 = *(void **)(a1 + 32);
  CGRectGetWidth(v17);
  CGRectGetHeight(v17);
  CGRectGetWidth(v17);
  CGRectGetHeight(v17);
  sub_100018238();
  objc_msgSend(v14, "drawInRect:", v7, v8, v9, v10);
  objc_storeStrong(location, 0LL);
}

  ;
}

void sub_10001A7F8(uint64_t a1)
{
  id v1 = objc_alloc_init((Class)objc_opt_class(*(void *)(a1 + 32)));
  CGFloat v2 = (void *)qword_100221900;
  qword_100221900 = (uint64_t)v1;
}

void sub_10001AC0C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, _Unwind_Exception *exception_object, uint64_t a10, uint64_t a11, id *location, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, int a17, int a18, uint64_t a19)
{
}

uint64_t sub_10001AC54(uint64_t result, uint64_t a2)
{
  *(_BYTE *)result = 0;
  *(_BYTE *)(result + 1) = 1;
  *(_BYTE *)(result + 2) = 0;
  *(_BYTE *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  return result;
}

void sub_10001AC8C(id *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  v6[1] = a1;
  if (location[0])
  {
    os_log_t oslog = (os_log_t)VideoMicBackingStoreLog();
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
    {
      sub_10001AEB8((uint64_t)v8, (uint64_t)location[0]);
      _os_log_error_impl( (void *)&_mh_execute_header,  oslog,  OS_LOG_TYPE_ERROR,  "Failed to start continuity camera discovery: %{public}@",  v8,  0xCu);
    }

    objc_storeStrong((id *)&oslog, 0LL);
  }

  else
  {
    v6[0] = objc_loadWeakRetained(a1 + 4);
    id v2 = [v6[0] remoteDisplayDiscovery];
    [v2 setDeviceFoundHandler:&stru_1001B6538];

    id v3 = [v6[0] remoteDisplayDiscovery];
    [v3 setDeviceLostHandler:&stru_1001B6558];

    objc_storeStrong(v6, 0LL);
  }

  objc_storeStrong(location, 0LL);
}

void sub_10001AE20(id a1, RPRemoteDisplayDevice *a2)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  objc_storeStrong(location, 0LL);
}

void sub_10001AE6C(id a1, RPRemoteDisplayDevice *a2)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  objc_storeStrong(location, 0LL);
}

uint64_t sub_10001AEB8(uint64_t result, uint64_t a2)
{
  *(_BYTE *)result = 2;
  *(_BYTE *)(result + 1) = 1;
  *(_BYTE *)(result + 2) = 66;
  *(_BYTE *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  return result;
}

void sub_10001B430(void *a1, void *a2, void *a3, void *a4)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  id v11 = 0LL;
  objc_storeStrong(&v11, a3);
  id v10 = 0LL;
  objc_storeStrong(&v10, a4);
  id v4 = [location[0] onContinuityCameraConnectionChange];
  BOOL v9 = v4 == 0LL;

  if (!v9)
  {
    CGFloat v5 = (void (**)(id, void))[location[0] onContinuityCameraConnectionChange];
    v5[2](v5, a1[4]);
  }

  objc_storeStrong(&v10, 0LL);
  objc_storeStrong(&v11, 0LL);
  objc_storeStrong(location, 0LL);
}

MPAVOutputDeviceRoute *__cdecl sub_10001BA58(id a1, MRAVOutputDevice *a2)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  id v3 = objc_alloc(&OBJC_CLASS___MPAVOutputDeviceRoute);
  id v7 = location[0];
  id v4 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v7, 1LL);
  CGFloat v5 = -[MPAVOutputDeviceRoute initWithOutputDevices:](v3, "initWithOutputDevices:");

  objc_storeStrong(location, 0LL);
  return v5;
}

id sub_10001BF44(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "symbolName", a1, a1);
}

id TVSSMenuModeDescription(unint64_t a1)
{
  if (a1 <= 5) {
    __asm { BR              X8 }
  }

  return v2;
}

uint64_t TVSSMenuBarHasBackgroundForMode(uint64_t a1)
{
  if (!a1) {
    goto LABEL_6;
  }
  if ((unint64_t)(a1 - 1) <= 2)
  {
LABEL_5:
    char v2 = 1;
    return v2 & 1;
  }

  if (a1 == 4)
  {
LABEL_6:
    char v2 = 0;
    return v2 & 1;
  }

  if (a1 == 5) {
    goto LABEL_5;
  }
  return v2 & 1;
}

void sub_10001F388( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, int a15, int a16, _Unwind_Exception *exception_object, char a18, uint64_t a19, uint64_t a20, uint64_t a21, id a22)
{
}

void sub_10001F3B4(id *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  v7[1] = a1;
  v7[0] = objc_loadWeakRetained(a1 + 4);
  id v3 = [v7[0] cameraViewOne];
  [v3 refreshSnapshot];

  id v4 = [v7[0] cameraViewTwo];
  [v4 refreshSnapshot];

  id v5 = [v7[0] cameraViewThree];
  [v5 refreshSnapshot];

  id v6 = [v7[0] cameraViewFour];
  [v6 refreshSnapshot];

  objc_storeStrong(v7, 0LL);
  objc_storeStrong(location, 0LL);
}

TVSSDebugSystemMenuViewController *sub_10001FC84(Class *a1)
{
  v4[2] = a1;
  v4[1] = a1;
  v4[0] = objc_alloc_init(a1[4]);
  id v1 = objc_alloc(&OBJC_CLASS___TVSSDebugSystemMenuViewController);
  id v3 = -[TVSSDebugSystemMenuViewController initWithMenuItemProvider:](v1, "initWithMenuItemProvider:", v4[0]);
  objc_storeStrong(v4, 0LL);
  return v3;
}

void sub_100022BD8(id a1)
{
  id v1 = +[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults");
  -[NSUserDefaults registerDefaults:](v1, "registerDefaults:", &off_1001C84C0);
}

id TVSSPlabackStateDescription(unint64_t a1)
{
  if (a1 <= 5) {
    __asm { BR              X8 }
  }

  return v2;
}

uint64_t TVSSPlaybackStateFromMPCPlayerState(unint64_t a1)
{
  if (a1 <= 6) {
    __asm { BR              X8 }
  }

  return v2;
}

uint64_t MPCPlayerStateFromTVSSPlaybackState(unint64_t a1)
{
  if (a1 <= 5) {
    __asm { BR              X8 }
  }

  return v2;
}

uint64_t sub_100025AE4(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(_BYTE *)result = 2;
  *(_BYTE *)(result + 1) = 2;
  *(_BYTE *)(result + 2) = 32;
  *(_BYTE *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 64;
  *(_BYTE *)(result + 13) = 8;
  *(void *)(result + 14) = a3;
  return result;
}

uint64_t sub_100025B38(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(_BYTE *)result = 2;
  *(_BYTE *)(result + 1) = 3;
  *(_BYTE *)(result + 2) = 32;
  *(_BYTE *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 66;
  *(_BYTE *)(result + 13) = 8;
  *(void *)(result + 14) = a3;
  *(_BYTE *)(result + 22) = 64;
  *(_BYTE *)(result + 23) = 8;
  *(void *)(result + 24) = a4;
  return result;
}

void sub_100025BA8(void *a1, void *a2, void *a3, void *a4, void *a5)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  id v13 = 0LL;
  objc_storeStrong(&v13, a3);
  id v12 = 0LL;
  objc_storeStrong(&v12, a4);
  id v11[2] = a5;
  v11[1] = a1;
  id v10 = v12;
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___TVSSNowPlayingStateObserverUserInfo);
  v11[0] = sub_100025CA8(v10, v5);
  objc_storeStrong(v11, 0LL);
  objc_storeStrong(&v12, 0LL);
  objc_storeStrong(&v13, 0LL);
  objc_storeStrong(location, 0LL);
}

id sub_100025CA8(void *a1, uint64_t a2)
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

void sub_100025D68(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  location[1] = (id)a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  id v13 = 0LL;
  objc_storeStrong(&v13, a3);
  id v12 = 0LL;
  objc_storeStrong(&v12, a4);
  id v11[2] = a5;
  v11[1] = (id)a1;
  id v10 = v12;
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___TVSSNowPlayingStateObserverUserInfo);
  v11[0] = sub_100025CA8(v10, v5);
  objc_storeStrong(v11, 0LL);
  objc_storeStrong(&v12, 0LL);
  objc_storeStrong(&v13, 0LL);
  objc_storeStrong(location, 0LL);
}

void sub_100025E68(void *a1, void *a2, void *a3, void *a4, void *a5)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  id v13 = 0LL;
  objc_storeStrong(&v13, a3);
  id v12 = 0LL;
  objc_storeStrong(&v12, a4);
  id v11[2] = a5;
  v11[1] = a1;
  id v10 = v12;
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___TVSSNowPlayingStateObserverUserInfo);
  v11[0] = sub_100025CA8(v10, v5);
  objc_storeStrong(v11, 0LL);
  objc_storeStrong(&v12, 0LL);
  objc_storeStrong(&v13, 0LL);
  objc_storeStrong(location, 0LL);
}

void sub_100025F68(void *a1, void *a2, void *a3, void *a4, void *a5)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  id v13 = 0LL;
  objc_storeStrong(&v13, a3);
  id v12 = 0LL;
  objc_storeStrong(&v12, a4);
  id v11[2] = a5;
  v11[1] = a1;
  id v10 = v12;
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___TVSSNowPlayingStateObserverUserInfo);
  v11[0] = sub_100025CA8(v10, v5);
  objc_storeStrong(v11, 0LL);
  objc_storeStrong(&v12, 0LL);
  objc_storeStrong(&v13, 0LL);
  objc_storeStrong(location, 0LL);
}

void sub_100026BB8(id a1)
{
  os_log_t v1 = os_log_create("com.apple.TVSystemUIService.menuItemProvider", "Restrictions");
  id v2 = (void *)qword_100221928;
  qword_100221928 = (uint64_t)v1;
}

void sub_100026D74(id a1)
{
  id v1 = -[TVSSBluetoothControllerConfiguration _initWithName:]( objc_alloc(&OBJC_CLASS___TVSSBluetoothControllerConfiguration),  "_initWithName:",  @"GameControllers");
  id v2 = (void *)qword_100221938;
  qword_100221938 = (uint64_t)v1;
}

id sub_100027060(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "name", a1, a1);
}

void sub_100027CF8()
{
}

TVSSAudioRouteRenderer *sub_100027D08(id *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  v24[1] = a1;
  v24[0] = objc_loadWeakRetained(a1 + 4);
  for (char i = 1; (i & 1) != 0; char i = 0)
  {
    id v16 = [v24[0] routesByIdentifier];
    id v22 = [v16 objectForKeyedSubscript:location[0]];

    char v15 = 0;
    if (v22) {
      char v15 = i;
    }
    if ((v15 & 1) != 0)
    {
      id v26 =  +[TVSSAudioRouteRenderer rendererWithAudioRoute:]( &OBJC_CLASS___TVSSAudioRouteRenderer,  "rendererWithAudioRoute:",  v22);
      int v21 = 1;
    }

    else
    {
      int v21 = 5;
    }

    objc_storeStrong(&v22, 0LL);
    if (v21 != 5) {
      goto LABEL_19;
    }
  }

  id v20 = objc_msgSend(location[0], "substringFromIndex:", objc_msgSend(@"Volume-", "length"));
  id v11 = [v24[0] routesByIdentifier];
  id v19 = [v11 objectForKeyedSubscript:v20];

  id v13 = [v19 route];
  id v12 = [v13 volume];
  unsigned __int8 v14 = [v12 isVolumeControlAvailable];

  if ((v14 & 1) != 0)
  {
    id v8 = [v19 route];
    id v9 = [v8 volume];
    id v10 = [v9 volumeLevel];
    id v2 = v10 ? v10 : &off_1001C8948;
    id v18 = v2;

    id v4 = location[0];
    id v7 = +[TVSPIdentifiers percentageID](&OBJC_CLASS___TVSPIdentifiers, "percentageID");
    id v27 = v7;
    id v28 = v18;
    id v6 =  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v28,  &v27,  1LL);
    uint64_t v5 = +[TVSPContent contentWithDictionary:](&OBJC_CLASS___TVSPContent, "contentWithDictionary:");
    id v26 =  +[TVSSVolumeControlRenderer rendererWithIdentifier:format:content:]( &OBJC_CLASS___TVSSVolumeControlRenderer,  "rendererWithIdentifier:format:content:",  v4,  21LL);

    int v21 = 1;
    objc_storeStrong(&v18, 0LL);
  }

  else
  {
    int v21 = 0;
  }

  objc_storeStrong(&v19, 0LL);
  objc_storeStrong(&v20, 0LL);
  if (!v21)
  {
LABEL_18:
    id v26 = 0LL;
    int v21 = 1;
  }

LABEL_19:
  objc_storeStrong(v24, 0LL);
  objc_storeStrong(location, 0LL);
  return v26;
}

  objc_storeStrong(&v18, 0LL);
  objc_storeStrong(&v19, 0LL);
}

uint64_t sub_100028588(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(_BYTE *)result = 2;
  *(_BYTE *)(result + 1) = 3;
  *(_BYTE *)(result + 2) = 64;
  *(_BYTE *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 64;
  *(_BYTE *)(result + 13) = 8;
  *(void *)(result + 14) = a3;
  *(_BYTE *)(result + 22) = 64;
  *(_BYTE *)(result + 23) = 8;
  *(void *)(result + 24) = a4;
  return result;
}

id sub_10002905C(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updatePanelWithRoutes:", *(void *)(a1 + 40), a1, a1);
}

id sub_100029364(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateHeaderWithAudioFormat", a1, a1);
}

void sub_10002C904()
{
}

TVSPRenderer *sub_10002C914(id *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  v9[1] = a1;
  v9[0] = objc_loadWeakRetained(a1 + 4);
  for (char i = 1; (i & 1) != 0; char i = 0)
  {
    id v4 = [v9[0] sleepRequestsByIdentifier];
    id v7 = [v4 objectForKeyedSubscript:location[0]];

    char v3 = 0;
    if (v7) {
      char v3 = i;
    }
    if ((v3 & 1) != 0)
    {
      id v11 =  +[TVSPRenderer rendererWithIdentifier:format:content:]( &OBJC_CLASS___TVSPRenderer,  "rendererWithIdentifier:format:content:",  location[0],  18LL,  v7);
      int v6 = 1;
    }

    else
    {
      int v6 = 5;
    }

    objc_storeStrong(&v7, 0LL);
    if (v6 != 5) {
      goto LABEL_11;
    }
  }

  id v11 = 0LL;
LABEL_11:
  objc_storeStrong(v9, 0LL);
  objc_storeStrong(location, 0LL);
  return v11;
}

void sub_10002CC54( uint64_t a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id *location)
{
  *(void *)(v11 - 80) = a1;
  *(_DWORD *)(v11 - 84) = a2;
  objc_destroyWeak((id *)(v11 - 72));
  _Unwind_Resume(*(_Unwind_Exception **)(v11 - 80));
}

void sub_10002CC94(id *a1, void *a2, void *a3)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  id v15 = 0LL;
  objc_storeStrong(&v15, a3);
  v14[1] = a1;
  v14[0] = objc_loadWeakRetained(a1 + 5);
  queue = &_dispatch_main_q;
  int v6 = _NSConcreteStackBlock;
  int v7 = -1073741824;
  int v8 = 0;
  id v9 = sub_10002CE04;
  id v10 = &unk_1001B60D0;
  id v11 = v14[0];
  id v12 = location[0];
  id v13 = a1[4];
  dispatch_async(queue, &v6);

  objc_storeStrong(&v13, 0LL);
  objc_storeStrong(&v12, 0LL);
  objc_storeStrong(&v11, 0LL);
  objc_storeStrong(v14, 0LL);
  objc_storeStrong(&v15, 0LL);
  objc_storeStrong(location, 0LL);
}

void sub_10002CE04(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) sleepTimerController];
  [v2 setCurrentScheduledSleep:v1];

  id v4 = *(void **)(a1 + 48);
  id v5 = +[TVSPAnimator defaultAnimator](&OBJC_CLASS___TVSPAnimator, "defaultAnimator");
  objc_msgSend(v4, "popPlatterControllerWithAnimator:");
}

id sub_10002D380(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateStatusForRelay", a1, a1);
}

void sub_10002DAA8(id *a1, int a2, void *a3)
{
  id v5 = a1;
  int v4 = a2;
  id location[2] = a3;
  location[1] = a1;
  location[0] = objc_loadWeakRetained(a1 + 4);
  if (v4 == 1)
  {
    [location[0] _getConnectionStatus];
  }

  else if (v4 == 2)
  {
    ne_session_release([location[0] session]);
  }

  objc_storeStrong(location, 0LL);
}

void sub_10002DCF8( uint64_t a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *location)
{
  *(void *)(v10 - 32) = a1;
  *(_DWORD *)(v10 - 36) = a2;
  objc_destroyWeak((id *)(v10 - 24));
  _Unwind_Resume(*(_Unwind_Exception **)(v10 - 32));
}

void sub_10002DD38(id *a1, unsigned int a2)
{
  int v4 = a1;
  unsigned int v3 = a2;
  v2[1] = a1;
  v2[0] = objc_loadWeakRetained(a1 + 4);
  [v2[0] setSessionStatus:v3];
  [v2[0] _updateConnectionStatus];
  objc_storeStrong(v2, 0LL);
}

void sub_10002E8F4(id a1)
{
  os_log_t v1 = os_log_create("com.apple.TVSystemUIService.menuItemProvider", "NetworkState");
  id v2 = (void *)qword_100221948;
  qword_100221948 = (uint64_t)v1;
}

void sub_10002EDC0(id a1)
{
  v66[3] = a1;
  v66[2] = a1;
  v66[0] = 0LL;
  v66[1] = 0LL;
  uint64_t v34 = +[NSValue valueWithBytes:objCType:](&OBJC_CLASS___NSValue, "valueWithBytes:objCType:", v66);
  v67[0] = v34;
  v68[0] = objc_opt_class(&OBJC_CLASS____TVSSMenuBarBasicAnimationTransaction);
  v65[0] = 0LL;
  v65[1] = 1LL;
  v33 =  +[NSValue valueWithBytes:objCType:]( &OBJC_CLASS___NSValue,  "valueWithBytes:objCType:",  v65,  "{_TVSSMenuModeKey=QQ}");
  v67[1] = v33;
  v68[1] = objc_opt_class(&OBJC_CLASS____TVSSMenuBarHiddenToBannerAnimationTransaction);
  v64[0] = 0LL;
  v64[1] = 2LL;
  v32 =  +[NSValue valueWithBytes:objCType:]( &OBJC_CLASS___NSValue,  "valueWithBytes:objCType:",  v64,  "{_TVSSMenuModeKey=QQ}");
  v67[2] = v32;
  v68[2] = objc_opt_class(&OBJC_CLASS____TVSSMenuBarHiddenToPassiveAnimationTransaction);
  v63[0] = 0LL;
  v63[1] = 3LL;
  id v31 =  +[NSValue valueWithBytes:objCType:]( &OBJC_CLASS___NSValue,  "valueWithBytes:objCType:",  v63,  "{_TVSSMenuModeKey=QQ}");
  v67[3] = v31;
  v68[3] = objc_opt_class(&OBJC_CLASS____TVSSMenuBarHiddenToInteractiveAnimationTransaction);
  v62[0] = 0LL;
  v62[1] = 4LL;
  v30 =  +[NSValue valueWithBytes:objCType:]( &OBJC_CLASS___NSValue,  "valueWithBytes:objCType:",  v62,  "{_TVSSMenuModeKey=QQ}");
  v67[4] = v30;
  v68[4] = objc_opt_class(&OBJC_CLASS____TVSSMenuBarBasicAnimationTransaction);
  v61[0] = 0LL;
  v61[1] = 5LL;
  int v29 =  +[NSValue valueWithBytes:objCType:]( &OBJC_CLASS___NSValue,  "valueWithBytes:objCType:",  v61,  "{_TVSSMenuModeKey=QQ}");
  v67[5] = v29;
  v68[5] = objc_opt_class(&OBJC_CLASS____TVSSMenuBarBasicAnimationTransaction);
  v60[0] = 1LL;
  v60[1] = 0LL;
  id v28 =  +[NSValue valueWithBytes:objCType:]( &OBJC_CLASS___NSValue,  "valueWithBytes:objCType:",  v60,  "{_TVSSMenuModeKey=QQ}");
  v67[6] = v28;
  v68[6] = objc_opt_class(&OBJC_CLASS____TVSSMenuBarBannerToHiddenAnimationTransaction);
  v59[0] = 1LL;
  v59[1] = 2LL;
  id v27 =  +[NSValue valueWithBytes:objCType:]( &OBJC_CLASS___NSValue,  "valueWithBytes:objCType:",  v59,  "{_TVSSMenuModeKey=QQ}");
  v67[7] = v27;
  v68[7] = objc_opt_class(&OBJC_CLASS____TVSSMenuBarBannerToPassiveAnimationTransaction);
  v58[0] = 1LL;
  v58[1] = 1LL;
  id v26 =  +[NSValue valueWithBytes:objCType:]( &OBJC_CLASS___NSValue,  "valueWithBytes:objCType:",  v58,  "{_TVSSMenuModeKey=QQ}");
  v67[8] = v26;
  v68[8] = objc_opt_class(&OBJC_CLASS____TVSSMenuBarBaseBannerAnimationTransaction);
  v57[0] = 1LL;
  v57[1] = 3LL;
  os_log_type_t v25 =  +[NSValue valueWithBytes:objCType:]( &OBJC_CLASS___NSValue,  "valueWithBytes:objCType:",  v57,  "{_TVSSMenuModeKey=QQ}");
  v67[9] = v25;
  v68[9] = objc_opt_class(&OBJC_CLASS____TVSSMenuBarBaseBannerAnimationTransaction);
  v56[0] = 1LL;
  v56[1] = 4LL;
  id v24 =  +[NSValue valueWithBytes:objCType:]( &OBJC_CLASS___NSValue,  "valueWithBytes:objCType:",  v56,  "{_TVSSMenuModeKey=QQ}");
  v67[10] = v24;
  v68[10] = objc_opt_class(&OBJC_CLASS____TVSSMenuBarBannerToPrivacyAnimationTransaction);
  v55[0] = 1LL;
  v55[1] = 5LL;
  id v23 =  +[NSValue valueWithBytes:objCType:]( &OBJC_CLASS___NSValue,  "valueWithBytes:objCType:",  v55,  "{_TVSSMenuModeKey=QQ}");
  v67[11] = v23;
  v68[11] = objc_opt_class(&OBJC_CLASS____TVSSMenuBarBannerToPrivacyPlusAnimationTransaction);
  v54[0] = 2LL;
  v54[1] = 0LL;
  id v22 =  +[NSValue valueWithBytes:objCType:]( &OBJC_CLASS___NSValue,  "valueWithBytes:objCType:",  v54,  "{_TVSSMenuModeKey=QQ}");
  v67[12] = v22;
  v68[12] = objc_opt_class(&OBJC_CLASS____TVSSMenuBarPassiveToHiddenAnimationTransaction);
  v53[0] = 2LL;
  v53[1] = 1LL;
  int v21 =  +[NSValue valueWithBytes:objCType:]( &OBJC_CLASS___NSValue,  "valueWithBytes:objCType:",  v53,  "{_TVSSMenuModeKey=QQ}");
  v67[13] = v21;
  v68[13] = objc_opt_class(&OBJC_CLASS____TVSSMenuBarPassiveToBannerAnimationTransaction);
  v52[0] = 2LL;
  v52[1] = 3LL;
  id v20 =  +[NSValue valueWithBytes:objCType:]( &OBJC_CLASS___NSValue,  "valueWithBytes:objCType:",  v52,  "{_TVSSMenuModeKey=QQ}");
  v67[14] = v20;
  v68[14] = objc_opt_class(&OBJC_CLASS____TVSSMenuBarPassiveToInteractiveAnimationTransaction);
  v51[0] = 2LL;
  v51[1] = 4LL;
  id v19 =  +[NSValue valueWithBytes:objCType:]( &OBJC_CLASS___NSValue,  "valueWithBytes:objCType:",  v51,  "{_TVSSMenuModeKey=QQ}");
  v67[15] = v19;
  v68[15] = objc_opt_class(&OBJC_CLASS____TVSSMenuBarBasicAnimationTransaction);
  v50[0] = 2LL;
  v50[1] = 5LL;
  id v18 =  +[NSValue valueWithBytes:objCType:]( &OBJC_CLASS___NSValue,  "valueWithBytes:objCType:",  v50,  "{_TVSSMenuModeKey=QQ}");
  v67[16] = v18;
  v68[16] = objc_opt_class(&OBJC_CLASS____TVSSMenuBarBasicAnimationTransaction);
  v49[0] = 3LL;
  v49[1] = 0LL;
  CGRect v17 =  +[NSValue valueWithBytes:objCType:]( &OBJC_CLASS___NSValue,  "valueWithBytes:objCType:",  v49,  "{_TVSSMenuModeKey=QQ}");
  v67[17] = v17;
  v68[17] = objc_opt_class(&OBJC_CLASS____TVSSMenuBarInteractiveToHiddenAnimationTransaction);
  v48[0] = 3LL;
  v48[1] = 1LL;
  id v16 =  +[NSValue valueWithBytes:objCType:]( &OBJC_CLASS___NSValue,  "valueWithBytes:objCType:",  v48,  "{_TVSSMenuModeKey=QQ}");
  v67[18] = v16;
  v68[18] = objc_opt_class(&OBJC_CLASS____TVSSMenuBarBaseBannerAnimationTransaction);
  v47[0] = 3LL;
  v47[1] = 2LL;
  id v15 =  +[NSValue valueWithBytes:objCType:]( &OBJC_CLASS___NSValue,  "valueWithBytes:objCType:",  v47,  "{_TVSSMenuModeKey=QQ}");
  v67[19] = v15;
  v68[19] = objc_opt_class(&OBJC_CLASS____TVSSMenuBarInteractiveToPassiveAnimationTransaction);
  v46[0] = 3LL;
  v46[1] = 4LL;
  unsigned __int8 v14 =  +[NSValue valueWithBytes:objCType:]( &OBJC_CLASS___NSValue,  "valueWithBytes:objCType:",  v46,  "{_TVSSMenuModeKey=QQ}");
  v67[20] = v14;
  v68[20] = objc_opt_class(&OBJC_CLASS____TVSSMenuBarInteractiveToPrivacyAnimationTransaction);
  v45[0] = 3LL;
  v45[1] = 5LL;
  id v13 =  +[NSValue valueWithBytes:objCType:]( &OBJC_CLASS___NSValue,  "valueWithBytes:objCType:",  v45,  "{_TVSSMenuModeKey=QQ}");
  v67[21] = v13;
  v68[21] = objc_opt_class(&OBJC_CLASS____TVSSMenuBarInteractiveToPrivacyAnimationTransaction);
  v44[0] = 4LL;
  v44[1] = 0LL;
  id v12 =  +[NSValue valueWithBytes:objCType:]( &OBJC_CLASS___NSValue,  "valueWithBytes:objCType:",  v44,  "{_TVSSMenuModeKey=QQ}");
  v67[22] = v12;
  v68[22] = objc_opt_class(&OBJC_CLASS____TVSSMenuBarBasicAnimationTransaction);
  v43[0] = 4LL;
  v43[1] = 1LL;
  id v11 =  +[NSValue valueWithBytes:objCType:]( &OBJC_CLASS___NSValue,  "valueWithBytes:objCType:",  v43,  "{_TVSSMenuModeKey=QQ}");
  v67[23] = v11;
  v68[23] = objc_opt_class(&OBJC_CLASS____TVSSMenuBarBaseBannerAnimationTransaction);
  v42[0] = 4LL;
  v42[1] = 2LL;
  uint64_t v10 =  +[NSValue valueWithBytes:objCType:]( &OBJC_CLASS___NSValue,  "valueWithBytes:objCType:",  v42,  "{_TVSSMenuModeKey=QQ}");
  v67[24] = v10;
  v68[24] = objc_opt_class(&OBJC_CLASS____TVSSMenuBarBasicAnimationTransaction);
  v41[0] = 4LL;
  v41[1] = 3LL;
  id v9 =  +[NSValue valueWithBytes:objCType:]( &OBJC_CLASS___NSValue,  "valueWithBytes:objCType:",  v41,  "{_TVSSMenuModeKey=QQ}");
  v67[25] = v9;
  v68[25] = objc_opt_class(&OBJC_CLASS____TVSSMenuBarPrivacyToInteractiveAnimationTransaction);
  v40[0] = 4LL;
  v40[1] = 5LL;
  int v8 =  +[NSValue valueWithBytes:objCType:]( &OBJC_CLASS___NSValue,  "valueWithBytes:objCType:",  v40,  "{_TVSSMenuModeKey=QQ}");
  v67[26] = v8;
  v68[26] = objc_opt_class(&OBJC_CLASS____TVSSMenuBarBasicAnimationTransaction);
  v39[0] = 5LL;
  v39[1] = 0LL;
  int v7 =  +[NSValue valueWithBytes:objCType:]( &OBJC_CLASS___NSValue,  "valueWithBytes:objCType:",  v39,  "{_TVSSMenuModeKey=QQ}");
  v67[27] = v7;
  v68[27] = objc_opt_class(&OBJC_CLASS____TVSSMenuBarBasicAnimationTransaction);
  v38[0] = 5LL;
  v38[1] = 1LL;
  int v6 =  +[NSValue valueWithBytes:objCType:]( &OBJC_CLASS___NSValue,  "valueWithBytes:objCType:",  v38,  "{_TVSSMenuModeKey=QQ}");
  v67[28] = v6;
  v68[28] = objc_opt_class(&OBJC_CLASS____TVSSMenuBarPrivacyPlusToBannerAnimationTransaction);
  v37[0] = 5LL;
  v37[1] = 2LL;
  id v5 =  +[NSValue valueWithBytes:objCType:]( &OBJC_CLASS___NSValue,  "valueWithBytes:objCType:",  v37,  "{_TVSSMenuModeKey=QQ}");
  v67[29] = v5;
  v68[29] = objc_opt_class(&OBJC_CLASS____TVSSMenuBarBasicAnimationTransaction);
  v36[0] = 5LL;
  v36[1] = 3LL;
  int v4 =  +[NSValue valueWithBytes:objCType:]( &OBJC_CLASS___NSValue,  "valueWithBytes:objCType:",  v36,  "{_TVSSMenuModeKey=QQ}");
  v67[30] = v4;
  v68[30] = objc_opt_class(&OBJC_CLASS____TVSSMenuBarPrivacyToInteractiveAnimationTransaction);
  v35[0] = 5LL;
  v35[1] = 4LL;
  unsigned int v3 =  +[NSValue valueWithBytes:objCType:]( &OBJC_CLASS___NSValue,  "valueWithBytes:objCType:",  v35,  "{_TVSSMenuModeKey=QQ}");
  v67[31] = v3;
  v68[31] = objc_opt_class(&OBJC_CLASS____TVSSMenuBarBasicAnimationTransaction);
  os_log_t v1 =  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v68,  v67,  32LL);
  id v2 = (void *)qword_100221958;
  qword_100221958 = (uint64_t)v1;
}

uint64_t sub_10002F860(uint64_t result, uint64_t a2, uint64_t a3)
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

uint64_t sub_1000304AC(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(_BYTE *)result = 2;
  *(_BYTE *)(result + 1) = 2;
  *(_BYTE *)(result + 2) = 66;
  *(_BYTE *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 0;
  *(_BYTE *)(result + 13) = 8;
  *(void *)(result + 14) = a3;
  return result;
}

uint64_t sub_100030798(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(_BYTE *)result = 2;
  *(_BYTE *)(result + 1) = 3;
  *(_BYTE *)(result + 2) = 66;
  *(_BYTE *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 0;
  *(_BYTE *)(result + 13) = 8;
  *(void *)(result + 14) = a3;
  *(_BYTE *)(result + 22) = 66;
  *(_BYTE *)(result + 23) = 8;
  *(void *)(result + 24) = a4;
  return result;
}

uint64_t sub_100030F04(uint64_t result, uint64_t a2, uint64_t a3, int a4, int a5)
{
  *(_BYTE *)result = 2;
  *(_BYTE *)(result + 1) = 4;
  *(_BYTE *)(result + 2) = 66;
  *(_BYTE *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 0;
  *(_BYTE *)(result + 13) = 8;
  *(void *)(result + 14) = a3;
  *(_BYTE *)(result + 22) = 0;
  *(_BYTE *)(result + 23) = 4;
  *(_DWORD *)(result + 24) = a4;
  *(_BYTE *)(result + 28) = 0;
  *(_BYTE *)(result + 29) = 4;
  *(_DWORD *)(result + 30) = a5;
  return result;
}

uint64_t sub_100030F80(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  *(_BYTE *)result = 2;
  *(_BYTE *)(result + 1) = 4;
  *(_BYTE *)(result + 2) = 66;
  *(_BYTE *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 0;
  *(_BYTE *)(result + 13) = 8;
  *(void *)(result + 14) = a3;
  *(_BYTE *)(result + 22) = 0;
  *(_BYTE *)(result + 23) = 8;
  *(void *)(result + 24) = a4;
  *(_BYTE *)(result + 32) = 66;
  *(_BYTE *)(result + 33) = 8;
  *(void *)(result + 34) = a5;
  return result;
}

void sub_100031584(id a1)
{
  os_log_t v1 = objc_alloc_init(&OBJC_CLASS___NSPersonNameComponentsFormatter);
  id v2 = (void *)qword_100221968;
  qword_100221968 = (uint64_t)v1;

  [(id)qword_100221968 setStyle:4];
  objc_msgSend((id)qword_100221968, "set_ignoresFallbacks:", 1);
}

TVSSDebugOverlordViewController *sub_100031BFC(uint64_t a1)
{
  return  -[TVSSDebugOverlordViewController initWithDataSourceControllerOverlord:]( objc_alloc(&OBJC_CLASS___TVSSDebugOverlordViewController),  "initWithDataSourceControllerOverlord:",  *(void *)(a1 + 32));
}

void sub_100032574()
{
}

void sub_100032584(id *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  id WeakRetained = objc_loadWeakRetained(a1 + 4);
  [WeakRetained updateMenuItemWithReason:@"Lingering Controller Changed Visibility"];

  objc_storeStrong(location, 0LL);
}

TVSSNowPlayingPanelViewController *sub_1000328C4(void *a1, void *a2, void *a3)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  id v7 = 0LL;
  objc_storeStrong(&v7, a3);
  int v6 = -[TVSSNowPlayingPanelViewController initWithAudioNowPlayingController:]( objc_alloc(&OBJC_CLASS___TVSSNowPlayingPanelViewController),  "initWithAudioNowPlayingController:",  a1[4]);
  objc_storeStrong(&v7, 0LL);
  objc_storeStrong(location, 0LL);
  return v6;
}

void sub_1000333B4()
{
}

BOOL sub_1000333C4(id a1, MRAVOutputDevice *a2)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  unsigned int v3 = [location[0] isLocalDevice] ^ 1;
  objc_storeStrong(location, 0LL);
  return v3 & 1;
}

id sub_100033430(void *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  v7[1] = a1;
  id v5 = objc_alloc(&OBJC_CLASS___MPAVOutputDeviceRoute);
  id v9 = location[0];
  int v6 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v9, 1LL);
  v7[0] = -[MPAVOutputDeviceRoute initWithOutputDevices:](v5, "initWithOutputDevices:");

  id v3 = v7[0];
  objc_storeStrong(v7, 0LL);
  objc_storeStrong(location, 0LL);
  return v3;
}

uint64_t sub_100033558(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  *(_BYTE *)result = 2;
  *(_BYTE *)(result + 1) = 5;
  *(_BYTE *)(result + 2) = 64;
  *(_BYTE *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 64;
  *(_BYTE *)(result + 13) = 8;
  *(void *)(result + 14) = a3;
  *(_BYTE *)(result + 22) = 64;
  *(_BYTE *)(result + 23) = 8;
  *(void *)(result + 24) = a4;
  *(_BYTE *)(result + 32) = 64;
  *(_BYTE *)(result + 33) = 8;
  *(void *)(result + 34) = a5;
  *(_BYTE *)(result + 42) = 64;
  *(_BYTE *)(result + 43) = 8;
  *(void *)(result + 44) = a6;
  return result;
}

void sub_100034210(id a1)
{
  os_log_t v1 = os_log_create("com.apple.TVSystemUIService.menuItemProvider", "PassiveVPN");
  id v2 = (void *)qword_100221980;
  qword_100221980 = (uint64_t)v1;
}

id AttentionMonitorLog()
{
  id v2 = (dispatch_once_t *)&unk_100221998;
  id location = 0LL;
  objc_storeStrong(&location, &stru_1001B6DC8);
  if (*v2 != -1) {
    dispatch_once(v2, location);
  }
  objc_storeStrong(&location, 0LL);
  return (id)qword_100221990;
}

void sub_1000345C0(id a1)
{
  os_log_t v1 = os_log_create("com.apple.TVSystemUIService", "AttentionMonitor");
  id v2 = (void *)qword_100221990;
  qword_100221990 = (uint64_t)v1;
}

id AudioRoutingLog()
{
  id v2 = (dispatch_once_t *)&unk_1002219A8;
  id location = 0LL;
  objc_storeStrong(&location, &stru_1001B6DE8);
  if (*v2 != -1) {
    dispatch_once(v2, location);
  }
  objc_storeStrong(&location, 0LL);
  return (id)qword_1002219A0;
}

void sub_100034690(id a1)
{
  os_log_t v1 = os_log_create("com.apple.TVSystemUIService", "AudioRouting");
  id v2 = (void *)qword_1002219A0;
  qword_1002219A0 = (uint64_t)v1;
}

id BannerAuthorityLog()
{
  id v2 = (dispatch_once_t *)&unk_1002219B8;
  id location = 0LL;
  objc_storeStrong(&location, &stru_1001B6E08);
  if (*v2 != -1) {
    dispatch_once(v2, location);
  }
  objc_storeStrong(&location, 0LL);
  return (id)qword_1002219B0;
}

void sub_100034760(id a1)
{
  os_log_t v1 = os_log_create("com.apple.TVSystemUIService.banners", "BannerAuthority");
  id v2 = (void *)qword_1002219B0;
  qword_1002219B0 = (uint64_t)v1;
}

id BannerBulletinBridgeManagerLog()
{
  id v2 = (dispatch_once_t *)&unk_1002219C8;
  id location = 0LL;
  objc_storeStrong(&location, &stru_1001B6E28);
  if (*v2 != -1) {
    dispatch_once(v2, location);
  }
  objc_storeStrong(&location, 0LL);
  return (id)qword_1002219C0;
}

void sub_100034830(id a1)
{
  os_log_t v1 = os_log_create("com.apple.TVSystemUIService.banners", "BannerBulletinBridgeManager");
  id v2 = (void *)qword_1002219C0;
  qword_1002219C0 = (uint64_t)v1;
}

id BannerHostedViewControllerLog()
{
  id v2 = (dispatch_once_t *)&unk_1002219D8;
  id location = 0LL;
  objc_storeStrong(&location, &stru_1001B6E48);
  if (*v2 != -1) {
    dispatch_once(v2, location);
  }
  objc_storeStrong(&location, 0LL);
  return (id)qword_1002219D0;
}

void sub_100034900(id a1)
{
  os_log_t v1 = os_log_create("com.apple.TVSystemUIService.banners", "BannerHostedPresentableViewController");
  id v2 = (void *)qword_1002219D0;
  qword_1002219D0 = (uint64_t)v1;
}

id BannerManagerLog()
{
  id v2 = (dispatch_once_t *)&unk_1002219E8;
  id location = 0LL;
  objc_storeStrong(&location, &stru_1001B6E68);
  if (*v2 != -1) {
    dispatch_once(v2, location);
  }
  objc_storeStrong(&location, 0LL);
  return (id)qword_1002219E0;
}

void sub_1000349D0(id a1)
{
  os_log_t v1 = os_log_create("com.apple.TVSystemUIService.banners", "BannerManager");
  id v2 = (void *)qword_1002219E0;
  qword_1002219E0 = (uint64_t)v1;
}

id BaseMenuItemProviderLog()
{
  id v2 = (dispatch_once_t *)&unk_1002219F8;
  id location = 0LL;
  objc_storeStrong(&location, &stru_1001B6E88);
  if (*v2 != -1) {
    dispatch_once(v2, location);
  }
  objc_storeStrong(&location, 0LL);
  return (id)qword_1002219F0;
}

void sub_100034AA0(id a1)
{
  os_log_t v1 = os_log_create("com.apple.TVSystemUIService", "BaseMenuItemProvider");
  id v2 = (void *)qword_1002219F0;
  qword_1002219F0 = (uint64_t)v1;
}

id BannerOverlordRoutingLog()
{
  id v2 = (dispatch_once_t *)&unk_100221A08;
  id location = 0LL;
  objc_storeStrong(&location, &stru_1001B6EA8);
  if (*v2 != -1) {
    dispatch_once(v2, location);
  }
  objc_storeStrong(&location, 0LL);
  return (id)qword_100221A00;
}

void sub_100034B70(id a1)
{
  os_log_t v1 = os_log_create("com.apple.TVSystemUIService.banners", "BannerOverlordRouting");
  id v2 = (void *)qword_100221A00;
  qword_100221A00 = (uint64_t)v1;
}

id BannerPresenterLog()
{
  id v2 = (dispatch_once_t *)&unk_100221A18;
  id location = 0LL;
  objc_storeStrong(&location, &stru_1001B6EC8);
  if (*v2 != -1) {
    dispatch_once(v2, location);
  }
  objc_storeStrong(&location, 0LL);
  return (id)qword_100221A10;
}

void sub_100034C40(id a1)
{
  os_log_t v1 = os_log_create("com.apple.TVSystemUIService.banners", "BannerPresenter");
  id v2 = (void *)qword_100221A10;
  qword_100221A10 = (uint64_t)v1;
}

id BannerPresentingMenuBarViewControllerLog()
{
  id v2 = (dispatch_once_t *)&unk_100221A28;
  id location = 0LL;
  objc_storeStrong(&location, &stru_1001B6EE8);
  if (*v2 != -1) {
    dispatch_once(v2, location);
  }
  objc_storeStrong(&location, 0LL);
  return (id)qword_100221A20;
}

void sub_100034D10(id a1)
{
  os_log_t v1 = os_log_create("com.apple.TVSystemUIService.banners", "MenuBarViewController");
  id v2 = (void *)qword_100221A20;
  qword_100221A20 = (uint64_t)v1;
}

id BannerQueueLog()
{
  id v2 = (dispatch_once_t *)&unk_100221A38;
  id location = 0LL;
  objc_storeStrong(&location, &stru_1001B6F08);
  if (*v2 != -1) {
    dispatch_once(v2, location);
  }
  objc_storeStrong(&location, 0LL);
  return (id)qword_100221A30;
}

void sub_100034DE0(id a1)
{
  os_log_t v1 = os_log_create("com.apple.TVSystemUIService.banners", "BannerQueue");
  id v2 = (void *)qword_100221A30;
  qword_100221A30 = (uint64_t)v1;
}

id BannerTemplateViewControllerLog()
{
  id v2 = (dispatch_once_t *)&unk_100221A48;
  id location = 0LL;
  objc_storeStrong(&location, &stru_1001B6F28);
  if (*v2 != -1) {
    dispatch_once(v2, location);
  }
  objc_storeStrong(&location, 0LL);
  return (id)qword_100221A40;
}

void sub_100034EB0(id a1)
{
  os_log_t v1 = os_log_create("com.apple.TVSystemUIService.banners", "BannerTemplatePresentableViewController");
  id v2 = (void *)qword_100221A40;
  qword_100221A40 = (uint64_t)v1;
}

id BluetoothRemoteControllerLog()
{
  id v2 = (dispatch_once_t *)&unk_100221A58;
  id location = 0LL;
  objc_storeStrong(&location, &stru_1001B6F48);
  if (*v2 != -1) {
    dispatch_once(v2, location);
  }
  objc_storeStrong(&location, 0LL);
  return (id)qword_100221A50;
}

void sub_100034F80(id a1)
{
  os_log_t v1 = os_log_create("com.apple.TVSystemUIService", "BluetoothRemoteController");
  id v2 = (void *)qword_100221A50;
  qword_100221A50 = (uint64_t)v1;
}

id BluetoothRemoteManagerLog()
{
  id v2 = (dispatch_once_t *)&unk_100221A68;
  id location = 0LL;
  objc_storeStrong(&location, &stru_1001B6F68);
  if (*v2 != -1) {
    dispatch_once(v2, location);
  }
  objc_storeStrong(&location, 0LL);
  return (id)qword_100221A60;
}

void sub_100035050(id a1)
{
  os_log_t v1 = os_log_create("com.apple.TVSystemUIService", "BluetoothRemoteManager");
  id v2 = (void *)qword_100221A60;
  qword_100221A60 = (uint64_t)v1;
}

id CurrentUserControllerLog()
{
  id v2 = (dispatch_once_t *)&unk_100221A78;
  id location = 0LL;
  objc_storeStrong(&location, &stru_1001B6F88);
  if (*v2 != -1) {
    dispatch_once(v2, location);
  }
  objc_storeStrong(&location, 0LL);
  return (id)qword_100221A70;
}

void sub_100035120(id a1)
{
  os_log_t v1 = os_log_create("com.apple.TVSystemUIService", "CurrentUserController");
  id v2 = (void *)qword_100221A70;
  qword_100221A70 = (uint64_t)v1;
}

id DictationControllerLog()
{
  id v2 = (dispatch_once_t *)&unk_100221A88;
  id location = 0LL;
  objc_storeStrong(&location, &stru_1001B6FA8);
  if (*v2 != -1) {
    dispatch_once(v2, location);
  }
  objc_storeStrong(&location, 0LL);
  return (id)qword_100221A80;
}

void sub_1000351F0(id a1)
{
  os_log_t v1 = os_log_create("com.apple.TVSystemUIService", "Dictation");
  id v2 = (void *)qword_100221A80;
  qword_100221A80 = (uint64_t)v1;
}

id DoNotDisturbControllerLog()
{
  id v2 = (dispatch_once_t *)&unk_100221A98;
  id location = 0LL;
  objc_storeStrong(&location, &stru_1001B6FC8);
  if (*v2 != -1) {
    dispatch_once(v2, location);
  }
  objc_storeStrong(&location, 0LL);
  return (id)qword_100221A90;
}

void sub_1000352C0(id a1)
{
  os_log_t v1 = os_log_create("com.apple.TVSystemUIService", "DoNotDisturbController");
  id v2 = (void *)qword_100221A90;
  qword_100221A90 = (uint64_t)v1;
}

id FaceTimeControllerLog()
{
  id v2 = (dispatch_once_t *)&unk_100221AA8;
  id location = 0LL;
  objc_storeStrong(&location, &stru_1001B6FE8);
  if (*v2 != -1) {
    dispatch_once(v2, location);
  }
  objc_storeStrong(&location, 0LL);
  return (id)qword_100221AA0;
}

void sub_100035390(id a1)
{
  os_log_t v1 = os_log_create("com.apple.TVSystemUIService", "FaceTimeController");
  id v2 = (void *)qword_100221AA0;
  qword_100221AA0 = (uint64_t)v1;
}

id MenuBarAnimationLog()
{
  id v2 = (dispatch_once_t *)&unk_100221AB8;
  id location = 0LL;
  objc_storeStrong(&location, &stru_1001B7008);
  if (*v2 != -1) {
    dispatch_once(v2, location);
  }
  objc_storeStrong(&location, 0LL);
  return (id)qword_100221AB0;
}

void sub_100035460(id a1)
{
  os_log_t v1 = os_log_create("com.apple.TVSystemUIService.menuBar", "Animation");
  id v2 = (void *)qword_100221AB0;
  qword_100221AB0 = (uint64_t)v1;
}

id MenuBarOrthogonalNavigationLog()
{
  id v2 = (dispatch_once_t *)&unk_100221AC8;
  id location = 0LL;
  objc_storeStrong(&location, &stru_1001B7028);
  if (*v2 != -1) {
    dispatch_once(v2, location);
  }
  objc_storeStrong(&location, 0LL);
  return (id)qword_100221AC0;
}

void sub_100035530(id a1)
{
  os_log_t v1 = os_log_create("com.apple.TVSystemUIService.menuBar", "OrthogonalNavigation");
  id v2 = (void *)qword_100221AC0;
  qword_100221AC0 = (uint64_t)v1;
}

id GameControllersControllerLog()
{
  id v2 = (dispatch_once_t *)&unk_100221AD8;
  id location = 0LL;
  objc_storeStrong(&location, &stru_1001B7048);
  if (*v2 != -1) {
    dispatch_once(v2, location);
  }
  objc_storeStrong(&location, 0LL);
  return (id)qword_100221AD0;
}

void sub_100035600(id a1)
{
  os_log_t v1 = os_log_create("com.apple.TVSystemUIService", "GameControllersController");
  id v2 = (void *)qword_100221AD0;
  qword_100221AD0 = (uint64_t)v1;
}

id HomeKitLog()
{
  id v2 = (dispatch_once_t *)&unk_100221AE8;
  id location = 0LL;
  objc_storeStrong(&location, &stru_1001B7068);
  if (*v2 != -1) {
    dispatch_once(v2, location);
  }
  objc_storeStrong(&location, 0LL);
  return (id)qword_100221AE0;
}

void sub_1000356D0(id a1)
{
  os_log_t v1 = os_log_create("com.apple.TVSystemUIService", "HomeKit");
  id v2 = (void *)qword_100221AE0;
  qword_100221AE0 = (uint64_t)v1;
}

id MenuModeContributorLog()
{
  id v2 = (dispatch_once_t *)&unk_100221AF8;
  id location = 0LL;
  objc_storeStrong(&location, &stru_1001B7088);
  if (*v2 != -1) {
    dispatch_once(v2, location);
  }
  objc_storeStrong(&location, 0LL);
  return (id)qword_100221AF0;
}

void sub_1000357A0(id a1)
{
  os_log_t v1 = os_log_create("com.apple.TVSystemUIService.menuMode", "TVSSAttentionAwarenessMenuModeStateContributor");
  id v2 = (void *)qword_100221AF0;
  qword_100221AF0 = (uint64_t)v1;
}

id MenuModeControllerLog()
{
  id v2 = (dispatch_once_t *)&unk_100221B08;
  id location = 0LL;
  objc_storeStrong(&location, &stru_1001B70A8);
  if (*v2 != -1) {
    dispatch_once(v2, location);
  }
  objc_storeStrong(&location, 0LL);
  return (id)qword_100221B00;
}

void sub_100035870(id a1)
{
  os_log_t v1 = os_log_create("com.apple.TVSystemUIService.menuMode", "TVSSMenuModeController");
  id v2 = (void *)qword_100221B00;
  qword_100221B00 = (uint64_t)v1;
}

id NetworkControllerLog()
{
  id v2 = (dispatch_once_t *)&unk_100221B18;
  id location = 0LL;
  objc_storeStrong(&location, &stru_1001B70C8);
  if (*v2 != -1) {
    dispatch_once(v2, location);
  }
  objc_storeStrong(&location, 0LL);
  return (id)qword_100221B10;
}

void sub_100035940(id a1)
{
  os_log_t v1 = os_log_create("com.apple.TVSystemUIService", "NetworkController");
  id v2 = (void *)qword_100221B10;
  qword_100221B10 = (uint64_t)v1;
}

id NowPlayingControllerLog()
{
  id v2 = (dispatch_once_t *)&unk_100221B28;
  id location = 0LL;
  objc_storeStrong(&location, &stru_1001B70E8);
  if (*v2 != -1) {
    dispatch_once(v2, location);
  }
  objc_storeStrong(&location, 0LL);
  return (id)qword_100221B20;
}

void sub_100035A10(id a1)
{
  os_log_t v1 = os_log_create("com.apple.TVSystemUIService", "AudioNowPlayingController");
  id v2 = (void *)qword_100221B20;
  qword_100221B20 = (uint64_t)v1;
}

id NowPlayingLingeringLog()
{
  id v2 = (dispatch_once_t *)&unk_100221B38;
  id location = 0LL;
  objc_storeStrong(&location, &stru_1001B7108);
  if (*v2 != -1) {
    dispatch_once(v2, location);
  }
  objc_storeStrong(&location, 0LL);
  return (id)qword_100221B30;
}

void sub_100035AE0(id a1)
{
  os_log_t v1 = os_log_create("com.apple.TVSystemUIService", "NowPlayingLingering");
  id v2 = (void *)qword_100221B30;
  qword_100221B30 = (uint64_t)v1;
}

id NowPlayingMediaItemLog()
{
  id v2 = (dispatch_once_t *)&unk_100221B48;
  id location = 0LL;
  objc_storeStrong(&location, &stru_1001B7128);
  if (*v2 != -1) {
    dispatch_once(v2, location);
  }
  objc_storeStrong(&location, 0LL);
  return (id)qword_100221B40;
}

void sub_100035BB0(id a1)
{
  os_log_t v1 = os_log_create("com.apple.TVSystemUIService", "NowPlayingMediaItem");
  id v2 = (void *)qword_100221B40;
  qword_100221B40 = (uint64_t)v1;
}

id NowPlayingProviderLog()
{
  id v2 = (dispatch_once_t *)&unk_100221B58;
  id location = 0LL;
  objc_storeStrong(&location, &stru_1001B7148);
  if (*v2 != -1) {
    dispatch_once(v2, location);
  }
  objc_storeStrong(&location, 0LL);
  return (id)qword_100221B50;
}

void sub_100035C80(id a1)
{
  os_log_t v1 = os_log_create("com.apple.TVSystemUIService", "NowPlayingMenuItemProvider");
  id v2 = (void *)qword_100221B50;
  qword_100221B50 = (uint64_t)v1;
}

id NowPlayingStateLog()
{
  id v2 = (dispatch_once_t *)&unk_100221B68;
  id location = 0LL;
  objc_storeStrong(&location, &stru_1001B7168);
  if (*v2 != -1) {
    dispatch_once(v2, location);
  }
  objc_storeStrong(&location, 0LL);
  return (id)qword_100221B60;
}

void sub_100035D50(id a1)
{
  os_log_t v1 = os_log_create("com.apple.TVSystemUIService", "NowPlayingState");
  id v2 = (void *)qword_100221B60;
  qword_100221B60 = (uint64_t)v1;
}

id PrivacyLog()
{
  id v2 = (dispatch_once_t *)&unk_100221B78;
  id location = 0LL;
  objc_storeStrong(&location, &stru_1001B7188);
  if (*v2 != -1) {
    dispatch_once(v2, location);
  }
  objc_storeStrong(&location, 0LL);
  return (id)qword_100221B70;
}

void sub_100035E20(id a1)
{
  os_log_t v1 = os_log_create("com.apple.TVSystemUIService", "Privacy");
  id v2 = (void *)qword_100221B70;
  qword_100221B70 = (uint64_t)v1;
}

id RouteControllerLog()
{
  id v2 = (dispatch_once_t *)&unk_100221B88;
  id location = 0LL;
  objc_storeStrong(&location, &stru_1001B71A8);
  if (*v2 != -1) {
    dispatch_once(v2, location);
  }
  objc_storeStrong(&location, 0LL);
  return (id)qword_100221B80;
}

void sub_100035EF0(id a1)
{
  os_log_t v1 = os_log_create("com.apple.TVSystemUIService", "SystemOutputDeviceRouteController");
  id v2 = (void *)qword_100221B80;
  qword_100221B80 = (uint64_t)v1;
}

id SceneDelegateLog()
{
  id v2 = (dispatch_once_t *)&unk_100221B98;
  id location = 0LL;
  objc_storeStrong(&location, &stru_1001B71C8);
  if (*v2 != -1) {
    dispatch_once(v2, location);
  }
  objc_storeStrong(&location, 0LL);
  return (id)qword_100221B90;
}

void sub_100035FC0(id a1)
{
  os_log_t v1 = os_log_create("com.apple.TVSystemUIService", "SceneDelegate");
  id v2 = (void *)qword_100221B90;
  qword_100221B90 = (uint64_t)v1;
}

id ScreenRecordingLog()
{
  id v2 = (dispatch_once_t *)&unk_100221BA8;
  id location = 0LL;
  objc_storeStrong(&location, &stru_1001B71E8);
  if (*v2 != -1) {
    dispatch_once(v2, location);
  }
  objc_storeStrong(&location, 0LL);
  return (id)qword_100221BA0;
}

void sub_100036090(id a1)
{
  os_log_t v1 = os_log_create("com.apple.TVSystemUIService", "ScreenRecordingController");
  id v2 = (void *)qword_100221BA0;
  qword_100221BA0 = (uint64_t)v1;
}

id TapToRadarLog()
{
  id v2 = (dispatch_once_t *)&unk_100221BB8;
  id location = 0LL;
  objc_storeStrong(&location, &stru_1001B7208);
  if (*v2 != -1) {
    dispatch_once(v2, location);
  }
  objc_storeStrong(&location, 0LL);
  return (id)qword_100221BB0;
}

void sub_100036160(id a1)
{
  os_log_t v1 = os_log_create("com.apple.TVSystemUIService", "TapToRadarController");
  id v2 = (void *)qword_100221BB0;
  qword_100221BB0 = (uint64_t)v1;
}

id TipsLog()
{
  id v2 = (dispatch_once_t *)&unk_100221BC8;
  id location = 0LL;
  objc_storeStrong(&location, &stru_1001B7228);
  if (*v2 != -1) {
    dispatch_once(v2, location);
  }
  objc_storeStrong(&location, 0LL);
  return (id)qword_100221BC0;
}

void sub_100036230(id a1)
{
  os_log_t v1 = os_log_create("com.apple.TVSystemUIService", "Tips");
  id v2 = (void *)qword_100221BC0;
  qword_100221BC0 = (uint64_t)v1;
}

id VideoMicBackingStoreLog()
{
  id v2 = (dispatch_once_t *)&unk_100221BD8;
  id location = 0LL;
  objc_storeStrong(&location, &stru_1001B7248);
  if (*v2 != -1) {
    dispatch_once(v2, location);
  }
  objc_storeStrong(&location, 0LL);
  return (id)qword_100221BD0;
}

void sub_100036300(id a1)
{
  os_log_t v1 = os_log_create("com.apple.TVSystemUIService.videoMic", "BackingStore");
  id v2 = (void *)qword_100221BD0;
  qword_100221BD0 = (uint64_t)v1;
}

id VideoMicEffectsCoordinatorLog()
{
  id v2 = (dispatch_once_t *)&unk_100221BE8;
  id location = 0LL;
  objc_storeStrong(&location, &stru_1001B7268);
  if (*v2 != -1) {
    dispatch_once(v2, location);
  }
  objc_storeStrong(&location, 0LL);
  return (id)qword_100221BE0;
}

void sub_1000363D0(id a1)
{
  os_log_t v1 = os_log_create("com.apple.TVSystemUIService.videoMic", "VideoEffectsCoordinator");
  id v2 = (void *)qword_100221BE0;
  qword_100221BE0 = (uint64_t)v1;
}

id VPNControllerLog()
{
  id v2 = (dispatch_once_t *)&unk_100221BF8;
  id location = 0LL;
  objc_storeStrong(&location, &stru_1001B7288);
  if (*v2 != -1) {
    dispatch_once(v2, location);
  }
  objc_storeStrong(&location, 0LL);
  return (id)qword_100221BF0;
}

void sub_1000364A0(id a1)
{
  os_log_t v1 = os_log_create("com.apple.TVSystemUIService", "VPNController");
  id v2 = (void *)qword_100221BF0;
  qword_100221BF0 = (uint64_t)v1;
}

void sub_100036D78(id a1)
{
  os_log_t v1 = os_log_create("com.apple.TVSystemUIService.menuItemProvider", "VPN");
  id v2 = (void *)qword_100221C00;
  qword_100221C00 = (uint64_t)v1;
}

void sub_100037530(id a1)
{
  os_log_t v1 = os_log_create("com.apple.TVSystemUIService.menuItemProvider", "HomeKit");
  id v2 = (void *)qword_100221C10;
  qword_100221C10 = (uint64_t)v1;
}

uint64_t sub_100037A30(void *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  if (+[TVSSHomeItemManager isFilteringToFavoriteCameras]( &OBJC_CLASS___TVSSHomeItemManager,  "isFilteringToFavoriteCameras"))
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

BOOL sub_100037B38(id a1, HMActionSet *a2)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  unsigned __int8 v3 = objc_msgSend(location[0], "hf_shouldBeOnForContextType:", 3);
  objc_storeStrong(location, 0LL);
  return v3 & 1;
}

NSMutableArray *__cdecl sub_100037FCC(id a1)
{
  return (NSMutableArray *)+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array", a1, a1);
}

void sub_100037FFC(uint64_t a1, void *a2, void *a3, void *a4)
{
  location[1] = (id)a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  id v28 = 0LL;
  objc_storeStrong(&v28, a3);
  v27[2] = a4;
  v27[1] = (id)a1;
  CGRect v17 = *(void **)(a1 + 32);
  int v21 = _NSConcreteStackBlock;
  int v22 = -1073741824;
  int v23 = 0;
  id v24 = sub_1000382C4;
  os_log_type_t v25 = &unk_1001B7500;
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

uint64_t sub_1000382C4(void *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  id v4 = [location[0] identifier];
  unsigned __int8 v5 = [v4 isEqualToString:a1[4]];

  objc_storeStrong(location, 0LL);
  return v5 & 1;
}

__CFString *TVSSPrivacyIndicatorDisplayLocationDescription(uint64_t a1)
{
  if (!a1) {
    return @"Default";
  }
  if (a1 == 1) {
    id v2 = @"MenuBar";
  }
  return v2;
}

__CFString *TVSSRecordingTypeDescription(uint64_t a1)
{
  if (!a1) {
    return @"MicOnly";
  }
  if (a1 == 1) {
    id v2 = @"Camera";
  }
  return v2;
}

uint64_t sub_1000388CC(uint64_t a1)
{
  return *(void *)(*(void *)(a1 + 32) + 8LL);
}

uint64_t sub_1000388F0(uint64_t a1)
{
  return *(void *)(*(void *)(a1 + 32) + 16LL);
}

uint64_t sub_100038FE8(uint64_t a1)
{
  return *(void *)(*(void *)(a1 + 32) + 8LL);
}

void sub_10003A288()
{
}

void sub_10003A298(id *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  v3[1] = a1;
  v3[0] = objc_loadWeakRetained(a1 + 4);
  [v3[0] selectWideLensButton];
  objc_storeStrong(v3, 0LL);
  objc_storeStrong(location, 0LL);
}

void sub_10003A310(id *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  v3[1] = a1;
  v3[0] = objc_loadWeakRetained(a1 + 4);
  [v3[0] selectUltraWideLensButton];
  objc_storeStrong(v3, 0LL);
  objc_storeStrong(location, 0LL);
}

id sub_10003A70C(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) nextFocusedView];
  unsigned __int8 v4 = [v3 isDescendantOfView:*(void *)(a1 + 40)];

  if ((v4 & 1) != 0) {
    return [*(id *)(a1 + 40) setContainsFocusedButton:1];
  }
  else {
    return [*(id *)(a1 + 40) setContainsFocusedButton:0];
  }
}

id sub_10003B2F4(uint64_t a1)
{
  unsigned __int8 v4 = 0;
  double v1 = 1.0;
  if ((v4 & 1) == 0) {
    double v1 = 0.0;
  }
  return [*(id *)(*(void *)(a1 + 32) + 32) setAlpha:v1];
}

void sub_10003BB18(id a1)
{
  double v1 = objc_alloc_init(&OBJC_CLASS___NSNumberFormatter);
  id v2 = (void *)qword_100221C20;
  qword_100221C20 = (uint64_t)v1;

  [(id)qword_100221C20 setGeneratesDecimalNumbers:1];
  objc_msgSend((id)qword_100221C20, "setNumberStyle:");
  [(id)qword_100221C20 setMinimumFractionDigits:0];
  [(id)qword_100221C20 setMaximumFractionDigits:1];
  [(id)qword_100221C20 setRoundingIncrement:&off_1001C8E70];
  [(id)qword_100221C20 setRoundingMode:2];
}

void sub_10003BEF4( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, int a12, int a13, _Unwind_Exception *exception_object, char a15, uint64_t a16, uint64_t a17, uint64_t a18, id a19)
{
}

void sub_10003BF20(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _updateItemsWithReason:@"Detected Bluetooth Change"];
}

void sub_10003BFE4(id a1)
{
  os_log_t v1 = os_log_create("com.apple.TVSystemUIService.menuItemProvider", "Peripherals");
  id v2 = (void *)qword_100221C30;
  qword_100221C30 = (uint64_t)v1;
}

BOOL sub_10003CA8C(id a1, TVSBluetoothDevice *a2)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  unsigned __int8 v3 = +[TVSSPeripheralsMenuItemProvider _isSupportedBluetoothDevice:]( &OBJC_CLASS___TVSSPeripheralsMenuItemProvider,  "_isSupportedBluetoothDevice:",  location[0]);
  objc_storeStrong(location, 0LL);
  return v3 & 1;
}

int64_t sub_10003CAFC(id a1, TVSBluetoothDevice *a2, TVSBluetoothDevice *a3)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  id v13 = 0LL;
  objc_storeStrong(&v13, a3);
  [location[0] lastConnectTime];
  double v12 = v3;
  id v4 = [v13 lastConnectTime];
  if ((BSFloatGreaterThanFloat(v4, v12, v5) & 1) != 0)
  {
    int64_t v15 = -1LL;
  }

  else
  {
    [location[0] lastConnectTime];
    double v10 = v6;
    id v7 = [v13 lastConnectTime];
    int64_t v15 = (BSFloatLessThanFloat(v7, v10, v8) & 1) != 0;
  }

  objc_storeStrong(&v13, 0LL);
  objc_storeStrong(location, 0LL);
  return v15;
}

uint64_t sub_10003CBFC(uint64_t result, uint64_t a2, uint64_t a3, int a4)
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

uint64_t sub_10003CD00(uint64_t a1)
{
  if (a1) {
    return *(void *)(a1 + 40);
  }
  else {
    return 0LL;
  }
}

void sub_10003D300( uint64_t a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, id *location)
{
  *(void *)(v23 - 176) = a1;
  *(_DWORD *)(v23 - 180) = a2;
  objc_destroyWeak(location);
  objc_destroyWeak((id *)(v23 - 128));
  _Unwind_Resume(*(_Unwind_Exception **)(v23 - 176));
}

void sub_10003D34C(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) superview];
  [v2 layoutIfNeeded];
}

void sub_10003D3B0(id *a1, void *a2)
{
  id location[3] = a1;
  id location[2] = a2;
  location[1] = a1;
  location[0] = objc_loadWeakRetained(a1 + 4);
  if (location[0]) {
    [location[0] satisfyMilestone:@"_TVSSMenuBarPassiveToInteractiveAnimationComplete"];
  }
  objc_storeStrong(location, 0LL);
}

void sub_10003D998( uint64_t a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, id *location)
{
  *(void *)(v23 - 176) = a1;
  *(_DWORD *)(v23 - 180) = a2;
  objc_destroyWeak(location);
  objc_destroyWeak((id *)(v23 - 128));
  _Unwind_Resume(*(_Unwind_Exception **)(v23 - 176));
}

void sub_10003D9E4(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) superview];
  [v1 layoutIfNeeded];
}

void sub_10003DA30(id *a1)
{
  id location[2] = a1;
  location[1] = a1;
  location[0] = objc_loadWeakRetained(a1 + 4);
  if (location[0]) {
    [location[0] satisfyMilestone:@"_TVSSMenuBarInteractiveToPassiveAnimationComplete"];
  }
  objc_storeStrong(location, 0LL);
}

uint64_t sub_10003E2FC(uint64_t a1)
{
  return *(void *)(*(void *)(a1 + 32) + 8LL);
}

id sub_10003E320(uint64_t a1)
{
  return *(id *)(*(void *)(a1 + 32) + 16LL);
}

id sub_10003E344(uint64_t a1)
{
  return *(id *)(*(void *)(a1 + 32) + 24LL);
}

id sub_10003EA50(unint64_t a1)
{
  if (a1 <= 5) {
    __asm { BR              X8 }
  }

  return v2;
}

uint64_t sub_10003EC58(uint64_t result, int a2)
{
  *(_BYTE *)result = 0;
  *(_BYTE *)(result + 1) = 1;
  *(_BYTE *)(result + 2) = 0;
  *(_BYTE *)(result + 3) = 4;
  *(_DWORD *)(result + 4) = a2;
  return result;
}

void sub_10003EF58(id a1)
{
  v4[0] = @"VisibleState";
  v4[1] = @"LingerState";
  v4[2] = @"LingerActiveState";
  id v4[3] = @"ActiveTimerExpiredState";
  double v3 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v4, 4LL);
  id v1 = +[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:");
  id v2 = (void *)qword_100221C48;
  qword_100221C48 = (uint64_t)v1;
}

void sub_10003F478(id *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  [a1[4] postEvent:@"TimerExpiredEvent"];
  objc_storeStrong(location, 0LL);
}

uint64_t sub_10003F4DC(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(_BYTE *)result = 0;
  *(_BYTE *)(result + 1) = 2;
  *(_BYTE *)(result + 2) = 0;
  *(_BYTE *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 0;
  *(_BYTE *)(result + 13) = 8;
  *(void *)(result + 14) = a3;
  return result;
}

void sub_10003F904( uint64_t a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id *a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id *location)
{
  *(void *)(v16 - 40) = a1;
  *(_DWORD *)(v16 - 44) = a2;
  objc_destroyWeak((id *)(v16 - 24));
  _Unwind_Resume(*(_Unwind_Exception **)(v16 - 40));
}

void sub_10003F97C(id *a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7)
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
  id v15 = 0LL;
  objc_storeStrong(&v15, a6);
  id v14 = 0LL;
  objc_storeStrong(&v14, a7);
  id WeakRetained = objc_loadWeakRetained(a1 + 4);
  [WeakRetained _handleStateTransitionFrom:v18 toState:v17];

  objc_storeStrong(&v14, 0LL);
  objc_storeStrong(&v15, 0LL);
  objc_storeStrong(&v16, 0LL);
  objc_storeStrong(&v17, 0LL);
  objc_storeStrong(&v18, 0LL);
  objc_storeStrong(location, 0LL);
}

NSString *__cdecl sub_10003FAA0(id a1, TVSStateMachine *a2, NSString *a3, id a4, NSDictionary *a5)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  id v12 = 0LL;
  objc_storeStrong(&v12, a3);
  id v11 = 0LL;
  objc_storeStrong(&v11, a4);
  id v10 = 0LL;
  objc_storeStrong(&v10, a5);
  id v9 = @"VisibleState";
  objc_storeStrong(&v10, 0LL);
  objc_storeStrong(&v11, 0LL);
  objc_storeStrong(&v12, 0LL);
  objc_storeStrong(location, 0LL);
  return (NSString *)v9;
}

NSString *__cdecl sub_10003FB70(id a1, TVSStateMachine *a2, NSString *a3, id a4, NSDictionary *a5)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  id v12 = 0LL;
  objc_storeStrong(&v12, a3);
  id v11 = 0LL;
  objc_storeStrong(&v11, a4);
  id v10 = 0LL;
  objc_storeStrong(&v10, a5);
  id v9 = @"VisibleState";
  objc_storeStrong(&v10, 0LL);
  objc_storeStrong(&v11, 0LL);
  objc_storeStrong(&v12, 0LL);
  objc_storeStrong(location, 0LL);
  return (NSString *)v9;
}

NSString *__cdecl sub_10003FC40(id a1, TVSStateMachine *a2, NSString *a3, id a4, NSDictionary *a5)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  id v12 = 0LL;
  objc_storeStrong(&v12, a3);
  id v11 = 0LL;
  objc_storeStrong(&v11, a4);
  id v10 = 0LL;
  objc_storeStrong(&v10, a5);
  id v9 = @"VisibleState";
  objc_storeStrong(&v10, 0LL);
  objc_storeStrong(&v11, 0LL);
  objc_storeStrong(&v12, 0LL);
  objc_storeStrong(location, 0LL);
  return (NSString *)v9;
}

NSString *__cdecl sub_10003FD10(id a1, TVSStateMachine *a2, NSString *a3, id a4, NSDictionary *a5)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  id v12 = 0LL;
  objc_storeStrong(&v12, a3);
  id v11 = 0LL;
  objc_storeStrong(&v11, a4);
  id v10 = 0LL;
  objc_storeStrong(&v10, a5);
  id v9 = @"HiddenState";
  objc_storeStrong(&v10, 0LL);
  objc_storeStrong(&v11, 0LL);
  objc_storeStrong(&v12, 0LL);
  objc_storeStrong(location, 0LL);
  return (NSString *)v9;
}

NSString *__cdecl sub_10003FDE0(id a1, TVSStateMachine *a2, NSString *a3, id a4, NSDictionary *a5)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  id v12 = 0LL;
  objc_storeStrong(&v12, a3);
  id v11 = 0LL;
  objc_storeStrong(&v11, a4);
  id v10 = 0LL;
  objc_storeStrong(&v10, a5);
  id v9 = @"HiddenState";
  objc_storeStrong(&v10, 0LL);
  objc_storeStrong(&v11, 0LL);
  objc_storeStrong(&v12, 0LL);
  objc_storeStrong(location, 0LL);
  return (NSString *)v9;
}

__CFString *sub_10003FEB0(id *a1, void *a2, void *a3, void *a4, void *a5)
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
  else {
    double v5 = @"LingerState";
  }
  id v11 = v5;
  objc_storeStrong(v12, 0LL);
  objc_storeStrong(&v13, 0LL);
  objc_storeStrong(&v14, 0LL);
  objc_storeStrong(&v15, 0LL);
  objc_storeStrong(location, 0LL);
  return v11;
}

void sub_100041530()
{
}

void sub_100041540(id *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  v3[1] = a1;
  v3[0] = objc_loadWeakRetained(a1 + 4);
  [v3[0] handleNewCaptureDevice:location[0]];
  [v3[0] notifyDelegate];
  objc_storeStrong(v3, 0LL);
  objc_storeStrong(location, 0LL);
}

void sub_1000415C8(id *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  v10[1] = a1;
  v10[0] = objc_loadWeakRetained(a1 + 4);
  id v3 = v10[0];
  id v4 = _NSConcreteStackBlock;
  int v5 = -1073741824;
  int v6 = 0;
  id v7 = sub_1000416CC;
  double v8 = &unk_1001B75D0;
  objc_copyWeak(&v9, a1 + 4);
  [v3 updateEffectsForSupport:1 enablement:1 controlModes:1 completion:&v4];
  objc_destroyWeak(&v9);
  objc_storeStrong(v10, 0LL);
  objc_storeStrong(location, 0LL);
}

void sub_1000416A8( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, int a14, int a15, _Unwind_Exception *exception_object, char a17, uint64_t a18, uint64_t a19, uint64_t a20, id a21)
{
}

void sub_1000416CC(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained notifyDelegate];
}

void sub_100041708(id *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  v10[1] = a1;
  v10[0] = objc_loadWeakRetained(a1 + 4);
  id v3 = v10[0];
  id v4 = _NSConcreteStackBlock;
  int v5 = -1073741824;
  int v6 = 0;
  id v7 = sub_100041808;
  double v8 = &unk_1001B75D0;
  objc_copyWeak(&v9, a1 + 4);
  [v3 updateMicModesForSupport:1 enablement:1 completion:&v4];
  objc_destroyWeak(&v9);
  objc_storeStrong(v10, 0LL);
  objc_storeStrong(location, 0LL);
}

void sub_1000417E4( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, int a14, int a15, _Unwind_Exception *exception_object, char a17, uint64_t a18, uint64_t a19, uint64_t a20, id a21)
{
}

void sub_100041808(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained notifyDelegate];
}

void sub_100041844(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained notifyDelegate];
}

void sub_100041884(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained notifyDelegate];
}

void sub_1000418C8(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained notifyDelegate];
}

void sub_100041908(id *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  v10[1] = a1;
  v10[0] = objc_loadWeakRetained(a1 + 4);
  id v3 = v10[0];
  id v4 = _NSConcreteStackBlock;
  int v5 = -1073741824;
  int v6 = 0;
  id v7 = sub_100041A18;
  double v8 = &unk_1001B75D0;
  objc_copyWeak(&v9, a1 + 4);
  [v3 updateEffectsForSupport:1 enablement:1 controlModes:0 completion:&v4];
  objc_destroyWeak(&v9);
  objc_storeStrong(v10, 0LL);
  objc_storeStrong(location, 0LL);
}

void sub_1000419F4( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, int a16, int a17, _Unwind_Exception *exception_object, char a19, uint64_t a20, uint64_t a21, uint64_t a22, id a23)
{
}

void sub_100041A18(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained notifyDelegate];
}

void sub_100041A54(id *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  v10[1] = a1;
  v10[0] = objc_loadWeakRetained(a1 + 4);
  id v3 = v10[0];
  id v4 = _NSConcreteStackBlock;
  int v5 = -1073741824;
  int v6 = 0;
  id v7 = sub_100041B64;
  double v8 = &unk_1001B75D0;
  objc_copyWeak(&v9, a1 + 4);
  [v3 updateEffectsForSupport:0 enablement:1 controlModes:0 completion:&v4];
  objc_destroyWeak(&v9);
  objc_storeStrong(v10, 0LL);
  objc_storeStrong(location, 0LL);
}

void sub_100041B40( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, int a16, int a17, _Unwind_Exception *exception_object, char a19, uint64_t a20, uint64_t a21, uint64_t a22, id a23)
{
}

void sub_100041B64(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained notifyDelegate];
}

void sub_100041BA0(id *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  v10[1] = a1;
  v10[0] = objc_loadWeakRetained(a1 + 4);
  id v3 = v10[0];
  id v4 = _NSConcreteStackBlock;
  int v5 = -1073741824;
  int v6 = 0;
  id v7 = sub_100041CB0;
  double v8 = &unk_1001B75D0;
  objc_copyWeak(&v9, a1 + 4);
  [v3 updateEffectsForSupport:0 enablement:0 controlModes:1 completion:&v4];
  objc_destroyWeak(&v9);
  objc_storeStrong(v10, 0LL);
  objc_storeStrong(location, 0LL);
}

void sub_100041C8C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, int a16, int a17, _Unwind_Exception *exception_object, char a19, uint64_t a20, uint64_t a21, uint64_t a22, id a23)
{
}

void sub_100041CB0(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained notifyDelegate];
}

void sub_100041CEC(id *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  v10[1] = a1;
  v10[0] = objc_loadWeakRetained(a1 + 4);
  id v3 = v10[0];
  id v4 = _NSConcreteStackBlock;
  int v5 = -1073741824;
  int v6 = 0;
  id v7 = sub_100041DF8;
  double v8 = &unk_1001B75D0;
  objc_copyWeak(&v9, a1 + 4);
  [v3 updateMicModesForSupport:1 enablement:0 completion:&v4];
  objc_destroyWeak(&v9);
  objc_storeStrong(v10, 0LL);
  objc_storeStrong(location, 0LL);
}

void sub_100041DD4( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, int a16, int a17, _Unwind_Exception *exception_object, char a19, uint64_t a20, uint64_t a21, uint64_t a22, id a23)
{
}

void sub_100041DF8(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained notifyDelegate];
}

void sub_100041E34(id *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  v10[1] = a1;
  v10[0] = objc_loadWeakRetained(a1 + 4);
  id v3 = v10[0];
  id v4 = _NSConcreteStackBlock;
  int v5 = -1073741824;
  int v6 = 0;
  id v7 = sub_100041F40;
  double v8 = &unk_1001B75D0;
  objc_copyWeak(&v9, a1 + 4);
  [v3 updateMicModesForSupport:0 enablement:1 completion:&v4];
  objc_destroyWeak(&v9);
  objc_storeStrong(v10, 0LL);
  objc_storeStrong(location, 0LL);
}

void sub_100041F1C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, int a16, int a17, _Unwind_Exception *exception_object, char a19, uint64_t a20, uint64_t a21, uint64_t a22, id a23)
{
}

void sub_100041F40(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained notifyDelegate];
}

void sub_100041F7C(uint64_t a1, char a2)
{
  char v3 = a2 & 1;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setShouldApplyTransform:v3 & 1];
}

void sub_100041FCC(id *a1, uint64_t a2, char a3)
{
  id v9 = a1;
  uint64_t v8 = a2;
  char v7 = a3 & 1;
  v6[1] = a1;
  v6[0] = objc_loadWeakRetained(a1 + 4);
  id v3 = [v6[0] onSampleBufferChange];
  BOOL v5 = v3 == 0LL;

  if (!v5)
  {
    id v4 = (void (**)(id, uint64_t, void))[v6[0] onSampleBufferChange];
    v4[2](v4, v8, v7 & 1);
  }

  [v6[0] setValidPreviewBufferStream:v7 & 1];
  objc_storeStrong(v6, 0LL);
}

LABEL_9:
  id v3 = location[0];
  objc_storeStrong(location, 0LL);
  return (TVSSMicMode *)v3;
}

  -[TVSSCameraZoomAdjustmentControl _setValue:animated:notify:]( v15,  "_setValue:animated:notify:",  1LL,  1LL,  maximumValue);
  objc_storeStrong(location, 0LL);
}

  -[TVSSCameraZoomAdjustmentControl _setValue:animated:notify:]( v15,  "_setValue:animated:notify:",  1LL,  1LL,  minimumValue);
  objc_storeStrong(location, 0LL);
}

  char v7 = [v17 displayName];
  int v6 = [v17 systemImageName];
  id v4 = +[UIImage _systemImageNamed:](&OBJC_CLASS___UIImage, "_systemImageNamed:");
  [v17 isEnabled];
  BOOL v5 =  +[TVSPContent contentWithTitle:image:text1:isSelected:]( &OBJC_CLASS___TVSPContent,  "contentWithTitle:image:text1:isSelected:",  v7,  v4);

  objc_storeStrong(&v17, 0LL);
  objc_storeStrong(location, 0LL);
  return v5;
}

uint64_t sub_1000430D8(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  *(_BYTE *)result = 2;
  *(_BYTE *)(result + 1) = 3;
  *(_BYTE *)(result + 2) = 66;
  *(_BYTE *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 0;
  *(_BYTE *)(result + 13) = 4;
  *(_DWORD *)(result + 14) = a3;
  *(_BYTE *)(result + 18) = 66;
  *(_BYTE *)(result + 19) = 8;
  *(void *)(result + 20) = a4;
  return result;
}

uint64_t sub_1000433AC(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  *(_BYTE *)result = 2;
  *(_BYTE *)(result + 1) = 3;
  *(_BYTE *)(result + 2) = 0;
  *(_BYTE *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 0;
  *(_BYTE *)(result + 13) = 4;
  *(_DWORD *)(result + 14) = a3;
  *(_BYTE *)(result + 18) = 66;
  *(_BYTE *)(result + 19) = 8;
  *(void *)(result + 20) = a4;
  return result;
}

void sub_100043540( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, int a15, int a16, _Unwind_Exception *exception_object, char a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, id a23)
{
}

void sub_10004356C(uint64_t a1)
{
  v30[2] = (id)a1;
  v30[1] = (id)a1;
  v30[0] = objc_loadWeakRetained((id *)(a1 + 40));
  if (v30[0])
  {
    id v28 = -[NSMutableDictionary initWithDictionary:copyItems:]( objc_alloc(&OBJC_CLASS___NSMutableDictionary),  "initWithDictionary:copyItems:",  *((void *)v30[0] + 6),  1LL);
    id v7 = [*((id *)v30[0] + 9) cameraAppInfo];
    id v27 = [v7 bundleIdentifier];

    id v26 = *((id *)v30[0] + 10);
    if ((*(_BYTE *)(a1 + 48) & 1) != 0)
    {
      id v25 = [v28 objectForKeyedSubscript:AVControlCenterVideoEffectCenterStage];
      objc_msgSend( v25,  "setSupported:",  (unint64_t)objc_msgSend( v26,  "isEffectSupported:forBundleID:",  AVControlCenterVideoEffectCenterStage,  v27) & 1);
      objc_msgSend( v25,  "setUnavailable:",  (unint64_t)objc_msgSend( v26,  "isEffectUnavailable:forBundleID:",  AVControlCenterVideoEffectCenterStage,  v27) & 1);
      id v24 = [v28 objectForKeyedSubscript:AVControlCenterVideoEffectBackgroundBlur];
      objc_msgSend( v24,  "setSupported:",  (unint64_t)objc_msgSend( v26,  "isEffectSupported:forBundleID:",  AVControlCenterVideoEffectBackgroundBlur,  v27) & 1);
      objc_msgSend( v24,  "setUnavailable:",  (unint64_t)objc_msgSend( v26,  "isEffectUnavailable:forBundleID:",  AVControlCenterVideoEffectBackgroundBlur,  v27) & 1);
      id v23 = [v28 objectForKeyedSubscript:AVControlCenterVideoEffectStudioLighting];
      objc_msgSend( v23,  "setSupported:",  (unint64_t)objc_msgSend( v26,  "isEffectSupported:forBundleID:",  AVControlCenterVideoEffectStudioLighting,  v27) & 1);
      objc_msgSend( v23,  "setUnavailable:",  (unint64_t)objc_msgSend( v26,  "isEffectUnavailable:forBundleID:",  AVControlCenterVideoEffectStudioLighting,  v27) & 1);
      id v22 = [v28 objectForKeyedSubscript:AVControlCenterVideoEffectReactions];
      objc_msgSend( v22,  "setSupported:",  (unint64_t)objc_msgSend(v26, "isEffectSupported:forBundleID:", AVControlCenterVideoEffectReactions, v27) & 1);
      objc_msgSend( v22,  "setUnavailable:",  (unint64_t)objc_msgSend( v26,  "isEffectUnavailable:forBundleID:",  AVControlCenterVideoEffectReactions,  v27) & 1);
      id v21 = [v28 objectForKeyedSubscript:AVControlCenterVideoEffectGestures];
      objc_msgSend( v21,  "setSupported:",  (unint64_t)objc_msgSend(v26, "isEffectSupported:forBundleID:", AVControlCenterVideoEffectGestures, v27) & 1);
      objc_msgSend( v21,  "setUnavailable:",  (unint64_t)objc_msgSend(v26, "isEffectUnavailable:forBundleID:", AVControlCenterVideoEffectGestures, v27) & 1);
      objc_storeStrong(&v21, 0LL);
      objc_storeStrong(&v22, 0LL);
      objc_storeStrong(&v23, 0LL);
      objc_storeStrong(&v24, 0LL);
      objc_storeStrong(&v25, 0LL);
    }

    if ((*(_BYTE *)(a1 + 49) & 1) != 0)
    {
      id v20 = [v28 objectForKeyedSubscript:AVControlCenterVideoEffectCenterStage];
      objc_msgSend( v20,  "setEnabled:",  (unint64_t)objc_msgSend(v26, "isEffectEnabled:forBundleID:", AVControlCenterVideoEffectCenterStage, v27) & 1);
      id v19 = [v28 objectForKeyedSubscript:AVControlCenterVideoEffectBackgroundBlur];
      objc_msgSend( v19,  "setEnabled:",  (unint64_t)objc_msgSend( v26,  "isEffectEnabled:forBundleID:",  AVControlCenterVideoEffectBackgroundBlur,  v27) & 1);
      id v18 = [v28 objectForKeyedSubscript:AVControlCenterVideoEffectStudioLighting];
      objc_msgSend( v18,  "setEnabled:",  (unint64_t)objc_msgSend( v26,  "isEffectEnabled:forBundleID:",  AVControlCenterVideoEffectStudioLighting,  v27) & 1);
      id v17 = [v28 objectForKeyedSubscript:AVControlCenterVideoEffectReactions];
      objc_msgSend( v17,  "setEnabled:",  (unint64_t)objc_msgSend(v26, "isEffectEnabled:forBundleID:", AVControlCenterVideoEffectReactions, v27) & 1);
      id v16 = [v28 objectForKeyedSubscript:AVControlCenterVideoEffectGestures];
      objc_msgSend( v16,  "setEnabled:",  (unint64_t)objc_msgSend(v26, "isEffectEnabled:forBundleID:", AVControlCenterVideoEffectGestures, v27) & 1);
      objc_storeStrong(&v16, 0LL);
      objc_storeStrong(&v17, 0LL);
      objc_storeStrong(&v18, 0LL);
      objc_storeStrong(&v19, 0LL);
      objc_storeStrong(&v20, 0LL);
    }

    if ((*(_BYTE *)(a1 + 50) & 1) != 0)
    {
      id v15 = [v28 objectForKeyedSubscript:AVControlCenterVideoEffectCenterStage];
      objc_msgSend( v15,  "setControlMode:",  objc_msgSend(v26, "effectControlMode:forBundleID:", AVControlCenterVideoEffectCenterStage, v27));
      id v14 = [v28 objectForKeyedSubscript:AVControlCenterVideoEffectBackgroundBlur];
      objc_msgSend( v14,  "setControlMode:",  objc_msgSend(v26, "effectControlMode:forBundleID:", AVControlCenterVideoEffectBackgroundBlur, v27));
      id v13 = [v28 objectForKeyedSubscript:AVControlCenterVideoEffectStudioLighting];
      objc_msgSend( v13,  "setControlMode:",  objc_msgSend(v26, "effectControlMode:forBundleID:", AVControlCenterVideoEffectStudioLighting, v27));
      id v12 = [v28 objectForKeyedSubscript:AVControlCenterVideoEffectReactions];
      objc_msgSend( v12,  "setControlMode:",  objc_msgSend(v26, "effectControlMode:forBundleID:", AVControlCenterVideoEffectReactions, v27));
      id v11 = [v28 objectForKeyedSubscript:AVControlCenterVideoEffectGestures];
      objc_msgSend( v11,  "setControlMode:",  objc_msgSend(v26, "effectControlMode:forBundleID:", AVControlCenterVideoEffectGestures, v27));
      objc_storeStrong(&v11, 0LL);
      objc_storeStrong(&v12, 0LL);
      objc_storeStrong(&v13, 0LL);
      objc_storeStrong(&v14, 0LL);
      objc_storeStrong(&v15, 0LL);
    }

    id v1 = objc_alloc(&OBJC_CLASS___NSMutableSet);
    id v3 = [v28 allValues];
    id v2 = [v3 copy];
    id v10 = -[NSMutableSet initWithArray:](v1, "initWithArray:");

    id v4 = objc_alloc(&OBJC_CLASS___NSSet);
    id v6 = [*((id *)v30[0] + 6) allValues];
    BOOL v5 = -[NSSet initWithArray:](v4, "initWithArray:");
    objc_msgSend(v10, "minusSet:");

    [v30[0] setVideoEffects:v28];
    if ([v10 count])
    {
      id v9 = VideoMicBackingStoreLog();
      if (os_log_type_enabled((os_log_t)v9, OS_LOG_TYPE_DEFAULT))
      {
        sub_10002F860((uint64_t)v31, (uint64_t)v10, (uint64_t)v27);
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v9,  OS_LOG_TYPE_DEFAULT,  "Updated video effects: %{public}@, bundleID: %{public}@",  v31,  0x16u);
      }

      objc_storeStrong(&v9, 0LL);
    }

    (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
    objc_storeStrong(&v10, 0LL);
    objc_storeStrong(&v26, 0LL);
    objc_storeStrong(&v27, 0LL);
    objc_storeStrong(&v28, 0LL);
    int v29 = 0;
  }

  else
  {
    int v29 = 1;
  }

  objc_storeStrong(v30, 0LL);
}

void sub_1000441E0( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, int a15, int a16, _Unwind_Exception *exception_object, char a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, id a23)
{
}

void sub_10004420C(uint64_t a1)
{
  v21[2] = (id)a1;
  v21[1] = (id)a1;
  v21[0] = objc_loadWeakRetained((id *)(a1 + 40));
  if (v21[0])
  {
    id v19 = -[NSMutableDictionary initWithDictionary:copyItems:]( objc_alloc(&OBJC_CLASS___NSMutableDictionary),  "initWithDictionary:copyItems:",  *((void *)v21[0] + 7),  1LL);
    id v7 = [*((id *)v21[0] + 9) micAppInfo];
    id v18 = [v7 bundleIdentifier];

    id v17 = *((id *)v21[0] + 10);
    if ((*(_BYTE *)(a1 + 48) & 1) != 0)
    {
      id v16 = [v19 objectForKeyedSubscript:&off_1001C8978];
      objc_msgSend( v16,  "setSupported:",  (unint64_t)objc_msgSend(v17, "isModeSupported:forBundleID:", 0, v18) & 1);
      id v15 = [v19 objectForKeyedSubscript:&off_1001C8990];
      objc_msgSend( v15,  "setSupported:",  (unint64_t)objc_msgSend(v17, "isModeSupported:forBundleID:", 2, v18) & 1);
      id v14 = [v19 objectForKeyedSubscript:&off_1001C89A8];
      objc_msgSend( v14,  "setSupported:",  (unint64_t)objc_msgSend(v17, "isModeSupported:forBundleID:", 1, v18) & 1);
      objc_storeStrong(&v14, 0LL);
      objc_storeStrong(&v15, 0LL);
      objc_storeStrong(&v16, 0LL);
    }

    if ((*(_BYTE *)(a1 + 49) & 1) != 0)
    {
      id v13 = [v19 objectForKeyedSubscript:&off_1001C8978];
      objc_msgSend(v13, "setEnabled:", (unint64_t)objc_msgSend(v17, "isModeEnabled:forBundleID:", 0, v18) & 1);
      id v12 = [v19 objectForKeyedSubscript:&off_1001C8990];
      objc_msgSend(v12, "setEnabled:", (unint64_t)objc_msgSend(v17, "isModeEnabled:forBundleID:", 2, v18) & 1);
      id v11 = [v19 objectForKeyedSubscript:&off_1001C89A8];
      objc_msgSend(v11, "setEnabled:", (unint64_t)objc_msgSend(v17, "isModeEnabled:forBundleID:", 1, v18) & 1);
      objc_storeStrong(&v11, 0LL);
      objc_storeStrong(&v12, 0LL);
      objc_storeStrong(&v13, 0LL);
    }

    id v1 = objc_alloc(&OBJC_CLASS___NSMutableSet);
    id v3 = [v19 allValues];
    id v2 = [v3 copy];
    id v10 = -[NSMutableSet initWithArray:](v1, "initWithArray:");

    id v4 = objc_alloc(&OBJC_CLASS___NSSet);
    id v6 = [*((id *)v21[0] + 7) allValues];
    BOOL v5 = -[NSSet initWithArray:](v4, "initWithArray:");
    objc_msgSend(v10, "minusSet:");

    [v21[0] setMicModes:v19];
    if ([v10 count])
    {
      id v9 = VideoMicBackingStoreLog();
      if (os_log_type_enabled((os_log_t)v9, OS_LOG_TYPE_DEFAULT))
      {
        sub_10002F860((uint64_t)v22, (uint64_t)v10, (uint64_t)v18);
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v9,  OS_LOG_TYPE_DEFAULT,  "Updated mic modes: %{public}@, bundleID: %{public}@",  v22,  0x16u);
      }

      objc_storeStrong(&v9, 0LL);
    }

    (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
    objc_storeStrong(&v10, 0LL);
    objc_storeStrong(&v17, 0LL);
    objc_storeStrong(&v18, 0LL);
    objc_storeStrong(&v19, 0LL);
    int v20 = 0;
  }

  else
  {
    int v20 = 1;
  }

  objc_storeStrong(v21, 0LL);
}

void sub_100044838(id *a1)
{
  id v2[2] = a1;
  v2[1] = a1;
  v2[0] = objc_loadWeakRetained(a1 + 4);
  id v1 = [v2[0] delegate];
  [v1 videoMicBackingStoreDidChange:v2[0]];

  objc_storeStrong(v2, 0LL);
}

id sub_100044BEC(void *a1, uint64_t a2)
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

id sub_100045B2C(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "identifier", a1, a1);
}

id sub_100045B5C(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "displayName", a1, a1);
}

id sub_100045B8C(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "systemImageName", a1, a1);
}

id sub_100045BBC(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "enabledSystemImageName", a1, a1);
}

unint64_t sub_100045BEC(uint64_t a1)
{
  return (unint64_t)objc_msgSend(*(id *)(a1 + 32), "isEnabled", a1, a1) & 1;
}

unint64_t sub_100045C20(uint64_t a1)
{
  return (unint64_t)objc_msgSend(*(id *)(a1 + 32), "isSupported", a1, a1) & 1;
}

unint64_t sub_100045C54(uint64_t a1)
{
  return (unint64_t)objc_msgSend(*(id *)(a1 + 32), "isUnavailable", a1, a1) & 1;
}

id sub_100045C88(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "controlMode", a1, a1);
}

void sub_1000462A4(uint64_t a1)
{
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  id v2 = (void *)qword_100221C50;
  qword_100221C50 = (uint64_t)v1;
}

void sub_100046448(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  objc_msgSend( v2,  "networkInterfaceManager:didChangeInternetAvailability:",  *(void *)(a1 + 32),  (unint64_t)+[PBSSystemStatus isInternetAvailable](PBSSystemStatus, "isInternetAvailable") & 1);
}

void sub_10004695C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _publishNetworkState];
}

id sub_1000472D8(void *a1, uint64_t a2)
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

uint64_t sub_100047398(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(_BYTE *)result = 2;
  *(_BYTE *)(result + 1) = 3;
  *(_BYTE *)(result + 2) = 32;
  *(_BYTE *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 64;
  *(_BYTE *)(result + 13) = 8;
  *(void *)(result + 14) = a3;
  *(_BYTE *)(result + 22) = 64;
  *(_BYTE *)(result + 23) = 8;
  *(void *)(result + 24) = a4;
  return result;
}

void sub_100047D78( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, int a15, int a16, _Unwind_Exception *exception_object, char a18, uint64_t a19, uint64_t a20, uint64_t a21, id a22)
{
}

void sub_100047DA4(id *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  id WeakRetained = objc_loadWeakRetained(a1 + 4);
  [WeakRetained _loadVPNConfigurations];

  objc_storeStrong(location, 0LL);
}

void sub_100047EF0(id *a1, void *a2, void *a3)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  id v8 = 0LL;
  objc_storeStrong(&v8, a3);
  v7[1] = a1;
  if (v8)
  {
    os_log_t oslog = (os_log_t)NetworkControllerLog();
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      sub_10000D28C((uint64_t)v10, (uint64_t)v8);
      _os_log_impl( (void *)&_mh_execute_header,  oslog,  OS_LOG_TYPE_DEFAULT,  "Failed to load VPN configurations %@",  v10,  0xCu);
    }

    objc_storeStrong((id *)&oslog, 0LL);
  }

  else
  {
    v7[0] = NetworkControllerLog();
    os_log_type_t v6 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v7[0], OS_LOG_TYPE_DEFAULT))
    {
      sub_100014A50((uint64_t)v11, (uint64_t)"-[TVSSNetworkController _loadVPNConfigurations]_block_invoke");
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v7[0],  v6,  "%s: VPN configured change detected. Will update network state",  v11,  0xCu);
    }

    objc_storeStrong(v7, 0LL);
    [a1[4] setVpnConfigurations:location[0]];
    [a1[4] _notePublishNetworkStateNeeded];
  }

  objc_storeStrong(&v8, 0LL);
  objc_storeStrong(location, 0LL);
}

void sub_1000485B0(void *a1, void *a2, void *a3, void *a4)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  id v8 = 0LL;
  objc_storeStrong(&v8, a3);
  id v7 = 0LL;
  objc_storeStrong(&v7, a4);
  [location[0] networkController:a1[4] didChangeNetworkState:a1[5]];
  objc_storeStrong(&v7, 0LL);
  objc_storeStrong(&v8, 0LL);
  objc_storeStrong(location, 0LL);
}

uint64_t sub_100048684(uint64_t a1)
{
  if (a1) {
    return *(void *)(a1 + 56);
  }
  else {
    return 0LL;
  }
}

void sub_1000488A0(void *a1)
{
  id v12 = a1;
  if (a1)
  {
    id v7 = [v12 animationContext];
    id v6 = [v7 currentBannerContext];
    id v11 = [v6 transitioningBannerPresentable];

    if (sub_100048BC8(v12))
    {
      id v5 = [v12 animationContext];
      id v10 = [v5 bannerContainerViewController];

      [v10 addChildViewController:v11];
      if (TVSSBannerPresentableAppearsInsidePillView(v11))
      {
        sub_100048F54(v12);
      }

      else
      {
        id v3 = objc_alloc(&OBJC_CLASS____TVSSBannerPresentToastSubTransaction);
        id v4 = [v12 animationContext];
        id v9 = -[_TVSSMenuBarAbstractAnimationTransaction initWithAnimationContext:animated:]( v3,  "initWithAnimationContext:animated:",  v4,  (unint64_t)[v12 animated] & 1);

        [v12 addChildTransaction:v9];
        objc_storeStrong((id *)&v9, 0LL);
      }

      [v11 didMoveToParentViewController:v10];
      objc_storeStrong(&v10, 0LL);
    }

    else if (sub_100048CB0(v12))
    {
      if (TVSSBannerPresentableAppearsInsidePillView(v11))
      {
        sub_100049494(v12);
      }

      else
      {
        id v1 = objc_alloc(&OBJC_CLASS____TVSSBannerDismissToastSubTransaction);
        id v2 = [v12 animationContext];
        id v8 = -[_TVSSMenuBarAbstractAnimationTransaction initWithAnimationContext:animated:]( v1,  "initWithAnimationContext:animated:",  v2,  (unint64_t)[v12 animated] & 1);

        [v12 addChildTransaction:v8];
        objc_storeStrong((id *)&v8, 0LL);
      }
    }

    objc_storeStrong(&v11, 0LL);
  }

void sub_100048B10(void *a1)
{
  id v4 = a1;
  if (a1)
  {
    id v1 = objc_alloc(&OBJC_CLASS____TVSSMenuBarBasicAnimationTransaction);
    id v2 = [v4 animationContext];
    id v3 = -[_TVSSMenuBarAbstractAnimationTransaction initWithAnimationContext:animated:]( v1,  "initWithAnimationContext:animated:",  v2,  (unint64_t)[v4 animated] & 1);

    [v4 addChildTransaction:v3];
    objc_storeStrong((id *)&v3, 0LL);
  }

BOOL sub_100048BC8(void *a1)
{
  if (a1)
  {
    id v3 = [a1 animationContext];
    id v2 = [v3 currentBannerContext];
    id v4 = [v2 bannerPresentationState];

    BOOL v5 = 0;
    return v5;
  }

  else
  {
    return 0;
  }

BOOL sub_100048CB0(void *a1)
{
  if (a1)
  {
    id v3 = [a1 animationContext];
    id v2 = [v3 currentBannerContext];
    id v4 = [v2 bannerPresentationState];

    BOOL v5 = 0;
    return v5;
  }

  else
  {
    return 0;
  }

void sub_100048F54(void *a1)
{
  id v38 = a1;
  if (a1)
  {
    SEL v37 = "_presentBulletinBanner";
    id v22 = [v38 animationContext];
    id v21 = [v22 currentBannerContext];
    id v36 = [v21 transitioningBannerPresentable];

    id v1 = [v36 pillContentView];
    BOOL v20 = v1 == 0LL;

    if (v20)
    {
      v35 =  +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"[presentable pillContentView] != nil");
      id v34 = &_os_log_default;
      char v33 = 16;
      if (os_log_type_enabled((os_log_t)v34, OS_LOG_TYPE_ERROR))
      {
        log = (os_log_s *)v34;
        os_log_type_t type = v33;
        id v19 = NSStringFromSelector(v37);
        id v15 = v19;
        v32 = v15;
        id v2 = (objc_class *)objc_opt_class(v38);
        id v18 = NSStringFromClass(v2);
        id v31 = v18;
        sub_10000583C( (uint64_t)v40,  (uint64_t)v15,  (uint64_t)v31,  (uint64_t)v38,  (uint64_t)@"_TVSSMenuBarBaseBannerAnimationTransaction.m",  136,  (uint64_t)v35);
        _os_log_error_impl( (void *)&_mh_execute_header,  log,  type,  "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@",  v40,  0x3Au);

        objc_storeStrong((id *)&v31, 0LL);
        objc_storeStrong((id *)&v32, 0LL);
      }

      objc_storeStrong(&v34, 0LL);
      _bs_set_crash_log_message(-[NSString UTF8String](v35, "UTF8String"));
      __break(0);
      JUMPOUT(0x1000491B0LL);
    }

    id v7 = [v38 animationContext];
    id v30 = [v7 pillView];

    [v30 setContentStylingHidden:0];
    memcpy(__dst, &CGAffineTransformIdentity, sizeof(__dst));
    [v30 setTransform:__dst];
    [v30 setAlpha:1.0];
    id v28 = [v36 pillContentView];
    [v28 setTranslatesAutoresizingMaskIntoConstraints:0];
    +[TVSSConstants bannerMinimumSize](&OBJC_CLASS___TVSSConstants, "bannerMinimumSize");
    double v26 = v3;
    double v27 = v4;
    +[TVSSConstants bannerMaximumSize](&OBJC_CLASS___TVSSConstants, "bannerMaximumSize");
    double v24 = v5;
    uint64_t v25 = v6;
    id v14 = [v28 widthAnchor];
    id v13 = [v14 constraintGreaterThanOrEqualToConstant:v26];
    v39[0] = v13;
    id v12 = [v28 widthAnchor];
    id v11 = [v12 constraintLessThanOrEqualToConstant:v24];
    v39[1] = v11;
    id v10 = [v28 heightAnchor];
    id v9 = [v10 constraintGreaterThanOrEqualToConstant:v27];
    void v39[2] = v9;
    id v8 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v39, 3LL);
    +[NSLayoutConstraint activateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "activateConstraints:");

    id v23 = [v30 _transactionToSetContentView:v28 withTransition:2];
    [v38 addChildTransaction:v23];
    objc_storeStrong(&v23, 0LL);
    objc_storeStrong(&v28, 0LL);
    objc_storeStrong(&v30, 0LL);
    objc_storeStrong(&v36, 0LL);
  }

void sub_100049494(void *a1)
{
  id v14 = a1;
  if (a1)
  {
    id v3 = [v14 animationContext];
    id v13 = [v3 pillView];

    id v4 = [v14 animationContext];
    id v12 = [v4 pillContentViewProvider];

    id v5 = [v14 animationContext];
    objc_msgSend(v12, "setMode:", objc_msgSend(v5, "menuMode"));

    id v11 = [v12 contentView];
    id location = [v13 _transactionToSetContentView:v11 withTransition:3];
    [v14 addChildTransaction:location];
    id v6 = [v14 animationContext];
    char HasBackgroundForMode = TVSSMenuBarHasBackgroundForMode((uint64_t)[v6 menuMode]);

    [v13 setContentStylingHidden:!(HasBackgroundForMode & 1)];
    id v8 = [v14 animationContext];
    BOOL v9 = [v8 menuMode] != (id)4;

    if (v9)
    {
      double v1 = 0.0;
      if ((HasBackgroundForMode & 1) != 0) {
        double v1 = 1.0;
      }
      [v13 setAlpha:v1];
    }

    else
    {
      [v13 setAlpha:1.0];
    }

    objc_msgSend(v13, "layoutIfNeeded", &v13);
    objc_storeStrong(&location, 0LL);
    objc_storeStrong(&v11, 0LL);
    objc_storeStrong(&v12, 0LL);
    objc_storeStrong(v2, 0LL);
  }

void sub_10004AF6C(uint64_t a1, void *a2)
{
  location[1] = (id)a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  id v2 = [location[0] contentImage];
  BOOL v9 = v2 != 0LL;

  id v3 = [location[0] contentText1];
  BOOL v10 = v3 != 0LL;

  BOOL v11 = 0;
  if (!v9) {
    BOOL v11 = !v10;
  }
  [*(id *)(a1 + 32) setActive:v11];
  [*(id *)(a1 + 40) setActive:v9];
  [*(id *)(a1 + 48) setActive:v10];
  [*(id *)(a1 + 56) setActive:v10];
  [*(id *)(a1 + 64) setActive:v9];
  if (v9)
  {
    id v7 = [location[0] contentImage];
    [v7 size];
    double v12 = v4;
    double v13 = v5;

    else {
      double v6 = (double)1LL;
    }
    objc_msgSend(*(id *)(a1 + 64), "setConstant:", *(double *)(a1 + 72) * (v12 / v6), *(void *)&v6);
  }

  objc_storeStrong(location, 0LL);
}

void sub_10004C298()
{
}

void sub_10004C2A8(id *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  id WeakRetained = objc_loadWeakRetained(a1 + 4);
  [WeakRetained _updateState];

  objc_storeStrong(location, 0LL);
}

void sub_10004C310(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _timerFired];
}

uint64_t sub_10004C34C(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(_BYTE *)result = 2;
  *(_BYTE *)(result + 1) = 3;
  *(_BYTE *)(result + 2) = 64;
  *(_BYTE *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 64;
  *(_BYTE *)(result + 13) = 8;
  *(void *)(result + 14) = a3;
  *(_BYTE *)(result + 22) = 0;
  *(_BYTE *)(result + 23) = 8;
  *(void *)(result + 24) = a4;
  return result;
}

uint64_t sub_10004CC78(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  *(_BYTE *)result = 0;
  *(_BYTE *)(result + 1) = 4;
  *(_BYTE *)(result + 2) = 0;
  *(_BYTE *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 0;
  *(_BYTE *)(result + 13) = 8;
  *(void *)(result + 14) = a3;
  *(_BYTE *)(result + 22) = 0;
  *(_BYTE *)(result + 23) = 8;
  *(void *)(result + 24) = a4;
  *(_BYTE *)(result + 32) = 0;
  *(_BYTE *)(result + 33) = 8;
  *(void *)(result + 34) = a5;
  return result;
}

id sub_10004CE3C(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateState", a1, a1);
}

void sub_10004D480(void *a1, void *a2, void *a3, void *a4)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  id v8 = 0LL;
  objc_storeStrong(&v8, a3);
  id v7 = 0LL;
  objc_storeStrong(&v7, a4);
  objc_msgSend( location[0],  "pixelShifter:didUpdateOffset:",  a1[4],  *(double *)(a1[4] + 64),  *(double *)(a1[4] + 72));
  objc_storeStrong(&v7, 0LL);
  objc_storeStrong(&v8, 0LL);
  objc_storeStrong(location, 0LL);
}

uint64_t sub_10004D540(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(_BYTE *)result = 2;
  *(_BYTE *)(result + 1) = 2;
  *(_BYTE *)(result + 2) = 64;
  *(_BYTE *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 0;
  *(_BYTE *)(result + 13) = 8;
  *(void *)(result + 14) = a3;
  return result;
}

void sub_10004E974(unint64_t a1, int a2)
{
  id v3 = (id *)STACK[0x2E0];
  STACK[0x3E8] = a1;
  LODWORD(STACK[0x3E4]) = a2;
  objc_destroyWeak(v3);
  objc_destroyWeak((id *)&STACK[0x460]);
  _Unwind_Resume((_Unwind_Exception *)STACK[0x3E8]);
}

void sub_10004E9E0(uint64_t a1, void *a2)
{
  location[1] = (id)a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  id v4 = [location[0] contentText1];
  BOOL v5 = [v4 length] != 0;

  [*(id *)(a1 + 32) setActive:v5];
  [*(id *)(a1 + 40) setActive:!v5];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  unsigned __int8 v7 = [WeakRetained hasSquareArtwork];

  BOOL v9 = *(void **)(a1 + 48);
  if ((v7 & 1) != 0) {
    [v9 setConstant:*(double *)(a1 + 80)];
  }
  else {
    [v9 setConstant:*(double *)(a1 + 96)];
  }
  id v3 = *(void **)(a1 + 56);
  if ((v7 & 1) != 0) {
    objc_msgSend(v3, "setConstant:", *(double *)(a1 + 88), *(void *)(a1 + 88));
  }
  else {
    objc_msgSend(v3, "setConstant:", *(double *)(a1 + 104), *(void *)(a1 + 104));
  }
  double v2 = 16.0;
  if ((v7 & 1) == 0) {
    double v2 = 12.0;
  }
  [*(id *)(a1 + 64) setConstant:v2];
  objc_storeStrong(location, 0LL);
}

BNPenderQueue *__cdecl sub_10004F818(id a1, unint64_t a2)
{
  id v8 = a1;
  unint64_t v7 = a2;
  v6[1] = a1;
  v6[0] = objc_alloc_init(&OBJC_CLASS___BNPenderQueue);
  id v3 = v6[0];
  id v4 = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"TVSSBannerQueue-P%lu", v7);
  objc_msgSend(v3, "setPenderIdentifier:");

  id v5 = v6[0];
  objc_storeStrong(v6, 0LL);
  return (BNPenderQueue *)v5;
}

void sub_10004F9C8(uint64_t *a1)
{
  id v3[2] = a1;
  v3[1] = a1;
  v3[0] = TVSSSuspensionReasonForBannerQueueSuspensionLevel(a1[6]);
  uint64_t v2 = sub_10004FC40(a1[6]);
  *(_BYTE *)(*(void *)(a1[5] + 8) + 24LL) = sub_10004FC98(a1[4], v3[0], v2) & 1;
  objc_storeStrong(v3, 0LL);
}

__CFString *TVSSSuspensionReasonForBannerQueueSuspensionLevel(uint64_t a1)
{
  uint64_t v5 = a1;
  if (a1)
  {
    if (a1 != 1)
    {
      id v4 =  +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Unrecognized banner suspension level. {suspensionLevel=%ld}",  v5);
      id location = &_os_log_default;
      if (os_log_type_enabled((os_log_t)location, OS_LOG_TYPE_ERROR))
      {
        uint64_t v2 =  +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "BNBannerSuspensionReason  _Nonnull TVSSSuspensionReasonForBannerQueueSuspensionLevel(TVSSBannerQueueSuspensionLevel)");
        sub_10005266C((uint64_t)v7, (uint64_t)v2, (uint64_t)@"TVSSBannerQueue.m", 351, (uint64_t)v4);
        _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)location,  OS_LOG_TYPE_ERROR,  "failure in %{public}@ (%{public}@:%i) : %{public}@",  v7,  0x26u);
      }

      objc_storeStrong(&location, 0LL);
      _bs_set_crash_log_message(-[NSString UTF8String](v4, "UTF8String"));
      __break(0);
      JUMPOUT(0x10004FBF8LL);
    }

    double v6 = @"TVSSBannerSuspensionReasonDoNotDisturb";
  }

  else
  {
    double v6 = @"TVSSBannerSuspensionReasonMenuInInteractiveMode";
  }

  return v6;
}

uint64_t sub_10004FC40(uint64_t a1)
{
  if (!a1) {
    return 1LL;
  }
  if (a1 == 1) {
    return 2LL;
  }
  return v2;
}

uint64_t sub_10004FC98(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v12 = a1;
  id location = 0LL;
  objc_storeStrong(&location, a2);
  uint64_t v10 = a3;
  if (v12)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(v12 + 16));
    id v8 = [*(id *)(v12 + 24) objectAtIndexedSubscript:v10];
    char v6 = 0;
    unsigned __int8 v4 = 0;
    if ([v8 isSuspended])
    {
      id v7 = [v8 activeSuspensionReasons];
      char v6 = 1;
      unsigned __int8 v4 = [v7 containsObject:location];
    }

    if ((v6 & 1) != 0) {

    }
    char v13 = v4 & 1;
    int v9 = 1;
    objc_storeStrong(&v8, 0LL);
  }

  else
  {
    char v13 = 0;
    int v9 = 1;
  }

  objc_storeStrong(&location, 0LL);
  return v13 & 1;
}

void sub_10004FEB8(uint64_t a1)
{
  id location[2] = (id)a1;
  location[1] = (id)a1;
  location[0] = TVSSSuspensionReasonForBannerQueueSuspensionLevel(*(void *)(a1 + 40));
  uint64_t v2 = sub_10004FC40(*(void *)(a1 + 40));
  if ((*(_BYTE *)(a1 + 48) & 1) != (sub_10004FC98(*(void *)(a1 + 32), location[0], v2) & 1)) {
    sub_10004FF84(*(void *)(a1 + 32), *(_BYTE *)(a1 + 48) & 1, location[0], v2);
  }
  objc_storeStrong(location, 0LL);
}

uint64_t sub_10004FF84(uint64_t a1, char a2, id obj, uint64_t a4)
{
  uint64_t v17 = a1;
  char v16 = a2 & 1;
  id location = 0LL;
  objc_storeStrong(&location, obj);
  uint64_t v14 = a4;
  if (v17)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(v17 + 16));
    id v12 = sub_100052224(v17);
    id v11 = objc_alloc_init(&OBJC_CLASS___NSMutableString);
    for (uint64_t i = 3LL; i >= v14; --i)
    {
      id v9 = [*(id *)(v17 + 24) objectAtIndexedSubscript:i];
      [v9 setSuspended:v16 & 1 forReason:location];
      objc_msgSend(v11, "appendFormat:", @"%ld ", i);
      objc_storeStrong(&v9, 0LL);
    }

    id v8 = sub_100052224(v17);
    char v7 = ([v8 isEqualToDictionary:v12] ^ 1) & 1;
    os_log_t oslog = (os_log_t)BannerQueueLog();
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      sub_10005248C((uint64_t)v19, v16 & 1, (uint64_t)v11, (uint64_t)v8, (uint64_t)v12, v7 & 1);
      _os_log_impl( (void *)&_mh_execute_header,  oslog,  OS_LOG_TYPE_DEFAULT,  "Setting suspended on prioritized queues. {suspended=%{BOOL}d, priorityLevels=%{public}@, isSuspended=%{public}@, wasSuspended=%{public}@}, didChange=%{BOOL}d",  v19,  0x2Cu);
    }

    objc_storeStrong((id *)&oslog, 0LL);
    char v18 = v7 & 1;
    int v13 = 1;
    objc_storeStrong(&v8, 0LL);
    objc_storeStrong(&v11, 0LL);
    objc_storeStrong(&v12, 0LL);
  }

  else
  {
    char v18 = 0;
    int v13 = 1;
  }

  objc_storeStrong(&location, 0LL);
  return v18 & 1;
}

void sub_100050388(uint64_t a1)
{
}

void sub_1000503C8(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v35 = a1;
  id location = 0LL;
  objc_storeStrong(&location, a2);
  uint64_t v33 = a3;
  id v32 = 0LL;
  objc_storeStrong(&v32, a4);
  if (v35)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(v35 + 16));
    id v14 = [v32 objectForKeyedSubscript:TVSPBannerPresentableKeyBannerType];
    uint64_t v4 = objc_opt_class(&OBJC_CLASS___NSNumber);
    id v15 = sub_100051F40(v14, v4);

    id v29 = v15;
    id v30 = v15;
    uint64_t v28 = sub_100052000(v35, (unint64_t)[v15 integerValue]);
    id v16 = [v32 objectForKeyedSubscript:TVSPBannerPresentableKeyHighPriority];
    uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSNumber);
    id v17 = sub_100051F40(v16, v5);

    v26[1] = v17;
    unsigned __int8 v18 = [v17 BOOLValue];

    char v27 = v18 & 1;
    if ((v18 & 1) != 0)
    {
      id v12 = TVSSBannerPresentable(location);
      char IsHighPriority = TVSSBannerPresentableIsHighPriority(v12);

      if ((IsHighPriority & 1) != 0)
      {
        id v10 = TVSSBannerPresentable(location);
        BOOL v11 = TVSSBannerPresentableSupportsDisplayingAsMenuItem(v10);

        uint64_t v28 = !v11;
      }

      else
      {
        v26[0] = BannerQueueLog();
        os_log_type_t v25 = OS_LOG_TYPE_ERROR;
        if (os_log_type_enabled((os_log_t)v26[0], OS_LOG_TYPE_ERROR))
        {
          sub_10003F4DC((uint64_t)v37, (uint64_t)[v30 integerValue], (uint64_t)v30);
          _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)v26[0],  v25,  "Requested high priority but banner type isn't valid for higher priority. {bannerType=%ld, bannerTypeValue=%p}",  v37,  0x16u);
        }

        objc_storeStrong(v26, 0LL);
      }
    }

    id v24 = BannerQueueLog();
    os_log_type_t v23 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v24, OS_LOG_TYPE_DEFAULT))
    {
      char v7 = (os_log_s *)v24;
      os_log_type_t v8 = v23;
      uint64_t v6 = v28;
      id v9 = (id)BNEffectivePresentableDescription(location);
      id v22 = v9;
      sub_100052150((uint64_t)v36, v6, (uint64_t)v22, v33, (uint64_t)v32);
      _os_log_impl( (void *)&_mh_execute_header,  v7,  v8,  "Enqueueing banner. {priority=%lu, presentable=%{public}@, options=%ld, userInfo=%@}",  v36,  0x2Au);

      objc_storeStrong(&v22, 0LL);
    }

    objc_storeStrong(&v24, 0LL);
    id v21 = [*(id *)(v35 + 24) objectAtIndexedSubscript:v28];
    [v21 enqueuePresentable:location withOptions:v33 userInfo:v32];
    objc_storeStrong(&v21, 0LL);
    objc_storeStrong(&v30, 0LL);
    int v31 = 0;
  }

  else
  {
    int v31 = 1;
  }

  objc_storeStrong(&v32, 0LL);
  objc_storeStrong(&location, 0LL);
}

void sub_10005091C(uint64_t a1, uint64_t a2)
{
  id location = (id *)(a2 + 40);
  uint64_t v2 = *(void **)(a2 + 40);
  id v3 = (id *)(a1 + 40);
  id *v3 = 0LL;
  objc_storeStrong(v3, v2);
  objc_storeStrong(location, 0LL);
}

void sub_100050970(uint64_t a1)
{
}

void sub_10005099C(uint64_t a1)
{
  id v1 = sub_1000509F4(*(void *)(a1 + 32));
  uint64_t v2 = *(void *)(*(void *)(a1 + 40) + 8LL);
  id v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = v1;
}

id sub_1000509F4(uint64_t a1)
{
  uint64_t v25 = a1;
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(v25 + 16));
    id v24 = 0LL;
    memset(__b, 0, sizeof(__b));
    id obj = *(id *)(v25 + 24);
    id v13 = [obj countByEnumeratingWithState:__b objects:v29 count:16];
    if (v13)
    {
      uint64_t v9 = *(void *)__b[2];
      uint64_t v10 = 0LL;
      id v11 = v13;
      while (1)
      {
        uint64_t v8 = v10;
        if (*(void *)__b[2] != v9) {
          objc_enumerationMutation(obj);
        }
        id v23 = *(id *)(__b[1] + 8 * v10);
        id v17 = [v23 peekPresentable];
        if (v17)
        {
          os_log_t v16 = (os_log_t)BannerQueueLog();
          os_log_type_t v15 = OS_LOG_TYPE_DEBUG;
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
          {
            uint64_t v2 = v16;
            os_log_type_t v3 = v15;
            id v4 = [v23 penderIdentifier];
            id v14 = v4;
            sub_10001AEB8((uint64_t)v27, (uint64_t)v14);
            _os_log_debug_impl( (void *)&_mh_execute_header,  v2,  v3,  "Peeking presentable from priority queue. {priority=%{public}@}",  v27,  0xCu);

            objc_storeStrong(&v14, 0LL);
          }

          objc_storeStrong((id *)&v16, 0LL);
          objc_storeStrong(&v24, v17);
          int v18 = 2;
        }

        else
        {
          int v18 = 0;
        }

        objc_storeStrong(&v17, 0LL);
        if (v18) {
          goto LABEL_20;
        }
        ++v10;
        if (v8 + 1 >= (unint64_t)v11)
        {
          uint64_t v10 = 0LL;
          id v11 = [obj countByEnumeratingWithState:__b objects:v29 count:16];
          if (!v11) {
            goto LABEL_19;
          }
        }
      }

      os_log_t oslog = (os_log_t)BannerQueueLog();
      os_log_type_t type = OS_LOG_TYPE_DEBUG;
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
      {
        log = oslog;
        os_log_type_t v6 = type;
        id v7 = [v23 penderIdentifier];
        id v19 = v7;
        sub_10001AEB8((uint64_t)v28, (uint64_t)v19);
        _os_log_debug_impl( (void *)&_mh_execute_header,  log,  v6,  "Found a suspended priority queue, stop peeking. {priority=%{public}@}",  v28,  0xCu);

        objc_storeStrong(&v19, 0LL);
      }

      objc_storeStrong((id *)&oslog, 0LL);
      int v18 = 2;
    }

    else
    {
LABEL_19:
      int v18 = 0;
    }

LABEL_20:
    id v26 = v24;
    int v18 = 1;
    objc_storeStrong(&v24, 0LL);
  }

  else
  {
    id v26 = 0LL;
  }

  return v26;
}

  objc_storeStrong(&v36, 0LL);
  objc_storeStrong(location, 0LL);
  return v39;
}

void sub_100050F68(uint64_t a1)
{
  id v1 = sub_100050FC8(*(void *)(a1 + 32), *(void **)(a1 + 40));
  uint64_t v2 = *(void *)(*(void *)(a1 + 48) + 8LL);
  os_log_type_t v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = v1;
}

id sub_100050FC8(uint64_t a1, void *a2)
{
  uint64_t v15 = a1;
  id location = 0LL;
  objc_storeStrong(&location, a2);
  if (v15)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(v15 + 16));
    id v12 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    memset(__b, 0, sizeof(__b));
    id obj = *(id *)(v15 + 24);
    id v8 = [obj countByEnumeratingWithState:__b objects:v17 count:16];
    if (v8)
    {
      uint64_t v4 = *(void *)__b[2];
      uint64_t v5 = 0LL;
      id v6 = v8;
      while (1)
      {
        uint64_t v3 = v5;
        if (*(void *)__b[2] != v4) {
          objc_enumerationMutation(obj);
        }
        id v11 = *(id *)(__b[1] + 8 * v5);
        id v9 = [v11 pullPresentablesWithIdentification:location];
        -[NSMutableArray addObjectsFromArray:](v12, "addObjectsFromArray:", v9);
        objc_storeStrong(&v9, 0LL);
        ++v5;
        if (v3 + 1 >= (unint64_t)v6)
        {
          uint64_t v5 = 0LL;
          id v6 = [obj countByEnumeratingWithState:__b objects:v17 count:16];
          if (!v6) {
            break;
          }
        }
      }
    }

    id v16 = -[NSMutableArray copy](v12, "copy");
    int v13 = 1;
    objc_storeStrong((id *)&v12, 0LL);
  }

  else
  {
    id v16 = 0LL;
    int v13 = 1;
  }

  objc_storeStrong(&location, 0LL);
  return v16;
}

uint64_t sub_100051310(uint64_t a1)
{
  uint64_t result = sub_100051358(*(void *)(a1 + 32));
  *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = result & 1;
  return result;
}

uint64_t sub_100051358(uint64_t a1)
{
  uint64_t v11 = a1;
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(v11 + 16));
    memset(__b, 0, sizeof(__b));
    id obj = *(id *)(v11 + 24);
    id v7 = [obj countByEnumeratingWithState:__b objects:v13 count:16];
    if (v7)
    {
      uint64_t v3 = *(void *)__b[2];
      uint64_t v4 = 0LL;
      id v5 = v7;
      while (1)
      {
        uint64_t v2 = v4;
        if (*(void *)__b[2] != v3) {
          objc_enumerationMutation(obj);
        }
        id v10 = *(id *)(__b[1] + 8 * v4);
        ++v4;
        if (v2 + 1 >= (unint64_t)v5)
        {
          uint64_t v4 = 0LL;
          id v5 = [obj countByEnumeratingWithState:__b objects:v13 count:16];
          if (!v5) {
            goto LABEL_11;
          }
        }
      }

      char v12 = 0;
      int v8 = 1;
    }

    else
    {
LABEL_11:
      int v8 = 0;
    }

    if (!v8) {
      char v12 = 1;
    }
  }

  else
  {
    char v12 = 0;
  }

  return v12 & 1;
}

uint64_t sub_1000516D0(uint64_t a1)
{
  uint64_t result = sub_10004FF84(*(void *)(a1 + 32), *(_BYTE *)(a1 + 56) & 1, *(id *)(a1 + 40), 0LL);
  *(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = result & 1;
  return result;
}

void sub_100051840(uint64_t a1)
{
  uint64_t v13 = a1;
  uint64_t v12 = a1;
  memset(__b, 0, sizeof(__b));
  id obj = *(id *)(*(void *)(a1 + 32) + 24LL);
  id v8 = [obj countByEnumeratingWithState:__b objects:v14 count:16];
  if (v8)
  {
    uint64_t v3 = *(void *)__b[2];
    uint64_t v4 = 0LL;
    id v5 = v8;
    while (1)
    {
      uint64_t v2 = v4;
      if (*(void *)__b[2] != v3) {
        objc_enumerationMutation(obj);
      }
      id v11 = *(id *)(__b[1] + 8 * v4);
      id location = objc_msgSend(v11, "activeSuspensionReasons", v5);
      if (location) {
        [*(id *)(a1 + 40) unionSet:location];
      }
      objc_storeStrong(&location, 0LL);
      ++v4;
      id v5 = (id)v1;
      if (v2 + 1 >= v1)
      {
        uint64_t v4 = 0LL;
        id v5 = [obj countByEnumeratingWithState:__b objects:v14 count:16];
        if (!v5) {
          break;
        }
      }
    }
  }
}

uint64_t sub_100051BC8(uint64_t a1)
{
  uint64_t result = sub_100051C30(*(void *)(a1 + 32), *(_BYTE *)(a1 + 64) & 1, *(id *)(a1 + 40), *(void **)(a1 + 48));
  *(_BYTE *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL) = result & 1;
  return result;
}

uint64_t sub_100051C30(uint64_t a1, char a2, id obj, void *a4)
{
  uint64_t v22 = a1;
  char v21 = a2 & 1;
  id location = 0LL;
  objc_storeStrong(&location, obj);
  id v19 = 0LL;
  objc_storeStrong(&v19, a4);
  if (v22)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(v22 + 16));
    char v17 = 0;
    memset(__b, 0, sizeof(__b));
    id v10 = *(id *)(v22 + 24);
    id v11 = [v10 countByEnumeratingWithState:__b objects:v25 count:16];
    if (v11)
    {
      uint64_t v7 = *(void *)__b[2];
      uint64_t v8 = 0LL;
      id v9 = v11;
      while (1)
      {
        uint64_t v6 = v8;
        if (*(void *)__b[2] != v7) {
          objc_enumerationMutation(v10);
        }
        id v16 = *(id *)(__b[1] + 8 * v8);
        char v14 = [v16 setSuspended:v21 & 1 forRequesterWithIdentifier:location reason:v19] & 1;
        char v5 = 1;
        if ((v14 & 1) == 0) {
          char v5 = v17;
        }
        char v17 = v5 & 1;
        ++v8;
        if (v6 + 1 >= (unint64_t)v9)
        {
          uint64_t v8 = 0LL;
          id v9 = [v10 countByEnumeratingWithState:__b objects:v25 count:16];
          if (!v9) {
            break;
          }
        }
      }
    }

    os_log_t oslog = (os_log_t)BannerQueueLog();
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
    {
      sub_1000521D0((uint64_t)v24, (uint64_t)location, v17 & 1);
      _os_log_debug_impl( (void *)&_mh_execute_header,  oslog,  OS_LOG_TYPE_DEBUG,  "Suspended set on all prioritized queues for requester. {requesterIdentifier=%{public}@, didChange=%{BOOL}d}",  v24,  0x12u);
    }

    objc_storeStrong((id *)&oslog, 0LL);
    char v23 = v17 & 1;
    int v18 = 1;
  }

  else
  {
    char v23 = 0;
    int v18 = 1;
  }

  objc_storeStrong(&v19, 0LL);
  objc_storeStrong(&location, 0LL);
  return v23 & 1;
}

id sub_100051F40(void *a1, uint64_t a2)
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

uint64_t sub_100052000(uint64_t a1, unint64_t a2)
{
  uint64_t v5 = a1;
  unint64_t v4 = a2;
  if (!a1) {
    return 0LL;
  }
  if (v4 <= 1) {
    return 2LL;
  }
  if (v4 == 2) {
    return 3LL;
  }
  os_log_t oslog = (os_log_t)BannerQueueLog();
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_INFO))
  {
    sub_10001AC54((uint64_t)v7, v4);
    _os_log_impl( (void *)&_mh_execute_header,  oslog,  OS_LOG_TYPE_INFO,  "Unknown banner type, using lowest priority. {type=%ld}",  v7,  0xCu);
  }

  objc_storeStrong((id *)&oslog, 0LL);
  return 3LL;
}

uint64_t sub_100052150(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  *(_BYTE *)uint64_t result = 2;
  *(_BYTE *)(result + 1) = 4;
  *(_BYTE *)(result + 2) = 0;
  *(_BYTE *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 66;
  *(_BYTE *)(result + 13) = 8;
  *(void *)(result + 14) = a3;
  *(_BYTE *)(result + 22) = 0;
  *(_BYTE *)(result + 23) = 8;
  *(void *)(result + 24) = a4;
  *(_BYTE *)(result + 32) = 64;
  *(_BYTE *)(result + 33) = 8;
  *(void *)(result + 34) = a5;
  return result;
}

uint64_t sub_1000521D0(uint64_t result, uint64_t a2, int a3)
{
  *(_BYTE *)uint64_t result = 2;
  *(_BYTE *)(result + 1) = 2;
  *(_BYTE *)(result + 2) = 66;
  *(_BYTE *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 0;
  *(_BYTE *)(result + 13) = 4;
  *(_DWORD *)(result + 14) = a3;
  return result;
}

id sub_100052224(uint64_t a1)
{
  uint64_t v14 = a1;
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(v14 + 16));
    uint64_t v13 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    memset(__b, 0, sizeof(__b));
    id obj = *(id *)(v14 + 24);
    id v10 = [obj countByEnumeratingWithState:__b objects:v16 count:16];
    if (v10)
    {
      uint64_t v6 = *(void *)__b[2];
      uint64_t v7 = 0LL;
      id v8 = v10;
      while (1)
      {
        uint64_t v5 = v7;
        if (*(void *)__b[2] != v6) {
          objc_enumerationMutation(obj);
        }
        id v12 = *(id *)(__b[1] + 8 * v7);
        unint64_t v4 =  +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  (unint64_t)[v12 isSuspended] & 1);
        id v2 = v13;
        id v3 = [v12 penderIdentifier];
        -[NSMutableDictionary setObject:forKeyedSubscript:](v2, "setObject:forKeyedSubscript:", v4);

        ++v7;
        if (v5 + 1 >= (unint64_t)v8)
        {
          uint64_t v7 = 0LL;
          id v8 = [obj countByEnumeratingWithState:__b objects:v16 count:16];
          if (!v8) {
            break;
          }
        }
      }
    }

    id v15 = -[NSMutableDictionary copy](v13, "copy");
    objc_storeStrong((id *)&v13, 0LL);
  }

  else
  {
    id v15 = 0LL;
  }

  return v15;
}

uint64_t sub_10005248C(uint64_t result, int a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6)
{
  *(_BYTE *)uint64_t result = 2;
  *(_BYTE *)(result + 1) = 5;
  *(_BYTE *)(result + 2) = 0;
  *(_BYTE *)(result + 3) = 4;
  *(_DWORD *)(result + 4) = a2;
  *(_BYTE *)(result + 8) = 66;
  *(_BYTE *)(result + 9) = 8;
  *(void *)(result + 10) = a3;
  *(_BYTE *)(result + 18) = 66;
  *(_BYTE *)(result + 19) = 8;
  *(void *)(result + 20) = a4;
  *(_BYTE *)(result + 28) = 66;
  *(_BYTE *)(result + 29) = 8;
  *(void *)(result + 30) = a5;
  *(_BYTE *)(result + 38) = 0;
  *(_BYTE *)(result + 39) = 4;
  *(_DWORD *)(result + 40) = a6;
  return result;
}

uint64_t sub_10005266C(uint64_t result, uint64_t a2, uint64_t a3, int a4, uint64_t a5)
{
  *(_BYTE *)uint64_t result = 2;
  *(_BYTE *)(result + 1) = 4;
  *(_BYTE *)(result + 2) = 66;
  *(_BYTE *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 66;
  *(_BYTE *)(result + 13) = 8;
  *(void *)(result + 14) = a3;
  *(_BYTE *)(result + 22) = 0;
  *(_BYTE *)(result + 23) = 4;
  *(_DWORD *)(result + 24) = a4;
  *(_BYTE *)(result + 28) = 66;
  *(_BYTE *)(result + 29) = 8;
  *(void *)(result + 30) = a5;
  return result;
}

void sub_10005294C(id a1)
{
  unint64_t v1 = +[NSMapTable strongToWeakObjectsMapTable](&OBJC_CLASS___NSMapTable, "strongToWeakObjectsMapTable", a1, a1);
  id v2 = (void *)qword_100221C68;
  qword_100221C68 = (uint64_t)v1;
}

id audioAnalyzerLog()
{
  predicate = (dispatch_once_t *)&unk_100221C78;
  dispatch_block_t block = 0LL;
  objc_storeStrong(&block, &stru_1001B7D48);
  if (*predicate != -1) {
    dispatch_once(predicate, block);
  }
  objc_storeStrong(&block, 0LL);
  return (id)qword_100221C70;
}

uint64_t sub_100052A10(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  *(_BYTE *)uint64_t result = 2;
  *(_BYTE *)(result + 1) = 3;
  *(_BYTE *)(result + 2) = 64;
  *(_BYTE *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 0;
  *(_BYTE *)(result + 13) = 4;
  *(_DWORD *)(result + 14) = a3;
  *(_BYTE *)(result + 18) = 64;
  *(_BYTE *)(result + 19) = 8;
  *(void *)(result + 20) = a4;
  return result;
}

void sub_100052E38(uint64_t a1)
{
  uint64_t v5 = objc_alloc(&OBJC_CLASS___MPCProcessAudioTap);
  unsigned int v4 = *(_DWORD *)(a1 + 40);
  uint64_t v7 =  +[NSNumber numberWithInt:]( &OBJC_CLASS___NSNumber,  "numberWithInt:",  *(unsigned int *)(*(void *)(a1 + 32) + 112LL));
  unint64_t v1 = -[MPCProcessAudioTap initWithPID:refreshRate:delegate:](v5, "initWithPID:refreshRate:delegate:", v4);
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 144);
  *(void *)(v2 + 144) = v1;
}

void sub_100053510(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) tap];
  [v1 start];
}

void sub_1000536C4(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) tap];
  [v1 stop];
}

void sub_10005388C(uint64_t a1)
{
  uint64_t v11 = a1;
  uint64_t v10 = a1;
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 128LL), *(id *)(a1 + 40));
  memset(__b, 0, sizeof(__b));
  id obj = [*(id *)(*(void *)(a1 + 32) + 152) objectEnumerator];
  id v7 = [obj countByEnumeratingWithState:__b objects:v12 count:16];
  if (v7)
  {
    uint64_t v2 = *(void *)__b[2];
    uint64_t v3 = 0LL;
    id v4 = v7;
    while (1)
    {
      uint64_t v1 = v3;
      if (*(void *)__b[2] != v2) {
        objc_enumerationMutation(obj);
      }
      id v9 = *(id *)(__b[1] + 8 * v3);
      [v9 audioAnalyzer:*(void *)(a1 + 32) didUpdateWaveform:*(void *)(a1 + 40)];
      ++v3;
      if (v1 + 1 >= (unint64_t)v4)
      {
        uint64_t v3 = 0LL;
        id v4 = [obj countByEnumeratingWithState:__b objects:v12 count:16];
        if (!v4) {
          break;
        }
      }
    }
  }
}

void sub_100053EF4(id a1)
{
  os_log_t v1 = os_log_create("com.apple.TVSystemUIService.audioAnalyzer", "");
  uint64_t v2 = (void *)qword_100221C70;
  qword_100221C70 = (uint64_t)v1;
}

uint64_t sub_100054B78(id *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  BOOL v9 = location[0] == a1[4];
  id v5 = a1[4];
  uint64_t v2 = objc_opt_class(&OBJC_CLASS____TVSSMenuBarAbstractAnimationTransaction);
  id v6 = sub_100054C68(v5, v2);
  unsigned __int8 v7 = [v6 isBannerTransaction];

  char v8 = 1;
  if (!v9) {
    char v8 = v7 & 1;
  }
  objc_storeStrong(location, 0LL);
  return v8 & 1;
}

id sub_100054C68(void *a1, uint64_t a2)
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

void sub_100054E84(id a1, NSError *a2)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  oslog[1] = (os_log_t)a1;
  oslog[0] = (os_log_t)ScreenRecordingLog();
  if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEFAULT))
  {
    sub_10000D28C((uint64_t)v5, (uint64_t)location[0]);
    _os_log_impl( (void *)&_mh_execute_header,  oslog[0],  OS_LOG_TYPE_DEFAULT,  "Started recording with error %@",  v5,  0xCu);
  }

  objc_storeStrong((id *)oslog, 0LL);
  objc_storeStrong(location, 0LL);
}

void sub_1000550A8( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, int a17, int a18, _Unwind_Exception *exception_object, char a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, id a26)
{
}

void sub_1000550D4(id *a1, void *a2, void *a3)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  id v15 = 0LL;
  objc_storeStrong(&v15, a3);
  v14[1] = a1;
  queue = &_dispatch_main_q;
  id v6 = _NSConcreteStackBlock;
  int v7 = -1073741824;
  int v8 = 0;
  BOOL v9 = sub_100055244;
  uint64_t v10 = &unk_1001B7FD0;
  objc_copyWeak(v14, a1 + 6);
  id v11 = location[0];
  id v12 = a1[4];
  id v13 = a1[5];
  dispatch_async(queue, &v6);

  objc_storeStrong(&v13, 0LL);
  objc_storeStrong(&v12, 0LL);
  objc_storeStrong(&v11, 0LL);
  objc_destroyWeak(v14);
  objc_storeStrong(&v15, 0LL);
  objc_storeStrong(location, 0LL);
}

void sub_100055244(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  [WeakRetained _presentExportOptionsWithURL:*(void *)(a1 + 32) presentingViewController:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
}

void sub_100055700(uint64_t a1, void *a2)
{
  location[1] = (id)a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  v10[1] = (id)a1;
  v10[0] = [*(id *)(a1 + 32) path];
  if (v10[0])
  {
    id v13 = v10[0];
    id v5 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v13, 1LL);
    +[SFViewServiceManager presentAirDropViewControllerWithItems:]( &OBJC_CLASS___SFViewServiceManager,  "presentAirDropViewControllerWithItems:");
  }

  else
  {
    id v9 = ScreenRecordingLog();
    char v8 = 16;
    if (os_log_type_enabled((os_log_t)v9, OS_LOG_TYPE_ERROR))
    {
      log = (os_log_s *)v9;
      os_log_type_t type = v8;
      id v4 = [*(id *)(a1 + 32) debugDescription];
      id v7 = v4;
      sub_10000D28C((uint64_t)v12, (uint64_t)v7);
      _os_log_error_impl((void *)&_mh_execute_header, log, type, "Failed to AirDrop recording. File url: %@", v12, 0xCu);

      objc_storeStrong(&v7, 0LL);
    }

    objc_storeStrong(&v9, 0LL);
  }

  if (*(void *)(a1 + 40)) {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
  }
  objc_storeStrong(v10, 0LL);
  objc_storeStrong(location, 0LL);
}

void sub_1000558F8(id *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  v15[1] = a1;
  uint64_t v3 = +[PHPhotoLibrary sharedPhotoLibrary](&OBJC_CLASS___PHPhotoLibrary, "sharedPhotoLibrary");
  uint64_t v10 = _NSConcreteStackBlock;
  int v11 = -1073741824;
  int v12 = 0;
  id v13 = sub_100055A50;
  uint64_t v14 = &unk_1001B5A60;
  v15[0] = a1[4];
  id v4 = _NSConcreteStackBlock;
  int v5 = -1073741824;
  int v6 = 0;
  id v7 = sub_100055AE8;
  char v8 = &unk_1001B8048;
  id v9 = a1[5];
  -[PHPhotoLibrary performChanges:completionHandler:](v3, "performChanges:completionHandler:", &v10);

  objc_storeStrong(&v9, 0LL);
  objc_storeStrong(v15, 0LL);
  objc_storeStrong(location, 0LL);
}

void sub_100055A50(void *a1)
{
  id v3[2] = a1;
  v3[1] = a1;
  v3[0] =  +[PHAssetCreationRequest creationRequestForAsset]( &OBJC_CLASS___PHAssetCreationRequest,  "creationRequestForAsset");
  id v2 = objc_alloc_init(&OBJC_CLASS___PHAssetResourceCreationOptions);
  [v3[0] addResourceWithType:2 fileURL:a1[4] options:v2];
  objc_storeStrong((id *)&v2, 0LL);
  objc_storeStrong(v3, 0LL);
}

void sub_100055AE8(os_log_s *a1, char a2, id obj)
{
  id v7 = a1;
  char v6 = a2 & 1;
  id location = 0LL;
  objc_storeStrong(&location, obj);
  oslog[1] = a1;
  if (location)
  {
    oslog[0] = (os_log_t)ScreenRecordingLog();
    if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_ERROR))
    {
      sub_10000D28C((uint64_t)v8, (uint64_t)location);
      _os_log_error_impl( (void *)&_mh_execute_header,  oslog[0],  OS_LOG_TYPE_ERROR,  "Failed to save recording with error %@",  v8,  0xCu);
    }

    objc_storeStrong((id *)oslog, 0LL);
  }

  if (*((void *)a1 + 4)) {
    (*(void (**)(void))(*((void *)a1 + 4) + 16LL))();
  }
  objc_storeStrong(&location, 0LL);
}

void sub_100055C34(void *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  v8[1] = a1;
  v8[0] = 0LL;
  id v7 = objc_alloc_init((Class)off_10021F518());
  [v7 setIsUserInitiated:1];
  [v7 setRemoteDeviceSelections:66];
  uint64_t v11 = a1[4];
  uint64_t v3 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v11, 1LL);
  objc_msgSend(v7, "setAttachments:");

  id v4 = [off_10021F520() shared];
  id v6 = v8[0];
  [v4 createDraft:v7 forProcessNamed:0 withDisplayReason:0 error:&v6];
  objc_storeStrong(v8, v6);

  if (v8[0])
  {
    os_log_t oslog = (os_log_t)ScreenRecordingLog();
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      sub_10000D28C((uint64_t)v10, (uint64_t)v8[0]);
      _os_log_impl( (void *)&_mh_execute_header,  oslog,  OS_LOG_TYPE_DEFAULT,  "Failed to create radar draft with error %@",  v10,  0xCu);
    }

    objc_storeStrong((id *)&oslog, 0LL);
  }

  if (a1[5]) {
    (*(void (**)(void))(a1[5] + 16LL))();
  }
  objc_storeStrong(&v7, 0LL);
  objc_storeStrong(v8, 0LL);
  objc_storeStrong(location, 0LL);
}

id sub_100055EEC()
{
  qword_100221C80 = (uint64_t)objc_getClass("RadarDraft");
  off_10021F518 = (uint64_t (*)())sub_100055FA0;
  return (id)qword_100221C80;
}

uint64_t sub_100055F28()
{
  predicate = (dispatch_once_t *)&unk_100221C88;
  dispatch_block_t block = 0LL;
  objc_storeStrong(&block, &stru_1001B8068);
  if (*predicate != -1) {
    dispatch_once(predicate, block);
  }
  objc_storeStrong(&block, 0LL);
  return qword_100221C90;
}

id sub_100055FA0()
{
  return (id)qword_100221C80;
}

void sub_100055FAC(id a1)
{
  qword_100221C90 = (uint64_t)dlopen("/AppleInternal/Library/Frameworks/TapToRadarKit.framework/TapToRadarKit", 2);
}

id sub_100055FE8()
{
  qword_100221C98 = (uint64_t)objc_getClass("TapToRadarService");
  off_10021F520 = (uint64_t (*)())sub_100056024;
  return (id)qword_100221C98;
}

id sub_100056024()
{
  return (id)qword_100221C98;
}

void sub_1000570D4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v16 = a1;
  uint64_t v15 = a2;
  uint64_t v14 = a3;
  uint64_t v13 = a4;
  uint64_t v12 = a5;
  int v5 = &_dispatch_main_q;
  dispatch_block_t block = _NSConcreteStackBlock;
  int v7 = -1073741824;
  int v8 = 0;
  id v9 = sub_100057FFC;
  uint64_t v10 = &unk_1001B6430;
  uint64_t v11 = v15;
  dispatch_async(v5, &block);
}

void sub_100057F9C(uint64_t a1)
{
  id v2 = +[LSApplicationWorkspace defaultWorkspace](&OBJC_CLASS___LSApplicationWorkspace, "defaultWorkspace");
  objc_msgSend(v2, "openSensitiveURL:withOptions:error:", *(void *)(a1 + 32), 0);
}

void sub_100057FFC(id *a1)
{
  v1[2] = a1;
  v1[1] = a1;
  v1[0] = a1[4];
  [v1[0] refresh];
  objc_storeStrong(v1, 0LL);
}

NSString *sub_1000582C4(uint64_t a1)
{
  return +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"State %ld", a1 + 1, a1);
}

void sub_100058904(id *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  id WeakRetained = objc_loadWeakRetained(a1 + 4);
  [WeakRetained _advanceAnimationState];

  objc_storeStrong(location, 0LL);
}

unint64_t sub_100058A14(uint64_t a1)
{
  return (a1 + 1) % 4uLL;
}

id sub_10005B834(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) layoutResult];
  [v4 boundingFrame];
  double Width = CGRectGetWidth(v6);
  id v3 = [*(id *)(a1 + 32) layoutViewWidthConstraint];
  [v3 setConstant:Width];

  return [*(id *)(a1 + 32) layoutIfNeeded];
}

void sub_10005BA24( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, int a16, int a17, _Unwind_Exception *exception_object)
{
}

void sub_10005BA48(uint64_t a1, uint64_t a2)
{
  id location = (id *)(a2 + 40);
  id v2 = *(void **)(a2 + 40);
  id v3 = (id *)(a1 + 40);
  id *v3 = 0LL;
  objc_storeStrong(v3, v2);
  objc_storeStrong(location, 0LL);
}

void sub_10005BA9C(uint64_t a1)
{
}

id sub_10005BAC8(uint64_t a1)
{
  os_log_t v1 = -[TVSSMenuItemHostView initWithItem:]( objc_alloc(&OBJC_CLASS___TVSSMenuItemHostView),  "initWithItem:",  *(void *)(a1 + 32));
  uint64_t v2 = *(void *)(*(void *)(a1 + 40) + 8LL);
  id v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = v1;

  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setTranslatesAutoresizingMaskIntoConstraints:0];
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setNeedsLayout];
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) layoutIfNeeded];
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) bounds];
  sub_10005BBF0();
  return objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), "setCenter:", v4, v5);
}

  ;
}

id sub_10005D340(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(void *)(a1 + 32) + 56), "layoutIfNeeded", a1, a1);
}

id sub_10005D744(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(void *)(a1 + 32) + 72), "layoutIfNeeded", a1, a1);
}

void sub_10005F4D0(id *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  id WeakRetained = objc_loadWeakRetained(a1 + 4);
  [WeakRetained _handleTimerTick];

  objc_storeStrong(location, 0LL);
}

uint64_t sub_1000604AC( id *a1, void *a2, int a3, int a4, int a5, int a6, int a7, int a8, id obj, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44)
{
  return 0LL;
}

uint64_t sub_100061BC8(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(_BYTE *)uint64_t result = 2;
  *(_BYTE *)(result + 1) = 2;
  *(_BYTE *)(result + 2) = 66;
  *(_BYTE *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 64;
  *(_BYTE *)(result + 13) = 8;
  *(void *)(result + 14) = a3;
  return result;
}

uint64_t sub_100061C1C(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(_BYTE *)uint64_t result = 2;
  *(_BYTE *)(result + 1) = 3;
  *(_BYTE *)(result + 2) = 66;
  *(_BYTE *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 64;
  *(_BYTE *)(result + 13) = 8;
  *(void *)(result + 14) = a3;
  *(_BYTE *)(result + 22) = 66;
  *(_BYTE *)(result + 23) = 8;
  *(void *)(result + 24) = a4;
  return result;
}

uint64_t sub_100061C88(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(_BYTE *)uint64_t result = 2;
  *(_BYTE *)(result + 1) = 3;
  *(_BYTE *)(result + 2) = 64;
  *(_BYTE *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 0;
  *(_BYTE *)(result + 13) = 8;
  *(void *)(result + 14) = a3;
  *(_BYTE *)(result + 22) = 66;
  *(_BYTE *)(result + 23) = 8;
  *(void *)(result + 24) = a4;
  return result;
}

uint64_t sub_100061F9C(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  *(_BYTE *)uint64_t result = 2;
  *(_BYTE *)(result + 1) = 4;
  *(_BYTE *)(result + 2) = 66;
  *(_BYTE *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 66;
  *(_BYTE *)(result + 13) = 8;
  *(void *)(result + 14) = a3;
  *(_BYTE *)(result + 22) = 66;
  *(_BYTE *)(result + 23) = 8;
  *(void *)(result + 24) = a4;
  *(_BYTE *)(result + 32) = 64;
  *(_BYTE *)(result + 33) = 8;
  *(void *)(result + 34) = a5;
  return result;
}

void sub_100062960(id a1)
{
  id v1 = sub_1000629B0(objc_alloc(&OBJC_CLASS___TVSSWaveformSettings), &off_1001C8588);
  uint64_t v2 = (void *)qword_100221CA8;
  qword_100221CA8 = (uint64_t)v1;
}

id sub_1000629B0(void *a1, void *a2)
{
  id v7 = a1;
  id location = 0LL;
  objc_storeStrong(&location, a2);
  if (v7)
  {
    id v2 = v7;
    id v7 = 0LL;
    v4.receiver = v2;
    v4.super_class = (Class)&OBJC_CLASS___TVSSWaveformSettings;
    id v7 = objc_msgSendSuper2(&v4, "init");
    objc_storeStrong(&v7, v7);
    if (v7)
    {
      objc_storeStrong((id *)v7 + 10, location);
      objc_storeStrong((id *)v7 + 11, &off_1001C85B8);
      *((_DWORD *)v7 + 2) = 1058642330;
      *((_DWORD *)v7 + 3) = 1053609165;
      *((_DWORD *)v7 + 4) = -1105618534;
      *((float *)v7 + 5) = 20.0;
      *((_DWORD *)v7 + 6) = 1051092582;
      *((_DWORD *)v7 + 7) = 1061997773;
      *((float *)v7 + _Block_object_dispose((const void *)(v18 - 72), 8) = 1.0;
      *((float *)v7 + 9) = 1.0;
      *((_DWORD *)v7 + 10) = 1059648963;
      *((_DWORD *)v7 + 11) = 48;
      *((_DWORD *)v7 + 12) = 5;
      *((float *)v7 + 13) = 0.25;
      *((float *)v7 + 14) = 6.0;
      *((float *)v7 + 15) = 1.25;
      *((_DWORD *)v7 + 16) = 1053609165;
      *((float *)v7 + 17) = 0.5;
      *((float *)v7 + 1_Block_object_dispose((const void *)(v18 - 72), 8) = 1.0;
    }

    id v8 = v7;
    int v5 = 1;
  }

  else
  {
    id v8 = 0LL;
    int v5 = 1;
  }

  objc_storeStrong(&location, 0LL);
  objc_storeStrong(&v7, 0LL);
  return v8;
}

void sub_100062C24(id a1)
{
  id v1 = sub_1000629B0(objc_alloc(&OBJC_CLASS___TVSSWaveformSettings), &off_1001C85A0);
  id v2 = (void *)qword_100221CB8;
  qword_100221CB8 = (uint64_t)v1;
}

id sub_100063A10(void *a1, uint64_t a2)
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

void sub_100064DC8()
{
}

TVSSVPNConfigurationRenderer *sub_100064DD8(id *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  v9[1] = a1;
  v9[0] = objc_loadWeakRetained(a1 + 4);
  for (char i = 1; (i & 1) != 0; char i = 0)
  {
    id v4 = [v9[0] vpnConfigurationsByIdentifier];
    id v7 = [v4 objectForKeyedSubscript:location[0]];

    char v3 = 0;
    if (v7) {
      char v3 = i;
    }
    if ((v3 & 1) != 0)
    {
      uint64_t v11 =  +[TVSSVPNConfigurationRenderer rendererWithIdentifier:format:content:]( &OBJC_CLASS___TVSSVPNConfigurationRenderer,  "rendererWithIdentifier:format:content:",  location[0],  9LL,  v7);
      int v6 = 1;
    }

    else
    {
      int v6 = 5;
    }

    objc_storeStrong(&v7, 0LL);
    if (v6 != 5) {
      goto LABEL_11;
    }
  }

  uint64_t v11 = 0LL;
LABEL_11:
  objc_storeStrong(v9, 0LL);
  objc_storeStrong(location, 0LL);
  return v11;
}

void sub_100065A94(uint64_t a1)
{
  v13[3] = (id)a1;
  v13[2] = (id)a1;
  id v5 = [*(id *)(a1 + 32) objectForKey:NSKeyValueChangeNewKey];
  id v6 = [v5 unsignedIntegerValue];

  v13[1] = v6;
  v13[0] =  +[TVSSVPNConfiguration localizedConnectionStatus:]( &OBJC_CLASS___TVSSVPNConfiguration,  "localizedConnectionStatus:",  v6);
  char v10 = 0;
  char v8 = 0;
  if ([*(id *)(*(void *)(a1 + 40) + 8) includesRelays])
  {
    id v11 = TVSSLocString(@"TVSSVPNAndRelaysTitle");
    char v10 = 1;
    id v1 = v11;
  }

  else
  {
    id v9 = TVSSLocString(@"TVSSVPNTitle");
    char v8 = 1;
    id v1 = v9;
  }

  id location = v1;
  if ((v8 & 1) != 0) {

  }
  if ((v10 & 1) != 0) {
  id v4 = *(void **)(a1 + 40);
  }
  uint64_t v14 = @"VPN";
  char v3 =  +[TVSPContent contentWithTitle:image:text1:isSelected:]( &OBJC_CLASS___TVSPContent,  "contentWithTitle:image:text1:isSelected:",  location);
  uint64_t v15 = v3;
  id v2 =  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v15,  &v14,  1LL);
  objc_msgSend(v4, "applyContent:");

  objc_storeStrong(&location, 0LL);
  objc_storeStrong(v13, 0LL);
}

id sub_1000667A4(Class *a1, void *a2, void *a3)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  id v7 = 0LL;
  objc_storeStrong(&v7, a3);
  id v6 = objc_alloc_init(a1[4]);
  objc_storeStrong(&v7, 0LL);
  objc_storeStrong(location, 0LL);
  return v6;
}

id sub_100067170(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "identifier", a1, a1);
}

unint64_t sub_1000671A0(uint64_t a1)
{
  return (unint64_t)objc_msgSend(*(id *)(a1 + 32), "hasFocusableContent", a1, a1) & 1;
}

void sub_100067770(void *a1, void *a2, void *a3, void *a4)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  id v8 = 0LL;
  objc_storeStrong(&v8, a3);
  id v7 = 0LL;
  objc_storeStrong(&v7, a4);
  [location[0] menuItemVisualContentDidChange:a1[4]];
  objc_storeStrong(&v7, 0LL);
  objc_storeStrong(&v8, 0LL);
  objc_storeStrong(location, 0LL);
}

id sub_100068488(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "networkName", a1, a1);
}

id sub_1000684B8(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "signalStrength", a1, a1);
}

__CFString *sub_100068B44(uint64_t a1)
{
  switch(a1)
  {
    case 0LL:
      return @"Invalid";
    case 1LL:
      return @"Ethernet";
    case 2LL:
      id v2 = @"Wifi";
      break;
  }

  return v2;
}

id sub_100069138(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "activeInterfaceType", a1, a1);
}

unint64_t sub_100069168(uint64_t a1)
{
  return (unint64_t)objc_msgSend(*(id *)(a1 + 32), "isInternetAvailable", a1, a1) & 1;
}

id sub_10006919C(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "wifiState", a1, a1);
}

unint64_t sub_1000691CC(uint64_t a1)
{
  return (unint64_t)objc_msgSend(*(id *)(a1 + 32), "isVPNConfigured", a1, a1) & 1;
}

unint64_t sub_100069200(uint64_t a1)
{
  return (unint64_t)objc_msgSend(*(id *)(a1 + 32), "isVPNActive", a1, a1) & 1;
}

id sub_10006A60C(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "avMode", a1, a1);
}

id sub_10006A63C(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "displayName", a1, a1);
}

id sub_10006A66C(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "systemImageName", a1, a1);
}

id sub_10006A69C(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "enabledSystemImageName", a1, a1);
}

unint64_t sub_10006A6CC(uint64_t a1)
{
  return (unint64_t)objc_msgSend(*(id *)(a1 + 32), "isEnabled", a1, a1) & 1;
}

unint64_t sub_10006A700(uint64_t a1)
{
  return (unint64_t)objc_msgSend(*(id *)(a1 + 32), "isSupported", a1, a1) & 1;
}

unint64_t sub_10006A734(uint64_t a1)
{
  return (unint64_t)objc_msgSend(*(id *)(a1 + 32), "isUnavailable", a1, a1) & 1;
}

id sub_10006C2E0(void *a1)
{
  id v3[2] = a1;
  v3[1] = a1;
  v3[0] = -[TVSSDebugSystemMenuViewController initWithDataSourceController:]( objc_alloc(&OBJC_CLASS___TVSSDebugSystemMenuViewController),  "initWithDataSourceController:",  a1[4]);
  id v2 = v3[0];
  objc_storeStrong(v3, 0LL);
  return v2;
}

id sub_10006D7FC(id a1, id a2)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  id v3 =  +[BSDescriptionBuilder succinctDescriptionForObject:]( &OBJC_CLASS___BSDescriptionBuilder,  "succinctDescriptionForObject:",  location[0]);
  objc_storeStrong(location, 0LL);
  return v3;
}

void sub_10006DB50(void *a1, void *a2, void *a3, void *a4)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  id v8 = 0LL;
  objc_storeStrong(&v8, a3);
  id v7 = 0LL;
  objc_storeStrong(&v7, a4);
  [location[0] providerItemsDidChange:a1[4]];
  objc_storeStrong(&v7, 0LL);
  objc_storeStrong(&v8, 0LL);
  objc_storeStrong(location, 0LL);
}

NSSet *sub_10006DFDC(uint64_t a1)
{
  uint64_t v6 = objc_opt_self(a1);
  id v2 = +[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", objc_opt_class(v6));
  id v5 =  -[NSBundle URLForResource:withExtension:]( v2,  "URLForResource:withExtension:",  @"BannersAuthorizedBundleIDs",  @"plist");

  id v4 = +[NSArray arrayWithContentsOfURL:](&OBJC_CLASS___NSArray, "arrayWithContentsOfURL:", v5);
  id v3 = +[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v4);
  objc_storeStrong((id *)&v4, 0LL);
  objc_storeStrong((id *)&v5, 0LL);
  return v3;
}

void sub_10006E3FC(id *a1)
{
  char v17 = a1;
  if (a1)
  {
    BOOL v16 = [v17[3] mode] == (id)3;
    char v15 = [v17[9] isNonHighPrioritySuspendedWithLevel:0] & 1;
    if (v16)
    {
      if (v17[10])
      {
        id location = BannerManagerLog();
        os_log_type_t v13 = OS_LOG_TYPE_INFO;
        if (os_log_type_enabled((os_log_t)location, OS_LOG_TYPE_INFO))
        {
          sub_10001AC54((uint64_t)v19, (uint64_t)v17[10]);
          _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)location,  v13,  "Cancelling timer to resume paused Interactive-mode queue, queue is now being suspended. {timer=%p}",  v19,  0xCu);
        }

        objc_storeStrong(&location, 0LL);
        [v17[10] invalidate];
        objc_storeStrong(v17 + 10, 0LL);
      }

      sub_10006E94C((uint64_t)v17, v16, 0LL);
    }

    else if ((v15 & 1) != 0)
    {
      id v12 = v17[10];
      [v12 invalidate];
      objc_initWeak(&from, v17);
      id v4 = _NSConcreteStackBlock;
      int v5 = -1073741824;
      int v6 = 0;
      id v7 = sub_100070FBC;
      id v8 = &unk_1001B8A10;
      objc_copyWeak(&v9, &from);
      BOOL v10 = v16;
      id v1 =  +[NSTimer scheduledTimerWithTimeInterval:repeats:block:]( &OBJC_CLASS___NSTimer,  "scheduledTimerWithTimeInterval:repeats:block:",  0LL,  &v4,  1.0);
      id v2 = v17[10];
      v17[10] = v1;

      os_log_t oslog = (os_log_t)BannerManagerLog();
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_INFO))
      {
        sub_10003F4DC((uint64_t)v18, (uint64_t)v17[10], (uint64_t)v12);
        _os_log_impl( (void *)&_mh_execute_header,  oslog,  OS_LOG_TYPE_INFO,  "Starting timer to resume Interactive-mode queue. {timer=%p, previousTimer=%p}",  v18,  0x16u);
      }

      objc_storeStrong((id *)&oslog, 0LL);
      objc_destroyWeak(&v9);
      objc_destroyWeak(&from);
      objc_storeStrong(&v12, 0LL);
    }

    sub_100070750(v17);
  }

void sub_10006E7F0()
{
}

void sub_10006E94C(uint64_t a1, char a2, uint64_t a3)
{
  uint64_t v10 = a1;
  char v9 = a2 & 1;
  uint64_t v8 = a3;
  if (a1)
  {
    id v7 = TVSSSuspensionReasonForBannerQueueSuspensionLevel(v8);
    id location = BannerManagerLog();
    os_log_type_t v5 = OS_LOG_TYPE_INFO;
    if (os_log_type_enabled((os_log_t)location, OS_LOG_TYPE_INFO))
    {
      sub_100071110((uint64_t)v12, v9 & 1, (uint64_t)v7);
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)location,  v5,  "Updating non-high-priority suspension state. {isSuspending=%{BOOL}d, reason=%{public}@}",  v12,  0x12u);
    }

    objc_storeStrong(&location, 0LL);
    char v4 = [*(id *)(v10 + 72) isNonHighPrioritySuspendedWithLevel:v8] & 1;
    [*(id *)(v10 + 72) setNonHighPrioritySuspended:v9 & 1 level:v8];
    if ((v4 & 1) != 0
      && ([*(id *)(v10 + 72) isNonHighPrioritySuspendedWithLevel:v8] & 1) == 0)
    {
      os_log_t oslog = (os_log_t)BannerManagerLog();
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_INFO))
      {
        sub_10001AEB8((uint64_t)v11, (uint64_t)v7);
        _os_log_impl( (void *)&_mh_execute_header,  oslog,  OS_LOG_TYPE_INFO,  "Toggling banner controller suspended state to trigger resuming displaying all enqueued banners. {reason=%{public}@}",  v11,  0xCu);
      }

      objc_storeStrong((id *)&oslog, 0LL);
      [*(id *)(v10 + 48) setSuspended:1 forReason:v7 revokingCurrent:0 error:0];
      [*(id *)(v10 + 48) setSuspended:0 forReason:v7 revokingCurrent:0 error:0];
    }

    objc_storeStrong(&v7, 0LL);
  }

void sub_10006F0A4(uint64_t a1, void *a2)
{
  uint64_t v19 = a1;
  id location = 0LL;
  objc_storeStrong(&location, a2);
  if (v19)
  {
    id v8 = [*(id *)(v19 + 48) presenter];
    id v7 = [v8 topPresentables];
    id v16 = [v7 lastObject];

    if (v16)
    {
      id v15 = 0LL;
      id v14 =  +[BNPresentableIdentification uniqueIdentificationForPresentable:]( &OBJC_CLASS___BNPresentableIdentification,  "uniqueIdentificationForPresentable:",  v16);
      id v2 = *(void **)(v19 + 48);
      id obj = 0LL;
      id v6 =  [v2 revokePresentablesWithIdentification:v14 reason:location options:0 userInfo:0 error:&obj];
      objc_storeStrong(&v15, obj);

      BOOL v13 = v6 != 0LL;
      if (!v6)
      {
        os_log_t oslog = (os_log_t)BannerManagerLog();
        os_log_type_t type = OS_LOG_TYPE_ERROR;
        if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
        {
          log = oslog;
          os_log_type_t v4 = type;
          id v5 = (id)BNEffectivePresentableDescription(v16);
          id v9 = v5;
          sub_100012D20((uint64_t)v20, (uint64_t)v9, (uint64_t)location, (uint64_t)v15);
          _os_log_error_impl( (void *)&_mh_execute_header,  log,  v4,  "Failed to revoke the top presentable. {presentable=%@, reason=%{public}@ error=%{public}@}",  v20,  0x20u);

          objc_storeStrong(&v9, 0LL);
        }

        objc_storeStrong((id *)&oslog, 0LL);
      }

      objc_storeStrong(&v14, 0LL);
      objc_storeStrong(&v15, 0LL);
    }

    objc_storeStrong(&v16, 0LL);
    int v17 = 0;
  }

  else
  {
    int v17 = 1;
  }

  objc_storeStrong(&location, 0LL);
}

id sub_10006F340(uint64_t a1)
{
  uint64_t v8 = a1;
  if (a1)
  {
    id v4 = [*(id *)(v8 + 48) presenter];
    id v3 = [v4 topPresentables];
    id location = [v3 lastObject];

    char v5 = 0;
    if (location)
    {
      id v6 = TVSSBannerPresentable(location);
      char v5 = 1;
      id v1 = v6;
    }

    else
    {
      id v1 = 0LL;
    }

    id v9 = v1;
    if ((v5 & 1) != 0) {

    }
    objc_storeStrong(&location, 0LL);
  }

  else
  {
    id v9 = 0LL;
  }

  return v9;
}

id sub_10006F468(void *a1, uint64_t a2)
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

uint64_t sub_10006F5D8(uint64_t a1, void *a2, uint64_t a3, void *a4, uint64_t a5)
{
  uint64_t v13 = a1;
  id location = 0LL;
  objc_storeStrong(&location, a2);
  uint64_t v11 = a3;
  id v10 = 0LL;
  objc_storeStrong(&v10, a4);
  if (v13)
  {
    id v6 = TVSSBannerPresentable(location);
    [v6 setPresentableUserInfo:v10];

    char v14 = [*(id *)(v13 + 48) postPresentable:location withOptions:v11 userInfo:v10 error:a5] & 1;
  }

  else
  {
    char v14 = 0;
  }

  objc_storeStrong(&v10, 0LL);
  objc_storeStrong(&location, 0LL);
  return v14 & 1;
}

NSSet *sub_10006F844(uint64_t a1)
{
  uint64_t v2 = a1;
  if (a1) {
    id v3 =  +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  PBSystemUIServiceGestureMenuSingleTap,  PBSystemUIServiceGestureTVSingleTap,  PBSystemUIServiceGestureGameControllerHome,  0LL);
  }
  else {
    id v3 = 0LL;
  }
  return v3;
}

uint64_t sub_10006FEA0(uint64_t result, int a2, uint64_t a3, int a4)
{
  *(_BYTE *)uint64_t result = 2;
  *(_BYTE *)(result + 1) = 3;
  *(_BYTE *)(result + 2) = 0;
  *(_BYTE *)(result + 3) = 4;
  *(_DWORD *)(result + 4) = a2;
  *(_BYTE *)(result + _Block_object_dispose((const void *)(v18 - 72), 8) = 66;
  *(_BYTE *)(result + 9) = 8;
  *(void *)(result + 10) = a3;
  *(_BYTE *)(result + 1_Block_object_dispose((const void *)(v18 - 72), 8) = 0;
  *(_BYTE *)(result + 19) = 4;
  *(_DWORD *)(result + 20) = a4;
  return result;
}

void sub_100070178(id a1, FBSMutableSceneSettings *a2)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  v5[1] = a1;
  id v4 = location[0];
  uint64_t v2 = objc_opt_class(&OBJC_CLASS___BNMutableSceneSettings);
  v5[0] = sub_10006F468(v4, v2);
  [v5[0] setClientContainerViewControllerClass:objc_opt_class(TVSPBannerClientContainerViewController)];
  objc_storeStrong(v5, 0LL);
  objc_storeStrong(location, 0LL);
}

uint64_t sub_100070488(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(_BYTE *)uint64_t result = 2;
  *(_BYTE *)(result + 1) = 2;
  *(_BYTE *)(result + 2) = 0;
  *(_BYTE *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 64;
  *(_BYTE *)(result + 13) = 8;
  *(void *)(result + 14) = a3;
  return result;
}

void sub_100070554(void *a1, void *a2)
{
  id v7 = a1;
  id location = 0LL;
  objc_storeStrong(&location, a2);
  if (v7)
  {
    id v4 = [v7 delegate];
    id v3 = sub_100070D70((uint64_t)v7, location);
    os_log_t oslog = (os_log_t)BannerManagerLog();
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      sub_100070F50((uint64_t)v8, (uint64_t)v4, (uint64_t)location, (uint64_t)v3);
      _os_log_impl( (void *)&_mh_execute_header,  oslog,  OS_LOG_TYPE_DEFAULT,  "Requesting external gestures for presentable. {delegate=%p, presentable=%@, gestures=%{public}@}",  v8,  0x20u);
    }

    objc_storeStrong((id *)&oslog, 0LL);
    [v4 bannerManager:v7 requestsExternalGestures:v3];
    objc_storeStrong(&v3, 0LL);
    objc_storeStrong(&v4, 0LL);
    int v5 = 0;
  }

  else
  {
    int v5 = 1;
  }

  objc_storeStrong(&location, 0LL);
}

void sub_100070750(id *a1)
{
  char v14 = a1;
  if (a1)
  {
    id v8 = [v14[8] fullyPresentedTopPresentables];
    BOOL v9 = [v8 count] != 0;

    BOOL v13 = v9;
    if (v9)
    {
      id v5 = [v14[6] presenter];
      id v4 = [v5 topPresentables];
      id v12 = [v4 lastObject];

      id v6 = v14;
      id v7 = TVSSBannerPresentable(v12);
      sub_100070554(v6, v7);

      objc_storeStrong(&v12, 0LL);
    }

    else
    {
      id v11 = [v14 delegate];
      id v10 = BannerManagerLog();
      if (os_log_type_enabled((os_log_t)v10, OS_LOG_TYPE_DEFAULT))
      {
        sub_10001AC54((uint64_t)v15, (uint64_t)v11);
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v10,  OS_LOG_TYPE_DEFAULT,  "No banners being presented, relinquishing all external gestures. {delegate=%p}",  v15,  0xCu);
      }

      objc_storeStrong(&v10, 0LL);
      id v2 = v11;
      id v1 = v14;
      id v3 = sub_10006F844((uint64_t)v14);
      objc_msgSend(v2, "bannerManager:relinquishesExternalGestures:", v1);

      objc_storeStrong(&v11, 0LL);
    }
  }

uint64_t sub_100070C90(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(_BYTE *)uint64_t result = 2;
  *(_BYTE *)(result + 1) = 3;
  *(_BYTE *)(result + 2) = 66;
  *(_BYTE *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 66;
  *(_BYTE *)(result + 13) = 8;
  *(void *)(result + 14) = a3;
  *(_BYTE *)(result + 22) = 66;
  *(_BYTE *)(result + 23) = 8;
  *(void *)(result + 24) = a4;
  return result;
}

id sub_100070D70(uint64_t a1, void *a2)
{
  uint64_t v11 = a1;
  id location = 0LL;
  objc_storeStrong(&location, a2);
  if (v11)
  {
    id v8 =  +[NSMutableSet setWithObject:]( &OBJC_CLASS___NSMutableSet,  "setWithObject:",  PBSystemUIServiceGestureMenuSingleTap);
    if ([location hasPrimaryAction])
    {
      char v6 = 0;
      BOOL v5 = 0;
      if ((objc_opt_respondsToSelector(location, "primaryActionTriggeringGestures") & 1) != 0)
      {
        id v7 = [location primaryActionTriggeringGestures];
        char v6 = 1;
        BOOL v5 = [v7 count] != 0;
      }

      if ((v6 & 1) != 0) {

      }
      if (v5)
      {
        id v4 = [location primaryActionTriggeringGestures];
        -[NSMutableSet unionSet:](v8, "unionSet:");
      }

      else
      {
        -[NSMutableSet addObject:](v8, "addObject:", PBSystemUIServiceGestureTVSingleTap);
        -[NSMutableSet addObject:](v8, "addObject:", PBSystemUIServiceGestureGameControllerHome);
      }
    }

    id v12 = -[NSMutableSet copy](v8, "copy", &v8);
    int v9 = 1;
    objc_storeStrong(v3, 0LL);
  }

  else
  {
    id v12 = 0LL;
    int v9 = 1;
  }

  objc_storeStrong(&location, 0LL);
  return v12;
}

uint64_t sub_100070F50(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(_BYTE *)uint64_t result = 2;
  *(_BYTE *)(result + 1) = 3;
  *(_BYTE *)(result + 2) = 0;
  *(_BYTE *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 64;
  *(_BYTE *)(result + 13) = 8;
  *(void *)(result + 14) = a3;
  *(_BYTE *)(result + 22) = 66;
  *(_BYTE *)(result + 23) = 8;
  *(void *)(result + 24) = a4;
  return result;
}

void sub_100070FBC(uint64_t a1, void *a2)
{
  location[1] = (id)a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  oslog[1] = (os_log_t)a1;
  oslog[0] = (os_log_t)BannerManagerLog();
  os_log_type_t type = OS_LOG_TYPE_INFO;
  if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_INFO))
  {
    sub_10001AC54((uint64_t)v7, (uint64_t)location[0]);
    _os_log_impl((void *)&_mh_execute_header, oslog[0], type, "Resuming Interactive-mode queue. {timer=%p}", v7, 0xCu);
  }

  objc_storeStrong((id *)oslog, 0LL);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    sub_10006E94C((uint64_t)WeakRetained, *(_BYTE *)(a1 + 40) & 1, 0LL);
    objc_storeStrong((id *)WeakRetained + 10, 0LL);
  }

  objc_storeStrong(&WeakRetained, 0LL);
  objc_storeStrong(location, 0LL);
}

uint64_t sub_100071110(uint64_t result, int a2, uint64_t a3)
{
  *(_BYTE *)uint64_t result = 2;
  *(_BYTE *)(result + 1) = 2;
  *(_BYTE *)(result + 2) = 0;
  *(_BYTE *)(result + 3) = 4;
  *(_DWORD *)(result + 4) = a2;
  *(_BYTE *)(result + _Block_object_dispose((const void *)(v18 - 72), 8) = 66;
  *(_BYTE *)(result + 9) = 8;
  *(void *)(result + 10) = a3;
  return result;
}

void sub_100071164(uint64_t a1, void *a2)
{
  uint64_t v26 = a1;
  id location = 0LL;
  objc_storeStrong(&location, a2);
  if (v26)
  {
    id v23 = BannerManagerLog();
    os_log_type_t v22 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v23, OS_LOG_TYPE_DEFAULT))
    {
      sub_10001AEB8((uint64_t)v29, (uint64_t)location);
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v23,  v22,  "Revoking current presentables. {reason=%{public}@}",  v29,  0xCu);
    }

    objc_storeStrong(&v23, 0LL);
    [*(id *)(v26 + 64) cancelTimeoutTimer];
    memset(__b, 0, sizeof(__b));
    id obj = [*(id *)(v26 + 64) presentedPresentables];
    id v13 = [obj countByEnumeratingWithState:__b objects:v28 count:16];
    if (v13)
    {
      uint64_t v9 = *(void *)__b[2];
      uint64_t v10 = 0LL;
      id v11 = v13;
      while (1)
      {
        uint64_t v8 = v10;
        if (*(void *)__b[2] != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v21 = *(void *)(__b[1] + 8 * v10);
        id v19 = 0LL;
        BOOL v5 = *(void **)(v26 + 48);
        id v7 =  +[BNPresentableIdentification uniqueIdentificationForPresentable:]( &OBJC_CLASS___BNPresentableIdentification,  "uniqueIdentificationForPresentable:",  v21,  v2);
        id v17 = 0LL;
        id v6 = objc_msgSend(v5, "revokePresentablesWithIdentification:reason:options:animated:userInfo:error:");
        objc_storeStrong(&v19, v17);

        BOOL v18 = v6 != 0LL;
        if (!v6)
        {
          os_log_t oslog = (os_log_t)BannerManagerLog();
          os_log_type_t v15 = OS_LOG_TYPE_ERROR;
          if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
          {
            id v2 = oslog;
            os_log_type_t v3 = v15;
            id v4 = (id)BNEffectivePresentableDescription(v21);
            id v14 = v4;
            sub_100070C90((uint64_t)v27, (uint64_t)v14, (uint64_t)location, (uint64_t)v19);
            _os_log_error_impl( (void *)&_mh_execute_header,  v2,  v3,  "Error attempting to revoke presented for entering interactive mode state. {presentable=%{public}@, reason= %{public}@ error=%{public}@}",  v27,  0x20u);

            objc_storeStrong(&v14, 0LL);
          }

          objc_storeStrong((id *)&oslog, 0LL);
        }

        objc_storeStrong(&v19, 0LL);
        ++v10;
        if (v8 + 1 >= (unint64_t)v11)
        {
          uint64_t v10 = 0LL;
          id v11 = [obj countByEnumeratingWithState:__b objects:v28 count:16];
          if (!v11) {
            break;
          }
        }
      }
    }

    int v24 = 0;
  }

  else
  {
    int v24 = 1;
  }

  objc_storeStrong(&location, 0LL);
}

LABEL_25:
  objc_storeStrong(v8, 0LL);
  return v10;
}

void sub_100073214(uint64_t a1)
{
  os_log_t oslog[2] = (os_log_t)a1;
  oslog[1] = (os_log_t)a1;
  id v1 = [*(id *)(a1 + 32) joinedConversation];
  BOOL v36 = v1 == 0LL;

  if (v36)
  {
    id v31 = [*(id *)(a1 + 32) nearbyConversationIDsToDeviceHandles];
    id v2 = [v31 objectForKeyedSubscript:*(void *)(a1 + 40)];
    BOOL v32 = v2 != 0LL;

    if (v32)
    {
      id v28 = [*(id *)(a1 + 32) nearbyConversationIDsToDeviceHandles];
      id v85 = [v28 objectForKey:*(void *)(a1 + 40)];

      if (v85)
      {
        v98[0] = PBSUserNotificationWaitViewTypeKey;
        v99[0] = PBSUserNotificationWaitViewTypeSharePlay;
        v98[1] = PBSUserNotificationWaitViewDismissalDarwinNotificationKey;
        v99[1] = @"com.apple.tvcoresettings.expansecontext.joinsessionwaitviewdismissal";
        v98[2] = PBSUserNotificationResponseForWaitViewKey;
        v99[2] = &off_1001C8B40;
        uint64_t v25 =  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v99,  v98,  3LL);
        id v80 = -[NSDictionary mutableCopy](v25, "mutableCopy");

        id v79 = [v85 name];
        if (v79) {
          [v80 setObject:v79 forKeyedSubscript:PBSUserNotificationSharePlayWaitViewDeviceNameKey];
        }
        int v24 =  +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [v85 deviceModel]);
        objc_msgSend(v80, "setObject:forKeyedSubscript:");

        id v78 = 0LL;
        if ([(id)objc_opt_class(*(void *)(a1 + 32)) _isLocalDeviceFaceTimeCapable])
        {
          char v75 = 0;
          char v73 = 0;
          char v71 = 0;
          if (v79)
          {
            id v76 = TVSSLagunaLocalizedString(@"LagunaJoinSessionAlertHeaderFormat");
            char v75 = 1;
            id v74 = +[NSString localizedStringWithFormat:](&OBJC_CLASS___NSString, "localizedStringWithFormat:", v79);
            char v73 = 1;
            id v3 = v74;
          }

          else
          {
            id v72 = TVSSLagunaLocalizedString(@"LagunaJoinSessionAlertUnknownDeviceHeader");
            char v71 = 1;
            id v3 = v72;
          }

          id v77 = v3;
          if ((v71 & 1) != 0) {

          }
          if ((v73 & 1) != 0) {
          if ((v75 & 1) != 0)
          }

          char v68 = 0;
          char v66 = 0;
          if ([v85 deviceModel] == (id)2)
          {
            id v69 = TVSSLagunaLocalizedString(@"LagunaJoinSessionAlertMessagePad");
            char v68 = 1;
            id v4 = v69;
          }

          else
          {
            id v67 = TVSSLagunaLocalizedString(@"LagunaJoinSessionAlertMessagePhone");
            char v66 = 1;
            id v4 = v67;
          }

          id v70 = v4;
          if ((v66 & 1) != 0) {

          }
          if ((v68 & 1) != 0) {
          v96[0] = kCFUserNotificationAlertHeaderKey;
          }
          v97[0] = v77;
          v96[1] = kCFUserNotificationAlertMessageKey;
          v97[1] = v70;
          v96[2] = kCFUserNotificationDefaultButtonTitleKey;
          id v23 = TVSSLagunaLocalizedString(@"LagunaJoinSessionAlertDefaultButton");
          v97[2] = v23;
          v96[3] = kCFUserNotificationOtherButtonTitleKey;
          id v22 = TVSSLagunaLocalizedString(@"LagunaJoinSessionAlertOtherButton");
          v97[3] = v22;
          v96[4] = PBSUserNotificationWaitViewDictionaryKey;
          id v21 = [v80 copy];
          v97[4] = v21;
          BOOL v5 =  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v97,  v96,  5LL);
          id v6 = v78;
          id v78 = v5;

          objc_storeStrong(&v70, 0LL);
          objc_storeStrong(&v77, 0LL);
        }

        else
        {
          char v63 = 0;
          char v61 = 0;
          char v59 = 0;
          if (v79)
          {
            id v64 = TVSSLagunaLocalizedString(@"ExpanseJoinSessionAlertMessageFormat");
            char v63 = 1;
            id v62 = +[NSString localizedStringWithFormat:](&OBJC_CLASS___NSString, "localizedStringWithFormat:", v79);
            char v61 = 1;
            id v7 = v62;
          }

          else
          {
            id v60 = TVSSLagunaLocalizedString(@"ExpanseJoinSessionAlertUnknownDeviceMessage");
            char v59 = 1;
            id v7 = v60;
          }

          id v65 = v7;
          if ((v59 & 1) != 0) {

          }
          if ((v61 & 1) != 0) {
          if ((v63 & 1) != 0)
          }

          v94[0] = kCFUserNotificationAlertHeaderKey;
          id v20 = TVSSLagunaLocalizedString(@"ExpanseJoinSessionAlertHeader");
          v95[0] = v20;
          v94[1] = kCFUserNotificationAlertMessageKey;
          v95[1] = v65;
          v94[2] = kCFUserNotificationDefaultButtonTitleKey;
          id v19 = TVSSLagunaLocalizedString(@"ExpanseJoinSessionAlertDefaultButton");
          v95[2] = v19;
          v94[3] = kCFUserNotificationOtherButtonTitleKey;
          id v18 = TVSSLagunaLocalizedString(@"ExpanseJoinSessionAlertOtherButton");
          v95[3] = v18;
          v94[4] = PBSUserNotificationWaitViewDictionaryKey;
          id v17 = [v80 copy];
          v95[4] = v17;
          uint64_t v8 =  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v95,  v94,  5LL);
          id v9 = v78;
          id v78 = v8;

          objc_storeStrong(&v65, 0LL);
        }

        CFUserNotificationRef userNotification = CFUserNotificationCreate(kCFAllocatorDefault, 0.0, 0LL, &error, (CFDictionaryRef)v78);
        if (userNotification)
        {
          os_log_t v54 = (os_log_t)FaceTimeControllerLog();
          os_log_type_t v53 = OS_LOG_TYPE_DEFAULT;
          if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
          {
            os_log_type_t v15 = v54;
            os_log_type_t v16 = v53;
            sub_100010524(v52);
            _os_log_impl( (void *)&_mh_execute_header,  v15,  v16,  "Presenting join nearby session CFUserNotification.",  v52,  2u);
          }

          objc_storeStrong((id *)&v54, 0LL);
          CFOptionFlags responseFlags = 3LL;
          SInt32 error = CFUserNotificationReceiveResponse(userNotification, 0.0, &responseFlags);
          CFRelease(userNotification);
          if (responseFlags)
          {
            os_log_t v50 = (os_log_t)FaceTimeControllerLog();
            os_log_type_t v49 = OS_LOG_TYPE_DEFAULT;
            if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
            {
              sub_100074010((uint64_t)v92, responseFlags, error);
              _os_log_impl( (void *)&_mh_execute_header,  v50,  v49,  "Cancelling join nearby session flow due to responseFlags: %lu error: %d",  v92,  0x12u);
            }

            objc_storeStrong((id *)&v50, 0LL);
            int v81 = 1;
          }

          else
          {
            os_log_t v48 = (os_log_t)FaceTimeControllerLog();
            os_log_type_t v47 = OS_LOG_TYPE_DEFAULT;
            if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
            {
              id v13 = v48;
              os_log_type_t v14 = v47;
              sub_100010524(v46);
              _os_log_impl( (void *)&_mh_execute_header,  v13,  v14,  "User opted to join nearby session - joining now.",  v46,  2u);
            }

            objc_storeStrong((id *)&v48, 0LL);
            id v45 = dispatch_semaphore_create(0LL);
            id v12 = [*(id *)(a1 + 32) conduit];
            uint64_t v10 = *(void *)(a1 + 40);
            id v11 = v85;
            SEL v37 = _NSConcreteStackBlock;
            int v38 = -1073741824;
            int v39 = 0;
            v40 = sub_100074060;
            v41 = &unk_1001B8AE8;
            id v42 = v45;
            id v43 = *(id *)(a1 + 32);
            id v44 = v85;
            [v12 joinConversation:v10 onDevice:v11 withContext:3 completion:&v37];

            dispatch_semaphore_wait((dispatch_semaphore_t)v45, 0xFFFFFFFFFFFFFFFFLL);
            notify_post((const char *)[@"com.apple.tvcoresettings.expansecontext.joinsessionwaitviewdismissal" UTF8String]);
            objc_storeStrong(&v44, 0LL);
            objc_storeStrong(&v43, 0LL);
            objc_storeStrong(&v42, 0LL);
            objc_storeStrong(&v45, 0LL);
            int v81 = 0;
          }
        }

        else
        {
          os_log_t v56 = (os_log_t)FaceTimeControllerLog();
          os_log_type_t v55 = OS_LOG_TYPE_ERROR;
          if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
          {
            sub_10003EC58((uint64_t)v93, error);
            _os_log_error_impl( (void *)&_mh_execute_header,  v56,  v55,  "Error creating join nearby session CFUserNotification: %d",  v93,  8u);
          }

          objc_storeStrong((id *)&v56, 0LL);
          int v81 = 1;
        }

        objc_storeStrong(&v78, 0LL);
        objc_storeStrong(&v79, 0LL);
        objc_storeStrong(&v80, 0LL);
      }

      else
      {
        os_log_t v84 = (os_log_t)FaceTimeControllerLog();
        os_log_type_t v83 = OS_LOG_TYPE_DEFAULT;
        if (os_log_type_enabled(v84, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v26 = v84;
          os_log_type_t v27 = v83;
          sub_100010524(v82);
          _os_log_impl( (void *)&_mh_execute_header,  v26,  v27,  "Skipping join nearby session flow because no nearby device handles exist.",  v82,  2u);
        }

        objc_storeStrong((id *)&v84, 0LL);
        int v81 = 1;
      }

      objc_storeStrong(&v85, 0LL);
    }

    else
    {
      os_log_t v88 = (os_log_t)FaceTimeControllerLog();
      os_log_type_t v87 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(v88, OS_LOG_TYPE_DEFAULT))
      {
        id v29 = v88;
        os_log_type_t v30 = v87;
        sub_100010524(v86);
        _os_log_impl( (void *)&_mh_execute_header,  v29,  v30,  "Skipping join nearby session flow because no nearby conversations exist.",  v86,  2u);
      }

      objc_storeStrong((id *)&v88, 0LL);
    }
  }

  else
  {
    oslog[0] = (os_log_t)FaceTimeControllerLog();
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEFAULT))
    {
      log = oslog[0];
      os_log_type_t v34 = type;
      sub_100010524(v89);
      _os_log_impl( (void *)&_mh_execute_header,  log,  v34,  "Skipping join nearby session flow because there is already a joined conversation",  v89,  2u);
    }

    objc_storeStrong((id *)oslog, 0LL);
  }

uint64_t sub_100074010(uint64_t result, uint64_t a2, int a3)
{
  *(_BYTE *)uint64_t result = 0;
  *(_BYTE *)(result + 1) = 2;
  *(_BYTE *)(result + 2) = 0;
  *(_BYTE *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 0;
  *(_BYTE *)(result + 13) = 4;
  *(_DWORD *)(result + 14) = a3;
  return result;
}

void sub_100074060(uint64_t a1, void *a2, void *a3)
{
  location[1] = (id)a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  id v11 = 0LL;
  objc_storeStrong(&v11, a3);
  v10[1] = (id)a1;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  if (location[0])
  {
    v10[0] = FaceTimeControllerLog();
    os_log_type_t v9 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v10[0], OS_LOG_TYPE_DEFAULT))
    {
      log = (os_log_s *)v10[0];
      os_log_type_t type = v9;
      sub_100010524(v8);
      _os_log_impl((void *)&_mh_execute_header, log, type, "Joined nearby session successfully!", v8, 2u);
    }

    objc_storeStrong(v10, 0LL);
    [*(id *)(a1 + 40) notifyChange];
  }

  if (v11)
  {
    os_log_t oslog = (os_log_t)FaceTimeControllerLog();
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
    {
      sub_10000D28C((uint64_t)v13, (uint64_t)v11);
      _os_log_error_impl( (void *)&_mh_execute_header,  oslog,  OS_LOG_TYPE_ERROR,  "Error occurred while joining session: %@",  v13,  0xCu);
    }

    objc_storeStrong((id *)&oslog, 0LL);
    [*(id *)(a1 + 40) _presentPullErrorFromDeviceHandleIfNeeded:*(void *)(a1 + 48) pullError:v11];
  }

  objc_storeStrong(&v11, 0LL);
  objc_storeStrong(location, 0LL);
}

void sub_1000744FC(id *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  v10[1] = a1;
  if (a1[4])
  {
    queue = &_dispatch_main_q;
    id v4 = _NSConcreteStackBlock;
    int v5 = -1073741824;
    int v6 = 0;
    id v7 = sub_100074610;
    uint64_t v8 = &unk_1001B8B10;
    v10[0] = a1[4];
    id v9 = location[0];
    dispatch_async(queue, &v4);

    objc_storeStrong(&v9, 0LL);
    objc_storeStrong(v10, 0LL);
  }

  objc_storeStrong(location, 0LL);
}

uint64_t sub_100074610(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16LL))( *(void *)(a1 + 40),  *(void *)(a1 + 32));
}

void sub_1000747E4(id *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  v10[1] = a1;
  if (a1[4])
  {
    queue = &_dispatch_main_q;
    id v4 = _NSConcreteStackBlock;
    int v5 = -1073741824;
    int v6 = 0;
    id v7 = sub_1000748F8;
    uint64_t v8 = &unk_1001B8B10;
    v10[0] = a1[4];
    id v9 = location[0];
    dispatch_async(queue, &v4);

    objc_storeStrong(&v9, 0LL);
    objc_storeStrong(v10, 0LL);
  }

  objc_storeStrong(location, 0LL);
}

uint64_t sub_1000748F8(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16LL))( *(void *)(a1 + 40),  *(void *)(a1 + 32));
}

uint64_t sub_100074CCC(uint64_t result, uint64_t a2, int a3)
{
  *(_BYTE *)uint64_t result = 2;
  *(_BYTE *)(result + 1) = 2;
  *(_BYTE *)(result + 2) = 32;
  *(_BYTE *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 0;
  *(_BYTE *)(result + 13) = 4;
  *(_DWORD *)(result + 14) = a3;
  return result;
}

uint64_t sub_100074F28(id obj)
{
  id location = 0LL;
  objc_storeStrong(&location, obj);
  id v5 = [location activity];
  id v4 = [v5 metadata];
  id v3 = [v4 context];
  id v2 = [v3 typedIdentifier];
  unsigned __int8 v6 = [v2 isEqualToString:TUConversationActivityContextIdentifierScreenSharing];

  objc_storeStrong(&location, 0LL);
  return v6 & 1;
}

void sub_1000755CC(uint64_t a1, char a2, id obj)
{
  uint64_t v6 = a1;
  char v5 = a2 & 1;
  id location = 0LL;
  objc_storeStrong(&location, obj);
  if (*(void *)(a1 + 32)) {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
  }
  objc_storeStrong(&location, 0LL);
}

void sub_100075658(uint64_t a1, uint64_t a2, id obj)
{
  uint64_t v8 = a1;
  uint64_t v7 = a2;
  id location = 0LL;
  objc_storeStrong(&location, obj);
  uint64_t v4 = *(void *)(a1 + 32);
  char v5 =  +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.TVSSFaceTimePlatter.errors",  v7,  location);
  (*(void (**)(uint64_t, void))(v4 + 16))(v4, 0LL);

  objc_storeStrong(&location, 0LL);
}

void sub_100075708(void *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  oslog[1] = (os_log_t)a1;
  oslog[0] = (os_log_t)FaceTimeControllerLog();
  if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEFAULT))
  {
    sub_100075838((uint64_t)v5, location[0] != 0LL, (uint64_t)location[0]);
    _os_log_impl( (void *)&_mh_execute_header,  oslog[0],  OS_LOG_TYPE_DEFAULT,  "Launched activity for current activity session with result: %{BOOL}d error: %@",  v5,  0x12u);
  }

  objc_storeStrong((id *)oslog, 0LL);
  (*(void (**)(void, BOOL, id))(a1[4] + 16LL))(a1[4], location[0] == 0LL, location[0]);
  objc_storeStrong(location, 0LL);
}

uint64_t sub_100075838(uint64_t result, int a2, uint64_t a3)
{
  *(_BYTE *)uint64_t result = 2;
  *(_BYTE *)(result + 1) = 2;
  *(_BYTE *)(result + 2) = 0;
  *(_BYTE *)(result + 3) = 4;
  *(_DWORD *)(result + 4) = a2;
  *(_BYTE *)(result + _Block_object_dispose((const void *)(v18 - 72), 8) = 64;
  *(_BYTE *)(result + 9) = 8;
  *(void *)(result + 10) = a3;
  return result;
}

uint64_t sub_100075C2C(id *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  id v5 = [location[0] callGroupUUID];
  id v4 = [a1[4] groupUUID];
  unsigned __int8 v6 = objc_msgSend(v5, "isEqual:");

  objc_storeStrong(location, 0LL);
  return v6 & 1;
}

BOOL sub_100075F2C(id a1, TUContinuityCall *a2)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  BOOL v3 = [location[0] status] == 4;
  objc_storeStrong(location, 0LL);
  return v3;
}

uint64_t sub_100075F9C(void *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  id v4 = [location[0] uuid];
  unsigned __int8 v5 = [v4 isEqual:a1[4]];

  objc_storeStrong(location, 0LL);
  return v5 & 1;
}

void sub_1000764F4(id *a1)
{
  id v2[2] = a1;
  v2[1] = a1;
  v2[0] = objc_loadWeakRetained(a1 + 4);
  id v1 = [v2[0] delegate];
  [v1 faceTimePlatterBackingStoreDidChange:v2[0]];

  objc_storeStrong(v2, 0LL);
}

NSString *__cdecl sub_1000778BC(id a1, TVSSMenuItemProvider *a2)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  id v3 = [location[0] identifier];
  objc_storeStrong(location, 0LL);
  return (NSString *)v3;
}

void sub_100077E60(void *a1, void *a2, void *a3, void *a4)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  id v8 = 0LL;
  objc_storeStrong(&v8, a3);
  id v7 = 0LL;
  objc_storeStrong(&v7, a4);
  [location[0] menuDataSourceControllerDidChange:a1[4]];
  objc_storeStrong(&v7, 0LL);
  objc_storeStrong(&v8, 0LL);
  objc_storeStrong(location, 0LL);
}

void sub_100078610(id a1)
{
  os_log_t v1 = os_log_create("com.apple.TVSystemUIService.menuItemProvider", "TVSSVideoMicMenuItemProvider");
  id v2 = (void *)qword_100221CC8;
  qword_100221CC8 = (uint64_t)v1;
}

id sub_100078B58(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = [WeakRetained stateDumpBuilder];
  id v4 = [v2 build];

  return v4;
}

BOOL sub_10007ACFC(void *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  id v4 = (void *)a1[4];
  id v5 = [location[0] identifier];
  unsigned __int8 v6 = objc_msgSend(v4, "containsObject:");

  objc_storeStrong(location, 0LL);
  return !(v6 & 1);
}

id sub_10007BC88(uint64_t a1)
{
  return *(id *)(*(void *)(a1 + 32) + 8LL);
}

id sub_10007BCAC(uint64_t a1)
{
  return *(id *)(*(void *)(a1 + 32) + 16LL);
}

uint64_t sub_10007BCD0(uint64_t a1)
{
  return *(_BYTE *)(*(void *)(a1 + 32) + 24LL) & 1;
}

id sub_10007BCF8(uint64_t a1)
{
  return *(id *)(*(void *)(a1 + 32) + 32LL);
}

uint64_t sub_10007BD1C(uint64_t a1)
{
  return *(_BYTE *)(*(void *)(a1 + 32) + 40LL) & 1;
}

uint64_t sub_10007BD44(uint64_t a1)
{
  return *(_BYTE *)(*(void *)(a1 + 32) + 41LL) & 1;
}

uint64_t sub_10007BD6C(uint64_t a1)
{
  return *(_BYTE *)(*(void *)(a1 + 32) + 42LL) & 1;
}

id sub_10007BD94(uint64_t a1)
{
  return *(id *)(*(void *)(a1 + 32) + 48LL);
}

uint64_t sub_10007BDB8(uint64_t a1)
{
  return *(_BYTE *)(*(void *)(a1 + 32) + 56LL) & 1;
}

uint64_t sub_10007BDE0(uint64_t a1)
{
  return *(_BYTE *)(*(void *)(a1 + 32) + 57LL) & 1;
}

uint64_t sub_10007BE08(uint64_t a1)
{
  return *(_BYTE *)(*(void *)(a1 + 32) + 58LL) & 1;
}

uint64_t sub_10007BE30(uint64_t a1)
{
  return *(void *)(*(void *)(a1 + 32) + 64LL);
}

uint64_t sub_10007BE54(uint64_t a1)
{
  return *(_BYTE *)(*(void *)(a1 + 32) + 72LL) & 1;
}

uint64_t sub_10007BE7C(uint64_t a1)
{
  return *(void *)(*(void *)(a1 + 32) + 88LL);
}

uint64_t sub_10007BEA0(uint64_t a1)
{
  return *(_BYTE *)(*(void *)(a1 + 32) + 96LL) & 1;
}

id sub_10007BEC8(uint64_t a1)
{
  return *(id *)(*(void *)(a1 + 32) + 104LL);
}

void sub_10007D6E8(id a1)
{
  os_log_t v1 = +[NSMapTable strongToStrongObjectsMapTable](&OBJC_CLASS___NSMapTable, "strongToStrongObjectsMapTable");
  id v2 = (void *)qword_100221CD8;
  qword_100221CD8 = (uint64_t)v1;

  id v4 = (void *)qword_100221CD8;
  uint64_t v3 = objc_opt_class(&OBJC_CLASS___TVSSHUDVisualizationView);
  [v4 setObject:v3 forKey:objc_opt_class(TVSSHUDVisualization)];
  unsigned __int8 v6 = (void *)qword_100221CD8;
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___TVSSHUDBoxedValueVisualizationView);
  [v6 setObject:v5 forKey:objc_opt_class(TVSSHUDBoxedValueVisualization)];
  id v8 = (void *)qword_100221CD8;
  uint64_t v7 = objc_opt_class(&OBJC_CLASS___TVSSHUDValueHistoryVisualizationView);
  [v8 setObject:v7 forKey:objc_opt_class(TVSSHUDValueHistoryVisualization)];
  uint64_t v10 = (void *)qword_100221CD8;
  uint64_t v9 = objc_opt_class(0x100218000LL);
  [v10 setObject:v9 forKey:objc_opt_class(TVSSHUDTimeIntervalVisualization)];
}

void sub_10007D8F8(id obj)
{
  id location = 0LL;
  objc_storeStrong(&location, obj);
  [location setUserInteractionEnabled:0];
  uint64_t v5 = +[UIColor colorWithWhite:alpha:](&OBJC_CLASS___UIColor, "colorWithWhite:alpha:", 0.07, 0.8);
  objc_msgSend(location, "setBackgroundColor:");

  id v6 = [location layer];
  [v6 setCornerRadius:12.0];

  id v7 = [location layer];
  [v7 setCornerCurve:kCACornerCurveContinuous];

  os_log_t v1 = +[NSMapTable strongToStrongObjectsMapTable](&OBJC_CLASS___NSMapTable, "strongToStrongObjectsMapTable");
  id v2 = (void *)*((void *)location + 1);
  *((void *)location + 1) = v1;

  uint64_t v3 = objc_alloc_init(&OBJC_CLASS___UIStackView);
  id v4 = (void *)*((void *)location + 2);
  *((void *)location + 2) = v3;

  [*((id *)location + 2) setTranslatesAutoresizingMaskIntoConstraints:0];
  [*((id *)location + 2) setDistribution:3];
  objc_msgSend(*((id *)location + 2), "setAxis:");
  [*((id *)location + 2) setAlignment:1];
  [*((id *)location + 2) setSpacing:2.0];
  [location addSubview:*((void *)location + 2)];
  id v10 = [*((id *)location + 2) centerXAnchor];
  id v9 = [location centerXAnchor];
  id v8 = objc_msgSend(v10, "constraintEqualToAnchor:");
  [v8 setActive:1];

  id v13 = [*((id *)location + 2) centerYAnchor];
  id v12 = [location centerYAnchor];
  id v11 = objc_msgSend(v13, "constraintEqualToAnchor:");
  [v11 setActive:1];

  id v16 = [location widthAnchor];
  id v15 = [*((id *)location + 2) widthAnchor];
  id v14 = objc_msgSend(v16, "constraintEqualToAnchor:constant:");
  [v14 setActive:1];

  id v19 = [location heightAnchor];
  id v18 = [*((id *)location + 2) heightAnchor];
  id v17 = objc_msgSend(v19, "constraintEqualToAnchor:constant:", 20.0);
  [v17 setActive:1];

  objc_storeStrong(&location, 0LL);
}

id sub_10007F808(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) view];
  [v2 removeFromSuperview];

  return [*(id *)(a1 + 32) removeFromParentViewController];
}

id sub_10007F87C(void *a1, uint64_t a2)
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

id sub_10007F93C(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded", a1, a1);
}

void sub_10007F96C(uint64_t a1, void *a2)
{
  location[1] = (id)a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  uint64_t v13 = a1;
  id v3 = location[0];
  id v4 = _NSConcreteStackBlock;
  int v5 = -1073741824;
  int v6 = 0;
  uint64_t v7 = sub_10007FA98;
  id v8 = &unk_1001B8F00;
  char v12 = *(_BYTE *)(a1 + 56) & 1;
  id v9 = *(id *)(a1 + 32);
  id v10 = *(id *)(a1 + 40);
  id v11 = *(id *)(a1 + 48);
  objc_msgSend(v3, "addTransactionDidCompleteBlock:");
  objc_storeStrong(&v11, 0LL);
  objc_storeStrong(&v10, 0LL);
  objc_storeStrong(&v9, 0LL);
  objc_storeStrong(location, 0LL);
}

void sub_10007FA98(uint64_t a1, void *a2)
{
  location[1] = (id)a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  if ((*(_BYTE *)(a1 + 56) & 1) != 0)
  {
    id v4 = [*(id *)(a1 + 32) orthogonalNavigationFocusSinkView];
    [v4 removeFromSuperview];

    id v5 = [*(id *)(a1 + 32) orthogonalNavigationFocusSinkView];
    unsigned __int8 v6 = [v5 isFocused];

    [*(id *)(a1 + 32) setOrthogonalNavigationFocusSinkView:0];
    if ((v6 & 1) != 0)
    {
      id v2 = [*(id *)(a1 + 32) view];
      [v2 setNeedsFocusUpdate];

      id v3 = [*(id *)(a1 + 32) view];
      [v3 updateFocusIfNeeded];
    }
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
  if (*(void *)(a1 + 48)) {
    (*(void (**)(void, void))(*(void *)(a1 + 48) + 16))( *(void *)(a1 + 48),  ([location[0] isFailed] ^ 1) & 1);
  }
  objc_storeStrong(location, 0LL);
}

void sub_10008029C(id a1)
{
  v4[2] = a1;
  v4[1] = a1;
  v4[0] = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  for (int i = 0; i < +[TVSSWaveformData amplitudeCount](&OBJC_CLASS___TVSSWaveformData, "amplitudeCount"); ++i)
    [v4[0] addObject:&off_1001C8B58];
  os_log_t v1 = -[TVSSWaveformData initWithAmplitudes:](objc_alloc(&OBJC_CLASS___TVSSWaveformData), "initWithAmplitudes:", v4[0]);
  id v2 = (void *)qword_100221CF0;
  qword_100221CF0 = (uint64_t)v1;

  objc_storeStrong(v4, 0LL);
}

float sub_100080C14(id obj, float a2)
{
  float v21 = a2;
  id location = 0LL;
  objc_storeStrong(&location, obj);
  id v19 = [location adjustmentCoefficients];
  id v17 = [v19 objectAtIndexedSubscript:0];
  [v17 floatValue];
  double v9 = v2;
  id v16 = [v19 objectAtIndexedSubscript:1];
  [v16 floatValue];
  double v10 = v9 + v3 * pow(v21, 1.0);
  id v15 = [v19 objectAtIndexedSubscript:2];
  [v15 floatValue];
  double v11 = v10 + v4 * pow(v21, 2.0);
  id v14 = [v19 objectAtIndexedSubscript:3];
  [v14 floatValue];
  double v12 = v11 + v5 * pow(v21, 3.0);
  id v13 = [v19 objectAtIndexedSubscript:4];
  [v13 floatValue];
  float v7 = v12 + v6 * pow(v21, 4.0);
  float v18 = v7;

  objc_storeStrong(&v19, 0LL);
  objc_storeStrong(&location, 0LL);
  return v18;
}

TVSPStyling *sub_10008125C(void *a1, void *a2, void *a3)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  id v14 = 0LL;
  objc_storeStrong(&v14, a3);
  id v11 = v14;
  id v12 = +[TVSPIdentifiers imageID](&OBJC_CLASS___TVSPIdentifiers, "imageID");
  unsigned __int8 v13 = objc_msgSend(v11, "isEqualToString:");

  if ((v13 & 1) != 0)
  {
    id v7 = [location[0] content];
    unsigned __int8 v8 = [v7 contentIsSelected];

    if ((v8 & 1) != 0)
    {
      id v6 = +[TVSPIdentifiers imageID](&OBJC_CLASS___TVSPIdentifiers, "imageID");
      id v5 = +[TVSPViewAttribute tintColor:](&OBJC_CLASS___TVSPViewAttribute, "tintColor:", a1[4]);
      id v17 = v5;
      float v4 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v17, 1LL);
      id v16 =  +[TVSPStyling stylingWithIdentifier:attributes:]( &OBJC_CLASS___TVSPStyling,  "stylingWithIdentifier:attributes:",  v6);
    }

    else
    {
      id v16 = 0LL;
    }
  }

  else
  {
    id v16 = 0LL;
  }

  objc_storeStrong(&v14, 0LL);
  objc_storeStrong(location, 0LL);
  return v16;
}

void sub_100082560(void *a1, void *a2, void *a3)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  id v8 = 0LL;
  objc_storeStrong(&v8, a3);
  id v5 = (void *)a1[4];
  id v7 = [location[0] UUIDString];
  id v6 = +[TVSPRow rowWithIdentifier:](&OBJC_CLASS___TVSPRow, "rowWithIdentifier:");
  objc_msgSend(v5, "addObject:");

  objc_storeStrong(&v8, 0LL);
  objc_storeStrong(location, 0LL);
}

id sub_100083474(id *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  v18[1] = a1;
  v18[0] = objc_loadWeakRetained(a1 + 4);
  if (v18[0])
  {
    uint64_t v11 = 0LL;
    id v12 = &v11;
    int v13 = 838860800;
    int v14 = 48;
    id v15 = sub_100083678;
    id v16 = sub_1000836CC;
    id v17 = 0LL;
    id v3 = [*((id *)v18[0] + 1) nearbyConversationIDsToDeviceHandles];
    id v5 = _NSConcreteStackBlock;
    int v6 = -1073741824;
    int v7 = 0;
    id v8 = sub_1000836F8;
    double v9 = &unk_1001B9008;
    v10[0] = location[0];
    v10[1] = &v11;
    [v3 enumerateKeysAndObjectsUsingBlock:&v5];

    id v20 = (id)v12[5];
    objc_storeStrong(v10, 0LL);
    _Block_object_dispose(&v11, 8);
    objc_storeStrong(&v17, 0LL);
  }

  else
  {
    id v20 = 0LL;
  }

  objc_storeStrong(v18, 0LL);
  objc_storeStrong(location, 0LL);
  return v20;
}

void sub_100083678(uint64_t a1, uint64_t a2)
{
  id location = (id *)(a2 + 40);
  float v2 = *(void **)(a2 + 40);
  id v3 = (id *)(a1 + 40);
  id *v3 = 0LL;
  objc_storeStrong(v3, v2);
  objc_storeStrong(location, 0LL);
}

void sub_1000836CC(uint64_t a1)
{
}

void sub_1000836F8(void *a1, void *a2, void *a3, _BYTE *a4)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  id v17 = 0LL;
  objc_storeStrong(&v17, a3);
  id v16 = a4;
  v15[1] = a1;
  id v12 = (void *)a1[4];
  id v13 = [location[0] UUIDString];
  unsigned __int8 v14 = objc_msgSend(v12, "isEqual:");

  if ((v14 & 1) != 0)
  {
    float v4 = objc_alloc(&OBJC_CLASS___TVSSFaceTimeNearbyDeviceContent);
    v15[0] = -[TVSSFaceTimeNearbyDeviceContent initWithNearbyDeviceHandle:conversationID:]( v4,  "initWithNearbyDeviceHandle:conversationID:",  v17,  location[0]);
    id v8 = [location[0] UUIDString];
    id v5 =  +[TVSPRenderer rendererWithIdentifier:format:content:]( &OBJC_CLASS___TVSPRenderer,  "rendererWithIdentifier:format:content:");
    uint64_t v6 = *(void *)(a1[5] + 8LL);
    int v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;

    *id v16 = 1;
    objc_storeStrong(v15, 0LL);
  }

  objc_storeStrong(&v17, 0LL);
  objc_storeStrong(location, 0LL);
}

UIMenu *sub_100083A04(id *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  v35[1] = a1;
  v35[0] = [a1[4] currentCall];
  id v4 = [a1[4] callCenter];
  id v3 = [v4 routeController];
  id v34 = [v3 pickedRoute];

  id v6 = TVSSLagunaLocalizedString(@"TVSSMicOff");
  id v5 = +[UIImage systemImageNamed:](&OBJC_CLASS___UIImage, "systemImageNamed:", @"mic.slash.fill");
  v27[1] = _NSConcreteStackBlock;
  int v28 = -1073741824;
  int v29 = 0;
  os_log_type_t v30 = sub_100084044;
  id v31 = &unk_1001B9030;
  id v32 = a1[4];
  uint64_t v33 =  +[UIAction actionWithTitle:image:identifier:handler:]( &OBJC_CLASS___UIAction,  "actionWithTitle:image:identifier:handler:",  v6,  v5,  0LL);

  -[UIAction setState:](v33, "setState:", ([a1[4] isUplinkMuted] & 1) == 0);
  int v7 = +[UIDevice currentDevice](&OBJC_CLASS___UIDevice, "currentDevice");
  v27[0] = -[UIDevice model](v7, "model");

  id v8 = TVSSLagunaLocalizedString(@"TVSSDeviceMicFormat");
  uint64_t v26 = +[NSString localizedStringWithFormat:](&OBJC_CLASS___NSString, "localizedStringWithFormat:", v27[0]);

  id v25 = +[UIImage systemImageNamed:](&OBJC_CLASS___UIImage, "systemImageNamed:", @"appletv");
  float v18 = _NSConcreteStackBlock;
  int v19 = -1073741824;
  int v20 = 0;
  float v21 = sub_100084118;
  id v22 = &unk_1001B9030;
  id v23 = a1[4];
  int v24 =  +[UIAction actionWithTitle:image:identifier:handler:]( &OBJC_CLASS___UIAction,  "actionWithTitle:image:identifier:handler:",  v26,  v25,  0LL);
  BOOL v17 = [v35[0] bluetoothAudioFormat] == (id)1;
  -[UIAction setState:](v24, "setState:", v17);
  id v9 = TVSSLagunaLocalizedString(@"TVSSBestQualityAudio");
  -[UIAction setDiscoverabilityTitle:](v24, "setDiscoverabilityTitle:");

  id v16 =  +[UIImage bluetoothAudioRouteGlyphForDisplayStyle:]( &OBJC_CLASS___UIImage,  "bluetoothAudioRouteGlyphForDisplayStyle:",  0LL);
  id v11 = [v34 name];
  id v14 = a1[4];
  id v15 =  +[UIAction actionWithTitle:image:identifier:handler:]( &OBJC_CLASS___UIAction,  "actionWithTitle:image:identifier:handler:",  v11,  v16,  0LL);

  -[UIAction setState:](v15, "setState:", [v35[0] bluetoothAudioFormat] == 0);
  v37[0] = v33;
  v37[1] = v24;
  void v37[2] = v15;
  id v12 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v37, 3LL);
  id v13 = +[UIMenu menuWithChildren:](&OBJC_CLASS___UIMenu, "menuWithChildren:");

  objc_storeStrong((id *)&v15, 0LL);
  objc_storeStrong(&v14, 0LL);
  objc_storeStrong(&v16, 0LL);
  objc_storeStrong((id *)&v24, 0LL);
  objc_storeStrong(&v23, 0LL);
  objc_storeStrong(&v25, 0LL);
  objc_storeStrong((id *)&v26, 0LL);
  objc_storeStrong(v27, 0LL);
  objc_storeStrong((id *)&v33, 0LL);
  objc_storeStrong(&v32, 0LL);
  objc_storeStrong(&v34, 0LL);
  objc_storeStrong(v35, 0LL);
  objc_storeStrong(location, 0LL);
  return v13;
}

void sub_100084044(id *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  v7[1] = a1;
  v7[0] = FaceTimeControllerLog();
  os_log_type_t v6 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v7[0], OS_LOG_TYPE_DEFAULT))
  {
    log = (os_log_s *)v7[0];
    os_log_type_t type = v6;
    sub_100010524(v5);
    _os_log_impl((void *)&_mh_execute_header, log, type, "1. Muting mic", v5, 2u);
  }

  objc_storeStrong(v7, 0LL);
  [a1[4] setUplinkMuted:1];
  objc_storeStrong(location, 0LL);
}

void sub_100084118(id *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  v7[1] = a1;
  v7[0] = FaceTimeControllerLog();
  os_log_type_t v6 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v7[0], OS_LOG_TYPE_DEFAULT))
  {
    log = (os_log_s *)v7[0];
    os_log_type_t type = v6;
    sub_100010524(v5);
    _os_log_impl((void *)&_mh_execute_header, log, type, "2. Switching to A2DP format", v5, 2u);
  }

  objc_storeStrong(v7, 0LL);
  [a1[4] setUplinkMuted:0 bluetoothAudioFormat:1];
  objc_storeStrong(location, 0LL);
}

void sub_1000841F0(id *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  v7[1] = a1;
  v7[0] = FaceTimeControllerLog();
  os_log_type_t v6 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v7[0], OS_LOG_TYPE_DEFAULT))
  {
    log = (os_log_s *)v7[0];
    os_log_type_t type = v6;
    sub_100010524(v5);
    _os_log_impl((void *)&_mh_execute_header, log, type, "3. Switching to HFP format", v5, 2u);
  }

  objc_storeStrong(v7, 0LL);
  [a1[4] setUplinkMuted:0 bluetoothAudioFormat:0];
  objc_storeStrong(location, 0LL);
}

void sub_1000848F0(id a1, BOOL a2, NSError *a3)
{
  id v5 = a1;
  BOOL v4 = a2;
  id location = 0LL;
  objc_storeStrong(&location, a3);
  objc_storeStrong(&location, 0LL);
}

void sub_10008494C(id a1, BOOL a2, NSError *a3)
{
  id v5 = a1;
  BOOL v4 = a2;
  id location = 0LL;
  objc_storeStrong(&location, a3);
  objc_storeStrong(&location, 0LL);
}

uint64_t sub_100086810(void *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  id v4 = [location[0] macAddress];
  unsigned __int8 v5 = [v4 isEqualToString:a1[4]];

  objc_storeStrong(location, 0LL);
  return v5 & 1;
}

void sub_1000874F8()
{
}

void sub_100087508(id *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  id WeakRetained = objc_loadWeakRetained(a1 + 4);
  [WeakRetained _updateWithUserImage:location[0]];

  objc_storeStrong(location, 0LL);
}

void sub_100088630(void *a1, void *a2, void *a3, void *a4, void *a5)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  id v13 = 0LL;
  objc_storeStrong(&v13, a3);
  id v12 = 0LL;
  objc_storeStrong(&v12, a4);
  id v11[2] = a5;
  v11[1] = a1;
  id v10 = v12;
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___TVSSUserObserverUserInfo);
  v11[0] = sub_100088730(v10, v5);
  objc_storeStrong(v11, 0LL);
  objc_storeStrong(&v12, 0LL);
  objc_storeStrong(&v13, 0LL);
  objc_storeStrong(location, 0LL);
}

id sub_100088730(void *a1, uint64_t a2)
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

void sub_100088A70(void *a1, void *a2, void *a3, void *a4, void *a5)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  id v13 = 0LL;
  objc_storeStrong(&v13, a3);
  id v12 = 0LL;
  objc_storeStrong(&v12, a4);
  id v11[2] = a5;
  v11[1] = a1;
  id v10 = v12;
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___TVSSUserObserverUserInfo);
  v11[0] = sub_100088730(v10, v5);
  objc_storeStrong(v11, 0LL);
  objc_storeStrong(&v12, 0LL);
  objc_storeStrong(&v13, 0LL);
  objc_storeStrong(location, 0LL);
}

void sub_100088B70(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  location[1] = (id)a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  id v13 = 0LL;
  objc_storeStrong(&v13, a3);
  id v12 = 0LL;
  objc_storeStrong(&v12, a4);
  id v11[2] = a5;
  v11[1] = (id)a1;
  id v10 = v12;
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___TVSSUserObserverUserInfo);
  v11[0] = sub_100088730(v10, v5);
  objc_storeStrong(v11, 0LL);
  objc_storeStrong(&v12, 0LL);
  objc_storeStrong(&v13, 0LL);
  objc_storeStrong(location, 0LL);
}

void sub_100089884()
{
}

void sub_100089894(id *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  id WeakRetained = objc_loadWeakRetained(a1 + 4);
  [WeakRetained _updateWithUserImage:location[0]];

  objc_storeStrong(location, 0LL);
}

void sub_10008A91C(void *a1, void *a2, void *a3, void *a4, void *a5)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  id v13 = 0LL;
  objc_storeStrong(&v13, a3);
  id v12 = 0LL;
  objc_storeStrong(&v12, a4);
  id v11[2] = a5;
  v11[1] = a1;
  id v10 = v12;
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___TVSSUserObserverUserInfo);
  v11[0] = sub_100088730(v10, v5);
  objc_storeStrong(v11, 0LL);
  objc_storeStrong(&v12, 0LL);
  objc_storeStrong(&v13, 0LL);
  objc_storeStrong(location, 0LL);
}

void sub_10008AB90(void *a1, void *a2, void *a3, void *a4, void *a5)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  id v13 = 0LL;
  objc_storeStrong(&v13, a3);
  id v12 = 0LL;
  objc_storeStrong(&v12, a4);
  id v11[2] = a5;
  v11[1] = a1;
  id v10 = v12;
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___TVSSUserObserverUserInfo);
  v11[0] = sub_100088730(v10, v5);
  objc_storeStrong(v11, 0LL);
  objc_storeStrong(&v12, 0LL);
  objc_storeStrong(&v13, 0LL);
  objc_storeStrong(location, 0LL);
}

void sub_10008CA74(id *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  id v3 = [location[0] contentText1];
  BOOL v4 = [v3 length] != 0;

  [a1[4] setActive:v4];
  [a1[5] setActive:!v4];
  id v2 = [location[0] contentImage2];
  BOOL v6 = v2 != 0LL;

  BOOL v7 = 0;
  if (v4) {
    BOOL v7 = !v6;
  }
  [a1[6] setActive:v7];
  objc_storeStrong(location, 0LL);
}

id sub_10008CC18(void *a1, uint64_t a2)
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

void sub_10008D5F0(id *a1, char a2, id obj)
{
  id v14 = a1;
  char v13 = a2 & 1;
  id location = 0LL;
  objc_storeStrong(&location, obj);
  v11[1] = a1;
  queue = &_dispatch_main_q;
  uint64_t v5 = _NSConcreteStackBlock;
  int v6 = -1073741824;
  int v7 = 0;
  id v8 = sub_10008D6F8;
  id v9 = &unk_1001B9428;
  objc_copyWeak(v11, a1 + 5);
  id v10 = a1[4];
  dispatch_async(queue, &v5);

  objc_storeStrong(&v10, 0LL);
  objc_destroyWeak(v11);
  objc_storeStrong(&location, 0LL);
}

void sub_10008D6F8(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v1 = [WeakRetained sleepTimerController];
  [v1 setCurrentScheduledSleep:0];

  id v4 = *(void **)(a1 + 32);
  id v5 = +[TVSPAnimator defaultAnimator](&OBJC_CLASS___TVSPAnimator, "defaultAnimator");
  objc_msgSend(v4, "popPlatterControllerWithAnimator:");
}

void sub_10008DB1C(id *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  v9[1] = a1;
  id v8 = [a1[4] content];

  if (v8)
  {
    v9[0] = [a1[4] content];
    id v3 = [v9[0] predictedEndDate];
    [v3 timeIntervalSinceNow];
    double v4 = v2;

    id v6 = (id)FormatTime(v4);
    id v5 = [a1[4] timeLabel];
    [v5 setText:v6];

    objc_storeStrong(v9, 0LL);
  }

  objc_storeStrong(location, 0LL);
}

UIColor *__cdecl sub_10008EAF4(id a1, UITraitCollection *a2)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  char v6 = 0;
  char v4 = 0;
  if ([location[0] userInterfaceStyle] == (id)2)
  {
    id v7 = +[UIColor systemGray3Color](&OBJC_CLASS___UIColor, "systemGray3Color");
    char v6 = 1;
    double v2 = (UIColor *)v7;
  }

  else
  {
    id v5 =  +[UIColor colorWithRed:green:blue:alpha:]( &OBJC_CLASS___UIColor,  "colorWithRed:green:blue:alpha:",  0.749019608,  0.749019608,  0.749019608,  1.0);
    char v4 = 1;
    double v2 = v5;
  }

  id v9 = v2;
  if ((v4 & 1) != 0) {

  }
  if ((v6 & 1) != 0) {
  objc_storeStrong(location, 0LL);
  }
  return v9;
}

UIColor *__cdecl sub_10008EC40(id a1, UITraitCollection *a2)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  char v6 = 0;
  char v4 = 0;
  if ([location[0] userInterfaceStyle] == (id)2)
  {
    id v7 =  +[UIColor colorWithRed:green:blue:alpha:]( &OBJC_CLASS___UIColor,  "colorWithRed:green:blue:alpha:",  0.48627451,  0.48627451,  0.48627451,  1.0);
    char v6 = 1;
    double v2 = v7;
  }

  else
  {
    id v5 =  +[UIColor colorWithRed:green:blue:alpha:]( &OBJC_CLASS___UIColor,  "colorWithRed:green:blue:alpha:",  0.501960784,  0.501960784,  0.501960784,  1.0);
    char v4 = 1;
    double v2 = v5;
  }

  id v9 = v2;
  if ((v4 & 1) != 0) {

  }
  if ((v6 & 1) != 0) {
  objc_storeStrong(location, 0LL);
  }
  return v9;
}

id sub_100090830(id a1, id a2)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  id v3 =  +[BSDescriptionBuilder succinctDescriptionForObject:]( &OBJC_CLASS___BSDescriptionBuilder,  "succinctDescriptionForObject:",  location[0]);
  objc_storeStrong(location, 0LL);
  return v3;
}

id sub_100090CB0(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "menuItems", a1, a1);
}

id sub_100090CE0(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "displayTime", a1, a1);
}

id sub_100091114(uint64_t a1)
{
  uint64_t v6 = a1;
  uint64_t v5 = a1;
  double v2 = *(void **)(a1 + 32);
  CGAffineTransformMakeScale(&v4, 0.8, 0.8);
  [v2 setTransform:&v4];
  return [*(id *)(a1 + 32) setAlpha:0.0];
}

void sub_100093034()
{
}

void sub_100093044(id *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  v3[1] = a1;
  v3[0] = objc_loadWeakRetained(a1 + 4);
  [v3[0] selectOneShotFraming];
  objc_storeStrong(v3, 0LL);
  objc_storeStrong(location, 0LL);
}

id sub_100093C5C(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded", a1, a1);
}

  ;
}

id sub_1000945D8(void *a1, uint64_t a2)
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

uint64_t sub_100094698(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(_BYTE *)uint64_t result = 2;
  *(_BYTE *)(result + 1) = 3;
  *(_BYTE *)(result + 2) = 66;
  *(_BYTE *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 0;
  *(_BYTE *)(result + 13) = 8;
  *(void *)(result + 14) = a3;
  *(_BYTE *)(result + 22) = 64;
  *(_BYTE *)(result + 23) = 8;
  *(void *)(result + 24) = a4;
  return result;
}

int main(int argc, const char **argv, const char **envp)
{
  int v11 = 0;
  int v10 = argc;
  id v9 = (char **)argv;
  id v8 = 0LL;
  context = objc_autoreleasePoolPush();
  id v3 = (objc_class *)objc_opt_class(&OBJC_CLASS___TVSSAppDelegate);
  id v4 = NSStringFromClass(v3);
  id v5 = v8;
  id v8 = v4;

  objc_autoreleasePoolPop(context);
  int v11 = UIApplicationMain(v10, v9, 0LL, (NSString *)v8);
  objc_storeStrong(&v8, 0LL);
  return v11;
}

UIColor *__cdecl sub_100094F84(id a1, UITraitCollection *a2)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  char v6 = 0;
  char v4 = 0;
  if ([location[0] userInterfaceStyle] == (id)2)
  {
    id v7 = +[TVSPConstants defaultDarkModeTextColor](&OBJC_CLASS___TVSPConstants, "defaultDarkModeTextColor");
    char v6 = 1;
    id v2 = v7;
  }

  else
  {
    id v5 = +[TVSPConstants defaultLightModeTextColor](&OBJC_CLASS___TVSPConstants, "defaultLightModeTextColor");
    char v4 = 1;
    id v2 = v5;
  }

  id v9 = v2;
  if ((v4 & 1) != 0) {

  }
  if ((v6 & 1) != 0) {
  objc_storeStrong(location, 0LL);
  }
  return (UIColor *)v9;
}

void sub_100095D84(id *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  id WeakRetained = objc_loadWeakRetained(a1 + 4);
  [WeakRetained _notifyDelegateVisualizationDidChange];

  objc_storeStrong(location, 0LL);
}

TVSPStyling *sub_100097600(id *a1, void *a2, void *a3)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  id v23 = 0LL;
  objc_storeStrong(&v23, a3);
  id v14 = v23;
  id v15 = +[TVSPIdentifiers imageID](&OBJC_CLASS___TVSPIdentifiers, "imageID");
  unsigned __int8 v16 = objc_msgSend(v14, "isEqual:");

  if ((v16 & 1) != 0)
  {
    id v8 = [a1[4] networkState];
    BOOL v9 = [v8 activeInterfaceType] == 0;

    id v10 = [a1[4] networkState];
    char v21 = 0;
    char v19 = 0;
    char v17 = 0;
    BOOL v11 = 0;
    if ([v10 activeInterfaceType] == (id)2)
    {
      id v22 = [a1[4] networkState];
      char v21 = 1;
      id v20 = [v22 wifiState];
      char v19 = 1;
      id v18 = [v20 networkName];
      char v17 = 1;
      BOOL v11 = [v18 length] == 0;
    }

    if ((v17 & 1) != 0) {

    }
    if ((v19 & 1) != 0) {
    if ((v21 & 1) != 0)
    }

    if (v9 || v11)
    {
      id v25 = 0LL;
    }

    else
    {
      id v7 = +[TVSPIdentifiers imageID](&OBJC_CLASS___TVSPIdentifiers, "imageID");
      id v6 = +[TVSPConstants defaultSelectedTintColor](&OBJC_CLASS___TVSPConstants, "defaultSelectedTintColor");
      id v5 = +[TVSPViewAttribute tintColor:](&OBJC_CLASS___TVSPViewAttribute, "tintColor:");
      id v26 = v5;
      char v4 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v26, 1LL);
      id v25 =  +[TVSPStyling stylingWithIdentifier:attributes:]( &OBJC_CLASS___TVSPStyling,  "stylingWithIdentifier:attributes:",  v7);
    }
  }

  else
  {
    id v25 = 0LL;
  }

  objc_storeStrong(&v23, 0LL);
  objc_storeStrong(location, 0LL);
  return v25;
}

TVSPStyling *sub_1000979E4(id *a1, void *a2, void *a3)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  id v13 = 0LL;
  objc_storeStrong(&v13, a3);
  id v10 = v13;
  id v11 = +[TVSPIdentifiers imageID](&OBJC_CLASS___TVSPIdentifiers, "imageID");
  unsigned __int8 v12 = objc_msgSend(v10, "isEqualToString:");

  if ((v12 & 1) != 0)
  {
    if ([a1[4] hasExternalPickedRoutes])
    {
      id v7 = +[TVSPIdentifiers imageID](&OBJC_CLASS___TVSPIdentifiers, "imageID");
      id v6 = +[TVSPConstants defaultSelectedTintColor](&OBJC_CLASS___TVSPConstants, "defaultSelectedTintColor");
      id v5 = +[TVSPViewAttribute tintColor:](&OBJC_CLASS___TVSPViewAttribute, "tintColor:");
      id v16 = v5;
      char v4 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v16, 1LL);
      id v15 =  +[TVSPStyling stylingWithIdentifier:attributes:]( &OBJC_CLASS___TVSPStyling,  "stylingWithIdentifier:attributes:",  v7);
    }

    else
    {
      id v15 = 0LL;
    }
  }

  else
  {
    id v15 = 0LL;
  }

  objc_storeStrong(&v13, 0LL);
  objc_storeStrong(location, 0LL);
  return v15;
}

TVSPStyling *sub_100097C04(id *a1, void *a2, void *a3)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  id v16 = 0LL;
  objc_storeStrong(&v16, a3);
  id v13 = v16;
  id v14 = +[TVSPIdentifiers imageID](&OBJC_CLASS___TVSPIdentifiers, "imageID");
  unsigned __int8 v15 = objc_msgSend(v13, "isEqualToString:");

  if ((v15 & 1) != 0)
  {
    id v9 = [a1[4] connectedPairedDevices];
    BOOL v10 = [v9 count] != 0;

    if (v10)
    {
      id v8 = +[TVSPIdentifiers imageID](&OBJC_CLASS___TVSPIdentifiers, "imageID");
      id v7 = +[TVSPConstants defaultSelectedTintColor](&OBJC_CLASS___TVSPConstants, "defaultSelectedTintColor");
      id v6 = +[TVSPViewAttribute tintColor:](&OBJC_CLASS___TVSPViewAttribute, "tintColor:");
      v19[0] = v6;
      id v5 = +[TVSPLayerAttribute compositingFilter:](&OBJC_CLASS___TVSPLayerAttribute, "compositingFilter:", 0LL);
      v19[1] = v5;
      char v4 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v19, 2LL);
      id v18 =  +[TVSPStyling stylingWithIdentifier:attributes:]( &OBJC_CLASS___TVSPStyling,  "stylingWithIdentifier:attributes:",  v8);
    }

    else
    {
      id v18 = 0LL;
    }
  }

  else
  {
    id v18 = 0LL;
  }

  objc_storeStrong(&v16, 0LL);
  objc_storeStrong(location, 0LL);
  return v18;
}

TVSPStyling *__cdecl sub_100097E98(id a1, TVSPStylingBlockRenderer *a2, NSString *a3)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  id v26 = 0LL;
  objc_storeStrong(&v26, a3);
  id v25 = a1;
  id v17 = v26;
  id v18 = +[TVSPIdentifiers imageID](&OBJC_CLASS___TVSPIdentifiers, "imageID");
  unsigned __int8 v19 = objc_msgSend(v17, "isEqualToString:");

  char v24 = v19 & 1;
  if ((v19 & 1) != 0)
  {
    char v22 = 0;
    memset(__b, 0, sizeof(__b));
    id v13 = +[TVSSAccessibilityItem allAXItems](&OBJC_CLASS___TVSSAccessibilityItem, "allAXItems");
    id v14 = [v13 countByEnumeratingWithState:__b objects:v30 count:16];
    if (v14)
    {
      uint64_t v10 = *(void *)__b[2];
      uint64_t v11 = 0LL;
      id v12 = v14;
      while (1)
      {
        uint64_t v9 = v11;
        if (*(void *)__b[2] != v10) {
          objc_enumerationMutation(v13);
        }
        id v21 = *(id *)(__b[1] + 8 * v11);
        ++v11;
        if (v9 + 1 >= (unint64_t)v12)
        {
          uint64_t v11 = 0LL;
          id v12 = [v13 countByEnumeratingWithState:__b objects:v30 count:16];
          if (!v12) {
            goto LABEL_11;
          }
        }
      }

      char v22 = 1;
      int v23 = 2;
    }

    else
    {
LABEL_11:
      int v23 = 0;
    }

    if ((v22 & 1) != 0)
    {
      id v8 = +[TVSPIdentifiers imageID](&OBJC_CLASS___TVSPIdentifiers, "imageID");
      id v7 = +[TVSPConstants defaultSelectedTintColor](&OBJC_CLASS___TVSPConstants, "defaultSelectedTintColor");
      id v6 = +[TVSPViewAttribute tintColor:](&OBJC_CLASS___TVSPViewAttribute, "tintColor:");
      v29[0] = v6;
      id v5 = +[TVSPLayerAttribute compositingFilter:](&OBJC_CLASS___TVSPLayerAttribute, "compositingFilter:", 0LL);
      v29[1] = v5;
      char v4 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v29, 2LL);
      int v28 =  +[TVSPStyling stylingWithIdentifier:attributes:]( &OBJC_CLASS___TVSPStyling,  "stylingWithIdentifier:attributes:",  v8);
    }

    else
    {
      int v28 = 0LL;
    }

    int v23 = 1;
  }

  else
  {
    int v28 = 0LL;
    int v23 = 1;
  }

  objc_storeStrong(&v26, 0LL);
  objc_storeStrong(location, 0LL);
  return v28;
}

TVSPStyling *sub_100098264(id *a1, void *a2, void *a3)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  id v14 = 0LL;
  objc_storeStrong(&v14, a3);
  id v11 = v14;
  id v12 = +[TVSPIdentifiers imageID](&OBJC_CLASS___TVSPIdentifiers, "imageID");
  unsigned __int8 v13 = objc_msgSend(v11, "isEqualToString:");

  if ((v13 & 1) != 0)
  {
    if ([a1[4] restrictionsEnabled])
    {
      id v8 = +[TVSPIdentifiers imageID](&OBJC_CLASS___TVSPIdentifiers, "imageID");
      id v7 = +[UIColor systemOrangeColor](&OBJC_CLASS___UIColor, "systemOrangeColor");
      id v6 = +[TVSPViewAttribute tintColor:](&OBJC_CLASS___TVSPViewAttribute, "tintColor:");
      v17[0] = v6;
      id v5 = +[TVSPLayerAttribute compositingFilter:](&OBJC_CLASS___TVSPLayerAttribute, "compositingFilter:", 0LL);
      v17[1] = v5;
      char v4 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v17, 2LL);
      id v16 =  +[TVSPStyling stylingWithIdentifier:attributes:]( &OBJC_CLASS___TVSPStyling,  "stylingWithIdentifier:attributes:",  v8);
    }

    else
    {
      id v16 = 0LL;
    }
  }

  else
  {
    id v16 = 0LL;
  }

  objc_storeStrong(&v14, 0LL);
  objc_storeStrong(location, 0LL);
  return v16;
}

TVSPStyling *sub_1000984B8(id *a1, void *a2, void *a3)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  id v14 = 0LL;
  objc_storeStrong(&v14, a3);
  id v11 = v14;
  id v12 = +[TVSPIdentifiers imageID](&OBJC_CLASS___TVSPIdentifiers, "imageID");
  unsigned __int8 v13 = objc_msgSend(v11, "isEqualToString:");

  if ((v13 & 1) != 0)
  {
    if ([a1[4] screenRecordingActive])
    {
      id v8 = +[TVSPIdentifiers imageID](&OBJC_CLASS___TVSPIdentifiers, "imageID");
      id v7 = +[UIColor systemRedColor](&OBJC_CLASS___UIColor, "systemRedColor");
      id v6 = +[TVSPViewAttribute tintColor:](&OBJC_CLASS___TVSPViewAttribute, "tintColor:");
      v17[0] = v6;
      id v5 = +[TVSPLayerAttribute compositingFilter:](&OBJC_CLASS___TVSPLayerAttribute, "compositingFilter:", 0LL);
      v17[1] = v5;
      char v4 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v17, 2LL);
      id v16 =  +[TVSPStyling stylingWithIdentifier:attributes:]( &OBJC_CLASS___TVSPStyling,  "stylingWithIdentifier:attributes:",  v8);
    }

    else
    {
      id v16 = 0LL;
    }
  }

  else
  {
    id v16 = 0LL;
  }

  objc_storeStrong(&v14, 0LL);
  objc_storeStrong(location, 0LL);
  return v16;
}

void sub_100099940(uint64_t a1)
{
  id v2 = +[LSApplicationWorkspace defaultWorkspace](&OBJC_CLASS___LSApplicationWorkspace, "defaultWorkspace");
  objc_msgSend(v2, "openSensitiveURL:withOptions:error:", *(void *)(a1 + 32), 0);
}

void sub_1000999A0(id *a1)
{
  id v9[2] = a1;
  v9[1] = a1;
  queue = &_dispatch_main_q;
  id v3 = _NSConcreteStackBlock;
  int v4 = -1073741824;
  int v5 = 0;
  id v6 = sub_100099A8C;
  id v7 = &unk_1001B61C0;
  id v8 = a1[4];
  v9[0] = a1[5];
  dispatch_async(queue, &v3);

  objc_storeStrong(v9, 0LL);
  objc_storeStrong(&v8, 0LL);
}

id sub_100099A8C(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "dismissSystemMenuWithSourceIdentifier:", *(void *)(a1 + 40), a1, a1);
}

BOOL sub_100099C44(id a1, TVCSAudioRoute *a2)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  id v2 = [location[0] routeUID];
  BOOL v4 = v2 != 0LL;

  objc_storeStrong(location, 0LL);
  return v4;
}

void sub_10009A00C(id *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  [a1[4] reloadContent];
  objc_storeStrong(location, 0LL);
}

id sub_10009BC44(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = [WeakRetained stateDumpBuilder];
  id v4 = [v2 build];

  return v4;
}

void sub_10009C594(void *a1, void *a2, void *a3, void *a4)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  id v8 = 0LL;
  objc_storeStrong(&v8, a3);
  id v7 = 0LL;
  objc_storeStrong(&v7, a4);
  [location[0] privacyControllerStateDidChange:a1[4]];
  objc_storeStrong(&v7, 0LL);
  objc_storeStrong(&v8, 0LL);
  objc_storeStrong(location, 0LL);
}

id sub_10009DFF8(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 88) setAlpha:1.0];
}

id sub_10009E060(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 88) setAlpha:0.0];
}

id sub_10009EAF4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateScrollPositionAndMarkerAppearance", a1, a1);
}

double sub_1000A0C94@<D0>(uint64_t a1@<X8>, double a2@<D0>, double a3@<D1>)
{
  *(double *)a1 = a2;
  double result = a3;
  *(double *)(a1 + 16) = a3;
  *(_BYTE *)(a1 + _Block_object_dispose((const void *)(v18 - 72), 8) = 1;
  *(_BYTE *)(a1 + 24) = 1;
  return result;
}

id sub_1000A0CC8(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded", a1, a1);
}

void sub_1000A156C(id a1)
{
  id v1 = -[UIColor initWithWhite:alpha:](objc_alloc(&OBJC_CLASS___UIColor), "initWithWhite:alpha:", 1.0, 0.3);
  id v2 = (void *)qword_100221CF8;
  qword_100221CF8 = (uint64_t)v1;
}

void sub_1000A1644(id a1)
{
  id v1 = +[UIColor blackColor](&OBJC_CLASS___UIColor, "blackColor", a1, a1);
  id v2 = (void *)qword_100221D08;
  qword_100221D08 = (uint64_t)v1;
}

__CFString *sub_1000A2A88(uint64_t a1)
{
  if (!a1) {
    return @"play";
  }
  if (a1 == 1) {
    return @"pause";
  }
  return @"stop";
}

void sub_1000A3930( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, _Unwind_Exception *exception_object, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id *location)
{
}

void sub_1000A3978(uint64_t a1, void *a2, void *a3)
{
  uint64_t v30 = a1;
  id location = 0LL;
  objc_storeStrong(&location, a2);
  id v28 = 0LL;
  objc_storeStrong(&v28, a3);
  if (v30)
  {
    [v28 addSubview:location];
    [location setTranslatesAutoresizingMaskIntoConstraints:0];
    +[TVSPBannerConstants bannerAppToastMinimumSize](&OBJC_CLASS___TVSPBannerConstants, "bannerAppToastMinimumSize");
    double v26 = v3;
    double v27 = v4;
    +[TVSPBannerConstants bannerAppToastMaximumSize](&OBJC_CLASS___TVSPBannerConstants, "bannerAppToastMaximumSize");
    double v24 = v5;
    double v25 = v6;
    id v22 = [location topAnchor];
    id v21 = [v28 topAnchor];
    +[TVSSConstants bannerAppToastTopSpacing](&OBJC_CLASS___TVSSConstants, "bannerAppToastTopSpacing");
    id v20 = objc_msgSend(v22, "constraintEqualToAnchor:constant:", v21);
    v31[0] = v20;
    id v19 = [location trailingAnchor];
    id v18 = [v28 trailingAnchor];
    +[TVSSConstants bannerAppToastTrailingSpacing](&OBJC_CLASS___TVSSConstants, "bannerAppToastTrailingSpacing");
    id v17 = [v19 constraintEqualToAnchor:v18 constant:-v7];
    v31[1] = v17;
    id v16 = [location widthAnchor];
    id v15 = [v16 constraintGreaterThanOrEqualToConstant:v26];
    v31[2] = v15;
    id v14 = [location widthAnchor];
    id v13 = [v14 constraintLessThanOrEqualToConstant:v24];
    v31[3] = v13;
    id v12 = [location heightAnchor];
    id v11 = [v12 constraintGreaterThanOrEqualToConstant:v27];
    v31[4] = v11;
    id v10 = [location heightAnchor];
    id v9 = [v10 constraintLessThanOrEqualToConstant:v25];
    v31[5] = v9;
    id v8 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v31, 6LL);
    +[NSLayoutConstraint activateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "activateConstraints:");
  }

  objc_storeStrong(&v28, 0LL);
  objc_storeStrong(&location, 0LL);
}

  ;
}

id sub_1000A3D10(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 1.0, a1, a1);
}

uint64_t sub_1000A3D44(uint64_t a1)
{
  uint64_t v6 = a1;
  uint64_t v5 = a1;
  id v2 = *(void **)(a1 + 32);
  memcpy(__dst, &CGAffineTransformIdentity, sizeof(__dst));
  [v2 setTransform:__dst];
  uint64_t result = objc_opt_respondsToSelector(*(void *)(a1 + 40), "presentableWillAppearAsBanner:");
  if ((result & 1) != 0) {
    return (uint64_t)[*(id *)(a1 + 40) presentableWillAppearAsBanner:*(void *)(a1 + 40)];
  }
  return result;
}

void sub_1000A3DD4(id *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  v3[1] = a1;
  v3[0] = objc_loadWeakRetained(a1 + 4);
  if (v3[0]) {
    [v3[0] satisfyMilestone:location[0]];
  }
  objc_storeStrong(v3, 0LL);
  objc_storeStrong(location, 0LL);
}

uint64_t sub_1000A3E58(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

uint64_t sub_1000A3E98(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_1000A4CE0(id *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  id v15 = [a1[4] format];
  [v15 bounds];
  double v21 = v2;
  double v22 = v3;
  double v23 = v4;
  double v24 = v5;

  id v16 = +[UIColor darkGrayColor](&OBJC_CLASS___UIColor, "darkGrayColor");
  -[UIColor setFill](v16, "setFill");

  objc_msgSend(location[0], "strokeRect:", v21, v22, v23, v24);
  id v17 = +[UIColor systemPinkColor](&OBJC_CLASS___UIColor, "systemPinkColor");
  [v17 setFill];

  id v18 = location[0];
  sub_1000A4EB0();
  objc_msgSend(v18, "fillRect:", v6, v7, v8, v9);
  id v19 = +[UIColor greenColor](&OBJC_CLASS___UIColor, "greenColor");
  -[UIColor setFill](v19, "setFill");

  id v20 = location[0];
  sub_1000A4EB0();
  objc_msgSend(v20, "fillRect:blendMode:", 1, v10, v11, v12, v13);
  objc_storeStrong(location, 0LL);
}

  ;
}

void sub_1000A4EFC(uint64_t a1, void *a2)
{
  location[1] = (id)a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  c = (CGContext *)[location[0] CGContext];
  CGContextSetFillColorWithColor(c, (CGColorRef)[*(id *)(a1 + 32) CGColor]);
  CGContextFillEllipseInRect(c, *(CGRect *)(a1 + 40));
  objc_storeStrong(location, 0LL);
}

id sub_1000A887C(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_cycleHeadphoneImages", a1, a1);
}

id waveformControllerLog()
{
  predicate = (dispatch_once_t *)&unk_100221D20;
  dispatch_block_t block = 0LL;
  objc_storeStrong(&block, &stru_1001B99C8);
  if (*predicate != -1) {
    dispatch_once(predicate, block);
  }
  objc_storeStrong(&block, 0LL);
  return (id)qword_100221D18;
}

uint64_t sub_1000A97C0(uint64_t result, uint64_t a2, int a3)
{
  *(_BYTE *)uint64_t result = 2;
  *(_BYTE *)(result + 1) = 2;
  *(_BYTE *)(result + 2) = 64;
  *(_BYTE *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 0;
  *(_BYTE *)(result + 13) = 4;
  *(_DWORD *)(result + 14) = a3;
  return result;
}

uint64_t sub_1000A9B94(uint64_t result, uint64_t a2, int a3, int a4)
{
  *(_BYTE *)uint64_t result = 2;
  *(_BYTE *)(result + 1) = 3;
  *(_BYTE *)(result + 2) = 64;
  *(_BYTE *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 0;
  *(_BYTE *)(result + 13) = 4;
  *(_DWORD *)(result + 14) = a3;
  *(_BYTE *)(result + 1_Block_object_dispose((const void *)(v18 - 72), 8) = 0;
  *(_BYTE *)(result + 19) = 4;
  *(_DWORD *)(result + 20) = a4;
  return result;
}

id sub_1000AA940(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateRoute:", *(void *)(*(void *)(a1 + 32) + 48), a1, a1);
}

BOOL sub_1000AABAC(id a1, MRAVOutputDevice *a2)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  unsigned int v3 = [location[0] isLocalDevice] ^ 1;
  objc_storeStrong(location, 0LL);
  return v3 & 1;
}

id sub_1000AAC18(id a1, MRAVOutputDevice *a2)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  unsigned int v3 = objc_alloc(&OBJC_CLASS___MPAVOutputDeviceRoute);
  id v7 = location[0];
  double v4 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v7, 1LL);
  double v5 = -[MPAVOutputDeviceRoute initWithOutputDevices:](v3, "initWithOutputDevices:");

  objc_storeStrong(location, 0LL);
  return v5;
}

id sub_1000AAEB4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setNowPlayingPID:", *(unsigned int *)(a1 + 40), a1, a1);
}

id sub_1000AAFD8(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updatePlaybackState:", *(void *)(a1 + 40), a1, a1);
}

void sub_1000AB130(id *a1)
{
  id location[2] = a1;
  location[1] = a1;
  location[0] = [a1[4] identifier];
  if (([location[0] isEqualToString:*((void *)a1[5] + 7)] & 1) == 0)
  {
    id v1 = [location[0] copy];
    double v2 = a1[5];
    unsigned int v3 = (void *)v2[7];
    v2[7] = v1;

    memset(__b, 0, sizeof(__b));
    id obj = [a1[5] _observersCopyForSelector:"waveformControllerTrackDidChange:"];
    id v10 = [obj countByEnumeratingWithState:__b objects:v15 count:16];
    if (v10)
    {
      uint64_t v6 = *(void *)__b[2];
      uint64_t v7 = 0LL;
      id v8 = v10;
      while (1)
      {
        uint64_t v5 = v7;
        if (*(void *)__b[2] != v6) {
          objc_enumerationMutation(obj);
        }
        id v13 = *(id *)(__b[1] + 8 * v7);
        objc_msgSend(v13, "waveformControllerTrackDidChange:", a1[5], v8);
        ++v7;
        id v8 = (id)v4;
        if (v5 + 1 >= v4)
        {
          uint64_t v7 = 0LL;
          id v8 = [obj countByEnumeratingWithState:__b objects:v15 count:16];
          if (!v8) {
            break;
          }
        }
      }
    }
  }

  objc_storeStrong(location, 0LL);
}

id sub_1000AB404(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setPlaying:", *(void *)(a1 + 40) == 2, a1, a1);
}

void sub_1000AB758(id a1)
{
  os_log_t v1 = os_log_create("com.apple.TVSystemUIService.waveformController", "");
  double v2 = (void *)qword_100221D18;
  qword_100221D18 = (uint64_t)v1;
}

void sub_1000AC054(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _fetchCurrentUserAndUpdateWithReason:@"Handling PBSUserProfileManager Update"];
}

uint64_t sub_1000AC5E0(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  *(_BYTE *)uint64_t result = 2;
  *(_BYTE *)(result + 1) = 4;
  *(_BYTE *)(result + 2) = 32;
  *(_BYTE *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 66;
  *(_BYTE *)(result + 13) = 8;
  *(void *)(result + 14) = a3;
  *(_BYTE *)(result + 22) = 64;
  *(_BYTE *)(result + 23) = 8;
  *(void *)(result + 24) = a4;
  *(_BYTE *)(result + 32) = 64;
  *(_BYTE *)(result + 33) = 8;
  *(void *)(result + 34) = a5;
  return result;
}

void sub_1000AC664(void *a1, void *a2, void *a3, void *a4, void *a5)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  id v13 = 0LL;
  objc_storeStrong(&v13, a3);
  id v12 = 0LL;
  objc_storeStrong(&v12, a4);
  id v11[2] = a5;
  v11[1] = a1;
  id v10 = v12;
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___TVSSCurrentUserControllerObserverUserInfo);
  v11[0] = sub_1000AC760(v10, v5);
  objc_storeStrong(v11, 0LL);
  objc_storeStrong(&v12, 0LL);
  objc_storeStrong(&v13, 0LL);
  objc_storeStrong(location, 0LL);
}

id sub_1000AC760(void *a1, uint64_t a2)
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

uint64_t sub_1000AC83C(uint64_t a1)
{
  if (a1) {
    return *(void *)(a1 + 40);
  }
  else {
    return 0LL;
  }
}

void sub_1000AD474(id *a1, void *a2)
{
  id v13 = a1;
  id v12 = a2;
  id v11[2] = a1;
  queue = &_dispatch_main_q;
  id v4 = _NSConcreteStackBlock;
  int v5 = -1073741824;
  int v6 = 0;
  uint64_t v7 = sub_1000AD584;
  id v8 = &unk_1001B9B58;
  v11[1] = v12;
  objc_copyWeak(v11, a1 + 6);
  id v9 = a1[4];
  id v10 = a1[5];
  dispatch_async(queue, &v4);

  objc_storeStrong(&v10, 0LL);
  objc_storeStrong(&v9, 0LL);
  objc_destroyWeak(v11);
}

id sub_1000AD584(uint64_t a1)
{
  if (!*(void *)(a1 + 56))
  {
    id v4 = +[TVCSRestrictionsDataProvider sharedInstance](&OBJC_CLASS___TVCSRestrictionsDataProvider, "sharedInstance");
    unsigned __int8 v5 = -[TVCSRestrictionsDataProvider isLoadingContentRestrictions]( v4,  "isLoadingContentRestrictions");

    if ((v5 & 1) != 0)
    {
      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
      [WeakRetained _launchSettingsWithURLPath:@"prefs:root=Restrictions"];

      [*(id *)(a1 + 32) dismissSystemMenuWithSourceIdentifier:*(void *)(a1 + 40)];
    }

    else
    {
      id v2 =  +[TVCSRestrictionsDataProvider sharedInstance]( &OBJC_CLASS___TVCSRestrictionsDataProvider,  "sharedInstance");
      -[TVCSRestrictionsDataProvider disableRestrictions](v2, "disableRestrictions");
    }
  }

  return [*(id *)(a1 + 32) dismissSystemMenuWithSourceIdentifier:*(void *)(a1 + 40)];
}

void sub_1000AD798(uint64_t a1)
{
  id v2 = +[LSApplicationWorkspace defaultWorkspace](&OBJC_CLASS___LSApplicationWorkspace, "defaultWorkspace");
  objc_msgSend(v2, "openSensitiveURL:withOptions:error:", *(void *)(a1 + 32), 0);
}

void sub_1000AFA28(unint64_t a1, int a2)
{
  unsigned int v3 = (id *)STACK[0x548];
  STACK[0x700] = a1;
  LODWORD(STACK[0x6FC]) = a2;
  objc_destroyWeak(v3);
  objc_destroyWeak((id *)&STACK[0x738]);
  _Unwind_Resume((_Unwind_Exception *)STACK[0x700]);
}

  ;
}

NSDictionary *__cdecl sub_1000AFC20(id a1, NSDictionary *a2)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  v6[1] = a1;
  v6[0] = [location[0] mutableCopy];
  id v4 =  +[UIFont monospacedSystemFontOfSize:weight:]( &OBJC_CLASS___UIFont,  "monospacedSystemFontOfSize:weight:",  15.0,  UIFontWeightRegular);
  objc_msgSend(v6[0], "setObject:forKeyedSubscript:");

  id v5 = [v6[0] copy];
  objc_storeStrong(v6, 0LL);
  objc_storeStrong(location, 0LL);
  return (NSDictionary *)v5;
}

void sub_1000AFCF8(id *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  id WeakRetained = objc_loadWeakRetained(a1 + 4);
  [WeakRetained _handleToggleAxis];

  objc_storeStrong(location, 0LL);
}

void sub_1000AFD60(id *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  id WeakRetained = objc_loadWeakRetained(a1 + 4);
  [WeakRetained _handleToggleRecordingIndicator];

  objc_storeStrong(location, 0LL);
}

void sub_1000AFDC8(id *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  id WeakRetained = objc_loadWeakRetained(a1 + 4);
  [WeakRetained _handleToggleLocationIndicator];

  objc_storeStrong(location, 0LL);
}

void sub_1000AFE30(id *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  id WeakRetained = objc_loadWeakRetained(a1 + 4);
  [WeakRetained _toggleRecordingShape];

  objc_storeStrong(location, 0LL);
}

void sub_1000AFE98(id *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  id WeakRetained = objc_loadWeakRetained(a1 + 4);
  [WeakRetained _toggleRecordingColor];

  objc_storeStrong(location, 0LL);
}

void sub_1000AFF00(id *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  id WeakRetained = objc_loadWeakRetained(a1 + 4);
  [WeakRetained _toggleBorder];

  objc_storeStrong(location, 0LL);
}

uint64_t sub_1000B19B4(void *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  unsigned __int8 v4 = [location[0] attributionMatchesGroup:a1[4]];
  objc_storeStrong(location, 0LL);
  return v4 & 1;
}

uint64_t sub_1000B3070(uint64_t result, uint64_t a2, uint64_t a3, int a4, int a5, uint64_t a6)
{
  *(_BYTE *)uint64_t result = 2;
  *(_BYTE *)(result + 1) = 5;
  *(_BYTE *)(result + 2) = 66;
  *(_BYTE *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 66;
  *(_BYTE *)(result + 13) = 8;
  *(void *)(result + 14) = a3;
  *(_BYTE *)(result + 22) = 0;
  *(_BYTE *)(result + 23) = 4;
  *(_DWORD *)(result + 24) = a4;
  *(_BYTE *)(result + 2_Block_object_dispose((const void *)(v18 - 72), 8) = 0;
  *(_BYTE *)(result + 29) = 4;
  *(_DWORD *)(result + 30) = a5;
  *(_BYTE *)(result + 34) = 66;
  *(_BYTE *)(result + 35) = 8;
  *(void *)(result + 36) = a6;
  return result;
}

id sub_1000B3F84(void *a1, uint64_t a2)
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

void sub_1000B45D4(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) waveformView];
  [v1 setAlpha:1.0];

  id v3 = [*(id *)(a1 + 32) imageView];
  [v3 setAlpha:0.0];
}

void sub_1000B4658(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) waveformView];
  [v1 setAlpha:0.0];

  id v3 = [*(id *)(a1 + 32) imageView];
  [v3 setAlpha:1.0];
}

void sub_1000B46DC(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) waveformView];
  [v2 setWaveformData:*(void *)(a1 + 40)];
}

void sub_1000B8B08(id *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  id v5 = [location[0] contentText1];
  BOOL v6 = [v5 length] != 0;

  [a1[4] setActive:v6];
  id v7 = [location[0] contentText2];
  BOOL v8 = [v7 length] != 0;

  [a1[5] setActive:v8];
  id v9 = [location[0] contentText3];
  BOOL v10 = [v9 length] != 0;

  [a1[6] setActive:v10];
  BOOL v12 = 0;
  if (!v6)
  {
    BOOL v12 = 0;
    if (!v8) {
      BOOL v12 = !v10;
    }
  }

  [a1[7] setActive:v12];
  id v2 = [location[0] contentImage2];
  BOOL v3 = v2 != 0LL;

  BOOL v4 = 0;
  if (v6) {
    BOOL v4 = !v3;
  }
  [a1[8] setActive:v4];
  objc_storeStrong(location, 0LL);
}

id sub_1000B9978(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_activityAttribution", a1, a1);
}

uint64_t sub_1000BA704(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  *(_BYTE *)uint64_t result = 2;
  *(_BYTE *)(result + 1) = 4;
  *(_BYTE *)(result + 2) = 32;
  *(_BYTE *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 64;
  *(_BYTE *)(result + 13) = 8;
  *(void *)(result + 14) = a3;
  *(_BYTE *)(result + 22) = 66;
  *(_BYTE *)(result + 23) = 8;
  *(void *)(result + 24) = a4;
  *(_BYTE *)(result + 32) = 64;
  *(_BYTE *)(result + 33) = 8;
  *(void *)(result + 34) = a5;
  return result;
}

uint64_t sub_1000BA788(uint64_t result, uint64_t a2, uint64_t a3, int a4, uint64_t a5)
{
  *(_BYTE *)uint64_t result = 2;
  *(_BYTE *)(result + 1) = 4;
  *(_BYTE *)(result + 2) = 32;
  *(_BYTE *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 66;
  *(_BYTE *)(result + 13) = 8;
  *(void *)(result + 14) = a3;
  *(_BYTE *)(result + 22) = 0;
  *(_BYTE *)(result + 23) = 4;
  *(_DWORD *)(result + 24) = a4;
  *(_BYTE *)(result + 2_Block_object_dispose((const void *)(v18 - 72), 8) = 64;
  *(_BYTE *)(result + 29) = 8;
  *(void *)(result + 30) = a5;
  return result;
}

void sub_1000BADA0(id a1)
{
  os_log_t v1 = os_log_create("com.apple.TVSystemUIService.menuItemProvider", "SimpleMenuItemProvider");
  id v2 = (void *)qword_100221D28;
  qword_100221D28 = (uint64_t)v1;
}

id sub_1000BB330(void *a1, uint64_t a2)
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

void sub_1000BB604(uint64_t a1)
{
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  id v2 = (void *)qword_100221D38;
  qword_100221D38 = (uint64_t)v1;
}

uint64_t sub_1000BC934(uint64_t a1, uint64_t a2)
{
  return a1 | a2;
}

void sub_1000BC954(void *a1, void *a2, void *a3, void *a4)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  id v8 = 0LL;
  objc_storeStrong(&v8, a3);
  id v7 = 0LL;
  objc_storeStrong(&v7, a4);
  [location[0] bluetoothRemoteController:a1[4] didUpdateCurrentRemote:a1[5]];
  objc_storeStrong(&v7, 0LL);
  objc_storeStrong(&v8, 0LL);
  objc_storeStrong(location, 0LL);
}

void sub_1000BCC8C(id *a1, void *a2, void *a3, void *a4)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  id v9 = 0LL;
  objc_storeStrong(&v9, a3);
  id v8 = 0LL;
  objc_storeStrong(&v8, a4);
  id WeakRetained = objc_loadWeakRetained(a1 + 4);
  objc_msgSend(WeakRetained, "_queue_determineFocusedAppFromLayout:", v9);

  objc_storeStrong(&v8, 0LL);
  objc_storeStrong(&v9, 0LL);
  objc_storeStrong(location, 0LL);
}

id sub_1000BD45C(uint64_t a1)
{
  return [*(id *)(a1 + 32) setPipActive:*(_BYTE *)(a1 + 56) & 1];
}

id sub_1000BE5A4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateContentViewAppearance", a1, a1);
}

id sub_1000BE5D4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateContentViewAppearance", a1, a1);
}

BOOL sub_1000BF320(id a1, UIPress *a2)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  BOOL v3 = [location[0] type] == (id)4;
  objc_storeStrong(location, 0LL);
  return v3;
}

id sub_1000BF998()
{
  if (+[TVSSConstants isScaledUI](&OBJC_CLASS___TVSSConstants, "isScaledUI")) {
    v0 = UIFontTextStyleBody;
  }
  else {
    v0 = UIFontTextStyleCaption1;
  }
  BOOL v3 = v0;
  id v2 =  +[UIFont _preferredFontForTextStyle:weight:]( &OBJC_CLASS___UIFont,  "_preferredFontForTextStyle:weight:",  v0,  UIFontWeightSemibold);
  objc_storeStrong((id *)&v3, 0LL);
  return v2;
}

uint64_t sub_1000C16B8()
{
  return 0LL;
}

void sub_1000C1B60( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, int a28, int a29, _Unwind_Exception *exception_object, char a31, uint64_t a32, uint64_t a33, uint64_t a34, id a35)
{
}

  ;
}

void sub_1000C1BD8(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) dictationPlatterView];
  objc_msgSend(v1, "setAlpha:");

  id v3 = [*(id *)(a1 + 32) dimmingView];
  [v3 setAlpha:1.0];
}

void sub_1000C1C60(id *a1, void *a2)
{
  id location[3] = a1;
  id location[2] = a2;
  location[1] = a1;
  location[0] = objc_loadWeakRetained(a1 + 4);
  if (location[0]) {
    [location[0] endAppearanceTransition];
  }
  objc_storeStrong(location, 0LL);
}

void sub_1000C1E8C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, int a19, int a20, _Unwind_Exception *exception_object, char a22, uint64_t a23, uint64_t a24, uint64_t a25, id a26)
{
}

void sub_1000C1ED8(uint64_t a1)
{
  uint64_t v7 = a1;
  uint64_t v6 = a1;
  id v1 = [*(id *)(a1 + 32) dictationPlatterView];
  CGAffineTransformMakeScale(&v5, 0.9, 0.9);
  [v1 setTransform:&v5];

  id v2 = [*(id *)(a1 + 32) dictationPlatterView];
  objc_msgSend(v2, "setAlpha:");

  id v4 = [*(id *)(a1 + 32) dimmingView];
  [v4 setAlpha:0.0];
}

void sub_1000C1FAC(id *a1, void *a2)
{
  id location[3] = a1;
  id location[2] = a2;
  location[1] = a1;
  location[0] = objc_loadWeakRetained(a1 + 4);
  if (location[0]) {
    [location[0] endAppearanceTransition];
  }
  objc_storeStrong(location, 0LL);
}

void sub_1000C24A8(uint64_t *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  oslog[1] = (os_log_t)a1;
  if (location[0])
  {
    oslog[0] = (os_log_t)DictationControllerLog();
    os_log_type_t type = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_ERROR))
    {
      uint64_t v2 = a1[4];
      uint64_t v3 = a1[5];
      id v4 = [location[0] localizedDescription];
      sub_100061C1C((uint64_t)v11, v2, v3, (uint64_t)v4);
      _os_log_error_impl( (void *)&_mh_execute_header,  oslog[0],  type,  "[TVSSPlayVideoIntentPrototype performWithBundleIdentifier:] returned an error. Bundle ID: %{public}@; Search ter"
        "m: %@; Error:%{public}@",
        v11,
        0x20u);
    }

    objc_storeStrong((id *)oslog, 0LL);
  }

  else
  {
    os_log_t v6 = (os_log_t)DictationControllerLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      sub_100061BC8((uint64_t)v10, a1[4], a1[5]);
      _os_log_debug_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEBUG,  "[TVSSPlayVideoIntentPrototype performWithBundleIdentifier:] ran successfully. Bundle ID: %{public}@; Term: %@",
        v10,
        0x16u);
    }

    objc_storeStrong((id *)&v6, 0LL);
  }

  objc_storeStrong(location, 0LL);
}

uint64_t sub_1000C2D74(id obj)
{
  id location = 0LL;
  objc_storeStrong(&location, obj);
  unsigned __int8 v2 = objc_msgSend(location, "bs_containsObjectPassingTest:", &stru_1001B9FA0);
  objc_storeStrong(&location, 0LL);
  return v2 & 1;
}

BOOL sub_1000C3738(id a1, UIPress *a2)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  BOOL v3 = [location[0] type] == (id)18;
  objc_storeStrong(location, 0LL);
  return v3;
}

id sub_1000C394C()
{
  qword_100221D48 = (uint64_t)objc_getClass("RadarDraft");
  off_100220240 = (uint64_t (*)())sub_1000C3A00;
  return (id)qword_100221D48;
}

uint64_t sub_1000C3988()
{
  predicate = (dispatch_once_t *)&unk_100221D50;
  dispatch_block_t block = 0LL;
  objc_storeStrong(&block, &stru_1001B9FD0);
  if (*predicate != -1) {
    dispatch_once(predicate, block);
  }
  objc_storeStrong(&block, 0LL);
  return qword_100221D58;
}

id sub_1000C3A00()
{
  return (id)qword_100221D48;
}

void sub_1000C3A0C(id a1)
{
  qword_100221D58 = (uint64_t)dlopen("/AppleInternal/Library/Frameworks/TapToRadarKit.framework/TapToRadarKit", 2);
}

id sub_1000C3A48()
{
  qword_100221D60 = (uint64_t)objc_getClass("TapToRadarService");
  off_100220248 = (uint64_t (*)())sub_1000C3A84;
  return (id)qword_100221D60;
}

id sub_1000C3A84()
{
  return (id)qword_100221D60;
}

void sub_1000C4350( uint64_t a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id *location)
{
  *(void *)(v9 - 4_Block_object_dispose((const void *)(v18 - 72), 8) = a1;
  *(_DWORD *)(v9 - 52) = a2;
  objc_destroyWeak((id *)(v9 - 40));
  _Unwind_Resume(*(_Unwind_Exception **)(v9 - 48));
}

void sub_1000C4390(id *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  v8[1] = a1;
  v8[0] = objc_loadWeakRetained(a1 + 4);
  if (v8[0])
  {
    +[CMCaptureFrameReceiver removeObserver:forKeyPath:]( &OBJC_CLASS___CMCaptureFrameReceiver,  "removeObserver:forKeyPath:",  v8[0],  @"availableFrameSenderEndpointsByPID");
    objc_storeStrong((id *)v8[0] + 12, 0LL);
    id v7 = VideoMicEffectsCoordinatorLog();
    os_log_type_t v6 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_DEFAULT))
    {
      log = (os_log_s *)v7;
      os_log_type_t type = v6;
      sub_100010524(v5);
      _os_log_impl((void *)&_mh_execute_header, log, type, "Stopped listening for received frames", v5, 2u);
    }

    objc_storeStrong(&v7, 0LL);
  }

  objc_storeStrong(v8, 0LL);
  objc_storeStrong(location, 0LL);
}

void sub_1000C4B70()
{
}

void sub_1000C4B80(id *a1, uint64_t a2, char a3)
{
  uint64_t v9 = a1;
  uint64_t v8 = a2;
  char v7 = a3 & 1;
  location[1] = a1;
  location[0] = objc_loadWeakRetained(a1 + 4);
  id v3 = [location[0] onSampleBufferChange];
  BOOL v5 = v3 == 0LL;

  if (!v5)
  {
    id v4 = (void (**)(id, uint64_t, void))[location[0] onSampleBufferChange];
    v4[2](v4, v8, v7 & 1);
  }

  objc_storeStrong(location, 0LL);
}

id sub_1000C7360(void *a1, uint64_t a2)
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

void sub_1000C7F48()
{
}

void sub_1000C7F58(id *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  v4[1] = a1;
  v4[0] = AttentionMonitorLog();
  if (os_log_type_enabled((os_log_t)v4[0], OS_LOG_TYPE_INFO))
  {
    sub_10000D28C((uint64_t)v6, (uint64_t)location[0]);
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v4[0],  OS_LOG_TYPE_INFO,  "Handling attentionAwareness event: %@",  v6,  0xCu);
  }

  objc_storeStrong(v4, 0LL);
  id WeakRetained = objc_loadWeakRetained(a1 + 4);
  [WeakRetained _handleAttentionEvent:location[0]];

  objc_storeStrong(location, 0LL);
}

id sub_1000C83BC(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateAttentionMonitoringState];
}

void sub_1000C9288(uint64_t a1, void *a2)
{
  location[1] = (id)a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  [*(id *)(a1 + 32) _deregisterAssertionWithToken:*(void *)(a1 + 40)];
  objc_storeStrong(location, 0LL);
}

void sub_1000C98C0(id *a1)
{
  id location[2] = a1;
  location[1] = a1;
  location[0] = objc_loadWeakRetained(a1 + 4);
  if (location[0])
  {
    id v1 = -[TVSSPrivacyViewPixelShifter initWithIdentifier:]( objc_alloc(&OBJC_CLASS___TVSSPrivacyViewPixelShifter),  "initWithIdentifier:",  @"Microphone");
    objc_msgSend(location[0], "setMicrophoneIndicatorPixelShifter:");

    id v2 = [location[0] microphoneIndicatorPixelShifter];
    [v2 addObserver:location[0]];

    id v3 = -[TVSSPrivacyViewPixelShifter initWithIdentifier:]( objc_alloc(&OBJC_CLASS___TVSSPrivacyViewPixelShifter),  "initWithIdentifier:",  @"Camera");
    objc_msgSend(location[0], "setCameraIndicatorPixelShifter:");

    id v4 = [location[0] cameraIndicatorPixelShifter];
    [v4 addObserver:location[0]];
  }

  objc_storeStrong(location, 0LL);
}

void sub_1000C99DC(id *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  v3[1] = a1;
  v3[0] = objc_loadWeakRetained(a1 + 4);
  [v3[0] _updateBarYOffset];
  [v3[0] _updatePrivacyStateAdapterView];
  objc_storeStrong(v3, 0LL);
  objc_storeStrong(location, 0LL);
}

id sub_1000CB4FC(void *a1, uint64_t a2)
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

BOOL sub_1000CB5BC(double a1, double a2, double a3, double a4)
{
  BOOL v5 = 0;
  if (a1 == a3) {
    return a2 == a4;
  }
  return v5;
}

uint64_t sub_1000CB91C(void *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  id v4 = [location[0] identifier];
  unsigned __int8 v5 = [v4 isEqual:a1[4]];

  objc_storeStrong(location, 0LL);
  return v5 & 1;
}

BOOL sub_1000CB9A8(id a1, TVSSMenuItem *a2)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  id v3 = [location[0] identifier];
  unsigned __int8 v4 = [v3 isEqual:@"com.apple.status.controlCenterItem"];

  objc_storeStrong(location, 0LL);
  return v4 & 1;
}

void sub_1000CC110(uint64_t a1, void *a2)
{
  location[1] = (id)a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  v3[1] = (id)a1;
  v3[0] = objc_loadWeakRetained((id *)(a1 + 40));
  [v3[0] actuallySetActiveMenuItem:*(void *)(a1 + 32) presentationReason:*(void *)(a1 + 48) focusHeading:*(void *)(a1 + 56) orthogonalNavigation:*(_BYTE *)(a1 + 64) & 1];
  [v3[0] setFocusActivationTimer:0];
  objc_storeStrong(v3, 0LL);
  objc_storeStrong(location, 0LL);
}

id sub_1000CC358(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateOrthogonalDelegateOfActiveMenuItem:*(void *)(a1 + 40)];
}

void sub_1000CC600(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) panelHostingViewController];
  [v2 setOrthogonalNavigationDelegate:*(void *)(a1 + 32) availableEdges:*(void *)(a1 + 40)];
}

void sub_1000CD3E4( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, _Unwind_Exception *exception_object, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, id *location, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, uint64_t a48, uint64_t a49, uint64_t a50,uint64_t a51,int a52,int a53,uint64_t a54)
{
}

void sub_1000CD450(uint64_t a1, void *a2)
{
  location[1] = (id)a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  uint64_t v29 = a1;
  id v5 = location[0];
  double v21 = _NSConcreteStackBlock;
  int v22 = -1073741824;
  int v23 = 0;
  double v24 = sub_1000CD710;
  double v25 = &unk_1001BA180;
  objc_copyWeak(v27, (id *)(a1 + 56));
  char v28 = *(_BYTE *)(a1 + 72) & 1;
  id v26 = *(id *)(a1 + 32);
  v27[1] = *(id *)(a1 + 64);
  [v5 addTransactionWillBeginBlock:&v21];
  id v3 = location[0];
  id v13 = _NSConcreteStackBlock;
  int v14 = -1073741824;
  int v15 = 0;
  id v16 = sub_1000CD7A8;
  id v17 = &unk_1001BA1A8;
  objc_copyWeak(&v19, (id *)(a1 + 56));
  char v20 = *(_BYTE *)(a1 + 72) & 1;
  id v18 = *(id *)(a1 + 40);
  [v3 addTransactionDidFinishWorkBlock:&v13];
  id v2 = location[0];
  id v6 = _NSConcreteStackBlock;
  int v7 = -1073741824;
  int v8 = 0;
  uint64_t v9 = sub_1000CD8CC;
  BOOL v10 = &unk_1001BA1D0;
  objc_copyWeak(&v12, (id *)(a1 + 56));
  id v11 = *(id *)(a1 + 48);
  [v2 addTransactionDidCompleteBlock:&v6];
  objc_storeStrong(&v11, 0LL);
  objc_destroyWeak(&v12);
  objc_storeStrong(&v18, 0LL);
  objc_destroyWeak(&v19);
  objc_storeStrong(&v26, 0LL);
  objc_destroyWeak(v27);
  objc_storeStrong(location, 0LL);
}

void sub_1000CD69C( uint64_t a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id *a12, uint64_t a13, uint64_t a14, uint64_t a15, id *location)
{
  *(void *)(v16 - 112) = a1;
  *(_DWORD *)(v16 - 116) = a2;
  objc_destroyWeak((id *)(v16 - 64));
  _Unwind_Resume(*(_Unwind_Exception **)(v16 - 112));
}

void sub_1000CD710(uint64_t a1, void *a2)
{
  location[1] = (id)a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  v3[1] = (id)a1;
  v3[0] = objc_loadWeakRetained((id *)(a1 + 40));
  if ((*(_BYTE *)(a1 + 56) & 1) == 0) {
    [v3[0] setActiveMenuItem:*(void *)(a1 + 32) presentationReason:*(void *)(a1 + 48)];
  }
  objc_storeStrong(v3, 0LL);
  objc_storeStrong(location, 0LL);
}

void sub_1000CD7A8(uint64_t a1, void *a2)
{
  location[1] = (id)a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  v4[1] = (id)a1;
  v4[0] = objc_loadWeakRetained((id *)(a1 + 40));
  if (v4[0])
  {
    if ((*(_BYTE *)(a1 + 48) & 1) != 0)
    {
      [v4[0] setActiveMenuItem:0];
    }

    else if ((*((_BYTE *)v4[0] + 8) & 1) != 0)
    {
      id v3 = [v4[0] activeMenuItem];
      *((_BYTE *)v4[0] + _Block_object_dispose((const void *)(v18 - 72), 8) = 0;
      objc_storeStrong(&v3, 0LL);
    }
  }

  objc_storeStrong(v4, 0LL);
  objc_storeStrong(location, 0LL);
}

void sub_1000CD8CC(id *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  v6[1] = a1;
  v6[0] = objc_loadWeakRetained(a1 + 5);
  char v4 = 0;
  BOOL v3 = 0;
  if (v6[0])
  {
    id v5 = [v6[0] currentRunningAnimationContext];
    char v4 = 1;
    BOOL v3 = v5 == a1[4];
  }

  if ((v4 & 1) != 0) {

  }
  if (v3) {
    [v6[0] setCurrentRunningAnimationContext:0];
  }
  objc_storeStrong(v6, 0LL);
  objc_storeStrong(location, 0LL);
}

uint64_t sub_1000CDD70(void *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  id v4 = [location[0] identifier];
  unsigned __int8 v5 = [v4 isEqual:a1[4]];

  objc_storeStrong(location, 0LL);
  return v5 & 1;
}

void sub_1000CF884(id *a1)
{
  id v2[2] = a1;
  v2[1] = a1;
  v2[0] = objc_loadWeakRetained(a1 + 4);
  id v1 = [v2[0] avSession];
  [v1 startRunning];

  objc_storeStrong(v2, 0LL);
}

void sub_1000CFA48(id *a1)
{
  id v2[2] = a1;
  v2[1] = a1;
  v2[0] = objc_loadWeakRetained(a1 + 4);
  id v1 = [v2[0] avSession];
  [v1 stopRunning];

  objc_storeStrong(v2, 0LL);
}

id sub_1000D03FC(uint64_t a1)
{
  return objc_msgSend( *(id *)(a1 + 32),  "_updateOutputDevicesWithReason:",  @"Handling route did change notification",  a1,  a1);
}

void sub_1000D061C(uint64_t a1)
{
  id v1 = *(void **)(a1 + 32);
  id v2 = objc_msgSend(*(id *)(*(void *)(a1 + 40) + 32), "tvss_succinctDescription");
  objc_msgSend(v1, "appendString:withName:");

  BOOL v3 = *(void **)(a1 + 32);
  id v4 = objc_msgSend(*(id *)(*(void *)(a1 + 40) + 40), "tvss_succinctDescription");
  objc_msgSend(v3, "appendString:withName:");

  id v6 = *(void **)(a1 + 32);
  id v7 = objc_msgSend(*(id *)(*(void *)(a1 + 40) + 48), "tvss_succinctDescription");
  objc_msgSend(v6, "appendString:withName:");
}

void sub_1000D08F8(uint64_t a1)
{
  id v1 =  [*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 32) withName:@"systemOutputDeviceRoute"];
  id v7 = *(void **)(a1 + 32);
  id v8 = [*(id *)(*(void *)(a1 + 40) + 32) outputDevices];
  id v2 = objc_msgSend(v7, "appendObject:withName:");

  id v3 =  [*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 40) withName:@"primaryOutputDeviceRoute"];
  uint64_t v9 = *(void **)(a1 + 32);
  id v10 = [*(id *)(*(void *)(a1 + 40) + 40) outputDevices];
  id v4 = objc_msgSend(v9, "appendObject:withName:");

  id v5 =  [*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 48) withName:@"secondaryOutputDeviceRoute"];
  id v12 = *(void **)(a1 + 32);
  id v13 = [*(id *)(*(void *)(a1 + 40) + 48) outputDevices];
  id v6 = objc_msgSend(v12, "appendObject:withName:");
}

void sub_1000D1BEC()
{
}

void sub_1000D1BFC(void *a1, void *a2, uint64_t a3, _BYTE *a4)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  if (([location[0] isLocalDevice] & 1) == 0)
  {
    *(_BYTE *)(*(void *)(a1[4] + 8LL) + 24LL) = 1;
    *a4 = 1;
  }

  objc_storeStrong(location, 0LL);
}

uint64_t sub_1000D1C88(uint64_t result, uint64_t a2, int a3, int a4)
{
  *(_BYTE *)uint64_t result = 2;
  *(_BYTE *)(result + 1) = 3;
  *(_BYTE *)(result + 2) = 32;
  *(_BYTE *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 0;
  *(_BYTE *)(result + 13) = 4;
  *(_DWORD *)(result + 14) = a3;
  *(_BYTE *)(result + 1_Block_object_dispose((const void *)(v18 - 72), 8) = 0;
  *(_BYTE *)(result + 19) = 4;
  *(_DWORD *)(result + 20) = a4;
  return result;
}

void sub_1000D1CF4(void *a1, void *a2, void *a3, void *a4, void *a5)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  id v13 = 0LL;
  objc_storeStrong(&v13, a3);
  id v12 = 0LL;
  objc_storeStrong(&v12, a4);
  id v11[2] = a5;
  v11[1] = a1;
  id v10 = v12;
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___TVSSSystemOutputDeviceRouteControllerObserverUserInfo);
  v11[0] = sub_1000D1DF0(v10, v5);
  objc_storeStrong(v11, 0LL);
  objc_storeStrong(&v12, 0LL);
  objc_storeStrong(&v13, 0LL);
  objc_storeStrong(location, 0LL);
}

id sub_1000D1DF0(void *a1, uint64_t a2)
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

void sub_1000D1EB0(void *a1, void *a2, void *a3, void *a4, void *a5)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  id v13 = 0LL;
  objc_storeStrong(&v13, a3);
  id v12 = 0LL;
  objc_storeStrong(&v12, a4);
  id v11[2] = a5;
  v11[1] = a1;
  id v10 = v12;
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___TVSSSystemOutputDeviceRouteControllerObserverUserInfo);
  v11[0] = sub_1000D1DF0(v10, v5);
  objc_storeStrong(v11, 0LL);
  objc_storeStrong(&v12, 0LL);
  objc_storeStrong(&v13, 0LL);
  objc_storeStrong(location, 0LL);
}

uint64_t sub_1000D2098(uint64_t a1)
{
  if (a1) {
    return *(void *)(a1 + 64);
  }
  else {
    return 0LL;
  }
}

void sub_1000D3220(id *a1, void *a2, void *a3, void *a4)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  id v9 = 0LL;
  objc_storeStrong(&v9, a3);
  id v8 = 0LL;
  objc_storeStrong(&v8, a4);
  [a1[4] setPlatterArtworkImage:v9];
  id WeakRetained = objc_loadWeakRetained(a1 + 5);
  [WeakRetained reloadContent];

  objc_storeStrong(&v8, 0LL);
  objc_storeStrong(&v9, 0LL);
  objc_storeStrong(location, 0LL);
}

void sub_1000D3E20( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, int a40, int a41, _Unwind_Exception *exception_object, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, char a48, uint64_t a49, uint64_t a50,uint64_t a51,id a52)
{
}

  ;
}

id sub_1000D3E78(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0, a1, a1);
}

id sub_1000D3EAC(uint64_t a1)
{
  uint64_t v5 = a1;
  uint64_t v4 = a1;
  id v2 = *(void **)(a1 + 32);
  CGAffineTransformMakeScale(&v3, 0.8, 0.8);
  return [v2 setTransform:&v3];
}

void sub_1000D3F04(id *a1, uint64_t a2, id obj)
{
  uint64_t v7 = a1;
  uint64_t v6 = a2;
  id location = 0LL;
  objc_storeStrong(&location, obj);
  v4[1] = a1;
  v4[0] = objc_loadWeakRetained(a1 + 4);
  if (v4[0] && !v6) {
    [v4[0] satisfyMilestone:location];
  }
  objc_storeStrong(v4, 0LL);
  objc_storeStrong(&location, 0LL);
}

uint64_t sub_1000D3FA8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

uint64_t sub_1000D3FEC(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_1000D4CD0()
{
}

BOOL sub_1000D4CE0(id a1, TVCSAudioRoute *a2)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  char v4 = 0;
  BOOL v3 = 0;
  if ([location[0] selectionState] == (id)1)
  {
    id v5 = [location[0] headphoneConfiguration];
    char v4 = 1;
    BOOL v3 = v5 != 0LL;
  }

  BOOL v7 = v3;
  if ((v4 & 1) != 0) {

  }
  objc_storeStrong(location, 0LL);
  return v7;
}

TVSSHeadphonesTitleRenderer *sub_1000D4DC0(uint64_t a1, void *a2)
{
  location[1] = (id)a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  v81[1] = (id)a1;
  v81[0] = objc_loadWeakRetained((id *)(a1 + 40));
  id v80 = [v81[0] primaryRoute];
  id v79 = [v81[0] secondaryRoute];
  id v58 = location[0];
  id v59 = [v80 routeUID];
  unsigned __int8 v60 = objc_msgSend(v58, "isEqualToString:");

  if ((v60 & 1) != 0)
  {
    id v55 = [v81[0] headphonesController];
    id v54 = [v80 routeUID];
    id v78 = objc_msgSend(v55, "imageForRouteUID:");

    id v56 = [v80 title];
    char v75 = 0;
    char v73 = 0;
    if (v78)
    {
      id v2 = +[TVSPContent contentWithTitle:image:](&OBJC_CLASS___TVSPContent, "contentWithTitle:image:", v56, v78);
    }

    else
    {
      id v76 = [v80 deviceSymbolName];
      char v75 = 1;
      id v74 = +[UIImage _systemImageNamed:](&OBJC_CLASS___UIImage, "_systemImageNamed:");
      char v73 = 1;
      id v2 = +[TVSPContent contentWithTitle:image:](&OBJC_CLASS___TVSPContent, "contentWithTitle:image:", v56, v74);
    }

    id v77 = v2;
    if ((v73 & 1) != 0) {

    }
    if ((v75 & 1) != 0) {
    id v46 = v81[0];
    }
    id v45 = v77;
    id v47 = [v80 batteryLevel];
    objc_msgSend(v46, "_updateContent:withBatteryLevel:", v45);

    id v48 = location[0];
    os_log_type_t v49 = v77;
    id v53 = [v81[0] headphonesController];
    id v52 = [v81[0] headphonesController];
    id v51 = [v80 routeUID];
    id v50 = objc_msgSend(v52, "mediaPlayerViewForRouteUID:");
    os_log_type_t v83 =  +[TVSSHeadphonesTitleRenderer rendererWithIdentifier:format:content:headphonesController:mediaPlayerView:]( &OBJC_CLASS___TVSSHeadphonesTitleRenderer,  "rendererWithIdentifier:format:content:headphonesController:mediaPlayerView:",  v48,  16LL,  v49,  v53);

    int v72 = 1;
    objc_storeStrong((id *)&v77, 0LL);
    objc_storeStrong(&v78, 0LL);
  }

  else
  {
    id v42 = location[0];
    id v43 = [v79 routeUID];
    unsigned __int8 v44 = objc_msgSend(v42, "isEqualToString:");

    if ((v44 & 1) != 0)
    {
      id v40 = [v81[0] headphonesController];
      id v39 = [v79 routeUID];
      id v71 = objc_msgSend(v40, "imageForRouteUID:");

      id v41 = [v79 title];
      char v68 = 0;
      char v66 = 0;
      if (v71)
      {
        BOOL v3 = +[TVSPContent contentWithTitle:image:](&OBJC_CLASS___TVSPContent, "contentWithTitle:image:", v41, v71);
      }

      else
      {
        id v69 = [v79 deviceSymbolName];
        char v68 = 1;
        id v67 = +[UIImage _systemImageNamed:](&OBJC_CLASS___UIImage, "_systemImageNamed:");
        char v66 = 1;
        BOOL v3 = +[TVSPContent contentWithTitle:image:](&OBJC_CLASS___TVSPContent, "contentWithTitle:image:", v41, v67);
      }

      id v70 = v3;
      if ((v66 & 1) != 0) {

      }
      if ((v68 & 1) != 0) {
      id v31 = v81[0];
      }
      uint64_t v30 = v70;
      id v32 = [v79 batteryLevel];
      objc_msgSend(v31, "_updateContent:withBatteryLevel:", v30);

      id v33 = location[0];
      id v34 = v70;
      uint64_t v35 = *(void *)(a1 + 32);
      id v38 = [v81[0] headphonesController];
      id v37 = [v79 routeUID];
      id v36 = objc_msgSend(v38, "mediaPlayerViewForRouteUID:");
      os_log_type_t v83 =  +[TVSSHeadphonesTitleRenderer rendererWithIdentifier:format:content:headphonesController:mediaPlayerView:]( &OBJC_CLASS___TVSSHeadphonesTitleRenderer,  "rendererWithIdentifier:format:content:headphonesController:mediaPlayerView:",  v33,  16LL,  v34,  v35);

      int v72 = 1;
      objc_storeStrong((id *)&v70, 0LL);
      objc_storeStrong(&v71, 0LL);
    }

    else if (([location[0] isEqualToString:@"noisecontrolA"] & 1) != 0 {
           || ([location[0] isEqualToString:@"noisecontrolB"] & 1) != 0)
    }
    {
      os_log_type_t v83 = (TVSSHeadphonesTitleRenderer *)[v81[0] _noiseControlRendererForIdentifier:location[0]];
      int v72 = 1;
    }

    else if ([location[0] isEqualToString:@"speechdetectA"])
    {
      os_log_type_t v83 = (TVSSHeadphonesTitleRenderer *)[v81[0] _speechDetectRendererForIdentifier:location[0]];
      int v72 = 1;
    }

    else if ([location[0] isEqualToString:@"headtracking"])
    {
      id v29 = [v81[0] routingController];
      id v28 = [v29 availableRoutes];
      id v27 = [v28 firstObject];
      os_log_type_t v83 = (TVSSHeadphonesTitleRenderer *)objc_msgSend(v81[0], "_headTrackingRendererForHeadphone:");

      int v72 = 1;
    }

    else if ([location[0] isEqualToString:@"spatializestereo"])
    {
      char v65 = [v81[0] _spatialUnavailable] & 1;
      char v64 = [v81[0] _currentModeAllowsSpatialAudio] & 1;
      id v19 = location[0];
      id v23 = TVSSLocString(@"TVSSHeadphonesSpatializeStereoTitle");
      id v22 =  +[UIImage _systemImageNamed:]( &OBJC_CLASS___UIImage,  "_systemImageNamed:",  @"person.spatialaudio.stereo.fill");
      id v21 = [v81[0] _localizedValueForCurrentSpatializeStereoState];
      char v20 =  +[TVSPContent contentWithTitle:image:text1:]( &OBJC_CLASS___TVSPContent,  "contentWithTitle:image:text1:",  v23,  v22);
      char v63 =  +[TVSSHeadphonesSettingRenderer rendererWithIdentifier:format:content:]( &OBJC_CLASS___TVSSHeadphonesSettingRenderer,  "rendererWithIdentifier:format:content:",  v19,  16LL);

      id v24 = [v81[0] _packageNameForCurrentSpatializeStereoState];
      -[TVSSHeadphonesSettingRenderer setPackageName:](v63, "setPackageName:");

      id v25 = [v81[0] primaryRoute];
      char v26 = 1;
      if (objc_msgSend(v81[0], "_spatializeStereoEnabledForHeadphone:"))
      {
        char v26 = 1;
      }

      -[TVSSHeadphonesSettingRenderer setDisplayAsOff:](v63, "setDisplayAsOff:", v26 & 1);

      char v18 = 1;
      if ((v65 & 1) == 0) {
        char v18 = v64 ^ 1;
      }
      id v17 = +[TVSPAnimator immediateAnimator](&OBJC_CLASS___TVSPAnimator, "immediateAnimator");
      -[TVSSHeadphonesSettingRenderer setIsDisabled:animator:](v63, "setIsDisabled:animator:", v18 & 1);

      os_log_type_t v83 = v63;
      int v72 = 1;
      objc_storeStrong((id *)&v63, 0LL);
    }

    else if ([location[0] isEqualToString:@"shareaudio"])
    {
      id v13 = location[0];
      id v16 = TVSSLocString(@"TVSSHeadphonesShareAudioTitle");
      id v15 = +[UIImage systemImageNamed:](&OBJC_CLASS___UIImage, "systemImageNamed:", @"headphones");
      int v14 = +[TVSPContent contentWithTitle:image:](&OBJC_CLASS___TVSPContent, "contentWithTitle:image:", v16);
      os_log_type_t v83 =  +[TVSPRenderer rendererWithIdentifier:format:content:]( &OBJC_CLASS___TVSPRenderer,  "rendererWithIdentifier:format:content:",  v13,  16LL);

      int v72 = 1;
    }

    else if (([location[0] isEqualToString:@"volumeA"] & 1) != 0 {
           || ([location[0] isEqualToString:@"volumeB"] & 1) != 0)
    }
    {
      else {
        id v4 = v79;
      }
      id v62 = v4;
      id v11 = [v4 volume];
      id v12 = [v11 volumeLevel];
      if (v12) {
        id v5 = (_UNKNOWN **)v12;
      }
      else {
        id v5 = &off_1001C8C18;
      }
      id v61 = v5;

      id v7 = location[0];
      id v10 = +[TVSPIdentifiers percentageID](&OBJC_CLASS___TVSPIdentifiers, "percentageID");
      id v84 = v10;
      id v85 = v61;
      id v9 =  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v85,  &v84,  1LL);
      id v8 = +[TVSPContent contentWithDictionary:](&OBJC_CLASS___TVSPContent, "contentWithDictionary:");
      os_log_type_t v83 =  +[TVSSVolumeControlRenderer rendererWithIdentifier:format:content:]( &OBJC_CLASS___TVSSVolumeControlRenderer,  "rendererWithIdentifier:format:content:",  v7,  21LL);

      int v72 = 1;
      objc_storeStrong(&v61, 0LL);
      objc_storeStrong(&v62, 0LL);
    }

    else
    {
      os_log_type_t v83 = 0LL;
      int v72 = 1;
    }
  }

  objc_storeStrong(&v79, 0LL);
  objc_storeStrong(&v80, 0LL);
  objc_storeStrong(v81, 0LL);
  objc_storeStrong(location, 0LL);
  return v83;
}

id sub_1000D6620(uint64_t a1, void *a2)
{
  location[1] = (id)a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  v5[1] = (id)a1;
  v5[0] = objc_loadWeakRetained((id *)(a1 + 40));
  id v4 = [v5[0] menuForRenderer:*(void *)(a1 + 32)];
  objc_storeStrong(v5, 0LL);
  objc_storeStrong(location, 0LL);
  return v4;
}

void sub_1000D71C4(uint64_t a1, void *a2)
{
  location[1] = (id)a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  [*(id *)(a1 + 32) _updateListeningModeForHeadphone:*(void *)(a1 + 40) listeningMode:*(void *)(a1 + 48)];
  objc_storeStrong(location, 0LL);
}

void sub_1000D7228(uint64_t a1, void *a2)
{
  location[1] = (id)a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  [*(id *)(a1 + 32) _updateSpatialModeForHeadphone:*(void *)(a1 + 40) spatialMode:2 headTrackingEnabled:1];
  objc_storeStrong(location, 0LL);
}

void sub_1000D7294(uint64_t a1, void *a2)
{
  location[1] = (id)a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  [*(id *)(a1 + 32) _updateSpatialModeForHeadphone:*(void *)(a1 + 40) spatialMode:2 headTrackingEnabled:0];
  objc_storeStrong(location, 0LL);
}

void sub_1000D7300(uint64_t a1, void *a2)
{
  location[1] = (id)a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  [*(id *)(a1 + 32) _updateSpatialModeForHeadphone:*(void *)(a1 + 40) spatialMode:0 headTrackingEnabled:0];
  objc_storeStrong(location, 0LL);
}

LABEL_11:
    -[TVSSHeadphonesController resetHeadphoneMovies](v16->_headphonesController, "resetHeadphoneMovies");
    goto LABEL_12;
  }

  uint64_t v6 = [location[0] identifier];
  id v5 = -[TVSSHeadphonesPanelPlatterController primaryRoute](v16, "primaryRoute");
  id v7 = -[TVCSAudioRoute routeUID](v5, "routeUID");
  LOBYTE(v_Block_object_dispose((const void *)(v18 - 72), 8) = 0;

  if ((v8 & 1) != 0)
  {
    BOOL v3 = -[TVSSHeadphonesPanelPlatterController headphonesController](v16, "headphonesController");
    id v4 = -[TVSSHeadphonesController allowHeadphoneMoviesToPlay](v3, "allowHeadphoneMoviesToPlay");

    if ((v4 & 1) != 0) {
      goto LABEL_5;
    }
    goto LABEL_11;
  }

id sub_1000D7C84(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updatePanelAnimated:", 0, a1, a1);
}

id sub_1000D7E14(uint64_t a1)
{
  id result = [*(id *)(a1 + 40) containsObject:@"volume"];
  return result;
}

LABEL_14:
  id v5 = v13[0];
  objc_storeStrong(v13, 0LL);
  return v5;
}

UIColor *__cdecl sub_1000DDAF8(id a1, UITraitCollection *a2)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  char v6 = 0;
  char v4 = 0;
  if ([location[0] userInterfaceStyle] == (id)2)
  {
    id v7 = +[UIColor secondaryLabelColor](&OBJC_CLASS___UIColor, "secondaryLabelColor");
    char v6 = 1;
    id v2 = v7;
  }

  else
  {
    id v5 = +[UIColor labelColor](&OBJC_CLASS___UIColor, "labelColor");
    char v4 = 1;
    id v2 = v5;
  }

  id v9 = v2;
  if ((v4 & 1) != 0) {

  }
  if ((v6 & 1) != 0) {
  objc_storeStrong(location, 0LL);
  }
  return (UIColor *)v9;
}

void sub_1000E1FD8(id a1)
{
  os_log_t v1 = os_log_create("com.apple.TVSystemUIService.menuItemProvider", "Status");
  id v2 = (void *)qword_100221D68;
  qword_100221D68 = (uint64_t)v1;
}

id sub_1000E212C(void *a1, uint64_t a2)
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

uint64_t sub_1000E25B8(id *a1, void *a2, void *a3)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  id v19 = 0LL;
  objc_storeStrong(&v19, a3);
  v18[1] = a1;
  id v11 = [location[0] identifier];
  uint64_t v3 = objc_opt_class(&OBJC_CLASS___NSString);
  id v12 = sub_1000E212C(v11, v3);

  v17[1] = v12;
  v18[0] = v12;
  v17[0] = objc_msgSend(a1[4], "bs_safeNumberForKey:", v12);
  if (v17[0]) {
    id v9 = [v17[0] integerValue];
  }
  else {
    id v9 = (id)0x8000000000000000LL;
  }
  id v16 = v9;
  id v7 = [v19 identifier];
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___NSString);
  id v8 = sub_1000E212C(v7, v4);

  v14[1] = v8;
  id v15 = v8;
  v14[0] = objc_msgSend(a1[4], "bs_safeNumberForKey:", v8);
  if (v14[0]) {
    id v6 = [v14[0] integerValue];
  }
  else {
    id v6 = (id)0x8000000000000000LL;
  }
  if ((uint64_t)v16 <= (uint64_t)v6)
  {
    else {
      uint64_t v21 = -1LL;
    }
  }

  else
  {
    uint64_t v21 = 1LL;
  }

  objc_storeStrong(v14, 0LL);
  objc_storeStrong(&v15, 0LL);
  objc_storeStrong(v17, 0LL);
  objc_storeStrong(v18, 0LL);
  objc_storeStrong(&v19, 0LL);
  objc_storeStrong(location, 0LL);
  return v21;
}

void sub_1000E28B4(id a1)
{
  v3[0] = @"com.apple.TVSystemUIService.status.remoteChargingItem";
  v4[0] = &off_1001C8C48;
  v3[1] = @"com.apple.TVSystemUIService.status.remoteCriticalBatteryPowerItem";
  v4[1] = &off_1001C8C60;
  id v3[2] = @"com.apple.TVSystemUIService.status.remoteVeryLowBatteryItem";
  id v4[2] = &off_1001C8C78;
  id v3[3] = @"com.apple.TVSystemUIService.status.remoteLowBatteryItem";
  id v4[3] = &off_1001C8C90;
  v3[4] = @"com.apple.TVSystemUIService.status.doNotDisturbItem";
  void v4[4] = &off_1001C8CA8;
  os_log_t v1 =  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v4,  v3,  5LL);
  id v2 = (void *)qword_100221D78;
  qword_100221D78 = (uint64_t)v1;
}

id sub_1000E43C8()
{
  qword_100221D88 = (uint64_t)objc_getClass("BTMediaPlayerView");
  off_1002205F8 = (uint64_t (*)())sub_1000E447C;
  return (id)qword_100221D88;
}

uint64_t sub_1000E4404()
{
  predicate = (dispatch_once_t *)&unk_100221D90;
  dispatch_block_t block = 0LL;
  objc_storeStrong(&block, &stru_1001BA7F8);
  if (*predicate != -1) {
    dispatch_once(predicate, block);
  }
  objc_storeStrong(&block, 0LL);
  return qword_100221D98;
}

id sub_1000E447C()
{
  return (id)qword_100221D88;
}

void sub_1000E4488(id a1)
{
  qword_100221D98 = (uint64_t)dlopen( "/System/Library/PrivateFrameworks/BluetoothServicesUI.framework/BluetoothServicesUI",  2);
}

id sub_1000E4FAC(uint64_t a1)
{
  uint64_t v10 = a1;
  uint64_t v9 = a1;
  memcpy(__dst, &CGAffineTransformIdentity, sizeof(__dst));
  id v2 = *(void **)(a1 + 32);
  memcpy(v7, __dst, sizeof(v7));
  [v2 setTransform:v7];
  CGAffineTransformMakeTranslation(&v6, -*(double *)(a1 + 48), 0.0);
  uint64_t v4 = *(void **)(a1 + 40);
  memcpy(v5, &v6, sizeof(v5));
  return [v4 setTransform:v5];
}

id sub_1000E5074(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:0.0];
}

id sub_1000E50B0(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 1.0, a1, a1);
}

id sub_1000E50E4(uint64_t a1)
{
  return [*(id *)(a1 + 32) satisfyMilestone:@"_TVSSMenuBarPanelSwapAnimationComplete"];
}

void sub_1000E51A0(uint64_t a1)
{
  uint64_t v9 = a1;
  if (a1)
  {
    memset(__b, 0, sizeof(__b));
    id obj = *(id *)(v9 + 8);
    id v6 = [obj countByEnumeratingWithState:__b objects:v10 count:16];
    if (v6)
    {
      uint64_t v2 = *(void *)__b[2];
      uint64_t v3 = 0LL;
      id v4 = v6;
      while (1)
      {
        uint64_t v1 = v3;
        if (*(void *)__b[2] != v2) {
          objc_enumerationMutation(obj);
        }
        id v8 = *(id *)(__b[1] + 8 * v3);
        [v8 stopAnimation:1];
        ++v3;
        if (v1 + 1 >= (unint64_t)v4)
        {
          uint64_t v3 = 0LL;
          id v4 = [obj countByEnumeratingWithState:__b objects:v10 count:16];
          if (!v4) {
            break;
          }
        }
      }
    }
  }

void sub_1000E582C(void *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  id v3 = [(id)objc_opt_class(a1[4]) titleFont];
  objc_msgSend(location[0], "setFont:");

  char v7 = 0;
  char v5 = 0;
  if (a1[5] == 2LL)
  {
    id v8 = +[TVSPConstants defaultDarkModeTextColor](&OBJC_CLASS___TVSPConstants, "defaultDarkModeTextColor");
    char v7 = 1;
    [location[0] setTextColor:v8];
  }

  else
  {
    id v6 = +[TVSPConstants defaultLightModeTextColor](&OBJC_CLASS___TVSPConstants, "defaultLightModeTextColor");
    char v5 = 1;
    [location[0] setTextColor:v6];
  }

  if ((v5 & 1) != 0) {

  }
  if ((v7 & 1) != 0) {
  objc_msgSend(location[0], "setTextAlignment:", 1, location);
  }
  objc_storeStrong(v2, 0LL);
}

uint64_t sub_1000E6A78(uint64_t a1, void *a2)
{
  uint64_t v16 = a1;
  id v15 = a2;
  uint64_t v14 = a1;
  memset(__b, 0, sizeof(__b));
  id obj = *(id *)(a1 + 32);
  id v10 = [obj countByEnumeratingWithState:__b objects:v18 count:16];
  if (v10)
  {
    uint64_t v5 = *(void *)__b[2];
    uint64_t v6 = 0LL;
    id v7 = v10;
    while (1)
    {
      uint64_t v4 = v6;
      if (*(void *)__b[2] != v5) {
        objc_enumerationMutation(obj);
      }
      id v13 = *(id *)(__b[1] + 8 * v6);
      id v2 = [v13 kind];
      if (v2 == v15) {
        break;
      }
      ++v6;
      if (v4 + 1 >= (unint64_t)v7)
      {
        uint64_t v6 = 0LL;
        id v7 = [obj countByEnumeratingWithState:__b objects:v18 count:16];
        if (!v7) {
          goto LABEL_9;
        }
      }
    }

    char v17 = 1;
    int v11 = 1;
  }

  else
  {
LABEL_9:
    int v11 = 0;
  }

  if (!v11) {
    char v17 = 0;
  }
  return v17 & 1;
}

void sub_1000E8448()
{
}

id sub_1000E8458(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 40) + 16) setConfiguration:*(void *)(a1 + 32)];
}

void sub_1000E84B4(id *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  oslog[1] = (os_log_t)a1;
  oslog[0] = (os_log_t)MenuModeContributorLog();
  if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_INFO))
  {
    sub_10000D28C((uint64_t)v6, (uint64_t)location[0]);
    _os_log_impl( (void *)&_mh_execute_header,  oslog[0],  OS_LOG_TYPE_INFO,  "Handling attentionAwareness event: %@",  v6,  0xCu);
  }

  objc_storeStrong((id *)oslog, 0LL);
  id WeakRetained = objc_loadWeakRetained(a1 + 4);
  [WeakRetained _notifyStateContributorHasUpdate];

  objc_storeStrong(location, 0LL);
}

void sub_1000EAC5C()
{
}

void sub_1000EAC6C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _handleLogOverlord];
}

void sub_1000EDBC4(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) menuBarContentView];
  [v1 setDataSource:*(void *)(a1 + 40)];

  id v3 = [*(id *)(a1 + 32) menuBarContentView];
  [v3 layoutIfNeeded];
}

id sub_1000EE7AC(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateStateWithReason:", @"Do not disturb default has changed", a1, a1);
}

void sub_1000EEBA4(void *a1, void *a2, void *a3, void *a4)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  id v8 = 0LL;
  objc_storeStrong(&v8, a3);
  id v7 = 0LL;
  objc_storeStrong(&v7, a4);
  [location[0] doNotDisturbControllerDidUpdate:a1[4]];
  objc_storeStrong(&v7, 0LL);
  objc_storeStrong(&v8, 0LL);
  objc_storeStrong(location, 0LL);
}

id sub_1000EEF80(void *a1, void *a2, void *a3)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  id v9 = 0LL;
  objc_storeStrong(&v9, a3);
  v8[1] = a1;
  id v3 = objc_alloc(&OBJC_CLASS___TVSSControlCenterPanelViewController);
  v8[0] = -[TVSSControlCenterPanelViewController initWithPresentationContext:sleepTimerController:criticalInfoController:systemOutputDeviceRouteController:]( v3,  "initWithPresentationContext:sleepTimerController:criticalInfoController:systemOutputDeviceRouteController:",  v9,  a1[4],  a1[5],  a1[6]);
  id v7 = v8[0];
  objc_storeStrong(v8, 0LL);
  objc_storeStrong(&v9, 0LL);
  objc_storeStrong(location, 0LL);
  return v7;
}

BOOL sub_1000EF1E4(double a1, double a2, double a3, double a4)
{
  BOOL v5 = 0;
  if (a1 == a3) {
    return a2 == a4;
  }
  return v5;
}

id sub_1000EF30C(void *a1, uint64_t a2)
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

uint64_t sub_1000EFC00(uint64_t result, uint64_t a2, int a3, uint64_t a4, uint64_t a5)
{
  *(_BYTE *)id result = 2;
  *(_BYTE *)(result + 1) = 4;
  *(_BYTE *)(result + 2) = 66;
  *(_BYTE *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 0;
  *(_BYTE *)(result + 13) = 4;
  *(_DWORD *)(result + 14) = a3;
  *(_BYTE *)(result + 1_Block_object_dispose((const void *)(v18 - 72), 8) = 64;
  *(_BYTE *)(result + 19) = 8;
  *(void *)(result + 20) = a4;
  *(_BYTE *)(result + 2_Block_object_dispose((const void *)(v18 - 72), 8) = 0;
  *(_BYTE *)(result + 29) = 8;
  *(void *)(result + 30) = a5;
  return result;
}

id TVSSMenuModeBannerPresentationStateDescription(unint64_t a1)
{
  if (a1 <= 3) {
    __asm { BR              X8 }
  }

  return v2;
}

uint64_t sub_1000F0588(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(_BYTE *)id result = 2;
  *(_BYTE *)(result + 1) = 3;
  *(_BYTE *)(result + 2) = 66;
  *(_BYTE *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 0;
  *(_BYTE *)(result + 13) = 8;
  *(void *)(result + 14) = a3;
  *(_BYTE *)(result + 22) = 0;
  *(_BYTE *)(result + 23) = 8;
  *(void *)(result + 24) = a4;
  return result;
}

id sub_1000F0618(uint64_t a1)
{
  if (!a1) {
    return 0LL;
  }
  id v2 = sub_1000F0E90(a1);
  id v3 = -[BSDescriptionBuilder build](v2, "build");

  return v3;
}

id sub_1000F06B8(uint64_t a1, void *a2)
{
  uint64_t v5 = a1;
  id location = 0LL;
  objc_storeStrong(&location, a2);
  if (v5)
  {
    id v3 = sub_1000F1070(v5, location);
    id v6 = [v3 build];
  }

  else
  {
    id v6 = 0LL;
  }

  objc_storeStrong(&location, 0LL);
  return v6;
}

id sub_1000F0BB8(void *a1, uint64_t a2)
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

uint64_t sub_1000F0C78(uint64_t a1)
{
  return *(void *)(*(void *)(a1 + 32) + 16LL);
}

id sub_1000F0C9C(uint64_t a1)
{
  return *(id *)(*(void *)(a1 + 32) + 24LL);
}

uint64_t sub_1000F0CC0(uint64_t a1)
{
  return *(_BYTE *)(*(void *)(a1 + 32) + 8LL) & 1;
}

uint64_t sub_1000F0CE8(uint64_t a1)
{
  return *(_BYTE *)(*(void *)(a1 + 32) + 9LL) & 1;
}

id sub_1000F0D10(uint64_t a1)
{
  return objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 32LL));
}

id sub_1000F0D44(uint64_t a1)
{
  return *(id *)(*(void *)(a1 + 32) + 40LL);
}

BSDescriptionBuilder *sub_1000F0E90(uint64_t a1)
{
  uint64_t v15 = a1;
  if (a1)
  {
    uint64_t v14 = +[BSDescriptionBuilder builderWithObject:](&OBJC_CLASS___BSDescriptionBuilder, "builderWithObject:", v15);
    id v8 = v14;
    id v9 = TVSSMenuModeBannerPresentationStateDescription(*(void *)(v15 + 16));
    id v1 = -[BSDescriptionBuilder appendObject:withName:](v8, "appendObject:withName:");

    id v10 = v14;
    id v11 = (id)BNEffectivePresentableDescription(*(void *)(v15 + 24));
    id v2 = -[BSDescriptionBuilder appendObject:withName:](v10, "appendObject:withName:");

    id v3 =  -[BSDescriptionBuilder appendBool:withName:]( v14,  "appendBool:withName:",  *(_BYTE *)(v15 + 8) & 1,  @"shouldAnimateTransition");
    id v4 =  -[BSDescriptionBuilder appendBool:withName:]( v14,  "appendBool:withName:",  *(_BYTE *)(v15 + 9) & 1,  @"supportsInteractiveMode");
    id v12 = v14;
    id WeakRetained = objc_loadWeakRetained((id *)(v15 + 32));
    id v5 = -[BSDescriptionBuilder appendObject:withName:skipIfNil:](v12, "appendObject:withName:skipIfNil:");

    id v6 =  -[BSDescriptionBuilder appendObject:withName:skipIfNil:]( v14,  "appendObject:withName:skipIfNil:",  *(void *)(v15 + 40),  @"dismissalReason",  1LL);
    uint64_t v16 = v14;
    objc_storeStrong((id *)&v14, 0LL);
  }

  else
  {
    uint64_t v16 = 0LL;
  }

  return v16;
}

id sub_1000F1070(uint64_t a1, void *a2)
{
  uint64_t v6 = a1;
  id location = 0LL;
  objc_storeStrong(&location, a2);
  if (v6)
  {
    id v3 = sub_1000F0E90(v6);
    [v3 setActiveMultilinePrefix:location];
    id v7 = v3;
    int v4 = 1;
    objc_storeStrong(&v3, 0LL);
  }

  else
  {
    id v7 = 0LL;
    int v4 = 1;
  }

  objc_storeStrong(&location, 0LL);
  return v7;
}

uint64_t TVSSIsInternalVariant()
{
  return os_variant_has_internal_ui("com.apple.TVSystemUIService") & 1;
}

uint64_t TVSSDebugPassiveModeAlwaysEnabled()
{
  int v4 = (dispatch_once_t *)&unk_100221DA0;
  id location = 0LL;
  objc_storeStrong(&location, &stru_1001BA9C0);
  if (*v4 != -1) {
    dispatch_once(v4, location);
  }
  objc_storeStrong(&location, 0LL);
  id v1 = +[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults");
  unsigned __int8 v2 = -[NSUserDefaults BOOLForKey:](v1, "BOOLForKey:", @"DebugPassiveModeAlwaysEnabled");

  return v2 & 1;
}

void sub_1000F1308(id a1)
{
  unsigned __int8 v2 = +[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults");
  id v3 = @"DebugPassiveModeAlwaysEnabled";
  int v4 = &__kCFBooleanFalse;
  id v1 =  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v4,  &v3,  1LL);
  -[NSUserDefaults registerDefaults:](v2, "registerDefaults:");
}

uint64_t TVSSDebugGuideLinesEnabled()
{
  int v4 = (dispatch_once_t *)&unk_100221DA8;
  id location = 0LL;
  objc_storeStrong(&location, &stru_1001BA9E8);
  if (*v4 != -1) {
    dispatch_once(v4, location);
  }
  objc_storeStrong(&location, 0LL);
  id v1 = +[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults");
  unsigned __int8 v2 = -[NSUserDefaults BOOLForKey:](v1, "BOOLForKey:", @"DebugGuideLinesEnabled");

  return v2 & 1;
}

void sub_1000F148C(id a1)
{
  unsigned __int8 v2 = +[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults");
  id v3 = @"DebugGuideLinesEnabled";
  int v4 = &__kCFBooleanFalse;
  id v1 =  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v4,  &v3,  1LL);
  -[NSUserDefaults registerDefaults:](v2, "registerDefaults:");
}

uint64_t TVSSDebugMenuEnabled()
{
  int v4 = (dispatch_once_t *)&unk_100221DB0;
  id location = 0LL;
  objc_storeStrong(&location, &stru_1001BAA10);
  if (*v4 != -1) {
    dispatch_once(v4, location);
  }
  objc_storeStrong(&location, 0LL);
  id v1 = +[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults");
  unsigned __int8 v2 = -[NSUserDefaults BOOLForKey:](v1, "BOOLForKey:", @"DebugMenuEnabled");

  return v2 & 1;
}

void sub_1000F1610(id a1)
{
  unsigned __int8 v2 = +[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults");
  id v3 = @"DebugMenuEnabled";
  int v4 = &__kCFBooleanFalse;
  id v1 =  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v4,  &v3,  1LL);
  -[NSUserDefaults registerDefaults:](v2, "registerDefaults:");
}

uint64_t TVSSDebugInfoHUDEnabled()
{
  int v4 = (dispatch_once_t *)&unk_100221DB8;
  id location = 0LL;
  objc_storeStrong(&location, &stru_1001BAA38);
  if (*v4 != -1) {
    dispatch_once(v4, location);
  }
  objc_storeStrong(&location, 0LL);
  id v1 = +[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults");
  unsigned __int8 v2 = -[NSUserDefaults BOOLForKey:](v1, "BOOLForKey:", @"DebugInfoHUDEnabled");

  return v2 & 1;
}

void sub_1000F1794(id a1)
{
  unsigned __int8 v2 = +[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults");
  id v3 = @"DebugInfoHUDEnabled";
  int v4 = &__kCFBooleanFalse;
  id v1 =  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v4,  &v3,  1LL);
  -[NSUserDefaults registerDefaults:](v2, "registerDefaults:");
}

uint64_t TVSSDebugIncludeExampleProviderInPassiveModeEnabled()
{
  int v4 = (dispatch_once_t *)&unk_100221DC0;
  id location = 0LL;
  objc_storeStrong(&location, &stru_1001BAA60);
  if (*v4 != -1) {
    dispatch_once(v4, location);
  }
  objc_storeStrong(&location, 0LL);
  id v1 = +[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults");
  unsigned __int8 v2 = -[NSUserDefaults BOOLForKey:](v1, "BOOLForKey:", @"DebugIncludeExampleProviderInPassiveModeEnabled");

  return v2 & 1;
}

void sub_1000F1918(id a1)
{
  unsigned __int8 v2 = +[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults");
  id v3 = @"DebugIncludeExampleProviderInPassiveModeEnabled";
  int v4 = &__kCFBooleanFalse;
  id v1 =  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v4,  &v3,  1LL);
  -[NSUserDefaults registerDefaults:](v2, "registerDefaults:");
}

double TVSSAttentionAwarenessTimeout()
{
  id v5 = (dispatch_once_t *)&unk_100221DC8;
  id location = 0LL;
  objc_storeStrong(&location, &stru_1001BAA88);
  if (*v5 != -1) {
    dispatch_once(v5, location);
  }
  objc_storeStrong(&location, 0LL);
  unsigned __int8 v2 = +[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults");
  -[NSUserDefaults doubleForKey:](v2, "doubleForKey:", @"AttentionAwarenessTimeout");
  double v3 = v0;

  return v3;
}

void sub_1000F1A94(id a1)
{
  unsigned __int8 v2 = +[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults");
  double v3 = @"AttentionAwarenessTimeout";
  int v4 = &off_1001C8F90;
  id v1 =  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v4,  &v3,  1LL);
  -[NSUserDefaults registerDefaults:](v2, "registerDefaults:");
}

double TVSSLingeringDuration()
{
  id v5 = (dispatch_once_t *)&unk_100221DD0;
  id location = 0LL;
  objc_storeStrong(&location, &stru_1001BAAB0);
  if (*v5 != -1) {
    dispatch_once(v5, location);
  }
  objc_storeStrong(&location, 0LL);
  unsigned __int8 v2 = +[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults");
  -[NSUserDefaults doubleForKey:](v2, "doubleForKey:", @"NowPlayingLingeringDuration");
  double v3 = v0;

  return v3;
}

void sub_1000F1C10(id a1)
{
  unsigned __int8 v2 = +[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults");
  double v3 = @"NowPlayingLingeringDuration";
  int v4 = &off_1001C8FA0;
  id v1 =  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v4,  &v3,  1LL);
  -[NSUserDefaults registerDefaults:](v2, "registerDefaults:");
}

id TVSSLocStringFromBundle(void *a1, void *a2, char a3, void *a4)
{
  id location = 0LL;
  objc_storeStrong(&location, a1);
  id v15 = 0LL;
  objc_storeStrong(&v15, a2);
  char v14 = a3 & 1;
  id v13 = 0LL;
  objc_storeStrong(&v13, a4);
  id v12 = location;
  if ((v14 & 1) != 0)
  {
    id v4 = (id)SFLocalizableWAPIStringKeyForKey(location);
    id v5 = v12;
    id v12 = v4;
  }

  id v11 = [v15 localizedStringForKey:v12 value:&stru_1001BDAC8 table:v13];
  id v7 = v11;
  objc_storeStrong(&v11, 0LL);
  objc_storeStrong(&v12, 0LL);
  objc_storeStrong(&v13, 0LL);
  objc_storeStrong(&v15, 0LL);
  objc_storeStrong(&location, 0LL);
  return v7;
}

id TVSSLocString(id obj)
{
  id location = 0LL;
  objc_storeStrong(&location, obj);
  id v2 = location;
  double v3 = +[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle");
  id v4 = TVSSLocStringFromBundle(v2, v3, 0, @"Localizable");

  objc_storeStrong(&location, 0LL);
  return v4;
}

id TVSSWiFiLocString(id obj)
{
  id location = 0LL;
  objc_storeStrong(&location, obj);
  id v2 = location;
  double v3 = +[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle");
  id v4 = TVSSLocStringFromBundle(v2, v3, 1, @"Localizable");

  objc_storeStrong(&location, 0LL);
  return v4;
}

id TVSSInternalLocalizedString(id obj)
{
  id location = 0LL;
  objc_storeStrong(&location, obj);
  id v2 = location;
  double v3 = +[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle");
  id v4 = TVSSLocStringFromBundle(v2, v3, 0, @"Localizable-Internal");

  objc_storeStrong(&location, 0LL);
  return v4;
}

id TVSSLocalizablePlurals(id obj)
{
  id location = 0LL;
  objc_storeStrong(&location, obj);
  id v2 = location;
  double v3 = +[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle");
  id v4 = TVSSLocStringFromBundle(v2, v3, 0, @"Localizable-Plurals");

  objc_storeStrong(&location, 0LL);
  return v4;
}

id TVSSLagunaLocalizedString(id obj)
{
  id location = 0LL;
  objc_storeStrong(&location, obj);
  id v2 = location;
  double v3 = +[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle");
  id v4 = TVSSLocStringFromBundle(v2, v3, 0, @"Localizable-Laguna");

  objc_storeStrong(&location, 0LL);
  return v4;
}

id sub_1000F23D8(id a1, id a2)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  id v3 =  +[BSDescriptionBuilder succinctDescriptionForObject:]( &OBJC_CLASS___BSDescriptionBuilder,  "succinctDescriptionForObject:",  location[0]);
  objc_storeStrong(location, 0LL);
  return v3;
}

id sub_1000F279C(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "items", a1, a1);
}

BOOL sub_1000F41C4(uint64_t a1, uint64_t a2)
{
  return sub_1000F6A40(a1, a2) == a2;
}

uint64_t sub_1000F4200(uint64_t a1, uint64_t a2)
{
  return a1 & ~a2;
}

uint64_t sub_1000F4220(uint64_t a1, uint64_t a2)
{
  return a1 | a2;
}

id sub_1000F4AD0(uint64_t a1, void *a2)
{
  location[1] = (id)a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  v21[1] = (id)a1;
  v21[0] = 0LL;
  id v14 = location[0];
  id v2 =  +[TVSSBluetoothControllerConfiguration gameControllersConfiguration]( &OBJC_CLASS___TVSSBluetoothControllerConfiguration,  "gameControllersConfiguration");
  BOOL v15 = v14 != v2;

  if (!v15)
  {
    id v3 =  +[TVPSBluetoothDeviceManagerConfiguration gameControllersConfiguration]( &OBJC_CLASS___TVPSBluetoothDeviceManagerConfiguration,  "gameControllersConfiguration");
    id v4 = v21[0];
    v21[0] = v3;
  }

  if (!v21[0])
  {
    char v20 =  +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"underlyingConfiguration");
    id v19 = &_os_log_default;
    char v18 = 16;
    if (os_log_type_enabled((os_log_t)v19, OS_LOG_TYPE_ERROR))
    {
      log = (os_log_s *)v19;
      os_log_type_t type = v18;
      id v12 = NSStringFromSelector(*(SEL *)(a1 + 40));
      id v8 = v12;
      char v17 = v8;
      id v5 = (objc_class *)objc_opt_class(*(void *)(a1 + 32));
      id v11 = NSStringFromClass(v5);
      uint64_t v16 = v11;
      sub_10000583C( (uint64_t)v23,  (uint64_t)v8,  (uint64_t)v16,  *(void *)(a1 + 32),  (uint64_t)@"TVSSBluetoothController.m",  157,  (uint64_t)v20);
      _os_log_error_impl( (void *)&_mh_execute_header,  log,  type,  "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@",  v23,  0x3Au);

      objc_storeStrong((id *)&v16, 0LL);
      objc_storeStrong((id *)&v17, 0LL);
    }

    objc_storeStrong(&v19, 0LL);
    _bs_set_crash_log_message(-[NSString UTF8String](v20, "UTF8String"));
    __break(0);
    JUMPOUT(0x1000F4D2CLL);
  }

  id v7 = (id)TVPSBluetoothDeviceManagerWithConfiguration(v21[0]);
  objc_storeStrong(v21, 0LL);
  objc_storeStrong(location, 0LL);
  return v7;
}

BOOL sub_1000F4E60(id a1, TVSSBluetoothDevice *a2)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  BOOL v3 = [location[0] connectionState] == (id)2;
  objc_storeStrong(location, 0LL);
  return v3;
}

void sub_1000F5F88(void *a1, void *a2, void *a3, void *a4, _BYTE *a5)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  id v10 = 0LL;
  objc_storeStrong(&v10, a3);
  id v9 = 0LL;
  objc_storeStrong(&v9, a4);
  *(_BYTE *)(*(void *)(a1[4] + 8LL) + 24LL) = 1;
  *a5 = 1;
  objc_storeStrong(&v9, 0LL);
  objc_storeStrong(&v10, 0LL);
  objc_storeStrong(location, 0LL);
}

void sub_1000F6178(void *a1, void *a2, void *a3, void *a4)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  id v8 = 0LL;
  objc_storeStrong(&v8, a3);
  id v7 = 0LL;
  objc_storeStrong(&v7, a4);
  [location[0] bluetoothControllerPairedDevicesDidUpdate:a1[4]];
  objc_storeStrong(&v7, 0LL);
  objc_storeStrong(&v8, 0LL);
  objc_storeStrong(location, 0LL);
}

void sub_1000F642C(void *a1, void *a2, void *a3, void *a4)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  id v8 = 0LL;
  objc_storeStrong(&v8, a3);
  id v7 = 0LL;
  objc_storeStrong(&v7, a4);
  [location[0] bluetoothControllerPairableDevicesDidUpdate:a1[4]];
  objc_storeStrong(&v7, 0LL);
  objc_storeStrong(&v8, 0LL);
  objc_storeStrong(location, 0LL);
}

TVSSBluetoothDevice *__cdecl sub_1000F6694(id a1, TVPSBluetoothDevice *a2)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  id v3 =  +[TVSSBluetoothDevice deviceFromTVPSBluetoothDevice:]( &OBJC_CLASS___TVSSBluetoothDevice,  "deviceFromTVPSBluetoothDevice:",  location[0]);
  objc_storeStrong(location, 0LL);
  return (TVSSBluetoothDevice *)v3;
}

uint64_t sub_1000F6A40(uint64_t a1, uint64_t a2)
{
  return a1 & a2;
}

void sub_1000F7244(id *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  v5[1] = a1;
  v5[0] = objc_loadWeakRetained(a1 + 4);
  if (v5[0])
  {
    double v2 = CACurrentMediaTime();
    id v3 = [*((id *)v5[0] + 2) layer];
    [v3 setBeginTime:v2];
  }

  objc_storeStrong(v5, 0LL);
  objc_storeStrong(location, 0LL);
}

TVSPRenderer *__cdecl sub_1000F7678(id a1, NSString *a2)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  double v2 = (void *)objc_opt_class(&OBJC_CLASS___TVSSProfilePanelNoUserPlatterController);
  id v4 = [v2 rendererForIdentifier:location[0]];
  objc_storeStrong(location, 0LL);
  return (TVSPRenderer *)v4;
}

__CFString *TVSSBluetoothDeviceTypeDescription(uint64_t a1)
{
  switch(a1)
  {
    case 0LL:
      return @"Unknown";
    case 1LL:
      return @"Remote";
    case 2LL:
      double v2 = @"Game Controller";
      break;
  }

  return v2;
}

id TVSSBluetoothDeviceConnectionStateDescription(unint64_t a1)
{
  if (a1 <= 3) {
    __asm { BR              X8 }
  }

  return v2;
}

id TVSSBluetoothDeviceLowBatteryStateDescription(unint64_t a1)
{
  if (a1 <= 3) {
    __asm { BR              X8 }
  }

  return v2;
}

BOOL sub_1000F8998(uint64_t a1, uint64_t a2)
{
  return sub_1000F94FC(a1, a2) == a2;
}

id sub_1000F91CC(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "identifier", a1, a1);
}

id sub_1000F91FC(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "type", a1, a1);
}

id sub_1000F922C(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "connectionState", a1, a1);
}

id sub_1000F925C(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "flags", a1, a1);
}

id sub_1000F928C(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "batteryLevel", a1, a1);
}

uint64_t sub_1000F94FC(uint64_t a1, uint64_t a2)
{
  return a1 & a2;
}

id sub_1000F9AF4(void *a1, uint64_t a2)
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

void sub_1000FA6D0(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _cycleTimerDidFire];
}

void sub_1000FB1A4(unint64_t a1, int a2)
{
  STACK[0x250] = a1;
  LODWORD(STACK[0x24C]) = a2;
  objc_destroyWeak((id *)&STACK[0x258]);
  _Unwind_Resume((_Unwind_Exception *)STACK[0x250]);
}

void sub_1000FB250(id *a1)
{
  id location[2] = a1;
  location[1] = a1;
  location[0] = objc_loadWeakRetained(a1 + 4);
  if (location[0])
  {
    [*((id *)location[0] + 2) setAlpha:0.0];
    [*((id *)location[0] + 3) setAlpha:1.0];
  }

  objc_storeStrong(location, 0LL);
}

void sub_1000FB2E8(id *a1, void *a2)
{
  id location[3] = a1;
  id location[2] = a2;
  location[1] = a1;
  location[0] = objc_loadWeakRetained(a1 + 4);
  if (location[0])
  {
    [*((id *)location[0] + 1) finishedWithCurrentMenuItem];
    [*((id *)location[0] + 2) removeFromSuperview];
    objc_storeStrong((id *)location[0] + 2, *((id *)location[0] + 3));
    objc_storeStrong((id *)location[0] + 3, 0LL);
    [location[0] _startCyclingTimer];
  }

  objc_storeStrong(location, 0LL);
}

BOOL sub_1000FB774(void *a1)
{
  if (a1)
  {
    id v3 = [a1 presentableUserInfo];
    id v2 = objc_msgSend(v3, "bs_safeNumberForKey:", TVSPBannerPresentableKeyBannerType);
    id v4 = [v2 integerValue];

    return v4 == (id)2;
  }

  else
  {
    return 0;
  }

void sub_1000FB830(id *a1)
{
  id v27 = a1;
  if (a1)
  {
    id v26 = [v27 view];
    id v25 = [v27 bannerTemplate];
    id v24 = objc_alloc_init(&OBJC_CLASS___TVSPToastViewConfiguration);
    id v1 = v24;
    id v2 = [v25 title];
    objc_msgSend(v1, "setTitle:");

    id v3 = v24;
    id v4 = [v25 subtitle];
    objc_msgSend(v3, "setSubtitle:");

    id v5 = v24;
    id v6 = [v25 footer];
    objc_msgSend(v5, "setFooter:");

    id v8 = objc_alloc(&OBJC_CLASS___TVSPToastView);
    id v7 = v24;
    id v9 = [v25 leadingView];
    id v23 = objc_msgSend(v8, "initWithConfiguration:leadingView:", v7);

    [v23 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v26 addSubview:v23];
    id v22 = [v23 topAnchor];
    id v21 = [v26 topAnchor];
    id v20 = objc_msgSend(v22, "constraintEqualToAnchor:");
    v28[0] = v20;
    id v19 = [v23 bottomAnchor];
    id v18 = [v26 bottomAnchor];
    id v17 = objc_msgSend(v19, "constraintEqualToAnchor:");
    v28[1] = v17;
    id v16 = [v23 leadingAnchor];
    id v15 = [v26 leadingAnchor];
    id v14 = objc_msgSend(v16, "constraintEqualToAnchor:");
    v28[2] = v14;
    id v13 = [v23 trailingAnchor];
    id v12 = [v26 trailingAnchor];
    id v11 = objc_msgSend(v13, "constraintEqualToAnchor:");
    v28[3] = v11;
    id v10 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v28, 4LL);
    +[NSLayoutConstraint activateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "activateConstraints:");

    objc_storeStrong(v27 + 2, v26);
    sub_1000FD560((uint64_t)v27, v23);
    objc_storeStrong(&v23, 0LL);
    objc_storeStrong(&v24, 0LL);
    objc_storeStrong(&v25, 0LL);
    objc_storeStrong(&v26, 0LL);
  }

void sub_1000FBC6C(id *a1)
{
  id v47 = a1;
  if (a1)
  {
    id v46 = [v47 view];
    [v46 setPreservesSuperviewLayoutMargins:0];
    [v46 setInsetsLayoutMarginsFromSafeArea:0];
    id v45 = [v47 bannerTemplate];
    id v44 = [v45 leadingView];
    id v43 = [v45 trailingView];
    id v42 = 0LL;
    if (v44 || v43)
    {
      id v3 = objc_alloc_init(&OBJC_CLASS___TVSPBannerPillContentViewConfiguration);
      id v4 = v42;
      id v42 = v3;

      id v30 = [v47[5] bulletinConfiguration];
      id v31 = [v30 leadingImageMargins];

      id v41 = v31;
      if (v31)
      {
        [v42 applyLeadingImageMargins:v41];
      }

      else if (v44)
      {
        if ([v47[5] leadingImageTreatment] == (id)2)
        {
          [v42 applyLeadingImageMargins:6];
          +[TVSSConstants templateBannerMediaImageSize](&OBJC_CLASS___TVSSConstants, "templateBannerMediaImageSize");
          double v37 = v5;
          double v38 = v6;
          id v7 = +[TVSSConstants templateBannerMediaImageSmallSize]( &OBJC_CLASS___TVSSConstants,  "templateBannerMediaImageSmallSize");
          double v35 = v8;
          double v36 = v9;
          *(void *)&__int128 v39 = TVSPBannerPillSizesMake(v7, v37, v38, v8, v9);
          *((double *)&v39 + 1) = v10;
          *(double *)&__int128 v40 = v11;
          *((double *)&v40 + 1) = v12;
          __int128 v33 = v39;
          __int128 v34 = v40;
          objc_msgSend(v42, "setLeadingViewSizes:", *(double *)&v39, v10, v11, v12);
        }
      }
    }

    else
    {
      id v1 =  +[TVSPBannerPillContentViewConfiguration textOnlyConfiguration]( &OBJC_CLASS___TVSPBannerPillContentViewConfiguration,  "textOnlyConfiguration");
      id v2 = v42;
      id v42 = v1;
    }

    id v32 = [[TVSPBannerPillContentView alloc] initWithConfiguration:v42 leadingView:v44 trailingView:v43];
    [v32 setTranslatesAutoresizingMaskIntoConstraints:0];
    id v13 = v32;
    id v14 = [v45 title];
    objc_msgSend(v13, "setAttributedTitle:");

    id v15 = v32;
    id v16 = sub_1000FDAD4(v47);
    objc_msgSend(v15, "setAttributedSubtitle:");

    [v46 addSubview:v32];
    id v29 = [v32 topAnchor];
    id v28 = [v46 topAnchor];
    id v27 = objc_msgSend(v29, "constraintEqualToAnchor:");
    v48[0] = v27;
    id v26 = [v32 bottomAnchor];
    id v25 = [v46 bottomAnchor];
    id v24 = objc_msgSend(v26, "constraintEqualToAnchor:");
    v48[1] = v24;
    id v23 = [v32 leadingAnchor];
    id v22 = [v46 leadingAnchor];
    id v21 = objc_msgSend(v23, "constraintEqualToAnchor:");
    void v48[2] = v21;
    id v20 = [v32 trailingAnchor];
    id v19 = [v46 trailingAnchor];
    id v18 = objc_msgSend(v20, "constraintEqualToAnchor:");
    v48[3] = v18;
    id v17 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v48, 4LL);
    +[NSLayoutConstraint activateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "activateConstraints:");

    objc_storeStrong(v47 + 2, v32);
    objc_storeStrong(v47 + 3, v32);
    sub_1000FD560((uint64_t)v47, v32);
    objc_storeStrong(&v32, 0LL);
    objc_storeStrong(&v42, 0LL);
    objc_storeStrong(&v43, 0LL);
    objc_storeStrong(&v44, 0LL);
    objc_storeStrong(&v45, 0LL);
    objc_storeStrong(&v46, 0LL);
  }

id sub_1000FC400(id *a1)
{
  double v12 = a1;
  if (a1)
  {
    id v11 = 0LL;
    id v5 = sub_1000FD854(v12);
    id v10 = [v5 primaryTemplateItemProvider];

    if ([v10 conformsToProtocol:&OBJC_PROTOCOL___BNTemplateTextProviding])
    {
      id v9 = [v10 templateItemText];
      char v6 = 0;
      if (v9)
      {
        id v7 = -[NSAttributedString initWithString:](objc_alloc(&OBJC_CLASS___NSAttributedString), "initWithString:", v9);
        char v6 = 1;
        id v1 = v7;
      }

      else
      {
        id v1 = (NSAttributedString *)0LL;
      }

      double v8 = v1;
      if ((v6 & 1) != 0) {

      }
      id v2 = sub_1000FDDF8((uint64_t)v12, v8);
      id v3 = v11;
      id v11 = v2;

      objc_storeStrong((id *)&v8, 0LL);
      objc_storeStrong(&v9, 0LL);
    }

    id v13 = v11;
    objc_storeStrong(&v10, 0LL);
    objc_storeStrong(&v11, 0LL);
  }

  else
  {
    id v13 = 0LL;
  }

  return v13;
}

void sub_1000FC5B4(id *a1, void *a2, void *a3)
{
  id v48 = a1;
  id v47 = a2;
  id v46 = a3;
  if (a1)
  {
    SEL v45 = "_getSubtitleText:footerText:";
    if (!v47)
    {
      id v44 =  +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"subtitleOut != ((void *)0)");
      id v43 = &_os_log_default;
      char v42 = 16;
      if (os_log_type_enabled((os_log_t)v43, OS_LOG_TYPE_ERROR))
      {
        log = (os_log_s *)v43;
        os_log_type_t type = v42;
        id v26 = NSStringFromSelector(v45);
        id v22 = v26;
        id v41 = v22;
        id v3 = (objc_class *)objc_opt_class(v48);
        id v25 = NSStringFromClass(v3);
        __int128 v40 = v25;
        sub_10000583C( (uint64_t)v50,  (uint64_t)v22,  (uint64_t)v40,  (uint64_t)v48,  (uint64_t)@"TVSSBannerTemplatePresentableViewController.m",  294,  (uint64_t)v44);
        _os_log_error_impl( (void *)&_mh_execute_header,  log,  type,  "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@",  v50,  0x3Au);

        objc_storeStrong((id *)&v40, 0LL);
        objc_storeStrong((id *)&v41, 0LL);
      }

      objc_storeStrong(&v43, 0LL);
      _bs_set_crash_log_message(-[NSString UTF8String](v44, "UTF8String"));
      __break(0);
      JUMPOUT(0x1000FC7CCLL);
    }

    if (!v46)
    {
      __int128 v39 =  +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"footerOut != ((void *)0)");
      id v38 = &_os_log_default;
      char v37 = 16;
      if (os_log_type_enabled((os_log_t)v38, OS_LOG_TYPE_ERROR))
      {
        id v18 = (os_log_s *)v38;
        os_log_type_t v19 = v37;
        id v21 = NSStringFromSelector(v45);
        id v17 = v21;
        double v36 = v17;
        id v4 = (objc_class *)objc_opt_class(v48);
        id v20 = NSStringFromClass(v4);
        double v35 = v20;
        sub_10000583C( (uint64_t)v49,  (uint64_t)v17,  (uint64_t)v35,  (uint64_t)v48,  (uint64_t)@"TVSSBannerTemplatePresentableViewController.m",  295,  (uint64_t)v39);
        _os_log_error_impl( (void *)&_mh_execute_header,  v18,  v19,  "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@",  v49,  0x3Au);

        objc_storeStrong((id *)&v35, 0LL);
        objc_storeStrong((id *)&v36, 0LL);
      }

      objc_storeStrong(&v38, 0LL);
      _bs_set_crash_log_message(-[NSString UTF8String](v39, "UTF8String"));
      __break(0);
      JUMPOUT(0x1000FC988LL);
    }

    id v34 = 0LL;
    id v33 = 0LL;
    id v16 = sub_1000FD854(v48);
    id v32 = [v16 secondaryTemplateItemProvider];

    if ([v32 conformsToProtocol:&OBJC_PROTOCOL___BNTemplateViewProviding])
    {
      id v31 = [v32 templateItemButtonConfiguration];
      double v12 = v48;
      id v13 = [v31 attributedTitle];
      id v5 = sub_1000FDDF8((uint64_t)v12, v13);
      id v6 = v33;
      id v33 = v5;

      id v14 = v48;
      id v15 = [v31 attributedSubtitle];
      id v7 = sub_1000FDDF8((uint64_t)v14, v15);
      id v8 = v34;
      id v34 = v7;

      objc_storeStrong(&v31, 0LL);
    }

    if (!v34
      && ([v32 conformsToProtocol:&OBJC_PROTOCOL___BNTemplateTextProviding] & 1) != 0)
    {
      id v30 = [v32 templateItemText];
      char v27 = 0;
      if (v30)
      {
        id v28 = -[NSAttributedString initWithString:]( objc_alloc(&OBJC_CLASS___NSAttributedString),  "initWithString:",  v30);
        char v27 = 1;
        id v9 = v28;
      }

      else
      {
        id v9 = (NSAttributedString *)0LL;
      }

      id v29 = v9;
      if ((v27 & 1) != 0) {

      }
      id v10 = sub_1000FDDF8((uint64_t)v48, v29);
      id v11 = v34;
      id v34 = v10;

      objc_storeStrong((id *)&v29, 0LL);
      objc_storeStrong(&v30, 0LL);
    }

    *id v47 = v34;
    *id v46 = v33;
    objc_storeStrong(&v32, 0LL);
    objc_storeStrong(&v33, 0LL);
    objc_storeStrong(&v34, 0LL);
  }

id sub_1000FCC84(id *a1)
{
  id v21 = a1;
  if (a1)
  {
    id v12 = sub_1000FD854(v21);
    id v20 = [v12 leadingTemplateViewProvider];

    id v19 = [v21 bannerConfiguration];
    id v18 = [v19 personNameComponents];
    id location = 0LL;
    if (v18)
    {
      id v6 = [v20 templateItemImageProvider];
      id v16 = sub_1000FDE74(v21, v6);

      id v15 = objc_alloc_init(&OBJC_CLASS___TVSUIProfilePictureView);
      -[TVSUIProfilePictureView setProfilePictureImage:](v15, "setProfilePictureImage:", v16);
      -[TVSUIProfilePictureView setPersonNameComponents:](v15, "setPersonNameComponents:", v18);
      +[TVSSConstants templateBannerImageMaxSize](&OBJC_CLASS___TVSSConstants, "templateBannerImageMaxSize");
      double v13 = v1;
      double v14 = v2;
      id v11 = -[TVSUIProfilePictureView widthAnchor](v15, "widthAnchor");
      id v10 = [v11 constraintEqualToConstant:v13];
      v23[0] = v10;
      id v9 = -[TVSUIProfilePictureView heightAnchor](v15, "heightAnchor");
      id v8 = [v9 constraintEqualToConstant:v14];
      v23[1] = v8;
      id v7 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v23, 2LL);
      +[NSLayoutConstraint activateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "activateConstraints:");

      objc_storeStrong(&location, v15);
      objc_storeStrong((id *)&v15, 0LL);
      objc_storeStrong(&v16, 0LL);
    }

    else
    {
      id v3 = sub_1000FE278(v21, v20, (uint64_t)[v19 leadingImageTreatment]);
      id v4 = location;
      id location = v3;
    }

    id v22 = location;
    objc_storeStrong(&location, 0LL);
    objc_storeStrong(&v18, 0LL);
    objc_storeStrong(&v19, 0LL);
    objc_storeStrong(&v20, 0LL);
  }

  else
  {
    id v22 = 0LL;
  }

  return v22;
}

UIImageView *sub_1000FCFB8(id *a1)
{
  id v7 = a1;
  if (a1)
  {
    id v2 = sub_1000FD854(v7);
    id v6 = [v2 trailingTemplateViewProvider];

    id v4 = v7;
    id v3 = v6;
    id v5 = [v7 bannerConfiguration];
    id v8 = sub_1000FE278(v4, v3, (uint64_t)[v5 trailingImageTreatment]);

    objc_storeStrong(&v6, 0LL);
  }

  else
  {
    id v8 = 0LL;
  }

  return v8;
}

id sub_1000FD4A0(void *a1, uint64_t a2)
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

void sub_1000FD560(uint64_t a1, void *a2)
{
  uint64_t v3 = a1;
  id location = 0LL;
  objc_storeStrong(&location, a2);
  if (v3 && *(id *)(v3 + 56) != location)
  {
    sub_1000FD640(v3);
    [*(id *)(v3 + 56) setDelegate:0];
    objc_storeStrong((id *)(v3 + 56), location);
    [*(id *)(v3 + 56) setDelegate:v3];
  }

  objc_storeStrong(&location, 0LL);
}

void sub_1000FD640(uint64_t a1)
{
  if (a1)
  {
    if (*(void *)(a1 + 64))
    {
      (*(void (**)(void))(*(void *)(a1 + 64) + 16LL))();
      double v1 = *(void **)(a1 + 64);
      *(void *)(a1 + 64) = 0LL;
    }
  }

id sub_1000FD854(id *a1)
{
  uint64_t v3 = a1;
  if (a1)
  {
    id location = [v3 presentable];
    if ((objc_opt_respondsToSelector(location, "providesTemplateContent") & 1) != 0
      && ([location providesTemplateContent] & 1) != 0)
    {
      id v4 = location;
    }

    else
    {
      id v4 = v3[6];
    }

    objc_storeStrong(&location, 0LL);
  }

  else
  {
    id v4 = 0LL;
  }

  return v4;
}

id sub_1000FDAD4(void *a1)
{
  id v23 = a1;
  if (a1)
  {
    id v22 = [v23 bannerTemplate];
    id v21 = [v22 subtitle];
    id v14 = [v22 subtitle];
    char v19 = 0;
    BOOL v15 = 0;
    if (v14)
    {
      id v20 = [v22 footer];
      char v19 = 1;
      BOOL v15 = v20 != 0LL;
    }

    if ((v19 & 1) != 0) {

    }
    if (v15)
    {
      id v18 = objc_alloc_init(&OBJC_CLASS___NSMutableAttributedString);
      id v8 = v18;
      id v9 = [v22 subtitle];
      -[NSMutableAttributedString appendAttributedString:](v8, "appendAttributedString:");

      id v10 = v18;
      id v11 = -[NSAttributedString initWithString:]( objc_alloc(&OBJC_CLASS___NSAttributedString),  "initWithString:",  @"\t");
      -[NSMutableAttributedString appendAttributedString:](v10, "appendAttributedString:");

      id v12 = v18;
      id v13 = [v22 footer];
      -[NSMutableAttributedString appendAttributedString:](v12, "appendAttributedString:");

      id v1 = -[NSMutableAttributedString copy](v18, "copy");
      id v2 = v21;
      id v21 = v1;

      objc_storeStrong((id *)&v18, 0LL);
    }

    else
    {
      id v6 = [v22 subtitle];
      char v16 = 0;
      BOOL v7 = 0;
      if (!v6)
      {
        id v17 = [v22 footer];
        char v16 = 1;
        BOOL v7 = v17 != 0LL;
      }

      if ((v16 & 1) != 0) {

      }
      if (v7)
      {
        id v3 = [v22 footer];
        id v4 = v21;
        id v21 = v3;
      }
    }

    id v24 = v21;
    objc_storeStrong(&v21, 0LL);
    objc_storeStrong(&v22, 0LL);
  }

  else
  {
    id v24 = 0LL;
  }

  return v24;
}

id sub_1000FDDF8(uint64_t a1, void *a2)
{
  uint64_t v4 = a1;
  id location = 0LL;
  objc_storeStrong(&location, a2);
  if (v4) {
    id v5 = (id)TVSPBannerSubtitleReplacingButtonImagePlaceholdersInAttributedString(location);
  }
  else {
    id v5 = 0LL;
  }
  objc_storeStrong(&location, 0LL);
  return v5;
}

id sub_1000FDE74(void *a1, void *a2)
{
  id v30 = a1;
  id location = 0LL;
  objc_storeStrong(&location, a2);
  if (v30)
  {
    id v27 = 0LL;
    char v25 = 0;
    BOOL v16 = 0;
    if (location)
    {
      id v26 = [location image];
      char v25 = 1;
      BOOL v16 = v26 != 0LL;
    }

    if ((v25 & 1) != 0) {

    }
    if (v16)
    {
      id v24 = [location image];
      if ([v24 isSymbolImage] & 1)
      {
        id v22 = 0LL;
        if (sub_1000FB774(v30))
        {
          else {
            id v2 = UIFontTextStyleTitle2;
          }
          id v21 = v2;
          id v20 = +[UIFont preferredFontForTextStyle:](&OBJC_CLASS___UIFont, "preferredFontForTextStyle:", v2);
          id v3 =  +[UIImageSymbolConfiguration configurationWithFont:scale:]( &OBJC_CLASS___UIImageSymbolConfiguration,  "configurationWithFont:scale:",  v20,  1LL);
          id v4 = v22;
          id v22 = v3;

          objc_storeStrong((id *)&v20, 0LL);
          objc_storeStrong((id *)&v21, 0LL);
        }

        else
        {
          else {
            id v5 = (NSString *)UIFontTextStyleSubtitle1;
          }
          char v19 = v5;
          id v18 = +[UIFont preferredFontForTextStyle:](&OBJC_CLASS___UIFont, "preferredFontForTextStyle:", v5);
          id v6 =  +[UIImageSymbolConfiguration configurationWithFont:]( &OBJC_CLASS___UIImageSymbolConfiguration,  "configurationWithFont:",  v18);
          id v7 = v22;
          id v22 = v6;

          objc_storeStrong((id *)&v18, 0LL);
          objc_storeStrong((id *)&v19, 0LL);
        }

        id v17 = v22;
        id v8 = [v24 symbolConfiguration];
        BOOL v15 = v8 == 0LL;

        if (!v15)
        {
          id v14 = [v24 symbolConfiguration];
          id v9 = [v14 configurationByApplyingConfiguration:v22];
          id v10 = v17;
          id v17 = v9;
        }

        id v11 = [v24 imageWithSymbolConfiguration:v17];
        id v12 = v27;
        id v27 = v11;

        objc_storeStrong(&v17, 0LL);
        objc_storeStrong(&v22, 0LL);
      }

      else
      {
        objc_storeStrong(&v27, v24);
      }

      objc_storeStrong(&v24, 0LL);
    }

    id v31 = v27;
    int v28 = 1;
    objc_storeStrong(&v27, 0LL);
  }

  else
  {
    id v31 = 0LL;
    int v28 = 1;
  }

  objc_storeStrong(&location, 0LL);
  return v31;
}

UIImageView *sub_1000FE278(void *a1, void *a2, uint64_t a3)
{
  id v29 = a1;
  id location = 0LL;
  objc_storeStrong(&location, a2);
  uint64_t v27 = a3;
  if (v29)
  {
    char v25 = 0LL;
    id v24 = [location templateItemImageProvider];
    id v23 = sub_1000FDE74(v29, v24);
    if (v23)
    {
      id v3 = -[UIImageView initWithImage:](objc_alloc(&OBJC_CLASS___UIImageView), "initWithImage:", v23);
      id v4 = v25;
      char v25 = v3;

      else {
        uint64_t v5 = 1LL;
      }
      -[UIImageView setContentMode:](v25, "setContentMode:", v5);
      -[UIImageView setClipsToBounds:](v25, "setClipsToBounds:", 1LL);
      char v21 = 0;
      char v19 = 0;
      if (sub_1000FB774(v29))
      {
        id v22 = +[UIColor secondaryLabelColor](&OBJC_CLASS___UIColor, "secondaryLabelColor");
        char v21 = 1;
        -[UIImageView setTintColor:](v25, "setTintColor:", v22);
      }

      else
      {
        id v20 = +[UIColor labelColor](&OBJC_CLASS___UIColor, "labelColor");
        char v19 = 1;
        -[UIImageView setTintColor:](v25, "setTintColor:", v20);
      }

      if ((v19 & 1) != 0) {

      }
      if ((v21 & 1) != 0) {
      +[TVSSConstants templateBannerImageMaxSize](&OBJC_CLASS___TVSSConstants, "templateBannerImageMaxSize");
      }
      double v17 = v6;
      double v18 = v7;
      id v15 = -[UIImageView widthAnchor](v25, "widthAnchor");
      id v14 = [v15 constraintLessThanOrEqualToConstant:v17];
      v31[0] = v14;
      id v13 = -[UIImageView heightAnchor](v25, "heightAnchor");
      id v12 = [v13 constraintLessThanOrEqualToConstant:v18];
      v31[1] = v12;
      id v11 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v31, 2LL);
      +[NSLayoutConstraint activateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "activateConstraints:");

      [v23 size];
      if (v8 >= v17) {
        double v10 = v17;
      }
      else {
        double v10 = v8;
      }
      if (v27)
      {
        if (v27 == 1)
        {
          -[UIImageView _setCornerRadius:](v25, "_setCornerRadius:", v10 / 2.0);
        }

        else if (v27 == 2)
        {
          +[TVSSConstants templateBannerImageRoundedRectCornerRadius]( &OBJC_CLASS___TVSSConstants,  "templateBannerImageRoundedRectCornerRadius");
          -[UIImageView _setCornerRadius:](v25, "_setCornerRadius:");
        }
      }
    }

    id v30 = v25;
    int v26 = 1;
    objc_storeStrong(&v23, 0LL);
    objc_storeStrong(&v24, 0LL);
    objc_storeStrong((id *)&v25, 0LL);
  }

  else
  {
    id v30 = 0LL;
    int v26 = 1;
  }

  objc_storeStrong(&location, 0LL);
  return v30;
}

double sub_1000FECD4(id a1, $04B05C73ED6AEEF31C5815932084562D *a2)
{
  *(void *)&__dst[9] = a1;
  *(void *)&__dst[8] = a2;
  *(void *)&__dst[7] = a1;
  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  double v7 = v2;
  memcpy(__dst, a2, 0x38uLL);
  id v14 = __dst;
  double v13 = v7;
  int v12 = 0;
  double v10 = __dst[4] + (v7 - __dst[0]) * *(float *)&__dst[5];
  double v9 = __dst[3];
  if (v10 >= __dst[3]) {
    double v5 = v9;
  }
  else {
    double v5 = v10;
  }
  __dst[11] = v5;
  double v11 = v5;
  else {
    return v11;
  }
}

id sub_100100C18(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "identifier", a1, a1);
}

id sub_100100C48(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "title", a1, a1);
}

id sub_100100C78(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "artistTitle", a1, a1);
}

id sub_100100CA8(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "albumTitle", a1, a1);
}

id sub_100100CD8(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "duration", a1, a1);
}

id sub_100100D08(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "elapsedTime", a1, a1);
}

unint64_t sub_100100D38(uint64_t a1)
{
  return (unint64_t)objc_msgSend(*(id *)(a1 + 32), "isLiveContent", a1, a1) & 1;
}

unint64_t sub_100100D6C(uint64_t a1)
{
  return (unint64_t)objc_msgSend(*(id *)(a1 + 32), "isPodcast", a1, a1) & 1;
}

uint64_t sub_100100DA0(uint64_t a1)
{
  double v2 = *(void **)(*(void *)(a1 + 32) + 8LL);
  id v3 = [*(id *)(a1 + 40) artworkCatalog];
  unsigned __int8 v4 = objc_msgSend(v2, "isArtworkVisuallyIdenticalToCatalog:");

  return v4 & 1;
}

BOOL TVSCameraIsRestricted()
{
  id v1 = +[MCProfileConnection sharedConnection](&OBJC_CLASS___MCProfileConnection, "sharedConnection");
  unsigned __int8 v2 = [v1 isSettingLockedDownByRestrictions:MCFeatureCameraAllowed];

  char v6 = v2 & 1;
  id v3 = +[MCProfileConnection sharedConnection](&OBJC_CLASS___MCProfileConnection, "sharedConnection");
  id location = [v3 effectiveValueForSetting:MCFeatureCameraAllowed];

  BOOL v4 = 0;
  if ((v2 & 1) != 0) {
    BOOL v4 = [location integerValue] == 0;
  }
  objc_storeStrong(&location, 0LL);
  return v4;
}

BOOL TVSVideoConferencingIsRestricted()
{
  id v1 = +[MCProfileConnection sharedConnection](&OBJC_CLASS___MCProfileConnection, "sharedConnection");
  unsigned __int8 v2 = [v1 isSettingLockedDownByRestrictions:MCFeatureVideoConferencingAllowed];

  char v6 = v2 & 1;
  id v3 = +[MCProfileConnection sharedConnection](&OBJC_CLASS___MCProfileConnection, "sharedConnection");
  id location = [v3 effectiveValueForSetting:MCFeatureVideoConferencingAllowed];

  BOOL v4 = 0;
  if ((v2 & 1) != 0) {
    BOOL v4 = [location integerValue] == 0;
  }
  objc_storeStrong(&location, 0LL);
  return v4;
}

void sub_100102D1C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, int a13, int a14, _Unwind_Exception *exception_object, char a16, uint64_t a17, uint64_t a18, uint64_t a19, id a20)
{
}

void sub_100102D48(id *a1, void *a2, void *a3)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  id v7 = 0LL;
  objc_storeStrong(&v7, a3);
  id v5 = location[0];
  id WeakRetained = objc_loadWeakRetained(a1 + 4);
  [WeakRetained setAvailableScheduledSleepRequests:v5];

  objc_storeStrong(&v7, 0LL);
  objc_storeStrong(location, 0LL);
}

void sub_100103D80(void *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  objc_storeStrong((id *)(a1[4] + 88LL), 0LL);
  objc_storeStrong(location, 0LL);
}

void sub_100104940(id a1)
{
  id v1 =  +[UIColor colorWithDynamicProvider:]( &OBJC_CLASS___UIColor,  "colorWithDynamicProvider:",  &stru_1001BB158,  a1,  a1);
  unsigned __int8 v2 = (void *)qword_100221DE0;
  qword_100221DE0 = (uint64_t)v1;
}

UIColor *__cdecl sub_100104994(id a1, UITraitCollection *a2)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  if ([location[0] userInterfaceStyle] == (id)2) {
    BOOL v4 = +[UIColor colorWithWhite:alpha:](&OBJC_CLASS___UIColor, "colorWithWhite:alpha:", 0.48627451, 1.0);
  }
  else {
    BOOL v4 = +[UIColor colorWithWhite:alpha:](&OBJC_CLASS___UIColor, "colorWithWhite:alpha:", 0.301960784, 1.0);
  }
  objc_storeStrong(location, 0LL);
  return v4;
}

void sub_100104B68(id a1)
{
  id v1 =  +[UIColor colorWithDynamicProvider:]( &OBJC_CLASS___UIColor,  "colorWithDynamicProvider:",  &stru_1001BB198,  a1,  a1);
  unsigned __int8 v2 = (void *)qword_100221DF0;
  qword_100221DF0 = (uint64_t)v1;
}

UIColor *__cdecl sub_100104BBC(id a1, UITraitCollection *a2)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  if ([location[0] userInterfaceStyle] == (id)2) {
    BOOL v4 = +[UIColor colorWithWhite:alpha:](&OBJC_CLASS___UIColor, "colorWithWhite:alpha:", 0.850980392, 1.0);
  }
  else {
    BOOL v4 = +[UIColor colorWithWhite:alpha:](&OBJC_CLASS___UIColor, "colorWithWhite:alpha:", 0.176470588, 1.0);
  }
  objc_storeStrong(location, 0LL);
  return v4;
}

void sub_1001053E4(id *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  id WeakRetained = objc_loadWeakRetained(a1 + 4);
  objc_msgSend(WeakRetained, "_systemStatusQueue_handleUpdatedDomainData:", location[0]);

  objc_storeStrong(location, 0LL);
}

BOOL sub_100105F88(id a1, TVSSSensorActivityAttribution *a2)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  BOOL v3 = 1;
  if ([location[0] sensorType]) {
    BOOL v3 = [location[0] sensorType] == (id)1;
  }
  objc_storeStrong(location, 0LL);
  return v3;
}

BOOL sub_10010627C(id a1, TVSSSensorActivityAttribution *a2)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  BOOL v3 = [location[0] sensorType] == (id)2;
  objc_storeStrong(location, 0LL);
  return v3;
}

void sub_100106480(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained _handleUpdatedActiveActivityAttributions:*(void *)(a1 + 32) recentActivityAttributions:*(void *)(a1 + 40)];
}

TVSSSensorActivityAttribution *__cdecl sub_1001065E8(id a1, STUIDataAccessAttribution *a2)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  unsigned __int8 v2 = objc_alloc(&OBJC_CLASS___TVSSSensorActivityAttribution);
  BOOL v4 = -[TVSSSensorActivityAttribution initWithSTUIDataAccessAttribution:]( v2,  "initWithSTUIDataAccessAttribution:",  location[0]);
  objc_storeStrong(location, 0LL);
  return v4;
}

TVSSSensorActivityAttribution *__cdecl sub_10010676C(id a1, STUIDataAccessAttribution *a2)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  unsigned __int8 v2 = objc_alloc(&OBJC_CLASS___TVSSSensorActivityAttribution);
  BOOL v4 = -[TVSSSensorActivityAttribution initWithSTUIDataAccessAttribution:]( v2,  "initWithSTUIDataAccessAttribution:",  location[0]);
  objc_storeStrong(location, 0LL);
  return v4;
}

void sub_10010697C(void *a1, void *a2, void *a3, void *a4)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  id v8 = 0LL;
  objc_storeStrong(&v8, a3);
  id v7 = 0LL;
  objc_storeStrong(&v7, a4);
  [location[0] sensorActivityControllerDidUpdate:a1[4]];
  objc_storeStrong(&v7, 0LL);
  objc_storeStrong(&v8, 0LL);
  objc_storeStrong(location, 0LL);
}

BOOL sub_100106AD8(id *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  BOOL v5 = ([a1[4] _shouldExcludeAttribution:location[0]] & 1) == 0;
  objc_storeStrong(location, 0LL);
  return v5;
}

void sub_100106C84(id a1)
{
  id v1 = +[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", &off_1001C87B0, a1, a1);
  unsigned __int8 v2 = (void *)qword_100221E00;
  qword_100221E00 = (uint64_t)v1;
}

void sub_100107618(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) containerView];
  [v1 setNeedsLayout];

  id v2 = [*(id *)(a1 + 32) containerView];
  [v2 layoutIfNeeded];

  id v3 = [*(id *)(a1 + 32) pillView];
  [v3 setNeedsLayout];

  id v5 = [*(id *)(a1 + 32) pillView];
  [v5 layoutIfNeeded];
}

void sub_100107800( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, int a16, int a17, _Unwind_Exception *exception_object, char a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, id a24)
{
}

void sub_10010782C(id *a1)
{
  id v21[2] = a1;
  v21[1] = a1;
  v21[0] = objc_loadWeakRetained(a1 + 5);
  if (v21[0])
  {
    id v20 = [v21[0] mode];
    id v19 = [a1[4] controllerForMode:v20];
    id v18 = [v21[0] menuDataSourceContentView];
    id v17 = [v19 dataSource];
    id v16 =  +[TVSPMenuBarContentViewConfiguration standardConfiguration]( &OBJC_CLASS___TVSPMenuBarContentViewConfiguration,  "standardConfiguration");
    if (v20 == (id)3)
    {
      id v1 =  +[TVSPMenuBarContentViewConfiguration focusedConfiguration]( &OBJC_CLASS___TVSPMenuBarContentViewConfiguration,  "focusedConfiguration");
      id v2 = v16;
      id v16 = v1;
    }

    else if (v20 == (id)5)
    {
      id v8 = [v17 items];
      BOOL v9 = [v8 count] == (id)1;

      id v13 = [a1[4] menuModeController];
      id v12 = [v13 provider];
      id v11 = [v12 state];
      id v10 = [v11 faceTimePlatterState];
      unsigned __int8 v14 = objc_msgSend(v10, "tvss_useFaceTimeIconForState");

      if ((v14 & 1) != 0)
      {
        if (v9) {
          id v3 =  +[TVSPMenuBarContentViewConfiguration privacyPlusFaceTimeSoloIconConfiguration]( &OBJC_CLASS___TVSPMenuBarContentViewConfiguration,  "privacyPlusFaceTimeSoloIconConfiguration");
        }
        else {
          id v3 =  +[TVSPMenuBarContentViewConfiguration privacyPlusFaceTimeIconWithExpandedPillConfiguration]( &OBJC_CLASS___TVSPMenuBarContentViewConfiguration,  "privacyPlusFaceTimeIconWithExpandedPillConfiguration");
        }
      }

      else if (v9)
      {
        id v3 =  +[TVSPMenuBarContentViewConfiguration privacyPlusSharePlaySoloIconConfiguration]( &OBJC_CLASS___TVSPMenuBarContentViewConfiguration,  "privacyPlusSharePlaySoloIconConfiguration");
      }

      else
      {
        id v3 =  +[TVSPMenuBarContentViewConfiguration privacyPlusSharePlayIconWithExpandedPillConfiguration]( &OBJC_CLASS___TVSPMenuBarContentViewConfiguration,  "privacyPlusSharePlayIconWithExpandedPillConfiguration");
      }

      BOOL v4 = v16;
      id v16 = v3;
    }

    else if (v20 == (id)4)
    {
      id v5 =  +[TVSPMenuBarContentViewConfiguration privacyConfiguration]( &OBJC_CLASS___TVSPMenuBarContentViewConfiguration,  "privacyConfiguration");
      char v6 = v16;
      id v16 = v5;
    }

    objc_msgSend(v21[0], "_notifyContentViewConfigurationWillChangeWithConfiguration:", v16, &v16);
    [v18 setConfiguration:v16];
    [v18 setDataSource:v17];
    [v18 setNeedsLayout];
    [v18 layoutIfNeeded];
    [v21[0] setContentView:v18];
    objc_storeStrong(location, 0LL);
    objc_storeStrong(&v17, 0LL);
    objc_storeStrong(&v18, 0LL);
    objc_storeStrong(&v19, 0LL);
  }

  objc_storeStrong(v21, 0LL);
}

void sub_10010A238( uint64_t a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, id *location)
{
  *(void *)(v45 - 192) = a1;
  *(_DWORD *)(v45 - 196) = a2;
  objc_destroyWeak(location);
  objc_destroyWeak((id *)(v45 - 144));
  _Unwind_Resume(*(_Unwind_Exception **)(v45 - 192));
}

void sub_10010A2A4(id *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  v5[1] = a1;
  v5[0] = objc_loadWeakRetained(a1 + 4);
  if (v5[0])
  {
    id v2 = [v5[0] content];
    id v3 = [v2 contentImage];

    if (v3)
    {
      [*((id *)v5[0] + 2) setActive:0];
      [*((id *)v5[0] + 1) setActive:1];
    }

    else
    {
      [*((id *)v5[0] + 1) setActive:0];
      [*((id *)v5[0] + 2) setActive:1];
    }
  }

  objc_storeStrong(v5, 0LL);
  objc_storeStrong(location, 0LL);
}

UIColor *__cdecl sub_10010B978(id a1, UITraitCollection *a2)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  char v6 = 0;
  char v4 = 0;
  if ([location[0] userInterfaceStyle] == (id)2)
  {
    id v7 = +[UIColor systemGray5Color](&OBJC_CLASS___UIColor, "systemGray5Color");
    char v6 = 1;
    id v2 = v7;
  }

  else
  {
    id v5 = +[UIColor systemGray3Color](&OBJC_CLASS___UIColor, "systemGray3Color");
    char v4 = 1;
    id v2 = v5;
  }

  id v9 = v2;
  if ((v4 & 1) != 0) {

  }
  if ((v6 & 1) != 0) {
  objc_storeStrong(location, 0LL);
  }
  return (UIColor *)v9;
}

UIColor *__cdecl sub_10010BAB0(id a1, UITraitCollection *a2)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  char v6 = 0;
  char v4 = 0;
  if ([location[0] userInterfaceStyle] == (id)2)
  {
    id v7 = +[UIColor systemGray2Color](&OBJC_CLASS___UIColor, "systemGray2Color");
    char v6 = 1;
    id v2 = (UIColor *)v7;
  }

  else
  {
    id v5 = +[UIColor blackColor](&OBJC_CLASS___UIColor, "blackColor");
    char v4 = 1;
    id v2 = v5;
  }

  id v9 = v2;
  if ((v4 & 1) != 0) {

  }
  if ((v6 & 1) != 0) {
  objc_storeStrong(location, 0LL);
  }
  return v9;
}

  ;
}

UIColor *__cdecl sub_10010BC14(id a1, UITraitCollection *a2)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  char v6 = 0;
  char v4 = 0;
  if ([location[0] userInterfaceStyle] == (id)2)
  {
    id v7 = +[UIColor systemGray3Color](&OBJC_CLASS___UIColor, "systemGray3Color");
    char v6 = 1;
    id v2 = v7;
  }

  else
  {
    id v5 = +[UIColor systemGray2Color](&OBJC_CLASS___UIColor, "systemGray2Color");
    char v4 = 1;
    id v2 = v5;
  }

  id v9 = v2;
  if ((v4 & 1) != 0) {

  }
  if ((v6 & 1) != 0) {
  objc_storeStrong(location, 0LL);
  }
  return (UIColor *)v9;
}

void sub_10010ECDC(double *a1, void *a2, void *a3, void *a4)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  id v8 = 0LL;
  objc_storeStrong(&v8, a3);
  id v7 = 0LL;
  objc_storeStrong(&v7, a4);
  [location[0] transportBarDidUpdateWithTimeElapsed:a1[4] timeRemaining:a1[5] percentComplete:a1[6]];
  objc_storeStrong(&v7, 0LL);
  objc_storeStrong(&v8, 0LL);
  objc_storeStrong(location, 0LL);
}

void sub_10010FED0()
{
}

id sub_10010FEE0(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = [WeakRetained stateDumpBuilder];
  id v4 = [v2 build];

  return v4;
}

id sub_100110CA4(id a1, TVSSMenuDataSourceController *a2)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  id v3 =  +[BSDescriptionBuilder succinctDescriptionForObject:]( &OBJC_CLASS___BSDescriptionBuilder,  "succinctDescriptionForObject:",  location[0]);
  objc_storeStrong(location, 0LL);
  return v3;
}

void sub_100111E18(id *a1, void *a2, void *a3, void *a4)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  id v8 = 0LL;
  objc_storeStrong(&v8, a3);
  id v7[2] = a4;
  v7[1] = a1;
  v7[0] =  +[TVSSVideoEffectRenderer rendererWithIdentifier:format:content:]( &OBJC_CLASS___TVSSVideoEffectRenderer,  "rendererWithIdentifier:format:content:",  location[0],  16LL,  v8);
  [v7[0] setStylingBlock:&stru_1001BB488];
  [a1[4] addObject:v7[0]];
  objc_storeStrong(v7, 0LL);
  objc_storeStrong(&v8, 0LL);
  objc_storeStrong(location, 0LL);
}

TVSPStyling *__cdecl sub_100111EF8(id a1, TVSPStylingBlockRenderer *a2, NSString *a3)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  id v14 = 0LL;
  objc_storeStrong(&v14, a3);
  id v11 = v14;
  id v12 = +[TVSPIdentifiers imageID](&OBJC_CLASS___TVSPIdentifiers, "imageID");
  unsigned __int8 v13 = objc_msgSend(v11, "isEqualToString:");

  if ((v13 & 1) != 0)
  {
    id v8 = [location[0] content];
    unsigned __int8 v9 = [v8 contentIsSelected];

    if ((v9 & 1) != 0)
    {
      id v7 = +[TVSPIdentifiers imageID](&OBJC_CLASS___TVSPIdentifiers, "imageID");
      id v6 = +[TVSPConstants defaultSelectedTintColor](&OBJC_CLASS___TVSPConstants, "defaultSelectedTintColor");
      id v5 = +[TVSPViewAttribute tintColor:](&OBJC_CLASS___TVSPViewAttribute, "tintColor:");
      id v17 = v5;
      id v4 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v17, 1LL);
      id v16 =  +[TVSPStyling stylingWithIdentifier:attributes:]( &OBJC_CLASS___TVSPStyling,  "stylingWithIdentifier:attributes:",  v7);
    }

    else
    {
      id v16 = 0LL;
    }
  }

  else
  {
    id v16 = 0LL;
  }

  objc_storeStrong(&v14, 0LL);
  objc_storeStrong(location, 0LL);
  return v16;
}

TVSPRenderer *__cdecl sub_100112EA0(id a1, NSString *a2)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  objc_storeStrong(location, 0LL);
  return 0LL;
}

void sub_100112EF0(uint64_t a1, uint64_t a2, char a3)
{
  if (a2)
  {
    if ((a3 & 1) != 0)
    {
      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
      [WeakRetained enqueueSampleBuffer:a2];
    }
  }

UIMenu *sub_100113130(id *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  v38[1] = a1;
  v38[0] = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  memset(__b, 0, sizeof(__b));
  id v21 = [a1[4] micModes];
  id obj = [v21 allValues];

  id v23 = [obj countByEnumeratingWithState:__b objects:v41 count:16];
  if (v23)
  {
    uint64_t v17 = *(void *)__b[2];
    uint64_t v18 = 0LL;
    id v19 = v23;
    while (1)
    {
      uint64_t v16 = v18;
      if (*(void *)__b[2] != v17) {
        objc_enumerationMutation(obj);
      }
      id v37 = *(id *)(__b[1] + 8 * v18);
      if ([v37 isSupported])
      {
        id v12 = [v37 displayName];
        id v11 = [v37 systemImageName];
        id v10 = +[UIImage _systemImageNamed:](&OBJC_CLASS___UIImage, "_systemImageNamed:");
        v28[1] = _NSConcreteStackBlock;
        int v29 = -1073741824;
        int v30 = 0;
        id v31 = sub_1001136E0;
        id v32 = &unk_1001BA6D0;
        id v33 = a1[4];
        id v34 = v37;
        double v35 =  +[UIAction actionWithTitle:image:identifier:handler:]( &OBJC_CLASS___UIAction,  "actionWithTitle:image:identifier:handler:",  v12,  v10);

        -[UIAction setState:](v35, "setState:", ([v37 isEnabled] & 1) != 0);
        unsigned __int8 v13 = v35;
        id v14 = v38[0];
        id v15 =  +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [v37 avMode]);
        objc_msgSend(v14, "setObject:forKeyedSubscript:", v13);

        objc_storeStrong((id *)&v35, 0LL);
        objc_storeStrong(&v34, 0LL);
        objc_storeStrong(&v33, 0LL);
      }

      ++v18;
      if (v16 + 1 >= (unint64_t)v19)
      {
        uint64_t v18 = 0LL;
        id v19 = [obj countByEnumeratingWithState:__b objects:v41 count:16];
        if (!v19) {
          break;
        }
      }
    }
  }

  v28[0] = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  id v27 = &off_1001C87E0;
  memset(v25, 0, sizeof(v25));
  id v8 = v27;
  id v9 = [v8 countByEnumeratingWithState:v25 objects:v40 count:16];
  if (v9)
  {
    uint64_t v5 = *(void *)v25[2];
    uint64_t v6 = 0LL;
    id v7 = v9;
    while (1)
    {
      uint64_t v4 = v6;
      if (*(void *)v25[2] != v5) {
        objc_enumerationMutation(v8);
      }
      uint64_t v26 = *(void *)(v25[1] + 8 * v6);
      id v24 = [v38[0] objectForKeyedSubscript:v26];
      if (v24) {
        [v28[0] addObject:v24];
      }
      objc_storeStrong(&v24, 0LL);
      ++v6;
      if (v4 + 1 >= (unint64_t)v7)
      {
        uint64_t v6 = 0LL;
        id v7 = [v8 countByEnumeratingWithState:v25 objects:v40 count:16];
        if (!v7) {
          break;
        }
      }
    }
  }

  id v3 = +[UIMenu menuWithChildren:](&OBJC_CLASS___UIMenu, "menuWithChildren:", v28[0]);
  objc_storeStrong(&v27, 0LL);
  objc_storeStrong(v28, 0LL);
  objc_storeStrong(v38, 0LL);
  objc_storeStrong(location, 0LL);
  return v3;
}

void sub_1001136E0(uint64_t a1, void *a2)
{
  location[1] = (id)a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  [*(id *)(a1 + 32) enableMicMode:*(void *)(a1 + 40)];
  objc_storeStrong(location, 0LL);
}

id sub_100114594(void *a1, uint64_t a2)
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

void sub_100114DC8(id a1)
{
  os_log_t v1 = os_log_create("com.apple.TVSystemUIService.menuItemProvider", "CurrentUser");
  id v2 = (void *)qword_100221E08;
  qword_100221E08 = (uint64_t)v1;
}

id sub_100115070(void *a1, uint64_t a2)
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

id sub_1001157FC(uint64_t a1)
{
  uint64_t v6 = a1;
  uint64_t v5 = a1;
  id v2 = *(void **)(a1 + 32);
  CGAffineTransformMakeScale(&v4, 0.8, 0.8);
  [v2 setTransform:&v4];
  return [*(id *)(a1 + 32) setAlpha:0.0];
}

UIColor *__cdecl sub_100116008(id a1, UITraitCollection *a2)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  char v6 = 0;
  char v4 = 0;
  if ([location[0] userInterfaceStyle] == (id)2)
  {
    id v7 =  +[TVSPConstants defaultDarkModeDetailTextColor]( &OBJC_CLASS___TVSPConstants,  "defaultDarkModeDetailTextColor");
    char v6 = 1;
    id v2 = v7;
  }

  else
  {
    id v5 =  +[TVSPConstants defaultLightModeDetailTextColor]( &OBJC_CLASS___TVSPConstants,  "defaultLightModeDetailTextColor");
    char v4 = 1;
    id v2 = v5;
  }

  id v9 = v2;
  if ((v4 & 1) != 0) {

  }
  if ((v6 & 1) != 0) {
  objc_storeStrong(location, 0LL);
  }
  return (UIColor *)v9;
}

void sub_1001168F0(id *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  id v23 = a1;
  id v11 = [a1[4] progressLayer];
  id v10 = [v11 presentationLayer];
  [v10 strokeEnd];
  double v12 = v2;

  double v22 = v12;
  id v13 = [a1[4] progressLayer];
  [v13 removeAnimationForKey:@"TVSSProgressViewStartingAnimation"];

  [a1[4] setProgress:1.0];
  +[CATransaction begin](&OBJC_CLASS___CATransaction, "begin");
  uint64_t v16 = _NSConcreteStackBlock;
  int v17 = -1073741824;
  int v18 = 0;
  id v19 = sub_100116C14;
  id v20 = &unk_1001B5A60;
  id v21 = a1[4];
  +[CATransaction setCompletionBlock:](&OBJC_CLASS___CATransaction, "setCompletionBlock:", &v16);
  id v15 =  +[CABasicAnimation animationWithKeyPath:]( &OBJC_CLASS___CABasicAnimation,  "animationWithKeyPath:",  @"strokeEnd");
  [a1[4] progress];
  if ((v3 - v22) / 2.0 >= 0.2) {
    double v9 = (v3 - v22) / 2.0;
  }
  else {
    double v9 = 0.2;
  }
  -[CABasicAnimation setDuration:](v15, "setDuration:", v9);
  char v4 = v15;
  id v5 = +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v22);
  -[CABasicAnimation setFromValue:](v4, "setFromValue:");

  char v6 = v15;
  [a1[4] progress];
  id v7 = +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:");
  -[CABasicAnimation setToValue:](v6, "setToValue:");

  id v8 = [a1[4] progressLayer];
  [v8 addAnimation:v15 forKey:@"TVSSProgressViewFinishingAnimation"];

  +[CATransaction commit](&OBJC_CLASS___CATransaction, "commit");
  objc_storeStrong((id *)&v15, 0LL);
  objc_storeStrong(&v21, 0LL);
  objc_storeStrong(location, 0LL);
}

id sub_100116C14(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_fadeOut", a1, a1);
}

void sub_100116C44(id *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  id v4 = [a1[4] progressLayer];
  id v3 = [a1[4] progressLayer];
  id v2 = [v3 presentationLayer];
  [v2 strokeEnd];
  objc_msgSend(v4, "setStrokeEnd:");

  id v5 = [a1[4] progressLayer];
  [v5 removeAllAnimations];

  [a1[4] _fadeOut];
  objc_storeStrong(location, 0LL);
}

id sub_100117408(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 1.0, a1, a1);
}

id sub_10011754C(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0, a1, a1);
}

id sub_100117580(uint64_t a1)
{
  return [*(id *)(a1 + 32) resetProgress];
}

id sub_100117814(uint64_t a1)
{
  id result = [*(id *)(a1 + 32) progress];
  if (v2 == 1.0) {
    return [*(id *)(a1 + 32) _fadeOut];
  }
  return result;
}

void sub_100117998( uint64_t a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *location)
{
  *(void *)(v10 - 40) = a1;
  *(_DWORD *)(v10 - 44) = a2;
  objc_destroyWeak((id *)(v10 - 32));
  _Unwind_Resume(*(_Unwind_Exception **)(v10 - 40));
}

void sub_1001179D8(id *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  id v4 = location[0];
  uint64_t v2 = objc_opt_class(&OBJC_CLASS___NSNumber);
  id v5 = sub_100117A98(v4, v2);
  [v5 doubleValue];
  double v6 = v3;

  id WeakRetained = objc_loadWeakRetained(a1 + 4);
  [WeakRetained _updateWithProgressFractionCompleted:v6];

  objc_storeStrong(location, 0LL);
}

id sub_100117A98(void *a1, uint64_t a2)
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

id sub_100119124(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = sub_100119170(WeakRetained);

  return v3;
}

id sub_100119170(id *a1)
{
  id v14 = a1;
  if (a1)
  {
    id location = BannerPresenterLog();
    os_log_type_t v12 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)location, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = (os_log_s *)location;
      os_log_type_t v9 = v12;
      sub_100010524(v11);
      _os_log_impl((void *)&_mh_execute_header, v8, v9, "Dumping banner presenter state.", v11, 2u);
    }

    objc_storeStrong(&location, 0LL);
    uint64_t v10 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    id v2 = objc_msgSend(v14[8], "bs_map:", &stru_1001BB770);
    -[NSMutableDictionary setObject:forKeyedSubscript:](v10, "setObject:forKeyedSubscript:");

    id v4 = [v14 topPresentables];
    id v3 = objc_msgSend(v4, "bs_map:", &stru_1001BB7B0);
    -[NSMutableDictionary setObject:forKeyedSubscript:](v10, "setObject:forKeyedSubscript:");

    id v5 = objc_msgSend(v14[5], "bs_map:", &stru_1001BB7D0);
    -[NSMutableDictionary setObject:forKeyedSubscript:](v10, "setObject:forKeyedSubscript:");

    id v6 = objc_msgSend(v14[6], "bs_map:", &stru_1001BB7F0);
    -[NSMutableDictionary setObject:forKeyedSubscript:](v10, "setObject:forKeyedSubscript:");

    id v7 = objc_msgSend(v14[7], "bs_map:", &stru_1001BB810);
    -[NSMutableDictionary setObject:forKeyedSubscript:](v10, "setObject:forKeyedSubscript:");

    id v15 = -[NSMutableDictionary copy](v10, "copy");
    objc_storeStrong((id *)&v10, 0LL);
  }

  else
  {
    id v15 = 0LL;
  }

  return v15;
}

void sub_10011945C(uint64_t a1)
{
  uint64_t v2 = a1;
  if (a1 && *(void *)(v2 + 72))
  {
    id location = BannerPresenterLog();
    if (os_log_type_enabled((os_log_t)location, OS_LOG_TYPE_DEBUG))
    {
      sub_10003EC58((uint64_t)v3, [*(id *)(v2 + 72) isValid] & 1);
      _os_log_debug_impl( (void *)&_mh_execute_header,  (os_log_t)location,  OS_LOG_TYPE_DEBUG,  "Canceling timeout timer. {timerIsValid=%{BOOL}d}",  v3,  8u);
    }

    objc_storeStrong(&location, 0LL);
    [*(id *)(v2 + 72) invalidate];
    objc_storeStrong((id *)(v2 + 72), 0LL);
  }

uint64_t sub_100119674(void *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  unsigned int v4 = [*(id *)(a1[4] + 56) containsObject:location[0]] ^ 1;
  objc_storeStrong(location, 0LL);
  return v4 & 1;
}

uint64_t sub_100119958(void *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  LOBYTE(v4) = 0;
  objc_storeStrong(location, 0LL);
  return v4 & 1;
}

void sub_100119EA0(uint64_t a1, void *a2)
{
  uint64_t v5 = a1;
  id location = 0LL;
  objc_storeStrong(&location, a2);
  if (v5)
  {
    id v2 = sub_10011B5AC(v5, location, 1);
    BOOL v3 = [v2 count] != 0;

    if (location)
    {
      if (!v3) {
        [*(id *)(v5 + 40) addObject:location];
      }
    }
  }

  objc_storeStrong(&location, 0LL);
}

id sub_10011A140(id *a1, void *a2, void *a3, char a4, void *a5)
{
  id v23 = a1;
  id location = 0LL;
  objc_storeStrong(&location, a2);
  id v21 = 0LL;
  objc_storeStrong(&v21, a3);
  char v20 = a4 & 1;
  id v19 = 0LL;
  objc_storeStrong(&v19, a5);
  if (v23)
  {
    id v17 = sub_10011B5AC((uint64_t)v23, location, 0);
    memset(__b, 0, sizeof(__b));
    id v10 = v17;
    id v11 = [v10 countByEnumeratingWithState:__b objects:v25 count:16];
    if (v11)
    {
      uint64_t v7 = *(void *)__b[2];
      uint64_t v8 = 0LL;
      id v9 = v11;
      while (1)
      {
        uint64_t v6 = v8;
        if (*(void *)__b[2] != v7) {
          objc_enumerationMutation(v10);
        }
        uint64_t v16 = *(void **)(__b[1] + 8 * v8);
        sub_10011B6C8(v23, v16, v21, v20 & 1, v19);
        ++v8;
        if (v6 + 1 >= (unint64_t)v9)
        {
          uint64_t v8 = 0LL;
          id v9 = [v10 countByEnumeratingWithState:__b objects:v25 count:16];
          if (!v9) {
            break;
          }
        }
      }
    }

    id v24 = v17;
    int v18 = 1;
    objc_storeStrong(&v17, 0LL);
  }

  else
  {
    id v24 = 0LL;
    int v18 = 1;
  }

  objc_storeStrong(&v19, 0LL);
  objc_storeStrong(&v21, 0LL);
  objc_storeStrong(&location, 0LL);
  return v24;
}

uint64_t sub_10011A59C(uint64_t result, uint64_t a2, uint64_t a3, int a4)
{
  *(_BYTE *)id result = 2;
  *(_BYTE *)(result + 1) = 3;
  *(_BYTE *)(result + 2) = 66;
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

void sub_10011A810(id *a1, void *a2)
{
  int v18 = a1;
  id location = 0LL;
  objc_storeStrong(&location, a2);
  if (v18)
  {
    char v15 = [v18[7] containsObject:location] & 1;
    [v18[6] removeObject:location];
    if ((v15 & 1) != 0)
    {
      os_log_t oslog = (os_log_t)BannerPresenterLog();
      os_log_type_t v9 = OS_LOG_TYPE_DEBUG;
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
      {
        id v2 = oslog;
        os_log_type_t v3 = v9;
        id v4 = (id)BNEffectivePresentableDescription(location);
        id v8 = v4;
        sub_10001AEB8((uint64_t)v19, (uint64_t)v8);
        _os_log_debug_impl( (void *)&_mh_execute_header,  v2,  v3,  "Presentable _would_ appear as banner, but appears to be dismissing. {presentable=%{public}@}",  v19,  0xCu);

        objc_storeStrong(&v8, 0LL);
      }

      objc_storeStrong((id *)&oslog, 0LL);
    }

    else
    {
      id v14 = BannerPresenterLog();
      os_log_type_t v13 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled((os_log_t)v14, OS_LOG_TYPE_DEFAULT))
      {
        log = (os_log_s *)v14;
        os_log_type_t type = v13;
        id v7 = (id)BNEffectivePresentableDescription(location);
        id v12 = v7;
        sub_10001AEB8((uint64_t)v20, (uint64_t)v12);
        _os_log_impl( (void *)&_mh_execute_header,  log,  type,  "Presentable did appear as banner. {presentable=%{public}@}",  v20,  0xCu);

        objc_storeStrong(&v12, 0LL);
      }

      objc_storeStrong(&v14, 0LL);
      id WeakRetained = objc_loadWeakRetained(v18 + 3);
      if ((objc_opt_respondsToSelector(WeakRetained, "presenter:didPresentPresentable:") & 1) != 0) {
        [WeakRetained presenter:v18 didPresentPresentable:location];
      }
      if ((objc_opt_respondsToSelector(location, "presentableDidAppearAsBanner:") & 1) != 0) {
        [location presentableDidAppearAsBanner:location];
      }
      sub_10011ADC8(v18, location);
      objc_storeStrong(&WeakRetained, 0LL);
    }

    int v16 = 0;
  }

  else
  {
    int v16 = 1;
  }

  objc_storeStrong(&location, 0LL);
}

void sub_10011AAD8(id *a1, void *a2, void *a3)
{
  id v21 = a1;
  id location = 0LL;
  objc_storeStrong(&location, a2);
  id v19 = 0LL;
  objc_storeStrong(&v19, a3);
  if (v21)
  {
    char v17 = [v21[6] containsObject:location] & 1;
    [v21[7] removeObject:location];
    if ((v17 & 1) != 0)
    {
      os_log_t oslog = (os_log_t)BannerPresenterLog();
      os_log_type_t v11 = OS_LOG_TYPE_DEBUG;
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
      {
        os_log_type_t v3 = oslog;
        os_log_type_t v4 = v11;
        id v5 = (id)BNEffectivePresentableDescription(location);
        id v10 = v5;
        sub_10001AEB8((uint64_t)v22, (uint64_t)v10);
        _os_log_debug_impl( (void *)&_mh_execute_header,  v3,  v4,  "Presentable _would_ disappear as banner, but appears to be presenting. {presentable=%{public}@}",  v22,  0xCu);

        objc_storeStrong(&v10, 0LL);
      }

      objc_storeStrong((id *)&oslog, 0LL);
    }

    else
    {
      id v16 = BannerPresenterLog();
      os_log_type_t v15 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled((os_log_t)v16, OS_LOG_TYPE_DEFAULT))
      {
        log = (os_log_s *)v16;
        os_log_type_t type = v15;
        id v8 = (id)BNEffectivePresentableDescription(location);
        id v14 = v8;
        sub_10001AEB8((uint64_t)v23, (uint64_t)v14);
        _os_log_impl( (void *)&_mh_execute_header,  log,  type,  "Presentable did disappear as banner. {presentable=%{public}@}",  v23,  0xCu);

        objc_storeStrong(&v14, 0LL);
      }

      objc_storeStrong(&v16, 0LL);
      id WeakRetained = objc_loadWeakRetained(v21 + 3);
      if ((objc_opt_respondsToSelector(WeakRetained, "presenter:didDismissPresentable:") & 1) != 0) {
        [WeakRetained presenter:v21 didDismissPresentable:location];
      }
      if ((objc_opt_respondsToSelector(location, "presentableDidDisappearAsBanner:withReason:") & 1) != 0) {
        [location presentableDidDisappearAsBanner:location withReason:v19];
      }
      sub_10011B0D8(v21, location);
      objc_storeStrong(&WeakRetained, 0LL);
    }

    int v18 = 0;
  }

  else
  {
    int v18 = 1;
  }

  objc_storeStrong(&v19, 0LL);
  objc_storeStrong(&location, 0LL);
}

void sub_10011ADC8(void *a1, void *a2)
{
  id v20 = a1;
  id location = 0LL;
  objc_storeStrong(&location, a2);
  if (v20)
  {
    sub_10011945C((uint64_t)v20);
    double v17 = sub_10011BAEC((uint64_t)v20, location);
    if (v17 > 0.0)
    {
      id v16 = BannerPresenterLog();
      os_log_type_t v15 = OS_LOG_TYPE_INFO;
      if (os_log_type_enabled((os_log_t)v16, OS_LOG_TYPE_INFO))
      {
        id v5 = (id)BNEffectivePresentableDescription(location);
        id v14 = v5;
        sub_1000304AC((uint64_t)v21, (uint64_t)v14, *(uint64_t *)&v17);
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v16,  v15,  "Starting timeout timer for banner. {presentable=%{public}@, timeout=%f}",  v21,  0x16u);

        objc_storeStrong(&v14, 0LL);
      }

      objc_storeStrong(&v16, 0LL);
      objc_initWeak(&from, v20);
      double v4 = v17;
      uint64_t v6 = _NSConcreteStackBlock;
      int v7 = -1073741824;
      int v8 = 0;
      os_log_type_t v9 = sub_10011BD00;
      id v10 = &unk_1001BB730;
      objc_copyWeak(&v12, &from);
      id v11 = location;
      id v2 =  +[NSTimer scheduledTimerWithTimeInterval:repeats:block:]( &OBJC_CLASS___NSTimer,  "scheduledTimerWithTimeInterval:repeats:block:",  0LL,  &v6,  v4);
      os_log_type_t v3 = (void *)*((void *)v20 + 9);
      *((void *)v20 + 9) = v2;

      objc_storeStrong(&v11, 0LL);
      objc_destroyWeak(&v12);
      objc_destroyWeak(&from);
    }

    int v18 = 0;
  }

  else
  {
    int v18 = 1;
  }

  objc_storeStrong(&location, 0LL);
}

void sub_10011B0C8()
{
}

void sub_10011B0D8(id *a1, void *a2)
{
  id v14 = a1;
  id location = 0LL;
  objc_storeStrong(&location, a2);
  if (v14)
  {
    if (location)
    {
      [v14[5] removeObject:location];
      [v14[6] removeObject:location];
      [v14[7] removeObject:location];
      id v3 = v14[8];
      id v5 = _NSConcreteStackBlock;
      int v6 = -1073741824;
      int v7 = 0;
      int v8 = sub_10011BA6C;
      os_log_type_t v9 = &unk_1001BB6E0;
      id v10 = location;
      id v11 = objc_msgSend(v3, "bs_filter:", &v5);
      if ([v11 count])
      {
        os_log_t oslog = (os_log_t)BannerPresenterLog();
        if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
        {
          sub_10001AEB8((uint64_t)v15, (uint64_t)v11);
          _os_log_error_impl( (void *)&_mh_execute_header,  oslog,  OS_LOG_TYPE_ERROR,  "Unexpected transition context still in the stack for a removed presentable. {leftoverTransitionContexts=%{public}@}",  v15,  0xCu);
        }

        objc_storeStrong((id *)&oslog, 0LL);
        [v14[8] removeObjectsInArray:v11];
      }

      if (![v14[5] count] || objc_msgSend(v11, "count"))
      {
        id v2 = [v14 contributorDelegate];
        [v2 stateContributorHasUpdate:v14];
      }

      objc_storeStrong(&v11, 0LL);
      objc_storeStrong(&v10, 0LL);
    }

    int v12 = 0;
  }

  else
  {
    int v12 = 1;
  }

  objc_storeStrong(&location, 0LL);
}

id sub_10011B5AC(uint64_t a1, void *a2, char a3)
{
  uint64_t v16 = a1;
  id location = 0LL;
  objc_storeStrong(&location, a2);
  char v14 = a3 & 1;
  if (v16)
  {
    double v4 = *(void **)(v16 + 40);
    int v6 = _NSConcreteStackBlock;
    int v7 = -1073741824;
    int v8 = 0;
    os_log_type_t v9 = sub_10011B9F8;
    id v10 = &unk_1001BB6B8;
    id v11 = location;
    char v12 = v14 & 1;
    id v17 = objc_msgSend(v4, "bs_filter:", &v6);
    objc_storeStrong(&v11, 0LL);
  }

  else
  {
    id v17 = 0LL;
  }

  int v13 = 1;
  objc_storeStrong(&location, 0LL);
  return v17;
}

void sub_10011B6C8(id *a1, void *a2, void *a3, char a4, void *a5)
{
  char v25 = a1;
  id location = 0LL;
  objc_storeStrong(&location, a2);
  id v23 = 0LL;
  objc_storeStrong(&v23, a3);
  char v22 = a4 & 1;
  id v21 = 0LL;
  objc_storeStrong(&v21, a5);
  if (v25)
  {
    if (location && ([v25[7] containsObject:location] & 1) == 0)
    {
      id v19 = BannerPresenterLog();
      os_log_type_t v18 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled((os_log_t)v19, OS_LOG_TYPE_DEFAULT))
      {
        sub_10011A59C((uint64_t)v26, (uint64_t)location, (uint64_t)v23, v22 & 1);
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v19,  v18,  "Dismiss presentable. {presentable=%{public}@, reason=%{public}@, animated=%{BOOL}d",  v26,  0x1Cu);
      }

      objc_storeStrong(&v19, 0LL);
      [v25[7] addObject:location];
      [v25[6] removeObject:location];
      id WeakRetained = objc_loadWeakRetained(v25 + 3);
      if ((objc_opt_respondsToSelector(WeakRetained, "presenter:willDismissPresentable:") & 1) != 0)
      {
        id v10 = v25;
        id v11 = TVSSBannerPresentable(location);
        objc_msgSend(WeakRetained, "presenter:willDismissPresentable:", v10);
      }

      id v16 = TVSSUIViewControllerBannerPresentable(location);
      int v8 = objc_alloc(&OBJC_CLASS___TVSSMenuModeBannerContext);
      id v6 = v16;
      char v7 = v22;
      unsigned __int8 v5 = [v16 supportsDisplayingAsMenuItem];
      os_log_type_t v15 = -[TVSSMenuModeBannerContext initWithBannerPresentationState:transitioningBannerPresentable:shouldAnimateTransition:supportsInteractiveMode:transitionObserver:dismissalReason:]( v8,  "initWithBannerPresentationState:transitioningBannerPresentable:shouldAnimateTransition:supportsInteractive Mode:transitionObserver:dismissalReason:",  3LL,  v6,  v7 & 1,  v5 & 1,  v25,  v23);
      [v25[8] addObject:v15];
      id v9 = [v25 contributorDelegate];
      [v9 stateContributorHasUpdate:v25];

      objc_storeStrong((id *)&v15, 0LL);
      objc_storeStrong(&v16, 0LL);
      objc_storeStrong(&WeakRetained, 0LL);
      int v20 = 0;
    }

    else
    {
      int v20 = 1;
    }
  }

  else
  {
    int v20 = 1;
  }

  objc_storeStrong(&v21, 0LL);
  objc_storeStrong(&v23, 0LL);
  objc_storeStrong(&location, 0LL);
}

uint64_t sub_10011B9F8(uint64_t a1, void *a2)
{
  location[1] = (id)a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  char v4 = BNIsPresentableIdentifiedByIdentification(location[0], *(void *)(a1 + 32), *(_BYTE *)(a1 + 40) & 1);
  objc_storeStrong(location, 0LL);
  return v4 & 1;
}

BOOL sub_10011BA6C(id *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  id v2 = [location[0] transitioningBannerPresentable];
  BOOL v5 = v2 == a1[4];

  objc_storeStrong(location, 0LL);
  return v5;
}

double sub_10011BAEC(uint64_t a1, void *a2)
{
  uint64_t v12 = a1;
  id location = 0LL;
  objc_storeStrong(&location, a2);
  if (v12)
  {
    id v6 = [location presentableUserInfo];
    id v5 = [v6 objectForKey:TVSPBannerPresentableKeyTimeout];
    uint64_t v2 = objc_opt_class(&OBJC_CLASS___NSNumber);
    id v7 = sub_10011BC40(v5, v2);

    id v8 = v7;
    if (v7)
    {
      [v8 doubleValue];
      double v9 = v3;
    }

    else if ([location hasPrimaryAction])
    {
      double v9 = 10.0;
    }

    else
    {
      double v9 = 6.0;
    }

    double v13 = v9;
    int v10 = 1;
    objc_storeStrong(&v8, 0LL);
  }

  else
  {
    double v13 = 0.0;
    int v10 = 1;
  }

  objc_storeStrong(&location, 0LL);
  return v13;
}

id sub_10011BC40(void *a1, uint64_t a2)
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

void sub_10011BD00(id *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  v23[1] = a1;
  id v8 = &_dispatch_main_q;
  dispatch_assert_queue_V2(v8);

  v23[0] = objc_loadWeakRetained(a1 + 5);
  id v6 = [v23[0] presentedPresentables];
  unsigned __int8 v7 = [v6 containsObject:a1[4]];

  if ((v7 & 1) != 0)
  {
    if ((objc_opt_respondsToSelector(a1[4], "dismissDueTimeoutWhenReadyWithCompletionHandler:") & 1) != 0)
    {
      id v22 = BannerPresenterLog();
      os_log_type_t v21 = OS_LOG_TYPE_INFO;
      if (os_log_type_enabled((os_log_t)v22, OS_LOG_TYPE_INFO))
      {
        id v5 = (id)BNEffectivePresentableDescription(a1[4]);
        id v20 = v5;
        sub_10001AEB8((uint64_t)v26, (uint64_t)v20);
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v22,  v21,  "Timeout timer fired, waiting for presentable to be ready to dismiss. {presentable=%{public}@}",  v26,  0xCu);

        objc_storeStrong(&v20, 0LL);
      }

      objc_storeStrong(&v22, 0LL);
      id v4 = a1[4];
      double v13 = _NSConcreteStackBlock;
      int v14 = -1073741824;
      int v15 = 0;
      id v16 = sub_10011C180;
      id v17 = &unk_1001BB708;
      id v18 = a1[4];
      objc_copyWeak(&v19, a1 + 5);
      [v4 dismissDueTimeoutWhenReadyWithCompletionHandler:&v13];
      objc_destroyWeak(&v19);
      objc_storeStrong(&v18, 0LL);
    }

    else
    {
      id v3 = [v23[0] delegate];
      [v3 presenter:v23[0] requestsDismissPresentable:a1[4] reason:@"TVSSBannerRevocationReasonTimeout" animated:1];
    }
  }

  else
  {
    id v12 = BannerPresenterLog();
    os_log_type_t v11 = OS_LOG_TYPE_DEBUG;
    if (os_log_type_enabled((os_log_t)v12, OS_LOG_TYPE_DEBUG))
    {
      id v2 = (id)BNEffectivePresentableDescription(a1[4]);
      id v10 = v2;
      sub_1000304AC((uint64_t)v25, (uint64_t)v10, (uint64_t)v23[0]);
      _os_log_debug_impl( (void *)&_mh_execute_header,  (os_log_t)v12,  v11,  "Timeout timer fired but presentable isn't presented anymore. {presentable=%{public}@, self=%p}",  v25,  0x16u);

      objc_storeStrong(&v10, 0LL);
    }

    objc_storeStrong(&v12, 0LL);
  }

  objc_storeStrong(v23, 0LL);
  objc_storeStrong(location, 0LL);
}

void sub_10011C170()
{
}

void sub_10011C180(uint64_t a1)
{
  id v9[2] = (id)a1;
  v9[1] = (id)a1;
  v9[0] = BannerPresenterLog();
  char v8 = 1;
  if (os_log_type_enabled((os_log_t)v9[0], OS_LOG_TYPE_INFO))
  {
    log = (os_log_s *)v9[0];
    os_log_type_t type = v8;
    id v4 = (id)BNEffectivePresentableDescription(*(void *)(a1 + 32));
    id v7 = v4;
    sub_10001AEB8((uint64_t)v10, (uint64_t)v7);
    _os_log_impl( (void *)&_mh_execute_header,  log,  type,  "Presentable is ready to dismiss. {presentable=%{public}@}",  v10,  0xCu);

    objc_storeStrong(&v7, 0LL);
  }

  objc_storeStrong(v9, 0LL);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v1 = [WeakRetained delegate];
  [v1 presenter:WeakRetained requestsDismissPresentable:*(void *)(a1 + 32) reason:@"TVSSBannerRevocationReasonTimeout" animated:1];

  objc_storeStrong(&WeakRetained, 0LL);
}

id sub_10011C304(id a1, TVSSMenuModeBannerContext *a2)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  v15[1] = a1;
  v15[0] = [location[0] transitioningBannerPresentable];
  char v12 = 0;
  char v10 = 0;
  char v8 = 0;
  if (v15[0])
  {
    id v13 = [v15[0] requesterIdentifier];
    char v12 = 1;
    id v11 = [v15[0] requestIdentifier];
    char v10 = 1;
    double v9 = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@ - %@", v13, v11);
    char v8 = 1;
    id v2 = v9;
  }

  else
  {
    id v2 = @"null";
  }

  int v14 = v2;
  if ((v8 & 1) != 0) {

  }
  if ((v10 & 1) != 0) {
  if ((v12 & 1) != 0)
  }

  v17[0] = @"object";
  id v6 = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%p", location[0]);
  v18[0] = v6;
  v17[1] = @"presentationState";
  id v4 = TVSSMenuModeBannerPresentationStateDescription((unint64_t)[location[0] bannerPresentationState]);
  v18[1] = v4;
  id v17[2] = @"presentableIdentifier";
  id v18[2] = v14;
  id v5 =  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v18,  v17,  3LL);

  objc_storeStrong((id *)&v14, 0LL);
  objc_storeStrong(v15, 0LL);
  objc_storeStrong(location, 0LL);
  return v5;
}

id sub_10011C5F0(id a1, BNPresentable *a2)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  id v4 = [location[0] requesterIdentifier];
  id v3 = [location[0] requestIdentifier];
  id v5 = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@ - %@", v4, v3);

  objc_storeStrong(location, 0LL);
  return v5;
}

id sub_10011C6C4(id a1, BNPresentable *a2)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  id v4 = [location[0] requesterIdentifier];
  id v3 = [location[0] requestIdentifier];
  id v5 = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@ - %@", v4, v3);

  objc_storeStrong(location, 0LL);
  return v5;
}

id sub_10011C798(id a1, BNPresentable *a2)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  id v4 = [location[0] requesterIdentifier];
  id v3 = [location[0] requestIdentifier];
  id v5 = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@ - %@", v4, v3);

  objc_storeStrong(location, 0LL);
  return v5;
}

id sub_10011C86C(id a1, BNPresentable *a2)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  id v4 = [location[0] requesterIdentifier];
  id v3 = [location[0] requestIdentifier];
  id v5 = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@ - %@", v4, v3);

  objc_storeStrong(location, 0LL);
  return v5;
}

void sub_10011D158( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, int a33, int a34, _Unwind_Exception *exception_object, char a36, uint64_t a37, uint64_t a38, uint64_t a39, id a40)
{
}

id sub_10011D1A4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setContentLayoutMode:", 1, a1, a1);
}

void sub_10011D1D8(uint64_t a1)
{
  id v1 = objc_msgSend(*(id *)(a1 + 32), "tvsp_topMostAncestor");
  [v1 layoutIfNeeded];
}

void sub_10011D224(uint64_t a1)
{
  uint64_t v6 = a1;
  uint64_t v5 = a1;
  id v1 = *(void **)(a1 + 32);
  memcpy(__dst, &CGAffineTransformIdentity, sizeof(__dst));
  [v1 setTransform:__dst];
  [*(id *)(a1 + 32) setAlpha:1.0];
  id v3 = [*(id *)(a1 + 32) superview];
  [v3 layoutIfNeeded];
}

void sub_10011D2C0(id *a1, void *a2)
{
  id location[3] = a1;
  id location[2] = a2;
  location[1] = a1;
  location[0] = objc_loadWeakRetained(a1 + 4);
  if (location[0]) {
    [location[0] satisfyMilestone:@"_TVSSMenuBarHiddenToPassiveAnimationComplete"];
  }
  objc_storeStrong(location, 0LL);
}

void sub_10011DC98(id *a1, void *a2, void *a3)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  id v14 = 0LL;
  objc_storeStrong(&v14, a3);
  v13[1] = a1;
  uint64_t v5 = _NSConcreteStackBlock;
  int v6 = -1073741824;
  int v7 = 0;
  char v8 = sub_10011DDE8;
  double v9 = &unk_1001BB888;
  v13[0] = a1[5];
  id v10 = a1[4];
  id v11 = location[0];
  id v12 = v14;
  BSDispatchMain(&v5);
  objc_storeStrong(&v12, 0LL);
  objc_storeStrong(&v11, 0LL);
  objc_storeStrong(&v10, 0LL);
  objc_storeStrong(v13, 0LL);
  objc_storeStrong(&v14, 0LL);
  objc_storeStrong(location, 0LL);
}

uint64_t sub_10011DDE8(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 56) + 16LL))( *(void *)(a1 + 56),  *(void *)(a1 + 32));
}

void sub_10011E5F8(void *a1, void *a2, void *a3, void *a4)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  id v8 = 0LL;
  objc_storeStrong(&v8, a3);
  id v7 = 0LL;
  objc_storeStrong(&v7, a4);
  [location[0] nowPlayingMediaItem:a1[4] didUpdateWithChangedKeys:a1[5]];
  objc_storeStrong(&v7, 0LL);
  objc_storeStrong(&v8, 0LL);
  objc_storeStrong(location, 0LL);
}

id sub_10011EAF0(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "metadata", a1, a1);
}

void sub_10011FEB8( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, int a12, int a13, _Unwind_Exception *exception_object, char a15, uint64_t a16, uint64_t a17, uint64_t a18, id a19)
{
}

void sub_10011FF04(uint64_t a1, unsigned int a2, id obj)
{
  uint64_t v7 = a1;
  unsigned int v6 = a2;
  id location = 0LL;
  objc_storeStrong(&location, obj);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _handleProgressEvent:v6 info:location];

  objc_storeStrong(&location, 0LL);
}

uint64_t sub_100121FCC(int a1)
{
  unint64_t v2 = (a1 - 8194);
  if (v2 <= 0x22) {
    __asm { BR              X8 }
  }

  return 0LL;
}

void sub_100122354(id a1)
{
  id v1 =  +[NSBundle bundleWithIdentifier:]( &OBJC_CLASS___NSBundle,  "bundleWithIdentifier:",  @"com.apple.BluetoothServicesUI",  a1,  a1);
  unint64_t v2 = (void *)qword_100221E18;
  qword_100221E18 = (uint64_t)v1;
}

void sub_10012297C(id a1, UIView *a2)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  [location[0] setTintColor:0];
  id v2 = [location[0] layer];
  [v2 setCompositingFilter:0];

  objc_storeStrong(location, 0LL);
}

void sub_100122A04(void *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  id v3 = [(id)objc_opt_class(a1[4]) primaryFont];
  objc_msgSend(location[0], "setFont:");

  char v7 = 0;
  char v5 = 0;
  if (a1[5] == 2LL)
  {
    id v8 = +[TVSPConstants defaultDarkModeTextColor](&OBJC_CLASS___TVSPConstants, "defaultDarkModeTextColor");
    char v7 = 1;
    [location[0] setTextColor:v8];
  }

  else
  {
    id v6 = +[TVSPConstants defaultLightModeTextColor](&OBJC_CLASS___TVSPConstants, "defaultLightModeTextColor");
    char v5 = 1;
    [location[0] setTextColor:v6];
  }

  if ((v5 & 1) != 0) {

  }
  if ((v7 & 1) != 0) {
  objc_msgSend(location[0], "setTextAlignment:", 1, location);
  }
  objc_storeStrong(v2, 0LL);
}

void sub_100122B7C(void *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  id v3 = [(id)objc_opt_class(a1[4]) secondaryFont];
  objc_msgSend(location[0], "setFont:");

  char v7 = 0;
  char v5 = 0;
  if (a1[5] == 2LL)
  {
    id v8 =  +[TVSPConstants defaultDarkModeDetailTextColor]( &OBJC_CLASS___TVSPConstants,  "defaultDarkModeDetailTextColor");
    char v7 = 1;
    [location[0] setTextColor:v8];
  }

  else
  {
    id v6 =  +[TVSPConstants defaultLightModeDetailTextColor]( &OBJC_CLASS___TVSPConstants,  "defaultLightModeDetailTextColor");
    char v5 = 1;
    [location[0] setTextColor:v6];
  }

  if ((v5 & 1) != 0) {

  }
  if ((v7 & 1) != 0) {
  objc_msgSend(location[0], "setTextAlignment:", 1, location);
  }
  objc_storeStrong(v2, 0LL);
}

void sub_1001249AC()
{
}

  ;
}

TVSSGameControllerRenderer *sub_100124A08(id *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  v5[1] = a1;
  v5[0] = objc_loadWeakRetained(a1 + 4);
  id v4 = [v5[0] _gameControllerForRendererIdentifier:location[0]];
  if (v4) {
    char v7 =  +[TVSSGameControllerRenderer rendererWithGameController:]( &OBJC_CLASS___TVSSGameControllerRenderer,  "rendererWithGameController:",  v4);
  }
  else {
    char v7 = 0LL;
  }
  objc_storeStrong(&v4, 0LL);
  objc_storeStrong(v5, 0LL);
  objc_storeStrong(location, 0LL);
  return v7;
}

UIMenu *sub_100124F14(uint64_t a1, void *a2)
{
  location[1] = (id)a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  v6[1] = (id)a1;
  v6[0] = [*(id *)(a1 + 32) _unpairActionForGameController:*(void *)(a1 + 40)];
  id v8 = v6[0];
  id v4 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v8, 1LL);
  char v5 = +[UIMenu menuWithChildren:](&OBJC_CLASS___UIMenu, "menuWithChildren:");

  objc_storeStrong(v6, 0LL);
  objc_storeStrong(location, 0LL);
  return v5;
}

void sub_1001252A8(uint64_t a1)
{
  id v2 = +[LSApplicationWorkspace defaultWorkspace](&OBJC_CLASS___LSApplicationWorkspace, "defaultWorkspace");
  objc_msgSend(v2, "openSensitiveURL:withOptions:error:", *(void *)(a1 + 32), 0);
}

id sub_100125EF0(void *a1, uint64_t a2)
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

void sub_100126130( uint64_t a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id *location)
{
  *(void *)(v12 - 4_Block_object_dispose((const void *)(v18 - 72), 8) = a1;
  *(_DWORD *)(v12 - 52) = a2;
  objc_destroyWeak((id *)(v12 - 32));
  _Unwind_Resume(*(_Unwind_Exception **)(v12 - 48));
}

void sub_10012618C(uint64_t a1, void *a2)
{
  location[1] = (id)a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _unpairGameController:*(void *)(a1 + 32)];

  objc_storeStrong(location, 0LL);
}

void sub_10012632C( uint64_t a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *location)
{
  *(void *)(v10 - 40) = a1;
  *(_DWORD *)(v10 - 44) = a2;
  objc_destroyWeak((id *)(v10 - 32));
  _Unwind_Resume(*(_Unwind_Exception **)(v10 - 40));
}

void sub_10012636C(uint64_t a1, void *a2)
{
  location[1] = (id)a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  if (location[0])
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    [WeakRetained _presentAlertWithError:location[0] forGameController:*(void *)(a1 + 32)];
  }

  objc_storeStrong(location, 0LL);
}

void sub_10012651C( uint64_t a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *location)
{
  *(void *)(v10 - 40) = a1;
  *(_DWORD *)(v10 - 44) = a2;
  objc_destroyWeak((id *)(v10 - 32));
  _Unwind_Resume(*(_Unwind_Exception **)(v10 - 40));
}

void sub_10012655C(uint64_t a1, void *a2)
{
  location[1] = (id)a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  if (location[0])
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    [WeakRetained _presentAlertWithError:location[0] forGameController:*(void *)(a1 + 32)];
  }

  objc_storeStrong(location, 0LL);
}

void sub_10012670C( uint64_t a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *location)
{
  *(void *)(v10 - 40) = a1;
  *(_DWORD *)(v10 - 44) = a2;
  objc_destroyWeak((id *)(v10 - 32));
  _Unwind_Resume(*(_Unwind_Exception **)(v10 - 40));
}

void sub_10012674C(uint64_t a1, void *a2)
{
  location[1] = (id)a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  if (location[0])
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    [WeakRetained _presentAlertWithError:location[0] forGameController:*(void *)(a1 + 32)];
  }

  objc_storeStrong(location, 0LL);
}

void sub_100126F78(uint64_t a1, void *a2)
{
  location[1] = (id)a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _unpairGameController:*(void *)(a1 + 32)];

  objc_storeStrong(location, 0LL);
}

void sub_100127258(uint64_t a1)
{
}

void sub_1001272B8(id *a1)
{
  id v7[2] = a1;
  v7[1] = a1;
  id v5 = [a1[4] contentView];
  id v4 = [v5 window];
  v7[0] = [v4 windowScene];

  id v1 = [v7[0] requestEventFocusForReason:@"GameControllerMoreDetails"];
  id v2 = (void **)((char *)a1[4] + 16);
  id v3 = *v2;
  *id v2 = v1;

  objc_storeStrong(v7, 0LL);
}

__CFString *TVSSSensorTypeDescription(uint64_t a1)
{
  switch(a1)
  {
    case 0LL:
      return @"Camera";
    case 1LL:
      return @"Microphone";
    case 2LL:
      id v2 = @"Location";
      break;
  }

  return v2;
}

void sub_1001279E8( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, int a40, int a41, _Unwind_Exception *exception_object, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, char a48, uint64_t a49, uint64_t a50,uint64_t a51,id a52)
{
}

  ;
}

id sub_100127A40(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 1.0, a1, a1);
}

id sub_100127A74(uint64_t a1)
{
  uint64_t v5 = a1;
  uint64_t v4 = a1;
  id v2 = *(void **)(a1 + 32);
  memcpy(__dst, &CGAffineTransformIdentity, sizeof(__dst));
  return [v2 setTransform:__dst];
}

void sub_100127ACC(id *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  v3[1] = a1;
  v3[0] = objc_loadWeakRetained(a1 + 4);
  if (v3[0]) {
    [v3[0] satisfyMilestone:location[0]];
  }
  objc_storeStrong(v3, 0LL);
  objc_storeStrong(location, 0LL);
}

uint64_t sub_100127B50(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

uint64_t sub_100127B90(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

BOOL sub_100128650(double a1, double a2, double a3, double a4)
{
  BOOL v5 = 0;
  if (a1 == a3) {
    return a2 == a4;
  }
  return v5;
}

  ;
}

id sub_100128838(void *a1, uint64_t a2)
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

id sub_1001293A4(uint64_t a1)
{
  return *(id *)(*(void *)(a1 + 32) + 8LL);
}

id sub_10012BB68(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

id sub_10012BCA8(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

id sub_10012CA88(void *a1, void *a2, void *a3)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  id v8 = 0LL;
  objc_storeStrong(&v8, a3);
  v7[1] = a1;
  v7[0] = -[TVSSHeadphonesPanelViewController initWithAudioNowPlayingController:menuModeController:headphonesController:]( objc_alloc(&OBJC_CLASS___TVSSHeadphonesPanelViewController),  "initWithAudioNowPlayingController:menuModeController:headphonesController:",  *(void *)(a1[4] + 40LL),  *(void *)(a1[4] + 48LL),  *(void *)(a1[4] + 56LL));
  id v6 = v7[0];
  objc_storeStrong(v7, 0LL);
  objc_storeStrong(&v8, 0LL);
  objc_storeStrong(location, 0LL);
  return v6;
}

void sub_10012CBEC(id a1)
{
  os_log_t v1 = os_log_create("com.apple.TVSystemUIService.menuItemProvider", "PassiveAudioOutput");
  id v2 = (void *)qword_100221E28;
  qword_100221E28 = (uint64_t)v1;
}

id sub_10012D328(void *a1, uint64_t a2)
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

void sub_10012DEB8(void *a1)
{
  id v7 = a1;
  if (a1)
  {
    os_log_t v1 = objc_alloc(&OBJC_CLASS____TVSSBannerFadeOutBulletinTransaction);
    id v2 = [v7 animationContext];
    id v6 = -[_TVSSMenuBarAbstractAnimationTransaction initWithAnimationContext:animated:]( v1,  "initWithAnimationContext:animated:",  v2,  (unint64_t)[v7 animated] & 1);

    [v7 addChildTransaction:v6];
    id v3 = objc_alloc(&OBJC_CLASS_____TVSSSetMenuBarToHiddenTransaction);
    id v4 = [v7 animationContext];
    BOOL v5 = -[_TVSSMenuBarAbstractAnimationTransaction initWithAnimationContext:animated:]( v3,  "initWithAnimationContext:animated:",  v4,  (unint64_t)[v7 animated] & 1);

    [v7 addChildTransaction:v5 withSchedulingPolicy:1];
    objc_storeStrong((id *)&v5, 0LL);
    objc_storeStrong((id *)&v6, 0LL);
  }

id sub_10012E568(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", *(double *)(a1 + 40), a1, a1);
}

id sub_10012E78C(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0, a1, a1);
}

void sub_10012ECF0( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, id *location, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, int a44, int a45, _Unwind_Exception *exception_object, uint64_t a47, uint64_t a48, uint64_t a49, uint64_t a50,uint64_t a51,id a52)
{
}

id sub_10012ED3C(uint64_t a1)
{
  uint64_t v6 = a1;
  uint64_t v5 = a1;
  id v2 = *(void **)(a1 + 32);
  memcpy(__dst, &CGAffineTransformIdentity, sizeof(__dst));
  [v2 setTransform:__dst];
  return [*(id *)(a1 + 32) setAlpha:1.0];
}

void sub_10012EDAC(id *a1, void *a2)
{
  id location[3] = a1;
  id location[2] = a2;
  location[1] = a1;
  location[0] = objc_loadWeakRetained(a1 + 4);
  if (location[0]) {
    [location[0] satisfyMilestone:@"_TVSSMenuBarPresentPanelAnimationComplete"];
  }
  objc_storeStrong(location, 0LL);
}

void sub_10012F468( uint64_t a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, id *location)
{
  *(void *)(v25 - 184) = a1;
  *(_DWORD *)(v25 - 18_Block_object_dispose((const void *)(v18 - 72), 8) = a2;
  objc_destroyWeak(location);
  objc_destroyWeak((id *)(v25 - 136));
  _Unwind_Resume(*(_Unwind_Exception **)(v25 - 184));
}

id sub_10012F4B4(uint64_t a1)
{
  uint64_t v14 = a1;
  uint64_t v13 = a1;
  CGAffineTransformMakeScale(&v12, 0.5, 0.5);
  double v2 = *(double *)(a1 + 40);
  [*(id *)(a1 + 32) frame];
  CGRect v10 = v15;
  double tx = v2 * CGRectGetWidth(v15) / 2.0;
  [*(id *)(a1 + 32) frame];
  CGRect rect = v16;
  CGFloat ty = -CGRectGetHeight(v16) / 2.0;
  memcpy(&__dst, &v12, sizeof(__dst));
  CGAffineTransformTranslate(&v11, &__dst, tx, ty);
  memcpy(&v12, &v11, sizeof(v12));
  uint64_t v5 = *(void **)(a1 + 32);
  memcpy(v7, &v12, sizeof(v7));
  [v5 setTransform:v7];
  return [*(id *)(a1 + 32) setAlpha:0.0];
}

void sub_10012F618(id *a1, void *a2)
{
  id location[3] = a1;
  id location[2] = a2;
  location[1] = a1;
  location[0] = objc_loadWeakRetained(a1 + 4);
  if (location[0]) {
    [location[0] satisfyMilestone:@"_TVSSMenuBarDismissPanelAnimationComplete"];
  }
  objc_storeStrong(location, 0LL);
}

void sub_100130244(id *a1, uint64_t a2)
{
  id v4 = a1;
  uint64_t v3 = a2;
  location[1] = a1;
  location[0] = objc_loadWeakRetained(a1 + 4);
  if (location[0] && !v3) {
    [location[0] satisfyMilestone:off_100221298];
  }
  objc_storeStrong(location, 0LL);
}

id TVSSBannerPresentable(id obj)
{
  id location = 0LL;
  objc_storeStrong(&location, obj);
  id v2 = location;
  objc_storeStrong(&location, 0LL);
  return v2;
}

id TVSSUIViewControllerBannerPresentable(id obj)
{
  id location = 0LL;
  objc_storeStrong(&location, obj);
  id v3 = (id)UIViewControllerFromPresentable(location);
  id v2 = v3;
  objc_storeStrong(&v3, 0LL);
  objc_storeStrong(&location, 0LL);
  return v2;
}

id TVSSBannerGesturesForTVSPBannerActionTriggerInUserInfo(id obj)
{
  id location = 0LL;
  objc_storeStrong(&location, obj);
  id v8 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  id v4 = [location objectForKeyedSubscript:TVSPBannerPresentableKeyActionTrigger];
  uint64_t v1 = objc_opt_class(&OBJC_CLASS___NSNumber);
  id v5 = sub_100130778(v4, v1);

  id v7 = v5;
  if (v5)
  {
    id v6 = [v7 unsignedIntegerValue];
  }

  id v3 = -[NSMutableSet copy](v8, "copy");
  objc_storeStrong(&v7, 0LL);
  objc_storeStrong((id *)&v8, 0LL);
  objc_storeStrong(&location, 0LL);
  return v3;
}

id sub_100130778(void *a1, uint64_t a2)
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

BOOL sub_100130838(uint64_t a1, uint64_t a2)
{
  return sub_100130FC4(a1, a2) == a2;
}

BOOL TVSSBannerShouldExternalGestureTriggerAction(void *a1, uint64_t a2)
{
  id location = 0LL;
  objc_storeStrong(&location, a1);
  BOOL v4 = 0;
  if ([location isEqual:PBSystemUIServiceGestureTVSingleTap])
  {
    BOOL v4 = sub_100130838(a2, 1LL);
  }

  else if ([location isEqual:PBSystemUIServiceGestureGameControllerHome])
  {
    BOOL v4 = sub_100130838(a2, 2LL);
  }

  objc_storeStrong(&location, 0LL);
  return v4;
}

uint64_t TVSSBannerPresentableIsHighPriority(id obj)
{
  id location = 0LL;
  objc_storeStrong(&location, obj);
  id v12 = [location presentableUserInfo];
  id v8 = [v12 objectForKeyedSubscript:TVSPBannerPresentableKeyBannerType];
  uint64_t v1 = objc_opt_class(&OBJC_CLASS___NSNumber);
  id v9 = sub_100130778(v8, v1);

  id v11 = v9;
  BOOL v10 = 0;
  if (v9) {
    BOOL v10 = [v11 integerValue] == (id)1;
  }
  id v4 = [v12 objectForKeyedSubscript:TVSPBannerPresentableKeyHighPriority];
  uint64_t v2 = objc_opt_class(&OBJC_CLASS___NSNumber);
  id v5 = sub_100130778(v4, v2);

  unsigned __int8 v6 = [v5 BOOLValue];
  char v7 = 0;
  if (v10) {
    char v7 = v6 & 1;
  }
  objc_storeStrong(&v11, 0LL);
  objc_storeStrong(&v12, 0LL);
  objc_storeStrong(&location, 0LL);
  return v7 & 1;
}

BOOL TVSSBannerPresentableSupportsDisplayingAsMenuItem(id obj)
{
  id location = 0LL;
  objc_storeStrong(&location, obj);
  char v7 = TVSSBannerPresentableIsHighPriority(location) & 1;
  id v1 = TVSSBannerPresentableMenuBarShortTitle(location);
  BOOL v4 = v1 != 0LL;

  id v2 = TVSSBannerPresentableTargetProviderIdentifier(location);
  BOOL v5 = v2 != 0LL;

  BOOL v6 = 0;
  if ((v7 & 1) != 0)
  {
    BOOL v6 = 0;
    if (v4) {
      BOOL v6 = v5;
    }
  }

  objc_storeStrong(&location, 0LL);
  return v6;
}

id TVSSBannerPresentableMenuBarShortTitle(id obj)
{
  id location = 0LL;
  objc_storeStrong(&location, obj);
  id v5 = [location presentableUserInfo];
  id v3 = [v5 objectForKeyedSubscript:TVSPBannerPresentableKeyMenuBarShortMessage];
  uint64_t v1 = objc_opt_class(&OBJC_CLASS___NSString);
  id v4 = sub_100130778(v3, v1);

  objc_storeStrong(&v5, 0LL);
  objc_storeStrong(&location, 0LL);
  return v4;
}

id TVSSBannerPresentableTargetProviderIdentifier(id obj)
{
  id location = 0LL;
  objc_storeStrong(&location, obj);
  id v5 = [location presentableUserInfo];
  id v3 = [v5 objectForKeyedSubscript:TVSPBannerPresentableKeyTargetProviderIdentifier];
  uint64_t v1 = objc_opt_class(&OBJC_CLASS___NSString);
  id v4 = sub_100130778(v3, v1);

  objc_storeStrong(&v5, 0LL);
  objc_storeStrong(&location, 0LL);
  return v4;
}

BOOL TVSSBannerPresentableAppearsInsidePillView(id obj)
{
  id location = 0LL;
  objc_storeStrong(&location, obj);
  id v1 = [location pillContentView];
  BOOL v3 = v1 != 0LL;

  objc_storeStrong(&location, 0LL);
  return v3;
}

id TVSSBannerPresentablePanelMessage(id obj)
{
  id location = 0LL;
  objc_storeStrong(&location, obj);
  id v5 = [location presentableUserInfo];
  id v3 = [v5 objectForKeyedSubscript:TVSPBannerPresentableKeyPanelMessage];
  uint64_t v1 = objc_opt_class(&OBJC_CLASS___NSString);
  id v4 = sub_100130778(v3, v1);

  objc_storeStrong(&v5, 0LL);
  objc_storeStrong(&location, 0LL);
  return v4;
}

id TVSSBannerPresentablePanelMessageImageSymbolName(id obj)
{
  id location = 0LL;
  objc_storeStrong(&location, obj);
  id v5 = [location presentableUserInfo];
  id v3 = [v5 objectForKeyedSubscript:TVSPBannerPresentableKeyPanelMessageImageSymbolName];
  uint64_t v1 = objc_opt_class(&OBJC_CLASS___NSString);
  id v4 = sub_100130778(v3, v1);

  objc_storeStrong(&v5, 0LL);
  objc_storeStrong(&location, 0LL);
  return v4;
}

uint64_t sub_100130FC4(uint64_t a1, uint64_t a2)
{
  return a1 & a2;
}

void sub_100131A28(void *a1)
{
  id v7 = a1;
  if (a1)
  {
    uint64_t v1 = objc_alloc(&OBJC_CLASS____TVSSBannerFadeOutBulletinTransaction);
    id v2 = [v7 animationContext];
    BOOL v6 = -[_TVSSMenuBarAbstractAnimationTransaction initWithAnimationContext:animated:]( v1,  "initWithAnimationContext:animated:",  v2,  (unint64_t)[v7 animated] & 1);

    [v7 addChildTransaction:v6];
    id v3 = objc_alloc(&OBJC_CLASS_____TVSSMenuBarSetPrivacyModeTransaction);
    id v4 = [v7 animationContext];
    id v5 = -[_TVSSMenuBarAbstractAnimationTransaction initWithAnimationContext:animated:]( v3,  "initWithAnimationContext:animated:",  v4,  (unint64_t)[v7 animated] & 1);

    [v7 addChildTransaction:v5 withSchedulingPolicy:1];
    objc_storeStrong((id *)&v5, 0LL);
    objc_storeStrong((id *)&v6, 0LL);
  }

unint64_t sub_1001321E4(uint64_t a1)
{
  uint64_t v5 = a1;
  uint64_t v4 = a1;
  uint64_t v1 = *(void *)(a1 + 32);
  v3.receiver = *(id *)(a1 + 40);
  v3.super_class = (Class)&OBJC_CLASS___TVSSSensorActivityAttribution;
  return (unint64_t)objc_msgSendSuper2(&v3, "isEqual:", v1) & 1;
}

id sub_100132238(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "sensorType", a1, a1);
}

unint64_t sub_100132268(uint64_t a1)
{
  return (unint64_t)objc_msgSend(*(id *)(a1 + 32), "usedRecently", a1, a1) & 1;
}

id sub_1001323E4(uint64_t a1)
{
  uint64_t v4 = a1;
  uint64_t v3 = a1;
  v2.receiver = *(id *)(a1 + 32);
  v2.super_class = (Class)&OBJC_CLASS___TVSSSensorActivityAttribution;
  return objc_msgSendSuper2(&v2, "hash");
}

void sub_100132EFC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, _Unwind_Exception *exception_object, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id *location)
{
}

  ;
}

id sub_100132F70(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0, a1, a1);
}

void sub_100132FA4(uint64_t a1)
{
  uint64_t v7 = a1;
  uint64_t v6 = a1;
  uint64_t v3 = *(void **)(a1 + 32);
  CGAffineTransformMakeScale(&v5, 0.8, 0.8);
  [v3 setTransform:&v5];
  if ((objc_opt_respondsToSelector(*(void *)(a1 + 40), "presentableWillDisappearAsBanner:withReason:") & 1) != 0)
  {
    uint64_t v1 = *(void **)(a1 + 40);
    id v2 = [*(id *)(a1 + 48) dismissalReason];
    objc_msgSend(v1, "presentableWillDisappearAsBanner:withReason:", v1);
  }

void sub_100133068(id *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  v3[1] = a1;
  v3[0] = objc_loadWeakRetained(a1 + 4);
  if (v3[0]) {
    [v3[0] satisfyMilestone:location[0]];
  }
  objc_storeStrong(v3, 0LL);
  objc_storeStrong(location, 0LL);
}

uint64_t sub_1001330EC(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

uint64_t sub_10013312C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_10013431C()
{
}

  ;
}

TVSPRenderer *sub_100134378(id *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  v31[1] = a1;
  v31[0] = objc_loadWeakRetained(a1 + 4);
  if ([location[0] isEqualToString:@"CamerasScroller"])
  {
    v34[0] = TVSPOrthogonalRendererOptionItemWidth;
    unsigned __int8 v2 = +[TVSSConstants isScaledUI](&OBJC_CLASS___TVSSConstants, "isScaledUI");
    uint64_t v3 = &off_1001C8DF8;
    if ((v2 & 1) == 0) {
      uint64_t v3 = &off_1001C8E10;
    }
    v35[0] = v3;
    v34[1] = TVSPOrthogonalRendererOptionItemSpacing;
    v35[1] = &off_1001C8E28;
    int v30 =  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v35,  v34,  2LL);
    id v29 = [v31[0] cameraIdentifiers];
    if ((unint64_t)[v29 count] > 1)
    {
      id v20 = [v31[0] cameraIdentifiers];
      id v4 = objc_msgSend(&off_1001C8810, "arrayByAddingObjectsFromArray:");
      id v5 = v29;
      id v29 = v4;
    }

    id v18 = location[0];
    uint64_t v19 = +[TVSPContent contentWithChildIdentifiers:](&OBJC_CLASS___TVSPContent, "contentWithChildIdentifiers:", v29);
    id v33 =  +[TVSPRenderer rendererWithIdentifier:format:content:overrideStylings:optionsDict:]( &OBJC_CLASS___TVSPRenderer,  "rendererWithIdentifier:format:content:overrideStylings:optionsDict:",  v18,  20LL);

    int v28 = 1;
    objc_storeStrong(&v29, 0LL);
    objc_storeStrong((id *)&v30, 0LL);
  }

  else if ([location[0] isEqualToString:@"CameraMosaic"])
  {
    id v17 = [v31[0] orderedCameraItems];
    id v33 = (TVSPRenderer *) +[TVSSHomeKitCameraMosaicRenderer rendererForCameraItems:]( &OBJC_CLASS___TVSSHomeKitCameraMosaicRenderer,  "rendererForCameraItems:");

    int v28 = 1;
  }

  else
  {
    for (char i = 1; (i & 1) != 0; char i = 0)
    {
      id v16 = [v31[0] scenesByIdentifier];
      id v26 = [v16 objectForKeyedSubscript:location[0]];

      char v15 = 0;
      if (v26) {
        char v15 = i;
      }
      if ((v15 & 1) != 0)
      {
        id v33 = (TVSPRenderer *) +[TVSSHomeKitSceneRenderer rendererForScene:]( &OBJC_CLASS___TVSSHomeKitSceneRenderer,  "rendererForScene:",  v26);
        int v28 = 1;
      }

      else
      {
        int v28 = 5;
      }

      objc_storeStrong(&v26, 0LL);
      if (v28 != 5) {
        goto LABEL_30;
      }
    }

    for (char j = 1; (j & 1) != 0; char j = 0)
    {
      id v14 = [v31[0] camerasByIdentifier];
      id v24 = [v14 objectForKeyedSubscript:location[0]];

      char v13 = 0;
      if (v24) {
        char v13 = j;
      }
      if ((v13 & 1) != 0)
      {
        id v23 = v24;
        id v22 =  +[TVSSHomeKitCameraRenderer rendererForCamera:]( &OBJC_CLASS___TVSSHomeKitCameraRenderer,  "rendererForCamera:",  v23);
        id v9 = location[0];
        id v11 = [v31[0] cameraIdentifiers];
        id v10 = [v11 firstObject];
        unsigned __int8 v12 = objc_msgSend(v9, "isEqualToString:");

        if ((v12 & 1) != 0)
        {
          id v8 = [v31[0] cameraIdentifiers];
          BOOL v6 = [v8 count] == (id)1;
          [v22 setShouldStartStreamOnDisplay:v6];
        }

        id v33 = (TVSPRenderer *)v22;
        int v28 = 1;
        objc_storeStrong(&v22, 0LL);
        objc_storeStrong(&v23, 0LL);
      }

      else
      {
        int v28 = 11;
      }

      objc_storeStrong(&v24, 0LL);
      if (v28 != 11) {
        goto LABEL_30;
      }
    }

    id v33 = 0LL;
    int v28 = 1;
  }

LABEL_30:
  objc_storeStrong(v31, 0LL);
  objc_storeStrong(location, 0LL);
  return v33;
}

uint64_t sub_100135E58(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(_BYTE *)id result = 2;
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

void sub_100135EC0(uint64_t a1, void *a2)
{
  location[1] = (id)a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  [*(id *)(a1 + 32) _toggleActionSetWithRenderer:*(void *)(a1 + 40)];
  objc_storeStrong(location, 0LL);
}

void sub_100136244(uint64_t a1, void *a2)
{
  location[1] = (id)a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  v6[1] = (id)a1;
  v6[0] = HomeKitLog();
  if (os_log_type_enabled((os_log_t)v6[0], OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [*(id *)(a1 + 32) actionSetName];
    sub_10000D28C((uint64_t)v8, (uint64_t)v4);
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v6[0],  OS_LOG_TYPE_DEFAULT,  "Successfully executed %@ scene",  v8,  0xCu);
  }

  objc_storeStrong(v6, 0LL);
  [*(id *)(a1 + 40) setLatestError:0];
  unsigned __int8 v2 = *(void **)(a1 + 48);
  id v3 = +[TVSPAnimator immediateAnimator](&OBJC_CLASS___TVSPAnimator, "immediateAnimator");
  objc_msgSend(v2, "reloadContentWithAnimator:");

  objc_storeStrong(location, 0LL);
}

void sub_1001363B0(uint64_t a1, void *a2)
{
  location[1] = (id)a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  v6[1] = (id)a1;
  v6[0] = HomeKitLog();
  if (os_log_type_enabled((os_log_t)v6[0], OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [*(id *)(a1 + 32) actionSetName];
    sub_10000D540((uint64_t)v8, (uint64_t)v4, (uint64_t)location[0]);
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v6[0],  OS_LOG_TYPE_DEFAULT,  "Failed to execute %@ scene with error %@",  v8,  0x16u);
  }

  objc_storeStrong(v6, 0LL);
  [*(id *)(a1 + 40) setLatestError:location[0]];
  unsigned __int8 v2 = *(void **)(a1 + 48);
  id v3 = +[TVSPAnimator immediateAnimator](&OBJC_CLASS___TVSPAnimator, "immediateAnimator");
  objc_msgSend(v2, "reloadContentWithAnimator:");

  objc_storeStrong(location, 0LL);
}

void sub_100136EAC(uint64_t a1)
{
  if (*(void *)(a1 + 40)) {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
  }
  if (*(void *)(*(void *)(a1 + 32) + 64LL))
  {
    [*(id *)(*(void *)(a1 + 32) + 64) invalidate];
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 64LL), 0LL);
  }

void sub_1001370F0(uint64_t a1)
{
  if (*(void *)(a1 + 40)) {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
  }
  uint64_t v1 = *(void **)(a1 + 32);
  id v4 = [v1 focusedRenderer];
  id v3 = [v4 identifier];
  id v2 = objc_msgSend(v1, "rendererHostingViewForIdentifier:");
  [v2 _resetFloatingContentViewForControlState:8];

  id v5 = [*(id *)(a1 + 32) focusedRenderer];
  [v5 _configureCameraViewIfNeeded];

  if (*(void *)(*(void *)(a1 + 32) + 64LL))
  {
    [*(id *)(*(void *)(a1 + 32) + 64) invalidate];
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 64LL), 0LL);
  }

void sub_10013ADD4(id *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  id v2 = [location[0] contentText1];
  BOOL v3 = [v2 length] != 0;

  [a1[4] setActive:v3];
  [a1[5] setActive:!v3];
  objc_storeStrong(location, 0LL);
}

id sub_10013B104(id a1)
{
  BOOL v3 = (dispatch_once_t *)&unk_100221E38;
  id location = 0LL;
  objc_storeStrong(&location, &stru_1001BBFB0);
  if (*v3 != -1) {
    dispatch_once(v3, location);
  }
  objc_storeStrong(&location, 0LL);
  return (id)qword_100221E40;
}

void sub_10013B188(id a1)
{
  v15[0] = HFSymbolIconIdentifierActionSetWakeUp;
  id v14 = +[UIColor systemYellowColor](&OBJC_CLASS___UIColor, "systemYellowColor");
  v16[0] = v14;
  v15[1] = HFSymbolIconIdentifierActionSetSleep;
  id v13 = +[UIColor systemIndigoColor](&OBJC_CLASS___UIColor, "systemIndigoColor");
  v16[1] = v13;
  id v15[2] = HFSymbolIconIdentifierActionSetArrivingHome;
  id v12 = +[UIColor systemOrangeColor](&OBJC_CLASS___UIColor, "systemOrangeColor");
  v16[2] = v12;
  v15[3] = HFSymbolIconIdentifierActionSetLeavingHome;
  id v11 = +[UIColor systemOrangeColor](&OBJC_CLASS___UIColor, "systemOrangeColor");
  id v16[3] = v11;
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
  uint64_t v1 =  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v16,  v15,  12LL);
  id v2 = (void *)qword_100221E40;
  qword_100221E40 = (uint64_t)v1;
}

id sub_10013B54C()
{
  return [objc_allocWithZone(v0) init];
}

void sub_10013B570()
{
  uint64_t v0 = sub_10013C5F8();
  _assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  v0,  v1,  "TVSystemUIService/TVSSSnowglobeUtilities.swift",  46LL);
  __break(1u);
}

uint64_t sub_10013B604(uint64_t a1, uint64_t a2)
{
  v3[17] = a2;
  v3[16] = a1;
  void v3[10] = v3;
  v3[11] = 0LL;
  v3[12] = 0LL;
  v3[13] = 0LL;
  v3[14] = 0LL;
  uint8_t v3[8] = 0LL;
  v3[9] = 0LL;
  v3[15] = 0LL;
  uint64_t v4 = type metadata accessor for TVSnowglobeAppearanceConfiguration();
  v3[18] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[19] = v5;
  v3[20] = swift_task_alloc((*(void *)(v5 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  v3[11] = a1;
  v3[12] = a2;
  v3[13] = v2;
  return swift_task_switch(sub_10013B6E0, 0LL);
}

uint64_t sub_10013B6E0()
{
  *(void *)(v0 + 80) = v0;
  type metadata accessor for TVSnowglobeUtilities(0LL);
  *(void *)(v0 + 16_Block_object_dispose((const void *)(v18 - 72), 8) = static TVSnowglobeUtilities.shared.getter();
  sub_10013BB60();
  v3[22] = v1;
  void *v1 = v3[10];
  v1[1] = sub_10013B798;
  return ((uint64_t (*)(void, void, void, void))v4)(v3[16], v3[20], v3[17], 0LL);
}

uint64_t sub_10013B798(uint64_t a1)
{
  uint64_t v9 = *v1;
  uint64_t v3 = *(void *)(*v1 + 176);
  uint64_t v8 = *(void *)(*v1 + 168);
  uint64_t v6 = *(void *)(*v1 + 160);
  uint64_t v5 = *(void *)(*v1 + 152);
  uint64_t v7 = *(void *)(*v1 + 144);
  *(void *)(v9 + 80) = *v1;
  *(void *)(v9 + 184) = a1;
  swift_task_dealloc(v3);
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v6, v7);
  swift_release(v8);
  return swift_task_switch(sub_10013B848, 0LL);
}

uint64_t sub_10013B848()
{
  uint64_t v1 = *(void *)(v0 + 184);
  *(void *)(v0 + 80) = v0;
  if (!v1)
  {
    id v5 = 0LL;
    uint64_t v6 = 0LL;
    uint64_t v7 = 0LL;
    goto LABEL_5;
  }

  id v10 = (id)*((void *)v16 + 23);
  *((void *)v16 + 14) = v10;
  double v8 = Double.init(_:)(74.0);
  double v9 = Double.init(_:)(74.0);
  v16[8] = v8;
  v16[9] = v9;
  sub_10013C664();
  id v13 = sub_10013BB74(v8, v9);
  id v2 = v10;
  uint64_t v11 = swift_allocObject(&unk_1001BC0D8, 32LL, 7LL);
  *(void *)(v11 + 16) = 0x4052800000000000LL;
  *(void *)(v11 + 24) = v10;
  uint64_t v12 = swift_allocObject(&unk_1001BC100, 32LL, 7LL);
  *(void *)(v12 + 16) = sub_10013C704;
  *(void *)(v12 + 24) = v11;
  swift_retain(v12);
  *((void *)v16 + 6) = sub_10013C738;
  *((void *)v16 + 7) = v12;
  *((void *)v16 + 2) = _NSConcreteStackBlock;
  *((_DWORD *)v16 + 6) = 1107296256;
  *((_DWORD *)v16 + 7) = 0;
  *((void *)v16 + 4) = sub_10013BD70;
  *((void *)v16 + 5) = &unk_1001BC118;
  id v14 = _Block_copy(v16 + 2);
  swift_release(*((void *)v16 + 7));
  id v15 = [v13 imageWithActions:v14];
  _Block_release(v14);
  uint64_t result = swift_isEscapingClosureAtFileLocation( v12,  "/Library/Caches/com.apple.xbs/Sources/PineBoardViewServices_Swift/TVSystemUIService/TVSSSnowglobeUtilities.swift",  112LL,  26LL,  96LL,  1LL);
  if ((result & 1) == 0)
  {
    sub_10013C62C((uint64_t)sub_10013C738, v12);

    *((void *)v16 + 15) = v15;
    id v5 = v15;
    uint64_t v6 = sub_10013C704;
    uint64_t v7 = v11;
LABEL_5:
    uint64_t v4 = *((void *)v16 + 20);
    sub_10013C62C((uint64_t)v6, v7);
    sub_10013C62C(0LL, 0LL);
    swift_task_dealloc(v4);
    return (*(uint64_t (**)(id))(*((void *)v16 + 10) + 8LL))(v5);
  }

  __break(1u);
  return result;
}

uint64_t sub_10013BB60()
{
  return static TVSnowglobeAppearanceConfiguration.defaultConfiguration.getter();
}

id sub_10013BB74(double a1, double a2)
{
  id v2 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  return sub_10013C13C(a1, a2);
}

id sub_10013BBB8(Swift::Double a1, uint64_t a2, void *a3)
{
  double v7 = Double.init(_:)(0.0);
  double v5 = Double.init(_:)(0.0);
  double v6 = Double.init(_:)(a1);
  double v3 = Double.init(_:)(a1);
  id v8 = sub_10013BCE0(v7, v5, v6, v3);
  [v8 addClip];

  double v11 = Double.init(_:)(0.0);
  double v12 = Double.init(_:)(0.0);
  double v13 = Double.init(_:)(a1);
  return objc_msgSend(a3, "drawInRect:", v11, v12, v13, Double.init(_:)(a1));
}

id sub_10013BCE0(double a1, double a2, double a3, double a4)
{
  return objc_msgSend((id)swift_getObjCClassFromMetadata(v4), "bezierPathWithOvalInRect:", a1, a2, a3, a4);
}

uint64_t sub_10013BD50(uint64_t a1, uint64_t (*a2)(void))
{
  return a2();
}

void sub_10013BD70(uint64_t a1, id a2)
{
  double v3 = *(void (**)(id))(a1 + 32);
  id v2 = a2;
  v3(a2);
}

uint64_t sub_10013BE50(void *a1, uint64_t a2, const void *a3, uint64_t a4)
{
  id v4[3] = a1;
  id v4[2] = v4;
  id v5 = a1;
  void v4[4] = _Block_copy(a3);
  uint64_t v13 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a1, &type metadata for String);
  void v4[5] = v13;
  swift_getObjCClassMetadata(a4);
  double v6 = (void *)swift_task_alloc(dword_1002215DC);
  *(void *)(v11 + 4_Block_object_dispose((const void *)(v18 - 72), 8) = v6;
  *double v6 = *(void *)(v11 + 16);
  v6[1] = sub_10013BF10;
  return sub_10013B604(v13, a2);
}

uint64_t sub_10013BF10(void *a1)
{
  uint64_t v8 = *v1;
  uint64_t v2 = *(void *)(*v1 + 48);
  uint64_t v4 = *(void *)(*v1 + 40);
  aBlock = *(void (***)(void *, void *))(*v1 + 32);
  id v5 = *(void **)(*v1 + 24);
  *(void *)(v8 + 16) = *v1;
  swift_task_dealloc(v2);
  swift_bridgeObjectRelease(v4);

  aBlock[2](aBlock, a1);
  _Block_release(aBlock);

  return (*(uint64_t (**)(void))(*(void *)(v8 + 16) + 8LL))();
}

uint64_t sub_10013BFBC(uint64_t a1, uint64_t a2)
{
  uint64_t v17 = a1;
  uint64_t v16 = a2;
  unint64_t v15 = (*(void *)(*(void *)(sub_10013CCA8(&qword_100221658) - 8) + 64LL) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  __chkstk_darwin();
  id v23 = (char *)&v14 - v15;
  uint64_t v2 = type metadata accessor for TaskPriority(0LL);
  (*(void (**)(char *, uint64_t))(*(void *)(v2 - 8) + 56LL))(v23, 1LL);
  uint64_t v18 = 48LL;
  uint64_t v19 = 7LL;
  uint64_t v3 = swift_allocObject(&unk_1001BC1A0, 48LL, 7LL);
  uint64_t v4 = v16;
  id v5 = (void *)v3;
  uint64_t v6 = v17;
  id v22 = v5;
  id v5[2] = 0LL;
  v5[3] = 0LL;
  v5[4] = v6;
  v5[5] = v4;
  uint64_t v20 = v5[2];
  uint64_t v21 = v5[3];
  swift_unknownObjectRetain();
  uint64_t v7 = swift_allocObject(&unk_1001BC1C8, v18, v19);
  uint64_t v8 = v21;
  double v9 = v22;
  id v10 = (void *)v7;
  uint64_t v11 = (uint64_t)v23;
  id v10[2] = v20;
  v10[3] = v8;
  v10[4] = &unk_100221668;
  v10[5] = v9;
  uint64_t v12 = sub_10013D18C(v11, (uint64_t)&unk_100221678, (uint64_t)v10);
  return swift_release(v12);
}

id sub_10013C0F4()
{
  uint64_t v3 = v0;
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for TVSSSnowglobeUtilities();
  return objc_msgSendSuper2(&v2, "dealloc");
}

id sub_10013C13C(double a1, double a2)
{
  return objc_msgSend(v2, "initWithSize:", a1, a2, *(void *)&a1, *(void *)&a2);
}

uint64_t sub_10013C178(uint64_t a1)
{
  unint64_t v3 = sub_10013CBD0();
  unint64_t v1 = sub_10013CC40();
  return OptionSet<>.init()(a1, v3, v1);
}

uint64_t sub_10013C1B8(uint64_t a1, uint64_t a2)
{
  unint64_t v2 = sub_10013CBD0();
  return OptionSet<>.contains(_:)(a1, a2, v2) & 1;
}

uint64_t sub_10013C1F0(uint64_t a1, uint64_t a2)
{
  unint64_t v2 = sub_10013CBD0();
  return OptionSet.union(_:)(a1, a2, v2);
}

uint64_t sub_10013C22C(uint64_t a1, uint64_t a2)
{
  unint64_t v2 = sub_10013CBD0();
  return OptionSet.intersection(_:)(a1, a2, v2);
}

uint64_t sub_10013C268(uint64_t a1, uint64_t a2)
{
  unint64_t v2 = sub_10013CBD0();
  return OptionSet.symmetricDifference(_:)(a1, a2, v2);
}

uint64_t sub_10013C2A4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v3 = sub_10013CBD0();
  return OptionSet<>.insert(_:)(a1, a2, a3, v3) & 1;
}

uint64_t sub_10013C2E4(uint64_t a1, uint64_t a2)
{
  unint64_t v2 = sub_10013CBD0();
  return OptionSet<>.remove(_:)(a1, a2, v2);
}

uint64_t sub_10013C320(uint64_t a1, uint64_t a2)
{
  unint64_t v2 = sub_10013CBD0();
  return OptionSet<>.update(with:)(a1, a2, v2);
}

uint64_t sub_10013C35C(uint64_t a1, uint64_t a2)
{
  unint64_t v5 = sub_10013CBD0();
  unint64_t v2 = sub_10013CC40();
  return OptionSet<>.formUnion(_:)(a1, a2, v5, v2);
}

uint64_t sub_10013C39C(uint64_t a1, uint64_t a2)
{
  unint64_t v5 = sub_10013CBD0();
  unint64_t v2 = sub_10013CC40();
  return OptionSet<>.formIntersection(_:)(a1, a2, v5, v2);
}

uint64_t sub_10013C3DC(uint64_t a1, uint64_t a2)
{
  unint64_t v5 = sub_10013CBD0();
  unint64_t v2 = sub_10013CC40();
  return OptionSet<>.formSymmetricDifference(_:)(a1, a2, v5, v2);
}

uint64_t sub_10013C41C()
{
  return SetAlgebra.subtracting(_:)();
}

uint64_t sub_10013C430()
{
  return SetAlgebra.isSubset(of:)() & 1;
}

uint64_t sub_10013C448()
{
  return SetAlgebra.isDisjoint(with:)() & 1;
}

uint64_t sub_10013C460()
{
  return SetAlgebra.isSuperset(of:)() & 1;
}

uint64_t sub_10013C478()
{
  return SetAlgebra.isEmpty.getter() & 1;
}

uint64_t sub_10013C490(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return SetAlgebra.init<A>(_:)(a1, a4, a2, a5, a3);
}

uint64_t sub_10013C4C8()
{
  return SetAlgebra.subtract(_:)();
}

uint64_t sub_10013C4DC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v3 = sub_10013C9D4();
  return == infix<A>(_:_:)(a1, a2, a3, v3, &protocol witness table for UInt) & 1;
}

uint64_t sub_10013C524(uint64_t a1, uint64_t a2)
{
  unint64_t v2 = sub_10013CA58();
  return SetAlgebra<>.init(arrayLiteral:)(a1, a2, v2);
}

uint64_t sub_10013C560@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = nullsub_1(*a1);
  *a2 = result;
  return result;
}

uint64_t sub_10013C58C@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result = nullsub_1(*a1);
  *(void *)a2 = result;
  *(_BYTE *)(a2 + _Block_object_dispose((const void *)(v18 - 72), 8) = 0;
  return result;
}

uint64_t sub_10013C5C8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = nullsub_2(*v1);
  *a1 = result;
  return result;
}

uint64_t sub_10013C5F8()
{
  return 0LL;
}

uint64_t sub_10013C62C(uint64_t result, uint64_t a2)
{
  if (result) {
    return swift_release(a2);
  }
  return result;
}

unint64_t sub_10013C664()
{
  uint64_t v3 = qword_1002215E0;
  if (!qword_1002215E0)
  {
    uint64_t v0 = objc_opt_self(&OBJC_CLASS___UIGraphicsImageRenderer);
    unint64_t ObjCClassMetadata = swift_getObjCClassMetadata(v0);
    atomic_store(ObjCClassMetadata, (unint64_t *)&qword_1002215E0);
    return ObjCClassMetadata;
  }

  return v3;
}

uint64_t sub_10013C6C8()
{
  return swift_deallocObject(v2, 32LL, 7LL);
}

id sub_10013C704(uint64_t a1)
{
  return sub_10013BBB8(*(Swift::Double *)(v1 + 16), a1, *(void **)(v1 + 24));
}

uint64_t sub_10013C710()
{
  return swift_deallocObject(v0, 32LL, 7LL);
}

uint64_t sub_10013C738(uint64_t a1)
{
  return sub_10013BD50(a1, *(uint64_t (**)(void))(v1 + 16));
}

uint64_t sub_10013C744(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 32);
  uint64_t v5 = *(void *)(a2 + 40);
  swift_retain();
  uint64_t result = a1;
  *(void *)(a1 + 32) = v4;
  *(void *)(a1 + 40) = v5;
  return result;
}

uint64_t sub_10013C788(uint64_t a1)
{
  return swift_release(*(void *)(a1 + 40));
}

uint64_t sub_10013C7A0()
{
  _Block_release(*(const void **)(v0 + 32));
  return swift_deallocObject(v2, 48LL);
}

uint64_t sub_10013C7E4()
{
  *(void *)(v1 + 16) = v1;
  uint64_t v7 = (void *)v0[2];
  uint64_t v4 = v0[3];
  uint64_t v5 = (const void *)v0[4];
  uint64_t v6 = v0[5];
  uint64_t v2 = (void *)swift_task_alloc(dword_1002215EC);
  *(void *)(v1 + 24) = v2;
  *uint64_t v2 = *(void *)(v1 + 16);
  v2[1] = sub_10013C89C;
  return ((uint64_t (*)(void *, uint64_t, const void *, uint64_t))((char *)&dword_1002215E8 + dword_1002215E8))( v7,  v4,  v5,  v6);
}

uint64_t sub_10013C89C()
{
  uint64_t v3 = *v0;
  uint64_t v1 = *(void *)(*v0 + 24);
  *(void *)(*v0 + 16) = *v0;
  swift_task_dealloc(v1);
  return (*(uint64_t (**)(void))(*(void *)(v3 + 16) + 8LL))();
}

uint64_t type metadata accessor for TVSSSnowglobeUtilities()
{
  return objc_opt_self(&OBJC_CLASS___TVSSSnowglobeUtilities);
}

uint64_t type metadata accessor for UIPopoverArrowDirection(uint64_t a1)
{
  uint64_t v5 = qword_100221620;
  if (!qword_100221620)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata(a1, &unk_1001BC178);
    uint64_t v5 = ForeignTypeMetadata;
    if (!v1)
    {
      unint64_t v2 = ForeignTypeMetadata;
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_100221620);
      return v2;
    }
  }

  return v5;
}

unint64_t sub_10013C9C0()
{
  return sub_10013C9D4();
}

unint64_t sub_10013C9D4()
{
  uint64_t v3 = qword_100221628;
  if (!qword_100221628)
  {
    uint64_t v0 = type metadata accessor for UIPopoverArrowDirection(255LL);
    unint64_t WitnessTable = swift_getWitnessTable(&unk_10016C0F4, v0);
    atomic_store(WitnessTable, (unint64_t *)&qword_100221628);
    return WitnessTable;
  }

  return v3;
}

unint64_t sub_10013CA44()
{
  return sub_10013CA58();
}

unint64_t sub_10013CA58()
{
  uint64_t v3 = qword_100221630;
  if (!qword_100221630)
  {
    uint64_t v0 = type metadata accessor for UIPopoverArrowDirection(255LL);
    unint64_t WitnessTable = swift_getWitnessTable(&unk_10016C16C, v0);
    atomic_store(WitnessTable, (unint64_t *)&qword_100221630);
    return WitnessTable;
  }

  return v3;
}

unint64_t sub_10013CAC8()
{
  return sub_10013CADC();
}

unint64_t sub_10013CADC()
{
  uint64_t v3 = qword_100221638;
  if (!qword_100221638)
  {
    uint64_t v0 = type metadata accessor for UIPopoverArrowDirection(255LL);
    unint64_t WitnessTable = swift_getWitnessTable(&unk_10016C0C8, v0);
    atomic_store(WitnessTable, (unint64_t *)&qword_100221638);
    return WitnessTable;
  }

  return v3;
}

unint64_t sub_10013CB4C()
{
  return sub_10013CB60();
}

unint64_t sub_10013CB60()
{
  uint64_t v3 = qword_100221640;
  if (!qword_100221640)
  {
    uint64_t v0 = type metadata accessor for UIPopoverArrowDirection(255LL);
    unint64_t WitnessTable = swift_getWitnessTable(&unk_10016C094, v0);
    atomic_store(WitnessTable, (unint64_t *)&qword_100221640);
    return WitnessTable;
  }

  return v3;
}

unint64_t sub_10013CBD0()
{
  uint64_t v3 = qword_100221648;
  if (!qword_100221648)
  {
    uint64_t v0 = type metadata accessor for UIPopoverArrowDirection(255LL);
    unint64_t WitnessTable = swift_getWitnessTable(&unk_10016C130, v0);
    atomic_store(WitnessTable, (unint64_t *)&qword_100221648);
    return WitnessTable;
  }

  return v3;
}

unint64_t sub_10013CC40()
{
  uint64_t v2 = qword_100221650;
  if (!qword_100221650)
  {
    unint64_t v0 = ((uint64_t (*)(void *, void *))swift_getWitnessTable)( &protocol conformance descriptor for UInt,  &type metadata for UInt);
    atomic_store(v0, (unint64_t *)&qword_100221650);
    return v0;
  }

  return v2;
}

uint64_t sub_10013CCA8(uint64_t *a1)
{
  uint64_t v4 = *a1;
  if (*a1 < 0)
  {
    uint64_t TypeByMangledNameInContext2 = swift_getTypeByMangledNameInContext2((char *)a1 + (int)*a1, -(*a1 >> 32), 0LL);
    *a1 = TypeByMangledNameInContext2;
    return TypeByMangledNameInContext2;
  }

  return v4;
}

uint64_t sub_10013CD14(uint64_t a1, uint64_t a2, int *a3)
{
  *(void *)(v3 + 16) = v3;
  uint64_t v6 = (uint64_t (*)(void))((char *)a3 + *a3);
  uint64_t v4 = (void *)swift_task_alloc(a3[1]);
  *(void *)(v3 + 24) = v4;
  *uint64_t v4 = *(void *)(v3 + 16);
  v4[1] = sub_10013CD90;
  return v6();
}

uint64_t sub_10013CD90()
{
  uint64_t v3 = *v0;
  uint64_t v1 = *(void *)(*v0 + 24);
  *(void *)(*v0 + 16) = *v0;
  swift_task_dealloc(v1);
  return (*(uint64_t (**)(void))(*(void *)(v3 + 16) + 8LL))();
}

uint64_t sub_10013CDF0()
{
  return swift_deallocObject(v2, 48LL);
}

uint64_t sub_10013CE34()
{
  *(void *)(v1 + 16) = v1;
  uint64_t v6 = v0[2];
  uint64_t v4 = v0[3];
  uint64_t v5 = (int *)v0[4];
  uint64_t v2 = (void *)swift_task_alloc(dword_100221664);
  *(void *)(v1 + 24) = v2;
  *uint64_t v2 = *(void *)(v1 + 16);
  v2[1] = sub_10013CEEC;
  return ((uint64_t (*)(uint64_t, uint64_t, int *))((char *)&dword_100221660 + dword_100221660))(v6, v4, v5);
}

uint64_t sub_10013CEEC()
{
  uint64_t v3 = *v0;
  uint64_t v1 = *(void *)(*v0 + 24);
  *(void *)(*v0 + 16) = *v0;
  swift_task_dealloc(v1);
  return (*(uint64_t (**)(void))(*(void *)(v3 + 16) + 8LL))();
}

uint64_t sub_10013CF4C(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  *(void *)(v4 + 16) = v4;
  uint64_t v7 = (uint64_t (*)(void))((char *)a4 + *a4);
  uint64_t v5 = (void *)swift_task_alloc(a4[1]);
  *(void *)(v4 + 24) = v5;
  *uint64_t v5 = *(void *)(v4 + 16);
  v5[1] = sub_10013CFC8;
  return v7();
}

uint64_t sub_10013CFC8()
{
  uint64_t v3 = *v0;
  uint64_t v1 = *(void *)(*v0 + 24);
  *(void *)(*v0 + 16) = *v0;
  swift_task_dealloc(v1);
  return (*(uint64_t (**)(void))(*(void *)(v3 + 16) + 8LL))();
}

uint64_t sub_10013D028()
{
  return swift_deallocObject(v2, 48LL);
}

uint64_t sub_10013D06C(uint64_t a1)
{
  *(void *)(v2 + 16) = v2;
  uint64_t v5 = v1[2];
  uint64_t v6 = v1[3];
  uint64_t v7 = (int *)v1[4];
  uint64_t v3 = (void *)swift_task_alloc(dword_100221674);
  *(void *)(v2 + 24) = v3;
  void *v3 = *(void *)(v2 + 16);
  v3[1] = sub_10013D12C;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, int *))((char *)&dword_100221670 + dword_100221670))( a1,  v5,  v6,  v7);
}

uint64_t sub_10013D12C()
{
  uint64_t v3 = *v0;
  uint64_t v1 = *(void *)(*v0 + 24);
  *(void *)(*v0 + 16) = *v0;
  swift_task_dealloc(v1);
  return (*(uint64_t (**)(void))(*(void *)(v3 + 16) + 8LL))();
}

uint64_t sub_10013D18C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v19 = type metadata accessor for TaskPriority(0LL);
  uint64_t v20 = *(void *)(v19 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t))(v20 + 48))(a1, 1LL) == 1)
  {
    sub_10013D3AC(a1);
    uint64_t v15 = 0LL;
  }

  else
  {
    unsigned __int8 v14 = TaskPriority.rawValue.getter();
    (*(void (**)(uint64_t, uint64_t))(v20 + 8))(a1, v19);
    uint64_t v15 = v14;
  }

  uint64_t v13 = *(void *)(a3 + 16);
  uint64_t v12 = *(void *)(a3 + 24);
  swift_unknownObjectRetain();
  if (v13)
  {
    uint64_t ObjectType = swift_getObjectType(v13);
    uint64_t v8 = dispatch thunk of Actor.unownedExecutor.getter(ObjectType, v12);
    uint64_t v9 = v4;
    swift_unknownObjectRelease(v13);
    uint64_t v10 = v8;
    uint64_t v11 = v9;
  }

  else
  {
    uint64_t v10 = 0LL;
    uint64_t v11 = 0LL;
  }

  uint64_t v6 = swift_allocObject(&unk_1001BC1F0, 32LL, 7LL);
  *(void *)(v6 + 16) = a2;
  *(void *)(v6 + 24) = a3;
  uint64_t v7 = 0LL;
  if (v10 != 0 || v11 != 0)
  {
    v21[0] = 0LL;
    v21[1] = 0LL;
    id v21[2] = v10;
    id v21[3] = v11;
    uint64_t v7 = v21;
  }

  return swift_task_create(v15 | 0x1C00, v7, (char *)&type metadata for () + 8, &unk_100221688, v6);
}

uint64_t sub_10013D3AC(uint64_t a1)
{
  uint64_t v3 = type metadata accessor for TaskPriority(0LL);
  uint64_t v4 = *(void *)(v3 - 8);
  return a1;
}

uint64_t sub_10013D41C(uint64_t a1, int *a2)
{
  *(void *)(v2 + 16) = v2;
  uint64_t v5 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v3 = (void *)swift_task_alloc(a2[1]);
  *(void *)(v2 + 24) = v3;
  void *v3 = *(void *)(v2 + 16);
  v3[1] = sub_10013D4A0;
  return v5(a1);
}

uint64_t sub_10013D4A0()
{
  uint64_t v3 = *v0;
  uint64_t v1 = *(void *)(*v0 + 24);
  *(void *)(*v0 + 16) = *v0;
  swift_task_dealloc(v1);
  return (*(uint64_t (**)(void))(*(void *)(v3 + 16) + 8LL))();
}

uint64_t sub_10013D504()
{
  return swift_deallocObject(v2, 32LL);
}

uint64_t sub_10013D540(uint64_t a1)
{
  *(void *)(v2 + 16) = v2;
  uint64_t v5 = *(int **)(v1 + 16);
  uint64_t v3 = (void *)swift_task_alloc(dword_100221684);
  *(void *)(v2 + 24) = v3;
  void *v3 = *(void *)(v2 + 16);
  v3[1] = sub_10013D5E8;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_100221680 + dword_100221680))(a1, v5);
}

uint64_t sub_10013D5E8()
{
  uint64_t v3 = *v0;
  uint64_t v1 = *(void *)(*v0 + 24);
  *(void *)(*v0 + 16) = *v0;
  swift_task_dealloc(v1);
  return (*(uint64_t (**)(void))(*(void *)(v3 + 16) + 8LL))();
}

unint64_t sub_10013D648()
{
  uint64_t v3 = qword_100221690;
  if (!qword_100221690)
  {
    uint64_t v0 = objc_opt_self(&OBJC_CLASS___UIBezierPath);
    unint64_t ObjCClassMetadata = swift_getObjCClassMetadata(v0);
    atomic_store(ObjCClassMetadata, (unint64_t *)&qword_100221690);
    return ObjCClassMetadata;
  }

  return v3;
}

uint64_t sub_10013D6AC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v5[17] = a4;
  v5[16] = a3;
  uint8_t v5[15] = a2;
  v5[14] = a1;
  v5[10] = v5;
  v5[6] = 0LL;
  uint8_t v5[7] = 0LL;
  v5[8] = 0LL;
  v5[9] = 0LL;
  v5[11] = 0LL;
  v5[12] = 0LL;
  uint64_t v6 = type metadata accessor for Logger();
  v5[18] = v6;
  uint64_t v7 = *(void *)(v6 - 8);
  v5[19] = v7;
  v5[20] = swift_task_alloc((*(void *)(v7 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v8 = type metadata accessor for AppIntentTargetDescriptor(0LL);
  v5[21] = v8;
  uint64_t v9 = *(void *)(v8 - 8);
  v5[22] = v9;
  v5[23] = swift_task_alloc((*(void *)(v9 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v10 = type metadata accessor for StringSearchCriteria(0LL);
  uint8_t v5[24] = swift_task_alloc((*(void *)(*(void *)(v10 - 8) + 64LL) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v11 = type metadata accessor for ShowInAppStringSearchResultsIntentPrototype(0LL);
  v5[25] = v11;
  uint64_t v12 = *(void *)(v11 - 8);
  v5[26] = v12;
  v5[27] = swift_task_alloc((*(void *)(v12 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  v5[6] = a1;
  uint8_t v5[7] = a2;
  v5[8] = a3;
  v5[9] = a4;
  v5[11] = v4;
  return swift_task_switch(sub_10013D830, 0LL);
}

uint64_t sub_10013D830()
{
  uint64_t v7 = v0[24];
  uint64_t v1 = v0[17];
  uint64_t v6 = v1;
  uint64_t v5 = v0[16];
  uint64_t v9 = v0[15];
  uint64_t v8 = v0[14];
  v0[10] = v0;
  swift_bridgeObjectRetain(v1);
  StringSearchCriteria.init(term:)(v5, v6);
  ShowInAppStringSearchResultsIntentPrototype.init(criteria:)(v7);
  swift_bridgeObjectRetain(v9);
  AppIntentTargetDescriptor.init(bundleIdentifier:)(v8, v9);
  uint64_t v2 = (void *)swift_task_alloc(async function pointer to AppIntentPrototype.perform(targetDescriptor:)[1]);
  v10[28] = v2;
  unint64_t v3 = sub_10013E0FC();
  *uint64_t v2 = v10[10];
  v2[1] = sub_10013D930;
  return AppIntentPrototype.perform(targetDescriptor:)(v10 + 2, v10[23], v10[25], v3);
}

uint64_t sub_10013D930()
{
  uint64_t v2 = *v1;
  uint64_t v3 = *(void *)(*v1 + 224);
  *(void *)(v2 + 80) = *v1;
  v2 += 80LL;
  uint64_t v5 = (void *)(v2 - 64);
  *(void *)(v2 + 152) = v0;
  swift_task_dealloc(v3);
  if (v0) {
    return swift_task_switch(sub_10013DAAC, 0LL);
  }
  (*(void (**)(void, void))(v5[20] + 8LL))(v5[21], v5[19]);
  return swift_task_switch(sub_10013D9F4, 0LL);
}

uint64_t sub_10013D9F4()
{
  v0[10] = v0;
  sub_10013F820(v0 + 2);
  uint64_t v2 = v0[27];
  uint64_t v3 = v0[24];
  uint64_t v4 = v0[23];
  uint64_t v5 = v0[20];
  (*(void (**)(void))(v0[26] + 8LL))();
  swift_task_dealloc(v2);
  swift_task_dealloc(v3);
  swift_task_dealloc(v4);
  swift_task_dealloc(v5);
  return (*(uint64_t (**)(void))(v0[10] + 8LL))();
}

uint64_t sub_10013DAAC()
{
  uint64_t v20 = *(void *)(v0 + 232);
  uint64_t v1 = *(void *)(v0 + 184);
  uint64_t v2 = *(void *)(v0 + 176);
  uint64_t v3 = *(void *)(v0 + 168);
  *(void *)(v0 + 80) = v0;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  uint64_t v4 = swift_errorRetain(v20);
  *(void *)(v0 + 96) = v20;
  Logger.init()(v4);
  swift_errorRetain(v20);
  uint64_t v24 = swift_allocObject(&unk_1001BC330, 24LL, 7LL);
  *(void *)(v24 + 16) = v20;
  id v31 = (os_log_s *)Logger.logObject.getter();
  os_log_type_t v32 = static os_log_type_t.error.getter();
  *(void *)(v0 + 104) = 12LL;
  unint64_t v21 = sub_10013E5DC();
  unint64_t v22 = sub_10013E644();
  unint64_t v5 = sub_10013E6AC();
  UnsignedInteger<>.init<A>(_:)(v0 + 104, &type metadata for UInt32, &type metadata for Int, v21, v22, v5);
  uint32_t v23 = *(_DWORD *)(v0 + 240);
  uint64_t v26 = swift_allocObject(&unk_1001BC358, 17LL, 7LL);
  *(_BYTE *)(v26 + 16) = 32;
  uint64_t v27 = swift_allocObject(&unk_1001BC380, 17LL, 7LL);
  *(_BYTE *)(v27 + 16) = 8;
  uint64_t v25 = swift_allocObject(&unk_1001BC3A8, 32LL, 7LL);
  *(void *)(v25 + 16) = sub_10013E1F0;
  *(void *)(v25 + 24) = v24;
  uint64_t v29 = swift_allocObject(&unk_1001BC3D0, 32LL, 7LL);
  *(void *)(v29 + 16) = sub_10013F7CC;
  *(void *)(v29 + 24) = v25;
  sub_10013CCA8(&qword_1002216C0);
  uint64_t v28 = _allocateUninitializedArray<A>(_:)(3LL);
  int v30 = v6;
  swift_retain(v26);
  void *v30 = sub_10013F758;
  v30[1] = v26;
  swift_retain(v27);
  v30[2] = sub_10013F788;
  id v30[3] = v27;
  swift_retain(v29);
  v30[4] = sub_10013F814;
  v30[5] = v29;
  sub_10013E59C();
  swift_bridgeObjectRelease(v28);
  if (os_log_type_enabled(v31, v32))
  {
    buf = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)(12LL, &type metadata for UInt8);
    uint64_t v15 = sub_10013CCA8(&qword_1002216C8);
    uint64_t v17 = sub_10013E714(0LL, v15, v15);
    uint64_t v18 = sub_10013E714(1LL, (uint64_t)&type metadata for Any + 8, (uint64_t)&type metadata for Any + 8);
    id v33 = buf;
    uint64_t v34 = v17;
    uint64_t v35 = v18;
    sub_10013E76C(2LL, &v33);
    sub_10013E76C(1LL, &v33);
    double v36 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_10013F758;
    uint64_t v37 = v26;
    sub_10013E780(&v36, (uint64_t)&v33, (uint64_t)&v34, (uint64_t)&v35);
    double v36 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_10013F788;
    uint64_t v37 = v27;
    sub_10013E780(&v36, (uint64_t)&v33, (uint64_t)&v34, (uint64_t)&v35);
    double v36 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_10013F814;
    uint64_t v37 = v29;
    sub_10013E780(&v36, (uint64_t)&v33, (uint64_t)&v34, (uint64_t)&v35);
    _os_log_impl((void *)&_mh_execute_header, v31, v32, "%s", buf, v23);
    sub_10013E7C4(v17, 0LL);
    sub_10013E7C4(v18, 1LL);
    UnsafeMutablePointer.deallocate()();
    swift_release(v26);
    swift_release(v27);
    swift_release(v29);
  }

  else
  {
    swift_release(v26);
    swift_release(v27);
    swift_release(v29);
  }

  uint64_t v9 = v19[20];
  uint64_t v8 = v19[19];
  uint64_t v10 = v19[18];

  (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v9, v10);
  swift_errorRelease();
  swift_errorRelease();
  uint64_t v11 = v19[27];
  uint64_t v12 = v19[24];
  uint64_t v13 = v19[23];
  uint64_t v14 = v19[20];
  (*(void (**)(void))(v19[26] + 8LL))();
  swift_task_dealloc(v11);
  swift_task_dealloc(v12);
  swift_task_dealloc(v13);
  swift_task_dealloc(v14);
  return (*(uint64_t (**)(void))(v19[10] + 8LL))();
}

unint64_t sub_10013E0FC()
{
  uint64_t v3 = qword_1002216A0;
  if (!qword_1002216A0)
  {
    uint64_t v0 = type metadata accessor for ShowInAppStringSearchResultsIntentPrototype(255LL);
    unint64_t WitnessTable = swift_getWitnessTable( &protocol conformance descriptor for ShowInAppStringSearchResultsIntentPrototype,  v0);
    atomic_store(WitnessTable, (unint64_t *)&qword_1002216A0);
    return WitnessTable;
  }

  return v3;
}

uint64_t sub_10013E16C(uint64_t a1)
{
  uint64_t v4 = a1;
  uint64_t v1 = sub_10013CCA8(&qword_100221710);
  return String.init<A>(describing:)(&v4, v1);
}

uint64_t sub_10013E1B4()
{
  return swift_deallocObject(v2, 24LL);
}

uint64_t sub_10013E1F0()
{
  return sub_10013E16C(*(void *)(v0 + 16));
}

uint64_t sub_10013E298(void *a1, void *a2, const void *a3, void *a4)
{
  void v4[5] = a4;
  void v4[4] = a2;
  id v4[3] = a1;
  id v4[2] = v4;
  id v6 = a1;
  id v7 = a2;
  v4[6] = _Block_copy(a3);
  id v8 = a4;
  uint64_t v20 = static String._unconditionallyBridgeFromObjectiveC(_:)(a1);
  uint64_t v17 = v9;
  v4[7] = v9;
  uint64_t v18 = static String._unconditionallyBridgeFromObjectiveC(_:)(a2);
  uint64_t v19 = v10;
  v4[8] = v10;
  uint64_t v11 = (void *)swift_task_alloc(dword_10022169C);
  *(void *)(v16 + 72) = v11;
  *uint64_t v11 = *(void *)(v16 + 16);
  v11[1] = sub_10013E37C;
  return sub_10013D6AC(v20, v17, v18, v19);
}

void *sub_10013E37C()
{
  uint64_t v2 = *v1;
  uint64_t v3 = *(void *)(*v1 + 72);
  *(void *)(v2 + 16) = *v1;
  uint64_t v12 = (void *)(v2 + 16);
  uint64_t v13 = (void *)(v2 + 16);
  swift_task_dealloc(v3);
  if (v0)
  {
    aBlock = (void (**)(void))v12[4];
    id v9 = (id)_convertErrorToNSError(_:)();
    aBlock[2]();

    _Block_release(aBlock);
    swift_errorRelease();
  }

  else
  {
    uint64_t v11 = (void (**)(void))v12[4];
    v11[2]();
    _Block_release(v11);
  }

  uint64_t v6 = v12[5];
  id v8 = (void *)v12[3];
  unint64_t v5 = (void *)v12[2];
  id v7 = (void *)v12[1];
  swift_bridgeObjectRelease(v12[6]);

  swift_bridgeObjectRelease(v6);
  return (*(void *(**)(void *__return_ptr))(*v13 + 8LL))(v13);
}

id TVSSShowInAppStringSearchResultsIntentPrototype.__allocating_init()()
{
  return [objc_allocWithZone(v0) init];
}

id TVSSShowInAppStringSearchResultsIntentPrototype.init()()
{
  id v4 = 0LL;
  v3.receiver = 0LL;
  v3.super_class = (Class)type metadata accessor for TVSSShowInAppStringSearchResultsIntentPrototype();
  id v2 = objc_msgSendSuper2(&v3, "init");
  id v0 = v2;
  id v4 = v2;

  return v2;
}

id TVSSShowInAppStringSearchResultsIntentPrototype.__deallocating_deinit()
{
  objc_super v3 = v0;
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for TVSSShowInAppStringSearchResultsIntentPrototype();
  return objc_msgSendSuper2(&v2, "dealloc");
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> sub_10013E59C()
{
}

unint64_t sub_10013E5DC()
{
  uint64_t v2 = qword_1002216A8;
  if (!qword_1002216A8)
  {
    unint64_t WitnessTable = swift_getWitnessTable(&protocol conformance descriptor for UInt32, &type metadata for UInt32);
    atomic_store(WitnessTable, (unint64_t *)&qword_1002216A8);
    return WitnessTable;
  }

  return v2;
}

unint64_t sub_10013E644()
{
  uint64_t v2 = qword_1002216B0;
  if (!qword_1002216B0)
  {
    unint64_t WitnessTable = swift_getWitnessTable(&protocol conformance descriptor for UInt32, &type metadata for UInt32);
    atomic_store(WitnessTable, (unint64_t *)&qword_1002216B0);
    return WitnessTable;
  }

  return v2;
}

unint64_t sub_10013E6AC()
{
  uint64_t v2 = qword_1002216B8;
  if (!qword_1002216B8)
  {
    unint64_t WitnessTable = swift_getWitnessTable(&protocol conformance descriptor for Int, &type metadata for Int);
    atomic_store(WitnessTable, (unint64_t *)&qword_1002216B8);
    return WitnessTable;
  }

  return v2;
}

uint64_t sub_10013E714(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a1) {
    return static UnsafeMutablePointer.allocate(capacity:)(a1, a3);
  }
  else {
    return 0LL;
  }
}

uint64_t sub_10013E76C(uint64_t result, _BYTE **a2)
{
  uint64_t v2 = *a2;
  *uint64_t v2 = result;
  *a2 = v2 + 1;
  return result;
}

uint64_t sub_10013E780( uint64_t (**a1)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*a1)(a2, a3, a4);
}

void sub_10013E7C4(uint64_t a1, uint64_t a2)
{
  if (a1)
  {
    UnsafeMutablePointer.deinitialize(count:)(a2);
    UnsafeMutablePointer.deallocate()();
  }

void sub_10013E830()
{
  void *v0 = *v0;
}

uint64_t sub_10013E83C(uint64_t (*a1)(void))
{
  return a1();
}

void *sub_10013E85C(void *a1, uint64_t a2, uint64_t *a3, uint64_t (*a4)(void))
{
  uint64_t v4 = a4();
  uint64_t v9 = v5;
  uint64_t v6 = sub_10013E8D8(v4, v5, a3);
  uint64_t v10 = *a1;
  uint64_t v12 = v6;
  UnsafeMutableRawBufferPointer.copyMemory(from:)(&v12, &v13);
  swift_bridgeObjectRelease(v9);
  uint64_t result = a1;
  *a1 = v10 + 8;
  return result;
}

uint64_t sub_10013E8D8(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v14 = sub_10013EA48((uint64_t)&v17, 0LL, 0LL, 1, a1, a2);
  uint64_t v15 = v3;
  __int16 v16 = v4;
  uint64_t v11 = v17;
  if (v14)
  {
    v12[3] = swift_getObjectType(v14);
    v12[0] = v14;
    uint64_t v6 = *a3;
    if (*a3)
    {
      sub_10013FA18((uint64_t)v12, v6);
      *a3 = v6 + 32;
    }

    sub_10013F820(v12);
  }

  else
  {
    v13[3] = &type metadata for _StringGuts;
    v13[0] = a1;
    v13[1] = a2;
    uint64_t v7 = *a3;
    if (*a3)
    {
      sub_10013FA18((uint64_t)v13, v7);
      *a3 = v7 + 32;
    }

    swift_bridgeObjectRetain(a2);
    sub_10013F820(v13);
  }

  return v11;
}

uint64_t sub_10013EA48(uint64_t result, void *a2, uint64_t a3, char a4, uint64_t a5, uint64_t a6)
{
  uint64_t v17 = (void *)result;
  uint64_t v25 = a6;
  if ((a6 & 0x2000000000000000LL) != 0)
  {
    if ((a4 & 1) == 0)
    {
      if (a2)
      {
        if (!a3) {
          __break(1u);
        }
        int64_t v16 = a3 - (void)a2;
      }

      else
      {
        int64_t v16 = 0LL;
      }

      int64_t v15 = (a6 & 0xF00000000000000uLL) >> 56;
      if (v15 < v16)
      {
        if (a2)
        {
          v22[0] = a5;
          v22[1] = a6 & (-(uint64_t)bswap64(0xFFuLL) - 1);
          sub_10013EDBC(v22, v15, a2);
          UnsafeMutableRawBufferPointer.subscript.setter(0LL, v15, a2, a3);
          *uint64_t v17 = a2;
          uint64_t v11 = 0LL;
          uint64_t v12 = v15;
          char v13 = 1;
          char v14 = 0;
LABEL_26:
          v22[2] = v11;
          v22[3] = v12;
          char v23 = v13 & 1;
          char v24 = v14 & 1;
          return (uint64_t)v11;
        }

        goto LABEL_28;
      }
    }

LABEL_13:
    uint64_t v6 = sub_10013EDF8(a5, a6);
    *uint64_t v17 = v7;
    uint64_t v11 = v6;
    uint64_t v12 = v8;
    char v13 = 0;
    char v14 = 1;
    goto LABEL_26;
  }

  if ((a6 & 0x1000000000000000LL) != 0) {
    goto LABEL_13;
  }
  if ((a5 & 0x1000000000000000LL) != 0)
  {
    if ((a6 & 0xFFFFFFFFFFFFFFFLL) != 0xFFFFFFFFFFFFFFE0LL)
    {
      uint64_t v10 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
      goto LABEL_21;
    }

    __break(1u);
  }

  uint64_t result = _StringObject.sharedUTF8.getter(a5, a6);
  if (!result) {
    goto LABEL_29;
  }
  uint64_t v10 = result;
LABEL_21:
  *uint64_t v17 = v10;
  if (a6 < 0)
  {
    uint64_t v9 = 0LL;
LABEL_25:
    uint64_t v11 = (void *)v9;
    uint64_t v12 = a5 & 0xFFFFFFFFFFFFLL;
    char v13 = 0;
    char v14 = 0;
    goto LABEL_26;
  }

  if ((a6 & 0xFFFFFFFFFFFFFFFLL) != 0)
  {
    swift_unknownObjectRetain();
    uint64_t v9 = a6 & 0xFFFFFFFFFFFFFFFLL;
    goto LABEL_25;
  }

  __break(1u);
LABEL_28:
  __break(1u);
LABEL_29:
  __break(1u);
  return result;
}

void *sub_10013EDBC(const void *a1, size_t a2, void *__dst)
{
  return __dst;
}

void *sub_10013EDF8(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = sub_10013EEA8(a1, a2);
  sub_10013F020();
  uint64_t v4 = v6[2];
  sub_10013F094(v4);
  sub_10013F114(v4, 0);
  sub_10013F180();
  swift_retain(v6);
  uint64_t v5 = sub_10013F18C((uint64_t)v6);
  swift_bridgeObjectRelease(v6);
  uint64_t result = (void *)v5;
  if (!__OFSUB__(v5, 1LL)) {
    return v6;
  }
  __break(1u);
  return result;
}

void *sub_10013EEA8(uint64_t a1, uint64_t a2)
{
  id v10[2] = a2;
  if ((a2 & 0x1000000000000000LL) != 0)
  {
    uint64_t v7 = String.UTF8View._foreignCount()();
  }

  else if ((a2 & 0x2000000000000000LL) != 0)
  {
    uint64_t v7 = (a2 & 0xF00000000000000uLL) >> 56;
  }

  else
  {
    uint64_t v7 = a1 & 0xFFFFFFFFFFFFLL;
  }

  if (!v7) {
    return sub_10013F308();
  }
  uint64_t v5 = sub_10013F1A0(v7, 0LL);
  swift_retain(v5);
  swift_release(v5);
  uint64_t result = (void *)_StringGuts.copyUTF8(into:)(v5 + 4, v7, a1, a2);
  uint64_t v6 = result;
  if ((v3 & 1) != 0)
  {
    __break(1u);
  }

  else
  {
    swift_bridgeObjectRetain();
    uint64_t result = v10;
    v10[0] = 0LL;
    v10[1] = 0xE000000000000000LL;
    sub_10013FA8C((uint64_t)v10);
    if (v6 == (void *)v7) {
      return v5;
    }
  }

  __break(1u);
  return result;
}

uint64_t sub_10013F020()
{
  uint64_t v4 = *v0;
  uint64_t result = swift_isUniquelyReferenced_nonNull_native();
  uint64_t *v0 = v4;
  if ((result & 1) == 0)
  {
    uint64_t v2 = sub_10013F18C(*v3);
    uint64_t result = sub_10013F334(0, v2 + 1, 1, *v3);
    uint64_t *v3 = result;
  }

  return result;
}

uint64_t sub_10013F094(uint64_t result)
{
  if (*(void *)(*(void *)v1 + 24LL) >> 1 < result + 1)
  {
    uint64_t result = sub_10013F334(*(void *)(*(void *)v1 + 24LL) >> 1 != 0LL, result + 1, 1, *v2);
    *uint64_t v2 = result;
  }

  return result;
}

uint64_t sub_10013F114(uint64_t a1, char a2)
{
  uint64_t v5 = a1 + 1;
  uint64_t v4 = *v2;
  swift_bridgeObjectRetain();
  *(void *)(v4 + 16) = v5;
  swift_release(v4);
  uint64_t v6 = *v2;
  swift_retain();
  *(_BYTE *)(v6 + 32 + a1) = a2;
  return swift_release(v6);
}

void sub_10013F180()
{
  void *v0 = *v0;
}

uint64_t sub_10013F18C(uint64_t a1)
{
  return sub_10013F630(a1);
}

void *sub_10013F1A0(uint64_t a1, uint64_t a2)
{
  if (a2 < a1) {
    uint64_t v7 = a1;
  }
  else {
    uint64_t v7 = a2;
  }
  if (v7)
  {
    uint64_t v2 = sub_10013CCA8(&qword_100221708);
    uint64_t v6 = (void *)swift_allocObject(v2, v7 + 32, 7LL);
    if ((sub_10013FA5C() & 1) != 0)
    {
      size_t v4 = (size_t)v6 + sub_10013FA68(v6);
      swift_retain(v6);
      id v6[2] = a1;
      v6[3] = 2 * (v4 - (void)(v6 + 4));
    }

    else
    {
      swift_retain(v6);
      id v6[2] = a1;
      v6[3] = 2 * v7;
    }

    swift_release(v6);
    return v6;
  }

  else
  {
    swift_retain(&_swiftEmptyArrayStorage);
    return &_swiftEmptyArrayStorage;
  }

void *sub_10013F308()
{
  return &_swiftEmptyArrayStorage;
}

uint64_t sub_10013F334(char a1, uint64_t a2, char a3, uint64_t a4)
{
  uint64_t result = swift_retain(a4);
  uint64_t v16 = *(void *)(a4 + 24) >> 1;
  if ((a3 & 1) != 0)
  {
    if (v16 < a2)
    {
      if ((unsigned __int128)(v16 * (__int128)2LL) >> 64 != (2 * v16) >> 63)
      {
        __break(1u);
        return result;
      }

      if (2 * v16 < a2) {
        uint64_t v11 = a2;
      }
      else {
        uint64_t v11 = 2 * v16;
      }
    }

    else
    {
      uint64_t v11 = *(void *)(a4 + 24) >> 1;
    }
  }

  else
  {
    uint64_t v11 = a2;
  }

  int64_t v10 = *(void *)(a4 + 16);
  if (v11 < v10) {
    uint64_t v9 = *(void *)(a4 + 16);
  }
  else {
    uint64_t v9 = v11;
  }
  if (v9)
  {
    uint64_t v5 = sub_10013CCA8(&qword_100221708);
    uint64_t v8 = (void *)swift_allocObject(v5, v9 + 32, 7LL);
    if ((sub_10013FA5C() & 1) != 0)
    {
      size_t v6 = (size_t)v8 + sub_10013FA68(v8);
      swift_retain(v8);
      id v8[2] = v10;
      v8[3] = 2 * (v6 - (void)(v8 + 4));
    }

    else
    {
      swift_retain(v8);
      id v8[2] = v10;
      v8[3] = 2 * v9;
    }

    swift_release(v8);
    uint64_t v7 = (char *)v8;
  }

  else
  {
    swift_retain(&_swiftEmptyArrayStorage);
    uint64_t v7 = (char *)&_swiftEmptyArrayStorage;
  }

  if ((a1 & 1) != 0)
  {
    swift_release(a4);
    swift_bridgeObjectRelease(a4);
    sub_10013F66C((char *)(a4 + 32), v10, v7 + 32);
    *(void *)(a4 + 16) = 0LL;
    swift_release(a4);
  }

  else
  {
    swift_bridgeObjectRelease(a4);
    swift_release(a4);
    swift_retain(a4);
    swift_release(a4);
    sub_10013F638((const void *)(a4 + 32), v10, v7 + 32);
    swift_unknownObjectRelease(a4);
  }

  return (uint64_t)v7;
}

uint64_t sub_10013F630(uint64_t a1)
{
  return *(void *)(a1 + 16);
}

void *sub_10013F638(const void *a1, size_t a2, void *__dst)
{
  return memcpy(__dst, a1, a2);
}

char *sub_10013F66C(char *result, size_t a2, char *a3)
{
  if (a3 < result || a3 >= &result[a2] || a3 != result) {
    return (char *)memmove(a3, result, a2);
  }
  return result;
}

_BYTE **sub_10013F71C(_BYTE **result, uint64_t a2, uint64_t a3, char a4)
{
  size_t v4 = *result;
  *size_t v4 = a4;
  *uint64_t result = v4 + 1;
  return result;
}

uint64_t sub_10013F730()
{
  return swift_deallocObject(v0, 17LL);
}

_BYTE **sub_10013F758(_BYTE **a1, uint64_t a2, uint64_t a3)
{
  return sub_10013F71C(a1, a2, a3, *(_BYTE *)(v3 + 16));
}

uint64_t sub_10013F760()
{
  return swift_deallocObject(v0, 17LL);
}

_BYTE **sub_10013F788(_BYTE **a1, uint64_t a2, uint64_t a3)
{
  return sub_10013F71C(a1, a2, a3, *(_BYTE *)(v3 + 16));
}

uint64_t sub_10013F790()
{
  return swift_deallocObject(v2, 32LL);
}

uint64_t sub_10013F7CC()
{
  return sub_10013E83C(*(uint64_t (**)(void))(v0 + 16));
}

uint64_t sub_10013F7D8()
{
  return swift_deallocObject(v2, 32LL);
}

void *sub_10013F814(void *a1, uint64_t a2, uint64_t *a3)
{
  return sub_10013E85C(a1, a2, a3, *(uint64_t (**)(void))(v3 + 16));
}

uint64_t sub_10013F820(void *a1)
{
  uint64_t v2 = a1[3];
  if ((*(_DWORD *)(*(void *)(v2 - 8) + 80LL) & 0x20000) != 0) {
    return swift_release(*a1);
  }
  else {
    return (*(uint64_t (**)(void *))(*(void *)(v2 - 8) + 8LL))(a1);
  }
}

uint64_t sub_10013F888()
{
  _Block_release(*(const void **)(v0 + 32));
  return swift_deallocObject(v2, 48LL);
}

uint64_t sub_10013F8DC()
{
  *(void *)(v1 + 16) = v1;
  uint64_t v7 = (void *)v0[2];
  size_t v4 = (void *)v0[3];
  uint64_t v5 = (const void *)v0[4];
  size_t v6 = (void *)v0[5];
  uint64_t v2 = (void *)swift_task_alloc(dword_1002216D4);
  *(void *)(v1 + 24) = v2;
  *uint64_t v2 = *(void *)(v1 + 16);
  v2[1] = sub_10013F994;
  return ((uint64_t (*)(void *, void *, const void *, void *))((char *)&dword_1002216D0 + dword_1002216D0))( v7,  v4,  v5,  v6);
}

uint64_t sub_10013F994()
{
  uint64_t v3 = *v0;
  uint64_t v1 = *(void *)(*v0 + 24);
  *(void *)(*v0 + 16) = *v0;
  swift_task_dealloc(v1);
  return (*(uint64_t (**)(void))(*(void *)(v3 + 16) + 8LL))();
}

uint64_t type metadata accessor for TVSSShowInAppStringSearchResultsIntentPrototype()
{
  return objc_opt_self(&OBJC_CLASS____TtC17TVSystemUIService47TVSSShowInAppStringSearchResultsIntentPrototype);
}

uint64_t sub_10013FA18(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v2;
  (**(void (***)(uint64_t))(v2 - 8))(a2);
  return a2;
}

uint64_t sub_10013FA5C()
{
  return 1LL;
}

size_t sub_10013FA68(const void *a1)
{
  return malloc_size(a1);
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> sub_10013FA8C( uint64_t a1)
{
}

id sub_10013FAFC()
{
  uint64_t v6 = 0LL;
  uint64_t v3 = (id *)(v0 + OBJC_IVAR____TtC17TVSystemUIService14TVSSTipManager_presentingViewController);
  swift_beginAccess();
  id v4 = *v3;
  id v1 = *v3;
  swift_endAccess(v5);
  return v4;
}

void sub_10013FBAC(void *a1)
{
  uint64_t v7 = 0LL;
  uint64_t v8 = a1;
  id v2 = a1;
  id v4 = (void **)(v1 + OBJC_IVAR____TtC17TVSystemUIService14TVSSTipManager_presentingViewController);
  swift_beginAccess();
  uint64_t v3 = *v4;
  *id v4 = a1;

  swift_endAccess(v6);
}

uint64_t (*sub_10013FC28())(uint64_t a1)
{
  return sub_10013FC78;
}

uint64_t sub_10013FC78(uint64_t a1)
{
  return swift_endAccess(a1);
}

id sub_10013FCFC()
{
  uint64_t v6 = 0LL;
  uint64_t v3 = (id *)(v0 + OBJC_IVAR____TtC17TVSystemUIService14TVSSTipManager_sourceView);
  swift_beginAccess();
  id v4 = *v3;
  id v1 = *v3;
  swift_endAccess(v5);
  return v4;
}

void sub_10013FDAC(void *a1)
{
  uint64_t v7 = 0LL;
  uint64_t v8 = a1;
  id v2 = a1;
  id v4 = (void **)(v1 + OBJC_IVAR____TtC17TVSystemUIService14TVSSTipManager_sourceView);
  swift_beginAccess();
  uint64_t v3 = *v4;
  *id v4 = a1;

  swift_endAccess(v6);
}

uint64_t (*sub_10013FE28())(uint64_t a1)
{
  return sub_10013FE78;
}

uint64_t sub_10013FE78(uint64_t a1)
{
  return swift_endAccess(a1);
}

uint64_t sub_10013FEFC()
{
  uint64_t v5 = 0LL;
  id v2 = (uint64_t *)(v0 + OBJC_IVAR____TtC17TVSystemUIService14TVSSTipManager_permittedArrowDirections);
  swift_beginAccess();
  uint64_t v3 = *v2;
  swift_endAccess(v4);
  return v3;
}

uint64_t sub_10013FFA0(uint64_t a1)
{
  uint64_t v6 = 0LL;
  uint64_t v7 = a1;
  uint64_t v3 = (void *)(v1 + OBJC_IVAR____TtC17TVSystemUIService14TVSSTipManager_permittedArrowDirections);
  swift_beginAccess();
  void *v3 = a1;
  return swift_endAccess(v5);
}

uint64_t (*sub_100140008())(uint64_t a1)
{
  return sub_100140058;
}

uint64_t sub_100140058(uint64_t a1)
{
  return swift_endAccess(a1);
}

uint64_t sub_100140094()
{
  uint64_t v5 = 0LL;
  id v2 = (uint64_t *)(v0 + OBJC_IVAR____TtC17TVSystemUIService14TVSSTipManager_observer);
  swift_beginAccess();
  uint64_t v3 = *v2;
  swift_retain();
  swift_endAccess(v4);
  return v3;
}

uint64_t sub_1001400F8(uint64_t a1)
{
  uint64_t v7 = 0LL;
  uint64_t v8 = a1;
  swift_retain();
  id v4 = (uint64_t *)(v1 + OBJC_IVAR____TtC17TVSystemUIService14TVSSTipManager_observer);
  swift_beginAccess();
  uint64_t v2 = *v4;
  *id v4 = a1;
  swift_release(v2);
  swift_endAccess(v6);
  return swift_release(a1);
}

uint64_t (*sub_100140174())(uint64_t a1)
{
  return sub_1001401C4;
}

uint64_t sub_1001401C4(uint64_t a1)
{
  return swift_endAccess(a1);
}

id sub_100140200()
{
  uint64_t v6 = 0LL;
  uint64_t v3 = (id *)(v0 + OBJC_IVAR____TtC17TVSystemUIService14TVSSTipManager_tipViewController);
  swift_beginAccess();
  id v4 = *v3;
  id v1 = *v3;
  swift_endAccess(v5);
  return v4;
}

void sub_100140264(void *a1)
{
  uint64_t v7 = 0LL;
  uint64_t v8 = a1;
  id v2 = a1;
  id v4 = (void **)(v1 + OBJC_IVAR____TtC17TVSystemUIService14TVSSTipManager_tipViewController);
  swift_beginAccess();
  uint64_t v3 = *v4;
  *id v4 = a1;

  swift_endAccess(v6);
}

uint64_t (*sub_1001402E0())(uint64_t a1)
{
  return sub_100140330;
}

uint64_t sub_100140330(uint64_t a1)
{
  return swift_endAccess(a1);
}

id sub_10014036C(void *a1)
{
  id v2 = objc_allocWithZone(v1);
  return sub_1001403A4(a1);
}

id sub_1001403A4(void *a1)
{
  unint64_t v21 = a1;
  id v2 = v1;
  uint64_t v3 = v1;
  id v4 = v1;
  uint64_t v5 = v1;
  uint64_t v6 = v1;
  uint64_t v7 = v1;
  id v22 = v1;
  *(void *)&v1[OBJC_IVAR____TtC17TVSystemUIService14TVSSTipManager_presentingViewController] = 0LL;

  *(void *)&v1[OBJC_IVAR____TtC17TVSystemUIService14TVSSTipManager_sourceView] = 0LL;
  *(void *)&v1[OBJC_IVAR____TtC17TVSystemUIService14TVSSTipManager_observer] = 0LL;

  *(void *)&v1[OBJC_IVAR____TtC17TVSystemUIService14TVSSTipManager_tipViewController] = 0LL;
  sub_100140554((uint64_t)a1, (uint64_t)v20);
  sub_1001405A0(v20, &v1[OBJC_IVAR____TtC17TVSystemUIService14TVSSTipManager_tip]);

  uint64_t v8 = type metadata accessor for UIPopoverArrowDirection(0LL);
  uint64_t v9 = _allocateUninitializedArray<A>(_:)(1LL);
  *int64_t v10 = 15LL;
  sub_10013E59C();
  uint64_t v14 = v9;
  unint64_t v11 = sub_10013CA58();
  SetAlgebra<>.init(arrayLiteral:)(v14, v8, v11);
  *(void *)&v15[OBJC_IVAR____TtC17TVSystemUIService14TVSSTipManager_permittedArrowDirections] = v19;

  v18.receiver = v22;
  v18.super_class = (Class)type metadata accessor for TVSSTipManager();
  id v17 = objc_msgSendSuper2(&v18, "init");
  id v12 = v17;
  id v22 = v17;
  sub_1001405FC(a1);

  return v17;
}

uint64_t sub_100140554(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v2;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t))(v2 - 8))(a2);
  return a2;
}

void *sub_1001405A0(const void *a1, void *__dst)
{
  return __dst;
}

uint64_t type metadata accessor for TVSSTipManager()
{
  return objc_opt_self(&OBJC_CLASS____TtC17TVSystemUIService14TVSSTipManager);
}

uint64_t sub_1001405FC(void *a1)
{
  uint64_t v2 = a1[3];
  if ((*(_DWORD *)(*(void *)(v2 - 8) + 80LL) & 0x20000) != 0) {
    return swift_release(*a1);
  }
  else {
    return (*(uint64_t (**)(void *))(*(void *)(v2 - 8) + 8LL))(a1);
  }
}

uint64_t sub_100140664()
{
  os_log_type_t v49 = &protocol witness table for MainActor;
  uint64_t v82 = 0LL;
  uint64_t v50 = 0LL;
  unint64_t v51 = (*(void *)(*(void *)(sub_10013CCA8(&qword_100221658) - 8) + 64LL) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  __chkstk_darwin();
  uint64_t v52 = (char *)&v38 - v51;
  uint64_t v56 = type metadata accessor for Logger(0LL);
  uint64_t v55 = *(void *)(v56 - 8);
  unint64_t v53 = (*(void *)(v55 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  __chkstk_darwin();
  uint64_t v0 = (char *)&v38 - v53;
  id v54 = (char *)&v38 - v53;
  uint64_t v82 = v1;
  uint64_t v2 = sub_1001449F0();
  (*(void (**)(char *, uint64_t, uint64_t))(v55 + 16))(v0, v2, v56);
  id v3 = v57;
  uint64_t v64 = 7LL;
  uint64_t v65 = swift_allocObject(&unk_1001BC420, 24LL, 7LL);
  *(void *)(v65 + 16) = v57;
  char v73 = (os_log_s *)Logger.logObject.getter();
  int v74 = static os_log_type_t.default.getter();
  unsigned __int8 v60 = &v80;
  uint64_t v80 = 12LL;
  unint64_t v58 = sub_10013E5DC();
  unint64_t v59 = sub_10013E644();
  unint64_t v4 = sub_10013E6AC();
  UnsignedInteger<>.init<A>(_:)(v60, &type metadata for UInt32, &type metadata for Int, v58, v59, v4);
  uint32_t v61 = v81;
  uint64_t v62 = 17LL;
  uint64_t v5 = swift_allocObject(&unk_1001BC448, 17LL, v64);
  uint64_t v6 = v62;
  uint64_t v7 = v64;
  uint64_t v67 = v5;
  *(_BYTE *)(v5 + 16) = 32;
  uint64_t v8 = swift_allocObject(&unk_1001BC470, v6, v7);
  uint64_t v9 = v64;
  uint64_t v68 = v8;
  *(_BYTE *)(v8 + 16) = 8;
  uint64_t v63 = 32LL;
  uint64_t v10 = swift_allocObject(&unk_1001BC498, 32LL, v9);
  uint64_t v11 = v63;
  uint64_t v12 = v64;
  uint64_t v13 = v10;
  uint64_t v14 = v65;
  uint64_t v66 = v13;
  *(void *)(v13 + 16) = sub_100140D68;
  *(void *)(v13 + 24) = v14;
  uint64_t v15 = swift_allocObject(&unk_1001BC4C0, v11, v12);
  uint64_t v16 = v66;
  uint64_t v70 = v15;
  *(void *)(v15 + 16) = sub_100143E58;
  *(void *)(v15 + 24) = v16;
  uint64_t v72 = sub_10013CCA8(&qword_1002216C0);
  uint64_t v69 = _allocateUninitializedArray<A>(_:)(3LL);
  id v71 = v17;
  swift_retain(v67);
  uint64_t v18 = v68;
  uint64_t v19 = v67;
  uint64_t v20 = v71;
  *id v71 = sub_100143DE4;
  v20[1] = v19;
  swift_retain(v18);
  uint64_t v21 = v70;
  uint64_t v22 = v68;
  char v23 = v71;
  v71[2] = sub_100143E14;
  v23[3] = v22;
  swift_retain(v21);
  uint64_t v24 = v69;
  uint64_t v25 = v70;
  uint64_t v26 = v71;
  v71[4] = sub_100143EA0;
  v26[5] = v25;
  sub_10013E59C();
  swift_bridgeObjectRelease(v24);
  if (os_log_type_enabled(v73, (os_log_type_t)v74))
  {
    uint64_t v27 = v50;
    char v42 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)(12LL, &type metadata for UInt8);
    uint64_t v41 = sub_10013CCA8(&qword_1002216C8);
    uint64_t v43 = sub_10013E714(0LL, v41, v41);
    uint64_t v44 = sub_10013E714(1LL, (uint64_t)&type metadata for Any + 8, (uint64_t)&type metadata for Any + 8);
    uint64_t v45 = &v79;
    id v79 = v42;
    id v46 = &v78;
    uint64_t v78 = v43;
    id v47 = &v77;
    uint64_t v77 = v44;
    sub_10013E76C(2LL, &v79);
    sub_10013E76C(1LL, v45);
    char v75 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_100143DE4;
    uint64_t v76 = v67;
    sub_10013E780(&v75, (uint64_t)v45, (uint64_t)v46, (uint64_t)v47);
    uint64_t v48 = v27;
    if (v27)
    {
      __break(1u);
    }

    else
    {
      char v75 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_100143E14;
      uint64_t v76 = v68;
      sub_10013E780(&v75, (uint64_t)&v79, (uint64_t)&v78, (uint64_t)&v77);
      uint64_t v40 = 0LL;
      char v75 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_100143EA0;
      uint64_t v76 = v70;
      sub_10013E780(&v75, (uint64_t)&v79, (uint64_t)&v78, (uint64_t)&v77);
      _os_log_impl((void *)&_mh_execute_header, v73, (os_log_type_t)v74, "Start tips observer for %s", v42, v61);
      sub_10013E7C4(v43, 0LL);
      sub_10013E7C4(v44, 1LL);
      UnsafeMutablePointer.deallocate()();
      swift_release(v67);
      swift_release(v68);
      swift_release(v70);
    }
  }

  else
  {
    swift_release(v67);
    swift_release(v68);
    swift_release(v70);
  }

  (*(void (**)(char *, uint64_t))(v55 + 8))(v54, v56);
  uint64_t v38 = 0LL;
  uint64_t v28 = type metadata accessor for TaskPriority(0LL);
  (*(void (**)(char *, uint64_t))(*(void *)(v28 - 8) + 56LL))(v52, 1LL);
  id v29 = v57;
  type metadata accessor for MainActor(v38);
  uint64_t v30 = static MainActor.shared.getter();
  id v31 = v57;
  uint64_t v39 = v30;
  uint64_t v32 = swift_allocObject(&unk_1001BC4E8, 40LL, 7LL);
  id v33 = v49;
  uint64_t v34 = (void *)v32;
  uint64_t v35 = (uint64_t)v52;
  void v34[2] = v39;
  v34[3] = v33;
  v34[4] = v31;
  uint64_t v36 = sub_1001411DC(v35, (uint64_t)&unk_100221750, (uint64_t)v34, (uint64_t)&type metadata for () + 8);
  return sub_1001400F8(v36);
}

uint64_t sub_100140CE4(uint64_t a1)
{
  uint64_t v1 = sub_10013CCA8(&qword_100221790);
  return String.init<A>(describing:)(v3, v1);
}

uint64_t sub_100140D2C()
{
  return swift_deallocObject(v2, 24LL);
}

uint64_t sub_100140D68()
{
  return sub_100140CE4(*(void *)(v0 + 16));
}

uint64_t sub_100140D70(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(void *)(v4 + 72) = a4;
  *(void *)(v4 + 56) = v4;
  *(void *)(v4 + 64) = 0LL;
  *(_BYTE *)(v4 + 16_Block_object_dispose((const void *)(v18 - 72), 8) = 0;
  uint64_t v5 = sub_10013CCA8(&qword_1002217A8);
  *(void *)(v4 + 80) = v5;
  *(void *)(v4 + 8_Block_object_dispose((const void *)(v18 - 72), 8) = swift_task_alloc((*(void *)(*(void *)(v5 - 8) + 64LL) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v6 = sub_10013CCA8(&qword_1002217B0);
  *(void *)(v4 + 96) = v6;
  uint64_t v7 = *(void *)(v6 - 8);
  *(void *)(v4 + 104) = v7;
  *(void *)(v4 + 112) = swift_task_alloc((*(void *)(v7 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  *(void *)(v4 + 64) = a4;
  uint64_t v11 = type metadata accessor for MainActor(0LL);
  *(void *)(v4 + 120) = v11;
  *(void *)(v4 + 12_Block_object_dispose((const void *)(v18 - 72), 8) = static MainActor.shared.getter(v11);
  uint64_t v12 = dispatch thunk of Actor.unownedExecutor.getter(v11, &protocol witness table for MainActor);
  *(void *)(v4 + 136) = v12;
  *(void *)(v4 + 144) = v8;
  return swift_task_switch(sub_100140E78, v12);
}

uint64_t sub_100140E78()
{
  uint64_t v7 = v0[10];
  uint64_t v1 = v0[9];
  v0[7] = v0;
  sub_100140554(v1 + OBJC_IVAR____TtC17TVSystemUIService14TVSSTipManager_tip, (uint64_t)(v0 + 2));
  uint64_t v6 = v0[5];
  uint64_t v5 = v0[6];
  sub_10014427C(v0 + 2, v6);
  Tip.shouldDisplayUpdates.getter(v6, v5);
  AsyncMapSequence.makeAsyncIterator()(v7);
  uint64_t v2 = sub_1001405FC(v0 + 2);
  uint64_t v9 = static MainActor.shared.getter(v2);
  v0[19] = v9;
  id v3 = (void *)swift_task_alloc(_ss16AsyncMapSequenceV8IteratorV4next9isolationq_SgScA_pSgYi_tYa7FailureQzYKFTu[1]);
  v8[20] = v3;
  void *v3 = v8[7];
  v3[1] = sub_100140F98;
  return _ss16AsyncMapSequenceV8IteratorV4next9isolationq_SgScA_pSgYi_tYa7FailureQzYKF( (char *)v8 + 169,  v9,  &protocol witness table for MainActor,  v8[12]);
}

uint64_t sub_100140F98()
{
  uint64_t v2 = *v1;
  uint64_t v3 = *(void *)(*v1 + 160);
  *(void *)(v2 + 56) = *v1;
  uint64_t v5 = v2 + 16;
  uint64_t result = swift_task_dealloc(v3);
  if (!v0)
  {
    swift_unknownObjectRelease(*(void *)(v5 + 136));
    return swift_task_switch(sub_100141044, *(void *)(v5 + 120));
  }

  return result;
}

uint64_t sub_100141044()
{
  *(void *)(v0 + 56) = v0;
  int v9 = *(unsigned __int8 *)(v0 + 169);
  if (v9 == 2)
  {
    uint64_t v5 = *(void *)(v8 + 128);
    uint64_t v6 = *(void *)(v8 + 112);
    uint64_t v7 = *(void *)(v8 + 88);
    (*(void (**)(void))(*(void *)(v8 + 104) + 8LL))();
    swift_release(v5);
    swift_task_dealloc(v6);
    swift_task_dealloc(v7);
    return (*(uint64_t (**)(void))(*(void *)(v8 + 56) + 8LL))();
  }

  else
  {
    *(_BYTE *)(v8 + 16_Block_object_dispose((const void *)(v18 - 72), 8) = v9 & 1;
    if ((v9 & 1) != 0) {
      sub_100141AD0();
    }
    else {
      sub_1001424D4();
    }
    uint64_t v4 = static MainActor.shared.getter(v2);
    *(void *)(v8 + 152) = v4;
    uint64_t v3 = (void *)swift_task_alloc(_ss16AsyncMapSequenceV8IteratorV4next9isolationq_SgScA_pSgYi_tYa7FailureQzYKFTu[1]);
    *(void *)(v8 + 160) = v3;
    void *v3 = *(void *)(v8 + 56);
    v3[1] = sub_100140F98;
    return ((uint64_t (*)(uint64_t, uint64_t, void *, void))_ss16AsyncMapSequenceV8IteratorV4next9isolationq_SgScA_pSgYi_tYa7FailureQzYKF)( v8 + 169,  v4,  &protocol witness table for MainActor,  *(void *)(v8 + 96));
  }

uint64_t sub_1001411DC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v23[4] = a4;
  uint64_t v21 = type metadata accessor for TaskPriority(0LL);
  uint64_t v22 = *(void *)(v21 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t))(v22 + 48))(a1, 1LL) == 1)
  {
    sub_10013D3AC(a1);
    uint64_t v16 = 0LL;
  }

  else
  {
    unsigned __int8 v15 = TaskPriority.rawValue.getter();
    (*(void (**)(uint64_t, uint64_t))(v22 + 8))(a1, v21);
    uint64_t v16 = v15;
  }

  uint64_t v14 = *(void *)(a3 + 16);
  uint64_t v13 = *(void *)(a3 + 24);
  swift_unknownObjectRetain();
  if (v14)
  {
    uint64_t ObjectType = swift_getObjectType(v14);
    uint64_t v9 = dispatch thunk of Actor.unownedExecutor.getter(ObjectType, v13);
    uint64_t v10 = v5;
    swift_unknownObjectRelease(v14);
    uint64_t v11 = v9;
    uint64_t v12 = v10;
  }

  else
  {
    uint64_t v11 = 0LL;
    uint64_t v12 = 0LL;
  }

  uint64_t v7 = (void *)swift_allocObject(&unk_1001BC628, 40LL, 7LL);
  id v7[2] = a4;
  id v7[3] = a2;
  v7[4] = a3;
  uint64_t v8 = 0LL;
  if (v11 != 0 || v12 != 0)
  {
    v23[0] = 0LL;
    v23[1] = 0LL;
    id v23[2] = v11;
    v23[3] = v12;
    uint64_t v8 = v23;
  }

  return swift_task_create(v16 | 0x1C00, v8, a4, &unk_1002217A0, v7);
}

uint64_t sub_100141440()
{
  uint64_t v72 = 0LL;
  uint64_t v41 = 0LL;
  uint64_t v45 = type metadata accessor for Logger(0LL);
  uint64_t v44 = *(void *)(v45 - 8);
  unint64_t v42 = (*(void *)(v44 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  __chkstk_darwin();
  uint64_t v0 = (char *)&v30 - v42;
  uint64_t v43 = (char *)&v30 - v42;
  uint64_t v72 = v1;
  uint64_t v2 = sub_1001449F0();
  (*(void (**)(char *, uint64_t, uint64_t))(v44 + 16))(v0, v2, v45);
  id v3 = v46;
  uint64_t v53 = 7LL;
  uint64_t v4 = swift_allocObject(&unk_1001BC510, 24LL, 7LL);
  uint64_t v54 = v4;
  *(void *)(v4 + 16) = v46;
  uint64_t v62 = (os_log_s *)Logger.logObject.getter(v4);
  int v63 = static os_log_type_t.default.getter();
  os_log_type_t v49 = &v70;
  uint64_t v70 = 12LL;
  unint64_t v47 = sub_10013E5DC();
  unint64_t v48 = sub_10013E644();
  unint64_t v5 = sub_10013E6AC();
  UnsignedInteger<>.init<A>(_:)(v49, &type metadata for UInt32, &type metadata for Int, v47, v48, v5);
  uint32_t v50 = v71;
  uint64_t v51 = 17LL;
  uint64_t v6 = swift_allocObject(&unk_1001BC538, 17LL, v53);
  uint64_t v7 = v51;
  uint64_t v8 = v53;
  uint64_t v56 = v6;
  *(_BYTE *)(v6 + 16) = 32;
  uint64_t v9 = swift_allocObject(&unk_1001BC560, v7, v8);
  uint64_t v10 = v53;
  uint64_t v57 = v9;
  *(_BYTE *)(v9 + 16) = 8;
  uint64_t v52 = 32LL;
  uint64_t v11 = swift_allocObject(&unk_1001BC588, 32LL, v10);
  uint64_t v12 = v52;
  uint64_t v13 = v53;
  uint64_t v14 = v11;
  uint64_t v15 = v54;
  uint64_t v55 = v14;
  *(void *)(v14 + 16) = sub_100144024;
  *(void *)(v14 + 24) = v15;
  uint64_t v16 = swift_allocObject(&unk_1001BC5B0, v12, v13);
  uint64_t v17 = v55;
  uint64_t v59 = v16;
  *(void *)(v16 + 16) = sub_1001440C8;
  *(void *)(v16 + 24) = v17;
  uint64_t v61 = sub_10013CCA8(&qword_1002216C0);
  uint64_t v58 = _allocateUninitializedArray<A>(_:)(3LL);
  unsigned __int8 v60 = v18;
  swift_retain(v56);
  uint64_t v19 = v57;
  uint64_t v20 = v56;
  uint64_t v21 = v60;
  *unsigned __int8 v60 = sub_100144054;
  v21[1] = v20;
  swift_retain(v19);
  uint64_t v22 = v59;
  uint64_t v23 = v57;
  uint64_t v24 = v60;
  void v60[2] = sub_100144084;
  v24[3] = v23;
  swift_retain(v22);
  uint64_t v25 = v58;
  uint64_t v26 = v59;
  uint64_t v27 = v60;
  v60[4] = sub_100144110;
  v27[5] = v26;
  sub_10013E59C();
  swift_bridgeObjectRelease(v25);
  if (os_log_type_enabled(v62, (os_log_type_t)v63))
  {
    uint64_t v28 = v41;
    uint64_t v34 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)(12LL, &type metadata for UInt8);
    uint64_t v33 = sub_10013CCA8(&qword_1002216C8);
    uint64_t v35 = sub_10013E714(0LL, v33, v33);
    uint64_t v36 = sub_10013E714(1LL, (uint64_t)&type metadata for Any + 8, (uint64_t)&type metadata for Any + 8);
    uint64_t v37 = &v68;
    uint64_t v68 = v34;
    uint64_t v38 = &v67;
    uint64_t v67 = v35;
    uint64_t v39 = &v66;
    uint64_t v66 = v36;
    sub_10013E76C(2LL, &v68);
    sub_10013E76C(1LL, v37);
    uint64_t v64 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_100144054;
    uint64_t v65 = v56;
    sub_10013E780(&v64, (uint64_t)v37, (uint64_t)v38, (uint64_t)v39);
    uint64_t v40 = v28;
    if (v28)
    {
      __break(1u);
    }

    else
    {
      uint64_t v64 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_100144084;
      uint64_t v65 = v57;
      sub_10013E780(&v64, (uint64_t)&v68, (uint64_t)&v67, (uint64_t)&v66);
      uint64_t v32 = 0LL;
      uint64_t v64 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_100144110;
      uint64_t v65 = v59;
      sub_10013E780(&v64, (uint64_t)&v68, (uint64_t)&v67, (uint64_t)&v66);
      _os_log_impl((void *)&_mh_execute_header, v62, (os_log_type_t)v63, "Stop tips observer for %s", v34, v50);
      sub_10013E7C4(v35, 0LL);
      sub_10013E7C4(v36, 1LL);
      UnsafeMutablePointer.deallocate()();
      swift_release(v56);
      swift_release(v57);
      swift_release(v59);
    }
  }

  else
  {
    swift_release(v56);
    swift_release(v57);
    swift_release(v59);
  }

  (*(void (**)(char *, uint64_t))(v44 + 8))(v43, v45);
  sub_1001424D4();
  uint64_t v69 = sub_100140094();
  if (v69)
  {
    uint64_t v30 = &v69;
    uint64_t v31 = v69;
    swift_retain(v69);
    sub_10014411C(v30);
    Task.cancel()();
    swift_release(v31);
  }

  else
  {
    sub_10014411C(&v69);
  }

  return sub_1001400F8(0LL);
}

uint64_t sub_100141A4C(uint64_t a1)
{
  uint64_t v1 = sub_10013CCA8(&qword_100221790);
  return String.init<A>(describing:)(v3, v1);
}

void sub_100141AD0()
{
  uint64_t v132 = 0LL;
  uint64_t v84 = 0LL;
  id v123 = 0LL;
  id v121 = 0LL;
  v115 = 0LL;
  id v108 = 0LL;
  uint64_t v99 = 0LL;
  uint64_t v92 = type metadata accessor for Logger(0LL);
  v91 = *(void **)(v92 - 8);
  uint64_t v87 = v91[8];
  unint64_t v86 = (v87 + 15) & 0xFFFFFFFFFFFFFFF0LL;
  __chkstk_darwin();
  os_log_t v88 = (char *)&v28 - v86;
  unint64_t v89 = v86;
  __chkstk_darwin();
  uint64_t v0 = (char *)&v28 - v89;
  v90 = (char *)&v28 - v89;
  uint64_t v132 = v1;
  uint64_t v2 = sub_1001449F0();
  v93 = (uint64_t (*)(char *, uint64_t, uint64_t))v91[2];
  uint64_t v3 = v93(v0, v2, v92);
  v102 = (os_log_s *)Logger.logObject.getter(v3);
  int v101 = static os_log_type_t.default.getter();
  v96 = &v130;
  uint64_t v130 = 2LL;
  unint64_t v94 = sub_10013E5DC();
  unint64_t v95 = sub_10013E644();
  unint64_t v97 = sub_10013E6AC();
  UnsignedInteger<>.init<A>(_:)(v96, &type metadata for UInt32, &type metadata for Int, v94, v95, v97);
  uint32_t v98 = v131;
  uint64_t v100 = sub_10013CCA8(&qword_1002216C0);
  uint64_t v103 = _allocateUninitializedArray<A>(_:)(v99);
  if (os_log_type_enabled(v102, (os_log_type_t)v101))
  {
    uint64_t v4 = v84;
    char v73 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)(2LL, &type metadata for UInt8);
    uint64_t v71 = sub_10013CCA8(&qword_1002216C8);
    uint64_t v72 = 0LL;
    uint64_t v74 = sub_10013E714(0LL, v71, v71);
    uint64_t v75 = sub_10013E714(v72, (uint64_t)&type metadata for Any + 8, (uint64_t)&type metadata for Any + 8);
    id v79 = v107;
    v107[0] = v73;
    uint64_t v80 = &v106;
    uint64_t v106 = v74;
    uint64_t v77 = &v105;
    uint64_t v105 = v75;
    unsigned int v76 = 0;
    sub_10013E76C(0LL, v107);
    sub_10013E76C(v76, v79);
    uint64_t v104 = v103;
    uint64_t v78 = &v28;
    __chkstk_darwin();
    unint64_t v5 = v80;
    uint64_t v6 = &v28 - 6;
    uint32_t v81 = &v28 - 6;
    id v6[2] = (uint64_t)v79;
    v6[3] = (uint64_t)v5;
    v6[4] = v7;
    uint64_t v82 = sub_10013CCA8(&qword_100221758);
    unint64_t v8 = sub_100144170();
    Sequence.forEach(_:)(sub_1001442F8, v81, v82, v8);
    uint64_t v83 = v4;
    if (v4)
    {
      __break(1u);
    }

    else
    {
      _os_log_impl((void *)&_mh_execute_header, v102, (os_log_type_t)v101, "Present user profile tip", v73, v98);
      uint64_t v69 = 0LL;
      sub_10013E7C4(v74, 0LL);
      sub_10013E7C4(v75, v69);
      UnsafeMutablePointer.deallocate()();
      swift_bridgeObjectRelease(v103);
      uint64_t v70 = v83;
    }
  }

  else
  {
    swift_bridgeObjectRelease(v103);
    uint64_t v70 = v84;
  }

  uint64_t v66 = v70;

  uint64_t v67 = (void (*)(char *, uint64_t))v91[1];
  v67(v90, v92);
  id v68 = sub_10013FAFC();
  if (!v68)
  {
LABEL_25:
    uint64_t v20 = v88;
    uint64_t v21 = sub_1001449F0();
    uint64_t v22 = v93(v20, v21, v92);
    uint64_t v44 = (os_log_s *)Logger.logObject.getter(v22);
    int v43 = static os_log_type_t.default.getter();
    uint64_t v128 = 2LL;
    UnsignedInteger<>.init<A>(_:)(&v128, &type metadata for UInt32, &type metadata for Int, v94, v95, v97);
    uint32_t v42 = v129;
    uint64_t v45 = _allocateUninitializedArray<A>(_:)(0LL);
    if (os_log_type_enabled(v44, (os_log_type_t)v43))
    {
      uint64_t v23 = v66;
      uint64_t v32 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)(2LL, &type metadata for UInt8);
      uint64_t v30 = sub_10013CCA8(&qword_1002216C8);
      uint64_t v31 = 0LL;
      uint64_t v33 = sub_10013E714(0LL, v30, v30);
      uint64_t v34 = sub_10013E714(v31, (uint64_t)&type metadata for Any + 8, (uint64_t)&type metadata for Any + 8);
      uint64_t v38 = &v127;
      v127 = v32;
      uint64_t v39 = &v126;
      uint64_t v126 = v33;
      uint64_t v36 = &v125;
      uint64_t v125 = v34;
      unsigned int v35 = 0;
      sub_10013E76C(0LL, &v127);
      sub_10013E76C(v35, v38);
      uint64_t v124 = v45;
      uint64_t v37 = &v28;
      __chkstk_darwin();
      uint64_t v24 = v39;
      uint64_t v25 = &v28 - 6;
      uint64_t v40 = &v28 - 6;
      v25[2] = (uint64_t)v38;
      v25[3] = (uint64_t)v24;
      v25[4] = v26;
      uint64_t v41 = sub_10013CCA8(&qword_100221758);
      unint64_t v27 = sub_100144170();
      Sequence.forEach(_:)(sub_100144144, v40, v41, v27);
      if (v23)
      {
        __break(1u);
      }

      else
      {
        _os_log_impl( (void *)&_mh_execute_header,  v44,  (os_log_type_t)v43,  "Failed to meet preconditions to display user profile tip",  v32,  v42);
        uint64_t v29 = 0LL;
        sub_10013E7C4(v33, 0LL);
        sub_10013E7C4(v34, v29);
        UnsafeMutablePointer.deallocate()();
        swift_bridgeObjectRelease(v45);
      }
    }

    else
    {
      swift_bridgeObjectRelease(v45);
    }

    v67(v88, v92);
    return;
  }

  id v65 = v68;
  id v64 = v68;
  id v123 = v68;
  id v122 = [v68 view];
  BOOL v63 = v122 != 0LL;
  BOOL v62 = v63;
  sub_100144254(&v122);
  if (!v62 || (id v61 = sub_10013FCFC()) == 0LL)
  {

    goto LABEL_25;
  }

  id v60 = v61;
  id v55 = v61;
  id v121 = v61;
  uint64_t v58 = v118;
  sub_100140554(v85 + OBJC_IVAR____TtC17TVSystemUIService14TVSSTipManager_tip, (uint64_t)v118);
  uint64_t v57 = v119;
  uint64_t v56 = v120;
  sub_10014427C(v58, v119);
  int v59 = Tip.shouldDisplay.getter(v57, v56);
  sub_1001405FC(v58);
  if ((v59 & 1) == 0 || (v117 = sub_100140200(), v54 = v117 == 0LL, BOOL v53 = v54, sub_1001442D0(&v117), !v53))
  {

    goto LABEL_25;
  }

  type metadata accessor for TipUIPopoverViewController(0LL);
  uint32_t v50 = v116;
  sub_100140554(v85 + OBJC_IVAR____TtC17TVSystemUIService14TVSSTipManager_tip, (uint64_t)v116);
  id v9 = v55;
  uint64_t v10 = sub_100142488();
  uint64_t v51 = (void *)TipUIPopoverViewController.__allocating_init(_:sourceItem:actionHandler:)(v50, v55, v10, v11);
  v115 = v51;
  id v12 = v51;
  [v55 frame];
  double v111 = v13;
  double v112 = v14;
  double v113 = v15;
  double v114 = v16;
  CGFloat v109 = sub_100142498(v13, v14, v15, v16);
  uint64_t v110 = 0LL;
  objc_msgSend(v51, "setPreferredContentSize:", v109, 0.0);

  id v52 = [v51 popoverPresentationController];
  id v108 = v52;
  id v17 = v52;
  if (v52)
  {
    id v49 = v52;
    id v48 = v52;
    [v52 setPermittedArrowDirections:sub_10013FEFC()];
  }

  id v18 = v52;
  if (v52)
  {
    id v47 = v52;
    id v46 = v52;
    v107[1] = 0LL;
    v107[2] = (_BYTE *)0xC049000000000000LL;
    v107[3] = 0LL;
    v107[4] = (_BYTE *)0xC049000000000000LL;
    objc_msgSend(v52, "setPopoverLayoutMargins:", 0.0, -50.0, 0.0, -50.0);
  }

  id v19 = v51;
  sub_100140264(v51);
  [v64 presentViewController:v51 animated:1 completion:0];
}

uint64_t (*sub_100142488())()
{
  return nullsub_3;
}

CGFloat sub_100142498(double a1, double a2, double a3, double a4)
{
  return CGRectGetWidth(*(CGRect *)&a1);
}

void sub_1001424D4()
{
  uint64_t v58 = 0LL;
  uint64_t v30 = 0LL;
  uint64_t v40 = 0LL;
  uint64_t v35 = type metadata accessor for Logger(0LL);
  uint64_t v34 = *(void *)(v35 - 8);
  unint64_t v32 = (*(void *)(v34 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  __chkstk_darwin();
  uint64_t v0 = (char *)&v12 - v32;
  uint64_t v33 = (char *)&v12 - v32;
  uint64_t v58 = v1;
  uint64_t v2 = sub_1001449F0();
  uint64_t v3 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v34 + 16))(v0, v2, v35);
  uint32_t v42 = (os_log_s *)Logger.logObject.getter(v3);
  int v41 = static os_log_type_t.default.getter();
  uint64_t v38 = &v56;
  uint64_t v56 = 2LL;
  unint64_t v36 = sub_10013E5DC();
  unint64_t v37 = sub_10013E644();
  unint64_t v4 = sub_10013E6AC();
  UnsignedInteger<>.init<A>(_:)(v38, &type metadata for UInt32, &type metadata for Int, v36, v37, v4);
  uint32_t v39 = v57;
  sub_10013CCA8(&qword_1002216C0);
  uint64_t v43 = _allocateUninitializedArray<A>(_:)(v40);
  if (os_log_type_enabled(v42, (os_log_type_t)v41))
  {
    uint64_t v5 = v30;
    uint64_t v20 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)(2LL, &type metadata for UInt8);
    uint64_t v18 = sub_10013CCA8(&qword_1002216C8);
    uint64_t v19 = 0LL;
    uint64_t v21 = sub_10013E714(0LL, v18, v18);
    uint64_t v22 = sub_10013E714(v19, (uint64_t)&type metadata for Any + 8, (uint64_t)&type metadata for Any + 8);
    uint64_t v26 = (id *)&v47;
    id v47 = v20;
    unint64_t v27 = &v46;
    uint64_t v46 = v21;
    uint64_t v24 = &v45;
    uint64_t v45 = v22;
    unsigned int v23 = 0;
    sub_10013E76C(0LL, &v47);
    sub_10013E76C(v23, (_BYTE **)v26);
    uint64_t v44 = v43;
    uint64_t v25 = &v12;
    __chkstk_darwin();
    uint64_t v6 = v27;
    uint64_t v7 = &v12 - 6;
    uint64_t v28 = &v12 - 6;
    id v7[2] = v26;
    id v7[3] = (id *)v6;
    v7[4] = v8;
    uint64_t v29 = sub_10013CCA8(&qword_100221758);
    unint64_t v9 = sub_100144170();
    Sequence.forEach(_:)(sub_1001443EC, v28, v29, v9);
    if (v5)
    {
      __break(1u);
    }

    else
    {
      _os_log_impl((void *)&_mh_execute_header, v42, (os_log_type_t)v41, "Dismiss user profile tip", v20, v39);
      uint64_t v17 = 0LL;
      sub_10013E7C4(v21, 0LL);
      sub_10013E7C4(v22, v17);
      UnsafeMutablePointer.deallocate()();
      swift_bridgeObjectRelease(v43);
    }
  }

  else
  {
    swift_bridgeObjectRelease(v43);
  }

  (*(void (**)(char *, uint64_t))(v34 + 8))(v33, v35);
  id v55 = sub_10013FAFC();
  if (v55)
  {
    id v12 = &v55;
    id v16 = v55;
    id v10 = v55;
    sub_100144324(v12);
    uint64_t v14 = swift_allocObject(&unk_1001BC5D8, 24LL, 7LL);
    uint64_t v13 = v14 + 16;
    id v11 = v31;
    swift_unknownObjectWeakInit(v13, v31);

    swift_retain(v14);
    BOOL v53 = sub_100144388;
    uint64_t v54 = v14;
    aBlock = _NSConcreteStackBlock;
    int v49 = 1107296256;
    int v50 = 0;
    uint64_t v51 = sub_100142B88;
    id v52 = &unk_1001BC5F0;
    double v15 = _Block_copy(&aBlock);
    swift_release(v54);
    swift_release(v14);
    [v16 dismissViewControllerAnimated:1 completion:v15];
    _Block_release(v15);
  }

  else
  {
    sub_100144324(&v55);
  }

void sub_1001429CC(uint64_t a1)
{
  uint64_t v1 = a1 + 16;
  uint64_t v4 = a1 + 16;
  swift_beginAccess();
  Strong = (void *)swift_unknownObjectWeakLoadStrong(v1);
  swift_endAccess(v3);
  if (Strong)
  {
    sub_100140264(0LL);
  }

uint64_t sub_100142A78()
{
  if (!"TVSystemUIService.TVSSTipManager")
  {
    char v1 = 2;
    _assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "Unexpectedly found nil while unwrapping an Optional value",  57LL,  2LL,  "Swift/StaticString.swift",  24LL,  v1,  136LL,  0);
    __break(1u);
  }

  uint64_t result = sub_100143030( (uint64_t)"TVSystemUIService.TVSSTipManager",  32LL,  (unint64_t)"init()",  6LL,  2,  (unint64_t)"TVSystemUIService/TVSSTipManager.swift",  38LL,  2,  v2,  0x15uLL,  7uLL);
  __break(1u);
  return result;
}

uint64_t sub_100142B88(uint64_t a1)
{
  uint64_t v3 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  uint64_t v1 = swift_retain(v4);
  v3(v1);
  return swift_release(v4);
}

id sub_100142BF0()
{
  uint64_t v3 = v0;
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for TVSSTipManager();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t sub_100142CBC(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  return a3();
}

uint64_t sub_100142CEC(uint64_t (*a1)(uint64_t *, uint64_t), uint64_t a2, unsigned int a3)
{
  if (a3 < 0x80uLL)
  {
    if (a3 > 0xFF) {
      goto LABEL_12;
    }
    unsigned int v6 = (a3 + 1);
  }

  else
  {
    int v8 = (a3 & 0x3F) << 8;
    if (a3 >> 6 < 0x20uLL)
    {
      unsigned int v6 = (v8 | (a3 >> 6)) + 33217;
    }

    else
    {
      int v7 = (v8 | (a3 >> 6) & 0x3F) << 8;
      if (a3 >> 12 < 0x10uLL) {
        unsigned int v6 = (v7 | (a3 >> 12)) + 8487393;
      }
      else {
        unsigned int v6 = ((a3 >> 18) | ((v7 | (a3 >> 12) & 0x3F) << 8)) - 2122219023;
      }
    }
  }

  uint64_t v5 = 4 - ((uint64_t)__clz(v6) >> 3);
  uint64_t v9 = (v6 - 0x101010101010101LL) & ((1LL << ((8 * v5) & 0x3F)) - 1);
  if (v5 >= 0) {
    return a1(&v9, v5);
  }
  _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeBufferPointer with negative count",  39LL,  2LL,  "Swift/UnsafeBufferPointer.swift",  31LL,  2,  1343LL,  0);
  __break(1u);
LABEL_12:
  LOBYTE(v4) = 2;
  uint64_t result = _assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "Not enough bits to represent the passed value",  45LL,  2LL,  "Swift/Integers.swift",  20LL,  v4,  3455LL,  0);
  __break(1u);
  return result;
}

uint64_t sub_100143030@<X0>( uint64_t a1@<X0>, uint64_t a2@<X1>, unint64_t a3@<X2>, uint64_t a4@<X3>, char a5@<W4>, unint64_t a6@<X5>, uint64_t a7@<X6>, int a8@<W7>, uint64_t a9@<X8>, unint64_t a10, unint64_t a11)
{
  uint64_t v19 = a9;
  uint64_t v20 = a1;
  uint64_t v21 = a2;
  unint64_t v22 = a3;
  uint64_t v23 = a4;
  unint64_t v24 = a6;
  uint64_t v25 = a7;
  int v26 = a8;
  unint64_t v27 = a10;
  unint64_t v28 = a11;
  uint64_t v29 = "Fatal error";
  uint64_t v30 = "Unexpectedly found nil while unwrapping an Optional value";
  id v31 = "Swift/StaticString.swift";
  unint64_t v32 = "Not enough bits to represent the passed value";
  uint64_t v33 = "Swift/Integers.swift";
  uint64_t v34 = "UnsafeBufferPointer with negative count";
  uint64_t v35 = "Swift/UnsafeBufferPointer.swift";
  uint64_t v36 = 0LL;
  unint64_t v38 = a6;
  uint64_t v39 = a7;
  char v40 = a8;
  uint64_t v41 = a1;
  uint64_t v42 = a2;
  unint64_t v43 = a10;
  unint64_t v44 = a11;
  if ((a5 & 1) != 0)
  {
    if (v22 <= 0xFFFFFFFF)
    {
      unsigned int v18 = v22;
      if ((v22 < 0xD800 || v18 > 0xDFFF) && v18 <= 0x10FFFF)
      {
        uint64_t v17 = &v16;
        __chkstk_darwin();
        uint64_t v14 = sub_100144418;
        double v15 = &v37;
        sub_100142CEC((uint64_t (*)(uint64_t *, uint64_t))sub_100144458, (uint64_t)&v13, v11);
        return (uint64_t)v17;
      }

      LOBYTE(v13) = 2;
      _assertionFailure(_:_:file:line:flags:)(v29, 11LL, 2LL, v30, 57LL, 2LL, v31, 24LL, v13, 148LL, 0);
      __break(1u);
    }

    LOBYTE(v13) = 2;
    _assertionFailure(_:_:file:line:flags:)(v29, 11LL, 2LL, v32, 45LL, 2LL, v33, 20LL, v13, 3455LL, 0);
    __break(1u);
  }

  if (v22) {
    uint64_t v45 = v22;
  }
  else {
    uint64_t v45 = 0LL;
  }
  uint64_t v16 = v45;
  if (!v45)
  {
    LOBYTE(v13) = 2;
    _assertionFailure(_:_:file:line:flags:)(v29, 11LL, 2LL, v30, 57LL, 2LL, v31, 24LL, v13, 136LL, 0);
    __break(1u);
  }

  if (v23 >= 0) {
    return sub_1001433F4(v16, v23, v24, v25, v26, v20, v21, v27, v19, v28);
  }
  LOBYTE(v13) = 2;
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)(v29, 11LL, 2LL, v34, 39LL, 2LL, v35, 31LL, v13, 1343LL, 0);
  __break(1u);
  return result;
}

uint64_t sub_1001433F4@<X0>( uint64_t a1@<X0>, uint64_t a2@<X1>, unint64_t a3@<X2>, uint64_t a4@<X3>, char a5@<W4>, uint64_t a6@<X5>, uint64_t a7@<X6>, unint64_t a8@<X7>, uint64_t a9@<X8>, unint64_t a10)
{
  uint64_t v19 = a9;
  uint64_t v20 = a1;
  uint64_t v21 = a2;
  unint64_t v22 = a3;
  uint64_t v23 = a4;
  uint64_t v24 = a6;
  uint64_t v25 = a7;
  unint64_t v26 = a8;
  unint64_t v27 = a10;
  unint64_t v28 = "Fatal error";
  uint64_t v29 = "Unexpectedly found nil while unwrapping an Optional value";
  uint64_t v30 = "Swift/StaticString.swift";
  id v31 = "Not enough bits to represent the passed value";
  unint64_t v32 = "Swift/Integers.swift";
  uint64_t v33 = "UnsafeBufferPointer with negative count";
  uint64_t v34 = "Swift/UnsafeBufferPointer.swift";
  uint64_t v35 = 0LL;
  uint64_t v37 = a6;
  uint64_t v38 = a7;
  uint64_t v39 = a1;
  uint64_t v40 = a2;
  unint64_t v41 = a8;
  unint64_t v42 = a10;
  if ((a5 & 1) != 0)
  {
    if (v22 <= 0xFFFFFFFF)
    {
      unsigned int v18 = v22;
      if ((v22 < 0xD800 || v18 > 0xDFFF) && v18 <= 0x10FFFF)
      {
        uint64_t v17 = &v15;
        __chkstk_darwin();
        int v13 = sub_100144480;
        uint64_t v14 = &v36;
        sub_100142CEC((uint64_t (*)(uint64_t *, uint64_t))sub_10014449C, (uint64_t)&v12, v10);
        return (uint64_t)v17;
      }

      LOBYTE(v12) = 2;
      _assertionFailure(_:_:file:line:flags:)(v28, 11LL, 2LL, v29, 57LL, 2LL, v30, 24LL, v12, 148LL, 0);
      __break(1u);
    }

    LOBYTE(v12) = 2;
    _assertionFailure(_:_:file:line:flags:)(v28, 11LL, 2LL, v31, 45LL, 2LL, v32, 20LL, v12, 3455LL, 0);
    __break(1u);
  }

  if (v22) {
    uint64_t v43 = v22;
  }
  else {
    uint64_t v43 = 0LL;
  }
  uint64_t v16 = v43;
  if (!v43)
  {
    LOBYTE(v12) = 2;
    _assertionFailure(_:_:file:line:flags:)(v28, 11LL, 2LL, v29, 57LL, 2LL, v30, 24LL, v12, 136LL, 0);
    __break(1u);
  }

  if (v23 >= 0) {
    return sub_100143788(v16, v23, v24, v25, v20, v21, v26, v27);
  }
  LOBYTE(v12) = 2;
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)(v28, 11LL, 2LL, v33, 39LL, 2LL, v34, 31LL, v12, 1343LL, 0);
  __break(1u);
  return result;
}

uint64_t sub_100143788( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, unint64_t a7, unint64_t a8)
{
  uint64_t v20 = a1;
  uint64_t v21 = a2;
  uint64_t v22 = a3;
  uint64_t v23 = a4;
  uint64_t v24 = a5;
  uint64_t v25 = a6;
  unint64_t v26 = a7;
  unint64_t v27 = a8;
  unint64_t v28 = "Fatal error";
  uint64_t v29 = "Not enough bits to represent the passed value";
  uint64_t v30 = "Swift/Integers.swift";
  id v31 = "Not enough bits to represent a signed value";
  unint64_t v32 = "Unexpectedly found nil while unwrapping an Optional value";
  uint64_t v33 = "Swift/AssertCommon.swift";
  if (a3)
  {
    uint64_t v19 = v22;
  }

  else
  {
    LOBYTE(v9) = 2;
    _assertionFailure(_:_:file:line:flags:)(v28, 11LL, 2LL, v32, 57LL, 2LL, v33, 24LL, v9, 230LL, 0);
    __break(1u);
  }

  uint64_t v18 = v19;
  if (v23 >= (uint64_t)0xFFFFFFFF80000000LL)
  {
    if (v23 <= 0x7FFFFFFF)
    {
      unsigned int v17 = v23;
      if (v24)
      {
        uint64_t v16 = v24;
      }

      else
      {
        LOBYTE(v9) = 2;
        _assertionFailure(_:_:file:line:flags:)(v28, 11LL, 2LL, v32, 57LL, 2LL, v33, 24LL, v9, 231LL, 0);
        __break(1u);
      }

      uint64_t v15 = v16;
      if (v25 >= (uint64_t)0xFFFFFFFF80000000LL)
      {
        if (v25 <= 0x7FFFFFFF)
        {
          unsigned int v14 = v25;
          if (v20)
          {
            uint64_t v13 = v20;
          }

          else
          {
            LOBYTE(v9) = 2;
            _assertionFailure(_:_:file:line:flags:)(v28, 11LL, 2LL, v32, 57LL, 2LL, v33, 24LL, v9, 232LL, 0);
            __break(1u);
          }

          uint64_t v12 = v13;
          if (v21 >= (uint64_t)0xFFFFFFFF80000000LL)
          {
            if (v21 <= 0x7FFFFFFF)
            {
              unsigned int v11 = v21;
              if (v26 <= 0xFFFFFFFF)
              {
                unsigned int v10 = v26;
                if (v27 <= 0xFFFFFFFF) {
                  return _swift_stdlib_reportUnimplementedInitializerInFile(v18, v17, v15, v14, v12, v11, v10, v27, 0);
                }
                LOBYTE(v9) = 2;
                _assertionFailure(_:_:file:line:flags:)(v28, 11LL, 2LL, v29, 45LL, 2LL, v30, 20LL, v9, 3455LL, 0);
                __break(1u);
              }

              LOBYTE(v9) = 2;
              _assertionFailure(_:_:file:line:flags:)(v28, 11LL, 2LL, v29, 45LL, 2LL, v30, 20LL, v9, 3455LL, 0);
              __break(1u);
            }

            LOBYTE(v9) = 2;
            _assertionFailure(_:_:file:line:flags:)(v28, 11LL, 2LL, v29, 45LL, 2LL, v30, 20LL, v9, 3687LL, 0);
            __break(1u);
          }

          LOBYTE(v9) = 2;
          _assertionFailure(_:_:file:line:flags:)(v28, 11LL, 2LL, v31, 43LL, 2LL, v30, 20LL, v9, 3681LL, 0);
          __break(1u);
        }

        LOBYTE(v9) = 2;
        _assertionFailure(_:_:file:line:flags:)(v28, 11LL, 2LL, v29, 45LL, 2LL, v30, 20LL, v9, 3687LL, 0);
        __break(1u);
      }

      LOBYTE(v9) = 2;
      _assertionFailure(_:_:file:line:flags:)(v28, 11LL, 2LL, v31, 43LL, 2LL, v30, 20LL, v9, 3681LL, 0);
      __break(1u);
    }

    LOBYTE(v9) = 2;
    _assertionFailure(_:_:file:line:flags:)(v28, 11LL, 2LL, v29, 45LL, 2LL, v30, 20LL, v9, 3687LL, 0);
    __break(1u);
  }

  LOBYTE(v9) = 2;
  uint64_t result = _assertionFailure(_:_:file:line:flags:)(v28, 11LL, 2LL, v31, 43LL, 2LL, v30, 20LL, v9, 3681LL, 0);
  __break(1u);
  return result;
}

uint64_t sub_100143CD0(uint64_t a1, int *a2)
{
  *(void *)(v2 + 16) = v2;
  uint64_t v5 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v3 = (void *)swift_task_alloc(a2[1]);
  *(void *)(v2 + 24) = v3;
  void *v3 = *(void *)(v2 + 16);
  v3[1] = sub_100143D54;
  return v5(a1);
}

uint64_t sub_100143D54()
{
  uint64_t v3 = *v0;
  uint64_t v1 = *(void *)(*v0 + 24);
  *(void *)(*v0 + 16) = *v0;
  swift_task_dealloc(v1);
  return (*(uint64_t (**)(void))(*(void *)(v3 + 16) + 8LL))();
}

uint64_t sub_100143DBC()
{
  return swift_deallocObject(v0, 17LL);
}

_BYTE **sub_100143DE4(_BYTE **a1, uint64_t a2, uint64_t a3)
{
  return sub_10013F71C(a1, a2, a3, *(_BYTE *)(v3 + 16));
}

uint64_t sub_100143DEC()
{
  return swift_deallocObject(v0, 17LL);
}

_BYTE **sub_100143E14(_BYTE **a1, uint64_t a2, uint64_t a3)
{
  return sub_10013F71C(a1, a2, a3, *(_BYTE *)(v3 + 16));
}

uint64_t sub_100143E1C()
{
  return swift_deallocObject(v2, 32LL);
}

uint64_t sub_100143E58()
{
  return sub_10013E83C(*(uint64_t (**)(void))(v0 + 16));
}

uint64_t sub_100143E64()
{
  return swift_deallocObject(v2, 32LL);
}

void *sub_100143EA0(void *a1, uint64_t a2, uint64_t *a3)
{
  return sub_10013E85C(a1, a2, a3, *(uint64_t (**)(void))(v3 + 16));
}

uint64_t sub_100143EAC()
{
  return swift_deallocObject(v2, 40LL);
}

uint64_t sub_100143EF0(uint64_t a1)
{
  *(void *)(v2 + 16) = v2;
  uint64_t v5 = v1[2];
  uint64_t v6 = v1[3];
  uint64_t v7 = v1[4];
  uint64_t v3 = (void *)swift_task_alloc(dword_10022174C);
  *(void *)(v2 + 24) = v3;
  void *v3 = *(void *)(v2 + 16);
  v3[1] = sub_100143F88;
  return sub_100140D70(a1, v5, v6, v7);
}

uint64_t sub_100143F88()
{
  uint64_t v3 = *v0;
  uint64_t v1 = *(void *)(*v0 + 24);
  *(void *)(*v0 + 16) = *v0;
  swift_task_dealloc(v1);
  return (*(uint64_t (**)(void))(*(void *)(v3 + 16) + 8LL))();
}

uint64_t sub_100143FE8()
{
  return swift_deallocObject(v2, 24LL);
}

uint64_t sub_100144024()
{
  return sub_100141A4C(*(void *)(v0 + 16));
}

uint64_t sub_10014402C()
{
  return swift_deallocObject(v0, 17LL);
}

_BYTE **sub_100144054(_BYTE **a1, uint64_t a2, uint64_t a3)
{
  return sub_10013F71C(a1, a2, a3, *(_BYTE *)(v3 + 16));
}

uint64_t sub_10014405C()
{
  return swift_deallocObject(v0, 17LL);
}

_BYTE **sub_100144084(_BYTE **a1, uint64_t a2, uint64_t a3)
{
  return sub_10013F71C(a1, a2, a3, *(_BYTE *)(v3 + 16));
}

uint64_t sub_10014408C()
{
  return swift_deallocObject(v2, 32LL);
}

uint64_t sub_1001440C8()
{
  return sub_10013E83C(*(uint64_t (**)(void))(v0 + 16));
}

uint64_t sub_1001440D4()
{
  return swift_deallocObject(v2, 32LL);
}

void *sub_100144110(void *a1, uint64_t a2, uint64_t *a3)
{
  return sub_10013E85C(a1, a2, a3, *(uint64_t (**)(void))(v3 + 16));
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> sub_10014411C( void *a1)
{
}

uint64_t sub_100144144(uint64_t (**a1)(uint64_t, uint64_t, uint64_t))
{
  return sub_10013E780(a1, v1[2], v1[3], v1[4]);
}

unint64_t sub_100144170()
{
  uint64_t v3 = qword_100221760;
  if (!qword_100221760)
  {
    uint64_t v0 = sub_1001441E0(&qword_100221758);
    unint64_t WitnessTable = swift_getWitnessTable(&protocol conformance descriptor for [A], v0);
    atomic_store(WitnessTable, (unint64_t *)&qword_100221760);
    return WitnessTable;
  }

  return v3;
}

uint64_t sub_1001441E0(uint64_t *a1)
{
  uint64_t v4 = *a1;
  if (*a1 < 0)
  {
    uint64_t TypeByMangledNameInContextInMetadataState2 = swift_getTypeByMangledNameInContextInMetadataState2( 255LL,  (char *)a1 + (int)*a1,  -(*a1 >> 32),  0LL);
    *a1 = TypeByMangledNameInContextInMetadataState2;
    return TypeByMangledNameInContextInMetadataState2;
  }

  return v4;
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> sub_100144254( id *a1)
{
}

void *sub_10014427C(void *result, uint64_t a2)
{
  int v2 = *(_DWORD *)(*(void *)(a2 - 8) + 80LL);
  if ((v2 & 0x20000) != 0) {
    return (void *)(*result + ((v2 + 16LL) & ~(unint64_t)v2));
  }
  return result;
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> sub_1001442D0( id *a1)
{
}

uint64_t sub_1001442F8(uint64_t (**a1)(uint64_t, uint64_t, uint64_t))
{
  return sub_10013E780(a1, v1[2], v1[3], v1[4]);
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> sub_100144324( id *a1)
{
}

uint64_t sub_10014434C()
{
  return swift_deallocObject(v2, 24LL);
}

void sub_100144388()
{
}

uint64_t sub_100144390(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 32);
  uint64_t v5 = *(void *)(a2 + 40);
  swift_retain(v5);
  uint64_t result = a1;
  *(void *)(a1 + 32) = v4;
  *(void *)(a1 + 40) = v5;
  return result;
}

uint64_t sub_1001443D4(uint64_t a1)
{
  return swift_release(*(void *)(a1 + 40));
}

uint64_t sub_1001443EC(uint64_t (**a1)(uint64_t, uint64_t, uint64_t))
{
  return sub_10013E780(a1, v1[2], v1[3], v1[4]);
}

uint64_t sub_100144418@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return sub_1001433F4( a1,  a2,  *(void *)(v3 + 16),  *(void *)(v3 + 24),  *(_BYTE *)(v3 + 32),  *(void *)(v3 + 40),  *(void *)(v3 + 48),  *(void *)(v3 + 56),  a3,  *(void *)(v3 + 64));
}

uint64_t sub_100144458(uint64_t a1, uint64_t a2)
{
  return sub_100142CBC(a1, a2, *(uint64_t (**)(void))(v2 + 16));
}

uint64_t sub_100144480(uint64_t a1, uint64_t a2)
{
  return sub_100143788( a1,  a2,  *(void *)(v2 + 16),  *(void *)(v2 + 24),  *(void *)(v2 + 32),  *(void *)(v2 + 40),  *(void *)(v2 + 48),  *(void *)(v2 + 56));
}

uint64_t sub_10014449C(uint64_t a1, uint64_t a2)
{
  return sub_100142CBC(a1, a2, *(uint64_t (**)(void))(v2 + 16));
}

uint64_t sub_1001444C4()
{
  return swift_deallocObject(v2, 40LL);
}

uint64_t sub_100144508(uint64_t a1)
{
  *(void *)(v2 + swift_unknownObjectWeakDestroy(v0 + 16) = v2;
  uint64_t v5 = *(int **)(v1 + 24);
  uint64_t v3 = (void *)swift_task_alloc(dword_10022179C);
  *(void *)(v2 + 24) = v3;
  void *v3 = *(void *)(v2 + 16);
  v3[1] = sub_1001445BC;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_100221798 + dword_100221798))(a1, v5);
}

uint64_t sub_1001445BC()
{
  uint64_t v3 = *v0;
  uint64_t v1 = *(void *)(*v0 + 24);
  *(void *)(*v0 + swift_unknownObjectWeakDestroy(v0 + 16) = *v0;
  swift_task_dealloc(v1);
  return (*(uint64_t (**)(void))(*(void *)(v3 + 16) + 8LL))();
}

uint64_t sub_10014461C()
{
  return String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("control-center-user-profile-tip", 0x1FuLL, 1)._countAndFlagsBits;
}

uint64_t sub_100144648()
{
  Swift::String v0 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("TVSSUserProfileTipTitle", 0x17uLL, 1);
  uint64_t v1 = LocalizedStringKey.init(stringLiteral:)(v0._countAndFlagsBits, v0._object);
  return Text.init(_:tableName:bundle:comment:)(v1);
}

uint64_t sub_100144718()
{
  Swift::String v0 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("TVSSUserProfileTipMessage", 0x19uLL, 1);
  uint64_t v1 = LocalizedStringKey.init(stringLiteral:)(v0._countAndFlagsBits, v0._object);
  return Text.init(_:tableName:bundle:comment:)(v1);
}

uint64_t sub_1001447C0()
{
  uint64_t v4 = type metadata accessor for ImageResource(0LL);
  uint64_t v3 = *(void *)(v4 - 8);
  unint64_t v2 = (*(void *)(v3 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  __chkstk_darwin();
  uint64_t v5 = (char *)&v2 - v2;
  uint64_t v0 = sub_100145304();
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v0, v4);
  return Image.init(_:)(v5);
}

uint64_t sub_100144848()
{
  return sub_10014461C();
}

uint64_t sub_10014485C()
{
  return sub_100144648();
}

uint64_t sub_1001448C0()
{
  return sub_100144718();
}

uint64_t sub_1001448D4()
{
  return sub_1001447C0();
}

uint64_t sub_1001448E8()
{
  return Tip.actions.getter();
}

uint64_t sub_1001448FC()
{
  return Tip.rules.getter();
}

uint64_t sub_100144910()
{
  return Tip.options.getter();
}

uint64_t sub_100144924@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_10014461C();
  *a1 = result;
  a1[1] = v2;
  return result;
}

void *type metadata accessor for TVSSUserProfileTip()
{
  return &unk_1001BC650;
}

void *sub_100144964()
{
  return &protocol witness table for String;
}

unint64_t sub_100144970()
{
  return sub_100144984();
}

unint64_t sub_100144984()
{
  uint64_t v2 = qword_1002217B8;
  if (!qword_1002217B8)
  {
    unint64_t WitnessTable = swift_getWitnessTable(&unk_10016C304, &unk_1001BC650);
    atomic_store(WitnessTable, (unint64_t *)&qword_1002217B8);
    return WitnessTable;
  }

  return v2;
}

uint64_t sub_1001449F0()
{
  if (qword_100221558 != -1) {
    ((void (*)(uint64_t *, uint64_t (*)()))swift_once)(&qword_100221558, sub_100144A50);
  }
  uint64_t v0 = type metadata accessor for Logger(0LL);
  return sub_100144B3C(v0, (uint64_t)qword_1002221D0);
}

uint64_t sub_100144A50()
{
  uint64_t v2 = type metadata accessor for Logger(0LL);
  sub_100144B7C(v2, qword_1002221D0);
  sub_100144B3C(v2, (uint64_t)qword_1002221D0);
  id v3 = TipsLog();
  if (v3) {
    return Logger.init(_:)(v3);
  }
  char v1 = 2;
  _assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "Unexpectedly found nil while implicitly unwrapping an Optional value",  68LL,  2LL,  "TVSystemUIService/TVSSTips.swift",  32LL,  v1,  20LL,  0);
  __break(1u);
  return ((uint64_t (*)())Logger.init(_:))();
}

uint64_t sub_100144B3C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = a2;
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80LL) & 0x20000) != 0) {
    return *(void *)a2;
  }
  return v3;
}

uint64_t sub_100144B7C(uint64_t a1, uint64_t *a2)
{
  uint64_t v5 = a2;
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80LL) & 0x20000) != 0)
  {
    uint64_t v2 = swift_slowAlloc( *(void *)(*(void *)(a1 - 8) + 64LL),  *(_DWORD *)(*(void *)(a1 - 8) + 80LL));
    *a2 = v2;
    return v2;
  }

  return (uint64_t)v5;
}

uint64_t sub_100144BEC()
{
  uint64_t v32 = 0LL;
  uint64_t v18 = 0LL;
  uint64_t v11 = type metadata accessor for Tips.ConfigurationOption.AnalyticsEngine();
  uint64_t v12 = *(void *)(v11 - 8);
  unint64_t v13 = (*(void *)(v12 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  uint64_t v0 = __chkstk_darwin(0LL);
  unsigned int v14 = (char *)v8 - v13;
  uint64_t v15 = type metadata accessor for Tips.ConfigurationOption.DatastoreLocation(v0);
  uint64_t v16 = *(void *)(v15 - 8);
  unint64_t v17 = (*(void *)(v16 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  uint64_t v1 = __chkstk_darwin(v18);
  unint64_t v26 = (char *)v8 - v17;
  uint64_t v24 = type metadata accessor for Tips.ConfigurationOption.DisplayFrequency(v1);
  uint64_t v22 = *(void *)(v24 - 8);
  unint64_t v19 = (*(void *)(v22 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  uint64_t v2 = __chkstk_darwin(v18);
  uint64_t v23 = (char *)v8 - v19;
  uint64_t v32 = v3;
  uint64_t v25 = type metadata accessor for Tips.ConfigurationOption(v2);
  uint64_t v20 = _allocateUninitializedArray<A>(_:)(3LL);
  uint64_t v21 = v4;
  static Tips.ConfigurationOption.DisplayFrequency.system.getter();
  static Tips.ConfigurationOption.displayFrequency(_:)(v23);
  (*(void (**)(char *, uint64_t))(v22 + 8))(v23, v24);
  uint64_t v27 = *(void *)(v25 - 8);
  uint64_t v28 = *(void *)(v27 + 72);
  uint64_t v29 = v28;
  static Tips.ConfigurationOption.DatastoreLocation.tipsGroupContainer.getter();
  uint64_t v30 = 0LL;
  uint64_t v31 = 0LL;
  static Tips.ConfigurationOption.datastoreLocation(_:)(v26);
  uint64_t v5 = (*(uint64_t (**)(char *, uint64_t))(v16 + 8))(v26, v15);
  id v8[4] = v21 + 2 * v28;
  static Tips.ConfigurationOption.AnalyticsEngine.coreAnalytics.getter(v5);
  static Tips.ConfigurationOption.analyticsEngine(_:)(v14);
  (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  uint64_t v6 = v20;
  sub_10013E59C();
  uint64_t v9 = v6;
  static Tips.configure(_:)();
  uint64_t v10 = 0LL;
  return swift_bridgeObjectRelease(v9);
}

uint64_t sub_100144EE4()
{
  return nullsub_4();
}

uint64_t sub_100144EF8()
{
  if (qword_100221560 != -1) {
    swift_once(&qword_100221560, sub_100144EE4);
  }
  return v1;
}

id sub_100144F48()
{
  id result = sub_100144F64();
  qword_1002221E8 = (uint64_t)result;
  return result;
}

id sub_100144F64()
{
  id v1[3] = &unk_1001BC650;
  v1[4] = sub_10014529C();
  return sub_10014036C(v1);
}

uint64_t *sub_100144FBC()
{
  if (qword_100221568 != -1) {
    swift_once(&qword_100221568, sub_100144F48);
  }
  return &qword_1002221E8;
}

id sub_100145010()
{
  uint64_t v5 = 0LL;
  uint64_t v2 = (id *)sub_100144FBC();
  swift_beginAccess();
  id v3 = *v2;
  id v0 = *v2;
  swift_endAccess(v4);
  return v3;
}

void sub_1001450A4(void *a1)
{
  uint64_t v6 = 0LL;
  uint64_t v7 = a1;
  id v3 = sub_100144FBC();
  id v1 = a1;
  swift_beginAccess(v3);
  uint64_t v2 = (void *)*v3;
  uint64_t *v3 = (uint64_t)a1;

  swift_endAccess(v5);
}

id sub_10014516C()
{
  return [objc_allocWithZone(v0) init];
}

id sub_100145190()
{
  id v4 = 0LL;
  v3.receiver = 0LL;
  v3.super_class = (Class)type metadata accessor for TVSSTips();
  id v2 = objc_msgSendSuper2(&v3, "init");
  id v0 = v2;
  id v4 = v2;

  return v2;
}

uint64_t type metadata accessor for TVSSTips()
{
  return objc_opt_self(&OBJC_CLASS____TtC17TVSystemUIService8TVSSTips);
}

id sub_100145240()
{
  objc_super v3 = v0;
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for TVSSTips();
  return objc_msgSendSuper2(&v2, "dealloc");
}

  ;
}

unint64_t sub_10014529C()
{
  uint64_t v2 = qword_1002217E8;
  if (!qword_1002217E8)
  {
    unint64_t WitnessTable = swift_getWitnessTable(&unk_10016C33C, &unk_1001BC650);
    atomic_store(WitnessTable, (unint64_t *)&qword_1002217E8);
    return WitnessTable;
  }

  return v2;
}

uint64_t sub_100145304()
{
  if (qword_1002215C0 != -1) {
    swift_once(&qword_1002215C0, sub_100145D48);
  }
  uint64_t v0 = type metadata accessor for ImageResource(0LL);
  return sub_100144B3C(v0, (uint64_t)qword_1002222C8);
}

uint64_t sub_100145364()
{
  return v0;
}

uint64_t sub_100145388()
{
  uint64_t v0 = sub_100145364();
  return swift_deallocClassInstance(v0, 16LL, 7LL);
}

uint64_t sub_1001453C4()
{
  return sub_1001453FC();
}

uint64_t sub_1001453FC()
{
  return v0;
}

id sub_100145420()
{
  id result = sub_100145464();
  qword_1002217F0 = (uint64_t)result;
  return result;
}

id sub_100145464()
{
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  return [(id)swift_getObjCClassFromMetadata() bundleForClass:ObjCClassFromMetadata];
}

uint64_t *sub_1001454A8()
{
  if (qword_100221570 != -1) {
    swift_once(&qword_100221570, sub_100145420);
  }
  return &qword_1002217F0;
}

uint64_t sub_1001454FC()
{
  uint64_t v3 = type metadata accessor for ImageResource(0LL);
  sub_100144B7C(v3, qword_1002221F0);
  sub_100144B3C(v3, (uint64_t)qword_1002221F0);
  Swift::String v0 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("DolbyAtmos", 0xAuLL, 1);
  id v4 = (void *)*sub_1001454A8();
  id v1 = v4;
  return ImageResource.init(name:bundle:)(v0._countAndFlagsBits, v0._object, v4);
}

uint64_t sub_100145588()
{
  if (qword_100221578 != -1) {
    swift_once(&qword_100221578, sub_1001454FC);
  }
  uint64_t v0 = type metadata accessor for ImageResource(0LL);
  return sub_100144B3C(v0, (uint64_t)qword_1002221F0);
}

uint64_t sub_1001455E8()
{
  uint64_t v3 = type metadata accessor for ImageResource(0LL);
  sub_100144B7C(v3, qword_100222208);
  sub_100144B3C(v3, (uint64_t)qword_100222208);
  Swift::String v0 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("NoUserAvatarCloud", 0x11uLL, 1);
  id v4 = (void *)*sub_1001454A8();
  id v1 = v4;
  return ImageResource.init(name:bundle:)(v0._countAndFlagsBits, v0._object, v4);
}

uint64_t sub_100145674()
{
  if (qword_100221580 != -1) {
    swift_once(&qword_100221580, sub_1001455E8);
  }
  uint64_t v0 = type metadata accessor for ImageResource(0LL);
  return sub_100144B3C(v0, (uint64_t)qword_100222208);
}

uint64_t sub_1001456D4()
{
  uint64_t v3 = type metadata accessor for ImageResource(0LL);
  sub_100144B7C(v3, qword_100222220);
  sub_100144B3C(v3, (uint64_t)qword_100222220);
  Swift::String v0 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("clockhand", 9uLL, 1);
  id v4 = (void *)*sub_1001454A8();
  id v1 = v4;
  return ImageResource.init(name:bundle:)(v0._countAndFlagsBits, v0._object, v4);
}

uint64_t sub_100145760()
{
  if (qword_100221588 != -1) {
    swift_once(&qword_100221588, sub_1001456D4);
  }
  uint64_t v0 = type metadata accessor for ImageResource(0LL);
  return sub_100144B3C(v0, (uint64_t)qword_100222220);
}

uint64_t sub_1001457C0()
{
  uint64_t v3 = type metadata accessor for ImageResource(0LL);
  sub_100144B7C(v3, qword_100222238);
  sub_100144B3C(v3, (uint64_t)qword_100222238);
  Swift::String v0 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("game_controller", 0xFuLL, 1);
  id v4 = (void *)*sub_1001454A8();
  id v1 = v4;
  return ImageResource.init(name:bundle:)(v0._countAndFlagsBits, v0._object, v4);
}

uint64_t sub_10014584C()
{
  if (qword_100221590 != -1) {
    swift_once(&qword_100221590, sub_1001457C0);
  }
  uint64_t v0 = type metadata accessor for ImageResource(0LL);
  return sub_100144B3C(v0, (uint64_t)qword_100222238);
}

uint64_t sub_1001458AC()
{
  uint64_t v3 = type metadata accessor for ImageResource(0LL);
  sub_100144B7C(v3, qword_100222250);
  sub_100144B3C(v3, (uint64_t)qword_100222250);
  Swift::String v0 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("menubar_battery", 0xFuLL, 1);
  id v4 = (void *)*sub_1001454A8();
  id v1 = v4;
  return ImageResource.init(name:bundle:)(v0._countAndFlagsBits, v0._object, v4);
}

uint64_t sub_100145938()
{
  if (qword_100221598 != -1) {
    swift_once(&qword_100221598, sub_1001458AC);
  }
  uint64_t v0 = type metadata accessor for ImageResource(0LL);
  return sub_100144B3C(v0, (uint64_t)qword_100222250);
}

uint64_t sub_100145998()
{
  uint64_t v3 = type metadata accessor for ImageResource(0LL);
  sub_100144B7C(v3, qword_100222268);
  sub_100144B3C(v3, (uint64_t)qword_100222268);
  Swift::String v0 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("menubar_battery_controller", 0x1AuLL, 1);
  id v4 = (void *)*sub_1001454A8();
  id v1 = v4;
  return ImageResource.init(name:bundle:)(v0._countAndFlagsBits, v0._object, v4);
}

uint64_t sub_100145A24()
{
  if (qword_1002215A0 != -1) {
    swift_once(&qword_1002215A0, sub_100145998);
  }
  uint64_t v0 = type metadata accessor for ImageResource(0LL);
  return sub_100144B3C(v0, (uint64_t)qword_100222268);
}

uint64_t sub_100145A84()
{
  uint64_t v3 = type metadata accessor for ImageResource(0LL);
  sub_100144B7C(v3, qword_100222280);
  sub_100144B3C(v3, (uint64_t)qword_100222280);
  Swift::String v0 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("menubar_battery_remote", 0x16uLL, 1);
  id v4 = (void *)*sub_1001454A8();
  id v1 = v4;
  return ImageResource.init(name:bundle:)(v0._countAndFlagsBits, v0._object, v4);
}

uint64_t sub_100145B10()
{
  if (qword_1002215A8 != -1) {
    swift_once(&qword_1002215A8, sub_100145A84);
  }
  uint64_t v0 = type metadata accessor for ImageResource(0LL);
  return sub_100144B3C(v0, (uint64_t)qword_100222280);
}

uint64_t sub_100145B70()
{
  uint64_t v3 = type metadata accessor for ImageResource(0LL);
  sub_100144B7C(v3, qword_100222298);
  sub_100144B3C(v3, (uint64_t)qword_100222298);
  Swift::String v0 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("menubar_battery_remote2", 0x17uLL, 1);
  id v4 = (void *)*sub_1001454A8();
  id v1 = v4;
  return ImageResource.init(name:bundle:)(v0._countAndFlagsBits, v0._object, v4);
}

uint64_t sub_100145BFC()
{
  if (qword_1002215B0 != -1) {
    swift_once(&qword_1002215B0, sub_100145B70);
  }
  uint64_t v0 = type metadata accessor for ImageResource(0LL);
  return sub_100144B3C(v0, (uint64_t)qword_100222298);
}

uint64_t sub_100145C5C()
{
  uint64_t v3 = type metadata accessor for ImageResource(0LL);
  sub_100144B7C(v3, qword_1002222B0);
  sub_100144B3C(v3, (uint64_t)qword_1002222B0);
  Swift::String v0 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("menubar_battery_remote3", 0x17uLL, 1);
  id v4 = (void *)*sub_1001454A8();
  id v1 = v4;
  return ImageResource.init(name:bundle:)(v0._countAndFlagsBits, v0._object, v4);
}

uint64_t sub_100145CE8()
{
  if (qword_1002215B8 != -1) {
    swift_once(&qword_1002215B8, sub_100145C5C);
  }
  uint64_t v0 = type metadata accessor for ImageResource(0LL);
  return sub_100144B3C(v0, (uint64_t)qword_1002222B0);
}

uint64_t sub_100145D48()
{
  uint64_t v3 = type metadata accessor for ImageResource(0LL);
  sub_100144B7C(v3, qword_1002222C8);
  sub_100144B3C(v3, (uint64_t)qword_1002222C8);
  Swift::String v0 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("add.fam.member", 0xEuLL, 1);
  id v4 = (void *)*sub_1001454A8();
  id v1 = v4;
  return ImageResource.init(name:bundle:)(v0._countAndFlagsBits, v0._object, v4);
}

uint64_t sub_100145DD4()
{
  uint64_t v3 = type metadata accessor for ImageResource(0LL);
  sub_100144B7C(v3, qword_1002222E0);
  sub_100144B3C(v3, (uint64_t)qword_1002222E0);
  Swift::String v0 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("person.headtrack.fill", 0x15uLL, 1);
  id v4 = (void *)*sub_1001454A8();
  id v1 = v4;
  return ImageResource.init(name:bundle:)(v0._countAndFlagsBits, v0._object, v4);
}

uint64_t sub_100145E60()
{
  if (qword_1002215C8 != -1) {
    swift_once(&qword_1002215C8, sub_100145DD4);
  }
  uint64_t v0 = type metadata accessor for ImageResource(0LL);
  return sub_100144B3C(v0, (uint64_t)qword_1002222E0);
}

uint64_t sub_100145EC0()
{
  uint64_t v3 = type metadata accessor for ImageResource(0LL);
  sub_100144B7C(v3, qword_1002222F8);
  sub_100144B3C(v3, (uint64_t)qword_1002222F8);
  Swift::String v0 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("ttr.fill", 8uLL, 1);
  id v4 = (void *)*sub_1001454A8();
  id v1 = v4;
  return ImageResource.init(name:bundle:)(v0._countAndFlagsBits, v0._object, v4);
}

uint64_t sub_100145F4C()
{
  if (qword_1002215D0 != -1) {
    swift_once(&qword_1002215D0, sub_100145EC0);
  }
  uint64_t v0 = type metadata accessor for ImageResource(0LL);
  return sub_100144B3C(v0, (uint64_t)qword_1002222F8);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return objc_opt_self(&OBJC_CLASS____TtC17TVSystemUIServiceP33_21BFFA1AC3EB327B945A0F0D4CD0BDFF19ResourceBundleClass);
}

unint64_t sub_100145FD0()
{
  uint64_t v3 = qword_100221890;
  if (!qword_100221890)
  {
    uint64_t v0 = objc_opt_self(&OBJC_CLASS___NSBundle);
    unint64_t ObjCClassMetadata = swift_getObjCClassMetadata(v0);
    atomic_store(ObjCClassMetadata, (unint64_t *)&qword_100221890);
    return ObjCClassMetadata;
  }

  return v3;
}

id objc_msgSend_CGColor(void *a1, const char *a2, ...)
{
  return _[a1 CGColor];
}

id objc_msgSend_CGContext(void *a1, const char *a2, ...)
{
  return _[a1 CGContext];
}

id objc_msgSend_CGImageForDescriptor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "CGImageForDescriptor:");
}

id objc_msgSend_CGPath(void *a1, const char *a2, ...)
{
  return _[a1 CGPath];
}

id objc_msgSend_CGSizeValue(void *a1, const char *a2, ...)
{
  return _[a1 CGSizeValue];
}

id objc_msgSend_RJ45EthernetInterface(void *a1, const char *a2, ...)
{
  return _[a1 RJ45EthernetInterface];
}

id objc_msgSend_URLForResource_withExtension_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "URLForResource:withExtension:");
}

id objc_msgSend_URLWithString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "URLWithString:");
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return _[a1 UTF8String];
}

id objc_msgSend_UUID(void *a1, const char *a2, ...)
{
  return _[a1 UUID];
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return _[a1 UUIDString];
}

id objc_msgSend_VPN(void *a1, const char *a2, ...)
{
  return _[a1 VPN];
}

id objc_msgSend_WiFiInterface(void *a1, const char *a2, ...)
{
  return _[a1 WiFiInterface];
}

id objc_msgSend__FBSScene(void *a1, const char *a2, ...)
{
  return _[a1 _FBSScene];
}

id objc_msgSend__acquireVolumeButtonAssertion(void *a1, const char *a2, ...)
{
  return _[a1 _acquireVolumeButtonAssertion];
}

id objc_msgSend__acquireVolumeHUDAssertion(void *a1, const char *a2, ...)
{
  return _[a1 _acquireVolumeHUDAssertion];
}

id objc_msgSend__activate(void *a1, const char *a2, ...)
{
  return _[a1 _activate];
}

id objc_msgSend__activeActivityAttributionsFromDomianData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_activeActivityAttributionsFromDomianData:");
}

id objc_msgSend__activityAttribution(void *a1, const char *a2, ...)
{
  return _[a1 _activityAttribution];
}

id objc_msgSend__addAttributionIfMatched_force_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_addAttributionIfMatched:force:");
}

id objc_msgSend__addObservationsForDataSource_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_addObservationsForDataSource:");
}

id objc_msgSend__advanceAnimationState(void *a1, const char *a2, ...)
{
  return _[a1 _advanceAnimationState];
}

id objc_msgSend__analyticsForegroundAppFromBundleID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_analyticsForegroundAppFromBundleID:");
}

id objc_msgSend__areRestrictionsEnabled(void *a1, const char *a2, ...)
{
  return _[a1 _areRestrictionsEnabled];
}

id objc_msgSend__assetsBundle(void *a1, const char *a2, ...)
{
  return _[a1 _assetsBundle];
}

id objc_msgSend__avPlayerForRouteUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_avPlayerForRouteUID:");
}

id objc_msgSend__availablePanelsFromCurrentMenuItems(void *a1, const char *a2, ...)
{
  return _[a1 _availablePanelsFromCurrentMenuItems];
}

id objc_msgSend__baseAnalyticsDictionaryFromCurrentState(void *a1, const char *a2, ...)
{
  return _[a1 _baseAnalyticsDictionaryFromCurrentState];
}

id objc_msgSend__batteryLevelDisplayString(void *a1, const char *a2, ...)
{
  return _[a1 _batteryLevelDisplayString];
}

id objc_msgSend__beginObservingProgress_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_beginObservingProgress:");
}

id objc_msgSend__bluetoothDeviceForRouteUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_bluetoothDeviceForRouteUID:");
}

id objc_msgSend__bothHeadsetsSupportSpatialWhileSharing(void *a1, const char *a2, ...)
{
  return _[a1 _bothHeadsetsSupportSpatialWhileSharing];
}

id objc_msgSend__bringFocusToSystemUIServiceForReason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_bringFocusToSystemUIServiceForReason:");
}

id objc_msgSend__buttonEvent_containsUsage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_buttonEvent:containsUsage:");
}

id objc_msgSend__calculateAndSetRasterizationScaleForLayer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_calculateAndSetRasterizationScaleForLayer:");
}

id objc_msgSend__cameraItemWithUsedRecently_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_cameraItemWithUsedRecently:");
}

id objc_msgSend__canHandlePresses_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_canHandlePresses:");
}

id objc_msgSend__cleanUpDismissedBannerViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_cleanUpDismissedBannerViewController:");
}

id objc_msgSend__cleanup(void *a1, const char *a2, ...)
{
  return _[a1 _cleanup];
}

id objc_msgSend__cleanupTimer(void *a1, const char *a2, ...)
{
  return _[a1 _cleanupTimer];
}

id objc_msgSend__clockWillAppear(void *a1, const char *a2, ...)
{
  return _[a1 _clockWillAppear];
}

id objc_msgSend__compositingFilterForUserInterfaceStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_compositingFilterForUserInterfaceStyle:");
}

id objc_msgSend__computedControlState(void *a1, const char *a2, ...)
{
  return _[a1 _computedControlState];
}

id objc_msgSend__configurationWithHierarchicalColors_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_configurationWithHierarchicalColors:");
}

id objc_msgSend__configure(void *a1, const char *a2, ...)
{
  return _[a1 _configure];
}

id objc_msgSend__configureAppearanceForControlState_withAnimationCoordinator_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_configureAppearanceForControlState:withAnimationCoordinator:");
}

id objc_msgSend__configureCameraViewFour(void *a1, const char *a2, ...)
{
  return _[a1 _configureCameraViewFour];
}

id objc_msgSend__configureCameraViewIfNeeded(void *a1, const char *a2, ...)
{
  return _[a1 _configureCameraViewIfNeeded];
}

id objc_msgSend__configureCameraViewOne(void *a1, const char *a2, ...)
{
  return _[a1 _configureCameraViewOne];
}

id objc_msgSend__configureCameraViewThree(void *a1, const char *a2, ...)
{
  return _[a1 _configureCameraViewThree];
}

id objc_msgSend__configureCameraViewTwo(void *a1, const char *a2, ...)
{
  return _[a1 _configureCameraViewTwo];
}

id objc_msgSend__configureCameraViews(void *a1, const char *a2, ...)
{
  return _[a1 _configureCameraViews];
}

id objc_msgSend__configureDataProviding(void *a1, const char *a2, ...)
{
  return _[a1 _configureDataProviding];
}

id objc_msgSend__configureHorizontalSeparatorWithFullWidth_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_configureHorizontalSeparatorWithFullWidth:");
}

id objc_msgSend__configureTitleBadge(void *a1, const char *a2, ...)
{
  return _[a1 _configureTitleBadge];
}

id objc_msgSend__configureVerticalSeparator(void *a1, const char *a2, ...)
{
  return _[a1 _configureVerticalSeparator];
}

id objc_msgSend__connectGameController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_connectGameController:");
}

id objc_msgSend__connectingStringForEvent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_connectingStringForEvent:");
}

id objc_msgSend__contentForIncomingCallInfo_withIncomingSnowglobeImage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_contentForIncomingCallInfo:withIncomingSnowglobeImage:");
}

id objc_msgSend__contentOffsetForValue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_contentOffsetForValue:");
}

id objc_msgSend__createCameraViewForCameraItem_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_createCameraViewForCameraItem:");
}

id objc_msgSend__createMediaPlayerViewForRouteUIDIfNecessary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_createMediaPlayerViewForRouteUIDIfNecessary:");
}

id objc_msgSend__createNewDataSource(void *a1, const char *a2, ...)
{
  return _[a1 _createNewDataSource];
}

id objc_msgSend__criticalInfoFromAttributionGroups(void *a1, const char *a2, ...)
{
  return _[a1 _criticalInfoFromAttributionGroups];
}

id objc_msgSend__currentAppBundleID(void *a1, const char *a2, ...)
{
  return _[a1 _currentAppBundleID];
}

id objc_msgSend__currentAppSupportsHeadTracking(void *a1, const char *a2, ...)
{
  return _[a1 _currentAppSupportsHeadTracking];
}

id objc_msgSend__currentAppSupportsSpatial(void *a1, const char *a2, ...)
{
  return _[a1 _currentAppSupportsSpatial];
}

id objc_msgSend__currentAudioContentInfoEligibleForSpatialization(void *a1, const char *a2, ...)
{
  return _[a1 _currentAudioContentInfoEligibleForSpatialization];
}

id objc_msgSend__currentCyclingVisualContent(void *a1, const char *a2, ...)
{
  return _[a1 _currentCyclingVisualContent];
}

id objc_msgSend__currentFocusAnimationCoordinator(void *a1, const char *a2, ...)
{
  return _[a1 _currentFocusAnimationCoordinator];
}

id objc_msgSend__currentItemContent(void *a1, const char *a2, ...)
{
  return _[a1 _currentItemContent];
}

id objc_msgSend__currentLeftBatteryString(void *a1, const char *a2, ...)
{
  return _[a1 _currentLeftBatteryString];
}

id objc_msgSend__currentModeAllowsSpatialAudio(void *a1, const char *a2, ...)
{
  return _[a1 _currentModeAllowsSpatialAudio];
}

id objc_msgSend__currentRemotePowerState(void *a1, const char *a2, ...)
{
  return _[a1 _currentRemotePowerState];
}

id objc_msgSend__currentRemotePowerStateMenuItem(void *a1, const char *a2, ...)
{
  return _[a1 _currentRemotePowerStateMenuItem];
}

id objc_msgSend__currentRightBatteryString(void *a1, const char *a2, ...)
{
  return _[a1 _currentRightBatteryString];
}

id objc_msgSend__currentSingleBatteryImage(void *a1, const char *a2, ...)
{
  return _[a1 _currentSingleBatteryImage];
}

id objc_msgSend__currentSingleBatteryString(void *a1, const char *a2, ...)
{
  return _[a1 _currentSingleBatteryString];
}

id objc_msgSend__currentViewMode(void *a1, const char *a2, ...)
{
  return _[a1 _currentViewMode];
}

id objc_msgSend__currentVisualContent(void *a1, const char *a2, ...)
{
  return _[a1 _currentVisualContent];
}

id objc_msgSend__cycleHeadphoneImages(void *a1, const char *a2, ...)
{
  return _[a1 _cycleHeadphoneImages];
}

id objc_msgSend__cycleTimerDidFire(void *a1, const char *a2, ...)
{
  return _[a1 _cycleTimerDidFire];
}

id objc_msgSend__cyclingMenuItemsSortOrderDictionary(void *a1, const char *a2, ...)
{
  return _[a1 _cyclingMenuItemsSortOrderDictionary];
}

id objc_msgSend__debugContents(void *a1, const char *a2, ...)
{
  return _[a1 _debugContents];
}

id objc_msgSend__debugHostViews(void *a1, const char *a2, ...)
{
  return _[a1 _debugHostViews];
}

id objc_msgSend__deregisterAssertionWithToken_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_deregisterAssertionWithToken:");
}

id objc_msgSend__detailTextColorForInterfaceStyle_state_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_detailTextColorForInterfaceStyle:state:");
}

id objc_msgSend__detailTextCompositingFilterForInterfaceStyle_state_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_detailTextCompositingFilterForInterfaceStyle:state:");
}

id objc_msgSend__deviceLookupDictionaryFromDevices_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_deviceLookupDictionaryFromDevices:");
}

id objc_msgSend__deviceNameForInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_deviceNameForInfo:");
}

id objc_msgSend__deviceSortDescriptors(void *a1, const char *a2, ...)
{
  return _[a1 _deviceSortDescriptors];
}

id objc_msgSend__deviceSupportsSpatial(void *a1, const char *a2, ...)
{
  return _[a1 _deviceSupportsSpatial];
}

id objc_msgSend__didUpdateVisualContent_oldVisualContent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_didUpdateVisualContent:oldVisualContent:");
}

id objc_msgSend__disableGradientMask(void *a1, const char *a2, ...)
{
  return _[a1 _disableGradientMask];
}

id objc_msgSend__disconnectGameController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_disconnectGameController:");
}

id objc_msgSend__dismissDictationUI(void *a1, const char *a2, ...)
{
  return _[a1 _dismissDictationUI];
}

id objc_msgSend__dismissUIIfNeeded(void *a1, const char *a2, ...)
{
  return _[a1 _dismissUIIfNeeded];
}

id objc_msgSend__displayNameFromConfigurationName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_displayNameFromConfigurationName:");
}

id objc_msgSend__doNotDisturbMenuItem(void *a1, const char *a2, ...)
{
  return _[a1 _doNotDisturbMenuItem];
}

id objc_msgSend__effectiveDisplayName(void *a1, const char *a2, ...)
{
  return _[a1 _effectiveDisplayName];
}

id objc_msgSend__effectiveUserInterfaceStyleForStyle_state_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_effectiveUserInterfaceStyleForStyle:state:");
}

id objc_msgSend__enableGradientMask(void *a1, const char *a2, ...)
{
  return _[a1 _enableGradientMask];
}

id objc_msgSend__exampleContent(void *a1, const char *a2, ...)
{
  return _[a1 _exampleContent];
}

id objc_msgSend__fadeIn(void *a1, const char *a2, ...)
{
  return _[a1 _fadeIn];
}

id objc_msgSend__fadeOut(void *a1, const char *a2, ...)
{
  return _[a1 _fadeOut];
}

id objc_msgSend__fail(void *a1, const char *a2, ...)
{
  return _[a1 _fail];
}

id objc_msgSend__fetchCurrentUserAndUpdateWithReason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_fetchCurrentUserAndUpdateWithReason:");
}

id objc_msgSend__fetchCurrentUserAndUpdateWithReason_userProfilesSnapshot_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_fetchCurrentUserAndUpdateWithReason:userProfilesSnapshot:");
}

id objc_msgSend__fillColorForBatteryLevel_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_fillColorForBatteryLevel:");
}

id objc_msgSend__fillSize(void *a1, const char *a2, ...)
{
  return _[a1 _fillSize];
}

id objc_msgSend__filterExcludedAttributions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_filterExcludedAttributions:");
}

id objc_msgSend__focusedProgressColor(void *a1, const char *a2, ...)
{
  return _[a1 _focusedProgressColor];
}

id objc_msgSend__gameController(void *a1, const char *a2, ...)
{
  return _[a1 _gameController];
}

id objc_msgSend__gameControllerForRendererIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_gameControllerForRendererIdentifier:");
}

id objc_msgSend__generateMenuItemHostViewForMenuItem_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_generateMenuItemHostViewForMenuItem:");
}

id objc_msgSend__getAvailableSleepTimerRequests(void *a1, const char *a2, ...)
{
  return _[a1 _getAvailableSleepTimerRequests];
}

id objc_msgSend__getConnectionStatus(void *a1, const char *a2, ...)
{
  return _[a1 _getConnectionStatus];
}

id objc_msgSend__groupMatchingAttributions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_groupMatchingAttributions:");
}

id objc_msgSend__handleAccept(void *a1, const char *a2, ...)
{
  return _[a1 _handleAccept];
}

id objc_msgSend__handleAttentionEvent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleAttentionEvent:");
}

id objc_msgSend__handleDecline(void *a1, const char *a2, ...)
{
  return _[a1 _handleDecline];
}

id objc_msgSend__handleLogOverlord(void *a1, const char *a2, ...)
{
  return _[a1 _handleLogOverlord];
}

id objc_msgSend__handleMediaRemoteNowPlayingPlayerResponse_playerResponse_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleMediaRemoteNowPlayingPlayerResponse:playerResponse:");
}

id objc_msgSend__handleProgressEvent_info_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleProgressEvent:info:");
}

id objc_msgSend__handleSendBulletinAction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleSendBulletinAction:");
}

id objc_msgSend__handleStateTransitionFrom_toState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleStateTransitionFrom:toState:");
}

id objc_msgSend__handleTimerTick(void *a1, const char *a2, ...)
{
  return _[a1 _handleTimerTick];
}

id objc_msgSend__handleToggleAxis(void *a1, const char *a2, ...)
{
  return _[a1 _handleToggleAxis];
}

id objc_msgSend__handleToggleLocationIndicator(void *a1, const char *a2, ...)
{
  return _[a1 _handleToggleLocationIndicator];
}

id objc_msgSend__handleToggleRecordingIndicator(void *a1, const char *a2, ...)
{
  return _[a1 _handleToggleRecordingIndicator];
}

id objc_msgSend__handleUpdatedActiveActivityAttributions_recentActivityAttributions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleUpdatedActiveActivityAttributions:recentActivityAttributions:");
}

id objc_msgSend__hasItemsForLayoutViewFromMenuDataSource_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_hasItemsForLayoutViewFromMenuDataSource:");
}

id objc_msgSend__hasPrivacyItemBeforeProfileItemInMenuDataSource_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_hasPrivacyItemBeforeProfileItemInMenuDataSource:");
}

id objc_msgSend__hasSelectInPresses_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_hasSelectInPresses:");
}

id objc_msgSend__headTrackingCurrentlySupported(void *a1, const char *a2, ...)
{
  return _[a1 _headTrackingCurrentlySupported];
}

id objc_msgSend__headTrackingDisabled(void *a1, const char *a2, ...)
{
  return _[a1 _headTrackingDisabled];
}

id objc_msgSend__headTrackingRendererForHeadphone_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_headTrackingRendererForHeadphone:");
}

id objc_msgSend__hidEvent(void *a1, const char *a2, ...)
{
  return _[a1 _hidEvent];
}

id objc_msgSend__hierarchicalColorsForMenuOffPersonSymbol(void *a1, const char *a2, ...)
{
  return _[a1 _hierarchicalColorsForMenuOffPersonSymbol];
}

id objc_msgSend__hostViewForIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_hostViewForIdentifier:");
}

id objc_msgSend__hostViewsForLayoutViewFromMenuDataSource_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_hostViewsForLayoutViewFromMenuDataSource:");
}

id objc_msgSend__iconTintColorForIconIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_iconTintColorForIconIdentifier:");
}

id objc_msgSend__imageContent(void *a1, const char *a2, ...)
{
  return _[a1 _imageContent];
}

id objc_msgSend__imageContentWithOutputDeviceAsset_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_imageContentWithOutputDeviceAsset:");
}

id objc_msgSend__imageForPID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_imageForPID:");
}

id objc_msgSend__init(void *a1, const char *a2, ...)
{
  return _[a1 _init];
}

id objc_msgSend__initWithMetadata_artworkCacheIdentifier_artworkCacheReference_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_initWithMetadata:artworkCacheIdentifier:artworkCacheReference:");
}

id objc_msgSend__initWithName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_initWithName:");
}

id objc_msgSend__initWithTitle_subtitle_footer_leadingView_trailingView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_initWithTitle:subtitle:footer:leadingView:trailingView:");
}

id objc_msgSend__initWithUserProfile_userProfilePictureService_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_initWithUserProfile:userProfilePictureService:");
}

id objc_msgSend__initialMenuItemForTransitionContext_focusInPanel_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_initialMenuItemForTransitionContext:focusInPanel:");
}

id objc_msgSend__interactiveProviderForIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_interactiveProviderForIdentifier:");
}

id objc_msgSend__invalidate(void *a1, const char *a2, ...)
{
  return _[a1 _invalidate];
}

id objc_msgSend__invalidateShareAudioSession(void *a1, const char *a2, ...)
{
  return _[a1 _invalidateShareAudioSession];
}

id objc_msgSend__isDoNotDisturbEnabled(void *a1, const char *a2, ...)
{
  return _[a1 _isDoNotDisturbEnabled];
}

id objc_msgSend__isFaceTimeRestricted(void *a1, const char *a2, ...)
{
  return _[a1 _isFaceTimeRestricted];
}

id objc_msgSend__isHomeUIVideoBulletin_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_isHomeUIVideoBulletin:");
}

id objc_msgSend__isLocalDeviceFaceTimeCapable(void *a1, const char *a2, ...)
{
  return _[a1 _isLocalDeviceFaceTimeCapable];
}

id objc_msgSend__isLocationActive(void *a1, const char *a2, ...)
{
  return _[a1 _isLocationActive];
}

id objc_msgSend__isRootTransaction(void *a1, const char *a2, ...)
{
  return _[a1 _isRootTransaction];
}

id objc_msgSend__isSharePlayIconForState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_isSharePlayIconForState:");
}

id objc_msgSend__isSupportedBluetoothDevice_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_isSupportedBluetoothDevice:");
}

id objc_msgSend__isSupportedBulletin_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_isSupportedBulletin:");
}

id objc_msgSend__itemsForGroup_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_itemsForGroup:");
}

id objc_msgSend__itemsForLayoutViewFromMenuDataSource_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_itemsForLayoutViewFromMenuDataSource:");
}

id objc_msgSend__latestNetworkState(void *a1, const char *a2, ...)
{
  return _[a1 _latestNetworkState];
}

id objc_msgSend__launchSettingsWithURLPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_launchSettingsWithURLPath:");
}

id objc_msgSend__layout(void *a1, const char *a2, ...)
{
  return _[a1 _layout];
}

id objc_msgSend__layoutFromCameraSession_renderers_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_layoutFromCameraSession:renderers:");
}

id objc_msgSend__layoutProvidersFromCameraSession_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_layoutProvidersFromCameraSession:");
}

id objc_msgSend__layoutResultForMenuDataSource_configuration_menuItemHostViewsDict_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_layoutResultForMenuDataSource:configuration:menuItemHostViewsDict:");
}

id objc_msgSend__loadVPNConfigurations(void *a1, const char *a2, ...)
{
  return _[a1 _loadVPNConfigurations];
}

id objc_msgSend__localizedValueForCurrentSpatialState(void *a1, const char *a2, ...)
{
  return _[a1 _localizedValueForCurrentSpatialState];
}

id objc_msgSend__localizedValueForCurrentSpatializeStereoState(void *a1, const char *a2, ...)
{
  return _[a1 _localizedValueForCurrentSpatializeStereoState];
}

id objc_msgSend__localizedValueFromConversationDetectState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_localizedValueFromConversationDetectState:");
}

id objc_msgSend__localizedValueFromListeningMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_localizedValueFromListeningMode:");
}

id objc_msgSend__locationItemWithUsedRecently_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_locationItemWithUsedRecently:");
}

id objc_msgSend__log(void *a1, const char *a2, ...)
{
  return _[a1 _log];
}

id objc_msgSend__makeMediaItemMetadataWithPlayerResponseItem_isPodcast_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_makeMediaItemMetadataWithPlayerResponseItem:isPodcast:");
}

id objc_msgSend__mediaPlayerRequestResponseController(void *a1, const char *a2, ...)
{
  return _[a1 _mediaPlayerRequestResponseController];
}

id objc_msgSend__mediaRemoteNowPlayingControllerRequestDidComplete(void *a1, const char *a2, ...)
{
  return _[a1 _mediaRemoteNowPlayingControllerRequestDidComplete];
}

id objc_msgSend__mediaRemoteNowPlayingRequestDidCompleteWithIdentifier_mediaRemoteResponse_error_playerResponse_( void *a1, const char *a2, ...)
{
  return _objc_msgSend( a1,  "_mediaRemoteNowPlayingRequestDidCompleteWithIdentifier:mediaRemoteResponse:error:playerResponse:");
}

id objc_msgSend__micItemWithUsedRecently_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_micItemWithUsedRecently:");
}

id objc_msgSend__modeFromState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_modeFromState:");
}

id objc_msgSend__moveFocusToPanel(void *a1, const char *a2, ...)
{
  return _[a1 _moveFocusToPanel];
}

id objc_msgSend__moviePathForPID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_moviePathForPID:");
}

id objc_msgSend__newCyclingVisualContent(void *a1, const char *a2, ...)
{
  return _[a1 _newCyclingVisualContent];
}

id objc_msgSend__nextMenuItemIndex(void *a1, const char *a2, ...)
{
  return _[a1 _nextMenuItemIndex];
}

id objc_msgSend__noiseControlRendererForIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_noiseControlRendererForIdentifier:");
}

id objc_msgSend__notePublishNetworkStateNeeded(void *a1, const char *a2, ...)
{
  return _[a1 _notePublishNetworkStateNeeded];
}

id objc_msgSend__notifyContentViewConfigurationWillChangeWithConfiguration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_notifyContentViewConfigurationWillChangeWithConfiguration:");
}

id objc_msgSend__notifyContentViewDidChange(void *a1, const char *a2, ...)
{
  return _[a1 _notifyContentViewDidChange];
}

id objc_msgSend__notifyDataSourceDidChange(void *a1, const char *a2, ...)
{
  return _[a1 _notifyDataSourceDidChange];
}

id objc_msgSend__notifyDelegate(void *a1, const char *a2, ...)
{
  return _[a1 _notifyDelegate];
}

id objc_msgSend__notifyDelegateVisualizationDidChange(void *a1, const char *a2, ...)
{
  return _[a1 _notifyDelegateVisualizationDidChange];
}

id objc_msgSend__notifyItemsDidChange(void *a1, const char *a2, ...)
{
  return _[a1 _notifyItemsDidChange];
}

id objc_msgSend__notifyMenuModeStateProviderDidChange(void *a1, const char *a2, ...)
{
  return _[a1 _notifyMenuModeStateProviderDidChange];
}

id objc_msgSend__notifyObserversConfigurationsChanged_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_notifyObserversConfigurationsChanged:");
}

id objc_msgSend__notifyObserversOfUpdate(void *a1, const char *a2, ...)
{
  return _[a1 _notifyObserversOfUpdate];
}

id objc_msgSend__notifyOfVisibilityChange(void *a1, const char *a2, ...)
{
  return _[a1 _notifyOfVisibilityChange];
}

id objc_msgSend__notifyPreviousViewController_nextViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_notifyPreviousViewController:nextViewController:");
}

id objc_msgSend__notifyPrivacyControllerStateDidChange(void *a1, const char *a2, ...)
{
  return _[a1 _notifyPrivacyControllerStateDidChange];
}

id objc_msgSend__notifyShareAudioCompletedWithSuccess_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_notifyShareAudioCompletedWithSuccess:");
}

id objc_msgSend__notifyStateContributorHasUpdate(void *a1, const char *a2, ...)
{
  return _[a1 _notifyStateContributorHasUpdate];
}

id objc_msgSend__notifyStateTransitionHandlersOfTransitionFromState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_notifyStateTransitionHandlersOfTransitionFromState:");
}

id objc_msgSend__notifyVisualContentDidChange(void *a1, const char *a2, ...)
{
  return _[a1 _notifyVisualContentDidChange];
}

id objc_msgSend__nowPlayingItemFromPlayerResponse_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_nowPlayingItemFromPlayerResponse:");
}

id objc_msgSend__observersCopyForSelector_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_observersCopyForSelector:");
}

id objc_msgSend__outputDeviceRouteProvider(void *a1, const char *a2, ...)
{
  return _[a1 _outputDeviceRouteProvider];
}

id objc_msgSend__overrideAlwaysShowingItem(void *a1, const char *a2, ...)
{
  return _[a1 _overrideAlwaysShowingItem];
}

id objc_msgSend__packageNameForCurrentSpatialState(void *a1, const char *a2, ...)
{
  return _[a1 _packageNameForCurrentSpatialState];
}

id objc_msgSend__packageNameForCurrentSpatializeStereoState(void *a1, const char *a2, ...)
{
  return _[a1 _packageNameForCurrentSpatializeStereoState];
}

id objc_msgSend__packageNameForListeningMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_packageNameForListeningMode:");
}

id objc_msgSend__pairingInstructionsForInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_pairingInstructionsForInfo:");
}

id objc_msgSend__pauseOrthogonalNavigation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_pauseOrthogonalNavigation:");
}

id objc_msgSend__performSearchAndDismiss(void *a1, const char *a2, ...)
{
  return _[a1 _performSearchAndDismiss];
}

id objc_msgSend__platterControllerWillDisappear_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_platterControllerWillDisappear:");
}

id objc_msgSend__prefKeyForIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_prefKeyForIdentifier:");
}

id objc_msgSend__preferredFontForTextStyle_addingSymbolicTraits_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_preferredFontForTextStyle:addingSymbolicTraits:");
}

id objc_msgSend__preferredFontForTextStyle_variant_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_preferredFontForTextStyle:variant:");
}

id objc_msgSend__preferredFontForTextStyle_weight_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_preferredFontForTextStyle:weight:");
}

id objc_msgSend__presentActionSetPromptWithRenderer_context_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_presentActionSetPromptWithRenderer:context:");
}

id objc_msgSend__presentAlertWithError_forGameController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_presentAlertWithError:forGameController:");
}

id objc_msgSend__presentExportOptionsWithURL_presentingViewController_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_presentExportOptionsWithURL:presentingViewController:completion:");
}

id objc_msgSend__presentMoreDetailsAlert(void *a1, const char *a2, ...)
{
  return _[a1 _presentMoreDetailsAlert];
}

id objc_msgSend__presentPullErrorFromDeviceHandleIfNeeded_pullError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_presentPullErrorFromDeviceHandleIfNeeded:pullError:");
}

id objc_msgSend__prewarmAVPlayers(void *a1, const char *a2, ...)
{
  return _[a1 _prewarmAVPlayers];
}

id objc_msgSend__prewarmAudioRoutingControllerIfNecessary(void *a1, const char *a2, ...)
{
  return _[a1 _prewarmAudioRoutingControllerIfNecessary];
}

id objc_msgSend__primaryOutputDeviceRouteAsset(void *a1, const char *a2, ...)
{
  return _[a1 _primaryOutputDeviceRouteAsset];
}

id objc_msgSend__primaryOutputImageContent(void *a1, const char *a2, ...)
{
  return _[a1 _primaryOutputImageContent];
}

id objc_msgSend__progressCenter(void *a1, const char *a2, ...)
{
  return _[a1 _progressCenter];
}

id objc_msgSend__publishNetworkState(void *a1, const char *a2, ...)
{
  return _[a1 _publishNetworkState];
}

id objc_msgSend__queue_determineFocusedAppFromLayout_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_queue_determineFocusedAppFromLayout:");
}

id objc_msgSend__recentActivityAttributionsFromDomianData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_recentActivityAttributionsFromDomianData:");
}

id objc_msgSend__recomputeLayoutViewFromDataSource_animator_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_recomputeLayoutViewFromDataSource:animator:");
}

id objc_msgSend__refreshAudioFormatRenderer(void *a1, const char *a2, ...)
{
  return _[a1 _refreshAudioFormatRenderer];
}

id objc_msgSend__refreshConversationDetectRenderer(void *a1, const char *a2, ...)
{
  return _[a1 _refreshConversationDetectRenderer];
}

id objc_msgSend__refreshCurrentlyDisplayedContextMenu(void *a1, const char *a2, ...)
{
  return _[a1 _refreshCurrentlyDisplayedContextMenu];
}

id objc_msgSend__refreshHeadTrackingRenderer(void *a1, const char *a2, ...)
{
  return _[a1 _refreshHeadTrackingRenderer];
}

id objc_msgSend__refreshHeadphoneSettingsRenderers(void *a1, const char *a2, ...)
{
  return _[a1 _refreshHeadphoneSettingsRenderers];
}

id objc_msgSend__refreshIncomingSnowglobeImage(void *a1, const char *a2, ...)
{
  return _[a1 _refreshIncomingSnowglobeImage];
}

id objc_msgSend__refreshNoiseControlRenderers(void *a1, const char *a2, ...)
{
  return _[a1 _refreshNoiseControlRenderers];
}

id objc_msgSend__refreshSpatializeStereoRenderer(void *a1, const char *a2, ...)
{
  return _[a1 _refreshSpatializeStereoRenderer];
}

id objc_msgSend__refreshVolumeRenderers(void *a1, const char *a2, ...)
{
  return _[a1 _refreshVolumeRenderers];
}

id objc_msgSend__registerAssertion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_registerAssertion:");
}

id objc_msgSend__registerSceneComponent_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_registerSceneComponent:forKey:");
}

id objc_msgSend__relinquishVolumeButtonAssertion(void *a1, const char *a2, ...)
{
  return _[a1 _relinquishVolumeButtonAssertion];
}

id objc_msgSend__relinquishVolumeHUDAssertion(void *a1, const char *a2, ...)
{
  return _[a1 _relinquishVolumeHUDAssertion];
}

id objc_msgSend__remoteHasNotablePowerState(void *a1, const char *a2, ...)
{
  return _[a1 _remoteHasNotablePowerState];
}

id objc_msgSend__remotePowerStateContentWithPowerState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_remotePowerStateContentWithPowerState:");
}

id objc_msgSend__remotePowerStateMenuItem(void *a1, const char *a2, ...)
{
  return _[a1 _remotePowerStateMenuItem];
}

id objc_msgSend__remotePowerStateMenuItemIdentifierForPowerState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_remotePowerStateMenuItemIdentifierForPowerState:");
}

id objc_msgSend__removeObservationsForDataSource_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_removeObservationsForDataSource:");
}

id objc_msgSend__renderersWithCaptureView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_renderersWithCaptureView:");
}

id objc_msgSend__resetFloatingContentViewForControlState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_resetFloatingContentViewForControlState:");
}

id objc_msgSend__resolvedAudioFormat(void *a1, const char *a2, ...)
{
  return _[a1 _resolvedAudioFormat];
}

id objc_msgSend__resolvedOverrideColor(void *a1, const char *a2, ...)
{
  return _[a1 _resolvedOverrideColor];
}

id objc_msgSend__resolvedSpatialAudioModeIsFixed(void *a1, const char *a2, ...)
{
  return _[a1 _resolvedSpatialAudioModeIsFixed];
}

id objc_msgSend__resolvedSpatialAudioModeIsHeadTracked(void *a1, const char *a2, ...)
{
  return _[a1 _resolvedSpatialAudioModeIsHeadTracked];
}

id objc_msgSend__resolvedSpatialAudioModeIsOff(void *a1, const char *a2, ...)
{
  return _[a1 _resolvedSpatialAudioModeIsOff];
}

id objc_msgSend__restrictionsUserDefaults(void *a1, const char *a2, ...)
{
  return _[a1 _restrictionsUserDefaults];
}

id objc_msgSend__routeFromItemIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_routeFromItemIdentifier:");
}

id objc_msgSend__sendObservingActionWithBulletin_state_reason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_sendObservingActionWithBulletin:state:reason:");
}

id objc_msgSend__setClockDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setClockDate:");
}

id objc_msgSend__setContentView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setContentView:");
}

id objc_msgSend__setContinuousCornerRadius_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setContinuousCornerRadius:");
}

id objc_msgSend__setCornerRadius_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setCornerRadius:");
}

id objc_msgSend__setCustomWidth_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setCustomWidth:");
}

id objc_msgSend__setDataSource_animator_forcedUpdate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setDataSource:animator:forcedUpdate:");
}

id objc_msgSend__setDefaults(void *a1, const char *a2, ...)
{
  return _[a1 _setDefaults];
}

id objc_msgSend__setDisableDictationButton_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setDisableDictationButton:");
}

id objc_msgSend__setHeadTrackingEnabledOnBothHeadsets_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setHeadTrackingEnabledOnBothHeadsets:");
}

id objc_msgSend__setHeaderContentViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setHeaderContentViewController:");
}

id objc_msgSend__setHelperPlaceholderOverride_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setHelperPlaceholderOverride:");
}

id objc_msgSend__setHysteresis_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setHysteresis:");
}

id objc_msgSend__setPackage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setPackage:");
}

id objc_msgSend__setParticipatesInAudioSession_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setParticipatesInAudioSession:");
}

id objc_msgSend__setShowDictationDisplayInSearchBar_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setShowDictationDisplayInSearchBar:");
}

id objc_msgSend__setSpatialAudioModeOnBothHeadsets_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setSpatialAudioModeOnBothHeadsets:");
}

id objc_msgSend__setValue_animated_notify_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setValue:animated:notify:");
}

id objc_msgSend__setupDictationWindow(void *a1, const char *a2, ...)
{
  return _[a1 _setupDictationWindow];
}

id objc_msgSend__setupEventHandler(void *a1, const char *a2, ...)
{
  return _[a1 _setupEventHandler];
}

id objc_msgSend__setupNewStateMachine(void *a1, const char *a2, ...)
{
  return _[a1 _setupNewStateMachine];
}

id objc_msgSend__setupTimer(void *a1, const char *a2, ...)
{
  return _[a1 _setupTimer];
}

id objc_msgSend__shouldExcludeAttribution_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_shouldExcludeAttribution:");
}

id objc_msgSend__shouldForceFocusToPanelDuringAnimationWithContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_shouldForceFocusToPanelDuringAnimationWithContext:");
}

id objc_msgSend__shouldShowNowPlayingInfo(void *a1, const char *a2, ...)
{
  return _[a1 _shouldShowNowPlayingInfo];
}

id objc_msgSend__shouldShowSeparateBatteryPercentages(void *a1, const char *a2, ...)
{
  return _[a1 _shouldShowSeparateBatteryPercentages];
}

id objc_msgSend__shouldShowSeparateBatteryPercentagesForBatteryLevel_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_shouldShowSeparateBatteryPercentagesForBatteryLevel:");
}

id objc_msgSend__shouldShowSingleBatteryPercentage(void *a1, const char *a2, ...)
{
  return _[a1 _shouldShowSingleBatteryPercentage];
}

id objc_msgSend__showConnectingWithEvent_info_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_showConnectingWithEvent:info:");
}

id objc_msgSend__showConnectionOptionsWithInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_showConnectionOptionsWithInfo:");
}

id objc_msgSend__showErrorWithInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_showErrorWithInfo:");
}

id objc_msgSend__showPairingInstructionsWithInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_showPairingInstructionsWithInfo:");
}

id objc_msgSend__sleepTimerContent(void *a1, const char *a2, ...)
{
  return _[a1 _sleepTimerContent];
}

id objc_msgSend__sleepTimerController(void *a1, const char *a2, ...)
{
  return _[a1 _sleepTimerController];
}

id objc_msgSend__sortedCyclingMenuItems(void *a1, const char *a2, ...)
{
  return _[a1 _sortedCyclingMenuItems];
}

id objc_msgSend__sortedDevices_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_sortedDevices:");
}

id objc_msgSend__spatialAndHeadTrackingEnabled(void *a1, const char *a2, ...)
{
  return _[a1 _spatialAndHeadTrackingEnabled];
}

id objc_msgSend__spatialEnabledGlobally(void *a1, const char *a2, ...)
{
  return _[a1 _spatialEnabledGlobally];
}

id objc_msgSend__spatialFixedEnabled(void *a1, const char *a2, ...)
{
  return _[a1 _spatialFixedEnabled];
}

id objc_msgSend__spatialUnavailable(void *a1, const char *a2, ...)
{
  return _[a1 _spatialUnavailable];
}

id objc_msgSend__spatializeStereoEnabledForHeadphone_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_spatializeStereoEnabledForHeadphone:");
}

id objc_msgSend__speechDetectRendererForIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_speechDetectRendererForIdentifier:");
}

id objc_msgSend__splitterPreventingSpatial(void *a1, const char *a2, ...)
{
  return _[a1 _splitterPreventingSpatial];
}

id objc_msgSend__splitterSpatialActive(void *a1, const char *a2, ...)
{
  return _[a1 _splitterSpatialActive];
}

id objc_msgSend__startAnimating(void *a1, const char *a2, ...)
{
  return _[a1 _startAnimating];
}

id objc_msgSend__startCyclingTimer(void *a1, const char *a2, ...)
{
  return _[a1 _startCyclingTimer];
}

id objc_msgSend__startDictation(void *a1, const char *a2, ...)
{
  return _[a1 _startDictation];
}

id objc_msgSend__startDisplayingMenuItems(void *a1, const char *a2, ...)
{
  return _[a1 _startDisplayingMenuItems];
}

id objc_msgSend__startObservingConfigurationManager(void *a1, const char *a2, ...)
{
  return _[a1 _startObservingConfigurationManager];
}

id objc_msgSend__startObservingNetworkInterfaceKVONotifications(void *a1, const char *a2, ...)
{
  return _[a1 _startObservingNetworkInterfaceKVONotifications];
}

id objc_msgSend__startObservingNetworkInterfaceManager(void *a1, const char *a2, ...)
{
  return _[a1 _startObservingNetworkInterfaceManager];
}

id objc_msgSend__startObservingNotifications(void *a1, const char *a2, ...)
{
  return _[a1 _startObservingNotifications];
}

id objc_msgSend__startObservingSystemPathMonitor(void *a1, const char *a2, ...)
{
  return _[a1 _startObservingSystemPathMonitor];
}

id objc_msgSend__startShareAudioSession(void *a1, const char *a2, ...)
{
  return _[a1 _startShareAudioSession];
}

id objc_msgSend__startSnapshotTimer(void *a1, const char *a2, ...)
{
  return _[a1 _startSnapshotTimer];
}

id objc_msgSend__stateFromContributors_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_stateFromContributors:");
}

id objc_msgSend__stateNameForVolumeLevel_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_stateNameForVolumeLevel:");
}

id objc_msgSend__stopAnimating(void *a1, const char *a2, ...)
{
  return _[a1 _stopAnimating];
}

id objc_msgSend__stopCyclingTimer(void *a1, const char *a2, ...)
{
  return _[a1 _stopCyclingTimer];
}

id objc_msgSend__stopDictation(void *a1, const char *a2, ...)
{
  return _[a1 _stopDictation];
}

id objc_msgSend__stopDisplayingMenuItems(void *a1, const char *a2, ...)
{
  return _[a1 _stopDisplayingMenuItems];
}

id objc_msgSend__stopObservingConfigurationManager(void *a1, const char *a2, ...)
{
  return _[a1 _stopObservingConfigurationManager];
}

id objc_msgSend__stopObservingNetworkInterfaceKVONotifications(void *a1, const char *a2, ...)
{
  return _[a1 _stopObservingNetworkInterfaceKVONotifications];
}

id objc_msgSend__stopObservingNetworkInterfaceManager(void *a1, const char *a2, ...)
{
  return _[a1 _stopObservingNetworkInterfaceManager];
}

id objc_msgSend__stopObservingNotifications(void *a1, const char *a2, ...)
{
  return _[a1 _stopObservingNotifications];
}

id objc_msgSend__stopObservingSystemPathMonitor(void *a1, const char *a2, ...)
{
  return _[a1 _stopObservingSystemPathMonitor];
}

id objc_msgSend__stopSnapshotTimer(void *a1, const char *a2, ...)
{
  return _[a1 _stopSnapshotTimer];
}

id objc_msgSend__stopStreamingAllCameras(void *a1, const char *a2, ...)
{
  return _[a1 _stopStreamingAllCameras];
}

id objc_msgSend__symbolForBatteryLevel_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_symbolForBatteryLevel:");
}

id objc_msgSend__symbolNameForRoutes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_symbolNameForRoutes:");
}

id objc_msgSend__systemImageForListeningMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_systemImageForListeningMode:");
}

id objc_msgSend__systemImageNamed_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_systemImageNamed:");
}

id objc_msgSend__systemImageNamed_withConfiguration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_systemImageNamed:withConfiguration:");
}

id objc_msgSend__systemStatusQueue_handleUpdatedDomainData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_systemStatusQueue_handleUpdatedDomainData:");
}

id objc_msgSend__tearDownDictationWindow(void *a1, const char *a2, ...)
{
  return _[a1 _tearDownDictationWindow];
}

id objc_msgSend__textColorForTitle_interfaceStyle_state_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_textColorForTitle:interfaceStyle:state:");
}

id objc_msgSend__textCompositingFilterForInterfaceStyle_state_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_textCompositingFilterForInterfaceStyle:state:");
}

id objc_msgSend__textContent(void *a1, const char *a2, ...)
{
  return _[a1 _textContent];
}

id objc_msgSend__textContentInsets(void *a1, const char *a2, ...)
{
  return _[a1 _textContentInsets];
}

id objc_msgSend__textForZoomFactor_showZoomFactorSymbol_isSelected_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_textForZoomFactor:showZoomFactorSymbol:isSelected:");
}

id objc_msgSend__timerFired(void *a1, const char *a2, ...)
{
  return _[a1 _timerFired];
}

id objc_msgSend__timerTick(void *a1, const char *a2, ...)
{
  return _[a1 _timerTick];
}

id objc_msgSend__tintColorForKind_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_tintColorForKind:");
}

id objc_msgSend__tintColorForUserInterfaceStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_tintColorForUserInterfaceStyle:");
}

id objc_msgSend__titleFromGroups_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_titleFromGroups:");
}

id objc_msgSend__toggleActionSetWithRenderer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_toggleActionSetWithRenderer:");
}

id objc_msgSend__toggleBorder(void *a1, const char *a2, ...)
{
  return _[a1 _toggleBorder];
}

id objc_msgSend__toggleRecordingColor(void *a1, const char *a2, ...)
{
  return _[a1 _toggleRecordingColor];
}

id objc_msgSend__toggleRecordingShape(void *a1, const char *a2, ...)
{
  return _[a1 _toggleRecordingShape];
}

id objc_msgSend__toggleSpatializeStereoForBothHeadsets(void *a1, const char *a2, ...)
{
  return _[a1 _toggleSpatializeStereoForBothHeadsets];
}

id objc_msgSend__toggleSpatializeStereoForHeadphone_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_toggleSpatializeStereoForHeadphone:");
}

id objc_msgSend__transactionToSetContentView_withTransition_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_transactionToSetContentView:withTransition:");
}

id objc_msgSend__tvspIsDarkMode(void *a1, const char *a2, ...)
{
  return _[a1 _tvspIsDarkMode];
}

id objc_msgSend__tvspMainSceneTraits(void *a1, const char *a2, ...)
{
  return _[a1 _tvspMainSceneTraits];
}

id objc_msgSend__uiServiceWindowScene(void *a1, const char *a2, ...)
{
  return _[a1 _uiServiceWindowScene];
}

id objc_msgSend__unfocusSystemUIServiceIfNeeded(void *a1, const char *a2, ...)
{
  return _[a1 _unfocusSystemUIServiceIfNeeded];
}

id objc_msgSend__unpairActionForGameController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_unpairActionForGameController:");
}

id objc_msgSend__unpairGameController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_unpairGameController:");
}

id objc_msgSend__update(void *a1, const char *a2, ...)
{
  return _[a1 _update];
}

id objc_msgSend__updateActiveItemTraits(void *a1, const char *a2, ...)
{
  return _[a1 _updateActiveItemTraits];
}

id objc_msgSend__updateActiveModeAwareProviders(void *a1, const char *a2, ...)
{
  return _[a1 _updateActiveModeAwareProviders];
}

id objc_msgSend__updateAppearance(void *a1, const char *a2, ...)
{
  return _[a1 _updateAppearance];
}

id objc_msgSend__updateAttentionMonitoringState(void *a1, const char *a2, ...)
{
  return _[a1 _updateAttentionMonitoringState];
}

id objc_msgSend__updateBarYOffset(void *a1, const char *a2, ...)
{
  return _[a1 _updateBarYOffset];
}

id objc_msgSend__updateBorderColor(void *a1, const char *a2, ...)
{
  return _[a1 _updateBorderColor];
}

id objc_msgSend__updateButtonSelection(void *a1, const char *a2, ...)
{
  return _[a1 _updateButtonSelection];
}

id objc_msgSend__updateCamerasOrScenesValue(void *a1, const char *a2, ...)
{
  return _[a1 _updateCamerasOrScenesValue];
}

id objc_msgSend__updateConfigurationsWithNEConfigurations_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateConfigurationsWithNEConfigurations:");
}

id objc_msgSend__updateConnectionStatus(void *a1, const char *a2, ...)
{
  return _[a1 _updateConnectionStatus];
}

id objc_msgSend__updateConstraintsAndSpacing(void *a1, const char *a2, ...)
{
  return _[a1 _updateConstraintsAndSpacing];
}

id objc_msgSend__updateConstraintsForTimerSize_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateConstraintsForTimerSize:");
}

id objc_msgSend__updateContent(void *a1, const char *a2, ...)
{
  return _[a1 _updateContent];
}

id objc_msgSend__updateContent_withBatteryLevel_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateContent:withBatteryLevel:");
}

id objc_msgSend__updateContentViewAppearance(void *a1, const char *a2, ...)
{
  return _[a1 _updateContentViewAppearance];
}

id objc_msgSend__updateContentViewWithAnimator_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateContentViewWithAnimator:");
}

id objc_msgSend__updateControlStateWithAnimationCoordinator_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateControlStateWithAnimationCoordinator:");
}

id objc_msgSend__updateControlsAvailability(void *a1, const char *a2, ...)
{
  return _[a1 _updateControlsAvailability];
}

id objc_msgSend__updateCriticalInfo(void *a1, const char *a2, ...)
{
  return _[a1 _updateCriticalInfo];
}

id objc_msgSend__updateCurrentRemote(void *a1, const char *a2, ...)
{
  return _[a1 _updateCurrentRemote];
}

id objc_msgSend__updateCyclingMenuItems(void *a1, const char *a2, ...)
{
  return _[a1 _updateCyclingMenuItems];
}

id objc_msgSend__updateCyclingMenuItems_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateCyclingMenuItems:");
}

id objc_msgSend__updateCyclingMenuItems_atIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateCyclingMenuItems:atIndex:");
}

id objc_msgSend__updateDataSource(void *a1, const char *a2, ...)
{
  return _[a1 _updateDataSource];
}

id objc_msgSend__updateDiscoveringPairableDevices(void *a1, const char *a2, ...)
{
  return _[a1 _updateDiscoveringPairableDevices];
}

id objc_msgSend__updateEffect(void *a1, const char *a2, ...)
{
  return _[a1 _updateEffect];
}

id objc_msgSend__updateEffectForTraitEnvironment_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateEffectForTraitEnvironment:");
}

id objc_msgSend__updateFilteredItemsFromWrappedProvider(void *a1, const char *a2, ...)
{
  return _[a1 _updateFilteredItemsFromWrappedProvider];
}

id objc_msgSend__updateForDictationChange(void *a1, const char *a2, ...)
{
  return _[a1 _updateForDictationChange];
}

id objc_msgSend__updateHasIndicatorForMenuBar(void *a1, const char *a2, ...)
{
  return _[a1 _updateHasIndicatorForMenuBar];
}

id objc_msgSend__updateHeaderWithAudioFormat(void *a1, const char *a2, ...)
{
  return _[a1 _updateHeaderWithAudioFormat];
}

id objc_msgSend__updateHostedViewControllerWithPresentationContext_focusHeading_orthogonalNavigation_completion_( void *a1, const char *a2, ...)
{
  return _objc_msgSend( a1,  "_updateHostedViewControllerWithPresentationContext:focusHeading:orthogonalNavigation:completion:");
}

id objc_msgSend__updateItemsWithReason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateItemsWithReason:");
}

id objc_msgSend__updateLayerLineWidth(void *a1, const char *a2, ...)
{
  return _[a1 _updateLayerLineWidth];
}

id objc_msgSend__updateLayerPaths(void *a1, const char *a2, ...)
{
  return _[a1 _updateLayerPaths];
}

id objc_msgSend__updateLayoutAndReloadContent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateLayoutAndReloadContent:");
}

id objc_msgSend__updateLeadingView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateLeadingView:");
}

id objc_msgSend__updateLingeringControllerActiveState(void *a1, const char *a2, ...)
{
  return _[a1 _updateLingeringControllerActiveState];
}

id objc_msgSend__updateLingeringTimer(void *a1, const char *a2, ...)
{
  return _[a1 _updateLingeringTimer];
}

id objc_msgSend__updateListeningModeForHeadphone_listeningMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateListeningModeForHeadphone:listeningMode:");
}

id objc_msgSend__updateLocationIndicatorView(void *a1, const char *a2, ...)
{
  return _[a1 _updateLocationIndicatorView];
}

id objc_msgSend__updateMarkers(void *a1, const char *a2, ...)
{
  return _[a1 _updateMarkers];
}

id objc_msgSend__updateOffset(void *a1, const char *a2, ...)
{
  return _[a1 _updateOffset];
}

id objc_msgSend__updateOrRefreshContentView(void *a1, const char *a2, ...)
{
  return _[a1 _updateOrRefreshContentView];
}

id objc_msgSend__updateOutputDevicesWithReason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateOutputDevicesWithReason:");
}

id objc_msgSend__updatePackageRasterizationScale(void *a1, const char *a2, ...)
{
  return _[a1 _updatePackageRasterizationScale];
}

id objc_msgSend__updatePairableDevicesAndNotify_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updatePairableDevicesAndNotify:");
}

id objc_msgSend__updatePairedDevices(void *a1, const char *a2, ...)
{
  return _[a1 _updatePairedDevices];
}

id objc_msgSend__updatePanelAnimated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updatePanelAnimated:");
}

id objc_msgSend__updatePanelWithRoutes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updatePanelWithRoutes:");
}

id objc_msgSend__updatePassiveItem(void *a1, const char *a2, ...)
{
  return _[a1 _updatePassiveItem];
}

id objc_msgSend__updatePercentage(void *a1, const char *a2, ...)
{
  return _[a1 _updatePercentage];
}

id objc_msgSend__updatePillContentView(void *a1, const char *a2, ...)
{
  return _[a1 _updatePillContentView];
}

id objc_msgSend__updatePlatterAnimated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updatePlatterAnimated:");
}

id objc_msgSend__updatePlatterArtworkImageForMediaItem_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updatePlatterArtworkImageForMediaItem:");
}

id objc_msgSend__updatePlatterIncomingCallInfo(void *a1, const char *a2, ...)
{
  return _[a1 _updatePlatterIncomingCallInfo];
}

id objc_msgSend__updatePlatterSizeWithAnimator_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updatePlatterSizeWithAnimator:");
}

id objc_msgSend__updatePlaybackState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updatePlaybackState:");
}

id objc_msgSend__updatePreferredSizeConstraints(void *a1, const char *a2, ...)
{
  return _[a1 _updatePreferredSizeConstraints];
}

id objc_msgSend__updatePresentable_withBulletin_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updatePresentable:withBulletin:");
}

id objc_msgSend__updatePrivacyAdapterView(void *a1, const char *a2, ...)
{
  return _[a1 _updatePrivacyAdapterView];
}

id objc_msgSend__updatePrivacyStackView(void *a1, const char *a2, ...)
{
  return _[a1 _updatePrivacyStackView];
}

id objc_msgSend__updatePrivacyState(void *a1, const char *a2, ...)
{
  return _[a1 _updatePrivacyState];
}

id objc_msgSend__updatePrivacyStateAdapterView(void *a1, const char *a2, ...)
{
  return _[a1 _updatePrivacyStateAdapterView];
}

id objc_msgSend__updateRasterizationScale(void *a1, const char *a2, ...)
{
  return _[a1 _updateRasterizationScale];
}

id objc_msgSend__updateRecordingIndicatorView(void *a1, const char *a2, ...)
{
  return _[a1 _updateRecordingIndicatorView];
}

id objc_msgSend__updateRenderersWithGameControllers_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateRenderersWithGameControllers:");
}

id objc_msgSend__updateReportedTime(void *a1, const char *a2, ...)
{
  return _[a1 _updateReportedTime];
}

id objc_msgSend__updateScrollPositionAndMarkerAppearance(void *a1, const char *a2, ...)
{
  return _[a1 _updateScrollPositionAndMarkerAppearance];
}

id objc_msgSend__updateSleepTimerRefreshTimer(void *a1, const char *a2, ...)
{
  return _[a1 _updateSleepTimerRefreshTimer];
}

id objc_msgSend__updateSpatialModeForHeadphone_spatialMode_headTrackingEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateSpatialModeForHeadphone:spatialMode:headTrackingEnabled:");
}

id objc_msgSend__updateStackViewLayout(void *a1, const char *a2, ...)
{
  return _[a1 _updateStackViewLayout];
}

id objc_msgSend__updateState(void *a1, const char *a2, ...)
{
  return _[a1 _updateState];
}

id objc_msgSend__updateStateWithReason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateStateWithReason:");
}

id objc_msgSend__updateTimeParameters(void *a1, const char *a2, ...)
{
  return _[a1 _updateTimeParameters];
}

id objc_msgSend__updateTimeout(void *a1, const char *a2, ...)
{
  return _[a1 _updateTimeout];
}

id objc_msgSend__updateTimer(void *a1, const char *a2, ...)
{
  return _[a1 _updateTimer];
}

id objc_msgSend__updateTintColor(void *a1, const char *a2, ...)
{
  return _[a1 _updateTintColor];
}

id objc_msgSend__updateTitleAndTimeLabel(void *a1, const char *a2, ...)
{
  return _[a1 _updateTitleAndTimeLabel];
}

id objc_msgSend__updateTitleAndValueLabel(void *a1, const char *a2, ...)
{
  return _[a1 _updateTitleAndValueLabel];
}

id objc_msgSend__updateTitleLabel(void *a1, const char *a2, ...)
{
  return _[a1 _updateTitleLabel];
}

id objc_msgSend__updateTrailingView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateTrailingView:");
}

id objc_msgSend__updateValues(void *a1, const char *a2, ...)
{
  return _[a1 _updateValues];
}

id objc_msgSend__updateVisibility(void *a1, const char *a2, ...)
{
  return _[a1 _updateVisibility];
}

id objc_msgSend__updateVisualizations(void *a1, const char *a2, ...)
{
  return _[a1 _updateVisualizations];
}

id objc_msgSend__updateVolumeRendererForRoute_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateVolumeRendererForRoute:");
}

id objc_msgSend__updateWidthConstraint(void *a1, const char *a2, ...)
{
  return _[a1 _updateWidthConstraint];
}

id objc_msgSend__updateWithCurrentServiceSystemState(void *a1, const char *a2, ...)
{
  return _[a1 _updateWithCurrentServiceSystemState];
}

id objc_msgSend__updateWithMenuMode_previousMode_previousBannerContext_activeMenuItem_presentationReason_animated_( void *a1, const char *a2, ...)
{
  return _objc_msgSend( a1,  "_updateWithMenuMode:previousMode:previousBannerContext:activeMenuItem:presentationReason:animated:");
}

id objc_msgSend__updateWithMetadata_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateWithMetadata:");
}

id objc_msgSend__updateWithPlayerResponse_playerResponseItem_isPodcast_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateWithPlayerResponse:playerResponseItem:isPodcast:");
}

id objc_msgSend__updateWithProgressFractionCompleted_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateWithProgressFractionCompleted:");
}

id objc_msgSend__updateWithResponse_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateWithResponse:");
}

id objc_msgSend__updateWithSuggestedUserProfile_notifyObservers_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateWithSuggestedUserProfile:notifyObservers:");
}

id objc_msgSend__updateWithUserImage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateWithUserImage:");
}

id objc_msgSend__updateWithUserProfile_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateWithUserProfile:");
}

id objc_msgSend__updateWithUserProfile_notifyObservers_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateWithUserProfile:notifyObservers:");
}

id objc_msgSend__userImageContent(void *a1, const char *a2, ...)
{
  return _[a1 _userImageContent];
}

id objc_msgSend__userProfileAccountInfoWithUserProfile_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_userProfileAccountInfoWithUserProfile:");
}

id objc_msgSend__visualContentClassForDeviceType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_visualContentClassForDeviceType:");
}

id objc_msgSend__waveformContent(void *a1, const char *a2, ...)
{
  return _[a1 _waveformContent];
}

id objc_msgSend__willDisappear(void *a1, const char *a2, ...)
{
  return _[a1 _willDisappear];
}

id objc_msgSend__zoomFactorFormatter(void *a1, const char *a2, ...)
{
  return _[a1 _zoomFactorFormatter];
}

id objc_msgSend_acceptIncomingCall_wantsStagingArea_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "acceptIncomingCall:wantsStagingArea:completion:");
}

id objc_msgSend_accessibilityMenuOptions(void *a1, const char *a2, ...)
{
  return _[a1 accessibilityMenuOptions];
}

id objc_msgSend_accessory(void *a1, const char *a2, ...)
{
  return _[a1 accessory];
}

id objc_msgSend_acquire(void *a1, const char *a2, ...)
{
  return _[a1 acquire];
}

id objc_msgSend_acquireAssertionWithReason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "acquireAssertionWithReason:");
}

id objc_msgSend_acquireForReason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "acquireForReason:");
}

id objc_msgSend_acquireTimeoutDisabledAssertionWithReason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "acquireTimeoutDisabledAssertionWithReason:");
}

id objc_msgSend_actionSet(void *a1, const char *a2, ...)
{
  return _[a1 actionSet];
}

id objc_msgSend_actionSetItem(void *a1, const char *a2, ...)
{
  return _[a1 actionSetItem];
}

id objc_msgSend_actionSetName(void *a1, const char *a2, ...)
{
  return _[a1 actionSetName];
}

id objc_msgSend_actionWithHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "actionWithHandler:");
}

id objc_msgSend_actionWithTitle_image_identifier_handler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "actionWithTitle:image:identifier:handler:");
}

id objc_msgSend_actionWithTitle_style_handler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "actionWithTitle:style:handler:");
}

id objc_msgSend_activate(void *a1, const char *a2, ...)
{
  return _[a1 activate];
}

id objc_msgSend_activateConstraints_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "activateConstraints:");
}

id objc_msgSend_activateRemoteDisplayDiscovery(void *a1, const char *a2, ...)
{
  return _[a1 activateRemoteDisplayDiscovery];
}

id objc_msgSend_activateWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "activateWithCompletion:");
}

id objc_msgSend_activeActivityAttributions(void *a1, const char *a2, ...)
{
  return _[a1 activeActivityAttributions];
}

id objc_msgSend_activeAndRecentActivityAttributions(void *a1, const char *a2, ...)
{
  return _[a1 activeAndRecentActivityAttributions];
}

id objc_msgSend_activeAppInfoForSensorType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "activeAppInfoForSensorType:");
}

id objc_msgSend_activeAttributionData(void *a1, const char *a2, ...)
{
  return _[a1 activeAttributionData];
}

id objc_msgSend_activeBulletin(void *a1, const char *a2, ...)
{
  return _[a1 activeBulletin];
}

id objc_msgSend_activeCameraAppInfo(void *a1, const char *a2, ...)
{
  return _[a1 activeCameraAppInfo];
}

id objc_msgSend_activeConfiguration(void *a1, const char *a2, ...)
{
  return _[a1 activeConfiguration];
}

id objc_msgSend_activeConversations(void *a1, const char *a2, ...)
{
  return _[a1 activeConversations];
}

id objc_msgSend_activeInterfaceType(void *a1, const char *a2, ...)
{
  return _[a1 activeInterfaceType];
}

id objc_msgSend_activeLocationActivityAttributions(void *a1, const char *a2, ...)
{
  return _[a1 activeLocationActivityAttributions];
}

id objc_msgSend_activeMenuItem(void *a1, const char *a2, ...)
{
  return _[a1 activeMenuItem];
}

id objc_msgSend_activeMicAppInfo(void *a1, const char *a2, ...)
{
  return _[a1 activeMicAppInfo];
}

id objc_msgSend_activePresentable(void *a1, const char *a2, ...)
{
  return _[a1 activePresentable];
}

id objc_msgSend_activeSplitConversation(void *a1, const char *a2, ...)
{
  return _[a1 activeSplitConversation];
}

id objc_msgSend_activeSuspensionReasons(void *a1, const char *a2, ...)
{
  return _[a1 activeSuspensionReasons];
}

id objc_msgSend_activity(void *a1, const char *a2, ...)
{
  return _[a1 activity];
}

id objc_msgSend_activityAttribution(void *a1, const char *a2, ...)
{
  return _[a1 activityAttribution];
}

id objc_msgSend_activitySessions(void *a1, const char *a2, ...)
{
  return _[a1 activitySessions];
}

id objc_msgSend_actuallySetActiveMenuItem_presentationReason_focusHeading_orthogonalNavigation_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "actuallySetActiveMenuItem:presentationReason:focusHeading:orthogonalNavigation:");
}

id objc_msgSend_addAction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addAction:");
}

id objc_msgSend_addActivationReason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addActivationReason:");
}

id objc_msgSend_addAnimation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addAnimation:");
}

id objc_msgSend_addAnimation_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addAnimation:forKey:");
}

id objc_msgSend_addAnimations_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addAnimations:");
}

id objc_msgSend_addArrangedSubview_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addArrangedSubview:");
}

id objc_msgSend_addAttributes_range_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addAttributes:range:");
}

id objc_msgSend_addAttributionIfMatched_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addAttributionIfMatched:");
}

id objc_msgSend_addButton_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addButton:");
}

id objc_msgSend_addChildTransaction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addChildTransaction:");
}

id objc_msgSend_addChildTransaction_withSchedulingPolicy_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addChildTransaction:withSchedulingPolicy:");
}

id objc_msgSend_addChildViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addChildViewController:");
}

id objc_msgSend_addCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addCompletion:");
}

id objc_msgSend_addControllerObserver_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addControllerObserver:");
}

id objc_msgSend_addCoordinatedAnimations_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addCoordinatedAnimations:completion:");
}

id objc_msgSend_addDelegate_queue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addDelegate:queue:");
}

id objc_msgSend_addEntriesFromDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addEntriesFromDictionary:");
}

id objc_msgSend_addFailureBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addFailureBlock:");
}

id objc_msgSend_addGestureRecognizer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addGestureRecognizer:");
}

id objc_msgSend_addHomeObserver_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addHomeObserver:");
}

id objc_msgSend_addInput_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addInput:");
}

id objc_msgSend_addLayoutGuide_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addLayoutGuide:");
}

id objc_msgSend_addMenuItemObserver_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addMenuItemObserver:");
}

id objc_msgSend_addMilestone_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addMilestone:");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObject:");
}

id objc_msgSend_addObjectsFromArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObjectsFromArray:");
}

id objc_msgSend_addObserver_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObserver:");
}

id objc_msgSend_addObserver_forKeyPath_options_context_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObserver:forKeyPath:options:context:");
}

id objc_msgSend_addObserver_selector_name_object_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObserver:selector:name:object:");
}

id objc_msgSend_addObserver_userInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObserver:userInfo:");
}

id objc_msgSend_addObserverBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObserverBlock:");
}

id objc_msgSend_addObserverForName_object_queue_usingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObserverForName:object:queue:usingBlock:");
}

id objc_msgSend_addOrthogonalNavigationFocusSinkView(void *a1, const char *a2, ...)
{
  return _[a1 addOrthogonalNavigationFocusSinkView];
}

id objc_msgSend_addOutput_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addOutput:");
}

id objc_msgSend_addPairableDevicesObserver_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addPairableDevicesObserver:");
}

id objc_msgSend_addPairedDevicesObserver_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addPairedDevicesObserver:");
}

id objc_msgSend_addPermanentObserverForProperty_notifyInitial_invokeOnMainThread_handler_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addPermanentObserverForProperty:notifyInitial:invokeOnMainThread:handler:");
}

id objc_msgSend_addPresentableObserver_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addPresentableObserver:");
}

id objc_msgSend_addProviderObserver_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addProviderObserver:");
}

id objc_msgSend_addResourceWithType_fileURL_options_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addResourceWithType:fileURL:options:");
}

id objc_msgSend_addStateObserver_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addStateObserver:");
}

id objc_msgSend_addStateTransitionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addStateTransitionHandler:");
}

id objc_msgSend_addSublayer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addSublayer:");
}

id objc_msgSend_addSubview_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addSubview:");
}

id objc_msgSend_addSuccessBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addSuccessBlock:");
}

id objc_msgSend_addSymbolEffect_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addSymbolEffect:");
}

id objc_msgSend_addTarget_action_forControlEvents_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addTarget:action:forControlEvents:");
}

id objc_msgSend_addToRunLoop_forMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addToRunLoop:forMode:");
}

id objc_msgSend_addTransaction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addTransaction:");
}

id objc_msgSend_addTransactionDidCompleteBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addTransactionDidCompleteBlock:");
}

id objc_msgSend_addTransactionDidFinishWorkBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addTransactionDidFinishWorkBlock:");
}

id objc_msgSend_addTransactionWillBeginBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addTransactionWillBeginBlock:");
}

id objc_msgSend_addVisibleObserver_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addVisibleObserver:");
}

id objc_msgSend_addVisualization_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addVisualization:");
}

id objc_msgSend_adjustmentCoefficients(void *a1, const char *a2, ...)
{
  return _[a1 adjustmentCoefficients];
}

id objc_msgSend_adjustsFontForContentSizeCategory_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "adjustsFontForContentSizeCategory:");
}

id objc_msgSend_adjustsFontSizeToFitWidth_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "adjustsFontSizeToFitWidth:");
}

id objc_msgSend_affineTransform(void *a1, const char *a2, ...)
{
  return _[a1 affineTransform];
}

id objc_msgSend_airPlayRenderer(void *a1, const char *a2, ...)
{
  return _[a1 airPlayRenderer];
}

id objc_msgSend_album(void *a1, const char *a2, ...)
{
  return _[a1 album];
}

id objc_msgSend_albumTitle(void *a1, const char *a2, ...)
{
  return _[a1 albumTitle];
}

id objc_msgSend_alertControllerWithTitle_message_preferredStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "alertControllerWithTitle:message:preferredStyle:");
}

id objc_msgSend_alignView_inside_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "alignView:inside:");
}

id objc_msgSend_alignView_inside_withConstantInset_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "alignView:inside:withConstantInset:");
}

id objc_msgSend_alignView_inside_withInsets_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "alignView:inside:withInsets:");
}

id objc_msgSend_allAXItems(void *a1, const char *a2, ...)
{
  return _[a1 allAXItems];
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return _[a1 allKeys];
}

id objc_msgSend_allObjects(void *a1, const char *a2, ...)
{
  return _[a1 allObjects];
}

id objc_msgSend_allValues(void *a1, const char *a2, ...)
{
  return _[a1 allValues];
}

id objc_msgSend_allocWithZone_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "allocWithZone:");
}

id objc_msgSend_allowAnimatedUpdates(void *a1, const char *a2, ...)
{
  return _[a1 allowAnimatedUpdates];
}

id objc_msgSend_allowHeadphoneMoviesToPlay(void *a1, const char *a2, ...)
{
  return _[a1 allowHeadphoneMoviesToPlay];
}

id objc_msgSend_allowsFilters(void *a1, const char *a2, ...)
{
  return _[a1 allowsFilters];
}

id objc_msgSend_allowsSelectedBackground(void *a1, const char *a2, ...)
{
  return _[a1 allowsSelectedBackground];
}

id objc_msgSend_alpha(void *a1, const char *a2, ...)
{
  return _[a1 alpha];
}

id objc_msgSend_alpha_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "alpha:");
}

id objc_msgSend_altDSID(void *a1, const char *a2, ...)
{
  return _[a1 altDSID];
}

id objc_msgSend_amplitudeCount(void *a1, const char *a2, ...)
{
  return _[a1 amplitudeCount];
}

id objc_msgSend_amplitudeGain(void *a1, const char *a2, ...)
{
  return _[a1 amplitudeGain];
}

id objc_msgSend_amplitudes(void *a1, const char *a2, ...)
{
  return _[a1 amplitudes];
}

id objc_msgSend_analyticsManager(void *a1, const char *a2, ...)
{
  return _[a1 analyticsManager];
}

id objc_msgSend_angleForValue_total_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "angleForValue:total:");
}

id objc_msgSend_animateIn(void *a1, const char *a2, ...)
{
  return _[a1 animateIn];
}

id objc_msgSend_animateOut(void *a1, const char *a2, ...)
{
  return _[a1 animateOut];
}

id objc_msgSend_animateWithDuration_animations_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "animateWithDuration:animations:");
}

id objc_msgSend_animateWithDuration_animations_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "animateWithDuration:animations:completion:");
}

id objc_msgSend_animateWithDuration_delay_usingSpringWithDamping_initialSpringVelocity_options_animations_completion_( void *a1, const char *a2, ...)
{
  return _objc_msgSend( a1,  "animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:");
}

id objc_msgSend_animated(void *a1, const char *a2, ...)
{
  return _[a1 animated];
}

id objc_msgSend_animation(void *a1, const char *a2, ...)
{
  return _[a1 animation];
}

id objc_msgSend_animationContext(void *a1, const char *a2, ...)
{
  return _[a1 animationContext];
}

id objc_msgSend_animationDuration(void *a1, const char *a2, ...)
{
  return _[a1 animationDuration];
}

id objc_msgSend_animationForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "animationForKey:");
}

id objc_msgSend_animationTransactionForAnimationContext_animated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "animationTransactionForAnimationContext:animated:");
}

id objc_msgSend_animationWithKeyPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "animationWithKeyPath:");
}

id objc_msgSend_appInfos(void *a1, const char *a2, ...)
{
  return _[a1 appInfos];
}

id objc_msgSend_appendArray_withKey_skipIfEmpty_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appendArray:withKey:skipIfEmpty:");
}

id objc_msgSend_appendArraySection_withName_skipIfEmpty_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appendArraySection:withName:skipIfEmpty:");
}

id objc_msgSend_appendArraySection_withName_skipIfEmpty_objectTransformer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appendArraySection:withName:skipIfEmpty:objectTransformer:");
}

id objc_msgSend_appendAttributedString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appendAttributedString:");
}

id objc_msgSend_appendBodySectionWithName_multilinePrefix_block_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appendBodySectionWithName:multilinePrefix:block:");
}

id objc_msgSend_appendBool_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appendBool:");
}

id objc_msgSend_appendBool_counterpart_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appendBool:counterpart:");
}

id objc_msgSend_appendBool_withKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appendBool:withKey:");
}

id objc_msgSend_appendBool_withName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appendBool:withName:");
}

id objc_msgSend_appendBool_withName_ifEqualTo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appendBool:withName:ifEqualTo:");
}

id objc_msgSend_appendCGFloat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appendCGFloat:");
}

id objc_msgSend_appendCGFloat_counterpart_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appendCGFloat:counterpart:");
}

id objc_msgSend_appendDouble_counterpart_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appendDouble:counterpart:");
}

id objc_msgSend_appendEqualsBlocks_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appendEqualsBlocks:");
}

id objc_msgSend_appendFloat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appendFloat:");
}

id objc_msgSend_appendFloat_counterpart_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appendFloat:counterpart:");
}

id objc_msgSend_appendFloat_withName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appendFloat:withName:");
}

id objc_msgSend_appendFloat_withName_decimalPrecision_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appendFloat:withName:decimalPrecision:");
}

id objc_msgSend_appendFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appendFormat:");
}

id objc_msgSend_appendHashingBlocks_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appendHashingBlocks:");
}

id objc_msgSend_appendInteger_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appendInteger:");
}

id objc_msgSend_appendInteger_counterpart_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appendInteger:counterpart:");
}

id objc_msgSend_appendInteger_withName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appendInteger:withName:");
}

id objc_msgSend_appendObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appendObject:");
}

id objc_msgSend_appendObject_counterpart_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appendObject:counterpart:");
}

id objc_msgSend_appendObject_withKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appendObject:withKey:");
}

id objc_msgSend_appendObject_withName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appendObject:withName:");
}

id objc_msgSend_appendObject_withName_skipIfNil_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appendObject:withName:skipIfNil:");
}

id objc_msgSend_appendPoint_withName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appendPoint:withName:");
}

id objc_msgSend_appendPointer_withName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appendPointer:withName:");
}

id objc_msgSend_appendSize_withName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appendSize:withName:");
}

id objc_msgSend_appendString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appendString:");
}

id objc_msgSend_appendString_counterpart_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appendString:counterpart:");
}

id objc_msgSend_appendString_withKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appendString:withKey:");
}

id objc_msgSend_appendString_withName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appendString:withName:");
}

id objc_msgSend_appendTimeInterval_withName_decomposeUnits_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appendTimeInterval:withName:decomposeUnits:");
}

id objc_msgSend_appendUnsignedInteger_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appendUnsignedInteger:");
}

id objc_msgSend_appendUnsignedInteger_counterpart_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appendUnsignedInteger:counterpart:");
}

id objc_msgSend_appendUnsignedInteger_withName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appendUnsignedInteger:withName:");
}

id objc_msgSend_applyContent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "applyContent:");
}

id objc_msgSend_applyContent_animator_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "applyContent:animator:");
}

id objc_msgSend_applyContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "applyContext:");
}

id objc_msgSend_applyLayout_animator_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "applyLayout:animator:");
}

id objc_msgSend_applyLayoutResult_managedSubviews_animator_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "applyLayoutResult:managedSubviews:animator:");
}

id objc_msgSend_applyLeadingImageMargins_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "applyLeadingImageMargins:");
}

id objc_msgSend_applyStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "applyStyle:");
}

id objc_msgSend_applyStylings(void *a1, const char *a2, ...)
{
  return _[a1 applyStylings];
}

id objc_msgSend_applyingSymbolConfiguration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "applyingSymbolConfiguration:");
}

id objc_msgSend_arcPathForBounds_percentComplete_timerSize_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arcPathForBounds:percentComplete:timerSize:");
}

id objc_msgSend_archivedDataWithRootObject_requiringSecureCoding_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "archivedDataWithRootObject:requiringSecureCoding:error:");
}

id objc_msgSend_areRestrictionsEnabled(void *a1, const char *a2, ...)
{
  return _[a1 areRestrictionsEnabled];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return _[a1 array];
}

id objc_msgSend_arrayByAddingObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayByAddingObject:");
}

id objc_msgSend_arrayByAddingObjectsFromArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayByAddingObjectsFromArray:");
}

id objc_msgSend_arrayWithArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithArray:");
}

id objc_msgSend_arrayWithCapacity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithCapacity:");
}

id objc_msgSend_arrayWithContentsOfURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithContentsOfURL:");
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_artist(void *a1, const char *a2, ...)
{
  return _[a1 artist];
}

id objc_msgSend_artistTitle(void *a1, const char *a2, ...)
{
  return _[a1 artistTitle];
}

id objc_msgSend_artworkCatalog(void *a1, const char *a2, ...)
{
  return _[a1 artworkCatalog];
}

id objc_msgSend_artworkToken(void *a1, const char *a2, ...)
{
  return _[a1 artworkToken];
}

id objc_msgSend_assertionWithIdentifier_stateDidChangeHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "assertionWithIdentifier:stateDidChangeHandler:");
}

id objc_msgSend_associatedNetwork(void *a1, const char *a2, ...)
{
  return _[a1 associatedNetwork];
}

id objc_msgSend_attentionAwarenessClient(void *a1, const char *a2, ...)
{
  return _[a1 attentionAwarenessClient];
}

id objc_msgSend_attentionMonitor(void *a1, const char *a2, ...)
{
  return _[a1 attentionMonitor];
}

id objc_msgSend_attentionMonitorDidRequestDismissal_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "attentionMonitorDidRequestDismissal:");
}

id objc_msgSend_attributedEntity(void *a1, const char *a2, ...)
{
  return _[a1 attributedEntity];
}

id objc_msgSend_attributedStringWithAttachment_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "attributedStringWithAttachment:");
}

id objc_msgSend_attributedSubtitle(void *a1, const char *a2, ...)
{
  return _[a1 attributedSubtitle];
}

id objc_msgSend_attributedTitle(void *a1, const char *a2, ...)
{
  return _[a1 attributedTitle];
}

id objc_msgSend_attributionMatchesGroup_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "attributionMatchesGroup:");
}

id objc_msgSend_attributions(void *a1, const char *a2, ...)
{
  return _[a1 attributions];
}

id objc_msgSend_attributions_wasUsedRecentlyForSensorType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "attributions:wasUsedRecentlyForSensorType:");
}

id objc_msgSend_audioAnalyzer_didUpdateWaveform_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "audioAnalyzer:didUpdateWaveform:");
}

id objc_msgSend_audioAnalyzerForPID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "audioAnalyzerForPID:");
}

id objc_msgSend_audioFormatContentInfo(void *a1, const char *a2, ...)
{
  return _[a1 audioFormatContentInfo];
}

id objc_msgSend_audioFormatController(void *a1, const char *a2, ...)
{
  return _[a1 audioFormatController];
}

id objc_msgSend_audioFormatDescription(void *a1, const char *a2, ...)
{
  return _[a1 audioFormatDescription];
}

id objc_msgSend_audioNowPlayingController(void *a1, const char *a2, ...)
{
  return _[a1 audioNowPlayingController];
}

id objc_msgSend_audioRecordingActivityAttribution(void *a1, const char *a2, ...)
{
  return _[a1 audioRecordingActivityAttribution];
}

id objc_msgSend_audioRoutingController(void *a1, const char *a2, ...)
{
  return _[a1 audioRoutingController];
}

id objc_msgSend_auditToken(void *a1, const char *a2, ...)
{
  return _[a1 auditToken];
}

id objc_msgSend_autoupdatingCurrentCalendar(void *a1, const char *a2, ...)
{
  return _[a1 autoupdatingCurrentCalendar];
}

id objc_msgSend_avMode(void *a1, const char *a2, ...)
{
  return _[a1 avMode];
}

id objc_msgSend_avPlayer(void *a1, const char *a2, ...)
{
  return _[a1 avPlayer];
}

id objc_msgSend_avSession(void *a1, const char *a2, ...)
{
  return _[a1 avSession];
}

id objc_msgSend_availableActivitySession(void *a1, const char *a2, ...)
{
  return _[a1 availableActivitySession];
}

id objc_msgSend_availableFrameSenderEndpointsByPID(void *a1, const char *a2, ...)
{
  return _[a1 availableFrameSenderEndpointsByPID];
}

id objc_msgSend_availableListeningModes(void *a1, const char *a2, ...)
{
  return _[a1 availableListeningModes];
}

id objc_msgSend_availableRoutes(void *a1, const char *a2, ...)
{
  return _[a1 availableRoutes];
}

id objc_msgSend_availableScheduledSleepRequests(void *a1, const char *a2, ...)
{
  return _[a1 availableScheduledSleepRequests];
}

id objc_msgSend_axis(void *a1, const char *a2, ...)
{
  return _[a1 axis];
}

id objc_msgSend_backgroundBarColor(void *a1, const char *a2, ...)
{
  return _[a1 backgroundBarColor];
}

id objc_msgSend_backgroundCircleLayer(void *a1, const char *a2, ...)
{
  return _[a1 backgroundCircleLayer];
}

id objc_msgSend_backgroundColor(void *a1, const char *a2, ...)
{
  return _[a1 backgroundColor];
}

id objc_msgSend_backgroundColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "backgroundColor:");
}

id objc_msgSend_backgroundColorView(void *a1, const char *a2, ...)
{
  return _[a1 backgroundColorView];
}

id objc_msgSend_backingStore(void *a1, const char *a2, ...)
{
  return _[a1 backingStore];
}

id objc_msgSend_bannerAppToastMaximumSize(void *a1, const char *a2, ...)
{
  return _[a1 bannerAppToastMaximumSize];
}

id objc_msgSend_bannerAppToastMinimumSize(void *a1, const char *a2, ...)
{
  return _[a1 bannerAppToastMinimumSize];
}

id objc_msgSend_bannerAppToastTopSpacing(void *a1, const char *a2, ...)
{
  return _[a1 bannerAppToastTopSpacing];
}

id objc_msgSend_bannerAppToastTrailingSpacing(void *a1, const char *a2, ...)
{
  return _[a1 bannerAppToastTrailingSpacing];
}

id objc_msgSend_bannerConfiguration(void *a1, const char *a2, ...)
{
  return _[a1 bannerConfiguration];
}

id objc_msgSend_bannerContainerViewController(void *a1, const char *a2, ...)
{
  return _[a1 bannerContainerViewController];
}

id objc_msgSend_bannerContentView(void *a1, const char *a2, ...)
{
  return _[a1 bannerContentView];
}

id objc_msgSend_bannerContext(void *a1, const char *a2, ...)
{
  return _[a1 bannerContext];
}

id objc_msgSend_bannerManager(void *a1, const char *a2, ...)
{
  return _[a1 bannerManager];
}

id objc_msgSend_bannerManager_relinquishesExternalGestures_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bannerManager:relinquishesExternalGestures:");
}

id objc_msgSend_bannerManager_requestsExternalGestures_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bannerManager:requestsExternalGestures:");
}

id objc_msgSend_bannerManagerRelinquishesFocus_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bannerManagerRelinquishesFocus:");
}

id objc_msgSend_bannerManagerRequestsFocus_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bannerManagerRequestsFocus:");
}

id objc_msgSend_bannerMaximumSize(void *a1, const char *a2, ...)
{
  return _[a1 bannerMaximumSize];
}

id objc_msgSend_bannerMinimumSize(void *a1, const char *a2, ...)
{
  return _[a1 bannerMinimumSize];
}

id objc_msgSend_bannerPresentationState(void *a1, const char *a2, ...)
{
  return _[a1 bannerPresentationState];
}

id objc_msgSend_bannerPresenterMenuModeStateContributor(void *a1, const char *a2, ...)
{
  return _[a1 bannerPresenterMenuModeStateContributor];
}

id objc_msgSend_bannerSourceLayoutDescriptionWithPresentationSize_containerSize_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bannerSourceLayoutDescriptionWithPresentationSize:containerSize:");
}

id objc_msgSend_bannerTemplate(void *a1, const char *a2, ...)
{
  return _[a1 bannerTemplate];
}

id objc_msgSend_bannerViewController(void *a1, const char *a2, ...)
{
  return _[a1 bannerViewController];
}

id objc_msgSend_barColor(void *a1, const char *a2, ...)
{
  return _[a1 barColor];
}

id objc_msgSend_barTopToCenterYConstraint(void *a1, const char *a2, ...)
{
  return _[a1 barTopToCenterYConstraint];
}

id objc_msgSend_barWidth(void *a1, const char *a2, ...)
{
  return _[a1 barWidth];
}

id objc_msgSend_batteryLevel(void *a1, const char *a2, ...)
{
  return _[a1 batteryLevel];
}

id objc_msgSend_batteryLevelImageConfigurationForBatteryLevel_isCharging_userInterfaceStyle_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "batteryLevelImageConfigurationForBatteryLevel:isCharging:userInterfaceStyle:");
}

id objc_msgSend_batteryLevelImageConfigurationForBatteryLevel_userInterfaceStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "batteryLevelImageConfigurationForBatteryLevel:userInterfaceStyle:");
}

id objc_msgSend_batteryState(void *a1, const char *a2, ...)
{
  return _[a1 batteryState];
}

id objc_msgSend_batteryStateDescriptionForBatteryLevel_batteryState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "batteryStateDescriptionForBatteryLevel:batteryState:");
}

id objc_msgSend_batteryStateDescriptionForBatteryState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "batteryStateDescriptionForBatteryState:");
}

id objc_msgSend_becomeFirstResponder(void *a1, const char *a2, ...)
{
  return _[a1 becomeFirstResponder];
}

id objc_msgSend_begin(void *a1, const char *a2, ...)
{
  return _[a1 begin];
}

id objc_msgSend_beginAppearanceTransition_animated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "beginAppearanceTransition:animated:");
}

id objc_msgSend_beginAutomaticResponseLoading(void *a1, const char *a2, ...)
{
  return _[a1 beginAutomaticResponseLoading];
}

id objc_msgSend_beginIntervalWithTimeOverride_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "beginIntervalWithTimeOverride:");
}

id objc_msgSend_beginLoadingUpdates(void *a1, const char *a2, ...)
{
  return _[a1 beginLoadingUpdates];
}

id objc_msgSend_beginTime(void *a1, const char *a2, ...)
{
  return _[a1 beginTime];
}

id objc_msgSend_bestAvailableAudioFormat(void *a1, const char *a2, ...)
{
  return _[a1 bestAvailableAudioFormat];
}

id objc_msgSend_bezierPathWithArcCenter_radius_startAngle_endAngle_clockwise_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:");
}

id objc_msgSend_bezierPathWithOvalInRect_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bezierPathWithOvalInRect:");
}

id objc_msgSend_binSamples_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "binSamples:count:");
}

id objc_msgSend_blackColor(void *a1, const char *a2, ...)
{
  return _[a1 blackColor];
}

id objc_msgSend_bluetoothAudioFormat(void *a1, const char *a2, ...)
{
  return _[a1 bluetoothAudioFormat];
}

id objc_msgSend_bluetoothAudioRouteGlyphForDisplayStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bluetoothAudioRouteGlyphForDisplayStyle:");
}

id objc_msgSend_bluetoothControllerPairableDevicesDidUpdate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bluetoothControllerPairableDevicesDidUpdate:");
}

id objc_msgSend_bluetoothControllerPairedDevicesDidUpdate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bluetoothControllerPairedDevicesDidUpdate:");
}

id objc_msgSend_bluetoothRemoteController_didUpdateCurrentRemote_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bluetoothRemoteController:didUpdateCurrentRemote:");
}

id objc_msgSend_bluetoothRemoteManagerDidUpdate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bluetoothRemoteManagerDidUpdate:");
}

id objc_msgSend_BOOLForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "BOOLForKey:");
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return _[a1 BOOLValue];
}

id objc_msgSend_bottomAnchor(void *a1, const char *a2, ...)
{
  return _[a1 bottomAnchor];
}

id objc_msgSend_bounceDownEffect(void *a1, const char *a2, ...)
{
  return _[a1 bounceDownEffect];
}

id objc_msgSend_boundingFrame(void *a1, const char *a2, ...)
{
  return _[a1 boundingFrame];
}

id objc_msgSend_boundingRectWithSize_options_attributes_context_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "boundingRectWithSize:options:attributes:context:");
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return _[a1 bounds];
}

id objc_msgSend_bringSubviewToFront_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bringSubviewToFront:");
}

id objc_msgSend_bs_containsObjectPassingTest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bs_containsObjectPassingTest:");
}

id objc_msgSend_bs_filter_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bs_filter:");
}

id objc_msgSend_bs_firstObjectPassingTest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bs_firstObjectPassingTest:");
}

id objc_msgSend_bs_map_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bs_map:");
}

id objc_msgSend_bs_safeNumberForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bs_safeNumberForKey:");
}

id objc_msgSend_build(void *a1, const char *a2, ...)
{
  return _[a1 build];
}

id objc_msgSend_builder(void *a1, const char *a2, ...)
{
  return _[a1 builder];
}

id objc_msgSend_builderWithObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "builderWithObject:");
}

id objc_msgSend_builderWithObject_ofExpectedClass_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "builderWithObject:ofExpectedClass:");
}

id objc_msgSend_bulletinConfiguration(void *a1, const char *a2, ...)
{
  return _[a1 bulletinConfiguration];
}

id objc_msgSend_bulletinData(void *a1, const char *a2, ...)
{
  return _[a1 bulletinData];
}

id objc_msgSend_bundleForClass_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bundleForClass:");
}

id objc_msgSend_bundleID(void *a1, const char *a2, ...)
{
  return _[a1 bundleID];
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 bundleIdentifier];
}

id objc_msgSend_bundleRecordWithApplicationIdentifier_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bundleRecordWithApplicationIdentifier:error:");
}

id objc_msgSend_bundleWithIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bundleWithIdentifier:");
}

id objc_msgSend_buttonWithConfiguration_primaryAction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "buttonWithConfiguration:primaryAction:");
}

id objc_msgSend_buttonWithTitle_type_handler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "buttonWithTitle:type:handler:");
}

id objc_msgSend_caPackageView(void *a1, const char *a2, ...)
{
  return _[a1 caPackageView];
}

id objc_msgSend_cachedMediaPlayerViews(void *a1, const char *a2, ...)
{
  return _[a1 cachedMediaPlayerViews];
}

id objc_msgSend_cachedPlatterState(void *a1, const char *a2, ...)
{
  return _[a1 cachedPlatterState];
}

id objc_msgSend_call(void *a1, const char *a2, ...)
{
  return _[a1 call];
}

id objc_msgSend_callCenter(void *a1, const char *a2, ...)
{
  return _[a1 callCenter];
}

id objc_msgSend_callControlsStylingBlockWithSelectionColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "callControlsStylingBlockWithSelectionColor:");
}

id objc_msgSend_callGroupUUID(void *a1, const char *a2, ...)
{
  return _[a1 callGroupUUID];
}

id objc_msgSend_calls(void *a1, const char *a2, ...)
{
  return _[a1 calls];
}

id objc_msgSend_callsPassingTest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "callsPassingTest:");
}

id objc_msgSend_cameraAppInfo(void *a1, const char *a2, ...)
{
  return _[a1 cameraAppInfo];
}

id objc_msgSend_cameraCaptureAttribution(void *a1, const char *a2, ...)
{
  return _[a1 cameraCaptureAttribution];
}

id objc_msgSend_cameraContentFromBackingStore_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cameraContentFromBackingStore:");
}

id objc_msgSend_cameraIdentifiers(void *a1, const char *a2, ...)
{
  return _[a1 cameraIdentifiers];
}

id objc_msgSend_cameraIndicatorPixelShifter(void *a1, const char *a2, ...)
{
  return _[a1 cameraIndicatorPixelShifter];
}

id objc_msgSend_cameraIsAvailableForTVSystemUI(void *a1, const char *a2, ...)
{
  return _[a1 cameraIsAvailableForTVSystemUI];
}

id objc_msgSend_cameraItem(void *a1, const char *a2, ...)
{
  return _[a1 cameraItem];
}

id objc_msgSend_cameraItems(void *a1, const char *a2, ...)
{
  return _[a1 cameraItems];
}

id objc_msgSend_cameraLensSwitcherViewDidChangeLensSelection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cameraLensSwitcherViewDidChangeLensSelection:");
}

id objc_msgSend_cameraLensSwitcherViewDidChangeManuallyFraming_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cameraLensSwitcherViewDidChangeManuallyFraming:");
}

id objc_msgSend_cameraLensSwitcherViewDidResetDefaultZoomFactor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cameraLensSwitcherViewDidResetDefaultZoomFactor:");
}

id objc_msgSend_cameraPreviewHeight(void *a1, const char *a2, ...)
{
  return _[a1 cameraPreviewHeight];
}

id objc_msgSend_cameraView(void *a1, const char *a2, ...)
{
  return _[a1 cameraView];
}

id objc_msgSend_cameraViewFour(void *a1, const char *a2, ...)
{
  return _[a1 cameraViewFour];
}

id objc_msgSend_cameraViewOne(void *a1, const char *a2, ...)
{
  return _[a1 cameraViewOne];
}

id objc_msgSend_cameraViewThree(void *a1, const char *a2, ...)
{
  return _[a1 cameraViewThree];
}

id objc_msgSend_cameraViewTwo(void *a1, const char *a2, ...)
{
  return _[a1 cameraViewTwo];
}

id objc_msgSend_camerasByIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 camerasByIdentifier];
}

id objc_msgSend_canAddInput_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "canAddInput:");
}

id objc_msgSend_canAddOutput_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "canAddOutput:");
}

id objc_msgSend_cancelScheduledSleepWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cancelScheduledSleepWithCompletion:");
}

id objc_msgSend_cancelTimeoutTimer(void *a1, const char *a2, ...)
{
  return _[a1 cancelTimeoutTimer];
}

id objc_msgSend_cellClass(void *a1, const char *a2, ...)
{
  return _[a1 cellClass];
}

id objc_msgSend_center(void *a1, const char *a2, ...)
{
  return _[a1 center];
}

id objc_msgSend_centerXAnchor(void *a1, const char *a2, ...)
{
  return _[a1 centerXAnchor];
}

id objc_msgSend_centerYAnchor(void *a1, const char *a2, ...)
{
  return _[a1 centerYAnchor];
}

id objc_msgSend_changedMetadataKeysAfterUpdatingWithMetadata_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "changedMetadataKeysAfterUpdatingWithMetadata:");
}

id objc_msgSend_circlePathForBounds_timerSize_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "circlePathForBounds:timerSize:");
}

id objc_msgSend_classForCoder(void *a1, const char *a2, ...)
{
  return _[a1 classForCoder];
}

id objc_msgSend_clearColor(void *a1, const char *a2, ...)
{
  return _[a1 clearColor];
}

id objc_msgSend_clearMediaPlayerViewCache(void *a1, const char *a2, ...)
{
  return _[a1 clearMediaPlayerViewCache];
}

id objc_msgSend_clearPreferredFocusedIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 clearPreferredFocusedIdentifier];
}

id objc_msgSend_client(void *a1, const char *a2, ...)
{
  return _[a1 client];
}

id objc_msgSend_clipsToBounds_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clipsToBounds:");
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return _[a1 code];
}

id objc_msgSend_color(void *a1, const char *a2, ...)
{
  return _[a1 color];
}

id objc_msgSend_colorAllShapeSublayers_ofLayer_usingFilter_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "colorAllShapeSublayers:ofLayer:usingFilter:");
}

id objc_msgSend_colorWithAlphaComponent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "colorWithAlphaComponent:");
}

id objc_msgSend_colorWithDynamicProvider_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "colorWithDynamicProvider:");
}

id objc_msgSend_colorWithRed_green_blue_alpha_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "colorWithRed:green:blue:alpha:");
}

id objc_msgSend_colorWithWhite_alpha_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "colorWithWhite:alpha:");
}

id objc_msgSend_columnWithIdentifiers_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "columnWithIdentifiers:");
}

id objc_msgSend_columnWithIdentifiers_itemHeights_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "columnWithIdentifiers:itemHeights:");
}

id objc_msgSend_commit(void *a1, const char *a2, ...)
{
  return _[a1 commit];
}

id objc_msgSend_compare_options_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "compare:options:");
}

id objc_msgSend_components_fromDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "components:fromDate:");
}

id objc_msgSend_componentsJoinedByString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "componentsJoinedByString:");
}

id objc_msgSend_componentsSeparatedByString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "componentsSeparatedByString:");
}

id objc_msgSend_compositingFilter_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "compositingFilter:");
}

id objc_msgSend_computeFFTWithSamples_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "computeFFTWithSamples:");
}

id objc_msgSend_conduit(void *a1, const char *a2, ...)
{
  return _[a1 conduit];
}

id objc_msgSend_configuration(void *a1, const char *a2, ...)
{
  return _[a1 configuration];
}

id objc_msgSend_configurationByApplyingConfiguration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "configurationByApplyingConfiguration:");
}

id objc_msgSend_configurationForDefaultMainDisplayMonitor(void *a1, const char *a2, ...)
{
  return _[a1 configurationForDefaultMainDisplayMonitor];
}

id objc_msgSend_configurationPreferringMonochrome(void *a1, const char *a2, ...)
{
  return _[a1 configurationPreferringMonochrome];
}

id objc_msgSend_configurationPreferringMulticolor(void *a1, const char *a2, ...)
{
  return _[a1 configurationPreferringMulticolor];
}

id objc_msgSend_configurationWithFont_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "configurationWithFont:");
}

id objc_msgSend_configurationWithFont_scale_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "configurationWithFont:scale:");
}

id objc_msgSend_configurationWithIdentifier_previewProvider_actionProvider_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "configurationWithIdentifier:previewProvider:actionProvider:");
}

id objc_msgSend_configurationWithPaletteColors_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "configurationWithPaletteColors:");
}

id objc_msgSend_configurationWithPointSize_weight_scale_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "configurationWithPointSize:weight:scale:");
}

id objc_msgSend_configurationWithStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "configurationWithStyle:");
}

id objc_msgSend_configurationWithTextStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "configurationWithTextStyle:");
}

id objc_msgSend_configurations(void *a1, const char *a2, ...)
{
  return _[a1 configurations];
}

id objc_msgSend_configureCell_withEntry_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "configureCell:withEntry:");
}

id objc_msgSend_configureContentView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "configureContentView:");
}

id objc_msgSend_configureTipsCenter(void *a1, const char *a2, ...)
{
  return _[a1 configureTipsCenter];
}

id objc_msgSend_conformsToProtocol_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "conformsToProtocol:");
}

id objc_msgSend_connect(void *a1, const char *a2, ...)
{
  return _[a1 connect];
}

id objc_msgSend_connectDevice_withCompletionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "connectDevice:withCompletionHandler:");
}

id objc_msgSend_connectDeviceWithIdentifier_withCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "connectDeviceWithIdentifier:withCompletion:");
}

id objc_msgSend_connectedBluetoothRemote(void *a1, const char *a2, ...)
{
  return _[a1 connectedBluetoothRemote];
}

id objc_msgSend_connectedContinuityCameraContentFromBackingStore_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "connectedContinuityCameraContentFromBackingStore:");
}

id objc_msgSend_connectedDeviceName(void *a1, const char *a2, ...)
{
  return _[a1 connectedDeviceName];
}

id objc_msgSend_connectedDevices(void *a1, const char *a2, ...)
{
  return _[a1 connectedDevices];
}

id objc_msgSend_connectedPairedDevices(void *a1, const char *a2, ...)
{
  return _[a1 connectedPairedDevices];
}

id objc_msgSend_connectionFailed(void *a1, const char *a2, ...)
{
  return _[a1 connectionFailed];
}

id objc_msgSend_connectionState(void *a1, const char *a2, ...)
{
  return _[a1 connectionState];
}

id objc_msgSend_connectionStatus(void *a1, const char *a2, ...)
{
  return _[a1 connectionStatus];
}

id objc_msgSend_constraintEqualToAnchor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "constraintEqualToAnchor:");
}

id objc_msgSend_constraintEqualToAnchor_constant_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "constraintEqualToAnchor:constant:");
}

id objc_msgSend_constraintEqualToAnchor_multiplier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "constraintEqualToAnchor:multiplier:");
}

id objc_msgSend_constraintEqualToConstant_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "constraintEqualToConstant:");
}

id objc_msgSend_constraintGreaterThanOrEqualToAnchor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "constraintGreaterThanOrEqualToAnchor:");
}

id objc_msgSend_constraintGreaterThanOrEqualToAnchor_constant_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "constraintGreaterThanOrEqualToAnchor:constant:");
}

id objc_msgSend_constraintGreaterThanOrEqualToConstant_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "constraintGreaterThanOrEqualToConstant:");
}

id objc_msgSend_constraintLessThanOrEqualToAnchor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "constraintLessThanOrEqualToAnchor:");
}

id objc_msgSend_constraintLessThanOrEqualToAnchor_constant_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "constraintLessThanOrEqualToAnchor:constant:");
}

id objc_msgSend_constraintLessThanOrEqualToConstant_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "constraintLessThanOrEqualToConstant:");
}

id objc_msgSend_containerFrame(void *a1, const char *a2, ...)
{
  return _[a1 containerFrame];
}

id objc_msgSend_containerView(void *a1, const char *a2, ...)
{
  return _[a1 containerView];
}

id objc_msgSend_containsFocusedButton(void *a1, const char *a2, ...)
{
  return _[a1 containsFocusedButton];
}

id objc_msgSend_containsObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "containsObject:");
}

id objc_msgSend_containsString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "containsString:");
}

id objc_msgSend_containsView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "containsView:");
}

id objc_msgSend_content(void *a1, const char *a2, ...)
{
  return _[a1 content];
}

id objc_msgSend_contentBehavior(void *a1, const char *a2, ...)
{
  return _[a1 contentBehavior];
}

id objc_msgSend_contentContainerView(void *a1, const char *a2, ...)
{
  return _[a1 contentContainerView];
}

id objc_msgSend_contentDidChange(void *a1, const char *a2, ...)
{
  return _[a1 contentDidChange];
}

id objc_msgSend_contentImage(void *a1, const char *a2, ...)
{
  return _[a1 contentImage];
}

id objc_msgSend_contentImage1(void *a1, const char *a2, ...)
{
  return _[a1 contentImage1];
}

id objc_msgSend_contentImage2(void *a1, const char *a2, ...)
{
  return _[a1 contentImage2];
}

id objc_msgSend_contentImage3(void *a1, const char *a2, ...)
{
  return _[a1 contentImage3];
}

id objc_msgSend_contentInsets(void *a1, const char *a2, ...)
{
  return _[a1 contentInsets];
}

id objc_msgSend_contentIsSelected(void *a1, const char *a2, ...)
{
  return _[a1 contentIsSelected];
}

id objc_msgSend_contentIsSelectedWithIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "contentIsSelectedWithIdentifier:");
}

id objc_msgSend_contentItemIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 contentItemIdentifier];
}

id objc_msgSend_contentItems(void *a1, const char *a2, ...)
{
  return _[a1 contentItems];
}

id objc_msgSend_contentMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "contentMode:");
}

id objc_msgSend_contentOffset(void *a1, const char *a2, ...)
{
  return _[a1 contentOffset];
}

id objc_msgSend_contentPercentage(void *a1, const char *a2, ...)
{
  return _[a1 contentPercentage];
}

id objc_msgSend_contentText1(void *a1, const char *a2, ...)
{
  return _[a1 contentText1];
}

id objc_msgSend_contentText2(void *a1, const char *a2, ...)
{
  return _[a1 contentText2];
}

id objc_msgSend_contentText3(void *a1, const char *a2, ...)
{
  return _[a1 contentText3];
}

id objc_msgSend_contentTitle(void *a1, const char *a2, ...)
{
  return _[a1 contentTitle];
}

id objc_msgSend_contentTitleForIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "contentTitleForIdentifier:");
}

id objc_msgSend_contentView(void *a1, const char *a2, ...)
{
  return _[a1 contentView];
}

id objc_msgSend_contentViewProvider(void *a1, const char *a2, ...)
{
  return _[a1 contentViewProvider];
}

id objc_msgSend_contentWithChildIdentifiers_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "contentWithChildIdentifiers:");
}

id objc_msgSend_contentWithDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "contentWithDictionary:");
}

id objc_msgSend_contentWithTitle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "contentWithTitle:");
}

id objc_msgSend_contentWithTitle_image_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "contentWithTitle:image:");
}

id objc_msgSend_contentWithTitle_image_attrText1_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "contentWithTitle:image:attrText1:");
}

id objc_msgSend_contentWithTitle_image_text1_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "contentWithTitle:image:text1:");
}

id objc_msgSend_contentWithTitle_image_text1_isSelected_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "contentWithTitle:image:text1:isSelected:");
}

id objc_msgSend_context(void *a1, const char *a2, ...)
{
  return _[a1 context];
}

id objc_msgSend_continuityCaptureDevice(void *a1, const char *a2, ...)
{
  return _[a1 continuityCaptureDevice];
}

id objc_msgSend_contributorDelegate(void *a1, const char *a2, ...)
{
  return _[a1 contributorDelegate];
}

id objc_msgSend_contributors(void *a1, const char *a2, ...)
{
  return _[a1 contributors];
}

id objc_msgSend_controlCenterActionSelected_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "controlCenterActionSelected:");
}

id objc_msgSend_controlCenterGlyphPointSize(void *a1, const char *a2, ...)
{
  return _[a1 controlCenterGlyphPointSize];
}

id objc_msgSend_controlCenterSpacerHeight(void *a1, const char *a2, ...)
{
  return _[a1 controlCenterSpacerHeight];
}

id objc_msgSend_controlMode(void *a1, const char *a2, ...)
{
  return _[a1 controlMode];
}

id objc_msgSend_controlState(void *a1, const char *a2, ...)
{
  return _[a1 controlState];
}

id objc_msgSend_controllerForMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "controllerForMode:");
}

id objc_msgSend_controllers(void *a1, const char *a2, ...)
{
  return _[a1 controllers];
}

id objc_msgSend_conversation(void *a1, const char *a2, ...)
{
  return _[a1 conversation];
}

id objc_msgSend_conversationDetectEnabled(void *a1, const char *a2, ...)
{
  return _[a1 conversationDetectEnabled];
}

id objc_msgSend_conversationDetectSupported(void *a1, const char *a2, ...)
{
  return _[a1 conversationDetectSupported];
}

id objc_msgSend_conversationID(void *a1, const char *a2, ...)
{
  return _[a1 conversationID];
}

id objc_msgSend_conversationManager(void *a1, const char *a2, ...)
{
  return _[a1 conversationManager];
}

id objc_msgSend_conversationUUID(void *a1, const char *a2, ...)
{
  return _[a1 conversationUUID];
}

id objc_msgSend_convertPoint_fromView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "convertPoint:fromView:");
}

id objc_msgSend_convertPoint_toView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "convertPoint:toView:");
}

id objc_msgSend_convertRect_toLayer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "convertRect:toLayer:");
}

id objc_msgSend_convertRect_toView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "convertRect:toView:");
}

id objc_msgSend_convertTime_fromLayer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "convertTime:fromLayer:");
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return _[a1 copy];
}

id objc_msgSend_copyWithZone_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "copyWithZone:");
}

id objc_msgSend_cornerRadius_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cornerRadius:");
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return _[a1 count];
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_countItem(void *a1, const char *a2, ...)
{
  return _[a1 countItem];
}

id objc_msgSend_countdownCircleLayer(void *a1, const char *a2, ...)
{
  return _[a1 countdownCircleLayer];
}

id objc_msgSend_counter(void *a1, const char *a2, ...)
{
  return _[a1 counter];
}

id objc_msgSend_createDraft_forProcessNamed_withDisplayReason_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createDraft:forProcessNamed:withDisplayReason:error:");
}

id objc_msgSend_createMediaPlayerViewForRouteUIDIfNecessary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createMediaPlayerViewForRouteUIDIfNecessary:");
}

id objc_msgSend_createPlatterViewControllerWithPresentationContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createPlatterViewControllerWithPresentationContext:");
}

id objc_msgSend_createRadarDraft(void *a1, const char *a2, ...)
{
  return _[a1 createRadarDraft];
}

id objc_msgSend_creationDate(void *a1, const char *a2, ...)
{
  return _[a1 creationDate];
}

id objc_msgSend_creationRequestForAsset(void *a1, const char *a2, ...)
{
  return _[a1 creationRequestForAsset];
}

id objc_msgSend_criticalInfo(void *a1, const char *a2, ...)
{
  return _[a1 criticalInfo];
}

id objc_msgSend_currentBannerContext(void *a1, const char *a2, ...)
{
  return _[a1 currentBannerContext];
}

id objc_msgSend_currentBannerPresentable(void *a1, const char *a2, ...)
{
  return _[a1 currentBannerPresentable];
}

id objc_msgSend_currentCall(void *a1, const char *a2, ...)
{
  return _[a1 currentCall];
}

id objc_msgSend_currentContinuitySession(void *a1, const char *a2, ...)
{
  return _[a1 currentContinuitySession];
}

id objc_msgSend_currentDevice(void *a1, const char *a2, ...)
{
  return _[a1 currentDevice];
}

id objc_msgSend_currentDisplayMode(void *a1, const char *a2, ...)
{
  return _[a1 currentDisplayMode];
}

id objc_msgSend_currentHandler(void *a1, const char *a2, ...)
{
  return _[a1 currentHandler];
}

id objc_msgSend_currentHostingContext(void *a1, const char *a2, ...)
{
  return _[a1 currentHostingContext];
}

id objc_msgSend_currentLocale(void *a1, const char *a2, ...)
{
  return _[a1 currentLocale];
}

id objc_msgSend_currentMediaItem(void *a1, const char *a2, ...)
{
  return _[a1 currentMediaItem];
}

id objc_msgSend_currentMenuItem(void *a1, const char *a2, ...)
{
  return _[a1 currentMenuItem];
}

id objc_msgSend_currentRemote(void *a1, const char *a2, ...)
{
  return _[a1 currentRemote];
}

id objc_msgSend_currentRemoteInfo(void *a1, const char *a2, ...)
{
  return _[a1 currentRemoteInfo];
}

id objc_msgSend_currentRotationTransformForPercentComplete_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "currentRotationTransformForPercentComplete:");
}

id objc_msgSend_currentRows(void *a1, const char *a2, ...)
{
  return _[a1 currentRows];
}

id objc_msgSend_currentRunningAnimationContext(void *a1, const char *a2, ...)
{
  return _[a1 currentRunningAnimationContext];
}

id objc_msgSend_currentScheduledSleep(void *a1, const char *a2, ...)
{
  return _[a1 currentScheduledSleep];
}

id objc_msgSend_currentSessionDeviceHandle(void *a1, const char *a2, ...)
{
  return _[a1 currentSessionDeviceHandle];
}

id objc_msgSend_currentSettings(void *a1, const char *a2, ...)
{
  return _[a1 currentSettings];
}

id objc_msgSend_currentSplitSession(void *a1, const char *a2, ...)
{
  return _[a1 currentSplitSession];
}

id objc_msgSend_currentSplitSessionConversationUUID(void *a1, const char *a2, ...)
{
  return _[a1 currentSplitSessionConversationUUID];
}

id objc_msgSend_currentState(void *a1, const char *a2, ...)
{
  return _[a1 currentState];
}

id objc_msgSend_currentTintColor(void *a1, const char *a2, ...)
{
  return _[a1 currentTintColor];
}

id objc_msgSend_currentUser(void *a1, const char *a2, ...)
{
  return _[a1 currentUser];
}

id objc_msgSend_currentUserControllerDidUpdate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "currentUserControllerDidUpdate:");
}

id objc_msgSend_currentWiFiNetwork(void *a1, const char *a2, ...)
{
  return _[a1 currentWiFiNetwork];
}

id objc_msgSend_cyanColor(void *a1, const char *a2, ...)
{
  return _[a1 cyanColor];
}

id objc_msgSend_cycleImageArray(void *a1, const char *a2, ...)
{
  return _[a1 cycleImageArray];
}

id objc_msgSend_cycleImageTimer(void *a1, const char *a2, ...)
{
  return _[a1 cycleImageTimer];
}

id objc_msgSend_cycleImageView(void *a1, const char *a2, ...)
{
  return _[a1 cycleImageView];
}

id objc_msgSend_cycleNextIndex(void *a1, const char *a2, ...)
{
  return _[a1 cycleNextIndex];
}

id objc_msgSend_darkGrayColor(void *a1, const char *a2, ...)
{
  return _[a1 darkGrayColor];
}

id objc_msgSend_darkPackageName(void *a1, const char *a2, ...)
{
  return _[a1 darkPackageName];
}

id objc_msgSend_data(void *a1, const char *a2, ...)
{
  return _[a1 data];
}

id objc_msgSend_dataAccessAttributions(void *a1, const char *a2, ...)
{
  return _[a1 dataAccessAttributions];
}

id objc_msgSend_dataAccessType(void *a1, const char *a2, ...)
{
  return _[a1 dataAccessType];
}

id objc_msgSend_dataSource(void *a1, const char *a2, ...)
{
  return _[a1 dataSource];
}

id objc_msgSend_dataSourceController(void *a1, const char *a2, ...)
{
  return _[a1 dataSourceController];
}

id objc_msgSend_dataSourceControllerOverlord(void *a1, const char *a2, ...)
{
  return _[a1 dataSourceControllerOverlord];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return _[a1 date];
}

id objc_msgSend_dateBySettingHour_minute_second_ofDate_options_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dateBySettingHour:minute:second:ofDate:options:");
}

id objc_msgSend_deactivateConstraints_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deactivateConstraints:");
}

id objc_msgSend_debugDescription(void *a1, const char *a2, ...)
{
  return _[a1 debugDescription];
}

id objc_msgSend_debugEntries(void *a1, const char *a2, ...)
{
  return _[a1 debugEntries];
}

id objc_msgSend_decimalSeparator(void *a1, const char *a2, ...)
{
  return _[a1 decimalSeparator];
}

id objc_msgSend_declineContinuityCallWithUUID_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "declineContinuityCallWithUUID:completion:");
}

id objc_msgSend_declineIncomingCall_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "declineIncomingCall:completion:");
}

id objc_msgSend_defaultAnimator(void *a1, const char *a2, ...)
{
  return _[a1 defaultAnimator];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return _[a1 defaultCenter];
}

id objc_msgSend_defaultDarkModeDetailTextColor(void *a1, const char *a2, ...)
{
  return _[a1 defaultDarkModeDetailTextColor];
}

id objc_msgSend_defaultDarkModeTextColor(void *a1, const char *a2, ...)
{
  return _[a1 defaultDarkModeTextColor];
}

id objc_msgSend_defaultDeviceWithMediaType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "defaultDeviceWithMediaType:");
}

id objc_msgSend_defaultFocusedTextColor(void *a1, const char *a2, ...)
{
  return _[a1 defaultFocusedTextColor];
}

id objc_msgSend_defaultImageTextHorizontalSpacing(void *a1, const char *a2, ...)
{
  return _[a1 defaultImageTextHorizontalSpacing];
}

id objc_msgSend_defaultLargeSymbolReservedSpace(void *a1, const char *a2, ...)
{
  return _[a1 defaultLargeSymbolReservedSpace];
}

id objc_msgSend_defaultLightModeDetailTextColor(void *a1, const char *a2, ...)
{
  return _[a1 defaultLightModeDetailTextColor];
}

id objc_msgSend_defaultLightModeTextColor(void *a1, const char *a2, ...)
{
  return _[a1 defaultLightModeTextColor];
}

id objc_msgSend_defaultManagedSubviewAlpha(void *a1, const char *a2, ...)
{
  return _[a1 defaultManagedSubviewAlpha];
}

id objc_msgSend_defaultManagedSubviewDisabledAlpha(void *a1, const char *a2, ...)
{
  return _[a1 defaultManagedSubviewDisabledAlpha];
}

id objc_msgSend_defaultPlatterDesiredWidth(void *a1, const char *a2, ...)
{
  return _[a1 defaultPlatterDesiredWidth];
}

id objc_msgSend_defaultRowHeight(void *a1, const char *a2, ...)
{
  return _[a1 defaultRowHeight];
}

id objc_msgSend_defaultSelectedTintColor(void *a1, const char *a2, ...)
{
  return _[a1 defaultSelectedTintColor];
}

id objc_msgSend_defaultShadowOpacity(void *a1, const char *a2, ...)
{
  return _[a1 defaultShadowOpacity];
}

id objc_msgSend_defaultShadowRadius(void *a1, const char *a2, ...)
{
  return _[a1 defaultShadowRadius];
}

id objc_msgSend_defaultShadowVerticalOffset(void *a1, const char *a2, ...)
{
  return _[a1 defaultShadowVerticalOffset];
}

id objc_msgSend_defaultSmediumSymbolReservedSpace(void *a1, const char *a2, ...)
{
  return _[a1 defaultSmediumSymbolReservedSpace];
}

id objc_msgSend_defaultSpacerHeight(void *a1, const char *a2, ...)
{
  return _[a1 defaultSpacerHeight];
}

id objc_msgSend_defaultSpacerWidth(void *a1, const char *a2, ...)
{
  return _[a1 defaultSpacerWidth];
}

id objc_msgSend_defaultStyle(void *a1, const char *a2, ...)
{
  return _[a1 defaultStyle];
}

id objc_msgSend_defaultTitleLayoutContentInsets(void *a1, const char *a2, ...)
{
  return _[a1 defaultTitleLayoutContentInsets];
}

id objc_msgSend_defaultUltraWideZoomFactor(void *a1, const char *a2, ...)
{
  return _[a1 defaultUltraWideZoomFactor];
}

id objc_msgSend_defaultUserImageDiameter(void *a1, const char *a2, ...)
{
  return _[a1 defaultUserImageDiameter];
}

id objc_msgSend_defaultWideZoomFactor(void *a1, const char *a2, ...)
{
  return _[a1 defaultWideZoomFactor];
}

id objc_msgSend_defaultWorkspace(void *a1, const char *a2, ...)
{
  return _[a1 defaultWorkspace];
}

id objc_msgSend_degToRad_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "degToRad:");
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return _[a1 delegate];
}

id objc_msgSend_dequeueReusableCellWithIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dequeueReusableCellWithIdentifier:");
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return _[a1 description];
}

id objc_msgSend_descriptionBuilderWithMultilinePrefix_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "descriptionBuilderWithMultilinePrefix:");
}

id objc_msgSend_descriptionWithMultilinePrefix_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "descriptionWithMultilinePrefix:");
}

id objc_msgSend_deselectAudioRoutes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deselectAudioRoutes:");
}

id objc_msgSend_desiredWidth(void *a1, const char *a2, ...)
{
  return _[a1 desiredWidth];
}

id objc_msgSend_detailTextColorForInterfaceStyle_state_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "detailTextColorForInterfaceStyle:state:");
}

id objc_msgSend_detailTextCompositingFilterForInterfaceStyle_state_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "detailTextCompositingFilterForInterfaceStyle:state:");
}

id objc_msgSend_device(void *a1, const char *a2, ...)
{
  return _[a1 device];
}

id objc_msgSend_deviceColor(void *a1, const char *a2, ...)
{
  return _[a1 deviceColor];
}

id objc_msgSend_deviceForIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deviceForIdentifier:");
}

id objc_msgSend_deviceForUniqueIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deviceForUniqueIdentifier:");
}

id objc_msgSend_deviceFromTVPSBluetoothDevice_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deviceFromTVPSBluetoothDevice:");
}

id objc_msgSend_deviceModel(void *a1, const char *a2, ...)
{
  return _[a1 deviceModel];
}

id objc_msgSend_deviceSymbolName(void *a1, const char *a2, ...)
{
  return _[a1 deviceSymbolName];
}

id objc_msgSend_deviceType(void *a1, const char *a2, ...)
{
  return _[a1 deviceType];
}

id objc_msgSend_devices(void *a1, const char *a2, ...)
{
  return _[a1 devices];
}

id objc_msgSend_dictationDeviceIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 dictationDeviceIdentifier];
}

id objc_msgSend_dictationPlatterView(void *a1, const char *a2, ...)
{
  return _[a1 dictationPlatterView];
}

id objc_msgSend_dictationViewControllerDidFinishDictating_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictationViewControllerDidFinishDictating:");
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return _[a1 dictionary];
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_didChangeValueForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didChangeValueForKey:");
}

id objc_msgSend_didMoveToParentViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didMoveToParentViewController:");
}

id objc_msgSend_didPerformPrimaryActionWithHostView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didPerformPrimaryActionWithHostView:");
}

id objc_msgSend_didPerformShareAudio(void *a1, const char *a2, ...)
{
  return _[a1 didPerformShareAudio];
}

id objc_msgSend_didReceiveFirstFrame(void *a1, const char *a2, ...)
{
  return _[a1 didReceiveFirstFrame];
}

id objc_msgSend_didSelectDebugEntry_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didSelectDebugEntry:");
}

id objc_msgSend_didUpdateFocusOnZoomControl_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didUpdateFocusOnZoomControl:");
}

id objc_msgSend_differenceFromOrderedSet_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "differenceFromOrderedSet:");
}

id objc_msgSend_dimCheckmark(void *a1, const char *a2, ...)
{
  return _[a1 dimCheckmark];
}

id objc_msgSend_dimmingView(void *a1, const char *a2, ...)
{
  return _[a1 dimmingView];
}

id objc_msgSend_disableExternalUpdatesForVisibleReason(void *a1, const char *a2, ...)
{
  return _[a1 disableExternalUpdatesForVisibleReason];
}

id objc_msgSend_disableExternalUpdatesWithReason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "disableExternalUpdatesWithReason:");
}

id objc_msgSend_disableRestrictions(void *a1, const char *a2, ...)
{
  return _[a1 disableRestrictions];
}

id objc_msgSend_disconnect(void *a1, const char *a2, ...)
{
  return _[a1 disconnect];
}

id objc_msgSend_disconnectDevice_withCompletionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "disconnectDevice:withCompletionHandler:");
}

id objc_msgSend_disconnectDeviceWithIdentifier_withCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "disconnectDeviceWithIdentifier:withCompletion:");
}

id objc_msgSend_discoveredDevices(void *a1, const char *a2, ...)
{
  return _[a1 discoveredDevices];
}

id objc_msgSend_discoveryFlags(void *a1, const char *a2, ...)
{
  return _[a1 discoveryFlags];
}

id objc_msgSend_discoverySessionWithDeviceTypes_mediaType_position_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "discoverySessionWithDeviceTypes:mediaType:position:");
}

id objc_msgSend_dismissBannerWithPresentable_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dismissBannerWithPresentable:");
}

id objc_msgSend_dismissBannerWithPresentable_bannerContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dismissBannerWithPresentable:bannerContext:");
}

id objc_msgSend_dismissDictationPlatter(void *a1, const char *a2, ...)
{
  return _[a1 dismissDictationPlatter];
}

id objc_msgSend_dismissDueTimeoutWhenReadyWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dismissDueTimeoutWhenReadyWithCompletionHandler:");
}

id objc_msgSend_dismissSystemMenuWithSourceIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dismissSystemMenuWithSourceIdentifier:");
}

id objc_msgSend_dismissViewControllerAnimated_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dismissViewControllerAnimated:completion:");
}

id objc_msgSend_dismissalReason(void *a1, const char *a2, ...)
{
  return _[a1 dismissalReason];
}

id objc_msgSend_displayAsOff(void *a1, const char *a2, ...)
{
  return _[a1 displayAsOff];
}

id objc_msgSend_displayConfiguration(void *a1, const char *a2, ...)
{
  return _[a1 displayConfiguration];
}

id objc_msgSend_displayLinkWithTarget_selector_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "displayLinkWithTarget:selector:");
}

id objc_msgSend_displayLocation(void *a1, const char *a2, ...)
{
  return _[a1 displayLocation];
}

id objc_msgSend_displayName(void *a1, const char *a2, ...)
{
  return _[a1 displayName];
}

id objc_msgSend_displayScale(void *a1, const char *a2, ...)
{
  return _[a1 displayScale];
}

id objc_msgSend_displayTime(void *a1, const char *a2, ...)
{
  return _[a1 displayTime];
}

id objc_msgSend_displayedItemsInSection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "displayedItemsInSection:");
}

id objc_msgSend_distanceFromScreenTopToPillCenter(void *a1, const char *a2, ...)
{
  return _[a1 distanceFromScreenTopToPillCenter];
}

id objc_msgSend_doNotDisturbControllerDidUpdate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "doNotDisturbControllerDidUpdate:");
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return _[a1 domain];
}

id objc_msgSend_doubleForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "doubleForKey:");
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return _[a1 doubleValue];
}

id objc_msgSend_drawInRect_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "drawInRect:");
}

id objc_msgSend_duration(void *a1, const char *a2, ...)
{
  return _[a1 duration];
}

id objc_msgSend_effectControlMode_forBundleID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "effectControlMode:forBundleID:");
}

id objc_msgSend_effectForAVEffect_cameraAppBundleID_displayName_systemImageName_coordinator_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "effectForAVEffect:cameraAppBundleID:displayName:systemImageName:coordinator:");
}

id objc_msgSend_effectForAVEffect_cameraAppBundleID_displayName_systemImageName_enabledSystemImageName_coordinator_( void *a1, const char *a2, ...)
{
  return _objc_msgSend( a1,  "effectForAVEffect:cameraAppBundleID:displayName:systemImageName:enabledSystemImageName:coordinator:");
}

id objc_msgSend_effectWithStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "effectWithStyle:");
}

id objc_msgSend_effectiveUserInterfaceLayoutDirection(void *a1, const char *a2, ...)
{
  return _[a1 effectiveUserInterfaceLayoutDirection];
}

id objc_msgSend_effectiveUserInterfaceStyle(void *a1, const char *a2, ...)
{
  return _[a1 effectiveUserInterfaceStyle];
}

id objc_msgSend_effectiveValueForSetting_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "effectiveValueForSetting:");
}

id objc_msgSend_elapsedTime(void *a1, const char *a2, ...)
{
  return _[a1 elapsedTime];
}

id objc_msgSend_elapsedTimeDate(void *a1, const char *a2, ...)
{
  return _[a1 elapsedTimeDate];
}

id objc_msgSend_elements(void *a1, const char *a2, ...)
{
  return _[a1 elements];
}

id objc_msgSend_emptyRows(void *a1, const char *a2, ...)
{
  return _[a1 emptyRows];
}

id objc_msgSend_enableExternalUpdatesForVisibleReason(void *a1, const char *a2, ...)
{
  return _[a1 enableExternalUpdatesForVisibleReason];
}

id objc_msgSend_enableMarqueeWhenAncestorFocusedIfLineCountExceedsNumberOfLines_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enableMarqueeWhenAncestorFocusedIfLineCountExceedsNumberOfLines:");
}

id objc_msgSend_enableMicMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enableMicMode:");
}

id objc_msgSend_enableMode_forBundleID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enableMode:forBundleID:");
}

id objc_msgSend_enableNetworkManagement(void *a1, const char *a2, ...)
{
  return _[a1 enableNetworkManagement];
}

id objc_msgSend_enabled(void *a1, const char *a2, ...)
{
  return _[a1 enabled];
}

id objc_msgSend_enabledMicMode(void *a1, const char *a2, ...)
{
  return _[a1 enabledMicMode];
}

id objc_msgSend_enabledMicModeContentFromBackingStore_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enabledMicModeContentFromBackingStore:");
}

id objc_msgSend_enabledSystemImageName(void *a1, const char *a2, ...)
{
  return _[a1 enabledSystemImageName];
}

id objc_msgSend_enablesMarqueeWhenAncestorFocused_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enablesMarqueeWhenAncestorFocused:");
}

id objc_msgSend_endAppearanceTransition(void *a1, const char *a2, ...)
{
  return _[a1 endAppearanceTransition];
}

id objc_msgSend_endAutomaticResponseLoading(void *a1, const char *a2, ...)
{
  return _[a1 endAutomaticResponseLoading];
}

id objc_msgSend_endDisableExternalUpdatesWithReason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "endDisableExternalUpdatesWithReason:");
}

id objc_msgSend_endIntervalWithTimeOverride_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "endIntervalWithTimeOverride:");
}

id objc_msgSend_endLoadingUpdates(void *a1, const char *a2, ...)
{
  return _[a1 endLoadingUpdates];
}

id objc_msgSend_endTime(void *a1, const char *a2, ...)
{
  return _[a1 endTime];
}

id objc_msgSend_endpointObject(void *a1, const char *a2, ...)
{
  return _[a1 endpointObject];
}

id objc_msgSend_enqueuePresentable_withOptions_userInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enqueuePresentable:withOptions:userInfo:");
}

id objc_msgSend_enqueueSampleBuffer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enqueueSampleBuffer:");
}

id objc_msgSend_enumerateKeysAndObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumerateKeysAndObjectsUsingBlock:");
}

id objc_msgSend_enumerateObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumerateObjectsUsingBlock:");
}

id objc_msgSend_enumerateObserversUsingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumerateObserversUsingBlock:");
}

id objc_msgSend_environmentAllowsFocus(void *a1, const char *a2, ...)
{
  return _[a1 environmentAllowsFocus];
}

id objc_msgSend_errorWithDomain_code_userInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "errorWithDomain:code:userInfo:");
}

id objc_msgSend_ethernetInterface(void *a1, const char *a2, ...)
{
  return _[a1 ethernetInterface];
}

id objc_msgSend_eventMask(void *a1, const char *a2, ...)
{
  return _[a1 eventMask];
}

id objc_msgSend_executableDisplayName(void *a1, const char *a2, ...)
{
  return _[a1 executableDisplayName];
}

id objc_msgSend_executableIdentity(void *a1, const char *a2, ...)
{
  return _[a1 executableIdentity];
}

id objc_msgSend_executeActionSet(void *a1, const char *a2, ...)
{
  return _[a1 executeActionSet];
}

id objc_msgSend_exponentialGain(void *a1, const char *a2, ...)
{
  return _[a1 exponentialGain];
}

id objc_msgSend_extraLargeGlyphFont(void *a1, const char *a2, ...)
{
  return _[a1 extraLargeGlyphFont];
}

id objc_msgSend_faceTimeAndSharePlayActivityLayoutProvidersFromBackingStore_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "faceTimeAndSharePlayActivityLayoutProvidersFromBackingStore:");
}

id objc_msgSend_faceTimeOnlyLayoutProvidersFromBackingStore_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "faceTimeOnlyLayoutProvidersFromBackingStore:");
}

id objc_msgSend_faceTimePlatterBackingStore(void *a1, const char *a2, ...)
{
  return _[a1 faceTimePlatterBackingStore];
}

id objc_msgSend_faceTimePlatterBackingStoreDidChange_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "faceTimePlatterBackingStoreDidChange:");
}

id objc_msgSend_faceTimePlatterState(void *a1, const char *a2, ...)
{
  return _[a1 faceTimePlatterState];
}

id objc_msgSend_fakeWaveform(void *a1, const char *a2, ...)
{
  return _[a1 fakeWaveform];
}

id objc_msgSend_fallbackImageView(void *a1, const char *a2, ...)
{
  return _[a1 fallbackImageView];
}

id objc_msgSend_fileURLWithPath_isDirectory_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fileURLWithPath:isDirectory:");
}

id objc_msgSend_fillRect_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fillRect:");
}

id objc_msgSend_fillRect_blendMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fillRect:blendMode:");
}

id objc_msgSend_filterWithType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "filterWithType:");
}

id objc_msgSend_finishAnimationAtPosition_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "finishAnimationAtPosition:");
}

id objc_msgSend_finishedWithCurrentMenuItem(void *a1, const char *a2, ...)
{
  return _[a1 finishedWithCurrentMenuItem];
}

id objc_msgSend_firstBaselineAnchor(void *a1, const char *a2, ...)
{
  return _[a1 firstBaselineAnchor];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return _[a1 firstObject];
}

id objc_msgSend_flags(void *a1, const char *a2, ...)
{
  return _[a1 flags];
}

id objc_msgSend_floatValue(void *a1, const char *a2, ...)
{
  return _[a1 floatValue];
}

id objc_msgSend_floatingContentView(void *a1, const char *a2, ...)
{
  return _[a1 floatingContentView];
}

id objc_msgSend_floatingContentViewCornerRadius(void *a1, const char *a2, ...)
{
  return _[a1 floatingContentViewCornerRadius];
}

id objc_msgSend_floatingContentViewFocusSizeIncrease(void *a1, const char *a2, ...)
{
  return _[a1 floatingContentViewFocusSizeIncrease];
}

id objc_msgSend_floatingContentViewHighContrastIndicatorCornerRadius(void *a1, const char *a2, ...)
{
  return _[a1 floatingContentViewHighContrastIndicatorCornerRadius];
}

id objc_msgSend_floatingContentViewHighContrastIndicatorOutset(void *a1, const char *a2, ...)
{
  return _[a1 floatingContentViewHighContrastIndicatorOutset];
}

id objc_msgSend_focusActivationTimer(void *a1, const char *a2, ...)
{
  return _[a1 focusActivationTimer];
}

id objc_msgSend_focusHeading(void *a1, const char *a2, ...)
{
  return _[a1 focusHeading];
}

id objc_msgSend_focusedApp(void *a1, const char *a2, ...)
{
  return _[a1 focusedApp];
}

id objc_msgSend_focusedAppIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 focusedAppIdentifier];
}

id objc_msgSend_focusedConfiguration(void *a1, const char *a2, ...)
{
  return _[a1 focusedConfiguration];
}

id objc_msgSend_focusedMenuItemTextColor(void *a1, const char *a2, ...)
{
  return _[a1 focusedMenuItemTextColor];
}

id objc_msgSend_focusedRenderer(void *a1, const char *a2, ...)
{
  return _[a1 focusedRenderer];
}

id objc_msgSend_focusedRoute(void *a1, const char *a2, ...)
{
  return _[a1 focusedRoute];
}

id objc_msgSend_font(void *a1, const char *a2, ...)
{
  return _[a1 font];
}

id objc_msgSend_font_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "font:");
}

id objc_msgSend_fontDescriptor(void *a1, const char *a2, ...)
{
  return _[a1 fontDescriptor];
}

id objc_msgSend_fontDescriptorByAddingAttributes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fontDescriptorByAddingAttributes:");
}

id objc_msgSend_fontForTextStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fontForTextStyle:");
}

id objc_msgSend_fontWithDescriptor_size_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fontWithDescriptor:size:");
}

id objc_msgSend_footer(void *a1, const char *a2, ...)
{
  return _[a1 footer];
}

id objc_msgSend_format(void *a1, const char *a2, ...)
{
  return _[a1 format];
}

id objc_msgSend_formattedShortName(void *a1, const char *a2, ...)
{
  return _[a1 formattedShortName];
}

id objc_msgSend_frame(void *a1, const char *a2, ...)
{
  return _[a1 frame];
}

id objc_msgSend_frequencyExponent(void *a1, const char *a2, ...)
{
  return _[a1 frequencyExponent];
}

id objc_msgSend_fromView(void *a1, const char *a2, ...)
{
  return _[a1 fromView];
}

id objc_msgSend_fullyPresentedTopPresentables(void *a1, const char *a2, ...)
{
  return _[a1 fullyPresentedTopPresentables];
}

id objc_msgSend_functionWithControlPoints__::(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "functionWithControlPoints::::");
}

id objc_msgSend_functionWithName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "functionWithName:");
}

id objc_msgSend_futureWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "futureWithError:");
}

id objc_msgSend_gameControllerIdentifierFromRendererIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "gameControllerIdentifierFromRendererIdentifier:");
}

id objc_msgSend_gameControllersConfiguration(void *a1, const char *a2, ...)
{
  return _[a1 gameControllersConfiguration];
}

id objc_msgSend_getAvailableScheduledSleepRequestsWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getAvailableScheduledSleepRequestsWithCompletion:");
}

id objc_msgSend_getUUIDBytes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getUUIDBytes:");
}

id objc_msgSend_getValue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getValue:");
}

id objc_msgSend_gradientLayer(void *a1, const char *a2, ...)
{
  return _[a1 gradientLayer];
}

id objc_msgSend_greenColor(void *a1, const char *a2, ...)
{
  return _[a1 greenColor];
}

id objc_msgSend_groupName(void *a1, const char *a2, ...)
{
  return _[a1 groupName];
}

id objc_msgSend_groupUUID(void *a1, const char *a2, ...)
{
  return _[a1 groupUUID];
}

id objc_msgSend_groups(void *a1, const char *a2, ...)
{
  return _[a1 groups];
}

id objc_msgSend_handleBannerActionEvent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleBannerActionEvent:");
}

id objc_msgSend_handleClear(void *a1, const char *a2, ...)
{
  return _[a1 handleClear];
}

id objc_msgSend_handleExternalGesture_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleExternalGesture:");
}

id objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleFailureInMethod:object:file:lineNumber:description:");
}

id objc_msgSend_handleNewCaptureDevice_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleNewCaptureDevice:");
}

id objc_msgSend_handlePlaybackStateChange_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handlePlaybackStateChange:");
}

id objc_msgSend_handleTemplateContentEvent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleTemplateContentEvent:");
}

id objc_msgSend_hasActiveIndicatorAtDisplayPosition_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasActiveIndicatorAtDisplayPosition:");
}

id objc_msgSend_hasCameraSensor(void *a1, const char *a2, ...)
{
  return _[a1 hasCameraSensor];
}

id objc_msgSend_hasCamerasOrScenes(void *a1, const char *a2, ...)
{
  return _[a1 hasCamerasOrScenes];
}

id objc_msgSend_hasChanges(void *a1, const char *a2, ...)
{
  return _[a1 hasChanges];
}

id objc_msgSend_hasCriticalInfo(void *a1, const char *a2, ...)
{
  return _[a1 hasCriticalInfo];
}

id objc_msgSend_hasExternalPickedRoutes(void *a1, const char *a2, ...)
{
  return _[a1 hasExternalPickedRoutes];
}

id objc_msgSend_hasFailed(void *a1, const char *a2, ...)
{
  return _[a1 hasFailed];
}

id objc_msgSend_hasFocusableContent(void *a1, const char *a2, ...)
{
  return _[a1 hasFocusableContent];
}

id objc_msgSend_hasFocusedRendererOtherThanCriticalInfo(void *a1, const char *a2, ...)
{
  return _[a1 hasFocusedRendererOtherThanCriticalInfo];
}

id objc_msgSend_hasIndicatorForMenuBar(void *a1, const char *a2, ...)
{
  return _[a1 hasIndicatorForMenuBar];
}

id objc_msgSend_hasKeyboardFocus(void *a1, const char *a2, ...)
{
  return _[a1 hasKeyboardFocus];
}

id objc_msgSend_hasLocationSensor(void *a1, const char *a2, ...)
{
  return _[a1 hasLocationSensor];
}

id objc_msgSend_hasMediaSubType(void *a1, const char *a2, ...)
{
  return _[a1 hasMediaSubType];
}

id objc_msgSend_hasMediaType(void *a1, const char *a2, ...)
{
  return _[a1 hasMediaType];
}

id objc_msgSend_hasMicrophoneSensor(void *a1, const char *a2, ...)
{
  return _[a1 hasMicrophoneSensor];
}

id objc_msgSend_hasMultiplePickedRoutes(void *a1, const char *a2, ...)
{
  return _[a1 hasMultiplePickedRoutes];
}

id objc_msgSend_hasPrefix_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasPrefix:");
}

id objc_msgSend_hasPrimaryAction(void *a1, const char *a2, ...)
{
  return _[a1 hasPrimaryAction];
}

id objc_msgSend_hasReceivedFirstFrame(void *a1, const char *a2, ...)
{
  return _[a1 hasReceivedFirstFrame];
}

id objc_msgSend_hasSquareArtwork(void *a1, const char *a2, ...)
{
  return _[a1 hasSquareArtwork];
}

id objc_msgSend_hasUserAttention(void *a1, const char *a2, ...)
{
  return _[a1 hasUserAttention];
}

id objc_msgSend_hash(void *a1, const char *a2, ...)
{
  return _[a1 hash];
}

id objc_msgSend_headTrackingEnabledForBundleID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "headTrackingEnabledForBundleID:");
}

id objc_msgSend_headboardRequestedVisibility(void *a1, const char *a2, ...)
{
  return _[a1 headboardRequestedVisibility];
}

id objc_msgSend_headphoneConfiguration(void *a1, const char *a2, ...)
{
  return _[a1 headphoneConfiguration];
}

id objc_msgSend_headphonesController(void *a1, const char *a2, ...)
{
  return _[a1 headphonesController];
}

id objc_msgSend_heightAnchor(void *a1, const char *a2, ...)
{
  return _[a1 heightAnchor];
}

id objc_msgSend_heightConstraint(void *a1, const char *a2, ...)
{
  return _[a1 heightConstraint];
}

id objc_msgSend_hf_allCameraProfiles(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hf_allCameraProfiles");
}

id objc_msgSend_hf_allNonEmptyActionSets(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hf_allNonEmptyActionSets");
}

id objc_msgSend_hf_hasSetFavorite(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hf_hasSetFavorite");
}

id objc_msgSend_hf_iconTintColor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hf_iconTintColor");
}

id objc_msgSend_hf_isFavorite(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hf_isFavorite");
}

id objc_msgSend_hf_shouldBeOnForContextType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hf_shouldBeOnForContextType:");
}

id objc_msgSend_hmHome(void *a1, const char *a2, ...)
{
  return _[a1 hmHome];
}

id objc_msgSend_home(void *a1, const char *a2, ...)
{
  return _[a1 home];
}

id objc_msgSend_homeKitController(void *a1, const char *a2, ...)
{
  return _[a1 homeKitController];
}

id objc_msgSend_homeKitObject(void *a1, const char *a2, ...)
{
  return _[a1 homeKitObject];
}

id objc_msgSend_horizontalSeparatorView(void *a1, const char *a2, ...)
{
  return _[a1 horizontalSeparatorView];
}

id objc_msgSend_hostingViewController_willTransitionFromViewController_toViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hostingViewController:willTransitionFromViewController:toViewController:");
}

id objc_msgSend_i(void *a1, const char *a2, ...)
{
  return _[a1 i];
}

id objc_msgSend_i1(void *a1, const char *a2, ...)
{
  return _[a1 i1];
}

id objc_msgSend_i2(void *a1, const char *a2, ...)
{
  return _[a1 i2];
}

id objc_msgSend_i3(void *a1, const char *a2, ...)
{
  return _[a1 i3];
}

id objc_msgSend_identificationWithRequesterIdentifier_requestIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "identificationWithRequesterIdentifier:requestIdentifier:");
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return _[a1 identifier];
}

id objc_msgSend_identifierForPBSAXMenuOptions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "identifierForPBSAXMenuOptions:");
}

id objc_msgSend_idsDeviceIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 idsDeviceIdentifier];
}

id objc_msgSend_image(void *a1, const char *a2, ...)
{
  return _[a1 image];
}

id objc_msgSend_image1ID(void *a1, const char *a2, ...)
{
  return _[a1 image1ID];
}

id objc_msgSend_image1TintColor(void *a1, const char *a2, ...)
{
  return _[a1 image1TintColor];
}

id objc_msgSend_image2ID(void *a1, const char *a2, ...)
{
  return _[a1 image2ID];
}

id objc_msgSend_image2TintColor(void *a1, const char *a2, ...)
{
  return _[a1 image2TintColor];
}

id objc_msgSend_image3ID(void *a1, const char *a2, ...)
{
  return _[a1 image3ID];
}

id objc_msgSend_image3TintColor(void *a1, const char *a2, ...)
{
  return _[a1 image3TintColor];
}

id objc_msgSend_image4ID(void *a1, const char *a2, ...)
{
  return _[a1 image4ID];
}

id objc_msgSend_imageContainerView(void *a1, const char *a2, ...)
{
  return _[a1 imageContainerView];
}

id objc_msgSend_imageData(void *a1, const char *a2, ...)
{
  return _[a1 imageData];
}

id objc_msgSend_imageFor_remoteMemberCount_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "imageFor:remoteMemberCount:completionHandler:");
}

id objc_msgSend_imageForRouteUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "imageForRouteUID:");
}

id objc_msgSend_imageID(void *a1, const char *a2, ...)
{
  return _[a1 imageID];
}

id objc_msgSend_imageNamed_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "imageNamed:");
}

id objc_msgSend_imageNamed_inBundle_compatibleWithTraitCollection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "imageNamed:inBundle:compatibleWithTraitCollection:");
}

id objc_msgSend_imageSymbolConfiguration(void *a1, const char *a2, ...)
{
  return _[a1 imageSymbolConfiguration];
}

id objc_msgSend_imageSymbolName(void *a1, const char *a2, ...)
{
  return _[a1 imageSymbolName];
}

id objc_msgSend_imageSymbolNameForBatteryLevel_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "imageSymbolNameForBatteryLevel:");
}

id objc_msgSend_imageSymbolNameForBatteryLevel_isCharging_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "imageSymbolNameForBatteryLevel:isCharging:");
}

id objc_msgSend_imageTintColor(void *a1, const char *a2, ...)
{
  return _[a1 imageTintColor];
}

id objc_msgSend_imageView(void *a1, const char *a2, ...)
{
  return _[a1 imageView];
}

id objc_msgSend_imageView1(void *a1, const char *a2, ...)
{
  return _[a1 imageView1];
}

id objc_msgSend_imageView2(void *a1, const char *a2, ...)
{
  return _[a1 imageView2];
}

id objc_msgSend_imageView3(void *a1, const char *a2, ...)
{
  return _[a1 imageView3];
}

id objc_msgSend_imageView4(void *a1, const char *a2, ...)
{
  return _[a1 imageView4];
}

id objc_msgSend_imageWithActions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "imageWithActions:");
}

id objc_msgSend_imageWithConfiguration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "imageWithConfiguration:");
}

id objc_msgSend_imageWithContentsOfFile_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "imageWithContentsOfFile:");
}

id objc_msgSend_imageWithData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "imageWithData:");
}

id objc_msgSend_imageWithRenderingMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "imageWithRenderingMode:");
}

id objc_msgSend_imageWithSymbolConfiguration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "imageWithSymbolConfiguration:");
}

id objc_msgSend_immediateAnimator(void *a1, const char *a2, ...)
{
  return _[a1 immediateAnimator];
}

id objc_msgSend_includesRelays(void *a1, const char *a2, ...)
{
  return _[a1 includesRelays];
}

id objc_msgSend_incomingCallInfo(void *a1, const char *a2, ...)
{
  return _[a1 incomingCallInfo];
}

id objc_msgSend_incomingCallInfoWithCall_conversation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "incomingCallInfoWithCall:conversation:");
}

id objc_msgSend_incomingSnowglobeImage(void *a1, const char *a2, ...)
{
  return _[a1 incomingSnowglobeImage];
}

id objc_msgSend_index(void *a1, const char *a2, ...)
{
  return _[a1 index];
}

id objc_msgSend_indexOfObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "indexOfObject:");
}

id objc_msgSend_indexOfObjectIdenticalTo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "indexOfObjectIdenticalTo:");
}

id objc_msgSend_indexesOfObjectsPassingTest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "indexesOfObjectsPassingTest:");
}

id objc_msgSend_indicatorShape(void *a1, const char *a2, ...)
{
  return _[a1 indicatorShape];
}

id objc_msgSend_init(void *a1, const char *a2, ...)
{
  return _[a1 init];
}

id objc_msgSend_initForPrivacyPlus_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initForPrivacyPlus:");
}

id objc_msgSend_initRecordingIndicatorWithDisplayLocation_recordingType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initRecordingIndicatorWithDisplayLocation:recordingType:");
}

id objc_msgSend_initWIthRestrictionsController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWIthRestrictionsController:");
}

id objc_msgSend_initWithActionEvent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithActionEvent:");
}

id objc_msgSend_initWithActiveInterfaceType_internetAvailable_wifiState_vpnConfigured_vpnActive_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithActiveInterfaceType:internetAvailable:wifiState:vpnConfigured:vpnActive:");
}

id objc_msgSend_initWithActivity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithActivity:");
}

id objc_msgSend_initWithActivityIndicatorStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithActivityIndicatorStyle:");
}

id objc_msgSend_initWithAmplitudes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithAmplitudes:");
}

id objc_msgSend_initWithAnimationContext_animated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithAnimationContext:animated:");
}

id objc_msgSend_initWithArrangedSubviews_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithArrangedSubviews:");
}

id objc_msgSend_initWithArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithArray:");
}

id objc_msgSend_initWithAttentionMonitor_reason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithAttentionMonitor:reason:");
}

id objc_msgSend_initWithAttribution_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithAttribution:");
}

id objc_msgSend_initWithAudioNowPlayingController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithAudioNowPlayingController:");
}

id objc_msgSend_initWithAudioNowPlayingController_menuModeController_headphonesController_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithAudioNowPlayingController:menuModeController:headphonesController:");
}

id objc_msgSend_initWithAudioNowPlayingController_outputDeviceRouteController_initialMode_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithAudioNowPlayingController:outputDeviceRouteController:initialMode:");
}

id objc_msgSend_initWithAudioRoutingController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithAudioRoutingController:");
}

id objc_msgSend_initWithAuthority_pender_presenter_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithAuthority:pender:presenter:");
}

id objc_msgSend_initWithBackgroundStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithBackgroundStyle:");
}

id objc_msgSend_initWithBackingStore_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithBackingStore:");
}

id objc_msgSend_initWithBannerManager_scene_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithBannerManager:scene:");
}

id objc_msgSend_initWithBannerPresentationState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithBannerPresentationState:");
}

id objc_msgSend_initWithBannerPresentationState_transitioningBannerPresentable_shouldAnimateTransition_supportsInteractiveMode_transitionObserver_dismissalReason_( void *a1, const char *a2, ...)
{
  return _objc_msgSend( a1,  "initWithBannerPresentationState:transitioningBannerPresentable:shouldAnimateTransition:supportsInteractiveMod e:transitionObserver:dismissalReason:");
}

id objc_msgSend_initWithBarColor_backgroundBarColor_barWidth_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithBarColor:backgroundBarColor:barWidth:");
}

id objc_msgSend_initWithBatteryLevel_isCharging_userInterfaceStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithBatteryLevel:isCharging:userInterfaceStyle:");
}

id objc_msgSend_initWithBluetoothController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithBluetoothController:");
}

id objc_msgSend_initWithBluetoothManager_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithBluetoothManager:");
}

id objc_msgSend_initWithBluetoothRemoteController_sensorActivityController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithBluetoothRemoteController:sensorActivityController:");
}

id objc_msgSend_initWithBluetoothRemoteManager_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithBluetoothRemoteManager:");
}

id objc_msgSend_initWithBulletinData_state_reason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithBulletinData:state:reason:");
}

id objc_msgSend_initWithBundleIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithBundleIdentifier:");
}

id objc_msgSend_initWithCAPackageView_frame_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithCAPackageView:frame:");
}

id objc_msgSend_initWithCGImage_scale_orientation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithCGImage:scale:orientation:");
}

id objc_msgSend_initWithCameraItem_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithCameraItem:");
}

id objc_msgSend_initWithCameraItems_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithCameraItems:");
}

id objc_msgSend_initWithCameraItems_focusedIdentifier_cameraContentView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithCameraItems:focusedIdentifier:cameraContentView:");
}

id objc_msgSend_initWithCapacity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithCapacity:");
}

id objc_msgSend_initWithConfiguration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithConfiguration:");
}

id objc_msgSend_initWithConfiguration_bluetoothManagerProvider_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithConfiguration:bluetoothManagerProvider:");
}

id objc_msgSend_initWithConfiguration_leadingView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithConfiguration:leadingView:");
}

id objc_msgSend_initWithConfiguration_leadingView_trailingView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithConfiguration:leadingView:trailingView:");
}

id objc_msgSend_initWithContainerFrame_contentInsets_sizeProviders_rowSpacing_columnSpacing_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithContainerFrame:contentInsets:sizeProviders:rowSpacing:columnSpacing:");
}

id objc_msgSend_initWithContainerView_pillView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithContainerView:pillView:");
}

id objc_msgSend_initWithContentViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithContentViewController:");
}

id objc_msgSend_initWithContentsOfURL_publishedObjectViewClassMap_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithContentsOfURL:publishedObjectViewClassMap:");
}

id objc_msgSend_initWithContributors_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithContributors:");
}

id objc_msgSend_initWithControlPoint1_controlPoint2_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithControlPoint1:controlPoint2:");
}

id objc_msgSend_initWithCurrentUserController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithCurrentUserController:");
}

id objc_msgSend_initWithCurrentZoomFactor_minZoomFactor_maxZoomFactor_defaultWideZoomFactor_defaultUltraWideZoomFactor_supportsWideCamera_supportsUltraWideCamera_isUsingWideForFraming_( void *a1, const char *a2, ...)
{
  return _objc_msgSend( a1,  "initWithCurrentZoomFactor:minZoomFactor:maxZoomFactor:defaultWideZoomFactor:defaultUltraWideZoomFactor:suppor tsWideCamera:supportsUltraWideCamera:isUsingWideForFraming:");
}

id objc_msgSend_initWithCurrentZoomFactor_supportsWideCamera_supportsUltraWideCamera_isUsingWideForFraming_defaultWideZoomFactor_defaultUltraWideZoomFactor_( void *a1, const char *a2, ...)
{
  return _objc_msgSend( a1,  "initWithCurrentZoomFactor:supportsWideCamera:supportsUltraWideCamera:isUsingWideForFraming:defaultWideZoomFac tor:defaultUltraWideZoomFactor:");
}

id objc_msgSend_initWithDataAccessStatusDomain_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDataAccessStatusDomain:");
}

id objc_msgSend_initWithDataSourceController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDataSourceController:");
}

id objc_msgSend_initWithDataSourceControllerOverlord_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDataSourceControllerOverlord:");
}

id objc_msgSend_initWithDataSourceControllerOverlord_privacyController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDataSourceControllerOverlord:privacyController:");
}

id objc_msgSend_initWithDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDelegate:");
}

id objc_msgSend_initWithDevice_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDevice:error:");
}

id objc_msgSend_initWithDictionary_copyItems_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDictionary:copyItems:");
}

id objc_msgSend_initWithDismissalDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDismissalDelegate:");
}

id objc_msgSend_initWithDisplayLocation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDisplayLocation:");
}

id objc_msgSend_initWithDoNotDisturbController_bluetoothRemoteController_sensorActivityController_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDoNotDisturbController:bluetoothRemoteController:sensorActivityController:");
}

id objc_msgSend_initWithDuration_controlPoint1_controlPoint2_animations_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDuration:controlPoint1:controlPoint2:animations:");
}

id objc_msgSend_initWithDuration_curve_animations_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDuration:curve:animations:");
}

id objc_msgSend_initWithDuration_timingParameters_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDuration:timingParameters:");
}

id objc_msgSend_initWithEffect_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithEffect:");
}

id objc_msgSend_initWithEntryTitle_viewControllerClass_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithEntryTitle:viewControllerClass:");
}

id objc_msgSend_initWithEntryTitle_viewControllerProvider_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithEntryTitle:viewControllerProvider:");
}

id objc_msgSend_initWithFFTSamples_count_sampleRate_settings_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithFFTSamples:count:sampleRate:settings:");
}

id objc_msgSend_initWithFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithFormat:");
}

id objc_msgSend_initWithFrame_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithFrame:");
}

id objc_msgSend_initWithFrame_primaryAction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithFrame:primaryAction:");
}

id objc_msgSend_initWithFrame_settings_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithFrame:settings:");
}

id objc_msgSend_initWithFrameSenderServerEndpoint_frameReceiverHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithFrameSenderServerEndpoint:frameReceiverHandler:");
}

id objc_msgSend_initWithFromView_toView_focusHeading_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithFromView:toView:focusHeading:");
}

id objc_msgSend_initWithGroupName_image_items_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithGroupName:image:items:");
}

id objc_msgSend_initWithGroups_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithGroups:");
}

id objc_msgSend_initWithHFItem_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithHFItem:");
}

id objc_msgSend_initWithHome_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithHome:");
}

id objc_msgSend_initWithHomeKitController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithHomeKitController:");
}

id objc_msgSend_initWithIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithIdentifier:");
}

id objc_msgSend_initWithIdentifier_audioNowPlayingController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithIdentifier:audioNowPlayingController:");
}

id objc_msgSend_initWithIdentifier_content_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithIdentifier:content:");
}

id objc_msgSend_initWithIdentifier_content_contentInsets_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithIdentifier:content:contentInsets:");
}

id objc_msgSend_initWithIdentifier_criticalInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithIdentifier:criticalInfo:");
}

id objc_msgSend_initWithIdentifier_displayName_systemImageName_enabledSystemImageName_isEnabled_isSupported_isUnavailable_controlMode_( void *a1, const char *a2, ...)
{
  return _objc_msgSend( a1,  "initWithIdentifier:displayName:systemImageName:enabledSystemImageName:isEnabled:isSupported:isUnavailable:controlMode:");
}

id objc_msgSend_initWithIdentifier_doNotDisturbControllerer_overrideStylings_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithIdentifier:doNotDisturbControllerer:overrideStylings:");
}

id objc_msgSend_initWithIdentifier_forReason_invalidationBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithIdentifier:forReason:invalidationBlock:");
}

id objc_msgSend_initWithIdentifier_format_content_headphonesController_mediaPlayerView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithIdentifier:format:content:headphonesController:mediaPlayerView:");
}

id objc_msgSend_initWithIdentifier_format_content_overrideStylings_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithIdentifier:format:content:overrideStylings:");
}

id objc_msgSend_initWithIdentifier_framingView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithIdentifier:framingView:");
}

id objc_msgSend_initWithIdentifier_hasFocusableContent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithIdentifier:hasFocusableContent:");
}

id objc_msgSend_initWithIdentifier_hasFocusableContent_platterViewControllerClass_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithIdentifier:hasFocusableContent:platterViewControllerClass:");
}

id objc_msgSend_initWithIdentifier_hasFocusableContent_platterViewControllerClassProvider_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithIdentifier:hasFocusableContent:platterViewControllerClassProvider:");
}

id objc_msgSend_initWithIdentifier_name_type_connectionState_batteryLevel_flags_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithIdentifier:name:type:connectionState:batteryLevel:flags:");
}

id objc_msgSend_initWithIdentifier_platterViewControllerClass_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithIdentifier:platterViewControllerClass:");
}

id objc_msgSend_initWithIdentifier_presentationContext_sleepTimerController_criticalInfoController_systemOutputDeviceRouteController_( void *a1, const char *a2, ...)
{
  return _objc_msgSend( a1,  "initWithIdentifier:presentationContext:sleepTimerController:criticalInfoController:systemOutputDeviceRouteController:");
}

id objc_msgSend_initWithIdentifier_title_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithIdentifier:title:");
}

id objc_msgSend_initWithIdentifier_videoView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithIdentifier:videoView:");
}

id objc_msgSend_initWithImage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithImage:");
}

id objc_msgSend_initWithImage_size_allowFilters_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithImage:size:allowFilters:");
}

id objc_msgSend_initWithImage_size_allowFilters_allowSelectedBackground_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithImage:size:allowFilters:allowSelectedBackground:");
}

id objc_msgSend_initWithImage_size_allowFilters_allowSelectedBackground_userInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithImage:size:allowFilters:allowSelectedBackground:userInfo:");
}

id objc_msgSend_initWithImage_title_kind_usedRecently_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithImage:title:kind:usedRecently:");
}

id objc_msgSend_initWithImage_userInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithImage:userInfo:");
}

id objc_msgSend_initWithInitialPlaybackState_lingeringDuration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithInitialPlaybackState:lingeringDuration:");
}

id objc_msgSend_initWithItem_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithItem:");
}

id objc_msgSend_initWithItems_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithItems:");
}

id objc_msgSend_initWithLayer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithLayer:");
}

id objc_msgSend_initWithLightModePackageName_darkModePackageName_size_repeatInterval_contentOffset_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithLightModePackageName:darkModePackageName:size:repeatInterval:contentOffset:");
}

id objc_msgSend_initWithLightModePackageName_darkModePackageName_size_repeatInterval_contentOffset_userInfo_( void *a1, const char *a2, ...)
{
  return _objc_msgSend( a1,  "initWithLightModePackageName:darkModePackageName:size:repeatInterval:contentOffset:userInfo:");
}

id objc_msgSend_initWithMarker_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithMarker:");
}

id objc_msgSend_initWithMass_stiffness_damping_initialVelocity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithMass:stiffness:damping:initialVelocity:");
}

id objc_msgSend_initWithMenuItemProvider_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithMenuItemProvider:");
}

id objc_msgSend_initWithMenuItems_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithMenuItems:");
}

id objc_msgSend_initWithMenuItems_displayTime_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithMenuItems:displayTime:");
}

id objc_msgSend_initWithMenuMode_previousMenuMode_menuModeState_pillView_pillContentViewProvider_panelHostingViewController_bannerContext_previousBannerContext_bannerViewController_previousBannerViewController_bannerContainerViewController_dimmingView_presentationReason_( void *a1, const char *a2, ...)
{
  return _objc_msgSend( a1,  "initWithMenuMode:previousMenuMode:menuModeState:pillView:pillContentViewProvider:panelHostingViewController:b annerContext:previousBannerContext:bannerViewController:previousBannerViewController:bannerContainerViewContr oller:dimmingView:presentationReason:");
}

id objc_msgSend_initWithMenuMode_recordingIndicator_locationIndicator_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithMenuMode:recordingIndicator:locationIndicator:");
}

id objc_msgSend_initWithMenuModeController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithMenuModeController:");
}

id objc_msgSend_initWithMenuModeController_privacyController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithMenuModeController:privacyController:");
}

id objc_msgSend_initWithMenuModeController_privacyController_doNotDisturbController_nowPlayingController_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithMenuModeController:privacyController:doNotDisturbController:nowPlayingController:");
}

id objc_msgSend_initWithMenuModeController_sensorActivityController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithMenuModeController:sensorActivityController:");
}

id objc_msgSend_initWithMenuModeEvaluationState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithMenuModeEvaluationState:");
}

id objc_msgSend_initWithMenuModeStateProvider_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithMenuModeStateProvider:");
}

id objc_msgSend_initWithMetadata_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithMetadata:");
}

id objc_msgSend_initWithMicMode_displayName_systemImageName_enabledSystemImageName_isEnabled_isSupported_isUnavailable_( void *a1, const char *a2, ...)
{
  return _objc_msgSend( a1,  "initWithMicMode:displayName:systemImageName:enabledSystemImageName:isEnabled:isSupported:isUnavailable:");
}

id objc_msgSend_initWithMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithMode:");
}

id objc_msgSend_initWithMode_providers_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithMode:providers:");
}

id objc_msgSend_initWithNEConfiguration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithNEConfiguration:");
}

id objc_msgSend_initWithName_initialState_mode_stateChangeHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithName:initialState:mode:stateChangeHandler:");
}

id objc_msgSend_initWithName_sessionRole_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithName:sessionRole:");
}

id objc_msgSend_initWithNearbyDeviceHandle_conversationID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithNearbyDeviceHandle:conversationID:");
}

id objc_msgSend_initWithNetworkController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithNetworkController:");
}

id objc_msgSend_initWithNetworkInterfaceManager_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithNetworkInterfaceManager:");
}

id objc_msgSend_initWithNetworkName_signalStrength_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithNetworkName:signalStrength:");
}

id objc_msgSend_initWithNibName_bundle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithNibName:bundle:");
}

id objc_msgSend_initWithNowPlayingController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithNowPlayingController:");
}

id objc_msgSend_initWithNowPlayingProvider_audioNowPlayingController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithNowPlayingProvider:audioNowPlayingController:");
}

id objc_msgSend_initWithOptions_capacity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithOptions:capacity:");
}

id objc_msgSend_initWithOptions_filter_sortDescriptors_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithOptions:filter:sortDescriptors:");
}

id objc_msgSend_initWithOutputDeviceRoute_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithOutputDeviceRoute:");
}

id objc_msgSend_initWithOutputDevices_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithOutputDevices:");
}

id objc_msgSend_initWithPID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithPID:");
}

id objc_msgSend_initWithPID_refreshRate_delegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithPID:refreshRate:delegate:");
}

id objc_msgSend_initWithPackageName_inBundle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithPackageName:inBundle:");
}

id objc_msgSend_initWithPlatterController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithPlatterController:");
}

id objc_msgSend_initWithPlayerResponseItem_isPodcast_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithPlayerResponseItem:isPodcast:");
}

id objc_msgSend_initWithPlayerResponseItem_isPodcast_elapsedTimeBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithPlayerResponseItem:isPodcast:elapsedTimeBlock:");
}

id objc_msgSend_initWithPolicy_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithPolicy:");
}

id objc_msgSend_initWithPresentationContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithPresentationContext:");
}

id objc_msgSend_initWithPresentationContext_sleepTimerController_criticalInfoController_systemOutputDeviceRouteController_( void *a1, const char *a2, ...)
{
  return _objc_msgSend( a1,  "initWithPresentationContext:sleepTimerController:criticalInfoController:systemOutputDeviceRouteController:");
}

id objc_msgSend_initWithPrivacyController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithPrivacyController:");
}

id objc_msgSend_initWithProfilePictureDiameter_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithProfilePictureDiameter:");
}

id objc_msgSend_initWithProperties_relationships_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithProperties:relationships:");
}

id objc_msgSend_initWithRed_green_blue_alpha_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithRed:green:blue:alpha:");
}

id objc_msgSend_initWithRequestIdentifier_requesterIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithRequestIdentifier:requesterIdentifier:");
}

id objc_msgSend_initWithRestrictionsController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithRestrictionsController:");
}

id objc_msgSend_initWithRestrictionsUserDefaults_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithRestrictionsUserDefaults:");
}

id objc_msgSend_initWithResult_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithResult:error:");
}

id objc_msgSend_initWithRootViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithRootViewController:");
}

id objc_msgSend_initWithRoute_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithRoute:");
}

id objc_msgSend_initWithRow_renderer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithRow:renderer:");
}

id objc_msgSend_initWithSTUIDataAccessAttribution_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithSTUIDataAccessAttribution:");
}

id objc_msgSend_initWithScheduledSleep_sleepTimerController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithScheduledSleep:sleepTimerController:");
}

id objc_msgSend_initWithSensorActivityController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithSensorActivityController:");
}

id objc_msgSend_initWithSensorProvider_coordinator_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithSensorProvider:coordinator:");
}

id objc_msgSend_initWithServiceDomain_displayConfiguration_authorizedBundleIDs_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithServiceDomain:displayConfiguration:authorizedBundleIDs:");
}

id objc_msgSend_initWithSession_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithSession:");
}

id objc_msgSend_initWithSize_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithSize:");
}

id objc_msgSend_initWithSize_format_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithSize:format:");
}

id objc_msgSend_initWithSize_scale_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithSize:scale:");
}

id objc_msgSend_initWithSleepTimerController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithSleepTimerController:");
}

id objc_msgSend_initWithSleepTimerController_criticalInfoController_systemOutputDeviceRouteController_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithSleepTimerController:criticalInfoController:systemOutputDeviceRouteController:");
}

id objc_msgSend_initWithSourceView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithSourceView:");
}

id objc_msgSend_initWithSpecification_serviceDomain_readyCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithSpecification:serviceDomain:readyCompletion:");
}

id objc_msgSend_initWithSpecification_serviceDomain_scene_readyCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithSpecification:serviceDomain:scene:readyCompletion:");
}

id objc_msgSend_initWithSpringTimingParameters_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithSpringTimingParameters:");
}

id objc_msgSend_initWithSpringTimingParameters_delay_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithSpringTimingParameters:delay:");
}

id objc_msgSend_initWithString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithString:");
}

id objc_msgSend_initWithString_attributes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithString:attributes:");
}

id objc_msgSend_initWithString_font_textEncapsulation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithString:font:textEncapsulation:");
}

id objc_msgSend_initWithString_font_textEncapsulation_userInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithString:font:textEncapsulation:userInfo:");
}

id objc_msgSend_initWithSuiteName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithSuiteName:");
}

id objc_msgSend_initWithSymbolImageName_frame_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithSymbolImageName:frame:");
}

id objc_msgSend_initWithSystemEndpointRoute_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithSystemEndpointRoute:");
}

id objc_msgSend_initWithSystemOutputDeviceRouteController_audioNowPlayingController_menuModeController_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithSystemOutputDeviceRouteController:audioNowPlayingController:menuModeController:");
}

id objc_msgSend_initWithTarget_action_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithTarget:action:");
}

id objc_msgSend_initWithTimingParameters_duration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithTimingParameters:duration:");
}

id objc_msgSend_initWithTimingParameters_duration_delay_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithTimingParameters:duration:delay:");
}

id objc_msgSend_initWithTitle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithTitle:");
}

id objc_msgSend_initWithTitle_text_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithTitle:text:");
}

id objc_msgSend_initWithURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithURL:");
}

id objc_msgSend_initWithUUID_isAudioEnabled_isVideoEnabled_wantsStagingArea_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithUUID:isAudioEnabled:isVideoEnabled:wantsStagingArea:");
}

id objc_msgSend_initWithUserDefaults_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithUserDefaults:");
}

id objc_msgSend_initWithUserImage_personNameComponents_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithUserImage:personNameComponents:");
}

id objc_msgSend_initWithUserImageDiameter_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithUserImageDiameter:");
}

id objc_msgSend_initWithUserProfile_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithUserProfile:");
}

id objc_msgSend_initWithUserProfileManager_profilePictureService_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithUserProfileManager:profilePictureService:");
}

id objc_msgSend_initWithView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithView:");
}

id objc_msgSend_initWithWaveformController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithWaveformController:");
}

id objc_msgSend_initWithWhite_alpha_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithWhite:alpha:");
}

id objc_msgSend_initWithWindowScene_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithWindowScene:");
}

id objc_msgSend_insertArrangedSubview_atIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "insertArrangedSubview:atIndex:");
}

id objc_msgSend_insertObject_atIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "insertObject:atIndex:");
}

id objc_msgSend_insertSubview_atIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "insertSubview:atIndex:");
}

id objc_msgSend_insertions(void *a1, const char *a2, ...)
{
  return _[a1 insertions];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return _[a1 intValue];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return _[a1 integerValue];
}

id objc_msgSend_interactionRequestReason(void *a1, const char *a2, ...)
{
  return _[a1 interactionRequestReason];
}

id objc_msgSend_interactivePresentationReason(void *a1, const char *a2, ...)
{
  return _[a1 interactivePresentationReason];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return _[a1 invalidate];
}

id objc_msgSend_invalidateIntrinsicContentSize(void *a1, const char *a2, ...)
{
  return _[a1 invalidateIntrinsicContentSize];
}

id objc_msgSend_invalidateWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "invalidateWithError:");
}

id objc_msgSend_isActionSet(void *a1, const char *a2, ...)
{
  return _[a1 isActionSet];
}

id objc_msgSend_isActive(void *a1, const char *a2, ...)
{
  return _[a1 isActive];
}

id objc_msgSend_isArtworkVisuallyIdenticalToCatalog_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isArtworkVisuallyIdenticalToCatalog:");
}

id objc_msgSend_isB239ButtonEvent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isB239ButtonEvent:");
}

id objc_msgSend_isBannerTransaction(void *a1, const char *a2, ...)
{
  return _[a1 isBannerTransaction];
}

id objc_msgSend_isBatteryCharging(void *a1, const char *a2, ...)
{
  return _[a1 isBatteryCharging];
}

id objc_msgSend_isBatteryLevelValid(void *a1, const char *a2, ...)
{
  return _[a1 isBatteryLevelValid];
}

id objc_msgSend_isBluetooth(void *a1, const char *a2, ...)
{
  return _[a1 isBluetooth];
}

id objc_msgSend_isBluetoothLE(void *a1, const char *a2, ...)
{
  return _[a1 isBluetoothLE];
}

id objc_msgSend_isCameraInUse(void *a1, const char *a2, ...)
{
  return _[a1 isCameraInUse];
}

id objc_msgSend_isCameraItem(void *a1, const char *a2, ...)
{
  return _[a1 isCameraItem];
}

id objc_msgSend_isCharging(void *a1, const char *a2, ...)
{
  return _[a1 isCharging];
}

id objc_msgSend_isContinuityCameraConnected(void *a1, const char *a2, ...)
{
  return _[a1 isContinuityCameraConnected];
}

id objc_msgSend_isContinuous(void *a1, const char *a2, ...)
{
  return _[a1 isContinuous];
}

id objc_msgSend_isCurrentUser(void *a1, const char *a2, ...)
{
  return _[a1 isCurrentUser];
}

id objc_msgSend_isDescendantOfView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isDescendantOfView:");
}

id objc_msgSend_isDeviceRoute(void *a1, const char *a2, ...)
{
  return _[a1 isDeviceRoute];
}

id objc_msgSend_isDictating(void *a1, const char *a2, ...)
{
  return _[a1 isDictating];
}

id objc_msgSend_isDisabled(void *a1, const char *a2, ...)
{
  return _[a1 isDisabled];
}

id objc_msgSend_isDockKitEnabled(void *a1, const char *a2, ...)
{
  return _[a1 isDockKitEnabled];
}

id objc_msgSend_isDockKitEnabledForBundleID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isDockKitEnabledForBundleID:");
}

id objc_msgSend_isEffectEnabled_forBundleID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEffectEnabled:forBundleID:");
}

id objc_msgSend_isEffectSupported_forBundleID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEffectSupported:forBundleID:");
}

id objc_msgSend_isEffectUnavailable_forBundleID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEffectUnavailable:forBundleID:");
}

id objc_msgSend_isEligibleForSpatialization(void *a1, const char *a2, ...)
{
  return _[a1 isEligibleForSpatialization];
}

id objc_msgSend_isEnabled(void *a1, const char *a2, ...)
{
  return _[a1 isEnabled];
}

id objc_msgSend_isEqual(void *a1, const char *a2, ...)
{
  return _[a1 isEqual];
}

id objc_msgSend_isEqual_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqual:");
}

id objc_msgSend_isEqualToArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToArray:");
}

id objc_msgSend_isEqualToDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToDate:");
}

id objc_msgSend_isEqualToDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToDictionary:");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_isFaceTimeActive(void *a1, const char *a2, ...)
{
  return _[a1 isFaceTimeActive];
}

id objc_msgSend_isFailed(void *a1, const char *a2, ...)
{
  return _[a1 isFailed];
}

id objc_msgSend_isFilteringToFavoriteCameras(void *a1, const char *a2, ...)
{
  return _[a1 isFilteringToFavoriteCameras];
}

id objc_msgSend_isFocused(void *a1, const char *a2, ...)
{
  return _[a1 isFocused];
}

id objc_msgSend_isGeometryFlipped(void *a1, const char *a2, ...)
{
  return _[a1 isGeometryFlipped];
}

id objc_msgSend_isHidden(void *a1, const char *a2, ...)
{
  return _[a1 isHidden];
}

id objc_msgSend_isHighlighted(void *a1, const char *a2, ...)
{
  return _[a1 isHighlighted];
}

id objc_msgSend_isHomeTheaterRoute(void *a1, const char *a2, ...)
{
  return _[a1 isHomeTheaterRoute];
}

id objc_msgSend_isInitialUpdate(void *a1, const char *a2, ...)
{
  return _[a1 isInitialUpdate];
}

id objc_msgSend_isInternetAvailable(void *a1, const char *a2, ...)
{
  return _[a1 isInternetAvailable];
}

id objc_msgSend_isJoinedConversationFaceTimeCapable(void *a1, const char *a2, ...)
{
  return _[a1 isJoinedConversationFaceTimeCapable];
}

id objc_msgSend_isLightweightMember(void *a1, const char *a2, ...)
{
  return _[a1 isLightweightMember];
}

id objc_msgSend_isLiveContent(void *a1, const char *a2, ...)
{
  return _[a1 isLiveContent];
}

id objc_msgSend_isLoadingContentRestrictions(void *a1, const char *a2, ...)
{
  return _[a1 isLoadingContentRestrictions];
}

id objc_msgSend_isLocal(void *a1, const char *a2, ...)
{
  return _[a1 isLocal];
}

id objc_msgSend_isLocalDevice(void *a1, const char *a2, ...)
{
  return _[a1 isLocalDevice];
}

id objc_msgSend_isLocationInUse(void *a1, const char *a2, ...)
{
  return _[a1 isLocationInUse];
}

id objc_msgSend_isMainThread(void *a1, const char *a2, ...)
{
  return _[a1 isMainThread];
}

id objc_msgSend_isManualFramingSupported(void *a1, const char *a2, ...)
{
  return _[a1 isManualFramingSupported];
}

id objc_msgSend_isManuallyFraming(void *a1, const char *a2, ...)
{
  return _[a1 isManuallyFraming];
}

id objc_msgSend_isMicInUse(void *a1, const char *a2, ...)
{
  return _[a1 isMicInUse];
}

id objc_msgSend_isModeEnabled_forBundleID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isModeEnabled:forBundleID:");
}

id objc_msgSend_isModeSupported_forBundleID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isModeSupported:forBundleID:");
}

id objc_msgSend_isModeUnavailable_forBundleID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isModeUnavailable:forBundleID:");
}

id objc_msgSend_isMultichannel(void *a1, const char *a2, ...)
{
  return _[a1 isMultichannel];
}

id objc_msgSend_isMuted(void *a1, const char *a2, ...)
{
  return _[a1 isMuted];
}

id objc_msgSend_isNonHighPrioritySuspendedWithLevel_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isNonHighPrioritySuspendedWithLevel:");
}

id objc_msgSend_isPaired(void *a1, const char *a2, ...)
{
  return _[a1 isPaired];
}

id objc_msgSend_isPartnerRouteRoutable(void *a1, const char *a2, ...)
{
  return _[a1 isPartnerRouteRoutable];
}

id objc_msgSend_isPipActive(void *a1, const char *a2, ...)
{
  return _[a1 isPipActive];
}

id objc_msgSend_isPlaying(void *a1, const char *a2, ...)
{
  return _[a1 isPlaying];
}

id objc_msgSend_isPodcast(void *a1, const char *a2, ...)
{
  return _[a1 isPodcast];
}

id objc_msgSend_isRecent(void *a1, const char *a2, ...)
{
  return _[a1 isRecent];
}

id objc_msgSend_isRecording(void *a1, const char *a2, ...)
{
  return _[a1 isRecording];
}

id objc_msgSend_isRelay(void *a1, const char *a2, ...)
{
  return _[a1 isRelay];
}

id objc_msgSend_isRunning(void *a1, const char *a2, ...)
{
  return _[a1 isRunning];
}

id objc_msgSend_isScaledUI(void *a1, const char *a2, ...)
{
  return _[a1 isScaledUI];
}

id objc_msgSend_isSelected(void *a1, const char *a2, ...)
{
  return _[a1 isSelected];
}

id objc_msgSend_isSendingVideo(void *a1, const char *a2, ...)
{
  return _[a1 isSendingVideo];
}

id objc_msgSend_isSettingLockedDownByRestrictions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isSettingLockedDownByRestrictions:");
}

id objc_msgSend_isSiblingRoutePresent(void *a1, const char *a2, ...)
{
  return _[a1 isSiblingRoutePresent];
}

id objc_msgSend_isSpatialized(void *a1, const char *a2, ...)
{
  return _[a1 isSpatialized];
}

id objc_msgSend_isSplitRoute(void *a1, const char *a2, ...)
{
  return _[a1 isSplitRoute];
}

id objc_msgSend_isSplitViewVisible(void *a1, const char *a2, ...)
{
  return _[a1 isSplitViewVisible];
}

id objc_msgSend_isSplitterCapable(void *a1, const char *a2, ...)
{
  return _[a1 isSplitterCapable];
}

id objc_msgSend_isStaticWaveform(void *a1, const char *a2, ...)
{
  return _[a1 isStaticWaveform];
}

id objc_msgSend_isSuggestedUser(void *a1, const char *a2, ...)
{
  return _[a1 isSuggestedUser];
}

id objc_msgSend_isSupported(void *a1, const char *a2, ...)
{
  return _[a1 isSupported];
}

id objc_msgSend_isSuspended(void *a1, const char *a2, ...)
{
  return _[a1 isSuspended];
}

id objc_msgSend_isSymbolImage(void *a1, const char *a2, ...)
{
  return _[a1 isSymbolImage];
}

id objc_msgSend_isSystemService(void *a1, const char *a2, ...)
{
  return _[a1 isSystemService];
}

id objc_msgSend_isUIApplicationElement(void *a1, const char *a2, ...)
{
  return _[a1 isUIApplicationElement];
}

id objc_msgSend_isUnavailable(void *a1, const char *a2, ...)
{
  return _[a1 isUnavailable];
}

id objc_msgSend_isUplinkMuted(void *a1, const char *a2, ...)
{
  return _[a1 isUplinkMuted];
}

id objc_msgSend_isUsingCamera(void *a1, const char *a2, ...)
{
  return _[a1 isUsingCamera];
}

id objc_msgSend_isUsingWideForFraming(void *a1, const char *a2, ...)
{
  return _[a1 isUsingWideForFraming];
}

id objc_msgSend_isVPNActive(void *a1, const char *a2, ...)
{
  return _[a1 isVPNActive];
}

id objc_msgSend_isVPNConfigured(void *a1, const char *a2, ...)
{
  return _[a1 isVPNConfigured];
}

id objc_msgSend_isValid(void *a1, const char *a2, ...)
{
  return _[a1 isValid];
}

id objc_msgSend_isValidPreviewBufferStream(void *a1, const char *a2, ...)
{
  return _[a1 isValidPreviewBufferStream];
}

id objc_msgSend_isViewLoaded(void *a1, const char *a2, ...)
{
  return _[a1 isViewLoaded];
}

id objc_msgSend_isVisible(void *a1, const char *a2, ...)
{
  return _[a1 isVisible];
}

id objc_msgSend_isVolumeControlAvailable(void *a1, const char *a2, ...)
{
  return _[a1 isVolumeControlAvailable];
}

id objc_msgSend_item(void *a1, const char *a2, ...)
{
  return _[a1 item];
}

id objc_msgSend_itemAtIndexPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "itemAtIndexPath:");
}

id objc_msgSend_itemDiameter(void *a1, const char *a2, ...)
{
  return _[a1 itemDiameter];
}

id objc_msgSend_itemFocusedSizeIncrease(void *a1, const char *a2, ...)
{
  return _[a1 itemFocusedSizeIncrease];
}

id objc_msgSend_itemManager(void *a1, const char *a2, ...)
{
  return _[a1 itemManager];
}

id objc_msgSend_itemSpacing(void *a1, const char *a2, ...)
{
  return _[a1 itemSpacing];
}

id objc_msgSend_itemWithIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "itemWithIdentifier:");
}

id objc_msgSend_items(void *a1, const char *a2, ...)
{
  return _[a1 items];
}

id objc_msgSend_joinContinuityConversationWithRequest_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "joinContinuityConversationWithRequest:completion:");
}

id objc_msgSend_joinConversation_onDevice_withContext_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "joinConversation:onDevice:withContext:completion:");
}

id objc_msgSend_joinNearbyConversationWithConversationID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "joinNearbyConversationWithConversationID:");
}

id objc_msgSend_joinedActivitySession(void *a1, const char *a2, ...)
{
  return _[a1 joinedActivitySession];
}

id objc_msgSend_joinedConversation(void *a1, const char *a2, ...)
{
  return _[a1 joinedConversation];
}

id objc_msgSend_keyPathWithRootObject_path_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "keyPathWithRootObject:path:");
}

id objc_msgSend_keyboardFocusedElement(void *a1, const char *a2, ...)
{
  return _[a1 keyboardFocusedElement];
}

id objc_msgSend_keyboardInputModeWithIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "keyboardInputModeWithIdentifier:");
}

id objc_msgSend_kind(void *a1, const char *a2, ...)
{
  return _[a1 kind];
}

id objc_msgSend_label(void *a1, const char *a2, ...)
{
  return _[a1 label];
}

id objc_msgSend_label1(void *a1, const char *a2, ...)
{
  return _[a1 label1];
}

id objc_msgSend_label2(void *a1, const char *a2, ...)
{
  return _[a1 label2];
}

id objc_msgSend_label3(void *a1, const char *a2, ...)
{
  return _[a1 label3];
}

id objc_msgSend_labelColor(void *a1, const char *a2, ...)
{
  return _[a1 labelColor];
}

id objc_msgSend_languageCode(void *a1, const char *a2, ...)
{
  return _[a1 languageCode];
}

id objc_msgSend_lastBaselineAnchor(void *a1, const char *a2, ...)
{
  return _[a1 lastBaselineAnchor];
}

id objc_msgSend_lastConnectTime(void *a1, const char *a2, ...)
{
  return _[a1 lastConnectTime];
}

id objc_msgSend_lastEvent(void *a1, const char *a2, ...)
{
  return _[a1 lastEvent];
}

id objc_msgSend_lastObject(void *a1, const char *a2, ...)
{
  return _[a1 lastObject];
}

id objc_msgSend_lastPlayingDate(void *a1, const char *a2, ...)
{
  return _[a1 lastPlayingDate];
}

id objc_msgSend_latestError(void *a1, const char *a2, ...)
{
  return _[a1 latestError];
}

id objc_msgSend_latestResults(void *a1, const char *a2, ...)
{
  return _[a1 latestResults];
}

id objc_msgSend_launchApplicationForActivitySession_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "launchApplicationForActivitySession:completionHandler:");
}

id objc_msgSend_launchCurrentActivitySessionWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "launchCurrentActivitySessionWithCompletion:");
}

id objc_msgSend_layer(void *a1, const char *a2, ...)
{
  return _[a1 layer];
}

id objc_msgSend_layoutForNoUser(void *a1, const char *a2, ...)
{
  return _[a1 layoutForNoUser];
}

id objc_msgSend_layoutFrame(void *a1, const char *a2, ...)
{
  return _[a1 layoutFrame];
}

id objc_msgSend_layoutFromBackingStore_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "layoutFromBackingStore:");
}

id objc_msgSend_layoutFromBackingStore_framingView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "layoutFromBackingStore:framingView:");
}

id objc_msgSend_layoutGuide(void *a1, const char *a2, ...)
{
  return _[a1 layoutGuide];
}

id objc_msgSend_layoutIfNeeded(void *a1, const char *a2, ...)
{
  return _[a1 layoutIfNeeded];
}

id objc_msgSend_layoutProvidersFromBackingStore_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "layoutProvidersFromBackingStore:");
}

id objc_msgSend_layoutResult(void *a1, const char *a2, ...)
{
  return _[a1 layoutResult];
}

id objc_msgSend_layoutResultsForEnvironment_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "layoutResultsForEnvironment:");
}

id objc_msgSend_layoutView(void *a1, const char *a2, ...)
{
  return _[a1 layoutView];
}

id objc_msgSend_layoutViewLeadingConstraint(void *a1, const char *a2, ...)
{
  return _[a1 layoutViewLeadingConstraint];
}

id objc_msgSend_layoutViewTrailingConstraint(void *a1, const char *a2, ...)
{
  return _[a1 layoutViewTrailingConstraint];
}

id objc_msgSend_layoutViewWidthConstraint(void *a1, const char *a2, ...)
{
  return _[a1 layoutViewWidthConstraint];
}

id objc_msgSend_layoutWithRows_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "layoutWithRows:");
}

id objc_msgSend_layoutWithRows_sizeProviders_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "layoutWithRows:sizeProviders:");
}

id objc_msgSend_leadingAnchor(void *a1, const char *a2, ...)
{
  return _[a1 leadingAnchor];
}

id objc_msgSend_leadingImageMargins(void *a1, const char *a2, ...)
{
  return _[a1 leadingImageMargins];
}

id objc_msgSend_leadingImageTreatment(void *a1, const char *a2, ...)
{
  return _[a1 leadingImageTreatment];
}

id objc_msgSend_leadingTemplateViewProvider(void *a1, const char *a2, ...)
{
  return _[a1 leadingTemplateViewProvider];
}

id objc_msgSend_leadingView(void *a1, const char *a2, ...)
{
  return _[a1 leadingView];
}

id objc_msgSend_leaveActivitySession_onConversation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "leaveActivitySession:onConversation:");
}

id objc_msgSend_leaveConversation(void *a1, const char *a2, ...)
{
  return _[a1 leaveConversation];
}

id objc_msgSend_leaveConversationWithUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "leaveConversationWithUUID:");
}

id objc_msgSend_leftAnchor(void *a1, const char *a2, ...)
{
  return _[a1 leftAnchor];
}

id objc_msgSend_leftPercentage(void *a1, const char *a2, ...)
{
  return _[a1 leftPercentage];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return _[a1 length];
}

id objc_msgSend_level(void *a1, const char *a2, ...)
{
  return _[a1 level];
}

id objc_msgSend_lightPackageName(void *a1, const char *a2, ...)
{
  return _[a1 lightPackageName];
}

id objc_msgSend_lineWidth(void *a1, const char *a2, ...)
{
  return _[a1 lineWidth];
}

id objc_msgSend_lineWidthForTimerSize_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lineWidthForTimerSize:");
}

id objc_msgSend_lingeringController(void *a1, const char *a2, ...)
{
  return _[a1 lingeringController];
}

id objc_msgSend_lingeringDuration(void *a1, const char *a2, ...)
{
  return _[a1 lingeringDuration];
}

id objc_msgSend_lingeringTimer(void *a1, const char *a2, ...)
{
  return _[a1 lingeringTimer];
}

id objc_msgSend_listeningMode(void *a1, const char *a2, ...)
{
  return _[a1 listeningMode];
}

id objc_msgSend_loadConfigurations(void *a1, const char *a2, ...)
{
  return _[a1 loadConfigurations];
}

id objc_msgSend_loadConfigurationsWithCompletionQueue_handler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "loadConfigurationsWithCompletionQueue:handler:");
}

id objc_msgSend_localAccessory(void *a1, const char *a2, ...)
{
  return _[a1 localAccessory];
}

id objc_msgSend_localMember(void *a1, const char *a2, ...)
{
  return _[a1 localMember];
}

id objc_msgSend_localRouteController(void *a1, const char *a2, ...)
{
  return _[a1 localRouteController];
}

id objc_msgSend_localizedConnectionStatus_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localizedConnectionStatus:");
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return _[a1 localizedDescription];
}

id objc_msgSend_localizedDisplayName(void *a1, const char *a2, ...)
{
  return _[a1 localizedDisplayName];
}

id objc_msgSend_localizedExecutableDisplayName(void *a1, const char *a2, ...)
{
  return _[a1 localizedExecutableDisplayName];
}

id objc_msgSend_localizedName(void *a1, const char *a2, ...)
{
  return _[a1 localizedName];
}

id objc_msgSend_localizedStringByJoiningStrings_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localizedStringByJoiningStrings:");
}

id objc_msgSend_localizedStringForKey_value_table_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localizedStringForKey:value:table:");
}

id objc_msgSend_localizedStringFromDate_dateStyle_timeStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localizedStringFromDate:dateStyle:timeStyle:");
}

id objc_msgSend_localizedStringWithFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localizedStringWithFormat:");
}

id objc_msgSend_localizedUppercaseString(void *a1, const char *a2, ...)
{
  return _[a1 localizedUppercaseString];
}

id objc_msgSend_localizedValue(void *a1, const char *a2, ...)
{
  return _[a1 localizedValue];
}

id objc_msgSend_locationAttribution(void *a1, const char *a2, ...)
{
  return _[a1 locationAttribution];
}

id objc_msgSend_locationInView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "locationInView:");
}

id objc_msgSend_locationIndicator(void *a1, const char *a2, ...)
{
  return _[a1 locationIndicator];
}

id objc_msgSend_locationIndicatorView(void *a1, const char *a2, ...)
{
  return _[a1 locationIndicatorView];
}

id objc_msgSend_log(void *a1, const char *a2, ...)
{
  return _[a1 log];
}

id objc_msgSend_logicalLeaderOutputDevice(void *a1, const char *a2, ...)
{
  return _[a1 logicalLeaderOutputDevice];
}

id objc_msgSend_longerFormatter(void *a1, const char *a2, ...)
{
  return _[a1 longerFormatter];
}

id objc_msgSend_lowBatteryState(void *a1, const char *a2, ...)
{
  return _[a1 lowBatteryState];
}

id objc_msgSend_macAddress(void *a1, const char *a2, ...)
{
  return _[a1 macAddress];
}

id objc_msgSend_magentaColor(void *a1, const char *a2, ...)
{
  return _[a1 magentaColor];
}

id objc_msgSend_mainBundle(void *a1, const char *a2, ...)
{
  return _[a1 mainBundle];
}

id objc_msgSend_mainLayer(void *a1, const char *a2, ...)
{
  return _[a1 mainLayer];
}

id objc_msgSend_mainQueue(void *a1, const char *a2, ...)
{
  return _[a1 mainQueue];
}

id objc_msgSend_mainRunLoop(void *a1, const char *a2, ...)
{
  return _[a1 mainRunLoop];
}

id objc_msgSend_mainScreen(void *a1, const char *a2, ...)
{
  return _[a1 mainScreen];
}

id objc_msgSend_makeKeyAndVisible(void *a1, const char *a2, ...)
{
  return _[a1 makeKeyAndVisible];
}

id objc_msgSend_makeReadyToPresentBanners(void *a1, const char *a2, ...)
{
  return _[a1 makeReadyToPresentBanners];
}

id objc_msgSend_manualFramingViewDidChangeLensSelection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "manualFramingViewDidChangeLensSelection:");
}

id objc_msgSend_manualFramingViewDidChangeZoomFactor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "manualFramingViewDidChangeZoomFactor:");
}

id objc_msgSend_manualFramingViewDidTriggerOneShotFraming(void *a1, const char *a2, ...)
{
  return _[a1 manualFramingViewDidTriggerOneShotFraming];
}

id objc_msgSend_manualStartAnimatorWithPropertyAnimator_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "manualStartAnimatorWithPropertyAnimator:");
}

id objc_msgSend_marqueeEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "marqueeEnabled:");
}

id objc_msgSend_marqueeRunning_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "marqueeRunning:");
}

id objc_msgSend_marqueeState(void *a1, const char *a2, ...)
{
  return _[a1 marqueeState];
}

id objc_msgSend_matchesActivityAttribution_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "matchesActivityAttribution:");
}

id objc_msgSend_matchesAttributedEntity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "matchesAttributedEntity:");
}

id objc_msgSend_maxAvailableVideoZoomFactor(void *a1, const char *a2, ...)
{
  return _[a1 maxAvailableVideoZoomFactor];
}

id objc_msgSend_maxValueIconView(void *a1, const char *a2, ...)
{
  return _[a1 maxValueIconView];
}

id objc_msgSend_maximumContentHeight(void *a1, const char *a2, ...)
{
  return _[a1 maximumContentHeight];
}

id objc_msgSend_maximumValue(void *a1, const char *a2, ...)
{
  return _[a1 maximumValue];
}

id objc_msgSend_mediaPlayerView(void *a1, const char *a2, ...)
{
  return _[a1 mediaPlayerView];
}

id objc_msgSend_mediaPlayerViewForRouteUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mediaPlayerViewForRouteUID:");
}

id objc_msgSend_mediaSubType(void *a1, const char *a2, ...)
{
  return _[a1 mediaSubType];
}

id objc_msgSend_mediaType(void *a1, const char *a2, ...)
{
  return _[a1 mediaType];
}

id objc_msgSend_menuBarBorderColor(void *a1, const char *a2, ...)
{
  return _[a1 menuBarBorderColor];
}

id objc_msgSend_menuBarBorderWidth(void *a1, const char *a2, ...)
{
  return _[a1 menuBarBorderWidth];
}

id objc_msgSend_menuBarContentView(void *a1, const char *a2, ...)
{
  return _[a1 menuBarContentView];
}

id objc_msgSend_menuBarShortTitle(void *a1, const char *a2, ...)
{
  return _[a1 menuBarShortTitle];
}

id objc_msgSend_menuBarViewController(void *a1, const char *a2, ...)
{
  return _[a1 menuBarViewController];
}

id objc_msgSend_menuDataSourceContentView(void *a1, const char *a2, ...)
{
  return _[a1 menuDataSourceContentView];
}

id objc_msgSend_menuDataSourceControllerDidChange_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "menuDataSourceControllerDidChange:");
}

id objc_msgSend_menuForRenderer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "menuForRenderer:");
}

id objc_msgSend_menuItem(void *a1, const char *a2, ...)
{
  return _[a1 menuItem];
}

id objc_msgSend_menuItemHostViewsDict(void *a1, const char *a2, ...)
{
  return _[a1 menuItemHostViewsDict];
}

id objc_msgSend_menuItemVisualContentDidChange_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "menuItemVisualContentDidChange:");
}

id objc_msgSend_menuItems(void *a1, const char *a2, ...)
{
  return _[a1 menuItems];
}

id objc_msgSend_menuMode(void *a1, const char *a2, ...)
{
  return _[a1 menuMode];
}

id objc_msgSend_menuModeBannerContextDidCompleteTransition_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "menuModeBannerContextDidCompleteTransition:");
}

id objc_msgSend_menuModeController(void *a1, const char *a2, ...)
{
  return _[a1 menuModeController];
}

id objc_msgSend_menuModeControllerModeDidChange_withTransitionContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "menuModeControllerModeDidChange:withTransitionContext:");
}

id objc_msgSend_menuModeState(void *a1, const char *a2, ...)
{
  return _[a1 menuModeState];
}

id objc_msgSend_menuModeStateProviderDidChange_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "menuModeStateProviderDidChange:");
}

id objc_msgSend_menuOptionsRenderers(void *a1, const char *a2, ...)
{
  return _[a1 menuOptionsRenderers];
}

id objc_msgSend_menuWithChildren_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "menuWithChildren:");
}

id objc_msgSend_menuWithTitle_image_identifier_options_children_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "menuWithTitle:image:identifier:options:children:");
}

id objc_msgSend_mergedActiveRemoteParticipants(void *a1, const char *a2, ...)
{
  return _[a1 mergedActiveRemoteParticipants];
}

id objc_msgSend_metadata(void *a1, const char *a2, ...)
{
  return _[a1 metadata];
}

id objc_msgSend_metadataObject(void *a1, const char *a2, ...)
{
  return _[a1 metadataObject];
}

id objc_msgSend_micAppInfo(void *a1, const char *a2, ...)
{
  return _[a1 micAppInfo];
}

id objc_msgSend_micContentFromBackingStore_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "micContentFromBackingStore:");
}

id objc_msgSend_micIdentifierFromBackingStore_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "micIdentifierFromBackingStore:");
}

id objc_msgSend_micModes(void *a1, const char *a2, ...)
{
  return _[a1 micModes];
}

id objc_msgSend_microphoneIndicatorPixelShifter(void *a1, const char *a2, ...)
{
  return _[a1 microphoneIndicatorPixelShifter];
}

id objc_msgSend_minAvailableVideoZoomFactor(void *a1, const char *a2, ...)
{
  return _[a1 minAvailableVideoZoomFactor];
}

id objc_msgSend_minValueIconView(void *a1, const char *a2, ...)
{
  return _[a1 minValueIconView];
}

id objc_msgSend_minificationFilter_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "minificationFilter:");
}

id objc_msgSend_minimumValue(void *a1, const char *a2, ...)
{
  return _[a1 minimumValue];
}

id objc_msgSend_minusSet_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "minusSet:");
}

id objc_msgSend_mode(void *a1, const char *a2, ...)
{
  return _[a1 mode];
}

id objc_msgSend_modeForAVMode_cameraAppBundleID_displayName_systemImageName_coordinator_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "modeForAVMode:cameraAppBundleID:displayName:systemImageName:coordinator:");
}

id objc_msgSend_modeForAVMode_cameraAppBundleID_displayName_systemImageName_enabledSystemImageName_coordinator_( void *a1, const char *a2, ...)
{
  return _objc_msgSend( a1,  "modeForAVMode:cameraAppBundleID:displayName:systemImageName:enabledSystemImageName:coordinator:");
}

id objc_msgSend_model(void *a1, const char *a2, ...)
{
  return _[a1 model];
}

id objc_msgSend_monitorWithConfiguration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "monitorWithConfiguration:");
}

id objc_msgSend_monogramViewConfigurationForDiameter_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "monogramViewConfigurationForDiameter:");
}

id objc_msgSend_monospacedSystemFontOfSize_weight_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "monospacedSystemFontOfSize:weight:");
}

id objc_msgSend_mosaicView(void *a1, const char *a2, ...)
{
  return _[a1 mosaicView];
}

id objc_msgSend_msv_firstWhere_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "msv_firstWhere:");
}

id objc_msgSend_msv_map_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "msv_map:");
}

id objc_msgSend_mutableAttributions(void *a1, const char *a2, ...)
{
  return _[a1 mutableAttributions];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return _[a1 mutableCopy];
}

id objc_msgSend_na_firstObjectPassingTest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "na_firstObjectPassingTest:");
}

id objc_msgSend_na_objectForKey_withDefaultValue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "na_objectForKey:withDefaultValue:");
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return _[a1 name];
}

id objc_msgSend_nameComponents(void *a1, const char *a2, ...)
{
  return _[a1 nameComponents];
}

id objc_msgSend_neConfiguration(void *a1, const char *a2, ...)
{
  return _[a1 neConfiguration];
}

id objc_msgSend_nearbyConversationIDsToDeviceHandles(void *a1, const char *a2, ...)
{
  return _[a1 nearbyConversationIDsToDeviceHandles];
}

id objc_msgSend_nearbyConversationLayoutProvidersFromBackingStore_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "nearbyConversationLayoutProvidersFromBackingStore:");
}

id objc_msgSend_nearbyConversations(void *a1, const char *a2, ...)
{
  return _[a1 nearbyConversations];
}

id objc_msgSend_neighborhoodActivityConduit(void *a1, const char *a2, ...)
{
  return _[a1 neighborhoodActivityConduit];
}

id objc_msgSend_networkController_didChangeNetworkState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "networkController:didChangeNetworkState:");
}

id objc_msgSend_networkInterfaceManager_didChangeInternetAvailability_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "networkInterfaceManager:didChangeInternetAvailability:");
}

id objc_msgSend_networkName(void *a1, const char *a2, ...)
{
  return _[a1 networkName];
}

id objc_msgSend_networkState(void *a1, const char *a2, ...)
{
  return _[a1 networkState];
}

id objc_msgSend_newMenuItem(void *a1, const char *a2, ...)
{
  return _[a1 newMenuItem];
}

id objc_msgSend_nextFocusedItem(void *a1, const char *a2, ...)
{
  return _[a1 nextFocusedItem];
}

id objc_msgSend_nextFocusedView(void *a1, const char *a2, ...)
{
  return _[a1 nextFocusedView];
}

id objc_msgSend_nextMenuItem(void *a1, const char *a2, ...)
{
  return _[a1 nextMenuItem];
}

id objc_msgSend_noiseControlSupported(void *a1, const char *a2, ...)
{
  return _[a1 noiseControlSupported];
}

id objc_msgSend_normalMenuItemTextColor(void *a1, const char *a2, ...)
{
  return _[a1 normalMenuItemTextColor];
}

id objc_msgSend_normalizedBatteryLevel(void *a1, const char *a2, ...)
{
  return _[a1 normalizedBatteryLevel];
}

id objc_msgSend_notifyChange(void *a1, const char *a2, ...)
{
  return _[a1 notifyChange];
}

id objc_msgSend_notifyDelegate(void *a1, const char *a2, ...)
{
  return _[a1 notifyDelegate];
}

id objc_msgSend_now(void *a1, const char *a2, ...)
{
  return _[a1 now];
}

id objc_msgSend_nowPlayingAppBundleIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 nowPlayingAppBundleIdentifier];
}

id objc_msgSend_nowPlayingController_didUpdateNowPlayingPlayerPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "nowPlayingController:didUpdateNowPlayingPlayerPath:");
}

id objc_msgSend_nowPlayingInfo(void *a1, const char *a2, ...)
{
  return _[a1 nowPlayingInfo];
}

id objc_msgSend_nowPlayingLargePlaybackButtonDiameter(void *a1, const char *a2, ...)
{
  return _[a1 nowPlayingLargePlaybackButtonDiameter];
}

id objc_msgSend_nowPlayingMediaItem_didUpdateWithChangedKeys_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "nowPlayingMediaItem:didUpdateWithChangedKeys:");
}

id objc_msgSend_nowPlayingPlaybackButtonDiameter(void *a1, const char *a2, ...)
{
  return _[a1 nowPlayingPlaybackButtonDiameter];
}

id objc_msgSend_nowPlayingPlayerPath(void *a1, const char *a2, ...)
{
  return _[a1 nowPlayingPlayerPath];
}

id objc_msgSend_nowPlayingProvider(void *a1, const char *a2, ...)
{
  return _[a1 nowPlayingProvider];
}

id objc_msgSend_nowPlayingState(void *a1, const char *a2, ...)
{
  return _[a1 nowPlayingState];
}

id objc_msgSend_nowPlayingState_currentMediaItemDidChange_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "nowPlayingState:currentMediaItemDidChange:");
}

id objc_msgSend_nowPlayingState_playbackRateDidChange_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "nowPlayingState:playbackRateDidChange:");
}

id objc_msgSend_nowPlayingState_playbackStateDidChange_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "nowPlayingState:playbackStateDidChange:");
}

id objc_msgSend_nowPlayingTransportBarHeight(void *a1, const char *a2, ...)
{
  return _[a1 nowPlayingTransportBarHeight];
}

id objc_msgSend_numberOfLines_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberOfLines:");
}

id objc_msgSend_numberWithBool_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithBool:");
}

id objc_msgSend_numberWithDouble_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithDouble:");
}

id objc_msgSend_numberWithFloat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithFloat:");
}

id objc_msgSend_numberWithInt_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithInt:");
}

id objc_msgSend_numberWithInteger_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithInteger:");
}

id objc_msgSend_numberWithUnsignedInteger_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithUnsignedInteger:");
}

id objc_msgSend_object(void *a1, const char *a2, ...)
{
  return _[a1 object];
}

id objc_msgSend_objectAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectAtIndex:");
}

id objc_msgSend_objectAtIndexedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectAtIndexedSubscript:");
}

id objc_msgSend_objectEnumerator(void *a1, const char *a2, ...)
{
  return _[a1 objectEnumerator];
}

id objc_msgSend_objectForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKey:");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_objectForTrait_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForTrait:");
}

id objc_msgSend_objectsAtIndexes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectsAtIndexes:");
}

id objc_msgSend_observeDataWithBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "observeDataWithBlock:");
}

id objc_msgSend_observerSet(void *a1, const char *a2, ...)
{
  return _[a1 observerSet];
}

id objc_msgSend_observers(void *a1, const char *a2, ...)
{
  return _[a1 observers];
}

id objc_msgSend_offset(void *a1, const char *a2, ...)
{
  return _[a1 offset];
}

id objc_msgSend_offsetForStep_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "offsetForStep:");
}

id objc_msgSend_onBatteryStateChange(void *a1, const char *a2, ...)
{
  return _[a1 onBatteryStateChange];
}

id objc_msgSend_onCameraAppChange(void *a1, const char *a2, ...)
{
  return _[a1 onCameraAppChange];
}

id objc_msgSend_onContinuityCameraConnectionChange(void *a1, const char *a2, ...)
{
  return _[a1 onContinuityCameraConnectionChange];
}

id objc_msgSend_onLensChange(void *a1, const char *a2, ...)
{
  return _[a1 onLensChange];
}

id objc_msgSend_onMicAppChange(void *a1, const char *a2, ...)
{
  return _[a1 onMicAppChange];
}

id objc_msgSend_onMicModeEnabledChange(void *a1, const char *a2, ...)
{
  return _[a1 onMicModeEnabledChange];
}

id objc_msgSend_onMicModeSupportChange(void *a1, const char *a2, ...)
{
  return _[a1 onMicModeSupportChange];
}

id objc_msgSend_onSampleBufferChange(void *a1, const char *a2, ...)
{
  return _[a1 onSampleBufferChange];
}

id objc_msgSend_onShouldTransformChange(void *a1, const char *a2, ...)
{
  return _[a1 onShouldTransformChange];
}

id objc_msgSend_onVideoEffectsControlModeChange(void *a1, const char *a2, ...)
{
  return _[a1 onVideoEffectsControlModeChange];
}

id objc_msgSend_onVideoEffectsEnabledChange(void *a1, const char *a2, ...)
{
  return _[a1 onVideoEffectsEnabledChange];
}

id objc_msgSend_onVideoEffectsSupportChange(void *a1, const char *a2, ...)
{
  return _[a1 onVideoEffectsSupportChange];
}

id objc_msgSend_onZoomFactorChange(void *a1, const char *a2, ...)
{
  return _[a1 onZoomFactorChange];
}

id objc_msgSend_openApplication_withOptions_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "openApplication:withOptions:completion:");
}

id objc_msgSend_openSensitiveURL_withOptions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "openSensitiveURL:withOptions:");
}

id objc_msgSend_openSensitiveURL_withOptions_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "openSensitiveURL:withOptions:error:");
}

id objc_msgSend_orderedCameraItems(void *a1, const char *a2, ...)
{
  return _[a1 orderedCameraItems];
}

id objc_msgSend_orderedSet(void *a1, const char *a2, ...)
{
  return _[a1 orderedSet];
}

id objc_msgSend_orderedSetWithArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "orderedSetWithArray:");
}

id objc_msgSend_orderedSetWithObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "orderedSetWithObject:");
}

id objc_msgSend_orthogonalNavigationFocusSinkView(void *a1, const char *a2, ...)
{
  return _[a1 orthogonalNavigationFocusSinkView];
}

id objc_msgSend_outlineLayer(void *a1, const char *a2, ...)
{
  return _[a1 outlineLayer];
}

id objc_msgSend_outputDevices(void *a1, const char *a2, ...)
{
  return _[a1 outputDevices];
}

id objc_msgSend_package(void *a1, const char *a2, ...)
{
  return _[a1 package];
}

id objc_msgSend_packageName(void *a1, const char *a2, ...)
{
  return _[a1 packageName];
}

id objc_msgSend_packageStateForPlaybackState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "packageStateForPlaybackState:");
}

id objc_msgSend_packageURL(void *a1, const char *a2, ...)
{
  return _[a1 packageURL];
}

id objc_msgSend_packageView(void *a1, const char *a2, ...)
{
  return _[a1 packageView];
}

id objc_msgSend_packageWithContentsOfURL_type_options_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "packageWithContentsOfURL:type:options:error:");
}

id objc_msgSend_paddableContainerView(void *a1, const char *a2, ...)
{
  return _[a1 paddableContainerView];
}

id objc_msgSend_pairableDevices(void *a1, const char *a2, ...)
{
  return _[a1 pairableDevices];
}

id objc_msgSend_pairedDevices(void *a1, const char *a2, ...)
{
  return _[a1 pairedDevices];
}

id objc_msgSend_panelExitGuide(void *a1, const char *a2, ...)
{
  return _[a1 panelExitGuide];
}

id objc_msgSend_panelHostingViewController(void *a1, const char *a2, ...)
{
  return _[a1 panelHostingViewController];
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return _[a1 path];
}

id objc_msgSend_pathForResource_ofType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pathForResource:ofType:");
}

id objc_msgSend_pause(void *a1, const char *a2, ...)
{
  return _[a1 pause];
}

id objc_msgSend_pauseHeadphoneMovies(void *a1, const char *a2, ...)
{
  return _[a1 pauseHeadphoneMovies];
}

id objc_msgSend_pauseMovie(void *a1, const char *a2, ...)
{
  return _[a1 pauseMovie];
}

id objc_msgSend_pausedAnimationDuration(void *a1, const char *a2, ...)
{
  return _[a1 pausedAnimationDuration];
}

id objc_msgSend_pausedSpringDamping(void *a1, const char *a2, ...)
{
  return _[a1 pausedSpringDamping];
}

id objc_msgSend_pbs_homeKitCamerasFilter(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pbs_homeKitCamerasFilter");
}

id objc_msgSend_pbs_homeKitDisabledCameras(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pbs_homeKitDisabledCameras");
}

id objc_msgSend_pbs_secureHomeKitAccessoryAllowedRemotes(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pbs_secureHomeKitAccessoryAllowedRemotes");
}

id objc_msgSend_peekPresentable(void *a1, const char *a2, ...)
{
  return _[a1 peekPresentable];
}

id objc_msgSend_peerDeviceIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 peerDeviceIdentifier];
}

id objc_msgSend_penderIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 penderIdentifier];
}

id objc_msgSend_percentComplete(void *a1, const char *a2, ...)
{
  return _[a1 percentComplete];
}

id objc_msgSend_percentageID(void *a1, const char *a2, ...)
{
  return _[a1 percentageID];
}

id objc_msgSend_performChanges_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performChanges:completionHandler:");
}

id objc_msgSend_performRequest_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performRequest:completion:");
}

id objc_msgSend_performRequestWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performRequestWithCompletion:");
}

id objc_msgSend_performWithBundleIdentifier_term_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performWithBundleIdentifier:term:completionHandler:");
}

id objc_msgSend_performWithOptions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performWithOptions:");
}

id objc_msgSend_performWithoutAnimation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performWithoutAnimation:");
}

id objc_msgSend_personNameComponents(void *a1, const char *a2, ...)
{
  return _[a1 personNameComponents];
}

id objc_msgSend_pickedRoute(void *a1, const char *a2, ...)
{
  return _[a1 pickedRoute];
}

id objc_msgSend_pid(void *a1, const char *a2, ...)
{
  return _[a1 pid];
}

id objc_msgSend_pillContentView(void *a1, const char *a2, ...)
{
  return _[a1 pillContentView];
}

id objc_msgSend_pillContentViewConfigurationWillChange_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pillContentViewConfigurationWillChange:");
}

id objc_msgSend_pillContentViewProvider(void *a1, const char *a2, ...)
{
  return _[a1 pillContentViewProvider];
}

id objc_msgSend_pillContentViewProviderDidChangeContentView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pillContentViewProviderDidChangeContentView:");
}

id objc_msgSend_pillContentViewProviderDidUpdateCurrentContentView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pillContentViewProviderDidUpdateCurrentContentView:");
}

id objc_msgSend_pillContentViewProviderWillUpdateCurrentContentView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pillContentViewProviderWillUpdateCurrentContentView:");
}

id objc_msgSend_pillContentViewWantsUpdateContext(void *a1, const char *a2, ...)
{
  return _[a1 pillContentViewWantsUpdateContext];
}

id objc_msgSend_pillView(void *a1, const char *a2, ...)
{
  return _[a1 pillView];
}

id objc_msgSend_pillViewTrailingConstraint(void *a1, const char *a2, ...)
{
  return _[a1 pillViewTrailingConstraint];
}

id objc_msgSend_pineBoardServicesUserDefaults(void *a1, const char *a2, ...)
{
  return _[a1 pineBoardServicesUserDefaults];
}

id objc_msgSend_pipActive(void *a1, const char *a2, ...)
{
  return _[a1 pipActive];
}

id objc_msgSend_pixelShifter_didUpdateOffset_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pixelShifter:didUpdateOffset:");
}

id objc_msgSend_placeholderLayoutWithHeight_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "placeholderLayoutWithHeight:");
}

id objc_msgSend_plainButtonConfiguration(void *a1, const char *a2, ...)
{
  return _[a1 plainButtonConfiguration];
}

id objc_msgSend_platterArtworkImage(void *a1, const char *a2, ...)
{
  return _[a1 platterArtworkImage];
}

id objc_msgSend_platterState(void *a1, const char *a2, ...)
{
  return _[a1 platterState];
}

id objc_msgSend_platterViewControllerClassProvider(void *a1, const char *a2, ...)
{
  return _[a1 platterViewControllerClassProvider];
}

id objc_msgSend_play(void *a1, const char *a2, ...)
{
  return _[a1 play];
}

id objc_msgSend_playHeadphoneMovies(void *a1, const char *a2, ...)
{
  return _[a1 playHeadphoneMovies];
}

id objc_msgSend_playbackControlsState(void *a1, const char *a2, ...)
{
  return _[a1 playbackControlsState];
}

id objc_msgSend_playbackQueue(void *a1, const char *a2, ...)
{
  return _[a1 playbackQueue];
}

id objc_msgSend_playbackRate(void *a1, const char *a2, ...)
{
  return _[a1 playbackRate];
}

id objc_msgSend_playbackState(void *a1, const char *a2, ...)
{
  return _[a1 playbackState];
}

id objc_msgSend_player(void *a1, const char *a2, ...)
{
  return _[a1 player];
}

id objc_msgSend_playerItemWithURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "playerItemWithURL:");
}

id objc_msgSend_playerLayer(void *a1, const char *a2, ...)
{
  return _[a1 playerLayer];
}

id objc_msgSend_playerPath(void *a1, const char *a2, ...)
{
  return _[a1 playerPath];
}

id objc_msgSend_playingItemIndexPath(void *a1, const char *a2, ...)
{
  return _[a1 playingItemIndexPath];
}

id objc_msgSend_pointSize(void *a1, const char *a2, ...)
{
  return _[a1 pointSize];
}

id objc_msgSend_popPlatterControllerWithAnimator_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "popPlatterControllerWithAnimator:");
}

id objc_msgSend_postEvent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "postEvent:");
}

id objc_msgSend_postPresentable_options_userInfo_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "postPresentable:options:userInfo:error:");
}

id objc_msgSend_postPresentable_withOptions_userInfo_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "postPresentable:withOptions:userInfo:error:");
}

id objc_msgSend_predictedEndDate(void *a1, const char *a2, ...)
{
  return _[a1 predictedEndDate];
}

id objc_msgSend_preferredContentSize(void *a1, const char *a2, ...)
{
  return _[a1 preferredContentSize];
}

id objc_msgSend_preferredFocusEnvironments(void *a1, const char *a2, ...)
{
  return _[a1 preferredFocusEnvironments];
}

id objc_msgSend_preferredFontForTextStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "preferredFontForTextStyle:");
}

id objc_msgSend_preferredFormat(void *a1, const char *a2, ...)
{
  return _[a1 preferredFormat];
}

id objc_msgSend_preferredInputModeList(void *a1, const char *a2, ...)
{
  return _[a1 preferredInputModeList];
}

id objc_msgSend_preferredLayoutMargins(void *a1, const char *a2, ...)
{
  return _[a1 preferredLayoutMargins];
}

id objc_msgSend_preferredVisualizerViewClass(void *a1, const char *a2, ...)
{
  return _[a1 preferredVisualizerViewClass];
}

id objc_msgSend_prepareImageForDescriptor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "prepareImageForDescriptor:");
}

id objc_msgSend_presentAirDropViewControllerWithItems_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "presentAirDropViewControllerWithItems:");
}

id objc_msgSend_presentBannerWithPresentable_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "presentBannerWithPresentable:");
}

id objc_msgSend_presentBannerWithPresentable_bannerContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "presentBannerWithPresentable:bannerContext:");
}

id objc_msgSend_presentCameraPickerIfNecessary(void *a1, const char *a2, ...)
{
  return _[a1 presentCameraPickerIfNecessary];
}

id objc_msgSend_presentDismissalAlertForActivitySession_onConversation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "presentDismissalAlertForActivitySession:onConversation:");
}

id objc_msgSend_presentDismissalAlertForCurrentActivitySession(void *a1, const char *a2, ...)
{
  return _[a1 presentDismissalAlertForCurrentActivitySession];
}

id objc_msgSend_presentNowPlayingWithOptions_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "presentNowPlayingWithOptions:completion:");
}

id objc_msgSend_presentViewController_animated_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "presentViewController:animated:completion:");
}

id objc_msgSend_presentable(void *a1, const char *a2, ...)
{
  return _[a1 presentable];
}

id objc_msgSend_presentableDidAppearAsBanner_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "presentableDidAppearAsBanner:");
}

id objc_msgSend_presentableDidDisappearAsBanner_withReason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "presentableDidDisappearAsBanner:withReason:");
}

id objc_msgSend_presentableUserInfo(void *a1, const char *a2, ...)
{
  return _[a1 presentableUserInfo];
}

id objc_msgSend_presentableWillAppearAsBanner_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "presentableWillAppearAsBanner:");
}

id objc_msgSend_presentableWillDisappearAsBanner_withReason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "presentableWillDisappearAsBanner:withReason:");
}

id objc_msgSend_presentableWillNotAppearAsBanner_withReason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "presentableWillNotAppearAsBanner:withReason:");
}

id objc_msgSend_presentationContext(void *a1, const char *a2, ...)
{
  return _[a1 presentationContext];
}

id objc_msgSend_presentationLayer(void *a1, const char *a2, ...)
{
  return _[a1 presentationLayer];
}

id objc_msgSend_presentationReason(void *a1, const char *a2, ...)
{
  return _[a1 presentationReason];
}

id objc_msgSend_presentedPresentables(void *a1, const char *a2, ...)
{
  return _[a1 presentedPresentables];
}

id objc_msgSend_presentedViewController(void *a1, const char *a2, ...)
{
  return _[a1 presentedViewController];
}

id objc_msgSend_presenter(void *a1, const char *a2, ...)
{
  return _[a1 presenter];
}

id objc_msgSend_presenter_didDismissPresentable_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "presenter:didDismissPresentable:");
}

id objc_msgSend_presenter_didPresentPresentable_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "presenter:didPresentPresentable:");
}

id objc_msgSend_presenter_requestsDismissPresentable_reason_animated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "presenter:requestsDismissPresentable:reason:animated:");
}

id objc_msgSend_presenter_willDismissPresentable_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "presenter:willDismissPresentable:");
}

id objc_msgSend_presenter_willPresentPresentable_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "presenter:willPresentPresentable:");
}

id objc_msgSend_previewStyle(void *a1, const char *a2, ...)
{
  return _[a1 previewStyle];
}

id objc_msgSend_previousBannerContext(void *a1, const char *a2, ...)
{
  return _[a1 previousBannerContext];
}

id objc_msgSend_previousBannerViewController(void *a1, const char *a2, ...)
{
  return _[a1 previousBannerViewController];
}

id objc_msgSend_previousMenuMode(void *a1, const char *a2, ...)
{
  return _[a1 previousMenuMode];
}

id objc_msgSend_previouslyFocusedView(void *a1, const char *a2, ...)
{
  return _[a1 previouslyFocusedView];
}

id objc_msgSend_primaryActionTriggeringGestures(void *a1, const char *a2, ...)
{
  return _[a1 primaryActionTriggeringGestures];
}

id objc_msgSend_primaryFont(void *a1, const char *a2, ...)
{
  return _[a1 primaryFont];
}

id objc_msgSend_primaryItem(void *a1, const char *a2, ...)
{
  return _[a1 primaryItem];
}

id objc_msgSend_primaryOutputDeviceRoute(void *a1, const char *a2, ...)
{
  return _[a1 primaryOutputDeviceRoute];
}

id objc_msgSend_primaryRoute(void *a1, const char *a2, ...)
{
  return _[a1 primaryRoute];
}

id objc_msgSend_primaryTemplateItemProvider(void *a1, const char *a2, ...)
{
  return _[a1 primaryTemplateItemProvider];
}

id objc_msgSend_privacyAdapterView(void *a1, const char *a2, ...)
{
  return _[a1 privacyAdapterView];
}

id objc_msgSend_privacyConfiguration(void *a1, const char *a2, ...)
{
  return _[a1 privacyConfiguration];
}

id objc_msgSend_privacyController(void *a1, const char *a2, ...)
{
  return _[a1 privacyController];
}

id objc_msgSend_privacyControllerStateDidChange_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "privacyControllerStateDidChange:");
}

id objc_msgSend_privacyPlusFaceTimeIconWithExpandedPillConfiguration(void *a1, const char *a2, ...)
{
  return _[a1 privacyPlusFaceTimeIconWithExpandedPillConfiguration];
}

id objc_msgSend_privacyPlusFaceTimeSoloIconConfiguration(void *a1, const char *a2, ...)
{
  return _[a1 privacyPlusFaceTimeSoloIconConfiguration];
}

id objc_msgSend_privacyPlusSharePlayIconWithExpandedPillConfiguration(void *a1, const char *a2, ...)
{
  return _[a1 privacyPlusSharePlayIconWithExpandedPillConfiguration];
}

id objc_msgSend_privacyPlusSharePlaySoloIconConfiguration(void *a1, const char *a2, ...)
{
  return _[a1 privacyPlusSharePlaySoloIconConfiguration];
}

id objc_msgSend_privacyState(void *a1, const char *a2, ...)
{
  return _[a1 privacyState];
}

id objc_msgSend_privacyStateAdapterView(void *a1, const char *a2, ...)
{
  return _[a1 privacyStateAdapterView];
}

id objc_msgSend_privacyToProfileSpacing(void *a1, const char *a2, ...)
{
  return _[a1 privacyToProfileSpacing];
}

id objc_msgSend_privacyView(void *a1, const char *a2, ...)
{
  return _[a1 privacyView];
}

id objc_msgSend_processIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 processIdentifier];
}

id objc_msgSend_profile(void *a1, const char *a2, ...)
{
  return _[a1 profile];
}

id objc_msgSend_profileImage(void *a1, const char *a2, ...)
{
  return _[a1 profileImage];
}

id objc_msgSend_profilePictureForAccountWithAltDSID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "profilePictureForAccountWithAltDSID:");
}

id objc_msgSend_profilePictureForUserWithIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "profilePictureForUserWithIdentifier:");
}

id objc_msgSend_progress(void *a1, const char *a2, ...)
{
  return _[a1 progress];
}

id objc_msgSend_progressLayer(void *a1, const char *a2, ...)
{
  return _[a1 progressLayer];
}

id objc_msgSend_progressView(void *a1, const char *a2, ...)
{
  return _[a1 progressView];
}

id objc_msgSend_propertySetWithProperties_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "propertySetWithProperties:");
}

id objc_msgSend_provider(void *a1, const char *a2, ...)
{
  return _[a1 provider];
}

id objc_msgSend_providerItemsDidChange_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "providerItemsDidChange:");
}

id objc_msgSend_providers(void *a1, const char *a2, ...)
{
  return _[a1 providers];
}

id objc_msgSend_providesTemplateContent(void *a1, const char *a2, ...)
{
  return _[a1 providesTemplateContent];
}

id objc_msgSend_publishedObjectWithName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "publishedObjectWithName:");
}

id objc_msgSend_pullPresentablesWithIdentification_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pullPresentablesWithIdentification:");
}

id objc_msgSend_pushPlatterController_animator_sourceIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pushPlatterController:animator:sourceIdentifier:");
}

id objc_msgSend_quaternaryLabelColor(void *a1, const char *a2, ...)
{
  return _[a1 quaternaryLabelColor];
}

id objc_msgSend_rangeOfString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rangeOfString:");
}

id objc_msgSend_reallyShortRowHeight(void *a1, const char *a2, ...)
{
  return _[a1 reallyShortRowHeight];
}

id objc_msgSend_reason(void *a1, const char *a2, ...)
{
  return _[a1 reason];
}

id objc_msgSend_recentAttributionData(void *a1, const char *a2, ...)
{
  return _[a1 recentAttributionData];
}

id objc_msgSend_recordingIndicator(void *a1, const char *a2, ...)
{
  return _[a1 recordingIndicator];
}

id objc_msgSend_recordingIndicatorView(void *a1, const char *a2, ...)
{
  return _[a1 recordingIndicatorView];
}

id objc_msgSend_recordingType(void *a1, const char *a2, ...)
{
  return _[a1 recordingType];
}

id objc_msgSend_redColor(void *a1, const char *a2, ...)
{
  return _[a1 redColor];
}

id objc_msgSend_refresh(void *a1, const char *a2, ...)
{
  return _[a1 refresh];
}

id objc_msgSend_refreshSnapshot(void *a1, const char *a2, ...)
{
  return _[a1 refreshSnapshot];
}

id objc_msgSend_registerBlockObserver_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "registerBlockObserver:");
}

id objc_msgSend_registerClass_forCellReuseIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "registerClass:forCellReuseIdentifier:");
}

id objc_msgSend_registerDefaultHandlerForEvent_withBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "registerDefaultHandlerForEvent:withBlock:");
}

id objc_msgSend_registerDefaults_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "registerDefaults:");
}

id objc_msgSend_registerForTraitChanges_withAction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "registerForTraitChanges:withAction:");
}

id objc_msgSend_registerForTraitChanges_withTarget_action_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "registerForTraitChanges:withTarget:action:");
}

id objc_msgSend_registerHandlerForEvent_onState_withBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "registerHandlerForEvent:onState:withBlock:");
}

id objc_msgSend_registerObserver_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "registerObserver:");
}

id objc_msgSend_registerStateTransitionFromState_onEvent_toState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "registerStateTransitionFromState:onEvent:toState:");
}

id objc_msgSend_registerWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "registerWithCompletionHandler:");
}

id objc_msgSend_relay(void *a1, const char *a2, ...)
{
  return _[a1 relay];
}

id objc_msgSend_relinquish(void *a1, const char *a2, ...)
{
  return _[a1 relinquish];
}

id objc_msgSend_relinquishFocus(void *a1, const char *a2, ...)
{
  return _[a1 relinquishFocus];
}

id objc_msgSend_reloadContent(void *a1, const char *a2, ...)
{
  return _[a1 reloadContent];
}

id objc_msgSend_reloadContentWithAnimator_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reloadContentWithAnimator:");
}

id objc_msgSend_reloadHomeConfiguration(void *a1, const char *a2, ...)
{
  return _[a1 reloadHomeConfiguration];
}

id objc_msgSend_reloadIfNeeded(void *a1, const char *a2, ...)
{
  return _[a1 reloadIfNeeded];
}

id objc_msgSend_reloadPlatter(void *a1, const char *a2, ...)
{
  return _[a1 reloadPlatter];
}

id objc_msgSend_remainingTime(void *a1, const char *a2, ...)
{
  return _[a1 remainingTime];
}

id objc_msgSend_remoteDisplayDiscovery(void *a1, const char *a2, ...)
{
  return _[a1 remoteDisplayDiscovery];
}

id objc_msgSend_remoteMemberContactIdentifiers(void *a1, const char *a2, ...)
{
  return _[a1 remoteMemberContactIdentifiers];
}

id objc_msgSend_remoteMemberCount(void *a1, const char *a2, ...)
{
  return _[a1 remoteMemberCount];
}

id objc_msgSend_remoteType(void *a1, const char *a2, ...)
{
  return _[a1 remoteType];
}

id objc_msgSend_removals(void *a1, const char *a2, ...)
{
  return _[a1 removals];
}

id objc_msgSend_removeActivationReason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeActivationReason:");
}

id objc_msgSend_removeAllAnimations(void *a1, const char *a2, ...)
{
  return _[a1 removeAllAnimations];
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return _[a1 removeAllObjects];
}

id objc_msgSend_removeAnimationForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeAnimationForKey:");
}

id objc_msgSend_removeArrangedSubview_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeArrangedSubview:");
}

id objc_msgSend_removeChildViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeChildViewController:");
}

id objc_msgSend_removeControllerObserver_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeControllerObserver:");
}

id objc_msgSend_removeFromParentViewController(void *a1, const char *a2, ...)
{
  return _[a1 removeFromParentViewController];
}

id objc_msgSend_removeFromSuperlayer(void *a1, const char *a2, ...)
{
  return _[a1 removeFromSuperlayer];
}

id objc_msgSend_removeFromSuperview(void *a1, const char *a2, ...)
{
  return _[a1 removeFromSuperview];
}

id objc_msgSend_removeGestureRecognizer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeGestureRecognizer:");
}

id objc_msgSend_removeLastObject(void *a1, const char *a2, ...)
{
  return _[a1 removeLastObject];
}

id objc_msgSend_removeMenuItemObserver_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeMenuItemObserver:");
}

id objc_msgSend_removeNearbyAccessoryControlsFromParentViewControllerAnimated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeNearbyAccessoryControlsFromParentViewControllerAnimated:");
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

id objc_msgSend_removeObjectsInArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObjectsInArray:");
}

id objc_msgSend_removeObserver_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObserver:");
}

id objc_msgSend_removeObserver_forKeyPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObserver:forKeyPath:");
}

id objc_msgSend_removeObserver_forKeyPath_context_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObserver:forKeyPath:context:");
}

id objc_msgSend_removeObserver_name_object_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObserver:name:object:");
}

id objc_msgSend_removePairableDevicesObserver_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removePairableDevicesObserver:");
}

id objc_msgSend_removePairedDevicesObserver_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removePairedDevicesObserver:");
}

id objc_msgSend_removeProviderObserver_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeProviderObserver:");
}

id objc_msgSend_removeStateObserver_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeStateObserver:");
}

id objc_msgSend_removeStateTransitionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeStateTransitionHandler:");
}

id objc_msgSend_removeVisibleObserver_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeVisibleObserver:");
}

id objc_msgSend_renderer(void *a1, const char *a2, ...)
{
  return _[a1 renderer];
}

id objc_msgSend_rendererForCamera_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rendererForCamera:");
}

id objc_msgSend_rendererForCameraItems_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rendererForCameraItems:");
}

id objc_msgSend_rendererForIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rendererForIdentifier:");
}

id objc_msgSend_rendererForScene_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rendererForScene:");
}

id objc_msgSend_rendererHostingViewForIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rendererHostingViewForIdentifier:");
}

id objc_msgSend_rendererIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 rendererIdentifier];
}

id objc_msgSend_rendererWithAccessibilityItem_format_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rendererWithAccessibilityItem:format:");
}

id objc_msgSend_rendererWithAudioRoute_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rendererWithAudioRoute:");
}

id objc_msgSend_rendererWithGameController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rendererWithGameController:");
}

id objc_msgSend_rendererWithIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rendererWithIdentifier:");
}

id objc_msgSend_rendererWithIdentifier_content_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rendererWithIdentifier:content:");
}

id objc_msgSend_rendererWithIdentifier_format_content_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rendererWithIdentifier:format:content:");
}

id objc_msgSend_rendererWithIdentifier_format_content_backingStore_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rendererWithIdentifier:format:content:backingStore:");
}

id objc_msgSend_rendererWithIdentifier_format_content_headphonesController_mediaPlayerView_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rendererWithIdentifier:format:content:headphonesController:mediaPlayerView:");
}

id objc_msgSend_rendererWithIdentifier_format_content_overrideStylings_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rendererWithIdentifier:format:content:overrideStylings:");
}

id objc_msgSend_rendererWithIdentifier_format_content_overrideStylings_optionsDict_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rendererWithIdentifier:format:content:overrideStylings:optionsDict:");
}

id objc_msgSend_rendererWithIdentifier_group_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rendererWithIdentifier:group:");
}

id objc_msgSend_rendererWithIdentifier_header_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rendererWithIdentifier:header:");
}

id objc_msgSend_rendererWithIdentifier_item_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rendererWithIdentifier:item:");
}

id objc_msgSend_rendererWithIdentifier_title_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rendererWithIdentifier:title:");
}

id objc_msgSend_renderers(void *a1, const char *a2, ...)
{
  return _[a1 renderers];
}

id objc_msgSend_renderersFromBackingStore_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "renderersFromBackingStore:");
}

id objc_msgSend_renderersFromBackingStore_framingView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "renderersFromBackingStore:framingView:");
}

id objc_msgSend_repeatInterval(void *a1, const char *a2, ...)
{
  return _[a1 repeatInterval];
}

id objc_msgSend_replaceCharactersInRange_withAttributedString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "replaceCharactersInRange:withAttributedString:");
}

id objc_msgSend_replaceCurrentItemWithPlayerItem_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "replaceCurrentItemWithPlayerItem:");
}

id objc_msgSend_reportControlCenterActionWithIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reportControlCenterActionWithIdentifier:");
}

id objc_msgSend_reportControlCenterOpened(void *a1, const char *a2, ...)
{
  return _[a1 reportControlCenterOpened];
}

id objc_msgSend_requestArtworkWithFittingSize_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "requestArtworkWithFittingSize:completion:");
}

id objc_msgSend_requestEventFocusForReason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "requestEventFocusForReason:");
}

id objc_msgSend_requestFocusAndRelinquishExternalGestures(void *a1, const char *a2, ...)
{
  return _[a1 requestFocusAndRelinquishExternalGestures];
}

id objc_msgSend_requestIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 requestIdentifier];
}

id objc_msgSend_requestImageWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "requestImageWithCompletion:");
}

id objc_msgSend_requestVideoUpgradeForCall_originatingUIType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "requestVideoUpgradeForCall:originatingUIType:");
}

id objc_msgSend_requesterIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 requesterIdentifier];
}

id objc_msgSend_requestsVisibility(void *a1, const char *a2, ...)
{
  return _[a1 requestsVisibility];
}

id objc_msgSend_requireIndicatorsOutsideMenuBar(void *a1, const char *a2, ...)
{
  return _[a1 requireIndicatorsOutsideMenuBar];
}

id objc_msgSend_requiresDeviceUnlock(void *a1, const char *a2, ...)
{
  return _[a1 requiresDeviceUnlock];
}

id objc_msgSend_resetHeadphoneMovies(void *a1, const char *a2, ...)
{
  return _[a1 resetHeadphoneMovies];
}

id objc_msgSend_resetMovie(void *a1, const char *a2, ...)
{
  return _[a1 resetMovie];
}

id objc_msgSend_resetProgress(void *a1, const char *a2, ...)
{
  return _[a1 resetProgress];
}

id objc_msgSend_resolvedColorWithTraitCollection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "resolvedColorWithTraitCollection:");
}

id objc_msgSend_respondsToCurrentMediaItemDidChange(void *a1, const char *a2, ...)
{
  return _[a1 respondsToCurrentMediaItemDidChange];
}

id objc_msgSend_respondsToDidChangeCurrentUser(void *a1, const char *a2, ...)
{
  return _[a1 respondsToDidChangeCurrentUser];
}

id objc_msgSend_respondsToDidChangeImage(void *a1, const char *a2, ...)
{
  return _[a1 respondsToDidChangeImage];
}

id objc_msgSend_respondsToDidChangeOutputDevices(void *a1, const char *a2, ...)
{
  return _[a1 respondsToDidChangeOutputDevices];
}

id objc_msgSend_respondsToDidChangePersonNameComponents(void *a1, const char *a2, ...)
{
  return _[a1 respondsToDidChangePersonNameComponents];
}

id objc_msgSend_respondsToDidUpdate(void *a1, const char *a2, ...)
{
  return _[a1 respondsToDidUpdate];
}

id objc_msgSend_respondsToPlaybackRateDidChange(void *a1, const char *a2, ...)
{
  return _[a1 respondsToPlaybackRateDidChange];
}

id objc_msgSend_respondsToPlaybackStateDidChange(void *a1, const char *a2, ...)
{
  return _[a1 respondsToPlaybackStateDidChange];
}

id objc_msgSend_respondsToSyncTiming(void *a1, const char *a2, ...)
{
  return _[a1 respondsToSyncTiming];
}

id objc_msgSend_response(void *a1, const char *a2, ...)
{
  return _[a1 response];
}

id objc_msgSend_restrictionsEnabled(void *a1, const char *a2, ...)
{
  return _[a1 restrictionsEnabled];
}

id objc_msgSend_resumeWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "resumeWithError:");
}

id objc_msgSend_reverseObjectEnumerator(void *a1, const char *a2, ...)
{
  return _[a1 reverseObjectEnumerator];
}

id objc_msgSend_revokeCurrentBannersForDismissMenuRequest(void *a1, const char *a2, ...)
{
  return _[a1 revokeCurrentBannersForDismissMenuRequest];
}

id objc_msgSend_revokeCurrentBannersForMenuModeInteractive(void *a1, const char *a2, ...)
{
  return _[a1 revokeCurrentBannersForMenuModeInteractive];
}

id objc_msgSend_revokePresentablesWithIdentification_reason_animated_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "revokePresentablesWithIdentification:reason:animated:error:");
}

id objc_msgSend_revokePresentablesWithIdentification_reason_options_animated_userInfo_error_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "revokePresentablesWithIdentification:reason:options:animated:userInfo:error:");
}

id objc_msgSend_revokePresentablesWithIdentification_reason_options_userInfo_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "revokePresentablesWithIdentification:reason:options:userInfo:error:");
}

id objc_msgSend_rightAnchor(void *a1, const char *a2, ...)
{
  return _[a1 rightAnchor];
}

id objc_msgSend_rightPercentage(void *a1, const char *a2, ...)
{
  return _[a1 rightPercentage];
}

id objc_msgSend_role(void *a1, const char *a2, ...)
{
  return _[a1 role];
}

id objc_msgSend_rootLayer(void *a1, const char *a2, ...)
{
  return _[a1 rootLayer];
}

id objc_msgSend_rootViewController(void *a1, const char *a2, ...)
{
  return _[a1 rootViewController];
}

id objc_msgSend_route(void *a1, const char *a2, ...)
{
  return _[a1 route];
}

id objc_msgSend_routeController(void *a1, const char *a2, ...)
{
  return _[a1 routeController];
}

id objc_msgSend_routeName(void *a1, const char *a2, ...)
{
  return _[a1 routeName];
}

id objc_msgSend_routeSubtype(void *a1, const char *a2, ...)
{
  return _[a1 routeSubtype];
}

id objc_msgSend_routeType(void *a1, const char *a2, ...)
{
  return _[a1 routeType];
}

id objc_msgSend_routeUID(void *a1, const char *a2, ...)
{
  return _[a1 routeUID];
}

id objc_msgSend_routesByIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 routesByIdentifier];
}

id objc_msgSend_routingController(void *a1, const char *a2, ...)
{
  return _[a1 routingController];
}

id objc_msgSend_row(void *a1, const char *a2, ...)
{
  return _[a1 row];
}

id objc_msgSend_rowWithColumns_height_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rowWithColumns:height:");
}

id objc_msgSend_rowWithColumns_height_columnWidths_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rowWithColumns:height:columnWidths:");
}

id objc_msgSend_rowWithIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rowWithIdentifier:");
}

id objc_msgSend_rowWithIdentifier_height_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rowWithIdentifier:height:");
}

id objc_msgSend_rowWithIdentifier_height_contentInsets_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rowWithIdentifier:height:contentInsets:");
}

id objc_msgSend_rowWithIdentifiers_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rowWithIdentifiers:");
}

id objc_msgSend_rowWithIdentifiers_height_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rowWithIdentifiers:height:");
}

id objc_msgSend_rowsForIdentifiers_height_columnCount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rowsForIdentifiers:height:columnCount:");
}

id objc_msgSend_rowsForIdentifiers_height_columnCount_contentInsets_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rowsForIdentifiers:height:columnCount:contentInsets:");
}

id objc_msgSend_rowsWithMenuOptions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rowsWithMenuOptions:");
}

id objc_msgSend_safeAreaLayoutGuide(void *a1, const char *a2, ...)
{
  return _[a1 safeAreaLayoutGuide];
}

id objc_msgSend_sampleBufferRenderer(void *a1, const char *a2, ...)
{
  return _[a1 sampleBufferRenderer];
}

id objc_msgSend_samplingRefreshRate(void *a1, const char *a2, ...)
{
  return _[a1 samplingRefreshRate];
}

id objc_msgSend_satisfyMilestone_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "satisfyMilestone:");
}

id objc_msgSend_saveConfiguration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "saveConfiguration:");
}

id objc_msgSend_saveConfiguration_withCompletionQueue_handler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "saveConfiguration:withCompletionQueue:handler:");
}

id objc_msgSend_scale(void *a1, const char *a2, ...)
{
  return _[a1 scale];
}

id objc_msgSend_scaledUINotificationToken(void *a1, const char *a2, ...)
{
  return _[a1 scaledUINotificationToken];
}

id objc_msgSend_scene(void *a1, const char *a2, ...)
{
  return _[a1 scene];
}

id objc_msgSend_scenesByIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 scenesByIdentifier];
}

id objc_msgSend_scheduleSleepWithRequest_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "scheduleSleepWithRequest:completion:");
}

id objc_msgSend_scheduledTimerWithTimeInterval_repeats_block_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "scheduledTimerWithTimeInterval:repeats:block:");
}

id objc_msgSend_screenRecordingActive(void *a1, const char *a2, ...)
{
  return _[a1 screenRecordingActive];
}

id objc_msgSend_searchBar(void *a1, const char *a2, ...)
{
  return _[a1 searchBar];
}

id objc_msgSend_searchField(void *a1, const char *a2, ...)
{
  return _[a1 searchField];
}

id objc_msgSend_secondaryFont(void *a1, const char *a2, ...)
{
  return _[a1 secondaryFont];
}

id objc_msgSend_secondaryItem(void *a1, const char *a2, ...)
{
  return _[a1 secondaryItem];
}

id objc_msgSend_secondaryLabelColor(void *a1, const char *a2, ...)
{
  return _[a1 secondaryLabelColor];
}

id objc_msgSend_secondaryOutputDeviceRoute(void *a1, const char *a2, ...)
{
  return _[a1 secondaryOutputDeviceRoute];
}

id objc_msgSend_secondaryRoute(void *a1, const char *a2, ...)
{
  return _[a1 secondaryRoute];
}

id objc_msgSend_secondaryTemplateItemProvider(void *a1, const char *a2, ...)
{
  return _[a1 secondaryTemplateItemProvider];
}

id objc_msgSend_seekToTime_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "seekToTime:");
}

id objc_msgSend_selectAudioRoutes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "selectAudioRoutes:");
}

id objc_msgSend_selectOneShotFraming(void *a1, const char *a2, ...)
{
  return _[a1 selectOneShotFraming];
}

id objc_msgSend_selectUltraWideLensButton(void *a1, const char *a2, ...)
{
  return _[a1 selectUltraWideLensButton];
}

id objc_msgSend_selectWideLensButton(void *a1, const char *a2, ...)
{
  return _[a1 selectWideLensButton];
}

id objc_msgSend_selectedMenuItemBackgroundColor(void *a1, const char *a2, ...)
{
  return _[a1 selectedMenuItemBackgroundColor];
}

id objc_msgSend_selectedMenuItemTextColor(void *a1, const char *a2, ...)
{
  return _[a1 selectedMenuItemTextColor];
}

id objc_msgSend_selectedOutputDevices(void *a1, const char *a2, ...)
{
  return _[a1 selectedOutputDevices];
}

id objc_msgSend_selectedPressesEvent(void *a1, const char *a2, ...)
{
  return _[a1 selectedPressesEvent];
}

id objc_msgSend_selectedUserProfile(void *a1, const char *a2, ...)
{
  return _[a1 selectedUserProfile];
}

id objc_msgSend_selectionState(void *a1, const char *a2, ...)
{
  return _[a1 selectionState];
}

id objc_msgSend_semanticContentAttribute(void *a1, const char *a2, ...)
{
  return _[a1 semanticContentAttribute];
}

id objc_msgSend_sendActionWithExternalGesture_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendActionWithExternalGesture:");
}

id objc_msgSend_sendActions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendActions:");
}

id objc_msgSend_sendActionsForControlEvents_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendActionsForControlEvents:");
}

id objc_msgSend_sendNextTrack(void *a1, const char *a2, ...)
{
  return _[a1 sendNextTrack];
}

id objc_msgSend_sendPause(void *a1, const char *a2, ...)
{
  return _[a1 sendPause];
}

id objc_msgSend_sendPlay(void *a1, const char *a2, ...)
{
  return _[a1 sendPlay];
}

id objc_msgSend_sendPreviousTrack(void *a1, const char *a2, ...)
{
  return _[a1 sendPreviousTrack];
}

id objc_msgSend_sendResponse_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendResponse:");
}

id objc_msgSend_sendSkipBackward(void *a1, const char *a2, ...)
{
  return _[a1 sendSkipBackward];
}

id objc_msgSend_sendSkipForward(void *a1, const char *a2, ...)
{
  return _[a1 sendSkipForward];
}

id objc_msgSend_sendStop(void *a1, const char *a2, ...)
{
  return _[a1 sendStop];
}

id objc_msgSend_sendSubviewToBack_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendSubviewToBack:");
}

id objc_msgSend_sensorActivityController(void *a1, const char *a2, ...)
{
  return _[a1 sensorActivityController];
}

id objc_msgSend_sensorActivityControllerDidUpdate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sensorActivityControllerDidUpdate:");
}

id objc_msgSend_sensorProvider(void *a1, const char *a2, ...)
{
  return _[a1 sensorProvider];
}

id objc_msgSend_sensorType(void *a1, const char *a2, ...)
{
  return _[a1 sensorType];
}

id objc_msgSend_separatorHeight(void *a1, const char *a2, ...)
{
  return _[a1 separatorHeight];
}

id objc_msgSend_separatorWithIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "separatorWithIdentifier:");
}

id objc_msgSend_separatorWithIdentifier_contentInsets_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "separatorWithIdentifier:contentInsets:");
}

id objc_msgSend_serviceIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 serviceIdentifier];
}

id objc_msgSend_serviceWithDefaultShellEndpoint(void *a1, const char *a2, ...)
{
  return _[a1 serviceWithDefaultShellEndpoint];
}

id objc_msgSend_session(void *a1, const char *a2, ...)
{
  return _[a1 session];
}

id objc_msgSend_sessionClient(void *a1, const char *a2, ...)
{
  return _[a1 sessionClient];
}

id objc_msgSend_sessionStatus(void *a1, const char *a2, ...)
{
  return _[a1 sessionStatus];
}

id objc_msgSend_set(void *a1, const char *a2, ...)
{
  return _[a1 set];
}

id objc_msgSend_setAccessibilityIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAccessibilityIdentifier:");
}

id objc_msgSend_setActionAtItemEnd_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setActionAtItemEnd:");
}

id objc_msgSend_setActivationIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setActivationIdentifier:");
}

id objc_msgSend_setActive_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setActive:");
}

id objc_msgSend_setActiveBulletin_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setActiveBulletin:");
}

id objc_msgSend_setActiveConfiguration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setActiveConfiguration:");
}

id objc_msgSend_setActiveMenuItem_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setActiveMenuItem:");
}

id objc_msgSend_setActiveMenuItem_presentationReason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setActiveMenuItem:presentationReason:");
}

id objc_msgSend_setActiveMenuItem_presentationReason_focusHeading_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setActiveMenuItem:presentationReason:focusHeading:");
}

id objc_msgSend_setActiveMenuItem_presentationReason_focusHeading_orthogonalNavigation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setActiveMenuItem:presentationReason:focusHeading:orthogonalNavigation:");
}

id objc_msgSend_setActiveMultilinePrefix_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setActiveMultilinePrefix:");
}

id objc_msgSend_setActivePresentable_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setActivePresentable:");
}

id objc_msgSend_setAdjustsFontSizeToFitWidth_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAdjustsFontSizeToFitWidth:");
}

id objc_msgSend_setAffineTransform_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAffineTransform:");
}

id objc_msgSend_setAirPlayRenderer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAirPlayRenderer:");
}

id objc_msgSend_setAlignment_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAlignment:");
}

id objc_msgSend_setAllowAnimatedUpdates_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAllowAnimatedUpdates:");
}

id objc_msgSend_setAllowedPressTypes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAllowedPressTypes:");
}

id objc_msgSend_setAllowedUnits_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAllowedUnits:");
}

id objc_msgSend_setAllowsEdgeAntialiasing_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAllowsEdgeAntialiasing:");
}

id objc_msgSend_setAllowsGroupBlending_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAllowsGroupBlending:");
}

id objc_msgSend_setAlpha_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAlpha:");
}

id objc_msgSend_setAmplitudes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAmplitudes:");
}

id objc_msgSend_setAnimationContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAnimationContext:");
}

id objc_msgSend_setAnimationDuration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAnimationDuration:");
}

id objc_msgSend_setAnimationRemainingTime_totalTime_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAnimationRemainingTime:totalTime:");
}

id objc_msgSend_setArtworkContentMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setArtworkContentMode:");
}

id objc_msgSend_setAttachments_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAttachments:");
}

id objc_msgSend_setAttentionLostTimeout_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAttentionLostTimeout:");
}

id objc_msgSend_setAttributedSubtitle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAttributedSubtitle:");
}

id objc_msgSend_setAttributedText_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAttributedText:");
}

id objc_msgSend_setAttributedTitle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAttributedTitle:");
}

id objc_msgSend_setAttributes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAttributes:");
}

id objc_msgSend_setAudiovisualBackgroundPlaybackPolicy_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAudiovisualBackgroundPlaybackPolicy:");
}

id objc_msgSend_setAutomaticallyWaitsToMinimizeStalling_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAutomaticallyWaitsToMinimizeStalling:");
}

id objc_msgSend_setAutoresizingMask_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAutoresizingMask:");
}

id objc_msgSend_setAvPlayer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAvPlayer:");
}

id objc_msgSend_setAvailableScheduledSleepRequests_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAvailableScheduledSleepRequests:");
}

id objc_msgSend_setAxis_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAxis:");
}

id objc_msgSend_setBackgroundBarColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBackgroundBarColor:");
}

id objc_msgSend_setBackgroundCircleLayer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBackgroundCircleLayer:");
}

id objc_msgSend_setBackgroundColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBackgroundColor:");
}

id objc_msgSend_setBackgroundColor_forState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBackgroundColor:forState:");
}

id objc_msgSend_setBackgroundVisualEffect_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBackgroundVisualEffect:");
}

id objc_msgSend_setBackingStore_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBackingStore:");
}

id objc_msgSend_setBadgeOffset_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBadgeOffset:");
}

id objc_msgSend_setBadgeSize_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBadgeSize:");
}

id objc_msgSend_setBadgeStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBadgeStyle:");
}

id objc_msgSend_setBadgeText_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBadgeText:");
}

id objc_msgSend_setBannerContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBannerContext:");
}

id objc_msgSend_setBarColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBarColor:");
}

id objc_msgSend_setBarWidth_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBarWidth:");
}

id objc_msgSend_setBaselineAdjustment_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBaselineAdjustment:");
}

id objc_msgSend_setBatteryState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBatteryState:");
}

id objc_msgSend_setBeginTime_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBeginTime:");
}

id objc_msgSend_setBluetoothAudioFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBluetoothAudioFormat:");
}

id objc_msgSend_setBool_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBool:forKey:");
}

id objc_msgSend_setBorderColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBorderColor:");
}

id objc_msgSend_setBorderWidth_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBorderWidth:");
}

id objc_msgSend_setBounds_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBounds:");
}

id objc_msgSend_setButtonSize_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setButtonSize:");
}

id objc_msgSend_setCacheIdentifier_forCacheReference_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCacheIdentifier:forCacheReference:");
}

id objc_msgSend_setCacheLimit_forCacheIdentifier_cacheReference_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCacheLimit:forCacheIdentifier:cacheReference:");
}

id objc_msgSend_setCachedPlatterState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCachedPlatterState:");
}

id objc_msgSend_setCallsStateChangeHandlerSynchronously_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCallsStateChangeHandlerSynchronously:");
}

id objc_msgSend_setCameraAppInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCameraAppInfo:");
}

id objc_msgSend_setCameraContentMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCameraContentMode:");
}

id objc_msgSend_setCameraCornerRadius_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCameraCornerRadius:");
}

id objc_msgSend_setCameraIdentifiers_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCameraIdentifiers:");
}

id objc_msgSend_setCameraInUse_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCameraInUse:");
}

id objc_msgSend_setCameraIndicatorPixelShifter_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCameraIndicatorPixelShifter:");
}

id objc_msgSend_setCameraItems_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCameraItems:");
}

id objc_msgSend_setCameraProfile_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCameraProfile:");
}

id objc_msgSend_setCameraView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCameraView:");
}

id objc_msgSend_setCameraViewFour_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCameraViewFour:");
}

id objc_msgSend_setCameraViewOne_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCameraViewOne:");
}

id objc_msgSend_setCameraViewThree_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCameraViewThree:");
}

id objc_msgSend_setCameraViewTwo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCameraViewTwo:");
}

id objc_msgSend_setCamerasByIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCamerasByIdentifier:");
}

id objc_msgSend_setCaptureGroup_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCaptureGroup:");
}

id objc_msgSend_setCenter_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCenter:");
}

id objc_msgSend_setCentered_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCentered:");
}

id objc_msgSend_setChangedQueue_andHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setChangedQueue:andHandler:");
}

id objc_msgSend_setClearPreferredFocusedIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setClearPreferredFocusedIdentifier:");
}

id objc_msgSend_setClientContainerViewControllerClass_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setClientContainerViewControllerClass:");
}

id objc_msgSend_setClipsToBounds_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setClipsToBounds:");
}

id objc_msgSend_setColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setColor:");
}

id objc_msgSend_setColors_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setColors:");
}

id objc_msgSend_setCompletionBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCompletionBlock:");
}

id objc_msgSend_setCompositingFilter_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCompositingFilter:");
}

id objc_msgSend_setConfiguration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setConfiguration:");
}

id objc_msgSend_setConfigurations_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setConfigurations:");
}

id objc_msgSend_setConnectionStatus_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setConnectionStatus:");
}

id objc_msgSend_setConstant_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setConstant:");
}

id objc_msgSend_setContainsFocusedButton_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContainsFocusedButton:");
}

id objc_msgSend_setContent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContent:");
}

id objc_msgSend_setContentCompressionResistancePriority_forAxis_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContentCompressionResistancePriority:forAxis:");
}

id objc_msgSend_setContentHuggingPriority_forAxis_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContentHuggingPriority:forAxis:");
}

id objc_msgSend_setContentImage1_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContentImage1:");
}

id objc_msgSend_setContentInset_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContentInset:");
}

id objc_msgSend_setContentInsetAdjustmentBehavior_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContentInsetAdjustmentBehavior:");
}

id objc_msgSend_setContentInsets_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContentInsets:");
}

id objc_msgSend_setContentIsDisabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContentIsDisabled:");
}

id objc_msgSend_setContentLayoutMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContentLayoutMode:");
}

id objc_msgSend_setContentMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContentMode:");
}

id objc_msgSend_setContentMotionRotation_translation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContentMotionRotation:translation:");
}

id objc_msgSend_setContentOffset_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContentOffset:");
}

id objc_msgSend_setContentSize_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContentSize:");
}

id objc_msgSend_setContentStylingHidden_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContentStylingHidden:");
}

id objc_msgSend_setContentText1_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContentText1:");
}

id objc_msgSend_setContentText2_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContentText2:");
}

id objc_msgSend_setContentText3_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContentText3:");
}

id objc_msgSend_setContentView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContentView:");
}

id objc_msgSend_setContentView_withTransition_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContentView:withTransition:");
}

id objc_msgSend_setContentViewDestinationFrame_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContentViewDestinationFrame:");
}

id objc_msgSend_setContentViewOriginatingFrame_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContentViewOriginatingFrame:");
}

id objc_msgSend_setContinuityCaptureDevice_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContinuityCaptureDevice:");
}

id objc_msgSend_setContinuous_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContinuous:");
}

id objc_msgSend_setContinuousCornerEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContinuousCornerEnabled:");
}

id objc_msgSend_setContributorDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContributorDelegate:");
}

id objc_msgSend_setControlMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setControlMode:");
}

id objc_msgSend_setControlState_animated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setControlState:animated:");
}

id objc_msgSend_setControlState_withAnimationCoordinator_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setControlState:withAnimationCoordinator:");
}

id objc_msgSend_setConversationDetectEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setConversationDetectEnabled:");
}

id objc_msgSend_setCornerCurve_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCornerCurve:");
}

id objc_msgSend_setCornerRadius_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCornerRadius:");
}

id objc_msgSend_setCountdownCircleLayer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCountdownCircleLayer:");
}

id objc_msgSend_setCountdownView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCountdownView:");
}

id objc_msgSend_setCounter_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCounter:");
}

id objc_msgSend_setCriticalInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCriticalInfo:");
}

id objc_msgSend_setCurrentBannerPresentable_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCurrentBannerPresentable:");
}

id objc_msgSend_setCurrentInputMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCurrentInputMode:");
}

id objc_msgSend_setCurrentRunningAnimationContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCurrentRunningAnimationContext:");
}

id objc_msgSend_setCurrentScheduledSleep_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCurrentScheduledSleep:");
}

id objc_msgSend_setCurrentTintColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCurrentTintColor:");
}

id objc_msgSend_setCurrentWiFiNetwork_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCurrentWiFiNetwork:");
}

id objc_msgSend_setCycleImageArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCycleImageArray:");
}

id objc_msgSend_setCycleImageTimer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCycleImageTimer:");
}

id objc_msgSend_setCycleImageView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCycleImageView:");
}

id objc_msgSend_setCycleNextIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCycleNextIndex:");
}

id objc_msgSend_setDamping_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDamping:");
}

id objc_msgSend_setDataSource_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDataSource:");
}

id objc_msgSend_setDataSource_animator_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDataSource:animator:");
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDelegate:");
}

id objc_msgSend_setDelegate_onQueue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDelegate:onQueue:");
}

id objc_msgSend_setDeviceFoundHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDeviceFoundHandler:");
}

id objc_msgSend_setDeviceLostHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDeviceLostHandler:");
}

id objc_msgSend_setDictating_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDictating:");
}

id objc_msgSend_setDictationDeviceIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDictationDeviceIdentifier:");
}

id objc_msgSend_setDictationOverlayVisibility_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDictationOverlayVisibility:");
}

id objc_msgSend_setDidPerformShareAudio_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDidPerformShareAudio:");
}

id objc_msgSend_setDimCheckmark_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDimCheckmark:");
}

id objc_msgSend_setDirectionalLockEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDirectionalLockEnabled:");
}

id objc_msgSend_setDiscoverabilityTitle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDiscoverabilityTitle:");
}

id objc_msgSend_setDiscoveryFlags_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDiscoveryFlags:");
}

id objc_msgSend_setDismissalDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDismissalDelegate:");
}

id objc_msgSend_setDisplayAsOff_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDisplayAsOff:");
}

id objc_msgSend_setDisplayLocation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDisplayLocation:");
}

id objc_msgSend_setDisplayName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDisplayName:");
}

id objc_msgSend_setDisplayNameFont_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDisplayNameFont:");
}

id objc_msgSend_setDisplayNameOffset_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDisplayNameOffset:");
}

id objc_msgSend_setDisplayNameTextColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDisplayNameTextColor:");
}

id objc_msgSend_setDistribution_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDistribution:");
}

id objc_msgSend_setDoNotDisturbEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDoNotDisturbEnabled:");
}

id objc_msgSend_setDuration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDuration:");
}

id objc_msgSend_setEnableExtendedAttributes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEnableExtendedAttributes:");
}

id objc_msgSend_setEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEnabled:");
}

id objc_msgSend_setEnabled_forExternalGesture_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEnabled:forExternalGesture:");
}

id objc_msgSend_setEnablesMarqueeWhenAncestorFocused_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEnablesMarqueeWhenAncestorFocused:");
}

id objc_msgSend_setEndPoint_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEndPoint:");
}

id objc_msgSend_setEndTime_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEndTime:");
}

id objc_msgSend_setEndpointRoute_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEndpointRoute:");
}

id objc_msgSend_setEventHandlerWithQueue_block_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEventHandlerWithQueue:block:");
}

id objc_msgSend_setEventMask_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEventMask:");
}

id objc_msgSend_setFaceTimeActive_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFaceTimeActive:");
}

id objc_msgSend_setFaceTimePlatterState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFaceTimePlatterState:");
}

id objc_msgSend_setFallbackImage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFallbackImage:");
}

id objc_msgSend_setFallbackImageView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFallbackImageView:");
}

id objc_msgSend_setFamilyName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFamilyName:");
}

id objc_msgSend_setFill(void *a1, const char *a2, ...)
{
  return _[a1 setFill];
}

id objc_msgSend_setFillColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFillColor:");
}

id objc_msgSend_setFilter_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFilter:");
}

id objc_msgSend_setFittingSize_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFittingSize:");
}

id objc_msgSend_setFocusActivationTimer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFocusActivationTimer:");
}

id objc_msgSend_setFocusAnimationConfiguration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFocusAnimationConfiguration:");
}

id objc_msgSend_setFocusSizeIncrease_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFocusSizeIncrease:");
}

id objc_msgSend_setFocused_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFocused:");
}

id objc_msgSend_setFocusedApp_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFocusedApp:");
}

id objc_msgSend_setFocusedAppIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFocusedAppIdentifier:");
}

id objc_msgSend_setFocusedRenderer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFocusedRenderer:");
}

id objc_msgSend_setFocusedSizeIncrease_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFocusedSizeIncrease:");
}

id objc_msgSend_setFont_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFont:");
}

id objc_msgSend_setFooter_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFooter:");
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

id objc_msgSend_setFullScreenCameraPresenterViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFullScreenCameraPresenterViewController:");
}

id objc_msgSend_setFullScreenContainer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFullScreenContainer:");
}

id objc_msgSend_setGeneratesDecimalNumbers_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setGeneratesDecimalNumbers:");
}

id objc_msgSend_setGeometryFlipped_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setGeometryFlipped:");
}

id objc_msgSend_setGivenName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setGivenName:");
}

id objc_msgSend_setHasFocusedRendererOtherThanCriticalInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHasFocusedRendererOtherThanCriticalInfo:");
}

id objc_msgSend_setHasIndicatorForMenuBar_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHasIndicatorForMenuBar:");
}

id objc_msgSend_setHasUserAttention_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHasUserAttention:");
}

id objc_msgSend_setHeadTrackingEnabled_forBundleID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHeadTrackingEnabled:forBundleID:");
}

id objc_msgSend_setHeadboardRequestedVisibility_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHeadboardRequestedVisibility:");
}

id objc_msgSend_setHeadphonesController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHeadphonesController:");
}

id objc_msgSend_setHfIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHfIdentifier:");
}

id objc_msgSend_setHidden_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHidden:");
}

id objc_msgSend_setHighContrastFocusIndicatorCornerRadius_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHighContrastFocusIndicatorCornerRadius:");
}

id objc_msgSend_setHighContrastFocusIndicatorOutset_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHighContrastFocusIndicatorOutset:");
}

id objc_msgSend_setHighlighted_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHighlighted:");
}

id objc_msgSend_setHorizontalSeparatorView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHorizontalSeparatorView:");
}

id objc_msgSend_setHostedViewController_focusHeading_orthogonalNavigation_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHostedViewController:focusHeading:orthogonalNavigation:completion:");
}

id objc_msgSend_setIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIdentifier:");
}

id objc_msgSend_setImage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setImage:");
}

id objc_msgSend_setImageContainerView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setImageContainerView:");
}

id objc_msgSend_setImageUpdatedHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setImageUpdatedHandler:");
}

id objc_msgSend_setIncomingCallInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIncomingCallInfo:");
}

id objc_msgSend_setIncomingSnowglobeImage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIncomingSnowglobeImage:");
}

id objc_msgSend_setIndeterminateMaxProgress_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIndeterminateMaxProgress:");
}

id objc_msgSend_setIndicatorColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIndicatorColor:");
}

id objc_msgSend_setIndicatorShape_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIndicatorShape:");
}

id objc_msgSend_setInitialVelocity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInitialVelocity:");
}

id objc_msgSend_setInsetsLayoutMarginsFromSafeArea_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInsetsLayoutMarginsFromSafeArea:");
}

id objc_msgSend_setInteractionRequestReason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInteractionRequestReason:");
}

id objc_msgSend_setInteractivePresentationReason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInteractivePresentationReason:");
}

id objc_msgSend_setIsDisabled_animator_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsDisabled:animator:");
}

id objc_msgSend_setIsFocused_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsFocused:");
}

id objc_msgSend_setIsSendingVideo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsSendingVideo:");
}

id objc_msgSend_setIsUserInitiated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsUserInitiated:");
}

id objc_msgSend_setItems_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setItems:");
}

id objc_msgSend_setKeyboardFocusedElement_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setKeyboardFocusedElement:");
}

id objc_msgSend_setLatestError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLatestError:");
}

id objc_msgSend_setLayoutGuide_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLayoutGuide:");
}

id objc_msgSend_setLayoutResult_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLayoutResult:");
}

id objc_msgSend_setLeadingImage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLeadingImage:");
}

id objc_msgSend_setLeadingViewSizes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLeadingViewSizes:");
}

id objc_msgSend_setLineBreakMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLineBreakMode:");
}

id objc_msgSend_setLineCap_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLineCap:");
}

id objc_msgSend_setLineWidth_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLineWidth:");
}

id objc_msgSend_setLingeringTimer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLingeringTimer:");
}

id objc_msgSend_setListeningMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setListeningMode:");
}

id objc_msgSend_setLocationInUse_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLocationInUse:");
}

id objc_msgSend_setLocations_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLocations:");
}

id objc_msgSend_setLogObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLogObject:");
}

id objc_msgSend_setMainLayer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMainLayer:");
}

id objc_msgSend_setManualFramingControlsHidden_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setManualFramingControlsHidden:");
}

id objc_msgSend_setManuallyFraming_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setManuallyFraming:");
}

id objc_msgSend_setMask_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMask:");
}

id objc_msgSend_setMaskOutsets_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMaskOutsets:");
}

id objc_msgSend_setMaskView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMaskView:");
}

id objc_msgSend_setMasksToBounds_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMasksToBounds:");
}

id objc_msgSend_setMass_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMass:");
}

id objc_msgSend_setMaximumFractionDigits_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMaximumFractionDigits:");
}

id objc_msgSend_setMaximumValue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMaximumValue:");
}

id objc_msgSend_setMediaPlayerView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMediaPlayerView:");
}

id objc_msgSend_setMenuItem_presentationContext_focusHeading_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMenuItem:presentationContext:focusHeading:");
}

id objc_msgSend_setMenuItem_presentationContext_focusHeading_orthogonalNavigation_completion_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMenuItem:presentationContext:focusHeading:orthogonalNavigation:completion:");
}

id objc_msgSend_setMenuMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMenuMode:");
}

id objc_msgSend_setMenuModeController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMenuModeController:");
}

id objc_msgSend_setMicAppInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMicAppInfo:");
}

id objc_msgSend_setMicInUse_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMicInUse:");
}

id objc_msgSend_setMicModes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMicModes:");
}

id objc_msgSend_setMicrophoneIndicatorPixelShifter_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMicrophoneIndicatorPixelShifter:");
}

id objc_msgSend_setMinimumFractionDigits_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMinimumFractionDigits:");
}

id objc_msgSend_setMinimumIntegerDigits_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMinimumIntegerDigits:");
}

id objc_msgSend_setMinimumValue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMinimumValue:");
}

id objc_msgSend_setModalPresentationStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setModalPresentationStyle:");
}

id objc_msgSend_setMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMode:");
}

id objc_msgSend_setMode_animator_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMode:animator:");
}

id objc_msgSend_setMonogramDiameter_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMonogramDiameter:");
}

id objc_msgSend_setMosaicView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMosaicView:");
}

id objc_msgSend_setMoviePath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMoviePath:");
}

id objc_msgSend_setMuted_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMuted:");
}

id objc_msgSend_setName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setName:");
}

id objc_msgSend_setNeConfiguration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNeConfiguration:");
}

id objc_msgSend_setNeedsDisplay(void *a1, const char *a2, ...)
{
  return _[a1 setNeedsDisplay];
}

id objc_msgSend_setNeedsFocusUpdate(void *a1, const char *a2, ...)
{
  return _[a1 setNeedsFocusUpdate];
}

id objc_msgSend_setNeedsLayout(void *a1, const char *a2, ...)
{
  return _[a1 setNeedsLayout];
}

id objc_msgSend_setNeedsUserInteractivePriority_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNeedsUserInteractivePriority:");
}

id objc_msgSend_setNonHighPrioritySuspended_level_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNonHighPrioritySuspended:level:");
}

id objc_msgSend_setNowPlayingPID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNowPlayingPID:");
}

id objc_msgSend_setNumberOfValuesToKeep_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNumberOfValuesToKeep:");
}

id objc_msgSend_setNumberStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNumberStyle:");
}

id objc_msgSend_setObject_atIndexedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObject:atIndexedSubscript:");
}

id objc_msgSend_setObject_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObject:forKey:");
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObject:forKeyedSubscript:");
}

id objc_msgSend_setObject_forTrait_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObject:forTrait:");
}

id objc_msgSend_setOnBatteryStateChange_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setOnBatteryStateChange:");
}

id objc_msgSend_setOnCameraAppChange_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setOnCameraAppChange:");
}

id objc_msgSend_setOnContinuityCameraConnectionChange_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setOnContinuityCameraConnectionChange:");
}

id objc_msgSend_setOnLensChange_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setOnLensChange:");
}

id objc_msgSend_setOnMicAppChange_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setOnMicAppChange:");
}

id objc_msgSend_setOnMicModeEnabledChange_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setOnMicModeEnabledChange:");
}

id objc_msgSend_setOnMicModeSupportChange_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setOnMicModeSupportChange:");
}

id objc_msgSend_setOnSampleBufferChange_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setOnSampleBufferChange:");
}

id objc_msgSend_setOnShouldTransformChange_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setOnShouldTransformChange:");
}

id objc_msgSend_setOnVideoEffectsControlModeChange_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setOnVideoEffectsControlModeChange:");
}

id objc_msgSend_setOnVideoEffectsEnabledChange_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setOnVideoEffectsEnabledChange:");
}

id objc_msgSend_setOnVideoEffectsSupportChange_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setOnVideoEffectsSupportChange:");
}

id objc_msgSend_setOnZoomFactorChange_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setOnZoomFactorChange:");
}

id objc_msgSend_setOpacity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setOpacity:");
}

id objc_msgSend_setOpaque_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setOpaque:");
}

id objc_msgSend_setOrderedCameraItems_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setOrderedCameraItems:");
}

id objc_msgSend_setOrthogonalNavigationDelegate_availableEdges_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setOrthogonalNavigationDelegate:availableEdges:");
}

id objc_msgSend_setOrthogonalNavigationFocusSinkView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setOrthogonalNavigationFocusSinkView:");
}

id objc_msgSend_setOutlineLineWidth_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setOutlineLineWidth:");
}

id objc_msgSend_setOverrideColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setOverrideColor:");
}

id objc_msgSend_setPackage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPackage:");
}

id objc_msgSend_setPackageName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPackageName:");
}

id objc_msgSend_setPackageState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPackageState:");
}

id objc_msgSend_setPackageView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPackageView:");
}

id objc_msgSend_setPaddingInsets_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPaddingInsets:");
}

id objc_msgSend_setPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPath:");
}

id objc_msgSend_setPenderIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPenderIdentifier:");
}

id objc_msgSend_setPercentComplete_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPercentComplete:");
}

id objc_msgSend_setPermittedArrowDirections_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPermittedArrowDirections:");
}

id objc_msgSend_setPersonNameComponents_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPersonNameComponents:");
}

id objc_msgSend_setPillViewTrailingConstraint_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPillViewTrailingConstraint:");
}

id objc_msgSend_setPipActive_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPipActive:");
}

id objc_msgSend_setPlaceholder_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPlaceholder:");
}

id objc_msgSend_setPlatterArtworkImage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPlatterArtworkImage:");
}

id objc_msgSend_setPlatterSize_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPlatterSize:");
}

id objc_msgSend_setPlaybackControlsState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPlaybackControlsState:");
}

id objc_msgSend_setPlayer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPlayer:");
}

id objc_msgSend_setPlaying_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPlaying:");
}

id objc_msgSend_setPlayingItemProperties_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPlayingItemProperties:");
}

id objc_msgSend_setPreferredFocusEnvironments_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPreferredFocusEnvironments:");
}

id objc_msgSend_setPreferredFramesPerSecond_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPreferredFramesPerSecond:");
}

id objc_msgSend_setPreferredSymbolConfiguration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPreferredSymbolConfiguration:");
}

id objc_msgSend_setPresentableUserInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPresentableUserInfo:");
}

id objc_msgSend_setPresenting_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPresenting:");
}

id objc_msgSend_setPresentingViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPresentingViewController:");
}

id objc_msgSend_setPreservesSuperviewLayoutMargins_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPreservesSuperviewLayoutMargins:");
}

id objc_msgSend_setPreviousBannerContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPreviousBannerContext:");
}

id objc_msgSend_setPreviousMenuMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPreviousMenuMode:");
}

id objc_msgSend_setPrimaryRoute_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPrimaryRoute:");
}

id objc_msgSend_setPriority_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPriority:");
}

id objc_msgSend_setPrivacyController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPrivacyController:");
}

id objc_msgSend_setPrivacyState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPrivacyState:");
}

id objc_msgSend_setProfilePictureImage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setProfilePictureImage:");
}

id objc_msgSend_setProgress_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setProgress:");
}

id objc_msgSend_setProgress_animated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setProgress:animated:");
}

id objc_msgSend_setProgressHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setProgressHandler:");
}

id objc_msgSend_setProgressLineWidth_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setProgressLineWidth:");
}

id objc_msgSend_setProgressView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setProgressView:");
}

id objc_msgSend_setRasterizationScale_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRasterizationScale:");
}

id objc_msgSend_setReason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setReason:");
}

id objc_msgSend_setRelay_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRelay:");
}

id objc_msgSend_setRemainingTime_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRemainingTime:");
}

id objc_msgSend_setRemoteDeviceSelections_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRemoteDeviceSelections:");
}

id objc_msgSend_setRemoteRoute_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRemoteRoute:");
}

id objc_msgSend_setRemoteRouteSymbolName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRemoteRouteSymbolName:");
}

id objc_msgSend_setRemovedOnCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRemovedOnCompletion:");
}

id objc_msgSend_setRendererProvider_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRendererProvider:");
}

id objc_msgSend_setRequest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRequest:");
}

id objc_msgSend_setRequireIndicatorsOutsideMenuBar_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRequireIndicatorsOutsideMenuBar:");
}

id objc_msgSend_setRespondsToCurrentMediaItemDidChange_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRespondsToCurrentMediaItemDidChange:");
}

id objc_msgSend_setRespondsToDidChangeCurrentUser_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRespondsToDidChangeCurrentUser:");
}

id objc_msgSend_setRespondsToDidChangeImage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRespondsToDidChangeImage:");
}

id objc_msgSend_setRespondsToDidChangeOutputDevices_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRespondsToDidChangeOutputDevices:");
}

id objc_msgSend_setRespondsToDidChangePersonNameComponents_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRespondsToDidChangePersonNameComponents:");
}

id objc_msgSend_setRespondsToDidUpdate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRespondsToDidUpdate:");
}

id objc_msgSend_setRespondsToPlaybackRateDidChange_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRespondsToPlaybackRateDidChange:");
}

id objc_msgSend_setRespondsToPlaybackStateDidChange_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRespondsToPlaybackStateDidChange:");
}

id objc_msgSend_setRespondsToSyncTiming_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRespondsToSyncTiming:");
}

id objc_msgSend_setRootViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRootViewController:");
}

id objc_msgSend_setRoundingIncrement_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRoundingIncrement:");
}

id objc_msgSend_setRoundingMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRoundingMode:");
}

id objc_msgSend_setRoutesByIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRoutesByIdentifier:");
}

id objc_msgSend_setRowSpacing_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRowSpacing:");
}

id objc_msgSend_setSampleBufferDelegate_queue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSampleBufferDelegate:queue:");
}

id objc_msgSend_setScale_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setScale:");
}

id objc_msgSend_setScenesByIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setScenesByIdentifier:");
}

id objc_msgSend_setScheduledSleep_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setScheduledSleep:");
}

id objc_msgSend_setSearchBar_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSearchBar:");
}

id objc_msgSend_setSecond_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSecond:");
}

id objc_msgSend_setSecondaryRoute_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSecondaryRoute:");
}

id objc_msgSend_setSelected_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSelected:");
}

id objc_msgSend_setSelectionForItemWithIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSelectionForItemWithIdentifier:");
}

id objc_msgSend_setSemanticContentAttribute_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSemanticContentAttribute:");
}

id objc_msgSend_setSendingVideo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSendingVideo:");
}

id objc_msgSend_setSession_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSession:");
}

id objc_msgSend_setSessionClient_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSessionClient:");
}

id objc_msgSend_setSessionStatus_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSessionStatus:");
}

id objc_msgSend_setShadowColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShadowColor:");
}

id objc_msgSend_setShadowOffset_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShadowOffset:");
}

id objc_msgSend_setShadowOpacity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShadowOpacity:");
}

id objc_msgSend_setShadowPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShadowPath:");
}

id objc_msgSend_setShadowPathIsBounds_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShadowPathIsBounds:");
}

id objc_msgSend_setShadowRadius_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShadowRadius:");
}

id objc_msgSend_setShadowVerticalOffset_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShadowVerticalOffset:");
}

id objc_msgSend_setShape_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShape:");
}

id objc_msgSend_setShareAudioDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShareAudioDelegate:");
}

id objc_msgSend_setShouldAcceptEvents_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShouldAcceptEvents:");
}

id objc_msgSend_setShouldApplyTransform_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShouldApplyTransform:");
}

id objc_msgSend_setShouldCenterAlignShortText_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShouldCenterAlignShortText:");
}

id objc_msgSend_setShouldPerformSearchAction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShouldPerformSearchAction:");
}

id objc_msgSend_setShouldRasterize_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShouldRasterize:");
}

id objc_msgSend_setShouldStartStreamOnDisplay_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShouldStartStreamOnDisplay:");
}

id objc_msgSend_setShowsHighContrastFocusIndicator_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShowsHighContrastFocusIndicator:");
}

id objc_msgSend_setSiriPresentationVisibility_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSiriPresentationVisibility:");
}

id objc_msgSend_setSize_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSize:");
}

id objc_msgSend_setSleepRequestsByIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSleepRequestsByIdentifier:");
}

id objc_msgSend_setSleepTimerController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSleepTimerController:");
}

id objc_msgSend_setSnapshotTimer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSnapshotTimer:");
}

id objc_msgSend_setSourceItem_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSourceItem:");
}

id objc_msgSend_setSourceView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSourceView:");
}

id objc_msgSend_setSpacing_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSpacing:");
}

id objc_msgSend_setSpatialAudioMode_forBundleID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSpatialAudioMode:forBundleID:");
}

id objc_msgSend_setSpeed_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSpeed:");
}

id objc_msgSend_setSpinnerView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSpinnerView:");
}

id objc_msgSend_setSplitViewVisible_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSplitViewVisible:");
}

id objc_msgSend_setStartPoint_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setStartPoint:");
}

id objc_msgSend_setState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setState:");
}

id objc_msgSend_setState_animated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setState:animated:");
}

id objc_msgSend_setState_ofLayer_transitionSpeed_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setState:ofLayer:transitionSpeed:");
}

id objc_msgSend_setStateMachine_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setStateMachine:");
}

id objc_msgSend_setStateName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setStateName:");
}

id objc_msgSend_setStiffness_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setStiffness:");
}

id objc_msgSend_setStrokeColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setStrokeColor:");
}

id objc_msgSend_setStrokeEnd_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setStrokeEnd:");
}

id objc_msgSend_setStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setStyle:");
}

id objc_msgSend_setStylingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setStylingBlock:");
}

id objc_msgSend_setSubtitle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSubtitle:");
}

id objc_msgSend_setSubtype_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSubtype:");
}

id objc_msgSend_setSupported_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSupported:");
}

id objc_msgSend_setSuspended_forReason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSuspended:forReason:");
}

id objc_msgSend_setSuspended_forReason_revokingCurrent_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSuspended:forReason:revokingCurrent:error:");
}

id objc_msgSend_setSuspended_forRequesterWithIdentifier_reason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSuspended:forRequesterWithIdentifier:reason:");
}

id objc_msgSend_setSystemRecording_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSystemRecording:");
}

id objc_msgSend_setText_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setText:");
}

id objc_msgSend_setTextAlignment_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTextAlignment:");
}

id objc_msgSend_setTextColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTextColor:");
}

id objc_msgSend_setTimeInterval_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTimeInterval:");
}

id objc_msgSend_setTimeOffset_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTimeOffset:");
}

id objc_msgSend_setTimerSize_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTimerSize:");
}

id objc_msgSend_setTimingFunction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTimingFunction:");
}

id objc_msgSend_setTintColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTintColor:");
}

id objc_msgSend_setTitle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTitle:");
}

id objc_msgSend_setTitleBadge_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTitleBadge:");
}

id objc_msgSend_setTitleTextAttributesTransformer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTitleTextAttributesTransformer:");
}

id objc_msgSend_setToValue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setToValue:");
}

id objc_msgSend_setToastView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setToastView:");
}

id objc_msgSend_setTracklistRange_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTracklistRange:");
}

id objc_msgSend_setTransform_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTransform:");
}

id objc_msgSend_setTransitionEdgeLayoutGuideBottomConstraint_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTransitionEdgeLayoutGuideBottomConstraint:");
}

id objc_msgSend_setTransitionEdgeLayoutGuideLeadingConstraint_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTransitionEdgeLayoutGuideLeadingConstraint:");
}

id objc_msgSend_setTransitionEdgeLayoutGuideTopConstraint_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTransitionEdgeLayoutGuideTopConstraint:");
}

id objc_msgSend_setTransitionEdgeLayoutGuideTrailingConstraint_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTransitionEdgeLayoutGuideTrailingConstraint:");
}

id objc_msgSend_setTransitionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTransitionHandler:");
}

id objc_msgSend_setTransitioningDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTransitioningDelegate:");
}

id objc_msgSend_setTranslatesAutoresizingMaskIntoConstraints_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTranslatesAutoresizingMaskIntoConstraints:");
}

id objc_msgSend_setType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setType:");
}

id objc_msgSend_setUnavailable_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUnavailable:");
}

id objc_msgSend_setUpdateAutoLayoutForContentHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUpdateAutoLayoutForContentHandler:");
}

id objc_msgSend_setUplinkMuted_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUplinkMuted:");
}

id objc_msgSend_setUplinkMuted_bluetoothAudioFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUplinkMuted:bluetoothAudioFormat:");
}

id objc_msgSend_setUseShadowImage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUseShadowImage:");
}

id objc_msgSend_setUserInteractionEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUserInteractionEnabled:");
}

id objc_msgSend_setUsesGroupingSeparator_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUsesGroupingSeparator:");
}

id objc_msgSend_setUsesSignificantDigits_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUsesSignificantDigits:");
}

id objc_msgSend_setUsingWideForFraming_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUsingWideForFraming:");
}

id objc_msgSend_setValidPreviewBufferStream_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setValidPreviewBufferStream:");
}

id objc_msgSend_setValue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setValue:");
}

id objc_msgSend_setValue_animated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setValue:animated:");
}

id objc_msgSend_setValue_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setValue:forKey:");
}

id objc_msgSend_setValue_forKeyPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setValue:forKeyPath:");
}

id objc_msgSend_setVerticalSeparatorView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setVerticalSeparatorView:");
}

id objc_msgSend_setVideoEffects_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setVideoEffects:");
}

id objc_msgSend_setView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setView:");
}

id objc_msgSend_setVisibilityDidChangeHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setVisibilityDidChangeHandler:");
}

id objc_msgSend_setVisible_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setVisible:");
}

id objc_msgSend_setVisualContent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setVisualContent:");
}

id objc_msgSend_setVisualization_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setVisualization:");
}

id objc_msgSend_setVisualizedControlState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setVisualizedControlState:");
}

id objc_msgSend_setVolumeEligibleRouteIDs_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setVolumeEligibleRouteIDs:");
}

id objc_msgSend_setVolumeLevel_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setVolumeLevel:");
}

id objc_msgSend_setVpn_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setVpn:");
}

id objc_msgSend_setVpnConfigurations_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setVpnConfigurations:");
}

id objc_msgSend_setVpnConfigurationsByIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setVpnConfigurationsByIdentifier:");
}

id objc_msgSend_setWantsGradientMask_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWantsGradientMask:");
}

id objc_msgSend_setWaveform_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWaveform:");
}

id objc_msgSend_setWaveformData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWaveformData:");
}

id objc_msgSend_setWindow_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWindow:");
}

id objc_msgSend_setWithArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWithArray:");
}

id objc_msgSend_setWithObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWithObject:");
}

id objc_msgSend_setWithObjects_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWithObjects:");
}

id objc_msgSend_setZeroFormattingBehavior_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setZeroFormattingBehavior:");
}

id objc_msgSend_setZoomFactor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setZoomFactor:");
}

id objc_msgSend_setZoomFactor_forManualFraming_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setZoomFactor:forManualFraming:");
}

id objc_msgSend_setZoomFactor_minZoomFactor_maxZoomFactor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setZoomFactor:minZoomFactor:maxZoomFactor:");
}

id objc_msgSend_set_ignoresFallbacks_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "set_ignoresFallbacks:");
}

id objc_msgSend_settlingDuration(void *a1, const char *a2, ...)
{
  return _[a1 settlingDuration];
}

id objc_msgSend_setupBackgroundCircle(void *a1, const char *a2, ...)
{
  return _[a1 setupBackgroundCircle];
}

id objc_msgSend_setupNetworkMonitoring(void *a1, const char *a2, ...)
{
  return _[a1 setupNetworkMonitoring];
}

id objc_msgSend_shapeLayer(void *a1, const char *a2, ...)
{
  return _[a1 shapeLayer];
}

id objc_msgSend_shareAudioDelegate(void *a1, const char *a2, ...)
{
  return _[a1 shareAudioDelegate];
}

id objc_msgSend_shareAudioDidComplete_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shareAudioDidComplete:");
}

id objc_msgSend_sharePlayActivityLayoutProvidersFromBackingStore_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sharePlayActivityLayoutProvidersFromBackingStore:");
}

id objc_msgSend_sharePlayContentFromBackingStore_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sharePlayContentFromBackingStore:");
}

id objc_msgSend_sharePlayOnlyLayoutProvidersFromBackingStore_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sharePlayOnlyLayoutProvidersFromBackingStore:");
}

id objc_msgSend_shared(void *a1, const char *a2, ...)
{
  return _[a1 shared];
}

id objc_msgSend_sharedApplication(void *a1, const char *a2, ...)
{
  return _[a1 sharedApplication];
}

id objc_msgSend_sharedApplicationDelegate(void *a1, const char *a2, ...)
{
  return _[a1 sharedApplicationDelegate];
}

id objc_msgSend_sharedConnection(void *a1, const char *a2, ...)
{
  return _[a1 sharedConnection];
}

id objc_msgSend_sharedDispatcher(void *a1, const char *a2, ...)
{
  return _[a1 sharedDispatcher];
}

id objc_msgSend_sharedInputModeController(void *a1, const char *a2, ...)
{
  return _[a1 sharedInputModeController];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return _[a1 sharedInstance];
}

id objc_msgSend_sharedPhotoLibrary(void *a1, const char *a2, ...)
{
  return _[a1 sharedPhotoLibrary];
}

id objc_msgSend_sharedPineBoardServicesPreferences(void *a1, const char *a2, ...)
{
  return _[a1 sharedPineBoardServicesPreferences];
}

id objc_msgSend_sharedRecorder(void *a1, const char *a2, ...)
{
  return _[a1 sharedRecorder];
}

id objc_msgSend_sharedSystemPathMonitor(void *a1, const char *a2, ...)
{
  return _[a1 sharedSystemPathMonitor];
}

id objc_msgSend_shortName(void *a1, const char *a2, ...)
{
  return _[a1 shortName];
}

id objc_msgSend_shortRowHeight(void *a1, const char *a2, ...)
{
  return _[a1 shortRowHeight];
}

id objc_msgSend_shorterFormatter(void *a1, const char *a2, ...)
{
  return _[a1 shorterFormatter];
}

id objc_msgSend_shouldApplyTransform(void *a1, const char *a2, ...)
{
  return _[a1 shouldApplyTransform];
}

id objc_msgSend_shouldPerformSearchAction(void *a1, const char *a2, ...)
{
  return _[a1 shouldPerformSearchAction];
}

id objc_msgSend_shouldShowActivityIndicator(void *a1, const char *a2, ...)
{
  return _[a1 shouldShowActivityIndicator];
}

id objc_msgSend_shouldShowConnectionStateImage(void *a1, const char *a2, ...)
{
  return _[a1 shouldShowConnectionStateImage];
}

id objc_msgSend_shouldShowMenuItem(void *a1, const char *a2, ...)
{
  return _[a1 shouldShowMenuItem];
}

id objc_msgSend_shouldStartStreamOnDisplay(void *a1, const char *a2, ...)
{
  return _[a1 shouldStartStreamOnDisplay];
}

id objc_msgSend_showPreview(void *a1, const char *a2, ...)
{
  return _[a1 showPreview];
}

id objc_msgSend_showProgressViewWithFuture_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "showProgressViewWithFuture:");
}

id objc_msgSend_showViewController_sender_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "showViewController:sender:");
}

id objc_msgSend_signalStrength(void *a1, const char *a2, ...)
{
  return _[a1 signalStrength];
}

id objc_msgSend_singlePercentage(void *a1, const char *a2, ...)
{
  return _[a1 singlePercentage];
}

id objc_msgSend_siriPresentationVisibility(void *a1, const char *a2, ...)
{
  return _[a1 siriPresentationVisibility];
}

id objc_msgSend_size(void *a1, const char *a2, ...)
{
  return _[a1 size];
}

id objc_msgSend_sizeToFit(void *a1, const char *a2, ...)
{
  return _[a1 sizeToFit];
}

id objc_msgSend_sleepRequestsByIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 sleepRequestsByIdentifier];
}

id objc_msgSend_sleepSystemForReason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sleepSystemForReason:");
}

id objc_msgSend_sleepTimerController(void *a1, const char *a2, ...)
{
  return _[a1 sleepTimerController];
}

id objc_msgSend_smartRoutingAssetPathForPID_colorCode_outIsVideo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "smartRoutingAssetPathForPID:colorCode:outIsVideo:");
}

id objc_msgSend_smediumRowHeight(void *a1, const char *a2, ...)
{
  return _[a1 smediumRowHeight];
}

id objc_msgSend_snapshotTimer(void *a1, const char *a2, ...)
{
  return _[a1 snapshotTimer];
}

id objc_msgSend_song(void *a1, const char *a2, ...)
{
  return _[a1 song];
}

id objc_msgSend_sortDescriptorWithKey_ascending_selector_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sortDescriptorWithKey:ascending:selector:");
}

id objc_msgSend_sortedArrayUsingComparator_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sortedArrayUsingComparator:");
}

id objc_msgSend_sortedArrayUsingDescriptors_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sortedArrayUsingDescriptors:");
}

id objc_msgSend_sortedHomeKitItemComparator(void *a1, const char *a2, ...)
{
  return _[a1 sortedHomeKitItemComparator];
}

id objc_msgSend_sourceItem(void *a1, const char *a2, ...)
{
  return _[a1 sourceItem];
}

id objc_msgSend_spacer(void *a1, const char *a2, ...)
{
  return _[a1 spacer];
}

id objc_msgSend_spacerWithHeight_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "spacerWithHeight:");
}

id objc_msgSend_spatialAudioAllowed(void *a1, const char *a2, ...)
{
  return _[a1 spatialAudioAllowed];
}

id objc_msgSend_spatialAudioModeForBundleID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "spatialAudioModeForBundleID:");
}

id objc_msgSend_spatialAudioSupported(void *a1, const char *a2, ...)
{
  return _[a1 spatialAudioSupported];
}

id objc_msgSend_spatialAudioSupportedWhileSharing(void *a1, const char *a2, ...)
{
  return _[a1 spatialAudioSupportedWhileSharing];
}

id objc_msgSend_specification(void *a1, const char *a2, ...)
{
  return _[a1 specification];
}

id objc_msgSend_spinnerView(void *a1, const char *a2, ...)
{
  return _[a1 spinnerView];
}

id objc_msgSend_splitViewVisibility(void *a1, const char *a2, ...)
{
  return _[a1 splitViewVisibility];
}

id objc_msgSend_springDamping(void *a1, const char *a2, ...)
{
  return _[a1 springDamping];
}

id objc_msgSend_stackView(void *a1, const char *a2, ...)
{
  return _[a1 stackView];
}

id objc_msgSend_standardConfiguration(void *a1, const char *a2, ...)
{
  return _[a1 standardConfiguration];
}

id objc_msgSend_standardUserDefaults(void *a1, const char *a2, ...)
{
  return _[a1 standardUserDefaults];
}

id objc_msgSend_start(void *a1, const char *a2, ...)
{
  return _[a1 start];
}

id objc_msgSend_startAnimating(void *a1, const char *a2, ...)
{
  return _[a1 startAnimating];
}

id objc_msgSend_startAnimation(void *a1, const char *a2, ...)
{
  return _[a1 startAnimation];
}

id objc_msgSend_startAnimationAfterDelay_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startAnimationAfterDelay:");
}

id objc_msgSend_startAnimations(void *a1, const char *a2, ...)
{
  return _[a1 startAnimations];
}

id objc_msgSend_startConnectionMonitoring(void *a1, const char *a2, ...)
{
  return _[a1 startConnectionMonitoring];
}

id objc_msgSend_startListeningForPowerSources(void *a1, const char *a2, ...)
{
  return _[a1 startListeningForPowerSources];
}

id objc_msgSend_startMovie(void *a1, const char *a2, ...)
{
  return _[a1 startMovie];
}

id objc_msgSend_startMovieLoopWithPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startMovieLoopWithPath:");
}

id objc_msgSend_startObserving(void *a1, const char *a2, ...)
{
  return _[a1 startObserving];
}

id objc_msgSend_startPreview(void *a1, const char *a2, ...)
{
  return _[a1 startPreview];
}

id objc_msgSend_startRunning(void *a1, const char *a2, ...)
{
  return _[a1 startRunning];
}

id objc_msgSend_startScreenRecording(void *a1, const char *a2, ...)
{
  return _[a1 startScreenRecording];
}

id objc_msgSend_startSystemRecordingWithMicrophoneEnabled_handler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startSystemRecordingWithMicrophoneEnabled:handler:");
}

id objc_msgSend_startWithFuture_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startWithFuture:");
}

id objc_msgSend_state(void *a1, const char *a2, ...)
{
  return _[a1 state];
}

id objc_msgSend_stateContributorHasUpdate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stateContributorHasUpdate:");
}

id objc_msgSend_stateDumpBuilder(void *a1, const char *a2, ...)
{
  return _[a1 stateDumpBuilder];
}

id objc_msgSend_stateMachine(void *a1, const char *a2, ...)
{
  return _[a1 stateMachine];
}

id objc_msgSend_stateWithName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stateWithName:");
}

id objc_msgSend_staticWaveform(void *a1, const char *a2, ...)
{
  return _[a1 staticWaveform];
}

id objc_msgSend_status(void *a1, const char *a2, ...)
{
  return _[a1 status];
}

id objc_msgSend_stop(void *a1, const char *a2, ...)
{
  return _[a1 stop];
}

id objc_msgSend_stopAnimating(void *a1, const char *a2, ...)
{
  return _[a1 stopAnimating];
}

id objc_msgSend_stopAnimation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stopAnimation:");
}

id objc_msgSend_stopConnectionMonitoring(void *a1, const char *a2, ...)
{
  return _[a1 stopConnectionMonitoring];
}

id objc_msgSend_stopDictation(void *a1, const char *a2, ...)
{
  return _[a1 stopDictation];
}

id objc_msgSend_stopDictation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stopDictation:");
}

id objc_msgSend_stopListeningForPowerSources(void *a1, const char *a2, ...)
{
  return _[a1 stopListeningForPowerSources];
}

id objc_msgSend_stopObserving(void *a1, const char *a2, ...)
{
  return _[a1 stopObserving];
}

id objc_msgSend_stopRunning(void *a1, const char *a2, ...)
{
  return _[a1 stopRunning];
}

id objc_msgSend_stopScreenRecordingWithPresentingViewController_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stopScreenRecordingWithPresentingViewController:completion:");
}

id objc_msgSend_stopSystemRecordingWithURLHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stopSystemRecordingWithURLHandler:");
}

id objc_msgSend_stops(void *a1, const char *a2, ...)
{
  return _[a1 stops];
}

id objc_msgSend_string(void *a1, const char *a2, ...)
{
  return _[a1 string];
}

id objc_msgSend_stringByAppendingFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByAppendingFormat:");
}

id objc_msgSend_stringByAppendingString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByAppendingString:");
}

id objc_msgSend_stringForTimeInterval_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringForTimeInterval:");
}

id objc_msgSend_stringFromDateComponents_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringFromDateComponents:");
}

id objc_msgSend_stringFromNumber_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringFromNumber:");
}

id objc_msgSend_stringFromPersonNameComponents_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringFromPersonNameComponents:");
}

id objc_msgSend_stringFromTimeInterval_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringFromTimeInterval:");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_stringWithUTF8String_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithUTF8String:");
}

id objc_msgSend_stringWithValidatedFormat_validFormatSpecifiers_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithValidatedFormat:validFormatSpecifiers:error:");
}

id objc_msgSend_strokeEnd(void *a1, const char *a2, ...)
{
  return _[a1 strokeEnd];
}

id objc_msgSend_strokeRect_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "strokeRect:");
}

id objc_msgSend_strongToStrongObjectsMapTable(void *a1, const char *a2, ...)
{
  return _[a1 strongToStrongObjectsMapTable];
}

id objc_msgSend_strongToWeakObjectsMapTable(void *a1, const char *a2, ...)
{
  return _[a1 strongToWeakObjectsMapTable];
}

id objc_msgSend_stylingWithIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stylingWithIdentifier:");
}

id objc_msgSend_stylingWithIdentifier_attributes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stylingWithIdentifier:attributes:");
}

id objc_msgSend_stylingWithIdentifier_handler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stylingWithIdentifier:handler:");
}

id objc_msgSend_subTitle(void *a1, const char *a2, ...)
{
  return _[a1 subTitle];
}

id objc_msgSend_subarrayWithRange_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "subarrayWithRange:");
}

id objc_msgSend_sublayers(void *a1, const char *a2, ...)
{
  return _[a1 sublayers];
}

id objc_msgSend_substringFromIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "substringFromIndex:");
}

id objc_msgSend_subtitle(void *a1, const char *a2, ...)
{
  return _[a1 subtitle];
}

id objc_msgSend_subtitleVerticalPadding(void *a1, const char *a2, ...)
{
  return _[a1 subtitleVerticalPadding];
}

id objc_msgSend_subviews(void *a1, const char *a2, ...)
{
  return _[a1 subviews];
}

id objc_msgSend_succinctDescription(void *a1, const char *a2, ...)
{
  return _[a1 succinctDescription];
}

id objc_msgSend_succinctDescriptionBuilder(void *a1, const char *a2, ...)
{
  return _[a1 succinctDescriptionBuilder];
}

id objc_msgSend_succinctDescriptionForObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "succinctDescriptionForObject:");
}

id objc_msgSend_suggestedUsers(void *a1, const char *a2, ...)
{
  return _[a1 suggestedUsers];
}

id objc_msgSend_superlayer(void *a1, const char *a2, ...)
{
  return _[a1 superlayer];
}

id objc_msgSend_superview(void *a1, const char *a2, ...)
{
  return _[a1 superview];
}

id objc_msgSend_supportsDisconnectRequests(void *a1, const char *a2, ...)
{
  return _[a1 supportsDisconnectRequests];
}

id objc_msgSend_supportsDisplayingAsMenuItem(void *a1, const char *a2, ...)
{
  return _[a1 supportsDisplayingAsMenuItem];
}

id objc_msgSend_supportsHomeTheaterAtmos(void *a1, const char *a2, ...)
{
  return _[a1 supportsHomeTheaterAtmos];
}

id objc_msgSend_supportsInteractiveMode(void *a1, const char *a2, ...)
{
  return _[a1 supportsInteractiveMode];
}

id objc_msgSend_supportsUltraWideCamera(void *a1, const char *a2, ...)
{
  return _[a1 supportsUltraWideCamera];
}

id objc_msgSend_supportsWideCamera(void *a1, const char *a2, ...)
{
  return _[a1 supportsWideCamera];
}

id objc_msgSend_supportsWirelessSplitter(void *a1, const char *a2, ...)
{
  return _[a1 supportsWirelessSplitter];
}

id objc_msgSend_suspendWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "suspendWithError:");
}

id objc_msgSend_switchToDictationInputMode(void *a1, const char *a2, ...)
{
  return _[a1 switchToDictationInputMode];
}

id objc_msgSend_symbolConfiguration(void *a1, const char *a2, ...)
{
  return _[a1 symbolConfiguration];
}

id objc_msgSend_symbolConfiguration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "symbolConfiguration:");
}

id objc_msgSend_symbolName(void *a1, const char *a2, ...)
{
  return _[a1 symbolName];
}

id objc_msgSend_symbolNameForCurrentRoutes(void *a1, const char *a2, ...)
{
  return _[a1 symbolNameForCurrentRoutes];
}

id objc_msgSend_syncTimingForNowPlayingState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "syncTimingForNowPlayingState:");
}

id objc_msgSend_systemAttentionState(void *a1, const char *a2, ...)
{
  return _[a1 systemAttentionState];
}

id objc_msgSend_systemBackgroundColor(void *a1, const char *a2, ...)
{
  return _[a1 systemBackgroundColor];
}

id objc_msgSend_systemBlueColor(void *a1, const char *a2, ...)
{
  return _[a1 systemBlueColor];
}

id objc_msgSend_systemBrownColor(void *a1, const char *a2, ...)
{
  return _[a1 systemBrownColor];
}

id objc_msgSend_systemEndpointRoute(void *a1, const char *a2, ...)
{
  return _[a1 systemEndpointRoute];
}

id objc_msgSend_systemFontOfSize_weight_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "systemFontOfSize:weight:");
}

id objc_msgSend_systemGestureRequestedFocus(void *a1, const char *a2, ...)
{
  return _[a1 systemGestureRequestedFocus];
}

id objc_msgSend_systemGray2Color(void *a1, const char *a2, ...)
{
  return _[a1 systemGray2Color];
}

id objc_msgSend_systemGray3Color(void *a1, const char *a2, ...)
{
  return _[a1 systemGray3Color];
}

id objc_msgSend_systemGray5Color(void *a1, const char *a2, ...)
{
  return _[a1 systemGray5Color];
}

id objc_msgSend_systemGray6Color(void *a1, const char *a2, ...)
{
  return _[a1 systemGray6Color];
}

id objc_msgSend_systemGrayColor(void *a1, const char *a2, ...)
{
  return _[a1 systemGrayColor];
}

id objc_msgSend_systemGreenColor(void *a1, const char *a2, ...)
{
  return _[a1 systemGreenColor];
}

id objc_msgSend_systemImageName(void *a1, const char *a2, ...)
{
  return _[a1 systemImageName];
}

id objc_msgSend_systemImageNamed_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "systemImageNamed:");
}

id objc_msgSend_systemImageNamed_variableValue_withConfiguration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "systemImageNamed:variableValue:withConfiguration:");
}

id objc_msgSend_systemImageNamed_withConfiguration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "systemImageNamed:withConfiguration:");
}

id objc_msgSend_systemIndigoColor(void *a1, const char *a2, ...)
{
  return _[a1 systemIndigoColor];
}

id objc_msgSend_systemLayoutSizeFittingSize_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "systemLayoutSizeFittingSize:");
}

id objc_msgSend_systemMintColor(void *a1, const char *a2, ...)
{
  return _[a1 systemMintColor];
}

id objc_msgSend_systemOrangeColor(void *a1, const char *a2, ...)
{
  return _[a1 systemOrangeColor];
}

id objc_msgSend_systemOutputDeviceRouteControllerDidChangeOutputDevices_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "systemOutputDeviceRouteControllerDidChangeOutputDevices:");
}

id objc_msgSend_systemOutputDeviceRouteControllerDidUpdate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "systemOutputDeviceRouteControllerDidUpdate:");
}

id objc_msgSend_systemPinkColor(void *a1, const char *a2, ...)
{
  return _[a1 systemPinkColor];
}

id objc_msgSend_systemRedColor(void *a1, const char *a2, ...)
{
  return _[a1 systemRedColor];
}

id objc_msgSend_systemRoute(void *a1, const char *a2, ...)
{
  return _[a1 systemRoute];
}

id objc_msgSend_systemServiceProxy(void *a1, const char *a2, ...)
{
  return _[a1 systemServiceProxy];
}

id objc_msgSend_systemState(void *a1, const char *a2, ...)
{
  return _[a1 systemState];
}

id objc_msgSend_systemYellowColor(void *a1, const char *a2, ...)
{
  return _[a1 systemYellowColor];
}

id objc_msgSend_tallRowHeight(void *a1, const char *a2, ...)
{
  return _[a1 tallRowHeight];
}

id objc_msgSend_tap(void *a1, const char *a2, ...)
{
  return _[a1 tap];
}

id objc_msgSend_targetForAction_withSender_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "targetForAction:withSender:");
}

id objc_msgSend_targetProviderIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 targetProviderIdentifier];
}

id objc_msgSend_templateBannerImageMaxSize(void *a1, const char *a2, ...)
{
  return _[a1 templateBannerImageMaxSize];
}

id objc_msgSend_templateBannerImageRoundedRectCornerRadius(void *a1, const char *a2, ...)
{
  return _[a1 templateBannerImageRoundedRectCornerRadius];
}

id objc_msgSend_templateBannerMediaImageSize(void *a1, const char *a2, ...)
{
  return _[a1 templateBannerMediaImageSize];
}

id objc_msgSend_templateBannerMediaImageSmallSize(void *a1, const char *a2, ...)
{
  return _[a1 templateBannerMediaImageSmallSize];
}

id objc_msgSend_templateItemButtonConfiguration(void *a1, const char *a2, ...)
{
  return _[a1 templateItemButtonConfiguration];
}

id objc_msgSend_templateItemImageProvider(void *a1, const char *a2, ...)
{
  return _[a1 templateItemImageProvider];
}

id objc_msgSend_templateItemText(void *a1, const char *a2, ...)
{
  return _[a1 templateItemText];
}

id objc_msgSend_tertiaryLabelColor(void *a1, const char *a2, ...)
{
  return _[a1 tertiaryLabelColor];
}

id objc_msgSend_text(void *a1, const char *a2, ...)
{
  return _[a1 text];
}

id objc_msgSend_text1ID(void *a1, const char *a2, ...)
{
  return _[a1 text1ID];
}

id objc_msgSend_text2ID(void *a1, const char *a2, ...)
{
  return _[a1 text2ID];
}

id objc_msgSend_text3ID(void *a1, const char *a2, ...)
{
  return _[a1 text3ID];
}

id objc_msgSend_textAlignment_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "textAlignment:");
}

id objc_msgSend_textAttachmentWithImage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "textAttachmentWithImage:");
}

id objc_msgSend_textColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "textColor:");
}

id objc_msgSend_textEncapsulation(void *a1, const char *a2, ...)
{
  return _[a1 textEncapsulation];
}

id objc_msgSend_textLabel(void *a1, const char *a2, ...)
{
  return _[a1 textLabel];
}

id objc_msgSend_textOnlyConfiguration(void *a1, const char *a2, ...)
{
  return _[a1 textOnlyConfiguration];
}

id objc_msgSend_textStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "textStyle:");
}

id objc_msgSend_thumbnailStyle(void *a1, const char *a2, ...)
{
  return _[a1 thumbnailStyle];
}

id objc_msgSend_timeElapsed(void *a1, const char *a2, ...)
{
  return _[a1 timeElapsed];
}

id objc_msgSend_timeInterval(void *a1, const char *a2, ...)
{
  return _[a1 timeInterval];
}

id objc_msgSend_timeIntervalSinceDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "timeIntervalSinceDate:");
}

id objc_msgSend_timeIntervalSinceNow(void *a1, const char *a2, ...)
{
  return _[a1 timeIntervalSinceNow];
}

id objc_msgSend_timeIntervalSinceReferenceDate(void *a1, const char *a2, ...)
{
  return _[a1 timeIntervalSinceReferenceDate];
}

id objc_msgSend_timeLabel(void *a1, const char *a2, ...)
{
  return _[a1 timeLabel];
}

id objc_msgSend_timeOffset(void *a1, const char *a2, ...)
{
  return _[a1 timeOffset];
}

id objc_msgSend_timeRemaining(void *a1, const char *a2, ...)
{
  return _[a1 timeRemaining];
}

id objc_msgSend_tintColor(void *a1, const char *a2, ...)
{
  return _[a1 tintColor];
}

id objc_msgSend_tintColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "tintColor:");
}

id objc_msgSend_tintableLayers(void *a1, const char *a2, ...)
{
  return _[a1 tintableLayers];
}

id objc_msgSend_tintableViews(void *a1, const char *a2, ...)
{
  return _[a1 tintableViews];
}

id objc_msgSend_title(void *a1, const char *a2, ...)
{
  return _[a1 title];
}

id objc_msgSend_titleFont(void *a1, const char *a2, ...)
{
  return _[a1 titleFont];
}

id objc_msgSend_titleID(void *a1, const char *a2, ...)
{
  return _[a1 titleID];
}

id objc_msgSend_titleLabel(void *a1, const char *a2, ...)
{
  return _[a1 titleLabel];
}

id objc_msgSend_titleVerticalPadding(void *a1, const char *a2, ...)
{
  return _[a1 titleVerticalPadding];
}

id objc_msgSend_toView(void *a1, const char *a2, ...)
{
  return _[a1 toView];
}

id objc_msgSend_toggleEnabledForEffect_enable_forBundleID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "toggleEnabledForEffect:enable:forBundleID:");
}

id objc_msgSend_togglePlayPause(void *a1, const char *a2, ...)
{
  return _[a1 togglePlayPause];
}

id objc_msgSend_toggleTransform_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "toggleTransform:");
}

id objc_msgSend_toggleVideoEffect_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "toggleVideoEffect:");
}

id objc_msgSend_token(void *a1, const char *a2, ...)
{
  return _[a1 token];
}

id objc_msgSend_tokenFromAuditToken_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "tokenFromAuditToken:");
}

id objc_msgSend_tokenToTransitionHandler(void *a1, const char *a2, ...)
{
  return _[a1 tokenToTransitionHandler];
}

id objc_msgSend_topAnchor(void *a1, const char *a2, ...)
{
  return _[a1 topAnchor];
}

id objc_msgSend_topPresentables(void *a1, const char *a2, ...)
{
  return _[a1 topPresentables];
}

id objc_msgSend_topSpacerHeight(void *a1, const char *a2, ...)
{
  return _[a1 topSpacerHeight];
}

id objc_msgSend_tracklist(void *a1, const char *a2, ...)
{
  return _[a1 tracklist];
}

id objc_msgSend_trailingAccessorySpacing(void *a1, const char *a2, ...)
{
  return _[a1 trailingAccessorySpacing];
}

id objc_msgSend_trailingAnchor(void *a1, const char *a2, ...)
{
  return _[a1 trailingAnchor];
}

id objc_msgSend_trailingImageTreatment(void *a1, const char *a2, ...)
{
  return _[a1 trailingImageTreatment];
}

id objc_msgSend_trailingItemSpacing(void *a1, const char *a2, ...)
{
  return _[a1 trailingItemSpacing];
}

id objc_msgSend_trailingMenuItemView(void *a1, const char *a2, ...)
{
  return _[a1 trailingMenuItemView];
}

id objc_msgSend_trailingTemplateViewProvider(void *a1, const char *a2, ...)
{
  return _[a1 trailingTemplateViewProvider];
}

id objc_msgSend_trailingView(void *a1, const char *a2, ...)
{
  return _[a1 trailingView];
}

id objc_msgSend_traitCollection(void *a1, const char *a2, ...)
{
  return _[a1 traitCollection];
}

id objc_msgSend_traitCollectionWithUserInterfaceStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "traitCollectionWithUserInterfaceStyle:");
}

id objc_msgSend_traitOverrides(void *a1, const char *a2, ...)
{
  return _[a1 traitOverrides];
}

id objc_msgSend_transitionEdgeLayoutGuide(void *a1, const char *a2, ...)
{
  return _[a1 transitionEdgeLayoutGuide];
}

id objc_msgSend_transitionEdgeLayoutGuideBottomConstraint(void *a1, const char *a2, ...)
{
  return _[a1 transitionEdgeLayoutGuideBottomConstraint];
}

id objc_msgSend_transitionEdgeLayoutGuideLeadingConstraint(void *a1, const char *a2, ...)
{
  return _[a1 transitionEdgeLayoutGuideLeadingConstraint];
}

id objc_msgSend_transitionEdgeLayoutGuideTopConstraint(void *a1, const char *a2, ...)
{
  return _[a1 transitionEdgeLayoutGuideTopConstraint];
}

id objc_msgSend_transitionEdgeLayoutGuideTrailingConstraint(void *a1, const char *a2, ...)
{
  return _[a1 transitionEdgeLayoutGuideTrailingConstraint];
}

id objc_msgSend_transitionObserver(void *a1, const char *a2, ...)
{
  return _[a1 transitionObserver];
}

id objc_msgSend_transitioningBannerPresentable(void *a1, const char *a2, ...)
{
  return _[a1 transitioningBannerPresentable];
}

id objc_msgSend_transportBarDidUpdateWithTimeElapsed_timeRemaining_percentComplete_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "transportBarDidUpdateWithTimeElapsed:timeRemaining:percentComplete:");
}

id objc_msgSend_transportType(void *a1, const char *a2, ...)
{
  return _[a1 transportType];
}

id objc_msgSend_triggerOneShotFraming(void *a1, const char *a2, ...)
{
  return _[a1 triggerOneShotFraming];
}

id objc_msgSend_tripleClickOrderedOptions(void *a1, const char *a2, ...)
{
  return _[a1 tripleClickOrderedOptions];
}

id objc_msgSend_turnOffActionSet(void *a1, const char *a2, ...)
{
  return _[a1 turnOffActionSet];
}

id objc_msgSend_tvSSConfigurationsByIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 tvSSConfigurationsByIdentifier];
}

id objc_msgSend_tvsp_darkStyleColor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "tvsp_darkStyleColor");
}

id objc_msgSend_tvsp_lightStyleColor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "tvsp_lightStyleColor");
}

id objc_msgSend_tvsp_topMostAncestor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "tvsp_topMostAncestor");
}

id objc_msgSend_tvss_appearingSpringParameters(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "tvss_appearingSpringParameters");
}

id objc_msgSend_tvss_asset(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "tvss_asset");
}

id objc_msgSend_tvss_cameraFontWithWeight_pointSize_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "tvss_cameraFontWithWeight:pointSize:");
}

id objc_msgSend_tvss_defaultSpringParameters(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "tvss_defaultSpringParameters");
}

id objc_msgSend_tvss_fontWithMonospacedNumbers(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "tvss_fontWithMonospacedNumbers");
}

id objc_msgSend_tvss_shouldShowInMenuBar(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "tvss_shouldShowInMenuBar");
}

id objc_msgSend_tvss_succinctDescription(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "tvss_succinctDescription");
}

id objc_msgSend_tvss_succinctDescriptionBuilder(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "tvss_succinctDescriptionBuilder");
}

id objc_msgSend_tvss_useFaceTimeIconForState(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "tvss_useFaceTimeIconForState");
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return _[a1 type];
}

id objc_msgSend_typedIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 typedIdentifier];
}

id objc_msgSend_unarchivedObjectOfClass_fromData_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unarchivedObjectOfClass:fromData:error:");
}

id objc_msgSend_unavailableReasonsForEffect_bundleID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unavailableReasonsForEffect:bundleID:");
}

id objc_msgSend_unionOrderedSet_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unionOrderedSet:");
}

id objc_msgSend_unionSet_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unionSet:");
}

id objc_msgSend_uniqueIdentificationForPresentable_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "uniqueIdentificationForPresentable:");
}

id objc_msgSend_uniqueIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 uniqueIdentifier];
}

id objc_msgSend_uniquePresentableIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 uniquePresentableIdentifier];
}

id objc_msgSend_unpairDevice_withCompletionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unpairDevice:withCompletionHandler:");
}

id objc_msgSend_unpairDeviceWithIdentifier_withCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unpairDeviceWithIdentifier:withCompletion:");
}

id objc_msgSend_unregisterForTraitChanges_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unregisterForTraitChanges:");
}

id objc_msgSend_unregisterObserver_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unregisterObserver:");
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return _[a1 unsignedIntegerValue];
}

id objc_msgSend_updateAnalyzer(void *a1, const char *a2, ...)
{
  return _[a1 updateAnalyzer];
}

id objc_msgSend_updateButtonTitleForUltraWideZoomFactor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateButtonTitleForUltraWideZoomFactor:");
}

id objc_msgSend_updateButtonTitleForWideZoomFactor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateButtonTitleForWideZoomFactor:");
}

id objc_msgSend_updateConstraints(void *a1, const char *a2, ...)
{
  return _[a1 updateConstraints];
}

id objc_msgSend_updateContentView(void *a1, const char *a2, ...)
{
  return _[a1 updateContentView];
}

id objc_msgSend_updateCurrentMenuItemVisualContentWithReason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateCurrentMenuItemVisualContentWithReason:");
}

id objc_msgSend_updateEffectsForSupport_enablement_controlModes_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateEffectsForSupport:enablement:controlModes:completion:");
}

id objc_msgSend_updateFocusIfNeeded(void *a1, const char *a2, ...)
{
  return _[a1 updateFocusIfNeeded];
}

id objc_msgSend_updateFrameReciever(void *a1, const char *a2, ...)
{
  return _[a1 updateFrameReciever];
}

id objc_msgSend_updateFromPlatterState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateFromPlatterState:");
}

id objc_msgSend_updateMenuItemWithReason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateMenuItemWithReason:");
}

id objc_msgSend_updateMenuModeState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateMenuModeState:");
}

id objc_msgSend_updateMicModesForSupport_enablement_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateMicModesForSupport:enablement:completion:");
}

id objc_msgSend_updateOrthogonalDelegateOfActiveMenuItem_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateOrthogonalDelegateOfActiveMenuItem:");
}

id objc_msgSend_updatePackageViewStateAnimated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updatePackageViewStateAnimated:");
}

id objc_msgSend_updateRoute_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateRoute:");
}

id objc_msgSend_updateSettingsWithBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateSettingsWithBlock:");
}

id objc_msgSend_updateStatusForRelay(void *a1, const char *a2, ...)
{
  return _[a1 updateStatusForRelay];
}

id objc_msgSend_updateTip(void *a1, const char *a2, ...)
{
  return _[a1 updateTip];
}

id objc_msgSend_updateTraitsIfNeeded(void *a1, const char *a2, ...)
{
  return _[a1 updateTraitsIfNeeded];
}

id objc_msgSend_updateVisualContentForMenuItem_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateVisualContentForMenuItem:");
}

id objc_msgSend_updateWithHFItem_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateWithHFItem:");
}

id objc_msgSend_updateWithMenuItems_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateWithMenuItems:");
}

id objc_msgSend_updateWithNEConfiguration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateWithNEConfiguration:");
}

id objc_msgSend_usedRecently(void *a1, const char *a2, ...)
{
  return _[a1 usedRecently];
}

id objc_msgSend_user_didChangeCurrentUser_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "user:didChangeCurrentUser:");
}

id objc_msgSend_user_didChangeImage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "user:didChangeImage:");
}

id objc_msgSend_user_didChangePersonNameComponents_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "user:didChangePersonNameComponents:");
}

id objc_msgSend_userConfirmed_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "userConfirmed:");
}

id objc_msgSend_userGridViewControllerRequestsDismissal_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "userGridViewControllerRequestsDismissal:");
}

id objc_msgSend_userGridViewViewController(void *a1, const char *a2, ...)
{
  return _[a1 userGridViewViewController];
}

id objc_msgSend_userImage(void *a1, const char *a2, ...)
{
  return _[a1 userImage];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return _[a1 userInfo];
}

id objc_msgSend_userInterfaceLayoutDirectionForSemanticContentAttribute_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "userInterfaceLayoutDirectionForSemanticContentAttribute:");
}

id objc_msgSend_userInterfaceStyle(void *a1, const char *a2, ...)
{
  return _[a1 userInterfaceStyle];
}

id objc_msgSend_userProfileTipManager(void *a1, const char *a2, ...)
{
  return _[a1 userProfileTipManager];
}

id objc_msgSend_userProfilesSnapshot(void *a1, const char *a2, ...)
{
  return _[a1 userProfilesSnapshot];
}

id objc_msgSend_users(void *a1, const char *a2, ...)
{
  return _[a1 users];
}

id objc_msgSend_uuid(void *a1, const char *a2, ...)
{
  return _[a1 uuid];
}

id objc_msgSend_validateRestrictionForSetting_allowInteraction_withCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "validateRestrictionForSetting:allowInteraction:withCompletion:");
}

id objc_msgSend_value(void *a1, const char *a2, ...)
{
  return _[a1 value];
}

id objc_msgSend_valueForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "valueForKey:");
}

id objc_msgSend_valueWithBytes_objCType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "valueWithBytes:objCType:");
}

id objc_msgSend_valueWithCGSize_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "valueWithCGSize:");
}

id objc_msgSend_values(void *a1, const char *a2, ...)
{
  return _[a1 values];
}

id objc_msgSend_vendorIdentifierAndProductIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "vendorIdentifierAndProductIdentifier:");
}

id objc_msgSend_verticalSeparatorView(void *a1, const char *a2, ...)
{
  return _[a1 verticalSeparatorView];
}

id objc_msgSend_verticalTextAlignmentView(void *a1, const char *a2, ...)
{
  return _[a1 verticalTextAlignmentView];
}

id objc_msgSend_verticalTextAlignmentViewID(void *a1, const char *a2, ...)
{
  return _[a1 verticalTextAlignmentViewID];
}

id objc_msgSend_videoDeviceController(void *a1, const char *a2, ...)
{
  return _[a1 videoDeviceController];
}

id objc_msgSend_videoEffects(void *a1, const char *a2, ...)
{
  return _[a1 videoEffects];
}

id objc_msgSend_videoMicBackingStoreDidChange_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "videoMicBackingStoreDidChange:");
}

id objc_msgSend_videoPreviewLayer(void *a1, const char *a2, ...)
{
  return _[a1 videoPreviewLayer];
}

id objc_msgSend_videoPreviewStreamAssertion(void *a1, const char *a2, ...)
{
  return _[a1 videoPreviewStreamAssertion];
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return _[a1 view];
}

id objc_msgSend_viewControllerClassName(void *a1, const char *a2, ...)
{
  return _[a1 viewControllerClassName];
}

id objc_msgSend_viewControllerProvider(void *a1, const char *a2, ...)
{
  return _[a1 viewControllerProvider];
}

id objc_msgSend_visibilityDidChangeHandler(void *a1, const char *a2, ...)
{
  return _[a1 visibilityDidChangeHandler];
}

id objc_msgSend_visibleIdentifiersFromOptions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "visibleIdentifiersFromOptions:");
}

id objc_msgSend_visualContent(void *a1, const char *a2, ...)
{
  return _[a1 visualContent];
}

id objc_msgSend_visualization(void *a1, const char *a2, ...)
{
  return _[a1 visualization];
}

id objc_msgSend_visualizationClassToViewClass_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "visualizationClassToViewClass:");
}

id objc_msgSend_visualizationDidChange_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "visualizationDidChange:");
}

id objc_msgSend_visualizationDidUpdate(void *a1, const char *a2, ...)
{
  return _[a1 visualizationDidUpdate];
}

id objc_msgSend_visualizationToView(void *a1, const char *a2, ...)
{
  return _[a1 visualizationToView];
}

id objc_msgSend_volume(void *a1, const char *a2, ...)
{
  return _[a1 volume];
}

id objc_msgSend_volumeControlRowHeight(void *a1, const char *a2, ...)
{
  return _[a1 volumeControlRowHeight];
}

id objc_msgSend_volumeEligibleRouteIDs(void *a1, const char *a2, ...)
{
  return _[a1 volumeEligibleRouteIDs];
}

id objc_msgSend_volumeLevel(void *a1, const char *a2, ...)
{
  return _[a1 volumeLevel];
}

id objc_msgSend_vpn(void *a1, const char *a2, ...)
{
  return _[a1 vpn];
}

id objc_msgSend_vpnConfigurationsByIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 vpnConfigurationsByIdentifier];
}

id objc_msgSend_vpnController(void *a1, const char *a2, ...)
{
  return _[a1 vpnController];
}

id objc_msgSend_vpnController_didUpdateConfigurations_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "vpnController:didUpdateConfigurations:");
}

id objc_msgSend_waveform(void *a1, const char *a2, ...)
{
  return _[a1 waveform];
}

id objc_msgSend_waveformController(void *a1, const char *a2, ...)
{
  return _[a1 waveformController];
}

id objc_msgSend_waveformController_remoteRouteSymbolNameDidChange_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "waveformController:remoteRouteSymbolNameDidChange:");
}

id objc_msgSend_waveformController_waveformDidChange_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "waveformController:waveformDidChange:");
}

id objc_msgSend_waveformControllerTrackDidChange_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "waveformControllerTrackDidChange:");
}

id objc_msgSend_waveformView(void *a1, const char *a2, ...)
{
  return _[a1 waveformView];
}

id objc_msgSend_weakObjectsHashTable(void *a1, const char *a2, ...)
{
  return _[a1 weakObjectsHashTable];
}

id objc_msgSend_whiteColor(void *a1, const char *a2, ...)
{
  return _[a1 whiteColor];
}

id objc_msgSend_widthAnchor(void *a1, const char *a2, ...)
{
  return _[a1 widthAnchor];
}

id objc_msgSend_wifiInterface(void *a1, const char *a2, ...)
{
  return _[a1 wifiInterface];
}

id objc_msgSend_wifiState(void *a1, const char *a2, ...)
{
  return _[a1 wifiState];
}

id objc_msgSend_willChangeValueForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "willChangeValueForKey:");
}

id objc_msgSend_willMoveToParentViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "willMoveToParentViewController:");
}

id objc_msgSend_window(void *a1, const char *a2, ...)
{
  return _[a1 window];
}

id objc_msgSend_windowScene(void *a1, const char *a2, ...)
{
  return _[a1 windowScene];
}

id objc_msgSend_xScaleMultiplier(void *a1, const char *a2, ...)
{
  return _[a1 xScaleMultiplier];
}

id objc_msgSend_zero(void *a1, const char *a2, ...)
{
  return _[a1 zero];
}

id objc_msgSend_zoomFactor(void *a1, const char *a2, ...)
{
  return _[a1 zoomFactor];
}
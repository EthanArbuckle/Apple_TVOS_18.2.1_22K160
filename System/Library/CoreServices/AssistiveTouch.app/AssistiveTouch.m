LABEL_12:
  return v4;
}

  if ([v13 length])
  {
    +[SCATModernMenuItem imageSize](&OBJC_CLASS___SCATModernMenuItem, "imageSize");
    v18 = v17;
    v20 = v19;
    v34[0] = NSFontAttributeName;
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:](&OBJC_CLASS___UIFont, "systemFontOfSize:", 60.0));
    v35[0] = v21;
    v34[1] = NSForegroundColorAttributeName;
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](&OBJC_CLASS___UIColor, "whiteColor"));
    v35[1] = v22;
    v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v35,  v34,  2LL));

    [v13 sizeWithAttributes:v23];
    v25 = v24;
    v27 = v26;
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](&OBJC_CLASS___UIScreen, "mainScreen"));
    [v28 scale];
    v30 = v29;
    v36.width = v18;
    v36.height = v20;
    UIGraphicsBeginImageContextWithOptions(v36, 0, v30);

    objc_msgSend(v13, "drawInRect:withAttributes:", v23, (v18 - v25) * 0.5, (v20 - v27) * 0.5, v25, v27);
    ImageFromCurrentImageContext = UIGraphicsGetImageFromCurrentImageContext();
    v32 = (void *)objc_claimAutoreleasedReturnValue(ImageFromCurrentImageContext);
    UIGraphicsEndImageContext();
    [v6 addObject:v13];
  }

  else
  {
    v32 = 0LL;
  }

  return v32;
}

  return v13;
}

  return v8;
}
  }
}
}

uint64_t sub_100007BB4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_100007E58( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

uint64_t sub_100007E70(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_100007E80(uint64_t a1)
{
}

void sub_100007E88(uint64_t a1)
{
  v12[0] = @"scrollAmount";
  v2 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithLong:]( &OBJC_CLASS___NSNumber,  "numberWithLong:",  *(void *)(*(void *)(a1 + 32) + 56LL)));
  v12[1] = @"scrollPoint";
  v13[0] = v2;
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSValue valueWithPoint:]( &OBJC_CLASS___NSValue,  "valueWithPoint:",  *(double *)(a1 + 48),  *(double *)(a1 + 56)));
  v13[1] = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v13,  v12,  2LL));

  if (([*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) performAXAction:2047 withValue:v4] & 1) == 0)
  {
    while (1)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue( [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) numberWithAXAttribute:2021]);
      id v6 = [v5 unsignedIntValue];

      v7 = (void *)objc_claimAutoreleasedReturnValue(+[AXBackBoardServer server](&OBJC_CLASS___AXBackBoardServer, "server"));
      id v8 = [v7 contextIdHostingContextId:v6];

      v9 = (void *)objc_claimAutoreleasedReturnValue(+[AXUIElement uiApplicationForContext:](&OBJC_CLASS___AXUIElement, "uiApplicationForContext:", v8));
      uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8LL);
      v11 = *(void **)(v10 + 40);
      *(void *)(v10 + 40) = v9;

      if ([*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) performAXAction:2047 withValue:v4]) {
        goto LABEL_7;
      }
    }
  }

LABEL_7:
  *(void *)(*(void *)(a1 + 32) + 56LL) = 0LL;
}
}

void sub_100008228(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  objc_msgSend(v3, "deviceCountChanged:", objc_msgSend(v2, "deviceCount"));
}

void sub_100008340(id a1)
{
  id v1 = -[SCATSwitchControlServerInstance _initServer]( objc_alloc(&OBJC_CLASS___SCATSwitchControlServerInstance),  "_initServer");
  v2 = (void *)qword_1001575B0;
  qword_1001575B0 = (uint64_t)v1;
}

void sub_100009820( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

id sub_10000A6FC(uint64_t a1)
{
  return _[*(id *)(a1 + 32) _beginHighlightingTargetedElements];
}

void sub_10000A704(uint64_t a1)
{
  v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) pointPicker]);
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 delegate]);
  char v4 = objc_opt_respondsToSelector(v3, "pointPickerDidFinishSweeping:");

  if ((v4 & 1) != 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) pointPicker]);
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 delegate]);
    v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) pointPicker]);
    [v6 pointPickerDidFinishSweeping:v7];

    id v8 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) axisPointPicker]);
    [v8 setSweepFocusContext:0];
  }

id sub_10000B228(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:1.0];
}

id sub_10000B234(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:1.0];
}

void sub_10000B240(uint64_t a1, int a2)
{
  if (a2)
  {
    id v2 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) viewController]);
    [v2 setTransitioningToOrFromActive:0];
  }

void sub_10000B334(uint64_t a1)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) viewController]);
  id v1 = (void *)objc_claimAutoreleasedReturnValue([v2 view]);
  [v1 setAlpha:0.0];
}

void sub_10000B380(uint64_t a1, int a2)
{
  if (a2)
  {
    id v2 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) viewController]);
    [v2 setTransitioningToOrFromActive:0];
  }

void sub_10000C7E4(void *a1, uint64_t a2, uint64_t a3, __IOHIDDevice *a4)
{
  uint64_t v6 = ASTLogCommon(a1);
  v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v9 = 138412546;
    uint64_t v10 = a4;
    __int16 v11 = 2080;
    v12 = "matched";
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "===> IOHIDDeviceRef[%@] %s <===\n",  (uint8_t *)&v9,  0x16u);
  }

  sub_10000CA3C(a4);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 delegate]);
  [v8 deviceDetector:a1 didFindDevice:a4];
}

void sub_10000C8CC(void *a1, uint64_t a2, uint64_t a3, __IOHIDDevice *a4)
{
  uint64_t v6 = ASTLogCommon(a1);
  v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    __int16 v11 = a4;
    __int16 v12 = 2080;
    v13 = "removed";
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "===> IOHIDDeviceRef[%@] %s <===\n", buf, 0x16u);
  }

  sub_10000CA3C(a4);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 delegate]);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_10000D2EC;
  v9[3] = &unk_100121D60;
  v9[4] = a4;
  [v8 deviceDetector:a1 unloadDevicesPassingTest:v9];
}

void sub_10000CA3C(__IOHIDDevice *a1)
{
  if (a1)
  {
    uint64_t v2 = ASTLogCommon();
    id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      int v58 = 136315394;
      v59 = "Transport";
      __int16 v60 = 2112;
      CFTypeRef Property = IOHIDDeviceGetProperty(a1, @"Transport");
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s -- %@", (uint8_t *)&v58, 0x16u);
    }

    uint64_t v4 = ASTLogCommon();
    v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      CFTypeRef v6 = IOHIDDeviceGetProperty(a1, @"VendorID");
      int v58 = 136315394;
      v59 = "VendorID";
      __int16 v60 = 2112;
      CFTypeRef Property = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s -- %@", (uint8_t *)&v58, 0x16u);
    }

    uint64_t v7 = ASTLogCommon();
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      CFTypeRef v9 = IOHIDDeviceGetProperty(a1, @"VendorIDSource");
      int v58 = 136315394;
      v59 = "VendorIDSource";
      __int16 v60 = 2112;
      CFTypeRef Property = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s -- %@", (uint8_t *)&v58, 0x16u);
    }

    uint64_t v10 = ASTLogCommon();
    __int16 v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      CFTypeRef v12 = IOHIDDeviceGetProperty(a1, @"ProductID");
      int v58 = 136315394;
      v59 = "ProductID";
      __int16 v60 = 2112;
      CFTypeRef Property = v12;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "%s -- %@", (uint8_t *)&v58, 0x16u);
    }

    uint64_t v13 = ASTLogCommon();
    v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      CFTypeRef v15 = IOHIDDeviceGetProperty(a1, @"VersionNumber");
      int v58 = 136315394;
      v59 = "VersionNumber";
      __int16 v60 = 2112;
      CFTypeRef Property = v15;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "%s -- %@", (uint8_t *)&v58, 0x16u);
    }

    uint64_t v16 = ASTLogCommon();
    v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      CFTypeRef v18 = IOHIDDeviceGetProperty(a1, @"Manufacturer");
      int v58 = 136315394;
      v59 = "Manufacturer";
      __int16 v60 = 2112;
      CFTypeRef Property = v18;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "%s -- %@", (uint8_t *)&v58, 0x16u);
    }

    uint64_t v19 = ASTLogCommon();
    v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      CFTypeRef v21 = IOHIDDeviceGetProperty(a1, @"Product");
      int v58 = 136315394;
      v59 = "Product";
      __int16 v60 = 2112;
      CFTypeRef Property = v21;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "%s -- %@", (uint8_t *)&v58, 0x16u);
    }

    uint64_t v22 = ASTLogCommon();
    v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      CFTypeRef v24 = IOHIDDeviceGetProperty(a1, @"SerialNumber");
      int v58 = 136315394;
      v59 = "SerialNumber";
      __int16 v60 = 2112;
      CFTypeRef Property = v24;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "%s -- %@", (uint8_t *)&v58, 0x16u);
    }

    uint64_t v25 = ASTLogCommon();
    v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      CFTypeRef v27 = IOHIDDeviceGetProperty(a1, @"CountryCode");
      int v58 = 136315394;
      v59 = "CountryCode";
      __int16 v60 = 2112;
      CFTypeRef Property = v27;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_INFO, "%s -- %@", (uint8_t *)&v58, 0x16u);
    }

    uint64_t v28 = ASTLogCommon();
    v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
    {
      CFTypeRef v30 = IOHIDDeviceGetProperty(a1, @"StandardType");
      int v58 = 136315394;
      v59 = "StandardType";
      __int16 v60 = 2112;
      CFTypeRef Property = v30;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_INFO, "%s -- %@", (uint8_t *)&v58, 0x16u);
    }

    uint64_t v31 = ASTLogCommon();
    v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
    if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
    {
      CFTypeRef v33 = IOHIDDeviceGetProperty(a1, @"LocationID");
      int v58 = 136315394;
      v59 = "LocationID";
      __int16 v60 = 2112;
      CFTypeRef Property = v33;
      _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_INFO, "%s -- %@", (uint8_t *)&v58, 0x16u);
    }

    uint64_t v34 = ASTLogCommon();
    v35 = (os_log_s *)objc_claimAutoreleasedReturnValue(v34);
    if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
    {
      CFTypeRef v36 = IOHIDDeviceGetProperty(a1, @"DeviceUsage");
      int v58 = 136315394;
      v59 = "DeviceUsage";
      __int16 v60 = 2112;
      CFTypeRef Property = v36;
      _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_INFO, "%s -- %@", (uint8_t *)&v58, 0x16u);
    }

    uint64_t v37 = ASTLogCommon();
    v38 = (os_log_s *)objc_claimAutoreleasedReturnValue(v37);
    if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
    {
      CFTypeRef v39 = IOHIDDeviceGetProperty(a1, @"DeviceUsagePage");
      int v58 = 136315394;
      v59 = "DeviceUsagePage";
      __int16 v60 = 2112;
      CFTypeRef Property = v39;
      _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_INFO, "%s -- %@", (uint8_t *)&v58, 0x16u);
    }

    uint64_t v40 = ASTLogCommon();
    v41 = (os_log_s *)objc_claimAutoreleasedReturnValue(v40);
    if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
    {
      CFTypeRef v42 = IOHIDDeviceGetProperty(a1, @"DeviceUsagePairs");
      int v58 = 136315394;
      v59 = "DeviceUsagePairs";
      __int16 v60 = 2112;
      CFTypeRef Property = v42;
      _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_INFO, "%s -- %@", (uint8_t *)&v58, 0x16u);
    }

    uint64_t v43 = ASTLogCommon();
    v44 = (os_log_s *)objc_claimAutoreleasedReturnValue(v43);
    if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
    {
      CFTypeRef v45 = IOHIDDeviceGetProperty(a1, @"PrimaryUsage");
      int v58 = 136315394;
      v59 = "PrimaryUsage";
      __int16 v60 = 2112;
      CFTypeRef Property = v45;
      _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_INFO, "%s -- %@", (uint8_t *)&v58, 0x16u);
    }

    uint64_t v46 = ASTLogCommon();
    v47 = (os_log_s *)objc_claimAutoreleasedReturnValue(v46);
    if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
    {
      CFTypeRef v48 = IOHIDDeviceGetProperty(a1, @"PrimaryUsagePage");
      int v58 = 136315394;
      v59 = "PrimaryUsagePage";
      __int16 v60 = 2112;
      CFTypeRef Property = v48;
      _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_INFO, "%s -- %@", (uint8_t *)&v58, 0x16u);
    }

    uint64_t v49 = ASTLogCommon();
    v50 = (os_log_s *)objc_claimAutoreleasedReturnValue(v49);
    if (os_log_type_enabled(v50, OS_LOG_TYPE_INFO))
    {
      CFTypeRef v51 = IOHIDDeviceGetProperty(a1, @"ReportInterval");
      int v58 = 136315394;
      v59 = "ReportInterval";
      __int16 v60 = 2112;
      CFTypeRef Property = v51;
      _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_INFO, "%s -- %@", (uint8_t *)&v58, 0x16u);
    }

    uint64_t v52 = ASTLogCommon();
    v53 = (os_log_s *)objc_claimAutoreleasedReturnValue(v52);
    if (os_log_type_enabled(v53, OS_LOG_TYPE_INFO))
    {
      CFTypeRef v54 = IOHIDDeviceGetProperty(a1, @"ReportDescriptor");
      int v58 = 136315394;
      v59 = "ReportDescriptor";
      __int16 v60 = 2112;
      CFTypeRef Property = v54;
      _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_INFO, "%s -- %@", (uint8_t *)&v58, 0x16u);
    }

    uint64_t v55 = ASTLogCommon();
    v56 = (os_log_s *)objc_claimAutoreleasedReturnValue(v55);
    if (os_log_type_enabled(v56, OS_LOG_TYPE_INFO))
    {
      CFTypeRef v57 = IOHIDDeviceGetProperty(a1, @"Reset");
      int v58 = 136315394;
      v59 = "Reset";
      __int16 v60 = 2112;
      CFTypeRef Property = v57;
      _os_log_impl((void *)&_mh_execute_header, v56, OS_LOG_TYPE_INFO, "%s -- %@", (uint8_t *)&v58, 0x16u);
    }
  }

id sub_10000D2EC(uint64_t a1, void *a2)
{
  return [a2 containsHIDDevice:*(void *)(a1 + 32)];
}

void sub_10000DB68(id a1, SCATMenu *a2)
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(+[AXElement systemWideElement](&OBJC_CLASS___AXElement, "systemWideElement"));
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([v3 systemApplication]);
  [v2 performAction:5202];
}

void sub_10000DBB8(id a1, SCATMenu *a2)
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(+[AXElement systemWideElement](&OBJC_CLASS___AXElement, "systemWideElement"));
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([v3 systemApplication]);
  [v2 performAction:5204];
}

void sub_10000DC08(id a1, SCATMenu *a2)
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(+[AXElement systemWideElement](&OBJC_CLASS___AXElement, "systemWideElement"));
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([v3 systemApplication]);
  [v2 performAction:5203];
}

void sub_10000DC58(id a1, SCATMenu *a2)
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(+[AXElement systemWideElement](&OBJC_CLASS___AXElement, "systemWideElement"));
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([v3 systemApplication]);
  [v2 performAction:5205 withValue:&off_10012F700];
}

void sub_10000DCB0(id a1, SCATMenu *a2)
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(+[AXElement systemWideElement](&OBJC_CLASS___AXElement, "systemWideElement"));
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([v3 systemApplication]);
  [v2 performAction:5205 withValue:&off_10012F718];
}

void sub_10000DD08(id a1, SCATMenu *a2)
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(+[AXElement systemWideElement](&OBJC_CLASS___AXElement, "systemWideElement"));
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([v3 systemApplication]);
  [v2 performAction:5207];
}

void sub_10000DD58(id a1, SCATMenu *a2)
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(+[AXElement systemWideElement](&OBJC_CLASS___AXElement, "systemWideElement"));
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([v3 systemApplication]);
  [v2 performAction:5208];
}

BOOL sub_10000DDB4(id a1, SCATModernMenuItem *a2)
{
  return 0;
}

void sub_10000FD00(_Unwind_Exception *a1)
{
}

void sub_10000FD34(uint64_t a1)
{
  id v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 assistiveTouchOrbAction]);
  WeakRetained[1216] = v3 != 0LL;

  id v4 = objc_loadWeakRetained(v1);
  [v4 _updateSpeakScreenStatus];
}

void sub_10000FDB0(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _updateSpeakScreenStatus];
}

void sub_10000FDDC(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _updateSpeakScreenStatus];
}

void sub_10000FE08(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _updateSpeakScreenStatus];
}

void sub_10000FE34(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _updateSpeakScreenStatus];
}

id sub_100010300(uint64_t a1)
{
  return [*(id *)(a1 + 32) initializeScreenBounds];
}

void sub_100010858(uint64_t a1)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v2 postNotificationName:off_1001556D0 object:*(void *)(*(void *)(a1 + 32) + 64)];
}

LABEL_11:
    if (y >= 80.0
      || x <= 50.0
      || (+[HNDRocker nubbitSize](&OBJC_CLASS___HNDRocker, "nubbitSize"), uint64_t v16 = 0.0, x >= v8 - v17))
    {
      CFTypeRef v18 = y <= v10 + -80.0 || x <= 50.0;
      if (v18 || (+[HNDRocker nubbitSize](&OBJC_CLASS___HNDRocker, "nubbitSize"), __int16 v11 = x, v16 = v10, x >= v8 - v19))
      {
        if (x >= v8 * 0.5) {
          __int16 v11 = v8;
        }
        else {
          __int16 v11 = 0.0;
        }
        uint64_t v16 = y;
      }
    }

    else
    {
      __int16 v11 = x;
    }

    goto LABEL_24;
  }

  CFTypeRef v15 = v13 * 0.5;
  uint64_t v16 = 0.0;
  if (x - v15 < 30.0)
  {
    __int16 v11 = 0.0;
    goto LABEL_24;
  }

  if (x + v15 <= v8 + -30.0) {
    goto LABEL_11;
  }
LABEL_24:
  if (v4)
  {
    +[HNDRocker nubbitSize](&OBJC_CLASS___HNDRocker, "nubbitSize");
    __int16 v11 = v11 - v20 * 0.5;
    uint64_t v16 = v16 - v21 * 0.5;
  }

  uint64_t v22 = sub_10002ADC4((double)(int)(v11 + 0.5), (double)(int)(v16 + 0.5));
  result.y = v23;
  result.x = v22;
  return result;
}

  id v8 = ASTLogCommon(-[HNDRocker setLastMenuItemActivated:](self, "setLastMenuItemActivated:", v6));
  CFTypeRef v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v47 = v6;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Activate menu item up: %@", buf, 0xCu);
  }

  uint64_t v10 = 1;
LABEL_14:

  return v10;
}

  return v7;
}
}
}

  return v5;
}

  return (char)v3;
}

  return (char)v3;
}

  return (char)v3;
}

    CFTypeRef v21 = (UIView *)objc_claimAutoreleasedReturnValue(-[SCATCursorManager displayContextForCursor:](self, "displayContextForCursor:", v11));
    v30.origin.x = x;
    v30.origin.y = y;
    v30.size.width = width;
    v30.size.height = height;
    UIAccessibilityZoomFocusChanged((UIAccessibilityZoomType)3LL, v30, v21);
    goto LABEL_12;
  }

  return v6;
}
}

  return (char)v6;
}

void sub_1000119D8(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(+[HNDDefaults sharedDefaults](&OBJC_CLASS___HNDDefaults, "sharedDefaults"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", *(double *)(a1 + 32)));
  [v2 setPreference:v3 forKey:@"NubbitPositionPercentage"];

  id v5 = (id)objc_claimAutoreleasedReturnValue(+[HNDDefaults sharedDefaults](&OBJC_CLASS___HNDDefaults, "sharedDefaults"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  *(unsigned int *)(a1 + 40)));
  [v5 setPreference:v4 forKey:@"NubbitPositionEdge"];
}

id sub_100011B78(double *a1)
{
  double v2 = a1[5];
  double v3 = a1[6];
  [*(id *)(*((void *)a1 + 4) + 40) frame];
  double v5 = v4;
  [*(id *)(*((void *)a1 + 4) + 40) frame];
  return objc_msgSend(*(id *)(*((void *)a1 + 4) + 40), "setFrame:", v2, v3, v5, v6);
}

LABEL_22:
        uint64_t v10 = v26;
      }

      while ([v9 count]);
    }

    else
    {
      v26 = 0LL;
    }
  }

  else
  {
    v26 = 0LL;
  }

  return v26;
}
    }
  }

  v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", v10 + 1));
  CFTypeRef v48 = self->_pauseCountsByPid;
  uint64_t v49 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v3));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v48, "setObject:forKeyedSubscript:", v47, v49);
}

          self = v34;
          a4 = v35;
        }

        CFTypeRef v9 = (void *)objc_claimAutoreleasedReturnValue([v23 scatElement]);
      }

      else
      {
        CFTypeRef v9 = 0LL;
      }
    }
  }

  -[SCATMenu _updateOptionsIfNeeded:withResultElement:](self, "_updateOptionsIfNeeded:withResultElement:", a4, v9);

  return v9;
}

LABEL_71:
              self->_longPressActionActivated = 0;
              v96 = CGPointZero;
              self->_downPoint = CGPointZero;
              self->_nubbitStartDownPoint = v96;
              -[HNDDisplayManager _startIdleTimer](self, "_startIdleTimer");
              self->_maxOrbDuringTouch = 0.0;
              self->_playedHapticForCurrentEvent = 0;
              -[HNDRocker resetOrbAction](self->_rocker, "resetOrbAction");
              if (!-[HNDRocker style](self->_rocker, "style")) {
                -[HNDRocker showNubbitPressedState:](self->_rocker, "showNubbitPressedState:", 0LL);
              }
              -[HNDDisplayManager _hideLargeContentViewerIfNeeded](self, "_hideLargeContentViewerIfNeeded");
              -[HNDDisplayManager _didHandleRealUpEvent](self, "_didHandleRealUpEvent");
              v89 = 1;
LABEL_86:
              self->_lastHandType = [v5 eventType];
              if ((v89 & 1) != 0) {
                goto LABEL_94;
              }
              v106 = self->_downView;
              if (v106 == (HNDView *)v33) {
                goto LABEL_94;
              }
              -[HNDView handleFingerDriftedAway](v106, "handleFingerDriftedAway");
              objc_storeStrong(p_downView, v33);
              v107 = *p_downView;
              v109 = objc_opt_class(&v21[30], v108);
              isKindOfClass = objc_opt_isKindOfClass(v107, v109);
              v112 = *p_downView;
              if ((isKindOfClass & 1) != 0)
              {
                if ([*p_downView isBackButton])
                {
                  v113 = 0LL;
                  v114 = 0LL;
                }

                else
                {
                  v114 = *p_downView;
                  v113 = 1LL;
                }

                -[HNDRocker modalizeMenu:modalButton:](self->_rocker, "modalizeMenu:modalButton:", v113, v114);
                self->_lastMenuInteractionTime = CFAbsoluteTimeGetCurrent();
                if (!v89) {
                  goto LABEL_100;
                }
              }

              else
              {
                v115 = objc_opt_class(&v21[30], v111);
                if ((objc_opt_isKindOfClass(v112, v115) & 1) == 0
                  || ([*p_downView isModalDown] & 1) == 0)
                {
                  -[HNDRocker modalizeMenu:modalButton:](self->_rocker, "modalizeMenu:modalButton:", 0LL, 0LL);
                }

LABEL_94:
                if (!v89) {
                  goto LABEL_100;
                }
              }

              v116 = *p_downView;
              *p_downView = 0LL;

              if (v33 != (HNDRocker *)multiTouchBackgound)
              {
                uint64_t v19 = 1;
LABEL_106:

                goto LABEL_107;
              }

LABEL_100:
              if (v33) {
                v117 = v33 == (HNDRocker *)multiTouchBackgound;
              }
              else {
                v117 = 1;
              }
              uint64_t v19 = !v117;
              goto LABEL_106;
            default:
              goto LABEL_106;
          }
        }
      }
    }

    uint64_t v31 = v29;
    goto LABEL_23;
  }

  v17 = CGPointZero;
  self->_nubbitStartDownPoint = CGPointZero;
  self->_downPoint = v17;
  CFTypeRef v18 = self->_downView;
  self->_downView = 0LL;

  -[HNDDisplayManager _startIdleTimer](self, "_startIdleTimer");
  uint64_t v19 = 1;
LABEL_107:

  return v19;
}

void sub_100013718(uint64_t a1)
{
  *(_BYTE *)(*(void *)(a1 + 32) + 1232LL) = 1;
  *(_BYTE *)(*(void *)(a1 + 32) + 1048LL) = 0;
  double v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) handManager]);
  [v2 setNubbitMoving:0];

  double v3 = *(void **)(a1 + 32);
  double v4 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  double v5 = (void *)objc_claimAutoreleasedReturnValue([v4 assistiveTouchLongPressAction]);
  [v3 activateAssistiveTouchAction:v5 fromButtonPress:0];

  uint64_t v6 = ASTLogCommon([*(id *)(*(void *)(a1 + 32) + 1248) cancel]);
  uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "long press activated", v8, 2u);
  }
}

id sub_100013C78(uint64_t a1)
{
  return _[*(id *)(a1 + 32) _longIdleTimerFired];
}

id sub_100013D00(uint64_t a1)
{
  return _[*(id *)(a1 + 32) _idleTimerFired];
}

id sub_1000140A4(uint64_t a1)
{
  uint64_t v2 = ASTLogCommon(a1);
  double v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int v4 = *(unsigned __int8 *)(a1 + 40);
    v6[0] = 67109120;
    v6[1] = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_INFO,  "AST Handling orientation change: (hidden: %d)",  (uint8_t *)v6,  8u);
  }

  ++qword_1001575C8;
  id result = [*(id *)(*(void *)(a1 + 32) + 40) style];
  if (!(_DWORD)result && !*(_BYTE *)(a1 + 40)) {
    return [*(id *)(*(void *)(a1 + 32) + 40) setAlpha:0.001];
  }
  return result;
}

void sub_100014184(uint64_t a1)
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10001423C;
  v7[3] = &unk_100121D18;
  v3[0] = _NSConcreteStackBlock;
  v3[2] = sub_100014244;
  v3[3] = &unk_100121FD0;
  char v6 = *(_BYTE *)(a1 + 64);
  id v1 = *(void **)(a1 + 40);
  uint64_t v8 = *(void *)(a1 + 32);
  v3[1] = 3221225472LL;
  v3[4] = v8;
  double v2 = *(double *)(a1 + 48);
  uint64_t v5 = *(void *)(a1 + 56);
  id v4 = v1;
  +[UIView animateWithDuration:animations:completion:]( &OBJC_CLASS___UIView,  "animateWithDuration:animations:completion:",  v7,  v3,  v2);
}

id sub_10001423C(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateViewsForOrientation];
}

void sub_100014244(uint64_t a1)
{
  uint64_t v2 = ASTLogCommon(a1);
  double v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int v4 = *(unsigned __int8 *)(a1 + 56);
    *(_DWORD *)buf = 67109120;
    int v20 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_INFO,  "AST windows: set windows visible again (rocker hidden: %d)",  buf,  8u);
  }

  [*(id *)(*(void *)(a1 + 32) + 24) setHidden:0];
  [*(id *)(*(void *)(a1 + 32) + 32) setHidden:0];
  if (![*(id *)(*(void *)(a1 + 32) + 40) style] && !*(_BYTE *)(a1 + 56))
  {
    uint64_t v5 = *(void **)(a1 + 32);
    [v5 _nubbitPointForEdgePosition];
    objc_msgSend(v5, "_validateNubbitPosition:forKeyboard:", 0);
    double v8 = v6;
    double v9 = v7;
    uint64_t v10 = *(void *)(a1 + 32);
    if (*(_BYTE *)(v10 + 1176))
    {
      unsigned int v11 = objc_msgSend( (id)v10,  "_position:isOverKeyboard:",  v6,  v7,  *(double *)(v10 + 1184),  *(double *)(v10 + 1192),  *(double *)(v10 + 1200),  *(double *)(v10 + 1208));
      uint64_t v10 = *(void *)(a1 + 32);
      if (v11)
      {
        objc_msgSend( (id)v10,  "_nubbitPositionForKeyboardFrame:",  *(double *)(v10 + 1184),  *(double *)(v10 + 1192),  *(double *)(v10 + 1200),  *(double *)(v10 + 1208));
        double v8 = v12;
        double v9 = v13;
        uint64_t v10 = *(void *)(a1 + 32);
      }
    }

    objc_msgSend(*(id *)(v10 + 40), "transitionMenuToNubbit:changeAlpha:animate:", 0, 0, v8, v9);
  }

  v17[2] = sub_100014444;
  v17[3] = &unk_100121F80;
  v14 = *(void **)(a1 + 40);
  v17[4] = *(void *)(a1 + 32);
  char v18 = *(_BYTE *)(a1 + 56);
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[5] = *(void *)(a1 + 48);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_100014520;
  v15[3] = &unk_100121FA8;
  id v16 = v14;
  +[UIView animateWithDuration:animations:completion:]( &OBJC_CLASS___UIView,  "animateWithDuration:animations:completion:",  v17,  v15,  0.2);
}

void sub_100014444(uint64_t a1)
{
  if (!--qword_1001575C8)
  {
    uint64_t v2 = ASTLogCommon(a1);
    double v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      int v4 = *(unsigned __int8 *)(*(void *)(a1 + 32) + 1160LL);
      v6[0] = 67109120;
      v6[1] = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_INFO,  "AST: orientation finished: visuals still hidden? %d",  (uint8_t *)v6,  8u);
    }

    uint64_t v5 = *(void *)(a1 + 32);
    if (!*(_BYTE *)(v5 + 1160) && !*(_BYTE *)(a1 + 48)) {
      [*(id *)(v5 + 40) setAlpha:*(double *)(a1 + 40)];
    }
  }

uint64_t sub_100014520(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

LABEL_9:
  self->_isPressedDown = (_DWORD)v5 == 2;
}

    if (![v4 count]) {
      -[HNDHandManager setCaptureEvents:](self, "setCaptureEvents:", 0LL);
    }
  }

  else
  {
    _AXLogWithFacility(0LL, 0LL, 1LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0.0, 1, @"Could not remove nil event handler");
  }
}
}

  CFTypeRef v15 = (void *)objc_claimAutoreleasedReturnValue(-[SCATElementNavigationController axManager](self, "axManager"));
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v15 nextItemForScanningFromItem:v7 didWrap:&v23]);

  if (v23) {
    id v16 = v8;
  }
  else {
    id v16 = 1;
  }
  if ((v16 & 1) == 0)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue( -[SCATElementManager firstAuxiliaryElementWithRole:]( self,  "firstAuxiliaryElementWithRole:",  -[SCATElementManager roleForElement:](self, "roleForElement:", v7)));
    char v18 = v17;
    if (v17)
    {
      uint64_t v19 = v17;

      v23 = 0;
      uint64_t v10 = v19;
    }
  }

  CFTypeRef v15 = (void *)objc_claimAutoreleasedReturnValue(-[SCATElementNavigationController axManager](self, "axManager"));
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v15 previousItemForScanningFromItem:v7 didWrap:&v23]);

  if (v23) {
    id v16 = v8;
  }
  else {
    id v16 = 1;
  }
  if ((v16 & 1) == 0)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue( -[SCATElementManager lastAuxiliaryElementWithRole:]( self,  "lastAuxiliaryElementWithRole:",  -[SCATElementManager roleForElement:](self, "roleForElement:", v7)));
    char v18 = v17;
    if (v17)
    {
      uint64_t v19 = v17;

      v23 = 0;
      uint64_t v10 = v19;
    }
  }

  -[SCATElementNavigationController setLastScannedElementCommunity:](self, "setLastScannedElementCommunity:", v9);
}

    double v6 = 0LL;
    goto LABEL_22;
  }

  double v6 = (void *)objc_claimAutoreleasedReturnValue( -[SCATElementNavigationController _indexPathForKeyboardElement:]( self,  "_indexPathForKeyboardElement:",  v5));
  double v7 = (void *)objc_claimAutoreleasedReturnValue(+[AXSubsystemSCElementNav sharedInstance](&OBJC_CLASS___AXSubsystemSCElementNav, "sharedInstance"));
  double v8 = [v7 ignoreLogging];

  if ((v8 & 1) == 0)
  {
    double v12 = (void *)objc_claimAutoreleasedReturnValue(+[AXSubsystemSCElementNav identifier](&OBJC_CLASS___AXSubsystemSCElementNav, "identifier"));
    v14 = AXLoggerForFacility(v12, v13);
    CFTypeRef v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);

    id v16 = AXOSLogLevelFromAXLogLevel(3LL);
    if (!os_log_type_enabled(v15, v16))
    {
      double v9 = 0LL;
      goto LABEL_21;
    }

    v17 = AXColorizeFormatLog(3LL, @"Keyboard index path was %{public}@");
    char v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
    CFTypeRef v27 = v6;
    uint64_t v19 = _AXStringForArgs(v18);
    int v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v15, v16))
    {
      *(_DWORD *)buf = 138543362;
      v29 = v20;
      _os_log_impl((void *)&_mh_execute_header, v15, v16, "%{public}@", buf, 0xCu);
    }

    double v9 = 0LL;
LABEL_18:

LABEL_21:
    goto LABEL_22;
  }

  double v9 = 0LL;
LABEL_22:
  -[SCATElementNavigationController setKeyboardIndexPath:](self, "setKeyboardIndexPath:", v6, v27);
  -[SCATElementNavigationController setKeyboardKeyCenterPoint:](self, "setKeyboardKeyCenterPoint:", v9);
  -[SCATElementNavigationController setKeyboardSelectBehavior:]( self,  "setKeyboardSelectBehavior:",  [v4 selectBehavior]);
}

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[SCATMenu _restorationInfoForElement:](self, "_restorationInfoForElement:", v6));
    -[SCATMenu _updateWithElement:forceUpdate:](self, "_updateWithElement:forceUpdate:", v10, 0LL);
    if (v14)
    {
      double v13 = (void *)objc_claimAutoreleasedReturnValue( -[SCATMenu _elementWithRestorationInfo:options:]( self,  "_elementWithRestorationInfo:options:",  v14,  a4));

LABEL_15:
      goto LABEL_16;
    }

  return v10;
}

id sub_100014CB4(uint64_t a1)
{
  if ([*(id *)(*(void *)(a1 + 32) + 48) isActive])
  {
    double v2 = 0.0;
    if (!*(_BYTE *)(a1 + 40)) {
      double v2 = 1.0;
    }
    [*(id *)(*(void *)(a1 + 32) + 48) setAlpha:v2];
  }

  id result = [*(id *)(a1 + 32) alwaysShowMenu];
  if ((_DWORD)result)
  {
    double v4 = 0.0;
    if (!*(_BYTE *)(a1 + 40)) {
      double v4 = 1.0;
    }
    return [*(id *)(*(void *)(a1 + 32) + 40) setAlpha:v4];
  }

  return result;
}

id sub_1000150A0(uint64_t a1)
{
  double v2 = (void *)objc_claimAutoreleasedReturnValue( +[UIColor colorWithRed:green:blue:alpha:]( &OBJC_CLASS___UIColor,  "colorWithRed:green:blue:alpha:",  0.0,  0.0,  0.0,  0.01));
  [*(id *)(*(void *)(a1 + 32) + 88) setBackgroundColor:v2];

  return [*(id *)(*(void *)(a1 + 32) + 88) setAlpha:1.0];
}

id sub_100015104(uint64_t a1)
{
  double v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](&OBJC_CLASS___UIColor, "clearColor"));
  [*(id *)(*(void *)(a1 + 32) + 88) setBackgroundColor:v2];

  return [*(id *)(*(void *)(a1 + 32) + 88) setAlpha:0.0];
}

void sub_100015154(uint64_t a1)
{
  if (v2 != 0.0) {
    [*(id *)(a1 + 32) _updateRockerReachability];
  }
  id v4 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) handManager]);
  double v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) hardwareIdentifier]);
  [v4 resetFingersIfActiveOnDisplay:v3];
}

void sub_1000156D8(uint64_t a1)
{
  unsigned __int8 v2 = [*(id *)(*(void *)(a1 + 32) + 40) activateMenuItemDown:*(void *)(a1 + 40) fromButtonPress:*(unsigned __int8 *)(a1 + 48)];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_100015770;
  v5[3] = &unk_100122040;
  double v3 = *(void **)(a1 + 40);
  v5[4] = *(void *)(a1 + 32);
  id v6 = v3;
  char v7 = *(_BYTE *)(a1 + 48);
  unsigned __int8 v8 = v2;
  AXPerformBlockOnMainThreadAfterDelay(v5, v4, 0.1);
}

void sub_100015770(uint64_t a1)
{
  unsigned __int8 v2 = [*(id *)(*(void *)(a1 + 32) + 40) activateMenuItemUp:*(void *)(a1 + 40) fromButtonPress:*(unsigned __int8 *)(a1 + 48)];
  if (!*(_BYTE *)(a1 + 49) && (v2 & 1) == 0)
  {
    id v3 = (id)objc_claimAutoreleasedReturnValue(+[AXPISystemActionHelper sharedInstance](&OBJC_CLASS___AXPISystemActionHelper, "sharedInstance"));
    [v3 performActionForSystemAction:*(void *)(a1 + 40)];
  }

void sub_100015B18(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 1248) isCancelled];
  if ((_DWORD)v2 && *(void *)(a1 + 40))
  {
    uint64_t v3 = ASTLogCommon(v2);
    uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      LOWORD(v19) = 0;
      uint64_t v5 = "not activating single tap because double tap fired";
LABEL_9:
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, v5, (uint8_t *)&v19, 2u);
    }
  }

  else
  {
    if (!*(_BYTE *)(*(void *)(a1 + 32) + 1232LL) || !*(void *)(a1 + 48))
    {
      char v7 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
      uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue([v7 assistiveTouchMainScreenCustomization]);

      uint64_t v9 = ASTLogCommon(v8);
      uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        uint64_t v11 = *(void *)(a1 + 56);
        int v19 = 138412290;
        uint64_t v20 = v11;
        _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_INFO,  "Activating single tap action %@",  (uint8_t *)&v19,  0xCu);
      }

      double v12 = *(void **)(a1 + 56);
      if (v12 && ([v12 isEqualToString:AXAssistiveTouchIconTypeOpenMenu] & 1) == 0)
      {
        char v18 = *(void **)(a1 + 32);
        uint64_t v17 = *(void *)(a1 + 56);
      }

      else
      {
        if ([*(id *)(*(void *)(a1 + 32) + 40) customizationMapAllowInstanceActivation:v4])
        {
          uint64_t v13 = AXAssistiveTouchLocationsForLayout(1LL);
          v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
          CFTypeRef v15 = (void *)objc_claimAutoreleasedReturnValue([v14 firstObject]);
          id v16 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s objectForKeyedSubscript:](v4, "objectForKeyedSubscript:", v15));

          [*(id *)(a1 + 32) activateAssistiveTouchAction:v16 fromButtonPress:0];
          goto LABEL_20;
        }

        uint64_t v17 = *(void *)(a1 + 56);
        if (!v17) {
          goto LABEL_20;
        }
        char v18 = *(void **)(a1 + 32);
      }

      [v18 activateAssistiveTouchAction:v17 fromButtonPress:0];
      goto LABEL_20;
    }

    uint64_t v6 = ASTLogCommon(v2);
    uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      LOWORD(v19) = 0;
      uint64_t v5 = "not activating single tap because long press fired";
      goto LABEL_9;
    }
  }

LABEL_20:
}

  v23 = 0;
LABEL_46:

  return v23;
}
}
}

id sub_100016668(uint64_t a1)
{
  return [*(id *)(a1 + 32) _presentLargeContentViewerForHUDItem:*(void *)(a1 + 40) inContentView:*(void *)(a1 + 48)];
}

id sub_100016860(uint64_t a1)
{
  return [*(id *)(a1 + 32) removeFromSuperview];
}

void sub_100016B2C( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

LABEL_42:
            }

        id v16 = 0LL;
        goto LABEL_14;
      }

      v41 = [v6 isEqualToString:AXSSwitchControlMenuItemDeviceSOS];
      if ((_DWORD)v41)
      {
        if (AXDeviceIsSOSAvailable(v41, v42))
        {
          v101[0] = @"device_SOS";
          v100[0] = @"identifier";
          v100[1] = @"title";
          uint64_t v43 = sub_10002B014(@"SOS");
          uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(v43);
          v101[1] = v9;
          v101[2] = &off_10012FBB0;
          v100[2] = @"activateBehavior";
          v100[3] = @"guidedAccess";
          v101[3] = &__kCFBooleanTrue;
          uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v101,  v100,  4LL));
          v102 = v10;
          uint64_t v11 = &v102;
          goto LABEL_11;
        }

        goto LABEL_42;
      }

      if ([v6 isEqualToString:AXSSwitchControlMenuItemDeviceInterDevice])
      {
        v44 = (void *)objc_claimAutoreleasedReturnValue([v7 delegate]);
        CFTypeRef v45 = [v44 canSearchForControllableDevicesWithMenu:v7];

        if (v45)
        {
          v98[0] = @"device_multiDeviceSelectReceiver";
          v97[0] = @"identifier";
          v97[1] = @"title";
          uint64_t v46 = sub_10002B014(@"CONNECT_TO_RECEIVER");
          uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(v46);
          v98[1] = v9;
          v98[2] = @"SCATIcon_interdevice_useOtherDevice";
          v97[2] = @"imageName";
          v97[3] = @"activateBehavior";
          v98[3] = &off_10012FB98;
          uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v98,  v97,  4LL));
          v99 = v10;
          uint64_t v11 = &v99;
          goto LABEL_11;
        }

        CFTypeRef v48 = (void *)objc_claimAutoreleasedReturnValue([v7 delegate]);
        uint64_t v49 = [v48 canReturnControlToForwarderDevice:v7];

        if (v49)
        {
          v95[0] = @"device_multiDeviceReturnToForwarder";
          v94[0] = @"identifier";
          v94[1] = @"title";
          v50 = sub_10002B014(@"DISCONNECT_FROM_FORWARDER");
          uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(v50);
          v95[1] = v9;
          v95[2] = @"SCATIcon_interdevice_cancel";
          v94[2] = @"imageName";
          v94[3] = @"activateBehavior";
          v95[3] = &off_10012FBE0;
          uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v95,  v94,  4LL));
          v96 = v10;
          uint64_t v11 = &v96;
          goto LABEL_11;
        }

        goto LABEL_42;
      }

      if ([v6 isEqualToString:AXSSwitchControlMenuItemDeviceSysdiagnose])
      {
        v92[0] = @"device_sysdiagnose";
        v91[0] = @"identifier";
        v91[1] = @"title";
        v47 = sub_10002B014(@"SYSDIAGNOSE");
        uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(v47);
        v92[1] = v9;
        v92[2] = &off_10012FBE0;
        v91[2] = @"activateBehavior";
        v91[3] = @"guidedAccess";
        v92[3] = &__kCFBooleanTrue;
        uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v92,  v91,  4LL));
        v93 = v10;
        uint64_t v11 = &v93;
        goto LABEL_11;
      }

      if ([v6 isEqualToString:AXSSwitchControlMenuItemDeviceRebootDevice])
      {
        v89[0] = @"device_restart";
        v88[0] = @"identifier";
        v88[1] = @"title";
        CFTypeRef v51 = sub_10002B014(@"REBOOT_DEVICE");
        uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(v51);
        v88[2] = @"activateBehavior";
        v89[1] = v9;
        v89[2] = &off_10012FBE0;
        uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v89,  v88,  3LL));
        v90 = v10;
        uint64_t v11 = &v90;
        goto LABEL_11;
      }

      if (![v6 isEqualToString:AXSSwitchControlMenuItemDeviceToggleDock])
      {
        if ([v6 isEqualToString:AXSSwitchControlMenuItemDeviceArmApplePay])
        {
          if (AXDeviceCanArmApplePay())
          {
            v83[0] = @"device_applePay";
            v82[0] = @"identifier";
            v82[1] = @"title";
            v53 = sub_10002B014(@"APPLE_PAY");
            uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(v53);
            v82[2] = @"activateBehavior";
            v83[1] = v9;
            v83[2] = &off_10012FBE0;
            uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v83,  v82,  3LL));
            v84 = v10;
            uint64_t v11 = &v84;
            goto LABEL_11;
          }
        }

        else
        {
          if ([v6 isEqualToString:AXSSwitchControlMenuItemDeviceToggleCommandAndControl])
          {
            v79[0] = @"identifier";
            v79[1] = @"imageName";
            v80[0] = @"device_commandAndControl";
            v80[1] = @"IconCommandAndControl";
            v79[2] = @"title";
            CFTypeRef v54 = sub_10002B014(@"COMMAND_AND_CONTROL");
            uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(v54);
            v79[3] = @"activateBehavior";
            v80[2] = v9;
            v80[3] = &off_10012FBE0;
            uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v80,  v79,  4LL));
            v81 = v10;
            uint64_t v11 = &v81;
            goto LABEL_11;
          }

          uint64_t v55 = [v6 isEqualToString:AXSSwitchControlMenuItemCameraButton];
          if ((_DWORD)v55)
          {
            if (AXDeviceSupportsCameraButton(v55, v56))
            {
              v77[0] = @"device_cameraButton";
              v76[0] = @"identifier";
              v76[1] = @"title";
              CFTypeRef v57 = sub_10002B1B4(@"CAMERA_BUTTON");
              uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(v57);
              v77[1] = v9;
              v77[2] = @"SCATIcon_device_cameraButton";
              v76[2] = @"imageName";
              v76[3] = @"activateBehavior";
              v77[3] = &off_10012FBB0;
              uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v77,  v76,  4LL));
              v78 = v10;
              uint64_t v11 = &v78;
              goto LABEL_11;
            }
          }

          else
          {
            int v58 = [v6 isEqualToString:AXSSwitchControlMenuItemCameraButtonLightPress];
            if ((_DWORD)v58)
            {
              if (AXDeviceSupportsCameraButton(v58, v59))
              {
                v74[0] = @"device_cameraButtonLightPress";
                v73[0] = @"identifier";
                v73[1] = @"title";
                __int16 v60 = sub_10002B1B4(@"CAMERA_BUTTON_LIGHT_PRESS");
                uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(v60);
                v74[1] = v9;
                v74[2] = @"SCATIcon_device_cameraButton";
                v73[2] = @"imageName";
                v73[3] = @"activateBehavior";
                v74[3] = &off_10012FBB0;
                uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v74,  v73,  4LL));
                v75 = v10;
                uint64_t v11 = &v75;
                goto LABEL_11;
              }
            }

            else
            {
              v61 = [v6 isEqualToString:AXSSwitchControlMenuItemCameraButtonDoubleLightPress];
              if ((_DWORD)v61)
              {
                if (AXDeviceSupportsCameraButton(v61, v62))
                {
                  v71[0] = @"device_cameraButtonDoubleLightPress";
                  v70[0] = @"identifier";
                  v70[1] = @"title";
                  v63 = sub_10002B1B4(@"CAMERA_BUTTON_DOUBLE_LIGHT_PRESS");
                  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(v63);
                  v71[1] = v9;
                  v71[2] = @"SCATIcon_device_cameraButton";
                  v70[2] = @"imageName";
                  v70[3] = @"activateBehavior";
                  v71[3] = &off_10012FBB0;
                  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v71,  v70,  4LL));
                  v72 = v10;
                  uint64_t v11 = &v72;
                  goto LABEL_11;
                }
              }

              else
              {
                v64 = [v6 isEqualToString:AXSSwitchControlMenuItemVisualIntelligence];
                if ((_DWORD)v64)
                {
                  if (AXDeviceSupportsCameraButton(v64, v65)
                    && AXDeviceHasGreyMatterEnabled())
                  {
                    v68[0] = @"device_visualIntelligence";
                    v67[0] = @"identifier";
                    v67[1] = @"title";
                    v66 = sub_10002B1B4(@"CAMERA_BUTTON_VISUAL_INTELLIGENCE");
                    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(v66);
                    v67[2] = @"activateBehavior";
                    v68[1] = v9;
                    v68[2] = &off_10012FBB0;
                    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v68,  v67,  3LL));
                    v69 = v10;
                    uint64_t v11 = &v69;
                    goto LABEL_11;
                  }
                }

                else
                {
                  _AXAssert( v64,  "/Library/Caches/com.apple.xbs/Sources/AssistiveTouch/SCATModernMenuItemDeviceFactory.m",  418LL,  "+[SCATModernMenuItemDeviceFactory itemDetailsForItem:menu:]",  @"Unhandled menu item type for device menu: %@");
                }
              }
            }
          }
        }

        goto LABEL_42;
      }

      v86[0] = @"device_dock";
      v85[0] = @"identifier";
      v85[1] = @"imageName";
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString sc_deviceIconNameForIdentifier:]( &OBJC_CLASS___NSString,  "sc_deviceIconNameForIdentifier:"));
      v86[1] = v9;
      v85[2] = @"title";
      uint64_t v52 = sub_10002B014(@"DOCK");
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(v52);
      v85[3] = @"activateBehavior";
      v86[2] = v10;
      v86[3] = &off_10012FBE0;
      CFTypeRef v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v86,  v85,  4LL));
      v87 = v24;
      uint64_t v25 = &v87;
    }

LABEL_43:
          }
        }

LABEL_44:
        break;
      default:
        CFTypeRef v21 = @"Select behavior was not recognized";
        uint64_t v22 = 782LL;
LABEL_19:
        _AXAssert( 0LL,  "/Library/Caches/com.apple.xbs/Sources/AssistiveTouch/Source/Scanner/SCATDriver.m",  v22,  "-[SCATDriver _fireSelectActionWithCount:preferrsMenuOnFirstPress:]",  v21);
        goto LABEL_20;
    }

    goto LABEL_45;
  }

id sub_100018D70(uint64_t a1)
{
  id result = [*(id *)(a1 + 32) isActive];
  if ((_DWORD)result)
  {
    *(_BYTE *)(*(void *)(a1 + 32) + 16LL) = 1;
    return _[*(id *)(a1 + 32) _idleTimerDidFire];
  }

  return result;
}

void sub_100019270(id a1)
{
  id v1 = objc_alloc_init(&OBJC_CLASS___HNDHandManager);
  id v2 = (void *)qword_1001575D0;
  qword_1001575D0 = (uint64_t)v1;
}

void sub_1000194C4( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
}

id sub_1000194DC(uint64_t a1)
{
  return [*(id *)(a1 + 32) _startOrientationUpdateTimer];
}

id sub_10001970C(uint64_t a1, void *a2)
{
  return [a2 setAlwaysShowMenu:*(unsigned __int8 *)(a1 + 32)];
}

void sub_1000199FC(_Unwind_Exception *a1)
{
}

void sub_100019A38(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) assistiveTouchOpenMenuSwaggleEnabled];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained setOpenMenuWithSwaggle:v2];
}

void sub_100019A80(uint64_t a1)
{
  double v3 = v2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained setTouchSpeed:v3];
}

void sub_100019AD0(uint64_t a1)
{
  id v3 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) assistiveTouchCustomGestures]);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained setCustomGestures:v3];
}

void sub_100019B20(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained updateMenuVisibility];
}

void sub_100019B4C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _setApplicationAccessibilityEnabledIfNeeded];
}

void sub_100019D48( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
}

void sub_100019D6C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained refreshOrientation];
}

void sub_100019F00(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  _DWORD v6[2] = sub_100019F78;
  v6[3] = &unk_100122168;
  uint64_t v4 = *(void *)(a1 + 32);
  id v7 = v3;
  uint64_t v8 = v4;
  id v5 = v3;
  [v5 restartWithCompletion:v6];
}

void sub_100019F78(uint64_t a1, uint64_t a2)
{
  if (_AXSAssistiveTouchScannerEnabled(a1, a2))
  {
    +[SCATScannerManager updateElementCacheScheme](&OBJC_CLASS___SCATScannerManager, "updateElementCacheScheme");
    AXPerformBlockAsynchronouslyOnMainThread(&stru_100122140);
  }

  id v3 = *(void **)(a1 + 32);
  id v4 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) deviceManager]);
  objc_msgSend(v3, "deviceCountChanged:", objc_msgSend(v4, "deviceCount"));
}

void sub_100019FE0(id a1)
{
  id v1 = (void *)objc_claimAutoreleasedReturnValue(+[SCATScannerManager sharedManager](&OBJC_CLASS___SCATScannerManager, "sharedManager"));
  [v1 loadScanner];

  id v2 = (id)objc_claimAutoreleasedReturnValue(+[SCATScannerManager sharedManager](&OBJC_CLASS___SCATScannerManager, "sharedManager"));
  [v2 beginScanningWithFocusContext:0];
}

id sub_10001A1B0(uint64_t a1)
{
  return objc_msgSend( *(id *)(a1 + 32),  "moveFingersToPointInFingerCoordinateSpace:onDisplay:allowOutOfBounds:",  *(void *)(a1 + 40),  *(unsigned __int8 *)(a1 + 64),  *(double *)(a1 + 48),  *(double *)(a1 + 56));
}

void sub_10001A3BC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, char a27, uint64_t a28, uint64_t a29, uint64_t a30, char a31)
{
}

void sub_10001A3EC(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v19 = a2;
  [v19 location];
  if (a3)
  {
    *(double *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 32LL) = v7
    [v19 location];
    *(double *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL) = v9
  }

  else
  {
    uint64_t v10 = *(void *)(*(void *)(a1 + 56) + 8LL);
    *(double *)(v10 + 32) = v7;
    *(void *)(v10 + 40) = v8;
  }

  uint64_t v11 = *(void *)(*(void *)(a1 + 48) + 8LL);
  double v12 = *(double *)(a1 + 72) + *(double *)(v11 + 32);
  double v13 = *(double *)(a1 + 80) + *(double *)(v11 + 40);
  if (*(_BYTE *)(a1 + 88)
    || (v14 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) fingerContainerView]),
        [v14 bounds],
        v21.x = v12,
        v21.y = v13,
        BOOL v15 = CGRectContainsPoint(v22, v21),
        v14,
        v15))
  {
    id v16 = *(void **)(a1 + 40);
    v20.x = v12;
    v20.y = v13;
    uint64_t v17 = NSStringFromCGPoint(v20);
    char v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
    [v16 addObject:v18];
  }

  else
  {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 24LL) = 0;
    *a4 = 1;
  }
}

void sub_10001A510(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = *(void **)(a1 + 32);
  id v8 = a2;
  uint64_t v6 = (NSString *)objc_claimAutoreleasedReturnValue([v5 objectAtIndexedSubscript:a3]);
  CGPoint v7 = CGPointFromString(v6);

  objc_msgSend(v8, "setLocation:", v7.x, v7.y);
  [v8 setShape:*(void *)(a1 + 40)];
}

id sub_10001A9B4(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) fingerController]);
  [v2 liftFingersUpAnimated:1];

  *(_BYTE *)(*(void *)(a1 + 40) + 128LL) = 0;
  [*(id *)(a1 + 32) setMultiTouchToolBackgroundEnabled:0];
  objc_msgSend(*(id *)(a1 + 32), "updateWithPrimaryFingerPoint:");
  *(_OWORD *)(*(void *)(a1 + 40) + 112LL) = HNDPointNull;
  if ([*(id *)(a1 + 40) _shouldRepeatGesture])
  {
    id v4 = *(_BYTE **)(a1 + 40);
    if (*(_BYTE *)(a1 + 72) && !v4[129]) {
      return [v4 startDragModeOnDisplay:*(void *)(a1 + 48)];
    }
  }

  else
  {
    id v4 = *(_BYTE **)(a1 + 40);
  }

  v4[129] = 0;
  return [*(id *)(a1 + 32) resetNubbitLocation];
}

id *sub_10001AA74(id *result)
{
  if (*((_BYTE *)result[4] + 129)) {
    return (id *)objc_msgSend(result[5], "moveNubbitToPoint:");
  }
  return result;
}

id *sub_10001AA8C(id *result)
{
  if (*((_BYTE *)result[4] + 129)) {
    return (id *)[result[5] setNubbitMoving:1];
  }
  return result;
}

id sub_10001AAA8(uint64_t a1)
{
  return objc_msgSend( *(id *)(a1 + 32),  "moveFingersToPointInFingerCoordinateSpace:onDisplay:allowOutOfBounds:",  *(void *)(a1 + 40),  0,  *(double *)(a1 + 56),  *(double *)(a1 + 64));
}

void sub_10001AAE0(uint64_t a1)
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10001AB80;
  v4[3] = &unk_100122280;
  id v2 = *(id *)(a1 + 64);
  v4[4] = *(void *)(a1 + 40);
  id v5 = v2;
  AXPerformBlockOnMainThreadAfterDelay(v4, v3, 0.3);
}

uint64_t sub_10001AB80(uint64_t a1)
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16LL))();
  *(_BYTE *)(*(void *)(a1 + 32) + 130LL) = 0;
  return result;
}

void sub_10001ADF4(id a1)
{
  id v1 = (void *)qword_1001575E8;
  qword_1001575E8 = (uint64_t)&off_10012F538;
}

uint64_t sub_10001AFA8(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void sub_10001B05C(uint64_t a1)
{
  v83 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  v85 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  v82 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  v86 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  id v1 = (void *)objc_claimAutoreleasedReturnValue(+[AXElement primaryApp](&OBJC_CLASS___AXElement, "primaryApp"));
  id v2 = (void *)objc_claimAutoreleasedReturnValue([v1 scrollViewsForAutoScroll]);

  if ([v2 count])
  {
    uint64_t v4 = 0LL;
    id v89 = 0LL;
    id v90 = 0LL;
    CGFloat y = CGRectZero.origin.y;
    CGFloat width = CGRectZero.size.width;
    CGFloat height = CGRectZero.size.height;
    *(void *)&__int128 v3 = 136315906LL;
    __int128 v80 = v3;
    while (1)
    {
      id v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectAtIndexedSubscript:", v4, v80));
      double v9 = (void *)objc_claimAutoreleasedReturnValue([v8 uiElement]);
      unsigned int v10 = [v9 canPerformAXAction:2007];

      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v8 uiElement]);
      unsigned int v12 = [v11 canPerformAXAction:2006];

      double v13 = (void *)objc_claimAutoreleasedReturnValue([v8 uiElement]);
      unsigned int v14 = [v13 canPerformAXAction:2008];

      BOOL v15 = (void *)objc_claimAutoreleasedReturnValue([v8 uiElement]);
      unsigned int v16 = [v15 canPerformAXAction:2009];

      [v8 visibleFrame];
      v107.origin.x = CGRectZero.origin.x;
      v107.origin.CGFloat y = y;
      v107.size.CGFloat width = width;
      v107.size.CGFloat height = height;
      if (CGRectEqualToRect(v105, v107))
      {
        int v17 = 0;
        goto LABEL_16;
      }

      [v8 visibleFrame];
      BOOL IsInfinite = CGRectIsInfinite(v106);
      int v17 = !IsInfinite;
      if (IsInfinite || !(v10 | v12 | v14 | v16)) {
        goto LABEL_16;
      }
      if (([v8 respondsToUserInteraction] & 1) == 0)
      {
        int v17 = 1;
LABEL_16:
        uint64_t v27 = AXLogCommon();
        unint64_t v24 = objc_claimAutoreleasedReturnValue(v27);
        if (os_log_type_enabled((os_log_t)v24, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315650;
          uint64_t v28 = @"NO";
          if (v17) {
            uint64_t v28 = @"YES";
          }
          v98 = "-[HNDHandManager generateContinuousScrollersOnQueue:withCompletion:]_block_invoke";
          __int16 v99 = 2112;
          v100 = v8;
          __int16 v101 = 2112;
          v102 = v28;
          _os_log_debug_impl( (void *)&_mh_execute_header,  (os_log_t)v24,  OS_LOG_TYPE_DEBUG,  "%s: skipping scroll view: %@, elementFrameIsValid: %@",  buf,  0x20u);
        }

        goto LABEL_17;
      }

      if (v10 | v12)
      {
        uint64_t v19 = 2LL;
        if (!v10) {
          uint64_t v19 = 0LL;
        }
        uint64_t v20 = 4LL;
        if (!v12) {
          uint64_t v20 = 0LL;
        }
        uint64_t v87 = v20 | v19;
        id v81 = v85;

        id v21 = v86;
        CGRect v22 = *(void **)(a1 + 32);
        id v96 = 0LL;
        unsigned __int8 v23 = [v22 _scrollAncestorIsSelfForScrollView:v8 scrollAction:2006 resultScrollAncestor:&v96];
        unint64_t v24 = (unint64_t)v96;
        if ((v23 & 1) != 0)
        {
          uint64_t v84 = 0LL;
          unint64_t v25 = 0LL;
          id v89 = v21;
          id v90 = v81;
          v26 = &OBJC_CLASS___AXDispatchTimer_ptr;
          goto LABEL_41;
        }

        v29 = *(void **)(a1 + 32);
        id v95 = 0LL;
        unsigned __int8 v30 = [v29 _scrollAncestorIsSelfForScrollView:v8 scrollAction:2007 resultScrollAncestor:&v95];
        unint64_t v25 = (unint64_t)v95;
        if (((v14 | v16) & 1) == 0)
        {
          uint64_t v84 = 0LL;
          id v89 = v21;
          id v90 = v81;
          v26 = &OBJC_CLASS___AXDispatchTimer_ptr;
          if ((v30 & 1) != 0) {
            goto LABEL_41;
          }
LABEL_37:
          if (v24 | v25)
          {
            CFTypeRef v42 = (void *)v25;
            uint64_t v43 = AXLogCommon();
            v44 = (os_log_s *)objc_claimAutoreleasedReturnValue(v43);
            if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = v80;
              v98 = "-[HNDHandManager generateContinuousScrollersOnQueue:withCompletion:]_block_invoke";
              __int16 v99 = 2112;
              v100 = v8;
              __int16 v101 = 2112;
              v102 = (const __CFString *)v24;
              __int16 v103 = 2112;
              v104 = v42;
              _os_log_debug_impl( (void *)&_mh_execute_header,  v44,  OS_LOG_TYPE_DEBUG,  "%s: scrollAncestor is different! scrollView: %@ \n scrollAncestor1: %@ \n scrollAncestor2: %@",  buf,  0x2Au);
            }

            goto LABEL_43;
          }

          unint64_t v24 = 0LL;
          unint64_t v25 = 0LL;
          goto LABEL_41;
        }

        v26 = &OBJC_CLASS___AXDispatchTimer_ptr;
        if ((v30 & 1) != 0)
        {
          uint64_t v84 = 0LL;
          id v89 = v21;
          id v90 = v81;
          goto LABEL_41;
        }

        id v89 = v21;
        id v90 = v81;
      }

      else
      {
        unint64_t v25 = 0LL;
        unint64_t v24 = 0LL;
        uint64_t v87 = 0LL;
        v26 = &OBJC_CLASS___AXDispatchTimer_ptr;
      }

      uint64_t v31 = (void *)v25;
      CFTypeRef v33 = v89;
      v32 = v90;
      uint64_t v34 = (void *)v24;
      uint64_t v35 = 8LL;
      if (!v14) {
        uint64_t v35 = 0LL;
      }
      uint64_t v36 = 16LL;
      if (!v16) {
        uint64_t v36 = 0LL;
      }
      uint64_t v87 = v36 | v35;
      id v90 = v83;

      id v89 = v82;
      uint64_t v37 = *(void **)(a1 + 32);
      id v94 = (id)v24;
      unsigned __int8 v38 = [v37 _scrollAncestorIsSelfForScrollView:v8 scrollAction:2008 resultScrollAncestor:&v94];
      unint64_t v24 = (unint64_t)v94;

      if ((v38 & 1) != 0)
      {
        uint64_t v84 = 1LL;
        v26 = &OBJC_CLASS___AXDispatchTimer_ptr;
        unint64_t v25 = (unint64_t)v31;
        goto LABEL_41;
      }

      CFTypeRef v39 = *(void **)(a1 + 32);
      id v93 = v31;
      unsigned __int8 v40 = [v39 _scrollAncestorIsSelfForScrollView:v8 scrollAction:2009 resultScrollAncestor:&v93];
      id v41 = v93;

      uint64_t v84 = 1LL;
      unint64_t v25 = (unint64_t)v41;
      v26 = &OBJC_CLASS___AXDispatchTimer_ptr;
      if ((v40 & 1) == 0) {
        goto LABEL_37;
      }
LABEL_41:
      CFTypeRef v42 = (void *)v25;
      CFTypeRef v45 = v26[94];
      uint64_t v46 = v26;
      [v8 visibleFrame];
      v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "valueWithCGRect:"));
      unsigned __int8 v48 = [v90 containsObject:v47];

      if ((v48 & 1) == 0)
      {
        [v8 visibleFrame];
        double v50 = v49;
        double v52 = v51;
        double v54 = v53;
        double v56 = v55;
        CFTypeRef v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46[94], "valueWithCGRect:"));
        [v90 addObject:v57];

        id v58 = [v8 windowDisplayId];
        v59 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) displayManagerForDisplayId:v58]);
        objc_msgSend(v59, "orientedContinuousScrollViewFrameForScrollViewFrame:", v50, v52, v54, v56);
        double v61 = v60;
        double v63 = v62;
        double v65 = v64;
        double v67 = v66;

        v44 = -[HNDContinuousScroller initWithTargetElement:scrollView:orientedScrollViewFrame:scrollAxis:supportedScrollDirections:]( objc_alloc(&OBJC_CLASS___HNDContinuousScroller),  "initWithTargetElement:scrollView:orientedScrollViewFrame:scrollAxis:supportedScrollDirections:",  v8,  v8,  v84,  v87,  v61,  v63,  v65,  v67);
        v68 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) displayManagerForDisplayId:v58]);
        [v68 screenBounds];
        double v70 = v69;
        double v72 = v71;
        double v74 = v73;
        double v76 = v75;

        -[os_log_s extendActivationRegionWithoutCollidingWithScrollers:rotatedScreenBounds:]( v44,  "extendActivationRegionWithoutCollidingWithScrollers:rotatedScreenBounds:",  v89,  v70,  v72,  v74,  v76);
        [v89 addObject:v44];
LABEL_43:
      }

LABEL_17:
    }
  }

  id v89 = 0LL;
  id v90 = 0LL;
LABEL_46:
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 232LL));
  id v77 = [v82 copy];
  [*(id *)(a1 + 32) setHorizontalContinuousScrollers:v77];

  id v78 = [v86 copy];
  [*(id *)(a1 + 32) setVerticalContinuousScrollers:v78];

  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 232LL));
  v79 = *(void **)(a1 + 40);
  if (v79)
  {
    v91[0] = _NSConcreteStackBlock;
    v91[1] = 3221225472LL;
    v91[2] = sub_10001B7C8;
    v91[3] = &unk_1001222F0;
    id v92 = v79;
    AXPerformBlockAsynchronouslyOnMainThread(v91);
  }
}

uint64_t sub_10001B7C8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_10001BB1C(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = 280LL;
  if (*(void *)(v2 + 296) == 1LL) {
    uint64_t v3 = 272LL;
  }
  id v4 = [*(id *)(v2 + v3) count];
  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 232LL));
  if (!v4)
  {
    [*(id *)(a1 + 32) endContinuousScrollingOnDisplay:*(void *)(a1 + 40) withCompletion:0];
    [*(id *)(a1 + 32) showMenu:1 onDisplay:*(void *)(a1 + 40)];
  }

LABEL_45:
}

  double v54 = 0u;
  double v55 = 0u;
  double v52 = 0u;
  double v53 = 0u;
  CFTypeRef v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "postActivationScanLocations", 0));
  uint64_t v34 = [v33 countByEnumeratingWithState:&v52 objects:v68 count:16];
  if (v34)
  {
    uint64_t v35 = v34;
    uint64_t v36 = *(void *)v53;
    uint64_t v37 = AXSSSwitchControlPostActivationScanLocationCurrentItem;
    unsigned __int8 v38 = AXSSSwitchControlPostActivationScanLocationDefault;
    CFTypeRef v39 = 1LL;
    while (2)
    {
      for (j = 0LL; j != v35; j = (char *)j + 1)
      {
        if (*(void *)v53 != v36) {
          objc_enumerationMutation(v33);
        }
        id v41 = *(void **)(*((void *)&v52 + 1) + 8LL * (void)j);
        if ([v41 isEqualToString:v38])
        {
          CFTypeRef v39 = 0LL;
LABEL_56:
          [v2 setSwitchControlScanAfterTapLocation:v39];
          goto LABEL_57;
        }
      }

      uint64_t v35 = [v33 countByEnumeratingWithState:&v52 objects:v68 count:16];
      if (v35) {
        continue;
      }
      break;
    }
  }

      break;
    }
  }

  id v58 = -[HNDRuntimeManager systemAppReady](self, "systemAppReady");
  if (!v58)
  {
    double v62 = ASTLogCommon(v58);
    double v63 = (os_log_s *)objc_claimAutoreleasedReturnValue(v62);
    if (os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(location[0]) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v63,  OS_LOG_TYPE_DEFAULT,  "System app not running. Exiting.",  (uint8_t *)location,  2u);
    }

LABEL_52:
    double v61 = 0;
    goto LABEL_53;
  }

LABEL_48:
  v59 = (void *)objc_claimAutoreleasedReturnValue(+[SCATScannerManager sharedManager](&OBJC_CLASS___SCATScannerManager, "sharedManager"));
  [v59 setDelegate:self];

  -[HNDHandManager screenFrame:]_0(v60);
  double v61 = 1;
LABEL_53:

  return v61;
}

LABEL_14:
  -[HNDHandManager setContinuousScrollPickedElement:](self, "setContinuousScrollPickedElement:", v7);
  return v8;
}

  id v5 = 0LL;
  return v5;
}

  return v7;
}
}

    return;
  }

  if (self->_animatingNubbit)
  {
    uint64_t v20 = ASTLogCommon(v19);
    id v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      CGRect v22 = "Skipping transitionMenuToNubbit because nubbit is still animating";
LABEL_13:
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, v22, buf, 2u);
      goto LABEL_14;
    }

    goto LABEL_14;
  }

  -[HNDRocker frame](self, "frame");
  if (v25 == x
    && v24 == y
    && (-[HNDRocker bounds](self, "bounds"),
        uint64_t v27 = v26,
        v29 = v28,
        unsigned __int8 v30 = +[HNDRocker nubbitSize](&OBJC_CLASS___HNDRocker, "nubbitSize"),
        v27 == v32)
    && v29 == v31)
  {
    CFTypeRef v33 = ASTLogCommon(v30);
    uint64_t v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
    if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
    {
      v52.x = x;
      v52.CGFloat y = y;
      uint64_t v35 = NSStringFromCGPoint(v52);
      uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue(v35);
      +[HNDRocker nubbitSize](&OBJC_CLASS___HNDRocker, "nubbitSize");
      uint64_t v37 = NSStringFromCGSize(v53);
      unsigned __int8 v38 = (void *)objc_claimAutoreleasedReturnValue(v37);
      *(_DWORD *)buf = 138412546;
      unsigned __int8 v48 = v36;
      double v49 = 2112;
      *(void *)double v50 = v38;
      _os_log_impl( (void *)&_mh_execute_header,  v34,  OS_LOG_TYPE_INFO,  "Skipping transitionMenuToNubbit because current origin == %@ and size == %@",  buf,  0x16u);
    }

    -[HNDRocker highlightNubbit](self, "highlightNubbit");
  }

  else
  {
    -[NSMutableArray enumerateObjectsUsingBlock:](self->_rockerItems, "enumerateObjectsUsingBlock:", &stru_100123240);
    nubbitForeground = self->_nubbitForeground;
    if (!nubbitForeground) {
      -[HNDRocker _initializeNubbit](self, "_initializeNubbit");
    }
    self->_isFullMenuVisible = 0;
    -[HNDRocker setStyle:](self, "setStyle:", 0LL);
    -[AXDispatchTimer cancel](self->_homeButtonDismissTimer, "cancel");
    -[HNDRocker showVolumeBar:withProgress:](self, "showVolumeBar:withProgress:", 0LL, 0.0);
    -[HNDRocker alpha](self, "alpha");
    if (v40 == 0.0)
    {
      if (v6) {
        -[HNDRocker setAlpha:](self, "setAlpha:", 1.0);
      }
      +[CATransaction begin](&OBJC_CLASS___CATransaction, "begin");
      -[HNDRocker _setBackgroundWithType:](self, "_setBackgroundWithType:", 0LL);
      -[HNDRocker frame](self, "frame");
      -[HNDRocker setFrame:](self, "setFrame:", x, y);
      +[CATransaction commit](&OBJC_CLASS___CATransaction, "commit");
    }

    if (v6) {
      -[AXPIFingerView setAlpha:](self->_middleCircle, "setAlpha:", 0.0);
    }
    id v41 = 0.0;
    if (nubbitForeground)
    {
      if (v5)
      {
        CFTypeRef v42 = sub_10002B21C();
        id v41 = 0.349999994;
        if (v42) {
          id v41 = 0.25;
        }
      }
    }

    v45[0] = _NSConcreteStackBlock;
    v45[1] = 3221225472LL;
    v45[2] = sub_10003D5B0;
    v45[3] = &unk_100123288;
    v45[4] = self;
    *(double *)&v45[5] = x;
    *(double *)&v45[6] = y;
    uint64_t v46 = v6;
    v43[0] = _NSConcreteStackBlock;
    v43[1] = 3221225472LL;
    v43[2] = sub_10003D6B4;
    v43[3] = &unk_1001232D0;
    v43[4] = self;
    v44 = v6;
    +[UIView animateWithDuration:delay:options:animations:completion:]( &OBJC_CLASS___UIView,  "animateWithDuration:delay:options:animations:completion:",  2LL,  v45,  v43,  v41,  0.0);
  }

    if (!v15 || !v18) {
      goto LABEL_18;
    }
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
    uint64_t v20 = v19;
    id v21 = 1LL;
LABEL_17:
    [v19 setSwitchControlScanningStyle:v21];

LABEL_18:
    CGRect v22 = (void *)objc_claimAutoreleasedReturnValue([v6 productName]);
    [v15 setProductName:v22];

    unsigned __int8 v23 = (void *)objc_claimAutoreleasedReturnValue([v6 productName]);
    [v18 setProductName:v23];

    unint64_t v24 = (void *)objc_claimAutoreleasedReturnValue([v6 manufacturerName]);
    [v15 setManufacturerName:v24];

    unint64_t v25 = (void *)objc_claimAutoreleasedReturnValue([v6 manufacturerName]);
    [v18 setManufacturerName:v25];

    NSLog(@"Auto Configuring Setting up switches: %@", v12);
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
    [v26 setAssistiveTouchSwitches:v12];

    goto LABEL_19;
  }

    double v13 = 0LL;
    goto LABEL_15;
  }

  double v13 = 0LL;
LABEL_16:

  return v13;
}

  return v6;
}
}

        int v17 = (void *)objc_claimAutoreleasedReturnValue(+[HNDHandManager sharedManager](&OBJC_CLASS___HNDHandManager, "sharedManager"));
        char v18 = (void *)objc_claimAutoreleasedReturnValue([v17 mainDisplayManager]);
        id v21 = sub_10002B014(@"RECIPE_ACTIVATED_FORMAT");
        uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(v21);
        CGRect v22 = (void *)objc_claimAutoreleasedReturnValue(-[AXSwitchRecipe name](v25, "name"));
        unsigned __int8 v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v20, v22));
        [v18 showSimpleAlertWithText:v23];

        goto LABEL_15;
      }
    }

void sub_10001C640(uint64_t a1, void *a2)
{
  id v5 = a2;
  [v5 visibleFrame];
  v8.origin.x = CGRectZero.origin.x;
  v8.origin.CGFloat y = CGRectZero.origin.y;
  v8.size.CGFloat width = CGRectZero.size.width;
  v8.size.CGFloat height = CGRectZero.size.height;
  if (!CGRectEqualToRect(v6, v8))
  {
    [v5 visibleFrame];
    if (!CGRectIsInfinite(v7))
    {
      id v3 = [v5 scrollAncestorForScrollAction:*(unsigned int *)(a1 + 48)];
      if (v3)
      {
        id v4 = v3;
        if (([*(id *)(a1 + 32) containsObject:v3] & 1) == 0)
        {
          [*(id *)(a1 + 32) addObject:v4];
          [*(id *)(a1 + 40) addObject:v5];
        }
      }
    }
  }
}

void sub_10001C9DC(id a1, AXPIFingerModel *a2, unint64_t a3, BOOL *a4)
{
}

void sub_10001CAF0(uint64_t a1)
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10001CBB8;
  v7[3] = &unk_100121D18;
  id v8 = *(id *)(a1 + 32);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10001CBE8;
  v4[3] = &unk_100122340;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id v5 = v2;
  uint64_t v6 = v3;
  +[UIView animateWithDuration:animations:completion:]( &OBJC_CLASS___UIView,  "animateWithDuration:animations:completion:",  v7,  v4,  0.1);
}

void sub_10001CBB8(uint64_t a1)
{
  id v1 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) fingerController]);
  [v1 resetPinchFingers];
}

void sub_10001CBE8(uint64_t a1)
{
  id v2 = (id *)(a1 + 32);
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) fingerController]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 fingerModels]);

  if ([v4 count])
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue([*v2 fingerController]);
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 fingerModels]);
    CGRect v7 = (void *)objc_claimAutoreleasedReturnValue([v6 firstObject]);

    if (v7)
    {
      id v8 = *v2;
      [v7 location];
      objc_msgSend(v8, "updateWithPrimaryFingerPoint:");
    }

    [*(id *)(a1 + 32) performPress:3 type:1];
    *(_BYTE *)(*(void *)(a1 + 40) + 85LL) = 0;
  }

  else
  {
    uint64_t v9 = ASTLogCommon(0LL);
    unsigned int v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
      sub_1000AECE4(v2, v10);
    }
  }
}

void sub_10001CDB8(id a1, AXPIFingerModel *a2, unint64_t a3, BOOL *a4)
{
}

LABEL_27:
}

void sub_10001DA4C(id a1, HNDDisplayManager *a2)
{
}

void sub_10001DA60(id a1, HNDDisplayManager *a2)
{
}

void sub_10001DAE4(id a1, HNDDisplayManager *a2)
{
}

void sub_10001DAEC(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 isMenuVisible])
  {
    double Current = CFAbsoluteTimeGetCurrent();
    id v5 = [v3 lastMenuInteractionTime];
    if (Current - v7 > 0.5) {
      id v5 = [v3 showMenu:0];
    }
  }

  else if ([*(id *)(a1 + 32) inCustomGesture])
  {
    uint64_t v8 = AXLogCommon();
    uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v26 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_INFO,  "Substantial transition, reseting gesture",  v26,  2u);
    }

    uint64_t v10 = *(void *)(a1 + 32);
    uint64_t v11 = *(void **)(v10 + 56);
    *(void *)(v10 + 56) = 0LL;
  }

  else
  {
    unsigned int v12 = [*(id *)(a1 + 32) inDragMode];
    double v13 = *(double **)(a1 + 32);
    if (v12)
    {
      unsigned int v14 = (void *)objc_claimAutoreleasedReturnValue([v3 hardwareIdentifier]);
      objc_msgSend(v13, "endDragModeAtPoint:onDisplay:completed:", v14, 0, v13[14], v13[15]);
    }

    else
    {
      id v5 = [*(id *)(a1 + 32) inContinuousScrollMode];
      if (!(_DWORD)v5) {
        goto LABEL_13;
      }
      BOOL v15 = *(void **)(a1 + 32);
      unsigned int v14 = (void *)objc_claimAutoreleasedReturnValue([v3 hardwareIdentifier]);
      [v15 endContinuousScrollingOnDisplay:v14 withCompletion:0];
    }
  }

LABEL_13:
  if (!_AXSAssistiveTouchScannerEnabled(v5, v6))
  {
    [v3 screenBounds];
    CGFloat x = v27.origin.x;
    CGFloat y = v27.origin.y;
    CGFloat width = v27.size.width;
    CGFloat height = v27.size.height;
    double MidX = CGRectGetMidX(v27);
    v28.origin.CGFloat x = x;
    v28.origin.CGFloat y = y;
    v28.size.CGFloat width = width;
    v28.size.CGFloat height = height;
    double MidY = CGRectGetMidY(v28);
    CGRect v22 = *(void **)(a1 + 32);
    unsigned __int8 v23 = (void *)objc_claimAutoreleasedReturnValue([v3 hardwareIdentifier]);
    objc_msgSend(v22, "resetFingersToPoint:onDisplay:", v23, MidX, MidY);
  }

  if ([v3 visualsHidden])
  {
    unint64_t v24 = NSStringFromSelector(*(SEL *)(a1 + 40));
    unint64_t v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
    [v3 setVisualsHidden:0 forReason:v25 animated:1];
  }
}

  return v10;
}

  return v5;
}

  return v10;
}
}
}

    [v24 timeIntervalSinceNow];
    id v21 = v20;

    if (v21 > 2.0) {
      goto LABEL_16;
    }
  }

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000A24EC;
  block[3] = &unk_100122168;
  block[4] = self;
  CGRect v27 = (id)objc_claimAutoreleasedReturnValue([v4 nativeFocusElement]);
  CGRect v22 = v27;
  dispatch_async(&_dispatch_main_q, block);

LABEL_16:
}

id sub_10001DD38(uint64_t a1)
{
  return _[*(id *)(a1 + 32) orientationChanged];
}

void sub_10001DDC8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

uint64_t sub_10001DDE0(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 8LL);
  if (*(_BYTE *)(v2 + 24))
  {
    uint64_t result = 1LL;
  }

  else
  {
    uint64_t result = (uint64_t)[a2 isMenuVisible];
    uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 8LL);
  }

  *(_BYTE *)(v2 + 24) = result;
  return result;
}

void sub_10001DEB0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_10001DEC8(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 8LL);
  if (*(_BYTE *)(v2 + 24))
  {
    *(_BYTE *)(v2 + 24) = 1;
  }

  else
  {
    id v4 = (id)objc_claimAutoreleasedReturnValue([a2 fingerController]);
    *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [v4 isPinchEnabled];
  }

uint64_t sub_10001DFB4(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) deviceOrientation];
  int v3 = (int)v2;
  uint64_t v4 = ASTLogCommon(v2);
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v6 = *(_DWORD *)(*(void *)(a1 + 32) + 8LL);
    *(_DWORD *)buf = 67109376;
    int v10 = v6;
    __int16 v11 = 1024;
    int v12 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Orientation changed: old %d new %d", buf, 0xEu);
  }

  *(_DWORD *)(*(void *)(a1 + 32) + 8LL) = v3;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_10001E0C0;
  v8[3] = &unk_100121D18;
  v8[4] = *(void *)(a1 + 32);
  return AXPerformBlockAsynchronouslyOnMainThread(v8);
}

id sub_10001E0C0(uint64_t a1)
{
  return [*(id *)(a1 + 32) _startOrientationUpdateTimer];
}

void sub_10001E284(uint64_t a1)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) mainDisplayManager]);
  [v2 setOrientation:*(unsigned int *)(*(void *)(a1 + 32) + 8) withCompletion:0];
}

void sub_10001E2D8(id a1, HNDDisplayManager *a2)
{
}

void sub_10001E334(uint64_t a1, void *a2)
{
  uint64_t v2 = *(unsigned __int8 *)(a1 + 40);
  int v3 = *(const char **)(a1 + 32);
  id v4 = a2;
  id v5 = NSStringFromSelector(v3);
  id v6 = (id)objc_claimAutoreleasedReturnValue(v5);
  [v4 setVisualsHidden:v2 forReason:v6 animated:1];
}

void sub_10001E498(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 visualsHidden];
  if ((_DWORD)v4)
  {
    id v5 = NSStringFromSelector(*(SEL *)(a1 + 32));
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    [v3 setVisualsHidden:0 forReason:v6 animated:1];
  }

  else
  {
    uint64_t v7 = ASTLogCommon(v4);
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v8 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Tried to show visuals after performing screenshot, but visuals were already shown.",  v8,  2u);
    }
  }
}

void sub_10001E73C( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15)
{
}

void sub_10001E760(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = ASTLogCommon(v3);
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v8 = 138412546;
    id v9 = v3;
    __int16 v10 = 1024;
    unsigned int v11 = [v3 inNubbitMode];
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_INFO,  "Screenshot will fire. Display manager: %@, In nubbit mode: %d",  (uint8_t *)&v8,  0x12u);
  }

  if ([v3 inNubbitMode])
  {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = 1;
    id v6 = NSStringFromSelector(*(SEL *)(a1 + 40));
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    [v3 setVisualsHidden:1 forReason:v7 animated:0];
  }
}

id sub_10001E910(uint64_t a1)
{
  return [*(id *)(a1 + 32) _attemptToShowVisualsAfterPerformingScreenshot];
}

void sub_10001F194(id a1, HNDDisplayManager *a2)
{
}

void sub_10001F228( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_10001F240(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = v3;
  if (*(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL))
  {
    unsigned __int8 v5 = 1;
  }

  else
  {
    uint64_t v7 = v3;
    unsigned __int8 v6 = [v3 visualsHidden];
    uint64_t v4 = v7;
    if ((v6 & 1) != 0)
    {
      unsigned __int8 v5 = 0;
    }

    else
    {
      unsigned __int8 v5 = [v7 inNubbitMode];
      uint64_t v4 = v7;
    }
  }

  *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = v5;
}

void sub_10001F308(id a1, HNDDisplayManager *a2)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(-[HNDDisplayManager fingerController](a2, "fingerController"));
  [v2 cancelGesture];
}

void sub_10001F3C0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_10001F3D8(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 8LL);
  if (*(_BYTE *)(v2 + 24))
  {
    *(_BYTE *)(v2 + 24) = 1;
  }

  else
  {
    id v4 = (id)objc_claimAutoreleasedReturnValue([a2 fingerController]);
    *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [v4 isPerformingGesture];
  }

id sub_10001F77C(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) fingerController]);
  objc_msgSend( v2,  "showStartingFingersForGesture:animated:startPointForAnimation:",  *(void *)(a1 + 40),  1,  *(double *)(a1 + 64),  *(double *)(a1 + 72));

  if ([*(id *)(a1 + 48) _shouldRepeatGesture]) {
    return [*(id *)(a1 + 48) prepareGesture:*(void *)(*(void *)(a1 + 48) + 56) onDisplay:*(void *)(a1 + 56)];
  }
  [*(id *)(a1 + 32) setMultiTouchToolBackgroundEnabled:0];
  return [*(id *)(a1 + 48) specialToolUsageEnded:0];
}

uint64_t sub_10001F7F0(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_10001F88C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

uint64_t sub_10001F8A4(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 8LL);
  if (*(_BYTE *)(v2 + 24))
  {
    uint64_t result = 1LL;
  }

  else
  {
    uint64_t result = (uint64_t)[a2 multiTouchToolBackgroundEnabled];
    uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 8LL);
  }

  *(_BYTE *)(v2 + 24) = result;
  return result;
}

void sub_10001FB8C(id a1, HNDDisplayManager *a2)
{
  uint64_t v2 = a2;
  BOOL v3 = -[HNDDisplayManager multiTouchToolBackgroundEnabled](v2, "multiTouchToolBackgroundEnabled");
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[HNDDisplayManager fingerController](v2, "fingerController"));

  [v4 setShouldAddRealEventFlag:v3];
}

void sub_10001FE44(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = a2;
  uint64_t v4 = [v3 isMenuVisible] ^ 1;
  id v5 = (id)objc_claimAutoreleasedReturnValue([v3 hardwareIdentifier]);

  [v2 showMenu:v4 onDisplay:v5];
}

LABEL_29:
  CFTypeRef v45 = x;
  uint64_t v46 = y;
  result.CGFloat y = v46;
  result.CGFloat x = v45;
  return result;
}
}

id sub_100020310(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 264) removeAllObjects];
}

void sub_1000204CC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

uint64_t sub_1000204E4(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_1000204F4(uint64_t a1)
{
}

void sub_1000204FC(uint64_t a1, void *a2)
{
  id v7 = a2;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v7 window]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 windowScene]);
  unsigned __int8 v6 = *(void **)(a1 + 32);

  if (v5 == v6) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL), a2);
  }
}

void sub_1000209CC(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (*(id *)(a1 + 32) != v3)
  {
    id v7 = v3;
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 fingerController]);
    id v5 = [v4 numberOfFingers];

    id v3 = v7;
    if (v5)
    {
      unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue([v7 fingerController]);
      objc_msgSend(v6, "clearAllFingersAnimated:endPointForAnimation:", 1, CGPointZero.x, CGPointZero.y);

      [*(id *)(a1 + 40) specialToolUsageEnded:1];
      id v3 = v7;
    }
  }
}

id sub_100020A64(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "moveNubbitToPoint:", *(double *)(a1 + 40), *(double *)(a1 + 48));
}

id sub_100020E90(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) containsObject:a2];
}

LABEL_5:
}

id sub_10002136C(uint64_t a1)
{
  id result = [*(id *)(a1 + 32) isPendingFingerLiftForPrimaryButtonPressUp];
  if ((_DWORD)result) {
    return [*(id *)(a1 + 32) _reallyLiftFingersUpForPotentialTapViaPrimaryButton];
  }
  return result;
}

LABEL_8:
      -[HNDHandManager _resetMenuOpenTracker](self, "_resetMenuOpenTracker");
      self->_primaryButtonDown = 1;
      id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
      -[HNDHandManager setPreviousPrimaryButtonPressDownDate:](self, "setPreviousPrimaryButtonPressDownDate:", v9);
    }
  }

    return;
  }

  double v13 = (void *)objc_claimAutoreleasedReturnValue(+[AXPISystemActionHelper sharedInstance](&OBJC_CLASS___AXPISystemActionHelper, "sharedInstance"));
  [v13 toggleSpotlight];

  -[HNDRocker _menuExited](self, "_menuExited");
}

    return;
  }

  int v12 = (void *)objc_claimAutoreleasedReturnValue(+[AXPISystemActionHelper sharedInstance](&OBJC_CLASS___AXPISystemActionHelper, "sharedInstance"));
  [v12 activateSOSMode];

  -[HNDRocker _menuExited](self, "_menuExited");
}
}
}

void sub_100021D04( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
}

uint64_t sub_100021D1C(uint64_t a1)
{
  uint64_t v2 = objc_claimAutoreleasedReturnValue( +[AXElement elementAtCoordinate:withVisualPadding:]( &OBJC_CLASS___AXElement,  "elementAtCoordinate:withVisualPadding:",  0LL));
  if (!v2) {
    return 0LL;
  }
  id v3 = (void *)v2;
  while (1)
  {
    if ((*(_DWORD *)(a1 + 32) & 0xFFFFFFFE) == 0x7EE) {
      [v3 setAutoscrollTarget:v3];
    }
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 uiElement]);
    unsigned int v5 = [v4 performAXAction:*(unsigned int *)(a1 + 32)];

    unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue([v3 uiElement]);
    unsigned int v7 = [v6 BOOLWithAXAttribute:2093];

    if (!v7 || (v5 & 1) != 0) {
      break;
    }
    uint64_t v8 = objc_claimAutoreleasedReturnValue([v3 remoteParent]);

    id v3 = (void *)v8;
    if (!v8)
    {
      uint64_t v9 = 0LL;
      id v3 = 0LL;
      goto LABEL_11;
    }
  }

  uint64_t v9 = v7 | v5;
LABEL_11:

  return v9;
}

uint64_t sub_100021E04(uint64_t a1)
{
  *(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = (*(uint64_t (**)(double, double))(*(void *)(a1 + 40) + 16LL))( *(double *)(a1 + 56),  *(double *)(a1 + 64));
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_100021E40(id a1)
{
  dispatch_queue_attr_t v1 = dispatch_queue_attr_make_with_qos_class(0LL, QOS_CLASS_USER_INTERACTIVE, 0);
  uint64_t v4 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v1);
  dispatch_queue_t v2 = dispatch_queue_create("AXScrollElementQuery", v4);
  id v3 = (void *)qword_100157630;
  qword_100157630 = (uint64_t)v2;
}

void sub_1000221B8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_1000221D0(uint64_t a1, void *a2)
{
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  id v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "fingerController", 0));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 fingerModels]);

  id v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      uint64_t v8 = 0LL;
      do
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 8LL);
        if (*(_BYTE *)(v9 + 24))
        {
          unsigned __int8 v10 = 1;
        }

        else
        {
          unsigned __int8 v10 = [*(id *)(*((void *)&v11 + 1) + 8 * (void)v8) isPressed];
          uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 8LL);
        }

        *(_BYTE *)(v9 + 24) = v10;
        uint64_t v8 = (char *)v8 + 1;
      }

      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }

    while (v6);
  }
}

void sub_100022348(uint64_t a1, void *a2)
{
  dispatch_queue_t v2 = *(void **)(a1 + 32);
  id v3 = (id)objc_claimAutoreleasedReturnValue([a2 hardwareIdentifier]);
  [v2 resetFingersIfNeededOnDisplay:v3];
}

void sub_1000225BC(uint64_t a1, void *a2)
{
  id v9 = a2;
  if ([*(id *)(a1 + 32) canShowASTMousePointer])
  {
    id v3 = (void *)objc_claimAutoreleasedReturnValue([v9 fingerController]);
    id v4 = [v3 numberOfFingers];

    if (v4)
    {
      id v5 = (void *)objc_claimAutoreleasedReturnValue([v9 fingerController]);
      id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 fingerModels]);
      uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 axMapObjectsUsingBlock:&stru_1001226C8]);

      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v9 fingerController]);
      objc_msgSend(v8, "showFingerModels:animated:startPointForAnimation:", v7, 0, CGPointZero.x, CGPointZero.y);
    }
  }
}

id sub_100022688(id a1, AXPIFingerModel *a2, unint64_t a3)
{
  return +[AXPIFingerModel fingerModelForLocation:](&OBJC_CLASS___AXPIFingerModel, "fingerModelForLocation:");
}

void sub_1000229C8(id a1, HNDDisplayManager *a2)
{
}

void sub_1000229DC(id a1, HNDDisplayManager *a2)
{
}

void sub_1000229F0(id a1, HNDDisplayManager *a2)
{
}

BOOL sub_100022E08(id a1, HNDDisplayManager *a2)
{
  return -[HNDDisplayManager isMainDisplay](a2, "isMainDisplay");
}

id sub_100022F18(uint64_t a1, void *a2)
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue([a2 hardwareIdentifier]);
  id v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

uint64_t sub_100022FE8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

BOOL sub_10002306C(uint64_t a1, void *a2)
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue([a2 window]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 screen]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 displayIdentity]);
  BOOL v6 = [v5 displayID] == *(_DWORD *)(a1 + 32);

  return v6;
}

void sub_100023390( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

LABEL_34:
    double v55 = ASTLogMouse(v47, v48);
    double v56 = (os_log_s *)objc_claimAutoreleasedReturnValue(v55);
    if (os_log_type_enabled(v56, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      double v66 = device;
      _os_log_impl((void *)&_mh_execute_header, v56, OS_LOG_TYPE_INFO, "Unsupported device: %@", buf, 0xCu);
    }

    unsigned __int8 v10 = 0LL;
    goto LABEL_37;
  }

  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    double v66 = a3;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Switch Control is running. Ignoring device: %@",  buf,  0xCu);
  }

  unsigned __int8 v10 = 0LL;
LABEL_38:

  return v10;
}

  __break(1u);
}

id sub_100024FB8(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _[a1 handleValueCallback:a4];
}

id sub_100024FC0(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  return [a1 handleReportCallback:a5 report:a6 reportLength:a7];
}

void sub_1000251B8(id a1)
{
  uint64_t v1 = objc_claimAutoreleasedReturnValue(+[SCATBluetoothManager superNew](&OBJC_CLASS___SCATBluetoothManager, "superNew"));
  dispatch_queue_t v2 = (void *)qword_100157648;
  qword_100157648 = v1;
}

id sub_1000253C8(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  return _[a4 _sessionEventForSession:a1 event:a2 result:a3];
}

id sub_1000253DC(uint64_t a1)
{
  return [*(id *)(a1 + 32) _beginStateTransitionIfNecessary];
}

id sub_100025B84(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  return _[a5 _accessoryEventForManager:a1 event:a2 device:a3 state:a4];
}

id sub_100025BA0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6)
{
  return _[a6 _accessoryCustomMessageForAccessoryManager:a1 device:a2 customMessageType:a3 data:a4 dataSize:a5];
}

id sub_100025BC0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6)
{
  return _[a6 _serviceEventForDevice:a1 serviceMask:a2 eventType:a3 specificEvent:a4 result:a5];
}

id sub_100026040(uint64_t a1)
{
  return [*(id *)(a1 + 32) _beginStateTransitionIfNecessary];
}

id sub_1000260E8(uint64_t a1)
{
  return [*(id *)(a1 + 32) _beginStateTransitionIfNecessary];
}

uint64_t sub_1000261C0(void *a1)
{
  return (*(uint64_t (**)(void, id))(a1[6] + 16))( a1[6],  [*(id *)(a1[4] + 48) containsObject:a1[5]]);
}

id sub_100026270(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) addPointer:*(void *)(a1 + 40)];
}

id sub_1000262F8(uint64_t a1)
{
  id result = [*(id *)(*(void *)(a1 + 32) + 8) count];
  if (result)
  {
    unint64_t v3 = 0LL;
    while ([*(id *)(*(void *)(a1 + 32) + 8) pointerAtIndex:v3] != *(id *)(a1 + 40))
    {
      ++v3;
      id result = [*(id *)(*(void *)(a1 + 32) + 8) count];
    }

    return [*(id *)(*(void *)(a1 + 32) + 8) removePointerAtIndex:v3];
  }

  return result;
}

void sub_1000263F0(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = (id)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(a1 + 32) + 56) allValues]);
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

void sub_1000264E8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = SWCHLogHW(a1, a2);
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    sub_1000AF2A0(a1, v4);
  }

  if (*(void *)(*(void *)(a1 + 48) + 16LL))
  {
    id v7 = objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) addressString]);
    id v8 = [v7 UTF8String];

    BTDeviceAddressFromString(v8, v25);
    uint64_t v9 = BTDeviceFromAddress(*(void *)(*(void *)(a1 + 48) + 16LL), v25, &v24);
    if ((_DWORD)v9)
    {
      uint64_t v11 = SWCHLogHW(v9, v10);
      __int128 v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        sub_1000AF240();
      }
    }

    else
    {
      id v16 = [*(id *)(a1 + 40) length];
      int v17 = &v25[-(((unint64_t)v16 + 15) & 0xFFFFFFFFFFFFFFF0LL) - 6];
      [*(id *)(a1 + 40) getBytes:v17 length:v16];
      uint64_t v18 = BTAccessoryManagerSendCustomMessage( *(void *)(*(void *)(a1 + 48) + 32),  *(unsigned int *)(a1 + 56),  v24,  v17,  [*(id *)(a1 + 40) length]);
      uint64_t v20 = SWCHLogHW(v18, v19);
      id v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
      {
        int v22 = *(_DWORD *)(a1 + 56);
        uint64_t v23 = *(void *)(a1 + 40);
        *(_DWORD *)buf = 67109634;
        *(_DWORD *)CGRect v27 = v22;
        *(_WORD *)&v27[4] = 2112;
        *(void *)&v27[6] = v23;
        __int16 v28 = 2080;
        id v29 = v8;
        _os_log_debug_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEBUG,  "sent custom message type %d data %@ to device %s",  buf,  0x1Cu);
      }
    }
  }

  else
  {
    uint64_t v13 = SWCHLogHW(v5, v6);
    __int128 v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v15 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      *(void *)CGRect v27 = v15;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Went to send custom message to device %@ but we had no session.",  buf,  0xCu);
    }
  }

void sub_1000267C4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = SWCHLogHW(a1, a2);
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    sub_1000AF394(a1, v4);
  }

  if (*(void *)(*(void *)(a1 + 40) + 16LL))
  {
    id v7 = objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) addressString]);
    id v8 = [v7 UTF8String];

    BTDeviceAddressFromString(v8, v23);
    uint64_t v9 = BTDeviceFromAddress(*(void *)(*(void *)(a1 + 40) + 16LL), v23, &v22);
    if ((_DWORD)v9)
    {
      uint64_t v11 = SWCHLogHW(v9, v10);
      __int128 v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        sub_1000AF334();
      }
    }

    else
    {
      uint64_t v16 = BTAccessoryManagerSendControlCommand( *(void *)(*(void *)(a1 + 40) + 32LL),  v22,  *(unsigned __int8 *)(a1 + 52),  *(unsigned int *)(a1 + 48));
      int v17 = v16;
      uint64_t v19 = SWCHLogHW(v16, v18);
      __int128 v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        int v20 = *(unsigned __int8 *)(a1 + 52);
        int v21 = *(_DWORD *)(a1 + 48);
        *(_DWORD *)buf = 67109890;
        *(_DWORD *)unint64_t v25 = v20;
        *(_WORD *)&v25[4] = 1024;
        *(_DWORD *)&uint8_t v25[6] = v21;
        __int16 v26 = 2080;
        id v27 = v8;
        __int16 v28 = 1024;
        int v29 = v17;
        _os_log_debug_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEBUG,  "sent control message type %d value %u to device %s result %d",  buf,  0x1Eu);
      }
    }
  }

  else
  {
    uint64_t v13 = SWCHLogHW(v5, v6);
    __int128 v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v15 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      *(void *)unint64_t v25 = v15;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Went to send configuration message to device %@ but we had no session.",  buf,  0xCu);
    }
  }

void sub_100026A00(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
}

  ;
}

  ;
}

void sub_100027634(id a1)
{
  id v1 = (id)objc_claimAutoreleasedReturnValue(+[AXElement systemWideElement](&OBJC_CLASS___AXElement, "systemWideElement"));
  [v1 systemPressTVSelectButton];
}

void sub_100027668(id a1)
{
  id v1 = (id)objc_claimAutoreleasedReturnValue(+[AXElement systemWideElement](&OBJC_CLASS___AXElement, "systemWideElement"));
  [v1 systemPressTVUpButton];
}

void sub_10002769C(id a1)
{
  id v1 = (id)objc_claimAutoreleasedReturnValue(+[AXElement systemWideElement](&OBJC_CLASS___AXElement, "systemWideElement"));
  [v1 systemPressTVDownButton];
}

void sub_1000276D0(id a1)
{
  id v1 = (id)objc_claimAutoreleasedReturnValue(+[AXElement systemWideElement](&OBJC_CLASS___AXElement, "systemWideElement"));
  [v1 systemPressTVLeftButton];
}

void sub_100027704(id a1)
{
  id v1 = (id)objc_claimAutoreleasedReturnValue(+[AXElement systemWideElement](&OBJC_CLASS___AXElement, "systemWideElement"));
  [v1 systemPressTVRightButton];
}

void sub_100027738(id a1)
{
  id v1 = (id)objc_claimAutoreleasedReturnValue(+[AXElement systemWideElement](&OBJC_CLASS___AXElement, "systemWideElement"));
  [v1 systemPressTVMenuButton];
}

void sub_10002776C(id a1)
{
  id v1 = (id)objc_claimAutoreleasedReturnValue(+[AXElement systemWideElement](&OBJC_CLASS___AXElement, "systemWideElement"));
  [v1 systemPressTVHomeButton];
}

void sub_1000277A0(id a1)
{
  id v1 = (id)objc_claimAutoreleasedReturnValue(+[AXElement systemWideElement](&OBJC_CLASS___AXElement, "systemWideElement"));
  [v1 systemPressTVPlayPauseButton];
}

void sub_100028038(uint64_t a1)
{
  id v1 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v1 postNotificationName:@"HNDEventManagerReset" object:0];
}

void sub_100028210(uint64_t a1)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) delegate]);
  objc_msgSend( v2,  "keyboardVisible:withFrame:",  *(unsigned __int8 *)(a1 + 72),  *(double *)(a1 + 40),  *(double *)(a1 + 48),  *(double *)(a1 + 56),  *(double *)(a1 + 64));
}

void sub_100028414(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) disableIdleTimerAssertion]);

  if (!v2)
  {
    id v4 = (id)objc_claimAutoreleasedReturnValue(+[AXUserEventTimer sharedInstance](&OBJC_CLASS___AXUserEventTimer, "sharedInstance"));
    uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v4 acquireAssertionToDisableIdleTimerWithReason:@"AssistiveTouch"]);
    [*(id *)(a1 + 32) setDisableIdleTimerAssertion:v3];
  }

id sub_10002849C(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) disableIdleTimerAssertion]);
  [v2 invalidate];

  return [*(id *)(a1 + 32) setDisableIdleTimerAssertion:0];
}

void sub_1000286B4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = objc_autoreleasePoolPush();
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100028750;
  v7[3] = &unk_100121D18;
  id v8 = (id)objc_claimAutoreleasedReturnValue( +[AXEventRepresentation representationWithHIDEvent:hidStreamIdentifier:]( &OBJC_CLASS___AXEventRepresentation,  "representationWithHIDEvent:hidStreamIdentifier:",  a4,  @"AST-UIApplicationEvents"));
  id v6 = v8;
  AXPerformBlockOnMainThread(v7);

  objc_autoreleasePoolPop(v5);
}

void sub_100028750(uint64_t a1)
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(+[HNDEventManager sharedManager](&OBJC_CLASS___HNDEventManager, "sharedManager"));
  id v2 = (void *)objc_claimAutoreleasedReturnValue([v3 delegate]);
  [v2 handleRealEvent:*(void *)(a1 + 32)];
}

double sub_100028888(uint64_t a1, double a2, double a3)
{
  double v3 = a2 * *(double *)(a1 + 32);
  double v4 = a3 * *(double *)(a1 + 40);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[HNDHandManager sharedManager](&OBJC_CLASS___HNDHandManager, "sharedManager"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 currentDisplayManager]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 window]);

  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[AXBackBoardServer server](&OBJC_CLASS___AXBackBoardServer, "server"));
  id v9 = [v7 _contextId];
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v7 screen]);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 displayIdentity]);
  objc_msgSend(v8, "convertPoint:toContextId:displayId:", v9, objc_msgSend(v11, "displayID"), v3, v4);
  double v13 = v12;

  return v13;
}

uint64_t sub_100028BA4(void *a1, uint64_t a2, uint64_t a3, const void *a4)
{
  uint64_t SenderID = IOHIDEventGetSenderID(a4);
  BOOL v7 = IOHIDEventGetType(a4) == 11 && _AXSAutomationEnabled() != 0;
  if (SenderID != 0x8000000817319372LL
    && (SenderID != 0x8000000817319375LL || v7)
    && IOHIDEventGetType(a4) != 14)
  {
    id v9 = a1;
    if (![v9 isCapturingEvents]
      || ![v9 shouldCaptureEvent:a4])
    {
      uint64_t v8 = 0LL;
LABEL_22:

      return v8;
    }

    uint64_t v26 = 0LL;
    id v27 = &v26;
    uint64_t v28 = 0x3032000000LL;
    int v29 = sub_1000292B4;
    unsigned __int8 v30 = sub_1000292C4;
    id v31 = 0LL;
    if (UIAccessibilityIsSwitchControlRunning())
    {
      if (([v9 _shouldSwitchControlIgnoreHIDEvent:a4] & 1) != 0
        || (uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[SCATScannerManager sharedManager](&OBJC_CLASS___SCATScannerManager, "sharedManager")),
            id v11 = sub_1000292CC((uint64_t)a4),
            double v12 = (void *)objc_claimAutoreleasedReturnValue(v11),
            unsigned int v13 = [v10 isSwitchWithSource:v12],
            v12,
            v10,
            !v13))
      {
        uint64_t v8 = 0LL;
LABEL_21:
        _Block_object_dispose(&v26, 8);

        goto LABEL_22;
      }
    }

    else
    {
      __int128 v14 = (void *)objc_claimAutoreleasedReturnValue([v9 delegate]);
      unsigned int v15 = [v14 isPerformingGesture];

      if (v15)
      {
        uint64_t v16 = objc_claimAutoreleasedReturnValue( +[AXEventRepresentation representationWithHIDEvent:hidStreamIdentifier:]( &OBJC_CLASS___AXEventRepresentation,  "representationWithHIDEvent:hidStreamIdentifier:",  a4,  @"AST-IOHIDFilter"));
        int v17 = (void *)v27[5];
        v27[5] = v16;

        uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([(id)v27[5] handInfo]);
        unsigned int v19 = [v18 eventType];

        if (v19 == 1)
        {
          int v20 = (void *)objc_claimAutoreleasedReturnValue([v9 delegate]);
          [v20 cancelCurrentGesture];
LABEL_20:

          uint64_t v8 = 1LL;
          goto LABEL_21;
        }
      }
    }

    CFRetain(a4);
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472LL;
    v22[2] = sub_100029390;
    v22[3] = &unk_1001229E0;
    uint64_t v24 = &v26;
    unint64_t v25 = a4;
    id v23 = v9;
    AXPerformBlockAsynchronouslyOnMainThread(v22);
    int v20 = v23;
    goto LABEL_20;
  }

  return 0LL;
}

void sub_100028E0C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

uint64_t sub_1000292B4(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_1000292C4(uint64_t a1)
{
}

id sub_1000292CC(uint64_t a1)
{
  int Type = IOHIDEventGetType();
  if (Type > 10)
  {
    if (Type == 11)
    {
      double v4 = (id *)&SCATSwitchSourceScreen;
      goto LABEL_13;
    }

    if (Type == 35)
    {
LABEL_9:
      double v4 = (id *)&SCATSwitchSourceGamepad;
      goto LABEL_13;
    }
  }

  else
  {
    if (Type == 2)
    {
      double v4 = (id *)&SCATSwitchSourceMFI;
      goto LABEL_13;
    }

    if (Type == 3)
    {
      uint64_t IntegerValue = IOHIDEventGetIntegerValue(a1, 196608LL);
      if (IntegerValue != 7)
      {
        if (IntegerValue != 12) {
          goto LABEL_14;
        }
        goto LABEL_9;
      }

      double v4 = (id *)&SCATSwitchSourceKeyboard;
LABEL_13:
      id v5 = *v4;
      if (v5) {
        return v5;
      }
    }
  }

void sub_100029390(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL);
  if (!v2)
  {
    uint64_t v3 = objc_claimAutoreleasedReturnValue( +[AXEventRepresentation representationWithHIDEvent:hidStreamIdentifier:]( &OBJC_CLASS___AXEventRepresentation,  "representationWithHIDEvent:hidStreamIdentifier:",  *(void *)(a1 + 48),  @"AST-IOHIDFilter"));
    uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8LL);
    id v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = v3;

    uint64_t v2 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL);
  }

  [*(id *)(a1 + 32) _handleIOHIDEvent:v2];
  CFRelease(*(CFTypeRef *)(a1 + 48));
}

void sub_100029AB4(id a1, SCATMenu *a2)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue( +[SCATHardwareAction crownRotationClockwise:]( &OBJC_CLASS___SCATHardwareAction,  "crownRotationClockwise:",  1LL));
  [v2 performAction];
}

void sub_100029AEC(id a1, SCATMenu *a2)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue( +[SCATHardwareAction crownRotationClockwise:]( &OBJC_CLASS___SCATHardwareAction,  "crownRotationClockwise:",  0LL));
  [v2 performAction];
}

void sub_100029B24(uint64_t a1)
{
  id v1 = (id)objc_claimAutoreleasedReturnValue( +[SCATHardwareAction actionForHardwareActionString:]( &OBJC_CLASS___SCATHardwareAction,  "actionForHardwareActionString:",  *(void *)(a1 + 32)));
  [v1 performAction];
}

LABEL_35:
  return (id)v4;
}

  return v5;
}

void sub_10002A7BC(id a1, SCATMenu *a2)
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  [v3 assistiveTouchStepInterval];
  [v3 setAssistiveTouchStepInterval:v2 + -0.05];
}

void sub_10002A804(id a1, SCATMenu *a2)
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  [v3 assistiveTouchStepInterval];
  [v3 setAssistiveTouchStepInterval:v2 + 0.05];
}

void sub_10002A84C(id a1, SCATMenu *a2)
{
  double v2 = a2;
  id v3 = -[SCATModernMenuSheet initWithMenu:](objc_alloc(&OBJC_CLASS___SCATModernMenuPositionsSheet), "initWithMenu:", v2);
  -[SCATMenu pushSheet:](v2, "pushSheet:", v3);
}

void sub_10002A8A4(id a1, SCATMenu *a2)
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  uint64_t v2 = [v4 assistiveTouchScannerSpeechEnabled] ^ 1;
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  [v3 setAssistiveTouchScannerSpeechEnabled:v2];
}

void sub_10002A900(id a1, SCATMenu *a2)
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  uint64_t v2 = [v4 assistiveTouchScannerSoundEnabled] ^ 1;
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  [v3 setAssistiveTouchScannerSoundEnabled:v2];
}

void sub_10002A95C(id a1, SCATMenu *a2)
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  uint64_t v2 = [v4 assistiveTouchGroupElementsEnabled] ^ 1;
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  [v3 setAssistiveTouchGroupElementsEnabled:v2];
}

uint64_t sub_10002AB34(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  id v5 = [v4 assistiveTouchScannerSpeechEnabled];

  id v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) _stringForSpeechEnabled:v5]);
  [v3 setTitle:v6];

  if ((_DWORD)v5) {
    BOOL v7 = @"SCATIcon_settings_speechOn";
  }
  else {
    BOOL v7 = @"SCATIcon_settings_speechOff";
  }
  [v3 setImageName:v7];

  return 1LL;
}

uint64_t sub_10002ABD0(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  id v5 = [v4 assistiveTouchScannerSoundEnabled];

  id v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) _stringForSoundEnabled:v5]);
  [v3 setTitle:v6];

  if ((_DWORD)v5) {
    BOOL v7 = @"SCATIcon_settings_soundOn";
  }
  else {
    BOOL v7 = @"SCATIcon_settings_soundOff";
  }
  [v3 setImageName:v7];

  return 1LL;
}

uint64_t sub_10002AC6C(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  id v5 = [v4 assistiveTouchGroupElementsEnabled];

  id v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) _stringForGroupEnabled:v5]);
  [v3 setTitle:v6];

  if ((_DWORD)v5) {
    BOOL v7 = @"SCATIcon_settings_groupElements";
  }
  else {
    BOOL v7 = @"SCATIcon_settings_scanByElement";
  }
  [v3 setImageName:v7];

  return 1LL;
}

BOOL sub_10002AD08(id a1, SCATModernMenuItem *a2)
{
  return 0;
}

double sub_10002ADC4(double a1, double a2)
{
  uint64_t v2 = 0LL;
  uint64_t v3 = 0LL;
  *(void *)&double result = (unint64_t)CGRectIntegral(*(CGRect *)&a1);
  return result;
}

BOOL sub_10002ADD8()
{
  return BKSHIDServicesGetRingerState() != 0;
}

uint64_t sub_10002ADF4()
{
  return 0LL;
}

double sub_10002ADFC(uint64_t a1, uint64_t a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6)
{
  v17.origin.double x = -[HNDHandManager screenFrame:]_0(a1, a2);
  v17.origin.CGFloat y = v10;
  v17.size.CGFloat width = v11;
  v17.size.CGFloat height = v12;
  v15.origin.double x = a3;
  v15.origin.CGFloat y = a4;
  v15.size.CGFloat width = a5;
  v15.size.CGFloat height = a6;
  CGRect v16 = CGRectIntersection(v15, v17);
  double x = v16.origin.x;
  if (CGRectIsNull(v16)) {
    return CGRectZero.origin.x;
  }
  return x;
}

double sub_10002AE8C(double a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8)
{
  CGRect v10 = CGRectIntersection(*(CGRect *)&a1, *(CGRect *)&a5);
  double x = v10.origin.x;
  if (CGRectIsNull(v10)) {
    return CGRectZero.origin.x;
  }
  return x;
}

void sub_10002AEE8(void *a1)
{
  id v1 = a1;
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v2 assistiveTouchUsageCount]);
  id v9 = (NSMutableDictionary *)[v3 mutableCopy];

  id v4 = v9;
  if (!v9) {
    id v4 = -[NSMutableDictionary initWithCapacity:]( objc_alloc(&OBJC_CLASS___NSMutableDictionary),  "initWithCapacity:",  0LL);
  }
  CGRect v10 = v4;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v4, "objectForKey:", v1));
  id v6 = (char *)[v5 integerValue];

  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v6 + 1));
  -[NSMutableDictionary setObject:forKey:](v10, "setObject:forKey:", v7, v1);

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  [v8 setAssistiveTouchUsageCount:v10];
}

double sub_10002AFD8(double a1, double a2, double a3, double a4, double a5)
{
  return a1 / a5;
}

double sub_10002AFE4(char a1, double a2, double a3, double a4, double a5, double a6)
{
  if ((a1 & 1) == 0)
  {
    a2 = fmin(a2, 1.0);
    if (a2 < 0.0) {
      a2 = 0.0;
    }
  }

  return a6 * a2;
}

id sub_10002B014(void *a1)
{
  id v1 = a1;
  id v2 = sub_10002B0E4(v1);
  id v3 = (id)objc_claimAutoreleasedReturnValue(v2);
  id v4 = v3;
  if (!v3 || (id v3 = [v3 isEqualToString:v1], (_DWORD)v3))
  {
    id v5 = sub_10002B07C((uint64_t)v3, v1);
    uint64_t v6 = objc_claimAutoreleasedReturnValue(v5);

    id v4 = (void *)v6;
  }

  return v4;
}

id sub_10002B07C(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 localizedStringForKey:v2 value:v2 table:@"LocalizedStrings"]);

  return v4;
}

id sub_10002B0E4(void *a1)
{
  id v1 = a1;
  id v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 localizedStringForKey:v1 value:v1 table:@"LocalizedStrings-tvOS"]);

  return v3;
}

id sub_10002B14C(void *a1)
{
  id v1 = a1;
  id v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 localizedStringForKey:v1 value:v1 table:@"LocalizedStrings-Staccato"]);

  return v3;
}

id sub_10002B1B4(void *a1)
{
  id v1 = a1;
  id v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 localizedStringForKey:v1 value:v1 table:@"LocalizedStrings-D94"]);

  return v3;
}

uint64_t sub_10002B21C()
{
  v0 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](&OBJC_CLASS___UIDevice, "currentDevice"));
  byte_100157658 = [v0 userInterfaceIdiom] == 0;

  return byte_100157658;
}

void sub_10002B364( uint64_t a1, int a2, double *a3, uint64_t a4, double a5, double a6, double a7, double a8, double a9, double a10)
{
  if (a4)
  {
    uint64_t v13 = a4;
    __int128 v14 = a3 + 1;
    do
    {
      *(v14 - 1) = (*(double (**)(double, double))(*(void *)(a1 + 40) + 16LL))(*(v14 - 1), *v14);
      *(void *)__int128 v14 = v15;
      v14 += 2;
      --v13;
    }

    while (v13);
  }

  switch(a2)
  {
    case 0:
      objc_msgSend(*(id *)(a1 + 32), "moveToPoint:", *a3, a3[1]);
      break;
    case 1:
      objc_msgSend(*(id *)(a1 + 32), "addLineToPoint:", *a3, a3[1]);
      break;
    case 2:
      _objc_msgSend(*(id *)(a1 + 32), "addQuadCurveToPoint:controlPoint:", a3[2], a3[3], *a3, a3[1], a9, a10);
      break;
    case 3:
      _objc_msgSend( *(id *)(a1 + 32),  "addCurveToPoint:controlPoint1:controlPoint2:",  a3[4],  a3[5],  *a3,  a3[1],  a3[2],  a3[3]);
      break;
    case 4:
      [*(id *)(a1 + 32) closePath];
      break;
    default:
      return;
  }

double sub_10002B4D0(uint64_t a1, double a2)
{
  return a2 - *(double *)(a1 + 32);
}

id sub_10002B564(uint64_t a1)
{
  return +[HNDScreen convertPoint:toView:](&OBJC_CLASS___HNDScreen, "convertPoint:toView:", *(void *)(a1 + 32));
}

uint64_t sub_10002BE44(uint64_t a1, uint64_t a2)
{
  if (byte_100157668 == 1) {
    return byte_100157669 != 0;
  }
  if ((AXDeviceHasHomeButton(a1, a2) & 1) != 0) {
    return 0LL;
  }
  return AXDeviceIsPhone();
}

uint64_t sub_10002BE8C(uint64_t a1, uint64_t a2)
{
  if (byte_10015766A == 1) {
    return byte_10015766B != 0;
  }
  else {
    return AXDeviceHasHomeButton(a1, a2) ^ 1;
  }
}

void sub_10002BEE0(uint64_t a1)
{
  uint64_t v1 = a1 - 1;
  uint64_t v2 = 1LL;
  switch(v1)
  {
    case 0LL:
    case 1LL:
      id v3 = (void *)objc_claimAutoreleasedReturnValue(+[CHHapticEngine capabilitiesForHardware](&OBJC_CLASS___CHHapticEngine, "capabilitiesForHardware"));
      unsigned __int8 v4 = [v3 supportsHaptics];

      if ((v4 & 1) == 0) {
        goto LABEL_3;
      }
      break;
    case 2LL:
      goto LABEL_4;
    case 3LL:
LABEL_3:
      uint64_t v2 = 0LL;
LABEL_4:
      sub_10002BF54(v2);
      break;
    default:
      return;
  }

void sub_10002BF54(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](&OBJC_CLASS___UIDevice, "currentDevice"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 _tapticEngine]);
  [v3 prepareUsingFeedback:a1];

  unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](&OBJC_CLASS___UIDevice, "currentDevice"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 _tapticEngine]);
  [v5 actuateFeedback:a1];

  id v7 = (id)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](&OBJC_CLASS___UIDevice, "currentDevice"));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v7 _tapticEngine]);
  [v6 endUsingFeedback:a1];
}

id sub_10002C0E0()
{
  id v0 = objc_alloc_init(&OBJC_CLASS___AXSSSwitchControlSettings);
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  id v2 = [v1 switchControlScanningStyle];
  if (v2 == (id)2)
  {
    uint64_t v26 = AXSSSwitchControlScanningStyleSingleSwitchStep;
    id v3 = &v26;
  }

  else if (v2 == (id)1)
  {
    uint64_t v27 = AXSSSwitchControlScanningStyleManual;
    id v3 = &v27;
  }

  else
  {
    if (v2) {
      goto LABEL_8;
    }
    uint64_t v28 = AXSSSwitchControlScanningStyleAuto;
    id v3 = &v28;
  }

  unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v3, 1LL));
  [v0 setScanningStyles:v4];

LABEL_8:
  id v5 = [v1 switchControlTapBehavior];
  if (v5 == (id)2)
  {
    uint64_t v23 = AXSSSwitchControlTapBehaviorAlways;
    uint64_t v6 = &v23;
  }

  else if (v5 == (id)1)
  {
    uint64_t v24 = AXSSSwitchControlTapBehaviorAuto;
    uint64_t v6 = &v24;
  }

  else
  {
    if (v5) {
      goto LABEL_15;
    }
    uint64_t v25 = AXSSSwitchControlTapBehaviorDefault;
    uint64_t v6 = &v25;
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v6, 1LL));
  [v0 setTapBehaviors:v7];

LABEL_15:
  if ([v1 assistiveTouchScannerCursorHighVisibilityEnabled])
  {
    uint64_t v22 = AXSSSwitchControlCursorSizeLarge;
    uint64_t v8 = &v22;
  }

  else
  {
    uint64_t v21 = AXSSSwitchControlCursorSizeSmall;
    uint64_t v8 = &v21;
  }

  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v8, 1LL));
  [v0 setCursorSizes:v9];

  id v10 = [v1 switchControlScanAfterTapLocation];
  if (v10 == (id)1)
  {
    uint64_t v19 = AXSSSwitchControlPostActivationScanLocationCurrentItem;
    CGFloat v11 = &v19;
  }

  else
  {
    if (v10) {
      goto LABEL_23;
    }
    uint64_t v20 = AXSSSwitchControlPostActivationScanLocationDefault;
    CGFloat v11 = &v20;
  }

  CGFloat v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v11, 1LL));
  [v0 setPostActivationScanLocations:v12];

LABEL_23:
  [v1 assistiveTouchStepInterval];
  objc_msgSend(v0, "setAutoScanningInterval:");
  [v1 assistiveTouchScanTimeout];
  objc_msgSend(v0, "setAutoHideTimeout:");
  else {
    double v13 = AXSSSwitchControlTimeIntervalNotApplicable;
  }
  [v0 setPauseOnFirstItemInterval:v13];
  objc_msgSend(v0, "setNumberOfScanLoops:", objc_msgSend(v1, "assistiveTouchScanCycles"));
  [v1 switchControlDwellTime];
  objc_msgSend(v0, "setDwellDuration:");
  else {
    double v14 = AXSSSwitchControlTimeIntervalNotApplicable;
  }
  [v0 setRepeatActionInterval:v14];
  else {
    double v15 = AXSSSwitchControlTimeIntervalNotApplicable;
  }
  [v0 setHoldDuration:v15];
  else {
    double v16 = AXSSSwitchControlTimeIntervalNotApplicable;
  }
  [v0 setIgnoreRepeatDuration:v16];
  objc_msgSend(v0, "setSoundEffectsEnabled:", objc_msgSend(v1, "assistiveTouchScannerSoundEnabled"));
  objc_msgSend(v0, "setSpeechEnabled:", objc_msgSend(v1, "assistiveTouchScannerSpeechEnabled"));
  else {
    double v17 = AXSSSwitchControlTimeIntervalNotApplicable;
  }
  [v0 setLongPressDuration:v17];
  [v1 switchControlAutoTapTimeout];
  objc_msgSend(v0, "setAutoTapTimeout:");

  return v0;
}

void sub_10002C460(void *a1)
{
  id v1 = a1;
  id v2 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  __int128 v64 = 0u;
  __int128 v65 = 0u;
  __int128 v66 = 0u;
  __int128 v67 = 0u;
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v1 scanningStyles]);
  id v4 = [v3 countByEnumeratingWithState:&v64 objects:v71 count:16];
  if (!v4) {
    goto LABEL_16;
  }
  id v5 = v4;
  uint64_t v6 = *(void *)v65;
  uint64_t v7 = AXSSSwitchControlScanningStyleAuto;
  uint64_t v8 = AXSSSwitchControlScanningStyleManual;
  uint64_t v9 = AXSSSwitchControlScanningStyleSingleSwitchStep;
  while (2)
  {
    for (i = 0LL; i != v5; i = (char *)i + 1)
    {
      if (*(void *)v65 != v6) {
        objc_enumerationMutation(v3);
      }
      CGFloat v11 = *(void **)(*((void *)&v64 + 1) + 8LL * (void)i);
      if ([v11 isEqualToString:v7])
      {
        uint64_t v12 = 0LL;
LABEL_15:
        [v2 setSwitchControlScanningStyle:v12];
        goto LABEL_16;
      }

      if ([v11 isEqualToString:v8])
      {
        uint64_t v12 = 1LL;
        goto LABEL_15;
      }

      if ([v11 isEqualToString:v9])
      {
        uint64_t v12 = 2LL;
        goto LABEL_15;
      }
    }

    id v5 = [v3 countByEnumeratingWithState:&v64 objects:v71 count:16];
    if (v5) {
      continue;
    }
    break;
  }

LABEL_16:
  __int128 v62 = 0u;
  __int128 v63 = 0u;
  __int128 v60 = 0u;
  __int128 v61 = 0u;
  double v13 = (void *)objc_claimAutoreleasedReturnValue([v1 tapBehaviors]);
  id v14 = [v13 countByEnumeratingWithState:&v60 objects:v70 count:16];
  if (!v14) {
    goto LABEL_31;
  }
  id v15 = v14;
  uint64_t v16 = *(void *)v61;
  uint64_t v17 = AXSSSwitchControlTapBehaviorDefault;
  uint64_t v18 = AXSSSwitchControlTapBehaviorAuto;
  uint64_t v19 = AXSSSwitchControlTapBehaviorAlways;
  while (2)
  {
    uint64_t v20 = 0LL;
    while (2)
    {
      if (*(void *)v61 != v16) {
        objc_enumerationMutation(v13);
      }
      uint64_t v21 = *(void **)(*((void *)&v60 + 1) + 8 * v20);
      if ([v21 isEqualToString:v17])
      {
        uint64_t v22 = 0LL;
LABEL_30:
        [v2 setSwitchControlTapBehavior:v22];
        goto LABEL_31;
      }

      if ([v21 isEqualToString:v18])
      {
        uint64_t v22 = 1LL;
        goto LABEL_30;
      }

      if ([v21 isEqualToString:v19])
      {
        uint64_t v22 = 2LL;
        goto LABEL_30;
      }

      if (v15 != (id)++v20) {
        continue;
      }
      break;
    }

    id v15 = [v13 countByEnumeratingWithState:&v60 objects:v70 count:16];
    if (v15) {
      continue;
    }
    break;
  }

      id v14 = 0LL;
    }
  }

  else
  {
    if (v6) {
      double v13 = objc_claimAutoreleasedReturnValue([v10 nextSiblingOfElement:v8 didWrap:a5]);
    }
    else {
      double v13 = objc_claimAutoreleasedReturnValue([v10 previousSiblingOfElement:v8 didWrap:a5]);
    }
    id v14 = (void *)v13;

    if (!v14)
    {
      uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(-[HNDAccessibilityManager elementFetcher](self, "elementFetcher"));
      uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v17 closestElementToElement:v8]);

      if ([v18 isKeyboardKey]) {
        id v14 = (void *)objc_claimAutoreleasedReturnValue( -[HNDAccessibilityManager _itemForScanningFromItem:inDirection:didWrap:]( self,  "_itemForScanningFromItem:inDirection:didWrap:",  v18,  v6,  a5));
      }
      else {
        id v14 = 0LL;
      }
    }
  }

  if (a4) {
    *a4 = v23;
  }

  return v10;
}

  if (a4) {
    *a4 = v23;
  }

  return v10;
}

  return 1;
}

    -[SCATScannerManager _resetRecipeTimeoutIfApplicable](self, "_resetRecipeTimeoutIfApplicable");
    uint64_t v9 = v25;
  }
}

        id v15 = 0LL;
        goto LABEL_17;
      }
    }

    else if (a5)
    {
      goto LABEL_8;
    }

    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[SCATElementManager auxiliaryElementManagers](self, "auxiliaryElementManagers"));
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", __b[0]));
    id v14 = (void *)objc_claimAutoreleasedReturnValue([v16 objectForKeyedSubscript:v17]);

    if (!v14) {
      goto LABEL_16;
    }
    goto LABEL_13;
  }

  id v15 = 0LL;
LABEL_18:

  return v15;
}

LABEL_31:
  __int128 v58 = 0u;
  __int128 v59 = 0u;
  __int128 v56 = 0u;
  __int128 v57 = 0u;
  uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([v1 cursorSizes]);
  id v24 = [v23 countByEnumeratingWithState:&v56 objects:v69 count:16];
  if (!v24) {
    goto LABEL_45;
  }
  id v25 = v24;
  uint64_t v26 = *(void *)v57;
  uint64_t v27 = AXSSSwitchControlCursorSizeSmall;
  uint64_t v28 = AXSSSwitchControlCursorSizeMedium;
  uint64_t v29 = AXSSSwitchControlCursorSizeLarge;
  while (2)
  {
    uint64_t v30 = 0LL;
    while (2)
    {
      if (*(void *)v57 != v26) {
        objc_enumerationMutation(v23);
      }
      id v31 = *(void **)(*((void *)&v56 + 1) + 8 * v30);
      if (([v31 isEqualToString:v27] & 1) != 0
        || ([v31 isEqualToString:v28] & 1) != 0)
      {
        uint64_t v32 = 0LL;
LABEL_44:
        [v2 setAssistiveTouchScannerCursorHighVisibilityEnabled:v32];
        goto LABEL_45;
      }

      if ([v31 isEqualToString:v29])
      {
        uint64_t v32 = 1LL;
        goto LABEL_44;
      }

      if (v25 != (id)++v30) {
        continue;
      }
      break;
    }

    id v25 = [v23 countByEnumeratingWithState:&v56 objects:v69 count:16];
    if (v25) {
      continue;
    }
    break;
  }

LABEL_57:
  [v1 autoScanningInterval];
  double v42 = AXSSSwitchControlTimeIntervalNotApplicable;
  if (v43 != AXSSSwitchControlTimeIntervalNotApplicable)
  {
    [v1 autoScanningInterval];
    objc_msgSend(v2, "setAssistiveTouchStepInterval:");
  }

  [v1 autoHideTimeout];
  if (v44 != v42)
  {
    [v1 autoHideTimeout];
    objc_msgSend(v2, "setAssistiveTouchScanTimeout:");
  }

  [v1 pauseOnFirstItemInterval];
  if (v45 == v42)
  {
    [v2 setAssistiveTouchDelayAfterInputEnabled:0];
  }

  else
  {
    [v2 setAssistiveTouchDelayAfterInputEnabled:1];
    [v1 pauseOnFirstItemInterval];
    objc_msgSend(v2, "setAssistiveTouchDelayAfterInput:");
  }

  objc_msgSend(v2, "setAssistiveTouchScanCycles:", objc_msgSend(v1, "numberOfScanLoops"));
  [v1 dwellDuration];
  if (v46 != v42)
  {
    [v1 dwellDuration];
    objc_msgSend(v2, "setSwitchControlDwellTime:");
  }

  [v1 repeatActionInterval];
  if (v47 == v42)
  {
    [v2 setAssistiveTouchActionRepeatEnabled:0];
  }

  else
  {
    [v2 setAssistiveTouchActionRepeatEnabled:1];
    [v1 repeatActionInterval];
    objc_msgSend(v2, "setAssistiveTouchActionRepeatInterval:");
  }

  [v1 holdDuration];
  if (v48 == v42)
  {
    [v2 setAssistiveTouchInputHoldEnabled:0];
  }

  else
  {
    [v2 setAssistiveTouchInputHoldEnabled:1];
    [v1 holdDuration];
    objc_msgSend(v2, "setAssistiveTouchInputHoldDuration:");
  }

  [v1 ignoreRepeatDuration];
  if (v49 == v42)
  {
    [v2 setAssistiveTouchInputCoalescingEnabled:0];
  }

  else
  {
    [v2 setAssistiveTouchInputCoalescingEnabled:1];
    [v1 ignoreRepeatDuration];
    objc_msgSend(v2, "setAssistiveTouchInputCoalescingDuration:");
  }

  objc_msgSend(v2, "setAssistiveTouchScannerSoundEnabled:", objc_msgSend(v1, "soundEffectsEnabled"));
  objc_msgSend(v2, "setAssistiveTouchScannerSpeechEnabled:", objc_msgSend(v1, "speechEnabled"));
  [v1 longPressDuration];
  if (v50 == v42)
  {
    [v2 setAssistiveTouchLongPressEnabled:0];
  }

  else
  {
    [v2 setAssistiveTouchLongPressEnabled:1];
    [v1 longPressDuration];
    objc_msgSend(v2, "setAssistiveTouchLongPressDuration:");
  }

  [v1 autoTapTimeout];
  if (v51 != v42)
  {
    [v1 autoTapTimeout];
    objc_msgSend(v2, "setSwitchControlAutoTapTimeout:");
  }
}

LABEL_18:
  return v55;
}

    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue( -[HNDAccessibilityManager scannerElementMatchingElement:]( self,  "scannerElementMatchingElement:",  v6));
  }

  else
  {
    uint64_t v17 = 0LL;
  }

  return v17;
}
}

      uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v5,  v6,  3LL));
LABEL_19:

      return v21;
  }
}

    uint64_t v16 = (id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v25, 1LL));
LABEL_22:

    goto LABEL_12;
  }

  v150[0] = @"device_appSwitcher";
  v149[0] = @"identifier";
  v149[1] = @"title";
  uint64_t v8 = sub_10002B014(@"Device-App-Switcher");
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v149[2] = @"activateBehavior";
  v150[1] = v9;
  v150[2] = &off_10012FB98;
  id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v150,  v149,  3LL));
  v151 = v10;
  CGFloat v11 = &v151;
LABEL_11:
  uint64_t v16 = (id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v11, 1LL));
LABEL_12:

LABEL_13:
LABEL_14:

  return v16;
}

void sub_10002E444( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
}

void sub_10002E468(id *a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(+[SCATScannerManager sharedManager](&OBJC_CLASS___SCATScannerManager, "sharedManager"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 menu]);
  [v3 presentWithElement:0];

  a1 += 4;
  id WeakRetained = objc_loadWeakRetained(a1);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained delegate]);
  id v5 = objc_loadWeakRetained(a1);
  [v4 finishScanningAppleTVRemote:v5];
}

id sub_10002EE94(uint64_t a1)
{
  id result = [*(id *)(a1 + 32) isActive];
  if ((_DWORD)result)
  {
    id result = [*(id *)(a1 + 32) forcePause];
    if ((result & 1) == 0)
    {
      unsigned __int8 v3 = [*(id *)(a1 + 32) isSpeakingFocusContext];
      id v4 = *(void **)(a1 + 32);
      if ((v3 & 1) != 0)
      {
        return [v4 setShouldScanToNextFocusContextAfterSpeaking:1];
      }

      else
      {
        [v4 _stepToNextFocusContextInDirection:0];
        return [*(id *)(a1 + 32) _autoscanToNextFocusContext];
      }
    }
  }

  return result;
}

void sub_10002F940(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  uint64_t v6 = objc_alloc(&OBJC_CLASS___SCATControllableDevicesMenuItem);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@%lu",  @"controllableDevice",  a3));
  uint64_t v8 = -[SCATControllableDevicesMenuItem initWithIdentifier:delegate:searchResult:]( v6,  "initWithIdentifier:delegate:searchResult:",  v7,  *(void *)(a1 + 32),  v5);

  [*(id *)(a1 + 40) addObject:v8];
}

void sub_100030A30( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id *location)
{
}

void sub_100030A88(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _goBackInMenuState:3];
}

void sub_100030AB8(uint64_t a1)
{
  id v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained && WeakRetained[148])
  {
    id v4 = WeakRetained;
    id v3 = objc_loadWeakRetained(v1);
    [v3 _updateNubbitFadedProperties];

    id WeakRetained = v4;
  }
}

id sub_100030B14(uint64_t a1)
{
  return [*(id *)(a1 + 32) _preloadInitialMenuItems];
}

void sub_100030B1C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setInitialItems:0];
}

id sub_100030FF8(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 88) setSelected:1];
}

void sub_10003157C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

uint64_t sub_100031594(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_1000315A4(uint64_t a1)
{
}

void sub_1000315AC(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v7 = a2;
  objc_msgSend(*(id *)(a1 + 32), "convertPoint:toView:", v7, *(double *)(a1 + 48), *(double *)(a1 + 56));
  if (objc_msgSend(v7, "pointInside:withEvent:", 0))
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL), a2);
    *a4 = 1;
  }
}

void sub_100031D40( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, char a29)
{
}

void sub_100031D60(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 192);
  *(void *)(v2 + 192) = 0LL;
}

void *sub_100031DA0(uint64_t a1)
{
  id result = *(void **)(a1 + 32);
  if (!result[24])
  {
    id result = [result style];
    if ((_DWORD)result)
    {
      v3[0] = _NSConcreteStackBlock;
      v3[1] = 3221225472LL;
      v3[2] = sub_100031E3C;
      v3[3] = &unk_100121D18;
      v3[4] = *(void *)(a1 + 32);
      return +[UIView animateWithDuration:animations:](&OBJC_CLASS___UIView, "animateWithDuration:animations:", v3, 0.2);
    }
  }

  return result;
}

id sub_100031E3C(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateBackButtonVisibility];
}

id sub_100031E44(uint64_t a1)
{
  return [*(id *)(a1 + 32) showVolumeBar:0 withProgress:*(double *)(*(void *)(a1 + 32) + 104)];
}

void sub_100034548(_Unwind_Exception *a1)
{
}

void sub_100034A5C(id a1)
{
  v6[0] = AXAssistiveTouchIconTypeNotificationCenter;
  v6[1] = AXAssistiveTouchIconTypeSiri;
  _DWORD v6[2] = AXAssistiveTouchIconTypeTypeToSiri;
  v6[3] = AXAssistiveTouchIconTypeControlCenter;
  void v6[4] = AXAssistiveTouchIconTypeAppSwitcher;
  v6[5] = AXAssistiveTouchIconTypeScreenshot;
  v6[6] = AXAssistiveTouchIconTypeVoiceControl;
  v6[7] = AXAssistiveTouchIconTypeRebootDevice;
  v6[8] = AXAssistiveTouchIconTypeSOS;
  v6[9] = AXAssistiveTouchIconTypeToggleDock;
  v6[10] = AXAssistiveTouchIconTypeArmApplePay;
  v6[11] = AXAssistiveTouchIconTypeDetectionMode;
  v6[12] = AXAssistiveTouchIconTypeCamera;
  v6[13] = AXAssistiveTouchIconTypeFrontFacingCamera;
  v6[14] = AXAssistiveTouchIconTypeSideApp;
  uint64_t v1 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v6, 15LL));
  uint64_t v2 = (void *)qword_100157678;
  qword_100157678 = v1;

  id v3 = [(id)qword_100157678 mutableCopy];
  [v3 addObject:AXAssistiveTouchIconTypeHome];
  [v3 addObject:AXAssistiveTouchIconTypeOrientation];
  id v4 = [v3 copy];
  id v5 = (void *)qword_100157680;
  qword_100157680 = (uint64_t)v4;
}

void sub_100034BF0(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained[17] cancel];
  [WeakRetained _notificationCenterPressed];
}

void sub_100034C30(uint64_t a1, void *a2)
{
  uint64_t v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _pinchPressed:v3 mode:1];
}

void sub_100034C7C(uint64_t a1, void *a2)
{
  uint64_t v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _pinchPressed:v3 mode:0];
}

void sub_100034CC8(uint64_t a1, void *a2)
{
  uint64_t v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _pinchPressed:v3 mode:2];
}

void sub_100034D14(uint64_t a1, void *a2)
{
  uint64_t v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _doubleTapPressed:v3 fromButtonPress:0];
}

void sub_100034D60(uint64_t a1, void *a2)
{
  uint64_t v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _longPressPressed:v3 fromButtonPress:0];
}

void sub_100034DAC(uint64_t a1, void *a2)
{
  uint64_t v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _dragAndDropPressed:v3 fromButtonPress:0 dragMenu:0];
}

void sub_100034DFC(uint64_t a1, void *a2)
{
  uint64_t v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _dragAndDropPressed:v3 fromButtonPress:0 dragMenu:1];
}

void sub_100034E4C(uint64_t a1, void *a2)
{
  uint64_t v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _spotlightPressed:v3];
}

void sub_100034E94(uint64_t a1, void *a2)
{
  uint64_t v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _orbPressed:v3 fromButtonPress:0];
}

void sub_100034EE0(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _activateLockButton];
}

void sub_100034F0C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _volumeDown:1];
}

void sub_100034F3C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _volumeDown:0];
}

void sub_100034F6C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _volumeUp:1];
}

void sub_100034F9C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _volumeUp:0];
}

void sub_100034FCC(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _tripleClickHomePressed];
}

void sub_100034FF8(uint64_t a1, void *a2)
{
  uint64_t v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _orientationPressed:v3];
}

void sub_100035040(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _ringerPressed:1];
}

void sub_100035070(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _actionButtonPressed];
}

void sub_10003509C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _cameraButtonPressed];
}

void sub_1000350C8(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _cameraButtonLightPressed];
}

void sub_1000350F4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _cameraButtonDoubleLightPressed];
}

void sub_100035120(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _openVisualIntelligence];
}

void sub_10003514C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _rotationLockPressed];
}

void sub_100035178(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _screenshotPressed];
}

void sub_1000351A4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _shakePressed];
}

void sub_1000351D0(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _toggleAppSwitcher];
}

void sub_1000351FC(uint64_t a1, void *a2)
{
  uint64_t v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = (id *)objc_loadWeakRetained(v2);
  [WeakRetained[17] cancel];
  [WeakRetained _hardwareButtonPressed:v3];
}

void sub_100035258(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained[17] cancel];
  [WeakRetained _controlCenterPressed];
}

void sub_100035298(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _homeButton:1];
}

void sub_1000352C8(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _homeButton:0];
}

void sub_1000352F8(uint64_t a1, void *a2)
{
  id v5 = a2;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = WeakRetained;
  if (*((_BYTE *)WeakRetained + 96))
  {
    [WeakRetained[17] cancel];
    [v4 _customsPressed:v5];
  }

  else
  {
    [v5 setHighlighted:0];
  }
}

void sub_100035374(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained[17] cancel];
  [WeakRetained _siriButtonPressed];
}

void sub_1000353B4(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained[17] cancel];
  [WeakRetained _typeToSiriButtonPressed];
}

void sub_1000353F4(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained[17] cancel];
  [WeakRetained _voiceControlPressed];
}

void sub_100035434(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _commandAndControlPressed];
}

void sub_100035460(uint64_t a1, void *a2)
{
  uint64_t v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = (id *)objc_loadWeakRetained(v2);
  [WeakRetained[17] cancel];
  [WeakRetained _gesturesPressed:v3];
}

void sub_1000354BC(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _sosPressed];
}

void sub_1000354E8(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _detectionModePresssed];
}

void sub_100035514(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _dimFlashingLightsPressed];
}

void sub_100035540(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _rebootDevicePressed];
}

void sub_10003556C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _reachabilityPressed];
}

void sub_100035598(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _speakScreenPressed];
}

void sub_1000355C4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _sysdiagnosePressed];
}

void sub_1000355F0(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _dockPressed];
}

void sub_10003561C(uint64_t a1, void *a2)
{
  uint64_t v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _applePayButtonPressed:v3];
}

void sub_100035664(uint64_t a1, void *a2)
{
  uint64_t v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _sideAppPressed:v3];
}

void sub_1000356AC(uint64_t a1, void *a2)
{
  uint64_t v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = (id *)objc_loadWeakRetained(v2);
  [WeakRetained[17] cancel];
  [WeakRetained _scrollPressed:v3];
}

void sub_100035708(uint64_t a1, void *a2)
{
  uint64_t v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _scrollPressed:v3 fromButtonPress:0 vertical:1 forward:0 max:0];
}

void sub_100035760(uint64_t a1, void *a2)
{
  uint64_t v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _scrollPressed:v3 fromButtonPress:0 vertical:1 forward:1 max:0];
}

void sub_1000357B8(uint64_t a1, void *a2)
{
  uint64_t v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _scrollPressed:v3 fromButtonPress:0 vertical:0 forward:0 max:0];
}

void sub_100035810(uint64_t a1, void *a2)
{
  uint64_t v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _scrollPressed:v3 fromButtonPress:0 vertical:0 forward:1 max:0];
}

void sub_100035868(uint64_t a1, void *a2)
{
  uint64_t v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _scrollPressed:v3 fromButtonPress:0 vertical:1 forward:0 max:1];
}

void sub_1000358C0(uint64_t a1, void *a2)
{
  uint64_t v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _scrollPressed:v3 fromButtonPress:0 vertical:1 forward:1 max:1];
}

void sub_100035918(uint64_t a1, void *a2)
{
  id v3 = (id *)(a1 + 40);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  [WeakRetained _continuousScrollPressed:v4 fromButtonPress:0 inDirection:1 iconType:*(void *)(a1 + 32)];
}

void sub_100035978(uint64_t a1, void *a2)
{
  id v3 = (id *)(a1 + 40);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  [WeakRetained _continuousScrollPressed:v4 fromButtonPress:0 inDirection:0 iconType:*(void *)(a1 + 32)];
}

void sub_1000359D8(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _cameraPressed];
}

void sub_100035A04(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _frontFacingCameraPressed];
}

void sub_100035A30(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _customGesturePressed:*(void *)(a1 + 32) fromButtonPress:0];
}

void sub_10003613C(uint64_t a1, void *a2, uint64_t a3)
{
  id v4 = *(void **)(a1 + 32);
  id v5 = a2;
  id v6 = (id)objc_claimAutoreleasedReturnValue([v4 objectAtIndexedSubscript:a3]);
  [v5 setLocation:v6];
}

void sub_1000365F4( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id *location, id *a12)
{
}

void sub_100036678(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _handleTouch:4];
}

void sub_1000366A8(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _handleTouch:3];
}

void sub_1000366D8(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _handleTouch:2];
}

void sub_100036708(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _handleTouch:5];
}

void sub_100036A94(id a1, HNDRockerButton *a2)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(+[AXPISystemActionHelper sharedInstance](&OBJC_CLASS___AXPISystemActionHelper, "sharedInstance"));
  [v2 rotateUpsideDown];
}

void sub_100036AC8(id a1, HNDRockerButton *a2)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(+[AXPISystemActionHelper sharedInstance](&OBJC_CLASS___AXPISystemActionHelper, "sharedInstance"));
  [v2 rotateRight];
}

void sub_100036AFC(id a1, HNDRockerButton *a2)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(+[AXPISystemActionHelper sharedInstance](&OBJC_CLASS___AXPISystemActionHelper, "sharedInstance"));
  [v2 rotatePortrait];
}

void sub_100036B30(id a1, HNDRockerButton *a2)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(+[AXPISystemActionHelper sharedInstance](&OBJC_CLASS___AXPISystemActionHelper, "sharedInstance"));
  [v2 rotateLeft];
}

void sub_100036D74(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a2;
  id v10 = (id)objc_claimAutoreleasedReturnValue([v5 scrollItems]);
  id v7 = *(void **)(a1 + 32);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) objectAtIndexedSubscript:a3]);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v7 _rockerButtonForLocation:v8 buttonType:v6]);

  [v10 addObject:v9];
}

BOOL sub_100036F8C(id a1, UIView *a2, unint64_t a3, BOOL *a4)
{
  return -[UIView safeIntegerForKey:](a2, "safeIntegerForKey:", @"tag", a4) == (id)100;
}

BOOL sub_100037020(id a1, UIView *a2, unint64_t a3)
{
  return -[UIView safeIntegerForKey:](a2, "safeIntegerForKey:", @"tag") == (id)112;
}

void sub_100037640(_Unwind_Exception *a1)
{
}

void sub_100037678(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _ringerPressed:0];
}

id sub_1000376A8(uint64_t a1)
{
  return [*(id *)(a1 + 32) _actionButtonPressed];
}

void sub_1000376B0(uint64_t a1, void *a2)
{
  uint64_t v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _morePressed:v3];
}

id sub_100037888(uint64_t a1)
{
  id result = [*(id *)(a1 + 32) _menuExited];
  *(void *)(*(void *)(a1 + 32) + 32LL) = 1LL;
  return result;
}

void sub_100037DE4( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id *location, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, id a28)
{
}

void sub_100037E30(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6 = a2;
  if ((unint64_t)[*(id *)(a1 + 32) count] < 8)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 name]);
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_100037F9C;
    v11[3] = &unk_100122C80;
    objc_copyWeak(&v13, (id *)(a1 + 56));
    id v12 = v6;
    LOBYTE(v10) = 1;
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[HNDRockerButton buttonWithTitle:imageName:downBlock:upBlock:dataSource:showWithGuidedAccess:showWithAssistiveAccess:]( &OBJC_CLASS___HNDRockerButton,  "buttonWithTitle:imageName:downBlock:upBlock:dataSource:showWithGuidedAccess:showWithAssistiveAccess:",  v7,  @"IconFavorites",  0LL,  v11,  *(void *)(a1 + 40),  1LL,  v10));

    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "objectAtIndexedSubscript:", objc_msgSend(*(id *)(a1 + 32), "count")));
    [v8 setLocation:v9];

    [v8 setCustomTitle:1];
    [*(id *)(a1 + 32) addObject:v8];

    objc_destroyWeak(&v13);
  }

  else
  {
    *a4 = 1;
  }
}

void sub_100037F84(_Unwind_Exception *a1)
{
}

void sub_100037F9C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _customGesturePressed:*(void *)(a1 + 32) fromButtonPress:0];
}

void sub_100037FDC(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _addFavoriteBoxPressed];
}

void sub_1000386BC(id a1, id a2, unint64_t a3, BOOL *a4)
{
}

id sub_1000386C8(uint64_t a1)
{
  return [*(id *)(a1 + 40) layoutIfNeeded];
}

void sub_10003872C(id a1, id a2, unint64_t a3, BOOL *a4)
{
}

id sub_100038738(uint64_t a1)
{
  id result = [*(id *)(a1 + 32) isEqualToArray:*(void *)(*(void *)(a1 + 40) + 48)];
  if (*(_BYTE *)(a1 + 48)) {
    return [*(id *)(a1 + 40) _updateKeyboardFocusIfNeeded];
  }
  return result;
}

void sub_100038798(id a1, id a2, unint64_t a3, BOOL *a4)
{
}

id sub_1000387A0(uint64_t a1)
{
  if (v2 == 1.0)
  {
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    void v13[2] = sub_100038918;
    v13[3] = &unk_100121D18;
    v13[4] = *(void *)(a1 + 32);
    +[UIView performWithoutAnimation:](&OBJC_CLASS___UIView, "performWithoutAnimation:", v13);
  }

  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  id v3 = *(id *)(a1 + 40);
  id v4 = [v3 countByEnumeratingWithState:&v9 objects:v14 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      id v7 = 0LL;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        objc_msgSend( *(id *)(*((void *)&v9 + 1) + 8 * (void)v7),  "setTranslatesAutoresizingMaskIntoConstraints:",  1,  (void)v9);
        id v7 = (char *)v7 + 1;
      }

      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v9 objects:v14 count:16];
    }

    while (v5);
  }

  return [*(id *)(a1 + 32) _layoutButtonsWithViewForCenteringAtStart:0 includingBackButton:0];
}

id sub_100038918(uint64_t a1)
{
  double v2 = *(id **)(a1 + 32);
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2[25] contentView]);
  [v2 _centerBackButtonToView:v3];

  return [*(id *)(a1 + 32) layoutIfNeeded];
}

void sub_100038B9C(id a1, id a2, unint64_t a3, BOOL *a4)
{
}

id sub_100038BA8(uint64_t a1)
{
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v8 = 0u;
  __int128 v9 = 0u;
  id v2 = *(id *)(a1 + 32);
  id v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0LL;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend( *(id *)(*((void *)&v8 + 1) + 8 * (void)v6),  "setTranslatesAutoresizingMaskIntoConstraints:",  1,  (void)v8);
        uint64_t v6 = (char *)v6 + 1;
      }

      while (v4 != v6);
      id v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }

    while (v4);
  }

  return [*(id *)(a1 + 40) _layoutButtonsWithViewForCenteringAtStart:*(void *)(a1 + 48) includingBackButton:1];
}

void sub_100038CB4(id a1, id a2, unint64_t a3, BOOL *a4)
{
}

id sub_100038CC0(uint64_t a1)
{
  id result = [*(id *)(a1 + 32) enumerateObjectsUsingBlock:&stru_100122F48];
  if (*(_BYTE *)(a1 + 48)) {
    return [*(id *)(a1 + 40) _updateKeyboardFocusIfNeeded];
  }
  return result;
}

void sub_100038D04(id a1, id a2, unint64_t a3, BOOL *a4)
{
  id v4 = a2;
}

LABEL_139:
  }

  else
  {
    if (![v6 isEqualToString:AXAssistiveTouchIconTypePassThroughToApp])
    {
      __int128 v10 = 0;
      goto LABEL_14;
    }

    v40[4] = self;
    v41[0] = _NSConcreteStackBlock;
    v41[1] = 3221225472LL;
    v41[2] = sub_100039990;
    v41[3] = &unk_100121D18;
    v41[4] = self;
    v40[0] = _NSConcreteStackBlock;
    v40[1] = 3221225472LL;
    v40[2] = sub_1000399C4;
    v40[3] = &unk_100121D40;
    +[UIView animateWithDuration:animations:completion:]( &OBJC_CLASS___UIView,  "animateWithDuration:animations:completion:",  v41,  v40,  0.15);
  }

void sub_100039990(uint64_t a1)
{
  id v1 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) window]);
  [v1 setAlpha:0.0];
}

uint64_t sub_1000399C4(uint64_t a1)
{
  double Center = AX_CGRectGetCenter([*(id *)(a1 + 32) bounds]);
  double v4 = v3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) window]);
  objc_msgSend(*(id *)(a1 + 32), "convertPoint:toView:", 0, Center, v4);
  objc_msgSend(v5, "convertPoint:toWindow:", 0);
  double v7 = v6;
  double v9 = v8;

  __int128 v10 = (void *)objc_claimAutoreleasedReturnValue(+[HNDHandManager sharedManager](&OBJC_CLASS___HNDHandManager, "sharedManager"));
  __int128 v11 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) hardwareIdentifier]);
  objc_msgSend(v10, "performFingerDownAtPoint:onDisplay:", v11, v7, v9);

  __int128 v12 = (void *)objc_claimAutoreleasedReturnValue(+[HNDHandManager sharedManager](&OBJC_CLASS___HNDHandManager, "sharedManager"));
  id v13 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) hardwareIdentifier]);
  objc_msgSend(v12, "performFingerUpAtPoint:onDisplay:", v13, v7, v9);

  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_100039B04;
  v16[3] = &unk_100121D18;
  v16[4] = *(void *)(a1 + 32);
  return AXPerformBlockOnMainThreadAfterDelay(v16, v14, 0.5);
}

id sub_100039B04(uint64_t a1)
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472LL;
  v2[2] = sub_100039B6C;
  v2[3] = &unk_100121D18;
  v2[4] = *(void *)(a1 + 32);
  return +[UIView animateWithDuration:animations:](&OBJC_CLASS___UIView, "animateWithDuration:animations:", v2, 0.15);
}

void sub_100039B6C(uint64_t a1)
{
  id v1 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) window]);
  [v1 setAlpha:1.0];
}

id sub_10003A598(uint64_t a1)
{
  id v2 = *(void **)(*(void *)(a1 + 32) + 224LL);
  double v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) allValues]);
  [v2 centerItems:v3 withView:*(void *)(a1 + 48)];

  if (*(_BYTE *)(a1 + 56)) {
    [*(id *)(a1 + 32) _centerBackButtonToView:*(void *)(a1 + 48)];
  }
  return [*(id *)(a1 + 32) layoutIfNeeded];
}

void sub_10003A604(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 setAlpha:1.0];
  [*(id *)(a1 + 32) _updateRockerItemIfNeededForItem:v3];
  [v3 setUserInteractionEnabled:1];
}

void sub_10003AAE8(uint64_t a1, void *a2)
{
  id v3 = a2;
  double v4 = v3;
  id v8 = v3;
  if (*(_BYTE *)(a1 + 32) && (v5 = [v3 showWithGuidedAccess], double v4 = v8, !v5))
  {
    uint64_t v7 = 1LL;
  }

  else if (*(_BYTE *)(a1 + 33))
  {
    unsigned int v6 = [v4 showWithAssistiveAccess];
    double v4 = v8;
    uint64_t v7 = v6 ^ 1;
  }

  else
  {
    uint64_t v7 = 0LL;
  }

  [v4 setHidden:v7];
}

void sub_10003AB64(id a1)
{
  v3[0] = AXAssistiveTouchIconTypeNotificationCenter;
  v3[1] = AXAssistiveTouchIconTypeControlCenter;
  v3[2] = AXAssistiveTouchIconTypeAppSwitcher;
  v3[3] = AXAssistiveTouchIconTypeScreenshot;
  v3[4] = AXAssistiveTouchIconTypeVoiceControl;
  void v3[5] = AXAssistiveTouchIconTypeDetectionMode;
  v3[6] = AXAssistiveTouchIconTypeCamera;
  v3[7] = AXAssistiveTouchIconTypeFrontFacingCamera;
  v3[8] = AXAssistiveTouchIconTypeTripleClick;
  uint64_t v1 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v3, 9LL));
  id v2 = (void *)qword_100157690;
  qword_100157690 = v1;
}

void sub_10003AC50(uint64_t a1, void *a2)
{
  if (*(_BYTE *)(a1 + 32))
  {
    id v2 = (void *)qword_100157690;
    id v3 = a2;
    id v4 = (id)objc_claimAutoreleasedReturnValue([v3 type]);
    objc_msgSend(v3, "setDisabled:", objc_msgSend(v2, "containsObject:"));
  }

  else
  {
    id v4 = a2;
    [v4 setDisabled:0];
  }
}

void sub_10003ACC8(id a1, UIView *a2, unint64_t a3, BOOL *a4)
{
}

BOOL sub_10003AD78(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6 = [a2 tag];
  id v7 = (id)*(unsigned int *)(a1 + 32);
  if (v6 == v7) {
    *a4 = 1;
  }
  return v6 == v7;
}

LABEL_17:
}

  return v34;
}
}
}

  *(void *)&uint64_t v20 = objc_opt_class(a1, v17).n128_u64[0];
  uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "updateBlockForIdentifier:", v9, v20));
  LOBYTE(v25) = v14;
  uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue( +[SCATModernMenuItem itemWithIdentifier:delegate:title:imageName:activateBehavior:allowedWithGuidedAccess:allowedWithAssistiveAccess:activateHandler:updateHandler:]( &OBJC_CLASS___SCATModernMenuItem,  "itemWithIdentifier:delegate:title:imageName:activateBehavior:allowedWithGuidedAccess:allowedWithAssi stiveAccess:activateHandler:updateHandler:",  v9,  v8,  v30,  v29,  v27,  v26,  v25,  v18,  v22));

  [v23 setAllowsDwellScanningToAbortAfterTimeout:v28];
  return v23;
}

void sub_10003B82C(id a1)
{
  id v1 = (id)objc_claimAutoreleasedReturnValue(+[AXPISystemActionHelper sharedInstance](&OBJC_CLASS___AXPISystemActionHelper, "sharedInstance"));
  [v1 activateVoiceControl];
}

void sub_10003B884(id a1)
{
  id v1 = (id)objc_claimAutoreleasedReturnValue(+[AXPISystemActionHelper sharedInstance](&OBJC_CLASS___AXPISystemActionHelper, "sharedInstance"));
  [v1 activateSiri];
}

void sub_10003B8DC(id a1)
{
  id v1 = (id)objc_claimAutoreleasedReturnValue(+[AXPISystemActionHelper sharedInstance](&OBJC_CLASS___AXPISystemActionHelper, "sharedInstance"));
  [v1 activateTypeToSiri];
}

void sub_10003B934(id a1)
{
  id v1 = (id)objc_claimAutoreleasedReturnValue(+[AXPISystemActionHelper sharedInstance](&OBJC_CLASS___AXPISystemActionHelper, "sharedInstance"));
  [v1 activateTripleClick];
}

void sub_10003B99C(id a1)
{
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(25LL, 0LL);
  id v2 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  dispatch_async(v2, &stru_100123118);
}

void sub_10003B9D8(id a1)
{
  id v1 = (id)objc_claimAutoreleasedReturnValue(+[AXPISystemActionHelper sharedInstance](&OBJC_CLASS___AXPISystemActionHelper, "sharedInstance"));
  [v1 toggleNotificationCenter];
}

void sub_10003BA40(id a1)
{
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(25LL, 0LL);
  id v2 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  dispatch_async(v2, &stru_100123158);
}

void sub_10003BA7C(id a1)
{
  id v1 = (id)objc_claimAutoreleasedReturnValue(+[AXPISystemActionHelper sharedInstance](&OBJC_CLASS___AXPISystemActionHelper, "sharedInstance"));
  [v1 toggleControlCenter];
}

void sub_10003BAD4(id a1)
{
  id v1 = (id)objc_claimAutoreleasedReturnValue(+[AXPISystemActionHelper sharedInstance](&OBJC_CLASS___AXPISystemActionHelper, "sharedInstance"));
  [v1 takeScreenshot];
}

id sub_10003BF14(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) showBannerWithText:a2];
}

id sub_10003C2BC(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[HNDHandManager sharedManager](&OBJC_CLASS___HNDHandManager, "sharedManager"));
  [v3 volumeLevel];
  objc_msgSend(v2, "showVolumeBar:withProgress:", 1);

  id result = [*(id *)(*(void *)(a1 + 32) + 184) isCancelled];
  return result;
}

id sub_10003C55C(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateRotationLockSwitch];
}

id sub_10003C67C(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateRingerSwitch];
}

id sub_10003C880(uint64_t a1)
{
  return [*(id *)(a1 + 32) _menuExited];
}

void sub_10003CCC0(id a1, id a2, unint64_t a3, BOOL *a4)
{
}

id sub_10003CCCC(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:0.0];
}

void sub_10003CE88(id a1, id a2, unint64_t a3, BOOL *a4)
{
}

id sub_10003D038(uint64_t a1)
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_10003D0B8;
  v3[3] = &unk_100121D18;
  v3[4] = *(void *)(a1 + 32);
  id result = +[UIView animateWithDuration:animations:](&OBJC_CLASS___UIView, "animateWithDuration:animations:", v3, 0.5);
  *(_BYTE *)(*(void *)(a1 + 32) + 148LL) = 1;
  return result;
}

id sub_10003D0B8(uint64_t a1)
{
  return _[*(id *)(a1 + 32) _resetVisibility:0];
}

id sub_10003D170(uint64_t a1)
{
  return _[*(id *)(a1 + 32) _resetVisibility:1];
}

void sub_10003D5A4(id a1, UIView *a2, unint64_t a3, BOOL *a4)
{
}

id sub_10003D5B0(id result)
{
  uint64_t v1 = *((void *)result + 4);
  if (!*(_BYTE *)(v1 + 168))
  {
    id v2 = result;
    *(_BYTE *)(v1 + 16_Block_object_dispose(va, 8) = 1;
    [*((id *)result + 4) _setBackgroundWithType:0];
    [*((id *)v2 + 4) frame];
    CGRect v6 = CGRectIntegral(v5);
    double v3 = *((double *)v2 + 5);
    double v4 = *((double *)v2 + 6);
    objc_msgSend( *(id *)(*((void *)v2 + 4) + 200),  "bounds",  v6.origin.x,  v6.origin.y,  v6.size.width,  v6.size.height);
    objc_msgSend(*((id *)v2 + 4), "setFrame:", v3, v4);
    [*((id *)v2 + 4) _layoutForegroundImageView];
    if (*((_BYTE *)v2 + 56)) {
      [*(id *)(*((void *)v2 + 4) + 160) setAlpha:1.0];
    }
    [*(id *)(*((void *)v2 + 4) + 48) enumerateObjectsUsingBlock:&stru_100123260];
    [*((id *)v2 + 4) _updateBackButtonVisibility];
    [*(id *)(*((void *)v2 + 4) + 224) centerItems:*(void *)(*((void *)v2 + 4) + 48)];
    return [*((id *)v2 + 4) layoutIfNeeded];
  }

  return result;
}

void sub_10003D6A8(id a1, id a2, unint64_t a3, BOOL *a4)
{
}

id sub_10003D6B4(uint64_t a1)
{
  unsigned int v2 = [*(id *)(a1 + 32) style];
  uint64_t v3 = *(void *)(a1 + 32);
  if (!v2 && !*(_BYTE *)(v3 + 96))
  {
    [*(id *)(v3 + 48) enumerateObjectsUsingBlock:&stru_1001232A8];
    [*(id *)(*(void *)(a1 + 32) + 48) removeAllObjects];
    uint64_t v3 = *(void *)(a1 + 32);
  }

  *(_BYTE *)(v3 + 14_Block_object_dispose(va, 8) = 1;
  if (*(_BYTE *)(a1 + 40)) {
    [*(id *)(a1 + 32) highlightNubbit];
  }
  *(_BYTE *)(*(void *)(a1 + 32) + 168LL) = 0;
  double v4 = (void *)objc_claimAutoreleasedReturnValue(+[HNDHandManager sharedManager](&OBJC_CLASS___HNDHandManager, "sharedManager"));
  [v4 setNubbitMoving:0];

  UIAccessibilityPostNotification(UIAccessibilityScreenChangedNotification, 0LL);
  return [*(id *)(a1 + 32) _updateKeyboardFocusIfNeeded];
}

void sub_10003D780(id a1, id a2, unint64_t a3, BOOL *a4)
{
}

void sub_10003DB00(id a1, id a2, unint64_t a3, BOOL *a4)
{
}

uint64_t sub_10003DB0C(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void *)(result + 32);
  if (!*(_BYTE *)(v2 + 168))
  {
    uint64_t v3 = result;
    *(_BYTE *)(v2 + 16_Block_object_dispose(va, 8) = 1;
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472LL;
    v32[2] = sub_10003DE00;
    v32[3] = &unk_100121D18;
    v32[4] = *(void *)(result + 32);
    AXPerformBlockOnMainThreadAfterDelay(v32, a2, 0.35);
    [*(id *)(v3 + 32) _setBackgroundWithType:1];
    [*(id *)(v3 + 32) _layoutButtonsWithViewForCenteringAtStart:0 includingBackButton:1];
    [*(id *)(v3 + 32) frame];
    [*(id *)(*(void *)(v3 + 32) + 200) bounds];
    double v5 = v4;
    double v7 = v6;
    float v8 = *(double *)(v3 + 48) - v4 * 0.5;
    float v9 = roundf(v8);
    float v10 = *(double *)(v3 + 56) - v6 * 0.5;
    double v11 = roundf(v10);
    __int128 v12 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(v3 + 32) displayManager]);
    [v12 safeAreaInsets];
    double v14 = v13;

    uint64_t v16 = ASTLogCommon(v15);
    uint64_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      double v34 = v14;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "Safe Area: %f", buf, 0xCu);
    }

    double v18 = v9;

    if (v14 > v11)
    {
      uint64_t v20 = ASTLogCommon(v19);
      uint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134217984;
        double v34 = v14;
        _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_INFO,  "Menu is in safe area, moving down: %f",  buf,  0xCu);
      }

      double v11 = v14;
    }

    objc_msgSend(*(id *)(v3 + 32), "setFrame:", v18, v11, v5, v7);
    [*(id *)(v3 + 32) layoutIfNeeded];
    [*(id *)(*(void *)(v3 + 32) + 160) setAlpha:0.0];
    [*(id *)(*(void *)(v3 + 32) + 160) frame];
    double v23 = v22;
    double v25 = v24;
    if ([*(id *)(*(void *)(v3 + 32) + 48) count] == (id)4) {
      uint64_t v26 = 2LL;
    }
    else {
      uint64_t v26 = [*(id *)(*(void *)(v3 + 32) + 48) count] != (id)6
    }
         && [*(id *)(*(void *)(v3 + 32) + 48) count] == (id)8;
    uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(v3 + 32) + 48) objectAtIndex:v26]);
    [v27 frame];
    double v29 = v28;
    double v31 = v30;

    objc_msgSend(*(id *)(*(void *)(v3 + 32) + 160), "setFrame:", v29, v31, v23, v25);
    return (*(uint64_t (**)(void))(*(void *)(v3 + 40) + 16LL))();
  }

  return result;
}

uint64_t sub_10003DE00(uint64_t result)
{
  *(_BYTE *)(*(void *)(result + 32) + 168LL) = 0;
  return result;
}

void sub_10003DE14(uint64_t a1)
{
  *(_BYTE *)(*(void *)(a1 + 32) + 168LL) = 0;
  [*(id *)(a1 + 32) _resetHoverCircleLocation];
  uint64_t v3 = _NSConcreteStackBlock;
  uint64_t v4 = 3221225472LL;
  double v5 = sub_10003DECC;
  double v6 = &unk_100122318;
  uint64_t v2 = *(void **)(a1 + 40);
  uint64_t v7 = *(void *)(a1 + 32);
  id v8 = v2;
  +[UIView animateWithDuration:animations:](&OBJC_CLASS___UIView, "animateWithDuration:animations:", &v3, 0.02);
  UIAccessibilityPostNotification(UIAccessibilityScreenChangedNotification, 0LL);
  objc_msgSend(*(id *)(a1 + 32), "_updateKeyboardFocusIfNeeded", v3, v4, v5, v6, v7);
}

uint64_t sub_10003DECC(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16LL))();
}

void sub_10003ED88(id a1)
{
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](&OBJC_CLASS___UIScreen, "mainScreen"));
  [v1 scale];
  CGFloat v3 = v2;
  v8.CGFloat width = 60.0;
  v8.CGFloat height = 60.0;
  UIGraphicsBeginImageContextWithOptions(v8, 0, v3);

  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](&OBJC_CLASS___UIColor, "clearColor"));
  [v4 set];

  v9.origin.double x = 0.0;
  v9.origin.CGFloat y = 0.0;
  v9.size.CGFloat width = 60.0;
  v9.size.CGFloat height = 60.0;
  UIRectFill(v9);
  ImageFromCurrentImageContext = UIGraphicsGetImageFromCurrentImageContext();
  uint64_t v6 = objc_claimAutoreleasedReturnValue(ImageFromCurrentImageContext);
  uint64_t v7 = (void *)qword_1001576A0;
  qword_1001576A0 = v6;

  UIGraphicsEndImageContext();
}

void sub_10003F5F0(_Unwind_Exception *a1)
{
}

void sub_10003F61C(uint64_t a1, uint64_t a2, void *a3)
{
  CGFloat v3 = (id *)(a1 + 32);
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained(v3);
  [WeakRetained _traitCollectionDidChange:v4];
}

id sub_10003F97C(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateImage];
}

void sub_10003FEB4(uint64_t a1, void *a2)
{
  id v4 = a2;
  uint64_t v6 = *(void *)(a1 + 32);
  double v5 = (id *)(a1 + 32);
  objc_storeStrong((id *)(v6 + 144), a2);
  if (v4)
  {
    [*v5 _updateImageView];
  }

  else
  {
    uint64_t v8 = ASTLogCommon(v7);
    CGRect v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_1000AF58C((uint64_t)v5, v9, v10, v11, v12, v13, v14, v15);
    }
  }
}

void sub_10003FF3C(uint64_t a1, void *a2)
{
  id v4 = a2;
  uint64_t v6 = *(void *)(a1 + 32);
  double v5 = (id *)(a1 + 32);
  objc_storeStrong((id *)(v6 + 152), a2);
  if (v4)
  {
    [*v5 _updateImageView];
  }

  else
  {
    uint64_t v8 = ASTLogCommon(v7);
    CGRect v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_1000AF58C((uint64_t)v5, v9, v10, v11, v12, v13, v14, v15);
    }
  }
}

uint64_t sub_100040144(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_100040154(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue( [*(id *)(a1 + 32) _deviceSpecificImageForName:*(void *)(a1 + 40) screenHeight:*(double *)(a1 + 64)]);
  CGFloat v3 = (void *)objc_claimAutoreleasedReturnValue([v2 imageWithTintColor:*(void *)(a1 + 48) renderingMode:1]);

  id v4 = *(void **)(a1 + 56);
  if (v4)
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472LL;
    v5[2] = sub_100040210;
    v5[3] = &unk_100122280;
    id v7 = v4;
    id v6 = v3;
    AXPerformBlockAsynchronouslyOnMainThread(v5);
  }
}

uint64_t sub_100040210(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16LL))( *(void *)(a1 + 40),  *(void *)(a1 + 32));
}

void sub_100040F80( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

id sub_1000410D4(uint64_t a1)
{
  double v1 = 1.0;
  if (!*(_BYTE *)(a1 + 48)) {
    double v1 = *(double *)(a1 + 40);
  }
  return [*(id *)(a1 + 32) setAlpha:v1];
}

BOOL sub_100041AA4(SCATCursorLayer *self, SEL a2)
{
  return BYTE2(self->super.super._attr.refcount);
}

id sub_100042818(uint64_t a1)
{
  return _[*(id *)(a1 + 32) _performPress:*(void *)(a1 + 40) numberOfPresses:*(void *)(a1 + 48) - 1];
}

id sub_10004282C(uint64_t a1)
{
  return _[*(id *)(a1 + 32) _performPress:*(void *)(a1 + 40) numberOfPresses:*(void *)(a1 + 48) - 1];
}

void sub_1000432C8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
}

void sub_1000432E0(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 0LL;
}

void sub_100043330(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = 0LL;
}

void sub_1000443A8(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) orbPreviewWindow]);
  [*(id *)(a1 + 32) setAxOrbPreviewWindow:v2];

  id v4 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) axOrbPreviewWindow]);
  CGFloat v3 = (void *)objc_claimAutoreleasedReturnValue([v4 uiElement]);
  [v3 updateCacheWithAttributes:&off_10012F640];
}

BOOL sub_100044748(id a1, AXElement *a2)
{
  uint64_t v2 = a2;
  -[AXElement updateCache:](v2, "updateCache:", 3010LL);
  CGFloat v3 = (void *)objc_claimAutoreleasedReturnValue(-[AXElement uiElement](v2, "uiElement"));

  LOBYTE(v2) = [v3 BOOLWithAXAttribute:3010];
  return (char)v2;
}

void sub_100044A80(uint64_t a1)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) elementFetcher]);
  objc_msgSend(v2, "setEnabled:", objc_msgSend(*(id *)(a1 + 32), "_elementFetchingRequired"));
}

void sub_100044ACC(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v4 = (id)objc_claimAutoreleasedReturnValue([v2 elementFetcher]);
  id v3 = [v2 _elementFetchingRequired];

  [v4 setEnabled:v3];
}

void sub_100044D00(_Unwind_Exception *a1)
{
}

uint64_t sub_100044D1C(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained
    && [WeakRetained _isSpeechEnabled]
    && ([v3 accessibilityRespondsToUserInteraction] & 1) == 0)
  {
    id v42 = v3;
    _AXAssert( 0LL,  "/Library/Caches/com.apple.xbs/Sources/AssistiveTouch/Source/HNDAccessibilityManager.m",  293LL,  "-[HNDAccessibilityManager _addPostEventFilterToFetcher:]_block_invoke",  @"Should only have fetched scanner elements. Got non-scanner element: %@");
  }

  id v5 = objc_msgSend(v3, "scatFrame", v42);
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  uint64_t v14 = _AXSMossdeepEnabled(v5);
  if (!(_DWORD)v14)
  {
    double v17 = -[HNDHandManager screenFrame:]_0(v14, v15);
    CGFloat v19 = v18;
    CGFloat v21 = v20;
    CGFloat v23 = v22;
    if (WeakRetained)
    {
      double v24 = (void *)WeakRetained[16];
      double v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( NSNumber,  "numberWithUnsignedInt:",  [v3 windowDisplayId]));
      uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue([v24 objectForKey:v25]);

      objc_msgSend(v26, "convertFrameToInterfaceOrientation:", v7, v9, v11, v13);
      double v7 = v27;
      double v9 = v28;
      double v11 = v29;
      double v13 = v30;
      if (v26)
      {
        [v26 screenBounds];
        double v17 = v31;
        CGFloat v19 = v32;
        CGFloat v21 = v33;
        CGFloat v23 = v34;
      }
    }

    v46.origin.CGFloat x = v17;
    v46.origin.CGFloat y = v19;
    v46.size.CGFloat width = v21;
    v46.size.CGFloat height = v23;
    v51.origin.CGFloat x = v7;
    v51.origin.CGFloat y = v9;
    v51.size.CGFloat width = v11;
    v51.size.CGFloat height = v13;
    CGRect v47 = CGRectIntersection(v46, v51);
    CGFloat x = v47.origin.x;
    CGFloat y = v47.origin.y;
    CGFloat width = v47.size.width;
    CGFloat height = v47.size.height;
    double v43 = CGRectGetWidth(v47);
    v48.origin.CGFloat x = x;
    v48.origin.CGFloat y = y;
    v48.size.CGFloat width = width;
    v48.size.CGFloat height = height;
    double v39 = v43 * CGRectGetHeight(v48);
    v49.origin.CGFloat x = v7;
    v49.origin.CGFloat y = v9;
    v49.size.CGFloat width = v11;
    v49.size.CGFloat height = v13;
    double v40 = CGRectGetWidth(v49);
    v50.origin.CGFloat x = v7;
    v50.origin.CGFloat y = v9;
    v50.size.CGFloat width = v11;
    v50.size.CGFloat height = v13;
    if (v39 / (v40 * CGRectGetHeight(v50)) >= 0.8)
    {
      uint64_t v16 = [*(id *)(a1 + 32) _isElementInIgnoredTouchRegions:v3] ^ 1;
      goto LABEL_15;
    }

    goto LABEL_14;
  }

  v44.origin.CGFloat x = v7;
  v44.origin.CGFloat y = v9;
  v44.size.CGFloat width = v11;
  v44.size.CGFloat height = v13;
  if (CGRectGetWidth(v44) <= 0.0)
  {
LABEL_14:
    uint64_t v16 = 0LL;
    goto LABEL_15;
  }

  v45.origin.CGFloat x = v7;
  v45.origin.CGFloat y = v9;
  v45.size.CGFloat width = v11;
  v45.size.CGFloat height = v13;
  uint64_t v16 = CGRectGetHeight(v45) > 0.0;
LABEL_15:

  return v16;
}

void sub_100044FF0(id a1)
{
  double v1 = objc_opt_new(&OBJC_CLASS___HNDAccessibilityManager);
  uint64_t v2 = (void *)qword_1001576B0;
  qword_1001576B0 = (uint64_t)v1;
}

void sub_100045E14(void *a1)
{
  uint64_t v2 = objc_autoreleasePoolPush();
  [a1 _handleSystemServerDied];
  objc_autoreleasePoolPop(v2);
}

void sub_100045E44(uint64_t a1)
{
  double v1 = *(void **)(a1 + 32);
  uint64_t v2 = objc_autoreleasePoolPush();
  [v1 _handleSystemServerDied];
  objc_autoreleasePoolPop(v2);
}

void sub_100045E74(int a1, int a2, int a3, CFTypeRef cf)
{
  if (cf) {
    CFRetain(cf);
  }
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  _DWORD v6[2] = sub_100049780;
  v6[3] = &unk_100121F08;
  int v7 = a3;
  void v6[4] = cf;
  dispatch_async(&_dispatch_main_q, v6);
}

void sub_100046078( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
}

void sub_1000460A8(uint64_t a1)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) ignoredTouchRegions]);
  *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v2 count] != 0;
}

void sub_1000460F8(uint64_t a1)
{
  __int128 v7 = 0u;
  __int128 v8 = 0u;
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  id v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "ignoredTouchRegions", 0));
  id v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v8;
    while (2)
    {
      for (i = 0LL; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        if (CGPathContainsPoint(*(CGPathRef *)(*((void *)&v7 + 1) + 8LL * (void)i), 0LL, *(CGPoint *)(a1 + 48), 0))
        {
          *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 1;
          goto LABEL_11;
        }
      }

      id v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }

void sub_1000462A4(uint64_t a1)
{
  id v2 = (__AXObserver *)[*(id *)(a1 + 32) observer];
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[AXElement systemWideElement](&OBJC_CLASS___AXElement, "systemWideElement"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 uiElement]);
  uint64_t v5 = (const __AXUIElement *)[v4 axElement];

  double v6 = (void *)objc_claimAutoreleasedReturnValue(+[AXElement systemWideElement](&OBJC_CLASS___AXElement, "systemWideElement"));
  [v6 setPassivelyListeningForEvents:1];

  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  id v7 = *(id *)(a1 + 40);
  id v8 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v19;
    do
    {
      for (i = 0LL; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v19 != v10) {
          objc_enumerationMutation(v7);
        }
        double v12 = *(void **)(*((void *)&v18 + 1) + 8LL * (void)i);
        double v13 = (const __CFString *)[v12 intValue];
        uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) currentlyObservingNotifications]);
        LOBYTE(v12) = [v14 containsObject:v12];

        if ((v12 & 1) == 0)
        {
          AXObserverAddNotification(v2, v5, v13, *(void **)(a1 + 32));
          LOBYTE(v17) = 1;
          _AXLogWithFacility( 2LL,  0LL,  1LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0.0,  v17,  @"Registered for notification: %d, observer:%@. error: %ld");
          uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) currentlyObservingNotifications]);
          uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v13));
          [v15 addObject:v16];
        }
      }

      id v9 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }

    while (v9);
  }
}

void sub_100046550(uint64_t a1)
{
  id v2 = (__AXObserver *)[*(id *)(a1 + 32) observer];
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[AXElement systemWideElement](&OBJC_CLASS___AXElement, "systemWideElement"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 uiElement]);
  uint64_t v5 = (const __AXUIElement *)[v4 axElement];

  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  id v6 = *(id *)(a1 + 40);
  id v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v17;
    do
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        double v11 = *(void **)(*((void *)&v16 + 1) + 8LL * (void)i);
        double v12 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) currentlyObservingNotifications]);
        unsigned int v13 = [v12 containsObject:v11];

        if (v13)
        {
          AXObserverRemoveNotification(v2, v5, (CFStringRef)[v11 intValue]);
          LOBYTE(v15) = 1;
          _AXLogWithFacility( 2LL,  0LL,  1LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0.0,  v15,  @"Unregistered for notification: %d, error: %ld");
        }
      }

      id v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }

    while (v8);
  }

  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) currentlyObservingNotifications]);
  [v14 removeObjectsInArray:*(void *)(a1 + 40)];
}

void sub_100046840( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id location)
{
}

id sub_1000468EC(uint64_t a1)
{
  return [*(id *)(a1 + 32) _initializeAccessibility];
}

BOOL sub_100046A40(id a1, AXGroupable *a2)
{
  return -[AXGroupable isGroup](a2, "isGroup") ^ 1;
}

LABEL_21:
      }

  return v14;
}
}

  CGRect v51 = v21;
  __int128 v55 = v3;
  __int128 v52 = v5;
  if (v13)
  {
    double v22 = AXSSwitchControlMenuItemSwitchDisplay;
    CGFloat v23 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuSheet menu](self, "menu"));
    double v24 = (void *)objc_claimAutoreleasedReturnValue( +[SCATMenuItemFactory menuItemsForItem:menu:delegate:]( &OBJC_CLASS___SCATMenuItemFactory,  "menuItemsForItem:menu:delegate:",  v22,  v23,  self));
    double v25 = (void *)objc_claimAutoreleasedReturnValue([v24 firstObject]);
    [v19 addObject:v25];

    id v6 = v53;
  }

  __int128 v54 = v19;
  __int128 v57 = 0u;
  __int128 v58 = 0u;
  __int128 v59 = 0u;
  __int128 v60 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue([v6 switchControlTopLevelMenuItems]);
  uint64_t v26 = [obj countByEnumeratingWithState:&v57 objects:v61 count:16];
  if (v26)
  {
    double v27 = v26;
    double v28 = *(void *)v58;
    double v29 = AXSSwitchControlMenuItemTypeKey;
    double v30 = AXSSwitchControlMenuItemEnabledKey;
    do
    {
      for (i = 0LL; i != v27; i = (char *)i + 1)
      {
        if (*(void *)v58 != v28) {
          objc_enumerationMutation(obj);
        }
        double v32 = *(void **)(*((void *)&v57 + 1) + 8LL * (void)i);
        double v33 = (void *)objc_claimAutoreleasedReturnValue([v32 objectForKeyedSubscript:v29]);
        double v34 = (void *)objc_claimAutoreleasedReturnValue([v32 objectForKeyedSubscript:v30]);
        id v35 = [v34 BOOLValue];

        if (v35)
        {
          uint64_t v36 = -[SCATModernMenuActionsSheet _itemBelongsOnShortFirstPage:shouldAddControlCenterActions:shouldIncludeSpotlight:]( self,  "_itemBelongsOnShortFirstPage:shouldAddControlCenterActions:shouldIncludeSpotlight:",  v33,  0LL,  0LL);
          uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuSheet menu](self, "menu"));
          uint64_t v38 = (void *)objc_claimAutoreleasedReturnValue( +[SCATMenuItemFactory menuItemsForItem:menu:delegate:]( &OBJC_CLASS___SCATMenuItemFactory,  "menuItemsForItem:menu:delegate:",  v33,  v37,  self));
          if (v36) {
            double v39 = v54;
          }
          else {
            double v39 = v55;
          }
          [v39 axSafelyAddObjectsFromArray:v38];
        }
      }

      double v27 = [obj countByEnumeratingWithState:&v57 objects:v61 count:16];
    }

    while (v27);
  }

  double v40 = AXSSwitchControlMenuItemEscape;
  id v41 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuSheet menu](self, "menu"));
  id v42 = (void *)objc_claimAutoreleasedReturnValue( +[SCATMenuItemFactory menuItemsForItem:menu:delegate:]( &OBJC_CLASS___SCATMenuItemFactory,  "menuItemsForItem:menu:delegate:",  v40,  v41,  self));
  double v43 = v55;
  [v55 axSafelyAddObjectsFromArray:v42];

  if (v51)
  {
    CGRect v44 = v54;
    CGRect v45 = v52;
    if ([v54 count])
    {
      -[SCATModernMenuActionsSheet setStoredNumberOfItemsInFirstPage:]( self,  "setStoredNumberOfItemsInFirstPage:",  [v54 count]);
      CGRect v46 = v53;
      if (v55 == v54) {
        _AXAssert( 0LL,  "/Library/Caches/com.apple.xbs/Sources/AssistiveTouch/Source/Scanner/SCATModernMenuActionsSheet.m",  276LL,  "-[SCATModernMenuActionsSheet makeMenuItemsIfNeeded]",  @"Somehow we were adding our most important items to the main array of menu items, when we should have kept them separate.");
      }
      [v54 addObjectsFromArray:v55];
      CGRect v47 = v54;

      double v43 = v47;
    }

    else
    {
      CGRect v46 = v53;
    }
  }

  else
  {
    CGRect v45 = v52;
    CGRect v46 = v53;
    CGRect v44 = v54;
  }

  CGRect v48 = v43;

  return v48;
}

void sub_100047EA8(uint64_t a1, void *a2)
{
  id v3 = a2;
}

void sub_1000481C8(uint64_t a1, void *a2)
{
  id v5 = a2;
  id v3 = [v5 scrollAncestorForScrollAction:*(unsigned int *)(a1 + 48)];
  if (v3)
  {
    id v4 = v3;
    if (([*(id *)(a1 + 32) containsObject:v3] & 1) == 0)
    {
      [*(id *)(a1 + 32) addObject:v4];
      [*(id *)(a1 + 40) addObject:v5];
    }
  }
}

BOOL sub_1000485D4(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 scatIsAXElement])
  {
    [v3 frame];
    CGFloat v5 = v4;
    CGFloat v7 = v6;
    CGFloat v9 = v8;
    CGFloat v11 = v10;
    [*(id *)(a1 + 32) frame];
    v19.origin.CGFloat x = v12;
    v19.origin.CGFloat y = v13;
    v19.size.CGFloat width = v14;
    v19.size.CGFloat height = v15;
    v18.origin.CGFloat x = v5;
    v18.origin.CGFloat y = v7;
    v18.size.CGFloat width = v9;
    v18.size.CGFloat height = v11;
    BOOL v16 = CGRectEqualToRect(v18, v19);
  }

  else
  {
    BOOL v16 = 0LL;
  }

  return v16;
}

BOOL sub_100048704(id a1, AXElement *a2)
{
  return -[AXElement isKeyboardKey](a2, "isKeyboardKey");
}

id sub_100048FCC(uint64_t a1)
{
  return _[*(id *)(a1 + 32) setIgnoredTouchRegions:*(void *)(a1 + 40)];
}

LABEL_24:
  a4 = v57;
LABEL_25:
  double v43 = (void *)objc_claimAutoreleasedReturnValue(-[HNDAccessibilityManager rootScannerGroup](self, "rootScannerGroup", v55));
  if ([v8 isGroupingEnabled])
  {
    CGRect v44 = (void *)objc_claimAutoreleasedReturnValue([v8 rootGroup]);
    -[HNDAccessibilityManager setRootScannerGroup:](self, "setRootScannerGroup:", v44);
  }

  else
  {
    -[HNDAccessibilityManager setRootScannerGroup:](self, "setRootScannerGroup:", 0LL);
  }

  CGRect v45 = (void *)objc_claimAutoreleasedReturnValue([v8 elementCommunityGroup]);
  -[HNDAccessibilityManager setElementCommunityGroup:](self, "setElementCommunityGroup:", v45);

  -[HNDAccessibilityManager _notifyObserversDidFetchElementsForEvent:foundNewElements:]( self,  "_notifyObserversDidFetchElementsForEvent:foundNewElements:",  -[HNDAccessibilityManager _hndAccessibilityEventForFetchEvent:](self, "_hndAccessibilityEventForFetchEvent:", a4),  v5);
  CGRect v46 = (id)objc_opt_self(v43);
}
}

  if (a5) {
    *a5 = v29;
  }
  if (a4)
  {
    CGRect v47 = v49;
    a4->origin = origin;
    a4->size = v47;
  }
}

void sub_100049780(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(+[HNDAccessibilityManager sharedManager](&OBJC_CLASS___HNDAccessibilityManager, "sharedManager"));
  id v3 = v2;
  int v4 = *(_DWORD *)(a1 + 40);
  if (v4 <= 1028)
  {
    switch(v4)
    {
      case 1000:
        [v2 _handleScreenChanged:*(void *)(a1 + 32)];
        break;
      case 1001:
        [v2 _handleLayoutChanged:*(void *)(a1 + 32)];
        break;
      case 1004:
        [v2 _handleScreenLocked];
        break;
      case 1005:
        [v2 _handleValueChanged];
        break;
      case 1006:
        [v2 _handleAlertAppeared];
        break;
      case 1008:
        [v2 _handleAnnouncementNotification:*(void *)(a1 + 32)];
        break;
      case 1009:
        [v2 _handleElementScrolledByPage];
        break;
      case 1011:
        [v2 _handleOrientationChanged];
        break;
      case 1018:
        [v2 _handleFirstResponderChanged];
        break;
      case 1021:
        [v2 _handlePidStatusChanged];
        break;
      default:
        goto LABEL_30;
    }

    goto LABEL_30;
  }

  if (v4 <= 1043)
  {
    switch(v4)
    {
      case 1029:
        [v2 _handleKeyboardPopupAppeared];
        goto LABEL_30;
      case 1033:
        id v5 = *(id *)(a1 + 32);
        CGFloat v9 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:kAXNotificationDataKey]);
        unsigned int v10 = [v9 isEqualToString:UIAccessibilityNotificationSwitchControlIdentifier];

        if (!v10)
        {
LABEL_26:

          goto LABEL_30;
        }

        double v8 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:kAXPidKey]);
        objc_msgSend(v3, "_handlePauseForPid:", objc_msgSend(v8, "intValue"));
        break;
      case 1034:
        id v5 = *(id *)(a1 + 32);
        double v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:kAXNotificationDataKey]);
        unsigned int v7 = [v6 isEqualToString:UIAccessibilityNotificationSwitchControlIdentifier];

        if (!v7) {
          goto LABEL_26;
        }
        double v8 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:kAXPidKey]);
        objc_msgSend(v3, "_handleResumeForPid:", objc_msgSend(v8, "intValue"));
        break;
      default:
        goto LABEL_30;
    }

    goto LABEL_26;
  }

  switch(v4)
  {
    case 1044:
      [v2 _handleElementVisualsUpdated];
      break;
    case 1045:
      [v2 updateCachedOrbPreviewWindow:*(void *)(a1 + 32)];
      break;
    case 1078:
      [v2 _handleKeyboardFocusChanged];
      break;
  }

LABEL_30:
  CGFloat v11 = *(const void **)(a1 + 32);
  if (v11) {
    CFRelease(v11);
  }
}

#error "100049A50: call analysis failed (funcsize=28)"
SCATAlternateKeysManager *__cdecl -[SCATAlternateKeysManager init](SCATAlternateKeysManager *self, SEL a2)
{
  SCATAlternateKeysManager *v2;
  void *v3;
  objc_super v5;
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___SCATAlternateKeysManager;
  id v2 = -[SCATAlternateKeysManager init](&v5, "init");
  if (v2)
  {
    id v3 = (void *)objc_claimAutoreleasedReturnValue(+[HNDAccessibilityManager sharedManager](&OBJC_CLASS___HNDAccessibilityManager, "sharedManager"));
    [v3 addObserver:v2];
  }

  return v2;
}

void sub_10004A3A8(uint64_t a1, void *a2, uint64_t a3)
{
  id v19 = a2;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(@"recipe_", "stringByAppendingFormat:", @"%lu", a3));
  uint64_t v6 = *(void *)(a1 + 32);
  unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue([v19 name]);
  double v8 = (void *)objc_claimAutoreleasedReturnValue( +[SCATModernMenuItem itemWithIdentifier:delegate:title:imageName:activateBehavior:]( &OBJC_CLASS___SCATModernMenuItem,  "itemWithIdentifier:delegate:title:imageName:activateBehavior:",  v5,  v6,  v7,  0LL,  0LL));

  CGFloat v9 = (void *)objc_claimAutoreleasedReturnValue([v19 menuIconIdentifier]);
  LODWORD(v5) = [v9 isEqualToString:AXSwitchRecipeMenuIconIdentifierCenterTap];

  if ((_DWORD)v5)
  {
    unsigned int v10 = @"SCATIcon_recipe_tapMiddleOfScreen";
  }

  else
  {
    CGFloat v11 = (void *)objc_claimAutoreleasedReturnValue([v19 menuIconIdentifier]);
    unsigned int v12 = [v11 isEqualToString:AXSwitchRecipeMenuIconIdentifierTurnPages];

    if (v12)
    {
      unsigned int v10 = @"SCATIcon_action_scrollRight";
    }

    else
    {
      CGFloat v13 = (void *)objc_claimAutoreleasedReturnValue([v19 menuIconIdentifier]);
      unsigned int v14 = [v13 isEqualToString:AXSwitchRecipeMenuIconIdentifierTapPoint];

      if (v14)
      {
        unsigned int v10 = @"SCATIcon_recipe_tapPoint";
      }

      else
      {
        CGFloat v15 = (void *)objc_claimAutoreleasedReturnValue([v19 menuIconIdentifier]);
        unsigned int v16 = [v15 isEqualToString:AXSwitchRecipeMenuIconIdentifierHoldPoint];

        if (!v16)
        {
          __int128 v17 = (void *)objc_claimAutoreleasedReturnValue([v19 name]);
          CGRect v18 = (void *)objc_claimAutoreleasedReturnValue( +[UIImage scat_singleCharacterImageForTitle:charactersInUse:]( &OBJC_CLASS___UIImage,  "scat_singleCharacterImageForTitle:charactersInUse:",  v17,  *(void *)(a1 + 40)));
          [v8 setImage:v18];

          goto LABEL_10;
        }

        unsigned int v10 = @"SCATIcon_recipe_holdPoint";
      }
    }
  }

  [v8 setImageName:v10];
LABEL_10:
  [*(id *)(a1 + 48) addObject:v8];
}

void sub_10004A884(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) menu]);
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 currentSheet]);
  [v3 reload];

  int v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) menu]);
  [v4 reloadFromCurrentSheet];

  id v5 = (id)objc_claimAutoreleasedReturnValue(+[SCATScannerManager sharedManager](&OBJC_CLASS___SCATScannerManager, "sharedManager"));
  [v5 beginScanningWithFocusContext:0];
}

id sub_10004AD64(uint64_t a1)
{
  if ([*(id *)(a1 + 32) isInputCoalesceEnabled])
  {
    double v2 = CACurrentMediaTime();
    [*(id *)(a1 + 32) timeIntervalBetweenDidSendActions];
    double v4 = v3;
    id result = [*(id *)(a1 + 32) timeIntervalSinceDidSendAction];
    if (v2 - v6 <= v4) {
      return result;
    }
    [*(id *)(a1 + 32) setTimeIntervalSinceDidSendAction:v2];
  }

  return [*(id *)(a1 + 32) _sendActionWithIdentifier:*(void *)(a1 + 40)];
}

LABEL_15:
}
}

  v100 = a4;
  CGRect v106 = v22;
  if ((id)-[SCATModernMenuViewController tipObject](self, "tipObject") == (id)2
    && (CGRect v44 = (void *)objc_claimAutoreleasedReturnValue([v110 alternateTipElement]),
        v44,
        v44))
  {
    CGRect v45 = a5;
    CGRect v46 = objc_claimAutoreleasedReturnValue([v110 alternateTipElement]);

    CGFloat v23 = v46;
  }

  else
  {
    CGRect v45 = a5;
  }

  CGRect v47 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuViewController menu](self, "menu", v29, v27));
  CGRect v48 = objc_claimAutoreleasedReturnValue([v47 screenPoint]);

  CGRect v49 = (void *)objc_claimAutoreleasedReturnValue(+[SCATScannerManager sharedManager](&OBJC_CLASS___SCATScannerManager, "sharedManager"));
  CGRect v50 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuViewController menu](self, "menu"));
  CGRect v51 = objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "scatUIContextForDisplayID:", objc_msgSend(v50, "currentDisplayID")));

  CGRect v105 = (void *)v51;
  __int128 v52 = (void *)v51;
  __int128 v53 = (void *)v48;
  [v52 bounds];
  __int128 v58 = v54;
  __int128 v59 = v55;
  __int128 v60 = v56;
  __int128 v61 = v57;
  if (v104) {
    __int128 v62 = v16;
  }
  else {
    __int128 v62 = v20;
  }
  if (!v104) {
    CGRect v18 = v106;
  }
  double MidX = CGRectGetMidX(*(CGRect *)&v54);
  v111.origin.CGFloat x = v58;
  v111.origin.CGFloat y = v59;
  v111.size.CGFloat width = v60;
  v111.size.CGFloat height = v61;
  __int128 v64 = v62 * 0.5;
  __int128 v65 = MidX - v62 * 0.5;
  rect2 = CGRectGetMidY(v111) - v18 * 0.5;
  __int128 v66 = (v23 | v48) != 0;
  if (v23
    && (__int128 v67 = [(id)v23 scatFrame],
        v112.origin.CGFloat x = sub_10002ADFC((uint64_t)v67, v68, v69, v70, v71, v72),
        !CGRectIsEmpty(v112)))
  {
    id v77 = [(id)v23 scatFrame];
    +[HNDScreen convertRect:toView:]( &OBJC_CLASS___HNDScreen,  "convertRect:toView:",  v105,  sub_10002ADFC((uint64_t)v77, v78, v79, v80, v81, v82));
    double v76 = v83;
    double v75 = v84;
    double v73 = v83 + v85;
    double v74 = v84 + v86;
  }

  else if (v48)
  {
    [(id)v48 pointValue];
    +[HNDScreen convertPoint:toView:](&OBJC_CLASS___HNDScreen, "convertPoint:toView:", v105);
    double v75 = v74;
    double v76 = v73;
  }

  else
  {
    double v73 = v65 + v60;
    double v75 = rect2;
    double v74 = v61 + rect2;
    double v76 = v65;
  }

  a6 = v103;
  a5 = v45;
  a4 = v100;
  if (v66)
  {
    uint64_t v87 = v18 + v74;
    v88 = (v74 + v75) * 0.5;
    if (v18 + v88 > v61) {
      v88 = 0.0;
    }
    if (v75 > v18) {
      v88 = v75 - v18;
    }
    double v43 = v87 <= v61 || v75 <= v18;
    if (v87 > v61) {
      double v74 = v88;
    }
    rect2 = v74;
    id v42 = (v73 + v76) * 0.5;
    if (v42 - v64 < 0.0 || v64 + v42 > v60)
    {
      if (v62 + v76 <= v60)
      {
        __int16 v101 = v76;
      }

      else if (v73 - v62 <= 0.0)
      {
        __int16 v101 = v65;
      }

      else
      {
        __int16 v101 = v60 - (v60 - v73) - v62;
      }
    }

    else
    {
      __int16 v101 = v42 - v64;
    }
  }

  else
  {
    double v43 = 1;
    __int16 v101 = v65;
    id v42 = v65;
  }

  v113.origin.CGFloat x = v99;
  v113.origin.CGFloat y = v98;
  v113.size.CGFloat width = v102;
  v113.size.CGFloat height = rect1;
  if (!CGRectIsNull(v113))
  {
    v114.origin.CGFloat x = v99;
    v114.origin.CGFloat y = v98;
    v114.size.CGFloat width = v102;
    v114.size.CGFloat height = rect1;
    v116.size.CGFloat width = v62;
    double v40 = v101;
    v116.origin.CGFloat x = v101;
    v116.origin.CGFloat y = rect2;
    v116.size.CGFloat height = v18;
    if (!CGRectIntersectsRect(v114, v116)) {
      goto LABEL_62;
    }
    if (v104) {
      id v90 = v43;
    }
    else {
      id v90 = 0;
    }
    if (v90)
    {
      v91 = v98 + rect1;
      if (-[SCATModernMenuViewController _menuFrameIsValid:](self, "_menuFrameIsValid:", v101, v98 + rect1, v62, v18))
      {
LABEL_61:
        double v32 = 1;
LABEL_66:
        a6 = v103;
LABEL_76:
        id v41 = v91;
        goto LABEL_77;
      }

      v91 = v98 - v18;
      id v92 = -[SCATModernMenuViewController _menuFrameIsValid:](self, "_menuFrameIsValid:", v101, v98 - v18, v62, v18);
      if ((v43 || v104 == 0) | v92 & 1)
      {
        if ((v92 & 1) != 0) {
          goto LABEL_61;
        }
LABEL_67:
        id v93 = 0LL;
        do
        {
          if (v93)
          {
            -[SCATModernMenuViewController _positionForMenuPopoverPosition:size:]( self,  "_positionForMenuPopoverPosition:size:",  v93,  v20,  v106);
            double v40 = v94;
            v91 = v95;
            v115.origin.CGFloat x = v99;
            v115.origin.CGFloat y = v98;
            v115.size.CGFloat width = v102;
            v115.size.CGFloat height = rect1;
            v117.origin.CGFloat x = v40;
            v117.origin.CGFloat y = v91;
            v117.size.CGFloat width = v20;
            v117.size.CGFloat height = v106;
            id v96 = CGRectIntersectsRect(v115, v117);
            v97 = !v96;
            v32 &= v96;
          }

          else
          {
            v97 = 0;
          }

          if (v93 > 7) {
            break;
          }
          ++v93;
        }

        while (!v97);
        if (!v97) {
          double v40 = v101;
        }
        a6 = v103;
        id v41 = rect2;
        if (!v97) {
          goto LABEL_77;
        }
        goto LABEL_76;
      }
    }

    else
    {
      v91 = rect2;
      if (v43 || v104 == 0) {
        goto LABEL_67;
      }
    }

    v91 = v98 - v18;
    if (-[SCATModernMenuViewController _menuFrameIsValid:](self, "_menuFrameIsValid:", v101, v98 - v18, v62, v18)) {
      goto LABEL_66;
    }
    v91 = v98 + rect1;
    if (-[SCATModernMenuViewController _menuFrameIsValid:](self, "_menuFrameIsValid:", v101, v98 + rect1, v62, v18)) {
      goto LABEL_66;
    }
    goto LABEL_67;
  }

  double v40 = v101;
LABEL_62:
  id v41 = rect2;
LABEL_77:

LABEL_78:
  if (a3)
  {
    a3->CGFloat x = floor(v40);
    a3->CGFloat y = floor(v41);
  }

  if (a4) {
    *a4 = floor(v42);
  }
  if (a5) {
    *a5 = v43;
  }
  if (a6) {
    *a6 = v32 & 1;
  }
}

  -[SCATGestureProvider setPinchRadius:](self, "setPinchRadius:", v8);
  -[SCATGestureProvider setPinchAngle:](self, "setPinchAngle:", v10);
  -[SCATGestureProvider _addPointsToContinuousGestureData:](self, "_addPointsToContinuousGestureData:", v12);
  if ([v12 isEqualToArray:v29])
  {
    if (!self->_isReversingContinuousGesture) {
      _AXAssert( 0LL,  "/Library/Caches/com.apple.xbs/Sources/AssistiveTouch/Source/Scanner/SCATGestureProvider.m",  558LL,  "-[SCATGestureProvider _updatePinchPositionsWithAttemptedRadiusDelta:angleDelta:]",  @"Should only have gotten back to our fingers' original points if we were reversing the gesture.");
    }
    self->_isReversingContinuousGesture = 0;
  }

  return v5;
}

        unsigned int v16 = 0LL;
LABEL_16:

        goto LABEL_17;
      }
    }

    else if (a5)
    {
      goto LABEL_8;
    }

    __int128 v17 = (void *)objc_claimAutoreleasedReturnValue(-[SCATElementManager auxiliaryElementManagers](self, "auxiliaryElementManagers"));
    CGRect v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", __b[0]));
    unsigned int v14 = (void *)objc_claimAutoreleasedReturnValue([v17 objectForKeyedSubscript:v18]);

    if (v14) {
      goto LABEL_9;
    }
    goto LABEL_15;
  }

  unsigned int v16 = 0LL;
LABEL_17:

  return v16;
}

void sub_10004B140(_Unwind_Exception *a1)
{
}

id sub_10004B15C(uint64_t a1)
{
  return _[*(id *)(a1 + 32) inputController:*(void *)(a1 + 40) didReceiveRecipeActionForMappingAtIndex:*(void *)(a1 + 48) isLongPressAction:*(unsigned __int8 *)(a1 + 56)];
}

id sub_10004B170(uint64_t a1)
{
  return [*(id *)(a1 + 32) inputController:*(void *)(a1 + 40) didReceiveAction:*(void *)(a1 + 48)];
}

void sub_10004B180(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _sendActionWithIdentifier:*(void *)(a1 + 32)];
}

LABEL_56:
  uint64_t v36 = 0;
LABEL_58:

  _Block_object_dispose(&v59, 8);
  _Block_object_dispose(&v63, 8);
  _Block_object_dispose(&v67, 8);

  return v36;
}

void sub_10004CDE4( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, char a28)
{
}

void sub_10004CE38(uint64_t a1, void *a2)
{
  id v3 = a2;
  double v4 = (void *)objc_claimAutoreleasedReturnValue([v3 source]);
  if ([v3 hasSelectAction])
  {
    uint64_t v5 = 1LL;
  }

  else
  {
    double v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) objectForKeyedSubscript:v4]);
    unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue([v6 firstObject]);
    uint64_t v5 = (uint64_t)[v7 BOOLValue];
  }

  if ([v3 hasStepAction])
  {
    uint64_t v8 = 1LL;
  }

  else
  {
    CGFloat v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) objectForKeyedSubscript:v4]);
    unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue([v9 lastObject]);
    uint64_t v8 = (uint64_t)[v10 BOOLValue];
  }

  CGFloat v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v5));
  v14[0] = v11;
  unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v8));
  v14[1] = v12;
  CGFloat v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v14, 2LL));
  [*(id *)(a1 + 32) setObject:v13 forKeyedSubscript:v4];

  if ((_DWORD)v5) {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 1;
  }
  if ((_DWORD)v8) {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = 1;
  }
}

id sub_10004D3DC(uint64_t a1)
{
  return _[*(id *)(a1 + 32) _removeInputTimers];
}

void sub_10004D7D8(_Unwind_Exception *a1)
{
}

id sub_10004D814(uint64_t a1)
{
  return _[*(id *)(a1 + 32) _setupInputTimers];
}

void sub_10004D878(uint64_t a1)
{
  v1[0] = _NSConcreteStackBlock;
  v1[1] = 3221225472LL;
  v1[2] = sub_10004D8FC;
  v1[3] = &unk_100121EE8;
  objc_copyWeak(&v2, (id *)(a1 + 32));
  AXPerformBlockAsynchronouslyOnMainThread(v1);
  objc_destroyWeak(&v2);
}

void sub_10004D8E8(_Unwind_Exception *a1)
{
}

void sub_10004D8FC(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _updateTimeIntervalBeforeSendAction];
}

void sub_10004D928(uint64_t a1)
{
  v1[0] = _NSConcreteStackBlock;
  v1[1] = 3221225472LL;
  v1[2] = sub_10004D9AC;
  v1[3] = &unk_100121EE8;
  objc_copyWeak(&v2, (id *)(a1 + 32));
  AXPerformBlockAsynchronouslyOnMainThread(v1);
  objc_destroyWeak(&v2);
}

void sub_10004D998(_Unwind_Exception *a1)
{
}

void sub_10004D9AC(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _updateIsInputHoldEnabled];
}

void sub_10004D9D8(uint64_t a1)
{
  v1[0] = _NSConcreteStackBlock;
  v1[1] = 3221225472LL;
  v1[2] = sub_10004DA5C;
  v1[3] = &unk_100121EE8;
  objc_copyWeak(&v2, (id *)(a1 + 32));
  AXPerformBlockAsynchronouslyOnMainThread(v1);
  objc_destroyWeak(&v2);
}

void sub_10004DA48(_Unwind_Exception *a1)
{
}

void sub_10004DA5C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _updateTimeIntervalBeforeSendRepeatAction];
}

void sub_10004DA88(uint64_t a1)
{
  v1[0] = _NSConcreteStackBlock;
  v1[1] = 3221225472LL;
  v1[2] = sub_10004DB0C;
  v1[3] = &unk_100121EE8;
  objc_copyWeak(&v2, (id *)(a1 + 32));
  AXPerformBlockAsynchronouslyOnMainThread(v1);
  objc_destroyWeak(&v2);
}

void sub_10004DAF8(_Unwind_Exception *a1)
{
}

void sub_10004DB0C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _updateIsInputRepeatEnabled];
}

void sub_10004DB38(uint64_t a1)
{
  v1[0] = _NSConcreteStackBlock;
  v1[1] = 3221225472LL;
  v1[2] = sub_10004DBBC;
  v1[3] = &unk_100121EE8;
  objc_copyWeak(&v2, (id *)(a1 + 32));
  AXPerformBlockAsynchronouslyOnMainThread(v1);
  objc_destroyWeak(&v2);
}

void sub_10004DBA8(_Unwind_Exception *a1)
{
}

void sub_10004DBBC(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _updateTimeIntervalBetweenDidSendActions];
}

void sub_10004DBE8(uint64_t a1)
{
  v1[0] = _NSConcreteStackBlock;
  v1[1] = 3221225472LL;
  v1[2] = sub_10004DC6C;
  v1[3] = &unk_100121EE8;
  objc_copyWeak(&v2, (id *)(a1 + 32));
  AXPerformBlockAsynchronouslyOnMainThread(v1);
  objc_destroyWeak(&v2);
}

void sub_10004DC58(_Unwind_Exception *a1)
{
}

void sub_10004DC6C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _updateIsInputCoalesceEnabled];
}

void sub_10004DC98(uint64_t a1)
{
  v1[0] = _NSConcreteStackBlock;
  v1[1] = 3221225472LL;
  v1[2] = sub_10004DD1C;
  v1[3] = &unk_100121EE8;
  objc_copyWeak(&v2, (id *)(a1 + 32));
  AXPerformBlockAsynchronouslyOnMainThread(v1);
  objc_destroyWeak(&v2);
}

void sub_10004DD08(_Unwind_Exception *a1)
{
}

void sub_10004DD1C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _updateInputSources];
}

id sub_10004DD48(uint64_t a1, void *a2)
{
  if (a2) {
    return [a2 performSelector:"_updateMotionTrackingForOneness" withObject:0 afterDelay:0.0];
  }
  return result;
}

id sub_10004DFB0(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = (void *)objc_claimAutoreleasedReturnValue([a2 uuid]);
  id v4 = [v2 containsObject:v3];

  return v4;
}

BOOL sub_10004DFF4(id a1, AXSwitch *a2, BOOL *a3)
{
  return -[AXSwitch isEnabled](a2, "isEnabled", a3);
}

void sub_10004E1D4( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

void sub_10004E1EC(uint64_t a1, void *a2, _BYTE *a3)
{
  id v8 = a2;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v8 source]);
  unsigned int v6 = [v5 isEqual:*(void *)(a1 + 32)];

  if (v6)
  {
    if (!*(void *)(a1 + 40)
      || (unsigned int v7 = [v8 isEnabled],
          v7 == [*(id *)(a1 + 40) BOOLValue]))
    {
      *(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = 1;
      *a3 = 1;
    }
  }
}

void sub_10004FA84(uint64_t a1)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) menu]);
  [v2 didTransitionToSheet:*(void *)(a1 + 40)];
}

void sub_10004FCE4(id a1, SCATMenuSheetViewController *a2, unint64_t a3, BOOL *a4)
{
  id v4 = a2;
  -[SCATMenuSheetViewController willMoveToParentViewController:](v4, "willMoveToParentViewController:", 0LL);
  -[SCATMenuSheetViewController removeFromParentViewController](v4, "removeFromParentViewController");
}

BOOL sub_10004FD18(uint64_t a1, void *a2)
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue([a2 sheet]);
  BOOL v4 = v3 == *(void **)(a1 + 32);

  return v4;
}

BOOL sub_10004FE78(uint64_t a1, void *a2)
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue([a2 sheet]);
  BOOL v4 = v3 == *(void **)(a1 + 32);

  return v4;
}

void sub_1000501A8(uint64_t a1)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) menu]);
  [v2 didTransitionToSheet:*(void *)(a1 + 40)];
}

id sub_10005066C(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48));
}

int64_t sub_1000516C0(id a1, NSIndexPath *a2, NSIndexPath *a3)
{
  BOOL v4 = a3;
  NSInteger v5 = -[NSIndexPath item](a2, "item");
  id v6 = -[NSIndexPath item](v4, "item");

  int64_t v7 = -1LL;
  if ((id)v5 == v6) {
    return 0LL;
  }
  else {
    return v7;
  }
}

id sub_100051718(id a1, SCATMenuItemCell *a2, unint64_t a3)
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[SCATMenuItemCell menuItem](a2, "menuItem", a3));
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue([v3 scatElement]);

  return v4;
}

id sub_100051C44(id a1, SCATMenuItemCell *a2, unint64_t a3)
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[SCATMenuItemCell menuItem](a2, "menuItem", a3));
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue([v3 scatElement]);

  return v4;
}

id sub_100051C80(id a1, SCATMenuItemCell *a2, unint64_t a3)
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[SCATMenuItemCell menuItem](a2, "menuItem", a3));
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue([v3 scatElement]);

  return v4;
}

BOOL sub_100052014(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class(&OBJC_CLASS___SCATMenuItemCell, v4);
  if ((objc_opt_isKindOfClass(v3, v5) & 1) != 0)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v3 menuItem]);
    BOOL v7 = v6 == *(void **)(a1 + 32);
  }

  else
  {
    BOOL v7 = 0LL;
  }

  return v7;
}

id sub_1000524EC(uint64_t a1)
{
  return _[*(id *)(a1 + 32) screenInputSource:*(void *)(a1 + 40) didReceiveActionWithIdentifier:*(void *)(a1 + 48) start:*(unsigned __int8 *)(a1 + 56) ignoreInputHold:*(unsigned __int8 *)(a1 + 57)];
}

LABEL_10:
  return v5 == 3001;
}

      v14.receiver = self;
      v14.super_class = (Class)&OBJC_CLASS___HNDApplication;
      CGFloat v11 = -[HNDApplication _iosAccessibilityAttributeValue:](&v14, "_iosAccessibilityAttributeValue:", a3);
      id v8 = (void *)objc_claimAutoreleasedReturnValue(v11);
      return v8;
    }

    CGFloat v9 = (void *)objc_claimAutoreleasedReturnValue( -[HNDApplication _accessibilityScannerCurrentLoopElements]( self,  "_accessibilityScannerCurrentLoopElements"));
    unsigned int v12 = sub_100056404(v9);
    unsigned int v10 = objc_claimAutoreleasedReturnValue(v12);
  }

  CGFloat v13 = (void *)v10;

  return v13;
}

  return v6;
}
}

void sub_10005299C(void **a1, void *a2)
{
  id v12 = a2;
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v12 source]);
  unsigned int v4 = [v3 isEqualToString:SCATSwitchSourceScreen];

  if (v4)
  {
    if (a1[4])
    {
      uint64_t v5 = objc_opt_new(&OBJC_CLASS___SCATActionItem);
      id v6 = objc_opt_new(&OBJC_CLASS___SCATActionItem);
      SCATGetActionIdentifiersForRecipeAndSwitch(a1[4], v12, v5, v6);
      [a1[5] setObject:v5 forKeyedSubscript:@"SwitchActionTypeNormal"];
      if (-[SCATActionItem action](v6, "action")) {
        [a1[5] setObject:v6 forKeyedSubscript:@"SwitchActionTypeLongPress"];
      }
    }

    else
    {
      if (([v12 hasLongPressAction] & 1) != 0
        || (BOOL v7 = (void *)objc_claimAutoreleasedReturnValue([v12 longPressShortcutIdentifier]),
            v7,
            v7))
      {
        id v8 = objc_opt_new(&OBJC_CLASS___SCATActionItem);
        -[SCATActionItem setAction:](v8, "setAction:", [v12 longPressAction]);
        CGFloat v9 = (void *)objc_claimAutoreleasedReturnValue([v12 longPressShortcutIdentifier]);
        -[SCATActionItem setShortcutIdentifier:](v8, "setShortcutIdentifier:", v9);

        [a1[5] setObject:v8 forKeyedSubscript:@"SwitchActionTypeLongPress"];
      }

      uint64_t v5 = objc_opt_new(&OBJC_CLASS___SCATActionItem);
      -[SCATActionItem setAction:](v5, "setAction:", [v12 action]);
      unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue([v12 shortcutIdentifier]);
      -[SCATActionItem setShortcutIdentifier:](v5, "setShortcutIdentifier:", v10);

      [a1[5] setObject:v5 forKeyedSubscript:@"SwitchActionTypeNormal"];
    }

    CGFloat v11 = (void *)objc_claimAutoreleasedReturnValue([v12 name]);
    [a1[6] setSwitchDisplayName:v11];
  }
}

void sub_1000543D8( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *location)
{
}

void sub_100054428(uint64_t a1)
{
  double v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained delegate]);
  id v3 = objc_loadWeakRetained(v1);
  [v2 scrollContainer:v3 scrollInDirection:0];
}

void sub_10005448C(uint64_t a1)
{
  double v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained delegate]);
  id v3 = objc_loadWeakRetained(v1);
  [v2 scrollContainer:v3 scrollInDirection:1];
}

void sub_1000544F0(uint64_t a1)
{
  double v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained delegate]);
  id v3 = objc_loadWeakRetained(v1);
  [v2 scrollContainer:v3 scrollInDirection:2];
}

void sub_100054554(uint64_t a1)
{
  double v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained delegate]);
  id v3 = objc_loadWeakRetained(v1);
  [v2 scrollContainer:v3 scrollInDirection:3];
}

BOOL sub_100055D2C(id a1, AXValidationManager *a2)
{
  id v2 = a2;
  -[AXValidationManager validateClass:hasInstanceMethod:withFullSignature:]( v2,  "validateClass:hasInstanceMethod:withFullSignature:",  @"UIApplication",  @"__completeAndRunAsPlugin",  "v",  0LL);
  -[AXValidationManager validateClass:hasInstanceMethod:withFullSignature:]( v2,  "validateClass:hasInstanceMethod:withFullSignature:",  @"UIApplication",  @"_createStatusBarWithRequestedStyle:orientation:hidden:",  "v",  "q",  "q",  "B",  0LL);
  -[AXValidationManager validateClass:hasInstanceMethod:withFullSignature:]( v2,  "validateClass:hasInstanceMethod:withFullSignature:",  @"UIApplication",  @"_supportedOnLockScreen",  "B",  0LL);
  -[AXValidationManager validateClass:hasInstanceMethod:withFullSignature:]( v2,  "validateClass:hasInstanceMethod:withFullSignature:",  @"UIScreen",  @"_focusSystem",  "@",  0LL);

  return 1;
}

BOOL sub_100055DFC(id a1, AXValidationManager *a2)
{
  id v2 = a2;
  -[AXValidationManager setValidationTargetName:](v2, "setValidationTargetName:", @"AssistiveTouch");
  -[AXValidationManager setOverrideProcessName:](v2, "setOverrideProcessName:", @"AssistiveTouch Application");
  -[AXValidationManager setDebugBuild:](v2, "setDebugBuild:", 0LL);

  return AXPerformValidationChecks();
}

id sub_100056404(void *a1)
{
  id v1 = a1;
  id v2 = v1;
  if (v1)
  {
    id v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v1 count]));
    __int128 v19 = 0u;
    __int128 v20 = 0u;
    __int128 v21 = 0u;
    __int128 v22 = 0u;
    id v4 = v2;
    id v5 = [v4 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v5)
    {
      id v7 = v5;
      uint64_t v8 = *(void *)v20;
      do
      {
        for (i = 0LL; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v20 != v8) {
            objc_enumerationMutation(v4);
          }
          unsigned int v10 = *(void **)(*((void *)&v19 + 1) + 8LL * (void)i);
          objc_opt_class(&OBJC_CLASS___NSArray, v6);
          if ((objc_opt_isKindOfClass(v10, v11) & 1) != 0)
          {
            uint64_t v13 = sub_100056404(v10);
            unsigned int v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
            [v3 addObject:v14];
          }

          else
          {
            objc_opt_class(&OBJC_CLASS___AXElement, v12);
            if ((objc_opt_isKindOfClass(v10, v15) & 1) != 0)
            {
              id v16 = objc_msgSend(v10, "elementRef", (void)v19);
              __int128 v17 = v3;
            }

            else
            {
              __int128 v17 = v3;
              id v16 = v10;
            }

            objc_msgSend(v17, "addObject:", v16, (void)v19);
          }
        }

        id v7 = [v4 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }

      while (v7);
    }
  }

  else
  {
    id v3 = 0LL;
  }

  return v3;
}

void sub_100056684(id a1)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](&OBJC_CLASS___UIScreen, "mainScreen"));
  id v1 = (void *)objc_claimAutoreleasedReturnValue([v2 safeValueForKey:@"_focusSystem"]);
  [v1 _enableWithoutFocusRestoration];
}

id SCATHardwareInputSourceAvailabilityDetailLocalizedDescription(uint64_t a1)
{
  if (a1 == 1) {
    id v1 = @"HARDWARE_DEVICE_NOT_FOUND";
  }
  else {
    id v1 = @"HARDWARE_NONE";
  }
  id v2 = sub_10002B014(v1);
  return (id)objc_claimAutoreleasedReturnValue(v2);
}

id sub_100056BAC(uint64_t a1)
{
  return _[*(id *)(a1 + 32) hardwareInputSource:*(void *)(a1 + 40) didReceiveActionWithIdentifier:*(void *)(a1 + 48) start:*(unsigned __int8 *)(a1 + 56) ignoreInputHold:*(unsigned __int8 *)(a1 + 57)];
}

id sub_100056CC8(uint64_t a1)
{
  return _[*(id *)(a1 + 32) hardwareInputSource:*(void *)(a1 + 40) didUpdateAvailability:*(unsigned __int8 *)(a1 + 56) withDetail:*(void *)(a1 + 48)];
}

void sub_100057020(void *a1, uint64_t a2, uint64_t a3, __IOHIDDevice *a4)
{
}

void sub_10005702C(void *a1, uint64_t a2, uint64_t a3, __IOHIDDevice *a4)
{
  double Current = CFRunLoopGetCurrent();
  IOHIDDeviceUnscheduleFromRunLoop(a4, Current, kCFRunLoopDefaultMode);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_100057F6C;
  v9[3] = &unk_100121D18;
  id v10 = a1;
  id v7 = v10;
  AXPerformBlockOnMainThreadAfterDelay(v9, v8, 0.0);
}

void sub_1000570C4(__IOHIDDevice *a1, void *a2)
{
  id v3 = a2;
  objc_opt_class(&OBJC_CLASS___SCATMFIInputSource, v4);
  if ((objc_opt_isKindOfClass(v3, v5) & 1) == 0)
  {
LABEL_37:
    [v3 _didUpdateAvailability:1 withDetail:0];
    goto LABEL_38;
  }

  CFTypeRef Property = IOHIDDeviceGetProperty(a1, @"DeviceUsagePairs");
  id v7 = (void *)objc_claimAutoreleasedReturnValue(Property);
  uint64_t v8 = ((uint64_t (*)(void))SWCHLogCommon)();
  CGFloat v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    *(void *)__int128 v62 = v7;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Usage pairs: %@", buf, 0xCu);
  }

  __int128 v59 = 0u;
  __int128 v60 = 0u;
  __int128 v57 = 0u;
  __int128 v58 = 0u;
  id v10 = v7;
  id v11 = [v10 countByEnumeratingWithState:&v57 objects:v69 count:16];
  if (!v11)
  {

LABEL_35:
    id v51 = v3;
LABEL_36:

    goto LABEL_37;
  }

  id v12 = v11;
  __int128 v54 = v3;
  uint64_t v13 = *(void *)v58;
LABEL_6:
  uint64_t v14 = 0LL;
  while (1)
  {
    if (*(void *)v58 != v13) {
      objc_enumerationMutation(v10);
    }
    uint64_t v15 = *(void **)(*((void *)&v57 + 1) + 8 * v14);
    id v16 = (void *)objc_claimAutoreleasedReturnValue([v15 objectForKey:@"DeviceUsage"]);
    unsigned int v17 = [v16 intValue];

    CGRect v18 = (void *)objc_claimAutoreleasedReturnValue([v15 objectForKey:@"DeviceUsagePage"]);
    unsigned int v19 = [v18 intValue];

    if (v19 == 9) {
      break;
    }
    if (v19 == 1 && v17 == 10) {
      break;
    }
    if (v12 == (id)++v14)
    {
      id v12 = [v10 countByEnumeratingWithState:&v57 objects:v69 count:16];
      if (v12) {
        goto LABEL_6;
      }

      id v3 = v54;
      goto LABEL_35;
    }
  }

  id v3 = v54;
  id v21 = v54;
  unsigned int v22 = objc_msgSend((id)IOHIDDeviceGetProperty(a1, @"IAPHIDAccessoryCategory"), "intValue");
  if (v22 == 7 || IOHIDDeviceConformsTo(a1, 1u, 0xAu))
  {
    CFTypeRef v23 = IOHIDDeviceGetProperty(a1, @"ReportDescriptor");
    double v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
    [v24 getBytes:v55 length:26];
    uint64_t v25 = SWCHLogCommon([v21 setAvailableButtons:v56]);
    uint64_t v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      CFTypeRef v27 = IOHIDDeviceGetProperty(a1, @"DeviceUsagePage");
      CFTypeRef v28 = IOHIDDeviceGetProperty(a1, @"DeviceUsage");
      CFTypeRef v29 = IOHIDDeviceGetProperty(a1, @"Manufacturer");
      *(_DWORD *)buf = 67110402;
      *(_DWORD *)__int128 v62 = v22;
      *(_WORD *)&v62[4] = 2112;
      *(void *)&v62[6] = v27;
      *(_WORD *)&v62[14] = 2112;
      *(void *)&v62[16] = v28;
      __int16 v63 = 2112;
      CFTypeRef v64 = v29;
      __int16 v65 = 1024;
      int v66 = v55[11];
      __int16 v67 = 1024;
      int v68 = v56;
      _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEFAULT,  "Found matching device [iAP category%d]: usage page: %@ usage: %@ mfc: %@\nUsage Min %d, Usage max: %d",  buf,  0x32u);
    }

    uint64_t v31 = SWCHLogCommon(v30);
    double v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      CFTypeRef v33 = IOHIDDeviceGetProperty(a1, @"VersionNumber");
      *(_DWORD *)buf = 136315394;
      *(void *)__int128 v62 = "VersionNumber";
      *(_WORD *)&v62[8] = 2112;
      *(void *)&v62[10] = v33;
      _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "%s -- %@", buf, 0x16u);
    }

    uint64_t v35 = SWCHLogCommon(v34);
    uint64_t v36 = (os_log_s *)objc_claimAutoreleasedReturnValue(v35);
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      CFTypeRef v37 = IOHIDDeviceGetProperty(a1, @"Manufacturer");
      *(_DWORD *)buf = 136315394;
      *(void *)__int128 v62 = "Manufacturer";
      *(_WORD *)&v62[8] = 2112;
      *(void *)&v62[10] = v37;
      _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "%s -- %@", buf, 0x16u);
    }

    uint64_t v39 = SWCHLogCommon(v38);
    double v40 = (os_log_s *)objc_claimAutoreleasedReturnValue(v39);
    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
    {
      CFTypeRef v41 = IOHIDDeviceGetProperty(a1, @"Product");
      *(_DWORD *)buf = 136315394;
      *(void *)__int128 v62 = "Product";
      *(_WORD *)&v62[8] = 2112;
      *(void *)&v62[10] = v41;
      _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "%s -- %@", buf, 0x16u);
    }

    uint64_t v43 = SWCHLogCommon(v42);
    CGRect v44 = (os_log_s *)objc_claimAutoreleasedReturnValue(v43);
    if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
    {
      CFTypeRef v45 = IOHIDDeviceGetProperty(a1, @"SerialNumber");
      *(_DWORD *)buf = 136315394;
      *(void *)__int128 v62 = "SerialNumber";
      *(_WORD *)&v62[8] = 2112;
      *(void *)&v62[10] = v45;
      _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_DEFAULT, "%s -- %@", buf, 0x16u);
    }

    objc_msgSend(v21, "setVersionNumber:", IOHIDDeviceGetProperty(a1, @"VersionNumber"));
    objc_msgSend(v21, "setProductName:", IOHIDDeviceGetProperty(a1, @"Product"));
    objc_msgSend(v21, "setManufacturerName:", IOHIDDeviceGetProperty(a1, @"Manufacturer"));
    objc_msgSend(v21, "setSerialNumber:", IOHIDDeviceGetProperty(a1, @"SerialNumber"));
    uint64_t v46 = IOHIDDeviceOpen(a1, 0);
    if ((_DWORD)v46)
    {
      int v47 = v46;
      uint64_t v48 = SWCHLogCommon(v46);
      CGRect v49 = (os_log_s *)objc_claimAutoreleasedReturnValue(v48);
      if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR)) {
        sub_1000AF604(v47, v49);
      }
    }

    IOHIDDeviceRegisterInputValueCallback(a1, (IOHIDValueCallback)sub_100058074, v21);
    CGRect v50 = (void *)objc_claimAutoreleasedReturnValue(+[SCATScannerManager sharedManager](&OBJC_CLASS___SCATScannerManager, "sharedManager"));
    [v50 handleUSBMFiDeviceConnected];

    goto LABEL_36;
  }

  uint64_t v52 = ((uint64_t (*)(void))SWCHLogCommon)();
  __int128 v53 = (os_log_s *)objc_claimAutoreleasedReturnValue(v52);
  if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)__int128 v62 = v22;
    _os_log_impl( (void *)&_mh_execute_header,  v53,  OS_LOG_TYPE_DEFAULT,  "Device did not match the MFi AssistiveSwitch type: %d",  buf,  8u);
  }

LABEL_38:
}

void sub_100057B4C(id *a1, void *a2)
{
  id v17 = a2;
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v17 source]);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([a1[4] switchSource]);
  unsigned int v5 = [v3 isEqualToString:v4];

  if (v5)
  {
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [a1[4] switchKeyForSwitch:v17]));
    id v7 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue([a1[5] objectForKeyedSubscript:v6]);
    if (!v7)
    {
      id v7 = -[NSMutableDictionary initWithCapacity:]( objc_alloc(&OBJC_CLASS___NSMutableDictionary),  "initWithCapacity:",  2LL);
      [a1[5] setObject:v7 forKeyedSubscript:v6];
    }

    if (a1[6])
    {
      uint64_t v8 = objc_opt_new(&OBJC_CLASS___SCATActionItem);
      CGFloat v9 = objc_opt_new(&OBJC_CLASS___SCATActionItem);
      SCATGetActionIdentifiersForRecipeAndSwitch(a1[6], v17, v8, v9);
      -[NSMutableDictionary setObject:forKeyedSubscript:]( v7,  "setObject:forKeyedSubscript:",  v8,  @"SwitchActionTypeNormal");
      if (v9) {
        -[NSMutableDictionary setObject:forKeyedSubscript:]( v7,  "setObject:forKeyedSubscript:",  v9,  @"SwitchActionTypeLongPress");
      }
    }

    else
    {
      if (([v17 hasLongPressAction] & 1) != 0
        || (id v10 = (void *)objc_claimAutoreleasedReturnValue([v17 longPressShortcutIdentifier]),
            v10,
            v10))
      {
        id v11 = objc_opt_new(&OBJC_CLASS___SCATActionItem);
        -[SCATActionItem setAction:](v11, "setAction:", [v17 longPressAction]);
        id v12 = (void *)objc_claimAutoreleasedReturnValue([v17 longPressShortcutIdentifier]);
        -[SCATActionItem setShortcutIdentifier:](v11, "setShortcutIdentifier:", v12);

        -[NSMutableDictionary setObject:forKeyedSubscript:]( v7,  "setObject:forKeyedSubscript:",  v11,  @"SwitchActionTypeLongPress");
      }

      uint64_t v8 = objc_opt_new(&OBJC_CLASS___SCATActionItem);
      -[SCATActionItem setAction:](v8, "setAction:", [v17 action]);
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v17 shortcutIdentifier]);
      -[SCATActionItem setShortcutIdentifier:](v8, "setShortcutIdentifier:", v13);

      -[NSMutableDictionary setObject:forKeyedSubscript:]( v7,  "setObject:forKeyedSubscript:",  v8,  @"SwitchActionTypeNormal");
    }

    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v17 uuid]);
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v14 UUIDString]);
    [a1[7] setObject:v15 forKeyedSubscript:v6];

    id v16 = (void *)objc_claimAutoreleasedReturnValue([v17 name]);
    [a1[8] setObject:v16 forKeyedSubscript:v6];
  }
}

void sub_100057F6C(uint64_t a1)
{
  id v2 = (const __CFSet *)[*(id *)(a1 + 32) hidManager];
  if (v2 && (id v2 = IOHIDManagerCopyDevices(v2)) != 0LL)
  {
    id v3 = v2;
    CFIndex Count = CFSetGetCount(v2);
    CFRelease(v3);
  }

  else
  {
    CFIndex Count = 0LL;
  }

  uint64_t v5 = SWCHLogCommon(v2);
  uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLong:](&OBJC_CLASS___NSNumber, "numberWithLong:", Count));
    int v8 = 138412290;
    CGFloat v9 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Device count: %@", (uint8_t *)&v8, 0xCu);
  }

  if (!Count) {
    [*(id *)(a1 + 32) _didUpdateAvailability:0 withDetail:1];
  }
}

void sub_100058074(void *a1, int a2, int a3, IOHIDValueRef value)
{
  Element = IOHIDValueGetElement(value);
  uint32_t UsagePage = IOHIDElementGetUsagePage(Element);
  uint32_t Usage = IOHIDElementGetUsage(Element);
  CFIndex IntegerValue = IOHIDValueGetIntegerValue(value);
  uint64_t v10 = SWCHLogCommon();
  id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v18[0] = 67109632;
    v18[1] = UsagePage;
    __int16 v19 = 1024;
    uint32_t v20 = Usage;
    __int16 v21 = 1024;
    BOOL v22 = IntegerValue > 0;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "MFI: UsagePage: %d, Button Number: %d, Down: %d",  (uint8_t *)v18,  0x14u);
  }

  if (UsagePage == 9)
  {
    BOOL v12 = IntegerValue > 0;
    id v13 = a1;
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v13 actionForButtonNumber:Usage withType:@"SwitchActionTypeNormal"]);
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v13 actionForButtonNumber:Usage withType:@"SwitchActionTypeLongPress"]);
    id v16 = (void *)objc_claimAutoreleasedReturnValue([v13 persistentSwitchIdentifierForButtonNumber:Usage]);
    id v17 = (void *)objc_claimAutoreleasedReturnValue([v13 switchDisplayNameForButtonNumber:Usage]);
    [v13 _handleAction:v14 longPressAction:v15 start:v12 switchIdentifier:v16 switchDisplayName:v17];
  }

void sub_100058B90(id a1)
{
  id v1 = objc_alloc_init(&OBJC_CLASS___SCATSwitchControlWorkspace);
  id v2 = (void *)qword_1001576C0;
  qword_1001576C0 = (uint64_t)v1;
}

void sub_100059218(id a1)
{
  id v1 = -[SCATAssistiveTouchServerInstance _initServer]( objc_alloc(&OBJC_CLASS___SCATAssistiveTouchServerInstance),  "_initServer");
  id v2 = (void *)qword_1001576D0;
  qword_1001576D0 = (uint64_t)v1;
}

uint64_t sub_100059CE8(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6 = a2;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 type]);
  if ([v7 isEqualToString:*(void *)(a1 + 32)])
  {
  }

  else
  {
    int v8 = (void *)objc_claimAutoreleasedReturnValue([v6 title]);
    unsigned int v9 = [v8 isEqualToString:*(void *)(a1 + 32)];

    if (!v9)
    {
      uint64_t v10 = 0LL;
      goto LABEL_6;
    }
  }

  uint64_t v10 = 1LL;
  *a4 = 1;
LABEL_6:

  return v10;
}

id sub_10005A060(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6 = (void *)objc_claimAutoreleasedReturnValue([a2 type]);
  id v7 = [v6 isEqualToString:*(void *)(a1 + 32)];

  if ((_DWORD)v7) {
    *a4 = 1;
  }
  return v7;
}

LABEL_6:
}

id sub_10005AE0C(uint64_t a1)
{
  return [*(id *)(a1 + 32) removeReasonToDisableScanning:@"PerformingGesture"];
}

id sub_10005D3C8(uint64_t a1)
{
  return objc_msgSend( *(id *)(a1 + 32),  "clearAllFingersAnimated:endPointForAnimation:",  1,  CGPointZero.x,  CGPointZero.y);
}

void sub_10005E428(uint64_t a1, void *a2, uint64_t a3)
{
  v29[0] = AXDictionaryElementKeyHint;
  id v4 = a2;
  uint64_t v5 = objc_claimAutoreleasedReturnValue([v4 hint]);
  id v6 = (void *)v5;
  if (v5) {
    id v7 = (__CFString *)v5;
  }
  else {
    id v7 = &stru_100127100;
  }
  v30[0] = v7;
  v29[1] = AXDictionaryElementKeyIndex;
  uint64_t v26 = v7;
  CFTypeRef v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a3));
  v30[1] = v27;
  v29[2] = AXDictionaryElementKeyIsKeyboardKey;
  uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v4 isKeyboardKey]));
  v30[2] = v25;
  v29[3] = AXDictionaryElementKeyLabel;
  uint64_t v8 = objc_claimAutoreleasedReturnValue([v4 label]);
  unsigned int v9 = (void *)v8;
  if (v8) {
    uint64_t v10 = (__CFString *)v8;
  }
  else {
    uint64_t v10 = &stru_100127100;
  }
  v30[3] = v10;
  v29[4] = AXDictionaryElementKeyLanguage;
  double v24 = v10;
  uint64_t v11 = objc_claimAutoreleasedReturnValue([v4 language]);
  BOOL v12 = (void *)v11;
  if (v11) {
    id v13 = (__CFString *)v11;
  }
  else {
    id v13 = &stru_100127100;
  }
  v30[4] = v13;
  v29[5] = AXDictionaryElementKeyTraits;
  uint64_t v14 = v13;
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( NSNumber,  "numberWithUnsignedLongLong:",  [v4 traits]));
  v30[5] = v15;
  v29[6] = AXDictionaryElementKeyTraitsDescription;
  uint64_t v16 = _AXTraitsAsString([v4 traits]);
  id v17 = (void *)v16;
  if (v16) {
    CGRect v18 = (__CFString *)v16;
  }
  else {
    CGRect v18 = &stru_100127100;
  }
  v30[6] = v18;
  v29[7] = AXDictionaryElementKeyValue;
  __int16 v19 = v18;
  uint32_t v20 = (__CFString *)objc_claimAutoreleasedReturnValue([v4 value]);

  if (v20) {
    __int16 v21 = v20;
  }
  else {
    __int16 v21 = &stru_100127100;
  }
  v30[7] = v21;
  BOOL v22 = v21;
  CFTypeRef v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v30,  v29,  8LL));

  [*(id *)(a1 + 32) addObject:v23];
}

id sub_10005EA08(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(+[HNDAccessibilityManager sharedManager](&OBJC_CLASS___HNDAccessibilityManager, "sharedManager"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 elements]);
  uint64_t v7 = 0LL;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000LL;
  uint64_t v10 = sub_100060008;
  uint64_t v11 = sub_100060018;
  id v12 = 0LL;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  _DWORD v6[2] = sub_100060020;
  v6[3] = &unk_100123A18;
  void v6[4] = &v7;
  void v6[5] = a1;
  [v3 enumerateObjectsUsingBlock:v6];
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void sub_10005EAE8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_10005F4AC( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
}

void sub_10005F4D4(uint64_t a1)
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  id v2 = [v4 assistiveTouchInternalOnlyHiddenNubbitModeEnabled];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _enableHiddenNubbitMode:v2];
}

void sub_10005F570(id a1)
{
  id v1 = objc_opt_new(&OBJC_CLASS___HNDAssistiveTouchServer);
  id v2 = (void *)qword_1001576E0;
  qword_1001576E0 = (uint64_t)v1;
}

uint64_t sub_100060008(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_100060018(uint64_t a1)
{
}

void sub_100060020(uint64_t a1, void *a2)
{
  id v14 = a2;
  [v14 frame];
  double v5 = v4;
  double v7 = v6;
  [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) frame];
  double v8 = v5 * v7;
  double v11 = v9 * v10;
  unsigned int v12 = [v14 hasAllTraits:*(void *)(a1 + 40)];
  if (v8 > v11 && v12 != 0) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL), a2);
  }
}

id sub_100061A48(uint64_t a1, double a2, double a3, double a4, double a5)
{
  double v10 = *(double *)(a1 + 40) * 0.5 + *(double *)(a1 + 48);
  [*(id *)(a1 + 32) tailAngle];
  double v12 = v10 * cos(v11 + 1.57079633);
  [*(id *)(a1 + 32) tailAngle];
  double v14 = v10 * sin(v13 + 1.57079633);
  CGFloat v33 = a3 - v14;
  CGFloat v34 = a2 - v12;
  double v32 = a3;
  CGPathMoveToPoint(*(CGMutablePathRef *)(a1 + 56), 0LL, a2 - v12, a3 - v14);
  CGPathAddLineToPoint(*(CGMutablePathRef *)(a1 + 56), 0LL, a4 - v12, a5 - v14);
  CGPathAddLineToPoint(*(CGMutablePathRef *)(a1 + 56), 0LL, a4 + v12, a5 + v14);
  CGFloat v15 = a2 + v12;
  double v16 = a3 + v14;
  CGPathAddLineToPoint(*(CGMutablePathRef *)(a1 + 56), 0LL, v15, a3 + v14);
  double v17 = *(double *)(a1 + 48);
  [*(id *)(a1 + 32) tailAngle];
  double v19 = v17 * cos(v18);
  double v20 = *(double *)(a1 + 48);
  [*(id *)(a1 + 32) tailAngle];
  double v22 = v20 * sin(v21);
  double v23 = *(double *)(a1 + 40) * 0.5;
  [*(id *)(a1 + 32) tailAngle];
  double v25 = v23 * cos(v24 + 1.57079633);
  double v26 = *(double *)(a1 + 40) * 0.5;
  [*(id *)(a1 + 32) tailAngle];
  double v28 = v26 * sin(v27 + 1.57079633);
  CGPathAddArcToPoint( *(CGMutablePathRef *)(a1 + 56),  0LL,  v15 - v19,  v16 - v22,  a2 + v25 - v19,  v32 + v28 - v22,  *(CGFloat *)(a1 + 48));
  CGPathAddLineToPoint(*(CGMutablePathRef *)(a1 + 56), 0LL, a2 - v25 - v19, v32 - v28 - v22);
  CGPathAddArcToPoint(*(CGMutablePathRef *)(a1 + 56), 0LL, v34 - v19, v33 - v22, v34, v33, *(CGFloat *)(a1 + 48));
  CGPathCloseSubpath(*(CGMutablePathRef *)(a1 + 56));
  CFTypeRef v29 = *(void **)(a1 + 32);
  uint64_t v30 = *(void *)(a1 + 56);
  [v29 tailAngle];
  return _objc_msgSend(v29, "_addGrayArrowHeadToPath:tipAngle:tipPoint:", v30);
}

id sub_100061CF0( uint64_t a1, int a2, CGFloat a3, CGFloat a4, double a5, double a6, CGFloat a7, double a8, double a9, double a10, double a11, double a12)
{
  double v24 = *(double *)(a1 + 40) * 0.5 + *(double *)(a1 + 48);
  BOOL v25 = a2 != 0;
  if (a2) {
    double v26 = a5 - v24;
  }
  else {
    double v26 = v24 + a5;
  }
  if (a2) {
    double v27 = v24 + a5;
  }
  else {
    double v27 = a5 - v24;
  }
  double v28 = *(CGPath **)(a1 + 56);
  __double2 v29 = __sincos_stret(a6);
  CGPathMoveToPoint(v28, 0LL, a3 + v26 * v29.__cosval, a4 + v26 * v29.__sinval);
  CGPathAddArc(*(CGMutablePathRef *)(a1 + 56), 0LL, a3, a4, v26, a6, a7, v25);
  uint64_t v30 = *(CGPath **)(a1 + 56);
  double v52 = a7;
  __double2 v31 = __sincos_stret(a7);
  CGPathAddLineToPoint(v30, 0LL, a3 + v27 * v31.__cosval, a4 + v27 * v31.__sinval);
  CGPathAddArc(*(CGMutablePathRef *)(a1 + 56), 0LL, a3, a4, v27, a7, a6, a2 != 1);
  [*(id *)(a1 + 32) tailAngle];
  double v33 = v24 * cos(v32 + 1.57079633);
  [*(id *)(a1 + 32) tailAngle];
  double v35 = v24 * sin(v34 + 1.57079633);
  double v36 = *(double *)(a1 + 48);
  [*(id *)(a1 + 32) tailAngle];
  double v38 = v36 * cos(v37);
  double v39 = *(double *)(a1 + 48);
  [*(id *)(a1 + 32) tailAngle];
  double v41 = v39 * sin(v40);
  double v42 = *(double *)(a1 + 40) * 0.5;
  [*(id *)(a1 + 32) tailAngle];
  double v44 = v42 * cos(v43 + 1.57079633);
  double v45 = *(double *)(a1 + 40) * 0.5;
  [*(id *)(a1 + 32) tailAngle];
  double v47 = v45 * sin(v46 + 1.57079633);
  CGPathAddArcToPoint( *(CGMutablePathRef *)(a1 + 56),  0LL,  a8 + v33 - v38,  a9 + v35 - v41,  a8 + v44 - v38,  a9 + v47 - v41,  *(CGFloat *)(a1 + 48));
  CGPathAddLineToPoint(*(CGMutablePathRef *)(a1 + 56), 0LL, a8 - v44 - v38, a9 - v47 - v41);
  CGPathAddArcToPoint( *(CGMutablePathRef *)(a1 + 56),  0LL,  a8 - v33 - v38,  a9 - v35 - v41,  a8 - v33,  a9 - v35,  *(CGFloat *)(a1 + 48));
  CGPathCloseSubpath(*(CGMutablePathRef *)(a1 + 56));
  uint64_t v48 = *(void **)(a1 + 32);
  uint64_t v49 = *(void *)(a1 + 56);
  [v48 curvature];
  return _objc_msgSend(v48, "_addGrayArrowHeadToPath:tipAngle:tipPoint:", v49, v52 - dbl_100118090[v50 < 0.0], a11, a12);
}

void sub_1000624D0(uint64_t a1, CGFloat a2, CGFloat a3, double a4)
{
  double v8 = *(CGContext **)(a1 + 32);
  double v9 = *(double *)(a1 + 40);
  __double2 v10 = __sincos_stret(a4 + -2.35619449);
  CGContextMoveToPoint(v8, a2 + v9 * v10.__cosval, a3 + v9 * v10.__sinval);
  CGContextAddLineToPoint(*(CGContextRef *)(a1 + 32), a2, a3);
  double v11 = a4 + 2.35619449;
  double v12 = *(CGContext **)(a1 + 32);
  double v13 = *(double *)(a1 + 40);
  __double2 v14 = __sincos_stret(v11);
  CGContextAddLineToPoint(v12, a2 + v13 * v14.__cosval, a3 + v13 * v14.__sinval);
  CGContextStrokePath(*(CGContextRef *)(a1 + 32));
}

uint64_t sub_10006257C(uint64_t a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5)
{
  uint64_t v10 = *(void *)(a1 + 48);
  [*(id *)(a1 + 40) tailAngle];
  return (*(uint64_t (**)(uint64_t, CGFloat, CGFloat, double))(v10 + 16))(v10, a4, a5, v11);
}

uint64_t sub_10006262C( uint64_t a1, int a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7, CGFloat a8, CGFloat a9, double a10, double a11, double a12)
{
  uint64_t v26 = *(void *)(a1 + 48);
  [*(id *)(a1 + 40) curvature];
  return (*(uint64_t (**)(uint64_t, double, double, CGFloat))(v26 + 16))( v26,  a11,  a12,  a7 - dbl_100118090[v27 < 0.0]);
}

void sub_100062D48(uint64_t a1, double a2, double a3, double a4, double a5, uint64_t a6, int a7)
{
  double v10 = a3;
  double v11 = a2;
  CGPathMoveToPoint(*(CGMutablePathRef *)(a1 + 64), 0LL, a2 - *(double *)(a1 + 48), a3 - *(double *)(a1 + 56));
  double v13 = *(double *)(a1 + 48);
  double v14 = *(double *)(a1 + 56);
  double v15 = a4 - v13;
  double v16 = a5 - v14;
  double v17 = a4 + v13;
  double v18 = a5 + v14;
  if (a7)
  {
    [*(id *)(a1 + 32) arrowHeadBaseOffset];
    double v31 = v10;
    double v20 = v19;
    [*(id *)(a1 + 32) arrowHeadTipOffset];
    double v30 = v11;
    double v22 = v21;
    __double2 v23 = __sincos_stret(*(double *)(a1 + 72));
    CGFloat v24 = v15 - v20 * v23.__cosval;
    CGFloat v25 = v16 - v20 * v23.__sinval;
    double v26 = v17 - v20 * v23.__cosval;
    double v27 = a4 + v22 * v23.__cosval;
    CGPathAddLineToPoint(*(CGMutablePathRef *)(a1 + 64), 0LL, v24, v25);
    double v28 = v18 - v20 * v23.__sinval;
    double v29 = a5 + v22 * v23.__sinval;
    double v11 = v30;
    double v10 = v31;
    objc_msgSend( *(id *)(a1 + 40),  "_addArrowHeadToPath:baseLeftPoint:baseRightPoint:tipPoint:",  *(void *)(a1 + 64),  v24,  v25,  v26,  v28,  v27,  v29);
  }

  else
  {
    CGPathAddLineToPoint(*(CGMutablePathRef *)(a1 + 64), 0LL, a4 - v13, a5 - v14);
    CGPathAddLineToPoint(*(CGMutablePathRef *)(a1 + 64), 0LL, v17, v18);
  }

  CGPathAddLineToPoint(*(CGMutablePathRef *)(a1 + 64), 0LL, v11 + *(double *)(a1 + 48), v10 + *(double *)(a1 + 56));
  CGPathCloseSubpath(*(CGMutablePathRef *)(a1 + 64));
}

void sub_100062F80( uint64_t a1, int a2, CGFloat a3, CGFloat a4, double a5, double a6, CGFloat a7, uint64_t a8, int a9)
{
  double v17 = *(double *)(a1 + 48) * 0.5;
  double v18 = a5 - v17;
  double v19 = v17 + a5;
  if (a2) {
    double v20 = v18;
  }
  else {
    double v20 = v19;
  }
  if (a2) {
    double v21 = v19;
  }
  else {
    double v21 = v18;
  }
  double v22 = *(CGPath **)(a1 + 56);
  __double2 v23 = __sincos_stret(a6);
  CGPathMoveToPoint(v22, 0LL, a3 + v20 * v23.__cosval, a4 + v20 * v23.__sinval);
  if (a9)
  {
    [*(id *)(a1 + 32) arrowHeadBaseOffset];
    double v25 = v24;
    [*(id *)(a1 + 32) arrowHeadTipOffset];
    double v27 = v25 / a5;
    if (a7 > a6) {
      double v27 = -(v25 / a5);
    }
    double v28 = v27 + a7;
    double v29 = v26 / a5;
    if (a7 <= a6) {
      double v29 = -v29;
    }
    double v34 = v29 + a7;
    CGPathAddArc(*(CGMutablePathRef *)(a1 + 56), 0LL, a3, a4, v20, a6, v28, a2 != 0);
    __double2 v30 = __sincos_stret(v28);
    __double2 v31 = __sincos_stret(v34);
    objc_msgSend( *(id *)(a1 + 40),  "_addArrowHeadToPath:baseLeftPoint:baseRightPoint:tipPoint:",  *(void *)(a1 + 56),  a3 + v20 * v30.__cosval,  a4 + v20 * v30.__sinval,  a3 + v21 * v30.__cosval,  a4 + v21 * v30.__sinval,  a3 + a5 * v31.__cosval,  a4 + a5 * v31.__sinval);
    a7 = v28;
  }

  else
  {
    CGPathAddArc(*(CGMutablePathRef *)(a1 + 56), 0LL, a3, a4, v20, a6, a7, a2 != 0);
    double v32 = *(CGPath **)(a1 + 56);
    __double2 v33 = __sincos_stret(a7);
    CGPathAddLineToPoint(v32, 0LL, a3 + v21 * v33.__cosval, a4 + v21 * v33.__sinval);
  }

  CGPathAddArc(*(CGMutablePathRef *)(a1 + 56), 0LL, a3, a4, v21, a7, a6, a2 != 1);
  CGPathCloseSubpath(*(CGMutablePathRef *)(a1 + 56));
}

void sub_100063198(id a1)
{
  uint64_t v1 = objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:](&OBJC_CLASS___UIImage, "imageNamed:", @"cursor_blue.png"));
  id v2 = (void *)qword_1001576F0;
  qword_1001576F0 = v1;
}

void sub_100063370(_Unwind_Exception *a1)
{
}

id sub_100063388(id result, double a2, double a3)
{
  uint64_t v3 = *(void *)(*((void *)result + 5) + 8LL);
  if (*(void *)(v3 + 24))
  {
    double v6 = (id *)result;
    [*((id *)result + 4) size];
    id result = objc_msgSend( v6[4],  "drawAtPoint:blendMode:alpha:",  0,  a2 - v7 * 0.5,  a3 - v8 * 0.5,  (1.0 - (double)*(unint64_t *)(*((void *)v6[5] + 1) + 24) / (double)((unint64_t)v6[6] + 1))
             * 0.75);
    uint64_t v3 = *((void *)v6[5] + 1);
    uint64_t v9 = *(void *)(v3 + 24) + 1LL;
  }

  else
  {
    uint64_t v9 = 1LL;
  }

  *(void *)(v3 + 24) = v9;
  return result;
}

uint64_t sub_100063434(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

uint64_t sub_100063440( uint64_t a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8, double a9, double a10, double a11)
{
  return (*(uint64_t (**)(double, double, double, double))(*(void *)(a1 + 32) + 16LL))(a7, a8, a10, a11);
}

void sub_1000637B8( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
}

id sub_1000637D8(uint64_t a1, void *a2)
{
  id v3 = a2;
  double v4 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained(v4);
  unsigned int v6 = [WeakRetained isRunning];

  if (v6)
  {
    id v7 = objc_loadWeakRetained(v4);
    id v8 = [v7 _handleAXEvent:v3];
  }

  else
  {
    id v8 = 0LL;
  }

  return v8;
}

void sub_100063994(uint64_t a1)
{
  id v2 = objc_opt_new(&OBJC_CLASS___SCATActionItem);
  -[SCATActionItem setAction:](v2, "setAction:", *(void *)(a1 + 56));
  [*(id *)(a1 + 32) _handleAction:v2 longPressAction:0 start:1 switchIdentifier:*(void *)(a1 + 40) switchDisplayName:*(void *)(a1 + 48)];
  [*(id *)(a1 + 32) _handleAction:v2 longPressAction:0 start:0 switchIdentifier:*(void *)(a1 + 40) switchDisplayName:*(void *)(a1 + 48)];
}

id sub_100063AF8(uint64_t a1)
{
  return _[*(id *)(a1 + 32) remoteControlInputSource:*(void *)(a1 + 40) didReceiveActionWithIdentifier:*(void *)(a1 + 48) start:*(unsigned __int8 *)(a1 + 56) ignoreInputHold:*(unsigned __int8 *)(a1 + 57)];
}

LABEL_26:
      }
    }
  }

  -[SCATElementNavigationController setFirstResponder:](self, "setFirstResponder:", v6);
}

  double v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v8, 1LL));

LABEL_27:
  return v21;
}
}

LABEL_47:
        id v7 = v101;
        id v8 = v105;
      }

      goto LABEL_48;
    }

    if ([v6 isEqualToString:AXSSwitchControlMenuItemGestures])
    {
      double v13 = (NSMutableArray *)objc_claimAutoreleasedReturnValue([v7 screenPoint]);

      if (!v13) {
        goto LABEL_12;
      }
      v104[0] = @"gestures";
      v103[0] = @"identifier";
      v103[1] = @"title";
      double v25 = sub_10002B014(@"SCAT_QUICK_ITEM_GESTURES");
      uint64_t v9 = (id)objc_claimAutoreleasedReturnValue(v25);
      v104[1] = v9;
      v104[2] = @"SCATIcon_gestures";
      v103[2] = @"imageName";
      v103[3] = @"activateBehavior";
      v104[3] = &off_10012FAF0;
      double v10 = (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v104,  v103,  4LL));
      CGRect v105 = v10;
      double v15 = &v105;
      goto LABEL_10;
    }

    double v26 = AXSSwitchControlMenuItemHome;
    if ([v6 isEqualToString:AXSSwitchControlMenuItemHome])
    {
      v101[0] = @"action_home";
      v100[0] = @"identifier";
      v100[1] = @"title";
      double v27 = sub_10002B014(@"SCAT_QUICK_ITEM_HOME");
      uint64_t v9 = (id)objc_claimAutoreleasedReturnValue(v27);
      v101[1] = v9;
      v101[2] = @"SCATIcon_device_home_tv";
      v100[2] = @"imageName";
      v100[3] = @"guidedAccess";
      v100[4] = @"activateBehavior";
      v101[3] = &__kCFBooleanFalse;
      v101[4] = &off_10012FAF0;
      double v10 = (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v101,  v100,  5LL));
      v102 = v10;
      double v15 = &v102;
      goto LABEL_10;
    }

    if ([v6 isEqualToString:AXSSwitchControlMenuItemIncrementDecrement])
    {
      double v28 = (void *)objc_claimAutoreleasedReturnValue([v7 element]);
      double v29 = (unint64_t)[v28 scatTraits];
      __double2 v30 = kAXAdjustableTrait & ~v29;

      if (!v30)
      {
        __double2 v31 = (void *)objc_claimAutoreleasedReturnValue(+[HNDAccessibilityManager sharedManager](&OBJC_CLASS___HNDAccessibilityManager, "sharedManager"));
        else {
          double v32 = @"SCATIcon_action_decrement";
        }
        __double2 v33 = v32;

        double v34 = (void *)objc_claimAutoreleasedReturnValue(+[HNDAccessibilityManager sharedManager](&OBJC_CLASS___HNDAccessibilityManager, "sharedManager"));
        else {
          double v35 = @"SCATIcon_action_increment";
        }
        double v36 = v35;

        v98[0] = @"action_decrement";
        v97[0] = @"identifier";
        v97[1] = @"title";
        double v37 = sub_10002B014(@"DECREMENT");
        double v38 = (void *)objc_claimAutoreleasedReturnValue(v37);
        v98[1] = v38;
        v98[2] = v33;
        v97[2] = @"imageName";
        v97[3] = @"activateBehavior";
        v98[3] = &off_10012FB08;
        double v39 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v98,  v97,  4LL));
        v99[0] = v39;
        v96[0] = @"action_increment";
        v95[0] = @"identifier";
        v95[1] = @"title";
        double v40 = sub_10002B014(@"INCREMENT");
        double v41 = (void *)objc_claimAutoreleasedReturnValue(v40);
        v96[1] = v41;
        v96[2] = v36;
        v95[2] = @"imageName";
        v95[3] = @"activateBehavior";
        v96[3] = &off_10012FB08;
        double v42 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v96,  v95,  4LL));
        v99[1] = v42;
        double v13 = (NSMutableArray *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  v99,  2LL));

        goto LABEL_12;
      }
    }

    else
    {
      if ([v6 isEqualToString:AXSSwitchControlMenuItemNavigationMode])
      {
        __int16 v67 = 0LL;
        int v68 = 0LL;
        [a1 _title:&v68 imageForNavigationItem:&v67];
        uint64_t v9 = v68;
        double v10 = v67;
        double v13 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
        if (v9 && v10)
        {
          v93[0] = @"identifier";
          v93[1] = @"title";
          v94[0] = @"settings_navigationMode";
          v94[1] = v9;
          v93[2] = @"imageName";
          v93[3] = @"activateBehavior";
          v94[2] = v10;
          v94[3] = &off_10012FAD8;
          double v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v94,  v93,  4LL));
          -[NSMutableArray addObject:](v13, "addObject:", v11);
        }

        else
        {
          double v44 = SWCHLogMenu();
          double v11 = (void *)objc_claimAutoreleasedReturnValue(v44);
          if (os_log_type_enabled((os_log_t)v11, OS_LOG_TYPE_FAULT)) {
            sub_1000AF93C((uint64_t)v6, (os_log_s *)v11);
          }
        }

        goto LABEL_4;
      }

      if ([v6 isEqualToString:v26])
      {
        v91[0] = @"action_home";
        v90[0] = @"identifier";
        v90[1] = @"title";
        double v43 = sub_10002B014(@"SCAT_QUICK_ITEM_HOME");
        uint64_t v9 = (id)objc_claimAutoreleasedReturnValue(v43);
        v91[1] = v9;
        v91[2] = @"SCATIcon_device_home_tv";
        v90[2] = @"imageName";
        v90[3] = @"guidedAccess";
        v90[4] = @"activateBehavior";
        v91[3] = &__kCFBooleanFalse;
        void v91[4] = &off_10012FAF0;
        double v10 = (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v91,  v90,  5LL));
        id v92 = v10;
        double v15 = &v92;
        goto LABEL_10;
      }

      if ([v6 isEqualToString:AXSSwitchControlMenuItemRecipes])
      {
        double v45 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
        double v46 = (void *)objc_claimAutoreleasedReturnValue([v45 switchControlRecipes]);
        if ([v46 count])
        {
        }

        else
        {
          uint64_t v49 = (void *)objc_claimAutoreleasedReturnValue([v7 screenPoint]);

          if (!v49) {
            goto LABEL_48;
          }
        }

        v88[0] = @"recipes";
        v87[0] = @"identifier";
        v87[1] = @"title";
        double v50 = sub_10002B014(@"RECIPES");
        uint64_t v9 = (id)objc_claimAutoreleasedReturnValue(v50);
        v87[2] = @"activateBehavior";
        v88[1] = v9;
        v88[2] = &off_10012FAF0;
        double v10 = (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v88,  v87,  3LL));
        id v89 = v10;
        double v15 = &v89;
        goto LABEL_10;
      }

      if ([v6 isEqualToString:AXSSwitchControlMenuItemRefineSelection])
      {
        uint64_t v9 = (id)objc_claimAutoreleasedReturnValue([v7 pointPicker]);
        if ([v9 allowsSelectionRefinement])
        {
          v85[0] = @"action_refinePoint";
          v84[0] = @"identifier";
          v84[1] = @"title";
          double v47 = sub_10002B014(@"REFINE-SELECTION");
          double v10 = (id)objc_claimAutoreleasedReturnValue(v47);
          v84[2] = @"activateBehavior";
          v85[1] = v10;
          v85[2] = &off_10012FAD8;
          double v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v85,  v84,  3LL));
          v86 = v11;
          double v12 = &v86;
          goto LABEL_3;
        }

        goto LABEL_47;
      }

      if (([v6 isEqualToString:AXSSwitchControlMenuItemScroll] & 1) == 0)
      {
        if ([v6 isEqualToString:AXSSwitchControlMenuItemSettings])
        {
          v82[0] = @"settings";
          v81[0] = @"identifier";
          v81[1] = @"title";
          uint64_t v48 = sub_10002B014(@"SETTINGS");
          uint64_t v9 = (id)objc_claimAutoreleasedReturnValue(v48);
          v82[1] = v9;
          v82[2] = &__kCFBooleanFalse;
          v81[2] = @"guidedAccess";
          v81[3] = @"activateBehavior";
          v82[3] = &off_10012FAF0;
          double v10 = (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v82,  v81,  4LL));
          v83 = v10;
          double v15 = &v83;
          goto LABEL_10;
        }

        if ([v6 isEqualToString:AXSSwitchControlMenuItemMediaControls])
        {
          v79[0] = @"mediacontrols";
          v78[0] = @"identifier";
          v78[1] = @"title";
          id v51 = sub_10002B014(@"MEDIA_CONTROLS");
          uint64_t v9 = (id)objc_claimAutoreleasedReturnValue(v51);
          v79[1] = v9;
          v79[2] = &__kCFBooleanFalse;
          v78[2] = @"guidedAccess";
          v78[3] = @"activateBehavior";
          v79[3] = &off_10012FAF0;
          double v10 = (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v79,  v78,  4LL));
          __int128 v80 = v10;
          double v15 = &v80;
          goto LABEL_10;
        }

        if ([v6 isEqualToString:AXSSwitchControlMenuItemItemMenu])
        {
          double v52 = (void *)objc_claimAutoreleasedReturnValue([v7 delegate]);
          if ([v52 shouldAddItemSpecificMenuOptionsToMenu:v7])
          {
            __int128 v53 = (void *)objc_claimAutoreleasedReturnValue([v7 delegate]);
            __int128 v54 = [v53 itemMenuStateForMenu:v7];

            if (v54 != (id)2)
            {
              v76[0] = @"action_itemSpecificMenu";
              v75[0] = @"identifier";
              v75[1] = @"title";
              __int128 v55 = sub_10002B014(@"ITEM_SPECIFIC_MENU");
              uint64_t v9 = (id)objc_claimAutoreleasedReturnValue(v55);
              v76[1] = v9;
              v76[2] = @"SCATIcon_settings_moveTop";
              v75[2] = @"imageName";
              v75[3] = @"activateBehavior";
              v76[3] = &off_10012FAD8;
              double v10 = (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v76,  v75,  4LL));
              id v77 = v10;
              double v15 = &v77;
              goto LABEL_10;
            }
          }

          else
          {
          }
        }

        else if ([v6 isEqualToString:AXSSwitchControlMenuItemLockItemMenu])
        {
          unsigned __int8 v56 = (void *)objc_claimAutoreleasedReturnValue([v7 delegate]);
          __int128 v57 = [v56 shouldAddItemSpecificMenuOptionsToMenu:v7];

          if (v57)
          {
            __int128 v58 = (void *)objc_claimAutoreleasedReturnValue([v7 delegate]);
            __int128 v59 = [v58 itemMenuStateForMenu:v7];

            v73[0] = @"action_lockItemSpecificMenu";
            v72[0] = @"identifier";
            v72[1] = @"title";
            if (v59 == (id)2)
            {
              __int128 v60 = sub_10002B014(@"UNLOCK_ITEM_SPECIFIC_MENU");
              __int128 v61 = (void *)objc_claimAutoreleasedReturnValue(v60);
              __int128 v62 = @"SCATIcon_action_unlockItemMenu";
            }

            else
            {
              __int16 v65 = sub_10002B014(@"LOCK_ITEM_SPECIFIC_MENU");
              __int128 v61 = (void *)objc_claimAutoreleasedReturnValue(v65);
              __int128 v62 = @"SCATIcon_action_lockItemMenu";
            }

            v73[1] = v61;
            v73[2] = v62;
            v72[2] = @"imageName";
            v72[3] = @"activateBehavior";
            v73[3] = &off_10012FAD8;
            int v66 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v73,  v72,  4LL));
            double v74 = v66;
            double v13 = (NSMutableArray *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  &v74,  1LL));

            goto LABEL_12;
          }
        }

        else
        {
          __int16 v63 = [v6 isEqualToString:AXSSwitchControlMenuItemATVRemoteMenu];
          if ((_DWORD)v63)
          {
            v70[0] = @"action_ATVRemoteMenu";
            v69[0] = @"identifier";
            v69[1] = @"title";
            CFTypeRef v64 = sub_10002B014(@"PRESS_MENU");
            uint64_t v9 = (id)objc_claimAutoreleasedReturnValue(v64);
            v70[1] = v9;
            v70[2] = @"SCATIcon_action_menu";
            v69[2] = @"imageName";
            v69[3] = @"activateBehavior";
            v70[3] = &off_10012FB08;
            double v10 = (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v70,  v69,  4LL));
            double v71 = v10;
            double v15 = &v71;
            goto LABEL_10;
          }

          _AXAssert( v63,  "/Library/Caches/com.apple.xbs/Sources/AssistiveTouch/SCATModernMenuActionsFactory.m",  465LL,  "+[SCATModernMenuActionsFactory itemDetailsForItem:menu:]",  @"Unhandled actions menu item: %@");
        }
      }
    }

LABEL_48:
    }
  }

    double v13 = 0LL;
    goto LABEL_12;
  }

  double v13 = (NSMutableArray *)objc_claimAutoreleasedReturnValue([v7 textElement]);

  if (v13)
  {
    v113[0] = @"action_edit";
    v112[0] = @"identifier";
    v112[1] = @"title";
    double v14 = sub_10002B014(@"EDIT");
    uint64_t v9 = (id)objc_claimAutoreleasedReturnValue(v14);
    v113[1] = v9;
    v113[2] = @"SCATIcon_edit";
    v112[2] = @"imageName";
    v112[3] = @"activateBehavior";
    v113[3] = &off_10012FAF0;
    double v10 = (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v113,  v112,  4LL));
    v114 = v10;
    double v15 = &v114;
LABEL_10:
    double v13 = (NSMutableArray *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  v15,  1LL));
    goto LABEL_11;
  }

LABEL_50:
  if (-[SCATElementNavigationController shouldRescanAfterFetch](self, "shouldRescanAfterFetch", v97)
    || [v8 isActive] && !v45)
  {
    CFTypeRef v64 = (void *)objc_claimAutoreleasedReturnValue(+[AXSubsystemSCElementNav sharedInstance](&OBJC_CLASS___AXSubsystemSCElementNav, "sharedInstance"));
    __int16 v65 = [v64 ignoreLogging];

    if ((v65 & 1) == 0)
    {
      int v66 = (void *)objc_claimAutoreleasedReturnValue(+[AXSubsystemSCElementNav identifier](&OBJC_CLASS___AXSubsystemSCElementNav, "identifier"));
      int v68 = AXLoggerForFacility(v66, v67);
      double v69 = (os_log_s *)objc_claimAutoreleasedReturnValue(v68);

      double v70 = AXOSLogLevelFromAXLogLevel(3LL);
      if (os_log_type_enabled(v69, v70))
      {
        double v71 = AXColorizeFormatLog(3LL, @"Restarted scanning with updated context");
        double v72 = (void *)objc_claimAutoreleasedReturnValue(v71);
        double v73 = _AXStringForArgs(v72);
        double v74 = (void *)objc_claimAutoreleasedReturnValue(v73);
        if (os_log_type_enabled(v69, v70))
        {
          *(_DWORD *)buf = 138543362;
          CGRect v107 = v74;
          _os_log_impl((void *)&_mh_execute_header, v69, v70, "%{public}@", buf, 0xCu);
        }
      }
    }

    [v8 beginScanningWithFocusContext:v45];
  }

  else
  {
    double v75 = [v8 isActive];
    double v76 = (void *)objc_claimAutoreleasedReturnValue(+[AXSubsystemSCElementNav sharedInstance](&OBJC_CLASS___AXSubsystemSCElementNav, "sharedInstance"));
    id v77 = [v76 ignoreLogging];

    if (v75 && v45)
    {
      if ((v77 & 1) == 0)
      {
        id v78 = (void *)objc_claimAutoreleasedReturnValue(+[AXSubsystemSCElementNav identifier](&OBJC_CLASS___AXSubsystemSCElementNav, "identifier"));
        __int128 v80 = AXLoggerForFacility(v78, v79);
        id v81 = (os_log_s *)objc_claimAutoreleasedReturnValue(v80);

        v82 = AXOSLogLevelFromAXLogLevel(3LL);
        if (os_log_type_enabled(v81, v82))
        {
          v83 = AXColorizeFormatLog(3LL, @"Scanning updated context immediately");
          uint64_t v84 = (void *)objc_claimAutoreleasedReturnValue(v83);
          v85 = _AXStringForArgs(v84);
          v86 = (void *)objc_claimAutoreleasedReturnValue(v85);
          if (os_log_type_enabled(v81, v82))
          {
            *(_DWORD *)buf = 138543362;
            CGRect v107 = v86;
            _os_log_impl((void *)&_mh_execute_header, v81, v82, "%{public}@", buf, 0xCu);
          }
        }
      }

      [v8 continueScanningWithFocusContext:v45 foundNewElements:v102];
    }

    else
    {
      if ((v77 & 1) == 0)
      {
        uint64_t v87 = (void *)objc_claimAutoreleasedReturnValue(+[AXSubsystemSCElementNav identifier](&OBJC_CLASS___AXSubsystemSCElementNav, "identifier"));
        id v89 = AXLoggerForFacility(v87, v88);
        id v90 = (os_log_s *)objc_claimAutoreleasedReturnValue(v89);

        v91 = AXOSLogLevelFromAXLogLevel(3LL);
        if (os_log_type_enabled(v90, v91))
        {
          id v92 = AXColorizeFormatLog(3LL, @"Will scan updated context on resume");
          id v93 = (void *)objc_claimAutoreleasedReturnValue(v92);
          id v94 = _AXStringForArgs(v93);
          id v95 = (void *)objc_claimAutoreleasedReturnValue(v94);
          if (os_log_type_enabled(v90, v91))
          {
            *(_DWORD *)buf = 138543362;
            CGRect v107 = v95;
            _os_log_impl((void *)&_mh_execute_header, v90, v91, "%{public}@", buf, 0xCu);
          }
        }
      }

      [v8 useFocusContextOnResume:v45];
    }
  }
}

void sub_100068894( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
}

void sub_1000688B0(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10006894C;
  v4[3] = &unk_100121EE8;
  objc_copyWeak(&v5, (id *)(a1 + 32));
  AXPerformBlockOnMainThread(v4);
  objc_destroyWeak(&v5);
}

void sub_100068938(_Unwind_Exception *a1)
{
}

void sub_10006894C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained) {
    WeakRetained[9] = 0LL;
  }
}

void sub_100068A8C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
}

id sub_100068AAC(uint64_t a1, void *a2)
{
  id v3 = a2;
  double v4 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained(v4);
  unsigned int v6 = [WeakRetained isRunning];

  if (v6)
  {
    id v7 = objc_loadWeakRetained(v4);
    id v8 = [v7 _handleAccessibilityEvent:v3];
  }

  else
  {
    id v8 = 0LL;
  }

  return v8;
}

id sub_100068DE0(uint64_t a1)
{
  return _[*(id *)(a1 + 32) accessibilityEventInputSource:*(void *)(a1 + 40) didReceiveActionWithIdentifier:*(void *)(a1 + 48) start:*(unsigned __int8 *)(a1 + 56) ignoreInputHold:*(unsigned __int8 *)(a1 + 57)];
}

void sub_100069130(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  double v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) name]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) name]);
  [v2 _handleAction:v3 longPressAction:0 start:1 switchIdentifier:v4 switchDisplayName:v5];

  unsigned int v6 = *(void **)(a1 + 32);
  uint64_t v7 = *(void *)(a1 + 40);
  id v9 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) name]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) name]);
  [v6 _handleAction:v7 longPressAction:0 start:0 switchIdentifier:v9 switchDisplayName:v8];
}

void sub_1000692C4(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  double v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) name]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) name]);
  [v2 _handleAction:v3 longPressAction:0 start:1 switchIdentifier:v4 switchDisplayName:v5];

  unsigned int v6 = *(void **)(a1 + 32);
  uint64_t v7 = *(void *)(a1 + 40);
  id v9 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) name]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) name]);
  [v6 _handleAction:v7 longPressAction:0 start:0 switchIdentifier:v9 switchDisplayName:v8];
}

void sub_100069478(uint64_t a1, void *a2)
{
  id v11 = a2;
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v11 source]);
  if ([v3 isEqualToString:SCATSwitchSourceAccessibility])
  {

    double v4 = v11;
  }

  else
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v11 source]);
    unsigned int v6 = [v5 isEqualToString:SCATSwitchSourceHandGestures];

    double v4 = v11;
    if (!v6) {
      goto LABEL_7;
    }
  }

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[SCATActionItem fromSwitch:longPress:](&OBJC_CLASS___SCATActionItem, "fromSwitch:longPress:", v4, 0LL));
  id v8 = *(void **)(a1 + 32);
  if (v8) {
    SCATGetActionIdentifiersForRecipeAndSwitch(v8, v11, v7, 0LL);
  }
  id v9 = *(void **)(a1 + 40);
  double v10 = (void *)objc_claimAutoreleasedReturnValue([v11 name]);
  [v9 setObject:v7 forKeyedSubscript:v10];

  double v4 = v11;
LABEL_7:
}

id sub_10006A010(uint64_t a1)
{
  return [*(id *)(a1 + 32) _notifyMenuObserversWithSelector:"menuDidAppear:"];
}

id sub_10006A348(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 frame];
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  double v12 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) screenPoint]);
  [v12 CGPointValue];
  v17.CGFloat x = v13;
  v17.CGFloat y = v14;
  v18.origin.CGFloat x = v5;
  v18.origin.CGFloat y = v7;
  v18.size.CGFloat width = v9;
  v18.size.CGFloat height = v11;
  else {
    id v15 = 0LL;
  }

  return v15;
}

BOOL sub_10006B15C(id a1, id a2, unint64_t a3, BOOL *a4)
{
  id v4 = a2;
  uint64_t v6 = objc_opt_class(&OBJC_CLASS___SCATModernMenuGesturesSheet, v5);
  char isKindOfClass = objc_opt_isKindOfClass(v4, v6);

  return isKindOfClass & 1;
}

LABEL_28:
}

id sub_10006B784(uint64_t a1)
{
  return [*(id *)(a1 + 32) setShouldSuppressAudioOutput:0];
}

id sub_10006B790(uint64_t a1)
{
  return [*(id *)(a1 + 32) setShouldSuppressAudioOutput:0];
}

void sub_10006E9DC(id a1, SCATMenu *a2)
{
  CGFloat v7 = a2;
  id v2 = (void *)objc_claimAutoreleasedReturnValue(-[SCATMenu element](v7, "element"));

  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[SCATScannerManager sharedManager](&OBJC_CLASS___SCATScannerManager, "sharedManager"));
  if (!v2)
  {
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[SCATMenu pointPicker](v7, "pointPicker"));
    [v6 pickedPoint];
    objc_msgSend(v3, "selectElementAtPoint:");
    goto LABEL_5;
  }

  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SCATMenu element](v7, "element"));
  unsigned __int8 v5 = [v3 activateElement:v4];

  if ((v5 & 1) == 0)
  {
    id v3 = (void *)objc_claimAutoreleasedReturnValue(+[SCATScannerManager sharedManager](&OBJC_CLASS___SCATScannerManager, "sharedManager"));
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[SCATMenu element](v7, "element"));
    [v3 selectElement:v6];
LABEL_5:
  }

  -[SCATMenu setDidActivateElement:](v7, "setDidActivateElement:", 1LL);
}

void sub_10006EAC4(id a1, SCATMenu *a2)
{
  id v2 = a2;
  id v3 = -[SCATModernMenuScrollSheet initWithMenu:]( objc_alloc(&OBJC_CLASS___SCATModernMenuScrollSheet),  "initWithMenu:",  v2);
  -[SCATMenu pushSheet:](v2, "pushSheet:", v3);
}

void sub_10006EB1C(id a1, SCATMenu *a2)
{
  id v3 = a2;
  if ((sub_10002ADF4() & 1) == 0)
  {
    id v2 = (void *)objc_claimAutoreleasedReturnValue(+[AXPISystemActionHelper sharedInstance](&OBJC_CLASS___AXPISystemActionHelper, "sharedInstance"));
    [v2 activateHomeButton];
  }

  -[SCATMenu didPressScreenChangingButton](v3, "didPressScreenChangingButton");
}

void sub_10006EB74(uint64_t a1)
{
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) _typingCandidates]);
  id v3 = (id)objc_claimAutoreleasedReturnValue([v1 lastObject]);

  if (v3)
  {
    id v2 = (void *)objc_claimAutoreleasedReturnValue(+[SCATScannerManager sharedManager](&OBJC_CLASS___SCATScannerManager, "sharedManager"));
    [v2 activateElement:v3];
  }
}

void sub_10006EBE0(uint64_t a1, void *a2)
{
  id v5 = a2;
  id v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) _typingCandidates]);
  if ([v3 count])
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue([v5 delegate]);
    [v4 menu:v5 showTypingCandidates:v3];
  }
}

void sub_10006EC4C(id a1, SCATMenu *a2)
{
  id v2 = a2;
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[SCATMenu delegate](v2, "delegate"));
  id v4 = (id)objc_claimAutoreleasedReturnValue([v3 gesturesSheetForMenu:v2]);

  -[SCATMenu pushSheet:](v2, "pushSheet:", v4);
}

void sub_10006ECA8(id a1, SCATMenu *a2)
{
  id v2 = a2;
  id v3 = objc_alloc(&OBJC_CLASS___SCATModernMenuSimpleSheet);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 switchControlDeviceMenuItems]);
  uint64_t v6 = -[SCATModernMenuSimpleSheet initWithMenu:menuItemDictionaryArray:]( v3,  "initWithMenu:menuItemDictionaryArray:",  v2,  v5);

  -[SCATMenu pushSheet:](v2, "pushSheet:", v6);
}

void sub_10006ED3C(id a1, SCATMenu *a2)
{
  id v2 = a2;
  id v3 = objc_alloc(&OBJC_CLASS___SCATModernMenuSimpleSheet);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 switchControlSettingsMenuItems]);
  uint64_t v6 = -[SCATModernMenuSimpleSheet initWithMenu:menuItemDictionaryArray:]( v3,  "initWithMenu:menuItemDictionaryArray:",  v2,  v5);

  -[SCATMenu pushSheet:](v2, "pushSheet:", v6);
}

void sub_10006EDD0(id a1, SCATMenu *a2)
{
  id v2 = a2;
  id v3 = objc_alloc(&OBJC_CLASS___SCATModernMenuSimpleSheet);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 switchControlMediaControlsMenuItems]);
  uint64_t v6 = -[SCATModernMenuSimpleSheet initWithMenu:menuItemDictionaryArray:]( v3,  "initWithMenu:menuItemDictionaryArray:",  v2,  v5);

  -[SCATMenu pushSheet:](v2, "pushSheet:", v6);
}

void sub_10006EE64(id a1, SCATMenu *a2)
{
  id v2 = a2;
  id v3 = -[SCATModernMenuSheet initWithMenu:](objc_alloc(&OBJC_CLASS___SCATMenuSiriShorcutsSheet), "initWithMenu:", v2);
  -[SCATMenu pushSheet:](v2, "pushSheet:", v3);
}

void sub_10006EEBC(id a1, SCATMenu *a2)
{
  id v2 = a2;
  id v3 = -[SCATModernMenuRecipesSheet initWithMenu:]( objc_alloc(&OBJC_CLASS___SCATModernMenuRecipesSheet),  "initWithMenu:",  v2);
  -[SCATMenu pushSheet:](v2, "pushSheet:", v3);
}

void sub_10006EF14(id a1, SCATMenu *a2)
{
}

void sub_10006EF1C(id a1, SCATMenu *a2)
{
}

void sub_10006EF24(id a1, SCATMenu *a2)
{
  id v2 = a2;
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[SCATMenu delegate](v2, "delegate"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[SCATMenu element](v2, "element"));
  [v4 menu:v2 showAlternateKeysForKey:v3];
}

void sub_10006EF84(id a1, SCATMenu *a2)
{
  id v2 = a2;
  id v3 = -[SCATModernMenuEditingSheet initWithMenu:]( objc_alloc(&OBJC_CLASS___SCATModernMenuEditingSheet),  "initWithMenu:",  v2);
  -[SCATMenu pushSheet:](v2, "pushSheet:", v3);
}

void sub_10006EFDC(id a1, SCATMenu *a2)
{
  id v5 = a2;
  id v2 = (void *)objc_claimAutoreleasedReturnValue(-[SCATMenu element](v5, "element"));
  unsigned int v3 = [v2 scatIsAXElement];

  if (v3)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SCATMenu element](v5, "element"));
    [v4 zoomIn];
  }
}

void sub_10006F03C(id a1, SCATMenu *a2)
{
  id v5 = a2;
  id v2 = (void *)objc_claimAutoreleasedReturnValue(-[SCATMenu element](v5, "element"));
  unsigned int v3 = [v2 scatIsAXElement];

  if (v3)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SCATMenu element](v5, "element"));
    [v4 zoomOut];
  }
}

id sub_10006F09C(uint64_t a1, uint64_t a2)
{
  return _[*(id *)(a1 + 32) _handlePerformEscapeWithMenu:a2];
}

void sub_10006F0A8(id a1, SCATMenu *a2)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(-[SCATMenu keyboardApplication](a2, "keyboardApplication"));
  [v2 scatPerformAction:2049];
}

void sub_10006F0DC(id a1, SCATMenu *a2)
{
  id v2 = a2;
  -[SCATMenu setShouldNotResetPointPickerRefinement:](v2, "setShouldNotResetPointPickerRefinement:", 1LL);
  id v3 = (id)objc_claimAutoreleasedReturnValue(-[SCATMenu pointPicker](v2, "pointPicker"));

  [v3 refineSelectedPoint];
}

id sub_10006F12C(uint64_t a1)
{
  return _[*(id *)(a1 + 32) toggleNavigationMode];
}

void sub_10006F134(id a1, SCATMenu *a2)
{
  id v2 = a2;
  id v3 = (id)objc_claimAutoreleasedReturnValue(-[SCATMenu delegate](v2, "delegate"));
  [v3 menu:v2 setItemMenuState:1];
}

void sub_10006F17C(id a1, SCATMenu *a2)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(+[AXElement systemWideElement](&OBJC_CLASS___AXElement, "systemWideElement"));
  [v2 systemPressTVMenuButton];
}

void sub_10006F1B0(id a1, SCATMenu *a2)
{
  id v2 = a2;
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[SCATMenu delegate](v2, "delegate"));
  BOOL v4 = [v3 itemMenuStateForMenu:v2] != (id)2;

  id v5 = (id)objc_claimAutoreleasedReturnValue(-[SCATMenu delegate](v2, "delegate"));
  [v5 menu:v2 setItemMenuState:2 * v4];
}

void sub_10006F228(uint64_t a1, void *a2)
{
  id v4 = (id)objc_claimAutoreleasedReturnValue([a2 element]);
  id v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "substringFromIndex:", objc_msgSend(@"customAction_", "length")));
  [v4 scatPerformAction:2021 withValue:v3];
}

BOOL sub_10006F348(id a1, SCATModernMenuItem *a2)
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10006F3BC;
  v4[3] = &unk_100121D18;
  id v5 = a2;
  id v2 = v5;
  AXPerformBlockAsynchronouslyOnMainThread(v4);

  return 1;
}

void sub_10006F3BC(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) delegate]);
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 menu]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 keyboardApplication]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 uiElement]);
  id v6 = [v5 BOOLWithAXAttribute:3010];

  if ((_DWORD)v6)
  {
    CGFloat v7 = (void *)objc_claimAutoreleasedReturnValue(+[SCATScannerManager sharedManager](&OBJC_CLASS___SCATScannerManager, "sharedManager"));
    double v8 = (void *)objc_claimAutoreleasedReturnValue([v7 activeScannerDriver]);
    [v8 freezeScanning];

    CGFloat v9 = @"STOP_DICTATION";
  }

  else
  {
    CGFloat v9 = @"START_DICTATION";
  }

  id v10 = sub_10002B014(v9);
  CGFloat v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  [*(id *)(a1 + 32) setTitle:v11];

  [*(id *)(a1 + 32) setAllowsDwellScanningToAbortAfterTimeout:v6];
  id v14 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) delegate]);
  double v12 = (void *)objc_claimAutoreleasedReturnValue([v14 menu]);
  CGFloat v13 = (void *)objc_claimAutoreleasedReturnValue([v12 menuVisualProvider]);
  [v13 updateModernMenuItem:*(void *)(a1 + 32)];
}

uint64_t sub_10006F4E8(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v7 = 0LL;
  id v8 = 0LL;
  id v3 = a2;
  [v2 _title:&v8 imageForNavigationItem:&v7];
  id v4 = v8;
  id v5 = v7;
  [v3 setTitle:v4];
  [v3 setImageName:v5];

  return 1LL;
}

BOOL sub_10006F570(id a1, SCATModernMenuItem *a2)
{
  return 0;
}

BOOL sub_10006F73C(id a1, AXElement *a2)
{
  return -[AXElement canPerformEscape](a2, "canPerformEscape");
}

void HNDTestingSetLastFiredAction(id obj)
{
}

void sub_1000707B0(uint64_t a1)
{
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue(+[SCATScannerManager sharedManager](&OBJC_CLASS___SCATScannerManager, "sharedManager"));
  unsigned int v2 = [v1 isUsingPointMode];

  if (v2)
  {
    id v3 = (id)objc_claimAutoreleasedReturnValue(+[SCATScannerManager sharedManager](&OBJC_CLASS___SCATScannerManager, "sharedManager"));
    [v3 beginScanningWithFocusContext:0];
  }

void sub_100071FC8(id a1)
{
  id v1 = (id)objc_claimAutoreleasedReturnValue(+[AXElement systemWideElement](&OBJC_CLASS___AXElement, "systemWideElement"));
  [v1 systemPressTVUpButton];
}

void sub_100071FFC(id a1)
{
  id v1 = (id)objc_claimAutoreleasedReturnValue(+[AXElement systemWideElement](&OBJC_CLASS___AXElement, "systemWideElement"));
  [v1 systemPressTVDownButton];
}

void sub_100072030(id a1)
{
  id v1 = (id)objc_claimAutoreleasedReturnValue(+[AXElement systemWideElement](&OBJC_CLASS___AXElement, "systemWideElement"));
  [v1 systemPressTVLeftButton];
}

void sub_100072064(id a1)
{
  id v1 = (id)objc_claimAutoreleasedReturnValue(+[AXElement systemWideElement](&OBJC_CLASS___AXElement, "systemWideElement"));
  [v1 systemPressTVRightButton];
}

uint64_t sub_1000729CC(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  id v6 = v4;
  uint64_t v8 = (uint64_t)[v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0LL; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        CGFloat v11 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        objc_opt_class(&OBJC_CLASS___UIView, v7);
        if ((objc_opt_isKindOfClass(v11, v12) & 1) != 0
          && (objc_msgSend(v11, "isDescendantOfView:", v5, (void)v14) & 1) != 0)
        {
          uint64_t v8 = 1LL;
          goto LABEL_12;
        }
      }

      uint64_t v8 = (uint64_t)[v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }

void sub_1000745B8(id a1)
{
  uint64_t v1 = objc_claimAutoreleasedReturnValue( +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  AXSSwitchControlMenuItemElementSpecificActions,  AXSSwitchControlMenuItemATVRemoteMenu,  0LL));
  unsigned int v2 = (void *)qword_100157708;
  qword_100157708 = v1;
}

BOOL sub_100074658(id a1, AXElement *a2)
{
  return -[AXElement canPerformEscape](a2, "canPerformEscape");
}

LABEL_33:
  double v36 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuScrollSheet scrollableElement](self, "scrollableElement"));
  if ([v36 scatSupportsAction:2030])
  {
  }

  else
  {
    double v37 = (void *)objc_claimAutoreleasedReturnValue( -[SCATModernMenuScrollSheet _fallbackAncestorForScrollToTop]( self,  "_fallbackAncestorForScrollToTop"));
    double v38 = [v37 scatSupportsAction:2030];

    if (!v38) {
      goto LABEL_37;
    }
  }

  double v39 = (void *)objc_claimAutoreleasedReturnValue( +[SCATModernMenuScrollFactory menuItemForScrollAction:withDelegate:]( &OBJC_CLASS___SCATModernMenuScrollFactory,  "menuItemForScrollAction:withDelegate:",  2030LL,  self));
  [v3 addObject:v39];

LABEL_37:
  if (v9)
  {
    __int128 v17 = (void *)objc_claimAutoreleasedReturnValue( +[SCATModernMenuScrollFactory menuItemForScrollAction:withDelegate:]( &OBJC_CLASS___SCATModernMenuScrollFactory,  "menuItemForScrollAction:withDelegate:",  2031LL,  self));
    [v3 addObject:v17];
    goto LABEL_39;
  }

  return v3;
}

void sub_1000777C0(id a1, SCATMenu *a2)
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(+[SCATScannerManager sharedManager](&OBJC_CLASS___SCATScannerManager, "sharedManager"));
  unsigned int v2 = (void *)objc_claimAutoreleasedReturnValue([v3 gestureProvider]);
  [v2 performTap];
}

void sub_10007780C(id a1, SCATMenu *a2)
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(+[SCATScannerManager sharedManager](&OBJC_CLASS___SCATScannerManager, "sharedManager"));
  unsigned int v2 = (void *)objc_claimAutoreleasedReturnValue([v3 gestureProvider]);
  [v2 performTapAndHold];
}

void sub_100077858(id a1, SCATMenu *a2)
{
  unsigned int v2 = a2;
  id v5 = (id)objc_claimAutoreleasedReturnValue(+[SCATScannerManager sharedManager](&OBJC_CLASS___SCATScannerManager, "sharedManager"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v5 gestureProvider]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SCATMenu gestureSheet](v2, "gestureSheet"));

  [v3 didChooseFlickGesture:v4];
}

void sub_1000778D8(id a1, SCATMenu *a2)
{
  unsigned int v2 = a2;
  id v5 = (id)objc_claimAutoreleasedReturnValue(+[SCATScannerManager sharedManager](&OBJC_CLASS___SCATScannerManager, "sharedManager"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v5 gestureProvider]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SCATMenu gestureSheet](v2, "gestureSheet"));

  [v3 didChoosePanGesture:v4];
}

void sub_100077958(id a1, SCATMenu *a2)
{
  unsigned int v2 = a2;
  id v5 = (id)objc_claimAutoreleasedReturnValue(+[SCATScannerManager sharedManager](&OBJC_CLASS___SCATScannerManager, "sharedManager"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v5 gestureProvider]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SCATMenu gestureSheet](v2, "gestureSheet"));

  [v3 didChoosePinchGesture:v4];
}

void sub_1000779D8(id a1, SCATMenu *a2)
{
  unsigned int v2 = a2;
  id v5 = (id)objc_claimAutoreleasedReturnValue(+[SCATScannerManager sharedManager](&OBJC_CLASS___SCATScannerManager, "sharedManager"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v5 gestureProvider]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SCATMenu gestureSheet](v2, "gestureSheet"));

  [v3 didChooseDragGesture:v4];
}

void sub_100077A58(id a1, SCATMenu *a2)
{
  unsigned int v2 = a2;
  id v5 = (id)objc_claimAutoreleasedReturnValue(+[SCATScannerManager sharedManager](&OBJC_CLASS___SCATScannerManager, "sharedManager"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v5 gestureProvider]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SCATMenu gestureSheet](v2, "gestureSheet"));

  [v3 didChooseFingers:v4];
}

void sub_100077AD8(id a1, SCATMenu *a2)
{
  unsigned int v2 = a2;
  id v5 = (id)objc_claimAutoreleasedReturnValue(+[SCATScannerManager sharedManager](&OBJC_CLASS___SCATScannerManager, "sharedManager"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v5 gestureProvider]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SCATMenu gestureSheet](v2, "gestureSheet"));

  [v3 didChooseDoubleTapGesture:v4];
}

void sub_100077B58(id a1, SCATMenu *a2)
{
  unsigned int v2 = a2;
  id v5 = (id)objc_claimAutoreleasedReturnValue(+[SCATScannerManager sharedManager](&OBJC_CLASS___SCATScannerManager, "sharedManager"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v5 gestureProvider]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SCATMenu gestureSheet](v2, "gestureSheet"));

  [v3 didChooseHoldAndDragGesture:v4];
}

void sub_100077BD8(id a1, SCATMenu *a2)
{
  unsigned int v2 = a2;
  id v5 = (id)objc_claimAutoreleasedReturnValue(+[SCATScannerManager sharedManager](&OBJC_CLASS___SCATScannerManager, "sharedManager"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v5 gestureProvider]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SCATMenu gestureSheet](v2, "gestureSheet"));

  [v3 didChooseFavorites:v4];
}

void sub_100077C58(id a1, SCATMenu *a2)
{
  unsigned int v2 = a2;
  id v5 = (id)objc_claimAutoreleasedReturnValue(+[SCATScannerManager sharedManager](&OBJC_CLASS___SCATScannerManager, "sharedManager"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v5 gestureProvider]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SCATMenu gestureSheet](v2, "gestureSheet"));

  [v3 didChooseDrawingGesture:v4];
}

void sub_100077CD8(id a1, SCATMenu *a2)
{
  unsigned int v2 = a2;
  id v5 = (id)objc_claimAutoreleasedReturnValue(+[SCATScannerManager sharedManager](&OBJC_CLASS___SCATScannerManager, "sharedManager"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v5 gestureProvider]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SCATMenu gestureSheet](v2, "gestureSheet"));

  [v3 didChooseForceTouchGesture:v4];
}

uint64_t sub_100077DD8(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[SCATScannerManager sharedManager](&OBJC_CLASS___SCATScannerManager, "sharedManager"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 gestureProvider]);
  id v6 = [v5 numberOfFingers];

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) _fingerItemStringForNumberOfFingers:v6]);
  [v3 setTitle:v7];

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) _imageNameForNumberOfFingers:v6]);
  [v3 setImageName:v8];

  return 1LL;
}

BOOL sub_100077E90(id a1, SCATModernMenuItem *a2)
{
  return 0;
}

void sub_1000788A4(uint64_t a1, void *a2)
{
  id v9 = a2;
  id v3 = objc_opt_new(&OBJC_CLASS___SCATActionItem);
  id v4 = objc_opt_new(&OBJC_CLASS___SCATActionItem);
  SCATGetActionIdentifiersForRecipeAndSwitch(*(void **)(a1 + 32), v9, v3, v4);
  id v5 = *(void **)(a1 + 40);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v9 uuid]);
  [v5 setObject:v3 forKeyedSubscript:v6];

  if (-[SCATActionItem action](v4, "action"))
  {
    uint64_t v7 = *(void **)(a1 + 48);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v9 uuid]);
    [v7 setObject:v4 forKeyedSubscript:v8];
  }
}

id sub_100078F40(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 remoteSwitchIdentifier]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) switchIdentifier]);
  if ([v4 isEqualToString:v5])
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v3 remoteDeviceIdentifier]);
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) deviceIdentifier]);
    id v8 = [v6 isEqualToString:v7];
  }

  else
  {
    id v8 = 0LL;
  }

  return v8;
}

id sub_1000793FC(uint64_t a1)
{
  return _[*(id *)(a1 + 32) interDeviceInputSource:*(void *)(a1 + 40) didReceiveActionWithIdentifier:*(void *)(a1 + 48) start:*(unsigned __int8 *)(a1 + 56) ignoreInputHold:*(unsigned __int8 *)(a1 + 57)];
}

void sub_10007C63C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
}

void sub_10007C658(uint64_t a1)
{
  unsigned int v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained scrollDelegate]);
  id v5 = objc_loadWeakRetained(v2);
  uint64_t v6 = [v4 scrollViewController:v5 showVerticalScrollerForContextElement:*(void *)(a1 + 32)] ^ 1;
  id v7 = objc_loadWeakRetained(v2);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 verticalScroller]);
  [v8 setHidden:v6];

  id v14 = objc_loadWeakRetained(v2);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v14 scrollDelegate]);
  id v10 = objc_loadWeakRetained(v2);
  uint64_t v11 = [v9 scrollViewController:v10 showHorizontalScrollerForContextElement:*(void *)(a1 + 32)] ^ 1;
  id v12 = objc_loadWeakRetained(v2);
  CGFloat v13 = (void *)objc_claimAutoreleasedReturnValue([v12 horizontalScroller]);
  [v13 setHidden:v11];
}

void sub_10007F188(uint64_t a1)
{
  if ([*(id *)(a1 + 32) shouldUpdateItemsOnOrientationChange])
  {
    [*(id *)(a1 + 32) reload];
    unsigned int v2 = *(void **)(a1 + 32);
    id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 menu]);
    id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 currentSheet]);

    if (v2 == v4)
    {
      id v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) menu]);
      [v5 reloadFromCurrentSheet];

      id v6 = (id)objc_claimAutoreleasedReturnValue(+[SCATScannerManager sharedManager](&OBJC_CLASS___SCATScannerManager, "sharedManager"));
      [v6 beginScanningWithFocusContext:0];
    }
  }

void sub_100080A24(id a1, SCATMenu *a2)
{
}

void sub_100080A30(id a1, SCATMenu *a2)
{
}

void sub_100080A3C(id a1, SCATMenu *a2)
{
}

void sub_100080A48(id a1, SCATMenu *a2)
{
}

void sub_100080A54(id a1, SCATMenu *a2)
{
}

void sub_100080A60(id a1, SCATMenu *a2)
{
}

void sub_100080A6C(id a1, SCATMenu *a2)
{
}

void sub_100080A78(id a1, SCATMenu *a2)
{
}

void sub_100080A84(id a1, SCATMenu *a2)
{
}

void sub_1000836AC(id a1)
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue(+[NSOperationQueue mainQueue](&OBJC_CLASS___NSOperationQueue, "mainQueue"));
  id v2 =  [v3 addObserverForName:UIContentSizeCategoryDidChangeNotification object:0 queue:v1 usingBlock:&stru_100124548];
}

void sub_10008372C(id a1, NSNotification *a2)
{
}

void sub_100083778(id a1)
{
  uint64_t v1 = -[SCATMenuItemCell initWithFrame:]( objc_alloc(&OBJC_CLASS___SCATMenuItemCell),  "initWithFrame:",  CGRectZero.origin.x,  CGRectZero.origin.y,  CGRectZero.size.width,  CGRectZero.size.height);
  id v2 = (void *)qword_100157730;
  qword_100157730 = (uint64_t)v1;

  id v5 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSOperationQueue mainQueue](&OBJC_CLASS___NSOperationQueue, "mainQueue"));
  id v4 =  [v5 addObserverForName:UIContentSizeCategoryDidChangeNotification object:0 queue:v3 usingBlock:&stru_100124588];
}

void sub_100083828(id a1, NSNotification *a2)
{
  id v2 = -[SCATMenuItemCell initWithFrame:]( objc_alloc(&OBJC_CLASS___SCATMenuItemCell),  "initWithFrame:",  CGRectZero.origin.x,  CGRectZero.origin.y,  CGRectZero.size.width,  CGRectZero.size.height);
  id v3 = (void *)qword_100157730;
  qword_100157730 = (uint64_t)v2;
}

void sub_100085A10(_Unwind_Exception *a1)
{
}

void sub_100085A34(uint64_t a1)
{
  uint64_t v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _setBorderDimmed:1 focused:0 hidden:1];

  id v3 = objc_loadWeakRetained(v1);
  [v3 _setIconDimmed:1 asDimAsBorder:1 focused:0];

  id v5 = objc_loadWeakRetained(v1);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v5 pressedBackgroundBorderImageView]);
  [v4 setAlpha:1.0];
}

void sub_100085AC0(uint64_t a1)
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_100085BB0;
  v4[3] = &unk_100121EE8;
  uint64_t v1 = (id *)(a1 + 32);
  objc_copyWeak(&v5, (id *)(a1 + 32));
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472LL;
  v2[2] = sub_100085C10;
  v2[3] = &unk_1001245B0;
  objc_copyWeak(&v3, v1);
  +[UIView animateWithDuration:animations:completion:]( &OBJC_CLASS___UIView,  "animateWithDuration:animations:completion:",  v4,  v2,  0.1);
  objc_destroyWeak(&v3);
  objc_destroyWeak(&v5);
}

void sub_100085B94(_Unwind_Exception *a1)
{
}

void sub_100085BB0(uint64_t a1)
{
  uint64_t v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained didUpdateScatMenuItemStyle];

  id v4 = objc_loadWeakRetained(v1);
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v4 pressedBackgroundBorderImageView]);
  [v3 setAlpha:0.0];
}

void sub_100085C10(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setIsFlashing:0];
}

CGPath *sub_100087F28( CGFloat a1, CGFloat a2, double a3, double a4, CGFloat a5, CGFloat a6, CGFloat a7, CGFloat a8, CGFloat a9)
{
  v27.origin.CGFloat x = a5;
  v27.origin.CGFloat y = a6;
  v27.size.CGFloat width = a7;
  v27.size.CGFloat height = a8;
  if (NSIsEmptyRect(v27)) {
    return sub_1000880C8(a1, a2, a3, a4, a9);
  }
  Mutable = CGPathCreateMutable();
  CGPathMoveToPoint(Mutable, 0LL, a5 + a9, a6);
  CGPathAddArcToPoint(Mutable, 0LL, a5 + a7, a6, a5 + a7, a6 + a9, a9);
  CGPathAddArcToPoint(Mutable, 0LL, a1 + a3, a2 + a4, a1 + a3 - a9, a2 + a4, a9);
  CGPathAddArcToPoint(Mutable, 0LL, a1, a2 + a4, a1, a2 + a4 - a9, a9);
  CGPathAddArcToPoint(Mutable, 0LL, a1, a2, a1 + a9, a2, a9);
  CGPathAddArcToPoint(Mutable, 0LL, a5, a6 + a8, a5, a6 + a8 - a9, a9);
  CGPathAddArcToPoint(Mutable, 0LL, a5, a6, a5 + a9, a6, a9);
  CGPathCloseSubpath(Mutable);
  return Mutable;
}

CGPath *sub_1000880C8(CGFloat a1, CGFloat a2, double a3, double a4, CGFloat a5)
{
  Mutable = CGPathCreateMutable();
  CGPathMoveToPoint(Mutable, 0LL, a1 + a5, a2);
  CGFloat v11 = a1 + a3;
  CGPathAddArcToPoint(Mutable, 0LL, v11, a2, v11, a2 + a5, a5);
  CGFloat v12 = a2 + a4;
  CGPathAddArcToPoint(Mutable, 0LL, v11, v12, v11 - a5, v12, a5);
  CGPathAddArcToPoint(Mutable, 0LL, a1, v12, a1, v12 - a5, a5);
  CGPathAddArcToPoint(Mutable, 0LL, a1, a2, a1 + a5, a2, a5);
  CGPathCloseSubpath(Mutable);
  return Mutable;
}

CGContext *sub_1000881BC(CGFloat a1, CGFloat a2, CGFloat a3)
{
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  if (!DeviceRGB) {
    return 0LL;
  }
  id v7 = DeviceRGB;
  id v8 = CGBitmapContextCreate( 0LL,  (unint64_t)(a1 * a3),  (unint64_t)(a2 * a3),  8uLL,  (int)(4 * (unint64_t)(a1 * a3)),  DeviceRGB,  1u);
  CGColorSpaceRelease(v7);
  if (v8)
  {
    CGFloat y = CGRectZero.origin.y;
    CGAffineTransformMakeScale(&v11, a3, a3);
    CGContextSetCTM(v8, &v11);
    v12.origin.CGFloat x = CGRectZero.origin.x;
    v12.origin.CGFloat y = y;
    v12.size.CGFloat width = a1;
    v12.size.CGFloat height = a2;
    CGRect v13 = CGRectInset(v12, -1.0, -1.0);
    CGContextClearRect(v8, v13);
  }

  return v8;
}

void sub_1000882A0( CGContext *a1, CGColor *a2, CGColor *a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7, CGFloat a8, CGFloat a9, CGFloat a10, CGFloat a11, double a12, CGFloat a13, double a14)
{
  CGColorSpaceRef DeviceRGB = CGColorSpaceCreateDeviceRGB();
  double v28 = a14 * 0.5;
  id v29 = objc_claimAutoreleasedReturnValue( +[UIColor colorWithWhite:alpha:]( &OBJC_CLASS___UIColor, "colorWithWhite:alpha:", 0.0, 0.2));
  __double2 v30 = CGColorRetain((CGColorRef)[v29 CGColor]);

  v50.origin.CGFloat x = a4;
  CGFloat v31 = a10;
  v50.size.double height = a7;
  CGFloat v32 = a11;
  v50.origin.double y = a5;
  v50.size.CGFloat width = a6;
  CGRect v51 = CGRectInset(v50, v28, v28);
  double y = v51.origin.y;
  double height = v51.size.height;
  double v44 = v51.origin.x + 0.0;
  CGFloat width = v51.size.width;
  v51.origin.CGFloat x = a8;
  v51.origin.double y = a9;
  v51.size.CGFloat width = v31;
  v51.size.double height = a11;
  if (CGRectIsEmpty(v51))
  {
    CGFloat x = a8;
    CGFloat v43 = v31;
  }

  else
  {
    v52.origin.CGFloat x = a8;
    v52.origin.double y = a9;
    v52.size.CGFloat width = v31;
    v52.size.double height = a11;
    CGRect v53 = CGRectInset(v52, v28, v28);
    CGFloat x = v53.origin.x;
    CGFloat v43 = v53.size.width;
    a9 = v53.origin.y;
    CGFloat v32 = v53.size.height;
    double y = y + v53.size.height;
    double height = height - v53.size.height;
  }

  v54.origin.CGFloat x = v44;
  double v35 = width;
  v54.origin.double y = y;
  v54.size.CGFloat width = width;
  v54.size.double height = height;
  CGRect v55 = CGRectInset(v54, 1.0 / a12 * 0.5 + v28, 1.0 / a12 * 0.5 + v28);
  if (a1)
  {
    double v47 = v55.size.height;
    CGFloat v36 = v55.origin.x;
    CGFloat v37 = v55.origin.y;
    double v38 = v55.size.width;
    double v39 = sub_100087F28(v44, y, v35, height, x, a9, v43, v32, a13);
    double v40 = a13 * 0.5;
    if (a13 >= 4.0) {
      double v40 = a13;
    }
    double v41 = sub_100087F28(v36, v37, v38, v47, x, a9, v43, v32, v40);
    CGContextSetFillColorWithColor(a1, a2);
    CGContextAddPath(a1, v39);
    CGContextFillPath(a1);
    CGContextSetStrokeColorWithColor(a1, a3);
    CGContextAddPath(a1, v39);
    CGContextSetLineWidth(a1, a14);
    CGContextStrokePath(a1);
    CGContextSetStrokeColorWithColor(a1, v30);
    CGContextAddPath(a1, v41);
    CGContextSetLineWidth(a1, 1.0 / a12);
    CGContextStrokePath(a1);
    if (v41) {
      CFRelease(v41);
    }
    if (v39) {
      CFRelease(v39);
    }
  }

  if (v30) {
    CFRelease(v30);
  }
  if (DeviceRGB) {
    CFRelease(DeviceRGB);
  }
}

CGContext *sub_10008858C( CGColor *a1, CGColor *a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7, CGFloat a8, CGFloat a9, CGFloat a10, CGFloat a11, CGFloat a12, double a13)
{
  id result = sub_1000881BC(a5, a6, a11);
  if (result)
  {
    id v29 = result;
    sub_1000882A0(result, a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13);
    CGImageRef Image = CGBitmapContextCreateImage(v29);
    CFRelease(v29);
    return Image;
  }

  return result;
}

void sub_1000886B0(id a1)
{
  uint64_t v1 = objc_alloc_init(&OBJC_CLASS___SCATStyleProvider);
  id v2 = (void *)qword_100157740;
  qword_100157740 = (uint64_t)v1;
}

uint64_t sub_100089294(uint64_t a1, uint64_t a2)
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_10008AC3C;
  v3[3] = &unk_1001246D8;
  v3[4] = a2;
  return AXPerformBlockAsynchronouslyOnMainThread(v3);
}

uint64_t sub_1000892E4(int a1, void *a2, CFTypeRef cf1)
{
  if (CFEqual(cf1, @"com.apple.language.changed")) {
    return (uint64_t)[a2 performSelector:"_languageChanged:" withObject:0 afterDelay:2.0];
  }
  uint64_t result = CFEqual(cf1, @"com.apple.purplebuddy.LanguageResetReady");
  if ((_DWORD)result) {
    return (uint64_t)[a2 performSelector:"_languageChanged:" withObject:0 afterDelay:2.0];
  }
  return result;
}

void sub_100089958( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, id location)
{
}

void sub_10008997C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _assistAppValidationMode];
}

id sub_1000899A8(uint64_t a1)
{
  uint64_t v2 = ASTLogCommon(a1);
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "Reached timeout for waiting for IDS message. Will stop if no activity is in progress.",  v5,  2u);
  }

  return [*(id *)(a1 + 32) stopIfAllowed];
}

uint64_t sub_100089A18()
{
  uint64_t result = AXInPreboardScenario();
  if ((result & 1) == 0)
  {
    uint64_t v1 = ASTLogCommon();
    uint64_t v2 = (os_log_s *)objc_claimAutoreleasedReturnValue(v1);
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v3 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_DEFAULT,  "No longer in PreBoard scenario.  Killing ourselves so we can relaunch with a proper SpringBoard server.",  v3,  2u);
    }

    exit(0);
  }

  return result;
}

id sub_100089B60(uint64_t a1, void *a2, const void *a3)
{
  uint64_t v5 = ASTLogCommon(a1);
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v8 = 138412290;
    id v9 = a3;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_INFO,  "Handling preferenced change: %@",  (uint8_t *)&v8,  0xCu);
  }

  if (CFEqual(a3, kAXSAssistiveTouchEnabledNotification)) {
    return [a2 _assistiveTouchEnabledChange];
  }
  if (CFEqual(a3, kAXSAssistiveTouchScannerEnabledNotification)) {
    return [a2 _scannerEnabledChange];
  }
  id result = (id)CFEqual(a3, kAXSAssistiveTouchSettingsChangedNotification);
  if ((_DWORD)result) {
    return [a2 _assistiveTouchSettingsChanged];
  }
  return result;
}

void sub_100089EF0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = _AXSAssistiveTouchEnabled(a1, a2);
  if ((_DWORD)v3 || (uint64_t v3 = _AXSAssistiveTouchScannerEnabled(v3, v4), (_DWORD)v3))
  {
    uint64_t v5 = ASTLogCommon(v3);
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v9 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Not stopping, because either AssistiveTouch or Switch Control was enabled.",  v9,  2u);
    }
  }

  else
  {
    uint64_t v7 = ASTLogCommon(v3);
    int v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "AssistiveTouch and Switch Control were both disabled. Stopping.",  buf,  2u);
    }

    [*(id *)(a1 + 32) stop];
  }

void sub_10008A094(uint64_t a1, void *a2)
{
  uint64_t v2 = *(const char **)(a1 + 32);
  id v3 = a2;
  uint64_t v4 = NSStringFromSelector(v2);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  [v3 setVisualsHidden:1 forReason:v5 animated:1];

  id v7 = (id)objc_claimAutoreleasedReturnValue(+[HNDHandManager sharedManager](&OBJC_CLASS___HNDHandManager, "sharedManager"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v3 hardwareIdentifier]);

  objc_msgSend(v7, "removeFingersToPoint:onDisplay:", v6, CGPointZero.x, CGPointZero.y);
}

void sub_10008A1C0(id a1, HNDDisplayManager *a2)
{
}

void sub_10008A1D0(id a1)
{
}

void sub_10008A1F4(id a1)
{
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue(+[SCATScannerManager sharedManager](&OBJC_CLASS___SCATScannerManager, "sharedManager"));
  [v1 loadScanner];

  id v2 = (id)objc_claimAutoreleasedReturnValue(+[SCATScannerManager sharedManager](&OBJC_CLASS___SCATScannerManager, "sharedManager"));
  [v2 beginScanningWithFocusContext:0];
}

void sub_10008A24C(id a1)
{
  id v1 = (id)objc_claimAutoreleasedReturnValue(+[SCATScannerManager sharedManager](&OBJC_CLASS___SCATScannerManager, "sharedManager"));
  [v1 unloadScanner];
}

void sub_10008A444(uint64_t a1)
{
  uint64_t v2 = ASTLogCommon(a1);
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "Received reset notification from event manager.",  v5,  2u);
  }

  [*(id *)(a1 + 32) setShouldStop:1];
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) delegate]);
  [v4 stop];
}

void sub_10008AB98()
{
}

BOOL sub_10008ABAC(id a1, NSURL *a2, NSError *a3)
{
  return 1;
}

id sub_10008AC3C(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[HNDHandManager sharedManager](&OBJC_CLASS___HNDHandManager, "sharedManager"));
  [v2 systemServerConnected];

  return _[*(id *)(a1 + 32) setSystemAppReady:1];
}

void sub_10008B728(id a1)
{
  uint64_t v1 = MGCopyAnswer(@"SerialNumber", 0LL);
  uint64_t v2 = objc_claimAutoreleasedReturnValue(v1);
  id v3 = (void *)qword_100157750;
  qword_100157750 = v2;

  if (![(id)qword_100157750 length]) {
    *(void *)&double v4 = _AXAssert( 0LL,  "/Library/Caches/com.apple.xbs/Sources/AssistiveTouch/Source/Scanner/SCATInputSource.m",  354LL,  "-[SCATInputSource _switchEventWithAction:longPressAction:start:switchIdentifier:switchDisplayName:]_block_invoke",  @"Could not get serial number for device").n128_u64[0];
  }
  if (!objc_msgSend((id)qword_100157750, "length", v4))
  {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 UUIDString]);
    id v7 = [v6 copy];
    int v8 = (void *)qword_100157750;
    qword_100157750 = (uint64_t)v7;

    uint64_t v11 = AXSSLogForCategory(1LL, v9, v10);
    CGRect v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_1000AFA30(v12);
    }
  }

void sub_10008BC30( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, id location)
{
}

void sub_10008BC60(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _didReceiveActionWithIdentifier:*(void *)(a1 + 32) start:1 ignoreInputHold:1];
}

void sub_10008BCA4(uint64_t a1)
{
  uint64_t v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained setFallbackActionBlock:0];

  id v4 = objc_loadWeakRetained(v2);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 delegate]);
  id v6 = objc_loadWeakRetained(v2);
  [v5 didEndLongPressForInputSource:v6];

  id v7 = objc_loadWeakRetained(v2);
  [v7 _didReceiveActionWithIdentifier:*(void *)(a1 + 32) start:1 ignoreInputHold:1];
}

void SCATGetActionIdentifiersForRecipeAndSwitch(void *a1, void *a2, void *a3, void *a4)
{
  id v24 = a1;
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = v24;
  if (!v24)
  {
    _AXAssert( 0LL,  "/Library/Caches/com.apple.xbs/Sources/AssistiveTouch/Source/Scanner/SCATInputSource.m",  498LL,  "void SCATGetActionIdentifiersForRecipeAndSwitch(AXSwitchRecipe *__strong, AXSwitch *__strong, SCATActionItem *__st rong, SCATActionItem *__strong)",  @"Should not have called this function without a recipe.");
    uint64_t v10 = 0LL;
  }

  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 mappings]);
  CGRect v12 = (char *)[v11 count];

  if (!v12)
  {
LABEL_7:
    _AXAssert( 0LL,  "/Library/Caches/com.apple.xbs/Sources/AssistiveTouch/Source/Scanner/SCATInputSource.m",  519LL,  "void SCATGetActionIdentifiersForRecipeAndSwitch(AXSwitchRecipe *__strong, AXSwitch *__strong, SCATActionItem *__st rong, SCATActionItem *__strong)",  @"Should not have been able to look for a mapping for a switch that did not have a mapping. By this point, we should have collected a list of all the switches in use, and ignored any switches not included in the recipe.");
    uint64_t v20 = 0LL;
    double v21 = 0LL;
    if (!v8) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }

  CGRect v13 = 0LL;
  uint64_t v14 = 2LL;
  while (1)
  {
    __int128 v15 = (void *)objc_claimAutoreleasedReturnValue([v24 mappings]);
    __int128 v16 = (void *)objc_claimAutoreleasedReturnValue([v15 objectAtIndexedSubscript:v13]);

    __int128 v17 = (void *)objc_claimAutoreleasedReturnValue([v16 switchUUID]);
    CGRect v18 = (void *)objc_claimAutoreleasedReturnValue([v7 uuid]);
    unsigned int v19 = [v17 isEqual:v18];

    if (v19) {
      break;
    }

    ++v13;
    v14 += 2LL;
    if (v12 == v13) {
      goto LABEL_7;
    }
  }

  uint64_t v20 = v14 - 1;
  double v21 = (void *)objc_claimAutoreleasedReturnValue([v16 longPressAction]);
  if (v21)
  {
    double v22 = (void *)objc_claimAutoreleasedReturnValue([v16 action]);
    int v23 = AXSwitchRecipeMappingActionAllowsLongPress();

    if (v23) {
      double v21 = (void *)v14;
    }
    else {
      double v21 = 0LL;
    }
  }

  if (v8) {
LABEL_8:
  }
    [v8 setAction:v20];
LABEL_9:
  if (v9) {
    [v9 setAction:v21];
  }
}

id SCATGetRecipeMappingIndexAndLongPressVariant(void *a1, uint64_t *a2, BOOL *a3)
{
  id result = [a1 action];
  uint64_t v6 = (uint64_t)result - 1;
  if (a2)
  {
    if (v6 < 0) {
      uint64_t v6 = (uint64_t)result;
    }
    *a2 = v6 >> 1;
  }

  if (a3) {
    *a3 = (((unint64_t)result - 1) & 0x8000000000000001LL) == 1;
  }
  return result;
}

id sub_10008E404(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  [*(id *)(a1 + 40) center];
  return _objc_msgSend(v1, "_tapSegmentAtPoint:");
}

LABEL_19:
    *a4 = v16;
    goto LABEL_20;
  }

  id v9 = -[SCATMenuCollectionViewFlowLayout maxVisibleItems](self, "maxVisibleItems");
  if (v9 >= a5) {
    uint64_t v10 = a5;
  }
  else {
    uint64_t v10 = v9;
  }
  uint64_t v11 = -[SCATMenuCollectionViewFlowLayout maxItemsPerRow](self, "maxItemsPerRow");
  CGRect v12 = -[SCATMenuCollectionViewFlowLayout maxRows](self, "maxRows");
  CGRect v13 = ceil((double)v10 / (double)v11);
  uint64_t v14 = (unint64_t)v13;
  if (v10 >= v11) {
    __int128 v15 = v11;
  }
  else {
    __int128 v15 = v10;
  }
  if (v14 == 1) {
    __int128 v16 = v15;
  }
  else {
    __int128 v16 = v11;
  }
  if (a4) {
    goto LABEL_19;
  }
LABEL_20:
  if (a3) {
    *a3 = v14;
  }
}

void sub_10008FD68(id a1)
{
  uint64_t v1 = objc_opt_new(&OBJC_CLASS___AXOutputManager);
  uint64_t v2 = (void *)qword_100157768;
  qword_100157768 = (uint64_t)v1;
}

void sub_10008FFAC( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
}

void sub_10008FFD4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _updateAudioSessionProperties];
}

void sub_100090000(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _updateDuckingMode];
}

void sub_1000903F4(uint64_t a1)
{
  unsigned int v2 = [*(id *)(a1 + 32) _usesAVAudioPlayer];
  id v3 = *(void **)(a1 + 32);
  if (v2)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 soundIDsToAudioPlayer]);
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  *(unsigned int *)(a1 + 40)));
    uint64_t v6 = (AVAudioPlayer *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:v5]);

    if (!v6)
    {
      id v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) _urlForSoundEffect:*(unsigned int *)(a1 + 40)]);
      id v23 = 0LL;
      uint64_t v6 = -[AVAudioPlayer initWithContentsOfURL:error:]( objc_alloc(&OBJC_CLASS___AVAudioPlayer),  "initWithContentsOfURL:error:",  v7,  &v23);
      id v8 = v23;
      id v9 = -[AVAudioPlayer setDelegate:](v6, "setDelegate:", *(void *)(a1 + 32));
      if (v8)
      {
        uint64_t v10 = SWCHLogCommon(v9);
        uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
          sub_1000AFAF0(v8, v11);
        }
      }

      else
      {
        uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) soundIDsToAudioPlayer]);
        __int128 v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  *(unsigned int *)(a1 + 40)));
        -[os_log_s setObject:forKeyedSubscript:](v11, "setObject:forKeyedSubscript:", v6, v17);
      }
    }

    [*(id *)(a1 + 32) _volume];
    -[AVAudioPlayer setVolume:](v6, "setVolume:");
    -[AVAudioPlayer play](v6, "play");
  }

  else
  {
    CGRect v12 = (void *)objc_claimAutoreleasedReturnValue([v3 registeredSoundIDs]);
    CGRect v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  *(unsigned int *)(a1 + 40)));
    uint64_t v6 = (AVAudioPlayer *)objc_claimAutoreleasedReturnValue([v12 objectForKey:v13]);

    if (v6)
    {
      objc_msgSend( *(id *)(a1 + 32),  "_playSoundWithSoundID:",  -[AVAudioPlayer unsignedIntValue](v6, "unsignedIntValue"));
    }

    else
    {
      uint64_t v14 = (const __CFURL *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) _urlForSoundEffect:*(unsigned int *)(a1 + 40)]);
      __int128 v15 = v14;
      if (v14)
      {
        uint64_t v16 = AudioServicesCreateSystemSoundID(v14, &outSystemSoundID);
        if ((_DWORD)v16)
        {
          double v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v16));
          _AXLogWithFacility( 0LL,  0LL,  1LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0.0,  1,  @"Could not create system coundID. error:%@. url:%@");
        }

        else
        {
          CGRect v18 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) registeredSoundIDs]);
          unsigned int v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  outSystemSoundID));
          uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  *(unsigned int *)(a1 + 40)));
          [v18 setObject:v19 forKey:v20];

          [*(id *)(a1 + 32) _playSoundWithSoundID:outSystemSoundID];
        }
      }
    }
  }
}

void sub_100090720(id a1)
{
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  id v3 = (id)objc_claimAutoreleasedReturnValue([v1 pathForResource:@"mouseclick" ofType:@"wav"]);

  unsigned int v2 = (const __CFURL *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", v3));
  AudioServicesCreateSystemSoundID(v2, (SystemSoundID *)&dword_100157778);
}

void sub_100090948(uint64_t a1)
{
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  unsigned int v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "registeredSoundIDs", 0));
  id v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v10;
    do
    {
      uint64_t v6 = 0LL;
      do
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        AudioServicesDisposeSystemSoundID((SystemSoundID)[*(id *)(*((void *)&v9 + 1) + 8 * (void)v6) unsignedIntValue]);
        uint64_t v6 = (char *)v6 + 1;
      }

      while (v4 != v6);
      id v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }

    while (v4);
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) registeredSoundIDs]);
  [v7 removeAllObjects];

  id v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) soundIDsToAudioPlayer]);
  [v8 removeAllObjects];
}

id *sub_10009177C(id *result, void *a2, id a3)
{
  if (result[4] == a3) {
    return (id *)_objc_msgSend(result[5], "_updateSoundEffect:isActive:", objc_msgSend(a2, "integerValue"), 0);
  }
  return result;
}

void sub_100091A18( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

uint64_t sub_100091A30(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_100091A40(uint64_t a1)
{
}

void sub_100091A48(uint64_t a1, void *a2)
{
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_100092628(_Unwind_Exception *a1)
{
}

void sub_100092644(uint64_t a1, void *a2, char a3)
{
  uint64_t v5 = (id *)(a1 + 40);
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained(v5);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained unfinishedSpeechActionsWithCompletionBlocks]);
  [v8 removeObject:v6];

  dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
  __int128 v10 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_10009271C;
  v11[3] = &unk_100124838;
  id v12 = *(id *)(a1 + 32);
  char v13 = a3;
  dispatch_async(v10, v11);
}

uint64_t sub_10009271C(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16LL))( *(void *)(a1 + 32),  *(unsigned __int8 *)(a1 + 40));
}

void sub_10009276C(void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
}

  ;
}

BOOL sub_100092BE8(id a1, AXGroupable *a2)
{
  return -[AXGroupable isGroup](a2, "isGroup") ^ 1;
}

void sub_100092D78(id a1, SCATElement *a2, unint64_t a3, BOOL *a4)
{
  id v8 = a2;
  objc_opt_class(&OBJC_CLASS___AXElementGroup, v5);
  if ((objc_opt_isKindOfClass(v8, v6) & 1) != 0
    || (unint64_t v7 = (unint64_t)-[SCATElement scatTraits](v8, "scatTraits"), (kAXScrollableTrait & v7) != 0))
  {
    -[SCATElement scatScrollToVisible](v8, "scatScrollToVisible");
    *a4 = 1;
  }
}

void sub_100092DF0(id a1, id a2, unint64_t a3, BOOL *a4)
{
  id v8 = a2;
  objc_opt_class(&OBJC_CLASS___AXElementGroup, v5);
  if ((objc_opt_isKindOfClass(v8, v6) & 1) != 0
    || (unint64_t v7 = (unint64_t)[v8 scatTraits], (kAXScrollableTrait & v7) != 0))
  {
    [v8 scatScrollToVisible];
    *a4 = 1;
  }
}

void sub_100092FBC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

id sub_100092FD4(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id result = [a2 scatDisplayId];
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = (_DWORD)result;
  if (*(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL)) {
    *a4 = 1;
  }
  return result;
}

void sub_100093260(uint64_t a1, void *a2)
{
  id v3 = a2;
}

void sub_100093598(id a1)
{
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue(+[NSParagraphStyle defaultParagraphStyle](&OBJC_CLASS___NSParagraphStyle, "defaultParagraphStyle"));
  id v2 = [v1 mutableCopy];

  [v2 setAlignment:1];
  [v2 setLineBreakMode:0];
  LODWORD(v3) = 0.25;
  [v2 setHyphenationFactor:v3];
  [v2 setMinimumLineHeight:30.0];
  [v2 setMaximumLineHeight:30.0];
  if (UIAccessibilityIsBoldTextEnabled()) {
    uint64_t v4 = objc_claimAutoreleasedReturnValue(+[UIFont boldSystemFontOfSize:](&OBJC_CLASS___UIFont, "boldSystemFontOfSize:", 26.0));
  }
  else {
    uint64_t v4 = objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:](&OBJC_CLASS___UIFont, "systemFontOfSize:", 26.0));
  }
  uint64_t v5 = (void *)v4;
  v8[0] = NSFontAttributeName;
  v8[1] = NSParagraphStyleAttributeName;
  v9[0] = v4;
  v9[1] = v2;
  uint64_t v6 = objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v9,  v8,  2LL));
  unint64_t v7 = (void *)qword_100157790;
  qword_100157790 = v6;
}

id sub_100093E24(void *a1)
{
  id v1 = a1;
  id v2 = (void *)objc_claimAutoreleasedReturnValue([v1 imageName]);
  double v3 = (void *)objc_claimAutoreleasedReturnValue( +[UIImage scat_cachedMenuImageForImageName:]( &OBJC_CLASS___UIImage,  "scat_cachedMenuImageForImageName:",  v2));

  if (!v3)
  {
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v1 imageName]);
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage _deviceSpecificImageNamed:](&OBJC_CLASS___UIImage, "_deviceSpecificImageNamed:", v4));
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](&OBJC_CLASS___UIColor, "whiteColor"));
    unint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v5 imageWithTintColor:v6 renderingMode:1]);
    double v3 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v7,  "resizableImageWithCapInsets:resizingMode:",  1,  UIEdgeInsetsZero.top,  UIEdgeInsetsZero.left,  UIEdgeInsetsZero.bottom,  UIEdgeInsetsZero.right));

    if ([v3 isSymbolImage])
    {
      +[SCATModernMenuItem imageSize](&OBJC_CLASS___SCATModernMenuItem, "imageSize");
      __int128 v9 = (void *)objc_claimAutoreleasedReturnValue( +[UIImageSymbolConfiguration configurationWithPointSize:]( &OBJC_CLASS___UIImageSymbolConfiguration,  "configurationWithPointSize:",  v8));
      uint64_t v10 = objc_claimAutoreleasedReturnValue([v3 imageWithConfiguration:v9]);

      double v3 = (void *)v10;
    }

    if ([v1 shouldFlipForRTL]
      && [UIApp userInterfaceLayoutDirection] == (id)1)
    {
      uint64_t v11 = objc_claimAutoreleasedReturnValue([v3 imageWithHorizontallyFlippedOrientation]);

      double v3 = (void *)v11;
    }

    id v12 = (void *)objc_claimAutoreleasedReturnValue([v1 imageName]);
    +[UIImage scat_setCachedMenuImage:forImageName:]( &OBJC_CLASS___UIImage,  "scat_setCachedMenuImage:forImageName:",  v3,  v12);
  }

  return v3;
}

void sub_1000942C4(uint64_t a1)
{
  id v1 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) menu]);
  [v1 hideWithCompletion:0];
}

id sub_1000942F8(uint64_t a1)
{
  return [*(id *)(a1 + 32) activate];
}

void sub_100095624(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(unsigned int *)(a1 + 40);
  id v4 = a2;
  id v7 = (id)objc_claimAutoreleasedReturnValue([v2 displayContextForCursor:v4 forDisplayID:v3]);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v7 layer]);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v4 cursorContainerLayer]);

  [v5 addSublayer:v6];
}

LABEL_38:
  if (a4) {
    *a4 = v39;
  }
  if (a3) {
    *a3 = v22;
  }
}

id sub_100096880(uint64_t a1, uint64_t a2)
{
  return _[*(id *)(a1 + 32) _performScrollAction:2007 withMenu:a2];
}

id sub_100096890(uint64_t a1, uint64_t a2)
{
  return _[*(id *)(a1 + 32) _performScrollAction:2006 withMenu:a2];
}

id sub_1000968A0(uint64_t a1, uint64_t a2)
{
  return _[*(id *)(a1 + 32) _performScrollAction:2008 withMenu:a2];
}

id sub_1000968B0(uint64_t a1, uint64_t a2)
{
  return _[*(id *)(a1 + 32) _performScrollAction:2009 withMenu:a2];
}

void sub_1000968C0(id a1, SCATMenu *a2)
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(-[SCATMenu element](a2, "element"));
  id v2 = (void *)objc_claimAutoreleasedReturnValue([v3 scrollableElement]);
  [v2 scatPerformAction:2019];
}

void sub_10009690C(id a1, SCATMenu *a2)
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(-[SCATMenu element](a2, "element"));
  id v2 = (void *)objc_claimAutoreleasedReturnValue([v3 scrollableElement]);
  [v2 scatPerformAction:2020];
}

void sub_100096958(uint64_t a1, void *a2)
{
  id v9 = a2;
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[SCATScannerManager sharedManager](&OBJC_CLASS___SCATScannerManager, "sharedManager"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 autoscroller]);

  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v9 element]);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 scrollableElement]);

  if (([v6 hasWebContent] & 1) != 0
    || ([v6 scatSupportsAction:2030] & 1) == 0)
  {
    uint64_t v7 = objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) _fallbackAncestorForScrollToTopForMenu:v9]);

    uint64_t v6 = (void *)v7;
  }

  [v4 setScrollElement:v6];
  [v4 scrollToTop];
  AXPerformBlockOnMainThreadAfterDelay(&stru_1001249B0, v8, 0.3);
}

void sub_100096A3C(id a1)
{
  id v1 = (id)objc_claimAutoreleasedReturnValue(+[HNDAccessibilityManager sharedManager](&OBJC_CLASS___HNDAccessibilityManager, "sharedManager"));
  [v1 refreshElements];
}

void sub_100096A70(uint64_t a1, void *a2)
{
  id v9 = a2;
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[SCATScannerManager sharedManager](&OBJC_CLASS___SCATScannerManager, "sharedManager"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 autoscroller]);

  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v9 element]);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 scrollableElement]);

  if (([v6 hasWebContent] & 1) != 0
    || ([v6 scatSupportsAction:2006] & 1) == 0
    && ([v6 scatSupportsAction:2007] & 1) == 0)
  {
    uint64_t v7 = objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) _fallbackAncestorForAutoscrollForMenu:v9]);

    uint64_t v6 = (void *)v7;
  }

  [v4 setScrollElement:v6];
  [v4 resume];
  uint64_t v8 = -[SCATModernMenuSheet initWithMenu:]( objc_alloc(&OBJC_CLASS___SCATModernMenuAutoscrollSheet),  "initWithMenu:",  v9);
  [v9 pushSheet:v8];
}

BOOL sub_100096B84(id a1, SCATModernMenuItem *a2)
{
  return 0;
}

uint64_t sub_100096FC0(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) delegate]);
  [v2 menu:*(void *)(a1 + 32) showScrollViewPickerForScrollViews:*(void *)(a1 + 40) elementsToScroll:*(void *)(a1 + 48) scrollAction:*(unsigned int *)(a1 + 56)];

  return AXPerformBlockOnMainThreadAfterDelay(&stru_1001249F0, v3, 0.0);
}

void sub_10009700C(id a1)
{
  id v1 = (id)objc_claimAutoreleasedReturnValue(+[SCATScannerManager sharedManager](&OBJC_CLASS___SCATScannerManager, "sharedManager"));
  [v1 beginScanningWithFocusContext:0];
}

BOOL sub_100097B94(id a1, SCATModernMenuItem *a2, NSDictionary *a3)
{
  return -[SCATModernMenuItem isAllowedWithAssistiveAccess](a2, "isAllowedWithAssistiveAccess", a3);
}

BOOL sub_100097B9C(id a1, SCATModernMenuItem *a2, NSDictionary *a3)
{
  return -[SCATModernMenuItem isAllowedWithGuidedAccess](a2, "isAllowedWithGuidedAccess", a3);
}

LABEL_49:
            double v44 = v43;
            double v45 = 4LL;
            goto LABEL_51;
          }
        }
      }

      double v44 = v43;
      double v45 = 3LL;
LABEL_51:
      [v44 setStyle:v45];
      if (v39 == (id)++v42)
      {
        double v39 = [v37 countByEnumeratingWithState:&v63 objects:v68 count:16];
        if (!v39)
        {
LABEL_53:

          uint64_t v5 = v56;
          goto LABEL_54;
        }

        goto LABEL_35;
      }
    }
  }

  __int128 v17 = (void *)v16;
  CGRect v18 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuSheet menu](self, "menu"));
  __int128 v57 = v12;
  unsigned int v19 = self;
  uint64_t v20 = v8;
  double v21 = v18;
  double v22 = (void *)objc_claimAutoreleasedReturnValue([v18 menuVisualProvider]);
  CGRect v54 = [v22 isElementTopLevelInMenu:v6];

  uint64_t v8 = v20;
  self = v19;
  id v12 = v57;

  if (v54) {
    goto LABEL_27;
  }
  __int128 v61 = 0u;
  __int128 v62 = 0u;
  __int128 v59 = 0u;
  __int128 v60 = 0u;
  id v23 = (id)objc_claimAutoreleasedReturnValue(-[SCATModernMenuSheet menuItems](self, "menuItems"));
  id v24 = [v23 countByEnumeratingWithState:&v59 objects:v67 count:16];
  if (v24)
  {
    double v26 = v24;
    NSRect v27 = *(void *)v60;
    while (1)
    {
      for (uint64_t i = 0LL; i != v26; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v60 != v27) {
          objc_enumerationMutation(v23);
        }
        id v29 = *(void **)(*((void *)&v59 + 1) + 8LL * (void)i);
        if (!v11)
        {
          CGRect v53 = v5;
          *(void *)&double v25 = _AXAssert( 0LL,  "/Library/Caches/com.apple.xbs/Sources/AssistiveTouch/Source/Scanner/SCATModernMenuSheet.m",  396LL,  "-[SCATModernMenuSheet(SubclassingHooks) didFocusOnContext:oldContext:]",  @"We were scanning within a group in the menu, but no menu item was highlighted.  This should not happen unless the spec changes to include multi-level grouping.  Focus context: %@").n128_u64[0];
        }

        if (objc_msgSend(v29, "isDisabled", v25, v53))
        {
          __double2 v30 = v29;
          CGFloat v31 = 3LL;
LABEL_20:
          [v30 setStyle:v31];
          continue;
        }

        __double2 v30 = v11;
        if (v29 == v11)
        {
          CGFloat v31 = 2LL;
          goto LABEL_20;
        }

        CGFloat v32 = (void *)objc_claimAutoreleasedReturnValue([v11 scatElement]);
        __double2 v33 = (void *)objc_claimAutoreleasedReturnValue([v32 parentGroup]);
        double v34 = (void *)objc_claimAutoreleasedReturnValue([v29 scatElement]);
        double v35 = (void *)objc_claimAutoreleasedReturnValue([v34 parentGroup]);

        if (v33 == v35) {
          CGFloat v36 = 4LL;
        }
        else {
          CGFloat v36 = 3LL;
        }
        [v29 setStyle:v36];
        uint64_t v5 = v56;
      }

      double v26 = [v23 countByEnumeratingWithState:&v59 objects:v67 count:16];
      if (!v26)
      {
LABEL_54:
        uint64_t v6 = v55;
        break;
      }
    }
  }
}

CFStringRef sub_100099394(int a1)
{
  else {
    return *(&off_100124AB0 + a1 - 1);
  }
}

void sub_1000993FC(id a1)
{
  id v1 = objc_alloc_init(&OBJC_CLASS___SCATFocusContext);
  id v2 = (void *)qword_1001577A0;
  qword_1001577A0 = (uint64_t)v1;
}

void sub_100099464(id a1)
{
  id v1 = objc_alloc_init(&OBJC_CLASS___SCATFocusContext);
  id v2 = (void *)qword_1001577B0;
  qword_1001577B0 = (uint64_t)v1;
}

void sub_10009B6F4(uint64_t a1)
{
  id v8 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) element]);
  else {
    id v2 = (id)objc_claimAutoreleasedReturnValue([v8 parentGroup]);
  }
  uint64_t v3 = v2;
  uint64_t v4 = objc_claimAutoreleasedReturnValue([v2 selectionPath]);
  [*(id *)(a1 + 40) setCurrentSelectionPath:v4];

  objc_opt_class(&OBJC_CLASS___SCATPointPickerCenterPoint, v5);
  LOBYTE(v4) = objc_opt_isKindOfClass(v8, v6);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) pointPickerView]);
  [v7 setCenterPointVisible:v4 & 1];
}

void sub_10009C488(id a1)
{
  id v1 = objc_alloc_init(&OBJC_CLASS___SCATScannerManager);
  id v2 = (void *)qword_1001577C0;
  qword_1001577C0 = (uint64_t)v1;
}

void sub_10009D130( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id *location, id *a21, id *a22)
{
}

void sub_10009D1AC(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v1 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained cursorManager]);
  [v1 updateWithFocusContext:0 animated:0 options:0];
}

void sub_10009D1FC(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _updateElementVisuals];
}

void sub_10009D228(uint64_t a1)
{
  id v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _updateElementVisuals];

  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[HNDAccessibilityManager sharedManager](&OBJC_CLASS___HNDAccessibilityManager, "sharedManager"));
  [v3 refreshElements];

  id v4 = objc_loadWeakRetained(v1);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 activeElementManager]);
  id v6 = objc_loadWeakRetained(v1);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 menu]);

  if (v5 == v7)
  {
    id v9 = objc_loadWeakRetained(v1);
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v9 menu]);
    [v8 updateMenuVisualsForUpdatedElementVisuals];
  }

void sub_10009D310(uint64_t a1)
{
  id v6 = (id)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  [v6 switchControlAutoTapTimeout];
  double v3 = v2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained selectActionHandler]);
  [v5 setTimeoutDuration:v3];
}

void sub_10009D384(uint64_t a1)
{
  double v2 = (void *)objc_claimAutoreleasedReturnValue(+[HNDAccessibilityManager sharedManager](&OBJC_CLASS___HNDAccessibilityManager, "sharedManager"));
  [v2 groupingEnabledDidChange];

  double v3 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained(v3);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained menu]);
  [v5 groupingEnabledDidChange];

  id v6 = objc_loadWeakRetained(v3);
  LODWORD(v5) = [v6 isActive];

  if ((_DWORD)v5)
  {
    id v7 = objc_loadWeakRetained(v3);
    [v7 beginScanningWithFocusContext:0];
  }

void sub_10009D43C(uint64_t a1)
{
  id v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _updateScanningStyle];

  id v4 = objc_loadWeakRetained(v1);
  double v3 = (void *)objc_claimAutoreleasedReturnValue([v4 inputController]);
  [v3 updateWhetherSwitchConfigurationRendersDeviceUnusable];
}

void sub_10009D498(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _scanningModePreferenceDidChange];
}

void sub_10009D4C4(uint64_t a1)
{
  double v2 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  objc_msgSend(*(id *)(a1 + 32), "setSpeechEnabled:", objc_msgSend(v2, "assistiveTouchScannerSpeechEnabled"));

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _updateAudioSessionState];

  id v4 = (id)objc_claimAutoreleasedReturnValue(+[HNDAccessibilityManager sharedManager](&OBJC_CLASS___HNDAccessibilityManager, "sharedManager"));
  [v4 speechEnabledDidChange];
}

void sub_10009D540(uint64_t a1)
{
  double v2 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  objc_msgSend(*(id *)(a1 + 32), "setSoundEffectsEnabled:", objc_msgSend(v2, "assistiveTouchScannerSoundEnabled"));

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _updateAudioSessionState];
}

void sub_10009D5A0(id a1)
{
}

void sub_10009E068( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
}

void sub_10009E08C(uint64_t a1)
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472LL;
  v2[2] = sub_10009E130;
  v2[3] = &unk_100124B40;
  void v2[4] = *(void *)(a1 + 32);
  objc_copyWeak(&v4, (id *)(a1 + 48));
  id v3 = *(id *)(a1 + 40);
  AXPerformBlockAsynchronouslyOnMainThread(v2);

  objc_destroyWeak(&v4);
}

void sub_10009E11C(_Unwind_Exception *a1)
{
}

uint64_t sub_10009E130(uint64_t a1)
{
  double v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) _driverForScannerState]);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [v2 outputManager:WeakRetained didSpeakFocusContext:0];

  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void sub_10009EC44( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

id sub_10009EC5C(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  unsigned int v6 = [a2 displayID];
  id result = [*(id *)(a1 + 32) lockedToDisplayID];
  if (v6 == (_DWORD)result)
  {
    *a4 = 1;
    *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 1;
  }

  return result;
}

void sub_10009EE30( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_10009EE48(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6 = a2;
  if ([v6 displayID] != *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    *a4 = 1;
    *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [v6 displayID];
  }
}

void sub_10009F12C(uint64_t a1)
{
  if (*(_BYTE *)(a1 + 48))
  {
    double v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) cursorManager]);
    [v2 updateWithFocusContext:0 animated:0 options:0];
  }

  id v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) activeElementManager]);
  [v3 redisplayIfNeeded:0];

  id v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) activeElementManager]);
  if (v4)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) activeScannerDriver]);

    if (!v6)
    {
      id v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) _driverForScannerState]);
      [*(id *)(a1 + 32) setActiveScannerDriver:v7];
    }

    int v8 = *(unsigned __int8 *)(a1 + 49);
    id v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) activeScannerDriver]);
    uint64_t v10 = *(void *)(a1 + 40);
    id v14 = v9;
    if (v8) {
      [v9 beginScanningWithFocusContext:v10];
    }
    else {
      [v9 continueScanningWithFocusContext:v10];
    }
  }

  else
  {
    if (!*(_BYTE *)(a1 + 49)) {
      *(void *)&double v5 = _AXAssert( 0LL,  "/Library/Caches/com.apple.xbs/Sources/AssistiveTouch/Source/Scanner/SCATScannerManager.m",  1261LL,  "-[SCATScannerManager _beginOrContinueScanningWithFocusContext:shouldBegin:foundNewElements:]_block_invoke",  @"Somehow had no active element manager when continueScanningWithFocusContext: was called. Given the current call sites, this should be impossible, though that may change in the future.").n128_u64[0];
    }
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "beginScanningTimer", v5));
    [v11 cancel];

    id v12 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) beginScanningTimer]);
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_10009F2D0;
    v15[3] = &unk_100122168;
    char v13 = *(void **)(a1 + 40);
    void v15[4] = *(void *)(a1 + 32);
    id v16 = v13;
    [v12 afterDelay:v15 processBlock:1.0];
  }

id sub_10009F2D0(uint64_t a1)
{
  return [*(id *)(a1 + 32) beginScanningWithFocusContext:*(void *)(a1 + 40)];
}

id sub_10009F3E8(uint64_t a1)
{
  return [*(id *)(a1 + 32) beginScanningWithFocusContext:0];
}

BOOL sub_1000A076C(id a1, AXElement *a2)
{
  return -[AXElement canPerformEscape](a2, "canPerformEscape");
}

void sub_1000A10C0( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
}

void sub_1000A10E4(id *a1)
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472LL;
  v2[2] = sub_1000A1194;
  v2[3] = &unk_100124C00;
  id v3 = a1[4];
  objc_copyWeak(&v5, a1 + 6);
  id v4 = a1[5];
  AXPerformBlockAsynchronouslyOnMainThread(v2);

  objc_destroyWeak(&v5);
}

void sub_1000A1180(_Unwind_Exception *a1)
{
}

void sub_1000A1194(uint64_t a1)
{
  double v2 = *(void **)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [v2 outputManager:WeakRetained didSpeakFocusContext:*(void *)(a1 + 40)];
}

id sub_1000A1FF4(uint64_t a1)
{
  return [*(id *)(a1 + 32) beginScanningWithFocusContext:0];
}

void sub_1000A2000(uint64_t a1)
{
  id v1 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) axManager]);
  [v1 refreshElements];
}

id sub_1000A2258(uint64_t a1)
{
  return _[*(id *)(a1 + 32) _waitForApplication:*(void *)(a1 + 40)];
}

void sub_1000A24EC(uint64_t a1)
{
  double v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) menu]);
  [v2 nativeFocusElementDidChange:*(void *)(a1 + 40)];

  id v3 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) activeScannerDriver]);
  [v3 tickleIdleTimer];
}

void sub_1000A2F28(uint64_t a1)
{
  id v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  id v3 = (id)objc_claimAutoreleasedReturnValue(+[SCATActionItem fromAction:](&OBJC_CLASS___SCATActionItem, "fromAction:", 103LL));
  [v1 inputController:v2 didReceiveAction:v3];
}

void sub_1000A338C(id a1, NSString *a2, NSError *a3)
{
  id v4 = a2;
  id v5 = a3;
  uint64_t v8 = AXSSLogForCategory(1LL, v6, v7);
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  uint64_t v10 = v9;
  if (v4)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 138543362;
      id v12 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Sysdiagnose completed. File path: %{public}@",  (uint8_t *)&v11,  0xCu);
    }
  }

  else if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    sub_1000AFE04((uint64_t)v5, v10);
  }
}

id sub_1000A4510(uint64_t a1)
{
  return [*(id *)(a1 + 32) beginScanningWithFocusContext:0];
}

void sub_1000A5964( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
}

void sub_1000A598C(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  uint64_t v8 = (id *)(a1 + 32);
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  id v12 = a2;
  id WeakRetained = objc_loadWeakRetained(v8);
  [WeakRetained _handleMIDIEvent:v12 device:v11 entity:v10 endpoint:v9];
}

void sub_1000A5ADC(uint64_t a1)
{
  id v14 = (id)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [*(id *)(a1 + 32) _switchKeyForEvent:*(void *)(a1 + 40)]));
  if ((uint64_t)[v14 integerValue] <= 0) {
    *(void *)&double v2 = _AXAssert( 0LL,  "/Library/Caches/com.apple.xbs/Sources/AssistiveTouch/Source/Scanner/SCATMIDIInputSource.m",  46LL,  "-[SCATMIDIInputSource _handleMIDIEvent:device:entity:endpoint:]_block_invoke",  @"Switch key should be a valid value > 0").n128_u64[0];
  }
  id v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "persistentSwitchIdentifiers", v2));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:v14]);

  id v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) switchDisplayNames]);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:v14]);

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) actions]);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:v14]);

  if (!v8)
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) actions]);
    uint64_t v13 = *(void *)(a1 + 40);
    id v11 = v14;
    _AXAssert( 0LL,  "/Library/Caches/com.apple.xbs/Sources/AssistiveTouch/Source/Scanner/SCATMIDIInputSource.m",  50LL,  "-[SCATMIDIInputSource _handleMIDIEvent:device:entity:endpoint:]_block_invoke",  @"action map for switch key: %@ was nil. actions:%@. event:%@");
  }

  id v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", @"SwitchActionTypeNormal", v11, v12, v13));
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:@"SwitchActionTypeLongPress"]);
  objc_msgSend( *(id *)(a1 + 32),  "_handleAction:longPressAction:start:switchIdentifier:switchDisplayName:",  v9,  v10,  objc_msgSend(*(id *)(a1 + 40), "isDownEvent"),  v4,  v6);
}

id sub_1000A6868(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 removeObject:*(void *)(a1 + 32)];
}

id sub_1000A6914(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "axSafelyAddObjectsFromArray:");
}

BOOL sub_1000A6BB8(id a1, SCATAuxiliaryElementManager *a2, unint64_t a3)
{
  return -[SCATAuxiliaryElementManager isEnabled](a2, "isEnabled", a3);
}

void sub_1000A8784(uint64_t a1)
{
  id v1 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) view]);
  [v1 setAlpha:0.0];
}

void sub_1000A881C(uint64_t a1)
{
  id v1 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) view]);
  [v1 setAlpha:1.0];
}

LABEL_63:
  *(void *)&double v21 = objc_opt_class(a1, v17).n128_u64[0];
  uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "updateBlockForIdentifier:", v9, v21));
  LOBYTE(v27) = v16;
  id v24 = (void *)objc_claimAutoreleasedReturnValue( +[SCATModernMenuItem itemWithIdentifier:delegate:title:imageName:activateBehavior:allowedWithGuidedAccess:allowedWithAssistiveAccess:activateHandler:updateHandler:]( &OBJC_CLASS___SCATModernMenuItem,  "itemWithIdentifier:delegate:title:imageName:activateBehavior:allowedWithGuidedAccess:allowedWithAssi stiveAccess:activateHandler:updateHandler:",  v9,  v8,  v29,  v10,  v28,  v13,  v27,  v18,  v23));

  double v25 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:@"menuItemGroup"]);
  [v24 setMenuItemGroupName:v25];

  return v24;
}

void sub_1000AA434(id a1, SCATMenu *a2)
{
  id v3 = a2;
  double v2 = (void *)objc_claimAutoreleasedReturnValue(+[AXPISystemActionHelper sharedInstance](&OBJC_CLASS___AXPISystemActionHelper, "sharedInstance"));
  [v2 activateSiri];

  -[SCATMenu didPressScreenChangingButton](v3, "didPressScreenChangingButton");
}

void sub_1000AA488(id a1, SCATMenu *a2)
{
  id v3 = a2;
  double v2 = (void *)objc_claimAutoreleasedReturnValue(+[AXPISystemActionHelper sharedInstance](&OBJC_CLASS___AXPISystemActionHelper, "sharedInstance"));
  [v2 activateVoiceControl];

  -[SCATMenu didPressScreenChangingButton](v3, "didPressScreenChangingButton");
}

void sub_1000AA4DC(id a1, SCATMenu *a2)
{
  id v3 = a2;
  double v2 = (void *)objc_claimAutoreleasedReturnValue(+[AXPISystemActionHelper sharedInstance](&OBJC_CLASS___AXPISystemActionHelper, "sharedInstance"));
  [v2 toggleAppSwitcher];

  -[SCATMenu didPressScreenChangingButton](v3, "didPressScreenChangingButton");
}

void sub_1000AA530(id a1, SCATMenu *a2)
{
  id v3 = a2;
  double v2 = (void *)objc_claimAutoreleasedReturnValue(+[AXPISystemActionHelper sharedInstance](&OBJC_CLASS___AXPISystemActionHelper, "sharedInstance"));
  [v2 toggleNotificationCenter];

  -[SCATMenu didPressScreenChangingButton](v3, "didPressScreenChangingButton");
}

void sub_1000AA584(id a1, SCATMenu *a2)
{
  id v3 = a2;
  double v2 = (void *)objc_claimAutoreleasedReturnValue(+[AXPISystemActionHelper sharedInstance](&OBJC_CLASS___AXPISystemActionHelper, "sharedInstance"));
  [v2 toggleControlCenter];

  -[SCATMenu didPressScreenChangingButton](v3, "didPressScreenChangingButton");
}

void sub_1000AA5D8(id a1, SCATMenu *a2)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(+[AXPISystemActionHelper sharedInstance](&OBJC_CLASS___AXPISystemActionHelper, "sharedInstance"));
  [v2 activateLockButton];
}

void sub_1000AA60C(id a1, SCATMenu *a2)
{
  id v2 = a2;
  id v3 = -[SCATModernMenuSheet initWithMenu:]( objc_alloc(&OBJC_CLASS___SCATModernMenuRotateItemsSheet),  "initWithMenu:",  v2);
  -[SCATMenu pushSheet:](v2, "pushSheet:", v3);
}

void sub_1000AA664(id a1, SCATMenu *a2)
{
  int HasStaccato = AXDeviceHasStaccato(a1, a2);
  id v3 = (id)objc_claimAutoreleasedReturnValue(+[AXPISystemActionHelper sharedInstance](&OBJC_CLASS___AXPISystemActionHelper, "sharedInstance"));
  if (HasStaccato) {
    [v3 pressStaccato];
  }
  else {
    [v3 toggleRingerSwitch:!sub_10002ADD8()];
  }
}

void sub_1000AA6C4(id a1, SCATMenu *a2)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(+[AXPISystemActionHelper sharedInstance](&OBJC_CLASS___AXPISystemActionHelper, "sharedInstance"));
  [v2 decreaseVolume];
}

void sub_1000AA6F8(id a1, SCATMenu *a2)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(+[AXPISystemActionHelper sharedInstance](&OBJC_CLASS___AXPISystemActionHelper, "sharedInstance"));
  [v2 increaseVolume];
}

void sub_1000AA72C(id a1, SCATMenu *a2)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(+[AXPISystemActionHelper sharedInstance](&OBJC_CLASS___AXPISystemActionHelper, "sharedInstance"));
  [v2 activateTripleClick];
}

void sub_1000AA760(id a1, SCATMenu *a2)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(+[AXPISystemActionHelper sharedInstance](&OBJC_CLASS___AXPISystemActionHelper, "sharedInstance"));
  [v2 shake];
}

void sub_1000AA794(id a1, SCATMenu *a2)
{
}

void sub_1000AA7A8(id a1)
{
  id v1 = (id)objc_claimAutoreleasedReturnValue(+[AXPISystemActionHelper sharedInstance](&OBJC_CLASS___AXPISystemActionHelper, "sharedInstance"));
  [v1 takeScreenshot];
}

void sub_1000AA7DC(id a1, SCATMenu *a2)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(+[AXPISystemActionHelper sharedInstance](&OBJC_CLASS___AXPISystemActionHelper, "sharedInstance"));
  [v2 adjustSystemZoom:0];
}

void sub_1000AA814(id a1, SCATMenu *a2)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(+[AXPISystemActionHelper sharedInstance](&OBJC_CLASS___AXPISystemActionHelper, "sharedInstance"));
  [v2 adjustSystemZoom:1];
}

void sub_1000AA84C(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v6 = a2;
  *(void *)&double v4 = objc_opt_class(v2, v3).n128_u64[0];
  objc_msgSend(v5, "_handleSpeakThis:", v6, v4);
}

void sub_1000AA88C(id a1, SCATMenu *a2)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(+[AXPISystemActionHelper sharedInstance](&OBJC_CLASS___AXPISystemActionHelper, "sharedInstance"));
  [v2 toggleSpotlight];
}

void sub_1000AA8C0(id a1, SCATMenu *a2)
{
  id v2 = a2;
  uint64_t v3 = objc_alloc(&OBJC_CLASS___SCATModernMenuControllableDevicesSheet);
  double v4 = (void *)objc_claimAutoreleasedReturnValue(-[SCATMenu delegate](v2, "delegate"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 interDeviceCommunicatorForMenu:v2]);
  id v6 = -[SCATModernMenuControllableDevicesSheet initWithMenu:interDeviceCommunicator:]( v3,  "initWithMenu:interDeviceCommunicator:",  v2,  v5);

  -[SCATMenu pushSheet:](v2, "pushSheet:", v6);
}

void sub_1000AA954(id a1, SCATMenu *a2)
{
  id v2 = a2;
  id v3 = (id)objc_claimAutoreleasedReturnValue(-[SCATMenu delegate](v2, "delegate"));
  [v3 returnControlToForwarderDevice:v2];
}

void sub_1000AA998(id a1, SCATMenu *a2)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(+[AXPISystemActionHelper sharedInstance](&OBJC_CLASS___AXPISystemActionHelper, "sharedInstance"));
  [v2 activateSOSMode];
}

void sub_1000AA9CC(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v6 = a2;
  *(void *)&double v4 = objc_opt_class(v2, v3).n128_u64[0];
  objc_msgSend(v5, "_handleSysdiagnose:", v6, v4);
}

void sub_1000AAA0C(id a1, SCATMenu *a2)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(+[AXPISystemActionHelper sharedInstance](&OBJC_CLASS___AXPISystemActionHelper, "sharedInstance"));
  [v2 rebootDevice];
}

void sub_1000AAA40(id a1, SCATMenu *a2)
{
  uint64_t v3 = a2;
  id v2 = (void *)objc_claimAutoreleasedReturnValue(+[AXPISystemActionHelper sharedInstance](&OBJC_CLASS___AXPISystemActionHelper, "sharedInstance"));
  [v2 toggleDock];

  -[SCATMenu didPressScreenChangingButton](v3, "didPressScreenChangingButton");
}

void sub_1000AAA94(id a1, SCATMenu *a2)
{
  uint64_t v3 = a2;
  id v2 = (void *)objc_claimAutoreleasedReturnValue(+[AXPISystemActionHelper sharedInstance](&OBJC_CLASS___AXPISystemActionHelper, "sharedInstance"));
  [v2 armApplePay];

  -[SCATMenu didPressScreenChangingButton](v3, "didPressScreenChangingButton");
}

void sub_1000AAAE8(id a1, SCATMenu *a2)
{
  BOOL v2 = _AXSCommandAndControlEnabled(a1, a2) == 0;
  _AXSCommandAndControlSetEnabled(v2);
}

void sub_1000AAB04(id a1, SCATMenu *a2)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(+[AXPISystemActionHelper sharedInstance](&OBJC_CLASS___AXPISystemActionHelper, "sharedInstance"));
  [v2 pressCameraButton];
}

void sub_1000AAB38(id a1, SCATMenu *a2)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(+[AXPISystemActionHelper sharedInstance](&OBJC_CLASS___AXPISystemActionHelper, "sharedInstance"));
  [v2 lightPressCameraButton];
}

void sub_1000AAB6C(id a1, SCATMenu *a2)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(+[AXPISystemActionHelper sharedInstance](&OBJC_CLASS___AXPISystemActionHelper, "sharedInstance"));
  [v2 doubleLightPressCameraButton];
}

void sub_1000AABA0(id a1, SCATMenu *a2)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(+[AXPISystemActionHelper sharedInstance](&OBJC_CLASS___AXPISystemActionHelper, "sharedInstance"));
  [v2 openVisualIntelligence];
}

void sub_1000AACB8(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = (id)objc_claimAutoreleasedReturnValue([v3 delegate]);
  [v5 menu:*(void *)(a1 + 32) showSysdiagnoseDisplayString:v4];
}

uint64_t sub_1000AAE10(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = sub_10002ADD8();
  if (AXDeviceHasStaccato(v4, v5))
  {
    id v6 = sub_10002B14C(@"ACTION_BUTTON");
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    [v3 setTitle:v7];

    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](&OBJC_CLASS___UIImage, "systemImageNamed:", @"square.3.layers.3d"));
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 imageWithRenderingMode:2]);
    [v3 setImage:v9];

    id v3 = v8;
  }

  else
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) _stringForRingerOn:v4]);
    [v3 setTitle:v10];

    if (v4) {
      id v11 = @"SCATIcon_device_mute";
    }
    else {
      id v11 = @"SCATIcon_device_unmute";
    }
    [v3 setImageName:v11];
  }

  return 1LL;
}

BOOL sub_1000AAF04(id a1, SCATModernMenuItem *a2)
{
  id v2 = a2;
  id v3 = (void *)_AXSTripleClickCopyOptions();
  id v4 = sub_10002B014(@"TRIPLE_CLICK");
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  if ([v3 count] == (id)1)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v3 firstObject]);
    uint64_t v7 = objc_claimAutoreleasedReturnValue( +[AXTripleClickHelpers titleForTripleClickOption:]( AXTripleClickHelpers,  "titleForTripleClickOption:",  [v6 intValue]));
    uint64_t v8 = (void *)v7;
    if (v7) {
      id v9 = (void *)v7;
    }
    else {
      id v9 = v5;
    }
    id v10 = v9;

    uint64_t v5 = v10;
  }

  -[SCATModernMenuItem setTitle:](v2, "setTitle:", v5);

  return 1;
}

BOOL sub_1000AAFCC(id a1, SCATModernMenuItem *a2)
{
  id v2 = a2;
  id v3 = sub_10002B1B4(@"CAMERA_BUTTON_VISUAL_INTELLIGENCE");
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  -[SCATModernMenuItem setTitle:](v2, "setTitle:", v4);

  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](&OBJC_CLASS___UIImage, "systemImageNamed:", @"apple.intelligence"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 imageWithRenderingMode:2]);
  -[SCATModernMenuItem setImage:](v2, "setImage:", v6);

  return 1;
}

BOOL sub_1000AB060(id a1, SCATModernMenuItem *a2)
{
  return 0;
}

void sub_1000AB280(uint64_t a1)
{
  id v1 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) view]);
  [v1 setAlpha:1.0];
}

id sub_1000AB2B4(uint64_t a1)
{
  return [*(id *)(a1 + 32) didPresentWithDisplayContext:*(void *)(a1 + 40) animated:*(unsigned __int8 *)(a1 + 48)];
}

void sub_1000AB398(uint64_t a1)
{
  id v1 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) view]);
  [v1 setAlpha:0.0];
}

id sub_1000AB3CC(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) view]);
  [v2 removeFromSuperview];

  return _[*(id *)(a1 + 32) didDismiss:*(unsigned __int8 *)(a1 + 40)];
}

void *sub_1000AB760()
{
  id v1 = (void **)(v0 + OBJC_IVAR___HNDSceneDelegate_window);
  swift_beginAccess(v0 + OBJC_IVAR___HNDSceneDelegate_window, v5, 0LL, 0LL);
  id v2 = *v1;
  id v3 = v2;
  return v2;
}

void sub_1000AB7AC(void *a1)
{
}

void *sub_1000AB7B8(uint64_t a1)
{
  return &j_j__swift_endAccess;
}

void *sub_1000AB7FC()
{
  uint64_t v1 = (void **)(v0 + OBJC_IVAR___HNDSceneDelegate_ignoredWindow);
  swift_beginAccess(v0 + OBJC_IVAR___HNDSceneDelegate_ignoredWindow, v5, 0LL, 0LL);
  id v2 = *v1;
  id v3 = v2;
  return v2;
}

void sub_1000AB848(void *a1)
{
}

void sub_1000AB854(void *a1, void *a2)
{
  id v4 = (void **)(v2 + *a2);
  swift_beginAccess(v4, v6, 1LL, 0LL);
  uint64_t v5 = *v4;
  void *v4 = a1;
}

void *sub_1000AB8A0(uint64_t a1)
{
  return &j__swift_endAccess;
}

void sub_1000AB968(uint64_t a1)
{
  id v2 = [(id)objc_opt_self(HNDHandManager) sharedManager];
  if (v2)
  {
    id v3 = v2;
    [v2 sceneDidDisconnect:a1];
  }

  else
  {
    __break(1u);
  }

id sub_1000ABAB0()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SceneDelegate();
  return objc_msgSendSuper2(&v2, "dealloc");
}

void sub_1000ABB18(void *a1)
{
  uint64_t v3 = objc_opt_self(&OBJC_CLASS___UIWindowScene);
  uint64_t v4 = swift_dynamicCastObjCClass(a1, v3);
  if (!v4)
  {
    uint64_t v18 = static os_log_type_t.error.getter();
    id v19 = (id)ASTLogCommon(v18);
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = sub_1000ABFEC(&qword_100157218);
      uint64_t v22 = swift_allocObject(v21, 72LL, 7LL);
      *(_OWORD *)(v22 + 16) = xmmword_100118230;
      *(void *)(v22 + 56) = sub_1000AC084(0LL, &qword_100157220, &OBJC_CLASS___UIScene_ptr);
      *(void *)(v22 + 64) = sub_1000AC02C();
      *(void *)(v22 + 32) = a1;
      id v23 = a1;
      os_log(_:dso:log:_:_:)(v18, &_mh_execute_header, v20, "Unexpected type for connected scene: %@", 39LL, 2LL, v22);

      uint64_t v17 = v22;
      goto LABEL_9;
    }

    __break(1u);
    goto LABEL_31;
  }

  uint64_t v5 = (void *)v4;
  uint64_t v6 = sub_1000AC084(0LL, (unint64_t *)&qword_100157230, off_100121190);
  ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata(v6);
  id v54 = a1;
  if (![ObjCClassFromMetadata usesScenes])
  {
LABEL_28:
    CGRect v52 = v54;
    goto LABEL_29;
  }

  id v8 = [v5 screen];
  id v9 = [v8 displayIdentity];

  if (!v9)
  {
LABEL_31:
    __break(1u);
LABEL_32:
    __break(1u);
    goto LABEL_33;
  }

  id v10 = [v9 type];

  if (v10 == (id)8)
  {
    uint64_t v11 = static os_log_type_t.info.getter();
    id v12 = (id)ASTLogCommon(v11);
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = sub_1000ABFEC(&qword_100157218);
      uint64_t v15 = swift_allocObject(v14, 72LL, 7LL);
      *(_OWORD *)(v15 + 16) = xmmword_100118230;
      *(void *)(v15 + 56) = sub_1000AC084(0LL, &qword_100157220, &OBJC_CLASS___UIScene_ptr);
      *(void *)(v15 + 64) = sub_1000AC02C();
      *(void *)(v15 + 32) = v54;
      id v16 = v54;
      os_log(_:dso:log:_:_:)( v11,  &_mh_execute_header,  v13,  "Skipping scene because it is continuity (for Oneness): %@",  57LL,  2LL,  v15);

      uint64_t v17 = v15;
LABEL_9:
      swift_bridgeObjectRelease(v17);
      return;
    }

    goto LABEL_32;
  }

  id v24 = [objc_allocWithZone((Class)HNDIgnoredWindow) initWithWindowScene:v5];
  uint64_t v25 = (*(uint64_t (**)(id))((swift_isaMask & *v1) + 0x80LL))(v24);
  double v26 = *(uint64_t (**)(void))((swift_isaMask & *v1) + 0x78LL);
  NSRect v27 = (void *)((uint64_t (*)(uint64_t))v26)(v25);
  if (v27)
  {
    double v28 = v27;
    [v27 setWindowLevel:10000011.0];
  }

  id v29 = (void *)v26();
  if (v29)
  {
    __double2 v30 = v29;
    [v29 setHidden:0];
  }

  uint64_t v31 = v26();
  if (v31)
  {
    CGFloat v32 = (void *)v31;
    id v33 = [objc_allocWithZone((Class)HNDBlankRootViewController) init];
    [v32 setRootViewController:v33];
  }

  id v34 = [objc_allocWithZone((Class)HNDWindow) initWithWindowScene:v5];
  uint64_t v35 = (*(uint64_t (**)(id))((swift_isaMask & *v1) + 0x68LL))(v34);
  CGFloat v36 = *(uint64_t (**)(void))((swift_isaMask & *v1) + 0x60LL);
  CGFloat v37 = (void *)((uint64_t (*)(uint64_t))v36)(v35);
  if (v37)
  {
    double v38 = v37;
    [v37 makeKeyAndVisible];
  }

  double v39 = (void *)v36();
  if (v39)
  {
    double v40 = v39;
    [v39 setWindowLevel:10000010.0];
  }

  uint64_t v41 = v36();
  if (v41)
  {
    double v42 = (void *)v41;
    id v43 = [objc_allocWithZone((Class)HNDBlankRootViewController) init];
    [v42 setRootViewController:v43];
  }

  uint64_t v44 = v36();
  if (!v44) {
    goto LABEL_28;
  }
  double v45 = (void *)v44;
  uint64_t v46 = v26();
  if (!v46)
  {

    goto LABEL_28;
  }

  double v47 = (void *)v46;
  uint64_t v48 = (void *)objc_opt_self(&OBJC_CLASS___HNDHandManager);
  id v49 = [v48 sharedManager];
  if (!v49)
  {
LABEL_33:
    __break(1u);
    goto LABEL_34;
  }

  CGRect v50 = v49;
  [v49 setupWindow:v45 ignoredWindow:v47];

  id v51 = [v48 sharedManager];
  if (v51)
  {
    id v53 = v51;
    [v51 sceneDidConnect:v54];

    CGRect v52 = v53;
LABEL_29:

    return;
  }

uint64_t type metadata accessor for SceneDelegate()
{
  return objc_opt_self(&OBJC_CLASS___HNDSceneDelegate);
}

uint64_t sub_1000ABFEC(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2((char *)a1 + (int)result, -(result >> 32), 0LL, 0LL);
    *a1 = result;
  }

  return result;
}

unint64_t sub_1000AC02C()
{
  unint64_t result = qword_100157228;
  if (!qword_100157228)
  {
    uint64_t v1 = sub_1000AC084(255LL, &qword_100157220, &OBJC_CLASS___UIScene_ptr);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for NSObject, v1);
    atomic_store(result, (unint64_t *)&qword_100157228);
  }

  return result;
}

uint64_t sub_1000AC084(uint64_t a1, unint64_t *a2, void *a3)
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

unint64_t sub_1000AC0C8@<X0>(unsigned int *a1@<X0>, uint64_t a2@<X8>)
{
  unint64_t result = sub_1000AC314(*a1);
  *(_DWORD *)a2 = result;
  *(_BYTE *)(a2 + 4) = BYTE4(result) & 1;
  return result;
}

BOOL sub_1000AC0F8(_DWORD *a1, _DWORD *a2)
{
  return *a1 == *a2;
}

Swift::Int sub_1000AC10C()
{
  Swift::UInt32 v1 = *v0;
  Hasher.init(_seed:)(v3, 0LL);
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

void sub_1000AC150()
{
}

Swift::Int sub_1000AC178(uint64_t a1)
{
  Swift::UInt32 v2 = *v1;
  Hasher.init(_seed:)(v4, a1);
  Hasher._combine(_:)(v2);
  return Hasher._finalize()();
}

unint64_t sub_1000AC1B8@<X0>(unsigned int *a1@<X0>, uint64_t a2@<X8>)
{
  unint64_t result = sub_1000AC38C(*a1);
  *(_DWORD *)a2 = result;
  *(_BYTE *)(a2 + 4) = BYTE4(result) & 1;
  return result;
}

void sub_1000AC1E8(_DWORD *a1@<X8>)
{
  *a1 = *v1;
}

BOOL sub_1000AC1F4(void *a1, void *a2)
{
  return *a1 == *a2;
}

void sub_1000AC20C()
{
}

uint64_t *sub_1000AC238@<X0>(uint64_t *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2 = *result;
  BOOL v3 = (unint64_t)*result > 2;
  *(void *)a2 = v2;
  *(_BYTE *)(a2 + _Block_object_dispose(va, 8) = v3;
  return result;
}

void sub_1000AC254(void *a1@<X8>)
{
  *a1 = *v1;
}

void *sub_1000AC260@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  BOOL v2 = *result != 1LL && *result != 0LL;
  *(void *)a2 = *result == 1LL;
  *(_BYTE *)(a2 + _Block_object_dispose(va, 8) = v2;
  return result;
}

Swift::Int sub_1000AC290()
{
  Swift::UInt v1 = *v0;
  Hasher.init(_seed:)(v3, 0LL);
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

Swift::Int sub_1000AC2D4(uint64_t a1)
{
  Swift::UInt v2 = *v1;
  Hasher.init(_seed:)(v4, a1);
  Hasher._combine(_:)(v2);
  return Hasher._finalize()();
}

unint64_t sub_1000AC314(unsigned int a1)
{
  unsigned __int8 v1 = 0;
  uint64_t v2 = a1;
  switch(a1)
  {
    case 0u:
      uint64_t v2 = 0LL;
      unsigned __int8 v1 = 0;
      break;
    case 1u:
      return v2 | ((unint64_t)v1 << 32);
    case 2u:
      unsigned __int8 v1 = 0;
      uint64_t v2 = 2LL;
      break;
    case 3u:
      unsigned __int8 v1 = 0;
      uint64_t v2 = 3LL;
      break;
    case 4u:
      unsigned __int8 v1 = 0;
      uint64_t v2 = 4LL;
      break;
    default:
      uint64_t v2 = 0LL;
      unsigned __int8 v1 = 1;
      break;
  }

  return v2 | ((unint64_t)v1 << 32);
}

unint64_t sub_1000AC38C(unsigned int a1)
{
  unsigned __int8 v1 = 0;
  uint64_t v2 = a1;
  switch(a1)
  {
    case 0u:
      uint64_t v2 = 0LL;
      unsigned __int8 v1 = 0;
      break;
    case 1u:
      return v2 | ((unint64_t)v1 << 32);
    case 2u:
      unsigned __int8 v1 = 0;
      uint64_t v2 = 2LL;
      break;
    case 4u:
      unsigned __int8 v1 = 0;
      uint64_t v2 = 4LL;
      break;
    default:
      uint64_t v2 = 0LL;
      unsigned __int8 v1 = 1;
      break;
  }

  return v2 | ((unint64_t)v1 << 32);
}

unint64_t sub_1000AC3FC()
{
  unint64_t result = qword_100157300;
  if (!qword_100157300)
  {
    unint64_t result = swift_getWitnessTable(&unk_10011826C, &type metadata for EventType);
    atomic_store(result, (unint64_t *)&qword_100157300);
  }

  return result;
}

unint64_t sub_1000AC444()
{
  unint64_t result = qword_100157308;
  if (!qword_100157308)
  {
    unint64_t result = swift_getWitnessTable(&unk_10011830C, &type metadata for DeviceTransportType);
    atomic_store(result, (unint64_t *)&qword_100157308);
  }

  return result;
}

unint64_t sub_1000AC48C()
{
  unint64_t result = qword_100157310;
  if (!qword_100157310)
  {
    unint64_t result = swift_getWitnessTable(&unk_1001183AC, &type metadata for HandPinchMode);
    atomic_store(result, (unint64_t *)&qword_100157310);
  }

  return result;
}

unint64_t sub_1000AC4D4()
{
  unint64_t result = qword_100157318;
  if (!qword_100157318)
  {
    unint64_t result = swift_getWitnessTable(&unk_10011844C, &type metadata for HandPinchState);
    atomic_store(result, (unint64_t *)&qword_100157318);
  }

  return result;
}

unint64_t sub_1000AC51C()
{
  unint64_t result = qword_100157320;
  if (!qword_100157320)
  {
    unint64_t result = swift_getWitnessTable(&unk_1001184EC, &type metadata for ContinuousScrollAxis);
    atomic_store(result, (unint64_t *)&qword_100157320);
  }

  return result;
}

unint64_t sub_1000AC564()
{
  unint64_t result = qword_100157328;
  if (!qword_100157328)
  {
    unint64_t result = swift_getWitnessTable(&unk_10011858C, &type metadata for ContinuousScrollMode);
    atomic_store(result, (unint64_t *)&qword_100157328);
  }

  return result;
}

ValueMetadata *type metadata accessor for EventType()
{
  return &type metadata for EventType;
}

ValueMetadata *type metadata accessor for DeviceTransportType()
{
  return &type metadata for DeviceTransportType;
}

ValueMetadata *type metadata accessor for HandPinchMode()
{
  return &type metadata for HandPinchMode;
}

ValueMetadata *type metadata accessor for HandPinchState()
{
  return &type metadata for HandPinchState;
}

ValueMetadata *type metadata accessor for ContinuousScrollAxis()
{
  return &type metadata for ContinuousScrollAxis;
}

ValueMetadata *type metadata accessor for ContinuousScrollMode()
{
  return &type metadata for ContinuousScrollMode;
}

id sub_1000AC920(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3 = a1 + *a3;
  swift_beginAccess(v3, v7, 0LL, 0LL);
  uint64_t v4 = *(void *)(v3 + 8);
  if (!v4) {
    return 0LL;
  }
  swift_bridgeObjectRetain(v4);
  NSString v5 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v4);
  return v5;
}

uint64_t sub_1000AC9A0(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  if (a3)
  {
    uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    uint64_t v8 = v7;
  }

  else
  {
    uint64_t v6 = 0LL;
    uint64_t v8 = 0LL;
  }

  id v9 = (uint64_t *)(a1 + *a4);
  swift_beginAccess(v9, v12, 1LL, 0LL);
  uint64_t v10 = v9[1];
  uint64_t *v9 = v6;
  v9[1] = v8;
  return swift_bridgeObjectRelease(v10);
}

id sub_1000ACBBC()
{
  Objectint Type = (objc_class *)swift_getObjectType(v0);
  uint64_t v2 = &v0[OBJC_IVAR___HNDEvent_actionOverride];
  *(void *)uint64_t v2 = 0LL;
  *((void *)v2 + 1) = 0LL;
  uint64_t v3 = &v0[OBJC_IVAR___HNDEvent_hardwareIdentifier];
  *(void *)uint64_t v3 = 0LL;
  *((void *)v3 + 1) = 0LL;
  *(_DWORD *)&v0[OBJC_IVAR___HNDEvent_type] = 0;
  uint64_t v4 = &v0[OBJC_IVAR___HNDEvent_location];
  *(void *)uint64_t v4 = 0LL;
  *((void *)v4 + 1) = 0LL;
  *(void *)&v0[OBJC_IVAR___HNDEvent_deltaX] = 0LL;
  *(void *)&v0[OBJC_IVAR___HNDEvent_deltaY] = 0LL;
  *(void *)&v0[OBJC_IVAR___HNDEvent_buttonNumber] = 0LL;
  swift_beginAccess(v2, v11, 1LL, 0LL);
  uint64_t v5 = *((void *)v2 + 1);
  *(void *)uint64_t v2 = 0LL;
  *((void *)v2 + 1) = 0LL;
  uint64_t v6 = v0;
  swift_bridgeObjectRelease(v5);
  swift_beginAccess(v3, v10, 1LL, 0LL);
  uint64_t v7 = *((void *)v3 + 1);
  *(void *)uint64_t v3 = 0LL;
  *((void *)v3 + 1) = 0LL;
  swift_bridgeObjectRelease(v7);
  v6[OBJC_IVAR___HNDEvent_isEyeTrackingEvent] = 0;
  v6[OBJC_IVAR___HNDEvent_isVirtualTrackpadEvent] = 0;
  v6[OBJC_IVAR___HNDEvent_isGamepadEvent] = 0;

  v9.receiver = v6;
  v9.super_class = ObjectType;
  return objc_msgSendSuper2(&v9, "init");
}

uint64_t sub_1000ACD54()
{
  Objectint Type = (objc_class *)swift_getObjectType(v0);
  uint64_t v2 = sub_1000ABFEC(&qword_100157218);
  uint64_t v3 = swift_allocObject(v2, 352LL, 7LL);
  *(_OWORD *)(v3 + 16) = xmmword_1001186C0;
  v36.receiver = v0;
  v36.super_class = ObjectType;
  id v4 = objc_msgSendSuper2(&v36, "description");
  uint64_t v5 = static String._unconditionallyBridgeFromObjectiveC(_:)(v4);
  uint64_t v7 = v6;

  *(void *)(v3 + 56) = &type metadata for String;
  unint64_t v8 = sub_1000AD0A8();
  *(void *)(v3 + 64) = v8;
  *(void *)(v3 + 32) = v5;
  *(void *)(v3 + 40) = v7;
  objc_super v9 = &v0[OBJC_IVAR___HNDEvent_type];
  swift_beginAccess(&v0[OBJC_IVAR___HNDEvent_type], v35, 0LL, 0LL);
  unint64_t v10 = 0xE400000000000000LL;
  uint64_t v11 = 1819047246LL;
  switch(*(_DWORD *)v9)
  {
    case 0:
      break;
    case 1:
      unint64_t v10 = 0xEF6E776F446E6F74LL;
      goto LABEL_5;
    case 2:
      unint64_t v10 = 0xED000070556E6F74LL;
LABEL_5:
      uint64_t v11 = 0x7475426573756F4DLL;
      break;
    case 3:
      unint64_t v10 = 0xEA00000000006465LL;
      uint64_t v11 = 0x766F4D6573756F4DLL;
      break;
    case 4:
      unint64_t v10 = 0xEB000000006C6565LL;
      uint64_t v11 = 0x68576C6C6F726353LL;
      break;
    default:
      v34[0] = *(_DWORD *)v9;
      _diagnoseUnexpectedEnumCaseValue<A, B>(type:rawValue:)( &type metadata for EventType,  v34,  &type metadata for EventType,  &type metadata for Int32);
      __break(1u);
      JUMPOUT(0x1000AD094LL);
  }

  *(void *)(v3 + 96) = &type metadata for String;
  *(void *)(v3 + 104) = v8;
  *(void *)(v3 + 72) = v11;
  *(void *)(v3 + 80) = v10;
  swift_beginAccess(&v0[OBJC_IVAR___HNDEvent_location], v34, 0LL, 0LL);
  Class isa = CGPoint._bridgeToObjectiveC()().super.isa;
  *(void *)(v3 + 136) = sub_1000AD0EC();
  *(void *)(v3 + 144) = sub_1000AD128();
  *(void *)(v3 + 112) = isa;
  uint64_t v13 = &v0[OBJC_IVAR___HNDEvent_deltaX];
  swift_beginAccess(&v0[OBJC_IVAR___HNDEvent_deltaX], v33, 0LL, 0LL);
  uint64_t v14 = *(void *)v13;
  *(void *)(v3 + 176) = &type metadata for CGFloat;
  unint64_t v15 = sub_1000AD170();
  *(void *)(v3 + 184) = v15;
  *(void *)(v3 + 152) = v14;
  id v16 = &v0[OBJC_IVAR___HNDEvent_deltaY];
  swift_beginAccess(&v0[OBJC_IVAR___HNDEvent_deltaY], v32, 0LL, 0LL);
  uint64_t v17 = *(void *)v16;
  *(void *)(v3 + 216) = &type metadata for CGFloat;
  *(void *)(v3 + 224) = v15;
  *(void *)(v3 + 192) = v17;
  uint64_t v18 = &v0[OBJC_IVAR___HNDEvent_buttonNumber];
  swift_beginAccess(&v0[OBJC_IVAR___HNDEvent_buttonNumber], v31, 0LL, 0LL);
  uint64_t v19 = *(void *)v18;
  *(void *)(v3 + 256) = &type metadata for Int;
  *(void *)(v3 + 264) = &protocol witness table for Int;
  *(void *)(v3 + 232) = v19;
  uint64_t v20 = &v0[OBJC_IVAR___HNDEvent_actionOverride];
  swift_beginAccess(&v0[OBJC_IVAR___HNDEvent_actionOverride], v30, 0LL, 0LL);
  uint64_t v21 = *((void *)v20 + 1);
  v29[0] = *(void *)v20;
  v29[1] = v21;
  swift_bridgeObjectRetain(v21);
  uint64_t v22 = sub_1000ABFEC(&qword_1001573A0);
  uint64_t v23 = String.init<A>(describing:)(v29, v22);
  *(void *)(v3 + 296) = &type metadata for String;
  *(void *)(v3 + 304) = v8;
  *(void *)(v3 + 272) = v23;
  *(void *)(v3 + 280) = v24;
  uint64_t v25 = &v0[OBJC_IVAR___HNDEvent_isEyeTrackingEvent];
  __n128 v26 = swift_beginAccess(v25, v29, 0LL, 0LL);
  char v27 = *v25;
  *(void *)(v3 + 336) = &type metadata for Bool;
  *(void *)(v3 + 344) = &protocol witness table for Bool;
  *(_BYTE *)(v3 + 312) = v27;
  return String.init(format:_:)(0xD000000000000067LL, 0x80000001000E9070LL, v3, v26);
}

unint64_t sub_1000AD0A8()
{
  unint64_t result = qword_100157380;
  if (!qword_100157380)
  {
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for String, &type metadata for String);
    atomic_store(result, (unint64_t *)&qword_100157380);
  }

  return result;
}

unint64_t sub_1000AD0EC()
{
  unint64_t result = qword_100157388;
  if (!qword_100157388)
  {
    uint64_t v1 = objc_opt_self(&OBJC_CLASS___NSValue);
    unint64_t result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_100157388);
  }

  return result;
}

unint64_t sub_1000AD128()
{
  unint64_t result = qword_100157390;
  if (!qword_100157390)
  {
    unint64_t v1 = sub_1000AD0EC();
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for NSObject, v1);
    atomic_store(result, (unint64_t *)&qword_100157390);
  }

  return result;
}

unint64_t sub_1000AD170()
{
  unint64_t result = qword_100157398;
  if (!qword_100157398)
  {
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for CGFloat, &type metadata for CGFloat);
    atomic_store(result, (unint64_t *)&qword_100157398);
  }

  return result;
}

id sub_1000AD1B4()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType(v0);
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for Event()
{
  return objc_opt_self(&OBJC_CLASS___HNDEvent);
}

__n128 sub_1000AD248(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t sub_1000AD258(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0LL;
  }
}

uint64_t sub_1000AD278(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)__n128 result = (a2 - 1);
    *(void *)(result + _Block_object_dispose(va, 8) = 0LL;
    if (!a3) {
      return result;
    }
    char v3 = 1;
  }

  else
  {
    if (!a3) {
      return result;
    }
    char v3 = 0;
  }

  *(_BYTE *)(result + 16) = v3;
  return result;
}

void type metadata accessor for CGPoint()
{
  if (!qword_1001573D0)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata(0LL, &unk_100125388);
    if (!v1) {
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_1001573D0);
    }
  }

uint64_t static AXPrefsBridge.voiceSelection(forLanguageCode:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[6] = a2;
  v3[7] = a3;
  void v3[5] = a1;
  uint64_t v4 = sub_1000ABFEC(&qword_1001573E0);
  v3[8] = swift_task_alloc((*(void *)(*(void *)(v4 - 8) + 64LL) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v5 = type metadata accessor for Locale.Language(0LL);
  void v3[9] = v5;
  uint64_t v6 = *(void *)(v5 - 8);
  v3[10] = v6;
  v3[11] = swift_task_alloc((*(void *)(v6 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v7 = sub_1000ABFEC(&qword_1001573E8);
  v3[12] = swift_task_alloc((*(void *)(*(void *)(v7 - 8) + 64LL) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v8 = type metadata accessor for Locale(0LL);
  v3[13] = v8;
  uint64_t v9 = *(void *)(v8 - 8);
  v3[14] = v9;
  v3[15] = swift_task_alloc((*(void *)(v9 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  return swift_task_switch(sub_1000AD3C8, 0LL, 0LL);
}

uint64_t sub_1000AD3C8()
{
  uint64_t v2 = v0[10];
  uint64_t v1 = v0[11];
  uint64_t v3 = v0[9];
  uint64_t v5 = v0[6];
  uint64_t v4 = v0[7];
  swift_bridgeObjectRetain(v4);
  Locale.init(withAXRemapping:)(v5, v4);
  type metadata accessor for AXPreferences(0LL);
  uint64_t v6 = (char *)static AXPreferences.shared.getter();
  uint64_t v7 = (id *)&v6[direct field offset for AXPreferences.assistiveTouch];
  swift_beginAccess(&v6[direct field offset for AXPreferences.assistiveTouch], v0 + 2, 0LL, 0LL);
  id v8 = *v7;

  uint64_t v9 = AXPreferences.AssistiveTouch.defaultVoiceSelectionsByLanguage.getter();
  v0[16] = v9;

  uint64_t v10 = Locale.language.getter();
  Locale.Language.languageCode.getter(v10);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  type metadata accessor for VoiceResolver(0LL);
  uint64_t v11 = static VoiceResolver.shared.getter();
  v0[17] = v11;
  id v12 = (void *)swift_task_alloc(async function pointer to Dictionary<>.selection(forLanguage:withResolver:exists:)[1]);
  v0[18] = v12;
  void *v12 = v0;
  v12[1] = sub_1000AD508;
  return Dictionary<>.selection(forLanguage:withResolver:exists:)(v0[12], v0[8], v11, 0LL, v9);
}

uint64_t sub_1000AD508()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 136LL);
  uint64_t v2 = *(void *)(*(void *)v0 + 128LL);
  uint64_t v3 = *(void *)(*(void *)v0 + 64LL);
  swift_task_dealloc(*(void *)(*(void *)v0 + 144LL));
  swift_release(v1);
  swift_bridgeObjectRelease(v2);
  sub_1000ADDB8(v3, &qword_1001573E0);
  return swift_task_switch(sub_1000AD58C, 0LL, 0LL);
}

uint64_t sub_1000AD58C()
{
  uint64_t v1 = *(void *)(v0 + 96);
  uint64_t v2 = type metadata accessor for VoiceSelection(0LL);
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v3 + 48))(v1, 1LL, v2);
  if ((_DWORD)result == 1)
  {
    __break(1u);
  }

  else
  {
    uint64_t v5 = *(void *)(v0 + 120);
    uint64_t v6 = *(void *)(v0 + 88);
    uint64_t v7 = *(void *)(v0 + 64);
    uint64_t v8 = *(void *)(v0 + 40);
    (*(void (**)(uint64_t, void))(*(void *)(v0 + 112) + 8LL))(v5, *(void *)(v0 + 104));
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 32))(v8, v1, v2);
    swift_task_dealloc(v5);
    swift_task_dealloc(v1);
    swift_task_dealloc(v6);
    swift_task_dealloc(v7);
    return (*(uint64_t (**)(void))(v0 + 8))();
  }

  return result;
}

uint64_t sub_1000AD780(uint64_t a1, const void *a2)
{
  uint64_t v5 = type metadata accessor for VoiceSelection(0LL);
  v2[2] = v5;
  uint64_t v6 = *(void *)(v5 - 8);
  v2[3] = v6;
  uint64_t v7 = swift_task_alloc((*(void *)(v6 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  void v2[4] = v7;
  void v2[5] = _Block_copy(a2);
  uint64_t v8 = static String._unconditionallyBridgeFromObjectiveC(_:)(a1);
  uint64_t v10 = v9;
  v2[6] = v9;
  uint64_t v11 = (void *)swift_task_alloc(dword_1001573DC);
  v2[7] = v11;
  void *v11 = v2;
  v11[1] = sub_1000AD830;
  return static AXPrefsBridge.voiceSelection(forLanguageCode:)(v7, v8, v10);
}

uint64_t sub_1000AD830()
{
  uint64_t v1 = *(void *)(*v0 + 48);
  uint64_t v3 = *(void *)(*v0 + 32);
  uint64_t v2 = *(void (***)(void, void))(*v0 + 40);
  uint64_t v4 = *(void *)(*v0 + 16);
  uint64_t v5 = *(void *)(*v0 + 24);
  uint64_t v9 = *v0;
  swift_task_dealloc(*(void *)(*v0 + 56));
  uint64_t v6 = swift_bridgeObjectRelease(v1);
  uint64_t v7 = (void *)VoiceSelection._bridgeToObjectiveC()(v6);
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v3, v4);
  ((void (**)(void, void *))v2)[2](v2, v7);

  _Block_release(v2);
  swift_task_dealloc(v3);
  return (*(uint64_t (**)(void))(v9 + 8))();
}

id AXPrefsBridge.__allocating_init()()
{
  return [objc_allocWithZone(v0) init];
}

id AXPrefsBridge.init()()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AXPrefsBridge();
  return objc_msgSendSuper2(&v2, "init");
}

uint64_t type metadata accessor for AXPrefsBridge()
{
  return objc_opt_self(&OBJC_CLASS____TtC15assistivetouchd13AXPrefsBridge);
}

id AXPrefsBridge.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AXPrefsBridge();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t sub_1000AD9B4()
{
  _Block_release(*(const void **)(v0 + 24));
  return swift_deallocObject(v0, 40LL, 7LL);
}

uint64_t sub_1000AD9E0()
{
  uint64_t v2 = *(void *)(v0 + 16);
  uint64_t v3 = *(const void **)(v0 + 24);
  uint64_t v4 = (void *)swift_task_alloc(dword_100157424);
  *(void *)(v1 + 16) = v4;
  void *v4 = v1;
  v4[1] = sub_1000ADA4C;
  return ((uint64_t (*)(uint64_t, const void *))((char *)&dword_100157420 + dword_100157420))(v2, v3);
}

uint64_t sub_1000ADA4C()
{
  uint64_t v2 = *v0;
  swift_task_dealloc(*(void *)(*v0 + 16));
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_1000ADA94(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = (uint64_t (*)(void))((char *)a3 + *a3);
  uint64_t v4 = (void *)swift_task_alloc(a3[1]);
  *(void *)(v3 + 16) = v4;
  void *v4 = v3;
  v4[1] = sub_1000ADF38;
  return v6();
}

uint64_t sub_1000ADAEC()
{
  uint64_t v2 = v0[2];
  uint64_t v3 = v0[3];
  uint64_t v4 = (int *)v0[4];
  uint64_t v5 = (void *)swift_task_alloc(dword_100157434);
  *(void *)(v1 + 16) = v5;
  void *v5 = v1;
  v5[1] = sub_1000ADF38;
  return ((uint64_t (*)(uint64_t, uint64_t, int *))((char *)&dword_100157430 + dword_100157430))(v2, v3, v4);
}

uint64_t sub_1000ADB64(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  uint64_t v7 = (uint64_t (*)(void))((char *)a4 + *a4);
  uint64_t v5 = (void *)swift_task_alloc(a4[1]);
  *(void *)(v4 + 16) = v5;
  void *v5 = v4;
  v5[1] = sub_1000ADF38;
  return v7();
}

uint64_t sub_1000ADBBC()
{
  return swift_deallocObject(v0, 48LL, 7LL);
}

uint64_t sub_1000ADBE8(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = (int *)v1[4];
  uint64_t v7 = (void *)swift_task_alloc(dword_100157444);
  *(void *)(v2 + 16) = v7;
  void *v7 = v2;
  v7[1] = sub_1000ADF38;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, int *))((char *)&dword_100157440 + dword_100157440))( a1,  v4,  v5,  v6);
}

uint64_t sub_1000ADC6C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for TaskPriority(0LL);
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1LL, v6) == 1)
  {
    sub_1000ADDB8(a1, &qword_100157418);
    uint64_t v8 = 7168LL;
    uint64_t v9 = *(void *)(a3 + 16);
    if (v9)
    {
LABEL_3:
      uint64_t v10 = *(void *)(a3 + 24);
      Objectint Type = swift_getObjectType(v9);
      swift_unknownObjectRetain(v9);
      uint64_t v12 = dispatch thunk of Actor.unownedExecutor.getter(ObjectType, v10);
      uint64_t v14 = v13;
      swift_unknownObjectRelease(v9);
      goto LABEL_6;
    }
  }

  else
  {
    unsigned __int8 v15 = TaskPriority.rawValue.getter();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    uint64_t v8 = v15 | 0x1C00LL;
    uint64_t v9 = *(void *)(a3 + 16);
    if (v9) {
      goto LABEL_3;
    }
  }

  uint64_t v12 = 0LL;
  uint64_t v14 = 0LL;
LABEL_6:
  uint64_t v16 = swift_allocObject(&unk_100125428, 32LL, 7LL);
  *(void *)(v16 + 16) = a2;
  *(void *)(v16 + 24) = a3;
  if (v14 | v12)
  {
    v19[0] = 0LL;
    v19[1] = 0LL;
    uint64_t v17 = v19;
    v19[2] = v12;
    v19[3] = v14;
  }

  else
  {
    uint64_t v17 = 0LL;
  }

  return swift_task_create(v8, v17, (char *)&type metadata for () + 8, &unk_100157458, v16);
}

uint64_t sub_1000ADDB8(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_1000ABFEC(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8LL))(a1, v3);
  return a1;
}

uint64_t sub_1000ADDF4(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc(a2[1]);
  *(void *)(v2 + 16) = v4;
  void *v4 = v2;
  v4[1] = sub_1000ADE58;
  return v6(a1);
}

uint64_t sub_1000ADE58()
{
  uint64_t v2 = *v0;
  swift_task_dealloc(*(void *)(*v0 + 16));
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_1000ADEA4()
{
  return swift_deallocObject(v0, 32LL, 7LL);
}

uint64_t sub_1000ADEC8(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc(dword_100157454);
  *(void *)(v2 + 16) = v5;
  void *v5 = v2;
  v5[1] = sub_1000ADA4C;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_100157450 + dword_100157450))(a1, v4);
}

int main(int argc, const char **argv, const char **envp)
{
  int v3 = static CommandLine.argc.getter(*(void *)&argc, argv, envp);
  uint64_t v4 = (char **)static CommandLine.unsafeArgv.getter();
  unint64_t v5 = sub_1000AE004();
  ObjCClassFromMetadata = (objc_class *)swift_getObjCClassFromMetadata(v5);
  uint64_t v7 = NSStringFromClass(ObjCClassFromMetadata);
  if (!v7)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)(0LL);
    uint64_t v9 = v8;
    uint64_t v7 = (NSString *)String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v9);
  }

  uint64_t v10 = type metadata accessor for ApplicationDelegate();
  uint64_t v11 = (objc_class *)swift_getObjCClassFromMetadata(v10);
  uint64_t v12 = NSStringFromClass(v11);
  if (!v12)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)(0LL);
    uint64_t v14 = v13;
    uint64_t v12 = (NSString *)String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v14);
  }

  UIApplicationMain(v3, v4, v7, v12);

  return 0;
}

unint64_t sub_1000AE004()
{
  unint64_t result = qword_100157230;
  if (!qword_100157230)
  {
    uint64_t v1 = objc_opt_self(&OBJC_CLASS___HNDApplication);
    unint64_t result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_100157230);
  }

  return result;
}

uint64_t type metadata accessor for ApplicationDelegate()
{
  return objc_opt_self(&OBJC_CLASS____TtC15assistivetouchd19ApplicationDelegate);
}

id sub_1000AE220()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ApplicationDelegate();
  return objc_msgSendSuper2(&v2, "dealloc");
}

void sub_1000AE260()
{
  uint64_t v1 = static os_log_type_t.default.getter();
  id v2 = (id)AXLogCommon();
  if (v2)
  {
    int v3 = v2;
    uint64_t v4 = sub_1000ABFEC(&qword_100157218);
    uint64_t v5 = swift_allocObject(v4, 72LL, 7LL);
    *(_OWORD *)(v5 + 16) = xmmword_100118230;
    *(void *)(v5 + 56) = &type metadata for String;
    *(void *)(v5 + 64) = sub_1000AD0A8();
    *(void *)(v5 + 32) = 0x2928706F7473LL;
    *(void *)(v5 + 40) = 0xE600000000000000LL;
    os_log(_:dso:log:_:_:)( v1,  &_mh_execute_header,  v3,  "%s: stop called, overriding keep alive to NO so we don't relaunch",  v6);

    swift_bridgeObjectRelease(v5);
    [v0 setKeepAlive:0];
    [*(id *)&v0[OBJC_IVAR____TtC15assistivetouchd19ApplicationDelegate_runtimeManager] cleanupRuntime];
    id v7 = [(id)objc_opt_self(UIApplication) sharedApplication];
    [v7 terminateWithSuccess];
  }

  else
  {
    __break(1u);
  }

void *sub_1000AE408()
{
  uint64_t v1 = (void **)(v0 + OBJC_IVAR___HNDSpringAnimationFactory_timingFunction);
  swift_beginAccess(v0 + OBJC_IVAR___HNDSpringAnimationFactory_timingFunction, v5, 0LL, 0LL);
  id v2 = *v1;
  id v3 = v2;
  return v2;
}

void sub_1000AE4B0(void *a1)
{
  id v3 = (void **)(v1 + OBJC_IVAR___HNDSpringAnimationFactory_timingFunction);
  swift_beginAccess(v3, v5, 1LL, 0LL);
  uint64_t v4 = *v3;
  void *v3 = a1;
}

void *sub_1000AE500(uint64_t a1)
{
  return &j__swift_endAccess;
}

id sub_1000AE544()
{
  uint64_t v1 = OBJC_IVAR___HNDSpringAnimationFactory____lazy_storage___springAnimation;
  id v2 = *(void **)(v0 + OBJC_IVAR___HNDSpringAnimationFactory____lazy_storage___springAnimation);
  if (v2)
  {
    id v3 = *(id *)(v0 + OBJC_IVAR___HNDSpringAnimationFactory____lazy_storage___springAnimation);
  }

  else
  {
    id v4 = [objc_allocWithZone(CASpringAnimation) init];
    [v4 setMass:*(double *)(v0 + OBJC_IVAR___HNDSpringAnimationFactory_mass)];
    [v4 setStiffness:*(double *)(v0 + OBJC_IVAR___HNDSpringAnimationFactory_stiffness)];
    [v4 setDamping:*(double *)(v0 + OBJC_IVAR___HNDSpringAnimationFactory_damping)];
    uint64_t v5 = *(void **)(v0 + v1);
    *(void *)(v0 + v1) = v4;
    id v3 = v4;

    id v2 = 0LL;
  }

  id v6 = v2;
  return v3;
}

uint64_t type metadata accessor for SpringAnimationFactory()
{
  return objc_opt_self(&OBJC_CLASS___HNDSpringAnimationFactory);
}

id sub_1000AE730()
{
  id result = (id)(*(uint64_t (**)(void))((swift_isaMask & *v0) + 0xC0LL))();
  if (!result)
  {
    uint64_t v2 = static os_log_type_t.info.getter();
    id result = (id)ASTLogCommon(v2);
    if (result)
    {
      id v3 = result;

      return [objc_allocWithZone(CAMediaTimingFunction) init];
    }

    else
    {
      __break(1u);
    }
  }

  return result;
}

id sub_1000AE8B8()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SpringAnimationFactory();
  return objc_msgSendSuper2(&v2, "dealloc");
}

void sub_1000AE920(uint64_t a1, os_log_s *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "Removing devices: %@", (uint8_t *)&v2, 0xCu);
}

void sub_1000AE994(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_debug_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_DEBUG,  "Device: %@,\ndidPostEvent: %@",  (uint8_t *)&v3,  0x16u);
}

void sub_1000AEA18(uint64_t a1, os_log_s *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "Error initializing IPC Service with error: %@",  (uint8_t *)&v2,  0xCu);
}

void sub_1000AEA8C( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000AEABC( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000AEAEC( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000AEB1C()
{
}

void sub_1000AEB48()
{
}

void sub_1000AEB74()
{
}

void sub_1000AEBA0()
{
}

void sub_1000AEBCC()
{
}

void sub_1000AEC48( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000AECAC()
{
}

void sub_1000AECE4(id *a1, os_log_s *a2)
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([*a1 fingerController]);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([*a1 fingerController]);
  uint8_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 fingerModels]);
  int v7 = 138412546;
  uint64_t v8 = v4;
  __int16 v9 = 2112;
  uint64_t v10 = v6;
  _os_log_fault_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_FAULT,  "Finger models should not be 0: %@ - %@",  (uint8_t *)&v7,  0x16u);
}

void sub_1000AEDB8()
{
}

void sub_1000AEDE4()
{
}

void sub_1000AEE10(uint64_t a1, os_log_s *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "handleButtonEvent=%@", (uint8_t *)&v2, 0xCu);
}

void sub_1000AEE84()
{
}

void sub_1000AEEB0( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000AEF14(uint64_t *a1, int a2, os_log_t log)
{
  uint64_t v3 = *a1;
  int v4 = 138412546;
  uint64_t v5 = v3;
  __int16 v6 = 1024;
  int v7 = a2;
  _os_log_fault_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_FAULT,  "Can't open device: %@, result: %d",  (uint8_t *)&v4,  0x12u);
}

void sub_1000AEF9C()
{
}

void sub_1000AEFC8(void *a1, const char *a2, os_log_s *a3)
{
  int v7 = v6;
  id v8 = v6;
  int v9 = 138413058;
  uint64_t v10 = v7;
  __int16 v11 = 2080;
  Name = sel_getName(a2);
  __int16 v13 = 1024;
  unsigned int v14 = [a1 _sessionState];
  __int16 v15 = 1024;
  unsigned int v16 = [a1 _desiredSessionState];
  _os_log_debug_impl( (void *)&_mh_execute_header,  a3,  OS_LOG_TYPE_DEBUG,  "-[%@ %s]: current state: %d, desired: %d",  (uint8_t *)&v9,  0x22u);
}

void sub_1000AF0B8()
{
}

void sub_1000AF0E4(int a1, os_log_s *a2)
{
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "BTLocalDeviceGetConnectedDevices failed: %d",  (uint8_t *)v2,  8u);
  sub_100009830();
}

void sub_1000AF154()
{
}

void sub_1000AF18C()
{
}

void sub_1000AF1B8(const char *a1, os_log_s *a2)
{
  int v3 = 136315138;
  Name = sel_getName(a1);
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "BTDeviceGetAddressString failed in %s",  (uint8_t *)&v3,  0xCu);
}

void sub_1000AF240()
{
}

void sub_1000AF2A0(uint64_t a1, os_log_s *a2)
{
  int v2 = *(_DWORD *)(a1 + 56);
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  int v5 = 138412802;
  uint64_t v6 = v3;
  __int16 v7 = 1024;
  int v8 = v2;
  __int16 v9 = 2112;
  uint64_t v10 = v4;
  _os_log_debug_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_DEBUG,  "Attempting to send custom message to device %@ type %d data %@",  (uint8_t *)&v5,  0x1Cu);
}

void sub_1000AF334()
{
}

void sub_1000AF394(uint64_t a1, os_log_s *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = *(unsigned __int8 *)(a1 + 52);
  int v4 = *(_DWORD *)(a1 + 48);
  int v5 = 138412802;
  uint64_t v6 = v2;
  __int16 v7 = 1024;
  int v8 = v3;
  __int16 v9 = 1024;
  int v10 = v4;
  _os_log_debug_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_DEBUG,  "Attempting to send configuration message to device %@ type %d value %u",  (uint8_t *)&v5,  0x18u);
  sub_100026A2C();
}

void sub_1000AF424( os_log_s *a1, double a2, double a3, double a4, double a5, CGFloat a6, CGFloat a7, CGFloat a8, CGFloat a9)
{
  unsigned int v14 = NSStringFromCGRect(*(CGRect *)&a2);
  __int16 v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  v22.origin.CGFloat x = a6;
  v22.origin.double y = a7;
  v22.size.CGFloat width = a8;
  v22.size.double height = a9;
  unsigned int v16 = NSStringFromCGRect(v22);
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
  int v18 = 138412546;
  uint64_t v19 = v15;
  __int16 v20 = 2112;
  uint64_t v21 = v17;
  _os_log_fault_impl( (void *)&_mh_execute_header,  a1,  OS_LOG_TYPE_FAULT,  "HNDRocker (frame: %@) is out of bounds from screen: %@",  (uint8_t *)&v18,  0x16u);
}

void sub_1000AF50C(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_fault_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_FAULT,  "_centerBackButtonToView: viewForCentering is nil",  v1,  2u);
}

void sub_1000AF54C(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "!!!Error!!!!!: Touch events won't go through now! We tried to transition from menu to nubbit without disabling userI nteraction on the _rockerDismiss view! Caller needs to make sure to properly call -[HNDDisplayManager showMenu:] bef ore entering this function",  v1,  2u);
}

void sub_1000AF58C( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000AF604(int a1, os_log_s *a2)
{
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Error opening device: %d", (uint8_t *)v2, 8u);
}

void sub_1000AF678(void *a1, os_log_s *a2)
{
  int v3 = NSStringFromCGPoint(v7);
  int v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  int v5 = 138543362;
  uint64_t v6 = v4;
  _os_log_debug_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_DEBUG,  "Interrupting existing long press at point %{public}@",  (uint8_t *)&v5,  0xCu);
}

void sub_1000AF710(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_debug_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_DEBUG,  "Ended a long press that had been interrupted before, so not doing anything.",  v1,  2u);
}

void sub_1000AF750(char a1, os_log_s *a2, double a3, double a4)
{
  uint64_t v6 = NSStringFromCGPoint(*(CGPoint *)&a3);
  CGPoint v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  int v8 = 138543618;
  __int16 v9 = v7;
  __int16 v10 = 1024;
  int v11 = a1 & 1;
  _os_log_debug_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_DEBUG,  "Long press at point %{public}@ down %i",  (uint8_t *)&v8,  0x12u);
}

void sub_1000AF800()
{
  sub_100026A00((void *)&_mh_execute_header, v0, v1, "BTDeviceGetConnectedServices returned %d for %s", v2, v3);
}

void sub_1000AF864()
{
  sub_100026A00((void *)&_mh_execute_header, v0, v1, "BTDeviceGetDeviceID returned %d for %s", v2, v3);
}

void sub_1000AF8C8(int a1, os_log_s *a2)
{
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "BTDeviceGetAddressString returned %d",  (uint8_t *)v2,  8u);
}

void sub_1000AF93C(uint64_t a1, os_log_s *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_fault_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_FAULT,  "Received nil primary information for menu item: %@. Not adding it to the menu.",  (uint8_t *)&v2,  0xCu);
}

void sub_1000AF9F0(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "Was told to stop. Exiting before system app became ready.",  v1,  2u);
}

void sub_1000AFA30(os_log_t log)
{
  int v1 = 138412290;
  uint64_t v2 = qword_100157750;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "Unable to get serial number for device. Falling back to using generated UUID %@",  (uint8_t *)&v1,  0xCu);
}

void sub_1000AFAB0(os_log_t log)
{
  *(_WORD *)int v1 = 0;
  _os_log_fault_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_FAULT,  "Unexpectedly found unfinished speech actions after calling completion blocks",  v1,  2u);
}

void sub_1000AFAF0(void *a1, os_log_s *a2)
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([a1 localizedDescription]);
  sub_100092778();
  sub_10009276C((void *)&_mh_execute_header, a2, v4, "Failed create audio player for sound: %@", v5);
}

void sub_1000AFB78()
{
}

void sub_1000AFBDC(int a1, os_log_s *a2)
{
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "Failed to set static ducking volume with error: %d.",  (uint8_t *)v2,  8u);
}

void sub_1000AFC50()
{
}

void sub_1000AFCB4()
{
}

void sub_1000AFD18(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "Back item has nothing to do. %@ - %@",  (uint8_t *)&v3,  0x16u);
}

void sub_1000AFD9C( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000AFDD0( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000AFE04(uint64_t a1, os_log_s *a2)
{
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "Unable to complete sysdiagnose. Error: %{public}@",  (uint8_t *)&v2,  0xCu);
}

id objc_msgSend_CGColor(void *a1, const char *a2, ...)
{
  return _[a1 CGColor];
}

id objc_msgSend_CGPath(void *a1, const char *a2, ...)
{
  return _[a1 CGPath];
}

id objc_msgSend_CGPointValue(void *a1, const char *a2, ...)
{
  return _[a1 CGPointValue];
}

id objc_msgSend_CGRectValue(void *a1, const char *a2, ...)
{
  return _[a1 CGRectValue];
}

id objc_msgSend_CGSizeValue(void *a1, const char *a2, ...)
{
  return _[a1 CGSizeValue];
}

id objc_msgSend_URLForResource_withExtension_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "URLForResource:withExtension:");
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

id objc_msgSend__accessibilityDisplayId(void *a1, const char *a2, ...)
{
  return _[a1 _accessibilityDisplayId];
}

id objc_msgSend__accessibilityMoveFocusWithHeading_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_accessibilityMoveFocusWithHeading:");
}

id objc_msgSend__accessibilityNativeFocusElement(void *a1, const char *a2, ...)
{
  return _[a1 _accessibilityNativeFocusElement];
}

id objc_msgSend__accessibilityScannerCurrentFocusContext(void *a1, const char *a2, ...)
{
  return _[a1 _accessibilityScannerCurrentFocusContext];
}

id objc_msgSend__accessibilityScannerCurrentLoopElements(void *a1, const char *a2, ...)
{
  return _[a1 _accessibilityScannerCurrentLoopElements];
}

id objc_msgSend__accessibilityScannerCurrentLoopElementsForFocusContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_accessibilityScannerCurrentLoopElementsForFocusContext:");
}

id objc_msgSend__accessibilityScannerCurrentLoopIndex(void *a1, const char *a2, ...)
{
  return _[a1 _accessibilityScannerCurrentLoopIndex];
}

id objc_msgSend__actionButtonPressed(void *a1, const char *a2, ...)
{
  return _[a1 _actionButtonPressed];
}

id objc_msgSend__actionIdentifierForKeyCode_withType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_actionIdentifierForKeyCode:withType:");
}

id objc_msgSend__actionIdentifierForSwitch_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_actionIdentifierForSwitch:");
}

id objc_msgSend__actionIdentifierWithType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_actionIdentifierWithType:");
}

id objc_msgSend__activateLockButton(void *a1, const char *a2, ...)
{
  return _[a1 _activateLockButton];
}

id objc_msgSend__actualDistanceForFingerTrail(void *a1, const char *a2, ...)
{
  return _[a1 _actualDistanceForFingerTrail];
}

id objc_msgSend__actuallyHandleSelectAction(void *a1, const char *a2, ...)
{
  return _[a1 _actuallyHandleSelectAction];
}

id objc_msgSend__addArrowHeadToPath_baseLeftPoint_baseRightPoint_tipPoint_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_addArrowHeadToPath:baseLeftPoint:baseRightPoint:tipPoint:");
}

id objc_msgSend__addCircleWithRadius_center_inContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_addCircleWithRadius:center:inContext:");
}

id objc_msgSend__addCircleWithRadius_inContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_addCircleWithRadius:inContext:");
}

id objc_msgSend__addConstraint_priority_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_addConstraint:priority:");
}

id objc_msgSend__addFavoriteBoxPressed(void *a1, const char *a2, ...)
{
  return _[a1 _addFavoriteBoxPressed];
}

id objc_msgSend__addGrayArrowHeadLineToPath_bottomPoint_tipPoint_sideAngle_sideLength_outlineThickness_innerThickness_( void *a1, const char *a2, ...)
{
  return _objc_msgSend( a1,  "_addGrayArrowHeadLineToPath:bottomPoint:tipPoint:sideAngle:sideLength:outlineThickness:innerThickness:");
}

id objc_msgSend__addGrayFingerIfNecessaryToPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_addGrayFingerIfNecessaryToPath:");
}

id objc_msgSend__addNewButtonsToView(void *a1, const char *a2, ...)
{
  return _[a1 _addNewButtonsToView];
}

id objc_msgSend__addPointsToContinuousGestureData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_addPointsToContinuousGestureData:");
}

id objc_msgSend__addPostEventFilterToFetcher_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_addPostEventFilterToFetcher:");
}

id objc_msgSend__addRoundedCornerWithTrueCorner_radius_corner_clockwise_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_addRoundedCornerWithTrueCorner:radius:corner:clockwise:");
}

id objc_msgSend__addTapIfApplicableForElement_toMenuItems_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_addTapIfApplicableForElement:toMenuItems:");
}

id objc_msgSend__addTapReplacementGestureIfApplicableForElement_toMenuItems_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_addTapReplacementGestureIfApplicableForElement:toMenuItems:");
}

id objc_msgSend__additionalMenuItemsForHomeActionForMenu_delegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_additionalMenuItemsForHomeActionForMenu:delegate:");
}

id objc_msgSend__adjustArrowViewsForNumberOfFingers_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_adjustArrowViewsForNumberOfFingers:");
}

id objc_msgSend__adjustOriginValue_forDistance_maximumEndPosition_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_adjustOriginValue:forDistance:maximumEndPosition:");
}

id objc_msgSend__adjustSelectionForTextElement_direction_unit_selectedRange_startingRangeForSelection_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_adjustSelectionForTextElement:direction:unit:selectedRange:startingRangeForSelection:");
}

id objc_msgSend__adjustedXAnchorPositionToClearCornersOfRect_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_adjustedXAnchorPositionToClearCornersOfRect:");
}

id objc_msgSend__allSwitchesInUse(void *a1, const char *a2, ...)
{
  return _[a1 _allSwitchesInUse];
}

id objc_msgSend__angleForDegrees_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_angleForDegrees:");
}

id objc_msgSend__animateWithDuration_delay_options_factory_animations_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_animateWithDuration:delay:options:factory:animations:completion:");
}

id objc_msgSend__applePayButtonPressed_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_applePayButtonPressed:");
}

id objc_msgSend__applicationMatchingBlock_inApplications_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_applicationMatchingBlock:inApplications:");
}

id objc_msgSend__applyLaunchRecipeUUID(void *a1, const char *a2, ...)
{
  return _[a1 _applyLaunchRecipeUUID];
}

id objc_msgSend__applySelectionToAction_selection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_applySelectionToAction:selection:");
}

id objc_msgSend__arrowPath(void *a1, const char *a2, ...)
{
  return _[a1 _arrowPath];
}

id objc_msgSend__assistAppValidationMode(void *a1, const char *a2, ...)
{
  return _[a1 _assistAppValidationMode];
}

id objc_msgSend__assistiveTouchEnabledChange(void *a1, const char *a2, ...)
{
  return _[a1 _assistiveTouchEnabledChange];
}

id objc_msgSend__assistiveTouchSettingsChanged(void *a1, const char *a2, ...)
{
  return _[a1 _assistiveTouchSettingsChanged];
}

id objc_msgSend__astGameControllerEnabled(void *a1, const char *a2, ...)
{
  return _[a1 _astGameControllerEnabled];
}

id objc_msgSend__attemptStopAfterDelay(void *a1, const char *a2, ...)
{
  return _[a1 _attemptStopAfterDelay];
}

id objc_msgSend__attemptToRestoreFocusContext_scannerManager_foundNewElements_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_attemptToRestoreFocusContext:scannerManager:foundNewElements:");
}

id objc_msgSend__attemptToShowVisualsAfterPerformingScreenshot(void *a1, const char *a2, ...)
{
  return _[a1 _attemptToShowVisualsAfterPerformingScreenshot];
}

id objc_msgSend__automationSwitches(void *a1, const char *a2, ...)
{
  return _[a1 _automationSwitches];
}

id objc_msgSend__autoscanToNextFocusContext(void *a1, const char *a2, ...)
{
  return _[a1 _autoscanToNextFocusContext];
}

id objc_msgSend__availableFrameForCenterPointAtSelectionPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_availableFrameForCenterPointAtSelectionPath:");
}

id objc_msgSend__axPrintSubviews_string_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_axPrintSubviews:string:");
}

id objc_msgSend__axSwitchForAccessibilitySwitchSource_eventUsagePage_eventUsage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_axSwitchForAccessibilitySwitchSource:eventUsagePage:eventUsage:");
}

id objc_msgSend__backButtonShouldBeHidden(void *a1, const char *a2, ...)
{
  return _[a1 _backButtonShouldBeHidden];
}

id objc_msgSend__backgroundColorForTheme_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_backgroundColorForTheme:");
}

id objc_msgSend__backgroundImagesForShape_unfocusedImageRef_containingGroupFocusedImageRef_focusedImageRef_( void *a1, const char *a2, ...)
{
  return _objc_msgSend( a1,  "_backgroundImagesForShape:unfocusedImageRef:containingGroupFocusedImageRef:focusedImageRef:");
}

id objc_msgSend__beginAttach(void *a1, const char *a2, ...)
{
  return _[a1 _beginAttach];
}

id objc_msgSend__beginDetach(void *a1, const char *a2, ...)
{
  return _[a1 _beginDetach];
}

id objc_msgSend__beginStateTransitionIfNecessary(void *a1, const char *a2, ...)
{
  return _[a1 _beginStateTransitionIfNecessary];
}

id objc_msgSend__behaviorForElement_manager_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_behaviorForElement:manager:");
}

id objc_msgSend__bestFrameFor90ControlAtAngle_size_centerPoint_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_bestFrameFor90ControlAtAngle:size:centerPoint:");
}

id objc_msgSend__bestScrollMenuItemsForScrollableElement_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_bestScrollMenuItemsForScrollableElement:");
}

id objc_msgSend__bootstrapRegister(void *a1, const char *a2, ...)
{
  return _[a1 _bootstrapRegister];
}

id objc_msgSend__borderBackgroundColorForTheme_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_borderBackgroundColorForTheme:");
}

id objc_msgSend__borderForegroundColorForTheme_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_borderForegroundColorForTheme:");
}

id objc_msgSend__borderPatternForTheme_level_highVisibility_options_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_borderPatternForTheme:level:highVisibility:options:");
}

id objc_msgSend__borderWidthForTheme_level_highVisibility_options_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_borderWidthForTheme:level:highVisibility:options:");
}

id objc_msgSend__boundsInsetForTheme_level_highVisibility_options_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_boundsInsetForTheme:level:highVisibility:options:");
}

id objc_msgSend__cameraButtonDoubleLightPressed(void *a1, const char *a2, ...)
{
  return _[a1 _cameraButtonDoubleLightPressed];
}

id objc_msgSend__cameraButtonLightPressed(void *a1, const char *a2, ...)
{
  return _[a1 _cameraButtonLightPressed];
}

id objc_msgSend__cameraButtonPressed(void *a1, const char *a2, ...)
{
  return _[a1 _cameraButtonPressed];
}

id objc_msgSend__cameraPressed(void *a1, const char *a2, ...)
{
  return _[a1 _cameraPressed];
}

id objc_msgSend__canAutomaticallyPauseScanner(void *a1, const char *a2, ...)
{
  return _[a1 _canAutomaticallyPauseScanner];
}

id objc_msgSend__canPopSheet(void *a1, const char *a2, ...)
{
  return _[a1 _canPopSheet];
}

id objc_msgSend__canTransitionToPhase_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_canTransitionToPhase:");
}

id objc_msgSend__cancelDwellRelatedTimers(void *a1, const char *a2, ...)
{
  return _[a1 _cancelDwellRelatedTimers];
}

id objc_msgSend__cancelIdleTimer(void *a1, const char *a2, ...)
{
  return _[a1 _cancelIdleTimer];
}

id objc_msgSend__cancelMoveTimerAndEndMove_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_cancelMoveTimerAndEndMove:");
}

id objc_msgSend__capitalizedMenuTitle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_capitalizedMenuTitle:");
}

id objc_msgSend__centerBackButtonToView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_centerBackButtonToView:");
}

id objc_msgSend__cleanMenuStacks(void *a1, const char *a2, ...)
{
  return _[a1 _cleanMenuStacks];
}

id objc_msgSend__cleanUpAlternateKeyOperations(void *a1, const char *a2, ...)
{
  return _[a1 _cleanUpAlternateKeyOperations];
}

id objc_msgSend__clearArrowView(void *a1, const char *a2, ...)
{
  return _[a1 _clearArrowView];
}

id objc_msgSend__clearCircleWithRadius_inContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_clearCircleWithRadius:inContext:");
}

id objc_msgSend__clearLineGestureState(void *a1, const char *a2, ...)
{
  return _[a1 _clearLineGestureState];
}

id objc_msgSend__clearTellMeWhenTimer(void *a1, const char *a2, ...)
{
  return _[a1 _clearTellMeWhenTimer];
}

id objc_msgSend__commandAndControlPressed(void *a1, const char *a2, ...)
{
  return _[a1 _commandAndControlPressed];
}

id objc_msgSend__computeScrollViewFrameAndActivationRegions(void *a1, const char *a2, ...)
{
  return _[a1 _computeScrollViewFrameAndActivationRegions];
}

id objc_msgSend__configureMFIAccessoryIfNecessary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_configureMFIAccessoryIfNecessary:");
}

id objc_msgSend__contextId(void *a1, const char *a2, ...)
{
  return _[a1 _contextId];
}

id objc_msgSend__continuousScrollPressed_fromButtonPress_inDirection_iconType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_continuousScrollPressed:fromButtonPress:inDirection:iconType:");
}

id objc_msgSend__controlCenterPressed(void *a1, const char *a2, ...)
{
  return _[a1 _controlCenterPressed];
}

id objc_msgSend__convertPointFromSceneReferenceSpace_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_convertPointFromSceneReferenceSpace:");
}

id objc_msgSend__convertPointInPathWithBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_convertPointInPathWithBlock:");
}

id objc_msgSend__convertPointToSceneReferenceSpace_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_convertPointToSceneReferenceSpace:");
}

id objc_msgSend__convertRectFromSceneReferenceSpace_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_convertRectFromSceneReferenceSpace:");
}

id objc_msgSend__convertRectToSceneReferenceSpace_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_convertRectToSceneReferenceSpace:");
}

id objc_msgSend__copyMenuPathWithNoTipForRect_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_copyMenuPathWithNoTipForRect:");
}

id objc_msgSend__copyMenuPathWithTipForRect_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_copyMenuPathWithTipForRect:");
}

id objc_msgSend__currentAppPids(void *a1, const char *a2, ...)
{
  return _[a1 _currentAppPids];
}

id objc_msgSend__currentApplicationMatchingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_currentApplicationMatchingBlock:");
}

id objc_msgSend__currentElementProvider(void *a1, const char *a2, ...)
{
  return _[a1 _currentElementProvider];
}

id objc_msgSend__currentFocusedPointInScreenCoordinates_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_currentFocusedPointInScreenCoordinates:");
}

id objc_msgSend__currentRockerTranslateY(void *a1, const char *a2, ...)
{
  return _[a1 _currentRockerTranslateY];
}

id objc_msgSend__cursorPathAndFrame_forElementFrame_inDisplayContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_cursorPathAndFrame:forElementFrame:inDisplayContext:");
}

id objc_msgSend__customGesturePressed_fromButtonPress_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_customGesturePressed:fromButtonPress:");
}

id objc_msgSend__customsPressed_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_customsPressed:");
}

id objc_msgSend__defaultNubbitHitboxActivationFactor(void *a1, const char *a2, ...)
{
  return _[a1 _defaultNubbitHitboxActivationFactor];
}

id objc_msgSend__deferFocusToNativeFocusElementIfNeeded_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_deferFocusToNativeFocusElementIfNeeded:");
}

id objc_msgSend__depthForElement_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_depthForElement:");
}

id objc_msgSend__descriptionForSelectBehavior_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_descriptionForSelectBehavior:");
}

id objc_msgSend__desiredSessionState(void *a1, const char *a2, ...)
{
  return _[a1 _desiredSessionState];
}

id objc_msgSend__detectionModePresssed(void *a1, const char *a2, ...)
{
  return _[a1 _detectionModePresssed];
}

id objc_msgSend__determineMenuOrigin_anchorPosition_anchorDirection_shouldUseTip_sheet_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_determineMenuOrigin:anchorPosition:anchorDirection:shouldUseTip:sheet:");
}

id objc_msgSend__deviceSpecificImageForName_screenHeight_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_deviceSpecificImageForName:screenHeight:");
}

id objc_msgSend__deviceSpecificImageNamed_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_deviceSpecificImageNamed:");
}

id objc_msgSend__dictionaryElements(void *a1, const char *a2, ...)
{
  return _[a1 _dictionaryElements];
}

id objc_msgSend__didConnectWithSession_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_didConnectWithSession:");
}

id objc_msgSend__didDisconnect(void *a1, const char *a2, ...)
{
  return _[a1 _didDisconnect];
}

id objc_msgSend__didFocusLastOnKeyboardElement(void *a1, const char *a2, ...)
{
  return _[a1 _didFocusLastOnKeyboardElement];
}

id objc_msgSend__didHandleRealUpEvent(void *a1, const char *a2, ...)
{
  return _[a1 _didHandleRealUpEvent];
}

id objc_msgSend__didReceiveActionWithIdentifier_start_ignoreInputHold_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_didReceiveActionWithIdentifier:start:ignoreInputHold:");
}

id objc_msgSend__didTransitionToPhase_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_didTransitionToPhase:");
}

id objc_msgSend__didUpdateAvailability_withDetail_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_didUpdateAvailability:withDetail:");
}

id objc_msgSend__didWrapInDirection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_didWrapInDirection:");
}

id objc_msgSend__dimFlashingLightsPressed(void *a1, const char *a2, ...)
{
  return _[a1 _dimFlashingLightsPressed];
}

id objc_msgSend__displayCornerRadius(void *a1, const char *a2, ...)
{
  return _[a1 _displayCornerRadius];
}

id objc_msgSend__distanceForCurveWithRadius_onLeft_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_distanceForCurveWithRadius:onLeft:");
}

id objc_msgSend__distanceForPreview(void *a1, const char *a2, ...)
{
  return _[a1 _distanceForPreview];
}

id objc_msgSend__dockPressed(void *a1, const char *a2, ...)
{
  return _[a1 _dockPressed];
}

id objc_msgSend__doubleTapPressed_fromButtonPress_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_doubleTapPressed:fromButtonPress:");
}

id objc_msgSend__dragAndDropPressed_fromButtonPress_dragMenu_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_dragAndDropPressed:fromButtonPress:dragMenu:");
}

id objc_msgSend__drawCrosshairWithSize_lineThickness_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_drawCrosshairWithSize:lineThickness:");
}

id objc_msgSend__drawCurvedLineInIntervals_spacingBetweenIntervals_drawingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_drawCurvedLineInIntervals:spacingBetweenIntervals:drawingBlock:");
}

id objc_msgSend__drawFingerAtArrowHeadInContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_drawFingerAtArrowHeadInContext:");
}

id objc_msgSend__drawLineOfCirclesInContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_drawLineOfCirclesInContext:");
}

id objc_msgSend__drawLinesInContext_forRows_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_drawLinesInContext:forRows:");
}

id objc_msgSend__drawStraightLineInIntervals_spacingBetweenIntervals_drawingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_drawStraightLineInIntervals:spacingBetweenIntervals:drawingBlock:");
}

id objc_msgSend__drillOutFocusContextForParentGroupOfFocusContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_drillOutFocusContextForParentGroupOfFocusContext:");
}

id objc_msgSend__driver_outputAudioForContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_driver:outputAudioForContext:");
}

id objc_msgSend__driverForScannerState(void *a1, const char *a2, ...)
{
  return _[a1 _driverForScannerState];
}

id objc_msgSend__dummyImage(void *a1, const char *a2, ...)
{
  return _[a1 _dummyImage];
}

id objc_msgSend__dwellSwitchAssignedAction(void *a1, const char *a2, ...)
{
  return _[a1 _dwellSwitchAssignedAction];
}

id objc_msgSend__elementContainsAllSubviewsOfView_view_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_elementContainsAllSubviewsOfView:view:");
}

id objc_msgSend__elementFetchingRequired(void *a1, const char *a2, ...)
{
  return _[a1 _elementFetchingRequired];
}

id objc_msgSend__elementManagerForScannerState(void *a1, const char *a2, ...)
{
  return _[a1 _elementManagerForScannerState];
}

id objc_msgSend__elementProviderForSheet_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_elementProviderForSheet:");
}

id objc_msgSend__elementWithRestorationInfo_options_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_elementWithRestorationInfo:options:");
}

id objc_msgSend__enableApplicationAccessibility_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_enableApplicationAccessibility:");
}

id objc_msgSend__enableHiddenNubbitMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_enableHiddenNubbitMode:");
}

id objc_msgSend__enableServer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_enableServer:");
}

id objc_msgSend__enableWithoutFocusRestoration(void *a1, const char *a2, ...)
{
  return _[a1 _enableWithoutFocusRestoration];
}

id objc_msgSend__endAction(void *a1, const char *a2, ...)
{
  return _[a1 _endAction];
}

id objc_msgSend__endAutoscanning(void *a1, const char *a2, ...)
{
  return _[a1 _endAutoscanning];
}

id objc_msgSend__endGeneralTimer(void *a1, const char *a2, ...)
{
  return _[a1 _endGeneralTimer];
}

id objc_msgSend__endHandlingReachabilityIfNeeded(void *a1, const char *a2, ...)
{
  return _[a1 _endHandlingReachabilityIfNeeded];
}

id objc_msgSend__endHighlightingTargedElements(void *a1, const char *a2, ...)
{
  return _[a1 _endHighlightingTargedElements];
}

id objc_msgSend__endMovementAndForceLift_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_endMovementAndForceLift:");
}

id objc_msgSend__endPinchMode(void *a1, const char *a2, ...)
{
  return _[a1 _endPinchMode];
}

id objc_msgSend__fallbackAncestorForAutoscrollForMenu_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_fallbackAncestorForAutoscrollForMenu:");
}

id objc_msgSend__fallbackAncestorForScrollToTop(void *a1, const char *a2, ...)
{
  return _[a1 _fallbackAncestorForScrollToTop];
}

id objc_msgSend__fallbackAncestorForScrollToTopForMenu_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_fallbackAncestorForScrollToTopForMenu:");
}

id objc_msgSend__fallbackImageForCustomActionMenuItem_charactersInUse_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_fallbackImageForCustomActionMenuItem:charactersInUse:");
}

id objc_msgSend__fillColorForTheme_level_highVisibility_options_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_fillColorForTheme:level:highVisibility:options:");
}

id objc_msgSend__filteredItems_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_filteredItems:");
}

id objc_msgSend__filteredMenuItems_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_filteredMenuItems:");
}

id objc_msgSend__fingerCenter(void *a1, const char *a2, ...)
{
  return _[a1 _fingerCenter];
}

id objc_msgSend__fingerCircleImage(void *a1, const char *a2, ...)
{
  return _[a1 _fingerCircleImage];
}

id objc_msgSend__fingerController(void *a1, const char *a2, ...)
{
  return _[a1 _fingerController];
}

id objc_msgSend__fingerControllerPointForKeyboardKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_fingerControllerPointForKeyboardKey:");
}

id objc_msgSend__fingerControllerPointForScreenPoint_onDisplay_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_fingerControllerPointForScreenPoint:onDisplay:");
}

id objc_msgSend__fingerItemStringForNumberOfFingers_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_fingerItemStringForNumberOfFingers:");
}

id objc_msgSend__finishLineGesture(void *a1, const char *a2, ...)
{
  return _[a1 _finishLineGesture];
}

id objc_msgSend__fireSelectActionWithCount_preferrsMenuOnFirstPress_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_fireSelectActionWithCount:preferrsMenuOnFirstPress:");
}

id objc_msgSend__firstKeyboardFocusContext(void *a1, const char *a2, ...)
{
  return _[a1 _firstKeyboardFocusContext];
}

id objc_msgSend__flushScannableMenuElements(void *a1, const char *a2, ...)
{
  return _[a1 _flushScannableMenuElements];
}

id objc_msgSend__flushSoundIDs(void *a1, const char *a2, ...)
{
  return _[a1 _flushSoundIDs];
}

id objc_msgSend__focusContextAdjacentToSource_direction_fromContext_checkedSources_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_focusContextAdjacentToSource:direction:fromContext:checkedSources:");
}

id objc_msgSend__focusContextAtPoint_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_focusContextAtPoint:");
}

id objc_msgSend__focusContextForSource_inDirection_currentContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_focusContextForSource:inDirection:currentContext:");
}

id objc_msgSend__focusContextFromPrimaryContext_inDirection_didWrap_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_focusContextFromPrimaryContext:inDirection:didWrap:");
}

id objc_msgSend__focusedElementManagerForContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_focusedElementManagerForContext:");
}

id objc_msgSend__foregroundColorForTheme_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_foregroundColorForTheme:");
}

id objc_msgSend__frameFor90ControlWithXAlignment_yAlignment_size_nearestPoint_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_frameFor90ControlWithXAlignment:yAlignment:size:nearestPoint:");
}

id objc_msgSend__frameNeeded(void *a1, const char *a2, ...)
{
  return _[a1 _frameNeeded];
}

id objc_msgSend__frameWithIntegralOrigin_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_frameWithIntegralOrigin:");
}

id objc_msgSend__frontFacingCameraPressed(void *a1, const char *a2, ...)
{
  return _[a1 _frontFacingCameraPressed];
}

id objc_msgSend__gesturesPressed_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_gesturesPressed:");
}

id objc_msgSend__getActionIdentifier_longPressActionIdentifier_forSwitchEvent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_getActionIdentifier:longPressActionIdentifier:forSwitchEvent:");
}

id objc_msgSend__getCurveRadius_onLeft_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_getCurveRadius:onLeft:");
}

id objc_msgSend__goBackInMenuState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_goBackInMenuState:");
}

id objc_msgSend__graphicsQuality(void *a1, const char *a2, ...)
{
  return _[a1 _graphicsQuality];
}

id objc_msgSend__gridViewController(void *a1, const char *a2, ...)
{
  return _[a1 _gridViewController];
}

id objc_msgSend__groupForElement_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_groupForElement:");
}

id objc_msgSend__handleAXEvent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleAXEvent:");
}

id objc_msgSend__handleAccessibilityEvent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleAccessibilityEvent:");
}

id objc_msgSend__handleAction_longPressAction_start_switchIdentifier_switchDisplayName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleAction:longPressAction:start:switchIdentifier:switchDisplayName:");
}

id objc_msgSend__handleAction_type_state_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleAction:type:state:");
}

id objc_msgSend__handleActivateAction(void *a1, const char *a2, ...)
{
  return _[a1 _handleActivateAction];
}

id objc_msgSend__handleAlertAppeared(void *a1, const char *a2, ...)
{
  return _[a1 _handleAlertAppeared];
}

id objc_msgSend__handleAnnouncementNotification_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleAnnouncementNotification:");
}

id objc_msgSend__handleAppSwitcherAction(void *a1, const char *a2, ...)
{
  return _[a1 _handleAppSwitcherAction];
}

id objc_msgSend__handleAutomationEvent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleAutomationEvent:");
}

id objc_msgSend__handleCameraButton(void *a1, const char *a2, ...)
{
  return _[a1 _handleCameraButton];
}

id objc_msgSend__handleCameraButtonDoubleLightPress(void *a1, const char *a2, ...)
{
  return _[a1 _handleCameraButtonDoubleLightPress];
}

id objc_msgSend__handleCameraButtonLightPress(void *a1, const char *a2, ...)
{
  return _[a1 _handleCameraButtonLightPress];
}

id objc_msgSend__handleCompletedContinuousGesture(void *a1, const char *a2, ...)
{
  return _[a1 _handleCompletedContinuousGesture];
}

id objc_msgSend__handleCompletedCutCopyPasteOperationForTextElement_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleCompletedCutCopyPasteOperationForTextElement:");
}

id objc_msgSend__handleControlCenterAction(void *a1, const char *a2, ...)
{
  return _[a1 _handleControlCenterAction];
}

id objc_msgSend__handleDictationAction(void *a1, const char *a2, ...)
{
  return _[a1 _handleDictationAction];
}

id objc_msgSend__handleElementScrolledByPage(void *a1, const char *a2, ...)
{
  return _[a1 _handleElementScrolledByPage];
}

id objc_msgSend__handleElementVisualsUpdated(void *a1, const char *a2, ...)
{
  return _[a1 _handleElementVisualsUpdated];
}

id objc_msgSend__handleEscapeAction(void *a1, const char *a2, ...)
{
  return _[a1 _handleEscapeAction];
}

id objc_msgSend__handleFireActionAndResumeAutoscanning_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleFireActionAndResumeAutoscanning:");
}

id objc_msgSend__handleFirstResponderChanged(void *a1, const char *a2, ...)
{
  return _[a1 _handleFirstResponderChanged];
}

id objc_msgSend__handleForceTouchAction(void *a1, const char *a2, ...)
{
  return _[a1 _handleForceTouchAction];
}

id objc_msgSend__handleHandGestureEvent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleHandGestureEvent:");
}

id objc_msgSend__handleHoldAtPointForActionIdentifier_start_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleHoldAtPointForActionIdentifier:start:");
}

id objc_msgSend__handleHomeAction(void *a1, const char *a2, ...)
{
  return _[a1 _handleHomeAction];
}

id objc_msgSend__handleIOHIDEvent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleIOHIDEvent:");
}

id objc_msgSend__handleKeyboardFocusChanged(void *a1, const char *a2, ...)
{
  return _[a1 _handleKeyboardFocusChanged];
}

id objc_msgSend__handleKeyboardPopupAppeared(void *a1, const char *a2, ...)
{
  return _[a1 _handleKeyboardPopupAppeared];
}

id objc_msgSend__handleLayoutChanged_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleLayoutChanged:");
}

id objc_msgSend__handleMIDIEvent_device_entity_endpoint_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleMIDIEvent:device:entity:endpoint:");
}

id objc_msgSend__handleMultiTouchToolEvent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleMultiTouchToolEvent:");
}

id objc_msgSend__handleNotificationCenterAction(void *a1, const char *a2, ...)
{
  return _[a1 _handleNotificationCenterAction];
}

id objc_msgSend__handleNubbitMove_event_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleNubbitMove:event:");
}

id objc_msgSend__handleOrientationChanged(void *a1, const char *a2, ...)
{
  return _[a1 _handleOrientationChanged];
}

id objc_msgSend__handlePauseForPid_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handlePauseForPid:");
}

id objc_msgSend__handlePidStatusChanged(void *a1, const char *a2, ...)
{
  return _[a1 _handlePidStatusChanged];
}

id objc_msgSend__handlePinchFingerDownWithFinger_onDisplay_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handlePinchFingerDownWithFinger:onDisplay:");
}

id objc_msgSend__handleRealContinuousScrollToolMove_onDisplay_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleRealContinuousScrollToolMove:onDisplay:");
}

id objc_msgSend__handleRealContinuousScrollToolUp_onDisplay_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleRealContinuousScrollToolUp:onDisplay:");
}

id objc_msgSend__handleRealCustomGestureDown_onDisplay_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleRealCustomGestureDown:onDisplay:");
}

id objc_msgSend__handleRealCustomGestureMove_onDisplay_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleRealCustomGestureMove:onDisplay:");
}

id objc_msgSend__handleRealCustomGestureUp_onDisplay_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleRealCustomGestureUp:onDisplay:");
}

id objc_msgSend__handleRealDragToolMove_onDisplay_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleRealDragToolMove:onDisplay:");
}

id objc_msgSend__handleRealDragToolUp_onDisplay_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleRealDragToolUp:onDisplay:");
}

id objc_msgSend__handleRealMultiFingerDown_onDisplay_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleRealMultiFingerDown:onDisplay:");
}

id objc_msgSend__handleRealMultiFingerMove_onDisplay_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleRealMultiFingerMove:onDisplay:");
}

id objc_msgSend__handleRealMultiFingerUp_onDisplay_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleRealMultiFingerUp:onDisplay:");
}

id objc_msgSend__handleRealPinchToolDown_onDisplay_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleRealPinchToolDown:onDisplay:");
}

id objc_msgSend__handleRealPinchToolMove_onDisplay_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleRealPinchToolMove:onDisplay:");
}

id objc_msgSend__handleRealPinchToolUp_onDisplay_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleRealPinchToolUp:onDisplay:");
}

id objc_msgSend__handleRefreshEvent_data_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleRefreshEvent:data:");
}

id objc_msgSend__handleRemoteControlEvent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleRemoteControlEvent:");
}

id objc_msgSend__handleRemoteSCATAction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleRemoteSCATAction:");
}

id objc_msgSend__handleResumeForPid_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleResumeForPid:");
}

id objc_msgSend__handleRunAction(void *a1, const char *a2, ...)
{
  return _[a1 _handleRunAction];
}

id objc_msgSend__handleScreenChanged_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleScreenChanged:");
}

id objc_msgSend__handleScreenLocked(void *a1, const char *a2, ...)
{
  return _[a1 _handleScreenLocked];
}

id objc_msgSend__handleSelectAction(void *a1, const char *a2, ...)
{
  return _[a1 _handleSelectAction];
}

id objc_msgSend__handleSelectAndResumeAutoscanningAction(void *a1, const char *a2, ...)
{
  return _[a1 _handleSelectAndResumeAutoscanningAction];
}

id objc_msgSend__handleSiriAction(void *a1, const char *a2, ...)
{
  return _[a1 _handleSiriAction];
}

id objc_msgSend__handleSpeakThis_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleSpeakThis:");
}

id objc_msgSend__handleStepNextAction(void *a1, const char *a2, ...)
{
  return _[a1 _handleStepNextAction];
}

id objc_msgSend__handleStepPreviousAction(void *a1, const char *a2, ...)
{
  return _[a1 _handleStepPreviousAction];
}

id objc_msgSend__handleStopAction(void *a1, const char *a2, ...)
{
  return _[a1 _handleStopAction];
}

id objc_msgSend__handleSysdiagnose_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleSysdiagnose:");
}

id objc_msgSend__handleSystemServerDied(void *a1, const char *a2, ...)
{
  return _[a1 _handleSystemServerDied];
}

id objc_msgSend__handleTouch_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleTouch:");
}

id objc_msgSend__handleTripleClickAction(void *a1, const char *a2, ...)
{
  return _[a1 _handleTripleClickAction];
}

id objc_msgSend__handleUsageConfirmation(void *a1, const char *a2, ...)
{
  return _[a1 _handleUsageConfirmation];
}

id objc_msgSend__handleValueChanged(void *a1, const char *a2, ...)
{
  return _[a1 _handleValueChanged];
}

id objc_msgSend__handleVolumeDownAction(void *a1, const char *a2, ...)
{
  return _[a1 _handleVolumeDownAction];
}

id objc_msgSend__handleVolumeUpAction(void *a1, const char *a2, ...)
{
  return _[a1 _handleVolumeUpAction];
}

id objc_msgSend__hardwareButtonPressed_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_hardwareButtonPressed:");
}

id objc_msgSend__hasCurrentApplicationMatchingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_hasCurrentApplicationMatchingBlock:");
}

id objc_msgSend__hasExternalSwitchConfigured(void *a1, const char *a2, ...)
{
  return _[a1 _hasExternalSwitchConfigured];
}

id objc_msgSend__heightForAllRows_itemsPerRow_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_heightForAllRows:itemsPerRow:");
}

id objc_msgSend__hideAlertForSource_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_hideAlertForSource:");
}

id objc_msgSend__hideAlerts(void *a1, const char *a2, ...)
{
  return _[a1 _hideAlerts];
}

id objc_msgSend__hideLargeContentViewerIfNeeded(void *a1, const char *a2, ...)
{
  return _[a1 _hideLargeContentViewerIfNeeded];
}

id objc_msgSend__highlightDictionaryElementsWithIndexes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_highlightDictionaryElementsWithIndexes:");
}

id objc_msgSend__highlightViewWidth(void *a1, const char *a2, ...)
{
  return _[a1 _highlightViewWidth];
}

id objc_msgSend__hndAccessibilityEventForFetchEvent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_hndAccessibilityEventForFetchEvent:");
}

id objc_msgSend__home(void *a1, const char *a2, ...)
{
  return _[a1 _home];
}

id objc_msgSend__homeButton_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_homeButton:");
}

id objc_msgSend__iconScaleForForce_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_iconScaleForForce:");
}

id objc_msgSend__identifierForInterDeviceAction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_identifierForInterDeviceAction:");
}

id objc_msgSend__identifierForTextMovementDirection_unit_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_identifierForTextMovementDirection:unit:");
}

id objc_msgSend__idleTime(void *a1, const char *a2, ...)
{
  return _[a1 _idleTime];
}

id objc_msgSend__imageNameForDeviceType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_imageNameForDeviceType:");
}

id objc_msgSend__imageNameForNumberOfFingers_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_imageNameForNumberOfFingers:");
}

id objc_msgSend__imageNameForPrefix_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_imageNameForPrefix:");
}

id objc_msgSend__inSelectedState(void *a1, const char *a2, ...)
{
  return _[a1 _inSelectedState];
}

id objc_msgSend__includeRingerButtonInHardware(void *a1, const char *a2, ...)
{
  return _[a1 _includeRingerButtonInHardware];
}

id objc_msgSend__indexForAngle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_indexForAngle:");
}

id objc_msgSend__indexOfProviderAfterProviderWithIndex_didWrap_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_indexOfProviderAfterProviderWithIndex:didWrap:");
}

id objc_msgSend__indexOfProviderBeforeProviderWithIndex_didWrap_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_indexOfProviderBeforeProviderWithIndex:didWrap:");
}

id objc_msgSend__indexOfProviderContainingElement_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_indexOfProviderContainingElement:");
}

id objc_msgSend__indexPathForKeyboardElement_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_indexPathForKeyboardElement:");
}

id objc_msgSend__initServer(void *a1, const char *a2, ...)
{
  return _[a1 _initServer];
}

id objc_msgSend__initStyleAttributes(void *a1, const char *a2, ...)
{
  return _[a1 _initStyleAttributes];
}

id objc_msgSend__initWithHIDDevice_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_initWithHIDDevice:");
}

id objc_msgSend__initialPointForGesture(void *a1, const char *a2, ...)
{
  return _[a1 _initialPointForGesture];
}

id objc_msgSend__initialize(void *a1, const char *a2, ...)
{
  return _[a1 _initialize];
}

id objc_msgSend__initializeAccessibility(void *a1, const char *a2, ...)
{
  return _[a1 _initializeAccessibility];
}

id objc_msgSend__initializeContinuousGestureDataWithName_points_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_initializeContinuousGestureDataWithName:points:");
}

id objc_msgSend__initializeMenuVisualProvider(void *a1, const char *a2, ...)
{
  return _[a1 _initializeMenuVisualProvider];
}

id objc_msgSend__initializeNubbit(void *a1, const char *a2, ...)
{
  return _[a1 _initializeNubbit];
}

id objc_msgSend__initializeSpringBoardItems(void *a1, const char *a2, ...)
{
  return _[a1 _initializeSpringBoardItems];
}

id objc_msgSend__insertObjectsOnSameRow_intoArray_itemsPerRow_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_insertObjectsOnSameRow:intoArray:itemsPerRow:");
}

id objc_msgSend__installStopButtonForActionName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_installStopButtonForActionName:");
}

id objc_msgSend__interDeviceActionForIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_interDeviceActionForIdentifier:");
}

id objc_msgSend__isChildElement_desendantOfElement_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_isChildElement:desendantOfElement:");
}

id objc_msgSend__isCurrentSheetValidForElement_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_isCurrentSheetValidForElement:");
}

id objc_msgSend__isElementInIgnoredTouchRegions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_isElementInIgnoredTouchRegions:");
}

id objc_msgSend__isGrayArrow(void *a1, const char *a2, ...)
{
  return _[a1 _isGrayArrow];
}

id objc_msgSend__isGroupingEnabled(void *a1, const char *a2, ...)
{
  return _[a1 _isGroupingEnabled];
}

id objc_msgSend__isInNubbitHitbox_onDisplay_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_isInNubbitHitbox:onDisplay:");
}

id objc_msgSend__isKeyboardContainerElement_allowKeyboardContainerItself_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_isKeyboardContainerElement:allowKeyboardContainerItself:");
}

id objc_msgSend__isPerformingContinuousGesture(void *a1, const char *a2, ...)
{
  return _[a1 _isPerformingContinuousGesture];
}

id objc_msgSend__isPerformingMove(void *a1, const char *a2, ...)
{
  return _[a1 _isPerformingMove];
}

id objc_msgSend__isScannerControlledByDriver_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_isScannerControlledByDriver:");
}

id objc_msgSend__isScannerEnabled(void *a1, const char *a2, ...)
{
  return _[a1 _isScannerEnabled];
}

id objc_msgSend__isScanningKeyboardContainer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_isScanningKeyboardContainer:");
}

id objc_msgSend__isSpeechEnabled(void *a1, const char *a2, ...)
{
  return _[a1 _isSpeechEnabled];
}

id objc_msgSend__isValidPositionFor90ControlWithXAlignment_yAlignment_size_nearestPoint_centerPoint_frame_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_isValidPositionFor90ControlWithXAlignment:yAlignment:size:nearestPoint:centerPoint:frame:");
}

id objc_msgSend__itemBelongsOnShortFirstPage_shouldAddControlCenterActions_shouldIncludeSpotlight_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_itemBelongsOnShortFirstPage:shouldAddControlCenterActions:shouldIncludeSpotlight:");
}

id objc_msgSend__itemForButton_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_itemForButton:");
}

id objc_msgSend__itemForScanningFromItem_inDirection_didWrap_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_itemForScanningFromItem:inDirection:didWrap:");
}

id objc_msgSend__iterateRemoteViewsAndPerformContinuousScrollWithSpeed_direction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_iterateRemoteViewsAndPerformContinuousScrollWithSpeed:direction:");
}

id objc_msgSend__keyboardElementForIndexPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_keyboardElementForIndexPath:");
}

id objc_msgSend__layoutButtonsWithViewForCenteringAtStart_includingBackButton_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_layoutButtonsWithViewForCenteringAtStart:includingBackButton:");
}

id objc_msgSend__layoutForegroundImageView(void *a1, const char *a2, ...)
{
  return _[a1 _layoutForegroundImageView];
}

id objc_msgSend__layoutHUDView_withinBounds_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_layoutHUDView:withinBounds:");
}

id objc_msgSend__layoutMenuItems_oldRockers_viewForCenteringAtStart_shouldUpdateKeyboardFocusIfNeeded_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_layoutMenuItems:oldRockers:viewForCenteringAtStart:shouldUpdateKeyboardFocusIfNeeded:");
}

id objc_msgSend__layoutMenuItemsInReverse_oldRockers_animateToIcon_shouldUpdateKeyboardFocusIfNeeded_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_layoutMenuItemsInReverse:oldRockers:animateToIcon:shouldUpdateKeyboardFocusIfNeeded:");
}

id objc_msgSend__liftFingersUpForPotentialTapViaPrimaryButton(void *a1, const char *a2, ...)
{
  return _[a1 _liftFingersUpForPotentialTapViaPrimaryButton];
}

id objc_msgSend__listenForMuteSwitchChangeIfNecessaryForItems_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_listenForMuteSwitchChangeIfNecessaryForItems:");
}

id objc_msgSend__loadFavoritesMenuItems(void *a1, const char *a2, ...)
{
  return _[a1 _loadFavoritesMenuItems];
}

id objc_msgSend__loadGestures(void *a1, const char *a2, ...)
{
  return _[a1 _loadGestures];
}

id objc_msgSend__loadGesturesMenuItems(void *a1, const char *a2, ...)
{
  return _[a1 _loadGesturesMenuItems];
}

id objc_msgSend__loadHardwareMenuItems(void *a1, const char *a2, ...)
{
  return _[a1 _loadHardwareMenuItems];
}

id objc_msgSend__loadInitialMenuItems(void *a1, const char *a2, ...)
{
  return _[a1 _loadInitialMenuItems];
}

id objc_msgSend__loadMenuItems_viewForCenteringAtStart_goBackwards_originalState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_loadMenuItems:viewForCenteringAtStart:goBackwards:originalState:");
}

id objc_msgSend__loadMenuItems_viewForCenteringAtStart_goBackwards_originalState_shouldUpdateKeyboardFocusIfNeeded_( void *a1, const char *a2, ...)
{
  return _objc_msgSend( a1,  "_loadMenuItems:viewForCenteringAtStart:goBackwards:originalState:shouldUpdateKeyboardFocusIfNeeded:");
}

id objc_msgSend__loadMoreMenuItems(void *a1, const char *a2, ...)
{
  return _[a1 _loadMoreMenuItems];
}

id objc_msgSend__loadRotateMenuItems(void *a1, const char *a2, ...)
{
  return _[a1 _loadRotateMenuItems];
}

id objc_msgSend__loadScrollMenuItems(void *a1, const char *a2, ...)
{
  return _[a1 _loadScrollMenuItems];
}

id objc_msgSend__locKeyForHardwareActionString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_locKeyForHardwareActionString:");
}

id objc_msgSend__lock(void *a1, const char *a2, ...)
{
  return _[a1 _lock];
}

id objc_msgSend__lockButton_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_lockButton:");
}

id objc_msgSend__longPressDictionaryElementWithIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_longPressDictionaryElementWithIndex:");
}

id objc_msgSend__longPressPressed_fromButtonPress_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_longPressPressed:fromButtonPress:");
}

id objc_msgSend__matchingCriteria(void *a1, const char *a2, ...)
{
  return _[a1 _matchingCriteria];
}

id objc_msgSend__matchingDictionaries(void *a1, const char *a2, ...)
{
  return _[a1 _matchingDictionaries];
}

id objc_msgSend__maxHeightForRow_itemsPerRow_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_maxHeightForRow:itemsPerRow:");
}

id objc_msgSend__menuCornerRadius(void *a1, const char *a2, ...)
{
  return _[a1 _menuCornerRadius];
}

id objc_msgSend__menuExited(void *a1, const char *a2, ...)
{
  return _[a1 _menuExited];
}

id objc_msgSend__menuFrameIsValid_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_menuFrameIsValid:");
}

id objc_msgSend__menuItemClass(void *a1, const char *a2, ...)
{
  return _[a1 _menuItemClass];
}

id objc_msgSend__menuItemDetailsForScrollAction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_menuItemDetailsForScrollAction:");
}

id objc_msgSend__menuItemForScrollAction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_menuItemForScrollAction:");
}

id objc_msgSend__menuItemWithItemDictionary_menu_delegate_hardwareActionString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_menuItemWithItemDictionary:menu:delegate:hardwareActionString:");
}

id objc_msgSend__menuItemsForElementSpecificActionsForMenu_delegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_menuItemsForElementSpecificActionsForMenu:delegate:");
}

id objc_msgSend__menuOpenTracker_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_menuOpenTracker:");
}

id objc_msgSend__menuPointForFingerLayout(void *a1, const char *a2, ...)
{
  return _[a1 _menuPointForFingerLayout];
}

id objc_msgSend__menuTipBase(void *a1, const char *a2, ...)
{
  return _[a1 _menuTipBase];
}

id objc_msgSend__menuTipBaseCornerRadius(void *a1, const char *a2, ...)
{
  return _[a1 _menuTipBaseCornerRadius];
}

id objc_msgSend__menuTipCornerRadius(void *a1, const char *a2, ...)
{
  return _[a1 _menuTipCornerRadius];
}

id objc_msgSend__menuTipHeight(void *a1, const char *a2, ...)
{
  return _[a1 _menuTipHeight];
}

id objc_msgSend__midAngleForCurvedTrailWithTailPoint_fingerTrailDistance_distanceAlongArc_useSecondIntersectionPointIfNecessary_( void *a1, const char *a2, ...)
{
  return _objc_msgSend( a1,  "_midAngleForCurvedTrailWithTailPoint:fingerTrailDistance:distanceAlongArc:useSecondIntersectionPointIfNecessary:");
}

id objc_msgSend__modifyPinchToolMoveToPoint_onDisplay_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_modifyPinchToolMoveToPoint:onDisplay:");
}

id objc_msgSend__morePressed_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_morePressed:");
}

id objc_msgSend__moveCursorForTextElement_direction_unit_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_moveCursorForTextElement:direction:unit:");
}

id objc_msgSend__moveFingersForRealEventToPoint_onDisplay_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_moveFingersForRealEventToPoint:onDisplay:");
}

id objc_msgSend__moveFingersToPointInFingerCoordinateSpace_onDisplay_allowOutOfBounds_animated_completion_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_moveFingersToPointInFingerCoordinateSpace:onDisplay:allowOutOfBounds:animated:completion:");
}

id objc_msgSend__moveNubbitForKeyboard_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_moveNubbitForKeyboard:");
}

id objc_msgSend__moveNubbitToPosition_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_moveNubbitToPosition:");
}

id objc_msgSend__nativeFocusElementContext(void *a1, const char *a2, ...)
{
  return _[a1 _nativeFocusElementContext];
}

id objc_msgSend__newControlArrowForCurvature_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_newControlArrowForCurvature:");
}

id objc_msgSend__newDefaultArrowPath(void *a1, const char *a2, ...)
{
  return _[a1 _newDefaultArrowPath];
}

id objc_msgSend__newGrayArrowOutlinePath(void *a1, const char *a2, ...)
{
  return _[a1 _newGrayArrowOutlinePath];
}

id objc_msgSend__newRotate90Button(void *a1, const char *a2, ...)
{
  return _[a1 _newRotate90Button];
}

id objc_msgSend__nextFocusSourceFromSource_inDirection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_nextFocusSourceFromSource:inDirection:");
}

id objc_msgSend__notificationCenterPressed(void *a1, const char *a2, ...)
{
  return _[a1 _notificationCenterPressed];
}

id objc_msgSend__notifyDisplayManagerDeviceCountChanged(void *a1, const char *a2, ...)
{
  return _[a1 _notifyDisplayManagerDeviceCountChanged];
}

id objc_msgSend__notifyMenuObserversWithSelector_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_notifyMenuObserversWithSelector:");
}

id objc_msgSend__notifyObserversDidFetchElementsForEvent_foundNewElements_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_notifyObserversDidFetchElementsForEvent:foundNewElements:");
}

id objc_msgSend__notifyObserversScannerDidBecomeActive(void *a1, const char *a2, ...)
{
  return _[a1 _notifyObserversScannerDidBecomeActive];
}

id objc_msgSend__notifyObserversScannerDidFocusOnContext_oldContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_notifyObserversScannerDidFocusOnContext:oldContext:");
}

id objc_msgSend__notifyObserversWillFetchElementsForEvent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_notifyObserversWillFetchElementsForEvent:");
}

id objc_msgSend__nubbitIsOverKeyboard_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_nubbitIsOverKeyboard:");
}

id objc_msgSend__nubbitPointForEdgePosition(void *a1, const char *a2, ...)
{
  return _[a1 _nubbitPointForEdgePosition];
}

id objc_msgSend__nubbitPositionForKeyboardFrame_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_nubbitPositionForKeyboardFrame:");
}

id objc_msgSend__numberOfFingers(void *a1, const char *a2, ...)
{
  return _[a1 _numberOfFingers];
}

id objc_msgSend__numberOfFingersWithGestureSheet_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_numberOfFingersWithGestureSheet:");
}

id objc_msgSend__observeNotifications_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_observeNotifications:");
}

id objc_msgSend__opacityForTheme_level_highVisibility_options_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_opacityForTheme:level:highVisibility:options:");
}

id objc_msgSend__openVisualIntelligence(void *a1, const char *a2, ...)
{
  return _[a1 _openVisualIntelligence];
}

id objc_msgSend__orbPressed_fromButtonPress_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_orbPressed:fromButtonPress:");
}

id objc_msgSend__orientationPressed_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_orientationPressed:");
}

id objc_msgSend__overrideDeviceCount(void *a1, const char *a2, ...)
{
  return _[a1 _overrideDeviceCount];
}

id objc_msgSend__overrideScanningModeAtStartupIfNecessary(void *a1, const char *a2, ...)
{
  return _[a1 _overrideScanningModeAtStartupIfNecessary];
}

id objc_msgSend__paddedHitboxForNubbitOnDisplay_activationFactor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_paddedHitboxForNubbitOnDisplay:activationFactor:");
}

id objc_msgSend__panPositionsAdjustedByDelta_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_panPositionsAdjustedByDelta:");
}

id objc_msgSend__path_frame_isSimpleRect_forFocusContext_cursor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_path:frame:isSimpleRect:forFocusContext:cursor:");
}

id objc_msgSend__pauseForMaximumNumberOfCycles(void *a1, const char *a2, ...)
{
  return _[a1 _pauseForMaximumNumberOfCycles];
}

id objc_msgSend__pauseScanningForLikelyScreenChange(void *a1, const char *a2, ...)
{
  return _[a1 _pauseScanningForLikelyScreenChange];
}

id objc_msgSend__pauseScanningTemporarily(void *a1, const char *a2, ...)
{
  return _[a1 _pauseScanningTemporarily];
}

id objc_msgSend__performAXScrollActionAtPoint_onDisplay_action_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_performAXScrollActionAtPoint:onDisplay:action:");
}

id objc_msgSend__performAccessibilityValidations(void *a1, const char *a2, ...)
{
  return _[a1 _performAccessibilityValidations];
}

id objc_msgSend__performCustomGestureOnDisplay_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_performCustomGestureOnDisplay:");
}

id objc_msgSend__performFallbackScrollAncestorAction_withMenu_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_performFallbackScrollAncestorAction:withMenu:");
}

id objc_msgSend__performFlickGestureWithAngle_name_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_performFlickGestureWithAngle:name:");
}

id objc_msgSend__performForceTouchGesture(void *a1, const char *a2, ...)
{
  return _[a1 _performForceTouchGesture];
}

id objc_msgSend__performGesture_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_performGesture:");
}

id objc_msgSend__performTapGestureForDoubleTap_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_performTapGestureForDoubleTap:");
}

id objc_msgSend__persistentSwitchIdentifierForKeyCode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_persistentSwitchIdentifierForKeyCode:");
}

id objc_msgSend__pinchAngleAdjustedByDelta_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_pinchAngleAdjustedByDelta:");
}

id objc_msgSend__pinchPositionsWithRadius_angle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_pinchPositionsWithRadius:angle:");
}

id objc_msgSend__pinchPressed_mode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_pinchPressed:mode:");
}

id objc_msgSend__pinchRadiusAdjustedByDelta_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_pinchRadiusAdjustedByDelta:");
}

id objc_msgSend__playSoundWithSoundID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_playSoundWithSoundID:");
}

id objc_msgSend__pointByAvoidingDisplayCornerRadius_forPoint_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_pointByAvoidingDisplayCornerRadius:forPoint:");
}

id objc_msgSend__popToRootLevelSheet(void *a1, const char *a2, ...)
{
  return _[a1 _popToRootLevelSheet];
}

id objc_msgSend__position_isOverKeyboard_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_position:isOverKeyboard:");
}

id objc_msgSend__positionForMenuDockPosition_size_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_positionForMenuDockPosition:size:");
}

id objc_msgSend__positionForMenuPopoverPosition_size_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_positionForMenuPopoverPosition:size:");
}

id objc_msgSend__preferredBehaviorForSelectCount_focusContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_preferredBehaviorForSelectCount:focusContext:");
}

id objc_msgSend__preloadInitialMenuItems(void *a1, const char *a2, ...)
{
  return _[a1 _preloadInitialMenuItems];
}

id objc_msgSend__prepareMenuForScanningIfNeeded(void *a1, const char *a2, ...)
{
  return _[a1 _prepareMenuForScanningIfNeeded];
}

id objc_msgSend__prepareToBeginContinuousGesture(void *a1, const char *a2, ...)
{
  return _[a1 _prepareToBeginContinuousGesture];
}

id objc_msgSend__presentLargeContentViewerForHUDItem_inContentView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_presentLargeContentViewerForHUDItem:inContentView:");
}

id objc_msgSend__presentWithElement_pointPicker_useMenuTip_sheetToShow_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_presentWithElement:pointPicker:useMenuTip:sheetToShow:");
}

id objc_msgSend__pressDictionaryElementWithIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_pressDictionaryElementWithIndex:");
}

id objc_msgSend__previewDistance(void *a1, const char *a2, ...)
{
  return _[a1 _previewDistance];
}

id objc_msgSend__primaryElementManagerForScannerState(void *a1, const char *a2, ...)
{
  return _[a1 _primaryElementManagerForScannerState];
}

id objc_msgSend__probeAccessories(void *a1, const char *a2, ...)
{
  return _[a1 _probeAccessories];
}

id objc_msgSend__promptForLineGesture_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_promptForLineGesture:");
}

id objc_msgSend__pushFreehandSheetOfClass_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_pushFreehandSheetOfClass:");
}

id objc_msgSend__rangeAnimationVelocityWithSlowdownMultiplier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_rangeAnimationVelocityWithSlowdownMultiplier:");
}

id objc_msgSend__reachabilityPressed(void *a1, const char *a2, ...)
{
  return _[a1 _reachabilityPressed];
}

id objc_msgSend__reallyLiftFingersUpForPotentialTapViaPrimaryButton(void *a1, const char *a2, ...)
{
  return _[a1 _reallyLiftFingersUpForPotentialTapViaPrimaryButton];
}

id objc_msgSend__rebootDevicePressed(void *a1, const char *a2, ...)
{
  return _[a1 _rebootDevicePressed];
}

id objc_msgSend__rectForFingers_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_rectForFingers:");
}

id objc_msgSend__rectToClearForPinchGesture(void *a1, const char *a2, ...)
{
  return _[a1 _rectToClearForPinchGesture];
}

id objc_msgSend__rectToClearIfNeededForSheet_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_rectToClearIfNeededForSheet:");
}

id objc_msgSend__referenceBounds(void *a1, const char *a2, ...)
{
  return _[a1 _referenceBounds];
}

id objc_msgSend__registerForSettingsNotifications(void *a1, const char *a2, ...)
{
  return _[a1 _registerForSettingsNotifications];
}

id objc_msgSend__releaseLastShownKey(void *a1, const char *a2, ...)
{
  return _[a1 _releaseLastShownKey];
}

id objc_msgSend__removeAllAnimations_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_removeAllAnimations:");
}

id objc_msgSend__removeAutomationSwitches(void *a1, const char *a2, ...)
{
  return _[a1 _removeAutomationSwitches];
}

id objc_msgSend__removeInputSources(void *a1, const char *a2, ...)
{
  return _[a1 _removeInputSources];
}

id objc_msgSend__removePostEventFilterFromFetcher_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_removePostEventFilterFromFetcher:");
}

id objc_msgSend__reorderLayersIfNeededForDisplayID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_reorderLayersIfNeededForDisplayID:");
}

id objc_msgSend__replaceRingerWithOrientationLock(void *a1, const char *a2, ...)
{
  return _[a1 _replaceRingerWithOrientationLock];
}

id objc_msgSend__replacementForLastFocusedKeyboardItem(void *a1, const char *a2, ...)
{
  return _[a1 _replacementForLastFocusedKeyboardItem];
}

id objc_msgSend__repositionNubbitAfterLift_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_repositionNubbitAfterLift:");
}

id objc_msgSend__repositionedGestureFromOriginalGesture_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_repositionedGestureFromOriginalGesture:");
}

id objc_msgSend__requestPauseScanning(void *a1, const char *a2, ...)
{
  return _[a1 _requestPauseScanning];
}

id objc_msgSend__requestResumeScanning(void *a1, const char *a2, ...)
{
  return _[a1 _requestResumeScanning];
}

id objc_msgSend__requestSwitchControllerPrivileges(void *a1, const char *a2, ...)
{
  return _[a1 _requestSwitchControllerPrivileges];
}

id objc_msgSend__resetContinuousGestureData(void *a1, const char *a2, ...)
{
  return _[a1 _resetContinuousGestureData];
}

id objc_msgSend__resetCurrentPointToInitialPoint(void *a1, const char *a2, ...)
{
  return _[a1 _resetCurrentPointToInitialPoint];
}

id objc_msgSend__resetDwellTimer(void *a1, const char *a2, ...)
{
  return _[a1 _resetDwellTimer];
}

id objc_msgSend__resetFetchFlags(void *a1, const char *a2, ...)
{
  return _[a1 _resetFetchFlags];
}

id objc_msgSend__resetGrid(void *a1, const char *a2, ...)
{
  return _[a1 _resetGrid];
}

id objc_msgSend__resetHoverCircleLocation(void *a1, const char *a2, ...)
{
  return _[a1 _resetHoverCircleLocation];
}

id objc_msgSend__resetIdleTimer(void *a1, const char *a2, ...)
{
  return _[a1 _resetIdleTimer];
}

id objc_msgSend__resetMenuOpenTracker(void *a1, const char *a2, ...)
{
  return _[a1 _resetMenuOpenTracker];
}

id objc_msgSend__resetPostEventFilterOnFetcher_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_resetPostEventFilterOnFetcher:");
}

id objc_msgSend__resetRecipeTimeoutIfApplicable(void *a1, const char *a2, ...)
{
  return _[a1 _resetRecipeTimeoutIfApplicable];
}

id objc_msgSend__resetWithActionSource_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_resetWithActionSource:");
}

id objc_msgSend__resignSwitchControllerPrivileges(void *a1, const char *a2, ...)
{
  return _[a1 _resignSwitchControllerPrivileges];
}

id objc_msgSend__resolveSwitchForSwitchEvent_deviceName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_resolveSwitchForSwitchEvent:deviceName:");
}

id objc_msgSend__restorationInfoForElement_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_restorationInfoForElement:");
}

id objc_msgSend__ringerPressed_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_ringerPressed:");
}

id objc_msgSend__rockerButtonForLocation_buttonType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_rockerButtonForLocation:buttonType:");
}

id objc_msgSend__rockerItemsByLocation(void *a1, const char *a2, ...)
{
  return _[a1 _rockerItemsByLocation];
}

id objc_msgSend__rotatedNormalizedInitialPoint(void *a1, const char *a2, ...)
{
  return _[a1 _rotatedNormalizedInitialPoint];
}

id objc_msgSend__rotationDegreesForOrientation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_rotationDegreesForOrientation:");
}

id objc_msgSend__rotationLockPressed(void *a1, const char *a2, ...)
{
  return _[a1 _rotationLockPressed];
}

id objc_msgSend__rowToFrameDictionaryForAttributes_itemsPerRow_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_rowToFrameDictionaryForAttributes:itemsPerRow:");
}

id objc_msgSend__savePoint_andNotifyDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_savePoint:andNotifyDelegate:");
}

id objc_msgSend__saveRecentGesture_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_saveRecentGesture:");
}

id objc_msgSend__scannableElements(void *a1, const char *a2, ...)
{
  return _[a1 _scannableElements];
}

id objc_msgSend__scannableElementsAtSelectionPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_scannableElementsAtSelectionPath:");
}

id objc_msgSend__scannerEnabledChange(void *a1, const char *a2, ...)
{
  return _[a1 _scannerEnabledChange];
}

id objc_msgSend__scannerGroupsForMenuItems_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_scannerGroupsForMenuItems:");
}

id objc_msgSend__scanningModePreferenceDidChange(void *a1, const char *a2, ...)
{
  return _[a1 _scanningModePreferenceDidChange];
}

id objc_msgSend__scatAddCompletionBlockToAction_completionBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_scatAddCompletionBlockToAction:completionBlock:");
}

id objc_msgSend__scatProcessAttributedString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_scatProcessAttributedString:");
}

id objc_msgSend__screen(void *a1, const char *a2, ...)
{
  return _[a1 _screen];
}

id objc_msgSend__screenHeight(void *a1, const char *a2, ...)
{
  return _[a1 _screenHeight];
}

id objc_msgSend__screenshot(void *a1, const char *a2, ...)
{
  return _[a1 _screenshot];
}

id objc_msgSend__screenshotPressed(void *a1, const char *a2, ...)
{
  return _[a1 _screenshotPressed];
}

id objc_msgSend__scrollAncestorIsSelfForScrollView_scrollAction_resultScrollAncestor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_scrollAncestorIsSelfForScrollView:scrollAction:resultScrollAncestor:");
}

id objc_msgSend__scrollDeltaForGesture_screenSize_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_scrollDeltaForGesture:screenSize:");
}

id objc_msgSend__scrollDictionaryElementWithIndex_direction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_scrollDictionaryElementWithIndex:direction:");
}

id objc_msgSend__scrollDictionaryElementWithIndex_position_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_scrollDictionaryElementWithIndex:position:");
}

id objc_msgSend__scrollFallbackGestureAtPoint_onDisplay_vertical_forward_max_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_scrollFallbackGestureAtPoint:onDisplay:vertical:forward:max:");
}

id objc_msgSend__scrollPressed_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_scrollPressed:");
}

id objc_msgSend__scrollPressed_fromButtonPress_vertical_forward_max_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_scrollPressed:fromButtonPress:vertical:forward:max:");
}

id objc_msgSend__selectAlternateKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_selectAlternateKey:");
}

id objc_msgSend__selectNoneForTextElement_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_selectNoneForTextElement:");
}

id objc_msgSend__selectWordForTextElement_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_selectWordForTextElement:");
}

id objc_msgSend__sendASTEnabledTipSignal(void *a1, const char *a2, ...)
{
  return _[a1 _sendASTEnabledTipSignal];
}

id objc_msgSend__sendActionWithIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_sendActionWithIdentifier:");
}

id objc_msgSend__sessionState(void *a1, const char *a2, ...)
{
  return _[a1 _sessionState];
}

id objc_msgSend__setApplicationAccessibilityEnabledIfNeeded(void *a1, const char *a2, ...)
{
  return _[a1 _setApplicationAccessibilityEnabledIfNeeded];
}

id objc_msgSend__setBackgroundWithType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setBackgroundWithType:");
}

id objc_msgSend__setBorderDimmed_focused_hidden_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setBorderDimmed:focused:hidden:");
}

id objc_msgSend__setCurrentRecipe_shouldShowAlert_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setCurrentRecipe:shouldShowAlert:");
}

id objc_msgSend__setDictionaryElementValueWithIndex_value_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setDictionaryElementValueWithIndex:value:");
}

id objc_msgSend__setDrawsAsBackdropOverlay_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setDrawsAsBackdropOverlay:");
}

id objc_msgSend__setDrawsAsBackdropOverlayWithBlendMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setDrawsAsBackdropOverlayWithBlendMode:");
}

id objc_msgSend__setDuckingLevelAlways_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setDuckingLevelAlways:");
}

id objc_msgSend__setDuckingLevelOnlySpeaking_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setDuckingLevelOnlySpeaking:");
}

id objc_msgSend__setDuckingProperties(void *a1, const char *a2, ...)
{
  return _[a1 _setDuckingProperties];
}

id objc_msgSend__setHyphenationFactor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setHyphenationFactor:");
}

id objc_msgSend__setIconDimmed_asDimAsBorder_focused_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setIconDimmed:asDimAsBorder:focused:");
}

id objc_msgSend__setIdleTimerDisabled_forReason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setIdleTimerDisabled:forReason:");
}

id objc_msgSend__setNumberOfFingersForGestures_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setNumberOfFingersForGestures:");
}

id objc_msgSend__setOverrideUserInterfaceStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setOverrideUserInterfaceStyle:");
}

id objc_msgSend__setPropertiesFromDevice_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setPropertiesFromDevice:error:");
}

id objc_msgSend__setRingerSwitchIcon_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setRingerSwitchIcon:");
}

id objc_msgSend__setRotationLockIcon_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setRotationLockIcon:");
}

id objc_msgSend__setShowsFingers_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setShowsFingers:");
}

id objc_msgSend__setUnDuckingProperties(void *a1, const char *a2, ...)
{
  return _[a1 _setUnDuckingProperties];
}

id objc_msgSend__setupAutomationSwitches(void *a1, const char *a2, ...)
{
  return _[a1 _setupAutomationSwitches];
}

id objc_msgSend__setupConstraints(void *a1, const char *a2, ...)
{
  return _[a1 _setupConstraints];
}

id objc_msgSend__setupElementFetcher(void *a1, const char *a2, ...)
{
  return _[a1 _setupElementFetcher];
}

id objc_msgSend__setupLogging(void *a1, const char *a2, ...)
{
  return _[a1 _setupLogging];
}

id objc_msgSend__setupMenuSheet(void *a1, const char *a2, ...)
{
  return _[a1 _setupMenuSheet];
}

id objc_msgSend__setupSubviewConstraints(void *a1, const char *a2, ...)
{
  return _[a1 _setupSubviewConstraints];
}

id objc_msgSend__setupUserInterfaceClient(void *a1, const char *a2, ...)
{
  return _[a1 _setupUserInterfaceClient];
}

id objc_msgSend__shakePressed(void *a1, const char *a2, ...)
{
  return _[a1 _shakePressed];
}

id objc_msgSend__sharedInit(void *a1, const char *a2, ...)
{
  return _[a1 _sharedInit];
}

id objc_msgSend__shiftGestureIfNeeded_onDisplay_toMidpoint_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_shiftGestureIfNeeded:onDisplay:toMidpoint:");
}

id objc_msgSend__shouldFocusToEscapeParentGroup_elementManager_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_shouldFocusToEscapeParentGroup:elementManager:");
}

id objc_msgSend__shouldHandleRealEventWithMultiTouchTool(void *a1, const char *a2, ...)
{
  return _[a1 _shouldHandleRealEventWithMultiTouchTool];
}

id objc_msgSend__shouldHandleSelectActionImmediately(void *a1, const char *a2, ...)
{
  return _[a1 _shouldHandleSelectActionImmediately];
}

id objc_msgSend__shouldIgnoreAllScannerControlMessages(void *a1, const char *a2, ...)
{
  return _[a1 _shouldIgnoreAllScannerControlMessages];
}

id objc_msgSend__shouldIncludeFallbackScrollAncestorActionsInVerticalDirection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_shouldIncludeFallbackScrollAncestorActionsInVerticalDirection:");
}

id objc_msgSend__shouldRepeatGesture(void *a1, const char *a2, ...)
{
  return _[a1 _shouldRepeatGesture];
}

id objc_msgSend__shouldSetFingerContentViewToActive_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_shouldSetFingerContentViewToActive:");
}

id objc_msgSend__shouldShowLargeContentViewer(void *a1, const char *a2, ...)
{
  return _[a1 _shouldShowLargeContentViewer];
}

id objc_msgSend__shouldSwitchControlIgnoreHIDEvent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_shouldSwitchControlIgnoreHIDEvent:");
}

id objc_msgSend__shouldTrackNativeFocusElement(void *a1, const char *a2, ...)
{
  return _[a1 _shouldTrackNativeFocusElement];
}

id objc_msgSend__shouldUseDwellSelection(void *a1, const char *a2, ...)
{
  return _[a1 _shouldUseDwellSelection];
}

id objc_msgSend__shouldUseScanAbortTimer(void *a1, const char *a2, ...)
{
  return _[a1 _shouldUseScanAbortTimer];
}

id objc_msgSend__showAlert_forSource_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_showAlert:forSource:");
}

id objc_msgSend__showScroller_withElement_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_showScroller:withElement:");
}

id objc_msgSend__showSimpleBannerWithText_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_showSimpleBannerWithText:");
}

id objc_msgSend__showsRowsForSelectionPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_showsRowsForSelectionPath:");
}

id objc_msgSend__sideAppPressed_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_sideAppPressed:");
}

id objc_msgSend__siriButtonPressed(void *a1, const char *a2, ...)
{
  return _[a1 _siriButtonPressed];
}

id objc_msgSend__sosPressed(void *a1, const char *a2, ...)
{
  return _[a1 _sosPressed];
}

id objc_msgSend__sourceForFocusContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_sourceForFocusContext:");
}

id objc_msgSend__speakScreenPressed(void *a1, const char *a2, ...)
{
  return _[a1 _speakScreenPressed];
}

id objc_msgSend__spotlightPressed_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_spotlightPressed:");
}

id objc_msgSend__startAccessibilityEventProcessor(void *a1, const char *a2, ...)
{
  return _[a1 _startAccessibilityEventProcessor];
}

id objc_msgSend__startDetectingDevices(void *a1, const char *a2, ...)
{
  return _[a1 _startDetectingDevices];
}

id objc_msgSend__startGeneralTimerWithSelector_actionName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_startGeneralTimerWithSelector:actionName:");
}

id objc_msgSend__startHandlingEvents(void *a1, const char *a2, ...)
{
  return _[a1 _startHandlingEvents];
}

id objc_msgSend__startHandlingReachabilityIfNeeded(void *a1, const char *a2, ...)
{
  return _[a1 _startHandlingReachabilityIfNeeded];
}

id objc_msgSend__startIdleTimer(void *a1, const char *a2, ...)
{
  return _[a1 _startIdleTimer];
}

id objc_msgSend__startOrientationUpdateTimer(void *a1, const char *a2, ...)
{
  return _[a1 _startOrientationUpdateTimer];
}

id objc_msgSend__startRemoteControlEventProcessor(void *a1, const char *a2, ...)
{
  return _[a1 _startRemoteControlEventProcessor];
}

id objc_msgSend__startTellMeWhenTimerWithSelector_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_startTellMeWhenTimerWithSelector:");
}

id objc_msgSend__startWaitingForFetchAfterTemporaryPause(void *a1, const char *a2, ...)
{
  return _[a1 _startWaitingForFetchAfterTemporaryPause];
}

id objc_msgSend__startingPointForGestures(void *a1, const char *a2, ...)
{
  return _[a1 _startingPointForGestures];
}

id objc_msgSend__startingPointForGesturesForPointPicker_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_startingPointForGesturesForPointPicker:");
}

id objc_msgSend__startingPointsAsStrings(void *a1, const char *a2, ...)
{
  return _[a1 _startingPointsAsStrings];
}

id objc_msgSend__stepToNextFocusContextInDirection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_stepToNextFocusContextInDirection:");
}

id objc_msgSend__stopAccessibilityEventProcessor(void *a1, const char *a2, ...)
{
  return _[a1 _stopAccessibilityEventProcessor];
}

id objc_msgSend__stopDetectingDevices(void *a1, const char *a2, ...)
{
  return _[a1 _stopDetectingDevices];
}

id objc_msgSend__stopHandlingEvents(void *a1, const char *a2, ...)
{
  return _[a1 _stopHandlingEvents];
}

id objc_msgSend__stopRemoteControlEventProcessor(void *a1, const char *a2, ...)
{
  return _[a1 _stopRemoteControlEventProcessor];
}

id objc_msgSend__stopWaitingForFetchAfterTemporaryPause(void *a1, const char *a2, ...)
{
  return _[a1 _stopWaitingForFetchAfterTemporaryPause];
}

id objc_msgSend__stringForGroupEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_stringForGroupEnabled:");
}

id objc_msgSend__stringForRingerOn_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_stringForRingerOn:");
}

id objc_msgSend__stringForSoundEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_stringForSoundEnabled:");
}

id objc_msgSend__stringForSpeechEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_stringForSpeechEnabled:");
}

id objc_msgSend__strokeColorForTheme_level_highVisibility_options_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_strokeColorForTheme:level:highVisibility:options:");
}

id objc_msgSend__sweepAnimationForLayer_parentBounds_slowdownMultiplier_direction_animationKey_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_sweepAnimationForLayer:parentBounds:slowdownMultiplier:direction:animationKey:");
}

id objc_msgSend__switchConfigurationHasScreenSwitch(void *a1, const char *a2, ...)
{
  return _[a1 _switchConfigurationHasScreenSwitch];
}

id objc_msgSend__switchDisplayNameForKeyCode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_switchDisplayNameForKeyCode:");
}

id objc_msgSend__switchEventWithAction_longPressAction_start_switchIdentifier_switchDisplayName_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_switchEventWithAction:longPressAction:start:switchIdentifier:switchDisplayName:");
}

id objc_msgSend__switchKeyForEvent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_switchKeyForEvent:");
}

id objc_msgSend__sysdiagnosePressed(void *a1, const char *a2, ...)
{
  return _[a1 _sysdiagnosePressed];
}

id objc_msgSend__systemImageNameForHardwareActionString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_systemImageNameForHardwareActionString:");
}

id objc_msgSend__tailPoint(void *a1, const char *a2, ...)
{
  return _[a1 _tailPoint];
}

id objc_msgSend__tapPressed_fromButtonPress_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_tapPressed:fromButtonPress:");
}

id objc_msgSend__tapticEngine(void *a1, const char *a2, ...)
{
  return _[a1 _tapticEngine];
}

id objc_msgSend__theme_level_forFocusContext_cursor_options_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_theme:level:forFocusContext:cursor:options:");
}

id objc_msgSend__title_imageForNavigationItem_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_title:imageForNavigationItem:");
}

id objc_msgSend__titleForLocalizableString_state_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_titleForLocalizableString:state:");
}

id objc_msgSend__toggleAppSwitcher(void *a1, const char *a2, ...)
{
  return _[a1 _toggleAppSwitcher];
}

id objc_msgSend__toggleHoverTextTyping(void *a1, const char *a2, ...)
{
  return _[a1 _toggleHoverTextTyping];
}

id objc_msgSend__toggleMute(void *a1, const char *a2, ...)
{
  return _[a1 _toggleMute];
}

id objc_msgSend__trackLastFocusedKeyboardItem_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_trackLastFocusedKeyboardItem:");
}

id objc_msgSend__trackLastScannedElementCommunityFromFocusContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_trackLastScannedElementCommunityFromFocusContext:");
}

id objc_msgSend__traitCollectionDidChange_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_traitCollectionDidChange:");
}

id objc_msgSend__transformForOrientation(void *a1, const char *a2, ...)
{
  return _[a1 _transformForOrientation];
}

id objc_msgSend__tripleClickHomePressed(void *a1, const char *a2, ...)
{
  return _[a1 _tripleClickHomePressed];
}

id objc_msgSend__tripleHome(void *a1, const char *a2, ...)
{
  return _[a1 _tripleHome];
}

id objc_msgSend__typeToSiriButtonPressed(void *a1, const char *a2, ...)
{
  return _[a1 _typeToSiriButtonPressed];
}

id objc_msgSend__typingCandidates(void *a1, const char *a2, ...)
{
  return _[a1 _typingCandidates];
}

id objc_msgSend__uncacheArrowPaths(void *a1, const char *a2, ...)
{
  return _[a1 _uncacheArrowPaths];
}

id objc_msgSend__unobstructedOverflowFrameForScroller_originalOverflowFrame_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_unobstructedOverflowFrameForScroller:originalOverflowFrame:");
}

id objc_msgSend__unregisterIOFilter(void *a1, const char *a2, ...)
{
  return _[a1 _unregisterIOFilter];
}

id objc_msgSend__updateATVRemoteInputSource(void *a1, const char *a2, ...)
{
  return _[a1 _updateATVRemoteInputSource];
}

id objc_msgSend__updateAccessibilityEventInputSource(void *a1, const char *a2, ...)
{
  return _[a1 _updateAccessibilityEventInputSource];
}

id objc_msgSend__updateActionsForSource_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateActionsForSource:");
}

id objc_msgSend__updateActiveElementManager(void *a1, const char *a2, ...)
{
  return _[a1 _updateActiveElementManager];
}

id objc_msgSend__updateActiveElementManager_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateActiveElementManager:");
}

id objc_msgSend__updateAlternateKeys(void *a1, const char *a2, ...)
{
  return _[a1 _updateAlternateKeys];
}

id objc_msgSend__updateAnimationKeyWithPrefix_direction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateAnimationKeyWithPrefix:direction:");
}

id objc_msgSend__updateAppearanceForStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateAppearanceForStyle:");
}

id objc_msgSend__updateAudioSessionProperties(void *a1, const char *a2, ...)
{
  return _[a1 _updateAudioSessionProperties];
}

id objc_msgSend__updateAudioSessionState(void *a1, const char *a2, ...)
{
  return _[a1 _updateAudioSessionState];
}

id objc_msgSend__updateBackButtonVisibility(void *a1, const char *a2, ...)
{
  return _[a1 _updateBackButtonVisibility];
}

id objc_msgSend__updateBackdropWithPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateBackdropWithPath:");
}

id objc_msgSend__updateContentSizeForSheet_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateContentSizeForSheet:");
}

id objc_msgSend__updateControls(void *a1, const char *a2, ...)
{
  return _[a1 _updateControls];
}

id objc_msgSend__updateCursor_withFocusContext_shouldAnimate_options_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateCursor:withFocusContext:shouldAnimate:options:");
}

id objc_msgSend__updateCurvatureControl_withTailPoint_tailAngle_distance_curvature_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateCurvatureControl:withTailPoint:tailAngle:distance:curvature:");
}

id objc_msgSend__updateDuckingMode(void *a1, const char *a2, ...)
{
  return _[a1 _updateDuckingMode];
}

id objc_msgSend__updateElementVisuals(void *a1, const char *a2, ...)
{
  return _[a1 _updateElementVisuals];
}

id objc_msgSend__updateFallbackScrollAncestorsForElement_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateFallbackScrollAncestorsForElement:");
}

id objc_msgSend__updateFont(void *a1, const char *a2, ...)
{
  return _[a1 _updateFont];
}

id objc_msgSend__updateForGeometryChange(void *a1, const char *a2, ...)
{
  return _[a1 _updateForGeometryChange];
}

id objc_msgSend__updateGamepadInputSource(void *a1, const char *a2, ...)
{
  return _[a1 _updateGamepadInputSource];
}

id objc_msgSend__updateGridProperties(void *a1, const char *a2, ...)
{
  return _[a1 _updateGridProperties];
}

id objc_msgSend__updateImage(void *a1, const char *a2, ...)
{
  return _[a1 _updateImage];
}

id objc_msgSend__updateImageView(void *a1, const char *a2, ...)
{
  return _[a1 _updateImageView];
}

id objc_msgSend__updateInputSources(void *a1, const char *a2, ...)
{
  return _[a1 _updateInputSources];
}

id objc_msgSend__updateInterDeviceInputSource(void *a1, const char *a2, ...)
{
  return _[a1 _updateInterDeviceInputSource];
}

id objc_msgSend__updateIsInputCoalesceEnabled(void *a1, const char *a2, ...)
{
  return _[a1 _updateIsInputCoalesceEnabled];
}

id objc_msgSend__updateIsInputHoldEnabled(void *a1, const char *a2, ...)
{
  return _[a1 _updateIsInputHoldEnabled];
}

id objc_msgSend__updateIsInputRepeatEnabled(void *a1, const char *a2, ...)
{
  return _[a1 _updateIsInputRepeatEnabled];
}

id objc_msgSend__updateKeyboardFocusIfNeeded(void *a1, const char *a2, ...)
{
  return _[a1 _updateKeyboardFocusIfNeeded];
}

id objc_msgSend__updateKeyboardInputSource(void *a1, const char *a2, ...)
{
  return _[a1 _updateKeyboardInputSource];
}

id objc_msgSend__updateLabelText(void *a1, const char *a2, ...)
{
  return _[a1 _updateLabelText];
}

id objc_msgSend__updateLargeContentViewerIfNeededForView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateLargeContentViewerIfNeededForView:");
}

id objc_msgSend__updateMFIInputSource(void *a1, const char *a2, ...)
{
  return _[a1 _updateMFIInputSource];
}

id objc_msgSend__updateMIDIInputSource(void *a1, const char *a2, ...)
{
  return _[a1 _updateMIDIInputSource];
}

id objc_msgSend__updateMenuAfterElementFetchFoundNewElements_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateMenuAfterElementFetchFoundNewElements:");
}

id objc_msgSend__updateMenuLayoutForSheet_sheetViewController_animated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateMenuLayoutForSheet:sheetViewController:animated:");
}

id objc_msgSend__updateMenuOpeningElementEnabledWithFocusContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateMenuOpeningElementEnabledWithFocusContext:");
}

id objc_msgSend__updateNubbitEdgePosition_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateNubbitEdgePosition:");
}

id objc_msgSend__updateNubbitFadedProperties(void *a1, const char *a2, ...)
{
  return _[a1 _updateNubbitFadedProperties];
}

id objc_msgSend__updateNubbitPosition(void *a1, const char *a2, ...)
{
  return _[a1 _updateNubbitPosition];
}

id objc_msgSend__updateOptionsIfNeeded_withResultElement_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateOptionsIfNeeded:withResultElement:");
}

id objc_msgSend__updatePresentationProperties_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updatePresentationProperties:");
}

id objc_msgSend__updateProgress_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateProgress:");
}

id objc_msgSend__updatePromptBackdropViewMask(void *a1, const char *a2, ...)
{
  return _[a1 _updatePromptBackdropViewMask];
}

id objc_msgSend__updateRemoteControlInputSource(void *a1, const char *a2, ...)
{
  return _[a1 _updateRemoteControlInputSource];
}

id objc_msgSend__updateRockerItemIfNeededForItem_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateRockerItemIfNeededForItem:");
}

id objc_msgSend__updateRockerReachability(void *a1, const char *a2, ...)
{
  return _[a1 _updateRockerReachability];
}

id objc_msgSend__updateRotation90Controls(void *a1, const char *a2, ...)
{
  return _[a1 _updateRotation90Controls];
}

id objc_msgSend__updateRotationControls(void *a1, const char *a2, ...)
{
  return _[a1 _updateRotationControls];
}

id objc_msgSend__updateScanningStyle(void *a1, const char *a2, ...)
{
  return _[a1 _updateScanningStyle];
}

id objc_msgSend__updateScreenInputSource(void *a1, const char *a2, ...)
{
  return _[a1 _updateScreenInputSource];
}

id objc_msgSend__updateScrollableElement(void *a1, const char *a2, ...)
{
  return _[a1 _updateScrollableElement];
}

id objc_msgSend__updateSelectedButton(void *a1, const char *a2, ...)
{
  return _[a1 _updateSelectedButton];
}

id objc_msgSend__updateShowsFingers(void *a1, const char *a2, ...)
{
  return _[a1 _updateShowsFingers];
}

id objc_msgSend__updateSpeakScreenStatus(void *a1, const char *a2, ...)
{
  return _[a1 _updateSpeakScreenStatus];
}

id objc_msgSend__updateStartingPointForGesturesWithScreenPoint_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateStartingPointForGesturesWithScreenPoint:");
}

id objc_msgSend__updateStartingPointForGesturesWithScreenPoint_forDisplayID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateStartingPointForGesturesWithScreenPoint:forDisplayID:");
}

id objc_msgSend__updateTimeIntervalBeforeSendAction(void *a1, const char *a2, ...)
{
  return _[a1 _updateTimeIntervalBeforeSendAction];
}

id objc_msgSend__updateTimeIntervalBeforeSendRepeatAction(void *a1, const char *a2, ...)
{
  return _[a1 _updateTimeIntervalBeforeSendRepeatAction];
}

id objc_msgSend__updateTimeIntervalBetweenDidSendActions(void *a1, const char *a2, ...)
{
  return _[a1 _updateTimeIntervalBetweenDidSendActions];
}

id objc_msgSend__updateViewsForOrientation(void *a1, const char *a2, ...)
{
  return _[a1 _updateViewsForOrientation];
}

id objc_msgSend__updateVisibleFingers(void *a1, const char *a2, ...)
{
  return _[a1 _updateVisibleFingers];
}

id objc_msgSend__updateVisualProviderWithMenu_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateVisualProviderWithMenu:");
}

id objc_msgSend__updateVisualScrollersWithFocusContext_oldContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateVisualScrollersWithFocusContext:oldContext:");
}

id objc_msgSend__updateVisuals(void *a1, const char *a2, ...)
{
  return _[a1 _updateVisuals];
}

id objc_msgSend__updateVolumeDisplay(void *a1, const char *a2, ...)
{
  return _[a1 _updateVolumeDisplay];
}

id objc_msgSend__updateWithElement_forceUpdate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateWithElement:forceUpdate:");
}

id objc_msgSend__updateZoom_withElement_cursorController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateZoom:withElement:cursorController:");
}

id objc_msgSend__urlForSoundEffect_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_urlForSoundEffect:");
}

id objc_msgSend__urlMatchesLoadableCode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_urlMatchesLoadableCode:");
}

id objc_msgSend__useHighVisibilityImage(void *a1, const char *a2, ...)
{
  return _[a1 _useHighVisibilityImage];
}

id objc_msgSend__useOverrideDeviceCount(void *a1, const char *a2, ...)
{
  return _[a1 _useOverrideDeviceCount];
}

id objc_msgSend__useVibrantBlendMode(void *a1, const char *a2, ...)
{
  return _[a1 _useVibrantBlendMode];
}

id objc_msgSend__userHasDisabledUSBRM(void *a1, const char *a2, ...)
{
  return _[a1 _userHasDisabledUSBRM];
}

id objc_msgSend__usesAVAudioPlayer(void *a1, const char *a2, ...)
{
  return _[a1 _usesAVAudioPlayer];
}

id objc_msgSend__usesCircularNubbit(void *a1, const char *a2, ...)
{
  return _[a1 _usesCircularNubbit];
}

id objc_msgSend__validateNubbitPosition_forKeyboard_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_validateNubbitPosition:forKeyboard:");
}

id objc_msgSend__validatedSelectBehaviorForCurrentSelectBehavior_replacementElement_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_validatedSelectBehaviorForCurrentSelectBehavior:replacementElement:");
}

id objc_msgSend__visibleCellForMenuItem_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_visibleCellForMenuItem:");
}

id objc_msgSend__voiceControlPressed(void *a1, const char *a2, ...)
{
  return _[a1 _voiceControlPressed];
}

id objc_msgSend__voiceOverBundle(void *a1, const char *a2, ...)
{
  return _[a1 _voiceOverBundle];
}

id objc_msgSend__volume(void *a1, const char *a2, ...)
{
  return _[a1 _volume];
}

id objc_msgSend__volumeDown_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_volumeDown:");
}

id objc_msgSend__volumeUp_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_volumeUp:");
}

id objc_msgSend__willStepToNextFocusContext_inDirection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_willStepToNextFocusContext:inDirection:");
}

id objc_msgSend__willTransitionToPhase_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_willTransitionToPhase:");
}

id objc_msgSend__windowWithUserInteractionEnabled_windowLevel_createIfNeeded_purposeIdentifier_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_windowWithUserInteractionEnabled:windowLevel:createIfNeeded:purposeIdentifier:");
}

id objc_msgSend__xNubbitPadding_x_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_xNubbitPadding:x:");
}

id objc_msgSend__xValueForDockItemAtIndex_layoutAttributes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_xValueForDockItemAtIndex:layoutAttributes:");
}

id objc_msgSend__yNubbitPadding_y_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_yNubbitPadding:y:");
}

id objc_msgSend__zoomDictionaryElementWithIndex_direction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_zoomDictionaryElementWithIndex:direction:");
}

id objc_msgSend_absoluteString(void *a1, const char *a2, ...)
{
  return _[a1 absoluteString];
}

id objc_msgSend_accessibilityData(void *a1, const char *a2, ...)
{
  return _[a1 accessibilityData];
}

id objc_msgSend_accessibilityEnabled(void *a1, const char *a2, ...)
{
  return _[a1 accessibilityEnabled];
}

id objc_msgSend_accessibilityEventInputSource(void *a1, const char *a2, ...)
{
  return _[a1 accessibilityEventInputSource];
}

id objc_msgSend_accessibilityEventRepresentationWithSender_usagePage_usage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "accessibilityEventRepresentationWithSender:usagePage:usage:");
}

id objc_msgSend_accessibilityEventUsage(void *a1, const char *a2, ...)
{
  return _[a1 accessibilityEventUsage];
}

id objc_msgSend_accessibilityEventUsagePage(void *a1, const char *a2, ...)
{
  return _[a1 accessibilityEventUsagePage];
}

id objc_msgSend_accessibilityFrame(void *a1, const char *a2, ...)
{
  return _[a1 accessibilityFrame];
}

id objc_msgSend_accessibilityIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 accessibilityIdentifier];
}

id objc_msgSend_accessibilityLabel(void *a1, const char *a2, ...)
{
  return _[a1 accessibilityLabel];
}

id objc_msgSend_accessibilityManager_applicationWasActivated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "accessibilityManager:applicationWasActivated:");
}

id objc_msgSend_accessibilityManager_didFetchElementsForEvent_foundNewElements_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "accessibilityManager:didFetchElementsForEvent:foundNewElements:");
}

id objc_msgSend_accessibilityManager_didReceiveEvent_data_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "accessibilityManager:didReceiveEvent:data:");
}

id objc_msgSend_accessibilityManager_didScheduleFetchEvent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "accessibilityManager:didScheduleFetchEvent:");
}

id objc_msgSend_accessibilityManager_mediaDidBegin_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "accessibilityManager:mediaDidBegin:");
}

id objc_msgSend_accessibilityManager_nativeFocusElementDidChange_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "accessibilityManager:nativeFocusElementDidChange:");
}

id objc_msgSend_accessibilityManager_screenWillChange_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "accessibilityManager:screenWillChange:");
}

id objc_msgSend_accessibilityManager_updateElementVisuals_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "accessibilityManager:updateElementVisuals:");
}

id objc_msgSend_accessibilityManager_willFetchElementsForEvent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "accessibilityManager:willFetchElementsForEvent:");
}

id objc_msgSend_accessibilityManagerShouldPauseScanning_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "accessibilityManagerShouldPauseScanning:");
}

id objc_msgSend_accessibilityManagerShouldResumeScanning_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "accessibilityManagerShouldResumeScanning:");
}

id objc_msgSend_accessibilityObservers(void *a1, const char *a2, ...)
{
  return _[a1 accessibilityObservers];
}

id objc_msgSend_accessibilityRespondsToUserInteraction(void *a1, const char *a2, ...)
{
  return _[a1 accessibilityRespondsToUserInteraction];
}

id objc_msgSend_accessibilityUserDefinedLabel(void *a1, const char *a2, ...)
{
  return _[a1 accessibilityUserDefinedLabel];
}

id objc_msgSend_acquireAssertionToDisableIdleTimerWithReason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "acquireAssertionToDisableIdleTimerWithReason:");
}

id objc_msgSend_action(void *a1, const char *a2, ...)
{
  return _[a1 action];
}

id objc_msgSend_actionCount(void *a1, const char *a2, ...)
{
  return _[a1 actionCount];
}

id objc_msgSend_actionForButtonNumber_withType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "actionForButtonNumber:withType:");
}

id objc_msgSend_actionForHardwareActionString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "actionForHardwareActionString:");
}

id objc_msgSend_actionHandler_shouldActImmediatelyOnActionCount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "actionHandler:shouldActImmediatelyOnActionCount:");
}

id objc_msgSend_actionHandlerDidCancelPendingAction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "actionHandlerDidCancelPendingAction:");
}

id objc_msgSend_actionHandlerDidFireAction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "actionHandlerDidFireAction:");
}

id objc_msgSend_actionHandlerForUI_willPerformDelayedActionOnContext_withCount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "actionHandlerForUI:willPerformDelayedActionOnContext:withCount:");
}

id objc_msgSend_actionHandlerForUIDidCancelPendingAction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "actionHandlerForUIDidCancelPendingAction:");
}

id objc_msgSend_actionHandlerForUIWillFireAction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "actionHandlerForUIWillFireAction:");
}

id objc_msgSend_actionIdentifierForButtonNumber_withType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "actionIdentifierForButtonNumber:withType:");
}

id objc_msgSend_actionIdentifiersToRecipeMappingIndices(void *a1, const char *a2, ...)
{
  return _[a1 actionIdentifiersToRecipeMappingIndices];
}

id objc_msgSend_actionOverride(void *a1, const char *a2, ...)
{
  return _[a1 actionOverride];
}

id objc_msgSend_actionOverrideForUsagePage_usage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "actionOverrideForUsagePage:usage:");
}

id objc_msgSend_actionTimeoutTimer(void *a1, const char *a2, ...)
{
  return _[a1 actionTimeoutTimer];
}

id objc_msgSend_actionToStop(void *a1, const char *a2, ...)
{
  return _[a1 actionToStop];
}

id objc_msgSend_actionType(void *a1, const char *a2, ...)
{
  return _[a1 actionType];
}

id objc_msgSend_actionWithString_shouldQueue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "actionWithString:shouldQueue:");
}

id objc_msgSend_actions(void *a1, const char *a2, ...)
{
  return _[a1 actions];
}

id objc_msgSend_activate(void *a1, const char *a2, ...)
{
  return _[a1 activate];
}

id objc_msgSend_activateActionHandler(void *a1, const char *a2, ...)
{
  return _[a1 activateActionHandler];
}

id objc_msgSend_activateAssistiveTouchAction_fromButtonPress_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "activateAssistiveTouchAction:fromButtonPress:");
}

id objc_msgSend_activateBehavior(void *a1, const char *a2, ...)
{
  return _[a1 activateBehavior];
}

id objc_msgSend_activateConstraints_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "activateConstraints:");
}

id objc_msgSend_activateDetectionMode(void *a1, const char *a2, ...)
{
  return _[a1 activateDetectionMode];
}

id objc_msgSend_activateDisplayItems(void *a1, const char *a2, ...)
{
  return _[a1 activateDisplayItems];
}

id objc_msgSend_activateElement_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "activateElement:");
}

id objc_msgSend_activateHandler(void *a1, const char *a2, ...)
{
  return _[a1 activateHandler];
}

id objc_msgSend_activateHomeButton(void *a1, const char *a2, ...)
{
  return _[a1 activateHomeButton];
}

id objc_msgSend_activateLockButton(void *a1, const char *a2, ...)
{
  return _[a1 activateLockButton];
}

id objc_msgSend_activateMenuItemDown_fromButtonPress_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "activateMenuItemDown:fromButtonPress:");
}

id objc_msgSend_activateMenuItemUp_fromButtonPress_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "activateMenuItemUp:fromButtonPress:");
}

id objc_msgSend_activateSOSMode(void *a1, const char *a2, ...)
{
  return _[a1 activateSOSMode];
}

id objc_msgSend_activateSiri(void *a1, const char *a2, ...)
{
  return _[a1 activateSiri];
}

id objc_msgSend_activateTripleClick(void *a1, const char *a2, ...)
{
  return _[a1 activateTripleClick];
}

id objc_msgSend_activateTypeToSiri(void *a1, const char *a2, ...)
{
  return _[a1 activateTypeToSiri];
}

id objc_msgSend_activateVoiceControl(void *a1, const char *a2, ...)
{
  return _[a1 activateVoiceControl];
}

id objc_msgSend_activationBehavior(void *a1, const char *a2, ...)
{
  return _[a1 activationBehavior];
}

id objc_msgSend_activeContinuousScroller(void *a1, const char *a2, ...)
{
  return _[a1 activeContinuousScroller];
}

id objc_msgSend_activeElementManager(void *a1, const char *a2, ...)
{
  return _[a1 activeElementManager];
}

id objc_msgSend_activeElementManagerForDriver_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "activeElementManagerForDriver:");
}

id objc_msgSend_activeScannerDriver(void *a1, const char *a2, ...)
{
  return _[a1 activeScannerDriver];
}

id objc_msgSend_activeSoundIDs(void *a1, const char *a2, ...)
{
  return _[a1 activeSoundIDs];
}

id objc_msgSend_activityIndicatorView(void *a1, const char *a2, ...)
{
  return _[a1 activityIndicatorView];
}

id objc_msgSend_actualDistanceForPreview(void *a1, const char *a2, ...)
{
  return _[a1 actualDistanceForPreview];
}

id objc_msgSend_actuateFeedback_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "actuateFeedback:");
}

id objc_msgSend_adHocFocusContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "adHocFocusContext:");
}

id objc_msgSend_addAnimation_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addAnimation:forKey:");
}

id objc_msgSend_addArcWithCenter_radius_startAngle_endAngle_clockwise_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addArcWithCenter:radius:startAngle:endAngle:clockwise:");
}

id objc_msgSend_addAttributesToAction_fromDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addAttributesToAction:fromDictionary:");
}

id objc_msgSend_addChildViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addChildViewController:");
}

id objc_msgSend_addConstraints_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addConstraints:");
}

id objc_msgSend_addEventHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addEventHandler:");
}

id objc_msgSend_addLineToPoint_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addLineToPoint:");
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

id objc_msgSend_addObserver_selector_name_object_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObserver:selector:name:object:");
}

id objc_msgSend_addObserverForName_object_queue_usingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObserverForName:object:queue:usingBlock:");
}

id objc_msgSend_addPointer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addPointer:");
}

id objc_msgSend_addPostFetchFilter_withIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addPostFetchFilter:withIdentifier:");
}

id objc_msgSend_addProvider_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addProvider:");
}

id objc_msgSend_addProviderWithElements_passingTest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addProviderWithElements:passingTest:");
}

id objc_msgSend_addReasonToDisableScanning_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addReasonToDisableScanning:");
}

id objc_msgSend_addSublayer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addSublayer:");
}

id objc_msgSend_addSubview_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addSubview:");
}

id objc_msgSend_addTarget_action_forControlEvents_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addTarget:action:forControlEvents:");
}

id objc_msgSend_addToRunLoop_forMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addToRunLoop:forMode:");
}

id objc_msgSend_addUserInterfaceClientEnabler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addUserInterfaceClientEnabler:");
}

id objc_msgSend_additionalAXNotificationsToObserve(void *a1, const char *a2, ...)
{
  return _[a1 additionalAXNotificationsToObserve];
}

id objc_msgSend_additionalFlags(void *a1, const char *a2, ...)
{
  return _[a1 additionalFlags];
}

id objc_msgSend_addressString(void *a1, const char *a2, ...)
{
  return _[a1 addressString];
}

id objc_msgSend_adjustSystemZoom_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "adjustSystemZoom:");
}

id objc_msgSend_adjustVisibleItemOffsetForPageBoundary(void *a1, const char *a2, ...)
{
  return _[a1 adjustVisibleItemOffsetForPageBoundary];
}

id objc_msgSend_afterDelay_processBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "afterDelay:processBlock:");
}

id objc_msgSend_afterDelay_processBlock_cancelBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "afterDelay:processBlock:cancelBlock:");
}

id objc_msgSend_alertDidAppear_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "alertDidAppear:");
}

id objc_msgSend_allAuxiliaryElementManagers(void *a1, const char *a2, ...)
{
  return _[a1 allAuxiliaryElementManagers];
}

id objc_msgSend_allElements(void *a1, const char *a2, ...)
{
  return _[a1 allElements];
}

id objc_msgSend_allObjects(void *a1, const char *a2, ...)
{
  return _[a1 allObjects];
}

id objc_msgSend_allTargets(void *a1, const char *a2, ...)
{
  return _[a1 allTargets];
}

id objc_msgSend_allValues(void *a1, const char *a2, ...)
{
  return _[a1 allValues];
}

id objc_msgSend_allowsBackAction(void *a1, const char *a2, ...)
{
  return _[a1 allowsBackAction];
}

id objc_msgSend_allowsDwellScanningToAbortAfterTimeout(void *a1, const char *a2, ...)
{
  return _[a1 allowsDwellScanningToAbortAfterTimeout];
}

id objc_msgSend_allowsDwellSelection(void *a1, const char *a2, ...)
{
  return _[a1 allowsDwellSelection];
}

id objc_msgSend_allowsExitAction(void *a1, const char *a2, ...)
{
  return _[a1 allowsExitAction];
}

id objc_msgSend_allowsSelectionRefinement(void *a1, const char *a2, ...)
{
  return _[a1 allowsSelectionRefinement];
}

id objc_msgSend_alpha(void *a1, const char *a2, ...)
{
  return _[a1 alpha];
}

id objc_msgSend_alphaComponent(void *a1, const char *a2, ...)
{
  return _[a1 alphaComponent];
}

id objc_msgSend_alphaForFingers(void *a1, const char *a2, ...)
{
  return _[a1 alphaForFingers];
}

id objc_msgSend_alternateKeysManager(void *a1, const char *a2, ...)
{
  return _[a1 alternateKeysManager];
}

id objc_msgSend_alternateKeysManager_didSelectAlternateKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "alternateKeysManager:didSelectAlternateKey:");
}

id objc_msgSend_alternateTipElement(void *a1, const char *a2, ...)
{
  return _[a1 alternateTipElement];
}

id objc_msgSend_alwaysShowMenu(void *a1, const char *a2, ...)
{
  return _[a1 alwaysShowMenu];
}

id objc_msgSend_angle(void *a1, const char *a2, ...)
{
  return _[a1 angle];
}

id objc_msgSend_angleForFreehandSheet_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "angleForFreehandSheet:");
}

id objc_msgSend_animateToTapWithDuration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "animateToTapWithDuration:");
}

id objc_msgSend_animateWithDuration_animations_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "animateWithDuration:animations:");
}

id objc_msgSend_animateWithDuration_animations_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "animateWithDuration:animations:completion:");
}

id objc_msgSend_animateWithDuration_delay_options_animations_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "animateWithDuration:delay:options:animations:completion:");
}

id objc_msgSend_animationEndButtonForButtonTag_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "animationEndButtonForButtonTag:");
}

id objc_msgSend_animationForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "animationForKey:");
}

id objc_msgSend_animationKey(void *a1, const char *a2, ...)
{
  return _[a1 animationKey];
}

id objc_msgSend_animationKeys(void *a1, const char *a2, ...)
{
  return _[a1 animationKeys];
}

id objc_msgSend_animationWithKeyPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "animationWithKeyPath:");
}

id objc_msgSend_anyObject(void *a1, const char *a2, ...)
{
  return _[a1 anyObject];
}

id objc_msgSend_appTransitionDidOccur_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appTransitionDidOccur:");
}

id objc_msgSend_appValidationTestingMode(void *a1, const char *a2, ...)
{
  return _[a1 appValidationTestingMode];
}

id objc_msgSend_appendAuxiliaryElementManager_withRole_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appendAuxiliaryElementManager:withRole:");
}

id objc_msgSend_appendFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appendFormat:");
}

id objc_msgSend_appendPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appendPath:");
}

id objc_msgSend_appendString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appendString:");
}

id objc_msgSend_appleTVRemote(void *a1, const char *a2, ...)
{
  return _[a1 appleTVRemote];
}

id objc_msgSend_appleTVRemoteViewController(void *a1, const char *a2, ...)
{
  return _[a1 appleTVRemoteViewController];
}

id objc_msgSend_application(void *a1, const char *a2, ...)
{
  return _[a1 application];
}

id objc_msgSend_applicationIsRTL(void *a1, const char *a2, ...)
{
  return _[a1 applicationIsRTL];
}

id objc_msgSend_applyElementAttributeCacheScheme_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "applyElementAttributeCacheScheme:");
}

id objc_msgSend_areFingersPressed(void *a1, const char *a2, ...)
{
  return _[a1 areFingersPressed];
}

id objc_msgSend_areItemsSorted(void *a1, const char *a2, ...)
{
  return _[a1 areItemsSorted];
}

id objc_msgSend_areSoundEffectsEnabled(void *a1, const char *a2, ...)
{
  return _[a1 areSoundEffectsEnabled];
}

id objc_msgSend_armApplePay(void *a1, const char *a2, ...)
{
  return _[a1 armApplePay];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return _[a1 array];
}

id objc_msgSend_arrayByAddingObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayByAddingObject:");
}

id objc_msgSend_arrayWithAXAttribute_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithAXAttribute:");
}

id objc_msgSend_arrayWithArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithArray:");
}

id objc_msgSend_arrayWithCapacity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithCapacity:");
}

id objc_msgSend_arrayWithObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithObject:");
}

id objc_msgSend_arrayWithObjects_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithObjects:");
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_arrowHeadBaseAngle(void *a1, const char *a2, ...)
{
  return _[a1 arrowHeadBaseAngle];
}

id objc_msgSend_arrowHeadBaseOffset(void *a1, const char *a2, ...)
{
  return _[a1 arrowHeadBaseOffset];
}

id objc_msgSend_arrowHeadBaseRadius(void *a1, const char *a2, ...)
{
  return _[a1 arrowHeadBaseRadius];
}

id objc_msgSend_arrowHeadTipOffset(void *a1, const char *a2, ...)
{
  return _[a1 arrowHeadTipOffset];
}

id objc_msgSend_arrowView(void *a1, const char *a2, ...)
{
  return _[a1 arrowView];
}

id objc_msgSend_assertionWithType_identifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "assertionWithType:identifier:");
}

id objc_msgSend_assistiveTouchActionRepeatEnabled(void *a1, const char *a2, ...)
{
  return _[a1 assistiveTouchActionRepeatEnabled];
}

id objc_msgSend_assistiveTouchActionRepeatInterval(void *a1, const char *a2, ...)
{
  return _[a1 assistiveTouchActionRepeatInterval];
}

id objc_msgSend_assistiveTouchAlwaysShowMenuEnabled(void *a1, const char *a2, ...)
{
  return _[a1 assistiveTouchAlwaysShowMenuEnabled];
}

id objc_msgSend_assistiveTouchAxisSweepSpeed(void *a1, const char *a2, ...)
{
  return _[a1 assistiveTouchAxisSweepSpeed];
}

id objc_msgSend_assistiveTouchCursorColor(void *a1, const char *a2, ...)
{
  return _[a1 assistiveTouchCursorColor];
}

id objc_msgSend_assistiveTouchCustomGestures(void *a1, const char *a2, ...)
{
  return _[a1 assistiveTouchCustomGestures];
}

id objc_msgSend_assistiveTouchDelayAfterInput(void *a1, const char *a2, ...)
{
  return _[a1 assistiveTouchDelayAfterInput];
}

id objc_msgSend_assistiveTouchDelayAfterInputEnabled(void *a1, const char *a2, ...)
{
  return _[a1 assistiveTouchDelayAfterInputEnabled];
}

id objc_msgSend_assistiveTouchDidLaunch(void *a1, const char *a2, ...)
{
  return _[a1 assistiveTouchDidLaunch];
}

id objc_msgSend_assistiveTouchDoubleTapAction(void *a1, const char *a2, ...)
{
  return _[a1 assistiveTouchDoubleTapAction];
}

id objc_msgSend_assistiveTouchDoubleTapActionTimeout(void *a1, const char *a2, ...)
{
  return _[a1 assistiveTouchDoubleTapActionTimeout];
}

id objc_msgSend_assistiveTouchGameControllerEnabled(void *a1, const char *a2, ...)
{
  return _[a1 assistiveTouchGameControllerEnabled];
}

id objc_msgSend_assistiveTouchGroupElementsEnabled(void *a1, const char *a2, ...)
{
  return _[a1 assistiveTouchGroupElementsEnabled];
}

id objc_msgSend_assistiveTouchIdleOpacity(void *a1, const char *a2, ...)
{
  return _[a1 assistiveTouchIdleOpacity];
}

id objc_msgSend_assistiveTouchInputCoalescingDuration(void *a1, const char *a2, ...)
{
  return _[a1 assistiveTouchInputCoalescingDuration];
}

id objc_msgSend_assistiveTouchInputCoalescingEnabled(void *a1, const char *a2, ...)
{
  return _[a1 assistiveTouchInputCoalescingEnabled];
}

id objc_msgSend_assistiveTouchInputHoldDuration(void *a1, const char *a2, ...)
{
  return _[a1 assistiveTouchInputHoldDuration];
}

id objc_msgSend_assistiveTouchInputHoldEnabled(void *a1, const char *a2, ...)
{
  return _[a1 assistiveTouchInputHoldEnabled];
}

id objc_msgSend_assistiveTouchInternalOnlyHiddenNubbitModeEnabled(void *a1, const char *a2, ...)
{
  return _[a1 assistiveTouchInternalOnlyHiddenNubbitModeEnabled];
}

id objc_msgSend_assistiveTouchLongPressAction(void *a1, const char *a2, ...)
{
  return _[a1 assistiveTouchLongPressAction];
}

id objc_msgSend_assistiveTouchLongPressActionDuration(void *a1, const char *a2, ...)
{
  return _[a1 assistiveTouchLongPressActionDuration];
}

id objc_msgSend_assistiveTouchLongPressDuration(void *a1, const char *a2, ...)
{
  return _[a1 assistiveTouchLongPressDuration];
}

id objc_msgSend_assistiveTouchLongPressEnabled(void *a1, const char *a2, ...)
{
  return _[a1 assistiveTouchLongPressEnabled];
}

id objc_msgSend_assistiveTouchLongPressPauseScanningEnabled(void *a1, const char *a2, ...)
{
  return _[a1 assistiveTouchLongPressPauseScanningEnabled];
}

id objc_msgSend_assistiveTouchMainScreenCustomization(void *a1, const char *a2, ...)
{
  return _[a1 assistiveTouchMainScreenCustomization];
}

id objc_msgSend_assistiveTouchMouseClickSoundsEnabled(void *a1, const char *a2, ...)
{
  return _[a1 assistiveTouchMouseClickSoundsEnabled];
}

id objc_msgSend_assistiveTouchOpenMenuSwaggleEnabled(void *a1, const char *a2, ...)
{
  return _[a1 assistiveTouchOpenMenuSwaggleEnabled];
}

id objc_msgSend_assistiveTouchOrbAction(void *a1, const char *a2, ...)
{
  return _[a1 assistiveTouchOrbAction];
}

id objc_msgSend_assistiveTouchPreferredPointPicker(void *a1, const char *a2, ...)
{
  return _[a1 assistiveTouchPreferredPointPicker];
}

id objc_msgSend_assistiveTouchRecentGestures(void *a1, const char *a2, ...)
{
  return _[a1 assistiveTouchRecentGestures];
}

id objc_msgSend_assistiveTouchSavedGestures(void *a1, const char *a2, ...)
{
  return _[a1 assistiveTouchSavedGestures];
}

id objc_msgSend_assistiveTouchScanCycles(void *a1, const char *a2, ...)
{
  return _[a1 assistiveTouchScanCycles];
}

id objc_msgSend_assistiveTouchScanTimeout(void *a1, const char *a2, ...)
{
  return _[a1 assistiveTouchScanTimeout];
}

id objc_msgSend_assistiveTouchScanTimeoutEnabled(void *a1, const char *a2, ...)
{
  return _[a1 assistiveTouchScanTimeoutEnabled];
}

id objc_msgSend_assistiveTouchScannerCursorHighVisibilityEnabled(void *a1, const char *a2, ...)
{
  return _[a1 assistiveTouchScannerCursorHighVisibilityEnabled];
}

id objc_msgSend_assistiveTouchScannerMenuLabelsEnabled(void *a1, const char *a2, ...)
{
  return _[a1 assistiveTouchScannerMenuLabelsEnabled];
}

id objc_msgSend_assistiveTouchScannerPointPickerModeEnabled(void *a1, const char *a2, ...)
{
  return _[a1 assistiveTouchScannerPointPickerModeEnabled];
}

id objc_msgSend_assistiveTouchScannerSoundEnabled(void *a1, const char *a2, ...)
{
  return _[a1 assistiveTouchScannerSoundEnabled];
}

id objc_msgSend_assistiveTouchScannerSpeechEnabled(void *a1, const char *a2, ...)
{
  return _[a1 assistiveTouchScannerSpeechEnabled];
}

id objc_msgSend_assistiveTouchScannerSpeechIsInterruptedByScanning(void *a1, const char *a2, ...)
{
  return _[a1 assistiveTouchScannerSpeechIsInterruptedByScanning];
}

id objc_msgSend_assistiveTouchScannerSpeechShouldSpeakTraits(void *a1, const char *a2, ...)
{
  return _[a1 assistiveTouchScannerSpeechShouldSpeakTraits];
}

id objc_msgSend_assistiveTouchScanningMode(void *a1, const char *a2, ...)
{
  return _[a1 assistiveTouchScanningMode];
}

id objc_msgSend_assistiveTouchSingleTapAction(void *a1, const char *a2, ...)
{
  return _[a1 assistiveTouchSingleTapAction];
}

id objc_msgSend_assistiveTouchSpeed(void *a1, const char *a2, ...)
{
  return _[a1 assistiveTouchSpeed];
}

id objc_msgSend_assistiveTouchStepInterval(void *a1, const char *a2, ...)
{
  return _[a1 assistiveTouchStepInterval];
}

id objc_msgSend_assistiveTouchSwitchUsageConfirmed(void *a1, const char *a2, ...)
{
  return _[a1 assistiveTouchSwitchUsageConfirmed];
}

id objc_msgSend_assistiveTouchSwitches(void *a1, const char *a2, ...)
{
  return _[a1 assistiveTouchSwitches];
}

id objc_msgSend_assistiveTouchUsageCount(void *a1, const char *a2, ...)
{
  return _[a1 assistiveTouchUsageCount];
}

id objc_msgSend_at_deviceIconNameForIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "at_deviceIconNameForIdentifier:");
}

id objc_msgSend_attributesAtIndex_effectiveRange_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "attributesAtIndex:effectiveRange:");
}

id objc_msgSend_atvMenuFocusedItemColor(void *a1, const char *a2, ...)
{
  return _[a1 atvMenuFocusedItemColor];
}

id objc_msgSend_atvRemoteInputSource(void *a1, const char *a2, ...)
{
  return _[a1 atvRemoteInputSource];
}

id objc_msgSend_audioSession(void *a1, const char *a2, ...)
{
  return _[a1 audioSession];
}

id objc_msgSend_autoHideTimeout(void *a1, const char *a2, ...)
{
  return _[a1 autoHideTimeout];
}

id objc_msgSend_autoLiftToggledForFreehandSheet_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "autoLiftToggledForFreehandSheet:");
}

id objc_msgSend_autoPressLiftItems(void *a1, const char *a2, ...)
{
  return _[a1 autoPressLiftItems];
}

id objc_msgSend_autoPressToggledForFreehandSheet_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "autoPressToggledForFreehandSheet:");
}

id objc_msgSend_autoScanningDriver(void *a1, const char *a2, ...)
{
  return _[a1 autoScanningDriver];
}

id objc_msgSend_autoScanningInterval(void *a1, const char *a2, ...)
{
  return _[a1 autoScanningInterval];
}

id objc_msgSend_autoTapTimeout(void *a1, const char *a2, ...)
{
  return _[a1 autoTapTimeout];
}

id objc_msgSend_autoscrollInDirection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "autoscrollInDirection:");
}

id objc_msgSend_autoscroller(void *a1, const char *a2, ...)
{
  return _[a1 autoscroller];
}

id objc_msgSend_auxiliaryElementAfter_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "auxiliaryElementAfter:");
}

id objc_msgSend_auxiliaryElementBefore_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "auxiliaryElementBefore:");
}

id objc_msgSend_auxiliaryElementCountWithRole_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "auxiliaryElementCountWithRole:");
}

id objc_msgSend_auxiliaryElementManagers(void *a1, const char *a2, ...)
{
  return _[a1 auxiliaryElementManagers];
}

id objc_msgSend_auxiliaryElementManagersForRole_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "auxiliaryElementManagersForRole:");
}

id objc_msgSend_availabilityDetail(void *a1, const char *a2, ...)
{
  return _[a1 availabilityDetail];
}

id objc_msgSend_availableButtons(void *a1, const char *a2, ...)
{
  return _[a1 availableButtons];
}

id objc_msgSend_availableElements(void *a1, const char *a2, ...)
{
  return _[a1 availableElements];
}

id objc_msgSend_axArrayByIgnoringNilElementsWithCount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "axArrayByIgnoringNilElementsWithCount:");
}

id objc_msgSend_axArrayWithPossiblyNilArrays_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "axArrayWithPossiblyNilArrays:");
}

id objc_msgSend_axElement(void *a1, const char *a2, ...)
{
  return _[a1 axElement];
}

id objc_msgSend_axFilterObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "axFilterObjectsUsingBlock:");
}

id objc_msgSend_axFirstObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "axFirstObjectsUsingBlock:");
}

id objc_msgSend_axGameControllerKeyCodeForEvent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "axGameControllerKeyCodeForEvent:");
}

id objc_msgSend_axManager(void *a1, const char *a2, ...)
{
  return _[a1 axManager];
}

id objc_msgSend_axMapObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "axMapObjectsUsingBlock:");
}

id objc_msgSend_axOrbPreviewWindow(void *a1, const char *a2, ...)
{
  return _[a1 axOrbPreviewWindow];
}

id objc_msgSend_axSafeObjectAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "axSafeObjectAtIndex:");
}

id objc_msgSend_axSafelyAddObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "axSafelyAddObject:");
}

id objc_msgSend_axSafelyAddObjectsFromArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "axSafelyAddObjectsFromArray:");
}

id objc_msgSend_ax_addArcWithFirstPoint_secondPoint_cornerRadius_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ax_addArcWithFirstPoint:secondPoint:cornerRadius:");
}

id objc_msgSend_ax_constraintsToMakeView_sameDimensionsAsView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ax_constraintsToMakeView:sameDimensionsAsView:");
}

id objc_msgSend_ax_containsObjectUsingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ax_containsObjectUsingBlock:");
}

id objc_msgSend_ax_filteredArrayUsingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ax_filteredArrayUsingBlock:");
}

id objc_msgSend_axis(void *a1, const char *a2, ...)
{
  return _[a1 axis];
}

id objc_msgSend_axisContainerView(void *a1, const char *a2, ...)
{
  return _[a1 axisContainerView];
}

id objc_msgSend_axisPointPicker(void *a1, const char *a2, ...)
{
  return _[a1 axisPointPicker];
}

id objc_msgSend_backButtonConstraints(void *a1, const char *a2, ...)
{
  return _[a1 backButtonConstraints];
}

id objc_msgSend_backTitle(void *a1, const char *a2, ...)
{
  return _[a1 backTitle];
}

id objc_msgSend_backdropMaskImage(void *a1, const char *a2, ...)
{
  return _[a1 backdropMaskImage];
}

id objc_msgSend_backdropView(void *a1, const char *a2, ...)
{
  return _[a1 backdropView];
}

id objc_msgSend_backgroundBorderImageView(void *a1, const char *a2, ...)
{
  return _[a1 backgroundBorderImageView];
}

id objc_msgSend_backgroundColor(void *a1, const char *a2, ...)
{
  return _[a1 backgroundColor];
}

id objc_msgSend_backgroundImageView(void *a1, const char *a2, ...)
{
  return _[a1 backgroundImageView];
}

id objc_msgSend_backgroundView(void *a1, const char *a2, ...)
{
  return _[a1 backgroundView];
}

id objc_msgSend_begin(void *a1, const char *a2, ...)
{
  return _[a1 begin];
}

id objc_msgSend_beginContinuousScrollingInDirection_onDisplay_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "beginContinuousScrollingInDirection:onDisplay:");
}

id objc_msgSend_beginDragAtPoint_onDisplay_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "beginDragAtPoint:onDisplay:");
}

id objc_msgSend_beginDragMenuAtPoint_onDisplay_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "beginDragMenuAtPoint:onDisplay:");
}

id objc_msgSend_beginHandlingHIDEventsForReason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "beginHandlingHIDEventsForReason:");
}

id objc_msgSend_beginScanningTimer(void *a1, const char *a2, ...)
{
  return _[a1 beginScanningTimer];
}

id objc_msgSend_beginScanningWithFocusContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "beginScanningWithFocusContext:");
}

id objc_msgSend_beginSelectTimeoutAnimation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "beginSelectTimeoutAnimation:");
}

id objc_msgSend_beginUpdates(void *a1, const char *a2, ...)
{
  return _[a1 beginUpdates];
}

id objc_msgSend_bendForFreehandSheet_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bendForFreehandSheet:");
}

id objc_msgSend_bendLeftForFreehandSheet_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bendLeftForFreehandSheet:");
}

id objc_msgSend_bendMenuItemWithPreferredNumberOfLines_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bendMenuItemWithPreferredNumberOfLines:");
}

id objc_msgSend_bendRightForFreehandSheet_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bendRightForFreehandSheet:");
}

id objc_msgSend_bezierPath(void *a1, const char *a2, ...)
{
  return _[a1 bezierPath];
}

id objc_msgSend_bezierPathWithArcCenter_radius_startAngle_endAngle_clockwise_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:");
}

id objc_msgSend_bezierPathWithCGPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bezierPathWithCGPath:");
}

id objc_msgSend_bezierPathWithRect_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bezierPathWithRect:");
}

id objc_msgSend_bezierPathWithRoundedRect_cornerRadius_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bezierPathWithRoundedRect:cornerRadius:");
}

id objc_msgSend_blackColor(void *a1, const char *a2, ...)
{
  return _[a1 blackColor];
}

id objc_msgSend_bluetoothManager_discoveredDevice_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bluetoothManager:discoveredDevice:");
}

id objc_msgSend_bluetoothManager_forgotDevice_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bluetoothManager:forgotDevice:");
}

id objc_msgSend_boldSystemFontOfSize_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "boldSystemFontOfSize:");
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return _[a1 BOOLValue];
}

id objc_msgSend_BOOLWithAXAttribute_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "BOOLWithAXAttribute:");
}

id objc_msgSend_borderColor(void *a1, const char *a2, ...)
{
  return _[a1 borderColor];
}

id objc_msgSend_borderContainerView(void *a1, const char *a2, ...)
{
  return _[a1 borderContainerView];
}

id objc_msgSend_borderLayer(void *a1, const char *a2, ...)
{
  return _[a1 borderLayer];
}

id objc_msgSend_bottomAnchor(void *a1, const char *a2, ...)
{
  return _[a1 bottomAnchor];
}

id objc_msgSend_bottomMostLeafAXElement(void *a1, const char *a2, ...)
{
  return _[a1 bottomMostLeafAXElement];
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return _[a1 bounds];
}

id objc_msgSend_bringSubviewToFront_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bringSubviewToFront:");
}

id objc_msgSend_bundleId(void *a1, const char *a2, ...)
{
  return _[a1 bundleId];
}

id objc_msgSend_bundleWithURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bundleWithURL:");
}

id objc_msgSend_button(void *a1, const char *a2, ...)
{
  return _[a1 button];
}

id objc_msgSend_buttonDownStartTime(void *a1, const char *a2, ...)
{
  return _[a1 buttonDownStartTime];
}

id objc_msgSend_buttonNumber(void *a1, const char *a2, ...)
{
  return _[a1 buttonNumber];
}

id objc_msgSend_buttonWithTitle_imageName_downBlock_upBlock_dataSource_showWithGuidedAccess_showWithAssistiveAccess_( void *a1, const char *a2, ...)
{
  return _objc_msgSend( a1,  "buttonWithTitle:imageName:downBlock:upBlock:dataSource:showWithGuidedAccess:showWithAssistiveAccess:");
}

id objc_msgSend_cachedRecentSpeechOutputRequests(void *a1, const char *a2, ...)
{
  return _[a1 cachedRecentSpeechOutputRequests];
}

id objc_msgSend_callStackSymbols(void *a1, const char *a2, ...)
{
  return _[a1 callStackSymbols];
}

id objc_msgSend_canBeActiveElementManager(void *a1, const char *a2, ...)
{
  return _[a1 canBeActiveElementManager];
}

id objc_msgSend_canPerformAXAction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "canPerformAXAction:");
}

id objc_msgSend_canReturnControlToForwarderDevice_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "canReturnControlToForwarderDevice:");
}

id objc_msgSend_canSearch(void *a1, const char *a2, ...)
{
  return _[a1 canSearch];
}

id objc_msgSend_canSearchForControllableDevicesWithMenu_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "canSearchForControllableDevicesWithMenu:");
}

id objc_msgSend_canShowASTMousePointer(void *a1, const char *a2, ...)
{
  return _[a1 canShowASTMousePointer];
}

id objc_msgSend_cancel(void *a1, const char *a2, ...)
{
  return _[a1 cancel];
}

id objc_msgSend_cancelCurrentGesture(void *a1, const char *a2, ...)
{
  return _[a1 cancelCurrentGesture];
}

id objc_msgSend_cancelGesture(void *a1, const char *a2, ...)
{
  return _[a1 cancelGesture];
}

id objc_msgSend_cancelPendingAction(void *a1, const char *a2, ...)
{
  return _[a1 cancelPendingAction];
}

id objc_msgSend_cancelPreviousPerformRequestsWithTarget_selector_object_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cancelPreviousPerformRequestsWithTarget:selector:object:");
}

id objc_msgSend_cancelSelectTimeoutAnimationIfNeeded(void *a1, const char *a2, ...)
{
  return _[a1 cancelSelectTimeoutAnimationIfNeeded];
}

id objc_msgSend_cancelSpeech(void *a1, const char *a2, ...)
{
  return _[a1 cancelSpeech];
}

id objc_msgSend_candidateBarManager(void *a1, const char *a2, ...)
{
  return _[a1 candidateBarManager];
}

id objc_msgSend_candidateBarManager_hasValidTypingCandidates_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "candidateBarManager:hasValidTypingCandidates:");
}

id objc_msgSend_capabilitiesForHardware(void *a1, const char *a2, ...)
{
  return _[a1 capabilitiesForHardware];
}

id objc_msgSend_cellForItemAtIndexPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cellForItemAtIndexPath:");
}

id objc_msgSend_cellSizeForTitle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cellSizeForTitle:");
}

id objc_msgSend_center(void *a1, const char *a2, ...)
{
  return _[a1 center];
}

id objc_msgSend_centerItems_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "centerItems:");
}

id objc_msgSend_centerItems_withView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "centerItems:withView:");
}

id objc_msgSend_centerNamed_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "centerNamed:");
}

id objc_msgSend_centerPoint(void *a1, const char *a2, ...)
{
  return _[a1 centerPoint];
}

id objc_msgSend_centerPointImageForGrid_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "centerPointImageForGrid:");
}

id objc_msgSend_centerXAnchor(void *a1, const char *a2, ...)
{
  return _[a1 centerXAnchor];
}

id objc_msgSend_centerYAnchor(void *a1, const char *a2, ...)
{
  return _[a1 centerYAnchor];
}

id objc_msgSend_channel(void *a1, const char *a2, ...)
{
  return _[a1 channel];
}

id objc_msgSend_classForPointPickerView(void *a1, const char *a2, ...)
{
  return _[a1 classForPointPickerView];
}

id objc_msgSend_cleanup(void *a1, const char *a2, ...)
{
  return _[a1 cleanup];
}

id objc_msgSend_clearAllFingersAnimated_endPointForAnimation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearAllFingersAnimated:endPointForAnimation:");
}

id objc_msgSend_clearCachedFrame_cachedVisibleFrame_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearCachedFrame:cachedVisibleFrame:");
}

id objc_msgSend_clearColor(void *a1, const char *a2, ...)
{
  return _[a1 clearColor];
}

id objc_msgSend_clearRecentSpeech(void *a1, const char *a2, ...)
{
  return _[a1 clearRecentSpeech];
}

id objc_msgSend_clearSpeechQueue(void *a1, const char *a2, ...)
{
  return _[a1 clearSpeechQueue];
}

id objc_msgSend_clockwise(void *a1, const char *a2, ...)
{
  return _[a1 clockwise];
}

id objc_msgSend_closeCurrentScanningContext(void *a1, const char *a2, ...)
{
  return _[a1 closeCurrentScanningContext];
}

id objc_msgSend_closePath(void *a1, const char *a2, ...)
{
  return _[a1 closePath];
}

id objc_msgSend_closestElementToElement_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "closestElementToElement:");
}

id objc_msgSend_closestNubbitPositionForPoint_offsetByMidpoint_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "closestNubbitPositionForPoint:offsetByMidpoint:");
}

id objc_msgSend_collectionView(void *a1, const char *a2, ...)
{
  return _[a1 collectionView];
}

id objc_msgSend_collectionView_menuItemForItemAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "collectionView:menuItemForItemAtIndex:");
}

id objc_msgSend_collectionViewCellClass(void *a1, const char *a2, ...)
{
  return _[a1 collectionViewCellClass];
}

id objc_msgSend_collectionViewContentSize(void *a1, const char *a2, ...)
{
  return _[a1 collectionViewContentSize];
}

id objc_msgSend_collectionViewController(void *a1, const char *a2, ...)
{
  return _[a1 collectionViewController];
}

id objc_msgSend_collectionViewLayout(void *a1, const char *a2, ...)
{
  return _[a1 collectionViewLayout];
}

id objc_msgSend_colorWithAlphaComponent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "colorWithAlphaComponent:");
}

id objc_msgSend_colorWithCGColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "colorWithCGColor:");
}

id objc_msgSend_colorWithRed_green_blue_alpha_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "colorWithRed:green:blue:alpha:");
}

id objc_msgSend_colorWithWhite_alpha_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "colorWithWhite:alpha:");
}

id objc_msgSend_commit(void *a1, const char *a2, ...)
{
  return _[a1 commit];
}

id objc_msgSend_completionCallback(void *a1, const char *a2, ...)
{
  return _[a1 completionCallback];
}

id objc_msgSend_compositingLayer(void *a1, const char *a2, ...)
{
  return _[a1 compositingLayer];
}

id objc_msgSend_configurationWithFont_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "configurationWithFont:");
}

id objc_msgSend_configurationWithPointSize_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "configurationWithPointSize:");
}

id objc_msgSend_confirmationSheet(void *a1, const char *a2, ...)
{
  return _[a1 confirmationSheet];
}

id objc_msgSend_conformsToProtocol_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "conformsToProtocol:");
}

id objc_msgSend_constraintEqualToAnchor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "constraintEqualToAnchor:");
}

id objc_msgSend_constraintEqualToAnchor_constant_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "constraintEqualToAnchor:constant:");
}

id objc_msgSend_constraintEqualToConstant_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "constraintEqualToConstant:");
}

id objc_msgSend_constraintEqualToSystemSpacingBelowAnchor_multiplier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "constraintEqualToSystemSpacingBelowAnchor:multiplier:");
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

id objc_msgSend_constraintWithItem_attribute_relatedBy_toItem_attribute_multiplier_constant_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:");
}

id objc_msgSend_containerView(void *a1, const char *a2, ...)
{
  return _[a1 containerView];
}

id objc_msgSend_containingGroupCursorController(void *a1, const char *a2, ...)
{
  return _[a1 containingGroupCursorController];
}

id objc_msgSend_containingGroupFocusedBackgroundImage(void *a1, const char *a2, ...)
{
  return _[a1 containingGroupFocusedBackgroundImage];
}

id objc_msgSend_containsElement_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "containsElement:");
}

id objc_msgSend_containsGestureSheet(void *a1, const char *a2, ...)
{
  return _[a1 containsGestureSheet];
}

id objc_msgSend_containsHIDDevice_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "containsHIDDevice:");
}

id objc_msgSend_containsNativeFocusElement(void *a1, const char *a2, ...)
{
  return _[a1 containsNativeFocusElement];
}

id objc_msgSend_containsObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "containsObject:");
}

id objc_msgSend_containsPoint_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "containsPoint:");
}

id objc_msgSend_containsString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "containsString:");
}

id objc_msgSend_contentPadding(void *a1, const char *a2, ...)
{
  return _[a1 contentPadding];
}

id objc_msgSend_contentView(void *a1, const char *a2, ...)
{
  return _[a1 contentView];
}

id objc_msgSend_contentViewConstraints(void *a1, const char *a2, ...)
{
  return _[a1 contentViewConstraints];
}

id objc_msgSend_contentViewContainer(void *a1, const char *a2, ...)
{
  return _[a1 contentViewContainer];
}

id objc_msgSend_contentViewForGestureProvider_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "contentViewForGestureProvider:");
}

id objc_msgSend_contextElement(void *a1, const char *a2, ...)
{
  return _[a1 contextElement];
}

id objc_msgSend_contextForCustomGestureItemsViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "contextForCustomGestureItemsViewController:");
}

id objc_msgSend_contextIdHostingContextId_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "contextIdHostingContextId:");
}

id objc_msgSend_continueHighlightAfterTouch(void *a1, const char *a2, ...)
{
  return _[a1 continueHighlightAfterTouch];
}

id objc_msgSend_continueScanningWithFocusContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "continueScanningWithFocusContext:");
}

id objc_msgSend_continueScanningWithFocusContext_foundNewElements_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "continueScanningWithFocusContext:foundNewElements:");
}

id objc_msgSend_continuousScrollCurrentSpeedFactor(void *a1, const char *a2, ...)
{
  return _[a1 continuousScrollCurrentSpeedFactor];
}

id objc_msgSend_continuousScrollMode(void *a1, const char *a2, ...)
{
  return _[a1 continuousScrollMode];
}

id objc_msgSend_continuousScrollPickedElement(void *a1, const char *a2, ...)
{
  return _[a1 continuousScrollPickedElement];
}

id objc_msgSend_continuousScrollerGenerationQueue(void *a1, const char *a2, ...)
{
  return _[a1 continuousScrollerGenerationQueue];
}

id objc_msgSend_controlArrowColor(void *a1, const char *a2, ...)
{
  return _[a1 controlArrowColor];
}

id objc_msgSend_controlArrowHeadLargeSideLength(void *a1, const char *a2, ...)
{
  return _[a1 controlArrowHeadLargeSideLength];
}

id objc_msgSend_controlArrowHeadSmallSideLength(void *a1, const char *a2, ...)
{
  return _[a1 controlArrowHeadSmallSideLength];
}

id objc_msgSend_controlArrowHighlightedColor(void *a1, const char *a2, ...)
{
  return _[a1 controlArrowHighlightedColor];
}

id objc_msgSend_controlArrowOutlineColor(void *a1, const char *a2, ...)
{
  return _[a1 controlArrowOutlineColor];
}

id objc_msgSend_controlArrowOutlineThickness(void *a1, const char *a2, ...)
{
  return _[a1 controlArrowOutlineThickness];
}

id objc_msgSend_controlArrowThickness(void *a1, const char *a2, ...)
{
  return _[a1 controlArrowThickness];
}

id objc_msgSend_controlDelegate(void *a1, const char *a2, ...)
{
  return _[a1 controlDelegate];
}

id objc_msgSend_convertFrameToInterfaceOrientation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "convertFrameToInterfaceOrientation:");
}

id objc_msgSend_convertPathToView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "convertPathToView:");
}

id objc_msgSend_convertPoint_fromContextId_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "convertPoint:fromContextId:");
}

id objc_msgSend_convertPoint_fromLayer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "convertPoint:fromLayer:");
}

id objc_msgSend_convertPoint_fromView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "convertPoint:fromView:");
}

id objc_msgSend_convertPoint_fromWindow_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "convertPoint:fromWindow:");
}

id objc_msgSend_convertPoint_toContextId_displayId_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "convertPoint:toContextId:displayId:");
}

id objc_msgSend_convertPoint_toLayer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "convertPoint:toLayer:");
}

id objc_msgSend_convertPoint_toView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "convertPoint:toView:");
}

id objc_msgSend_convertPoint_toWindow_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "convertPoint:toWindow:");
}

id objc_msgSend_convertRect_fromView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "convertRect:fromView:");
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

id objc_msgSend_cornerRadius(void *a1, const char *a2, ...)
{
  return _[a1 cornerRadius];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return _[a1 count];
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_createAndSaveRecipeForInterfaceOrientedHoldPoint_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createAndSaveRecipeForInterfaceOrientedHoldPoint:");
}

id objc_msgSend_createAndSaveRecipeForInterfaceOrientedPoint_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createAndSaveRecipeForInterfaceOrientedPoint:");
}

id objc_msgSend_createNewDevice_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createNewDevice:");
}

id objc_msgSend_creatorHIDEvent(void *a1, const char *a2, ...)
{
  return _[a1 creatorHIDEvent];
}

id objc_msgSend_crownPress_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "crownPress:");
}

id objc_msgSend_crownRotationClockwise_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "crownRotationClockwise:");
}

id objc_msgSend_currentAction(void *a1, const char *a2, ...)
{
  return _[a1 currentAction];
}

id objc_msgSend_currentApplication(void *a1, const char *a2, ...)
{
  return _[a1 currentApplication];
}

id objc_msgSend_currentApplications(void *a1, const char *a2, ...)
{
  return _[a1 currentApplications];
}

id objc_msgSend_currentAuxiliaryElementManager(void *a1, const char *a2, ...)
{
  return _[a1 currentAuxiliaryElementManager];
}

id objc_msgSend_currentContinuousScrollDirection(void *a1, const char *a2, ...)
{
  return _[a1 currentContinuousScrollDirection];
}

id objc_msgSend_currentCycleCount(void *a1, const char *a2, ...)
{
  return _[a1 currentCycleCount];
}

id objc_msgSend_currentDevice(void *a1, const char *a2, ...)
{
  return _[a1 currentDevice];
}

id objc_msgSend_currentDisplayContext(void *a1, const char *a2, ...)
{
  return _[a1 currentDisplayContext];
}

id objc_msgSend_currentDisplayID(void *a1, const char *a2, ...)
{
  return _[a1 currentDisplayID];
}

id objc_msgSend_currentDisplayManager(void *a1, const char *a2, ...)
{
  return _[a1 currentDisplayManager];
}

id objc_msgSend_currentElement(void *a1, const char *a2, ...)
{
  return _[a1 currentElement];
}

id objc_msgSend_currentFocusContext(void *a1, const char *a2, ...)
{
  return _[a1 currentFocusContext];
}

id objc_msgSend_currentHandler(void *a1, const char *a2, ...)
{
  return _[a1 currentHandler];
}

id objc_msgSend_currentHardwareIdentifierForPointer(void *a1, const char *a2, ...)
{
  return _[a1 currentHardwareIdentifierForPointer];
}

id objc_msgSend_currentHoldPoint(void *a1, const char *a2, ...)
{
  return _[a1 currentHoldPoint];
}

id objc_msgSend_currentImage(void *a1, const char *a2, ...)
{
  return _[a1 currentImage];
}

id objc_msgSend_currentKeyForAlternates(void *a1, const char *a2, ...)
{
  return _[a1 currentKeyForAlternates];
}

id objc_msgSend_currentLeftXDisplacement(void *a1, const char *a2, ...)
{
  return _[a1 currentLeftXDisplacement];
}

id objc_msgSend_currentLeftYDisplacement(void *a1, const char *a2, ...)
{
  return _[a1 currentLeftYDisplacement];
}

id objc_msgSend_currentPage(void *a1, const char *a2, ...)
{
  return _[a1 currentPage];
}

id objc_msgSend_currentPoint(void *a1, const char *a2, ...)
{
  return _[a1 currentPoint];
}

id objc_msgSend_currentPointForPointer(void *a1, const char *a2, ...)
{
  return _[a1 currentPointForPointer];
}

id objc_msgSend_currentQueue(void *a1, const char *a2, ...)
{
  return _[a1 currentQueue];
}

id objc_msgSend_currentRecipe(void *a1, const char *a2, ...)
{
  return _[a1 currentRecipe];
}

id objc_msgSend_currentRightXDisplacement(void *a1, const char *a2, ...)
{
  return _[a1 currentRightXDisplacement];
}

id objc_msgSend_currentRightYDisplacement(void *a1, const char *a2, ...)
{
  return _[a1 currentRightYDisplacement];
}

id objc_msgSend_currentRunLoop(void *a1, const char *a2, ...)
{
  return _[a1 currentRunLoop];
}

id objc_msgSend_currentSelectionPath(void *a1, const char *a2, ...)
{
  return _[a1 currentSelectionPath];
}

id objc_msgSend_currentSheet(void *a1, const char *a2, ...)
{
  return _[a1 currentSheet];
}

id objc_msgSend_currentSheetViewController(void *a1, const char *a2, ...)
{
  return _[a1 currentSheetViewController];
}

id objc_msgSend_currentSpeechFocusContext(void *a1, const char *a2, ...)
{
  return _[a1 currentSpeechFocusContext];
}

id objc_msgSend_currentSwitchController(void *a1, const char *a2, ...)
{
  return _[a1 currentSwitchController];
}

id objc_msgSend_currentThread(void *a1, const char *a2, ...)
{
  return _[a1 currentThread];
}

id objc_msgSend_currentXDisplacement(void *a1, const char *a2, ...)
{
  return _[a1 currentXDisplacement];
}

id objc_msgSend_currentYDisplacement(void *a1, const char *a2, ...)
{
  return _[a1 currentYDisplacement];
}

id objc_msgSend_currentlyObservingNotifications(void *a1, const char *a2, ...)
{
  return _[a1 currentlyObservingNotifications];
}

id objc_msgSend_currentlyVisibleRockerItems(void *a1, const char *a2, ...)
{
  return _[a1 currentlyVisibleRockerItems];
}

id objc_msgSend_cursorBackgroundBorderWidth(void *a1, const char *a2, ...)
{
  return _[a1 cursorBackgroundBorderWidth];
}

id objc_msgSend_cursorBackgroundLayer(void *a1, const char *a2, ...)
{
  return _[a1 cursorBackgroundLayer];
}

id objc_msgSend_cursorCompositingLayer(void *a1, const char *a2, ...)
{
  return _[a1 cursorCompositingLayer];
}

id objc_msgSend_cursorContainerLayer(void *a1, const char *a2, ...)
{
  return _[a1 cursorContainerLayer];
}

id objc_msgSend_cursorContainerOpacity(void *a1, const char *a2, ...)
{
  return _[a1 cursorContainerOpacity];
}

id objc_msgSend_cursorElementPadding(void *a1, const char *a2, ...)
{
  return _[a1 cursorElementPadding];
}

id objc_msgSend_cursorForegroundBorderWidth(void *a1, const char *a2, ...)
{
  return _[a1 cursorForegroundBorderWidth];
}

id objc_msgSend_cursorForegroundLayer(void *a1, const char *a2, ...)
{
  return _[a1 cursorForegroundLayer];
}

id objc_msgSend_cursorHighVisibilityMultiplier(void *a1, const char *a2, ...)
{
  return _[a1 cursorHighVisibilityMultiplier];
}

id objc_msgSend_cursorManager(void *a1, const char *a2, ...)
{
  return _[a1 cursorManager];
}

id objc_msgSend_cursorManagerShouldHideMenuCursor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cursorManagerShouldHideMenuCursor:");
}

id objc_msgSend_cursorRoundedRectCornerRadius(void *a1, const char *a2, ...)
{
  return _[a1 cursorRoundedRectCornerRadius];
}

id objc_msgSend_cursorSizes(void *a1, const char *a2, ...)
{
  return _[a1 cursorSizes];
}

id objc_msgSend_cursors(void *a1, const char *a2, ...)
{
  return _[a1 cursors];
}

id objc_msgSend_curvature(void *a1, const char *a2, ...)
{
  return _[a1 curvature];
}

id objc_msgSend_curvatureForFreehandSheet_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "curvatureForFreehandSheet:");
}

id objc_msgSend_customContent(void *a1, const char *a2, ...)
{
  return _[a1 customContent];
}

id objc_msgSend_customGesture(void *a1, const char *a2, ...)
{
  return _[a1 customGesture];
}

id objc_msgSend_customGestureItemsViewController_didChooseGesture_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "customGestureItemsViewController:didChooseGesture:");
}

id objc_msgSend_customGestures(void *a1, const char *a2, ...)
{
  return _[a1 customGestures];
}

id objc_msgSend_customMessageReceived_withData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "customMessageReceived:withData:");
}

id objc_msgSend_customizationMapAllowInstanceActivation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "customizationMapAllowInstanceActivation:");
}

id objc_msgSend_dataWithBytes_length_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataWithBytes:length:");
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return _[a1 date];
}

id objc_msgSend_deactivateConstraints_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deactivateConstraints:");
}

id objc_msgSend_decodeBoolForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "decodeBoolForKey:");
}

id objc_msgSend_decodeObjectForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "decodeObjectForKey:");
}

id objc_msgSend_decreaseAutoscrollSpeed(void *a1, const char *a2, ...)
{
  return _[a1 decreaseAutoscrollSpeed];
}

id objc_msgSend_decreaseCurveControl(void *a1, const char *a2, ...)
{
  return _[a1 decreaseCurveControl];
}

id objc_msgSend_decreaseVelocityForFreehandSheet_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "decreaseVelocityForFreehandSheet:");
}

id objc_msgSend_decreaseVolume(void *a1, const char *a2, ...)
{
  return _[a1 decreaseVolume];
}

id objc_msgSend_decreaseVolumeFocusedBackgroundImage(void *a1, const char *a2, ...)
{
  return _[a1 decreaseVolumeFocusedBackgroundImage];
}

id objc_msgSend_decreaseVolumeView(void *a1, const char *a2, ...)
{
  return _[a1 decreaseVolumeView];
}

id objc_msgSend_decreaseVolumeViewInternal(void *a1, const char *a2, ...)
{
  return _[a1 decreaseVolumeViewInternal];
}

id objc_msgSend_defaultBackgroundImage(void *a1, const char *a2, ...)
{
  return _[a1 defaultBackgroundImage];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return _[a1 defaultCenter];
}

id objc_msgSend_defaultLocationsForNumberOfFingers_aroundPoint_withinBounds_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "defaultLocationsForNumberOfFingers:aroundPoint:withinBounds:");
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return _[a1 defaultManager];
}

id objc_msgSend_defaultParagraphStyle(void *a1, const char *a2, ...)
{
  return _[a1 defaultParagraphStyle];
}

id objc_msgSend_defaultPinchLocationsAroundPoint_withinBounds_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "defaultPinchLocationsAroundPoint:withinBounds:");
}

id objc_msgSend_defaultSideLength(void *a1, const char *a2, ...)
{
  return _[a1 defaultSideLength];
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return _[a1 delegate];
}

id objc_msgSend_delegatesScannerControl(void *a1, const char *a2, ...)
{
  return _[a1 delegatesScannerControl];
}

id objc_msgSend_deltaX(void *a1, const char *a2, ...)
{
  return _[a1 deltaX];
}

id objc_msgSend_deltaY(void *a1, const char *a2, ...)
{
  return _[a1 deltaY];
}

id objc_msgSend_dequeueReusableCellWithReuseIdentifier_forIndexPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dequeueReusableCellWithReuseIdentifier:forIndexPath:");
}

id objc_msgSend_descendantsPassingTest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "descendantsPassingTest:");
}

id objc_msgSend_descender(void *a1, const char *a2, ...)
{
  return _[a1 descender];
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return _[a1 description];
}

id objc_msgSend_detectDevices(void *a1, const char *a2, ...)
{
  return _[a1 detectDevices];
}

id objc_msgSend_device_didPostEvent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "device:didPostEvent:");
}

id objc_msgSend_device_didUnload_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "device:didUnload:");
}

id objc_msgSend_deviceCount(void *a1, const char *a2, ...)
{
  return _[a1 deviceCount];
}

id objc_msgSend_deviceCountChanged_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deviceCountChanged:");
}

id objc_msgSend_deviceDetector(void *a1, const char *a2, ...)
{
  return _[a1 deviceDetector];
}

id objc_msgSend_deviceDetector_didFindDevice_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deviceDetector:didFindDevice:");
}

id objc_msgSend_deviceDetector_unloadDevicesPassingTest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deviceDetector:unloadDevicesPassingTest:");
}

id objc_msgSend_deviceDisappeared(void *a1, const char *a2, ...)
{
  return _[a1 deviceDisappeared];
}

id objc_msgSend_deviceIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 deviceIdentifier];
}

id objc_msgSend_deviceKeys(void *a1, const char *a2, ...)
{
  return _[a1 deviceKeys];
}

id objc_msgSend_deviceManager(void *a1, const char *a2, ...)
{
  return _[a1 deviceManager];
}

id objc_msgSend_deviceOrientation(void *a1, const char *a2, ...)
{
  return _[a1 deviceOrientation];
}

id objc_msgSend_deviceSpecificImage(void *a1, const char *a2, ...)
{
  return _[a1 deviceSpecificImage];
}

id objc_msgSend_deviceType(void *a1, const char *a2, ...)
{
  return _[a1 deviceType];
}

id objc_msgSend_dialectForLanguageID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dialectForLanguageID:");
}

id objc_msgSend_dialectsThatCanSpeakString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dialectsThatCanSpeakString:");
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return _[a1 dictionary];
}

id objc_msgSend_dictionaryRepresentation(void *a1, const char *a2, ...)
{
  return _[a1 dictionaryRepresentation];
}

id objc_msgSend_dictionaryWithCapacity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithCapacity:");
}

id objc_msgSend_dictionaryWithDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithDictionary:");
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_dictionaryWithObjectsAndKeys_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithObjectsAndKeys:");
}

id objc_msgSend_didActivate(void *a1, const char *a2, ...)
{
  return _[a1 didActivate];
}

id objc_msgSend_didActivateElement(void *a1, const char *a2, ...)
{
  return _[a1 didActivateElement];
}

id objc_msgSend_didActivateFingersElement_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didActivateFingersElement:");
}

id objc_msgSend_didActivateMultipleMenuItemsElement_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didActivateMultipleMenuItemsElement:");
}

id objc_msgSend_didAddSubviewToDisplayContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didAddSubviewToDisplayContext:");
}

id objc_msgSend_didBecomeScannerDriver(void *a1, const char *a2, ...)
{
  return _[a1 didBecomeScannerDriver];
}

id objc_msgSend_didBeginLongPressForInputController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didBeginLongPressForInputController:");
}

id objc_msgSend_didBeginLongPressForInputSource_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didBeginLongPressForInputSource:");
}

id objc_msgSend_didCancelGesture_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didCancelGesture:");
}

id objc_msgSend_didChangeOrientation(void *a1, const char *a2, ...)
{
  return _[a1 didChangeOrientation];
}

id objc_msgSend_didChooseAddRecentInCustomGestureItemsViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didChooseAddRecentInCustomGestureItemsViewController:");
}

id objc_msgSend_didChooseArbitraryFlick_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didChooseArbitraryFlick:");
}

id objc_msgSend_didChooseCreateCustomGestureFromGestureProvider_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didChooseCreateCustomGestureFromGestureProvider:");
}

id objc_msgSend_didChooseCreateInCustomGestureItemsViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didChooseCreateInCustomGestureItemsViewController:");
}

id objc_msgSend_didChooseDoubleTapGesture_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didChooseDoubleTapGesture:");
}

id objc_msgSend_didChooseDragGesture_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didChooseDragGesture:");
}

id objc_msgSend_didChooseDrawingGesture_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didChooseDrawingGesture:");
}

id objc_msgSend_didChooseFavorites_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didChooseFavorites:");
}

id objc_msgSend_didChooseFingers_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didChooseFingers:");
}

id objc_msgSend_didChooseFlickDown_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didChooseFlickDown:");
}

id objc_msgSend_didChooseFlickGesture_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didChooseFlickGesture:");
}

id objc_msgSend_didChooseFlickLeft_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didChooseFlickLeft:");
}

id objc_msgSend_didChooseFlickRight_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didChooseFlickRight:");
}

id objc_msgSend_didChooseFlickUp_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didChooseFlickUp:");
}

id objc_msgSend_didChooseForceTouchGesture_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didChooseForceTouchGesture:");
}

id objc_msgSend_didChooseHoldAndDragGesture_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didChooseHoldAndDragGesture:");
}

id objc_msgSend_didChoosePanDown_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didChoosePanDown:");
}

id objc_msgSend_didChoosePanGesture_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didChoosePanGesture:");
}

id objc_msgSend_didChoosePanLeft_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didChoosePanLeft:");
}

id objc_msgSend_didChoosePanRight_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didChoosePanRight:");
}

id objc_msgSend_didChoosePanUp_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didChoosePanUp:");
}

id objc_msgSend_didChoosePinchGesture_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didChoosePinchGesture:");
}

id objc_msgSend_didChoosePinchIn_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didChoosePinchIn:");
}

id objc_msgSend_didChoosePinchOut_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didChoosePinchOut:");
}

id objc_msgSend_didChooseRotateClockwise_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didChooseRotateClockwise:");
}

id objc_msgSend_didChooseRotateCounterclockwise_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didChooseRotateCounterclockwise:");
}

id objc_msgSend_didChooseStop_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didChooseStop:");
}

id objc_msgSend_didConfirmForSheet_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didConfirmForSheet:");
}

id objc_msgSend_didConfirmGesture_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didConfirmGesture:");
}

id objc_msgSend_didEndLongPressForInputController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didEndLongPressForInputController:");
}

id objc_msgSend_didEndLongPressForInputSource_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didEndLongPressForInputSource:");
}

id objc_msgSend_didExitMenuFromSheet_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didExitMenuFromSheet:");
}

id objc_msgSend_didFetchElements_foundNewElements_currentFocusContext_didChangeActiveElementManager_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didFetchElements:foundNewElements:currentFocusContext:didChangeActiveElementManager:");
}

id objc_msgSend_didFinishAsScannerDriver(void *a1, const char *a2, ...)
{
  return _[a1 didFinishAsScannerDriver];
}

id objc_msgSend_didFinishProvidingElements(void *a1, const char *a2, ...)
{
  return _[a1 didFinishProvidingElements];
}

id objc_msgSend_didFocusOnContext_oldContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didFocusOnContext:oldContext:");
}

id objc_msgSend_didGetPhaseChangingAction(void *a1, const char *a2, ...)
{
  return _[a1 didGetPhaseChangingAction];
}

id objc_msgSend_didMoveToParentViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didMoveToParentViewController:");
}

id objc_msgSend_didPauseForReasonsToDisableScanning(void *a1, const char *a2, ...)
{
  return _[a1 didPauseForReasonsToDisableScanning];
}

id objc_msgSend_didPopFreehandSheet_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didPopFreehandSheet:");
}

id objc_msgSend_didPresentWithDisplayContext_animated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didPresentWithDisplayContext:animated:");
}

id objc_msgSend_didPressScreenChangingButton(void *a1, const char *a2, ...)
{
  return _[a1 didPressScreenChangingButton];
}

id objc_msgSend_didPressScreenChangingButtonInMenu_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didPressScreenChangingButtonInMenu:");
}

id objc_msgSend_didPushPinchItemsViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didPushPinchItemsViewController:");
}

id objc_msgSend_didReloadSheet_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didReloadSheet:");
}

id objc_msgSend_didRequestRedoGesture_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didRequestRedoGesture:");
}

id objc_msgSend_didSetFocusContextForResume(void *a1, const char *a2, ...)
{
  return _[a1 didSetFocusContextForResume];
}

id objc_msgSend_didSweepOverPoint_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didSweepOverPoint:");
}

id objc_msgSend_didTransitionToSheet_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didTransitionToSheet:");
}

id objc_msgSend_didUpdateScatMenuItemStyle(void *a1, const char *a2, ...)
{
  return _[a1 didUpdateScatMenuItemStyle];
}

id objc_msgSend_didUpdateSearchResults(void *a1, const char *a2, ...)
{
  return _[a1 didUpdateSearchResults];
}

id objc_msgSend_didUpdateWithDisplayContext_animated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didUpdateWithDisplayContext:animated:");
}

id objc_msgSend_dimmedBackgroundImage(void *a1, const char *a2, ...)
{
  return _[a1 dimmedBackgroundImage];
}

id objc_msgSend_dimmedBorderImage(void *a1, const char *a2, ...)
{
  return _[a1 dimmedBorderImage];
}

id objc_msgSend_dimmedIconImage(void *a1, const char *a2, ...)
{
  return _[a1 dimmedIconImage];
}

id objc_msgSend_directionForOrientedPoint_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "directionForOrientedPoint:");
}

id objc_msgSend_disableDashBoardGesturesAssertion(void *a1, const char *a2, ...)
{
  return _[a1 disableDashBoardGesturesAssertion];
}

id objc_msgSend_disableEventManagement(void *a1, const char *a2, ...)
{
  return _[a1 disableEventManagement];
}

id objc_msgSend_disableIdleTimerAssertion(void *a1, const char *a2, ...)
{
  return _[a1 disableIdleTimerAssertion];
}

id objc_msgSend_disableSystemGesturesAssertion(void *a1, const char *a2, ...)
{
  return _[a1 disableSystemGesturesAssertion];
}

id objc_msgSend_disabled(void *a1, const char *a2, ...)
{
  return _[a1 disabled];
}

id objc_msgSend_dismiss_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dismiss:");
}

id objc_msgSend_dismissAnimated_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dismissAnimated:completion:");
}

id objc_msgSend_dispatchSpeechAction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dispatchSpeechAction:");
}

id objc_msgSend_displayConfiguration(void *a1, const char *a2, ...)
{
  return _[a1 displayConfiguration];
}

id objc_msgSend_displayContextForCursor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "displayContextForCursor:");
}

id objc_msgSend_displayContextForCursor_forDisplayID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "displayContextForCursor:forDisplayID:");
}

id objc_msgSend_displayCornerRadius(void *a1, const char *a2, ...)
{
  return _[a1 displayCornerRadius];
}

id objc_msgSend_displayID(void *a1, const char *a2, ...)
{
  return _[a1 displayID];
}

id objc_msgSend_displayIdentity(void *a1, const char *a2, ...)
{
  return _[a1 displayIdentity];
}

id objc_msgSend_displayLinkWithTarget_selector_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "displayLinkWithTarget:selector:");
}

id objc_msgSend_displayManager(void *a1, const char *a2, ...)
{
  return _[a1 displayManager];
}

id objc_msgSend_displayManagerForDisplayId_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "displayManagerForDisplayId:");
}

id objc_msgSend_displayManagerForHardwareIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "displayManagerForHardwareIdentifier:");
}

id objc_msgSend_displayManagers(void *a1, const char *a2, ...)
{
  return _[a1 displayManagers];
}

id objc_msgSend_displaySourceDelegate(void *a1, const char *a2, ...)
{
  return _[a1 displaySourceDelegate];
}

id objc_msgSend_displaysDidChange_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "displaysDidChange:");
}

id objc_msgSend_distance(void *a1, const char *a2, ...)
{
  return _[a1 distance];
}

id objc_msgSend_distantFuture(void *a1, const char *a2, ...)
{
  return _[a1 distantFuture];
}

id objc_msgSend_dockBottomConstraint(void *a1, const char *a2, ...)
{
  return _[a1 dockBottomConstraint];
}

id objc_msgSend_dockPosition(void *a1, const char *a2, ...)
{
  return _[a1 dockPosition];
}

id objc_msgSend_dockStyleAttributes(void *a1, const char *a2, ...)
{
  return _[a1 dockStyleAttributes];
}

id objc_msgSend_dockTopConstraint(void *a1, const char *a2, ...)
{
  return _[a1 dockTopConstraint];
}

id objc_msgSend_doubleLightPressCameraButton(void *a1, const char *a2, ...)
{
  return _[a1 doubleLightPressCameraButton];
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return _[a1 doubleValue];
}

id objc_msgSend_downArrowButton(void *a1, const char *a2, ...)
{
  return _[a1 downArrowButton];
}

id objc_msgSend_drawAtPoint_blendMode_alpha_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "drawAtPoint:blendMode:alpha:");
}

id objc_msgSend_drawInRect_blendMode_alpha_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "drawInRect:blendMode:alpha:");
}

id objc_msgSend_drawInRect_withAttributes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "drawInRect:withAttributes:");
}

id objc_msgSend_drawingElementManager(void *a1, const char *a2, ...)
{
  return _[a1 drawingElementManager];
}

id objc_msgSend_drawingViewController(void *a1, const char *a2, ...)
{
  return _[a1 drawingViewController];
}

id objc_msgSend_drawingViewController_moveFingersToPoints_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "drawingViewController:moveFingersToPoints:");
}

id objc_msgSend_driver_didFocusOnContext_oldContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "driver:didFocusOnContext:oldContext:");
}

id objc_msgSend_driver_indicateDwellScanningWillAbort_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "driver:indicateDwellScanningWillAbort:");
}

id objc_msgSend_driver_willFocusOnContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "driver:willFocusOnContext:");
}

id objc_msgSend_driver_willUnfocusFromContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "driver:willUnfocusFromContext:");
}

id objc_msgSend_driverDidBecomeActive_didChange_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "driverDidBecomeActive:didChange:");
}

id objc_msgSend_driverDidBecomeInactive_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "driverDidBecomeInactive:");
}

id objc_msgSend_driverDidPause_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "driverDidPause:");
}

id objc_msgSend_driverType(void *a1, const char *a2, ...)
{
  return _[a1 driverType];
}

id objc_msgSend_duration(void *a1, const char *a2, ...)
{
  return _[a1 duration];
}

id objc_msgSend_dwellControlEnabled(void *a1, const char *a2, ...)
{
  return _[a1 dwellControlEnabled];
}

id objc_msgSend_dwellDelay(void *a1, const char *a2, ...)
{
  return _[a1 dwellDelay];
}

id objc_msgSend_dwellDuration(void *a1, const char *a2, ...)
{
  return _[a1 dwellDuration];
}

id objc_msgSend_dwellItems(void *a1, const char *a2, ...)
{
  return _[a1 dwellItems];
}

id objc_msgSend_dwellScanningDriver(void *a1, const char *a2, ...)
{
  return _[a1 dwellScanningDriver];
}

id objc_msgSend_effectWithStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "effectWithStyle:");
}

id objc_msgSend_effectiveStyleAttributes(void *a1, const char *a2, ...)
{
  return _[a1 effectiveStyleAttributes];
}

id objc_msgSend_elemLog(void *a1, const char *a2, ...)
{
  return _[a1 elemLog];
}

id objc_msgSend_element(void *a1, const char *a2, ...)
{
  return _[a1 element];
}

id objc_msgSend_elementAfter_didWrap_options_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "elementAfter:didWrap:options:");
}

id objc_msgSend_elementAtCoordinate_withVisualPadding_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "elementAtCoordinate:withVisualPadding:");
}

id objc_msgSend_elementAtCoordinate_withVisualPadding_displayID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "elementAtCoordinate:withVisualPadding:displayID:");
}

id objc_msgSend_elementAtPoint_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "elementAtPoint:");
}

id objc_msgSend_elementAtPoint_displayID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "elementAtPoint:displayID:");
}

id objc_msgSend_elementBefore_didWrap_options_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "elementBefore:didWrap:options:");
}

id objc_msgSend_elementCommunity(void *a1, const char *a2, ...)
{
  return _[a1 elementCommunity];
}

id objc_msgSend_elementCommunityGroup(void *a1, const char *a2, ...)
{
  return _[a1 elementCommunityGroup];
}

id objc_msgSend_elementFetcher(void *a1, const char *a2, ...)
{
  return _[a1 elementFetcher];
}

id objc_msgSend_elementFinderTimer(void *a1, const char *a2, ...)
{
  return _[a1 elementFinderTimer];
}

id objc_msgSend_elementForAttribute_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "elementForAttribute:");
}

id objc_msgSend_elementForFingers(void *a1, const char *a2, ...)
{
  return _[a1 elementForFingers];
}

id objc_msgSend_elementManager(void *a1, const char *a2, ...)
{
  return _[a1 elementManager];
}

id objc_msgSend_elementNavController(void *a1, const char *a2, ...)
{
  return _[a1 elementNavController];
}

id objc_msgSend_elementParent(void *a1, const char *a2, ...)
{
  return _[a1 elementParent];
}

id objc_msgSend_elementProvider(void *a1, const char *a2, ...)
{
  return _[a1 elementProvider];
}

id objc_msgSend_elementProviderDelegate(void *a1, const char *a2, ...)
{
  return _[a1 elementProviderDelegate];
}

id objc_msgSend_elementProviderForSheet_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "elementProviderForSheet:");
}

id objc_msgSend_elementProviders(void *a1, const char *a2, ...)
{
  return _[a1 elementProviders];
}

id objc_msgSend_elementRef(void *a1, const char *a2, ...)
{
  return _[a1 elementRef];
}

id objc_msgSend_elementWithAXUIElement_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "elementWithAXUIElement:");
}

id objc_msgSend_elementWithUIElement_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "elementWithUIElement:");
}

id objc_msgSend_elements(void *a1, const char *a2, ...)
{
  return _[a1 elements];
}

id objc_msgSend_elementsForMatchingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "elementsForMatchingBlock:");
}

id objc_msgSend_elementsToScroll(void *a1, const char *a2, ...)
{
  return _[a1 elementsToScroll];
}

id objc_msgSend_enableElementFetcherAndNotificationsIfNecessary(void *a1, const char *a2, ...)
{
  return _[a1 enableElementFetcherAndNotificationsIfNecessary];
}

id objc_msgSend_enableEventManagement(void *a1, const char *a2, ...)
{
  return _[a1 enableEventManagement];
}

id objc_msgSend_enabledAuxiliaryElementManagersForRoles_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enabledAuxiliaryElementManagersForRoles:");
}

id objc_msgSend_encodeBool_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "encodeBool:forKey:");
}

id objc_msgSend_encodeObject_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "encodeObject:forKey:");
}

id objc_msgSend_endContinuousScrollingOnDisplay_withCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "endContinuousScrollingOnDisplay:withCompletion:");
}

id objc_msgSend_endDragModeAtPoint_onDisplay_completed_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "endDragModeAtPoint:onDisplay:completed:");
}

id objc_msgSend_endHandlingHIDEventsForReason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "endHandlingHIDEventsForReason:");
}

id objc_msgSend_endPointForLineGesture(void *a1, const char *a2, ...)
{
  return _[a1 endPointForLineGesture];
}

id objc_msgSend_endScanning(void *a1, const char *a2, ...)
{
  return _[a1 endScanning];
}

id objc_msgSend_endUpdates(void *a1, const char *a2, ...)
{
  return _[a1 endUpdates];
}

id objc_msgSend_endUsingFeedback_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "endUsingFeedback:");
}

id objc_msgSend_ensureAssertionsHaveBeenProcessedWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ensureAssertionsHaveBeenProcessedWithCompletion:");
}

id objc_msgSend_ensureHidden_animated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ensureHidden:animated:");
}

id objc_msgSend_enumerateDisplayManagersWithBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumerateDisplayManagersWithBlock:");
}

id objc_msgSend_enumerateElementsUsingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumerateElementsUsingBlock:");
}

id objc_msgSend_enumerateFingersUsingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumerateFingersUsingBlock:");
}

id objc_msgSend_enumerateKeysAndObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumerateKeysAndObjectsUsingBlock:");
}

id objc_msgSend_enumerateLeafDescendantsUsingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumerateLeafDescendantsUsingBlock:");
}

id objc_msgSend_enumerateObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumerateObjectsUsingBlock:");
}

id objc_msgSend_enumeratorAtURL_includingPropertiesForKeys_options_errorHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:");
}

id objc_msgSend_environment(void *a1, const char *a2, ...)
{
  return _[a1 environment];
}

id objc_msgSend_errorWithDomain_code_userInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "errorWithDomain:code:userInfo:");
}

id objc_msgSend_eventHandlers(void *a1, const char *a2, ...)
{
  return _[a1 eventHandlers];
}

id objc_msgSend_eventManager(void *a1, const char *a2, ...)
{
  return _[a1 eventManager];
}

id objc_msgSend_eventProcessor(void *a1, const char *a2, ...)
{
  return _[a1 eventProcessor];
}

id objc_msgSend_eventType(void *a1, const char *a2, ...)
{
  return _[a1 eventType];
}

id objc_msgSend_exitActionElement(void *a1, const char *a2, ...)
{
  return _[a1 exitActionElement];
}

id objc_msgSend_exitActionElementForFingersInMenu_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "exitActionElementForFingersInMenu:");
}

id objc_msgSend_exitDrawingViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "exitDrawingViewController:");
}

id objc_msgSend_exitingView(void *a1, const char *a2, ...)
{
  return _[a1 exitingView];
}

id objc_msgSend_extendActivationRegionWithoutCollidingWithScrollers_rotatedScreenBounds_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "extendActivationRegionWithoutCollidingWithScrollers:rotatedScreenBounds:");
}

id objc_msgSend_extraProviderElements(void *a1, const char *a2, ...)
{
  return _[a1 extraProviderElements];
}

id objc_msgSend_factoryWithMass_stiffness_damping_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "factoryWithMass:stiffness:damping:");
}

id objc_msgSend_fadeDuration(void *a1, const char *a2, ...)
{
  return _[a1 fadeDuration];
}

id objc_msgSend_fadeNubbit(void *a1, const char *a2, ...)
{
  return _[a1 fadeNubbit];
}

id objc_msgSend_fallbackActionBlock(void *a1, const char *a2, ...)
{
  return _[a1 fallbackActionBlock];
}

id objc_msgSend_fallbackScrollDownAncestor(void *a1, const char *a2, ...)
{
  return _[a1 fallbackScrollDownAncestor];
}

id objc_msgSend_fallbackScrollLeftAncestor(void *a1, const char *a2, ...)
{
  return _[a1 fallbackScrollLeftAncestor];
}

id objc_msgSend_fallbackScrollRightAncestor(void *a1, const char *a2, ...)
{
  return _[a1 fallbackScrollRightAncestor];
}

id objc_msgSend_fallbackScrollUpAncestor(void *a1, const char *a2, ...)
{
  return _[a1 fallbackScrollUpAncestor];
}

id objc_msgSend_fileURLWithPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fileURLWithPath:");
}

id objc_msgSend_fill(void *a1, const char *a2, ...)
{
  return _[a1 fill];
}

id objc_msgSend_fillMode(void *a1, const char *a2, ...)
{
  return _[a1 fillMode];
}

id objc_msgSend_fillWithBlendMode_alpha_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fillWithBlendMode:alpha:");
}

id objc_msgSend_filterWithType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "filterWithType:");
}

id objc_msgSend_filteredArrayUsingPredicate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "filteredArrayUsingPredicate:");
}

id objc_msgSend_findElementMatchingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "findElementMatchingBlock:");
}

id objc_msgSend_findElementMatchingElement_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "findElementMatchingElement:");
}

id objc_msgSend_findGroupableMatchingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "findGroupableMatchingBlock:");
}

id objc_msgSend_findGroupableMatchingGroupable_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "findGroupableMatchingGroupable:");
}

id objc_msgSend_fingerContainerView(void *a1, const char *a2, ...)
{
  return _[a1 fingerContainerView];
}

id objc_msgSend_fingerContentViewIsActive(void *a1, const char *a2, ...)
{
  return _[a1 fingerContentViewIsActive];
}

id objc_msgSend_fingerController(void *a1, const char *a2, ...)
{
  return _[a1 fingerController];
}

id objc_msgSend_fingerIdentifiersAtEventIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fingerIdentifiersAtEventIndex:");
}

id objc_msgSend_fingerItemsViewController_didChooseNumberOfFingers_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fingerItemsViewController:didChooseNumberOfFingers:");
}

id objc_msgSend_fingerModelAtPoint_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fingerModelAtPoint:");
}

id objc_msgSend_fingerModelForLocation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fingerModelForLocation:");
}

id objc_msgSend_fingerModels(void *a1, const char *a2, ...)
{
  return _[a1 fingerModels];
}

id objc_msgSend_fingerModelsForPointStrings_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fingerModelsForPointStrings:");
}

id objc_msgSend_fingerPositions(void *a1, const char *a2, ...)
{
  return _[a1 fingerPositions];
}

id objc_msgSend_fingerWidth(void *a1, const char *a2, ...)
{
  return _[a1 fingerWidth];
}

id objc_msgSend_fingersElement_didBecomeFocused_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fingersElement:didBecomeFocused:");
}

id objc_msgSend_finishScanningAppleTVRemote_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "finishScanningAppleTVRemote:");
}

id objc_msgSend_firstAuxiliaryElementWithRole_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "firstAuxiliaryElementWithRole:");
}

id objc_msgSend_firstBaselineAnchor(void *a1, const char *a2, ...)
{
  return _[a1 firstBaselineAnchor];
}

id objc_msgSend_firstChild(void *a1, const char *a2, ...)
{
  return _[a1 firstChild];
}

id objc_msgSend_firstDescendantMatchingItem_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "firstDescendantMatchingItem:");
}

id objc_msgSend_firstDescendantPassingTest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "firstDescendantPassingTest:");
}

id objc_msgSend_firstElementInScene_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "firstElementInScene:");
}

id objc_msgSend_firstElementWithOptions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "firstElementWithOptions:");
}

id objc_msgSend_firstFocusContext(void *a1, const char *a2, ...)
{
  return _[a1 firstFocusContext];
}

id objc_msgSend_firstItemForScanningWithElementCommunity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "firstItemForScanningWithElementCommunity:");
}

id objc_msgSend_firstKeyboardItem(void *a1, const char *a2, ...)
{
  return _[a1 firstKeyboardItem];
}

id objc_msgSend_firstLeafDescendant(void *a1, const char *a2, ...)
{
  return _[a1 firstLeafDescendant];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return _[a1 firstObject];
}

id objc_msgSend_firstPath(void *a1, const char *a2, ...)
{
  return _[a1 firstPath];
}

id objc_msgSend_firstResponder(void *a1, const char *a2, ...)
{
  return _[a1 firstResponder];
}

id objc_msgSend_firstResponderDidChange_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "firstResponderDidChange:");
}

id objc_msgSend_firstScannerElement(void *a1, const char *a2, ...)
{
  return _[a1 firstScannerElement];
}

id objc_msgSend_firstScannerGroupable(void *a1, const char *a2, ...)
{
  return _[a1 firstScannerGroupable];
}

id objc_msgSend_flash(void *a1, const char *a2, ...)
{
  return _[a1 flash];
}

id objc_msgSend_flashCellForMenuItem_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "flashCellForMenuItem:");
}

id objc_msgSend_flashModernMenuItem_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "flashModernMenuItem:");
}

id objc_msgSend_flickGestureAtPoint_angle_numberOfFingers_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "flickGestureAtPoint:angle:numberOfFingers:");
}

id objc_msgSend_flickGestureStartingAtPoint_endingAtPoint_numberOfFingers_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "flickGestureStartingAtPoint:endingAtPoint:numberOfFingers:");
}

id objc_msgSend_floatValue(void *a1, const char *a2, ...)
{
  return _[a1 floatValue];
}

id objc_msgSend_focusContext(void *a1, const char *a2, ...)
{
  return _[a1 focusContext];
}

id objc_msgSend_focusContextAfterDrillOutOnGroup_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "focusContextAfterDrillOutOnGroup:");
}

id objc_msgSend_focusContextAutomatic(void *a1, const char *a2, ...)
{
  return _[a1 focusContextAutomatic];
}

id objc_msgSend_focusContextForActionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "focusContextForActionHandler:");
}

id objc_msgSend_focusContextForResume(void *a1, const char *a2, ...)
{
  return _[a1 focusContextForResume];
}

id objc_msgSend_focusContextSelf(void *a1, const char *a2, ...)
{
  return _[a1 focusContextSelf];
}

id objc_msgSend_focusContextWithElement_elementManager_selectBehavior_options_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "focusContextWithElement:elementManager:selectBehavior:options:");
}

id objc_msgSend_focusInterval(void *a1, const char *a2, ...)
{
  return _[a1 focusInterval];
}

id objc_msgSend_focusState(void *a1, const char *a2, ...)
{
  return _[a1 focusState];
}

id objc_msgSend_focusTimer(void *a1, const char *a2, ...)
{
  return _[a1 focusTimer];
}

id objc_msgSend_focusedBackgroundImage(void *a1, const char *a2, ...)
{
  return _[a1 focusedBackgroundImage];
}

id objc_msgSend_focusedGroupStateColor(void *a1, const char *a2, ...)
{
  return _[a1 focusedGroupStateColor];
}

id objc_msgSend_focusedGroupStateContentsColor(void *a1, const char *a2, ...)
{
  return _[a1 focusedGroupStateContentsColor];
}

id objc_msgSend_focusedItemCursorController(void *a1, const char *a2, ...)
{
  return _[a1 focusedItemCursorController];
}

id objc_msgSend_focusedStateBorderThickness(void *a1, const char *a2, ...)
{
  return _[a1 focusedStateBorderThickness];
}

id objc_msgSend_focusedStateColor(void *a1, const char *a2, ...)
{
  return _[a1 focusedStateColor];
}

id objc_msgSend_focusedStateContentsColor(void *a1, const char *a2, ...)
{
  return _[a1 focusedStateContentsColor];
}

id objc_msgSend_fontMetrics(void *a1, const char *a2, ...)
{
  return _[a1 fontMetrics];
}

id objc_msgSend_footerToContainerVerticalConstraint(void *a1, const char *a2, ...)
{
  return _[a1 footerToContainerVerticalConstraint];
}

id objc_msgSend_footerView(void *a1, const char *a2, ...)
{
  return _[a1 footerView];
}

id objc_msgSend_footerViewHiddenConstraint(void *a1, const char *a2, ...)
{
  return _[a1 footerViewHiddenConstraint];
}

id objc_msgSend_forceDisableScreenLock(void *a1, const char *a2, ...)
{
  return _[a1 forceDisableScreenLock];
}

id objc_msgSend_forcePause(void *a1, const char *a2, ...)
{
  return _[a1 forcePause];
}

id objc_msgSend_forceTouchGestureAtPoint_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "forceTouchGestureAtPoint:");
}

id objc_msgSend_foregroundLayer(void *a1, const char *a2, ...)
{
  return _[a1 foregroundLayer];
}

id objc_msgSend_forwardDirection(void *a1, const char *a2, ...)
{
  return _[a1 forwardDirection];
}

id objc_msgSend_forwardSwitchEvent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "forwardSwitchEvent:");
}

id objc_msgSend_frame(void *a1, const char *a2, ...)
{
  return _[a1 frame];
}

id objc_msgSend_frameForCenterPointAtSelectionPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "frameForCenterPointAtSelectionPath:");
}

id objc_msgSend_frameForSelectionPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "frameForSelectionPath:");
}

id objc_msgSend_freehandSheet_didHighlightBend_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "freehandSheet:didHighlightBend:");
}

id objc_msgSend_freehandSheet_didHighlightBendLeft_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "freehandSheet:didHighlightBendLeft:");
}

id objc_msgSend_freehandSheet_didHighlightBendRight_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "freehandSheet:didHighlightBendRight:");
}

id objc_msgSend_freehandSheet_didHighlightMove_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "freehandSheet:didHighlightMove:");
}

id objc_msgSend_freehandSheet_didHighlightRotate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "freehandSheet:didHighlightRotate:");
}

id objc_msgSend_freehandSheet_didHighlightRotateCCW90_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "freehandSheet:didHighlightRotateCCW90:");
}

id objc_msgSend_freehandSheet_didHighlightRotateCCW_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "freehandSheet:didHighlightRotateCCW:");
}

id objc_msgSend_freehandSheet_didHighlightRotateCW90_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "freehandSheet:didHighlightRotateCW90:");
}

id objc_msgSend_freehandSheet_didHighlightRotateCW_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "freehandSheet:didHighlightRotateCW:");
}

id objc_msgSend_freehandSheet_didHighlightStraighten_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "freehandSheet:didHighlightStraighten:");
}

id objc_msgSend_freezeScanning(void *a1, const char *a2, ...)
{
  return _[a1 freezeScanning];
}

id objc_msgSend_fromAction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fromAction:");
}

id objc_msgSend_fromSwitch_longPress_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fromSwitch:longPress:");
}

id objc_msgSend_fromValue(void *a1, const char *a2, ...)
{
  return _[a1 fromValue];
}

id objc_msgSend_frontmostAppMayBeLoading(void *a1, const char *a2, ...)
{
  return _[a1 frontmostAppMayBeLoading];
}

id objc_msgSend_functionWithControlPoints__::(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "functionWithControlPoints::::");
}

id objc_msgSend_gameControlButtonPress(void *a1, const char *a2, ...)
{
  return _[a1 gameControlButtonPress];
}

id objc_msgSend_gameControllerInfo(void *a1, const char *a2, ...)
{
  return _[a1 gameControllerInfo];
}

id objc_msgSend_gamepadInputSource(void *a1, const char *a2, ...)
{
  return _[a1 gamepadInputSource];
}

id objc_msgSend_generalTimer(void *a1, const char *a2, ...)
{
  return _[a1 generalTimer];
}

id objc_msgSend_generateContinuousScrollersOnQueue_withCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "generateContinuousScrollersOnQueue:withCompletion:");
}

id objc_msgSend_generateContinuousScrollersWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "generateContinuousScrollersWithCompletion:");
}

id objc_msgSend_gesture(void *a1, const char *a2, ...)
{
  return _[a1 gesture];
}

id objc_msgSend_gestureKeys(void *a1, const char *a2, ...)
{
  return _[a1 gestureKeys];
}

id objc_msgSend_gestureProvider(void *a1, const char *a2, ...)
{
  return _[a1 gestureProvider];
}

id objc_msgSend_gestureProvider_didShowFingers_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "gestureProvider:didShowFingers:");
}

id objc_msgSend_gestureProvider_shouldResetScanningFromElement_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "gestureProvider:shouldResetScanningFromElement:");
}

id objc_msgSend_gestureSheet(void *a1, const char *a2, ...)
{
  return _[a1 gestureSheet];
}

id objc_msgSend_gestureShiftedByOffset_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "gestureShiftedByOffset:");
}

id objc_msgSend_gestureWithPoints_times_forces_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "gestureWithPoints:times:forces:");
}

id objc_msgSend_gesturesButton(void *a1, const char *a2, ...)
{
  return _[a1 gesturesButton];
}

id objc_msgSend_gesturesSheet(void *a1, const char *a2, ...)
{
  return _[a1 gesturesSheet];
}

id objc_msgSend_gesturesSheetForMenu_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "gesturesSheetForMenu:");
}

id objc_msgSend_getBytes_length_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getBytes:length:");
}

id objc_msgSend_getCurveArcCenter_startAngle_endAngle_updatedFingerAngle_updatedFingerCenter_withFingerAngle_fingerCenter_curveRadius_distanceToMove_onLeft_( void *a1, const char *a2, ...)
{
  return _objc_msgSend( a1,  "getCurveArcCenter:startAngle:endAngle:updatedFingerAngle:updatedFingerCenter:withFingerAngle:fingerCenter:cur veRadius:distanceToMove:onLeft:");
}

id objc_msgSend_getDeviceSpecificImageForColor_withCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getDeviceSpecificImageForColor:withCompletion:");
}

id objc_msgSend_getIconSuffix(void *a1, const char *a2, ...)
{
  return _[a1 getIconSuffix];
}

id objc_msgSend_glyphImage(void *a1, const char *a2, ...)
{
  return _[a1 glyphImage];
}

id objc_msgSend_glyphImageView(void *a1, const char *a2, ...)
{
  return _[a1 glyphImageView];
}

id objc_msgSend_grayFingerInnerCircleInnerRadius(void *a1, const char *a2, ...)
{
  return _[a1 grayFingerInnerCircleInnerRadius];
}

id objc_msgSend_grayFingerInnerCircleOuterRadius(void *a1, const char *a2, ...)
{
  return _[a1 grayFingerInnerCircleOuterRadius];
}

id objc_msgSend_grayFingerInnerFill(void *a1, const char *a2, ...)
{
  return _[a1 grayFingerInnerFill];
}

id objc_msgSend_grayFingerInnerRadius(void *a1, const char *a2, ...)
{
  return _[a1 grayFingerInnerRadius];
}

id objc_msgSend_grayFingerOuterRadius(void *a1, const char *a2, ...)
{
  return _[a1 grayFingerOuterRadius];
}

id objc_msgSend_gridCenterPointFrameWithAvailableFrame_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "gridCenterPointFrameWithAvailableFrame:");
}

id objc_msgSend_gridCenterPointImageWithAvailableSize_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "gridCenterPointImageWithAvailableSize:");
}

id objc_msgSend_gridCenterPointPathWithAvailableFrame_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "gridCenterPointPathWithAvailableFrame:");
}

id objc_msgSend_gridColor(void *a1, const char *a2, ...)
{
  return _[a1 gridColor];
}

id objc_msgSend_gridLineThickness(void *a1, const char *a2, ...)
{
  return _[a1 gridLineThickness];
}

id objc_msgSend_gridShadowColor(void *a1, const char *a2, ...)
{
  return _[a1 gridShadowColor];
}

id objc_msgSend_gridShadowOffset(void *a1, const char *a2, ...)
{
  return _[a1 gridShadowOffset];
}

id objc_msgSend_groupVisualScrollersAuxElementManager(void *a1, const char *a2, ...)
{
  return _[a1 groupVisualScrollersAuxElementManager];
}

id objc_msgSend_groupWithElements_label_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "groupWithElements:label:");
}

id objc_msgSend_groupingEnabledDidChange(void *a1, const char *a2, ...)
{
  return _[a1 groupingEnabledDidChange];
}

id objc_msgSend_guidedAccessIgnoredRegions(void *a1, const char *a2, ...)
{
  return _[a1 guidedAccessIgnoredRegions];
}

id objc_msgSend_handInfo(void *a1, const char *a2, ...)
{
  return _[a1 handInfo];
}

id objc_msgSend_handManager(void *a1, const char *a2, ...)
{
  return _[a1 handManager];
}

id objc_msgSend_handleActivateWithElement_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleActivateWithElement:");
}

id objc_msgSend_handleAlertDidAppear_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleAlertDidAppear:");
}

id objc_msgSend_handleAnnouncement_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleAnnouncement:");
}

id objc_msgSend_handleButtonEvent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleButtonEvent:");
}

id objc_msgSend_handleCustomHomeButtonAction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleCustomHomeButtonAction:");
}

id objc_msgSend_handleDrillInOnGroup_elementManager_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleDrillInOnGroup:elementManager:");
}

id objc_msgSend_handleDrillOutOnGroup_elementManager_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleDrillOutOnGroup:elementManager:");
}

id objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleFailureInMethod:object:file:lineNumber:description:");
}

id objc_msgSend_handleFingerDriftedAway(void *a1, const char *a2, ...)
{
  return _[a1 handleFingerDriftedAway];
}

id objc_msgSend_handleInputAction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleInputAction:");
}

id objc_msgSend_handleInputAction_withElement_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleInputAction:withElement:");
}

id objc_msgSend_handleInterDeviceBailOutForInputSource_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleInterDeviceBailOutForInputSource:");
}

id objc_msgSend_handleMenuWasActivatedByScanner(void *a1, const char *a2, ...)
{
  return _[a1 handleMenuWasActivatedByScanner];
}

id objc_msgSend_handleMultiTouchStandard_onDisplay_withExistingFingerMidPoint_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleMultiTouchStandard:onDisplay:withExistingFingerMidPoint:");
}

id objc_msgSend_handlePrimaryButtonPress_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handlePrimaryButtonPress:");
}

id objc_msgSend_handleRealCancelEvent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleRealCancelEvent:");
}

id objc_msgSend_handleRealDownEvent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleRealDownEvent:");
}

id objc_msgSend_handleRealEvent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleRealEvent:");
}

id objc_msgSend_handleRealMoveEvent_maxOrb_currentForce_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleRealMoveEvent:maxOrb:currentForce:");
}

id objc_msgSend_handleRealUpEvent_maxOrb_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleRealUpEvent:maxOrb:");
}

id objc_msgSend_handleReceivedSwitchEvent_deviceName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleReceivedSwitchEvent:deviceName:");
}

id objc_msgSend_handleReportCallback_report_reportLength_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleReportCallback:report:reportLength:");
}

id objc_msgSend_handleScreenChange_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleScreenChange:");
}

id objc_msgSend_handleStopSpeaking_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleStopSpeaking:");
}

id objc_msgSend_handleUSBMFiDeviceConnected(void *a1, const char *a2, ...)
{
  return _[a1 handleUSBMFiDeviceConnected];
}

id objc_msgSend_handleUsagePage_usage_value_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleUsagePage:usage:value:");
}

id objc_msgSend_handledEvent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handledEvent:");
}

id objc_msgSend_hardwareIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 hardwareIdentifier];
}

id objc_msgSend_hardwareItems(void *a1, const char *a2, ...)
{
  return _[a1 hardwareItems];
}

id objc_msgSend_hasActivatedScrollSinceContextUpdate(void *a1, const char *a2, ...)
{
  return _[a1 hasActivatedScrollSinceContextUpdate];
}

id objc_msgSend_hasAllTraits_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasAllTraits:");
}

id objc_msgSend_hasAnyTraits_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasAnyTraits:");
}

id objc_msgSend_hasIdleTimeExpired(void *a1, const char *a2, ...)
{
  return _[a1 hasIdleTimeExpired];
}

id objc_msgSend_hasInitializedInputSources(void *a1, const char *a2, ...)
{
  return _[a1 hasInitializedInputSources];
}

id objc_msgSend_hasLocalizableName(void *a1, const char *a2, ...)
{
  return _[a1 hasLocalizableName];
}

id objc_msgSend_hasLongPressAction(void *a1, const char *a2, ...)
{
  return _[a1 hasLongPressAction];
}

id objc_msgSend_hasPickedPoint(void *a1, const char *a2, ...)
{
  return _[a1 hasPickedPoint];
}

id objc_msgSend_hasPrefix_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasPrefix:");
}

id objc_msgSend_hasSelectAction(void *a1, const char *a2, ...)
{
  return _[a1 hasSelectAction];
}

id objc_msgSend_hasStepAction(void *a1, const char *a2, ...)
{
  return _[a1 hasStepAction];
}

id objc_msgSend_hasSuffix_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasSuffix:");
}

id objc_msgSend_hasWebContent(void *a1, const char *a2, ...)
{
  return _[a1 hasWebContent];
}

id objc_msgSend_hasZeroElements(void *a1, const char *a2, ...)
{
  return _[a1 hasZeroElements];
}

id objc_msgSend_hash(void *a1, const char *a2, ...)
{
  return _[a1 hash];
}

id objc_msgSend_headTrackingPoint(void *a1, const char *a2, ...)
{
  return _[a1 headTrackingPoint];
}

id objc_msgSend_heightAnchor(void *a1, const char *a2, ...)
{
  return _[a1 heightAnchor];
}

id objc_msgSend_hidManager(void *a1, const char *a2, ...)
{
  return _[a1 hidManager];
}

id objc_msgSend_hide(void *a1, const char *a2, ...)
{
  return _[a1 hide];
}

id objc_msgSend_hide_animate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hide:animate:");
}

id objc_msgSend_hideCursor_animated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hideCursor:animated:");
}

id objc_msgSend_hideIfNeeded_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hideIfNeeded:");
}

id objc_msgSend_hideUIContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hideUIContext:");
}

id objc_msgSend_hideWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hideWithCompletion:");
}

id objc_msgSend_highVisBackgroundAndIconImage(void *a1, const char *a2, ...)
{
  return _[a1 highVisBackgroundAndIconImage];
}

id objc_msgSend_highestAncestorGroup(void *a1, const char *a2, ...)
{
  return _[a1 highestAncestorGroup];
}

id objc_msgSend_highlightNubbit(void *a1, const char *a2, ...)
{
  return _[a1 highlightNubbit];
}

id objc_msgSend_highlightSearchResult_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "highlightSearchResult:");
}

id objc_msgSend_highlighted(void *a1, const char *a2, ...)
{
  return _[a1 highlighted];
}

id objc_msgSend_highlightedTextColor(void *a1, const char *a2, ...)
{
  return _[a1 highlightedTextColor];
}

id objc_msgSend_hint(void *a1, const char *a2, ...)
{
  return _[a1 hint];
}

id objc_msgSend_hitTestCategoryAssertion(void *a1, const char *a2, ...)
{
  return _[a1 hitTestCategoryAssertion];
}

id objc_msgSend_hndAbsoluteCentroidForMultifingers_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hndAbsoluteCentroidForMultifingers:");
}

id objc_msgSend_hndCentroidForPinchChainMidPoint_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hndCentroidForPinchChainMidPoint:");
}

id objc_msgSend_hndConvertPointToFingerContainerView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hndConvertPointToFingerContainerView:");
}

id objc_msgSend_hndMenuPointForFingerLayout(void *a1, const char *a2, ...)
{
  return _[a1 hndMenuPointForFingerLayout];
}

id objc_msgSend_hndStandardCentroidForMultifingers_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hndStandardCentroidForMultifingers:");
}

id objc_msgSend_holdDuration(void *a1, const char *a2, ...)
{
  return _[a1 holdDuration];
}

id objc_msgSend_holdPoint(void *a1, const char *a2, ...)
{
  return _[a1 holdPoint];
}

id objc_msgSend_homeButton(void *a1, const char *a2, ...)
{
  return _[a1 homeButton];
}

id objc_msgSend_horizontalContinuousScrollers(void *a1, const char *a2, ...)
{
  return _[a1 horizontalContinuousScrollers];
}

id objc_msgSend_horizontalScroller(void *a1, const char *a2, ...)
{
  return _[a1 horizontalScroller];
}

id objc_msgSend_hoverMovedToNormalizedPoint_shouldUpdateCurrentPoint_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hoverMovedToNormalizedPoint:shouldUpdateCurrentPoint:");
}

id objc_msgSend_hoveredTo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hoveredTo:");
}

id objc_msgSend_hoveredToRockerButton_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hoveredToRockerButton:");
}

id objc_msgSend_hudView(void *a1, const char *a2, ...)
{
  return _[a1 hudView];
}

id objc_msgSend_iconContainerView(void *a1, const char *a2, ...)
{
  return _[a1 iconContainerView];
}

id objc_msgSend_iconEffect(void *a1, const char *a2, ...)
{
  return _[a1 iconEffect];
}

id objc_msgSend_iconImage(void *a1, const char *a2, ...)
{
  return _[a1 iconImage];
}

id objc_msgSend_iconImageAngle(void *a1, const char *a2, ...)
{
  return _[a1 iconImageAngle];
}

id objc_msgSend_iconImageView(void *a1, const char *a2, ...)
{
  return _[a1 iconImageView];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return _[a1 identifier];
}

id objc_msgSend_idleTimer(void *a1, const char *a2, ...)
{
  return _[a1 idleTimer];
}

id objc_msgSend_ignoreLogging(void *a1, const char *a2, ...)
{
  return _[a1 ignoreLogging];
}

id objc_msgSend_ignoreRepeatDuration(void *a1, const char *a2, ...)
{
  return _[a1 ignoreRepeatDuration];
}

id objc_msgSend_ignoredTouchRegions(void *a1, const char *a2, ...)
{
  return _[a1 ignoredTouchRegions];
}

id objc_msgSend_image(void *a1, const char *a2, ...)
{
  return _[a1 image];
}

id objc_msgSend_imageByApplyingSymbolConfiguration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "imageByApplyingSymbolConfiguration:");
}

id objc_msgSend_imageByPreparingThumbnailOfSize_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "imageByPreparingThumbnailOfSize:");
}

id objc_msgSend_imageMaximumContentSizeCategory(void *a1, const char *a2, ...)
{
  return _[a1 imageMaximumContentSizeCategory];
}

id objc_msgSend_imageMinimumContentSizeCategory(void *a1, const char *a2, ...)
{
  return _[a1 imageMinimumContentSizeCategory];
}

id objc_msgSend_imageName(void *a1, const char *a2, ...)
{
  return _[a1 imageName];
}

id objc_msgSend_imageNamed_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "imageNamed:");
}

id objc_msgSend_imagePrefixForTouchDependentGlyph(void *a1, const char *a2, ...)
{
  return _[a1 imagePrefixForTouchDependentGlyph];
}

id objc_msgSend_imageSize(void *a1, const char *a2, ...)
{
  return _[a1 imageSize];
}

id objc_msgSend_imageView(void *a1, const char *a2, ...)
{
  return _[a1 imageView];
}

id objc_msgSend_imageWithConfiguration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "imageWithConfiguration:");
}

id objc_msgSend_imageWithData_scale_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "imageWithData:scale:");
}

id objc_msgSend_imageWithHorizontallyFlippedOrientation(void *a1, const char *a2, ...)
{
  return _[a1 imageWithHorizontallyFlippedOrientation];
}

id objc_msgSend_imageWithRenderingMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "imageWithRenderingMode:");
}

id objc_msgSend_imageWithTintColor_renderingMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "imageWithTintColor:renderingMode:");
}

id objc_msgSend_immediateSelectActionCount(void *a1, const char *a2, ...)
{
  return _[a1 immediateSelectActionCount];
}

id objc_msgSend_importance(void *a1, const char *a2, ...)
{
  return _[a1 importance];
}

id objc_msgSend_inContinuousScrollMode(void *a1, const char *a2, ...)
{
  return _[a1 inContinuousScrollMode];
}

id objc_msgSend_inCustomGesture(void *a1, const char *a2, ...)
{
  return _[a1 inCustomGesture];
}

id objc_msgSend_inDragMode(void *a1, const char *a2, ...)
{
  return _[a1 inDragMode];
}

id objc_msgSend_inNubbitMode(void *a1, const char *a2, ...)
{
  return _[a1 inNubbitMode];
}

id objc_msgSend_inPinchMode(void *a1, const char *a2, ...)
{
  return _[a1 inPinchMode];
}

id objc_msgSend_inactiveAlpha(void *a1, const char *a2, ...)
{
  return _[a1 inactiveAlpha];
}

id objc_msgSend_increaseAutoscrollSpeed(void *a1, const char *a2, ...)
{
  return _[a1 increaseAutoscrollSpeed];
}

id objc_msgSend_increaseCurveControl(void *a1, const char *a2, ...)
{
  return _[a1 increaseCurveControl];
}

id objc_msgSend_increaseVelocityForFreehandSheet_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "increaseVelocityForFreehandSheet:");
}

id objc_msgSend_increaseVolume(void *a1, const char *a2, ...)
{
  return _[a1 increaseVolume];
}

id objc_msgSend_increaseVolumeFocusedBackgroundImage(void *a1, const char *a2, ...)
{
  return _[a1 increaseVolumeFocusedBackgroundImage];
}

id objc_msgSend_increaseVolumeView(void *a1, const char *a2, ...)
{
  return _[a1 increaseVolumeView];
}

id objc_msgSend_increaseVolumeViewInternal(void *a1, const char *a2, ...)
{
  return _[a1 increaseVolumeViewInternal];
}

id objc_msgSend_indexAtPosition_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "indexAtPosition:");
}

id objc_msgSend_indexOfObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "indexOfObject:");
}

id objc_msgSend_indexOfObjectPassingTest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "indexOfObjectPassingTest:");
}

id objc_msgSend_indexPathByAddingIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "indexPathByAddingIndex:");
}

id objc_msgSend_indexPathByRemovingLastIndex(void *a1, const char *a2, ...)
{
  return _[a1 indexPathByRemovingLastIndex];
}

id objc_msgSend_indexPathWithIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "indexPathWithIndex:");
}

id objc_msgSend_indexPathWithIndexes_length_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "indexPathWithIndexes:length:");
}

id objc_msgSend_indexPathsForVisibleItems(void *a1, const char *a2, ...)
{
  return _[a1 indexPathsForVisibleItems];
}

id objc_msgSend_indexesOfObjectsPassingTest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "indexesOfObjectsPassingTest:");
}

id objc_msgSend_init(void *a1, const char *a2, ...)
{
  return _[a1 init];
}

id objc_msgSend_initFileURLWithPath_isDirectory_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initFileURLWithPath:isDirectory:");
}

id objc_msgSend_initForLeftToRightSwipe_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initForLeftToRightSwipe:");
}

id objc_msgSend_initWithAction_timeoutDuration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithAction:timeoutDuration:");
}

id objc_msgSend_initWithActivityIndicatorStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithActivityIndicatorStyle:");
}

id objc_msgSend_initWithAxis_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithAxis:");
}

id objc_msgSend_initWithButton_delegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithButton:delegate:");
}

id objc_msgSend_initWithCapacity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithCapacity:");
}

id objc_msgSend_initWithCollectionViewLayout_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithCollectionViewLayout:");
}

id objc_msgSend_initWithContentsOfURL_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithContentsOfURL:error:");
}

id objc_msgSend_initWithDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDelegate:");
}

id objc_msgSend_initWithDelegate_fetchEvents_enableEventManagement_enableGrouping_shouldIncludeNonScannerElements_beginEnabled_( void *a1, const char *a2, ...)
{
  return _objc_msgSend( a1,  "initWithDelegate:fetchEvents:enableEventManagement:enableGrouping:shouldIncludeNonScannerElements:beginEnabled:");
}

id objc_msgSend_initWithDevice_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDevice:");
}

id objc_msgSend_initWithDisplaySource_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDisplaySource:");
}

id objc_msgSend_initWithDisplayUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDisplayUUID:");
}

id objc_msgSend_initWithEffect_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithEffect:");
}

id objc_msgSend_initWithElement_elementManager_selectBehavior_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithElement:elementManager:selectBehavior:");
}

id objc_msgSend_initWithElementManager_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithElementManager:");
}

id objc_msgSend_initWithElementManager_menu_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithElementManager:menu:");
}

id objc_msgSend_initWithElementManager_startingFingerPositions_menu_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithElementManager:startingFingerPositions:menu:");
}

id objc_msgSend_initWithElements_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithElements:");
}

id objc_msgSend_initWithElements_label_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithElements:label:");
}

id objc_msgSend_initWithFrame_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithFrame:");
}

id objc_msgSend_initWithFrame_appearanceDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithFrame:appearanceDelegate:");
}

id objc_msgSend_initWithFrame_privateStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithFrame:privateStyle:");
}

id objc_msgSend_initWithGlyphName_shape_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithGlyphName:shape:");
}

id objc_msgSend_initWithHIDTapIdentifier_HIDEventTapPriority_systemEventTapIdentifier_systemEventTapPriority_( void *a1, const char *a2, ...)
{
  return _objc_msgSend( a1,  "initWithHIDTapIdentifier:HIDEventTapPriority:systemEventTapIdentifier:systemEventTapPriority:");
}

id objc_msgSend_initWithHUDItem_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithHUDItem:");
}

id objc_msgSend_initWithIdentifier_delegate_searchResult_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithIdentifier:delegate:searchResult:");
}

id objc_msgSend_initWithIdentifier_delegate_title_imageName_activateBehavior_allowedWithGuidedAccess_allowedWithAssistiveAccess_activateHandler_updateHandler_( void *a1, const char *a2, ...)
{
  return _objc_msgSend( a1,  "initWithIdentifier:delegate:title:imageName:activateBehavior:allowedWithGuidedAccess:allowedWithAssistiveAcce ss:activateHandler:updateHandler:");
}

id objc_msgSend_initWithIdentifier_eventHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithIdentifier:eventHandler:");
}

id objc_msgSend_initWithIdentifier_serviceBundleName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithIdentifier:serviceBundleName:");
}

id objc_msgSend_initWithImage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithImage:");
}

id objc_msgSend_initWithImageName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithImageName:");
}

id objc_msgSend_initWithInterDeviceCommunicator_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithInterDeviceCommunicator:");
}

id objc_msgSend_initWithKey_payload_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithKey:payload:");
}

id objc_msgSend_initWithMenu_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithMenu:");
}

id objc_msgSend_initWithMenu_interDeviceCommunicator_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithMenu:interDeviceCommunicator:");
}

id objc_msgSend_initWithMenu_interDeviceSearchResult_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithMenu:interDeviceSearchResult:");
}

id objc_msgSend_initWithMenu_menuItemDictionaryArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithMenu:menuItemDictionaryArray:");
}

id objc_msgSend_initWithMenuItem_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithMenuItem:");
}

id objc_msgSend_initWithMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithMode:");
}

id objc_msgSend_initWithNotifications_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithNotifications:");
}

id objc_msgSend_initWithParentClass_description_appendUUIDToLabel_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithParentClass:description:appendUUIDToLabel:");
}

id objc_msgSend_initWithPrivateStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithPrivateStyle:");
}

id objc_msgSend_initWithSelectionPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithSelectionPath:");
}

id objc_msgSend_initWithSelectionPath_generatorDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithSelectionPath:generatorDelegate:");
}

id objc_msgSend_initWithServiceName_perPidService_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithServiceName:perPidService:");
}

id objc_msgSend_initWithSheet_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithSheet:");
}

id objc_msgSend_initWithStartingFingerPositions_menu_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithStartingFingerPositions:menu:");
}

id objc_msgSend_initWithString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithString:");
}

id objc_msgSend_initWithString_attributes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithString:attributes:");
}

id objc_msgSend_initWithSwitchIdentifier_switchDisplayName_deviceIdentifier_actions_longPressActions_isDown_( void *a1, const char *a2, ...)
{
  return _objc_msgSend( a1,  "initWithSwitchIdentifier:switchDisplayName:deviceIdentifier:actions:longPressActions:isDown:");
}

id objc_msgSend_initWithTarget_selector_object_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithTarget:selector:object:");
}

id objc_msgSend_initWithTargetElement_scrollView_orientedScrollViewFrame_scrollAxis_supportedScrollDirections_( void *a1, const char *a2, ...)
{
  return _objc_msgSend( a1,  "initWithTargetElement:scrollView:orientedScrollViewFrame:scrollAxis:supportedScrollDirections:");
}

id objc_msgSend_initWithTargetSerialQueue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithTargetSerialQueue:");
}

id objc_msgSend_initWithTitle_image_imageInsets_scaleImage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithTitle:image:imageInsets:scaleImage:");
}

id objc_msgSend_initWithTriangle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithTriangle:");
}

id objc_msgSend_initWithType_menu_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithType:menu:");
}

id objc_msgSend_initWithWindow_ignoredWindow_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithWindow:ignoredWindow:");
}

id objc_msgSend_initialDownMenuCanTransitionToPressDown(void *a1, const char *a2, ...)
{
  return _[a1 initialDownMenuCanTransitionToPressDown];
}

id objc_msgSend_initialItems(void *a1, const char *a2, ...)
{
  return _[a1 initialItems];
}

id objc_msgSend_initialMenuDownHasFinished(void *a1, const char *a2, ...)
{
  return _[a1 initialMenuDownHasFinished];
}

id objc_msgSend_initialRockerSize(void *a1, const char *a2, ...)
{
  return _[a1 initialRockerSize];
}

id objc_msgSend_initializeDisplay(void *a1, const char *a2, ...)
{
  return _[a1 initializeDisplay];
}

id objc_msgSend_initializeDisplayWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initializeDisplayWithCompletion:");
}

id objc_msgSend_initializeScreenBounds(void *a1, const char *a2, ...)
{
  return _[a1 initializeScreenBounds];
}

id objc_msgSend_initializeWindowsIfNecessary(void *a1, const char *a2, ...)
{
  return _[a1 initializeWindowsIfNecessary];
}

id objc_msgSend_initialized(void *a1, const char *a2, ...)
{
  return _[a1 initialized];
}

id objc_msgSend_inputController(void *a1, const char *a2, ...)
{
  return _[a1 inputController];
}

id objc_msgSend_inputController_didReceiveAction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "inputController:didReceiveAction:");
}

id objc_msgSend_inputController_didReceiveRecipeHoldAtPoint_isDown_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "inputController:didReceiveRecipeHoldAtPoint:isDown:");
}

id objc_msgSend_inputDeviceHandledAction(void *a1, const char *a2, ...)
{
  return _[a1 inputDeviceHandledAction];
}

id objc_msgSend_inputHoldDuration(void *a1, const char *a2, ...)
{
  return _[a1 inputHoldDuration];
}

id objc_msgSend_inputHoldEnabled(void *a1, const char *a2, ...)
{
  return _[a1 inputHoldEnabled];
}

id objc_msgSend_inputHoldTimer(void *a1, const char *a2, ...)
{
  return _[a1 inputHoldTimer];
}

id objc_msgSend_inputRepeatTimer(void *a1, const char *a2, ...)
{
  return _[a1 inputRepeatTimer];
}

id objc_msgSend_inputSettings(void *a1, const char *a2, ...)
{
  return _[a1 inputSettings];
}

id objc_msgSend_inputSource_forwardSwitchEvent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "inputSource:forwardSwitchEvent:");
}

id objc_msgSend_insertObject_atIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "insertObject:atIndex:");
}

id objc_msgSend_insertPointer_atIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "insertPointer:atIndex:");
}

id objc_msgSend_insertSublayer_below_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "insertSublayer:below:");
}

id objc_msgSend_insertSubview_atIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "insertSubview:atIndex:");
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return _[a1 intValue];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return _[a1 integerValue];
}

id objc_msgSend_interDeviceCommunicator(void *a1, const char *a2, ...)
{
  return _[a1 interDeviceCommunicator];
}

id objc_msgSend_interDeviceCommunicatorForMenu_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "interDeviceCommunicatorForMenu:");
}

id objc_msgSend_interDeviceInputSource(void *a1, const char *a2, ...)
{
  return _[a1 interDeviceInputSource];
}

id objc_msgSend_intrinsicContentSize(void *a1, const char *a2, ...)
{
  return _[a1 intrinsicContentSize];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return _[a1 invalidate];
}

id objc_msgSend_invalidateIntrinsicContentSize(void *a1, const char *a2, ...)
{
  return _[a1 invalidateIntrinsicContentSize];
}

id objc_msgSend_invalidateMenuItems(void *a1, const char *a2, ...)
{
  return _[a1 invalidateMenuItems];
}

id objc_msgSend_isATVRemoteInputSource(void *a1, const char *a2, ...)
{
  return _[a1 isATVRemoteInputSource];
}

id objc_msgSend_isAXAttributedString(void *a1, const char *a2, ...)
{
  return _[a1 isAXAttributedString];
}

id objc_msgSend_isAccessibilityElement(void *a1, const char *a2, ...)
{
  return _[a1 isAccessibilityElement];
}

id objc_msgSend_isActive(void *a1, const char *a2, ...)
{
  return _[a1 isActive];
}

id objc_msgSend_isActiveScannerDriver(void *a1, const char *a2, ...)
{
  return _[a1 isActiveScannerDriver];
}

id objc_msgSend_isActivelyScrollingContinuously(void *a1, const char *a2, ...)
{
  return _[a1 isActivelyScrollingContinuously];
}

id objc_msgSend_isAnimatingForwards(void *a1, const char *a2, ...)
{
  return _[a1 isAnimatingForwards];
}

id objc_msgSend_isAnimatingNubbit(void *a1, const char *a2, ...)
{
  return _[a1 isAnimatingNubbit];
}

id objc_msgSend_isAutoLiftOnForFreehandSheet_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isAutoLiftOnForFreehandSheet:");
}

id objc_msgSend_isAutoPressOnForFreehandSheet_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isAutoPressOnForFreehandSheet:");
}

id objc_msgSend_isAutoscanEnabled(void *a1, const char *a2, ...)
{
  return _[a1 isAutoscanEnabled];
}

id objc_msgSend_isAutoscrolling(void *a1, const char *a2, ...)
{
  return _[a1 isAutoscrolling];
}

id objc_msgSend_isAvailable(void *a1, const char *a2, ...)
{
  return _[a1 isAvailable];
}

id objc_msgSend_isBackButton(void *a1, const char *a2, ...)
{
  return _[a1 isBackButton];
}

id objc_msgSend_isBackItemIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isBackItemIdentifier:");
}

id objc_msgSend_isCancelled(void *a1, const char *a2, ...)
{
  return _[a1 isCancelled];
}

id objc_msgSend_isCapturingEvents(void *a1, const char *a2, ...)
{
  return _[a1 isCapturingEvents];
}

id objc_msgSend_isControllingOtherDevice(void *a1, const char *a2, ...)
{
  return _[a1 isControllingOtherDevice];
}

id objc_msgSend_isCurrentOrientationLandscape(void *a1, const char *a2, ...)
{
  return _[a1 isCurrentOrientationLandscape];
}

id objc_msgSend_isCurrentlyTappingAndHolding(void *a1, const char *a2, ...)
{
  return _[a1 isCurrentlyTappingAndHolding];
}

id objc_msgSend_isCursorUIHidden(void *a1, const char *a2, ...)
{
  return _[a1 isCursorUIHidden];
}

id objc_msgSend_isCurving(void *a1, const char *a2, ...)
{
  return _[a1 isCurving];
}

id objc_msgSend_isDark(void *a1, const char *a2, ...)
{
  return _[a1 isDark];
}

id objc_msgSend_isDescendantOfView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isDescendantOfView:");
}

id objc_msgSend_isDirectionPadPressed(void *a1, const char *a2, ...)
{
  return _[a1 isDirectionPadPressed];
}

id objc_msgSend_isDisabled(void *a1, const char *a2, ...)
{
  return _[a1 isDisabled];
}

id objc_msgSend_isDisplayIntegrated(void *a1, const char *a2, ...)
{
  return _[a1 isDisplayIntegrated];
}

id objc_msgSend_isDisplayed(void *a1, const char *a2, ...)
{
  return _[a1 isDisplayed];
}

id objc_msgSend_isDockStyle(void *a1, const char *a2, ...)
{
  return _[a1 isDockStyle];
}

id objc_msgSend_isDown(void *a1, const char *a2, ...)
{
  return _[a1 isDown];
}

id objc_msgSend_isDownEvent(void *a1, const char *a2, ...)
{
  return _[a1 isDownEvent];
}

id objc_msgSend_isElementTopLevelInMenu_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isElementTopLevelInMenu:");
}

id objc_msgSend_isEmptyFavorite(void *a1, const char *a2, ...)
{
  return _[a1 isEmptyFavorite];
}

id objc_msgSend_isEnabled(void *a1, const char *a2, ...)
{
  return _[a1 isEnabled];
}

id objc_msgSend_isEnabledSwitchWithSource_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEnabledSwitchWithSource:");
}

id objc_msgSend_isEqual_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqual:");
}

id objc_msgSend_isEqualToArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToArray:");
}

id objc_msgSend_isEqualToNumber_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToNumber:");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_isExternalDisplayConnected(void *a1, const char *a2, ...)
{
  return _[a1 isExternalDisplayConnected];
}

id objc_msgSend_isFaceButtonPressed(void *a1, const char *a2, ...)
{
  return _[a1 isFaceButtonPressed];
}

id objc_msgSend_isFetchingElements(void *a1, const char *a2, ...)
{
  return _[a1 isFetchingElements];
}

id objc_msgSend_isFirstInSequence(void *a1, const char *a2, ...)
{
  return _[a1 isFirstInSequence];
}

id objc_msgSend_isFlashing(void *a1, const char *a2, ...)
{
  return _[a1 isFlashing];
}

id objc_msgSend_isForwardingSwitchEvents(void *a1, const char *a2, ...)
{
  return _[a1 isForwardingSwitchEvents];
}

id objc_msgSend_isFullMenuVisible(void *a1, const char *a2, ...)
{
  return _[a1 isFullMenuVisible];
}

id objc_msgSend_isGamepadInputSource(void *a1, const char *a2, ...)
{
  return _[a1 isGamepadInputSource];
}

id objc_msgSend_isGroup(void *a1, const char *a2, ...)
{
  return _[a1 isGroup];
}

id objc_msgSend_isGroupingEnabled(void *a1, const char *a2, ...)
{
  return _[a1 isGroupingEnabled];
}

id objc_msgSend_isGuidedAccessActive(void *a1, const char *a2, ...)
{
  return _[a1 isGuidedAccessActive];
}

id objc_msgSend_isHandUI(void *a1, const char *a2, ...)
{
  return _[a1 isHandUI];
}

id objc_msgSend_isHandlingInterDeviceCommunication(void *a1, const char *a2, ...)
{
  return _[a1 isHandlingInterDeviceCommunication];
}

id objc_msgSend_isHidden(void *a1, const char *a2, ...)
{
  return _[a1 isHidden];
}

id objc_msgSend_isHighlighted(void *a1, const char *a2, ...)
{
  return _[a1 isHighlighted];
}

id objc_msgSend_isIdle(void *a1, const char *a2, ...)
{
  return _[a1 isIdle];
}

id objc_msgSend_isIgnoringInputs(void *a1, const char *a2, ...)
{
  return _[a1 isIgnoringInputs];
}

id objc_msgSend_isInactive(void *a1, const char *a2, ...)
{
  return _[a1 isInactive];
}

id objc_msgSend_isInputCoalesceEnabled(void *a1, const char *a2, ...)
{
  return _[a1 isInputCoalesceEnabled];
}

id objc_msgSend_isInputHoldEnabled(void *a1, const char *a2, ...)
{
  return _[a1 isInputHoldEnabled];
}

id objc_msgSend_isInputRepeatEnabled(void *a1, const char *a2, ...)
{
  return _[a1 isInputRepeatEnabled];
}

id objc_msgSend_isJoystickPressed(void *a1, const char *a2, ...)
{
  return _[a1 isJoystickPressed];
}

id objc_msgSend_isKeyboardContainer(void *a1, const char *a2, ...)
{
  return _[a1 isKeyboardContainer];
}

id objc_msgSend_isKeyboardInputSource(void *a1, const char *a2, ...)
{
  return _[a1 isKeyboardInputSource];
}

id objc_msgSend_isKeyboardKey(void *a1, const char *a2, ...)
{
  return _[a1 isKeyboardKey];
}

id objc_msgSend_isKeyboardTypeButtonPressed(void *a1, const char *a2, ...)
{
  return _[a1 isKeyboardTypeButtonPressed];
}

id objc_msgSend_isLandscape(void *a1, const char *a2, ...)
{
  return _[a1 isLandscape];
}

id objc_msgSend_isLoaded(void *a1, const char *a2, ...)
{
  return _[a1 isLoaded];
}

id objc_msgSend_isMFIInputSource(void *a1, const char *a2, ...)
{
  return _[a1 isMFIInputSource];
}

id objc_msgSend_isMIDIInputSource(void *a1, const char *a2, ...)
{
  return _[a1 isMIDIInputSource];
}

id objc_msgSend_isMainDisplay(void *a1, const char *a2, ...)
{
  return _[a1 isMainDisplay];
}

id objc_msgSend_isMainThread(void *a1, const char *a2, ...)
{
  return _[a1 isMainThread];
}

id objc_msgSend_isMenuElementManager(void *a1, const char *a2, ...)
{
  return _[a1 isMenuElementManager];
}

id objc_msgSend_isMenuOpeningElementEnabled(void *a1, const char *a2, ...)
{
  return _[a1 isMenuOpeningElementEnabled];
}

id objc_msgSend_isMenuVisible(void *a1, const char *a2, ...)
{
  return _[a1 isMenuVisible];
}

id objc_msgSend_isModalDown(void *a1, const char *a2, ...)
{
  return _[a1 isModalDown];
}

id objc_msgSend_isOKToSpeak(void *a1, const char *a2, ...)
{
  return _[a1 isOKToSpeak];
}

id objc_msgSend_isPaused(void *a1, const char *a2, ...)
{
  return _[a1 isPaused];
}

id objc_msgSend_isPausingScanning(void *a1, const char *a2, ...)
{
  return _[a1 isPausingScanning];
}

id objc_msgSend_isPending(void *a1, const char *a2, ...)
{
  return _[a1 isPending];
}

id objc_msgSend_isPendingFingerLiftForPrimaryButtonPressUp(void *a1, const char *a2, ...)
{
  return _[a1 isPendingFingerLiftForPrimaryButtonPressUp];
}

id objc_msgSend_isPerformingGesture(void *a1, const char *a2, ...)
{
  return _[a1 isPerformingGesture];
}

id objc_msgSend_isPinchEnabled(void *a1, const char *a2, ...)
{
  return _[a1 isPinchEnabled];
}

id objc_msgSend_isPinching(void *a1, const char *a2, ...)
{
  return _[a1 isPinching];
}

id objc_msgSend_isPopoverStyle(void *a1, const char *a2, ...)
{
  return _[a1 isPopoverStyle];
}

id objc_msgSend_isPoppingToPreviousViewController(void *a1, const char *a2, ...)
{
  return _[a1 isPoppingToPreviousViewController];
}

id objc_msgSend_isPressed(void *a1, const char *a2, ...)
{
  return _[a1 isPressed];
}

id objc_msgSend_isPushingConfirmationSheet(void *a1, const char *a2, ...)
{
  return _[a1 isPushingConfirmationSheet];
}

id objc_msgSend_isReadyForSelect(void *a1, const char *a2, ...)
{
  return _[a1 isReadyForSelect];
}

id objc_msgSend_isReceivingSwitchEvents(void *a1, const char *a2, ...)
{
  return _[a1 isReceivingSwitchEvents];
}

id objc_msgSend_isRefiningPoint(void *a1, const char *a2, ...)
{
  return _[a1 isRefiningPoint];
}

id objc_msgSend_isRemovedOnCompletion(void *a1, const char *a2, ...)
{
  return _[a1 isRemovedOnCompletion];
}

id objc_msgSend_isRootGroup(void *a1, const char *a2, ...)
{
  return _[a1 isRootGroup];
}

id objc_msgSend_isRotating(void *a1, const char *a2, ...)
{
  return _[a1 isRotating];
}

id objc_msgSend_isRunning(void *a1, const char *a2, ...)
{
  return _[a1 isRunning];
}

id objc_msgSend_isScannerActive(void *a1, const char *a2, ...)
{
  return _[a1 isScannerActive];
}

id objc_msgSend_isScannerPaused(void *a1, const char *a2, ...)
{
  return _[a1 isScannerPaused];
}

id objc_msgSend_isSearching(void *a1, const char *a2, ...)
{
  return _[a1 isSearching];
}

id objc_msgSend_isShoulderButtonPressed(void *a1, const char *a2, ...)
{
  return _[a1 isShoulderButtonPressed];
}

id objc_msgSend_isShowingFooterView(void *a1, const char *a2, ...)
{
  return _[a1 isShowingFooterView];
}

id objc_msgSend_isSiriVisible(void *a1, const char *a2, ...)
{
  return _[a1 isSiriVisible];
}

id objc_msgSend_isSpeakingFocusContext(void *a1, const char *a2, ...)
{
  return _[a1 isSpeakingFocusContext];
}

id objc_msgSend_isSpeechEnabled(void *a1, const char *a2, ...)
{
  return _[a1 isSpeechEnabled];
}

id objc_msgSend_isSupported(void *a1, const char *a2, ...)
{
  return _[a1 isSupported];
}

id objc_msgSend_isSwitchWithSource_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isSwitchWithSource:");
}

id objc_msgSend_isSymbolImage(void *a1, const char *a2, ...)
{
  return _[a1 isSymbolImage];
}

id objc_msgSend_isSystemDrag(void *a1, const char *a2, ...)
{
  return _[a1 isSystemDrag];
}

id objc_msgSend_isSystemSleeping(void *a1, const char *a2, ...)
{
  return _[a1 isSystemSleeping];
}

id objc_msgSend_isTopLevel(void *a1, const char *a2, ...)
{
  return _[a1 isTopLevel];
}

id objc_msgSend_isTouchOnForFreehandSheet_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isTouchOnForFreehandSheet:");
}

id objc_msgSend_isTransitioning(void *a1, const char *a2, ...)
{
  return _[a1 isTransitioning];
}

id objc_msgSend_isTransitioningToOrFromActive(void *a1, const char *a2, ...)
{
  return _[a1 isTransitioningToOrFromActive];
}

id objc_msgSend_isUIContextHidden(void *a1, const char *a2, ...)
{
  return _[a1 isUIContextHidden];
}

id objc_msgSend_isUserInteractionEnabled(void *a1, const char *a2, ...)
{
  return _[a1 isUserInteractionEnabled];
}

id objc_msgSend_isUsingPointMode(void *a1, const char *a2, ...)
{
  return _[a1 isUsingPointMode];
}

id objc_msgSend_isValid(void *a1, const char *a2, ...)
{
  return _[a1 isValid];
}

id objc_msgSend_isValidForElement_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isValidForElement:");
}

id objc_msgSend_isViewControllerLoaded(void *a1, const char *a2, ...)
{
  return _[a1 isViewControllerLoaded];
}

id objc_msgSend_isViewLoaded(void *a1, const char *a2, ...)
{
  return _[a1 isViewLoaded];
}

id objc_msgSend_isVisibilityTiedToFocus(void *a1, const char *a2, ...)
{
  return _[a1 isVisibilityTiedToFocus];
}

id objc_msgSend_isVisible(void *a1, const char *a2, ...)
{
  return _[a1 isVisible];
}

id objc_msgSend_isVoiceControlRunning(void *a1, const char *a2, ...)
{
  return _[a1 isVoiceControlRunning];
}

id objc_msgSend_isWaitingToBePresented(void *a1, const char *a2, ...)
{
  return _[a1 isWaitingToBePresented];
}

id objc_msgSend_item(void *a1, const char *a2, ...)
{
  return _[a1 item];
}

id objc_msgSend_itemDetailsForItem_menu_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "itemDetailsForItem:menu:");
}

id objc_msgSend_itemMenuState(void *a1, const char *a2, ...)
{
  return _[a1 itemMenuState];
}

id objc_msgSend_itemMenuStateForMenu_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "itemMenuStateForMenu:");
}

id objc_msgSend_itemSize(void *a1, const char *a2, ...)
{
  return _[a1 itemSize];
}

id objc_msgSend_itemSpacingLandscape(void *a1, const char *a2, ...)
{
  return _[a1 itemSpacingLandscape];
}

id objc_msgSend_itemSpacingPortrait(void *a1, const char *a2, ...)
{
  return _[a1 itemSpacingPortrait];
}

id objc_msgSend_itemWithIdentifier_delegate_title_activateBehavior_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "itemWithIdentifier:delegate:title:activateBehavior:");
}

id objc_msgSend_itemWithIdentifier_delegate_title_imageName_activateBehavior_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "itemWithIdentifier:delegate:title:imageName:activateBehavior:");
}

id objc_msgSend_itemWithIdentifier_delegate_title_imageName_activateBehavior_activateHandler_updateHandler_( void *a1, const char *a2, ...)
{
  return _objc_msgSend( a1,  "itemWithIdentifier:delegate:title:imageName:activateBehavior:activateHandler:updateHandler:");
}

id objc_msgSend_itemWithIdentifier_delegate_title_imageName_activateBehavior_allowedWithGuidedAccess_allowedWithAssistiveAccess_( void *a1, const char *a2, ...)
{
  return _objc_msgSend( a1,  "itemWithIdentifier:delegate:title:imageName:activateBehavior:allowedWithGuidedAccess:allowedWithAssistiveAccess:");
}

id objc_msgSend_itemWithIdentifier_delegate_title_imageName_activateBehavior_allowedWithGuidedAccess_allowedWithAssistiveAccess_activateHandler_updateHandler_( void *a1, const char *a2, ...)
{
  return _objc_msgSend( a1,  "itemWithIdentifier:delegate:title:imageName:activateBehavior:allowedWithGuidedAccess:allowedWithAssistiveAcce ss:activateHandler:updateHandler:");
}

id objc_msgSend_itemWithIdentifier_delegate_title_imagePrefixForTouchDependentGlyph_shouldRotate_activateBehavior_( void *a1, const char *a2, ...)
{
  return _objc_msgSend( a1,  "itemWithIdentifier:delegate:title:imagePrefixForTouchDependentGlyph:shouldRotate:activateBehavior:");
}

id objc_msgSend_keyCode(void *a1, const char *a2, ...)
{
  return _[a1 keyCode];
}

id objc_msgSend_keyDown(void *a1, const char *a2, ...)
{
  return _[a1 keyDown];
}

id objc_msgSend_keyEnumerator(void *a1, const char *a2, ...)
{
  return _[a1 keyEnumerator];
}

id objc_msgSend_keyInfo(void *a1, const char *a2, ...)
{
  return _[a1 keyInfo];
}

id objc_msgSend_keyboardApplication(void *a1, const char *a2, ...)
{
  return _[a1 keyboardApplication];
}

id objc_msgSend_keyboardContainer(void *a1, const char *a2, ...)
{
  return _[a1 keyboardContainer];
}

id objc_msgSend_keyboardGroup(void *a1, const char *a2, ...)
{
  return _[a1 keyboardGroup];
}

id objc_msgSend_keyboardIndexPath(void *a1, const char *a2, ...)
{
  return _[a1 keyboardIndexPath];
}

id objc_msgSend_keyboardInputSource(void *a1, const char *a2, ...)
{
  return _[a1 keyboardInputSource];
}

id objc_msgSend_keyboardKeyCenterPoint(void *a1, const char *a2, ...)
{
  return _[a1 keyboardKeyCenterPoint];
}

id objc_msgSend_keyboardSelectBehavior(void *a1, const char *a2, ...)
{
  return _[a1 keyboardSelectBehavior];
}

id objc_msgSend_keyboardVisible_withFrame_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "keyboardVisible:withFrame:");
}

id objc_msgSend_label(void *a1, const char *a2, ...)
{
  return _[a1 label];
}

id objc_msgSend_labelFont(void *a1, const char *a2, ...)
{
  return _[a1 labelFont];
}

id objc_msgSend_language(void *a1, const char *a2, ...)
{
  return _[a1 language];
}

id objc_msgSend_lastAppTransitionTime(void *a1, const char *a2, ...)
{
  return _[a1 lastAppTransitionTime];
}

id objc_msgSend_lastAuxiliaryElementWithRole_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lastAuxiliaryElementWithRole:");
}

id objc_msgSend_lastChild(void *a1, const char *a2, ...)
{
  return _[a1 lastChild];
}

id objc_msgSend_lastElement(void *a1, const char *a2, ...)
{
  return _[a1 lastElement];
}

id objc_msgSend_lastElementWithOptions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lastElementWithOptions:");
}

id objc_msgSend_lastItemForScanningWithElementCommunity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lastItemForScanningWithElementCommunity:");
}

id objc_msgSend_lastKeyboardElement(void *a1, const char *a2, ...)
{
  return _[a1 lastKeyboardElement];
}

id objc_msgSend_lastMenuInteractionTime(void *a1, const char *a2, ...)
{
  return _[a1 lastMenuInteractionTime];
}

id objc_msgSend_lastObject(void *a1, const char *a2, ...)
{
  return _[a1 lastObject];
}

id objc_msgSend_lastReceivedPoint(void *a1, const char *a2, ...)
{
  return _[a1 lastReceivedPoint];
}

id objc_msgSend_lastScannedElementCommunity(void *a1, const char *a2, ...)
{
  return _[a1 lastScannedElementCommunity];
}

id objc_msgSend_lastScannerElement(void *a1, const char *a2, ...)
{
  return _[a1 lastScannerElement];
}

id objc_msgSend_lastScannerGroupable(void *a1, const char *a2, ...)
{
  return _[a1 lastScannerGroupable];
}

id objc_msgSend_lastSetOptions(void *a1, const char *a2, ...)
{
  return _[a1 lastSetOptions];
}

id objc_msgSend_lastTimeElementFetcherRefreshed(void *a1, const char *a2, ...)
{
  return _[a1 lastTimeElementFetcherRefreshed];
}

id objc_msgSend_lastWrapDirection(void *a1, const char *a2, ...)
{
  return _[a1 lastWrapDirection];
}

id objc_msgSend_layer(void *a1, const char *a2, ...)
{
  return _[a1 layer];
}

id objc_msgSend_layoutDelegate(void *a1, const char *a2, ...)
{
  return _[a1 layoutDelegate];
}

id objc_msgSend_layoutIfNeeded(void *a1, const char *a2, ...)
{
  return _[a1 layoutIfNeeded];
}

id objc_msgSend_layoutItemsByLocation_hasBackButton_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "layoutItemsByLocation:hasBackButton:");
}

id objc_msgSend_layoutItemsByLocation_positions_rows_columns_clockwiseOctagonalLocations_horizontallyCenteredLocation_( void *a1, const char *a2, ...)
{
  return _objc_msgSend( a1,  "layoutItemsByLocation:positions:rows:columns:clockwiseOctagonalLocations:horizontallyCenteredLocation:");
}

id objc_msgSend_layoutViewSideLengthScaledFromDefaultLength_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "layoutViewSideLengthScaledFromDefaultLength:");
}

id objc_msgSend_leadingAnchor(void *a1, const char *a2, ...)
{
  return _[a1 leadingAnchor];
}

id objc_msgSend_leftAnchor(void *a1, const char *a2, ...)
{
  return _[a1 leftAnchor];
}

id objc_msgSend_leftArrowButton(void *a1, const char *a2, ...)
{
  return _[a1 leftArrowButton];
}

id objc_msgSend_leftMostLeafAXElement(void *a1, const char *a2, ...)
{
  return _[a1 leftMostLeafAXElement];
}

id objc_msgSend_legacyLiftFingersUp(void *a1, const char *a2, ...)
{
  return _[a1 legacyLiftFingersUp];
}

id objc_msgSend_legacyPressFingersDown(void *a1, const char *a2, ...)
{
  return _[a1 legacyPressFingersDown];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return _[a1 length];
}

id objc_msgSend_level(void *a1, const char *a2, ...)
{
  return _[a1 level];
}

id objc_msgSend_liftFingersUpAnimated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "liftFingersUpAnimated:");
}

id objc_msgSend_liftHomeButtonUp(void *a1, const char *a2, ...)
{
  return _[a1 liftHomeButtonUp];
}

id objc_msgSend_liftLockButtonUp(void *a1, const char *a2, ...)
{
  return _[a1 liftLockButtonUp];
}

id objc_msgSend_liftVolumeDownButtonUp(void *a1, const char *a2, ...)
{
  return _[a1 liftVolumeDownButtonUp];
}

id objc_msgSend_liftVolumeUpButtonUp(void *a1, const char *a2, ...)
{
  return _[a1 liftVolumeUpButtonUp];
}

id objc_msgSend_liftsOnMoveEnd(void *a1, const char *a2, ...)
{
  return _[a1 liftsOnMoveEnd];
}

id objc_msgSend_lightPressCameraButton(void *a1, const char *a2, ...)
{
  return _[a1 lightPressCameraButton];
}

id objc_msgSend_lineColor(void *a1, const char *a2, ...)
{
  return _[a1 lineColor];
}

id objc_msgSend_lineGestureBetweenPoints_duration_numberOfFingers_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lineGestureBetweenPoints:duration:numberOfFingers:");
}

id objc_msgSend_lineGestureBetweenPoints_duration_numberOfFingers_initialHoldDuration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lineGestureBetweenPoints:duration:numberOfFingers:initialHoldDuration:");
}

id objc_msgSend_lineGestureState(void *a1, const char *a2, ...)
{
  return _[a1 lineGestureState];
}

id objc_msgSend_lineGestureType(void *a1, const char *a2, ...)
{
  return _[a1 lineGestureType];
}

id objc_msgSend_lineLayer(void *a1, const char *a2, ...)
{
  return _[a1 lineLayer];
}

id objc_msgSend_lineLayerMaxWidth(void *a1, const char *a2, ...)
{
  return _[a1 lineLayerMaxWidth];
}

id objc_msgSend_lineThickness(void *a1, const char *a2, ...)
{
  return _[a1 lineThickness];
}

id objc_msgSend_load(void *a1, const char *a2, ...)
{
  return _[a1 load];
}

id objc_msgSend_loadScanner(void *a1, const char *a2, ...)
{
  return _[a1 loadScanner];
}

id objc_msgSend_localizedCapitalizedString(void *a1, const char *a2, ...)
{
  return _[a1 localizedCapitalizedString];
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return _[a1 localizedDescription];
}

id objc_msgSend_localizedStringForKey_value_table_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localizedStringForKey:value:table:");
}

id objc_msgSend_localizedStringWithFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localizedStringWithFormat:");
}

id objc_msgSend_location(void *a1, const char *a2, ...)
{
  return _[a1 location];
}

id objc_msgSend_lockedToDisplayID(void *a1, const char *a2, ...)
{
  return _[a1 lockedToDisplayID];
}

id objc_msgSend_longPress(void *a1, const char *a2, ...)
{
  return _[a1 longPress];
}

id objc_msgSend_longPressAction(void *a1, const char *a2, ...)
{
  return _[a1 longPressAction];
}

id objc_msgSend_longPressActionIdentifiersToRecipeMappingIndices(void *a1, const char *a2, ...)
{
  return _[a1 longPressActionIdentifiersToRecipeMappingIndices];
}

id objc_msgSend_longPressActions(void *a1, const char *a2, ...)
{
  return _[a1 longPressActions];
}

id objc_msgSend_longPressDuration(void *a1, const char *a2, ...)
{
  return _[a1 longPressDuration];
}

id objc_msgSend_longPressEnabled(void *a1, const char *a2, ...)
{
  return _[a1 longPressEnabled];
}

id objc_msgSend_longPressGesture(void *a1, const char *a2, ...)
{
  return _[a1 longPressGesture];
}

id objc_msgSend_longPressGestureAtPoint_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "longPressGestureAtPoint:");
}

id objc_msgSend_longPressShortcutIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 longPressShortcutIdentifier];
}

id objc_msgSend_longPressTimer(void *a1, const char *a2, ...)
{
  return _[a1 longPressTimer];
}

id objc_msgSend_lowercaseString(void *a1, const char *a2, ...)
{
  return _[a1 lowercaseString];
}

id objc_msgSend_mainAccessQueue(void *a1, const char *a2, ...)
{
  return _[a1 mainAccessQueue];
}

id objc_msgSend_mainBundle(void *a1, const char *a2, ...)
{
  return _[a1 mainBundle];
}

id objc_msgSend_mainDisplayManager(void *a1, const char *a2, ...)
{
  return _[a1 mainDisplayManager];
}

id objc_msgSend_mainQueue(void *a1, const char *a2, ...)
{
  return _[a1 mainQueue];
}

id objc_msgSend_mainScreen(void *a1, const char *a2, ...)
{
  return _[a1 mainScreen];
}

id objc_msgSend_mainThread(void *a1, const char *a2, ...)
{
  return _[a1 mainThread];
}

id objc_msgSend_mainView(void *a1, const char *a2, ...)
{
  return _[a1 mainView];
}

id objc_msgSend_mainWindow(void *a1, const char *a2, ...)
{
  return _[a1 mainWindow];
}

id objc_msgSend_makeKeyAndVisible(void *a1, const char *a2, ...)
{
  return _[a1 makeKeyAndVisible];
}

id objc_msgSend_makeMenuItemsIfNeeded(void *a1, const char *a2, ...)
{
  return _[a1 makeMenuItemsIfNeeded];
}

id objc_msgSend_makeObjectsPerformSelector_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "makeObjectsPerformSelector:");
}

id objc_msgSend_manipulateDimTimer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "manipulateDimTimer:");
}

id objc_msgSend_manualScanningDriver(void *a1, const char *a2, ...)
{
  return _[a1 manualScanningDriver];
}

id objc_msgSend_manufacturerName(void *a1, const char *a2, ...)
{
  return _[a1 manufacturerName];
}

id objc_msgSend_mappings(void *a1, const char *a2, ...)
{
  return _[a1 mappings];
}

id objc_msgSend_maxAutoscanCycles(void *a1, const char *a2, ...)
{
  return _[a1 maxAutoscanCycles];
}

id objc_msgSend_maxItemsPerRow(void *a1, const char *a2, ...)
{
  return _[a1 maxItemsPerRow];
}

id objc_msgSend_maxRows(void *a1, const char *a2, ...)
{
  return _[a1 maxRows];
}

id objc_msgSend_maxVisibleItems(void *a1, const char *a2, ...)
{
  return _[a1 maxVisibleItems];
}

id objc_msgSend_measuringCell(void *a1, const char *a2, ...)
{
  return _[a1 measuringCell];
}

id objc_msgSend_mediaControlsChanged_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mediaControlsChanged:");
}

id objc_msgSend_mediaControlsKeys(void *a1, const char *a2, ...)
{
  return _[a1 mediaControlsKeys];
}

id objc_msgSend_menu(void *a1, const char *a2, ...)
{
  return _[a1 menu];
}

id objc_msgSend_menu_activateRecipe_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "menu:activateRecipe:");
}

id objc_msgSend_menu_playSoundEffect_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "menu:playSoundEffect:");
}

id objc_msgSend_menu_rectToClearForFingersWithGestureSheet_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "menu:rectToClearForFingersWithGestureSheet:");
}

id objc_msgSend_menu_setItemMenuState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "menu:setItemMenuState:");
}

id objc_msgSend_menu_showAlternateKeysForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "menu:showAlternateKeysForKey:");
}

id objc_msgSend_menu_showScrollViewPickerForScrollViews_elementsToScroll_scrollAction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "menu:showScrollViewPickerForScrollViews:elementsToScroll:scrollAction:");
}

id objc_msgSend_menu_showSysdiagnoseDisplayString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "menu:showSysdiagnoseDisplayString:");
}

id objc_msgSend_menu_showTypingCandidates_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "menu:showTypingCandidates:");
}

id objc_msgSend_menu_speakAnnouncement_completionBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "menu:speakAnnouncement:completionBlock:");
}

id objc_msgSend_menuButton(void *a1, const char *a2, ...)
{
  return _[a1 menuButton];
}

id objc_msgSend_menuElement(void *a1, const char *a2, ...)
{
  return _[a1 menuElement];
}

id objc_msgSend_menuExitedOnDisplay_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "menuExitedOnDisplay:");
}

id objc_msgSend_menuIconIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 menuIconIdentifier];
}

id objc_msgSend_menuItem(void *a1, const char *a2, ...)
{
  return _[a1 menuItem];
}

id objc_msgSend_menuItem_didBecomeFocused_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "menuItem:didBecomeFocused:");
}

id objc_msgSend_menuItemCursorController(void *a1, const char *a2, ...)
{
  return _[a1 menuItemCursorController];
}

id objc_msgSend_menuItemDictionary(void *a1, const char *a2, ...)
{
  return _[a1 menuItemDictionary];
}

id objc_msgSend_menuItemForScrollAction_withDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "menuItemForScrollAction:withDelegate:");
}

id objc_msgSend_menuItemForTapWithMenu_delegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "menuItemForTapWithMenu:delegate:");
}

id objc_msgSend_menuItemGroupName(void *a1, const char *a2, ...)
{
  return _[a1 menuItemGroupName];
}

id objc_msgSend_menuItemHorizontalSpacingAfterItemAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "menuItemHorizontalSpacingAfterItemAtIndex:");
}

id objc_msgSend_menuItemSize(void *a1, const char *a2, ...)
{
  return _[a1 menuItemSize];
}

id objc_msgSend_menuItemSpacing(void *a1, const char *a2, ...)
{
  return _[a1 menuItemSpacing];
}

id objc_msgSend_menuItemStruts(void *a1, const char *a2, ...)
{
  return _[a1 menuItemStruts];
}

id objc_msgSend_menuItemWasActivated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "menuItemWasActivated:");
}

id objc_msgSend_menuItemWithIdentifier_menu_delegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "menuItemWithIdentifier:menu:delegate:");
}

id objc_msgSend_menuItemWithItemDictionary_menu_delegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "menuItemWithItemDictionary:menu:delegate:");
}

id objc_msgSend_menuItems(void *a1, const char *a2, ...)
{
  return _[a1 menuItems];
}

id objc_msgSend_menuItemsForCustomActions_menu_delegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "menuItemsForCustomActions:menu:delegate:");
}

id objc_msgSend_menuItemsForCustomHardwareActions_menu_delegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "menuItemsForCustomHardwareActions:menu:delegate:");
}

id objc_msgSend_menuItemsForHardwareRotateCrownGestureWithMenu_delegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "menuItemsForHardwareRotateCrownGestureWithMenu:delegate:");
}

id objc_msgSend_menuItemsForItem_menu_delegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "menuItemsForItem:menu:delegate:");
}

id objc_msgSend_menuKnockoutBorderOpacity(void *a1, const char *a2, ...)
{
  return _[a1 menuKnockoutBorderOpacity];
}

id objc_msgSend_menuKnockoutBorderOverlayBlendMode(void *a1, const char *a2, ...)
{
  return _[a1 menuKnockoutBorderOverlayBlendMode];
}

id objc_msgSend_menuKnockoutColor(void *a1, const char *a2, ...)
{
  return _[a1 menuKnockoutColor];
}

id objc_msgSend_menuObservers(void *a1, const char *a2, ...)
{
  return _[a1 menuObservers];
}

id objc_msgSend_menuOpeningAuxElementManager(void *a1, const char *a2, ...)
{
  return _[a1 menuOpeningAuxElementManager];
}

id objc_msgSend_menuOpeningElement(void *a1, const char *a2, ...)
{
  return _[a1 menuOpeningElement];
}

id objc_msgSend_menuPageControlHighlightedBorderColor(void *a1, const char *a2, ...)
{
  return _[a1 menuPageControlHighlightedBorderColor];
}

id objc_msgSend_menuPageControlHighlightedBorderLineWidth(void *a1, const char *a2, ...)
{
  return _[a1 menuPageControlHighlightedBorderLineWidth];
}

id objc_msgSend_menuSheet(void *a1, const char *a2, ...)
{
  return _[a1 menuSheet];
}

id objc_msgSend_menuSheetForCollectionView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "menuSheetForCollectionView:");
}

id objc_msgSend_menuSheetStack(void *a1, const char *a2, ...)
{
  return _[a1 menuSheetStack];
}

id objc_msgSend_menuTipObjectDidChange(void *a1, const char *a2, ...)
{
  return _[a1 menuTipObjectDidChange];
}

id objc_msgSend_menuView(void *a1, const char *a2, ...)
{
  return _[a1 menuView];
}

id objc_msgSend_menuVisualProvider(void *a1, const char *a2, ...)
{
  return _[a1 menuVisualProvider];
}

id objc_msgSend_menuWillDisappear(void *a1, const char *a2, ...)
{
  return _[a1 menuWillDisappear];
}

id objc_msgSend_mfiInputSource(void *a1, const char *a2, ...)
{
  return _[a1 mfiInputSource];
}

id objc_msgSend_midiEvent(void *a1, const char *a2, ...)
{
  return _[a1 midiEvent];
}

id objc_msgSend_midiInputSource(void *a1, const char *a2, ...)
{
  return _[a1 midiInputSource];
}

id objc_msgSend_midpointForFingers(void *a1, const char *a2, ...)
{
  return _[a1 midpointForFingers];
}

id objc_msgSend_midpointOfStartingFingersForGesture_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "midpointOfStartingFingersForGesture:");
}

id objc_msgSend_minimumLineHeight(void *a1, const char *a2, ...)
{
  return _[a1 minimumLineHeight];
}

id objc_msgSend_minimumOuterPadding(void *a1, const char *a2, ...)
{
  return _[a1 minimumOuterPadding];
}

id objc_msgSend_minimumPointPickerNumberOfCyclesForDriver_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "minimumPointPickerNumberOfCyclesForDriver:");
}

id objc_msgSend_modalizeMenu_modalButton_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "modalizeMenu:modalButton:");
}

id objc_msgSend_mode(void *a1, const char *a2, ...)
{
  return _[a1 mode];
}

id objc_msgSend_modifyPoints_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "modifyPoints:");
}

id objc_msgSend_moreItems(void *a1, const char *a2, ...)
{
  return _[a1 moreItems];
}

id objc_msgSend_moreItemsPageControl(void *a1, const char *a2, ...)
{
  return _[a1 moreItemsPageControl];
}

id objc_msgSend_mostSuitablePointPickerWithMenu_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mostSuitablePointPickerWithMenu:");
}

id objc_msgSend_moveFingerByDelta_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "moveFingerByDelta:");
}

id objc_msgSend_moveFingerToPoint_onDisplay_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "moveFingerToPoint:onDisplay:");
}

id objc_msgSend_moveFingersToPointInFingerCoordinateSpace_onDisplay_allowOutOfBounds_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "moveFingersToPointInFingerCoordinateSpace:onDisplay:allowOutOfBounds:");
}

id objc_msgSend_moveFingersToPoints_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "moveFingersToPoints:");
}

id objc_msgSend_moveForFreehandSheet_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "moveForFreehandSheet:");
}

id objc_msgSend_moveMenuItemWithPreferredNumberOfLines_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "moveMenuItemWithPreferredNumberOfLines:");
}

id objc_msgSend_moveNubbitToPoint_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "moveNubbitToPoint:");
}

id objc_msgSend_moveTimer(void *a1, const char *a2, ...)
{
  return _[a1 moveTimer];
}

id objc_msgSend_moveToPoint_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "moveToPoint:");
}

id objc_msgSend_moveToolbarForFreehandSheet_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "moveToolbarForFreehandSheet:");
}

id objc_msgSend_moveToolbarMenuItem(void *a1, const char *a2, ...)
{
  return _[a1 moveToolbarMenuItem];
}

id objc_msgSend_multiTouchToolBackgroundEnabled(void *a1, const char *a2, ...)
{
  return _[a1 multiTouchToolBackgroundEnabled];
}

id objc_msgSend_multipleMenuItemsElement_didBecomeHighlighted_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "multipleMenuItemsElement:didBecomeHighlighted:");
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return _[a1 mutableCopy];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return _[a1 name];
}

id objc_msgSend_nameForConfirmationButton_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "nameForConfirmationButton:");
}

id objc_msgSend_nativeBounds(void *a1, const char *a2, ...)
{
  return _[a1 nativeBounds];
}

id objc_msgSend_nativeFocusElement(void *a1, const char *a2, ...)
{
  return _[a1 nativeFocusElement];
}

id objc_msgSend_nativeFocusElementDidChange_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "nativeFocusElementDidChange:");
}

id objc_msgSend_needsGenerateScrollers(void *a1, const char *a2, ...)
{
  return _[a1 needsGenerateScrollers];
}

id objc_msgSend_nextAuxiliaryElementManagerFrom_role_excludeDisabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "nextAuxiliaryElementManagerFrom:role:excludeDisabled:");
}

id objc_msgSend_nextCursorRangeInDirection_unit_outputRange_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "nextCursorRangeInDirection:unit:outputRange:");
}

id objc_msgSend_nextCursorRangeInDirection_unit_outputRange_currentCursorRange_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "nextCursorRangeInDirection:unit:outputRange:currentCursorRange:");
}

id objc_msgSend_nextFocusContextAfterActivatingKeyboardElement_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "nextFocusContextAfterActivatingKeyboardElement:");
}

id objc_msgSend_nextFocusContextAfterDismissingMenuForElement_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "nextFocusContextAfterDismissingMenuForElement:");
}

id objc_msgSend_nextFocusContextFromContext_inDirection_didWrap_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "nextFocusContextFromContext:inDirection:didWrap:");
}

id objc_msgSend_nextItemForScanningFromItem_didWrap_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "nextItemForScanningFromItem:didWrap:");
}

id objc_msgSend_nextSiblingOfChild_didWrap_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "nextSiblingOfChild:didWrap:");
}

id objc_msgSend_nextSiblingOfElement_didWrap_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "nextSiblingOfElement:didWrap:");
}

id objc_msgSend_nextSiblingOfGroupable_didWrap_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "nextSiblingOfGroupable:didWrap:");
}

id objc_msgSend_normalizedHorizontalTipCenter(void *a1, const char *a2, ...)
{
  return _[a1 normalizedHorizontalTipCenter];
}

id objc_msgSend_normalizedPointForDifference_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "normalizedPointForDifference:");
}

id objc_msgSend_note(void *a1, const char *a2, ...)
{
  return _[a1 note];
}

id objc_msgSend_notificationObserver(void *a1, const char *a2, ...)
{
  return _[a1 notificationObserver];
}

id objc_msgSend_notificationObserverQueue(void *a1, const char *a2, ...)
{
  return _[a1 notificationObserverQueue];
}

id objc_msgSend_notifyDidReceiveAction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "notifyDidReceiveAction:");
}

id objc_msgSend_notifyUpdateElementVisualsEventDidOccur(void *a1, const char *a2, ...)
{
  return _[a1 notifyUpdateElementVisualsEventDidOccur];
}

id objc_msgSend_notifyUserEventOccurred(void *a1, const char *a2, ...)
{
  return _[a1 notifyUserEventOccurred];
}

id objc_msgSend_notifyZoomFocusDidChangeWithType_rect_contextId_displayId_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "notifyZoomFocusDidChangeWithType:rect:contextId:displayId:");
}

id objc_msgSend_nubbitMoving(void *a1, const char *a2, ...)
{
  return _[a1 nubbitMoving];
}

id objc_msgSend_nubbitPositionForFlick_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "nubbitPositionForFlick:");
}

id objc_msgSend_nubbitSize(void *a1, const char *a2, ...)
{
  return _[a1 nubbitSize];
}

id objc_msgSend_nubbitVisible(void *a1, const char *a2, ...)
{
  return _[a1 nubbitVisible];
}

id objc_msgSend_null(void *a1, const char *a2, ...)
{
  return _[a1 null];
}

id objc_msgSend_numberOfColumns(void *a1, const char *a2, ...)
{
  return _[a1 numberOfColumns];
}

id objc_msgSend_numberOfCycles(void *a1, const char *a2, ...)
{
  return _[a1 numberOfCycles];
}

id objc_msgSend_numberOfDevicesConnected(void *a1, const char *a2, ...)
{
  return _[a1 numberOfDevicesConnected];
}

id objc_msgSend_numberOfElements(void *a1, const char *a2, ...)
{
  return _[a1 numberOfElements];
}

id objc_msgSend_numberOfEvents(void *a1, const char *a2, ...)
{
  return _[a1 numberOfEvents];
}

id objc_msgSend_numberOfFingers(void *a1, const char *a2, ...)
{
  return _[a1 numberOfFingers];
}

id objc_msgSend_numberOfItemsInCurrentScanCycle(void *a1, const char *a2, ...)
{
  return _[a1 numberOfItemsInCurrentScanCycle];
}

id objc_msgSend_numberOfItemsInFirstPage(void *a1, const char *a2, ...)
{
  return _[a1 numberOfItemsInFirstPage];
}

id objc_msgSend_numberOfItemsInSection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberOfItemsInSection:");
}

id objc_msgSend_numberOfMenuItems(void *a1, const char *a2, ...)
{
  return _[a1 numberOfMenuItems];
}

id objc_msgSend_numberOfPagesRequired(void *a1, const char *a2, ...)
{
  return _[a1 numberOfPagesRequired];
}

id objc_msgSend_numberOfPresses(void *a1, const char *a2, ...)
{
  return _[a1 numberOfPresses];
}

id objc_msgSend_numberOfRows(void *a1, const char *a2, ...)
{
  return _[a1 numberOfRows];
}

id objc_msgSend_numberOfScanLoops(void *a1, const char *a2, ...)
{
  return _[a1 numberOfScanLoops];
}

id objc_msgSend_numberWithAXAttribute_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithAXAttribute:");
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

id objc_msgSend_numberWithLong_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithLong:");
}

id objc_msgSend_numberWithUnsignedInt_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithUnsignedInt:");
}

id objc_msgSend_numberWithUnsignedInteger_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithUnsignedInteger:");
}

id objc_msgSend_numberWithUnsignedLong_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithUnsignedLong:");
}

id objc_msgSend_numberWithUnsignedLongLong_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithUnsignedLongLong:");
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

id objc_msgSend_objectForVariant_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForVariant:");
}

id objc_msgSend_objectWithAXAttribute_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectWithAXAttribute:");
}

id objc_msgSend_objectWithAXAttribute_parameter_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectWithAXAttribute:parameter:");
}

id objc_msgSend_objectsAtIndexes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectsAtIndexes:");
}

id objc_msgSend_objectsPassingTest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectsPassingTest:");
}

id objc_msgSend_observeAXNotifications_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "observeAXNotifications:");
}

id objc_msgSend_observer(void *a1, const char *a2, ...)
{
  return _[a1 observer];
}

id objc_msgSend_onScreenFrameForRockerButton_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "onScreenFrameForRockerButton:");
}

id objc_msgSend_onScreenLocation(void *a1, const char *a2, ...)
{
  return _[a1 onScreenLocation];
}

id objc_msgSend_openCreateCustomGestureForAST(void *a1, const char *a2, ...)
{
  return _[a1 openCreateCustomGestureForAST];
}

id objc_msgSend_openCreateCustomGestureForSCAT(void *a1, const char *a2, ...)
{
  return _[a1 openCreateCustomGestureForSCAT];
}

id objc_msgSend_openMenuWithSwaggle(void *a1, const char *a2, ...)
{
  return _[a1 openMenuWithSwaggle];
}

id objc_msgSend_openVisualIntelligence(void *a1, const char *a2, ...)
{
  return _[a1 openVisualIntelligence];
}

id objc_msgSend_optimalNumberOfRows_itemsPerRow_forTotalNumberOfItems_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "optimalNumberOfRows:itemsPerRow:forTotalNumberOfItems:");
}

id objc_msgSend_orbPreviewWindow(void *a1, const char *a2, ...)
{
  return _[a1 orbPreviewWindow];
}

id objc_msgSend_orbValue(void *a1, const char *a2, ...)
{
  return _[a1 orbValue];
}

id objc_msgSend_orderedSet(void *a1, const char *a2, ...)
{
  return _[a1 orderedSet];
}

id objc_msgSend_orientation(void *a1, const char *a2, ...)
{
  return _[a1 orientation];
}

id objc_msgSend_orientationDidChange(void *a1, const char *a2, ...)
{
  return _[a1 orientationDidChange];
}

id objc_msgSend_orientationDidChange_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "orientationDidChange:");
}

id objc_msgSend_orientationLocked(void *a1, const char *a2, ...)
{
  return _[a1 orientationLocked];
}

id objc_msgSend_orientedContinuousScrollViewFrameForScrollViewFrame_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "orientedContinuousScrollViewFrameForScrollViewFrame:");
}

id objc_msgSend_orientedPointLiesInContinuousScrollerActivationRegion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "orientedPointLiesInContinuousScrollerActivationRegion:");
}

id objc_msgSend_orientedScrollViewFrame(void *a1, const char *a2, ...)
{
  return _[a1 orientedScrollViewFrame];
}

id objc_msgSend_outlineColor(void *a1, const char *a2, ...)
{
  return _[a1 outlineColor];
}

id objc_msgSend_outlineThickness(void *a1, const char *a2, ...)
{
  return _[a1 outlineThickness];
}

id objc_msgSend_outputAccessQueue(void *a1, const char *a2, ...)
{
  return _[a1 outputAccessQueue];
}

id objc_msgSend_outputManager(void *a1, const char *a2, ...)
{
  return _[a1 outputManager];
}

id objc_msgSend_outputManager_didSpeakFocusContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "outputManager:didSpeakFocusContext:");
}

id objc_msgSend_outputManager_willSpeakFocusContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "outputManager:willSpeakFocusContext:");
}

id objc_msgSend_outputScannerAnnouncement_completionBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "outputScannerAnnouncement:completionBlock:");
}

id objc_msgSend_outputScannerAttributedString_completionBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "outputScannerAttributedString:completionBlock:");
}

id objc_msgSend_outputScannerFocusContext_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "outputScannerFocusContext:completion:");
}

id objc_msgSend_overflowPadding(void *a1, const char *a2, ...)
{
  return _[a1 overflowPadding];
}

id objc_msgSend_overrideImage(void *a1, const char *a2, ...)
{
  return _[a1 overrideImage];
}

id objc_msgSend_overscanCompensationInsets(void *a1, const char *a2, ...)
{
  return _[a1 overscanCompensationInsets];
}

id objc_msgSend_page(void *a1, const char *a2, ...)
{
  return _[a1 page];
}

id objc_msgSend_panFingerPositions(void *a1, const char *a2, ...)
{
  return _[a1 panFingerPositions];
}

id objc_msgSend_parentGroup(void *a1, const char *a2, ...)
{
  return _[a1 parentGroup];
}

id objc_msgSend_parentSheetOfSheet_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "parentSheetOfSheet:");
}

id objc_msgSend_pathExtension(void *a1, const char *a2, ...)
{
  return _[a1 pathExtension];
}

id objc_msgSend_pathForCenterPointAtSelectionPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pathForCenterPointAtSelectionPath:");
}

id objc_msgSend_pathForResource_ofType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pathForResource:ofType:");
}

id objc_msgSend_pathLocation(void *a1, const char *a2, ...)
{
  return _[a1 pathLocation];
}

id objc_msgSend_pathMenuItems(void *a1, const char *a2, ...)
{
  return _[a1 pathMenuItems];
}

id objc_msgSend_pathPressure(void *a1, const char *a2, ...)
{
  return _[a1 pathPressure];
}

id objc_msgSend_paths(void *a1, const char *a2, ...)
{
  return _[a1 paths];
}

id objc_msgSend_pause(void *a1, const char *a2, ...)
{
  return _[a1 pause];
}

id objc_msgSend_pauseAutoscanning(void *a1, const char *a2, ...)
{
  return _[a1 pauseAutoscanning];
}

id objc_msgSend_pauseAutoscrolling(void *a1, const char *a2, ...)
{
  return _[a1 pauseAutoscrolling];
}

id objc_msgSend_pauseForNumberOfCycles_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pauseForNumberOfCycles:");
}

id objc_msgSend_pauseOnFirstItemInterval(void *a1, const char *a2, ...)
{
  return _[a1 pauseOnFirstItemInterval];
}

id objc_msgSend_pauseScanning(void *a1, const char *a2, ...)
{
  return _[a1 pauseScanning];
}

id objc_msgSend_pauseScanningForPointPickerNumberOfCycles_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pauseScanningForPointPickerNumberOfCycles:");
}

id objc_msgSend_pauseScanningWithScreenLockDisabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pauseScanningWithScreenLockDisabled:");
}

id objc_msgSend_payload(void *a1, const char *a2, ...)
{
  return _[a1 payload];
}

id objc_msgSend_performAXAction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performAXAction:");
}

id objc_msgSend_performAXAction_withValue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performAXAction:withValue:");
}

id objc_msgSend_performAction(void *a1, const char *a2, ...)
{
  return _[a1 performAction];
}

id objc_msgSend_performAction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performAction:");
}

id objc_msgSend_performAction_withValue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performAction:withValue:");
}

id objc_msgSend_performActionForSystemAction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performActionForSystemAction:");
}

id objc_msgSend_performAsynchronousWritingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performAsynchronousWritingBlock:");
}

id objc_msgSend_performButtonAction_type_state_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performButtonAction:type:state:");
}

id objc_msgSend_performDownAtPoint_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performDownAtPoint:");
}

id objc_msgSend_performFingerDownAtPoint_onDisplay_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performFingerDownAtPoint:onDisplay:");
}

id objc_msgSend_performFingerUpAtPoint_onDisplay_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performFingerUpAtPoint:onDisplay:");
}

id objc_msgSend_performGesture_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performGesture:completion:");
}

id objc_msgSend_performHoldAtPoint_isDown_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performHoldAtPoint:isDown:");
}

id objc_msgSend_performMoveToPoint_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performMoveToPoint:");
}

id objc_msgSend_performPreparedGestureOnDisplay_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performPreparedGestureOnDisplay:");
}

id objc_msgSend_performPress_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performPress:");
}

id objc_msgSend_performPress_type_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performPress:type:");
}

id objc_msgSend_performPress_type_source_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performPress:type:source:");
}

id objc_msgSend_performSelector_onThread_withObject_waitUntilDone_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performSelector:onThread:withObject:waitUntilDone:");
}

id objc_msgSend_performSelector_withObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performSelector:withObject:");
}

id objc_msgSend_performSelector_withObject_afterDelay_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performSelector:withObject:afterDelay:");
}

id objc_msgSend_performSynchronousWritingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performSynchronousWritingBlock:");
}

id objc_msgSend_performSysdiagnoseForInputController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performSysdiagnoseForInputController:");
}

id objc_msgSend_performSysdiagnoseOnReceiver(void *a1, const char *a2, ...)
{
  return _[a1 performSysdiagnoseOnReceiver];
}

id objc_msgSend_performSysdiagnoseWithStatusUpdateHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performSysdiagnoseWithStatusUpdateHandler:");
}

id objc_msgSend_performTap(void *a1, const char *a2, ...)
{
  return _[a1 performTap];
}

id objc_msgSend_performTapAndHold(void *a1, const char *a2, ...)
{
  return _[a1 performTapAndHold];
}

id objc_msgSend_performUpAtPoint_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performUpAtPoint:");
}

id objc_msgSend_performValidations_withPreValidationHandler_postValidationHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performValidations:withPreValidationHandler:postValidationHandler:");
}

id objc_msgSend_performWithoutAnimation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performWithoutAnimation:");
}

id objc_msgSend_persistentSwitchIdentifierForButtonNumber_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "persistentSwitchIdentifierForButtonNumber:");
}

id objc_msgSend_persistentSwitchIdentifiers(void *a1, const char *a2, ...)
{
  return _[a1 persistentSwitchIdentifiers];
}

id objc_msgSend_pickedPoint(void *a1, const char *a2, ...)
{
  return _[a1 pickedPoint];
}

id objc_msgSend_pickedPointInDeviceCoordinates(void *a1, const char *a2, ...)
{
  return _[a1 pickedPointInDeviceCoordinates];
}

id objc_msgSend_pickerPhase(void *a1, const char *a2, ...)
{
  return _[a1 pickerPhase];
}

id objc_msgSend_pickerViewController(void *a1, const char *a2, ...)
{
  return _[a1 pickerViewController];
}

id objc_msgSend_pid(void *a1, const char *a2, ...)
{
  return _[a1 pid];
}

id objc_msgSend_pinchAngle(void *a1, const char *a2, ...)
{
  return _[a1 pinchAngle];
}

id objc_msgSend_pinchFingerOriginalPositions(void *a1, const char *a2, ...)
{
  return _[a1 pinchFingerOriginalPositions];
}

id objc_msgSend_pinchFulcrum(void *a1, const char *a2, ...)
{
  return _[a1 pinchFulcrum];
}

id objc_msgSend_pinchRadius(void *a1, const char *a2, ...)
{
  return _[a1 pinchRadius];
}

id objc_msgSend_pitch(void *a1, const char *a2, ...)
{
  return _[a1 pitch];
}

id objc_msgSend_play(void *a1, const char *a2, ...)
{
  return _[a1 play];
}

id objc_msgSend_playMouseClickSound(void *a1, const char *a2, ...)
{
  return _[a1 playMouseClickSound];
}

id objc_msgSend_playPauseButton(void *a1, const char *a2, ...)
{
  return _[a1 playPauseButton];
}

id objc_msgSend_playSound_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "playSound:");
}

id objc_msgSend_playedHapticForCurrentEvent(void *a1, const char *a2, ...)
{
  return _[a1 playedHapticForCurrentEvent];
}

id objc_msgSend_pointForFingerIdentifier_atEventIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pointForFingerIdentifier:atEventIndex:");
}

id objc_msgSend_pointInside_withEvent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pointInside:withEvent:");
}

id objc_msgSend_pointPicker(void *a1, const char *a2, ...)
{
  return _[a1 pointPicker];
}

id objc_msgSend_pointPicker_didPickPoint_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pointPicker:didPickPoint:");
}

id objc_msgSend_pointPicker_didSweepIntoFocusContext_isRefiningPoint_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pointPicker:didSweepIntoFocusContext:isRefiningPoint:");
}

id objc_msgSend_pointPicker_didSweepOutOfFocusContext_isRefiningPoint_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pointPicker:didSweepOutOfFocusContext:isRefiningPoint:");
}

id objc_msgSend_pointPicker_pauseForNumberOfCycles_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pointPicker:pauseForNumberOfCycles:");
}

id objc_msgSend_pointPickerDidFinishSweeping_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pointPickerDidFinishSweeping:");
}

id objc_msgSend_pointPickerPromptBackdropStyle(void *a1, const char *a2, ...)
{
  return _[a1 pointPickerPromptBackdropStyle];
}

id objc_msgSend_pointPickerPromptCornerRadius(void *a1, const char *a2, ...)
{
  return _[a1 pointPickerPromptCornerRadius];
}

id objc_msgSend_pointPickerPromptFont(void *a1, const char *a2, ...)
{
  return _[a1 pointPickerPromptFont];
}

id objc_msgSend_pointPickerPromptPadding(void *a1, const char *a2, ...)
{
  return _[a1 pointPickerPromptPadding];
}

id objc_msgSend_pointPickerPromptTextColor(void *a1, const char *a2, ...)
{
  return _[a1 pointPickerPromptTextColor];
}

id objc_msgSend_pointPickerView(void *a1, const char *a2, ...)
{
  return _[a1 pointPickerView];
}

id objc_msgSend_pointPickerWithMode_menu_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pointPickerWithMode:menu:");
}

id objc_msgSend_pointValue(void *a1, const char *a2, ...)
{
  return _[a1 pointValue];
}

id objc_msgSend_pointerAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pointerAtIndex:");
}

id objc_msgSend_popSheet(void *a1, const char *a2, ...)
{
  return _[a1 popSheet];
}

id objc_msgSend_popoverPosition(void *a1, const char *a2, ...)
{
  return _[a1 popoverPosition];
}

id objc_msgSend_popoverStyleAttributes(void *a1, const char *a2, ...)
{
  return _[a1 popoverStyleAttributes];
}

id objc_msgSend_portraitUpScreenBounds(void *a1, const char *a2, ...)
{
  return _[a1 portraitUpScreenBounds];
}

id objc_msgSend_position(void *a1, const char *a2, ...)
{
  return _[a1 position];
}

id objc_msgSend_positionRelativeToContextElement(void *a1, const char *a2, ...)
{
  return _[a1 positionRelativeToContextElement];
}

id objc_msgSend_postActivationScanLocations(void *a1, const char *a2, ...)
{
  return _[a1 postActivationScanLocations];
}

id objc_msgSend_postNotificationName_object_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "postNotificationName:object:");
}

id objc_msgSend_postTransitionUpdateBlock(void *a1, const char *a2, ...)
{
  return _[a1 postTransitionUpdateBlock];
}

id objc_msgSend_predicateWithBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateWithBlock:");
}

id objc_msgSend_preferenceForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "preferenceForKey:");
}

id objc_msgSend_preferredContentSizeCategory(void *a1, const char *a2, ...)
{
  return _[a1 preferredContentSizeCategory];
}

id objc_msgSend_preferredMenuDisplayPointOnDisplay_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "preferredMenuDisplayPointOnDisplay:");
}

id objc_msgSend_preferredNumberOfTitleLines(void *a1, const char *a2, ...)
{
  return _[a1 preferredNumberOfTitleLines];
}

id objc_msgSend_preferredTipObject(void *a1, const char *a2, ...)
{
  return _[a1 preferredTipObject];
}

id objc_msgSend_prepareForContinuousScrollOnDisplay_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "prepareForContinuousScrollOnDisplay:");
}

id objc_msgSend_prepareGesture_onDisplay_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "prepareGesture:onDisplay:");
}

id objc_msgSend_prepareScrollAtPoint_onDisplay_vertical_forward_max_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "prepareScrollAtPoint:onDisplay:vertical:forward:max:");
}

id objc_msgSend_prepareUsingFeedback_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "prepareUsingFeedback:");
}

id objc_msgSend_presentHUDViewTimer(void *a1, const char *a2, ...)
{
  return _[a1 presentHUDViewTimer];
}

id objc_msgSend_presentPostScanningMenuForElementNavigationController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "presentPostScanningMenuForElementNavigationController:");
}

id objc_msgSend_presentSiriShortcutsMenu(void *a1, const char *a2, ...)
{
  return _[a1 presentSiriShortcutsMenu];
}

id objc_msgSend_presentWithDisplayContext_animated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "presentWithDisplayContext:animated:");
}

id objc_msgSend_presentWithElement_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "presentWithElement:");
}

id objc_msgSend_presentWithPointPicker_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "presentWithPointPicker:");
}

id objc_msgSend_presentWithRootLevelSheet_useCurrentElementAndPoint_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "presentWithRootLevelSheet:useCurrentElementAndPoint:");
}

id objc_msgSend_presentationLayer(void *a1, const char *a2, ...)
{
  return _[a1 presentationLayer];
}

id objc_msgSend_presentationMode(void *a1, const char *a2, ...)
{
  return _[a1 presentationMode];
}

id objc_msgSend_press(void *a1, const char *a2, ...)
{
  return _[a1 press];
}

id objc_msgSend_pressCameraButton(void *a1, const char *a2, ...)
{
  return _[a1 pressCameraButton];
}

id objc_msgSend_pressFingersDownAnimated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pressFingersDownAnimated:");
}

id objc_msgSend_pressHomeButtonDown(void *a1, const char *a2, ...)
{
  return _[a1 pressHomeButtonDown];
}

id objc_msgSend_pressLockButtonDown(void *a1, const char *a2, ...)
{
  return _[a1 pressLockButtonDown];
}

id objc_msgSend_pressStaccato(void *a1, const char *a2, ...)
{
  return _[a1 pressStaccato];
}

id objc_msgSend_pressVolumeDownButtonDown(void *a1, const char *a2, ...)
{
  return _[a1 pressVolumeDownButtonDown];
}

id objc_msgSend_pressVolumeUpButtonDown(void *a1, const char *a2, ...)
{
  return _[a1 pressVolumeUpButtonDown];
}

id objc_msgSend_pressedBackgroundBorderImageView(void *a1, const char *a2, ...)
{
  return _[a1 pressedBackgroundBorderImageView];
}

id objc_msgSend_pressedBackgroundImage(void *a1, const char *a2, ...)
{
  return _[a1 pressedBackgroundImage];
}

id objc_msgSend_pressesOnMoveStart(void *a1, const char *a2, ...)
{
  return _[a1 pressesOnMoveStart];
}

id objc_msgSend_previewColor(void *a1, const char *a2, ...)
{
  return _[a1 previewColor];
}

id objc_msgSend_previewDistance(void *a1, const char *a2, ...)
{
  return _[a1 previewDistance];
}

id objc_msgSend_previewLineThickness(void *a1, const char *a2, ...)
{
  return _[a1 previewLineThickness];
}

id objc_msgSend_previewOutlineColor(void *a1, const char *a2, ...)
{
  return _[a1 previewOutlineColor];
}

id objc_msgSend_previewOutlineThickness(void *a1, const char *a2, ...)
{
  return _[a1 previewOutlineThickness];
}

id objc_msgSend_previousAuxiliaryElementManagerTo_role_excludeDisabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "previousAuxiliaryElementManagerTo:role:excludeDisabled:");
}

id objc_msgSend_previousItemForScanningFromItem_didWrap_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "previousItemForScanningFromItem:didWrap:");
}

id objc_msgSend_previousPrimaryButtonPressDownDate(void *a1, const char *a2, ...)
{
  return _[a1 previousPrimaryButtonPressDownDate];
}

id objc_msgSend_previousSiblingOfChild_didWrap_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "previousSiblingOfChild:didWrap:");
}

id objc_msgSend_previousSiblingOfElement_didWrap_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "previousSiblingOfElement:didWrap:");
}

id objc_msgSend_previousSiblingOfGroupable_didWrap_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "previousSiblingOfGroupable:didWrap:");
}

id objc_msgSend_primaryApp(void *a1, const char *a2, ...)
{
  return _[a1 primaryApp];
}

id objc_msgSend_printAttachedDevices(void *a1, const char *a2, ...)
{
  return _[a1 printAttachedDevices];
}

id objc_msgSend_priority(void *a1, const char *a2, ...)
{
  return _[a1 priority];
}

id objc_msgSend_processAXOutputAction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "processAXOutputAction:");
}

id objc_msgSend_processInfo(void *a1, const char *a2, ...)
{
  return _[a1 processInfo];
}

id objc_msgSend_processOrientedPointForContinuousScrolling_onDisplay_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "processOrientedPointForContinuousScrolling:onDisplay:");
}

id objc_msgSend_productName(void *a1, const char *a2, ...)
{
  return _[a1 productName];
}

id objc_msgSend_prompt(void *a1, const char *a2, ...)
{
  return _[a1 prompt];
}

id objc_msgSend_providers(void *a1, const char *a2, ...)
{
  return _[a1 providers];
}

id objc_msgSend_providesElements(void *a1, const char *a2, ...)
{
  return _[a1 providesElements];
}

id objc_msgSend_pushFreehandSheetOfClass_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pushFreehandSheetOfClass:");
}

id objc_msgSend_pushSheet_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pushSheet:");
}

id objc_msgSend_queue(void *a1, const char *a2, ...)
{
  return _[a1 queue];
}

id objc_msgSend_raise_format_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "raise:format:");
}

id objc_msgSend_rangeLayerBorderWidth(void *a1, const char *a2, ...)
{
  return _[a1 rangeLayerBorderWidth];
}

id objc_msgSend_rangeLayerFrameInset(void *a1, const char *a2, ...)
{
  return _[a1 rangeLayerFrameInset];
}

id objc_msgSend_rangeLayerMaxWidth(void *a1, const char *a2, ...)
{
  return _[a1 rangeLayerMaxWidth];
}

id objc_msgSend_rangeOfComposedCharacterSequenceAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rangeOfComposedCharacterSequenceAtIndex:");
}

id objc_msgSend_rangeOfString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rangeOfString:");
}

id objc_msgSend_rate(void *a1, const char *a2, ...)
{
  return _[a1 rate];
}

id objc_msgSend_reachabilityOffset(void *a1, const char *a2, ...)
{
  return _[a1 reachabilityOffset];
}

id objc_msgSend_realPickedPoint(void *a1, const char *a2, ...)
{
  return _[a1 realPickedPoint];
}

id objc_msgSend_reasonsToDisableScanning(void *a1, const char *a2, ...)
{
  return _[a1 reasonsToDisableScanning];
}

id objc_msgSend_rebootDevice(void *a1, const char *a2, ...)
{
  return _[a1 rebootDevice];
}

id objc_msgSend_recentSpeechOutputStrings(void *a1, const char *a2, ...)
{
  return _[a1 recentSpeechOutputStrings];
}

id objc_msgSend_recipe(void *a1, const char *a2, ...)
{
  return _[a1 recipe];
}

id objc_msgSend_recipes(void *a1, const char *a2, ...)
{
  return _[a1 recipes];
}

id objc_msgSend_rectForFingersAtPoints_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rectForFingersAtPoints:");
}

id objc_msgSend_rectToClear(void *a1, const char *a2, ...)
{
  return _[a1 rectToClear];
}

id objc_msgSend_rectToClearForFingersWithGestureSheet_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rectToClearForFingersWithGestureSheet:");
}

id objc_msgSend_rectToClearForPinchGesture_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rectToClearForPinchGesture:");
}

id objc_msgSend_rectToClearForStop_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rectToClearForStop:");
}

id objc_msgSend_redisplayIfNeeded_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "redisplayIfNeeded:");
}

id objc_msgSend_refineSelectedPoint(void *a1, const char *a2, ...)
{
  return _[a1 refineSelectedPoint];
}

id objc_msgSend_refinementCount(void *a1, const char *a2, ...)
{
  return _[a1 refinementCount];
}

id objc_msgSend_refresh(void *a1, const char *a2, ...)
{
  return _[a1 refresh];
}

id objc_msgSend_refreshElements(void *a1, const char *a2, ...)
{
  return _[a1 refreshElements];
}

id objc_msgSend_refreshOrientation(void *a1, const char *a2, ...)
{
  return _[a1 refreshOrientation];
}

id objc_msgSend_registerAssistiveTouchPID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "registerAssistiveTouchPID:");
}

id objc_msgSend_registerClass_forCellWithReuseIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "registerClass:forCellWithReuseIdentifier:");
}

id objc_msgSend_registerFetchObserver_targetQueue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "registerFetchObserver:targetQueue:");
}

id objc_msgSend_registerForMessageName_target_selector_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "registerForMessageName:target:selector:");
}

id objc_msgSend_registerForTraitChanges_withHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "registerForTraitChanges:withHandler:");
}

id objc_msgSend_registerMenuObserver_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "registerMenuObserver:");
}

id objc_msgSend_registerUpdateBlock_forRetrieveSelector_withListener_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "registerUpdateBlock:forRetrieveSelector:withListener:");
}

id objc_msgSend_registeredSoundIDs(void *a1, const char *a2, ...)
{
  return _[a1 registeredSoundIDs];
}

id objc_msgSend_reload(void *a1, const char *a2, ...)
{
  return _[a1 reload];
}

id objc_msgSend_reloadCollectionView(void *a1, const char *a2, ...)
{
  return _[a1 reloadCollectionView];
}

id objc_msgSend_reloadData(void *a1, const char *a2, ...)
{
  return _[a1 reloadData];
}

id objc_msgSend_reloadFromCurrentSheet(void *a1, const char *a2, ...)
{
  return _[a1 reloadFromCurrentSheet];
}

id objc_msgSend_reloadMenuVisuals(void *a1, const char *a2, ...)
{
  return _[a1 reloadMenuVisuals];
}

id objc_msgSend_remoteControlInputSource(void *a1, const char *a2, ...)
{
  return _[a1 remoteControlInputSource];
}

id objc_msgSend_remoteDeviceIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 remoteDeviceIdentifier];
}

id objc_msgSend_remoteDeviceName(void *a1, const char *a2, ...)
{
  return _[a1 remoteDeviceName];
}

id objc_msgSend_remoteElements(void *a1, const char *a2, ...)
{
  return _[a1 remoteElements];
}

id objc_msgSend_remoteGroups(void *a1, const char *a2, ...)
{
  return _[a1 remoteGroups];
}

id objc_msgSend_remoteParent(void *a1, const char *a2, ...)
{
  return _[a1 remoteParent];
}

id objc_msgSend_remoteSwitchIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 remoteSwitchIdentifier];
}

id objc_msgSend_removeAllAnimations(void *a1, const char *a2, ...)
{
  return _[a1 removeAllAnimations];
}

id objc_msgSend_removeAllHandlersForTarget_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeAllHandlersForTarget:");
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return _[a1 removeAllObjects];
}

id objc_msgSend_removeAnimationForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeAnimationForKey:");
}

id objc_msgSend_removeEventHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeEventHandler:");
}

id objc_msgSend_removeFingersToPoint_onDisplay_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeFingersToPoint:onDisplay:");
}

id objc_msgSend_removeFromParentViewController(void *a1, const char *a2, ...)
{
  return _[a1 removeFromParentViewController];
}

id objc_msgSend_removeFromRunLoop_forMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeFromRunLoop:forMode:");
}

id objc_msgSend_removeFromSuperlayer(void *a1, const char *a2, ...)
{
  return _[a1 removeFromSuperlayer];
}

id objc_msgSend_removeFromSuperview(void *a1, const char *a2, ...)
{
  return _[a1 removeFromSuperview];
}

id objc_msgSend_removeLastObject(void *a1, const char *a2, ...)
{
  return _[a1 removeLastObject];
}

id objc_msgSend_removeNotificationObserverAndDealloc(void *a1, const char *a2, ...)
{
  return _[a1 removeNotificationObserverAndDealloc];
}

id objc_msgSend_removeObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObject:");
}

id objc_msgSend_removeObjectAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObjectAtIndex:");
}

id objc_msgSend_removeObjectsInArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObjectsInArray:");
}

id objc_msgSend_removeObjectsInRange_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObjectsInRange:");
}

id objc_msgSend_removeObserver_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObserver:");
}

id objc_msgSend_removePointerAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removePointerAtIndex:");
}

id objc_msgSend_removeReasonToDisableScanning_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeReasonToDisableScanning:");
}

id objc_msgSend_removeTarget_action_forControlEvents_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeTarget:action:forControlEvents:");
}

id objc_msgSend_removeUserInterfaceClientEnabler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeUserInterfaceClientEnabler:");
}

id objc_msgSend_repeatActionInterval(void *a1, const char *a2, ...)
{
  return _[a1 repeatActionInterval];
}

id objc_msgSend_replayGesture_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "replayGesture:");
}

id objc_msgSend_representationWithData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "representationWithData:");
}

id objc_msgSend_representationWithHIDEvent_hidStreamIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "representationWithHIDEvent:hidStreamIdentifier:");
}

id objc_msgSend_resetActivation(void *a1, const char *a2, ...)
{
  return _[a1 resetActivation];
}

id objc_msgSend_resetElementFetcher(void *a1, const char *a2, ...)
{
  return _[a1 resetElementFetcher];
}

id objc_msgSend_resetEventManager(void *a1, const char *a2, ...)
{
  return _[a1 resetEventManager];
}

id objc_msgSend_resetFingersIfActiveOnDisplay_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "resetFingersIfActiveOnDisplay:");
}

id objc_msgSend_resetFingersIfNeededOnDisplay_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "resetFingersIfNeededOnDisplay:");
}

id objc_msgSend_resetFingersToPoint_onDisplay_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "resetFingersToPoint:onDisplay:");
}

id objc_msgSend_resetFingersToPoint_onDisplay_active_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "resetFingersToPoint:onDisplay:active:");
}

id objc_msgSend_resetImages(void *a1, const char *a2, ...)
{
  return _[a1 resetImages];
}

id objc_msgSend_resetLineLayer(void *a1, const char *a2, ...)
{
  return _[a1 resetLineLayer];
}

id objc_msgSend_resetNubbitLocation(void *a1, const char *a2, ...)
{
  return _[a1 resetNubbitLocation];
}

id objc_msgSend_resetOrbAction(void *a1, const char *a2, ...)
{
  return _[a1 resetOrbAction];
}

id objc_msgSend_resetPinchFingers(void *a1, const char *a2, ...)
{
  return _[a1 resetPinchFingers];
}

id objc_msgSend_resetPinchFingersOnDisplay_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "resetPinchFingersOnDisplay:");
}

id objc_msgSend_resetRefinedSelectedPoint(void *a1, const char *a2, ...)
{
  return _[a1 resetRefinedSelectedPoint];
}

id objc_msgSend_resizableImageWithCapInsets_resizingMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "resizableImageWithCapInsets:resizingMode:");
}

id objc_msgSend_resolvedImage(void *a1, const char *a2, ...)
{
  return _[a1 resolvedImage];
}

id objc_msgSend_resourcePath(void *a1, const char *a2, ...)
{
  return _[a1 resourcePath];
}

id objc_msgSend_respondsToUserInteraction(void *a1, const char *a2, ...)
{
  return _[a1 respondsToUserInteraction];
}

id objc_msgSend_restartDeviceDetection(void *a1, const char *a2, ...)
{
  return _[a1 restartDeviceDetection];
}

id objc_msgSend_restartEverything(void *a1, const char *a2, ...)
{
  return _[a1 restartEverything];
}

id objc_msgSend_restartWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "restartWithCompletion:");
}

id objc_msgSend_restingFillColor(void *a1, const char *a2, ...)
{
  return _[a1 restingFillColor];
}

id objc_msgSend_restingStrokeColor(void *a1, const char *a2, ...)
{
  return _[a1 restingStrokeColor];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return _[a1 resume];
}

id objc_msgSend_resumeAutoscanning(void *a1, const char *a2, ...)
{
  return _[a1 resumeAutoscanning];
}

id objc_msgSend_resumeAutoscanning_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "resumeAutoscanning:");
}

id objc_msgSend_resumeScanning(void *a1, const char *a2, ...)
{
  return _[a1 resumeScanning];
}

id objc_msgSend_returnControlToForwarderDevice_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "returnControlToForwarderDevice:");
}

id objc_msgSend_reverseObjectEnumerator(void *a1, const char *a2, ...)
{
  return _[a1 reverseObjectEnumerator];
}

id objc_msgSend_reversedAnimation(void *a1, const char *a2, ...)
{
  return _[a1 reversedAnimation];
}

id objc_msgSend_rightAnchor(void *a1, const char *a2, ...)
{
  return _[a1 rightAnchor];
}

id objc_msgSend_rightArrowButton(void *a1, const char *a2, ...)
{
  return _[a1 rightArrowButton];
}

id objc_msgSend_rightMostLeafAXElement(void *a1, const char *a2, ...)
{
  return _[a1 rightMostLeafAXElement];
}

id objc_msgSend_ringerSwitchChanged(void *a1, const char *a2, ...)
{
  return _[a1 ringerSwitchChanged];
}

id objc_msgSend_rocker(void *a1, const char *a2, ...)
{
  return _[a1 rocker];
}

id objc_msgSend_rockerFrame(void *a1, const char *a2, ...)
{
  return _[a1 rockerFrame];
}

id objc_msgSend_rockerHitTest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rockerHitTest:");
}

id objc_msgSend_role(void *a1, const char *a2, ...)
{
  return _[a1 role];
}

id objc_msgSend_roleForElement_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "roleForElement:");
}

id objc_msgSend_rootGroup(void *a1, const char *a2, ...)
{
  return _[a1 rootGroup];
}

id objc_msgSend_rootKeyboardGroup(void *a1, const char *a2, ...)
{
  return _[a1 rootKeyboardGroup];
}

id objc_msgSend_rootScannerGroup(void *a1, const char *a2, ...)
{
  return _[a1 rootScannerGroup];
}

id objc_msgSend_rootSheet(void *a1, const char *a2, ...)
{
  return _[a1 rootSheet];
}

id objc_msgSend_rotate90CCWItem(void *a1, const char *a2, ...)
{
  return _[a1 rotate90CCWItem];
}

id objc_msgSend_rotate90CWItem(void *a1, const char *a2, ...)
{
  return _[a1 rotate90CWItem];
}

id objc_msgSend_rotate90ClockwiseButton(void *a1, const char *a2, ...)
{
  return _[a1 rotate90ClockwiseButton];
}

id objc_msgSend_rotate90ClockwiseForFreehandSheet_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rotate90ClockwiseForFreehandSheet:");
}

id objc_msgSend_rotate90CounterclockwiseButton(void *a1, const char *a2, ...)
{
  return _[a1 rotate90CounterclockwiseButton];
}

id objc_msgSend_rotate90CounterclockwiseForFreehandSheet_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rotate90CounterclockwiseForFreehandSheet:");
}

id objc_msgSend_rotate90Item(void *a1, const char *a2, ...)
{
  return _[a1 rotate90Item];
}

id objc_msgSend_rotateCCWItem(void *a1, const char *a2, ...)
{
  return _[a1 rotateCCWItem];
}

id objc_msgSend_rotateCWItem(void *a1, const char *a2, ...)
{
  return _[a1 rotateCWItem];
}

id objc_msgSend_rotateClockwiseControl(void *a1, const char *a2, ...)
{
  return _[a1 rotateClockwiseControl];
}

id objc_msgSend_rotateClockwiseForFreehandSheet_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rotateClockwiseForFreehandSheet:");
}

id objc_msgSend_rotateCounterclockwiseControl(void *a1, const char *a2, ...)
{
  return _[a1 rotateCounterclockwiseControl];
}

id objc_msgSend_rotateCounterclockwiseForFreehandSheet_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rotateCounterclockwiseForFreehandSheet:");
}

id objc_msgSend_rotateForFreehandSheet_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rotateForFreehandSheet:");
}

id objc_msgSend_rotateItems(void *a1, const char *a2, ...)
{
  return _[a1 rotateItems];
}

id objc_msgSend_rotateLeft(void *a1, const char *a2, ...)
{
  return _[a1 rotateLeft];
}

id objc_msgSend_rotateMenuItemWithPreferredNumberOfLines_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rotateMenuItemWithPreferredNumberOfLines:");
}

id objc_msgSend_rotatePortrait(void *a1, const char *a2, ...)
{
  return _[a1 rotatePortrait];
}

id objc_msgSend_rotateRight(void *a1, const char *a2, ...)
{
  return _[a1 rotateRight];
}

id objc_msgSend_rotateUpsideDown(void *a1, const char *a2, ...)
{
  return _[a1 rotateUpsideDown];
}

id objc_msgSend_rotation90ControlFont(void *a1, const char *a2, ...)
{
  return _[a1 rotation90ControlFont];
}

id objc_msgSend_rotation90ControlNearestRadius(void *a1, const char *a2, ...)
{
  return _[a1 rotation90ControlNearestRadius];
}

id objc_msgSend_rotationControlAngleAwayFromMidAngle(void *a1, const char *a2, ...)
{
  return _[a1 rotationControlAngleAwayFromMidAngle];
}

id objc_msgSend_rotationControlCurveRadius(void *a1, const char *a2, ...)
{
  return _[a1 rotationControlCurveRadius];
}

id objc_msgSend_rotationControlLength(void *a1, const char *a2, ...)
{
  return _[a1 rotationControlLength];
}

id objc_msgSend_rotationLockChanged(void *a1, const char *a2, ...)
{
  return _[a1 rotationLockChanged];
}

id objc_msgSend_roundedRectBezierPath_withRoundedEdges_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "roundedRectBezierPath:withRoundedEdges:");
}

id objc_msgSend_roundedRectCornerRadius(void *a1, const char *a2, ...)
{
  return _[a1 roundedRectCornerRadius];
}

id objc_msgSend_runServerOnCurrentThread(void *a1, const char *a2, ...)
{
  return _[a1 runServerOnCurrentThread];
}

id objc_msgSend_safeAreaInsets(void *a1, const char *a2, ...)
{
  return _[a1 safeAreaInsets];
}

id objc_msgSend_safeAreaLayoutGuide(void *a1, const char *a2, ...)
{
  return _[a1 safeAreaLayoutGuide];
}

id objc_msgSend_safeIntegerForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "safeIntegerForKey:");
}

id objc_msgSend_safeValueForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "safeValueForKey:");
}

id objc_msgSend_sc_deviceIconNameForIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sc_deviceIconNameForIdentifier:");
}

id objc_msgSend_scale(void *a1, const char *a2, ...)
{
  return _[a1 scale];
}

id objc_msgSend_scaledValueForValue_compatibleWithTraitCollection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "scaledValueForValue:compatibleWithTraitCollection:");
}

id objc_msgSend_scannerBackCursorView(void *a1, const char *a2, ...)
{
  return _[a1 scannerBackCursorView];
}

id objc_msgSend_scannerBlueColor(void *a1, const char *a2, ...)
{
  return _[a1 scannerBlueColor];
}

id objc_msgSend_scannerContentView(void *a1, const char *a2, ...)
{
  return _[a1 scannerContentView];
}

id objc_msgSend_scannerCursorOutlineThickness(void *a1, const char *a2, ...)
{
  return _[a1 scannerCursorOutlineThickness];
}

id objc_msgSend_scannerCursorThickness(void *a1, const char *a2, ...)
{
  return _[a1 scannerCursorThickness];
}

id objc_msgSend_scannerElementMatchingElement_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "scannerElementMatchingElement:");
}

id objc_msgSend_scannerFrameForPointPickerCenterPoint_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "scannerFrameForPointPickerCenterPoint:");
}

id objc_msgSend_scannerFrameForPointPickerGroup_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "scannerFrameForPointPickerGroup:");
}

id objc_msgSend_scannerFrameForPointPickerSquare_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "scannerFrameForPointPickerSquare:");
}

id objc_msgSend_scannerFrontCursorView(void *a1, const char *a2, ...)
{
  return _[a1 scannerFrontCursorView];
}

id objc_msgSend_scannerManager_didActivateElement_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "scannerManager:didActivateElement:");
}

id objc_msgSend_scannerManager_didFocusOnContext_oldContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "scannerManager:didFocusOnContext:oldContext:");
}

id objc_msgSend_scannerManager_willFocusOnContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "scannerManager:willFocusOnContext:");
}

id objc_msgSend_scannerManager_willUnfocusFromContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "scannerManager:willUnfocusFromContext:");
}

id objc_msgSend_scannerManagerDidBecomeActive_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "scannerManagerDidBecomeActive:");
}

id objc_msgSend_scannerManagerDidBecomeInactive_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "scannerManagerDidBecomeInactive:");
}

id objc_msgSend_scannerManagerDidPause_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "scannerManagerDidPause:");
}

id objc_msgSend_scannerObservers(void *a1, const char *a2, ...)
{
  return _[a1 scannerObservers];
}

id objc_msgSend_scannerPathForPointPickerCenterPoint_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "scannerPathForPointPickerCenterPoint:");
}

id objc_msgSend_scannerType(void *a1, const char *a2, ...)
{
  return _[a1 scannerType];
}

id objc_msgSend_scannerWillMakeManagerActive_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "scannerWillMakeManagerActive:");
}

id objc_msgSend_scannerWillMakeManagerActive_forDisplayID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "scannerWillMakeManagerActive:forDisplayID:");
}

id objc_msgSend_scannerWillMakeManagerInactive_activeElementManager_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "scannerWillMakeManagerInactive:activeElementManager:");
}

id objc_msgSend_scanningBehaviorTraits(void *a1, const char *a2, ...)
{
  return _[a1 scanningBehaviorTraits];
}

id objc_msgSend_scanningInterruptsSpeech(void *a1, const char *a2, ...)
{
  return _[a1 scanningInterruptsSpeech];
}

id objc_msgSend_scanningMode(void *a1, const char *a2, ...)
{
  return _[a1 scanningMode];
}

id objc_msgSend_scanningStyles(void *a1, const char *a2, ...)
{
  return _[a1 scanningStyles];
}

id objc_msgSend_scatActivateBehavior(void *a1, const char *a2, ...)
{
  return _[a1 scatActivateBehavior];
}

id objc_msgSend_scatAlternateKeys(void *a1, const char *a2, ...)
{
  return _[a1 scatAlternateKeys];
}

id objc_msgSend_scatAutoscrollInDirection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "scatAutoscrollInDirection:");
}

id objc_msgSend_scatAuxiliaryElementManager(void *a1, const char *a2, ...)
{
  return _[a1 scatAuxiliaryElementManager];
}

id objc_msgSend_scatBackCursorUIContext(void *a1, const char *a2, ...)
{
  return _[a1 scatBackCursorUIContext];
}

id objc_msgSend_scatBackCursorUIContextForDisplayID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "scatBackCursorUIContextForDisplayID:");
}

id objc_msgSend_scatBeginScanningFromSelfAfterActivation(void *a1, const char *a2, ...)
{
  return _[a1 scatBeginScanningFromSelfAfterActivation];
}

id objc_msgSend_scatBluetoothDeviceWithDevice_accessoryManager_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "scatBluetoothDeviceWithDevice:accessoryManager:");
}

id objc_msgSend_scatCanScrollInAtLeastOneDirection(void *a1, const char *a2, ...)
{
  return _[a1 scatCanScrollInAtLeastOneDirection];
}

id objc_msgSend_scatCanShowAlternateKeys(void *a1, const char *a2, ...)
{
  return _[a1 scatCanShowAlternateKeys];
}

id objc_msgSend_scatCenterPoint(void *a1, const char *a2, ...)
{
  return _[a1 scatCenterPoint];
}

id objc_msgSend_scatCustomActions(void *a1, const char *a2, ...)
{
  return _[a1 scatCustomActions];
}

id objc_msgSend_scatCustomHardwareActions(void *a1, const char *a2, ...)
{
  return _[a1 scatCustomHardwareActions];
}

id objc_msgSend_scatDecreaseAutoscrollSpeed(void *a1, const char *a2, ...)
{
  return _[a1 scatDecreaseAutoscrollSpeed];
}

id objc_msgSend_scatDidBecomeFocused_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "scatDidBecomeFocused:");
}

id objc_msgSend_scatDisplayId(void *a1, const char *a2, ...)
{
  return _[a1 scatDisplayId];
}

id objc_msgSend_scatElement(void *a1, const char *a2, ...)
{
  return _[a1 scatElement];
}

id objc_msgSend_scatFrame(void *a1, const char *a2, ...)
{
  return _[a1 scatFrame];
}

id objc_msgSend_scatFrontCursorUIContext(void *a1, const char *a2, ...)
{
  return _[a1 scatFrontCursorUIContext];
}

id objc_msgSend_scatFrontCursorUIContextForDisplayID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "scatFrontCursorUIContextForDisplayID:");
}

id objc_msgSend_scatHidesGroupCursorWhenFocused(void *a1, const char *a2, ...)
{
  return _[a1 scatHidesGroupCursorWhenFocused];
}

id objc_msgSend_scatIncreaseAutoscrollSpeed(void *a1, const char *a2, ...)
{
  return _[a1 scatIncreaseAutoscrollSpeed];
}

id objc_msgSend_scatIndicatesOwnFocus(void *a1, const char *a2, ...)
{
  return _[a1 scatIndicatesOwnFocus];
}

id objc_msgSend_scatIsAXElement(void *a1, const char *a2, ...)
{
  return _[a1 scatIsAXElement];
}

id objc_msgSend_scatIsAutoscrolling(void *a1, const char *a2, ...)
{
  return _[a1 scatIsAutoscrolling];
}

id objc_msgSend_scatIsAuxiliaryElement(void *a1, const char *a2, ...)
{
  return _[a1 scatIsAuxiliaryElement];
}

id objc_msgSend_scatIsKeyboardKey(void *a1, const char *a2, ...)
{
  return _[a1 scatIsKeyboardKey];
}

id objc_msgSend_scatIsMemberOfGroup(void *a1, const char *a2, ...)
{
  return _[a1 scatIsMemberOfGroup];
}

id objc_msgSend_scatIsValid(void *a1, const char *a2, ...)
{
  return _[a1 scatIsValid];
}

id objc_msgSend_scatLayer(void *a1, const char *a2, ...)
{
  return _[a1 scatLayer];
}

id objc_msgSend_scatMenuItemStyle(void *a1, const char *a2, ...)
{
  return _[a1 scatMenuItemStyle];
}

id objc_msgSend_scatOverrideCursorTheme(void *a1, const char *a2, ...)
{
  return _[a1 scatOverrideCursorTheme];
}

id objc_msgSend_scatPath(void *a1, const char *a2, ...)
{
  return _[a1 scatPath];
}

id objc_msgSend_scatPathIsInSceneReferenceSpace(void *a1, const char *a2, ...)
{
  return _[a1 scatPathIsInSceneReferenceSpace];
}

id objc_msgSend_scatPauseAutoscrolling(void *a1, const char *a2, ...)
{
  return _[a1 scatPauseAutoscrolling];
}

id objc_msgSend_scatPerformAction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "scatPerformAction:");
}

id objc_msgSend_scatPerformAction_withValue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "scatPerformAction:withValue:");
}

id objc_msgSend_scatScanningBehaviorTraits(void *a1, const char *a2, ...)
{
  return _[a1 scatScanningBehaviorTraits];
}

id objc_msgSend_scatScreenPointForOperations(void *a1, const char *a2, ...)
{
  return _[a1 scatScreenPointForOperations];
}

id objc_msgSend_scatScrollToTop(void *a1, const char *a2, ...)
{
  return _[a1 scatScrollToTop];
}

id objc_msgSend_scatScrollToVisible(void *a1, const char *a2, ...)
{
  return _[a1 scatScrollToVisible];
}

id objc_msgSend_scatShouldActivateDirectly(void *a1, const char *a2, ...)
{
  return _[a1 scatShouldActivateDirectly];
}

id objc_msgSend_scatShouldAllowDeferFocusToNativeFocusedElement(void *a1, const char *a2, ...)
{
  return _[a1 scatShouldAllowDeferFocusToNativeFocusedElement];
}

id objc_msgSend_scatShouldSuppressAudioOutput(void *a1, const char *a2, ...)
{
  return _[a1 scatShouldSuppressAudioOutput];
}

id objc_msgSend_scatSpeakableDescription(void *a1, const char *a2, ...)
{
  return _[a1 scatSpeakableDescription];
}

id objc_msgSend_scatSpeakableDescription_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "scatSpeakableDescription:");
}

id objc_msgSend_scatSupportedGestures(void *a1, const char *a2, ...)
{
  return _[a1 scatSupportedGestures];
}

id objc_msgSend_scatSupportsAction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "scatSupportsAction:");
}

id objc_msgSend_scatTextCursorFrame(void *a1, const char *a2, ...)
{
  return _[a1 scatTextCursorFrame];
}

id objc_msgSend_scatTraits(void *a1, const char *a2, ...)
{
  return _[a1 scatTraits];
}

id objc_msgSend_scatUIContext(void *a1, const char *a2, ...)
{
  return _[a1 scatUIContext];
}

id objc_msgSend_scatUIContextForDisplayID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "scatUIContextForDisplayID:");
}

id objc_msgSend_scatUpdateValue(void *a1, const char *a2, ...)
{
  return _[a1 scatUpdateValue];
}

id objc_msgSend_scatUpdatesMenu(void *a1, const char *a2, ...)
{
  return _[a1 scatUpdatesMenu];
}

id objc_msgSend_scatValue(void *a1, const char *a2, ...)
{
  return _[a1 scatValue];
}

id objc_msgSend_scat_cachedMenuImageForImageName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "scat_cachedMenuImageForImageName:");
}

id objc_msgSend_scat_setCachedMenuImage_forImageName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "scat_setCachedMenuImage:forImageName:");
}

id objc_msgSend_scat_singleCharacterImageForTitle_charactersInUse_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "scat_singleCharacterImageForTitle:charactersInUse:");
}

id objc_msgSend_scheduledTimerWithTimeInterval_target_selector_userInfo_repeats_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:");
}

id objc_msgSend_screen(void *a1, const char *a2, ...)
{
  return _[a1 screen];
}

id objc_msgSend_screenBounds(void *a1, const char *a2, ...)
{
  return _[a1 screenBounds];
}

id objc_msgSend_screenChangingButtonWasPressed_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "screenChangingButtonWasPressed:");
}

id objc_msgSend_screenDidChange_data_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "screenDidChange:data:");
}

id objc_msgSend_screenInputSource(void *a1, const char *a2, ...)
{
  return _[a1 screenInputSource];
}

id objc_msgSend_screenPoint(void *a1, const char *a2, ...)
{
  return _[a1 screenPoint];
}

id objc_msgSend_screenWillChange_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "screenWillChange:");
}

id objc_msgSend_scrollAction(void *a1, const char *a2, ...)
{
  return _[a1 scrollAction];
}

id objc_msgSend_scrollAncestorForScrollAction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "scrollAncestorForScrollAction:");
}

id objc_msgSend_scrollAreaToShowOverride(void *a1, const char *a2, ...)
{
  return _[a1 scrollAreaToShowOverride];
}

id objc_msgSend_scrollAxis(void *a1, const char *a2, ...)
{
  return _[a1 scrollAxis];
}

id objc_msgSend_scrollContainer_scrollInDirection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "scrollContainer:scrollInDirection:");
}

id objc_msgSend_scrollDelegate(void *a1, const char *a2, ...)
{
  return _[a1 scrollDelegate];
}

id objc_msgSend_scrollDirection(void *a1, const char *a2, ...)
{
  return _[a1 scrollDirection];
}

id objc_msgSend_scrollDirectionToActivationFrame(void *a1, const char *a2, ...)
{
  return _[a1 scrollDirectionToActivationFrame];
}

id objc_msgSend_scrollDownView(void *a1, const char *a2, ...)
{
  return _[a1 scrollDownView];
}

id objc_msgSend_scrollElement(void *a1, const char *a2, ...)
{
  return _[a1 scrollElement];
}

id objc_msgSend_scrollGestureFromPoint_toPoint_duration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "scrollGestureFromPoint:toPoint:duration:");
}

id objc_msgSend_scrollItems(void *a1, const char *a2, ...)
{
  return _[a1 scrollItems];
}

id objc_msgSend_scrollLeftView(void *a1, const char *a2, ...)
{
  return _[a1 scrollLeftView];
}

id objc_msgSend_scrollRightView(void *a1, const char *a2, ...)
{
  return _[a1 scrollRightView];
}

id objc_msgSend_scrollToBottom(void *a1, const char *a2, ...)
{
  return _[a1 scrollToBottom];
}

id objc_msgSend_scrollToTop(void *a1, const char *a2, ...)
{
  return _[a1 scrollToTop];
}

id objc_msgSend_scrollToVisible(void *a1, const char *a2, ...)
{
  return _[a1 scrollToVisible];
}

id objc_msgSend_scrollUpView(void *a1, const char *a2, ...)
{
  return _[a1 scrollUpView];
}

id objc_msgSend_scrollView(void *a1, const char *a2, ...)
{
  return _[a1 scrollView];
}

id objc_msgSend_scrollViewController_showHorizontalScrollerForContextElement_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "scrollViewController:showHorizontalScrollerForContextElement:");
}

id objc_msgSend_scrollViewController_showVerticalScrollerForContextElement_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "scrollViewController:showVerticalScrollerForContextElement:");
}

id objc_msgSend_scrollViewPickerManager(void *a1, const char *a2, ...)
{
  return _[a1 scrollViewPickerManager];
}

id objc_msgSend_scrollViews(void *a1, const char *a2, ...)
{
  return _[a1 scrollViews];
}

id objc_msgSend_scrollViewsForAction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "scrollViewsForAction:");
}

id objc_msgSend_scrollViewsForAction_elementsToScroll_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "scrollViewsForAction:elementsToScroll:");
}

id objc_msgSend_scrollViewsForAutoScroll(void *a1, const char *a2, ...)
{
  return _[a1 scrollViewsForAutoScroll];
}

id objc_msgSend_scrollableElement(void *a1, const char *a2, ...)
{
  return _[a1 scrollableElement];
}

id objc_msgSend_scrollerConstraints(void *a1, const char *a2, ...)
{
  return _[a1 scrollerConstraints];
}

id objc_msgSend_scrollerContainerView(void *a1, const char *a2, ...)
{
  return _[a1 scrollerContainerView];
}

id objc_msgSend_scrollerElements(void *a1, const char *a2, ...)
{
  return _[a1 scrollerElements];
}

id objc_msgSend_scrollerElementsForContextElement(void *a1, const char *a2, ...)
{
  return _[a1 scrollerElementsForContextElement];
}

id objc_msgSend_scrollerGroups(void *a1, const char *a2, ...)
{
  return _[a1 scrollerGroups];
}

id objc_msgSend_scrollerGroupsForContextElement(void *a1, const char *a2, ...)
{
  return _[a1 scrollerGroupsForContextElement];
}

id objc_msgSend_scrollerSize(void *a1, const char *a2, ...)
{
  return _[a1 scrollerSize];
}

id objc_msgSend_scrollingBlockedOnElementRefresh(void *a1, const char *a2, ...)
{
  return _[a1 scrollingBlockedOnElementRefresh];
}

id objc_msgSend_scrollingSpeedFactorForOrientedPoint_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "scrollingSpeedFactorForOrientedPoint:");
}

id objc_msgSend_search(void *a1, const char *a2, ...)
{
  return _[a1 search];
}

id objc_msgSend_searchResult(void *a1, const char *a2, ...)
{
  return _[a1 searchResult];
}

id objc_msgSend_searchResults(void *a1, const char *a2, ...)
{
  return _[a1 searchResults];
}

id objc_msgSend_secondaryButton(void *a1, const char *a2, ...)
{
  return _[a1 secondaryButton];
}

id objc_msgSend_selectActionHandler(void *a1, const char *a2, ...)
{
  return _[a1 selectActionHandler];
}

id objc_msgSend_selectAndResumeAutoscanningActionHandler(void *a1, const char *a2, ...)
{
  return _[a1 selectAndResumeAutoscanningActionHandler];
}

id objc_msgSend_selectBehavior(void *a1, const char *a2, ...)
{
  return _[a1 selectBehavior];
}

id objc_msgSend_selectButton(void *a1, const char *a2, ...)
{
  return _[a1 selectButton];
}

id objc_msgSend_selectElement_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "selectElement:");
}

id objc_msgSend_selectElementAtPoint_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "selectElementAtPoint:");
}

id objc_msgSend_selectSearchResult_settings_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "selectSearchResult:settings:");
}

id objc_msgSend_selectWordOrNoneItem(void *a1, const char *a2, ...)
{
  return _[a1 selectWordOrNoneItem];
}

id objc_msgSend_selected(void *a1, const char *a2, ...)
{
  return _[a1 selected];
}

id objc_msgSend_selectedTextRange(void *a1, const char *a2, ...)
{
  return _[a1 selectedTextRange];
}

id objc_msgSend_selectionForLanguage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "selectionForLanguage:");
}

id objc_msgSend_selectionModeOn(void *a1, const char *a2, ...)
{
  return _[a1 selectionModeOn];
}

id objc_msgSend_selectionModeToggleItem(void *a1, const char *a2, ...)
{
  return _[a1 selectionModeToggleItem];
}

id objc_msgSend_selectionPath(void *a1, const char *a2, ...)
{
  return _[a1 selectionPath];
}

id objc_msgSend_sendActionsForControlEvents_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendActionsForControlEvents:");
}

id objc_msgSend_sendAsynchronousMessage_withIdentifier_targetAccessQueue_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendAsynchronousMessage:withIdentifier:targetAccessQueue:completion:");
}

id objc_msgSend_sendHIDSystemEvent_senderID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendHIDSystemEvent:senderID:");
}

id objc_msgSend_server(void *a1, const char *a2, ...)
{
  return _[a1 server];
}

id objc_msgSend_serverInstance(void *a1, const char *a2, ...)
{
  return _[a1 serverInstance];
}

id objc_msgSend_set(void *a1, const char *a2, ...)
{
  return _[a1 set];
}

id objc_msgSend_setAXAttribute_withString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAXAttribute:withString:");
}

id objc_msgSend_setAccessibilityEventInputSource_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAccessibilityEventInputSource:");
}

id objc_msgSend_setAccessibilityEventUsage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAccessibilityEventUsage:");
}

id objc_msgSend_setAccessibilityEventUsagePage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAccessibilityEventUsagePage:");
}

id objc_msgSend_setAccessibilityIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAccessibilityIdentifier:");
}

id objc_msgSend_setAccessibilityIgnoresInvertColors_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAccessibilityIgnoresInvertColors:");
}

id objc_msgSend_setAccessibilityLabel_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAccessibilityLabel:");
}

id objc_msgSend_setAccessibilityObservers_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAccessibilityObservers:");
}

id objc_msgSend_setAccessibilityTraits_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAccessibilityTraits:");
}

id objc_msgSend_setAction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAction:");
}

id objc_msgSend_setActionCount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setActionCount:");
}

id objc_msgSend_setActionIdentifiersToRecipeMappingIndices_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setActionIdentifiersToRecipeMappingIndices:");
}

id objc_msgSend_setActionOverride_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setActionOverride:");
}

id objc_msgSend_setActionReceiver_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setActionReceiver:");
}

id objc_msgSend_setActionToStop_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setActionToStop:");
}

id objc_msgSend_setActionType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setActionType:");
}

id objc_msgSend_setActions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setActions:");
}

id objc_msgSend_setActivateActionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setActivateActionHandler:");
}

id objc_msgSend_setActivateBehavior_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setActivateBehavior:");
}

id objc_msgSend_setActivateHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setActivateHandler:");
}

id objc_msgSend_setActive_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setActive:");
}

id objc_msgSend_setActive_withOptions_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setActive:withOptions:error:");
}

id objc_msgSend_setActiveContinuousScroller_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setActiveContinuousScroller:");
}

id objc_msgSend_setActiveElementManager_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setActiveElementManager:");
}

id objc_msgSend_setActiveElementManager_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setActiveElementManager:completion:");
}

id objc_msgSend_setActiveScannerDriver_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setActiveScannerDriver:");
}

id objc_msgSend_setActivityIndicatorView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setActivityIndicatorView:");
}

id objc_msgSend_setAdjustsFontForContentSizeCategory_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAdjustsFontForContentSizeCategory:");
}

id objc_msgSend_setAdjustsFontSizeToFitWidth_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAdjustsFontSizeToFitWidth:");
}

id objc_msgSend_setAlignment_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAlignment:");
}

id objc_msgSend_setAllowsContinuousInteraction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAllowsContinuousInteraction:");
}

id objc_msgSend_setAllowsDwellScanningToAbortAfterTimeout_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAllowsDwellScanningToAbortAfterTimeout:");
}

id objc_msgSend_setAllowsGroupBlending_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAllowsGroupBlending:");
}

id objc_msgSend_setAllowsGroupOpacity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAllowsGroupOpacity:");
}

id objc_msgSend_setAlpha_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAlpha:");
}

id objc_msgSend_setAlternateKeys_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAlternateKeys:");
}

id objc_msgSend_setAlternateKeysManager_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAlternateKeysManager:");
}

id objc_msgSend_setAlwaysShowMenu_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAlwaysShowMenu:");
}

id objc_msgSend_setAngle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAngle:");
}

id objc_msgSend_setAnimationKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAnimationKey:");
}

id objc_msgSend_setAnimationsEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAnimationsEnabled:");
}

id objc_msgSend_setAppleTVRemote_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAppleTVRemote:");
}

id objc_msgSend_setAppleTVRemoteViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAppleTVRemoteViewController:");
}

id objc_msgSend_setAreFingersPressed_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAreFingersPressed:");
}

id objc_msgSend_setArrowView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setArrowView:");
}

id objc_msgSend_setAssistiveTouchActionRepeatEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAssistiveTouchActionRepeatEnabled:");
}

id objc_msgSend_setAssistiveTouchActionRepeatInterval_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAssistiveTouchActionRepeatInterval:");
}

id objc_msgSend_setAssistiveTouchDelayAfterInput_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAssistiveTouchDelayAfterInput:");
}

id objc_msgSend_setAssistiveTouchDelayAfterInputEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAssistiveTouchDelayAfterInputEnabled:");
}

id objc_msgSend_setAssistiveTouchGroupElementsEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAssistiveTouchGroupElementsEnabled:");
}

id objc_msgSend_setAssistiveTouchInputCoalescingDuration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAssistiveTouchInputCoalescingDuration:");
}

id objc_msgSend_setAssistiveTouchInputCoalescingEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAssistiveTouchInputCoalescingEnabled:");
}

id objc_msgSend_setAssistiveTouchInputHoldDuration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAssistiveTouchInputHoldDuration:");
}

id objc_msgSend_setAssistiveTouchInputHoldEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAssistiveTouchInputHoldEnabled:");
}

id objc_msgSend_setAssistiveTouchLongPressDuration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAssistiveTouchLongPressDuration:");
}

id objc_msgSend_setAssistiveTouchLongPressEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAssistiveTouchLongPressEnabled:");
}

id objc_msgSend_setAssistiveTouchPreferredPointPicker_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAssistiveTouchPreferredPointPicker:");
}

id objc_msgSend_setAssistiveTouchRecentGestures_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAssistiveTouchRecentGestures:");
}

id objc_msgSend_setAssistiveTouchSavedGestures_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAssistiveTouchSavedGestures:");
}

id objc_msgSend_setAssistiveTouchScanCycles_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAssistiveTouchScanCycles:");
}

id objc_msgSend_setAssistiveTouchScanTimeout_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAssistiveTouchScanTimeout:");
}

id objc_msgSend_setAssistiveTouchScannerCursorHighVisibilityEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAssistiveTouchScannerCursorHighVisibilityEnabled:");
}

id objc_msgSend_setAssistiveTouchScannerSoundEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAssistiveTouchScannerSoundEnabled:");
}

id objc_msgSend_setAssistiveTouchScannerSpeechEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAssistiveTouchScannerSpeechEnabled:");
}

id objc_msgSend_setAssistiveTouchScanningMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAssistiveTouchScanningMode:");
}

id objc_msgSend_setAssistiveTouchStepInterval_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAssistiveTouchStepInterval:");
}

id objc_msgSend_setAssistiveTouchSwitchUsageConfirmed_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAssistiveTouchSwitchUsageConfirmed:");
}

id objc_msgSend_setAssistiveTouchSwitches_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAssistiveTouchSwitches:");
}

id objc_msgSend_setAssistiveTouchUsageCount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAssistiveTouchUsageCount:");
}

id objc_msgSend_setAttributedText_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAttributedText:");
}

id objc_msgSend_setAtvRemoteInputSource_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAtvRemoteInputSource:");
}

id objc_msgSend_setAudioSessionCategory_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAudioSessionCategory:");
}

id objc_msgSend_setAudioSessionCategoryOptions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAudioSessionCategoryOptions:");
}

id objc_msgSend_setAutoHideTimeout_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAutoHideTimeout:");
}

id objc_msgSend_setAutoScanningDriver_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAutoScanningDriver:");
}

id objc_msgSend_setAutoScanningInterval_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAutoScanningInterval:");
}

id objc_msgSend_setAutoTapTimeout_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAutoTapTimeout:");
}

id objc_msgSend_setAutomaticallyCancelPendingBlockUponSchedulingNewBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAutomaticallyCancelPendingBlockUponSchedulingNewBlock:");
}

id objc_msgSend_setAutoresizesSubviews_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAutoresizesSubviews:");
}

id objc_msgSend_setAutoresizingMask_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAutoresizingMask:");
}

id objc_msgSend_setAutoscrollSpeed_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAutoscrollSpeed:");
}

id objc_msgSend_setAutoscrollTarget_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAutoscrollTarget:");
}

id objc_msgSend_setAutoscroller_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAutoscroller:");
}

id objc_msgSend_setAuxiliaryElementManagers_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAuxiliaryElementManagers:");
}

id objc_msgSend_setAvailabilityDetail_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAvailabilityDetail:");
}

id objc_msgSend_setAvailable_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAvailable:");
}

id objc_msgSend_setAvailableButtons_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAvailableButtons:");
}

id objc_msgSend_setAxManager_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAxManager:");
}

id objc_msgSend_setAxOrbPreviewWindow_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAxOrbPreviewWindow:");
}

id objc_msgSend_setAxis_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAxis:");
}

id objc_msgSend_setAxisContainerView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAxisContainerView:");
}

id objc_msgSend_setBackButtonConstraints_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBackButtonConstraints:");
}

id objc_msgSend_setBackdropMaskImage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBackdropMaskImage:");
}

id objc_msgSend_setBackgroundBorderImageView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBackgroundBorderImageView:");
}

id objc_msgSend_setBackgroundColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBackgroundColor:");
}

id objc_msgSend_setBackgroundImageView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBackgroundImageView:");
}

id objc_msgSend_setBackgroundView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBackgroundView:");
}

id objc_msgSend_setBaselineAdjustment_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBaselineAdjustment:");
}

id objc_msgSend_setBeginScanningTimer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBeginScanningTimer:");
}

id objc_msgSend_setBeginTime_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBeginTime:");
}

id objc_msgSend_setBoolValue_forSetting_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBoolValue:forSetting:");
}

id objc_msgSend_setBorderColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBorderColor:");
}

id objc_msgSend_setBorderLayer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBorderLayer:");
}

id objc_msgSend_setBorderWidth_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBorderWidth:");
}

id objc_msgSend_setBounds_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBounds:");
}

id objc_msgSend_setBoundsInset_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBoundsInset:");
}

id objc_msgSend_setButton_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setButton:");
}

id objc_msgSend_setButtonDownStartTime_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setButtonDownStartTime:");
}

id objc_msgSend_setButtonNumber_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setButtonNumber:");
}

id objc_msgSend_setCandidateBarManager_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCandidateBarManager:");
}

id objc_msgSend_setCaptureEvents_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCaptureEvents:");
}

id objc_msgSend_setCategory_withOptions_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCategory:withOptions:error:");
}

id objc_msgSend_setCenter_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCenter:");
}

id objc_msgSend_setCenterPointVisible_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCenterPointVisible:");
}

id objc_msgSend_setClipsToBounds_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setClipsToBounds:");
}

id objc_msgSend_setClockwise_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setClockwise:");
}

id objc_msgSend_setCollectionViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCollectionViewController:");
}

id objc_msgSend_setCollectionViewLayout_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCollectionViewLayout:");
}

id objc_msgSend_setColorTintMaskImage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setColorTintMaskImage:");
}

id objc_msgSend_setCompletionCallback_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCompletionCallback:");
}

id objc_msgSend_setCompositingFilter_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCompositingFilter:");
}

id objc_msgSend_setCompositingLayer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCompositingLayer:");
}

id objc_msgSend_setConfirmationSheet_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setConfirmationSheet:");
}

id objc_msgSend_setConnectionListener_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setConnectionListener:");
}

id objc_msgSend_setConstant_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setConstant:");
}

id objc_msgSend_setContainerView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContainerView:");
}

id objc_msgSend_setContainingGroupCursorController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContainingGroupCursorController:");
}

id objc_msgSend_setContainingGroupFocusedBackgroundImage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContainingGroupFocusedBackgroundImage:");
}

id objc_msgSend_setContentCompressionResistancePriority_forAxis_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContentCompressionResistancePriority:forAxis:");
}

id objc_msgSend_setContentHuggingPriority_forAxis_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContentHuggingPriority:forAxis:");
}

id objc_msgSend_setContentMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContentMode:");
}

id objc_msgSend_setContentOffset_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContentOffset:");
}

id objc_msgSend_setContentView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContentView:");
}

id objc_msgSend_setContentViewConstraints_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContentViewConstraints:");
}

id objc_msgSend_setContentViewContainer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContentViewContainer:");
}

id objc_msgSend_setContextElement_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContextElement:");
}

id objc_msgSend_setContextIDs_forHitTestContextCategory_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContextIDs:forHitTestContextCategory:");
}

id objc_msgSend_setContinueHighlightAfterTouch_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContinueHighlightAfterTouch:");
}

id objc_msgSend_setContinuousScrollCurrentSpeedFactor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContinuousScrollCurrentSpeedFactor:");
}

id objc_msgSend_setContinuousScrollMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContinuousScrollMode:");
}

id objc_msgSend_setContinuousScrollPickedElement_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContinuousScrollPickedElement:");
}

id objc_msgSend_setContinuousScrollerGenerationQueue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContinuousScrollerGenerationQueue:");
}

id objc_msgSend_setControlDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setControlDelegate:");
}

id objc_msgSend_setCornerCurve_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCornerCurve:");
}

id objc_msgSend_setCornerRadius_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCornerRadius:");
}

id objc_msgSend_setCurrentAction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCurrentAction:");
}

id objc_msgSend_setCurrentApplications_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCurrentApplications:");
}

id objc_msgSend_setCurrentAuxiliaryElementManager_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCurrentAuxiliaryElementManager:");
}

id objc_msgSend_setCurrentContinuousScrollDirection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCurrentContinuousScrollDirection:");
}

id objc_msgSend_setCurrentCycleCount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCurrentCycleCount:");
}

id objc_msgSend_setCurrentDisplayContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCurrentDisplayContext:");
}

id objc_msgSend_setCurrentDisplayID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCurrentDisplayID:");
}

id objc_msgSend_setCurrentFocusContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCurrentFocusContext:");
}

id objc_msgSend_setCurrentHoldPoint_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCurrentHoldPoint:");
}

id objc_msgSend_setCurrentKeyForAlternates_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCurrentKeyForAlternates:");
}

id objc_msgSend_setCurrentPage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCurrentPage:");
}

id objc_msgSend_setCurrentPageIndicatorTintColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCurrentPageIndicatorTintColor:");
}

id objc_msgSend_setCurrentRecipe_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCurrentRecipe:");
}

id objc_msgSend_setCurrentSelectionPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCurrentSelectionPath:");
}

id objc_msgSend_setCurrentSheet_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCurrentSheet:");
}

id objc_msgSend_setCurrentSpeechFocusContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCurrentSpeechFocusContext:");
}

id objc_msgSend_setCurrentSwitchController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCurrentSwitchController:");
}

id objc_msgSend_setCurrentXDisplacement_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCurrentXDisplacement:");
}

id objc_msgSend_setCurrentYDisplacement_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCurrentYDisplacement:");
}

id objc_msgSend_setCurrentlyObservingNotifications_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCurrentlyObservingNotifications:");
}

id objc_msgSend_setCurrentlyTappingAndHolding_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCurrentlyTappingAndHolding:");
}

id objc_msgSend_setCursorBackgroundLayer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCursorBackgroundLayer:");
}

id objc_msgSend_setCursorCompositingLayer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCursorCompositingLayer:");
}

id objc_msgSend_setCursorContainerLayer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCursorContainerLayer:");
}

id objc_msgSend_setCursorForegroundLayer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCursorForegroundLayer:");
}

id objc_msgSend_setCursorManager_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCursorManager:");
}

id objc_msgSend_setCursorSizes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCursorSizes:");
}

id objc_msgSend_setCursorUIHidden_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCursorUIHidden:");
}

id objc_msgSend_setCurvature_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCurvature:");
}

id objc_msgSend_setCustomGesture_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCustomGesture:");
}

id objc_msgSend_setCustomGestures_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCustomGestures:");
}

id objc_msgSend_setCustomTitle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCustomTitle:");
}

id objc_msgSend_setDataSource_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDataSource:");
}

id objc_msgSend_setDebugBuild_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDebugBuild:");
}

id objc_msgSend_setDecreaseVolumeFocusedBackgroundImage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDecreaseVolumeFocusedBackgroundImage:");
}

id objc_msgSend_setDecreaseVolumeViewInternal_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDecreaseVolumeViewInternal:");
}

id objc_msgSend_setDefaultBackgroundImage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDefaultBackgroundImage:");
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDelegate:");
}

id objc_msgSend_setDelegate_queue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDelegate:queue:");
}

id objc_msgSend_setDeltaX_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDeltaX:");
}

id objc_msgSend_setDeltaY_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDeltaY:");
}

id objc_msgSend_setDetectDevices_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDetectDevices:");
}

id objc_msgSend_setDidActivate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDidActivate:");
}

id objc_msgSend_setDidActivateElement_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDidActivateElement:");
}

id objc_msgSend_setDidPauseForReasonsToDisableScanning_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDidPauseForReasonsToDisableScanning:");
}

id objc_msgSend_setDidSetFocusContextForResume_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDidSetFocusContextForResume:");
}

id objc_msgSend_setDimmedBackgroundImage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDimmedBackgroundImage:");
}

id objc_msgSend_setDimmedBorderImage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDimmedBorderImage:");
}

id objc_msgSend_setDimmedIconImage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDimmedIconImage:");
}

id objc_msgSend_setDisableActions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDisableActions:");
}

id objc_msgSend_setDisableDashBoardGesturesAssertion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDisableDashBoardGesturesAssertion:");
}

id objc_msgSend_setDisableIdleTimerAssertion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDisableIdleTimerAssertion:");
}

id objc_msgSend_setDisableSystemGesturesAssertion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDisableSystemGesturesAssertion:");
}

id objc_msgSend_setDisableUpdateMask_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDisableUpdateMask:");
}

id objc_msgSend_setDisabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDisabled:");
}

id objc_msgSend_setDisplayManager_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDisplayManager:");
}

id objc_msgSend_setDisplaySourceDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDisplaySourceDelegate:");
}

id objc_msgSend_setDistance_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDistance:");
}

id objc_msgSend_setDockPosition_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDockPosition:");
}

id objc_msgSend_setDockStyleAttributes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDockStyleAttributes:");
}

id objc_msgSend_setDownArrowButton_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDownArrowButton:");
}

id objc_msgSend_setDownBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDownBlock:");
}

id objc_msgSend_setDuckScalarForVoiceOver_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDuckScalarForVoiceOver:");
}

id objc_msgSend_setDuckToLevelScalar_unduckToLevelScalar_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDuckToLevelScalar:unduckToLevelScalar:error:");
}

id objc_msgSend_setDuration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDuration:");
}

id objc_msgSend_setDwellDuration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDwellDuration:");
}

id objc_msgSend_setDwellScanningDriver_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDwellScanningDriver:");
}

id objc_msgSend_setElement_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setElement:");
}

id objc_msgSend_setElementCommunityGroup_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setElementCommunityGroup:");
}

id objc_msgSend_setElementFetchQueueTimer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setElementFetchQueueTimer:");
}

id objc_msgSend_setElementFetcher_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setElementFetcher:");
}

id objc_msgSend_setElementFinderTimer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setElementFinderTimer:");
}

id objc_msgSend_setElementGroupingHeuristics_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setElementGroupingHeuristics:");
}

id objc_msgSend_setElementManager_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setElementManager:");
}

id objc_msgSend_setElementNavController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setElementNavController:");
}

id objc_msgSend_setElementProvider_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setElementProvider:");
}

id objc_msgSend_setElementProviderDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setElementProviderDelegate:");
}

id objc_msgSend_setElements_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setElements:");
}

id objc_msgSend_setElementsToScroll_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setElementsToScroll:");
}

id objc_msgSend_setEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEnabled:");
}

id objc_msgSend_setEndPointForLineGesture_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEndPointForLineGesture:");
}

id objc_msgSend_setEventHandlers_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEventHandlers:");
}

id objc_msgSend_setEventProcessor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEventProcessor:");
}

id objc_msgSend_setFallbackActionBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFallbackActionBlock:");
}

id objc_msgSend_setFallbackScrollDownAncestor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFallbackScrollDownAncestor:");
}

id objc_msgSend_setFallbackScrollLeftAncestor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFallbackScrollLeftAncestor:");
}

id objc_msgSend_setFallbackScrollRightAncestor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFallbackScrollRightAncestor:");
}

id objc_msgSend_setFallbackScrollUpAncestor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFallbackScrollUpAncestor:");
}

id objc_msgSend_setFill(void *a1, const char *a2, ...)
{
  return _[a1 setFill];
}

id objc_msgSend_setFillColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFillColor:");
}

id objc_msgSend_setFillMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFillMode:");
}

id objc_msgSend_setFillRule_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFillRule:");
}

id objc_msgSend_setFilterMaskImage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFilterMaskImage:");
}

id objc_msgSend_setFingerContentViewIsActive_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFingerContentViewIsActive:");
}

id objc_msgSend_setFingerPositions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFingerPositions:");
}

id objc_msgSend_setFingersHighlighted_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFingersHighlighted:");
}

id objc_msgSend_setFingersPressed_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFingersPressed:");
}

id objc_msgSend_setFirstInSequence_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFirstInSequence:");
}

id objc_msgSend_setFirstResponder_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFirstResponder:");
}

id objc_msgSend_setFocusContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFocusContext:");
}

id objc_msgSend_setFocusContextForResume_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFocusContextForResume:");
}

id objc_msgSend_setFocusTimer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFocusTimer:");
}

id objc_msgSend_setFocused_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFocused:");
}

id objc_msgSend_setFocusedBackgroundImage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFocusedBackgroundImage:");
}

id objc_msgSend_setFocusedItemCursorController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFocusedItemCursorController:");
}

id objc_msgSend_setFont_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFont:");
}

id objc_msgSend_setFontMetrics_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFontMetrics:");
}

id objc_msgSend_setFooterView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFooterView:");
}

id objc_msgSend_setForceDisableScreenLock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setForceDisableScreenLock:");
}

id objc_msgSend_setForcePause_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setForcePause:");
}

id objc_msgSend_setForegroundLayer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setForegroundLayer:");
}

id objc_msgSend_setForwardDirection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setForwardDirection:");
}

id objc_msgSend_setFrame_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFrame:");
}

id objc_msgSend_setFrameForToolbar_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFrameForToolbar:");
}

id objc_msgSend_setFromValue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFromValue:");
}

id objc_msgSend_setFullMenuVisible_atPoint_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFullMenuVisible:atPoint:");
}

id objc_msgSend_setGamepadInputSource_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setGamepadInputSource:");
}

id objc_msgSend_setGeneralTimer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setGeneralTimer:");
}

id objc_msgSend_setGestureDrawingView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setGestureDrawingView:");
}

id objc_msgSend_setGestureProvider_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setGestureProvider:");
}

id objc_msgSend_setGesturesButton_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setGesturesButton:");
}

id objc_msgSend_setGlyphImage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setGlyphImage:");
}

id objc_msgSend_setGlyphImageView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setGlyphImageView:");
}

id objc_msgSend_setGrayscaleTintMaskImage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setGrayscaleTintMaskImage:");
}

id objc_msgSend_setGroupVisualScrollersAuxElementManager_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setGroupVisualScrollersAuxElementManager:");
}

id objc_msgSend_setGroupVisualScrollersEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setGroupVisualScrollersEnabled:");
}

id objc_msgSend_setGroupingEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setGroupingEnabled:");
}

id objc_msgSend_setHIDEventFilterMask_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHIDEventFilterMask:");
}

id objc_msgSend_setHIDEventHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHIDEventHandler:");
}

id objc_msgSend_setHandManager_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHandManager:");
}

id objc_msgSend_setHandlerWithTarget_selector_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHandlerWithTarget:selector:forKey:");
}

id objc_msgSend_setHandlerWithTarget_selector_forKey_possibleRequiredEntitlements_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:");
}

id objc_msgSend_setHardwareIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHardwareIdentifier:");
}

id objc_msgSend_setHardwareItems_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHardwareItems:");
}

id objc_msgSend_setHasActivatedScrollSinceContextUpdate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHasActivatedScrollSinceContextUpdate:");
}

id objc_msgSend_setHasLocalizableName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHasLocalizableName:");
}

id objc_msgSend_setHidManager_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHidManager:");
}

id objc_msgSend_setHidden_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHidden:");
}

id objc_msgSend_setHidesForSinglePage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHidesForSinglePage:");
}

id objc_msgSend_setHighVisBackgroundAndIconImage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHighVisBackgroundAndIconImage:");
}

id objc_msgSend_setHighlighted_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHighlighted:");
}

id objc_msgSend_setHighlightedTextColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHighlightedTextColor:");
}

id objc_msgSend_setHitTestCategoryAssertion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHitTestCategoryAssertion:");
}

id objc_msgSend_setHoldDuration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHoldDuration:");
}

id objc_msgSend_setHomeButton_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHomeButton:");
}

id objc_msgSend_setHorizontalContinuousScrollers_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHorizontalContinuousScrollers:");
}

id objc_msgSend_setHorizontalScroller_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHorizontalScroller:");
}

id objc_msgSend_setHudView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHudView:");
}

id objc_msgSend_setHyphenationFactor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHyphenationFactor:");
}

id objc_msgSend_setIconImage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIconImage:");
}

id objc_msgSend_setIconImageAngle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIconImageAngle:");
}

id objc_msgSend_setIconImageView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIconImageView:");
}

id objc_msgSend_setIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIdentifier:");
}

id objc_msgSend_setIgnoreRepeatDuration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIgnoreRepeatDuration:");
}

id objc_msgSend_setIgnoringInputs_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIgnoringInputs:");
}

id objc_msgSend_setImage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setImage:");
}

id objc_msgSend_setImageName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setImageName:");
}

id objc_msgSend_setImagePrefixForTouchDependentGlyph_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setImagePrefixForTouchDependentGlyph:");
}

id objc_msgSend_setImageView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setImageView:");
}

id objc_msgSend_setInactiveAlpha_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInactiveAlpha:");
}

id objc_msgSend_setIncreaseVolumeFocusedBackgroundImage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIncreaseVolumeFocusedBackgroundImage:");
}

id objc_msgSend_setIncreaseVolumeViewInternal_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIncreaseVolumeViewInternal:");
}

id objc_msgSend_setInitialItems_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInitialItems:");
}

id objc_msgSend_setInitialized_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInitialized:");
}

id objc_msgSend_setInputController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInputController:");
}

id objc_msgSend_setInputHoldTimer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInputHoldTimer:");
}

id objc_msgSend_setInputRepeatTimer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInputRepeatTimer:");
}

id objc_msgSend_setInterDeviceInputSource_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInterDeviceInputSource:");
}

id objc_msgSend_setIsAccessibilityElement_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsAccessibilityElement:");
}

id objc_msgSend_setIsActivelyScrollingContinuously_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsActivelyScrollingContinuously:");
}

id objc_msgSend_setIsBackButton_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsBackButton:");
}

id objc_msgSend_setIsControlArrow_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsControlArrow:");
}

id objc_msgSend_setIsCurving_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsCurving:");
}

id objc_msgSend_setIsDark_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsDark:");
}

id objc_msgSend_setIsEmptyFavorite_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsEmptyFavorite:");
}

id objc_msgSend_setIsFlashing_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsFlashing:");
}

id objc_msgSend_setIsGamepadEvent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsGamepadEvent:");
}

id objc_msgSend_setIsInputCoalesceEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsInputCoalesceEnabled:");
}

id objc_msgSend_setIsInputHoldEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsInputHoldEnabled:");
}

id objc_msgSend_setIsInputRepeatEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsInputRepeatEnabled:");
}

id objc_msgSend_setIsMainDisplay_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsMainDisplay:");
}

id objc_msgSend_setIsModalDown_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsModalDown:");
}

id objc_msgSend_setIsPausingScanning_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsPausingScanning:");
}

id objc_msgSend_setIsPendingFingerLiftForPrimaryButtonPressUp_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsPendingFingerLiftForPrimaryButtonPressUp:");
}

id objc_msgSend_setIsPinching_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsPinching:");
}

id objc_msgSend_setIsPoppingToPreviousViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsPoppingToPreviousViewController:");
}

id objc_msgSend_setIsPushingConfirmationSheet_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsPushingConfirmationSheet:");
}

id objc_msgSend_setIsReadyForSelect_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsReadyForSelect:");
}

id objc_msgSend_setIsRotating_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsRotating:");
}

id objc_msgSend_setIsVisible_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsVisible:");
}

id objc_msgSend_setIsWaitingToBePresented_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsWaitingToBePresented:");
}

id objc_msgSend_setItem_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setItem:");
}

id objc_msgSend_setItemMenuState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setItemMenuState:");
}

id objc_msgSend_setItemSpacingLandscape_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setItemSpacingLandscape:");
}

id objc_msgSend_setItemSpacingPortrait_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setItemSpacingPortrait:");
}

id objc_msgSend_setKeyboardIndexPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setKeyboardIndexPath:");
}

id objc_msgSend_setKeyboardInputSource_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setKeyboardInputSource:");
}

id objc_msgSend_setKeyboardKeyCenterPoint_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setKeyboardKeyCenterPoint:");
}

id objc_msgSend_setKeyboardSelectBehavior_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setKeyboardSelectBehavior:");
}

id objc_msgSend_setLabel_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLabel:");
}

id objc_msgSend_setLanguage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLanguage:");
}

id objc_msgSend_setLastAppTransitionTime_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLastAppTransitionTime:");
}

id objc_msgSend_setLastMenuItemActivated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLastMenuItemActivated:");
}

id objc_msgSend_setLastScannedElementCommunity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLastScannedElementCommunity:");
}

id objc_msgSend_setLastSetOptions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLastSetOptions:");
}

id objc_msgSend_setLastTimeElementFetcherRefreshed_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLastTimeElementFetcherRefreshed:");
}

id objc_msgSend_setLeftArrowButton_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLeftArrowButton:");
}

id objc_msgSend_setLevel_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLevel:");
}

id objc_msgSend_setLiftsOnMoveEnd_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLiftsOnMoveEnd:");
}

id objc_msgSend_setLineBreakMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLineBreakMode:");
}

id objc_msgSend_setLineCap_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLineCap:");
}

id objc_msgSend_setLineColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLineColor:");
}

id objc_msgSend_setLineDashPattern_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLineDashPattern:");
}

id objc_msgSend_setLineGestureState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLineGestureState:");
}

id objc_msgSend_setLineGestureType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLineGestureType:");
}

id objc_msgSend_setLineJoin_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLineJoin:");
}

id objc_msgSend_setLineLayer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLineLayer:");
}

id objc_msgSend_setLineThickness_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLineThickness:");
}

id objc_msgSend_setLineWidth_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLineWidth:");
}

id objc_msgSend_setLocation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLocation:");
}

id objc_msgSend_setLockedToDisplayID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLockedToDisplayID:");
}

id objc_msgSend_setLongPressAction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLongPressAction:");
}

id objc_msgSend_setLongPressActionIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLongPressActionIdentifier:");
}

id objc_msgSend_setLongPressActionIdentifiersToRecipeMappingIndices_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLongPressActionIdentifiersToRecipeMappingIndices:");
}

id objc_msgSend_setLongPressDuration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLongPressDuration:");
}

id objc_msgSend_setLongPressTimer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLongPressTimer:");
}

id objc_msgSend_setManualScanningDriver_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setManualScanningDriver:");
}

id objc_msgSend_setManufacturerName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setManufacturerName:");
}

id objc_msgSend_setMask_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMask:");
}

id objc_msgSend_setMaskView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMaskView:");
}

id objc_msgSend_setMasksToBounds_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMasksToBounds:");
}

id objc_msgSend_setMaxItemsPerRow_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMaxItemsPerRow:");
}

id objc_msgSend_setMaxRows_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMaxRows:");
}

id objc_msgSend_setMaximumContentSizeCategory_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMaximumContentSizeCategory:");
}

id objc_msgSend_setMaximumLineHeight_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMaximumLineHeight:");
}

id objc_msgSend_setMenu_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMenu:");
}

id objc_msgSend_setMenuBorderPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMenuBorderPath:");
}

id objc_msgSend_setMenuButton_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMenuButton:");
}

id objc_msgSend_setMenuElement_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMenuElement:");
}

id objc_msgSend_setMenuItem_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMenuItem:");
}

id objc_msgSend_setMenuItemCursorController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMenuItemCursorController:");
}

id objc_msgSend_setMenuItemGroupName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMenuItemGroupName:");
}

id objc_msgSend_setMenuItems_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMenuItems:");
}

id objc_msgSend_setMenuObservers_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMenuObservers:");
}

id objc_msgSend_setMenuOpeningAuxElementManager_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMenuOpeningAuxElementManager:");
}

id objc_msgSend_setMenuOpeningElement_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMenuOpeningElement:");
}

id objc_msgSend_setMenuOpeningElementEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMenuOpeningElementEnabled:");
}

id objc_msgSend_setMenuSheet_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMenuSheet:");
}

id objc_msgSend_setMenuSheetStack_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMenuSheetStack:");
}

id objc_msgSend_setMenuVisible_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMenuVisible:");
}

id objc_msgSend_setMenuVisualProvider_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMenuVisualProvider:");
}

id objc_msgSend_setMessagingCenter_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMessagingCenter:");
}

id objc_msgSend_setMfiInputSource_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMfiInputSource:");
}

id objc_msgSend_setMidiInputSource_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMidiInputSource:");
}

id objc_msgSend_setMinimumContentSizeCategory_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMinimumContentSizeCategory:");
}

id objc_msgSend_setMinimumLineHeight_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMinimumLineHeight:");
}

id objc_msgSend_setMinimumScaleFactor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMinimumScaleFactor:");
}

id objc_msgSend_setMoreItems_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMoreItems:");
}

id objc_msgSend_setMoreItemsPageControl_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMoreItemsPageControl:");
}

id objc_msgSend_setMoveTimer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMoveTimer:");
}

id objc_msgSend_setMultiTouchToolBackgroundEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMultiTouchToolBackgroundEnabled:");
}

id objc_msgSend_setName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setName:");
}

id objc_msgSend_setNativeFocus(void *a1, const char *a2, ...)
{
  return _[a1 setNativeFocus];
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

id objc_msgSend_setNormalizedHorizontalTipCenter_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNormalizedHorizontalTipCenter:");
}

id objc_msgSend_setNotificationObserver_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNotificationObserver:");
}

id objc_msgSend_setNotificationObserverQueue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNotificationObserverQueue:");
}

id objc_msgSend_setNubbitMoving_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNubbitMoving:");
}

id objc_msgSend_setNubbitVisible_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNubbitVisible:");
}

id objc_msgSend_setNumberOfColumns_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNumberOfColumns:");
}

id objc_msgSend_setNumberOfLines_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNumberOfLines:");
}

id objc_msgSend_setNumberOfPages_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNumberOfPages:");
}

id objc_msgSend_setNumberOfPresses_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNumberOfPresses:");
}

id objc_msgSend_setNumberOfScanLoops_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNumberOfScanLoops:");
}

id objc_msgSend_setObject_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObject:forKey:");
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObject:forKeyedSubscript:");
}

id objc_msgSend_setObserver_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObserver:");
}

id objc_msgSend_setOpacity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setOpacity:");
}

id objc_msgSend_setOpaque_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setOpaque:");
}

id objc_msgSend_setOpenMenuWithSwaggle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setOpenMenuWithSwaggle:");
}

id objc_msgSend_setOrientation_withCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setOrientation:withCompletion:");
}

id objc_msgSend_setOrientationLocked_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setOrientationLocked:");
}

id objc_msgSend_setOutlineColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setOutlineColor:");
}

id objc_msgSend_setOutlineThickness_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setOutlineThickness:");
}

id objc_msgSend_setOutputManager_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setOutputManager:");
}

id objc_msgSend_setOverflowFrames_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setOverflowFrames:");
}

id objc_msgSend_setOverrideProcessName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setOverrideProcessName:");
}

id objc_msgSend_setOverrideUserInterfaceStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setOverrideUserInterfaceStyle:");
}

id objc_msgSend_setPageIndicatorTintColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPageIndicatorTintColor:");
}

id objc_msgSend_setPanFingerPositions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPanFingerPositions:");
}

id objc_msgSend_setParentGroup_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setParentGroup:");
}

id objc_msgSend_setPassivelyListeningForEvents_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPassivelyListeningForEvents:");
}

id objc_msgSend_setPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPath:");
}

id objc_msgSend_setPauseOnFirstItemInterval_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPauseOnFirstItemInterval:");
}

id objc_msgSend_setPersistentSwitchIdentifiers_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPersistentSwitchIdentifiers:");
}

id objc_msgSend_setPickerPhase_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPickerPhase:");
}

id objc_msgSend_setPickerViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPickerViewController:");
}

id objc_msgSend_setPinchAngle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPinchAngle:");
}

id objc_msgSend_setPinchFingerOriginalPositions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPinchFingerOriginalPositions:");
}

id objc_msgSend_setPinchFulcrum_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPinchFulcrum:");
}

id objc_msgSend_setPinchRadius_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPinchRadius:");
}

id objc_msgSend_setPitch_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPitch:");
}

id objc_msgSend_setPlayPauseButton_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPlayPauseButton:");
}

id objc_msgSend_setPointPicker_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPointPicker:");
}

id objc_msgSend_setPopoverPosition_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPopoverPosition:");
}

id objc_msgSend_setPopoverStyleAttributes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPopoverStyleAttributes:");
}

id objc_msgSend_setPosition_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPosition:");
}

id objc_msgSend_setPositionRelativeToContextElement_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPositionRelativeToContextElement:");
}

id objc_msgSend_setPostActivationScanLocations_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPostActivationScanLocations:");
}

id objc_msgSend_setPostTransitionUpdateBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPostTransitionUpdateBlock:");
}

id objc_msgSend_setPreference_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPreference:forKey:");
}

id objc_msgSend_setPreferredFrameRateRange_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPreferredFrameRateRange:");
}

id objc_msgSend_setPreferredNumberOfTitleLines_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPreferredNumberOfTitleLines:");
}

id objc_msgSend_setPresentHUDViewTimer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPresentHUDViewTimer:");
}

id objc_msgSend_setPressed_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPressed:");
}

id objc_msgSend_setPressed_animated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPressed:animated:");
}

id objc_msgSend_setPressedBackgroundBorderImageView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPressedBackgroundBorderImageView:");
}

id objc_msgSend_setPressedBackgroundImage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPressedBackgroundImage:");
}

id objc_msgSend_setPressesOnMoveStart_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPressesOnMoveStart:");
}

id objc_msgSend_setPreviewDistance_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPreviewDistance:");
}

id objc_msgSend_setPreviousPrimaryButtonPressDownDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPreviousPrimaryButtonPressDownDate:");
}

id objc_msgSend_setPriority_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPriority:");
}

id objc_msgSend_setProductName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setProductName:");
}

id objc_msgSend_setProgress_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setProgress:");
}

id objc_msgSend_setProgressInterval_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setProgressInterval:");
}

id objc_msgSend_setPrompt_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPrompt:");
}

id objc_msgSend_setProviders_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setProviders:");
}

id objc_msgSend_setQueue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setQueue:");
}

id objc_msgSend_setReachabilityOffset_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setReachabilityOffset:");
}

id objc_msgSend_setRealPickedPoint_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRealPickedPoint:");
}

id objc_msgSend_setReasonsToDisableScanning_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setReasonsToDisableScanning:");
}

id objc_msgSend_setRecipe_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRecipe:");
}

id objc_msgSend_setRecipes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRecipes:");
}

id objc_msgSend_setRemoteControlInputSource_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRemoteControlInputSource:");
}

id objc_msgSend_setRemoteDeviceIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRemoteDeviceIdentifier:");
}

id objc_msgSend_setRemoteDeviceName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRemoteDeviceName:");
}

id objc_msgSend_setRemoteSwitchIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRemoteSwitchIdentifier:");
}

id objc_msgSend_setRemovedOnCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRemovedOnCompletion:");
}

id objc_msgSend_setRepeatActionInterval_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRepeatActionInterval:");
}

id objc_msgSend_setRestingFillColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRestingFillColor:");
}

id objc_msgSend_setRestingStrokeColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRestingStrokeColor:");
}

id objc_msgSend_setRightArrowButton_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRightArrowButton:");
}

id objc_msgSend_setRole_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRole:");
}

id objc_msgSend_setRootScannerGroup_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRootScannerGroup:");
}

id objc_msgSend_setRootViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRootViewController:");
}

id objc_msgSend_setRotate90CCWItem_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRotate90CCWItem:");
}

id objc_msgSend_setRotate90CWItem_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRotate90CWItem:");
}

id objc_msgSend_setRotate90Item_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRotate90Item:");
}

id objc_msgSend_setRotateCCWItem_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRotateCCWItem:");
}

id objc_msgSend_setRotateCWItem_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRotateCWItem:");
}

id objc_msgSend_setRotateItems_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRotateItems:");
}

id objc_msgSend_setScanningStyles_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setScanningStyles:");
}

id objc_msgSend_setScatAssistiveTechFocused_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setScatAssistiveTechFocused:");
}

id objc_msgSend_setScatAutoscrollTarget_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setScatAutoscrollTarget:");
}

id objc_msgSend_setScatAuxiliaryElementManager_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setScatAuxiliaryElementManager:");
}

id objc_msgSend_setScatElement_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setScatElement:");
}

id objc_msgSend_setScatLayer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setScatLayer:");
}

id objc_msgSend_setScatMenuItemStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setScatMenuItemStyle:");
}

id objc_msgSend_setScatSpeakableDescription_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setScatSpeakableDescription:");
}

id objc_msgSend_setScreenInputSource_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setScreenInputSource:");
}

id objc_msgSend_setScreenPoint_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setScreenPoint:");
}

id objc_msgSend_setScrollAction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setScrollAction:");
}

id objc_msgSend_setScrollDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setScrollDelegate:");
}

id objc_msgSend_setScrollDirectionToActivationFrame_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setScrollDirectionToActivationFrame:");
}

id objc_msgSend_setScrollDownView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setScrollDownView:");
}

id objc_msgSend_setScrollElement_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setScrollElement:");
}

id objc_msgSend_setScrollItems_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setScrollItems:");
}

id objc_msgSend_setScrollLeftView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setScrollLeftView:");
}

id objc_msgSend_setScrollRightView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setScrollRightView:");
}

id objc_msgSend_setScrollUpView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setScrollUpView:");
}

id objc_msgSend_setScrollViewPickerManager_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setScrollViewPickerManager:");
}

id objc_msgSend_setScrollViews_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setScrollViews:");
}

id objc_msgSend_setScrollableElement_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setScrollableElement:");
}

id objc_msgSend_setScrollerConstraints_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setScrollerConstraints:");
}

id objc_msgSend_setScrollerContainerView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setScrollerContainerView:");
}

id objc_msgSend_setScrollingBlockedOnElementRefresh_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setScrollingBlockedOnElementRefresh:");
}

id objc_msgSend_setSearchObserver_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSearchObserver:");
}

id objc_msgSend_setSearchResult_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSearchResult:");
}

id objc_msgSend_setSearchResults_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSearchResults:");
}

id objc_msgSend_setSectionInset_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSectionInset:");
}

id objc_msgSend_setSelectActionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSelectActionHandler:");
}

id objc_msgSend_setSelectAndResumeAutoscanningActionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSelectAndResumeAutoscanningActionHandler:");
}

id objc_msgSend_setSelectBehavior_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSelectBehavior:");
}

id objc_msgSend_setSelectButton_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSelectButton:");
}

id objc_msgSend_setSelectWordOrNoneItem_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSelectWordOrNoneItem:");
}

id objc_msgSend_setSelected_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSelected:");
}

id objc_msgSend_setSelectedTextRange_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSelectedTextRange:");
}

id objc_msgSend_setSelectionModeOn_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSelectionModeOn:");
}

id objc_msgSend_setSelectionModeToggleItem_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSelectionModeToggleItem:");
}

id objc_msgSend_setSerialNumber_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSerialNumber:");
}

id objc_msgSend_setServer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setServer:");
}

id objc_msgSend_setShadowColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShadowColor:");
}

id objc_msgSend_setShadowOffset_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShadowOffset:");
}

id objc_msgSend_setShape_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShape:");
}

id objc_msgSend_setSheet_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSheet:");
}

id objc_msgSend_setSheetViewControllerStack_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSheetViewControllerStack:");
}

id objc_msgSend_setShortcutIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShortcutIdentifier:");
}

id objc_msgSend_setShouldAddRealEventFlag_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShouldAddRealEventFlag:");
}

id objc_msgSend_setShouldAllowFingersForContinuousGesture_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShouldAllowFingersForContinuousGesture:");
}

id objc_msgSend_setShouldBeTrackedByZoom_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShouldBeTrackedByZoom:");
}

id objc_msgSend_setShouldClearFingerCircle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShouldClearFingerCircle:");
}

id objc_msgSend_setShouldDelayBeforePresentingHUDView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShouldDelayBeforePresentingHUDView:");
}

id objc_msgSend_setShouldDetectLanguage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShouldDetectLanguage:");
}

id objc_msgSend_setShouldFlipForRTL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShouldFlipForRTL:");
}

id objc_msgSend_setShouldForciblyHideBackButtonForAnimation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShouldForciblyHideBackButtonForAnimation:");
}

id objc_msgSend_setShouldIncludeBackItem_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShouldIncludeBackItem:");
}

id objc_msgSend_setShouldIncludeCenterPoint_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShouldIncludeCenterPoint:");
}

id objc_msgSend_setShouldIncludeNonScannerElements_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShouldIncludeNonScannerElements:");
}

id objc_msgSend_setShouldIncludeTextLabels_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShouldIncludeTextLabels:");
}

id objc_msgSend_setShouldKeepScannerAwake_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShouldKeepScannerAwake:");
}

id objc_msgSend_setShouldNotResetPointPickerRefinement_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShouldNotResetPointPickerRefinement:");
}

id objc_msgSend_setShouldPerformAtOriginalLocation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShouldPerformAtOriginalLocation:");
}

id objc_msgSend_setShouldPlayMenuSoundOnFocus_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShouldPlayMenuSoundOnFocus:");
}

id objc_msgSend_setShouldProcessEmoji_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShouldProcessEmoji:");
}

id objc_msgSend_setShouldRescanAfterFetch_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShouldRescanAfterFetch:");
}

id objc_msgSend_setShouldRescanFromTopAfterFetch_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShouldRescanFromTopAfterFetch:");
}

id objc_msgSend_setShouldResumeFromMenuDismissal_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShouldResumeFromMenuDismissal:");
}

id objc_msgSend_setShouldRotate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShouldRotate:");
}

id objc_msgSend_setShouldRoundMenuCorners_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShouldRoundMenuCorners:");
}

id objc_msgSend_setShouldScanKeyboardOnAppearance_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShouldScanKeyboardOnAppearance:");
}

id objc_msgSend_setShouldScanToNextFocusContextAfterSpeaking_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShouldScanToNextFocusContextAfterSpeaking:");
}

id objc_msgSend_setShouldStop_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShouldStop:");
}

id objc_msgSend_setShouldSuppressAudioOutput_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShouldSuppressAudioOutput:");
}

id objc_msgSend_setShouldUseActivityIndicator_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShouldUseActivityIndicator:");
}

id objc_msgSend_setShouldUseDockContentPadding_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShouldUseDockContentPadding:");
}

id objc_msgSend_setShowWithAssistiveAccess_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShowWithAssistiveAccess:");
}

id objc_msgSend_setShowWithGuidedAccess_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShowWithGuidedAccess:");
}

id objc_msgSend_setShowingFooterView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShowingFooterView:");
}

id objc_msgSend_setShowsBottomBorder_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShowsBottomBorder:");
}

id objc_msgSend_setShowsCurvatureControls_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShowsCurvatureControls:");
}

id objc_msgSend_setShowsFooter_numberOfPagesRequired_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShowsFooter:numberOfPagesRequired:");
}

id objc_msgSend_setShowsLeftBorder_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShowsLeftBorder:");
}

id objc_msgSend_setShowsRightBorder_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShowsRightBorder:");
}

id objc_msgSend_setShowsRotation90Controls_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShowsRotation90Controls:");
}

id objc_msgSend_setShowsRotationControls_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShowsRotationControls:");
}

id objc_msgSend_setShowsTopBorder_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShowsTopBorder:");
}

id objc_msgSend_setSimpleRect_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSimpleRect:");
}

id objc_msgSend_setSoundAudioSessionActive_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSoundAudioSessionActive:");
}

id objc_msgSend_setSoundEffectsEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSoundEffectsEnabled:");
}

id objc_msgSend_setSpeakScreenButton_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSpeakScreenButton:");
}

id objc_msgSend_setSpeakingRate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSpeakingRate:");
}

id objc_msgSend_setSpeechAudioSessionActive_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSpeechAudioSessionActive:");
}

id objc_msgSend_setSpeechEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSpeechEnabled:");
}

id objc_msgSend_setSpeechSource_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSpeechSource:");
}

id objc_msgSend_setSpeed_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSpeed:");
}

id objc_msgSend_setStartPoint_endPoint_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setStartPoint:endPoint:");
}

id objc_msgSend_setStartingDisplayIDForGestures_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setStartingDisplayIDForGestures:");
}

id objc_msgSend_setStartingRangeForSelection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setStartingRangeForSelection:");
}

id objc_msgSend_setStartingSceneIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setStartingSceneIdentifier:");
}

id objc_msgSend_setStartingScreenPointForGestures_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setStartingScreenPointForGestures:");
}

id objc_msgSend_setStoredMenuItems_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setStoredMenuItems:");
}

id objc_msgSend_setStoredNumberOfItemsInFirstPage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setStoredNumberOfItemsInFirstPage:");
}

id objc_msgSend_setStroke(void *a1, const char *a2, ...)
{
  return _[a1 setStroke];
}

id objc_msgSend_setStrokeColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setStrokeColor:");
}

id objc_msgSend_setStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setStyle:");
}

id objc_msgSend_setSweepCount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSweepCount:");
}

id objc_msgSend_setSweepFocusContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSweepFocusContext:");
}

id objc_msgSend_setSwitchControlAutoTapTimeout_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSwitchControlAutoTapTimeout:");
}

id objc_msgSend_setSwitchControlDwellTime_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSwitchControlDwellTime:");
}

id objc_msgSend_setSwitchControlFirstLaunchScanningMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSwitchControlFirstLaunchScanningMode:");
}

id objc_msgSend_setSwitchControlHasScreenSwitch_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSwitchControlHasScreenSwitch:");
}

id objc_msgSend_setSwitchControlIsEnabledAsReceiver_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSwitchControlIsEnabledAsReceiver:");
}

id objc_msgSend_setSwitchControlPlatformSwitchedCount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSwitchControlPlatformSwitchedCount:");
}

id objc_msgSend_setSwitchControlScanAfterTapLocation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSwitchControlScanAfterTapLocation:");
}

id objc_msgSend_setSwitchControlScanningStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSwitchControlScanningStyle:");
}

id objc_msgSend_setSwitchControlShouldDisallowUSBRestrictedMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSwitchControlShouldDisallowUSBRestrictedMode:");
}

id objc_msgSend_setSwitchControlTapBehavior_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSwitchControlTapBehavior:");
}

id objc_msgSend_setSwitchDisplayName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSwitchDisplayName:");
}

id objc_msgSend_setSwitchDisplayNames_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSwitchDisplayNames:");
}

id objc_msgSend_setTag_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTag:");
}

id objc_msgSend_setTailAngle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTailAngle:");
}

id objc_msgSend_setTailPoint_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTailPoint:");
}

id objc_msgSend_setTapBehaviors_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTapBehaviors:");
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

id objc_msgSend_setTextElement_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTextElement:");
}

id objc_msgSend_setTheme_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTheme:");
}

id objc_msgSend_setThreshold_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setThreshold:");
}

id objc_msgSend_setTimeIntervalBeforeSendAction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTimeIntervalBeforeSendAction:");
}

id objc_msgSend_setTimeIntervalBeforeSendRepeatAction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTimeIntervalBeforeSendRepeatAction:");
}

id objc_msgSend_setTimeIntervalBetweenDidSendActions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTimeIntervalBetweenDidSendActions:");
}

id objc_msgSend_setTimeIntervalSinceDidSendAction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTimeIntervalSinceDidSendAction:");
}

id objc_msgSend_setTimeOffset_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTimeOffset:");
}

id objc_msgSend_setTimeoutDuration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTimeoutDuration:");
}

id objc_msgSend_setTimingFunction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTimingFunction:");
}

id objc_msgSend_setTintColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTintColor:");
}

id objc_msgSend_setTip_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTip:");
}

id objc_msgSend_setTipObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTipObject:");
}

id objc_msgSend_setTitle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTitle:");
}

id objc_msgSend_setTitleLabel_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTitleLabel:");
}

id objc_msgSend_setToValue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setToValue:");
}

id objc_msgSend_setTopLevelVisualScrollersAuxElementManager_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTopLevelVisualScrollersAuxElementManager:");
}

id objc_msgSend_setTopLevelVisualScrollersEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTopLevelVisualScrollersEnabled:");
}

id objc_msgSend_setTouchItems_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTouchItems:");
}

id objc_msgSend_setTouchSpeed_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTouchSpeed:");
}

id objc_msgSend_setTransform_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTransform:");
}

id objc_msgSend_setTransitioning_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTransitioning:");
}

id objc_msgSend_setTransitioningToOrFromActive_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTransitioningToOrFromActive:");
}

id objc_msgSend_setTranslatesAutoresizingMaskIntoConstraints_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTranslatesAutoresizingMaskIntoConstraints:");
}

id objc_msgSend_setTriangle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTriangle:");
}

id objc_msgSend_setTriangleKnockoutLayer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTriangleKnockoutLayer:");
}

id objc_msgSend_setTriangleStrokeLayer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTriangleStrokeLayer:");
}

id objc_msgSend_setTripleClickHomeButton_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTripleClickHomeButton:");
}

id objc_msgSend_setType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setType:");
}

id objc_msgSend_setTypingCandidates_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTypingCandidates:");
}

id objc_msgSend_setUiDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUiDelegate:");
}

id objc_msgSend_setUnfocusedBackgroundImage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUnfocusedBackgroundImage:");
}

id objc_msgSend_setUpArrowButton_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUpArrowButton:");
}

id objc_msgSend_setUpBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUpBlock:");
}

id objc_msgSend_setUpdateElementVisualsCoalescer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUpdateElementVisualsCoalescer:");
}

id objc_msgSend_setUpdateHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUpdateHandler:");
}

id objc_msgSend_setUpdateVisualsSequenceDidBeginHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUpdateVisualsSequenceDidBeginHandler:");
}

id objc_msgSend_setUpdateVisualsSequenceDidFinishHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUpdateVisualsSequenceDidFinishHandler:");
}

id objc_msgSend_setUpdateVisualsSequenceInProgressHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUpdateVisualsSequenceInProgressHandler:");
}

id objc_msgSend_setUserInteractionEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUserInteractionEnabled:");
}

id objc_msgSend_setUserInterfaceClient_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUserInterfaceClient:");
}

id objc_msgSend_setUserInterfaceClientEnablers_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUserInterfaceClientEnablers:");
}

id objc_msgSend_setUsesAuxiliarySession_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUsesAuxiliarySession:");
}

id objc_msgSend_setUsesEvenOddFillRule_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUsesEvenOddFillRule:");
}

id objc_msgSend_setValid_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setValid:");
}

id objc_msgSend_setValidationTargetName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setValidationTargetName:");
}

id objc_msgSend_setValue_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setValue:forKey:");
}

id objc_msgSend_setVelocity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setVelocity:");
}

id objc_msgSend_setVersionNumber_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setVersionNumber:");
}

id objc_msgSend_setVerticalContinuousScrollers_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setVerticalContinuousScrollers:");
}

id objc_msgSend_setVerticalScroller_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setVerticalScroller:");
}

id objc_msgSend_setView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setView:");
}

id objc_msgSend_setViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setViewController:");
}

id objc_msgSend_setVisibleItemOffset_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setVisibleItemOffset:");
}

id objc_msgSend_setVisualProvider_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setVisualProvider:");
}

id objc_msgSend_setVisualsHidden_forReason_animated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setVisualsHidden:forReason:animated:");
}

id objc_msgSend_setVoiceIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setVoiceIdentifier:");
}

id objc_msgSend_setVolume_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setVolume:");
}

id objc_msgSend_setVolumeButton_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setVolumeButton:");
}

id objc_msgSend_setWasPresentedWithTip_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWasPresentedWithTip:");
}

id objc_msgSend_setWidthConstraint_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWidthConstraint:");
}

id objc_msgSend_setWillScanFirstElementAfterPresentation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWillScanFirstElementAfterPresentation:");
}

id objc_msgSend_setWindowLevel_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWindowLevel:");
}

id objc_msgSend_setWithCapacity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWithCapacity:");
}

id objc_msgSend_setWithObjects_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWithObjects:");
}

id objc_msgSend_setXAxis_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setXAxis:");
}

id objc_msgSend_setYAxis_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setYAxis:");
}

id objc_msgSend_settingsKeys(void *a1, const char *a2, ...)
{
  return _[a1 settingsKeys];
}

id objc_msgSend_setupNonSceneUI_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setupNonSceneUI:");
}

id objc_msgSend_shadowColor(void *a1, const char *a2, ...)
{
  return _[a1 shadowColor];
}

id objc_msgSend_shadowOffset(void *a1, const char *a2, ...)
{
  return _[a1 shadowOffset];
}

id objc_msgSend_shake(void *a1, const char *a2, ...)
{
  return _[a1 shake];
}

id objc_msgSend_sharedAVSystemController(void *a1, const char *a2, ...)
{
  return _[a1 sharedAVSystemController];
}

id objc_msgSend_sharedApplication(void *a1, const char *a2, ...)
{
  return _[a1 sharedApplication];
}

id objc_msgSend_sharedConnection(void *a1, const char *a2, ...)
{
  return _[a1 sharedConnection];
}

id objc_msgSend_sharedDefaults(void *a1, const char *a2, ...)
{
  return _[a1 sharedDefaults];
}

id objc_msgSend_sharedDisplayManager(void *a1, const char *a2, ...)
{
  return _[a1 sharedDisplayManager];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return _[a1 sharedInstance];
}

id objc_msgSend_sharedManager(void *a1, const char *a2, ...)
{
  return _[a1 sharedManager];
}

id objc_msgSend_sharedOutputManager(void *a1, const char *a2, ...)
{
  return _[a1 sharedOutputManager];
}

id objc_msgSend_sharedStyleProvider(void *a1, const char *a2, ...)
{
  return _[a1 sharedStyleProvider];
}

id objc_msgSend_sharedWorkspace(void *a1, const char *a2, ...)
{
  return _[a1 sharedWorkspace];
}

id objc_msgSend_sheet(void *a1, const char *a2, ...)
{
  return _[a1 sheet];
}

id objc_msgSend_sheetViewControllerStack(void *a1, const char *a2, ...)
{
  return _[a1 sheetViewControllerStack];
}

id objc_msgSend_sheetWillAppear_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sheetWillAppear:");
}

id objc_msgSend_sheetWillDisappear_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sheetWillDisappear:");
}

id objc_msgSend_shortcutIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 shortcutIdentifier];
}

id objc_msgSend_shouldAddItemSpecificMenuOptionsToMenu_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shouldAddItemSpecificMenuOptionsToMenu:");
}

id objc_msgSend_shouldAllowDwellSelection(void *a1, const char *a2, ...)
{
  return _[a1 shouldAllowDwellSelection];
}

id objc_msgSend_shouldAllowFingersForContinuousGesture(void *a1, const char *a2, ...)
{
  return _[a1 shouldAllowFingersForContinuousGesture];
}

id objc_msgSend_shouldBeTrackedByZoom(void *a1, const char *a2, ...)
{
  return _[a1 shouldBeTrackedByZoom];
}

id objc_msgSend_shouldBypassShowingMenuForElement_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shouldBypassShowingMenuForElement:");
}

id objc_msgSend_shouldCaptureEvent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shouldCaptureEvent:");
}

id objc_msgSend_shouldClearFingerCircle(void *a1, const char *a2, ...)
{
  return _[a1 shouldClearFingerCircle];
}

id objc_msgSend_shouldContinueScanning(void *a1, const char *a2, ...)
{
  return _[a1 shouldContinueScanning];
}

id objc_msgSend_shouldDeferFocusToNativeFocusElement(void *a1, const char *a2, ...)
{
  return _[a1 shouldDeferFocusToNativeFocusElement];
}

id objc_msgSend_shouldDelayBeforePresentingHUDView(void *a1, const char *a2, ...)
{
  return _[a1 shouldDelayBeforePresentingHUDView];
}

id objc_msgSend_shouldEndScanningGestureProvider_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shouldEndScanningGestureProvider:");
}

id objc_msgSend_shouldFlipForRTL(void *a1, const char *a2, ...)
{
  return _[a1 shouldFlipForRTL];
}

id objc_msgSend_shouldForwardSwitchEventsForInputSource_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shouldForwardSwitchEventsForInputSource:");
}

id objc_msgSend_shouldHideMenuCursor(void *a1, const char *a2, ...)
{
  return _[a1 shouldHideMenuCursor];
}

id objc_msgSend_shouldIncludeBackItem(void *a1, const char *a2, ...)
{
  return _[a1 shouldIncludeBackItem];
}

id objc_msgSend_shouldIncludeCenterPoint(void *a1, const char *a2, ...)
{
  return _[a1 shouldIncludeCenterPoint];
}

id objc_msgSend_shouldIncludeTextLabels(void *a1, const char *a2, ...)
{
  return _[a1 shouldIncludeTextLabels];
}

id objc_msgSend_shouldKeepScannerAwake(void *a1, const char *a2, ...)
{
  return _[a1 shouldKeepScannerAwake];
}

id objc_msgSend_shouldNotResetPointPickerRefinement(void *a1, const char *a2, ...)
{
  return _[a1 shouldNotResetPointPickerRefinement];
}

id objc_msgSend_shouldPerformAtOriginalLocation(void *a1, const char *a2, ...)
{
  return _[a1 shouldPerformAtOriginalLocation];
}

id objc_msgSend_shouldPlayMenuSoundOnFocus(void *a1, const char *a2, ...)
{
  return _[a1 shouldPlayMenuSoundOnFocus];
}

id objc_msgSend_shouldRescanAfterFetch(void *a1, const char *a2, ...)
{
  return _[a1 shouldRescanAfterFetch];
}

id objc_msgSend_shouldRescanAfterTap(void *a1, const char *a2, ...)
{
  return _[a1 shouldRescanAfterTap];
}

id objc_msgSend_shouldRescanFromTopAfterFetch(void *a1, const char *a2, ...)
{
  return _[a1 shouldRescanFromTopAfterFetch];
}

id objc_msgSend_shouldResumeFromMenuDismissal(void *a1, const char *a2, ...)
{
  return _[a1 shouldResumeFromMenuDismissal];
}

id objc_msgSend_shouldRotate(void *a1, const char *a2, ...)
{
  return _[a1 shouldRotate];
}

id objc_msgSend_shouldRoundMenuCorners(void *a1, const char *a2, ...)
{
  return _[a1 shouldRoundMenuCorners];
}

id objc_msgSend_shouldScanKeyboardOnAppearance(void *a1, const char *a2, ...)
{
  return _[a1 shouldScanKeyboardOnAppearance];
}

id objc_msgSend_shouldScanToNextFocusContextAfterSpeaking(void *a1, const char *a2, ...)
{
  return _[a1 shouldScanToNextFocusContextAfterSpeaking];
}

id objc_msgSend_shouldShowAppWideScrollActionsInMenu_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shouldShowAppWideScrollActionsInMenu:");
}

id objc_msgSend_shouldShowMenuOnFirstSelectAction(void *a1, const char *a2, ...)
{
  return _[a1 shouldShowMenuOnFirstSelectAction];
}

id objc_msgSend_shouldStartScanningGestureProvider_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shouldStartScanningGestureProvider:");
}

id objc_msgSend_shouldStop(void *a1, const char *a2, ...)
{
  return _[a1 shouldStop];
}

id objc_msgSend_shouldSuppressAudioOutput(void *a1, const char *a2, ...)
{
  return _[a1 shouldSuppressAudioOutput];
}

id objc_msgSend_shouldUpdateItemsOnOrientationChange(void *a1, const char *a2, ...)
{
  return _[a1 shouldUpdateItemsOnOrientationChange];
}

id objc_msgSend_shouldUpdateMenuItem_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shouldUpdateMenuItem:");
}

id objc_msgSend_shouldUseActivityIndicator(void *a1, const char *a2, ...)
{
  return _[a1 shouldUseActivityIndicator];
}

id objc_msgSend_shouldUseBackItemAsDoneItem(void *a1, const char *a2, ...)
{
  return _[a1 shouldUseBackItemAsDoneItem];
}

id objc_msgSend_shouldUseDockContentPadding(void *a1, const char *a2, ...)
{
  return _[a1 shouldUseDockContentPadding];
}

id objc_msgSend_showAlternateKeysForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "showAlternateKeysForKey:");
}

id objc_msgSend_showAnimated_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "showAnimated:completion:");
}

id objc_msgSend_showBannerWithText_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "showBannerWithText:");
}

id objc_msgSend_showFingerModels_animated_startPointForAnimation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "showFingerModels:animated:startPointForAnimation:");
}

id objc_msgSend_showMenu_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "showMenu:");
}

id objc_msgSend_showMenu_onDisplay_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "showMenu:onDisplay:");
}

id objc_msgSend_showMoreItemsButtonWasActivated(void *a1, const char *a2, ...)
{
  return _[a1 showMoreItemsButtonWasActivated];
}

id objc_msgSend_showMoreItemsPageControl(void *a1, const char *a2, ...)
{
  return _[a1 showMoreItemsPageControl];
}

id objc_msgSend_showNubbitPressedState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "showNubbitPressedState:");
}

id objc_msgSend_showPinchFingersAnimated_midpoint_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "showPinchFingersAnimated:midpoint:");
}

id objc_msgSend_showSimpleAlertWithText_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "showSimpleAlertWithText:");
}

id objc_msgSend_showSimpleBannerWithTitle_text_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "showSimpleBannerWithTitle:text:");
}

id objc_msgSend_showStartingFingersForGesture_animated_startPointForAnimation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "showStartingFingersForGesture:animated:startPointForAnimation:");
}

id objc_msgSend_showUIContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "showUIContext:");
}

id objc_msgSend_showVolumeBar_withProgress_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "showVolumeBar:withProgress:");
}

id objc_msgSend_showWithAssistiveAccess(void *a1, const char *a2, ...)
{
  return _[a1 showWithAssistiveAccess];
}

id objc_msgSend_showWithGuidedAccess(void *a1, const char *a2, ...)
{
  return _[a1 showWithGuidedAccess];
}

id objc_msgSend_showsBottomBorder(void *a1, const char *a2, ...)
{
  return _[a1 showsBottomBorder];
}

id objc_msgSend_showsCurvatureControls(void *a1, const char *a2, ...)
{
  return _[a1 showsCurvatureControls];
}

id objc_msgSend_showsFooter(void *a1, const char *a2, ...)
{
  return _[a1 showsFooter];
}

id objc_msgSend_showsLeftBorder(void *a1, const char *a2, ...)
{
  return _[a1 showsLeftBorder];
}

id objc_msgSend_showsRightBorder(void *a1, const char *a2, ...)
{
  return _[a1 showsRightBorder];
}

id objc_msgSend_showsRotation90Controls(void *a1, const char *a2, ...)
{
  return _[a1 showsRotation90Controls];
}

id objc_msgSend_showsRotationControls(void *a1, const char *a2, ...)
{
  return _[a1 showsRotationControls];
}

id objc_msgSend_showsTopBorder(void *a1, const char *a2, ...)
{
  return _[a1 showsTopBorder];
}

id objc_msgSend_siblingOfElement_inDirection_didWrap_options_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "siblingOfElement:inDirection:didWrap:options:");
}

id objc_msgSend_sideSwitchUsedForOrientation(void *a1, const char *a2, ...)
{
  return _[a1 sideSwitchUsedForOrientation];
}

id objc_msgSend_size(void *a1, const char *a2, ...)
{
  return _[a1 size];
}

id objc_msgSend_sizeThatFits_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sizeThatFits:");
}

id objc_msgSend_sizeThatFits_includeTip_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sizeThatFits:includeTip:");
}

id objc_msgSend_sizeToFit(void *a1, const char *a2, ...)
{
  return _[a1 sizeToFit];
}

id objc_msgSend_sizeWithAttributes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sizeWithAttributes:");
}

id objc_msgSend_sleepForTimeInterval_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sleepForTimeInterval:");
}

id objc_msgSend_slideDockToPosition_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "slideDockToPosition:");
}

id objc_msgSend_slidePopoverToPosition_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "slidePopoverToPosition:");
}

id objc_msgSend_sortMenuItemsForNumberOfItemsPerRow_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sortMenuItemsForNumberOfItemsPerRow:");
}

id objc_msgSend_sortedArrayUsingComparator_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sortedArrayUsingComparator:");
}

id objc_msgSend_soundEffectsEnabled(void *a1, const char *a2, ...)
{
  return _[a1 soundEffectsEnabled];
}

id objc_msgSend_soundIDsToAudioPlayer(void *a1, const char *a2, ...)
{
  return _[a1 soundIDsToAudioPlayer];
}

id objc_msgSend_source(void *a1, const char *a2, ...)
{
  return _[a1 source];
}

id objc_msgSend_speakScreenButton(void *a1, const char *a2, ...)
{
  return _[a1 speakScreenButton];
}

id objc_msgSend_specialToolUsageEnded_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "specialToolUsageEnded:");
}

id objc_msgSend_speechEnabled(void *a1, const char *a2, ...)
{
  return _[a1 speechEnabled];
}

id objc_msgSend_speechEnabledDidChange(void *a1, const char *a2, ...)
{
  return _[a1 speechEnabledDidChange];
}

id objc_msgSend_speechManager(void *a1, const char *a2, ...)
{
  return _[a1 speechManager];
}

id objc_msgSend_start(void *a1, const char *a2, ...)
{
  return _[a1 start];
}

id objc_msgSend_startAnimating(void *a1, const char *a2, ...)
{
  return _[a1 startAnimating];
}

id objc_msgSend_startDragModeOnDisplay_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startDragModeOnDisplay:");
}

id objc_msgSend_startPinchModeWithPoint_onDisplay_mode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startPinchModeWithPoint:onDisplay:mode:");
}

id objc_msgSend_startRunning(void *a1, const char *a2, ...)
{
  return _[a1 startRunning];
}

id objc_msgSend_startServerWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startServerWithError:");
}

id objc_msgSend_startingDisplayIDForGestures(void *a1, const char *a2, ...)
{
  return _[a1 startingDisplayIDForGestures];
}

id objc_msgSend_startingRangeForSelection(void *a1, const char *a2, ...)
{
  return _[a1 startingRangeForSelection];
}

id objc_msgSend_startingSceneIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 startingSceneIdentifier];
}

id objc_msgSend_startingScreenPointForGestures(void *a1, const char *a2, ...)
{
  return _[a1 startingScreenPointForGestures];
}

id objc_msgSend_state(void *a1, const char *a2, ...)
{
  return _[a1 state];
}

id objc_msgSend_stop(void *a1, const char *a2, ...)
{
  return _[a1 stop];
}

id objc_msgSend_stopAnimating(void *a1, const char *a2, ...)
{
  return _[a1 stopAnimating];
}

id objc_msgSend_stopForFreehandSheet_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stopForFreehandSheet:");
}

id objc_msgSend_stopIfAllowed(void *a1, const char *a2, ...)
{
  return _[a1 stopIfAllowed];
}

id objc_msgSend_stopObservingAXNotifications_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stopObservingAXNotifications:");
}

id objc_msgSend_stopRunning(void *a1, const char *a2, ...)
{
  return _[a1 stopRunning];
}

id objc_msgSend_stopServerWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stopServerWithError:");
}

id objc_msgSend_stopSpeaking_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stopSpeaking:");
}

id objc_msgSend_straightenCurveControl(void *a1, const char *a2, ...)
{
  return _[a1 straightenCurveControl];
}

id objc_msgSend_straightenForFreehandSheet_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "straightenForFreehandSheet:");
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

id objc_msgSend_stringByDeletingPathExtension(void *a1, const char *a2, ...)
{
  return _[a1 stringByDeletingPathExtension];
}

id objc_msgSend_stringByReplacingOccurrencesOfString_withString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByReplacingOccurrencesOfString:withString:");
}

id objc_msgSend_stringByTrimmingCharactersInSet_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByTrimmingCharactersInSet:");
}

id objc_msgSend_stringValue(void *a1, const char *a2, ...)
{
  return _[a1 stringValue];
}

id objc_msgSend_stringWithAXAttribute_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithAXAttribute:");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_stringWithString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithString:");
}

id objc_msgSend_stringWithUTF8String_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithUTF8String:");
}

id objc_msgSend_stroke(void *a1, const char *a2, ...)
{
  return _[a1 stroke];
}

id objc_msgSend_style(void *a1, const char *a2, ...)
{
  return _[a1 style];
}

id objc_msgSend_styleProvider(void *a1, const char *a2, ...)
{
  return _[a1 styleProvider];
}

id objc_msgSend_substantialTransitionOccurred(void *a1, const char *a2, ...)
{
  return _[a1 substantialTransitionOccurred];
}

id objc_msgSend_substantialTransitionOccurredBlock(void *a1, const char *a2, ...)
{
  return _[a1 substantialTransitionOccurredBlock];
}

id objc_msgSend_substringFromIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "substringFromIndex:");
}

id objc_msgSend_substringToIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "substringToIndex:");
}

id objc_msgSend_substringWithRange_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "substringWithRange:");
}

id objc_msgSend_subviews(void *a1, const char *a2, ...)
{
  return _[a1 subviews];
}

id objc_msgSend_superNew(void *a1, const char *a2, ...)
{
  return _[a1 superNew];
}

id objc_msgSend_superlayer(void *a1, const char *a2, ...)
{
  return _[a1 superlayer];
}

id objc_msgSend_superview(void *a1, const char *a2, ...)
{
  return _[a1 superview];
}

id objc_msgSend_supportsAction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "supportsAction:");
}

id objc_msgSend_supportsHaptics(void *a1, const char *a2, ...)
{
  return _[a1 supportsHaptics];
}

id objc_msgSend_suppressAudioOutput(void *a1, const char *a2, ...)
{
  return _[a1 suppressAudioOutput];
}

id objc_msgSend_sweepAnimationWithDirection_scatLayer_animationKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sweepAnimationWithDirection:scatLayer:animationKey:");
}

id objc_msgSend_sweepCount(void *a1, const char *a2, ...)
{
  return _[a1 sweepCount];
}

id objc_msgSend_sweepFocusContext(void *a1, const char *a2, ...)
{
  return _[a1 sweepFocusContext];
}

id objc_msgSend_switchControlAutoTapTimeout(void *a1, const char *a2, ...)
{
  return _[a1 switchControlAutoTapTimeout];
}

id objc_msgSend_switchControlDeviceMenuItems(void *a1, const char *a2, ...)
{
  return _[a1 switchControlDeviceMenuItems];
}

id objc_msgSend_switchControlDwellTime(void *a1, const char *a2, ...)
{
  return _[a1 switchControlDwellTime];
}

id objc_msgSend_switchControlFirstLaunchScanningMode(void *a1, const char *a2, ...)
{
  return _[a1 switchControlFirstLaunchScanningMode];
}

id objc_msgSend_switchControlGesturesMenuItems(void *a1, const char *a2, ...)
{
  return _[a1 switchControlGesturesMenuItems];
}

id objc_msgSend_switchControlHasEmptyTopLevelMenu(void *a1, const char *a2, ...)
{
  return _[a1 switchControlHasEmptyTopLevelMenu];
}

id objc_msgSend_switchControlIgnoreInvalidSwitchConfiguration(void *a1, const char *a2, ...)
{
  return _[a1 switchControlIgnoreInvalidSwitchConfiguration];
}

id objc_msgSend_switchControlIsEnabledAsReceiver(void *a1, const char *a2, ...)
{
  return _[a1 switchControlIsEnabledAsReceiver];
}

id objc_msgSend_switchControlLaunchRecipeUUID(void *a1, const char *a2, ...)
{
  return _[a1 switchControlLaunchRecipeUUID];
}

id objc_msgSend_switchControlMediaControlsMenuItems(void *a1, const char *a2, ...)
{
  return _[a1 switchControlMediaControlsMenuItems];
}

id objc_msgSend_switchControlPlatformSwitchedCount(void *a1, const char *a2, ...)
{
  return _[a1 switchControlPlatformSwitchedCount];
}

id objc_msgSend_switchControlPointPickerSelectionStyle(void *a1, const char *a2, ...)
{
  return _[a1 switchControlPointPickerSelectionStyle];
}

id objc_msgSend_switchControlRecipes(void *a1, const char *a2, ...)
{
  return _[a1 switchControlRecipes];
}

id objc_msgSend_switchControlRestartScanningAtCurrentKey(void *a1, const char *a2, ...)
{
  return _[a1 switchControlRestartScanningAtCurrentKey];
}

id objc_msgSend_switchControlScanAfterTapLocation(void *a1, const char *a2, ...)
{
  return _[a1 switchControlScanAfterTapLocation];
}

id objc_msgSend_switchControlScanningStyle(void *a1, const char *a2, ...)
{
  return _[a1 switchControlScanningStyle];
}

id objc_msgSend_switchControlSettingsMenuItems(void *a1, const char *a2, ...)
{
  return _[a1 switchControlSettingsMenuItems];
}

id objc_msgSend_switchControlShouldAlwaysActivateKeyboardKeys(void *a1, const char *a2, ...)
{
  return _[a1 switchControlShouldAlwaysActivateKeyboardKeys];
}

id objc_msgSend_switchControlShouldDisallowUSBRestrictedMode(void *a1, const char *a2, ...)
{
  return _[a1 switchControlShouldDisallowUSBRestrictedMode];
}

id objc_msgSend_switchControlShouldUseShortFirstPage(void *a1, const char *a2, ...)
{
  return _[a1 switchControlShouldUseShortFirstPage];
}

id objc_msgSend_switchControlTapBehavior(void *a1, const char *a2, ...)
{
  return _[a1 switchControlTapBehavior];
}

id objc_msgSend_switchControlTopLevelMenuItems(void *a1, const char *a2, ...)
{
  return _[a1 switchControlTopLevelMenuItems];
}

id objc_msgSend_switchControlUserDidReadUSBRestrictedModeAlert(void *a1, const char *a2, ...)
{
  return _[a1 switchControlUserDidReadUSBRestrictedModeAlert];
}

id objc_msgSend_switchDisplayName(void *a1, const char *a2, ...)
{
  return _[a1 switchDisplayName];
}

id objc_msgSend_switchDisplayNameForButtonNumber_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "switchDisplayNameForButtonNumber:");
}

id objc_msgSend_switchDisplayNames(void *a1, const char *a2, ...)
{
  return _[a1 switchDisplayNames];
}

id objc_msgSend_switchIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 switchIdentifier];
}

id objc_msgSend_switchKeyForSwitch_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "switchKeyForSwitch:");
}

id objc_msgSend_switchSource(void *a1, const char *a2, ...)
{
  return _[a1 switchSource];
}

id objc_msgSend_switchUUID(void *a1, const char *a2, ...)
{
  return _[a1 switchUUID];
}

id objc_msgSend_switchWithAction_name_source_type_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "switchWithAction:name:source:type:");
}

id objc_msgSend_sysdiagnoseWithMetadata_onCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sysdiagnoseWithMetadata:onCompletion:");
}

id objc_msgSend_systemAppReady(void *a1, const char *a2, ...)
{
  return _[a1 systemAppReady];
}

id objc_msgSend_systemApplication(void *a1, const char *a2, ...)
{
  return _[a1 systemApplication];
}

id objc_msgSend_systemFontOfSize_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "systemFontOfSize:");
}

id objc_msgSend_systemImageNamed_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "systemImageNamed:");
}

id objc_msgSend_systemLanguageID(void *a1, const char *a2, ...)
{
  return _[a1 systemLanguageID];
}

id objc_msgSend_systemLayoutSizeFittingSize_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "systemLayoutSizeFittingSize:");
}

id objc_msgSend_systemLongPressTVHomeButton(void *a1, const char *a2, ...)
{
  return _[a1 systemLongPressTVHomeButton];
}

id objc_msgSend_systemPressTVDownButton(void *a1, const char *a2, ...)
{
  return _[a1 systemPressTVDownButton];
}

id objc_msgSend_systemPressTVHomeButton(void *a1, const char *a2, ...)
{
  return _[a1 systemPressTVHomeButton];
}

id objc_msgSend_systemPressTVLeftButton(void *a1, const char *a2, ...)
{
  return _[a1 systemPressTVLeftButton];
}

id objc_msgSend_systemPressTVMenuButton(void *a1, const char *a2, ...)
{
  return _[a1 systemPressTVMenuButton];
}

id objc_msgSend_systemPressTVPlayPauseButton(void *a1, const char *a2, ...)
{
  return _[a1 systemPressTVPlayPauseButton];
}

id objc_msgSend_systemPressTVRightButton(void *a1, const char *a2, ...)
{
  return _[a1 systemPressTVRightButton];
}

id objc_msgSend_systemPressTVSelectButton(void *a1, const char *a2, ...)
{
  return _[a1 systemPressTVSelectButton];
}

id objc_msgSend_systemPressTVUpButton(void *a1, const char *a2, ...)
{
  return _[a1 systemPressTVUpButton];
}

id objc_msgSend_systemServerConnected(void *a1, const char *a2, ...)
{
  return _[a1 systemServerConnected];
}

id objc_msgSend_systemWideElement(void *a1, const char *a2, ...)
{
  return _[a1 systemWideElement];
}

id objc_msgSend_tag(void *a1, const char *a2, ...)
{
  return _[a1 tag];
}

id objc_msgSend_tailAngle(void *a1, const char *a2, ...)
{
  return _[a1 tailAngle];
}

id objc_msgSend_tailPoint(void *a1, const char *a2, ...)
{
  return _[a1 tailPoint];
}

id objc_msgSend_takeScreenshot(void *a1, const char *a2, ...)
{
  return _[a1 takeScreenshot];
}

id objc_msgSend_tapBehaviors(void *a1, const char *a2, ...)
{
  return _[a1 tapBehaviors];
}

id objc_msgSend_tapGestureAtPoint_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "tapGestureAtPoint:");
}

id objc_msgSend_tapGestureAtPoint_isDoubleTap_numberOfFingers_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "tapGestureAtPoint:isDoubleTap:numberOfFingers:");
}

id objc_msgSend_targetElement(void *a1, const char *a2, ...)
{
  return _[a1 targetElement];
}

id objc_msgSend_tearDown(void *a1, const char *a2, ...)
{
  return _[a1 tearDown];
}

id objc_msgSend_testAxManager(void *a1, const char *a2, ...)
{
  return _[a1 testAxManager];
}

id objc_msgSend_text(void *a1, const char *a2, ...)
{
  return _[a1 text];
}

id objc_msgSend_textColor(void *a1, const char *a2, ...)
{
  return _[a1 textColor];
}

id objc_msgSend_textElement(void *a1, const char *a2, ...)
{
  return _[a1 textElement];
}

id objc_msgSend_textOperations(void *a1, const char *a2, ...)
{
  return _[a1 textOperations];
}

id objc_msgSend_theme(void *a1, const char *a2, ...)
{
  return _[a1 theme];
}

id objc_msgSend_tickleIdleTimer(void *a1, const char *a2, ...)
{
  return _[a1 tickleIdleTimer];
}

id objc_msgSend_timeIntervalBeforeSendAction(void *a1, const char *a2, ...)
{
  return _[a1 timeIntervalBeforeSendAction];
}

id objc_msgSend_timeIntervalBeforeSendRepeatAction(void *a1, const char *a2, ...)
{
  return _[a1 timeIntervalBeforeSendRepeatAction];
}

id objc_msgSend_timeIntervalBetweenDidSendActions(void *a1, const char *a2, ...)
{
  return _[a1 timeIntervalBetweenDidSendActions];
}

id objc_msgSend_timeIntervalSinceDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "timeIntervalSinceDate:");
}

id objc_msgSend_timeIntervalSinceDidSendAction(void *a1, const char *a2, ...)
{
  return _[a1 timeIntervalSinceDidSendAction];
}

id objc_msgSend_timeIntervalSinceNow(void *a1, const char *a2, ...)
{
  return _[a1 timeIntervalSinceNow];
}

id objc_msgSend_timeIntervalSinceReferenceDate(void *a1, const char *a2, ...)
{
  return _[a1 timeIntervalSinceReferenceDate];
}

id objc_msgSend_timeout(void *a1, const char *a2, ...)
{
  return _[a1 timeout];
}

id objc_msgSend_timeoutDuration(void *a1, const char *a2, ...)
{
  return _[a1 timeoutDuration];
}

id objc_msgSend_timerWithTimeInterval_repeats_block_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "timerWithTimeInterval:repeats:block:");
}

id objc_msgSend_tip(void *a1, const char *a2, ...)
{
  return _[a1 tip];
}

id objc_msgSend_tipObject(void *a1, const char *a2, ...)
{
  return _[a1 tipObject];
}

id objc_msgSend_tipObjectForPresentingSheet_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "tipObjectForPresentingSheet:");
}

id objc_msgSend_title(void *a1, const char *a2, ...)
{
  return _[a1 title];
}

id objc_msgSend_titleFont(void *a1, const char *a2, ...)
{
  return _[a1 titleFont];
}

id objc_msgSend_titleForTripleClickOption_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "titleForTripleClickOption:");
}

id objc_msgSend_titleHiddenConstraint(void *a1, const char *a2, ...)
{
  return _[a1 titleHiddenConstraint];
}

id objc_msgSend_titleLabel(void *a1, const char *a2, ...)
{
  return _[a1 titleLabel];
}

id objc_msgSend_titleToSizeCache(void *a1, const char *a2, ...)
{
  return _[a1 titleToSizeCache];
}

id objc_msgSend_toValue(void *a1, const char *a2, ...)
{
  return _[a1 toValue];
}

id objc_msgSend_toggleAppSwitcher(void *a1, const char *a2, ...)
{
  return _[a1 toggleAppSwitcher];
}

id objc_msgSend_toggleCommandAndControl(void *a1, const char *a2, ...)
{
  return _[a1 toggleCommandAndControl];
}

id objc_msgSend_toggleControlCenter(void *a1, const char *a2, ...)
{
  return _[a1 toggleControlCenter];
}

id objc_msgSend_toggleDock(void *a1, const char *a2, ...)
{
  return _[a1 toggleDock];
}

id objc_msgSend_toggleMute(void *a1, const char *a2, ...)
{
  return _[a1 toggleMute];
}

id objc_msgSend_toggleNotificationCenter(void *a1, const char *a2, ...)
{
  return _[a1 toggleNotificationCenter];
}

id objc_msgSend_toggleReachability(void *a1, const char *a2, ...)
{
  return _[a1 toggleReachability];
}

id objc_msgSend_toggleRingerSwitch_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "toggleRingerSwitch:");
}

id objc_msgSend_toggleSpotlight(void *a1, const char *a2, ...)
{
  return _[a1 toggleSpotlight];
}

id objc_msgSend_toggleTouchForFreehandSheet_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "toggleTouchForFreehandSheet:");
}

id objc_msgSend_topAnchor(void *a1, const char *a2, ...)
{
  return _[a1 topAnchor];
}

id objc_msgSend_topButtonPress_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "topButtonPress:");
}

id objc_msgSend_topLevelVisualScrollersAuxElementManager(void *a1, const char *a2, ...)
{
  return _[a1 topLevelVisualScrollersAuxElementManager];
}

id objc_msgSend_topMostLeafAXElement(void *a1, const char *a2, ...)
{
  return _[a1 topMostLeafAXElement];
}

id objc_msgSend_totalLongPressDuration(void *a1, const char *a2, ...)
{
  return _[a1 totalLongPressDuration];
}

id objc_msgSend_touchDownForDrawingViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "touchDownForDrawingViewController:");
}

id objc_msgSend_touchItems(void *a1, const char *a2, ...)
{
  return _[a1 touchItems];
}

id objc_msgSend_touchSpeedMultiplier(void *a1, const char *a2, ...)
{
  return _[a1 touchSpeedMultiplier];
}

id objc_msgSend_touchToggleMenuItemWithPreferredNumberOfLines_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "touchToggleMenuItemWithPreferredNumberOfLines:");
}

id objc_msgSend_touchUpForDrawingViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "touchUpForDrawingViewController:");
}

id objc_msgSend_trailingAnchor(void *a1, const char *a2, ...)
{
  return _[a1 trailingAnchor];
}

id objc_msgSend_traitCollection(void *a1, const char *a2, ...)
{
  return _[a1 traitCollection];
}

id objc_msgSend_traitCollectionForLabelPreferredContentSizeCategory(void *a1, const char *a2, ...)
{
  return _[a1 traitCollectionForLabelPreferredContentSizeCategory];
}

id objc_msgSend_traits(void *a1, const char *a2, ...)
{
  return _[a1 traits];
}

id objc_msgSend_transducerType(void *a1, const char *a2, ...)
{
  return _[a1 transducerType];
}

id objc_msgSend_transitionMenuToNubbit_changeAlpha_animate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "transitionMenuToNubbit:changeAlpha:animate:");
}

id objc_msgSend_transitionNubbitToMenu_concurrentAnimation_animationCompleted_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "transitionNubbitToMenu:concurrentAnimation:animationCompleted:");
}

id objc_msgSend_transitionToMenuSheet_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "transitionToMenuSheet:");
}

id objc_msgSend_transitionToMenuSheet_fromSheet_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "transitionToMenuSheet:fromSheet:");
}

id objc_msgSend_triangle(void *a1, const char *a2, ...)
{
  return _[a1 triangle];
}

id objc_msgSend_triangleKnockoutLayer(void *a1, const char *a2, ...)
{
  return _[a1 triangleKnockoutLayer];
}

id objc_msgSend_triangleStrokeLayer(void *a1, const char *a2, ...)
{
  return _[a1 triangleStrokeLayer];
}

id objc_msgSend_tripleClickHomeButton(void *a1, const char *a2, ...)
{
  return _[a1 tripleClickHomeButton];
}

id objc_msgSend_turnDigitalCrown_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "turnDigitalCrown:");
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return _[a1 type];
}

id objc_msgSend_typingCandidates(void *a1, const char *a2, ...)
{
  return _[a1 typingCandidates];
}

id objc_msgSend_uiApplicationAtCoordinate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "uiApplicationAtCoordinate:");
}

id objc_msgSend_uiApplicationForContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "uiApplicationForContext:");
}

id objc_msgSend_uiDelegate(void *a1, const char *a2, ...)
{
  return _[a1 uiDelegate];
}

id objc_msgSend_uiElement(void *a1, const char *a2, ...)
{
  return _[a1 uiElement];
}

id objc_msgSend_uiElementWithAXElement_cache_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "uiElementWithAXElement:cache:");
}

id objc_msgSend_unarchivedArrayOfObjectsOfClass_fromData_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unarchivedArrayOfObjectsOfClass:fromData:error:");
}

id objc_msgSend_unfinishedSpeechActionsWithCompletionBlocks(void *a1, const char *a2, ...)
{
  return _[a1 unfinishedSpeechActionsWithCompletionBlocks];
}

id objc_msgSend_unfocusedBackgroundImage(void *a1, const char *a2, ...)
{
  return _[a1 unfocusedBackgroundImage];
}

id objc_msgSend_unfocusedStateBorderThickness(void *a1, const char *a2, ...)
{
  return _[a1 unfocusedStateBorderThickness];
}

id objc_msgSend_unfocusedStateColor(void *a1, const char *a2, ...)
{
  return _[a1 unfocusedStateColor];
}

id objc_msgSend_unload(void *a1, const char *a2, ...)
{
  return _[a1 unload];
}

id objc_msgSend_unloadResources(void *a1, const char *a2, ...)
{
  return _[a1 unloadResources];
}

id objc_msgSend_unloadScanner(void *a1, const char *a2, ...)
{
  return _[a1 unloadScanner];
}

id objc_msgSend_unregisterFetchObserver_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unregisterFetchObserver:");
}

id objc_msgSend_unregisterMenuObserver_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unregisterMenuObserver:");
}

id objc_msgSend_unregisterUpdateBlockForRetrieveSelector_withListenerID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unregisterUpdateBlockForRetrieveSelector:withListenerID:");
}

id objc_msgSend_unsignedIntValue(void *a1, const char *a2, ...)
{
  return _[a1 unsignedIntValue];
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return _[a1 unsignedIntegerValue];
}

id objc_msgSend_upArrowButton(void *a1, const char *a2, ...)
{
  return _[a1 upArrowButton];
}

id objc_msgSend_update(void *a1, const char *a2, ...)
{
  return _[a1 update];
}

id objc_msgSend_updateAfterFetchWithCurrentlyScannedElement_options_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateAfterFetchWithCurrentlyScannedElement:options:");
}

id objc_msgSend_updateAllSettings(void *a1, const char *a2, ...)
{
  return _[a1 updateAllSettings];
}

id objc_msgSend_updateBlockForIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateBlockForIdentifier:");
}

id objc_msgSend_updateCache_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateCache:");
}

id objc_msgSend_updateCacheWithAttributes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateCacheWithAttributes:");
}

id objc_msgSend_updateCachedOrbPreviewWindow_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateCachedOrbPreviewWindow:");
}

id objc_msgSend_updateCellForMenuItem_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateCellForMenuItem:");
}

id objc_msgSend_updateCustomFocusingViewStateForViewsWithElement_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateCustomFocusingViewStateForViewsWithElement:");
}

id objc_msgSend_updateElementCacheScheme(void *a1, const char *a2, ...)
{
  return _[a1 updateElementCacheScheme];
}

id objc_msgSend_updateElementVisualsCoalescer(void *a1, const char *a2, ...)
{
  return _[a1 updateElementVisualsCoalescer];
}

id objc_msgSend_updateFocusState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateFocusState:");
}

id objc_msgSend_updateForGeometryChange(void *a1, const char *a2, ...)
{
  return _[a1 updateForGeometryChange];
}

id objc_msgSend_updateForegroundImageForAction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateForegroundImageForAction:");
}

id objc_msgSend_updateFrameForParentBounds_refinementPoint_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateFrameForParentBounds:refinementPoint:");
}

id objc_msgSend_updateHandler(void *a1, const char *a2, ...)
{
  return _[a1 updateHandler];
}

id objc_msgSend_updateItem(void *a1, const char *a2, ...)
{
  return _[a1 updateItem];
}

id objc_msgSend_updateLayerTreePosition_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateLayerTreePosition:");
}

id objc_msgSend_updateLevel_animated_options_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateLevel:animated:options:");
}

id objc_msgSend_updateMainCursorWithElement_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateMainCursorWithElement:");
}

id objc_msgSend_updateMenuSheetContentSize(void *a1, const char *a2, ...)
{
  return _[a1 updateMenuSheetContentSize];
}

id objc_msgSend_updateMenuStyle(void *a1, const char *a2, ...)
{
  return _[a1 updateMenuStyle];
}

id objc_msgSend_updateMenuVisibility(void *a1, const char *a2, ...)
{
  return _[a1 updateMenuVisibility];
}

id objc_msgSend_updateMenuVisualsForUpdatedElementVisuals(void *a1, const char *a2, ...)
{
  return _[a1 updateMenuVisualsForUpdatedElementVisuals];
}

id objc_msgSend_updateModernMenuItem_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateModernMenuItem:");
}

id objc_msgSend_updateNubbitForegroundImageForAction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateNubbitForegroundImageForAction:");
}

id objc_msgSend_updatePath_frame_isSimpleRect_animated_options_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updatePath:frame:isSimpleRect:animated:options:");
}

id objc_msgSend_updateRingerSwitch(void *a1, const char *a2, ...)
{
  return _[a1 updateRingerSwitch];
}

id objc_msgSend_updateRotationLockSwitch(void *a1, const char *a2, ...)
{
  return _[a1 updateRotationLockSwitch];
}

id objc_msgSend_updateSoftwareKeyboardState(void *a1, const char *a2, ...)
{
  return _[a1 updateSoftwareKeyboardState];
}

id objc_msgSend_updateTextColor(void *a1, const char *a2, ...)
{
  return _[a1 updateTextColor];
}

id objc_msgSend_updateTheme_animated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateTheme:animated:");
}

id objc_msgSend_updateTheme_animated_options_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateTheme:animated:options:");
}

id objc_msgSend_updateTheme_level_path_frame_isSimpleRect_animated_options_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateTheme:level:path:frame:isSimpleRect:animated:options:");
}

id objc_msgSend_updateToFitWithinParentBounds_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateToFitWithinParentBounds:");
}

id objc_msgSend_updateViewControllerStackForSheet_previousSheet_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateViewControllerStackForSheet:previousSheet:");
}

id objc_msgSend_updateWhetherSwitchConfigurationHasScreenSwitch(void *a1, const char *a2, ...)
{
  return _[a1 updateWhetherSwitchConfigurationHasScreenSwitch];
}

id objc_msgSend_updateWhetherSwitchConfigurationRendersDeviceUnusable(void *a1, const char *a2, ...)
{
  return _[a1 updateWhetherSwitchConfigurationRendersDeviceUnusable];
}

id objc_msgSend_updateWithContextElement_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateWithContextElement:");
}

id objc_msgSend_updateWithDevice_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateWithDevice:error:");
}

id objc_msgSend_updateWithFocusContext_animated_options_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateWithFocusContext:animated:options:");
}

id objc_msgSend_updateWithPhase_withPicker_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateWithPhase:withPicker:");
}

id objc_msgSend_updateWithPrimaryFingerPoint_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateWithPrimaryFingerPoint:");
}

id objc_msgSend_updateWithSwitches_recipe_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateWithSwitches:recipe:");
}

id objc_msgSend_uppercaseString(void *a1, const char *a2, ...)
{
  return _[a1 uppercaseString];
}

id objc_msgSend_usage(void *a1, const char *a2, ...)
{
  return _[a1 usage];
}

id objc_msgSend_useFocusContextOnResume_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "useFocusContextOnResume:");
}

id objc_msgSend_userBoolValueForSetting_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "userBoolValueForSetting:");
}

id objc_msgSend_userDefinedScanningBehaviorTraits(void *a1, const char *a2, ...)
{
  return _[a1 userDefinedScanningBehaviorTraits];
}

id objc_msgSend_userDidPerformSwitchAction(void *a1, const char *a2, ...)
{
  return _[a1 userDidPerformSwitchAction];
}

id objc_msgSend_userEventOccurred(void *a1, const char *a2, ...)
{
  return _[a1 userEventOccurred];
}

id objc_msgSend_userInteractionEnabledOnRockerDismissView(void *a1, const char *a2, ...)
{
  return _[a1 userInteractionEnabledOnRockerDismissView];
}

id objc_msgSend_userInterfaceClient(void *a1, const char *a2, ...)
{
  return _[a1 userInterfaceClient];
}

id objc_msgSend_userInterfaceClientEnablers(void *a1, const char *a2, ...)
{
  return _[a1 userInterfaceClientEnablers];
}

id objc_msgSend_userInterfaceClientForInputController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "userInterfaceClientForInputController:");
}

id objc_msgSend_userInterfaceIdiom(void *a1, const char *a2, ...)
{
  return _[a1 userInterfaceIdiom];
}

id objc_msgSend_userInterfaceLayoutDirection(void *a1, const char *a2, ...)
{
  return _[a1 userInterfaceLayoutDirection];
}

id objc_msgSend_usesHighVisibility(void *a1, const char *a2, ...)
{
  return _[a1 usesHighVisibility];
}

id objc_msgSend_usesScenes(void *a1, const char *a2, ...)
{
  return _[a1 usesScenes];
}

id objc_msgSend_usesTwoLevelRefinement(void *a1, const char *a2, ...)
{
  return _[a1 usesTwoLevelRefinement];
}

id objc_msgSend_usingSpecialTool(void *a1, const char *a2, ...)
{
  return _[a1 usingSpecialTool];
}

id objc_msgSend_uuid(void *a1, const char *a2, ...)
{
  return _[a1 uuid];
}

id objc_msgSend_validateAndUpdateRecipeIfNeeded_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "validateAndUpdateRecipeIfNeeded:");
}

id objc_msgSend_validateClass_hasInstanceMethod_withFullSignature_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "validateClass:hasInstanceMethod:withFullSignature:");
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

id objc_msgSend_valueWithCGPoint_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "valueWithCGPoint:");
}

id objc_msgSend_valueWithCGRect_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "valueWithCGRect:");
}

id objc_msgSend_valueWithPoint_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "valueWithPoint:");
}

id objc_msgSend_velocity(void *a1, const char *a2, ...)
{
  return _[a1 velocity];
}

id objc_msgSend_verticalContinuousScrollers(void *a1, const char *a2, ...)
{
  return _[a1 verticalContinuousScrollers];
}

id objc_msgSend_verticalScroller(void *a1, const char *a2, ...)
{
  return _[a1 verticalScroller];
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return _[a1 view];
}

id objc_msgSend_viewAtDisplayPoint_downPoint_window_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "viewAtDisplayPoint:downPoint:window:");
}

id objc_msgSend_viewBottomConstraint(void *a1, const char *a2, ...)
{
  return _[a1 viewBottomConstraint];
}

id objc_msgSend_viewController(void *a1, const char *a2, ...)
{
  return _[a1 viewController];
}

id objc_msgSend_viewDidAppear_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "viewDidAppear:");
}

id objc_msgSend_viewLeadingConstraint(void *a1, const char *a2, ...)
{
  return _[a1 viewLeadingConstraint];
}

id objc_msgSend_viewOrbActionTriggered_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "viewOrbActionTriggered:");
}

id objc_msgSend_viewPressedDown_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "viewPressedDown:");
}

id objc_msgSend_viewPressedUp_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "viewPressedUp:");
}

id objc_msgSend_viewTopConstraint(void *a1, const char *a2, ...)
{
  return _[a1 viewTopConstraint];
}

id objc_msgSend_viewTrailingConstraint(void *a1, const char *a2, ...)
{
  return _[a1 viewTrailingConstraint];
}

id objc_msgSend_viewWillAppear_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "viewWillAppear:");
}

id objc_msgSend_viewsRequiringStateUpdate(void *a1, const char *a2, ...)
{
  return _[a1 viewsRequiringStateUpdate];
}

id objc_msgSend_visibleCells(void *a1, const char *a2, ...)
{
  return _[a1 visibleCells];
}

id objc_msgSend_visibleFrame(void *a1, const char *a2, ...)
{
  return _[a1 visibleFrame];
}

id objc_msgSend_visibleItemOffset(void *a1, const char *a2, ...)
{
  return _[a1 visibleItemOffset];
}

id objc_msgSend_visiblePoint(void *a1, const char *a2, ...)
{
  return _[a1 visiblePoint];
}

id objc_msgSend_visualProvider(void *a1, const char *a2, ...)
{
  return _[a1 visualProvider];
}

id objc_msgSend_visualProviderDidDismiss(void *a1, const char *a2, ...)
{
  return _[a1 visualProviderDidDismiss];
}

id objc_msgSend_visualProviderDidPresent(void *a1, const char *a2, ...)
{
  return _[a1 visualProviderDidPresent];
}

id objc_msgSend_visualProviderDidUpdate(void *a1, const char *a2, ...)
{
  return _[a1 visualProviderDidUpdate];
}

id objc_msgSend_visualProviderWillDismiss(void *a1, const char *a2, ...)
{
  return _[a1 visualProviderWillDismiss];
}

id objc_msgSend_visualProviderWillPresent(void *a1, const char *a2, ...)
{
  return _[a1 visualProviderWillPresent];
}

id objc_msgSend_visualsHidden(void *a1, const char *a2, ...)
{
  return _[a1 visualsHidden];
}

id objc_msgSend_voiceId(void *a1, const char *a2, ...)
{
  return _[a1 voiceId];
}

id objc_msgSend_voiceOverEffectiveSpeakingVolume(void *a1, const char *a2, ...)
{
  return _[a1 voiceOverEffectiveSpeakingVolume];
}

id objc_msgSend_voiceOverMediaDuckingAmount(void *a1, const char *a2, ...)
{
  return _[a1 voiceOverMediaDuckingAmount];
}

id objc_msgSend_voiceOverMediaDuckingMode(void *a1, const char *a2, ...)
{
  return _[a1 voiceOverMediaDuckingMode];
}

id objc_msgSend_voiceSelectionForLanguageCode_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "voiceSelectionForLanguageCode:completionHandler:");
}

id objc_msgSend_volume(void *a1, const char *a2, ...)
{
  return _[a1 volume];
}

id objc_msgSend_volumeButton(void *a1, const char *a2, ...)
{
  return _[a1 volumeButton];
}

id objc_msgSend_volumeButton_didChangeFocusState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "volumeButton:didChangeFocusState:");
}

id objc_msgSend_volumeLevel(void *a1, const char *a2, ...)
{
  return _[a1 volumeLevel];
}

id objc_msgSend_waitsForSelectAction(void *a1, const char *a2, ...)
{
  return _[a1 waitsForSelectAction];
}

id objc_msgSend_wakeDeviceFromSleepIfNecessary(void *a1, const char *a2, ...)
{
  return _[a1 wakeDeviceFromSleepIfNecessary];
}

id objc_msgSend_wakeUpDeviceIfNecessary(void *a1, const char *a2, ...)
{
  return _[a1 wakeUpDeviceIfNecessary];
}

id objc_msgSend_warm(void *a1, const char *a2, ...)
{
  return _[a1 warm];
}

id objc_msgSend_wasPostedByAccessibility(void *a1, const char *a2, ...)
{
  return _[a1 wasPostedByAccessibility];
}

id objc_msgSend_wasPresentedWithTip(void *a1, const char *a2, ...)
{
  return _[a1 wasPresentedWithTip];
}

id objc_msgSend_weakObjectsHashTable(void *a1, const char *a2, ...)
{
  return _[a1 weakObjectsHashTable];
}

id objc_msgSend_weakObjectsPointerArray(void *a1, const char *a2, ...)
{
  return _[a1 weakObjectsPointerArray];
}

id objc_msgSend_whiteColor(void *a1, const char *a2, ...)
{
  return _[a1 whiteColor];
}

id objc_msgSend_whitespaceAndNewlineCharacterSet(void *a1, const char *a2, ...)
{
  return _[a1 whitespaceAndNewlineCharacterSet];
}

id objc_msgSend_widthAnchor(void *a1, const char *a2, ...)
{
  return _[a1 widthAnchor];
}

id objc_msgSend_widthConstraint(void *a1, const char *a2, ...)
{
  return _[a1 widthConstraint];
}

id objc_msgSend_willBePresentedWithElement_pointPicker_sheetToShow_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "willBePresentedWithElement:pointPicker:sheetToShow:");
}

id objc_msgSend_willBecomeCurrentAuxiliaryElementManager(void *a1, const char *a2, ...)
{
  return _[a1 willBecomeCurrentAuxiliaryElementManager];
}

id objc_msgSend_willBecomeScannerDriver(void *a1, const char *a2, ...)
{
  return _[a1 willBecomeScannerDriver];
}

id objc_msgSend_willBeginProvidingElements(void *a1, const char *a2, ...)
{
  return _[a1 willBeginProvidingElements];
}

id objc_msgSend_willDismiss_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "willDismiss:");
}

id objc_msgSend_willDrillIntoGroup(void *a1, const char *a2, ...)
{
  return _[a1 willDrillIntoGroup];
}

id objc_msgSend_willDrillOutOfGroup(void *a1, const char *a2, ...)
{
  return _[a1 willDrillOutOfGroup];
}

id objc_msgSend_willFetchElements(void *a1, const char *a2, ...)
{
  return _[a1 willFetchElements];
}

id objc_msgSend_willFinishAsScannerDriver(void *a1, const char *a2, ...)
{
  return _[a1 willFinishAsScannerDriver];
}

id objc_msgSend_willFocusOnContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "willFocusOnContext:");
}

id objc_msgSend_willIncludeTitleLabels(void *a1, const char *a2, ...)
{
  return _[a1 willIncludeTitleLabels];
}

id objc_msgSend_willMoveToParentViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "willMoveToParentViewController:");
}

id objc_msgSend_willPopPinchItemsViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "willPopPinchItemsViewController:");
}

id objc_msgSend_willPresentWithDisplayContext_animated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "willPresentWithDisplayContext:animated:");
}

id objc_msgSend_willResignCurrentAuxiliaryElementManager(void *a1, const char *a2, ...)
{
  return _[a1 willResignCurrentAuxiliaryElementManager];
}

id objc_msgSend_willScanFirstElementAfterPresentation(void *a1, const char *a2, ...)
{
  return _[a1 willScanFirstElementAfterPresentation];
}

id objc_msgSend_willTransitionToSheet_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "willTransitionToSheet:");
}

id objc_msgSend_willUnfocusFromContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "willUnfocusFromContext:");
}

id objc_msgSend_window(void *a1, const char *a2, ...)
{
  return _[a1 window];
}

id objc_msgSend_windowContextId(void *a1, const char *a2, ...)
{
  return _[a1 windowContextId];
}

id objc_msgSend_windowDisplayId(void *a1, const char *a2, ...)
{
  return _[a1 windowDisplayId];
}

id objc_msgSend_windowRotationDuration(void *a1, const char *a2, ...)
{
  return _[a1 windowRotationDuration];
}

id objc_msgSend_windowScene(void *a1, const char *a2, ...)
{
  return _[a1 windowScene];
}

id objc_msgSend_windowSceneIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 windowSceneIdentifier];
}

id objc_msgSend_xAxis(void *a1, const char *a2, ...)
{
  return _[a1 xAxis];
}

id objc_msgSend_yAxis(void *a1, const char *a2, ...)
{
  return _[a1 yAxis];
}

id objc_msgSend_zoomIn(void *a1, const char *a2, ...)
{
  return _[a1 zoomIn];
}

id objc_msgSend_zoomOut(void *a1, const char *a2, ...)
{
  return _[a1 zoomOut];
}
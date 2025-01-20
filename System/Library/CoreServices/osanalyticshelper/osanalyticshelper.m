id sub_100005B00(uint64_t a1)
{
  void *v1;
  void *v2;
  CFStringRef v4;
  void *v5;
  v4 = @"state";
  v1 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", *(unsigned __int8 *)(a1 + 32)));
  v5 = v1;
  v2 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v5,  &v4,  1LL));

  return v2;
}

id sub_100005D88(uint64_t a1)
{
  v1 = @"YES";
  if (!*(_BYTE *)(a1 + 32)) {
    v1 = @"NO";
  }
  v3 = @"prodFused";
  v4 = v1;
  return (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v4,  &v3,  1LL));
}

void sub_100005E50(id a1)
{
  v3[0] = CTCategoryIdentifierGames;
  v3[1] = CTCategoryIdentifierSocialNetworking;
  v4[0] = @"Games";
  v4[1] = @"Social Networking";
  v3[2] = CTCategoryIdentifierEntertainment;
  v3[3] = CTCategoryIdentifierCreativity;
  v4[2] = @"Entertainment";
  v4[3] = @"Creativity";
  v3[4] = CTCategoryIdentifierProductivity;
  v3[5] = CTCategoryIdentifierEducation;
  v4[4] = @"Productivity";
  v4[5] = @"Education";
  v3[6] = CTCategoryIdentifierReadingAndReference;
  v3[7] = CTCategoryIdentifierHealthAndFitness;
  v4[6] = @"Reading & Reference";
  v4[7] = @"Health & Fitness";
  v3[8] = CTCategoryIdentifierOther;
  v3[9] = CTCategoryIdentifierUtilities;
  v4[8] = @"Other";
  v4[9] = @"Utilities";
  v3[10] = CTCategoryIdentifierShoppingAndFood;
  v3[11] = CTCategoryIdentifierTravel;
  v4[10] = @"Shopping & Food";
  v4[11] = @"Travel";
  v3[12] = CTCategoryIdentifierSystemUnblockable;
  v3[13] = CTCategoryIdentifierSystemBlockable;
  v4[12] = @"System Unblockable Applications";
  v4[13] = @"System Blockable Applications";
  v3[14] = CTCategoryIdentifierSystemHidden;
  v4[14] = @"System Hidden Applications";
  uint64_t v1 = objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v4,  v3,  15LL));
  v2 = (void *)qword_100026208;
  qword_100026208 = v1;
}

void sub_100006074(id a1)
{
  v3[0] = CTCategoryIdentifierEducation;
  v3[1] = CTCategoryIdentifierEntertainment;
  v4[0] = &off_100022C30;
  v4[1] = &off_100022C48;
  v3[2] = CTCategoryIdentifierSystemUnblockable;
  v3[3] = CTCategoryIdentifierOther;
  v4[2] = &off_100022C60;
  v4[3] = &off_100022C78;
  v3[4] = CTCategoryIdentifierProductivity;
  v3[5] = CTCategoryIdentifierSystemBlockable;
  v4[4] = &off_100022C90;
  v4[5] = &off_100022CA8;
  v3[6] = CTCategoryIdentifierSystemHidden;
  v3[7] = CTCategoryIdentifierSystemBlockable;
  v4[6] = &off_100022CC0;
  v4[7] = &off_100022CD8;
  v3[8] = CTCategoryIdentifierReadingAndReference;
  v3[9] = CTCategoryIdentifierHealthAndFitness;
  v4[8] = &off_100022C78;
  v4[9] = &off_100022CF0;
  v3[10] = CTCategoryIdentifierUtilities;
  v3[11] = CTCategoryIdentifierGames;
  v4[10] = &off_100022D08;
  v4[11] = &off_100022D20;
  v3[12] = CTCategoryIdentifierCreativity;
  v3[13] = CTCategoryIdentifierSocialNetworking;
  v4[12] = &off_100022D38;
  v4[13] = &off_100022D50;
  v3[14] = CTCategoryIdentifierTravel;
  void v3[15] = CTCategoryIdentifierShoppingAndFood;
  v4[14] = &off_100022D68;
  void v4[15] = &off_100022D80;
  uint64_t v1 = objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v4,  v3,  16LL));
  v2 = (void *)qword_100026218;
  qword_100026218 = v1;
}

void sub_100006320(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100006334(id a1)
{
  v3[0] = @"com.apple.AccessibilityInspector";
  v3[1] = @"com.apple.ActivityMonitor";
  v4[0] = CTCategoryIdentifierUtilities;
  v4[1] = CTCategoryIdentifierUtilities;
  v3[2] = @"com.apple.ActivityMonitorApp";
  v3[3] = @"com.apple.BarcodeScanner";
  v4[2] = CTCategoryIdentifierUtilities;
  v4[3] = CTCategoryIdentifierUtilities;
  v3[4] = @"com.apple.Bridge";
  v3[5] = @"com.apple.clock";
  v4[4] = CTCategoryIdentifierUtilities;
  v4[5] = CTCategoryIdentifierUtilities;
  v3[6] = @"com.apple.compass";
  v3[7] = @"com.apple.DeepBreathing";
  v4[6] = CTCategoryIdentifierUtilities;
  v4[7] = CTCategoryIdentifierHealthAndFitness;
  v3[8] = @"com.apple.Diagnostics";
  v3[9] = @"com.apple.dock";
  v4[8] = CTCategoryIdentifierUtilities;
  v4[9] = CTCategoryIdentifierUtilities;
  v3[10] = @"com.apple.DocumentsApp";
  v3[11] = @"com.apple.finder";
  v4[10] = CTCategoryIdentifierProductivity;
  v4[11] = CTCategoryIdentifierUtilities;
  v3[12] = @"com.apple.findmy";
  v3[13] = @"com.apple.Fitness";
  v4[12] = CTCategoryIdentifierUtilities;
  v4[13] = CTCategoryIdentifierHealthAndFitness;
  v3[14] = @"com.apple.Health";
  void v3[15] = @"com.apple.HeartRate";
  v4[14] = CTCategoryIdentifierHealthAndFitness;
  void v4[15] = CTCategoryIdentifierHealthAndFitness;
  void v3[16] = @"com.apple.Home";
  v3[17] = @"com.apple.InCallService";
  void v4[16] = CTCategoryIdentifierUtilities;
  v4[17] = CTCategoryIdentifierProductivity;
  v3[18] = @"com.apple.keychainaccess";
  v3[19] = @"com.apple.Magnifier";
  v4[18] = CTCategoryIdentifierUtilities;
  v4[19] = CTCategoryIdentifierUtilities;
  v3[20] = @"com.apple.MigrateAssistant";
  v3[21] = @"com.apple.mobilephone";
  v4[20] = CTCategoryIdentifierUtilities;
  v4[21] = CTCategoryIdentifierProductivity;
  v3[22] = @"com.apple.mobilesafari";
  v3[23] = @"com.apple.mobiletimer";
  v4[22] = CTCategoryIdentifierUtilities;
  v4[23] = CTCategoryIdentifierUtilities;
  v3[24] = @"com.apple.Passbook";
  v3[25] = @"com.apple.Preferences";
  v4[24] = CTCategoryIdentifierProductivity;
  v4[25] = CTCategoryIdentifierUtilities;
  v3[26] = @"com.apple.PreviewShell";
  v3[27] = @"com.apple.Safari";
  v4[26] = CTCategoryIdentifierProductivity;
  v4[27] = CTCategoryIdentifierUtilities;
  v3[28] = @"com.apple.SafariTechnologyPreview";
  v3[29] = @"com.apple.Siri";
  v4[28] = CTCategoryIdentifierUtilities;
  v4[29] = CTCategoryIdentifierProductivity;
  v3[30] = @"com.apple.ScreenTimeWidgetApplication";
  v3[31] = @"com.apple.SharingViewService";
  v4[30] = CTCategoryIdentifierUtilities;
  v4[31] = CTCategoryIdentifierUtilities;
  v3[32] = @"com.apple.sidecar";
  v3[33] = @"com.apple.siri";
  v4[32] = CTCategoryIdentifierUtilities;
  v4[33] = CTCategoryIdentifierProductivity;
  v3[34] = @"com.apple.SleepLockScreen";
  v3[35] = @"com.apple.SoftwareUpdate";
  v4[34] = CTCategoryIdentifierUtilities;
  v4[35] = CTCategoryIdentifierUtilities;
  v3[36] = @"com.apple.systempreferences";
  v3[37] = @"com.apple.SystemProfiler";
  v4[36] = CTCategoryIdentifierUtilities;
  v4[37] = CTCategoryIdentifierUtilities;
  v3[38] = @"com.google.Chrome";
  v3[39] = @"com.parallels.desktop.console";
  v4[38] = CTCategoryIdentifierUtilities;
  v4[39] = CTCategoryIdentifierUtilities;
  v3[40] = @"org.mozilla.firefox";
  v3[41] = @"com.operasoftware.OperaGX";
  v4[40] = CTCategoryIdentifierUtilities;
  v4[41] = CTCategoryIdentifierUtilities;
  v3[42] = @"com.microsoft.edgemac";
  v3[43] = @"com.operasoftware.Opera";
  v4[42] = CTCategoryIdentifierUtilities;
  v4[43] = CTCategoryIdentifierUtilities;
  v3[44] = @"org.mozilla.firefoxdeveloperedition";
  v3[45] = @"com.brave.Browser";
  v4[44] = CTCategoryIdentifierUtilities;
  v4[45] = CTCategoryIdentifierUtilities;
  v3[46] = @"ru.yandex.desktop.yandex-browser";
  v3[47] = @"company.thebrowser.Browser";
  v4[46] = CTCategoryIdentifierUtilities;
  v4[47] = CTCategoryIdentifierUtilities;
  uint64_t v1 = objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v4,  v3,  48LL));
  v2 = (void *)qword_100026228;
  qword_100026228 = v1;
}

void sub_10000696C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}
}

void sub_100006AD4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100006AE4(uint64_t a1, void *a2, void *a3)
{
  id v76 = a2;
  id v66 = a3;
  BOOL v4 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG);
  if (v4) {
    sub_10001523C(v4, v5, v6, v7, v8, v9, v10, v11);
  }
  v75 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) _DHIDtoCategoryDisplayNameMap]);
  v74 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithObjects:]( &OBJC_CLASS___NSMutableArray,  "arrayWithObjects:",  &stru_100021CF0,  &stru_100021CF0,  0LL));
  v12 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) generateTopThreeCategories:v76]);
  __int128 v89 = 0u;
  __int128 v90 = 0u;
  __int128 v87 = 0u;
  __int128 v88 = 0u;
  id obj = v12;
  id v13 = [obj countByEnumeratingWithState:&v87 objects:v102 count:16];
  if (v13)
  {
    v14 = 0LL;
    uint64_t v15 = *(void *)v88;
    do
    {
      for (i = 0LL; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v88 != v15) {
          objc_enumerationMutation(obj);
        }
        v17 = *(void **)(*((void *)&v87 + 1) + 8LL * (void)i);
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
        {
          v21 = (void *)objc_claimAutoreleasedReturnValue([v75 objectForKeyedSubscript:v17]);
          v22 = (void *)objc_claimAutoreleasedReturnValue([v76 objectForKeyedSubscript:v17]);
          *(_DWORD *)buf = 138412802;
          v92 = v17;
          __int16 v93 = 2112;
          v94 = v21;
          __int16 v95 = 2112;
          v96 = v22;
          _os_log_debug_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEBUG,  "HighEngagement: Top three total: %@, %@, %@",  buf,  0x20u);
        }

        v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"com.apple.topCategory%d",  (char *)i + (void)v14));
        v84[0] = _NSConcreteStackBlock;
        v84[1] = 3221225472LL;
        v84[2] = sub_100007490;
        v84[3] = &unk_100020B78;
        v84[4] = v17;
        id v19 = v75;
        id v85 = v19;
        id v86 = v76;
        AnalyticsSendEventLazy(v18, v84);

        v20 = (void *)objc_claimAutoreleasedReturnValue([v19 objectForKeyedSubscript:v17]);
        [v74 setObject:v20 atIndexedSubscript:(char *)i + (int)v14];
      }

      id v13 = [obj countByEnumeratingWithState:&v87 objects:v102 count:16];
      v14 = (char *)i + (int)v14;
    }

    while (v13);
  }

  v72 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) _DHIDto95thPercentile]);
  v69 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithObjects:]( &OBJC_CLASS___NSMutableArray,  "arrayWithObjects:",  &stru_100021CF0,  0LL));
  v68 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  BOOL v23 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG);
  if (v23) {
    sub_100015208(v23, v24, v25, v26, v27, v28, v29, v30);
  }
  __int128 v82 = 0u;
  __int128 v83 = 0u;
  __int128 v80 = 0u;
  __int128 v81 = 0u;
  id v71 = obj;
  id v31 = [v71 countByEnumeratingWithState:&v80 objects:v101 count:16];
  if (v31)
  {
    int v32 = 0;
    uint64_t v33 = *(void *)v81;
LABEL_16:
    uint64_t v34 = 0LL;
    uint64_t v67 = v32;
    if (v32 <= 1) {
      int v35 = 1;
    }
    else {
      int v35 = v32;
    }
    uint64_t v36 = (v35 - v32);
    uint64_t v37 = v32;
    while (1)
    {
      if (*(void *)v81 != v33) {
        objc_enumerationMutation(v71);
      }
      uint64_t v38 = *(void *)(*((void *)&v80 + 1) + 8 * v34);
      v39 = (void *)objc_claimAutoreleasedReturnValue([v72 objectForKeyedSubscript:v38]);
      v40 = (void *)objc_claimAutoreleasedReturnValue([v76 objectForKeyedSubscript:v38]);
      [v40 doubleValue];
      double v42 = v41;
      [v39 doubleValue];
      BOOL v44 = v42 < v43;

      if (!v44)
      {
        -[NSMutableArray addObject:](v68, "addObject:", v38);
        v45 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"com.apple.highEngagementCategory%d",  v37 + v34 + 1));
        v77[0] = _NSConcreteStackBlock;
        v77[1] = 3221225472LL;
        v77[2] = sub_100007594;
        v77[3] = &unk_100020B78;
        v77[4] = v38;
        id v46 = v75;
        id v78 = v46;
        id v79 = v76;
        AnalyticsSendEventLazy(v45, v77);

        v47 = (void *)objc_claimAutoreleasedReturnValue([v46 objectForKeyedSubscript:v38]);
        [v69 setObject:v47 atIndexedSubscript:v67 + v34];
      }

      if (v36 == v34) {
        break;
      }
      if (v31 == (id)++v34)
      {
        id v31 = [v71 countByEnumeratingWithState:&v80 objects:v101 count:16];
        int v32 = v67 + v34;
        if (v31) {
          goto LABEL_16;
        }
        break;
      }
    }
  }

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v48 = (void *)objc_claimAutoreleasedReturnValue([v74 objectAtIndexedSubscript:0]);
    v49 = (void *)objc_claimAutoreleasedReturnValue([v74 objectAtIndexedSubscript:1]);
    v50 = (void *)objc_claimAutoreleasedReturnValue([v74 objectAtIndexedSubscript:2]);
    v51 = (void *)objc_claimAutoreleasedReturnValue([v69 objectAtIndexedSubscript:0]);
    v52 = (void *)objc_claimAutoreleasedReturnValue([v69 objectAtIndexedSubscript:1]);
    *(_DWORD *)buf = 138413314;
    v92 = v48;
    __int16 v93 = 2112;
    v94 = v49;
    __int16 v95 = 2112;
    v96 = v50;
    __int16 v97 = 2112;
    v98 = v51;
    __int16 v99 = 2112;
    v100 = v52;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "HighEngagement: Posting to Biome: topCategory1: %@, topCategory2: %@, topCategory3: %@, highEngagementCategory1: % @, highEngagementCategory2: %@",  buf,  0x34u);
  }

  id v53 = objc_alloc(&OBJC_CLASS___BMOSAnalyticsHighEngagementDevices);
  v54 = (void *)objc_claimAutoreleasedReturnValue([v74 objectAtIndexedSubscript:0]);
  v55 = (void *)objc_claimAutoreleasedReturnValue([v74 objectAtIndexedSubscript:1]);
  v56 = (void *)objc_claimAutoreleasedReturnValue([v74 objectAtIndexedSubscript:2]);
  v57 = (void *)objc_claimAutoreleasedReturnValue([v69 objectAtIndexedSubscript:0]);
  v58 = (void *)objc_claimAutoreleasedReturnValue([v69 objectAtIndexedSubscript:1]);
  id v59 = [v53 initWithTopCategory1:v54 topCategory2:v55 topCategory3:v56 highEngagementCategory1:v57 highEngagementCategory2:v58];

  uint64_t v60 = BiomeLibrary();
  v61 = (void *)objc_claimAutoreleasedReturnValue(v60);
  v62 = (void *)objc_claimAutoreleasedReturnValue([v61 OSAnalytics]);
  v63 = (void *)objc_claimAutoreleasedReturnValue([v62 CA]);
  v64 = (void *)objc_claimAutoreleasedReturnValue([v63 HighEngagementDevices]);

  v65 = (void *)objc_claimAutoreleasedReturnValue([v64 source]);
  [v65 sendEvent:v59];
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "HighEngagement: Done posting to Biome",  buf,  2u);
  }
}

void sub_100007278( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, uint64_t a13, void *a14, void *a15, uint64_t a16, void *a17, uint64_t a18, uint64_t a19, void *a20, void *a21, void *a22, void *a23)
{
  _Unwind_Resume(a1);
}

id sub_100007490(uint64_t a1)
{
  uint64_t v4 = *(void *)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  v10[0] = v4;
  v9[0] = @"category";
  v9[1] = @"name";
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:"));
  v10[1] = v5;
  v9[2] = @"total";
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) objectForKeyedSubscript:*(void *)(a1 + 32)]);
  v10[2] = v6;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v10,  v9,  3LL));

  return v7;
}

void sub_10000756C(_Unwind_Exception *a1)
{
  v3 = v2;

  _Unwind_Resume(a1);
}

id sub_100007594(uint64_t a1)
{
  uint64_t v4 = *(void *)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  v10[0] = v4;
  v9[0] = @"category";
  v9[1] = @"name";
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:"));
  v10[1] = v5;
  v9[2] = @"total";
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) objectForKeyedSubscript:*(void *)(a1 + 32)]);
  v10[2] = v6;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v10,  v9,  3LL));

  return v7;
}

void sub_100007670(_Unwind_Exception *a1)
{
  v3 = v2;

  _Unwind_Resume(a1);
}

void sub_100007764( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

id sub_100007798(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) objectForKeyedSubscript:a2]);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) objectForKeyedSubscript:v5]);
  id v8 = [v7 compare:v6];

  return v8;
}

void sub_10000780C(_Unwind_Exception *a1)
{
  uint64_t v4 = v3;

  _Unwind_Resume(a1);
}

void sub_100007AB4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100007B48(uint64_t a1, void *a2, void *a3)
{
  id v19 = a2;
  id v18 = a3;
  if (v18)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      id v5 = (id)objc_claimAutoreleasedReturnValue([v18 description]);
      uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [v18 code]));
      uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v18 localizedFailureReason]);
      *(_DWORD *)buf = 138412802;
      id v26 = v5;
      __int16 v27 = 2112;
      uint64_t v28 = v6;
      __int16 v29 = 2112;
      uint64_t v30 = v7;
      _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "HighEngagement: Category error: %@, %@, %@",  buf,  0x20u);
    }
  }

  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "HighEngagement: generateTotalByCategory in completion handler",  buf,  2u);
    }

    __int128 v23 = 0u;
    __int128 v24 = 0u;
    __int128 v21 = 0u;
    __int128 v22 = 0u;
    id obj = v19;
    id v8 = [obj countByEnumeratingWithState:&v21 objects:v31 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v22;
      do
      {
        for (i = 0LL; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v22 != v9) {
            objc_enumerationMutation(obj);
          }
          uint64_t v11 = *(void *)(*((void *)&v21 + 1) + 8LL * (void)i);
          v12 = (void *)objc_claimAutoreleasedReturnValue([obj objectForKeyedSubscript:v11]);
          id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 identifier]);

          v14 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 56) _OverrideIfNeeded:v11 givenCategory:v13]);
          if (v14)
          {
            uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) objectForKeyedSubscript:v14]);
            v16 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) objectForKeyedSubscript:v11]);
            v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  (char *)[v15 integerValue] + (void)objc_msgSend(v16, "integerValue")));
            [*(id *)(a1 + 32) setObject:v17 forKeyedSubscript:v14];
          }
        }

        id v8 = [obj countByEnumeratingWithState:&v21 objects:v31 count:16];
      }

      while (v8);
    }
  }

  (*(void (**)(void))(*(void *)(a1 + 48) + 16LL))();
}

void sub_100007E3C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, void *a12)
{
}

void sub_100007FAC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000823C(_Unwind_Exception *a1)
{
  uint64_t v6 = v4;

  _Unwind_Resume(a1);
}

LABEL_34:
  }

  return v43;
}

        int v32 = xpc_copy_description(v7);
        uint64_t v33 = OSAStabilityMonitorLogDomain(v32);
        uint64_t v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
        if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
          sub_100015FAC();
        }

        if (v32) {
          free(v32);
        }
        uint64_t v28 = 1;
        goto LABEL_15;
      }
    }
  }

  __int16 v27 = OSAStabilityMonitorLogDomain(type);
  v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
    sub_100015F30(v8, v14);
  }
  uint64_t v28 = 1;
  __int16 v29 = "Client is not entitled to run the stability monitor";
LABEL_15:

  if (v9 && v28)
  {
    xpc_dictionary_set_BOOL(v9, "result", 0);
    if (v29) {
      xpc_dictionary_set_string(v9, "error_desc", v29);
    }
    xpc_connection_send_message(v8, v9);
  }
}

void sub_1000087F4( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_1000088D0( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

void sub_1000088E8( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

void sub_100008BB4(void *a1)
{
  size_t v21 = 8LL;
  uint64_t v22 = 0LL;
  uint64_t v2 = sysctlbyname("vm.shared_region_control", &v22, &v21, 0LL, 0LL);
  if (v22)
  {
    uint64_t v3 = OSAStabilityMonitorLogDomain(v2);
    uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_INFO,  "Skipping stability check in pre-reboot state.",  buf,  2u);
    }

LABEL_4:
    goto LABEL_5;
  }

  uint64_t v6 = -[OSAStabilityMonitor initWithParameters:targetBundleID:completionHandler:]( objc_alloc(&OBJC_CLASS___OSAStabilityMonitor),  "initWithParameters:targetBundleID:completionHandler:",  a1[4],  a1[5],  a1[7]);
  if (!v6)
  {
LABEL_5:
    uint64_t v5 = a1[7];
    if (v5) {
      (*(void (**)(uint64_t, void))(v5 + 16))(v5, 0LL);
    }
    return;
  }

  uint64_t v4 = (os_log_s *)v6;
  if (a1[5])
  {
    if (a1[6])
    {
      uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[OSAStabilityMonitor coalitionBasedBundleIDs](v6, "coalitionBasedBundleIDs"));
      unsigned int v8 = [v7 containsObject:a1[5]];

      if (v8) {
        -[os_log_s setTargetBundleID:](v4, "setTargetBundleID:", a1[6]);
      }
    }

    uint64_t v9 = a1[5];
    uint64_t v20 = 0LL;
    if (v9
      && (-[os_log_s isRollbackSupportedForBundleID:reason:]( v4,  "isRollbackSupportedForBundleID:reason:",  v9,  &v20) & 1) == 0)
    {
      uint64_t v10 = ((uint64_t (*)(void))OSAStabilityMonitorLogDomain)();
      uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        uint64_t v12 = a1[5];
        *(_DWORD *)buf = 138543618;
        uint64_t v24 = v12;
        __int16 v25 = 2050;
        uint64_t v26 = v20;
        _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_INFO,  "Targeted mode for %{public}@ is not available: %{public}lu",  buf,  0x16u);
      }

      goto LABEL_4;
    }
  }

  else
  {
    uint64_t v20 = 0LL;
  }

  uint64_t v15 = _NSConcreteStackBlock;
  uint64_t v16 = 3221225472LL;
  v17 = sub_100008DEC;
  id v18 = &unk_100020C28;
  id v19 = v4;
  uint64_t v13 = qword_100026238;
  v14 = v4;
  if (v13 != -1) {
    dispatch_once(&qword_100026238, &v15);
  }
  -[os_log_s evaluateStability](v14, "evaluateStability", v15, v16, v17, v18);
}

id sub_100008DEC(uint64_t a1)
{
  return _[*(id *)(a1 + 32) checkForOSUpdate];
}

void sub_100009130(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = v9;
  if (v8)
  {
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v8,  "dateByAddingTimeInterval:",  -(double)(unint64_t)(86400 * (void)objc_msgSend(*(id *)(a1 + 32), "unsignedIntegerValue"))));
    id v12 = v7;
    uint64_t v13 = v12;
    if (!v12 || (id v14 = [v12 timeIntervalSinceDate:v11], v15 < 0.0))
    {
      id v16 = v11;

      uint64_t v13 = v16;
    }

    uint64_t v17 = OSAStabilityMonitorLogDomain(v14);
    id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543618;
      __int16 v27 = v13;
      __int16 v28 = 2114;
      id v29 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_INFO,  "Calculating baseline from %{public}@ to %{public}@",  buf,  0x16u);
    }

    id v19 = *(void **)(a1 + 40);
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472LL;
    v22[2] = sub_100009344;
    v22[3] = &unk_100020CA0;
    v22[4] = v19;
    id v23 = v13;
    id v24 = v8;
    id v25 = *(id *)(a1 + 48);
    id v20 = v13;
    [v19 totalUptimeFrom:v20 to:v24 targetBundleID:0 targetAppVersions:0 firstPartyBundleIDs:0 completionHandler:v22];
  }

  else
  {
    uint64_t v21 = OSAStabilityMonitorLogDomain(v9);
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled((os_log_t)v11, OS_LOG_TYPE_ERROR)) {
      sub_1000153D4();
    }
  }
}

void sub_100009344(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (v5)
  {
    id v8 = *(void **)(a1 + 32);
    uint64_t v9 = *(void *)(a1 + 40);
    uint64_t v10 = *(void *)(a1 + 48);
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v5 versions]);
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_10000945C;
    v14[3] = &unk_100020C78;
    double v15 = (os_log_s *)v5;
    id v16 = *(id *)(a1 + 56);
    [v8 totalCrashesFrom:v9 to:v10 targetBundleID:0 appVersions:v11 isBaseline:1 completionHandler:v14];

    id v12 = v15;
  }

  else
  {
    uint64_t v13 = OSAStabilityMonitorLogDomain(v6);
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_100015438();
    }
  }
}

void sub_10000945C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (v5)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v5 aggregatedTotalsAsUnsignedInteger]);
    [v8 setObject:v9 forKey:@"stability-monitor.baselineCrashCount"];

    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) versions]);
    [v10 setObject:v11 forKey:@"stability-monitor.baselineVersions"];

    id v12 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) aggregatedTotalsAsDouble]);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    __int128 v26 = 0u;
    __int128 v27 = 0u;
    __int128 v28 = 0u;
    __int128 v29 = 0u;
    id v14 = v12;
    id v15 = [v14 countByEnumeratingWithState:&v26 objects:v30 count:16];
    if (v15)
    {
      id v16 = v15;
      uint64_t v17 = *(void *)v27;
      do
      {
        for (i = 0LL; i != v16; i = (char *)i + 1)
        {
          if (*(void *)v27 != v17) {
            objc_enumerationMutation(v14);
          }
          uint64_t v19 = *(void *)(*((void *)&v26 + 1) + 8LL * (void)i);
          id v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKeyedSubscript:", v19, (void)v26));
          [v20 doubleValue];
          double v22 = v21 / 3600.0;

          id v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithDouble:]( &OBJC_CLASS___NSNumber,  "numberWithDouble:",  round(v22 * 10.0) / 10.0));
          [v13 setObject:v23 forKeyedSubscript:v19];
        }

        id v16 = [v14 countByEnumeratingWithState:&v26 objects:v30 count:16];
      }

      while (v16);
    }

    id v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
    [v24 setObject:v13 forKey:@"stability-monitor.baselineUptime"];
  }

  else
  {
    uint64_t v25 = OSAStabilityMonitorLogDomain(v6);
    id v14 = (id)objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled((os_log_t)v14, OS_LOG_TYPE_ERROR)) {
      sub_10001549C();
    }
  }
}

LABEL_12:
    -[OSAStabilityMonitor isRollbackSupportedForBundleID:reason:]( self,  "isRollbackSupportedForBundleID:reason:",  v6,  a4);
    uint64_t v11 = 1;
    goto LABEL_13;
  }

  uint64_t v9 = OSAStabilityMonitorLogDomain(v8);
  uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
    sub_100015500();
  }

  if (!a4)
  {
LABEL_11:
    uint64_t v11 = 0;
    goto LABEL_13;
  }

  uint64_t v11 = 0;
  *a4 = 5LL;
LABEL_13:

  return v11;
}
}

void sub_100009BC4(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = OSAStabilityMonitorLogDomain(v9);
  uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  id v12 = v11;
  if (v7 && v8)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543618;
      id v37 = v7;
      __int16 v38 = 2114;
      id v39 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_INFO,  "Evaluating stability from %{public}@ to %{public}@",  buf,  0x16u);
    }

    uint64_t v13 = *(void **)(a1 + 32);
    uint64_t v14 = *(void *)(a1 + 40);
    uint64_t v15 = v13[3];
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472LL;
    v24[2] = sub_100009E98;
    v24[3] = &unk_100020D18;
    v24[4] = v13;
    id v25 = v7;
    id v26 = v8;
    id v27 = *(id *)(a1 + 40);
    id v28 = *(id *)(a1 + 48);
    id v29 = *(id *)(a1 + 56);
    id v30 = *(id *)(a1 + 64);
    id v31 = *(id *)(a1 + 72);
    id v32 = *(id *)(a1 + 80);
    id v33 = *(id *)(a1 + 88);
    id v34 = *(id *)(a1 + 96);
    id v35 = *(id *)(a1 + 104);
    [v13 totalCrashesFrom:v25 to:v26 targetBundleID:v15 appVersions:v14 isBaseline:0 completionHandler:v24];
  }

  else
  {
    if (v7)
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        sub_1000156F0((uint64_t)v9, v12, v16, v17, v18, v19, v20, v21);
      }

      double v22 = *(void **)(a1 + 32);
      id v23 = @"Error determining end date";
    }

    else
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Duration on current build has exceeded maximum days.",  buf,  2u);
      }

      double v22 = *(void **)(a1 + 32);
      id v23 = @"Exceeded maximum days on target build";
    }

    [v22 reportResultsForBundleID:0 crashes:0 uptime:0 MTBF:0 result:0 status:v23];
  }
}

void sub_100009E98(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (v5)
  {
    id v8 = *(void **)(a1 + 32);
    uint64_t v9 = *(void *)(a1 + 40);
    uint64_t v10 = v8[3];
    uint64_t v12 = *(void *)(a1 + 48);
    uint64_t v11 = *(void *)(a1 + 56);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v5 firstPartyBundleIDs]);
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472LL;
    v22[2] = sub_10000A074;
    v22[3] = &unk_100020CF0;
    v22[4] = *(void *)(a1 + 32);
    id v23 = *(id *)(a1 + 64);
    id v24 = *(id *)(a1 + 72);
    id v25 = *(id *)(a1 + 80);
    id v26 = v5;
    id v27 = *(id *)(a1 + 88);
    id v28 = *(id *)(a1 + 96);
    id v29 = *(id *)(a1 + 104);
    id v30 = *(id *)(a1 + 112);
    id v31 = *(id *)(a1 + 120);
    [v8 totalUptimeFrom:v9 to:v12 targetBundleID:v10 targetAppVersions:v11 firstPartyBundleIDs:v13 completionHandler:v22];
  }

  else
  {
    uint64_t v14 = OSAStabilityMonitorLogDomain(v6);
    uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_100015754((uint64_t)v7, v15, v16, v17, v18, v19, v20, v21);
    }

    [*(id *)(a1 + 32) reportResultsForBundleID:0 crashes:0 uptime:0 MTBF:0 result:0 status:@"Error calculating crash count"];
  }
}

void sub_10000A074(id *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (v5)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v5 totals]);
    id v9 = [v8 count];

    if (!v9)
    {
      uint64_t v11 = OSAStabilityMonitorLogDomain(v10);
      uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "No uptime values for target apps.",  buf,  2u);
      }

      [a1[4] reportResultsForBundleID:0 crashes:0 uptime:0 MTBF:0 result:0 status:@"No uptime on target build"];
    }

    v101 = v7;
    __int128 v109 = 0u;
    __int128 v110 = 0u;
    __int128 v107 = 0u;
    __int128 v108 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue([v5 totals]);
    id v13 = [obj countByEnumeratingWithState:&v107 objects:v119 count:16];
    if (v13)
    {
      id v14 = v13;
      uint64_t v15 = *(void *)v108;
      uint64_t v102 = *(void *)v108;
      id v103 = v5;
      do
      {
        uint64_t v16 = 0LL;
        id v104 = v14;
        do
        {
          if (*(void *)v108 != v15) {
            objc_enumerationMutation(obj);
          }
          double v17 = *(double *)(*((void *)&v107 + 1) + 8LL * (void)v16);
          uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([a1[5] objectForKeyedSubscript:*(void *)&v17]);
          id v19 = [v18 unsignedIntegerValue];

          uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([a1[6] objectForKeyedSubscript:*(void *)&v17]);
          [v20 doubleValue];
          double v22 = v21;

          id v23 = [a1[7] doubleValue];
          if (v22 >= v24)
          {
            id v27 = (void *)objc_claimAutoreleasedReturnValue([v5 totals]);
            id v28 = (void *)objc_claimAutoreleasedReturnValue([v27 objectForKeyedSubscript:*(void *)&v17]);
            id v29 = (void *)objc_claimAutoreleasedReturnValue([a1[8] totals]);
            id v30 = (void *)objc_claimAutoreleasedReturnValue([v29 objectForKeyedSubscript:*(void *)&v17]);
            id v31 = (void *)objc_claimAutoreleasedReturnValue( +[OSAStabilityMonitor calculateStabilityRateWithAppUsage:crashCounts:]( &OBJC_CLASS___OSAStabilityMonitor,  "calculateStabilityRateWithAppUsage:crashCounts:",  v28,  v30));

            id v32 = [v31 crashCount];
            id v33 = [a1[9] unsignedIntegerValue];
            if (v32 < v33)
            {
              uint64_t v34 = OSAStabilityMonitorLogDomain(v33);
              id v35 = (os_log_s *)objc_claimAutoreleasedReturnValue(v34);
              if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
              {
                double v36 = COERCE_DOUBLE([v31 crashCount]);
                *(_DWORD *)buf = 138543618;
                double v112 = v17;
                __int16 v113 = 2050;
                double v114 = v36;
                _os_log_impl( (void *)&_mh_execute_header,  v35,  OS_LOG_TYPE_DEFAULT,  "Crash count for %{public}@ is %{public}lu, which is below the threshold.",  buf,  0x16u);
              }

              id v37 = a1[4];
              __int16 v38 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v31 crashCount]));
              [v37 reportResultsForBundleID:*(void *)&v17 crashes:v38 uptime:0 MTBF:0 result:0 status:@"Crash count below threshold"];
              goto LABEL_32;
            }

            id v39 = (void *)objc_claimAutoreleasedReturnValue([v31 MTBF]);

            if (v39)
            {
              uint64_t v106 = 0LL;
              uint64_t v41 = OSAStabilityMonitorLogDomain(v40);
              double v42 = (os_log_s *)objc_claimAutoreleasedReturnValue(v41);
              if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG))
              {
                double v86 = COERCE_DOUBLE([v31 crashCount]);
                [v31 uptime];
                uint64_t v88 = v87;
                __int128 v89 = (void *)objc_claimAutoreleasedReturnValue([v31 MTBF]);
                [v89 doubleValue];
                *(_DWORD *)buf = 138544130;
                double v112 = v17;
                __int16 v113 = 2050;
                double v114 = v86;
                __int16 v115 = 2050;
                uint64_t v116 = v88;
                __int16 v117 = 2050;
                uint64_t v118 = v90;
                _os_log_debug_impl( (void *)&_mh_execute_header,  v42,  OS_LOG_TYPE_DEBUG,  "Evaluating stability for %{public}@ with results: crash count=%{public}lu; uptime=%{public}0.1f; MTBF=%{public}0.1f",
                  buf,
                  0x2Au);
              }

              if (v19)
              {
                BOOL v44 = (void *)objc_claimAutoreleasedReturnValue([v31 MTBF]);
                [v44 doubleValue];
                double v46 = v45;
                [a1[10] doubleValue];
                if (v46 > v47) {
                  goto LABEL_26;
                }
                double v48 = v22 / (double)(unint64_t)v19;
                v49 = (void *)objc_claimAutoreleasedReturnValue([v31 MTBF]);
                [v49 doubleValue];
                double v51 = v48 - v50;
                [a1[11] doubleValue];
                if (v51 < v52)
                {

LABEL_26:
LABEL_27:
                  uint64_t v54 = OSAStabilityMonitorLogDomain(v53);
                  v55 = (os_log_s *)objc_claimAutoreleasedReturnValue(v54);
                  if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
                  {
                    v56 = (void *)objc_claimAutoreleasedReturnValue([v31 MTBF]);
                    [v56 doubleValue];
                    *(_DWORD *)buf = 134349314;
                    double v112 = v57;
                    __int16 v113 = 2114;
                    double v114 = v17;
                    v58 = v55;
                    id v59 = "MTBF of %{public}f for %{public}@ does not meet filtering criteria.";
                    goto LABEL_38;
                  }

                  goto LABEL_39;
                }

                id v76 = (void *)objc_claimAutoreleasedReturnValue([v31 MTBF]);
                [v76 doubleValue];
                double v78 = v77;
                [a1[12] doubleValue];
                double v80 = v48 * v79;

                if (v78 > v80) {
                  goto LABEL_27;
                }
LABEL_41:
                id v75 = [a1[4] recommendRollbackForBundleID:*(void *)&v17 reason:&v106];
              }

              else
              {
                uint64_t v64 = OSAStabilityMonitorLogDomain(v43);
                v65 = (os_log_s *)objc_claimAutoreleasedReturnValue(v64);
                if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
                {
                  id v66 = a1[13];
                  *(_DWORD *)buf = 138543362;
                  double v112 = *(double *)&v66;
                  _os_log_impl( (void *)&_mh_execute_header,  v65,  OS_LOG_TYPE_DEFAULT,  "Baseline has no crashes; adjusting maximum MTBF to %{public}@",
                    buf,
                    0xCu);
                }

                uint64_t v67 = (void *)objc_claimAutoreleasedReturnValue([v31 MTBF]);
                [v67 doubleValue];
                double v69 = v68;
                [a1[13] doubleValue];
                double v71 = v70;

                if (v69 <= v71) {
                  goto LABEL_41;
                }
                uint64_t v73 = OSAStabilityMonitorLogDomain(v72);
                v55 = (os_log_s *)objc_claimAutoreleasedReturnValue(v73);
                if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
                {
                  v56 = (void *)objc_claimAutoreleasedReturnValue([v31 MTBF]);
                  [v56 doubleValue];
                  *(_DWORD *)buf = 134349314;
                  double v112 = v74;
                  __int16 v113 = 2114;
                  double v114 = v17;
                  v58 = v55;
                  id v59 = "MTBF of %{public}f for %{public}@ does not meet adjusted filtering criteria.";
LABEL_38:
                  _os_log_impl((void *)&_mh_execute_header, v58, OS_LOG_TYPE_DEFAULT, v59, buf, 0x16u);
                }

LABEL_39:
                id v75 = 0LL;
              }

              else {
                uint64_t v81 = (uint64_t)*(&off_100020EC0 + v106 - 1);
              }
              id v82 = a1[4];
              __int128 v83 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v31 crashCount]));
              [v31 uptime];
              v84 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
              id v85 = (void *)objc_claimAutoreleasedReturnValue([v31 MTBF]);
              [v82 reportResultsForBundleID:*(void *)&v17 crashes:v83 uptime:v84 MTBF:v85 result:v75 status:v81];
            }

            else
            {
              uint64_t v60 = OSAStabilityMonitorLogDomain(v40);
              v61 = (os_log_s *)objc_claimAutoreleasedReturnValue(v60);
              if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
              {
                double v91 = COERCE_DOUBLE([v31 crashCount]);
                [v31 uptime];
                *(_DWORD *)buf = 138543874;
                double v112 = v17;
                __int16 v113 = 2050;
                double v114 = v91;
                __int16 v115 = 2050;
                uint64_t v116 = v92;
                _os_log_error_impl( (void *)&_mh_execute_header,  v61,  OS_LOG_TYPE_ERROR,  "Error calculating MTBF for %{public}@ with crash count=%{public}lu and uptime=%{public}0.1f",  buf,  0x20u);
              }

              id v62 = a1[4];
              __int16 v38 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v31 crashCount]));
              [v31 uptime];
              v63 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
              [v62 reportResultsForBundleID:*(void *)&v17 crashes:v38 uptime:v63 MTBF:0 result:0 status:@"Error calculating MTBF"];

LABEL_32:
            }

            uint64_t v15 = v102;
            id v5 = v103;

            id v14 = v104;
            goto LABEL_47;
          }

          uint64_t v25 = OSAStabilityMonitorLogDomain(v23);
          id v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543618;
            double v112 = v17;
            __int16 v113 = 2050;
            double v114 = v22;
            _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEFAULT,  "Baseline uptime for %{public}@ is %{public}lf, which is below the threshold.",  buf,  0x16u);
          }

          [a1[4] reportResultsForBundleID:*(void *)&v17 crashes:0 uptime:0 MTBF:0 result:0 status:@"Baseline uptime below threshold"];
LABEL_47:
          uint64_t v16 = (char *)v16 + 1;
        }

        while (v14 != v16);
        id v14 = [obj countByEnumeratingWithState:&v107 objects:v119 count:16];
      }

      while (v14);
    }

    id v7 = v101;
  }

  else
  {
    uint64_t v93 = OSAStabilityMonitorLogDomain(v6);
    v94 = (os_log_s *)objc_claimAutoreleasedReturnValue(v93);
    if (os_log_type_enabled(v94, OS_LOG_TYPE_ERROR)) {
      sub_1000157B8((uint64_t)v7, v94, v95, v96, v97, v98, v99, v100);
    }

    [a1[4] reportResultsForBundleID:0 crashes:0 uptime:0 MTBF:0 result:0 status:@"Error calculating uptime"];
  }
}

uint64_t sub_10000AC48(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void **)(a1 + 32);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 stringValue]);
  if ([v4 isValidBundleID:v5])
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) coalitionBasedBundleIDs]);
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v3 stringValue]);
    uint64_t v8 = [v6 containsObject:v7] ^ 1;
  }

  else
  {
    uint64_t v8 = 0LL;
  }

  return v8;
}

void sub_10000ACE8(uint64_t a1, void *a2)
{
  id v6 = a2;
  id v3 = [v6 state];
  uint64_t v4 = *(void *)(a1 + 40);
  if (v3)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v6 error]);
    (*(void (**)(uint64_t, void, void *))(v4 + 16))(v4, 0LL, v5);
  }

  else
  {
    (*(void (**)(void, void, void))(v4 + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0LL);
  }
}

id sub_10000AD64(uint64_t a1, uint64_t a2)
{
  return _[*(id *)(a1 + 32) addEvent:a2];
}

void sub_10000AF58(uint64_t a1, void *a2)
{
  id v6 = a2;
  id v3 = [v6 state];
  uint64_t v4 = *(void *)(a1 + 40);
  if (v3)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v6 error]);
    (*(void (**)(uint64_t, void, void *))(v4 + 16))(v4, 0LL, v5);
  }

  else
  {
    (*(void (**)(void, void, void))(v4 + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0LL);
  }
}

id sub_10000AFD4(uint64_t a1, uint64_t a2)
{
  return _[*(id *)(a1 + 32) addCrashEvent:a2 to:*(void *)(a1 + 40)];
}

void sub_10000B3B4( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, char a25, uint64_t a26, uint64_t a27, uint64_t a28, char a29)
{
}

uint64_t sub_10000B3E4(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_10000B3F4(uint64_t a1)
{
}

void sub_10000B3FC(void *a1, void *a2)
{
  id v6 = a2;
  id v3 = [v6 state];
  uint64_t v4 = a1[4];
  if (v3)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v6 error]);
    (*(void (**)(uint64_t, void, void, void *))(v4 + 16))(v4, 0LL, 0LL, v5);
  }

  else
  {
    (*(void (**)(void, void, void, void))(v4 + 16))( a1[4],  *(void *)(*(void *)(a1[5] + 8LL) + 40LL),  *(void *)(*(void *)(a1[6] + 8LL) + 40LL),  0LL);
  }
}

uint64_t sub_10000B48C(void *a1, void *a2)
{
  id v3 = a2;
  [v3 timestamp];
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSinceReferenceDate:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceReferenceDate:"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 eventBody]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 supplementalBuild]);
  unsigned int v7 = [v6 isEqualToString:a1[4]];

  if (v7)
  {
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v3 eventBody]);
    unsigned int v9 = [v8 rapidSecurityResponsePreReboot];

    if (!v9)
    {
      *(_BYTE *)(*(void *)(a1[6] + 8LL) + 24LL) = 1;
      uint64_t v10 = a1[7];
LABEL_7:
      objc_storeStrong((id *)(*(void *)(v10 + 8) + 40LL), v4);
      uint64_t v11 = 1LL;
      goto LABEL_8;
    }

LABEL_6:
    uint64_t v10 = a1[5];
    goto LABEL_7;
  }

  if (!*(_BYTE *)(*(void *)(a1[6] + 8LL) + 24LL)) {
    goto LABEL_6;
  }
  uint64_t v11 = 0LL;
LABEL_8:

  return v11;
}

id sub_10000B960(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  id v3 = *(void **)(a1 + 32);
  if (v3)
  {
    id v4 = [v3 unsignedIntegerValue];
    if ((unint64_t)v4 > 5)
    {
      id v6 = @"(20, Inf)";
      else {
        id v5 = CFSTR("(5, 10]");
      }
    }

    else
    {
      id v5 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%lu", v4));
    }

    [v2 setObject:v5 forKeyedSubscript:@"crashCount"];
  }

  unsigned int v7 = *(void **)(a1 + 40);
  if (v7)
  {
    [v7 doubleValue];
    if (v8 >= 0.0)
    {
      if (v8 <= 5.0)
      {
        unsigned int v9 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%ld",  llround(v8)));
      }

      else
      {
        uint64_t v10 = CFSTR("(12, 24]");
        if (v8 > 24.0) {
          uint64_t v10 = @"(24, Inf)";
        }
        if (v8 > 12.0) {
          unsigned int v9 = (__CFString *)v10;
        }
        else {
          unsigned int v9 = CFSTR("(5, 12]");
        }
      }
    }

    else
    {
      unsigned int v9 = @"(-Inf, 0)";
    }

    [v2 setObject:v9 forKeyedSubscript:@"uptime"];
  }

  [v2 setObject:*(void *)(a1 + 48) forKeyedSubscript:@"bundleID"];
  [v2 setObject:*(void *)(a1 + 56) forKeyedSubscript:@"MTBF"];
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", *(unsigned __int8 *)(a1 + 72)));
  [v2 setObject:v11 forKeyedSubscript:@"result"];

  [v2 setObject:*(void *)(a1 + 64) forKeyedSubscript:@"status"];
  return v2;
}

void sub_10000C0F4(id a1)
{
  dispatch_queue_t v1 = dispatch_queue_create("com.apple.osanalytics.stabilityMonitor", 0LL);
  uint64_t v2 = (void *)qword_100026240;
  qword_100026240 = (uint64_t)v1;
}

LABEL_41:
}

void sub_10000D420( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

id sub_10000D440(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = 0LL;
  if (a1 && a2) {
    uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@-%@", a1, a2));
  }
  return v2;
}

void sub_10000D48C(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v15 = a2;
  [v15 timeIntervalSinceDate:*(void *)(a1 + 32)];
  unsigned int v7 = *(void **)(a1 + 40);
  if (v8 >= 0.0)
  {
    [*(id *)(a1 + 32) timeIntervalSinceDate:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)];
    double v13 = v12;
    id v14 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) stringValue]);
    [v7 addDouble:v14 forKey:*(void *)(a1 + 32) onDate:v13];

    *a4 = 1;
  }

  else
  {
    [v15 timeIntervalSinceDate:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)];
    double v10 = v9;
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) stringValue]);
    [v7 addDouble:v11 forKey:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) onDate:v10];

    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 40LL), a2);
  }
}

LABEL_18:
LABEL_19:
    goto LABEL_20;
  }

  if (v16) {
    goto LABEL_14;
  }
LABEL_20:
}

void sub_10000DB0C( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

void sub_10000DB1C(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
}

  ;
}

  ;
}

  ;
}

void sub_10000DB70( void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

  ;
}

void sub_10000DBE8(id a1)
{
  dispatch_queue_t v1 = objc_alloc_init(&OBJC_CLASS___OSADiagnosticMonitorServer);
  uint64_t v2 = (void *)qword_100026250;
  qword_100026250 = (uint64_t)v1;
}

void sub_10000DDF4(void *a1)
{
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v8 = 0u;
  __int128 v9 = 0u;
  id v2 = *(id *)(a1[4] + 24LL);
  id v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      for (i = 0LL; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        unsigned int v7 = *(void **)(*((void *)&v8 + 1) + 8LL * (void)i);
      }

      id v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }

    while (v4);
  }
}

void sub_10000E028(void *a1)
{
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v8 = 0u;
  __int128 v9 = 0u;
  id v2 = *(id *)(a1[4] + 24LL);
  id v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      for (i = 0LL; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        unsigned int v7 = *(void **)(*((void *)&v8 + 1) + 8LL * (void)i);
      }

      id v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }

    while (v4);
  }
}

void sub_10000E25C(void *a1)
{
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v8 = 0u;
  __int128 v9 = 0u;
  id v2 = *(id *)(a1[4] + 24LL);
  id v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      for (i = 0LL; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        unsigned int v7 = *(void **)(*((void *)&v8 + 1) + 8LL * (void)i);
      }

      id v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }

    while (v4);
  }
}

id sub_10000E464(uint64_t a1)
{
  return _objc_msgSend( *(id *)(a1 + 32),  "q_addConnection:entitled:",  *(void *)(a1 + 40),  *(unsigned __int8 *)(a1 + 48));
}

id sub_10000E584(uint64_t a1)
{
  uint64_t v2 = DiagnosticMonitorLog();
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_100015AA8(a1);
  }

  return [*(id *)(*(void *)(a1 + 40) + 24) removeObject:*(void *)(a1 + 32)];
}

void sub_10000E9BC(void *a1)
{
  id v1 = a1;
  uint64_t v3 = objc_opt_class(&OBJC_CLASS___NSSet, v2);
  if ((objc_opt_isKindOfClass(v1, v3) & 1) == 0) {
    +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidUnarchiveOperationException,  @"Putative set of strings was a %@",  objc_opt_class(v1, v4));
  }
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  id v5 = v1;
  id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    id v8 = v6;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v5);
        }
        uint64_t v11 = *(void *)(*((void *)&v13 + 1) + 8LL * (void)i);
        uint64_t v12 = objc_opt_class(&OBJC_CLASS___NSString, v7);
        if ((objc_opt_isKindOfClass(v11, v12) & 1) == 0) {
          +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidUnarchiveOperationException,  @"Putative set of strings contained a %@",  objc_opt_class(v11, v7));
        }
      }

      id v8 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }

    while (v8);
  }
}

id sub_10000EB50()
{
  v0 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Diagnostic monitor client lacks %@ entitlement",  @"com.apple.osanalytics.canusediagnosticmonitor"));
  NSErrorUserInfoKey v4 = NSLocalizedDescriptionKey;
  id v5 = v0;
  id v1 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v5,  &v4,  1LL));
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"OSADiagnosticMonitor",  0LL,  v1));

  return v2;
}

void sub_10000ED20( void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

void sub_10000ED68(id a1)
{
  id v1 = objc_alloc_init(&OBJC_CLASS___OSABridgeLinkRemote);
  uint64_t v2 = (void *)qword_100026260;
  qword_100026260 = (uint64_t)v1;

  xpc_set_event_stream_handler("com.apple.remoteservicediscovery.events", &_dispatch_main_q, &stru_100020FC8);
  if (qword_100026260)
  {
    +[OSABridgeLinkProxy setLink:](&OBJC_CLASS___OSABridgeLinkProxy, "setLink:");
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "Remote link is unavailable",  v3,  2u);
  }

void sub_10000EE20(id a1, OS_xpc_object *a2)
{
  uint64_t v2 = a2;
  uint64_t v3 = v2;
  if (v2 && xpc_get_type(v2) == (xpc_type_t)&_xpc_type_dictionary)
  {
    string = xpc_dictionary_get_string(v3, _xpc_event_key_name);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 136315394;
      id v6 = _xpc_event_key_name;
      __int16 v7 = 2080;
      id v8 = string;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Got com.apple.remoteservicediscovery.events %s:%s",  (uint8_t *)&v5,  0x16u);
    }

    if (!strcmp(string, "com.apple.SubmitDiagInfo.available")) {
      [(id)qword_100026260 handleLaunchEvent];
    }
    if (!strcmp(string, "com.apple.SubmitDiagInfo.available.display")) {
      [(id)qword_100026260 handleLaunchEvent];
    }
  }
}

void sub_10000F19C(void *a1)
{
  time_t v2 = time(0LL);
  if (v2 >= 0) {
    uint64_t v3 = (v2 / 0x15180uLL);
  }
  else {
    uint64_t v3 = v2;
  }
  NSErrorUserInfoKey v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1[4] + 24) objectForKeyedSubscript:@"<current_day>"]);
  unsigned int v5 = [v4 intValue];

  if (v5 != (_DWORD)v3)
  {
    [*(id *)(a1[4] + 24) removeAllObjects];
    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v3));
    [*(id *)(a1[4] + 24) setObject:v6 forKeyedSubscript:@"<current_day>"];
  }

  __int16 v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1[4] + 24) objectForKeyedSubscript:a1[5]]);
  int v8 = [v7 intValue];

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    uint64_t v9 = a1[5];
    int v13 = 138412802;
    *(void *)__int128 v14 = v9;
    *(_WORD *)&v14[8] = 1024;
    *(_DWORD *)&v14[10] = v8;
    __int16 v15 = 1024;
    int v16 = 50;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "daily xfer limit for %@ %d/%d",  (uint8_t *)&v13,  0x18u);
  }

  __int128 v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", (v8 + 1)));
  [*(id *)(a1[4] + 24) setObject:v10 forKeyedSubscript:a1[5]];

  if (v8 > 49)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = a1[6];
      int v13 = 67109378;
      *(_DWORD *)__int128 v14 = v8;
      *(_WORD *)&void v14[4] = 2112;
      *(void *)&v14[6] = v12;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "daily xfer limit exceeded (%d), deleting %@",  (uint8_t *)&v13,  0x12u);
    }

    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    [v11 removeItemAtPath:a1[6] error:0];
  }

  else
  {
    [*(id *)(a1[4] + 8) initiate:0 transferLog:a1[6] withOptions:&off_100022E10 job:0];
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
    [v11 setObject:*(void *)(a1[4] + 24) forKey:@"xfer-counts"];
  }
}

void sub_10000F630(const char *a1, void *a2)
{
  uint64_t v3 = a2;
  NSErrorUserInfoKey v4 = opendir(a1);
  if (v4)
  {
    unsigned int v5 = v4;
    for (i = readdir(v4); i; i = readdir(v5))
    {
      int d_type = i->d_type;
      if (d_type == 4)
      {
        if (i->d_name[0] != 46 || i->d_name[1] && (i->d_name[1] != 46 || i->d_name[2]))
        {
          snprintf(__str, 0x400uLL, "%s/%s", a1, i->d_name);
          sub_10000F630(__str, v3);
        }
      }

      else if (d_type == 8)
      {
        v3[2](v3, a1, (uint64_t)i->d_name);
      }
    }

    closedir(v5);
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = __error();
    uint64_t v9 = strerror(*v8);
    *(_DWORD *)__str = 136315394;
    uint64_t v11 = a1;
    __int16 v12 = 2080;
    int v13 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Failed to open log directory '%s': %s",  (uint8_t *)__str,  0x16u);
  }
}

void sub_10000F7AC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", a2));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", a3));
  __int16 v7 = (void *)objc_claimAutoreleasedReturnValue([v5 stringByAppendingPathComponent:v6]);

  int v8 = *(void **)(a1 + 32);
  id v20 = 0LL;
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 attributesOfItemAtPath:v7 error:&v20]);
  id v10 = v20;
  if (v9)
  {
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v9 fileModificationDate]);
    [v11 timeIntervalSinceNow];
    double v13 = fabs(v12);

    id v14 = [v9 fileSize];
    uint64_t v15 = (uint64_t)v14;
    if (!*(_BYTE *)(a1 + 40) && v13 <= 604800.0 && (unint64_t)v14 <= 0x100000)
    {
      id v16 = v10;
      goto LABEL_12;
    }
  }

  else
  {
    double v13 = 604801.0;
    uint64_t v15 = 1048577LL;
  }

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218498;
    double v22 = v13;
    __int16 v23 = 2048;
    uint64_t v24 = v15;
    __int16 v25 = 2114;
    id v26 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Removing old (%.0f) or big (%llu) log '%{public}@'",  buf,  0x20u);
  }

  double v17 = *(void **)(a1 + 32);
  id v19 = v10;
  unsigned __int8 v18 = [v17 removeItemAtPath:v7 error:&v19];
  id v16 = v19;

  if ((v18 & 1) == 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    double v22 = *(double *)&v7;
    __int16 v23 = 2112;
    uint64_t v24 = (uint64_t)v16;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Failed to remove log '%@': %@",  buf,  0x16u);
  }

uint64_t start(int a1, uint64_t a2)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)unsigned int v5 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "osanalyticshelper launched",  v5,  2u);
  }

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_100015CE4();
  }
  return 1LL;
}

id sub_10000FBC0()
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Registering the daily telemetry activity.",  buf,  2u);
  }

  xpc_activity_register("com.apple.osanalytics.daily.telemetry", XPC_ACTIVITY_CHECK_IN, &stru_100021050);
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v1 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Registering the boot time rtc beacon activity.",  v1,  2u);
  }

  xpc_activity_register("com.apple.osanalytics.postboot.telemetry", XPC_ACTIVITY_CHECK_IN, &stru_100021070);
  xpc_set_event_stream_handler("com.apple.alarm", 0LL, &stru_100021090);
  return +[HighEngagementGenerator setAlarm:](&OBJC_CLASS___HighEngagementGenerator, "setAlarm:", 0LL);
}

void sub_10000FCF4(id a1, OS_xpc_object *a2)
{
  if (xpc_activity_get_state(a2) == 2)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)time_t v2 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Running the state monitor.",  v2,  2u);
    }

    +[OSAStateMonitor evaluateState](&OBJC_CLASS___OSAStateMonitor, "evaluateState");
  }

void sub_10000FD68(id a1, OS_xpc_object *a2)
{
  if (xpc_activity_get_state(a2) == 2)
  {
    uint64_t Parameters = OSAStabilityMonitorLoadParameters();
    id v3 = (id)objc_claimAutoreleasedReturnValue(Parameters);
    +[OSAStabilityMonitor evaluateStabilityWithParameters:]( &OBJC_CLASS___OSAStabilityMonitor,  "evaluateStabilityWithParameters:",  v3);
  }

void sub_10000FDCC(id a1, OS_xpc_object *a2)
{
  if (xpc_activity_get_state(a2) == 2)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)time_t v2 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Running the daily telemetry collection.",  v2,  2u);
    }

    +[OSADailyTelemetryMonitor evaluateState](&OBJC_CLASS___OSADailyTelemetryMonitor, "evaluateState");
    +[OSADailyTelemetryMonitor sendRTCBeacon:](&OBJC_CLASS___OSADailyTelemetryMonitor, "sendRTCBeacon:", 0LL);
  }

void sub_10000FE54(id a1, OS_xpc_object *a2)
{
  if (xpc_activity_get_state(a2) == 2)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)time_t v2 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Running the post-boot telemetry.",  v2,  2u);
    }

    +[OSADailyTelemetryMonitor sendRTCBeacon:](&OBJC_CLASS___OSADailyTelemetryMonitor, "sendRTCBeacon:", 1LL);
  }

void sub_10000FECC(id a1, OS_xpc_object *a2)
{
  string = xpc_dictionary_get_string(a2, _xpc_event_key_name);
  xpc_set_event("com.apple.alarm", string, 0LL);
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v3 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Running the High Engagement Alarm.",  v3,  2u);
  }

  +[HighEngagementGenerator createBiomeFeed](&OBJC_CLASS___HighEngagementGenerator, "createBiomeFeed");
  +[HighEngagementGenerator setAlarm:](&OBJC_CLASS___HighEngagementGenerator, "setAlarm:", 1LL);
}

void sub_10000FF6C(void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
}

void sub_10000FFA0(id a1)
{
  dispatch_queue_t v1 = dispatch_queue_create("com.apple.osanalytics.reportCreateQueue", &_dispatch_queue_attr_concurrent);
  time_t v2 = (void *)qword_100026278;
  qword_100026278 = (uint64_t)v1;
}

void sub_1000100B0(uint64_t a1)
{
  time_t v2 = &_s13JobQuiescence15JQXPCConnectionCAA12JQConnectionAAMc_ptr;
  if (*(void *)(a1 + 32))
  {
    uint64_t v3 = kOSALogMetadataBugType;
    string = xpc_dictionary_get_string( *(xpc_object_t *)(a1 + 40),  (const char *)[kOSALogMetadataBugType UTF8String]);
    if (!string)
    {
      uint64_t v11 = 0LL;
      __int16 v7 = @"<unknown>";
      double v12 = "illegal request -- missing bug type";
      goto LABEL_29;
    }

    unsigned int v5 = string;
    id v6 = xpc_dictionary_get_string(*(xpc_object_t *)(a1 + 40), "caller");
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      double v51 = (void *)v5;
      __int16 v52 = 2080;
      uint64_t v53 = (void *)v6;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "S1. helper service invoked for '%s' report creation on behalf of %s",  buf,  0x16u);
    }

    __int16 v7 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v5));
    xpc_object_t value = xpc_dictionary_get_value(*(xpc_object_t *)(a1 + 40), "additionalHeaders");
    double v46 = (void *)objc_claimAutoreleasedReturnValue(value);
    if (v46)
    {
      uint64_t v9 = xpc2ns();
      id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    }

    else
    {
      id v10 = 0LL;
    }

    xpc_object_t v13 = xpc_dictionary_get_value(*(xpc_object_t *)(a1 + 40), "options");
    BOOL v44 = (void *)objc_claimAutoreleasedReturnValue(v13);
    if (v44)
    {
      uint64_t v14 = xpc2ns();
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    }

    else
    {
      uint64_t v15 = 0LL;
    }

    id v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    double v17 = (void *)objc_claimAutoreleasedReturnValue([v15 objectForKeyedSubscript:kOSALogOptionObserverInfo]);
    [v16 addEntriesFromDictionary:v17];

    uint64_t v18 = kOSALogMetadataIncidentID;
    id v19 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:kOSALogMetadataIncidentID]);
    if (v19) {
      id v20 = (const __CFString *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:v18]);
    }
    else {
      id v20 = @"<unknown>";
    }

    [v16 setObject:v20 forKeyedSubscript:@"logInfo"];
    double v21 = (void *)objc_claimAutoreleasedReturnValue([v16 objectForKeyedSubscript:v3]);

    if (!v21) {
      [v16 setObject:v7 forKeyedSubscript:v3];
    }
    uint64_t v43 = (__CFString *)v20;
    id v22 = [[OSALogIdentity alloc] initWithIncidentID:v20 bugType:v7];
    __int16 v23 = (void *)objc_claimAutoreleasedReturnValue( +[OSADiagnosticMonitorServer sharedInstance]( &OBJC_CLASS___OSADiagnosticMonitorServer,  "sharedInstance"));
    [v23 willWriteLog:v22 details:v16];

    uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue([v15 objectForKeyedSubscript:kOSALogOptionOverridePath]);
    double v45 = v10;
    if (v24)
    {
      double v12 = "illegal request -- invalid arguments";
    }

    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "S2. helper service creating file",  buf,  2u);
      }

      id v49 = 0LL;
      v47[0] = _NSConcreteStackBlock;
      v47[1] = 3221225472LL;
      v47[2] = sub_100010900;
      v47[3] = &unk_100021100;
      double v48 = (__CFString *)*(id *)(a1 + 40);
      id v33 = (void *)objc_claimAutoreleasedReturnValue( +[OSALog locallyCreateForSubmission:metadata:options:error:writing:]( &OBJC_CLASS___OSALog,  "locallyCreateForSubmission:metadata:options:error:writing:",  v7,  v10,  v15,  &v49,  v47));
      id v34 = v49;
      id v27 = v34;
      if (v33)
      {
        id v35 = *(void **)(a1 + 32);
        id v36 = objc_claimAutoreleasedReturnValue([v33 filepath]);
        xpc_dictionary_set_string(v35, "filePath", (const char *)[v36 fileSystemRepresentation]);

        uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v33 filepath]);
        *(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = 1;
        id v37 = (void *)objc_claimAutoreleasedReturnValue([v33 oldFilePath]);

        if (v37)
        {
          __int16 v38 = *(void **)(a1 + 32);
          id v39 = objc_claimAutoreleasedReturnValue([v33 oldFilePath]);
          xpc_dictionary_set_string(v38, "oldFilePath", (const char *)[v39 fileSystemRepresentation]);
        }

        if (v11)
        {
          id v28 = (void *)objc_claimAutoreleasedReturnValue( +[OSADiagnosticMonitorServer sharedInstance]( &OBJC_CLASS___OSADiagnosticMonitorServer,  "sharedInstance"));
          [v28 didWriteLog:v22 filePath:v11];
          double v12 = 0LL;
LABEL_28:

          time_t v2 = &_s13JobQuiescence15JQXPCConnectionCAA12JQConnectionAAMc_ptr;
          if (!v12)
          {
LABEL_31:
            xpc_dictionary_set_BOOL( *(xpc_object_t *)(a1 + 32),  "result",  *(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL));
            goto LABEL_32;
          }

LABEL_29:
          xpc_dictionary_set_BOOL(*(xpc_object_t *)(a1 + 32), "result", 0);
          xpc_dictionary_set_string(*(xpc_object_t *)(a1 + 32), "error_desc", v12);
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136446210;
            double v51 = (void *)v12;
            _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "helper unable to create log: %{public}s",  buf,  0xCu);
          }

          goto LABEL_31;
        }

        double v12 = 0LL;
        if (v27)
        {
LABEL_27:
          id v28 = (void *)objc_claimAutoreleasedReturnValue( +[OSADiagnosticMonitorServer sharedInstance]( &OBJC_CLASS___OSADiagnosticMonitorServer,  "sharedInstance"));
          [v28 failedToWriteLog:v22 error:v27];
          uint64_t v11 = 0LL;
          goto LABEL_28;
        }

        __int16 v25 = @"failed to create log (unknown reason)";
        goto LABEL_25;
      }

      if (v34)
      {
        id v40 = objc_claimAutoreleasedReturnValue([v34 localizedDescription]);
        double v12 = (const char *)[v40 UTF8String];

        uint64_t v41 = *(void **)(a1 + 32);
        id v42 = objc_claimAutoreleasedReturnValue([v27 domain]);
        xpc_dictionary_set_string(v41, "error_domain", (const char *)[v42 UTF8String]);

        xpc_dictionary_set_uint64(*(xpc_object_t *)(a1 + 32), "error_code", (uint64_t)[v27 code]);
        __int16 v25 = v48;
        goto LABEL_26;
      }

      double v12 = "failed to create log (unknown reason)";
    }

    __int16 v25 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v12));
LABEL_25:
    NSErrorUserInfoKey v56 = NSLocalizedDescriptionKey;
    double v57 = v25;
    id v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v57,  &v56,  1LL));
    id v27 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"OSALog",  0LL,  v26));

LABEL_26:
    goto LABEL_27;
  }

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Couldn't create XPC reply -- refusing to create file",  buf,  2u);
  }

  uint64_t v11 = 0LL;
  double v12 = "unable to create log -- no xpc reply";
  __int16 v7 = @"<unknown>";
LABEL_32:
  if (*(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL)
    && -[__CFString isEqualToString:](v7, "isEqualToString:", @"210"))
  {
    [*(id *)(a1 + 56) triggerUrgentSubmission];
  }

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v29 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL);
    *(_DWORD *)buf = 67109120;
    LODWORD(v51) = v29;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "S6. helper service complete with final result %d",  buf,  8u);
  }

  id v30 = (os_log_s *)objc_claimAutoreleasedReturnValue([v2[138] logObjForBugType:v7]);
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
  {
    if (*(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL)) {
      id v31 = @"success";
    }
    else {
      id v31 = @"FAILED";
    }
    if (v12) {
      id v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v12));
    }
    else {
      id v32 = v11;
    }
    *(_DWORD *)buf = 138543874;
    double v51 = v7;
    __int16 v52 = 2112;
    uint64_t v53 = (void *)v31;
    __int16 v54 = 2114;
    v55 = v32;
    _os_log_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_DEFAULT,  "xpc log creation type %{public}@ result %@: %{public}@",  buf,  0x20u);
    if (v12) {
  }
    }
}

BOOL sub_100010900(uint64_t a1, int a2, void *a3)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "S3. helper service utilizing back-channel with file descriptor for payload",  buf,  2u);
  }

  xpc_object_t value = xpc_dictionary_get_value(*(xpc_object_t *)(a1 + 32), "datawriter_endpoint");
  id v6 = (_xpc_endpoint_s *)objc_claimAutoreleasedReturnValue(value);
  __int16 v7 = xpc_connection_create_from_endpoint(v6);
  int v8 = v7;
  *(void *)buf = 0LL;
  id v37 = buf;
  uint64_t v38 = 0x3032000000LL;
  id v39 = sub_100010EC0;
  id v40 = sub_100010ED0;
  id v41 = 0LL;
  if (v7)
  {
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472LL;
    handler[2] = sub_100010ED8;
    handler[3] = &unk_1000210D8;
    handler[4] = buf;
    xpc_connection_set_event_handler(v7, handler);
    xpc_connection_resume(v8);
    xpc_object_t v9 = xpc_dictionary_create(0LL, 0LL, 0LL);
    xpc_dictionary_set_fd(v9, "fileDesc", a2);
    xpc_object_t v10 = xpc_connection_send_message_with_reply_sync(v8, v9);
    uint64_t v11 = v10;
    if (v10) {
      BOOL v12 = xpc_dictionary_get_BOOL(v10, "result");
    }
    else {
      BOOL v12 = 0LL;
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)double v50 = 67109120;
      LODWORD(v51) = v12;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "S5. helper service recieved back-channel payload write result: %d",  v50,  8u);
    }

    if (v11)
    {
      if (!v12)
      {
        if (xpc_get_type(v11) == (xpc_type_t)&_xpc_type_error)
        {
          string = xpc_dictionary_get_string(v11, _xpc_error_key_description);
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)double v50 = 136446210;
            double v51 = string;
            _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Got back-channel xpc error message: %{public}s\n",  v50,  0xCu);
          }

          NSErrorUserInfoKey v48 = NSLocalizedDescriptionKey;
          id v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", string));
          id v49 = v20;
          double v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v49,  &v48,  1LL));
          uint64_t v22 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"OSALog",  102LL,  v21));
          __int16 v23 = (void *)*((void *)v37 + 5);
          *((void *)v37 + 5) = v22;
        }

        else
        {
          uint64_t v14 = xpc_dictionary_get_string(v11, "error_desc");
          uint64_t v15 = xpc_dictionary_get_string(v11, "error_domain");
          uint64_t uint64 = xpc_dictionary_get_uint64(v11, "error_code");
          if (v15) {
            id v33 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  v15));
          }
          else {
            id v33 = @"OSALog";
          }
          NSErrorUserInfoKey v46 = NSLocalizedDescriptionKey;
          if (v14) {
            uint64_t v24 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  v14));
          }
          else {
            uint64_t v24 = @"<unknown>";
          }
          double v47 = v24;
          __int16 v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v47,  &v46,  1LL,  uint64));
          uint64_t v26 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v33,  v32,  v25));
          id v27 = (void *)*((void *)v37 + 5);
          *((void *)v37 + 5) = v26;

          if (v14) {
          if (v15)
          }

          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            id v28 = (const char *)*((void *)v37 + 5);
            *(_DWORD *)double v50 = 138412290;
            double v51 = v28;
            _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "non-xpc (via xpc) error: %@",  v50,  0xCu);
          }
        }
      }
    }

    else
    {
      NSErrorUserInfoKey v44 = NSLocalizedDescriptionKey;
      double v45 = @"no response from private datawriter request";
      id v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v45,  &v44,  1LL));
      uint64_t v17 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"OSALog",  103LL,  v16));
      uint64_t v18 = (void *)*((void *)v37 + 5);
      *((void *)v37 + 5) = v17;
    }
  }

  else
  {
    NSErrorUserInfoKey v42 = NSLocalizedDescriptionKey;
    uint64_t v43 = @"failed to create back-channel XPC connection";
    xpc_object_t v9 = (xpc_object_t)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v43,  &v42,  1LL));
    uint64_t v13 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"OSALog",  104LL,  v9));
    BOOL v12 = 0LL;
    uint64_t v11 = (void *)*((void *)v37 + 5);
    *((void *)v37 + 5) = v13;
  }

  int v29 = (void *)*((void *)v37 + 5);
  if (v29) {
    *a3 = v29;
  }
  _Block_object_dispose(buf, 8);

  return v12;
}

void sub_100010E88( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

uint64_t sub_100010EC0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_100010ED0(uint64_t a1)
{
}

void sub_100010ED8(uint64_t a1, void *a2)
{
  id v3 = a2;
  NSErrorUserInfoKey v4 = v3;
  if (v3 != &_xpc_error_connection_interrupted && xpc_get_type(v3) == (xpc_type_t)&_xpc_type_error)
  {
    string = xpc_dictionary_get_string(v4, _xpc_error_key_description);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446210;
      uint64_t v14 = string;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Got back-channel xpc error event: %{public}s\n",  buf,  0xCu);
    }

    id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  string,  NSLocalizedDescriptionKey));
    BOOL v12 = v6;
    __int16 v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v12,  &v11,  1LL));
    uint64_t v8 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"OSALog",  101LL,  v7));
    uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 8LL);
    xpc_object_t v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;
  }
}

void sub_1000111A8( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
}

void sub_1000111C8(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (xpc_get_type(v3) == (xpc_type_t)&_xpc_type_connection)
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472LL;
    v5[2] = sub_100011298;
    v5[3] = &unk_100021150;
    objc_copyWeak(&v7, (id *)(a1 + 32));
    id v4 = v3;
    id v6 = v4;
    xpc_connection_set_event_handler((xpc_connection_t)v4, v5);
    xpc_connection_resume((xpc_connection_t)v4);

    objc_destroyWeak(&v7);
  }
}

void sub_100011280(_Unwind_Exception *a1)
{
}

void sub_100011298(uint64_t a1, void *a2)
{
  xpc_object_t original = a2;
  if (xpc_get_type(original) == (xpc_type_t)&_xpc_type_dictionary)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    id v4 = objc_autoreleasePoolPush();
    xpc_object_t reply = xpc_dictionary_create_reply(original);
    uint64_t uint64 = xpc_dictionary_get_uint64(original, "operation");
    if (WeakRetained)
    {
      unsigned __int8 v7 = [WeakRetained serviceRequest:original forOperation:uint64 fromConnection:*(void *)(a1 + 32) forReply:reply];
      if (!reply) {
        goto LABEL_8;
      }
    }

    else
    {
      unsigned __int8 v7 = 0;
      if (!reply)
      {
LABEL_8:

        objc_autoreleasePoolPop(v4);
        goto LABEL_9;
      }
    }

    if (uint64 != 8)
    {
      xpc_dictionary_set_BOOL(reply, "result", v7);
      xpc_connection_send_message(*(xpc_connection_t *)(a1 + 32), reply);
    }

    goto LABEL_8;
  }

LABEL_9:
}

void sub_1000116D4( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

BOOL sub_100011704(void *a1)
{
  BOOL result = +[OSAXPCServices handleDefaultsRequestWithParams:forReply:]( &OBJC_CLASS___OSAXPCServices,  "handleDefaultsRequestWithParams:forReply:",  a1[4],  a1[5]);
  *(_BYTE *)(*(void *)(a1[6] + 8LL) + 24LL) = result;
  return result;
}

LABEL_38:
LABEL_39:
LABEL_43:

      return v9;
    case 4uLL:
      remote_connection = xpc_dictionary_get_remote_connection(v6);
      id v28 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue(remote_connection);
      int v29 = (void *)xpc_connection_copy_entitlement_value(v28, "com.apple.private.osanalytics.defaults.read-all.allow");
      id v30 = v29;
      if (v29 && xpc_get_type(v29) == (xpc_type_t)&_xpc_type_BOOL && xpc_BOOL_get_value(v30))
      {
        id v31 = objc_claimAutoreleasedReturnValue(-[NSUserDefaults dictionaryRepresentation](v8, "dictionaryRepresentation"));
        uint64_t v32 = (void *)v31;
        if (v6 && v31)
        {
          id v33 = ns2xpc(v31);
          id v34 = (void *)objc_claimAutoreleasedReturnValue(v33);
          xpc_dictionary_set_value(v6, "defaults_value", v34);
        }

        uint64_t v9 = 1;
      }

      else
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          sub_100015EB8(v28);
        }
        uint64_t v9 = 0;
      }

      goto LABEL_43;
    default:
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_100015E50();
      }
      uint64_t v9 = 0;
      goto LABEL_43;
  }

LABEL_33:
              if (v31) {
                goto LABEL_34;
              }
LABEL_39:
              id v28 = 0;
              goto LABEL_15;
            }

            int v29 = "Unable to handle bundle ID from XPC message";
          }

          else
          {
            int v29 = "Unable to convert stability parameters to NSDictionary";
          }
        }

        else
        {
          int v29 = "Missing stability parameters from XPC message";
        }

void sub_100011E70(uint64_t a1, BOOL a2)
{
}

void sub_10001272C(id a1)
{
  dispatch_semaphore_t v1 = dispatch_semaphore_create(1LL);
  time_t v2 = (void *)qword_100026280;
  qword_100026280 = (uint64_t)v1;

  qword_1000262B0 = CFAbsoluteTimeGetCurrent();
}

uint64_t sub_100012760(uint64_t a1, uint64_t a2, xpc_object_t xstring)
{
  unsigned int v5 = +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  xpc_string_get_string_ptr(xstring));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  unsigned __int8 v7 = *(void **)(a1 + 32);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", a2));
  [v7 setObject:v6 forKeyedSubscript:v8];

  return 1LL;
}

void *sub_1000127E0(uint64_t a1)
{
  if (snprintf(__str, 0x80uLL, "0x%llx", *(void *)(a1 + 40)) < 0)
  {
    __int128 v17 = xmmword_10001958C;
    __int128 v18 = unk_10001959C;
    __int128 v19 = xmmword_1000195AC;
    __int128 v20 = unk_1000195BC;
    *(_OWORD *)__str = *(_OWORD *)"<unknown>";
    __int128 v14 = unk_10001955C;
    __int128 v15 = xmmword_10001956C;
    __int128 v16 = unk_10001957C;
  }

  xpc_object_t v2 = xpc_dictionary_create(0LL, 0LL, 0LL);
  id v3 = v2;
  if (*(void *)(a1 + 48)) {
    id v4 = *(const char **)(a1 + 48);
  }
  else {
    id v4 = "<anonymous>";
  }
  xpc_dictionary_set_string(v2, "caller", v4);
  xpc_dictionary_set_uint64(v3, "latency", *(void *)(a1 + 56));
  xpc_dictionary_set_uint64(v3, "latency_outer", *(void *)(a1 + 64));
  xpc_dictionary_set_uint64(v3, "latency_inner", *(void *)(a1 + 72));
  xpc_dictionary_set_uint64(v3, "latency_prior", *(void *)(a1 + 80));
  xpc_dictionary_set_BOOL(v3, "result", *(_BYTE *)(a1 + 112));
  xpc_dictionary_set_uint64(v3, "size", *(void *)(a1 + 88));
  xpc_dictionary_set_uint64(v3, "size_adj", *(void *)(a1 + 96));
  unint64_t v5 = *(void *)(a1 + 104);
  if (v5)
  {
    uint64_t v6 = *(void *)(a1 + 88);
    int64_t v7 = v6 - v5;
    else {
      uint64_t v8 = v5 - v6;
    }
    unint64_t v9 = (v5 + 100 * v8 - 1) / v5;
    if (v7 >= 0) {
      int64_t v10 = v9;
    }
    else {
      int64_t v10 = -(uint64_t)v9;
    }
  }

  else
  {
    int64_t v10 = 0LL;
    int64_t v7 = 0LL;
  }

  xpc_dictionary_set_int64(v3, "size_deltapct", v10);
  xpc_dictionary_set_int64(v3, "size_delta", v7);
  xpc_dictionary_set_string(v3, "exception_code", __str);
  uint64_t v11 = *(void **)(a1 + 32);
  if (v11) {
    xpc_dictionary_set_BOOL(v3, "tasked", (BOOL)[v11 BOOLValue]);
  }
  return v3;
}

uint64_t sub_100012B74(uint64_t a1, uint64_t a2, xpc_object_t xstring)
{
  unint64_t v5 = +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  xpc_string_get_string_ptr(xstring));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  int64_t v7 = *(void **)(a1 + 32);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", a2));
  [v7 setObject:v6 forKeyedSubscript:v8];

  return 1LL;
}

void sub_100012CF0(void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
}

  ;
}

void sub_100012D08( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

uint64_t variable initialization expression of OSAJobQuiescenceMonitor.logger()
{
  uint64_t v0 = static OS_os_log.default.getter();
  return Logger.init(_:)(v0);
}

uint64_t static OSAJobQuiescenceMonitor.isAvailable()()
{
  if (&metaclass for JQXPCConnection) {
    BOOL v0 = &nominal type descriptor for JQXPCConnection == 0LL;
  }
  else {
    BOOL v0 = 1;
  }
  int v7 = v0
    || &type metadata for JQXPCConnection == 0LL
    || &type metadata accessor for JQXPCConnection == 0LL
    || &protocol witness table for JQXPCConnection == 0LL
    || &protocol conformance descriptor for JQXPCConnection == 0LL
    || &protocol conformance descriptor for JQXPCConnection == 0LL
    || &class metadata base offset for JQXPCConnection == 0LL;
  if (&nominal type descriptor for JQLaunchEventSubscription) {
    BOOL v8 = &type metadata for JQLaunchEventSubscription == 0LL;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8
    || &type metadata accessor for JQLaunchEventSubscription == 0LL
    || &class metadata base offset for JQLaunchEventSubscription == 0LL)
  {
    int v7 = 1;
  }

  if (&metaclass for JQTask) {
    BOOL v11 = &nominal type descriptor for JQTask == 0LL;
  }
  else {
    BOOL v11 = 1;
  }
  if (v11
    || &type metadata for JQTask == 0LL
    || &type metadata accessor for JQTask == 0LL
    || &class metadata base offset for JQTask == 0LL)
  {
    int v7 = 1;
  }

  if (&nominal type descriptor for JQTaskDescriptor) {
    BOOL v15 = &type metadata for JQTaskDescriptor == 0LL;
  }
  else {
    BOOL v15 = 1;
  }
  if (v15
    || &type metadata accessor for JQTaskDescriptor == 0LL
    || &protocol conformance descriptor for JQTaskDescriptor == 0LL
    || &protocol conformance descriptor for JQTaskDescriptor == 0LL)
  {
    int v7 = 1;
  }

  if (&nominal type descriptor for JQNotificationType) {
    BOOL v19 = &type metadata for JQNotificationType == 0LL;
  }
  else {
    BOOL v19 = 1;
  }
  int v25 = !v19
     && &type metadata accessor for JQNotificationType != 0LL
     && &protocol conformance descriptor for JQNotificationType != 0LL
     && &protocol conformance descriptor for JQNotificationType != 0LL
     && &protocol conformance descriptor for JQNotificationType != 0LL
     && &protocol conformance descriptor for JQNotificationType != 0LL;
  unsigned int v26 = v25 & ~v7;
  if (&nominal type descriptor for PostQuiesceActions) {
    BOOL v27 = &type metadata for PostQuiesceActions == 0LL;
  }
  else {
    BOOL v27 = 1;
  }
  if (v27
    || &type metadata accessor for PostQuiesceActions == 0LL
    || &protocol conformance descriptor for PostQuiesceActions == 0LL
    || &protocol conformance descriptor for PostQuiesceActions == 0LL
    || &protocol conformance descriptor for PostQuiesceActions == 0LL
    || &protocol conformance descriptor for PostQuiesceActions == 0LL
    || &protocol conformance descriptor for PostQuiesceActions == 0LL
    || &protocol conformance descriptor for PostQuiesceActions == 0LL
    || &protocol conformance descriptor for PostQuiesceActions == 0LL)
  {
    return 0LL;
  }

  else
  {
    return v26;
  }

id sub_100012F64()
{
  uint64_t v18 = type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency(0LL);
  uint64_t v1 = *(void *)(v18 - 8);
  __chkstk_darwin(v18);
  id v3 = (char *)&v18 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v4 = type metadata accessor for OS_dispatch_queue.Attributes(0LL);
  __chkstk_darwin(v4);
  uint64_t v6 = (char *)&v18 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v7 = type metadata accessor for DispatchQoS(0LL);
  __chkstk_darwin(v7);
  unint64_t v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  sub_10001511C(0LL, &qword_100026180, &OBJC_CLASS___OS_os_log_ptr);
  int64_t v10 = v0;
  uint64_t v11 = static OS_os_log.default.getter();
  Logger.init(_:)(v11);
  sub_10001511C(0LL, &qword_1000261E8, &OBJC_CLASS___OS_dispatch_queue_ptr);
  static DispatchQoS.utility.getter();
  __int128 v20 = &_swiftEmptyArrayStorage;
  uint64_t v12 = sub_100015154( &qword_1000261F0,  (uint64_t (*)(uint64_t))&type metadata accessor for OS_dispatch_queue.Attributes,  (uint64_t)&protocol conformance descriptor for OS_dispatch_queue.Attributes);
  uint64_t v13 = sub_100014F80(&qword_1000261F8);
  uint64_t v14 = sub_100015194(&qword_100026200, &qword_1000261F8);
  dispatch thunk of SetAlgebra.init<A>(_:)(&v20, v13, v14, v4, v12);
  (*(void (**)(char *, void, uint64_t))(v1 + 104))( v3,  enum case for OS_dispatch_queue.AutoreleaseFrequency.workItem(_:),  v18);
  *(void *)&v10[OBJC_IVAR____TtC17osanalyticshelper23OSAJobQuiescenceMonitor_queue] = OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)( 0xD000000000000030LL,  0x800000010001CC50LL,  v9,  v6,  v3,  0LL);

  BOOL v15 = (objc_class *)type metadata accessor for OSAJobQuiescenceMonitor(0LL);
  v19.receiver = v10;
  v19.super_class = v15;
  id v16 = objc_msgSendSuper2(&v19, "init");
  sub_1000141BC();

  return v16;
}

uint64_t sub_1000131CC()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for Logger(0LL);
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = ((uint64_t (*)(void))__chkstk_darwin)();
  id v75 = (char *)&v71 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v6 = __chkstk_darwin(v4);
  double v74 = (char *)&v71 - v7;
  uint64_t v8 = __chkstk_darwin(v6);
  uint64_t v72 = (char *)&v71 - v9;
  uint64_t v10 = __chkstk_darwin(v8);
  uint64_t v73 = (char *)&v71 - v11;
  uint64_t v12 = __chkstk_darwin(v10);
  uint64_t v14 = (char *)&v71 - v13;
  uint64_t v15 = __chkstk_darwin(v12);
  __int128 v17 = (char *)&v71 - v16;
  uint64_t v18 = __chkstk_darwin(v15);
  __int128 v20 = (char *)&v71 - v19;
  __chkstk_darwin(v18);
  uint64_t v22 = (char *)&v71 - v21;
  uint64_t v23 = v1 + OBJC_IVAR____TtC17osanalyticshelper23OSAJobQuiescenceMonitor_logger;
  uint64_t v24 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v3 + 16);
  uint64_t v25 = v24((char *)&v71 - v21, v23, v2);
  unsigned int v26 = (os_log_s *)Logger.logObject.getter(v25);
  os_log_type_t v27 = static os_log_type_t.default.getter();
  BOOL v28 = os_log_type_enabled(v26, v27);
  id v76 = v24;
  if (v28)
  {
    int v29 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
    *(_WORD *)int v29 = 0;
    _os_log_impl((void *)&_mh_execute_header, v26, v27, "Syncing and submitting logs", v29, 2u);
    id v30 = v29;
    uint64_t v24 = v76;
    swift_slowDealloc(v30, -1LL, -1LL);
  }

  id v31 = *(void (**)(char *, uint64_t))(v3 + 8);
  v31(v22, v2);
  uint64_t v32 = v24(v20, v23, v2);
  id v33 = (os_log_s *)Logger.logObject.getter(v32);
  os_log_type_t v34 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v33, v34))
  {
    id v35 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
    *(_WORD *)id v35 = 0;
    _os_log_impl((void *)&_mh_execute_header, v33, v34, "Attempting rollover of CoreAnalytics log", v35, 2u);
    id v36 = v35;
    uint64_t v24 = v76;
    swift_slowDealloc(v36, -1LL, -1LL);
  }

  uint64_t v37 = ((uint64_t (*)(char *, uint64_t))v31)(v20, v2);
  int v38 = AnalyticsRolloverEvents(v37);
  if (!v38)
  {
    uint64_t v43 = v24(v14, v23, v2);
    id v40 = (os_log_s *)Logger.logObject.getter(v43);
    os_log_type_t v44 = static os_log_type_t.error.getter();
    if (!os_log_type_enabled(v40, v44)) {
      goto LABEL_12;
    }
    NSErrorUserInfoKey v42 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
    *(_WORD *)NSErrorUserInfoKey v42 = 0;
    _os_log_impl((void *)&_mh_execute_header, v40, v44, "Failed to rollover CoreAnalytics log", v42, 2u);
    goto LABEL_10;
  }

  uint64_t v39 = v24(v17, v23, v2);
  id v40 = (os_log_s *)Logger.logObject.getter(v39);
  os_log_type_t v41 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v40, v41))
  {
    NSErrorUserInfoKey v42 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
    *(_WORD *)NSErrorUserInfoKey v42 = 0;
    _os_log_impl((void *)&_mh_execute_header, v40, v41, "Successful CoreAnalytics log rollover", v42, 2u);
    uint64_t v14 = v17;
LABEL_10:
    swift_slowDealloc(v42, -1LL, -1LL);
    goto LABEL_12;
  }

  uint64_t v14 = v17;
LABEL_12:
  double v45 = v73;

  v31(v14, v2);
  uint64_t v46 = v24(v45, v23, v2);
  double v47 = (os_log_s *)Logger.logObject.getter(v46);
  os_log_type_t v48 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v47, v48))
  {
    id v49 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
    *(_WORD *)id v49 = 0;
    _os_log_impl((void *)&_mh_execute_header, v47, v48, "Attempting submission of logs", v49, 2u);
    double v50 = v49;
    uint64_t v24 = v76;
    swift_slowDealloc(v50, -1LL, -1LL);
  }

  v31(v45, v2);
  id v51 = [objc_allocWithZone(OSASubmissionClient) init];
  unsigned int v52 = [v51 submit];

  uint64_t v53 = v74;
  if (!v52)
  {
    uint64_t v58 = v24(v74, v23, v2);
    v55 = (os_log_s *)Logger.logObject.getter(v58);
    os_log_type_t v59 = static os_log_type_t.error.getter();
    if (!os_log_type_enabled(v55, v59))
    {
LABEL_20:
      uint64_t v60 = v75;
      goto LABEL_22;
    }

    double v57 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
    *(_WORD *)double v57 = 0;
    _os_log_impl((void *)&_mh_execute_header, v55, v59, "Failed to submit logs", v57, 2u);
LABEL_19:
    swift_slowDealloc(v57, -1LL, -1LL);
    goto LABEL_20;
  }

  uint64_t v53 = v72;
  uint64_t v54 = v24(v72, v23, v2);
  v55 = (os_log_s *)Logger.logObject.getter(v54);
  os_log_type_t v56 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v55, v56))
  {
    double v57 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
    *(_WORD *)double v57 = 0;
    _os_log_impl((void *)&_mh_execute_header, v55, v56, "Logs submitted successfully", v57, 2u);
    uint64_t v24 = v76;
    goto LABEL_19;
  }

  uint64_t v60 = v75;
  uint64_t v24 = v76;
LABEL_22:

  v31(v53, v2);
  uint64_t v61 = v24(v60, v23, v2);
  id v62 = (os_log_s *)Logger.logObject.getter(v61);
  os_log_type_t v63 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v62, v63))
  {
    uint64_t v64 = swift_slowAlloc(22LL, -1LL);
    uint64_t v65 = swift_slowAlloc(64LL, -1LL);
    uint64_t v78 = v65;
    *(_DWORD *)uint64_t v64 = 136446466;
    if (v38) {
      uint64_t v66 = 1702195828LL;
    }
    else {
      uint64_t v66 = 0x65736C6166LL;
    }
    id v76 = (uint64_t (*)(char *, uint64_t, uint64_t))v31;
    if (v38) {
      unint64_t v67 = 0xE400000000000000LL;
    }
    else {
      unint64_t v67 = 0xE500000000000000LL;
    }
    uint64_t v77 = sub_1000145F4(v66, v67, &v78);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v77, &v78, v64 + 4, v64 + 12);
    swift_bridgeObjectRelease(v67);
    *(_WORD *)(v64 + 12) = 2082;
    if (v52) {
      uint64_t v68 = 1702195828LL;
    }
    else {
      uint64_t v68 = 0x65736C6166LL;
    }
    if (v52) {
      unint64_t v69 = 0xE400000000000000LL;
    }
    else {
      unint64_t v69 = 0xE500000000000000LL;
    }
    uint64_t v77 = sub_1000145F4(v68, v69, &v78);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v77, &v78, v64 + 14, v64 + 22);
    swift_bridgeObjectRelease(v69);
    _os_log_impl( (void *)&_mh_execute_header,  v62,  v63,  "Completed sync and submission of logs (rollover: %{public}s, submission: %{public}s)",  (uint8_t *)v64,  0x16u);
    swift_arrayDestroy(v65, 2LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v65, -1LL, -1LL);
    swift_slowDealloc(v64, -1LL, -1LL);

    return ((uint64_t (*)(char *, uint64_t))v76)(v75, v2);
  }

  else
  {

    return ((uint64_t (*)(char *, uint64_t))v31)(v60, v2);
  }

void sub_1000138E4()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for DispatchWorkItemFlags(0LL);
  uint64_t v54 = *(void *)(v2 - 8);
  uint64_t v55 = v2;
  __chkstk_darwin(v2);
  uint64_t v53 = (char *)&v51 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v4 = type metadata accessor for DispatchQoS(0LL);
  uint64_t v51 = *(void *)(v4 - 8);
  uint64_t v52 = v4;
  __chkstk_darwin(v4);
  uint64_t v6 = (char *)&v51 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v7 = type metadata accessor for Logger(0LL);
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = __chkstk_darwin(v7);
  os_log_type_t v56 = (char *)&v51 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v9);
  uint64_t v12 = (char *)&v51 - v11;
  uint64_t v13 = type metadata accessor for PostQuiesceActions(0LL);
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v15 = __chkstk_darwin(v13);
  __int128 v17 = (char *)&v51 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  static PostQuiesceActions.shutdown.getter(v15);
  unint64_t v18 = sub_100014FC0();
  char v19 = dispatch thunk of SetAlgebra.isSuperset(of:)(v17, v13, v18);
  (*(void (**)(char *, uint64_t))(v14 + 8))(v17, v13);
  if ((v19 & 1) != 0
    || (id v20 = [(id)objc_opt_self(NSUserDefaults) standardUserDefaults],
        NSString v21 = String._bridgeToObjectiveC()(),
        unsigned int v22 = [v20 BOOLForKey:v21],
        v20,
        v21,
        v22))
  {
    uint64_t v23 = (*(uint64_t (**)(char *, char *, uint64_t))(v8 + 16))( v12,  &v1[OBJC_IVAR____TtC17osanalyticshelper23OSAJobQuiescenceMonitor_logger],  v7);
    uint64_t v24 = (os_log_s *)Logger.logObject.getter(v23);
    os_log_type_t v25 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v24, v25))
    {
      unsigned int v26 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
      *(_WORD *)unsigned int v26 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v24,  v25,  "Quiesce request accepted. Queueing quiescence tasks.",  v26,  2u);
      swift_slowDealloc(v26, -1LL, -1LL);
    }

    (*(void (**)(char *, uint64_t))(v8 + 8))(v12, v7);
    uint64_t v27 = type metadata accessor for JQXPCConnection(0LL);
    swift_allocObject(v27, *(unsigned int *)(v27 + 48), *(unsigned __int16 *)(v27 + 52));
    uint64_t v28 = JQXPCConnection.init()();
    uint64_t v29 = swift_allocObject(&unk_100021308, 24LL, 7LL);
    *(void *)(v29 + 16) = 0LL;
    uint64_t v30 = type metadata accessor for JQTaskDescriptor(0LL);
    __chkstk_darwin(v30);
    uint64_t v32 = (char *)&v51 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0LL);
    swift_retain(v28);
    uint64_t v33 = getpid();
    JQTaskDescriptor.init(name:pid:duration:jobGroup:)( 0xD000000000000011LL,  0x800000010001C9E0LL,  v33,  0LL,  1LL,  0LL,  0LL);
    uint64_t v34 = type metadata accessor for JQTask(0LL);
    swift_allocObject(v34, *(unsigned int *)(v34 + 48), *(unsigned __int16 *)(v34 + 52));
    uint64_t v35 = JQTask.init(conn:description:)(v28, v32);
    *(void *)(v29 + 16) = v35;
    if (v35)
    {
      uint64_t v36 = v35;
      uint64_t v37 = swift_retain(v35);
      dispatch thunk of JQTask.begin()(v37);
      swift_release(v36);
      int v38 = *(void **)&v1[OBJC_IVAR____TtC17osanalyticshelper23OSAJobQuiescenceMonitor_queue];
      uint64_t v39 = swift_allocObject(&unk_100021330, 32LL, 7LL);
      *(void *)(v39 + 16) = v1;
      *(void *)(v39 + 24) = v29;
      aBlock[4] = sub_100015058;
      uint64_t v59 = v39;
      aBlock[0] = _NSConcreteStackBlock;
      aBlock[1] = 1107296256LL;
      aBlock[2] = sub_100014190;
      aBlock[3] = &unk_100021348;
      id v40 = _Block_copy(aBlock);
      id v41 = v38;
      NSErrorUserInfoKey v42 = v1;
      uint64_t v43 = swift_retain(v29);
      static DispatchQoS.unspecified.getter(v43);
      double v57 = &_swiftEmptyArrayStorage;
      uint64_t v44 = sub_100015154( &qword_1000261C8,  (uint64_t (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags,  (uint64_t)&protocol conformance descriptor for DispatchWorkItemFlags);
      uint64_t v45 = sub_100014F80(&qword_1000261D0);
      uint64_t v46 = sub_100015194(&qword_1000261D8, &qword_1000261D0);
      uint64_t v47 = v28;
      os_log_type_t v48 = v53;
      uint64_t v49 = v55;
      dispatch thunk of SetAlgebra.init<A>(_:)(&v57, v45, v46, v55, v44);
      OS_dispatch_queue.async(group:qos:flags:execute:)(0LL, v6, v48, v40);
      _Block_release(v40);
      swift_release(v47);

      (*(void (**)(char *, uint64_t))(v54 + 8))(v48, v49);
      (*(void (**)(char *, uint64_t))(v51 + 8))(v6, v52);
      uint64_t v50 = v59;
      swift_release(v29);
      swift_release(v50);
    }

    else
    {
      __break(1u);
    }
  }

uint64_t sub_100013F80(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for Logger(0LL);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = __chkstk_darwin(v4);
  uint64_t v8 = &v28[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL) - 8];
  __chkstk_darwin(v6);
  uint64_t v10 = &v28[-v9 - 8];
  uint64_t v11 = a1 + OBJC_IVAR____TtC17osanalyticshelper23OSAJobQuiescenceMonitor_logger;
  uint64_t v12 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v5 + 16);
  uint64_t v13 = v12(&v28[-v9 - 8], a1 + OBJC_IVAR____TtC17osanalyticshelper23OSAJobQuiescenceMonitor_logger, v4);
  uint64_t v14 = (os_log_s *)Logger.logObject.getter(v13);
  os_log_type_t v15 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v14, v15))
  {
    uint64_t v16 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
    uint64_t v27 = a2;
    __int128 v17 = v16;
    *(_WORD *)uint64_t v16 = 0;
    _os_log_impl((void *)&_mh_execute_header, v14, v15, "Beginning quiescence task", v16, 2u);
    a2 = v27;
    swift_slowDealloc(v17, -1LL, -1LL);
  }

  unint64_t v18 = (void *)(a2 + 16);

  char v19 = *(void (**)(char *, uint64_t))(v5 + 8);
  v19(v10, v4);
  sub_1000131CC();
  uint64_t v20 = v12(v8, v11, v4);
  NSString v21 = (os_log_s *)Logger.logObject.getter(v20);
  os_log_type_t v22 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v21, v22))
  {
    uint64_t v23 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
    *(_WORD *)uint64_t v23 = 0;
    _os_log_impl((void *)&_mh_execute_header, v21, v22, "Completed quiescence task", v23, 2u);
    swift_slowDealloc(v23, -1LL, -1LL);
  }

  v19(v8, v4);
  uint64_t result = swift_beginAccess(v18, v28, 0LL, 0LL);
  uint64_t v25 = *v18;
  if (*v18)
  {
    uint64_t v26 = swift_retain(*v18);
    dispatch thunk of JQTask.end()(v26);
    return swift_release(v25);
  }

  return result;
}

uint64_t sub_100014190(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = swift_retain(v2);
  v1(v3);
  return swift_release(v2);
}

void sub_1000141BC()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for Logger(0LL);
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = __chkstk_darwin(v2);
  __chkstk_darwin(v4);
  uint64_t v6 = (char *)&v17 - v5;
  uint64_t v7 = (*(uint64_t (**)(char *, char *, uint64_t))(v3 + 16))( (char *)&v17 - v5,  &v1[OBJC_IVAR____TtC17osanalyticshelper23OSAJobQuiescenceMonitor_logger],  v2);
  uint64_t v8 = (os_log_s *)Logger.logObject.getter(v7);
  os_log_type_t v9 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v8, v9))
  {
    uint64_t v10 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
    *(_WORD *)uint64_t v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, v9, "Starting JobQuiescence monitor", v10, 2u);
    swift_slowDealloc(v10, -1LL, -1LL);
  }

  (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v2);
  id v11 = objc_allocWithZone((Class)type metadata accessor for JQLaunchEventSubscription(0LL));
  uint64_t v12 = (void *)JQLaunchEventSubscription.init(subscriptionName:subscriberName:)( 0xD000000000000023LL,  0x800000010001C980LL,  0xD000000000000011LL,  0x80000001000195C0LL);
  uint64_t v13 = *(void **)&v1[OBJC_IVAR____TtC17osanalyticshelper23OSAJobQuiescenceMonitor_queue];
  uint64_t v14 = swift_allocObject(&unk_1000212E0, 24LL, 7LL);
  *(void *)(v14 + 16) = v1;
  id v15 = v13;
  uint64_t v16 = v1;
  dispatch thunk of JQLaunchEventSubscription.register(on:for:notification:)(v15, 0LL, 0LL, sub_100014F5C, v14);

  swift_release(v14);
}

id OSAJobQuiescenceMonitor.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for OSAJobQuiescenceMonitor(0LL);
  return objc_msgSendSuper2(&v2, "dealloc");
}

id sub_1000145C4()
{
  id result = [objc_allocWithZone((Class)type metadata accessor for OSAJobQuiescenceMonitor(0)) init];
  qword_1000262C0 = (uint64_t)result;
  return result;
}

uint64_t sub_1000145F4(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_1000146C4(v12, 0LL, 0LL, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_1000150DC((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }

  else
  {
    ObjectType = &type metadata for _StringGuts;
    v12[0] = a1;
    v12[1] = a2;
    uint64_t v10 = *a3;
    if (*a3)
    {
      sub_1000150DC((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }

    swift_bridgeObjectRetain(a2);
  }

  sub_1000150BC(v12);
  return v7;
}

uint64_t sub_1000146C4(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
    uint64_t result = sub_10001487C(a5, a6);
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

LABEL_5:
  *a1 = v8;
  if ((a6 & 0x8000000000000000LL) != 0) {
    return 0LL;
  }
  else {
    return swift_unknownObjectRetain(a6 & 0xFFFFFFFFFFFFFFFLL, __dst);
  }
}

uint64_t sub_10001487C(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_100014910(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_100014AE8(0, *(void *)(v2 + 16) + 1LL, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_100014AE8(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_100014910(uint64_t a1, unint64_t a2)
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
      uint64_t v5 = sub_100014A84(v4, 0LL);
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

void *sub_100014A84(uint64_t a1, uint64_t a2)
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
  uint64_t v4 = sub_100014F80(&qword_1000261E0);
  uint64_t v5 = (void *)swift_allocObject(v4, v2 + 32, 7LL);
  size_t v6 = j__malloc_size(v5);
  v5[2] = a1;
  v5[3] = 2 * v6 - 64;
  return v5;
}

uint64_t sub_100014AE8(char a1, int64_t a2, char a3, char *a4)
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
    uint64_t v10 = sub_100014F80(&qword_1000261E0);
    id v11 = (char *)swift_allocObject(v10, v9 + 32, 7LL);
    size_t v12 = j__malloc_size(v11);
    *((void *)v11 + 2) = v8;
    *((void *)v11 + 3) = 2 * v12 - 64;
  }

  else
  {
    id v11 = (char *)&_swiftEmptyArrayStorage;
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

uint64_t _s17osanalyticshelper23OSAJobQuiescenceMonitorC14sharedInstanceACSgvgZ_0()
{
  uint64_t v0 = 0LL;
  if (&metaclass for JQXPCConnection) {
    BOOL v1 = &nominal type descriptor for JQXPCConnection == 0LL;
  }
  else {
    BOOL v1 = 1;
  }
  char v8 = v1
    || &type metadata for JQXPCConnection == 0LL
    || &type metadata accessor for JQXPCConnection == 0LL
    || &protocol witness table for JQXPCConnection == 0LL
    || &protocol conformance descriptor for JQXPCConnection == 0LL
    || &protocol conformance descriptor for JQXPCConnection == 0LL
    || &class metadata base offset for JQXPCConnection == 0LL;
  if (&nominal type descriptor for JQLaunchEventSubscription) {
    BOOL v9 = &type metadata for JQLaunchEventSubscription == 0LL;
  }
  else {
    BOOL v9 = 1;
  }
  if (v9
    || &type metadata accessor for JQLaunchEventSubscription == 0LL
    || &class metadata base offset for JQLaunchEventSubscription == 0LL)
  {
    char v12 = 1;
  }

  else
  {
    char v12 = v8;
  }

  if (&metaclass for JQTask) {
    BOOL v13 = &nominal type descriptor for JQTask == 0LL;
  }
  else {
    BOOL v13 = 1;
  }
  if (v13
    || &type metadata for JQTask == 0LL
    || &type metadata accessor for JQTask == 0LL
    || &class metadata base offset for JQTask == 0LL)
  {
    char v12 = 1;
  }

  if (&nominal type descriptor for JQTaskDescriptor) {
    BOOL v17 = &type metadata for JQTaskDescriptor == 0LL;
  }
  else {
    BOOL v17 = 1;
  }
  if (v17
    || &type metadata accessor for JQTaskDescriptor == 0LL
    || &protocol conformance descriptor for JQTaskDescriptor == 0LL
    || &protocol conformance descriptor for JQTaskDescriptor == 0LL)
  {
    char v12 = 1;
  }

  if ((v12 & 1) == 0)
  {
    BOOL v21 = !&protocol conformance descriptor for JQNotificationType
       || &protocol conformance descriptor for JQNotificationType == 0LL;
    BOOL v22 = v21 || &protocol conformance descriptor for JQNotificationType == 0LL;
    BOOL v23 = v22 || &protocol conformance descriptor for JQNotificationType == 0LL;
    BOOL v24 = v23 || &type metadata accessor for JQNotificationType == 0LL;
    BOOL v25 = v24 || &type metadata for JQNotificationType == 0LL;
    if (!v25 && &nominal type descriptor for JQNotificationType != 0LL)
    {
      BOOL v27 = !&nominal type descriptor for PostQuiesceActions || &type metadata for PostQuiesceActions == 0LL;
      BOOL v28 = v27 || &type metadata accessor for PostQuiesceActions == 0LL;
      BOOL v29 = v28 || &protocol conformance descriptor for PostQuiesceActions == 0LL;
      BOOL v30 = v29 || &protocol conformance descriptor for PostQuiesceActions == 0LL;
      BOOL v31 = v30 || &protocol conformance descriptor for PostQuiesceActions == 0LL;
      BOOL v32 = v31 || &protocol conformance descriptor for PostQuiesceActions == 0LL;
      BOOL v33 = v32 || &protocol conformance descriptor for PostQuiesceActions == 0LL;
      BOOL v34 = v33 || &protocol conformance descriptor for PostQuiesceActions == 0LL;
      if (!v34 && &protocol conformance descriptor for PostQuiesceActions != 0LL)
      {
        if (qword_1000262B8 != -1) {
          swift_once(&qword_1000262B8, sub_1000145C4);
        }
        uint64_t v0 = qword_1000262C0;
        id v36 = (id)qword_1000262C0;
      }
    }
  }

  return v0;
}

uint64_t type metadata accessor for OSAJobQuiescenceMonitor(uint64_t a1)
{
  uint64_t result = qword_1000262D0;
  if (!qword_1000262D0) {
    return swift_getSingletonMetadata(a1, &nominal type descriptor for OSAJobQuiescenceMonitor);
  }
  return result;
}

uint64_t sub_100014EB4()
{
  return type metadata accessor for OSAJobQuiescenceMonitor(0LL);
}

uint64_t sub_100014EBC(uint64_t a1)
{
  v4[0] = (char *)&value witness table for Builtin.UnknownObject + 64;
  uint64_t result = type metadata accessor for Logger(319LL);
  if (v3 <= 0x3F)
  {
    v4[1] = *(void *)(result - 8) + 64LL;
    uint64_t result = swift_updateClassMetadata2(a1, 256LL, 2LL, v4, a1 + 80);
    if (!result) {
      return 0LL;
    }
  }

  return result;
}

uint64_t sub_100014F38()
{
  return swift_deallocObject(v0, 24LL, 7LL);
}

void sub_100014F5C()
{
}

uint64_t sub_100014F80(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2((char *)a1 + (int)result, -(result >> 32), 0LL, 0LL);
    *a1 = result;
  }

  return result;
}

unint64_t sub_100014FC0()
{
  unint64_t result = qword_1000261C0;
  if (!qword_1000261C0)
  {
    uint64_t v1 = type metadata accessor for PostQuiesceActions(255LL);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for PostQuiesceActions, v1);
    atomic_store(result, (unint64_t *)&qword_1000261C0);
  }

  return result;
}

uint64_t sub_100015008()
{
  return swift_deallocObject(v0, 24LL, 7LL);
}

uint64_t sub_10001502C()
{
  swift_release(*(void *)(v0 + 24));
  return swift_deallocObject(v0, 32LL, 7LL);
}

uint64_t sub_100015058()
{
  return sub_100013F80(*(void *)(v0 + 16), *(void *)(v0 + 24));
}

uint64_t sub_100015060(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_100015070(uint64_t a1)
{
  return swift_release(*(void *)(a1 + 40));
}

uint64_t sub_100015078(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2( 255LL,  (char *)a1 + (int)result,  -(result >> 32),  0LL,  0LL);
    *a1 = result;
  }

  return result;
}

uint64_t sub_1000150BC(void *a1)
{
  uint64_t v1 = *(void *)(a1[3] - 8LL);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0) {
    return swift_release(*a1);
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_1000150DC(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_10001511C(uint64_t a1, unint64_t *a2, void *a3)
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

uint64_t sub_100015154(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
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

uint64_t sub_100015194(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    uint64_t v4 = sub_100015078(a2);
    uint64_t result = swift_getWitnessTable(&protocol conformance descriptor for [A], v4);
    atomic_store(result, a1);
  }

  return result;
}

void sub_1000151D4( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100015208( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10001523C( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100015270( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000152A4( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000152D8( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10001530C(void *a1, uint8_t *buf)
{
  *(_DWORD *)buf = 138412290;
  *(void *)(buf + 4) = a1;
  _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "HighEngagement: Error querying knowledge store: %@",  buf,  0xCu);
}

void sub_100015364( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000153D4()
{
}

void sub_100015438()
{
}

void sub_10001549C()
{
}

void sub_100015500()
{
  uint64_t v2 = 0LL;
  _os_log_error_impl( (void *)&_mh_execute_header,  v0,  OS_LOG_TYPE_ERROR,  "Rollback recommendation failed for %{public}@: %{public}@",  v1,  0x16u);
  sub_10000DB48();
}

void sub_100015570()
{
}

void sub_1000155D4( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10001563C()
{
  uint64_t v3 = v0;
  _os_log_debug_impl( (void *)&_mh_execute_header,  v1,  OS_LOG_TYPE_DEBUG,  "Retrieved baseline values: crash count=%{public}@; uptime=%{public}@",
    v2,
    0x16u);
  sub_10000DB48();
}

void sub_1000156B0(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Error retrieving baseline values.", v1, 2u);
}

void sub_1000156F0( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100015754( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000157B8( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10001581C(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_debug_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_DEBUG,  "The stability monitor is not available on this platform.",  v1,  2u);
}

void sub_10001585C(void *a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([a1 stringValue]);
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([a1 endDate]);
  sub_10000DB50();
  sub_10000DB70( (void *)&_mh_execute_header,  v4,  v5,  "Clamping end date for %{public}@ from %{public}@ to %{public}@",  v6,  v7,  v8,  v9,  v10);

  sub_10000DB84();
}

void sub_1000158FC(void *a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([a1 stringValue]);
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([a1 startDate]);
  sub_10000DB50();
  sub_10000DB70( (void *)&_mh_execute_header,  v4,  v5,  "Clamping start date for %{public}@ from %{public}@ to %{public}@",  v6,  v7,  v8,  v9,  v10);

  sub_10000DB84();
}

void sub_10001599C(void *a1)
{
}

void sub_100015A0C(void *a1, os_log_s *a2)
{
  v3[0] = 67109378;
  v3[1] = [a1 processIdentifier];
  __int16 v4 = 2114;
  uint64_t v5 = @"com.apple.osanalytics.canusediagnosticmonitor";
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "Adding client connection from pid %d which lacks entitlement %{public}@ -- observer registration attempts will fail.",  (uint8_t *)v3,  0x12u);
}

void sub_100015AA8(uint64_t a1)
{
}

void sub_100015B1C(uint64_t *a1)
{
  uint64_t v1 = *a1;
  int v2 = 138412290;
  uint64_t v3 = v1;
  _os_log_debug_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEBUG,  "initial xfer-counts %@",  (uint8_t *)&v2,  0xCu);
}

void sub_100015B9C()
{
  uint64_t v0 = objc_autoreleasePoolPush();
  uint64_t v1 = objc_alloc_init(&OBJC_CLASS___OSAXPCServices);
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v9 = 0;
    sub_10000FF6C( (void *)&_mh_execute_header,  (os_log_s *)&_os_log_default,  v2,  "instantiating the diagnostic monitor server",  v9);
  }

  id v3 = +[OSADiagnosticMonitorServer sharedInstance](&OBJC_CLASS___OSADiagnosticMonitorServer, "sharedInstance");
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint8_t v10 = 0;
    sub_10000FF6C( (void *)&_mh_execute_header,  (os_log_s *)&_os_log_default,  v4,  "instantiating the job quiescence monitor server if available",  v10);
  }

  id v5 =  +[OSAJobQuiescenceMonitor sharedInstance]( &OBJC_CLASS____TtC17osanalyticshelper23OSAJobQuiescenceMonitor,  "sharedInstance");
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[OSASystemConfiguration sharedInstance](&OBJC_CLASS___OSASystemConfiguration, "sharedInstance"));
  id v7 = [v6 pathSubmissionSubdirDiagnosticLogs];

  if ((OSAIsRSDDisplay() & 1) == 0) {
    +[OSASubmissionScheduler scheduleSubmission](&OBJC_CLASS___OSASubmissionScheduler, "scheduleSubmission");
  }
  +[OSASubmissionScheduler scheduleCleanupWithHomeDirectory:]( &OBJC_CLASS___OSASubmissionScheduler,  "scheduleCleanupWithHomeDirectory:",  0LL);
  sub_10000FBC0();
  objc_autoreleasePoolPop(v0);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop currentRunLoop](&OBJC_CLASS___NSRunLoop, "currentRunLoop"));
  [v8 run];

  __assert_rtn("main", "main.m", 160, "false");
}

void sub_100015CE4()
{
  *(_WORD *)uint64_t v0 = 0;
  _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "Unsupported arguments passed. Exiting..",  v0,  2u);
}

void sub_100015D28( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100015D9C()
{
}

void sub_100015E10(uint64_t a1, int a2, uint64_t a3)
{
  *(_DWORD *)a1 = 67109120;
  *(_DWORD *)(a1 + 4) = a2;
  sub_100012CF0( (void *)&_mh_execute_header,  (os_log_s *)&_os_log_default,  a3,  "Client (%d) is not entitled to read/write defaults.",  (uint8_t *)a1);
}

void sub_100015E50()
{
}

void sub_100015EB8(_xpc_connection_s *a1)
{
  v2[0] = 67109120;
  v2[1] = xpc_connection_get_pid(a1);
  sub_100012CF0( (void *)&_mh_execute_header,  (os_log_s *)&_os_log_default,  v1,  "Client (%d) is not entitled to read/write all defaults.",  (uint8_t *)v2);
}

void sub_100015F30(_xpc_connection_s *a1, os_log_s *a2)
{
  v4[0] = 67109120;
  v4[1] = xpc_connection_get_pid(a1);
  sub_100012CF0( (void *)&_mh_execute_header,  a2,  v3,  "Client (%d) is not entitled to run the stability monitor.",  (uint8_t *)v4);
  sub_10000DB48();
}

void sub_100015FAC()
{
  __int16 v3 = 2081;
  uint64_t v4 = v0;
  _os_log_error_impl( (void *)&_mh_execute_header,  v1,  OS_LOG_TYPE_ERROR,  "Error handling XPC request to run stability monitor: %{public}s. Request: %{private}s",  v2,  0x16u);
  sub_10000DB48();
}

void sub_100016028()
{
}

void sub_100016090(double a1)
{
  int v1 = 134218496;
  double v2 = a1;
  __int16 v3 = 1024;
  int v4 = dword_1000262A8;
  __int16 v5 = 2048;
  double v6 = CFAbsoluteTimeGetCurrent() - *(double *)&qword_1000262B0;
  _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "ReportCrash.Stackshot seems to be wedged (for %.2f secs); aborting after %u requests and %.1f secs",
    (uint8_t *)&v1,
    0x1Cu);
}

id objc_msgSend_CA(void *a1, const char *a2, ...)
{
  return _[a1 CA];
}

id objc_msgSend_Crash(void *a1, const char *a2, ...)
{
  return _[a1 Crash];
}

id objc_msgSend_HighEngagementDevices(void *a1, const char *a2, ...)
{
  return _[a1 HighEngagementDevices];
}

id objc_msgSend_MTBF(void *a1, const char *a2, ...)
{
  return _[a1 MTBF];
}

id objc_msgSend_OSAnalytics(void *a1, const char *a2, ...)
{
  return _[a1 OSAnalytics];
}

id objc_msgSend_Stability(void *a1, const char *a2, ...)
{
  return _[a1 Stability];
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return _[a1 UTF8String];
}

id objc_msgSend__DHIDto95thPercentile(void *a1, const char *a2, ...)
{
  return _[a1 _DHIDto95thPercentile];
}

id objc_msgSend__DHIDtoCategoryDisplayNameMap(void *a1, const char *a2, ...)
{
  return _[a1 _DHIDtoCategoryDisplayNameMap];
}

id objc_msgSend__OverrideIfNeeded_givenCategory_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_OverrideIfNeeded:givenCategory:");
}

id objc_msgSend__setQueue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setQueue:");
}

id objc_msgSend_acquireJetsamData(void *a1, const char *a2, ...)
{
  return _[a1 acquireJetsamData];
}

id objc_msgSend_acquireStackshot(void *a1, const char *a2, ...)
{
  return _[a1 acquireStackshot];
}

id objc_msgSend_addDouble_forKey_onDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addDouble:forKey:onDate:");
}

id objc_msgSend_addEntriesFromDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addEntriesFromDictionary:");
}

id objc_msgSend_addEvent_withBundleID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addEvent:withBundleID:");
}

id objc_msgSend_addNotes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addNotes:");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObject:");
}

id objc_msgSend_addObjectsFromArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObjectsFromArray:");
}

id objc_msgSend_addUnsignedInteger_forKey_onDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addUnsignedInteger:forKey:onDate:");
}

id objc_msgSend_aggregatedTotalsAsDouble(void *a1, const char *a2, ...)
{
  return _[a1 aggregatedTotalsAsDouble];
}

id objc_msgSend_aggregatedTotalsAsUnsignedInteger(void *a1, const char *a2, ...)
{
  return _[a1 aggregatedTotalsAsUnsignedInteger];
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return _[a1 allKeys];
}

id objc_msgSend_appInFocusStream(void *a1, const char *a2, ...)
{
  return _[a1 appInFocusStream];
}

id objc_msgSend_appVersion(void *a1, const char *a2, ...)
{
  return _[a1 appVersion];
}

id objc_msgSend_appleInternal(void *a1, const char *a2, ...)
{
  return _[a1 appleInternal];
}

id objc_msgSend_arrayWithObjects_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithObjects:");
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_attributesOfItemAtPath_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "attributesOfItemAtPath:error:");
}

id objc_msgSend_baselineCrashCount(void *a1, const char *a2, ...)
{
  return _[a1 baselineCrashCount];
}

id objc_msgSend_baselineUptime(void *a1, const char *a2, ...)
{
  return _[a1 baselineUptime];
}

id objc_msgSend_baselineVersions(void *a1, const char *a2, ...)
{
  return _[a1 baselineVersions];
}

id objc_msgSend_BOOLForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "BOOLForKey:");
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return _[a1 BOOLValue];
}

id objc_msgSend_bugType(void *a1, const char *a2, ...)
{
  return _[a1 bugType];
}

id objc_msgSend_buildVersion(void *a1, const char *a2, ...)
{
  return _[a1 buildVersion];
}

id objc_msgSend_bundleID(void *a1, const char *a2, ...)
{
  return _[a1 bundleID];
}

id objc_msgSend_bundleVersion(void *a1, const char *a2, ...)
{
  return _[a1 bundleVersion];
}

id objc_msgSend_calculateStabilityRateWithAppUsage_crashCounts_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "calculateStabilityRateWithAppUsage:crashCounts:");
}

id objc_msgSend_calendar(void *a1, const char *a2, ...)
{
  return _[a1 calendar];
}

id objc_msgSend_calendarWithIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "calendarWithIdentifier:");
}

id objc_msgSend_categoriesForBundleIDs_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "categoriesForBundleIDs:completionHandler:");
}

id objc_msgSend_coalitionBasedBundleIDs(void *a1, const char *a2, ...)
{
  return _[a1 coalitionBasedBundleIDs];
}

id objc_msgSend_coalitionName(void *a1, const char *a2, ...)
{
  return _[a1 coalitionName];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return _[a1 code];
}

id objc_msgSend_collectDeveloperOptIn(void *a1, const char *a2, ...)
{
  return _[a1 collectDeveloperOptIn];
}

id objc_msgSend_compare_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "compare:");
}

id objc_msgSend_components_fromDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "components:fromDate:");
}

id objc_msgSend_containsObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "containsObject:");
}

id objc_msgSend_containsString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "containsString:");
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

id objc_msgSend_crashCount(void *a1, const char *a2, ...)
{
  return _[a1 crashCount];
}

id objc_msgSend_createBiomeFeed(void *a1, const char *a2, ...)
{
  return _[a1 createBiomeFeed];
}

id objc_msgSend_createForSubmissionWithXPCRequest_forReply_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createForSubmissionWithXPCRequest:forReply:");
}

id objc_msgSend_currentCalendar(void *a1, const char *a2, ...)
{
  return _[a1 currentCalendar];
}

id objc_msgSend_currentRunLoop(void *a1, const char *a2, ...)
{
  return _[a1 currentRunLoop];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return _[a1 date];
}

id objc_msgSend_dateByAddingComponents_toDate_options_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dateByAddingComponents:toDate:options:");
}

id objc_msgSend_dateByAddingTimeInterval_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dateByAddingTimeInterval:");
}

id objc_msgSend_dateFromComponents_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dateFromComponents:");
}

id objc_msgSend_dateRangeOnBuild_from_to_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dateRangeOnBuild:from:to:completionHandler:");
}

id objc_msgSend_dateWithTimeIntervalSinceReferenceDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dateWithTimeIntervalSinceReferenceDate:");
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return _[a1 defaultManager];
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return _[a1 description];
}

id objc_msgSend_deviceMetadataStream(void *a1, const char *a2, ...)
{
  return _[a1 deviceMetadataStream];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return _[a1 dictionary];
}

id objc_msgSend_dictionaryForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryForKey:");
}

id objc_msgSend_dictionaryRepresentation(void *a1, const char *a2, ...)
{
  return _[a1 dictionaryRepresentation];
}

id objc_msgSend_dictionaryWithDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithDictionary:");
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_didWriteLog_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didWriteLog:");
}

id objc_msgSend_didWriteLog_filePath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didWriteLog:filePath:");
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return _[a1 domain];
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return _[a1 doubleValue];
}

id objc_msgSend_endDate(void *a1, const char *a2, ...)
{
  return _[a1 endDate];
}

id objc_msgSend_endDateSortDescriptorAscending_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "endDateSortDescriptorAscending:");
}

id objc_msgSend_entitled(void *a1, const char *a2, ...)
{
  return _[a1 entitled];
}

id objc_msgSend_enumerateDatesStartingAfterDate_matchingComponents_options_usingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumerateDatesStartingAfterDate:matchingComponents:options:usingBlock:");
}

id objc_msgSend_error(void *a1, const char *a2, ...)
{
  return _[a1 error];
}

id objc_msgSend_errorWithDomain_code_userInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "errorWithDomain:code:userInfo:");
}

id objc_msgSend_evaluateStability(void *a1, const char *a2, ...)
{
  return _[a1 evaluateStability];
}

id objc_msgSend_evaluateStabilityOfBundleID_coalitionName_parameters_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "evaluateStabilityOfBundleID:coalitionName:parameters:completionHandler:");
}

id objc_msgSend_evaluateStabilityWithParameters_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "evaluateStabilityWithParameters:");
}

id objc_msgSend_evaluateState(void *a1, const char *a2, ...)
{
  return _[a1 evaluateState];
}

id objc_msgSend_eventBody(void *a1, const char *a2, ...)
{
  return _[a1 eventBody];
}

id objc_msgSend_eventQueryWithPredicate_eventStreams_offset_limit_sortDescriptors_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "eventQueryWithPredicate:eventStreams:offset:limit:sortDescriptors:");
}

id objc_msgSend_exactBundleVersion(void *a1, const char *a2, ...)
{
  return _[a1 exactBundleVersion];
}

id objc_msgSend_excludeThirdParty(void *a1, const char *a2, ...)
{
  return _[a1 excludeThirdParty];
}

id objc_msgSend_executeQuery_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "executeQuery:error:");
}

id objc_msgSend_failedToWriteLog_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "failedToWriteLog:error:");
}

id objc_msgSend_fileModificationDate(void *a1, const char *a2, ...)
{
  return _[a1 fileModificationDate];
}

id objc_msgSend_fileSize(void *a1, const char *a2, ...)
{
  return _[a1 fileSize];
}

id objc_msgSend_fileSystemRepresentation(void *a1, const char *a2, ...)
{
  return _[a1 fileSystemRepresentation];
}

id objc_msgSend_filepath(void *a1, const char *a2, ...)
{
  return _[a1 filepath];
}

id objc_msgSend_filterWithIsIncluded_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "filterWithIsIncluded:");
}

id objc_msgSend_firstPartyBundleIDs(void *a1, const char *a2, ...)
{
  return _[a1 firstPartyBundleIDs];
}

id objc_msgSend_generateCrackShotWithParams_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "generateCrackShotWithParams:");
}

id objc_msgSend_generateLastDayAppUsage(void *a1, const char *a2, ...)
{
  return _[a1 generateLastDayAppUsage];
}

id objc_msgSend_generateStackShotWithParams_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "generateStackShotWithParams:");
}

id objc_msgSend_generateSystemMemoryResetWithParams_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "generateSystemMemoryResetWithParams:");
}

id objc_msgSend_generateTopThreeCategories_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "generateTopThreeCategories:");
}

id objc_msgSend_generateTotalByCategory_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "generateTotalByCategory:completionHandler:");
}

id objc_msgSend_getAppUsageArray_to_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getAppUsageArray:to:");
}

id objc_msgSend_getExtraData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getExtraData:");
}

id objc_msgSend_getTaskingKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getTaskingKey:");
}

id objc_msgSend_handleDefaultsRequestWithParams_forReply_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleDefaultsRequestWithParams:forReply:");
}

id objc_msgSend_handleLaunchEvent(void *a1, const char *a2, ...)
{
  return _[a1 handleLaunchEvent];
}

id objc_msgSend_handleStabilityMonitorRequest_fromConnection_forReply_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleStabilityMonitorRequest:fromConnection:forReply:");
}

id objc_msgSend_hasSupplementalBuild(void *a1, const char *a2, ...)
{
  return _[a1 hasSupplementalBuild];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return _[a1 identifier];
}

id objc_msgSend_initForPid_exitSnapshot_reason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initForPid:exitSnapshot:reason:");
}

id objc_msgSend_initForPid_process_withReason_exceptionCode_exceptionCodeCount_stackshotFlags_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initForPid:process:withReason:exceptionCode:exceptionCodeCount:stackshotFlags:");
}

id objc_msgSend_initWithAppUptime_crashCount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithAppUptime:crashCount:");
}

id objc_msgSend_initWithConnection_entitled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithConnection:entitled:");
}

id objc_msgSend_initWithEndpoint_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithEndpoint:");
}

id objc_msgSend_initWithEvent_code_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithEvent:code:");
}

id objc_msgSend_initWithIdentity_details_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithIdentity:details:");
}

id objc_msgSend_initWithIdentity_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithIdentity:error:");
}

id objc_msgSend_initWithIdentity_filePath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithIdentity:filePath:");
}

id objc_msgSend_initWithIncidentID_bugType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithIncidentID:bugType:");
}

id objc_msgSend_initWithKnowledgeStore_clientContext_identifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithKnowledgeStore:clientContext:identifier:");
}

id objc_msgSend_initWithMachServiceName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithMachServiceName:");
}

id objc_msgSend_initWithParameters_targetBundleID_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithParameters:targetBundleID:completionHandler:");
}

id objc_msgSend_initWithPid_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithPid:");
}

id objc_msgSend_initWithStartDate_endDate_maxEvents_lastN_reversed_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithStartDate:endDate:maxEvents:lastN:reversed:");
}

id objc_msgSend_initWithStartDate_endDate_targetAppVersions_firstPartyBundleIDs_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithStartDate:endDate:targetAppVersions:firstPartyBundleIDs:");
}

id objc_msgSend_initWithSuiteName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithSuiteName:");
}

id objc_msgSend_initWithTargetAppVersions_isBaseline_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithTargetAppVersions:isBaseline:");
}

id objc_msgSend_initWithTopCategory1_topCategory2_topCategory3_highEngagementCategory1_highEngagementCategory2_( void *a1, const char *a2, ...)
{
  return _objc_msgSend( a1,  "initWithTopCategory1:topCategory2:topCategory3:highEngagementCategory1:highEngagementCategory2:");
}

id objc_msgSend_initWithUTF8String_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithUTF8String:");
}

id objc_msgSend_initiate_transferLog_withOptions_job_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initiate:transferLog:withOptions:job:");
}

id objc_msgSend_instantiate(void *a1, const char *a2, ...)
{
  return _[a1 instantiate];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return _[a1 intValue];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return _[a1 integerValue];
}

id objc_msgSend_isAvailable(void *a1, const char *a2, ...)
{
  return _[a1 isAvailable];
}

id objc_msgSend_isBeta(void *a1, const char *a2, ...)
{
  return _[a1 isBeta];
}

id objc_msgSend_isEqual_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqual:");
}

id objc_msgSend_isEqualToDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToDate:");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_isFirstParty(void *a1, const char *a2, ...)
{
  return _[a1 isFirstParty];
}

id objc_msgSend_isRollbackSupportedForBundleID_reason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isRollbackSupportedForBundleID:reason:");
}

id objc_msgSend_isValidBundleID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isValidBundleID:");
}

id objc_msgSend_isValidEvent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isValidEvent:");
}

id objc_msgSend_keyForDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "keyForDate:");
}

id objc_msgSend_knowledgeStore(void *a1, const char *a2, ...)
{
  return _[a1 knowledgeStore];
}

id objc_msgSend_lastPathComponent(void *a1, const char *a2, ...)
{
  return _[a1 lastPathComponent];
}

id objc_msgSend_loadParameterForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "loadParameterForKey:");
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return _[a1 localizedDescription];
}

id objc_msgSend_localizedFailureReason(void *a1, const char *a2, ...)
{
  return _[a1 localizedFailureReason];
}

id objc_msgSend_locallyCreateForSubmission_metadata_options_error_writing_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "locallyCreateForSubmission:metadata:options:error:writing:");
}

id objc_msgSend_logObjForBugType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "logObjForBugType:");
}

id objc_msgSend_longLongValue(void *a1, const char *a2, ...)
{
  return _[a1 longLongValue];
}

id objc_msgSend_maximumDays(void *a1, const char *a2, ...)
{
  return _[a1 maximumDays];
}

id objc_msgSend_maximumMTBF(void *a1, const char *a2, ...)
{
  return _[a1 maximumMTBF];
}

id objc_msgSend_maximumMTBFIfNoBaselineCrashes(void *a1, const char *a2, ...)
{
  return _[a1 maximumMTBFIfNoBaselineCrashes];
}

id objc_msgSend_metadata(void *a1, const char *a2, ...)
{
  return _[a1 metadata];
}

id objc_msgSend_minimumCrashCount(void *a1, const char *a2, ...)
{
  return _[a1 minimumCrashCount];
}

id objc_msgSend_minimumMTBFDelta(void *a1, const char *a2, ...)
{
  return _[a1 minimumMTBFDelta];
}

id objc_msgSend_minimumMTBFFactor(void *a1, const char *a2, ...)
{
  return _[a1 minimumMTBFFactor];
}

id objc_msgSend_minimumUptime(void *a1, const char *a2, ...)
{
  return _[a1 minimumUptime];
}

id objc_msgSend_monitorQueue(void *a1, const char *a2, ...)
{
  return _[a1 monitorQueue];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return _[a1 name];
}

id objc_msgSend_namespaceName(void *a1, const char *a2, ...)
{
  return _[a1 namespaceName];
}

id objc_msgSend_now(void *a1, const char *a2, ...)
{
  return _[a1 now];
}

id objc_msgSend_null(void *a1, const char *a2, ...)
{
  return _[a1 null];
}

id objc_msgSend_numberForKey_onDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberForKey:onDate:");
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

id objc_msgSend_numberWithInteger_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithInteger:");
}

id objc_msgSend_numberWithLongLong_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithLongLong:");
}

id objc_msgSend_numberWithUnsignedInteger_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithUnsignedInteger:");
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

id objc_msgSend_oldFilePath(void *a1, const char *a2, ...)
{
  return _[a1 oldFilePath];
}

id objc_msgSend_optIn3rdParty(void *a1, const char *a2, ...)
{
  return _[a1 optIn3rdParty];
}

id objc_msgSend_pathSubmissionSubdirDiagnosticLogs(void *a1, const char *a2, ...)
{
  return _[a1 pathSubmissionSubdirDiagnosticLogs];
}

id objc_msgSend_pid(void *a1, const char *a2, ...)
{
  return _[a1 pid];
}

id objc_msgSend_predicateForEventsIntersectingDateRangeFrom_to_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateForEventsIntersectingDateRangeFrom:to:");
}

id objc_msgSend_processDailyUsage_from_to_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "processDailyUsage:from:to:");
}

id objc_msgSend_processIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 processIdentifier];
}

id objc_msgSend_publisherForQuery_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "publisherForQuery:");
}

id objc_msgSend_publisherWithOptions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "publisherWithOptions:");
}

id objc_msgSend_publisherWithStartTime_endTime_maxEvents_reversed_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "publisherWithStartTime:endTime:maxEvents:reversed:");
}

id objc_msgSend_raise_format_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "raise:format:");
}

id objc_msgSend_rapidSecurityResponsePreReboot(void *a1, const char *a2, ...)
{
  return _[a1 rapidSecurityResponsePreReboot];
}

id objc_msgSend_receivedLogEvent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "receivedLogEvent:");
}

id objc_msgSend_recommendRollbackForBundleID_reason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "recommendRollbackForBundleID:reason:");
}

id objc_msgSend_remoteObjectProxy(void *a1, const char *a2, ...)
{
  return _[a1 remoteObjectProxy];
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return _[a1 removeAllObjects];
}

id objc_msgSend_removeItemAtPath_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeItemAtPath:error:");
}

id objc_msgSend_removeObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObject:");
}

id objc_msgSend_removeObjectForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObjectForKey:");
}

id objc_msgSend_reportResultsForBundleID_crashes_uptime_MTBF_result_status_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reportResultsForBundleID:crashes:uptime:MTBF:result:status:");
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return _[a1 resume];
}

id objc_msgSend_run(void *a1, const char *a2, ...)
{
  return _[a1 run];
}

id objc_msgSend_saveWithOptions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "saveWithOptions:");
}

id objc_msgSend_scheduleCleanupWithHomeDirectory_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "scheduleCleanupWithHomeDirectory:");
}

id objc_msgSend_scheduleSubmission(void *a1, const char *a2, ...)
{
  return _[a1 scheduleSubmission];
}

id objc_msgSend_sendEvent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendEvent:");
}

id objc_msgSend_sendRTCBeacon_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendRTCBeacon:");
}

id objc_msgSend_serviceRequest_forOperation_fromConnection_forReply_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "serviceRequest:forOperation:fromConnection:forReply:");
}

id objc_msgSend_set(void *a1, const char *a2, ...)
{
  return _[a1 set];
}

id objc_msgSend_setAdditionalPayload_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAdditionalPayload:");
}

id objc_msgSend_setAlarm_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAlarm:");
}

id objc_msgSend_setBool_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBool:forKey:");
}

id objc_msgSend_setDay_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDay:");
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDelegate:");
}

id objc_msgSend_setEventStreams_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEventStreams:");
}

id objc_msgSend_setExportedInterface_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setExportedInterface:");
}

id objc_msgSend_setExportedObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setExportedObject:");
}

id objc_msgSend_setHour_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHour:");
}

id objc_msgSend_setInvalidationHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInvalidationHandler:");
}

id objc_msgSend_setMinute_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMinute:");
}

id objc_msgSend_setNumber_forKey_onDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNumber:forKey:onDate:");
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

id objc_msgSend_setPredicate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPredicate:");
}

id objc_msgSend_setRemoteObjectInterface_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRemoteObjectInterface:");
}

id objc_msgSend_setSecond_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSecond:");
}

id objc_msgSend_setSortDescriptors_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSortDescriptors:");
}

id objc_msgSend_setTargetBundleID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTargetBundleID:");
}

id objc_msgSend_setTargetKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTargetKey:");
}

id objc_msgSend_setTimeZone_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTimeZone:");
}

id objc_msgSend_setWithArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWithArray:");
}

id objc_msgSend_setWithObjects_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWithObjects:");
}

id objc_msgSend_setWithSet_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWithSet:");
}

id objc_msgSend_sharedCategories(void *a1, const char *a2, ...)
{
  return _[a1 sharedCategories];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return _[a1 sharedInstance];
}

id objc_msgSend_shortVersionString(void *a1, const char *a2, ...)
{
  return _[a1 shortVersionString];
}

id objc_msgSend_sinkWithCompletion_receiveInput_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sinkWithCompletion:receiveInput:");
}

id objc_msgSend_sinkWithCompletion_shouldContinue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sinkWithCompletion:shouldContinue:");
}

id objc_msgSend_sortDescriptorWithKey_ascending_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sortDescriptorWithKey:ascending:");
}

id objc_msgSend_sortedArrayUsingComparator_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sortedArrayUsingComparator:");
}

id objc_msgSend_source(void *a1, const char *a2, ...)
{
  return _[a1 source];
}

id objc_msgSend_ss_trace_length(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ss_trace_length");
}

id objc_msgSend_standardUserDefaults(void *a1, const char *a2, ...)
{
  return _[a1 standardUserDefaults];
}

id objc_msgSend_startDate(void *a1, const char *a2, ...)
{
  return _[a1 startDate];
}

id objc_msgSend_startDateSortDescriptorAscending_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startDateSortDescriptorAscending:");
}

id objc_msgSend_startOfDayForDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startOfDayForDate:");
}

id objc_msgSend_state(void *a1, const char *a2, ...)
{
  return _[a1 state];
}

id objc_msgSend_stringByAppendingPathComponent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByAppendingPathComponent:");
}

id objc_msgSend_stringValue(void *a1, const char *a2, ...)
{
  return _[a1 stringValue];
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_stringWithUTF8String_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithUTF8String:");
}

id objc_msgSend_subarrayWithRange_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "subarrayWithRange:");
}

id objc_msgSend_supplementalBuild(void *a1, const char *a2, ...)
{
  return _[a1 supplementalBuild];
}

id objc_msgSend_targetKey(void *a1, const char *a2, ...)
{
  return _[a1 targetKey];
}

id objc_msgSend_terminationReason(void *a1, const char *a2, ...)
{
  return _[a1 terminationReason];
}

id objc_msgSend_timeIntervalSince1970(void *a1, const char *a2, ...)
{
  return _[a1 timeIntervalSince1970];
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

id objc_msgSend_timeZoneWithAbbreviation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "timeZoneWithAbbreviation:");
}

id objc_msgSend_timeZoneWithName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "timeZoneWithName:");
}

id objc_msgSend_timestamp(void *a1, const char *a2, ...)
{
  return _[a1 timestamp];
}

id objc_msgSend_totalCrashesFrom_to_targetBundleID_appVersions_isBaseline_completionHandler_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "totalCrashesFrom:to:targetBundleID:appVersions:isBaseline:completionHandler:");
}

id objc_msgSend_totalUptimeFrom_to_targetBundleID_targetAppVersions_firstPartyBundleIDs_completionHandler_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "totalUptimeFrom:to:targetBundleID:targetAppVersions:firstPartyBundleIDs:completionHandler:");
}

id objc_msgSend_totals(void *a1, const char *a2, ...)
{
  return _[a1 totals];
}

id objc_msgSend_transfer_key_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "transfer:key:");
}

id objc_msgSend_triggerUrgentSubmission(void *a1, const char *a2, ...)
{
  return _[a1 triggerUrgentSubmission];
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return _[a1 unsignedIntegerValue];
}

id objc_msgSend_uptime(void *a1, const char *a2, ...)
{
  return _[a1 uptime];
}

id objc_msgSend_valueForEntitlement_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "valueForEntitlement:");
}

id objc_msgSend_versions(void *a1, const char *a2, ...)
{
  return _[a1 versions];
}

id objc_msgSend_willWriteLog_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "willWriteLog:");
}

id objc_msgSend_willWriteLog_details_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "willWriteLog:details:");
}
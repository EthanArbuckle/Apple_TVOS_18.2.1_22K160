uint64_t sub_10000458C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  _OWORD v8[2];
  v4 = 0LL;
  v5 = &v4;
  v6 = 0x2020000000LL;
  v1 = qword_100033D58;
  v7 = qword_100033D58;
  if (!qword_100033D58)
  {
    v8[0] = *(_OWORD *)off_100028678;
    v8[1] = *(_OWORD *)&off_100028688;
    v2 = _sl_dlopen(v8, a1);
    v5[3] = v2;
    qword_100033D58 = v2;
    v1 = v2;
  }

  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_100004638( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

uint64_t sub_100004650()
{
  v3 = 0LL;
  uint64_t v0 = sub_10000458C((uint64_t)&v3);
  v1 = v3;
  if (!v0)
  {
    v1 = (char *)abort_report_np("%s", v3);
    goto LABEL_5;
  }

  if (v3) {
LABEL_5:
  }
    free(v1);
  return v0;
}

id sub_1000046A8()
{
  uint64_t v4 = 0LL;
  v5 = &v4;
  uint64_t v6 = 0x2050000000LL;
  uint64_t v0 = (void *)qword_100033D60;
  uint64_t v7 = qword_100033D60;
  if (!qword_100033D60)
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472LL;
    v3[2] = sub_10000475C;
    v3[3] = &unk_1000286A0;
    v3[4] = &v4;
    sub_10000475C((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }

  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_100004744( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

Class sub_10000475C(uint64_t a1)
{
  Class result = objc_getClass("BGSystemTaskScheduler");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL))
  {
    qword_100033D60 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
  }

  else
  {
    sub_10001A3B4();
    return (Class)sub_1000047B0();
  }

  return result;
}

id sub_1000047B0()
{
  uint64_t v4 = 0LL;
  v5 = &v4;
  uint64_t v6 = 0x2050000000LL;
  uint64_t v0 = (void *)qword_100033D68;
  uint64_t v7 = qword_100033D68;
  if (!qword_100033D68)
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472LL;
    v3[2] = sub_100004864;
    v3[3] = &unk_1000286A0;
    v3[4] = &v4;
    sub_100004864((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }

  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_10000484C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

Class sub_100004864(uint64_t a1)
{
  Class result = objc_getClass("BGNonRepeatingSystemTaskRequest");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL))
  {
    qword_100033D68 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
  }

  else
  {
    uint64_t v3 = sub_10001A3D8();
    return (Class)sub_1000048B8(v3);
  }

  return result;
}

id sub_1000048B8()
{
  uint64_t v4 = 0LL;
  v5 = &v4;
  uint64_t v6 = 0x2050000000LL;
  uint64_t v0 = (void *)qword_100033D70;
  uint64_t v7 = qword_100033D70;
  if (!qword_100033D70)
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472LL;
    v3[2] = sub_10000496C;
    v3[3] = &unk_1000286A0;
    v3[4] = &v4;
    sub_10000496C((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }

  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_100004954( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_10000496C(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = objc_getClass("BGRepeatingSystemTaskRequest");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL))
  {
    qword_100033D70 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
  }

  else
  {
    v2 = (GEOAPServiceLocal *)sub_10001A3FC();
    -[GEOAPServiceLocal reportLogMsg:uploadBatchId:completion:](v2, v3, v4, v5, v6);
  }
}

id sub_100004ADC()
{
  if (qword_100033D80 != -1) {
    dispatch_once(&qword_100033D80, &stru_100028708);
  }
  return (id)qword_100033D78;
}

uint64_t sub_100004CA8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

uint64_t sub_100004D84(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

uint64_t sub_10000506C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_1000050CC(id a1)
{
  os_log_t v1 = os_log_create("com.apple.GeoAnalytics", "LocalService");
  v2 = (void *)qword_100033D78;
  qword_100033D78 = (uint64_t)v1;
}

void *sub_1000050FC(void *result)
{
  if (result)
  {
    os_log_t v1 = result;
    unsigned int v2 = [result dataRequestKindType];
    return (void *)(v2 | ((void)[v1 dataRequestKindSubtype] << 32));
  }

  return result;
}

NSError *sub_100005134(NSError *a1)
{
  os_log_t v1 = a1;
  if (a1)
  {
    if (-[NSError hasErrorCode](a1, "hasErrorCode")
      && -[NSError hasErrorDomain](v1, "hasErrorDomain"))
    {
      unsigned int v2 = objc_alloc(&OBJC_CLASS___NSError);
      SEL v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSError errorDomain](v1, "errorDomain"));
      os_log_t v1 = -[NSError initWithDomain:code:userInfo:]( v2,  "initWithDomain:code:userInfo:",  v3,  -[NSError errorCode](v1, "errorCode"),  0LL);
    }

    else
    {
      os_log_t v1 = 0LL;
    }
  }

  return v1;
}

id sub_1000051C4(void *a1)
{
  if (a1)
  {
    os_log_t v1 = a1;
    else {
      id v2 = 0LL;
    }
    a1 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v2));
  }

  return a1;
}

id sub_100005214(void *a1)
{
  if (a1)
  {
    [a1 eventTimestamp];
    a1 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSinceReferenceDate:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceReferenceDate:"));
  }

  return a1;
}

id sub_100005248(id result)
{
  if (result)
  {
    os_log_t v1 = (void *)objc_claimAutoreleasedReturnValue([result clientMetrics]);
    id v2 = (void *)objc_claimAutoreleasedReturnValue([v1 networkMetrics]);
    SEL v3 = (void *)objc_claimAutoreleasedReturnValue([v2 transactionMetrics]);
    id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 lastObject]);
    id v5 = [v4 usedCellular];

    return v5;
  }

  return result;
}

void sub_100005300(id a1)
{
  os_log_t v1 = objc_alloc_init(&OBJC_CLASS___GEOAPNetEventAggregator);
  id v2 = (void *)qword_100033D88;
  qword_100033D88 = (uint64_t)v1;
}

int64_t sub_100005638(id a1, id a2, id a3)
{
  return (int64_t)[a2 compare:a3];
}

id sub_100005E94()
{
  if (qword_100033DA0 != -1) {
    dispatch_once(&qword_100033DA0, &stru_100028800);
  }
  return (id)qword_100033D98;
}

void sub_100005ED4(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (NSError *)[[GEONetworkEventData alloc] initWithData:v3];
  id v5 = v4;
  if (v4)
  {
    uint64_t v103 = a1;
    id v107 = v3;
    unsigned int v6 = -[NSError dataRequestKindType](v4, "dataRequestKindType");
    id v119 = -[NSError dataRequestKindSubtype](v5, "dataRequestKindSubtype");
    uint64_t v7 = sub_100005134(v5);
    v123 = v5;
    uint64_t v8 = objc_claimAutoreleasedReturnValue(v7);
    id v9 = sub_1000051C4(v123);
    uint64_t v10 = objc_claimAutoreleasedReturnValue(v9);
    id v11 = -[NSError networkService](v123, "networkService");
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSError requestingAppIdentifier](v123, "requestingAppIdentifier"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSError requestingAppMajorVer](v123, "requestingAppMajorVer"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSError requestingAppMinorVer](v123, "requestingAppMinorVer"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSError clientMetrics](v123, "clientMetrics"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[NSError additionalStates](v123, "additionalStates"));
    v122 = (void *)v8;
    uint64_t v96 = v8;
    id v5 = v123;
    v106 = (void *)v10;
    +[GEOAPPortal captureNetworkEventForDataRequestKind:networkService:usedBackgroundURL:requestAppIdentifier:appMajorVersion:appMinorVersion:error:clientMetrics:states:]( &OBJC_CLASS___GEOAPPortal,  "captureNetworkEventForDataRequestKind:networkService:usedBackgroundURL:requestAppIdentifier:appMajorVersion:appMin orVersion:error:clientMetrics:states:",  v6 | ((void)v119 << 32),  v11,  v10,  v12,  v13,  v14,  v96,  v15,  v16);

    unsigned int v108 = sub_100005248(v123);
    id v17 = sub_100005214(v123);
    uint64_t v18 = objc_claimAutoreleasedReturnValue(v17);
    v19 = -[NSCalendar initWithCalendarIdentifier:]( objc_alloc(&OBJC_CLASS___NSCalendar),  "initWithCalendarIdentifier:",  NSCalendarIdentifierGregorian);
    v121 = (void *)objc_claimAutoreleasedReturnValue(-[NSCalendar components:fromDate:](v19, "components:fromDate:", 28LL, v18));
    v104 = v19;
    v105 = (void *)v18;
    if (v6 == 768 || v6 == 1792 || v6 == 1280) {
      v120 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v119));
    }
    else {
      v120 = 0LL;
    }
    if (v122)
    {
      v112 = (void *)objc_claimAutoreleasedReturnValue([v122 domain]);
      v111 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [v122 code]));
    }

    else
    {
      v111 = 0LL;
      v112 = 0LL;
    }

    v22 = (void *)objc_claimAutoreleasedReturnValue(-[NSError clientMetrics](v123, "clientMetrics"));
    v23 = (void *)objc_claimAutoreleasedReturnValue([v22 networkMetrics]);
    id v24 = [v23 httpResponseCode];

    v25 = (void *)objc_claimAutoreleasedReturnValue(-[NSError clientMetrics](v123, "clientMetrics"));
    v26 = (void *)objc_claimAutoreleasedReturnValue([v25 networkMetrics]);
    v118 = (void *)objc_claimAutoreleasedReturnValue([v26 serviceIpAddress]);

    __int128 v126 = 0u;
    __int128 v127 = 0u;
    __int128 v124 = 0u;
    __int128 v125 = 0u;
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[NSError additionalStates](v123, "additionalStates"));
    id v28 = [v27 countByEnumeratingWithState:&v124 objects:v134 count:16];
    if (v28)
    {
      id v29 = v28;
      uint64_t v30 = *(void *)v125;
      while (2)
      {
        for (i = 0LL; i != v29; i = (char *)i + 1)
        {
          if (*(void *)v125 != v30) {
            objc_enumerationMutation(v27);
          }
          v32 = *(void **)(*((void *)&v124 + 1) + 8LL * (void)i);
          if ([v32 stateType] == 706)
          {
            v33 = (void *)objc_claimAutoreleasedReturnValue([v32 tileSet]);
            v34 = (void *)objc_claimAutoreleasedReturnValue([v33 tileSetInfos]);
            v35 = (void *)objc_claimAutoreleasedReturnValue([v34 firstObject]);
            v117 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInt:]( NSNumber,  "numberWithInt:",  [v35 style]));

            goto LABEL_22;
          }
        }

        id v29 = [v27 countByEnumeratingWithState:&v124 objects:v134 count:16];
        if (v29) {
          continue;
        }
        break;
      }
    }

    v117 = 0LL;
LABEL_22:

    if (-[NSError hasTilesetId](v123, "hasTilesetId")) {
      uint64_t v36 = objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  -[NSError tilesetId](v123, "tilesetId")));
    }
    else {
      uint64_t v36 = 0LL;
    }
    v116 = (void *)v36;
    id v101 = v24;
    if (-[NSError hasNetworkService](v123, "hasNetworkService")) {
      v115 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInt:]( &OBJC_CLASS___NSNumber,  "numberWithInt:",  -[NSError networkService](v123, "networkService")));
    }
    else {
      v115 = 0LL;
    }
    v114 = (void *)objc_claimAutoreleasedReturnValue(-[NSError requestingAppIdentifier](v123, "requestingAppIdentifier"));
    uint64_t v37 = objc_claimAutoreleasedReturnValue(-[NSError appIdentifier](v123, "appIdentifier"));
    v113 = (void *)objc_claimAutoreleasedReturnValue(-[NSError manifestEnvironment](v123, "manifestEnvironment"));
    uint64_t v38 = objc_claimAutoreleasedReturnValue(-[NSError countryCode](v123, "countryCode"));
    id v39 = -[NSError datasetId](v123, "datasetId");
    v40 = (void *)objc_claimAutoreleasedReturnValue(-[NSError clientMetrics](v123, "clientMetrics"));
    v41 = (void *)objc_claimAutoreleasedReturnValue([v40 networkMetrics]);
    v42 = (void *)objc_claimAutoreleasedReturnValue([v41 transactionMetrics]);
    v43 = (void *)objc_claimAutoreleasedReturnValue([v42 lastObject]);
    unsigned int v44 = [v43 reusedConnection];

    unsigned int v45 = -[NSError usedBackgroundUrl](v123, "usedBackgroundUrl");
    if (v37) {
      v46 = (const __CFString *)v37;
    }
    else {
      v46 = @"unspecified";
    }
    v47 = objc_alloc(&OBJC_CLASS___NSString);
    id v48 = [v121 year];
    id v49 = [v121 month];
    id v50 = [v121 day];
    unsigned int v99 = v45;
    unsigned int v100 = v44;
    uint64_t v51 = v45;
    v52 = (__CFString *)v46;
    v110 = (void *)v38;
    v53 = -[NSString initWithFormat:]( v47,  "initWithFormat:",  @"%@-%@-%@-%@-%04d-%02d-%02d-%d-%d-%@-%@-%@-%@-%@-%@-%@-%u-%d-%d",  v114,  v46,  v115,  v120,  v48,  v49,  v50,  v108,  v101,  v118,  v112,  v111,  v117,  v113,  v116,  v38,  v39,  v44,  v51);
    v102 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(v103 + 32) objectForKeyedSubscript:v46]);
    if (!v102)
    {
      v54 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
      [*(id *)(v103 + 32) setObject:v54 forKeyedSubscript:v46];
    }

    v55 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(v103 + 32) objectForKeyedSubscript:v46]);
    v56 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue([v55 objectForKeyedSubscript:v53]);

    if (!v56)
    {
      v97 = v53;
      v57 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
      v58 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
      v59 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
      v56 = -[NSMutableDictionary initWithCapacity:]( objc_alloc(&OBJC_CLASS___NSMutableDictionary),  "initWithCapacity:",  10LL);
      v60 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [v121 year]));
      -[NSMutableDictionary setObject:forKeyedSubscript:](v56, "setObject:forKeyedSubscript:", v60, @"y");

      v61 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [v121 month]));
      -[NSMutableDictionary setObject:forKeyedSubscript:](v56, "setObject:forKeyedSubscript:", v61, @"m");

      v62 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [v121 day]));
      -[NSMutableDictionary setObject:forKeyedSubscript:](v56, "setObject:forKeyedSubscript:", v62, @"d");

      v63 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v108));
      -[NSMutableDictionary setObject:forKeyedSubscript:](v56, "setObject:forKeyedSubscript:", v63, @"c");

      v109 = v57;
      -[NSMutableDictionary setObject:forKeyedSubscript:](v56, "setObject:forKeyedSubscript:", v57, @"L");
      v98 = v58;
      -[NSMutableDictionary setObject:forKeyedSubscript:](v56, "setObject:forKeyedSubscript:", v58, @"tx");
      v64 = v59;
      -[NSMutableDictionary setObject:forKeyedSubscript:](v56, "setObject:forKeyedSubscript:", v59, @"rx");
      -[NSMutableDictionary setObject:forKeyedSubscript:](v56, "setObject:forKeyedSubscript:", v113, @"me");
      -[NSMutableDictionary setObject:forKeyedSubscript:](v56, "setObject:forKeyedSubscript:", v114, @"raid");
      -[NSMutableDictionary setObject:forKeyedSubscript:](v56, "setObject:forKeyedSubscript:", v46, @"aid");
      -[NSMutableDictionary setObject:forKeyedSubscript:](v56, "setObject:forKeyedSubscript:", v118, @"ip");
      v65 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v100));
      -[NSMutableDictionary setObject:forKeyedSubscript:](v56, "setObject:forKeyedSubscript:", v65, @"cr");

      v66 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v99));
      -[NSMutableDictionary setObject:forKeyedSubscript:](v56, "setObject:forKeyedSubscript:", v66, @"ubu");

      if (v115) {
        -[NSMutableDictionary setObject:forKeyedSubscript:](v56, "setObject:forKeyedSubscript:", v115, @"n");
      }
      if ((_DWORD)v101)
      {
        v67 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v101));
        -[NSMutableDictionary setObject:forKeyedSubscript:](v56, "setObject:forKeyedSubscript:", v67, @"hc");
      }

      v53 = v97;
      if (v120) {
        -[NSMutableDictionary setObject:forKeyedSubscript:](v56, "setObject:forKeyedSubscript:", v120, @"p");
      }
      if (v117) {
        -[NSMutableDictionary setObject:forKeyedSubscript:](v56, "setObject:forKeyedSubscript:", v117, @"tss");
      }
      if (v116) {
        -[NSMutableDictionary setObject:forKeyedSubscript:](v56, "setObject:forKeyedSubscript:", v116, @"tsi");
      }
      if (v122)
      {
        -[NSMutableDictionary setObject:forKeyedSubscript:](v56, "setObject:forKeyedSubscript:", v112, @"ed");
        -[NSMutableDictionary setObject:forKeyedSubscript:](v56, "setObject:forKeyedSubscript:", v111, @"ec");
      }

      if (v110) {
        -[NSMutableDictionary setObject:forKeyedSubscript:](v56, "setObject:forKeyedSubscript:", v110, @"cc");
      }
      id v5 = v123;
      if ((_DWORD)v39)
      {
        v68 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:"));
        -[NSMutableDictionary setObject:forKeyedSubscript:](v56, "setObject:forKeyedSubscript:", v68, @"dsid");
      }

      v69 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(v103 + 32) objectForKeyedSubscript:v46]);
      [v69 setObject:v56 forKeyedSubscript:v97];
    }

    v70 = (void *)objc_claimAutoreleasedReturnValue(-[NSError clientMetrics](v5, "clientMetrics"));
    v71 = (void *)objc_claimAutoreleasedReturnValue([v70 networkMetrics]);
    v72 = (void *)objc_claimAutoreleasedReturnValue([v71 transactionMetrics]);
    v73 = (void *)objc_claimAutoreleasedReturnValue([v72 lastObject]);
    [v73 requestStart];
    double v75 = v74;

    v76 = (void *)objc_claimAutoreleasedReturnValue(-[NSError clientMetrics](v5, "clientMetrics"));
    v77 = (void *)objc_claimAutoreleasedReturnValue([v76 networkMetrics]);
    v78 = (void *)objc_claimAutoreleasedReturnValue([v77 transactionMetrics]);
    v79 = (void *)objc_claimAutoreleasedReturnValue([v78 lastObject]);
    [v79 requestEnd];
    double v81 = v80;

    if (v81 <= v75) {
      double v82 = 0.0;
    }
    else {
      double v82 = (v81 - v75) * 1000.0 * 1000.0;
    }
    v83 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v56, "objectForKeyedSubscript:", @"L"));
    v84 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v82));
    [v83 addObject:v84];

    if (v122)
    {
      id v85 = sub_100005E94();
      v86 = (os_log_s *)objc_claimAutoreleasedReturnValue(v85);
      if (os_log_type_enabled(v86, OS_LOG_TYPE_DEBUG))
      {
        id v87 = [v83 count];
        *(_DWORD *)buf = 134218498;
        id v129 = v87;
        __int16 v130 = 2048;
        v131 = v83;
        __int16 v132 = 2112;
        v133 = v53;
        _os_log_impl((void *)&_mh_execute_header, v86, OS_LOG_TYPE_DEBUG, "count now %lu %p %@", buf, 0x20u);
      }
    }

    v88 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v56, "objectForKeyedSubscript:", @"tx"));
    v89 = (void *)objc_claimAutoreleasedReturnValue(-[NSError clientMetrics](v5, "clientMetrics"));
    v90 = (void *)objc_claimAutoreleasedReturnValue([v89 networkMetrics]);
    v91 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInt:]( NSNumber,  "numberWithInt:",  [v90 requestDataSize]));
    [v88 addObject:v91];

    v92 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v56, "objectForKeyedSubscript:", @"rx"));
    v93 = (void *)objc_claimAutoreleasedReturnValue(-[NSError clientMetrics](v5, "clientMetrics"));
    v94 = (void *)objc_claimAutoreleasedReturnValue([v93 networkMetrics]);
    v95 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInt:]( NSNumber,  "numberWithInt:",  [v94 responseDataSize]));
    [v92 addObject:v95];

    v21 = (os_log_s *)v122;
    id v3 = v107;
  }

  else
  {
    id v20 = sub_100005E94();
    v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "unable to read data element", buf, 2u);
    }
  }
}

void sub_100006B50( uint64_t a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8, double a9, double a10)
{
  id v25 = objc_alloc_init(&OBJC_CLASS___GEONetEventAggregateStats);
  [*(id *)(a1 + 32) setLatencyStats:v25];

  v26 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) latencyStats]);
  [v26 setMax:(unint64_t)a4];

  v27 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) latencyStats]);
  [v27 setMin:(unint64_t)a3];

  id v28 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) latencyStats]);
  [v28 setP10:(unint64_t)a5];

  id v29 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) latencyStats]);
  [v29 setP25:(unint64_t)a6];

  uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) latencyStats]);
  [v30 setP50:(unint64_t)a7];

  v31 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) latencyStats]);
  [v31 setP75:(unint64_t)a8];

  v32 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) latencyStats]);
  [v32 setP90:(unint64_t)a9];

  v33 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) latencyStats]);
  [v33 setP99:(unint64_t)a10];

  unint64_t v34 = (unint64_t)a2;
  id v36 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) latencyStats]);
  [v36 setAlgMean:v34];
}

void sub_100006D04( uint64_t a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8, double a9, double a10)
{
  id v25 = objc_alloc_init(&OBJC_CLASS___GEONetEventAggregateStats);
  [*(id *)(a1 + 32) setTxBytesStats:v25];

  v26 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) txBytesStats]);
  [v26 setMax:(unint64_t)a4];

  v27 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) txBytesStats]);
  [v27 setMin:(unint64_t)a3];

  id v28 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) txBytesStats]);
  [v28 setP10:(unint64_t)a5];

  id v29 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) txBytesStats]);
  [v29 setP25:(unint64_t)a6];

  uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) txBytesStats]);
  [v30 setP50:(unint64_t)a7];

  v31 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) txBytesStats]);
  [v31 setP75:(unint64_t)a8];

  v32 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) txBytesStats]);
  [v32 setP90:(unint64_t)a9];

  v33 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) txBytesStats]);
  [v33 setP99:(unint64_t)a10];

  unint64_t v34 = (unint64_t)a2;
  id v36 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) txBytesStats]);
  [v36 setAlgMean:v34];
}

void sub_100006EB8( uint64_t a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8, double a9, double a10)
{
  id v25 = objc_alloc_init(&OBJC_CLASS___GEONetEventAggregateStats);
  [*(id *)(a1 + 32) setRxBytesStats:v25];

  v26 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) rxBytesStats]);
  [v26 setMax:(unint64_t)a4];

  v27 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) rxBytesStats]);
  [v27 setMin:(unint64_t)a3];

  id v28 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) rxBytesStats]);
  [v28 setP10:(unint64_t)a5];

  id v29 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) rxBytesStats]);
  [v29 setP25:(unint64_t)a6];

  uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) rxBytesStats]);
  [v30 setP50:(unint64_t)a7];

  v31 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) rxBytesStats]);
  [v31 setP75:(unint64_t)a8];

  v32 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) rxBytesStats]);
  [v32 setP90:(unint64_t)a9];

  v33 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) rxBytesStats]);
  [v33 setP99:(unint64_t)a10];

  unint64_t v34 = (unint64_t)a2;
  id v36 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) rxBytesStats]);
  [v36 setAlgMean:v34];
}

void sub_100007168(uint64_t a1, char a2, double a3)
{
  if ((a2 & 1) != 0)
  {
    id v4 = -[NSDate initWithTimeIntervalSinceReferenceDate:]( objc_alloc(&OBJC_CLASS___NSDate),  "initWithTimeIntervalSinceReferenceDate:",  a3);
    id v5 = -[NSCalendar initWithCalendarIdentifier:]( objc_alloc(&OBJC_CLASS___NSCalendar),  "initWithCalendarIdentifier:",  NSCalendarIdentifierGregorian);
    unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSCalendar components:fromDate:](v5, "components:fromDate:", 28LL, v4));
    uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[NSCalendar dateFromComponents:](v5, "dateFromComponents:", v6));

    uint64_t Date = GEOConfigGetDate( GeoAnalyticsConfig_DailyNetEventAggregationLastRunTime[0],  GeoAnalyticsConfig_DailyNetEventAggregationLastRunTime[1]);
    objc_msgSend(v6, "setDay:", (char *)objc_msgSend(v6, "day") - 7);
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSCalendar dateFromComponents:](v5, "dateFromComponents:", v6));
    GEOConfigSetDate( GeoAnalyticsConfig_DailyNetEventAggregationLastRunTime[0],  GeoAnalyticsConfig_DailyNetEventAggregationLastRunTime[1],  v9);
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSCalendar components:fromDate:](v5, "components:fromDate:", 28LL, v9));

    objc_msgSend(v10, "setDay:", (char *)objc_msgSend(v10, "day") + 1);
    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSCalendar dateFromComponents:](v5, "dateFromComponents:", v10));
    while ([v11 compare:v7] == (id)-1)
    {
      v12 = v11;
      id v13 = sub_100005E94();
      v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
      os_signpost_id_t v15 = os_signpost_id_generate(v14);

      id v16 = sub_100005E94();
      id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
      uint64_t v18 = v17;
      if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
      {
        *(_DWORD *)buf = 138412290;
        id v24 = v12;
        _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v18,  OS_SIGNPOST_INTERVAL_BEGIN,  v15,  "DailyNetworkEvent",  "for '%@'",  buf,  0xCu);
      }

      [*(id *)(a1 + 32) runAggregationForDate:v12];
      GEOConfigSetDate( GeoAnalyticsConfig_DailyNetEventAggregationLastRunTime[0],  GeoAnalyticsConfig_DailyNetEventAggregationLastRunTime[1],  v12);
      objc_msgSend(v10, "setDay:", (char *)objc_msgSend(v10, "day") + 1);
      id v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSCalendar dateFromComponents:](v5, "dateFromComponents:", v10));

      id v19 = sub_100005E94();
      id v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
      v21 = v20;
      if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v20))
      {
        *(_DWORD *)buf = 138412290;
        id v24 = v11;
        _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v21,  OS_SIGNPOST_INTERVAL_END,  v15,  "DailyNetworkEvent",  "for '%@'",  buf,  0xCu);
      }
    }
  }

  else
  {
    id v22 = sub_100005E94();
    uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "no time sync", buf, 2u);
    }
  }
}

void sub_100007490(id a1)
{
  os_log_t v1 = os_log_create("com.apple.GeoAnalytics", "NetEventAggregator");
  id v2 = (void *)qword_100033D98;
  qword_100033D98 = (uint64_t)v1;
}

id sub_1000074C0()
{
  if (qword_100033DB0 != -1) {
    dispatch_once(&qword_100033DB0, &stru_100028820);
  }
  return (id)qword_100033DA8;
}

void sub_100007504(id a1)
{
  os_log_t v1 = objc_alloc_init(&OBJC_CLASS___GEOAPCountsAggregator);
  id v2 = (void *)qword_100033DA8;
  qword_100033DA8 = (uint64_t)v1;
}

id *sub_10000777C(id *a1)
{
  if (a1) {
    a1 = (id *)a1[1];
  }
  return a1;
}

id sub_100007798(uint64_t a1)
{
  if (a1) {
    a1 = objc_claimAutoreleasedReturnValue([*(id *)(a1 + 8) dateByAddingTimeInterval:*(double *)(a1 + 24)]);
  }
  return (id)a1;
}

id *sub_1000077C0(id *a1)
{
  if (a1) {
    a1 = (id *)a1[2];
  }
  return a1;
}

void *sub_1000077DC(void *a1)
{
  os_log_t v1 = a1;
  if (a1)
  {
    id v2 = -[NSCalendar initWithCalendarIdentifier:]( objc_alloc(&OBJC_CLASS___NSCalendar),  "initWithCalendarIdentifier:",  NSCalendarIdentifierGregorian);
    id v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSCalendar components:fromDate:](v2, "components:fromDate:", 28LL, v1[2]));
    objc_msgSend(v3, "setMonth:", (char *)objc_msgSend(v3, "month") + 1);
    os_log_t v1 = (void *)objc_claimAutoreleasedReturnValue(-[NSCalendar dateFromComponents:](v2, "dateFromComponents:", v3));
  }

  return v1;
}

id sub_100007AE4()
{
  if (qword_100033DC0 != -1) {
    dispatch_once(&qword_100033DC0, &stru_1000289A8);
  }
  return (id)qword_100033DB8;
}

void sub_100007DF4(id *a1)
{
  if (a1)
  {
    unsigned __int8 v2 = [a1[4] tryLock];
    id v3 = sub_100007AE4();
    id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
    BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG);
    if ((v2 & 1) != 0)
    {
      if (v5)
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "starting", buf, 2u);
      }

      id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue([a1 now]);
      [a1 startDailyAggregationFromTime:v4];
      [a1 startMonthlyAggregationFromTime:v4];
      id v6 = sub_100007AE4();
      uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)uint64_t v8 = 0;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "done", v8, 2u);
      }

      [a1[4] unlock];
    }

    else if (v5)
    {
      *(_WORD *)uint64_t v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "already running; done", v10, 2u);
    }
  }

void sub_10000809C(_Unwind_Exception *a1)
{
}

uint64_t sub_1000080B4(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_1000080C4(uint64_t a1)
{
}

uint64_t sub_1000080CC(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_autoreleasePoolPush();
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue([v3 settings]);

  id v6 = sub_100007AE4();
  uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG);
  if (v5)
  {
    if (v8)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "found daily settings record", buf, 2u);
    }

    id v9 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL);
    uint64_t v10 = objc_claimAutoreleasedReturnValue([v3 settings]);
    uint64_t v7 = (os_log_s *)v10;
    if (v9)
    {
      [v9 mergeFrom:v10];
    }

    else
    {
      uint64_t v11 = *(void *)(*(void *)(a1 + 32) + 8LL);
      v12 = *(os_log_s **)(v11 + 40);
      *(void *)(v11 + 40) = v10;
      uint64_t v7 = v12;
    }
  }

  else if (v8)
  {
    *(_WORD *)v14 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEBUG,  "daily settings record found but is empty",  v14,  2u);
  }

  objc_autoreleasePoolPop(v4);
  return 1LL;
}

void sub_1000081F4(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (*(void *)(*(void *)(v1 + 8) + 40LL))
  {
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472LL;
    v4[2] = sub_1000082A8;
    v4[3] = &unk_1000286A0;
    v4[4] = v1;
    geo_dispatch_async_qos(21LL, v4);
  }

  else
  {
    id v2 = sub_100007AE4();
    id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "no daily settings to report", buf, 2u);
    }
  }

void sub_1000082A8(uint64_t a1)
{
  id v6 = (id)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) mapSettings]);
  id v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) mapUiShown]);
  id v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) mapsFeatures]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) mapsUserSettings]);
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) routingSettings]);
  +[GEOAPPortal capturePeriodicSettingsWithMapSettings:mapUiShown:mapsFeatures:mapsUserSettings:routingSettings:]( &OBJC_CLASS___GEOAPPortal,  "capturePeriodicSettingsWithMapSettings:mapUiShown:mapsFeatures:mapsUserSettings:routingSettings:",  v6,  v2,  v3,  v4,  v5);
}

void sub_100008604( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
}

uint64_t sub_100008630(NSString *a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_autoreleasePoolPush();
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue([v3 createTime]);
  id v6 = [v5 compare:a1[4]];

  if (v6 != (id)1)
  {
    BOOL v8 = (void *)objc_claimAutoreleasedReturnValue([v3 createTime]);
    id v9 = [v8 compare:a1[5]];

    if (v9 != (id)-1LL)
    {
      ++*(_DWORD *)(*((void *)a1[7] + 1) + 24LL);
      uint64_t v10 = objc_alloc(&OBJC_CLASS___NSString);
      id v11 = [v3 countType];
      v12 = (void *)objc_claimAutoreleasedReturnValue([v3 usageString]);
      id v13 = (void *)objc_claimAutoreleasedReturnValue([v3 usageBool]);
      v14 = -[NSString initWithFormat:](v10, "initWithFormat:", @"%u%@%@", v11, v12, v13);

      os_signpost_id_t v15 = (void *)objc_claimAutoreleasedReturnValue([v3 appId]);
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472LL;
      v17[2] = sub_100008824;
      v17[3] = &unk_100028870;
      id v18 = a1[6];
      id v19 = v14;
      id v20 = v3;
      a1 = v14;
      +[GEOAPUtils appTypeForAppId:resultBlock:](&OBJC_CLASS___GEOAPUtils, "appTypeForAppId:resultBlock:", v15, v17);

      char v7 = 1;
      goto LABEL_7;
    }

LABEL_6:
    char v7 = 0;
    ++*(_DWORD *)(*((void *)a1[8] + 1) + 24LL);
    LOBYTE(a1) = 1;
    goto LABEL_7;
  }

  if (!*(_DWORD *)(*((void *)a1[7] + 1) + 24LL)) {
    goto LABEL_6;
  }
  char v7 = 0;
  LOBYTE(a1) = 0;
LABEL_7:
  objc_autoreleasePoolPop(v4);

  return (v7 | a1) & 1;
}

  v14 = (*(uint64_t (**)(void))(a1[6] + 16LL))();

  return v14;
}

void sub_100008824(uint64_t a1, uint64_t a2)
{
  id v18 = -[NSNumber initWithInt:](objc_alloc(&OBJC_CLASS___NSNumber), "initWithInt:", a2);
  id v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) objectForKeyedSubscript:*(void *)(a1 + 40)]);

  if (!v3)
  {
    id v4 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    [*(id *)(a1 + 32) setObject:v4 forKeyedSubscript:*(void *)(a1 + 40)];
  }

  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) objectForKeyedSubscript:*(void *)(a1 + 40)]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:v18]);

  if (!v6)
  {
    char v7 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    BOOL v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) objectForKeyedSubscript:*(void *)(a1 + 40)]);
    [v8 setObject:v7 forKeyedSubscript:v18];

    uint64_t v9 = *(void *)(a1 + 48);
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) objectForKeyedSubscript:*(void *)(a1 + 40)]);
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:v18]);
    [v11 setObject:v9 forKeyedSubscript:@"e"];
  }

  v12 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) objectForKeyedSubscript:*(void *)(a1 + 40)]);
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:v18]);
  v14 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKeyedSubscript:@"c"]);

  os_signpost_id_t v15 = -[NSNumber initWithInt:]( [NSNumber alloc],  "initWithInt:",  [v14 intValue] + 1);
  id v16 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) objectForKeyedSubscript:*(void *)(a1 + 40)]);
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v16 objectForKeyedSubscript:v18]);
  [v17 setObject:v15 forKeyedSubscript:@"c"];
}

void sub_1000089E8(uint64_t a1)
{
  if (*(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL))
  {
    uint64_t v17 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    if (*(int *)(a1 + 48) >= 1)
    {
      uint64_t v2 = 0LL;
      do
      {
        id v19 = -[NSNumber initWithInt:](objc_alloc(&OBJC_CLASS___NSNumber), "initWithInt:", v2);
        __int128 v23 = 0u;
        __int128 v24 = 0u;
        __int128 v25 = 0u;
        __int128 v26 = 0u;
        id obj = *(id *)(a1 + 32);
        id v20 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
        if (v20)
        {
          uint64_t v18 = *(void *)v24;
          do
          {
            id v3 = 0LL;
            do
            {
              if (*(void *)v24 != v18) {
                objc_enumerationMutation(obj);
              }
              uint64_t v4 = *(void *)(*((void *)&v23 + 1) + 8LL * (void)v3);
              BOOL v5 = objc_autoreleasePoolPush();
              id v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) objectForKeyedSubscript:v4]);
              char v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:v19]);

              if (v7)
              {
                BOOL v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:@"e"]);
                id v9 = objc_alloc_init(&OBJC_CLASS___GEODailyUseSummaryUseEvent);
                objc_msgSend(v9, "setEventType:", objc_msgSend(v8, "countType"));
                uint64_t v10 = v2;
                [v9 setAppType:v2];
                id v11 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:@"c"]);
                objc_msgSend( v9,  "setCount:",  +[GEOAPFuzzers fuzzMonthlyCount:forDailyUsageType:]( GEOAPFuzzers,  "fuzzMonthlyCount:forDailyUsageType:",  objc_msgSend(v11, "unsignedIntValue"),  objc_msgSend(v9, "eventType")));

                v12 = (void *)objc_claimAutoreleasedReturnValue([v8 usageBool]);
                if (v12)
                {
                  id v13 = (void *)objc_claimAutoreleasedReturnValue([v8 usageBool]);
                  objc_msgSend(v9, "setUsageBool:", objc_msgSend(v13, "BOOLValue"));
                }

                v14 = (void *)objc_claimAutoreleasedReturnValue([v8 usageString]);
                [v9 setUsageString:v14];

                -[NSMutableArray addObject:](v17, "addObject:", v9);
                uint64_t v2 = v10;
              }

              objc_autoreleasePoolPop(v5);
              id v3 = (char *)v3 + 1;
            }

            while (v20 != v3);
            id v20 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
          }

          while (v20);
        }

        uint64_t v2 = (v2 + 1);
      }

      while ((int)v2 < *(_DWORD *)(a1 + 48));
    }

    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472LL;
    v21[2] = sub_100008CF4;
    v21[3] = &unk_1000288C0;
    id v22 = v17;
    os_signpost_id_t v15 = v17;
    geo_dispatch_async_qos(21LL, v21);
  }

void sub_100008CF4(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) copy];
  +[GEOAPPortal captureDailyUseSummaryWithUseEvents:summaryPeriod:summaryDate:firstEventDate:user_mapsUseLastDate:]( &OBJC_CLASS___GEOAPPortal,  "captureDailyUseSummaryWithUseEvents:summaryPeriod:summaryDate:firstEventDate:user_mapsUseLastDate:",  v1,  2LL,  0LL,  0LL,  0LL);
}

void sub_100009140( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, uint64_t a48, char a49, uint64_t a50,uint64_t a51,uint64_t a52,char a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,char a59,uint64_t a60,uint64_t a61,uint64_t a62,char a63)
{
}

uint64_t sub_1000091C8(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = objc_autoreleasePoolPush();
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue([v3 createTime]);
  id v6 = [v5 compare:*(void *)(a1 + 32)];

  if (v6 != (id)1)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v3 createTime]);
    id v10 = [v9 compare:*(void *)(a1 + 40)];

    if (v10 != (id)-1LL)
    {
      if ([v3 countType] != 149)
      {
        if ([v3 countType] == 150
          && *(void *)(*(void *)(*(void *)(a1 + 72) + 8LL) + 40LL))
        {
          double v16 = *(double *)(*(void *)(*(void *)(a1 + 80) + 8LL) + 24LL);
          uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v3 createTime]);
          [v17 timeIntervalSinceDate:*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40)];
          *(double *)(*(void *)(*(void *)(a1 + 80) + 8LL) + 24LL) = v16 + v18;

          uint64_t v19 = *(void *)(a1 + 72);
        }

        else
        {
          if ([v3 countType] == 45)
          {
            uint64_t v20 = objc_claimAutoreleasedReturnValue([v3 createTime]);
            uint64_t v21 = *(void *)(*(void *)(a1 + 88) + 8LL);
            id v22 = *(void **)(v21 + 40);
            *(void *)(v21 + 40) = v20;
          }

          if ([v3 countType] != 165
            || !*(void *)(*(void *)(*(void *)(a1 + 88) + 8LL) + 40LL))
          {
            ++*(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL);
            id v28 = objc_alloc(&OBJC_CLASS___NSString);
            id v29 = [v3 countType];
            uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue([v3 usageString]);
            v31 = (void *)objc_claimAutoreleasedReturnValue([v3 usageBool]);
            v32 = -[NSString initWithFormat:](v28, "initWithFormat:", @"%u%@%@", v29, v30, v31);

            v33 = (void *)objc_claimAutoreleasedReturnValue([v3 appId]);
            v34[0] = _NSConcreteStackBlock;
            v34[1] = 3221225472LL;
            v34[2] = sub_10000951C;
            v34[3] = &unk_100028910;
            id v35 = *(id *)(a1 + 48);
            id v36 = v32;
            id v37 = v3;
            __int128 v38 = *(_OWORD *)(a1 + 104);
            uint64_t v39 = *(void *)(a1 + 120);
            BOOL v8 = v32;
            +[GEOAPUtils appTypeForAppId:resultBlock:]( &OBJC_CLASS___GEOAPUtils,  "appTypeForAppId:resultBlock:",  v33,  v34);

            char v7 = 1;
            goto LABEL_9;
          }

          double v23 = *(double *)(*(void *)(*(void *)(a1 + 96) + 8LL) + 24LL);
          __int128 v24 = (void *)objc_claimAutoreleasedReturnValue([v3 createTime]);
          [v24 timeIntervalSinceDate:*(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 40)];
          *(double *)(*(void *)(*(void *)(a1 + 96) + 8LL) + 24LL) = v23 + v25;

          uint64_t v19 = *(void *)(a1 + 88);
        }

        uint64_t v26 = *(void *)(v19 + 8);
        v27 = *(void **)(v26 + 40);
        *(void *)(v26 + 40) = 0LL;

        char v7 = 0;
        uint64_t v14 = *(void *)(a1 + 56);
        goto LABEL_8;
      }

      uint64_t v11 = objc_claimAutoreleasedReturnValue([v3 createTime]);
      uint64_t v12 = *(void *)(*(void *)(a1 + 72) + 8LL);
      id v13 = *(void **)(v12 + 40);
      *(void *)(v12 + 40) = v11;
    }

LABEL_7:
    char v7 = 0;
    uint64_t v14 = *(void *)(a1 + 64);
LABEL_8:
    ++*(_DWORD *)(*(void *)(v14 + 8) + 24LL);
    LOBYTE(v_Block_object_dispose((const void *)(v69 - 176), 8) = 1;
    goto LABEL_9;
  }

  if (!*(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL)) {
    goto LABEL_7;
  }
  char v7 = 0;
  LOBYTE(v_Block_object_dispose((const void *)(v69 - 176), 8) = 0;
LABEL_9:
  objc_autoreleasePoolPop(v4);

  return (v7 | v8) & 1;
}

void sub_10000951C(uint64_t a1, uint64_t a2, int a3)
{
  id v29 = -[NSNumber initWithInt:](objc_alloc(&OBJC_CLASS___NSNumber), "initWithInt:", a2);
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) objectForKeyedSubscript:*(void *)(a1 + 40)]);

  if (!v5)
  {
    id v6 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    [*(id *)(a1 + 32) setObject:v6 forKeyedSubscript:*(void *)(a1 + 40)];
  }

  char v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) objectForKeyedSubscript:*(void *)(a1 + 40)]);
  BOOL v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:v29]);

  if (!v8)
  {
    id v9 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    id v10 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) objectForKeyedSubscript:*(void *)(a1 + 40)]);
    [v10 setObject:v9 forKeyedSubscript:v29];

    uint64_t v11 = *(void *)(a1 + 48);
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) objectForKeyedSubscript:*(void *)(a1 + 40)]);
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:v29]);
    [v13 setObject:v11 forKeyedSubscript:@"e"];
  }

  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) objectForKeyedSubscript:*(void *)(a1 + 40)]);
  os_signpost_id_t v15 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKeyedSubscript:v29]);
  double v16 = (void *)objc_claimAutoreleasedReturnValue([v15 objectForKeyedSubscript:@"c"]);

  uint64_t v17 = -[NSNumber initWithInt:]( [NSNumber alloc],  "initWithInt:",  [v16 intValue] + 1);
  double v18 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) objectForKeyedSubscript:*(void *)(a1 + 40)]);
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v18 objectForKeyedSubscript:v29]);
  [v19 setObject:v17 forKeyedSubscript:@"c"];

  if (!*(void *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 40LL) && a3)
  {
    uint64_t v20 = objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) createTime]);
    uint64_t v21 = *(void *)(*(void *)(a1 + 56) + 8LL);
    id v22 = *(void **)(v21 + 40);
    *(void *)(v21 + 40) = v20;
  }

  if (a3
    && ([*(id *)(a1 + 48) countType] == 45
     || [*(id *)(a1 + 48) countType] == 152))
  {
    if (!*(void *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 40LL))
    {
      uint64_t v23 = objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) createTime]);
      uint64_t v24 = *(void *)(*(void *)(a1 + 64) + 8LL);
      double v25 = *(void **)(v24 + 40);
      *(void *)(v24 + 40) = v23;
    }

    uint64_t v26 = objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) createTime]);
    uint64_t v27 = *(void *)(*(void *)(a1 + 72) + 8LL);
    id v28 = *(void **)(v27 + 40);
    *(void *)(v27 + 40) = v26;
  }
}

void sub_100009794(uint64_t a1)
{
  if (*(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL))
  {
    v31 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    if (*(int *)(a1 + 112) >= 1)
    {
      uint64_t v2 = 0LL;
      do
      {
        v33 = -[NSNumber initWithInt:](objc_alloc(&OBJC_CLASS___NSNumber), "initWithInt:", v2);
        __int128 v40 = 0u;
        __int128 v41 = 0u;
        __int128 v42 = 0u;
        __int128 v43 = 0u;
        id obj = *(id *)(a1 + 32);
        id v34 = [obj countByEnumeratingWithState:&v40 objects:v44 count:16];
        if (v34)
        {
          uint64_t v32 = *(void *)v41;
          do
          {
            id v3 = 0LL;
            do
            {
              if (*(void *)v41 != v32) {
                objc_enumerationMutation(obj);
              }
              uint64_t v4 = *(void *)(*((void *)&v40 + 1) + 8LL * (void)v3);
              BOOL v5 = objc_autoreleasePoolPush();
              id v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) objectForKeyedSubscript:v4]);
              char v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:v33]);

              if (v7)
              {
                BOOL v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:@"e"]);
                id v9 = objc_alloc_init(&OBJC_CLASS___GEODailyUseSummaryUseEvent);
                objc_msgSend(v9, "setEventType:", objc_msgSend(v8, "countType"));
                uint64_t v10 = v2;
                [v9 setAppType:v2];
                uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:@"c"]);
                objc_msgSend( v9,  "setCount:",  +[GEOAPFuzzers fuzzDailyCount:forDailyUsageType:]( GEOAPFuzzers,  "fuzzDailyCount:forDailyUsageType:",  objc_msgSend(v11, "unsignedIntValue"),  objc_msgSend(v9, "eventType")));

                uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v8 usageBool]);
                if (v12)
                {
                  id v13 = (void *)objc_claimAutoreleasedReturnValue([v8 usageBool]);
                  objc_msgSend(v9, "setUsageBool:", objc_msgSend(v13, "BOOLValue"));
                }

                uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v8 usageString]);
                [v9 setUsageString:v14];

                -[NSMutableArray addObject:](v31, "addObject:", v9);
                uint64_t v2 = v10;
              }

              objc_autoreleasePoolPop(v5);
              id v3 = (char *)v3 + 1;
            }

            while (v34 != v3);
            id v34 = [obj countByEnumeratingWithState:&v40 objects:v44 count:16];
          }

          while (v34);
        }

        uint64_t v2 = (v2 + 1);
      }

      while ((int)v2 < *(_DWORD *)(a1 + 112));
    }

    if (*(void *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 40LL)
      && (_GEOConfigHasValue(GeoUserSessionConfig_MapsUserStartDate[0], GeoUserSessionConfig_MapsUserStartDate[1]) & 1) == 0)
    {
      [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) timeIntervalSinceReferenceDate];
      GEOConfigSetDouble(GeoUserSessionConfig_MapsUserStartDate[0], GeoUserSessionConfig_MapsUserStartDate[1]);
    }

    if (_GEOConfigHasValue(GeoAnalyticsConfig_MapsLastUseDate[0], GeoAnalyticsConfig_MapsLastUseDate[1]))
    {
      os_signpost_id_t v15 = objc_alloc(&OBJC_CLASS___NSNumber);
      GEOConfigGetDouble(GeoAnalyticsConfig_MapsLastUseDate[0], GeoAnalyticsConfig_MapsLastUseDate[1]);
      double v16 = -[NSNumber initWithDouble:](v15, "initWithDouble:");
    }

    else
    {
      double v16 = 0LL;
    }

    uint64_t v17 = *(void **)(*(void *)(*(void *)(a1 + 64) + 8LL) + 40LL);
    if (v17)
    {
      [v17 timeIntervalSinceReferenceDate];
      GEOConfigSetDouble(GeoAnalyticsConfig_MapsLastUseDate[0], GeoAnalyticsConfig_MapsLastUseDate[1]);
    }

    if (*(double *)(*(void *)(*(void *)(a1 + 72) + 8LL) + 24LL) > 0.0)
    {
      id v18 = objc_alloc_init(&OBJC_CLASS___GEODailyUseSummaryUseEvent);
      [v18 setEventType:151];
      [v18 setAppType:0];
      uint64_t v19 = *(void *)(*(void *)(*(void *)(a1 + 80) + 8LL) + 40LL);
      if (v19 && v19 != *(void *)(a1 + 40)) {
        [v18 setUsageString:@"Dropped counts"];
      }
      objc_msgSend( v18,  "setCount:",  +[GEOAPFuzzers fuzzDailyCount:forDailyUsageType:]( GEOAPFuzzers,  "fuzzDailyCount:forDailyUsageType:",  *(double *)(*(void *)(*(void *)(a1 + 72) + 8) + 24),  objc_msgSend(v18, "eventType")));
      -[NSMutableArray addObject:](v31, "addObject:", v18);
    }

    if (*(double *)(*(void *)(*(void *)(a1 + 88) + 8LL) + 24LL) > 0.0)
    {
      id v20 = objc_alloc_init(&OBJC_CLASS___GEODailyUseSummaryUseEvent);
      [v20 setEventType:166];
      [v20 setAppType:0];
      uint64_t v21 = *(void *)(*(void *)(*(void *)(a1 + 96) + 8LL) + 40LL);
      if (v21)
      {
        if (v21 != *(void *)(a1 + 40)) {
          [v20 setUsageString:@"Dropped counts"];
        }
      }

      objc_msgSend( v20,  "setCount:",  +[GEOAPFuzzers fuzzDailyCount:forDailyUsageType:]( GEOAPFuzzers,  "fuzzDailyCount:forDailyUsageType:",  *(double *)(*(void *)(*(void *)(a1 + 88) + 8) + 24),  objc_msgSend(v20, "eventType")));
      -[NSMutableArray addObject:](v31, "addObject:", v20);
    }

    id v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSTimeZone defaultTimeZone](&OBJC_CLASS___NSTimeZone, "defaultTimeZone"));
    uint64_t v23 = objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeInterval:sinceDate:]( NSDate,  "dateWithTimeInterval:sinceDate:",  *(void *)(*(void *)(*(void *)(a1 + 104) + 8) + 40),  (double)(uint64_t)[v22 secondsFromGMTForDate:*(void *)(*(void *)(*(void *)(a1 + 104) + 8) + 40)]));
    uint64_t v24 = *(void *)(*(void *)(a1 + 104) + 8LL);
    double v25 = *(void **)(v24 + 40);
    *(void *)(v24 + 40) = v23;

    v35[0] = _NSConcreteStackBlock;
    v35[1] = 3221225472LL;
    v35[2] = sub_100009D3C;
    v35[3] = &unk_100028960;
    id v36 = v31;
    id v26 = *(id *)(a1 + 40);
    uint64_t v27 = *(void *)(a1 + 104);
    __int128 v38 = v16;
    uint64_t v39 = v27;
    id v37 = v26;
    id v28 = v16;
    id v29 = v31;
    geo_dispatch_async_qos(21LL, v35);
  }

void sub_100009D3C(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) copy];
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue( +[GEOAPUtils dailyAggregationTimestampFromDate:]( &OBJC_CLASS___GEOAPUtils,  "dailyAggregationTimestampFromDate:",  *(void *)(a1 + 40)));
  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) timeIntervalSinceReferenceDate];
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
  +[GEOAPPortal captureDailyUseSummaryWithUseEvents:summaryPeriod:summaryDate:firstEventDate:user_mapsUseLastDate:]( &OBJC_CLASS___GEOAPPortal,  "captureDailyUseSummaryWithUseEvents:summaryPeriod:summaryDate:firstEventDate:user_mapsUseLastDate:",  v4,  1LL,  v2,  v3,  *(void *)(a1 + 48));
}

void sub_10000A0F0(id *a1)
{
  if (a1)
  {
    id v2 = sub_100007AE4();
    id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "starting eval mode aggregation", buf, 2u);
    }

    [a1[4] lock];
    id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate distantPast](&OBJC_CLASS___NSDate, "distantPast"));
    BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate distantFuture](&OBJC_CLASS___NSDate, "distantFuture"));
    [a1 aggregateDailyCountsAndReportFrom:v4 until:v5];

    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate distantPast](&OBJC_CLASS___NSDate, "distantPast"));
    char v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate distantFuture](&OBJC_CLASS___NSDate, "distantFuture"));
    [a1 aggregateMonthlyCountsAndReportFrom:v6 until:v7];

    [a1[4] unlock];
    id v8 = sub_100007AE4();
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)uint64_t v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "finished eval mode aggregation", v10, 2u);
    }
  }

void sub_10000A268(id a1)
{
  os_log_t v1 = os_log_create("com.apple.GeoAnalytics", "Aggregator");
  id v2 = (void *)qword_100033DB8;
  qword_100033DB8 = (uint64_t)v1;
}

uint64_t sub_10000A298(uint64_t a1)
{
  uint64_t v4 = 0LL;
  BOOL v5 = &v4;
  uint64_t v6 = 0x2020000000LL;
  uint64_t v1 = qword_100033DC8;
  uint64_t v7 = qword_100033DC8;
  if (!qword_100033DC8)
  {
    v8[0] = *(_OWORD *)off_1000289C8;
    v8[1] = *(_OWORD *)&off_1000289D8;
    uint64_t v2 = _sl_dlopen(v8, a1);
    v5[3] = v2;
    qword_100033DC8 = v2;
    uint64_t v1 = v2;
  }

  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_10000A344( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

uint64_t sub_10000A35C()
{
  id v3 = 0LL;
  uint64_t v0 = sub_10000A298((uint64_t)&v3);
  uint64_t v1 = v3;
  if (!v0)
  {
    uint64_t v1 = (char *)abort_report_np("%s", v3);
    goto LABEL_5;
  }

  if (v3) {
LABEL_5:
  }
    free(v1);
  return v0;
}

void *sub_10000A3B4()
{
  uint64_t v3 = 0LL;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000LL;
  uint64_t v0 = (void *)qword_100033DD0;
  uint64_t v6 = qword_100033DD0;
  if (!qword_100033DD0)
  {
    uint64_t v1 = (void *)sub_10000A35C();
    uint64_t v0 = dlsym(v1, "AnalyticsSendEventLazy");
    v4[3] = (uint64_t)v0;
    qword_100033DD0 = (uint64_t)v0;
  }

  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_10000A428( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

id *sub_10000A440(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  uint64_t v5 = (uint64_t (*)(id, id))sub_10000A3B4();
  if (v5)
  {
    uint64_t v6 = v5(v3, v4);

    return (id *)v6;
  }

  else
  {
    id v8 = (id *)sub_10001A464();
    return sub_10000A4A0(v8, v9);
  }

id *sub_10000A4A0(id *a1, void *a2)
{
  id v4 = a2;
  if (a1)
  {
    v13.receiver = a1;
    v13.super_class = (Class)&OBJC_CLASS___GEOAPDaemonManagerBridge;
    uint64_t v5 = (id *)objc_msgSendSuper2(&v13, "init");
    a1 = v5;
    if (v5)
    {
      objc_storeStrong(v5 + 1, a2);
      id v6 = sub_10000A67C();
      uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134217984;
        os_signpost_id_t v15 = a1;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "hello connection %p", buf, 0xCu);
      }

      objc_initWeak((id *)buf, a1);
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472LL;
      v11[2] = sub_10000A6BC;
      v11[3] = &unk_1000289F0;
      objc_copyWeak(&v12, (id *)buf);
      [a1[1] setInterruptionHandler:v11];
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472LL;
      v9[2] = sub_10000A704;
      v9[3] = &unk_1000289F0;
      objc_copyWeak(&v10, (id *)buf);
      [a1[1] setInvalidationHandler:v9];
      objc_destroyWeak(&v10);
      objc_destroyWeak(&v12);
      objc_destroyWeak((id *)buf);
    }
  }

  return a1;
}

void sub_10000A648( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, id location)
{
}

id sub_10000A67C()
{
  if (qword_100033DE8 != -1) {
    dispatch_once(&qword_100033DE8, &stru_100028AB0);
  }
  return (id)qword_100033DE0;
}

void sub_10000A6BC(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained[1] invalidate];
    id v2 = v3[1];
    v3[1] = 0LL;

    WeakRetained = v3;
  }
}

void sub_10000A704(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = (void *)WeakRetained[1];
    WeakRetained[1] = 0LL;
    id v3 = WeakRetained;

    WeakRetained = v3;
  }
}

uint64_t sub_10000ABF0(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_10000AFB8(uint64_t a1)
{
  id v2 = sub_10000A67C();
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    id v10 = "-[GEOAPDaemonManagerBridge showEvalData]_block_invoke";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "%s", buf, 0xCu);
  }

  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[GEOAPServiceManager sharedManager](&OBJC_CLASS___GEOAPServiceManager, "sharedManager"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10000B110;
  v7[3] = &unk_100028A18;
  id v8 = *(id *)(a1 + 32);
  [v4 showEvalDataWithVisitorBlock:v7];

  id v5 = sub_10000A67C();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "will call endEvalData", buf, 2u);
  }

  [*(id *)(a1 + 32) endEvalData];
}

void sub_10000B110(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v7 = a4;
  id v8 = a3;
  id v9 = sub_10000A67C();
  id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    int v11 = 134217984;
    uint64_t v12 = a2;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "eval visit type %llu", (uint8_t *)&v11, 0xCu);
  }

  [*(id *)(a1 + 32) evalData:v8 ofType:a2 createTime:v7];
}

void sub_10000B3A8(_Unwind_Exception *a1)
{
}

void sub_10000B3D8(uint64_t a1)
{
  id v2 = sub_1000168E0();
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  sub_100016CF0((uint64_t)v3, *(void **)(a1 + 32));

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v6 = WeakRetained;
    [WeakRetained[1] invalidate];
    id v5 = v6[1];
    v6[1] = 0LL;

    WeakRetained = v6;
  }
}

void sub_10000B44C(uint64_t a1)
{
  id v2 = sub_1000168E0();
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  sub_100016CF0((uint64_t)v3, *(void **)(a1 + 32));

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v5 = (void *)WeakRetained[1];
    WeakRetained[1] = 0LL;
    id v6 = WeakRetained;

    WeakRetained = v6;
  }
}

id sub_10000B718(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, int a8)
{
  LODWORD(v9) = a8;
  return [*(id *)(a1 + 32) inflightBatchUUID:a2 createTime:a3 analyticSessionType:a4 eventCount:a5 uploadSize:a6 urlSessionType:a7 stageNumber:v9];
}

id sub_10000B758(uint64_t a1)
{
  return [*(id *)(a1 + 32) endInflightData];
}

id sub_10000B8BC( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, unsigned int a8, unsigned int a9)
{
  return [*(id *)(a1 + 32) uploadHistoryForBatchUUID:a2 endDate:a3 uploadLatency:a4 analyticSessionType:a5 eventCount:a6 uploadSize:a7 urlSessionType:__PAIR64__(a9 stageNumber:a8)];
}

id sub_10000B900(uint64_t a1)
{
  return [*(id *)(a1 + 32) endHistoricalData];
}

id sub_10000B9B4()
{
  uint64_t v3 = 0LL;
  id v4 = &v3;
  uint64_t v5 = 0x3032000000LL;
  id v6 = sub_10000BA80;
  id v7 = sub_10000BA90;
  id v8 = 0LL;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10000BA98;
  block[3] = &unk_1000286A0;
  block[4] = &v3;
  if (qword_100033DD8 != -1) {
    dispatch_once(&qword_100033DD8, block);
  }
  id v0 = (id)v4[5];
  _Block_object_dispose(&v3, 8);

  return v0;
}

uint64_t sub_10000BA80(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_10000BA90(uint64_t a1)
{
}

void sub_10000BA98(uint64_t a1)
{
  id v2 = objc_alloc_init(&OBJC_CLASS___GEOAPDaemon);
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8LL);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void sub_10000BE18(uint64_t a1)
{
  id v2 = sub_10000A67C();
  uint64_t v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "SIGTERM received", v5, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _shutdown];
}

id *sub_10000BE94(id *result)
{
  if (result)
  {
    uint64_t v1 = result;
    [result _setupSigHandler];
    return (id *)[v1[1] activate];
  }

  return result;
}

BOOL sub_10000BEC0(BOOL result)
{
  if (result) {
    return *(_BYTE *)(result + 32) != 0;
  }
  return result;
}

void sub_10000BF10(id a1)
{
  os_log_t v1 = os_log_create("com.apple.GeoAnalytics", "GEOAPDaemon");
  id v2 = (void *)qword_100033DE0;
  qword_100033DE0 = (uint64_t)v1;
}

id sub_10000BF40(void *a1, uint64_t a2)
{
  if (!a1)
  {
    id v4 = 0LL;
LABEL_10:
    id v18 = 0LL;
    goto LABEL_11;
  }

  v22.receiver = a1;
  v22.super_class = (Class)&OBJC_CLASS___GEOAPUploadFileWriter;
  id v3 = objc_msgSendSuper2(&v22, "init");
  id v4 = v3;
  if (v3)
  {
    *((_DWORD *)v3 + 24) = 0;
    *((void *)v3 + 2) = a2;
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[GEOAPUtils GEOAPCachePath](&OBJC_CLASS___GEOAPUtils, "GEOAPCachePath"));
    id v6 = objc_alloc_init(&OBJC_CLASS___NSUUID);
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSUUID UUIDString](v6, "UUIDString"));
    uint64_t v8 = objc_claimAutoreleasedReturnValue([v5 stringByAppendingPathComponent:v7]);
    uint64_t v9 = (void *)*((void *)v4 + 3);
    *((void *)v4 + 3) = v8;

    int v10 = open((const char *)[*((id *)v4 + 3) fileSystemRepresentation], 1537, 416);
    *((_DWORD *)v4 + 2) = v10;
    if (v10 < 0)
    {
      id v13 = sub_10000C130();
      uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        uint64_t v14 = *((void *)v4 + 3);
        os_signpost_id_t v15 = __error();
        double v16 = strerror(*v15);
        *(_DWORD *)buf = 138412546;
        uint64_t v24 = v14;
        __int16 v25 = 2080;
        id v26 = v16;
        _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_ERROR,  "unable to create upload file '%@' (%s)",  buf,  0x16u);
      }
    }

    else
    {
      uint64_t v11 = GEOBatchAnalyticsSessionType(a2);
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472LL;
      v20[2] = sub_10000C170;
      v20[3] = &unk_100028AD8;
      id v21 = v4;
      [v21 _arpcDataForType:v11 dataBlock:v20];
      uint64_t v12 = (os_log_s *)v21;
    }

    int v17 = *((_DWORD *)v4 + 2);
    if (v17 < 0) {
      goto LABEL_10;
    }
  }

  id v4 = v4;
  id v18 = v4;
LABEL_11:

  return v18;
}

id sub_10000C130()
{
  if (qword_100033E18 != -1) {
    dispatch_once(&qword_100033E18, &stru_100028CD0);
  }
  return (id)qword_100033E10;
}

void sub_10000C170(uint64_t a1, void *a2, int a3)
{
  id v5 = a2;
  int v6 = *(_DWORD *)(*(void *)(a1 + 32) + 8LL);
  id v7 = v5;
  unint64_t v8 = write(v6, [v7 bytes], (size_t)objc_msgSend(v7, "length"));
  if (v8 < (unint64_t)[v7 length])
  {
    id v9 = sub_10000C130();
    int v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      uint64_t v11 = *(void *)(*(void *)(a1 + 32) + 24LL);
      uint64_t v12 = __error();
      id v13 = strerror(*v12);
      *(_DWORD *)buf = 138412546;
      uint64_t v26 = v11;
      __int16 v27 = 2080;
      id v28 = v13;
      uint64_t v14 = "unable to write ARPC header to file '%@' (%s)";
LABEL_11:
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, v14, buf, 0x16u);
      goto LABEL_12;
    }

    goto LABEL_12;
  }

  *(void *)(*(void *)(a1 + 32) + 88) = [v7 length];
  int __buf = 0;
  if ((unint64_t)write(*(_DWORD *)(*(void *)(a1 + 32) + 8LL), &__buf, 4uLL) <= 3)
  {
    id v15 = sub_10000C130();
    int v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      uint64_t v16 = *(void *)(*(void *)(a1 + 32) + 24LL);
      int v17 = __error();
      id v18 = strerror(*v17);
      *(_DWORD *)buf = 138412546;
      uint64_t v26 = v16;
      __int16 v27 = 2080;
      id v28 = v18;
      uint64_t v14 = "unable to write len placeholder to file '%@' (%s)";
      goto LABEL_11;
    }

LABEL_12:
    close(*(_DWORD *)(*(void *)(a1 + 32) + 8LL));
    *(_DWORD *)(*(void *)(a1 + 32) + 8LL) = -1;
    goto LABEL_13;
  }

  *(_BYTE *)(*(void *)(a1 + 32) + 12LL) = a3;
  if (a3)
  {
    if (compression_stream_init( (compression_stream *)(*(void *)(a1 + 32) + 32LL),  COMPRESSION_STREAM_ENCODE,  COMPRESSION_LZ4) == COMPRESSION_STATUS_OK)
    {
      size_t UInteger = GEOConfigGetUInteger( GeoAnalyticsConfig_CompressionOutputBufferSize[0],  GeoAnalyticsConfig_CompressionOutputBufferSize[1]);
      *(void *)(*(void *)(a1 + 32) + 72LL) = malloc(UInteger);
      *(void *)(*(void *)(a1 + 32) + 80LL) = UInteger;
      goto LABEL_13;
    }

    id v19 = sub_10000C130();
    int v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      goto LABEL_12;
    }
    uint64_t v20 = *(void *)(*(void *)(a1 + 32) + 24LL);
    id v21 = __error();
    objc_super v22 = strerror(*v21);
    *(_DWORD *)buf = 138412546;
    uint64_t v26 = v20;
    __int16 v27 = 2080;
    id v28 = v22;
    uint64_t v14 = "unable to initialize ARPC header to file '%@' (%s)";
    goto LABEL_11;
  }
}

LABEL_13:
}

uint64_t sub_10000C520(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (!a1) {
    goto LABEL_30;
  }
  if ((*(_DWORD *)(a1 + 8) & 0x80000000) != 0) {
    goto LABEL_29;
  }
  char __buf = 10;
  unint64_t v5 = (unint64_t)[v3 length];
  if (v5 < 0x80)
  {
    id v9 = v44;
    LOBYTE(v6) = 1;
LABEL_9:
    *id v9 = v5;
  }

  else
  {
    uint64_t v6 = 1LL;
    while (v6 != 16)
    {
      v44[v6 - 1] = v5 | 0x80;
      unint64_t v7 = v5 >> 7;
      ++v6;
      unint64_t v8 = v5 >> 14;
      v5 >>= 7;
      if (!v8)
      {
        id v9 = &v44[v6 - 1];
        LOBYTE(v5) = v7;
        goto LABEL_9;
      }
    }

    LOBYTE(v6) = 0;
  }

  if (!*(_BYTE *)(a1 + 12))
  {
    int v12 = v6 + 1;
    if (write(*(_DWORD *)(a1 + 8), &__buf, v6 + 1LL) <= v6)
    {
      id v26 = sub_10000C130();
      int v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
      if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        goto LABEL_28;
      }
    }

    else
    {
      int v13 = *(_DWORD *)(a1 + 8);
      id v14 = v4;
      unint64_t v15 = write(v13, [v14 bytes], (size_t)objc_msgSend(v14, "length"));
      if (v15 >= (unint64_t)[v14 length])
      {
        *(_DWORD *)(a1 + 96) += [v14 length] + v12;
LABEL_39:
        a1 = 1LL;
        goto LABEL_30;
      }

      id v16 = sub_10000C130();
      int v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
      if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        goto LABEL_28;
      }
    }

    uint64_t v27 = *(void *)(a1 + 24);
    id v28 = __error();
    id v29 = strerror(*v28);
    int v39 = 138412546;
    uint64_t v40 = v27;
    __int16 v41 = 2080;
    __int128 v42 = v29;
    __int16 v25 = "unable to write data to file '%@' (%s)";
    goto LABEL_27;
  }

  *(void *)(a1 + 32) = *(void *)(a1 + 72);
  *(void *)(a1 + 4_Block_object_dispose(&a9, 8) = &__buf;
  *(void *)(a1 + 56) = v6 + 1LL;
  *(void *)(a1 + 40) = *(void *)(a1 + 80);
  if (compression_stream_process((compression_stream *)(a1 + 32), 0))
  {
    id v10 = sub_10000C130();
    uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v39) = 0;
LABEL_15:
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "compress process failed", (uint8_t *)&v39, 2u);
    }

LABEL_16:
    goto LABEL_29;
  }

  uint64_t v18 = *(void *)(a1 + 80);
  uint64_t v19 = *(void *)(a1 + 40);
  unint64_t v20 = v18 - v19;
  if (v18 != v19)
  {
    if (write(*(_DWORD *)(a1 + 8), *(const void **)(a1 + 72), v18 - v19) < v20)
    {
      id v21 = sub_10000C130();
      int v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        goto LABEL_24;
      }
      goto LABEL_28;
    }

    *(_DWORD *)(a1 + 96) += v20;
  }

  id v31 = v4;
  *(void *)(a1 + 4_Block_object_dispose(&a9, 8) = [v31 bytes];
  id v32 = [v31 length];
  *(void *)(a1 + 56) = v32;
  if (!v32) {
    goto LABEL_39;
  }
  while (1)
  {
    uint64_t v33 = *(void *)(a1 + 80);
    *(void *)(a1 + 32) = *(void *)(a1 + 72);
    *(void *)(a1 + 40) = v33;
    if (compression_stream_process((compression_stream *)(a1 + 32), 0))
    {
      id v37 = sub_10000C130();
      uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v37);
      if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        goto LABEL_16;
      }
      LOWORD(v39) = 0;
      goto LABEL_15;
    }

    uint64_t v34 = *(void *)(a1 + 80);
    uint64_t v35 = *(void *)(a1 + 40);
    unint64_t v36 = v34 - v35;
    if (v34 != v35) {
      break;
    }
LABEL_38:
    if (!*(void *)(a1 + 56)) {
      goto LABEL_39;
    }
  }

  if (write(*(_DWORD *)(a1 + 8), *(const void **)(a1 + 72), v34 - v35) >= v36)
  {
    *(_DWORD *)(a1 + 96) += v36;
    goto LABEL_38;
  }

  id v38 = sub_10000C130();
  int v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v38);
  if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
    goto LABEL_28;
  }
LABEL_24:
  uint64_t v22 = *(void *)(a1 + 24);
  uint64_t v23 = __error();
  uint64_t v24 = strerror(*v23);
  int v39 = 138412546;
  uint64_t v40 = v22;
  __int16 v41 = 2080;
  __int128 v42 = v24;
  __int16 v25 = "unable to write compressed data to file '%@' (%s)";
LABEL_27:
  _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, v25, (uint8_t *)&v39, 0x16u);
LABEL_28:

LABEL_29:
  a1 = 0LL;
LABEL_30:

  return a1;
}

uint64_t sub_10000C964(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (!a1) {
    goto LABEL_34;
  }
  int v4 = *(_DWORD *)(a1 + 8);
  if (v4 < 0) {
    goto LABEL_33;
  }
  if (!*(_BYTE *)(a1 + 12))
  {
LABEL_13:
    if (lseek(v4, *(void *)(a1 + 88), 0) == *(void *)(a1 + 88))
    {
      *(_DWORD *)(a1 + 96) = bswap32(*(_DWORD *)(a1 + 96));
      if ((unint64_t)write(*(_DWORD *)(a1 + 8), (const void *)(a1 + 96), 4uLL) > 3)
      {
        close(*(_DWORD *)(a1 + 8));
        *(_DWORD *)(a1 + _Block_object_dispose(&a9, 8) = -1;
        id v21 = (const char *)[*(id *)(a1 + 24) fileSystemRepresentation];
        id v22 = v3;
        uint64_t v23 = (const char *)[v22 fileSystemRepresentation];
        id v24 = sub_10000C130();
        __int16 v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315394;
          id v37 = v21;
          __int16 v38 = 2080;
          int v39 = (void *)v23;
          _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEBUG,  "moving finalized file '%s' to '%s'",  buf,  0x16u);
        }

        if ((rename(v21, v23) & 0x80000000) == 0)
        {
          if (chmod(v23, 0x120u) < 0)
          {
            id v26 = sub_10000C130();
            uint64_t v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
            if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
            {
              id v28 = __error();
              id v29 = strerror(*v28);
              *(_DWORD *)buf = 138412546;
              id v37 = (const char *)v22;
              __int16 v38 = 2080;
              int v39 = v29;
              _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_ERROR,  "unable to set file perms on file '%@' (%s)",  buf,  0x16u);
            }
          }

          a1 = 1LL;
          goto LABEL_34;
        }

        id v31 = sub_10000C130();
        uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
        if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
          goto LABEL_32;
        }
        id v32 = __error();
        uint64_t v33 = strerror(*v32);
        *(_DWORD *)buf = 138412546;
        id v37 = (const char *)v22;
        __int16 v38 = 2080;
        int v39 = v33;
        unint64_t v15 = "unable to move finalized file to '%@' (%s)";
LABEL_31:
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, v15, buf, 0x16u);
        goto LABEL_32;
      }

      id v16 = sub_10000C130();
      uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
      if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        goto LABEL_32;
      }
    }

    else
    {
      id v20 = sub_10000C130();
      uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
      if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        goto LABEL_32;
      }
    }

    int v17 = *(const char **)(a1 + 24);
    uint64_t v18 = __error();
    uint64_t v19 = strerror(*v18);
    *(_DWORD *)buf = 138412546;
    id v37 = v17;
    __int16 v38 = 2080;
    int v39 = v19;
    unint64_t v15 = "unable to update finalized file '%@' with length (%s)";
    goto LABEL_31;
  }

  char v35 = 0;
  while (1)
  {
    *(void *)(a1 + 4_Block_object_dispose(&a9, 8) = &v35;
    *(void *)(a1 + 56) = 0LL;
    uint64_t v5 = *(void *)(a1 + 80);
    *(void *)(a1 + 32) = *(void *)(a1 + 72);
    *(void *)(a1 + 40) = v5;
    compression_status v6 = compression_stream_process((compression_stream *)(a1 + 32), 1);
    uint64_t v7 = *(void *)(a1 + 80);
    uint64_t v8 = *(void *)(a1 + 40);
    unint64_t v9 = v7 - v8;
    if (v7 != v8) {
      break;
    }
LABEL_8:
    if (v6)
    {
      if (v6 == COMPRESSION_STATUS_ERROR)
      {
        id v10 = sub_10000C130();
        uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
        if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
          goto LABEL_32;
        }
        goto LABEL_11;
      }

      compression_stream_destroy((compression_stream *)(a1 + 32));
      free(*(void **)(a1 + 72));
      *(_BYTE *)(a1 + 12) = 0;
      int v4 = *(_DWORD *)(a1 + 8);
      goto LABEL_13;
    }
  }

  if (write(*(_DWORD *)(a1 + 8), *(const void **)(a1 + 72), v7 - v8) >= v9)
  {
    *(_DWORD *)(a1 + 96) += v9;
    goto LABEL_8;
  }

  id v30 = sub_10000C130();
  uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
LABEL_11:
    int v12 = *(const char **)(a1 + 24);
    int v13 = __error();
    id v14 = strerror(*v13);
    *(_DWORD *)buf = 138412546;
    id v37 = v12;
    __int16 v38 = 2080;
    int v39 = v14;
    unint64_t v15 = "unable to write finalized compressed data to file '%@' (%s)";
    goto LABEL_31;
  }

LABEL_32:
LABEL_33:
  a1 = 0LL;
LABEL_34:

  return a1;
}

id sub_10000CD98()
{
  if (qword_100033DF8 != -1) {
    dispatch_once(&qword_100033DF8, &stru_100028AF8);
  }
  return (id)qword_100033DF0;
}

void sub_10000CDDC(id a1)
{
  os_log_t v1 = objc_alloc_init(&OBJC_CLASS___GEOAPUploader);
  id v2 = (void *)qword_100033DF0;
  qword_100033DF0 = (uint64_t)v1;
}

void sub_10000CECC(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue( +[GEOAPURLSessionConfig allSessionConfigTypes]( &OBJC_CLASS___GEOAPURLSessionConfig,  "allSessionConfigTypes"));
  id v3 = objc_alloc_init(&OBJC_CLASS___NSCache);
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void **)(v4 + 24);
  *(void *)(v4 + 24) = v3;

  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 24), "setCountLimit:", objc_msgSend(v2, "count"));
  objc_msgSend( *(id *)(*(void *)(a1 + 32) + 24),  "setTotalCostLimit:",  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 24), "countLimit"));
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  id v6 = v2;
  id v7 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v20;
    do
    {
      id v10 = 0LL;
      do
      {
        if (*(void *)v20 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( *(id *)(a1 + 32),  "_sessionForType:",  objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * (void)v10), "intValue")));
        [v11 getAllTasksWithCompletionHandler:&stru_100028B38];

        id v10 = (char *)v10 + 1;
      }

      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }

    while (v8);
  }

  dispatch_source_t v12 = dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_timer,  0LL,  0LL,  *(dispatch_queue_t *)(*(void *)(a1 + 32) + 8LL));
  uint64_t v13 = *(void *)(a1 + 32);
  id v14 = *(void **)(v13 + 16);
  *(void *)(v13 + 16) = v12;

  dispatch_source_set_timer(*(dispatch_source_t *)(*(void *)(a1 + 32) + 16LL), 0xFFFFFFFFFFFFFFFFLL, 0LL, 0LL);
  unint64_t v15 = *(void **)(a1 + 32);
  id v16 = (dispatch_source_s *)v15[2];
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472LL;
  handler[2] = sub_10000D288;
  handler[3] = &unk_1000288C0;
  uint64_t v18 = v15;
  dispatch_source_set_event_handler(v16, handler);
  dispatch_activate(*(dispatch_object_t *)(*(void *)(a1 + 32) + 16LL));
  [*(id *)(a1 + 32) _clearExpired];
}

void sub_10000D0F4(id a1, NSArray *a2)
{
  id v2 = a2;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  id v3 = -[NSArray countByEnumeratingWithState:objects:count:]( v2,  "countByEnumeratingWithState:objects:count:",  &v15,  v23,  16LL);
  if (v3)
  {
    id v5 = v3;
    uint64_t v6 = *(void *)v16;
    *(void *)&__int128 v4 = 138412546LL;
    __int128 v14 = v4;
    do
    {
      for (i = 0LL; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v16 != v6) {
          objc_enumerationMutation(v2);
        }
        id v8 = *(void **)(*((void *)&v15 + 1) + 8LL * (void)i);
        id v9 = objc_msgSend(v8, "state", v14);
        else {
          uint64_t v10 = (uint64_t)*(&off_100028CF0 + (void)v9);
        }
        id v11 = sub_10000C130();
        dispatch_source_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v8 taskDescription]);
          *(_DWORD *)buf = v14;
          uint64_t v20 = v10;
          __int16 v21 = 2112;
          __int128 v22 = v13;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "found %@ task with desc %@", buf, 0x16u);
        }
      }

      id v5 = -[NSArray countByEnumeratingWithState:objects:count:]( v2,  "countByEnumeratingWithState:objects:count:",  &v15,  v23,  16LL);
    }

    while (v5);
  }
}

id sub_10000D288(uint64_t a1)
{
  id v2 = sub_10000C130();
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "analytics upload timer fired", v5, 2u);
  }

  return [*(id *)(a1 + 32) _submitBatchesForUpload];
}

void sub_10000D338(id a1)
{
  uint64_t v1 = objc_claimAutoreleasedReturnValue(+[GEOAPPersistence sharedInstance](&OBJC_CLASS___GEOAPPersistence, "sharedInstance"));
  id v2 = (void *)qword_100033E00;
  qword_100033E00 = v1;
}

void sub_10000D4A4(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = sub_10000C130();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "background task started; enqueuing work", buf, 2u);
  }

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10000D5A8;
  block[3] = &unk_1000288C0;
  uint64_t v6 = *(dispatch_queue_s **)(a1 + 32);
  block[4] = *(void *)(a1 + 40);
  dispatch_async(v6, block);
  id v7 = sub_10000C130();
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "background task finished", buf, 2u);
  }

  [v3 setTaskCompleted];
}

void sub_10000D5A8(uint64_t a1)
{
  uint64_t v2 = _GEOCreateTransaction("com.apple.geo.com.apple.geo.analytics.aggregator");
  id v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  id v4 = sub_10000C130();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  os_signpost_id_t v6 = os_signpost_id_generate(v5);

  id v7 = objc_alloc_init(&OBJC_CLASS___NSDate);
  id v8 = sub_10000C130();
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  uint64_t v10 = v9;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    int v29 = 138412290;
    id v30 = v7;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v10,  OS_SIGNPOST_INTERVAL_BEGIN,  v6,  "AggregateAndUpload",  "at '%@'",  (uint8_t *)&v29,  0xCu);
  }

  id v11 = sub_10000C130();
  dispatch_source_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    LOWORD(v29) = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_INFO,  "starting fqid counts aggregation",  (uint8_t *)&v29,  2u);
  }

  id v13 = sub_1000074C0();
  __int128 v14 = (id *)objc_claimAutoreleasedReturnValue(v13);
  sub_100007DF4(v14);

  id v15 = sub_10000C130();
  __int128 v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    LOWORD(v29) = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_INFO,  "finished fqid counts aggregation",  (uint8_t *)&v29,  2u);
  }

  id v17 = sub_10000C130();
  __int128 v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    LOWORD(v29) = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_INFO,  "starting netevent aggregation",  (uint8_t *)&v29,  2u);
  }

  __int128 v19 = (void *)objc_claimAutoreleasedReturnValue(+[GEOAPNetEventAggregator sharedAggregator](&OBJC_CLASS___GEOAPNetEventAggregator, "sharedAggregator"));
  [v19 runAggregation];

  id v20 = sub_10000C130();
  __int16 v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
  {
    LOWORD(v29) = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_INFO,  "finished netevent aggregation",  (uint8_t *)&v29,  2u);
  }

  id v22 = sub_10000C130();
  uint64_t v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
  if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
  {
    LOWORD(v29) = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_INFO,  "submitting batches for upload",  (uint8_t *)&v29,  2u);
  }

  sub_10000D8F0(*(void *)(a1 + 32));
  id v24 = sub_10000C130();
  __int16 v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
  if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
  {
    LOWORD(v29) = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_INFO,  "finished submitting batches for upload",  (uint8_t *)&v29,  2u);
  }

  id v26 = sub_10000C130();
  uint64_t v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
  id v28 = v27;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v27))
  {
    int v29 = 138412290;
    id v30 = v7;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v28,  OS_SIGNPOST_INTERVAL_END,  v6,  "AggregateAndUpload",  "at '%@'",  (uint8_t *)&v29,  0xCu);
  }
}

void sub_10000D8F0(uint64_t a1)
{
  if (a1)
  {
    id v2 = sub_10000B9B4();
    id v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
    BOOL v4 = sub_10000BEC0((BOOL)v3);

    if (!v4)
    {
      id v5 = *(dispatch_queue_s **)(a1 + 8);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_10000D9D8;
      block[3] = &unk_1000288C0;
      block[4] = a1;
      dispatch_async(v5, block);
    }
  }

id sub_10000D9D8(uint64_t a1)
{
  return [*(id *)(a1 + 32) _startUploadTimer];
}

void sub_10000DD58(uint64_t a1, uint64_t a2)
{
  if (a1)
  {
    id v2 = *(dispatch_queue_s **)(a1 + 8);
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472LL;
    v3[2] = sub_10000DDB4;
    v3[3] = &unk_100028BE8;
    v3[4] = a1;
    void v3[5] = a2;
    dispatch_async(v2, v3);
  }

void sub_10000DDB4(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) persistence]);
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 selectBatchIdsForBatchUpload]);

  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  id v4 = v3;
  id v5 = [v4 countByEnumeratingWithState:&v13 objects:v19 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      id v8 = 0LL;
      do
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(id *)(a1 + 40);
        if (v9 == objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * (void)v8), "unsignedLongLongValue", (void)v13))
        {
          [*(id *)(a1 + 32) _submitBatchForUploadWithBatchId:*(void *)(a1 + 40)];
          id v11 = (os_log_s *)v4;
          goto LABEL_12;
        }

        id v8 = (char *)v8 + 1;
      }

      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v13 objects:v19 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }

  id v10 = sub_10000C130();
  id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v12 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 134217984;
    uint64_t v18 = v12;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEBUG,  "batch id %llu has nothing to upload now",  buf,  0xCu);
  }

LABEL_29:
    __int128 v13 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"(unknown: %i)",  v9));
    goto LABEL_41;
  }

  __int128 v14 = sub_10000C130();
  __int128 v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf) = 134217984;
    *(void *)((char *)&buf + 4) = a3;
    _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_INFO,  "No URL for batch id %llu; unable to upload right now",
      (uint8_t *)&buf,
      0xCu);
  }

LABEL_66:
}

void sub_10000E7D4( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, char a47, uint64_t a48, uint64_t a49, uint64_t a50,char a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,char a57,uint64_t a58,uint64_t a59,uint64_t a60,char a61)
{
}

uint64_t sub_10000E860(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_10000E870(uint64_t a1)
{
}

uint64_t sub_10000E878(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 expireTime]);
  id v5 = [v4 compare:a1[4]];

  if (v5 == (id)-1LL)
  {
    ++*(void *)(*(void *)(a1[7] + 8LL) + 24LL);
LABEL_9:
    uint64_t v19 = 1LL;
    goto LABEL_10;
  }

  ++*(void *)(*(void *)(a1[8] + 8LL) + 24LL);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v3 logMsg]);
  *(void *)(*(void *)(a1[9] + 8) + 24) += [v6 length];

  if (!*(void *)(*(void *)(a1[10] + 8LL) + 40LL))
  {
    uint64_t v7 = objc_claimAutoreleasedReturnValue([v3 expireTime]);
    uint64_t v8 = *(void *)(a1[10] + 8LL);
    id v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;

    uint64_t v10 = objc_claimAutoreleasedReturnValue([v3 createTime]);
    uint64_t v11 = *(void *)(a1[11] + 8LL);
    uint64_t v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = v10;
  }

  uint64_t v13 = a1[5];
  __int128 v14 = (void *)objc_claimAutoreleasedReturnValue([v3 logMsg]);
  LOBYTE(v13) = sub_10000C520(v13, v14);

  if ((v13 & 1) != 0) {
    goto LABEL_9;
  }
  id v15 = sub_10000C130();
  __int128 v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    uint64_t v17 = a1[6];
    uint64_t v18 = a1[12];
    int v21 = 138412546;
    uint64_t v22 = v17;
    __int16 v23 = 2048;
    uint64_t v24 = v18;
    _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_ERROR,  "(%@) unable to write upload record for batch id %llu; stopping here",
      (uint8_t *)&v21,
      0x16u);
  }

  uint64_t v19 = 0LL;
LABEL_10:

  return v19;
}

uint64_t sub_10000EA44(uint64_t a1)
{
  if (*(void *)(*(void *)(*(void *)(a1 + 72) + 8LL) + 24LL))
  {
    [*(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) timeIntervalSinceNow];
    double v3 = fmax(v2, 0.0);
    if (*(double *)(a1 + 120) < v3)
    {
      id v4 = sub_10000C130();
      id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v6 = (uint64_t)*(double *)(a1 + 120);
        uint64_t v7 = *(void *)(a1 + 32);
        uint64_t v8 = *(void *)(a1 + 40);
        uint64_t v9 = *(void *)(a1 + 48);
        int v36 = 138413314;
        uint64_t v37 = v7;
        __int16 v38 = 2112;
        uint64_t v39 = v8;
        __int16 v40 = 2048;
        uint64_t v41 = v6;
        __int16 v42 = 2112;
        uint64_t v43 = v9;
        __int16 v44 = 2048;
        uint64_t v45 = (uint64_t)v3;
        _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEBUG,  "(%@) %@ TTL (%ld) preferred over %@ (%ld)",  (uint8_t *)&v36,  0x34u);
      }

      double v3 = *(double *)(a1 + 120);
    }

    id v10 = sub_10000C130();
    uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v12 = *(void *)(a1 + 32);
      uint64_t v13 = *(void *)(a1 + 128);
      uint64_t v14 = *(void *)(a1 + 48);
      uint64_t v15 = *(void *)(*(void *)(*(void *)(a1 + 72) + 8LL) + 24LL);
      uint64_t v16 = *(void *)(*(void *)(*(void *)(a1 + 88) + 8LL) + 24LL);
      int v36 = 138413570;
      uint64_t v37 = v12;
      __int16 v38 = 2048;
      uint64_t v39 = v13;
      __int16 v40 = 2112;
      uint64_t v41 = v14;
      __int16 v42 = 2048;
      uint64_t v43 = v15;
      __int16 v44 = 2048;
      uint64_t v45 = v16;
      __int16 v46 = 2048;
      uint64_t v47 = (uint64_t)v3;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEBUG,  "(%@) upload batchId %llu is using uploading policy type '%@' : %lu messages of size %lu with TTL %ld",  (uint8_t *)&v36,  0x3Eu);
    }

    id v17 = sub_10000EE50( *(void *)(a1 + 128),  *(void *)(*(void *)(*(void *)(a1 + 72) + 8LL) + 24LL),  *(void *)(*(void *)(*(void *)(a1 + 88) + 8LL) + 24LL),  *(void **)(*(void *)(*(void *)(a1 + 96) + 8LL) + 40LL),  *(unsigned int *)(a1 + 136),  0LL,  *(void **)(a1 + 32));
    uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(+[GEOAPUtils GEOAPCachePath](&OBJC_CLASS___GEOAPUtils, "GEOAPCachePath"));
    id v20 = (void *)objc_claimAutoreleasedReturnValue([v19 stringByAppendingPathComponent:v18]);

    if ((sub_10000C964(*(void *)(a1 + 56), v20) & 1) == 0)
    {
      id v31 = sub_10000C130();
      id v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        uint64_t v33 = *(void *)(a1 + 32);
        uint64_t v34 = *(void *)(a1 + 128);
        int v36 = 138412546;
        uint64_t v37 = v33;
        __int16 v38 = 2048;
        uint64_t v39 = v34;
        _os_log_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_ERROR,  "(%@) unable to finalize and close upload file for batchId %llu; will try upload later",
          (uint8_t *)&v36,
          0x16u);
      }

      uint64_t v30 = 0LL;
      goto LABEL_19;
    }

    int v21 = *(void **)(a1 + 64);
    uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", v20));
    *(_BYTE *)(*(void *)(*(void *)(a1 + 104) + 8) + 24) = [v21 _startTaskForFile:v22 taskDescription:v18 a nalyticSessionType:GEOBatchAnalyticsSessionType(*(void *)(a1 + 128)) apURLsessionConfigType:*(unsigned int *)(a1 + 136) ttl:*(double *)(a1 + 120)];
  }

  else
  {
    id v23 = sub_10000C130();
    uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v24 = *(void *)(a1 + 32);
      uint64_t v25 = *(void *)(a1 + 128);
      int v36 = 138412546;
      uint64_t v37 = v24;
      __int16 v38 = 2048;
      uint64_t v39 = v25;
      _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEBUG,  "(%@) nothing to upload for batchId %llu",  (uint8_t *)&v36,  0x16u);
    }
  }

  if (!*(void *)(*(void *)(*(void *)(a1 + 112) + 8LL) + 24LL)) {
    return 1LL;
  }
  id v26 = sub_10000C130();
  uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v27 = *(void *)(a1 + 32);
    uint64_t v28 = *(void *)(a1 + 128);
    uint64_t v29 = *(void *)(*(void *)(*(void *)(a1 + 112) + 8LL) + 24LL);
    int v36 = 138412802;
    uint64_t v37 = v27;
    __int16 v38 = 2048;
    uint64_t v39 = v28;
    __int16 v40 = 2048;
    uint64_t v41 = v29;
    _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEBUG,  "(%@) batchId %llu had %llu expired records",  (uint8_t *)&v36,  0x20u);
  }

  uint64_t v30 = 1LL;
LABEL_19:

  return v30;
}

id sub_10000EE50(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5, uint64_t a6, void *a7)
{
  id v13 = a7;
  [a4 timeIntervalSinceReferenceDate];
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@_%llu_%lu_%lu_%lu_%lu_%d_%@",  @"GEOAPv5",  a1,  a6,  a2,  a3,  (unint64_t)v14,  a5,  v13));

  return v15;
}

void sub_10000F44C( _Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  if (a2)
  {
    id v11 = objc_begin_catch(a1);
    if (a2 == 2)
    {
      sub_10001A484(v11, a10);
      JUMPOUT(0x10000F3E4LL);
    }

    objc_end_catch();
    JUMPOUT(0x10000F3E0LL);
  }

  _Unwind_Resume(a1);
}

void sub_10000F528(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = sub_10000C130();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG);
  if (v2)
  {
    if (!v5) {
      goto LABEL_7;
    }
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) taskDescription]);
    uint64_t v7 = *(void **)(a1 + 32);
    *(_DWORD *)buf = 138412546;
    *(void *)&uint8_t buf[4] = v6;
    __int16 v46 = 2112;
    id v47 = v7;
    uint64_t v8 = "upload failed for task '%@' : (%@)";
    uint64_t v9 = v4;
    uint32_t v10 = 22;
  }

  else
  {
    if (!v5) {
      goto LABEL_7;
    }
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) taskDescription]);
    *(_DWORD *)buf = 138412290;
    *(void *)&uint8_t buf[4] = v6;
    uint64_t v8 = "upload successful for task '%@'";
    uint64_t v9 = v4;
    uint32_t v10 = 12;
  }

  _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, v8, buf, v10);

LABEL_7:
  id v11 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) taskDescription]);
  v40[0] = _NSConcreteStackBlock;
  v40[1] = 3221225472LL;
  uint64_t v41 = sub_10000F9C0;
  __int16 v42 = &unk_100028C88;
  id v43 = *(id *)(a1 + 32);
  int8x16_t v38 = *(int8x16_t *)(a1 + 40);
  id v12 = (id)v38.i64[0];
  int8x16_t v44 = vextq_s8(v38, v38, 8uLL);
  id v13 = v40;
  double v14 = (void *)objc_claimAutoreleasedReturnValue([v11 componentsSeparatedByString:@"_"]);
  if ([v11 hasPrefix:@"GEOAPv5"])
  {
    if ([v14 count] == (id)8)
    {
      uint64_t v15 = objc_alloc(&OBJC_CLASS___NSScanner);
      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v14 objectAtIndexedSubscript:1]);
      id v17 = -[NSScanner initWithString:](v15, "initWithString:", v16);

      -[NSScanner scanUnsignedLongLong:](v17, "scanUnsignedLongLong:", buf);
      uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v14 objectAtIndexedSubscript:2]);
      id v19 = [v18 integerValue];

      id v20 = (void *)objc_claimAutoreleasedReturnValue([v14 objectAtIndexedSubscript:3]);
      id v21 = [v20 integerValue];

      uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v14 objectAtIndexedSubscript:4]);
      id v23 = [v22 integerValue];

      uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue([v14 objectAtIndexedSubscript:5]);
      uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSinceReferenceDate:]( NSDate,  "dateWithTimeIntervalSinceReferenceDate:",  (double)(uint64_t)[v24 longLongValue]));

      id v26 = (void *)objc_claimAutoreleasedReturnValue([v14 objectAtIndexedSubscript:6]);
      id v27 = [v26 intValue];

      uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue([v14 objectAtIndexedSubscript:7]);
      v41((uint64_t)v13, *(void *)buf, (unint64_t)v19, (uint64_t)v21, (uint64_t)v23, v25, (uint64_t)v27, v28);

      id v29 = v13;
LABEL_10:

      goto LABEL_11;
    }

    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT)) {
      sub_10001A54C();
    }
  }

  id v30 = sub_10000C130();
  id v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
  {
    id v32 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) taskDescription]);
    *(_DWORD *)buf = 138412290;
    *(void *)&uint8_t buf[4] = v32;
    _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEBUG, "unrecognized task description '%@'", buf, 0xCu);
  }

  [*(id *)(a1 + 40) cancel];
  uint64_t v33 = *(void **)(a1 + 48);
  uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) taskDescription]);
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v33 fileURLForTaskDescription:v34]);

  char v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  id v39 = 0LL;
  unsigned __int8 v36 = [v35 removeItemAtURL:v11 error:&v39];
  id v29 = v39;

  if ((v36 & 1) == 0)
  {
    id v37 = sub_10000C130();
    double v14 = (void *)objc_claimAutoreleasedReturnValue(v37);
    if (os_log_type_enabled((os_log_t)v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = v11;
      __int16 v46 = 2112;
      id v47 = v29;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)v14, OS_LOG_TYPE_ERROR, "remove %@ failed (%@)", buf, 0x16u);
    }

    goto LABEL_10;
  }

LABEL_11:
}

void sub_10000F9C0( uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t a5, void *a6, uint64_t a7, void *a8)
{
  id v15 = a6;
  id v16 = a8;
  id v17 = sub_10000C130();
  uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
  {
    id v19 = @"unsuccessfully";
    if (!*(void *)(a1 + 32)) {
      id v19 = @"successfully";
    }
    *(_DWORD *)buf = 138412546;
    id v150 = v16;
    __int16 v151 = 2112;
    uint64_t v152 = (uint64_t)v19;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEBUG, "(%@) upload stage finished %@", buf, 0x16u);
  }

  v134 = v15;

  if ([*(id *)(a1 + 40) _debugUploadCountersEnabled])
  {
    id v20 = (void *)objc_claimAutoreleasedReturnValue(+[GEOAPDebugPersistence sharedInstance](&OBJC_CLASS___GEOAPDebugPersistence, "sharedInstance"));
    [v20 removeInflightUploadWithBatchUUID:v16];
  }

  uint64_t v21 = GEOBatchUploadPolicyType(a2);
  uint64_t v22 = v21;
  uint64_t v118 = a5;
  else {
    uint64_t v23 = (uint64_t)*(&off_100028D10 + (int)v21);
  }
  uint64_t v117 = a4;
  uint64_t v24 = GEOBatchAnalyticsSessionType(a2);
  id v25 = sub_10000C130();
  id v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
  {
    else {
      id v27 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"(unknown: %i)",  v24));
    }
    int v28 = GEOBatchOpaqueAppID(a2);
    *(_DWORD *)buf = 138413314;
    id v150 = v16;
    __int16 v151 = 2048;
    uint64_t v152 = a2;
    __int16 v153 = 2112;
    uint64_t v154 = v23;
    __int16 v155 = 2112;
    uint64_t v156 = (uint64_t)v27;
    __int16 v157 = 1024;
    LODWORD(v15_Block_object_dispose((const void *)(v61 - 256), 8) = v28;
    _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEBUG,  "(%@) URL task complete for batchId:%llu -- %@ / %@ / %u",  buf,  0x30u);
  }

  id v29 = *(void **)(a1 + 40);
  id v30 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) taskDescription]);
  id v31 = (void *)objc_claimAutoreleasedReturnValue([v29 fileURLForTaskDescription:v30]);

  id v129 = (void *)v23;
  uint64_t v130 = a2;
  else {
    uint64_t v32 = (uint64_t)*(&off_100028E10 + (int)a7);
  }
  uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue(+[GEOAPUploadPolicies sharedPolicies](&OBJC_CLASS___GEOAPUploadPolicies, "sharedPolicies"));
  uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue([v33 uploadPolicyForUploadPolicyType:v22]);

  v128 = v34;
  char v35 = (void *)objc_claimAutoreleasedReturnValue([v34 uploadStages]);
  unsigned __int8 v36 = (char *)[v35 count];
  else {
    id v37 = v36 - 1;
  }
  uint64_t v38 = (uint64_t)v37;
  id v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "objectAtIndexedSubscript:"));
  __int16 v40 = (void *)objc_claimAutoreleasedReturnValue([v39 urlSessionConfig]);
  unsigned int v126 = [v40 type];

  v133 = v16;
  id v119 = (void *)v32;
  v122 = v35;
  if (!*(void *)(a1 + 32)) {
    goto LABEL_38;
  }
  id v41 = sub_10000C130();
  __int16 v42 = (os_log_s *)objc_claimAutoreleasedReturnValue(v41);
  if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138413314;
    id v150 = v16;
    __int16 v151 = 2048;
    uint64_t v152 = v130;
    __int16 v153 = 2048;
    uint64_t v154 = v38;
    __int16 v155 = 2112;
    uint64_t v156 = v32;
    __int16 v157 = 2112;
    uint64_t v158 = v23;
    _os_log_impl( (void *)&_mh_execute_header,  v42,  OS_LOG_TYPE_DEBUG,  "(%@) batchId:%llu -- upload stage %lu:%@ for %@ ended in error",  buf,  0x34u);
  }

  if (v38 + 1 >= (unint64_t)[v35 count])
  {
LABEL_38:
    if (GEOConfigGetBOOL( GeoAnalyticsConfig__debug_KeepUploadFiles[0],  GeoAnalyticsConfig__debug_KeepUploadFiles[1]))
    {
      uint64_t v68 = *(void *)(a1 + 32);
      uint64_t v69 = objc_alloc(&OBJC_CLASS___NSString);
      uint64_t v70 = objc_claimAutoreleasedReturnValue([v31 absoluteString]);
      v71 = (void *)v70;
      v72 = @"fail";
      if (!v68) {
        v72 = @"success";
      }
      v73 = -[NSString initWithFormat:](v69, "initWithFormat:", @"%@-%@", v70, v72);

      double v74 = -[NSURL initWithString:](objc_alloc(&OBJC_CLASS___NSURL), "initWithString:", v73);
      double v75 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
      [v75 moveItemAtURL:v31 toURL:v74 error:0];

      id v76 = 0LL;
    }

    else
    {
      v77 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
      id v144 = 0LL;
      unsigned __int8 v78 = [v77 removeItemAtURL:v31 error:&v144];
      id v76 = v144;

      if ((v78 & 1) != 0)
      {
        uint64_t v79 = v126;
LABEL_47:
        v115 = v31;
        id v116 = v76;
        uint64_t v81 = v38;
        if (!v38)
        {
          double v82 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) persistence]);
          [v82 clearPendingLogMsgElemsForBatchUploadWithBatchId:v130];

          uint64_t v81 = 0LL;
        }

        sub_10000DD58(*(void *)(a1 + 40), v130);
        v90 = (void *)objc_claimAutoreleasedReturnValue(+[GEOReferenceTimeManager sharedManager](&OBJC_CLASS___GEOReferenceTimeManager, "sharedManager"));
        v83 = (void *)objc_claimAutoreleasedReturnValue([v90 bestReferenceDate]);

        v121 = -[NSCalendar initWithCalendarIdentifier:]( objc_alloc(&OBJC_CLASS___NSCalendar),  "initWithCalendarIdentifier:",  NSCalendarIdentifierGregorian);
        NSInteger v84 = -[NSCalendar component:fromDate:](v121, "component:fromDate:", 32LL, v83);
        uint64_t v85 = GEOBatchAnalyticsSessionType(v130);
        v86 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v85));
        id v87 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v79));
        v88 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInt:]( &OBJC_CLASS___NSNumber,  "numberWithInt:",  *(void *)(a1 + 32) == 0LL));
        __int16 v132 = v83;
        [v83 timeIntervalSinceDate:v134];
        LODWORD(v90) = vcvtpd_u64_f64(v89);
        v91 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v90));
        v135[0] = _NSConcreteStackBlock;
        v135[1] = 3221225472LL;
        v135[2] = sub_100010774;
        v135[3] = &unk_100028C60;
        uint64_t v140 = v81;
        id v125 = v87;
        id v136 = v125;
        id v92 = v91;
        id v137 = v92;
        NSInteger v141 = v84;
        uint64_t v142 = v117;
        uint64_t v143 = v118;
        id v93 = v88;
        id v138 = v93;
        id v123 = v86;
        id v139 = v123;
        sub_10000A440(@"com.apple.GEOAP.uploadEvent", v135);
        if ([*(id *)(a1 + 40) _debugUploadCountersEnabled])
        {
          v94 = (void *)objc_claimAutoreleasedReturnValue(+[GEOAPDebugPersistence sharedInstance](&OBJC_CLASS___GEOAPDebugPersistence, "sharedInstance"));
          [v94 addUploadHistoryForBatchUUID:v133 completionTime:v83 latency:v90 sessionType:v85 eventCount:v117 uploadSize:v118 uploadPolicy:__PAIR64__(v81 stageNum:v126)];
        }

        uint64_t v45 = v134;
        v55 = v115;
        v95 = v121;
        v56 = v122;
        v65 = v132;
        v64 = v125;
        goto LABEL_52;
      }

      id v80 = sub_10000C130();
      v73 = (os_log_s *)objc_claimAutoreleasedReturnValue(v80);
      if (os_log_type_enabled(v73, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412802;
        id v150 = v16;
        __int16 v151 = 2112;
        uint64_t v152 = (uint64_t)v31;
        __int16 v153 = 2112;
        uint64_t v154 = (uint64_t)v76;
        _os_log_impl((void *)&_mh_execute_header, v73, OS_LOG_TYPE_ERROR, "(%@) remove %@ failed (%@)", buf, 0x20u);
      }
    }

    uint64_t v79 = v126;

    goto LABEL_47;
  }

  v131 = (void *)objc_claimAutoreleasedReturnValue([v35 objectAtIndexedSubscript:v38 + 1]);
  id v43 = (void *)objc_claimAutoreleasedReturnValue([v131 urlSessionConfig]);
  id v44 = [v43 type];

  [v128 ttl];
  uint64_t v45 = v134;
  __int16 v46 = (NSCalendar *)objc_claimAutoreleasedReturnValue(objc_msgSend(v134, "dateByAddingTimeInterval:"));
  -[NSCalendar timeIntervalSinceNow](v46, "timeIntervalSinceNow");
  if (v47 <= 0.0)
  {
    id v66 = sub_10000C130();
    v67 = (os_log_s *)objc_claimAutoreleasedReturnValue(v66);
    id v16 = v133;
    if (os_log_type_enabled(v67, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138413058;
      id v150 = v133;
      __int16 v151 = 2048;
      uint64_t v152 = v38 + 1;
      __int16 v153 = 2112;
      uint64_t v154 = v32;
      __int16 v155 = 2048;
      uint64_t v156 = v130;
      _os_log_impl( (void *)&_mh_execute_header,  v67,  OS_LOG_TYPE_DEBUG,  "(%@) upload stage %lu:%@ for batchId %llu exhausted the remaining TTL",  buf,  0x2Au);
    }

    goto LABEL_38;
  }

  double v48 = v47;
  v120 = v46;
  id v49 = sub_10000EE50(v130, v117, v118, v134, (uint64_t)v44, v38 + 1, v133);
  id v123 = (id)objc_claimAutoreleasedReturnValue(v49);
  uint64_t v50 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "fileURLForTaskDescription:"));
  uint64_t v51 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  id v148 = 0LL;
  v52 = v31;
  __int128 v124 = (void *)v50;
  unsigned __int8 v53 = [v51 moveItemAtURL:v31 toURL:v50 error:&v148];
  id v54 = v148;

  if ((v53 & 1) == 0)
  {
    uint64_t v96 = v54;
    id v97 = sub_10000C130();
    v98 = (os_log_s *)objc_claimAutoreleasedReturnValue(v97);
    v55 = v52;
    v64 = v124;
    v65 = v131;
    if (os_log_type_enabled(v98, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138413058;
      id v150 = v133;
      __int16 v151 = 2112;
      uint64_t v152 = (uint64_t)v52;
      __int16 v153 = 2112;
      uint64_t v154 = (uint64_t)v124;
      __int16 v155 = 2112;
      uint64_t v156 = (uint64_t)v96;
      _os_log_impl((void *)&_mh_execute_header, v98, OS_LOG_TYPE_ERROR, "(%@) move %@ to %@ failed (%@)", buf, 0x2Au);
    }

    unsigned int v99 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    unsigned int v100 = v96;
    id v147 = v96;
    unsigned __int8 v101 = [v99 removeItemAtURL:v55 error:&v147];
    id v63 = v147;

    v56 = v122;
    if ((v101 & 1) != 0) {
      goto LABEL_68;
    }
    id v102 = sub_10000C130();
    v62 = (os_log_s *)objc_claimAutoreleasedReturnValue(v102);
    if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      id v150 = v133;
      __int16 v151 = 2112;
      uint64_t v152 = (uint64_t)v55;
      __int16 v153 = 2112;
      uint64_t v154 = (uint64_t)v63;
      _os_log_impl((void *)&_mh_execute_header, v62, OS_LOG_TYPE_ERROR, "(%@) remove %@ failed (%@)", buf, 0x20u);
    }

    goto LABEL_67;
  }

  [v131 ttl];
  v55 = v52;
  v56 = v122;
  if (v48 > v57)
  {
    id v58 = sub_10000C130();
    v59 = (os_log_s *)objc_claimAutoreleasedReturnValue(v58);
    if (os_log_type_enabled(v59, OS_LOG_TYPE_DEBUG))
    {
      [v131 ttl];
      *(_DWORD *)buf = 138413314;
      id v150 = v133;
      __int16 v151 = 2112;
      uint64_t v152 = (uint64_t)v119;
      __int16 v153 = 2048;
      uint64_t v154 = (uint64_t)v60;
      __int16 v155 = 2112;
      uint64_t v156 = v23;
      __int16 v157 = 2048;
      uint64_t v158 = (uint64_t)v48;
      _os_log_impl( (void *)&_mh_execute_header,  v59,  OS_LOG_TYPE_DEBUG,  "(%@) %@ TTL (%ld) preferred over %@ (%ld)",  buf,  0x34u);
    }

    [v131 ttl];
    double v48 = v61;
  }

  if ([*(id *)(a1 + 40) _startTaskForFile:v124 taskDescription:v123 analyticSessionType:v24 apURLsessionConfigType:v44 ttl:v48])
  {
    if ([*(id *)(a1 + 40) _debugUploadCountersEnabled])
    {
      v62 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[GEOAPDebugPersistence sharedInstance](&OBJC_CLASS___GEOAPDebugPersistence, "sharedInstance"));
      LODWORD(v114) = v38 + 1;
      -[os_log_s addInflightUploadWithBatchUUID:createTime:sessionType:eventCount:uploadSize:uploadPolicy:stageNum:]( v62,  "addInflightUploadWithBatchUUID:createTime:sessionType:eventCount:uploadSize:uploadPolicy:stageNum:",  v133,  v134,  v24,  v117,  v118,  v44,  v114);
      id v63 = v54;
      v64 = v124;
      v65 = v131;
LABEL_67:

      goto LABEL_68;
    }

    id v63 = v54;
    v64 = v124;
    v65 = v131;
  }

  else
  {
    uint64_t v127 = v38;
    id v103 = sub_10000C130();
    v104 = (os_log_s *)objc_claimAutoreleasedReturnValue(v103);
    if (os_log_type_enabled(v104, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      id v150 = v133;
      __int16 v151 = 2112;
      uint64_t v152 = (uint64_t)v119;
      _os_log_impl((void *)&_mh_execute_header, v104, OS_LOG_TYPE_ERROR, "(%@) starting stage %@ failed", buf, 0x16u);
    }

    v105 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    id v146 = v54;
    v106 = v54;
    v64 = v124;
    unsigned __int8 v107 = [v105 removeItemAtURL:v124 error:&v146];
    id v63 = v146;

    v65 = v131;
    if ((v107 & 1) == 0)
    {
      id v108 = sub_10000C130();
      v62 = (os_log_s *)objc_claimAutoreleasedReturnValue(v108);
      if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412802;
        id v150 = v133;
        __int16 v151 = 2112;
        uint64_t v152 = (uint64_t)v124;
        __int16 v153 = 2112;
        uint64_t v154 = (uint64_t)v63;
        _os_log_impl((void *)&_mh_execute_header, v62, OS_LOG_TYPE_ERROR, "(%@) remove %@ failed (%@)", buf, 0x20u);
      }

      uint64_t v38 = v127;
      goto LABEL_67;
    }

    uint64_t v38 = v127;
  }

LABEL_68:
  v95 = v120;
  if (v38) {
    goto LABEL_53;
  }
  v109 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) persistence]);
  [v109 clearPendingLogMsgElemsForBatchUploadWithBatchId:v130];

  v110 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  id v145 = v63;
  unsigned __int8 v111 = [v110 removeItemAtURL:v55 error:&v145];
  id v112 = v145;

  if ((v111 & 1) != 0)
  {
    id v63 = v112;
    v95 = v120;
    v56 = v122;
    goto LABEL_53;
  }

  id v113 = sub_10000C130();
  id v93 = (id)objc_claimAutoreleasedReturnValue(v113);
  v56 = v122;
  id v116 = v112;
  if (os_log_type_enabled((os_log_t)v93, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412802;
    id v150 = v133;
    __int16 v151 = 2112;
    uint64_t v152 = (uint64_t)v55;
    __int16 v153 = 2112;
    uint64_t v154 = (uint64_t)v112;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v93,  OS_LOG_TYPE_ERROR,  "(%@) remove %@ failed (%@)",  buf,  0x20u);
  }

  v95 = v120;
LABEL_52:

  id v63 = v116;
LABEL_53:
}

id sub_100010774(void *a1)
{
  v12[0] = @"attempt";
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a1[8]));
  uint64_t v3 = a1[4];
  uint64_t v4 = a1[5];
  v13[0] = v2;
  v13[1] = v3;
  v12[1] = @"config";
  v12[2] = @"duration";
  v13[2] = v4;
  v12[3] = @"hour";
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a1[9]));
  v13[3] = v5;
  v12[4] = @"num";
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a1[10]));
  v13[4] = v6;
  v12[5] = @"size";
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a1[11]));
  uint64_t v8 = a1[6];
  uint64_t v9 = a1[7];
  v13[5] = v7;
  v13[6] = v8;
  v12[6] = @"success";
  v12[7] = @"type";
  v13[7] = v9;
  uint32_t v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v13,  v12,  8LL));

  return v10;
}

uint64_t sub_100010B14(uint64_t result)
{
  if (result) {
    return *(void *)(result + 8);
  }
  return result;
}

void sub_100010B5C(id a1)
{
  os_log_t v1 = os_log_create("com.apple.GeoAnalytics", "Uploader");
  uint64_t v2 = (void *)qword_100033E10;
  qword_100033E10 = (uint64_t)v1;
}

void sub_100010BCC(id a1)
{
  os_log_t v1 = objc_alloc_init(&OBJC_CLASS___GEOAPDebugPersistence);
  uint64_t v2 = (void *)qword_100033E20;
  qword_100033E20 = (uint64_t)v1;
}

uint64_t sub_100010D04(uint64_t result, char a2)
{
  if (result) {
    *(_BYTE *)(result + 24) = a2;
  }
  return result;
}

uint64_t sub_100010D10(uint64_t result)
{
  if (result)
  {
    uint64_t v1 = result;
    if (*(_BYTE *)(result + 24))
    {
      return 1LL;
    }

    else
    {
      id v2 = sub_100010D98();
      uint64_t v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
      if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)uint64_t v4 = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_INFO,  "device has not been unlocked since last boot; can't proceed yet",
          v4,
          2u);
      }

      return *(_BYTE *)(v1 + 24) != 0;
    }
  }

  return result;
}

id sub_100010D98()
{
  if (qword_100033E38 != -1) {
    dispatch_once(&qword_100033E38, &stru_100029108);
  }
  return (id)qword_100033E30;
}

BOOL sub_100010EC0(id a1, GEOSQLiteDB *a2)
{
  id v2 = a2;
  if (-[GEOSQLiteDB user_version](v2, "user_version") == (id)1)
  {
    if (!-[GEOSQLiteDB createTable:withDrop:]( v2,  "createTable:withDrop:",  "CREATE TABLE IF NOT EXISTS uploadHistory (batchUUID STRING NOT NULL, uploadDoneTime DATETIME D EFAULT CURRENT_TIMESTAMP, uploadLatency INTEGER NOT NULL, sessionType INTEGER NOT NULL, eventC ount INTEGER NOT NULL, uploadSize INTEGER NOT NULL, uploadPolicy INTEGER NOT NULL, stageNum IN TEGER NOT NULL);",
                          0LL)
      || (-[GEOSQLiteDB createTable:withDrop:]( v2,  "createTable:withDrop:",  "CREATE TABLE IF NOT EXISTS uploadInflight (batchUUID STRING NOT NULL, createTime DATETIME DEFA ULT CURRENT_TIMESTAMP, sessionType INTEGER NOT NULL, eventCount INTEGER NOT NULL, uploadSize I NTEGER NOT NULL, uploadPolicy INTEGER NOT NULL, stageNum INTEGER NOT NULL);",
                          0LL) & 1) == 0)
    {
      goto LABEL_17;
    }
  }

  else
  {
    if (!-[GEOSQLiteDB createTable:withDrop:]( v2,  "createTable:withDrop:",  "CREATE TABLE IF NOT EXISTS uploadHistory (batchUUID STRING NOT NULL, uploadDoneTime DATETIME D EFAULT CURRENT_TIMESTAMP, uploadLatency INTEGER NOT NULL, sessionType INTEGER NOT NULL, eventC ount INTEGER NOT NULL, uploadSize INTEGER NOT NULL, uploadPolicy INTEGER NOT NULL, stageNum IN TEGER NOT NULL);",
                          "DROP TABLE uploadHistory;")
      || !-[GEOSQLiteDB createTable:withDrop:]( v2,  "createTable:withDrop:",  "CREATE TABLE IF NOT EXISTS uploadInflight (batchUUID STRING NOT NULL, createTime DATETIME DEFA ULT CURRENT_TIMESTAMP, sessionType INTEGER NOT NULL, eventCount INTEGER NOT NULL, uploadSize I NTEGER NOT NULL, uploadPolicy INTEGER NOT NULL, stageNum INTEGER NOT NULL);",
                          "DROP TABLE uploadInflight;"))
    {
      goto LABEL_17;
    }

    -[GEOSQLiteDB setUser_version:](v2, "setUser_version:", 1LL);
  }

  if (!-[GEOSQLiteDB prepareStatement:forKey:]( v2,  "prepareStatement:forKey:",  "INSERT INTO uploadHistory (batchUUID,uploadDoneTime,uploadLatency,sessionType,eventCount,uploadS ize,uploadPolicy,stageNum) VALUES(@batchUUID, DATETIME( @uploadDoneTime, 'UNIXEPOCH') ,@upload Latency,@sessionType,@eventCount,@uploadSize,@uploadPolicy,@stageNum);",
                        @"insUH")
    || !-[GEOSQLiteDB prepareStatement:forKey:]( v2,  "prepareStatement:forKey:",  "INSERT INTO uploadInflight (batchUUID,createTime,sessionType,eventCount,uploadSize,uploadPolicy, stageNum)VALUES(@batchUUID, DATETIME( @createTime, 'UNIXEPOCH') ,@sessionType,@eventCount,@upl oadSize,@uploadPolicy,@stageNum);",
                        @"insIU")
    || !-[GEOSQLiteDB prepareStatement:forKey:]( v2,  "prepareStatement:forKey:",  "DELETE FROM uploadInflight WHERE batchUUID=@batchUUID;",
                        @"delIU")
    || !-[GEOSQLiteDB prepareStatement:forKey:]( v2,  "prepareStatement:forKey:",  "SELECT batchUUID,createTime,sessionType,eventCount,uploadSize,uploadPolicy,stageNum FROM uploadInflight;",
                        @"selIU")
    || !-[GEOSQLiteDB prepareStatement:forKey:]( v2,  "prepareStatement:forKey:",  "SELECT batchUUID,uploadLatency,sessionType,eventCount,uploadSize,uploadPolicy,stageNum, strftime ('%s',uploadDoneTime) FROM uploadHistory WHERE uploadDoneTime >= DATETIME( @uploadDoneTime, 'UNIXEPOCH');",
                        @"selUH")
    || !-[GEOSQLiteDB prepareStatement:forKey:]( v2,  "prepareStatement:forKey:",  "DELETE FROM uploadHistory;",
                        @"delAllUH")
    || !-[GEOSQLiteDB prepareStatement:forKey:]( v2,  "prepareStatement:forKey:",  "SELECT COUNT(1) FROM uploadInflight;",
                        @"cntI"))
  {
LABEL_17:
    unsigned __int8 v3 = 0;
    goto LABEL_16;
  }

  unsigned __int8 v3 = -[GEOSQLiteDB prepareStatement:forKey:]( v2,  "prepareStatement:forKey:",  "SELECT COUNT(1) FROM uploadHistory;",
                          @"cntH");
LABEL_16:

  return v3;
}

void sub_1000110EC(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  unsigned __int8 v3 = *(void **)(v2 + 8);
  *(void *)(v2 + _Block_object_dispose((const void *)(v61 - 256), 8) = 0LL;
}

id sub_100011188(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) executeStatement:@"delAllUH" statementBlock:&stru_100028F08];
}

BOOL sub_1000111A4(id a1, sqlite3_stmt *a2)
{
  return 1;
}

void sub_1000112E4(_Unwind_Exception *a1)
{
}

void sub_100011300(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = sub_100010D98();
    uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      uint64_t v15 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEBUG,  "recording upload history for batch %@",  buf,  0xCu);
    }

    uint64_t v6 = (void *)WeakRetained[1];
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_100011430;
    v9[3] = &unk_100028F30;
    void v9[4] = WeakRetained;
    id v7 = *(id *)(a1 + 32);
    uint64_t v8 = *(void *)(a1 + 48);
    id v10 = v7;
    uint64_t v11 = v8;
    __int128 v12 = *(_OWORD *)(a1 + 56);
    uint64_t v13 = *(void *)(a1 + 72);
    [v6 executeStatement:@"insUH" statementBlock:v9];
  }
}

id sub_100011430(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a1 + 40);
  uint64_t v5 = *(void **)(*(void *)(a1 + 32) + 8LL);
  id v39 = 0LL;
  unsigned int v6 = [v5 bindTextParameter:"@batchUUID" toValue:v4 inStatement:a2 error:&v39];
  id v7 = v39;
  if (!v6) {
    goto LABEL_10;
  }
  uint64_t v8 = *(void **)(*(void *)(a1 + 32) + 8LL);
  uint64_t v9 = *(void *)(a1 + 48);
  id v38 = v7;
  unsigned int v10 = [v8 bindInt64Parameter:"@uploadDoneTime" toValue:v9 inStatement:a2 error:&v38];
  id v11 = v38;

  if (!v10) {
    goto LABEL_11;
  }
  __int128 v12 = *(void **)(*(void *)(a1 + 32) + 8LL);
  uint64_t v13 = *(unsigned int *)(a1 + 56);
  id v37 = v11;
  unsigned int v14 = [v12 bindInt64Parameter:"@uploadLatency" toValue:v13 inStatement:a2 error:&v37];
  id v7 = v37;

  if (!v14)
  {
LABEL_10:
    id v29 = 0LL;
    goto LABEL_9;
  }

  uint64_t v15 = *(void **)(*(void *)(a1 + 32) + 8LL);
  uint64_t v16 = *(unsigned int *)(a1 + 60);
  id v36 = v7;
  unsigned int v17 = [v15 bindIntParameter:"@sessionType" toValue:v16 inStatement:a2 error:&v36];
  id v11 = v36;

  if (!v17)
  {
LABEL_11:
    id v29 = 0LL;
    id v7 = v11;
    goto LABEL_9;
  }

  uint64_t v18 = *(void **)(*(void *)(a1 + 32) + 8LL);
  uint64_t v19 = *(unsigned int *)(a1 + 64);
  id v35 = v11;
  unsigned int v20 = [v18 bindInt64Parameter:"@eventCount" toValue:v19 inStatement:a2 error:&v35];
  id v7 = v35;

  if (!v20) {
    goto LABEL_10;
  }
  uint64_t v21 = *(void **)(*(void *)(a1 + 32) + 8LL);
  uint64_t v22 = *(unsigned int *)(a1 + 68);
  id v34 = v7;
  unsigned int v23 = [v21 bindInt64Parameter:"@uploadSize" toValue:v22 inStatement:a2 error:&v34];
  id v11 = v34;

  if (!v23) {
    goto LABEL_11;
  }
  uint64_t v24 = *(void **)(*(void *)(a1 + 32) + 8LL);
  uint64_t v25 = *(unsigned int *)(a1 + 72);
  id v33 = v11;
  unsigned int v26 = [v24 bindIntParameter:"@uploadPolicy" toValue:v25 inStatement:a2 error:&v33];
  id v7 = v33;

  if (!v26) {
    goto LABEL_10;
  }
  id v27 = *(void **)(*(void *)(a1 + 32) + 8LL);
  uint64_t v28 = *(unsigned int *)(a1 + 76);
  id v32 = v7;
  id v29 = [v27 bindInt64Parameter:"@stageNum" toValue:v28 inStatement:a2 error:&v32];
  id v30 = v32;

  id v7 = v30;
LABEL_9:

  return v29;
}

void sub_100011774( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
}

void sub_100011790(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = (void *)WeakRetained[1];
    v8[1] = 3221225472LL;
    _OWORD v8[2] = sub_100011834;
    v8[3] = &unk_100028F80;
    v8[4] = WeakRetained;
    uint64_t v4 = *(void **)(a1 + 32);
    id v7 = WeakRetained;
    v8[0] = _NSConcreteStackBlock;
    id v5 = v4;
    uint64_t v6 = *(void *)(a1 + 48);
    id v9 = v5;
    uint64_t v10 = v6;
    __int128 v11 = *(_OWORD *)(a1 + 56);
    int v12 = *(_DWORD *)(a1 + 72);
    [v3 executeStatement:@"insIU" statementBlock:v8];

    id WeakRetained = v7;
  }
}

id sub_100011834(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a1 + 40);
  id v5 = *(void **)(*(void *)(a1 + 32) + 8LL);
  id v34 = 0LL;
  unsigned int v6 = [v5 bindTextParameter:"@batchUUID" toValue:v4 inStatement:a2 error:&v34];
  id v7 = v34;
  if (!v6) {
    goto LABEL_9;
  }
  uint64_t v8 = *(void **)(*(void *)(a1 + 32) + 8LL);
  uint64_t v9 = *(void *)(a1 + 48);
  id v33 = v7;
  unsigned int v10 = [v8 bindInt64Parameter:"@createTime" toValue:v9 inStatement:a2 error:&v33];
  id v11 = v33;

  if (!v10) {
    goto LABEL_10;
  }
  int v12 = *(void **)(*(void *)(a1 + 32) + 8LL);
  uint64_t v13 = *(unsigned int *)(a1 + 56);
  id v32 = v11;
  unsigned int v14 = [v12 bindIntParameter:"@sessionType" toValue:v13 inStatement:a2 error:&v32];
  id v7 = v32;

  if (!v14)
  {
LABEL_9:
    id v26 = 0LL;
    goto LABEL_8;
  }

  uint64_t v15 = *(void **)(*(void *)(a1 + 32) + 8LL);
  uint64_t v16 = *(unsigned int *)(a1 + 60);
  id v31 = v7;
  unsigned int v17 = [v15 bindInt64Parameter:"@eventCount" toValue:v16 inStatement:a2 error:&v31];
  id v11 = v31;

  if (!v17)
  {
LABEL_10:
    id v26 = 0LL;
    id v7 = v11;
    goto LABEL_8;
  }

  uint64_t v18 = *(void **)(*(void *)(a1 + 32) + 8LL);
  uint64_t v19 = *(unsigned int *)(a1 + 64);
  id v30 = v11;
  unsigned int v20 = [v18 bindInt64Parameter:"@uploadSize" toValue:v19 inStatement:a2 error:&v30];
  id v7 = v30;

  if (!v20) {
    goto LABEL_9;
  }
  uint64_t v21 = *(void **)(*(void *)(a1 + 32) + 8LL);
  uint64_t v22 = *(unsigned int *)(a1 + 68);
  id v29 = v7;
  unsigned int v23 = [v21 bindIntParameter:"@uploadPolicy" toValue:v22 inStatement:a2 error:&v29];
  id v11 = v29;

  if (!v23) {
    goto LABEL_10;
  }
  uint64_t v24 = *(void **)(*(void *)(a1 + 32) + 8LL);
  uint64_t v25 = *(unsigned int *)(a1 + 72);
  id v28 = v11;
  id v26 = [v24 bindInt64Parameter:"@stageNum" toValue:v25 inStatement:a2 error:&v28];
  id v7 = v28;

LABEL_8:
  return v26;
}

void sub_100011AE0(_Unwind_Exception *a1)
{
}

void sub_100011AFC(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = (void *)WeakRetained[1];
    v6[1] = 3221225472LL;
    v6[2] = sub_100011B8C;
    v6[3] = &unk_100028FD0;
    v6[4] = WeakRetained;
    uint64_t v4 = *(void **)(a1 + 32);
    id v5 = WeakRetained;
    v6[0] = _NSConcreteStackBlock;
    id v7 = v4;
    [v3 executeStatement:@"delIU" statementBlock:v6];

    id WeakRetained = v5;
  }
}

id sub_100011B8C(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 40);
  id v3 = *(void **)(*(void *)(a1 + 32) + 8LL);
  uint64_t v5 = 0LL;
  return [v3 bindTextParameter:"@batchUUID" toValue:v2 inStatement:a2 error:&v5];
}

void sub_100011CD8( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
}

void sub_100011CF4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    id v3 = (void *)*((void *)WeakRetained + 1);
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472LL;
    v6[2] = sub_100011DAC;
    v6[3] = &unk_100029020;
    uint64_t v4 = *(void *)(a1 + 56);
    v6[4] = WeakRetained;
    uint64_t v8 = v4;
    id v7 = *(id *)(a1 + 40);
    objc_msgSend(v3, "executeStatement:statementBlock:", @"selUH", v6, v5);
    (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
  }

  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))(*(void *)(a1 + 32));
  }
}

uint64_t sub_100011DAC(void *a1, sqlite3_stmt *a2)
{
  uint64_t v4 = *(void **)(a1[4] + 8LL);
  uint64_t v5 = a1[6];
  id v10 = 0LL;
  [v4 bindInt64Parameter:"@uploadDoneTime" toValue:v5 inStatement:a2 error:&v10];
  id v9 = v10;
  while (sqlite3_step(a2) == 100)
  {
    unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1[4] + 8) stringForColumn:0 inStatment:a2]);
    [*(id *)(a1[4] + 8) int64ForColumn:1 inStatment:a2];
    [*(id *)(a1[4] + 8) intForColumn:2 inStatment:a2];
    [*(id *)(a1[4] + 8) int64ForColumn:3 inStatment:a2];
    [*(id *)(a1[4] + 8) int64ForColumn:4 inStatment:a2];
    [*(id *)(a1[4] + 8) intForColumn:5 inStatment:a2];
    [*(id *)(a1[4] + 8) int64ForColumn:6 inStatment:a2];
    id v7 = -[NSDate initWithTimeIntervalSince1970:]( [NSDate alloc],  "initWithTimeIntervalSince1970:",  (double)(uint64_t)[*(id *)(a1[4] + 8) int64ForColumn:7 inStatment:a2]);
    (*(void (**)(void))(a1[5] + 16LL))(a1[5]);
  }

  return 1LL;
}

void sub_100012038( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
}

void sub_100012054(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v4 = WeakRetained;
  if (WeakRetained)
  {
    id v3 = (void *)*((void *)WeakRetained + 1);
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472LL;
    v5[2] = sub_100012104;
    v5[3] = &unk_100029070;
    v5[4] = WeakRetained;
    id v6 = *(id *)(a1 + 40);
    [v3 executeStatement:@"selIU" statementBlock:v5];
    (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
  }

  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
  }
}

uint64_t sub_100012104(uint64_t a1, sqlite3_stmt *a2)
{
  while (sqlite3_step(a2) == 100)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(a1 + 32) + 8) stringForColumn:0 inStatment:a2]);
    uint64_t v5 = -[NSDate initWithTimeIntervalSince1970:]( [NSDate alloc],  "initWithTimeIntervalSince1970:",  (double)(uint64_t)[*(id *)(*(void *)(a1 + 32) + 8) int64ForColumn:1 inStatment:a2]);
    [*(id *)(*(void *)(a1 + 32) + 8) intForColumn:2 inStatment:a2];
    [*(id *)(*(void *)(a1 + 32) + 8) int64ForColumn:3 inStatment:a2];
    [*(id *)(*(void *)(a1 + 32) + 8) int64ForColumn:4 inStatment:a2];
    [*(id *)(*(void *)(a1 + 32) + 8) intForColumn:5 inStatment:a2];
    [*(id *)(*(void *)(a1 + 32) + 8) int64ForColumn:6 inStatment:a2];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
  }

  return 1LL;
}

void sub_100012310(_Unwind_Exception *a1)
{
}

void sub_10001232C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    v10[0] = 0LL;
    v10[1] = v10;
    v10[2] = 0x2020000000LL;
    int v11 = 0;
    v8[0] = 0LL;
    v8[1] = v8;
    _OWORD v8[2] = 0x2020000000LL;
    int v9 = 0;
    id v4 = (void *)WeakRetained[1];
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_100012484;
    v7[3] = &unk_1000290C0;
    void v7[4] = v3;
    v7[5] = v10;
    [v4 executeStatement:@"cntI" statementBlock:v7];
    uint64_t v5 = (void *)v3[1];
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472LL;
    v6[2] = sub_1000124E8;
    v6[3] = &unk_1000290C0;
    v6[4] = v3;
    void v6[5] = v8;
    [v5 executeStatement:@"cntH" statementBlock:v6];
    (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
    _Block_object_dispose(v8, 8);
    _Block_object_dispose(v10, 8);
  }

  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
  }
}

void sub_100012460( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
}

BOOL sub_100012484(uint64_t a1, sqlite3_stmt *a2)
{
  int v4 = sqlite3_step(a2);
  if (v4 == 100) {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [*(id *)(*(void *)(a1 + 32) + 8) int64ForColumn:0 inStatment:a2];
  }
  return v4 == 100;
}

BOOL sub_1000124E8(uint64_t a1, sqlite3_stmt *a2)
{
  int v4 = sqlite3_step(a2);
  if (v4 == 100) {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [*(id *)(*(void *)(a1 + 32) + 8) int64ForColumn:0 inStatment:a2];
  }
  return v4 == 100;
}

void sub_10001257C(id a1)
{
  os_log_t v1 = os_log_create("com.apple.GeoAnalytics", "DebugPersistence");
  uint64_t v2 = (void *)qword_100033E30;
  qword_100033E30 = (uint64_t)v1;
}

void sub_1000125EC(id a1)
{
  os_log_t v1 = objc_alloc_init(&OBJC_CLASS___GEOAPPersistence);
  uint64_t v2 = (void *)qword_100033E40;
  qword_100033E40 = (uint64_t)v1;
}

uint64_t sub_100012738(uint64_t result, char a2)
{
  if (result) {
    *(_BYTE *)(result + 32) = a2;
  }
  return result;
}

uint64_t sub_100012744(uint64_t result)
{
  if (result)
  {
    uint64_t v1 = result;
    if (*(_BYTE *)(result + 32))
    {
      return 1LL;
    }

    else
    {
      id v2 = sub_1000127CC();
      id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
      if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)int v4 = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_INFO,  "device has not been unlocked since last boot; can't proceed yet",
          v4,
          2u);
      }

      return *(_BYTE *)(v1 + 32) != 0;
    }
  }

  return result;
}

id sub_1000127CC()
{
  if (qword_100033E60 != -1) {
    dispatch_once(&qword_100033E60, &stru_100029510);
  }
  return (id)qword_100033E58;
}

uint64_t sub_10001292C(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_msgSend(v3, "user_version") == (id)10)
  {
    if (!objc_msgSend( v3,  "createTable:withDrop:",  "CREATE TABLE IF NOT EXISTS analytics (msgid INTEGER PRIMARY KEY AUTOINCREMENT, createtime DATE TIME DEFAULT CURRENT_TIMESTAMP, expiretime DATETIME, batchid INTEGER NOT NULL, analytic BLOB NOT NULL);",
                          0LL)
      || !objc_msgSend( v3,  "createTable:withDrop:",  "CREATE TABLE IF NOT EXISTS inflight (fk_msgid INTEGER PRIMARY KEY, up_time DATETIME DEFAULT CU RRENT_TIMESTAMP);",
                          0LL)
      || !objc_msgSend( v3,  "createTable:withDrop:",  "CREATE TABLE IF NOT EXISTS shadow (analytic BLOB NOT NULL, COL_TYPE INT NOT NULL, createtime D ATETIME DEFAULT CURRENT_TIMESTAMP);",
                          0LL)
      || !objc_msgSend( v3,  "createTable:withDrop:",  "CREATE TABLE IF NOT EXISTS dailysettings (msgid INTEGER PRIMARY KEY AUTOINCREMENT, settings_da ta BLOB NOT NULL, createtime DATETIME NOT NULL);",
                          0LL)
      || !objc_msgSend( v3,  "createTable:withDrop:",  "CREATE TABLE IF NOT EXISTS dailycounts (msgid INTEGER PRIMARY KEY AUTOINCREMENT, count_type IN T NOT NULL, app_id TEXT, usage_string TEXT, usage_BOOL BOOLEAN, createtime DATETIME);",
                          0LL)
      || (objc_msgSend( v3,  "createTable:withDrop:",  "CREATE TABLE IF NOT EXISTS monthlycounts (msgid INTEGER PRIMARY KEY AUTOINCREMENT, count_type INT NOT NULL, app_id TEXT, usage_string TEXT, usage_BOOL BOOLEAN, createtime DATETIME);",
                          0LL) & 1) == 0)
    {
      goto LABEL_40;
    }
  }

  else
  {
    if (!objc_msgSend( v3,  "createTable:withDrop:",  "CREATE TABLE IF NOT EXISTS analytics (msgid INTEGER PRIMARY KEY AUTOINCREMENT, createtime DATE TIME DEFAULT CURRENT_TIMESTAMP, expiretime DATETIME, batchid INTEGER NOT NULL, analytic BLOB NOT NULL);",
                          "DROP TABLE analytics;")
      || !objc_msgSend( v3,  "createTable:withDrop:",  "CREATE TABLE IF NOT EXISTS inflight (fk_msgid INTEGER PRIMARY KEY, up_time DATETIME DEFAULT CU RRENT_TIMESTAMP);",
                          "DROP TABLE inflight;")
      || !objc_msgSend( v3,  "createTable:withDrop:",  "CREATE TABLE IF NOT EXISTS shadow (analytic BLOB NOT NULL, COL_TYPE INT NOT NULL, createtime D ATETIME DEFAULT CURRENT_TIMESTAMP);",
                          "DROP TABLE shadow;")
      || !objc_msgSend( v3,  "createTable:withDrop:",  "CREATE TABLE IF NOT EXISTS dailysettings (msgid INTEGER PRIMARY KEY AUTOINCREMENT, settings_da ta BLOB NOT NULL, createtime DATETIME NOT NULL);",
                          "DROP TABLE dailysettings;")
      || !objc_msgSend( v3,  "createTable:withDrop:",  "CREATE TABLE IF NOT EXISTS dailycounts (msgid INTEGER PRIMARY KEY AUTOINCREMENT, count_type IN T NOT NULL, app_id TEXT, usage_string TEXT, usage_BOOL BOOLEAN, createtime DATETIME);",
                          "DROP TABLE dailycounts;")
      || !objc_msgSend( v3,  "createTable:withDrop:",  "CREATE TABLE IF NOT EXISTS monthlycounts (msgid INTEGER PRIMARY KEY AUTOINCREMENT, count_type INT NOT NULL, app_id TEXT, usage_string TEXT, usage_BOOL BOOLEAN, createtime DATETIME);",
                          "DROP TABLE monthlycounts;"))
    {
      goto LABEL_40;
    }

    objc_msgSend(v3, "setUser_version:", 10);
  }

  if (!objc_msgSend( v3,  "prepareStatement:forKey:",  "INSERT INTO analytics (batchid,expiretime,analytic)VALUES (@batchid, DATETIME( @expiretime, 'UNI XEPOCH') ,@analytic);",
                        @"insA")
    || !objc_msgSend( v3,  "prepareStatement:forKey:",  "INSERT INTO inflight (fk_msgid) VALUES (@fk_msgid);",
                        @"insI")
    || !objc_msgSend( v3,  "prepareStatement:forKey:",  "INSERT INTO dailysettings (settings_data, createtime) VALUES (@settings_data, DATETIME( @createt ime, 'UNIXEPOCH'));",
                        @"insDS")
    || !objc_msgSend( v3,  "prepareStatement:forKey:",  "INSERT INTO dailycounts (count_type,app_id,createtime,usage_string,usage_BOOL) VALUES (@count_ty pe,@app_id, DATETIME( @createtime, 'UNIXEPOCH'), @usage_string,@usage_BOOL);",
                        @"insDC")
    || !objc_msgSend( v3,  "prepareStatement:forKey:",  "INSERT INTO monthlycounts (count_type,app_id,createtime,usage_string,usage_BOOL) VALUES (@count_ type,@app_id, DATETIME( @createtime, 'UNIXEPOCH'), @usage_string,@usage_BOOL);",
                        @"insMC")
    || !objc_msgSend( v3,  "prepareStatement:forKey:",  "SELECT batchid FROM analytics WHERE batchid NOT IN(SELECT batchid FROM analytics,inflight WHER E msgid = fk_msgid GROUP BY batchid)GROUP BY batchid;",
                        @"availB")
    || !objc_msgSend( v3,  "prepareStatement:forKey:",  "DELETE FROM analytics WHERE expiretime <=  DATETIME( @expiretime, 'UNIXEPOCH')  AND batchid = @batchid;",
                        @"delX")
    || !objc_msgSend( v3,  "prepareStatement:forKey:",  "SELECT msgid,batchid,analytic, strftime('%s',expiretime), strftime('%s',createtime) FROM analyti cs WHERE msgid NOT IN(SELECT fk_msgid FROM inflight)  AND batchid = @batchid;",
                        @"nextBP")
    || !objc_msgSend( v3,  "prepareStatement:forKey:",  "SELECT msgid, settings_data, strftime('%s',createtime) FROM dailysettings;",
                        @"qryDS")
    || !objc_msgSend( v3,  "prepareStatement:forKey:",  "SELECT msgid,count_type, app_id, usage_string, usage_BOOL, strftime('%s',createtime) FROM dailycounts;",
                        @"qryDC")
    || !objc_msgSend( v3,  "prepareStatement:forKey:",  "SELECT msgid,count_type, app_id, usage_string, usage_BOOL, strftime('%s',createtime) FROM monthlycounts;",
                        @"qryMC")
    || !objc_msgSend( v3,  "prepareStatement:forKey:",  "DELETE FROM analytics WHERE batchid = @batchid AND msgid IN (SELECT fk_msgid FROM inflight);",
                        @"delBP")
    || !objc_msgSend( v3,  "prepareStatement:forKey:",  "DELETE FROM dailysettings WHERE msgid <= @msgid;",
                        @"delDS")
    || !objc_msgSend( v3,  "prepareStatement:forKey:",  "DELETE FROM dailycounts WHERE msgid <= @msgid;",
                        @"delDC")
    || !objc_msgSend( v3,  "prepareStatement:forKey:",  "DELETE FROM monthlycounts WHERE msgid <= @msgid;",
                        @"delMC")
    || !objc_msgSend( v3,  "prepareStatement:forKey:",  "DELETE FROM inflight WHERE fk_msgid NOT IN (SELECT msgid FROM analytics);",
                        @"cleanB")
    || ![v3 prepareStatement:"SELECT changes();" forKey:@"chng"]
    || !objc_msgSend( v3,  "prepareStatement:forKey:",  "SELECT DISTINCT batchid FROM analytics;",
                        @"sfd"))
  {
LABEL_40:
    uint64_t v5 = 0LL;
    goto LABEL_39;
  }

  int v4 = *(_BYTE **)(a1 + 32);
  if (v4[16]) {
    [v4 _setupEvalStmtsOnDb:v3];
  }
  uint64_t v5 = 1LL;
LABEL_39:

  return v5;
}

void sub_100012D84(uint64_t a1)
{
  if (objc_msgSend( *(id *)(a1 + 32),  "prepareStatement:forKey:",  "INSERT INTO shadow (analytic,COL_TYPE,createtime) VALUES(@analytic,@type, DATETIME( @createtim e, 'UNIXEPOCH', 'SUBSEC'))",  @"insS"))
  {
    if ((objc_msgSend( *(id *)(a1 + 32),  "prepareStatement:forKey:",  "SELECT analytic,COL_TYPE, strftime('%s',createtime, 'SUBSEC') FROM shadow;",
                          @"show") & 1) != 0)
    {
      if ((objc_msgSend( *(id *)(a1 + 32),  "prepareStatement:forKey:",  "DELETE FROM shadow;",
                            @"flush") & 1) == 0)
      {
        BOOL v18 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT);
        if (v18) {
          sub_10001A590(v18, v19, v20, v21, v22, v23, v24, v25);
        }
      }
    }

    else
    {
      BOOL v10 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT);
      if (v10) {
        sub_10001A5C4(v10, v11, v12, v13, v14, v15, v16, v17);
      }
    }
  }

  else
  {
    BOOL v2 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT);
    if (v2) {
      sub_10001A5F8(v2, v3, v4, v5, v6, v7, v8, v9);
    }
  }

id sub_100012EE4(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) tearDown];
}

void sub_100012F8C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

uint64_t sub_100012FA4(uint64_t a1, sqlite3_stmt *a2)
{
  for (i = a2; sqlite3_step(i) == 100; i = a2)
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [*(id *)(*(void *)(a1 + 32) + 8) int64ForColumn:0 inStatment:a2];
  return 1LL;
}

id sub_10001310C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)(*(void *)(a1 + 32) + 8LL);
  id v5 = [*(id *)(a1 + 40) uploadBatchId];
  id v19 = 0LL;
  unsigned int v6 = [v4 bindInt64Parameter:"@batchid" toValue:v5 inStatement:a2 error:&v19];
  id v7 = v19;
  if (v6)
  {
    uint64_t v8 = *(void **)(*(void *)(a1 + 32) + 8LL);
    uint64_t v9 = *(void *)(a1 + 48);
    id v18 = v7;
    unsigned int v10 = [v8 bindInt64Parameter:"@expiretime" toValue:v9 inStatement:a2 error:&v18];
    id v11 = v18;

    if (v10)
    {
      uint64_t v12 = *(void **)(a1 + 40);
      uint64_t v13 = *(void **)(*(void *)(a1 + 32) + 8LL);
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v12 logMsg]);
      id v17 = v11;
      id v15 = [v13 bindBlobParameter:"@analytic" toValue:v14 inStatement:a2 error:&v17];
      id v7 = v17;
    }

    else
    {
      id v15 = 0LL;
      id v7 = v11;
    }
  }

  else
  {
    id v15 = 0LL;
  }

  return v15;
}

id sub_100013228(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) createTime]);
  [v4 timeIntervalSince1970];
  double v6 = v5;

  id v7 = *(void **)(*(void *)(a1 + 40) + 8LL);
  id v19 = 0LL;
  unsigned int v8 = [v7 bindInt64Parameter:"@type" toValue:1 inStatement:a2 error:&v19];
  id v9 = v19;
  if (v8)
  {
    unsigned int v10 = *(void **)(*(void *)(a1 + 40) + 8LL);
    id v11 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) logMsg]);
    id v18 = v9;
    unsigned int v12 = [v10 bindBlobParameter:"@analytic" toValue:v11 inStatement:a2 error:&v18];
    id v13 = v18;

    if (v12)
    {
      uint64_t v14 = *(void **)(*(void *)(a1 + 40) + 8LL);
      id v17 = v13;
      id v15 = [v14 bindRealParameter:"@createtime" toValue:a2 inStatement:&v17 error:v6];
      id v9 = v17;
    }

    else
    {
      id v15 = 0LL;
      id v9 = v13;
    }
  }

  else
  {
    id v15 = 0LL;
  }

  return v15;
}

uint64_t sub_1000133EC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) createTime]);
  [v4 timeIntervalSince1970];
  double v6 = v5;

  id v7 = *(void **)(*(void *)(a1 + 40) + 8LL);
  unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) appId]);
  id v34 = 0LL;
  unsigned int v9 = [v7 bindTextParameter:"@app_id" toValue:v8 inStatement:a2 error:&v34];
  id v10 = v34;

  if (!v9) {
    goto LABEL_8;
  }
  id v11 = *(void **)(*(void *)(a1 + 40) + 8LL);
  id v33 = v10;
  unsigned int v12 = [v11 bindInt64Parameter:"@createtime" toValue:(uint64_t)v6 inStatement:a2 error:&v33];
  id v13 = v33;

  if (!v12) {
    goto LABEL_10;
  }
  uint64_t v14 = *(void **)(*(void *)(a1 + 40) + 8LL);
  id v15 = [*(id *)(a1 + 32) countType];
  id v32 = v13;
  unsigned int v16 = [v14 bindIntParameter:"@count_type" toValue:v15 inStatement:a2 error:&v32];
  id v10 = v32;

  if (v16)
  {
    id v17 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) usageString]);

    id v18 = *(void **)(*(void *)(a1 + 40) + 8LL);
    if (v17)
    {
      id v19 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) usageString]);
      id v31 = v10;
      unsigned __int8 v20 = [v18 bindTextParameter:"@usage_string" toValue:v19 inStatement:a2 error:&v31];
      id v13 = v31;

      if ((v20 & 1) != 0) {
        goto LABEL_6;
      }
    }

    else
    {
      id v30 = v10;
      unsigned int v26 = [v18 bindNullParameter:"@usage_string" inStatement:a2 error:&v30];
      id v13 = v30;

      if (v26)
      {
LABEL_6:
        uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) usageBool]);

        uint64_t v22 = *(void **)(*(void *)(a1 + 40) + 8LL);
        if (v21)
        {
          uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) usageBool]);
          id v29 = v13;
          unsigned __int8 v24 = objc_msgSend( v22,  "bindIntParameter:toValue:inStatement:error:",  "@usage_BOOL",  objc_msgSend(v23, "BOOLValue"),  a2,  &v29);
          id v10 = v29;

          if ((v24 & 1) == 0) {
            goto LABEL_8;
          }
        }

        else
        {
          id v28 = v13;
          uint64_t v25 = (uint64_t)[v22 bindNullParameter:"@usage_BOOL" inStatement:a2 error:&v28];
          id v10 = v28;

          if (!(_DWORD)v25) {
            goto LABEL_13;
          }
        }

        uint64_t v25 = 1LL;
        goto LABEL_13;
      }
    }

LABEL_10:
    uint64_t v25 = 0LL;
    id v10 = v13;
    goto LABEL_13;
  }

LABEL_8:
  uint64_t v25 = 0LL;
LABEL_13:

  return v25;
}

id sub_1000137D0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) createTime]);
  [v4 timeIntervalSince1970];
  double v6 = v5;

  id v7 = *(void **)(*(void *)(a1 + 40) + 8LL);
  unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) settings]);
  unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue([v8 data]);
  id v17 = 0LL;
  unsigned int v10 = [v7 bindBlobParameter:"@settings_data" toValue:v9 inStatement:a2 error:&v17];
  id v11 = v17;

  if (v10)
  {
    unsigned int v12 = *(void **)(*(void *)(a1 + 40) + 8LL);
    id v16 = v11;
    id v13 = [v12 bindInt64Parameter:"@createtime" toValue:(uint64_t)v6 inStatement:a2 error:&v16];
    id v14 = v16;

    id v11 = v14;
  }

  else
  {
    id v13 = 0LL;
  }

  return v13;
}

id sub_100013958(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)(*(void *)(a1 + 32) + 8LL);
  id v14 = 0LL;
  unsigned int v5 = [v4 bindInt64Parameter:"@type" toValue:2 inStatement:a2 error:&v14];
  id v6 = v14;
  if (v5)
  {
    id v7 = *(void **)(a1 + 40);
    unsigned int v8 = *(void **)(*(void *)(a1 + 32) + 8LL);
    unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue([v7 rrLogData]);
    id v13 = v6;
    id v10 = [v8 bindBlobParameter:"@analytic" toValue:v9 inStatement:a2 error:&v13];
    id v11 = v13;

    id v6 = v11;
  }

  else
  {
    id v10 = 0LL;
  }

  return v10;
}

void sub_100013AD0(void *a1)
{
  uint64_t v2 = _GEOCreateTransaction("com.apple.geo.persistAnalytics");
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v8[0] = _NSConcreteStackBlock;
  _OWORD v8[2] = sub_100013B70;
  void v8[3] = &unk_1000291C0;
  uint64_t v4 = a1[4];
  unsigned int v5 = (void *)a1[5];
  id v6 = *(void **)(v4 + 8);
  v8[1] = 3221225472LL;
  uint64_t v7 = a1[6];
  v8[4] = v4;
  uint64_t v10 = v7;
  id v9 = v5;
  [v6 executeInTransaction:v8];
}

BOOL sub_100013B70(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _analyticsCount];
  uint64_t v3 = *(void *)(a1 + 48);
  if ((uint64_t)v2 < v3)
  {
    uint64_t v18 = *(void *)(a1 + 48);
    id v19 = v2;
    __int128 v22 = 0u;
    __int128 v23 = 0u;
    __int128 v20 = 0u;
    __int128 v21 = 0u;
    id v4 = *(id *)(a1 + 40);
    id v5 = [v4 countByEnumeratingWithState:&v20 objects:v26 count:16];
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = *(void *)v21;
      do
      {
        for (i = 0LL; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v21 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = *(void *)(*((void *)&v20 + 1) + 8LL * (void)i);
          id v10 = sub_1000127CC();
          id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v25 = v9;
            _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "inserting elem %@", buf, 0xCu);
          }

          uint64_t v12 = objc_opt_class(&OBJC_CLASS___GEOAPLogMsgQueueElem);
          if ((objc_opt_isKindOfClass(v9, v12) & 1) != 0)
          {
            [*(id *)(a1 + 32) _writeLogMsgQueueElem:v9];
          }

          else
          {
            uint64_t v13 = objc_opt_class(&OBJC_CLASS___GEOAPMonthlyCountsQueueElem);
            if ((objc_opt_isKindOfClass(v9, v13) & 1) != 0)
            {
              [*(id *)(a1 + 32) _writeMonthlyCountElem:v9];
            }

            else
            {
              uint64_t v14 = objc_opt_class(&OBJC_CLASS___GEOAPDailyCountsQueueElem);
              if ((objc_opt_isKindOfClass(v9, v14) & 1) != 0)
              {
                [*(id *)(a1 + 32) _writeDailyCountElem:v9];
              }

              else
              {
                uint64_t v15 = objc_opt_class(&OBJC_CLASS___GEOAPDailySettingsQueueElem);
                if ((objc_opt_isKindOfClass(v9, v15) & 1) != 0)
                {
                  [*(id *)(a1 + 32) _writeDailySettingsElem:v9];
                }

                else
                {
                  uint64_t v16 = objc_opt_class(&OBJC_CLASS___GEOAPRRLogQueueElem);
                  if ((objc_opt_isKindOfClass(v9, v16) & 1) != 0) {
                    [*(id *)(a1 + 32) _writeRRLogElem:v9];
                  }
                }
              }
            }
          }
        }

        id v6 = [v4 countByEnumeratingWithState:&v20 objects:v26 count:16];
      }

      while (v6);
    }

    uint64_t v3 = v18;
    id v2 = v19;
  }

  return (uint64_t)v2 < v3;
}

void sub_100013E68(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = *(void **)(a1 + 40);
  uint64_t v3 = *(void **)(v1 + 8);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_100013EE4;
  v4[3] = &unk_100028FD0;
  v4[4] = v1;
  id v5 = v2;
  [v3 statementForKey:@"availB" statementBlock:v4];
}

uint64_t sub_100013EE4(uint64_t a1, sqlite3_stmt *a2)
{
  while (sqlite3_step(a2) == 100)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithLongLong:]( NSNumber,  "numberWithLongLong:",  [*(id *)(*(void *)(a1 + 32) + 8) int64ForColumn:0 inStatment:a2]));
    [*(id *)(a1 + 40) addObject:v4];
  }

  return 1LL;
}

void sub_100014030(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(a1 + 40);
  id v4 = *(void **)(v2 + 8);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_1000140C4;
  v6[3] = &unk_100029288;
  uint64_t v5 = *(void *)(a1 + 56);
  v6[4] = v2;
  uint64_t v9 = v5;
  id v7 = v3;
  id v8 = *(id *)(a1 + 48);
  [v4 executeInTransaction:v6];
}

id sub_1000140C4(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(a1 + 40);
  id v4 = *(void **)(v2 + 8);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  _OWORD v8[2] = sub_100014168;
  void v8[3] = &unk_100029260;
  uint64_t v5 = *(void *)(a1 + 56);
  v8[4] = v2;
  uint64_t v11 = v5;
  id v9 = v3;
  id v10 = *(id *)(a1 + 48);
  id v6 = [v4 statementForKey:@"nextBP" statementBlock:v8];

  return v6;
}

uint64_t sub_100014168(void *a1, sqlite3_stmt *a2)
{
  id v4 = *(void **)(a1[4] + 8LL);
  uint64_t v5 = a1[7];
  id v18 = 0LL;
  [v4 bindInt64Parameter:"@batchid" toValue:v5 inStatement:a2 error:&v18];
  id v16 = v18;
  if (sqlite3_step(a2) == 100)
  {
    while (1)
    {
      id v6 = objc_msgSend(*(id *)(a1[4] + 8), "int64ForColumn:inStatment:", 0, a2, v16);
      id v7 = [*(id *)(a1[4] + 8) int64ForColumn:1 inStatment:a2];
      id v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1[4] + 8) blobForColumn:2 inStatment:a2]);
      id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSince1970:]( NSDate,  "dateWithTimeIntervalSince1970:",  (double)(uint64_t)[*(id *)(a1[4] + 8) int64ForColumn:4 inStatment:a2]));
      id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSince1970:]( NSDate,  "dateWithTimeIntervalSince1970:",  (double)(uint64_t)[*(id *)(a1[4] + 8) int64ForColumn:3 inStatment:a2]));
      uint64_t v11 = -[GEOAPLogMsgQueueElem initWithLogMsg:uploadBatchId:expireTime:createTime:]( objc_alloc(&OBJC_CLASS___GEOAPLogMsgQueueElem),  "initWithLogMsg:uploadBatchId:expireTime:createTime:",  v8,  v7,  v10,  v9);
      uint64_t v12 = a1[4];
      uint64_t v13 = *(void **)(v12 + 8);
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472LL;
      v17[2] = sub_100014374;
      v17[3] = &unk_100029238;
      void v17[4] = v12;
      v17[5] = v6;
      [v13 executeStatement:@"insI" statementBlock:v17];

      if (sqlite3_step(a2) != 100) {
        goto LABEL_6;
      }
    }
  }

id sub_100014374(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = *(void **)(*(void *)(a1 + 32) + 8LL);
  uint64_t v5 = 0LL;
  return [v3 bindInt64Parameter:"@fk_msgid" toValue:v2 inStatement:a2 error:&v5];
}

void sub_100014528(uint64_t a1)
{
  id v2 = sub_1000127CC();
  uint64_t v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "executeSync", buf, 2u);
  }

  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void **)(a1 + 40);
  id v6 = *(void **)(v4 + 8);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100014620;
  v7[3] = &unk_100029328;
  void v7[4] = v4;
  id v8 = v5;
  id v10 = *(id *)(a1 + 56);
  id v9 = *(id *)(a1 + 48);
  id v11 = *(id *)(a1 + 64);
  [v6 executeInTransaction:v7];
}

uint64_t sub_100014620(uint64_t a1)
{
  id v2 = sub_1000127CC();
  uint64_t v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "executeTransaction", buf, 2u);
  }

  *(void *)buf = 0LL;
  id v17 = buf;
  uint64_t v18 = 0x2020000000LL;
  uint64_t v19 = 0LL;
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  id v6 = *(void **)(v4 + 8);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_100014790;
  v13[3] = &unk_1000292D8;
  v13[4] = v4;
  id v14 = *(id *)(a1 + 56);
  uint64_t v15 = buf;
  [v6 statementForKey:v5 statementBlock:v13];
  if (*((void *)v17 + 3))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    id v8 = *(void **)(v7 + 8);
    uint64_t v9 = *(void *)(a1 + 48);
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_100014A30;
    v12[3] = &unk_100029300;
    v12[4] = v7;
    v12[5] = buf;
    [v8 executeStatement:v9 statementBlock:v12];
  }

  uint64_t v10 = *(void *)(a1 + 64);
  if (v10) {
    (*(void (**)(void))(v10 + 16))();
  }

  _Block_object_dispose(buf, 8);
  return 1LL;
}

void sub_100014778(_Unwind_Exception *a1)
{
}

uint64_t sub_100014790(void *a1, sqlite3_stmt *a2)
{
  id v4 = sub_1000127CC();
  uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134217984;
    __int128 v21 = a2;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "stmtforkey %p", buf, 0xCu);
  }

  if (sqlite3_step(a2) == 100)
  {
    *(void *)&__int128 v6 = 138412290LL;
    __int128 v19 = v6;
    while (1)
    {
      id v7 = objc_msgSend(*(id *)(a1[4] + 8), "int64ForColumn:inStatment:", 0, a2, v19);
      id v8 = [*(id *)(a1[4] + 8) intForColumn:1 inStatment:a2];
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1[4] + 8) stringForColumn:2 inStatment:a2]);
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1[4] + 8) stringForColumn:3 inStatment:a2]);
      id v11 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1[4] + 8) stringForColumn:4 inStatment:a2]);
      uint64_t v12 = v11;
      uint64_t v13 = v11
          ? (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v11 BOOLValue]))
          : 0LL;
      id v14 = (sqlite3_stmt *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSince1970:]( NSDate,  "dateWithTimeIntervalSince1970:",  (double)(uint64_t)[*(id *)(a1[4] + 8) int64ForColumn:5 inStatment:a2]));
      id v15 = sub_1000127CC();
      id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = v19;
        __int128 v21 = v14;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "select elem with create time %@", buf, 0xCu);
      }

      id v17 = -[GEOAPDailyCountsQueueElem initWithType:usageString:usageBool:appId:createTime:]( objc_alloc(&OBJC_CLASS___GEOAPDailyCountsQueueElem),  "initWithType:usageString:usageBool:appId:createTime:",  v8,  v10,  v13,  v9,  v14);
      *(void *)(*(void *)(a1[6] + 8LL) + 24LL) = v7;

      if (sqlite3_step(a2) != 100) {
        return 1LL;
      }
    }
  }

  return 1LL;
}

id sub_100014A30(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = *(void **)(*(void *)(a1 + 32) + 8LL);
  uint64_t v4 = *(void *)(*(void *)(v2 + 8) + 24LL);
  uint64_t v6 = 0LL;
  return [v3 bindInt64Parameter:"@msgid" toValue:v4 inStatement:a2 error:&v6];
}

uint64_t sub_100014B24(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_100014BD8(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(a1 + 40);
  uint64_t v4 = *(void **)(v2 + 8);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_100014C64;
  v5[3] = &unk_1000293A0;
  v5[4] = v2;
  id v6 = v3;
  id v7 = *(id *)(a1 + 48);
  [v4 executeInTransaction:v5];
}

uint64_t sub_100014C64(void *a1)
{
  uint64_t v13 = 0LL;
  id v14 = &v13;
  uint64_t v15 = 0x2020000000LL;
  uint64_t v16 = 0LL;
  uint64_t v2 = a1[4];
  uint64_t v3 = (void *)a1[5];
  uint64_t v4 = *(void **)(v2 + 8);
  v10[2] = sub_100014D8C;
  void v10[3] = &unk_1000292D8;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[4] = v2;
  id v11 = v3;
  uint64_t v12 = &v13;
  [v4 statementForKey:@"qryDS" statementBlock:v10];
  if (v14[3])
  {
    uint64_t v5 = a1[4];
    id v6 = *(void **)(v5 + 8);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_100014ECC;
    v9[3] = &unk_100029300;
    void v9[4] = v5;
    void v9[5] = &v13;
    [v6 executeStatement:@"delDS" statementBlock:v9];
  }

  uint64_t v7 = a1[6];
  if (v7) {
    (*(void (**)(void))(v7 + 16))();
  }

  _Block_object_dispose(&v13, 8);
  return 1LL;
}

void sub_100014D74(_Unwind_Exception *a1)
{
}

uint64_t sub_100014D8C(void *a1, sqlite3_stmt *a2)
{
  if (sqlite3_step(a2) == 100)
  {
    while (1)
    {
      id v4 = [*(id *)(a1[4] + 8) int64ForColumn:0 inStatment:a2];
      uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1[4] + 8) blobForColumn:1 inStatment:a2]);
      id v6 = -[GEOLogMsgEventPeriodicSettingsSummary initWithData:]( objc_alloc(&OBJC_CLASS___GEOLogMsgEventPeriodicSettingsSummary),  "initWithData:",  v5);
      uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSince1970:]( NSDate,  "dateWithTimeIntervalSince1970:",  (double)(uint64_t)[*(id *)(a1[4] + 8) int64ForColumn:2 inStatment:a2]));
      id v8 = -[GEOAPDailySettingsQueueElem initWithSettings:createTime:]( objc_alloc(&OBJC_CLASS___GEOAPDailySettingsQueueElem),  "initWithSettings:createTime:",  v6,  v7);
      *(void *)(*(void *)(a1[6] + 8LL) + 24LL) = v4;

      if (sqlite3_step(a2) != 100) {
        return 1LL;
      }
    }
  }

  return 1LL;
}

id sub_100014ECC(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = *(void **)(*(void *)(a1 + 32) + 8LL);
  uint64_t v4 = *(void *)(*(void *)(v2 + 8) + 24LL);
  uint64_t v6 = 0LL;
  return [v3 bindInt64Parameter:"@msgid" toValue:v4 inStatement:a2 error:&v6];
}

void sub_100014FC8(void *a1)
{
  uint64_t v2 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  uint64_t v3 = a1[4];
  uint64_t v4 = *(void **)(v3 + 8);
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472LL;
  v27[2] = sub_10001522C;
  v27[3] = &unk_100028FD0;
  v27[4] = v3;
  uint64_t v5 = v2;
  id v28 = v5;
  [v4 statementForKey:@"sfd" statementBlock:v27];
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  id obj = v5;
  id v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v23,  v29,  16LL);
  if (v6)
  {
    uint64_t v7 = *(void *)v24;
    do
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v24 != v7) {
          objc_enumerationMutation(obj);
        }
        id v9 = [*(id *)(*((void *)&v23 + 1) + 8 * (void)i) unsignedLongLongValue];
        uint64_t v10 = a1[4];
        id v11 = *(void **)(v10 + 8);
        v22[0] = _NSConcreteStackBlock;
        v22[1] = 3221225472LL;
        v22[2] = sub_1000152C0;
        v22[3] = &unk_1000293F0;
        uint64_t v12 = a1[6];
        v22[4] = v10;
        v22[5] = v12;
        v22[6] = v9;
        [v11 executeStatement:@"delX" statementBlock:v22];
        uint64_t v18 = 0LL;
        __int128 v19 = &v18;
        uint64_t v20 = 0x2020000000LL;
        uint64_t v21 = 0LL;
        uint64_t v13 = a1[4];
        id v14 = *(void **)(v13 + 8);
        v17[0] = _NSConcreteStackBlock;
        v17[1] = 3221225472LL;
        v17[2] = sub_100015358;
        v17[3] = &unk_1000290C0;
        void v17[4] = v13;
        v17[5] = &v18;
        [v14 statementForKey:@"chng" statementBlock:v17];
        if (v19[3])
        {
          uint64_t v15 = a1[5];
          if (v15) {
            (*(void (**)(uint64_t, id))(v15 + 16))(v15, v9);
          }
        }

        _Block_object_dispose(&v18, 8);
      }

      id v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v23,  v29,  16LL);
    }

    while (v6);
  }
}

void sub_10001520C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
}

uint64_t sub_10001522C(uint64_t a1, sqlite3_stmt *a2)
{
  while (sqlite3_step(a2) == 100)
  {
    id v4 = [*(id *)(*(void *)(a1 + 32) + 8) int64ForColumn:0 inStatment:a2];
    uint64_t v5 = *(void **)(a1 + 40);
    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", v4));
    [v5 addObject:v6];
  }

  return 1LL;
}

uint64_t sub_1000152C0(void *a1, uint64_t a2)
{
  uint64_t v4 = a1[5];
  uint64_t v5 = *(void **)(a1[4] + 8LL);
  id v12 = 0LL;
  [v5 bindInt64Parameter:"@expiretime" toValue:v4 inStatement:a2 error:&v12];
  id v6 = v12;
  uint64_t v7 = *(void **)(a1[4] + 8LL);
  uint64_t v8 = a1[6];
  id v11 = v6;
  [v7 bindInt64Parameter:"@batchid" toValue:v8 inStatement:a2 error:&v11];
  id v9 = v11;

  return 1LL;
}

uint64_t sub_100015358(uint64_t a1, sqlite3_stmt *a2)
{
  if (sqlite3_step(a2) == 100) {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [*(id *)(*(void *)(a1 + 32) + 8) int64ForColumn:0 inStatment:a2];
  }
  return 1LL;
}

id sub_100015418(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = *(void **)(v1 + 8);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_100015470;
  v5[3] = &unk_100029460;
  v5[4] = v1;
  void v5[5] = v2;
  return [v3 executeInTransaction:v5];
}

uint64_t sub_100015470(uint64_t a1)
{
  v6[0] = _NSConcreteStackBlock;
  v6[2] = sub_1000154FC;
  v6[3] = &unk_100029238;
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void **)(v2 + 8);
  v6[1] = 3221225472LL;
  v6[4] = v2;
  void v6[5] = v3;
  [v4 executeStatement:@"delBP" statementBlock:v6];
  [*(id *)(*(void *)(a1 + 32) + 8) executeStatement:@"cleanB" statementBlock:&stru_100029438];
  return 1LL;
}

uint64_t sub_1000154FC(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = *(void **)(*(void *)(a1 + 32) + 8LL);
  uint64_t v5 = 0LL;
  [v3 bindInt64Parameter:"@batchid" toValue:v2 inStatement:a2 error:&v5];
  return 1LL;
}

BOOL sub_100015538(id a1, sqlite3_stmt *a2)
{
  return 1;
}

id sub_1000155A8(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) executeStatement:@"nuke" statementBlock:&stru_100029480];
}

BOOL sub_1000155C4(id a1, sqlite3_stmt *a2)
{
  return 1;
}

id sub_100015654(uint64_t a1)
{
  return objc_msgSend( *(id *)(*(void *)(a1 + 32) + 8),  "createTable:withDrop:",  "CREATE TABLE IF NOT EXISTS dailycounts (msgid INTEGER PRIMARY KEY AUTOINCREMENT, count_type INT NOT NULL, app _id TEXT, usage_string TEXT, usage_BOOL BOOLEAN, createtime DATETIME);",
           "DROP TABLE dailycounts;");
}

uint64_t sub_10001645C(uint64_t a1)
{
  *(_BYTE *)(*(void *)(a1 + 32) + 16LL) = *(_BYTE *)(a1 + 40);
  return GEOConfigSetBOOL( GeoAnalyticsConfig_AnalyticsPipelineEvalModeEnabled[0],  GeoAnalyticsConfig_AnalyticsPipelineEvalModeEnabled[1],  *(unsigned __int8 *)(a1 + 40));
}

id sub_1000164F8(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) executeStatement:@"flush" statementBlock:&stru_1000294C8];
}

BOOL sub_100016538(id a1, sqlite3_stmt *a2)
{
  return 1;
}

void sub_100016690(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(a1 + 40);
  uint64_t v4 = *(void **)(v2 + 8);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10001671C;
  v5[3] = &unk_100029070;
  v5[4] = v2;
  id v6 = v3;
  [v4 statementForKey:@"show" statementBlock:v5];
}

uint64_t sub_10001671C(uint64_t a1, sqlite3_stmt *a2)
{
  if (sqlite3_step(a2) == 100)
  {
    *(void *)&__int128 v4 = 134217984LL;
    __int128 v11 = v4;
    do
    {
      uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "blobForColumn:inStatment:", 0, a2, v11));
      unint64_t v6 = (unint64_t)[*(id *)(*(void *)(a1 + 32) + 8) int64ForColumn:1 inStatment:a2];
      [*(id *)(*(void *)(a1 + 32) + 8) doubleForColumn:2 inStatment:a2];
      uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSince1970:](&OBJC_CLASS___NSDate, "dateWithTimeIntervalSince1970:"));
      if (v6 > 2) {
        unint64_t v6 = 1LL;
      }
      id v8 = sub_1000127CC();
      id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = v11;
        unint64_t v13 = v6;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "data type %lld", buf, 0xCu);
      }

      (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
    }

    while (sqlite3_step(a2) == 100);
  }

  return 1LL;
}

void sub_100016898(id a1)
{
  os_log_t v1 = os_log_create("com.apple.GeoAnalytics", "Persistence");
  uint64_t v2 = (void *)qword_100033E58;
  qword_100033E58 = (uint64_t)v1;
}

void sub_1000168C8( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

id sub_1000168E0()
{
  if (qword_100033E68 != -1) {
    dispatch_once(&qword_100033E68, &stru_100029530);
  }
  return (id)qword_100033E70;
}

void sub_100016924(id a1)
{
  os_log_t v1 = objc_alloc_init(&OBJC_CLASS___GEOAPStorage);
  uint64_t v2 = (void *)qword_100033E70;
  qword_100033E70 = (uint64_t)v1;
}

id sub_100016B04(uint64_t a1)
{
  id v2 = sub_100016B84();
  uint64_t v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "upload timer fired", v5, 2u);
  }

  [*(id *)(a1 + 32) _clearUploadTimer];
  [*(id *)(a1 + 32) _flushRemainderToDB];
  return [*(id *)(a1 + 32) _initiateCollationAndUpload];
}

id sub_100016B84()
{
  if (qword_100033E80 != -1) {
    dispatch_once(&qword_100033E80, &stru_1000295C0);
  }
  return (id)qword_100033E78;
}

void sub_100016BC4(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (a1)
  {
    uint64_t v4 = *(void *)(a1 + 72);
    v6[1] = 3221225472LL;
    v6[2] = sub_100016C40;
    v6[3] = &unk_100029210;
    id v5 = v3;
    v6[0] = _NSConcreteStackBlock;
    id v7 = v3;
    uint64_t v8 = a1;
    geo_isolate_sync(v4, v6);

    id v3 = v5;
  }
}

id sub_100016C40(uint64_t a1)
{
  id v2 = sub_100016B84();
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    int v6 = 134217984;
    uint64_t v7 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEBUG,  "registering eval observer %p",  (uint8_t *)&v6,  0xCu);
  }

  return [*(id *)(*(void *)(a1 + 40) + 64) addObject:*(void *)(a1 + 32)];
}

void sub_100016CF0(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (a1)
  {
    uint64_t v4 = *(void *)(a1 + 72);
    v6[1] = 3221225472LL;
    v6[2] = sub_100016D6C;
    v6[3] = &unk_100029210;
    id v5 = v3;
    v6[0] = _NSConcreteStackBlock;
    id v7 = v3;
    uint64_t v8 = a1;
    geo_isolate_sync(v4, v6);

    id v3 = v5;
  }
}

id sub_100016D6C(uint64_t a1)
{
  id v2 = sub_100016B84();
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    int v6 = 134217984;
    uint64_t v7 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEBUG,  "deregistering eval observer %p",  (uint8_t *)&v6,  0xCu);
  }

  return [*(id *)(*(void *)(a1 + 40) + 64) removeObject:*(void *)(a1 + 32)];
}

void sub_100016F7C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

uint64_t sub_100016FA0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_100016FB0(uint64_t a1)
{
}

void sub_100016FB8(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _copyAndEmptyBatchQueue];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8LL);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void sub_10001709C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_1000170B4(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _copyAndEmptyBatchQueue];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8LL);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void sub_1000170E8(uint64_t a1, void *a2, uint64_t a3, void *a4, void *a5)
{
  id v9 = a2;
  id v10 = a4;
  id v11 = a5;
  if (a1)
  {
    id v35 = v10;
    uint64_t v12 = GEOBatchUploadPolicyType(a3);
    uint64_t v13 = GEOBatchAnalyticsSessionType(a3);
    int v14 = v13;
    else {
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"(unknown: %i)",  v13));
    }
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(+[GEOAPUploadPolicies sharedPolicies](&OBJC_CLASS___GEOAPUploadPolicies, "sharedPolicies"));
    id v17 = (void *)objc_claimAutoreleasedReturnValue([v16 uploadPolicyForUploadPolicyType:v12]);

    uint64_t v18 = GEOBatchOpaqueAppID(a3);
    int v19 = v18;
    if ((v14 - 7) < 0xFFFFFFFE || (_DWORD)v12 == geo_userActionAndMetadataUploadType)
    {
      uint64_t v20 = a3;
    }

    else
    {
      uint64_t v20 = GEOMakeGEOAPBatchIDForReqRespMetadata(v18);
      id v21 = sub_100016B84();
      __int128 v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134283777;
        uint64_t v39 = a3;
        __int16 v40 = 2049;
        uint64_t v41 = v20;
        _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEBUG,  "first class upgrade; batchId %{private}llu is now %{private}llu",
          buf,
          0x16u);
      }
    }

    id v23 = sub_100016B84();
    __int128 v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412547;
      uint64_t v39 = (uint64_t)v15;
      __int16 v40 = 1025;
      LODWORD(v41) = v19;
      _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEBUG,  "storing analytic of type %@ (%{private}u)",  buf,  0x12u);
    }

    double v25 = sub_10001748C();
    __int128 v26 = (void *)objc_claimAutoreleasedReturnValue(+[GEOReferenceTimeManager sharedManager](&OBJC_CLASS___GEOReferenceTimeManager, "sharedManager"));
    id v27 = (void *)objc_claimAutoreleasedReturnValue([v26 bestReferenceDate]);

    id v28 = (void *)objc_claimAutoreleasedReturnValue([v27 dateByAddingTimeInterval:v25]);
    id v29 = -[GEOAPLogMsgQueueElem initWithLogMsg:uploadBatchId:expireTime:createTime:]( objc_alloc(&OBJC_CLASS___GEOAPLogMsgQueueElem),  "initWithLogMsg:uploadBatchId:expireTime:createTime:",  v9,  v20,  v28,  v27);
    if ([v17 sendImmediately])
    {
      id v30 = sub_100016B84();
      id v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
      if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v39 = (uint64_t)v15;
        _os_log_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_INFO,  "fast tracking analytic log message of type '%@'",  buf,  0xCu);
      }

      id v32 = objc_retainBlock(v11);
      uint64_t v33 = v20;
      id v10 = v35;
      [(id)a1 _fastTrackElement:v29 withBatchID:v33 completionQueue:v35 completionBlock:v32];
    }

    else
    {
      id v10 = v35;
      [(id)a1 _storeQueueElem:v29 completionQueue:v35 completionBlock:v11];
    }

    if (*(_BYTE *)(a1 + 57))
    {
      uint64_t v34 = *(void *)(a1 + 72);
      v36[0] = _NSConcreteStackBlock;
      v36[1] = 3221225472LL;
      v36[2] = sub_1000174F0;
      v36[3] = &unk_100029210;
      v36[4] = a1;
      id v37 = v9;
      geo_isolate_sync(v34, v36);
    }
  }
}

double sub_10001748C()
{
  uint64_t v0 = GEOBatchUploadPolicyType();
  os_log_t v1 = (void *)objc_claimAutoreleasedReturnValue(+[GEOAPUploadPolicies sharedPolicies](&OBJC_CLASS___GEOAPUploadPolicies, "sharedPolicies"));
  id v2 = (void *)objc_claimAutoreleasedReturnValue([v1 uploadPolicyForUploadPolicyType:v0]);

  [v2 ttl];
  double v4 = v3;

  return v4;
}

void sub_1000174F0(uint64_t a1)
{
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  id v2 = *(id *)(*(void *)(a1 + 32) + 64LL);
  id v3 = [v2 countByEnumeratingWithState:&v10 objects:v16 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v11;
    do
    {
      for (i = 0LL; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void **)(*((void *)&v10 + 1) + 8LL * (void)i);
        id v8 = sub_100016B84();
        id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 134217984;
          uint64_t v15 = v7;
          _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "notifying observer %p", buf, 0xCu);
        }

        [v7 logMsg:*(void *)(a1 + 40)];
      }

      id v4 = [v2 countByEnumeratingWithState:&v10 objects:v16 count:16];
    }

    while (v4);
  }
}

void sub_100017658(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6, void *a7)
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  if (a1)
  {
    id v16 = a7;
    id v17 = a6;
    id v18 = sub_100016B84();
    int v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v20 = @"UNKNOWN_EVENT";
      switch((int)a2)
      {
        case 0:
          break;
        case 1:
          uint64_t v20 = @"ACCIDENT_CONFIRMATION";
          break;
        case 2:
          uint64_t v20 = @"ACCIDENT_SUBMISSION";
          break;
        case 3:
          uint64_t v20 = @"ADD_LICENSE_PLATE";
          break;
        case 4:
          uint64_t v20 = @"ANNOUNCEMENT_DISPLAYED_ENHANCED_DETAIL";
          break;
        case 5:
          uint64_t v20 = @"ANNOUNCEMENT_DISPLAYED_FLYOVER";
          break;
        case 6:
          uint64_t v20 = @"ANNOUNCEMENT_DISPLAYED_GENERAL";
          break;
        case 7:
          uint64_t v20 = @"ANNOUNCEMENT_DISPLAYED_LANE_GUIDANCE";
          break;
        case 8:
          uint64_t v20 = @"ANNOUNCEMENT_DISPLAYED_LOOK_AROUND";
          break;
        case 9:
          uint64_t v20 = @"ANNOUNCEMENT_DISPLAYED_TRANSIT";
          break;
        case 10:
          uint64_t v20 = @"ANNOUNCEMENT_DISPLAYED_UNKNOWN";
          break;
        case 11:
          uint64_t v20 = @"ANNOUNCEMENT_DISPLAYED_VENUES";
          break;
        case 12:
          uint64_t v20 = @"ANNOUNCEMENT_TAPPED_ENHANCED_DETAIL";
          break;
        case 13:
          uint64_t v20 = @"ANNOUNCEMENT_TAPPED_FLYOVER";
          break;
        case 14:
          uint64_t v20 = @"ANNOUNCEMENT_TAPPED_GENERAL";
          break;
        case 15:
          uint64_t v20 = @"ANNOUNCEMENT_TAPPED_LANE_GUIDANCE";
          break;
        case 16:
          uint64_t v20 = @"ANNOUNCEMENT_TAPPED_LOOK_AROUND";
          break;
        case 17:
          uint64_t v20 = @"ANNOUNCEMENT_TAPPED_TRANSIT";
          break;
        case 18:
          uint64_t v20 = @"ANNOUNCEMENT_TAPPED_UNKNOWN";
          break;
        case 19:
          uint64_t v20 = @"ANNOUNCEMENT_TAPPED_VENUES";
          break;
        case 20:
          uint64_t v20 = @"APP_CLIP_USED";
          break;
        case 21:
          uint64_t v20 = @"AR_MODE_ENTER";
          break;
        case 22:
          uint64_t v20 = @"AUTOCOMPLETE_RESULTS_SHOWN";
          break;
        case 23:
          uint64_t v20 = @"CARPLAY_CONNECTED";
          break;
        case 24:
          uint64_t v20 = @"COARSE_LOCATION_USED";
          break;
        case 25:
          uint64_t v20 = @"COLLECTION_CREATED";
          break;
        case 26:
          uint64_t v20 = @"COLLECTION_ITEM_TAPPED";
          break;
        case 27:
          uint64_t v20 = @"COLLECTION_SHARED";
          break;
        case 28:
          uint64_t v20 = @"COLLECTION_SHOWN";
          break;
        case 29:
          uint64_t v20 = @"CURATED_COLLECTION_ITEM_TAPPED";
          break;
        case 30:
          uint64_t v20 = @"CURATED_COLLECTION_REMOVED";
          break;
        case 31:
          uint64_t v20 = @"CURATED_COLLECTION_SAVED";
          break;
        case 32:
          uint64_t v20 = @"CURATED_COLLECTION_SHARED";
          break;
        case 33:
          uint64_t v20 = @"CURATED_COLLECTION_SHOWN";
          break;
        case 34:
          uint64_t v20 = @"DEVICE_CONNECTED";
          break;
        case 35:
          uint64_t v20 = @"DIRECTIONS";
          break;
        case 36:
          uint64_t v20 = @"DIRECTIONS_REQUESTED_CYCLING";
          break;
        case 37:
          uint64_t v20 = @"DIRECTIONS_REQUESTED_DRIVING";
          break;
        case 38:
          uint64_t v20 = @"DIRECTIONS_REQUESTED_EBIKE";
          break;
        case 39:
          uint64_t v20 = @"DIRECTIONS_REQUESTED_EV_ROUTING";
          break;
        case 40:
          uint64_t v20 = @"DIRECTIONS_REQUESTED_TRANSIT";
          break;
        case 41:
          uint64_t v20 = @"DIRECTIONS_REQUESTED_WALKING";
          break;
        case 42:
          uint64_t v20 = @"DIRECTIONS_SAFARI";
          break;
        case 43:
          uint64_t v20 = @"DIRECTIONS_SIRI_PLACECARD";
          break;
        case 44:
          uint64_t v20 = @"DIRECTIONS_SPOTLIGHT";
          break;
        case 45:
          uint64_t v20 = @"ENTER_MAPS_CARPLAY";
          break;
        case 46:
          uint64_t v20 = @"ENTER_VENUE_EXPERIENCE";
          break;
        case 47:
          uint64_t v20 = @"ETA_RECEIVED";
          break;
        case 48:
          uint64_t v20 = @"ETA_SHARED";
          break;
        case 49:
          uint64_t v20 = @"FAVORITE_ADD_PLACE";
          break;
        case 50:
          uint64_t v20 = @"FAVORITE_TAP_LIST_ITEM";
          break;
        case 51:
          uint64_t v20 = @"FLYOVER_FOREGROUNDED";
          break;
        case 52:
          uint64_t v20 = @"INCIDENT_SUBMISSION";
          break;
        case 53:
          uint64_t v20 = @"LOOK_AROUND_FOREGROUNDED";
          break;
        case 54:
          uint64_t v20 = @"LOOK_AROUND_SHARED";
          break;
        case 55:
          uint64_t v20 = @"MAPSHOME_GET_DIRECTIONS";
          break;
        case 56:
          uint64_t v20 = @"MAPS_HANDOFF_FROM_IPAD";
          break;
        case 57:
          uint64_t v20 = @"MAPS_HANDOFF_FROM_MAC";
          break;
        case 58:
          uint64_t v20 = @"MAPS_HANDOFF_FROM_PHONE";
          break;
        case 59:
          uint64_t v20 = @"MAPS_HANDOFF_FROM_WATCH";
          break;
        case 60:
          uint64_t v20 = @"MAP_VIEW_FOREGROUNDED";
          break;
        case 61:
          uint64_t v20 = @"NAV_SESSION_COARSE_LOCATION";
          break;
        case 62:
          uint64_t v20 = @"NAV_SESSION_PRECISE_LOCATION";
          break;
        case 63:
          uint64_t v20 = @"NAV_STARTED_CARPLAY";
          break;
        case 64:
          uint64_t v20 = @"NAV_STARTED_CYCLING";
          break;
        case 65:
          uint64_t v20 = @"NAV_STARTED_DRIVING";
          break;
        case 66:
          uint64_t v20 = @"NAV_STARTED_EBIKE";
          break;
        case 67:
          uint64_t v20 = @"NAV_STARTED_EV_ROUTING";
          break;
        case 68:
          uint64_t v20 = @"NAV_STARTED_JUNCTION_VIEW";
          break;
        case 69:
          uint64_t v20 = @"NAV_STARTED_LANE_GUIDANCE";
          break;
        case 70:
          uint64_t v20 = @"NAV_STARTED_TRANSIT";
          break;
        case 71:
          uint64_t v20 = @"NAV_STARTED_WALKING";
          break;
        case 72:
          uint64_t v20 = @"OPEN_INDOOR_MAP";
          break;
        case 73:
          uint64_t v20 = @"OTHER_GET_DIRECTIONS";
          break;
        case 74:
          uint64_t v20 = @"PLACECARD_GET_DIRECTIONS";
          break;
        case 75:
          uint64_t v20 = @"PLACECARD_RICH_DATA_USED";
          break;
        case 76:
          uint64_t v20 = @"PLACECARD_SHARED";
          break;
        case 77:
          uint64_t v20 = @"PLACECARD_SHOWN";
          break;
        case 78:
          uint64_t v20 = @"PLACECARD_SHOWN_SAFARI";
          break;
        case 79:
          uint64_t v20 = @"PLACECARD_SHOWN_SIRI";
          break;
        case 80:
          uint64_t v20 = @"PLACECARD_SHOWN_SPOTLIGHT";
          break;
        case 81:
          uint64_t v20 = @"PLACECARD_START_NAV";
          break;
        case 82:
          uint64_t v20 = @"PROMINENT_GET_DIRECTIONS";
          break;
        case 83:
          uint64_t v20 = @"RAP_STARTED";
          break;
        case 84:
          uint64_t v20 = @"RIDESHARE_REQUESTED";
          break;
        case 85:
          uint64_t v20 = @"SEARCH_NEARBY_CATEGORY_TAPPED";
          break;
        case 86:
          uint64_t v20 = @"SEARCH_RECENTLY_VIEWED_TAPPED";
          break;
        case 87:
          uint64_t v20 = @"SEARCH_RECENT_SEARCHES_TAPPED";
          break;
        case 88:
          uint64_t v20 = @"SEARCH_RESULTS_SHOWN_MAPS";
          break;
        case 89:
          uint64_t v20 = @"SEARCH_RESULTS_SHOWN_SAFARI";
          break;
        case 90:
          uint64_t v20 = @"SEARCH_RESULTS_SHOWN_SIRI";
          break;
        case 91:
          uint64_t v20 = @"SEARCH_RESULTS_SHOWN_SPOTLIGHT";
          break;
        case 92:
          uint64_t v20 = @"SEARCH_RESULTS_TAPPED_SAFARI";
          break;
        case 93:
          uint64_t v20 = @"SEARCH_RESULTS_TAPPED_SIRI";
          break;
        case 94:
          uint64_t v20 = @"SEARCH_RESULTS_TAPPED_SPOTLIGHT";
          break;
        case 95:
          uint64_t v20 = @"SEARCH_RESULT_TAPPED_MAPS";
          break;
        case 96:
          uint64_t v20 = @"SEARCH_SUGGESTION_TAPPED";
          break;
        case 97:
          uint64_t v20 = @"SHARE_DRIVING_ROUTES";
          break;
        case 98:
          uint64_t v20 = @"SHARE_FAVORITES";
          break;
        case 99:
          uint64_t v20 = @"SHARE_MYLOCATION";
          break;
        case 100:
          uint64_t v20 = @"SHARE_TO_DEVICE";
          break;
        case 101:
          uint64_t v20 = @"SHARE_TRANSIT_ROUTES";
          break;
        case 102:
          uint64_t v20 = @"SHARE_WALKING_ROUTES";
          break;
        case 103:
          uint64_t v20 = @"SHOW_MAPS_SETTINGS";
          break;
        case 104:
          uint64_t v20 = @"SIRI_START_NAV";
          break;
        case 105:
          uint64_t v20 = @"SNAPSHOTTER_USED";
          break;
        case 106:
          uint64_t v20 = @"TAP_COMPASS_MODE";
          break;
        case 107:
          uint64_t v20 = @"UGC_PHOTO_SUBMISSION";
          break;
        case 108:
          uint64_t v20 = @"UGC_RATING_SUBMISSION";
          break;
        case 109:
          uint64_t v20 = @"VLF_CORRECTION_ATTEMPTED";
          break;
        case 110:
          uint64_t v20 = @"VLF_CORRECTION_FAILED";
          break;
        case 111:
          uint64_t v20 = @"VLF_CORRECTION_SUCCESS";
          break;
        case 112:
          uint64_t v20 = @"WIDGET_ENTER";
          break;
        case 113:
          uint64_t v20 = @"JUNCTION_VIEW_SHOWN";
          break;
        case 114:
          uint64_t v20 = @"ETA_SHARED_DRIVING";
          break;
        case 115:
          uint64_t v20 = @"ETA_SHARED_WALKING";
          break;
        case 116:
          uint64_t v20 = @"ETA_SHARED_CYCLING";
          break;
        case 117:
          uint64_t v20 = @"MAPS_HANDOFF";
          break;
        case 118:
          uint64_t v20 = @"AR_WALKING_LOCALIZATION_ATTEMPTED";
          break;
        case 119:
          uint64_t v20 = @"AR_WALKING_LOCALIZATION_FAILED";
          break;
        case 120:
          uint64_t v20 = @"AR_WALKING_LOCALIZATION_SUCCESS";
          break;
        case 121:
          uint64_t v20 = @"CURATED_COLLECTIONS_HOME_SHOWN";
          break;
        case 122:
          uint64_t v20 = @"CURATED_COLLECTIONS_HOME_CONDENSED_SHOWN";
          break;
        case 123:
          uint64_t v20 = @"NEARBY_TRANSIT_SHOWN";
          break;
        case 124:
          uint64_t v20 = @"NEARBY_TRANSIT_TAPPED";
          break;
        case 125:
          uint64_t v20 = @"SPR_GLOBE_EXPLORED";
          break;
        case 126:
          uint64_t v20 = @"SPR_METROS_EXPLORED";
          break;
        case 127:
          uint64_t v20 = @"TRANSIT_DETAILS_USED";
          break;
        case 128:
          uint64_t v20 = @"USER_ACCOUNT_OPENED_ACCOUNT";
          break;
        case 129:
          uint64_t v20 = @"USER_ACCOUNT_SHOWN";
          break;
        case 130:
          uint64_t v20 = @"MAP_MODE_DRIVING_SELECTED";
          break;
        case 131:
          uint64_t v20 = @"MAP_MODE_EXPLORE_SELECTED";
          break;
        case 132:
          uint64_t v20 = @"MAP_MODE_TRANSIT_SELECTED";
          break;
        case 133:
          uint64_t v20 = @"MAP_MODE_SATELLITE_SELECTED";
          break;
        case 134:
          uint64_t v20 = @"MAP_MODE_DRIVING_USED";
          break;
        case 135:
          uint64_t v20 = @"MAP_MODE_EXPLORE_USED";
          break;
        case 136:
          uint64_t v20 = @"MAP_MODE_TRANSIT_USED";
          break;
        case 137:
          uint64_t v20 = @"MAP_MODE_SATELLITE_USED";
          break;
        case 138:
          uint64_t v20 = @"WATCH_GET_DIRECTIONS_CYCLING";
          break;
        case 139:
          uint64_t v20 = @"WATCH_START_NAV_CYCLING";
          break;
        case 140:
          uint64_t v20 = @"WATCH_GET_DIRECTIONS_WALKING";
          break;
        case 141:
          uint64_t v20 = @"WATCH_START_NAV_WALKING";
          break;
        case 142:
          uint64_t v20 = @"WATCH_GET_DIRECTIONS_TRANSIT";
          break;
        case 143:
          uint64_t v20 = @"WATCH_START_NAV_TRANSIT";
          break;
        case 144:
          uint64_t v20 = @"WATCH_GET_DIRECTIONS_DRIVING";
          break;
        case 145:
          uint64_t v20 = @"WATCH_START_NAV_DRIVING";
          break;
        case 146:
          uint64_t v20 = @"ETA_SHARED_TRANSIT";
          break;
        case 147:
          uint64_t v20 = @"USER_ACCOUNT_OPENED";
          break;
        case 148:
          uint64_t v20 = @"VENUE_INTERACTION";
          break;
        case 149:
          uint64_t v20 = @"ENTER_MAPS";
          break;
        case 150:
          uint64_t v20 = @"EXIT_MAPS";
          break;
        case 151:
          uint64_t v20 = @"TOTAL_SECONDS_IN_MAPS_DEVICE";
          break;
        case 152:
          uint64_t v20 = @"ENTER_MAPS_DEVICE";
          break;
        case 153:
          uint64_t v20 = @"MAP_VIEW_INSTANTIATED";
          break;
        case 154:
          uint64_t v20 = @"MAP_VIEW_ACTIVATED";
          break;
        case 155:
          uint64_t v20 = @"DIRECTIONS_PLACECARD_REVEAL_CARPLAY_UI";
          break;
        case 156:
          uint64_t v20 = @"DIRECTIONS_LIST_ITEM_CARPLAY_UI";
          break;
        case 157:
          uint64_t v20 = @"DIRECTIONS_FAVORITE_CARPLAY_UI";
          break;
        case 158:
          uint64_t v20 = @"GET_DIRECTIONS_CARPLAY_CONNECTED";
          break;
        case 159:
          uint64_t v20 = @"DIRECTIONS_REQUESTED_DRIVING_CARPLAY_CONNECTED";
          break;
        case 160:
          uint64_t v20 = @"SIRI_SEARCH_CARPLAY_UI";
          break;
        case 161:
          uint64_t v20 = @"OPEN_KEYBOARD_CARPLAY_UI";
          break;
        case 162:
          uint64_t v20 = @"TAP_SEARCH_CARPLAY_UI";
          break;
        case 163:
          uint64_t v20 = @"OPEN_SEARCH_CARPLAY_UI";
          break;
        case 164:
          uint64_t v20 = @"MAPS_SEARCH_CARPLAY_CONNECTED";
          break;
        case 165:
          uint64_t v20 = @"EXIT_MAPS_CARPLAY";
          break;
        case 166:
          uint64_t v20 = @"TOTAL_SECONDS_IN_MAPS_CARPLAY";
          break;
        case 167:
          uint64_t v20 = @"NAV_FEEDBACK_DRIVING";
          break;
        case 168:
          uint64_t v20 = @"TRIP_COMPLETED_DRIVING";
          break;
        case 169:
          uint64_t v20 = @"HAS_REROUTE_DRIVING";
          break;
        case 170:
          uint64_t v20 = @"ETA_OVERESTIMATE_DRIVING";
          break;
        case 171:
          uint64_t v20 = @"EXTREME_ETA_OVERESTIMATE_DRIVING";
          break;
        case 172:
          uint64_t v20 = @"ETA_UNDERESTIMATE_DRIVING";
          break;
        case 173:
          uint64_t v20 = @"EXTREME_ETA_UNDERESTIMATE_DRIVING";
          break;
        case 174:
          uint64_t v20 = @"RAP_GOOD_TRIP";
          break;
        case 175:
          uint64_t v20 = @"ENRICHED_RESULTS_SHOWN_MAPS";
          break;
        case 176:
          uint64_t v20 = @"TAP_TRANSIT_TIPKIT";
          break;
        case 177:
          uint64_t v20 = @"ADD_STOP_CARPLAY";
          break;
        case 178:
          uint64_t v20 = @"ADD_STOP_CARPLAY_SIRI";
          break;
        case 179:
          uint64_t v20 = @"ADD_STOP_DEVICE";
          break;
        case 180:
          uint64_t v20 = @"ADD_STOP_DEVICE_SIRI";
          break;
        case 181:
          uint64_t v20 = @"SHOWCASE_SHOWN";
          break;
        case 182:
          uint64_t v20 = @"SHOWCASE_TAPPED";
          break;
        case 183:
          uint64_t v20 = @"PUNCH_IN_SIRI";
          break;
        case 184:
          uint64_t v20 = @"PUNCH_IN_SAFARI";
          break;
        case 185:
          uint64_t v20 = @"PUNCH_IN_SPOTLIGHT";
          break;
        case 186:
          uint64_t v20 = @"PUNCH_IN_SMS";
          break;
        case 187:
          uint64_t v20 = @"PUNCH_IN_FINDMY";
          break;
        case 188:
          uint64_t v20 = @"PUNCH_IN_OTHER_2ND_PARTY";
          break;
        case 189:
          uint64_t v20 = @"PUNCH_IN_3RD_PARTY";
          break;
        case 191:
          uint64_t v20 = @"RAP_SUBMITTED";
          break;
        case 192:
          uint64_t v20 = @"ARP_PHOTO_SUBMISSION";
          break;
        case 193:
          uint64_t v20 = @"ARP_RATING_SUBMISSION";
          break;
        case 194:
          uint64_t v20 = @"TRAFFIC_INCIDENT_REPORT";
          break;
        case 195:
          uint64_t v20 = @"TRAFFIC_INCIDENT_CONFIRM";
          break;
        case 196:
          uint64_t v20 = @"TRAFFIC_INCIDENT_DISMISS";
          break;
        case 197:
          uint64_t v20 = @"TRAFFIC_INCIDENT_CLEAR";
          break;
        case 198:
          uint64_t v20 = @"MODERN_MAP_EXPLORED";
          break;
        case 199:
          uint64_t v20 = @"CARPLAY_ROUTING_UI_USED";
          break;
        case 200:
          uint64_t v20 = @"CARPLAY_SEARCH_UI_USED";
          break;
        case 201:
          uint64_t v20 = @"ANNOUNCEMENT_DISPLAYED";
          break;
        case 202:
          uint64_t v20 = @"ANNOUNCEMENT_TAPPED";
          break;
        case 203:
          uint64_t v20 = @"POSITIVE_SEARCH_ENGAGEMENT";
          break;
        case 204:
          uint64_t v20 = @"PUNCH_OUT_FINDMY";
          break;
        case 205:
          uint64_t v20 = @"WATCH_START_NAV";
          break;
        case 206:
          uint64_t v20 = @"HIKING_ENGAGEMENT";
          break;
        case 207:
          uint64_t v20 = @"HIKING_PLACECARD";
          break;
        case 208:
          uint64_t v20 = @"NO_SEARCH_RESULTS";
          break;
        case 209:
          uint64_t v20 = @"PUNCH_IN_SHOWCASE";
          break;
        case 210:
          uint64_t v20 = @"SHARED_LOCATION_ENGAGEMENT";
          break;
        case 211:
          uint64_t v20 = @"SHARE_SHOWCASE";
          break;
        case 212:
          uint64_t v20 = @"WATCH_MAP_VIEW";
          break;
        case 213:
          uint64_t v20 = @"WATCH_PLACECARD";
          break;
        case 214:
          uint64_t v20 = @"WATCH_SEARCH";
          break;
        case 215:
          uint64_t v20 = @"CURATED_HIKE_SAVED";
          break;
        case 216:
          uint64_t v20 = @"CUSTOM_HIKE_SAVED";
          break;
        case 217:
          uint64_t v20 = @"CUSTOM_HIKE_CREATION_TRAY_SHOWN";
          break;
        case 218:
          uint64_t v20 = @"DIRECTIONS_REQUESTED_CURATED_HIKE";
          break;
        case 219:
          uint64_t v20 = @"DIRECTIONS_REQUESTED_CUSTOM_HIKE";
          break;
        case 220:
          uint64_t v20 = @"NAV_STARTED_CURATED_HIKE";
          break;
        case 221:
          uint64_t v20 = @"NAV_STARTED_CUSTOM_HIKE";
          break;
        case 222:
          uint64_t v20 = @"ROUTING_TRAY_CURATED_HIKE_SHOWN";
          break;
        case 223:
          uint64_t v20 = @"ROUTING_TRAY_CUSTOM_HIKE_SHOWN";
          break;
        case 224:
          uint64_t v20 = @"SEARCH_PHOTO_INTERACTION";
          break;
        case 225:
          uint64_t v20 = @"COMPLETE_DOWNLOAD_OFFLINE_MAPS";
          break;
        case 226:
          uint64_t v20 = @"LIBRARY_INTERACTION";
          break;
        case 227:
          uint64_t v20 = @"SEARCH_FILTER_INTERACTION";
          break;
        case 228:
          uint64_t v20 = @"AUTOCOMPLETE_RESULTS_SHOWN_OFFLINE";
          break;
        case 229:
          uint64_t v20 = @"CARPLAY_CONNECTED_OFFLINE";
          break;
        case 230:
          uint64_t v20 = @"CATEGORY_SEARCH_MARKET_ONLY_OFFLINE";
          break;
        case 231:
          uint64_t v20 = @"DIRECTIONS_OFFLINE";
          break;
        case 232:
          uint64_t v20 = @"ENTER_MAPS_DEVICE_OFFLINE";
          break;
        case 233:
          uint64_t v20 = @"NO_SEARCH_RESULTS_OFFLINE";
          break;
        case 234:
          uint64_t v20 = @"SEARCH_NEARBY_CATEGORY_TAPPED_OFFLINE";
          break;
        case 235:
          uint64_t v20 = @"SEARCH_RESULTS_SHOWN_MAPS_OFFLINE";
          break;
        case 236:
          uint64_t v20 = @"SEARCH_RESULT_TAPPED_MAPS_OFFLINE";
          break;
        case 237:
          uint64_t v20 = @"TAP_DOWNLOAD_MAPS_OFFLINE";
          break;
        default:
          uint64_t v20 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"(unknown: %i)",  a2));
          break;
      }

      *(_DWORD *)buf = 138412290;
      id v31 = v20;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEBUG, "storing Daily Usage action '%@'", buf, 0xCu);
    }

    id v21 = (void *)objc_claimAutoreleasedReturnValue(+[GEOReferenceTimeManager sharedManager](&OBJC_CLASS___GEOReferenceTimeManager, "sharedManager"));
    __int128 v22 = (void *)objc_claimAutoreleasedReturnValue([v21 bestReferenceDate]);

    id v23 = -[GEOAPDailyCountsQueueElem initWithType:usageString:usageBool:appId:createTime:]( objc_alloc(&OBJC_CLASS___GEOAPDailyCountsQueueElem),  "initWithType:usageString:usageBool:appId:createTime:",  a2,  v13,  v14,  v15,  v22);
    [(id)a1 _storeQueueElem:v23 completionQueue:v17 completionBlock:v16];

    if (*(_BYTE *)(a1 + 57))
    {
      uint64_t v24 = *(void *)(a1 + 72);
      v25[0] = _NSConcreteStackBlock;
      v25[1] = 3221225472LL;
      v25[2] = sub_1000183B0;
      v25[3] = &unk_100029580;
      v25[4] = a1;
      int v29 = a2;
      id v26 = v13;
      id v27 = v14;
      id v28 = v15;
      geo_isolate_sync(v24, v25);
    }
  }
}

void sub_1000183B0(uint64_t a1)
{
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  id v2 = *(id *)(*(void *)(a1 + 32) + 64LL);
  id v3 = [v2 countByEnumeratingWithState:&v10 objects:v16 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v11;
    do
    {
      for (i = 0LL; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void **)(*((void *)&v10 + 1) + 8LL * (void)i);
        id v8 = sub_100016B84();
        id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 134217984;
          id v15 = v7;
          _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "notifying observer %p", buf, 0xCu);
        }

        [v7 dailyUsageActionType:*(unsigned int *)(a1 + 64) usageString:*(void *)(a1 + 40) usageBool:*(void *)(a1 + 48) appId:*(void *)(a1 + 56)];
      }

      id v4 = [v2 countByEnumeratingWithState:&v10 objects:v16 count:16];
    }

    while (v4);
  }
}

void sub_100018520(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6, void *a7)
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  if (a1)
  {
    id v16 = a7;
    id v17 = a6;
    id v18 = sub_100016B84();
    int v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v20 = @"UNKNOWN_EVENT";
      switch((int)a2)
      {
        case 0:
          break;
        case 1:
          uint64_t v20 = @"ACCIDENT_CONFIRMATION";
          break;
        case 2:
          uint64_t v20 = @"ACCIDENT_SUBMISSION";
          break;
        case 3:
          uint64_t v20 = @"ADD_LICENSE_PLATE";
          break;
        case 4:
          uint64_t v20 = @"ANNOUNCEMENT_DISPLAYED_ENHANCED_DETAIL";
          break;
        case 5:
          uint64_t v20 = @"ANNOUNCEMENT_DISPLAYED_FLYOVER";
          break;
        case 6:
          uint64_t v20 = @"ANNOUNCEMENT_DISPLAYED_GENERAL";
          break;
        case 7:
          uint64_t v20 = @"ANNOUNCEMENT_DISPLAYED_LANE_GUIDANCE";
          break;
        case 8:
          uint64_t v20 = @"ANNOUNCEMENT_DISPLAYED_LOOK_AROUND";
          break;
        case 9:
          uint64_t v20 = @"ANNOUNCEMENT_DISPLAYED_TRANSIT";
          break;
        case 10:
          uint64_t v20 = @"ANNOUNCEMENT_DISPLAYED_UNKNOWN";
          break;
        case 11:
          uint64_t v20 = @"ANNOUNCEMENT_DISPLAYED_VENUES";
          break;
        case 12:
          uint64_t v20 = @"ANNOUNCEMENT_TAPPED_ENHANCED_DETAIL";
          break;
        case 13:
          uint64_t v20 = @"ANNOUNCEMENT_TAPPED_FLYOVER";
          break;
        case 14:
          uint64_t v20 = @"ANNOUNCEMENT_TAPPED_GENERAL";
          break;
        case 15:
          uint64_t v20 = @"ANNOUNCEMENT_TAPPED_LANE_GUIDANCE";
          break;
        case 16:
          uint64_t v20 = @"ANNOUNCEMENT_TAPPED_LOOK_AROUND";
          break;
        case 17:
          uint64_t v20 = @"ANNOUNCEMENT_TAPPED_TRANSIT";
          break;
        case 18:
          uint64_t v20 = @"ANNOUNCEMENT_TAPPED_UNKNOWN";
          break;
        case 19:
          uint64_t v20 = @"ANNOUNCEMENT_TAPPED_VENUES";
          break;
        case 20:
          uint64_t v20 = @"APP_CLIP_USED";
          break;
        case 21:
          uint64_t v20 = @"AR_MODE_ENTER";
          break;
        case 22:
          uint64_t v20 = @"AUTOCOMPLETE_RESULTS_SHOWN";
          break;
        case 23:
          uint64_t v20 = @"CARPLAY_CONNECTED";
          break;
        case 24:
          uint64_t v20 = @"COARSE_LOCATION_USED";
          break;
        case 25:
          uint64_t v20 = @"COLLECTION_CREATED";
          break;
        case 26:
          uint64_t v20 = @"COLLECTION_ITEM_TAPPED";
          break;
        case 27:
          uint64_t v20 = @"COLLECTION_SHARED";
          break;
        case 28:
          uint64_t v20 = @"COLLECTION_SHOWN";
          break;
        case 29:
          uint64_t v20 = @"CURATED_COLLECTION_ITEM_TAPPED";
          break;
        case 30:
          uint64_t v20 = @"CURATED_COLLECTION_REMOVED";
          break;
        case 31:
          uint64_t v20 = @"CURATED_COLLECTION_SAVED";
          break;
        case 32:
          uint64_t v20 = @"CURATED_COLLECTION_SHARED";
          break;
        case 33:
          uint64_t v20 = @"CURATED_COLLECTION_SHOWN";
          break;
        case 34:
          uint64_t v20 = @"DEVICE_CONNECTED";
          break;
        case 35:
          uint64_t v20 = @"DIRECTIONS";
          break;
        case 36:
          uint64_t v20 = @"DIRECTIONS_REQUESTED_CYCLING";
          break;
        case 37:
          uint64_t v20 = @"DIRECTIONS_REQUESTED_DRIVING";
          break;
        case 38:
          uint64_t v20 = @"DIRECTIONS_REQUESTED_EBIKE";
          break;
        case 39:
          uint64_t v20 = @"DIRECTIONS_REQUESTED_EV_ROUTING";
          break;
        case 40:
          uint64_t v20 = @"DIRECTIONS_REQUESTED_TRANSIT";
          break;
        case 41:
          uint64_t v20 = @"DIRECTIONS_REQUESTED_WALKING";
          break;
        case 42:
          uint64_t v20 = @"DIRECTIONS_SAFARI";
          break;
        case 43:
          uint64_t v20 = @"DIRECTIONS_SIRI_PLACECARD";
          break;
        case 44:
          uint64_t v20 = @"DIRECTIONS_SPOTLIGHT";
          break;
        case 45:
          uint64_t v20 = @"ENTER_MAPS_CARPLAY";
          break;
        case 46:
          uint64_t v20 = @"ENTER_VENUE_EXPERIENCE";
          break;
        case 47:
          uint64_t v20 = @"ETA_RECEIVED";
          break;
        case 48:
          uint64_t v20 = @"ETA_SHARED";
          break;
        case 49:
          uint64_t v20 = @"FAVORITE_ADD_PLACE";
          break;
        case 50:
          uint64_t v20 = @"FAVORITE_TAP_LIST_ITEM";
          break;
        case 51:
          uint64_t v20 = @"FLYOVER_FOREGROUNDED";
          break;
        case 52:
          uint64_t v20 = @"INCIDENT_SUBMISSION";
          break;
        case 53:
          uint64_t v20 = @"LOOK_AROUND_FOREGROUNDED";
          break;
        case 54:
          uint64_t v20 = @"LOOK_AROUND_SHARED";
          break;
        case 55:
          uint64_t v20 = @"MAPSHOME_GET_DIRECTIONS";
          break;
        case 56:
          uint64_t v20 = @"MAPS_HANDOFF_FROM_IPAD";
          break;
        case 57:
          uint64_t v20 = @"MAPS_HANDOFF_FROM_MAC";
          break;
        case 58:
          uint64_t v20 = @"MAPS_HANDOFF_FROM_PHONE";
          break;
        case 59:
          uint64_t v20 = @"MAPS_HANDOFF_FROM_WATCH";
          break;
        case 60:
          uint64_t v20 = @"MAP_VIEW_FOREGROUNDED";
          break;
        case 61:
          uint64_t v20 = @"NAV_SESSION_COARSE_LOCATION";
          break;
        case 62:
          uint64_t v20 = @"NAV_SESSION_PRECISE_LOCATION";
          break;
        case 63:
          uint64_t v20 = @"NAV_STARTED_CARPLAY";
          break;
        case 64:
          uint64_t v20 = @"NAV_STARTED_CYCLING";
          break;
        case 65:
          uint64_t v20 = @"NAV_STARTED_DRIVING";
          break;
        case 66:
          uint64_t v20 = @"NAV_STARTED_EBIKE";
          break;
        case 67:
          uint64_t v20 = @"NAV_STARTED_EV_ROUTING";
          break;
        case 68:
          uint64_t v20 = @"NAV_STARTED_JUNCTION_VIEW";
          break;
        case 69:
          uint64_t v20 = @"NAV_STARTED_LANE_GUIDANCE";
          break;
        case 70:
          uint64_t v20 = @"NAV_STARTED_TRANSIT";
          break;
        case 71:
          uint64_t v20 = @"NAV_STARTED_WALKING";
          break;
        case 72:
          uint64_t v20 = @"OPEN_INDOOR_MAP";
          break;
        case 73:
          uint64_t v20 = @"OTHER_GET_DIRECTIONS";
          break;
        case 74:
          uint64_t v20 = @"PLACECARD_GET_DIRECTIONS";
          break;
        case 75:
          uint64_t v20 = @"PLACECARD_RICH_DATA_USED";
          break;
        case 76:
          uint64_t v20 = @"PLACECARD_SHARED";
          break;
        case 77:
          uint64_t v20 = @"PLACECARD_SHOWN";
          break;
        case 78:
          uint64_t v20 = @"PLACECARD_SHOWN_SAFARI";
          break;
        case 79:
          uint64_t v20 = @"PLACECARD_SHOWN_SIRI";
          break;
        case 80:
          uint64_t v20 = @"PLACECARD_SHOWN_SPOTLIGHT";
          break;
        case 81:
          uint64_t v20 = @"PLACECARD_START_NAV";
          break;
        case 82:
          uint64_t v20 = @"PROMINENT_GET_DIRECTIONS";
          break;
        case 83:
          uint64_t v20 = @"RAP_STARTED";
          break;
        case 84:
          uint64_t v20 = @"RIDESHARE_REQUESTED";
          break;
        case 85:
          uint64_t v20 = @"SEARCH_NEARBY_CATEGORY_TAPPED";
          break;
        case 86:
          uint64_t v20 = @"SEARCH_RECENTLY_VIEWED_TAPPED";
          break;
        case 87:
          uint64_t v20 = @"SEARCH_RECENT_SEARCHES_TAPPED";
          break;
        case 88:
          uint64_t v20 = @"SEARCH_RESULTS_SHOWN_MAPS";
          break;
        case 89:
          uint64_t v20 = @"SEARCH_RESULTS_SHOWN_SAFARI";
          break;
        case 90:
          uint64_t v20 = @"SEARCH_RESULTS_SHOWN_SIRI";
          break;
        case 91:
          uint64_t v20 = @"SEARCH_RESULTS_SHOWN_SPOTLIGHT";
          break;
        case 92:
          uint64_t v20 = @"SEARCH_RESULTS_TAPPED_SAFARI";
          break;
        case 93:
          uint64_t v20 = @"SEARCH_RESULTS_TAPPED_SIRI";
          break;
        case 94:
          uint64_t v20 = @"SEARCH_RESULTS_TAPPED_SPOTLIGHT";
          break;
        case 95:
          uint64_t v20 = @"SEARCH_RESULT_TAPPED_MAPS";
          break;
        case 96:
          uint64_t v20 = @"SEARCH_SUGGESTION_TAPPED";
          break;
        case 97:
          uint64_t v20 = @"SHARE_DRIVING_ROUTES";
          break;
        case 98:
          uint64_t v20 = @"SHARE_FAVORITES";
          break;
        case 99:
          uint64_t v20 = @"SHARE_MYLOCATION";
          break;
        case 100:
          uint64_t v20 = @"SHARE_TO_DEVICE";
          break;
        case 101:
          uint64_t v20 = @"SHARE_TRANSIT_ROUTES";
          break;
        case 102:
          uint64_t v20 = @"SHARE_WALKING_ROUTES";
          break;
        case 103:
          uint64_t v20 = @"SHOW_MAPS_SETTINGS";
          break;
        case 104:
          uint64_t v20 = @"SIRI_START_NAV";
          break;
        case 105:
          uint64_t v20 = @"SNAPSHOTTER_USED";
          break;
        case 106:
          uint64_t v20 = @"TAP_COMPASS_MODE";
          break;
        case 107:
          uint64_t v20 = @"UGC_PHOTO_SUBMISSION";
          break;
        case 108:
          uint64_t v20 = @"UGC_RATING_SUBMISSION";
          break;
        case 109:
          uint64_t v20 = @"VLF_CORRECTION_ATTEMPTED";
          break;
        case 110:
          uint64_t v20 = @"VLF_CORRECTION_FAILED";
          break;
        case 111:
          uint64_t v20 = @"VLF_CORRECTION_SUCCESS";
          break;
        case 112:
          uint64_t v20 = @"WIDGET_ENTER";
          break;
        case 113:
          uint64_t v20 = @"JUNCTION_VIEW_SHOWN";
          break;
        case 114:
          uint64_t v20 = @"ETA_SHARED_DRIVING";
          break;
        case 115:
          uint64_t v20 = @"ETA_SHARED_WALKING";
          break;
        case 116:
          uint64_t v20 = @"ETA_SHARED_CYCLING";
          break;
        case 117:
          uint64_t v20 = @"MAPS_HANDOFF";
          break;
        case 118:
          uint64_t v20 = @"AR_WALKING_LOCALIZATION_ATTEMPTED";
          break;
        case 119:
          uint64_t v20 = @"AR_WALKING_LOCALIZATION_FAILED";
          break;
        case 120:
          uint64_t v20 = @"AR_WALKING_LOCALIZATION_SUCCESS";
          break;
        case 121:
          uint64_t v20 = @"CURATED_COLLECTIONS_HOME_SHOWN";
          break;
        case 122:
          uint64_t v20 = @"CURATED_COLLECTIONS_HOME_CONDENSED_SHOWN";
          break;
        case 123:
          uint64_t v20 = @"NEARBY_TRANSIT_SHOWN";
          break;
        case 124:
          uint64_t v20 = @"NEARBY_TRANSIT_TAPPED";
          break;
        case 125:
          uint64_t v20 = @"SPR_GLOBE_EXPLORED";
          break;
        case 126:
          uint64_t v20 = @"SPR_METROS_EXPLORED";
          break;
        case 127:
          uint64_t v20 = @"TRANSIT_DETAILS_USED";
          break;
        case 128:
          uint64_t v20 = @"USER_ACCOUNT_OPENED_ACCOUNT";
          break;
        case 129:
          uint64_t v20 = @"USER_ACCOUNT_SHOWN";
          break;
        case 130:
          uint64_t v20 = @"MAP_MODE_DRIVING_SELECTED";
          break;
        case 131:
          uint64_t v20 = @"MAP_MODE_EXPLORE_SELECTED";
          break;
        case 132:
          uint64_t v20 = @"MAP_MODE_TRANSIT_SELECTED";
          break;
        case 133:
          uint64_t v20 = @"MAP_MODE_SATELLITE_SELECTED";
          break;
        case 134:
          uint64_t v20 = @"MAP_MODE_DRIVING_USED";
          break;
        case 135:
          uint64_t v20 = @"MAP_MODE_EXPLORE_USED";
          break;
        case 136:
          uint64_t v20 = @"MAP_MODE_TRANSIT_USED";
          break;
        case 137:
          uint64_t v20 = @"MAP_MODE_SATELLITE_USED";
          break;
        case 138:
          uint64_t v20 = @"WATCH_GET_DIRECTIONS_CYCLING";
          break;
        case 139:
          uint64_t v20 = @"WATCH_START_NAV_CYCLING";
          break;
        case 140:
          uint64_t v20 = @"WATCH_GET_DIRECTIONS_WALKING";
          break;
        case 141:
          uint64_t v20 = @"WATCH_START_NAV_WALKING";
          break;
        case 142:
          uint64_t v20 = @"WATCH_GET_DIRECTIONS_TRANSIT";
          break;
        case 143:
          uint64_t v20 = @"WATCH_START_NAV_TRANSIT";
          break;
        case 144:
          uint64_t v20 = @"WATCH_GET_DIRECTIONS_DRIVING";
          break;
        case 145:
          uint64_t v20 = @"WATCH_START_NAV_DRIVING";
          break;
        case 146:
          uint64_t v20 = @"ETA_SHARED_TRANSIT";
          break;
        case 147:
          uint64_t v20 = @"USER_ACCOUNT_OPENED";
          break;
        case 148:
          uint64_t v20 = @"VENUE_INTERACTION";
          break;
        case 149:
          uint64_t v20 = @"ENTER_MAPS";
          break;
        case 150:
          uint64_t v20 = @"EXIT_MAPS";
          break;
        case 151:
          uint64_t v20 = @"TOTAL_SECONDS_IN_MAPS_DEVICE";
          break;
        case 152:
          uint64_t v20 = @"ENTER_MAPS_DEVICE";
          break;
        case 153:
          uint64_t v20 = @"MAP_VIEW_INSTANTIATED";
          break;
        case 154:
          uint64_t v20 = @"MAP_VIEW_ACTIVATED";
          break;
        case 155:
          uint64_t v20 = @"DIRECTIONS_PLACECARD_REVEAL_CARPLAY_UI";
          break;
        case 156:
          uint64_t v20 = @"DIRECTIONS_LIST_ITEM_CARPLAY_UI";
          break;
        case 157:
          uint64_t v20 = @"DIRECTIONS_FAVORITE_CARPLAY_UI";
          break;
        case 158:
          uint64_t v20 = @"GET_DIRECTIONS_CARPLAY_CONNECTED";
          break;
        case 159:
          uint64_t v20 = @"DIRECTIONS_REQUESTED_DRIVING_CARPLAY_CONNECTED";
          break;
        case 160:
          uint64_t v20 = @"SIRI_SEARCH_CARPLAY_UI";
          break;
        case 161:
          uint64_t v20 = @"OPEN_KEYBOARD_CARPLAY_UI";
          break;
        case 162:
          uint64_t v20 = @"TAP_SEARCH_CARPLAY_UI";
          break;
        case 163:
          uint64_t v20 = @"OPEN_SEARCH_CARPLAY_UI";
          break;
        case 164:
          uint64_t v20 = @"MAPS_SEARCH_CARPLAY_CONNECTED";
          break;
        case 165:
          uint64_t v20 = @"EXIT_MAPS_CARPLAY";
          break;
        case 166:
          uint64_t v20 = @"TOTAL_SECONDS_IN_MAPS_CARPLAY";
          break;
        case 167:
          uint64_t v20 = @"NAV_FEEDBACK_DRIVING";
          break;
        case 168:
          uint64_t v20 = @"TRIP_COMPLETED_DRIVING";
          break;
        case 169:
          uint64_t v20 = @"HAS_REROUTE_DRIVING";
          break;
        case 170:
          uint64_t v20 = @"ETA_OVERESTIMATE_DRIVING";
          break;
        case 171:
          uint64_t v20 = @"EXTREME_ETA_OVERESTIMATE_DRIVING";
          break;
        case 172:
          uint64_t v20 = @"ETA_UNDERESTIMATE_DRIVING";
          break;
        case 173:
          uint64_t v20 = @"EXTREME_ETA_UNDERESTIMATE_DRIVING";
          break;
        case 174:
          uint64_t v20 = @"RAP_GOOD_TRIP";
          break;
        case 175:
          uint64_t v20 = @"ENRICHED_RESULTS_SHOWN_MAPS";
          break;
        case 176:
          uint64_t v20 = @"TAP_TRANSIT_TIPKIT";
          break;
        case 177:
          uint64_t v20 = @"ADD_STOP_CARPLAY";
          break;
        case 178:
          uint64_t v20 = @"ADD_STOP_CARPLAY_SIRI";
          break;
        case 179:
          uint64_t v20 = @"ADD_STOP_DEVICE";
          break;
        case 180:
          uint64_t v20 = @"ADD_STOP_DEVICE_SIRI";
          break;
        case 181:
          uint64_t v20 = @"SHOWCASE_SHOWN";
          break;
        case 182:
          uint64_t v20 = @"SHOWCASE_TAPPED";
          break;
        case 183:
          uint64_t v20 = @"PUNCH_IN_SIRI";
          break;
        case 184:
          uint64_t v20 = @"PUNCH_IN_SAFARI";
          break;
        case 185:
          uint64_t v20 = @"PUNCH_IN_SPOTLIGHT";
          break;
        case 186:
          uint64_t v20 = @"PUNCH_IN_SMS";
          break;
        case 187:
          uint64_t v20 = @"PUNCH_IN_FINDMY";
          break;
        case 188:
          uint64_t v20 = @"PUNCH_IN_OTHER_2ND_PARTY";
          break;
        case 189:
          uint64_t v20 = @"PUNCH_IN_3RD_PARTY";
          break;
        case 191:
          uint64_t v20 = @"RAP_SUBMITTED";
          break;
        case 192:
          uint64_t v20 = @"ARP_PHOTO_SUBMISSION";
          break;
        case 193:
          uint64_t v20 = @"ARP_RATING_SUBMISSION";
          break;
        case 194:
          uint64_t v20 = @"TRAFFIC_INCIDENT_REPORT";
          break;
        case 195:
          uint64_t v20 = @"TRAFFIC_INCIDENT_CONFIRM";
          break;
        case 196:
          uint64_t v20 = @"TRAFFIC_INCIDENT_DISMISS";
          break;
        case 197:
          uint64_t v20 = @"TRAFFIC_INCIDENT_CLEAR";
          break;
        case 198:
          uint64_t v20 = @"MODERN_MAP_EXPLORED";
          break;
        case 199:
          uint64_t v20 = @"CARPLAY_ROUTING_UI_USED";
          break;
        case 200:
          uint64_t v20 = @"CARPLAY_SEARCH_UI_USED";
          break;
        case 201:
          uint64_t v20 = @"ANNOUNCEMENT_DISPLAYED";
          break;
        case 202:
          uint64_t v20 = @"ANNOUNCEMENT_TAPPED";
          break;
        case 203:
          uint64_t v20 = @"POSITIVE_SEARCH_ENGAGEMENT";
          break;
        case 204:
          uint64_t v20 = @"PUNCH_OUT_FINDMY";
          break;
        case 205:
          uint64_t v20 = @"WATCH_START_NAV";
          break;
        case 206:
          uint64_t v20 = @"HIKING_ENGAGEMENT";
          break;
        case 207:
          uint64_t v20 = @"HIKING_PLACECARD";
          break;
        case 208:
          uint64_t v20 = @"NO_SEARCH_RESULTS";
          break;
        case 209:
          uint64_t v20 = @"PUNCH_IN_SHOWCASE";
          break;
        case 210:
          uint64_t v20 = @"SHARED_LOCATION_ENGAGEMENT";
          break;
        case 211:
          uint64_t v20 = @"SHARE_SHOWCASE";
          break;
        case 212:
          uint64_t v20 = @"WATCH_MAP_VIEW";
          break;
        case 213:
          uint64_t v20 = @"WATCH_PLACECARD";
          break;
        case 214:
          uint64_t v20 = @"WATCH_SEARCH";
          break;
        case 215:
          uint64_t v20 = @"CURATED_HIKE_SAVED";
          break;
        case 216:
          uint64_t v20 = @"CUSTOM_HIKE_SAVED";
          break;
        case 217:
          uint64_t v20 = @"CUSTOM_HIKE_CREATION_TRAY_SHOWN";
          break;
        case 218:
          uint64_t v20 = @"DIRECTIONS_REQUESTED_CURATED_HIKE";
          break;
        case 219:
          uint64_t v20 = @"DIRECTIONS_REQUESTED_CUSTOM_HIKE";
          break;
        case 220:
          uint64_t v20 = @"NAV_STARTED_CURATED_HIKE";
          break;
        case 221:
          uint64_t v20 = @"NAV_STARTED_CUSTOM_HIKE";
          break;
        case 222:
          uint64_t v20 = @"ROUTING_TRAY_CURATED_HIKE_SHOWN";
          break;
        case 223:
          uint64_t v20 = @"ROUTING_TRAY_CUSTOM_HIKE_SHOWN";
          break;
        case 224:
          uint64_t v20 = @"SEARCH_PHOTO_INTERACTION";
          break;
        case 225:
          uint64_t v20 = @"COMPLETE_DOWNLOAD_OFFLINE_MAPS";
          break;
        case 226:
          uint64_t v20 = @"LIBRARY_INTERACTION";
          break;
        case 227:
          uint64_t v20 = @"SEARCH_FILTER_INTERACTION";
          break;
        case 228:
          uint64_t v20 = @"AUTOCOMPLETE_RESULTS_SHOWN_OFFLINE";
          break;
        case 229:
          uint64_t v20 = @"CARPLAY_CONNECTED_OFFLINE";
          break;
        case 230:
          uint64_t v20 = @"CATEGORY_SEARCH_MARKET_ONLY_OFFLINE";
          break;
        case 231:
          uint64_t v20 = @"DIRECTIONS_OFFLINE";
          break;
        case 232:
          uint64_t v20 = @"ENTER_MAPS_DEVICE_OFFLINE";
          break;
        case 233:
          uint64_t v20 = @"NO_SEARCH_RESULTS_OFFLINE";
          break;
        case 234:
          uint64_t v20 = @"SEARCH_NEARBY_CATEGORY_TAPPED_OFFLINE";
          break;
        case 235:
          uint64_t v20 = @"SEARCH_RESULTS_SHOWN_MAPS_OFFLINE";
          break;
        case 236:
          uint64_t v20 = @"SEARCH_RESULT_TAPPED_MAPS_OFFLINE";
          break;
        case 237:
          uint64_t v20 = @"TAP_DOWNLOAD_MAPS_OFFLINE";
          break;
        default:
          uint64_t v20 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"(unknown: %i)",  a2));
          break;
      }

      *(_DWORD *)buf = 138412290;
      id v31 = v20;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEBUG, "storing Monthly Usage action '%@'", buf, 0xCu);
    }

    id v21 = (void *)objc_claimAutoreleasedReturnValue(+[GEOReferenceTimeManager sharedManager](&OBJC_CLASS___GEOReferenceTimeManager, "sharedManager"));
    __int128 v22 = (void *)objc_claimAutoreleasedReturnValue([v21 bestReferenceDate]);

    id v23 = -[GEOAPDailyCountsQueueElem initWithType:usageString:usageBool:appId:createTime:]( objc_alloc(&OBJC_CLASS___GEOAPMonthlyCountsQueueElem),  "initWithType:usageString:usageBool:appId:createTime:",  a2,  v13,  v14,  v15,  v22);
    [(id)a1 _storeQueueElem:v23 completionQueue:v17 completionBlock:v16];

    if (*(_BYTE *)(a1 + 57))
    {
      uint64_t v24 = *(void *)(a1 + 72);
      v25[0] = _NSConcreteStackBlock;
      v25[1] = 3221225472LL;
      v25[2] = sub_100019278;
      v25[3] = &unk_100029580;
      v25[4] = a1;
      int v29 = a2;
      id v26 = v13;
      id v27 = v14;
      id v28 = v15;
      geo_isolate_sync(v24, v25);
    }
  }
}

void sub_100019278(uint64_t a1)
{
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  id v2 = *(id *)(*(void *)(a1 + 32) + 64LL);
  id v3 = [v2 countByEnumeratingWithState:&v10 objects:v16 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v11;
    do
    {
      for (i = 0LL; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void **)(*((void *)&v10 + 1) + 8LL * (void)i);
        id v8 = sub_100016B84();
        id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 134217984;
          id v15 = v7;
          _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "notifying observer %p", buf, 0xCu);
        }

        [v7 monthlyUsageActionType:*(unsigned int *)(a1 + 64) usageString:*(void *)(a1 + 40) usageBool:*(void *)(a1 + 48) appId:*(void *)(a1 + 56)];
      }

      id v4 = [v2 countByEnumeratingWithState:&v10 objects:v16 count:16];
    }

    while (v4);
  }
}

void sub_1000193E8(void *a1, void *a2, void *a3, void *a4)
{
  if (a1)
  {
    id v7 = a4;
    id v8 = a3;
    id v9 = a2;
    id v10 = sub_100016B84();
    __int128 v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)id v15 = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "storing Daily Settings", v15, 2u);
    }

    __int128 v12 = (void *)objc_claimAutoreleasedReturnValue(+[GEOReferenceTimeManager sharedManager](&OBJC_CLASS___GEOReferenceTimeManager, "sharedManager"));
    __int128 v13 = (void *)objc_claimAutoreleasedReturnValue([v12 bestReferenceDate]);

    id v14 = -[GEOAPDailySettingsQueueElem initWithSettings:createTime:]( objc_alloc(&OBJC_CLASS___GEOAPDailySettingsQueueElem),  "initWithSettings:createTime:",  v9,  v13);
    [a1 _storeQueueElem:v14 completionQueue:v8 completionBlock:v7];
  }

void sub_100019650(uint64_t a1)
{
  if ([*(id *)(*(void *)(a1 + 32) + 8) count] == *(id *)(*(void *)(a1 + 32) + 16))
  {
    id v2 = sub_100016B84();
    id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)uint64_t v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "reached batch capacity; will spool now", v5, 2u);
    }

    id v4 = [*(id *)(a1 + 32) _copyAndEmptyBatchQueue];
    [*(id *)(a1 + 32) _spoolElementsToDBFromQueue:v4];
  }

void sub_100019874(uint64_t a1)
{
  id v2 = sub_100016B84();
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v4 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 134217984;
    uint64_t v11 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEBUG,  "persisting one message with batchID %llu for expedited upload",  buf,  0xCu);
  }

  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[GEOAPPersistence sharedInstance](&OBJC_CLASS___GEOAPPersistence, "sharedInstance"));
  uint64_t v9 = *(void *)(a1 + 32);
  int v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v9, 1LL));
  [v5 storeLogMsgElems:v6];

  id v7 = sub_10000CD98();
  id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  sub_10000DD58((uint64_t)v8, *(void *)(a1 + 40));
}

void sub_100019A08(uint64_t a1)
{
  id v2 = sub_100016B84();
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    id v4 = [*(id *)(a1 + 32) count];
    int v6 = 134217984;
    id v7 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "will persist %lu analytics", (uint8_t *)&v6, 0xCu);
  }

  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[GEOAPPersistence sharedInstance](&OBJC_CLASS___GEOAPPersistence, "sharedInstance"));
  [v5 storeLogMsgElems:*(void *)(a1 + 32)];
}

void sub_100019CA4(uint64_t a1, void *a2)
{
  id v26 = a2;
  id v3 = [[GEORequestResponseMetadata alloc] initWithData:v26];
  id v4 = objc_alloc(&OBJC_CLASS___NSDate);
  [v3 collectionTime];
  double v25 = -[NSDate initWithTimeIntervalSinceReferenceDate:](v4, "initWithTimeIntervalSinceReferenceDate:");
  uint64_t v5 = -[NSDate dateByAddingTimeInterval:](v25, "dateByAddingTimeInterval:", sub_10001748C());
  uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue(v5);
  id v6 = objc_alloc_init(&OBJC_CLASS___GEOLogMsgEvent);
  [v6 setEventType:63];
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v3 eventMetadata]);
  [v6 setServiceMetadata:v7];

  id v8 = objc_alloc_init(&OBJC_CLASS___GEOLogMsgState);
  [v8 setStateType:601];
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v3 stateUserSession]);
  [v8 setUserSession:v9];

  [v6 addLogMsgState:v8];
  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[GEOAPStateFactory sharedFactory](&OBJC_CLASS___GEOAPStateFactory, "sharedFactory"));
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  id v11 = [&off_10002C8A8 countByEnumeratingWithState:&v27 objects:v32 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v28;
    do
    {
      id v14 = 0LL;
      id v15 = v8;
      do
      {
        if (*(void *)v28 != v13) {
          objc_enumerationMutation(&off_10002C8A8);
        }
        id v8 = (id)objc_claimAutoreleasedReturnValue( objc_msgSend( v10,  "stateForType:",  objc_msgSend(*(id *)(*((void *)&v27 + 1) + 8 * (void)v14), "integerValue")));

        [v6 addLogMsgState:v8];
        id v14 = (char *)v14 + 1;
        id v15 = v8;
      }

      while (v12 != v14);
      id v12 = [&off_10002C8A8 countByEnumeratingWithState:&v27 objects:v32 count:16];
    }

    while (v12);
  }

  id v16 = objc_alloc_init(&OBJC_CLASS___GEOLogMsgState);

  [v16 setStateType:713];
  id v17 = (void *)objc_claimAutoreleasedReturnValue([v3 stateOffline]);
  [v16 setOffline:v17];

  [v6 addLogMsgState:v16];
  +[GEOAPPortal populateCommonEventValues:](&OBJC_CLASS___GEOAPPortal, "populateCommonEventValues:", v6);
  id v18 = objc_alloc_init(&OBJC_CLASS___GEOLogMessage);
  [v18 setLogMessageType:GEOBatchLogMessageType(*(void *)(a1 + 32))];
  [v18 addLogMsgEvent:v6];
  int v19 = objc_alloc(&OBJC_CLASS___GEOAPLogMsgQueueElem);
  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v18 data]);
  id v21 = -[GEOAPLogMsgQueueElem initWithLogMsg:uploadBatchId:expireTime:createTime:]( v19,  "initWithLogMsg:uploadBatchId:expireTime:createTime:",  v20,  *(void *)(a1 + 32),  v24,  v25);

  __int128 v22 = (void *)objc_claimAutoreleasedReturnValue(+[GEOAPPersistence sharedInstance](&OBJC_CLASS___GEOAPPersistence, "sharedInstance"));
  id v31 = v21;
  id v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v31, 1LL));
  [v22 storeLogMsgElems:v23];
}

void sub_10001A000(uint64_t a1)
{
  if (a1)
  {
    os_log_t v1 = *(dispatch_queue_s **)(a1 + 48);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10001A05C;
    block[3] = &unk_1000288C0;
    block[4] = a1;
    dispatch_sync(v1, block);
  }

id sub_10001A05C(uint64_t a1)
{
  return [*(id *)(a1 + 32) _flushRemainderToDB];
}

void sub_10001A0C4(id a1)
{
  os_log_t v1 = os_log_create("com.apple.GeoAnalytics", "Storage");
  id v2 = (void *)qword_100033E78;
  qword_100033E78 = (uint64_t)v1;
}

void start()
{
  uint64_t v0 = objc_autoreleasePoolPush();
  +[GEOPlatform setIsRunningInGeoAPd:](&OBJC_CLASS___GEOPlatform, "setIsRunningInGeoAPd:", 1LL);
  +[GEOAPServiceManager useProxyClass:]( &OBJC_CLASS___GEOAPServiceManager,  "useProxyClass:",  objc_opt_class(&OBJC_CLASS___GEOAPServiceLocal));
  id v1 = +[GEOReferenceTimeManager sharedManager](&OBJC_CLASS___GEOReferenceTimeManager, "sharedManager");
  id v2 = (void *)objc_claimAutoreleasedReturnValue(+[GEOAPUtils GEOAPCachePath](&OBJC_CLASS___GEOAPUtils, "GEOAPCachePath"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  unsigned __int8 v4 = [v3 fileExistsAtPath:v2 isDirectory:0];

  if ((v4 & 1) != 0)
  {
    id v7 = 0LL;
  }

  else
  {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    id v22 = 0LL;
    unsigned __int8 v6 = [v5 createDirectoryAtPath:v2 withIntermediateDirectories:1 attributes:0 error:&v22];
    id v7 = v22;

    if ((v6 & 1) == 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      int v20 = 138412290;
      id v21 = v7;
      _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "directory create error : (%@)",  (uint8_t *)&v20,  0xCu);
    }
  }

  id v8 = sub_10000CD98();
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  id v10 = (const char *)kNSURLSessionLaunchOnDemandNotificationName;
  uint64_t v11 = sub_100010B14((uint64_t)v9);
  id v12 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v11);
  xpc_set_event_stream_handler(v10, v12, &stru_1000296A0);

  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( +[GEOCountryConfiguration sharedConfiguration]( &OBJC_CLASS___GEOCountryConfiguration,  "sharedConfiguration"));
  id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 countryCode]);
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(17LL, 0LL);
  id v16 = (void *)objc_claimAutoreleasedReturnValue(global_queue);
  +[GEOMetroRegionAssetProvider preloadAssetForCountryCode:preloadQueue:completion:]( &OBJC_CLASS___GEOMetroRegionAssetProvider,  "preloadAssetForCountryCode:preloadQueue:completion:",  v14,  v16,  &stru_1000296E0);

  id v17 = sub_10000B9B4();
  uint64_t v18 = objc_claimAutoreleasedReturnValue(v17);
  int v19 = (void *)qword_100033E88;
  qword_100033E88 = v18;

  sub_10000BE94((id *)qword_100033E88);
  objc_autoreleasePoolPop(v0);
  dispatch_main();
}

void sub_10001A318(id a1, BOOL a2)
{
  BOOL v2 = a2;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    v3[0] = 67109120;
    v3[1] = v2;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "preloading metro region assets completed (%d)",  (uint8_t *)v3,  8u);
  }

uint64_t sub_10001A3B4()
{
  uint64_t v0 = abort_report_np("Unable to find class %s", "BGSystemTaskScheduler");
  return sub_10001A3D8(v0);
}

uint64_t sub_10001A3D8()
{
  uint64_t v0 = abort_report_np("Unable to find class %s", "BGNonRepeatingSystemTaskRequest");
  return sub_10001A3FC(v0);
}

uint64_t sub_10001A3FC()
{
  uint64_t v0 = abort_report_np("Unable to find class %s", "BGRepeatingSystemTaskRequest");
  return sub_10001A420(v0);
}

void sub_10001A420()
{
  *(_WORD *)uint64_t v0 = 0;
  _os_log_fault_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_FAULT,  "Unreachable reached: local proxy bypassed",  v0,  2u);
}

uint64_t sub_10001A464()
{
  uint64_t v0 = dlerror();
  uint64_t v1 = abort_report_np("%s", v0);
  return sub_10001A484(v1);
}

void sub_10001A484(void *a1, uint64_t a2)
{
  id v3 = a1;
  id v4 = sub_10000C130();
  uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v6 = 138412546;
    uint64_t v7 = a2;
    __int16 v8 = 2112;
    id v9 = v3;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_INFO,  "uploadTask '%@' could not resume '%@'",  (uint8_t *)&v6,  0x16u);
  }

  objc_end_catch();
}

void sub_10001A54C()
{
  *(_WORD *)uint64_t v0 = 0;
  _os_log_fault_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_FAULT,  "Assertion failed: components.count == 8",  v0,  2u);
}

void sub_10001A590( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10001A5C4( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10001A5F8( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

id objc_msgSend__startTaskForFile_taskDescription_analyticSessionType_apURLsessionConfigType_ttl_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_startTaskForFile:taskDescription:analyticSessionType:apURLsessionConfigType:ttl:");
}

id objc_msgSend_addInflightUploadWithBatchUUID_createTime_sessionType_eventCount_uploadSize_uploadPolicy_stageNum_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "addInflightUploadWithBatchUUID:createTime:sessionType:eventCount:uploadSize:uploadPolicy:stageNum:");
}

id objc_msgSend_addUploadHistoryForBatchUUID_completionTime_latency_sessionType_eventCount_uploadSize_uploadPolicy_stageNum_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "addUploadHistoryForBatchUUID:completionTime:latency:sessionType:eventCount:uploadSize:uploadPolicy:stageNum:");
}

id objc_msgSend_captureDailyUseSummaryWithUseEvents_summaryPeriod_summaryDate_firstEventDate_user_mapsUseLastDate_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "captureDailyUseSummaryWithUseEvents:summaryPeriod:summaryDate:firstEventDate:user_mapsUseLastDate:");
}

id objc_msgSend_captureNetEventSummaryWithGroups_additionalStates_providedDropRate_completionQueue_completionBlock_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "captureNetEventSummaryWithGroups:additionalStates:providedDropRate:completionQueue:completionBlock:");
}

id objc_msgSend_captureNetworkEventForDataRequestKind_networkService_usedBackgroundURL_requestAppIdentifier_appMajorVersion_appMinorVersion_error_clientMetrics_states_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "captureNetworkEventForDataRequestKind:networkService:usedBackgroundURL:requestAppIdentifier:appMajorVersion:a ppMinorVersion:error:clientMetrics:states:");
}

id objc_msgSend_capturePeriodicSettingsWithMapSettings_mapUiShown_mapsFeatures_mapsUserSettings_routingSettings_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "capturePeriodicSettingsWithMapSettings:mapUiShown:mapsFeatures:mapsUserSettings:routingSettings:");
}

id objc_msgSend_inflightBatchUUID_createTime_analyticSessionType_eventCount_uploadSize_urlSessionType_stageNumber_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "inflightBatchUUID:createTime:analyticSessionType:eventCount:uploadSize:urlSessionType:stageNumber:");
}

id objc_msgSend_initWithQueueName_log_databaseFileURL_sqliteFlags_pragmas_setupBlock_tearDownBlock_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithQueueName:log:databaseFileURL:sqliteFlags:pragmas:setupBlock:tearDownBlock:");
}

id objc_msgSend_uploadHistoryForBatchUUID_endDate_uploadLatency_analyticSessionType_eventCount_uploadSize_urlSessionType_stageNumber_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "uploadHistoryForBatchUUID:endDate:uploadLatency:analyticSessionType:eventCount:uploadSize:urlSessionType:stageNumber:");
}

id objc_msgSend_year(void *a1, const char *a2, ...)
{
  return [a1 year];
}
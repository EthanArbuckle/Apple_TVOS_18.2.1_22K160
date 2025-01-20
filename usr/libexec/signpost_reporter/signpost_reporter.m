void sub_100003010(id a1, WRWorkflowEventTracker *a2)
{
  -[WRWorkflowEventTracker generateTelemetry](a2, "generateTelemetry");
}

void sub_10000309C(id a1, WRWorkflowEventTracker *a2)
{
}

uint64_t sub_100003450(uint64_t a1, uint64_t a2)
{
  return 1LL;
}

uint64_t sub_100003470(uint64_t a1, uint64_t a2)
{
  return 1LL;
}

uint64_t sub_100003490(uint64_t a1, uint64_t a2)
{
  return 1LL;
}

uint64_t sub_1000034B0(uint64_t a1)
{
  return 1LL;
}

double sub_1000034E0()
{
  if (qword_100015AB8 != -1) {
    dispatch_once(&qword_100015AB8, &stru_100010488);
  }
  return *(double *)&qword_100015AB0;
}

void sub_100003520(id a1)
{
  double v1 = 1.0;
  if (info.numer != info.denom) {
    double v1 = (double)info.numer / (double)info.denom;
  }
  qword_100015AB0 = *(void *)&v1;
}

uint64_t sub_100003564(void *a1)
{
  id v1 = a1;
  if ([v1 isEqualToString:@"macOS"])
  {
    uint64_t v2 = 1LL;
  }

  else if ([v1 isEqualToString:@"iPhoneOS"])
  {
    uint64_t v2 = 2LL;
  }

  else if ([v1 isEqualToString:@"watchOS"])
  {
    uint64_t v2 = 3LL;
  }

  else if ([v1 isEqualToString:@"tvOS"])
  {
    uint64_t v2 = 4LL;
  }

  else if ([v1 isEqualToString:@"bridgeOS"])
  {
    uint64_t v2 = 5LL;
  }

  else
  {
    uint64_t v2 = 0LL;
  }

  return v2;
}

CFStringRef sub_100003614(uint64_t a1)
{
  else {
    return *(&off_1000104A8 + a1 - 1);
  }
}

uint64_t sub_10000363C()
{
  return 4LL;
}

uint64_t sub_100003644()
{
  return 1LL;
}

void sub_10000364C(void *a1)
{
  if (a1)
  {
    __int128 v35 = 0u;
    __int128 v36 = 0u;
    __int128 v33 = 0u;
    __int128 v34 = 0u;
    id v1 = (void *)objc_claimAutoreleasedReturnValue([a1 executablePathToStallAggregation]);
    uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([v1 objectEnumerator]);

    id v3 = [v2 countByEnumeratingWithState:&v33 objects:v37 count:16];
    if (!v3) {
      goto LABEL_39;
    }
    id v4 = v3;
    uint64_t v5 = *(void *)v34;
    while (1)
    {
      v6 = 0LL;
      do
      {
        if (*(void *)v34 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(id *)(*((void *)&v33 + 1) + 8LL * (void)v6);
        v8 = (void *)objc_claimAutoreleasedReturnValue([v7 processExecutablePath]);

        if (!v8)
        {
          v12 = 0LL;
LABEL_24:
          id v28 = sub_100003E84();
          v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
            sub_100009C50((uint64_t)v39, (uint64_t)v7);
          }
          v12 = 0LL;
          goto LABEL_30;
        }

        v10 = (void *)objc_claimAutoreleasedReturnValue([v7 processExecutablePath]);
        id v11 = sub_100005024(v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue(v11);

        if ((sub_100005318(v12, v13) & 1) == 0)
        {
          if (!v12) {
            goto LABEL_31;
          }
          id v29 = sub_100003E84();
          v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v41 = v12;
            _os_log_debug_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEBUG,  "Skipping non-internal bundle ID %@.",  buf,  0xCu);
          }

          goto LABEL_30;
        }

        if (!v12) {
          goto LABEL_24;
        }
        v14 = (void *)objc_claimAutoreleasedReturnValue([v7 longCommitStats]);
        if (v14) {
          goto LABEL_19;
        }
        v14 = (void *)objc_claimAutoreleasedReturnValue([v7 longTransactionLifetimeStats]);
        if (v14
          || (v14 = (void *)objc_claimAutoreleasedReturnValue([v7 longTransactionLifetimeStats])) != 0
          || (v14 = (void *)objc_claimAutoreleasedReturnValue([v7 longResponsibleFrameLifetimeStats])) != 0
          || (v14 = (void *)objc_claimAutoreleasedReturnValue([v7 responsibleGlitchStats])) != 0
          || (v14 = (void *)objc_claimAutoreleasedReturnValue([v7 glitchStats])) != 0
          || (v14 = (void *)objc_claimAutoreleasedReturnValue([v7 responsibleFirstFrameGlitchStats])) != 0
          || (v14 = (void *)objc_claimAutoreleasedReturnValue([v7 firstFrameGlitchStats])) != 0
          || (v14 = (void *)objc_claimAutoreleasedReturnValue([v7 responsibleNonFirstFrameNonSkipGlitchStats])) != 0)
        {
LABEL_19:

LABEL_20:
          v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
          -[os_log_s setObject:forKeyedSubscript:](v15, "setObject:forKeyedSubscript:", v12, @"BundleID");
          v16 = (void *)objc_claimAutoreleasedReturnValue([v7 longCommitStats]);
          sub_100003B4C(@"Commit", v16, v15);

          v17 = (void *)objc_claimAutoreleasedReturnValue([v7 longTransactionLifetimeStats]);
          sub_100003B4C(@"TransactionLifetime", v17, v15);

          v18 = (void *)objc_claimAutoreleasedReturnValue([v7 longHIDLatencyStats]);
          sub_100003B4C(@"HIDLatency", v18, v15);

          v19 = (void *)objc_claimAutoreleasedReturnValue([v7 longResponsibleFrameLifetimeStats]);
          sub_100003B4C(@"FrameLifetime", v19, v15);

          v20 = (void *)objc_claimAutoreleasedReturnValue([v7 responsibleGlitchStats]);
          sub_100003B4C(@"GlitchLongPole", v20, v15);

          v21 = (void *)objc_claimAutoreleasedReturnValue([v7 glitchStats]);
          sub_100003B4C(@"GlitchContributor", v21, v15);

          v22 = (void *)objc_claimAutoreleasedReturnValue([v7 responsibleFirstFrameGlitchStats]);
          sub_100003B4C(@"FirstFrameGlitchLongPole", v22, v15);

          v23 = (void *)objc_claimAutoreleasedReturnValue([v7 firstFrameGlitchStats]);
          sub_100003B4C(@"FirstFrameGlitchContributor", v23, v15);

          v24 = (void *)objc_claimAutoreleasedReturnValue([v7 responsibleNonFirstFrameNonSkipGlitchStats]);
          sub_100003B4C(@"NonFirstFrameNonSkipGlitchLongPole", v24, v15);

          v25 = (void *)objc_claimAutoreleasedReturnValue([v7 responsibleNonFirstFrameNonSkipPerceivedGlitchStats]);
          sub_100003B4C(@"NonFirstFrameNonSkipPerceivedGlitchLongPole", v25, v15);

          id v26 = sub_100003E84();
          v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG)) {
            sub_100009CA0((uint64_t)v38, (uint64_t)v15);
          }

          j__AnalyticsSendEvent(@"com.apple.performance.ca_stall_stats", v15);
LABEL_30:

          goto LABEL_31;
        }

        v30 = (void *)objc_claimAutoreleasedReturnValue([v7 responsibleNonFirstFrameNonSkipPerceivedGlitchStats]);

        if (v30) {
          goto LABEL_20;
        }
LABEL_31:

        v6 = (char *)v6 + 1;
      }

      while (v4 != v6);
      id v31 = [v2 countByEnumeratingWithState:&v33 objects:v37 count:16];
      id v4 = v31;
      if (!v31) {
        goto LABEL_39;
      }
    }
  }

  id v32 = sub_100003E84();
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(v32);
  if (os_log_type_enabled((os_log_t)v2, OS_LOG_TYPE_DEBUG)) {
    sub_100009C10((os_log_t)v2);
  }
LABEL_39:
}

void sub_100003B4C(void *a1, void *a2, void *a3)
{
  if (a2)
  {
    id v5 = a3;
    id v6 = a2;
    id v7 = a1;
    id v12 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@Count", v7));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@TotalMs", v7));

    v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( NSNumber,  "numberWithUnsignedLongLong:",  [v6 intervalCount]));
    [v5 setObject:v9 forKeyedSubscript:v12];

    unint64_t v10 = (unint64_t)[v6 totalIntervalDurationNs];
    id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  v10 / 0xF4240));
    [v5 setObject:v11 forKeyedSubscript:v8];
  }
}

void sub_100003C7C(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
}

  ;
}

uint64_t sub_100003C9C(uint64_t a1, uint64_t a2)
{
  return a2;
}

id sub_100003CB0(uint64_t a1)
{
  if (a1 == 2)
  {
    if (qword_100015AD8 != -1) {
      dispatch_once(&qword_100015AD8, &stru_1000104F0);
    }
    id v1 = &qword_100015AD0;
  }

  else
  {
    if (a1 != 1)
    {
      id v2 = 0LL;
      return v2;
    }

    if (qword_100015AC8 != -1) {
      dispatch_once(&qword_100015AC8, &stru_1000104D0);
    }
    id v1 = &qword_100015AC0;
  }

  id v2 = (id)*v1;
  return v2;
}

void sub_100003D44(id a1)
{
  id v1 = objc_alloc(&OBJC_CLASS___SRSubsystemCategoryNameFilter);
  if (qword_100015AE8 != -1) {
    dispatch_once(&qword_100015AE8, &stru_100010510);
  }
  id v4 = (id)qword_100015AE0;
  id v2 = -[SRSubsystemCategoryNameFilter initWithDictionaryArray:](v1, "initWithDictionaryArray:", v4);
  id v3 = (void *)qword_100015AC0;
  qword_100015AC0 = (uint64_t)v2;
}

void sub_100003DCC(id a1)
{
  id v1 = objc_alloc(&OBJC_CLASS___SRSubsystemCategoryNameFilter);
  if (qword_100015AF8 != -1) {
    dispatch_once(&qword_100015AF8, &stru_100010530);
  }
  id v4 = (id)qword_100015AF0;
  id v2 = -[SRSubsystemCategoryNameFilter initWithDictionaryArray:](v1, "initWithDictionaryArray:", v4);
  id v3 = (void *)qword_100015AD0;
  qword_100015AD0 = (uint64_t)v2;
}

void sub_100003E54(id a1)
{
  id v1 = (void *)qword_100015AE0;
  qword_100015AE0 = (uint64_t)&off_100012578;
}

void sub_100003E6C(id a1)
{
  id v1 = (void *)qword_100015AF0;
  qword_100015AF0 = (uint64_t)&off_100012590;
}

id sub_100003E84()
{
  if (qword_100015B00 != -1) {
    dispatch_once(&qword_100015B00, &stru_100010550);
  }
  return (id)qword_100015B08;
}

void sub_100003EC4(id a1)
{
  os_log_t v1 = os_log_create("com.apple.SignpostSupport", "signpost_reporter");
  id v2 = (void *)qword_100015B08;
  qword_100015B08 = (uint64_t)v1;
}

LABEL_13:
LABEL_14:
  self = self;
  v19 = self;
LABEL_25:

  return v19;
}

LABEL_68:
  xpc_transaction_exit_clean();
}

void sub_1000049F4(void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
}

  ;
}

uint64_t sub_100004A08(void *a1, uint64_t a2)
{
  id v3 = a1;
  id v4 = v3;
  if (a2 == 2)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 string1Name]);
    if ([v5 isEqualToString:@"<workflowID>"])
    {
      id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 subsystem]);
      unsigned int v7 = [v6 isEqualToString:@"com.apple.CoreIDV.telemetry"];

      if (v7)
      {
        v8 = (void *)objc_claimAutoreleasedReturnValue([v4 category]);
        unsigned int v9 = [v8 isEqualToString:@"api"];

        if (v9)
        {
          unint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v4 name]);
          if (qword_100015B28 != -1) {
            dispatch_once(&qword_100015B28, &stru_100010590);
          }
          id v11 = (void *)qword_100015B20;
LABEL_25:
          uint64_t v29 = (uint64_t)[v11 containsObject:v10];

          goto LABEL_26;
        }

        v30 = (void *)objc_claimAutoreleasedReturnValue([v4 category]);
        unsigned int v31 = [v30 isEqualToString:@"requests"];

        if (v31)
        {
          unint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v4 name]);
          if (qword_100015B38 != -1) {
            dispatch_once(&qword_100015B38, &stru_1000105B0);
          }
          id v11 = (void *)qword_100015B30;
          goto LABEL_25;
        }

        id v32 = (void *)objc_claimAutoreleasedReturnValue([v4 category]);
        unsigned int v33 = [v32 isEqualToString:@"library"];

        if (v33)
        {
          unint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v4 name]);
          if (qword_100015B48 != -1) {
            dispatch_once(&qword_100015B48, &stru_1000105D0);
          }
          id v11 = (void *)qword_100015B40;
          goto LABEL_25;
        }
      }
    }

    else
    {
    }
  }

  if (sub_100004C50(v4))
  {
    id v12 = sub_100004D8C();
    v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      sub_100009DC0(v13, v14, v15, v16, v17, v18, v19, v20);
    }
  }

  else
  {
    if (!sub_100004E7C(v4))
    {
      uint64_t v29 = 0LL;
      goto LABEL_26;
    }

    id v21 = sub_100004D8C();
    v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      sub_100009DF0(v13, v22, v23, v24, v25, v26, v27, v28);
    }
  }

  uint64_t v29 = 1LL;
LABEL_26:

  return v29;
}

BOOL sub_100004C50(void *a1)
{
  id v1 = a1;
  if (qword_100015B18 != -1) {
    dispatch_once(&qword_100015B18, &stru_100010570);
  }
  id v2 = (void *)objc_claimAutoreleasedReturnValue([v1 string1Name]);
  if ([@"AppVersion" isEqualToString:v2])
  {
    id v3 = (void *)qword_100015B10;
    id v4 = (void *)objc_claimAutoreleasedReturnValue([v1 name]);
    if ([v3 containsObject:v4])
    {
      id v5 = off_1000159A8;
      id v6 = (void *)objc_claimAutoreleasedReturnValue([v1 category]);
      if (-[__CFString isEqualToString:](v5, "isEqualToString:", v6))
      {
        unsigned int v7 = off_1000159B0;
        v8 = (void *)objc_claimAutoreleasedReturnValue([v1 subsystem]);
        else {
          BOOL v9 = 0LL;
        }
      }

      else
      {
        BOOL v9 = 0LL;
      }
    }

    else
    {
      BOOL v9 = 0LL;
    }
  }

  else
  {
    BOOL v9 = 0LL;
  }

  return v9;
}

id sub_100004D8C()
{
  if (qword_100015B50 != -1) {
    dispatch_once(&qword_100015B50, &stru_1000105F0);
  }
  return (id)qword_100015B58;
}

id sub_100004DD0(void *a1)
{
  id v1 = sub_100004E7C(a1);
  if ((_DWORD)v1)
  {
    id v2 = sub_100004D8C();
    id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      sub_100009E20(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }

  return v1;
}

void sub_100004E20(id a1)
{
  uint64_t v1 = objc_claimAutoreleasedReturnValue( +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  off_1000159B8,  off_1000159C0,  off_1000159C8,  off_1000159D0,  0LL));
  id v2 = (void *)qword_100015B10;
  qword_100015B10 = v1;
}

id sub_100004E7C(void *a1)
{
  id v1 = a1;
  id v2 = off_1000159E8;
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v1 name]);
  if (-[__CFString isEqualToString:](v2, "isEqualToString:", v3))
  {
    uint64_t v4 = off_1000159E0;
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v1 category]);
    if (-[__CFString isEqualToString:](v4, "isEqualToString:", v5))
    {
      uint64_t v6 = off_1000159D8;
      uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v1 subsystem]);
      id v8 = -[__CFString isEqualToString:](v6, "isEqualToString:", v7);
    }

    else
    {
      id v8 = 0LL;
    }
  }

  else
  {
    id v8 = 0LL;
  }

  return v8;
}

void sub_100004F44(id a1)
{
  uint64_t v1 = objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", &off_1000125A8));
  id v2 = (void *)qword_100015B20;
  qword_100015B20 = v1;
}

void sub_100004F78(id a1)
{
  uint64_t v1 = objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", &off_1000125C0));
  id v2 = (void *)qword_100015B30;
  qword_100015B30 = v1;
}

void sub_100004FAC(id a1)
{
  uint64_t v1 = objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", &off_1000125D8));
  id v2 = (void *)qword_100015B40;
  qword_100015B40 = v1;
}

void sub_100004FE0(id a1)
{
  os_log_t v1 = os_log_create("com.apple.SignpostSupport", "TelemetryStringAllowlistingExemption");
  id v2 = (void *)qword_100015B58;
  qword_100015B58 = (uint64_t)v1;
}

void sub_100005010( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

id sub_100005024(void *a1)
{
  id v1 = a1;
  id v2 = v1;
  if (qword_100015B68 != -1)
  {
    dispatch_once(&qword_100015B68, &stru_100010610);
    if (v2) {
      goto LABEL_3;
    }
LABEL_26:
    id v5 = 0LL;
    goto LABEL_27;
  }

  if (!v1) {
    goto LABEL_26;
  }
LABEL_3:
  id v3 = (void *)objc_claimAutoreleasedReturnValue([(id)qword_100015B60 objectForKeyedSubscript:v2]);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));

  if (v3 == v4)
  {
    id v5 = 0LL;
  }

  else if (v3)
  {
    id v5 = v3;
  }

  else
  {
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v2 lastPathComponent]);
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@.", v6));

    id v8 = (id)objc_claimAutoreleasedReturnValue([v2 stringByDeletingLastPathComponent]);
    if (v8)
    {
      unint64_t v9 = 0LL;
      while (([v8 isEqualToString:&stru_100011248] & 1) == 0
           && ([v8 isEqualToString:@"/"] & 1) == 0
           && v9 <= 0x63)
      {
        uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v8 lastPathComponent]);
        if ([v10 hasPrefix:v7])
        {
          id v8 = v8;

          v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleWithPath:](&OBJC_CLASS___NSBundle, "bundleWithPath:", v8));
          uint64_t v14 = v13;
          if (!v13) {
            goto LABEL_23;
          }
          uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v13 bundleIdentifier]);

          if (!v15) {
            goto LABEL_23;
          }
          uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v14 bundleIdentifier]);
          [(id)qword_100015B60 setObject:v16 forKeyedSubscript:v2];

          id v5 = (id)objc_claimAutoreleasedReturnValue([v14 bundleIdentifier]);
          id v17 = sub_100003E84();
          uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
            sub_100009E50((uint64_t)v5, (uint64_t)v2, v18);
          }

          if (v5)
          {
            [(id)qword_100015B60 setObject:v5 forKeyedSubscript:v2];
          }

          else
          {
LABEL_23:
            uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
            [(id)qword_100015B60 setObject:v19 forKeyedSubscript:v2];

            id v5 = 0LL;
          }

          goto LABEL_15;
        }

        ++v9;
        uint64_t v11 = objc_claimAutoreleasedReturnValue([v8 stringByDeletingLastPathComponent]);

        id v8 = (id)v11;
        if (!v11) {
          break;
        }
      }
    }

    id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
    [(id)qword_100015B60 setObject:v12 forKeyedSubscript:v2];

    id v5 = 0LL;
LABEL_15:
  }

LABEL_27:
  return v5;
}

void sub_1000052EC(id a1)
{
  uint64_t v1 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  id v2 = (void *)qword_100015B60;
  qword_100015B60 = v1;
}

void *sub_100005318(void *a1, const char *a2)
{
  if (a1) {
    return [a1 hasPrefix:@"com.apple."];
  }
  return a1;
}

uint64_t sub_1000057D8(void *a1)
{
  id v1 = a1;
  id v2 = (void *)objc_claimAutoreleasedReturnValue([v1 attributes]);
  uint64_t v3 = objc_claimAutoreleasedReturnValue([v2 objectForKeyedSubscript:@"BundleIdOverride"]);

  if (v3)
  {
    id v4 = v1;
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 subsystem]);
    unsigned int v6 = [v5 isEqualToString:@"com.apple.runningboard"];

    if (v6
      && (uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v4 category]),
          unsigned int v8 = [v7 isEqualToString:@"sp_telemetry"],
          v7,
          v8))
    {
      if (qword_100015B98 != -1) {
        dispatch_once(&qword_100015B98, &stru_100010690);
      }
      uint64_t v9 = qword_100015B90;
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v4 name]);
      LOBYTE(v9) = [(id)v9 containsObject:v10];

      if ((v9 & 1) != 0) {
        goto LABEL_10;
      }
    }

    else
    {
    }

    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v4 subsystem]);
    unsigned __int8 v12 = [v11 isEqualToString:@"com.apple.spindump"];

    if ((v12 & 1) != 0)
    {
LABEL_10:
      uint64_t v3 = 1LL;
      goto LABEL_25;
    }

    v13 = (void *)objc_claimAutoreleasedReturnValue([v4 subsystem]);
    if ([v13 isEqualToString:@"com.apple.SplashBoard"])
    {
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v4 category]);
      if ([v14 isEqualToString:@"Memory"])
      {
        uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v4 name]);
        unsigned __int8 v16 = [v15 isEqualToString:@"OverMemoryLimit"];

        if ((v16 & 1) != 0) {
          goto LABEL_10;
        }
LABEL_17:
        id v17 = v4;
        uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v17 name]);
        if ([v18 isEqualToString:@"HangInterval"])
        {
          uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v17 subsystem]);
          unsigned int v20 = [v19 isEqualToString:@"com.apple.hangtracer"];

          if (v20)
          {
            id v21 = (void *)objc_claimAutoreleasedReturnValue([v17 category]);
            unsigned __int8 v22 = [v21 isEqualToString:@"signpost_hang"];

            if ((v22 & 1) != 0
              || (uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([v17 category]),
                  unsigned __int8 v24 = [v23 isEqualToString:@"always_on_hang"],
                  v23,
                  (v24 & 1) != 0))
            {
              uint64_t v3 = 1LL;
LABEL_24:

              goto LABEL_25;
            }
          }
        }

        else
        {
        }

        uint64_t v3 = 0LL;
        goto LABEL_24;
      }
    }

    goto LABEL_17;
  }

LABEL_25:
  return v3;
}

void start()
{
  v0 = objc_autoreleasePoolPush();
  dispatch_queue_t v1 = dispatch_queue_create("signpost_reporter processing queue", 0LL);
  id v2 = (void *)qword_100015B70;
  qword_100015B70 = (uint64_t)v1;

  dispatch_queue_t v3 = dispatch_queue_create("signpost_reporter CoreAnalytics reporting queue", 0LL);
  id v4 = (void *)qword_100015B78;
  qword_100015B78 = (uint64_t)v3;

  dispatch_source_t v5 = dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_signal,  2uLL,  0LL,  (dispatch_queue_t)qword_100015B70);
  unsigned int v6 = (void *)qword_100015B80;
  qword_100015B80 = (uint64_t)v5;

  dispatch_source_set_event_handler((dispatch_source_t)qword_100015B80, &stru_100010630);
  xpc_activity_register("com.apple.signpost.signpost_reporter_activity", XPC_ACTIVITY_CHECK_IN, &stru_100010670);
  dispatch_resume((dispatch_object_t)qword_100015B80);
  dispatch_main();
}

void sub_100005FC8(id a1)
{
}

void sub_100005FD8(id a1, OS_xpc_object *a2)
{
  id v2 = a2;
  dispatch_queue_t v3 = (void *)os_transaction_create("com.apple.signpost.signpost_reporter_activity transaction");
  xpc_activity_state_t state = xpc_activity_get_state(v2);
  if (state == 2)
  {
    if (xpc_activity_should_defer(v2) && xpc_activity_set_state(v2, 3LL))
    {
      id v8 = sub_100003E84();
      uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf.f_bsize) = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Deferred signpost_reporter\n",  (uint8_t *)&buf,  2u);
      }

      goto LABEL_13;
    }

    uint64_t v10 = v2;
    if (os_variant_has_internal_diagnostics("com.apple.signpost"))
    {
      id v11 = sub_100003E84();
      unsigned __int8 v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf.f_bsize) = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Reporting based on os_variant result",  (uint8_t *)&buf,  2u);
      }

      BOOL v13 = 1;
    }

    else
    {
      dispatch_queue_t v14 = dispatch_queue_create("signpost_reporter configuration observing queue", 0LL);
      dispatch_semaphore_t v15 = dispatch_semaphore_create(0LL);
      v108 = 0LL;
      uint64_t v109 = (uint64_t)&v108;
      uint64_t v110 = 0x2020000000LL;
      LOBYTE(v111) = 0;
      id v16 = objc_alloc_init(&OBJC_CLASS___AnalyticsConfigurationObserver);
      id v17 = objc_alloc(&OBJC_CLASS___SignpostReporterConfigObserverDelegate);
      *(void *)&buf.f_bsize = _NSConcreteStackBlock;
      buf.f_blocks = 3221225472LL;
      buf.f_bfree = (uint64_t)sub_100008754;
      buf.f_bavail = (uint64_t)&unk_100010820;
      buf.f_ffree = (uint64_t)&v108;
      uint64_t v18 = v15;
      buf.f_files = (uint64_t)v18;
      uint64_t v19 = -[SignpostReporterConfigObserverDelegate initWithCallbackBlock:](v17, "initWithCallbackBlock:", &buf);
      [v16 setConfigurationObserverDelegate:v19 queue:v14];
      [v16 startObservingConfigurationType:@"com.apple.performance.signpost_reporter_tasking"];
      dispatch_time_t v20 = dispatch_time(0LL, 5000000000LL);
      if (dispatch_semaphore_wait(v18, v20))
      {
        id v21 = sub_100003E84();
        unsigned __int8 v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v100 = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "Not reporting based on not being tasked-on by CoreAnalytics (Timeout waiting for config)",  v100,  2u);
        }

        BOOL v13 = 0;
      }

      else
      {
        BOOL v13 = *(_BYTE *)(v109 + 24) != 0;
      }

      _Block_object_dispose(&v108, 8);
    }

    byte_100015BA0 = v13;
    id v23 = sub_100003E84();
    unsigned __int8 v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      buf.f_bsize = 138412802;
      if (byte_100015BA0) {
        uint64_t v25 = @"Enabled";
      }
      else {
        uint64_t v25 = @"Disabled";
      }
      *(void *)&buf.f_iosize = v25;
      WORD2(buf.f_blocks) = 2112;
      *(uint64_t *)((char *)&buf.f_blocks + 6) = (uint64_t)@"Disabled";
      HIWORD(buf.f_bfree) = 2112;
      buf.f_bavail = (uint64_t)@"Disabled";
      _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "os_signpost CA Telemetry: %@, aggregation CA telemetry: %@, CAMetalLayer CA telemetry: %@",  (uint8_t *)&buf,  0x20u);
    }

    if (!byte_100015BA0)
    {
      id v28 = sub_100003E84();
      uint64_t v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf.f_bsize) = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_DEFAULT,  "Bailing since we have no work to do.",  (uint8_t *)&buf,  2u);
      }

      goto LABEL_38;
    }

    if (sub_100006D54())
    {
      id v26 = sub_100003E84();
      uint64_t v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf.f_bsize) = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_DEFAULT,  "Bailing due to cookie file",  (uint8_t *)&buf,  2u);
      }

      sub_100006DE4();
      goto LABEL_67;
    }

    uint64_t v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    if (sub_100006D54())
    {
LABEL_38:

LABEL_67:
      goto LABEL_68;
    }

    unsigned int v30 = -[os_log_s createFileAtPath:contents:attributes:]( v29,  "createFileAtPath:contents:attributes:",  @"/var/run/signpost_reporter_running",  0LL,  0LL);
    id v31 = sub_100003E84();
    id v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
    BOOL v33 = os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT);
    if (!v30)
    {
      if (v33)
      {
        LOWORD(buf.f_bsize) = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_DEFAULT,  "Could not create cookie file",  (uint8_t *)&buf,  2u);
      }

      goto LABEL_67;
    }

    if (v33)
    {
      LOWORD(buf.f_bsize) = 0;
      _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "Created cookie file", (uint8_t *)&buf, 2u);
    }

    uint64_t v77 = mach_continuous_time();
    id val = objc_alloc_init(&OBJC_CLASS___SignpostSupportObjectExtractor);
    if (!byte_100015BA0)
    {
      id v36 = 0LL;
      v37 = 0LL;
      id v75 = 0LL;
      v76 = 0LL;
      id v34 = 0LL;
LABEL_55:
      v49 = (void *)objc_claimAutoreleasedReturnValue( +[SignpostWorkflowResponsiveness allWorkflows]( &OBJC_CLASS___SignpostWorkflowResponsiveness,  "allWorkflows"));
      id v50 = sub_100003E84();
      v51 = (os_log_s *)objc_claimAutoreleasedReturnValue(v50);
      if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
      {
        buf.f_bsize = 138412290;
        *(void *)&buf.f_iosize = v37;
        _os_log_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_DEFAULT, "Boot disk type: %@", (uint8_t *)&buf, 0xCu);
      }

      v108 = _NSConcreteStackBlock;
      uint64_t v109 = 3221225472LL;
      uint64_t v110 = (uint64_t)sub_1000071E8;
      v111 = &unk_100010708;
      id v112 = 0LL;
      id v81 = v34;
      id v113 = v81;
      id v80 = v49;
      id v114 = v80;
      id v79 = v36;
      id v115 = 0LL;
      id v116 = v79;
      [val setIntervalCompletionProcessingBlock:&v108];
      if (byte_100015BA0)
      {
        *(void *)v100 = _NSConcreteStackBlock;
        uint64_t v101 = 3221225472LL;
        v102 = sub_100007318;
        v103 = &unk_100010730;
        id v52 = v81;
        id v104 = v52;
        id v53 = v80;
        id v105 = v53;
        id v54 = v79;
        id v106 = 0LL;
        id v107 = v54;
        [val setEmitEventProcessingBlock:v100];
        v96[0] = _NSConcreteStackBlock;
        v96[1] = 3221225472LL;
        v96[2] = sub_100007448;
        v96[3] = &unk_100010758;
        id v55 = v52;
        id v97 = v55;
        id v56 = v53;
        id v98 = v56;
        id v99 = 0LL;
        [val setDeviceRebootProcessingBlock:v96];

        if (byte_100015BA0)
        {
          v94[0] = _NSConcreteStackBlock;
          v94[1] = 3221225472LL;
          v94[2] = sub_10000754C;
          v94[3] = &unk_100010780;
          id v95 = v54;
          [val setAnimationIntervalCompletionProcessingBlock:v94];
          v91[0] = _NSConcreteStackBlock;
          v91[1] = 3221225472LL;
          v91[2] = sub_10000756C;
          v91[3] = &unk_1000107A8;
          id v92 = v55;
          id v93 = v56;
          [val setBeginEventProcessingBlock:v91];
          [val setBuildSkyLightAnimationCompositeIntervalTimelines:0];
        }
      }

      v89[0] = 0LL;
      v89[1] = v89;
      v89[2] = 0x2020000000LL;
      char v90 = 0;
      v82 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSinceNow:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceNow:",  -86400.0));
      v57 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
      v58 = dispatch_queue_create("signpost_reporter defer polling queue", 0LL);
      dispatch_source_t v59 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0LL, 0LL, v58);
      v60 = (void *)qword_100015B88;
      qword_100015B88 = (uint64_t)v59;

      dispatch_source_set_timer((dispatch_source_t)qword_100015B88, 0LL, 0x9502F900uLL, 0x9502F900uLL);
      objc_initWeak((id *)&buf, val);
      v61 = (dispatch_source_s *)qword_100015B88;
      handler[0] = _NSConcreteStackBlock;
      handler[1] = 3221225472LL;
      handler[2] = sub_100007678;
      handler[3] = &unk_1000107D0;
      v86 = v10;
      objc_copyWeak(&v88, (id *)&buf);
      v87 = v89;
      dispatch_source_set_event_handler(v61, handler);
      dispatch_resume((dispatch_object_t)qword_100015B88);
      objc_destroyWeak(&v88);

      objc_destroyWeak((id *)&buf);
      id v84 = 0LL;
      LOBYTE(v58) = [val processLogArchiveWithPath:0 startDate:v82 endDate:v57 errorOut:&v84];
      id v78 = v84;
      if ((v58 & 1) == 0)
      {
        id v62 = sub_100003E84();
        v63 = (os_log_s *)objc_claimAutoreleasedReturnValue(v62);
        if (os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT))
        {
          v64 = (void *)objc_claimAutoreleasedReturnValue([v78 localizedDescription]);
          buf.f_bsize = 138412290;
          *(void *)&buf.f_iosize = v64;
          _os_log_impl( (void *)&_mh_execute_header,  v63,  OS_LOG_TYPE_DEFAULT,  "Failed to process signpost data due to error: %@",  (uint8_t *)&buf,  0xCu);
        }
      }

      unint64_t v65 = mach_continuous_time() - v77;
      if (qword_100015BE0 != -1) {
        dispatch_once(&qword_100015BE0, &stru_100010860);
      }
      float v66 = *(double *)&qword_100015BE8 * (double)v65;
      v67 = (dispatch_queue_s *)qword_100015B78;
      *(void *)&buf.f_bsize = _NSConcreteStackBlock;
      buf.f_blocks = 3221225472LL;
      buf.f_bfree = (uint64_t)sub_100007780;
      buf.f_bavail = (uint64_t)&unk_1000107F8;
      buf.f_ffree = 0LL;
      buf.f_files = 0LL;
      v68 = v76;
      buf.f_fsid = (fsid_t)v68;
      id v69 = v81;
      *(void *)&buf.f_owner = v69;
      *(float *)&buf.f_mntonname[16] = v66;
      id v70 = val;
      *(void *)&buf.f_mntonname[8] = v89;
      *(void *)&buf.f_flags = v70;
      *(void *)buf.f_fstypename = 0LL;
      id v71 = v82;
      *(void *)&buf.f_fstypename[8] = v71;
      id v72 = v57;
      *(void *)buf.f_mntonname = v72;
      dispatch_sync(v67, &buf);
      sub_100006DE4();

      _Block_object_dispose(v89, 8);
      goto LABEL_67;
    }

    if (sub_100003644())
    {
      id v34 = objc_alloc_init(&OBJC_CLASS___SignpostCAStallAggregationBuilder);
      LODWORD(v35) = dword_1000159A0;
      [v34 setMaxDurationSec:v35];
    }

    else
    {
      id v34 = 0LL;
    }

    v38 = objc_alloc_init(&OBJC_CLASS___SignpostReporterObjectFilter);
    bzero(&buf, 0x878uLL);
    if (statfs("/", &buf))
    {
      id v39 = sub_100003E84();
      v40 = (os_log_s *)objc_claimAutoreleasedReturnValue(v39);
      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG)) {
LABEL_52:
      }
        sub_10000A034(v40, v41, v42, v43, v44, v45, v46, v47);
    }

    else
    {
      v48 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  buf.f_fstypename,  4LL));
      id v73 = sub_100003E84();
      v40 = (os_log_s *)objc_claimAutoreleasedReturnValue(v73);
      BOOL v74 = os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG);
      if (v48)
      {
        if (v74) {
          sub_10000A064((uint64_t)v48, v40);
        }
        goto LABEL_54;
      }

      if (v74) {
        goto LABEL_52;
      }
    }

    v48 = 0LL;
LABEL_54:

    v117[0] = _NSConcreteStackBlock;
    v117[1] = 3221225472LL;
    v117[2] = sub_100006EBC;
    v117[3] = &unk_1000106E0;
    v76 = v38;
    v118 = v76;
    id v75 = v48;
    id v119 = v75;
    v120 = @"SSD";
    id v36 = objc_retainBlock(v117);

    v37 = @"SSD";
    goto LABEL_55;
  }

  xpc_activity_state_t v5 = state;
  if (state)
  {
    id v9 = sub_100003E84();
    uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      buf.f_bsize = 134217984;
      *(void *)&buf.f_iosize = v5;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Unknown state %ld\n", (uint8_t *)&buf, 0xCu);
    }
  }

  else
  {
    id v6 = sub_100003E84();
    uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf.f_bsize) = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Checking in\n", (uint8_t *)&buf, 2u);
    }
  }

void sub_100006CD8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, char a27)
{
}

void sub_100006D20(id a1)
{
  uint64_t v1 = objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", &off_1000125F0));
  id v2 = (void *)qword_100015B90;
  qword_100015B90 = v1;
}

id sub_100006D54()
{
  v0 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  id v1 = [v0 fileExistsAtPath:@"/var/run/signpost_reporter_running" isDirectory:&v13];
  if ((_DWORD)v1) {
    BOOL v2 = v13 == 0;
  }
  else {
    BOOL v2 = 1;
  }
  if (!v2)
  {
    id v3 = sub_100003E84();
    id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      sub_10000A0D8(v4, v5, v6, v7, v8, v9, v10, v11);
    }
  }

  return v1;
}

void sub_100006DE4()
{
  if (sub_100006D54())
  {
    v0 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    id v7 = 0LL;
    unsigned int v1 = [v0 removeItemAtPath:@"/var/run/signpost_reporter_running" error:&v7];
    id v2 = v7;
    id v3 = sub_100003E84();
    id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
    uint64_t v5 = v4;
    if (v1)
    {
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v6 = 0;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Cleared cookie file", v6, 2u);
      }
    }

    else if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      sub_10000A108(v2, v5);
    }
  }

void sub_100006EBC(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([*(id *)(a1 + 32) shouldReportSignpostObject:v3 classificationOut:0])
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 coreAnalyticsPayload]);
    uint64_t v5 = v4;
    if (v4)
    {
      uint64_t v6 = *(void *)(a1 + 40);
      if (v6) {
        [v4 setObject:v6 forKeyedSubscript:@"BootPartitionFS"];
      }
      [v5 setObject:*(void *)(a1 + 48) forKeyedSubscript:@"BootDiskType"];
      sub_100006FDC();
      id v7 = (dispatch_queue_s *)qword_100015B78;
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472LL;
      v10[2] = sub_1000070D8;
      v10[3] = &unk_1000106B8;
      uint64_t v11 = (os_log_s *)v3;
      id v12 = v5;
      dispatch_async(v7, v10);

      uint64_t v8 = v11;
    }

    else
    {
      id v9 = sub_100003E84();
      uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
        sub_10000A1C0(v3, v8);
      }
    }
  }
}

void sub_100006FDC()
{
  if (qword_100015BA8 != -1) {
    dispatch_once(&qword_100015BA8, &stru_100010840);
  }
  if ((unint64_t)++qword_100015BC8 >= 0xA)
  {
    double v0 = *(double *)&qword_100015BB0 * (double)(mach_continuous_time() - qword_100015BC0);
    if (v0 < *(float *)&dword_100015BB8)
    {
      unsigned int v1 = (*(float *)&dword_100015BB8 - v0);
      id v2 = sub_100003E84();
      id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
        sub_10000A29C(v1, v3);
      }

      usleep(v1);
      qword_100015BD0 += v1;
      ++qword_100015BD8;
    }

    qword_100015BC8 = 0LL;
    qword_100015BC0 = mach_continuous_time();
  }

void sub_1000070D8(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) subsystem]);
  id v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) category]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) name]);
  v9[0] = @"sp";
  v9[1] = v2;
  v9[2] = v3;
  v9[3] = v4;
  id v5 = v2;
  id v6 = v3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v9, 4LL));

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 componentsJoinedByString:@"__"]);
  AnalyticsSendEvent(v8, *(void *)(a1 + 40));
}

uint64_t sub_1000071E8(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (byte_100015BA0)
  {
    [*(id *)(a1 + 40) handleSignpostInterval:v3];
    __int128 v12 = 0u;
    __int128 v13 = 0u;
    __int128 v10 = 0u;
    __int128 v11 = 0u;
    id v4 = *(id *)(a1 + 48);
    id v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = *(void *)v11;
      do
      {
        for (i = 0LL; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v11 != v7) {
            objc_enumerationMutation(v4);
          }
          objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * (void)i), "handleSignpostInterval:", v3, (void)v10);
        }

        id v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }

      while (v6);
    }

    (*(void (**)(void))(*(void *)(a1 + 64) + 16LL))();
  }

  return 1LL;
}

uint64_t sub_100007318(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (byte_100015BA0)
  {
    [*(id *)(a1 + 32) handleSignpostEvent:v3];
    __int128 v12 = 0u;
    __int128 v13 = 0u;
    __int128 v10 = 0u;
    __int128 v11 = 0u;
    id v4 = *(id *)(a1 + 40);
    id v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = *(void *)v11;
      do
      {
        for (i = 0LL; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v11 != v7) {
            objc_enumerationMutation(v4);
          }
          objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * (void)i), "handleSignpostEmitEvent:", v3, (void)v10);
        }

        id v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }

      while (v6);
    }

    (*(void (**)(void))(*(void *)(a1 + 56) + 16LL))();
  }

  return 1LL;
}

uint64_t sub_100007448(uint64_t a1)
{
  if (byte_100015BA0)
  {
    [*(id *)(a1 + 32) handleDeviceReboot];
    __int128 v10 = 0u;
    __int128 v11 = 0u;
    __int128 v8 = 0u;
    __int128 v9 = 0u;
    id v2 = *(id *)(a1 + 40);
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
          objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * (void)i), "handleDeviceReboot", (void)v8);
        }

        id v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
      }

      while (v4);
    }
  }

  return 1LL;
}

uint64_t sub_10000754C(uint64_t a1)
{
  return 1LL;
}

uint64_t sub_10000756C(uint64_t a1, void *a2)
{
  id v3 = a2;
  [*(id *)(a1 + 32) handleSignpostIntervalBegin:v3];
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  id v4 = *(id *)(a1 + 40);
  id v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      __int128 v8 = 0LL;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * (void)v8), "handleSignpostIntervalBegin:", v3, (void)v10);
        __int128 v8 = (char *)v8 + 1;
      }

      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }

    while (v6);
  }

  return 1LL;
}

void sub_100007678(uint64_t a1)
{
  BOOL should_defer = xpc_activity_should_defer(*(xpc_activity_t *)(a1 + 32));
  id v3 = sub_100003E84();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (should_defer)
  {
    if (v5)
    {
      *(_WORD *)statfs buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Trying to stop in-flight reporting work.",  buf,  2u);
    }

    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    [WeakRetained stopProcessing];

    *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 1;
    id v7 = sub_100003E84();
    id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v10 = 0;
      __int128 v8 = "Concluding processing due to deferral request";
      __int128 v9 = (uint8_t *)&v10;
LABEL_8:
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, v8, v9, 2u);
    }
  }

  else if (v5)
  {
    *(_WORD *)__int128 v11 = 0;
    __int128 v8 = "Deferral not requested, continuing.";
    __int128 v9 = v11;
    goto LABEL_8;
  }
}

void sub_100007780(uint64_t a1)
{
  id v3 = *(void **)(a1 + 48);
  id v2 = *(void **)(a1 + 56);
  float v4 = *(float *)(a1 + 104);
  id v123 = [*(id *)(a1 + 64) processedEventCount];
  int v122 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 96) + 8LL) + 24LL);
  uint64_t v125 = *(void *)(a1 + 72);
  uint64_t v121 = a1;
  if (v125)
  {
    int v124 = 0;
    BOOL v5 = @"log archive end";
    id v6 = @"log archive begin";
  }

  else
  {
    uint64_t v7 = objc_claimAutoreleasedReturnValue( +[NSDateFormatter localizedStringFromDate:dateStyle:timeStyle:]( &OBJC_CLASS___NSDateFormatter,  "localizedStringFromDate:dateStyle:timeStyle:",  *(void *)(a1 + 80),  1LL,  2LL));
    if (*(void *)(a1 + 72))
    {
      int v124 = 0;
      BOOL v5 = @"log archive end";
    }

    else
    {
      BOOL v5 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSDateFormatter localizedStringFromDate:dateStyle:timeStyle:]( &OBJC_CLASS___NSDateFormatter,  "localizedStringFromDate:dateStyle:timeStyle:",  *(void *)(a1 + 88),  1LL,  2LL));
      int v124 = 1;
    }

    id v6 = (__CFString *)v7;
  }

  id v8 = v3;
  id v127 = v2;
  id v119 = v6;
  v126 = v6;
  __int128 v9 = v5;
  if (byte_100015BA0)
  {
    v120 = v9;
    uint64_t v153 = 0LL;
    v154 = &v153;
    uint64_t v155 = 0x2020000000LL;
    uint64_t v156 = 0LL;
    v152[0] = _NSConcreteStackBlock;
    v152[1] = 3221225472LL;
    v152[2] = sub_100008BAC;
    v152[3] = &unk_100010888;
    v152[4] = &v153;
    __int16 v10 = objc_retainBlock(v152);
    id v11 = sub_100003E84();
    __int128 v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      __int128 v13 = (void *)objc_claimAutoreleasedReturnValue([v8 allInspectedSignpostObjectsAggregation]);
      id v14 = [v13 totalCount];
      *(_DWORD *)statfs buf = 134217984;
      uint64_t v158 = (uint64_t)v14;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "**************\nTotal signpost object count: %llu",  buf,  0xCu);
    }

    dispatch_semaphore_t v15 = (void *)objc_claimAutoreleasedReturnValue([v8 allInspectedSignpostObjectsAggregation]);
    id v16 = (void *)objc_claimAutoreleasedReturnValue([v15 keysInDescendingCountOrder]);

    v154[3] = 0LL;
    __int128 v148 = 0u;
    __int128 v149 = 0u;
    __int128 v150 = 0u;
    __int128 v151 = 0u;
    id v17 = v16;
    id v18 = [v17 countByEnumeratingWithState:&v148 objects:v192 count:16];
    uint64_t v19 = v5;
    if (v18)
    {
      uint64_t v20 = *(void *)v149;
      do
      {
        for (i = 0LL; i != v18; i = (char *)i + 1)
        {
          if (*(void *)v149 != v20) {
            objc_enumerationMutation(v17);
          }
          uint64_t v22 = *(void *)(*((void *)&v148 + 1) + 8LL * (void)i);
          id v23 = (void *)objc_claimAutoreleasedReturnValue([v8 allInspectedSignpostObjectsAggregation]);
          ((void (*)(void *, uint64_t, void *, const __CFString *))v10[2])( v10,  v22,  v23,  @"AllInspected");
        }

        BOOL v5 = v19;
        id v18 = [v17 countByEnumeratingWithState:&v148 objects:v192 count:16];
      }

      while (v18);
    }

    id v24 = sub_100003E84();
    uint64_t v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      id v26 = (void *)objc_claimAutoreleasedReturnValue([v8 telemetryReportedAggregation]);
      id v27 = [v26 totalCount];
      *(_DWORD *)statfs buf = 134217984;
      uint64_t v158 = (uint64_t)v27;
      _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "**************\nReported signpost object count: %llu",  buf,  0xCu);
    }

    id v28 = (void *)objc_claimAutoreleasedReturnValue([v8 telemetryReportedAggregation]);
    uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue([v28 keysInDescendingCountOrder]);

    v154[3] = 0LL;
    __int128 v144 = 0u;
    __int128 v145 = 0u;
    __int128 v146 = 0u;
    __int128 v147 = 0u;
    id v30 = v29;
    id v31 = [v30 countByEnumeratingWithState:&v144 objects:v191 count:16];
    if (v31)
    {
      uint64_t v32 = *(void *)v145;
      do
      {
        for (j = 0LL; j != v31; j = (char *)j + 1)
        {
          if (*(void *)v145 != v32) {
            objc_enumerationMutation(v30);
          }
          uint64_t v34 = *(void *)(*((void *)&v144 + 1) + 8LL * (void)j);
          double v35 = (void *)objc_claimAutoreleasedReturnValue([v8 telemetryReportedAggregation]);
          ((void (*)(void *, uint64_t, void *, const __CFString *))v10[2])(v10, v34, v35, @"Reported");
        }

        BOOL v5 = v19;
        id v31 = [v30 countByEnumeratingWithState:&v144 objects:v191 count:16];
      }

      while (v31);
    }

    id v36 = sub_100003E84();
    v37 = (os_log_s *)objc_claimAutoreleasedReturnValue(v36);
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
    {
      v38 = (void *)objc_claimAutoreleasedReturnValue([v8 telemetryReportedEventsAggregation]);
      id v39 = [v38 totalCount];
      *(_DWORD *)statfs buf = 134217984;
      uint64_t v158 = (uint64_t)v39;
      _os_log_impl( (void *)&_mh_execute_header,  v37,  OS_LOG_TYPE_DEFAULT,  "**************\nReported signpost event count: %llu",  buf,  0xCu);
    }

    v40 = (void *)objc_claimAutoreleasedReturnValue([v8 telemetryReportedEventsAggregation]);
    uint64_t v41 = (void *)objc_claimAutoreleasedReturnValue([v40 keysInDescendingCountOrder]);

    v154[3] = 0LL;
    __int128 v140 = 0u;
    __int128 v141 = 0u;
    __int128 v142 = 0u;
    __int128 v143 = 0u;
    id v42 = v41;
    id v43 = [v42 countByEnumeratingWithState:&v140 objects:v190 count:16];
    if (v43)
    {
      uint64_t v44 = *(void *)v141;
      do
      {
        for (k = 0LL; k != v43; k = (char *)k + 1)
        {
          if (*(void *)v141 != v44) {
            objc_enumerationMutation(v42);
          }
          uint64_t v46 = *(void *)(*((void *)&v140 + 1) + 8LL * (void)k);
          uint64_t v47 = (void *)objc_claimAutoreleasedReturnValue([v8 telemetryReportedEventsAggregation]);
          ((void (*)(void *, uint64_t, void *, const __CFString *))v10[2])( v10,  v46,  v47,  @"ReportedEvents");
        }

        BOOL v5 = v19;
        id v43 = [v42 countByEnumeratingWithState:&v140 objects:v190 count:16];
      }

      while (v43);
    }

    id v48 = sub_100003E84();
    v49 = (os_log_s *)objc_claimAutoreleasedReturnValue(v48);
    if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
    {
      id v50 = (void *)objc_claimAutoreleasedReturnValue([v8 telemetryNotReportedFailedSCFilterAggregation]);
      id v51 = [v50 totalCount];
      *(_DWORD *)statfs buf = 134217984;
      uint64_t v158 = (uint64_t)v51;
      _os_log_impl( (void *)&_mh_execute_header,  v49,  OS_LOG_TYPE_DEFAULT,  "**************\nSubsystem/category filtered signpost object count: %llu",  buf,  0xCu);
    }

    id v52 = (void *)objc_claimAutoreleasedReturnValue([v8 telemetryNotReportedFailedSCFilterAggregation]);
    id v53 = (void *)objc_claimAutoreleasedReturnValue([v52 keysInDescendingCountOrder]);

    v154[3] = 0LL;
    __int128 v136 = 0u;
    __int128 v137 = 0u;
    __int128 v138 = 0u;
    __int128 v139 = 0u;
    id v54 = v53;
    id v55 = [v54 countByEnumeratingWithState:&v136 objects:v189 count:16];
    if (v55)
    {
      uint64_t v56 = *(void *)v137;
      do
      {
        for (m = 0LL; m != v55; m = (char *)m + 1)
        {
          if (*(void *)v137 != v56) {
            objc_enumerationMutation(v54);
          }
          uint64_t v58 = *(void *)(*((void *)&v136 + 1) + 8LL * (void)m);
          dispatch_source_t v59 = (void *)objc_claimAutoreleasedReturnValue([v8 telemetryNotReportedFailedSCFilterAggregation]);
          ((void (*)(void *, uint64_t, void *, const __CFString *))v10[2])( v10,  v58,  v59,  @"SubsystemCategoryFiltered");
        }

        BOOL v5 = v19;
        id v55 = [v54 countByEnumeratingWithState:&v136 objects:v189 count:16];
      }

      while (v55);
    }

    id v60 = sub_100003E84();
    v61 = (os_log_s *)objc_claimAutoreleasedReturnValue(v60);
    if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
    {
      id v62 = (void *)objc_claimAutoreleasedReturnValue([v8 telemetryNotReportedDurationThresholdAggregation]);
      id v63 = [v62 totalCount];
      *(_DWORD *)statfs buf = 134217984;
      uint64_t v158 = (uint64_t)v63;
      _os_log_impl( (void *)&_mh_execute_header,  v61,  OS_LOG_TYPE_DEFAULT,  "**************\nDuration filtered signpost object count: %llu",  buf,  0xCu);
    }

    v64 = (void *)objc_claimAutoreleasedReturnValue([v8 telemetryNotReportedDurationThresholdAggregation]);
    unint64_t v65 = (void *)objc_claimAutoreleasedReturnValue([v64 keysInDescendingCountOrder]);

    v154[3] = 0LL;
    __int128 v132 = 0u;
    __int128 v133 = 0u;
    __int128 v134 = 0u;
    __int128 v135 = 0u;
    id v66 = v65;
    id v67 = [v66 countByEnumeratingWithState:&v132 objects:v188 count:16];
    if (v67)
    {
      uint64_t v68 = *(void *)v133;
      do
      {
        for (n = 0LL; n != v67; n = (char *)n + 1)
        {
          if (*(void *)v133 != v68) {
            objc_enumerationMutation(v66);
          }
          uint64_t v70 = *(void *)(*((void *)&v132 + 1) + 8LL * (void)n);
          id v71 = (void *)objc_claimAutoreleasedReturnValue([v8 telemetryNotReportedDurationThresholdAggregation]);
          ((void (*)(void *, uint64_t, void *, const __CFString *))v10[2])( v10,  v70,  v71,  @"DurationThresholdFiltered");
        }

        BOOL v5 = v19;
        id v67 = [v66 countByEnumeratingWithState:&v132 objects:v188 count:16];
      }

      while (v67);
    }

    id v72 = sub_100003E84();
    id v73 = (os_log_s *)objc_claimAutoreleasedReturnValue(v72);
    if (os_log_type_enabled(v73, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v74 = (void *)objc_claimAutoreleasedReturnValue([v8 telemetryNotReportedFailedStringAllowlistAggregation]);
      id v75 = [v74 totalCount];
      *(_DWORD *)statfs buf = 134217984;
      uint64_t v158 = (uint64_t)v75;
      _os_log_impl( (void *)&_mh_execute_header,  v73,  OS_LOG_TYPE_DEFAULT,  "**************\nString allowlist filtered signpost object count: %llu",  buf,  0xCu);
    }

    v76 = (void *)objc_claimAutoreleasedReturnValue([v8 telemetryNotReportedFailedStringAllowlistAggregation]);
    uint64_t v77 = (void *)objc_claimAutoreleasedReturnValue([v76 keysInDescendingCountOrder]);

    v154[3] = 0LL;
    __int128 v128 = 0u;
    __int128 v129 = 0u;
    __int128 v130 = 0u;
    __int128 v131 = 0u;
    id v78 = v77;
    id v79 = [v78 countByEnumeratingWithState:&v128 objects:v187 count:16];
    if (v79)
    {
      uint64_t v80 = *(void *)v129;
      do
      {
        for (ii = 0LL; ii != v79; ii = (char *)ii + 1)
        {
          if (*(void *)v129 != v80) {
            objc_enumerationMutation(v78);
          }
          uint64_t v82 = *(void *)(*((void *)&v128 + 1) + 8LL * (void)ii);
          v83 = (void *)objc_claimAutoreleasedReturnValue([v8 telemetryNotReportedFailedStringAllowlistAggregation]);
          ((void (*)(void *, uint64_t, void *, const __CFString *))v10[2])( v10,  v82,  v83,  @"StringWhitelistFiltered");
        }

        BOOL v5 = v19;
        id v79 = [v78 countByEnumeratingWithState:&v128 objects:v187 count:16];
      }

      while (v79);
    }

    id v84 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    *(float *)&double v85 = v4;
    v86 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:", v85));
    [v84 setObject:v86 forKeyedSubscript:@"ProcessingDurationInSeconds"];

    v87 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", v123));
    [v84 setObject:v87 forKeyedSubscript:@"LogObjectsProcessed"];

    id v88 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( NSNumber,  "numberWithUnsignedLongLong:",  [v8 totalReportedAnimationCount]));
    [v84 setObject:v88 forKeyedSubscript:@"AnimationsReported"];

    v89 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( NSNumber,  "numberWithUnsignedLongLong:",  [v8 totalReportedIntervalCount]));
    [v84 setObject:v89 forKeyedSubscript:@"IntervalsReported"];

    char v90 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( NSNumber,  "numberWithUnsignedLongLong:",  [v8 totalReportedEventCount]));
    [v84 setObject:v90 forKeyedSubscript:@"EventsReported"];

    v91 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( NSNumber,  "numberWithUnsignedLongLong:",  [v8 totalUnreportedAnimationCount]));
    [v84 setObject:v91 forKeyedSubscript:@"AnimationsNotReported"];

    id v92 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( NSNumber,  "numberWithUnsignedLongLong:",  [v8 totalUnreportedIntervalCount]));
    [v84 setObject:v92 forKeyedSubscript:@"IntervalsNotReported"];

    id v93 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( NSNumber,  "numberWithUnsignedLongLong:",  [v8 totalUnreportedEventCount]));
    [v84 setObject:v93 forKeyedSubscript:@"EventsNotReported"];

    v94 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v122 != 0));
    [v84 setObject:v94 forKeyedSubscript:@"WasInterrupted"];

    AnalyticsSendEvent(@"com.apple.performance.signpost_reporting_stats", v84);
    id v95 = sub_100003E84();
    v96 = (os_log_s *)objc_claimAutoreleasedReturnValue(v95);
    if (os_log_type_enabled(v96, OS_LOG_TYPE_DEFAULT))
    {
      id v117 = [v8 totalReportedEventCount];
      id v116 = (const __CFString *)[v8 totalUnreportedEventCount];
      id v115 = (const __CFString *)[v8 totalReportedIntervalCount];
      double v114 = COERCE_DOUBLE([v8 totalUnreportedIntervalCount]);
      id v113 = [v8 totalReportedAnimationCount];
      id v112 = [v8 totalUnreportedAnimationCount];
      v118 = (void *)objc_claimAutoreleasedReturnValue([v8 telemetryNotReportedFailedSCFilterAggregation]);
      id v111 = [v118 totalCount];
      id v97 = (void *)objc_claimAutoreleasedReturnValue([v8 telemetryNotReportedDurationThresholdAggregation]);
      id v98 = [v97 totalCount];
      id v99 = (void *)objc_claimAutoreleasedReturnValue([v8 telemetryNotReportedFailedStringAllowlistAggregation]);
      id v100 = [v99 totalCount];
      uint64_t v101 = (void *)objc_claimAutoreleasedReturnValue([v8 telemetryDisabledAggregation]);
      id v102 = [v101 totalCount];
      *(_DWORD *)statfs buf = 134221570;
      v103 = "";
      uint64_t v158 = (uint64_t)v117;
      __int16 v159 = 2048;
      if (v122) {
        v103 = " (Interrupted by deferral)";
      }
      v160 = v116;
      __int16 v161 = 2048;
      v162 = v115;
      __int16 v163 = 2048;
      double v164 = v114;
      __int16 v165 = 2048;
      id v166 = v113;
      __int16 v167 = 2048;
      id v168 = v112;
      __int16 v169 = 2048;
      id v170 = v111;
      __int16 v171 = 2048;
      id v172 = v98;
      __int16 v173 = 2048;
      id v174 = v100;
      __int16 v175 = 2048;
      id v176 = v102;
      __int16 v177 = 2048;
      id v178 = v123;
      __int16 v179 = 2048;
      double v180 = v4;
      __int16 v181 = 2112;
      v182 = v126;
      __int16 v183 = 2112;
      v184 = v120;
      __int16 v185 = 2080;
      v186 = v103;
      _os_log_impl( (void *)&_mh_execute_header,  v96,  OS_LOG_TYPE_DEFAULT,  "Done processing %llu reported and %llu unreported events, %llu reported and %llu unreported intervals and %llu r eported and %llu unreported animations (%llu blocklisted, %llu too short, %llu allowlisted, %llu telemetry not e nabled) from %llu log events in %.2fs between %@ and %@%s\n",  buf,  0x98u);

      BOOL v5 = v19;
    }

    if (qword_100015BD8)
    {
      id v104 = sub_100003E84();
      id v105 = (os_log_s *)objc_claimAutoreleasedReturnValue(v104);
      if (os_log_type_enabled(v105, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)statfs buf = 134218240;
        uint64_t v158 = qword_100015BD8;
        __int16 v159 = 2048;
        v160 = (const __CFString *)qword_100015BD0;
        _os_log_impl( (void *)&_mh_execute_header,  v105,  OS_LOG_TYPE_DEFAULT,  "Throttled %llu times for a total of %llu usec",  buf,  0x16u);
      }
    }

    if (v127)
    {
      id v106 = (void *)objc_claimAutoreleasedReturnValue([v127 stallAggregationSnapshot]);
      sub_10000364C(v106);
    }

    _Block_object_dispose(&v153, 8);
    __int128 v9 = v120;
  }

  if (v124) {
  if (!v125)
  }

  id v107 = sub_100003E84();
  v108 = (os_log_s *)objc_claimAutoreleasedReturnValue(v107);
  if (os_log_type_enabled(v108, OS_LOG_TYPE_DEFAULT))
  {
    float v109 = *(float *)(v121 + 104);
    if (byte_100015BA0) {
      uint64_t v110 = @"Enabled";
    }
    else {
      uint64_t v110 = @"Disabled";
    }
    *(_DWORD *)statfs buf = 138413058;
    uint64_t v158 = (uint64_t)v110;
    __int16 v159 = 2112;
    v160 = @"Disabled";
    __int16 v161 = 2112;
    v162 = @"Disabled";
    __int16 v163 = 2048;
    double v164 = v109;
    _os_log_impl( (void *)&_mh_execute_header,  v108,  OS_LOG_TYPE_DEFAULT,  "Processing for:\n \tos_signpost CA telemetry: %@\n \tAggregation CA telemetry: %@\n \tCAMetalLayer CA telemetry: %@ took %.2f seconds",  buf,  0x2Au);
  }
}

void sub_100008698(_Unwind_Exception *a1)
{
}

void sub_100008754(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v5;
  id v8 = (__CFString *)v6;
  if ((-[__CFString isEqualToString:]( v8,  "isEqualToString:",  @"com.apple.performance.signpost_reporter_tasking") & 1) != 0)
  {
    if (v7)
    {
      uint64_t v9 = objc_opt_class(&OBJC_CLASS___NSDictionary);
      if ((objc_opt_isKindOfClass(v7, v9) & 1) != 0)
      {
        id v10 = (id)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:@"TaskedOn"]);
        if (v10)
        {
          uint64_t v11 = objc_opt_class(&OBJC_CLASS___NSNumber);
          if ((objc_opt_isKindOfClass(v10, v11) & 1) != 0)
          {
            unsigned int v12 = [v10 BOOLValue];
            id v13 = sub_100003E84();
            id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
            BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
            if (v12)
            {
              if (v15)
              {
                LOWORD(v26) = 0;
                _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Reporting based on being tasked-on by CoreAnalytics",  (uint8_t *)&v26,  2u);
              }

              char v16 = 1;
              goto LABEL_28;
            }

            if (v15)
            {
              int v26 = 138412290;
              id v27 = @"TaskedOn";
              id v24 = "Not reporting based on not being tasked-on by CoreAnalytics ('%@' is false)";
              goto LABEL_26;
            }

LABEL_27:
            char v16 = 0;
LABEL_28:

            goto LABEL_19;
          }

          id v25 = sub_100003E84();
          id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
          if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_27;
          }
          int v26 = 138412290;
          id v27 = @"TaskedOn";
          id v24 = "Not reporting since not tasked-on by CoreAnalytics (Wrong value class for class for %@)";
        }

        else
        {
          id v23 = sub_100003E84();
          id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
          if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_27;
          }
          int v26 = 138412290;
          id v27 = @"TaskedOn";
          id v24 = "Not reporting since is not tasked-on by CoreAnalytics (nil value for %@ key)";
        }

LABEL_26:
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, v24, (uint8_t *)&v26, 0xCu);
        goto LABEL_27;
      }

      id v22 = sub_100003E84();
      id v10 = (id)objc_claimAutoreleasedReturnValue(v22);
      if (os_log_type_enabled((os_log_t)v10, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v26) = 0;
        id v18 = "Not reporting based on not being tasked-on by CoreAnalytics (Non-NSDictionary configuration object)";
        goto LABEL_16;
      }
    }

    else
    {
      id v21 = sub_100003E84();
      id v10 = (id)objc_claimAutoreleasedReturnValue(v21);
      if (os_log_type_enabled((os_log_t)v10, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v26) = 0;
        id v18 = "Not reporting based on not being tasked-on by CoreAnalytics (nil configuration object)";
LABEL_16:
        uint64_t v19 = (os_log_s *)v10;
        uint32_t v20 = 2;
        goto LABEL_17;
      }
    }
  }

  else
  {
    id v17 = sub_100003E84();
    id v10 = (id)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled((os_log_t)v10, OS_LOG_TYPE_DEFAULT))
    {
      int v26 = 138412290;
      id v27 = v8;
      id v18 = "Not reporting based on not being tasked-on by CoreAnalytics (unexpected type string: '%@')";
      uint64_t v19 = (os_log_s *)v10;
      uint32_t v20 = 12;
LABEL_17:
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, v18, (uint8_t *)&v26, v20);
    }
  }

  char v16 = 0;
LABEL_19:

  *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = v16;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_100008A50(id a1)
{
  LODWORD(v1) = info.numer;
  LODWORD(v2) = info.denom;
  *(double *)&qword_100015BB0 = (double)v1 / (double)v2 / 1000.0;
  dword_100015BB8 = 1207182336;
  id v3 = sub_100003E84();
  float v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)statfs buf = 134218496;
    uint64_t v7 = 0x40FE848000000000LL;
    __int16 v8 = 2048;
    double v9 = 125000.0 / *(double *)&qword_100015BB0;
    __int16 v10 = 1024;
    int v11 = 10;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "%f us, %f mach time units per quantum of %u reported events",  buf,  0x1Cu);
  }

  qword_100015BC0 = mach_continuous_time();
}

void sub_100008B68(id a1)
{
  LODWORD(v1) = info.numer;
  LODWORD(v2) = info.denom;
  *(double *)&qword_100015BE8 = (double)v1 * 0.000000001 / (double)v2;
}

void sub_100008BAC(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  sub_100006FDC();
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) > 4uLL)
  {
    id v24 = sub_100003E84();
    id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      id v25 = (void *)objc_claimAutoreleasedReturnValue([v7 description]);
      int v26 = (void *)objc_claimAutoreleasedReturnValue([v8 aggregationDictionary]);
      id v27 = (void *)objc_claimAutoreleasedReturnValue([v26 objectForKeyedSubscript:v7]);
      *(_DWORD *)statfs buf = 138412546;
      *(void *)&uint8_t buf[4] = v25;
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = [v27 unsignedLongLongValue];
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%@:\t%llu (Count not reported)", buf, 0x16u);
    }
  }

  else
  {
    v30[0] = @"Subsystem";
    id v10 = v7;
    id v29 = v8;
    id v11 = v8;
    id v28 = v9;
    id v12 = v9;
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v10 subsystem]);
    *(void *)statfs buf = v13;
    v30[1] = @"Category";
    id v14 = (void *)objc_claimAutoreleasedReturnValue([v10 category]);
    *(void *)&buf[8] = v14;
    v30[2] = @"Count";
    BOOL v15 = (void *)objc_claimAutoreleasedReturnValue([v11 aggregationDictionary]);

    char v16 = (void *)objc_claimAutoreleasedReturnValue([v15 objectForKeyedSubscript:v10]);
    v30[3] = @"Classification";
    *(void *)&uint8_t buf[16] = v16;
    id v32 = v12;
    id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  buf,  v30,  4LL));

    AnalyticsSendEvent(@"com.apple.performance.signpost_counts", v17);
    id v18 = sub_100003E84();
    uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      uint32_t v20 = (void *)objc_claimAutoreleasedReturnValue([v10 description]);
      id v21 = (void *)objc_claimAutoreleasedReturnValue([v11 aggregationDictionary]);
      id v22 = (void *)objc_claimAutoreleasedReturnValue([v21 objectForKeyedSubscript:v10]);
      id v23 = [v22 unsignedLongLongValue];
      *(_DWORD *)statfs buf = 138412546;
      *(void *)&uint8_t buf[4] = v20;
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = v23;
      _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "%@:\t%llu (Count reported to CoreAnalytics)",  buf,  0x16u);
    }

    id v9 = v28;
    id v8 = v29;
  }

  ++*(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
}

  ;
}

void sub_100008ED8( void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

int64_t sub_100009384(id a1, NSNumber *a2, NSNumber *a3)
{
  return -[NSNumber compare:](a3, "compare:", a2);
}

void sub_100009C10(os_log_t log)
{
  *(_WORD *)unint64_t v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "Nil CA stall aggregation stats", v1, 2u);
}

void sub_100009C50(uint64_t a1, uint64_t a2)
{
  id v4 = objc_msgSend((id)sub_100003C9C(a1, a2), "processExecutablePath");
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  *id v3 = 138412290;
  *unint64_t v2 = v5;
  sub_100003C7C((void *)&_mh_execute_header, v6, v7, "Could not find bundle ID for %@. Skipping");

  sub_100003C90();
}

void sub_100009CA0(uint64_t a1, uint64_t a2)
{
  id v4 = objc_msgSend((id)sub_100003C9C(a1, a2), "description");
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  *id v3 = 138412290;
  *unint64_t v2 = v5;
  sub_100003C7C((void *)&_mh_execute_header, v6, v7, "CA Stall Aggregation:\n%@");

  sub_100003C90();
}

void sub_100009CF0(os_log_s *a1, uint64_t a2, uint64_t a3)
{
  *(_WORD *)id v3 = 0;
  sub_1000049F4((void *)&_mh_execute_header, a1, a3, "Tried to create a downsample entry with 0 downsample ratio", v3);
  sub_100004A00();
}

void sub_100009D24(os_log_s *a1, uint64_t a2, uint64_t a3)
{
  *(_WORD *)id v3 = 0;
  sub_1000049F4((void *)&_mh_execute_header, a1, a3, "Missing required subsystem", v3);
  sub_100004A00();
}

void sub_100009D58(os_log_s *a1, uint64_t a2, uint64_t a3)
{
  *(_WORD *)id v3 = 0;
  sub_1000049F4((void *)&_mh_execute_header, a1, a3, "Missing required cap", v3);
  sub_100004A00();
}

void sub_100009D8C(uint8_t *a1, _BYTE *a2, os_log_s *a3)
{
  *a1 = 0;
  *a2 = 0;
  sub_1000049F4((void *)&_mh_execute_header, a3, (uint64_t)a3, "Missing required downsample ratio", a1);
}

void sub_100009DC0( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100009DF0( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100009E20( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100009E50(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_debug_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_DEBUG,  "Found bundle ID: %@ for path:%@",  (uint8_t *)&v3,  0x16u);
}

void sub_100009ED4(void *a1)
{
  unint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([a1 subsystem]);
  int v3 = (void *)objc_claimAutoreleasedReturnValue([a1 category]);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([a1 name]);
  sub_100008EB0();
  sub_100008ED8( (void *)&_mh_execute_header,  v5,  v6,  "%@/%@/%@: Overriding bundle ID on event to %@",  v7,  v8,  v9,  v10,  v11);

  sub_100008EEC();
}

void sub_100009F84(void *a1)
{
  unint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([a1 subsystem]);
  int v3 = (void *)objc_claimAutoreleasedReturnValue([a1 category]);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([a1 name]);
  sub_100008EB0();
  sub_100008ED8( (void *)&_mh_execute_header,  v5,  v6,  "%@/%@/%@: Overriding bundle ID on interval to %@",  v7,  v8,  v9,  v10,  v11);

  sub_100008EEC();
}

void sub_10000A034( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10000A064(uint64_t a1, os_log_s *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "Filesystem for '/': %@", (uint8_t *)&v2, 0xCu);
}

void sub_10000A0D8( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10000A108(void *a1, os_log_t log)
{
  if (a1) {
    uint64_t v4 = (__CFString *)objc_claimAutoreleasedReturnValue([a1 localizedDescription]);
  }
  else {
    uint64_t v4 = @"Unknown error";
  }
  int v5 = 138412290;
  uint64_t v6 = v4;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "Could not clear cookie file: %@",  (uint8_t *)&v5,  0xCu);
  if (a1) {
}
  }

void sub_10000A1C0(void *a1, os_log_s *a2)
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([a1 subsystem]);
  int v5 = (void *)objc_claimAutoreleasedReturnValue([a1 category]);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([a1 name]);
  int v7 = 138412802;
  uint64_t v8 = v4;
  __int16 v9 = 2112;
  uint64_t v10 = v5;
  __int16 v11 = 2112;
  id v12 = v6;
  _os_log_debug_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_DEBUG,  "Failed to create payload for %@/%@%@",  (uint8_t *)&v7,  0x20u);
}

void sub_10000A29C(int a1, os_log_s *a2)
{
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "Sleeping for %u us", (uint8_t *)v2, 8u);
  sub_100004A00();
}

id objc_msgSend_workflowWithName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "workflowWithName:");
}
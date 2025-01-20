@interface HTTailspin
+ (BOOL)hasAppExceededGeneratedLogsCountForDuration:(double)a3 procName:(id)a4 isFirstPartyApp:(BOOL)a5;
+ (BOOL)hasExceededDailyFenceLogLimit;
+ (BOOL)hasExceededDailyLimit:(double)a3 isFirstPartyApp:(BOOL)a4;
+ (BOOL)saveActivationTailSpinWithType:(id)a3 reason:(id)a4 bundleID:(id)a5 pid:(int)a6 startTime:(unint64_t)a7 endTime:(unint64_t)a8 isThirdPartyDevSupportModeHang:(BOOL)a9;
+ (BOOL)saveSentryTailspin:(id)a3 infoDict:(id)a4 startTime:(unint64_t)a5 endTime:(unint64_t)a6 error:(id *)a7;
+ (BOOL)saveTailSpinForService:(id)a3 reason:(id)a4 processID:(int)a5 threadID:(unint64_t)a6 procName:(id)a7 procPath:(id)a8 startTime:(unint64_t)a9 endTime:(unint64_t)a10 blownFenceId:(unint64_t)a11 hangType:(int64_t)a12 userActionData:(id)a13 displayedInHUD:(BOOL)a14 isThirdPartyDevSupportModeHang:(BOOL)a15 failReason:(int64_t *)a16;
+ (BOOL)saveTailSpinWithFileName:(id)a3 infoDictArray:(id)a4 startTime:(unint64_t)a5 endTime:(unint64_t)a6 processString:(id)a7 pid:(int)a8 requestType:(int64_t)a9 failReason:(int64_t *)a10;
+ (BOOL)saveTailspinForAllHangs;
+ (BOOL)saveTailspinForForceQuitProcessID:(int)a3 procName:(id)a4 procPath:(id)a5 filePath:(id *)a6;
+ (BOOL)saveTailspinWithFileName:(id)a3 path:(id)a4 infoDictArray:(id)a5 startTime:(unint64_t)a6 endTime:(unint64_t)a7 processString:(id)a8 pid:(int)a9 requestType:(int64_t)a10 includeOSSignposts:(BOOL)a11 failReason:(int64_t *)a12;
+ (void)collectTailspinAndUpdateTelemtry;
+ (void)incrementAppGeneratedLogsCountForDuration:(double)a3 procName:(id)a4 isFirstPartyApp:(BOOL)a5;
+ (void)incrementDailyFenceLogGenerationCount;
+ (void)incrementDailyLogGenerationCountForDuration:(double)a3 isFirstPartyApp:(BOOL)a4;
+ (void)initialize;
+ (void)notifyHTTailSpinResult:(BOOL)a3 failReason:(int64_t)a4 hangSubType:(int64_t)a5 htBugType:(int64_t)a6;
+ (void)refreshAppGeneratedLogsCount;
+ (void)refreshPerPeriodSentryLogCount;
+ (void)resetAppActivationTailspinCounts;
+ (void)resetDailyActivationTailspinCounts;
+ (void)resetDailyGeneratedLogsCounts;
+ (void)resetDailySentryTailspinCounts;
+ (void)resetLogCountsForDailyRollover;
+ (void)resetLogCountsForEPL;
+ (void)resetPerAppCounts;
+ (void)resetPerPeriodSentryTailspinCounts;
@end

@implementation HTTailspin

+ (void)initialize
{
  v2 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  v3 = (void *)qword_10005BD78;
  qword_10005BD78 = (uint64_t)v2;

  v4 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  v5 = (void *)qword_10005BD80;
  qword_10005BD80 = (uint64_t)v4;
}

+ (void)refreshAppGeneratedLogsCount
{
  uint64_t v3 = 0LL;
  v4 = &v3;
  uint64_t v5 = 0x3032000000LL;
  v6 = sub_100027D58;
  v7 = sub_100027D68;
  id v8 = 0LL;
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472LL;
  v2[2] = sub_100027D70;
  v2[3] = &unk_10004A7A8;
  v2[4] = &v3;
  [(id)qword_10005BD78 enumerateKeysAndObjectsUsingBlock:v2];
  if (v4[5]) {
    objc_msgSend((id)qword_10005BD78, "removeObjectsForKeys:");
  }
  _Block_object_dispose(&v3, 8);
}

+ (void)refreshPerPeriodSentryLogCount
{
  if (dword_10005BD74 >= 1)
  {
    --dword_10005BD74;
    id v2 = sub_1000233A4();
    uint64_t v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      v4[0] = 67109376;
      v4[1] = dword_10005BD74 + 1;
      __int16 v5 = 1024;
      int v6 = dword_10005BD74;
      _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_INFO,  "Per-period Sentry Generated Logs count decreased %u -> %u",  (uint8_t *)v4,  0xEu);
    }
  }

+ (void)resetLogCountsForEPL
{
  id v2 = sub_1000233A4();
  uint64_t v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_INFO,  "Generated log counts will be reset for EPL",  v4,  2u);
  }

  +[HTTailspin resetLogCountsForDailyRollover](&OBJC_CLASS___HTTailspin, "resetLogCountsForDailyRollover");
  +[HTTailspin resetDailySentryTailspinCounts](&OBJC_CLASS___HTTailspin, "resetDailySentryTailspinCounts");
  +[HTTailspin resetPerAppCounts](&OBJC_CLASS___HTTailspin, "resetPerAppCounts");
  +[HTTailspin resetPerPeriodSentryTailspinCounts](&OBJC_CLASS___HTTailspin, "resetPerPeriodSentryTailspinCounts");
}

+ (void)resetLogCountsForDailyRollover
{
  id v2 = sub_1000233A4();
  uint64_t v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Generated log counts will be reset ", v4, 2u);
  }

  +[HTTailspin resetDailyGeneratedLogsCounts](&OBJC_CLASS___HTTailspin, "resetDailyGeneratedLogsCounts");
  +[HTTailspin resetDailyActivationTailspinCounts](&OBJC_CLASS___HTTailspin, "resetDailyActivationTailspinCounts");
  +[HTTailspin resetAppActivationTailspinCounts](&OBJC_CLASS___HTTailspin, "resetAppActivationTailspinCounts");
}

+ (void)resetDailyGeneratedLogsCounts
{
  id v2 = sub_1000233A4();
  uint64_t v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int v12 = 67109376;
    int v13 = dword_10005BD58;
    __int16 v14 = 1024;
    int v15 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_INFO,  "Hang Micro Hang Logs Daily Generated count reset from %i to %i",  (uint8_t *)&v12,  0xEu);
  }

  id v4 = sub_1000233A4();
  __int16 v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v12 = 67109376;
    int v13 = dword_10005BD5C;
    __int16 v14 = 1024;
    int v15 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_INFO,  "Hang Short Logs Daily Generated count reset from %i to %i",  (uint8_t *)&v12,  0xEu);
  }

  id v6 = sub_1000233A4();
  v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v12 = 67109376;
    int v13 = dword_10005BD60;
    __int16 v14 = 1024;
    int v15 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "Hang Long Logs Daily Generated count reset from %i to %i",  (uint8_t *)&v12,  0xEu);
  }

  id v8 = sub_1000233A4();
  v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    int v12 = 67109376;
    int v13 = dword_10005BD64;
    __int16 v14 = 1024;
    int v15 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_INFO,  "Hang Third Party Logs Daily Generated count reset from %i to %i",  (uint8_t *)&v12,  0xEu);
  }

  id v10 = sub_1000233A4();
  v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    int v12 = 67109376;
    int v13 = dword_10005BD68;
    __int16 v14 = 1024;
    int v15 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_INFO,  "Fence Hang Logs Daily Generated count reset from %i to %i",  (uint8_t *)&v12,  0xEu);
  }

  dword_10005BD58 = 0;
  dword_10005BD5C = 0;
  dword_10005BD60 = 0;
  dword_10005BD64 = 0;
  dword_10005BD68 = 0;
}

+ (void)resetAppActivationTailspinCounts
{
  id v2 = sub_1000233A4();
  uint64_t v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "App activation tailspin count reset", v6, 2u);
  }

  id v4 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  __int16 v5 = (void *)qword_10005BD80;
  qword_10005BD80 = (uint64_t)v4;
}

+ (void)resetDailyActivationTailspinCounts
{
  id v2 = sub_1000233A4();
  uint64_t v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4[0] = 67109376;
    v4[1] = dword_10005BD6C;
    __int16 v5 = 1024;
    int v6 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_INFO,  "Launch Logs Daily Generated count reset from %i to %i",  (uint8_t *)v4,  0xEu);
  }

  dword_10005BD6C = 0;
}

+ (void)resetDailySentryTailspinCounts
{
  id v2 = sub_1000233A4();
  uint64_t v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4[0] = 67109376;
    v4[1] = dword_10005BD70;
    __int16 v5 = 1024;
    int v6 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_INFO,  "Sentry Tailspin count reset from %i to %i",  (uint8_t *)v4,  0xEu);
  }

  dword_10005BD70 = 0;
}

+ (void)resetPerPeriodSentryTailspinCounts
{
  id v2 = sub_1000233A4();
  uint64_t v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4[0] = 67109376;
    v4[1] = dword_10005BD74;
    __int16 v5 = 1024;
    int v6 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_INFO,  "Per-period Sentry Tailspin count reset from %i to %i",  (uint8_t *)v4,  0xEu);
  }

  dword_10005BD74 = 0;
}

+ (void)resetPerAppCounts
{
  id v2 = sub_1000233A4();
  uint64_t v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_INFO,  "Per-app activation and generated tailspin count reset",  v4,  2u);
  }

  [(id)qword_10005BD78 removeAllObjects];
  [(id)qword_10005BD80 removeAllObjects];
}

+ (BOOL)hasAppExceededGeneratedLogsCountForDuration:(double)a3 procName:(id)a4 isFirstPartyApp:(BOOL)a5
{
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](&OBJC_CLASS___HTPrefs, "sharedPrefs"));
  double v9 = (double)(unint64_t)[v8 runloopLongHangDurationThresholdMSec];

  if (v9 <= a3 && a5)
  {
    BOOL v10 = 0;
  }

  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue([(id)qword_10005BD78 objectForKeyedSubscript:v7]);
    int v12 = v11;
    if (v11)
    {
      unsigned int v13 = [v11 unsignedIntValue];
      __int16 v14 = (void *)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](&OBJC_CLASS___HTPrefs, "sharedPrefs"));
      BOOL v10 = v13 >= [v14 runLoopHangPerPeriodLogLimit];
    }

    else
    {
      BOOL v10 = 0;
    }
  }

  return v10;
}

+ (BOOL)hasExceededDailyLimit:(double)a3 isFirstPartyApp:(BOOL)a4
{
  if (a4)
  {
    __int16 v5 = (void *)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](&OBJC_CLASS___HTPrefs, "sharedPrefs"));
    double v6 = (double)(unint64_t)[v5 runloopLongHangDurationThresholdMSec];

    if (v6 <= a3)
    {
      int v20 = dword_10005BD60;
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](&OBJC_CLASS___HTPrefs, "sharedPrefs"));
      signed int v22 = [v21 runLoopLongHangDailyLogLimit];

      if (v20 >= v22)
      {
        id v23 = sub_1000233A4();
        unsigned int v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          __int16 v14 = (void *)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](&OBJC_CLASS___HTPrefs, "sharedPrefs"));
          int v29 = 67109120;
          unsigned int v30 = [v14 runLoopLongHangDailyLogLimit];
          int v15 = "Device has hit the Daily Generated Long Log limit of %u. Not saving a report!";
          goto LABEL_17;
        }

        goto LABEL_18;
      }
    }

    else
    {
      id v7 = (void *)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](&OBJC_CLASS___HTPrefs, "sharedPrefs"));
      double v8 = (double)(unint64_t)[v7 runloopHangDurationThresholdMSec];

      if (v8 <= a3)
      {
        int v24 = dword_10005BD5C;
        v25 = (void *)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](&OBJC_CLASS___HTPrefs, "sharedPrefs"));
        signed int v26 = [v25 runLoopHangDailyLogLimit];

        if (v24 >= v26)
        {
          id v28 = sub_1000233A4();
          unsigned int v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            __int16 v14 = (void *)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](&OBJC_CLASS___HTPrefs, "sharedPrefs"));
            int v29 = 67109120;
            unsigned int v30 = [v14 runLoopHangDailyLogLimit];
            int v15 = "Device has hit the Daily Generated Short Log limit of %u. Not saving a report!";
            goto LABEL_17;
          }

          goto LABEL_18;
        }
      }

      else
      {
        int v9 = dword_10005BD58;
        BOOL v10 = (void *)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](&OBJC_CLASS___HTPrefs, "sharedPrefs"));
        signed int v11 = [v10 runLoopMicroHangDailyLogLimit];

        if (v9 >= v11)
        {
          id v12 = sub_1000233A4();
          unsigned int v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            __int16 v14 = (void *)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](&OBJC_CLASS___HTPrefs, "sharedPrefs"));
            int v29 = 67109120;
            unsigned int v30 = [v14 runLoopMicroHangDailyLogLimit];
            int v15 = "Device has hit the Daily Generated Micro Log limit of %u. Not saving a report!";
LABEL_17:
            _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, v15, (uint8_t *)&v29, 8u);

            goto LABEL_18;
          }

          goto LABEL_18;
        }
      }
    }

    return 0;
  }

  int v16 = dword_10005BD64;
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](&OBJC_CLASS___HTPrefs, "sharedPrefs", a3));
  signed int v18 = [v17 runloopHangThirdPartyDailyLogLimit];

  if (v16 < v18) {
    return 0;
  }
  id v19 = sub_1000233A4();
  unsigned int v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v14 = (void *)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](&OBJC_CLASS___HTPrefs, "sharedPrefs"));
    int v29 = 67109120;
    unsigned int v30 = [v14 runloopHangThirdPartyDailyLogLimit];
    int v15 = "Device has hit the Daily Generated Third Party Log limit of %u. Not saving a report!";
    goto LABEL_17;
  }

+ (BOOL)hasExceededDailyFenceLogLimit
{
  int v2 = dword_10005BD68;
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](&OBJC_CLASS___HTPrefs, "sharedPrefs"));
  signed int v4 = [v3 fenceHangDailyLogLimit];

  if (v2 >= v4)
  {
    id v5 = sub_1000233A4();
    double v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = (void *)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](&OBJC_CLASS___HTPrefs, "sharedPrefs"));
      v9[0] = 67109120;
      v9[1] = [v7 fenceHangDailyLogLimit];
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Device has hit the Daily Generated Fence Log limit of %u. Not saving a report!",  (uint8_t *)v9,  8u);
    }
  }

  return v2 >= v4;
}

+ (void)incrementAppGeneratedLogsCountForDuration:(double)a3 procName:(id)a4 isFirstPartyApp:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a4;
  double v8 = (void *)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](&OBJC_CLASS___HTPrefs, "sharedPrefs"));
  double v9 = (double)(unint64_t)[v8 runloopLongHangDurationThresholdMSec];

  if (v9 > a3 || !v5)
  {
    signed int v11 = (os_log_s *)objc_claimAutoreleasedReturnValue([(id)qword_10005BD78 objectForKeyedSubscript:v7]);
    __int16 v14 = v11;
    if (v11) {
      unsigned int v12 = -[os_log_s unsignedIntValue](v11, "unsignedIntValue");
    }
    else {
      unsigned int v12 = 0;
    }
    int v16 = (void *)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](&OBJC_CLASS___HTPrefs, "sharedPrefs"));
    unsigned int v17 = [v16 runLoopHangPerPeriodLogLimit];

    if (v12 >= v17)
    {
      id v21 = sub_1000233A4();
      int v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        int v22 = 138412802;
        id v23 = v7;
        __int16 v24 = 1024;
        unsigned int v25 = v12;
        __int16 v26 = 1024;
        unsigned int v27 = v12;
        _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_INFO,  "%@ Generated Log count: %u -> %u",  (uint8_t *)&v22,  0x18u);
      }
    }

    else
    {
      id v18 = sub_1000233A4();
      id v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        int v22 = 138412802;
        id v23 = v7;
        __int16 v24 = 1024;
        unsigned int v25 = v12;
        __int16 v26 = 1024;
        unsigned int v27 = v12 + 1;
        _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_INFO,  "%@ Generated Log count: %u -> %u",  (uint8_t *)&v22,  0x18u);
      }

      int v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v12 + 1));
      [(id)qword_10005BD78 setObject:v20 forKeyedSubscript:v7];
    }
  }

  else
  {
    id v13 = sub_1000233A4();
    __int16 v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      int v22 = 138412290;
      id v23 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_INFO,  "%@ Generated Log count: Long Hang does not count towards per-app generated log count",  (uint8_t *)&v22,  0xCu);
    }
  }
}

+ (void)incrementDailyLogGenerationCountForDuration:(double)a3 isFirstPartyApp:(BOOL)a4
{
  if (a4)
  {
    BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](&OBJC_CLASS___HTPrefs, "sharedPrefs"));
    double v6 = (double)(unint64_t)[v5 runloopLongHangDurationThresholdMSec];

    if (v6 <= a3)
    {
      ++dword_10005BD60;
      id v13 = sub_1000233A4();
      BOOL v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        int v15 = 67109376;
        int v16 = dword_10005BD60 - 1;
        __int16 v17 = 1024;
        int v18 = dword_10005BD60;
        signed int v11 = "Daily Generated Long Log count: %i -> %i";
        goto LABEL_12;
      }
    }

    else
    {
      id v7 = (void *)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](&OBJC_CLASS___HTPrefs, "sharedPrefs"));
      double v8 = (double)(unint64_t)[v7 runloopHangDurationThresholdMSec];

      if (v8 <= a3)
      {
        ++dword_10005BD5C;
        id v14 = sub_1000233A4();
        BOOL v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          int v15 = 67109376;
          int v16 = dword_10005BD5C - 1;
          __int16 v17 = 1024;
          int v18 = dword_10005BD5C;
          signed int v11 = "Daily Generated Short Log count: %i -> %i";
          goto LABEL_12;
        }
      }

      else
      {
        ++dword_10005BD58;
        id v9 = sub_1000233A4();
        BOOL v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          int v15 = 67109376;
          int v16 = dword_10005BD58 - 1;
          __int16 v17 = 1024;
          int v18 = dword_10005BD58;
          signed int v11 = "Daily Generated Micro Hang Log count: %i -> %i";
LABEL_12:
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, v11, (uint8_t *)&v15, 0xEu);
        }
      }
    }
  }

  else
  {
    ++dword_10005BD64;
    id v12 = sub_1000233A4();
    BOOL v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      int v15 = 67109376;
      int v16 = dword_10005BD64 - 1;
      __int16 v17 = 1024;
      int v18 = dword_10005BD64;
      signed int v11 = "Daily Generated Third Party Log count: %i -> %i";
      goto LABEL_12;
    }
  }
}

+ (void)incrementDailyFenceLogGenerationCount
{
  id v2 = sub_1000233A4();
  uint64_t v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4[0] = 67109376;
    v4[1] = dword_10005BD68 - 1;
    __int16 v5 = 1024;
    int v6 = dword_10005BD68;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_INFO,  "Daily Generated Fence Hang Log count: %i -> %i",  (uint8_t *)v4,  0xEu);
  }
}

+ (void)notifyHTTailSpinResult:(BOOL)a3 failReason:(int64_t)a4 hangSubType:(int64_t)a5 htBugType:(int64_t)a6
{
  BOOL v9 = a3;
  BOOL v10 = (void *)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](&OBJC_CLASS___HTPrefs, "sharedPrefs"));
  signed int v11 = (__CFString *)objc_claimAutoreleasedReturnValue([v10 enablementPrefix]);

  if (!v11) {
    signed int v11 = &stru_10004A8D0;
  }
  id v12 = sub_1000233A4();
  id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    int v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v9));
    int v16 = sub_100018AB8(a4);
    __int16 v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    int v18 = sub_100018A78(a5);
    id v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
    *(_DWORD *)buf = 138413314;
    unsigned int v27 = @"EnablementType";
    __int16 v28 = 2112;
    int v29 = v11;
    __int16 v30 = 2112;
    v31 = v15;
    __int16 v32 = 2112;
    v33 = v17;
    __int16 v34 = 2112;
    v35 = v19;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEBUG,  "com.apple.hangtracer.hang_capture_tailspinV3 %@: %@, capture_success: %@, failure_reason: %@, subtype: %@\n",  buf,  0x34u);
  }

  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472LL;
  v20[2] = sub_10002944C;
  v20[3] = &unk_10004A7D0;
  BOOL v25 = v9;
  id v21 = v11;
  int64_t v22 = a4;
  int64_t v23 = a5;
  int64_t v24 = a6;
  id v14 = v11;
  AnalyticsSendEventLazy(@"com.apple.hangtracer.hang_capture_tailspin_v3", v20);
}

+ (BOOL)saveSentryTailspin:(id)a3 infoDict:(id)a4 startTime:(unint64_t)a5 endTime:(unint64_t)a6 error:(id *)a7
{
  id v9 = a4;
  BOOL v10 = off_10005B0C0;
  id v11 = a3;
  v61 = v9;
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:v10]);
  unsigned int v13 = [v12 isEqualToString:off_10005B0C8];
  id v14 = (void *)qword_10005BD40;
  int v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  int v16 = (void *)objc_claimAutoreleasedReturnValue([v14 stringFromDate:v15]);
  __int16 v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@-%@.%@",  v11,  v16,  @"tailspin"));

  int v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s",  "/var/root/Library/Caches/hangtracerd/tmp"));
  id v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s/%@",  "/var/root/Library/Caches/hangtracerd/spool",  v17));
  id v20 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString, "stringWithFormat:", @"%s/%@", "/var/root/Library/Caches/hangtracerd/tmp", v17));
  v58 = (char *)[v20 UTF8String];
  uint64_t v63 = 11LL;
  id v21 = (void *)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](&OBJC_CLASS___HTPrefs, "sharedPrefs"));
  LOBYTE(v11) = [v21 htTailspinEnabled];

  if ((v11 & 1) == 0)
  {
    if (!a7) {
      goto LABEL_32;
    }
    v48 = @"Tailspin is not enabled";
    uint64_t v49 = 1LL;
LABEL_31:
    id v50 = sub_100017C70(v49, (uint64_t)v48);
    LOBYTE(v39) = 0;
    *a7 = (id)objc_claimAutoreleasedReturnValue(v50);
    goto LABEL_33;
  }

  if (!sub_100026990())
  {
    if (!a7) {
      goto LABEL_32;
    }
    v48 = @"Tailspin is not present";
    uint64_t v49 = 2LL;
    goto LABEL_31;
  }

  v57 = v18;
  int v22 = dword_10005BD70;
  int64_t v23 = (void *)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](&OBJC_CLASS___HTPrefs, "sharedPrefs"));
  signed int v24 = [v23 signpostMonitoringDailyLogLimit];

  if (v22 >= v24)
  {
    int v18 = v57;
    if (a7)
    {
      v48 = @"Sentry has hit its daily tailspin limit";
LABEL_30:
      uint64_t v49 = 4LL;
      goto LABEL_31;
    }

+ (BOOL)saveActivationTailSpinWithType:(id)a3 reason:(id)a4 bundleID:(id)a5 pid:(int)a6 startTime:(unint64_t)a7 endTime:(unint64_t)a8 isThirdPartyDevSupportModeHang:(BOOL)a9
{
  uint64_t v11 = *(void *)&a6;
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  __int16 v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  [v17 timeIntervalSinceReferenceDate];
  unint64_t v19 = (unint64_t)(v18 * 1000.0);

  uint64_t v20 = mach_absolute_time();
  unint64_t v21 = (unint64_t)sub_100025798(v20);
  double v22 = sub_10002584C(a7 - v19 + v21);
  double v23 = sub_10002584C(a8 - v19 + v21);
  signed int v24 = (void *)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](&OBJC_CLASS___HTPrefs, "sharedPrefs"));
  LODWORD(a7) = [v24 htTailspinEnabled];

  if (!(_DWORD)a7)
  {
    id v31 = sub_1000233A4();
    __int16 v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
    if (!os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_15;
    }
    *(_DWORD *)buf = 138412290;
    *(void *)v58 = v16;
    __int16 v32 = "HangTracer tailspin support is disabled, not saving a report for %@ activation!";
LABEL_10:
    _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, v32, buf, 0xCu);
    goto LABEL_15;
  }

  if (!sub_100026990())
  {
    id v33 = sub_1000233A4();
    __int16 v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
    if (!os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_15;
    }
    *(_DWORD *)buf = 138412290;
    *(void *)v58 = v16;
    __int16 v32 = "Tried to save tailspin for %@ activation, but tailspin support is not present on this device!";
    goto LABEL_10;
  }

  if (sub_10002903C((uint64_t)v16))
  {
    id v25 = sub_1000233A4();
    __int16 v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      signed int v27 = (void *)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](&OBJC_CLASS___HTPrefs, "sharedPrefs"));
      *(_DWORD *)buf = 138412546;
      *(void *)v58 = v16;
      *(_WORD *)&v58[8] = 1024;
      unsigned int v59 = [v27 slowAppActivationPerAppMaxLogLimit];
      id v28 = "%@ is hit Generated Log limit of %u. Not saving a report!";
      int v29 = v26;
      uint32_t v30 = 18;
LABEL_14:
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, v28, buf, v30);

      goto LABEL_15;
    }

    goto LABEL_15;
  }

  int v34 = dword_10005BD6C;
  unint64_t v35 = (void *)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](&OBJC_CLASS___HTPrefs, "sharedPrefs"));
  signed int v36 = [v35 slowAppActivationDailyLogLimit];

  if (v34 > v36)
  {
    id v37 = sub_1000233A4();
    __int16 v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v37);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      signed int v27 = (void *)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](&OBJC_CLASS___HTPrefs, "sharedPrefs"));
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)v58 = [v27 slowAppActivationDailyLogLimit];
      id v28 = "Device has hit the Daily Generated Log limit of %u. Not saving a report!";
      int v29 = v26;
      uint32_t v30 = 8;
      goto LABEL_14;
    }

+ (BOOL)saveTailSpinForService:(id)a3 reason:(id)a4 processID:(int)a5 threadID:(unint64_t)a6 procName:(id)a7 procPath:(id)a8 startTime:(unint64_t)a9 endTime:(unint64_t)a10 blownFenceId:(unint64_t)a11 hangType:(int64_t)a12 userActionData:(id)a13 displayedInHUD:(BOOL)a14 isThirdPartyDevSupportModeHang:(BOOL)a15 failReason:(int64_t *)a16
{
  uint64_t v18 = *(void *)&a5;
  id v20 = a3;
  id v21 = a4;
  id v22 = a7;
  id v23 = a8;
  signed int v24 = (void *)qword_10005BD40;
  id v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  __int16 v26 = (void *)objc_claimAutoreleasedReturnValue([v24 stringFromDate:v25]);
  uint64_t v47 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@-%@-%@.%@",  v20,  v22,  v26,  @"tailspin"));

  uint64_t v53 = sub_100018B74(v20);
  signed int v27 = objc_alloc_init(&OBJC_CLASS___NSUUID);
  id v54 = (void *)objc_claimAutoreleasedReturnValue(-[NSUUID UUIDString](v27, "UUIDString"));

  id v28 = (void *)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](&OBJC_CLASS___HTPrefs, "sharedPrefs"));
  uint64_t v29 = objc_claimAutoreleasedReturnValue([v28 enablementPrefix]);

  uint64_t v55 = (__CFString *)v29;
  if (!v29) {
    uint64_t v55 = &stru_10004A8D0;
  }
  v56[0] = @"Reason";
  v56[1] = @"ServiceName";
  v51 = v21;
  id v52 = v20;
  v57[0] = v21;
  v57[1] = v20;
  uint64_t v49 = v23;
  v57[2] = v23;
  v56[2] = @"ProcessPath";
  v56[3] = @"PID";
  unsigned int v50 = v18;
  v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v18));
  v57[3] = v46;
  v56[4] = @"ThreadID";
  id v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a6));
  v57[4] = v45;
  v56[5] = @"StartTime";
  id v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a9));
  v57[5] = v44;
  v56[6] = @"EndTime";
  uint32_t v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a10));
  v57[6] = v30;
  v56[7] = @"HangType";
  id v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a12));
  v57[7] = v31;
  v56[8] = @"DisplayData";
  __int16 v32 = (void *)objc_claimAutoreleasedReturnValue(+[HTProcessInfo displayStateArray](&OBJC_CLASS___HTProcessInfo, "displayStateArray"));
  v57[8] = v32;
  v56[9] = @"NetworkState";
  id v33 = (void *)objc_claimAutoreleasedReturnValue(+[HTNetworkInfo networkStateForTailSpin](&OBJC_CLASS___HTNetworkInfo, "networkStateForTailSpin"));
  int v34 = v33;
  if (!v33) {
    int v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
  }
  v57[9] = v34;
  v57[10] = v54;
  v56[10] = @"HangUUID";
  v56[11] = @"EnablementType";
  v57[11] = v55;
  v56[12] = @"DisplayedInHUD";
  unint64_t v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", a14));
  v57[12] = v35;
  v56[13] = @"IsThirdPartyDevSupportModeHang";
  signed int v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", a15));
  v57[13] = v36;
  id v37 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v57,  v56,  14LL));
  BOOL v38 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithDictionary:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithDictionary:",  v37));

  if (!v33) {
  if (v53 == 1)
  }
  {
    BOOL v39 = (void *)objc_claimAutoreleasedReturnValue(+[HTProcessInfo recentAppsDict](&OBJC_CLASS___HTProcessInfo, "recentAppsDict"));
    [v38 setObject:v39 forKeyedSubscript:@"RecentAppsDict"];
  }

  if (a12 == 5)
  {
    id v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a11));
    [v38 setObject:v40 forKeyedSubscript:@"CAFenceId"];
  }

  v41 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  -[NSMutableArray addObject:](v41, "addObject:", v38);
  BOOL v42 = +[HTTailspin saveTailSpinWithFileName:infoDictArray:startTime:endTime:processString:pid:requestType:failReason:]( &OBJC_CLASS___HTTailspin,  "saveTailSpinWithFileName:infoDictArray:startTime:endTime:processString:pid:requestType:failReason:",  v47,  v41,  a9,  a10,  v22,  v50,  v53,  a16);

  return v42;
}

+ (void)collectTailspinAndUpdateTelemtry
{
  unint64_t v2 = +[HTHangInfo numberOfHangs](&OBJC_CLASS___HTHangInfo, "numberOfHangs");
  id v3 = sub_1000233A4();
  signed int v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_INFO);
  if (v2)
  {
    if (v5)
    {
      int v26 = 134217984;
      unint64_t v27 = +[HTHangInfo numberOfHangs](&OBJC_CLASS___HTHangInfo, "numberOfHangs");
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_INFO,  "Collecting tailspin for a sequence of %lu hang(s)\n",  (uint8_t *)&v26,  0xCu);
    }

    BOOL v6 = +[HTTailspin saveTailspinForAllHangs](&OBJC_CLASS___HTTailspin, "saveTailspinForAllHangs");
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[HTHangInfo firstHang](&OBJC_CLASS___HTHangInfo, "firstHang"));
    signed int v4 = v7;
    if (v7)
    {
      BOOL v8 = sub_100018AA8((uint64_t)-[os_log_s hangSubType](v7, "hangSubType"));
      BOOL v9 = v8;
      if (v6)
      {
        if (v8)
        {
          +[HTTailspin incrementDailyFenceLogGenerationCount]( &OBJC_CLASS___HTTailspin,  "incrementDailyFenceLogGenerationCount");
          +[HTHangInfo cleanupAllHangs](&OBJC_CLASS___HTHangInfo, "cleanupAllHangs");
LABEL_14:
          id v12 = -[os_log_s failReason](v4, "failReason");
          id v13 = -[os_log_s hangSubType](v4, "hangSubType");
          BOOL v14 = v6;
          id v15 = v12;
          uint64_t v16 = 0LL;
LABEL_17:
          +[HTTailspin notifyHTTailSpinResult:failReason:hangSubType:htBugType:]( &OBJC_CLASS___HTTailspin,  "notifyHTTailSpinResult:failReason:hangSubType:htBugType:",  v14,  v15,  v13,  v16);
          goto LABEL_18;
        }

        -[os_log_s hangDurationMS](v4, "hangDurationMS");
        double v18 = v17;
        unint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s processName](v4, "processName"));
        +[HTTailspin incrementAppGeneratedLogsCountForDuration:procName:isFirstPartyApp:]( &OBJC_CLASS___HTTailspin,  "incrementAppGeneratedLogsCountForDuration:procName:isFirstPartyApp:",  v19,  -[os_log_s isFirstPartyApp](v4, "isFirstPartyApp"),  v18);

        -[os_log_s hangDurationMS](v4, "hangDurationMS");
        +[HTTailspin incrementDailyLogGenerationCountForDuration:isFirstPartyApp:]( &OBJC_CLASS___HTTailspin,  "incrementDailyLogGenerationCountForDuration:isFirstPartyApp:",  -[os_log_s isFirstPartyApp](v4, "isFirstPartyApp"),  v20);
        +[HTHangInfo cleanupAllHangs](&OBJC_CLASS___HTHangInfo, "cleanupAllHangs");
      }

      else
      {
        +[HTHangInfo cleanupAllHangs](&OBJC_CLASS___HTHangInfo, "cleanupAllHangs");
        if (v9) {
          goto LABEL_14;
        }
      }

      int v21 = -[os_log_s isFirstPartyApp](v4, "isFirstPartyApp");
      int v22 = -[os_log_s isThirdPartyDevSupportModeHang](v4, "isThirdPartyDevSupportModeHang");
      -[os_log_s hangDurationMS](v4, "hangDurationMS");
      uint64_t v24 = sub_100018ADC(v21, v22, v23);
      id v25 = -[os_log_s failReason](v4, "failReason");
      id v13 = -[os_log_s hangSubType](v4, "hangSubType");
      BOOL v14 = v6;
      id v15 = v25;
      uint64_t v16 = v24;
      goto LABEL_17;
    }

    id v10 = sub_1000233A4();
    uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      LOWORD(v26) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_INFO,  "No hangs found to update telemetry\n",  (uint8_t *)&v26,  2u);
    }
  }

  else if (v5)
  {
    LOWORD(v26) = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_INFO,  "collectTailspinAndUpdateTelemtry: No hangs found, not collecting tailspin\n",  (uint8_t *)&v26,  2u);
  }

+ (BOOL)saveTailspinForAllHangs
{
  if (!+[HTHangInfo numberOfHangs](&OBJC_CLASS___HTHangInfo, "numberOfHangs")) {
    return 0;
  }
  id v2 = (id)objc_claimAutoreleasedReturnValue(+[HTHangInfo firstHang](&OBJC_CLASS___HTHangInfo, "firstHang"));
  uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue([v2 processName]);
  unsigned int v28 = [v2 pid];
  uint64_t v38 = 11LL;
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 serviceName]);
  signed int v4 = (void *)objc_claimAutoreleasedReturnValue([v2 processName]);
  BOOL v5 = (void *)qword_10005BD40;
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 stringFromDate:v6]);
  BOOL v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@-%@-%@.%@",  v3,  v4,  v7,  @"tailspin"));

  BOOL v9 = (void *)objc_claimAutoreleasedReturnValue([v2 serviceName]);
  uint64_t v10 = sub_100018B74(v9);

  uint64_t v11 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v34 = 0u;
  __int128 v35 = 0u;
  __int128 v36 = 0u;
  __int128 v37 = 0u;
  id v12 = (void *)objc_claimAutoreleasedReturnValue(+[HTHangInfo allHangs](&OBJC_CLASS___HTHangInfo, "allHangs"));
  id v13 = [v12 countByEnumeratingWithState:&v34 objects:v40 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v35;
    do
    {
      for (i = 0LL; i != v14; i = (char *)i + 1)
      {
        if (*(void *)v35 != v15) {
          objc_enumerationMutation(v12);
        }
        double v17 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v34 + 1) + 8 * (void)i) infoDict]);
        -[NSMutableArray addObject:](v11, "addObject:", v17);
      }

      id v14 = [v12 countByEnumeratingWithState:&v34 objects:v40 count:16];
    }

    while (v14);
  }

  unint64_t v18 = +[HTHangInfo hangSequenceStartTime](&OBJC_CLASS___HTHangInfo, "hangSequenceStartTime");
  unint64_t v19 = (unint64_t)sub_10002584C(0x7D0uLL);
  if (v18 <= v19) {
    unint64_t v19 = 0LL;
  }
  BOOL v20 = +[HTTailspin saveTailSpinWithFileName:infoDictArray:startTime:endTime:processString:pid:requestType:failReason:]( &OBJC_CLASS___HTTailspin,  "saveTailSpinWithFileName:infoDictArray:startTime:endTime:processString:pid:requestType:failReason:",  v8,  v11,  v18 - v19,  +[HTHangInfo hangSequenceEndTime](&OBJC_CLASS___HTHangInfo, "hangSequenceEndTime"),  v29,  v28,  v10,  &v38);
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  int v21 = (void *)objc_claimAutoreleasedReturnValue(+[HTHangInfo allHangs](&OBJC_CLASS___HTHangInfo, "allHangs"));
  id v22 = [v21 countByEnumeratingWithState:&v30 objects:v39 count:16];
  if (v22)
  {
    id v23 = v22;
    uint64_t v24 = *(void *)v31;
    do
    {
      id v25 = 0LL;
      int v26 = v2;
      do
      {
        if (*(void *)v31 != v24) {
          objc_enumerationMutation(v21);
        }
        id v2 = *(id *)(*((void *)&v30 + 1) + 8LL * (void)v25);

        [v2 setFailReason:v38];
        id v25 = (char *)v25 + 1;
        int v26 = v2;
      }

      while (v23 != v25);
      id v23 = [v21 countByEnumeratingWithState:&v30 objects:v39 count:16];
    }

    while (v23);
  }

  return v20;
}

+ (BOOL)saveTailSpinWithFileName:(id)a3 infoDictArray:(id)a4 startTime:(unint64_t)a5 endTime:(unint64_t)a6 processString:(id)a7 pid:(int)a8 requestType:(int64_t)a9 failReason:(int64_t *)a10
{
  id v12 = a7;
  id v13 = a4;
  id v14 = a3;
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s",  "/var/root/Library/Caches/hangtracerd/tmp"));
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s/%@",  "/var/root/Library/Caches/hangtracerd/spool",  v14));
  double v17 = v12;
  id v18 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString, "stringWithFormat:", @"%s/%@", "/var/root/Library/Caches/hangtracerd/tmp", v14));
  unint64_t v19 = (const char *)[v18 UTF8String];
  LOBYTE(v31) = 0;
  LODWORD(v30) = a8;
  BOOL v20 = +[HTTailspin saveTailspinWithFileName:path:infoDictArray:startTime:endTime:processString:pid:requestType:includeOSSignposts:failReason:]( &OBJC_CLASS___HTTailspin,  "saveTailspinWithFileName:path:infoDictArray:startTime:endTime:processString:pid:requestType:includeOSSignposts:failReason:",  v14,  v15,  v13,  a5,  a6,  v12,  v30,  a9,  v31,  a10);

  if (v20)
  {
    int v21 = v19;
    id v22 = sub_1000233A4();
    id v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      __int128 v37 = v17;
      __int16 v38 = 2114;
      id v39 = v16;
      _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEFAULT,  "%{public}@: Moving tailspin to spool: %{public}@\n",  buf,  0x16u);
    }

    uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    id v35 = 0LL;
    unsigned __int8 v25 = [v24 moveItemAtPath:v18 toPath:v16 error:&v35];
    id v26 = v35;

    if ((v25 & 1) == 0)
    {
      id v27 = sub_1000233A4();
      unsigned int v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        __int128 v37 = v17;
        __int16 v38 = 2114;
        id v39 = v26;
        _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_DEFAULT,  "%{public}@: Unable to move tailspin to final path: %{public}@",  buf,  0x16u);
      }

      *a10 = 13LL;
      unlink(v21);
    }
  }

  else
  {
    unlink(v19);
    id v26 = 0LL;
  }

  return v20;
}

+ (BOOL)saveTailspinForForceQuitProcessID:(int)a3 procName:(id)a4 procPath:(id)a5 filePath:(id *)a6
{
  uint64_t v7 = *(void *)&a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = (void *)qword_10005BD40;
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v10 stringFromDate:v11]);
  id v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"ForceQuit-%@-%@.%@",  v8,  v12,  @"tailspin"));

  id v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@/%@",  @"/var/mobile/Library/Logs/CrashReporter/DiagnosticLogs/ForceQuit/",  v13));
  __int128 v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  v42[0] = @"Reason";
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"ForceQuit-%@", v8));
  v43[0] = v15;
  v43[1] = v9;
  __int128 v32 = v9;
  v42[1] = @"ProcessPath";
  v42[2] = @"PID";
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v7));
  v43[2] = v16;
  v42[3] = @"NetworkState";
  double v17 = (void *)objc_claimAutoreleasedReturnValue(+[HTNetworkInfo networkStateForTailSpin](&OBJC_CLASS___HTNetworkInfo, "networkStateForTailSpin"));
  id v18 = v17;
  if (!v17) {
    id v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
  }
  v43[3] = v18;
  unint64_t v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v43,  v42,  4LL));
  BOOL v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithDictionary:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithDictionary:",  v19));

  if (!v17) {
  int v21 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  }
  -[NSMutableArray addObject:](v21, "addObject:", v20);
  id v22 = v14;
  *a6 = v22;
  uint64_t v35 = 11LL;
  LOBYTE(v30) = 1;
  LODWORD(v29) = v7;
  if (!+[HTTailspin saveTailspinWithFileName:path:infoDictArray:startTime:endTime:processString:pid:requestType:includeOSSignposts:failReason:]( &OBJC_CLASS___HTTailspin,  "saveTailspinWithFileName:path:infoDictArray:startTime:endTime:processString:pid:requestType:includeOSSignposts:failReason:",  v13,  @"/var/root/Library/Caches/hangtracerd/tmp",  v21,  0LL,  0LL,  v8,  v29,  4LL,  v30,  &v35)) {
    goto LABEL_10;
  }
  BOOL v23 = 1;
  sub_100017CE8(@"/var/mobile/Library/Logs/CrashReporter/DiagnosticLogs/ForceQuit/", 1);
  uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s/%@",  "/var/root/Library/Caches/hangtracerd/tmp",  v13));
  id v34 = 0LL;
  [v33 moveItemAtPath:v24 toPath:v22 error:&v34];
  id v25 = v34;

  if (v25)
  {
    *a6 = 0LL;
    id v26 = sub_1000233A4();
    id v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      __int128 v37 = "/var/root/Library/Caches/hangtracerd/tmp";
      __int16 v38 = 2112;
      id v39 = v13;
      __int16 v40 = 2112;
      id v41 = v25;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "failed to move %s/%@: %@", buf, 0x20u);
    }

LABEL_10:
    BOOL v23 = 0;
    *a6 = 0LL;
  }

  return v23;
}

+ (BOOL)saveTailspinWithFileName:(id)a3 path:(id)a4 infoDictArray:(id)a5 startTime:(unint64_t)a6 endTime:(unint64_t)a7 processString:(id)a8 pid:(int)a9 requestType:(int64_t)a10 includeOSSignposts:(BOOL)a11 failReason:(int64_t *)a12
{
  id v15 = a3;
  id v16 = a5;
  id v17 = a8;
  id v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@/%@", a4, v15));
  id v19 = sub_1000233A4();
  BOOL v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v86 = (uint64_t)v18;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Attempting to save tailspin at %@", buf, 0xCu);
  }

  id v21 = v18;
  id v22 = (const char *)[v21 cStringUsingEncoding:4];
  uint64_t v23 = open_dprotected_np(v22, 514, 4, 0, 420LL);
  id v24 = sub_1000233A4();
  id v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
  BOOL v26 = os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT);
  if ((v23 & 0x80000000) == 0)
  {
    if (v26)
    {
      *(_DWORD *)buf = 138412546;
      uint64_t v86 = (uint64_t)v21;
      __int16 v87 = 1024;
      *(_DWORD *)v88 = v23;
      _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "Will request tailspin at: %@, fd: %i",  buf,  0x12u);
    }

    id v84 = 0LL;
    uint64_t v27 = objc_claimAutoreleasedReturnValue( +[NSJSONSerialization dataWithJSONObject:options:error:]( &OBJC_CLASS___NSJSONSerialization,  "dataWithJSONObject:options:error:",  v16,  0LL,  &v84));
    double v76 = COERCE_DOUBLE(v84);
    v77 = (void *)v27;
    if (!v27)
    {
      id v32 = sub_1000233A4();
      __int128 v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
      double v34 = v76;
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543874;
        uint64_t v86 = (uint64_t)v17;
        __int16 v87 = 2114;
        *(void *)v88 = v16;
        *(_WORD *)&v88[8] = 2114;
        double v89 = v76;
        _os_log_impl( (void *)&_mh_execute_header,  v33,  OS_LOG_TYPE_DEFAULT,  "%{public}@: Unable to serialize Info Dict into JSON: %{public}@ - %{public}@\n",  buf,  0x20u);
      }

      unlink(v22);
      close(v23);
      BOOL v31 = 0;
      *a12 = 7LL;
      goto LABEL_52;
    }

    v73 = -[NSString initWithData:encoding:](objc_alloc(&OBJC_CLASS___NSString), "initWithData:encoding:", v27, 4LL);
    if (v73)
    {
      unsigned int v28 = (void *)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](&OBJC_CLASS___HTPrefs, "sharedPrefs"));
      uint64_t v72 = (uint64_t)v17;
      if ([v28 isInternal])
      {
        unsigned int v71 = 0;
      }

      else
      {
        __int128 v37 = (void *)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](&OBJC_CLASS___HTPrefs, "sharedPrefs"));
        unsigned int v71 = [v37 shouldUploadToDiagPipe];
      }

      id v70 = v15;

      id v38 = sub_1000233A4();
      id v39 = (os_log_s *)objc_claimAutoreleasedReturnValue(v38);
      if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
      {
        __int16 v40 = (void *)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](&OBJC_CLASS___HTPrefs, "sharedPrefs"));
        unsigned int v41 = [v40 isInternal] ^ 1;
        BOOL v42 = (void *)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](&OBJC_CLASS___HTPrefs, "sharedPrefs"));
        unsigned int v43 = [v42 shouldUploadToDiagPipe];
        *(_DWORD *)buf = 138544130;
        uint64_t v86 = v72;
        __int16 v87 = 1024;
        *(_DWORD *)v88 = v71;
        *(_WORD *)&v88[4] = 1024;
        *(_DWORD *)&v88[6] = v41;
        LOWORD(v89) = 1024;
        *(_DWORD *)((char *)&v89 + 2) = v43;
        _os_log_impl( (void *)&_mh_execute_header,  v39,  OS_LOG_TYPE_INFO,  "%{public}@: Tailspin filepaths will be scrubbed: %{BOOL}d (Customer build: %{BOOL}d, DiagnosticPipeline upload enabled: %{BOOL}d)",  buf,  0x1Eu);
      }

      __int128 v82 = 0u;
      __int128 v83 = 0u;
      __int128 v80 = 0u;
      __int128 v81 = 0u;
      id v44 = v16;
      id v45 = [v44 countByEnumeratingWithState:&v80 objects:v94 count:16];
      if (v45)
      {
        id v46 = v45;
        id v69 = v21;
        uint64_t v47 = *(void *)v81;
        while (2)
        {
          for (i = 0LL; i != v46; i = (char *)i + 1)
          {
            if (*(void *)v81 != v47) {
              objc_enumerationMutation(v44);
            }
            uint64_t v49 = *(void **)(*((void *)&v80 + 1) + 8LL * (void)i);
            unsigned int v50 = (void *)objc_claimAutoreleasedReturnValue([v49 objectForKeyedSubscript:@"isFirstPartyApp"]);
            unsigned __int8 v51 = [v50 BOOLValue];

            id v52 = (void *)objc_claimAutoreleasedReturnValue([v49 objectForKeyedSubscript:@"IsThirdPartyDevSupportModeHang"]);
            unsigned int v53 = [v52 BOOLValue];

            if ((v51 & 1) != 0 || !v53)
            {
              id v55 = sub_1000233A4();
              uint64_t v56 = (os_log_s *)objc_claimAutoreleasedReturnValue(v55);
              id v17 = (id)v72;
              if (os_log_type_enabled(v56, OS_LOG_TYPE_DEBUG)) {
                sub_10002D770(v72, v56);
              }

              uint64_t v54 = 1LL;
              id v15 = v70;
              goto LABEL_35;
            }
          }

          id v46 = [v44 countByEnumeratingWithState:&v80 objects:v94 count:16];
          if (v46) {
            continue;
          }
          break;
        }

        uint64_t v54 = 0LL;
        id v15 = v70;
        id v17 = (id)v72;
LABEL_35:
        id v21 = v69;
      }

      else
      {
        uint64_t v54 = 0LL;
        id v17 = (id)v72;
      }

      uint64_t v57 = mach_absolute_time();
      if (!a7 || qword_10005BD38 <= a7)
      {
        sub_10000BF24(a10, a6, a7, v57, 0);
        qword_10005BD38 = v57;
        v65 = v73;
        if ((sub_1000269D8(v23, a6, a7, (uint64_t)v73, a9, a11, v54, v71) & 1) != 0)
        {
          *a12 = 0LL;
          BOOL v31 = 1;
        }

        else
        {
          id v66 = sub_1000233A4();
          uint64_t v67 = (os_log_s *)objc_claimAutoreleasedReturnValue(v66);
          if (os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl( (void *)&_mh_execute_header,  v67,  OS_LOG_TYPE_DEFAULT,  "libtailspin: tailspin_dump_output_with_options_sync() failed to dump tailspin",  buf,  2u);
          }

          BOOL v31 = 0;
          *a12 = 12LL;
        }

        double v34 = v76;
        goto LABEL_51;
      }

      id v58 = sub_1000233A4();
      unsigned int v59 = (os_log_s *)objc_claimAutoreleasedReturnValue(v58);
      if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        uint64_t v86 = (uint64_t)v17;
        _os_log_impl( (void *)&_mh_execute_header,  v59,  OS_LOG_TYPE_DEFAULT,  "%{public}@: Tailspin Request Denied because tailspin-buffer has been dumped since this hang ended -> it won't have any trace data for this hang\n",  buf,  0xCu);
      }

      float v60 = sub_100025798(qword_10005BD38 - a7);
      id v61 = sub_1000233A4();
      id v62 = (os_log_s *)objc_claimAutoreleasedReturnValue(v61);
      double v34 = v76;
      if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
      {
        double v63 = sub_1000257EC(v57 - a7);
        double v64 = sub_1000257EC(v57 - qword_10005BD38);
        *(_DWORD *)buf = 138544386;
        uint64_t v86 = (uint64_t)v15;
        __int16 v87 = 2114;
        *(void *)v88 = v17;
        *(_WORD *)&v88[8] = 2048;
        double v89 = (float)(v60 / 1000.0);
        __int16 v90 = 2048;
        double v91 = v63;
        __int16 v92 = 2048;
        double v93 = v64;
        _os_log_impl( (void *)&_mh_execute_header,  v62,  OS_LOG_TYPE_DEFAULT,  "Tailspin Request Denied: tailspin-buffer will not contain relevant trace data for the time-range of this reque st due to recent tailspin-capture\n Filename: %{public}@, Process: %{public}@, Time Between Recent Tailspin Capture and Hang EndTim e: %f secs, Hang EndTime: %f secs ago, Recent Tailspin Capture: %f secs ago\n",  buf,  0x34u);
      }

      *a12 = 9LL;
      v78[0] = _NSConcreteStackBlock;
      v78[1] = 3221225472LL;
      v78[2] = sub_10002BAA4;
      v78[3] = &unk_10004A7F0;
      float v79 = v60;
      v78[4] = a10;
      v78[5] = v57;
      v78[6] = a7;
      AnalyticsSendEventLazy(@"com.apple.hangtracer.tailspins.denied_request", v78);
      sub_10000BF24(a10, a6, a7, v57, 1);
      BOOL v31 = 0;
    }

    else
    {
      id v35 = sub_1000233A4();
      __int128 v36 = (os_log_s *)objc_claimAutoreleasedReturnValue(v35);
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        uint64_t v86 = (uint64_t)v17;
        __int16 v87 = 2114;
        *(void *)v88 = v16;
        _os_log_impl( (void *)&_mh_execute_header,  v36,  OS_LOG_TYPE_DEFAULT,  "%{public}@: Unable to create UTF8 string from JSON: %{public}@\n",  buf,  0x16u);
      }

      *a12 = 8LL;
      unlink(v22);
      BOOL v31 = 0;
      double v34 = v76;
    }

    v65 = v73;
LABEL_51:
    close(v23);

LABEL_52:
    goto LABEL_53;
  }

  if (v26)
  {
    uint64_t v29 = __error();
    *(double *)&uint64_t v30 = COERCE_DOUBLE(strerror(*v29));
    *(_DWORD *)buf = 138543874;
    uint64_t v86 = (uint64_t)v17;
    __int16 v87 = 2114;
    *(void *)v88 = v21;
    *(_WORD *)&v88[8] = 2080;
    double v89 = *(double *)&v30;
    _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "%{public}@: Could not create file - won't take a tailspin: %{public}@ %s",  buf,  0x20u);
  }

  BOOL v31 = 0;
  *a12 = 10LL;
LABEL_53:

  return v31;
}

@end
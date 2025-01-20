@interface BatteryDataCollectionManager
- (BatteryDataCollectionManager)init;
- (void)dealloc;
- (void)start;
- (void)stop;
- (void)systemTimeChanged;
@end

@implementation BatteryDataCollectionManager

- (BatteryDataCollectionManager)init
{
  v79.receiver = self;
  v79.super_class = (Class)&OBJC_CLASS___BatteryDataCollectionManager;
  v2 = -[BatteryDataCollectionManager init](&v79, "init");
  if (!v2)
  {
    v28 = (os_log_s *)qword_100067748;
    if (os_log_type_enabled((os_log_t)qword_100067748, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "Super init failed", buf, 2u);
    }

    return 0LL;
  }

  v72 = v2;
  qword_100066ED8 = -[NSDictionary initWithObjectsAndKeys:]( objc_alloc(&OBJC_CLASS___NSDictionary),  "initWithObjectsAndKeys:",  &off_1000604F8,  @"ChemID",  &off_100060510,  @"AlgoChemID",  &off_100060528,  @"Serial",  &off_100060540,  @"WeightedRa",  &off_100060558,  @"Qmax",  &off_100060570,  @"CycleCount",  &off_100060588,  @"ISS",  &off_1000605A0,  @"RaTableRaw",  &off_1000605B8,  @"CellVoltage",  &off_1000605D0,  @"PresentDOD",  &off_1000605E8,  @"Voltage",  &off_100060600,  @"StateOfCharge",  &off_100060618,  @"ChargeAccum",  &off_100060630,  @"ResScale",  &off_100060648,  @"RSS",  &off_100060660,  @"ITMiscStatus",  &off_100060678,  @"MiscStatus",  &off_100060690,  @"TimeAtHighSoc",  &off_1000606A8,  @"LowVoltageResidencyCounters",  &off_1000606C0,  @"TotalOperatingTime",  &off_1000606D8,  @"ChargingVoltage",  &off_1000606F0,  @"VacVoltageLimit",  &off_100060708,  @"NotChargingReason",  &off_100060720,
                      @"AccumulatedSystemPowerIn",
                      &off_100060738,
                      @"AccumulatedSystemLoad",
                      &off_100060750,
                      @"SystemVoltageIn",
                      &off_100060768,
                      @"SystemCurrentIn",
                      &off_100060780,
                      @"FamilyCode",
                      &off_100060798,
                      @"Watts",
                      &__NSArray0__struct,
                      @"Temperature",
                      &__NSArray0__struct);
  qword_100066EE0 = -[NSArray initWithObjects:]( objc_alloc(&OBJC_CLASS___NSArray),  "initWithObjects:",  @"Qmax",  @"PresentDOD",  @"CellVoltage",  @"RaTableRaw",  0LL);
  contexta = objc_alloc(&OBJC_CLASS___NSDictionary);
  v140[0] = +[NSNull null](&OBJC_CLASS___NSNull, "null");
  v140[1] = +[NSNull null](&OBJC_CLASS___NSNull, "null");
  *(void *)out_token = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v140, 2LL);
  v139[0] = +[NSNull null](&OBJC_CLASS___NSNull, "null");
  v139[1] = +[NSNull null](&OBJC_CLASS___NSNull, "null");
  v142 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v139, 2LL);
  v138[0] = +[NSNull null](&OBJC_CLASS___NSNull, "null");
  v138[1] = +[NSNull null](&OBJC_CLASS___NSNull, "null");
  v143 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v138, 2LL);
  v69 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", out_token, 3LL);
  v136[0] = @"DailyCollectionPeriodOverride_ms";
  v136[1] = &off_100060200;
  v137[0] = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v136, 2LL);
  v135[0] = @"DailyRetentionPeriodOverride_s";
  v135[1] = &off_100060218;
  v137[1] = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v135, 2LL);
  v134[0] = @"DailyCollationPeriodOverride_s";
  v134[1] = &off_100060230;
  v137[2] = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v134, 2LL);
  v3 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v137, 3LL);
  v132[0] = @"WeeklyCollectionPeriodOverride_ms";
  v132[1] = &off_100060248;
  v133[0] = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v132, 2LL);
  v131[0] = @"WeeklyRetentionPeriodOverride_s";
  v131[1] = &off_100060218;
  v133[1] = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v131, 2LL);
  v130[0] = @"WeeklyCollationPeriodOverride_s";
  v130[1] = &off_100060230;
  v133[2] = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v130, 2LL);
  v4 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v133, 3LL);
  v128[0] = @"SBCCollectionPeriodOverride_ms";
  v128[1] = &off_100060260;
  v129[0] = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v128, 2LL);
  v127[0] = @"SBCRetentionPeriodOverride_s";
  v127[1] = &off_100060278;
  v129[1] = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v127, 2LL);
  v126[0] = @"SBCCollationPeriodOverride_s";
  v126[1] = &off_100060290;
  v129[2] = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v126, 2LL);
  v5 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v129, 3LL);
  v124[0] = +[NSNull null](&OBJC_CLASS___NSNull, "null");
  v124[1] = +[NSNull null](&OBJC_CLASS___NSNull, "null");
  v125[0] = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v124, 2LL);
  v123[0] = @"OBCRetentionPeriodOverride_s";
  v123[1] = &off_100060278;
  v125[1] = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v123, 2LL);
  v122[0] = @"OBCCollationPeriodOverride_s";
  v122[1] = &off_100060230;
  v125[2] = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v122, 2LL);
  v6 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v125, 3LL);
  v120[0] = @"AMACollectionPeriodOverride_ms";
  v120[1] = &off_100060260;
  v121[0] = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v120, 2LL);
  v119[0] = +[NSNull null](&OBJC_CLASS___NSNull, "null");
  v119[1] = +[NSNull null](&OBJC_CLASS___NSNull, "null");
  v121[1] = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v119, 2LL);
  v118[0] = +[NSNull null](&OBJC_CLASS___NSNull, "null");
  v118[1] = +[NSNull null](&OBJC_CLASS___NSNull, "null");
  v121[2] = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v118, 2LL);
  v7 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v121, 3LL);
  v116[0] = +[NSNull null](&OBJC_CLASS___NSNull, "null");
  v116[1] = +[NSNull null](&OBJC_CLASS___NSNull, "null");
  v117[0] = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v116, 2LL);
  v115[0] = @"SmartChargingRetentionPeriodOverride_s";
  v115[1] = &off_100060278;
  v117[1] = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v115, 2LL);
  v114[0] = @"SmartChargingCollationPeriodOverride_s";
  v114[1] = &off_100060230;
  v117[2] = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v114, 2LL);
  qword_100066EE8 = -[NSDictionary initWithObjectsAndKeys:]( contexta,  "initWithObjectsAndKeys:",  v69,  @"BDC_Once",  v3,  @"BDC_Daily",  v4,  @"BDC_Weekly",  v5,  @"BDC_SBC",  v6,  @"BDC_OBC",  v7,  @"BDC_AMA",  +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v117, 3LL),  @"BDC_SmartCharging",  0LL);
  v8 = objc_alloc(&OBJC_CLASS___NSDictionary);
  v113[0] = @"PruningPeriodOverride_s";
  v113[1] = &off_1000602A8;
  v9 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v113, 2LL);
  v112[0] = @"FormatVersionOverride";
  v112[1] = @"2.9";
  v10 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v112, 2LL);
  v111[0] = @"DataStoragePathOverride";
  v111[1] = @"/var/db/Battery/BDC";
  v11 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v111, 2LL);
  v110[0] = @"TotalDataSizeUpperBoundOverride_kB";
  v110[1] = &off_1000602C0;
  qword_100066EF0 = -[NSDictionary initWithObjectsAndKeys:]( v8,  "initWithObjectsAndKeys:",  v9,  @"BDC_Pruning_Period",  v10,  @"BDC_Data_Format_Version",  v11,  @"BDC_Data_Storage_Path",  +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v110, 2LL),  @"TotalDataSizeUpperBound",  0LL);
  qword_100066EB8 = -[NSUserDefaults initWithSuiteName:]( objc_alloc(&OBJC_CLASS___NSUserDefaults),  "initWithSuiteName:",  @"com.apple.powerd.bdc");
  v12 = objc_autoreleasePoolPush();
  v13 = dlopen("/System/Library/PrivateFrameworks/CoreTime.framework/CoreTime", 2);
  qword_100066EC8 = (uint64_t)v13;
  if (v13)
  {
    off_100066ED0 = (uint64_t (*)(void))dlsym(v13, "TMGetKernelMonotonicClock");
    if (off_100066ED0)
    {
      [(id)qword_100066EB8 doubleForKey:@"ReferenceRTCTicks"];
      double v15 = v14;
      id v16 = [(id)qword_100066EB8 objectForKey:@"ReferenceWalltime"];
      if (v15 == 0.0 || !v16)
      {
        v29 = (os_log_s *)qword_100067748;
        if (os_log_type_enabled((os_log_t)qword_100067748, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_DEFAULT,  "Reference clock unavailable. Creating new reference",  buf,  2u);
        }

        sub_10000EC24();
        double v31 = v30;
        v32 = +[NSDate now](&OBJC_CLASS___NSDate, "now");
        [(id)qword_100066EB8 setDouble:@"ReferenceRTCTicks" forKey:v31];
        [(id)qword_100066EB8 setDouble:@"LastKnownRTCTicks" forKey:v31];
        [(id)qword_100066EB8 setObject:v32 forKey:@"ReferenceWalltime"];
        [(id)qword_100066EB8 setObject:v32 forKey:@"LastKnownWalltime"];
        [(id)qword_100066EB8 setDouble:@"RTCTicksDelta" forKey:0.0];
      }

      else
      {
        sub_10000EC24();
        double v18 = v17;
        [(id)qword_100066EB8 doubleForKey:@"LastKnownRTCTicks"];
        double v20 = v19;
        id v21 = [(id)qword_100066EB8 objectForKey:@"LastKnownWalltime"];
        v22 = +[NSDate now](&OBJC_CLASS___NSDate, "now");
        if (v20 <= 0.0) {
          [(id)qword_100066EB8 setDouble:@"LastKnownRTCTicks" forKey:v18];
        }
        if (v18 < v20)
        {
          [(id)qword_100066EB8 doubleForKey:@"RTCTicksDelta"];
          double v24 = v23;
          double v25 = v20 - v18 + v23;
          [v21 timeIntervalSinceDate:v22];
          double v27 = v26;
          if (v26 <= 0.0)
          {
            if (v26 < 0.0) {
              double v25 = v25 - v26;
            }
          }

          else
          {
            if (os_log_type_enabled((os_log_t)qword_100067748, OS_LOG_TYPE_ERROR)) {
              sub_10003FA44();
            }
            [(id)qword_100066EB8 setBool:1 forKey:@"NeedSystemTimeUpdate"];
          }

          [(id)qword_100066EB8 setDouble:@"RTCTicksDelta" forKey:v25];
          [(id)qword_100066EB8 setDouble:@"LastKnownRTCTicks" forKey:v18];
          v33 = (os_log_s *)qword_100067748;
          if (os_log_type_enabled((os_log_t)qword_100067748, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 134219264;
            *(double *)&buf[4] = v18;
            *(_WORD *)&buf[12] = 2048;
            *(double *)&buf[14] = v15;
            *(_WORD *)&buf[22] = 2048;
            double v104 = v20;
            *(_WORD *)v105 = 2048;
            *(double *)&v105[2] = v24;
            __int16 v106 = 2048;
            double v107 = v25;
            __int16 v108 = 2048;
            double v109 = v27;
            _os_log_error_impl( (void *)&_mh_execute_header,  v33,  OS_LOG_TYPE_ERROR,  "RTC reset detected. Current ticks %lf < saved ticks %lf. Last known ticks %lf, old delta %lf, new delta %l f, seconds lost since power off %lf",  buf,  0x3Eu);
          }
        }
      }
    }

    else if (os_log_type_enabled((os_log_t)qword_100067748, OS_LOG_TYPE_ERROR))
    {
      sub_10003FA18();
    }
  }

  else if (os_log_type_enabled((os_log_t)qword_100067748, OS_LOG_TYPE_ERROR))
  {
    sub_10003F9EC();
  }

  objc_autoreleasePoolPop(v12);
  if ([(id)qword_100066EB8 objectForKey:@"bdcEnableOverride"])
  {
    unsigned int v34 = [(id)qword_100066EB8 BOOLForKey:@"bdcEnableOverride"];
    v35 = (os_log_s *)qword_100067748;
    if (os_log_type_enabled((os_log_t)qword_100067748, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = v34;
      _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "bdcEnable override %d", buf, 8u);
      if ((v34 & 1) == 0)
      {
        v35 = (os_log_s *)qword_100067748;
        goto LABEL_78;
      }
    }

    else if ((v34 & 1) == 0)
    {
LABEL_78:
      v38 = v72;
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v68 = "Feature disabled";
        goto LABEL_80;
      }

      goto LABEL_46;
    }
  }

  v36 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v37 = dispatch_queue_create("BDCManagerQueue", v36);
  v38 = v72;
  v72->_managerQueue = (OS_dispatch_queue *)v37;
  if (!v37)
  {
    v35 = (os_log_s *)qword_100067748;
    if (os_log_type_enabled((os_log_t)qword_100067748, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v68 = "Manager queue alloc failed";
LABEL_80:
      _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, v68, buf, 2u);
    }

- (void)dealloc
{
  managerQueue = self->_managerQueue;
  if (managerQueue) {
    dispatch_release((dispatch_object_t)managerQueue);
  }
  pruningTimer = self->_pruningTimer;
  if (pruningTimer)
  {
    dispatch_source_cancel((dispatch_source_t)pruningTimer);
    dispatch_release((dispatch_object_t)self->_pruningTimer);
  }

  if (qword_100066EC8) {
    dlclose((void *)qword_100066EC8);
  }
  qword_100066EC8 = 0LL;

  qword_100066EB8 = 0LL;
  qword_100066EF0 = 0LL;

  qword_100066EE8 = 0LL;
  qword_100066ED8 = 0LL;

  qword_100066EE0 = 0LL;
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___BatteryDataCollectionManager;
  -[BatteryDataCollectionManager dealloc](&v5, "dealloc");
}

- (void)start
{
  managerQueue = self->_managerQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10000E538;
  block[3] = &unk_1000596C0;
  block[4] = self;
  dispatch_async((dispatch_queue_t)managerQueue, block);
}

- (void)stop
{
  managerQueue = self->_managerQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10000E6C4;
  block[3] = &unk_1000596C0;
  block[4] = self;
  dispatch_async((dispatch_queue_t)managerQueue, block);
}

- (void)systemTimeChanged
{
  v2 = +[NSDate now](&OBJC_CLASS___NSDate, "now");
  sub_10000EC24();
  double v4 = v3;
  [(id)qword_100066EB8 doubleForKey:@"ReferenceRTCTicks"];
  double v6 = v5;
  id v7 = [(id)qword_100066EB8 objectForKey:@"ReferenceWalltime"];
  v8 = (os_log_s *)qword_100067748;
  if (os_log_type_enabled((os_log_t)qword_100067748, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    *(void *)&buf[4] = v2;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Current time %@", buf, 0xCu);
  }

  if (v6 == 0.0 || v7 == 0LL)
  {
    if (os_log_type_enabled((os_log_t)qword_100067748, OS_LOG_TYPE_ERROR)) {
      sub_10003FED0();
    }
  }

  else
  {
    -[NSDate timeIntervalSinceDate:](v2, "timeIntervalSinceDate:", v7);
    if (v10 < 0.0) {
      return;
    }
    v11 = (void *)qword_100066EB8;
    objc_sync_enter((id)qword_100066EB8);
    if (![(id)qword_100066EB8 BOOLForKey:@"NeedSystemTimeUpdate"])
    {
      objc_sync_exit(v11);
      return;
    }

    [(id)qword_100066EB8 doubleForKey:@"RTCTicksDelta"];
    double v13 = v12;
    -[NSDate timeIntervalSinceDate:](v2, "timeIntervalSinceDate:", sub_10000B5B8());
    double v15 = v14;
    if (v14 <= 0.0)
    {
      if (os_log_type_enabled((os_log_t)qword_100067748, OS_LOG_TYPE_ERROR)) {
        sub_10003FE70();
      }
    }

    else
    {
      [(id)qword_100066EB8 setDouble:@"RTCTicksDelta" forKey:v13 + v14];
      [(id)qword_100066EB8 setObject:v2 forKey:@"LastKnownWalltime"];
      [(id)qword_100066EB8 setDouble:@"LastKnownRTCTicks" forKey:v4];
      [(id)qword_100066EB8 setBool:0 forKey:@"NeedSystemTimeUpdate"];
      id v16 = (os_log_s *)qword_100067748;
      if (os_log_type_enabled((os_log_t)qword_100067748, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138413314;
        *(void *)&buf[4] = v2;
        __int16 v21 = 2048;
        double v22 = v13;
        __int16 v23 = 2048;
        double v24 = v13 + v15;
        __int16 v25 = 2048;
        double v26 = v15;
        __int16 v27 = 2048;
        double v28 = v4;
        _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "Updating last known wall time to %@, old delta to %lf, new delta %lf, seconds lost %lf, last known rtc ticks %lf",  buf,  0x34u);
      }
    }

    objc_sync_exit(v11);
    *(void *)buf = 0LL;
    double v17 = sub_10000D740((uint64_t)@"BDC_Data_Storage_Path", 3u);
    id v18 = -[NSNull stringByAppendingFormat:]( v17,  "stringByAppendingFormat:",  @"/%@_version%@.csv",  @"BDC_Timestamps",  @"1.0");
    if (-[NSFileManager fileExistsAtPath:]( +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"),  "fileExistsAtPath:",  v18))
    {
      goto LABEL_22;
    }

    if (-[NSFileManager createDirectoryAtPath:withIntermediateDirectories:attributes:error:]( +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"),  "createDirectoryAtPath:withIntermediateDirectories:attributes:error:",  v17,  1LL,  0LL,  buf))
    {
      if (-[NSFileManager createFileAtPath:contents:attributes:]( +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"),  "createFileAtPath:contents:attributes:",  v18,  0LL,  0LL))
      {
        [@"reference_rtc_ticks,reference_system_time,current_rtc_ticks,set_system_time\n" writeToFile:v18 atomically:1 encoding:4 error:0];
LABEL_22:
        double v19 = +[NSFileHandle fileHandleForWritingAtPath:]( &OBJC_CLASS___NSFileHandle,  "fileHandleForWritingAtPath:",  v18);
        -[NSFileHandle seekToEndOfFile](v19, "seekToEndOfFile");
        -[NSFileHandle writeData:error:]( v19,  "writeData:error:",  -[NSString dataUsingEncoding:]( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%f,%@,%f,%@\n",  *(void *)&v6,  [v7 description],  *(void *)&v4,  -[NSDate description](v2, "description")),  "dataUsingEncoding:",  4),  0);
        -[NSFileHandle closeFile](v19, "closeFile");
        return;
      }

      if (os_log_type_enabled((os_log_t)qword_100067748, OS_LOG_TYPE_ERROR)) {
        sub_10003FDB0();
      }
    }

    else if (os_log_type_enabled((os_log_t)qword_100067748, OS_LOG_TYPE_ERROR))
    {
      sub_10003FE10();
    }
  }

@end
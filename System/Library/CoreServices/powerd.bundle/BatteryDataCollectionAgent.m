@interface BatteryDataCollectionAgent
- (BOOL)batteryChanged;
- (BOOL)collectAtPowerSourceChange;
- (BOOL)collectAtSBC;
- (BOOL)collectOnce;
- (BOOL)eventBasedCollection;
- (BOOL)neverPrune;
- (BOOL)skipCSVAndUsePowerlog;
- (BOOL)useBTMAsDataSource;
- (BOOL)useSmartChargingDataSource;
- (BatteryDataCollectionAgent)initWithParams:(id)a3 collectionBlock:(id)a4;
- (NSArray)columnNames;
- (NSNumber)collationPeriod;
- (NSNumber)collectionPeriod;
- (NSNumber)retentionPeriod;
- (NSString)dataGroupName;
- (NSString)dirPath;
- (NSString)formatVersion;
- (OS_dispatch_queue)collectionQueue;
- (OS_dispatch_source)collectionTimer;
- (id)collectionEventHandler;
- (id)createDataDictCollectionBlock;
- (id)description;
- (id)getLastDataLoggedTimestampDefaultsKey;
- (id)getLastUsedDataFileNameDefaultsKey;
- (id)shortDescription;
- (int)eventRegistrationToken;
- (unint64_t)getCollectionPeriod;
- (void)dealloc;
- (void)setBatteryChanged:(BOOL)a3;
- (void)setCollationPeriod:(id)a3;
- (void)setCollectAtPowerSourceChange:(BOOL)a3;
- (void)setCollectAtSBC:(BOOL)a3;
- (void)setCollectOnce:(BOOL)a3;
- (void)setCollectionEventHandler:(id)a3;
- (void)setCollectionPeriod:(id)a3;
- (void)setCollectionQueue:(id)a3;
- (void)setCollectionTimer:(id)a3;
- (void)setColumnNames:(id)a3;
- (void)setCreateDataDictCollectionBlock:(id)a3;
- (void)setDataGroupName:(id)a3;
- (void)setDirPath:(id)a3;
- (void)setEventBasedCollection:(BOOL)a3;
- (void)setEventRegistrationToken:(int)a3;
- (void)setFormatVersion:(id)a3;
- (void)setNeverPrune:(BOOL)a3;
- (void)setRetentionPeriod:(id)a3;
- (void)setSkipCSVAndUsePowerlog:(BOOL)a3;
- (void)setUseBTMAsDataSource:(BOOL)a3;
- (void)setUseSmartChargingDataSource:(BOOL)a3;
- (void)start;
- (void)stop;
@end

@implementation BatteryDataCollectionAgent

- (BatteryDataCollectionAgent)initWithParams:(id)a3 collectionBlock:(id)a4
{
  v34.receiver = self;
  v34.super_class = (Class)&OBJC_CLASS___BatteryDataCollectionAgent;
  v6 = -[BatteryDataCollectionAgent init](&v34, "init");
  if (!v6)
  {
    if (os_log_type_enabled((os_log_t)qword_100067748, OS_LOG_TYPE_ERROR)) {
      sub_10003FF64();
    }
    return 0LL;
  }

  -[BatteryDataCollectionAgent setDataGroupName:]( v6,  "setDataGroupName:",  [a3 objectForKeyedSubscript:@"DataGroupName"]);
  -[BatteryDataCollectionAgent setFormatVersion:]( v6,  "setFormatVersion:",  [a3 objectForKeyedSubscript:@"DataFormatVersion"]);
  -[BatteryDataCollectionAgent setDirPath:]( v6,  "setDirPath:",  [a3 objectForKeyedSubscript:@"DataFilePath"]);
  -[BatteryDataCollectionAgent setColumnNames:]( v6,  "setColumnNames:",  [a3 objectForKeyedSubscript:@"DataColumnNames"]);
  -[BatteryDataCollectionAgent setCreateDataDictCollectionBlock:](v6, "setCreateDataDictCollectionBlock:", a4);
  -[BatteryDataCollectionAgent setCollectionPeriod:]( v6,  "setCollectionPeriod:",  [a3 objectForKeyedSubscript:@"DataCollectionPeriod"]);
  -[BatteryDataCollectionAgent setCollectAtSBC:]( v6,  "setCollectAtSBC:",  objc_msgSend(objc_msgSend(a3, "objectForKeyedSubscript:", @"DataCollectionAtSBC"), "BOOLValue"));
  -[BatteryDataCollectionAgent setCollectAtPowerSourceChange:]( v6,  "setCollectAtPowerSourceChange:",  objc_msgSend(objc_msgSend(a3, "objectForKeyedSubscript:", @"DataCollectAtPowerSourceChange"), "BOOLValue"));
  -[BatteryDataCollectionAgent setCollectOnce:]( v6,  "setCollectOnce:",  objc_msgSend(objc_msgSend(a3, "objectForKeyedSubscript:", @"DataCollectionOnce"), "BOOLValue"));
  -[BatteryDataCollectionAgent setCollationPeriod:]( v6,  "setCollationPeriod:",  [a3 objectForKeyedSubscript:@"DataCollationPeriod"]);
  -[BatteryDataCollectionAgent setRetentionPeriod:]( v6,  "setRetentionPeriod:",  [a3 objectForKeyedSubscript:@"DataRetentionPeriod"]);
  -[BatteryDataCollectionAgent setBatteryChanged:]( v6,  "setBatteryChanged:",  objc_msgSend(objc_msgSend(a3, "objectForKeyedSubscript:", @"BatteryChanged"), "BOOLValue"));
  -[BatteryDataCollectionAgent setEventRegistrationToken:](v6, "setEventRegistrationToken:", 0LL);
  -[BatteryDataCollectionAgent setSkipCSVAndUsePowerlog:]( v6,  "setSkipCSVAndUsePowerlog:",  objc_msgSend(objc_msgSend(a3, "objectForKeyedSubscript:", @"SkipCSVUsePowerlog"), "BOOLValue"));
  -[BatteryDataCollectionAgent setUseBTMAsDataSource:]( v6,  "setUseBTMAsDataSource:",  objc_msgSend(objc_msgSend(a3, "objectForKeyedSubscript:", @"useBTM"), "BOOLValue"));
  -[BatteryDataCollectionAgent setUseSmartChargingDataSource:]( v6,  "setUseSmartChargingDataSource:",  objc_msgSend(objc_msgSend(a3, "objectForKeyedSubscript:", @"useSC"), "BOOLValue"));
  BOOL v7 = v6->_collectOnce || v6->_collectAtPowerSourceChange || v6->_useSmartChargingDataSource;
  -[BatteryDataCollectionAgent setEventBasedCollection:](v6, "setEventBasedCollection:", v7);
  uint64_t v8 = (objc_msgSend(objc_msgSend(a3, "objectForKeyedSubscript:", @"DataNeverPrune"), "BOOLValue") & 1) != 0
    || -[BatteryDataCollectionAgent skipCSVAndUsePowerlog](v6, "skipCSVAndUsePowerlog");
  -[BatteryDataCollectionAgent setNeverPrune:](v6, "setNeverPrune:", v8);
  v9 = -[NSString UTF8String]( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@.%@",  @"com.apple.powerd.bdc.collectionqueue",  -[BatteryDataCollectionAgent dataGroupName](v6, "dataGroupName")),  "UTF8String");
  v10 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v6->_collectionQueue = (OS_dispatch_queue *)dispatch_queue_create(v9, v10);
  v6->_collectionTimer = (OS_dispatch_source *)dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_timer,  0LL,  0LL,  (dispatch_queue_t)-[BatteryDataCollectionAgent collectionQueue]( v6,  "collectionQueue"));
  if (v6->_eventBasedCollection
    || (collectionPeriod = v6->_collectionPeriod,
        collectionPeriod != (NSNumber *)+[NSNull null](&OBJC_CLASS___NSNull, "null"))
    && -[NSNumber intValue](v6->_collectionPeriod, "intValue") > 0)
  {
    char v11 = 0;
  }

  else
  {
    v13 = (os_log_s *)qword_100067748;
    if (os_log_type_enabled((os_log_t)qword_100067748, OS_LOG_TYPE_ERROR)) {
      sub_10003FFBC((uint64_t)v6, (id *)&v6->_collectionPeriod, v13);
    }
    char v11 = 1;
  }

  if (!v6->_neverPrune)
  {
    retentionPeriod = v6->_retentionPeriod;
    if (retentionPeriod == (NSNumber *)+[NSNull null](&OBJC_CLASS___NSNull, "null")
      || -[NSNumber intValue](v6->_retentionPeriod, "intValue") <= 0)
    {
      if (os_log_type_enabled((os_log_t)qword_100067748, OS_LOG_TYPE_ERROR)) {
        sub_10003FF90();
      }
      goto LABEL_36;
    }
  }

  if ((v11 & 1) != 0)
  {
LABEL_36:

    return 0LL;
  }

  v14 = objc_autoreleasePoolPush();
  objc_initWeak(&location, v6);
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472LL;
  v31[2] = sub_10000F378;
  v31[3] = &unk_1000596E8;
  objc_copyWeak(&v32, &location);
  v31[4] = v6;
  -[BatteryDataCollectionAgent setCollectionEventHandler:](v6, "setCollectionEventHandler:", v31);
  id v15 = objc_msgSend( (id)qword_100066EB8,  "objectForKey:",  -[BatteryDataCollectionAgent getLastDataLoggedTimestampDefaultsKey]( v6,  "getLastDataLoggedTimestampDefaultsKey"));
  int64_t v16 = 1000000000LL;
  if (v15)
  {
    int64_t v16 = 1000000000LL;
    if (!-[BatteryDataCollectionAgent eventBasedCollection](v6, "eventBasedCollection"))
    {
      int64_t v16 = 1000000000LL;
      if (!-[BatteryDataCollectionAgent skipCSVAndUsePowerlog](v6, "skipCSVAndUsePowerlog"))
      {
        -[NSDate timeIntervalSinceDate:](sub_10000B5B8(), "timeIntervalSinceDate:", v15);
        double v18 = v17;
        -[NSNumber doubleValue](-[BatteryDataCollectionAgent collectionPeriod](v6, "collectionPeriod"), "doubleValue");
        double v20 = v19;
        unsigned int v21 = [objc_msgSend( (id)qword_100066EB8 stringForKey:-[BatteryDataCollectionAgent getLastUsedDataFileNameDefaultsKey]( v6, "getLastUsedDataFileNameDefaultsKey")), "containsString:", +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"version%@", v6->_formatVersion)];
        unsigned int v22 = v21;
        double v23 = v20 / 1000.0;
        if (v18 < v23) {
          unsigned int v24 = v21;
        }
        else {
          unsigned int v24 = 0;
        }
        int64_t v16 = 1000000000LL;
        if (v24 == 1)
        {
          else {
            int64_t v16 = 1000000000 * (unint64_t)(v23 - v18);
          }
        }

        v25 = (os_log_s *)qword_100067748;
        if (os_log_type_enabled((os_log_t)qword_100067748, OS_LOG_TYPE_DEFAULT))
        {
          v26 = -[BatteryDataCollectionAgent dataGroupName](v6, "dataGroupName");
          *(_DWORD *)buf = 138413314;
          v36 = v26;
          __int16 v37 = 2112;
          id v38 = v15;
          __int16 v39 = 2048;
          double v40 = v23;
          __int16 v41 = 2048;
          double v42 = (double)(unint64_t)v16 / 1000000000.0;
          __int16 v43 = 1024;
          int v44 = v22 ^ 1;
          _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "%@: last logged %@, collection period %f s, start delta %f s, versionChanged %d",  buf,  0x30u);
        }
      }
    }
  }

  dispatch_source_set_event_handler( (dispatch_source_t)-[BatteryDataCollectionAgent collectionTimer](v6, "collectionTimer"),  -[BatteryDataCollectionAgent collectionEventHandler](v6, "collectionEventHandler"));
  v27 = -[BatteryDataCollectionAgent collectionTimer](v6, "collectionTimer");
  dispatch_time_t v28 = dispatch_time(0x8000000000000000LL, v16);
  dispatch_source_set_timer( v27,  v28,  -[BatteryDataCollectionAgent getCollectionPeriod](v6, "getCollectionPeriod"),  0x3B9ACA00uLL);
  objc_destroyWeak(&v32);
  objc_destroyWeak(&location);
  objc_autoreleasePoolPop(v14);
  return v6;
}

- (void)dealloc
{
  collectionTimer = self->_collectionTimer;
  if (collectionTimer)
  {
    dispatch_source_cancel((dispatch_source_t)collectionTimer);
    dispatch_release((dispatch_object_t)self->_collectionTimer);
  }

  collectionQueue = self->_collectionQueue;
  if (collectionQueue) {
    dispatch_release((dispatch_object_t)collectionQueue);
  }

  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___BatteryDataCollectionAgent;
  -[BatteryDataCollectionAgent dealloc](&v5, "dealloc");
}

- (void)start
{
  v3 = objc_autoreleasePoolPush();
  BOOL v4 = -[BatteryDataCollectionAgent collectAtPowerSourceChange](self, "collectAtPowerSourceChange");
  if (v4)
  {
    v39[0] = _NSConcreteStackBlock;
    v39[1] = 3221225472LL;
    v39[2] = sub_1000102F4;
    v39[3] = &unk_100059750;
    v39[4] = &stru_100059728;
    uint64_t v35 = 0LL;
    v36 = &v35;
    uint64_t v37 = 0x2020000000LL;
    BOOL v5 = sub_1000101E8((id)v4, 0x10000uLL);
    if (v5) {
      char v6 = 2;
    }
    else {
      char v6 = 0;
    }
    char v38 = v6 | sub_1000101E8((id)v5, 0x4000000uLL);
    *(void *)&__int128 out_token = 0LL;
    *((void *)&out_token + 1) = &out_token;
    uint64_t v43 = 0x3052000000LL;
    int v44 = sub_10001034C;
    v45 = sub_10001035C;
    v46 = +[NSDate distantPast](&OBJC_CLASS___NSDate, "distantPast");
    id v7 = [(id)qword_100066EB8 objectForKey:@"LastConnectedState"];
    if (v7)
    {
      uint64_t v8 = objc_opt_class(&OBJC_CLASS___NSNumber);
      if ((objc_opt_isKindOfClass(v7, v8) & 1) == 0
        || (unsigned int v9 = [v7 unsignedIntValue],
            uint64_t v10 = *((unsigned __int8 *)v36 + 24),
            v9 == (_DWORD)v10))
      {
        char v11 = (os_log_s *)qword_100067748;
        if (os_log_type_enabled((os_log_t)qword_100067748, OS_LOG_TYPE_DEFAULT))
        {
          int v12 = *((unsigned __int8 *)v36 + 24);
          *(_DWORD *)buf = 67109120;
          int v41 = v12;
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Connected state %u unchanged", buf, 8u);
        }

        goto LABEL_24;
      }
    }

    else
    {
      uint64_t v10 = *((unsigned __int8 *)v36 + 24);
    }

    objc_msgSend( (id)qword_100066EB8,  "setObject:forKey:",  +[NSNumber numberWithUnsignedChar:](NSNumber, "numberWithUnsignedChar:", v10),  @"LastConnectedState");
    dispatch_async( (dispatch_queue_t)-[BatteryDataCollectionAgent collectionQueue](self, "collectionQueue"),  -[BatteryDataCollectionAgent collectionEventHandler](self, "collectionEventHandler"));
LABEL_24:
    v34[0] = _NSConcreteStackBlock;
    v34[1] = 3221225472LL;
    v34[2] = sub_100010368;
    v34[3] = &unk_1000597B8;
    v34[4] = self;
    v34[5] = v39;
    v34[6] = &stru_100059790;
    v34[7] = &out_token;
    v34[8] = &v35;
    if (notify_register_dispatch( "com.apple.system.powersources.timeremaining",  (int *)buf,  (dispatch_queue_t)-[BatteryDataCollectionAgent collectionQueue](self, "collectionQueue"),  v34)
      && os_log_type_enabled((os_log_t)qword_100067748, OS_LOG_TYPE_ERROR))
    {
      sub_1000400D8();
    }

    _Block_object_dispose(&out_token, 8);
    _Block_object_dispose(&v35, 8);
    goto LABEL_31;
  }

  if (-[BatteryDataCollectionAgent useSmartChargingDataSource](self, "useSmartChargingDataSource"))
  {
    LODWORD(out_token) = -1;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472LL;
    handler[2] = sub_100010550;
    handler[3] = &unk_1000597E0;
    handler[4] = self;
    if (notify_register_dispatch( "com.apple.smartcharging.charging",  (int *)&out_token,  (dispatch_queue_t)-[BatteryDataCollectionAgent collectionQueue](self, "collectionQueue"),  handler)
      && os_log_type_enabled((os_log_t)qword_100067748, OS_LOG_TYPE_ERROR))
    {
      sub_100040150();
    }

    goto LABEL_31;
  }

  if (!-[BatteryDataCollectionAgent useBTMAsDataSource](self, "useBTMAsDataSource"))
  {
    if (-[BatteryDataCollectionAgent collectOnce](self, "collectOnce"))
    {
      unsigned int v21 = -[BatteryDataCollectionAgent collectionTimer](self, "collectionTimer");
      dispatch_time_t v22 = dispatch_time(0x8000000000000000LL, 1000000000LL);
      dispatch_source_set_timer( (dispatch_source_t)v21,  v22,  -[BatteryDataCollectionAgent getCollectionPeriod](self, "getCollectionPeriod"),  0x3B9ACA00uLL);
    }

    goto LABEL_30;
  }

  if ((_os_feature_enabled_impl("powerd", "BDCAMAAgent") & 1) != 0)
  {
    CFTypeID TypeID = CFNumberGetTypeID();
    v14 = (void *)sub_100010660(@"BatteryDataCollectionReady", TypeID);
    id v15 = v14;
    if (v14)
    {
      if ([v14 intValue] == 1)
      {
        int64_t v16 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
        if (v16)
        {
          double v17 = v16;
          -[NSMutableDictionary setObject:forKeyedSubscript:]( v16,  "setObject:forKeyedSubscript:",  &off_1000601B8,  @"DataCaptureTrigger");
          -[NSMutableDictionary setObject:forKeyedSubscript:]( v17,  "setObject:forKeyedSubscript:",  &off_1000601D0,  @"CaptureTime");
          -[NSMutableDictionary setObject:forKeyedSubscript:]( v17,  "setObject:forKeyedSubscript:",  &off_1000601E8,  @"Voltage");
          -[NSMutableDictionary setObject:forKeyedSubscript:]( v17,  "setObject:forKeyedSubscript:",  &off_1000601E8,  @"InstantAmperage");
          -[NSMutableDictionary setObject:forKeyedSubscript:]( v17,  "setObject:forKeyedSubscript:",  &off_1000601E8,  @"PresentDOD");
          -[NSMutableDictionary setObject:forKeyedSubscript:]( v17,  "setObject:forKeyedSubscript:",  &off_1000601E8,  @"ChargeAccum");
          -[NSMutableDictionary setObject:forKeyedSubscript:]( v17,  "setObject:forKeyedSubscript:",  &off_1000601E8,  @"AlgoTemperature");
          -[NSMutableDictionary setObject:forKeyedSubscript:]( v17,  "setObject:forKeyedSubscript:",  &off_1000601E8,  @"VirtualTemperature");
          double v18 = IOServiceMatching("AppleBTM");
          io_service_t MatchingService = IOServiceGetMatchingService(kIOMainPortDefault, v18);
          if (MatchingService)
          {
            io_object_t v20 = MatchingService;
            if (!IORegistryEntrySetCFProperties(MatchingService, v17))
            {
              IOObjectRelease(v20);

LABEL_30:
              dispatch_resume((dispatch_object_t)-[BatteryDataCollectionAgent collectionTimer](self, "collectionTimer"));
LABEL_31:
              id v23 = -[BatteryDataCollectionAgent shortDescription](self, "shortDescription");
              unsigned int v24 = (os_log_s *)qword_100067748;
              if (os_log_type_enabled((os_log_t)qword_100067748, OS_LOG_TYPE_DEFAULT))
              {
                LODWORD(out_token) = 138412290;
                *(void *)((char *)&out_token + 4) = v23;
                _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "Started bdc agent %@",  (uint8_t *)&out_token,  0xCu);
              }

              goto LABEL_33;
            }

            if (os_log_type_enabled((os_log_t)qword_100067748, OS_LOG_TYPE_ERROR)) {
              sub_10004024C();
            }
            IOObjectRelease(v20);
          }

          else if (os_log_type_enabled((os_log_t)qword_100067748, OS_LOG_TYPE_ERROR))
          {
            sub_1000402AC();
          }

          if (os_log_type_enabled((os_log_t)qword_100067748, OS_LOG_TYPE_ERROR)) {
            sub_10004024C();
          }
LABEL_51:

          goto LABEL_33;
        }

        if (os_log_type_enabled((os_log_t)qword_100067748, OS_LOG_TYPE_ERROR)) {
          sub_100040220();
        }
      }

      else if (os_log_type_enabled((os_log_t)qword_100067748, OS_LOG_TYPE_ERROR))
      {
        sub_1000402D8();
      }
    }

    else
    {
      v25 = (os_log_s *)qword_100067748;
      if (os_log_type_enabled((os_log_t)qword_100067748, OS_LOG_TYPE_ERROR)) {
        sub_1000401B0(v25, v26, v27, v28, v29, v30, v31, v32);
      }
    }

    double v17 = 0LL;
    goto LABEL_51;
  }

  if (os_log_type_enabled((os_log_t)qword_100067748, OS_LOG_TYPE_ERROR)) {
    sub_100040304();
  }
LABEL_33:
  objc_autoreleasePoolPop(v3);
}

- (void)stop
{
  v3 = objc_autoreleasePoolPush();
  if (-[BatteryDataCollectionAgent collectAtPowerSourceChange](self, "collectAtPowerSourceChange")
    || -[BatteryDataCollectionAgent useSmartChargingDataSource](self, "useSmartChargingDataSource"))
  {
    notify_cancel(-[BatteryDataCollectionAgent eventRegistrationToken](self, "eventRegistrationToken"));
  }

  else
  {
    dispatch_suspend((dispatch_object_t)-[BatteryDataCollectionAgent collectionTimer](self, "collectionTimer"));
  }

  id v4 = -[BatteryDataCollectionAgent shortDescription](self, "shortDescription");
  BOOL v5 = (os_log_s *)qword_100067748;
  if (os_log_type_enabled((os_log_t)qword_100067748, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Stopped bdc agent %@", (uint8_t *)&v6, 0xCu);
  }

  objc_autoreleasePoolPop(v3);
}

- (id)shortDescription
{
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Group:%@ Collection:%@ ms Retention:%@ s Collation:%@ s",  -[BatteryDataCollectionAgent dataGroupName](self, "dataGroupName"),  -[BatteryDataCollectionAgent collectionPeriod](self, "collectionPeriod"),  -[BatteryDataCollectionAgent retentionPeriod](self, "retentionPeriod"),  -[BatteryDataCollectionAgent collationPeriod](self, "collationPeriod"));
}

- (id)description
{
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Columns:%@ FilePath:%@ %@",  -[NSArray description](-[BatteryDataCollectionAgent columnNames](self, "columnNames"), "description"),  -[BatteryDataCollectionAgent dirPath](self, "dirPath"),  -[BatteryDataCollectionAgent shortDescription](self, "shortDescription"));
}

- (unint64_t)getCollectionPeriod
{
  if (-[BatteryDataCollectionAgent eventBasedCollection](self, "eventBasedCollection")) {
    return -1LL;
  }
  else {
    return 1000000LL
  }
         * -[NSNumber unsignedIntValue]( -[BatteryDataCollectionAgent collectionPeriod](self, "collectionPeriod"),  "unsignedIntValue");
}

- (id)getLastUsedDataFileNameDefaultsKey
{
  return -[NSString stringByAppendingString:]( -[BatteryDataCollectionAgent dataGroupName](self, "dataGroupName"),  "stringByAppendingString:",  @"_LastUsedFileName");
}

- (id)getLastDataLoggedTimestampDefaultsKey
{
  return -[NSString stringByAppendingString:]( -[BatteryDataCollectionAgent dataGroupName](self, "dataGroupName"),  "stringByAppendingString:",  @"_LastLoggedTimeStamp");
}

- (NSString)dataGroupName
{
  return self->_dataGroupName;
}

- (void)setDataGroupName:(id)a3
{
}

- (NSString)dirPath
{
  return self->_dirPath;
}

- (void)setDirPath:(id)a3
{
}

- (NSString)formatVersion
{
  return self->_formatVersion;
}

- (void)setFormatVersion:(id)a3
{
}

- (NSNumber)collectionPeriod
{
  return self->_collectionPeriod;
}

- (void)setCollectionPeriod:(id)a3
{
}

- (NSNumber)retentionPeriod
{
  return self->_retentionPeriod;
}

- (void)setRetentionPeriod:(id)a3
{
}

- (NSNumber)collationPeriod
{
  return self->_collationPeriod;
}

- (void)setCollationPeriod:(id)a3
{
}

- (NSArray)columnNames
{
  return self->_columnNames;
}

- (void)setColumnNames:(id)a3
{
}

- (id)createDataDictCollectionBlock
{
  return self->_createDataDictCollectionBlock;
}

- (void)setCreateDataDictCollectionBlock:(id)a3
{
}

- (BOOL)collectAtSBC
{
  return self->_collectAtSBC;
}

- (void)setCollectAtSBC:(BOOL)a3
{
  self->_collectAtSBC = a3;
}

- (BOOL)collectOnce
{
  return self->_collectOnce;
}

- (void)setCollectOnce:(BOOL)a3
{
  self->_collectOnce = a3;
}

- (BOOL)collectAtPowerSourceChange
{
  return self->_collectAtPowerSourceChange;
}

- (void)setCollectAtPowerSourceChange:(BOOL)a3
{
  self->_collectAtPowerSourceChange = a3;
}

- (BOOL)neverPrune
{
  return self->_neverPrune;
}

- (void)setNeverPrune:(BOOL)a3
{
  self->_neverPrune = a3;
}

- (BOOL)batteryChanged
{
  return self->_batteryChanged;
}

- (void)setBatteryChanged:(BOOL)a3
{
  self->_batteryChanged = a3;
}

- (BOOL)skipCSVAndUsePowerlog
{
  return self->_skipCSVAndUsePowerlog;
}

- (void)setSkipCSVAndUsePowerlog:(BOOL)a3
{
  self->_skipCSVAndUsePowerlog = a3;
}

- (BOOL)useBTMAsDataSource
{
  return self->_useBTMAsDataSource;
}

- (void)setUseBTMAsDataSource:(BOOL)a3
{
  self->_useBTMAsDataSource = a3;
}

- (BOOL)useSmartChargingDataSource
{
  return self->_useSmartChargingDataSource;
}

- (void)setUseSmartChargingDataSource:(BOOL)a3
{
  self->_useSmartChargingDataSource = a3;
}

- (id)collectionEventHandler
{
  return self->_collectionEventHandler;
}

- (void)setCollectionEventHandler:(id)a3
{
}

- (int)eventRegistrationToken
{
  return self->_eventRegistrationToken;
}

- (void)setEventRegistrationToken:(int)a3
{
  self->_eventRegistrationToken = a3;
}

- (BOOL)eventBasedCollection
{
  return self->_eventBasedCollection;
}

- (void)setEventBasedCollection:(BOOL)a3
{
  self->_eventBasedCollection = a3;
}

- (OS_dispatch_queue)collectionQueue
{
  return self->_collectionQueue;
}

- (void)setCollectionQueue:(id)a3
{
  self->_collectionQueue = (OS_dispatch_queue *)a3;
}

- (OS_dispatch_source)collectionTimer
{
  return self->_collectionTimer;
}

- (void)setCollectionTimer:(id)a3
{
  self->_collectionTimer = (OS_dispatch_source *)a3;
}

@end
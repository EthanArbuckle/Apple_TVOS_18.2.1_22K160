@interface NSPCoreData
+ (BOOL)triggerProactiveTokenFetch:(id)a3 lowerTokenCountThreshold:(unint64_t)a4;
+ (id)NSPEventsCacheGet;
+ (id)NSPEventsCacheUpdate:(id)a3;
+ (id)childCoreDataContext;
+ (id)compareModelVersion:(id)a3 model2:(id)a4;
+ (id)computeStats:(id)a3;
+ (id)fetchEvents;
+ (id)fetchEvents:(id)a3 mostRecent:(BOOL)a4 limit:(unint64_t)a5;
+ (id)fetchLatestEvents:(unint64_t)a3 vendors:(id)a4;
+ (id)getMinMaxDate;
+ (id)getModelVersion:(id)a3;
+ (id)getNSPEventStatsForSingleWindow:(id)a3 eventType:(int64_t)a4 startDate:(id)a5 endDate:(id)a6 windowStartTime:(id)a7 windowDuration:(id)a8;
+ (id)getNSPEventsDenormalizer;
+ (id)getNSPEventsNormalizer;
+ (id)getNSPEventsPredictor;
+ (id)getNSPEventsProbability:(id)a3 count:(int64_t)a4;
+ (id)getNSPTokenStatsForSingleWindow:(id)a3 startDate:(id)a4 endDate:(id)a5 windowStartTime:(id)a6 windowDuration:(id)a7 statsCategory:(int64_t)a8;
+ (id)getProactiveTokenFetchConfiguration;
+ (id)getTokenCountStatsForMultipleWindows:(id)a3 minDate:(id)a4 maxDate:(id)a5 windowDuration:(id)a6;
+ (id)getVendorDictionary;
+ (id)getVendorIdFromDictionary:(id)a3;
+ (id)getVendorNameById:(int64_t)a3;
+ (id)initNSPEventsModelPredictor;
+ (id)normalizeData:(id)a3;
+ (id)prepareInputForPrediction:(id)a3 vendor:(id)a4;
+ (id)prepareInputForTraining;
+ (id)prepareMLData:(id)a3 startAt:(unsigned int)a4 dataShape:(id)a5;
+ (id)prepareTokenEventsFromPrediction:(id)a3;
+ (id)sharedCoreDataContext;
+ (id)tokenTypeEnumToString:(int)a3;
+ (id)updateProactiveTokenFetchConfiguration:(id)a3 statsDuration:(id)a4 lowerTokenCountThreshold:(id)a5 lowerTokenCountProbability:(id)a6 upperLWMCountThreshold:(id)a7 upperLWMCountProbabilityOffset:(id)a8;
+ (id)updateVendorDictionaryFromModel:(id)a3;
+ (void)handleNSPEventsPredictions:(id)a3;
+ (void)predictNSPEvent:(id)a3;
+ (void)prepareModelInputWithFeatures:(id)a3 keyedSubscripts:(id)a4 features:(id)a5;
+ (void)printMLMultiArray:(id)a3;
+ (void)purgeEventsOlderThanDate:(id)a3;
+ (void)purgeEventsOlderThanDays:(int64_t)a3;
+ (void)saveTokenEvent:(id)a3 eventType:(int)a4 vendor:(id)a5 tokenCount:(unint64_t)a6;
+ (void)trainModel;
- (NSPCoreData)init;
- (NSPPersistentContainer)persistentContainer;
- (void)setPersistentContainer:(id)a3;
@end

@implementation NSPCoreData

+ (id)sharedCoreDataContext
{
  if (qword_1001171C0 != -1) {
    dispatch_once(&qword_1001171C0, &stru_1000FA5E8);
  }
  if (qword_1001171B8)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue([(id)qword_1001171B8 persistentContainer]);
    v4 = (void *)objc_claimAutoreleasedReturnValue([v3 viewContext]);

    return v4;
  }

  else
  {
    uint64_t v6 = nplog_obj(0LL, a2, v2);
    v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
      int v8 = 136315138;
      v9 = "+[NSPCoreData sharedCoreDataContext]";
      _os_log_fault_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_FAULT,  "%s called with null coreData",  (uint8_t *)&v8,  0xCu);
    }

    return 0LL;
  }

+ (id)childCoreDataContext
{
  if (qword_100117178) {
    return (id)qword_100117178;
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSPCoreData sharedCoreDataContext](&OBJC_CLASS___NSPCoreData, "sharedCoreDataContext"));
  if (!v5)
  {
    uint64_t v11 = nplog_obj(0LL, v3, v4);
    v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v14) = 0;
      _os_log_error_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_ERROR,  "NSP Core Data context not available",  (uint8_t *)&v14,  2u);
    }

    goto LABEL_8;
  }

  uint64_t v6 = -[NSManagedObjectContext initWithConcurrencyType:]( objc_alloc(&OBJC_CLASS___NSManagedObjectContext),  "initWithConcurrencyType:",  1LL);
  v7 = (void *)qword_100117178;
  qword_100117178 = (uint64_t)v6;

  if (!qword_100117178)
  {
    uint64_t v13 = nplog_obj(0LL, v8, v9);
    v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
    {
      int v14 = 136315138;
      v15 = "+[NSPCoreData childCoreDataContext]";
      _os_log_fault_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_FAULT,  "%s called with null childContext",  (uint8_t *)&v14,  0xCu);
    }

- (NSPCoreData)init
{
  v32.receiver = self;
  v32.super_class = (Class)&OBJC_CLASS___NSPCoreData;
  uint64_t v4 = -[NSPCoreData init](&v32, "init");
  if (v4)
  {
    v5 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSBundle bundleWithPath:]( &OBJC_CLASS___NSBundle,  "bundleWithPath:",  @"/System/Library/PrivateFrameworks/NetworkServiceProxy.framework"));
    uint64_t v8 = v5;
    if (!v5)
    {
      uint64_t v27 = nplog_obj(0LL, v6, v7);
      uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315138;
        v34 = "-[NSPCoreData init]";
        _os_log_fault_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_FAULT,  "%s called with null frameworkBundle",  buf,  0xCu);
      }

      v24 = 0LL;
      goto LABEL_10;
    }

    uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue( -[os_log_s URLForResource:withExtension:]( v5,  "URLForResource:withExtension:",  @"NSPCoreDataModel",  @"momd"));
    uint64_t v12 = nplog_obj(v9, v10, v11);
    uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    int v14 = v13;
    if (v9)
    {
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        v34 = @"NSPCoreDataModel";
        __int16 v35 = 2112;
        v36 = v9;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "URL for %@: %@", buf, 0x16u);
      }

      v15 = -[NSManagedObjectModel initWithContentsOfURL:]( objc_alloc(&OBJC_CLASS___NSManagedObjectModel),  "initWithContentsOfURL:",  v9);
      if (v15)
      {
        int v14 = v15;
        v18 = -[NSPPersistentContainer initWithName:managedObjectModel:]( objc_alloc(&OBJC_CLASS___NSPPersistentContainer),  "initWithName:managedObjectModel:",  @"NSPCoreDataModel",  v15);
        -[NSPCoreData setPersistentContainer:](v4, "setPersistentContainer:", v18);

        v19 = (void *)objc_claimAutoreleasedReturnValue(-[NSPCoreData persistentContainer](v4, "persistentContainer"));
        if (v19)
        {
          v23 = (void *)objc_claimAutoreleasedReturnValue(-[NSPCoreData persistentContainer](v4, "persistentContainer"));
          [v23 loadPersistentStoresWithCompletionHandler:&stru_1000FA628];

          v24 = v4;
LABEL_9:

LABEL_10:
          goto LABEL_11;
        }

        uint64_t v30 = nplog_obj(v20, v21, v22);
        v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
        if (os_log_type_enabled(v31, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 136315138;
          v34 = "-[NSPCoreData init]";
          _os_log_fault_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_FAULT,  "%s called with null self.persistentContainer",  buf,  0xCu);
        }
      }

      else
      {
        uint64_t v28 = nplog_obj(0LL, v16, v17);
        v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
        if (os_log_type_enabled(v29, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 136315138;
          v34 = "-[NSPCoreData init]";
          _os_log_fault_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_FAULT,  "%s called with null model",  buf,  0xCu);
        }

        int v14 = 0LL;
      }
    }

    else if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      v34 = "-[NSPCoreData init]";
      _os_log_fault_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_FAULT, "%s called with null modelURL", buf, 0xCu);
    }

    v24 = 0LL;
    goto LABEL_9;
  }

  uint64_t v26 = nplog_obj(0LL, v2, v3);
  uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_fault_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_FAULT, "[super init] failed", buf, 2u);
  }

  v24 = 0LL;
LABEL_11:

  return v24;
}

+ (id)getProactiveTokenFetchConfiguration
{
  if (qword_100117180)
  {
LABEL_16:
    uint64_t v17 = nplog_obj(a1, a2, v2);
    v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      int v20 = 138412290;
      uint64_t v21 = (const char *)qword_100117180;
      _os_log_debug_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEBUG,  "ProactiveTokenFetch Params %@",  (uint8_t *)&v20,  0xCu);
    }

    return (id)qword_100117180;
  }

  uint64_t v3 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  uint64_t v4 = (void *)qword_100117180;
  qword_100117180 = (uint64_t)v3;

  uint64_t v5 = qword_100117180;
  uint64_t v9 = nplog_obj(v6, v7, v8);
  uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  uint64_t v11 = v10;
  if (v5)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      LOWORD(v20) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_INFO,  "Setting default values for ProactiveFetchConfiguration",  (uint8_t *)&v20,  2u);
    }

    [(id)qword_100117180 setObject:&__kCFBooleanTrue forKey:@"NSPEventsKeyProactiveTokenFetchEnabled"];
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", 30LL));
    if (v12) {
      [(id)qword_100117180 setObject:v12 forKey:@"NSPEventsKeyStatsDuration"];
    }
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", 40LL));
    if (v13) {
      [(id)qword_100117180 setObject:v13 forKey:@"NSPEventsKeyLowerTokenCountThreshold"];
    }
    int v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", 0.6));
    if (v14) {
      [(id)qword_100117180 setObject:v14 forKey:@"NSPEventsKeyLowerTokenCountProbability"];
    }
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", 3LL));
    if (v15) {
      [(id)qword_100117180 setObject:v15 forKey:@"NSPEventsKeyUpperLWMCountThreshold"];
    }
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", 0.1));
    if (v16) {
      [(id)qword_100117180 setObject:v16 forKey:@"NSPEventsKeyUpperLWMCountProbabilityOffset"];
    }

    goto LABEL_16;
  }

  if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
  {
    int v20 = 136315138;
    uint64_t v21 = "+[NSPCoreData getProactiveTokenFetchConfiguration]";
    _os_log_fault_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_FAULT,  "%s called with null config",  (uint8_t *)&v20,  0xCu);
  }

  return 0LL;
}

+ (id)updateProactiveTokenFetchConfiguration:(id)a3 statsDuration:(id)a4 lowerTokenCountThreshold:(id)a5 lowerTokenCountProbability:(id)a6 upperLWMCountThreshold:(id)a7 upperLWMCountProbabilityOffset:(id)a8
{
  id v13 = a3;
  int v14 = (char *)a4;
  v15 = (char *)a5;
  uint64_t v16 = (char *)a6;
  uint64_t v17 = (char *)a7;
  v18 = (char *)a8;
  v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSPCoreData getProactiveTokenFetchConfiguration]( &OBJC_CLASS___NSPCoreData,  "getProactiveTokenFetchConfiguration"));
  uint64_t v22 = v19;
  if (v19)
  {
    if (v13)
    {
      id v23 = [v19 setObject:v13 forKey:@"NSPEventsKeyProactiveTokenFetchEnabled"];
      uint64_t v26 = nplog_obj(v23, v24, v25);
      uint64_t v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      {
        unsigned int v28 = [v13 BOOLValue];
        v29 = "NO";
        if (v28) {
          v29 = "YES";
        }
        int v63 = 136315138;
        v64 = v29;
        uint64_t v30 = "updated NSPEventsKeyProactiveTokenFetchEnabled %s";
        v31 = v27;
        uint32_t v32 = 12;
        goto LABEL_9;
      }
    }

    else
    {
      uint64_t v33 = nplog_obj(v19, v20, v21);
      uint64_t v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      {
        LOWORD(v63) = 0;
        uint64_t v30 = "NSPEventsKeyProactiveTokenFetchEnabled not found";
        v31 = v27;
        uint32_t v32 = 2;
LABEL_9:
        _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_INFO, v30, (uint8_t *)&v63, v32);
      }
    }

    if (v14)
    {
      id v34 = [v22 setObject:v14 forKey:@"NSPEventsKeyStatsDuration"];
      uint64_t v37 = nplog_obj(v34, v35, v36);
      v38 = (os_log_s *)objc_claimAutoreleasedReturnValue(v37);
      if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
      {
        int v63 = 138412290;
        v64 = v14;
        _os_log_impl( (void *)&_mh_execute_header,  v38,  OS_LOG_TYPE_INFO,  "updated NSPEventsKeyStatsDuration %@",  (uint8_t *)&v63,  0xCu);
      }
    }

    if (v15)
    {
      id v39 = [v22 setObject:v15 forKey:@"NSPEventsKeyLowerTokenCountThreshold"];
      uint64_t v42 = nplog_obj(v39, v40, v41);
      v43 = (os_log_s *)objc_claimAutoreleasedReturnValue(v42);
      if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
      {
        int v63 = 138412290;
        v64 = v15;
        _os_log_impl( (void *)&_mh_execute_header,  v43,  OS_LOG_TYPE_INFO,  "updated NSPEventsKeyLowerTokenCountThreshold %@",  (uint8_t *)&v63,  0xCu);
      }
    }

    if (v16)
    {
      id v44 = [v22 setObject:v16 forKey:@"NSPEventsKeyLowerTokenCountProbability"];
      uint64_t v47 = nplog_obj(v44, v45, v46);
      v48 = (os_log_s *)objc_claimAutoreleasedReturnValue(v47);
      if (os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
      {
        int v63 = 138412290;
        v64 = v16;
        _os_log_impl( (void *)&_mh_execute_header,  v48,  OS_LOG_TYPE_INFO,  "updated NSPEventsKeyLowerTokenCountProbability %@",  (uint8_t *)&v63,  0xCu);
      }
    }

    if (v17)
    {
      id v49 = [v22 setObject:v17 forKey:@"NSPEventsKeyUpperLWMCountThreshold"];
      uint64_t v52 = nplog_obj(v49, v50, v51);
      v53 = (os_log_s *)objc_claimAutoreleasedReturnValue(v52);
      if (os_log_type_enabled(v53, OS_LOG_TYPE_INFO))
      {
        int v63 = 138412290;
        v64 = v17;
        _os_log_impl( (void *)&_mh_execute_header,  v53,  OS_LOG_TYPE_INFO,  "updated NSPEventsKeyUpperLWMCountThreshold %@",  (uint8_t *)&v63,  0xCu);
      }
    }

    if (v18)
    {
      id v54 = [v22 setObject:v18 forKey:@"NSPEventsKeyUpperLWMCountProbabilityOffset"];
      uint64_t v57 = nplog_obj(v54, v55, v56);
      v58 = (os_log_s *)objc_claimAutoreleasedReturnValue(v57);
      if (os_log_type_enabled(v58, OS_LOG_TYPE_INFO))
      {
        int v63 = 138412290;
        v64 = v18;
        _os_log_impl( (void *)&_mh_execute_header,  v58,  OS_LOG_TYPE_INFO,  "updated NSPEventsKeyUpperLWMCountProbabilityOffset %@",  (uint8_t *)&v63,  0xCu);
      }
    }

    id v59 = v22;
    goto LABEL_31;
  }

  uint64_t v61 = nplog_obj(0LL, v20, v21);
  v62 = (os_log_s *)objc_claimAutoreleasedReturnValue(v61);
  if (os_log_type_enabled(v62, OS_LOG_TYPE_FAULT))
  {
    int v63 = 136315138;
    v64 = "+[NSPCoreData updateProactiveTokenFetchConfiguration:statsDuration:lowerTokenCountThreshold:lowerTokenCountPro"
          "bability:upperLWMCountThreshold:upperLWMCountProbabilityOffset:]";
    _os_log_fault_impl( (void *)&_mh_execute_header,  v62,  OS_LOG_TYPE_FAULT,  "%s called with null config",  (uint8_t *)&v63,  0xCu);
  }

LABEL_31:
  return v22;
}

+ (BOOL)triggerProactiveTokenFetch:(id)a3 lowerTokenCountThreshold:(unint64_t)a4
{
  double v152 = COERCE_DOUBLE(a3);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSPCoreData getProactiveTokenFetchConfiguration]( &OBJC_CLASS___NSPCoreData,  "getProactiveTokenFetchConfiguration"));
  uint64_t v8 = v5;
  if (v5)
  {
    uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue([v5 objectForKey:@"NSPEventsKeyProactiveTokenFetchEnabled"]);
    uint64_t v12 = v9;
    if (v9)
    {
      id v13 = -[os_log_s BOOLValue](v9, "BOOLValue");
      if ((v13 & 1) != 0)
      {
        if (qword_100117188
          || (uint64_t v16 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary),
              uint64_t v17 = (void *)qword_100117188,
              qword_100117188 = (uint64_t)v16,
              v17,
              qword_100117188))
        {
          id v23 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:@"NSPEventsKeyStatsDuration"]);
          if (!v23)
          {
            uint64_t v124 = nplog_obj(0LL, v21, v22);
            uint64_t v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v124);
            if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 136315138;
              double v159 = COERCE_DOUBLE("+[NSPCoreData triggerProactiveTokenFetch:lowerTokenCountThreshold:]");
              _os_log_fault_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_FAULT,  "%s called with null statsDuration",  buf,  0xCu);
            }

            LOBYTE(v48) = 0;
            goto LABEL_76;
          }

          uint64_t v24 = (os_log_s *)objc_claimAutoreleasedReturnValue([(id)qword_100117188 objectForKey:*(void *)&v152]);
          if (v24)
          {
            uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
            [v25 timeIntervalSinceDate:v24];
            double v27 = v26;

            id v28 = [v23 integerValue];
            if (v27 < (double)(60 * (uint64_t)v28))
            {
              uint64_t v86 = nplog_obj(v28, v29, v30);
              uint64_t v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(v86);
              if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 134218242;
                double v159 = (double)(60 * (uint64_t)[v23 integerValue]) - v27;
                __int16 v160 = 2112;
                double v161 = v152;
                _os_log_impl( (void *)&_mh_execute_header,  v33,  OS_LOG_TYPE_INFO,  "%f seconds left before next trigger checkpoint for vendor %@",  buf,  0x16u);
              }

              LOBYTE(v48) = 0;
              goto LABEL_75;
            }

            [(id)qword_100117188 removeObjectForKey:*(void *)&v152];
          }

          uint64_t v33 = -[NSCalendar initWithCalendarIdentifier:]( objc_alloc(&OBJC_CLASS___NSCalendar),  "initWithCalendarIdentifier:",  NSCalendarIdentifierGregorian);
          if (!v33)
          {
            uint64_t v125 = nplog_obj(0LL, v31, v32);
            v120 = (os_log_s *)objc_claimAutoreleasedReturnValue(v125);
            if (os_log_type_enabled(v120, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 136315138;
              double v159 = COERCE_DOUBLE("+[NSPCoreData triggerProactiveTokenFetch:lowerTokenCountThreshold:]");
              _os_log_fault_impl( (void *)&_mh_execute_header,  v120,  OS_LOG_TYPE_FAULT,  "%s called with null calendar",  buf,  0xCu);
            }

            LOBYTE(v48) = 0;
            goto LABEL_74;
          }

          uint64_t v141 = objc_claimAutoreleasedReturnValue( +[NSTimeZone timeZoneWithAbbreviation:]( &OBJC_CLASS___NSTimeZone,  "timeZoneWithAbbreviation:",  @"UTC"));
          -[os_log_s setTimeZone:](v33, "setTimeZone:");
          id v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSPCoreData getMinMaxDate](&OBJC_CLASS___NSPCoreData, "getMinMaxDate"));
          v142 = v34;
          if (!v34)
          {
            uint64_t v126 = nplog_obj(0LL, v35, v36);
            v38 = (os_log_s *)objc_claimAutoreleasedReturnValue(v126);
            if (os_log_type_enabled(v38, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 136315138;
              double v159 = COERCE_DOUBLE("+[NSPCoreData triggerProactiveTokenFetch:lowerTokenCountThreshold:]");
              _os_log_fault_impl( (void *)&_mh_execute_header,  v38,  OS_LOG_TYPE_FAULT,  "%s called with null dict",  buf,  0xCu);
            }

            LOBYTE(v48) = 0;
            v120 = (os_log_s *)v141;
            goto LABEL_73;
          }

          uint64_t v37 = v34;
          v38 = (os_log_s *)objc_claimAutoreleasedReturnValue([v34 objectForKey:@"minDate"]);
          uint64_t v39 = objc_claimAutoreleasedReturnValue([v37 objectForKey:@"maxDate"]);
          uint64_t v42 = (void *)v39;
          if (v38)
          {
            if (v39)
            {
              v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
              uint64_t v44 = objc_claimAutoreleasedReturnValue(-[os_log_s components:fromDate:](v33, "components:fromDate:", 736LL, v43));

              uint64_t v45 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s dateFromComponents:](v33, "dateFromComponents:", v44));
              [v23 doubleValue];
              v150 = v45;
              v149 = (void *)objc_claimAutoreleasedReturnValue([v45 dateByAddingTimeInterval:v46 * 60.0]);
              p_superclass = &OBJC_CLASS___NSPAuxiliaryAuthInfo.superclass;
              os_log_t log = (os_log_t)v44;
              uint64_t v48 = objc_claimAutoreleasedReturnValue( +[NSPCoreData getNSPEventStatsForSingleWindow:eventType:startDate:endDate:windowStartTime:windowDuration:]( &OBJC_CLASS___NSPCoreData,  "getNSPEventStatsForSingleWindow:eventType:startDate:endDate:windowStartTime:windowDuration:",  *(void *)&v152,  0LL,  v38,  v42,  v44,  v23));
              v144 = v42;
              v145 = v38;
              v139 = v24;
              v140 = v33;
              v143 = (void *)v48;
              if (v48)
              {
                uint64_t v49 = objc_claimAutoreleasedReturnValue( +[NSPCoreData getNSPEventsProbability:count:]( &OBJC_CLASS___NSPCoreData,  "getNSPEventsProbability:count:",  v48,  0LL));
                v151 = (void *)v49;
                if (v49)
                {
                  uint64_t v52 = nplog_obj(v49, v50, v51);
                  v53 = (os_log_s *)objc_claimAutoreleasedReturnValue(v52);
                  if (os_log_type_enabled(v53, OS_LOG_TYPE_INFO))
                  {
                    double v54 = COERCE_DOUBLE([v23 integerValue]);
                    [v151 doubleValue];
                    *(_DWORD *)buf = 134218498;
                    double v159 = v54;
                    __int16 v160 = 2112;
                    double v161 = v152;
                    __int16 v162 = 2048;
                    double v163 = v55;
                    _os_log_impl( (void *)&_mh_execute_header,  v53,  OS_LOG_TYPE_INFO,  "Probability of 0 LWM events in next %ld mins for vendor:%@ is %f",  buf,  0x20u);
                  }

                  uint64_t v56 = (os_log_s *)objc_claimAutoreleasedReturnValue([v8 objectForKey:@"NSPEventsKeyUpperLWMCountThreshold"]);
                  if (!v56)
                  {
                    uint64_t v134 = nplog_obj(0LL, v57, v58);
                    id v59 = (os_log_s *)objc_claimAutoreleasedReturnValue(v134);
                    if (os_log_type_enabled(v59, OS_LOG_TYPE_FAULT))
                    {
                      *(_DWORD *)buf = 136315138;
                      double v159 = COERCE_DOUBLE("+[NSPCoreData triggerProactiveTokenFetch:lowerTokenCountThreshold:]");
                      v131 = "%s called with null upperLWMCount";
                      goto LABEL_110;
                    }

+ (id)getNSPEventsProbability:(id)a3 count:(int64_t)a4
{
  id v5 = a3;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:@"mean"]);
  if (v8)
  {
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:@"stdDev"]);
    if (v9)
    {
      uint64_t v12 = v9;
      id v13 = [v9 doubleValue];
      if (v16 != 0.0)
      {
        [v8 doubleValue];
        double v21 = (double)a4 - v20;
        [v12 doubleValue];
        id v23 = +[NSNumber numberWithDouble:]( &OBJC_CLASS___NSNumber,  "numberWithDouble:",  (erf(v21 / v22 / 1.41421356) + 1.0) * 0.5);
        uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(v23);
        goto LABEL_9;
      }

      uint64_t v17 = nplog_obj(v13, v14, v15);
      uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      {
        LOWORD(v28) = 0;
        _os_log_debug_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEBUG,  "Standard Deviation is 0",  (uint8_t *)&v28,  2u);
      }
    }

    else
    {
      uint64_t v26 = nplog_obj(0LL, v10, v11);
      double v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
      if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT))
      {
        int v28 = 136315138;
        uint64_t v29 = "+[NSPCoreData getNSPEventsProbability:count:]";
        _os_log_fault_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_FAULT,  "%s called with null stdDev",  (uint8_t *)&v28,  0xCu);
      }

      uint64_t v12 = 0LL;
    }
  }

  else
  {
    uint64_t v25 = nplog_obj(0LL, v6, v7);
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled((os_log_t)v12, OS_LOG_TYPE_FAULT))
    {
      int v28 = 136315138;
      uint64_t v29 = "+[NSPCoreData getNSPEventsProbability:count:]";
      _os_log_fault_impl( (void *)&_mh_execute_header,  (os_log_t)v12,  OS_LOG_TYPE_FAULT,  "%s called with null mean",  (uint8_t *)&v28,  0xCu);
    }
  }

  uint64_t v19 = 0LL;
LABEL_9:

  return v19;
}

+ (id)getMinMaxDate
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSPCoreData sharedCoreDataContext](&OBJC_CLASS___NSPCoreData, "sharedCoreDataContext"));
  id v5 = v2;
  if (v2)
  {
    *(void *)buf = 0LL;
    uint64_t v14 = buf;
    uint64_t v15 = 0x3032000000LL;
    double v16 = sub_100077D9C;
    uint64_t v17 = sub_100077DAC;
    id v18 = 0LL;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_100077DB4;
    v10[3] = &unk_1000F9428;
    id v11 = v2;
    uint64_t v12 = buf;
    [v11 performBlockAndWait:v10];
    id v6 = *((id *)v14 + 5);

    _Block_object_dispose(buf, 8);
  }

  else
  {
    uint64_t v7 = nplog_obj(0LL, v3, v4);
    uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_ERROR,  "NSP Core Data context not available",  buf,  2u);
    }

    id v6 = 0LL;
  }

  return v6;
}

+ (id)computeStats:(id)a3
{
  id v3 = a3;
  id v6 = v3;
  if (!v3)
  {
    uint64_t v33 = nplog_obj(0LL, v4, v5);
    uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v42 = "+[NSPCoreData computeStats:]";
      _os_log_fault_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_FAULT, "%s called with null data", buf, 0xCu);
    }

    goto LABEL_5;
  }

  id v7 = [v3 count];
  unint64_t v10 = (unint64_t)v7;
  if ((unint64_t)v7 <= 4)
  {
    uint64_t v11 = nplog_obj(v7, v8, v9);
    uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134218240;
      uint64_t v42 = (const char *)v10;
      __int16 v43 = 1024;
      int v44 = 5;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_INFO,  "Insufficient number of data points to compute stats. (%lu vs %d)",  buf,  0x12u);
    }

+ (id)getNSPEventStatsForSingleWindow:(id)a3 eventType:(int64_t)a4 startDate:(id)a5 endDate:(id)a6 windowStartTime:(id)a7 windowDuration:(id)a8
{
  id v46 = a3;
  id v13 = a5;
  id v14 = a6;
  id v47 = a7;
  id v15 = a8;
  uint64_t v16 = objc_claimAutoreleasedReturnValue(+[NSPCoreData sharedCoreDataContext](&OBJC_CLASS___NSPCoreData, "sharedCoreDataContext"));
  id v19 = (void *)v16;
  if (!v16)
  {
    uint64_t v34 = nplog_obj(0LL, v17, v18);
    double v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v34);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_ERROR,  "NSP Core Data context not available",  buf,  2u);
    }

    goto LABEL_12;
  }

  if (!v13)
  {
    uint64_t v40 = nplog_obj(v16, v17, v18);
    double v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v40);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      *(void *)&uint8_t buf[4] = "+[NSPCoreData getNSPEventStatsForSingleWindow:eventType:startDate:endDate:windowStartTime:windowDuration:]";
      uint64_t v41 = "%s called with null startDate";
LABEL_27:
      _os_log_fault_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_FAULT, v41, buf, 0xCu);
    }

+ (id)getNSPTokenStatsForSingleWindow:(id)a3 startDate:(id)a4 endDate:(id)a5 windowStartTime:(id)a6 windowDuration:(id)a7 statsCategory:(int64_t)a8
{
  char v8 = a8;
  id v13 = a3;
  id v53 = a4;
  id v51 = a5;
  id v14 = a6;
  id v50 = a7;
  id v52 = (void *)objc_claimAutoreleasedReturnValue(+[NSPCoreData sharedCoreDataContext](&OBJC_CLASS___NSPCoreData, "sharedCoreDataContext"));
  if (v52)
  {
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSPTokenEvent fetchRequest](&OBJC_CLASS___NSPTokenEvent, "fetchRequest"));
    uint64_t v20 = v17;
    if (v17)
    {
      if (v53)
      {
        if (v51)
        {
          [v17 setPropertiesToFetch:&off_100103AB8];
          [v20 setResultType:2];
          osos_log_t log = -[NSCalendar initWithCalendarIdentifier:]( objc_alloc(&OBJC_CLASS___NSCalendar),  "initWithCalendarIdentifier:",  NSCalendarIdentifierGregorian);
          if (oslog)
          {
            os_log_t log = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSTimeZone timeZoneWithAbbreviation:]( &OBJC_CLASS___NSTimeZone,  "timeZoneWithAbbreviation:",  @"UTC"));
            -[NSCalendar setTimeZone:](oslog, "setTimeZone:", log);
            double v23 = (void *)objc_claimAutoreleasedReturnValue( -[NSCalendar components:fromDate:toDate:options:]( oslog,  "components:fromDate:toDate:options:",  16LL,  v53,  v51,  0LL));
            uint64_t v26 = v23;
            if (v23)
            {
              uint64_t v80 = 0LL;
              uint64_t v81 = &v80;
              uint64_t v82 = 0x2020000000LL;
              id v27 = [v23 day];
              id v83 = v27;
              if ((unint64_t)v81[3] < 0x1F)
              {
                [v26 setDay:1];
                id v34 = [v14 weekday];
                *(void *)buf = 0LL;
                *(void *)&uint8_t buf[8] = buf;
                *(void *)&buf[16] = 0x3032000000LL;
                uint64_t v85 = sub_100077D9C;
                uint64_t v86 = sub_100077DAC;
                id v87 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
                uint64_t v74 = 0LL;
                double v75 = &v74;
                uint64_t v76 = 0x3032000000LL;
                uint64_t v77 = sub_100077D9C;
                uint64_t v78 = sub_100077DAC;
                id v79 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
                uint64_t v68 = 0LL;
                uint64_t v69 = &v68;
                uint64_t v70 = 0x3032000000LL;
                v71 = sub_100077D9C;
                double v72 = sub_100077DAC;
                id v73 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
                v54[0] = _NSConcreteStackBlock;
                v54[1] = 3221225472LL;
                v54[2] = sub_1000797F8;
                v54[3] = &unk_1000FA678;
                id v55 = v53;
                id v63 = &v80;
                id v56 = oslog;
                id v57 = v26;
                id v58 = v14;
                id v59 = v50;
                id v60 = v13;
                id v61 = v20;
                id v62 = v52;
                uint64_t v64 = &v74;
                double v66 = &v68;
                id v67 = v34;
                v65 = buf;
                [v62 performBlockAndWait:v54];
                uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
                if ((v8 & 1) != 0)
                {
                  uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
                  [v35 addObjectsFromArray:*(void *)(*(void *)&buf[8] + 40)];
                  [v35 addObjectsFromArray:v75[5]];
                  uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSPCoreData computeStats:](&OBJC_CLASS___NSPCoreData, "computeStats:", v35));
                  if (v36) {
                    [v32 addObject:v36];
                  }
                }

                if ((v8 & 2) != 0)
                {
                  uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue( +[NSPCoreData computeStats:]( &OBJC_CLASS___NSPCoreData,  "computeStats:",  *(void *)(*(void *)&buf[8] + 40LL)));
                  if (v37) {
                    [v32 addObject:v37];
                  }
                }

                if ((v8 & 4) != 0)
                {
                  v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSPCoreData computeStats:](&OBJC_CLASS___NSPCoreData, "computeStats:", v75[5]));
                  if (v38) {
                    [v32 addObject:v38];
                  }
                }

                if ((v8 & 8) != 0)
                {
                  uint64_t v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSPCoreData computeStats:](&OBJC_CLASS___NSPCoreData, "computeStats:", v69[5]));
                  if (v39) {
                    [v32 addObject:v39];
                  }
                }

                _Block_object_dispose(&v68, 8);
                _Block_object_dispose(&v74, 8);

                _Block_object_dispose(buf, 8);
              }

              else
              {
                uint64_t v30 = nplog_obj(v27, v28, v29);
                uint64_t v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
                if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138412546;
                  *(void *)&uint8_t buf[4] = v53;
                  *(_WORD *)&buf[12] = 2112;
                  *(void *)&buf[14] = v51;
                  _os_log_error_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_ERROR,  "Invalid dates. startDate: %@  endDate: %@",  buf,  0x16u);
                }

                uint64_t v32 = 0LL;
              }

              _Block_object_dispose(&v80, 8);
            }

            else
            {
              uint64_t v46 = nplog_obj(0LL, v24, v25);
              id v47 = (os_log_s *)objc_claimAutoreleasedReturnValue(v46);
              if (os_log_type_enabled(v47, OS_LOG_TYPE_FAULT))
              {
                *(_DWORD *)buf = 136315138;
                *(void *)&uint8_t buf[4] = "+[NSPCoreData getNSPTokenStatsForSingleWindow:startDate:endDate:windowStartTime:win"
                                     "dowDuration:statsCategory:]";
                _os_log_fault_impl( (void *)&_mh_execute_header,  v47,  OS_LOG_TYPE_FAULT,  "%s called with null dayComponents",  buf,  0xCu);
              }

              uint64_t v32 = 0LL;
            }
          }

          else
          {
            uint64_t v45 = nplog_obj(0LL, v21, v22);
            os_log_t log = (os_log_s *)objc_claimAutoreleasedReturnValue(v45);
            if (os_log_type_enabled(log, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 136315138;
              *(void *)&uint8_t buf[4] = "+[NSPCoreData getNSPTokenStatsForSingleWindow:startDate:endDate:windowStartTime:windo"
                                   "wDuration:statsCategory:]";
              _os_log_fault_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_FAULT,  "%s called with null calendar",  buf,  0xCu);
            }

            uint64_t v32 = 0LL;
          }

          goto LABEL_34;
        }

        uint64_t v44 = nplog_obj(v17, v18, v19);
        osos_log_t log = (NSCalendar *)objc_claimAutoreleasedReturnValue(v44);
        if (!os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_FAULT))
        {
LABEL_41:
          uint64_t v32 = 0LL;
LABEL_34:

          goto LABEL_35;
        }

        *(_DWORD *)buf = 136315138;
        *(void *)&uint8_t buf[4] = "+[NSPCoreData getNSPTokenStatsForSingleWindow:startDate:endDate:windowStartTime:windowDurat"
                             "ion:statsCategory:]";
        uint64_t v42 = "%s called with null endDate";
      }

      else
      {
        uint64_t v43 = nplog_obj(v17, v18, v19);
        osos_log_t log = (NSCalendar *)objc_claimAutoreleasedReturnValue(v43);
        if (!os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_FAULT)) {
          goto LABEL_41;
        }
        *(_DWORD *)buf = 136315138;
        *(void *)&uint8_t buf[4] = "+[NSPCoreData getNSPTokenStatsForSingleWindow:startDate:endDate:windowStartTime:windowDurat"
                             "ion:statsCategory:]";
        uint64_t v42 = "%s called with null startDate";
      }
    }

    else
    {
      uint64_t v41 = nplog_obj(0LL, v18, v19);
      osos_log_t log = (NSCalendar *)objc_claimAutoreleasedReturnValue(v41);
      if (!os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_FAULT)) {
        goto LABEL_41;
      }
      *(_DWORD *)buf = 136315138;
      *(void *)&uint8_t buf[4] = "+[NSPCoreData getNSPTokenStatsForSingleWindow:startDate:endDate:windowStartTime:windowDuratio"
                           "n:statsCategory:]";
      uint64_t v42 = "%s called with null fetchRequest";
    }

    _os_log_fault_impl((void *)&_mh_execute_header, (os_log_t)oslog, OS_LOG_TYPE_FAULT, v42, buf, 0xCu);
    goto LABEL_41;
  }

  uint64_t v33 = nplog_obj(0LL, v15, v16);
  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(v33);
  if (os_log_type_enabled((os_log_t)v20, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)v20,  OS_LOG_TYPE_ERROR,  "NSP Core Data context not available",  buf,  2u);
  }

  uint64_t v32 = 0LL;
LABEL_35:

  return v32;
}

+ (id)getTokenCountStatsForMultipleWindows:(id)a3 minDate:(id)a4 maxDate:(id)a5 windowDuration:(id)a6
{
  id v43 = a3;
  id v42 = a4;
  id v41 = a5;
  id v9 = a6;
  uint64_t v12 = -[NSCalendar initWithCalendarIdentifier:]( objc_alloc(&OBJC_CLASS___NSCalendar),  "initWithCalendarIdentifier:",  NSCalendarIdentifierGregorian);
  if (v12)
  {
    uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSTimeZone timeZoneWithAbbreviation:]( &OBJC_CLASS___NSTimeZone,  "timeZoneWithAbbreviation:",  @"UTC"));
    if (v15)
    {
      uint64_t v40 = v15;
      -[NSCalendar setTimeZone:](v12, "setTimeZone:", v15);
      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
      uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(-[NSCalendar components:fromDate:](v12, "components:fromDate:", 28LL, v16));
      [v17 setHour:0];
      [v17 setMinute:0];
      [v17 setSecond:0];
      uint64_t v39 = v17;
      uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[NSCalendar dateFromComponents:](v12, "dateFromComponents:", v17));

      uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s dateByAddingTimeInterval:](v18, "dateByAddingTimeInterval:", 86400.0));
      [v9 doubleValue];
      double v21 = v20;
      uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
      uint64_t v25 = nplog_obj(v22, v23, v24);
      uint64_t v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412546;
        id v47 = (const char *)v18;
        __int16 v48 = 2112;
        uint64_t v49 = v19;
        _os_log_debug_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEBUG,  "currentDate: %@  endDate: %@",  buf,  0x16u);
      }

      v44[0] = @"mean";
      id v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", 0.0));
      v44[1] = @"stdDev";
      v45[0] = v27;
      uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", -1.0));
      v45[1] = v28;
      uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v45,  v44,  2LL));

      if (-[NSCalendar compareDate:toDate:toUnitGranularity:]( v12,  "compareDate:toDate:toUnitGranularity:",  v18,  v19,  16LL) == NSOrderedAscending)
      {
        double v31 = v21 * 60.0;
        do
        {
          uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue(-[NSCalendar components:fromDate:](v12, "components:fromDate:", 96LL, v18));
          uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue( +[NSPCoreData getNSPTokenStatsForSingleWindow:startDate:endDate:windowStartTime:windowDuration:statsCategory:]( &OBJC_CLASS___NSPCoreData,  "getNSPTokenStatsForSingleWindow:startDate:endDate:windowStartTime:windowDuration:statsCategory:",  v43,  v42,  v41,  v32,  v9,  1LL));
          id v34 = v33;
          if (v33 && [v33 count])
          {
            uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue([v34 objectAtIndexedSubscript:0]);
            [v22 addObject:v35];
          }

          else
          {
            [v22 addObject:v29];
          }

          uint64_t v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[os_log_s dateByAddingTimeInterval:](v18, "dateByAddingTimeInterval:", v31));

          uint64_t v18 = v30;
        }

        while (-[NSCalendar compareDate:toDate:toUnitGranularity:]( v12,  "compareDate:toDate:toUnitGranularity:",  v30,  v19,  16LL) == NSOrderedAscending);
      }

      else
      {
        uint64_t v30 = v18;
      }

      uint64_t v15 = v40;
    }

    else
    {
      uint64_t v38 = nplog_obj(0LL, v13, v14);
      uint64_t v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v38);
      if (os_log_type_enabled(v30, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315138;
        id v47 = "+[NSPCoreData getTokenCountStatsForMultipleWindows:minDate:maxDate:windowDuration:]";
        _os_log_fault_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_FAULT,  "%s called with null timeZone",  buf,  0xCu);
      }

      uint64_t v22 = 0LL;
    }
  }

  else
  {
    uint64_t v37 = nplog_obj(0LL, v10, v11);
    uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v37);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      id v47 = "+[NSPCoreData getTokenCountStatsForMultipleWindows:minDate:maxDate:windowDuration:]";
      _os_log_fault_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_FAULT, "%s called with null calendar", buf, 0xCu);
    }

    uint64_t v22 = 0LL;
  }

  return v22;
}

+ (void)saveTokenEvent:(id)a3 eventType:(int)a4 vendor:(id)a5 tokenCount:(unint64_t)a6
{
  id v9 = a3;
  id v10 = a5;
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSPCoreData sharedCoreDataContext](&OBJC_CLASS___NSPCoreData, "sharedCoreDataContext"));
  uint64_t v14 = v11;
  if (v11)
  {
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472LL;
    v17[2] = sub_10007A278;
    v17[3] = &unk_1000FA6A0;
    id v18 = v11;
    id v19 = v9;
    int v22 = a4;
    id v20 = v10;
    unint64_t v21 = a6;
    [v18 performBlockAndWait:v17];
  }

  else
  {
    uint64_t v15 = nplog_obj(0LL, v12, v13);
    uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_ERROR,  "NSP Core Data context not available",  buf,  2u);
    }
  }
}

+ (void)purgeEventsOlderThanDate:(id)a3
{
  id v3 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSPCoreData sharedCoreDataContext](&OBJC_CLASS___NSPCoreData, "sharedCoreDataContext"));
  if (v6)
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_10007A5F0;
    v9[3] = &unk_1000F9A80;
    id v10 = v3;
    id v11 = v6;
    [v11 performBlockAndWait:v9];
  }

  else
  {
    uint64_t v7 = nplog_obj(0LL, v4, v5);
    char v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_ERROR,  "NSP Core Data context not available",  buf,  2u);
    }
  }
}

+ (void)purgeEventsOlderThanDays:(int64_t)a3
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](&OBJC_CLASS___NSCalendar, "currentCalendar"));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  id v6 = (id)objc_claimAutoreleasedReturnValue([v4 dateByAddingUnit:16 value:-a3 toDate:v5 options:0]);

  +[NSPCoreData purgeEventsOlderThanDate:](&OBJC_CLASS___NSPCoreData, "purgeEventsOlderThanDate:", v6);
}

+ (id)fetchEvents
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSPCoreData sharedCoreDataContext](&OBJC_CLASS___NSPCoreData, "sharedCoreDataContext"));
  uint64_t v5 = v2;
  if (v2)
  {
    *(void *)buf = 0LL;
    uint64_t v14 = buf;
    uint64_t v15 = 0x3032000000LL;
    uint64_t v16 = sub_100077D9C;
    uint64_t v17 = sub_100077DAC;
    id v18 = 0LL;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_10007AB04;
    v10[3] = &unk_1000FA6C8;
    uint64_t v12 = buf;
    id v11 = v2;
    [v11 performBlockAndWait:v10];
    id v6 = *((id *)v14 + 5);

    _Block_object_dispose(buf, 8);
  }

  else
  {
    uint64_t v7 = nplog_obj(0LL, v3, v4);
    char v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_ERROR,  "NSP Core Data context not available",  buf,  2u);
    }

    id v6 = 0LL;
  }

  return v6;
}

+ (id)NSPEventsCacheGet
{
  uint64_t v2 = (void *)qword_100117190;
  if (!qword_100117190)
  {
    uint64_t v3 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    uint64_t v4 = (void *)qword_100117190;
    qword_100117190 = (uint64_t)v3;

    uint64_t v2 = (void *)qword_100117190;
  }

  return v2;
}

+ (id)NSPEventsCacheUpdate:(id)a3
{
  id v3 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSPCoreData NSPEventsCacheGet](&OBJC_CLASS___NSPCoreData, "NSPEventsCacheGet"));
  if (v6)
  {
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v3 vendor]);
    id v8 = (id)objc_claimAutoreleasedReturnValue(+[NSPCoreData getVendorIdFromDictionary:](&OBJC_CLASS___NSPCoreData, "getVendorIdFromDictionary:", v7));

    if (v8)
    {
      [v6 addObject:v3];
      id v8 = v6;
    }
  }

  else
  {
    uint64_t v10 = nplog_obj(0LL, v4, v5);
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
    {
      int v12 = 136315138;
      uint64_t v13 = "+[NSPCoreData NSPEventsCacheUpdate:]";
      _os_log_fault_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_FAULT,  "%s called with null cache",  (uint8_t *)&v12,  0xCu);
    }

    id v8 = 0LL;
  }

  return v8;
}

+ (id)fetchLatestEvents:(unint64_t)a3 vendors:(id)a4
{
  id v5 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSPCoreData sharedCoreDataContext](&OBJC_CLASS___NSPCoreData, "sharedCoreDataContext"));
  if (v8)
  {
    id v9 = (id)objc_claimAutoreleasedReturnValue(+[NSPCoreData NSPEventsCacheGet](&OBJC_CLASS___NSPCoreData, "NSPEventsCacheGet"));
    id v10 = [v9 count];
    if ((unint64_t)v10 >= a3)
    {
      uint64_t v15 = nplog_obj(v10, v11, v12);
      uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "Using NSP events from the cache", buf, 2u);
      }

      id v9 = v9;
      id v13 = v9;
    }

    else
    {
      *(void *)buf = 0LL;
      uint64_t v24 = buf;
      uint64_t v25 = 0x3032000000LL;
      uint64_t v26 = sub_100077D9C;
      id v27 = sub_100077DAC;
      id v28 = 0LL;
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472LL;
      v18[2] = sub_10007B110;
      v18[3] = &unk_1000FA6F0;
      unint64_t v22 = a3;
      id v19 = v5;
      unint64_t v21 = buf;
      id v20 = v8;
      [v20 performBlockAndWait:v18];
      id v13 = *((id *)v24 + 5);

      _Block_object_dispose(buf, 8);
    }
  }

  else
  {
    uint64_t v14 = nplog_obj(0LL, v6, v7);
    id v9 = (id)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled((os_log_t)v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)v9,  OS_LOG_TYPE_ERROR,  "NSP Core Data context not available",  buf,  2u);
    }

    id v13 = 0LL;
  }

  return v13;
}

+ (id)fetchEvents:(id)a3 mostRecent:(BOOL)a4 limit:(unint64_t)a5
{
  id v7 = a3;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSPCoreData sharedCoreDataContext](&OBJC_CLASS___NSPCoreData, "sharedCoreDataContext"));
  if (v10)
  {
    *(void *)buf = 0LL;
    unint64_t v22 = buf;
    uint64_t v23 = 0x3032000000LL;
    uint64_t v24 = sub_100077D9C;
    uint64_t v25 = sub_100077DAC;
    id v26 = 0LL;
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_10007B928;
    v15[3] = &unk_1000FA718;
    BOOL v20 = a4;
    id v18 = buf;
    unint64_t v19 = a5;
    id v16 = v7;
    id v17 = v10;
    [v17 performBlockAndWait:v15];
    id v11 = *((id *)v22 + 5);

    _Block_object_dispose(buf, 8);
  }

  else
  {
    uint64_t v12 = nplog_obj(0LL, v8, v9);
    id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_ERROR,  "NSP Core Data context not available",  buf,  2u);
    }

    id v11 = 0LL;
  }

  return v11;
}

+ (id)prepareInputForTraining
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSPCoreData getNSPEventsNormalizer](&OBJC_CLASS___NSPCoreData, "getNSPEventsNormalizer"));
  id v5 = v2;
  if (v2)
  {
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v2 model]);
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 modelDescription]);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 inputDescriptionsByName]);
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:@"normalizer_input"]);

    uint64_t v13 = nplog_obj(v10, v11, v12);
    uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v44 = (void *)objc_claimAutoreleasedReturnValue([v9 multiArrayConstraint]);
      uint64_t v45 = (char *)objc_claimAutoreleasedReturnValue([v44 shape]);
      int v54 = 138412290;
      id v55 = v45;
      _os_log_debug_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "input shape %@", (uint8_t *)&v54, 0xCu);
    }

    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v9 multiArrayConstraint]);
    id v16 = (void *)objc_claimAutoreleasedReturnValue([v15 shape]);

    if (!v16)
    {
      uint64_t v49 = nplog_obj(v17, v18, v19);
      uint64_t v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v49);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
      {
        int v54 = 136315138;
        id v55 = "+[NSPCoreData prepareInputForTraining]";
        _os_log_fault_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_FAULT,  "%s called with null inputShape",  (uint8_t *)&v54,  0xCu);
      }

      id v42 = 0LL;
      goto LABEL_13;
    }

    BOOL v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[NSPCoreData getNSPEventsDenormalizer](&OBJC_CLASS___NSPCoreData, "getNSPEventsDenormalizer"));
    uint64_t v23 = v20;
    if (!v20)
    {
      uint64_t v50 = nplog_obj(0LL, v21, v22);
      id v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v50);
      if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT))
      {
        int v54 = 136315138;
        id v55 = "+[NSPCoreData prepareInputForTraining]";
        _os_log_fault_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_FAULT,  "%s called with null denormalizer",  (uint8_t *)&v54,  0xCu);
      }

      id v42 = 0LL;
      goto LABEL_12;
    }

    uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s model](v20, "model"));
    uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue([v24 modelDescription]);
    id v26 = (void *)objc_claimAutoreleasedReturnValue([v25 inputDescriptionsByName]);
    id v27 = (os_log_s *)objc_claimAutoreleasedReturnValue([v26 objectForKeyedSubscript:@"denormalizer_input"]);

    uint64_t v31 = nplog_obj(v28, v29, v30);
    uint64_t v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v46 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s multiArrayConstraint](v27, "multiArrayConstraint"));
      id v47 = (char *)objc_claimAutoreleasedReturnValue([v46 shape]);
      int v54 = 138412290;
      id v55 = v47;
      _os_log_debug_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEBUG, "target shape %@", (uint8_t *)&v54, 0xCu);
    }

    uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s multiArrayConstraint](v27, "multiArrayConstraint"));
    id v34 = (void *)objc_claimAutoreleasedReturnValue([v33 shape]);

    if (v34)
    {
      uint64_t v38 = objc_claimAutoreleasedReturnValue(+[NSPCoreData fetchEvents](&OBJC_CLASS___NSPCoreData, "fetchEvents"));
      if (v38)
      {
        id v41 = (void *)v38;
        id v42 = -[NSPEventsPredictorTrainingBatchProvider init:inputShape:targetShape:]( objc_alloc(&OBJC_CLASS___NSPEventsPredictorTrainingBatchProvider),  "init:inputShape:targetShape:",  v38,  v16,  v34);
LABEL_11:

LABEL_12:
LABEL_13:

        goto LABEL_14;
      }

      uint64_t v52 = nplog_obj(0LL, v39, v40);
      id v53 = (os_log_s *)objc_claimAutoreleasedReturnValue(v52);
      if (os_log_type_enabled(v53, OS_LOG_TYPE_FAULT))
      {
        int v54 = 136315138;
        id v55 = "+[NSPCoreData prepareInputForTraining]";
        _os_log_fault_impl( (void *)&_mh_execute_header,  v53,  OS_LOG_TYPE_FAULT,  "%s called with null events",  (uint8_t *)&v54,  0xCu);
      }

      id v41 = 0LL;
    }

    else
    {
      uint64_t v51 = nplog_obj(v35, v36, v37);
      id v41 = (void *)objc_claimAutoreleasedReturnValue(v51);
      if (os_log_type_enabled((os_log_t)v41, OS_LOG_TYPE_FAULT))
      {
        int v54 = 136315138;
        id v55 = "+[NSPCoreData prepareInputForTraining]";
        _os_log_fault_impl( (void *)&_mh_execute_header,  (os_log_t)v41,  OS_LOG_TYPE_FAULT,  "%s called with null targetShape",  (uint8_t *)&v54,  0xCu);
      }
    }

    id v42 = 0LL;
    goto LABEL_11;
  }

  uint64_t v48 = nplog_obj(0LL, v3, v4);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(v48);
  if (os_log_type_enabled((os_log_t)v9, OS_LOG_TYPE_FAULT))
  {
    int v54 = 136315138;
    id v55 = "+[NSPCoreData prepareInputForTraining]";
    _os_log_fault_impl( (void *)&_mh_execute_header,  (os_log_t)v9,  OS_LOG_TYPE_FAULT,  "%s called with null normalizer",  (uint8_t *)&v54,  0xCu);
  }

  id v42 = 0LL;
LABEL_14:

  return v42;
}

+ (void)trainModel
{
}

+ (id)getModelVersion:(id)a3
{
  if (a3)
  {
    uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([a3 modelDescription]);
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 metadata]);
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:MLModelCreatorDefinedKey]);

    if (!v5)
    {
      uint64_t v25 = nplog_obj(v6, v7, v8);
      uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
      {
        int v27 = 136315138;
        uint64_t v28 = "+[NSPCoreData getModelVersion:]";
        _os_log_fault_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_FAULT,  "%s called with null metadata",  (uint8_t *)&v27,  0xCu);
      }

      uint64_t v22 = 0LL;
      goto LABEL_9;
    }

    uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"version"]);
    uint64_t v12 = v9;
    if (v9)
    {
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s componentsSeparatedByString:](v9, "componentsSeparatedByString:", @"."));
      uint64_t v14 = (char *)objc_claimAutoreleasedReturnValue([v13 valueForKey:@"intValue"]);

      uint64_t v18 = nplog_obj(v15, v16, v17);
      uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
      BOOL v20 = v19;
      if (v14)
      {
        if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
          int v27 = 138412290;
          uint64_t v28 = v14;
          _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "model version %@", (uint8_t *)&v27, 0xCu);
        }

        uint64_t v21 = v14;
        uint64_t v22 = v21;
        goto LABEL_8;
      }

      if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
      {
        int v27 = 136315138;
        uint64_t v28 = "+[NSPCoreData getModelVersion:]";
        _os_log_fault_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_FAULT,  "%s called with null versionComponents",  (uint8_t *)&v27,  0xCu);
      }

      uint64_t v21 = 0LL;
    }

    else
    {
      uint64_t v26 = nplog_obj(0LL, v10, v11);
      uint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
      {
        int v27 = 136315138;
        uint64_t v28 = "+[NSPCoreData getModelVersion:]";
        _os_log_fault_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_FAULT,  "%s called with null versionStr",  (uint8_t *)&v27,  0xCu);
      }
    }

    uint64_t v22 = 0LL;
LABEL_8:

LABEL_9:
    goto LABEL_10;
  }

  uint64_t v24 = nplog_obj(a1, a2, 0LL);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v24);
  if (os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_FAULT))
  {
    int v27 = 136315138;
    uint64_t v28 = "+[NSPCoreData getModelVersion:]";
    _os_log_fault_impl( (void *)&_mh_execute_header,  (os_log_t)v5,  OS_LOG_TYPE_FAULT,  "%s called with null model",  (uint8_t *)&v27,  0xCu);
  }

  uint64_t v22 = 0LL;
LABEL_10:

  return v22;
}

+ (id)compareModelVersion:(id)a3 model2:(id)a4
{
  id v5 = a4;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSPCoreData getModelVersion:](&OBJC_CLASS___NSPCoreData, "getModelVersion:", a3));
  uint64_t v7 = objc_claimAutoreleasedReturnValue(+[NSPCoreData getModelVersion:](&OBJC_CLASS___NSPCoreData, "getModelVersion:", v5));
  uint64_t v10 = (void *)v7;
  if (v6) {
    BOOL v11 = v7 == 0;
  }
  else {
    BOOL v11 = 1;
  }
  if (v11)
  {
    uint64_t v12 = nplog_obj(v7, v8, v9);
    uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_ERROR);
    if (v6)
    {
      if (v14)
      {
        LOWORD(v34) = 0;
        _os_log_error_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_ERROR,  "model2 version not found",  (uint8_t *)&v34,  2u);
      }

      uint64_t v15 = objc_alloc(&OBJC_CLASS___NSNumber);
      uint64_t v16 = 1LL;
      goto LABEL_22;
    }

    if (v10)
    {
      if (v14)
      {
        LOWORD(v34) = 0;
        _os_log_error_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_ERROR,  "model1 version not found",  (uint8_t *)&v34,  2u);
      }

      uint64_t v15 = objc_alloc(&OBJC_CLASS___NSNumber);
      uint64_t v16 = 0xFFFFFFFFLL;
      goto LABEL_22;
    }

    if (v14)
    {
      LOWORD(v34) = 0;
      uint64_t v25 = "model1 and model2 version not found";
      uint64_t v26 = v13;
      uint32_t v27 = 2;
      goto LABEL_26;
    }

+ (id)getVendorDictionary
{
  uint64_t v2 = (void *)qword_100117198;
  if (!qword_100117198)
  {
    uint64_t v3 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    uint64_t v4 = (void *)qword_100117198;
    qword_100117198 = (uint64_t)v3;

    uint64_t v2 = (void *)qword_100117198;
  }

  return v2;
}

+ (id)updateVendorDictionaryFromModel:(id)a3
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([a3 modelDescription]);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 metadata]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:MLModelCreatorDefinedKey]);

  if (v5)
  {
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"vendors"]);

    if (!v9)
    {
      BOOL v14 = 0LL;
      goto LABEL_15;
    }

    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"vendors"]);
    BOOL v11 = (void *)objc_claimAutoreleasedReturnValue([v10 componentsSeparatedByString:@":"]);

    BOOL v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSPCoreData getVendorDictionary](&OBJC_CLASS___NSPCoreData, "getVendorDictionary"));
    if (v14)
    {
      __int128 v31 = 0u;
      __int128 v32 = 0u;
      __int128 v29 = 0u;
      __int128 v30 = 0u;
      uint64_t v28 = v11;
      id v15 = v11;
      id v16 = [v15 countByEnumeratingWithState:&v29 objects:v33 count:16];
      if (v16)
      {
        id v17 = v16;
        uint64_t v18 = *(void *)v30;
        uint64_t v19 = 1LL;
        do
        {
          for (i = 0LL; i != v17; i = (char *)i + 1)
          {
            if (*(void *)v30 != v18) {
              objc_enumerationMutation(v15);
            }
            uint64_t v21 = *(void *)(*((void *)&v29 + 1) + 8LL * (void)i);
            uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", (char *)i + v19));
            [v14 setValue:v22 forKey:v21];
          }

          id v17 = [v15 countByEnumeratingWithState:&v29 objects:v33 count:16];
          uint64_t v19 = (v19 + (_DWORD)i);
        }

        while (v17);
      }

      id v23 = v14;
      BOOL v11 = v28;
    }

    else
    {
      uint64_t v26 = nplog_obj(0LL, v12, v13);
      uint32_t v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
      if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315138;
        uint64_t v35 = "+[NSPCoreData updateVendorDictionaryFromModel:]";
        _os_log_fault_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_FAULT,  "%s called with null dictionary",  buf,  0xCu);
      }
    }
  }

  else
  {
    uint64_t v25 = nplog_obj(v6, v7, v8);
    BOOL v11 = (void *)objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled((os_log_t)v11, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v35 = "+[NSPCoreData updateVendorDictionaryFromModel:]";
      _os_log_fault_impl( (void *)&_mh_execute_header,  (os_log_t)v11,  OS_LOG_TYPE_FAULT,  "%s called with null metadata",  buf,  0xCu);
    }

    BOOL v14 = 0LL;
  }

LABEL_15:
  return v14;
}

+ (id)getVendorIdFromDictionary:(id)a3
{
  id v3 = a3;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSPCoreData getVendorDictionary](&OBJC_CLASS___NSPCoreData, "getVendorDictionary"));
  uint64_t v7 = v4;
  if (v4)
  {
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:v3]);
  }

  else
  {
    uint64_t v10 = nplog_obj(0LL, v5, v6);
    BOOL v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
    {
      int v12 = 136315138;
      uint64_t v13 = "+[NSPCoreData getVendorIdFromDictionary:]";
      _os_log_fault_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_FAULT,  "%s called with null dictionary",  (uint8_t *)&v12,  0xCu);
    }

    uint64_t v8 = 0LL;
  }

  return v8;
}

+ (id)getVendorNameById:(int64_t)a3
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSPCoreData getVendorDictionary](&OBJC_CLASS___NSPCoreData, "getVendorDictionary"));
  uint64_t v7 = v4;
  if (v4)
  {
    __int128 v25 = 0u;
    __int128 v26 = 0u;
    __int128 v23 = 0u;
    __int128 v24 = 0u;
    id v8 = v4;
    id v9 = [v8 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v24;
      while (2)
      {
        for (i = 0LL; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v24 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void **)(*((void *)&v23 + 1) + 8LL * (void)i);
          BOOL v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKey:", v13, (void)v23));
          id v15 = [v14 longValue];

          if (v15 == (id)a3)
          {
            id v20 = v13;
            goto LABEL_14;
          }
        }

        id v10 = [v8 countByEnumeratingWithState:&v23 objects:v27 count:16];
        if (v10) {
          continue;
        }
        break;
      }
    }

    uint64_t v19 = nplog_obj(v16, v17, v18);
    id v8 = (id)objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134217984;
      __int128 v29 = (const char *)a3;
      _os_log_debug_impl( (void *)&_mh_execute_header,  (os_log_t)v8,  OS_LOG_TYPE_DEBUG,  "Vendor id %lu not found",  buf,  0xCu);
    }
  }

  else
  {
    uint64_t v22 = nplog_obj(0LL, v5, v6);
    id v8 = (id)objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      __int128 v29 = "+[NSPCoreData getVendorNameById:]";
      _os_log_fault_impl( (void *)&_mh_execute_header,  (os_log_t)v8,  OS_LOG_TYPE_FAULT,  "%s called with null dictionary",  buf,  0xCu);
    }
  }

  id v20 = 0LL;
LABEL_14:

  return v20;
}

+ (id)initNSPEventsModelPredictor
{
  uint64_t v2 = objc_alloc_init(&OBJC_CLASS___MLModelConfiguration);
  uint64_t v5 = v2;
  if (v2)
  {
    -[MLModelConfiguration setComputeUnits:](v2, "setComputeUnits:", 0LL);
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@/%@",  @"/usr/libexec/",  @"NSPEventsPredictor.mlmodelc"));
    if (!v8)
    {
      uint64_t v91 = nplog_obj(0LL, v6, v7);
      id v42 = (os_log_s *)objc_claimAutoreleasedReturnValue(v91);
      if (os_log_type_enabled(v42, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315138;
        uint64_t v111 = "+[NSPCoreData initNSPEventsModelPredictor]";
        _os_log_fault_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_FAULT, "%s called with null srcStr", buf, 0xCu);
      }

      uint64_t v80 = 0LL;
      goto LABEL_51;
    }

    uint64_t v9 = objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:isDirectory:](&OBJC_CLASS___NSURL, "fileURLWithPath:isDirectory:", v8, 1LL));
    uint64_t v104 = (char *)v9;
    if (!v9)
    {
      uint64_t v92 = nplog_obj(0LL, v10, v11);
      uint64_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v92);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315138;
        uint64_t v111 = "+[NSPCoreData initNSPEventsModelPredictor]";
        _os_log_fault_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_FAULT, "%s called with null srcURL", buf, 0xCu);
      }

      id v42 = 0LL;
      uint64_t v80 = 0LL;
      goto LABEL_50;
    }

    int v12 = (const char *)v9;
    uint64_t v13 = NSSearchPathForDirectoriesInDomains(NSApplicationSupportDirectory, 1uLL, 1);
    BOOL v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    uint64_t v17 = v14;
    if (!v14)
    {
      uint64_t v93 = nplog_obj(0LL, v15, v16);
      id v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v93);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315138;
        uint64_t v111 = "+[NSPCoreData initNSPEventsModelPredictor]";
        _os_log_fault_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_FAULT, "%s called with null paths", buf, 0xCu);
      }

      id v42 = 0LL;
      uint64_t v80 = 0LL;
      goto LABEL_49;
    }

    id v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[os_log_s firstObject](v14, "firstObject"));
    if (!v20)
    {
      uint64_t v94 = nplog_obj(0LL, v18, v19);
      __int128 v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v94);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315138;
        uint64_t v111 = "+[NSPCoreData initNSPEventsModelPredictor]";
        _os_log_fault_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_FAULT,  "%s called with null applicationSupportDirectory",  buf,  0xCu);
      }

      id v42 = 0LL;
      uint64_t v80 = 0LL;
      goto LABEL_48;
    }

    v103 = v20;
    __int128 v23 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@/networkserviceproxy/%@",  v20,  @"NSPEventsPredictor.mlmodelc"));
    if (!v23)
    {
      uint64_t v95 = nplog_obj(0LL, v21, v22);
      uint32_t v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v95);
      if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315138;
        uint64_t v111 = "+[NSPCoreData initNSPEventsModelPredictor]";
        _os_log_fault_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_FAULT, "%s called with null dstStr", buf, 0xCu);
      }

      id v42 = 0LL;
      uint64_t v80 = 0LL;
      goto LABEL_47;
    }

    __int128 v24 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSURL fileURLWithPath:isDirectory:]( &OBJC_CLASS___NSURL,  "fileURLWithPath:isDirectory:",  v23,  1LL));
    uint32_t v27 = v24;
    if (!v24)
    {
      uint64_t v96 = nplog_obj(0LL, v25, v26);
      uint64_t v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v96);
      if (os_log_type_enabled(v28, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315138;
        uint64_t v111 = "+[NSPCoreData initNSPEventsModelPredictor]";
        _os_log_fault_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_FAULT, "%s called with null dstURL", buf, 0xCu);
      }

      id v42 = 0LL;
      uint64_t v80 = 0LL;
      goto LABEL_46;
    }

    uint64_t v102 = v17;
    uint64_t v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[os_log_s path](v24, "path"));
    __int128 v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    __int128 v32 = v29;
    if (!v29)
    {
      uint64_t v97 = nplog_obj(0LL, v30, v31);
      __int16 v36 = (NSPEventsPredictor *)objc_claimAutoreleasedReturnValue(v97);
      if (os_log_type_enabled((os_log_t)v36, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315138;
        uint64_t v111 = "+[NSPCoreData initNSPEventsModelPredictor]";
        _os_log_fault_impl( (void *)&_mh_execute_header,  (os_log_t)v36,  OS_LOG_TYPE_FAULT,  "%s called with null manager",  buf,  0xCu);
      }

      id v42 = 0LL;
      uint64_t v80 = 0LL;
      goto LABEL_45;
    }

    uint64_t v101 = v28;
    id v33 = [v29 fileExistsAtPath:v28];
    if ((_DWORD)v33)
    {
      id v109 = 0LL;
      __int16 v36 = -[NSPEventsPredictor initWithContentsOfURL:configuration:error:]( objc_alloc(&OBJC_CLASS___NSPEventsPredictor),  "initWithContentsOfURL:configuration:error:",  v12,  v5,  &v109);
      uint64_t v37 = (os_log_s *)v109;
      uint64_t v40 = v37;
      if (!v36)
      {
        uint64_t v82 = nplog_obj(v37, v38, v39);
        __int16 v36 = (NSPEventsPredictor *)objc_claimAutoreleasedReturnValue(v82);
        if (os_log_type_enabled((os_log_t)v36, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          uint64_t v111 = v12;
          __int16 v112 = 2112;
          double v113 = v40;
          _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)v36,  OS_LOG_TYPE_ERROR,  "Failed to initialize base model at %@ error with %@",  buf,  0x16u);
        }

        uint64_t v80 = 0LL;
        id v42 = v40;
        goto LABEL_44;
      }

      double v108 = v37;
      id v41 = -[NSPEventsPredictor initWithContentsOfURL:configuration:error:]( objc_alloc(&OBJC_CLASS___NSPEventsPredictor),  "initWithContentsOfURL:configuration:error:",  v27,  v5,  &v108);
      id v42 = v108;

      if (!v41)
      {
        uint64_t v83 = nplog_obj(v43, v44, v45);
        int v84 = (os_log_s *)objc_claimAutoreleasedReturnValue(v83);
        if (os_log_type_enabled(v84, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          uint64_t v111 = (const char *)v27;
          __int16 v112 = 2112;
          double v113 = v42;
          _os_log_error_impl( (void *)&_mh_execute_header,  v84,  OS_LOG_TYPE_ERROR,  "Failed to initialize personalized model at %@ error with %@",  buf,  0x16u);
        }

        uint64_t v80 = 0LL;
        goto LABEL_44;
      }

      uint64_t v99 = v8;
      uint64_t v100 = v5;
      uint64_t v46 = (void *)objc_claimAutoreleasedReturnValue(-[NSPEventsPredictor model](v36, "model"));
      id v47 = (void *)objc_claimAutoreleasedReturnValue(-[NSPEventsPredictor model](v41, "model"));
      uint64_t v48 = (void *)objc_claimAutoreleasedReturnValue( +[NSPCoreData compareModelVersion:model2:]( &OBJC_CLASS___NSPCoreData,  "compareModelVersion:model2:",  v46,  v47));

      if (v48)
      {
        double v107 = v42;
        unsigned __int8 v52 = [v32 removeItemAtURL:v27 error:&v107];
        id v53 = v107;

        if ((v52 & 1) != 0)
        {

          id v8 = v99;
          int v12 = v104;
LABEL_16:
          id v57 = v8;
          uint64_t v58 = nplog_obj(v33, v34, v35);
          id v59 = (os_log_s *)objc_claimAutoreleasedReturnValue(v58);
          if (os_log_type_enabled(v59, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412546;
            uint64_t v111 = v12;
            __int16 v112 = 2112;
            double v113 = v27;
            _os_log_impl( (void *)&_mh_execute_header,  v59,  OS_LOG_TYPE_INFO,  "copy base model from %@ to %@",  buf,  0x16u);
          }

          id v106 = v53;
          unsigned __int8 v60 = [v32 copyItemAtURL:v12 toURL:v27 error:&v106];
          id v61 = v106;

          if ((v60 & 1) == 0)
          {
            uint64_t v81 = nplog_obj(v62, v63, v64);
            __int16 v36 = (NSPEventsPredictor *)objc_claimAutoreleasedReturnValue(v81);
            uint64_t v28 = v101;
            if (os_log_type_enabled((os_log_t)v36, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412802;
              uint64_t v111 = v12;
              __int16 v112 = 2112;
              double v113 = v27;
              __int16 v114 = 2112;
              uint64_t v115 = v61;
              _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)v36,  OS_LOG_TYPE_ERROR,  "Failed to copy model from %@ to %@ error: %@",  buf,  0x20u);
            }

            uint64_t v80 = 0LL;
            id v42 = v61;
            id v8 = v57;
            uint64_t v5 = v100;
            goto LABEL_45;
          }

          v105 = v61;
          __int16 v36 = -[NSPEventsPredictor initWithContentsOfURL:configuration:error:]( objc_alloc(&OBJC_CLASS___NSPEventsPredictor),  "initWithContentsOfURL:configuration:error:",  v27,  v100,  &v105);
          id v42 = v105;

          if (v36)
          {
            uint64_t v68 = (void *)objc_claimAutoreleasedReturnValue(-[NSPEventsPredictor model](v36, "model"));
            uint64_t v69 = (void *)objc_claimAutoreleasedReturnValue( +[NSPCoreData updateVendorDictionaryFromModel:]( &OBJC_CLASS___NSPCoreData,  "updateVendorDictionaryFromModel:",  v68));

            id v8 = v57;
            uint64_t v5 = v100;
            if (!v69)
            {
              uint64_t v73 = nplog_obj(v70, v71, v72);
              uint64_t v74 = (os_log_s *)objc_claimAutoreleasedReturnValue(v73);
              if (os_log_type_enabled(v74, OS_LOG_TYPE_ERROR))
              {
                *(_WORD *)buf = 0;
                _os_log_error_impl( (void *)&_mh_execute_header,  v74,  OS_LOG_TYPE_ERROR,  "Failed to update vendor dictionary from model",  buf,  2u);
              }
            }

            uint64_t v75 = nplog_obj(v70, v71, v72);
            uint64_t v76 = (os_log_s *)objc_claimAutoreleasedReturnValue(v75);
            if (os_log_type_enabled(v76, OS_LOG_TYPE_INFO))
            {
              uint64_t v77 = (void *)objc_claimAutoreleasedReturnValue(-[NSPEventsPredictor model](v36, "model"));
              uint64_t v78 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[NSPCoreData getModelVersion:](&OBJC_CLASS___NSPCoreData, "getModelVersion:", v77));
              *(_DWORD *)buf = 138412546;
              uint64_t v111 = (const char *)v27;
              __int16 v112 = 2112;
              double v113 = v78;
              _os_log_impl( (void *)&_mh_execute_header,  v76,  OS_LOG_TYPE_INFO,  "Initialized NSPEventsPredictor at URL:%@ version:%@",  buf,  0x16u);
            }

            id v79 = v36;
            uint64_t v80 = v36;
            goto LABEL_44;
          }

          uint64_t v85 = nplog_obj(v65, v66, v67);
          uint64_t v86 = (os_log_s *)objc_claimAutoreleasedReturnValue(v85);
          id v8 = v57;
          if (os_log_type_enabled(v86, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            uint64_t v111 = (const char *)v27;
            __int16 v112 = 2112;
            double v113 = v42;
            _os_log_error_impl( (void *)&_mh_execute_header,  v86,  OS_LOG_TYPE_ERROR,  "Failed to initialize model at %@ error with %@",  buf,  0x16u);
          }

          uint64_t v80 = 0LL;
LABEL_43:
          uint64_t v5 = v100;
LABEL_44:
          uint64_t v28 = v101;
LABEL_45:

          uint64_t v17 = v102;
LABEL_46:

LABEL_47:
          id v20 = v103;
LABEL_48:

LABEL_49:
LABEL_50:

LABEL_51:
          goto LABEL_52;
        }

        uint64_t v87 = nplog_obj(v54, v55, v56);
        v88 = (os_log_s *)objc_claimAutoreleasedReturnValue(v87);
        if (os_log_type_enabled(v88, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v111 = (const char *)v53;
          _os_log_error_impl( (void *)&_mh_execute_header,  v88,  OS_LOG_TYPE_ERROR,  "Failed to remove old personalized model %@",  buf,  0xCu);
        }

        id v42 = v53;
      }

      else
      {
        uint64_t v98 = nplog_obj(v49, v50, v51);
        v88 = (os_log_s *)objc_claimAutoreleasedReturnValue(v98);
        if (os_log_type_enabled(v88, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 136315138;
          uint64_t v111 = "+[NSPCoreData initNSPEventsModelPredictor]";
          _os_log_fault_impl( (void *)&_mh_execute_header,  v88,  OS_LOG_TYPE_FAULT,  "%s called with null result",  buf,  0xCu);
        }
      }

      uint64_t v80 = 0LL;
      id v8 = v99;
      goto LABEL_43;
    }

    uint64_t v100 = v5;
    id v53 = 0LL;
    goto LABEL_16;
  }

  uint64_t v90 = nplog_obj(0LL, v3, v4);
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v90);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v111 = "+[NSPCoreData initNSPEventsModelPredictor]";
    _os_log_fault_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_FAULT, "%s called with null config", buf, 0xCu);
  }

  uint64_t v80 = 0LL;
LABEL_52:

  return v80;
}

+ (id)getNSPEventsNormalizer
{
  uint64_t v3 = (void *)qword_1001171A0;
  if (qword_1001171A0) {
    return v3;
  }
  uint64_t v4 = nplog_obj(a1, a2, v2);
  uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Initializing NSPEventsNormalizer", buf, 2u);
  }

  uint64_t v6 = (char *)objc_claimAutoreleasedReturnValue( +[NSURL fileURLWithPath:isDirectory:]( &OBJC_CLASS___NSURL,  "fileURLWithPath:isDirectory:",  @"/usr/libexec/NSPEventsNormalizer.mlmodelc",  1LL));
  uint64_t v9 = nplog_obj(v6, v7, v8);
  uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    uint32_t v27 = v6;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "mlmodel URL %@", buf, 0xCu);
  }

  uint64_t v11 = objc_alloc_init(&OBJC_CLASS___MLModelConfiguration);
  if (v11)
  {
    BOOL v14 = v11;
    -[MLModelConfiguration setComputeUnits:](v11, "setComputeUnits:", 0LL);
    id v25 = 0LL;
    uint64_t v15 = -[NSPEventsNormalizer initWithContentsOfURL:configuration:error:]( objc_alloc(&OBJC_CLASS___NSPEventsNormalizer),  "initWithContentsOfURL:configuration:error:",  v6,  v14,  &v25);
    id v16 = v25;
    uint64_t v17 = (void *)qword_1001171A0;
    qword_1001171A0 = (uint64_t)v15;

    if (qword_1001171A0)
    {

      uint64_t v3 = (void *)qword_1001171A0;
      return v3;
    }

    uint64_t v22 = nplog_obj(v18, v19, v20);
    __int128 v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      uint32_t v27 = v6;
      __int16 v28 = 2112;
      id v29 = v16;
      _os_log_error_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_ERROR,  "Failed to initialize normalizer model %@ error: %@",  buf,  0x16u);
    }
  }

  else
  {
    uint64_t v24 = nplog_obj(0LL, v12, v13);
    BOOL v14 = (MLModelConfiguration *)objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled((os_log_t)v14, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      uint32_t v27 = "+[NSPCoreData getNSPEventsNormalizer]";
      _os_log_fault_impl( (void *)&_mh_execute_header,  (os_log_t)v14,  OS_LOG_TYPE_FAULT,  "%s called with null config",  buf,  0xCu);
    }
  }

  return 0LL;
}

+ (id)getNSPEventsDenormalizer
{
  uint64_t v3 = (void *)qword_1001171A8;
  if (qword_1001171A8) {
    return v3;
  }
  uint64_t v4 = nplog_obj(a1, a2, v2);
  uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Initializing NSPEventsDenormalizer", buf, 2u);
  }

  uint64_t v6 = (char *)objc_claimAutoreleasedReturnValue( +[NSURL fileURLWithPath:isDirectory:]( &OBJC_CLASS___NSURL,  "fileURLWithPath:isDirectory:",  @"/usr/libexec/NSPEventsDenormalizer.mlmodelc",  1LL));
  uint64_t v9 = nplog_obj(v6, v7, v8);
  uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    uint32_t v27 = v6;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "mlmodel URL %@", buf, 0xCu);
  }

  uint64_t v11 = objc_alloc_init(&OBJC_CLASS___MLModelConfiguration);
  if (v11)
  {
    BOOL v14 = v11;
    -[MLModelConfiguration setComputeUnits:](v11, "setComputeUnits:", 0LL);
    id v25 = 0LL;
    uint64_t v15 = -[NSPEventsDenormalizer initWithContentsOfURL:configuration:error:]( objc_alloc(&OBJC_CLASS___NSPEventsDenormalizer),  "initWithContentsOfURL:configuration:error:",  v6,  v14,  &v25);
    id v16 = v25;
    uint64_t v17 = (void *)qword_1001171A8;
    qword_1001171A8 = (uint64_t)v15;

    if (qword_1001171A8)
    {

      uint64_t v3 = (void *)qword_1001171A8;
      return v3;
    }

    uint64_t v22 = nplog_obj(v18, v19, v20);
    __int128 v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      uint32_t v27 = v6;
      __int16 v28 = 2112;
      id v29 = v16;
      _os_log_error_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_ERROR,  "Failed to initialize denormalizer model %@ error:%@",  buf,  0x16u);
    }
  }

  else
  {
    uint64_t v24 = nplog_obj(0LL, v12, v13);
    BOOL v14 = (MLModelConfiguration *)objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled((os_log_t)v14, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      uint32_t v27 = "+[NSPCoreData getNSPEventsDenormalizer]";
      _os_log_fault_impl( (void *)&_mh_execute_header,  (os_log_t)v14,  OS_LOG_TYPE_FAULT,  "%s called with null config",  buf,  0xCu);
    }
  }

  return 0LL;
}

+ (id)getNSPEventsPredictor
{
  uint64_t v2 = (void *)qword_1001171B0;
  if (!qword_1001171B0)
  {
    uint64_t v3 = objc_claimAutoreleasedReturnValue(+[NSPCoreData initNSPEventsModelPredictor](&OBJC_CLASS___NSPCoreData, "initNSPEventsModelPredictor"));
    uint64_t v4 = (void *)qword_1001171B0;
    qword_1001171B0 = v3;

    uint64_t v2 = (void *)qword_1001171B0;
  }

  return v2;
}

+ (void)printMLMultiArray:(id)a3
{
  id v3 = a3;
  uint64_t v6 = nplog_obj(v3, v4, v5);
  uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v44 = (void *)objc_claimAutoreleasedReturnValue([v3 shape]);
    *(_DWORD *)buf = 138412546;
    *(void *)uint64_t v50 = v3;
    *(_WORD *)&v50[8] = 2112;
    uint64_t v51 = v44;
    _os_log_debug_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "mlmultiarray shape %@ %@", buf, 0x16u);
  }

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v3 shape]);
  id v9 = [v8 count];

  if ((unint64_t)v9 >= 3)
  {
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v3 shape]);
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 objectAtIndexedSubscript:0]);
    int v12 = [v11 intValue];

    if (v12 >= 1)
    {
      signed int v46 = 0;
      *(void *)&__int128 v13 = 67109890LL;
      __int128 v45 = v13;
      do
      {
        BOOL v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "shape", v45));
        uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v14 objectAtIndexedSubscript:1]);
        int v16 = [v15 intValue];

        if (v16 >= 1)
        {
          for (signed int i = 0; i < v40; ++i)
          {
            uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v3 shape]);
            uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v17 objectAtIndexedSubscript:2]);
            int v19 = [v18 intValue];

            if (v19 >= 1)
            {
              signed int v20 = 0;
              do
              {
                uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v3 strides]);
                uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v21 objectAtIndexedSubscript:0]);
                unsigned int v48 = [v22 intValue];
                __int128 v23 = (void *)objc_claimAutoreleasedReturnValue([v3 strides]);
                uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue([v23 objectAtIndexedSubscript:1]);
                unsigned int v25 = [v24 intValue];
                uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue([v3 strides]);
                uint32_t v27 = (void *)objc_claimAutoreleasedReturnValue([v26 objectAtIndexedSubscript:2]);
                unsigned int v28 = [v27 intValue];

                uint64_t v32 = nplog_obj(v29, v30, v31);
                id v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
                if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
                {
                  uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue([v3 objectAtIndexedSubscript:(int)(v48 * v46 + v25 * i + v28 * v20)]);
                  *(_DWORD *)buf = v45;
                  *(_DWORD *)uint64_t v50 = v46;
                  *(_WORD *)&v50[4] = 1024;
                  *(_DWORD *)&v50[6] = i;
                  LOWORD(v51) = 1024;
                  *(_DWORD *)((char *)&v51 + 2) = v20;
                  HIWORD(v51) = 2112;
                  unsigned __int8 v52 = v37;
                  _os_log_debug_impl( (void *)&_mh_execute_header,  v33,  OS_LOG_TYPE_DEBUG,  "mlmodel data (%d %d %d: %@",  buf,  0x1Eu);
                }

                ++v20;
                uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue([v3 shape]);
                uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue([v34 objectAtIndexedSubscript:2]);
                signed int v36 = [v35 intValue];
              }

              while (v20 < v36);
            }

            uint64_t v38 = (void *)objc_claimAutoreleasedReturnValue([v3 shape]);
            uint64_t v39 = (void *)objc_claimAutoreleasedReturnValue([v38 objectAtIndexedSubscript:1]);
            signed int v40 = [v39 intValue];
          }
        }

        id v41 = (void *)objc_claimAutoreleasedReturnValue([v3 shape]);
        id v42 = (void *)objc_claimAutoreleasedReturnValue([v41 objectAtIndexedSubscript:0]);
        signed int v43 = [v42 intValue];

        ++v46;
      }

      while (v46 < v43);
    }
  }
}

+ (id)normalizeData:(id)a3
{
  id v3 = a3;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSPCoreData getNSPEventsNormalizer](&OBJC_CLASS___NSPCoreData, "getNSPEventsNormalizer"));
  uint64_t v7 = v4;
  if (v4)
  {
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v4 model]);
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 modelDescription]);
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 inputDescriptionsByName]);
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:@"normalizer_input"]);

    uint64_t v15 = nplog_obj(v12, v13, v14);
    int v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      double v113 = (void *)objc_claimAutoreleasedReturnValue([v11 multiArrayConstraint]);
      __int16 v114 = (char *)objc_claimAutoreleasedReturnValue([v113 shape]);
      *(_DWORD *)buf = 138412290;
      v131 = v114;
      _os_log_debug_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "normalizer model shape %@", buf, 0xCu);
    }

    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v11 multiArrayConstraint]);
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v17 shape]);

    if (!v18)
    {
      uint64_t v117 = nplog_obj(v19, v20, v21);
      uint64_t v44 = (os_log_s *)objc_claimAutoreleasedReturnValue(v117);
      if (os_log_type_enabled(v44, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315138;
        v131 = "+[NSPCoreData normalizeData:]";
        _os_log_fault_impl( (void *)&_mh_execute_header,  v44,  OS_LOG_TYPE_FAULT,  "%s called with null normalizerShape",  buf,  0xCu);
      }

      goto LABEL_39;
    }

    uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v3 shape]);

    if (v18 == v22)
    {
      id v127 = 0LL;
      v103 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "predictionFromNormalizer_input:error:", v3, &v127));
      uint64_t v104 = (os_log_s *)v127;
      uint64_t v44 = v104;
      if (v103)
      {
        uint64_t v102 = (os_log_s *)objc_claimAutoreleasedReturnValue([v103 Identity]);
      }

      else
      {
        uint64_t v108 = nplog_obj(v104, v105, v106);
        id v109 = (os_log_s *)objc_claimAutoreleasedReturnValue(v108);
        if (os_log_type_enabled(v109, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v131 = (const char *)v44;
          _os_log_error_impl( (void *)&_mh_execute_header,  v109,  OS_LOG_TYPE_ERROR,  "Failed to normalize the input. error:%@",  buf,  0xCu);
        }

        uint64_t v102 = 0LL;
      }

      goto LABEL_40;
    }

    __int128 v23 = (void *)objc_claimAutoreleasedReturnValue([v3 shape]);
    id v24 = [v23 count];
    id v25 = [v18 count];

    if (v24 == v25)
    {
      uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue([v3 shape]);
      id v30 = [v29 count];

      if (v30)
      {
        uint64_t v31 = 0LL;
        unsigned int v32 = 1;
        while (1)
        {
          id v33 = (void *)objc_claimAutoreleasedReturnValue([v3 shape]);
          uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue([v33 objectAtIndexedSubscript:v31]);
          uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue([v18 objectAtIndexedSubscript:v31]);

          if (v34 > v35) {
            break;
          }
          uint64_t v31 = v32;
          uint64_t v39 = (void *)objc_claimAutoreleasedReturnValue([v3 shape]);
          id v40 = [v39 count];
        }

        uint64_t v110 = nplog_obj(v36, v37, v38);
        uint64_t v44 = (os_log_s *)objc_claimAutoreleasedReturnValue(v110);
        if (!os_log_type_enabled(v44, OS_LOG_TYPE_ERROR)) {
          goto LABEL_39;
        }
        goto LABEL_38;
      }

+ (id)prepareMLData:(id)a3 startAt:(unsigned int)a4 dataShape:(id)a5
{
  id v67 = a3;
  id v7 = a5;
  uint64_t v10 = -[MLMultiArray initWithShape:dataType:error:]( objc_alloc(&OBJC_CLASS___MLMultiArray),  "initWithShape:dataType:error:",  v7,  65568LL,  0LL);
  if (!v10)
  {
    uint64_t v55 = nplog_obj(0LL, v8, v9);
    uint64_t v56 = (os_log_s *)objc_claimAutoreleasedReturnValue(v55);
    if (os_log_type_enabled(v56, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v74 = "+[NSPCoreData prepareMLData:startAt:dataShape:]";
      _os_log_fault_impl((void *)&_mh_execute_header, v56, OS_LOG_TYPE_FAULT, "%s called with null sample", buf, 0xCu);
    }

    goto LABEL_16;
  }

  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v7 objectAtIndexedSubscript:1]);
  unsigned int v12 = [v11 unsignedIntValue];

  if ((unint64_t)[v67 count] <= v12)
  {
LABEL_16:
    uint64_t v54 = 0LL;
    goto LABEL_17;
  }

  id v59 = v7;
  unsigned __int8 v60 = v10;
  uint64_t v14 = v12 + a4 + 1;
  uint64_t v62 = a4 + 1;
  if (a4 + 1 < v14)
  {
    uint64_t v15 = 0LL;
    uint64_t v61 = v14 - v62;
    *(void *)&__int128 v13 = 138412290LL;
    __int128 v58 = v13;
    do
    {
      uint64_t v70 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v67, "objectAtIndexedSubscript:", v62 + v15 - 1, v58));
      int v16 = (char *)objc_claimAutoreleasedReturnValue([v67 objectAtIndexedSubscript:v62 + v15]);
      uint64_t v19 = nplog_obj(v16, v17, v18);
      uint64_t v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = v58;
        uint64_t v74 = v16;
        _os_log_debug_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEBUG,  "Preparing input from NSPEvent :%@",  buf,  0xCu);
      }

      uint64_t v21 = objc_claimAutoreleasedReturnValue([v16 date]);
      uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](&OBJC_CLASS___NSCalendar, "currentCalendar"));
      id v68 = [v22 component:32 fromDate:v21];

      __int128 v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](&OBJC_CLASS___NSCalendar, "currentCalendar"));
      id v24 = [v23 component:64 fromDate:v21];

      id v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](&OBJC_CLASS___NSCalendar, "currentCalendar"));
      uint64_t v26 = (void *)v21;
      id v27 = [v25 component:128 fromDate:v21];

      uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue([v16 date]);
      [v28 timeIntervalSinceReferenceDate];
      double v30 = v29;
      uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue([v70 date]);
      [v31 timeIntervalSinceReferenceDate];
      double v33 = v32;

      uint64_t v34 = (char *)objc_claimAutoreleasedReturnValue([v16 vendor]);
      uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue( +[NSPCoreData getVendorIdFromDictionary:]( &OBJC_CLASS___NSPCoreData,  "getVendorIdFromDictionary:",  v34));
      if (v37)
      {
        uint64_t v66 = v34;
        *(float *)&double v38 = (float)(int)([v16 eventType] + 1);
        unsigned int v64 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:", v38));
        v72[0] = v64;
        uint64_t v69 = v37;
        *(float *)&double v39 = (float)(int)[v16 tokenCount];
        uint64_t v63 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:", v39));
        v72[1] = v63;
        id v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](&OBJC_CLASS___NSCalendar, "currentCalendar"));
        uint64_t v65 = v26;
        *(float *)&double v41 = (float)(uint64_t)[v40 component:512 fromDate:v26];
        uint64_t v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:", v41));
        v72[2] = v42;
        *(float *)&double v43 = (float)((uint64_t)v27 + 3600 * (void)v68 + 60 * (void)v24);
        uint64_t v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:", v43));
        v72[3] = v44;
        *(float *)&double v45 = v30 - v33;
        id v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:", v45));
        v72[4] = v46;
        *(float *)&double v47 = (float)[v69 unsignedIntValue];
        unsigned int v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:", v47));
        v72[5] = v48;
        unsigned int v49 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  v72,  6LL));

        uint64_t v50 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", 0LL));
        v71[0] = v50;
        uint64_t v51 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLong:", v15));
        v71[1] = v51;
        unsigned __int8 v52 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v71, 2LL));

        uint64_t v34 = v66;
        +[NSPCoreData prepareModelInputWithFeatures:keyedSubscripts:features:]( &OBJC_CLASS___NSPCoreData,  "prepareModelInputWithFeatures:keyedSubscripts:features:",  v60,  v52,  v49);

        uint64_t v37 = v69;
        uint64_t v26 = v65;
      }

      else
      {
        uint64_t v53 = nplog_obj(0LL, v35, v36);
        unsigned int v49 = (os_log_s *)objc_claimAutoreleasedReturnValue(v53);
        if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = v58;
          uint64_t v74 = v34;
          _os_log_error_impl( (void *)&_mh_execute_header,  v49,  OS_LOG_TYPE_ERROR,  "Invalid vendor id for vendor %@",  buf,  0xCu);
        }
      }

      ++v15;
    }

    while (v61 != v15);
  }

  uint64_t v10 = v60;
  uint64_t v54 = v60;
  id v7 = v59;
LABEL_17:

  return v54;
}

+ (id)prepareTokenEventsFromPrediction:(id)a3
{
  id v3 = a3;
  uint64_t v77 = (void *)objc_claimAutoreleasedReturnValue(+[NSPCoreData childCoreDataContext](&OBJC_CLASS___NSPCoreData, "childCoreDataContext"));
  if (!v77)
  {
    uint64_t v72 = nplog_obj(0LL, v4, v5);
    uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v72);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      unsigned int v81 = "+[NSPCoreData prepareTokenEventsFromPrediction:]";
      _os_log_fault_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_FAULT, "%s called with null context", buf, 0xCu);
    }

    goto LABEL_4;
  }

  uint64_t v6 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  if (!v6)
  {
    uint64_t v73 = nplog_obj(0LL, v7, v8);
    uint64_t v74 = (os_log_s *)objc_claimAutoreleasedReturnValue(v73);
    if (os_log_type_enabled(v74, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      unsigned int v81 = "+[NSPCoreData prepareTokenEventsFromPrediction:]";
      _os_log_fault_impl((void *)&_mh_execute_header, v74, OS_LOG_TYPE_FAULT, "%s called with null array", buf, 0xCu);
    }

    uint64_t v9 = 0LL;
    goto LABEL_4;
  }

  uint64_t v9 = (os_log_s *)v6;
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v3 shape]);
  id v11 = [v10 count];

  if ((unint64_t)v11 < 3)
  {
LABEL_4:
    unsigned int v12 = 0LL;
    goto LABEL_18;
  }

  uint64_t v76 = v9;
  __int128 v13 = (void *)objc_claimAutoreleasedReturnValue([v3 shape]);
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v13 objectAtIndexedSubscript:0]);
  int v15 = [v14 intValue];

  if (v15 < 1)
  {
LABEL_17:
    uint64_t v9 = v76;
    unsigned int v12 = v9;
  }

  else
  {
    unsigned int v78 = 0;
    *(void *)&__int128 v16 = 134218242LL;
    __int128 v75 = v16;
    id v79 = v3;
    while (1)
    {
      uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "shape", v75));
      uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v17 objectAtIndexedSubscript:1]);
      int v19 = [v18 intValue];

      if (v19 >= 1) {
        break;
      }
LABEL_16:
      uint64_t v66 = (void *)objc_claimAutoreleasedReturnValue([v3 shape]);
      id v67 = (void *)objc_claimAutoreleasedReturnValue([v66 objectAtIndexedSubscript:0]);
      signed int v68 = [v67 intValue];
    }

    uint64_t v20 = 0LL;
    while (1)
    {
      uint64_t v21 = -[NSPTokenEvent initWithContext:](objc_alloc(&OBJC_CLASS___NSPTokenEvent), "initWithContext:", v77);
      if (!v21) {
        break;
      }
      id v24 = v21;
      id v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v78));
      v87[0] = v25;
      uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v20));
      v87[1] = v26;
      id v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", 0LL));
      v87[2] = v27;
      uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v87, 3LL));
      double v29 = (void *)objc_claimAutoreleasedReturnValue([v79 objectForKeyedSubscript:v28]);
      [v29 floatValue];
      -[NSPTokenEvent setEventType:](v24, "setEventType:", llroundf(v30) - 1);

      uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v78));
      v86[0] = v31;
      double v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v20));
      v86[1] = v32;
      double v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", 1LL));
      v86[2] = v33;
      uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v86, 3LL));
      uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue([v79 objectForKeyedSubscript:v34]);
      [v35 floatValue];
      -[NSPTokenEvent setTokenCount:](v24, "setTokenCount:", llroundf(v36));

      uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v78));
      v85[0] = v37;
      double v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v20));
      v85[1] = v38;
      double v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", 4LL));
      v85[2] = v39;
      id v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v85, 3LL));
      double v41 = (void *)objc_claimAutoreleasedReturnValue([v79 objectForKeyedSubscript:v40]);
      [v41 floatValue];
      double v43 = v42;

      uint64_t v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
      double v45 = (void *)objc_claimAutoreleasedReturnValue([v44 dateByAddingTimeInterval:v43]);
      -[NSPTokenEvent setDate:](v24, "setDate:", v45);

      id v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v78));
      v84[0] = v46;
      double v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v20));
      v84[1] = v47;
      unsigned int v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", 5LL));
      v84[2] = v48;
      unsigned int v49 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v84, 3LL));
      uint64_t v50 = (void *)objc_claimAutoreleasedReturnValue([v79 objectForKeyedSubscript:v49]);
      [v50 floatValue];
      unint64_t v52 = llroundf(v51);

      uint64_t v53 = (void *)objc_claimAutoreleasedReturnValue(+[NSPCoreData getVendorNameById:](&OBJC_CLASS___NSPCoreData, "getVendorNameById:", v52));
      if (v53)
      {
        -[NSPTokenEvent setVendor:](v24, "setVendor:", v53);
        id v54 = -[os_log_s addObject:](v76, "addObject:", v24);
        uint64_t v57 = nplog_obj(v54, v55, v56);
        __int128 v58 = (os_log_s *)objc_claimAutoreleasedReturnValue(v57);
        if (os_log_type_enabled(v58, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          unsigned int v81 = (const char *)v24;
          _os_log_impl((void *)&_mh_execute_header, v58, OS_LOG_TYPE_INFO, "NSP event from prediction: %@", buf, 0xCu);
        }
      }

      else
      {
        id v59 = -[NSPTokenEvent setVendor:](v24, "setVendor:", @"Unknown");
        uint64_t v62 = nplog_obj(v59, v60, v61);
        __int128 v58 = (os_log_s *)objc_claimAutoreleasedReturnValue(v62);
        if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = v75;
          unsigned int v81 = (const char *)v52;
          __int16 v82 = 2112;
          uint64_t v83 = v24;
          _os_log_error_impl( (void *)&_mh_execute_header,  v58,  OS_LOG_TYPE_ERROR,  "Incorrect prediction for Vendor %lu, event:%@",  buf,  0x16u);
        }
      }

      uint64_t v20 = (v20 + 1);
      id v3 = v79;
      uint64_t v63 = (void *)objc_claimAutoreleasedReturnValue([v79 shape]);
      unsigned int v64 = (void *)objc_claimAutoreleasedReturnValue([v63 objectAtIndexedSubscript:1]);
      int v65 = [v64 intValue];
    }

    uint64_t v70 = nplog_obj(0LL, v22, v23);
    uint64_t v71 = (os_log_s *)objc_claimAutoreleasedReturnValue(v70);
    if (os_log_type_enabled(v71, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      unsigned int v81 = "+[NSPCoreData prepareTokenEventsFromPrediction:]";
      _os_log_fault_impl((void *)&_mh_execute_header, v71, OS_LOG_TYPE_FAULT, "%s called with null event", buf, 0xCu);
    }

    unsigned int v12 = 0LL;
    id v3 = v79;
    uint64_t v9 = v76;
  }

+ (void)prepareModelInputWithFeatures:(id)a3 keyedSubscripts:(id)a4 features:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithArray:](&OBJC_CLASS___NSMutableArray, "arrayWithArray:", a4));
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", 0LL));
  [v9 addObject:v10];

  id v11 = (void *)objc_claimAutoreleasedReturnValue([v7 shape]);
  id v12 = [v11 count];
  id v13 = [v9 count];

  if (v12 == v13)
  {
    __int128 v25 = 0u;
    __int128 v26 = 0u;
    __int128 v23 = 0u;
    __int128 v24 = 0u;
    id v22 = v8;
    id v14 = v8;
    id v15 = [v14 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v15)
    {
      id v16 = v15;
      uint64_t v17 = 0LL;
      uint64_t v18 = *(void *)v24;
      do
      {
        int v19 = 0LL;
        do
        {
          if (*(void *)v24 != v18) {
            objc_enumerationMutation(v14);
          }
          uint64_t v20 = *(void *)(*((void *)&v23 + 1) + 8LL * (void)v19);
          uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", (char *)v19 + v17));
          objc_msgSend(v9, "replaceObjectAtIndex:withObject:", (char *)objc_msgSend(v9, "count") - 1, v21);
          [v7 setObject:v20 forKeyedSubscript:v9];

          int v19 = (char *)v19 + 1;
        }

        while (v16 != v19);
        id v16 = [v14 countByEnumeratingWithState:&v23 objects:v27 count:16];
        uint64_t v17 = (v17 + (_DWORD)v19);
      }

      while (v16);
    }

    id v8 = v22;
  }
}

+ (id)prepareInputForPrediction:(id)a3 vendor:(id)a4
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectAtIndexedSubscript:1]);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSPCoreData getVendorDictionary](&OBJC_CLASS___NSPCoreData, "getVendorDictionary"));
  uint64_t v9 = v6;
  if (v6)
  {
    uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue([v6 allKeys]);
    id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSPCoreData fetchLatestEvents:vendors:]( NSPCoreData,  "fetchLatestEvents:vendors:",  (char *)[v5 unsignedLongValue] + 1,  v10));
    id v14 = v11;
    if (v11)
    {
      id v15 = [v11 count];
      if ((unint64_t)v15 < [v5 unsignedIntValue] + 1)
      {
        id v16 = 0LL;
LABEL_8:

        goto LABEL_9;
      }

      uint64_t v17 = -[MLMultiArray initWithShape:dataType:error:]( objc_alloc(&OBJC_CLASS___MLMultiArray),  "initWithShape:dataType:error:",  v4,  65568LL,  0LL);
      if (v17)
      {
        uint64_t v20 = v17;
        uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSPCoreData prepareMLData:startAt:dataShape:]( &OBJC_CLASS___NSPCoreData,  "prepareMLData:startAt:dataShape:",  v14,  0LL,  v4));

        id v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSPCoreData normalizeData:](&OBJC_CLASS___NSPCoreData, "normalizeData:", v21));
LABEL_7:

        goto LABEL_8;
      }

      uint64_t v26 = nplog_obj(0LL, v18, v19);
      uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(v26);
      if (!os_log_type_enabled((os_log_t)v21, OS_LOG_TYPE_FAULT))
      {
LABEL_16:
        id v16 = 0LL;
        goto LABEL_7;
      }

      int v27 = 136315138;
      uint64_t v28 = "+[NSPCoreData prepareInputForPrediction:vendor:]";
      __int128 v25 = "%s called with null modelInput";
    }

    else
    {
      uint64_t v24 = nplog_obj(0LL, v12, v13);
      uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(v24);
      if (!os_log_type_enabled((os_log_t)v21, OS_LOG_TYPE_FAULT)) {
        goto LABEL_16;
      }
      int v27 = 136315138;
      uint64_t v28 = "+[NSPCoreData prepareInputForPrediction:vendor:]";
      __int128 v25 = "%s called with null events";
    }

    _os_log_fault_impl((void *)&_mh_execute_header, (os_log_t)v21, OS_LOG_TYPE_FAULT, v25, (uint8_t *)&v27, 0xCu);
    goto LABEL_16;
  }

  uint64_t v23 = nplog_obj(0LL, v7, v8);
  uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
  {
    int v27 = 136315138;
    uint64_t v28 = "+[NSPCoreData prepareInputForPrediction:vendor:]";
    _os_log_fault_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_FAULT,  "%s called with null dictionary",  (uint8_t *)&v27,  0xCu);
  }

  id v16 = 0LL;
LABEL_9:

  return v16;
}

+ (void)handleNSPEventsPredictions:(id)a3
{
  id v3 = a3;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  id v4 = [v3 countByEnumeratingWithState:&v13 objects:v19 count:16];
  if (v4)
  {
    id v7 = v4;
    uint64_t v8 = *(void *)v14;
    do
    {
      uint64_t v9 = 0LL;
      do
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v3);
        }
        uint64_t v10 = *(void *)(*((void *)&v13 + 1) + 8LL * (void)v9);
        uint64_t v11 = nplog_obj(v4, v5, v6);
        uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v18 = v10;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "Prediction of NSP event: %@", buf, 0xCu);
        }

        uint64_t v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      id v4 = [v3 countByEnumeratingWithState:&v13 objects:v19 count:16];
      id v7 = v4;
    }

    while (v4);
  }
}

+ (void)predictNSPEvent:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSPCoreData getNSPEventsPredictor](&OBJC_CLASS___NSPCoreData, "getNSPEventsPredictor"));
  id v7 = v4;
  if (v4)
  {
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v4 model]);
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 modelDescription]);
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 inputDescriptionsByName]);
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:@"lstm_input"]);

    uint64_t v15 = nplog_obj(v12, v13, v14);
    __int128 v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      unsigned int v49 = (void *)objc_claimAutoreleasedReturnValue([v11 multiArrayConstraint]);
      uint64_t v50 = (char *)objc_claimAutoreleasedReturnValue([v49 shape]);
      *(_DWORD *)buf = 138412290;
      uint64_t v63 = v50;
      _os_log_debug_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "model shape %@", buf, 0xCu);
    }

    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v11 multiArrayConstraint]);
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v17 shape]);

    if (!v18)
    {
      uint64_t v52 = nplog_obj(v19, v20, v21);
      uint64_t v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v52);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315138;
        uint64_t v63 = "+[NSPCoreData predictNSPEvent:]";
        _os_log_fault_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_FAULT, "%s called with null shape", buf, 0xCu);
      }

      goto LABEL_20;
    }

    uint64_t v24 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSPCoreData prepareInputForPrediction:vendor:]( &OBJC_CLASS___NSPCoreData,  "prepareInputForPrediction:vendor:",  v18,  v3));
    if (!v24)
    {
      uint64_t v53 = nplog_obj(0LL, v22, v23);
      double v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v53);
      if (os_log_type_enabled(v29, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315138;
        uint64_t v63 = "+[NSPCoreData predictNSPEvent:]";
        _os_log_fault_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_FAULT,  "%s called with null modelInput",  buf,  0xCu);
      }

      goto LABEL_19;
    }

    +[NSPCoreData printMLMultiArray:](&OBJC_CLASS___NSPCoreData, "printMLMultiArray:", v24);
    id v61 = 0LL;
    __int128 v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "predictionFromLstm_input:error:", v24, &v61));
    uint64_t v26 = (os_log_s *)v61;
    double v29 = v26;
    if (!v25)
    {
      uint64_t v46 = nplog_obj(v26, v27, v28);
      double v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(v46);
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v63 = (const char *)v29;
        _os_log_error_impl( (void *)&_mh_execute_header,  v33,  OS_LOG_TYPE_ERROR,  "Failed to predict next NSP event %@",  buf,  0xCu);
      }

      goto LABEL_18;
    }

    float v30 = (void *)objc_claimAutoreleasedReturnValue([v25 Identity]);
    +[NSPCoreData printMLMultiArray:](&OBJC_CLASS___NSPCoreData, "printMLMultiArray:", v30);

    double v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[NSPCoreData getNSPEventsDenormalizer](&OBJC_CLASS___NSPCoreData, "getNSPEventsDenormalizer"));
    if (!v33)
    {
      uint64_t v54 = nplog_obj(0LL, v31, v32);
      float v36 = (os_log_s *)objc_claimAutoreleasedReturnValue(v54);
      if (os_log_type_enabled(v36, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315138;
        uint64_t v63 = "+[NSPCoreData predictNSPEvent:]";
        _os_log_fault_impl( (void *)&_mh_execute_header,  v36,  OS_LOG_TYPE_FAULT,  "%s called with null denormalizer",  buf,  0xCu);
      }

      unsigned int v48 = v29;
      goto LABEL_17;
    }

    id v59 = v7;
    uint64_t v34 = v11;
    uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue([v25 Identity]);
    uint64_t v60 = v29;
    float v36 = (os_log_s *)objc_claimAutoreleasedReturnValue( -[os_log_s predictionFromDenormalizer_input:error:]( v33,  "predictionFromDenormalizer_input:error:",  v35,  &v60));
    __int128 v58 = v60;

    if (v36)
    {
      id v57 = v3;
      id v40 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s Identity](v36, "Identity"));
      +[NSPCoreData printMLMultiArray:](&OBJC_CLASS___NSPCoreData, "printMLMultiArray:", v40);

      double v41 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s Identity](v36, "Identity"));
      float v42 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSPCoreData prepareTokenEventsFromPrediction:]( &OBJC_CLASS___NSPCoreData,  "prepareTokenEventsFromPrediction:",  v41));

      if (!v42)
      {
        uint64_t v55 = nplog_obj(v43, v44, v45);
        uint64_t v56 = (os_log_s *)objc_claimAutoreleasedReturnValue(v55);
        uint64_t v11 = v34;
        if (os_log_type_enabled(v56, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 136315138;
          uint64_t v63 = "+[NSPCoreData predictNSPEvent:]";
          _os_log_fault_impl( (void *)&_mh_execute_header,  v56,  OS_LOG_TYPE_FAULT,  "%s called with null predictedEvents",  buf,  0xCu);
        }

        float v42 = 0LL;
        id v3 = v57;
        goto LABEL_15;
      }

      +[NSPCoreData handleNSPEventsPredictions:](&OBJC_CLASS___NSPCoreData, "handleNSPEventsPredictions:", v42);
      id v3 = v57;
    }

    else
    {
      uint64_t v47 = nplog_obj(v37, v38, v39);
      float v42 = (os_log_s *)objc_claimAutoreleasedReturnValue(v47);
      if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        unsigned int v48 = (os_log_s *)v58;
        uint64_t v63 = v58;
        _os_log_error_impl( (void *)&_mh_execute_header,  v42,  OS_LOG_TYPE_ERROR,  "Failed to denormalize the data %@",  buf,  0xCu);
        uint64_t v11 = v34;
        id v7 = v59;
        goto LABEL_16;
      }
    }

    uint64_t v11 = v34;
LABEL_15:
    unsigned int v48 = (os_log_s *)v58;
    id v7 = v59;
LABEL_16:

LABEL_17:
    double v29 = v48;
LABEL_18:

LABEL_19:
LABEL_20:

    goto LABEL_21;
  }

  uint64_t v51 = nplog_obj(0LL, v5, v6);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(v51);
  if (os_log_type_enabled((os_log_t)v11, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v63 = "+[NSPCoreData predictNSPEvent:]";
    _os_log_fault_impl( (void *)&_mh_execute_header,  (os_log_t)v11,  OS_LOG_TYPE_FAULT,  "%s called with null mlmodel",  buf,  0xCu);
  }

+ (id)tokenTypeEnumToString:(int)a3
{
  else {
    return *(&off_1000FA738 + a3);
  }
}

- (NSPPersistentContainer)persistentContainer
{
  return (NSPPersistentContainer *)objc_getProperty(self, a2, 8LL, 1);
}

- (void)setPersistentContainer:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
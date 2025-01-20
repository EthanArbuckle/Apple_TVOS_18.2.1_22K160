@interface BMStateVectorMetricsCollector
- (BMStateVectorMetricsCollector)initWithDatabase:(id)a3 activity:(id)a4;
- (id)computeStateVectorMetrics;
- (id)dateToRelativePositionDictionary;
- (id)validStreamNameMapping;
- (unint64_t)sizeOfSerializedStateVectorInBytes:(id)a3;
- (unint64_t)timestampCountForStateVector:(id)a3;
- (void)computeAndSendStateVectorMetrics;
@end

@implementation BMStateVectorMetricsCollector

- (BMStateVectorMetricsCollector)initWithDatabase:(id)a3 activity:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___BMStateVectorMetricsCollector;
  v9 = -[BMStateVectorMetricsCollector init](&v12, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_database, a3);
    objc_storeStrong((id *)&v10->_activity, a4);
  }

  return v10;
}

- (void)computeAndSendStateVectorMetrics
{
  __int128 v7 = 0u;
  __int128 v8 = 0u;
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BMStateVectorMetricsCollector computeStateVectorMetrics](self, "computeStateVectorMetrics", 0LL));
  id v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      v6 = 0LL;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        +[BMCoreAnalyticsEvents sendCKRecordCRDTLog:]( &OBJC_CLASS___BMCoreAnalyticsEvents,  "sendCKRecordCRDTLog:",  *(void *)(*((void *)&v7 + 1) + 8LL * (void)v6));
        v6 = (char *)v6 + 1;
      }

      while (v4 != v6);
      id v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }

    while (v4);
  }
}

- (id)validStreamNameMapping
{
  v2 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue( +[BMStreamSyncPolicy syncableStreamConfigurations]( &OBJC_CLASS___BMStreamSyncPolicy,  "syncableStreamConfigurations"));
  id v3 = [obj countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v24;
    do
    {
      for (i = 0LL; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v24 != v5) {
          objc_enumerationMutation(obj);
        }
        __int128 v7 = *(void **)(*((void *)&v23 + 1) + 8LL * (void)i);
        __int128 v8 = (void *)objc_claimAutoreleasedReturnValue([v7 streamIdentifier]);
        __int128 v9 = (void *)objc_claimAutoreleasedReturnValue([v7 syncPolicy]);
        if ([v9 supportsTransport:3 direction:3])
        {
          -[NSMutableDictionary setObject:forKeyedSubscript:](v2, "setObject:forKeyedSubscript:", v8, v8);
          __int128 v10 = (void *)objc_claimAutoreleasedReturnValue([v7 streamUUID]);
          v11 = (void *)objc_claimAutoreleasedReturnValue([v10 UUIDString]);
          -[NSMutableDictionary setObject:forKeyedSubscript:](v2, "setObject:forKeyedSubscript:", v8, v11);

          __int128 v21 = 0u;
          __int128 v22 = 0u;
          __int128 v19 = 0u;
          __int128 v20 = 0u;
          objc_super v12 = (void *)objc_claimAutoreleasedReturnValue([v7 legacyNames]);
          id v13 = [v12 countByEnumeratingWithState:&v19 objects:v27 count:16];
          if (v13)
          {
            id v14 = v13;
            uint64_t v15 = *(void *)v20;
            do
            {
              for (j = 0LL; j != v14; j = (char *)j + 1)
              {
                if (*(void *)v20 != v15) {
                  objc_enumerationMutation(v12);
                }
                -[NSMutableDictionary setObject:forKeyedSubscript:]( v2,  "setObject:forKeyedSubscript:",  v8,  *(void *)(*((void *)&v19 + 1) + 8LL * (void)j));
              }

              id v14 = [v12 countByEnumeratingWithState:&v19 objects:v27 count:16];
            }

            while (v14);
          }
        }
      }

      id v4 = [obj countByEnumeratingWithState:&v23 objects:v28 count:16];
    }

    while (v4);
  }

  return v2;
}

- (id)computeStateVectorMetrics
{
  v50 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  v49 = (void *)objc_claimAutoreleasedReturnValue(-[BMStateVectorMetricsCollector validStreamNameMapping](self, "validStreamNameMapping"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v49 allKeys]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v3));

  uint64_t v5 = __biome_log_for_category(11LL);
  v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    sub_100040B30((uint64_t)self, (uint64_t)v4, v6);
  }

  v48 = (void *)objc_claimAutoreleasedReturnValue( -[BMStateVectorMetricsCollector dateToRelativePositionDictionary]( self,  "dateToRelativePositionDictionary"));
  __int128 v7 = (void *)objc_claimAutoreleasedReturnValue(-[BMSyncDatabase locationsWithState:](self->_database, "locationsWithState:", 2LL));
  __int128 v57 = 0u;
  __int128 v58 = 0u;
  __int128 v59 = 0u;
  __int128 v60 = 0u;
  id obj = v7;
  id v8 = [obj countByEnumeratingWithState:&v57 objects:v69 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v58;
    uint64_t v46 = *(void *)v58;
    v47 = v4;
    do
    {
      v11 = 0LL;
      id v51 = v9;
      do
      {
        if (*(void *)v58 != v10) {
          objc_enumerationMutation(obj);
        }
        objc_super v12 = *(void **)(*((void *)&v57 + 1) + 8LL * (void)v11);
        id v13 = objc_autoreleasePoolPush();
        id v14 = (void *)objc_claimAutoreleasedReturnValue([v12 streamName]);
        unsigned int v15 = [v4 containsObject:v14];

        if (v15)
        {
          v54 = v13;
          v56 = (void *)objc_claimAutoreleasedReturnValue(-[BMSyncDatabase locationRowWithLocation:](self->_database, "locationRowWithLocation:", v12));
          v16 = (void *)objc_claimAutoreleasedReturnValue(-[BMSyncDatabase stateVectorForLocationRow:](self->_database, "stateVectorForLocationRow:"));
          v17 = (void *)objc_claimAutoreleasedReturnValue([v12 day]);
          uint64_t v18 = objc_claimAutoreleasedReturnValue([v48 objectForKeyedSubscript:v17]);
          __int128 v19 = (void *)v18;
          __int128 v20 = &off_10006EE88;
          if (v18) {
            __int128 v20 = (_UNKNOWN **)v18;
          }
          __int128 v21 = v20;

          v55 = v21;
          v68[0] = v21;
          v67[0] = @"relative_pos";
          v67[1] = @"state_vector_sites_cnt";
          __int128 v22 = (void *)objc_claimAutoreleasedReturnValue([v16 clockVector]);
          __int128 v23 = (void *)objc_claimAutoreleasedReturnValue([v22 allSiteIdentifiers]);
          __int128 v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v23 count]));
          v68[1] = v24;
          v67[2] = @"state_vector_size_est";
          __int128 v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  -[BMStateVectorMetricsCollector sizeOfSerializedStateVectorInBytes:]( self,  "sizeOfSerializedStateVectorInBytes:",  v16)));
          v68[2] = v25;
          v67[3] = @"state_vector_timestamp_cnt";
          __int128 v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  -[BMStateVectorMetricsCollector timestampCountForStateVector:]( self,  "timestampCountForStateVector:",  v16)));
          v68[3] = v26;
          v67[4] = @"stream_name";
          uint64_t v27 = objc_claimAutoreleasedReturnValue([v12 streamName]);
          v28 = self;
          v29 = (void *)v27;
          v30 = (void *)objc_claimAutoreleasedReturnValue([v49 objectForKeyedSubscript:v27]);
          v68[4] = v30;
          v53 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v68,  v67,  5LL));

          self = v28;
          uint64_t v31 = __biome_log_for_category(11LL);
          v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
          if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
          {
            v37 = (objc_class *)objc_opt_class(v28, v33);
            v38 = NSStringFromClass(v37);
            v39 = (void *)objc_claimAutoreleasedReturnValue(v38);
            v40 = (void *)objc_claimAutoreleasedReturnValue([v56 location]);
            v41 = (void *)objc_claimAutoreleasedReturnValue([v40 day]);
            *(_DWORD *)buf = 138412802;
            v62 = v39;
            __int16 v63 = 2112;
            v64 = v41;
            __int16 v65 = 2112;
            v66 = v55;
            _os_log_debug_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_DEBUG,  "%@ - locationRow with day: %@ has relativePosition: %@",  buf,  0x20u);
          }

          uint64_t v34 = __biome_log_for_category(11LL);
          v35 = (os_log_s *)objc_claimAutoreleasedReturnValue(v34);
          if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
          {
            v42 = (objc_class *)objc_opt_class(v28, v36);
            v43 = NSStringFromClass(v42);
            v44 = (void *)objc_claimAutoreleasedReturnValue(v43);
            *(_DWORD *)buf = 138412546;
            v62 = v44;
            __int16 v63 = 2112;
            v64 = v53;
            _os_log_debug_impl( (void *)&_mh_execute_header,  v35,  OS_LOG_TYPE_DEBUG,  "%@ - generated crdtLog: %@",  buf,  0x16u);
          }

          -[NSMutableArray addObject:](v50, "addObject:", v53);
          uint64_t v10 = v46;
          id v4 = v47;
          id v9 = v51;
          id v13 = v54;
        }

        objc_autoreleasePoolPop(v13);
        v11 = (char *)v11 + 1;
      }

      while (v9 != v11);
      id v9 = [obj countByEnumeratingWithState:&v57 objects:v69 count:16];
    }

    while (v9);
  }

  return v50;
}

- (id)dateToRelativePositionDictionary
{
  v2 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  id v3 = +[BMStreamCRDTLocationDayAssigner truncateDateToDay:]( &OBJC_CLASS___BMStreamCRDTLocationDayAssigner,  "truncateDateToDay:",  CFAbsoluteTimeGetCurrent());
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  [v4 timeIntervalSinceReferenceDate];
  double v6 = v5;
  unint64_t v7 = 0LL;
  for (uint64_t i = 0LL; i != 100; ++i)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue( +[BMStreamCRDTLocationDayAssigner truncateDateToDay:]( &OBJC_CLASS___BMStreamCRDTLocationDayAssigner,  "truncateDateToDay:",  v6 - (double)v7));
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", i));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v2, "setObject:forKeyedSubscript:", v10, v9);

    v7 += 86400LL;
  }

  return v2;
}

- (unint64_t)sizeOfSerializedStateVectorInBytes:(id)a3
{
  id v4 = a3;
  id v11 = 0LL;
  double v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  v4,  1LL,  &v11));
  id v6 = v11;
  if (v6)
  {
    uint64_t v7 = __biome_log_for_category(11LL);
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_100040BC4((uint64_t)self, (uint64_t)v4, v8);
    }
  }

  id v9 = [v5 length];

  return (unint64_t)v9;
}

- (unint64_t)timestampCountForStateVector:(id)a3
{
  id v3 = a3;
  uint64_t v7 = 0LL;
  id v8 = &v7;
  uint64_t v9 = 0x2020000000LL;
  uint64_t v10 = 0LL;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_10000F08C;
  v6[3] = &unk_100068E18;
  v6[4] = &v7;
  [v3 enumerateAllClockValuesUsingBlock:v6];
  unint64_t v4 = v8[3];
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (void).cxx_destruct
{
}

@end
@interface GEOAPNetEventAggregator
+ (id)sharedAggregator;
- (void)_computeDistributionStatsOver:(id)a3 statsResultsBlock:(id)a4;
- (void)runAggregation;
- (void)runAggregationForDate:(id)a3;
@end

@implementation GEOAPNetEventAggregator

+ (id)sharedAggregator
{
  if (qword_100033D90 != -1) {
    dispatch_once(&qword_100033D90, &stru_100028728);
  }
  return (id)qword_100033D88;
}

- (void)_computeDistributionStatsOver:(id)a3 statsResultsBlock:(id)a4
{
  id v5 = a3;
  v6 = (void (**)(id, id, double, double, double, double, double, double, double, double, double))a4;
  if ([v5 count])
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue([v5 sortedArrayUsingComparator:&stru_100028768]);
    id v8 = [v7 count];
    v9 = (void *)objc_claimAutoreleasedReturnValue([v7 firstObject]);
    [v9 doubleValue];
    double v39 = v10;

    v11 = (void *)objc_claimAutoreleasedReturnValue([v7 lastObject]);
    [v11 doubleValue];
    double v38 = v12;

    v13 = (void *)objc_claimAutoreleasedReturnValue( [v7 objectAtIndexedSubscript:(unint64_t)((double)(unint64_t)v8 * 0.1)]);
    [v13 doubleValue];
    double v15 = v14;

    v16 = (void *)objc_claimAutoreleasedReturnValue( [v7 objectAtIndexedSubscript:(unint64_t)((double)(unint64_t)v8 * 0.25)]);
    [v16 doubleValue];
    double v18 = v17;

    v19 = (void *)objc_claimAutoreleasedReturnValue( [v7 objectAtIndexedSubscript:(unint64_t)((double)(unint64_t)v8 * 0.5)]);
    [v19 doubleValue];
    double v21 = v20;

    v22 = (void *)objc_claimAutoreleasedReturnValue( [v7 objectAtIndexedSubscript:(unint64_t)((double)(unint64_t)v8 * 0.75)]);
    [v22 doubleValue];
    double v24 = v23;

    v25 = (void *)objc_claimAutoreleasedReturnValue( [v7 objectAtIndexedSubscript:(unint64_t)((double)(unint64_t)v8 * 0.9)]);
    [v25 doubleValue];
    double v27 = v26;

    v28 = (void *)objc_claimAutoreleasedReturnValue( [v7 objectAtIndexedSubscript:(unint64_t)((double)(unint64_t)v8 * 0.99)]);
    [v28 doubleValue];
    double v30 = v29;

    __int128 v42 = 0u;
    __int128 v43 = 0u;
    __int128 v40 = 0u;
    __int128 v41 = 0u;
    id v31 = v5;
    id v32 = [v31 countByEnumeratingWithState:&v40 objects:v44 count:16];
    if (v32)
    {
      id v33 = v32;
      uint64_t v34 = *(void *)v41;
      double v35 = 0.0;
      do
      {
        for (i = 0LL; i != v33; i = (char *)i + 1)
        {
          if (*(void *)v41 != v34) {
            objc_enumerationMutation(v31);
          }
          [*(id *)(*((void *)&v40 + 1) + 8 * (void)i) doubleValue];
          double v35 = v35 + v37;
        }

        id v33 = [v31 countByEnumeratingWithState:&v40 objects:v44 count:16];
      }

      while (v33);
    }

    else
    {
      double v35 = 0.0;
    }

    v6[2](v6, v8, v35 / (double)(unint64_t)v8, v39, v38, v15, v18, v21, v24, v27, v30);
  }

  else
  {
    v6[2](v6, 0LL, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0);
  }
}

- (void)runAggregationForDate:(id)a3
{
  id v4 = a3;
  id v5 = sub_100005E94();
  v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    id v74 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "run aggregation for date '%@'", buf, 0xCu);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[GEOAnalyticsDataService sharedService](&OBJC_CLASS___GEOAnalyticsDataService, "sharedService"));
  id v8 = [v7 networkEventFileDescriptorForRepresentativeDate:v4];

  if ((v8 & 0x80000000) != 0)
  {
    id v43 = sub_100005E94();
    v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v43);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "no data to aggregate", buf, 2u);
    }
  }

  else
  {
    v9 = (os_log_s *)[[GEONetworkEventFile alloc] initForReadWithFileDescriptor:v8];
    if (v9)
    {
      id v46 = v4;
      v69[0] = _NSConcreteStackBlock;
      v69[1] = 3221225472LL;
      v69[2] = sub_100005ED4;
      v69[3] = &unk_100028790;
      double v10 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
      v70 = v10;
      v45 = v9;
      -[os_log_s unsafe_readNetworkEventDataWithVisitorBlock:](v9, "unsafe_readNetworkEventDataWithVisitorBlock:", v69);
      __int128 v65 = 0u;
      __int128 v66 = 0u;
      __int128 v67 = 0u;
      __int128 v68 = 0u;
      v11 = v10;
      id v49 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v11,  "countByEnumeratingWithState:objects:count:",  &v65,  v72,  16LL);
      if (v49)
      {
        uint64_t v47 = *(void *)v66;
        v48 = v11;
        do
        {
          uint64_t v12 = 0LL;
          do
          {
            if (*(void *)v66 != v47) {
              objc_enumerationMutation(v11);
            }
            uint64_t v50 = v12;
            v13 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( v11,  "objectForKeyedSubscript:",  *(void *)(*((void *)&v65 + 1) + 8 * v12)));
            v52 = -[NSMutableArray initWithCapacity:]( [NSMutableArray alloc],  "initWithCapacity:",  [v13 count]);
            __int128 v61 = 0u;
            __int128 v62 = 0u;
            __int128 v63 = 0u;
            __int128 v64 = 0u;
            id obj = v13;
            id v53 = [obj countByEnumeratingWithState:&v61 objects:v71 count:16];
            if (v53)
            {
              uint64_t v51 = *(void *)v62;
              do
              {
                for (i = 0LL; i != v53; i = (char *)i + 1)
                {
                  if (*(void *)v62 != v51) {
                    objc_enumerationMutation(obj);
                  }
                  double v15 = (void *)objc_claimAutoreleasedReturnValue( [obj objectForKeyedSubscript:*(void *)(*((void *)&v61 + 1) + 8 * (void)i)]);
                  id v16 = objc_alloc_init(&OBJC_CLASS___GEONetEventDimensionalGrouping);
                  double v17 = (void *)objc_claimAutoreleasedReturnValue([v15 objectForKeyedSubscript:@"y"]);
                  objc_msgSend(v16, "setYear:", objc_msgSend(v17, "intValue"));

                  double v18 = (void *)objc_claimAutoreleasedReturnValue([v15 objectForKeyedSubscript:@"m"]);
                  objc_msgSend(v16, "setMonth:", objc_msgSend(v18, "intValue"));

                  v19 = (void *)objc_claimAutoreleasedReturnValue([v15 objectForKeyedSubscript:@"d"]);
                  objc_msgSend(v16, "setDay:", objc_msgSend(v19, "intValue"));

                  double v20 = (void *)objc_claimAutoreleasedReturnValue([v15 objectForKeyedSubscript:@"c"]);
                  objc_msgSend(v16, "setUsedCellular:", objc_msgSend(v20, "BOOLValue"));

                  double v21 = (void *)objc_claimAutoreleasedReturnValue([v15 objectForKeyedSubscript:@"n"]);
                  objc_msgSend(v16, "setNetworkService:", objc_msgSend(v21, "intValue"));

                  v22 = (void *)objc_claimAutoreleasedReturnValue([v15 objectForKeyedSubscript:@"raid"]);
                  [v16 setRequestingAppId:v22];

                  double v23 = (void *)objc_claimAutoreleasedReturnValue([v15 objectForKeyedSubscript:@"aid"]);
                  [v16 setAppId:v23];

                  double v24 = (void *)objc_claimAutoreleasedReturnValue([v15 objectForKeyedSubscript:@"ip"]);
                  [v16 setSvcIp:v24];

                  v25 = (void *)objc_claimAutoreleasedReturnValue([v15 objectForKeyedSubscript:@"ed"]);
                  [v16 setErrorDomain:v25];

                  double v26 = (void *)objc_claimAutoreleasedReturnValue([v15 objectForKeyedSubscript:@"me"]);
                  [v16 setManifestEnv:v26];

                  double v27 = (void *)objc_claimAutoreleasedReturnValue([v15 objectForKeyedSubscript:@"cc"]);
                  [v16 setCountryCode:v27];

                  v28 = (void *)objc_claimAutoreleasedReturnValue([v15 objectForKeyedSubscript:@"cr"]);
                  objc_msgSend(v16, "setReusedConnection:", objc_msgSend(v28, "BOOLValue"));

                  double v29 = (void *)objc_claimAutoreleasedReturnValue([v15 objectForKeyedSubscript:@"ubu"]);
                  objc_msgSend(v16, "setIsBackground:", objc_msgSend(v29, "BOOLValue"));

                  double v30 = (void *)objc_claimAutoreleasedReturnValue([v15 objectForKeyedSubscript:@"p"]);
                  id v31 = v30;
                  if (v30) {
                    objc_msgSend(v16, "setPlaceType:", objc_msgSend(v30, "intValue"));
                  }
                  id v32 = (void *)objc_claimAutoreleasedReturnValue([v15 objectForKeyedSubscript:@"ec"]);

                  if (v32) {
                    objc_msgSend(v16, "setErrorCode:", (int)objc_msgSend(v32, "intValue"));
                  }
                  id v33 = (void *)objc_claimAutoreleasedReturnValue([v15 objectForKeyedSubscript:@"tsi"]);

                  if (v33) {
                    objc_msgSend(v16, "setTileSetId:", objc_msgSend(v33, "intValue"));
                  }
                  uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue([v15 objectForKeyedSubscript:@"tss"]);

                  if (v34) {
                    objc_msgSend(v16, "setTileSetStyle:", objc_msgSend(v34, "intValue"));
                  }
                  double v35 = (void *)objc_claimAutoreleasedReturnValue([v15 objectForKeyedSubscript:@"hc"]);

                  if (v35) {
                    objc_msgSend(v16, "setHttpResponseCode:", objc_msgSend(v35, "intValue"));
                  }
                  v36 = (void *)objc_claimAutoreleasedReturnValue([v15 objectForKeyedSubscript:@"dsid"]);

                  if (v36) {
                    objc_msgSend(v16, "setDataSetId:", objc_msgSend(v36, "unsignedIntValue"));
                  }
                  double v37 = (void *)objc_claimAutoreleasedReturnValue([v15 objectForKeyedSubscript:@"L"]);
                  objc_msgSend(v16, "setEventCount:", objc_msgSend(v37, "count"));
                  v59[0] = _NSConcreteStackBlock;
                  v59[1] = 3221225472LL;
                  v59[2] = sub_100006B50;
                  v59[3] = &unk_1000287B8;
                  id v38 = v16;
                  id v60 = v38;
                  -[GEOAPNetEventAggregator _computeDistributionStatsOver:statsResultsBlock:]( self,  "_computeDistributionStatsOver:statsResultsBlock:",  v37,  v59);
                  double v39 = (void *)objc_claimAutoreleasedReturnValue([v15 objectForKeyedSubscript:@"tx"]);
                  v57[0] = _NSConcreteStackBlock;
                  v57[1] = 3221225472LL;
                  v57[2] = sub_100006D04;
                  v57[3] = &unk_1000287B8;
                  id v40 = v38;
                  id v58 = v40;
                  -[GEOAPNetEventAggregator _computeDistributionStatsOver:statsResultsBlock:]( self,  "_computeDistributionStatsOver:statsResultsBlock:",  v39,  v57);
                  __int128 v41 = (void *)objc_claimAutoreleasedReturnValue([v15 objectForKeyedSubscript:@"rx"]);
                  v55[0] = _NSConcreteStackBlock;
                  v55[1] = 3221225472LL;
                  v55[2] = sub_100006EB8;
                  v55[3] = &unk_1000287B8;
                  id v56 = v40;
                  id v42 = v40;
                  -[GEOAPNetEventAggregator _computeDistributionStatsOver:statsResultsBlock:]( self,  "_computeDistributionStatsOver:statsResultsBlock:",  v41,  v55);
                  -[NSMutableArray addObject:](v52, "addObject:", v42);
                }

                id v53 = [obj countByEnumeratingWithState:&v61 objects:v71 count:16];
              }

              while (v53);
            }

            +[GEOAPPortal captureNetEventSummaryWithGroups:additionalStates:providedDropRate:completionQueue:completionBlock:]( &OBJC_CLASS___GEOAPPortal,  "captureNetEventSummaryWithGroups:additionalStates:providedDropRate:completionQueue:completionBlock:",  v52,  0LL,  0LL,  0LL,  0LL);
            uint64_t v12 = v50 + 1;
            v11 = v48;
          }

          while ((id)(v50 + 1) != v49);
          id v49 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v48,  "countByEnumeratingWithState:objects:count:",  &v65,  v72,  16LL);
        }

        while (v49);
      }

      v9 = v45;
      id v4 = v46;
    }

    else
    {
      id v44 = sub_100005E94();
      v11 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(v44);
      if (os_log_type_enabled((os_log_t)v11, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v11,  OS_LOG_TYPE_ERROR,  "unable to initialize data",  buf,  2u);
      }
    }
  }
}

- (void)runAggregation
{
  id v3 = sub_100005E94();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "starting aggregation", buf, 2u);
  }

  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[GEOReferenceTimeManager sharedManager](&OBJC_CLASS___GEOReferenceTimeManager, "sharedManager"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_100007168;
  v8[3] = &unk_1000287E0;
  v8[4] = self;
  [v5 referenceTimeResult:v8];

  id v6 = sub_100005E94();
  v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "finished aggregation", buf, 2u);
  }
}

@end
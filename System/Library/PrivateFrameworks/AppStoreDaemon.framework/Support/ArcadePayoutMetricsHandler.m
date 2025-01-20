@interface ArcadePayoutMetricsHandler
- (BOOL)isCandidateAppMetadata:(id)a3;
- (BOOL)isCandidateAppProxy:(id)a3 isMetadataLookup:(BOOL)a4;
- (BOOL)shouldCollectMetrics;
- (id)_activeAccountIDForAppEvent:(id)a3 withAccountEvents:(id)a4;
- (id)_qualifiedEventsForWeekStartingWithDate:(id)a3;
- (id)logKey;
- (int64_t)appUsageType;
- (void)recordLaunches:(id)a3;
@end

@implementation ArcadePayoutMetricsHandler

- (int64_t)appUsageType
{
  return 4LL;
}

- (BOOL)isCandidateAppMetadata:(id)a3
{
  if (a3) {
    return sub_1002C8BF4(a3);
  }
  else {
    return 0;
  }
}

- (BOOL)isCandidateAppProxy:(id)a3 isMetadataLookup:(BOOL)a4
{
  id v4 = a3;
  BOOL v5 = [v4 isInstalled] && (objc_msgSend(v4, "isArcade") & 1) != 0;

  return v5;
}

- (id)logKey
{
  logKey = self->_logKey;
  if (!logKey)
  {
    id v4 = self->super._baseLogKey;
    BOOL v5 = (_TtC9appstored6LogKey *)objc_claimAutoreleasedReturnValue(-[LogKey prependingCategory:](v4, "prependingCategory:", @"ArcadePayout"));
    v6 = self->_logKey;
    self->_logKey = v5;

    logKey = self->_logKey;
  }

  return logKey;
}

- (void)recordLaunches:(id)a3
{
  id v4 = a3;
  id v5 = sub_100255630((uint64_t)&OBJC_CLASS___URLBag);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  id v115 = sub_10025730C((uint64_t)v6, @"ocelot-payout-qualifying-duration-seconds", (void *)0x3C, 0);

  id v7 = sub_10019DC98((uint64_t)&OBJC_CLASS___AccountEventCoordinator);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  sub_10019E52C((uint64_t)v8);
  v106 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  v108 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  v107 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  __int128 v134 = 0u;
  __int128 v135 = 0u;
  __int128 v136 = 0u;
  __int128 v137 = 0u;
  id obj = v4;
  id v10 = [obj countByEnumeratingWithState:&v134 objects:v148 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v119 = *(void *)v135;
    v109 = v9;
    v104 = v8;
    v105 = self;
    do
    {
      id v12 = 0LL;
      id v112 = v11;
      do
      {
        if (*(void *)v135 != v119) {
          objc_enumerationMutation(obj);
        }
        uint64_t v122 = *(void *)(*((void *)&v134 + 1) + 8LL * (void)v12);
        if (self) {
          currentApps = self->super._currentApps;
        }
        else {
          currentApps = 0LL;
        }
        v14 = currentApps;
        v120 = (char *)v12;
        v15 = (void *)v122;
        if (v122) {
          v15 = *(void **)(v122 + 40);
        }
        id v16 = v15;
        v17 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](v14, "objectForKeyedSubscript:", v16));

        v121 = v17;
        if (-[ArcadePayoutMetricsHandler isCandidateAppMetadata:](self, "isCandidateAppMetadata:", v17))
        {
          v18 = v120;
          if (v122)
          {
            v31 = *(void **)(v122 + 16);
          }

          else
          {
            if ((uint64_t)v115 > 0)
            {
LABEL_13:
              uint64_t v19 = ASDLogHandleForCategory(3LL);
              v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
              if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
              {
                v21 = v20;
                v22 = (void *)objc_claimAutoreleasedReturnValue(-[ArcadePayoutMetricsHandler logKey](self, "logKey"));
                if (v122)
                {
                  id v23 = *(id *)(v122 + 40);
                  uint64_t v24 = *(void *)(v122 + 144);
                  v25 = v23;
                }

                else
                {
                  id v23 = 0LL;
                  v25 = 0LL;
                  uint64_t v24 = 0LL;
                }

                *(_DWORD *)buf = 138412802;
                v139 = v22;
                __int16 v140 = 2114;
                id v141 = v23;
                __int16 v142 = 2048;
                uint64_t v143 = v24;
                _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_INFO,  "[%@] [%{public}@] Skipping too short app duration: %lld",  buf,  0x20u);

                v20 = v21;
              }

              goto LABEL_80;
            }

            v31 = 0LL;
          }

          id v32 = v31;
          id v33 = sub_10019DEC4((uint64_t)&OBJC_CLASS___AccountEventCoordinator, v32);
          v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);

          v118 = v20;
          if (v20)
          {
            os_log_t log = (os_log_t)sub_1001AAC98(objc_alloc(&OBJC_CLASS___AppEvent), v17);
            -[os_log_s setValue:forProperty:](log, "setValue:forProperty:", &off_10040C820, @"event_type");
            v34 = sub_10019DF9C(v8, v20);
            v113 = (void *)objc_claimAutoreleasedReturnValue(v34);
            v111 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:v20]);
            if (!v111)
            {
              v35 = objc_opt_new(&OBJC_CLASS___NSMutableSet);
              __int128 v130 = 0u;
              __int128 v131 = 0u;
              __int128 v132 = 0u;
              __int128 v133 = 0u;
              id v36 = v113;
              id v37 = [v36 countByEnumeratingWithState:&v130 objects:v147 count:16];
              if (v37)
              {
                id v39 = v37;
                uint64_t v40 = *(void *)v131;
                do
                {
                  for (i = 0LL; i != v39; i = (char *)i + 1)
                  {
                    if (*(void *)v131 != v40) {
                      objc_enumerationMutation(v36);
                    }
                    id Property = *(id *)(*((void *)&v130 + 1) + 8LL * (void)i);
                    if (Property) {
                      id Property = objc_getProperty(Property, v38, 8LL, 1);
                    }
                    id v43 = Property;
                    id v44 = sub_1001A4800(v43);
                    v45 = (void *)objc_claimAutoreleasedReturnValue(v44);
                    -[NSMutableSet addObject:](v35, "addObject:", v45);
                  }

                  id v39 = [v36 countByEnumeratingWithState:&v130 objects:v147 count:16];
                }

                while (v39);
              }

              v46 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  -[NSMutableSet count](v35, "count")));
              v9 = v109;
              [v109 setObject:v46 forKeyedSubscript:v118];

              uint64_t v47 = ASDLogHandleForCategory(3LL);
              v48 = (os_log_s *)objc_claimAutoreleasedReturnValue(v47);
              if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
              {
                v49 = (void *)objc_claimAutoreleasedReturnValue(-[ArcadePayoutMetricsHandler logKey](self, "logKey"));
                id v50 = sub_1001E84AC(v118);
                v51 = (void *)objc_claimAutoreleasedReturnValue(v50);
                v52 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableSet allObjects](v35, "allObjects"));
                v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "componentsJoinedByString:", @", "));
                *(_DWORD *)buf = 138412802;
                v139 = v49;
                __int16 v140 = 2114;
                id v141 = v51;
                __int16 v142 = 2114;
                uint64_t v143 = (uint64_t)v53;
                _os_log_impl( (void *)&_mh_execute_header,  v48,  OS_LOG_TYPE_DEFAULT,  "[%@] Accounts for week: %{public}@ are: [%{public}@]",  buf,  0x20u);

                v9 = v109;
              }

              v18 = v120;
              v20 = v118;
            }

            v54 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:v20]);
            v55 = sub_10019DF9C(v8, v20);
            v56 = v20;
            v57 = (void *)objc_claimAutoreleasedReturnValue(v55);
            uint64_t v58 = objc_claimAutoreleasedReturnValue( -[ArcadePayoutMetricsHandler _activeAccountIDForAppEvent:withAccountEvents:]( self,  "_activeAccountIDForAppEvent:withAccountEvents:",  v122,  v57));

            v114 = (void *)v58;
            if (v58)
            {
              v59 = (NSMutableArray *)objc_claimAutoreleasedReturnValue([v107 objectForKeyedSubscript:v56]);
              if (!v59)
              {
                v59 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
                [v107 setObject:v59 forKeyedSubscript:v56];
              }

              v60 = (void *)v122;
              v110 = v54;
              if (v122) {
                v60 = *(void **)(v122 + 40);
              }
              id v61 = v60;
              v62 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@:%@",  v61,  v114));

              v20 = v118;
              id v63 = (id)objc_claimAutoreleasedReturnValue([v108 objectForKeyedSubscript:v118]);
              if (!v63)
              {
                v64 = (void *)objc_claimAutoreleasedReturnValue( -[ArcadePayoutMetricsHandler _qualifiedEventsForWeekStartingWithDate:]( self,  "_qualifiedEventsForWeekStartingWithDate:",  v118));
                [v108 setObject:v64 forKeyedSubscript:v118];
                __int128 v128 = 0u;
                __int128 v129 = 0u;
                __int128 v126 = 0u;
                __int128 v127 = 0u;
                id v63 = v64;
                id v65 = [v63 countByEnumeratingWithState:&v126 objects:v146 count:16];
                if (v65)
                {
                  id v66 = v65;
                  uint64_t v67 = *(void *)v127;
                  do
                  {
                    for (j = 0LL; j != v66; j = (char *)j + 1)
                    {
                      if (*(void *)v127 != v67) {
                        objc_enumerationMutation(v63);
                      }
                      v69 = *(void **)(*((void *)&v126 + 1) + 8LL * (void)j);
                      id v70 = sub_1001ABC24(v69);
                      v71 = (void *)objc_claimAutoreleasedReturnValue(v70);
                      id v72 = sub_1001AB610(v69);
                      v73 = (void *)objc_claimAutoreleasedReturnValue(v72);
                      v74 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@:%@",  v71,  v73));
                    }

                    id v66 = [v63 countByEnumeratingWithState:&v126 objects:v146 count:16];
                  }

                  while (v66);
                }

                if ([v63 count])
                {
                  uint64_t v75 = ASDLogHandleForCategory(3LL);
                  v76 = (os_log_s *)objc_claimAutoreleasedReturnValue(v75);
                  v8 = v104;
                  self = v105;
                  v18 = v120;
                  if (os_log_type_enabled(v76, OS_LOG_TYPE_DEFAULT))
                  {
                    v77 = (void *)objc_claimAutoreleasedReturnValue(-[ArcadePayoutMetricsHandler logKey](v105, "logKey"));
                    v78 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableArray componentsJoinedByString:]( v59,  "componentsJoinedByString:",  @", "));
                    *(_DWORD *)buf = 138412546;
                    v139 = v77;
                    __int16 v140 = 2114;
                    id v141 = v78;
                    _os_log_impl( (void *)&_mh_execute_header,  v76,  OS_LOG_TYPE_DEFAULT,  "[%@] Qualified for week are now: [%{public}@]",  buf,  0x16u);
                  }
                }

                else
                {
                  v8 = v104;
                  self = v105;
                  v18 = v120;
                }

                v20 = v118;
              }

              if (-[NSMutableArray containsObject:](v59, "containsObject:", v62))
              {
                uint64_t v92 = ASDLogHandleForCategory(3LL);
                v93 = (os_log_s *)objc_claimAutoreleasedReturnValue(v92);
                if (os_log_type_enabled(v93, OS_LOG_TYPE_DEFAULT))
                {
                  v94 = (void *)objc_claimAutoreleasedReturnValue(-[ArcadePayoutMetricsHandler logKey](self, "logKey"));
                  v95 = (void *)v122;
                  if (v122) {
                    v95 = *(void **)(v122 + 40);
                  }
                  id v96 = v95;
                  *(_DWORD *)buf = 138412802;
                  v139 = v94;
                  __int16 v140 = 2114;
                  id v141 = v96;
                  __int16 v142 = 2114;
                  uint64_t v143 = (uint64_t)v62;
                  _os_log_impl( (void *)&_mh_execute_header,  v93,  OS_LOG_TYPE_DEFAULT,  "[%@] Skipping event with bundleID: %{public}@. We have already have a qualifying event this week wit h eventKey: %{public}@",  buf,  0x20u);

                  v20 = v118;
                }
              }

              else
              {
                if (v110) {
                  -[os_log_s setValue:forProperty:](log, "setValue:forProperty:", v110, @"cumulative_user_count");
                }
                -[os_log_s setValue:forProperty:](log, "setValue:forProperty:", v20, @"week_start_time");
                v97 = (void *)objc_claimAutoreleasedReturnValue([v114 stringValue]);
                -[os_log_s setValue:forProperty:](log, "setValue:forProperty:", v97, @"account_id");

                -[NSMutableArray addObject:](v59, "addObject:", v62);
                [v106 addObject:log];
                uint64_t v98 = ASDLogHandleForCategory(3LL);
                v93 = (os_log_s *)objc_claimAutoreleasedReturnValue(v98);
                if (os_log_type_enabled(v93, OS_LOG_TYPE_DEFAULT))
                {
                  v99 = (void *)objc_claimAutoreleasedReturnValue(-[ArcadePayoutMetricsHandler logKey](self, "logKey"));
                  -[os_log_s timeIntervalSince1970](v20, "timeIntervalSince1970");
                  *(_DWORD *)buf = 138413058;
                  v139 = v99;
                  __int16 v140 = 2114;
                  id v141 = v62;
                  __int16 v142 = 2114;
                  uint64_t v143 = (uint64_t)v110;
                  __int16 v144 = 2048;
                  uint64_t v145 = (uint64_t)v100;
                  _os_log_impl( (void *)&_mh_execute_header,  v93,  OS_LOG_TYPE_DEFAULT,  "[%@] Added payout event with eventKey: %{public}@ cumulativeAccountCount: %{public}@ weekStart: %{time_t}ld ",  buf,  0x2Au);
                }
              }

              v9 = v109;
              v54 = v110;
            }

            else
            {
              uint64_t v83 = ASDLogHandleForCategory(3LL);
              v59 = (NSMutableArray *)objc_claimAutoreleasedReturnValue(v83);
              if (os_log_type_enabled((os_log_t)v59, OS_LOG_TYPE_DEFAULT))
              {
                v84 = v54;
                v85 = (void *)objc_claimAutoreleasedReturnValue(-[ArcadePayoutMetricsHandler logKey](self, "logKey"));
                v20 = v118;
                if (v122)
                {
                  id v86 = *(id *)(v122 + 40);
                  id v87 = *(id *)(v122 + 16);
                  v88 = v87;
                  if (v87)
                  {
                    [v87 timeIntervalSince1970];
                    uint64_t v90 = (uint64_t)v89;
                  }

                  else
                  {
                    uint64_t v90 = 0LL;
                  }

                  id v91 = v86;
                }

                else
                {
                  v88 = 0LL;
                  id v86 = 0LL;
                  id v91 = 0LL;
                  uint64_t v90 = 0LL;
                }

                *(_DWORD *)buf = 138412802;
                v139 = v85;
                __int16 v140 = 2114;
                id v141 = v91;
                __int16 v142 = 2048;
                uint64_t v143 = v90;
                _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v59,  OS_LOG_TYPE_DEFAULT,  "[%@] Skipping app launch event with bundleID: %{public}@ due to no active account at launch time ending: %{time_t}ld",  buf,  0x20u);

                v9 = v109;
                v54 = v84;
              }

              else
              {
                v20 = v118;
              }
            }

            id v11 = v112;
          }

          else
          {
            uint64_t v79 = ASDLogHandleForCategory(3LL);
            os_log_t log = (os_log_t)objc_claimAutoreleasedReturnValue(v79);
            id v11 = v112;
            if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
            {
              v80 = (void *)objc_claimAutoreleasedReturnValue(-[ArcadePayoutMetricsHandler logKey](self, "logKey"));
              v81 = (void *)v122;
              if (v122) {
                v81 = *(void **)(v122 + 40);
              }
              id v82 = v81;
              *(_DWORD *)buf = 138412546;
              v139 = v80;
              __int16 v140 = 2112;
              id v141 = v82;
              _os_log_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_DEFAULT,  "[%@] [%@] Could not find the week start date",  buf,  0x16u);

              id v11 = v112;
              v20 = 0LL;
            }
          }
        }

        else
        {
          uint64_t v26 = ASDLogHandleForCategory(3LL);
          v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
          v18 = v120;
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
          {
            v27 = v20;
            v28 = (void *)objc_claimAutoreleasedReturnValue(-[ArcadePayoutMetricsHandler logKey](self, "logKey"));
            v29 = (void *)v122;
            if (v122) {
              v29 = *(void **)(v122 + 40);
            }
            id v30 = v29;
            *(_DWORD *)buf = 138412546;
            v139 = v28;
            __int16 v140 = 2114;
            id v141 = v30;
            _os_log_debug_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_DEBUG,  "[%@] [%{public}@] Skipping non arcade launch event",  buf,  0x16u);

            v20 = v27;
            id v11 = v112;
          }
        }

- (BOOL)shouldCollectMetrics
{
  id v2 = sub_1002EB2A0((uint64_t)&OBJC_CLASS___Device);
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  if ([v3 isHRNMode])
  {
    unsigned __int8 v4 = 0;
  }

  else
  {
    id v5 = sub_100255630((uint64_t)&OBJC_CLASS___URLBag);
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    id v7 = v6;
    if (v6) {
      unsigned __int8 v4 = sub_100256DD0(v6, @"arcade-payout-enabled", (void *)1, 1);
    }
    else {
      unsigned __int8 v4 = 0;
    }
  }

  return v4;
}

- (id)_activeAccountIDForAppEvent:(id)a3 withAccountEvents:(id)a4
{
  v6 = a3;
  id v7 = a4;
  if (v7)
  {
    if (v6) {
      v8 = (void *)v6[3];
    }
    else {
      v8 = 0LL;
    }
    id v9 = v8;
    [v9 timeIntervalSinceReferenceDate];
    double v11 = v10;

    if (v6) {
      id v12 = (void *)v6[2];
    }
    else {
      id v12 = 0LL;
    }
    id v13 = v12;
    [v13 timeIntervalSinceReferenceDate];
    double v15 = v14;

    __int128 v39 = 0u;
    __int128 v40 = 0u;
    __int128 v37 = 0u;
    __int128 v38 = 0u;
    id v16 = v7;
    id v18 = [v16 countByEnumeratingWithState:&v37 objects:v47 count:16];
    if (v18)
    {
      uint64_t v19 = *(void *)v38;
      BOOL v20 = v15 < 0.0 && v11 > 0.0;
      while (2)
      {
        v21 = 0LL;
        do
        {
          if (*(void *)v38 != v19) {
            objc_enumerationMutation(v16);
          }
          v22 = *(double **)(*((void *)&v37 + 1) + 8LL * (void)v21);
          if (v22)
          {
            if (v11 > v22[2] && v15 < v22[3])
            {
              id Property = objc_getProperty(v22, v17, 8LL, 1);
LABEL_25:
              id v25 = Property;
              id v26 = sub_1001A4800(v25);
              id v18 = (id)objc_claimAutoreleasedReturnValue(v26);

              if (-[ArcadePayoutMetricsHandler appUsageType](self, "appUsageType", (void)v37))
              {
                uint64_t v27 = ASDLogHandleForCategory(3LL);
                v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
                if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
                {
                  v29 = (void *)objc_claimAutoreleasedReturnValue(-[ArcadePayoutMetricsHandler logKey](self, "logKey"));
                  if (v6) {
                    id v30 = (void *)v6[5];
                  }
                  else {
                    id v30 = 0LL;
                  }
                  id v31 = v30;
                  *(_DWORD *)buf = 138412802;
                  v42 = v29;
                  __int16 v43 = 2114;
                  id v44 = v31;
                  __int16 v45 = 2114;
                  id v46 = v18;
                  _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_INFO,  "[%@] [%{public}@] Found app launch accountID: %{public}@",  buf,  0x20u);
                }
              }

              goto LABEL_31;
            }
          }

          else if (v20)
          {
            id Property = 0LL;
            goto LABEL_25;
          }

          v21 = (char *)v21 + 1;
        }

        while (v18 != v21);
        id v23 = [v16 countByEnumeratingWithState:&v37 objects:v47 count:16];
        id v18 = v23;
        if (v23) {
          continue;
        }
        break;
      }
    }
  }

  else
  {
    uint64_t v24 = ASDLogHandleForCategory(3LL);
    id v16 = (id)objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled((os_log_t)v16, OS_LOG_TYPE_ERROR))
    {
      id v33 = (void *)objc_claimAutoreleasedReturnValue(-[ArcadePayoutMetricsHandler logKey](self, "logKey"));
      if (v6) {
        v34 = (void *)v6[5];
      }
      else {
        v34 = 0LL;
      }
      id v35 = v34;
      *(_DWORD *)buf = 138412546;
      v42 = v33;
      __int16 v43 = 2114;
      id v44 = v35;
      _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)v16,  OS_LOG_TYPE_ERROR,  "[%@] [%{public}@] Unable to find launch account for event due to no active accounts",  buf,  0x16u);
    }

    id v18 = 0LL;
  }

- (id)_qualifiedEventsForWeekStartingWithDate:(id)a3
{
  id v4 = a3;
  id v5 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  [v4 timeIntervalSinceReferenceDate];
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
  uint64_t v7 = ASDLogHandleForCategory(3LL);
  v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[ArcadePayoutMetricsHandler logKey](self, "logKey"));
    id v10 = sub_1001E84AC(v4);
    double v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    *(_DWORD *)buf = 138412546;
    uint64_t v24 = v9;
    __int16 v25 = 2114;
    id v26 = v11;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "[%@] Looking for qualified in with week: %{public}@",  buf,  0x16u);
  }

  id v12 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"week_start_time",  v6));
  id v13 = sub_1002B61EC((uint64_t)&OBJC_CLASS___AppUsageDatabaseStore);
  double v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_100229EE4;
  v19[3] = &unk_1003ED840;
  id v20 = v12;
  v21 = self;
  v22 = v5;
  double v15 = v5;
  id v16 = v12;
  [v14 readUsingSession:v19];

  id v17 = -[NSMutableArray copy](v15, "copy");
  return v17;
}

- (void).cxx_destruct
{
}

@end
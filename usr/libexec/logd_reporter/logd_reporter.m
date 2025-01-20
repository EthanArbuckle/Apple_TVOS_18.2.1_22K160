id sub_100002A70()
{
  if (qword_10000C780 != -1) {
    dispatch_once(&qword_10000C780, &stru_1000082D0);
  }
  return (id)qword_10000C788;
}

void sub_100002AB0(id a1)
{
  os_log_t v1 = os_log_create("com.apple.logd_reporter", "ReadStatistics");
  v2 = (void *)qword_10000C788;
  qword_10000C788 = (uint64_t)v1;
}

LABEL_21:
  return v8 != 0LL;
}

LABEL_30:
}

id sub_100003690(void *a1, uint64_t a2)
{
  v2 = (void *)objc_claimAutoreleasedReturnValue([a1 objectForKeyedSubscript:a2]);
  if (v2)
  {
    objc_opt_class(&OBJC_CLASS___NSString);
    id v3 = sub_100003768(v2);
    id v4 = (id)objc_claimAutoreleasedReturnValue(v3);

    if (v4) {
      id v4 = v2;
    }
  }

  else
  {
    id v4 = 0LL;
  }

  return v4;
}

id sub_1000036FC(void *a1, uint64_t a2)
{
  v2 = (void *)objc_claimAutoreleasedReturnValue([a1 objectForKeyedSubscript:a2]);
  if (v2)
  {
    objc_opt_class(&OBJC_CLASS___NSNumber);
    id v3 = sub_100003768(v2);
    id v4 = (id)objc_claimAutoreleasedReturnValue(v3);

    if (v4) {
      id v4 = v2;
    }
  }

  else
  {
    id v4 = 0LL;
  }

  return v4;
}

id sub_100003768(void *a1)
{
  id v1 = a1;
  if ((objc_opt_isKindOfClass() & 1) != 0) {
    id v2 = v1;
  }
  else {
    id v2 = 0LL;
  }

  return v2;
}

void start()
{
}

size_t sub_1000037E0()
{
  if (!_set_user_dir_suffix("com.apple.logd_reporter") || (size_t result = confstr(65537, v5, 0x400uLL)) == 0)
  {
    id v1 = sub_100004A48();
    id v2 = (os_log_s *)objc_claimAutoreleasedReturnValue(v1);
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      int v3 = *__error();
      v4[0] = 67109120;
      v4[1] = v3;
      _os_log_error_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_ERROR,  "failed to initialize temporary directory: %{darwin.errno}d",  (uint8_t *)v4,  8u);
    }

    exit(1);
  }

  return result;
}

void sub_1000038BC(id a1, OS_xpc_object *a2)
{
  id v2 = a2;
  int v3 = (void *)os_transaction_create("com.apple.logd_reporter");
  xpc_activity_state_t state = xpc_activity_get_state(v2);
  if (state != 2)
  {
    xpc_activity_state_t v5 = state;
    if (state)
    {
      id v16 = sub_100004A48();
      v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(buf[0]) = 134217984;
        *(void *)((char *)buf + 4) = v5;
        v8 = "Encountered unexpected activity state: %ld";
        v9 = v7;
        uint32_t v10 = 12;
        goto LABEL_14;
      }
    }

    else
    {
      id v6 = sub_100004A48();
      v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf[0]) = 0;
        v8 = "Checking in for: com.apple.logd_reporter.report_statistics";
LABEL_5:
        v9 = v7;
        uint32_t v10 = 2;
LABEL_14:
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)buf, v10);
        goto LABEL_86;
      }
    }

    goto LABEL_86;
  }

  id v11 = sub_100004A48();
  v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Activity eligible to run", (uint8_t *)buf, 2u);
  }

  v13 = v2;
  if (!xpc_activity_should_defer(v13))
  {

LABEL_16:
    id v17 = sub_100004A48();
    v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "Statistics report requested",  (uint8_t *)buf,  2u);
    }

    id v19 = sub_100004AB8();
    v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
    if (os_signpost_enabled(v20))
    {
      LOWORD(buf[0]) = 0;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v20,  OS_SIGNPOST_INTERVAL_BEGIN,  0xEEEEB0B5B2B2EEEELL,  "ReportingStatisticsDirectory",  "Reporting from statistics directory",  (uint8_t *)buf,  2u);
    }

    time_t v21 = time(0LL);
    v22 = -[StatisticsParser initWithUnixTimeBoundFrom:to:]( objc_alloc(&OBJC_CLASS___StatisticsParser),  "initWithUnixTimeBoundFrom:to:",  v21 - 86400,  v21);
    v167 = (char *)0xAAAAAAAAAAAAAAAALL;
    v168 = (char *)0xAAAAAAAAAAAAAAAALL;
    v23 = (const char *)_os_trace_persistdir_path();
    asprintf(&v168, "%s/%s", v23, "logdata.statistics.0.jsonl");
    int v24 = *__error();
    v25 = (const char *)_os_trace_persistdir_path();
    asprintf(&v167, "%s/%s", v25, "logdata.statistics.1.jsonl");
    int v26 = *__error();
    if (v168 && v167)
    {
      v148 = v3;
      v149 = v2;
      sub_100004B28((uint64_t)v167, v22);
      sub_100004B28((uint64_t)v168, v22);
      v156 = v22;
      for (uint64_t i = 0LL; i != 5; ++i)
      {
        v28 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
        v29 = (void *)objc_claimAutoreleasedReturnValue(-[StatisticsParser topEmitters](v156, "topEmitters"));
        v30 = (void *)objc_claimAutoreleasedReturnValue([v29 objectAtIndexedSubscript:i]);

        v31 = (void *)objc_claimAutoreleasedReturnValue(-[StatisticsParser totalBytes](v156, "totalBytes"));
        v32 = (void *)objc_claimAutoreleasedReturnValue([v31 objectAtIndexedSubscript:i]);

        unint64_t v33 = (unint64_t)[v32 unsignedLongLongValue];
        v173 = @"elapsedSeconds";
        unint64_t v34 = v33 / 0x15180;
        v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLong:](&OBJC_CLASS___NSNumber, "numberWithLong:", 86400LL));
        v176 = v35;
        uint64_t v177 = (uint64_t)v32;
        v158 = v32;
        v174 = @"totalPayloadBytes";
        v175 = @"bytesPerSecond";
        v36 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  v34));
        v178 = v36;
        v37 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v176,  &v173,  3LL));
        v160 = v28;
        -[NSMutableDictionary addEntriesFromDictionary:](v28, "addEntriesFromDictionary:", v37);

        v38 = (void *)objc_claimAutoreleasedReturnValue([v30 keysSortedByValueUsingComparator:&stru_1000083B0]);
        __int128 v180 = 0u;
        __int128 v181 = 0u;
        __int128 v182 = 0u;
        __int128 v183 = 0u;
        id obj = v38;
        id v39 = [v38 countByEnumeratingWithState:&v180 objects:buf count:16];
        if (v39)
        {
          id v40 = v39;
          uint64_t v41 = 0LL;
          uint64_t v42 = *(void *)v181;
LABEL_25:
          uint64_t v43 = 0LL;
          while (1)
          {
            if (*(void *)v181 != v42) {
              objc_enumerationMutation(obj);
            }
            uint64_t v44 = *(void *)(*((void *)&v180 + 1) + 8 * v43);
            v171[0] = @"book";
            v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLong:", i));
            v172[0] = v45;
            v172[1] = v44;
            v171[1] = @"ProcessName";
            v171[2] = @"PayloadBytes";
            v46 = (void *)objc_claimAutoreleasedReturnValue([v30 objectForKeyedSubscript:v44]);
            v172[2] = v46;
            v47 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v172,  v171,  3LL));
            AnalyticsSendEvent(@"com.apple.logd.statistics.process", v47);

            if (v41 + v43 == 29) {
              break;
            }
            if (v40 == (id)++v43)
            {
              v41 += v43;
              id v40 = [obj countByEnumeratingWithState:&v180 objects:buf count:16];
              if (v40) {
                goto LABEL_25;
              }
              break;
            }
          }
        }

        v169 = @"book";
        v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLong:", i));
        v170 = v48;
        v49 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v170,  &v169,  1LL));
        -[NSMutableDictionary addEntriesFromDictionary:](v160, "addEntriesFromDictionary:", v49);

        AnalyticsSendEvent(@"com.apple.logd.statistics", v160);
      }

      v50 = v156;
      v51 = (void *)objc_claimAutoreleasedReturnValue(-[StatisticsParser snapshotClients](v50, "snapshotClients"));
      v52 = (void *)objc_claimAutoreleasedReturnValue([v51 keysSortedByValueUsingComparator:&stru_1000083D0]);

      __int128 v182 = 0u;
      __int128 v183 = 0u;
      __int128 v180 = 0u;
      __int128 v181 = 0u;
      id v53 = v52;
      id v54 = [v53 countByEnumeratingWithState:&v180 objects:buf count:16];
      if (v54)
      {
        id v55 = v54;
        uint64_t v56 = 0LL;
        uint64_t v57 = *(void *)v181;
LABEL_34:
        uint64_t v58 = 0LL;
        while (1)
        {
          if (*(void *)v181 != v57) {
            objc_enumerationMutation(v53);
          }
          v176 = *(void **)(*((void *)&v180 + 1) + 8 * v58);
          v59 = v176;
          v173 = @"snapshotClientName";
          v174 = @"snapshotCount";
          v60 = (void *)objc_claimAutoreleasedReturnValue(-[StatisticsParser snapshotClients](v50, "snapshotClients"));
          v61 = (void *)objc_claimAutoreleasedReturnValue([v60 objectForKeyedSubscript:v59]);
          uint64_t v177 = (uint64_t)v61;
          v62 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v176,  &v173,  2LL));
          AnalyticsSendEvent(@"com.apple.logd.statistics.snapshots", v62);

          if (v56 + v58 == 4) {
            break;
          }
          if (v55 == (id)++v58)
          {
            v56 += v58;
            id v55 = [v53 countByEnumeratingWithState:&v180 objects:buf count:16];
            if (v55) {
              goto LABEL_34;
            }
            break;
          }
        }
      }

      v7 = v50;
      __int128 v180 = 0u;
      __int128 v181 = 0u;
      __int128 v182 = 0u;
      __int128 v183 = 0u;
      v63 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s quarantinedClients](v7, "quarantinedClients"));
      v64 = (void *)objc_claimAutoreleasedReturnValue([v63 allKeys]);

      id obja = v64;
      id v65 = [v64 countByEnumeratingWithState:&v180 objects:buf count:16];
      if (v65)
      {
        id v66 = v65;
        uint64_t v67 = *(void *)v181;
        do
        {
          for (j = 0LL; j != v66; j = (char *)j + 1)
          {
            if (*(void *)v181 != v67) {
              objc_enumerationMutation(obja);
            }
            v69 = *(void **)(*((void *)&v180 + 1) + 8LL * (void)j);
            v70 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
            v71 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s quarantinedClients](v7, "quarantinedClients"));
            v72 = (void *)objc_claimAutoreleasedReturnValue([v71 objectForKeyedSubscript:v69]);
            v73 = (void *)objc_claimAutoreleasedReturnValue([v72 objectForKeyedSubscript:@"quarantineCount"]);

            v173 = @"ProcessName";
            v174 = @"quarantineCount";
            v176 = v69;
            uint64_t v177 = (uint64_t)v73;
            v74 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v176,  &v173,  2LL));
            -[NSMutableDictionary addEntriesFromDictionary:](v70, "addEntriesFromDictionary:", v74);

            AnalyticsSendEvent(@"com.apple.logd.statistics.quarantines", v70);
          }

          id v66 = [obja countByEnumeratingWithState:&v180 objects:buf count:16];
        }

        while (v66);
      }

      int v3 = v148;
      id v2 = v149;
      if (_os_trace_is_development_build() && &_DRSubmitLog)
      {
        v75 = v7;
        if (_os_feature_enabled_impl("Libtrace", "logd_reporter_quarantine_reports"))
        {
          v76 = sub_100004DF0();
          v150 = (void *)objc_claimAutoreleasedReturnValue(v76);
          if (v150)
          {
            v144 = v7;
            __int128 v182 = 0u;
            __int128 v183 = 0u;
            __int128 v180 = 0u;
            __int128 v181 = 0u;
            v77 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s quarantinedClients](v75, "quarantinedClients"));
            v78 = (void *)objc_claimAutoreleasedReturnValue([v77 allKeys]);

            id v153 = v78;
            id v161 = [v78 countByEnumeratingWithState:&v180 objects:buf count:16];
            if (v161)
            {
              uint64_t v146 = 0LL;
              uint64_t v159 = *(void *)v181;
              v151 = v75;
              do
              {
                v79 = 0LL;
                v147 = (void *)(4 - v146);
                v146 += (uint64_t)v161;
                do
                {
                  if (*(void *)v181 != v159) {
                    objc_enumerationMutation(v153);
                  }
                  uint64_t v80 = *(void *)(*((void *)&v180 + 1) + 8LL * (void)v79);
                  id objb = objc_autoreleasePoolPush();
                  v81 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s quarantinedClients](v75, "quarantinedClients"));
                  v82 = (void *)objc_claimAutoreleasedReturnValue([v81 objectForKeyedSubscript:v80]);
                  id v83 = [v82 mutableCopy];

                  v84 = (__CFString *)objc_claimAutoreleasedReturnValue([v83 objectForKeyedSubscript:@"fileName"]);
                  uint64_t v85 = objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"process == %@",  v80));
                  v86 = objc_alloc(&OBJC_CLASS___NSDateInterval);
                  v87 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate distantPast](&OBJC_CLASS___NSDate, "distantPast"));
                  v88 = (void *)v85;
                  v89 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
                  v90 = -[NSDateInterval initWithStartDate:endDate:](v86, "initWithStartDate:endDate:", v87, v89);

                  v173 = v84;
                  v91 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  &v173,  1LL));
                  v92 = sub_100004F04(v91, v88, v90);
                  v93 = (void *)objc_claimAutoreleasedReturnValue(v92);

                  if (v93 && [v93 eventCount])
                  {
                    v157 = v88;
                    v94 = (void *)objc_claimAutoreleasedReturnValue(-[NSDateInterval endDate](v90, "endDate"));
                    id v95 = sub_100005170(v94);
                    uint64_t v96 = objc_claimAutoreleasedReturnValue(v95);

                    v154 = (void *)objc_claimAutoreleasedReturnValue([v93 aggregationsForTier:5]);
                    v97 = (void *)objc_claimAutoreleasedReturnValue([v154 sortedArrayUsingComparator:&stru_100008410]);
                    v98 = (void *)objc_claimAutoreleasedReturnValue([v97 firstObject]);
                    v99 = (void *)objc_claimAutoreleasedReturnValue([v98 label]);

                    v155 = (void *)v96;
                    if (v99)
                    {
                      v100 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString pathComponents](v84, "pathComponents"));
                      v101 = (void *)objc_claimAutoreleasedReturnValue([v100 objectAtIndexedSubscript:0]);
                      [v83 setObject:v101 forKey:@"book"];

                      [v83 setObject:v80 forKey:@"process"];
                      [v83 setObject:v99 forKey:@"subsystem"];
                      uint64_t v102 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"quarantine_report_%@_%@.json",  v80,  v96));
                      v176 = v150;
                      uint64_t v177 = v102;
                      v152 = (void *)v102;
                      v103 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  &v176,  2LL));
                      v104 = (void *)objc_claimAutoreleasedReturnValue( +[NSString pathWithComponents:]( &OBJC_CLASS___NSString,  "pathWithComponents:",  v103));

                      if (sub_1000051FC(v93, v104))
                      {
                        v105 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Quarantined %@ with top subsystem %@",  v80,  v99));
                        sub_100005328(@"Quarantine", v105, v83, v104);
                        int v106 = 2 * (v147 == v79);
                      }

                      else
                      {
                        int v106 = 3;
                      }

                      v75 = v151;
                      v107 = objb;
                    }

                    else
                    {
                      int v106 = 3;
                      v75 = v151;
                      v107 = objb;
                    }

                    objc_autoreleasePoolPop(v107);
                    if (v106 != 3 && v106) {
                      goto LABEL_69;
                    }
                  }

                  else
                  {

                    objc_autoreleasePoolPop(objb);
                  }

                  v79 = (char *)v79 + 1;
                }

                while (v161 != v79);
                id v161 = [v153 countByEnumeratingWithState:&v180 objects:buf count:16];
              }

              while (v161);
            }

LABEL_69:
            int v3 = v148;
            id v2 = v149;
            v7 = v144;
          }
        }

        if (_os_feature_enabled_impl("Libtrace", "logd_reporter_sampling_reports"))
        {
          v108 = sub_100004DF0();
          v109 = (void *)objc_claimAutoreleasedReturnValue(v108);
          if (v109)
          {
            v145 = v7;
            v110 = objc_autoreleasePoolPush();
            uint32_t v111 = arc4random_uniform(0x90u);
            v112 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
            v113 = (void *)objc_claimAutoreleasedReturnValue([v112 dateByAddingTimeInterval:(double)(int)(-600 * v111)]);

            v114 = -[NSDateInterval initWithStartDate:duration:]( objc_alloc(&OBJC_CLASS___NSDateInterval),  "initWithStartDate:duration:",  v113,  600.0);
            v115 = sub_100004F04(0LL, 0LL, v114);
            v116 = (void *)objc_claimAutoreleasedReturnValue(v115);
            v117 = (void *)objc_claimAutoreleasedReturnValue(-[NSDateInterval endDate](v114, "endDate"));
            id v118 = sub_100005170(v117);
            v119 = (void *)objc_claimAutoreleasedReturnValue(v118);

            v120 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"logging_sample_%@.json",  v119));
            *(void *)&buf[0] = v109;
            *((void *)&buf[0] + 1) = v120;
            v121 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  buf,  2LL));
            v122 = (void *)objc_claimAutoreleasedReturnValue(+[NSString pathWithComponents:](&OBJC_CLASS___NSString, "pathWithComponents:", v121));

            if (sub_1000051FC(v116, v122))
            {
              id v123 = v116;
              id objc = v116;
              v124 = v114;
              v125 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
              v162 = v120;
              v126 = (void *)objc_claimAutoreleasedReturnValue(-[NSDateInterval startDate](v124, "startDate"));
              id v127 = sub_100005170(v126);
              v128 = (void *)objc_claimAutoreleasedReturnValue(v127);
              [v125 setValue:v128 forKey:@"start_time"];

              v129 = (void *)objc_claimAutoreleasedReturnValue(-[NSDateInterval endDate](v124, "endDate"));
              id v130 = sub_100005170(v129);
              v131 = (void *)objc_claimAutoreleasedReturnValue(v130);
              [v125 setValue:v131 forKey:@"end_time"];

              [v125 setValue:&off_100008A90 forKey:@"interval_size"];
              v132 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( NSNumber,  "numberWithUnsignedLongLong:",  [v123 eventCount]));
              [v125 setValue:v132 forKey:@"total_count"];

              id v133 = [v123 eventBytes];
              v134 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  v133));
              [v125 setValue:v134 forKey:@"total_bytes"];

              id v135 = [v125 copy];
              v136 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Logging sample from %@",  v119));
              sub_100005328(@"LoggingSample", v136, v135, v122);

              v116 = objc;
              v120 = v162;
            }

            objc_autoreleasePoolPop(v110);
            int v3 = v148;
            id v2 = v149;
            v7 = v145;
          }
        }
      }

      id v137 = sub_100004AB8();
      v138 = (os_log_s *)objc_claimAutoreleasedReturnValue(v137);
      if (os_signpost_enabled(v138))
      {
        LOWORD(buf[0]) = 0;
        _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v138,  OS_SIGNPOST_INTERVAL_END,  0xEEEEB0B5B2B2EEEELL,  "ReportingStatisticsDirectory",  "Success!",  (uint8_t *)buf,  2u);
      }

      free(v168);
      free(v167);
    }

    else
    {
      id v139 = sub_100004A48();
      v140 = (os_log_s *)objc_claimAutoreleasedReturnValue(v139);
      if (os_log_type_enabled(v140, OS_LOG_TYPE_ERROR))
      {
        LODWORD(buf[0]) = 67109376;
        DWORD1(buf[0]) = v24;
        WORD4(buf[0]) = 1024;
        *(_DWORD *)((char *)buf + 10) = v26;
        _os_log_error_impl( (void *)&_mh_execute_header,  v140,  OS_LOG_TYPE_ERROR,  "Unable to generate strings for paths to statistics files: %{darwin.errno}d and %{darwin.errno}d",  (uint8_t *)buf,  0xEu);
      }

      free(v168);
      free(v167);
      id v141 = sub_100004AB8();
      v142 = (os_log_s *)objc_claimAutoreleasedReturnValue(v141);
      if (os_signpost_enabled(v142))
      {
        LOWORD(buf[0]) = 0;
        _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v142,  OS_SIGNPOST_INTERVAL_END,  0xEEEEB0B5B2B2EEEELL,  "ReportingStatisticsDirectory",  "Encountered error",  (uint8_t *)buf,  2u);
      }

      id v143 = sub_100004A48();
      v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v143);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        LOWORD(buf[0]) = 0;
        _os_log_error_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_ERROR,  "Statistics report could not be generated",  (uint8_t *)buf,  2u);
      }
    }

    goto LABEL_86;
  }

  BOOL v14 = xpc_activity_set_state(v13, 3LL);

  if (!v14) {
    goto LABEL_16;
  }
  id v15 = sub_100004A48();
  v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    v8 = "Asked to defer immediately";
    goto LABEL_5;
  }

LABEL_86:
  xpc_transaction_exit_clean();
}

id sub_100004A48()
{
  if (qword_10000C790 != -1) {
    dispatch_once(&qword_10000C790, &stru_100008350);
  }
  return (id)qword_10000C798;
}

void sub_100004A88(id a1)
{
  os_log_t v1 = os_log_create("com.apple.logd_reporter", "Main");
  id v2 = (void *)qword_10000C798;
  qword_10000C798 = (uint64_t)v1;
}

id sub_100004AB8()
{
  if (qword_10000C7A0 != -1) {
    dispatch_once(&qword_10000C7A0, &stru_100008370);
  }
  return (id)qword_10000C7A8;
}

void sub_100004AF8(id a1)
{
  os_log_t v1 = os_log_create("com.apple.logd_reporter", "ReportStatistics");
  id v2 = (void *)qword_10000C7A8;
  qword_10000C7A8 = (uint64_t)v1;
}

void sub_100004B28(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = sub_100004AB8();
  xpc_activity_state_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_signpost_enabled(v5))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v27 = a1;
  }

  id v6 = objc_alloc(&OBJC_CLASS___LineReader);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", a1));
  v8 = -[LineReader initWithFile:](v6, "initWithFile:", v7);

  v9 = objc_autoreleasePoolPush();
  uint64_t v10 = objc_claimAutoreleasedReturnValue(-[LineReader nextLine](v8, "nextLine"));
  if (v10)
  {
    v12 = (void *)v10;
    char v13 = 0;
    int v14 = 1;
    *(void *)&__int128 v11 = 136446978LL;
    __int128 v24 = v11;
    do
    {
      id v25 = 0LL;
      unsigned __int8 v15 = objc_msgSend(v3, "feedJSONLine:error:", v12, &v25, v24);
      id v16 = v25;
      if ((v15 & 1) == 0 && (v13 & 1) == 0)
      {
        id v17 = sub_100004AB8();
        v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          id v19 = [v12 UTF8String];
          *(_DWORD *)buf = v24;
          uint64_t v27 = a1;
          __int16 v28 = 1024;
          int v29 = v14;
          __int16 v30 = 2082;
          id v31 = v19;
          __int16 v32 = 2114;
          id v33 = v16;
        }

        char v13 = 1;
      }

      objc_autoreleasePoolPop(v9);
      v9 = objc_autoreleasePoolPush();
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[LineReader nextLine](v8, "nextLine"));
      ++v14;
    }

    while (v12);
    objc_autoreleasePoolPop(v9);
    if ((v13 & 1) != 0)
    {
      id v20 = sub_100004AB8();
      time_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
      if (os_signpost_enabled(v21))
      {
        *(_WORD *)buf = 0;
        v22 = "Encountered error";
LABEL_17:
        _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v21,  OS_SIGNPOST_INTERVAL_END,  0xEEEEB0B5B2B2EEEELL,  "ReportingStatisticsFile",  v22,  buf,  2u);
        goto LABEL_18;
      }

      goto LABEL_18;
    }
  }

  else
  {
    objc_autoreleasePoolPop(v9);
  }

  id v23 = sub_100004AB8();
  time_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
  if (os_signpost_enabled(v21))
  {
    *(_WORD *)buf = 0;
    v22 = "Success!";
    goto LABEL_17;
  }

LABEL_18:
}

CFStringRef sub_100004DF0()
{
  v0 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  id v8 = 0LL;
  os_log_t v1 = @"/private/var/mobile/Library/Logs/com.apple.logd_reporter";
  unsigned __int8 v2 = [v0 createDirectoryAtPath:@"/private/var/mobile/Library/Logs/com.apple.logd_reporter" withIntermediateDirectories:1 attributes:0 error:&v8];
  id v3 = v8;

  if ((v2 & 1) == 0)
  {
    id v4 = sub_100004AB8();
    xpc_activity_state_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue([v3 localizedDescription]);
      *(_DWORD *)buf = 138412290;
      uint64_t v10 = v7;
      _os_log_error_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_ERROR,  "Error initialising output directory for quarantine reports: %@",  buf,  0xCu);
    }

    os_log_t v1 = 0LL;
  }

  return v1;
}

os_log_s *sub_100004F04(void *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = a1;
  id v25 = 0LL;
  id v8 = [[OSLogStatistics alloc] initWithLogArchivePath:0 forRelativePaths:v7 errorOut:&v25];

  id v9 = v25;
  if (v8)
  {
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v6 startDate]);
    __int128 v11 = (void *)objc_claimAutoreleasedReturnValue([v6 endDate]);
    id v24 = v9;
    v12 = (void *)objc_claimAutoreleasedReturnValue( [v8 aggregationForStartDate:v10 endDate:v11 predicate:v5 withOptions:7 errorOut:&v24]);
    id v13 = v24;

    if (v12)
    {
      int v14 = v12;
      unsigned __int8 v15 = v14;
    }

    else
    {
      id v17 = sub_100004AB8();
      v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        v22 = (void *)objc_claimAutoreleasedReturnValue([v5 description]);
        id v23 = (void *)objc_claimAutoreleasedReturnValue([v13 localizedDescription]);
        *(_DWORD *)buf = 138412546;
        uint64_t v27 = v22;
        __int16 v28 = 2112;
        int v29 = v23;
        _os_log_error_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_ERROR,  "Error during aggregations of OSLogStatistics for predicate %@ : %@",  buf,  0x16u);
      }

      int v14 = 0LL;
      unsigned __int8 v15 = 0LL;
    }
  }

  else
  {
    id v16 = sub_100004AB8();
    int v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      id v20 = (void *)objc_claimAutoreleasedReturnValue([v5 description]);
      time_t v21 = (void *)objc_claimAutoreleasedReturnValue([v9 localizedDescription]);
      *(_DWORD *)buf = 138412546;
      uint64_t v27 = v20;
      __int16 v28 = 2112;
      int v29 = v21;
      _os_log_error_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_ERROR,  "Error during initialisation of OSLogStatistics for predicate %@: %@",  buf,  0x16u);
    }

    unsigned __int8 v15 = 0LL;
    id v13 = v9;
  }

  return v15;
}

id sub_100005170(void *a1)
{
  id v1 = a1;
  unsigned __int8 v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSTimeZone defaultTimeZone](&OBJC_CLASS___NSTimeZone, "defaultTimeZone"));
  id v3 = objc_alloc_init(&OBJC_CLASS___NSDateFormatter);
  -[NSDateFormatter setTimeZone:](v3, "setTimeZone:", v2);
  -[NSDateFormatter setDateFormat:](v3, "setDateFormat:", @"yyyy-MM-dd-HHmm");
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSDateFormatter stringFromDate:](v3, "stringFromDate:", v1));

  return v4;
}

id sub_1000051FC(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([a1 jsonDescription:0]);
  id v11 = 0LL;
  id v5 = [v4 writeToFile:v3 atomically:0 encoding:4 error:&v11];
  id v6 = v11;
  if ((v5 & 1) == 0)
  {
    id v7 = sub_100004AB8();
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v6 localizedDescription]);
      *(_DWORD *)buf = 138412546;
      id v13 = v3;
      __int16 v14 = 2112;
      unsigned __int8 v15 = v10;
      _os_log_error_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_ERROR,  "Error writing aggregations at path %@: %@",  buf,  0x16u);
    }
  }

  return v5;
}

void sub_100005328(void *a1, void *a2, void *a3, void *a4)
{
  id v7 = a1;
  id v8 = a4;
  id v9 = a3;
  id v10 = a2;
  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  NSFileAttributeKey v33 = NSFileGroupOwnerAccountName;
  uint64_t v40 = (uint64_t)@"_analyticsusers";
  v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v40,  &v33,  1LL));
  id v32 = 0LL;
  unsigned __int8 v13 = [v11 setAttributes:v12 ofItemAtPath:v8 error:&v32];
  id v14 = v32;

  if ((v13 & 1) == 0)
  {
    id v15 = sub_100004AB8();
    id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      int v29 = (char *)objc_claimAutoreleasedReturnValue([v14 localizedDescription]);
      *(_DWORD *)buf = 138412290;
      v35 = v29;
      _os_log_error_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "setAttributes: %@", buf, 0xCu);
    }
  }

  id v31 = 0LL;
  char v17 = DRSubmitLog(@"com.apple.libtrace", v7, v10, v9, @"json", v8, 0LL, &v31);

  id v18 = v31;
  if ((v17 & 1) == 0)
  {
    id v19 = sub_100004AB8();
    id v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      __int16 v30 = (void *)objc_claimAutoreleasedReturnValue([v18 localizedDescription]);
      *(_DWORD *)buf = 138412546;
      v35 = v7;
      __int16 v36 = 2112;
      uint64_t v37 = (uint64_t)v30;
      _os_log_error_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_ERROR,  "Error during submission of %@ report : %@",  buf,  0x16u);
    }
  }

  id v21 = v8;
  v22 = (const char *)[v21 fileSystemRepresentation];
  uint64_t v40 = 65540LL;
  int v23 = fsctl(v22, 0xC0084A44uLL, &v40, 0);
  id v24 = sub_100004AB8();
  id v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
  int v26 = v25;
  if (v23)
  {
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      uint64_t v27 = __error();
      __int16 v28 = strerror(*v27);
      *(_DWORD *)buf = 136315650;
      v35 = v22;
      __int16 v36 = 2080;
      uint64_t v37 = (uint64_t)v28;
      __int16 v38 = 2048;
      uint64_t v39 = v40;
      _os_log_error_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_ERROR,  "Failed to mark %s as purgeable %s (flags 0x%llx)\n",  buf,  0x20u);
    }
  }

  else if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v35 = v22;
    __int16 v36 = 2048;
    uint64_t v37 = v40;
    _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEFAULT,  "Marked %s purgeable with flags 0x%llx\n",  buf,  0x16u);
  }
}

int64_t sub_100005680(id a1, OSLogStatisticsAggregation *a2, OSLogStatisticsAggregation *a3)
{
  id v4 = a2;
  id v5 = a3;
  id v6 = -[OSLogStatisticsAggregation eventBytes](v4, "eventBytes");
  if (v6 <= -[OSLogStatisticsAggregation eventBytes](v5, "eventBytes"))
  {
    id v8 = -[OSLogStatisticsAggregation eventBytes](v4, "eventBytes");
    int64_t v7 = v8 != -[OSLogStatisticsAggregation eventBytes](v5, "eventBytes");
  }

  else
  {
    int64_t v7 = -1LL;
  }

  return v7;
}

int64_t sub_100005700(id a1, id a2, id a3)
{
  return (int64_t)[a3 compare:a2];
}

int64_t sub_10000570C(id a1, id a2, id a3)
{
  return (int64_t)[a3 compare:a2];
}

id objc_msgSend_writeToFile_atomically_encoding_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeToFile:atomically:encoding:error:");
}
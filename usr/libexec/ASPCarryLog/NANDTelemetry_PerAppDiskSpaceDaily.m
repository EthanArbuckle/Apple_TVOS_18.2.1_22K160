@interface NANDTelemetry_PerAppDiskSpaceDaily
+ (BOOL)shouldRegisterActivity;
- (BOOL)_isAfterNotificationCoolDown;
- (id)_entityFailsCatSystemCheck:(id)a3;
- (id)_entityHasNegativeSize:(id)a3;
- (id)_getRawDictErrorStr:(id)a3;
- (id)_populatePerAppDiskSpaceDict;
- (void)_checkRawDictConsistency:(id)a3;
- (void)_sendToCoreAnalytics:(id)a3;
- (void)_tryNotifyUserRawDictErrorString:(id)a3;
- (void)_updateLastUserNotificationDate;
- (void)runActivity;
@end

@implementation NANDTelemetry_PerAppDiskSpaceDaily

- (id)_populatePerAppDiskSpaceDict
{
  return 0LL;
}

- (id)_entityHasNegativeSize:(id)a3
{
  id v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"total"]);
  v5 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"sizes"]);
  uint64_t v6 = objc_opt_class(&OBJC_CLASS___NSNumber);
  if ((objc_opt_isKindOfClass(v4, v6) & 1) != 0
    && ((unint64_t)[v4 longLongValue] & 0x8000000000000000) != 0)
  {
    id v18 = (id)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Negative size in app space entity dictionary %@",  v3));
    v21 = (void *)oslog;
    if (os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_ERROR)) {
      sub_100042F0C(v18, v21);
    }
  }

  else
  {
    uint64_t v7 = objc_opt_class(&OBJC_CLASS___NSDictionary);
    if ((objc_opt_isKindOfClass(v5, v7) & 1) != 0)
    {
      __int128 v27 = 0u;
      __int128 v28 = 0u;
      __int128 v25 = 0u;
      __int128 v26 = 0u;
      id v8 = v5;
      id v9 = [v8 countByEnumeratingWithState:&v25 objects:v29 count:16];
      if (v9)
      {
        id v10 = v9;
        v23 = v5;
        v24 = v4;
        id v11 = 0LL;
        v12 = 0LL;
        uint64_t v13 = *(void *)v26;
        while (2)
        {
          v14 = 0LL;
          v15 = v11;
          v16 = v12;
          do
          {
            if (*(void *)v26 != v13) {
              objc_enumerationMutation(v8);
            }
            id v11 = *(id *)(*((void *)&v25 + 1) + 8LL * (void)v14);

            v12 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:v11]);
            uint64_t v17 = objc_opt_class(&OBJC_CLASS___NSNumber);
            if ((objc_opt_isKindOfClass(v12, v17) & 1) != 0
              && ((unint64_t)[v12 longLongValue] & 0x8000000000000000) != 0)
            {
              v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Negative size in app space entity dictionary %@",  v3));
              v20 = (void *)oslog;
              if (os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_ERROR)) {
                sub_100042F0C(v19, v20);
              }
              id v18 = v19;

              v5 = v23;
              v4 = v24;
              goto LABEL_21;
            }

            v14 = (char *)v14 + 1;
            v15 = v11;
            v16 = v12;
          }

          while (v10 != v14);
          id v10 = [v8 countByEnumeratingWithState:&v25 objects:v29 count:16];
          if (v10) {
            continue;
          }
          break;
        }

        v5 = v23;
        v4 = v24;
      }
    }

    id v18 = 0LL;
  }

- (id)_entityFailsCatSystemCheck:(id)a3
{
  id v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"total"]);
  v5 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"sizes"]);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"name"]);
  uint64_t v7 = objc_opt_class(&OBJC_CLASS___NSString);
  uint64_t v8 = objc_opt_class(&OBJC_CLASS___NSNumber);
  if ((objc_opt_isKindOfClass(v4, v8) & 1) != 0)
  {
    id v9 = (char *)[v4 longLongValue];
    goto LABEL_8;
  }

  uint64_t v10 = objc_opt_class(&OBJC_CLASS___NSDictionary);
  if ((objc_opt_isKindOfClass(v5, v10) & 1) != 0)
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"total"]);
    uint64_t v12 = objc_opt_class(&OBJC_CLASS___NSNumber);
    char isKindOfClass = objc_opt_isKindOfClass(v11, v12);

    if ((isKindOfClass & 1) != 0)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"total"]);
      id v9 = (char *)[v14 longLongValue];

LABEL_8:
LABEL_11:
      v15 = 0LL;
      goto LABEL_12;
    }
  }

- (id)_getRawDictErrorStr:(id)a3
{
  id v4 = a3;
  v5 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v37 = 0u;
  __int128 v38 = 0u;
  __int128 v39 = 0u;
  __int128 v40 = 0u;
  id v6 = v4;
  id v30 = [v6 countByEnumeratingWithState:&v37 objects:v42 count:16];
  if (v30)
  {
    v32 = v5;
    uint64_t v7 = 0LL;
    id v8 = 0LL;
    uint64_t v9 = *(void *)v38;
    uint64_t v10 = &AnalyticsIsEventUsed_ptr;
    uint64_t v28 = *(void *)v38;
    id v29 = v6;
    do
    {
      uint64_t v11 = 0LL;
      uint64_t v12 = v8;
      do
      {
        if (*(void *)v38 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v31 = v11;
        id v8 = *(id *)(*((void *)&v37 + 1) + 8 * v11);

        uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:v8]);
        uint64_t v14 = objc_opt_class(v10[34]);
        char isKindOfClass = objc_opt_isKindOfClass(v13, v14);

        if ((isKindOfClass & 1) != 0)
        {
          __int128 v35 = 0u;
          __int128 v36 = 0u;
          __int128 v33 = 0u;
          __int128 v34 = 0u;
          v16 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:v8]);
          id v17 = [v16 countByEnumeratingWithState:&v33 objects:v41 count:16];
          if (v17)
          {
            id v18 = v17;
            id v19 = 0LL;
            uint64_t v20 = *(void *)v34;
            do
            {
              for (i = 0LL; i != v18; i = (char *)i + 1)
              {
                v22 = v19;
                if (*(void *)v34 != v20) {
                  objc_enumerationMutation(v16);
                }
                id v19 = *(id *)(*((void *)&v33 + 1) + 8LL * (void)i);

                uint64_t v23 = objc_opt_class(&OBJC_CLASS___NSDictionary);
                if ((objc_opt_isKindOfClass(v19, v23) & 1) != 0)
                {
                  v24 = (void *)objc_claimAutoreleasedReturnValue( -[NANDTelemetry_PerAppDiskSpaceDaily _entityHasNegativeSize:]( self,  "_entityHasNegativeSize:",  v19));

                  if (v24) {
                    -[NSMutableArray addObject:](v32, "addObject:", v24);
                  }
                  if ([v8 isEqualToString:@"categories"])
                  {
                    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( -[NANDTelemetry_PerAppDiskSpaceDaily _entityFailsCatSystemCheck:]( self,  "_entityFailsCatSystemCheck:",  v19));

                    if (v7) {
                      -[NSMutableArray addObject:](v32, "addObject:", v7);
                    }
                  }

                  else
                  {
                    uint64_t v7 = v24;
                  }
                }
              }

              id v18 = [v16 countByEnumeratingWithState:&v33 objects:v41 count:16];
            }

            while (v18);

            uint64_t v9 = v28;
            id v6 = v29;
          }

          uint64_t v10 = &AnalyticsIsEventUsed_ptr;
        }

        uint64_t v11 = v31 + 1;
        uint64_t v12 = v8;
      }

      while ((id)(v31 + 1) != v30);
      id v30 = [v6 countByEnumeratingWithState:&v37 objects:v42 count:16];
    }

    while (v30);

    v5 = v32;
  }

  else
  {
    uint64_t v7 = 0LL;
  }

  id v25 = -[NSMutableArray count](v5, "count");
  if (v25) {
    id v25 = (id)objc_claimAutoreleasedReturnValue(-[NSMutableArray componentsJoinedByString:](v5, "componentsJoinedByString:", @"\n"));
  }
  id v26 = v25;

  return v26;
}

- (void)_updateLastUserNotificationDate
{
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[NANDTelemetry_Base stateMgr](self, "stateMgr"));
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
  id v3 = DateTimeToStr(v2);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  [v5 saveValue:v4 forKey:@"lastUserNotificationDate" doPersist:1];
}

- (BOOL)_isAfterNotificationCoolDown
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[NANDTelemetry_Base stateMgr](self, "stateMgr"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 getValueForKey:@"lastUserNotificationDate"]);
  id v5 = StringToDateTime(v4);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  if (v6)
  {
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 dateByAddingTimeInterval:604800.0]);
    id v2 = (id)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
    BOOL v8 = [v7 compare:v2] == (id)-1;
  }

  else
  {
    BOOL v8 = 1;
  }

  uint64_t v9 = (os_log_s *)(id)oslog;
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    if (v8) {
      uint64_t v10 = "Do";
    }
    else {
      uint64_t v10 = "Do not";
    }
    if (v6)
    {
      id v11 = DateTimeToStr(v6);
      id v2 = objc_claimAutoreleasedReturnValue(v11);
      uint64_t v12 = (const char *)[v2 UTF8String];
    }

    else
    {
      uint64_t v12 = "none";
    }

    int v14 = 136315394;
    v15 = v10;
    __int16 v16 = 2080;
    id v17 = v12;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "%s notify user for raw dict error. Previous notification time %s",  (uint8_t *)&v14,  0x16u);
    if (v6) {
  }
    }

  return v8;
}

- (void)_tryNotifyUserRawDictErrorString:(id)a3
{
  id v4 = a3;
  if (os_variant_has_internal_ui("com.apple.ASPCarryLog")
    && objc_opt_class(&OBJC_CLASS___TapToRadarService)
    && -[NANDTelemetry_PerAppDiskSpaceDaily _isAfterNotificationCoolDown](self, "_isAfterNotificationCoolDown"))
  {
    id v5 = objc_alloc_init(&OBJC_CLASS___RadarDraft);
    [v5 setTitle:@"SpaceForce Telemetry Inconsistent Disk Space Result"];
    id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Inconsistent result is detect on your device during disk space usage telemetry collection. Inconsistencies:\n\n%@",  v4));
    [v5 setProblemDescription:v6];

    id v7 = [[RadarComponent alloc] initWithName:@"Storage Management" version:@"iOS" identifier:819298];
    [v5 setComponent:v7];

    [v5 setReproducibility:5];
    [v5 setClassification:6];
    [v5 setDiagnosticExtensionIDs:&off_1000BD2D0];
    [v5 setAttachments:0];
    [v5 setAutoDiagnostics:0];
    [v5 setIsUserInitiated:0];
    BOOL v8 = (void *)objc_claimAutoreleasedReturnValue(+[TapToRadarService shared](&OBJC_CLASS___TapToRadarService, "shared"));
    id v12 = 0LL;
    [v8 createDraft:v5 forProcessNamed:@"SpaceForceTelemetry" withDisplayReason:@"disk space usage calculation is inconsistent" error:&v12];
    id v9 = v12;

    uint64_t v10 = (void *)oslog;
    if (v9)
    {
      if (os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_ERROR)) {
        sub_100042F80(v10, v9);
      }
    }

    else
    {
      if (os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v10,  OS_LOG_TYPE_DEFAULT,  "Successfully created radar draft",  buf,  2u);
      }

      -[NANDTelemetry_PerAppDiskSpaceDaily _updateLastUserNotificationDate](self, "_updateLastUserNotificationDate");
    }
  }
}

- (void)_checkRawDictConsistency:(id)a3
{
  id v8 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:@"finished"]);
  unsigned int v5 = [v4 unsignedIntValue];

  if (v5)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[NANDTelemetry_PerAppDiskSpaceDaily _getRawDictErrorStr:](self, "_getRawDictErrorStr:", v8));
    if (v6) {
      id v7 = &off_1000AC298;
    }
    else {
      id v7 = &off_1000AC280;
    }
    [v8 setObject:v7 forKeyedSubscript:@"inconsistent"];
  }
}

- (void)_sendToCoreAnalytics:(id)a3
{
  id v4 = a3;
  id v3 = objc_autoreleasePoolPush();
  LogStorageUIDatatoCA(v4, 0);
  objc_autoreleasePoolPop(v3);
}

- (void)runActivity
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue( -[NANDTelemetry_PerAppDiskSpaceDaily _populatePerAppDiskSpaceDict]( self,  "_populatePerAppDiskSpaceDict"));
  if (v3)
  {
    -[NANDTelemetry_PerAppDiskSpaceDaily _checkRawDictConsistency:](self, "_checkRawDictConsistency:", v3);
    id v4 = (void *)oslog;
    if (os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v5 = v4;
      id v6 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"execMilliseconds"]);
      v7[0] = 67109120;
      v7[1] = (int)[v6 intValue] / 1000;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Sending app space info to CA. Extraction time %ds",  (uint8_t *)v7,  8u);
    }

    -[NANDTelemetry_PerAppDiskSpaceDaily _sendToCoreAnalytics:](self, "_sendToCoreAnalytics:", v3);
  }
}

+ (BOOL)shouldRegisterActivity
{
  return 0;
}

@end
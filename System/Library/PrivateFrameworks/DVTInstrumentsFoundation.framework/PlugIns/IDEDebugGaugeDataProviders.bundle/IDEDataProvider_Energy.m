@interface IDEDataProvider_Energy
+ (id)sharedDataProvider;
- (BOOL)captureAttributes:(id)a3 toDictionary:(id)a4 forPID:(id)a5;
- (IDEDataProvider_Energy)init;
- (id)captureAttributes:(id)a3 forPIDs:(id)a4;
- (id)startSamplingForPIDs:(id)a3;
- (id)stopSamplingForPIDs:(id)a3;
- (id)supportedAttributes;
@end

@implementation IDEDataProvider_Energy

+ (id)sharedDataProvider
{
  if (qword_113E0 != -1) {
    dispatch_once(&qword_113E0, &stru_C5F0);
  }
  return (id)qword_113D8;
}

- (IDEDataProvider_Energy)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___IDEDataProvider_Energy;
  v2 = -[IDEDataProvider_Energy init](&v6, "init");
  if (v2)
  {
    v3 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    queryWasStartedForPidDictionary = v2->_queryWasStartedForPidDictionary;
    v2->_queryWasStartedForPidDictionary = v3;
  }

  return v2;
}

- (id)supportedAttributes
{
  if (qword_113F0 != -1) {
    dispatch_once(&qword_113F0, &stru_C610);
  }
  return (id)qword_113E8;
}

- (id)startSamplingForPIDs:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set", v4));
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  id obj = v4;
  id v6 = [obj countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    do
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(obj);
        }
        v9 = *(void **)(*((void *)&v13 + 1) + 8LL * (void)i);
        v10 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKey:]( self->_queryWasStartedForPidDictionary,  "objectForKey:",  v9));
        if ([v10 BOOLValue])
        {
          [v5 addObject:v9];
        }

        else if ((PLBatteryGaugeStartTracingForPid([v9 intValue]) & 0x80000000) == 0)
        {

          -[NSMutableDictionary setObject:forKey:]( self->_queryWasStartedForPidDictionary,  "setObject:forKey:",  &__kCFBooleanTrue,  v9);
          v10 = &__kCFBooleanTrue;
          [v5 addObject:v9];
        }
      }

      id v6 = [obj countByEnumeratingWithState:&v13 objects:v17 count:16];
    }

    while (v6);
  }

  return v5;
}

- (BOOL)captureAttributes:(id)a3 toDictionary:(id)a4 forPID:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_queryWasStartedForPidDictionary, "objectForKey:", v8));
  if ([v9 BOOLValue])
  {
    v49 = (void *)objc_claimAutoreleasedReturnValue( -[NSDictionary objectForKeyedSubscript:]( self->_lastSnapshotForAllPids,  "objectForKeyedSubscript:",  v8));
    v10 = (void *)objc_claimAutoreleasedReturnValue([v49 objectForKeyedSubscript:@"usage_data"]);
    v11 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:&off_D858]);
    v12 = v11;
    BOOL v13 = v11 != 0LL;
    if (v11)
    {
      __int128 v14 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:@"cost"]);
      [v7 setObject:v14 forKeyedSubscript:@"energy.cost"];

      __int128 v15 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:@"overhead"]);
      [v7 setObject:v15 forKeyedSubscript:@"energy.overhead"];

      [v7 setObject:&off_D870 forKeyedSubscript:@"energy.version"];
      __int128 v16 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:&off_D888]);

      if (v16)
      {
        v17 = (void *)objc_claimAutoreleasedReturnValue([v16 objectForKeyedSubscript:@"cost"]);
        [v7 setObject:v17 forKeyedSubscript:@"energy.cpu.cost"];

        v18 = (void *)objc_claimAutoreleasedReturnValue([v16 objectForKeyedSubscript:@"overhead"]);
        [v7 setObject:v18 forKeyedSubscript:@"energy.cpu.overhead"];
      }

      v19 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:&off_D8A0]);

      if (v19)
      {
        v20 = (void *)objc_claimAutoreleasedReturnValue([v19 objectForKeyedSubscript:@"cost"]);
        [v7 setObject:v20 forKeyedSubscript:@"energy.networking.cost"];

        v21 = (void *)objc_claimAutoreleasedReturnValue([v19 objectForKeyedSubscript:@"overhead"]);
        [v7 setObject:v21 forKeyedSubscript:@"energy.networkning.overhead"];
      }

      v22 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:&off_D8B8]);

      if (v22)
      {
        v23 = (void *)objc_claimAutoreleasedReturnValue([v22 objectForKeyedSubscript:@"cost"]);
        [v7 setObject:v23 forKeyedSubscript:@"energy.location.cost"];

        v24 = (void *)objc_claimAutoreleasedReturnValue([v22 objectForKeyedSubscript:@"overhead"]);
        [v7 setObject:v24 forKeyedSubscript:@"energy.location.overhead"];
      }

      v25 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:&off_D8D0]);

      if (v25)
      {
        v26 = (void *)objc_claimAutoreleasedReturnValue([v25 objectForKeyedSubscript:@"cost"]);
        [v7 setObject:v26 forKeyedSubscript:@"energy.gpu.cost"];

        v27 = (void *)objc_claimAutoreleasedReturnValue([v25 objectForKeyedSubscript:@"overhead"]);
        [v7 setObject:v27 forKeyedSubscript:@"energy.gpu.overhead"];
      }

      v28 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:&off_D8E8]);

      if (v28)
      {
        v29 = (void *)objc_claimAutoreleasedReturnValue([v28 objectForKeyedSubscript:@"cost"]);
        [v7 setObject:v29 forKeyedSubscript:@"energy.display.cost"];

        v30 = (void *)objc_claimAutoreleasedReturnValue([v28 objectForKeyedSubscript:@"overhead"]);
        [v7 setObject:v30 forKeyedSubscript:@"energy.display.overhead"];
      }

      v31 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:&off_D900]);

      if (v31)
      {
        v32 = (void *)objc_claimAutoreleasedReturnValue([v31 objectForKeyedSubscript:@"cost"]);
        [v7 setObject:v32 forKeyedSubscript:@"energy.appstate.cost"];

        v33 = (void *)objc_claimAutoreleasedReturnValue([v31 objectForKeyedSubscript:@"overhead"]);
        [v7 setObject:v33 forKeyedSubscript:@"energy.appstate.overhead"];
      }

      v34 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:&off_D918]);

      if (v34)
      {
        v35 = (void *)objc_claimAutoreleasedReturnValue([v34 objectForKeyedSubscript:@"cost"]);
        uint64_t v36 = sub_5200(v35);

        v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v36));
        [v7 setObject:v37 forKeyedSubscript:@"energy.thermalstate.cost"];
      }

      v38 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:&off_D930]);

      if (v38)
      {
        v39 = (void *)objc_claimAutoreleasedReturnValue([v38 objectForKeyedSubscript:@"cost"]);
        uint64_t v40 = sub_5200(v39);

        v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v40));
        [v7 setObject:v41 forKeyedSubscript:@"energy.inducedthermalstate.cost"];
      }

      v42 = (void *)objc_claimAutoreleasedReturnValue(-[IDEDataProvider initialQueryTimeForPidDictionary](self, "initialQueryTimeForPidDictionary"));
      v43 = (void *)objc_claimAutoreleasedReturnValue([v42 objectForKeyedSubscript:v8]);
      if (v43)
      {
        v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
        [v44 timeIntervalSinceDate:v43];
        double v46 = v45;

        v47 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  vcvtpd_u64_f64(v46)));
        [v7 setObject:v47 forKeyedSubscript:@"kIDEGaugeSecondsSinceInitialQueryKey"];
      }

      else
      {
        v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
        [v42 setObject:v43 forKeyedSubscript:v8];
        [v7 setObject:&off_D948 forKeyedSubscript:@"kIDEGaugeSecondsSinceInitialQueryKey"];
      }
    }
  }

  else
  {
    BOOL v13 = 0;
  }

  return v13;
}

- (id)stopSamplingForPIDs:(id)a3
{
  id v12 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  id v5 = v12;
  id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    do
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        v9 = *(void **)(*((void *)&v13 + 1) + 8LL * (void)i);
        v10 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKey:]( self->_queryWasStartedForPidDictionary,  "objectForKey:",  v9));
        if ([v10 BOOLValue])
        {
          -[NSMutableDictionary removeObjectForKey:](self->_queryWasStartedForPidDictionary, "removeObjectForKey:", v9);
        }

        else
        {
          [v4 addObject:v9];
        }
      }

      id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }

    while (v6);
  }

  return v4;
}

- (id)captureAttributes:(id)a3 forPIDs:(id)a4
{
  id v6 = a3;
  id v18 = a4;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  if ([v18 count])
  {
    uint64_t Snapshot = PLBatteryGaugeGetSnapshot();
    v9 = (NSDictionary *)objc_claimAutoreleasedReturnValue(Snapshot);
    lastSnapshotForAllPids = self->_lastSnapshotForAllPids;
    self->_lastSnapshotForAllPids = v9;
  }

  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  id v11 = v18;
  id v12 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v20;
    do
    {
      __int128 v14 = 0LL;
      do
      {
        if (*(void *)v20 != v13) {
          objc_enumerationMutation(v11);
        }
        uint64_t v15 = *(void *)(*((void *)&v19 + 1) + 8LL * (void)v14);
        __int128 v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
        if (-[IDEDataProvider_Energy captureAttributes:toDictionary:forPID:]( self,  "captureAttributes:toDictionary:forPID:",  v6,  v16,  v15))
        {
          [v7 setObject:v16 forKeyedSubscript:v15];
        }

        __int128 v14 = (char *)v14 + 1;
      }

      while (v12 != v14);
      id v12 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }

    while (v12);
  }

  return v7;
}

- (void).cxx_destruct
{
}

@end
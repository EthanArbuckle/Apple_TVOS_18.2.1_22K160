@interface UASimulatorReceiver
- (BOOL)active;
- (BOOL)doSetReceivedItems:(id)a3;
- (BOOL)fetchAdvertisedItems:(BOOL)a3;
- (BOOL)receiving;
- (NSArray)receivedItems;
- (UASimulator)simulator;
- (UASimulatorReceiver)initWithSimulator:(id)a3;
- (id)statusString;
@end

@implementation UASimulatorReceiver

- (UASimulatorReceiver)initWithSimulator:(id)a3
{
  id v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 controller]);
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 manager]);
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___UASimulatorReceiver;
  v8 = -[UAReceiver initWithManager:name:](&v10, "initWithManager:name:", v7, @"SimReceiver");

  if (v8) {
    objc_storeStrong((id *)&v8->_simulator, a3);
  }

  return v8;
}

- (BOOL)receiving
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray firstObject](v2->_receivedItems, "firstObject"));
  BOOL v4 = v3 != 0LL;

  objc_sync_exit(v2);
  return v4;
}

- (BOOL)doSetReceivedItems:(id)a3
{
  id v4 = a3;
  os_log_t v5 = sub_100039584(0LL);
  v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue([v4 description]);
    id v8 = sub_10005BF18(v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    *(_DWORD *)buf = 138477827;
    v39 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEBUG,  "SIMULATOR: Setting receivedItems to %{private}@",  buf,  0xCu);
  }

  if (!v4) {
    id v4 = &__NSArray0__struct;
  }
  objc_super v10 = (void *)objc_claimAutoreleasedReturnValue(-[UASimulatorReceiver receivedItems](self, "receivedItems"));
  v30 = v4;
  unsigned __int8 v31 = [v4 isEqual:v10];

  if ((v31 & 1) == 0)
  {
    os_log_t v11 = sub_100039584(0LL);
    v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[UASimulatorReceiver receivedItems](self, "receivedItems"));
      v14 = (void *)objc_claimAutoreleasedReturnValue([v13 description]);
      id v15 = sub_10005BF18(v14);
      v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
      *(_DWORD *)buf = 138477827;
      v39 = v16;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEBUG,  "SIMULATOR: Items changed(from %{private}@), so updating and signalling.",  buf,  0xCu);
    }

    v17 = (NSArray *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    __int128 v35 = 0u;
    __int128 v36 = 0u;
    __int128 v33 = 0u;
    __int128 v34 = 0u;
    id obj = v4;
    id v18 = [obj countByEnumeratingWithState:&v33 objects:v37 count:16];
    if (v18)
    {
      uint64_t v19 = *(void *)v34;
      do
      {
        for (i = 0LL; i != v18; i = (char *)i + 1)
        {
          if (*(void *)v34 != v19) {
            objc_enumerationMutation(obj);
          }
          uint64_t v21 = *(void *)(*((void *)&v33 + 1) + 8LL * (void)i);
          v22 = objc_alloc(&OBJC_CLASS___UASimulatorSuggestedItem);
          v23 = (void *)objc_claimAutoreleasedReturnValue(-[UASimulatorReceiver simulator](self, "simulator"));
          v24 = (void *)objc_claimAutoreleasedReturnValue([v23 peeredDevice]);
          v25 = (void *)objc_claimAutoreleasedReturnValue(-[UASimulatorReceiver simulator](self, "simulator"));
          v26 = -[UASimulatorSuggestedItem initWithUserActivityInfo:peerDevice:simulator:]( v22,  "initWithUserActivityInfo:peerDevice:simulator:",  v21,  v24,  v25);

          -[UASimulatorSuggestedItem setActive:](v26, "setActive:", 1LL);
          -[NSArray addObject:](v17, "addObject:", v26);
        }

        id v18 = [obj countByEnumeratingWithState:&v33 objects:v37 count:16];
      }

      while (v18);
    }

    v27 = self;
    objc_sync_enter(v27);
    receivedItems = v27->_receivedItems;
    v27->_receivedItems = v17;

    objc_sync_exit(v27);
  }

  return v31 ^ 1;
}

- (BOOL)fetchAdvertisedItems:(BOOL)a3
{
  BOOL v3 = a3;
  os_log_t v5 = sub_100039584(0LL);
  v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v7 = "NO";
    if (v3) {
      v7 = "YES";
    }
    *(_DWORD *)buf = 136446210;
    v92 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "includePayload=%{public}s", buf, 0xCu);
  }

  int v89 = 0;
  uint64_t v87 = 0LL;
  double v88 = 0.0;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[UASimulatorReceiver simulator](self, "simulator"));
  BOOL v9 = sub_100075FF8((mach_port_t)[v8 pairedClientPort], 0, &v90, &v89, &v88, &v87, &v86, &v85) == 0;

  if (v9)
  {
    uint64_t v11 = objc_opt_class(&OBJC_CLASS___UAUserActivityInfo);
    id v12 = sub_100006B98(v11, v90, v89, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[UASimulatorReceiver receivedItems](self, "receivedItems"));
    id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 firstObject]);

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[UASimulatorReceiver simulator](self, "simulator"));
    unsigned int v17 = [v16 activitiesShouldCrossover];

    if (v17) {
      double v88 = 0.0;
    }
    if (v15 && !v89)
    {
      os_log_t v18 = sub_100039584(0LL);
      uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        v20 = (void *)objc_claimAutoreleasedReturnValue([v15 uuid]);
        uint64_t v21 = (char *)objc_claimAutoreleasedReturnValue([v20 UUIDString]);
        *(_DWORD *)buf = 138543619;
        v92 = v21;
        __int16 v93 = 2113;
        v94 = v15;
        _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "SIMULATOR: Clearing current item, because it has been removed(was %{public}@/%{private}@).",  buf,  0x16u);
      }

      v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray array](&OBJC_CLASS___NSArray, "array"));
LABEL_41:
      if (!v22)
      {
        BOOL v10 = 1;
        goto LABEL_45;
      }

      v70 = self;
      objc_sync_enter(v70);
      objc_storeStrong((id *)&v70->_receivedItems, v22);
      objc_sync_exit(v70);

      v71 = (void *)objc_claimAutoreleasedReturnValue(-[UASimulatorReceiver simulator](v70, "simulator"));
      v72 = (void *)objc_claimAutoreleasedReturnValue([v71 controller]);
      v73 = (void *)objc_claimAutoreleasedReturnValue([v72 manager]);
      [v73 scheduleBestAppDetermination];

      BOOL v10 = 1;
      v37 = v22;
      goto LABEL_43;
    }

    if (v15)
    {
      v23 = (void *)objc_claimAutoreleasedReturnValue([v15 uuid]);
      v24 = (void *)objc_claimAutoreleasedReturnValue([v13 uuid]);
      unsigned int v25 = [v23 isEqual:v24];

      if (v25)
      {
        os_log_t v26 = sub_100039584(0LL);
        v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          v28 = (void *)objc_claimAutoreleasedReturnValue([v15 uuid]);
          v29 = (char *)objc_claimAutoreleasedReturnValue([v28 UUIDString]);
          v30 = (void *)objc_claimAutoreleasedReturnValue([v13 payloadForIdentifier:UAUserActivityUserInfoPayload]);
          id v31 = sub_1000034D8(v30);
          v32 = (void *)objc_claimAutoreleasedReturnValue(v31);
          __int128 v33 = (void *)objc_claimAutoreleasedReturnValue([v13 webpageURL]);
          *(_DWORD *)buf = 138543875;
          v92 = v29;
          __int16 v93 = 2113;
          v94 = v32;
          __int16 v95 = 2113;
          v96 = v33;
          _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_DEFAULT,  "SIMULATOR: Updating existing item, %{public}@ %{private}@/%{private}@",  buf,  0x20u);
        }

        __int128 v34 = (void *)objc_claimAutoreleasedReturnValue([v13 webpageURL]);
        [v15 setWebpageURL:v34];

        uint64_t v35 = UAUserActivityUserInfoPayload;
        __int128 v36 = (void *)objc_claimAutoreleasedReturnValue([v13 payloadForIdentifier:UAUserActivityUserInfoPayload]);
        [v15 setPayload:v36 identifier:v35];

        v37 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSinceNow:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceNow:",  -v88));
        [v15 setWhen:v37];
        BOOL v10 = 0;
LABEL_43:

        goto LABEL_45;
      }

      v38 = (void *)objc_claimAutoreleasedReturnValue([v15 uuid]);
      v39 = (void *)objc_claimAutoreleasedReturnValue([v13 uuid]);
      if ([v38 isEqual:v39])
      {
        v40 = (void *)objc_claimAutoreleasedReturnValue([v15 webpageURL]);
        v41 = (void *)objc_claimAutoreleasedReturnValue([v13 webpageURL]);
        if ([v40 isEqual:v41])
        {
          v42 = (void *)objc_claimAutoreleasedReturnValue([v13 webpageURL]);
          v43 = (void *)objc_claimAutoreleasedReturnValue([v15 webpageURL]);
          unsigned __int8 v44 = [v42 isEqual:v43];

          if ((v44 & 1) != 0)
          {
            BOOL v10 = 0;
LABEL_45:

            return v10;
          }

          goto LABEL_25;
        }
      }
    }

- (BOOL)active
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[UASimulatorReceiver simulator](self, "simulator"));
  unsigned __int8 v3 = [v2 active];

  return v3;
}

- (id)statusString
{
  unsigned __int8 v3 = self;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[UASimulatorReceiver receivedItems](self, "receivedItems"));
  id v5 = [v4 count];

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString string](&OBJC_CLASS___NSMutableString, "string"));
    if (-[UASimulatorReceiver receiving](v3, "receiving")) {
      v7 = @"ACTIVE";
    }
    else {
      v7 = &stru_1000BE738;
    }
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[UASimulatorReceiver receivedItems](v3, "receivedItems"));
    id v9 = [v8 count];
    BOOL v10 = (void *)objc_claimAutoreleasedReturnValue(-[UASimulatorReceiver receivedItems](v3, "receivedItems"));
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 firstObject]);
    if (v11)
    {
      unsigned __int8 v3 = (UASimulatorReceiver *)objc_claimAutoreleasedReturnValue(-[UASimulatorReceiver receivedItems](v3, "receivedItems"));
      v2 = (void *)objc_claimAutoreleasedReturnValue(-[UASimulatorReceiver firstObject](v3, "firstObject"));
      id v12 = (__CFString *)objc_claimAutoreleasedReturnValue([v2 logString]);
    }

    else
    {
      id v12 = &stru_1000BE738;
    }

    [v6 appendFormat:@"UASimulatorReceiver: %@, %ld items %@", v7, v9, v12];
    if (v11)
    {
    }

    v13 = v6;
  }

  else
  {
    v13 = 0LL;
  }

  id v14 = [v13 copy];

  return v14;
}

- (UASimulator)simulator
{
  return (UASimulator *)objc_getProperty(self, a2, 56LL, 1);
}

- (NSArray)receivedItems
{
  return (NSArray *)objc_getProperty(self, a2, 64LL, 1);
}

- (void).cxx_destruct
{
}

@end
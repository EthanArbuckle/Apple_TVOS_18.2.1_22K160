@interface UASimulatorAdvertiser
- (BOOL)active;
- (BOOL)advertising;
- (BOOL)updateItem:(id)a3;
- (UASimulator)simulator;
- (UASimulatorAdvertiser)initWithSimulator:(id)a3;
- (id)advertisableItems;
- (id)pairedDevices;
- (id)statusString;
- (void)setAdvertisableItems:(id)a3;
@end

@implementation UASimulatorAdvertiser

- (UASimulatorAdvertiser)initWithSimulator:(id)a3
{
  id v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 controller]);
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 manager]);
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___UASimulatorAdvertiser;
  v8 = -[UAAdvertiser initWithManager:name:](&v12, "initWithManager:name:", v7, @"SimAdvertiser");

  if (v8)
  {
    objc_storeStrong((id *)(v8 + 57), a3);
    uint64_t v9 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    v10 = *(void **)(v8 + 49);
    *(void *)(v8 + 49) = v9;
  }

  return (UASimulatorAdvertiser *)v8;
}

- (id)advertisableItems
{
  v2 = self;
  objc_sync_enter(v2);
  id v3 = [*(id *)(&v2->super._shouldAdvertiseAutoPullActivityList + 1) copy];
  objc_sync_exit(v2);

  return v3;
}

- (void)setAdvertisableItems:(id)a3
{
  id v4 = a3;
  os_log_t v5 = sub_100039584(0LL);
  v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue([v4 description]);
    id v8 = sub_10005BF18(v7);
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    *(_DWORD *)buf = 138477827;
    v30 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEBUG,  "Setting advertisable items to %{private}@",  buf,  0xCu);
  }

  v10 = self;
  objc_sync_enter(v10);
  [*(id *)(&v10->super._shouldAdvertiseAutoPullActivityList + 1) removeAllObjects];
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  id v11 = v4;
  id v12 = [v11 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v25;
    while (2)
    {
      for (i = 0LL; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v25 != v13) {
          objc_enumerationMutation(v11);
        }
        v15 = *(void **)(*((void *)&v24 + 1) + 8LL * (void)i);
        uint64_t v16 = objc_opt_class(&OBJC_CLASS___UASimulatorSuggestedItem);
        if ((objc_opt_isKindOfClass(v15, v16) & 1) == 0 && [v15 eligibleForHandoff])
        {
          v17 = objc_alloc(&OBJC_CLASS___UASimulatorSuggestedItem);
          v18 = (void *)objc_claimAutoreleasedReturnValue(-[UASimulatorAdvertiser simulator](v10, "simulator"));
          v19 = (void *)objc_claimAutoreleasedReturnValue([v18 peeredDevice]);
          v20 = (void *)objc_claimAutoreleasedReturnValue(-[UASimulatorAdvertiser simulator](v10, "simulator"));
          v21 = -[UASimulatorSuggestedItem initWithUserActivityInfo:peerDevice:simulator:]( v17,  "initWithUserActivityInfo:peerDevice:simulator:",  v15,  v19,  v20);

          -[UASimulatorSuggestedItem setActive:](v21, "setActive:", 1LL);
          [*(id *)(&v10->super._shouldAdvertiseAutoPullActivityList + 1) addObject:v21];

          goto LABEL_14;
        }
      }

      id v12 = [v11 countByEnumeratingWithState:&v24 objects:v28 count:16];
      if (v12) {
        continue;
      }
      break;
    }
  }

- (BOOL)active
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___UASimulatorAdvertiser;
  return -[UACornerActionManagerHandler active](&v3, "active");
}

- (BOOL)advertising
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[UASimulatorAdvertiser advertisableItems](self, "advertisableItems"));
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue([v2 firstObject]);
  BOOL v4 = v3 != 0LL;

  return v4;
}

- (BOOL)updateItem:(id)a3
{
  id v4 = a3;
  os_log_t v5 = sub_100039584(0LL);
  v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue([v4 uuid]);
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 UUIDString]);
    int v11 = 138543619;
    id v12 = v8;
    __int16 v13 = 2113;
    id v14 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_INFO,  "SIMULATOR: Telling paired client that the advertised item %{public}@/%{private}@ changed.",  (uint8_t *)&v11,  0x16u);
  }

  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[UASimulatorAdvertiser simulator](self, "simulator"));
  sub_100076210((mach_port_t)[v9 pairedClientPort]);

  return 1;
}

- (id)pairedDevices
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(-[UASimulatorAdvertiser simulator](self, "simulator"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 peeredDevice]);
  if (v4)
  {
    os_log_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[UASimulatorAdvertiser simulator](self, "simulator"));
    v6 = (void *)objc_claimAutoreleasedReturnValue([v5 peeredDevice]);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](&OBJC_CLASS___NSSet, "setWithObject:", v6));
  }

  else
  {
    v7 = 0LL;
  }

  return v7;
}

- (id)statusString
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(-[UASimulatorAdvertiser advertisableItems](self, "advertisableItems"));
  id v4 = [v3 count];

  if (!v4) {
    goto LABEL_4;
  }
  os_log_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString string](&OBJC_CLASS___NSMutableString, "string"));
  [v5 appendFormat:@"### UASimulatorAdvertiser:"];
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[UASimulatorAdvertiser advertisableItems](self, "advertisableItems"));
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 firstObject]);
  [v5 appendFormat:@"%@", v7];

  [v5 appendString:@"\n"];
  if (v5)
  {
    id v8 = [v5 copy];
  }

  else
  {
LABEL_4:
    id v8 = 0LL;
  }

  return v8;
}

- (UASimulator)simulator
{
  return (UASimulator *)objc_getProperty(self, a2, 57LL, 1);
}

- (void).cxx_destruct
{
}

@end
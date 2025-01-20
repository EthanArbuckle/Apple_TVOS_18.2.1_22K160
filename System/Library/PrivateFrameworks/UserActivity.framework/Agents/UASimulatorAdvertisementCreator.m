@interface UASimulatorAdvertisementCreator
- (BOOL)active;
- (UASimulator)simulator;
- (UASimulatorAdvertisementCreator)initWithManager:(id)a3 simulator:(id)a4;
- (id)eligibleAdvertiseableItemsInOrder;
- (id)items;
- (id)statusString;
- (int64_t)priority;
@end

@implementation UASimulatorAdvertisementCreator

- (UASimulatorAdvertisementCreator)initWithManager:(id)a3 simulator:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___UASimulatorAdvertisementCreator;
  v8 = -[UAClientController initWithManager:name:](&v11, "initWithManager:name:", a3, @"SimCreator");
  v9 = v8;
  if (v8) {
    objc_storeStrong((id *)&v8->_simulator, a4);
  }

  return v9;
}

- (id)items
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[UASimulatorAdvertisementCreator simulator](self, "simulator"));
  if ([v3 activitiesShouldCrossover])
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[UASimulatorAdvertisementCreator simulator](self, "simulator"));
    v5 = (void *)objc_claimAutoreleasedReturnValue([v4 receiver]);
    v6 = (void *)objc_claimAutoreleasedReturnValue([v5 receivedItems]);
    if (v6)
    {
      id v7 = (void *)objc_claimAutoreleasedReturnValue(-[UASimulatorAdvertisementCreator simulator](self, "simulator"));
      v8 = (void *)objc_claimAutoreleasedReturnValue([v7 receiver]);
      v9 = (void *)objc_claimAutoreleasedReturnValue([v8 receivedItems]);
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v9));
    }

    else
    {
      v10 = 0LL;
    }
  }

  else
  {
    v10 = 0LL;
  }

  return v10;
}

- (id)eligibleAdvertiseableItemsInOrder
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[UASimulatorAdvertisementCreator simulator](self, "simulator"));
  unsigned int v4 = [v3 activitiesShouldCrossover];

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[UASimulatorAdvertisementCreator simulator](self, "simulator"));
    v6 = (void *)objc_claimAutoreleasedReturnValue([v5 receiver]);
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 receivedItems]);

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    __int128 v27 = 0u;
    __int128 v28 = 0u;
    __int128 v29 = 0u;
    __int128 v30 = 0u;
    id obj = v7;
    id v9 = [obj countByEnumeratingWithState:&v27 objects:v33 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v28;
      do
      {
        v12 = 0LL;
        do
        {
          if (*(void *)v28 != v11) {
            objc_enumerationMutation(obj);
          }
          uint64_t v13 = *(void *)(*((void *)&v27 + 1) + 8LL * (void)v12);
          v14 = objc_alloc(&OBJC_CLASS___UASimulatorSuggestedItem);
          v15 = (void *)objc_claimAutoreleasedReturnValue(-[UASimulatorAdvertisementCreator simulator](self, "simulator"));
          v16 = (void *)objc_claimAutoreleasedReturnValue([v15 peeredDevice]);
          v17 = (void *)objc_claimAutoreleasedReturnValue(-[UASimulatorAdvertisementCreator simulator](self, "simulator"));
          v18 = -[UASimulatorSuggestedItem initWithUserActivityInfo:peerDevice:simulator:]( v14,  "initWithUserActivityInfo:peerDevice:simulator:",  v13,  v16,  v17);

          -[UASimulatorSuggestedItem setActive:](v18, "setActive:", 1LL);
          [v8 addObject:v18];

          v12 = (char *)v12 + 1;
        }

        while (v10 != v12);
        id v10 = [obj countByEnumeratingWithState:&v27 objects:v33 count:16];
      }

      while (v10);
    }

    id v19 = [v8 copy];
    os_log_t v20 = sub_100039584(0LL);
    v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue([v19 description]);
      id v23 = sub_10005BF18(v22);
      v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
      *(_DWORD *)buf = 138477827;
      v32 = v24;
      _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_INFO,  "SIMULATOR: Returning received activities %{private}@ as eligibleItems",  buf,  0xCu);
    }
  }

  else
  {
    id v19 = 0LL;
  }

  return v19;
}

- (int64_t)priority
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___UASimulatorAdvertisementCreator;
  id v3 = -[UACornerActionManagerHandler priority](&v9, "priority");
  unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue(-[UASimulatorAdvertisementCreator simulator](self, "simulator"));
  unsigned int v5 = [v4 activitiesShouldCrossover];
  uint64_t v6 = 100LL;
  if (!v5) {
    uint64_t v6 = 0LL;
  }
  int64_t v7 = (int64_t)v3 + v6;

  return v7;
}

- (BOOL)active
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[UASimulatorAdvertisementCreator simulator](self, "simulator"));
  unsigned __int8 v3 = [v2 activitiesShouldCrossover];

  return v3;
}

- (id)statusString
{
  if (-[UASimulatorAdvertisementCreator active](self, "active")) {
    unsigned __int8 v3 = &stru_1000BE738;
  }
  else {
    unsigned __int8 v3 = @"(inactive) ";
  }
  unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue(-[UASimulatorAdvertisementCreator simulator](self, "simulator"));
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue([v4 peeredDevice]);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 name]);
  int64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[UASimulatorAdvertisementCreator simulator](self, "simulator"));
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 receiver]);
  objc_super v9 = (void *)objc_claimAutoreleasedReturnValue([v8 receivedItems]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 firstObject]);
  if (v10)
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[UASimulatorAdvertisementCreator simulator](self, "simulator"));
    id v23 = v9;
    uint64_t v11 = v3;
    v12 = (void *)objc_claimAutoreleasedReturnValue([v22 receiver]);
    v25 = v4;
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v12 receivedItems]);
    v24 = v7;
    v14 = v5;
    v15 = (void *)objc_claimAutoreleasedReturnValue([v13 firstObject]);
    v16 = v8;
    v17 = v6;
    v18 = (void *)objc_claimAutoreleasedReturnValue([v15 statusString]);
    v21 = v11;
    objc_super v9 = v23;
    id v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"(sim-rebroadcasted-item):%@ %@ %@",  v21,  v17,  v18));

    uint64_t v6 = v17;
    v8 = v16;

    unsigned int v5 = v14;
    int64_t v7 = v24;

    unsigned int v4 = v25;
  }

  else
  {
    id v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"(sim-rebroadcasted-item):%@ %@ %@",  v3,  v6,  @"-"));
  }

  return v19;
}

- (UASimulator)simulator
{
  return (UASimulator *)objc_getProperty(self, a2, 48LL, 1);
}

- (void).cxx_destruct
{
}

@end
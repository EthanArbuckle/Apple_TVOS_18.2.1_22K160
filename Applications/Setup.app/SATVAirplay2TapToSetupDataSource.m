@interface SATVAirplay2TapToSetupDataSource
- (BOOL)isReady;
- (NSArray)homes;
- (NSString)description;
- (SATVAirplay2DataSourceObject)preferredHome;
- (SATVAirplay2TapToSetupDataSource)initWithHomeKitInfo:(id)a3;
- (id)homeTheaterSpeakersInRoom:(id)a3 inHome:(id)a4;
- (id)roomWithName:(id)a3 inHome:(id)a4;
- (id)roomsForHome:(id)a3;
@end

@implementation SATVAirplay2TapToSetupDataSource

- (SATVAirplay2TapToSetupDataSource)initWithHomeKitInfo:(id)a3
{
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)&OBJC_CLASS___SATVAirplay2TapToSetupDataSource;
  v5 = -[SATVAirplay2TapToSetupDataSource init](&v23, "init");
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue([v4 homes]);
    v17 = _NSConcreteStackBlock;
    uint64_t v18 = 3221225472LL;
    v19 = sub_100047534;
    v20 = &unk_1000CA560;
    id v21 = (id)objc_claimAutoreleasedReturnValue([v4 currentHome]);
    v7 = v5;
    v22 = v7;
    id v8 = v21;
    uint64_t v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "bs_map:", &v17));
    homes = v7->_homes;
    v7->_homes = (NSArray *)v9;

    v11 = v7->_homes;
    v12 = sub_10002B4D0();
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    uint64_t v14 = objc_claimAutoreleasedReturnValue(-[NSArray sortedArrayUsingComparator:](v11, "sortedArrayUsingComparator:", v13, v17, v18, v19, v20));
    v15 = v7->_homes;
    v7->_homes = (NSArray *)v14;
  }

  return v5;
}

- (BOOL)isReady
{
  return 1;
}

- (id)roomsForHome:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue([a3 homeKitObject]);
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___TVSKTapToSetupHomeKitHome);
  id v5 = v3;
  v6 = v5;
  if (v4)
  {
    if ((objc_opt_isKindOfClass(v5, v4) & 1) != 0) {
      v7 = v6;
    }
    else {
      v7 = 0LL;
    }
  }

  else
  {
    v7 = 0LL;
  }

  id v8 = v7;

  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 rooms]);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "bs_map:", &stru_1000CA5A0));

  v11 = sub_10002B4D0();
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue([v10 sortedArrayUsingComparator:v12]);

  return v13;
}

- (id)roomWithName:(id)a3 inHome:(id)a4
{
  id v6 = a3;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  id v7 = (id)objc_claimAutoreleasedReturnValue(-[SATVAirplay2TapToSetupDataSource roomsForHome:](self, "roomsForHome:", a4));
  id v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v16;
    while (2)
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v7);
        }
        v11 = *(void **)(*((void *)&v15 + 1) + 8LL * (void)i);
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "name", (void)v15));
        unsigned int v13 = [v12 isEqualToString:v6];

        if (v13)
        {
          id v8 = v11;
          goto LABEL_11;
        }
      }

      id v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }

- (id)homeTheaterSpeakersInRoom:(id)a3 inHome:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = objc_opt_class(&OBJC_CLASS___SATVAirplay2TapToSetupDataSourceObject);
  id v8 = v6;
  uint64_t v9 = v8;
  if (v7)
  {
    if ((objc_opt_isKindOfClass(v8, v7) & 1) != 0) {
      v10 = v9;
    }
    else {
      v10 = 0LL;
    }
  }

  else
  {
    v10 = 0LL;
  }

  id v11 = v10;

  v12 = (void *)objc_claimAutoreleasedReturnValue([v11 homeKitObject]);
  uint64_t v13 = objc_opt_class(&OBJC_CLASS___TVSKTapToSetupHomeKitHome);
  id v14 = v12;
  __int128 v15 = v14;
  if (v13)
  {
    if ((objc_opt_isKindOfClass(v14, v13) & 1) != 0) {
      __int128 v16 = v15;
    }
    else {
      __int128 v16 = 0LL;
    }
  }

  else
  {
    __int128 v16 = 0LL;
  }

  id v17 = v16;

  if (v17)
  {
    __int128 v47 = 0u;
    __int128 v48 = 0u;
    __int128 v45 = 0u;
    __int128 v46 = 0u;
    __int128 v18 = (void *)objc_claimAutoreleasedReturnValue([v17 rooms]);
    id v19 = [v18 countByEnumeratingWithState:&v45 objects:v50 count:16];
    if (v19)
    {
      id v20 = v19;
      id v38 = v17;
      id v39 = v11;
      v40 = v9;
      uint64_t v21 = *(void *)v46;
LABEL_14:
      uint64_t v22 = 0LL;
      while (1)
      {
        if (*(void *)v46 != v21) {
          objc_enumerationMutation(v18);
        }
        objc_super v23 = *(void **)(*((void *)&v45 + 1) + 8 * v22);
        v24 = (void *)objc_claimAutoreleasedReturnValue([v23 uniqueIdentifier]);
        v25 = (void *)objc_claimAutoreleasedReturnValue([v24 UUIDString]);
        v26 = (void *)objc_claimAutoreleasedReturnValue([v5 uniqueIdentifier]);
        unsigned __int8 v27 = [v25 isEqualToString:v26];

        if ((v27 & 1) != 0) {
          break;
        }
        if (v20 == (id)++v22)
        {
          id v20 = [v18 countByEnumeratingWithState:&v45 objects:v50 count:16];
          if (v20) {
            goto LABEL_14;
          }
          id v28 = 0LL;
          id v29 = v18;
          goto LABEL_30;
        }
      }

      id v29 = v23;

      if (v29)
      {
        v30 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
        __int128 v41 = 0u;
        __int128 v42 = 0u;
        __int128 v43 = 0u;
        __int128 v44 = 0u;
        v31 = (void *)objc_claimAutoreleasedReturnValue([v29 homeTheaterSpeakers]);
        id v32 = [v31 countByEnumeratingWithState:&v41 objects:v49 count:16];
        if (v32)
        {
          id v33 = v32;
          uint64_t v34 = *(void *)v42;
          do
          {
            for (i = 0LL; i != v33; i = (char *)i + 1)
            {
              if (*(void *)v42 != v34) {
                objc_enumerationMutation(v31);
              }
              v36 = -[SATVAirplay2TapToSetupHomeTheaterSpeaker initWithHomeTheaterSpeaker:]( objc_alloc(&OBJC_CLASS___SATVAirplay2TapToSetupHomeTheaterSpeaker),  "initWithHomeTheaterSpeaker:",  *(void *)(*((void *)&v41 + 1) + 8LL * (void)i));
              -[NSMutableArray addObject:](v30, "addObject:", v36);
            }

            id v33 = [v31 countByEnumeratingWithState:&v41 objects:v49 count:16];
          }

          while (v33);
        }

        id v28 = -[NSMutableArray copy](v30, "copy");
LABEL_30:
        id v11 = v39;
        uint64_t v9 = v40;
        id v17 = v38;
        goto LABEL_33;
      }

      id v28 = 0LL;
      id v11 = v39;
      uint64_t v9 = v40;
      id v17 = v38;
    }

    else
    {
      id v28 = 0LL;
      id v29 = v18;
LABEL_33:
    }
  }

  else
  {
    id v28 = 0LL;
  }

  return v28;
}

- (NSString)description
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[BSDescriptionBuilder builderWithObject:]( &OBJC_CLASS___BSDescriptionBuilder,  "builderWithObject:",  self));
  id v4 =  objc_msgSend( v3,  "appendBool:withName:",  -[SATVAirplay2TapToSetupDataSource isReady](self, "isReady"),  @"ready");
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SATVAirplay2TapToSetupDataSource homes](self, "homes"));
  [v3 appendArraySection:v5 withName:@"homes" skipIfEmpty:0];

  id v6 = (void *)objc_claimAutoreleasedReturnValue([v3 build]);
  return (NSString *)v6;
}

- (NSArray)homes
{
  return self->_homes;
}

- (SATVAirplay2DataSourceObject)preferredHome
{
  return self->_preferredHome;
}

- (void).cxx_destruct
{
}

@end
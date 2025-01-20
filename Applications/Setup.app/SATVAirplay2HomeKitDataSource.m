@interface SATVAirplay2HomeKitDataSource
+ (BOOL)isHomeKitAvailable;
+ (id)_errorWithCode:(int64_t)a3 underlyingError:(id)a4;
+ (void)_moveOrAddLocalAccessoryToRoom:(id)a3 inHome:(id)a4 completionHandler:(id)a5;
+ (void)_moveOrAddLocalAccessoryToRoomWithName:(id)a3 inHome:(id)a4 completionHandler:(id)a5;
- (BOOL)isReady;
- (BOOL)isUpdatingAvailable;
- (NSArray)homes;
- (NSHashTable)observers;
- (NSString)description;
- (SATVAirplay2DataSourceObject)preferredHome;
- (SATVAirplay2HomeKitDataSource)init;
- (id)homeTheaterSpeakersInRoom:(id)a3 inHome:(id)a4;
- (id)roomWithName:(id)a3 inHome:(id)a4;
- (id)roomsForHome:(id)a3;
- (void)_notifyDataSourceDidUpdate;
- (void)_notifyObserversWithBlock:(id)a3;
- (void)_resetCachedState;
- (void)_updateReadyStateAndNotify:(BOOL)a3;
- (void)addObserver:(id)a3;
- (void)dealloc;
- (void)moveOrAddLocalAccessoryToRoomNamed:(id)a3 inHome:(id)a4 completionHandler:(id)a5;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)removeObserver:(id)a3;
- (void)setHomes:(id)a3;
- (void)setObservers:(id)a3;
- (void)setPreferredHome:(id)a3;
- (void)setReady:(BOOL)a3;
- (void)updateLocalAccessoryAudioDestinationWithHomeTheaterSpeaker:(id)a3 completionHandler:(id)a4;
@end

@implementation SATVAirplay2HomeKitDataSource

- (SATVAirplay2HomeKitDataSource)init
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___SATVAirplay2HomeKitDataSource;
  v2 = -[SATVAirplay2HomeKitDataSource init](&v7, "init");
  if (v2)
  {
    uint64_t v3 = objc_claimAutoreleasedReturnValue(+[NSHashTable weakObjectsHashTable](&OBJC_CLASS___NSHashTable, "weakObjectsHashTable"));
    observers = v2->_observers;
    v2->_observers = (NSHashTable *)v3;

    v5 = (void *)objc_claimAutoreleasedReturnValue(+[TVCSHomeManager sharedInstance](&OBJC_CLASS___TVCSHomeManager, "sharedInstance"));
    [v5 addObserver:v2 forKeyPath:@"homeConfigurationState" options:5 context:off_100108860];
    -[SATVAirplay2HomeKitDataSource _updateReadyStateAndNotify:](v2, "_updateReadyStateAndNotify:", 0LL);
  }

  return v2;
}

- (void)dealloc
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[TVCSHomeManager sharedInstance](&OBJC_CLASS___TVCSHomeManager, "sharedInstance"));
  [v3 removeObserver:self forKeyPath:@"homeConfigurationState" context:off_100108860];
  if (self->_ready)
  {
    [v3 removeObserver:self forKeyPath:@"localAccessory" context:off_100108868];
    [v3 removeObserver:self forKeyPath:@"allOwnedHomes" context:off_100108870];
  }

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___SATVAirplay2HomeKitDataSource;
  -[SATVAirplay2HomeKitDataSource dealloc](&v4, "dealloc");
}

+ (BOOL)isHomeKitAvailable
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[TVCSHomeManager sharedInstance](&OBJC_CLASS___TVCSHomeManager, "sharedInstance"));
  BOOL v3 = (char *)[v2 homeConfigurationState] - 2 < (char *)3;

  return v3;
}

- (NSArray)homes
{
  if (objc_msgSend((id)objc_opt_class(self, a2), "isHomeKitAvailable"))
  {
    homes = self->_homes;
    if (!homes)
    {
      objc_super v4 = (void *)objc_claimAutoreleasedReturnValue(+[TVCSHomeManager sharedInstance](&OBJC_CLASS___TVCSHomeManager, "sharedInstance"));
      v5 = (void *)objc_claimAutoreleasedReturnValue([v4 allOwnedHomes]);
      v6 = (void *)objc_claimAutoreleasedReturnValue([v4 localAccessory]);
      objc_super v7 = (void *)objc_claimAutoreleasedReturnValue([v6 home]);

      preferredHome = self->_preferredHome;
      self->_preferredHome = 0LL;

      v20 = _NSConcreteStackBlock;
      uint64_t v21 = 3221225472LL;
      v22 = sub_10001BA50;
      v23 = &unk_1000C97F0;
      id v24 = v7;
      v25 = self;
      id v9 = v7;
      v10 = (NSArray *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "bs_map:", &v20));
      v11 = self->_homes;
      self->_homes = v10;

      v12 = self->_homes;
      v13 = sub_10002B4D0();
      v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
      v15 = (NSArray *)objc_claimAutoreleasedReturnValue( -[NSArray sortedArrayUsingComparator:]( v12,  "sortedArrayUsingComparator:",  v14,  v20,  v21,  v22,  v23));
      v16 = self->_homes;
      self->_homes = v15;

      homes = self->_homes;
    }

    return homes;
  }

  else
  {
    id v18 = sub_10002B004();
    v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v27 = "-[SATVAirplay2HomeKitDataSource homes]";
      _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "%s: HomeKit is not available. Returning empty array of homes.",  buf,  0xCu);
    }

    return (NSArray *)&__NSArray0__struct;
  }

- (id)roomsForHome:(id)a3
{
  id v3 = a3;
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___SATVAirplay2HomeKitDataSourceHome, v4);
  id v6 = v3;
  objc_super v7 = v6;
  if (v5)
  {
    if ((objc_opt_isKindOfClass(v6, v5) & 1) != 0) {
      v8 = v7;
    }
    else {
      v8 = 0LL;
    }
  }

  else
  {
    v8 = 0LL;
  }

  id v9 = v8;

  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue([v9 home]);
    v11 = (void *)objc_claimAutoreleasedReturnValue([v10 rooms]);
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "bs_map:", &stru_1000C9830));

    v13 = sub_10002B4D0();
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue([v12 sortedArrayUsingComparator:v14]);
  }

  else
  {
    v15 = 0LL;
  }

  return v15;
}

- (id)roomWithName:(id)a3 inHome:(id)a4
{
  id v6 = a3;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  id v7 = (id)objc_claimAutoreleasedReturnValue(-[SATVAirplay2HomeKitDataSource roomsForHome:](self, "roomsForHome:", a4));
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
  id v61 = a3;
  id v5 = a4;
  uint64_t v7 = objc_opt_class(&OBJC_CLASS___SATVAirplay2HomeKitDataSourceHome, v6);
  id v8 = v5;
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

  v12 = (void *)objc_claimAutoreleasedReturnValue([v11 home]);
  unsigned int v13 = v12;
  if (v12)
  {
    __int128 v79 = 0u;
    __int128 v80 = 0u;
    __int128 v77 = 0u;
    __int128 v78 = 0u;
    v14 = (void *)objc_claimAutoreleasedReturnValue([v12 rooms]);
    id v15 = [v14 countByEnumeratingWithState:&v77 objects:v84 count:16];
    if (!v15) {
      goto LABEL_50;
    }
    v59 = v9;
    v60 = v13;
    id v58 = v11;
    uint64_t v16 = *(void *)v78;
LABEL_9:
    uint64_t v17 = 0LL;
    while (1)
    {
      if (*(void *)v78 != v16) {
        objc_enumerationMutation(v14);
      }
      __int128 v18 = *(void **)(*((void *)&v77 + 1) + 8 * v17);
      v19 = (void *)objc_claimAutoreleasedReturnValue([v18 hmRoom]);
      v20 = (void *)objc_claimAutoreleasedReturnValue([v19 uniqueIdentifier]);
      uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v20 UUIDString]);
      v22 = (void *)objc_claimAutoreleasedReturnValue([v61 uniqueIdentifier]);
      unsigned __int8 v23 = [v21 isEqualToString:v22];

      if ((v23 & 1) != 0) {
        break;
      }
      if (v15 == (id)++v17)
      {
        id v15 = [v14 countByEnumeratingWithState:&v77 objects:v84 count:16];
        if (!v15)
        {
          id v11 = v58;
          uint64_t v9 = v59;
          unsigned int v13 = v60;
          goto LABEL_50;
        }

        goto LABEL_9;
      }
    }

    id v24 = v18;

    if (v24)
    {
      id v57 = v24;
      v25 = (void *)objc_claimAutoreleasedReturnValue([v24 hmRoom]);
      v26 = (void *)objc_claimAutoreleasedReturnValue([v25 accessories]);
      v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "bs_filter:", &stru_1000C9870));

      v27 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
      __int128 v73 = 0u;
      __int128 v74 = 0u;
      __int128 v75 = 0u;
      __int128 v76 = 0u;
      v28 = (void *)objc_claimAutoreleasedReturnValue([v60 hmHome]);
      v29 = (void *)objc_claimAutoreleasedReturnValue([v28 mediaSystems]);

      id obj = v29;
      id v30 = [v29 countByEnumeratingWithState:&v73 objects:v83 count:16];
      if (v30)
      {
        id v31 = v30;
        uint64_t v63 = *(void *)v74;
        do
        {
          for (i = 0LL; i != v31; i = (char *)i + 1)
          {
            if (*(void *)v74 != v63) {
              objc_enumerationMutation(obj);
            }
            v33 = *(void **)(*((void *)&v73 + 1) + 8LL * (void)i);
            __int128 v69 = 0u;
            __int128 v70 = 0u;
            __int128 v71 = 0u;
            __int128 v72 = 0u;
            v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "components", v56));
            id v35 = [v34 countByEnumeratingWithState:&v69 objects:v82 count:16];
            if (v35)
            {
              id v36 = v35;
              uint64_t v37 = *(void *)v70;
              do
              {
                for (j = 0LL; j != v36; j = (char *)j + 1)
                {
                  if (*(void *)v70 != v37) {
                    objc_enumerationMutation(v34);
                  }
                  v40 = (void *)objc_claimAutoreleasedReturnValue([v39 accessory]);

                  v41 = (void *)objc_claimAutoreleasedReturnValue([v40 uniqueIdentifier]);
                  if (v41) {
                    -[NSMutableDictionary setObject:forKey:](v27, "setObject:forKey:", v33, v41);
                  }
                }

                id v36 = [v34 countByEnumeratingWithState:&v69 objects:v82 count:16];
              }

              while (v36);
            }
          }

          id v31 = [obj countByEnumeratingWithState:&v73 objects:v83 count:16];
        }

        while (v31);
      }

      v64 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
      v42 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
      __int128 v65 = 0u;
      __int128 v66 = 0u;
      __int128 v67 = 0u;
      __int128 v68 = 0u;
      id v43 = v56;
      id v44 = [v43 countByEnumeratingWithState:&v65 objects:v81 count:16];
      if (v44)
      {
        id v45 = v44;
        uint64_t v46 = *(void *)v66;
        do
        {
          for (k = 0LL; k != v45; k = (char *)k + 1)
          {
            if (*(void *)v66 != v46) {
              objc_enumerationMutation(v43);
            }
            v48 = *(void **)(*((void *)&v65 + 1) + 8LL * (void)k);
            v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "uniqueIdentifier", v56));
            v50 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v27, "objectForKey:", v49));
            v51 = v50;
            if (v50)
            {
              v52 = (SATVAirplay2HomeKitHomeTheaterSpeaker *)objc_claimAutoreleasedReturnValue([v50 uniqueIdentifier]);
              if (v52 && (-[NSMutableSet containsObject:](v42, "containsObject:", v52) & 1) == 0)
              {
                -[NSMutableSet addObject:](v42, "addObject:", v52);
                id v53 = v51;

LABEL_45:
                v52 = -[SATVAirplay2HomeKitHomeTheaterSpeaker initWithMediaDestination:]( objc_alloc(&OBJC_CLASS___SATVAirplay2HomeKitHomeTheaterSpeaker),  "initWithMediaDestination:",  v53);
                -[NSMutableArray addObject:](v64, "addObject:", v52);
              }

              else
              {
                id v53 = 0LL;
              }

              goto LABEL_47;
            }

            id v53 = v48;
            if (v53) {
              goto LABEL_45;
            }
LABEL_47:
          }

          id v45 = [v43 countByEnumeratingWithState:&v65 objects:v81 count:16];
        }

        while (v45);
      }

      id v15 = -[NSMutableArray copy](v64, "copy");
      id v11 = v58;
      uint64_t v9 = v59;
      unsigned int v13 = v60;
      v14 = v57;
LABEL_50:
    }

    else
    {
      id v15 = 0LL;
      id v11 = v58;
      uint64_t v9 = v59;
      unsigned int v13 = v60;
    }
  }

  else
  {
    id v15 = 0LL;
  }

  id v54 = objc_msgSend(v15, "copy", v56);

  return v54;
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[SATVAirplay2HomeKitDataSource observers](self, "observers"));
  [v5 addObject:v4];
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[SATVAirplay2HomeKitDataSource observers](self, "observers"));
  [v5 removeObject:v4];
}

- (BOOL)isUpdatingAvailable
{
  return objc_msgSend((id)objc_opt_class(self, a2), "isHomeKitAvailable");
}

- (void)moveOrAddLocalAccessoryToRoomNamed:(id)a3 inHome:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472LL;
  v33[2] = sub_10001C68C;
  v33[3] = &unk_1000C9898;
  id v10 = a5;
  id v34 = v10;
  id v11 = objc_retainBlock(v33);
  uint64_t v13 = objc_opt_class(&OBJC_CLASS___SATVAirplay2HomeKitDataSourceHome, v12);
  id v14 = v9;
  id v15 = v14;
  if (v13)
  {
    if ((objc_opt_isKindOfClass(v14, v13) & 1) != 0) {
      uint64_t v16 = v15;
    }
    else {
      uint64_t v16 = 0LL;
    }
  }

  else
  {
    uint64_t v16 = 0LL;
  }

  id v17 = v16;

  __int128 v18 = (void *)objc_claimAutoreleasedReturnValue([v17 home]);
  if (v18)
  {
    objc_msgSend( (id)objc_opt_class(self, v19),  "_moveOrAddLocalAccessoryToRoomWithName:inHome:completionHandler:",  v8,  v18,  v10);
  }

  else
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[TVCSHomeManager sharedInstance](&OBJC_CLASS___TVCSHomeManager, "sharedInstance"));
    id v21 = [v20 homeConfigurationState];

    id v22 = sub_10002B004();
    unsigned __int8 v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
    BOOL v24 = os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT);
    if (v21 == (id)3)
    {
      if (v24)
      {
        *(_DWORD *)buf = 136315138;
        id v36 = "-[SATVAirplay2HomeKitDataSource moveOrAddLocalAccessoryToRoomNamed:inHome:completionHandler:]";
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "%s: Creating default home.", buf, 0xCu);
      }

      v25 = (void *)objc_claimAutoreleasedReturnValue(+[TVCSHomeManager sharedInstance](&OBJC_CLASS___TVCSHomeManager, "sharedInstance"));
      v29[0] = _NSConcreteStackBlock;
      v29[1] = 3221225472LL;
      v29[2] = sub_10001C6A0;
      v29[3] = &unk_1000C98C0;
      v29[4] = self;
      id v30 = v8;
      id v31 = v10;
      v32 = v11;
      [v25 createDefaultHomeWithCompletionHandler:v29];
    }

    else
    {
      if (v24)
      {
        *(_DWORD *)buf = 136315138;
        id v36 = "-[SATVAirplay2HomeKitDataSource moveOrAddLocalAccessoryToRoomNamed:inHome:completionHandler:]";
        _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEFAULT,  "%s: HomeKit became unavailable after making the request",  buf,  0xCu);
      }

      id v27 = objc_msgSend((id)objc_opt_class(self, v26), "_errorWithCode:underlyingError:", 2, 0);
      v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
      ((void (*)(void *, void *))v11[2])(v11, v28);
    }
  }
}

- (void)updateLocalAccessoryAudioDestinationWithHomeTheaterSpeaker:(id)a3 completionHandler:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = sub_10002B004();
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v25 = "-[SATVAirplay2HomeKitDataSource updateLocalAccessoryAudioDestinationWithHomeTheaterSpeaker:completionHandler:]";
    __int16 v26 = 2112;
    id v27 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "%s: Attempting to update local accessory audio destination. homeTheaterSpeaker=%@",  buf,  0x16u);
  }

  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472LL;
  v22[2] = sub_10001C94C;
  v22[3] = &unk_1000C9910;
  id v9 = v6;
  id v23 = v9;
  id v10 = objc_retainBlock(v22);
  uint64_t v12 = objc_opt_class(&OBJC_CLASS___SATVAirplay2HomeKitHomeTheaterSpeaker, v11);
  id v13 = v5;
  id v14 = v13;
  if (v12)
  {
    if ((objc_opt_isKindOfClass(v13, v12) & 1) != 0) {
      id v15 = v14;
    }
    else {
      id v15 = 0LL;
    }
  }

  else
  {
    id v15 = 0LL;
  }

  id v16 = v15;

  id v17 = (void *)objc_claimAutoreleasedReturnValue(+[TVCSHomeManager sharedInstance](&OBJC_CLASS___TVCSHomeManager, "sharedInstance"));
  __int128 v18 = (void *)objc_claimAutoreleasedReturnValue([v16 mediaDestination]);
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472LL;
  v20[2] = sub_10001C9E0;
  v20[3] = &unk_1000C9938;
  id v21 = v10;
  uint64_t v19 = v10;
  [v17 updateLocalAccessoryAudioDestination:v18 forceUpdateWithUnavailableDestination:1 completionHandler:v20];
}

- (NSString)description
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue( +[BSDescriptionBuilder builderWithObject:]( &OBJC_CLASS___BSDescriptionBuilder,  "builderWithObject:",  self));
  id v4 =  objc_msgSend( v3,  "appendBool:withName:",  -[SATVAirplay2HomeKitDataSource isReady](self, "isReady"),  @"ready");
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SATVAirplay2HomeKitDataSource homes](self, "homes"));
  [v3 appendArraySection:v5 withName:@"homes" skipIfEmpty:0];

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[SATVAirplay2HomeKitDataSource preferredHome](self, "preferredHome"));
  id v7 = [v3 appendObject:v6 withName:@"preferredHome"];

  id v8 = (void *)objc_claimAutoreleasedReturnValue([v3 build]);
  return (NSString *)v8;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (off_100108860 == a6)
  {
    id v14 = sub_10002B004();
    id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      id v16 = (void *)objc_claimAutoreleasedReturnValue(+[TVCSHomeManager sharedInstance](&OBJC_CLASS___TVCSHomeManager, "sharedInstance"));
      uint64_t v17 = TVCSHomeConfigurationStateToString([v16 homeConfigurationState]);
      __int128 v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
      *(_DWORD *)buf = 136315394;
      id v21 = "-[SATVAirplay2HomeKitDataSource observeValueForKeyPath:ofObject:change:context:]";
      __int16 v22 = 2114;
      id v23 = v18;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "%s: Home configuration state did change. home configuration state: %{public}@",  buf,  0x16u);
    }

    -[SATVAirplay2HomeKitDataSource _updateReadyStateAndNotify:](self, "_updateReadyStateAndNotify:", 1LL);
  }

  else if (off_100108868 == a6 || off_100108870 == a6)
  {
    -[SATVAirplay2HomeKitDataSource _resetCachedState](self, "_resetCachedState");
    -[SATVAirplay2HomeKitDataSource _notifyDataSourceDidUpdate](self, "_notifyDataSourceDidUpdate");
  }

  else
  {
    v19.receiver = self;
    v19.super_class = (Class)&OBJC_CLASS___SATVAirplay2HomeKitDataSource;
    -[SATVAirplay2HomeKitDataSource observeValueForKeyPath:ofObject:change:context:]( &v19,  "observeValueForKeyPath:ofObject:change:context:",  v10,  v11,  v12,  a6);
  }
}

- (void)_resetCachedState
{
}

- (void)_notifyObserversWithBlock:(id)a3
{
  id v4 = (void (**)(id, void))a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SATVAirplay2HomeKitDataSource observers](self, "observers"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 allObjects]);

  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  id v7 = v6;
  id v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      id v11 = 0LL;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        v4[2](v4, *(void *)(*((void *)&v12 + 1) + 8LL * (void)v11));
        id v11 = (char *)v11 + 1;
      }

      while (v9 != v11);
      id v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }

    while (v9);
  }
}

- (void)_notifyDataSourceDidUpdate
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472LL;
  v2[2] = sub_10001CEDC;
  v2[3] = &unk_1000C9960;
  v2[4] = self;
  -[SATVAirplay2HomeKitDataSource _notifyObserversWithBlock:](self, "_notifyObserversWithBlock:", v2);
}

- (void)_updateReadyStateAndNotify:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[TVCSHomeManager sharedInstance](&OBJC_CLASS___TVCSHomeManager, "sharedInstance"));
  unint64_t v6 = (unint64_t)[v5 homeConfigurationState];
  if (v6 > 7)
  {
LABEL_7:
    if (!-[SATVAirplay2HomeKitDataSource isReady](self, "isReady")) {
      goto LABEL_11;
    }
    [v5 stopBrowsingForLocalAccessory];
    [v5 removeObserver:self forKeyPath:@"localAccessory" context:off_100108868];
    [v5 removeObserver:self forKeyPath:@"allOwnedHomes" context:off_100108870];
    uint64_t v7 = 0LL;
    goto LABEL_9;
  }

  if (((1LL << v6) & 0xD8) == 0)
  {
    if (v6 == 2) {
      [v5 startBrowsingForLocalAccessory];
    }
    goto LABEL_7;
  }

  if (-[SATVAirplay2HomeKitDataSource isReady](self, "isReady")) {
    goto LABEL_11;
  }
  [v5 stopBrowsingForLocalAccessory];
  uint64_t v7 = 1LL;
  [v5 addObserver:self forKeyPath:@"localAccessory" options:1 context:off_100108868];
  [v5 addObserver:self forKeyPath:@"allOwnedHomes" options:1 context:off_100108870];
LABEL_9:
  -[SATVAirplay2HomeKitDataSource _resetCachedState](self, "_resetCachedState");
  -[SATVAirplay2HomeKitDataSource setReady:](self, "setReady:", v7);
  if (v3)
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_10001D0A4;
    v8[3] = &unk_1000C9988;
    v8[4] = self;
    char v9 = v7;
    -[SATVAirplay2HomeKitDataSource _notifyObserversWithBlock:](self, "_notifyObserversWithBlock:", v8);
  }

+ (void)_moveOrAddLocalAccessoryToRoomWithName:(id)a3 inHome:(id)a4 completionHandler:(id)a5
{
  id v8 = a4;
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472LL;
  v23[2] = sub_10001D2B4;
  v23[3] = &unk_1000C9898;
  id v9 = a5;
  id v24 = v9;
  id v10 = a3;
  id v11 = objc_retainBlock(v23);
  id v12 = sub_10002B004();
  __int128 v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    __int16 v26 = "+[SATVAirplay2HomeKitDataSource _moveOrAddLocalAccessoryToRoomWithName:inHome:completionHandler:]";
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%s: Creating new room.", buf, 0xCu);
  }

  __int128 v14 = (void *)objc_claimAutoreleasedReturnValue(+[TVCSHomeManager sharedInstance](&OBJC_CLASS___TVCSHomeManager, "sharedInstance"));
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_10001D2C8;
  v18[3] = &unk_1000C99B0;
  id v19 = v8;
  id v20 = v9;
  id v21 = v11;
  id v22 = a1;
  __int128 v15 = v11;
  id v16 = v9;
  id v17 = v8;
  [v14 createRoomNamed:v10 inHome:v17 completionHandler:v18];
}

+ (void)_moveOrAddLocalAccessoryToRoom:(id)a3 inHome:(id)a4 completionHandler:(id)a5
{
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_10001D4FC;
  v17[3] = &unk_1000C9898;
  id v18 = a5;
  id v7 = v18;
  id v8 = a4;
  id v9 = a3;
  id v10 = objc_retainBlock(v17);
  id v11 = sub_10002B004();
  id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    id v20 = "+[SATVAirplay2HomeKitDataSource _moveOrAddLocalAccessoryToRoom:inHome:completionHandler:]";
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%s: Configuring local accessory.", buf, 0xCu);
  }

  __int128 v13 = (void *)objc_claimAutoreleasedReturnValue(+[TVCSHomeManager sharedInstance](&OBJC_CLASS___TVCSHomeManager, "sharedInstance"));
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_10001D510;
  v15[3] = &unk_1000C9898;
  id v16 = v10;
  __int128 v14 = v10;
  [v13 moveOrAddLocalAccessoryToRoom:v9 inHome:v8 completionHandler:v15];
}

+ (id)_errorWithCode:(int64_t)a3 underlyingError:(id)a4
{
  if (a4)
  {
    id v5 = a4;
    unint64_t v6 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    -[NSMutableDictionary bs_setSafeObject:forKey:](v6, "bs_setSafeObject:forKey:", v5, NSUnderlyingErrorKey);
    id v7 = (void *)objc_claimAutoreleasedReturnValue( +[TVCSHomeKitErrorUtilities localizedMessageForHomeKitError:]( &OBJC_CLASS___TVCSHomeKitErrorUtilities,  "localizedMessageForHomeKitError:",  v5));

    -[NSMutableDictionary bs_setSafeObject:forKey:](v6, "bs_setSafeObject:forKey:", v7, NSLocalizedDescriptionKey);
    id v8 = -[NSMutableDictionary copy](v6, "copy");
  }

  else
  {
    id v8 = 0LL;
  }

  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.purplebuddy.Airplay2DataSource",  a3,  v8));

  return v9;
}

- (void)setHomes:(id)a3
{
}

- (SATVAirplay2DataSourceObject)preferredHome
{
  return self->_preferredHome;
}

- (void)setPreferredHome:(id)a3
{
}

- (BOOL)isReady
{
  return self->_ready;
}

- (void)setReady:(BOOL)a3
{
  self->_ready = a3;
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
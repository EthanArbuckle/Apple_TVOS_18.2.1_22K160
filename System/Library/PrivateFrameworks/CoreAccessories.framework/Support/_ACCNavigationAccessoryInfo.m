@interface _ACCNavigationAccessoryInfo
- (BOOL)componentStarted:(id)a3;
- (NSDictionary)componentList;
- (NSString)accessoryUID;
- (_ACCNavigationAccessoryInfo)initWithUID:(id)a3 componentList:(id)a4;
- (id)componentIdList;
- (id)description;
- (id)startedComponentList;
- (unint64_t)componentOptions:(id)a3;
- (void)assignComponentList:(id)a3;
- (void)componentIdList;
- (void)dealloc;
- (void)setAccessoryUID:(id)a3;
- (void)setComponent:(id)a3 options:(unint64_t)a4;
- (void)setComponent:(id)a3 started:(BOOL)a4;
- (void)setComponentList:(id)a3;
- (void)startedComponentList;
@end

@implementation _ACCNavigationAccessoryInfo

- (_ACCNavigationAccessoryInfo)initWithUID:(id)a3 componentList:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS____ACCNavigationAccessoryInfo;
  v9 = -[_ACCNavigationAccessoryInfo init](&v13, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_accessoryUID, a3);
    componentList = v10->_componentList;
    v10->_componentList = 0LL;

    -[_ACCNavigationAccessoryInfo assignComponentList:](v10, "assignComponentList:", v8);
  }

  return v10;
}

- (void)dealloc
{
  accessoryUID = self->_accessoryUID;
  self->_accessoryUID = 0LL;

  componentList = self->_componentList;
  self->_componentList = 0LL;

  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS____ACCNavigationAccessoryInfo;
  -[_ACCNavigationAccessoryInfo dealloc](&v5, "dealloc");
}

- (id)description
{
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<_ACCNavigationAccessoryInfo>[%@; %lu components]",
           self->_accessoryUID,
           -[NSDictionary count](self->_componentList, "count"));
}

- (void)assignComponentList:(id)a3
{
  id v4 = a3;
  objc_super v5 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v15 + 1) + 8LL * (void)i);
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKey:", ACCNav_DispComp_ComponentID, (void)v15));
        if (v12)
        {
          id v13 = [v11 mutableCopy];
          -[NSMutableDictionary setObject:forKey:](v5, "setObject:forKey:", v13, v12);
        }
      }

      id v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }

    while (v8);
  }

  componentList = self->_componentList;
  self->_componentList = &v5->super;
}

- (void)setComponent:(id)a3 options:(unint64_t)a4
{
  id v6 = a3;
  if (gLogObjects) {
    BOOL v7 = gNumLogObjects < 5;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    uint64_t v9 = (os_log_s *)&_os_log_default;
    id v8 = &_os_log_default;
  }

  else
  {
    uint64_t v9 = (os_log_s *)*(id *)(gLogObjects + 32);
  }

  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    componentList = self->_componentList;
    int v13 = 138412802;
    id v14 = v6;
    __int16 v15 = 2048;
    unint64_t v16 = a4;
    __int16 v17 = 2112;
    __int128 v18 = componentList;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEBUG,  "[#Navigation] _ACCNavigationAccessoryInfo: setComponent: %@ options: %llxh, comopnentList %@",  (uint8_t *)&v13,  0x20u);
  }

  if (v6)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKey:](self->_componentList, "objectForKey:", v6));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a4));
    [v10 setObject:v11 forKey:__kComponentOptionsKey];
  }
}

- (unint64_t)componentOptions:(id)a3
{
  if (!a3) {
    return 0LL;
  }
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKey:](self->_componentList, "objectForKey:"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:__kComponentOptionsKey]);
  id v5 = [v4 unsignedLongLongValue];

  return (unint64_t)v5;
}

- (void)setComponent:(id)a3 started:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (gLogObjects) {
    BOOL v7 = gNumLogObjects < 5;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    uint64_t v9 = (os_log_s *)&_os_log_default;
    id v8 = &_os_log_default;
  }

  else
  {
    uint64_t v9 = (os_log_s *)*(id *)(gLogObjects + 32);
  }

  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    componentList = self->_componentList;
    int v13 = 138412802;
    id v14 = v6;
    __int16 v15 = 1024;
    BOOL v16 = v4;
    __int16 v17 = 2112;
    __int128 v18 = componentList;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEBUG,  "[#Navigation] _ACCNavigationAccessoryInfo: setComponent: %@ started: %d, comopnentList %@",  (uint8_t *)&v13,  0x1Cu);
  }

  if (v6)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKey:](self->_componentList, "objectForKey:", v6));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v4));
    [v10 setObject:v11 forKey:__kComponentStartedKey];
  }
}

- (BOOL)componentStarted:(id)a3
{
  if (!a3) {
    return 0;
  }
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKey:](self->_componentList, "objectForKey:"));
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:__kComponentStartedKey]);
  unsigned __int8 v5 = [v4 BOOLValue];

  return v5;
}

- (id)startedComponentList
{
  v3 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary allValues](self->_componentList, "allValues", 0LL));
  id v5 = [v4 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v21;
    do
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v21 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v20 + 1) + 8LL * (void)i);
        v10 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKey:__kComponentStartedKey]);
      }

      id v6 = [v4 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }

    while (v6);
  }

  if (gLogObjects && gNumLogObjects >= 5)
  {
    v11 = (os_log_s *)*(id *)(gLogObjects + 32);
  }

  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    v11 = (os_log_s *)&_os_log_default;
    id v12 = &_os_log_default;
  }

  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    -[_ACCNavigationAccessoryInfo startedComponentList].cold.1((uint64_t)v3, v11, v13, v14, v15, v16, v17, v18);
  }

  return v3;
}

- (id)componentIdList
{
  v3 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary allValues](self->_componentList, "allValues", 0LL));
  id v5 = [v4 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v20;
    do
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v20 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( [*(id *)(*((void *)&v19 + 1) + 8 * (void)i) objectForKey:ACCNav_DispComp_ComponentID]);
        if (v9) {
          -[NSMutableArray addObject:](v3, "addObject:", v9);
        }
      }

      id v6 = [v4 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }

    while (v6);
  }

  if (gLogObjects && gNumLogObjects >= 5)
  {
    v10 = (os_log_s *)*(id *)(gLogObjects + 32);
  }

  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    v10 = (os_log_s *)&_os_log_default;
    id v11 = &_os_log_default;
  }

  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    -[_ACCNavigationAccessoryInfo componentIdList].cold.1((uint64_t)v3, v10, v12, v13, v14, v15, v16, v17);
  }

  return v3;
}

- (NSString)accessoryUID
{
  return self->_accessoryUID;
}

- (void)setAccessoryUID:(id)a3
{
}

- (NSDictionary)componentList
{
  return self->_componentList;
}

- (void)setComponentList:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)startedComponentList
{
}

- (void)componentIdList
{
}

@end
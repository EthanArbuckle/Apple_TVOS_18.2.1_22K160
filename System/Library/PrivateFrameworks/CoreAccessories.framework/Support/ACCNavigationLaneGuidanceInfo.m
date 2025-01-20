@interface ACCNavigationLaneGuidanceInfo
+ (id)keyForType:(unsigned __int16)a3;
- (ACCNavigationLaneGuidanceInfo)init;
- (BOOL)_checkDataClassForType:(unsigned __int16)a3 data:(id)a4;
- (BOOL)setInfo:(unsigned __int16)a3 data:(id)a4;
- (NSMutableDictionary)infoDict;
- (id)copyDictionary;
- (id)copyInfo:(unsigned __int16)a3;
- (void)setInfoDict:(id)a3;
@end

@implementation ACCNavigationLaneGuidanceInfo

- (ACCNavigationLaneGuidanceInfo)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___ACCNavigationLaneGuidanceInfo;
  v2 = -[ACCNavigationLaneGuidanceInfo init](&v6, "init");
  if (v2)
  {
    v3 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    infoDict = v2->_infoDict;
    v2->_infoDict = v3;
  }

  return v2;
}

- (BOOL)_checkDataClassForType:(unsigned __int16)a3 data:(id)a4
{
  unsigned int v4 = a3;
  id v5 = a4;
  if (v4 < 2)
  {
    objc_super v6 = (objc_class *)&OBJC_CLASS___NSNumber;
    goto LABEL_7;
  }

  if (v4 == 2)
  {
    objc_super v6 = (objc_class *)&OBJC_CLASS___NSArray;
    goto LABEL_7;
  }

  if (v4 == 3)
  {
    objc_super v6 = &OBJC_CLASS___NSString;
LABEL_7:
    uint64_t v7 = objc_opt_class(v6);
    char isKindOfClass = objc_opt_isKindOfClass(v5, v7);
    goto LABEL_8;
  }

  if (gLogObjects && gNumLogObjects >= 1)
  {
    v10 = (os_log_s *)*(id *)gLogObjects;
  }

  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    v10 = (os_log_s *)&_os_log_default;
    id v11 = &_os_log_default;
  }

  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v12[0] = 67109120;
    v12[1] = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "[#Navigation] ERROR: Unknown LaneGuidanceInfoUpdate InfoType %d",  (uint8_t *)v12,  8u);
  }

  char isKindOfClass = 0;
LABEL_8:

  return isKindOfClass & 1;
}

- (id)copyInfo:(unsigned __int16)a3
{
  unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue( +[ACCNavigationLaneGuidanceInfo keyForType:]( &OBJC_CLASS___ACCNavigationLaneGuidanceInfo,  "keyForType:",  a3));
  if (v4)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_infoDict, "objectForKey:", v4));
    id v6 = [v5 copy];
  }

  else
  {
    id v6 = 0LL;
  }

  return v6;
}

- (BOOL)setInfo:(unsigned __int16)a3 data:(id)a4
{
  uint64_t v4 = a3;
  id v6 = a4;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[ACCNavigationLaneGuidanceInfo keyForType:]( &OBJC_CLASS___ACCNavigationLaneGuidanceInfo,  "keyForType:",  v4));
  if (v7 && -[ACCNavigationLaneGuidanceInfo _checkDataClassForType:data:](self, "_checkDataClassForType:data:", v4, v6))
  {
    -[NSMutableDictionary setObject:forKey:](self->_infoDict, "setObject:forKey:", v6, v7);
    BOOL v8 = 1;
  }

  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (id)copyDictionary
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithDictionary:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithDictionary:",  self->_infoDict));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKey:ACCNav_LGIUpdate_LaneInfo]);
  if (v3)
  {
    uint64_t v4 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    __int128 v12 = 0u;
    __int128 v13 = 0u;
    __int128 v14 = 0u;
    __int128 v15 = 0u;
    id v5 = v3;
    id v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v13;
      do
      {
        v9 = 0LL;
        do
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v5);
          }
          id v10 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * (void)v9), "copyDictionary", (void)v12);
          -[NSMutableArray addObject:](v4, "addObject:", v10);

          v9 = (char *)v9 + 1;
        }

        while (v7 != v9);
        id v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }

      while (v7);
    }

    [v2 setObject:v4 forKey:ACCNav_LGIUpdate_LaneInfo];
  }

  return v2;
}

+ (id)keyForType:(unsigned __int16)a3
{
  if (a3 == 3)
  {
    uint64_t v4 = &ACCNav_LGIUpdate_InstructionText;
    goto LABEL_7;
  }

  int v3 = a3;
  if (a3 == 2)
  {
    uint64_t v4 = &ACCNav_LGIUpdate_LaneInfo;
    goto LABEL_7;
  }

  if (a3 == 1)
  {
    uint64_t v4 = &ACCNav_LGIUpdate_LaneGuidanceIndex;
LABEL_7:
    id v5 = *v4;
    return v5;
  }

  if (gLogObjects) {
    BOOL v6 = gNumLogObjects < 1;
  }
  else {
    BOOL v6 = 1;
  }
  if (v6)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    uint64_t v8 = (os_log_s *)&_os_log_default;
    id v7 = &_os_log_default;
  }

  else
  {
    uint64_t v8 = (os_log_s *)*(id *)gLogObjects;
  }

  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v10[0] = 67109120;
    v10[1] = v3;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "[#Navigation] ERROR: Unknown LaneGuidanceInfoUpdate InfoType %d",  (uint8_t *)v10,  8u);
  }

  id v5 = 0LL;
  return v5;
}

- (NSMutableDictionary)infoDict
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 8LL, 1);
}

- (void)setInfoDict:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
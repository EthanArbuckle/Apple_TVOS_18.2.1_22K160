@interface ACCNavigationRoadObjectRoadSignInfo
+ (id)keyForType:(unsigned __int16)a3;
- (ACCNavigationRoadObjectRoadSignInfo)init;
- (BOOL)_checkDataClassForType:(unsigned __int16)a3 data:(id)a4;
- (BOOL)setInfo:(unsigned __int16)a3 data:(id)a4;
- (NSMutableDictionary)infoDict;
- (id)copyDictionary;
- (id)copyInfo:(unsigned __int16)a3;
- (id)description;
- (void)setInfoDict:(id)a3;
- (void)setInfoFromDictionary:(id)a3;
@end

@implementation ACCNavigationRoadObjectRoadSignInfo

- (ACCNavigationRoadObjectRoadSignInfo)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___ACCNavigationRoadObjectRoadSignInfo;
  v2 = -[ACCNavigationRoadObjectRoadSignInfo init](&v6, "init");
  if (v2)
  {
    v3 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    infoDict = v2->_infoDict;
    v2->_infoDict = v3;
  }

  return v2;
}

- (id)description
{
  id v3 = -[ACCNavigationRoadObjectRoadSignInfo copyInfo:](self, "copyInfo:", 0LL);
  id v4 = -[ACCNavigationRoadObjectRoadSignInfo copyInfo:](self, "copyInfo:", 1LL);
  id v5 = -[ACCNavigationRoadObjectRoadSignInfo copyInfo:](self, "copyInfo:", 2LL);
  id v6 = -[ACCNavigationRoadObjectRoadSignInfo copyInfo:](self, "copyInfo:", 3LL);
  id v7 = -[ACCNavigationRoadObjectRoadSignInfo copyInfo:](self, "copyInfo:", 4LL);
  id v8 = -[ACCNavigationRoadObjectRoadSignInfo copyInfo:](self, "copyInfo:", 5LL);
  v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<ACCNavigationRoadObjectRoadSignInfo: ID %@, state %@, type %@, value '%@', lateralOffset %@, forwardOffset %@>",  v3,  v4,  v5,  v6,  v7,  v8));

  return v9;
}

- (BOOL)_checkDataClassForType:(unsigned __int16)a3 data:(id)a4
{
  unsigned int v4 = a3;
  id v5 = a4;
  if (v4 > 5)
  {
    if (gLogObjects) {
      BOOL v10 = gNumLogObjects < 1;
    }
    else {
      BOOL v10 = 1;
    }
    if (v10)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        platform_connectionInfo_configStreamCategoryListReady_cold_1();
      }
      v12 = (os_log_s *)&_os_log_default;
      id v11 = &_os_log_default;
    }

    else
    {
      v12 = (os_log_s *)*(id *)gLogObjects;
    }

    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13[0] = 67109120;
      v13[1] = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "[#Navigation] ERROR: Unknown RoadObjectDetection:RoadSign InfoType %d",  (uint8_t *)v13,  8u);
    }

    char isKindOfClass = 0;
  }

  else
  {
    if (v4 == 3) {
      id v6 = &OBJC_CLASS___NSString;
    }
    else {
      id v6 = (objc_class *)&OBJC_CLASS___NSNumber;
    }
    uint64_t v7 = objc_opt_class(v6);
    char isKindOfClass = objc_opt_isKindOfClass(v5, v7);
  }

  return isKindOfClass & 1;
}

- (id)copyInfo:(unsigned __int16)a3
{
  unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue( +[ACCNavigationRoadObjectRoadSignInfo keyForType:]( &OBJC_CLASS___ACCNavigationRoadObjectRoadSignInfo,  "keyForType:",  a3));
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
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[ACCNavigationRoadObjectRoadSignInfo keyForType:]( &OBJC_CLASS___ACCNavigationRoadObjectRoadSignInfo,  "keyForType:",  v4));
  if (v7
    && -[ACCNavigationRoadObjectRoadSignInfo _checkDataClassForType:data:](self, "_checkDataClassForType:data:", v4, v6))
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

- (void)setInfoFromDictionary:(id)a3
{
  if (a3)
  {
    infoDict = self->_infoDict;
    id v5 = a3;
    -[NSMutableDictionary removeAllObjects](infoDict, "removeAllObjects");
    _setInfoFromDictionary(v5, self->_infoDict, ACCNav_RODUpdate_RoadSign_ID);
    _setInfoFromDictionary(v5, self->_infoDict, ACCNav_RODUpdate_RoadSign_State);
    _setInfoFromDictionary(v5, self->_infoDict, ACCNav_RODUpdate_RoadSign_Type);
    _setInfoFromDictionary(v5, self->_infoDict, ACCNav_RODUpdate_RoadSign_Value);
    _setInfoFromDictionary(v5, self->_infoDict, ACCNav_RODUpdate_RoadSign_LateralOffset);
    _setInfoFromDictionary(v5, self->_infoDict, ACCNav_RODUpdate_RoadSign_ForwardOffset);
  }

- (id)copyDictionary
{
  return (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithDictionary:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithDictionary:",  self->_infoDict));
}

+ (id)keyForType:(unsigned __int16)a3
{
  int v3 = a3;
  switch(a3)
  {
    case 0u:
      uint64_t v4 = &ACCNav_RODUpdate_RoadSign_ID;
      goto LABEL_16;
    case 1u:
      uint64_t v4 = &ACCNav_RODUpdate_RoadSign_State;
      goto LABEL_16;
    case 2u:
      uint64_t v4 = &ACCNav_RODUpdate_RoadSign_Type;
      goto LABEL_16;
    case 3u:
      uint64_t v4 = &ACCNav_RODUpdate_RoadSign_Value;
      goto LABEL_16;
    case 4u:
      uint64_t v4 = &ACCNav_RODUpdate_RoadSign_LateralOffset;
      goto LABEL_16;
    case 5u:
      uint64_t v4 = &ACCNav_RODUpdate_RoadSign_ForwardOffset;
LABEL_16:
      id result = *v4;
      break;
    default:
      if (gLogObjects) {
        BOOL v5 = gNumLogObjects < 1;
      }
      else {
        BOOL v5 = 1;
      }
      if (v5)
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          platform_connectionInfo_configStreamCategoryListReady_cold_1();
        }
        BOOL v8 = (os_log_s *)&_os_log_default;
        id v6 = &_os_log_default;
      }

      else
      {
        BOOL v8 = (os_log_s *)*(id *)gLogObjects;
      }

      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v9[0] = 67109120;
        v9[1] = v3;
        _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "[#Navigation] ERROR: Unknown RoadObjectDetectionInfo infoType %d",  (uint8_t *)v9,  8u);
      }

      id result = 0LL;
      break;
  }

  return result;
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
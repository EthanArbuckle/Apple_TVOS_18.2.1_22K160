@interface ACCNavigationRoadObjectRoadLaneInfo
+ (id)keyForType:(unsigned __int16)a3;
- (ACCNavigationRoadObjectRoadLaneInfo)init;
- (BOOL)_checkDataClassForType:(unsigned __int16)a3 data:(id)a4;
- (BOOL)setInfo:(unsigned __int16)a3 data:(id)a4;
- (NSMutableDictionary)infoDict;
- (id)copyDictionary;
- (id)copyInfo:(unsigned __int16)a3;
- (id)description;
- (void)setInfoDict:(id)a3;
- (void)setInfoFromDictionary:(id)a3;
@end

@implementation ACCNavigationRoadObjectRoadLaneInfo

- (ACCNavigationRoadObjectRoadLaneInfo)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___ACCNavigationRoadObjectRoadLaneInfo;
  v2 = -[ACCNavigationRoadObjectRoadLaneInfo init](&v6, "init");
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
  id v14 = -[ACCNavigationRoadObjectRoadLaneInfo copyInfo:](self, "copyInfo:", 0LL);
  id v3 = -[ACCNavigationRoadObjectRoadLaneInfo copyInfo:](self, "copyInfo:", 1LL);
  id v4 = -[ACCNavigationRoadObjectRoadLaneInfo copyInfo:](self, "copyInfo:", 2LL);
  id v5 = -[ACCNavigationRoadObjectRoadLaneInfo copyInfo:](self, "copyInfo:", 3LL);
  id v6 = -[ACCNavigationRoadObjectRoadLaneInfo copyInfo:](self, "copyInfo:", 4LL);
  id v7 = -[ACCNavigationRoadObjectRoadLaneInfo copyInfo:](self, "copyInfo:", 5LL);
  id v8 = -[ACCNavigationRoadObjectRoadLaneInfo copyInfo:](self, "copyInfo:", 6LL);
  id v9 = -[ACCNavigationRoadObjectRoadLaneInfo copyInfo:](self, "copyInfo:", 7LL);
  id v10 = -[ACCNavigationRoadObjectRoadLaneInfo copyInfo:](self, "copyInfo:", 8LL);
  id v11 = -[ACCNavigationRoadObjectRoadLaneInfo copyInfo:](self, "copyInfo:", 9LL);
  v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<ACCNavigationRoadObjectRoadLaneInfo: ID %@, state %@, type[left %@, right %@], color[left %@, right %@], width %@, curvature[center %@, left %@, right %@]>",  v14,  v3,  v4,  v5,  v6,  v7,  v8,  v9,  v10,  v11));

  return v12;
}

- (BOOL)_checkDataClassForType:(unsigned __int16)a3 data:(id)a4
{
  unsigned int v4 = a3;
  id v5 = a4;
  if (v4 > 9)
  {
    if (gLogObjects) {
      BOOL v8 = gNumLogObjects < 1;
    }
    else {
      BOOL v8 = 1;
    }
    if (v8)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        platform_connectionInfo_configStreamCategoryListReady_cold_1();
      }
      id v10 = (os_log_s *)&_os_log_default;
      id v9 = &_os_log_default;
    }

    else
    {
      id v10 = (os_log_s *)*(id *)gLogObjects;
    }

    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v12[0] = 67109120;
      v12[1] = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "[#Navigation] ERROR: Unknown RoadObjectDetection:RoadLane InfoType %d",  (uint8_t *)v12,  8u);
    }

    char isKindOfClass = 0;
  }

  else
  {
    uint64_t v6 = objc_opt_class(&OBJC_CLASS___NSNumber);
    char isKindOfClass = objc_opt_isKindOfClass(v5, v6);
  }

  return isKindOfClass & 1;
}

- (id)copyInfo:(unsigned __int16)a3
{
  unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue( +[ACCNavigationRoadObjectRoadLaneInfo keyForType:]( &OBJC_CLASS___ACCNavigationRoadObjectRoadLaneInfo,  "keyForType:",  a3));
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
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[ACCNavigationRoadObjectRoadLaneInfo keyForType:]( &OBJC_CLASS___ACCNavigationRoadObjectRoadLaneInfo,  "keyForType:",  v4));
  if (v7
    && -[ACCNavigationRoadObjectRoadLaneInfo _checkDataClassForType:data:](self, "_checkDataClassForType:data:", v4, v6))
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
    _setInfoFromDictionary(v5, self->_infoDict, ACCNav_RODUpdate_RoadLane_ID);
    _setInfoFromDictionary(v5, self->_infoDict, ACCNav_RODUpdate_RoadLane_State);
    _setInfoFromDictionary(v5, self->_infoDict, ACCNav_RODUpdate_RoadLane_TypeLeft);
    _setInfoFromDictionary(v5, self->_infoDict, ACCNav_RODUpdate_RoadLane_TypeRight);
    _setInfoFromDictionary(v5, self->_infoDict, ACCNav_RODUpdate_RoadLane_ColorLeft);
    _setInfoFromDictionary(v5, self->_infoDict, ACCNav_RODUpdate_RoadLane_ColorRight);
    _setInfoFromDictionary(v5, self->_infoDict, ACCNav_RODUpdate_RoadLane_Width);
    _setInfoFromDictionary(v5, self->_infoDict, ACCNav_RODUpdate_RoadLane_CurvatureCenter);
    _setInfoFromDictionary(v5, self->_infoDict, ACCNav_RODUpdate_RoadLane_CurvatureLeft);
    _setInfoFromDictionary(v5, self->_infoDict, ACCNav_RODUpdate_RoadLane_ColorRight);
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
      uint64_t v4 = &ACCNav_RODUpdate_RoadLane_ID;
      goto LABEL_19;
    case 1u:
      uint64_t v4 = &ACCNav_RODUpdate_RoadLane_State;
      goto LABEL_19;
    case 2u:
      uint64_t v4 = &ACCNav_RODUpdate_RoadLane_TypeLeft;
      goto LABEL_19;
    case 3u:
      uint64_t v4 = &ACCNav_RODUpdate_RoadLane_TypeRight;
      goto LABEL_19;
    case 4u:
      uint64_t v4 = &ACCNav_RODUpdate_RoadLane_ColorLeft;
      goto LABEL_19;
    case 5u:
    case 9u:
      uint64_t v4 = &ACCNav_RODUpdate_RoadLane_ColorRight;
      goto LABEL_19;
    case 6u:
      uint64_t v4 = &ACCNav_RODUpdate_RoadLane_Width;
      goto LABEL_19;
    case 7u:
      uint64_t v4 = &ACCNav_RODUpdate_RoadLane_CurvatureCenter;
      goto LABEL_19;
    case 8u:
      uint64_t v4 = &ACCNav_RODUpdate_RoadLane_CurvatureLeft;
LABEL_19:
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
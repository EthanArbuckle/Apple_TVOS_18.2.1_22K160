@interface ACCNavigationLaneGuidanceLaneInfo
+ (id)keyForType:(unsigned __int16)a3;
- (ACCNavigationLaneGuidanceLaneInfo)init;
- (BOOL)_checkDataClassForType:(unsigned __int16)a3 data:(id)a4;
- (BOOL)setInfo:(unsigned __int16)a3 data:(id)a4;
- (NSMutableDictionary)infoDict;
- (id)copyDictionary;
- (id)copyInfo:(unsigned __int16)a3;
- (void)setInfoDict:(id)a3;
@end

@implementation ACCNavigationLaneGuidanceLaneInfo

- (ACCNavigationLaneGuidanceLaneInfo)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___ACCNavigationLaneGuidanceLaneInfo;
  v2 = -[ACCNavigationLaneGuidanceLaneInfo init](&v6, "init");
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
  if (v4 < 2) {
    goto LABEL_4;
  }
  if (v4 == 2)
  {
    objc_super v6 = &OBJC_CLASS___NSArray;
    goto LABEL_6;
  }

  if (v4 == 3)
  {
LABEL_4:
    objc_super v6 = &OBJC_CLASS___NSNumber;
LABEL_6:
    uint64_t v7 = objc_opt_class(v6);
    char isKindOfClass = objc_opt_isKindOfClass(v5, v7);
    goto LABEL_7;
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
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "[#Navigation] ERROR: Unknown LaneGuidanceInfoUpdate:LaneInfo InfoType %d",  (uint8_t *)v12,  8u);
  }

  char isKindOfClass = 0;
LABEL_7:

  return isKindOfClass & 1;
}

- (id)copyInfo:(unsigned __int16)a3
{
  unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue( +[ACCNavigationLaneGuidanceLaneInfo keyForType:]( &OBJC_CLASS___ACCNavigationLaneGuidanceLaneInfo,  "keyForType:",  a3));
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
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[ACCNavigationLaneGuidanceLaneInfo keyForType:]( &OBJC_CLASS___ACCNavigationLaneGuidanceLaneInfo,  "keyForType:",  v4));
  if (v7
    && -[ACCNavigationLaneGuidanceLaneInfo _checkDataClassForType:data:](self, "_checkDataClassForType:data:", v4, v6))
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
  return (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithDictionary:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithDictionary:",  self->_infoDict));
}

+ (id)keyForType:(unsigned __int16)a3
{
  int v3 = a3;
  switch(a3)
  {
    case 0u:
      uint64_t v4 = &ACCNav_LGIUpdate_LaneInfo_Index;
      goto LABEL_14;
    case 1u:
      uint64_t v4 = &ACCNav_LGIUpdate_LaneInfo_Status;
      goto LABEL_14;
    case 2u:
      uint64_t v4 = &ACCNav_LGIUpdate_LaneInfo_Angle;
      goto LABEL_14;
    case 3u:
      uint64_t v4 = &ACCNav_LGIUpdate_LaneInfo_AngleHighlight;
LABEL_14:
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
        _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "[#Navigation] ERROR: Unknown LaneGuidanceInfoUpdate:LaneInfo InfoType %d",  (uint8_t *)v9,  8u);
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
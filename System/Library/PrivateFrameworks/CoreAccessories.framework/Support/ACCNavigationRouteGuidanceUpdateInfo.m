@interface ACCNavigationRouteGuidanceUpdateInfo
+ (id)keyForChargingStationInfoType:(unsigned __int16)a3;
+ (id)keyForType:(unsigned __int16)a3;
- (ACCNavigationRouteGuidanceUpdateInfo)init;
- (BOOL)_checkDataClassForType:(unsigned __int16)a3 data:(id)a4;
- (BOOL)setInfo:(unsigned __int16)a3 data:(id)a4;
- (NSMutableDictionary)infoDict;
- (id)copyDictionary;
- (id)copyInfo:(unsigned __int16)a3;
- (void)setInfoDict:(id)a3;
@end

@implementation ACCNavigationRouteGuidanceUpdateInfo

- (ACCNavigationRouteGuidanceUpdateInfo)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___ACCNavigationRouteGuidanceUpdateInfo;
  v2 = -[ACCNavigationRouteGuidanceUpdateInfo init](&v6, "init");
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
  if (v4 > 0x1A)
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
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "[#Navigation] ERROR: Unknown RouteGuidnaceUpdate InfoType %d",  (uint8_t *)v13,  8u);
    }

    char isKindOfClass = 0;
  }

  else
  {
    if (((1 << v4) & 0x777D6E7) != 0)
    {
      objc_super v6 = (objc_class *)&OBJC_CLASS___NSNumber;
    }

    else if (((1 << v4) & 0x80918) != 0)
    {
      objc_super v6 = &OBJC_CLASS___NSString;
    }

    else
    {
      objc_super v6 = (objc_class *)&OBJC_CLASS___NSArray;
    }

    uint64_t v7 = objc_opt_class(v6);
    char isKindOfClass = objc_opt_isKindOfClass(v5, v7);
  }

  return isKindOfClass & 1;
}

- (id)copyInfo:(unsigned __int16)a3
{
  unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue( +[ACCNavigationRouteGuidanceUpdateInfo keyForType:]( &OBJC_CLASS___ACCNavigationRouteGuidanceUpdateInfo,  "keyForType:",  a3));
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
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[ACCNavigationRouteGuidanceUpdateInfo keyForType:]( &OBJC_CLASS___ACCNavigationRouteGuidanceUpdateInfo,  "keyForType:",  v4));
  if (v7
    && -[ACCNavigationRouteGuidanceUpdateInfo _checkDataClassForType:data:]( self,  "_checkDataClassForType:data:",  v4,  v6))
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
  switch(a3)
  {
    case 1u:
      v3 = &ACCNav_RGUpdate_RouteGuidanceState;
      goto LABEL_36;
    case 2u:
      v3 = &ACCNav_RGUpdate_ManeuverState;
      goto LABEL_36;
    case 3u:
      v3 = &ACCNav_RGUpdate_CurrentRoadName;
      goto LABEL_36;
    case 4u:
      v3 = &ACCNav_RGUpdate_DestinationName;
      goto LABEL_36;
    case 5u:
      v3 = &ACCNav_RGUpdate_EstimatedTimeOfArrival;
      goto LABEL_36;
    case 6u:
      v3 = &ACCNav_RGUpdate_TimeRemainingToDestination;
      goto LABEL_36;
    case 7u:
      v3 = &ACCNav_RGUpdate_DistanceRemaining;
      goto LABEL_36;
    case 8u:
      v3 = &ACCNav_RGUpdate_DistanceRemainingDisplayString;
      goto LABEL_36;
    case 9u:
      v3 = &ACCNav_RGUpdate_DistanceRemainingDisplayUnits;
      goto LABEL_36;
    case 0xAu:
      v3 = &ACCNav_RGUpdate_DistanceRemainingToNextManeuver;
      goto LABEL_36;
    case 0xBu:
      v3 = &ACCNav_RGUpdate_DistanceRemainingToNextManeuverDisplayString;
      goto LABEL_36;
    case 0xCu:
      v3 = &ACCNav_RGUpdate_DistanceRemainingToNextManeuverDisplayUnits;
      goto LABEL_36;
    case 0xDu:
      v3 = &ACCNav_RGUpdate_RouteGuidanceManeuverCurrentList;
      goto LABEL_36;
    case 0xEu:
      v3 = &ACCNav_RGUpdate_RouteGuidanceManeuverCount;
      goto LABEL_36;
    case 0xFu:
      v3 = &ACCNav_RGUpdate_RouteGuidanceBeingShownInApp;
      goto LABEL_36;
    case 0x10u:
      v3 = &ACCNav_RGUpdate_LaneGuidanceCurrentIndex;
      goto LABEL_36;
    case 0x11u:
      v3 = &ACCNav_RGUpdate_LaneGuidanceTotalCount;
      goto LABEL_36;
    case 0x12u:
      v3 = &ACCNav_RGUpdate_LaneGuidanceShowing;
      goto LABEL_36;
    case 0x13u:
      v3 = &ACCNav_RGUpdate_SourceName;
      goto LABEL_36;
    case 0x14u:
      v3 = &ACCNav_RGUpdate_SourceSupportsRouteGuidance;
      goto LABEL_36;
    case 0x15u:
      v3 = &ACCNav_RGUpdate_DestinationTimeZoneOffsetMinutes;
      goto LABEL_36;
    case 0x16u:
      v3 = &ACCNav_RGUpdate_StopType;
      goto LABEL_36;
    case 0x17u:
      v3 = &ACCNav_RGUpdate_ChargingStationInfoList;
      goto LABEL_36;
    case 0x18u:
      v3 = &ACCNav_RGUpdate_ArrivalBatteryLevel;
      goto LABEL_36;
    case 0x19u:
      v3 = &ACCNav_RGUpdate_DepartureBatteryLevel;
      goto LABEL_36;
    case 0x1Au:
      v3 = &ACCNav_RGUpdate_FinalWaypointBatteryLevel;
LABEL_36:
      id result = *v3;
      break;
    default:
      int v4 = a3;
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
        v9[1] = v4;
        _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "[#Navigation] ERROR: Unknown RouteGuidnaceUpdate InfoType %d",  (uint8_t *)v9,  8u);
      }

      id result = 0LL;
      break;
  }

  return result;
}

+ (id)keyForChargingStationInfoType:(unsigned __int16)a3
{
  if (a3 == 2)
  {
    int v4 = &ACCNav_RGUpdate_ChargingStationInfo_Power;
    goto LABEL_7;
  }

  int v3 = a3;
  if (a3 == 1)
  {
    int v4 = &ACCNav_RGUpdate_ChargingStationInfo_Voltage;
    goto LABEL_7;
  }

  if (!a3)
  {
    int v4 = &ACCNav_RGUpdate_ChargingStationInfo_ConnectorType;
LABEL_7:
    BOOL v5 = *v4;
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
    BOOL v8 = (os_log_s *)&_os_log_default;
    id v7 = &_os_log_default;
  }

  else
  {
    BOOL v8 = (os_log_s *)*(id *)gLogObjects;
  }

  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v10[0] = 67109120;
    v10[1] = v3;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "[#Navigation] ERROR: Unknown RouteGuidnaceUpdate CharginStation InfoType %d",  (uint8_t *)v10,  8u);
  }

  BOOL v5 = 0LL;
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
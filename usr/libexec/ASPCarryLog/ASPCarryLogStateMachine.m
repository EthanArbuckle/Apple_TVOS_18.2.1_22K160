@interface ASPCarryLogStateMachine
- (ASPCarryLogStateMachine)initWithStateManager:(id)a3 TaskingManager:(id)a4 NANDDriver:(id)a5 UploadDriver:(id)a6 WorkDirectory:(id)a7;
- (BOOL)_DATaskingNotInHist;
- (BOOL)_activeLegacyTaskingDisabled;
- (BOOL)_activeTaskingExpired;
- (BOOL)_canInspectNewDATasking;
- (BOOL)_canJoinTaskingPerStatsDriver:(id)a3;
- (BOOL)_checkSnBuildVariantMatch;
- (BOOL)_curTaskingisActiveOnServer;
- (BOOL)_hasActiveTasking;
- (BOOL)_hasPendingDSReplyTasking;
- (BOOL)_isAfterTaskingInspectionCoolDown;
- (BOOL)_passDATaskingCriteria:(id)a3;
- (BOOL)isInternal;
- (BOOL)isInternalBuild;
- (BOOL)isLegacyUI_IOLogEnabled;
- (BOOL)isLegacyUI_TaskingDisabled;
- (CarryLog_NANDDriver)nandDriver;
- (CarryLog_UploadDriver)uploadDriver;
- (NSMutableArray)taskingIdHistory;
- (NSMutableDictionary)currentTaskingInfo;
- (NSString)DATaskingID;
- (NSString)workDir;
- (StateMgr)stateMgr;
- (TaskingManager)DATaskingMgr;
- (id)_genUniqueDeviceId;
- (id)_getDeviceId;
- (int64_t)taskingDuration;
- (int64_t)taskingSizeLimit;
- (void)_addDATaskingToHist;
- (void)_checkLegacyUI;
- (void)_cleanUpAfterTasking;
- (void)_cleanUpWorkDir;
- (void)_deleteUploadInfo;
- (void)_markDATaskingDSReply_Pending;
- (void)_markTaskingActive;
- (void)_resetDaemonUserDefaults;
- (void)_setNextTaskingInspectionMinTime;
- (void)_tryActivateTasking;
- (void)_unmarkCurrentTasking;
- (void)bootCheck;
- (void)dailyCheckWithStatsProvider:(id)a3;
- (void)setCurrentTaskingInfo:(id)a3;
- (void)setDATaskingID:(id)a3;
- (void)setDATaskingMgr:(id)a3;
- (void)setIsInternal:(BOOL)a3;
- (void)setIsLegacyUI_IOLogEnabled:(BOOL)a3;
- (void)setIsLegacyUI_TaskingDisabled:(BOOL)a3;
- (void)setNandDriver:(id)a3;
- (void)setStateMgr:(id)a3;
- (void)setTaskingDuration:(int64_t)a3;
- (void)setTaskingIdHistory:(id)a3;
- (void)setTaskingSizeLimit:(int64_t)a3;
- (void)setUploadDriver:(id)a3;
- (void)setWorkDir:(id)a3;
@end

@implementation ASPCarryLogStateMachine

- (ASPCarryLogStateMachine)initWithStateManager:(id)a3 TaskingManager:(id)a4 NANDDriver:(id)a5 UploadDriver:(id)a6 WorkDirectory:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v30 = a6;
  id v29 = a7;
  v32.receiver = self;
  v32.super_class = (Class)&OBJC_CLASS___ASPCarryLogStateMachine;
  v16 = -[ASPCarryLogStateMachine init](&v32, "init");
  if (!v16) {
    goto LABEL_20;
  }
  id v28 = v15;
  v17 = (void *)objc_claimAutoreleasedReturnValue([v13 getValueForKey:@"tasking_id_history" expectedType:3]);
  v18 = (void *)objc_claimAutoreleasedReturnValue([v13 getValueForKey:@"current_tasking_info" expectedType:2]);
  v16->_isInternal = checkInternalBuild(v13);
  objc_storeStrong((id *)&v16->_stateMgr, a3);
  if ((validateCurTaskingInfo(v18) & 1) == 0)
  {

    [v13 deleteKey:@"current_tasking_info"];
    v18 = 0LL;
  }

  *(_WORD *)&v16->_isLegacyUI_IOLogEnabled = 0;
  -[ASPCarryLogStateMachine _checkLegacyUI](v16, "_checkLegacyUI");
  if (v18) {
    v19 = -[NSMutableDictionary initWithDictionary:copyItems:]( objc_alloc(&OBJC_CLASS___NSMutableDictionary),  "initWithDictionary:copyItems:",  v18,  1LL);
  }
  else {
    v19 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  }
  currentTaskingInfo = v16->_currentTaskingInfo;
  v16->_currentTaskingInfo = v19;

  if (v17) {
    v21 = -[NSMutableArray initWithArray:copyItems:]( objc_alloc(&OBJC_CLASS___NSMutableArray),  "initWithArray:copyItems:",  v17,  1LL);
  }
  else {
    v21 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  }
  taskingIdHistory = v16->_taskingIdHistory;
  v16->_taskingIdHistory = v21;

  objc_storeStrong((id *)&v16->_DATaskingMgr, a4);
  if (v16->_isLegacyUI_TaskingDisabled)
  {
    v16->_taskingDuration = -1LL;
    v16->_taskingSizeLimit = -1LL;
  }

  else
  {
    if (-[ASPCarryLogStateMachine isLegacyUI_IOLogEnabled](v16, "isLegacyUI_IOLogEnabled"))
    {
      *(_OWORD *)&v16->_taskingDuration = xmmword_1000851B0;
      DATaskingID = v16->_DATaskingID;
      v16->_DATaskingID = (NSString *)@"TASKING_LEGACY_INT_IOS";
      goto LABEL_17;
    }

    v16->_taskingDuration = (int64_t)[v14 getTaskingDurationInSeconds];
    v16->_taskingSizeLimit = (int64_t)[v14 getTaskingSizeLimitInBytes];
    if ((v16->_taskingDuration & 0x8000000000000000LL) == 0)
    {
      uint64_t v24 = objc_claimAutoreleasedReturnValue([v14 getTaskingID]);
      DATaskingID = v16->_DATaskingID;
      v16->_DATaskingID = (NSString *)v24;
      goto LABEL_17;
    }
  }

  DATaskingID = v16->_DATaskingID;
  v16->_DATaskingID = 0LL;
LABEL_17:

  objc_storeStrong((id *)&v16->_nandDriver, a5);
  objc_storeStrong((id *)&v16->_uploadDriver, a6);
  objc_storeStrong((id *)&v16->_workDir, a7);
  v25 = (os_log_s *)oslog;
  if (os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "ASPCarryLog state machine initialized",  buf,  2u);
  }

  v26 = v16;

  id v15 = v28;
LABEL_20:

  return v16;
}

- (BOOL)isInternalBuild
{
  return -[ASPCarryLogStateMachine isInternal](self, "isInternal");
}

- (void)_checkLegacyUI
{
  if (-[ASPCarryLogStateMachine isInternalBuild](self, "isInternalBuild"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLogStateMachine stateMgr](self, "stateMgr"));
    id v8 = (id)objc_claimAutoreleasedReturnValue( [v3 getValueForKey:@"enable_iolog_collection" inDomain:@"/var/mobile/Library/Preferences/com.apple.nandCarryLogs.plist" expectedType:1]);

    v4 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLogStateMachine stateMgr](self, "stateMgr"));
    v5 = (void *)objc_claimAutoreleasedReturnValue( [v4 getValueForKey:@"enable_iolog_tasking" inDomain:@"/var/mobile/Library/Preferences/com.apple.nandCarryLogs.plist" expectedType:1]);

    if (v8) {
      BOOL v6 = [v8 intValue] == 1;
    }
    else {
      BOOL v6 = 0LL;
    }
    -[ASPCarryLogStateMachine setIsLegacyUI_IOLogEnabled:](self, "setIsLegacyUI_IOLogEnabled:", v6);
    if (v5) {
      BOOL v7 = [v5 intValue] != 1;
    }
    else {
      BOOL v7 = 0LL;
    }
    -[ASPCarryLogStateMachine setIsLegacyUI_TaskingDisabled:](self, "setIsLegacyUI_TaskingDisabled:", v7);
  }

  else
  {
    -[ASPCarryLogStateMachine setIsLegacyUI_IOLogEnabled:](self, "setIsLegacyUI_IOLogEnabled:", 0LL);
    -[ASPCarryLogStateMachine setIsLegacyUI_TaskingDisabled:](self, "setIsLegacyUI_TaskingDisabled:", 0LL);
  }

- (id)_genUniqueDeviceId
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 UUIDString]);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLogStateMachine DATaskingID](self, "DATaskingID"));
  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 UUIDString]);
  v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@%@%@%@",  v4,  v5,  v6,  v8));

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString stringWithCapacity:](&OBJC_CLASS___NSMutableString, "stringWithCapacity:", 40LL));
  id v11 = v9;
  CC_SHA1([v11 UTF8String], (CC_LONG)objc_msgSend(v11, "length"), md);
  for (uint64_t i = 0LL; i != 20; ++i)
    objc_msgSend(v10, "appendFormat:", @"%02x", md[i]);
  id v13 = (void *)oslog;
  if (os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_DEFAULT))
  {
    id v14 = v13;
    id v15 = objc_claimAutoreleasedReturnValue(-[ASPCarryLogStateMachine DATaskingID](self, "DATaskingID"));
    *(_DWORD *)buf = 136315394;
    id v18 = [v15 UTF8String];
    __int16 v19 = 2080;
    id v20 = [v10 UTF8String];
    _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "TaskingId: %s, Generated unique deviceId: %s",  buf,  0x16u);
  }

  return v10;
}

- (id)_getDeviceId
{
  if (!-[ASPCarryLogStateMachine isInternalBuild](self, "isInternalBuild")
    || (id DeviceSerialNumber = getDeviceSerialNumber(),
        (v4 = (void *)objc_claimAutoreleasedReturnValue(DeviceSerialNumber)) == 0LL))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLogStateMachine _genUniqueDeviceId](self, "_genUniqueDeviceId"));
  }

  return v4;
}

- (BOOL)_hasActiveTasking
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLogStateMachine currentTaskingInfo](self, "currentTaskingInfo"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKeyedSubscript:@"dsreply_pending"]);
  unsigned __int8 v4 = [v3 isEqualToString:@"no"];

  return v4;
}

- (BOOL)_hasPendingDSReplyTasking
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLogStateMachine currentTaskingInfo](self, "currentTaskingInfo"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKeyedSubscript:@"dsreply_pending"]);
  unsigned __int8 v4 = [v3 isEqualToString:@"yes"];

  return v4;
}

- (void)_markDATaskingDSReply_Pending
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLogStateMachine currentTaskingInfo](self, "currentTaskingInfo"));
  unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLogStateMachine DATaskingID](self, "DATaskingID"));
  [v3 setValue:v4 forKey:@"id"];

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLogStateMachine currentTaskingInfo](self, "currentTaskingInfo"));
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithLongLong:",  -[ASPCarryLogStateMachine taskingSizeLimit](self, "taskingSizeLimit")));
  [v5 setValue:v6 forKey:@"upload_size_limit_bytes"];

  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLogStateMachine currentTaskingInfo](self, "currentTaskingInfo"));
  [v7 setValue:@"yes" forKey:@"dsreply_pending"];

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLogStateMachine currentTaskingInfo](self, "currentTaskingInfo"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLogStateMachine _getDeviceId](self, "_getDeviceId"));
  [v8 setValue:v9 forKey:@"device_id"];

  id v11 = (id)objc_claimAutoreleasedReturnValue(-[ASPCarryLogStateMachine stateMgr](self, "stateMgr"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLogStateMachine currentTaskingInfo](self, "currentTaskingInfo"));
  [v11 setValue:v10 forKey:@"current_tasking_info"];
}

- (void)_markTaskingActive
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSinceNow:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceNow:",  (double)-[ASPCarryLogStateMachine taskingDuration](self, "taskingDuration")));
  id v4 = DateTimeToStr(v3);
  id v20 = (id)objc_claimAutoreleasedReturnValue(v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLogStateMachine currentTaskingInfo](self, "currentTaskingInfo"));
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"id"]);

  BOOL v7 = uploadInfoKeyFromTaskingId((uint64_t)v6);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLogStateMachine currentTaskingInfo](self, "currentTaskingInfo"));
  [v9 setValue:v20 forKey:@"endtime"];

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLogStateMachine currentTaskingInfo](self, "currentTaskingInfo"));
  [v10 setValue:@"no" forKey:@"dsreply_pending"];

  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLogStateMachine currentTaskingInfo](self, "currentTaskingInfo"));
  v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithLongLong:",  -[ASPCarryLogStateMachine taskingSizeLimit](self, "taskingSizeLimit")));
  [v11 setValue:v12 forKey:@"upload_size_limit_bytes"];

  id v13 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLogStateMachine stateMgr](self, "stateMgr"));
  [v13 setValue:&off_1000BD150 forKey:v8];

  id v14 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLogStateMachine stateMgr](self, "stateMgr"));
  id v15 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLogStateMachine currentTaskingInfo](self, "currentTaskingInfo"));
  [v14 setValue:v15 forKey:@"current_tasking_info"];

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLogStateMachine stateMgr](self, "stateMgr"));
  id v17 = currentDateTimeStr();
  id v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
  [v16 setValue:v18 forKey:@"last_extract_time"];

  __int16 v19 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLogStateMachine stateMgr](self, "stateMgr"));
  setTaskingInfoToLegacyUIDomain( v19,  v6,  v20,  0LL,  @"None",  -[ASPCarryLogStateMachine isInternalBuild](self, "isInternalBuild"));
}

- (void)_unmarkCurrentTasking
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLogStateMachine currentTaskingInfo](self, "currentTaskingInfo"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"id"]);
  v5 = uploadInfoKeyFromTaskingId((uint64_t)v4);
  id v10 = (id)objc_claimAutoreleasedReturnValue(v5);

  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLogStateMachine stateMgr](self, "stateMgr"));
  [v6 deleteKey:v10];

  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLogStateMachine stateMgr](self, "stateMgr"));
  [v7 deleteKey:@"current_tasking_info"];

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLogStateMachine stateMgr](self, "stateMgr"));
  [v8 deleteKey:@"last_extract_time"];

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLogStateMachine currentTaskingInfo](self, "currentTaskingInfo"));
  [v9 removeAllObjects];
}

- (BOOL)_activeTaskingExpired
{
  if (!-[ASPCarryLogStateMachine isLegacyUI_TaskingDisabled](self, "isLegacyUI_TaskingDisabled")
    && !-[ASPCarryLogStateMachine _activeLegacyTaskingDisabled](self, "_activeLegacyTaskingDisabled"))
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLogStateMachine currentTaskingInfo](self, "currentTaskingInfo"));
    BOOL v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"endtime"]);
    id v7 = StringToDateTime(v6);
    id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLogStateMachine currentTaskingInfo](self, "currentTaskingInfo"));
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:@"upload_size_limit_bytes"]);

    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLogStateMachine currentTaskingInfo](self, "currentTaskingInfo"));
    v12 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:@"id"]);
    id v13 = uploadInfoKeyFromTaskingId((uint64_t)v12);
    id v14 = (void *)objc_claimAutoreleasedReturnValue(v13);

    id v15 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLogStateMachine stateMgr](self, "stateMgr"));
    v16 = (void *)objc_claimAutoreleasedReturnValue([v15 getValueForKey:v14 expectedType:2]);

    id v17 = (void *)objc_claimAutoreleasedReturnValue([v16 objectForKeyedSubscript:@"total_upload_size"]);
    id v18 = (void *)objc_claimAutoreleasedReturnValue([v16 objectForKeyedSubscript:@"enough_disk_space"]);
    if (!v8 || [v4 compare:v8] != (id)-1) {
      goto LABEL_6;
    }
    uint64_t v20 = objc_opt_class(&OBJC_CLASS___NSNumber);
    LOBYTE(v3) = 1;
    if ((objc_opt_isKindOfClass(v17, v20) & 1) == 0 || !v10) {
      goto LABEL_7;
    }
    id v21 = [v17 longLongValue];
    if ((uint64_t)v21 < (uint64_t)[v10 longLongValue]
      && (uint64_t v22 = objc_opt_class(&OBJC_CLASS___NSNumber), (objc_opt_isKindOfClass(v18, v22) & 1) != 0)
      && [v18 BOOLValue])
    {
      unsigned int v3 = !-[ASPCarryLogStateMachine _curTaskingisActiveOnServer](self, "_curTaskingisActiveOnServer");
    }

    else
    {
LABEL_6:
      LOBYTE(v3) = 1;
    }

- (BOOL)_curTaskingisActiveOnServer
{
  unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLogStateMachine currentTaskingInfo](self, "currentTaskingInfo"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"id"]);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLogStateMachine currentTaskingInfo](self, "currentTaskingInfo"));
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"device_id"]);

  BOOL v8 = 0;
  if (v4 && v6)
  {
    if (os_variant_has_internal_content("com.apple.ASPCarryLog", v7))
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLogStateMachine stateMgr](self, "stateMgr"));
      id v10 = (void *)objc_claimAutoreleasedReturnValue( [v9 getValueForKey:@"test_force_ds_reply_tasking_continue" expectedType:0]);

      if (v10
        && (id v11 = (void *)objc_claimAutoreleasedReturnValue([&off_1000BD178 objectForKey:v10]),
            v11,
            v11))
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue([&off_1000BD178 objectForKeyedSubscript:v10]);
        unsigned int v13 = [v12 unsignedIntValue];

        if (v13 != 3) {
          goto LABEL_10;
        }
      }

      else
      {
      }
    }

    id v14 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLogStateMachine uploadDriver](self, "uploadDriver"));
    unsigned int v13 = [v14 allowToContinueTaskingId:v4 DeviceId:v6];

LABEL_10:
    BOOL v8 = v13 != 0;
  }

  return v8;
}

- (BOOL)_activeLegacyTaskingDisabled
{
  if (-[ASPCarryLogStateMachine isInternalBuild](self, "isInternalBuild"))
  {
    unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLogStateMachine currentTaskingInfo](self, "currentTaskingInfo"));
    id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"id"]);

    else {
      LOBYTE(v5) = 0;
    }
  }

  else
  {
    LOBYTE(v5) = 0;
  }

  return v5;
}

- (BOOL)_DATaskingNotInHist
{
  unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLogStateMachine DATaskingID](self, "DATaskingID"));

  if (v3)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLogStateMachine taskingIdHistory](self, "taskingIdHistory"));
    unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLogStateMachine DATaskingID](self, "DATaskingID"));
    unsigned int v6 = [v4 containsObject:v5] ^ 1;
  }

  else
  {
    LOBYTE(v6) = 0;
  }

  uint64_t v7 = (os_log_s *)oslog;
  if (os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_DEBUG)) {
    sub_100042DE4(v3 == 0LL, v6, v7);
  }
  return v6;
}

- (BOOL)_isAfterTaskingInspectionCoolDown
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLogStateMachine stateMgr](self, "stateMgr"));
  unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue([v2 getValueForKey:@"next_tasking_inspection_time" expectedType:0]);

  if (v3)
  {
    id v4 = StringToDateTime(v3);
    unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
    unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    BOOL v7 = [v5 compare:v6] == (id)-1;
  }

  else
  {
    BOOL v7 = 1;
  }

  return v7;
}

- (void)_setNextTaskingInspectionMinTime
{
  id v6 = (id)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](&OBJC_CLASS___NSDate, "dateWithTimeIntervalSinceNow:", 2592000.0));
  unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLogStateMachine stateMgr](self, "stateMgr"));
  id v4 = DateTimeToStr(v6);
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  [v3 setValue:v5 forKey:@"next_tasking_inspection_time"];
}

- (BOOL)_canInspectNewDATasking
{
  if (-[ASPCarryLogStateMachine isInternalBuild](self, "isInternalBuild")) {
    goto LABEL_4;
  }
  BOOL v3 = -[ASPCarryLogStateMachine _isAfterTaskingInspectionCoolDown](self, "_isAfterTaskingInspectionCoolDown");
  if (v3)
  {
    -[ASPCarryLogStateMachine _setNextTaskingInspectionMinTime](self, "_setNextTaskingInspectionMinTime");
LABEL_4:
    LOBYTE(v3) = 1;
  }

  return v3;
}

- (BOOL)_passDATaskingCriteria:(id)a3
{
  id v4 = a3;
  if (-[ASPCarryLogStateMachine isLegacyUI_IOLogEnabled](self, "isLegacyUI_IOLogEnabled"))
  {
    unsigned int v5 = 1;
  }

  else
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLogStateMachine DATaskingMgr](self, "DATaskingMgr"));
    if (v6)
    {
      BOOL v7 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLogStateMachine DATaskingMgr](self, "DATaskingMgr"));
      unsigned int v5 = objc_msgSend( v7,  "evaluateTaskingCriteria:doWhiteListCheck:",  v4,  -[ASPCarryLogStateMachine isInternalBuild](self, "isInternalBuild") ^ 1);
    }

    else
    {
      unsigned int v5 = 0;
    }
  }

  BOOL v8 = (void *)oslog;
  if (os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_DEFAULT))
  {
    if (v5) {
      v9 = "PASS";
    }
    else {
      v9 = "FAIL";
    }
    id v10 = v8;
    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLogStateMachine DATaskingMgr](self, "DATaskingMgr"));
    id v12 = objc_claimAutoreleasedReturnValue([v11 getTaskingID]);
    int v14 = 136315394;
    id v15 = v9;
    __int16 v16 = 2080;
    id v17 = [v12 UTF8String];
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "%s criteria for tasking id %s",  (uint8_t *)&v14,  0x16u);
  }

  return v5;
}

- (void)_addDATaskingToHist
{
  if (!-[ASPCarryLogStateMachine isLegacyUI_IOLogEnabled](self, "isLegacyUI_IOLogEnabled"))
  {
    BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLogStateMachine taskingIdHistory](self, "taskingIdHistory"));
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLogStateMachine DATaskingID](self, "DATaskingID"));
    [v3 addObject:v4];

    unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLogStateMachine taskingIdHistory](self, "taskingIdHistory"));
    id v6 = [v5 count];

    if ((unint64_t)v6 >= 0xD)
    {
      do
      {
        BOOL v7 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLogStateMachine taskingIdHistory](self, "taskingIdHistory"));
        [v7 removeObjectAtIndex:0];

        BOOL v8 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLogStateMachine taskingIdHistory](self, "taskingIdHistory"));
        id v9 = [v8 count];
      }

      while ((unint64_t)v9 > 0xC);
    }

    id v11 = (id)objc_claimAutoreleasedReturnValue(-[ASPCarryLogStateMachine stateMgr](self, "stateMgr"));
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLogStateMachine taskingIdHistory](self, "taskingIdHistory"));
    [v11 setValue:v10 forKey:@"tasking_id_history"];
  }

- (BOOL)_canJoinTaskingPerStatsDriver:(id)a3
{
  id v4 = a3;
  BOOL v5 = -[ASPCarryLogStateMachine isInternalBuild](self, "isInternalBuild") || !diskFreeSpaceBelowLimit(0x80000000uLL);
  if (!-[ASPCarryLogStateMachine _DATaskingNotInHist](self, "_DATaskingNotInHist"))
  {
    LOBYTE(v5) = 0;
    goto LABEL_15;
  }

  if (-[ASPCarryLogStateMachine _canInspectNewDATasking](self, "_canInspectNewDATasking"))
  {
    if (!v5) {
      goto LABEL_13;
    }
    if (-[ASPCarryLogStateMachine _passDATaskingCriteria:](self, "_passDATaskingCriteria:", v4))
    {
      -[ASPCarryLogStateMachine _markDATaskingDSReply_Pending](self, "_markDATaskingDSReply_Pending");
      LOBYTE(v5) = 1;
      goto LABEL_13;
    }
  }

  else
  {
    id v6 = (os_log_s *)oslog;
    LOBYTE(v5) = 0;
    if (!os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_13;
    }
    LOWORD(v12) = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "DA tasking inspection at cool down",  (uint8_t *)&v12,  2u);
  }

  LOBYTE(v5) = 0;
LABEL_13:
  -[ASPCarryLogStateMachine _addDATaskingToHist](self, "_addDATaskingToHist");
  BOOL v7 = (void *)oslog;
  if (os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v8 = v7;
    id v9 = objc_claimAutoreleasedReturnValue(-[ASPCarryLogStateMachine DATaskingID](self, "DATaskingID"));
    id v10 = [v9 UTF8String];
    int v12 = 136315138;
    id v13 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "TaskingId %s added to history.\n",  (uint8_t *)&v12,  0xCu);
  }

- (void)_tryActivateTasking
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLogStateMachine currentTaskingInfo](self, "currentTaskingInfo"));
  id v4 = objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"id"]);
  id v5 = [v4 UTF8String];

  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLogStateMachine stateMgr](self, "stateMgr"));
  BOOL v8 = (void *)objc_claimAutoreleasedReturnValue([v7 getValueForKey:@"test_force_ds_reply" expectedType:0]);

  if (!v8
    || (id v9 = (void *)objc_claimAutoreleasedReturnValue([&off_1000BD1A0 objectForKey:v8]),
        v9,
        !v9))
  {

    goto LABEL_7;
  }

  id v10 = (void *)objc_claimAutoreleasedReturnValue([&off_1000BD1A0 objectForKeyedSubscript:v8]);
  int v11 = [v10 unsignedIntValue];

  if (v11 == 3)
  {
LABEL_7:
    int v12 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLogStateMachine uploadDriver](self, "uploadDriver"));
    id v13 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLogStateMachine currentTaskingInfo](self, "currentTaskingInfo"));
    int v14 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKeyedSubscript:@"id"]);
    id v15 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLogStateMachine currentTaskingInfo](self, "currentTaskingInfo"));
    __int16 v16 = (void *)objc_claimAutoreleasedReturnValue([v15 objectForKeyedSubscript:@"device_id"]);
    int v11 = [v12 allowToParticipateTaskingId:v14 DeviceId:v16];
  }

  if (v11)
  {
    if (v11 == 2)
    {
      __int16 v19 = (os_log_s *)oslog;
      if (os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_DEFAULT))
      {
        int v21 = 136315138;
        id v22 = v5;
        _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "DA taskingId %s pending decision server reply",  (uint8_t *)&v21,  0xCu);
      }
    }

    else if (v11 == 1)
    {
      id v17 = (os_log_s *)oslog;
      if (os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_DEFAULT))
      {
        int v21 = 136315138;
        id v22 = v5;
        _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "DA taskingId %s permitted by decision server",  (uint8_t *)&v21,  0xCu);
      }

      -[ASPCarryLogStateMachine registerIOLoggingXPCforInternalBuild:]( self,  "registerIOLoggingXPCforInternalBuild:",  -[ASPCarryLogStateMachine isInternalBuild](self, "isInternalBuild"));
      -[ASPCarryLogStateMachine _markTaskingActive](self, "_markTaskingActive");
    }

    else
    {
      uint64_t v20 = (os_log_s *)oslog;
      if (os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_ERROR)) {
        sub_100042E88((uint64_t)v5, v11, v20);
      }
    }
  }

  else
  {
    id v18 = (os_log_s *)oslog;
    if (os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_DEFAULT))
    {
      int v21 = 136315138;
      id v22 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "DA taskingId %s denied by decision server",  (uint8_t *)&v21,  0xCu);
    }

    -[ASPCarryLogStateMachine _unmarkCurrentTasking](self, "_unmarkCurrentTasking");
  }

- (void)_cleanUpAfterTasking
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLogStateMachine workDir](self, "workDir"));
  id v7 = (id)objc_claimAutoreleasedReturnValue([v3 stringByAppendingPathComponent:@"iolog.iolog"]);

  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLogStateMachine nandDriver](self, "nandDriver"));
  objc_msgSend(v4, "iolog_disable");

  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLogStateMachine nandDriver](self, "nandDriver"));
  objc_msgSend(v5, "iolog_export:max_export_size:", v7, 0);

  -[ASPCarryLogStateMachine _cleanUpWorkDir](self, "_cleanUpWorkDir");
  -[ASPCarryLogStateMachine _deleteUploadInfo](self, "_deleteUploadInfo");
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLogStateMachine stateMgr](self, "stateMgr"));
  [v6 deleteKey:@"extractupload_pendingfile"];
}

- (void)_cleanUpWorkDir
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLogStateMachine workDir](self, "workDir"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 stringByAppendingPathComponent:@"tar_in_process"]);

  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  if ([v5 fileExistsAtPath:v4])
  {
    __int128 v35 = 0u;
    __int128 v36 = 0u;
    __int128 v33 = 0u;
    __int128 v34 = 0u;
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 contentsOfDirectoryAtPath:v4 error:0]);
    id v7 = [v6 countByEnumeratingWithState:&v33 objects:v38 count:16];
    if (v7)
    {
      id v8 = v7;
      id v9 = 0LL;
      uint64_t v10 = *(void *)v34;
      do
      {
        int v11 = 0LL;
        int v12 = v9;
        do
        {
          if (*(void *)v34 != v10) {
            objc_enumerationMutation(v6);
          }
          id v9 = (void *)objc_claimAutoreleasedReturnValue( [v4 stringByAppendingPathComponent:*(void *)(*((void *)&v33 + 1) + 8 * (void)v11)]);

          [v5 removeItemAtPath:v9 error:0];
          int v11 = (char *)v11 + 1;
          int v12 = v9;
        }

        while (v8 != v11);
        id v8 = [v6 countByEnumeratingWithState:&v33 objects:v38 count:16];
      }

      while (v8);
    }

    else
    {
      id v9 = 0LL;
    }
  }

  else
  {
    id v9 = 0LL;
  }

  id v13 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLogStateMachine workDir](self, "workDir"));
  unsigned int v14 = [v5 fileExistsAtPath:v13];

  if (v14)
  {
    __int128 v31 = 0u;
    __int128 v32 = 0u;
    __int128 v29 = 0u;
    __int128 v30 = 0u;
    id v15 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLogStateMachine workDir](self, "workDir"));
    __int16 v16 = (void *)objc_claimAutoreleasedReturnValue([v5 contentsOfDirectoryAtPath:v15 error:0]);

    id obj = v16;
    id v17 = [v16 countByEnumeratingWithState:&v29 objects:v37 count:16];
    if (v17)
    {
      id v18 = v17;
      __int16 v19 = self;
      v27 = v4;
      uint64_t v20 = 0LL;
      uint64_t v21 = *(void *)v30;
      do
      {
        for (uint64_t i = 0LL; i != v18; uint64_t i = (char *)i + 1)
        {
          v23 = v9;
          uint64_t v24 = v20;
          if (*(void *)v30 != v21) {
            objc_enumerationMutation(obj);
          }
          uint64_t v25 = *(void *)(*((void *)&v29 + 1) + 8LL * (void)i);
          v26 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLogStateMachine workDir](v19, "workDir", v27));
          id v9 = (void *)objc_claimAutoreleasedReturnValue([v26 stringByAppendingPathComponent:v25]);

          uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v9 lastPathComponent]);
          if (([v20 isEqualToString:@"tar_in_process"] & 1) == 0
            && ([v20 isEqualToString:@"dp_tasking_payload.plist"] & 1) == 0)
          {
            [v5 removeItemAtPath:v9 error:0];
          }
        }

        id v18 = [obj countByEnumeratingWithState:&v29 objects:v37 count:16];
      }

      while (v18);

      id v4 = v27;
    }
  }
}

- (void)_deleteUploadInfo
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLogStateMachine stateMgr](self, "stateMgr"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 getAllKeys]);

  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  id v5 = v4;
  id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      id v9 = 0LL;
      do
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v13 + 1) + 8LL * (void)v9);
        uint64_t v11 = objc_opt_class(&OBJC_CLASS___NSString);
        if ((objc_opt_isKindOfClass(v10, v11) & 1) != 0
          && objc_msgSend(v10, "hasPrefix:", @"aspcarry_uploadinfo", (void)v13))
        {
          int v12 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLogStateMachine stateMgr](self, "stateMgr"));
          [v12 deleteKey:v10];
        }

        id v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }

    while (v7);
  }
}

- (void)_resetDaemonUserDefaults
{
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  id v3 = [&off_1000BD2B8 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v12;
    do
    {
      id v6 = 0LL;
      do
      {
        if (*(void *)v12 != v5) {
          objc_enumerationMutation(&off_1000BD2B8);
        }
        uint64_t v7 = *(void *)(*((void *)&v11 + 1) + 8LL * (void)v6);
        uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLogStateMachine stateMgr](self, "stateMgr"));
        id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 getValueForKey:v7 expectedType:4]);

        if (v9)
        {
          uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLogStateMachine stateMgr](self, "stateMgr"));
          [v10 deleteKey:v7];
        }

        id v6 = (char *)v6 + 1;
      }

      while (v4 != v6);
      id v4 = [&off_1000BD2B8 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }

    while (v4);
  }

- (BOOL)_checkSnBuildVariantMatch
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLogStateMachine stateMgr](self, "stateMgr"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 getValueForKey:@"device_serialnumber" expectedType:0]);

  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLogStateMachine stateMgr](self, "stateMgr"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 getValueForKey:@"device_is_internal_build" expectedType:0]);
  unsigned int v7 = [v6 isEqualToString:@"yes"];

  id DeviceSerialNumber = getDeviceSerialNumber();
  id v9 = (void *)objc_claimAutoreleasedReturnValue(DeviceSerialNumber);
  int has_internal_content = os_variant_has_internal_content("com.apple.ASPCarryLog", v10);
  if (v4 && (![v9 isEqualToString:v4] || v7 != has_internal_content))
  {
    __int128 v13 = (os_log_s *)oslog;
    if (os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v23 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "SN and/or build variant mismatch. Reseting defaults",  v23,  2u);
    }

    -[ASPCarryLogStateMachine _resetDaemonUserDefaults](self, "_resetDaemonUserDefaults");
    __int128 v14 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLogStateMachine stateMgr](self, "stateMgr"));
    __int128 v15 = v14;
    if (has_internal_content) {
      [v14 setValue:@"No active tasking and no iolog collection ongoing" forKey:@"aspcarrylog_tasking_info" inDomain:@"/var/mobile/Library/Preferences/com.apple.nandCarryLogs.plist"];
    }

    BOOL v12 = 0;
  }

  else
  {
    BOOL v12 = 1;
  }

  __int128 v16 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLogStateMachine stateMgr](self, "stateMgr"));
  id v17 = (void *)objc_claimAutoreleasedReturnValue([v16 getValueForKey:@"device_serialnumber" expectedType:0]);

  if (!v17)
  {
    id v18 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLogStateMachine stateMgr](self, "stateMgr"));
    [v18 setValue:v9 forKey:@"device_serialnumber"];
  }

  __int16 v19 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLogStateMachine stateMgr](self, "stateMgr"));
  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v19 getValueForKey:@"device_is_internal_build" expectedType:0]);
  if (v20) {
    int has_internal_content = 0;
  }

  if (has_internal_content == 1)
  {
    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLogStateMachine stateMgr](self, "stateMgr"));
    [v21 setValue:@"yes" forKey:@"device_is_internal_build"];
  }

  return v12;
}

- (void)dailyCheckWithStatsProvider:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLogStateMachine stateMgr](self, "stateMgr"));
  uint64_t v6 = objc_claimAutoreleasedReturnValue([v5 getValueForKey:@"daily_check_tasking_status" expectedType:0]);

  if (v6) {
    unsigned int v7 = (__CFString *)v6;
  }
  else {
    unsigned int v7 = @"inactive";
  }
  if (!-[ASPCarryLogStateMachine _hasActiveTasking](self, "_hasActiveTasking"))
  {
    if (-[ASPCarryLogStateMachine _hasPendingDSReplyTasking](self, "_hasPendingDSReplyTasking")) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }

  unsigned int v8 = -[ASPCarryLogStateMachine _activeTaskingExpired](self, "_activeTaskingExpired");
  id v9 = (void *)oslog;
  BOOL v10 = os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_DEFAULT);
  if (v8)
  {
    if (v10)
    {
      __int128 v11 = v9;
      BOOL v12 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLogStateMachine currentTaskingInfo](self, "currentTaskingInfo"));
      id v13 = objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:@"id"]);
      int v20 = 136315138;
      id v21 = [v13 UTF8String];
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "TaskingId %s Ending.\n",  (uint8_t *)&v20,  0xCu);
    }

    __int128 v14 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLogStateMachine nandDriver](self, "nandDriver"));
    objc_msgSend(v14, "iolog_disable");

    -[ASPCarryLogStateMachine unregisterIOLoggingXPC](self, "unregisterIOLoggingXPC");
    -[ASPCarryLogStateMachine _unmarkCurrentTasking](self, "_unmarkCurrentTasking");
LABEL_10:
    if (!-[ASPCarryLogStateMachine _canJoinTaskingPerStatsDriver:](self, "_canJoinTaskingPerStatsDriver:", v4))
    {
LABEL_12:
      if (-[ASPCarryLogStateMachine _hasActiveTasking](self, "_hasActiveTasking"))
      {
        __int128 v15 = @"active";
      }

      else
      {
        -[ASPCarryLogStateMachine unregisterIOLoggingXPC](self, "unregisterIOLoggingXPC");
        if ((-[__CFString isEqualToString:](v7, "isEqualToString:", @"active") & 1) != 0)
        {
          __int128 v15 = @"just_ended";
        }

        else
        {
          __int128 v15 = @"inactive";
        }

        __int16 v19 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLogStateMachine stateMgr](self, "stateMgr"));
        if (-[ASPCarryLogStateMachine isInternalBuild](self, "isInternalBuild")) {
          [v19 setValue:@"No active tasking and no iolog collection ongoing" forKey:@"aspcarrylog_tasking_info" inDomain:@"/var/mobile/Library/Preferences/com.apple.nandCarryLogs.plist"];
        }
      }

      id v17 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLogStateMachine stateMgr](self, "stateMgr"));
      [v17 setValue:v15 forKey:@"daily_check_tasking_status"];
      goto LABEL_25;
    }

- (void)bootCheck
{
  if (-[ASPCarryLogStateMachine _checkSnBuildVariantMatch](self, "_checkSnBuildVariantMatch")
    && -[ASPCarryLogStateMachine _hasActiveTasking](self, "_hasActiveTasking"))
  {
    if (-[ASPCarryLogStateMachine _activeTaskingExpired](self, "_activeTaskingExpired"))
    {
      id v3 = (void *)oslog;
      if (os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_DEFAULT))
      {
        id v4 = v3;
        uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLogStateMachine currentTaskingInfo](self, "currentTaskingInfo"));
        id v6 = objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"id"]);
        int v21 = 136315138;
        id v22 = [v6 UTF8String];
        _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "TaskingId %s Ending.\n",  (uint8_t *)&v21,  0xCu);
      }

      unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLogStateMachine nandDriver](self, "nandDriver"));
      objc_msgSend(v7, "iolog_disable");

      -[ASPCarryLogStateMachine _unmarkCurrentTasking](self, "_unmarkCurrentTasking");
      unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLogStateMachine stateMgr](self, "stateMgr"));
      if (-[ASPCarryLogStateMachine isInternalBuild](self, "isInternalBuild")) {
        [v8 setValue:@"No active tasking and no iolog collection ongoing" forKey:@"aspcarrylog_tasking_info" inDomain:@"/var/mobile/Library/Preferences/com.apple.nandCarryLogs.plist"];
      }
    }

    else
    {
      BOOL v10 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLogStateMachine currentTaskingInfo](self, "currentTaskingInfo"));
      unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:@"id"]);

      __int128 v11 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLogStateMachine stateMgr](self, "stateMgr"));
      BOOL v12 = uploadInfoKeyFromTaskingId((uint64_t)v8);
      id v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
      __int128 v14 = (void *)objc_claimAutoreleasedReturnValue([v11 getValueForKey:v13 expectedType:2]);

      if (v14)
      {
        __int128 v15 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKey:@"spd_state"]);

        if (!v15)
        {
          __int128 v16 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLogStateMachine nandDriver](self, "nandDriver"));
          objc_msgSend(v16, "iolog_enable");
        }
      }

      -[ASPCarryLogStateMachine registerIOLoggingXPCforInternalBuild:]( self,  "registerIOLoggingXPCforInternalBuild:",  -[ASPCarryLogStateMachine isInternalBuild](self, "isInternalBuild"));
      id v17 = (void *)oslog;
      if (os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_DEFAULT))
      {
        id v18 = v17;
        __int16 v19 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLogStateMachine currentTaskingInfo](self, "currentTaskingInfo"));
        id v20 = objc_claimAutoreleasedReturnValue([v19 objectForKeyedSubscript:@"id"]);
        int v21 = 136315138;
        id v22 = [v20 UTF8String];
        _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "TaskingId %s running.\n",  (uint8_t *)&v21,  0xCu);
      }
    }
  }

  else
  {
    id v9 = (os_log_s *)oslog;
    if (os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v21) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "No active tasking at boot",  (uint8_t *)&v21,  2u);
    }
  }

- (NSString)workDir
{
  return self->_workDir;
}

- (void)setWorkDir:(id)a3
{
}

- (StateMgr)stateMgr
{
  return self->_stateMgr;
}

- (void)setStateMgr:(id)a3
{
}

- (NSMutableDictionary)currentTaskingInfo
{
  return self->_currentTaskingInfo;
}

- (void)setCurrentTaskingInfo:(id)a3
{
}

- (NSMutableArray)taskingIdHistory
{
  return self->_taskingIdHistory;
}

- (void)setTaskingIdHistory:(id)a3
{
}

- (TaskingManager)DATaskingMgr
{
  return self->_DATaskingMgr;
}

- (void)setDATaskingMgr:(id)a3
{
}

- (NSString)DATaskingID
{
  return self->_DATaskingID;
}

- (void)setDATaskingID:(id)a3
{
}

- (int64_t)taskingDuration
{
  return self->_taskingDuration;
}

- (void)setTaskingDuration:(int64_t)a3
{
  self->_taskingDuration = a3;
}

- (int64_t)taskingSizeLimit
{
  return self->_taskingSizeLimit;
}

- (void)setTaskingSizeLimit:(int64_t)a3
{
  self->_taskingSizeLimit = a3;
}

- (BOOL)isLegacyUI_IOLogEnabled
{
  return self->_isLegacyUI_IOLogEnabled;
}

- (void)setIsLegacyUI_IOLogEnabled:(BOOL)a3
{
  self->_isLegacyUI_IOLogEnabled = a3;
}

- (BOOL)isLegacyUI_TaskingDisabled
{
  return self->_isLegacyUI_TaskingDisabled;
}

- (void)setIsLegacyUI_TaskingDisabled:(BOOL)a3
{
  self->_isLegacyUI_TaskingDisabled = a3;
}

- (BOOL)isInternal
{
  return self->_isInternal;
}

- (void)setIsInternal:(BOOL)a3
{
  self->_isInternal = a3;
}

- (CarryLog_NANDDriver)nandDriver
{
  return self->_nandDriver;
}

- (void)setNandDriver:(id)a3
{
}

- (CarryLog_UploadDriver)uploadDriver
{
  return self->_uploadDriver;
}

- (void)setUploadDriver:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
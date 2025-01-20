@interface OSActivityEvent
+ (id)activityEventFromStreamEntry:(os_activity_stream_entry_s *)a3;
- (BOOL)persisted;
- (NSDate)timestamp;
- (NSString)eventMessage;
- (NSString)process;
- (NSString)processImagePath;
- (NSString)sender;
- (NSString)senderImagePath;
- (NSString)timezoneName;
- (NSTimeZone)timezone;
- (NSUUID)processImageUUID;
- (NSUUID)senderImageUUID;
- (id)description;
- (id)properties;
- (int)processID;
- (timeval)timeGMT;
- (timezone)tz;
- (unint64_t)activityID;
- (unint64_t)eventType;
- (unint64_t)machTimestamp;
- (unint64_t)parentActivityID;
- (unint64_t)processUniqueID;
- (unint64_t)threadID;
- (unint64_t)traceID;
- (unsigned)userID;
- (void)_addProperties:(id)a3;
- (void)_initWithProperties:(id)a3;
- (void)fillFromStreamEntry:(os_activity_stream_entry_s *)a3 eventMessage:(const char *)a4 persisted:(BOOL)a5;
- (void)setEventMessage:(id)a3;
- (void)setTimezoneName:(id)a3;
@end

@implementation OSActivityEvent

- (id)description
{
  v3 = (void *)NSString;
  uint64_t v4 = objc_opt_class();
  v5 = -[OSActivityEvent process](self, "process");
  v6 = -[OSActivityEvent sender](self, "sender");
  v7 = -[OSActivityEvent eventMessage](self, "eventMessage");
  [v3 stringWithFormat:@"<%@:%p process:%@ sender:%@>{%@}", v4, self, v5, v6, v7];
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (NSTimeZone)timezone
{
  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_timezone)
  {
    if (-[NSString length](v2->_timezoneName, "length")) {
      [MEMORY[0x189604020] timeZoneWithName:v2->_timezoneName];
    }
    else {
    uint64_t v3 = [MEMORY[0x189604020] timeZoneForSecondsFromGMT:3600 * v2->_tz.tz_dsttime + -60 * v2->_tz.tz_minuteswest];
    }
    timezone = v2->_timezone;
    v2->_timezone = (NSTimeZone *)v3;
  }

  objc_sync_exit(v2);

  return v2->_timezone;
}

- (void)fillFromStreamEntry:(os_activity_stream_entry_s *)a3 eventMessage:(const char *)a4 persisted:(BOOL)a5
{
  self->_eventType = a3->var0;
  self->_processID = a3->var1;
  self->_processUniqueID = a3->var2;
  self->_userID = a3->var3;
  if (a3->var4)
  {
    v9 = (NSUUID *)[objc_alloc(MEMORY[0x189607AB8]) initWithUUIDBytes:a3->var4];
    processImageUUID = self->_processImageUUID;
    self->_processImageUUID = v9;
  }

  if (a3->var5)
  {
    objc_msgSend(NSString, "stringWithUTF8String:");
    v11 = (NSString *)objc_claimAutoreleasedReturnValue();
    processImagePath = self->_processImagePath;
    self->_processImagePath = v11;
  }

  self->_parentActivityID = a3->var7 & 0xFFFFFFFFFFFFFFLL;
  self->_activityID = a3->var6 & 0xFFFFFFFFFFFFFFLL;
  self->_traceID = a3->var8.var0.var0;
  self->_threadID = a3->var8.var0.var2;
  self->_machTimestamp = a3->var8.var0.var1;
  self->_timeGMT = a3->var8.var12.var5;
  self->_tz = a3->var8.var12.var6;
  [MEMORY[0x189603F50] dateWithTimeIntervalSince1970:(double)a3->var8.var0.var5.tv_usec / 1000000.0 + (double)a3->var8.var0.var5.tv_sec];
  v13 = (NSDate *)objc_claimAutoreleasedReturnValue();
  timestamp = self->_timestamp;
  self->_timestamp = v13;

  timezoneName = self->_timezoneName;
  self->_timezoneName = (NSString *)&stru_189F108F0;

  timezone = self->_timezone;
  self->_timezone = 0LL;

  self->_persisted = a5;
  [NSString stringWithUTF8String:a4];
  v17 = (NSString *)objc_claimAutoreleasedReturnValue();
  eventMessage = self->_eventMessage;
  self->_eventMessage = v17;

  if (!self->_eventMessage) {
    self->_eventMessage = (NSString *)@"<compose failure [invalid utf8]>";
  }
  if (a3->var8.var0.var3)
  {
    v19 = (NSUUID *)[objc_alloc(MEMORY[0x189607AB8]) initWithUUIDBytes:a3->var8.var0.var3];
    senderImageUUID = self->_senderImageUUID;
    self->_senderImageUUID = v19;
  }

  if (a3->var8.var0.var4)
  {
    objc_msgSend(NSString, "stringWithUTF8String:");
    v21 = (NSString *)objc_claimAutoreleasedReturnValue();
    senderImagePath = self->_senderImagePath;
    self->_senderImagePath = v21;
  }

- (id)properties
{
  uint64_t v3 = (void *)objc_opt_new();
  -[OSActivityEvent _addProperties:](self, "_addProperties:", v3);
  return v3;
}

- (void)_initWithProperties:(id)a3
{
  id v23 = a3;
  [v23 objectForKey:@"processID"];
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4) {
    self->_processID = [v4 intValue];
  }
  [v23 objectForKey:@"processUniqueID"];
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6) {
    self->_processUniqueID = [v6 unsignedLongLongValue];
  }
  [v23 objectForKey:@"processImageUUID"];
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7) {
    objc_storeStrong((id *)&self->_processImageUUID, v7);
  }
  [v23 objectForKey:@"processImagePath"];
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8) {
    objc_storeStrong((id *)&self->_processImagePath, v8);
  }
  [v23 objectForKey:@"userID"];
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9) {
    self->_userID = [v9 unsignedIntValue];
  }
  [v23 objectForKey:@"eventType"];
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10) {
    self->_eventType = [v10 unsignedLongValue];
  }
  [v23 objectForKey:@"parentActivityID"];
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11) {
    self->_parentActivityID = [v11 unsignedLongLongValue];
  }
  [v23 objectForKey:@"activityID"];
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12) {
    self->_activityID = [v12 unsignedLongLongValue];
  }
  [v23 objectForKey:@"traceID"];
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13) {
    self->_traceID = [v13 unsignedLongLongValue];
  }
  [v23 objectForKey:@"threadID"];
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14) {
    self->_threadID = [v14 unsignedLongLongValue];
  }
  [v23 objectForKey:@"machTimestamp"];
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15) {
    self->_machTimestamp = [v15 unsignedLongLongValue];
  }
  [v23 objectForKey:@"timestamp"];
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16) {
    objc_storeStrong((id *)&self->_timestamp, v16);
  }
  [v23 objectForKey:@"senderImageUUID"];
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    v18 = (NSUUID *)[objc_alloc(MEMORY[0x189607AB8]) initWithUUIDString:v17];
    senderImageUUID = self->_senderImageUUID;
    self->_senderImageUUID = v18;
  }

  [v23 objectForKey:@"senderImagePath"];
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20) {
    objc_storeStrong((id *)&self->_senderImagePath, v20);
  }
  [v23 objectForKey:@"eventMessage"];
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21) {
    objc_storeStrong((id *)&self->_eventMessage, v21);
  }
  [v23 objectForKey:@"persisted"];
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22) {
    self->_persisted = [v22 BOOLValue];
  }
}

- (void)_addProperties:(id)a3
{
  uint64_t v40 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  objc_msgSend(MEMORY[0x189607968], "numberWithInt:", -[OSActivityEvent processID](self, "processID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 setObject:v5 forKey:@"processID"];

  objc_msgSend( MEMORY[0x189607968],  "numberWithUnsignedLongLong:",  -[OSActivityEvent processUniqueID](self, "processUniqueID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 setObject:v6 forKey:@"processUniqueID"];
  v7 = -[OSActivityEvent processImageUUID](self, "processImageUUID");
  if (v7)
  {
    v8 = -[OSActivityEvent processImageUUID](self, "processImageUUID");
    [v8 UUIDString];
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 setObject:v9 forKey:@"processImageUUID"];
  }

  objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedInt:", -[OSActivityEvent userID](self, "userID"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 setObject:v10 forKey:@"userID"];

  objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedLongLong:", -[OSActivityEvent traceID](self, "traceID"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 setObject:v11 forKey:@"traceID"];

  objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedLongLong:", -[OSActivityEvent threadID](self, "threadID"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 setObject:v12 forKey:@"threadID"];

  objc_msgSend( MEMORY[0x189607968],  "numberWithUnsignedLongLong:",  -[OSActivityEvent machTimestamp](self, "machTimestamp"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 setObject:v13 forKey:@"machTimestamp"];
  v14 = -[OSActivityEvent processImagePath](self, "processImagePath");
  if (v14)
  {
    v15 = -[OSActivityEvent processImagePath](self, "processImagePath");
    [v4 setObject:v15 forKey:@"processImagePath"];
  }

  if (-[OSActivityEvent parentActivityID](self, "parentActivityID"))
  {
    objc_msgSend( MEMORY[0x189607968],  "numberWithUnsignedLongLong:",  -[OSActivityEvent parentActivityID](self, "parentActivityID"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 setObject:v16 forKey:@"parentActivityID"];
  }

  if (-[OSActivityEvent activityID](self, "activityID"))
  {
    objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedLongLong:", -[OSActivityEvent activityID](self, "activityID"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 setObject:v17 forKey:@"activityID"];
  }
  v18 = -[OSActivityEvent senderImageUUID](self, "senderImageUUID");
  if (v18)
  {
    v19 = -[OSActivityEvent senderImageUUID](self, "senderImageUUID");
    [v19 UUIDString];
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 setObject:v20 forKey:@"senderImageUUID"];
  }
  v21 = -[OSActivityEvent senderImagePath](self, "senderImagePath");
  if (v21)
  {
    v22 = -[OSActivityEvent senderImagePath](self, "senderImagePath");
    [v4 setObject:v22 forKey:@"senderImagePath"];
  }

  -[OSActivityEvent eventMessage](self, "eventMessage");
  id v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23)
  {
    v24 = -[OSActivityEvent eventMessage](self, "eventMessage");
    [v4 setObject:v24 forKey:@"eventMessage"];
  }

  int v39 = 0;
  *(_OWORD *)v37 = 0u;
  __int128 v38 = 0u;
  time_t v34 = self->_timeGMT.tv_sec - 60LL * self->_tz.tz_minuteswest + 3600 * self->_tz.tz_dsttime;
  v25 = gmtime_r(&v34, &v35);
  if (v25)
  {
    v26 = v25;
    int v27 = self->_tz.tz_minuteswest - 60 * self->_tz.tz_dsttime;
    int v29 = v27 % 60;
    if (v29 < 0) {
      int v29 = -v29;
    }
    snprintf(__str, 0x20uLL, "%%F %%T.%06d%+03d%02d", self->_timeGMT.tv_usec, v28, v29);
    strftime(v37, 0x24uLL, __str, v26);
    [NSString stringWithUTF8String:v37];
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 setObject:v30 forKey:@"timestamp"];
  }

  else
  {
    if (_addProperties__once != -1) {
      dispatch_once(&_addProperties__once, &__block_literal_global_364);
    }
    v31 = (void *)_addProperties__dateFormat;
    v30 = -[OSActivityEvent timestamp](self, "timestamp");
    [v31 stringFromDate:v30];
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 setObject:v32 forKey:@"timestamp"];
  }

  timezoneName = self->_timezoneName;
  if (timezoneName) {
    [v4 setObject:timezoneName forKeyedSubscript:@"timezoneName"];
  }
}

- (NSString)process
{
  return -[NSString lastPathComponent](self->_processImagePath, "lastPathComponent");
}

- (NSString)sender
{
  return -[NSString lastPathComponent](self->_senderImagePath, "lastPathComponent");
}

- (int)processID
{
  return self->_processID;
}

- (unint64_t)processUniqueID
{
  return self->_processUniqueID;
}

- (NSUUID)processImageUUID
{
  return self->_processImageUUID;
}

- (NSString)processImagePath
{
  return self->_processImagePath;
}

- (unsigned)userID
{
  return self->_userID;
}

- (unint64_t)eventType
{
  return self->_eventType;
}

- (unint64_t)parentActivityID
{
  return self->_parentActivityID;
}

- (unint64_t)activityID
{
  return self->_activityID;
}

- (unint64_t)traceID
{
  return self->_traceID;
}

- (unint64_t)threadID
{
  return self->_threadID;
}

- (unint64_t)machTimestamp
{
  return self->_machTimestamp;
}

- (NSDate)timestamp
{
  return self->_timestamp;
}

- (NSUUID)senderImageUUID
{
  return self->_senderImageUUID;
}

- (NSString)senderImagePath
{
  return self->_senderImagePath;
}

- (NSString)eventMessage
{
  return self->_eventMessage;
}

- (void)setEventMessage:(id)a3
{
}

- (BOOL)persisted
{
  return self->_persisted;
}

- (timeval)timeGMT
{
  uint64_t v2 = *(void *)&self->_timeGMT.tv_usec;
  __darwin_time_t tv_sec = self->_timeGMT.tv_sec;
  result.tv_usec = v2;
  result.__darwin_time_t tv_sec = tv_sec;
  return result;
}

- (timezone)tz
{
  return self->_tz;
}

- (NSString)timezoneName
{
  return self->_timezoneName;
}

- (void)setTimezoneName:(id)a3
{
}

- (void).cxx_destruct
{
}

uint64_t __34__OSActivityEvent__addProperties___block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x189607848]);
  v1 = (void *)_addProperties__dateFormat;
  _addProperties__dateFormat = (uint64_t)v0;

  return [(id)_addProperties__dateFormat setDateFormat:@"MMM dd HH:mm:ss.SSSSSS"];
}

+ (id)activityEventFromStreamEntry:(os_activity_stream_entry_s *)a3
{
  signed int var0 = a3->var0;
  if ((int)a3->var0 <= 1023)
  {
    if (var0 > 514)
    {
      if (var0 == 515)
      {
        id v4 = off_189F0D310;
        goto LABEL_23;
      }

      if (var0 == 768)
      {
        id v4 = off_189F0D300;
        goto LABEL_23;
      }
    }

    else
    {
      if (var0 == 513)
      {
        id v4 = off_189F0D2C0;
        goto LABEL_23;
      }

      if (var0 == 514)
      {
        id v4 = off_189F0D308;
        goto LABEL_23;
      }
    }
  }

  else if (var0 <= 1279)
  {
    if (var0 == 1024 || var0 == 1152)
    {
      id v4 = off_189F0D2D8;
      goto LABEL_23;
    }
  }

  else
  {
    switch(var0)
    {
      case 1280:
        id v4 = off_189F0D2F8;
        goto LABEL_23;
      case 1792:
        id v4 = off_189F0D2E0;
        goto LABEL_23;
      case 2560:
        id v4 = off_189F0D2F0;
        goto LABEL_23;
    }
  }

  if ((var0 & 0xFFFFFF00) != 0x600)
  {
    v5 = 0LL;
    return v5;
  }

  id v4 = off_189F0D2E8;
LABEL_23:
  v5 = (void *)[objc_alloc(*v4) initWithEntry:a3];
  return v5;
}

@end
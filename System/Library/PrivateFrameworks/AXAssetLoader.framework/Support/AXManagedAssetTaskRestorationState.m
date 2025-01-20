@interface AXManagedAssetTaskRestorationState
+ (id)idleStateWithTaskID:(id)a3 assetType:(id)a4;
+ (id)restoreOrCreateStateFromStore:(id)a3 taskID:(id)a4 assetType:(id)a5;
- (BOOL)isIdle;
- (BOOL)previousTaskDidFail;
- (BOOL)previousTaskWasDeferred;
- (BOOL)previousTaskWasSuccessful;
- (NSDate)date;
- (NSString)assetType;
- (NSString)lastExitStatus;
- (NSString)phase;
- (NSString)taskID;
- (id)_initWithPhase:(id)a3 lastExitStatus:(id)a4 date:(id)a5 taskID:(id)a6 assetType:(id)a7;
- (id)_restorationDictionary;
- (id)_restorationKey;
- (id)description;
- (void)setAssetType:(id)a3;
- (void)setDate:(id)a3;
- (void)setLastExitStatus:(id)a3;
- (void)setPhase:(id)a3;
- (void)setTaskID:(id)a3;
- (void)updatePhase:(id)a3 exitStatus:(id)a4 saveToStore:(id)a5;
- (void)updatePhase:(id)a3 saveToStore:(id)a4;
@end

@implementation AXManagedAssetTaskRestorationState

+ (id)idleStateWithTaskID:(id)a3 assetType:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc((Class)a1);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  id v10 = [v8 _initWithPhase:@"Idle" lastExitStatus:0 date:v9 taskID:v7 assetType:v6];

  return v10;
}

+ (id)restoreOrCreateStateFromStore:(id)a3 taskID:(id)a4 assetType:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = a3;
  v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@_RestorationState",  v8));
  v12 = (void *)objc_claimAutoreleasedReturnValue([v10 valueForKey:v11 forAssetType:v9]);

  if (v12)
  {
    id v13 = objc_alloc((Class)a1);
    v14 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:@"Phase"]);
    v15 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:@"LastExitStatus"]);
    v16 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:@"Date"]);
    id v17 = [v13 _initWithPhase:v14 lastExitStatus:v15 date:v16 taskID:v8 assetType:v9];
  }

  else
  {
    id v17 = (id)objc_claimAutoreleasedReturnValue([a1 idleStateWithTaskID:v8 assetType:v9]);
  }

  return v17;
}

- (id)_initWithPhase:(id)a3 lastExitStatus:(id)a4 date:(id)a5 taskID:(id)a6 assetType:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v20.receiver = self;
  v20.super_class = (Class)&OBJC_CLASS___AXManagedAssetTaskRestorationState;
  id v17 = -[AXManagedAssetTaskRestorationState init](&v20, "init");
  v18 = v17;
  if (v17)
  {
    -[AXManagedAssetTaskRestorationState setPhase:](v17, "setPhase:", v12);
    -[AXManagedAssetTaskRestorationState setLastExitStatus:](v18, "setLastExitStatus:", v13);
    -[AXManagedAssetTaskRestorationState setTaskID:](v18, "setTaskID:", v15);
    -[AXManagedAssetTaskRestorationState setAssetType:](v18, "setAssetType:", v16);
    -[AXManagedAssetTaskRestorationState setDate:](v18, "setDate:", v14);
  }

  return v18;
}

- (id)description
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[AXManagedAssetTaskRestorationState phase](self, "phase"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[AXManagedAssetTaskRestorationState lastExitStatus](self, "lastExitStatus"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[AXManagedAssetTaskRestorationState date](self, "date"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Phase: '%@'. LastExitStatus: '%@'. Timestamp: '%@'",  v3,  v4,  v5));

  return v6;
}

- (id)_restorationKey
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[AXManagedAssetTaskRestorationState taskID](self, "taskID"));
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@_RestorationState",  v2));

  return v3;
}

- (id)_restorationDictionary
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[AXManagedAssetTaskRestorationState phase](self, "phase"));
  [v3 setObject:v4 forKeyedSubscript:@"Phase"];

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[AXManagedAssetTaskRestorationState date](self, "date"));
  [v3 setObject:v5 forKeyedSubscript:@"Date"];

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[AXManagedAssetTaskRestorationState lastExitStatus](self, "lastExitStatus"));
  if (v6)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[AXManagedAssetTaskRestorationState lastExitStatus](self, "lastExitStatus"));
    [v3 setObject:v7 forKeyedSubscript:@"LastExitStatus"];
  }

  return v3;
}

- (BOOL)isIdle
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[AXManagedAssetTaskRestorationState phase](self, "phase"));
  unsigned __int8 v3 = [v2 isEqualToString:@"Idle"];

  return v3;
}

- (void)updatePhase:(id)a3 saveToStore:(id)a4
{
}

- (void)updatePhase:(id)a3 exitStatus:(id)a4 saveToStore:(id)a5
{
  id v14 = a4;
  id v8 = a5;
  -[AXManagedAssetTaskRestorationState setPhase:](self, "setPhase:", a3);
  if (v14) {
    -[AXManagedAssetTaskRestorationState setLastExitStatus:](self, "setLastExitStatus:", v14);
  }
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  -[AXManagedAssetTaskRestorationState setDate:](self, "setDate:", v9);

  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[AXManagedAssetTaskRestorationState _restorationDictionary](self, "_restorationDictionary"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[AXManagedAssetTaskRestorationState taskID](self, "taskID"));
  id v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@_RestorationState",  v11));
  id v13 = (void *)objc_claimAutoreleasedReturnValue(-[AXManagedAssetTaskRestorationState assetType](self, "assetType"));
  [v8 setValue:v10 forKey:v12 forAssetType:v13];
}

- (BOOL)previousTaskWasSuccessful
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[AXManagedAssetTaskRestorationState lastExitStatus](self, "lastExitStatus"));
  unsigned __int8 v3 = [v2 isEqualToString:@"Success"];

  return v3;
}

- (BOOL)previousTaskDidFail
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[AXManagedAssetTaskRestorationState lastExitStatus](self, "lastExitStatus"));
  unsigned __int8 v3 = [v2 isEqualToString:@"Failed"];

  return v3;
}

- (BOOL)previousTaskWasDeferred
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[AXManagedAssetTaskRestorationState lastExitStatus](self, "lastExitStatus"));
  unsigned __int8 v3 = [v2 isEqualToString:@"Deferred"];

  return v3;
}

- (NSString)taskID
{
  return self->_taskID;
}

- (void)setTaskID:(id)a3
{
}

- (NSString)assetType
{
  return self->_assetType;
}

- (void)setAssetType:(id)a3
{
}

- (NSString)phase
{
  return self->_phase;
}

- (void)setPhase:(id)a3
{
}

- (NSString)lastExitStatus
{
  return self->_lastExitStatus;
}

- (void)setLastExitStatus:(id)a3
{
}

- (NSDate)date
{
  return self->_date;
}

- (void)setDate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
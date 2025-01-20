@interface MADAutoAssetSecureLock
+ (BOOL)supportsSecureCoding;
- (MADAutoAssetSecureLock)initWithCoder:(id)a3;
- (NSMutableDictionary)lockedAssetSelectors;
- (NSString)clientProcessName;
- (id)initProcessLifeLock:(id)a3 forAssetSelector:(id)a4 forClientProcessName:(id)a5 forClientProcessID:(int64_t)a6;
- (id)name;
- (id)summary;
- (int64_t)clientProcessID;
- (void)encodeWithCoder:(id)a3;
- (void)setClientProcessID:(int64_t)a3;
- (void)setClientProcessName:(id)a3;
- (void)setLockedAssetSelectors:(id)a3;
@end

@implementation MADAutoAssetSecureLock

- (id)initProcessLifeLock:(id)a3 forAssetSelector:(id)a4 forClientProcessName:(id)a5 forClientProcessID:(int64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v30.receiver = self;
  v30.super_class = (Class)&OBJC_CLASS___MADAutoAssetSecureLock;
  v13 = -[MADAutoAssetSecureLock init](&v30, "init");
  v14 = v13;
  if (!v13) {
    goto LABEL_7;
  }
  objc_storeStrong((id *)&v13->_clientProcessName, a5);
  v14->_clientProcessID = a6;
  v15 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  lockedAssetSelectors = v14->_lockedAssetSelectors;
  v14->_lockedAssetSelectors = v15;

  if (!v11)
  {
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger"));
    v26 = (os_log_s *)objc_claimAutoreleasedReturnValue([v25 oslog]);

    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543874;
      id v32 = v10;
      __int16 v33 = 2114;
      id v34 = v12;
      __int16 v35 = 2048;
      int64_t v36 = a6;
      _os_log_error_impl( &dword_0,  v26,  OS_LOG_TYPE_ERROR,  "[AUTO-SECURE-LOCK] {_initProcessLifeLock} ERROR | MISSING fullAssetSelector | activityName:%{public}@ | clientPr ocessName:%{public}@ | clientProcessID:%ld",  buf,  0x20u);
    }

    goto LABEL_13;
  }

  uint64_t v17 = objc_claimAutoreleasedReturnValue([v11 assetType]);
  if (!v17)
  {
LABEL_11:
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger"));
    v26 = (os_log_s *)objc_claimAutoreleasedReturnValue([v27 oslog]);

    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      v29 = (void *)objc_claimAutoreleasedReturnValue([v11 summary]);
      *(_DWORD *)buf = 138544130;
      id v32 = v10;
      __int16 v33 = 2114;
      id v34 = v12;
      __int16 v35 = 2048;
      int64_t v36 = a6;
      __int16 v37 = 2114;
      v38 = v29;
      _os_log_error_impl( &dword_0,  v26,  OS_LOG_TYPE_ERROR,  "[AUTO-SECURE-LOCK] {_initProcessLifeLock} ERROR | incomplete asset-selector | activityName:%{public}@ | clientPr ocessName:%{public}@ | clientProcessID:%ld | fullAssetSelector:%{public}@",  buf,  0x2Au);
    }

- (MADAutoAssetSecureLock)initWithCoder:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___MADAutoAssetSecureLock;
  v5 = -[MADAutoAssetSecureLock init](&v16, "init");
  if (v5)
  {
    v6 = objc_alloc(&OBJC_CLASS___NSSet);
    uint64_t v7 = objc_opt_class(&OBJC_CLASS___NSDictionary);
    uint64_t v8 = objc_opt_class(&OBJC_CLASS___NSString);
    v9 = -[NSSet initWithObjects:]( v6,  "initWithObjects:",  v7,  v8,  objc_opt_class(&OBJC_CLASS___MAAutoAssetSelector),  0LL);
    id v10 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"clientProcessName"];
    uint64_t v11 = objc_claimAutoreleasedReturnValue(v10);
    clientProcessName = v5->_clientProcessName;
    v5->_clientProcessName = (NSString *)v11;

    v5->_clientProcessID = (int64_t)[v4 decodeIntegerForKey:@"clientProcessID"];
    uint64_t v13 = objc_claimAutoreleasedReturnValue([v4 decodeObjectOfClasses:v9 forKey:@"lockedAssetSelectors"]);
    lockedAssetSelectors = v5->_lockedAssetSelectors;
    v5->_lockedAssetSelectors = (NSMutableDictionary *)v13;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetSecureLock clientProcessName](self, "clientProcessName"));
  [v4 encodeObject:v5 forKey:@"clientProcessName"];

  objc_msgSend( v4,  "encodeInteger:forKey:",  -[MADAutoAssetSecureLock clientProcessID](self, "clientProcessID"),  @"clientProcessID");
  id v6 = (id)objc_claimAutoreleasedReturnValue(-[MADAutoAssetSecureLock lockedAssetSelectors](self, "lockedAssetSelectors"));
  [v4 encodeObject:v6 forKey:@"lockedAssetSelectors"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)summary
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetSecureLock clientProcessName](self, "clientProcessName"));
  int64_t v4 = -[MADAutoAssetSecureLock clientProcessID](self, "clientProcessID");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetSecureLock lockedAssetSelectors](self, "lockedAssetSelectors"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary safeSummaryForDictionary:](&OBJC_CLASS___NSDictionary, "safeSummaryForDictionary:", v5));
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"clientProcessName:%@(pid:%ld)|lockedAssetSelectors:%@",  v3,  v4,  v6));

  return v7;
}

- (id)name
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetSecureLock clientProcessName](self, "clientProcessName"));
  int64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@_%ld",  v3,  -[MADAutoAssetSecureLock clientProcessID](self, "clientProcessID")));

  return v4;
}

- (NSString)clientProcessName
{
  return self->_clientProcessName;
}

- (void)setClientProcessName:(id)a3
{
}

- (int64_t)clientProcessID
{
  return self->_clientProcessID;
}

- (void)setClientProcessID:(int64_t)a3
{
  self->_clientProcessID = a3;
}

- (NSMutableDictionary)lockedAssetSelectors
{
  return self->_lockedAssetSelectors;
}

- (void)setLockedAssetSelectors:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
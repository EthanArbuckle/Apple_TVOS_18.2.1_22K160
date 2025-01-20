@interface SHLSyncSessionFetchTask
+ (BOOL)supportsSecureCoding;
- (NSProgress)progress;
- (NSString)identifier;
- (NSString)syncStartCondition;
- (SHLSyncSession)session;
- (SHLSyncSessionFetchTask)init;
- (SHLSyncSessionFetchTask)initWithCoder:(id)a3;
- (SHLSyncSessionFetchTaskDelegate)delegate;
- (int64_t)fetchType;
- (int64_t)retryCount;
- (int64_t)size;
- (int64_t)type;
- (void)encodeWithCoder:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setFetchType:(int64_t)a3;
- (void)setRetryCount:(int64_t)a3;
- (void)setSession:(id)a3;
- (void)setSyncStartCondition:(id)a3;
@end

@implementation SHLSyncSessionFetchTask

- (SHLSyncSessionFetchTask)init
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___SHLSyncSessionFetchTask;
  v2 = -[SHLSyncSessionFetchTask init](&v9, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
    uint64_t v4 = objc_claimAutoreleasedReturnValue([v3 UUIDString]);
    identifier = v2->_identifier;
    v2->_identifier = (NSString *)v4;

    uint64_t v6 = objc_claimAutoreleasedReturnValue(+[NSProgress progressWithTotalUnitCount:](&OBJC_CLASS___NSProgress, "progressWithTotalUnitCount:", 1LL));
    progress = v2->_progress;
    v2->_progress = (NSProgress *)v6;

    v2->_retryCount = 0LL;
  }

  return v2;
}

- (int64_t)type
{
  return 1LL;
}

- (int64_t)size
{
  return 1LL;
}

- (SHLSyncSessionFetchTask)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___SHLSyncSessionFetchTask;
  uint64_t v6 = -[SHLSyncSessionFetchTask init](&v12, "init");
  if (v6)
  {
    id v7 = objc_msgSend( v4,  "decodeObjectOfClass:forKey:",  objc_opt_class(NSString, v5),  @"SHLSyncSessionFetchTaskIdentifier");
    uint64_t v8 = objc_claimAutoreleasedReturnValue(v7);
    identifier = v6->_identifier;
    v6->_identifier = (NSString *)v8;

    v6->_fetchType = (int64_t)[v4 decodeIntegerForKey:@"SHLSyncSessionFetchTaskFetchType"];
    v6->_syncStartCondition = (NSString *) objc_msgSend( v4,  "decodeObjectOfClass:forKey:",  objc_opt_class(NSString, v10),  @"SHLSyncSessionFetchTaskSyncTrigger");
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  identifier = self->_identifier;
  id v5 = a3;
  [v5 encodeObject:identifier forKey:@"SHLSyncSessionFetchTaskIdentifier"];
  [v5 encodeInteger:self->_fetchType forKey:@"SHLSyncSessionFetchTaskFetchType"];
  [v5 encodeObject:self->_syncStartCondition forKey:@"SHLSyncSessionFetchTaskSyncTrigger"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSProgress)progress
{
  return self->_progress;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (int64_t)retryCount
{
  return self->_retryCount;
}

- (void)setRetryCount:(int64_t)a3
{
  self->_retryCount = a3;
}

- (SHLSyncSession)session
{
  return (SHLSyncSession *)objc_loadWeakRetained((id *)&self->session);
}

- (void)setSession:(id)a3
{
}

- (NSString)syncStartCondition
{
  return self->_syncStartCondition;
}

- (void)setSyncStartCondition:(id)a3
{
  self->_syncStartCondition = (NSString *)a3;
}

- (int64_t)fetchType
{
  return self->_fetchType;
}

- (void)setFetchType:(int64_t)a3
{
  self->_fetchType = a3;
}

- (SHLSyncSessionFetchTaskDelegate)delegate
{
  return (SHLSyncSessionFetchTaskDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
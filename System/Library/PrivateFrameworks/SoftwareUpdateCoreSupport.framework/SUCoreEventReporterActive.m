@interface SUCoreEventReporterActive
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSURL)serverURL;
- (SUCoreEventReporterActive)initWithCoder:(id)a3;
- (SUCoreEventReporterActive)initWithServerURL:(id)a3;
- (id)copy;
- (id)description;
- (id)initFromArchivedData:(id)a3;
- (id)toArchivedData;
- (int64_t)attemptedSendCount;
- (int64_t)discoveredCancelingCount;
- (int64_t)discoveredRunningCount;
- (int64_t)discoveredSuspendedCount;
- (int64_t)failedSendCount;
- (void)encodeWithCoder:(id)a3;
- (void)setAttemptedSendCount:(int64_t)a3;
- (void)setDiscoveredCancelingCount:(int64_t)a3;
- (void)setDiscoveredRunningCount:(int64_t)a3;
- (void)setDiscoveredSuspendedCount:(int64_t)a3;
- (void)setFailedSendCount:(int64_t)a3;
- (void)setServerURL:(id)a3;
@end

@implementation SUCoreEventReporterActive

- (SUCoreEventReporterActive)initWithServerURL:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___SUCoreEventReporterActive;
  v6 = -[SUCoreEventReporterActive init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_serverURL, a3);
    v7->_discoveredCancelingCount = 0LL;
    *(_OWORD *)&v7->_attemptedSendCount = 0u;
    *(_OWORD *)&v7->_discoveredRunningCount = 0u;
  }

  return v7;
}

- (SUCoreEventReporterActive)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___SUCoreEventReporterActive;
  id v5 = -[SUCoreEventReporterActive init](&v9, sel_init);
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ServerURL"];
    serverURL = v5->_serverURL;
    v5->_serverURL = (NSURL *)v6;

    v5->_attemptedSendCount = [v4 decodeIntegerForKey:@"AttemptedSendCount"];
    v5->_failedSendCount = [v4 decodeIntegerForKey:@"FailedSendCount"];
    v5->_discoveredRunningCount = [v4 decodeIntegerForKey:@"DiscoveredRunningCount"];
    v5->_discoveredSuspendedCount = [v4 decodeIntegerForKey:@"DiscoveredSuspendedCount"];
    v5->_discoveredCancelingCount = [v4 decodeIntegerForKey:@"DiscoveredCancelingCount"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  -[SUCoreEventReporterActive serverURL](self, "serverURL");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 encodeObject:v4 forKey:@"ServerURL"];

  objc_msgSend( v5,  "encodeInteger:forKey:",  -[SUCoreEventReporterActive attemptedSendCount](self, "attemptedSendCount"),  @"AttemptedSendCount");
  objc_msgSend( v5,  "encodeInteger:forKey:",  -[SUCoreEventReporterActive failedSendCount](self, "failedSendCount"),  @"FailedSendCount");
  objc_msgSend( v5,  "encodeInteger:forKey:",  -[SUCoreEventReporterActive discoveredRunningCount](self, "discoveredRunningCount"),  @"DiscoveredRunningCount");
  objc_msgSend( v5,  "encodeInteger:forKey:",  -[SUCoreEventReporterActive discoveredSuspendedCount](self, "discoveredSuspendedCount"),  @"DiscoveredSuspendedCount");
  objc_msgSend( v5,  "encodeInteger:forKey:",  -[SUCoreEventReporterActive discoveredCancelingCount](self, "discoveredCancelingCount"),  @"DiscoveredCancelingCount");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copy
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  [MEMORY[0x189607908] unarchivedObjectOfClass:objc_opt_class() fromData:v2 error:0];
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)toArchivedData
{
  return (id)[MEMORY[0x1896078F8] archivedDataWithRootObject:self requiringSecureCoding:1 error:0];
}

- (id)initFromArchivedData:(id)a3
{
  id v4 = (void *)MEMORY[0x189607908];
  id v5 = a3;
  [v4 unarchivedObjectOfClass:objc_opt_class() fromData:v5 error:0];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (SUCoreEventReporterActive *)a3;
  if (v4 == self)
  {
    BOOL v13 = 1;
  }

  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      id v5 = v4;
      -[SUCoreEventReporterActive serverURL](self, "serverURL");
      uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = -[SUCoreEventReporterActive serverURL](v5, "serverURL");
      if (+[SUCore objectIsEqual:to:](&OBJC_CLASS___SUCore, "objectIsEqual:to:", v6, v7)
        && (uint64_t v8 = -[SUCoreEventReporterActive attemptedSendCount](v5, "attemptedSendCount"),
            v8 == -[SUCoreEventReporterActive attemptedSendCount](self, "attemptedSendCount"))
        && (uint64_t v9 = -[SUCoreEventReporterActive failedSendCount](v5, "failedSendCount"),
            v9 == -[SUCoreEventReporterActive failedSendCount](self, "failedSendCount"))
        && (uint64_t v10 = -[SUCoreEventReporterActive discoveredRunningCount](v5, "discoveredRunningCount"),
            v10 == -[SUCoreEventReporterActive discoveredRunningCount](self, "discoveredRunningCount"))
        && (uint64_t v11 = -[SUCoreEventReporterActive discoveredSuspendedCount](v5, "discoveredSuspendedCount"),
            v11 == -[SUCoreEventReporterActive discoveredSuspendedCount](self, "discoveredSuspendedCount")))
      {
        uint64_t v12 = -[SUCoreEventReporterActive discoveredCancelingCount](v5, "discoveredCancelingCount");
        BOOL v13 = v12 == -[SUCoreEventReporterActive discoveredCancelingCount](self, "discoveredCancelingCount");
      }

      else
      {
        BOOL v13 = 0;
      }
    }

    else
    {
      BOOL v13 = 0;
    }
  }

  return v13;
}

- (id)description
{
  id v3 = objc_alloc(NSString);
  -[SUCoreEventReporterActive serverURL](self, "serverURL");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[SUCoreEventReporterActive serverURL](self, "serverURL");
    id v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    id v5 = @"DEFAULT";
  }

  uint64_t v6 = (void *)[v3 initWithFormat:@"serverURL:%@ attemptedSendCount:%d failedSendCount:%d discoveredRunningCount:%d discoveredSuspendedCount:%d discoveredCancelingCount:%d", v5, -[SUCoreEventReporterActive attemptedSendCount](self, "attemptedSendCount"), -[SUCoreEventReporterActive failedSendCount](self, "failedSendCount"), -[SUCoreEventReporterActive discoveredRunningCount](self, "discoveredRunningCount"), -[SUCoreEventReporterActive discoveredSuspendedCount](self, "discoveredSuspendedCount"), -[SUCoreEventReporterActive discoveredCancelingCount](self, "discoveredCancelingCount")];
  if (v4) {

  }
  return v6;
}

- (NSURL)serverURL
{
  return self->_serverURL;
}

- (void)setServerURL:(id)a3
{
}

- (int64_t)attemptedSendCount
{
  return self->_attemptedSendCount;
}

- (void)setAttemptedSendCount:(int64_t)a3
{
  self->_attemptedSendCount = a3;
}

- (int64_t)failedSendCount
{
  return self->_failedSendCount;
}

- (void)setFailedSendCount:(int64_t)a3
{
  self->_failedSendCount = a3;
}

- (int64_t)discoveredRunningCount
{
  return self->_discoveredRunningCount;
}

- (void)setDiscoveredRunningCount:(int64_t)a3
{
  self->_discoveredRunningCount = a3;
}

- (int64_t)discoveredSuspendedCount
{
  return self->_discoveredSuspendedCount;
}

- (void)setDiscoveredSuspendedCount:(int64_t)a3
{
  self->_discoveredSuspendedCount = a3;
}

- (int64_t)discoveredCancelingCount
{
  return self->_discoveredCancelingCount;
}

- (void)setDiscoveredCancelingCount:(int64_t)a3
{
  self->_discoveredCancelingCount = a3;
}

- (void).cxx_destruct
{
}

@end
@interface ADAnalyticsIdentifiersCheckpoint
+ (BOOL)supportsSecureCoding;
+ (id)unarchive:(id)a3;
- (ADAnalyticsIdentifiersCheckpoint)initWithCoder:(id)a3;
- (ADAnalyticsIdentifiersCheckpoint)initWithCurrentUserSeed:(id)a3 currentUserSeedExpirationDate:(id)a4 nextUserSeed:(id)a5 nextUserSeedEffectiveFromDate:(id)a6 nextUserSeedExpirationDate:(id)a7;
- (BOOL)hasValidCurrentUserSeed:(id)a3;
- (BOOL)hasValidNextUserSeed:(id)a3;
- (NSDate)currentUserSeedExpirationDate;
- (NSDate)nextUserSeedEffectiveFromDate;
- (NSDate)nextUserSeedExpirationDate;
- (NSUUID)currentUserSeed;
- (NSUUID)nextUserSeed;
- (id)archive;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ADAnalyticsIdentifiersCheckpoint

- (ADAnalyticsIdentifiersCheckpoint)initWithCurrentUserSeed:(id)a3 currentUserSeedExpirationDate:(id)a4 nextUserSeed:(id)a5 nextUserSeedEffectiveFromDate:(id)a6 nextUserSeedExpirationDate:(id)a7
{
  id v20 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v21.receiver = self;
  v21.super_class = (Class)&OBJC_CLASS___ADAnalyticsIdentifiersCheckpoint;
  v17 = -[ADAnalyticsIdentifiersCheckpoint init](&v21, "init");
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_currentUserSeed, a3);
    if (v18->_currentUserSeed) {
      objc_storeStrong((id *)&v18->_currentUserSeedExpirationDate, a4);
    }
    objc_storeStrong((id *)&v18->_nextUserSeed, a5);
    if (v18->_nextUserSeed)
    {
      objc_storeStrong((id *)&v18->_nextUserSeedEffectiveFromDate, a6);
      objc_storeStrong((id *)&v18->_nextUserSeedExpirationDate, a7);
    }
  }

  return v18;
}

- (BOOL)hasValidCurrentUserSeed:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ADAnalyticsIdentifiersCheckpoint currentUserSeed](self, "currentUserSeed"));
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue( -[ADAnalyticsIdentifiersCheckpoint currentUserSeedExpirationDate]( self,  "currentUserSeedExpirationDate"));
    BOOL v7 = [v6 compare:v4] == (id)1;
  }

  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (BOOL)hasValidNextUserSeed:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ADAnalyticsIdentifiersCheckpoint nextUserSeed](self, "nextUserSeed"));
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue( -[ADAnalyticsIdentifiersCheckpoint nextUserSeedEffectiveFromDate]( self,  "nextUserSeedEffectiveFromDate"));
    if ([v6 compare:v4] == (id)1)
    {
      BOOL v7 = 0;
    }

    else
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[ADAnalyticsIdentifiersCheckpoint nextUserSeedExpirationDate](self, "nextUserSeedExpirationDate"));
      BOOL v7 = [v8 compare:v4] == (id)1;
    }
  }

  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (ADAnalyticsIdentifiersCheckpoint)initWithCoder:(id)a3
{
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)&OBJC_CLASS___ADAnalyticsIdentifiersCheckpoint;
  v5 = -[ADAnalyticsIdentifiersCheckpoint init](&v22, "init");
  if (v5)
  {
    id v6 = [v4 decodeObjectOfClass:objc_opt_class(NSUUID) forKey:@"_currentUserSeed"];
    uint64_t v7 = objc_claimAutoreleasedReturnValue(v6);
    currentUserSeed = v5->_currentUserSeed;
    v5->_currentUserSeed = (NSUUID *)v7;

    id v9 = [v4 decodeObjectOfClass:objc_opt_class(NSDate) forKey:@"_currentUserSeedExpirationDate"];
    uint64_t v10 = objc_claimAutoreleasedReturnValue(v9);
    currentUserSeedExpirationDate = v5->_currentUserSeedExpirationDate;
    v5->_currentUserSeedExpirationDate = (NSDate *)v10;

    id v12 = [v4 decodeObjectOfClass:objc_opt_class(NSUUID) forKey:@"_nextUserSeed"];
    uint64_t v13 = objc_claimAutoreleasedReturnValue(v12);
    nextUserSeed = v5->_nextUserSeed;
    v5->_nextUserSeed = (NSUUID *)v13;

    id v15 = [v4 decodeObjectOfClass:objc_opt_class(NSDate) forKey:@"_nextUserSeedEffectiveFromDate"];
    uint64_t v16 = objc_claimAutoreleasedReturnValue(v15);
    nextUserSeedEffectiveFromDate = v5->_nextUserSeedEffectiveFromDate;
    v5->_nextUserSeedEffectiveFromDate = (NSDate *)v16;

    id v18 = [v4 decodeObjectOfClass:objc_opt_class(NSDate) forKey:@"_nextUserSeedExpirationDate"];
    uint64_t v19 = objc_claimAutoreleasedReturnValue(v18);
    nextUserSeedExpirationDate = v5->_nextUserSeedExpirationDate;
    v5->_nextUserSeedExpirationDate = (NSDate *)v19;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  currentUserSeed = self->_currentUserSeed;
  id v5 = a3;
  [v5 encodeObject:currentUserSeed forKey:@"_currentUserSeed"];
  [v5 encodeObject:self->_currentUserSeedExpirationDate forKey:@"_currentUserSeedExpirationDate"];
  [v5 encodeObject:self->_nextUserSeed forKey:@"_nextUserSeed"];
  [v5 encodeObject:self->_nextUserSeedEffectiveFromDate forKey:@"_nextUserSeedEffectiveFromDate"];
  [v5 encodeObject:self->_nextUserSeedExpirationDate forKey:@"_nextUserSeedExpirationDate"];
}

- (id)archive
{
  id v7 = 0LL;
  v2 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  self,  1LL,  &v7));
  id v3 = v7;
  if (v3)
  {
    id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[ADAnalyticsIdentifiersUtils logger](&OBJC_CLASS___ADAnalyticsIdentifiersUtils, "logger"));
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v9 = v3;
      _os_log_error_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_ERROR,  "Checkpoint could not be archived; Error:%@",
        buf,
        0xCu);
    }

    id v5 = 0LL;
  }

  else
  {
    id v5 = v2;
  }

  return v5;
}

- (NSUUID)currentUserSeed
{
  return (NSUUID *)objc_getProperty(self, a2, 8LL, 1);
}

- (NSDate)currentUserSeedExpirationDate
{
  return (NSDate *)objc_getProperty(self, a2, 16LL, 1);
}

- (NSUUID)nextUserSeed
{
  return (NSUUID *)objc_getProperty(self, a2, 24LL, 1);
}

- (NSDate)nextUserSeedEffectiveFromDate
{
  return (NSDate *)objc_getProperty(self, a2, 32LL, 1);
}

- (NSDate)nextUserSeedExpirationDate
{
  return (NSDate *)objc_getProperty(self, a2, 40LL, 1);
}

- (void).cxx_destruct
{
}

+ (id)unarchive:(id)a3
{
  id v3 = a3;
  id v10 = 0LL;
  id v4 = +[NSKeyedUnarchiver unarchivedObjectOfClass:fromData:error:]( &OBJC_CLASS___NSKeyedUnarchiver,  "unarchivedObjectOfClass:fromData:error:",  objc_opt_class(&OBJC_CLASS___ADAnalyticsIdentifiersCheckpoint),  v3,  &v10);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);

  id v6 = v10;
  if (v6)
  {
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[ADAnalyticsIdentifiersUtils logger](&OBJC_CLASS___ADAnalyticsIdentifiersUtils, "logger"));
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v12 = v6;
      _os_log_error_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_ERROR,  "Checkpoint object could not be decoded; Error: %@",
        buf,
        0xCu);
    }

    id v8 = 0LL;
  }

  else
  {
    id v8 = v5;
  }

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
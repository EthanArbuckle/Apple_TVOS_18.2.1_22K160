@interface MADAutoAssetScheduledJob
+ (BOOL)supportsSecureCoding;
- (BOOL)pushedJob;
- (BOOL)requiringRetry;
- (BOOL)setJob;
- (MAAutoAssetSelector)assetSelector;
- (MADAutoAssetScheduledJob)initWithCoder:(id)a3;
- (MADAutoSetPolicy)pushedPolicy;
- (MADAutoSetPolicy)setPolicy;
- (id)copy;
- (id)initForAssetSelector:(id)a3 withActivityInterval:(int64_t)a4 forPushedJob:(BOOL)a5;
- (id)initForAssetSelector:(id)a3 withActivityInterval:(int64_t)a4 forPushedJob:(BOOL)a5 forSetJob:(BOOL)a6 requiringRetry:(BOOL)a7;
- (id)initForAssetSelector:(id)a3 withActivityInterval:(int64_t)a4 forPushedJob:(BOOL)a5 forSetJob:(BOOL)a6 withSetPolicy:(id)a7 requiringRetry:(BOOL)a8;
- (id)initForAssetSelector:(id)a3 withActivityInterval:(int64_t)a4 forPushedJob:(BOOL)a5 forSetJob:(BOOL)a6 withSetPolicy:(id)a7 withPushedPolicy:(id)a8 requiringRetry:(BOOL)a9;
- (id)initForAssetSelector:(id)a3 withActivityInterval:(int64_t)a4 forPushedJob:(BOOL)a5 requiringRetry:(BOOL)a6;
- (id)summary;
- (int64_t)intervalSecs;
- (int64_t)remainingSecs;
- (void)encodeWithCoder:(id)a3;
- (void)setAssetSelector:(id)a3;
- (void)setIntervalSecs:(int64_t)a3;
- (void)setPushedJob:(BOOL)a3;
- (void)setPushedPolicy:(id)a3;
- (void)setRemainingSecs:(int64_t)a3;
- (void)setRequiringRetry:(BOOL)a3;
- (void)setSetJob:(BOOL)a3;
- (void)setSetPolicy:(id)a3;
@end

@implementation MADAutoAssetScheduledJob

- (MAAutoAssetSelector)assetSelector
{
  return self->_assetSelector;
}

- (int64_t)intervalSecs
{
  return self->_intervalSecs;
}

- (int64_t)remainingSecs
{
  return self->_remainingSecs;
}

- (BOOL)pushedJob
{
  return self->_pushedJob;
}

- (BOOL)setJob
{
  return self->_setJob;
}

- (id)summary
{
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetScheduledJob assetSelector](self, "assetSelector"));
  v17 = (void *)objc_claimAutoreleasedReturnValue([v18 summary]);
  id v16 = +[MADAutoAssetControlManager allocIntervalString:]( &OBJC_CLASS___MADAutoAssetControlManager,  "allocIntervalString:",  -[MADAutoAssetScheduledJob intervalSecs](self, "intervalSecs"));
  id v4 = +[MADAutoAssetControlManager allocIntervalString:]( &OBJC_CLASS___MADAutoAssetControlManager,  "allocIntervalString:",  -[MADAutoAssetScheduledJob remainingSecs](self, "remainingSecs"));
  v5 = @"N";
  if (-[MADAutoAssetScheduledJob pushedJob](self, "pushedJob")) {
    v6 = @"Y";
  }
  else {
    v6 = @"N";
  }
  v15 = v6;
  if (-[MADAutoAssetScheduledJob setJob](self, "setJob")) {
    v7 = @"Y";
  }
  else {
    v7 = @"N";
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetScheduledJob setPolicy](self, "setPolicy"));
  if (v8)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetScheduledJob setPolicy](self, "setPolicy"));
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue([v14 summary]);
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetScheduledJob pushedPolicy](self, "pushedPolicy"));
  if (v9)
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetScheduledJob pushedPolicy](self, "pushedPolicy"));
    v10 = (__CFString *)objc_claimAutoreleasedReturnValue([v2 summary]);
  }

  else
  {
    v10 = @"N";
  }

  if (-[MADAutoAssetScheduledJob requiringRetry](self, "requiringRetry")) {
    v11 = @"Y";
  }
  else {
    v11 = @"N";
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"selector:%@|intervalSecs:%@|remainingSecs:%@|pushedJob:%@||setJob:%@|setPolicy:%@|pushedPolicy:%@|requiringRetry:%@",  v17,  v16,  v4,  v15,  v7,  v5,  v10,  v11));
  if (v9)
  {
  }

  if (v8)
  {
  }

  return v12;
}

- (MADAutoSetPolicy)setPolicy
{
  return self->_setPolicy;
}

- (BOOL)requiringRetry
{
  return self->_requiringRetry;
}

- (id)initForAssetSelector:(id)a3 withActivityInterval:(int64_t)a4 forPushedJob:(BOOL)a5
{
  return -[MADAutoAssetScheduledJob initForAssetSelector:withActivityInterval:forPushedJob:forSetJob:withSetPolicy:requiringRetry:]( self,  "initForAssetSelector:withActivityInterval:forPushedJob:forSetJob:withSetPolicy:requiringRetry:",  a3,  a4,  a5,  0LL,  0LL,  0LL);
}

- (id)initForAssetSelector:(id)a3 withActivityInterval:(int64_t)a4 forPushedJob:(BOOL)a5 requiringRetry:(BOOL)a6
{
  return -[MADAutoAssetScheduledJob initForAssetSelector:withActivityInterval:forPushedJob:forSetJob:withSetPolicy:requiringRetry:]( self,  "initForAssetSelector:withActivityInterval:forPushedJob:forSetJob:withSetPolicy:requiringRetry:",  a3,  a4,  a5,  0LL,  0LL,  a6);
}

- (id)initForAssetSelector:(id)a3 withActivityInterval:(int64_t)a4 forPushedJob:(BOOL)a5 forSetJob:(BOOL)a6 requiringRetry:(BOOL)a7
{
  return -[MADAutoAssetScheduledJob initForAssetSelector:withActivityInterval:forPushedJob:forSetJob:withSetPolicy:requiringRetry:]( self,  "initForAssetSelector:withActivityInterval:forPushedJob:forSetJob:withSetPolicy:requiringRetry:",  a3,  a4,  a5,  a6,  0LL,  a7);
}

- (id)initForAssetSelector:(id)a3 withActivityInterval:(int64_t)a4 forPushedJob:(BOOL)a5 forSetJob:(BOOL)a6 withSetPolicy:(id)a7 requiringRetry:(BOOL)a8
{
  LOBYTE(v9) = a8;
  return -[MADAutoAssetScheduledJob initForAssetSelector:withActivityInterval:forPushedJob:forSetJob:withSetPolicy:withPushedPolicy:requiringRetry:]( self,  "initForAssetSelector:withActivityInterval:forPushedJob:forSetJob:withSetPolicy:withPushedPolicy:requiringRetry:",  a3,  a4,  a5,  a6,  a7,  0LL,  v9);
}

- (id)initForAssetSelector:(id)a3 withActivityInterval:(int64_t)a4 forPushedJob:(BOOL)a5 forSetJob:(BOOL)a6 withSetPolicy:(id)a7 withPushedPolicy:(id)a8 requiringRetry:(BOOL)a9
{
  id v16 = a3;
  id v17 = a7;
  id v18 = a8;
  v22.receiver = self;
  v22.super_class = (Class)&OBJC_CLASS___MADAutoAssetScheduledJob;
  v19 = -[MADAutoAssetScheduledJob init](&v22, "init");
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_assetSelector, a3);
    v20->_intervalSecs = a4;
    v20->_remainingSecs = a4;
    v20->_pushedJob = a5;
    v20->_setJob = a6;
    objc_storeStrong((id *)&v20->_setPolicy, a7);
    objc_storeStrong((id *)&v20->_pushedPolicy, a8);
    v20->_requiringRetry = a9;
  }

  return v20;
}

- (MADAutoAssetScheduledJob)initWithCoder:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___MADAutoAssetScheduledJob;
  v5 = -[MADAutoAssetScheduledJob init](&v16, "init");
  if (v5)
  {
    id v6 = [v4 decodeObjectOfClass:objc_opt_class(MAAutoAssetSelector) forKey:@"assetSelector"];
    uint64_t v7 = objc_claimAutoreleasedReturnValue(v6);
    assetSelector = v5->_assetSelector;
    v5->_assetSelector = (MAAutoAssetSelector *)v7;

    v5->_intervalSecs = (int64_t)[v4 decodeInt64ForKey:@"intervalSecs"];
    v5->_remainingSecs = (int64_t)[v4 decodeInt64ForKey:@"remainingSecs"];
    v5->_pushedJob = [v4 decodeBoolForKey:@"pushedJob"];
    v5->_setJob = [v4 decodeBoolForKey:@"setJob"];
    id v9 = [v4 decodeObjectOfClass:objc_opt_class(MADAutoSetPolicy) forKey:@"setPolicy"];
    uint64_t v10 = objc_claimAutoreleasedReturnValue(v9);
    setPolicy = v5->_setPolicy;
    v5->_setPolicy = (MADAutoSetPolicy *)v10;

    id v12 = [v4 decodeObjectOfClass:objc_opt_class(MADAutoSetPolicy) forKey:@"pushedPolicy"];
    uint64_t v13 = objc_claimAutoreleasedReturnValue(v12);
    pushedPolicy = v5->_pushedPolicy;
    v5->_pushedPolicy = (MADAutoSetPolicy *)v13;

    v5->_requiringRetry = [v4 decodeBoolForKey:@"requiringRetry"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v7 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetScheduledJob assetSelector](self, "assetSelector"));
  [v7 encodeObject:v4 forKey:@"assetSelector"];

  objc_msgSend( v7,  "encodeInt64:forKey:",  -[MADAutoAssetScheduledJob intervalSecs](self, "intervalSecs"),  @"intervalSecs");
  objc_msgSend( v7,  "encodeInt64:forKey:",  -[MADAutoAssetScheduledJob remainingSecs](self, "remainingSecs"),  @"remainingSecs");
  objc_msgSend(v7, "encodeBool:forKey:", -[MADAutoAssetScheduledJob pushedJob](self, "pushedJob"), @"pushedJob");
  objc_msgSend(v7, "encodeBool:forKey:", -[MADAutoAssetScheduledJob setJob](self, "setJob"), @"setJob");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetScheduledJob setPolicy](self, "setPolicy"));
  [v7 encodeObject:v5 forKey:@"setPolicy"];

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetScheduledJob pushedPolicy](self, "pushedPolicy"));
  [v7 encodeObject:v6 forKey:@"pushedPolicy"];

  objc_msgSend( v7,  "encodeBool:forKey:",  -[MADAutoAssetScheduledJob requiringRetry](self, "requiringRetry"),  @"requiringRetry");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copy
{
  v3 = objc_alloc(&OBJC_CLASS___MADAutoAssetScheduledJob);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetScheduledJob assetSelector](self, "assetSelector"));
  int64_t v5 = -[MADAutoAssetScheduledJob intervalSecs](self, "intervalSecs");
  BOOL v6 = -[MADAutoAssetScheduledJob pushedJob](self, "pushedJob");
  BOOL v7 = -[MADAutoAssetScheduledJob setJob](self, "setJob");
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetScheduledJob setPolicy](self, "setPolicy"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetScheduledJob pushedPolicy](self, "pushedPolicy"));
  LOBYTE(v12) = -[MADAutoAssetScheduledJob requiringRetry](self, "requiringRetry");
  id v10 = -[MADAutoAssetScheduledJob initForAssetSelector:withActivityInterval:forPushedJob:forSetJob:withSetPolicy:withPushedPolicy:requiringRetry:]( v3,  "initForAssetSelector:withActivityInterval:forPushedJob:forSetJob:withSetPolicy:withPushedPolicy:requiringRetry:",  v4,  v5,  v6,  v7,  v8,  v9,  v12);

  objc_msgSend(v10, "setRemainingSecs:", -[MADAutoAssetScheduledJob remainingSecs](self, "remainingSecs"));
  return v10;
}

- (void)setAssetSelector:(id)a3
{
}

- (void)setIntervalSecs:(int64_t)a3
{
  self->_intervalSecs = a3;
}

- (void)setRemainingSecs:(int64_t)a3
{
  self->_remainingSecs = a3;
}

- (void)setPushedJob:(BOOL)a3
{
  self->_pushedJob = a3;
}

- (void)setRequiringRetry:(BOOL)a3
{
  self->_requiringRetry = a3;
}

- (void)setSetJob:(BOOL)a3
{
  self->_setJob = a3;
}

- (void)setSetPolicy:(id)a3
{
}

- (MADAutoSetPolicy)pushedPolicy
{
  return self->_pushedPolicy;
}

- (void)setPushedPolicy:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
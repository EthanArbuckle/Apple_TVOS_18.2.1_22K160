@interface MADAutoAssetTimed
+ (BOOL)supportsSecureCoding;
- (BOOL)timerInvalidated;
- (MADAutoAssetTimed)initWithCoder:(id)a3;
- (NSString)timerUUID;
- (NSTimer)timerInstance;
- (id)initForRequest:(id)a3 withTimeout:(int64_t)a4;
- (id)requestBeingTimed;
- (id)summary;
- (int64_t)timeoutSecs;
- (void)encodeWithCoder:(id)a3;
- (void)setTimerInstance:(id)a3;
- (void)setTimerInvalidated:(BOOL)a3;
@end

@implementation MADAutoAssetTimed

- (id)initForRequest:(id)a3 withTimeout:(int64_t)a4
{
  id v7 = a3;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___MADAutoAssetTimed;
  v8 = -[MADAutoAssetTimed init](&v15, "init");
  v9 = v8;
  if (v8)
  {
    objc_storeStrong(&v8->_requestBeingTimed, a3);
    v9->_timeoutSecs = a4;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
    uint64_t v11 = objc_claimAutoreleasedReturnValue([v10 UUIDString]);
    timerUUID = v9->_timerUUID;
    v9->_timerUUID = (NSString *)v11;

    timerInstance = v9->_timerInstance;
    v9->_timerInstance = 0LL;

    v9->_timerInvalidated = 0;
  }

  return v9;
}

- (MADAutoAssetTimed)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___MADAutoAssetTimed;
  v5 = -[MADAutoAssetTimed init](&v12, "init");
  if (v5)
  {
    v5->_timeoutSecs = (int64_t)[v4 decodeIntegerForKey:@"timeoutSecs"];
    id v6 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"timerUUID"];
    uint64_t v7 = objc_claimAutoreleasedReturnValue(v6);
    timerUUID = v5->_timerUUID;
    v5->_timerUUID = (NSString *)v7;

    v5->_timerInvalidated = [v4 decodeBoolForKey:@"timerInvalidated"];
    id requestBeingTimed = v5->_requestBeingTimed;
    v5->_id requestBeingTimed = 0LL;

    timerInstance = v5->_timerInstance;
    v5->_timerInstance = 0LL;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", -[MADAutoAssetTimed timeoutSecs](self, "timeoutSecs"), @"timeoutSecs");
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetTimed timerUUID](self, "timerUUID"));
  [v5 encodeObject:v4 forKey:@"timerUUID"];

  objc_msgSend( v5,  "encodeBool:forKey:",  -[MADAutoAssetTimed timerInvalidated](self, "timerInvalidated"),  @"timerInvalidated");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)summary
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetTimed requestBeingTimed](self, "requestBeingTimed"));
  if (v3) {
    id v4 = @"Y";
  }
  else {
    id v4 = @"N";
  }
  int64_t v5 = -[MADAutoAssetTimed timeoutSecs](self, "timeoutSecs");
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetTimed timerUUID](self, "timerUUID"));
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetTimed timerInstance](self, "timerInstance"));
  if (v7) {
    v8 = @"Y";
  }
  else {
    v8 = @"N";
  }
  if (-[MADAutoAssetTimed timerInvalidated](self, "timerInvalidated")) {
    v9 = @"Y";
  }
  else {
    v9 = @"N";
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"|request:%@|timeout:%ld|timerUUID:%@|instance:%@|invalidated:%@|",  v4,  v5,  v6,  v8,  v9));

  return v10;
}

- (id)requestBeingTimed
{
  return self->_requestBeingTimed;
}

- (int64_t)timeoutSecs
{
  return self->_timeoutSecs;
}

- (NSString)timerUUID
{
  return self->_timerUUID;
}

- (NSTimer)timerInstance
{
  return self->_timerInstance;
}

- (void)setTimerInstance:(id)a3
{
}

- (BOOL)timerInvalidated
{
  return self->_timerInvalidated;
}

- (void)setTimerInvalidated:(BOOL)a3
{
  self->_timerInvalidated = a3;
}

- (void).cxx_destruct
{
}

@end
@interface RateLimiter
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSArray)groups;
- (NSDate)lastJudgment;
- (NSDate)overloadUntil;
- (NSDictionary)config;
- (NSString)assetType;
- (RateLimiter)initWithCoder:(id)a3;
- (RateLimiter)initWithConfig:(id)a3;
- (id)consumeTokenFromBucket:(id)a3 config:(id)a4 name:(id)a5 at:(id)a6;
- (id)diagnostics;
- (id)getPropertyValue:(id)a3 object:(id)a4;
- (int64_t)judge:(id)a3 at:(id)a4 limitTime:(id *)a5;
- (unint64_t)stateSize;
- (void)encodeWithCoder:(id)a3;
- (void)reset;
- (void)setAssetType:(id)a3;
- (void)setConfig:(id)a3;
- (void)setGroups:(id)a3;
- (void)setLastJudgment:(id)a3;
- (void)setOverloadUntil:(id)a3;
- (void)trim:(id)a3;
@end

@implementation RateLimiter

- (RateLimiter)initWithConfig:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___RateLimiter;
  v6 = -[RateLimiter init](&v10, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_config, a3);
    assetType = v7->_assetType;
    v7->_assetType = 0LL;

    -[RateLimiter reset](v7, "reset");
  }

  return v7;
}

- (RateLimiter)initWithCoder:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v44.receiver = self;
    v44.super_class = (Class)&OBJC_CLASS___RateLimiter;
    v6 = -[RateLimiter init](&v44, "init");
    if (v6)
    {
      uint64_t v7 = objc_opt_class(&OBJC_CLASS___NSArray, v5);
      uint64_t v9 = objc_opt_class(&OBJC_CLASS___NSMutableDictionary, v8);
      uint64_t v11 = objc_opt_class(&OBJC_CLASS___NSString, v10);
      v13 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v7,  v9,  v11,  objc_opt_class(&OBJC_CLASS___NSDate, v12),  0LL);
      v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
      uint64_t v15 = objc_claimAutoreleasedReturnValue([v4 decodeObjectOfClasses:v14 forKey:@"RLgroups"]);
      groups = v6->_groups;
      v6->_groups = (NSArray *)v15;

      id v18 = objc_msgSend( v4,  "decodeObjectOfClass:forKey:",  objc_opt_class(NSDate, v17),  @"RLoverLoadedUntil");
      uint64_t v19 = objc_claimAutoreleasedReturnValue(v18);
      overloadUntil = v6->_overloadUntil;
      v6->_overloadUntil = (NSDate *)v19;

      id v22 = objc_msgSend( v4,  "decodeObjectOfClass:forKey:",  objc_opt_class(NSDate, v21),  @"RLlastJudgment");
      uint64_t v23 = objc_claimAutoreleasedReturnValue(v22);
      lastJudgment = v6->_lastJudgment;
      v6->_lastJudgment = (NSDate *)v23;

      id v26 = objc_msgSend( v4,  "decodeObjectOfClass:forKey:",  objc_opt_class(NSString, v25),  @"RLassetType");
      uint64_t v27 = objc_claimAutoreleasedReturnValue(v26);
      assetType = v6->_assetType;
      v6->_assetType = (NSString *)v27;

      if (!v6->_assetType)
      {
        uint64_t v30 = objc_opt_class(&OBJC_CLASS___NSMutableArray, v29);
        uint64_t v32 = objc_opt_class(&OBJC_CLASS___NSDictionary, v31);
        uint64_t v34 = objc_opt_class(&OBJC_CLASS___NSString, v33);
        uint64_t v36 = objc_opt_class(&OBJC_CLASS___NSNumber, v35);
        v38 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v30,  v32,  v34,  v36,  objc_opt_class(&OBJC_CLASS___NSDate, v37),  0LL);
        v39 = (void *)objc_claimAutoreleasedReturnValue(v38);
        uint64_t v40 = objc_claimAutoreleasedReturnValue([v4 decodeObjectOfClasses:v39 forKey:@"RLconfig"]);
        config = v6->_config;
        v6->_config = (NSDictionary *)v40;
      }
    }

    self = v6;
    v42 = self;
  }

  else
  {
    v42 = 0LL;
  }

  return v42;
}

- (int64_t)judge:(id)a3 at:(id)a4 limitTime:(id *)a5
{
  id v10 = a3;
  id v60 = a4;
  uint64_t v11 = (void *)CFPreferencesCopyValue( @"DisableKeychainRateLimiting",  @"com.apple.security",  kCFPreferencesAnyUser,  kCFPreferencesAnyHost);
  uint64_t v13 = objc_opt_class(&OBJC_CLASS___NSNumber, v12);
  if ((objc_opt_isKindOfClass(v11, v13) & 1) != 0 && [v11 BOOLValue])
  {
    if (qword_1002DE8E0 != -1) {
      dispatch_once(&qword_1002DE8E0, &stru_100284458);
    }
    dispatch_source_merge_data((dispatch_source_t)qword_1002DE8E8, 1uLL);
    int64_t v14 = 0LL;
    *a5 = 0LL;
    goto LABEL_37;
  }

  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[RateLimiter overloadUntil](self, "overloadUntil"));

  if (v15)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[RateLimiter overloadUntil](self, "overloadUntil"));
    [v60 timeIntervalSinceDate:v16];
    double v18 = v17;

    if (v18 >= 0.0) {
      -[RateLimiter trim:](self, "trim:", v60);
    }
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(-[RateLimiter overloadUntil](self, "overloadUntil"));

    if (v19)
    {
      *a5 = (id)objc_claimAutoreleasedReturnValue(-[RateLimiter overloadUntil](self, "overloadUntil"));
LABEL_21:
      int64_t v14 = 4LL;
      goto LABEL_37;
    }
  }

  v56 = a5;
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[RateLimiter lastJudgment](self, "lastJudgment", v11));
  id v57 = v10;
  if (!v20)
  {
LABEL_16:
    unint64_t v24 = -[RateLimiter stateSize](self, "stateSize");
    uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue(-[RateLimiter config](self, "config"));
    id v26 = (void *)objc_claimAutoreleasedReturnValue([v25 objectForKeyedSubscript:@"general"]);
    uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue([v26 objectForKeyedSubscript:@"maxStateSize"]);
    id v28 = [v27 unsignedIntegerValue];

    if (v20)
    {
    }

    id v10 = v57;
    goto LABEL_19;
  }

  a5 = (id *)objc_claimAutoreleasedReturnValue(-[RateLimiter lastJudgment](self, "lastJudgment"));
  [v60 timeIntervalSinceDate:a5];
  double v22 = v21;
  uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue(-[RateLimiter config](self, "config"));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v23 objectForKeyedSubscript:@"general"]);
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"maxItemAge"]);
  if (v22 <= (double)(int)[v6 intValue])
  {
    v58 = v23;
    goto LABEL_16;
  }

LABEL_19:
  -[RateLimiter trim:](self, "trim:", v60);
  uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue(-[RateLimiter overloadUntil](self, "overloadUntil"));

  if (v29)
  {
    uint64_t v11 = v55;
    id *v56 = (id)objc_claimAutoreleasedReturnValue(-[RateLimiter overloadUntil](self, "overloadUntil"));
    goto LABEL_21;
  }

- (id)consumeTokenFromBucket:(id)a3 config:(id)a4 name:(id)a5 at:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:@"capacity"]);
  unsigned int v14 = [v13 intValue];
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:@"rate"]);
  v16 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v12,  "dateByAddingTimeInterval:",  (double)-(v14 * objc_msgSend(v15, "intValue"))));

  double v17 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:v11]);
  double v18 = v17;
  if (!v17 || ([v17 timeIntervalSinceDate:v16], v19 < 0.0))
  {
    id v20 = v16;

    double v18 = v20;
  }

  double v21 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:@"rate"]);
  double v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "dateByAddingTimeInterval:", (double)(int)objc_msgSend(v21, "intValue")));

  [v9 setObject:v22 forKeyedSubscript:v11];
  [v22 timeIntervalSinceDate:v12];
  if (v23 > 0.0) {
    unint64_t v24 = v22;
  }
  else {
    unint64_t v24 = 0LL;
  }
  id v25 = v24;

  return v25;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v6 = objc_opt_class(&OBJC_CLASS___RateLimiter, v5);
  if ((objc_opt_isKindOfClass(v4, v6) & 1) != 0)
  {
    id v7 = v4;
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[RateLimiter config](self, "config"));
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 config]);
    if (![v8 isEqual:v9])
    {
      unsigned __int8 v17 = 0;
LABEL_30:

      goto LABEL_31;
    }

    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[RateLimiter groups](self, "groups"));
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v7 groups]);
    if (![v10 isEqual:v11])
    {
      unsigned __int8 v17 = 0;
LABEL_29:

      goto LABEL_30;
    }

    id v12 = (void *)objc_claimAutoreleasedReturnValue(-[RateLimiter lastJudgment](self, "lastJudgment"));
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v7 lastJudgment]);
    uint64_t v31 = v12;
    if (![v12 isEqual:v13])
    {
      unsigned __int8 v17 = 0;
LABEL_28:

      goto LABEL_29;
    }

    unsigned int v14 = (void *)objc_claimAutoreleasedReturnValue(-[RateLimiter overloadUntil](self, "overloadUntil"));
    if (v14 || (id v25 = (void *)objc_claimAutoreleasedReturnValue([v7 overloadUntil])) != 0)
    {
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[RateLimiter overloadUntil](self, "overloadUntil"));
      uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue([v7 overloadUntil]);
      uint64_t v30 = v15;
      if (!objc_msgSend(v15, "isEqual:"))
      {
        unsigned __int8 v17 = 0;
LABEL_24:

        goto LABEL_25;
      }

      id v28 = v14;
      int v16 = 1;
    }

    else
    {
      id v28 = 0LL;
      id v25 = 0LL;
      int v16 = 0;
    }

    double v18 = (void *)objc_claimAutoreleasedReturnValue(-[RateLimiter assetType](self, "assetType"));
    if (v18 || (uint64_t v23 = objc_claimAutoreleasedReturnValue([v7 assetType])) != 0)
    {
      int v26 = v16;
      uint64_t v27 = v13;
      double v19 = (void *)objc_claimAutoreleasedReturnValue(-[RateLimiter assetType](self, "assetType", v23, v25));
      id v20 = (void *)objc_claimAutoreleasedReturnValue([v7 assetType]);
      unsigned __int8 v17 = [v19 isEqualToString:v20];

      if (v18)
      {

        uint64_t v13 = v27;
        if (v26)
        {
          unsigned int v14 = v28;
          goto LABEL_24;
        }

        unsigned int v14 = v28;
LABEL_25:
        if (!v14) {

        }
        goto LABEL_28;
      }

      uint64_t v13 = v27;
      LOBYTE(v16) = v26;
      double v21 = v24;
    }

    else
    {
      double v21 = 0LL;
      unsigned __int8 v17 = 1;
    }

    unsigned int v14 = v28;
    if ((v16 & 1) != 0) {
      goto LABEL_24;
    }
    goto LABEL_25;
  }

  unsigned __int8 v17 = 0;
LABEL_31:

  return v17;
}

- (void)reset
{
  id v12 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RateLimiter config](self, "config"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"groups"]);
  id v5 = [v4 count];

  if (v5)
  {
    unint64_t v6 = 0LL;
    do
    {
      id v7 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
      -[NSMutableArray addObject:](v12, "addObject:", v7);

      ++v6;
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[RateLimiter config](self, "config"));
      id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:@"groups"]);
      id v10 = [v9 count];
    }

    while (v6 < (unint64_t)v10);
  }

  -[RateLimiter setGroups:](self, "setGroups:", v12);
  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate distantPast](&OBJC_CLASS___NSDate, "distantPast"));
  -[RateLimiter setLastJudgment:](self, "setLastJudgment:", v11);

  -[RateLimiter setOverloadUntil:](self, "setOverloadUntil:", 0LL);
}

- (void)trim:(id)a3
{
  id v36 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[RateLimiter config](self, "config"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"general"]);
  unint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"maxItemAge"]);
  unsigned int v7 = [v6 intValue];

  __int128 v42 = 0u;
  __int128 v43 = 0u;
  __int128 v40 = 0u;
  __int128 v41 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue(-[RateLimiter groups](self, "groups"));
  id v8 = [obj countByEnumeratingWithState:&v40 objects:v52 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v41;
    do
    {
      for (i = 0LL; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v41 != v10) {
          objc_enumerationMutation(obj);
        }
        id v12 = *(void **)(*((void *)&v40 + 1) + 8LL * (void)i);
        v37[0] = _NSConcreteStackBlock;
        v37[1] = 3221225472LL;
        v37[2] = sub_100074EC0;
        v37[3] = &unk_1002844A0;
        id v38 = v36;
        unsigned int v39 = v7;
        uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v12 keysOfEntriesPassingTest:v37]);
        unsigned int v14 = (void *)objc_claimAutoreleasedReturnValue([v13 allObjects]);
        [v12 removeObjectsForKeys:v14];
      }

      id v9 = [obj countByEnumeratingWithState:&v40 objects:v52 count:16];
    }

    while (v9);
  }

  unint64_t v15 = -[RateLimiter stateSize](self, "stateSize");
  int v16 = (void *)objc_claimAutoreleasedReturnValue(-[RateLimiter config](self, "config"));
  unsigned __int8 v17 = (void *)objc_claimAutoreleasedReturnValue([v16 objectForKeyedSubscript:@"general"]);
  double v18 = (void *)objc_claimAutoreleasedReturnValue([v17 objectForKeyedSubscript:@"maxStateSize"]);
  id v19 = [v18 unsignedIntegerValue];

  if (v15 <= (unint64_t)v19)
  {
    -[RateLimiter setOverloadUntil:](self, "setOverloadUntil:", 0LL);
  }

  else
  {
    id v20 = (void *)objc_claimAutoreleasedReturnValue(-[RateLimiter config](self, "config"));
    double v21 = (void *)objc_claimAutoreleasedReturnValue([v20 objectForKeyedSubscript:@"general"]);
    double v22 = (void *)objc_claimAutoreleasedReturnValue([v21 objectForKeyedSubscript:@"overloadDuration"]);
    uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v36,  "dateByAddingTimeInterval:",  (double)objc_msgSend(v22, "unsignedIntValue")));
    -[RateLimiter setOverloadUntil:](self, "setOverloadUntil:", v23);

    id v24 = sub_1000AA6AC(@"ratelimiter", 0LL);
    id v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      id obja = (id)objc_claimAutoreleasedReturnValue(-[RateLimiter config](self, "config"));
      int v26 = (void *)objc_claimAutoreleasedReturnValue([obja objectForKeyedSubscript:@"general"]);
      uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue([v26 objectForKeyedSubscript:@"name"]);
      unint64_t v28 = -[RateLimiter stateSize](self, "stateSize");
      uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue(-[RateLimiter config](self, "config"));
      uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue([v29 objectForKeyedSubscript:@"general"]);
      uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue([v30 objectForKeyedSubscript:@"maxStateSize"]);
      id v32 = [v31 unsignedLongValue];
      unint64_t v33 = (void *)objc_claimAutoreleasedReturnValue(-[RateLimiter overloadUntil](self, "overloadUntil"));
      *(_DWORD *)buf = 138413058;
      id v45 = v27;
      __int16 v46 = 2048;
      unint64_t v47 = v28;
      __int16 v48 = 2048;
      id v49 = v32;
      __int16 v50 = 2112;
      v51 = v33;
      _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_ERROR,  "RateLimiter[%@] state size %lu exceeds max %lu, overloaded until %@",  buf,  0x2Au);
    }
  }
}

- (unint64_t)stateSize
{
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RateLimiter groups](self, "groups", 0LL));
  id v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    id v4 = v3;
    unint64_t v5 = 0LL;
    uint64_t v6 = *(void *)v10;
    do
    {
      for (i = 0LL; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v2);
        }
        v5 += (unint64_t)[*(id *)(*((void *)&v9 + 1) + 8 * (void)i) count];
      }

      id v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }

    while (v4);
  }

  else
  {
    unint64_t v5 = 0LL;
  }

  return v5;
}

- (id)diagnostics
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[RateLimiter config](self, "config"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"general"]);
  unint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"name"]);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[RateLimiter config](self, "config"));
  unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue(-[RateLimiter groups](self, "groups"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[RateLimiter overloadUntil](self, "overloadUntil"));
  __int128 v9 = (void *)objc_claimAutoreleasedReturnValue(-[RateLimiter lastJudgment](self, "lastJudgment"));
  __int128 v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"RateLimiter[%@]\nconfig:%@\ngroups:%@\noverloaded:%@\nlastJudgment:%@",  v5,  v6,  v7,  v8,  v9));

  return v10;
}

- (id)getPropertyValue:(id)a3 object:(id)a4
{
  uint64_t v6 = (NSString *)a3;
  id v7 = a4;
  if (-[NSString isEqualToString:](v6, "isEqualToString:", @"accessGroup")
    || -[NSString isEqualToString:](v6, "isEqualToString:", @"uuid"))
  {
    SEL v8 = NSSelectorFromString(v6);
    uint64_t v9 = ((uint64_t (*)(id, SEL))[v7 methodForSelector:v8])(v7, v8);
    __int128 v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  }

  else
  {
    __int128 v11 = sub_10001267C("SecCritical");
    __int128 v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[RateLimiter config](self, "config"));
      unsigned int v14 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKeyedSubscript:@"general"]);
      unint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKeyedSubscript:@"name"]);
      int v17 = 138412546;
      double v18 = v15;
      __int16 v19 = 2112;
      id v20 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "RateLimter[%@]: %@ is not an approved selector string",  (uint8_t *)&v17,  0x16u);
    }

    __int128 v10 = 0LL;
  }

  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeObject:self->_groups forKey:@"RLgroups"];
  [v4 encodeObject:self->_overloadUntil forKey:@"RLoverloadedUntil"];
  [v4 encodeObject:self->_lastJudgment forKey:@"RLlastJudgment"];
  [v4 encodeObject:self->_assetType forKey:@"RLassetType"];
  if (!self->_assetType) {
    [v4 encodeObject:self->_config forKey:@"RLconfig"];
  }
}

- (NSDictionary)config
{
  return self->_config;
}

- (void)setConfig:(id)a3
{
}

- (NSString)assetType
{
  return self->_assetType;
}

- (void)setAssetType:(id)a3
{
}

- (NSArray)groups
{
  return self->_groups;
}

- (void)setGroups:(id)a3
{
}

- (NSDate)lastJudgment
{
  return self->_lastJudgment;
}

- (void)setLastJudgment:(id)a3
{
}

- (NSDate)overloadUntil
{
  return self->_overloadUntil;
}

- (void)setOverloadUntil:(id)a3
{
}

- (void).cxx_destruct
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
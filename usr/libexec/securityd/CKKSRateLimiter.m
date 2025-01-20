@interface CKKSRateLimiter
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (CKKSRateLimiter)init;
- (CKKSRateLimiter)initWithCoder:(id)a3;
- (NSDate)overloadUntil;
- (NSDictionary)config;
- (NSMutableDictionary)buckets;
- (id)consumeTokenFromBucket:(id)a3 type:(int)a4 at:(id)a5;
- (id)diagnostics;
- (id)topOffendingAccessGroups:(unint64_t)a3;
- (int)capacity:(int)a3;
- (int)judge:(id)a3 at:(id)a4 limitTime:(id *)a5;
- (int)rate:(int)a3;
- (unint64_t)stateSize;
- (void)encodeWithCoder:(id)a3;
- (void)reset;
- (void)setBuckets:(id)a3;
- (void)setConfig:(id)a3;
- (void)setOverloadUntil:(id)a3;
- (void)trim:(id)a3;
@end

@implementation CKKSRateLimiter

- (CKKSRateLimiter)init
{
  return -[CKKSRateLimiter initWithCoder:](self, "initWithCoder:", 0LL);
}

- (CKKSRateLimiter)initWithCoder:(id)a3
{
  id v4 = a3;
  v41.receiver = self;
  v41.super_class = (Class)&OBJC_CLASS___CKKSRateLimiter;
  v6 = -[CKKSRateLimiter init](&v41, "init");
  if (v6)
  {
    v7 = &AAAccountClassPrimary_ptr;
    if (v4)
    {
      uint64_t v8 = objc_opt_class(&OBJC_CLASS___NSDictionary, v5);
      uint64_t v10 = objc_opt_class(&OBJC_CLASS___NSString, v9);
      v12 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v8,  v10,  objc_opt_class(&OBJC_CLASS___NSDate, v11),  0LL);
      v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue([v4 decodeObjectOfClasses:v13 forKey:@"buckets"]);

      uint64_t v16 = objc_opt_class(&OBJC_CLASS___NSDictionary, v15);
      if ((objc_opt_isKindOfClass(v14, v16) & 1) == 0)
      {
LABEL_18:

        v35 = 0LL;
        goto LABEL_19;
      }

      __int128 v39 = 0u;
      __int128 v40 = 0u;
      __int128 v37 = 0u;
      __int128 v38 = 0u;
      v17 = v14;
      id v18 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v17,  "countByEnumeratingWithState:objects:count:",  &v37,  v42,  16LL);
      if (v18)
      {
        id v20 = v18;
        uint64_t v21 = *(void *)v38;
        while (2)
        {
          v22 = 0LL;
          do
          {
            if (*(void *)v38 != v21) {
              objc_enumerationMutation(v17);
            }
            uint64_t v23 = *(void *)(*((void *)&v37 + 1) + 8LL * (void)v22);
            uint64_t v24 = objc_opt_class(&OBJC_CLASS___NSString, v19);
            if ((objc_opt_isKindOfClass(v23, v24) & 1) == 0
              || (v25 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v17, "objectForKeyedSubscript:", v23)),
                  uint64_t v27 = objc_opt_class(&OBJC_CLASS___NSDate, v26),
                  char isKindOfClass = objc_opt_isKindOfClass(v25, v27),
                  v25,
                  (isKindOfClass & 1) == 0))
            {

              goto LABEL_18;
            }

            v22 = (char *)v22 + 1;
          }

          while (v20 != v22);
          id v20 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v17,  "countByEnumeratingWithState:objects:count:",  &v37,  v42,  16LL);
          v7 = &AAAccountClassPrimary_ptr;
          if (v20) {
            continue;
          }
          break;
        }
      }

      v29 = (NSMutableDictionary *)-[NSMutableDictionary mutableCopy](v17, "mutableCopy");
      buckets = v6->_buckets;
      v6->_buckets = v29;
    }

    else
    {
      v31 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
      v17 = v6->_buckets;
      v6->_buckets = v31;
    }

    overloadUntil = v6->_overloadUntil;
    v6->_overloadUntil = 0LL;

    uint64_t v33 = objc_claimAutoreleasedReturnValue( objc_msgSend( v7[263],  "dictionaryWithObjectsAndKeys:",  &off_1002AD1B8,  @"rateAll",  &off_1002AD1D0,  @"rateGroup",  &off_1002AD1E8,  @"rateUUID",  &off_1002AD200,  @"capacityAll",  &off_1002AD218,  @"capacityGroup",  &off_1002AD230,  @"capacityUUID",  &off_1002AD248,  @"trimSize",  &off_1002AD260,  @"trimTime",  &off_1002AD278,  @"overloadDuration",  0));
    config = v6->_config;
    v6->_config = (NSDictionary *)v33;
  }

  v35 = v6;
LABEL_19:

  return v35;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v6 = objc_opt_class(&OBJC_CLASS___CKKSRateLimiter, v5);
  if ((objc_opt_isKindOfClass(v4, v6) & 1) != 0)
  {
    id v7 = v4;
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSRateLimiter config](self, "config"));
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v7 config]);
    if (![v8 isEqual:v9])
    {
      unsigned __int8 v15 = 0;
LABEL_15:

      goto LABEL_16;
    }

    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSRateLimiter buckets](self, "buckets"));
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v7 buckets]);
    if (![v10 isEqual:v11])
    {
      unsigned __int8 v15 = 0;
LABEL_14:

      goto LABEL_15;
    }

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSRateLimiter overloadUntil](self, "overloadUntil"));
    if (v12 || (v17 = (void *)objc_claimAutoreleasedReturnValue([v7 overloadUntil])) != 0)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSRateLimiter overloadUntil](self, "overloadUntil"));
      v14 = (void *)objc_claimAutoreleasedReturnValue([v7 overloadUntil]);
      unsigned __int8 v15 = [v13 isEqual:v14];

      if (v12)
      {
LABEL_13:

        goto LABEL_14;
      }
    }

    else
    {
      v17 = 0LL;
      unsigned __int8 v15 = 1;
    }

    goto LABEL_13;
  }

  unsigned __int8 v15 = 0;
LABEL_16:

  return v15;
}

- (int)rate:(int)a3
{
  switch(a3)
  {
    case 2:
      v3 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSRateLimiter config](self, "config"));
      id v4 = v3;
      uint64_t v5 = @"rateUUID";
      goto LABEL_7;
    case 1:
      v3 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSRateLimiter config](self, "config"));
      id v4 = v3;
      uint64_t v5 = @"rateGroup";
      goto LABEL_7;
    case 0:
      v3 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSRateLimiter config](self, "config"));
      id v4 = v3;
      uint64_t v5 = @"rateAll";
LABEL_7:
      uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:v5]);
      unsigned int v7 = [v6 intValue];

      LODWORD(self) = v7;
      break;
  }

  return (int)self;
}

- (int)capacity:(int)a3
{
  switch(a3)
  {
    case 2:
      v3 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSRateLimiter config](self, "config"));
      id v4 = v3;
      uint64_t v5 = @"capacityUUID";
      goto LABEL_7;
    case 1:
      v3 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSRateLimiter config](self, "config"));
      id v4 = v3;
      uint64_t v5 = @"capacityGroup";
      goto LABEL_7;
    case 0:
      v3 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSRateLimiter config](self, "config"));
      id v4 = v3;
      uint64_t v5 = @"capacityAll";
LABEL_7:
      uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:v5]);
      unsigned int v7 = [v6 intValue];

      LODWORD(self) = v7;
      break;
  }

  return (int)self;
}

- (id)consumeTokenFromBucket:(id)a3 type:(int)a4 at:(id)a5
{
  uint64_t v6 = *(void *)&a4;
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v9,  "dateByAddingTimeInterval:",  (double)-(-[CKKSRateLimiter capacity:](self, "capacity:", v6)
                            * -[CKKSRateLimiter rate:](self, "rate:", v6))));
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSRateLimiter buckets](self, "buckets"));
  v12 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:v8]);

  if (!v12 || ([v12 timeIntervalSinceDate:v10], v13 < 0.0))
  {
    id v14 = v10;

    v12 = v14;
  }

  unsigned __int8 v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "dateByAddingTimeInterval:", (double)-[CKKSRateLimiter rate:](self, "rate:", v6)));

  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSRateLimiter buckets](self, "buckets"));
  [v16 setObject:v15 forKeyedSubscript:v8];

  [v15 timeIntervalSinceDate:v9];
  if (v17 <= 0.0) {
    id v18 = 0LL;
  }
  else {
    id v18 = [v15 copy];
  }

  return v18;
}

- (int)judge:(id)a3 at:(id)a4 limitTime:(id *)a5
{
  id v9 = a3;
  id v10 = a4;
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSRateLimiter overloadUntil](self, "overloadUntil"));

  if (v11)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSRateLimiter overloadUntil](self, "overloadUntil"));
    [v10 timeIntervalSinceDate:v12];
    double v14 = v13;

    if (v14 >= 0.0) {
      -[CKKSRateLimiter trim:](self, "trim:", v10);
    }
    unsigned __int8 v15 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSRateLimiter overloadUntil](self, "overloadUntil"));

    if (v15)
    {
      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSRateLimiter overloadUntil](self, "overloadUntil"));
      *a5 = [v16 copy];
LABEL_17:
      int v27 = 5;
      goto LABEL_31;
    }
  }

  double v17 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSRateLimiter buckets](self, "buckets"));
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v17 objectForKeyedSubscript:@"All"]);

  v42 = a5;
  if (!v16)
  {
    id v41 = v9;
    goto LABEL_11;
  }

  [v10 timeIntervalSinceDate:v16];
  double v19 = v18;
  double v17 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSRateLimiter config](self, "config"));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v17 objectForKeyedSubscript:@"trimTime"]);
  if (v19 <= (double)(int)[v5 intValue])
  {
    id v41 = v9;
LABEL_11:
    id v20 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSRateLimiter buckets](self, "buckets"));
    id v21 = [v20 count];
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSRateLimiter config](self, "config"));
    uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([v22 objectForKeyedSubscript:@"trimSize"]);
    unint64_t v24 = [v23 unsignedIntValue];

    if (v16)
    {
    }

    BOOL v25 = (unint64_t)v21 >= v24;
    id v9 = v41;
    if (!v25) {
      goto LABEL_18;
    }
    goto LABEL_15;
  }

LABEL_15:
  -[CKKSRateLimiter trim:](self, "trim:", v10);
  uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSRateLimiter overloadUntil](self, "overloadUntil"));

  if (v26)
  {
    id *v42 = (id)objc_claimAutoreleasedReturnValue(-[CKKSRateLimiter overloadUntil](self, "overloadUntil"));
    goto LABEL_17;
  }

- (unint64_t)stateSize
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSRateLimiter buckets](self, "buckets"));
  id v3 = [v2 count];

  return (unint64_t)v3;
}

- (void)reset
{
  id v3 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  -[CKKSRateLimiter setBuckets:](self, "setBuckets:", v3);

  -[CKKSRateLimiter setOverloadUntil:](self, "setOverloadUntil:", 0LL);
}

- (void)trim:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSRateLimiter config](self, "config"));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"trimTime"]);
  unsigned int v7 = [v6 intValue];

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSRateLimiter buckets](self, "buckets"));
  id v21 = _NSConcreteStackBlock;
  uint64_t v22 = 3221225472LL;
  uint64_t v23 = sub_100033C44;
  unint64_t v24 = &unk_1002844A0;
  id v25 = v4;
  unsigned int v26 = v7;
  id v9 = v4;
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v8 keysOfEntriesPassingTest:&v21]);

  if (objc_msgSend(v10, "count", v21, v22, v23, v24))
  {
    -[CKKSRateLimiter setOverloadUntil:](self, "setOverloadUntil:", 0LL);
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSRateLimiter buckets](self, "buckets"));
    v12 = (void *)objc_claimAutoreleasedReturnValue([v10 allObjects]);
    [v11 removeObjectsForKeys:v12];
  }

  else
  {
    double v13 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSRateLimiter buckets](self, "buckets"));
    double v14 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKeyedSubscript:@"All"]);
    unsigned __int8 v15 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSRateLimiter config](self, "config"));
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v15 objectForKeyedSubscript:@"overloadDuration"]);
    double v17 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v14,  "dateByAddingTimeInterval:",  (double)objc_msgSend(v16, "unsignedIntValue")));
    -[CKKSRateLimiter setOverloadUntil:](self, "setOverloadUntil:", v17);

    double v18 = sub_10001267C("SecCritical");
    double v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      id v20 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSRateLimiter overloadUntil](self, "overloadUntil"));
      *(_DWORD *)buf = 138412290;
      id v28 = v20;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "RateLimiter overloaded until %@", buf, 0xCu);
    }
  }
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[CKKSRateLimiter buckets](self, "buckets"));
  [v4 encodeObject:v5 forKey:@"buckets"];
}

- (id)diagnostics
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSRateLimiter config](self, "config"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 description]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableString stringWithFormat:]( &OBJC_CLASS___NSMutableString,  "stringWithFormat:",  @"RateLimiter config: %@\n",  v4));

  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSRateLimiter overloadUntil](self, "overloadUntil"));
  if (v6)
  {
    unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSRateLimiter overloadUntil](self, "overloadUntil"));
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSRateLimiter buckets](self, "buckets"));
    [v5 appendFormat:@"Overloaded until %@, %lu total buckets\n", v7, objc_msgSend(v8, "count")];
  }

  else
  {
    unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSRateLimiter buckets](self, "buckets"));
    objc_msgSend(v5, "appendFormat:", @"Not overloaded, %lu total buckets\n", objc_msgSend(v7, "count"));
  }

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSRateLimiter topOffendingAccessGroups:](self, "topOffendingAccessGroups:", 10LL));
  id v10 = v9;
  if (v9)
  {
    id v11 = [v9 count];
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSRateLimiter buckets](self, "buckets"));
    double v13 = (void *)objc_claimAutoreleasedReturnValue([v10 objectAtIndexedSubscript:0]);
    double v14 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:v13]);
    unsigned __int8 v15 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSRateLimiter buckets](self, "buckets"));
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectAtIndexedSubscript:", (char *)objc_msgSend(v10, "count") - 1));
    double v17 = (void *)objc_claimAutoreleasedReturnValue([v15 objectForKeyedSubscript:v16]);
    [v5 appendFormat:@"%lu congested buckets. Top offenders: \n%@ range %@ to %@\n", v11, v10, v14, v17];
  }

  else
  {
    [v5 appendString:@"No buckets congested"];
  }

  return v5;
}

- (id)topOffendingAccessGroups:(unint64_t)a3
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSRateLimiter buckets](self, "buckets"));
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472LL;
  v21[2] = sub_100033BDC;
  v21[3] = &unk_100283C40;
  id v7 = v5;
  id v22 = v7;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 keysOfEntriesPassingTest:v21]);

  if ([v8 count])
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSRateLimiter buckets](self, "buckets"));
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v8 allObjects]);
    id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    v12 = (void *)objc_claimAutoreleasedReturnValue([v9 objectsForKeys:v10 notFoundMarker:v11]);
    double v13 = (void *)objc_claimAutoreleasedReturnValue([v8 allObjects]);
    double v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:",  v12,  v13));

    unsigned __int8 v15 = (void *)objc_claimAutoreleasedReturnValue([v14 keysSortedByValueUsingSelector:"compare:"]);
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v15 reverseObjectEnumerator]);
    double v17 = (void *)objc_claimAutoreleasedReturnValue([v16 allObjects]);

    else {
      id v18 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "subarrayWithRange:", 0, a3));
    }
    double v19 = v18;
  }

  else
  {
    double v19 = 0LL;
  }

  return v19;
}

- (NSDictionary)config
{
  return (NSDictionary *)objc_getProperty(self, a2, 8LL, 1);
}

- (void)setConfig:(id)a3
{
}

- (NSMutableDictionary)buckets
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setBuckets:(id)a3
{
}

- (NSDate)overloadUntil
{
  return (NSDate *)objc_getProperty(self, a2, 24LL, 1);
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
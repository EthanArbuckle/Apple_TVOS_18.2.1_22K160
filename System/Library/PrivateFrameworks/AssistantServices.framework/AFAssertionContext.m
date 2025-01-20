@interface AFAssertionContext
+ (BOOL)supportsSecureCoding;
+ (id)newWithBuilder:(id)a3;
- (AFAssertionContext)init;
- (AFAssertionContext)initWithBuilder:(id)a3;
- (AFAssertionContext)initWithCoder:(id)a3;
- (AFAssertionContext)initWithDictionaryRepresentation:(id)a3;
- (AFAssertionContext)initWithTimestamp:(unint64_t)a3 reason:(id)a4 effectiveDate:(id)a5 expirationDuration:(double)a6 userInfo:(id)a7;
- (BOOL)isEqual:(id)a3;
- (NSDate)effectiveDate;
- (NSDictionary)userInfo;
- (NSString)description;
- (NSString)reason;
- (double)expirationDuration;
- (id)_descriptionWithIndent:(unint64_t)a3;
- (id)buildDictionaryRepresentation;
- (id)mutatedCopyWithMutator:(id)a3;
- (unint64_t)hash;
- (unint64_t)timestamp;
- (void)encodeWithCoder:(id)a3;
@end

@implementation AFAssertionContext

- (AFAssertionContext)initWithBuilder:(id)a3
{
  v4 = (void (**)(id, _AFAssertionContextMutation *))a3;
  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___AFAssertionContext;
  v5 = -[AFAssertionContext init](&v19, "init");
  v6 = v5;
  if (v4 && v5)
  {
    v7 = -[_AFAssertionContextMutation initWithBase:]( objc_alloc(&OBJC_CLASS____AFAssertionContextMutation),  "initWithBase:",  0LL);
    v4[2](v4, v7);
    if (-[_AFAssertionContextMutation isDirty](v7, "isDirty"))
    {
      v6->_timestamp = -[_AFAssertionContextMutation getTimestamp](v7, "getTimestamp");
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[_AFAssertionContextMutation getReason](v7, "getReason"));
      v9 = (NSString *)[v8 copy];
      reason = v6->_reason;
      v6->_reason = v9;

      v11 = (void *)objc_claimAutoreleasedReturnValue(-[_AFAssertionContextMutation getEffectiveDate](v7, "getEffectiveDate"));
      v12 = (NSDate *)[v11 copy];
      effectiveDate = v6->_effectiveDate;
      v6->_effectiveDate = v12;

      -[_AFAssertionContextMutation getExpirationDuration](v7, "getExpirationDuration");
      v6->_expirationDuration = v14;
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[_AFAssertionContextMutation getUserInfo](v7, "getUserInfo"));
      v16 = (NSDictionary *)[v15 copy];
      userInfo = v6->_userInfo;
      v6->_userInfo = v16;
    }
  }

  return v6;
}

- (AFAssertionContext)init
{
  return -[AFAssertionContext initWithBuilder:](self, "initWithBuilder:", 0LL);
}

- (AFAssertionContext)initWithTimestamp:(unint64_t)a3 reason:(id)a4 effectiveDate:(id)a5 expirationDuration:(double)a6 userInfo:(id)a7
{
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_100201958;
  v17[3] = &unk_1004F6508;
  id v18 = a4;
  id v19 = a5;
  double v22 = a6;
  id v20 = a7;
  unint64_t v21 = a3;
  id v12 = v20;
  id v13 = v19;
  id v14 = v18;
  v15 = -[AFAssertionContext initWithBuilder:](self, "initWithBuilder:", v17);

  return v15;
}

- (NSString)description
{
  return (NSString *)-[AFAssertionContext _descriptionWithIndent:](self, "_descriptionWithIndent:", 0LL);
}

- (id)_descriptionWithIndent:(unint64_t)a3
{
  v4 = objc_alloc(&OBJC_CLASS___NSString);
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___AFAssertionContext;
  v5 = -[AFAssertionContext description](&v9, "description");
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = -[NSString initWithFormat:]( v4,  "initWithFormat:",  @"%@ {timestamp = %llu, reason = %@, effectiveDate = %@, expirationDuration = %f, userInfo = %@}",  v6,  self->_timestamp,  self->_reason,  self->_effectiveDate,  *(void *)&self->_expirationDuration,  self->_userInfo);

  return v7;
}

- (unint64_t)hash
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  self->_timestamp));
  unint64_t v4 = (unint64_t)[v3 hash];
  NSUInteger v5 = -[NSString hash](self->_reason, "hash");
  unint64_t v6 = v5 ^ (unint64_t)-[NSDate hash](self->_effectiveDate, "hash") ^ v4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", self->_expirationDuration));
  unint64_t v8 = (unint64_t)[v7 hash];
  unint64_t v9 = v6 ^ v8 ^ (unint64_t)-[NSDictionary hash](self->_userInfo, "hash");

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = (AFAssertionContext *)a3;
  if (self == v4)
  {
    BOOL v10 = 1;
  }

  else
  {
    uint64_t v5 = objc_opt_class(&OBJC_CLASS___AFAssertionContext);
    if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
    {
      unint64_t v6 = v4;
      id timestamp = (id)self->_timestamp;
      if (timestamp == (id)-[AFAssertionContext timestamp](v6, "timestamp")
        && (double expirationDuration = self->_expirationDuration,
            -[AFAssertionContext expirationDuration](v6, "expirationDuration"),
            expirationDuration == v9))
      {
        id v12 = (NSString *)objc_claimAutoreleasedReturnValue(-[AFAssertionContext reason](v6, "reason"));
        reason = self->_reason;
        if (reason == v12 || -[NSString isEqual:](reason, "isEqual:", v12))
        {
          id v14 = (NSDate *)objc_claimAutoreleasedReturnValue(-[AFAssertionContext effectiveDate](v6, "effectiveDate"));
          effectiveDate = self->_effectiveDate;
          if (effectiveDate == v14 || -[NSDate isEqual:](effectiveDate, "isEqual:", v14))
          {
            v16 = (NSDictionary *)objc_claimAutoreleasedReturnValue(-[AFAssertionContext userInfo](v6, "userInfo"));
            userInfo = self->_userInfo;
            BOOL v10 = userInfo == v16 || -[NSDictionary isEqual:](userInfo, "isEqual:", v16);
          }

          else
          {
            BOOL v10 = 0;
          }
        }

        else
        {
          BOOL v10 = 0;
        }
      }

      else
      {
        BOOL v10 = 0;
      }
    }

    else
    {
      BOOL v10 = 0;
    }
  }

  return v10;
}

- (AFAssertionContext)initWithCoder:(id)a3
{
  id v3 = a3;
  id v4 = [v3 decodeObjectOfClass:objc_opt_class(NSNumber) forKey:@"AFAssertionContext::timestamp"];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  id v30 = [v5 unsignedLongLongValue];

  id v6 = [v3 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"AFAssertionContext::reason"];
  v29 = (void *)objc_claimAutoreleasedReturnValue(v6);
  id v7 = [v3 decodeObjectOfClass:objc_opt_class(NSDate) forKey:@"AFAssertionContext::effectiveDate"];
  v28 = (void *)objc_claimAutoreleasedReturnValue(v7);
  id v8 = [v3 decodeObjectOfClass:objc_opt_class(NSNumber) forKey:@"AFAssertionContext::expirationDuration"];
  double v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  [v9 doubleValue];
  double v11 = v10;

  uint64_t v27 = objc_opt_class(&OBJC_CLASS___NSDictionary);
  uint64_t v26 = objc_opt_class(&OBJC_CLASS___NSArray);
  uint64_t v12 = objc_opt_class(&OBJC_CLASS___NSData);
  uint64_t v13 = objc_opt_class(&OBJC_CLASS___NSDate);
  uint64_t v14 = objc_opt_class(&OBJC_CLASS___NSDictionary);
  uint64_t v15 = objc_opt_class(&OBJC_CLASS___NSNumber);
  uint64_t v16 = objc_opt_class(&OBJC_CLASS___NSOrderedSet);
  uint64_t v17 = objc_opt_class(&OBJC_CLASS___NSSet);
  uint64_t v18 = objc_opt_class(&OBJC_CLASS___NSString);
  uint64_t v19 = objc_opt_class(&OBJC_CLASS___NSURL);
  uint64_t v20 = objc_opt_class(&OBJC_CLASS___NSUUID);
  unint64_t v21 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v27,  v26,  v12,  v13,  v14,  v15,  v16,  v17,  v18,  v19,  v20,  objc_opt_class(&OBJC_CLASS___AFSpeechRequestOptions),  0LL);
  double v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
  v23 = (void *)objc_claimAutoreleasedReturnValue([v3 decodeObjectOfClasses:v22 forKey:@"AFAssertionContext::userInfo"]);

  v24 = -[AFAssertionContext initWithTimestamp:reason:effectiveDate:expirationDuration:userInfo:]( self,  "initWithTimestamp:reason:effectiveDate:expirationDuration:userInfo:",  v30,  v29,  v28,  v23,  v11);
  return v24;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t timestamp = self->_timestamp;
  id v7 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  timestamp));
  [v7 encodeObject:v5 forKey:@"AFAssertionContext::timestamp"];

  [v7 encodeObject:self->_reason forKey:@"AFAssertionContext::reason"];
  [v7 encodeObject:self->_effectiveDate forKey:@"AFAssertionContext::effectiveDate"];
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", self->_expirationDuration));
  [v7 encodeObject:v6 forKey:@"AFAssertionContext::expirationDuration"];

  [v7 encodeObject:self->_userInfo forKey:@"AFAssertionContext::userInfo"];
}

- (AFAssertionContext)initWithDictionaryRepresentation:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"timestamp"]);
    uint64_t v7 = objc_opt_class(&OBJC_CLASS___NSNumber);
    if ((objc_opt_isKindOfClass(v6, v7) & 1) != 0) {
      id v8 = v6;
    }
    else {
      id v8 = 0LL;
    }

    id v10 = [v8 unsignedLongLongValue];
    double v11 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:@"reason"]);
    uint64_t v12 = objc_opt_class(&OBJC_CLASS___NSString);
    if ((objc_opt_isKindOfClass(v11, v12) & 1) != 0) {
      id v13 = v11;
    }
    else {
      id v13 = 0LL;
    }

    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:@"effectiveDate"]);
    uint64_t v15 = objc_opt_class(&OBJC_CLASS___NSDate);
    if ((objc_opt_isKindOfClass(v14, v15) & 1) != 0) {
      id v16 = v14;
    }
    else {
      id v16 = 0LL;
    }

    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:@"expirationDuration"]);
    uint64_t v18 = objc_opt_class(&OBJC_CLASS___NSNumber);
    if ((objc_opt_isKindOfClass(v17, v18) & 1) != 0) {
      id v19 = v17;
    }
    else {
      id v19 = 0LL;
    }

    [v19 doubleValue];
    double v21 = v20;

    double v22 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:@"userInfo"]);
    uint64_t v23 = objc_opt_class(&OBJC_CLASS___NSDictionary);
    if ((objc_opt_isKindOfClass(v22, v23) & 1) != 0) {
      id v24 = v22;
    }
    else {
      id v24 = 0LL;
    }

    self =  -[AFAssertionContext initWithTimestamp:reason:effectiveDate:expirationDuration:userInfo:]( self,  "initWithTimestamp:reason:effectiveDate:expirationDuration:userInfo:",  v10,  v13,  v16,  v24,  v21);
    double v9 = self;
  }

  else
  {
    double v9 = 0LL;
  }

  return v9;
}

- (id)buildDictionaryRepresentation
{
  id v3 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  self->_timestamp));
  -[NSMutableDictionary setObject:forKey:](v3, "setObject:forKey:", v4, @"timestamp");

  reason = self->_reason;
  if (reason) {
    -[NSMutableDictionary setObject:forKey:](v3, "setObject:forKey:", reason, @"reason");
  }
  effectiveDate = self->_effectiveDate;
  if (effectiveDate) {
    -[NSMutableDictionary setObject:forKey:](v3, "setObject:forKey:", effectiveDate, @"effectiveDate");
  }
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", self->_expirationDuration));
  -[NSMutableDictionary setObject:forKey:](v3, "setObject:forKey:", v7, @"expirationDuration");

  userInfo = self->_userInfo;
  if (userInfo) {
    -[NSMutableDictionary setObject:forKey:](v3, "setObject:forKey:", userInfo, @"userInfo");
  }
  id v9 = -[NSMutableDictionary copy](v3, "copy");

  return v9;
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (NSString)reason
{
  return self->_reason;
}

- (NSDate)effectiveDate
{
  return self->_effectiveDate;
}

- (double)expirationDuration
{
  return self->_expirationDuration;
}

- (NSDictionary)userInfo
{
  return self->_userInfo;
}

- (void).cxx_destruct
{
}

+ (id)newWithBuilder:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)objc_opt_class(a1)) initWithBuilder:v4];

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)mutatedCopyWithMutator:(id)a3
{
  id v4 = (void (**)(id, _AFAssertionContextMutation *))a3;
  if (v4)
  {
    id v5 = -[_AFAssertionContextMutation initWithBase:]( objc_alloc(&OBJC_CLASS____AFAssertionContextMutation),  "initWithBase:",  self);
    v4[2](v4, v5);
    if (-[_AFAssertionContextMutation isDirty](v5, "isDirty"))
    {
      id v6 = objc_alloc_init(&OBJC_CLASS___AFAssertionContext);
      v6->_unint64_t timestamp = -[_AFAssertionContextMutation getTimestamp](v5, "getTimestamp");
      uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[_AFAssertionContextMutation getReason](v5, "getReason"));
      id v8 = (NSString *)[v7 copy];
      reason = v6->_reason;
      v6->_reason = v8;

      id v10 = (void *)objc_claimAutoreleasedReturnValue(-[_AFAssertionContextMutation getEffectiveDate](v5, "getEffectiveDate"));
      double v11 = (NSDate *)[v10 copy];
      effectiveDate = v6->_effectiveDate;
      v6->_effectiveDate = v11;

      -[_AFAssertionContextMutation getExpirationDuration](v5, "getExpirationDuration");
      v6->_double expirationDuration = v13;
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[_AFAssertionContextMutation getUserInfo](v5, "getUserInfo"));
      uint64_t v15 = (NSDictionary *)[v14 copy];
      userInfo = v6->_userInfo;
      v6->_userInfo = v15;
    }

    else
    {
      id v6 = (AFAssertionContext *)-[AFAssertionContext copy](self, "copy");
    }
  }

  else
  {
    id v6 = (AFAssertionContext *)-[AFAssertionContext copy](self, "copy");
  }

  return v6;
}

@end
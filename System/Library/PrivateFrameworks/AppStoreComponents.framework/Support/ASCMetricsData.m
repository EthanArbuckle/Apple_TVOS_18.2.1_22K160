@interface ASCMetricsData
+ (BOOL)supportsSecureCoding;
- (ASCMetricsData)initWithCoder:(id)a3;
- (ASCMetricsData)initWithTopic:(id)a3 shouldFlush:(BOOL)a4 fields:(id)a5 includingFields:(id)a6 excludingFields:(id)a7;
- (BOOL)isEqual:(id)a3;
- (BOOL)shouldFlush;
- (NSDictionary)fields;
- (NSSet)excludingFields;
- (NSSet)includingFields;
- (NSString)topic;
- (id)description;
- (id)metricsDataByMergingFields:(id)a3 uniquingFieldsWithBlock:(id)a4;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ASCMetricsData

- (ASCMetricsData)initWithTopic:(id)a3 shouldFlush:(BOOL)a4 fields:(id)a5 includingFields:(id)a6 excludingFields:(id)a7
{
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  sub_10000F4DC((uint64_t)&OBJC_CLASS___ASCEligibility);
  v26.receiver = self;
  v26.super_class = (Class)&OBJC_CLASS___ASCMetricsData;
  v16 = -[ASCMetricsData init](&v26, "init");
  if (v16)
  {
    v17 = (NSString *)[v12 copy];
    topic = v16->_topic;
    v16->_topic = v17;

    v16->_shouldFlush = a4;
    v19 = (NSDictionary *)[v13 copy];
    fields = v16->_fields;
    v16->_fields = v19;

    v21 = (NSSet *)[v14 copy];
    includingFields = v16->_includingFields;
    v16->_includingFields = v21;

    v23 = (NSSet *)[v15 copy];
    excludingFields = v16->_excludingFields;
    v16->_excludingFields = v23;
  }

  return v16;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ASCMetricsData)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"topic"];
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  id v7 = [v4 decodeBoolForKey:@"shouldFlush"];
  id v8 = sub_100019AC4(v4, @"fields");
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  if (v9)
  {
    v10 = objc_alloc(&OBJC_CLASS___NSSet);
    uint64_t v11 = objc_opt_class(&OBJC_CLASS___NSSet);
    id v12 = -[NSSet initWithObjects:](v10, "initWithObjects:", v11, objc_opt_class(&OBJC_CLASS___NSString), 0LL);
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v4 decodeObjectOfClasses:v12 forKey:@"includingFields"]);
    if (v13)
    {
      id v14 = (void *)objc_claimAutoreleasedReturnValue([v4 decodeObjectOfClasses:v12 forKey:@"excludingFields"]);
      if (v14)
      {
        self =  -[ASCMetricsData initWithTopic:shouldFlush:fields:includingFields:excludingFields:]( self,  "initWithTopic:shouldFlush:fields:includingFields:excludingFields:",  v6,  v7,  v9,  v13,  v14);
        id v15 = self;
      }

      else
      {
        BOOL v32 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
        if (v32) {
          sub_1000E1334(v32, v33, v34, v35, v36, v37, v38, v39);
        }
        id v15 = 0LL;
      }
    }

    else
    {
      BOOL v24 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
      if (v24) {
        sub_1000E1300(v24, v25, v26, v27, v28, v29, v30, v31);
      }
      id v15 = 0LL;
    }
  }

  else
  {
    BOOL v16 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v16) {
      sub_1000E12CC(v16, v17, v18, v19, v20, v21, v22, v23);
    }
    id v15 = 0LL;
  }

  return v15;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[ASCMetricsData topic](self, "topic"));
  [v4 encodeObject:v5 forKey:@"topic"];

  objc_msgSend(v4, "encodeBool:forKey:", -[ASCMetricsData shouldFlush](self, "shouldFlush"), @"shouldFlush");
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ASCMetricsData fields](self, "fields"));
  [v4 encodeObject:v6 forKey:@"fields"];

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[ASCMetricsData includingFields](self, "includingFields"));
  [v4 encodeObject:v7 forKey:@"includingFields"];

  id v8 = (id)objc_claimAutoreleasedReturnValue(-[ASCMetricsData excludingFields](self, "excludingFields"));
  [v4 encodeObject:v8 forKey:@"excludingFields"];
}

- (unint64_t)hash
{
  v3 = objc_alloc_init(&OBJC_CLASS___ASCHasher);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[ASCMetricsData topic](self, "topic"));
  -[ASCHasher combineObject:](v3, "combineObject:", v4);

  -[ASCHasher combineBool:](v3, "combineBool:", -[ASCMetricsData shouldFlush](self, "shouldFlush"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[ASCMetricsData fields](self, "fields"));
  -[ASCHasher combineObject:](v3, "combineObject:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ASCMetricsData includingFields](self, "includingFields"));
  -[ASCHasher combineObject:](v3, "combineObject:", v6);

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[ASCMetricsData excludingFields](self, "excludingFields"));
  -[ASCHasher combineObject:](v3, "combineObject:", v7);

  unint64_t v8 = -[ASCHasher finalizeHash](v3, "finalizeHash");
  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___ASCMetricsData);
  id v6 = v4;
  id v7 = v6;
  if (v6)
  {
    if ((objc_opt_isKindOfClass(v6, v5) & 1) != 0) {
      unint64_t v8 = v7;
    }
    else {
      unint64_t v8 = 0LL;
    }
  }

  else
  {
    unint64_t v8 = 0LL;
  }

  id v9 = v8;

  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[ASCMetricsData topic](self, "topic"));
    uint64_t v11 = objc_claimAutoreleasedReturnValue([v9 topic]);
    id v12 = (void *)v11;
    if (v10 && v11)
    {
    }

    else if (v10 != (void *)v11)
    {
LABEL_14:
      unsigned __int8 v13 = 0;
LABEL_32:

      goto LABEL_33;
    }

    unsigned int v14 = -[ASCMetricsData shouldFlush](self, "shouldFlush");
    id v15 = (void *)objc_claimAutoreleasedReturnValue(-[ASCMetricsData fields](self, "fields"));
    uint64_t v16 = objc_claimAutoreleasedReturnValue([v9 fields]);
    uint64_t v17 = (void *)v16;
    if (v15 && v16)
    {
      if ([v15 isEqual:v16])
      {
LABEL_18:
        uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(-[ASCMetricsData includingFields](self, "includingFields"));
        uint64_t v19 = objc_claimAutoreleasedReturnValue([v9 includingFields]);
        uint64_t v20 = (void *)v19;
        if (v18 && v19)
        {
        }

        else if (v18 == (void *)v19)
        {
LABEL_21:
          uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(-[ASCMetricsData excludingFields](self, "excludingFields"));
          uint64_t v22 = objc_claimAutoreleasedReturnValue([v9 excludingFields]);
          uint64_t v23 = (void *)v22;
          uint64_t v25 = v21;
          if (v21 && v22) {
            unsigned __int8 v13 = [v21 isEqual:v22];
          }
          else {
            unsigned __int8 v13 = v21 == (void *)v22;
          }

          goto LABEL_30;
        }

        unsigned __int8 v13 = 0;
LABEL_30:

        goto LABEL_31;
      }
    }

    else if (v15 == (void *)v16)
    {
      goto LABEL_18;
    }

    unsigned __int8 v13 = 0;
LABEL_31:

    goto LABEL_32;
  }

  unsigned __int8 v13 = 0;
LABEL_33:

  return v13;
}

- (id)description
{
  v3 = -[ASCDescriber initWithObject:](objc_alloc(&OBJC_CLASS___ASCDescriber), "initWithObject:", self);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[ASCMetricsData topic](self, "topic"));
  -[ASCDescriber addObject:withName:](v3, "addObject:withName:", v4, @"topic");

  -[ASCDescriber addBool:withName:]( v3,  "addBool:withName:",  -[ASCMetricsData shouldFlush](self, "shouldFlush"),  @"shouldFlush");
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[ASCMetricsData fields](self, "fields"));
  -[ASCDescriber addSensitiveObject:withName:](v3, "addSensitiveObject:withName:", v5, @"fields");

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[ASCMetricsData includingFields](self, "includingFields"));
  -[ASCDescriber addSensitiveObject:withName:](v3, "addSensitiveObject:withName:", v6, @"includingFields");

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[ASCMetricsData excludingFields](self, "excludingFields"));
  -[ASCDescriber addSensitiveObject:withName:](v3, "addSensitiveObject:withName:", v7, @"excludingFields");

  unint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[ASCDescriber finalizeDescription](v3, "finalizeDescription"));
  return v8;
}

- (id)metricsDataByMergingFields:(id)a3 uniquingFieldsWithBlock:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  unint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[ASCMetricsData fields](self, "fields"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "asc_dictionaryByMergingDictionary:uniquingKeysWithBlock:", v7, v6));

  v10 = objc_alloc(&OBJC_CLASS___ASCMetricsData);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[ASCMetricsData topic](self, "topic"));
  BOOL v12 = -[ASCMetricsData shouldFlush](self, "shouldFlush");
  unsigned __int8 v13 = (void *)objc_claimAutoreleasedReturnValue(-[ASCMetricsData includingFields](self, "includingFields"));
  unsigned int v14 = (void *)objc_claimAutoreleasedReturnValue(-[ASCMetricsData excludingFields](self, "excludingFields"));
  id v15 = -[ASCMetricsData initWithTopic:shouldFlush:fields:includingFields:excludingFields:]( v10,  "initWithTopic:shouldFlush:fields:includingFields:excludingFields:",  v11,  v12,  v9,  v13,  v14);

  return v15;
}

- (NSString)topic
{
  return self->_topic;
}

- (BOOL)shouldFlush
{
  return self->_shouldFlush;
}

- (NSDictionary)fields
{
  return self->_fields;
}

- (NSSet)includingFields
{
  return self->_includingFields;
}

- (NSSet)excludingFields
{
  return self->_excludingFields;
}

- (void).cxx_destruct
{
}

@end
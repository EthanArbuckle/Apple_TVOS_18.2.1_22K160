@interface ASCMetricsActivity
+ (BOOL)supportsSecureCoding;
+ (NSDictionary)defaultFields;
- (ASCMetricsActivity)init;
- (ASCMetricsActivity)initWithCoder:(id)a3;
- (ASCMetricsActivity)initWithFields:(id)a3;
- (ASCMetricsActivity)metricsActivityWithValue:(id)a3 forKey:(id)a4;
- (BOOL)isEqual:(id)a3;
- (NSDictionary)fields;
- (id)description;
- (id)metricsActivityByMergingFields:(id)a3 uniquingFieldsWithBlock:(id)a4;
- (id)metricsActivityByRemovingValueForKey:(id)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ASCMetricsActivity

+ (NSDictionary)defaultFields
{
  if (qword_1001407F0 != -1) {
    dispatch_once(&qword_1001407F0, &stru_10011F1E0);
  }
  return (NSDictionary *)(id)qword_1001407F8;
}

- (ASCMetricsActivity)initWithFields:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___ASCMetricsActivity;
  v5 = -[ASCMetricsActivity init](&v10, "init");
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[ASCMetricsActivity defaultFields](&OBJC_CLASS___ASCMetricsActivity, "defaultFields"));
    uint64_t v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "asc_dictionaryByMergingDictionary:uniquingKeysWithBlock:", v4, &stru_10011F220));
    fields = v5->_fields;
    v5->_fields = (NSDictionary *)v7;
  }

  return v5;
}

- (ASCMetricsActivity)init
{
  return -[ASCMetricsActivity initWithFields:](self, "initWithFields:", &__NSDictionary0__struct);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ASCMetricsActivity)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = objc_alloc(&OBJC_CLASS___NSSet);
  uint64_t v6 = objc_opt_class(&OBJC_CLASS___NSDictionary);
  uint64_t v7 = -[NSSet initWithObjects:](v5, "initWithObjects:", v6, objc_opt_class(&OBJC_CLASS___NSString), 0LL);
  v8 = (void *)objc_claimAutoreleasedReturnValue([v4 decodeObjectOfClasses:v7 forKey:@"fields"]);

  if (v8)
  {
    self = -[ASCMetricsActivity initWithFields:](self, "initWithFields:", v8);
    v9 = self;
  }

  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_1000E1288();
    }
    v9 = 0LL;
  }

  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[ASCMetricsActivity fields](self, "fields"));
  [v4 encodeObject:v5 forKey:@"fields"];
}

- (unint64_t)hash
{
  v3 = objc_alloc_init(&OBJC_CLASS___ASCHasher);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[ASCMetricsActivity fields](self, "fields"));
  -[ASCHasher combineObject:](v3, "combineObject:", v4);

  unint64_t v5 = -[ASCHasher finalizeHash](v3, "finalizeHash");
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___ASCMetricsActivity);
  id v6 = v4;
  uint64_t v7 = v6;
  if (v6)
  {
    if ((objc_opt_isKindOfClass(v6, v5) & 1) != 0) {
      v8 = v7;
    }
    else {
      v8 = 0LL;
    }
  }

  else
  {
    v8 = 0LL;
  }

  id v9 = v8;

  if (v9)
  {
    objc_super v10 = (void *)objc_claimAutoreleasedReturnValue(-[ASCMetricsActivity fields](self, "fields"));
    uint64_t v11 = objc_claimAutoreleasedReturnValue([v9 fields]);
    v12 = (void *)v11;
    if (v10 && v11) {
      unsigned __int8 v13 = [v10 isEqual:v11];
    }
    else {
      unsigned __int8 v13 = v10 == (void *)v11;
    }
  }

  else
  {
    unsigned __int8 v13 = 0;
  }

  return v13;
}

- (id)description
{
  v3 = -[ASCDescriber initWithObject:](objc_alloc(&OBJC_CLASS___ASCDescriber), "initWithObject:", self);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[ASCMetricsActivity fields](self, "fields"));
  -[ASCDescriber addSensitiveObject:withName:](v3, "addSensitiveObject:withName:", v4, @"fields");

  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[ASCDescriber finalizeDescription](v3, "finalizeDescription"));
  return v5;
}

- (ASCMetricsActivity)metricsActivityWithValue:(id)a3 forKey:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ASCMetricsActivity fields](self, "fields"));
  id v9 = [v8 mutableCopy];

  [v9 setObject:v7 forKeyedSubscript:v6];
  id v10 = [objc_alloc((Class)objc_opt_class(self)) initWithFields:v9];

  return (ASCMetricsActivity *)v10;
}

- (id)metricsActivityByMergingFields:(id)a3 uniquingFieldsWithBlock:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ASCMetricsActivity fields](self, "fields"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "asc_dictionaryByMergingDictionary:uniquingKeysWithBlock:", v7, v6));

  id v10 = [objc_alloc((Class)objc_opt_class(self)) initWithFields:v9];
  return v10;
}

- (id)metricsActivityByRemovingValueForKey:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[ASCMetricsActivity fields](self, "fields"));
  id v6 = [v5 mutableCopy];

  [v6 removeObjectForKey:v4];
  id v7 = [objc_alloc((Class)objc_opt_class(self)) initWithFields:v6];

  return v7;
}

- (NSDictionary)fields
{
  return self->_fields;
}

- (void).cxx_destruct
{
}

@end
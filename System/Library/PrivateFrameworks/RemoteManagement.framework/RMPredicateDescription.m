@interface RMPredicateDescription
+ (BOOL)supportsSecureCoding;
- (BOOL)_buildPredicateFromFormatString:(id)a3 error:(id *)a4;
- (NSArray)properties;
- (NSArray)statusKeyPaths;
- (NSNumber)version;
- (NSPredicate)predicate;
- (RMPredicateDescription)initWithCoder:(id)a3;
- (RMPredicateDescription)initWithFormat:(id)a3 error:(id *)a4;
- (id)debugDescription;
- (id)description;
- (int64_t)_evaluateVersion1WithStatus:(id)a3 error:(id *)a4;
- (int64_t)_evaluateVersion2WithStatus:(id)a3 properties:(id)a4 error:(id *)a5;
- (int64_t)evaluateWithStatus:(id)a3 properties:(id)a4 error:(id *)a5;
- (void)_buildPredicateWithVisitorFromFormatString:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation RMPredicateDescription

- (RMPredicateDescription)initWithFormat:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___RMPredicateDescription;
  v7 = -[RMPredicateDescription init](&v11, "init");
  v8 = v7;
  if (v7
    && !-[RMPredicateDescription _buildPredicateFromFormatString:error:]( v7,  "_buildPredicateFromFormatString:error:",  v6,  a4))
  {
    v9 = 0LL;
  }

  else
  {
    v9 = v8;
  }

  return v9;
}

- (BOOL)_buildPredicateFromFormatString:(id)a3 error:(id *)a4
{
  id v4 = a3;
  v46[0] = 0LL;
  v39 = (void *)objc_claimAutoreleasedReturnValue( +[NSRegularExpression regularExpressionWithPattern:options:error:]( &OBJC_CLASS___NSRegularExpression,  "regularExpressionWithPattern:options:error:",  @"@(status|property|key)\\(([^)]+)\\"),  1LL,  v46));
  id v36 = v46[0];
  if (v39)
  {
    id v34 = [v4 length];
    v38 = (void *)objc_claimAutoreleasedReturnValue([v39 matchesInString:v4 options:0 range:0]);
    if ([v38 count])
    {
      v41 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v38 count]));
      v40 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v38 count]));
      v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v38 count]));
      __int128 v44 = 0u;
      __int128 v45 = 0u;
      __int128 v42 = 0u;
      __int128 v43 = 0u;
      id v6 = v38;
      id v7 = [v6 countByEnumeratingWithState:&v42 objects:v47 count:16];
      if (!v7) {
        goto LABEL_18;
      }
      uint64_t v8 = *(void *)v43;
      while (1)
      {
        v9 = 0LL;
        do
        {
          if (*(void *)v43 != v8) {
            objc_enumerationMutation(v6);
          }
          v10 = *(void **)(*((void *)&v42 + 1) + 8LL * (void)v9);
          id v11 = [v10 rangeAtIndex:1];
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "substringWithRange:", v11, v12));
          id v14 = [v10 rangeAtIndex:2];
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "substringWithRange:", v14, v15));
          if ([v13 isEqualToString:@"status"])
          {
            [v41 addObject:v16];
            v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@.%@",  v13,  v16));
            [v5 addObject:v17];
LABEL_12:

            goto LABEL_13;
          }

          if ([v13 isEqualToString:@"property"])
          {
            [v40 addObject:v16];
            v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@.%@",  v13,  v16));
            [v5 addObject:v17];
            goto LABEL_12;
          }

- (void)_buildPredicateWithVisitorFromFormatString:(id)a3
{
  id v14 = a3;
  id v4 = (NSPredicate *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](&OBJC_CLASS___NSPredicate, "predicateWithFormat:", v14));
  predicate = self->_predicate;
  self->_predicate = v4;

  statusKeyPaths = self->_statusKeyPaths;
  self->_statusKeyPaths = (NSArray *)&__NSArray0__struct;

  properties = self->_properties;
  self->_properties = (NSArray *)&__NSArray0__struct;

  version = self->_version;
  self->_version = (NSNumber *)&off_10001E868;

  v9 = objc_autoreleasePoolPush();
  v10 = -[_RMPredicateVisitor initWithFormat:](objc_alloc(&OBJC_CLASS____RMPredicateVisitor), "initWithFormat:", v14);
  -[NSPredicate acceptVisitor:flags:](self->_predicate, "acceptVisitor:flags:", v10, 3LL);
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[_RMPredicateVisitor statusKeyPaths](v10, "statusKeyPaths"));
  uint64_t v12 = (NSArray *)objc_claimAutoreleasedReturnValue([v11 allObjects]);
  v13 = self->_statusKeyPaths;
  self->_statusKeyPaths = v12;

  objc_autoreleasePoolPop(v9);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (RMPredicateDescription)initWithCoder:(id)a3
{
  id v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)&OBJC_CLASS___RMPredicateDescription;
  v5 = -[RMPredicateDescription init](&v24, "init");
  if (v5)
  {
    id v6 = [v4 decodeObjectOfClass:objc_opt_class(NSPredicate) forKey:@"predicate"];
    uint64_t v7 = objc_claimAutoreleasedReturnValue(v6);
    predicate = v5->_predicate;
    v5->_predicate = (NSPredicate *)v7;

    uint64_t v9 = objc_opt_class(&OBJC_CLASS___NSArray);
    v10 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v9,  objc_opt_class(&OBJC_CLASS___NSString),  0LL);
    id v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    uint64_t v12 = objc_claimAutoreleasedReturnValue([v4 decodeObjectOfClasses:v11 forKey:@"keyPaths"]);
    statusKeyPaths = v5->_statusKeyPaths;
    v5->_statusKeyPaths = (NSArray *)v12;

    if ([v4 containsValueForKey:@"version"])
    {
      uint64_t v14 = objc_opt_class(&OBJC_CLASS___NSArray);
      uint64_t v15 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v14,  objc_opt_class(&OBJC_CLASS___NSString),  0LL);
      v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
      uint64_t v17 = objc_claimAutoreleasedReturnValue([v4 decodeObjectOfClasses:v16 forKey:@"properties"]);
      properties = v5->_properties;
      v5->_properties = (NSArray *)v17;

      id v19 = [v4 decodeObjectOfClass:objc_opt_class(NSNumber) forKey:@"version"];
      uint64_t v20 = objc_claimAutoreleasedReturnValue(v19);
      version = v5->_version;
      v5->_version = (NSNumber *)v20;
    }

    else
    {
      v22 = v5->_properties;
      v5->_properties = (NSArray *)&__NSArray0__struct;

      version = v5->_version;
      v5->_version = (NSNumber *)&off_10001E868;
    }

    -[NSPredicate allowEvaluation](v5->_predicate, "allowEvaluation");
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RMPredicateDescription predicate](self, "predicate"));
  [v4 encodeObject:v5 forKey:@"predicate"];

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[RMPredicateDescription statusKeyPaths](self, "statusKeyPaths"));
  [v4 encodeObject:v6 forKey:@"keyPaths"];

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[RMPredicateDescription properties](self, "properties"));
  [v4 encodeObject:v7 forKey:@"properties"];

  id v8 = (id)objc_claimAutoreleasedReturnValue(-[RMPredicateDescription version](self, "version"));
  [v4 encodeObject:v8 forKey:@"version"];
}

- (id)description
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RMPredicateDescription predicate](self, "predicate"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 predicateFormat]);

  return v3;
}

- (id)debugDescription
{
  v3 = (objc_class *)objc_opt_class(self);
  id v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[RMPredicateDescription statusKeyPaths](self, "statusKeyPaths"));
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[RMPredicateDescription properties](self, "properties"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[RMPredicateDescription predicate](self, "predicate"));
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@: %p { statusKeyPaths = %@, properties = %@, predicate = %@ }>",  v5,  self,  v6,  v7,  v8));

  return v9;
}

- (int64_t)evaluateWithStatus:(id)a3 properties:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[RMPredicateDescription version](self, "version"));
  unsigned int v11 = [v10 isEqualToNumber:&off_10001E868];

  if (v11)
  {
    int64_t v12 = -[RMPredicateDescription _evaluateVersion1WithStatus:error:]( self,  "_evaluateVersion1WithStatus:error:",  v8,  a5);
LABEL_5:
    int64_t v15 = v12;
    goto LABEL_13;
  }

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[RMPredicateDescription version](self, "version"));
  unsigned int v14 = [v13 isEqualToNumber:&off_10001E880];

  if (v14)
  {
    int64_t v12 = -[RMPredicateDescription _evaluateVersion2WithStatus:properties:error:]( self,  "_evaluateVersion2WithStatus:properties:error:",  v8,  v9,  a5);
    goto LABEL_5;
  }

  v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog predicateDescription](&OBJC_CLASS___RMLog, "predicateDescription"));
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
    sub_100012730(self, v16);
  }

  if (a5)
  {
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(-[RMPredicateDescription predicate](self, "predicate"));
    id v18 = (void *)objc_claimAutoreleasedReturnValue([v17 predicateFormat]);
    id v19 = (void *)objc_claimAutoreleasedReturnValue( +[RMErrorUtilities createUnableToEvaluatePredicateErrorWithFormat:reason:]( &OBJC_CLASS___RMErrorUtilities,  "createUnableToEvaluatePredicateErrorWithFormat:reason:",  v18,  @"Invalid version"));

    if (v19) {
      *a5 = v19;
    }
  }

  int64_t v15 = -1LL;
LABEL_13:

  return v15;
}

- (int64_t)_evaluateVersion1WithStatus:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[RMPredicateDescription predicate](self, "predicate"));
  int64_t v7 = [v6 evaluateWithObject:v5];

  return v7;
}

- (int64_t)_evaluateVersion2WithStatus:(id)a3 properties:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  v13[0] = @"status";
  v13[1] = @"property";
  v14[0] = v7;
  v14[1] = v8;
  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v14,  v13,  2LL));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[RMPredicateDescription predicate](self, "predicate"));
  unsigned int v11 = [v10 evaluateWithObject:v9];

  return v11;
}

- (NSArray)statusKeyPaths
{
  return (NSArray *)objc_getProperty(self, a2, 8LL, 1);
}

- (NSArray)properties
{
  return (NSArray *)objc_getProperty(self, a2, 16LL, 1);
}

- (NSPredicate)predicate
{
  return self->_predicate;
}

- (NSNumber)version
{
  return self->_version;
}

- (void).cxx_destruct
{
}

@end
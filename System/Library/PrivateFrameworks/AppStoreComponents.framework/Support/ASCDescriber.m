@interface ASCDescriber
+ (id)nilObject;
- (ASCDescriber)initWithObject:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSMutableArray)properties;
- (NSObject)object;
- (id)describeObject;
- (id)describeProperties;
- (id)description;
- (id)finalizeDescription;
- (unint64_t)hash;
- (void)addBool:(BOOL)a3 withName:(id)a4;
- (void)addDouble:(double)a3 withName:(id)a4;
- (void)addInt64:(int64_t)a3 withName:(id)a4;
- (void)addInteger:(int64_t)a3 withName:(id)a4;
- (void)addObject:(id)a3 withName:(id)a4;
- (void)addSensitiveObject:(id)a3 withName:(id)a4;
- (void)addUInt64:(unint64_t)a3 withName:(id)a4;
- (void)addUnsignedInteger:(unint64_t)a3 withName:(id)a4;
@end

@implementation ASCDescriber

+ (id)nilObject
{
  return @"(null)";
}

- (ASCDescriber)initWithObject:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___ASCDescriber;
  v6 = -[ASCDescriber init](&v11, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_object, a3);
    v8 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    properties = v7->_properties;
    v7->_properties = v8;
  }

  return v7;
}

- (void)addBool:(BOOL)a3 withName:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  uint64_t v7 = NSStringFromBOOL(v4);
  id v8 = (id)objc_claimAutoreleasedReturnValue(v7);
  -[ASCDescriber addObject:withName:](self, "addObject:withName:", v8, v6);
}

- (void)addInteger:(int64_t)a3 withName:(id)a4
{
  id v6 = a4;
  id v7 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a3));
  -[ASCDescriber addObject:withName:](self, "addObject:withName:", v7, v6);
}

- (void)addUnsignedInteger:(unint64_t)a3 withName:(id)a4
{
  id v6 = a4;
  id v7 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a3));
  -[ASCDescriber addObject:withName:](self, "addObject:withName:", v7, v6);
}

- (void)addInt64:(int64_t)a3 withName:(id)a4
{
  id v6 = a4;
  id v7 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a3));
  -[ASCDescriber addObject:withName:](self, "addObject:withName:", v7, v6);
}

- (void)addUInt64:(unint64_t)a3 withName:(id)a4
{
  id v6 = a4;
  id v7 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a3));
  -[ASCDescriber addObject:withName:](self, "addObject:withName:", v7, v6);
}

- (void)addDouble:(double)a3 withName:(id)a4
{
  id v6 = a4;
  id v7 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", a3));
  -[ASCDescriber addObject:withName:](self, "addObject:withName:", v7, v6);
}

- (void)addSensitiveObject:(id)a3 withName:(id)a4
{
  id v6 = a4;
  uint64_t v7 = AMSHashIfNeeded(a3);
  id v8 = (id)objc_claimAutoreleasedReturnValue(v7);
  -[ASCDescriber addObject:withName:](self, "addObject:withName:", v8, v6);
}

- (void)addObject:(id)a3 withName:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[ASCDescriber properties](self, "properties"));
  id v8 = objc_alloc(&OBJC_CLASS___ASCPair);
  v9 = v11;
  if (!v11) {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[ASCDescriber nilObject](&OBJC_CLASS___ASCDescriber, "nilObject"));
  }
  v10 = -[ASCPair initWithFirst:second:](v8, "initWithFirst:second:", v6, v9);
  [v7 addObject:v10];

  if (!v11) {
}
  }

- (id)describeObject
{
  v3 = objc_alloc(&OBJC_CLASS___NSString);
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(-[ASCDescriber object](self, "object"));
  id v5 = (objc_class *)objc_opt_class(v4);
  id v6 = NSStringFromClass(v5);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[ASCDescriber object](self, "object"));
  v9 = -[NSString initWithFormat:](v3, "initWithFormat:", @"%@:%p", v7, v8);

  return v9;
}

- (id)describeProperties
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ASCDescriber properties](self, "properties"));
  id v4 = [v3 count];

  if (!v4) {
    return &stru_1001276D8;
  }
  id v5 = objc_alloc_init(&OBJC_CLASS___NSMutableString);
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[ASCDescriber properties](self, "properties"));
  id v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v17;
    do
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v16 + 1) + 8LL * (void)i);
        if (-[NSMutableString length](v5, "length")) {
          -[NSMutableString appendString:](v5, "appendString:", @"; ");
        }
        v12 = (void *)objc_claimAutoreleasedReturnValue([v11 first]);
        v13 = (void *)objc_claimAutoreleasedReturnValue([v11 second]);
        -[NSMutableString appendFormat:](v5, "appendFormat:", @"%@ = %@", v12, v13);
      }

      id v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }

    while (v8);
  }

  id v14 = -[NSMutableString copy](v5, "copy");
  return v14;
}

- (id)finalizeDescription
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ASCDescriber describeObject](self, "describeObject"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[ASCDescriber describeProperties](self, "describeProperties"));
  id v5 = [v4 length];
  id v6 = objc_alloc(&OBJC_CLASS___NSString);
  if (v5) {
    id v7 = -[NSString initWithFormat:](v6, "initWithFormat:", @"<%@ %@>", v3, v4);
  }
  else {
    id v7 = -[NSString initWithFormat:](v6, "initWithFormat:", @"<%@>", v3, v10);
  }
  id v8 = v7;

  return v8;
}

- (unint64_t)hash
{
  v3 = objc_alloc_init(&OBJC_CLASS___ASCHasher);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[ASCDescriber object](self, "object"));
  -[ASCHasher combineObject:](v3, "combineObject:", v4);

  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[ASCDescriber properties](self, "properties"));
  -[ASCHasher combineObject:](v3, "combineObject:", v5);

  unint64_t v6 = -[ASCHasher finalizeHash](v3, "finalizeHash");
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___ASCDescriber);
  id v6 = v4;
  id v7 = v6;
  if (v6)
  {
    if ((objc_opt_isKindOfClass(v6, v5) & 1) != 0) {
      id v8 = v7;
    }
    else {
      id v8 = 0LL;
    }
  }

  else
  {
    id v8 = 0LL;
  }

  id v9 = v8;

  if (v9)
  {
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[ASCDescriber object](self, "object"));
    uint64_t v11 = objc_claimAutoreleasedReturnValue([v9 object]);
    v12 = (void *)v11;
    if (v10 && v11)
    {
    }

    else if (v10 == (void *)v11)
    {
LABEL_10:
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[ASCDescriber properties](self, "properties"));
      uint64_t v14 = objc_claimAutoreleasedReturnValue([v9 properties]);
      v15 = (void *)v14;
      if (v13 && v14) {
        unsigned __int8 v16 = [v13 isEqual:v14];
      }
      else {
        unsigned __int8 v16 = v13 == (void *)v14;
      }

      goto LABEL_18;
    }

    unsigned __int8 v16 = 0;
LABEL_18:

    goto LABEL_19;
  }

  unsigned __int8 v16 = 0;
LABEL_19:

  return v16;
}

- (id)description
{
  v3 = (objc_class *)objc_opt_class(self);
  id v4 = NSStringFromClass(v3);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[ASCDescriber object](self, "object"));
  id v7 = (objc_class *)objc_opt_class(v6);
  id v8 = NSStringFromClass(v7);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[ASCDescriber object](self, "object"));
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[ASCDescriber properties](self, "properties"));
  v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@:%p object = <%@:%p>; properties = %@>",
                    v5,
                    self,
                    v9,
                    v10,
                    v11));

  return v12;
}

- (NSObject)object
{
  return self->_object;
}

- (NSMutableArray)properties
{
  return self->_properties;
}

- (void).cxx_destruct
{
}

@end
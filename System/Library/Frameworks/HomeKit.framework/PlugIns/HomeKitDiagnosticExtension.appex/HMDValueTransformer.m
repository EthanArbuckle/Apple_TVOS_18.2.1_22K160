@interface HMDValueTransformer
+ (Class)transformedValueClass;
+ (Class)valueClass;
+ (id)decodeValue:(id)a3 withTransformerNamed:(id)a4 error:(id *)a5;
+ (id)encodeValue:(id)a3 withTransformerNamed:(id)a4 error:(id *)a5;
+ (id)reverseTransformedValue:(id)a3 error:(id *)a4;
+ (id)sharedTransformer;
+ (id)transformedValue:(id)a3 error:(id *)a4;
+ (id)valueTransformerForName:(id)a3;
- (BOOL)isKindOfTransformer:(Class)a3;
- (HMDValueTransformer)init;
- (id)description;
- (id)reverseTransformedValue:(id)a3;
- (id)reverseTransformedValue:(id)a3 error:(id *)a4;
- (id)transformedValue:(id)a3;
- (id)transformedValue:(id)a3 error:(id *)a4;
@end

@implementation HMDValueTransformer

- (HMDValueTransformer)init
{
  uint64_t v4 = objc_opt_class(self, a2);
  if (v4 == objc_opt_class(&OBJC_CLASS___HMDValueTransformer, v5))
  {
    v7 = NSStringFromSelector(a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"You must override %@ in a subclass",  v8));
    id v10 = (id)objc_claimAutoreleasedReturnValue( +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  NSInternalInconsistencyException,  v9,  0LL));

    objc_exception_throw(v10);
    return (HMDValueTransformer *)-[HMDValueTransformer description](v11, v12);
  }

  else
  {
    v13.receiver = self;
    v13.super_class = (Class)&OBJC_CLASS___HMDValueTransformer;
    return -[HMDValueTransformer init](&v13, "init");
  }

- (id)description
{
  return objc_msgSend((id)objc_opt_class(self, a2), "description");
}

- (BOOL)isKindOfTransformer:(Class)a3
{
  return objc_opt_isKindOfClass(self, a3) & 1;
}

- (id)transformedValue:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    uint64_t v5 = 0LL;
    goto LABEL_5;
  }

  id v18 = 0LL;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[HMDValueTransformer transformedValue:error:](self, "transformedValue:error:", v4, &v18));
  id v6 = v18;
  if (v5)
  {

LABEL_5:
    return v5;
  }

  if (v6)
  {
    NSErrorUserInfoKey v19 = NSUnderlyingErrorKey;
    id v20 = v6;
    uint64_t v9 = objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v20,  &v19,  1LL));
  }

  else
  {
    uint64_t v9 = 0LL;
  }

  id v10 = (objc_class *)objc_opt_class(self, v7);
  v11 = NSStringFromClass(v10);
  SEL v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  uint64_t v13 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ transformedValue failed",  v12));

  id v14 = (id)objc_claimAutoreleasedReturnValue( +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  NSInvalidArgumentException,  v13,  v9));
  objc_exception_throw(v14);
  return -[HMDValueTransformer reverseTransformedValue:](v15, v16, v17);
}

- (id)reverseTransformedValue:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    uint64_t v5 = 0LL;
    goto LABEL_5;
  }

  id v19 = 0LL;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[HMDValueTransformer reverseTransformedValue:error:](self, "reverseTransformedValue:error:", v4, &v19));
  id v6 = v19;
  if (v5)
  {

LABEL_5:
    return v5;
  }

  if (v6)
  {
    NSErrorUserInfoKey v20 = NSUnderlyingErrorKey;
    id v21 = v6;
    uint64_t v9 = objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v21,  &v20,  1LL));
  }

  else
  {
    uint64_t v9 = 0LL;
  }

  id v10 = (objc_class *)objc_opt_class(self, v7);
  v11 = NSStringFromClass(v10);
  SEL v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  uint64_t v13 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ reverseTransformedValue failed",  v12));

  id v14 = (id)objc_claimAutoreleasedReturnValue( +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  NSInvalidArgumentException,  v13,  v9));
  objc_exception_throw(v14);
  return -[HMDValueTransformer transformedValue:error:](v15, v16, v17, v18);
}

- (id)transformedValue:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v8 = (void *)objc_opt_class(self, v7);
  else {
    uint64_t v9 = 0LL;
  }

  return v9;
}

- (id)reverseTransformedValue:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v8 = (void *)objc_opt_class(self, v7);
  else {
    uint64_t v9 = 0LL;
  }

  return v9;
}

+ (id)sharedTransformer
{
  v2 = NSStringFromClass((Class)a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSValueTransformer valueTransformerForName:]( &OBJC_CLASS___NSValueTransformer,  "valueTransformerForName:",  v3));

  return v4;
}

+ (id)valueTransformerForName:(id)a3
{
  id v3 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSValueTransformer valueTransformerForName:]( &OBJC_CLASS___NSValueTransformer,  "valueTransformerForName:",  v3));
  if (v5)
  {
    uint64_t v6 = objc_opt_class(&OBJC_CLASS___HMDValueTransformer, v4);
    if ((objc_opt_isKindOfClass(v5, v6) & 1) != 0)
    {
      id v7 = v5;
    }

    else
    {
      if (qword_100032C88 != -1) {
        dispatch_once(&qword_100032C88, &stru_100028918);
      }
      id v7 = (id)objc_claimAutoreleasedReturnValue([(id)qword_100032C80 objectForKey:v3]);
      if (!v7)
      {
        uint64_t v10 = objc_opt_class(&OBJC_CLASS___NSSecureUnarchiveFromDataTransformer, v8);
        if ((objc_opt_isKindOfClass(v5, v10) & 1) != 0)
        {
          SEL v12 = &off_1000281D8;
        }

        else
        {
          SEL v12 = &off_1000281D8;
          if (([v3 isEqualToString:NSKeyedUnarchiveFromDataTransformerName] & 1) == 0
            && ![v3 isEqualToString:NSUnarchiveFromDataTransformerName])
          {
            SEL v12 = off_1000281D0;
          }
        }

        id v7 = objc_msgSend(objc_alloc((Class)objc_opt_class(*v12, v11)), "initWithTransformer:", v5);
        uint64_t v13 = (void *)qword_100032C80;
        id v14 = [v3 copy];
        [v13 setObject:v7 forKey:v14];
      }
    }
  }

  else
  {
    id v7 = 0LL;
  }

  return v7;
}

+ (Class)valueClass
{
  v2 = NSStringFromSelector(a2);
  id v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"You must override %@ in a subclass",  v3));
  id v5 = (id)objc_claimAutoreleasedReturnValue( +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  NSInternalInconsistencyException,  v4,  0LL));

  objc_exception_throw(v5);
  return +[HMDValueTransformer transformedValueClass](v6, v7);
}

+ (Class)transformedValueClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___NSData, a2);
}

+ (id)transformedValue:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = NSStringFromSelector(a2);
  SEL v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"You must override %@ in a subclass",  v7));
  id v9 = (id)objc_claimAutoreleasedReturnValue( +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  NSInternalInconsistencyException,  v8,  0LL));

  objc_exception_throw(v9);
  return +[HMDValueTransformer reverseTransformedValue:error:](v10, v11, v12, v13);
}

+ (id)reverseTransformedValue:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = NSStringFromSelector(a2);
  SEL v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"You must override %@ in a subclass",  v7));
  id v9 = (id)objc_claimAutoreleasedReturnValue( +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  NSInternalInconsistencyException,  v8,  0LL));

  objc_exception_throw(v9);
  return -[HMDValueTransformerAdapater initWithTransformer:](v10, v11, v12);
}

+ (id)encodeValue:(id)a3 withTransformerNamed:(id)a4 error:(id *)a5
{
  if (a4) {
    SEL v7 = a4;
  }
  else {
    SEL v7 = NSKeyedUnarchiveFromDataTransformerName;
  }
  id v8 = a3;
  id v9 = sub_10000BC28((uint64_t)a1, v7);
  id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  SEL v11 = (void *)objc_claimAutoreleasedReturnValue([v10 transformedValue:v8 error:a5]);

  return v11;
}

+ (id)decodeValue:(id)a3 withTransformerNamed:(id)a4 error:(id *)a5
{
  if (a4) {
    SEL v7 = a4;
  }
  else {
    SEL v7 = NSKeyedUnarchiveFromDataTransformerName;
  }
  id v8 = a3;
  id v9 = sub_10000BC28((uint64_t)a1, v7);
  id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  SEL v11 = (void *)objc_claimAutoreleasedReturnValue([v10 reverseTransformedValue:v8 error:a5]);

  return v11;
}

@end
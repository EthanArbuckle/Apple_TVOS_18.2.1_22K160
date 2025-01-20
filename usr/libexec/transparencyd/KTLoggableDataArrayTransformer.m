@interface KTLoggableDataArrayTransformer
+ (BOOL)allowsReverseTransformation;
+ (Class)transformedValueClass;
+ (id)name;
+ (void)registerTransformer;
- (id)allowedTopLevelClasses;
- (id)reverseTransformedValue:(id)a3;
- (id)transformedValue:(id)a3;
@end

@implementation KTLoggableDataArrayTransformer

- (id)allowedTopLevelClasses
{
  uint64_t v3 = objc_opt_class(&OBJC_CLASS___KTLoggableDataArray, a2);
  return (id)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  &v3,  1LL));
}

+ (id)name
{
  return @"KTLoggableDataArrayTransformer";
}

+ (void)registerTransformer
{
  uint64_t v3 = objc_alloc_init(&OBJC_CLASS___KTLoggableDataArrayTransformer);
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[KTLoggableDataArrayTransformer name](&OBJC_CLASS___KTLoggableDataArrayTransformer, "name"));
  +[NSValueTransformer setValueTransformer:forName:]( &OBJC_CLASS___NSValueTransformer,  "setValueTransformer:forName:",  v3,  v2);
}

+ (BOOL)allowsReverseTransformation
{
  return 1;
}

+ (Class)transformedValueClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___KTLoggableData, a2);
}

- (id)transformedValue:(id)a3
{
  id v3 = a3;
  id v10 = 0LL;
  id v5 = +[NSKeyedUnarchiver unarchivedObjectOfClass:fromData:error:]( &OBJC_CLASS___NSKeyedUnarchiver,  "unarchivedObjectOfClass:fromData:error:",  objc_opt_class(&OBJC_CLASS___KTLoggableDataArray, v4),  v3,  &v10);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  id v7 = v10;
  if (v7)
  {
    if (qword_1002EEB88 != -1) {
      dispatch_once(&qword_1002EEB88, &stru_100285FF0);
    }
    v8 = (os_log_s *)qword_1002EEB90;
    if (os_log_type_enabled((os_log_t)qword_1002EEB90, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v12 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_ERROR,  "failed to transform from data to KTLoggableDataArray: %@",  buf,  0xCu);
    }
  }

  return v6;
}

- (id)reverseTransformedValue:(id)a3
{
  id v7 = 0LL;
  id v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  a3,  1LL,  &v7));
  id v4 = v7;
  if (v4)
  {
    if (qword_1002EEB88 != -1) {
      dispatch_once(&qword_1002EEB88, &stru_100286010);
    }
    id v5 = (os_log_s *)qword_1002EEB90;
    if (os_log_type_enabled((os_log_t)qword_1002EEB90, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v9 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_ERROR,  "failed to transform from KTLoggableDataArray to data: %@",  buf,  0xCu);
    }
  }

  return v3;
}

@end
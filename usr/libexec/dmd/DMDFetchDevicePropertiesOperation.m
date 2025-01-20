@interface DMDFetchDevicePropertiesOperation
+ (BOOL)validateRequest:(id)a3 error:(id *)a4;
+ (id)requiredEntitlements;
+ (id)whitelistedClassesForRequest;
- (void)runWithRequest:(id)a3;
@end

@implementation DMDFetchDevicePropertiesOperation

+ (id)whitelistedClassesForRequest
{
  return +[NSSet setWithObject:]( &OBJC_CLASS___NSSet,  "setWithObject:",  objc_opt_class(&OBJC_CLASS___DMFFetchDevicePropertiesRequest));
}

+ (id)requiredEntitlements
{
  return &off_1000A5778;
}

- (void)runWithRequest:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[DMDDeviceController shared](&OBJC_CLASS___DMDDeviceController, "shared"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v4 propertyKeys]);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v6));
  id v16 = (id)objc_claimAutoreleasedReturnValue([v5 deviceWithKeys:v7]);

  v8 = (void *)objc_claimAutoreleasedReturnValue([v4 propertyKeys]);
  v9 = (void *)objc_claimAutoreleasedReturnValue([v16 dictionaryWithValuesForKeys:v8]);
  id v10 = [v9 mutableCopy];

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
  v12 = (void *)objc_claimAutoreleasedReturnValue([v10 allKeysForObject:v11]);

  [v10 removeObjectsForKeys:v12];
  id v13 = objc_alloc(&OBJC_CLASS___DMFFetchDevicePropertiesResultObject);
  v14 = (void *)objc_claimAutoreleasedReturnValue([v16 errorsForKeys]);
  id v15 = [v13 initWithValuesByPropertyKey:v10 errorsByPropertyKey:v14];
  -[DMDFetchDevicePropertiesOperation endOperationWithResultObject:](self, "endOperationWithResultObject:", v15);
}

+ (BOOL)validateRequest:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v11.receiver = a1;
  v11.super_class = (Class)&OBJC_METACLASS___DMDFetchDevicePropertiesOperation;
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 propertyKeys]);

  if (!v7)
  {
    if (!a4) {
      goto LABEL_7;
    }
    uint64_t v12 = DMFInvalidParameterErrorKey;
    id v13 = @"request.propertyKeys";
    v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v13,  &v12,  1LL));
    uint64_t v9 = DMFErrorWithCodeAndUserInfo(1LL, v8);
    *a4 = (id)objc_claimAutoreleasedReturnValue(v9);

LABEL_6:
    LOBYTE(a4) = 0;
    goto LABEL_7;
  }

  LOBYTE(a4) = 1;
LABEL_7:

  return (char)a4;
}

@end
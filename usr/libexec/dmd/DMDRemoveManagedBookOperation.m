@interface DMDRemoveManagedBookOperation
+ (BOOL)validateRequest:(id)a3 error:(id *)a4;
+ (id)requiredEntitlements;
+ (id)whitelistedClassesForRequest;
@end

@implementation DMDRemoveManagedBookOperation

+ (id)whitelistedClassesForRequest
{
  return +[NSSet setWithObject:]( &OBJC_CLASS___NSSet,  "setWithObject:",  objc_opt_class(&OBJC_CLASS___DMFRemoveManagedBookRequest));
}

+ (id)requiredEntitlements
{
  return &off_1000A5A90;
}

+ (BOOL)validateRequest:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v12.receiver = a1;
  v12.super_class = (Class)&OBJC_METACLASS___DMDRemoveManagedBookOperation;
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 persistentID]);
  if (!v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue([v6 iTunesStoreID]);

    if (v8) {
      goto LABEL_5;
    }
    if (a4)
    {
      uint64_t v10 = DMFErrorWithCodeAndUserInfo(1600LL, 0LL);
      BOOL v9 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue(v10);
      goto LABEL_9;
    }

@end
@interface DMDInstallManagedBookOperation
+ (BOOL)validateRequest:(id)a3 error:(id *)a4;
+ (id)requiredEntitlements;
+ (id)whitelistedClassesForRequest;
@end

@implementation DMDInstallManagedBookOperation

+ (id)whitelistedClassesForRequest
{
  return +[NSSet setWithObject:]( &OBJC_CLASS___NSSet,  "setWithObject:",  objc_opt_class(&OBJC_CLASS___DMFInstallManagedBookRequest));
}

+ (id)requiredEntitlements
{
  return &off_1000A58F8;
}

+ (BOOL)validateRequest:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v17.receiver = a1;
  v17.super_class = (Class)&OBJC_METACLASS___DMDInstallManagedBookOperation;
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 URL]);

  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue([v6 persistentID]);

    if (!v8)
    {
      if (a4)
      {
        uint64_t v9 = 1501LL;
LABEL_11:
        uint64_t v13 = DMFErrorWithCodeAndUserInfo(v9, 0LL);
        BOOL v12 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue(v13);
        goto LABEL_15;
      }

      goto LABEL_14;
    }
  }

  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue([v6 iTunesStoreID]);

    if (!v10)
    {
      if (a4)
      {
        uint64_t v9 = 1004LL;
        goto LABEL_11;
      }

@end
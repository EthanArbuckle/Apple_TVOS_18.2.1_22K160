@interface DMDAppOperation
+ (BOOL)validateRequest:(id)a3 error:(id *)a4;
- (void)runWithRequest:(id)a3;
- (void)runWithRequest:(id)a3 bundleIdentifier:(id)a4;
@end

@implementation DMDAppOperation

+ (BOOL)validateRequest:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v20.receiver = a1;
  v20.super_class = (Class)&OBJC_METACLASS___DMDAppOperation;
  if (objc_msgSendSuper2(&v20, "validateRequest:error:", v6, a4))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue([v6 bundleIdentifier]);
    v8 = (void *)objc_claimAutoreleasedReturnValue([v6 storeItemIdentifier]);
    uint64_t v9 = objc_claimAutoreleasedReturnValue([v6 manifestURL]);
    v11 = (void *)v9;
    uint64_t v12 = v7 != 0LL;
    uint64_t v13 = 1LL;
    if (v7) {
      uint64_t v13 = 2LL;
    }
    if (v8) {
      uint64_t v12 = v13;
    }
    if (v9) {
      ++v12;
    }
    BOOL v14 = v12 == 1;
    if (v12 != 1)
    {
      uint64_t v15 = DMFAppLog(v9, v10);
      v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        sub_100061248(v16);
      }

      if (a4)
      {
        uint64_t v21 = DMFInvalidParameterErrorKey;
        v22 = @"request.bundleIdentifier";
        v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v22,  &v21,  1LL));
        uint64_t v18 = DMFErrorWithCodeAndUserInfo(1LL, v17);
        *a4 = (id)objc_claimAutoreleasedReturnValue(v18);
      }
    }
  }

  else
  {
    BOOL v14 = 0;
  }

  return v14;
}

- (void)runWithRequest:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[DMDAppController sharedController](&OBJC_CLASS___DMDAppController, "sharedController"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10001F04C;
  v7[3] = &unk_10009E0C0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 getBundleIdentifierForAppRequest:v6 completion:v7];
}

- (void)runWithRequest:(id)a3 bundleIdentifier:(id)a4
{
  id v9 = (id)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler", a3, a4));
  uint64_t v6 = objc_opt_class(self);
  v7 = NSStringFromSelector(a2);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  [v9 handleFailureInMethod:a2, self, @"DMDAppOperation.m", 68, @"%@ must implement %@", v6, v8 object file lineNumber description];
}

@end
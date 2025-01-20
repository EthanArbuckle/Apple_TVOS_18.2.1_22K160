@interface MISLaunchWarningDatabase
- (BOOL)setUserOverride:(BOOL)a3 forBundle:(id)a4 withError:(id *)a5;
- (id)queryForBundle:(id)a3 withError:(id *)a4;
- (id)queryForExecutableURL:(id)a3 withError:(id *)a4;
@end

@implementation MISLaunchWarningDatabase

- (id)queryForBundle:(id)a3 withError:(id *)a4
{
  id v5 = a3;
  if (_os_feature_enabled_impl())
  {
    v6 = (void *)objc_opt_new();
    objc_msgSend_queryAppBundle_error_(v6, v7, (uint64_t)v5, (uint64_t)a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    v9 = objc_alloc(&OBJC_CLASS___MISLaunchWarningQueryResult);
    v8 = (void *)objc_msgSend_initWithWarningState_withUserOverridden_withKBURL_(v9, v10, 0, 0, 0);
  }

  return v8;
}

- (id)queryForExecutableURL:(id)a3 withError:(id *)a4
{
  id v5 = a3;
  if (_os_feature_enabled_impl())
  {
    v6 = (void *)objc_opt_new();
    objc_msgSend_queryExecutableURL_error_(v6, v7, (uint64_t)v5, (uint64_t)a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    v9 = objc_alloc(&OBJC_CLASS___MISLaunchWarningQueryResult);
    v8 = (void *)objc_msgSend_initWithWarningState_withUserOverridden_withKBURL_(v9, v10, 0, 0, 0);
  }

  return v8;
}

- (BOOL)setUserOverride:(BOOL)a3 forBundle:(id)a4 withError:(id *)a5
{
  BOOL v6 = a3;
  id v7 = a4;
  if (_os_feature_enabled_impl())
  {
    v8 = (void *)objc_opt_new();
    id v14 = 0LL;
    objc_msgSend_setUserOverride_forBundle_error_(v8, v9, v6, (uint64_t)v7, &v14);
    id v10 = v14;
    v11 = v10;
    BOOL v12 = v10 == 0LL;
    if (a5 && v10) {
      *a5 = v10;
    }
  }

  else
  {
    BOOL v12 = 1;
  }

  return v12;
}

@end
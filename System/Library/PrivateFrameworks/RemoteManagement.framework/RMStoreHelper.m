@interface RMStoreHelper
+ (BOOL)hasDuplicateInContext:(id)a3 uri:(id)a4 storeType:(int64_t)a5 hasDuplicate:(BOOL *)a6 error:(id *)a7;
+ (BOOL)hasExistingSingletonTypeInContext:(id)a3 hasExisting:(BOOL *)a4 error:(id *)a5;
+ (BOOL)isInteractiveStoreType:(int64_t)a3;
+ (BOOL)isSingletonStoreType:(int64_t)a3;
+ (id)descriptorForStoreType:(int64_t)a3;
+ (int64_t)storeScope;
@end

@implementation RMStoreHelper

+ (id)descriptorForStoreType:(int64_t)a3
{
  else {
    return off_10001C7A0[a3];
  }
}

+ (int64_t)storeScope
{
  return +[RMBundle managementScope](&OBJC_CLASS___RMBundle, "managementScope") == (id)1;
}

+ (BOOL)isInteractiveStoreType:(int64_t)a3
{
  return a3 == 0;
}

+ (BOOL)isSingletonStoreType:(int64_t)a3
{
  return (a3 & 0xFFFFFFFFFFFFFFFDLL) == 1;
}

+ (BOOL)hasExistingSingletonTypeInContext:(id)a3 hasExisting:(BOOL *)a4 error:(id *)a5
{
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[RMManagementSource fetchRequestWithEnrollmentTypes:]( &OBJC_CLASS___RMManagementSource,  "fetchRequestWithEnrollmentTypes:",  &off_10001E920));
  [v7 setResultType:4];
  id v13 = 0LL;
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 execute:&v13]);
  id v9 = v13;
  v10 = (void *)objc_claimAutoreleasedReturnValue([v8 firstObject]);

  if (v10)
  {
    *a4 = (uint64_t)[v10 longLongValue] > 0;
  }

  else
  {
    v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog storeHelper](&OBJC_CLASS___RMLog, "storeHelper"));
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
      sub_1000127BC((uint64_t)v9, v11);
    }

    if (a5 && v9) {
      *a5 = v9;
    }
  }

  return v10 != 0LL;
}

+ (BOOL)hasDuplicateInContext:(id)a3 uri:(id)a4 storeType:(int64_t)a5 hasDuplicate:(BOOL *)a6 error:(id *)a7
{
  id v10 = a4;
  v11 = (void *)objc_claimAutoreleasedReturnValue( +[RMManagementSource fetchRequestWithBootstrapURI:enrollmentType:]( &OBJC_CLASS___RMManagementSource,  "fetchRequestWithBootstrapURI:enrollmentType:",  v10,  a5));
  [v11 setResultType:4];
  id v17 = 0LL;
  v12 = (void *)objc_claimAutoreleasedReturnValue([v11 execute:&v17]);
  id v13 = v17;
  v14 = (void *)objc_claimAutoreleasedReturnValue([v12 firstObject]);

  if (v14)
  {
    *a6 = (uint64_t)[v14 longLongValue] > 0;
  }

  else
  {
    v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog storeHelper](&OBJC_CLASS___RMLog, "storeHelper"));
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138543874;
      id v19 = v10;
      __int16 v20 = 2048;
      int64_t v21 = a5;
      __int16 v22 = 2114;
      id v23 = v13;
      _os_log_fault_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_FAULT,  "Unable to fetch management source objects with uri %{public}@ and channel %ld: %{public}@",  buf,  0x20u);
    }

    if (a7 && v13) {
      *a7 = v13;
    }
  }

  return v14 != 0LL;
}

@end
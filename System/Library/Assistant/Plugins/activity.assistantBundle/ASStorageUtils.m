@interface ASStorageUtils
+ (id)duetStoreForCommand:(id)a3;
+ (id)privateDuetStore;
+ (id)publicDuetStore;
@end

@implementation ASStorageUtils

+ (id)publicDuetStore
{
  if (qword_12C00 != -1) {
    dispatch_once(&qword_12C00, &stru_C590);
  }
  return (id)qword_12BF8;
}

+ (id)privateDuetStore
{
  if (qword_12C10 != -1) {
    dispatch_once(&qword_12C10, &stru_C5B0);
  }
  return (id)qword_12C08;
}

+ (id)duetStoreForCommand:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue([a1 privateDuetStore]);
  uint64_t v6 = objc_opt_class(&OBJC_CLASS___SARecordActivity);
  if ((objc_opt_isKindOfClass(v4, v6) & 1) != 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue([v4 activity]);
    v8 = (void *)objc_claimAutoreleasedReturnValue([v7 visibility]);
    unsigned int v9 = [v8 isEqualToString:SAAceActivityVisibilityTypePublicValue];

    if (v9)
    {
      uint64_t v10 = objc_claimAutoreleasedReturnValue([a1 publicDuetStore]);

      v5 = (void *)v10;
    }

    goto LABEL_9;
  }

  uint64_t v11 = objc_opt_class(&OBJC_CLASS___SARecordLocationActivity);
  if ((objc_opt_isKindOfClass(v4, v11) & 1) != 0
    || ((uint64_t v12 = objc_opt_class(&OBJC_CLASS___SAFetchActivityStream), (objc_opt_isKindOfClass(v4, v12) & 1) != 0)
     || (uint64_t v13 = objc_opt_class(&OBJC_CLASS___SARemoveFromActivityStream), (objc_opt_isKindOfClass(v4, v13) & 1) != 0))
    && (v14 = (void *)objc_claimAutoreleasedReturnValue([v4 visibility]),
        unsigned int v15 = [v14 isEqualToString:SAAceActivityVisibilityTypePublicValue],
        v14,
        v15))
  {
    v7 = v5;
    v5 = (void *)objc_claimAutoreleasedReturnValue([a1 publicDuetStore]);
LABEL_9:
  }

  return v5;
}

@end
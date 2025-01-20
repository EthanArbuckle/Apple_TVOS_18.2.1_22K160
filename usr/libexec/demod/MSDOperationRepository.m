@interface MSDOperationRepository
+ (id)createOperationFromIdentifier:(id)a3 withContext:(id)a4;
@end

@implementation MSDOperationRepository

+ (id)createOperationFromIdentifier:(id)a3 withContext:(id)a4
{
  v5 = (NSString *)a3;
  id v6 = a4;
  v7 = NSClassFromString(v5);
  if (!v7)
  {
    id v15 = sub_10003A95C();
    v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_100099738();
    }
    goto LABEL_11;
  }

  v9 = (os_log_s *)objc_alloc(v7);
  if (!v9 || (uint64_t v10 = objc_opt_class(&OBJC_CLASS___MSDOperation, v8), (objc_opt_isKindOfClass(v9, v10) & 1) == 0))
  {
    id v13 = sub_10003A95C();
    v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_1000997AC(v9, v14);
    }

LABEL_11:
    v11 = 0LL;
    goto LABEL_5;
  }

  v9 = v9;
  v11 = -[os_log_s initWithContext:](v9, "initWithContext:", v6);
LABEL_5:

  return v11;
}

@end
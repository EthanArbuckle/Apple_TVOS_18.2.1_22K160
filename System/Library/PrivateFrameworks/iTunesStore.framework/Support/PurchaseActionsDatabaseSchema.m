@interface PurchaseActionsDatabaseSchema
+ (BOOL)createOrUpdateSchemaInDatabase:(id)a3;
+ (id)databasePath;
@end

@implementation PurchaseActionsDatabaseSchema

+ (BOOL)createOrUpdateSchemaInDatabase:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (uint64_t)[v4 userVersion];
  uint64_t v24 = v5;
  if (v5 > 11301)
  {
LABEL_16:
    BOOL v8 = 1;
    goto LABEL_29;
  }

  id v23 = a1;
  while (v5 > 11000)
  {
    if (v5 == 11001)
    {
      unsigned __int8 v6 = sub_100124878(v4, &v24);
      goto LABEL_14;
    }

    if (v5 == 11300)
    {
      v7 = (id (*)(void *, void *))sub_1001248E8;
      goto LABEL_13;
    }

    if (v5 != 11301) {
      goto LABEL_30;
    }
    unsigned __int8 v6 = sub_100124984(v4, &v24);
LABEL_14:
    if ((v6 & 1) == 0)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
      unsigned int v10 = [v9 shouldLog];
      else {
        unsigned int v11 = v10;
      }
      v12 = (os_log_s *)objc_claimAutoreleasedReturnValue([v9 OSLogObject]);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        uint64_t v13 = v11;
      }
      else {
        uint64_t v13 = v11 & 2;
      }
      if (!(_DWORD)v13) {
        goto LABEL_27;
      }
      v14 = (void *)objc_opt_class(v23);
      int v25 = 138543618;
      v26 = v14;
      __int16 v27 = 2048;
      uint64_t v28 = v24;
      id v15 = v14;
      uint64_t v16 = _os_log_send_and_compose_impl( v13,  0LL,  0LL,  0LL,  &_mh_execute_header,  v12,  16LL,  "[%{public}@] Failed updating Purchase Intent Database to version %li",  &v25,  22);
      goto LABEL_25;
    }

    uint64_t v5 = v24;
    if (v24 > 11301) {
      goto LABEL_16;
    }
  }

  v7 = sub_100124760;
  if (!v5)
  {
LABEL_13:
    unsigned __int8 v6 = v7(v4, &v24);
    goto LABEL_14;
  }

  if (v5 == 11000)
  {
    unsigned __int8 v6 = sub_100124808(v4, &v24);
    goto LABEL_14;
  }

+ (id)databasePath
{
  if (qword_1003A34C8 != -1) {
    dispatch_once(&qword_1003A34C8, &stru_10034F560);
  }
  return (id)qword_1003A34C0;
}

@end
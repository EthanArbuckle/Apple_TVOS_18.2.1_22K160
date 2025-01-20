@interface PromotedIAPDatabaseSchema
+ (BOOL)createOrUpdateSchemaInDatabase:(id)a3;
+ (id)databasePath;
+ (id)databasePath_11_0_00;
@end

@implementation PromotedIAPDatabaseSchema

+ (BOOL)createOrUpdateSchemaInDatabase:(id)a3
{
  id v30 = a3;
  uint64_t v3 = (uint64_t)[v30 userVersion];
  uint64_t v29 = 11001LL;
  while (1)
  {
    uint64_t v4 = v3;
    if (v3 > 11000) {
      break;
    }
    if (v3)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
      unsigned int v22 = [v14 shouldLog];
      else {
        unsigned int v23 = v22;
      }
      v17 = (os_log_s *)objc_claimAutoreleasedReturnValue([v14 OSLogObject]);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        uint64_t v24 = v23;
      }
      else {
        uint64_t v24 = v23 & 2;
      }
      if (!(_DWORD)v24) {
        goto LABEL_35;
      }
      v25 = (void *)objc_opt_class(a1);
      int v35 = 138543874;
      v36 = v25;
      __int16 v37 = 2048;
      uint64_t v38 = v4;
      __int16 v39 = 2048;
      uint64_t v40 = 11001LL;
      id v20 = v25;
      uint64_t v21 = _os_log_send_and_compose_impl( v24,  0LL,  0LL,  0LL,  &_mh_execute_header,  v17,  16LL,  "[%{public}@] No Promoted IAP Database migration function for %li => %li",  &v35,  32);
LABEL_33:
      v26 = (void *)v21;

      if (v26)
      {
        v17 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v26,  4LL));
        free(v26);
        SSFileLog(v14, @"%@");
        goto LABEL_35;
      }

+ (id)databasePath
{
  if (qword_1003A32B0 != -1) {
    dispatch_once(&qword_1003A32B0, &stru_10034C6B0);
  }
  return (id)qword_1003A32A8;
}

+ (id)databasePath_11_0_00
{
  v2 = objc_alloc(&OBJC_CLASS___NSArray);
  uint64_t v3 = -[NSArray initWithObjects:]( v2,  "initWithObjects:",  CPSharedResourcesDirectory(v2),  @"Library",  @"Caches",  @"com.apple.itunesstored",  @"PromotedIAPs.sqlitedb",  0LL);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString pathWithComponents:](&OBJC_CLASS___NSString, "pathWithComponents:", v3));

  return v4;
}

@end
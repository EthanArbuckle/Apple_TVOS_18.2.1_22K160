@interface IDSUserManagement
+ (BOOL)isThreadDataSeparated;
@end

@implementation IDSUserManagement

+ (BOOL)isThreadDataSeparated
{
  uint64_t v9 = 0LL;
  v10 = &v9;
  uint64_t v11 = 0x2050000000LL;
  v2 = (void *)qword_1009C0D38;
  uint64_t v12 = qword_1009C0D38;
  if (!qword_1009C0D38)
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_1003CEB04;
    v8[3] = &unk_1008F6878;
    v8[4] = &v9;
    sub_1003CEB04((uint64_t)v8);
    v2 = (void *)v10[3];
  }

  id v3 = v2;
  _Block_object_dispose(&v9, 8);
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 currentPersona]);
  unsigned int v5 = [v4 isDataSeparatedPersona];
  if (v5 && os_variant_allows_internal_security_policies("com.apple.ids"))
  {
    v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMIDSLog daemon](&OBJC_CLASS___IMIDSLog, "daemon"));
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_1006AC600(v4, v6);
    }
  }

  return v5;
}

@end
@interface CNACAccountTypeAnalyzer
+ (BOOL)isAccountAppleAccount:(id)a3;
+ (BOOL)isAccountGenericContactsSyncingAccount:(id)a3;
+ (BOOL)isAccountGenericContactsSyncingOrDirectoryAccount:(id)a3;
+ (BOOL)isAccountPopularContactsSyncingAccount:(id)a3;
+ (BOOL)isiCloudSignoutRestrictionEnabled;
+ (id)os_log;
@end

@implementation CNACAccountTypeAnalyzer

+ (id)os_log
{
  if (qword_15CC0 != -1) {
    dispatch_once(&qword_15CC0, &stru_10730);
  }
  return (id)qword_15CC8;
}

+ (BOOL)isiCloudSignoutRestrictionEnabled
{
  id v3 = objc_alloc_init(off_15C88());
  id v12 = 0LL;
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 requestiCloudLogoutPolicyWithError:&v12]);
  id v5 = v12;
  if (v4)
  {
    BOOL v6 = [v4 integerValue] != 0;
  }

  else
  {
    id v7 = objc_msgSend((id)objc_opt_class(a1), "os_log");
    v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_AF4C((uint64_t)v5, v8);
    }

    id v9 = objc_msgSend((id)objc_opt_class(a1), "os_log");
    v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_AF0C(v10);
    }

    BOOL v6 = 0;
  }

  return v6;
}

+ (BOOL)isAccountAppleAccount:(id)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue([a3 accountType]);
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 identifier]);
  unsigned __int8 v5 = [v4 isEqualToString:ACAccountTypeIdentifierAppleAccount];

  return v5;
}

+ (BOOL)isAccountPopularContactsSyncingAccount:(id)a3
{
  id v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 accountType]);
  unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);
  if ([v5 isEqualToString:ACAccountTypeIdentifierGmail])
  {
    unsigned __int8 v6 = 1;
  }

  else
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v3 accountType]);
    v8 = (void *)objc_claimAutoreleasedReturnValue([v7 identifier]);
    if ([v8 isEqualToString:ACAccountTypeIdentifierYahoo])
    {
      unsigned __int8 v6 = 1;
    }

    else
    {
      id v9 = (void *)objc_claimAutoreleasedReturnValue([v3 accountType]);
      v10 = (void *)objc_claimAutoreleasedReturnValue([v9 identifier]);
      if ([v10 isEqualToString:ACAccountTypeIdentifierExchange])
      {
        unsigned __int8 v6 = 1;
      }

      else
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue([v3 accountType]);
        id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 identifier]);
        unsigned __int8 v6 = [v12 isEqualToString:ACAccountTypeIdentifierHotmail];
      }
    }
  }

  return v6;
}

+ (BOOL)isAccountGenericContactsSyncingAccount:(id)a3
{
  id v4 = a3;
  if ([a1 isAccountPopularContactsSyncingAccount:v4])
  {
    unsigned __int8 v5 = 1;
  }

  else
  {
    unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue([v4 accountType]);
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 identifier]);
    unsigned __int8 v5 = [v7 isEqualToString:ACAccountTypeIdentifierCardDAV];
  }

  return v5;
}

+ (BOOL)isAccountGenericContactsSyncingOrDirectoryAccount:(id)a3
{
  id v4 = a3;
  if ([a1 isAccountGenericContactsSyncingAccount:v4])
  {
    unsigned __int8 v5 = 1;
  }

  else
  {
    unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue([v4 accountType]);
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 identifier]);
    unsigned __int8 v5 = [v7 isEqualToString:ACAccountTypeIdentifierLDAP];
  }

  return v5;
}

@end
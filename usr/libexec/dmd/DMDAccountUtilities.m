@interface DMDAccountUtilities
+ (NSString)primaryAppleID;
@end

@implementation DMDAccountUtilities

+ (NSString)primaryAppleID
{
  v2 = objc_opt_new(&OBJC_CLASS___ACAccountStore);
  v3 = (void *)objc_claimAutoreleasedReturnValue( -[ACAccountStore accountTypeWithAccountTypeIdentifier:]( v2,  "accountTypeWithAccountTypeIdentifier:",  ACAccountTypeIdentifierAppleAccount));
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[ACAccountStore accountsWithAccountType:](v2, "accountsWithAccountType:", v3));
  id v5 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v5)
  {
    id v6 = v5;
    v16 = v3;
    uint64_t v7 = *(void *)v18;
    while (2)
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v18 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v17 + 1) + 8LL * (void)i);
        v10 = (void *)objc_claimAutoreleasedReturnValue([v9 accountProperties]);
        v11 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:@"primaryAccount"]);
        unsigned __int8 v12 = [v11 BOOLValue];

        if ((v12 & 1) != 0)
        {
          v14 = (void *)objc_claimAutoreleasedReturnValue([v9 accountProperties]);
          v13 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKeyedSubscript:@"appleId"]);

          goto LABEL_11;
        }
      }

      id v6 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v6) {
        continue;
      }
      break;
    }

    v13 = 0LL;
LABEL_11:
    v3 = v16;
  }

  else
  {
    v13 = 0LL;
  }

  return (NSString *)v13;
}

@end
@interface IDSAccount
+ (id)mr_activeGroupSessionAccount;
+ (id)mr_localGroupSessionHandle;
@end

@implementation IDSAccount

+ (id)mr_activeGroupSessionAccount
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[IDSService mr_sharedGroupSessionService](&OBJC_CLASS___IDSService, "mr_sharedGroupSessionService"));
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "accounts", 0));
  id v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v12;
    while (2)
    {
      for (i = 0LL; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v12 != v5) {
          objc_enumerationMutation(v3);
        }
        v7 = *(void **)(*((void *)&v11 + 1) + 8LL * (void)i);
        if ([v7 accountType] == 1)
        {
          if ([v7 isActive])
          {
            v8 = (void *)objc_claimAutoreleasedReturnValue([v7 accountRegisteredURIs]);
            id v9 = [v8 count];

            if (v9)
            {
              id v4 = v7;
              goto LABEL_13;
            }
          }
        }
      }

      id v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }

+ (id)mr_localGroupSessionHandle
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[IDSAccount mr_activeGroupSessionAccount](&OBJC_CLASS___IDSAccount, "mr_activeGroupSessionAccount"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 loginID]);

  if (v3) {
    id v4 = (void *)IDSCopyIDForEmailAddress(v3);
  }
  else {
    id v4 = 0LL;
  }

  return v4;
}

@end
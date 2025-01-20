@interface IDSAccount
- (NSString)csd_ISOCountryCode;
@end

@implementation IDSAccount

- (NSString)csd_ISOCountryCode
{
  if (-[IDSAccount accountType](self, "accountType"))
  {
    v3 = 0LL;
  }

  else
  {
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[IDSAccount aliasStrings](self, "aliasStrings", 0LL));
    id v5 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v5)
    {
      id v6 = v5;
      v3 = 0LL;
      uint64_t v7 = *(void *)v17;
LABEL_5:
      v8 = 0LL;
      v9 = v3;
      while (1)
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v10 = IMCountryCodeForNumber(*(void *)(*((void *)&v16 + 1) + 8LL * (void)v8));
        v3 = (void *)objc_claimAutoreleasedReturnValue(v10);

        if ([v3 length]) {
          break;
        }
        v8 = (char *)v8 + 1;
        v9 = v3;
        if (v6 == v8)
        {
          id v6 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
          if (v6) {
            goto LABEL_5;
          }
          break;
        }
      }
    }

    else
    {
      v3 = 0LL;
    }
  }

  if (![v3 length])
  {
    uint64_t v11 = objc_claimAutoreleasedReturnValue(-[IDSAccount regionBasePhoneNumber](self, "regionBasePhoneNumber"));
    v12 = (void *)v11;
    if (v11)
    {
      uint64_t v13 = IMCountryCodeForNumber(v11);
      uint64_t v14 = objc_claimAutoreleasedReturnValue(v13);

      v3 = (void *)v14;
    }
  }

  return (NSString *)v3;
}

@end
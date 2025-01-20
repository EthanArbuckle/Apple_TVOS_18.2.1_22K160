@interface CHHandle
+ (id)tu_normalizedCHHandlesFromTUHandle:(id)a3 isoCountryCodes:(id)a4;
- (TUHandle)tu_tuHandle;
@end

@implementation CHHandle

- (TUHandle)tu_tuHandle
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CHHandle value](self, "value"));
  id v4 = [v3 length];

  if (!v4) {
    return (TUHandle *)0LL;
  }
  id v5 = -[CHHandle type](self, "type");
  if ((unint64_t)v5 < 2)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CHHandle value](self, "value"));
    unsigned __int8 v10 = [v9 _appearsToBePhoneNumber];

    if ((v10 & 1) != 0)
    {
      uint64_t v7 = 2LL;
    }

    else
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[CHHandle value](self, "value"));
      unsigned int v12 = [v11 _appearsToBeEmail];

      if (v12) {
        uint64_t v7 = 3LL;
      }
      else {
        uint64_t v7 = 1LL;
      }
    }
  }

  else
  {
    uint64_t v6 = 1LL;
    if (v5 == (id)2) {
      uint64_t v6 = 2LL;
    }
    if (v5 == (id)3) {
      uint64_t v7 = 3LL;
    }
    else {
      uint64_t v7 = v6;
    }
  }

  v13 = objc_alloc(&OBJC_CLASS___TUHandle);
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[CHHandle value](self, "value"));
  v15 = -[TUHandle initWithType:value:](v13, "initWithType:value:", v7, v14);

  return v15;
}

+ (id)tu_normalizedCHHandlesFromTUHandle:(id)a3 isoCountryCodes:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  id v8 = [v5 type];
  if (v8 == (id)1)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue([v5 value]);
    uint64_t v18 = objc_claimAutoreleasedReturnValue( +[CHHandle normalizedGenericHandleForValue:]( &OBJC_CLASS___CHHandle,  "normalizedGenericHandleForValue:",  v17));
  }

  else if (v8 == (id)3)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue([v5 value]);
    uint64_t v18 = objc_claimAutoreleasedReturnValue( +[CHHandle normalizedEmailAddressHandleForValue:]( &OBJC_CLASS___CHHandle,  "normalizedEmailAddressHandleForValue:",  v17));
  }

  else
  {
    if (v8 != (id)2) {
      goto LABEL_21;
    }
    if ([v6 count])
    {
      __int128 v25 = 0u;
      __int128 v26 = 0u;
      __int128 v23 = 0u;
      __int128 v24 = 0u;
      id v22 = v6;
      id v9 = v6;
      id v10 = [v9 countByEnumeratingWithState:&v23 objects:v27 count:16];
      if (v10)
      {
        id v11 = v10;
        uint64_t v12 = *(void *)v24;
        do
        {
          v13 = 0LL;
          do
          {
            if (*(void *)v24 != v12) {
              objc_enumerationMutation(v9);
            }
            uint64_t v14 = *(void *)(*((void *)&v23 + 1) + 8LL * (void)v13);
            v15 = (void *)objc_claimAutoreleasedReturnValue([v5 value]);
            v16 = (void *)objc_claimAutoreleasedReturnValue( +[CHHandle normalizedPhoneNumberHandleForValue:isoCountryCode:]( &OBJC_CLASS___CHHandle,  "normalizedPhoneNumberHandleForValue:isoCountryCode:",  v15,  v14));

            if (v16) {
              -[NSMutableArray addObject:](v7, "addObject:", v16);
            }

            v13 = (char *)v13 + 1;
          }

          while (v11 != v13);
          id v11 = [v9 countByEnumeratingWithState:&v23 objects:v27 count:16];
        }

        while (v11);
      }

      id v6 = v22;
      goto LABEL_21;
    }

    v17 = (void *)objc_claimAutoreleasedReturnValue([v5 value]);
    uint64_t v18 = objc_claimAutoreleasedReturnValue( +[CHHandle normalizedPhoneNumberHandleForValue:isoCountryCode:]( &OBJC_CLASS___CHHandle,  "normalizedPhoneNumberHandleForValue:isoCountryCode:",  v17,  0LL));
  }

  v19 = (void *)v18;

  if (v19) {
    -[NSMutableArray addObject:](v7, "addObject:", v19);
  }

LABEL_21:
  id v20 = -[NSMutableArray copy](v7, "copy");

  return v20;
}

@end
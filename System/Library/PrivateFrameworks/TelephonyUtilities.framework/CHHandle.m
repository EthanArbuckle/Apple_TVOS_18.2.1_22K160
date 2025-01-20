@interface CHHandle
+ (CHHandle)handleWithTUHandle:(id)a3;
+ (int64_t)handleTypeForTUHandle:(id)a3;
- (TUHandle)tuHandle;
@end

@implementation CHHandle

+ (int64_t)handleTypeForTUHandle:(id)a3
{
  id v3 = a3;
  v4 = v3;
  if (v3)
  {
    v5 = (char *)[v3 type];
    else {
      int64_t v6 = (int64_t)v5;
    }
  }

  else
  {
    int64_t v6 = 0LL;
  }

  return v6;
}

+ (CHHandle)handleWithTUHandle:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [a1 handleTypeForTUHandle:v4];
    int64_t v6 = objc_alloc(&OBJC_CLASS___CHHandle);
    v7 = (void *)objc_claimAutoreleasedReturnValue([v4 value]);

    v8 = -[CHHandle initWithType:value:](v6, "initWithType:value:", v5, v7);
  }

  else
  {
    v8 = 0LL;
  }

  return v8;
}

- (TUHandle)tuHandle
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[CHHandle value](self, "value"));
  if (v3)
  {
    id v4 = -[CHHandle type](self, "type");
    if ((unint64_t)v4 < 2)
    {
      uint64_t v5 = objc_claimAutoreleasedReturnValue( +[TUHandle normalizedGenericHandleForValue:]( &OBJC_CLASS___TUHandle,  "normalizedGenericHandleForValue:",  v3));
      goto LABEL_8;
    }

    if (v4 == (id)2)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue([0 isoCountryCode]);
      int64_t v6 = (void *)objc_claimAutoreleasedReturnValue( +[TUHandle normalizedPhoneNumberHandleForValue:isoCountryCode:]( &OBJC_CLASS___TUHandle,  "normalizedPhoneNumberHandleForValue:isoCountryCode:",  v3,  v7));

      goto LABEL_10;
    }

    if (v4 == (id)3)
    {
      uint64_t v5 = objc_claimAutoreleasedReturnValue( +[TUHandle normalizedEmailAddressHandleForValue:]( &OBJC_CLASS___TUHandle,  "normalizedEmailAddressHandleForValue:",  v3));
LABEL_8:
      int64_t v6 = (void *)v5;
      goto LABEL_10;
    }
  }

  int64_t v6 = 0LL;
LABEL_10:

  return (TUHandle *)v6;
}

@end
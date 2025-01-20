@interface CXHandle
+ (CXHandle)handleWithTUHandle:(id)a3;
+ (id)handlesWithTUHandles:(id)a3;
+ (id)tuHandlesWithHandles:(id)a3;
- (CXHandle)initWithDestinationID:(id)a3;
- (TUHandle)tuHandle;
@end

@implementation CXHandle

+ (CXHandle)handleWithTUHandle:(id)a3
{
  id v3 = a3;
  v4 = v3;
  if (v3)
  {
    id v5 = [v3 type];
    uint64_t v6 = 2LL;
    if (v5 == (id)3) {
      uint64_t v6 = 3LL;
    }
    if (v5 == (id)1) {
      uint64_t v7 = 1LL;
    }
    else {
      uint64_t v7 = v6;
    }
    v8 = objc_alloc(&OBJC_CLASS___CXHandle);
    v9 = (void *)objc_claimAutoreleasedReturnValue([v4 value]);
    v10 = (void *)objc_claimAutoreleasedReturnValue([v4 siriDisplayName]);
    v11 = -[CXHandle initWithType:value:siriDisplayName:](v8, "initWithType:value:siriDisplayName:", v7, v9, v10);
  }

  else
  {
    v11 = -[CXHandle initWithType:](objc_alloc(&OBJC_CLASS___CXHandle), "initWithType:", 2LL);
  }

  return v11;
}

+ (id)tuHandlesWithHandles:(id)a3
{
  id v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableSet setWithCapacity:]( NSMutableSet,  "setWithCapacity:",  [v3 count]));
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      v9 = 0LL;
      do
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * (void)v9), "tuHandle", (void)v13));
        if (v10) {
          [v4 addObject:v10];
        }

        v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }

    while (v7);
  }

  id v11 = [v4 copy];
  return v11;
}

+ (id)handlesWithTUHandles:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableSet setWithCapacity:]( NSMutableSet,  "setWithCapacity:",  [v4 count]));
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      v10 = 0LL;
      do
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( a1,  "handleWithTUHandle:",  *(void *)(*((void *)&v14 + 1) + 8 * (void)v10),  (void)v14));
        [v5 addObject:v11];

        v10 = (char *)v10 + 1;
      }

      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }

    while (v8);
  }

  id v12 = [v5 copy];
  return v12;
}

- (CXHandle)initWithDestinationID:(id)a3
{
  id v4 = a3;
  if ([v4 destinationIdIsEmailAddress])
  {
    uint64_t v5 = 3LL;
  }

  else if ([v4 destinationIdIsPhoneNumber])
  {
    uint64_t v5 = 2LL;
  }

  else
  {
    uint64_t v5 = 1LL;
  }

  if (v4) {
    id v6 = -[CXHandle initWithType:value:](self, "initWithType:value:", v5, v4);
  }
  else {
    id v6 = -[CXHandle initWithType:](self, "initWithType:", v5);
  }
  id v7 = v6;

  return v7;
}

- (TUHandle)tuHandle
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[CXHandle value](self, "value"));
  if (!v3) {
    goto LABEL_6;
  }
  CXHandleType v4 = -[CXHandle type](self, "type");
  switch(v4)
  {
    case CXHandleTypeEmailAddress:
      uint64_t v5 = objc_claimAutoreleasedReturnValue( +[TUHandle normalizedEmailAddressHandleForValue:]( &OBJC_CLASS___TUHandle,  "normalizedEmailAddressHandleForValue:",  v3));
      break;
    case CXHandleTypePhoneNumber:
      uint64_t v5 = objc_claimAutoreleasedReturnValue( +[TUHandle normalizedPhoneNumberHandleForValue:isoCountryCode:]( &OBJC_CLASS___TUHandle,  "normalizedPhoneNumberHandleForValue:isoCountryCode:",  v3,  0LL));
      break;
    case CXHandleTypeGeneric:
      uint64_t v5 = objc_claimAutoreleasedReturnValue( +[TUHandle normalizedGenericHandleForValue:]( &OBJC_CLASS___TUHandle,  "normalizedGenericHandleForValue:",  v3));
      break;
    default:
LABEL_6:
      id v6 = 0LL;
      goto LABEL_11;
  }

  id v6 = (void *)v5;
  if (v5)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[CXHandle siriDisplayName](self, "siriDisplayName"));
    [v6 setSiriDisplayName:v7];
  }

@end
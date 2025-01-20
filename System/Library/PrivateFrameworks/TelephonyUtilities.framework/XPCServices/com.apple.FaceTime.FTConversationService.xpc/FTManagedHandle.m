@interface FTManagedHandle
+ (id)managedHandleForTUHandle:(id)a3 inManagedObjectContext:(id)a4;
+ (id)managedHandlesForTUHandles:(id)a3 inManagedObjectContext:(id)a4;
- (FTManagedHandle)initWithEntity:(id)a3 insertIntoManagedObjectContext:(id)a4;
- (TUHandle)tuHandle;
@end

@implementation FTManagedHandle

+ (id)managedHandleForTUHandle:(id)a3 inManagedObjectContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 persistentStoreCoordinator]);
  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 managedObjectModel]);

  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue([v9 entitiesByName]);
    v11 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:@"Handle"]);

    if (v11)
    {
      id v12 = [objc_alloc((Class)objc_opt_class(a1)) initWithEntity:v11 insertIntoManagedObjectContext:v7];
    }

    else
    {
      uint64_t v14 = FTCServiceLog();
      v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        int v20 = 138412546;
        v21 = @"Handle";
        __int16 v22 = 2112;
        id v23 = v7;
        _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "Could not find entity description with name %@ in managed object context %@. Falling back to convenience initializer.",  (uint8_t *)&v20,  0x16u);
      }

      id v12 = [objc_alloc((Class)objc_opt_class(a1)) initWithContext:v7];
    }

    v13 = v12;
    v16 = (void *)objc_claimAutoreleasedReturnValue([v6 isoCountryCode]);
    [v13 setIsoCountryCode:v16];

    v17 = (void *)objc_claimAutoreleasedReturnValue([v6 normalizedValue]);
    [v13 setNormalizedValue:v17];

    objc_msgSend(v13, "setType:", (__int16)objc_msgSend(v6, "type"));
    v18 = (void *)objc_claimAutoreleasedReturnValue([v6 value]);
    [v13 setValue:v18];
  }

  else
  {
    v13 = 0LL;
  }

  return v13;
}

+ (id)managedHandlesForTUHandles:(id)a3 inManagedObjectContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableSet setWithCapacity:]( NSMutableSet,  "setWithCapacity:",  [v6 count]));
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  id v9 = v6;
  id v10 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v18;
    do
    {
      v13 = 0LL;
      do
      {
        if (*(void *)v18 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( a1,  "managedHandleForTUHandle:inManagedObjectContext:",  *(void *)(*((void *)&v17 + 1) + 8 * (void)v13),  v7,  (void)v17));
        if (v14) {
          [v8 addObject:v14];
        }

        v13 = (char *)v13 + 1;
      }

      while (v11 != v13);
      id v11 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }

    while (v11);
  }

  id v15 = [v8 copy];
  return v15;
}

- (TUHandle)tuHandle
{
  unsigned int v3 = -[FTManagedHandle type](self, "type");
  switch(v3)
  {
    case 1u:
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[FTManagedHandle value](self, "value"));
      uint64_t v5 = objc_claimAutoreleasedReturnValue( +[TUHandle normalizedGenericHandleForValue:]( &OBJC_CLASS___TUHandle,  "normalizedGenericHandleForValue:",  v4));
      break;
    case 2u:
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[FTManagedHandle value](self, "value"));
      id v7 = (void *)objc_claimAutoreleasedReturnValue(-[FTManagedHandle isoCountryCode](self, "isoCountryCode"));
      id v6 = (void *)objc_claimAutoreleasedReturnValue( +[TUHandle normalizedPhoneNumberHandleForValue:isoCountryCode:]( &OBJC_CLASS___TUHandle,  "normalizedPhoneNumberHandleForValue:isoCountryCode:",  v4,  v7));

      goto LABEL_8;
    case 3u:
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[FTManagedHandle value](self, "value"));
      uint64_t v5 = objc_claimAutoreleasedReturnValue( +[TUHandle normalizedEmailAddressHandleForValue:]( &OBJC_CLASS___TUHandle,  "normalizedEmailAddressHandleForValue:",  v4));
      break;
    default:
      id v6 = 0LL;
      return (TUHandle *)v6;
  }

  id v6 = (void *)v5;
LABEL_8:

  return (TUHandle *)v6;
}

- (FTManagedHandle)initWithEntity:(id)a3 insertIntoManagedObjectContext:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for FTManagedHandle();
  return -[FTManagedHandle initWithEntity:insertIntoManagedObjectContext:]( &v7,  "initWithEntity:insertIntoManagedObjectContext:",  a3,  a4);
}

@end
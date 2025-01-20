@interface SecureElementPassFieldForeignReferenceIdentifier
+ (id)databaseTable;
+ (id)dbIdentifiersForSecureElementPassField:(id)a3 inDatabase:(id)a4;
+ (id)identifiersForSecureElementPassField:(id)a3 inDatabase:(id)a4;
+ (id)insertForeignReferenceIdentifier:(id)a3 forPaymentPassField:(id)a4 inDatabase:(id)a5;
+ (id)insertForeignReferenceIdentifiers:(id)a3 forSecureElementPassField:(id)a4 inDatabase:(id)a5;
+ (id)queryForForeignReferenceIdentifiersWithFieldPID:(int64_t)a3 inDatabase:(id)a4;
+ (void)deleteForeignReferenceIdentifiersInDatabase:(id)a3 forFieldPID:(int64_t)a4;
@end

@implementation SecureElementPassFieldForeignReferenceIdentifier

+ (id)databaseTable
{
  return @"secure_element_pass_field_foreign_identifier";
}

+ (id)insertForeignReferenceIdentifiers:(id)a3 forSecureElementPassField:(id)a4 inDatabase:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = -[NSMutableArray initWithCapacity:]( [NSMutableArray alloc],  "initWithCapacity:",  [v8 count]);
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  id v12 = v8;
  id v13 = [v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v20;
    do
    {
      v16 = 0LL;
      do
      {
        if (*(void *)v20 != v15) {
          objc_enumerationMutation(v12);
        }
        v17 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( a1,  "insertForeignReferenceIdentifier:forPaymentPassField:inDatabase:",  *(void *)(*((void *)&v19 + 1) + 8 * (void)v16),  v9,  v10,  (void)v19));
        -[NSMutableArray safelyAddObject:](v11, "safelyAddObject:", v17);

        v16 = (char *)v16 + 1;
      }

      while (v14 != v16);
      id v14 = [v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }

    while (v14);
  }

  return v11;
}

+ (id)insertForeignReferenceIdentifier:(id)a3 forPaymentPassField:(id)a4 inDatabase:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  -[NSMutableDictionary setEntityPIDOrNull:forKey:](v10, "setEntityPIDOrNull:forKey:", v8, @"field_pid");

  -[NSMutableDictionary setObjectOrNull:forKey:]( v10,  "setObjectOrNull:forKey:",  v9,  @"foreign_reference_identifier");
  v11 = -[SQLiteEntity initWithPropertyValues:inDatabase:]( objc_alloc(&OBJC_CLASS___SecureElementPassFieldForeignReferenceIdentifier),  "initWithPropertyValues:inDatabase:",  v10,  v7);

  return v11;
}

+ (id)queryForForeignReferenceIdentifiersWithFieldPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a3));
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"field_pid",  v7));

  id v9 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v8]);
  return v9;
}

+ (id)dbIdentifiersForSecureElementPassField:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  id v9 = [v7 persistentID];

  id v10 = (void *)objc_claimAutoreleasedReturnValue([a1 queryForForeignReferenceIdentifiersWithFieldPID:v9 inDatabase:v6]);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_10032508C;
  v15[3] = &unk_100643FD8;
  v17 = v8;
  id v18 = a1;
  id v16 = v6;
  v11 = v8;
  id v12 = v6;
  [v10 enumeratePersistentIDsUsingBlock:v15];
  id v13 = -[NSMutableSet copy](v11, "copy");

  return v13;
}

+ (id)identifiersForSecureElementPassField:(id)a3 inDatabase:(id)a4
{
  v4 = (void *)objc_claimAutoreleasedReturnValue([a1 dbIdentifiersForSecureElementPassField:a3 inDatabase:a4]);
  v5 = -[NSMutableSet initWithCapacity:]( [NSMutableSet alloc],  "initWithCapacity:",  [v4 count]);
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
      id v10 = 0LL;
      do
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( *(id *)(*((void *)&v14 + 1) + 8 * (void)v10),  "valueForProperty:",  @"foreign_reference_identifier",  (void)v14));
        if (v11) {
          -[NSMutableSet addObject:](v5, "addObject:", v11);
        }

        id v10 = (char *)v10 + 1;
      }

      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }

    while (v8);
  }

  id v12 = -[NSMutableSet copy](v5, "copy");
  return v12;
}

+ (void)deleteForeignReferenceIdentifiersInDatabase:(id)a3 forFieldPID:(int64_t)a4
{
  id v4 = (id)objc_claimAutoreleasedReturnValue([a1 queryForForeignReferenceIdentifiersWithFieldPID:a4 inDatabase:a3]);
  [v4 deleteAllEntities];
}

@end
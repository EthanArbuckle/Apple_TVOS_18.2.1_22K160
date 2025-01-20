@interface AssociatedPassTypeIdentifier
+ (id)_associatedPassTypeIdentifiersInDatabase:(id)a3 matchingPredicate:(id)a4;
+ (id)_predicateForPass:(id)a3;
+ (id)_predicateForPassPID:(int64_t)a3;
+ (id)_propertySettersForAssociatedPassTypeIdentifier;
+ (id)associatedPassTypeIdentifiersInDatabase:(id)a3 forPass:(id)a4;
+ (id)associatedPassTypeIdentifiersInDatabase:(id)a3 forPassPID:(unint64_t)a4;
+ (id)associationPropertyForEntityClass:(Class)a3;
+ (id)databaseTable;
+ (void)deleteEntitiesForPass:(id)a3 inDatabase:(id)a4;
+ (void)insertAssociatedPassTypeIdentifiers:(id)a3 forPass:(id)a4 inDatabase:(id)a5;
- (AssociatedPassTypeIdentifier)initWithPassTypeIdentifier:(id)a3 pass:(id)a4 inDatabase:(id)a5;
@end

@implementation AssociatedPassTypeIdentifier

+ (id)databaseTable
{
  return @"associated_pass_type_identifier";
}

+ (id)associationPropertyForEntityClass:(Class)a3
{
  if ((Class)objc_opt_class(&OBJC_CLASS___Pass, a2) == a3) {
    return @"pass_pid";
  }
  else {
    return 0LL;
  }
}

- (AssociatedPassTypeIdentifier)initWithPassTypeIdentifier:(id)a3 pass:(id)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  v12 = (void *)objc_claimAutoreleasedReturnValue([v10 dataUsingEncoding:4]);
  v13 = (void *)objc_claimAutoreleasedReturnValue([v12 SHA256Hash]);
  v14 = (void *)objc_claimAutoreleasedReturnValue([v13 hexEncoding]);

  [v11 setObjectOrNull:v10 forKey:@"identifier"];
  [v11 setObjectOrNull:v14 forKey:@"identifier_hash"];
  id v15 = [v9 persistentID];

  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", v15));
  [v11 setObject:v16 forKey:@"pass_pid"];

  v17 = -[SQLiteEntity initWithPropertyValues:inDatabase:](self, "initWithPropertyValues:inDatabase:", v11, v8);
  return v17;
}

+ (void)insertAssociatedPassTypeIdentifiers:(id)a3 forPass:(id)a4 inDatabase:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  id v11 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v16;
    do
    {
      v14 = 0LL;
      do
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v8);
        }

        v14 = (char *)v14 + 1;
      }

      while (v12 != v14);
      id v12 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }

    while (v12);
  }
}

+ (id)_associatedPassTypeIdentifiersInDatabase:(id)a3 matchingPredicate:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([a1 _propertySettersForAssociatedPassTypeIdentifier]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteEntity queryWithDatabase:predicate:]( &OBJC_CLASS___AssociatedPassTypeIdentifier,  "queryWithDatabase:predicate:",  v7,  v6));

  id v11 = (void *)objc_claimAutoreleasedReturnValue([v9 allKeys]);
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_1002FB600;
  v17[3] = &unk_100639BF0;
  id v20 = a1;
  id v18 = v9;
  id v12 = v8;
  id v19 = v12;
  id v13 = v9;
  [v10 enumeratePersistentIDsAndProperties:v11 usingBlock:v17];

  v14 = v19;
  id v15 = v12;

  return v15;
}

+ (id)_predicateForPassPID:(int64_t)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"pass_pid",  v3));

  return v4;
}

+ (id)_predicateForPass:(id)a3
{
  return objc_msgSend(a1, "_predicateForPassPID:", objc_msgSend(a3, "persistentID"));
}

+ (id)associatedPassTypeIdentifiersInDatabase:(id)a3 forPass:(id)a4
{
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForPass:a4]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 _associatedPassTypeIdentifiersInDatabase:v6 matchingPredicate:v7]);

  return v8;
}

+ (id)associatedPassTypeIdentifiersInDatabase:(id)a3 forPassPID:(unint64_t)a4
{
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForPassPID:a4]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 _associatedPassTypeIdentifiersInDatabase:v6 matchingPredicate:v7]);

  return v8;
}

+ (void)deleteEntitiesForPass:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v8 = (id)objc_claimAutoreleasedReturnValue([a1 _predicateForPass:a3]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v8]);

  [v7 deleteAllEntities];
}

+ (id)_propertySettersForAssociatedPassTypeIdentifier
{
  v3 = @"identifier";
  v4 = &stru_100655838;
  return (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v4,  &v3,  1LL));
}

@end
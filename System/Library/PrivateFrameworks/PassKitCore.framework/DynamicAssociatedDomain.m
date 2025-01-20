@interface DynamicAssociatedDomain
+ (id)_objectsWithQuery:(id)a3 inDatabase:(id)a4;
+ (id)_propertySetters;
+ (id)_propertyValuesFor:(id)a3;
+ (id)associatedDomainsInDatabase:(id)a3;
+ (id)databaseTable;
+ (void)deleteAssociatedDomainsInDatabase:(id)a3;
+ (void)insertAssociatedDomains:(id)a3 inDatabase:(id)a4;
- (DynamicAssociatedDomain)initWithDomain:(id)a3 inDatabase:(id)a4;
@end

@implementation DynamicAssociatedDomain

+ (id)databaseTable
{
  return @"bacon";
}

- (DynamicAssociatedDomain)initWithDomain:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v9 = objc_msgSend((id)objc_opt_class(self, v8), "_propertyValuesFor:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);

  v11 = -[SQLiteEntity initWithPropertyValues:inDatabase:](self, "initWithPropertyValues:inDatabase:", v10, v6);
  return v11;
}

+ (id)associatedDomainsInDatabase:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v4 predicate:0]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([a1 _objectsWithQuery:v5 inDatabase:v4]);

  return v6;
}

+ (void)insertAssociatedDomains:(id)a3 inDatabase:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  id v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
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
          objc_enumerationMutation(v5);
        }
        v11 = *(void **)(*((void *)&v14 + 1) + 8LL * (void)v10);
        v12 = -[DynamicAssociatedDomain initWithDomain:inDatabase:]( objc_alloc(&OBJC_CLASS___DynamicAssociatedDomain),  "initWithDomain:inDatabase:",  v11,  v6);
        v13 = (void *)objc_claimAutoreleasedReturnValue([v11 patterns]);
        +[DynamicAssociatedDomainPattern insertPatterns:forDomainPID:inDatabase:]( &OBJC_CLASS___DynamicAssociatedDomainPattern,  "insertPatterns:forDomainPID:inDatabase:",  v13,  -[SQLiteEntity persistentID](v12, "persistentID"),  v6);

        v10 = (char *)v10 + 1;
      }

      while (v8 != v10);
      id v8 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }

    while (v8);
  }
}

+ (void)deleteAssociatedDomainsInDatabase:(id)a3
{
  id v4 = a3;
  id v6 = (id)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v4 predicate:0]);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100109DA0;
  v7[3] = &unk_10063BE98;
  id v8 = v4;
  id v5 = v4;
  [v6 enumeratePersistentIDsUsingBlock:v7];
  [v6 deleteAllEntities];
}

+ (id)_objectsWithQuery:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 _propertySetters]);
  uint64_t v9 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  v10 = (void *)objc_claimAutoreleasedReturnValue([v8 allKeys]);
  __int128 v16 = _NSConcreteStackBlock;
  uint64_t v17 = 3221225472LL;
  v18 = sub_100109EE0;
  v19 = &unk_100638F18;
  id v23 = a1;
  id v20 = v8;
  id v21 = v6;
  v11 = v9;
  v22 = v11;
  id v12 = v6;
  id v13 = v8;
  [v7 enumeratePersistentIDsAndProperties:v10 usingBlock:&v16];

  if (-[NSMutableArray count](v11, "count", v16, v17, v18, v19)) {
    id v14 = -[NSMutableArray copy](v11, "copy");
  }
  else {
    id v14 = 0LL;
  }

  return v14;
}

+ (id)_propertyValuesFor:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 host]);

  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v5, @"a");
  return v4;
}

+ (id)_propertySetters
{
  id v3 = @"a";
  id v4 = &stru_100644598;
  return (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v4,  &v3,  1LL));
}

@end
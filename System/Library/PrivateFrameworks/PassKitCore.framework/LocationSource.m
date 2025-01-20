@interface LocationSource
+ (id)anyInDatabase:(id)a3 withLocationSourcePID:(id)a4;
+ (id)anyInDatabase:(id)a3 withURL:(id)a4;
+ (id)databaseTable;
+ (id)foreignKeyColumnForTable:(id)a3;
+ (id)insertLocationSourceWithURL:(id)a3 forPass:(id)a4 type:(int)a5 inDatabase:(id)a6;
+ (id)locationSourcePIDPredicate:(id)a3;
+ (id)urlPredicate:(id)a3;
- (BOOL)deleteFromDatabase;
- (LocationSource)initWithLocationURL:(id)a3 type:(int)a4 inDatabase:(id)a5;
@end

@implementation LocationSource

+ (id)databaseTable
{
  return @"location_source";
}

+ (id)foreignKeyColumnForTable:(id)a3
{
  else {
    return 0LL;
  }
}

- (LocationSource)initWithLocationURL:(id)a3 type:(int)a4 inDatabase:(id)a5
{
  uint64_t v5 = *(void *)&a4;
  id v8 = a5;
  id v9 = a3;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  v11 = (void *)objc_claimAutoreleasedReturnValue([v9 absoluteString]);

  [v10 setObject:v11 forKey:@"url"];
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v5));
  [v10 setObject:v12 forKey:@"type"];

  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___LocationSource;
  v13 = -[SQLiteEntity initWithPropertyValues:inDatabase:](&v15, "initWithPropertyValues:inDatabase:", v10, v8);

  return v13;
}

+ (id)insertLocationSourceWithURL:(id)a3 forPass:(id)a4 type:(int)a5 inDatabase:(id)a6
{
  uint64_t v7 = *(void *)&a5;
  id v10 = a4;
  id v11 = a6;
  id v12 = a3;
  id v13 = [objc_alloc((Class)a1) initWithLocationURL:v12 type:v7 inDatabase:v11];

  id v14 =  +[PassLocationSource insertPassLocationSourceWithPass:locationSource:inDatabase:]( &OBJC_CLASS___PassLocationSource,  "insertPassLocationSourceWithPass:locationSource:inDatabase:",  v10,  v13,  v11);
  return v13;
}

+ (id)anyInDatabase:(id)a3 withLocationSourcePID:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([a1 locationSourcePIDPredicate:a4]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v6 predicate:v7]);

  return v8;
}

+ (id)anyInDatabase:(id)a3 withURL:(id)a4
{
  if (a4)
  {
    id v6 = a3;
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([a1 urlPredicate:a4]);
    id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v6 predicate:v7]);
  }

  else
  {
    id v8 = 0LL;
  }

  return v8;
}

+ (id)locationSourcePIDPredicate:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"pid",  a3);
}

+ (id)urlPredicate:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue([a3 absoluteString]);
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"url",  v3));

  return v4;
}

- (BOOL)deleteFromDatabase
{
  v2 = self;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"pid"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity database](v2, "database"));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[Location queryWithDatabase:locationSourcePID:]( Location,  "queryWithDatabase:locationSourcePID:",  v4,  [v3 longLongValue]));

  [v5 deleteAllEntities];
  v7.receiver = v2;
  v7.super_class = (Class)&OBJC_CLASS___LocationSource;
  LOBYTE(v2) = -[SQLiteEntity deleteFromDatabase](&v7, "deleteFromDatabase");

  return (char)v2;
}

@end
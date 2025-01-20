@interface TileValueDate
+ (id)_predicateForBaseValue:(id)a3;
+ (id)databaseTable;
+ (id)insertValue:(id)a3 forBaseValue:(id)a4 inDatabase:(id)a5;
+ (void)deleteEntitiesForBaseValue:(id)a3 inDatabase:(id)a4;
+ (void)inflateValue:(id)a3 forBaseValue:(id)a4 inDatabase:(id)a5;
- (TileValueDate)initWithValue:(id)a3 forBaseValue:(id)a4 inDatabase:(id)a5;
@end

@implementation TileValueDate

- (TileValueDate)initWithValue:(id)a3 forBaseValue:(id)a4 inDatabase:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  v10 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  -[NSMutableDictionary setEntityPIDOrNull:forKey:](v10, "setEntityPIDOrNull:forKey:", v8, @"value_pid");

  v11 = (void *)objc_claimAutoreleasedReturnValue([v9 content]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v10, "setObjectOrNull:forKey:", v11, @"content");

  uint64_t v12 = _PKEnumValueToString( [v9 dateStyle],  @"PKDateStyle",  @"PKDateStyleNone, WLDateStyleNone,PKDateStyleShort, WLDateStyleShort, PKDateStyleMedium, WLDateStyleMedium, PKDateStyleLong, WLDateStyleLong, PKDateStyleFull, WLDateStyleFull");
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  -[NSMutableDictionary setObjectOrNull:forKey:]( v10,  "setObjectOrNull:forKey:",  v13,  @"date_style",  0LL,  0LL,  1LL,  1LL,  2LL,  2LL,  3LL,  3LL,  4LL,  4LL);

  uint64_t v14 = _PKEnumValueToString( [v9 timeStyle],  @"PKDateStyle",  @"PKDateStyleNone, WLDateStyleNone,PKDateStyleShort, WLDateStyleShort, PKDateStyleMedium, WLDateStyleMedium, PKDateStyleLong, WLDateStyleLong, PKDateStyleFull, WLDateStyleFull");
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  -[NSMutableDictionary setObjectOrNull:forKey:]( v10,  "setObjectOrNull:forKey:",  v15,  @"time_style",  0LL,  0LL,  1LL,  1LL,  2LL,  2LL,  3LL,  3LL,  4LL,  4LL);

  -[NSMutableDictionary setBool:forKey:]( v10,  "setBool:forKey:",  [v9 ignoresTimeZone],  @"ignores_time_zone");
  id v16 = [v9 isRelative];

  -[NSMutableDictionary setBool:forKey:](v10, "setBool:forKey:", v16, @"is_relative");
  v17 = -[SQLiteEntity initWithPropertyValues:inDatabase:](self, "initWithPropertyValues:inDatabase:", v10, v7);

  return v17;
}

+ (id)insertValue:(id)a3 forBaseValue:(id)a4 inDatabase:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = 0LL;
  if (v8 && v9)
  {
    uint64_t v19 = 0LL;
    v20 = &v19;
    uint64_t v21 = 0x3032000000LL;
    v22 = sub_100082364;
    v23 = sub_100082374;
    id v24 = 0LL;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_10008237C;
    v13[3] = &unk_10063C260;
    v17 = &v19;
    id v18 = a1;
    id v14 = v8;
    id v15 = v9;
    id v16 = v10;
    sub_1002CCC5C((uint64_t)v16, v13);
    id v11 = (id)v20[5];

    _Block_object_dispose(&v19, 8);
  }

  return v11;
}

+ (void)inflateValue:(id)a3 forBaseValue:(id)a4 inDatabase:(id)a5
{
  id v8 = a3;
  if (v8)
  {
    id v9 = a5;
    id v10 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForBaseValue:a4]);
    id v11 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteEntity queryWithDatabase:predicate:orderingProperties:orderingDirections:limit:]( &OBJC_CLASS___TileValueDate,  "queryWithDatabase:predicate:orderingProperties:orderingDirections:limit:",  v9,  v10,  0LL,  0LL,  1LL));

    v15[0] = @"content";
    v15[1] = @"date_style";
    v15[2] = @"time_style";
    v15[3] = @"ignores_time_zone";
    v15[4] = @"is_relative";
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v15, 5LL));
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_100082540;
    v13[3] = &unk_10063C0D0;
    id v14 = v8;
    [v11 enumeratePersistentIDsAndProperties:v12 usingBlock:v13];
  }
}

+ (void)deleteEntitiesForBaseValue:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v8 = (id)objc_claimAutoreleasedReturnValue([a1 _predicateForBaseValue:a3]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteEntity queryWithDatabase:predicate:]( &OBJC_CLASS___TileValueDate,  "queryWithDatabase:predicate:",  v6,  v8));

  [v7 deleteAllEntities];
}

+ (id)_predicateForBaseValue:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithLongLong:]( NSNumber,  "numberWithLongLong:",  [a3 persistentID]));
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"value_pid",  v3));

  return v4;
}

+ (id)databaseTable
{
  return @"pass_tile_value_date";
}

@end
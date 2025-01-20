@interface TileValueNumber
+ (id)_predicateForBaseValue:(id)a3;
+ (id)databaseTable;
+ (id)insertValue:(id)a3 forBaseValue:(id)a4 inDatabase:(id)a5;
+ (void)deleteEntitiesForBaseValue:(id)a3 inDatabase:(id)a4;
+ (void)inflateValue:(id)a3 forBaseValue:(id)a4 inDatabase:(id)a5;
- (TileValueNumber)initWithValue:(id)a3 forBaseValue:(id)a4 inDatabase:(id)a5;
@end

@implementation TileValueNumber

- (TileValueNumber)initWithValue:(id)a3 forBaseValue:(id)a4 inDatabase:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  v11 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  -[NSMutableDictionary setEntityPIDOrNull:forKey:](v11, "setEntityPIDOrNull:forKey:", v10, @"value_pid");

  v12 = (void *)objc_claimAutoreleasedReturnValue([v8 content]);
  v13 = (void *)objc_claimAutoreleasedReturnValue([v8 currencyCode]);
  if (v12)
  {
    [v12 decimalValue];
  }

  else
  {
    v22[0] = 0LL;
    v22[1] = 0LL;
    int v23 = 0;
  }

  v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSDecimalNumber decimalNumberWithDecimal:]( &OBJC_CLASS___NSDecimalNumber,  "decimalNumberWithDecimal:",  v22));
  if (!v13 || ([v13 isEqualToString:PKNoCurrencyCode] & 1) != 0)
  {
    -[NSMutableDictionary setObject:forKey:](v11, "setObject:forKey:", v14, @"decimal_content");
LABEL_9:
    uint64_t v19 = _PKEnumValueToString( [v8 numberStyle],  @"PKNumberStyle",  @"PKNumberStyleDecimal, WLNumberStyleDecimal, PKNumberStylePercent, WLNumberStylePercent, PKNumberStyleScientific, WLNumberStyleScientific, PKNumberStyleSpellOut, WLNumberStyleSpellOut");
    v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
    -[NSMutableDictionary setObjectOrNull:forKey:]( v11,  "setObjectOrNull:forKey:",  v20,  @"number_style",  1LL,  1LL,  3LL,  3LL,  4LL,  4LL,  5LL,  5LL);

    self = -[SQLiteEntity initWithPropertyValues:inDatabase:](self, "initWithPropertyValues:inDatabase:", v11, v9);
    v16 = self;
    goto LABEL_10;
  }

  uint64_t v15 = PKFormattedCurrencyStringFromNumber(v12, v13);
  v16 = (TileValueNumber *)objc_claimAutoreleasedReturnValue(v15);

  if (v16)
  {
    uint64_t v17 = PKCurrencyDecimalToStorageNumber(v14);
    v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
    -[NSMutableDictionary setObject:forKey:](v11, "setObject:forKey:", v18, @"currency_content");
    -[NSMutableDictionary setObject:forKey:](v11, "setObject:forKey:", v13, @"currency_code");

    goto LABEL_9;
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
    v22 = sub_100151A3C;
    int v23 = sub_100151A4C;
    id v24 = 0LL;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_100151A54;
    v13[3] = &unk_10063C260;
    uint64_t v17 = &v19;
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
    id v11 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteEntity queryWithDatabase:predicate:orderingProperties:orderingDirections:limit:]( &OBJC_CLASS___TileValueNumber,  "queryWithDatabase:predicate:orderingProperties:orderingDirections:limit:",  v9,  v10,  0LL,  0LL,  1LL));

    v15[0] = @"currency_content";
    v15[1] = @"decimal_content";
    v15[2] = @"number_style";
    v15[3] = @"currency_code";
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v15, 4LL));
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_100151C0C;
    v13[3] = &unk_10063C0D0;
    id v14 = v8;
    [v11 enumeratePersistentIDsAndProperties:v12 usingBlock:v13];
  }
}

+ (void)deleteEntitiesForBaseValue:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v8 = (id)objc_claimAutoreleasedReturnValue([a1 _predicateForBaseValue:a3]);
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteEntity queryWithDatabase:predicate:]( &OBJC_CLASS___TileValueNumber,  "queryWithDatabase:predicate:",  v6,  v8));

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
  return @"pass_tile_value_number";
}

@end
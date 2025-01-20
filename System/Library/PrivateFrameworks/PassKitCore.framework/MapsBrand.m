@interface MapsBrand
+ (id)_mapsBrandsMatchingQuery:(id)a3;
+ (id)_mapsBrandsWithQuery:(id)a3;
+ (id)_predicateForEndDate:(id)a3;
+ (id)_predicateForIdentifier:(id)a3;
+ (id)_predicateForPID:(id)a3;
+ (id)_predicateForPIDs:(id)a3;
+ (id)_predicateForStartDate:(id)a3;
+ (id)_propertySetters;
+ (id)_propertyValuesForMapsBrand:(id)a3;
+ (id)anyInDatabase:(id)a3 withIdentifier:(id)a4;
+ (id)anyInDatabase:(id)a3 withPID:(id)a4;
+ (id)databaseTable;
+ (id)insertMapsBrand:(id)a3 inDatabase:(id)a4;
+ (id)insertOrUpdateMapsBrand:(id)a3 inDatabase:(id)a4;
+ (id)mapsBrandsInDatabase:(id)a3;
+ (id)mapsBrandsWithLastUpdatedDateFromStartDate:(id)a3 endDate:(id)a4 limit:(int64_t)a5 inDatabase:(id)a6;
+ (void)associateMapsBrandsToPaymentTransactions:(id)a3 inDatabase:(id)a4;
- (MapsBrand)initWithMapsBrand:(id)a3 inDatabase:(id)a4;
- (id)mapsBrand;
- (void)updateWithMapsBrand:(id)a3;
@end

@implementation MapsBrand

+ (id)databaseTable
{
  return @"plantains";
}

- (MapsBrand)initWithMapsBrand:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v9 = objc_msgSend((id)objc_opt_class(self, v8), "_propertyValuesForMapsBrand:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);

  v11 = -[SQLiteEntity initWithPropertyValues:inDatabase:](self, "initWithPropertyValues:inDatabase:", v10, v6);
  return v11;
}

+ (id)anyInDatabase:(id)a3 withIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForIdentifier:a4]);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v6 predicate:v7]);

  return v8;
}

+ (id)anyInDatabase:(id)a3 withPID:(id)a4
{
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForPID:a4]);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v6 predicate:v7]);

  return v8;
}

+ (id)mapsBrandsInDatabase:(id)a3
{
  v4 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:a3 predicate:0]);
  v5 = (void *)objc_claimAutoreleasedReturnValue([a1 _mapsBrandsMatchingQuery:v4]);

  return v5;
}

+ (id)mapsBrandsWithLastUpdatedDateFromStartDate:(id)a3 endDate:(id)a4 limit:(int64_t)a5 inDatabase:(id)a6
{
  id v10 = a6;
  id v11 = a4;
  v12 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForStartDate:a3]);
  v19[0] = v12;
  v13 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForEndDate:v11]);

  v19[1] = v13;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v19, 2LL));
  v15 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v14));

  v16 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteEntity queryWithDatabase:predicate:orderingProperties:orderingDirections:limit:]( &OBJC_CLASS___MapsBrand,  "queryWithDatabase:predicate:orderingProperties:orderingDirections:limit:",  v10,  v15,  0LL,  0LL,  a5));
  v17 = (void *)objc_claimAutoreleasedReturnValue([a1 _mapsBrandsWithQuery:v16]);

  return v17;
}

+ (id)_mapsBrandsWithQuery:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue([a1 _propertySetters]);
  id v6 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 allKeys]);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_1003A13D8;
  v12[3] = &unk_100639BF0;
  id v15 = a1;
  id v13 = v5;
  uint64_t v8 = v6;
  v14 = v8;
  id v9 = v5;
  [v4 enumeratePersistentIDsAndProperties:v7 usingBlock:v12];

  if (-[NSMutableSet count](v8, "count")) {
    id v10 = -[NSMutableSet copy](v8, "copy");
  }
  else {
    id v10 = 0LL;
  }

  return v10;
}

+ (void)associateMapsBrandsToPaymentTransactions:(id)a3 inDatabase:(id)a4
{
  id v13 = a3;
  id v6 = a4;
  if ([v13 count])
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v13 allKeys]);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForPIDs:v7]);
    id v9 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteEntity queryWithDatabase:predicate:]( &OBJC_CLASS___MapsBrand,  "queryWithDatabase:predicate:",  v6,  v8));

    id v10 = (void *)objc_claimAutoreleasedReturnValue([a1 _propertySetters]);
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 allKeys]);
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_1003A158C;
    v14[3] = &unk_100639BF0;
    id v17 = a1;
    id v15 = v10;
    id v16 = v13;
    id v12 = v10;
    [v9 enumeratePersistentIDsAndProperties:v11 usingBlock:v14];
  }
}

+ (id)insertMapsBrand:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [objc_alloc((Class)a1) initWithMapsBrand:v7 inDatabase:v6];

  return v8;
}

+ (id)insertOrUpdateMapsBrand:(id)a3 inDatabase:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 isValid])
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( NSNumber,  "numberWithUnsignedLongLong:",  [v5 identifier]));
    id v8 = (void *)objc_claimAutoreleasedReturnValue( +[MapsBrand anyInDatabase:withIdentifier:]( &OBJC_CLASS___MapsBrand,  "anyInDatabase:withIdentifier:",  v6,  v7));

    if (v8) {
      [v8 updateWithMapsBrand:v5];
    }
    else {
      id v8 = (void *)objc_claimAutoreleasedReturnValue( +[MapsBrand insertMapsBrand:inDatabase:]( &OBJC_CLASS___MapsBrand,  "insertMapsBrand:inDatabase:",  v5,  v6));
    }
  }

  else
  {
    id v8 = 0LL;
  }

  return v8;
}

- (void)updateWithMapsBrand:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"last_processed_date"));
  id v6 = (void *)_DateForSQLValue(v5);

  id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 lastProcessedDate]);
  id v9 = v7;
  if (v7 || !v6)
  {
    if (!v7 || !v6 || ([v7 timeIntervalSinceDate:v6], v15 >= 0.0))
    {
      id v17 = objc_msgSend((id)objc_opt_class(self, v8), "_propertyValuesForMapsBrand:", v4);
      v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
      -[SQLiteEntity setValuesWithDictionary:](self, "setValuesWithDictionary:", v18);

      goto LABEL_13;
    }

    uint64_t Object = PKLogFacilityTypeGetObject(6LL);
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v19 = 138412802;
      id v20 = v4;
      __int16 v21 = 2112;
      v22 = v9;
      __int16 v23 = 2112;
      v24 = v6;
      id v12 = "Not updating mapsBrand %@ since the new brand date %@ is older than the current last processed date %@.";
      id v13 = v11;
      uint32_t v14 = 32;
      goto LABEL_10;
    }
  }

  else
  {
    uint64_t v10 = PKLogFacilityTypeGetObject(6LL);
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v19 = 138412546;
      id v20 = v4;
      __int16 v21 = 2112;
      v22 = v6;
      id v12 = "Not updating mapsBrand %@ since the new brand doesnt have a last processed date defined. The current last pr"
            "ocessed date is %@";
      id v13 = v11;
      uint32_t v14 = 22;
LABEL_10:
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, v12, (uint8_t *)&v19, v14);
    }
  }

LABEL_13:
}

- (id)mapsBrand
{
  v3 = objc_alloc_init(&OBJC_CLASS___PKMapsBrand);
  id v5 = objc_msgSend((id)objc_opt_class(self, v4), "_propertySetters");
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 allKeys]);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_1003A1AC4;
  v13[3] = &unk_100638EF0;
  v13[4] = self;
  id v14 = v6;
  uint64_t v8 = v3;
  double v15 = v8;
  id v9 = v6;
  -[SQLiteEntity getValuesForProperties:withApplier:](self, "getValuesForProperties:withApplier:", v7, v13);

  uint64_t v10 = v15;
  id v11 = v8;

  return v11;
}

+ (id)_mapsBrandsMatchingQuery:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([a1 _propertySetters]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 allKeys]);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_1003A1C10;
  v12[3] = &unk_100639BF0;
  id v14 = v6;
  id v15 = a1;
  id v13 = v5;
  id v8 = v6;
  id v9 = v5;
  [v4 enumeratePersistentIDsAndProperties:v7 usingBlock:v12];

  id v10 = [v8 copy];
  return v10;
}

+ (id)_predicateForIdentifier:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"a",  a3);
}

+ (id)_predicateForPID:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"pid",  a3);
}

+ (id)_predicateForPIDs:(id)a3
{
  return +[SQLiteContainsPredicate containsPredicateWithProperty:values:]( &OBJC_CLASS___SQLiteContainsPredicate,  "containsPredicateWithProperty:values:",  @"pid",  a3);
}

+ (id)_predicateForStartDate:(id)a3
{
  if (a3)
  {
    v3 = (void *)_SQLValueForDate(a3);
    id v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:greaterThanOrEqualToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:greaterThanOrEqualToValue:",  @"last_processed_date",  v3));
  }

  else
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(+[SQLiteBooleanPredicate truePredicate](&OBJC_CLASS___SQLiteBooleanPredicate, "truePredicate"));
  }

  return v4;
}

+ (id)_predicateForEndDate:(id)a3
{
  if (a3)
  {
    v3 = (void *)_SQLValueForDate(a3);
    id v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:lessThanOrEqualToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:lessThanOrEqualToValue:",  @"last_processed_date",  v3));
  }

  else
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(+[SQLiteBooleanPredicate truePredicate](&OBJC_CLASS___SQLiteBooleanPredicate, "truePredicate"));
  }

  return v4;
}

+ (id)_propertyValuesForMapsBrand:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  -[NSMutableDictionary setUnsignedLongLong:forKey:]( v4,  "setUnsignedLongLong:forKey:",  [v3 identifier],  @"a");
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInt:]( NSNumber,  "numberWithInt:",  [v3 resultProviderIdentifier]));
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v5, @"b");

  id v6 = (void *)objc_claimAutoreleasedReturnValue([v3 name]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v6, @"c");

  id v7 = (void *)objc_claimAutoreleasedReturnValue([v3 phoneNumber]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v7, @"d");

  id v8 = (void *)objc_claimAutoreleasedReturnValue([v3 url]);
  id v9 = (void *)_SQLValueForURL(v8);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v9, @"e");

  id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [v3 category]));
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v10, @"g");

  id v11 = (void *)objc_claimAutoreleasedReturnValue([v3 detailedCategory]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v11, @"h");

  id v12 = (void *)objc_claimAutoreleasedReturnValue([v3 logoURL]);
  id v13 = (void *)_SQLValueForURL(v12);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v13, @"i");

  id v14 = (void *)objc_claimAutoreleasedReturnValue([v3 lastProcessedDate]);
  id v15 = (void *)_SQLValueForDate(v14);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v15, @"last_processed_date");

  id v16 = (void *)objc_claimAutoreleasedReturnValue([v3 businessChatURL]);
  if (v16)
  {
    id v17 = (void *)objc_claimAutoreleasedReturnValue([v3 businessChatURL]);
    v18 = (void *)_SQLValueForURL(v17);
    -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v18, @"m");
  }

  int v19 = (void *)objc_claimAutoreleasedReturnValue([v3 heroImageURL]);

  if (v19)
  {
    id v20 = (void *)objc_claimAutoreleasedReturnValue([v3 heroImageURL]);
    __int16 v21 = (void *)_SQLValueForURL(v20);
    -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v21, @"n");
  }

  v22 = (void *)objc_claimAutoreleasedReturnValue([v3 heroImageAttributionName]);

  if (v22)
  {
    __int16 v23 = (void *)objc_claimAutoreleasedReturnValue([v3 heroImageAttributionName]);
    -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v23, @"o");
  }

  v24 = (void *)objc_claimAutoreleasedReturnValue([v3 stylingInfoData]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v24, @"l");

  id v25 = -[NSMutableDictionary copy](v4, "copy");
  return v25;
}

+ (id)_propertySetters
{
  v3[0] = @"a";
  v3[1] = @"b";
  v4[0] = &stru_10065A3C0;
  v4[1] = &stru_10065A3E0;
  v3[2] = @"c";
  v3[3] = @"d";
  v4[2] = &stru_10065A400;
  v4[3] = &stru_10065A420;
  v3[4] = @"e";
  v3[5] = @"g";
  v4[4] = &stru_10065A440;
  v4[5] = &stru_10065A460;
  v3[6] = @"h";
  v3[7] = @"i";
  v4[6] = &stru_10065A480;
  v4[7] = &stru_10065A4A0;
  v3[8] = @"m";
  v3[9] = @"n";
  v4[8] = &stru_10065A4C0;
  v4[9] = &stru_10065A4E0;
  v3[10] = @"o";
  v3[11] = @"last_processed_date";
  v4[10] = &stru_10065A500;
  v4[11] = &stru_10065A520;
  v3[12] = @"l";
  v4[12] = &stru_10065A540;
  return (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v4,  v3,  13LL));
}

@end
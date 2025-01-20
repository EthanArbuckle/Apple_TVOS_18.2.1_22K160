@interface MapsMerchant
+ (id)_mapsMerchantsMatchingQuery:(id)a3;
+ (id)_mapsMerchantsWithQuery:(id)a3;
+ (id)_predicateForEndDate:(id)a3;
+ (id)_predicateForIdentifier:(id)a3;
+ (id)_predicateForPID:(id)a3;
+ (id)_predicateForPIDs:(id)a3;
+ (id)_predicateForStartDate:(id)a3;
+ (id)_propertySetters;
+ (id)_propertyValuesForMapsMerchant:(id)a3;
+ (id)anyInDatabase:(id)a3 withIdentifier:(id)a4;
+ (id)anyInDatabase:(id)a3 withPID:(id)a4;
+ (id)databaseTable;
+ (id)insertMapsMerchant:(id)a3 inDatabase:(id)a4;
+ (id)insertOrUpdateMapsMerchant:(id)a3 inDatabase:(id)a4;
+ (id)mapsMerchantsInDatabase:(id)a3;
+ (id)mapsMerchantsWithLastUpdatedDateFromStartDate:(id)a3 endDate:(id)a4 limit:(int64_t)a5 inDatabase:(id)a6;
+ (void)associateMapsMerchantsToPaymentTransactions:(id)a3 inDatabase:(id)a4;
- (MapsMerchant)initWithMapsMerchant:(id)a3 inDatabase:(id)a4;
- (id)mapsMerchant;
- (void)updateWithMapsMerchant:(id)a3;
@end

@implementation MapsMerchant

+ (id)databaseTable
{
  return @"maps_merchant";
}

- (MapsMerchant)initWithMapsMerchant:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v9 = objc_msgSend((id)objc_opt_class(self, v8), "_propertyValuesForMapsMerchant:", v7);
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

+ (id)mapsMerchantsInDatabase:(id)a3
{
  v4 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:a3 predicate:0]);
  v5 = (void *)objc_claimAutoreleasedReturnValue([a1 _mapsMerchantsMatchingQuery:v4]);

  return v5;
}

+ (id)mapsMerchantsWithLastUpdatedDateFromStartDate:(id)a3 endDate:(id)a4 limit:(int64_t)a5 inDatabase:(id)a6
{
  id v10 = a6;
  id v11 = a4;
  v12 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForStartDate:a3]);
  v19[0] = v12;
  v13 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForEndDate:v11]);

  v19[1] = v13;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v19, 2LL));
  v15 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v14));

  v16 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteEntity queryWithDatabase:predicate:orderingProperties:orderingDirections:limit:]( &OBJC_CLASS___MapsMerchant,  "queryWithDatabase:predicate:orderingProperties:orderingDirections:limit:",  v10,  v15,  0LL,  0LL,  a5));
  v17 = (void *)objc_claimAutoreleasedReturnValue([a1 _mapsMerchantsWithQuery:v16]);

  return v17;
}

+ (id)_mapsMerchantsWithQuery:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue([a1 _propertySetters]);
  id v6 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 allKeys]);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_1002E3C7C;
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

+ (void)associateMapsMerchantsToPaymentTransactions:(id)a3 inDatabase:(id)a4
{
  id v13 = a3;
  id v6 = a4;
  if ([v13 count])
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v13 allKeys]);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForPIDs:v7]);
    id v9 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteEntity queryWithDatabase:predicate:]( &OBJC_CLASS___MapsMerchant,  "queryWithDatabase:predicate:",  v6,  v8));

    id v10 = (void *)objc_claimAutoreleasedReturnValue([a1 _propertySetters]);
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 allKeys]);
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_1002E3E30;
    v14[3] = &unk_100639BF0;
    id v17 = a1;
    id v15 = v10;
    id v16 = v13;
    id v12 = v10;
    [v9 enumeratePersistentIDsAndProperties:v11 usingBlock:v14];
  }
}

+ (id)insertMapsMerchant:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [objc_alloc((Class)a1) initWithMapsMerchant:v7 inDatabase:v6];

  return v8;
}

+ (id)insertOrUpdateMapsMerchant:(id)a3 inDatabase:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 isValid])
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( NSNumber,  "numberWithUnsignedLongLong:",  [v5 identifier]));
    id v8 = (void *)objc_claimAutoreleasedReturnValue( +[MapsMerchant anyInDatabase:withIdentifier:]( &OBJC_CLASS___MapsMerchant,  "anyInDatabase:withIdentifier:",  v6,  v7));

    if (v8) {
      [v8 updateWithMapsMerchant:v5];
    }
    else {
      id v8 = (void *)objc_claimAutoreleasedReturnValue( +[MapsMerchant insertMapsMerchant:inDatabase:]( &OBJC_CLASS___MapsMerchant,  "insertMapsMerchant:inDatabase:",  v5,  v6));
    }
  }

  else
  {
    id v8 = 0LL;
  }

  return v8;
}

- (void)updateWithMapsMerchant:(id)a3
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
      id v17 = objc_msgSend((id)objc_opt_class(self, v8), "_propertyValuesForMapsMerchant:", v4);
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
      id v12 = "Not updating mapsMerchant %@ since the new merchant date %@ is older than the current last processed date %@.";
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
      id v12 = "Not updating mapsMerchant %@ since the new merchant doesnt have a last processed date defined. The current l"
            "ast processed date is %@";
      id v13 = v11;
      uint32_t v14 = 22;
LABEL_10:
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, v12, (uint8_t *)&v19, v14);
    }
  }

LABEL_13:
}

- (id)mapsMerchant
{
  v3 = objc_alloc_init(&OBJC_CLASS___PKMapsMerchant);
  id v5 = objc_msgSend((id)objc_opt_class(self, v4), "_propertySetters");
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 allKeys]);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_1002E4368;
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

+ (id)_mapsMerchantsMatchingQuery:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([a1 _propertySetters]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 allKeys]);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_1002E44B8;
  v13[3] = &unk_100639BF0;
  id v16 = a1;
  id v14 = v5;
  id v8 = v6;
  id v15 = v8;
  id v9 = v5;
  [v4 enumeratePersistentIDsAndProperties:v7 usingBlock:v13];

  uint64_t v10 = v15;
  id v11 = v8;

  return v11;
}

+ (id)_predicateForIdentifier:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"identifier",  a3);
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

+ (id)_propertyValuesForMapsMerchant:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  -[NSMutableDictionary setUnsignedLongLong:forKey:]( v4,  "setUnsignedLongLong:forKey:",  [v3 identifier],  @"identifier");
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInt:]( NSNumber,  "numberWithInt:",  [v3 resultProviderIdentifier]));
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v5, @"result_provider_identifier");

  id v6 = (void *)objc_claimAutoreleasedReturnValue([v3 name]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v6, @"name");

  id v7 = (void *)objc_claimAutoreleasedReturnValue([v3 phoneNumber]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v7, @"phone_number");

  id v8 = (void *)objc_claimAutoreleasedReturnValue([v3 url]);
  id v9 = (void *)_SQLValueForURL(v8);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v9, @"url");

  [v3 locationLatitude];
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v10, @"location_latitude");

  [v3 locationLongitude];
  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v11, @"location_longitude");

  id v12 = (void *)objc_claimAutoreleasedReturnValue([v3 postalAddress]);
  id v13 = (void *)_SQLValueForPostalAddress();
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v13, @"postal_address");

  id v14 = (void *)objc_claimAutoreleasedReturnValue([v3 heroImageURL]);
  id v15 = (void *)_SQLValueForURL(v14);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v15, @"a");

  id v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [v3 category]));
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v16, @"c");

  id v17 = (void *)objc_claimAutoreleasedReturnValue([v3 detailedCategory]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v17, @"d");

  v18 = (void *)objc_claimAutoreleasedReturnValue([v3 lastProcessedDate]);
  int v19 = (void *)_SQLValueForDate(v18);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v19, @"last_processed_date");

  id v20 = (void *)objc_claimAutoreleasedReturnValue([v3 businessChatURL]);
  if (v20)
  {
    __int16 v21 = (void *)objc_claimAutoreleasedReturnValue([v3 businessChatURL]);
    v22 = (void *)_SQLValueForURL(v21);
    -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v22, @"i");
  }

  __int16 v23 = (void *)objc_claimAutoreleasedReturnValue([v3 heroImageAttributionName]);

  if (v23)
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue([v3 heroImageAttributionName]);
    -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v24, @"h");
  }

  v25 = (void *)objc_claimAutoreleasedReturnValue([v3 stylingInfo]);

  if (v25)
  {
    v26 = (void *)objc_claimAutoreleasedReturnValue([v3 stylingInfo]);
    v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  v26,  1LL,  0LL));
  }

  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v25, @"g");
  id v27 = -[NSMutableDictionary copy](v4, "copy");

  return v27;
}

+ (id)_propertySetters
{
  v3[0] = @"identifier";
  v3[1] = @"result_provider_identifier";
  v4[0] = &stru_100654488;
  v4[1] = &stru_1006544A8;
  v3[2] = @"name";
  v3[3] = @"phone_number";
  v4[2] = &stru_1006544C8;
  v4[3] = &stru_1006544E8;
  v3[4] = @"url";
  v3[5] = @"location_latitude";
  v4[4] = &stru_100654508;
  v4[5] = &stru_100654528;
  v3[6] = @"location_longitude";
  v3[7] = @"postal_address";
  v4[6] = &stru_100654548;
  v4[7] = &stru_100654568;
  v3[8] = @"a";
  v3[9] = @"h";
  v4[8] = &stru_100654588;
  v4[9] = &stru_1006545A8;
  v3[10] = @"c";
  v3[11] = @"d";
  v4[10] = &stru_1006545C8;
  v4[11] = &stru_1006545E8;
  v3[12] = @"i";
  v3[13] = @"last_processed_date";
  v4[12] = &stru_100654608;
  v4[13] = &stru_100654628;
  v3[14] = @"g";
  v4[14] = &stru_100654648;
  return (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v4,  v3,  15LL));
}

@end
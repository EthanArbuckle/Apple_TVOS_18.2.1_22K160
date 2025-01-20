@interface WorldRegion
+ (BOOL)hasMultipleRegionsOfType:(unint64_t)a3 localeIdentifier:(id)a4 inDatabase:(id)a5;
+ (BOOL)hasRegionsMissingLocalizedContentForLocaleIdentifier:(id)a3 inDatabase:(id)a4;
+ (id)_predicateForCode:(id)a3;
+ (id)_predicateForIdentifier:(id)a3;
+ (id)_predicateForLatitude:(double)a3;
+ (id)_predicateForLocaleIdentifier:(id)a3;
+ (id)_predicateForLocalizedContent;
+ (id)_predicateForLongitude:(double)a3;
+ (id)_predicateForMUID:(id)a3;
+ (id)_predicateForName:(id)a3;
+ (id)_predicateForNamePattern:(id)a3;
+ (id)_predicateForPID:(id)a3;
+ (id)_predicateForParentPID:(id)a3;
+ (id)_predicateForTransaction:(id)a3;
+ (id)_predicateForType:(unint64_t)a3;
+ (id)anyInDatabase:(id)a3 withIdentifier:(id)a4;
+ (id)anyInDatabase:(id)a3 withPID:(id)a4;
+ (id)databaseTable;
+ (id)disambiguatedSQLForProperty:(id)a3;
+ (id)insertOrUpdateRegion:(id)a3 inDatabase:(id)a4;
+ (id)insertOrUpdateRegion:(id)a3 single:(BOOL)a4 inDatabase:(id)a5;
+ (id)lastRegionErrorForTransaction:(id)a3 inDatabase:(id)a4;
+ (id)regionWithIdentifier:(id)a3 localeIdentifier:(id)a4 inDatabase:(id)a5;
+ (id)regionsForTransactionPID:(int64_t)a3 localeIdentifier:(id)a4 inDatabase:(id)a5;
+ (id)regionsFromQuery:(id)a3;
+ (id)regionsFromQuery:(id)a3 additionalProperties:(id)a4;
+ (id)regionsMatchingName:(id)a3 types:(id)a4 localeIdentifier:(id)a5 inDatabase:(id)a6;
+ (id)regionsMissingLocalizedContentForLocaleIdentifier:(id)a3 inDatabase:(id)a4;
+ (id)regionsOfType:(unint64_t)a3 localeIdentifier:(id)a4 inDatabase:(id)a5;
+ (id)updateSingleRegion:(id)a3 inDatabase:(id)a4;
+ (void)addJoinClausesForProperty:(id)a3 toJoins:(id)a4;
+ (void)associateTransaction:(id)a3 withWorldRegion:(id)a4 inDatabase:(id)a5;
+ (void)deleteAllRegionsInDatabase:(id)a3;
+ (void)deleteRegionsWithNoMatchingTransactionsInDatabase:(id)a3;
+ (void)failedToAssociateTransaction:(id)a3 error:(id)a4 inDatabase:(id)a5;
+ (void)resetCoordinatesForAllRegionsInDatabase:(id)a3;
@end

@implementation WorldRegion

+ (id)databaseTable
{
  return @"world_region";
}

+ (id)anyInDatabase:(id)a3 withPID:(id)a4
{
  id v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForPID:a4]);
  v8 = (void *)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v6 predicate:v7]);

  return v8;
}

+ (id)anyInDatabase:(id)a3 withIdentifier:(id)a4
{
  id v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForIdentifier:a4]);
  v8 = (void *)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v6 predicate:v7]);

  return v8;
}

+ (id)regionsMatchingName:(id)a3 types:(id)a4 localeIdentifier:(id)a5 inDatabase:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v34 = a5;
  id v33 = a6;
  v12 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  v13 = &OBJC_CLASS___SQLitePropertyPredicate;
  if ([v11 count])
  {
    v14 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    __int128 v35 = 0u;
    __int128 v36 = 0u;
    __int128 v37 = 0u;
    __int128 v38 = 0u;
    id v15 = v11;
    id v16 = [v15 countByEnumeratingWithState:&v35 objects:v43 count:16];
    if (v16)
    {
      id v17 = v16;
      uint64_t v18 = *(void *)v36;
      do
      {
        for (i = 0LL; i != v17; i = (char *)i + 1)
        {
          if (*(void *)v36 != v18) {
            objc_enumerationMutation(v15);
          }
          v20 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( a1,  "_predicateForType:",  objc_msgSend(*(id *)(*((void *)&v35 + 1) + 8 * (void)i), "integerValue")));
          -[NSMutableArray addObject:](v14, "addObject:", v20);
        }

        id v17 = [v15 countByEnumeratingWithState:&v35 objects:v43 count:16];
      }

      while (v17);
    }

    v13 = &OBJC_CLASS___SQLitePropertyPredicate;
    v21 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAnyPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAnyPredicates:",  v14));
    -[NSMutableArray addObject:](v12, "addObject:", v21);
  }

  if (v10)
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForNamePattern:v10]);
    -[NSMutableArray addObject:](v12, "addObject:", v22);
  }

  v23 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForLocalizedContent]);
  -[NSMutableArray addObject:](v12, "addObject:", v23);

  v24 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForLocaleIdentifier:v34]);
  -[NSMutableArray addObject:](v12, "addObject:", v24);

  v25 = (void *)objc_claimAutoreleasedReturnValue([&v13[10] predicateMatchingAllPredicates:v12]);
  v42 = @"count";
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v42, 1LL));
  v41 = @"DESC";
  v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v41, 1LL));
  v40 = @"pid";
  v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v40, 1LL));
  v29 = (void *)objc_claimAutoreleasedReturnValue( [a1 queryWithDatabase:v33 predicate:v25 orderingProperties:v26 orderingDirections:v27 limit:0 groupingProperties:v28]);

  v39[0] = @"world_region_mapping.world_region_pid";
  v39[1] = @"COUNT(*) as count";
  v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v39, 2LL));
  v31 = (void *)objc_claimAutoreleasedReturnValue([a1 regionsFromQuery:v29 additionalProperties:v30]);

  return v31;
}

+ (BOOL)hasMultipleRegionsOfType:(unint64_t)a3 localeIdentifier:(id)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  id v11 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForType:a3]);
  -[NSMutableArray addObject:](v10, "addObject:", v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForLocalizedContent]);
  -[NSMutableArray addObject:](v10, "addObject:", v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForLocaleIdentifier:v9]);
  -[NSMutableArray addObject:](v10, "addObject:", v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v10));
  id v15 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v8 predicate:v14]);

  LOBYTE(v8) = (uint64_t)[v15 countOfEntities] > 1;
  return (char)v8;
}

+ (id)regionsOfType:(unint64_t)a3 localeIdentifier:(id)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  id v11 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForType:a3]);
  -[NSMutableArray addObject:](v10, "addObject:", v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForLocalizedContent]);
  -[NSMutableArray addObject:](v10, "addObject:", v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForLocaleIdentifier:v9]);
  -[NSMutableArray addObject:](v10, "addObject:", v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v10));
  id v15 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v8 predicate:v14]);

  id v16 = (void *)objc_claimAutoreleasedReturnValue([a1 regionsFromQuery:v15]);
  return v16;
}

+ (id)updateSingleRegion:(id)a3 inDatabase:(id)a4
{
  return _[a1 insertOrUpdateRegion:a3 single:1 inDatabase:a4];
}

+ (id)insertOrUpdateRegion:(id)a3 inDatabase:(id)a4
{
  return _[a1 insertOrUpdateRegion:a3 single:0 inDatabase:a4];
}

+ (id)insertOrUpdateRegion:(id)a3 single:(BOOL)a4 inDatabase:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v8 identifier]);
  if (!v10)
  {
    [v8 displayRegion];
    double v14 = v17;
    double v16 = v18;
    if (v6 && CLLocationCoordinate2DIsValid(*(CLLocationCoordinate2D *)&v17))
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForLatitude:v14]);
      v81[0] = v19;
      v20 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForLongitude:v16]);
      v81[1] = v20;
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_predicateForType:", objc_msgSend(v8, "type")));
      v81[2] = v21;
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v81, 3LL));
      v23 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v22));

      id v12 = (id)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v9 predicate:v23]);
    }

    else
    {
      id v12 = 0LL;
    }

+ (BOOL)hasRegionsMissingLocalizedContentForLocaleIdentifier:(id)a3 inDatabase:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v13 = 0LL;
  double v14 = &v13;
  uint64_t v15 = 0x2020000000LL;
  char v16 = 0;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_1002CB0D8;
  v10[3] = &unk_10063D460;
  id v7 = v5;
  id v11 = v7;
  id v12 = &v13;
  sub_1002CCDD0( (uint64_t)v6,  @"SELECT world_region.pid FROM world_region WHERE world_region.type != 2 EXCEPT SELECT world_region.pid FROM world_region JOIN world_region_localized_content AS lc ON lc.world_region_pid = world_region.pid WHERE world_region.type != 2 AND lc.locale_identifier = ? AND (lc.status == 1 OR (lc.status == 0 AND (world_region.abbreviation_code IS NULL AND lc.name IS NOT NULL) OR (world_region.abbreviation_code IS NOT NULL AND lc.name != world_region.abbreviation_code))) LIMIT ?",  1,  v10);
  char v8 = *((_BYTE *)v14 + 24);

  _Block_object_dispose(&v13, 8);
  return v8;
}

+ (id)regionsMissingLocalizedContentForLocaleIdentifier:(id)a3 inDatabase:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v13 = _NSConcreteStackBlock;
  uint64_t v14 = 3221225472LL;
  uint64_t v15 = sub_1002CB240;
  char v16 = &unk_100653770;
  id v17 = v6;
  double v18 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  id v19 = v7;
  id v20 = a1;
  id v8 = v7;
  id v9 = v18;
  id v10 = v6;
  sub_1002CCDD0( (uint64_t)v8,  @"SELECT world_region.pid FROM world_region WHERE world_region.type != 2 EXCEPT SELECT world_region.pid FROM world_region JOIN world_region_localized_content AS lc ON lc.world_region_pid = world_region.pid WHERE world_region.type != 2 AND lc.locale_identifier = ? AND (lc.status == 1 OR (lc.status == 0 AND (world_region.abbreviation_code IS NULL AND lc.name IS NOT NULL) OR (world_region.abbreviation_code IS NOT NULL AND lc.name != world_region.abbreviation_code)))",  1,  &v13);
  id v11 = -[NSMutableArray copy](v9, "copy", v13, v14, v15, v16);

  return v11;
}

+ (id)regionsForTransactionPID:(int64_t)a3 localeIdentifier:(id)a4 inDatabase:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  if (v8)
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a3));
    id v11 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForTransaction:v10]);
    v19[0] = v11;
    id v12 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForLocaleIdentifier:v8]);
    v19[1] = v12;
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v19, 2LL));
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v13));
  }

  else
  {
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a3));
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForTransaction:v15]);
  }

  char v16 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:a5 predicate:v14]);

  id v17 = (void *)objc_claimAutoreleasedReturnValue([a1 regionsFromQuery:v16]);
  return v17;
}

+ (id)regionWithIdentifier:(id)a3 localeIdentifier:(id)a4 inDatabase:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  if (v9)
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForLocaleIdentifier:v9]);
    -[NSMutableArray addObject:](v11, "addObject:", v12);
  }

  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForIdentifier:v8]);
  -[NSMutableArray addObject:](v11, "addObject:", v13);

  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v11));
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v10 predicate:v14]);

  char v16 = (void *)objc_claimAutoreleasedReturnValue([a1 regionsFromQuery:v15]);
  id v17 = (void *)objc_claimAutoreleasedReturnValue([v16 firstObject]);

  return v17;
}

+ (id)regionsFromQuery:(id)a3
{
  return [a1 regionsFromQuery:a3 additionalProperties:0];
}

+ (id)regionsFromQuery:(id)a3 additionalProperties:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v22[0] = @"type";
  v22[1] = @"latitude";
  v22[2] = @"longitude";
  v22[3] = @"latitude_delta";
  v22[4] = @"longitude_delta";
  v22[5] = @"abbreviation_code";
  v22[6] = @"world_region_localized_content.name";
  v22[7] = @"world_region_localized_content.locale_identifier";
  v22[8] = @"identifier";
  v22[9] = @"parent_pid";
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v22, 10LL));
  if ([v7 count])
  {
    uint64_t v9 = objc_claimAutoreleasedReturnValue([v8 arrayByAddingObjectsFromArray:v7]);

    id v8 = (void *)v9;
  }

  uint64_t v15 = _NSConcreteStackBlock;
  uint64_t v16 = 3221225472LL;
  id v17 = sub_1002CB7BC;
  double v18 = &unk_100639BF0;
  id v20 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  id v21 = a1;
  id v19 = v6;
  id v10 = v20;
  id v11 = v6;
  [v11 enumeratePersistentIDsAndProperties:v8 usingBlock:&v15];
  if (-[NSMutableArray count](v10, "count", v15, v16, v17, v18)) {
    id v12 = v10;
  }
  else {
    id v12 = 0LL;
  }
  uint64_t v13 = v12;

  return v13;
}

+ (id)lastRegionErrorForTransaction:(id)a3 inDatabase:(id)a4
{
  id v5 = a4;
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[WorldRegionMapping errorForTransactionPID:inDatabase:]( WorldRegionMapping,  "errorForTransactionPID:inDatabase:",  [a3 persistentID],  v5));

  return v6;
}

+ (void)associateTransaction:(id)a3 withWorldRegion:(id)a4 inDatabase:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  +[WorldRegionMapping insertMatchForWorldRegion:transactionPID:inDatabase:]( WorldRegionMapping,  "insertMatchForWorldRegion:transactionPID:inDatabase:",  v8,  [a3 persistentID],  v7);
}

+ (void)failedToAssociateTransaction:(id)a3 error:(id)a4 inDatabase:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  +[WorldRegionMapping increaseFailureCountForTransactionPID:error:inDatabase:]( WorldRegionMapping,  "increaseFailureCountForTransactionPID:error:inDatabase:",  [a3 persistentID],  v8,  v7);
}

+ (void)deleteAllRegionsInDatabase:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[SQLiteBooleanPredicate truePredicate](&OBJC_CLASS___SQLiteBooleanPredicate, "truePredicate"));
  id v6 = (id)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v4 predicate:v5]);

  [v6 deleteAllEntities];
}

+ (void)resetCoordinatesForAllRegionsInDatabase:(id)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_1002CBC6C;
  v3[3] = &unk_100653790;
  CLLocationCoordinate2D v4 = kCLLocationCoordinate2DInvalid;
  sub_1002CCDBC((uint64_t)a3, @"UPDATE world_region SET latitude=?, longitude=?", v3);
}

+ (void)deleteRegionsWithNoMatchingTransactionsInDatabase:(id)a3
{
  sub_1002CCA50( (BOOL)a3,  @"DELETE FROM world_region WHERE pid IN (SELECT world_region.pid from world_region LEFT JOIN world_region AS world_region2 ON world_region.pid = world_region2.parent_pid LEFT JOIN world_region_mapping AS map ON map.world_region_pid = world_region.pid WHERE world_region2.pid IS NULL AND map.pid IS NULL)");
}

+ (void)addJoinClausesForProperty:(id)a3 toJoins:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = (__CFString *)v5;
  v22 = v7;
  if (v7 == @"world_region_localized_content.name") {
    goto LABEL_8;
  }
  if (v7)
  {
    unsigned __int8 v8 = -[__CFString isEqualToString:]( v7,  "isEqualToString:",  @"world_region_localized_content.name");

    if ((v8 & 1) != 0) {
      goto LABEL_8;
    }
    uint64_t v9 = v22;
    if (v9 == @"world_region_localized_content.locale_identifier"
      || (id v10 = v9,
          unsigned __int8 v11 = -[__CFString isEqualToString:]( v9,  "isEqualToString:",  @"world_region_localized_content.locale_identifier"),  v10,  (v11 & 1) != 0)
      || (id v12 = v10, v12 == @"world_region_localized_content.status")
      || (uint64_t v13 = v12,
          unsigned __int8 v14 = -[__CFString isEqualToString:]( v12,  "isEqualToString:",  @"world_region_localized_content.status"),  v13,  (v14 & 1) != 0))
    {
LABEL_8:
      uint64_t v15 = @"JOIN world_region_localized_content ON world_region_localized_content.world_region_pid = world_region.pid";
LABEL_9:
      [v6 addObject:v15];
      goto LABEL_10;
    }

    uint64_t v16 = v13;
    if (v16 == @"world_region_mapping.payment_transaction_pid"
      || (id v17 = v16,
          unsigned __int8 v18 = -[__CFString isEqualToString:]( v16,  "isEqualToString:",  @"world_region_mapping.payment_transaction_pid"),  v17,  (v18 & 1) != 0))
    {
      uint64_t v15 = @"JOIN world_region_mapping ON world_region_mapping.world_region_pid = world_region.pid";
      goto LABEL_9;
    }

    id v19 = v17;
    if (v19 == @"world_region_mapping.world_region_pid"
      || (id v20 = v19,
          unsigned int v21 = -[__CFString isEqualToString:]( v19,  "isEqualToString:",  @"world_region_mapping.world_region_pid"),  v20,  v21))
    {
      uint64_t v15 = @"LEFT JOIN world_region_mapping ON world_region_mapping.world_region_pid = world_region.pid";
      goto LABEL_9;
    }
  }

+ (id)disambiguatedSQLForProperty:(id)a3
{
  CLLocationCoordinate2D v4 = (__CFString *)a3;
  id v5 = v4;
  if (v4 == @"count"
    || v4
    && ((unsigned __int8 v6 = -[__CFString isEqualToString:](v4, "isEqualToString:", @"count"),
         v5,
         (v6 & 1) != 0)
     || (id v7 = v5, v7 == @"COUNT(*) as count")
     || (unsigned __int8 v8 = v7,
         unsigned int v9 = -[__CFString isEqualToString:](v7, "isEqualToString:", @"COUNT(*) as count"),
         v8,
         v9)))
  {
    id v10 = v5;
  }

  else
  {
    v14.receiver = a1;
    v14.super_class = (Class)&OBJC_METACLASS___WorldRegion;
    id v11 = objc_msgSendSuper2(&v14, "disambiguatedSQLForProperty:", v5);
    id v10 = (__CFString *)objc_claimAutoreleasedReturnValue(v11);
  }

  id v12 = v10;

  return v12;
}

+ (id)_predicateForIdentifier:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"identifier",  a3);
}

+ (id)_predicateForPID:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"pid",  a3);
}

+ (id)_predicateForParentPID:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"parent_pid",  a3);
}

+ (id)_predicateForMUID:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"muid",  a3);
}

+ (id)_predicateForType:(unint64_t)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a3));
  CLLocationCoordinate2D v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"type",  v3));

  return v4;
}

+ (id)_predicateForLatitude:(double)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", a3));
  CLLocationCoordinate2D v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"latitude",  v3));

  return v4;
}

+ (id)_predicateForLongitude:(double)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", a3));
  CLLocationCoordinate2D v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"longitude",  v3));

  return v4;
}

+ (id)_predicateForCode:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"abbreviation_code",  a3);
}

+ (id)_predicateForLocalizedContent
{
  return +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"world_region_localized_content.status",  &off_100690620);
}

+ (id)_predicateForName:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"world_region_localized_content.name",  a3);
}

+ (id)_predicateForNamePattern:(id)a3
{
  id v3 = a3;
  if ([v3 length])
  {
    CLLocationCoordinate2D v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@%%", v3));
    id v5 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteStringLikePredicate predicateWithProperty:matchingPattern:]( &OBJC_CLASS___SQLiteStringLikePredicate,  "predicateWithProperty:matchingPattern:",  @"world_region_localized_content.name",  v4));

    unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%% %@%%", v3));
    id v7 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteStringLikePredicate predicateWithProperty:matchingPattern:]( &OBJC_CLASS___SQLiteStringLikePredicate,  "predicateWithProperty:matchingPattern:",  @"world_region_localized_content.name",  v6));

    v11[0] = v5;
    v11[1] = v7;
    unsigned __int8 v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v11, 2LL));
    unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAnyPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAnyPredicates:",  v8));
  }

  else
  {
    unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue(+[SQLiteBooleanPredicate truePredicate](&OBJC_CLASS___SQLiteBooleanPredicate, "truePredicate"));
  }

  return v9;
}

+ (id)_predicateForLocaleIdentifier:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"world_region_localized_content.locale_identifier",  a3);
}

+ (id)_predicateForTransaction:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"world_region_mapping.payment_transaction_pid",  a3);
}

@end
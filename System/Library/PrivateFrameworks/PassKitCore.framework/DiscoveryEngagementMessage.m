@interface DiscoveryEngagementMessage
+ (DiscoveryEngagementMessage)engagementMessageWithIdentifier:(id)a3 inDatabase:(id)a4;
+ (id)_engagementMessagesInDatabase:(id)a3 matchingPredicate:(id)a4;
+ (id)_predicateForActiveEngagementMessagesWithPassQualifier:(int64_t)a3;
+ (id)_predicateForCheckingRelevantDate:(id)a3;
+ (id)_predicateForEngagementMessageIdentifier:(id)a3;
+ (id)_predicateForEngagementMessagesWithPassQualifier:(int64_t)a3;
+ (id)_propertySettersForEngagementMessage;
+ (id)databaseTable;
+ (id)engagementMessagesForPassQualifier:(int64_t)a3 active:(unint64_t)a4 relevantDate:(id)a5 inDatabase:(id)a6;
+ (id)insertOrUpdateEngagementMessage:(id)a3 messageOrder:(unint64_t)a4 inDatabase:(id)a5;
+ (id)updateEngagementMessage:(id)a3 inDatabase:(id)a4;
+ (void)deleteAllEngagementMessagesInDatabase:(id)a3;
+ (void)deleteEngagementMessageWithIdentifier:(id)a3 inDatabase:(id)a4;
+ (void)deleteEngagementMessagesNotIncludingIdentifiers:(id)a3 inDatabase:(id)a4;
- (BOOL)deleteFromDatabase;
- (DiscoveryEngagementMessage)initWithEngagementMessage:(id)a3 messageOrder:(unint64_t)a4 inDatabase:(id)a5;
- (id)_dictWithPropertiesForEngagementMessage:(id)a3;
- (id)engagementMessage;
- (int64_t)messageOrder;
- (void)setMessageOrder;
- (void)setMessageOrder:(int64_t)a3;
- (void)updateWithEngagementMessage:(id)a3;
@end

@implementation DiscoveryEngagementMessage

+ (id)databaseTable
{
  return @"papaya";
}

+ (id)engagementMessagesForPassQualifier:(int64_t)a3 active:(unint64_t)a4 relevantDate:(id)a5 inDatabase:(id)a6
{
  id v10 = a5;
  id v11 = a6;
  if (a4 != 2)
  {
    if (a4 == 1)
    {
      uint64_t v12 = objc_claimAutoreleasedReturnValue([a1 _predicateForActiveEngagementMessagesWithPassQualifier:a3]);
      goto LABEL_6;
    }

    if (a4)
    {
      v13 = 0LL;
      goto LABEL_8;
    }
  }

  uint64_t v12 = objc_claimAutoreleasedReturnValue([a1 _predicateForEngagementMessagesWithPassQualifier:a3]);
LABEL_6:
  v13 = (void *)v12;
LABEL_8:
  v19[0] = v13;
  v14 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForCheckingRelevantDate:v10]);
  v19[1] = v14;
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v19, 2LL));
  v16 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v15));

  v17 = (void *)objc_claimAutoreleasedReturnValue([a1 _engagementMessagesInDatabase:v11 matchingPredicate:v16]);
  return v17;
}

+ (DiscoveryEngagementMessage)engagementMessageWithIdentifier:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForEngagementMessageIdentifier:a3]);
  v8 = (void *)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v6 predicate:v7]);

  [v8 setMessageOrder];
  return (DiscoveryEngagementMessage *)v8;
}

+ (id)_engagementMessagesInDatabase:(id)a3 matchingPredicate:(id)a4
{
  id v6 = a3;
  v20 = @"m";
  id v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v20, 1LL));
  v9 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v7 orderingProperties:v8]);

  id v10 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  v19 = @"pid";
  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v19, 1LL));
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_100014658;
  v16[3] = &unk_100639E18;
  id v17 = v6;
  v18 = v10;
  uint64_t v12 = v10;
  id v13 = v6;
  [v9 enumeratePersistentIDsAndProperties:v11 usingBlock:v16];

  id v14 = -[NSMutableArray copy](v12, "copy");
  return v14;
}

+ (id)insertOrUpdateEngagementMessage:(id)a3 messageOrder:(unint64_t)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 identifier]);
  id v11 = (id)objc_claimAutoreleasedReturnValue([a1 engagementMessageWithIdentifier:v10 inDatabase:v8]);

  if (v11)
  {
    [v11 setMessageOrder:a4];
    [v11 updateWithEngagementMessage:v9];
  }

  else
  {
    id v11 = [objc_alloc((Class)a1) initWithEngagementMessage:v9 messageOrder:a4 inDatabase:v8];
  }

  return v11;
}

- (DiscoveryEngagementMessage)initWithEngagementMessage:(id)a3 messageOrder:(unint64_t)a4 inDatabase:(id)a5
{
  self->_messageOrder = a4;
  id v7 = a5;
  id v8 = (void *)objc_claimAutoreleasedReturnValue( -[DiscoveryEngagementMessage _dictWithPropertiesForEngagementMessage:]( self,  "_dictWithPropertiesForEngagementMessage:",  a3));
  id v9 = -[SQLiteEntity initWithPropertyValues:inDatabase:](self, "initWithPropertyValues:inDatabase:", v8, v7);

  return v9;
}

- (id)engagementMessage
{
  v3 = objc_alloc_init(&OBJC_CLASS___PKDiscoveryEngagementMessage);
  id v4 = objc_alloc_init(&OBJC_CLASS___PKDiscoveryEngagementMessageAction);
  -[PKDiscoveryEngagementMessage setAction:](v3, "setAction:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[DiscoveryEngagementMessage _propertySettersForEngagementMessage]( &OBJC_CLASS___DiscoveryEngagementMessage,  "_propertySettersForEngagementMessage"));
  id v6 = objc_alloc(&OBJC_CLASS___NSMutableArray);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 allKeys]);
  id v8 = -[NSMutableArray initWithArray:](v6, "initWithArray:", v7);

  -[NSMutableArray addObject:](v8, "addObject:", @"n");
  -[NSMutableArray addObject:](v8, "addObject:", @"o");
  id v9 = -[NSMutableArray copy](v8, "copy");
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_100014940;
  v15[3] = &unk_100639EE8;
  id v16 = v5;
  id v10 = v3;
  id v17 = v10;
  id v11 = v5;
  -[SQLiteEntity getValuesForProperties:withApplier:](self, "getValuesForProperties:withApplier:", v9, v15);

  uint64_t v12 = v17;
  id v13 = v10;

  return v13;
}

+ (id)updateEngagementMessage:(id)a3 inDatabase:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 identifier]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([a1 engagementMessageWithIdentifier:v8 inDatabase:v7]);

  if (v9) {
    [v9 updateWithEngagementMessage:v6];
  }

  return v9;
}

- (void)updateWithEngagementMessage:(id)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue( -[DiscoveryEngagementMessage _dictWithPropertiesForEngagementMessage:]( self,  "_dictWithPropertiesForEngagementMessage:",  a3));
  -[SQLiteEntity setValuesWithDictionary:](self, "setValuesWithDictionary:", v4);
}

+ (void)deleteEngagementMessageWithIdentifier:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForEngagementMessageIdentifier:a3]);
  id v8 = (id)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v7]);

  [v8 deleteAllEntities];
}

+ (void)deleteEngagementMessagesNotIncludingIdentifiers:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v8 = (id)objc_claimAutoreleasedReturnValue( +[SQLiteContainsPredicate doesNotContainPredicateWithProperty:values:]( &OBJC_CLASS___SQLiteContainsPredicate,  "doesNotContainPredicateWithProperty:values:",  @"a",  a3));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v8]);

  [v7 deleteAllEntities];
}

+ (void)deleteAllEngagementMessagesInDatabase:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[SQLiteBooleanPredicate truePredicate](&OBJC_CLASS___SQLiteBooleanPredicate, "truePredicate"));
  id v6 = (id)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v4 predicate:v5]);

  [v6 deleteAllEntities];
}

- (BOOL)deleteFromDatabase
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___DiscoveryEngagementMessage;
  return -[SQLiteEntity deleteFromDatabase](&v3, "deleteFromDatabase");
}

+ (id)_predicateForEngagementMessageIdentifier:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"a",  a3);
}

+ (id)_predicateForEngagementMessagesWithPassQualifier:(int64_t)a3
{
  if ((unint64_t)a3 >= 3)
  {
    if (a3 == 3) {
      id v4 = (void *)objc_claimAutoreleasedReturnValue(+[SQLiteBooleanPredicate truePredicate](&OBJC_CLASS___SQLiteBooleanPredicate, "truePredicate"));
    }
    else {
      id v4 = 0LL;
    }
  }

  else
  {
    objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:"));
    id v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"f",  v3));
  }

  return v4;
}

+ (id)_predicateForActiveEngagementMessagesWithPassQualifier:(int64_t)a3
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForEngagementMessagesWithPassQualifier:a3]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"c",  &off_10068FA08));
  v8[0] = v4;
  v8[1] = v3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v8, 2LL));
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v5));

  return v6;
}

+ (id)_predicateForCheckingRelevantDate:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    id v16 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteNullPredicate isNullPredicateWithProperty:]( &OBJC_CLASS___SQLiteNullPredicate,  "isNullPredicateWithProperty:",  @"n"));
    id v4 = (void *)_SQLValueForDate(v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:lessThanOrEqualToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:lessThanOrEqualToValue:",  @"n",  v4));

    v19[0] = v16;
    v19[1] = v5;
    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v19, 2LL));
    id v7 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAnyPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAnyPredicates:",  v6));

    id v8 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteNullPredicate isNullPredicateWithProperty:]( &OBJC_CLASS___SQLiteNullPredicate,  "isNullPredicateWithProperty:",  @"o"));
    id v9 = (void *)_SQLValueForDate(v3);
    id v10 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:greaterThanOrEqualToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:greaterThanOrEqualToValue:",  @"o",  v9));

    v18[0] = v8;
    v18[1] = v10;
    id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v18, 2LL));
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAnyPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAnyPredicates:",  v11));

    v17[0] = v7;
    v17[1] = v12;
    id v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v17, 2LL));
    id v14 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v13));
  }

  else
  {
    id v14 = (void *)objc_claimAutoreleasedReturnValue(+[SQLiteBooleanPredicate truePredicate](&OBJC_CLASS___SQLiteBooleanPredicate, "truePredicate"));
  }

  return v14;
}

+ (id)_propertySettersForEngagementMessage
{
  v3[0] = @"a";
  v3[1] = @"b";
  v4[0] = &stru_100639F28;
  v4[1] = &stru_100639F48;
  v3[2] = @"d";
  v3[3] = @"e";
  v4[2] = &stru_100639F68;
  v4[3] = &stru_100639F88;
  v3[4] = @"f";
  v3[5] = @"g";
  v4[4] = &stru_100639FA8;
  v4[5] = &stru_100639FC8;
  v3[6] = @"h";
  v3[7] = @"i";
  v4[6] = &stru_100639FE8;
  v4[7] = &stru_10063A008;
  v3[8] = @"j";
  v3[9] = @"k";
  v4[8] = &stru_10063A028;
  v4[9] = &stru_10063A048;
  v3[10] = @"l";
  v3[11] = @"c";
  v4[10] = &stru_10063A068;
  v4[11] = &stru_10063A088;
  v3[12] = @"p";
  v3[13] = @"q";
  v4[12] = &stru_10063A0A8;
  v4[13] = &stru_10063A0C8;
  v3[14] = @"r";
  v3[15] = @"s";
  v4[14] = &stru_10063A0E8;
  v4[15] = &stru_10063A108;
  v3[16] = @"t";
  v4[16] = &stru_10063A128;
  return (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v4,  v3,  17LL));
}

- (id)_dictWithPropertiesForEngagementMessage:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);
  [v5 setObjectOrNull:v6 forKey:@"a"];

  objc_msgSend(v5, "setInteger:forKey:", objc_msgSend(v4, "version"), @"b");
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 ruleIdentifier]);
  [v5 setObjectOrNull:v7 forKey:@"d"];

  id v8 = (void *)objc_claimAutoreleasedReturnValue([v4 osVersionRange]);
  id v9 = (void *)_SQLValueForOSVersionRequirementRange();
  [v5 setObjectOrNull:v9 forKey:@"e"];

  objc_msgSend(v5, "setInteger:forKey:", objc_msgSend(v4, "passQualifier"), @"f");
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v4 titleKey]);
  [v5 setObjectOrNull:v10 forKey:@"g"];

  id v11 = (void *)objc_claimAutoreleasedReturnValue([v4 messageKey]);
  [v5 setObjectOrNull:v11 forKey:@"h"];

  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v4 action]);
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 titleKey]);
  [v5 setObjectOrNull:v13 forKey:@"i"];

  id v14 = (void *)objc_claimAutoreleasedReturnValue([v4 action]);
  objc_msgSend(v5, "setInteger:forKey:", objc_msgSend(v14, "type"), @"j");

  v15 = (void *)objc_claimAutoreleasedReturnValue([v4 iconURLs]);
  id v16 = _SQLValueForActionIconURLs(v15);
  id v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
  [v5 setObjectOrNull:v17 forKey:@"k"];

  v18 = (void *)objc_claimAutoreleasedReturnValue([v4 action]);
  v19 = (void *)objc_claimAutoreleasedReturnValue([v18 actionInfo]);
  id v20 = _SQLValueForActionInfo(v19);
  v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
  [v5 setObjectOrNull:v21 forKey:@"l"];

  objc_msgSend(v5, "setInteger:forKey:", objc_msgSend(v4, "status"), @"c");
  [v5 setInteger:self->_messageOrder forKey:@"m"];
  v22 = (void *)objc_claimAutoreleasedReturnValue([v4 relevantDateRange]);
  v23 = (void *)objc_claimAutoreleasedReturnValue([v22 startDate]);
  v24 = (void *)_SQLValueForDate(v23);
  [v5 setObjectOrNull:v24 forKey:@"n"];

  v25 = (void *)objc_claimAutoreleasedReturnValue([v4 relevantDateRange]);
  v26 = (void *)objc_claimAutoreleasedReturnValue([v25 endDate]);
  v27 = (void *)_SQLValueForDate(v26);
  [v5 setObjectOrNull:v27 forKey:@"o"];

  objc_msgSend(v5, "setInteger:forKey:", objc_msgSend(v4, "viewCount"), @"p");
  objc_msgSend(v5, "setBool:forKey:", objc_msgSend(v4, "canReportIdentifierToAggd"), @"q");
  objc_msgSend(v5, "setInteger:forKey:", objc_msgSend(v4, "maxViewCount"), @"r");
  objc_msgSend(v5, "setInteger:forKey:", objc_msgSend(v4, "type"), @"s");
  v28 = (void *)objc_claimAutoreleasedReturnValue([v4 hardwareVersionRange]);

  v29 = (void *)_SQLValueForHardwareVersionRange(v28);
  [v5 setObjectOrNull:v29 forKey:@"t"];

  return v5;
}

- (void)setMessageOrder
{
  id v9 = @"m";
  id v10 = &stru_10063A168;
  id v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v10,  &v9,  1LL));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 allKeys]);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_100015BDC;
  v6[3] = &unk_100639EE8;
  id v7 = v3;
  id v8 = self;
  id v5 = v3;
  -[SQLiteEntity getValuesForProperties:withApplier:](self, "getValuesForProperties:withApplier:", v4, v6);
}

- (int64_t)messageOrder
{
  return self->_messageOrder;
}

- (void)setMessageOrder:(int64_t)a3
{
  self->_messageOrder = a3;
}

@end
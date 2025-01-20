@interface DiscoveryItem
+ (BOOL)activeItemRequiringBadgeExistsForRelevantDate:(id)a3 inDatabase:(id)a4;
+ (DiscoveryItem)itemWithIdentifier:(id)a3 inDatabase:(id)a4;
+ (id)_predicateDismissedItems;
+ (id)_predicateForActiveOrActionedAndRelevantItems:(id)a3;
+ (id)_predicateForActiveOrActionedItems;
+ (id)_predicateForActiveOrActionedRelevantItemsRequiringBadge:(id)a3;
+ (id)_predicateForCheckingRelevantDate:(id)a3;
+ (id)_predicateForEntitledToForceLargeCard;
+ (id)_predicateForItemIdentifier:(id)a3;
+ (id)_predicateForItemsWaitinForTrigger;
+ (id)_predicateForNonTerminalItems;
+ (id)_predicateForShouldBadge;
+ (id)_predicateForViewCount:(int64_t)a3;
+ (id)_propertySettersForAccount;
+ (id)activeItemIdentifiersWithRelevantDate:(id)a3 inDatabase:(id)a4;
+ (id)activeItemsRequiringBadgingForRelevantDate:(id)a3 inDatabase:(id)a4;
+ (id)activeItemsWithRelevantDate:(id)a3 inDatabase:(id)a4;
+ (id)databaseTable;
+ (id)discoveryItemsMatchingQuery:(id)a3 inDatabase:(id)a4;
+ (id)dismissedDiscoveryItemsInDatabase:(id)a3;
+ (id)insertOrUpdateItem:(id)a3 itemOrder:(unint64_t)a4 inDatabase:(id)a5;
+ (id)itemsInDatabase:(id)a3;
+ (id)itemsWaitingForTriggerInDatabase:(id)a3;
+ (id)itemsWithRelevantDate:(id)a3 inDatabase:(id)a4;
+ (id)nonTerminalItemIdentifiersInDatabase:(id)a3;
+ (id)orderedQueryWithPredicate:(id)a3 inDatabase:(id)a4;
+ (id)updateItem:(id)a3 inDatabse:(id)a4;
+ (void)deleteAllItemsInDatabase:(id)a3;
+ (void)deleteItemWithIdentifier:(id)a3 inDatabase:(id)a4;
+ (void)deleteItemsNotIncludingIdentifiers:(id)a3 inDatabase:(id)a4;
- (DiscoveryItem)initWithItem:(id)a3 itemOrder:(unint64_t)a4 inDatabase:(id)a5;
- (id)item;
- (unint64_t)itemOrder;
- (void)setItemOrder;
- (void)setItemOrder:(unint64_t)a3;
- (void)updateWithItem:(id)a3;
@end

@implementation DiscoveryItem

+ (id)databaseTable
{
  return @"discovery_item";
}

+ (id)itemsInDatabase:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[SQLiteBooleanPredicate truePredicate](&OBJC_CLASS___SQLiteBooleanPredicate, "truePredicate"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([a1 orderedQueryWithPredicate:v5 inDatabase:v4]);

  v7 = (void *)objc_claimAutoreleasedReturnValue([a1 discoveryItemsMatchingQuery:v6 inDatabase:v4]);
  return v7;
}

+ (id)itemsWithRelevantDate:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForCheckingRelevantDate:a3]);
  v8 = (void *)objc_claimAutoreleasedReturnValue([a1 orderedQueryWithPredicate:v7 inDatabase:v6]);

  v9 = (void *)objc_claimAutoreleasedReturnValue([a1 discoveryItemsMatchingQuery:v8 inDatabase:v6]);
  return v9;
}

+ (id)activeItemsWithRelevantDate:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForActiveOrActionedAndRelevantItems:a3]);
  v8 = (void *)objc_claimAutoreleasedReturnValue([a1 orderedQueryWithPredicate:v7 inDatabase:v6]);

  v9 = (void *)objc_claimAutoreleasedReturnValue([a1 discoveryItemsMatchingQuery:v8 inDatabase:v6]);
  return v9;
}

+ (id)dismissedDiscoveryItemsInDatabase:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateDismissedItems]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([a1 orderedQueryWithPredicate:v5 inDatabase:v4]);

  v7 = (void *)objc_claimAutoreleasedReturnValue([a1 discoveryItemsMatchingQuery:v6 inDatabase:v4]);
  return v7;
}

+ (id)activeItemsRequiringBadgingForRelevantDate:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForActiveOrActionedRelevantItemsRequiringBadge:a3]);
  v8 = (void *)objc_claimAutoreleasedReturnValue([a1 orderedQueryWithPredicate:v7 inDatabase:v6]);

  v9 = (void *)objc_claimAutoreleasedReturnValue([a1 discoveryItemsMatchingQuery:v8 inDatabase:v6]);
  return v9;
}

+ (id)itemsWaitingForTriggerInDatabase:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForItemsWaitinForTrigger]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([a1 orderedQueryWithPredicate:v5 inDatabase:v4]);

  v7 = (void *)objc_claimAutoreleasedReturnValue([a1 discoveryItemsMatchingQuery:v6 inDatabase:v4]);
  return v7;
}

+ (id)orderedQueryWithPredicate:(id)a3 inDatabase:(id)a4
{
  v13[0] = @"priority";
  v13[1] = @"item_order";
  id v6 = a4;
  id v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v13, 2LL));
  v12[0] = @"DESC";
  v12[1] = @"ASC";
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v12, 2LL));
  v10 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v7 orderingProperties:v8 orderingDirections:v9]);

  return v10;
}

+ (id)discoveryItemsMatchingQuery:(id)a3 inDatabase:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  v19 = @"pid";
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v19, 1LL));
  v13 = _NSConcreteStackBlock;
  uint64_t v14 = 3221225472LL;
  v15 = sub_1001B7168;
  v16 = &unk_100639E18;
  id v17 = v5;
  v18 = v7;
  v9 = v7;
  id v10 = v5;
  [v6 enumeratePersistentIDsAndProperties:v8 usingBlock:&v13];

  id v11 = -[NSMutableArray copy](v9, "copy", v13, v14, v15, v16);
  return v11;
}

+ (BOOL)activeItemRequiringBadgeExistsForRelevantDate:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForActiveOrActionedRelevantItemsRequiringBadge:a3]);
  v8 = (void *)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v6 predicate:v7]);

  return v8 != 0LL;
}

+ (id)activeItemIdentifiersWithRelevantDate:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForActiveOrActionedAndRelevantItems:a3]);
  v8 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v7]);

  v9 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  v21 = @"pid";
  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v21, 1LL));
  v15 = _NSConcreteStackBlock;
  uint64_t v16 = 3221225472LL;
  id v17 = sub_1001B7398;
  v18 = &unk_100639E18;
  id v19 = v6;
  v20 = v9;
  id v11 = v9;
  id v12 = v6;
  [v8 enumeratePersistentIDsAndProperties:v10 usingBlock:&v15];

  id v13 = -[NSMutableSet copy](v11, "copy", v15, v16, v17, v18);
  return v13;
}

+ (id)nonTerminalItemIdentifiersInDatabase:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForNonTerminalItems]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v4 predicate:v5]);

  id v7 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  v17[0] = @"pid";
  v17[1] = @"identifier";
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v17, 2LL));
  id v12 = _NSConcreteStackBlock;
  uint64_t v13 = 3221225472LL;
  uint64_t v14 = sub_1001B7540;
  v15 = &unk_10063C0D0;
  uint64_t v16 = v7;
  v9 = v7;
  [v6 enumeratePersistentIDsAndProperties:v8 usingBlock:&v12];

  id v10 = -[NSMutableSet copy](v9, "copy", v12, v13, v14, v15);
  return v10;
}

+ (DiscoveryItem)itemWithIdentifier:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForItemIdentifier:a3]);
  v8 = (void *)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v6 predicate:v7]);

  return (DiscoveryItem *)v8;
}

+ (id)insertOrUpdateItem:(id)a3 itemOrder:(unint64_t)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 identifier]);
  id v11 = (id)objc_claimAutoreleasedReturnValue([a1 itemWithIdentifier:v10 inDatabase:v8]);

  if (v11)
  {
    [v11 setItemOrder:a4];
    [v11 updateWithItem:v9];
  }

  else
  {
    id v11 = [objc_alloc((Class)a1) initWithItem:v9 itemOrder:a4 inDatabase:v8];
  }

  return v11;
}

- (DiscoveryItem)initWithItem:(id)a3 itemOrder:(unint64_t)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  self->_itemOrder = a4;
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v9 identifier]);
  [v10 setObjectOrNull:v11 forKey:@"identifier"];

  objc_msgSend(v10, "setInteger:forKey:", objc_msgSend(v9, "version"), @"version");
  objc_msgSend(v10, "setInteger:forKey:", objc_msgSend(v9, "status"), @"status");
  objc_msgSend(v10, "setInteger:forKey:", objc_msgSend(v9, "type"), @"type");
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v9 ruleIdentifier]);
  [v10 setObjectOrNull:v12 forKey:@"rule_identifier"];

  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v9 triggerRuleIdentifier]);
  [v10 setObjectOrNull:v13 forKey:@"trigger_rule_identifier"];

  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v9 layoutBundleURL]);
  v15 = (void *)_SQLValueForURL(v14);
  [v10 setObjectOrNull:v15 forKey:@"layout_url"];

  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v9 supportedLocalizations]);
  id v17 = _SQLValueForSupportedLocalizations(v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
  [v10 setObjectOrNull:v18 forKey:@"supported_localizations"];

  id v19 = (void *)objc_claimAutoreleasedReturnValue([v9 osVersionRange]);
  v20 = (void *)_SQLValueForOSVersionRequirementRange(v19);
  [v10 setObjectOrNull:v20 forKey:@"os_version_requirement_range"];

  v21 = (void *)objc_claimAutoreleasedReturnValue([v9 hardwareVersionRange]);
  v22 = (void *)_SQLValueForHardwareVersionRange(v21);
  [v10 setObjectOrNull:v22 forKey:@"hardware_version_range"];

  v23 = (void *)objc_claimAutoreleasedReturnValue([v9 relevantDateRange]);
  v24 = (void *)objc_claimAutoreleasedReturnValue([v23 startDate]);
  v25 = (void *)_SQLValueForDate(v24);
  [v10 setObjectOrNull:v25 forKey:@"relevant_date_range_start_date"];

  v26 = (void *)objc_claimAutoreleasedReturnValue([v9 relevantDateRange]);
  v27 = (void *)objc_claimAutoreleasedReturnValue([v26 endDate]);
  v28 = (void *)_SQLValueForDate(v27);
  [v10 setObjectOrNull:v28 forKey:@"relevant_date_range_end_date"];

  [v10 setInteger:self->_itemOrder forKey:@"item_order"];
  objc_msgSend(v10, "setInteger:forKey:", objc_msgSend(v9, "viewCount"), @"view_count");
  objc_msgSend(v10, "setInteger:forKey:", objc_msgSend(v9, "maxViewCount"), @"max_view_count");
  objc_msgSend(v10, "setInteger:forKey:", objc_msgSend(v9, "maxViewCountLargeCard"), @"max_view_count_large_card");
  objc_msgSend(v10, "setBool:forKey:", objc_msgSend(v9, "shouldBadge"), @"should_badge");
  objc_msgSend(v10, "setInteger:forKey:", objc_msgSend(v9, "priority"), @"priority");
  objc_msgSend( v10,  "setBool:forKey:",  objc_msgSend(v9, "entitledToForceLargeCard"),  @"entitled_to_force_large_card");
  v29 = (void *)objc_claimAutoreleasedReturnValue([v9 clientData]);

  [v10 setObjectOrNull:v29 forKey:@"clientData"];
  v30 = -[SQLiteEntity initWithPropertyValues:inDatabase:](self, "initWithPropertyValues:inDatabase:", v10, v8);

  return v30;
}

+ (id)updateItem:(id)a3 inDatabse:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 identifier]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([a1 itemWithIdentifier:v8 inDatabase:v7]);

  if (v9) {
    [v9 updateWithItem:v6];
  }

  return v9;
}

- (void)updateWithItem:(id)a3
{
  id v4 = a3;
  id v24 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);
  [v24 setObjectOrNull:v5 forKey:@"identifier"];

  objc_msgSend(v24, "setInteger:forKey:", objc_msgSend(v4, "version"), @"version");
  objc_msgSend(v24, "setInteger:forKey:", objc_msgSend(v4, "status"), @"status");
  objc_msgSend(v24, "setInteger:forKey:", objc_msgSend(v4, "type"), @"type");
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 ruleIdentifier]);
  [v24 setObjectOrNull:v6 forKey:@"rule_identifier"];

  id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 triggerRuleIdentifier]);
  [v24 setObjectOrNull:v7 forKey:@"trigger_rule_identifier"];

  id v8 = (void *)objc_claimAutoreleasedReturnValue([v4 layoutBundleURL]);
  id v9 = (void *)_SQLValueForURL(v8);
  [v24 setObjectOrNull:v9 forKey:@"layout_url"];

  id v10 = (void *)objc_claimAutoreleasedReturnValue([v4 supportedLocalizations]);
  id v11 = _SQLValueForSupportedLocalizations(v10);
  id v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  [v24 setObjectOrNull:v12 forKey:@"supported_localizations"];

  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v4 osVersionRange]);
  uint64_t v14 = (void *)_SQLValueForOSVersionRequirementRange(v13);
  [v24 setObjectOrNull:v14 forKey:@"os_version_requirement_range"];

  v15 = (void *)objc_claimAutoreleasedReturnValue([v4 hardwareVersionRange]);
  uint64_t v16 = (void *)_SQLValueForHardwareVersionRange(v15);
  [v24 setObjectOrNull:v16 forKey:@"hardware_version_range"];

  id v17 = (void *)objc_claimAutoreleasedReturnValue([v4 relevantDateRange]);
  v18 = (void *)objc_claimAutoreleasedReturnValue([v17 startDate]);
  id v19 = (void *)_SQLValueForDate(v18);
  [v24 setObjectOrNull:v19 forKey:@"relevant_date_range_start_date"];

  v20 = (void *)objc_claimAutoreleasedReturnValue([v4 relevantDateRange]);
  v21 = (void *)objc_claimAutoreleasedReturnValue([v20 endDate]);
  v22 = (void *)_SQLValueForDate(v21);
  [v24 setObjectOrNull:v22 forKey:@"relevant_date_range_end_date"];

  objc_msgSend(v24, "setInteger:forKey:", objc_msgSend(v4, "viewCount"), @"view_count");
  objc_msgSend(v24, "setInteger:forKey:", objc_msgSend(v4, "maxViewCount"), @"max_view_count");
  objc_msgSend(v24, "setInteger:forKey:", objc_msgSend(v4, "maxViewCountLargeCard"), @"max_view_count_large_card");
  objc_msgSend(v24, "setBool:forKey:", objc_msgSend(v4, "shouldBadge"), @"should_badge");
  objc_msgSend(v24, "setInteger:forKey:", objc_msgSend(v4, "priority"), @"priority");
  objc_msgSend( v24,  "setBool:forKey:",  objc_msgSend(v4, "entitledToForceLargeCard"),  @"entitled_to_force_large_card");
  v23 = (void *)objc_claimAutoreleasedReturnValue([v4 clientData]);

  [v24 setObjectOrNull:v23 forKey:@"clientData"];
  -[SQLiteEntity setValuesWithDictionary:](self, "setValuesWithDictionary:", v24);
}

- (id)item
{
  v3 = objc_alloc_init(&OBJC_CLASS___PKDiscoveryItem);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[DiscoveryItem _propertySettersForAccount](&OBJC_CLASS___DiscoveryItem, "_propertySettersForAccount"));
  id v5 = objc_alloc(&OBJC_CLASS___NSMutableArray);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 allKeys]);
  id v7 = -[NSMutableArray initWithArray:](v5, "initWithArray:", v6);

  -[NSMutableArray addObject:](v7, "addObject:", @"relevant_date_range_start_date");
  -[NSMutableArray addObject:](v7, "addObject:", @"relevant_date_range_end_date");
  id v8 = -[NSMutableArray copy](v7, "copy");
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_1001B7FA8;
  v14[3] = &unk_100639EE8;
  id v15 = v4;
  id v9 = v3;
  uint64_t v16 = v9;
  id v10 = v4;
  -[SQLiteEntity getValuesForProperties:withApplier:](self, "getValuesForProperties:withApplier:", v8, v14);

  id v11 = v16;
  id v12 = v9;

  return v12;
}

+ (void)deleteItemWithIdentifier:(id)a3 inDatabase:(id)a4
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue([a1 itemWithIdentifier:a3 inDatabase:a4]);
  if (v4)
  {
    id v5 = v4;
    [v4 deleteFromDatabase];
    id v4 = v5;
  }
}

+ (void)deleteItemsNotIncludingIdentifiers:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v8 = (id)objc_claimAutoreleasedReturnValue( +[SQLiteContainsPredicate doesNotContainPredicateWithProperty:values:]( &OBJC_CLASS___SQLiteContainsPredicate,  "doesNotContainPredicateWithProperty:values:",  @"identifier",  a3));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v8]);

  [v7 deleteAllEntities];
}

+ (void)deleteAllItemsInDatabase:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[SQLiteBooleanPredicate truePredicate](&OBJC_CLASS___SQLiteBooleanPredicate, "truePredicate"));
  id v6 = (id)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v4 predicate:v5]);

  [v6 deleteAllEntities];
}

+ (id)_predicateForItemIdentifier:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"identifier",  a3);
}

+ (id)_predicateForActiveOrActionedAndRelevantItems:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForActiveOrActionedItems]);
  v10[0] = v5;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForCheckingRelevantDate:v4]);

  v10[1] = v6;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v10, 2LL));
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v7));

  return v8;
}

+ (id)_predicateForActiveOrActionedRelevantItemsRequiringBadge:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForActiveOrActionedItems]);
  v12[0] = v5;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForCheckingRelevantDate:v4]);

  v12[1] = v6;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForShouldBadge]);
  void v12[2] = v7;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForViewCount:0]);
  v12[3] = v8;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v12, 4LL));
  id v10 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v9));

  return v10;
}

+ (id)_predicateForActiveOrActionedItems
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"status",  &off_1006900F8));
  v7[0] = v2;
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"status",  &off_100690110));
  v7[1] = v3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v7, 2LL));
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAnyPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAnyPredicates:",  v4));

  return v5;
}

+ (id)_predicateDismissedItems
{
  return +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"status",  &off_100690128);
}

+ (id)_predicateForItemsWaitinForTrigger
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"status",  &off_100690140));
  id v6 = v2;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v6, 1LL));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAnyPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAnyPredicates:",  v3));

  return v4;
}

+ (id)_predicateForNonTerminalItems
{
  v2 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForActiveOrActionedItems]);
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"status",  &off_100690158,  v2));
  v8[1] = v3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"status",  &off_100690140));
  v8[2] = v4;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v8, 3LL));
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAnyPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAnyPredicates:",  v5));

  return v6;
}

+ (id)_predicateForCheckingRelevantDate:(id)a3
{
  return +[SQLiteBooleanPredicate truePredicate](&OBJC_CLASS___SQLiteBooleanPredicate, "truePredicate", a3);
}

+ (id)_predicateForShouldBadge
{
  return +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"should_badge",  &off_100690170);
}

+ (id)_predicateForEntitledToForceLargeCard
{
  return +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"entitled_to_force_large_card",  &off_100690170);
}

+ (id)_predicateForViewCount:(int64_t)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a3));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"view_count",  v3));

  return v4;
}

+ (id)_propertySettersForAccount
{
  v3[0] = @"identifier";
  v3[1] = @"version";
  v4[0] = &stru_10064A298;
  v4[1] = &stru_10064A2B8;
  v3[2] = @"type";
  v3[3] = @"status";
  v4[2] = &stru_10064A2D8;
  v4[3] = &stru_10064A2F8;
  v3[4] = @"rule_identifier";
  v3[5] = @"trigger_rule_identifier";
  v4[4] = &stru_10064A318;
  v4[5] = &stru_10064A338;
  v3[6] = @"layout_url";
  v3[7] = @"supported_localizations";
  v4[6] = &stru_10064A358;
  v4[7] = &stru_10064A378;
  v3[8] = @"os_version_requirement_range";
  v3[9] = @"hardware_version_range";
  v4[8] = &stru_10064A398;
  v4[9] = &stru_10064A3B8;
  v3[10] = @"view_count";
  v3[11] = @"max_view_count";
  v4[10] = &stru_10064A3D8;
  v4[11] = &stru_10064A3F8;
  v3[12] = @"max_view_count_large_card";
  v3[13] = @"should_badge";
  v4[12] = &stru_10064A418;
  v4[13] = &stru_10064A438;
  v3[14] = @"priority";
  v3[15] = @"entitled_to_force_large_card";
  v4[14] = &stru_10064A458;
  v4[15] = &stru_10064A478;
  v3[16] = @"clientData";
  v4[16] = &stru_10064A498;
  return (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v4,  v3,  17LL));
}

- (void)setItemOrder
{
  id v9 = @"item_order";
  id v10 = &stru_10064A4D8;
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v10,  &v9,  1LL));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 allKeys]);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_1001B8F28;
  v6[3] = &unk_100639EE8;
  id v7 = v3;
  id v8 = self;
  id v5 = v3;
  -[SQLiteEntity getValuesForProperties:withApplier:](self, "getValuesForProperties:withApplier:", v4, v6);
}

- (unint64_t)itemOrder
{
  return self->_itemOrder;
}

- (void)setItemOrder:(unint64_t)a3
{
  self->_itemOrder = a3;
}

@end
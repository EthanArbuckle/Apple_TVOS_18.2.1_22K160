@interface Rule
+ (id)_predicateForRuleIdentifier:(id)a3;
+ (id)_predicateForRuleIdentifiers:(id)a3;
+ (id)_propertySettersForRule;
+ (id)databaseTable;
+ (id)insertOrUpdateRule:(id)a3 inDatabase:(id)a4;
+ (id)ruleWithIdentifier:(id)a3 inDatabase:(id)a4;
+ (id)rulesInDatabase:(id)a3;
+ (id)rulesInDatabase:(id)a3 matchingRuleIdentifiers:(id)a4;
+ (void)deleteAllRulesInDatabase:(id)a3;
+ (void)deleteRuleWithIdentifier:(id)a3 inDatabase:(id)a4;
+ (void)deleteRulesNotIncludingIdentifiers:(id)a3 inDatabase:(id)a4;
- (Rule)initWithRule:(id)a3 inDatabase:(id)a4;
- (id)rule;
- (void)updateWithRule:(id)a3;
@end

@implementation Rule

+ (id)rulesInDatabase:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[SQLiteBooleanPredicate truePredicate](&OBJC_CLASS___SQLiteBooleanPredicate, "truePredicate"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v4 predicate:v5]);

  v7 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[Rule _propertySettersForRule](&OBJC_CLASS___Rule, "_propertySettersForRule"));
  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 allKeys]);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_1000EFB60;
  v14[3] = &unk_100639BF0;
  v16 = v7;
  id v17 = a1;
  id v15 = v8;
  v10 = v7;
  id v11 = v8;
  [v6 enumeratePersistentIDsAndProperties:v9 usingBlock:v14];
  id v12 = -[NSMutableSet copy](v10, "copy");

  return v12;
}

+ (id)rulesInDatabase:(id)a3 matchingRuleIdentifiers:(id)a4
{
  id v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForRuleIdentifiers:a4]);
  v8 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v7]);

  v9 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[Rule _propertySettersForRule](&OBJC_CLASS___Rule, "_propertySettersForRule"));
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 allKeys]);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_1000EFD08;
  v16[3] = &unk_100639BF0;
  v18 = v9;
  id v19 = a1;
  id v17 = v10;
  id v12 = v9;
  id v13 = v10;
  [v8 enumeratePersistentIDsAndProperties:v11 usingBlock:v16];
  id v14 = -[NSMutableSet copy](v12, "copy");

  return v14;
}

+ (id)ruleWithIdentifier:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForRuleIdentifier:a3]);
  v8 = (void *)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v6 predicate:v7]);

  return v8;
}

+ (id)insertOrUpdateRule:(id)a3 inDatabase:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue([v6 identifier]);
  id v9 = (id)objc_claimAutoreleasedReturnValue([a1 ruleWithIdentifier:v8 inDatabase:v7]);

  if (v9) {
    [v9 updateWithRule:v6];
  }
  else {
    id v9 = [objc_alloc((Class)a1) initWithRule:v6 inDatabase:v7];
  }

  return v9;
}

- (Rule)initWithRule:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 identifier]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v8, "setObjectOrNull:forKey:", v9, @"identifier");

  v10 = (void *)objc_claimAutoreleasedReturnValue([v7 predicateFormat]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v8, "setObjectOrNull:forKey:", v10, @"predicate_format");

  id v11 = (void *)objc_claimAutoreleasedReturnValue([v7 osVersionRequirementRange]);
  id v12 = (void *)_SQLValueForOSVersionRequirementRange(v11);
  -[NSMutableDictionary setObjectOrNull:forKey:]( v8,  "setObjectOrNull:forKey:",  v12,  @"os_version_requirement_range");

  id v13 = -[SQLiteEntity initWithPropertyValues:inDatabase:](self, "initWithPropertyValues:inDatabase:", v8, v6);
  id v14 = v13;

  return v14;
}

+ (void)deleteRuleWithIdentifier:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v8 = (id)objc_claimAutoreleasedReturnValue([a1 _predicateForRuleIdentifier:a3]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v8]);

  [v7 deleteAllEntities];
}

+ (void)deleteRulesNotIncludingIdentifiers:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v8 = (id)objc_claimAutoreleasedReturnValue( +[SQLiteContainsPredicate doesNotContainPredicateWithProperty:values:]( &OBJC_CLASS___SQLiteContainsPredicate,  "doesNotContainPredicateWithProperty:values:",  @"identifier",  a3));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v8]);

  [v7 deleteAllEntities];
}

+ (void)deleteAllRulesInDatabase:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[SQLiteBooleanPredicate truePredicate](&OBJC_CLASS___SQLiteBooleanPredicate, "truePredicate"));
  id v6 = (id)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v4 predicate:v5]);

  [v6 deleteAllEntities];
}

- (id)rule
{
  v3 = objc_alloc_init(&OBJC_CLASS___PKRule);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[Rule _propertySettersForRule](&OBJC_CLASS___Rule, "_propertySettersForRule"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 allKeys]);
  id v11 = _NSConcreteStackBlock;
  uint64_t v12 = 3221225472LL;
  id v13 = sub_1000F01FC;
  id v14 = &unk_100639EE8;
  id v15 = v4;
  id v6 = v3;
  v16 = v6;
  id v7 = v4;
  -[SQLiteEntity getValuesForProperties:withApplier:](self, "getValuesForProperties:withApplier:", v5, &v11);

  -[PKRule parsePredicateFormat](v6, "parsePredicateFormat", v11, v12, v13, v14);
  id v8 = v16;
  id v9 = v6;

  return v9;
}

- (void)updateWithRule:(id)a3
{
  id v4 = a3;
  id v9 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v9, "setObjectOrNull:forKey:", v5, @"identifier");

  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 predicateFormat]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v9, "setObjectOrNull:forKey:", v6, @"predicate_format");

  id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 osVersionRequirementRange]);
  id v8 = (void *)_SQLValueForOSVersionRequirementRange(v7);
  -[NSMutableDictionary setObjectOrNull:forKey:]( v9,  "setObjectOrNull:forKey:",  v8,  @"os_version_requirement_range");

  -[SQLiteEntity setValuesWithDictionary:](self, "setValuesWithDictionary:", v9);
}

+ (id)_predicateForRuleIdentifier:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"identifier",  a3);
}

+ (id)_predicateForRuleIdentifiers:(id)a3
{
  return +[SQLiteContainsPredicate containsPredicateWithProperty:values:]( &OBJC_CLASS___SQLiteContainsPredicate,  "containsPredicateWithProperty:values:",  @"identifier",  a3);
}

+ (id)_propertySettersForRule
{
  v3[0] = @"identifier";
  v3[1] = @"predicate_format";
  v4[0] = &stru_100643850;
  v4[1] = &stru_100643870;
  v3[2] = @"os_version_requirement_range";
  v4[2] = &stru_100643890;
  return (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v4,  v3,  3LL));
}

+ (id)databaseTable
{
  return @"rule";
}

@end
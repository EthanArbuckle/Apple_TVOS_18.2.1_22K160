@interface FeatureApplicationInvitationDetails
+ (id)_predicateForApplicationPID:(id)a3;
+ (id)_propertySettersForFeatureApplicationInvitationDetails;
+ (id)_propertyValuesForFeatureApplicationInvitationDetails:(id)a3;
+ (id)associationPropertyForEntityClass:(Class)a3;
+ (id)databaseTable;
+ (id)featureApplicationInvitationDetailsForApplicationPID:(id)a3 inDatabase:(id)a4;
+ (id)insertFeatureApplicationInvitationDetails:(id)a3 forApplicationPID:(id)a4 inDatabase:(id)a5;
+ (void)deleteFeatureApplicationInvitationDetailsForApplicationPID:(id)a3 inDatabase:(id)a4;
+ (void)updateFeatureApplicationInvitationDetails:(id)a3 forApplicationPID:(id)a4 inDatabase:(id)a5;
- (FeatureApplicationInvitationDetails)initWithFeatureApplicationInvitationDetails:(id)a3 forApplicationPID:(id)a4 inDatabase:(id)a5;
- (id)featureApplicationInvitationDetails;
- (void)updateWithFeatureApplicationInvitationDetails:(id)a3;
@end

@implementation FeatureApplicationInvitationDetails

+ (id)databaseTable
{
  return @"chestnut";
}

+ (id)associationPropertyForEntityClass:(Class)a3
{
  return @"a";
}

- (FeatureApplicationInvitationDetails)initWithFeatureApplicationInvitationDetails:(id)a3 forApplicationPID:(id)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v12 = objc_msgSend((id)objc_opt_class(self, v11), "_propertyValuesForFeatureApplicationInvitationDetails:", v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);

  id v14 = [v13 mutableCopy];
  [v14 setObjectOrNull:v9 forKey:@"a"];

  v15 = -[SQLiteEntity initWithPropertyValues:inDatabase:](self, "initWithPropertyValues:inDatabase:", v14, v8);
  return v15;
}

+ (id)insertFeatureApplicationInvitationDetails:(id)a3 forApplicationPID:(id)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [objc_alloc((Class)a1) initWithFeatureApplicationInvitationDetails:v10 forApplicationPID:v9 inDatabase:v8];

  return v11;
}

+ (void)deleteFeatureApplicationInvitationDetailsForApplicationPID:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v8 = (id)objc_claimAutoreleasedReturnValue([a1 _predicateForApplicationPID:a3]);
  v7 = (void *)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v6 predicate:v8]);

  [v7 deleteFromDatabase];
}

+ (id)featureApplicationInvitationDetailsForApplicationPID:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForApplicationPID:a3]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v6 predicate:v7]);

  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 featureApplicationInvitationDetails]);
  return v9;
}

+ (void)updateFeatureApplicationInvitationDetails:(id)a3 forApplicationPID:(id)a4 inDatabase:(id)a5
{
  id v13 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForApplicationPID:v8]);
  id v11 = (void *)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v9 predicate:v10]);

  if (v11) {
    [v11 updateWithFeatureApplicationInvitationDetails:v13];
  }
  else {
    id v12 = [a1 insertFeatureApplicationInvitationDetails:v13 forApplicationPID:v8 inDatabase:v9];
  }
}

- (void)updateWithFeatureApplicationInvitationDetails:(id)a3
{
  id v4 = a3;
  id v6 = objc_msgSend((id)objc_opt_class(self, v5), "_propertyValuesForFeatureApplicationInvitationDetails:", v4);
  id v7 = (id)objc_claimAutoreleasedReturnValue(v6);

  -[SQLiteEntity setValuesWithDictionary:](self, "setValuesWithDictionary:", v7);
}

+ (id)_predicateForApplicationPID:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"a",  a3);
}

+ (id)_propertyValuesForFeatureApplicationInvitationDetails:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v3 accountUserAltDSID]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v5, @"b");

  id v6 = (void *)objc_claimAutoreleasedReturnValue([v3 originatorAltDSID]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v6, @"c");

  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v3 accountUserAccessLevel]));
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v7, @"d");

  id v8 = (void *)objc_claimAutoreleasedReturnValue([v3 originatorFirstName]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v8, @"e");

  id v9 = (void *)objc_claimAutoreleasedReturnValue([v3 originatorLastName]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v9, @"f");

  id v10 = (void *)objc_claimAutoreleasedReturnValue([v3 accountUserFirstName]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v10, @"g");

  id v11 = (void *)objc_claimAutoreleasedReturnValue([v3 accountUserLastName]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v11, @"h");

  id v12 = -[NSMutableDictionary copy](v4, "copy");
  return v12;
}

+ (id)_propertySettersForFeatureApplicationInvitationDetails
{
  v3[0] = @"b";
  v3[1] = @"c";
  v4[0] = &stru_10063E668;
  v4[1] = &stru_10063E688;
  v3[2] = @"d";
  v3[3] = @"e";
  v4[2] = &stru_10063E6A8;
  v4[3] = &stru_10063E6C8;
  v3[4] = @"f";
  v3[5] = @"g";
  v4[4] = &stru_10063E6E8;
  v4[5] = &stru_10063E708;
  v3[6] = @"h";
  v4[6] = &stru_10063E728;
  return (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v4,  v3,  7LL));
}

- (id)featureApplicationInvitationDetails
{
  id v3 = objc_alloc_init(&OBJC_CLASS___PKFeatureApplicationInvitationDetails);
  id v5 = objc_msgSend((id)objc_opt_class(self, v4), "_propertySettersForFeatureApplicationInvitationDetails");
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 allKeys]);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_100085EA8;
  v13[3] = &unk_100638EF0;
  v13[4] = self;
  id v14 = v6;
  id v8 = v3;
  v15 = v8;
  id v9 = v6;
  -[SQLiteEntity getValuesForProperties:withApplier:](self, "getValuesForProperties:withApplier:", v7, v13);

  id v10 = v15;
  id v11 = v8;

  return v11;
}

@end
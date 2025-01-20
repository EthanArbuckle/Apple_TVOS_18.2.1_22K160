@interface FeatureApplication
+ (id)_predicateForAccountIdentifier:(id)a3;
+ (id)_predicateForApplicationState:(unint64_t)a3;
+ (id)_predicateForApplicationType:(int64_t)a3;
+ (id)_predicateForFeatureApplicationIdentifier:(id)a3;
+ (id)_propertySettersForFeatureApplication;
+ (id)databaseTable;
+ (id)featureApplicationWithIdentifier:(id)a3 inDatabase:(id)a4;
+ (id)featureApplicationsForAccountIdentifier:(id)a3 inDatabase:(id)a4;
+ (id)featureApplicationsInDatabase:(id)a3;
+ (id)insertOrUpdateFeatureApplication:(id)a3 inDatabase:(id)a4;
+ (unint64_t)newAccountUserInvitationsCountInDatabase:(id)a3;
+ (void)deleteAllFeatureApplicationsInDatabase:(id)a3;
+ (void)deleteAllFeatureApplicationsWithAccountIdentifier:(id)a3 inDatabase:(id)a4;
+ (void)deleteFeatureApplicationWithIdentifier:(id)a3 inDatabase:(id)a4;
+ (void)deleteFeatureApplicationsNotIncludingIdentifiers:(id)a3 forAccountIdentifier:(id)a4 inDatabase:(id)a5;
+ (void)deleteFeatureApplicationsNotIncludingIdentifiers:(id)a3 inDatabase:(id)a4;
- (BOOL)deleteFromDatabase;
- (FeatureApplication)initWithFeatureApplication:(id)a3 inDatabase:(id)a4;
- (id)featureApplication;
- (unint64_t)state;
- (void)updateWithFeatureApplication:(id)a3;
@end

@implementation FeatureApplication

+ (id)featureApplicationsInDatabase:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForAccountIdentifier:0]);
  v6 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v4 predicate:v5]);

  v7 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  v19 = @"pid";
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v19, 1LL));
  v13 = _NSConcreteStackBlock;
  uint64_t v14 = 3221225472LL;
  v15 = sub_100414A94;
  v16 = &unk_100639E18;
  id v17 = v4;
  v18 = v7;
  v9 = v7;
  id v10 = v4;
  [v6 enumeratePersistentIDsAndProperties:v8 usingBlock:&v13];

  id v11 = -[NSMutableSet copy](v9, "copy", v13, v14, v15, v16);
  return v11;
}

+ (id)featureApplicationsForAccountIdentifier:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForAccountIdentifier:a3]);
  v8 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v7]);

  v9 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  v21 = @"pid";
  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v21, 1LL));
  v15 = _NSConcreteStackBlock;
  uint64_t v16 = 3221225472LL;
  id v17 = sub_100414C50;
  v18 = &unk_100639E18;
  id v19 = v6;
  v20 = v9;
  id v11 = v9;
  id v12 = v6;
  [v8 enumeratePersistentIDsAndProperties:v10 usingBlock:&v15];

  id v13 = -[NSMutableSet copy](v11, "copy", v15, v16, v17, v18);
  return v13;
}

+ (unint64_t)newAccountUserInvitationsCountInDatabase:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForAccountIdentifier:0]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_predicateForApplicationType:", 2, v5));
  v13[1] = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForApplicationState:1]);
  v13[2] = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v13, 3LL));

  v9 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v8));
  id v10 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v4 predicate:v9]);

  id v11 = [v10 countOfEntities];
  return (unint64_t)v11;
}

+ (id)featureApplicationWithIdentifier:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForFeatureApplicationIdentifier:a3]);
  v8 = (void *)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v6 predicate:v7]);

  return v8;
}

+ (id)insertOrUpdateFeatureApplication:(id)a3 inDatabase:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue([v6 applicationIdentifier]);
  id v9 = (id)objc_claimAutoreleasedReturnValue([a1 featureApplicationWithIdentifier:v8 inDatabase:v7]);

  if (v9) {
    [v9 updateWithFeatureApplication:v6];
  }
  else {
    id v9 = [objc_alloc((Class)a1) initWithFeatureApplication:v6 inDatabase:v7];
  }

  return v9;
}

- (FeatureApplication)initWithFeatureApplication:(id)a3 inDatabase:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v6 applicationIdentifier]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v8, "setObjectOrNull:forKey:", v9, @"a");

  id v10 = (void *)objc_claimAutoreleasedReturnValue([v6 applicationBaseURL]);
  id v11 = (void *)_SQLValueForURL(v10);
  -[NSMutableDictionary setObjectOrNull:forKey:](v8, "setObjectOrNull:forKey:", v11, @"b");

  -[NSMutableDictionary setInteger:forKey:](v8, "setInteger:forKey:", [v6 feature], @"c");
  -[NSMutableDictionary setInteger:forKey:](v8, "setInteger:forKey:", [v6 applicationState], @"d");
  -[NSMutableDictionary setInteger:forKey:]( v8,  "setInteger:forKey:",  [v6 applicationStateReason],  @"e");
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v6 applicationTermsIdentifier]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v8, "setObjectOrNull:forKey:", v12, @"f");

  id v13 = (void *)objc_claimAutoreleasedReturnValue([v6 lastUpdated]);
  uint64_t v14 = (void *)_SQLValueForDate(v13);
  -[NSMutableDictionary setObjectOrNull:forKey:](v8, "setObjectOrNull:forKey:", v14, @"h");

  -[NSMutableDictionary setBool:forKey:](v8, "setBool:forKey:", [v6 applicationStateDirty], @"g");
  v15 = (void *)objc_claimAutoreleasedReturnValue([v6 businessChatIdentifier]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v8, "setObjectOrNull:forKey:", v15, @"k");

  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v6 coreIDVServiceProviderName]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v8, "setObjectOrNull:forKey:", v16, @"l");

  -[NSMutableDictionary setInteger:forKey:](v8, "setInteger:forKey:", [v6 applicationType], @"m");
  id v17 = (void *)objc_claimAutoreleasedReturnValue([v6 accountIdentifier]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v8, "setObjectOrNull:forKey:", v17, @"o");

  v18 = (void *)objc_claimAutoreleasedReturnValue([v6 referenceIdentifier]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v8, "setObjectOrNull:forKey:", v18, @"p");

  id v19 = (void *)objc_claimAutoreleasedReturnValue([v6 preliminaryAssessmentIdentifier]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v8, "setObjectOrNull:forKey:", v19, @"q");

  -[NSMutableDictionary setInteger:forKey:]( v8,  "setInteger:forKey:",  [v6 featureProduct],  @"feature_product");
  -[NSMutableDictionary setInteger:forKey:]( v8,  "setInteger:forKey:",  [v6 updateUserInfoSubType],  @"r");
  v20 = -[SQLiteEntity initWithPropertyValues:inDatabase:](self, "initWithPropertyValues:inDatabase:", v8, v7);
  id v21 = -[SQLiteEntity persistentID](v20, "persistentID");
  v22 = (void *)objc_claimAutoreleasedReturnValue([v6 applicationOfferDetails]);
  if (v22) {
    id v23 =  +[FeatureApplicationOfferDetails insertFeatureApplicationOfferDetails:forApplicationPID:inDatabase:]( &OBJC_CLASS___FeatureApplicationOfferDetails,  "insertFeatureApplicationOfferDetails:forApplicationPID:inDatabase:",  v22,  v21,  v7);
  }
  v24 = (void *)objc_claimAutoreleasedReturnValue([v6 declineDetails]);
  if (v24) {
    +[FeatureApplicationDeclineDetails updateFeatureApplicationDeclineDetails:forApplicationPID:inDatabase:]( &OBJC_CLASS___FeatureApplicationDeclineDetails,  "updateFeatureApplicationDeclineDetails:forApplicationPID:inDatabase:",  v24,  v21,  v7);
  }
  v25 = (void *)objc_claimAutoreleasedReturnValue([v6 invitationDetails]);
  if (v25)
  {
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", v21));
    +[FeatureApplicationInvitationDetails updateFeatureApplicationInvitationDetails:forApplicationPID:inDatabase:]( &OBJC_CLASS___FeatureApplicationInvitationDetails,  "updateFeatureApplicationInvitationDetails:forApplicationPID:inDatabase:",  v25,  v26,  v7);
  }

  return v20;
}

- (void)updateWithFeatureApplication:(id)a3
{
  id v22 = a3;
  id v4 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  v5 = (void *)objc_claimAutoreleasedReturnValue([v22 applicationIdentifier]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v5, @"a");

  id v6 = (void *)objc_claimAutoreleasedReturnValue([v22 applicationBaseURL]);
  id v7 = (void *)_SQLValueForURL(v6);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v7, @"b");

  -[NSMutableDictionary setInteger:forKey:](v4, "setInteger:forKey:", [v22 feature], @"c");
  -[NSMutableDictionary setInteger:forKey:](v4, "setInteger:forKey:", [v22 applicationState], @"d");
  -[NSMutableDictionary setInteger:forKey:]( v4,  "setInteger:forKey:",  [v22 applicationStateReason],  @"e");
  v8 = (void *)objc_claimAutoreleasedReturnValue([v22 applicationTermsIdentifier]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v8, @"f");

  id v9 = (void *)objc_claimAutoreleasedReturnValue([v22 lastUpdated]);
  id v10 = (void *)_SQLValueForDate(v9);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v10, @"h");

  -[NSMutableDictionary setBool:forKey:](v4, "setBool:forKey:", [v22 applicationStateDirty], @"g");
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v22 businessChatIdentifier]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v11, @"k");

  id v12 = (void *)objc_claimAutoreleasedReturnValue([v22 coreIDVServiceProviderName]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v12, @"l");

  -[NSMutableDictionary setInteger:forKey:](v4, "setInteger:forKey:", [v22 applicationType], @"m");
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v22 accountIdentifier]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v13, @"o");

  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v22 referenceIdentifier]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v14, @"p");

  v15 = (void *)objc_claimAutoreleasedReturnValue([v22 preliminaryAssessmentIdentifier]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v15, @"q");

  -[NSMutableDictionary setInteger:forKey:]( v4,  "setInteger:forKey:",  [v22 featureProduct],  @"feature_product");
  -[NSMutableDictionary setInteger:forKey:]( v4,  "setInteger:forKey:",  [v22 updateUserInfoSubType],  @"r");
  int64_t v16 = -[SQLiteEntity persistentID](self, "persistentID");
  id v17 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity database](self, "database"));
  v18 = (void *)objc_claimAutoreleasedReturnValue([v22 applicationOfferDetails]);
  if (v18) {
    +[FeatureApplicationOfferDetails updateFeatureApplicationOfferDetails:forApplicationPID:inDatabase:]( &OBJC_CLASS___FeatureApplicationOfferDetails,  "updateFeatureApplicationOfferDetails:forApplicationPID:inDatabase:",  v18,  v16,  v17);
  }
  else {
    +[FeatureApplicationOfferDetails deleteFeatureApplicationOfferDetailsForApplicationPID:inDatabase:]( &OBJC_CLASS___FeatureApplicationOfferDetails,  "deleteFeatureApplicationOfferDetailsForApplicationPID:inDatabase:",  v16,  v17);
  }
  id v19 = (void *)objc_claimAutoreleasedReturnValue([v22 declineDetails]);
  if (v19) {
    +[FeatureApplicationDeclineDetails updateFeatureApplicationDeclineDetails:forApplicationPID:inDatabase:]( &OBJC_CLASS___FeatureApplicationDeclineDetails,  "updateFeatureApplicationDeclineDetails:forApplicationPID:inDatabase:",  v19,  v16,  v17);
  }
  else {
    +[FeatureApplicationDeclineDetails deleteFeatureApplicationDeclineDetailsForApplicationPID:inDatabase:]( &OBJC_CLASS___FeatureApplicationDeclineDetails,  "deleteFeatureApplicationDeclineDetailsForApplicationPID:inDatabase:",  v16,  v17);
  }
  v20 = (void *)objc_claimAutoreleasedReturnValue([v22 invitationDetails]);
  id v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", v16));
  if (v20) {
    +[FeatureApplicationInvitationDetails updateFeatureApplicationInvitationDetails:forApplicationPID:inDatabase:]( &OBJC_CLASS___FeatureApplicationInvitationDetails,  "updateFeatureApplicationInvitationDetails:forApplicationPID:inDatabase:",  v20,  v21,  v17);
  }
  else {
    +[FeatureApplicationInvitationDetails deleteFeatureApplicationInvitationDetailsForApplicationPID:inDatabase:]( &OBJC_CLASS___FeatureApplicationInvitationDetails,  "deleteFeatureApplicationInvitationDetailsForApplicationPID:inDatabase:",  v21,  v17);
  }

  -[SQLiteEntity setValuesWithDictionary:](self, "setValuesWithDictionary:", v4);
}

- (id)featureApplication
{
  v3 = objc_alloc_init(&OBJC_CLASS___PKFeatureApplication);
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[FeatureApplication _propertySettersForFeatureApplication]( &OBJC_CLASS___FeatureApplication,  "_propertySettersForFeatureApplication"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 allKeys]);
  int64_t v16 = _NSConcreteStackBlock;
  uint64_t v17 = 3221225472LL;
  v18 = sub_1004157D0;
  id v19 = &unk_100639EE8;
  id v20 = v4;
  id v6 = v3;
  id v21 = v6;
  id v7 = v4;
  -[SQLiteEntity getValuesForProperties:withApplier:](self, "getValuesForProperties:withApplier:", v5, &v16);

  int64_t v8 = -[SQLiteEntity persistentID](self, "persistentID", v16, v17, v18, v19);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity database](self, "database"));
  id v10 = (void *)objc_claimAutoreleasedReturnValue( +[FeatureApplicationOfferDetails featureApplicationOfferDetailsForApplicationPID:inDatabase:]( &OBJC_CLASS___FeatureApplicationOfferDetails,  "featureApplicationOfferDetailsForApplicationPID:inDatabase:",  v8,  v9));
  -[PKFeatureApplication setApplicationOfferDetails:](v6, "setApplicationOfferDetails:", v10);

  id v11 = (void *)objc_claimAutoreleasedReturnValue( +[FeatureApplicationDeclineDetails featureApplicationDeclineDetailsForApplicationPID:inDatabase:]( &OBJC_CLASS___FeatureApplicationDeclineDetails,  "featureApplicationDeclineDetailsForApplicationPID:inDatabase:",  v8,  v9));
  -[PKFeatureApplication setDeclineDetails:](v6, "setDeclineDetails:", v11);

  id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", v8));
  id v13 = (void *)objc_claimAutoreleasedReturnValue( +[FeatureApplicationInvitationDetails featureApplicationInvitationDetailsForApplicationPID:inDatabase:]( &OBJC_CLASS___FeatureApplicationInvitationDetails,  "featureApplicationInvitationDetailsForApplicationPID:inDatabase:",  v12,  v9));
  -[PKFeatureApplication setInvitationDetails:](v6, "setInvitationDetails:", v13);

  uint64_t v14 = v6;
  return v14;
}

- (unint64_t)state
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"d"));
  id v3 = [v2 integerValue];

  return (unint64_t)v3;
}

+ (id)databaseTable
{
  return @"durian";
}

+ (void)deleteFeatureApplicationsNotIncludingIdentifiers:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteContainsPredicate doesNotContainPredicateWithProperty:values:]( &OBJC_CLASS___SQLiteContainsPredicate,  "doesNotContainPredicateWithProperty:values:",  @"a",  a3));
  int64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteNullPredicate isNullPredicateWithProperty:]( &OBJC_CLASS___SQLiteNullPredicate,  "isNullPredicateWithProperty:",  @"o"));
  v12[0] = v7;
  v12[1] = v8;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v12, 2LL));
  id v10 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v9));

  id v11 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v10]);
  [v11 deleteAllEntities];
}

+ (void)deleteFeatureApplicationsNotIncludingIdentifiers:(id)a3 forAccountIdentifier:(id)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteContainsPredicate doesNotContainPredicateWithProperty:values:]( &OBJC_CLASS___SQLiteContainsPredicate,  "doesNotContainPredicateWithProperty:values:",  @"a",  a3));
  id v11 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForAccountIdentifier:v9]);

  v15[0] = v10;
  v15[1] = v11;
  id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v15, 2LL));
  id v13 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v12));

  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v8 predicate:v13]);
  [v14 deleteAllEntities];
}

+ (void)deleteAllFeatureApplicationsInDatabase:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForAccountIdentifier:0]);
  id v6 = (id)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v4 predicate:v5]);

  [v6 deleteAllEntities];
}

+ (void)deleteAllFeatureApplicationsWithAccountIdentifier:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForAccountIdentifier:a3]);
  id v8 = (id)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v7]);

  [v8 deleteAllEntities];
}

+ (void)deleteFeatureApplicationWithIdentifier:(id)a3 inDatabase:(id)a4
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue([a1 featureApplicationWithIdentifier:a3 inDatabase:a4]);
  if (v4)
  {
    id v5 = v4;
    [v4 deleteFromDatabase];
    id v4 = v5;
  }
}

- (BOOL)deleteFromDatabase
{
  v2 = self;
  int64_t v3 = -[SQLiteEntity persistentID](self, "persistentID");
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity database](v2, "database"));
  +[FeatureApplicationOfferDetails deleteFeatureApplicationOfferDetailsForApplicationPID:inDatabase:]( &OBJC_CLASS___FeatureApplicationOfferDetails,  "deleteFeatureApplicationOfferDetailsForApplicationPID:inDatabase:",  v3,  v4);
  +[FeatureApplicationDeclineDetails deleteFeatureApplicationDeclineDetailsForApplicationPID:inDatabase:]( &OBJC_CLASS___FeatureApplicationDeclineDetails,  "deleteFeatureApplicationDeclineDetailsForApplicationPID:inDatabase:",  v3,  v4);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", v3));
  +[FeatureApplicationInvitationDetails deleteFeatureApplicationInvitationDetailsForApplicationPID:inDatabase:]( &OBJC_CLASS___FeatureApplicationInvitationDetails,  "deleteFeatureApplicationInvitationDetailsForApplicationPID:inDatabase:",  v5,  v4);

  v7.receiver = v2;
  v7.super_class = (Class)&OBJC_CLASS___FeatureApplication;
  LOBYTE(v2) = -[SQLiteEntity deleteFromDatabase](&v7, "deleteFromDatabase");

  return (char)v2;
}

+ (id)_predicateForAccountIdentifier:(id)a3
{
  if (a3) {
    int64_t v3 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"o",  a3));
  }
  else {
    int64_t v3 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteNullPredicate isNullPredicateWithProperty:]( &OBJC_CLASS___SQLiteNullPredicate,  "isNullPredicateWithProperty:",  @"o"));
  }
  return v3;
}

+ (id)_predicateForApplicationType:(int64_t)a3
{
  int64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a3));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"m",  v3));

  return v4;
}

+ (id)_predicateForApplicationState:(unint64_t)a3
{
  int64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a3));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"d",  v3));

  return v4;
}

+ (id)_predicateForFeatureApplicationIdentifier:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"a",  a3);
}

+ (id)_propertySettersForFeatureApplication
{
  v3[0] = @"a";
  v3[1] = @"b";
  v4[0] = &stru_10065EEF0;
  v4[1] = &stru_10065EF10;
  v3[2] = @"c";
  v3[3] = @"d";
  v4[2] = &stru_10065EF30;
  v4[3] = &stru_10065EF50;
  v3[4] = @"e";
  v3[5] = @"f";
  v4[4] = &stru_10065EF70;
  v4[5] = &stru_10065EF90;
  v3[6] = @"g";
  v3[7] = @"h";
  v4[6] = &stru_10065EFB0;
  v4[7] = &stru_10065EFD0;
  v3[8] = @"k";
  v3[9] = @"l";
  v4[8] = &stru_10065EFF0;
  v4[9] = &stru_10065F010;
  v3[10] = @"m";
  v3[11] = @"o";
  v4[10] = &stru_10065F030;
  v4[11] = &stru_10065F050;
  v3[12] = @"p";
  v3[13] = @"q";
  v4[12] = &stru_10065F070;
  v4[13] = &stru_10065F090;
  v3[14] = @"feature_product";
  v3[15] = @"r";
  v4[14] = &stru_10065F0B0;
  v4[15] = &stru_10065F0D0;
  return (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v4,  v3,  16LL));
}

@end
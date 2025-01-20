@interface PayLaterAccountTermsDetails
+ (id)_commonDictionaryForAccountTermsDetails:(id)a3;
+ (id)_predicateForAccountDetailsPID:(int64_t)a3;
+ (id)_propertySettersForPayLaterAccountTermsDetails;
+ (id)associationPropertyForEntityClass:(Class)a3;
+ (id)databaseTable;
+ (id)insertOrUpdatePayLaterAccountTermsDetails:(id)a3 forPayLaterAccountDetailsPID:(int64_t)a4 inDatabase:(id)a5;
+ (id)payLaterAccountTermsDetailsForAccountDetailsPID:(int64_t)a3 inDatabase:(id)a4;
+ (void)deletePayLaterAccountTermsDetailsForPayLaterAccountDetailsPID:(int64_t)a3 inDatabase:(id)a4;
- (PayLaterAccountTermsDetails)initWithPayLaterAccountTermsDetails:(id)a3 forPayLaterAccountDetailsPID:(int64_t)a4 inDatabase:(id)a5;
- (id)termsDetails;
- (void)updateWithAccoumtTermsDetails:(id)a3;
@end

@implementation PayLaterAccountTermsDetails

+ (id)databaseTable
{
  return @"atemoya";
}

+ (id)associationPropertyForEntityClass:(Class)a3
{
  if ((Class)objc_opt_class(&OBJC_CLASS___PayLaterAccountDetails, a2) == a3) {
    return @"a";
  }
  else {
    return 0LL;
  }
}

- (PayLaterAccountTermsDetails)initWithPayLaterAccountTermsDetails:(id)a3 forPayLaterAccountDetailsPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v11 = objc_msgSend((id)objc_opt_class(self, v10), "_commonDictionaryForAccountTermsDetails:", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a4));
  [v12 setObjectOrNull:v13 forKey:@"a"];

  v14 = -[SQLiteEntity initWithPropertyValues:inDatabase:](self, "initWithPropertyValues:inDatabase:", v12, v8);
  v15 = v14;

  return v15;
}

+ (id)insertOrUpdatePayLaterAccountTermsDetails:(id)a3 forPayLaterAccountDetailsPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForAccountDetailsPID:a4]);
  id v11 = (id)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v9 predicate:v10]);

  if (v11) {
    [v11 updateWithAccoumtTermsDetails:v8];
  }
  else {
    id v11 = objc_msgSend( objc_alloc((Class)objc_opt_class(a1, v12)),  "initWithPayLaterAccountTermsDetails:forPayLaterAccountDetailsPID:inDatabase:",  v8,  a4,  v9);
  }

  return v11;
}

+ (void)deletePayLaterAccountTermsDetailsForPayLaterAccountDetailsPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForAccountDetailsPID:a3]);
  id v8 = (id)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v6 predicate:v7]);

  [v8 deleteFromDatabase];
}

+ (id)payLaterAccountTermsDetailsForAccountDetailsPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForAccountDetailsPID:a3]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v6 predicate:v7]);

  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 termsDetails]);
  return v9;
}

- (void)updateWithAccoumtTermsDetails:(id)a3
{
  id v4 = a3;
  id v6 = objc_msgSend((id)objc_opt_class(self, v5), "_commonDictionaryForAccountTermsDetails:", v4);
  id v7 = (id)objc_claimAutoreleasedReturnValue(v6);

  -[SQLiteEntity setValuesWithDictionary:](self, "setValuesWithDictionary:", v7);
}

+ (id)_predicateForAccountDetailsPID:(int64_t)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a3));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"a",  v3));

  return v4;
}

+ (id)_propertySettersForPayLaterAccountTermsDetails
{
  v3[0] = @"terms_acceptance_required";
  v3[1] = @"terms_identifier";
  v4[0] = &stru_100645CB0;
  v4[1] = &stru_100645CD0;
  return (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v4,  v3,  2LL));
}

- (id)termsDetails
{
  v3 = objc_alloc_init(&OBJC_CLASS___PKPayLaterAccountTermsDetails);
  id v5 = objc_msgSend((id)objc_opt_class(self, v4), "_propertySettersForPayLaterAccountTermsDetails");
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 allKeys]);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_100149D90;
  v13[3] = &unk_100638EF0;
  v13[4] = self;
  id v14 = v6;
  id v8 = v3;
  v15 = v8;
  id v9 = v6;
  -[SQLiteEntity getValuesForProperties:withApplier:](self, "getValuesForProperties:withApplier:", v7, v13);

  uint64_t v10 = v15;
  id v11 = v8;

  return v11;
}

+ (id)_commonDictionaryForAccountTermsDetails:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v3 termsAcceptanceRequired]));
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v5, @"terms_acceptance_required");

  id v6 = (void *)objc_claimAutoreleasedReturnValue([v3 termsIdentifier]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v6, @"terms_identifier");

  return v4;
}

@end
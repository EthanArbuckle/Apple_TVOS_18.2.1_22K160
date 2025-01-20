@interface PaymentSetupFeature
+ (id)_predicateForProductIdentifier:(id)a3;
+ (id)_propertySettersForPaymentSetupFeature;
+ (id)databaseTable;
+ (id)insertOrUpdatePaymentSetupFeature:(id)a3 inDatabase:(id)a4;
+ (id)paymentSetupFeatureWithIdentifier:(id)a3 inDatabase:(id)a4;
+ (id)paymentSetupFeaturesInDatabase:(id)a3;
+ (void)deleteAllPaymentSetupFeaturesInDatabase:(id)a3;
+ (void)deletePaymentSetupFeatureWithIdentifier:(id)a3 inDatabase:(id)a4;
+ (void)deletePaymentSetupFeaturesNotIncludingIdentifiers:(id)a3 inDatabase:(id)a4;
- (PaymentSetupFeature)initWithPaymentSetupFeature:(id)a3 inDatabase:(id)a4;
- (id)paymentSetupFeature;
- (void)updateWithPaymentSetupFeature:(id)a3;
@end

@implementation PaymentSetupFeature

+ (id)paymentSetupFeaturesInDatabase:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[SQLiteBooleanPredicate truePredicate](&OBJC_CLASS___SQLiteBooleanPredicate, "truePredicate"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v4 predicate:v5]);

  v7 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  v19 = @"pid";
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v19, 1LL));
  v13 = _NSConcreteStackBlock;
  uint64_t v14 = 3221225472LL;
  v15 = sub_10016CF48;
  v16 = &unk_100639E18;
  id v17 = v4;
  v18 = v7;
  v9 = v7;
  id v10 = v4;
  [v6 enumeratePersistentIDsAndProperties:v8 usingBlock:&v13];

  id v11 = -[NSMutableSet copy](v9, "copy", v13, v14, v15, v16);
  return v11;
}

+ (id)paymentSetupFeatureWithIdentifier:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForProductIdentifier:a3]);
  v8 = (void *)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v6 predicate:v7]);

  return v8;
}

+ (id)insertOrUpdatePaymentSetupFeature:(id)a3 inDatabase:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue([v6 productIdentifier]);
  id v9 = (id)objc_claimAutoreleasedReturnValue([a1 paymentSetupFeatureWithIdentifier:v8 inDatabase:v7]);

  if (v9) {
    [v9 updateWithPaymentSetupFeature:v6];
  }
  else {
    id v9 = [objc_alloc((Class)a1) initWithPaymentSetupFeature:v6 inDatabase:v7];
  }

  return v9;
}

- (PaymentSetupFeature)initWithPaymentSetupFeature:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 identifiers]);
  id v10 = _SQLValueForIdentifiers(v9);
  id v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  -[NSMutableDictionary setObjectOrNull:forKey:](v8, "setObjectOrNull:forKey:", v11, @"identifiers");

  v12 = (void *)objc_claimAutoreleasedReturnValue([v7 localizedDisplayName]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v8, "setObjectOrNull:forKey:", v12, @"localized_display_name");

  -[NSMutableDictionary setInteger:forKey:](v8, "setInteger:forKey:", [v7 type], @"feature_type");
  -[NSMutableDictionary setInteger:forKey:](v8, "setInteger:forKey:", [v7 state], @"feature_state");
  -[NSMutableDictionary setInteger:forKey:]( v8,  "setInteger:forKey:",  [v7 supportedOptions],  @"supported_options");
  -[NSMutableDictionary setInteger:forKey:]( v8,  "setInteger:forKey:",  [v7 supportedDevices],  @"supported_devices");
  v13 = (void *)objc_claimAutoreleasedReturnValue([v7 productIdentifier]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v8, "setObjectOrNull:forKey:", v13, @"product_identifier");

  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v7 partnerIdentifier]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v8, "setObjectOrNull:forKey:", v14, @"partner_identifier");

  -[NSMutableDictionary setInteger:forKey:]( v8,  "setInteger:forKey:",  [v7 featureIdentifier],  @"feature_identifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue([v7 dirtyStateIdentifier]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v8, "setObjectOrNull:forKey:", v15, @"dirty_state_identifier");

  v16 = (void *)objc_claimAutoreleasedReturnValue([v7 lastUpdated]);
  id v17 = (void *)_SQLValueForDate(v16);
  -[NSMutableDictionary setObjectOrNull:forKey:](v8, "setObjectOrNull:forKey:", v17, @"last_updated_date");

  v18 = (void *)objc_claimAutoreleasedReturnValue([v7 expiry]);
  v19 = (void *)_SQLValueForDate(v18);
  -[NSMutableDictionary setObjectOrNull:forKey:](v8, "setObjectOrNull:forKey:", v19, @"expiry_date");

  -[NSMutableDictionary setInteger:forKey:]( v8,  "setInteger:forKey:",  [v7 productType],  @"product_type");
  -[NSMutableDictionary setInteger:forKey:]( v8,  "setInteger:forKey:",  [v7 productState],  @"product_state");
  v20 = (void *)objc_claimAutoreleasedReturnValue([v7 notificationTitle]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v8, "setObjectOrNull:forKey:", v20, @"notification_title");

  v21 = (void *)objc_claimAutoreleasedReturnValue([v7 notificationMessage]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v8, "setObjectOrNull:forKey:", v21, @"notification_message");

  v22 = (void *)objc_claimAutoreleasedReturnValue([v7 discoveryCardIdentifier]);
  -[NSMutableDictionary setObjectOrNull:forKey:]( v8,  "setObjectOrNull:forKey:",  v22,  @"discovery_card_identitifer");

  v23 = -[SQLiteEntity initWithPropertyValues:inDatabase:](self, "initWithPropertyValues:inDatabase:", v8, v6);
  v24 = v23;

  return v24;
}

- (void)updateWithPaymentSetupFeature:(id)a3
{
  id v4 = a3;
  v19 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 identifiers]);
  id v6 = _SQLValueForIdentifiers(v5);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  -[NSMutableDictionary setObjectOrNull:forKey:](v19, "setObjectOrNull:forKey:", v7, @"identifiers");

  v8 = (void *)objc_claimAutoreleasedReturnValue([v4 localizedDisplayName]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v19, "setObjectOrNull:forKey:", v8, @"localized_display_name");

  -[NSMutableDictionary setInteger:forKey:](v19, "setInteger:forKey:", [v4 type], @"feature_type");
  -[NSMutableDictionary setInteger:forKey:]( v19,  "setInteger:forKey:",  [v4 state],  @"feature_state");
  -[NSMutableDictionary setInteger:forKey:]( v19,  "setInteger:forKey:",  [v4 supportedOptions],  @"supported_options");
  -[NSMutableDictionary setInteger:forKey:]( v19,  "setInteger:forKey:",  [v4 supportedDevices],  @"supported_devices");
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v4 productIdentifier]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v19, "setObjectOrNull:forKey:", v9, @"product_identifier");

  id v10 = (void *)objc_claimAutoreleasedReturnValue([v4 partnerIdentifier]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v19, "setObjectOrNull:forKey:", v10, @"partner_identifier");

  -[NSMutableDictionary setInteger:forKey:]( v19,  "setInteger:forKey:",  [v4 featureIdentifier],  @"feature_identifier");
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v4 dirtyStateIdentifier]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v19, "setObjectOrNull:forKey:", v11, @"dirty_state_identifier");

  v12 = (void *)objc_claimAutoreleasedReturnValue([v4 lastUpdated]);
  v13 = (void *)_SQLValueForDate(v12);
  -[NSMutableDictionary setObjectOrNull:forKey:](v19, "setObjectOrNull:forKey:", v13, @"last_updated_date");

  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v4 expiry]);
  v15 = (void *)_SQLValueForDate(v14);
  -[NSMutableDictionary setObjectOrNull:forKey:](v19, "setObjectOrNull:forKey:", v15, @"expiry_date");

  -[NSMutableDictionary setInteger:forKey:]( v19,  "setInteger:forKey:",  [v4 productType],  @"product_type");
  -[NSMutableDictionary setInteger:forKey:]( v19,  "setInteger:forKey:",  [v4 productState],  @"product_state");
  v16 = (void *)objc_claimAutoreleasedReturnValue([v4 notificationTitle]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v19, "setObjectOrNull:forKey:", v16, @"notification_title");

  id v17 = (void *)objc_claimAutoreleasedReturnValue([v4 notificationMessage]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v19, "setObjectOrNull:forKey:", v17, @"notification_message");

  v18 = (void *)objc_claimAutoreleasedReturnValue([v4 discoveryCardIdentifier]);
  -[NSMutableDictionary setObjectOrNull:forKey:]( v19,  "setObjectOrNull:forKey:",  v18,  @"discovery_card_identitifer");

  -[SQLiteEntity setValuesWithDictionary:](self, "setValuesWithDictionary:", v19);
}

- (id)paymentSetupFeature
{
  v3 = objc_alloc_init(&OBJC_CLASS___PKPaymentSetupFeature);
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[PaymentSetupFeature _propertySettersForPaymentSetupFeature]( &OBJC_CLASS___PaymentSetupFeature,  "_propertySettersForPaymentSetupFeature"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 allKeys]);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_10016D770;
  v11[3] = &unk_100639EE8;
  id v12 = v4;
  id v6 = v3;
  v13 = v6;
  id v7 = v4;
  -[SQLiteEntity getValuesForProperties:withApplier:](self, "getValuesForProperties:withApplier:", v5, v11);

  v8 = v13;
  id v9 = v6;

  return v9;
}

+ (id)databaseTable
{
  return @"payment_setup_features";
}

+ (void)deletePaymentSetupFeaturesNotIncludingIdentifiers:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v8 = (id)objc_claimAutoreleasedReturnValue( +[SQLiteContainsPredicate doesNotContainPredicateWithProperty:values:]( &OBJC_CLASS___SQLiteContainsPredicate,  "doesNotContainPredicateWithProperty:values:",  @"product_identifier",  a3));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v8]);

  [v7 deleteAllEntities];
}

+ (void)deleteAllPaymentSetupFeaturesInDatabase:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[SQLiteBooleanPredicate truePredicate](&OBJC_CLASS___SQLiteBooleanPredicate, "truePredicate"));
  id v6 = (id)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v4 predicate:v5]);

  [v6 deleteAllEntities];
}

+ (void)deletePaymentSetupFeatureWithIdentifier:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v9 = objc_msgSend((id)objc_opt_class(a1, v8), "_predicateForProductIdentifier:", v7);
  id v11 = (id)objc_claimAutoreleasedReturnValue(v9);

  id v10 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v11]);
  [v10 deleteAllEntities];
}

+ (id)_predicateForProductIdentifier:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"product_identifier",  a3);
}

+ (id)_propertySettersForPaymentSetupFeature
{
  v3[0] = @"identifiers";
  v3[1] = @"localized_display_name";
  v4[0] = &stru_100647358;
  v4[1] = &stru_100647378;
  v3[2] = @"feature_type";
  v3[3] = @"feature_state";
  v4[2] = &stru_100647398;
  v4[3] = &stru_1006473B8;
  v3[4] = @"supported_options";
  v3[5] = @"supported_devices";
  v4[4] = &stru_1006473D8;
  v4[5] = &stru_1006473F8;
  v3[6] = @"product_identifier";
  v3[7] = @"partner_identifier";
  v4[6] = &stru_100647418;
  v4[7] = &stru_100647438;
  v3[8] = @"feature_identifier";
  v3[9] = @"dirty_state_identifier";
  v4[8] = &stru_100647458;
  v4[9] = &stru_100647478;
  v3[10] = @"last_updated_date";
  v3[11] = @"expiry_date";
  v4[10] = &stru_100647498;
  v4[11] = &stru_1006474B8;
  v3[12] = @"product_type";
  v3[13] = @"product_state";
  v4[12] = &stru_1006474D8;
  v4[13] = &stru_1006474F8;
  v3[14] = @"notification_title";
  v3[15] = @"notification_message";
  v4[14] = &stru_100647518;
  v4[15] = &stru_100647538;
  v3[16] = @"discovery_card_identitifer";
  v4[16] = &stru_100647558;
  return (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v4,  v3,  17LL));
}

@end
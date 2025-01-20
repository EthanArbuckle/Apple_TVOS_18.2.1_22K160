@interface PaymentOfferInstallmentCriteria
+ (id)_commonDictionaryForInstallmentCriteria:(id)a3;
+ (id)_installmentCriteriaWithQuery:(id)a3;
+ (id)_predicateForCatalogPID:(int64_t)a3;
+ (id)_predicateForFpanIdentifier:(id)a3;
+ (id)_predicateForIdentifier:(id)a3;
+ (id)_predicateForPassSerialNumber:(id)a3;
+ (id)_predicateForPassTypeIdentifier:(id)a3;
+ (id)_propertySetters;
+ (id)criteriaIdentifierForFpanIdentifier:(id)a3 inDatabase:(id)a4;
+ (id)databaseTable;
+ (id)installmentCriteriaForCatalogPID:(int64_t)a3 inDatabase:(id)a4;
+ (void)deletePaymentOfferInstallmentCriteriaForCatalogPID:(int64_t)a3 criteria:(id)a4 inDatabase:(id)a5;
+ (void)deletePaymentOfferInstallmentCriteriaForCatalogPID:(int64_t)a3 inDatabase:(id)a4;
+ (void)insertOrUpdateInstallmentCriteria:(id)a3 forCatalogPID:(int64_t)a4 inDatabase:(id)a5;
- (BOOL)deleteFromDatabase;
- (id)criteriaIdentifier;
@end

@implementation PaymentOfferInstallmentCriteria

+ (id)databaseTable
{
  return @"cow";
}

+ (void)insertOrUpdateInstallmentCriteria:(id)a3 forCatalogPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  [a1 deletePaymentOfferInstallmentCriteriaForCatalogPID:a4 criteria:v8 inDatabase:v9];
  id v11 = objc_msgSend((id)objc_opt_class(a1, v10), "_commonDictionaryForInstallmentCriteria:", v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a4));
  [v12 safelySetObject:v13 forKey:@"c_pid"];

  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_10033BD40;
  v17[3] = &unk_10063FDF8;
  id v18 = v12;
  id v19 = v9;
  id v20 = v8;
  id v21 = a1;
  id v14 = v8;
  id v15 = v9;
  id v16 = v12;
  sub_1002CCC5C((uint64_t)v15, v17);
}

+ (void)deletePaymentOfferInstallmentCriteriaForCatalogPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForCatalogPID:a3]);
  id v8 = (id)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v7]);

  [v8 deleteAllEntities];
}

+ (void)deletePaymentOfferInstallmentCriteriaForCatalogPID:(int64_t)a3 criteria:(id)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v19 = (void *)objc_claimAutoreleasedReturnValue([v9 identifier]);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForIdentifier:v19]);
  v20[0] = v10;
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v9 passTypeIdentifier]);
  v12 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForPassTypeIdentifier:v11]);
  v20[1] = v12;
  v13 = (void *)objc_claimAutoreleasedReturnValue([v9 passSerialNumber]);

  id v14 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForPassSerialNumber:v13]);
  v20[2] = v14;
  id v15 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForCatalogPID:a3]);
  v20[3] = v15;
  id v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v20, 4LL));
  v17 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v16));
  id v18 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v8 predicate:v17]);

  [v18 deleteAllEntities];
}

- (BOOL)deleteFromDatabase
{
  v2 = self;
  int64_t v3 = -[SQLiteEntity persistentID](self, "persistentID");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity database](v2, "database"));
  +[PaymentOfferCurrencyAmount deletePaymentOfferCurrencyAmountForInstallmentCriteriaPID:inDatabase:]( &OBJC_CLASS___PaymentOfferCurrencyAmount,  "deletePaymentOfferCurrencyAmountForInstallmentCriteriaPID:inDatabase:",  v3,  v4);
  +[PaymentOfferDynamicContentIcon deleteIconForInstallmentCriteriaPID:inDatabase:]( &OBJC_CLASS___PaymentOfferDynamicContentIcon,  "deleteIconForInstallmentCriteriaPID:inDatabase:",  v3,  v4);
  +[PaymentOfferAssociatedStoreIdentifier deletePaymentOfferCurrencyAmountForInstallmentCriteriaPID:inDatabase:]( &OBJC_CLASS___PaymentOfferAssociatedStoreIdentifier,  "deletePaymentOfferCurrencyAmountForInstallmentCriteriaPID:inDatabase:",  v3,  v4);
  +[PaymentOfferAssociatedWebDomain deletePaymentOfferAssociatedWebDomainsForInstallmentCriteriaPID:inDatabase:]( &OBJC_CLASS___PaymentOfferAssociatedWebDomain,  "deletePaymentOfferAssociatedWebDomainsForInstallmentCriteriaPID:inDatabase:",  v3,  v4);
  +[ApplyFooterContent deleteFooterContentWithInstallmentCriteriaPID:inDatabase:]( &OBJC_CLASS___ApplyFooterContent,  "deleteFooterContentWithInstallmentCriteriaPID:inDatabase:",  v3,  v4);
  v6.receiver = v2;
  v6.super_class = (Class)&OBJC_CLASS___PaymentOfferInstallmentCriteria;
  LOBYTE(v2) = -[SQLiteEntity deleteFromDatabase](&v6, "deleteFromDatabase");

  return (char)v2;
}

+ (id)criteriaIdentifierForFpanIdentifier:(id)a3 inDatabase:(id)a4
{
  if (a3)
  {
    id v6 = a4;
    v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForFpanIdentifier:a3]);
    id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v6 predicate:v7]);

    id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 criteriaIdentifier]);
  }

  else
  {
    id v9 = 0LL;
  }

  return v9;
}

+ (id)installmentCriteriaForCatalogPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForCatalogPID:a3]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v7]);

  id v9 = (void *)objc_claimAutoreleasedReturnValue([a1 _installmentCriteriaWithQuery:v8]);
  return v9;
}

+ (id)_installmentCriteriaWithQuery:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue([a1 _propertySetters]);
  id v6 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  v7 = (void *)objc_claimAutoreleasedReturnValue([v4 database]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v5 allKeys]);
  id v14 = _NSConcreteStackBlock;
  uint64_t v15 = 3221225472LL;
  id v16 = sub_10033C3E0;
  v17 = &unk_100638F18;
  id v21 = a1;
  id v18 = v5;
  id v19 = v7;
  id v9 = v6;
  id v20 = v9;
  id v10 = v7;
  id v11 = v5;
  [v4 enumeratePersistentIDsAndProperties:v8 usingBlock:&v14];

  if (-[NSMutableArray count](v9, "count", v14, v15, v16, v17)) {
    id v12 = -[NSMutableArray copy](v9, "copy");
  }
  else {
    id v12 = 0LL;
  }

  return v12;
}

- (id)criteriaIdentifier
{
  return -[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"a");
}

+ (id)_predicateForCatalogPID:(int64_t)a3
{
  int64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a3));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"c_pid",  v3));

  return v4;
}

+ (id)_predicateForIdentifier:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"a",  a3);
}

+ (id)_predicateForFpanIdentifier:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"t",  a3);
}

+ (id)_predicateForPassTypeIdentifier:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"e",  a3);
}

+ (id)_predicateForPassSerialNumber:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"d",  a3);
}

+ (id)_propertySetters
{
  v3[0] = @"a";
  v3[1] = @"b";
  v4[0] = &stru_100657BB8;
  v4[1] = &stru_100657BD8;
  v3[2] = @"c";
  v3[3] = @"d";
  v4[2] = &stru_100657BF8;
  v4[3] = &stru_100657C18;
  v3[4] = @"e";
  v3[5] = @"t";
  v4[4] = &stru_100657C38;
  v4[5] = &stru_100657C58;
  v3[6] = @"h";
  v3[7] = @"u";
  v4[6] = &stru_100657C78;
  v4[7] = &stru_100657C98;
  v3[8] = @"v";
  v3[9] = @"j";
  v4[8] = &stru_100657CB8;
  v4[9] = &stru_100657CD8;
  v3[10] = @"k";
  v3[11] = @"l";
  v4[10] = &stru_100657CF8;
  v4[11] = &stru_100657D18;
  v3[12] = @"m";
  v3[13] = @"x";
  v4[12] = &stru_100657D38;
  v4[13] = &stru_100657D58;
  v3[14] = @"r";
  v3[15] = @"s";
  v4[14] = &stru_100657D78;
  v4[15] = &stru_100657D98;
  v3[16] = @"w";
  v3[17] = @"y";
  v4[16] = &stru_100657DB8;
  v4[17] = &stru_100657DD8;
  v3[18] = @"has_preconfigured_offers";
  v3[19] = @"z";
  v4[18] = &stru_100657DF8;
  v4[19] = &stru_100657E18;
  v3[20] = @"aa";
  v3[21] = @"ab";
  v4[20] = &stru_100657E38;
  v4[21] = &stru_100657E58;
  v3[22] = @"localized_pay_in_full_subtitle_override";
  v4[22] = &stru_100657E78;
  return (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v4,  v3,  23LL));
}

+ (id)_commonDictionaryForInstallmentCriteria:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  v5 = (void *)objc_claimAutoreleasedReturnValue([v3 identifier]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v5, @"a");

  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v3 eligibility]));
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v6, @"b");

  v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v3 type]));
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v7, @"c");

  id v8 = (void *)objc_claimAutoreleasedReturnValue([v3 passSerialNumber]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v8, @"d");

  id v9 = (void *)objc_claimAutoreleasedReturnValue([v3 passTypeIdentifier]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v9, @"e");

  id v10 = (void *)objc_claimAutoreleasedReturnValue([v3 fpanIdentifier]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v10, @"t");

  id v11 = (void *)objc_claimAutoreleasedReturnValue([v3 supportedCurrencyCodes]);
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 allObjects]);
  v13 = (void *)objc_claimAutoreleasedReturnValue([v12 componentsJoinedByString:@","]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v13, @"h");

  id v14 = (void *)objc_claimAutoreleasedReturnValue([v3 supportedMerchantCountryCodes]);
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v14 allObjects]);
  id v16 = (void *)objc_claimAutoreleasedReturnValue([v15 componentsJoinedByString:@","]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v16, @"u");

  v17 = (void *)objc_claimAutoreleasedReturnValue([v3 supportedDeviceRegionCountryCodes]);
  id v18 = (void *)objc_claimAutoreleasedReturnValue([v17 allObjects]);
  id v19 = (void *)objc_claimAutoreleasedReturnValue([v18 componentsJoinedByString:@","]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v19, @"v");

  id v20 = (void *)objc_claimAutoreleasedReturnValue([v3 supportedLanguages]);
  id v21 = (void *)objc_claimAutoreleasedReturnValue([v20 componentsJoinedByString:@","]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v21, @"j");

  v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [v3 paymentNetworkIdentifier]));
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v22, @"k");

  v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v3 paymentMethodType]));
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v23, @"l");

  v24 = (void *)objc_claimAutoreleasedReturnValue([v3 programName]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v24, @"m");

  v25 = (void *)objc_claimAutoreleasedReturnValue([v3 issuerName]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v25, @"x");

  v26 = (void *)objc_claimAutoreleasedReturnValue([v3 associatedApplicationIdentifiers]);
  v27 = (void *)objc_claimAutoreleasedReturnValue([v26 allObjects]);
  v28 = (void *)objc_claimAutoreleasedReturnValue([v27 componentsJoinedByString:@","]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v28, @"r");

  v29 = (void *)objc_claimAutoreleasedReturnValue([v3 appLaunchURL]);
  v30 = (void *)_SQLValueForURL(v29);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v30, @"s");

  v31 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v3 requiresChallenge]));
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v31, @"w");

  v32 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v3 suppressPayInFull]));
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v32, @"y");

  v33 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v3 hasPreconfiguredOffers]));
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v33, @"has_preconfigured_offers");

  v34 = (void *)objc_claimAutoreleasedReturnValue([v3 localizedPayInFullTitleOverride]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v34, @"z");

  v35 = (void *)objc_claimAutoreleasedReturnValue([v3 localizedTitleOverride]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v35, @"aa");

  v36 = (void *)objc_claimAutoreleasedReturnValue([v3 localizedSubtitleOverride]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v36, @"ab");

  v37 = (void *)objc_claimAutoreleasedReturnValue([v3 localizedPayInFullSubtitleOverride]);
  -[NSMutableDictionary setObjectOrNull:forKey:]( v4,  "setObjectOrNull:forKey:",  v37,  @"localized_pay_in_full_subtitle_override");

  return v4;
}

@end
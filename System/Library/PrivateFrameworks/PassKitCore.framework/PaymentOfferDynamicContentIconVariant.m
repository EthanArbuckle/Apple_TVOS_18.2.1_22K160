@interface PaymentOfferDynamicContentIconVariant
+ (id)_commonDictionaryForIconVariant:(id)a3;
+ (id)_predicateForPID:(id)a3;
+ (id)databaseTable;
+ (id)iconVariantForPID:(id)a3 inDatabase:(id)a4;
+ (id)insertIconVariant:(id)a3 inDatabase:(id)a4;
+ (void)deleteIconVariantForPID:(id)a3 inDatabase:(id)a4;
- (id)iconVariant;
@end

@implementation PaymentOfferDynamicContentIconVariant

+ (id)databaseTable
{
  return @"payment_offer_dynamic_content_icon_variant";
}

+ (id)insertIconVariant:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v9 = objc_msgSend((id)objc_opt_class(a1, v8), "_commonDictionaryForIconVariant:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);

  id v11 = [objc_alloc((Class)a1) initWithPropertyValues:v10 inDatabase:v6];
  return v11;
}

+ (void)deleteIconVariantForPID:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v8 = (id)objc_claimAutoreleasedReturnValue([a1 _predicateForPID:a3]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v6 predicate:v8]);

  [v7 deleteFromDatabase];
}

+ (id)iconVariantForPID:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForPID:a3]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v6 predicate:v7]);

  return v8;
}

- (id)iconVariant
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"two_x"));
  v4 = (void *)_URLForSQLValue(v3);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"three_x"));
  id v6 = (void *)_URLForSQLValue(v5);

  id v7 = 0LL;
  if (v4 && v6)
  {
    id v7 = objc_alloc_init(&OBJC_CLASS___PKPaymentOfferDynamicContentIconVariant);
    [v7 setUrl2x:v4];
    [v7 setUrl3x:v6];
  }

  return v7;
}

+ (id)_predicateForPID:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"pid",  a3);
}

+ (id)_commonDictionaryForIconVariant:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  v5 = (void *)objc_claimAutoreleasedReturnValue([v3 url2x]);
  id v6 = (void *)_SQLValueForURL(v5);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v6, @"two_x");

  id v7 = (void *)objc_claimAutoreleasedReturnValue([v3 url3x]);
  id v8 = (void *)_SQLValueForURL(v7);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v8, @"three_x");

  return v4;
}

@end
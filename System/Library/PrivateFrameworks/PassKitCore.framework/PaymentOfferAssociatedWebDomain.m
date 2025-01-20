@interface PaymentOfferAssociatedWebDomain
+ (id)_commonDictionaryAssociatedWebDomain:(id)a3;
+ (id)_predicateForInstallmentCriteriaPID:(int64_t)a3;
+ (id)_webDomainsWithQuery:(id)a3;
+ (id)associatedWebDomainForInstallmentCriteriaPID:(int64_t)a3 inDatabase:(id)a4;
+ (id)databaseTable;
+ (void)deletePaymentOfferAssociatedWebDomainsForInstallmentCriteriaPID:(int64_t)a3 inDatabase:(id)a4;
+ (void)insertOrUpdateAssociatedWebDomains:(id)a3 forInstallmentCriteriaPID:(int64_t)a4 inDatabase:(id)a5;
@end

@implementation PaymentOfferAssociatedWebDomain

+ (id)databaseTable
{
  return @"cat";
}

+ (void)insertOrUpdateAssociatedWebDomains:(id)a3 forInstallmentCriteriaPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  [a1 deletePaymentOfferAssociatedWebDomainsForInstallmentCriteriaPID:a4 inDatabase:v9];
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  id obj = v8;
  id v10 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v10)
  {
    id v12 = v10;
    uint64_t v13 = *(void *)v20;
    do
    {
      v14 = 0LL;
      do
      {
        if (*(void *)v20 != v13) {
          objc_enumerationMutation(obj);
        }
        id v15 = objc_msgSend( (id)objc_opt_class(a1, v11),  "_commonDictionaryAssociatedWebDomain:",  *(void *)(*((void *)&v19 + 1) + 8 * (void)v14));
        v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
        v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a4));
        [v16 safelySetObject:v17 forKey:@"i_pid"];

        v14 = (char *)v14 + 1;
      }

      while (v12 != v14);
      id v12 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
    }

    while (v12);
  }
}

+ (void)deletePaymentOfferAssociatedWebDomainsForInstallmentCriteriaPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForInstallmentCriteriaPID:a3]);
  id v8 = (id)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v7]);

  [v8 deleteAllEntities];
}

+ (id)associatedWebDomainForInstallmentCriteriaPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForInstallmentCriteriaPID:a3]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v7]);

  id v9 = (void *)objc_claimAutoreleasedReturnValue([a1 _webDomainsWithQuery:v8]);
  return v9;
}

+ (id)_webDomainsWithQuery:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  id v9 = _NSConcreteStackBlock;
  uint64_t v10 = 3221225472LL;
  uint64_t v11 = sub_1003ACCF4;
  id v12 = &unk_10063BCB0;
  id v13 = (id)objc_claimAutoreleasedReturnValue([v3 database]);
  v5 = v4;
  v14 = v5;
  id v6 = v13;
  [v3 enumeratePersistentIDsUsingBlock:&v9];

  if (-[NSMutableSet count](v5, "count", v9, v10, v11, v12)) {
    id v7 = -[NSMutableSet copy](v5, "copy");
  }
  else {
    id v7 = 0LL;
  }

  return v7;
}

+ (id)_predicateForInstallmentCriteriaPID:(int64_t)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"i_pid",  v3));

  return v4;
}

+ (id)_commonDictionaryAssociatedWebDomain:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  v5 = (void *)_SQLValueForURL(v3);

  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v5, @"a");
  return v4;
}

@end
@interface PaymentOfferCatalog
+ (id)_commonDictionaryForPaymentOfferCatalog:(id)a3;
+ (id)_dbCatalogInDatabase:(id)a3;
+ (id)_propertySettersForCatalog;
+ (id)catalogInDatabase:(id)a3;
+ (id)databaseTable;
+ (void)deleteCatalogInDatabase:(id)a3;
+ (void)insertOrUpdateCatalog:(id)a3 inDatabase:(id)a4;
- (BOOL)deleteFromDatabase;
- (id)catalog;
@end

@implementation PaymentOfferCatalog

+ (id)databaseTable
{
  return @"elephant";
}

+ (void)insertOrUpdateCatalog:(id)a3 inDatabase:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [a1 deleteCatalogInDatabase:v7];
  if (v6)
  {
    id v9 = objc_msgSend((id)objc_opt_class(a1, v8), "_commonDictionaryForPaymentOfferCatalog:", v6);
    v19 = (void *)objc_claimAutoreleasedReturnValue(v9);
    id v18 = [objc_alloc((Class)a1) initWithPropertyValues:v19 inDatabase:v7];
    id v10 = [v18 persistentID];
    __int128 v20 = 0u;
    __int128 v21 = 0u;
    __int128 v22 = 0u;
    __int128 v23 = 0u;
    v11 = (void *)objc_claimAutoreleasedReturnValue([v6 catalog]);
    id v12 = [v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void *)v21;
      do
      {
        for (i = 0LL; i != v13; i = (char *)i + 1)
        {
          if (*(void *)v21 != v14) {
            objc_enumerationMutation(v11);
          }
          v16 = *(void **)(*((void *)&v20 + 1) + 8LL * (void)i);
          id v17 = [v16 type];
          if (v17 == (id)2)
          {
            +[PaymentOfferRewardsCriteria insertOrUpdateRewardsCriteria:forCatalogPID:inDatabase:]( &OBJC_CLASS___PaymentOfferRewardsCriteria,  "insertOrUpdateRewardsCriteria:forCatalogPID:inDatabase:",  v16,  v10,  v7);
          }

          else if (v17 == (id)1)
          {
            +[PaymentOfferInstallmentCriteria insertOrUpdateInstallmentCriteria:forCatalogPID:inDatabase:]( &OBJC_CLASS___PaymentOfferInstallmentCriteria,  "insertOrUpdateInstallmentCriteria:forCatalogPID:inDatabase:",  v16,  v10,  v7);
          }
        }

        id v13 = [v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }

      while (v13);
    }
  }
}

+ (void)deleteCatalogInDatabase:(id)a3
{
  id v3 = (id)objc_claimAutoreleasedReturnValue([a1 _dbCatalogInDatabase:a3]);
  [v3 deleteFromDatabase];
}

+ (id)_dbCatalogInDatabase:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[SQLiteBooleanPredicate truePredicate](&OBJC_CLASS___SQLiteBooleanPredicate, "truePredicate"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v4 predicate:v5]);

  return v6;
}

- (BOOL)deleteFromDatabase
{
  v2 = self;
  int64_t v3 = -[SQLiteEntity persistentID](self, "persistentID");
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity database](v2, "database"));
  +[PaymentOfferInstallmentCriteria deletePaymentOfferInstallmentCriteriaForCatalogPID:inDatabase:]( &OBJC_CLASS___PaymentOfferInstallmentCriteria,  "deletePaymentOfferInstallmentCriteriaForCatalogPID:inDatabase:",  v3,  v4);
  +[PaymentOfferRewardsCriteria deletePaymentOfferRewardsCriteriaForCatalogPID:inDatabase:]( &OBJC_CLASS___PaymentOfferRewardsCriteria,  "deletePaymentOfferRewardsCriteriaForCatalogPID:inDatabase:",  v3,  v4);
  v6.receiver = v2;
  v6.super_class = (Class)&OBJC_CLASS___PaymentOfferCatalog;
  LOBYTE(v2) = -[SQLiteEntity deleteFromDatabase](&v6, "deleteFromDatabase");

  return (char)v2;
}

+ (id)catalogInDatabase:(id)a3
{
  int64_t v3 = (void *)objc_claimAutoreleasedReturnValue([a1 _dbCatalogInDatabase:a3]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 catalog]);

  return v4;
}

+ (id)_propertySettersForCatalog
{
  int64_t v3 = @"a";
  id v4 = &stru_10064D458;
  return (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v4,  &v3,  1LL));
}

- (id)catalog
{
  int64_t v3 = objc_alloc_init(&OBJC_CLASS___PKPaymentOfferCatalog);
  id v5 = objc_msgSend((id)objc_opt_class(self, v4), "_propertySettersForCatalog");
  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 allKeys]);
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_10020CCD4;
  v18[3] = &unk_100638EF0;
  v18[4] = self;
  id v8 = v6;
  id v19 = v8;
  id v9 = v3;
  __int128 v20 = v9;
  -[SQLiteEntity getValuesForProperties:withApplier:](self, "getValuesForProperties:withApplier:", v7, v18);

  int64_t v10 = -[SQLiteEntity persistentID](self, "persistentID");
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity database](self, "database"));
  id v12 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  id v13 = (void *)objc_claimAutoreleasedReturnValue( +[PaymentOfferInstallmentCriteria installmentCriteriaForCatalogPID:inDatabase:]( &OBJC_CLASS___PaymentOfferInstallmentCriteria,  "installmentCriteriaForCatalogPID:inDatabase:",  v10,  v11));
  -[NSMutableArray pk_safelyAddObjectsFromArray:](v12, "pk_safelyAddObjectsFromArray:", v13);

  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( +[PaymentOfferRewardsCriteria rewardsCriteriaForCatalogPID:inDatabase:]( &OBJC_CLASS___PaymentOfferRewardsCriteria,  "rewardsCriteriaForCatalogPID:inDatabase:",  v10,  v11));
  -[NSMutableArray pk_safelyAddObjectsFromArray:](v12, "pk_safelyAddObjectsFromArray:", v14);

  if (-[NSMutableArray count](v12, "count"))
  {
    id v15 = -[NSMutableArray copy](v12, "copy");
    -[PKPaymentOfferCatalog setCatalog:](v9, "setCatalog:", v15);
  }

  else
  {
    -[PKPaymentOfferCatalog setCatalog:](v9, "setCatalog:", 0LL);
  }

  v16 = v9;

  return v16;
}

+ (id)_commonDictionaryForPaymentOfferCatalog:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 lastUpdated]);

  objc_super v6 = (void *)_SQLValueForDate(v5);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v6, @"a");

  return v4;
}

@end
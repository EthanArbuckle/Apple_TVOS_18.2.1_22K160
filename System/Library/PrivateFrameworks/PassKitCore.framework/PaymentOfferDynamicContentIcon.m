@interface PaymentOfferDynamicContentIcon
+ (id)_predicateForInstallmentCriteriaPID:(int64_t)a3;
+ (id)databaseTable;
+ (id)iconForInstallmentCriteriaPID:(int64_t)a3 inDatabase:(id)a4;
+ (void)deleteIconForInstallmentCriteriaPID:(int64_t)a3 inDatabase:(id)a4;
+ (void)insertOrUpdateIcon:(id)a3 forInstallmentCriteriaPID:(int64_t)a4 inDatabase:(id)a5;
- (BOOL)deleteFromDatabase;
- (id)darkVariant;
- (id)defaultVariant;
- (id)icon;
- (id)lightVariant;
@end

@implementation PaymentOfferDynamicContentIcon

+ (id)databaseTable
{
  return @"giraffe";
}

+ (void)insertOrUpdateIcon:(id)a3 forInstallmentCriteriaPID:(int64_t)a4 inDatabase:(id)a5
{
  id v21 = a3;
  id v8 = a5;
  [a1 deleteIconForInstallmentCriteriaPID:a4 inDatabase:v8];
  if (v21)
  {
    v9 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a4));
    -[NSMutableDictionary safelySetObject:forKey:](v9, "safelySetObject:forKey:", v10, @"i_pid");

    id v11 = [objc_alloc((Class)a1) initWithPropertyValues:v9 inDatabase:v8];
    v12 = (void *)objc_claimAutoreleasedReturnValue([v21 defaultVariant]);
    if (v12)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue( +[PaymentOfferDynamicContentIconVariant insertIconVariant:inDatabase:]( &OBJC_CLASS___PaymentOfferDynamicContentIconVariant,  "insertIconVariant:inDatabase:",  v12,  v8));
      v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithLongLong:]( NSNumber,  "numberWithLongLong:",  [v13 persistentID]));
      [v11 setValue:v14 forProperty:@"default_variant"];
    }

    v15 = (void *)objc_claimAutoreleasedReturnValue([v21 lightVariant]);
    if (v15)
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue( +[PaymentOfferDynamicContentIconVariant insertIconVariant:inDatabase:]( &OBJC_CLASS___PaymentOfferDynamicContentIconVariant,  "insertIconVariant:inDatabase:",  v15,  v8));
      v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithLongLong:]( NSNumber,  "numberWithLongLong:",  [v16 persistentID]));
      [v11 setValue:v17 forProperty:@"light_variant"];
    }

    v18 = (void *)objc_claimAutoreleasedReturnValue([v21 darkVariant]);
    if (v18)
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue( +[PaymentOfferDynamicContentIconVariant insertIconVariant:inDatabase:]( &OBJC_CLASS___PaymentOfferDynamicContentIconVariant,  "insertIconVariant:inDatabase:",  v18,  v8));
      v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithLongLong:]( NSNumber,  "numberWithLongLong:",  [v19 persistentID]));
      [v11 setValue:v20 forProperty:@"dark_variant"];
    }
  }
}

+ (void)deleteIconForInstallmentCriteriaPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForInstallmentCriteriaPID:a3]);
  id v8 = (id)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v7]);

  [v8 deleteAllEntities];
}

- (BOOL)deleteFromDatabase
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity database](self, "database"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"default_variant"));
  +[PaymentOfferDynamicContentIconVariant deleteIconVariantForPID:inDatabase:]( &OBJC_CLASS___PaymentOfferDynamicContentIconVariant,  "deleteIconVariantForPID:inDatabase:",  v4,  v3);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"light_variant"));
  if (v5) {
    +[PaymentOfferDynamicContentIconVariant deleteIconVariantForPID:inDatabase:]( &OBJC_CLASS___PaymentOfferDynamicContentIconVariant,  "deleteIconVariantForPID:inDatabase:",  v5,  v3);
  }
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"dark_variant"));
  if (v6) {
    +[PaymentOfferDynamicContentIconVariant deleteIconVariantForPID:inDatabase:]( &OBJC_CLASS___PaymentOfferDynamicContentIconVariant,  "deleteIconVariantForPID:inDatabase:",  v6,  v3);
  }
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___PaymentOfferDynamicContentIcon;
  BOOL v7 = -[SQLiteEntity deleteFromDatabase](&v9, "deleteFromDatabase");

  return v7;
}

+ (id)iconForInstallmentCriteriaPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForInstallmentCriteriaPID:a3]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v6 predicate:v7]);

  objc_super v9 = (void *)objc_claimAutoreleasedReturnValue([v8 icon]);
  return v9;
}

- (id)icon
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PaymentOfferDynamicContentIcon defaultVariant](self, "defaultVariant"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 iconVariant]);

  if (v4)
  {
    id v5 = objc_alloc_init(&OBJC_CLASS___PKPaymentOfferDynamicContentIcon);
    [v5 setDefaultVariant:v4];
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[PaymentOfferDynamicContentIcon lightVariant](self, "lightVariant"));
    BOOL v7 = (void *)objc_claimAutoreleasedReturnValue([v6 iconVariant]);
    [v5 setLightVariant:v7];

    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[PaymentOfferDynamicContentIcon darkVariant](self, "darkVariant"));
    objc_super v9 = (void *)objc_claimAutoreleasedReturnValue([v8 iconVariant]);
    [v5 setDarkVariant:v9];
  }

  else
  {
    id v5 = 0LL;
  }

  return v5;
}

- (id)defaultVariant
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"default_variant"));
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity database](self, "database"));
    id v5 = (void *)objc_claimAutoreleasedReturnValue( +[PaymentOfferDynamicContentIconVariant iconVariantForPID:inDatabase:]( &OBJC_CLASS___PaymentOfferDynamicContentIconVariant,  "iconVariantForPID:inDatabase:",  v3,  v4));
  }

  else
  {
    id v5 = 0LL;
  }

  return v5;
}

- (id)lightVariant
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"light_variant"));
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity database](self, "database"));
    id v5 = (void *)objc_claimAutoreleasedReturnValue( +[PaymentOfferDynamicContentIconVariant iconVariantForPID:inDatabase:]( &OBJC_CLASS___PaymentOfferDynamicContentIconVariant,  "iconVariantForPID:inDatabase:",  v3,  v4));
  }

  else
  {
    id v5 = 0LL;
  }

  return v5;
}

- (id)darkVariant
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"dark_variant"));
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity database](self, "database"));
    id v5 = (void *)objc_claimAutoreleasedReturnValue( +[PaymentOfferDynamicContentIconVariant iconVariantForPID:inDatabase:]( &OBJC_CLASS___PaymentOfferDynamicContentIconVariant,  "iconVariantForPID:inDatabase:",  v3,  v4));
  }

  else
  {
    id v5 = 0LL;
  }

  return v5;
}

+ (id)_predicateForInstallmentCriteriaPID:(int64_t)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"i_pid",  v3));

  return v4;
}

@end
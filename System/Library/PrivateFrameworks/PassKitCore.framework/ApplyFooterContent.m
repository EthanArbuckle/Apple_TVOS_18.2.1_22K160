@interface ApplyFooterContent
+ (id)_predicateForInstallmentCriteriaPID:(int64_t)a3;
+ (id)_predicateForType:(unint64_t)a3 installmentCriteriaPID:(int64_t)a4;
+ (id)_propertySettersForFooterContent;
+ (id)_propertyValuesForFooterContent:(id)a3 type:(unint64_t)a4;
+ (id)databaseTable;
+ (id)footerContentForType:(unint64_t)a3 installmentCriteriaPID:(int64_t)a4 inDatabase:(id)a5;
+ (id)insertOrUpdateWithFooterContent:(id)a3 type:(unint64_t)a4 installmentCriteriaPID:(int64_t)a5 inDatabase:(id)a6;
+ (void)deleteFooterContentWithInstallmentCriteriaPID:(int64_t)a3 inDatabase:(id)a4;
+ (void)deleteFooterContentWithType:(unint64_t)a3 installmentCriteriaPID:(int64_t)a4 inDatabase:(id)a5;
- (ApplyFooterContent)initWithFooterContent:(id)a3 type:(unint64_t)a4 installmentCriteriaPID:(int64_t)a5 inDatabase:(id)a6;
- (BOOL)deleteFromDatabase;
- (id)footerContent;
@end

@implementation ApplyFooterContent

+ (id)databaseTable
{
  return @"footer_content";
}

+ (id)insertOrUpdateWithFooterContent:(id)a3 type:(unint64_t)a4 installmentCriteriaPID:(int64_t)a5 inDatabase:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  [a1 deleteFooterContentWithType:a4 installmentCriteriaPID:a5 inDatabase:v11];
  if (v10)
  {
    id v12 = [objc_alloc((Class)a1) initWithFooterContent:v10 type:a4 installmentCriteriaPID:a5 inDatabase:v11];
    +[ApplyFooterContentLink deleteAllFooterContentLinksWithFooterContentPID:inDatabase:]( ApplyFooterContentLink,  "deleteAllFooterContentLinksWithFooterContentPID:inDatabase:",  [v12 persistentID],  v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue([v10 links]);
    +[ApplyFooterContentLink insertFooterContentLinks:withFooterContentPID:inDatabase:]( ApplyFooterContentLink,  "insertFooterContentLinks:withFooterContentPID:inDatabase:",  v13,  [v12 persistentID],  v11);
  }

  else
  {
    id v12 = 0LL;
  }

  return v12;
}

- (ApplyFooterContent)initWithFooterContent:(id)a3 type:(unint64_t)a4 installmentCriteriaPID:(int64_t)a5 inDatabase:(id)a6
{
  id v10 = a6;
  id v11 = a3;
  id v13 = objc_msgSend((id)objc_opt_class(self, v12), "_propertyValuesForFooterContent:type:", v11, a4);
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a5));
  [v14 setObjectOrNull:v15 forKey:@"installment_criteria_pid"];

  v16 = -[SQLiteEntity initWithPropertyValues:inDatabase:](self, "initWithPropertyValues:inDatabase:", v14, v10);
  return v16;
}

+ (id)footerContentForType:(unint64_t)a3 installmentCriteriaPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a5;
  v9 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForType:a3 installmentCriteriaPID:a4]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v8 predicate:v9]);

  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 footerContent]);
  return v11;
}

+ (void)deleteFooterContentWithInstallmentCriteriaPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForInstallmentCriteriaPID:a3]);
  id v8 = (id)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v6 predicate:v7]);

  [v8 deleteFromDatabase];
}

+ (void)deleteFooterContentWithType:(unint64_t)a3 installmentCriteriaPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a5;
  v9 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForType:a3 installmentCriteriaPID:a4]);
  id v10 = (id)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v8 predicate:v9]);

  [v10 deleteFromDatabase];
}

- (BOOL)deleteFromDatabase
{
  int64_t v3 = -[SQLiteEntity persistentID](self, "persistentID");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity database](self, "database"));
  +[ApplyFooterContentLink deleteAllFooterContentLinksWithFooterContentPID:inDatabase:]( &OBJC_CLASS___ApplyFooterContentLink,  "deleteAllFooterContentLinksWithFooterContentPID:inDatabase:",  v3,  v4);

  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___ApplyFooterContent;
  return -[SQLiteEntity deleteFromDatabase](&v6, "deleteFromDatabase");
}

+ (id)_predicateForInstallmentCriteriaPID:(int64_t)a3
{
  int64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"installment_criteria_pid",  v3));

  return v4;
}

+ (id)_predicateForType:(unint64_t)a3 installmentCriteriaPID:(int64_t)a4
{
  v5 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForInstallmentCriteriaPID:a4]);
  v11[0] = v5;
  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a3));
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"type",  v6));
  v11[1] = v7;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v11, 2LL));
  v9 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v8));

  return v9;
}

- (id)footerContent
{
  int64_t v3 = objc_alloc_init(&OBJC_CLASS___PKApplyFooterContent);
  id v5 = objc_msgSend((id)objc_opt_class(self, v4), "_propertySettersForFooterContent");
  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 allKeys]);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_10015240C;
  v15[3] = &unk_100638EF0;
  v15[4] = self;
  id v16 = v6;
  id v8 = v3;
  v17 = v8;
  id v9 = v6;
  -[SQLiteEntity getValuesForProperties:withApplier:](self, "getValuesForProperties:withApplier:", v7, v15);

  int64_t v10 = -[SQLiteEntity persistentID](self, "persistentID");
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity database](self, "database"));
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( +[ApplyFooterContentLink linksForFooterContentPID:inDatabase:]( &OBJC_CLASS___ApplyFooterContentLink,  "linksForFooterContentPID:inDatabase:",  v10,  v11));

  -[PKApplyFooterContent setLinks:](v8, "setLinks:", v12);
  id v13 = v8;

  return v13;
}

+ (id)_propertyValuesForFooterContent:(id)a3 type:(unint64_t)a4
{
  id v5 = a3;
  objc_super v6 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  v7 = (void *)objc_claimAutoreleasedReturnValue([v5 footerText]);

  -[NSMutableDictionary setObjectOrNull:forKey:](v6, "setObjectOrNull:forKey:", v7, @"footer_text");
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a4));
  -[NSMutableDictionary setObjectOrNull:forKey:](v6, "setObjectOrNull:forKey:", v8, @"type");

  return v6;
}

+ (id)_propertySettersForFooterContent
{
  int64_t v3 = @"footer_text";
  uint64_t v4 = &stru_1006463D8;
  return (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v4,  &v3,  1LL));
}

@end
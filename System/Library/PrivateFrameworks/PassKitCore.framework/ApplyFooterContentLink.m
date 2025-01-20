@interface ApplyFooterContentLink
+ (id)_linksWithQuery:(id)a3;
+ (id)_predicateForFooterContentPID:(int64_t)a3;
+ (id)_propertySettersForFooterContentLink;
+ (id)_propertyValuesForFooterContentLink:(id)a3;
+ (id)databaseTable;
+ (id)linksForFooterContentPID:(int64_t)a3 inDatabase:(id)a4;
+ (void)deleteAllFooterContentLinksWithFooterContentPID:(int64_t)a3 inDatabase:(id)a4;
+ (void)insertFooterContentLinks:(id)a3 withFooterContentPID:(int64_t)a4 inDatabase:(id)a5;
- (ApplyFooterContentLink)initWithFooterContentLink:(id)a3 footerContentPID:(int64_t)a4 inDatabase:(id)a5;
@end

@implementation ApplyFooterContentLink

+ (id)databaseTable
{
  return @"footer_content_link";
}

+ (void)insertFooterContentLinks:(id)a3 withFooterContentPID:(int64_t)a4 inDatabase:(id)a5
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_1003003FC;
  v8[3] = &unk_100642030;
  id v11 = a1;
  int64_t v12 = a4;
  id v9 = a3;
  id v10 = a5;
  id v6 = v10;
  id v7 = v9;
  sub_1002CCC5C((uint64_t)v6, v8);
}

- (ApplyFooterContentLink)initWithFooterContentLink:(id)a3 footerContentPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v11 = objc_msgSend((id)objc_opt_class(self, v10), "_propertyValuesForFooterContentLink:", v9);
  int64_t v12 = (void *)objc_claimAutoreleasedReturnValue(v11);

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a4));
  [v12 setObjectOrNull:v13 forKey:@"footer_content_pid"];

  v14 = -[SQLiteEntity initWithPropertyValues:inDatabase:](self, "initWithPropertyValues:inDatabase:", v12, v8);
  return v14;
}

+ (void)deleteAllFooterContentLinksWithFooterContentPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForFooterContentPID:a3]);
  id v8 = (id)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v7]);

  [v8 deleteAllEntities];
}

+ (id)_predicateForFooterContentPID:(int64_t)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"footer_content_pid",  v3));

  return v4;
}

+ (id)linksForFooterContentPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForFooterContentPID:a3]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v7]);

  id v9 = (void *)objc_claimAutoreleasedReturnValue([a1 _linksWithQuery:v8]);
  return v9;
}

+ (id)_linksWithQuery:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue([a1 _propertySettersForFooterContentLink]);
  id v6 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 allKeys]);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_100300814;
  v12[3] = &unk_100639BF0;
  id v15 = a1;
  id v13 = v5;
  id v8 = v6;
  v14 = v8;
  id v9 = v5;
  [v4 enumeratePersistentIDsAndProperties:v7 usingBlock:v12];

  if (-[NSMutableArray count](v8, "count")) {
    id v10 = -[NSMutableArray copy](v8, "copy");
  }
  else {
    id v10 = 0LL;
  }

  return v10;
}

+ (id)_propertyValuesForFooterContentLink:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  v5 = (void *)objc_claimAutoreleasedReturnValue([v3 linkText]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v5, @"link_text");

  id v6 = (void *)objc_claimAutoreleasedReturnValue([v3 linkURL]);
  id v7 = (void *)_SQLValueForURL(v6);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v7, @"link_url");

  id v8 = (void *)objc_claimAutoreleasedReturnValue([v3 termsIdentifier]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v8, @"terms_identifier");

  id v9 = (void *)objc_claimAutoreleasedReturnValue([v3 analyticsIdentifier]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v9, @"analytics_identifier");

  return v4;
}

+ (id)_propertySettersForFooterContentLink
{
  v3[0] = @"link_text";
  v3[1] = @"link_url";
  v4[0] = &stru_100655B20;
  v4[1] = &stru_100655B40;
  v3[2] = @"terms_identifier";
  v3[3] = @"analytics_identifier";
  v4[2] = &stru_100655B60;
  v4[3] = &stru_100655B80;
  return (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v4,  v3,  4LL));
}

@end
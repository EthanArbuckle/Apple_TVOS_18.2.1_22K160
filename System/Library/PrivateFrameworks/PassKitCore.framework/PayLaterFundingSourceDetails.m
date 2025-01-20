@interface PayLaterFundingSourceDetails
+ (id)_detailsForType:(unint64_t)a3;
+ (id)_predicateForPID:(id)a3;
+ (id)_propertySettersForAccountSourceDetails;
+ (id)_propertySettersForBankSourceDetails;
+ (id)_propertySettersForFundingSourceType:(unint64_t)a3;
+ (id)_propertySettersForPaymentPassSourceDetails;
+ (id)_propertyValuesForFundingSourceDetails:(id)a3;
+ (id)anyInDatabase:(id)a3 forPID:(id)a4;
+ (id)databaseTable;
+ (id)insertFundingSourceDetails:(id)a3 inDatabase:(id)a4;
- (PayLaterFundingSourceDetails)initWithFundingSourceDetails:(id)a3 inDatabase:(id)a4;
- (id)fundingSourceDetails;
- (unint64_t)type;
- (void)updateFundingSourceDetails:(id)a3;
@end

@implementation PayLaterFundingSourceDetails

+ (id)databaseTable
{
  return @"chikoo";
}

- (PayLaterFundingSourceDetails)initWithFundingSourceDetails:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v9 = objc_msgSend((id)objc_opt_class(self, v8), "_propertyValuesForFundingSourceDetails:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);

  id v11 = [v10 mutableCopy];
  v12 = -[SQLiteEntity initWithPropertyValues:inDatabase:](self, "initWithPropertyValues:inDatabase:", v11, v6);

  return v12;
}

+ (id)insertFundingSourceDetails:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [objc_alloc((Class)a1) initWithFundingSourceDetails:v7 inDatabase:v6];

  return v8;
}

- (void)updateFundingSourceDetails:(id)a3
{
  id v4 = a3;
  id v6 = objc_msgSend((id)objc_opt_class(self, v5), "_propertyValuesForFundingSourceDetails:", v4);
  id v7 = (id)objc_claimAutoreleasedReturnValue(v6);

  -[SQLiteEntity setValuesWithDictionary:](self, "setValuesWithDictionary:", v7);
}

+ (id)anyInDatabase:(id)a3 forPID:(id)a4
{
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForPID:a4]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v6 predicate:v7]);

  return v8;
}

- (id)fundingSourceDetails
{
  unint64_t v3 = -[PayLaterFundingSourceDetails type](self, "type");
  id v5 = objc_msgSend((id)objc_opt_class(self, v4), "_detailsForType:", v3);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  id v8 = objc_msgSend((id)objc_opt_class(self, v7), "_propertySettersForFundingSourceType:", v3);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v10 = v9;
  if (v6 && v9)
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v9 allKeys]);
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_1002F9760;
    v13[3] = &unk_100638EF0;
    v13[4] = self;
    id v14 = v10;
    id v15 = v6;
    -[SQLiteEntity getValuesForProperties:withApplier:](self, "getValuesForProperties:withApplier:", v11, v13);
  }

  return v6;
}

- (unint64_t)type
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"a"));
  id v3 = [v2 integerValue];

  return (unint64_t)v3;
}

+ (id)_predicateForPID:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"pid",  a3);
}

+ (id)_detailsForType:(unint64_t)a3
{
  if (a3 - 1 > 2) {
    return 0LL;
  }
  else {
    return objc_alloc_init((Class)*(&off_100655740)[a3 - 1]);
  }
}

+ (id)_propertyValuesForFundingSourceDetails:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  -[NSMutableDictionary setInteger:forKey:](v4, "setInteger:forKey:", [v3 type], @"a");
  id v5 = [v3 type];
  if (v5 == (id)3) {
    goto LABEL_4;
  }
  if (v5 == (id)2)
  {
    id v12 = v3;
    v13 = (void *)objc_claimAutoreleasedReturnValue([v12 accountNumberSuffix]);
    -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v13, @"h");

    id v14 = (void *)objc_claimAutoreleasedReturnValue([v12 bankName]);
    -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v14, @"i");

    id v15 = (void *)objc_claimAutoreleasedReturnValue([v12 identifier]);
    -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v15, @"k");

    goto LABEL_6;
  }

  if (v5 == (id)1)
  {
LABEL_4:
    id v6 = v3;
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 dpanIdentifier]);
    -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v7, @"b");

    id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 fpanIdentifier]);
    -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v8, @"c");

    id v9 = (void *)objc_claimAutoreleasedReturnValue([v6 cardName]);
    -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v9, @"d");

    v10 = (void *)objc_claimAutoreleasedReturnValue([v6 cardSuffix]);
    -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v10, @"e");

    -[NSMutableDictionary setInteger:forKey:](v4, "setInteger:forKey:", [v6 cardType], @"f");
    id v11 = [v6 cardNetwork];

    -[NSMutableDictionary setInteger:forKey:](v4, "setInteger:forKey:", v11, @"g");
  }

+ (id)_propertySettersForFundingSourceType:(unint64_t)a3
{
  if (a3 != 3)
  {
    if (a3 == 2)
    {
      id v3 = (void *)objc_claimAutoreleasedReturnValue([a1 _propertySettersForBankSourceDetails]);
      return v3;
    }

    if (a3 != 1)
    {
      id v3 = 0LL;
      return v3;
    }
  }

  id v3 = (void *)objc_claimAutoreleasedReturnValue([a1 _propertySettersForPaymentPassSourceDetails]);
  return v3;
}

+ (id)_propertySettersForPaymentPassSourceDetails
{
  v3[0] = @"a";
  v3[1] = @"b";
  v4[0] = &stru_100655560;
  v4[1] = &stru_100655580;
  v3[2] = @"c";
  v3[3] = @"d";
  v4[2] = &stru_1006555A0;
  v4[3] = &stru_1006555C0;
  v3[4] = @"e";
  v3[5] = @"f";
  v4[4] = &stru_1006555E0;
  v4[5] = &stru_100655600;
  v3[6] = @"g";
  v4[6] = &stru_100655620;
  return (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v4,  v3,  7LL));
}

+ (id)_propertySettersForBankSourceDetails
{
  v3[0] = @"a";
  v3[1] = @"h";
  v4[0] = &stru_100655660;
  v4[1] = &stru_100655680;
  v3[2] = @"i";
  v3[3] = @"k";
  v4[2] = &stru_1006556A0;
  v4[3] = &stru_1006556C0;
  return (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v4,  v3,  4LL));
}

+ (id)_propertySettersForAccountSourceDetails
{
  v3[0] = @"a";
  v3[1] = @"j";
  v4[0] = &stru_100655700;
  v4[1] = &stru_100655720;
  return (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v4,  v3,  2LL));
}

@end
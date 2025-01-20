@interface TapToRadarPrompt
+ (id)_predicateForReason:(id)a3;
+ (id)_propertySetters;
+ (id)databaseTable;
+ (id)insertOrUpdateWithReason:(id)a3 lastPromptDate:(id)a4 inDatabase:(id)a5;
+ (id)tapToRadarPromptWithReason:(id)a3 inDatabase:(id)a4;
- (TapToRadarPrompt)initWithReason:(id)a3 lastPromptDate:(id)a4 inDatabase:(id)a5;
- (id)tapToRadarPrompt;
- (void)updateWithLastPromptDate:(id)a3;
@end

@implementation TapToRadarPrompt

+ (id)databaseTable
{
  return @"tap_to_radar_prompt";
}

+ (id)tapToRadarPromptWithReason:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForReason:a3]);
  v8 = (void *)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v6 predicate:v7]);

  return v8;
}

+ (id)insertOrUpdateWithReason:(id)a3 lastPromptDate:(id)a4 inDatabase:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = 0LL;
  if (v8 && v9)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForReason:v8]);
    id v11 = (id)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v10 predicate:v12]);

    uint64_t Object = PKLogFacilityTypeGetObject(0LL);
    v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
    if (v11)
    {
      if (v15)
      {
        int v17 = 138412546;
        id v18 = v8;
        __int16 v19 = 2112;
        id v20 = v9;
        _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Updating tap to radar prompt %@ with last prompt date %@",  (uint8_t *)&v17,  0x16u);
      }

      [v11 updateWithLastPromptDate:v9];
    }

    else
    {
      if (v15)
      {
        int v17 = 138412546;
        id v18 = v8;
        __int16 v19 = 2112;
        id v20 = v9;
        _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Inserting new tap to radar prompt %@ with last prompt date %@",  (uint8_t *)&v17,  0x16u);
      }

      id v11 = [objc_alloc((Class)a1) initWithReason:v8 lastPromptDate:v9 inDatabase:v10];
    }
  }

  return v11;
}

- (TapToRadarPrompt)initWithReason:(id)a3 lastPromptDate:(id)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  -[NSMutableDictionary setObjectOrNull:forKey:](v11, "setObjectOrNull:forKey:", v10, @"reason");

  v12 = (void *)_SQLValueForDate(v9);
  -[NSMutableDictionary setObjectOrNull:forKey:](v11, "setObjectOrNull:forKey:", v12, @"last_prompt_date");

  -[NSMutableDictionary setInteger:forKey:](v11, "setInteger:forKey:", 1LL, @"prompt_count");
  v13 = -[SQLiteEntity initWithPropertyValues:inDatabase:](self, "initWithPropertyValues:inDatabase:", v11, v8);

  v14 = v13;
  return v14;
}

- (void)updateWithLastPromptDate:(id)a3
{
  id v4 = a3;
  id v10 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  v5 = (void *)_SQLValueForDate(v4);

  -[NSMutableDictionary setObjectOrNull:forKey:](v10, "setObjectOrNull:forKey:", v5, @"last_prompt_date");
  id v6 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue(-[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"prompt_count"));
  if (!v6
    || (v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDecimalNumber notANumber](&OBJC_CLASS___NSDecimalNumber, "notANumber")),
        int v8 = PKEqualObjects(v6, v7),
        v7,
        v8))
  {

    id v6 = &off_100690518;
  }

  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  (char *)[v6 integerValue] + 1));
  -[NSMutableDictionary setObjectOrNull:forKey:](v10, "setObjectOrNull:forKey:", v9, @"prompt_count");

  -[SQLiteEntity setValuesWithDictionary:](self, "setValuesWithDictionary:", v10);
}

- (id)tapToRadarPrompt
{
  v3 = objc_alloc_init(&OBJC_CLASS___PKTapToRadarPrompt);
  id v5 = objc_msgSend((id)objc_opt_class(self, v4), "_propertySetters");
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 allKeys]);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_10026FD44;
  v13[3] = &unk_100638EF0;
  v13[4] = self;
  id v14 = v6;
  int v8 = v3;
  BOOL v15 = v8;
  id v9 = v6;
  -[SQLiteEntity getValuesForProperties:withApplier:](self, "getValuesForProperties:withApplier:", v7, v13);

  id v10 = v15;
  id v11 = v8;

  return v11;
}

+ (id)_predicateForReason:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"reason",  a3);
}

+ (id)_propertySetters
{
  v3[0] = @"reason";
  v3[1] = @"last_prompt_date";
  v4[0] = &stru_100650A78;
  v4[1] = &stru_100650A98;
  v3[2] = @"prompt_count";
  v4[2] = &stru_100650AB8;
  return (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v4,  v3,  3LL));
}

@end
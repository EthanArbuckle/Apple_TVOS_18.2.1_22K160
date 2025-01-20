@interface Group
+ (id)_propertySettersForAutomaticGroup;
+ (id)_updateDictionaryWithAutomaticGroup:(id)a3;
+ (id)databaseTable;
+ (id)insertAutomaticGroup:(id)a3 inDatabase:(id)a4;
- (id)automaticGroup;
- (id)sortedPassUniqueIdentifiers;
- (unint64_t)order;
- (void)updateWithAutomaticGroup:(id)a3;
- (void)updateWithOrder:(unint64_t)a3;
@end

@implementation Group

+ (id)databaseTable
{
  return @"pass_group";
}

+ (id)insertAutomaticGroup:(id)a3 inDatabase:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = (char *)objc_claimAutoreleasedReturnValue(+[SQLiteEntity anyInDatabase:predicate:](&OBJC_CLASS___Group, "anyInDatabase:predicate:", v5, 0LL));

  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteEntity maxValueForProperty:predicate:database:]( &OBJC_CLASS___Group,  "maxValueForProperty:predicate:database:",  @"group_order",  0LL,  v5));
    v7 = (char *)[v8 unsignedIntegerValue] + 1;
  }

  v9 = objc_alloc(&OBJC_CLASS___Group);
  v10 = (void *)objc_claimAutoreleasedReturnValue( +[Group _updateDictionaryWithAutomaticGroup:]( &OBJC_CLASS___Group,  "_updateDictionaryWithAutomaticGroup:",  v6));

  v11 = -[SQLiteEntity initWithPropertyValues:inDatabase:](v9, "initWithPropertyValues:inDatabase:", v10, v5);
  -[Group updateWithOrder:](v11, "updateWithOrder:", v7);

  return v11;
}

- (void)updateWithAutomaticGroup:(id)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue( +[Group _updateDictionaryWithAutomaticGroup:]( &OBJC_CLASS___Group,  "_updateDictionaryWithAutomaticGroup:",  a3));
  -[SQLiteEntity setValuesWithDictionary:](self, "setValuesWithDictionary:", v4);
}

- (void)updateWithOrder:(unint64_t)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a3));
  -[SQLiteEntity setValue:forProperty:](self, "setValue:forProperty:", v4, @"group_order");
}

- (unint64_t)order
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"group_order"));
  id v3 = [v2 unsignedIntegerValue];

  return (unint64_t)v3;
}

- (id)sortedPassUniqueIdentifiers
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"internal_group_order"));
  if (v3)
  {
    v9[0] = objc_opt_class(&OBJC_CLASS___NSArray, v2);
    v9[1] = objc_opt_class(&OBJC_CLASS___NSString, v4);
    id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v9, 2LL));
    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v5));
    v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedUnarchiver unarchivedObjectOfClasses:fromData:error:]( &OBJC_CLASS___NSKeyedUnarchiver,  "unarchivedObjectOfClasses:fromData:error:",  v6,  v3,  0LL));
  }

  else
  {
    v7 = 0LL;
  }

  return v7;
}

- (id)automaticGroup
{
  id v3 = objc_alloc_init(&OBJC_CLASS___PDAutomaticGroup);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[Group _propertySettersForAutomaticGroup](&OBJC_CLASS___Group, "_propertySettersForAutomaticGroup"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 allKeys]);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_100385BAC;
  v11[3] = &unk_100639EE8;
  id v12 = v4;
  id v6 = v3;
  v13 = v6;
  id v7 = v4;
  -[SQLiteEntity getValuesForProperties:withApplier:](self, "getValuesForProperties:withApplier:", v5, v11);

  v8 = v13;
  v9 = v6;

  return v9;
}

+ (id)_propertySettersForAutomaticGroup
{
  v3[0] = @"pass_type_id";
  v3[1] = @"pass_style";
  v4[0] = &stru_100658DF8;
  v4[1] = &stru_100658E18;
  v3[2] = @"grouping_id";
  v3[3] = @"minimum_date";
  v4[2] = &stru_100658E38;
  v4[3] = &stru_100658E58;
  v3[4] = @"maximum_date";
  v3[5] = @"ingested_date";
  v4[4] = &stru_100658E78;
  v4[5] = &stru_100658E98;
  v3[6] = @"nfc_enabled";
  v3[7] = @"internal_group_order";
  v4[6] = &stru_100658EB8;
  v4[7] = &stru_100658ED8;
  return (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v4,  v3,  8LL));
}

+ (id)_updateDictionaryWithAutomaticGroup:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_claimAutoreleasedReturnValue([v3 sortedPassUniqueIdentifiers]);
  v22 = (void *)v4;
  if (v4) {
    id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  v4,  1LL,  0LL));
  }
  else {
    id v5 = 0LL;
  }
  v23[0] = @"pass_type_id";
  v21 = (void *)objc_claimAutoreleasedReturnValue([v3 passTypeID]);
  v20 = (void *)_SQLValueForString(v21);
  v24[0] = v20;
  v23[1] = @"pass_style";
  v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [v3 passStyle]));
  v24[1] = v19;
  v23[2] = @"grouping_id";
  v18 = (void *)objc_claimAutoreleasedReturnValue([v3 groupingID]);
  v17 = (void *)_SQLValueForString(v18);
  v24[2] = v17;
  v23[3] = @"minimum_date";
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v3 minDate]);
  id v7 = (void *)_SQLValueForDate(v6);
  v24[3] = v7;
  v23[4] = @"maximum_date";
  v8 = (void *)objc_claimAutoreleasedReturnValue([v3 maxDate]);
  v9 = (void *)_SQLValueForDate(v8);
  v24[4] = v9;
  v23[5] = @"ingested_date";
  v10 = (void *)objc_claimAutoreleasedReturnValue([v3 ingestedDate]);
  v11 = (void *)_SQLValueForDate(v10);
  v24[5] = v11;
  v23[6] = @"nfc_enabled";
  id v12 = [v3 isNFCEnabled];

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v12));
  v24[6] = v13;
  v23[7] = @"internal_group_order";
  v14 = v5;
  if (!v5) {
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
  }
  v24[7] = v14;
  v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v24,  v23,  8LL));
  if (!v5) {

  }
  return v15;
}

@end
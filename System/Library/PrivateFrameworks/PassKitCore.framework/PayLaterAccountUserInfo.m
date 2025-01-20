@interface PayLaterAccountUserInfo
+ (id)_predicateForAccountDetailsPID:(int64_t)a3;
+ (id)associationPropertyForEntityClass:(Class)a3;
+ (id)databaseTable;
+ (id)insertOrUpdatePayLaterAccountUserInfo:(id)a3 forAccountDetailsPID:(int64_t)a4 inDatabase:(id)a5;
+ (id)payLaterAccountUserInfoForAccountDetailsPID:(int64_t)a3 inDatabase:(id)a4;
+ (void)deletePayLaterAccountUserInfoForAccountDetailsPID:(int64_t)a3 inDatabase:(id)a4;
- (BOOL)deleteFromDatabase;
- (PayLaterAccountUserInfo)initWithPayLaterAccountUserInfo:(id)a3 forAccountDetailsPID:(int64_t)a4 inDatabase:(id)a5;
@end

@implementation PayLaterAccountUserInfo

+ (id)databaseTable
{
  return @"okra";
}

+ (id)associationPropertyForEntityClass:(Class)a3
{
  if ((Class)objc_opt_class(&OBJC_CLASS___PayLaterAccountDetails, a2) == a3) {
    return @"a";
  }
  else {
    return 0LL;
  }
}

- (PayLaterAccountUserInfo)initWithPayLaterAccountUserInfo:(id)a3 forAccountDetailsPID:(int64_t)a4 inDatabase:(id)a5
{
  id v7 = a5;
  v8 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a4));
  -[NSMutableDictionary setObjectOrNull:forKey:](v8, "setObjectOrNull:forKey:", v9, @"a");

  v10 = -[SQLiteEntity initWithPropertyValues:inDatabase:](self, "initWithPropertyValues:inDatabase:", v8, v7);
  return v10;
}

+ (id)insertOrUpdatePayLaterAccountUserInfo:(id)a3 forAccountDetailsPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v10 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForAccountDetailsPID:a4]);
  id v11 = (id)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v9 predicate:v10]);

  if (!v11) {
    id v11 = objc_msgSend( objc_alloc((Class)objc_opt_class(a1, v12)),  "initWithPayLaterAccountUserInfo:forAccountDetailsPID:inDatabase:",  v8,  a4,  v9);
  }
  id v13 = [v11 persistentID];
  +[PayLaterAccountUserInfoValue deletePayLaterAccountUserInfoValueForUserInfoPID:inDatabase:]( &OBJC_CLASS___PayLaterAccountUserInfoValue,  "deletePayLaterAccountUserInfoValueForUserInfoPID:inDatabase:",  v13,  v9);
  v14 = (void *)objc_claimAutoreleasedReturnValue([v8 emailAddress]);
  v15 = (void *)objc_claimAutoreleasedReturnValue( +[PayLaterAccountUserInfoValue insertPayLaterAccountUserInfoValue:userInfoPID:inDatabase:]( &OBJC_CLASS___PayLaterAccountUserInfoValue,  "insertPayLaterAccountUserInfoValue:userInfoPID:inDatabase:",  v14,  v13,  v9));

  v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithLongLong:]( NSNumber,  "numberWithLongLong:",  [v15 persistentID]));
  [v11 setValue:v16 forProperty:@"b"];

  v17 = (void *)objc_claimAutoreleasedReturnValue([v8 firstName]);
  v18 = (void *)objc_claimAutoreleasedReturnValue( +[PayLaterAccountUserInfoValue insertPayLaterAccountUserInfoValue:userInfoPID:inDatabase:]( &OBJC_CLASS___PayLaterAccountUserInfoValue,  "insertPayLaterAccountUserInfoValue:userInfoPID:inDatabase:",  v17,  v13,  v9));

  v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithLongLong:]( NSNumber,  "numberWithLongLong:",  [v18 persistentID]));
  [v11 setValue:v19 forProperty:@"c"];

  v20 = (void *)objc_claimAutoreleasedReturnValue([v8 lastName]);
  v21 = (void *)objc_claimAutoreleasedReturnValue( +[PayLaterAccountUserInfoValue insertPayLaterAccountUserInfoValue:userInfoPID:inDatabase:]( &OBJC_CLASS___PayLaterAccountUserInfoValue,  "insertPayLaterAccountUserInfoValue:userInfoPID:inDatabase:",  v20,  v13,  v9));

  v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithLongLong:]( NSNumber,  "numberWithLongLong:",  [v21 persistentID]));
  [v11 setValue:v22 forProperty:@"d"];

  v23 = (void *)objc_claimAutoreleasedReturnValue([v8 dateOfBirth]);
  v24 = (void *)objc_claimAutoreleasedReturnValue( +[PayLaterAccountUserInfoValue insertPayLaterAccountUserInfoValue:userInfoPID:inDatabase:]( &OBJC_CLASS___PayLaterAccountUserInfoValue,  "insertPayLaterAccountUserInfoValue:userInfoPID:inDatabase:",  v23,  v13,  v9));

  v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithLongLong:]( NSNumber,  "numberWithLongLong:",  [v24 persistentID]));
  [v11 setValue:v25 forProperty:@"e"];

  v26 = (void *)objc_claimAutoreleasedReturnValue([v8 phoneNumber]);
  v27 = (void *)objc_claimAutoreleasedReturnValue( +[PayLaterAccountUserInfoValue insertPayLaterAccountUserInfoValue:userInfoPID:inDatabase:]( &OBJC_CLASS___PayLaterAccountUserInfoValue,  "insertPayLaterAccountUserInfoValue:userInfoPID:inDatabase:",  v26,  v13,  v9));

  v28 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithLongLong:]( NSNumber,  "numberWithLongLong:",  [v27 persistentID]));
  [v11 setValue:v28 forProperty:@"f"];

  v29 = (void *)objc_claimAutoreleasedReturnValue([v8 street1]);
  v30 = (void *)objc_claimAutoreleasedReturnValue( +[PayLaterAccountUserInfoValue insertPayLaterAccountUserInfoValue:userInfoPID:inDatabase:]( &OBJC_CLASS___PayLaterAccountUserInfoValue,  "insertPayLaterAccountUserInfoValue:userInfoPID:inDatabase:",  v29,  v13,  v9));

  v31 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithLongLong:]( NSNumber,  "numberWithLongLong:",  [v30 persistentID]));
  [v11 setValue:v31 forProperty:@"g"];

  v32 = (void *)objc_claimAutoreleasedReturnValue([v8 street2]);
  v33 = (void *)objc_claimAutoreleasedReturnValue( +[PayLaterAccountUserInfoValue insertPayLaterAccountUserInfoValue:userInfoPID:inDatabase:]( &OBJC_CLASS___PayLaterAccountUserInfoValue,  "insertPayLaterAccountUserInfoValue:userInfoPID:inDatabase:",  v32,  v13,  v9));

  v34 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithLongLong:]( NSNumber,  "numberWithLongLong:",  [v33 persistentID]));
  [v11 setValue:v34 forProperty:@"h"];

  v35 = (void *)objc_claimAutoreleasedReturnValue([v8 city]);
  v36 = (void *)objc_claimAutoreleasedReturnValue( +[PayLaterAccountUserInfoValue insertPayLaterAccountUserInfoValue:userInfoPID:inDatabase:]( &OBJC_CLASS___PayLaterAccountUserInfoValue,  "insertPayLaterAccountUserInfoValue:userInfoPID:inDatabase:",  v35,  v13,  v9));

  v37 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithLongLong:]( NSNumber,  "numberWithLongLong:",  [v36 persistentID]));
  [v11 setValue:v37 forProperty:@"i"];

  v38 = (void *)objc_claimAutoreleasedReturnValue([v8 state]);
  v39 = (void *)objc_claimAutoreleasedReturnValue( +[PayLaterAccountUserInfoValue insertPayLaterAccountUserInfoValue:userInfoPID:inDatabase:]( &OBJC_CLASS___PayLaterAccountUserInfoValue,  "insertPayLaterAccountUserInfoValue:userInfoPID:inDatabase:",  v38,  v13,  v9));

  v40 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithLongLong:]( NSNumber,  "numberWithLongLong:",  [v39 persistentID]));
  [v11 setValue:v40 forProperty:@"j"];

  v41 = (void *)objc_claimAutoreleasedReturnValue([v8 postalCode]);
  v42 = (void *)objc_claimAutoreleasedReturnValue( +[PayLaterAccountUserInfoValue insertPayLaterAccountUserInfoValue:userInfoPID:inDatabase:]( &OBJC_CLASS___PayLaterAccountUserInfoValue,  "insertPayLaterAccountUserInfoValue:userInfoPID:inDatabase:",  v41,  v13,  v9));

  v43 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithLongLong:]( NSNumber,  "numberWithLongLong:",  [v42 persistentID]));
  [v11 setValue:v43 forProperty:@"k"];

  v44 = (void *)objc_claimAutoreleasedReturnValue([v8 ssn]);
  v45 = (void *)objc_claimAutoreleasedReturnValue( +[PayLaterAccountUserInfoValue insertPayLaterAccountUserInfoValue:userInfoPID:inDatabase:]( &OBJC_CLASS___PayLaterAccountUserInfoValue,  "insertPayLaterAccountUserInfoValue:userInfoPID:inDatabase:",  v44,  v13,  v9));

  v46 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithLongLong:]( NSNumber,  "numberWithLongLong:",  [v45 persistentID]));
  [v11 setValue:v46 forProperty:@"l"];

  v47 = (void *)objc_claimAutoreleasedReturnValue([v8 yearlyIncome]);
  v48 = (void *)objc_claimAutoreleasedReturnValue( +[PayLaterAccountUserInfoValue insertPayLaterAccountUserInfoValue:userInfoPID:inDatabase:]( &OBJC_CLASS___PayLaterAccountUserInfoValue,  "insertPayLaterAccountUserInfoValue:userInfoPID:inDatabase:",  v47,  v13,  v9));

  v49 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithLongLong:]( NSNumber,  "numberWithLongLong:",  [v48 persistentID]));
  [v11 setValue:v49 forProperty:@"m"];

  return v11;
}

+ (void)deletePayLaterAccountUserInfoForAccountDetailsPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForAccountDetailsPID:a3]);
  id v8 = (id)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v6 predicate:v7]);

  [v8 deleteFromDatabase];
}

- (BOOL)deleteFromDatabase
{
  int64_t v3 = -[SQLiteEntity persistentID](self, "persistentID");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity database](self, "database"));
  +[PayLaterAccountUserInfoValue deletePayLaterAccountUserInfoValueForUserInfoPID:inDatabase:]( &OBJC_CLASS___PayLaterAccountUserInfoValue,  "deletePayLaterAccountUserInfoValueForUserInfoPID:inDatabase:",  v3,  v4);

  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___PayLaterAccountUserInfo;
  return -[SQLiteEntity deleteFromDatabase](&v6, "deleteFromDatabase");
}

+ (id)payLaterAccountUserInfoForAccountDetailsPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForAccountDetailsPID:a3]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v6 predicate:v7]);

  if (v8)
  {
    id v9 = objc_alloc_init(&OBJC_CLASS___PKPayLaterAccountUserInfo);
    v10 = (void *)objc_claimAutoreleasedReturnValue([v8 valueForProperty:@"b"]);
    id v11 = (void *)objc_claimAutoreleasedReturnValue( +[PayLaterAccountUserInfoValue payLaterAccountUserInfoValueForPID:inDatabase:]( &OBJC_CLASS___PayLaterAccountUserInfoValue,  "payLaterAccountUserInfoValueForPID:inDatabase:",  v10,  v6));

    [v9 setEmailAddress:v11];
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v8 valueForProperty:@"c"]);
    id v13 = (void *)objc_claimAutoreleasedReturnValue( +[PayLaterAccountUserInfoValue payLaterAccountUserInfoValueForPID:inDatabase:]( &OBJC_CLASS___PayLaterAccountUserInfoValue,  "payLaterAccountUserInfoValueForPID:inDatabase:",  v12,  v6));

    [v9 setFirstName:v13];
    v14 = (void *)objc_claimAutoreleasedReturnValue([v8 valueForProperty:@"d"]);
    v15 = (void *)objc_claimAutoreleasedReturnValue( +[PayLaterAccountUserInfoValue payLaterAccountUserInfoValueForPID:inDatabase:]( &OBJC_CLASS___PayLaterAccountUserInfoValue,  "payLaterAccountUserInfoValueForPID:inDatabase:",  v14,  v6));

    [v9 setLastName:v15];
    v16 = (void *)objc_claimAutoreleasedReturnValue([v8 valueForProperty:@"e"]);
    v17 = (void *)objc_claimAutoreleasedReturnValue( +[PayLaterAccountUserInfoValue payLaterAccountUserInfoValueForPID:inDatabase:]( &OBJC_CLASS___PayLaterAccountUserInfoValue,  "payLaterAccountUserInfoValueForPID:inDatabase:",  v16,  v6));

    [v9 setDateOfBirth:v17];
    v18 = (void *)objc_claimAutoreleasedReturnValue([v8 valueForProperty:@"f"]);
    v19 = (void *)objc_claimAutoreleasedReturnValue( +[PayLaterAccountUserInfoValue payLaterAccountUserInfoValueForPID:inDatabase:]( &OBJC_CLASS___PayLaterAccountUserInfoValue,  "payLaterAccountUserInfoValueForPID:inDatabase:",  v18,  v6));

    [v9 setPhoneNumber:v19];
    v20 = (void *)objc_claimAutoreleasedReturnValue([v8 valueForProperty:@"g"]);
    v21 = (void *)objc_claimAutoreleasedReturnValue( +[PayLaterAccountUserInfoValue payLaterAccountUserInfoValueForPID:inDatabase:]( &OBJC_CLASS___PayLaterAccountUserInfoValue,  "payLaterAccountUserInfoValueForPID:inDatabase:",  v20,  v6));

    [v9 setStreet1:v21];
    v22 = (void *)objc_claimAutoreleasedReturnValue([v8 valueForProperty:@"h"]);
    v23 = (void *)objc_claimAutoreleasedReturnValue( +[PayLaterAccountUserInfoValue payLaterAccountUserInfoValueForPID:inDatabase:]( &OBJC_CLASS___PayLaterAccountUserInfoValue,  "payLaterAccountUserInfoValueForPID:inDatabase:",  v22,  v6));

    [v9 setStreet2:v23];
    v24 = (void *)objc_claimAutoreleasedReturnValue([v8 valueForProperty:@"i"]);
    v25 = (void *)objc_claimAutoreleasedReturnValue( +[PayLaterAccountUserInfoValue payLaterAccountUserInfoValueForPID:inDatabase:]( &OBJC_CLASS___PayLaterAccountUserInfoValue,  "payLaterAccountUserInfoValueForPID:inDatabase:",  v24,  v6));

    [v9 setCity:v25];
    v26 = (void *)objc_claimAutoreleasedReturnValue([v8 valueForProperty:@"j"]);
    v27 = (void *)objc_claimAutoreleasedReturnValue( +[PayLaterAccountUserInfoValue payLaterAccountUserInfoValueForPID:inDatabase:]( &OBJC_CLASS___PayLaterAccountUserInfoValue,  "payLaterAccountUserInfoValueForPID:inDatabase:",  v26,  v6));

    [v9 setState:v27];
    v28 = (void *)objc_claimAutoreleasedReturnValue([v8 valueForProperty:@"k"]);
    v29 = (void *)objc_claimAutoreleasedReturnValue( +[PayLaterAccountUserInfoValue payLaterAccountUserInfoValueForPID:inDatabase:]( &OBJC_CLASS___PayLaterAccountUserInfoValue,  "payLaterAccountUserInfoValueForPID:inDatabase:",  v28,  v6));

    [v9 setPostalCode:v29];
    v30 = (void *)objc_claimAutoreleasedReturnValue([v8 valueForProperty:@"l"]);
    v31 = (void *)objc_claimAutoreleasedReturnValue( +[PayLaterAccountUserInfoValue payLaterAccountUserInfoValueForPID:inDatabase:]( &OBJC_CLASS___PayLaterAccountUserInfoValue,  "payLaterAccountUserInfoValueForPID:inDatabase:",  v30,  v6));

    [v9 setSsn:v31];
    v32 = (void *)objc_claimAutoreleasedReturnValue([v8 valueForProperty:@"m"]);
    v33 = (void *)objc_claimAutoreleasedReturnValue( +[PayLaterAccountUserInfoValue payLaterAccountUserInfoValueForPID:inDatabase:]( &OBJC_CLASS___PayLaterAccountUserInfoValue,  "payLaterAccountUserInfoValueForPID:inDatabase:",  v32,  v6));

    [v9 setYearlyIncome:v33];
  }

  else
  {
    id v9 = 0LL;
  }

  return v9;
}

+ (id)_predicateForAccountDetailsPID:(int64_t)a3
{
  int64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"a",  v3));

  return v4;
}

@end
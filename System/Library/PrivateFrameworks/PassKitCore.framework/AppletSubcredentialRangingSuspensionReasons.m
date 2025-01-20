@interface AppletSubcredentialRangingSuspensionReasons
+ (BOOL)deleteRangingSuspensionReasonsForCredential:(id)a3 forPaymentApplication:(id)a4 inDatabase:(id)a5;
+ (id)_predicateForAppletSubcredentialPID:(int64_t)a3;
+ (id)_predicateForPaymentApplicationPID:(int64_t)a3;
+ (id)databaseTable;
+ (id)insertOrUpdateSubcredentialRangingSuspensionReasonForCredential:(id)a3 forPaymentApplication:(id)a4 withReasons:(unint64_t)a5 inDatabase:(id)a6;
+ (unint64_t)suspensionReasonsForCredential:(id)a3 forPaymentApplication:(id)a4 inDatabase:(id)a5;
- (AppletSubcredentialRangingSuspensionReasons)initWithSubcredential:(id)a3 forPaymentApplication:(id)a4 withRangingSuspensionReasons:(unint64_t)a5 inDatabase:(id)a6;
@end

@implementation AppletSubcredentialRangingSuspensionReasons

+ (id)insertOrUpdateSubcredentialRangingSuspensionReasonForCredential:(id)a3 forPaymentApplication:(id)a4 withReasons:(unint64_t)a5 inDatabase:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_predicateForAppletSubcredentialPID:", objc_msgSend(v10, "persistentID")));
  id v14 = (id)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v12 predicate:v13]);

  if (v14)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a5));
    [v14 setValue:v15 forProperty:@"ranging_suspension_reasons"];
  }

  else
  {
    id v14 = [objc_alloc((Class)a1) initWithSubcredential:v10 forPaymentApplication:v11 withRangingSuspensionReasons:a5 inDatabase:v12];
  }

  return v14;
}

- (AppletSubcredentialRangingSuspensionReasons)initWithSubcredential:(id)a3 forPaymentApplication:(id)a4 withRangingSuspensionReasons:(unint64_t)a5 inDatabase:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  uint64_t v26 = 0LL;
  v27 = &v26;
  uint64_t v28 = 0x3032000000LL;
  v29 = sub_100088028;
  v30 = sub_100088038;
  id v31 = 0LL;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_100088040;
  v19[3] = &unk_10063E800;
  id v13 = v10;
  id v20 = v13;
  unint64_t v25 = a5;
  id v14 = v11;
  id v21 = v14;
  v24 = &v26;
  v15 = self;
  v22 = v15;
  id v16 = v12;
  id v23 = v16;
  sub_1002CCC5C((uint64_t)v16, v19);
  v17 = (AppletSubcredentialRangingSuspensionReasons *)(id)v27[5];

  _Block_object_dispose(&v26, 8);
  return v17;
}

+ (unint64_t)suspensionReasonsForCredential:(id)a3 forPaymentApplication:(id)a4 inDatabase:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v20 = 0LL;
  id v21 = &v20;
  uint64_t v22 = 0x2020000000LL;
  uint64_t v23 = 0LL;
  id v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_predicateForAppletSubcredentialPID:", objc_msgSend(v8, "persistentID")));
  v25[0] = v11;
  id v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_predicateForPaymentApplicationPID:", objc_msgSend(v9, "persistentID")));
  v25[1] = v12;
  id v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v25, 2LL));
  id v14 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v13));

  v15 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v10 predicate:v14]);
  v24 = @"ranging_suspension_reasons";
  id v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v24, 1LL));
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_100088358;
  v19[3] = &unk_10063E828;
  void v19[4] = &v20;
  [v15 enumeratePersistentIDsAndProperties:v16 usingBlock:v19];

  unint64_t v17 = v21[3];
  _Block_object_dispose(&v20, 8);

  return v17;
}

+ (BOOL)deleteRangingSuspensionReasonsForCredential:(id)a3 forPaymentApplication:(id)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_predicateForAppletSubcredentialPID:", objc_msgSend(a3, "persistentID")));
  v17[0] = v10;
  id v11 = [v9 persistentID];

  id v12 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForPaymentApplicationPID:v11]);
  v17[1] = v12;
  id v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v17, 2LL));
  id v14 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v13));

  v15 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v8 predicate:v14]);
  LOBYTE(a1) = [v15 deleteAllEntities];

  return (char)a1;
}

+ (id)_predicateForAppletSubcredentialPID:(int64_t)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"applet_subcredential_pid",  v3));

  return v4;
}

+ (id)_predicateForPaymentApplicationPID:(int64_t)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"payment_application_pid",  v3));

  return v4;
}

+ (id)databaseTable
{
  return @"ranging_suspension_reason";
}

@end
@interface AppletSubcredential
+ (id)_predicateForAppletSubcredentialIdentifier:(id)a3;
+ (id)_predicateForAppletSubcredentialPID:(int64_t)a3;
+ (id)_predicateForAppletSubcredentialWithPairedReaderIdentifier:(id)a3;
+ (id)_predicateForAppletSubcredentialWithPaymentApplicationPID:(int64_t)a3;
+ (id)_propertySetters;
+ (id)appletSubcredentialWithIdentifier:(id)a3 inDatabase:(id)a4;
+ (id)appletSubcredentialWithPID:(int64_t)a3 inDatabase:(id)a4;
+ (id)appletSubcredentialsInDatabase:(id)a3 forPaymentApplicationPID:(int64_t)a4;
+ (id)appletSubcredentialsWithPairedReaderIdentifier:(id)a3 inDatabase:(id)a4;
+ (id)credentialIdentifiersForAidInDatabase:(id)a3;
+ (id)databaseTable;
+ (id)dictionaryFromAppletSubcredential:(id)a3 paymentApplication:(id)a4;
+ (id)insertOrUpdateAppletSubcredential:(id)a3 withPaymentApplication:(id)a4 inDatabase:(id)a5;
+ (id)setAppletSubcredentials:(id)a3 forPaymentApplication:(id)a4 inDatabase:(id)a5;
+ (void)deleteEntitiesInDatabase:(id)a3 forPaymentApplication:(id)a4;
- (AppletSubcredential)initWithAppletSubcredential:(id)a3 forPaymentApplication:(id)a4 inDatabase:(id)a5;
- (BOOL)deleteFromDatabase;
- (id)appletSubcredential;
- (int64_t)paymentApplicationPID;
- (void)updateAliroGroupResolvingKeys:(id)a3;
- (void)updateWithAppletSubcredential:(id)a3 paymentApplication:(id)a4;
@end

@implementation AppletSubcredential

+ (id)credentialIdentifiersForAidInDatabase:(id)a3
{
  id v3 = a3;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_1002C2498;
  v6[3] = &unk_100653140;
  v4 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  v7 = v4;
  sub_1002CCDD0( (uint64_t)v3,  @"select payment_application.aid, whitney.b from whitney join payment_application on payment_application.pid == whitney.a",  1,  v6);

  return v4;
}

+ (id)appletSubcredentialsInDatabase:(id)a3 forPaymentApplicationPID:(int64_t)a4
{
  id v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForAppletSubcredentialWithPaymentApplicationPID:a4]);
  v8 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v7]);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
  v21 = @"pid";
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v21, 1LL));
  v15 = _NSConcreteStackBlock;
  uint64_t v16 = 3221225472LL;
  v17 = sub_1002C26DC;
  v18 = &unk_100639E18;
  id v19 = v6;
  id v20 = v9;
  id v11 = v9;
  id v12 = v6;
  [v8 enumeratePersistentIDsAndProperties:v10 usingBlock:&v15];

  id v13 = objc_msgSend(v11, "copy", v15, v16, v17, v18);
  return v13;
}

+ (id)appletSubcredentialWithIdentifier:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForAppletSubcredentialIdentifier:a3]);
  v8 = (void *)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v6 predicate:v7]);

  return v8;
}

+ (id)appletSubcredentialsWithPairedReaderIdentifier:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForAppletSubcredentialWithPairedReaderIdentifier:a3]);
  v8 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v7]);
  v9 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  v21 = @"pid";
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v21, 1LL));
  v15 = _NSConcreteStackBlock;
  uint64_t v16 = 3221225472LL;
  v17 = sub_1002C2900;
  v18 = &unk_100639E18;
  id v19 = v6;
  id v20 = v9;
  id v11 = v9;
  id v12 = v6;
  [v8 enumeratePersistentIDsAndProperties:v10 usingBlock:&v15];

  id v13 = -[NSMutableSet copy](v11, "copy", v15, v16, v17, v18);
  return v13;
}

+ (id)appletSubcredentialWithPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForAppletSubcredentialPID:a3]);
  v8 = (void *)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v6 predicate:v7]);

  return v8;
}

+ (void)deleteEntitiesInDatabase:(id)a3 forPaymentApplication:(id)a4
{
  id v6 = a3;
  id v8 = (id)objc_claimAutoreleasedReturnValue( objc_msgSend( a1,  "_predicateForAppletSubcredentialWithPaymentApplicationPID:",  objc_msgSend(a4, "persistentID")));
  v7 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v8]);

  [v7 deleteAllEntities];
}

+ (id)insertOrUpdateAppletSubcredential:(id)a3 withPaymentApplication:(id)a4 inDatabase:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v8 identifier]);
  id v12 = (id)objc_claimAutoreleasedReturnValue([a1 appletSubcredentialWithIdentifier:v11 inDatabase:v10]);

  if (v12)
  {
    if (![v8 allSupportedRadioTechnologies])
    {
      id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 appletSubcredential]);
      id v14 = [v13 allSupportedRadioTechnologies];

      [v8 setAllSupportedRadioTechnologies:v14];
    }

    if (![v8 supportedRadioTechnologies])
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue([v12 appletSubcredential]);
      id v16 = [v15 supportedRadioTechnologies];

      [v8 setSupportedRadioTechnologies:v16];
    }

    [v12 updateWithAppletSubcredential:v8 paymentApplication:v9];
  }

  else
  {
    id v12 = [objc_alloc((Class)a1) initWithAppletSubcredential:v8 forPaymentApplication:v9 inDatabase:v10];
  }

  return v12;
}

+ (id)setAppletSubcredentials:(id)a3 forPaymentApplication:(id)a4 inDatabase:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_1002C2C68;
  v17[3] = &unk_100640EE0;
  v21 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  id v22 = a1;
  id v18 = v10;
  id v19 = v9;
  id v20 = v8;
  id v11 = v21;
  id v12 = v8;
  id v13 = v9;
  id v14 = v10;
  sub_1002CCC5C((uint64_t)v14, v17);
  id v15 = -[NSMutableSet copy](v11, "copy");

  return v15;
}

- (AppletSubcredential)initWithAppletSubcredential:(id)a3 forPaymentApplication:(id)a4 inDatabase:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (void *)objc_claimAutoreleasedReturnValue( +[AppletSubcredential dictionaryFromAppletSubcredential:paymentApplication:]( &OBJC_CLASS___AppletSubcredential,  "dictionaryFromAppletSubcredential:paymentApplication:",  v8,  v9));
  uint64_t v26 = 0LL;
  v27 = &v26;
  uint64_t v28 = 0x3032000000LL;
  v29 = sub_1002C3014;
  v30 = sub_1002C3024;
  id v31 = 0LL;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_1002C302C;
  v19[3] = &unk_100653168;
  v25 = &v26;
  id v12 = self;
  id v20 = v12;
  id v13 = v11;
  id v21 = v13;
  id v14 = v10;
  id v22 = v14;
  id v15 = v8;
  id v23 = v15;
  id v16 = v9;
  id v24 = v16;
  sub_1002CCC5C((uint64_t)v14, v19);
  v17 = (AppletSubcredential *)(id)v27[5];

  _Block_object_dispose(&v26, 8);
  return v17;
}

+ (id)dictionaryFromAppletSubcredential:(id)a3 paymentApplication:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v5 sharingConfiguration]);
  if ([v5 isShareable])
  {
    uint64_t v9 = objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v8 maxNumberOfSharedCredentials]));
    uint64_t v10 = objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v8 numberOfShareableCredentials]));
    uint64_t v11 = objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v8 sharingRequiresPassword]));
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v8 activationOptions]);
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 identifiers]);

    if (v6)
    {
LABEL_3:
      uint64_t v14 = objc_claimAutoreleasedReturnValue( +[NSNumber numberWithLongLong:]( NSNumber,  "numberWithLongLong:",  [v6 persistentID]));
      goto LABEL_6;
    }
  }

  else
  {
    id v13 = 0LL;
    uint64_t v10 = 0LL;
    uint64_t v9 = 0LL;
    uint64_t v11 = 0LL;
    if (v6) {
      goto LABEL_3;
    }
  }

  uint64_t v14 = objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
LABEL_6:
  v45 = v6;
  v40 = (void *)v14;
  -[NSMutableDictionary setObjectOrNull:forKey:](v7, "setObjectOrNull:forKey:", v14, @"a");
  id v15 = (void *)objc_claimAutoreleasedReturnValue([v5 identifier]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v7, "setObjectOrNull:forKey:", v15, @"b");

  id v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [v5 state]));
  -[NSMutableDictionary setObjectOrNull:forKey:](v7, "setObjectOrNull:forKey:", v16, @"c");

  -[NSMutableDictionary setObjectOrNull:forKey:](v7, "setObjectOrNull:forKey:", v9, @"d");
  -[NSMutableDictionary setObjectOrNull:forKey:](v7, "setObjectOrNull:forKey:", v11, @"h");
  v17 = (void *)objc_claimAutoreleasedReturnValue([v13 componentsJoinedByString:@","]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v7, "setObjectOrNull:forKey:", v17, @"o");

  -[NSMutableDictionary setObjectOrNull:forKey:](v7, "setObjectOrNull:forKey:", v10, @"k");
  id v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v5 supportedRadioTechnologies]));
  -[NSMutableDictionary setObjectOrNull:forKey:](v7, "setObjectOrNull:forKey:", v18, @"l");

  id v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v5 isOnlineImmobilizerToken]));
  -[NSMutableDictionary setObjectOrNull:forKey:](v7, "setObjectOrNull:forKey:", v19, @"n");

  id v20 = (void *)objc_claimAutoreleasedReturnValue([v5 partnerIdentifier]);
  if (v20) {
    -[NSMutableDictionary setObjectOrNull:forKey:](v7, "setObjectOrNull:forKey:", v20, @"e");
  }
  v44 = v8;
  id v21 = (void *)objc_claimAutoreleasedReturnValue([v5 pairedReaderIdentifier]);
  if (v21) {
    -[NSMutableDictionary setObjectOrNull:forKey:](v7, "setObjectOrNull:forKey:", v21, @"f");
  }
  v43 = (void *)v9;
  id v22 = (void *)objc_claimAutoreleasedReturnValue([v5 brandIdentifier]);
  if (v22) {
    -[NSMutableDictionary setObjectOrNull:forKey:](v7, "setObjectOrNull:forKey:", v22, @"p");
  }
  v42 = (void *)v10;
  id v23 = (void *)objc_claimAutoreleasedReturnValue([v5 endpointIdentifier]);
  if (v23) {
    -[NSMutableDictionary setObjectOrNull:forKey:](v7, "setObjectOrNull:forKey:", v23, @"g");
  }
  v41 = v13;
  id v24 = (void *)objc_claimAutoreleasedReturnValue([v5 sharingSessionIdentifier]);
  v25 = v24;
  if (v24)
  {
    [v24 getUUIDBytes:v46];
    uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:", v46, 16LL));
    -[NSMutableDictionary setObjectOrNull:forKey:](v7, "setObjectOrNull:forKey:", v26, @"i");
  }

  v27 = (void *)v11;
  uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue([v5 originatorIDSHandle]);
  if (v28) {
    -[NSMutableDictionary setObjectOrNull:forKey:](v7, "setObjectOrNull:forKey:", v28, @"j");
  }
  v29 = (void *)objc_claimAutoreleasedReturnValue([v5 isoFormat]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v7, "setObjectOrNull:forKey:", v29, @"m");

  v30 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v5 allSupportedRadioTechnologies]));
  -[NSMutableDictionary setObjectOrNull:forKey:](v7, "setObjectOrNull:forKey:", v30, @"q");

  uint64_t v31 = PKAppletSubcredentialCarKeyVehicleVersionToString([v5 carKeyVehicleVersion]);
  v32 = (void *)objc_claimAutoreleasedReturnValue(v31);
  -[NSMutableDictionary setObject:forKey:](v7, "setObject:forKey:", v32, @"r");

  uint64_t v33 = PKAppletSubcredentialCarKeyServerVersionToString([v5 carKeyServerVersion]);
  v34 = (void *)objc_claimAutoreleasedReturnValue(v33);
  -[NSMutableDictionary setObject:forKey:](v7, "setObject:forKey:", v34, @"s");

  uint64_t v35 = PKAppletSubcredentialKeyClassToString([v5 keyClass]);
  v36 = (void *)objc_claimAutoreleasedReturnValue(v35);
  -[NSMutableDictionary setObjectOrNull:forKey:](v7, "setObjectOrNull:forKey:", v36, @"t");

  uint64_t v37 = PKAppletSubcredentialCredentialAuthorityTypeToString([v5 credentialAuthorityType]);
  v38 = (void *)objc_claimAutoreleasedReturnValue(v37);
  -[NSMutableDictionary setObjectOrNull:forKey:](v7, "setObjectOrNull:forKey:", v38, @"u");

  return v7;
}

- (void)updateWithAppletSubcredential:(id)a3 paymentApplication:(id)a4
{
  id v6 = a3;
  id v8 = (id)objc_claimAutoreleasedReturnValue( +[AppletSubcredential dictionaryFromAppletSubcredential:paymentApplication:]( &OBJC_CLASS___AppletSubcredential,  "dictionaryFromAppletSubcredential:paymentApplication:",  v6,  a4));
  -[SQLiteEntity setValuesWithDictionary:](self, "setValuesWithDictionary:", v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 aliroGroupResolvingKeys]);

  -[AppletSubcredential updateAliroGroupResolvingKeys:](self, "updateAliroGroupResolvingKeys:", v7);
}

- (void)updateAliroGroupResolvingKeys:(id)a3
{
  id v4 = a3;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1002C3798;
  v7[3] = &unk_10063E440;
  id v8 = (id)objc_claimAutoreleasedReturnValue(-[SQLiteEntity database](self, "database"));
  uint64_t v9 = self;
  id v10 = v4;
  id v5 = v4;
  id v6 = v8;
  sub_1002CCC5C((uint64_t)v6, v7);
}

- (id)appletSubcredential
{
  id v3 = objc_alloc_init(&OBJC_CLASS___PKAppletSubcredential);
  id v4 = objc_alloc_init(&OBJC_CLASS___PKAppletSubcredentialSharingConfirguration);
  -[PKAppletSubcredential setSharingConfiguration:](v3, "setSharingConfiguration:", v4);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[AppletSubcredential _propertySetters](&OBJC_CLASS___AppletSubcredential, "_propertySetters"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 allKeys]);
  id v15 = _NSConcreteStackBlock;
  uint64_t v16 = 3221225472LL;
  v17 = sub_1002C39B8;
  id v18 = &unk_100639EE8;
  id v19 = v5;
  v7 = v3;
  id v20 = v7;
  id v8 = v5;
  -[SQLiteEntity getValuesForProperties:withApplier:](self, "getValuesForProperties:withApplier:", v6, &v15);

  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[PKAppletSubcredential identifier](v7, "identifier", v15, v16, v17, v18));
  id v10 = (void *)objc_claimAutoreleasedReturnValue( +[PassEntitlement passEntitlementsForSubcredentialIdentifier:inDatabase:]( &OBJC_CLASS___PassEntitlement,  "passEntitlementsForSubcredentialIdentifier:inDatabase:",  v9,  self->super._database));

  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "pk_firstObjectPassingTest:", &stru_1006531A8));
  -[PKAppletSubcredential setEntitlement:](v7, "setEntitlement:", v11);

  id v12 = (void *)objc_claimAutoreleasedReturnValue( +[AppletSubcredentialAliroGroupResolvingKey aliroGroupResolvingKeysInDatabase:forAppletSubcredentialPID:]( &OBJC_CLASS___AppletSubcredentialAliroGroupResolvingKey,  "aliroGroupResolvingKeysInDatabase:forAppletSubcredentialPID:",  self->super._database,  -[SQLiteEntity persistentID](self, "persistentID")));
  -[PKAppletSubcredential setAliroGroupResolvingKeys:](v7, "setAliroGroupResolvingKeys:", v12);
  id v13 = v7;

  return v13;
}

- (int64_t)paymentApplicationPID
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"a"));
  id v3 = [v2 longLongValue];

  return (int64_t)v3;
}

- (BOOL)deleteFromDatabase
{
  v2 = self;
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity database](self, "database"));
  id v4 = -[SQLiteEntity persistentID](v2, "persistentID");
  id v5 = -[SQLiteEntity initWithPersistentID:inDatabase:]( objc_alloc(&OBJC_CLASS___PaymentApplication),  "initWithPersistentID:inDatabase:",  -[AppletSubcredential paymentApplicationPID](v2, "paymentApplicationPID"),  v3);
  +[AppletSubcredentialRangingSuspensionReasons deleteRangingSuspensionReasonsForCredential:forPaymentApplication:inDatabase:]( &OBJC_CLASS___AppletSubcredentialRangingSuspensionReasons,  "deleteRangingSuspensionReasonsForCredential:forPaymentApplication:inDatabase:",  v2,  v5,  v3);

  +[AppletSubcredentialAliroGroupResolvingKey deleteEntitiesInDatabase:forAppletSubcredentialPID:]( &OBJC_CLASS___AppletSubcredentialAliroGroupResolvingKey,  "deleteEntitiesInDatabase:forAppletSubcredentialPID:",  v3,  v4);
  v7.receiver = v2;
  v7.super_class = (Class)&OBJC_CLASS___AppletSubcredential;
  LOBYTE(v2) = -[SQLiteEntity deleteFromDatabase](&v7, "deleteFromDatabase");

  return (char)v2;
}

+ (id)_predicateForAppletSubcredentialPID:(int64_t)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a3));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"pid",  v3));

  return v4;
}

+ (id)_predicateForAppletSubcredentialIdentifier:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"b",  a3);
}

+ (id)_predicateForAppletSubcredentialWithPaymentApplicationPID:(int64_t)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a3));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"a",  v3));

  return v4;
}

+ (id)_predicateForAppletSubcredentialWithPairedReaderIdentifier:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"f",  a3);
}

+ (id)_propertySetters
{
  v3[0] = @"b";
  v3[1] = @"c";
  v4[0] = &stru_1006531E8;
  v4[1] = &stru_100653208;
  v3[2] = @"d";
  v3[3] = @"e";
  v4[2] = &stru_100653228;
  v4[3] = &stru_100653248;
  v3[4] = @"f";
  v3[5] = @"p";
  v4[4] = &stru_100653268;
  v4[5] = &stru_100653288;
  v3[6] = @"g";
  v3[7] = @"h";
  v4[6] = &stru_1006532A8;
  v4[7] = &stru_1006532C8;
  v3[8] = @"i";
  v3[9] = @"j";
  v4[8] = &stru_1006532E8;
  v4[9] = &stru_100653308;
  v3[10] = @"k";
  v3[11] = @"l";
  v4[10] = &stru_100653328;
  v4[11] = &stru_100653348;
  v3[12] = @"m";
  v3[13] = @"n";
  v4[12] = &stru_100653368;
  v4[13] = &stru_100653388;
  v3[14] = @"o";
  v3[15] = @"q";
  v4[14] = &stru_1006533A8;
  v4[15] = &stru_1006533C8;
  v3[16] = @"r";
  v3[17] = @"s";
  v4[16] = &stru_1006533E8;
  v4[17] = &stru_100653408;
  v3[18] = @"t";
  v3[19] = @"u";
  v4[18] = &stru_100653428;
  v4[19] = &stru_100653448;
  return (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v4,  v3,  20LL));
}

+ (id)databaseTable
{
  return @"whitney";
}

@end
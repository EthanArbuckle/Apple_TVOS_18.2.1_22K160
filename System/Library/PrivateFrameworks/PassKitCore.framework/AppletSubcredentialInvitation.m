@interface AppletSubcredentialInvitation
+ (BOOL)deleteInvitationWithIdentifier:(id)a3 inDatabase:(id)a4;
+ (id)_dictionaryFromSharedCredentialInvitation:(id)a3;
+ (id)_predicateForIdentifier:(id)a3;
+ (id)_propertySetters;
+ (id)addInvitation:(id)a3 inDatabase:(id)a4;
+ (id)databaseTable;
+ (id)invitationWithIdentifier:(id)a3 inDatabase:(id)a4;
+ (id)invitationsInDatabase:(id)a3;
- (id)invitation;
@end

@implementation AppletSubcredentialInvitation

+ (id)invitationsInDatabase:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[SQLiteBooleanPredicate truePredicate](&OBJC_CLASS___SQLiteBooleanPredicate, "truePredicate"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v4 predicate:v5]);

  v7 = (void *)objc_claimAutoreleasedReturnValue( +[AppletSubcredentialInvitation _propertySetters]( &OBJC_CLASS___AppletSubcredentialInvitation,  "_propertySetters"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
  v9 = (void *)objc_claimAutoreleasedReturnValue([v7 allKeys]);
  v14 = _NSConcreteStackBlock;
  uint64_t v15 = 3221225472LL;
  v16 = sub_1003ACF58;
  v17 = &unk_100639E18;
  id v18 = v7;
  id v19 = v8;
  id v10 = v8;
  id v11 = v7;
  [v6 enumeratePersistentIDsAndProperties:v9 usingBlock:&v14];

  id v12 = objc_msgSend(v10, "copy", v14, v15, v16, v17);
  return v12;
}

+ (id)invitationWithIdentifier:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForIdentifier:a3]);
  v8 = (void *)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v6 predicate:v7]);

  return v8;
}

+ (id)addInvitation:(id)a3 inDatabase:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v17 = 0LL;
  id v18 = &v17;
  uint64_t v19 = 0x3032000000LL;
  v20 = sub_1003AD158;
  v21 = sub_1003AD168;
  id v22 = 0LL;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_1003AD170;
  v12[3] = &unk_10063D3E8;
  id v16 = a1;
  id v8 = v6;
  id v13 = v8;
  id v9 = v7;
  id v14 = v9;
  uint64_t v15 = &v17;
  sub_1002CCC5C((uint64_t)v9, v12);
  id v10 = (id)v18[5];

  _Block_object_dispose(&v17, 8);
  return v10;
}

+ (BOOL)deleteInvitationWithIdentifier:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForIdentifier:a3]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v6 predicate:v7]);

  LOBYTE(v6) = [v8 deleteFromDatabase];
  return (char)v6;
}

+ (id)_predicateForIdentifier:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"a",  a3);
}

+ (id)_dictionaryFromSharedCredentialInvitation:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  v5 = (void *)objc_claimAutoreleasedReturnValue([v3 identifier]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v5, @"a");

  id v6 = (void *)objc_claimAutoreleasedReturnValue([v3 partnerIdentifier]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v6, @"b");

  id v7 = (void *)objc_claimAutoreleasedReturnValue([v3 brandIdentifier]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v7, @"l");

  id v8 = (void *)objc_claimAutoreleasedReturnValue([v3 pairedReaderIdentifier]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v8, @"c");

  id v9 = (void *)objc_claimAutoreleasedReturnValue([v3 recipientName]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v9, @"d");

  id v10 = (void *)objc_claimAutoreleasedReturnValue([v3 sharingSessionIdentifier]);
  id v11 = v10;
  if (v10)
  {
    [v10 getUUIDBytes:v21];
    id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:", v21, 16LL));
    -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v12, @"e");
  }

  else
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
    -[NSMutableDictionary setObject:forKey:](v4, "setObject:forKey:", v12, @"e");
  }

  id v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v3 entitlement]));
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v13, @"f");

  id v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v3 isForWatch]));
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v14, @"g");

  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v3 originatorIDSHandle]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v15, @"h");

  id v16 = (void *)objc_claimAutoreleasedReturnValue([v3 issuer]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v16, @"i");

  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v3 deviceModel]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v17, @"j");

  id v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v3 supportedRadioTechnologies]));
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v18, @"k");

  id v19 = -[NSMutableDictionary copy](v4, "copy");
  return v19;
}

- (id)invitation
{
  id v3 = objc_alloc_init(&OBJC_CLASS___PKAppletSubcredentialSharingInvitation);
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[AppletSubcredentialInvitation _propertySetters]( &OBJC_CLASS___AppletSubcredentialInvitation,  "_propertySetters"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 allKeys]);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_1003AD690;
  v11[3] = &unk_100639EE8;
  id v12 = v4;
  id v6 = v3;
  id v13 = v6;
  id v7 = v4;
  -[SQLiteEntity getValuesForProperties:withApplier:](self, "getValuesForProperties:withApplier:", v5, v11);

  id v8 = v13;
  id v9 = v6;

  return v9;
}

+ (id)_propertySetters
{
  v3[0] = @"a";
  v3[1] = @"b";
  v4[0] = &stru_10065AF90;
  v4[1] = &stru_10065AFB0;
  v3[2] = @"l";
  v3[3] = @"c";
  v4[2] = &stru_10065AFD0;
  v4[3] = &stru_10065AFF0;
  v3[4] = @"d";
  v3[5] = @"e";
  v4[4] = &stru_10065B010;
  v4[5] = &stru_10065B030;
  v3[6] = @"f";
  v3[7] = @"g";
  v4[6] = &stru_10065B050;
  v4[7] = &stru_10065B070;
  v3[8] = @"h";
  v3[9] = @"i";
  v4[8] = &stru_10065B090;
  v4[9] = &stru_10065B0B0;
  v3[10] = @"j";
  v3[11] = @"k";
  v4[10] = &stru_10065B0D0;
  v4[11] = &stru_10065B0F0;
  return (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v4,  v3,  12LL));
}

+ (id)databaseTable
{
  return @"palisades";
}

@end
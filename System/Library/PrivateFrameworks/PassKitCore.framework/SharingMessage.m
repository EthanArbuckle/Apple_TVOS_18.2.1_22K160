@interface SharingMessage
+ (BOOL)hasSharingMessage:(id)a3 transportIdentifier:(id)a4 inDatabase:(id)a5;
+ (id)_predicateForCreatedAtNewerThanDate:(id)a3;
+ (id)_predicateForCreatedAtOlderThanDate:(id)a3;
+ (id)_predicateForMessageIdentifier:(id)a3;
+ (id)_predicateForNonNullPayload;
+ (id)_predicateForPayloadHash:(id)a3;
+ (id)_predicateForTransportIdentifier:(id)a3;
+ (id)_predicateForValidTransportIdentifier;
+ (id)_propertyValuesForSharingMessage:(id)a3 storePayload:(BOOL)a4;
+ (id)_sharingMessageForProperties:(id)a3 values:(const void *)a4;
+ (id)_sharingMessagesWithQuery:(id)a3 inDatabase:(id)a4;
+ (id)allOutstandingSharingMessagesInDatabase:(id)a3;
+ (id)databaseTable;
+ (id)properties;
+ (id)sharingMessageForMessageIdentifier:(id)a3 inDatabase:(id)a4;
+ (id)sharingMessagesForTransportIdentifier:(id)a3 inDatabase:(id)a4;
+ (id)sharingMessagesForTransportIdentifier:(id)a3 newerThanDate:(id)a4 inDatabase:(id)a5;
+ (id)transportIdentifierForSharingMessage:(id)a3 inDatabase:(id)a4;
+ (void)deleteSharingMessageForIdentifier:(id)a3 inDatabase:(id)a4;
+ (void)deleteSharingMessagesForTransportIdentifier:(id)a3 inDatabase:(id)a4;
+ (void)deleteSharingMessagesOlderThan:(id)a3 inDatabase:(id)a4;
+ (void)insertOrUpdateSharingMessages:(id)a3 storePayloads:(BOOL)a4 transportIdentifier:(id)a5 inDatabase:(id)a6;
- (SharingMessage)initWithSharingMessage:(id)a3 storePayload:(BOOL)a4 forTransportIdentifier:(id)a5 inDatabase:(id)a6;
- (id)sharingMessage;
- (void)updateWithSharingMessage:(id)a3 storePayload:(BOOL)a4;
@end

@implementation SharingMessage

+ (id)databaseTable
{
  return @"romanesco";
}

- (SharingMessage)initWithSharingMessage:(id)a3 storePayload:(BOOL)a4 forTransportIdentifier:(id)a5 inDatabase:(id)a6
{
  BOOL v7 = a4;
  id v10 = a6;
  id v11 = a5;
  id v12 = a3;
  id v14 = objc_msgSend((id)objc_opt_class(self, v13), "_propertyValuesForSharingMessage:storePayload:", v12, v7);
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);

  [v15 setObjectOrNull:v11 forKey:@"a"];
  v16 = -[SQLiteEntity initWithPropertyValues:inDatabase:](self, "initWithPropertyValues:inDatabase:", v15, v10);

  return v16;
}

- (void)updateWithSharingMessage:(id)a3 storePayload:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v8 = objc_msgSend((id)objc_opt_class(self, v7), "_propertyValuesForSharingMessage:storePayload:", v6, v4);
  id v9 = (id)objc_claimAutoreleasedReturnValue(v8);

  -[SQLiteEntity setValuesWithDictionary:](self, "setValuesWithDictionary:", v9);
}

+ (void)insertOrUpdateSharingMessages:(id)a3 storePayloads:(BOOL)a4 transportIdentifier:(id)a5 inDatabase:(id)a6
{
  BOOL v23 = a4;
  id v8 = a3;
  id v9 = a5;
  id v10 = a6;
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  id obj = v8;
  id v24 = [v8 countByEnumeratingWithState:&v26 objects:v31 count:16];
  if (v24)
  {
    uint64_t v21 = *(void *)v27;
    do
    {
      for (i = 0LL; i != v24; i = (char *)i + 1)
      {
        if (*(void *)v27 != v21) {
          objc_enumerationMutation(obj);
        }
        id v12 = *(void **)(*((void *)&v26 + 1) + 8LL * (void)i);
        uint64_t v13 = objc_claimAutoreleasedReturnValue([v12 identifier]);
        id v14 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForTransportIdentifier:v9]);
        v30[0] = v14;
        v25 = (void *)v13;
        v15 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForMessageIdentifier:v13]);
        v30[1] = v15;
        id v16 = v9;
        v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v30, 2LL));
        v18 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v17));
        v19 = (SharingMessage *)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v10 predicate:v18]);

        if (v19) {
          -[SharingMessage updateWithSharingMessage:storePayload:]( v19,  "updateWithSharingMessage:storePayload:",  v12,  v23);
        }
        else {
          v19 = -[SharingMessage initWithSharingMessage:storePayload:forTransportIdentifier:inDatabase:]( objc_alloc(&OBJC_CLASS___SharingMessage),  "initWithSharingMessage:storePayload:forTransportIdentifier:inDatabase:",  v12,  v23,  v16,  v10);
        }
        id v9 = v16;
      }

      id v24 = [obj countByEnumeratingWithState:&v26 objects:v31 count:16];
    }

    while (v24);
  }
}

+ (BOOL)hasSharingMessage:(id)a3 transportIdentifier:(id)a4 inDatabase:(id)a5
{
  id v22 = a5;
  id v8 = a3;
  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForTransportIdentifier:a4]);
  v24[0] = v21;
  v20 = (void *)objc_claimAutoreleasedReturnValue([v8 identifier]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForMessageIdentifier:v20]);
  v23[0] = v9;
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v8 payload]);

  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 SHA256Hash]);
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 hexEncoding]);
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForPayloadHash:v12]);
  v23[1] = v13;
  id v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v23, 2LL));
  v15 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAnyPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAnyPredicates:",  v14));
  v24[1] = v15;
  id v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v24, 2LL));
  v17 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v16));

  v18 = (void *)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v22 predicate:v17]);
  return v18 != 0LL;
}

+ (id)transportIdentifierForSharingMessage:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([a3 identifier]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForMessageIdentifier:v7]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v6 predicate:v8]);

  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 valueForProperty:@"a"]);
  return v10;
}

+ (id)sharingMessagesForTransportIdentifier:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForTransportIdentifier:a3]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v7]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([a1 _sharingMessagesWithQuery:v8 inDatabase:v6]);

  return v9;
}

+ (id)sharingMessagesForTransportIdentifier:(id)a3 newerThanDate:(id)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForTransportIdentifier:a3]);
  v17[0] = v10;
  id v11 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForCreatedAtNewerThanDate:v9]);

  v17[1] = v11;
  id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v17, 2LL));
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v12));

  id v14 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v8 predicate:v13]);
  v15 = (void *)objc_claimAutoreleasedReturnValue([a1 _sharingMessagesWithQuery:v14 inDatabase:v8]);

  return v15;
}

+ (id)sharingMessageForMessageIdentifier:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForMessageIdentifier:a3]);
  uint64_t v13 = v7;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v13, 1LL));
  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v8));
  id v10 = (void *)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v6 predicate:v9]);

  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 sharingMessage]);
  return v11;
}

+ (void)deleteSharingMessageForIdentifier:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v8 = (id)objc_claimAutoreleasedReturnValue([a1 _predicateForMessageIdentifier:a3]);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v8]);

  [v7 deleteAllEntities];
}

+ (void)deleteSharingMessagesForTransportIdentifier:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v8 = (id)objc_claimAutoreleasedReturnValue([a1 _predicateForTransportIdentifier:a3]);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v8]);

  [v7 deleteAllEntities];
}

+ (void)deleteSharingMessagesOlderThan:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v8 = (id)objc_claimAutoreleasedReturnValue([a1 _predicateForCreatedAtOlderThanDate:a3]);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v8]);

  [v7 deleteAllEntities];
}

+ (id)allOutstandingSharingMessagesInDatabase:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForNonNullPayload]);
  v18[0] = v5;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForValidTransportIdentifier]);
  v18[1] = v6;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v18, 2LL));
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v7));

  id v9 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v4 predicate:v8]);
  id v10 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v11 = (void *)objc_claimAutoreleasedReturnValue([a1 properties]);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_10016B130;
  v15[3] = &unk_10063C288;
  id v17 = a1;
  id v12 = v10;
  id v16 = v12;
  [v9 enumeratePersistentIDsAndProperties:v11 usingBlock:v15];

  if (-[NSMutableDictionary count](v12, "count")) {
    id v13 = -[NSMutableDictionary copy](v12, "copy");
  }
  else {
    id v13 = 0LL;
  }

  return v13;
}

+ (id)_sharingMessagesWithQuery:(id)a3 inDatabase:(id)a4
{
  id v5 = a3;
  id v6 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([a1 properties]);
  id v11 = _NSConcreteStackBlock;
  uint64_t v12 = 3221225472LL;
  id v13 = sub_10016B2E8;
  id v14 = &unk_10063C288;
  id v16 = a1;
  id v8 = v6;
  v15 = v8;
  [v5 enumeratePersistentIDsAndProperties:v7 usingBlock:&v11];

  if (-[NSMutableArray count](v8, "count", v11, v12, v13, v14)) {
    id v9 = -[NSMutableArray copy](v8, "copy");
  }
  else {
    id v9 = 0LL;
  }

  return v9;
}

- (id)sharingMessage
{
  uint64_t v8 = 0LL;
  id v9 = &v8;
  uint64_t v10 = 0x3032000000LL;
  id v11 = sub_10016B414;
  uint64_t v12 = sub_10016B424;
  id v13 = 0LL;
  id v3 = objc_msgSend((id)objc_opt_class(self, a2), "properties");
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10016B42C;
  v7[3] = &unk_10063FDD0;
  v7[4] = self;
  v7[5] = &v8;
  -[SQLiteEntity getValuesForProperties:withApplier:](self, "getValuesForProperties:withApplier:", v4, v7);

  id v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

+ (id)_predicateForTransportIdentifier:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"a",  a3);
}

+ (id)_predicateForMessageIdentifier:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"b",  a3);
}

+ (id)_predicateForValidTransportIdentifier
{
  return +[SQLiteComparisonPredicate predicateWithProperty:notEqualToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:notEqualToValue:",  @"a",  @"Empty");
}

+ (id)_predicateForNonNullPayload
{
  return +[SQLiteNullPredicate isNotNullPredicateWithProperty:]( &OBJC_CLASS___SQLiteNullPredicate,  "isNotNullPredicateWithProperty:",  @"c");
}

+ (id)_predicateForCreatedAtOlderThanDate:(id)a3
{
  id v3 = (void *)_SQLValueForDate(a3);
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:lessThanValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:lessThanValue:",  @"e",  v3));

  return v4;
}

+ (id)_predicateForCreatedAtNewerThanDate:(id)a3
{
  id v3 = (void *)_SQLValueForDate(a3);
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:greaterThanValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:greaterThanValue:",  @"e",  v3));

  return v4;
}

+ (id)_predicateForPayloadHash:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"d",  a3);
}

+ (id)_sharingMessageForProperties:(id)a3 values:(const void *)a4
{
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472LL;
  v29[2] = sub_10016B7B8;
  v29[3] = &unk_100647278;
  id v5 = a3;
  id v30 = v5;
  v31 = a4;
  id v6 = objc_retainBlock(v29);
  uint64_t v7 = ((uint64_t (*)(void *, const __CFString *))v6[2])(v6, @"b");
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  uint64_t v9 = ((uint64_t (*)(void *, const __CFString *))v6[2])(v6, @"c");
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  if (v10) {
    BOOL v11 = v8 == 0LL;
  }
  else {
    BOOL v11 = 1;
  }
  if (v11)
  {
    uint64_t v12 = 0LL;
  }

  else
  {
    uint64_t v13 = ((uint64_t (*)(void *, const __CFString *))v6[2])(v6, @"f");
    uint64_t v14 = objc_claimAutoreleasedReturnValue(v13);
    v15 = (void *)v14;
    if (v14)
    {
      uint64_t v16 = ((uint64_t (*)(void *, const __CFString *))v6[2])(v6, @"g");
      id v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
      uint64_t v18 = ((uint64_t (*)(void *, const __CFString *))v6[2])(v6, @"h");
      v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
      v20 = (void *)_URLForSQLValue(v19);

      uint64_t v21 = ((uint64_t (*)(void *, const __CFString *))v6[2])(v6, @"i");
      id v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
      BOOL v23 = (void *)_URLForSQLValue(v22);

      id v24 = -[PKSharingMessageDisplayInformation initWithTitle:subtitle:imageURL:openGraphURL:]( objc_alloc(&OBJC_CLASS___PKSharingMessageDisplayInformation),  "initWithTitle:subtitle:imageURL:openGraphURL:",  v15,  v17,  v20,  v23);
    }

    else
    {
      id v24 = 0LL;
    }

    id v28 = 0LL;
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( +[PKSharingMessage specializedMessageFromPayload:displayInformation:outError:]( &OBJC_CLASS___PKSharingMessage,  "specializedMessageFromPayload:displayInformation:outError:",  v10,  v24,  &v28));
    id v25 = v28;
    __int128 v26 = v25;
    if (!v12 || v25)
    {

      uint64_t v12 = 0LL;
    }

    else
    {
      [v12 setIdentifier:v8];
    }
  }

  return v12;
}

+ (id)_propertyValuesForSharingMessage:(id)a3 storePayload:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  id v6 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v5 identifier]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v6, "setObjectOrNull:forKey:", v7, @"b");

  if (v4)
  {
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v5 payload]);
    -[NSMutableDictionary setObjectOrNull:forKey:](v6, "setObjectOrNull:forKey:", v8, @"c");
  }

  else
  {
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v6, "setObject:forKeyedSubscript:", v8, @"c");
  }

  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v5 payload]);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 SHA256Hash]);
  BOOL v11 = (void *)objc_claimAutoreleasedReturnValue([v10 hexEncoding]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v6, "setObjectOrNull:forKey:", v11, @"d");

  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
  uint64_t v13 = (void *)_SQLValueForDate(v12);
  -[NSMutableDictionary setObjectOrNull:forKey:](v6, "setObjectOrNull:forKey:", v13, @"e");

  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v5 displayInformation]);
  v15 = v14;
  if (v14)
  {
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v14 title]);
    -[NSMutableDictionary setObjectOrNull:forKey:](v6, "setObjectOrNull:forKey:", v16, @"f");

    id v17 = (void *)objc_claimAutoreleasedReturnValue([v15 subtitle]);
    -[NSMutableDictionary setObjectOrNull:forKey:](v6, "setObjectOrNull:forKey:", v17, @"g");

    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v15 imageURL]);
    v19 = (void *)_SQLValueForURL(v18);
    -[NSMutableDictionary setObjectOrNull:forKey:](v6, "setObjectOrNull:forKey:", v19, @"h");

    v20 = (void *)objc_claimAutoreleasedReturnValue([v15 openGraphURL]);
    uint64_t v21 = (void *)_SQLValueForURL(v20);
    -[NSMutableDictionary setObjectOrNull:forKey:](v6, "setObjectOrNull:forKey:", v21, @"i");
  }

  return v6;
}

+ (id)properties
{
  v3[0] = @"pid";
  v3[1] = @"a";
  v3[2] = @"b";
  v3[3] = @"c";
  v3[4] = @"d";
  v3[5] = @"e";
  v3[6] = @"f";
  v3[7] = @"g";
  v3[8] = @"h";
  v3[9] = @"i";
  return (id)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  v3,  10LL));
}

@end
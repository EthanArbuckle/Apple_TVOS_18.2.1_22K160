@interface PeerPaymentRecurringPayment
+ (id)_peerPaymentRecurringPaymentsWithQuery:(id)a3 database:(id)a4;
+ (id)_predicateForHasMemo;
+ (id)_predicateForMPANIdentifier:(id)a3;
+ (id)_predicateForPeerPaymentRecurringPaymentWithIdentifier:(id)a3;
+ (id)_predicateForPeerPaymentRecurringPaymentsWithAccountPID:(int64_t)a3;
+ (id)_propertySettersForPeerPaymentRecurringPaymentWithProperties:(id)a3 effectiveProperties:(id *)a4;
+ (id)_recurringPaymentsInDatabase:(id)a3 matchingPredicate:(id)a4;
+ (id)anyInDatabase:(id)a3;
+ (id)associationPropertyForEntityClass:(Class)a3;
+ (id)databaseTable;
+ (id)peerPaymentRecurringPaymentForIdentifier:(id)a3 inDatabase:(id)a4;
+ (id)peerPaymentRecurringPaymentForMPANIdentifier:(id)a3 inDatabase:(id)a4;
+ (id)peerPaymentRecurringPaymentsForIdentifiers:(id)a3 inDatabase:(id)a4;
+ (id)peerPaymentRecurringPaymentsForPeerPaymentAccountPID:(int64_t)a3 inDatabase:(id)a4;
+ (id)peerPaymentRecurringPaymentsForPeerPaymentType:(unint64_t)a3 withAccountPID:(int64_t)a4 inDatabase:(id)a5;
+ (id)recurringPaymentIdentifiersWithMemoInDatabase:(id)a3;
+ (id)recurringPaymentWithIdentifier:(id)a3 inDatabase:(id)a4;
+ (void)deleteEntitiesForPeerPaymentAccountPID:(int64_t)a3 inDatabase:(id)a4;
+ (void)deleteEntitiesForPeerPaymentRecurringPaymentIdentifiers:(id)a3 inDatabase:(id)a4;
+ (void)deleteEntitiesForPeerPaymentRecurringPaymentNotIncludingIdentifiers:(id)a3 inDatabase:(id)a4;
+ (void)insertOrUpdatePeerPaymentRecurringPayments:(id)a3 forPeerPaymentAccountPID:(int64_t)a4 inDatabase:(id)a5;
- (BOOL)deleteFromDatabase;
- (PeerPaymentRecurringPayment)initWithPeerPaymentRecurringPayment:(id)a3 forPeerPaymentAccountPID:(int64_t)a4 inDatabase:(id)a5;
- (void)updateWithPeerPaymentRecurringPayment:(id)a3;
@end

@implementation PeerPaymentRecurringPayment

+ (id)databaseTable
{
  return @"bokchoy";
}

+ (id)associationPropertyForEntityClass:(Class)a3
{
  if ((Class)objc_opt_class(&OBJC_CLASS___PeerPaymentRecurringPayment, a2) == a3) {
    return @"a";
  }
  else {
    return 0LL;
  }
}

- (PeerPaymentRecurringPayment)initWithPeerPaymentRecurringPayment:(id)a3 forPeerPaymentAccountPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  v10 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  v11 = (void *)objc_claimAutoreleasedReturnValue([v9 fundingSource]);
  v12 = (void *)objc_claimAutoreleasedReturnValue([v9 memo]);
  v13 = (void *)objc_claimAutoreleasedReturnValue([v9 lastExecutedTransaction]);
  v14 = (void *)objc_claimAutoreleasedReturnValue([v9 identifier]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v10, "setObjectOrNull:forKey:", v14, @"a");

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a4));
  -[NSMutableDictionary setObjectOrNull:forKey:](v10, "setObjectOrNull:forKey:", v15, @"b");

  -[NSMutableDictionary setInteger:forKey:](v10, "setInteger:forKey:", [v9 type], @"c");
  v16 = (void *)objc_claimAutoreleasedReturnValue([v9 senderAddress]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v10, "setObjectOrNull:forKey:", v16, @"d");

  v17 = (void *)objc_claimAutoreleasedReturnValue([v9 recipientAddress]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v10, "setObjectOrNull:forKey:", v17, @"e");

  v18 = (void *)objc_claimAutoreleasedReturnValue([v9 recipientAltDSID]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v10, "setObjectOrNull:forKey:", v18, @"f");

  -[NSMutableDictionary setBool:forKey:](v10, "setBool:forKey:", [v9 sentByMe], @"z");
  v19 = (void *)objc_claimAutoreleasedReturnValue([v9 amount]);
  uint64_t v20 = PKCurrencyDecimalToStorageNumber(v19);
  v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
  -[NSMutableDictionary setObjectOrNull:forKey:](v10, "setObjectOrNull:forKey:", v21, @"g");

  v22 = (void *)objc_claimAutoreleasedReturnValue([v9 threshold]);
  uint64_t v23 = PKCurrencyDecimalToStorageNumber(v22);
  v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
  -[NSMutableDictionary setObjectOrNull:forKey:](v10, "setObjectOrNull:forKey:", v24, @"u");

  v25 = (void *)objc_claimAutoreleasedReturnValue([v9 currency]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v10, "setObjectOrNull:forKey:", v25, @"h");

  -[NSMutableDictionary setInteger:forKey:](v10, "setInteger:forKey:", [v9 frequency], @"o");
  v26 = (void *)objc_claimAutoreleasedReturnValue([v11 dpanIdentifier]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v10, "setObjectOrNull:forKey:", v26, @"i");

  v27 = (void *)objc_claimAutoreleasedReturnValue([v11 fpanIdentifier]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v10, "setObjectOrNull:forKey:", v27, @"j");

  v28 = (void *)objc_claimAutoreleasedReturnValue([v11 mpanIdentifier]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v10, "setObjectOrNull:forKey:", v28, @"v");

  v29 = (void *)objc_claimAutoreleasedReturnValue([v11 name]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v10, "setObjectOrNull:forKey:", v29, @"k");

  -[NSMutableDictionary setInteger:forKey:](v10, "setInteger:forKey:", [v11 type], @"l");
  -[NSMutableDictionary setInteger:forKey:](v10, "setInteger:forKey:", [v11 network], @"m");
  v30 = (void *)objc_claimAutoreleasedReturnValue([v11 suffix]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v10, "setObjectOrNull:forKey:", v30, @"n");

  v31 = (void *)objc_claimAutoreleasedReturnValue([v9 startDate]);
  v32 = (void *)_SQLValueForDate(v31);
  -[NSMutableDictionary setObjectOrNull:forKey:](v10, "setObjectOrNull:forKey:", v32, @"p");

  -[NSMutableDictionary setInteger:forKey:](v10, "setInteger:forKey:", [v9 status], @"r");
  -[NSMutableDictionary setInteger:forKey:](v10, "setInteger:forKey:", [v9 actions], @"s");
  v33 = (void *)objc_claimAutoreleasedReturnValue([v12 text]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v10, "setObjectOrNull:forKey:", v33, @"w");

  uint64_t v34 = PKSemanticColorToString([v12 color]);
  v35 = (void *)objc_claimAutoreleasedReturnValue(v34);
  -[NSMutableDictionary setObjectOrNull:forKey:](v10, "setObjectOrNull:forKey:", v35, @"y");

  v36 = (void *)objc_claimAutoreleasedReturnValue([v12 emoji]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v10, "setObjectOrNull:forKey:", v36, @"x");

  v37 = (void *)objc_claimAutoreleasedReturnValue([v13 identifier]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v10, "setObjectOrNull:forKey:", v37, @"aa");

  -[NSMutableDictionary setInteger:forKey:](v10, "setInteger:forKey:", [v13 status], @"ab");
  v38 = (void *)objc_claimAutoreleasedReturnValue([v13 executionDate]);
  v39 = (void *)_SQLValueForDate(v38);
  -[NSMutableDictionary setObjectOrNull:forKey:](v10, "setObjectOrNull:forKey:", v39, @"ac");

  -[NSMutableDictionary setInteger:forKey:](v10, "setInteger:forKey:", [v13 errorCode], @"ad");
  -[NSMutableDictionary setBool:forKey:](v10, "setBool:forKey:", [v9 usesAppleCashBalance], @"ae");
  v40 = (void *)objc_claimAutoreleasedReturnValue([v9 createdDate]);
  v41 = (void *)_SQLValueForDate(v40);
  -[NSMutableDictionary setObjectOrNull:forKey:](v10, "setObjectOrNull:forKey:", v41, @"af");

  v42 = (void *)objc_claimAutoreleasedReturnValue([v9 upcomingPaymentDates]);
  if (v42) {
    v43 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  v42,  1LL,  0LL));
  }
  else {
    v43 = 0LL;
  }
  -[NSMutableDictionary setObjectOrNull:forKey:](v10, "setObjectOrNull:forKey:", v43, @"t");
  v44 = -[SQLiteEntity initWithPropertyValues:inDatabase:](self, "initWithPropertyValues:inDatabase:", v10, v8);

  return v44;
}

+ (id)peerPaymentRecurringPaymentsForIdentifiers:(id)a3 inDatabase:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  id v9 = v6;
  id v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v19;
    do
    {
      v13 = 0LL;
      do
      {
        if (*(void *)v19 != v12) {
          objc_enumerationMutation(v9);
        }
        v14 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( a1,  "_predicateForPeerPaymentRecurringPaymentWithIdentifier:",  *(void *)(*((void *)&v18 + 1) + 8 * (void)v13),  (void)v18));
        v15 = (void *)objc_claimAutoreleasedReturnValue([a1 _recurringPaymentsInDatabase:v7 matchingPredicate:v14]);
        -[NSMutableArray addObjectsFromArray:](v8, "addObjectsFromArray:", v15);

        v13 = (char *)v13 + 1;
      }

      while (v11 != v13);
      id v11 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }

    while (v11);
  }

  id v16 = -[NSMutableArray copy](v8, "copy");
  return v16;
}

+ (id)peerPaymentRecurringPaymentForIdentifier:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForPeerPaymentRecurringPaymentWithIdentifier:a3]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v7]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([a1 _peerPaymentRecurringPaymentsWithQuery:v8 database:v6]);

  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 firstObject]);
  return v10;
}

+ (id)peerPaymentRecurringPaymentForMPANIdentifier:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForMPANIdentifier:a3]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v7]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([a1 _peerPaymentRecurringPaymentsWithQuery:v8 database:v6]);

  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 firstObject]);
  return v10;
}

+ (id)recurringPaymentWithIdentifier:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForPeerPaymentRecurringPaymentWithIdentifier:a3]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v6 predicate:v7]);

  return v8;
}

+ (id)peerPaymentRecurringPaymentsForPeerPaymentAccountPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForPeerPaymentRecurringPaymentsWithAccountPID:a3]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 _recurringPaymentsInDatabase:v6 matchingPredicate:v7]);

  return v8;
}

+ (id)peerPaymentRecurringPaymentsForPeerPaymentType:(unint64_t)a3 withAccountPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForPeerPaymentRecurringPaymentsWithAccountPID:a4]);
  v16[0] = v9;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a3));
  id v11 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"c",  v10));
  v16[1] = v11;
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v16, 2LL));
  v13 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v12));

  v14 = (void *)objc_claimAutoreleasedReturnValue([a1 _recurringPaymentsInDatabase:v8 matchingPredicate:v13]);
  return v14;
}

- (void)updateWithPeerPaymentRecurringPayment:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 fundingSource]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 memo]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v4 lastExecutedTransaction]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);
  [v5 setObjectOrNull:v9 forKey:@"a"];

  objc_msgSend(v5, "setInteger:forKey:", objc_msgSend(v4, "type"), @"c");
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v4 senderAddress]);
  [v5 setObjectOrNull:v10 forKey:@"d"];

  id v11 = (void *)objc_claimAutoreleasedReturnValue([v4 recipientAddress]);
  [v5 setObjectOrNull:v11 forKey:@"e"];

  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v4 recipientAltDSID]);
  [v5 setObjectOrNull:v12 forKey:@"f"];

  objc_msgSend(v5, "setBool:forKey:", objc_msgSend(v4, "sentByMe"), @"z");
  v13 = (void *)objc_claimAutoreleasedReturnValue([v4 amount]);
  uint64_t v14 = PKCurrencyDecimalToStorageNumber(v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  [v5 setObjectOrNull:v15 forKey:@"g"];

  id v16 = (void *)objc_claimAutoreleasedReturnValue([v4 threshold]);
  uint64_t v17 = PKCurrencyDecimalToStorageNumber(v16);
  __int128 v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
  [v5 setObjectOrNull:v18 forKey:@"u"];

  __int128 v19 = (void *)objc_claimAutoreleasedReturnValue([v4 currency]);
  [v5 setObjectOrNull:v19 forKey:@"h"];

  __int128 v20 = (void *)objc_claimAutoreleasedReturnValue([v6 dpanIdentifier]);
  [v5 setObjectOrNull:v20 forKey:@"i"];

  __int128 v21 = (void *)objc_claimAutoreleasedReturnValue([v6 fpanIdentifier]);
  [v5 setObjectOrNull:v21 forKey:@"j"];

  v22 = (void *)objc_claimAutoreleasedReturnValue([v6 mpanIdentifier]);
  [v5 setObjectOrNull:v22 forKey:@"v"];

  uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([v6 name]);
  [v5 setObjectOrNull:v23 forKey:@"k"];

  objc_msgSend(v5, "setInteger:forKey:", objc_msgSend(v6, "type"), @"l");
  objc_msgSend(v5, "setInteger:forKey:", objc_msgSend(v6, "network"), @"m");
  v24 = (void *)objc_claimAutoreleasedReturnValue([v6 suffix]);
  [v5 setObjectOrNull:v24 forKey:@"n"];

  objc_msgSend(v5, "setInteger:forKey:", objc_msgSend(v4, "frequency"), @"o");
  v25 = (void *)objc_claimAutoreleasedReturnValue([v4 startDate]);
  v26 = (void *)_SQLValueForDate(v25);
  [v5 setObjectOrNull:v26 forKey:@"p"];

  objc_msgSend(v5, "setInteger:forKey:", objc_msgSend(v4, "status"), @"r");
  objc_msgSend(v5, "setInteger:forKey:", objc_msgSend(v4, "actions"), @"s");
  v27 = (void *)objc_claimAutoreleasedReturnValue([v8 identifier]);
  [v5 setObjectOrNull:v27 forKey:@"aa"];

  objc_msgSend(v5, "setInteger:forKey:", objc_msgSend(v8, "status"), @"ab");
  v28 = (void *)objc_claimAutoreleasedReturnValue([v8 executionDate]);
  v29 = (void *)_SQLValueForDate(v28);
  [v5 setObjectOrNull:v29 forKey:@"ac"];

  objc_msgSend(v5, "setInteger:forKey:", objc_msgSend(v8, "errorCode"), @"ad");
  objc_msgSend(v5, "setBool:forKey:", objc_msgSend(v4, "usesAppleCashBalance"), @"ae");
  v30 = (void *)objc_claimAutoreleasedReturnValue([v4 createdDate]);
  v31 = (void *)_SQLValueForDate(v30);
  [v5 setObjectOrNull:v31 forKey:@"af"];

  if (!v7) {
    goto LABEL_14;
  }
  v32 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"w"));
  v49 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"x"));
  v50 = self;
  v48 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"y"));
  v33 = (void *)objc_claimAutoreleasedReturnValue([v7 text]);
  [v5 setObjectOrNull:v33 forKey:@"w"];

  uint64_t v34 = PKSemanticColorToString([v7 color]);
  v35 = (void *)objc_claimAutoreleasedReturnValue(v34);
  [v5 setObjectOrNull:v35 forKey:@"y"];
  v36 = (void *)objc_claimAutoreleasedReturnValue([v7 emoji]);
  [v5 setObjectOrNull:v36 forKey:@"x"];

  v37 = (void *)objc_claimAutoreleasedReturnValue([v7 text]);
  v38 = (void *)objc_claimAutoreleasedReturnValue([v7 emoji]);
  if ((PKEqualObjects(v49, v38) & 1) == 0)
  {

LABEL_7:
    goto LABEL_8;
  }

  char v39 = PKEqualObjects(v48, v35);

  if ((v39 & 1) == 0)
  {
LABEL_8:
    database = v50->super._database;
    v41 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);
    v42 = (void *)objc_claimAutoreleasedReturnValue( +[PaymentTransactionArchive anyInDatabase:forRecurringPaymentIdentifier:]( &OBJC_CLASS___PaymentTransactionArchive,  "anyInDatabase:forRecurringPaymentIdentifier:",  database,  v41));

    if (v42)
    {
      uint64_t Object = PKLogFacilityTypeGetObject(11LL);
      v44 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
      if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v44,  OS_LOG_TYPE_DEFAULT,  "Memo has changed, marking as unarchived",  buf,  2u);
      }

      v45 = (void *)objc_claimAutoreleasedReturnValue([v42 transactionArchive]);
      [v45 updateArchiveLocationsWithType:0 isArchived:0];
      [v42 updateWithTransactionArchive:v45];
    }
  }

  self = v50;
LABEL_14:
  v46 = (void *)objc_claimAutoreleasedReturnValue([v4 upcomingPaymentDates]);
  if (v46) {
    v47 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  v46,  1LL,  0LL));
  }
  else {
    v47 = 0LL;
  }
  [v5 setObjectOrNull:v47 forKey:@"t"];
  -[SQLiteEntity setValuesWithDictionary:](self, "setValuesWithDictionary:", v5);
}

+ (void)insertOrUpdatePeerPaymentRecurringPayments:(id)a3 forPeerPaymentAccountPID:(int64_t)a4 inDatabase:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  id v9 = [v7 countByEnumeratingWithState:&v21 objects:v27 count:16];
  if (v9)
  {
    id v11 = v9;
    uint64_t v12 = *(void *)v22;
    *(void *)&__int128 v10 = 138412290LL;
    __int128 v19 = v10;
    do
    {
      for (i = 0LL; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v22 != v12) {
          objc_enumerationMutation(v7);
        }
        uint64_t v14 = *(void **)(*((void *)&v21 + 1) + 8LL * (void)i);
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "identifier", v19));
        if ([v15 length])
        {
          id v16 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForPeerPaymentRecurringPaymentWithIdentifier:v15]);
          id v17 = (id)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v8 predicate:v16]);

          if (v17) {
            [v17 updateWithPeerPaymentRecurringPayment:v14];
          }
          else {
            id v17 = [objc_alloc((Class)a1) initWithPeerPaymentRecurringPayment:v14 forPeerPaymentAccountPID:a4 inDatabase:v8];
          }
        }

        else
        {
          uint64_t Object = PKLogFacilityTypeGetObject(11LL);
          id v17 = (id)objc_claimAutoreleasedReturnValue(Object);
          if (os_log_type_enabled((os_log_t)v17, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v19;
            v26 = v14;
            _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v17,  OS_LOG_TYPE_DEFAULT,  "Attempting to insert invalid recurring payment %@",  buf,  0xCu);
          }
        }
      }

      id v11 = [v7 countByEnumeratingWithState:&v21 objects:v27 count:16];
    }

    while (v11);
  }
}

+ (id)recurringPaymentIdentifiersWithMemoInDatabase:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForHasMemo]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v4 predicate:v5]);

  id v7 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  uint64_t v14 = @"a";
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v14, 1LL));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_1003D7148;
  v12[3] = &unk_10063C0D0;
  v13 = v7;
  id v9 = v7;
  [v6 enumeratePersistentIDsAndProperties:v8 usingBlock:v12];

  id v10 = -[NSMutableSet copy](v9, "copy");
  return v10;
}

- (BOOL)deleteFromDatabase
{
  int64_t v3 = -[SQLiteEntity persistentID](self, "persistentID");
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity database](self, "database"));
  +[PaymentTransactionArchive deleteArchiveForRecurringPaymentPID:inDatabase:]( &OBJC_CLASS___PaymentTransactionArchive,  "deleteArchiveForRecurringPaymentPID:inDatabase:",  v3,  v4);

  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___PeerPaymentRecurringPayment;
  return -[SQLiteEntity deleteFromDatabase](&v6, "deleteFromDatabase");
}

+ (void)deleteEntitiesForPeerPaymentRecurringPaymentIdentifiers:(id)a3 inDatabase:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  id v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v15;
    do
    {
      id v11 = 0LL;
      do
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v6);
        }
        uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( [a1 _predicateForPeerPaymentRecurringPaymentWithIdentifier:*(void *)(*((void *)&v14 + 1) + 8 * (void)v11)]);
        v13 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v7 predicate:v12]);
        [v13 deleteAllEntities];

        id v11 = (char *)v11 + 1;
      }

      while (v9 != v11);
      id v9 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }

    while (v9);
  }
}

+ (void)deleteEntitiesForPeerPaymentRecurringPaymentNotIncludingIdentifiers:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v8 = (id)objc_claimAutoreleasedReturnValue( +[SQLiteContainsPredicate doesNotContainPredicateWithProperty:values:]( &OBJC_CLASS___SQLiteContainsPredicate,  "doesNotContainPredicateWithProperty:values:",  @"a",  a3));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v8]);

  [v7 deleteAllEntities];
}

+ (void)deleteEntitiesForPeerPaymentAccountPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v8 = (id)objc_claimAutoreleasedReturnValue([a1 _predicateForPeerPaymentRecurringPaymentsWithAccountPID:a3]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v8]);

  [v7 deleteAllEntities];
}

+ (id)anyInDatabase:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteNullPredicate isNullPredicateWithProperty:]( &OBJC_CLASS___SQLiteNullPredicate,  "isNullPredicateWithProperty:",  @"b"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v4 predicate:v5]);

  return v6;
}

+ (id)_predicateForPeerPaymentRecurringPaymentWithIdentifier:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"a",  a3);
}

+ (id)_predicateForMPANIdentifier:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"v",  a3);
}

+ (id)_predicateForPeerPaymentRecurringPaymentsWithAccountPID:(int64_t)a3
{
  int64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a3));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"b",  v3));

  return v4;
}

+ (id)_predicateForHasMemo
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteNullPredicate isNotNullPredicateWithProperty:]( &OBJC_CLASS___SQLiteNullPredicate,  "isNotNullPredicateWithProperty:",  @"w"));
  v7[0] = v2;
  int64_t v3 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteNullPredicate isNotNullPredicateWithProperty:]( &OBJC_CLASS___SQLiteNullPredicate,  "isNotNullPredicateWithProperty:",  @"x"));
  v7[1] = v3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v7, 2LL));
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAnyPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAnyPredicates:",  v4));

  return v5;
}

+ (id)_recurringPaymentsInDatabase:(id)a3 matchingPredicate:(id)a4
{
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:a4]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 _peerPaymentRecurringPaymentsWithQuery:v7 database:v6]);

  return v8;
}

+ (id)_peerPaymentRecurringPaymentsWithQuery:(id)a3 database:(id)a4
{
  id v18 = 0LL;
  v19[0] = @"i";
  v19[1] = @"j";
  v19[2] = @"v";
  v19[3] = @"k";
  v19[4] = @"l";
  v19[5] = @"m";
  v19[6] = @"n";
  v19[7] = @"w";
  v19[8] = @"y";
  v19[9] = @"x";
  v19[10] = @"aa";
  v19[11] = @"ab";
  v19[12] = @"ac";
  v19[13] = @"ad";
  id v5 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v19, 14LL));
  id v7 = (void *)objc_claimAutoreleasedReturnValue( [a1 _propertySettersForPeerPaymentRecurringPaymentWithProperties:v6 effectiveProperties:&v18]);

  id v8 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  id v9 = v18;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_1003D7880;
  v14[3] = &unk_100639BF0;
  __int128 v16 = v8;
  id v17 = a1;
  id v15 = v7;
  uint64_t v10 = v8;
  id v11 = v7;
  [v5 enumeratePersistentIDsAndProperties:v9 usingBlock:v14];

  id v12 = -[NSMutableArray copy](v10, "copy");
  return v12;
}

+ (id)_propertySettersForPeerPaymentRecurringPaymentWithProperties:(id)a3 effectiveProperties:(id *)a4
{
  id v5 = a3;
  if (a4)
  {
    v23[0] = @"a";
    v23[1] = @"c";
    v24[0] = &stru_10065C380;
    v24[1] = &stru_10065C3A0;
    v23[2] = @"d";
    v23[3] = @"e";
    v24[2] = &stru_10065C3C0;
    v24[3] = &stru_10065C3E0;
    v23[4] = @"f";
    v23[5] = @"z";
    v24[4] = &stru_10065C400;
    v24[5] = &stru_10065C420;
    v23[6] = @"g";
    v23[7] = @"u";
    v24[6] = &stru_10065C440;
    v24[7] = &stru_10065C460;
    v23[8] = @"h";
    v23[9] = @"o";
    v24[8] = &stru_10065C480;
    v24[9] = &stru_10065C4A0;
    v23[10] = @"p";
    v23[11] = @"r";
    v24[10] = &stru_10065C4C0;
    v24[11] = &stru_10065C4E0;
    v23[12] = @"s";
    v23[13] = @"t";
    v24[12] = &stru_10065C500;
    v24[13] = &stru_10065C520;
    v23[14] = @"ae";
    v23[15] = @"af";
    v24[14] = &stru_10065C540;
    v24[15] = &stru_10065C560;
    id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v24,  v23,  16LL));
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 allKeys]);
    id v8 = [v7 mutableCopy];

    __int128 v20 = 0u;
    __int128 v21 = 0u;
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    id v9 = v5;
    id v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v19;
      do
      {
        for (i = 0LL; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v19 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = *(void *)(*((void *)&v18 + 1) + 8LL * (void)i);
          if (objc_msgSend(v8, "indexOfObject:", v14, (void)v18) == (id)0x7FFFFFFFFFFFFFFFLL) {
            [v8 addObject:v14];
          }
        }

        id v11 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }

      while (v11);
    }

    id v15 = [v8 copy];
    id v16 = *a4;
    *a4 = v15;
  }

  else
  {
    id v6 = 0LL;
  }

  return v6;
}

@end
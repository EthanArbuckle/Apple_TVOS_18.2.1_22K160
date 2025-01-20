@interface PeerPaymentPendingRequest
+ (id)_peerPaymentPendingRequestsWithQuery:(id)a3;
+ (id)_pendingRequestsInDatabase:(id)a3 matchingPredicate:(id)a4;
+ (id)_predicateForPeerPaymentPendingRequestWithAccountPID:(int64_t)a3;
+ (id)_predicateForPeerPaymentPendingRequestWithRequestToken:(id)a3;
+ (id)_propertySettersForPeerPaymentPendingRequestWithProperties:(id)a3 effectiveProperties:(id *)a4;
+ (id)anyInDatabase:(id)a3;
+ (id)associationPropertyForEntityClass:(Class)a3;
+ (id)databaseTable;
+ (id)peerPaymentPendingRequestsForPeerPaymentAccountPID:(int64_t)a3 inDatabase:(id)a4;
+ (id)peerPaymentPendingRequestsForRequestTokens:(id)a3 inDatabase:(id)a4;
+ (void)deleteEntitiesForPeerPaymentAccountPID:(int64_t)a3 inDatabase:(id)a4;
+ (void)deleteEntitiesForRequestTokens:(id)a3 inDatabase:(id)a4;
+ (void)insertOrUpdatePeerPaymentPendingRequests:(id)a3 forPeerPaymentAccountPID:(int64_t)a4 inDatabase:(id)a5;
- (PeerPaymentPendingRequest)initWithPeerPaymentPendingRequest:(id)a3 forPeerPaymentAccountPID:(int64_t)a4 inDatabase:(id)a5;
- (void)updateWithPeerPaymentPendingRequest:(id)a3;
@end

@implementation PeerPaymentPendingRequest

+ (id)databaseTable
{
  return @"peer_payment_requests";
}

+ (id)associationPropertyForEntityClass:(Class)a3
{
  if ((Class)objc_opt_class(&OBJC_CLASS___PeerPaymentPendingRequest, a2) == a3) {
    return @"request_token";
  }
  else {
    return 0LL;
  }
}

- (PeerPaymentPendingRequest)initWithPeerPaymentPendingRequest:(id)a3 forPeerPaymentAccountPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  v10 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  v11 = (void *)objc_claimAutoreleasedReturnValue([v9 currencyAmount]);
  v12 = (void *)objc_claimAutoreleasedReturnValue([v11 amount]);
  uint64_t v13 = PKCurrencyDecimalToStorageNumber(v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);

  v15 = (void *)objc_claimAutoreleasedReturnValue([v9 requestToken]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v10, "setObjectOrNull:forKey:", v15, @"request_token");

  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a4));
  -[NSMutableDictionary setObjectOrNull:forKey:](v10, "setObjectOrNull:forKey:", v16, @"peer_payment_account_pid");

  v17 = (void *)objc_claimAutoreleasedReturnValue([v9 requesterAddress]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v10, "setObjectOrNull:forKey:", v17, @"requester_address");

  v18 = (void *)objc_claimAutoreleasedReturnValue([v9 requesteeAddress]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v10, "setObjectOrNull:forKey:", v18, @"requestee_address");

  -[NSMutableDictionary setObjectOrNull:forKey:](v10, "setObjectOrNull:forKey:", v14, @"amount");
  v19 = (void *)objc_claimAutoreleasedReturnValue([v9 currencyAmount]);
  v20 = (void *)objc_claimAutoreleasedReturnValue([v19 currency]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v10, "setObjectOrNull:forKey:", v20, @"currency");

  v21 = (void *)objc_claimAutoreleasedReturnValue([v9 memo]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v10, "setObjectOrNull:forKey:", v21, @"memo");

  v22 = (void *)objc_claimAutoreleasedReturnValue([v9 sessionID]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v10, "setObjectOrNull:forKey:", v22, @"session_id");

  v23 = (void *)objc_claimAutoreleasedReturnValue([v9 expiryDate]);
  v24 = (void *)_SQLValueForDate(v23);
  -[NSMutableDictionary setObjectOrNull:forKey:](v10, "setObjectOrNull:forKey:", v24, @"expiry_date");

  v25 = (void *)objc_claimAutoreleasedReturnValue([v9 actions]);
  v26 = (void *)objc_claimAutoreleasedReturnValue([v25 componentsJoinedByString:@"-"]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v10, "setObjectOrNull:forKey:", v26, @"actions");

  v27 = (void *)objc_claimAutoreleasedReturnValue([v9 requestDate]);
  v28 = (void *)_SQLValueForDate(v27);
  -[NSMutableDictionary setObjectOrNull:forKey:](v10, "setObjectOrNull:forKey:", v28, @"request_date");

  v29 = (void *)objc_claimAutoreleasedReturnValue([v9 lastDismissedDate]);
  v30 = (void *)_SQLValueForDate(v29);
  -[NSMutableDictionary setObjectOrNull:forKey:](v10, "setObjectOrNull:forKey:", v30, @"last_dismissed_date");

  v31 = (void *)objc_claimAutoreleasedReturnValue([v9 status]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v10, "setObjectOrNull:forKey:", v31, @"status");

  v32 = -[SQLiteEntity initWithPropertyValues:inDatabase:](self, "initWithPropertyValues:inDatabase:", v10, v8);
  return v32;
}

+ (id)peerPaymentPendingRequestsForRequestTokens:(id)a3 inDatabase:(id)a4
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
      uint64_t v13 = 0LL;
      do
      {
        if (*(void *)v19 != v12) {
          objc_enumerationMutation(v9);
        }
        v14 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( a1,  "_predicateForPeerPaymentPendingRequestWithRequestToken:",  *(void *)(*((void *)&v18 + 1) + 8 * (void)v13),  (void)v18));
        v15 = (void *)objc_claimAutoreleasedReturnValue([a1 _pendingRequestsInDatabase:v7 matchingPredicate:v14]);
        -[NSMutableArray addObjectsFromArray:](v8, "addObjectsFromArray:", v15);

        uint64_t v13 = (char *)v13 + 1;
      }

      while (v11 != v13);
      id v11 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }

    while (v11);
  }

  id v16 = -[NSMutableArray copy](v8, "copy");
  return v16;
}

+ (id)peerPaymentPendingRequestsForPeerPaymentAccountPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForPeerPaymentPendingRequestWithAccountPID:a3]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 _pendingRequestsInDatabase:v6 matchingPredicate:v7]);

  return v8;
}

- (void)updateWithPeerPaymentPendingRequest:(id)a3
{
  id v32 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v32 currencyAmount]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 amount]);
  uint64_t v7 = PKCurrencyDecimalToStorageNumber(v6);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

  id v9 = (void *)objc_claimAutoreleasedReturnValue([v32 requestToken]);
  [v4 setObjectOrNull:v9 forKey:@"request_token"];

  id v10 = (void *)objc_claimAutoreleasedReturnValue([v32 requesterAddress]);
  [v4 setObjectOrNull:v10 forKey:@"requester_address"];

  id v11 = (void *)objc_claimAutoreleasedReturnValue([v32 requesteeAddress]);
  [v4 setObjectOrNull:v11 forKey:@"requestee_address"];

  [v4 setObjectOrNull:v8 forKey:@"amount"];
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v32 currencyAmount]);
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v12 currency]);
  [v4 setObjectOrNull:v13 forKey:@"currency"];

  v14 = (void *)objc_claimAutoreleasedReturnValue([v32 memo]);
  if (v14)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue([v32 memo]);
    [v4 setObjectOrNull:v15 forKey:@"memo"];
  }

  id v16 = (void *)objc_claimAutoreleasedReturnValue([v32 sessionID]);

  if (v16)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue([v32 sessionID]);
    [v4 setObjectOrNull:v17 forKey:@"session_id"];
  }

  __int128 v18 = (void *)objc_claimAutoreleasedReturnValue([v32 expiryDate]);

  if (v18)
  {
    __int128 v19 = (void *)objc_claimAutoreleasedReturnValue([v32 expiryDate]);
    __int128 v20 = (void *)_SQLValueForDate(v19);
    [v4 setObjectOrNull:v20 forKey:@"expiry_date"];
  }

  __int128 v21 = (void *)objc_claimAutoreleasedReturnValue([v32 actions]);

  if (v21)
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue([v32 actions]);
    v23 = (void *)objc_claimAutoreleasedReturnValue([v22 componentsJoinedByString:@"-"]);
    [v4 setObjectOrNull:v23 forKey:@"actions"];
  }

  v24 = (void *)objc_claimAutoreleasedReturnValue([v32 requestDate]);

  if (v24)
  {
    v25 = (void *)objc_claimAutoreleasedReturnValue([v32 requestDate]);
    v26 = (void *)_SQLValueForDate(v25);
    [v4 setObjectOrNull:v26 forKey:@"request_date"];
  }

  v27 = (void *)objc_claimAutoreleasedReturnValue([v32 lastDismissedDate]);

  if (v27)
  {
    v28 = (void *)objc_claimAutoreleasedReturnValue([v32 lastDismissedDate]);
    v29 = (void *)_SQLValueForDate(v28);
    [v4 setObjectOrNull:v29 forKey:@"last_dismissed_date"];
  }

  v30 = (void *)objc_claimAutoreleasedReturnValue([v32 status]);

  if (v30)
  {
    v31 = (void *)objc_claimAutoreleasedReturnValue([v32 status]);
    [v4 setObjectOrNull:v31 forKey:@"status"];
  }

  -[SQLiteEntity setValuesWithDictionary:](self, "setValuesWithDictionary:", v4);
}

+ (void)insertOrUpdatePeerPaymentPendingRequests:(id)a3 forPeerPaymentAccountPID:(int64_t)a4 inDatabase:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  id v9 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v19;
    do
    {
      for (i = 0LL; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v19 != v11) {
          objc_enumerationMutation(v7);
        }
        uint64_t v13 = *(void **)(*((void *)&v18 + 1) + 8LL * (void)i);
        v14 = (void *)objc_claimAutoreleasedReturnValue([v13 requestToken]);
        v15 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForPeerPaymentPendingRequestWithRequestToken:v14]);
        id v16 = (id)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v8 predicate:v15]);

        if (v16) {
          [v16 updateWithPeerPaymentPendingRequest:v13];
        }
        else {
          id v16 = [objc_alloc((Class)a1) initWithPeerPaymentPendingRequest:v13 forPeerPaymentAccountPID:a4 inDatabase:v8];
        }
      }

      id v10 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }

    while (v10);
  }
}

+ (void)deleteEntitiesForRequestTokens:(id)a3 inDatabase:(id)a4
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
      uint64_t v11 = 0LL;
      do
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v6);
        }
        uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( [a1 _predicateForPeerPaymentPendingRequestWithRequestToken:*(void *)(*((void *)&v14 + 1) + 8 * (void)v11)]);
        uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v7 predicate:v12]);
        [v13 deleteAllEntities];

        uint64_t v11 = (char *)v11 + 1;
      }

      while (v9 != v11);
      id v9 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }

    while (v9);
  }
}

+ (void)deleteEntitiesForPeerPaymentAccountPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v8 = (id)objc_claimAutoreleasedReturnValue([a1 _predicateForPeerPaymentPendingRequestWithAccountPID:a3]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v8]);

  [v7 deleteAllEntities];
}

+ (id)anyInDatabase:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteNullPredicate isNullPredicateWithProperty:]( &OBJC_CLASS___SQLiteNullPredicate,  "isNullPredicateWithProperty:",  @"peer_payment_account_pid"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v4 predicate:v5]);

  return v6;
}

+ (id)_predicateForPeerPaymentPendingRequestWithRequestToken:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"request_token",  a3);
}

+ (id)_predicateForPeerPaymentPendingRequestWithAccountPID:(int64_t)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a3));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"peer_payment_account_pid",  v3));

  return v4;
}

+ (id)_pendingRequestsInDatabase:(id)a3 matchingPredicate:(id)a4
{
  v5 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:a3 predicate:a4]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([a1 _peerPaymentPendingRequestsWithQuery:v5]);

  return v6;
}

+ (id)_peerPaymentPendingRequestsWithQuery:(id)a3
{
  id v20 = 0LL;
  v21[0] = @"amount";
  v21[1] = @"currency";
  v21[2] = @"actions";
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v21, 3LL));
  id v6 = (void *)objc_claimAutoreleasedReturnValue( [a1 _propertySettersForPeerPaymentPendingRequestWithProperties:v5 effectiveProperties:&v20]);

  id v7 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  id v8 = v20;
  uint64_t v13 = _NSConcreteStackBlock;
  uint64_t v14 = 3221225472LL;
  __int128 v15 = sub_1002C508C;
  __int128 v16 = &unk_100639BF0;
  __int128 v18 = v7;
  id v19 = a1;
  id v17 = v6;
  id v9 = v7;
  id v10 = v6;
  [v4 enumeratePersistentIDsAndProperties:v8 usingBlock:&v13];

  id v11 = -[NSMutableArray copy](v9, "copy", v13, v14, v15, v16);
  return v11;
}

+ (id)_propertySettersForPeerPaymentPendingRequestWithProperties:(id)a3 effectiveProperties:(id *)a4
{
  id v5 = a3;
  if (a4)
  {
    v23[0] = @"request_token";
    v23[1] = @"requester_address";
    v24[0] = &stru_100653488;
    v24[1] = &stru_1006534A8;
    v23[2] = @"requestee_address";
    v23[3] = @"memo";
    v24[2] = &stru_1006534C8;
    v24[3] = &stru_1006534E8;
    v23[4] = @"session_id";
    v23[5] = @"expiry_date";
    v24[4] = &stru_100653508;
    v24[5] = &stru_100653528;
    v23[6] = @"request_date";
    v23[7] = @"last_dismissed_date";
    v24[6] = &stru_100653548;
    v24[7] = &stru_100653568;
    v23[8] = @"actions";
    v23[9] = @"status";
    v24[8] = &stru_100653588;
    v24[9] = &stru_1006535A8;
    id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v24,  v23,  10LL));
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
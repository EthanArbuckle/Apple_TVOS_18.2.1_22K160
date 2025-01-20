@interface PeerPaymentAccountFeatureDescriptor
+ (BOOL)updateFeatureDescriptorsSupportedForPeerPaymentAccount:(id)a3 inDatabase:(id)a4;
+ (id)_peerPaymentAccountFeatureDescriptorsWithQuery:(id)a3;
+ (id)_predicateForPeerPaymentAccountPID:(int64_t)a3;
+ (id)_propertySettersForPeerPaymentAccountFeatureDescriptor;
+ (id)associationPropertyForEntityClass:(Class)a3;
+ (id)databaseTable;
+ (id)featureDescriptorsForPeerPaymentAccountPID:(int64_t)a3 inDatabase:(id)a4;
+ (id)insertFeatureDescriptors:(id)a3 forPeerPaymentAccountPID:(int64_t)a4 inDatabase:(id)a5;
+ (void)deleteFeatureDescriptorsForPeerPaymentAccountPID:(int64_t)a3 inDatabase:(id)a4;
- (PeerPaymentAccountFeatureDescriptor)initWithFeatureDescriptor:(id)a3 forPeerPaymentAccountPID:(int64_t)a4 inDatabase:(id)a5;
- (id)peerPaymentAccountFeatureDescriptor;
@end

@implementation PeerPaymentAccountFeatureDescriptor

+ (id)databaseTable
{
  return @"peer_payment_account_feature_descriptor";
}

+ (id)associationPropertyForEntityClass:(Class)a3
{
  if ((Class)objc_opt_class(&OBJC_CLASS___PeerPaymentAccount, a2) == a3) {
    return @"peer_payment_account_pid";
  }
  else {
    return 0LL;
  }
}

+ (id)insertFeatureDescriptors:(id)a3 forPeerPaymentAccountPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  id v11 = v8;
  id v12 = [v11 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v22;
    do
    {
      v15 = 0LL;
      do
      {
        if (*(void *)v22 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = *(void *)(*((void *)&v21 + 1) + 8LL * (void)v15);
        id v17 = objc_alloc((Class)a1);
        id v18 = objc_msgSend( v17,  "initWithFeatureDescriptor:forPeerPaymentAccountPID:inDatabase:",  v16,  a4,  v9,  (void)v21);
        if (v18) {
          [v10 addObject:v18];
        }

        v15 = (char *)v15 + 1;
      }

      while (v13 != v15);
      id v13 = [v11 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }

    while (v13);
  }

  id v19 = [v10 copy];
  return v19;
}

+ (void)deleteFeatureDescriptorsForPeerPaymentAccountPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v8 = (id)objc_claimAutoreleasedReturnValue([a1 _predicateForPeerPaymentAccountPID:a3]);
  v7 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v8]);

  [v7 deleteAllEntities];
}

+ (id)featureDescriptorsForPeerPaymentAccountPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForPeerPaymentAccountPID:a3]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v7]);

  id v9 = (void *)objc_claimAutoreleasedReturnValue([a1 _peerPaymentAccountFeatureDescriptorsWithQuery:v8]);
  return v9;
}

- (PeerPaymentAccountFeatureDescriptor)initWithFeatureDescriptor:(id)a3 forPeerPaymentAccountPID:(int64_t)a4 inDatabase:(id)a5
{
  id v7 = a3;
  id v42 = a5;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a4));
  [v8 setObjectOrNull:v9 forKey:@"peer_payment_account_pid"];

  v10 = (void *)objc_claimAutoreleasedReturnValue([v7 identifier]);
  [v8 setObjectOrNull:v10 forKey:@"identifier"];

  id v11 = (void *)objc_claimAutoreleasedReturnValue([v7 minimumAmount]);
  uint64_t v12 = PKCurrencyDecimalToStorageNumber(v11);
  id v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  [v8 setObjectOrNull:v13 forKey:@"minimum_amount"];

  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v7 maximumAmount]);
  uint64_t v15 = PKCurrencyDecimalToStorageNumber(v14);
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
  [v8 setObjectOrNull:v16 forKey:@"maximum_amount"];

  id v17 = (void *)objc_claimAutoreleasedReturnValue([v7 supportedNetworks]);
  id v18 = (void *)objc_claimAutoreleasedReturnValue([v17 componentsJoinedByString:@","]);
  [v8 setObjectOrNull:v18 forKey:@"supported_networks"];

  id v19 = (void *)objc_claimAutoreleasedReturnValue([v7 amountSuggestions]);
  if (v19) {
    v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  v19,  1LL,  0LL));
  }
  else {
    v20 = 0LL;
  }
  [v8 setObjectOrNull:v20 forKey:@"a"];
  __int128 v21 = (void *)objc_claimAutoreleasedReturnValue([v7 thresholdSuggestions]);
  if (v21) {
    __int128 v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  v21,  1LL,  0LL));
  }
  else {
    __int128 v22 = 0LL;
  }
  [v8 setObjectOrNull:v22 forKey:@"b"];
  __int128 v23 = (void *)objc_claimAutoreleasedReturnValue([v7 frequencyOptions]);
  if (v23) {
    __int128 v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  v23,  1LL,  0LL));
  }
  else {
    __int128 v24 = 0LL;
  }
  [v8 setObjectOrNull:v24 forKey:@"c"];
  v25 = (void *)objc_claimAutoreleasedReturnValue([v7 productTimeZone]);
  v26 = (void *)objc_claimAutoreleasedReturnValue([v25 name]);
  [v8 setObjectOrNull:v26 forKey:@"d"];

  objc_msgSend(v8, "setInteger:forKey:", objc_msgSend(v7, "maximumPayments"), @"e");
  objc_msgSend(v8, "setInteger:forKey:", objc_msgSend(v7, "endProcessingHour"), @"f");
  [v7 proactiveFetchPeriod];
  objc_msgSend(v8, "setDouble:forKey:", @"g");
  v27 = (void *)objc_claimAutoreleasedReturnValue([v7 merchantIdentifier]);
  [v8 setObjectOrNull:v27 forKey:@"merchant_identifier"];

  v28 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v7 merchantCapabilities]));
  [v8 setObjectOrNull:v28 forKey:@"merchant_capabilities"];

  v29 = (void *)objc_claimAutoreleasedReturnValue([v7 feePercentage]);
  uint64_t v30 = PKCurrencyDecimalToStorageNumber(v29);
  v31 = (void *)objc_claimAutoreleasedReturnValue(v30);
  [v8 setObjectOrNull:v31 forKey:@"fee_percentage"];

  v32 = (void *)objc_claimAutoreleasedReturnValue([v7 minimumFee]);
  uint64_t v33 = PKCurrencyDecimalToStorageNumber(v32);
  v34 = (void *)objc_claimAutoreleasedReturnValue(v33);
  [v8 setObjectOrNull:v34 forKey:@"minimum_fee"];

  v35 = (void *)objc_claimAutoreleasedReturnValue([v7 maximumFee]);
  uint64_t v36 = PKCurrencyDecimalToStorageNumber(v35);
  v37 = (void *)objc_claimAutoreleasedReturnValue(v36);
  [v8 setObjectOrNull:v37 forKey:@"maximum_fee"];

  v38 = (void *)objc_claimAutoreleasedReturnValue([v7 osVersionRange]);
  v39 = (void *)_SQLValueForOSVersionRequirementRange(v38);
  [v8 setObjectOrNull:v39 forKey:@"os_version_requirement_range"];

  objc_msgSend(v8, "setBool:forKey:", objc_msgSend(v7, "isSupported"), @"h");
  v40 = -[SQLiteEntity initWithPropertyValues:inDatabase:](self, "initWithPropertyValues:inDatabase:", v8, v42);

  return v40;
}

+ (BOOL)updateFeatureDescriptorsSupportedForPeerPaymentAccount:(id)a3 inDatabase:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_predicateForPeerPaymentAccountPID:", objc_msgSend(v6, "persistentID")));
  if (v8)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v7 predicate:v8]);
    uint64_t v15 = 0LL;
    uint64_t v16 = &v15;
    uint64_t v17 = 0x2020000000LL;
    char v18 = 1;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_10037E954;
    v12[3] = &unk_100651E00;
    id v13 = v7;
    uint64_t v14 = &v15;
    [v9 enumeratePersistentIDsUsingBlock:v12];
    BOOL v10 = *((_BYTE *)v16 + 24) != 0;

    _Block_object_dispose(&v15, 8);
  }

  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

+ (id)_predicateForPeerPaymentAccountPID:(int64_t)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"peer_payment_account_pid",  v3));

  return v4;
}

- (id)peerPaymentAccountFeatureDescriptor
{
  v3 = objc_alloc_init(&OBJC_CLASS___PKPeerPaymentAccountFeatureDescriptor);
  id v5 = objc_msgSend((id)objc_opt_class(self, v4), "_propertySettersForPeerPaymentAccountFeatureDescriptor");
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 allKeys]);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_10037EB50;
  v13[3] = &unk_100638EF0;
  v13[4] = self;
  id v14 = v6;
  id v8 = v3;
  uint64_t v15 = v8;
  id v9 = v6;
  -[SQLiteEntity getValuesForProperties:withApplier:](self, "getValuesForProperties:withApplier:", v7, v13);

  BOOL v10 = v15;
  id v11 = v8;

  return v11;
}

+ (id)_peerPaymentAccountFeatureDescriptorsWithQuery:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([a1 _propertySettersForPeerPaymentAccountFeatureDescriptor]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 allKeys]);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_10037EC9C;
  v12[3] = &unk_100639BF0;
  id v14 = v6;
  id v15 = a1;
  id v13 = v5;
  id v8 = v6;
  id v9 = v5;
  [v4 enumeratePersistentIDsAndProperties:v7 usingBlock:v12];

  id v10 = [v8 copy];
  return v10;
}

+ (id)_propertySettersForPeerPaymentAccountFeatureDescriptor
{
  v3[0] = @"identifier";
  v3[1] = @"minimum_amount";
  v4[0] = &stru_100658848;
  v4[1] = &stru_100658868;
  v3[2] = @"maximum_amount";
  v3[3] = @"supported_networks";
  v4[2] = &stru_100658888;
  v4[3] = &stru_1006588A8;
  v3[4] = @"a";
  v3[5] = @"b";
  v4[4] = &stru_1006588C8;
  v4[5] = &stru_1006588E8;
  v3[6] = @"c";
  v3[7] = @"d";
  v4[6] = &stru_100658908;
  v4[7] = &stru_100658928;
  v3[8] = @"e";
  v3[9] = @"f";
  v4[8] = &stru_100658948;
  v4[9] = &stru_100658968;
  v3[10] = @"g";
  v3[11] = @"merchant_identifier";
  v4[10] = &stru_100658988;
  v4[11] = &stru_1006589A8;
  v3[12] = @"merchant_capabilities";
  v3[13] = @"fee_percentage";
  v4[12] = &stru_1006589C8;
  v4[13] = &stru_1006589E8;
  v3[14] = @"minimum_fee";
  v3[15] = @"maximum_fee";
  v4[14] = &stru_100658A08;
  v4[15] = &stru_100658A28;
  v3[16] = @"os_version_requirement_range";
  v3[17] = @"h";
  v4[16] = &stru_100658A48;
  v4[17] = &stru_100658A68;
  return (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v4,  v3,  18LL));
}

@end
@interface PeerPaymentAccount
+ (id)_predicateForAssociatedPeerPaymentAccountIdentifier:(id)a3;
+ (id)_predicateForAssociatedPeerPaymentAccountPID:(int64_t)a3;
+ (id)_propertySettersForPeerPaymentAccount;
+ (id)anyInDatabase:(id)a3;
+ (id)anyInDatabase:(id)a3 withIdentifier:(id)a4;
+ (id)anyInDatabase:(id)a3 withPersistentID:(int64_t)a4;
+ (id)anyInDatabase:(id)a3 withTransactionSourcePID:(int64_t)a4;
+ (id)associatedPeerPaymentAccountForPeerPaymentAccountPID:(int64_t)a3 inDatabase:(id)a4;
+ (id)associationPropertyForEntityClass:(Class)a3;
+ (id)databaseTable;
+ (id)insertOrUpdatePeerPaymentAccount:(id)a3 inDatabase:(id)a4;
+ (void)_deleteAssociatedPeerPaymentAccountForPeerPaymentAccountPID:(int64_t)a3 inDatabase:(id)a4;
+ (void)_insertOrUpdateAssociatedPeerPaymentAccounts:(id)a3 forPeerPaymentAccountPID:(int64_t)a4 accountIdentifier:(id)a5 inDatabase:(id)a6;
+ (void)addJoinClausesForProperty:(id)a3 toJoins:(id)a4;
- (BOOL)deleteFromDatabase;
- (PeerPaymentAccount)initWithPeerPaymentAccount:(id)a3 inDatabase:(id)a4;
- (PeerPaymentAccount)initWithPeerPaymentAccount:(id)a3 inDatabase:(id)a4 associatedPeerPaymentAccountPID:(int64_t)a5;
- (id)_commonInitForPeerPaymentAccount:(id)a3 dictionary:(id)a4 inDatabase:(id)a5;
- (id)_dictionaryForPeerPaymentAccount:(id)a3;
- (id)_passForPeerPaymentAccount:(id)a3 database:(id)a4;
- (id)associatedAccountInformation;
- (id)associatedPassSerialNumber;
- (id)associatedPassTypeIdentifier;
- (id)associatedPassUniqueID;
- (id)currentBalance;
- (id)identifier;
- (id)peerPaymentAccount;
- (id)transactionSourceIdentifier;
- (unint64_t)state;
- (void)updateWithPeerPaymentAccount:(id)a3;
@end

@implementation PeerPaymentAccount

- (PeerPaymentAccount)initWithPeerPaymentAccount:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[PeerPaymentAccount _dictionaryForPeerPaymentAccount:](self, "_dictionaryForPeerPaymentAccount:", v7));
  v9 = (PeerPaymentAccount *)objc_claimAutoreleasedReturnValue( -[PeerPaymentAccount _commonInitForPeerPaymentAccount:dictionary:inDatabase:]( self,  "_commonInitForPeerPaymentAccount:dictionary:inDatabase:",  v7,  v8,  v6));

  return v9;
}

- (PeerPaymentAccount)initWithPeerPaymentAccount:(id)a3 inDatabase:(id)a4 associatedPeerPaymentAccountPID:(int64_t)a5
{
  id v8 = a4;
  id v9 = a3;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[PeerPaymentAccount _dictionaryForPeerPaymentAccount:](self, "_dictionaryForPeerPaymentAccount:", v9));
  [v10 setLongLong:a5 forKey:@"associated_account_pid"];
  v11 = (PeerPaymentAccount *)objc_claimAutoreleasedReturnValue( -[PeerPaymentAccount _commonInitForPeerPaymentAccount:dictionary:inDatabase:]( self,  "_commonInitForPeerPaymentAccount:dictionary:inDatabase:",  v9,  v10,  v8));

  return v11;
}

- (id)_commonInitForPeerPaymentAccount:(id)a3 dictionary:(id)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = self;
  id v10 = a3;
  v11 = -[SQLiteEntity initWithPropertyValues:inDatabase:](v9, "initWithPropertyValues:inDatabase:", a4, v8);
  id v12 = -[SQLiteEntity persistentID](v11, "persistentID");
  v13 = (void *)objc_claimAutoreleasedReturnValue([v10 associatedAccountInformation]);
  v14 = (void *)objc_claimAutoreleasedReturnValue([v10 additionalPushTopics]);
  id v15 =  +[PeerPaymentAccountAdditionalPushTopics insertPeerPaymentAccountAdditionalPushTopics:forPeerPaymentAccountPID:inDatabase:]( &OBJC_CLASS___PeerPaymentAccountAdditionalPushTopics,  "insertPeerPaymentAccountAdditionalPushTopics:forPeerPaymentAccountPID:inDatabase:",  v14,  -[SQLiteEntity persistentID](v11, "persistentID"),  v8);

  v16 = (void *)objc_claimAutoreleasedReturnValue([v10 supportedFeatureDescriptors]);
  id v17 =  +[PeerPaymentAccountFeatureDescriptor insertFeatureDescriptors:forPeerPaymentAccountPID:inDatabase:]( &OBJC_CLASS___PeerPaymentAccountFeatureDescriptor,  "insertFeatureDescriptors:forPeerPaymentAccountPID:inDatabase:",  v16,  v12,  v8);

  v18 = (void *)objc_claimAutoreleasedReturnValue([v13 associatedAccountInvitations]);
  id v19 =  +[PeerPaymentAccountInvitation insertInvitations:forPeerPaymentAccountPID:inDatabase:]( &OBJC_CLASS___PeerPaymentAccountInvitation,  "insertInvitations:forPeerPaymentAccountPID:inDatabase:",  v18,  v12,  v8);

  v20 = (void *)objc_claimAutoreleasedReturnValue([v13 associatedAccountRemovalRecords]);
  id v21 =  +[PeerPaymentAssociatedAccountRemovalRecord insertAssociatedAccountRemovalRecords:forPeerPaymentAccountPID:inDatabase:]( &OBJC_CLASS___PeerPaymentAssociatedAccountRemovalRecord,  "insertAssociatedAccountRemovalRecords:forPeerPaymentAccountPID:inDatabase:",  v20,  v12,  v8);

  v22 = (void *)objc_claimAutoreleasedReturnValue([v13 associatedAccounts]);
  v23 = (void *)objc_claimAutoreleasedReturnValue([v10 identifier]);
  +[PeerPaymentAccount _insertOrUpdateAssociatedPeerPaymentAccounts:forPeerPaymentAccountPID:accountIdentifier:inDatabase:]( &OBJC_CLASS___PeerPaymentAccount,  "_insertOrUpdateAssociatedPeerPaymentAccounts:forPeerPaymentAccountPID:accountIdentifier:inDatabase:",  v22,  v12,  v23,  v8);

  v24 = (void *)objc_claimAutoreleasedReturnValue([v10 paymentModeIdentifiers]);
  id v25 =  +[PeerPaymentPaymentModeIdentifiers insertPeerPaymentPaymentModeIdentifiers:forPeerPaymentAccountPID:inDatabase:]( &OBJC_CLASS___PeerPaymentPaymentModeIdentifiers,  "insertPeerPaymentPaymentModeIdentifiers:forPeerPaymentAccountPID:inDatabase:",  v24,  -[SQLiteEntity persistentID](v11, "persistentID"),  v8);

  v26 = (void *)objc_claimAutoreleasedReturnValue([v10 encryptionCertificatesVersions]);
  id v27 =  +[PeerPaymentEncryptionCertificatesVersions insertPeerPaymentEncryptionCertificatesVersions:forPeerPaymentAccountPID:inDatabase:]( &OBJC_CLASS___PeerPaymentEncryptionCertificatesVersions,  "insertPeerPaymentEncryptionCertificatesVersions:forPeerPaymentAccountPID:inDatabase:",  v26,  -[SQLiteEntity persistentID](v11, "persistentID"),  v8);

  return v11;
}

+ (void)_insertOrUpdateAssociatedPeerPaymentAccounts:(id)a3 forPeerPaymentAccountPID:(int64_t)a4 accountIdentifier:(id)a5 inDatabase:(id)a6
{
  id v9 = a3;
  id v32 = a5;
  id v10 = a6;
  v11 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  __int128 v39 = 0u;
  __int128 v40 = 0u;
  __int128 v41 = 0u;
  __int128 v42 = 0u;
  id v12 = v9;
  id v13 = [v12 countByEnumeratingWithState:&v39 objects:v46 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v40;
    uint64_t v33 = *(void *)v40;
    do
    {
      for (i = 0LL; i != v14; i = (char *)i + 1)
      {
        if (*(void *)v40 != v15) {
          objc_enumerationMutation(v12);
        }
        id v17 = *(void **)(*((void *)&v39 + 1) + 8LL * (void)i);
        v18 = (void *)objc_claimAutoreleasedReturnValue([v17 identifier]);
        id v19 = (void *)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v10 withIdentifier:v18]);

        v20 = (void *)objc_claimAutoreleasedReturnValue([v17 identifier]);
        if (v20)
        {
          if (v19)
          {
            [v19 updateWithPeerPaymentAccount:v17];
          }

          else
          {
            id v21 = v11;
            id v22 = v12;
            uint64_t Object = PKLogFacilityTypeGetObject(11LL);
            v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
            if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              id v45 = v20;
              _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "Inserting New Assocaited Peer Payment Account %@",  buf,  0xCu);
            }

            v35[0] = _NSConcreteStackBlock;
            v35[1] = 3221225472LL;
            v35[2] = sub_1001BF438;
            v35[3] = &unk_100642030;
            id v37 = a1;
            v35[4] = v17;
            id v36 = v10;
            int64_t v38 = a4;
            sub_1002CCC5C((uint64_t)v36, v35);

            id v12 = v22;
            v11 = v21;
            uint64_t v15 = v33;
          }

          -[NSMutableSet addObject:](v11, "addObject:", v20);
        }
      }

      id v14 = [v12 countByEnumeratingWithState:&v39 objects:v46 count:16];
    }

    while (v14);
  }

  id v25 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteContainsPredicate doesNotContainPredicateWithProperty:values:]( &OBJC_CLASS___SQLiteContainsPredicate,  "doesNotContainPredicateWithProperty:values:",  @"identifier",  v11));
  v26 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForAssociatedPeerPaymentAccountPID:a4]);
  v43[0] = v25;
  v43[1] = v26;
  id v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v43, 2LL));
  v28 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v27));

  v29 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v10 predicate:v28]);
  if (([v29 deleteAllEntities] & 1) == 0)
  {
    uint64_t v30 = PKLogFacilityTypeGetObject(11LL);
    v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v45 = v32;
      _os_log_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_DEFAULT,  "Failed to delete obsolete peer payment accounts for %@",  buf,  0xCu);
    }
  }
}

- (void)updateWithPeerPaymentAccount:(id)a3
{
  id v4 = a3;
  id v46 = (id)objc_claimAutoreleasedReturnValue(-[PeerPaymentAccount _dictionaryForPeerPaymentAccount:](self, "_dictionaryForPeerPaymentAccount:", v4));
  -[SQLiteEntity setValuesWithDictionary:](self, "setValuesWithDictionary:", v46);
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 associatedAccountInformation]);
  int64_t v6 = -[SQLiteEntity persistentID](self, "persistentID");
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity database](self, "database"));
  +[PeerPaymentAccountAdditionalPushTopics deletePeerPaymentAccountAdditionalPushTopicsForAccountPID:inDatabase:]( &OBJC_CLASS___PeerPaymentAccountAdditionalPushTopics,  "deletePeerPaymentAccountAdditionalPushTopicsForAccountPID:inDatabase:",  v6,  v7);

  id v8 = (void *)objc_claimAutoreleasedReturnValue([v4 additionalPushTopics]);
  int64_t v9 = -[SQLiteEntity persistentID](self, "persistentID");
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity database](self, "database"));
  id v11 =  +[PeerPaymentAccountAdditionalPushTopics insertPeerPaymentAccountAdditionalPushTopics:forPeerPaymentAccountPID:inDatabase:]( &OBJC_CLASS___PeerPaymentAccountAdditionalPushTopics,  "insertPeerPaymentAccountAdditionalPushTopics:forPeerPaymentAccountPID:inDatabase:",  v8,  v9,  v10);

  int64_t v12 = -[SQLiteEntity persistentID](self, "persistentID");
  id v13 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity database](self, "database"));
  +[PeerPaymentAccountFeatureDescriptor deleteFeatureDescriptorsForPeerPaymentAccountPID:inDatabase:]( &OBJC_CLASS___PeerPaymentAccountFeatureDescriptor,  "deleteFeatureDescriptorsForPeerPaymentAccountPID:inDatabase:",  v12,  v13);

  id v14 = (void *)objc_claimAutoreleasedReturnValue([v4 supportedFeatureDescriptors]);
  int64_t v15 = -[SQLiteEntity persistentID](self, "persistentID");
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity database](self, "database"));
  id v17 =  +[PeerPaymentAccountFeatureDescriptor insertFeatureDescriptors:forPeerPaymentAccountPID:inDatabase:]( &OBJC_CLASS___PeerPaymentAccountFeatureDescriptor,  "insertFeatureDescriptors:forPeerPaymentAccountPID:inDatabase:",  v14,  v15,  v16);

  int64_t v18 = -[SQLiteEntity persistentID](self, "persistentID");
  id v19 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity database](self, "database"));
  +[PeerPaymentAccountInvitation deleteInvitationsForPeerPaymentAccountPID:inDatabase:]( &OBJC_CLASS___PeerPaymentAccountInvitation,  "deleteInvitationsForPeerPaymentAccountPID:inDatabase:",  v18,  v19);

  v20 = (void *)objc_claimAutoreleasedReturnValue([v5 associatedAccountInvitations]);
  int64_t v21 = -[SQLiteEntity persistentID](self, "persistentID");
  id v22 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity database](self, "database"));
  id v23 =  +[PeerPaymentAccountInvitation insertInvitations:forPeerPaymentAccountPID:inDatabase:]( &OBJC_CLASS___PeerPaymentAccountInvitation,  "insertInvitations:forPeerPaymentAccountPID:inDatabase:",  v20,  v21,  v22);

  int64_t v24 = -[SQLiteEntity persistentID](self, "persistentID");
  id v25 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity database](self, "database"));
  +[PeerPaymentAssociatedAccountRemovalRecord deleteAssociatedAccountRemovalRecordsForPeerPaymentAccountPID:inDatabase:]( &OBJC_CLASS___PeerPaymentAssociatedAccountRemovalRecord,  "deleteAssociatedAccountRemovalRecordsForPeerPaymentAccountPID:inDatabase:",  v24,  v25);

  v26 = (void *)objc_claimAutoreleasedReturnValue([v5 associatedAccountRemovalRecords]);
  int64_t v27 = -[SQLiteEntity persistentID](self, "persistentID");
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity database](self, "database"));
  id v29 =  +[PeerPaymentAssociatedAccountRemovalRecord insertAssociatedAccountRemovalRecords:forPeerPaymentAccountPID:inDatabase:]( &OBJC_CLASS___PeerPaymentAssociatedAccountRemovalRecord,  "insertAssociatedAccountRemovalRecords:forPeerPaymentAccountPID:inDatabase:",  v26,  v27,  v28);

  uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue([v5 associatedAccounts]);
  int64_t v31 = -[SQLiteEntity persistentID](self, "persistentID");
  id v32 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);
  uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity database](self, "database"));
  +[PeerPaymentAccount _insertOrUpdateAssociatedPeerPaymentAccounts:forPeerPaymentAccountPID:accountIdentifier:inDatabase:]( &OBJC_CLASS___PeerPaymentAccount,  "_insertOrUpdateAssociatedPeerPaymentAccounts:forPeerPaymentAccountPID:accountIdentifier:inDatabase:",  v30,  v31,  v32,  v33);

  int64_t v34 = -[SQLiteEntity persistentID](self, "persistentID");
  v35 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity database](self, "database"));
  +[PeerPaymentPaymentModeIdentifiers deletePeerPaymentPaymentModeIdentifiersForAccountPID:inDatabase:]( &OBJC_CLASS___PeerPaymentPaymentModeIdentifiers,  "deletePeerPaymentPaymentModeIdentifiersForAccountPID:inDatabase:",  v34,  v35);

  id v36 = (void *)objc_claimAutoreleasedReturnValue([v4 paymentModeIdentifiers]);
  int64_t v37 = -[SQLiteEntity persistentID](self, "persistentID");
  int64_t v38 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity database](self, "database"));
  id v39 =  +[PeerPaymentPaymentModeIdentifiers insertPeerPaymentPaymentModeIdentifiers:forPeerPaymentAccountPID:inDatabase:]( &OBJC_CLASS___PeerPaymentPaymentModeIdentifiers,  "insertPeerPaymentPaymentModeIdentifiers:forPeerPaymentAccountPID:inDatabase:",  v36,  v37,  v38);

  int64_t v40 = -[SQLiteEntity persistentID](self, "persistentID");
  __int128 v41 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity database](self, "database"));
  +[PeerPaymentEncryptionCertificatesVersions deletePeerPaymentEncryptionCertificatesVersionsForAccountPID:inDatabase:]( &OBJC_CLASS___PeerPaymentEncryptionCertificatesVersions,  "deletePeerPaymentEncryptionCertificatesVersionsForAccountPID:inDatabase:",  v40,  v41);

  __int128 v42 = (void *)objc_claimAutoreleasedReturnValue([v4 encryptionCertificatesVersions]);
  int64_t v43 = -[SQLiteEntity persistentID](self, "persistentID");
  v44 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity database](self, "database"));
  id v45 =  +[PeerPaymentEncryptionCertificatesVersions insertPeerPaymentEncryptionCertificatesVersions:forPeerPaymentAccountPID:inDatabase:]( &OBJC_CLASS___PeerPaymentEncryptionCertificatesVersions,  "insertPeerPaymentEncryptionCertificatesVersions:forPeerPaymentAccountPID:inDatabase:",  v42,  v43,  v44);
}

+ (id)_predicateForAssociatedPeerPaymentAccountPID:(int64_t)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a3));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"associated_account_pid",  v3));

  return v4;
}

+ (id)_predicateForAssociatedPeerPaymentAccountIdentifier:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"identifier",  a3);
}

- (id)peerPaymentAccount
{
  v3 = objc_alloc_init(&OBJC_CLASS___PKPeerPaymentAccount);
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[PeerPaymentAccount _propertySettersForPeerPaymentAccount]( &OBJC_CLASS___PeerPaymentAccount,  "_propertySettersForPeerPaymentAccount"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 allKeys]);
  v41[0] = _NSConcreteStackBlock;
  v41[1] = 3221225472LL;
  v41[2] = sub_1001BFD58;
  v41[3] = &unk_100639EE8;
  id v36 = v4;
  id v42 = v36;
  int64_t v6 = v3;
  int64_t v43 = v6;
  -[SQLiteEntity getValuesForProperties:withApplier:](self, "getValuesForProperties:withApplier:", v5, v41);

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[PeerPaymentAccount currentBalance](self, "currentBalance"));
  -[PKPeerPaymentAccount setCurrentBalance:](v6, "setCurrentBalance:", v7);

  int64_t v8 = -[SQLiteEntity persistentID](self, "persistentID");
  int64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity database](self, "database"));
  uint64_t v10 = objc_claimAutoreleasedReturnValue( +[PeerPaymentAccountAdditionalPushTopics peerPaymentAccountAdditionalPushTopicsForAccountPID:inDatabase:]( &OBJC_CLASS___PeerPaymentAccountAdditionalPushTopics,  "peerPaymentAccountAdditionalPushTopicsForAccountPID:inDatabase:",  v8,  v9));

  v35 = (void *)v10;
  -[PKPeerPaymentAccount setAdditionalPushTopics:](v6, "setAdditionalPushTopics:", v10);
  int64_t v11 = -[SQLiteEntity persistentID](self, "persistentID");
  int64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity database](self, "database"));
  id v13 = (void *)objc_claimAutoreleasedReturnValue( +[PeerPaymentAccountFeatureDescriptor featureDescriptorsForPeerPaymentAccountPID:inDatabase:]( &OBJC_CLASS___PeerPaymentAccountFeatureDescriptor,  "featureDescriptorsForPeerPaymentAccountPID:inDatabase:",  v11,  v12));

  -[PKPeerPaymentAccount setSupportedFeatureDescriptors:](v6, "setSupportedFeatureDescriptors:", v13);
  id v14 = (void *)objc_claimAutoreleasedReturnValue(-[PeerPaymentAccount associatedAccountInformation](self, "associatedAccountInformation"));
  -[PKPeerPaymentAccount setAssociatedAccountInformation:](v6, "setAssociatedAccountInformation:", v14);

  int64_t v15 = -[SQLiteEntity persistentID](self, "persistentID");
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity database](self, "database"));
  uint64_t v17 = objc_claimAutoreleasedReturnValue( +[PeerPaymentPaymentModeIdentifiers peerPaymentPaymentModeIdentifiersForAccountPID:inDatabase:]( &OBJC_CLASS___PeerPaymentPaymentModeIdentifiers,  "peerPaymentPaymentModeIdentifiersForAccountPID:inDatabase:",  v15,  v16));

  int64_t v34 = (void *)v17;
  -[PKPeerPaymentAccount setPaymentModeIdentifiers:](v6, "setPaymentModeIdentifiers:", v17);
  int64_t v18 = -[SQLiteEntity persistentID](self, "persistentID");
  id v19 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity database](self, "database"));
  uint64_t v20 = objc_claimAutoreleasedReturnValue( +[PeerPaymentEncryptionCertificatesVersions peerPaymentEncryptionCertificatesVersionsForAccountPID:inDatabase:]( &OBJC_CLASS___PeerPaymentEncryptionCertificatesVersions,  "peerPaymentEncryptionCertificatesVersionsForAccountPID:inDatabase:",  v18,  v19));

  uint64_t v33 = (void *)v20;
  -[PKPeerPaymentAccount setEncryptionCertificatesVersions:](v6, "setEncryptionCertificatesVersions:", v20);
  __int128 v39 = 0u;
  __int128 v40 = 0u;
  __int128 v37 = 0u;
  __int128 v38 = 0u;
  id v21 = v13;
  id v22 = [v21 countByEnumeratingWithState:&v37 objects:v44 count:16];
  if (v22)
  {
    id v23 = v22;
    uint64_t v24 = *(void *)v38;
    while (2)
    {
      for (i = 0LL; i != v23; i = (char *)i + 1)
      {
        if (*(void *)v38 != v24) {
          objc_enumerationMutation(v21);
        }
        v26 = *(void **)(*((void *)&v37 + 1) + 8LL * (void)i);
        int64_t v27 = (void *)objc_claimAutoreleasedReturnValue([v26 osVersionRange]);
        else {
          int v28 = PKDeviceVersionMeetsRequiredVersion(v27);
        }
        if ([v26 isSupported])
        {
          id v29 = (void *)objc_claimAutoreleasedReturnValue([v27 maximum]);
          if (v29) {
            int v30 = PKDeviceVersionMeetsRequiredVersion(v27) ^ 1;
          }
          else {
            int v30 = 0;
          }
        }

        else
        {
          int v30 = 0;
        }

        if ((v28 | v30) == 1)
        {
          -[PKPeerPaymentAccount setAccountStateDirty:](v6, "setAccountStateDirty:", 1LL);
          -[PeerPaymentAccount updateWithPeerPaymentAccount:](self, "updateWithPeerPaymentAccount:", v6);

          goto LABEL_20;
        }
      }

      id v23 = [v21 countByEnumeratingWithState:&v37 objects:v44 count:16];
      if (v23) {
        continue;
      }
      break;
    }
  }

- (id)currentBalance
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"current_balance_amount"));
  uint64_t v4 = PKCurrencyStorageNumberToCurrencyDecimal(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);

  int64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"current_balance_currency"));
  if (v5)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDecimalNumber notANumber](&OBJC_CLASS___NSDecimalNumber, "notANumber"));
    unsigned __int8 v8 = [v5 isEqualToNumber:v7];

    int64_t v9 = 0LL;
    if ((v8 & 1) == 0 && v6) {
      int64_t v9 = -[PKCurrencyAmount initWithAmount:currency:exponent:]( objc_alloc(&OBJC_CLASS___PKCurrencyAmount),  "initWithAmount:currency:exponent:",  v5,  v6,  0LL);
    }
  }

  else
  {
    int64_t v9 = 0LL;
  }

  return v9;
}

- (id)associatedAccountInformation
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( -[SQLiteEntity valueForProperty:]( self,  "valueForProperty:",  @"associated_account_last_updated_date"));
  uint64_t v4 = (void *)_DateForSQLValue(v3);

  v5 = (void *)objc_claimAutoreleasedReturnValue( -[SQLiteEntity valueForProperty:]( self,  "valueForProperty:",  @"associated_account_proactive_fetch_period"));
  int64_t v6 = v5;
  if (v5)
  {
    [v5 doubleValue];
    double v8 = v7;
  }

  else
  {
    double v8 = 0.0;
  }

  int64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"associated_account_state_dirty"));

  id v10 = [v9 BOOLValue];
  id v11 = objc_alloc_init(&OBJC_CLASS___PKPeerPaymentAssociatedAccountInformation);
  [v11 setLastUpdated:v4];
  [v11 setProactiveAssociatedAccountFetchPeriod:v8];
  [v11 setAssociatedAccountStateDirty:v10];
  int64_t v12 = -[SQLiteEntity persistentID](self, "persistentID");
  id v13 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity database](self, "database"));
  id v14 = (void *)objc_claimAutoreleasedReturnValue( +[PeerPaymentAccountInvitation invitationsForPeerPaymentAccountPID:inDatabase:]( &OBJC_CLASS___PeerPaymentAccountInvitation,  "invitationsForPeerPaymentAccountPID:inDatabase:",  v12,  v13));

  [v11 setAssociatedAccountInvitations:v14];
  int64_t v15 = -[SQLiteEntity persistentID](self, "persistentID");
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity database](self, "database"));
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue( +[PeerPaymentAssociatedAccountRemovalRecord associatedAccountRemovalRecordsForPeerPaymentAccountPID:inDatabase:]( &OBJC_CLASS___PeerPaymentAssociatedAccountRemovalRecord,  "associatedAccountRemovalRecordsForPeerPaymentAccountPID:inDatabase:",  v15,  v16));

  [v11 setAssociatedAccountRemovalRecords:v17];
  int64_t v18 = -[SQLiteEntity persistentID](self, "persistentID");
  id v19 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity database](self, "database"));
  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue( +[PeerPaymentAccount associatedPeerPaymentAccountForPeerPaymentAccountPID:inDatabase:]( &OBJC_CLASS___PeerPaymentAccount,  "associatedPeerPaymentAccountForPeerPaymentAccountPID:inDatabase:",  v18,  v19));

  [v11 setAssociatedAccounts:v20];
  return v11;
}

- (unint64_t)state
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"state"));
  id v3 = [v2 integerValue];

  return (unint64_t)v3;
}

- (id)associatedPassTypeIdentifier
{
  if ((PKUseMockSURFServer(self, a2) & 1) != 0)
  {
    uint64_t v3 = PKMockPeerPaymentPassPassTypeID();
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  }

  else
  {
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( -[SQLiteEntity valueForProperty:]( self,  "valueForProperty:",  @"associated_pass_type_identifier"));
  }

  return v4;
}

- (id)associatedPassSerialNumber
{
  if ((PKUseMockSURFServer(self, a2) & 1) != 0)
  {
    uint64_t v3 = PKMockPeerPaymentPassSerialNumber();
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  }

  else
  {
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"associated_pass_serial_number"));
  }

  return v4;
}

- (id)associatedPassUniqueID
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[PeerPaymentAccount associatedPassTypeIdentifier](self, "associatedPassTypeIdentifier"));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[PeerPaymentAccount associatedPassSerialNumber](self, "associatedPassSerialNumber"));
  uint64_t v5 = PKGeneratePassUniqueID(v3, v4);
  int64_t v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  return v6;
}

- (id)identifier
{
  return -[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"identifier");
}

- (id)transactionSourceIdentifier
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity database](self, "database"));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"transaction_source_pid"));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[TransactionSource anyInDatabase:withPersistentID:]( TransactionSource,  "anyInDatabase:withPersistentID:",  v3,  [v4 longLongValue]));
  int64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 identifier]);

  return v6;
}

+ (id)associatedPeerPaymentAccountForPeerPaymentAccountPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  double v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForAssociatedPeerPaymentAccountPID:a3]);
  double v8 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v7]);
  int64_t v9 = (void *)objc_claimAutoreleasedReturnValue([a1 _propertySettersForPeerPaymentAccount]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v9 allKeys]);
  v16 = _NSConcreteStackBlock;
  uint64_t v17 = 3221225472LL;
  int64_t v18 = sub_1001C0300;
  id v19 = &unk_100639E18;
  id v20 = v6;
  id v21 = v10;
  id v12 = v10;
  id v13 = v6;
  [v8 enumeratePersistentIDsAndProperties:v11 usingBlock:&v16];

  id v14 = objc_msgSend(v12, "copy", v16, v17, v18, v19);
  return v14;
}

+ (id)databaseTable
{
  return @"peer_payment_account";
}

+ (id)associationPropertyForEntityClass:(Class)a3
{
  if ((Class)objc_opt_class(&OBJC_CLASS___Pass, a2) == a3) {
    return @"pass_pid";
  }
  if ((Class)objc_opt_class(&OBJC_CLASS___TransactionSource, v4) == a3) {
    return @"transaction_source_pid";
  }
  return 0LL;
}

+ (void)addJoinClausesForProperty:(id)a3 toJoins:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v10 = @"pass.unique_id";
  double v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v10, 1LL));
  int64_t v9 = @"transaction_source.identifier";
  double v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v9, 1LL));
  if ([v8 containsObject:v5]) {
    [v6 addObject:@"LEFT OUTER JOIN transaction_source ON transaction_source.pid = peer_payment_account.transaction_source_pid"];
  }
}

- (BOOL)deleteFromDatabase
{
  int64_t v3 = -[SQLiteEntity persistentID](self, "persistentID");
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity database](self, "database"));
  +[PeerPaymentAccountAdditionalPushTopics deletePeerPaymentAccountAdditionalPushTopicsForAccountPID:inDatabase:]( &OBJC_CLASS___PeerPaymentAccountAdditionalPushTopics,  "deletePeerPaymentAccountAdditionalPushTopicsForAccountPID:inDatabase:",  v3,  v4);

  int64_t v5 = -[SQLiteEntity persistentID](self, "persistentID");
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity database](self, "database"));
  +[PeerPaymentAccountFeatureDescriptor deleteFeatureDescriptorsForPeerPaymentAccountPID:inDatabase:]( &OBJC_CLASS___PeerPaymentAccountFeatureDescriptor,  "deleteFeatureDescriptorsForPeerPaymentAccountPID:inDatabase:",  v5,  v6);

  int64_t v7 = -[SQLiteEntity persistentID](self, "persistentID");
  double v8 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity database](self, "database"));
  +[PeerPaymentAccountInvitation deleteInvitationsForPeerPaymentAccountPID:inDatabase:]( &OBJC_CLASS___PeerPaymentAccountInvitation,  "deleteInvitationsForPeerPaymentAccountPID:inDatabase:",  v7,  v8);

  int64_t v9 = -[SQLiteEntity persistentID](self, "persistentID");
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity database](self, "database"));
  +[PeerPaymentAssociatedAccountRemovalRecord deleteAssociatedAccountRemovalRecordsForPeerPaymentAccountPID:inDatabase:]( &OBJC_CLASS___PeerPaymentAssociatedAccountRemovalRecord,  "deleteAssociatedAccountRemovalRecordsForPeerPaymentAccountPID:inDatabase:",  v9,  v10);

  int64_t v11 = -[SQLiteEntity persistentID](self, "persistentID");
  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity database](self, "database"));
  +[PeerPaymentAccount _deleteAssociatedPeerPaymentAccountForPeerPaymentAccountPID:inDatabase:]( &OBJC_CLASS___PeerPaymentAccount,  "_deleteAssociatedPeerPaymentAccountForPeerPaymentAccountPID:inDatabase:",  v11,  v12);

  id v13 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity database](self, "database"));
  +[TransactionSource deleteEntitiesInDatabase:forPeerPaymentAccount:]( &OBJC_CLASS___TransactionSource,  "deleteEntitiesInDatabase:forPeerPaymentAccount:",  v13,  self);

  int64_t v14 = -[SQLiteEntity persistentID](self, "persistentID");
  int64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity database](self, "database"));
  +[AccountEndpointBackOff deleteEntriesForAccountType:accountPID:inDatabase:]( &OBJC_CLASS___AccountEndpointBackOff,  "deleteEntriesForAccountType:accountPID:inDatabase:",  1LL,  v14,  v15);

  int64_t v16 = -[SQLiteEntity persistentID](self, "persistentID");
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity database](self, "database"));
  +[PeerPaymentRecurringPayment deleteEntitiesForPeerPaymentAccountPID:inDatabase:]( &OBJC_CLASS___PeerPaymentRecurringPayment,  "deleteEntitiesForPeerPaymentAccountPID:inDatabase:",  v16,  v17);

  int64_t v18 = -[SQLiteEntity persistentID](self, "persistentID");
  id v19 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity database](self, "database"));
  +[PeerPaymentPaymentModeIdentifiers deletePeerPaymentPaymentModeIdentifiersForAccountPID:inDatabase:]( &OBJC_CLASS___PeerPaymentPaymentModeIdentifiers,  "deletePeerPaymentPaymentModeIdentifiersForAccountPID:inDatabase:",  v18,  v19);

  int64_t v20 = -[SQLiteEntity persistentID](self, "persistentID");
  id v21 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity database](self, "database"));
  +[PeerPaymentEncryptionCertificate deleteEncryptionCertificatesForPeerPaymentAccountPID:inDatabase:]( &OBJC_CLASS___PeerPaymentEncryptionCertificate,  "deleteEncryptionCertificatesForPeerPaymentAccountPID:inDatabase:",  v20,  v21);

  int64_t v22 = -[SQLiteEntity persistentID](self, "persistentID");
  id v23 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity database](self, "database"));
  +[PeerPaymentEncryptionCertificatesVersions deletePeerPaymentEncryptionCertificatesVersionsForAccountPID:inDatabase:]( &OBJC_CLASS___PeerPaymentEncryptionCertificatesVersions,  "deletePeerPaymentEncryptionCertificatesVersionsForAccountPID:inDatabase:",  v22,  v23);

  v25.receiver = self;
  v25.super_class = (Class)&OBJC_CLASS___PeerPaymentAccount;
  return -[SQLiteEntity deleteFromDatabase](&v25, "deleteFromDatabase");
}

+ (id)insertOrUpdatePeerPaymentAccount:(id)a3 inDatabase:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  double v8 = (void *)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v7]);
  if (v8)
  {
    id v9 = v8;
    [v8 updateWithPeerPaymentAccount:v6];
  }

  else
  {
    uint64_t Object = PKLogFacilityTypeGetObject(11LL);
    int64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v13 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Could Not Match Peer Payment Account. Inserting New Peer Payment Account",  v13,  2u);
    }

    id v9 = [objc_alloc((Class)a1) initWithPeerPaymentAccount:v6 inDatabase:v7];
  }

  return v9;
}

+ (void)_deleteAssociatedPeerPaymentAccountForPeerPaymentAccountPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v8 = (id)objc_claimAutoreleasedReturnValue([a1 _predicateForAssociatedPeerPaymentAccountPID:a3]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v8]);

  [v7 deleteAllEntities];
}

+ (id)anyInDatabase:(id)a3
{
  id v4 = a3;
  int64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteNullPredicate isNullPredicateWithProperty:]( &OBJC_CLASS___SQLiteNullPredicate,  "isNullPredicateWithProperty:",  @"associated_account_pid"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v4 predicate:v5]);

  return v6;
}

+ (id)anyInDatabase:(id)a3 withPersistentID:(int64_t)a4
{
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a4));
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"pid",  v7));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v6 predicate:v8]);

  return v9;
}

+ (id)anyInDatabase:(id)a3 withTransactionSourcePID:(int64_t)a4
{
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a4));
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"transaction_source_pid",  v7));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v6 predicate:v8]);

  return v9;
}

+ (id)anyInDatabase:(id)a3 withIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForAssociatedPeerPaymentAccountIdentifier:a4]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v6 predicate:v7]);

  return v8;
}

- (id)_passForPeerPaymentAccount:(id)a3 database:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 associatedPassTypeIdentifier]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[PassType anyInDatabase:withPassTypeID:]( &OBJC_CLASS___PassType,  "anyInDatabase:withPassTypeID:",  v5,  v7));

  id v9 = (void *)objc_claimAutoreleasedReturnValue([v6 associatedPassSerialNumber]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue( +[Pass anyInDatabase:withPassType:serialNumber:]( &OBJC_CLASS___Pass,  "anyInDatabase:withPassType:serialNumber:",  v5,  v8,  v9));

  return v10;
}

- (id)_dictionaryForPeerPaymentAccount:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 associatedAccountInformation]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 currentBalance]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 amount]);
  uint64_t v9 = PKCurrencyDecimalToStorageNumber(v8);
  id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);

  int64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v4 maximumBalance]);
  uint64_t v12 = PKCurrencyDecimalToStorageNumber(v11);
  id v13 = (void *)objc_claimAutoreleasedReturnValue(v12);

  int64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v4 amountRemainingUntilIdentityVerification]);
  uint64_t v15 = PKCurrencyDecimalToStorageNumber(v14);
  int64_t v16 = (void *)objc_claimAutoreleasedReturnValue(v15);

  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity database](self, "database"));
  int64_t v18 = (void *)objc_claimAutoreleasedReturnValue( -[PeerPaymentAccount _passForPeerPaymentAccount:database:]( self,  "_passForPeerPaymentAccount:database:",  v4,  v17));

  if (v18) {
    objc_msgSend(v5, "setLongLong:forKey:", objc_msgSend(v18, "persistentID"), @"pass_pid");
  }
  id v19 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);
  [v5 setObjectOrNull:v19 forKey:@"identifier"];

  int64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v4 createdDate]);
  id v21 = (void *)_SQLValueForDate(v20);
  [v5 setObjectOrNull:v21 forKey:@"created_date"];

  int64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v4 identifiedDate]);
  id v23 = (void *)_SQLValueForDate(v22);
  [v5 setObjectOrNull:v23 forKey:@"identified_date"];

  objc_msgSend(v5, "setInteger:forKey:", objc_msgSend(v4, "role"), @"role");
  objc_msgSend(v5, "setInteger:forKey:", objc_msgSend(v4, "state"), @"state");
  objc_msgSend(v5, "setInteger:forKey:", objc_msgSend(v4, "stateReason"), @"state_reason");
  objc_msgSend( v5,  "setInteger:forKey:",  objc_msgSend(v4, "sendRestrictionType"),  @"person_to_person_restriction_type");
  objc_msgSend(v5, "setInteger:forKey:", objc_msgSend(v4, "receiveRestrictionType"), @"b");
  objc_msgSend(v5, "setInteger:forKey:", objc_msgSend(v4, "stage"), @"stage");
  uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue([v4 countryCode]);
  [v5 setObjectOrNull:v24 forKey:@"country_code"];

  [v5 setObjectOrNull:v10 forKey:@"current_balance_amount"];
  [v5 setObjectOrNull:v13 forKey:@"maximum_balance_amount"];
  objc_super v25 = (void *)objc_claimAutoreleasedReturnValue([v4 currentBalance]);
  v26 = (void *)objc_claimAutoreleasedReturnValue([v25 currency]);
  [v5 setObjectOrNull:v26 forKey:@"current_balance_currency"];

  int64_t v27 = (void *)objc_claimAutoreleasedReturnValue([v4 altDSID]);
  [v5 setObjectOrNull:v27 forKey:@"alt_dsid"];

  objc_msgSend( v5,  "setBool:forKey:",  objc_msgSend(v4, "identityVerificationRequired"),  @"identity_verification_required");
  [v5 setObjectOrNull:v16 forKey:@"amount_remaining_until_identity_verification"];
  objc_msgSend(v5, "setBool:forKey:", objc_msgSend(v4, "isAccountStateDirty"), @"account_state_dirty");
  int v28 = (void *)objc_claimAutoreleasedReturnValue([v4 lastUpdated]);
  id v29 = (void *)_SQLValueForDate(v28);
  [v5 setObjectOrNull:v29 forKey:@"last_updated_date"];

  [v4 proactiveFetchPeriod];
  objc_msgSend(v5, "setDouble:forKey:", @"proactive_fetch_period");
  [v4 accountFetchAfterTransactionWaitPeriod];
  objc_msgSend(v5, "setDouble:forKey:", @"account_fetch_after_transaction_wait_period");
  [v4 accountFetchAfterTransactionWaitTolerance];
  objc_msgSend(v5, "setDouble:forKey:", @"account_fetch_after_transaction_wait_tolerance");
  objc_msgSend(v5, "setBool:forKey:", objc_msgSend(v4, "termsAcceptanceRequired"), @"terms_acceptance_required");
  int v30 = (void *)objc_claimAutoreleasedReturnValue([v4 termsIdentifier]);
  [v5 setObjectOrNull:v30 forKey:@"terms_identifier"];

  int64_t v31 = (void *)objc_claimAutoreleasedReturnValue([v4 termsURL]);
  id v32 = (void *)objc_claimAutoreleasedReturnValue([v31 absoluteString]);
  [v5 setObjectOrNull:v32 forKey:@"terms_url"];

  uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue([v4 associatedPassURL]);
  int64_t v34 = (void *)objc_claimAutoreleasedReturnValue([v33 absoluteString]);
  [v5 setObjectOrNull:v34 forKey:@"associated_pass_url"];

  v35 = (void *)objc_claimAutoreleasedReturnValue([v4 associatedPassSerialNumber]);
  [v5 setObjectOrNull:v35 forKey:@"associated_pass_serial_number"];

  id v36 = (void *)objc_claimAutoreleasedReturnValue([v4 associatedPassTypeIdentifier]);
  [v5 setObjectOrNull:v36 forKey:@"associated_pass_type_identifier"];

  objc_msgSend(v5, "setInteger:forKey:", objc_msgSend(v4, "pendingPaymentCount"), @"pending_payment_count");
  objc_msgSend( v5,  "setBool:forKey:",  objc_msgSend(v4, "identityVerificationForDisbursementsRequired"),  @"identity_verification_for_disbursements_required");
  objc_msgSend( v5,  "setBool:forKey:",  objc_msgSend(v4, "hasDisplayedAssociatedAccountActiveNotification"),  @"displayed_associated_account_active_notification");
  __int128 v37 = (void *)objc_claimAutoreleasedReturnValue([v4 cloudStoreZoneNames]);
  __int128 v38 = (void *)objc_claimAutoreleasedReturnValue([v37 allObjects]);
  __int128 v39 = (void *)objc_claimAutoreleasedReturnValue([v38 componentsJoinedByString:@","]);
  [v5 setObjectOrNull:v39 forKey:@"cloud_store_zone_names"];

  [v6 proactiveAssociatedAccountFetchPeriod];
  objc_msgSend(v5, "setDouble:forKey:", @"associated_account_proactive_fetch_period");
  __int128 v40 = (void *)objc_claimAutoreleasedReturnValue([v6 lastUpdated]);
  __int128 v41 = (void *)_SQLValueForDate(v40);
  [v5 setObjectOrNull:v41 forKey:@"associated_account_last_updated_date"];

  objc_msgSend( v5,  "setBool:forKey:",  objc_msgSend(v6, "isAssociatedAccountStateDirty"),  @"associated_account_state_dirty");
  objc_msgSend( v5,  "setInteger:forKey:",  objc_msgSend(v4, "deviceScoreEncryptedPayloadVersion"),  @"device_score_encrypted_payload_version");
  objc_msgSend(v5, "setBool:forKey:", objc_msgSend(v4, "hasRecurringPayments"), @"a");

  return v5;
}

+ (id)_propertySettersForPeerPaymentAccount
{
  v3[0] = @"identifier";
  v3[1] = @"created_date";
  v4[0] = &stru_10064AA38;
  v4[1] = &stru_10064AA58;
  v3[2] = @"identified_date";
  v3[3] = @"role";
  v4[2] = &stru_10064AA78;
  v4[3] = &stru_10064AA98;
  v3[4] = @"state";
  v3[5] = @"state_reason";
  v4[4] = &stru_10064AAB8;
  v4[5] = &stru_10064AAD8;
  v3[6] = @"person_to_person_restriction_type";
  v3[7] = @"b";
  v4[6] = &stru_10064AAF8;
  v4[7] = &stru_10064AB18;
  v3[8] = @"stage";
  v3[9] = @"country_code";
  v4[8] = &stru_10064AB38;
  v4[9] = &stru_10064AB58;
  v3[10] = @"alt_dsid";
  v3[11] = @"maximum_balance_amount";
  v4[10] = &stru_10064AB78;
  v4[11] = &stru_10064AB98;
  v3[12] = @"identity_verification_required";
  v3[13] = @"amount_remaining_until_identity_verification";
  v4[12] = &stru_10064ABB8;
  v4[13] = &stru_10064ABD8;
  v3[14] = @"terms_acceptance_required";
  v3[15] = @"account_state_dirty";
  v4[14] = &stru_10064ABF8;
  v4[15] = &stru_10064AC18;
  v3[16] = @"last_updated_date";
  v3[17] = @"proactive_fetch_period";
  v4[16] = &stru_10064AC38;
  v4[17] = &stru_10064AC58;
  v3[18] = @"account_fetch_after_transaction_wait_period";
  v3[19] = @"account_fetch_after_transaction_wait_tolerance";
  v4[18] = &stru_10064AC78;
  v4[19] = &stru_10064AC98;
  v3[20] = @"terms_identifier";
  v3[21] = @"terms_url";
  v4[20] = &stru_10064ACB8;
  v4[21] = &stru_10064ACD8;
  v3[22] = @"associated_pass_url";
  v3[23] = @"associated_pass_serial_number";
  v4[22] = &stru_10064ACF8;
  v4[23] = &stru_10064AD18;
  v3[24] = @"associated_pass_type_identifier";
  v3[25] = @"pending_payment_count";
  v4[24] = &stru_10064AD38;
  v4[25] = &stru_10064AD58;
  v3[26] = @"identity_verification_for_disbursements_required";
  v3[27] = @"displayed_associated_account_active_notification";
  v4[26] = &stru_10064AD78;
  v4[27] = &stru_10064AD98;
  v3[28] = @"cloud_store_zone_names";
  v3[29] = @"transaction_source.identifier";
  v4[28] = &stru_10064ADB8;
  v4[29] = &stru_10064ADD8;
  v3[30] = @"device_score_encrypted_payload_version";
  v3[31] = @"a";
  v4[30] = &stru_10064ADF8;
  v4[31] = &stru_10064AE18;
  return (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v4,  v3,  32LL));
}

@end
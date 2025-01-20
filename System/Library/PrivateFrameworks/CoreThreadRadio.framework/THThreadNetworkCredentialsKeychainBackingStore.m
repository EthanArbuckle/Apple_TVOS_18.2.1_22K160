@interface THThreadNetworkCredentialsKeychainBackingStore
+ (id)defaultBackingStore;
- (BOOL)DBGstorePreferred:(id)a3;
- (BOOL)areValidDataSetTLVs:(id)a3;
- (BOOL)areValidDataSetTLVs:(id)a3 creds:(id *)a4;
- (BOOL)checkIfActiveDatasetRecordIsPresentInTheGivenList:(id)a3 Missinglist:(id)a4 record:(id)a5;
- (BOOL)checkIfNetworkMatchToMDNSScan:(id)a3 borderAgentID:(id)a4;
- (BOOL)checkIfPrefEntryForCurrentSignatureIsMissingSSID:(id)a3 nwSignature:(id)a4;
- (BOOL)checkIfXpanIDMatchToMDNSScan:(id)a3;
- (BOOL)checkWiFiStatus;
- (BOOL)deleteAllRecordsForKeychainAccessGroup:(id)a3;
- (BOOL)deleteOldEntryForTheNetworkSignatureIfThreadNetworkIsDifferent:(id)a3 nwSignature:(id)a4;
- (BOOL)deletePreferredNetworkEntry:(id)a3;
- (BOOL)deletePreferredNetworkEntryWithoutRecords:(id)a3;
- (BOOL)fetchRecord:(id)a3;
- (BOOL)isEthernetNetwork;
- (BOOL)isFrozenRecord:(id)a3;
- (BOOL)isMatchingMdnsRecords:(id)a3 preferredNw:(id)a4;
- (BOOL)isMatchingNetworkSignature:(id)a3 preferredNwSignature:(id)a4;
- (BOOL)isMatchingNetworkSignature:(id)a3 preferredNwSignature:(id)a4 preferred:(id)a5 signaturePrefEntries:(id)a6 updatedPreferred:(id *)a7;
- (BOOL)isPreferred:(id)a3;
- (BOOL)isWiFiNetwork;
- (BOOL)markAsPreferred:(id)a3;
- (BOOL)matchPreferredNetworkRecordWithMdns:(id)a3;
- (BOOL)skipDeleteWithBorderAgent:(id)a3;
- (BOOL)skipDeleteWithUUID:(id)a3;
- (BOOL)storeFrozenThreadNetwork:(id)a3;
- (BOOL)storePreferred:(id)a3;
- (BOOL)storePreferredEntryAndCheckForDup:(id)a3 isDuplicate:(int *)a4;
- (BOOL)storePreferredNetworkWithRecord:(id)a3;
- (BOOL)updatePreferredNetwork;
- (BOOL)updatePreferredNetworkEntry:(id)a3;
- (BOOL)updateRecord:(id)a3;
- (BOOL)updateRecordToPreferredNetworkEntry:(id)a3 credentialsDataSetRecord:(id)a4;
- (BOOL)wifiInfoAvailable:(id)a3;
- (id)_doFetchActiveDataSetRecords:(id)a3 error:(id *)a4;
- (id)_doFetchFrozenThreadNetworks:(id)a3 error:(id *)a4;
- (id)_doFetchOneActiveDataSetRecords:(id)a3 error:(id *)a4;
- (id)_doFetchPreferredNetworks:(id)a3 error:(id *)a4;
- (id)_doFetchRecords:(id)a3 error:(id *)a4;
- (id)checkIfNetworkSignatureUpdateIsRequiredForPreferredNetwork:(id)a3 nwSignature:(id)a4;
- (id)checkIfNetworkSignatureUpdateIsRequiredForPreferredNetwork:(id)a3 nwSignature:(id)a4 signaturePrefEntries:(id)a5;
- (id)checkIfPrefItemPresentInTheCleanupList:(id)a3 cleanupList:(id)a4;
- (id)dataFromHexString:(id)a3;
- (id)deleteActiveDataSetRecordForNetworkAndBorderAgentId:(id)a3 borderAgent:(id)a4;
- (id)generateCredentials;
- (id)getActiveDataSetRecord:(id)a3;
- (id)getActiveDataSetRecordForNetworkAndBorderAgentId:(id)a3 borderAgent:(id)a4;
- (id)getActiveRecords:(id)a3;
- (id)getAllPrefEntries;
- (id)getNetworkSignature;
- (id)getNumberOfPrefEntriesForTheCount:(int)a3;
- (id)getNumberOfRecordsForKeychainAccessGroup:(id)a3 count:(int)a4;
- (id)getOneRecordForNetwork:(id)a3;
- (id)getPrefEntriesForLabelAsSSID:(id)a3;
- (id)getPrefEntriesForSSID:(id)a3;
- (id)getPrefEntriesForSSIDAndSignature:(id)a3;
- (id)getPrefEntriesForSignature:(id)a3;
- (id)getPreferredNetwork:(BOOL)a3;
- (id)getPreferredNetwork:(BOOL)a3 skipScan:(BOOL)a4;
- (id)getPreferredNetworkInternally;
- (id)getPreferredNetworkWithRecords;
- (id)getRecordForPreferredNetwork:(BOOL)a3 anyDsFormat:(BOOL)a4;
- (id)getRecordForPreferredNetwork:(BOOL)a3 anyDsFormat:(BOOL)a4 skipScan:(BOOL)a5;
- (id)getTheKeyFromPreferredNetworkEntry:(id)a3;
- (id)getTheMdnsMatchingEntryFromTheList:(id)a3;
- (id)matchPreferredNetworkWithMdns:(id)a3;
- (id)matchPreferredNetworkWithNetworkSignature:(id)a3 nwSignature:(id)a4;
- (id)sortAndReturnPreferredNetwork:(id)a3;
- (id)sortAndReturnPreferredNetwork:(id)a3 onlyMdns:(BOOL)a4;
- (unint64_t)getCountOfThreadBorderRoutersWithMdns:(id)a3;
- (void)addPreferredNetworkWithCompletionInternally:(id)a3 borderAgentID:(id)a4 ipV4NwSignature:(id)a5 ipv6NwSignature:(id)a6 wifiSSID:(id)a7 wifiPassword:(id)a8 completion:(id)a9;
- (void)checkIfRecordForPreferredNetworkIsPresentWithCompletion:(id)a3;
- (void)cleanThreadKeychainDatabase:(id)a3;
- (void)deleteActiveDataSetRecordForThreadBorderAgent:(id)a3 completion:(id)a4;
- (void)deleteActiveDataSetRecordForThreadBorderAgentWithKeychainAccessGroup:(id)a3 keychainAccessGroup:(id)a4 completion:(id)a5;
- (void)deleteActiveDataSetRecordWithUniqueIdentifier:(id)a3 completion:(id)a4;
- (void)deleteActiveDataSetRecordWithUniqueIdentifierWithKeychainAccessGroup:(id)a3 keychainAccessGroup:(id)a4 completion:(id)a5;
- (void)deletePreferredAndFrozenThreadNetworksWithCompletion:(id)a3;
- (void)deletePreferredNetworkEntryWithCompletion:(id)a3 completion:(id)a4;
- (void)deletePreferredNetworkForNetworkSignatureInternallyWithCompletion:(id)a3 ipv6NwSignature:(id)a4 wifiSSID:(id)a5 completion:(id)a6;
- (void)deletePreferredNetworkWithCompletion:(id)a3;
- (void)deleteRecordWithUniqueIdentifier:(id)a3 completion:(id)a4;
- (void)dispatchRemoveExcessPreferredEntry;
- (void)dispatchRemoveInActiveRecords:(id)a3;
- (void)dumpFrozenThreadNetworks:(id)a3;
- (void)dumpPreferredNetwork:(id)a3;
- (void)dumpPreferredNetworks:(id)a3;
- (void)dumpPreferredNetworksArray:(id)a3;
- (void)errorout:(int)a3 completion:(id)a4;
- (void)getSecFlags:(char *)a3;
- (void)retrieveActiveDataSetRecordForThreadBorderAgent:(id)a3 completion:(id)a4;
- (void)retrieveActiveDataSetRecordForThreadBorderAgentWithKeychainAccessGroup:(id)a3 keychainAccessGroup:(id)a4 completion:(id)a5;
- (void)retrieveActiveDataSetRecordOnMdnsWithExtendedPANId:(id)a3 completion:(id)a4;
- (void)retrieveActiveDataSetRecordWithExtendedPANId:(id)a3 completion:(id)a4;
- (void)retrieveActiveDataSetRecordWithTLVsForThreadBorderAgent:(id)a3 completion:(id)a4;
- (void)retrieveActiveDataSetRecordWithUniqueIdentifier:(id)a3 completion:(id)a4;
- (void)retrieveActiveDataSetRecordWithUniqueIdentifierWithKeychainAccessGroup:(id)a3 keychainAccessGroup:(id)a4 completion:(id)a5;
- (void)retrieveAllActiveDataSetRecordsForClientKeychainAccessGroup:(id)a3 compleiton:(id)a4;
- (void)retrieveAllActiveDataSetRecordsForClientKeychainAccessGroup:(id)a3 completion:(id)a4;
- (void)retrieveAllActiveDataSetRecordsForNetwork:(id)a3 completion:(id)a4;
- (void)retrieveAllActiveDataSetRecordsWithCompletion:(id)a3;
- (void)retrieveAllActiveDataSetRecordsWithFlagForClientKeychainAccessGroup:(id)a3 activeFlag:(BOOL)a4 compleiton:(id)a5;
- (void)retrieveAllActiveDataSetRecordsWithFlagForClientKeychainAccessGroup:(id)a3 activeFlag:(BOOL)a4 completion:(id)a5;
- (void)retrieveAllRecordsForNetwork:(id)a3 completion:(id)a4;
- (void)retrieveAllRecordsWithCompletion:(id)a3;
- (void)retrieveOrGeneratePreferredNetworkInternallyWithCompletion:(id)a3;
- (void)retrievePreferredNetworkInternallyWithCompletion:(id)a3;
- (void)retrievePreferredNetworkOfAnyDSFormatWithCompletion:(id)a3;
- (void)retrievePreferredNetworkWithCompletion:(id)a3;
- (void)retrievePreferredNetworkWithNoScanWithCompletion:(id)a3;
- (void)retrieveRecordWithUniqueIdentifier:(id)a3 completion:(id)a4;
- (void)retrieveThirdPartyInfo:(id)a3;
- (void)sendCAMetricsForCleanUpRecordInfo:(cleanUpStats *)a3;
- (void)storeActiveDataSetRecordAndSync:(id)a3 completion:(id)a4;
- (void)storeCachedAODasPreferredNetwork:(id)a3 completion:(id)a4;
- (void)storeRecord:(id)a3 completion:(id)a4;
- (void)storeRecord:(id)a3 waitForSync:(BOOL)a4 completion:(id)a5;
- (void)storeRecordAndSync:(id)a3 completion:(id)a4;
- (void)storeThreadCredentialActiveDataSetRecord:(id)a3 waitForSync:(BOOL)a4 completion:(id)a5;
- (void)thDumpActiveDatasetRecord:(id)a3;
- (void)updatePreferredNetworkInternallyWithCompletion:(id)a3;
- (void)updatePreferredNetworkWithNewDatasetRecord:(id)a3 completion:(id)a4;
- (void)validateAODInternally:(id)a3 completion:(id)a4;
- (void)validateRecordWithMdnsScan:(id)a3 borderAgentID:(id)a4 completion:(id)a5;
@end

@implementation THThreadNetworkCredentialsKeychainBackingStore

+ (id)defaultBackingStore
{
  if (qword_1002D1A10 != -1) {
    dispatch_once(&qword_1002D1A10, &stru_1002B4F30);
  }
  return (id)qword_1002D1A08;
}

- (id)_doFetchRecords:(id)a3 error:(id *)a4
{
  CFTypeRef result = 0LL;
  OSStatus v5 = SecItemCopyMatching((CFDictionaryRef)a3, &result);
  if (v5)
  {
    OSStatus v7 = v5;
    if (v5 == -25300)
    {
      return (id)objc_claimAutoreleasedReturnValue(+[NSSet set](&OBJC_CLASS___NSSet, "set"));
    }

    else
    {
      v21 = (__CFString *)SecCopyErrorMessageString(v5, 0LL);
      id v22 = sub_1001768B4(1);
      v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
        sub_10019423C();
      }

      if (a4)
      {
        v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSOSStatusErrorDomain,  v7,  0LL));
        *a4 = (id)objc_claimAutoreleasedReturnValue( +[NSError storeError:underlyingError:description:]( &OBJC_CLASS___NSError,  "storeError:underlyingError:description:",  2LL,  v24,  v21));
      }

      return 0LL;
    }
  }

  else
  {
    v9 = (void *)result;
    if (result && (uint64_t v10 = objc_opt_class(&OBJC_CLASS___NSArray, v6), (objc_opt_isKindOfClass(v9, v10) & 1) == 0))
    {
      id v25 = sub_1001768B4(1);
      v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
        sub_1001942A0();
      }

      v20 = 0LL;
      if (a4) {
        *a4 = (id)objc_claimAutoreleasedReturnValue( +[NSError storeError:description:]( &OBJC_CLASS___NSError,  "storeError:description:",  3LL,  @"Bad return type from SecItemCopyMatching"));
      }
    }

    else
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v9 count]));
      __int128 v28 = 0u;
      __int128 v29 = 0u;
      __int128 v30 = 0u;
      __int128 v31 = 0u;
      v27 = v9;
      id v12 = v9;
      id v13 = [v12 countByEnumeratingWithState:&v28 objects:v37 count:16];
      if (v13)
      {
        id v14 = v13;
        uint64_t v15 = *(void *)v29;
        do
        {
          for (i = 0LL; i != v14; i = (char *)i + 1)
          {
            if (*(void *)v29 != v15) {
              objc_enumerationMutation(v12);
            }
            v17 = (void *)objc_claimAutoreleasedReturnValue( +[THThreadNetworkCredentialsStoreRecord recordFromKeychainDictionary:]( &OBJC_CLASS___THThreadNetworkCredentialsStoreRecord,  "recordFromKeychainDictionary:",  *(void *)(*((void *)&v28 + 1) + 8LL * (void)i)));
            if (v17)
            {
              [v11 addObject:v17];
            }

            else
            {
              id v18 = sub_1001768B4(1);
              v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
              if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 136315394;
                v34 = "-[THThreadNetworkCredentialsKeychainBackingStore _doFetchRecords:error:]";
                __int16 v35 = 1024;
                int v36 = 107;
                _os_log_error_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_ERROR,  "%s:%d: Failed to interpret keychain item! SKIPPING!",  buf,  0x12u);
              }
            }
          }

          id v14 = [v12 countByEnumeratingWithState:&v28 objects:v37 count:16];
        }

        while (v14);
      }

      v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v11));
      v9 = v27;
    }

    return v20;
  }

- (void)retrieveAllRecordsForNetwork:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
  v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100176DE0;
  block[3] = &unk_1002B4F58;
  id v13 = v6;
  id v14 = self;
  id v15 = v7;
  id v10 = v7;
  id v11 = v6;
  dispatch_async(v9, block);
}

- (void)retrieveAllRecordsWithCompletion:(id)a3
{
  id v4 = a3;
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_100176FD4;
  v8[3] = &unk_1002B4F80;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(v6, v8);
}

- (void)retrieveRecordWithUniqueIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
  id v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10017720C;
  block[3] = &unk_1002B4F58;
  id v13 = v6;
  id v14 = self;
  id v15 = v7;
  id v10 = v7;
  id v11 = v6;
  dispatch_async(v9, block);
}

- (void)errorout:(int)a3 completion:(id)a4
{
  OSStatus v5 = (void (**)(id, void, void *))a4;
  id v6 = (__CFString *)SecCopyErrorMessageString(a3, 0LL);
  id v7 = sub_1001768B4(1);
  v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
    sub_100194304();
  }

  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSOSStatusErrorDomain,  a3,  0LL));
  id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSError storeError:underlyingError:description:]( &OBJC_CLASS___NSError,  "storeError:underlyingError:description:",  2LL,  v9,  v6));
  v5[2](v5, 0LL, v10);
}

- (void)storeRecordAndSync:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(global_queue);
  v24[0] = 0LL;
  v24[1] = v24;
  v24[2] = 0x2020000000LL;
  char v25 = 0;
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v6 keyChainItemRepresentationForAddOperation]);
  if (v10)
  {
    id v23 = 0LL;
    id v11 = (void *)objc_claimAutoreleasedReturnValue(+[CKKSControl controlObject:](&OBJC_CLASS___CKKSControl, "controlObject:", &v23));
    id v12 = v23;
    if (v11)
    {
      uint64_t v13 = kSecAttrViewHintHome;
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472LL;
      v15[2] = sub_100177634;
      v15[3] = &unk_1002B5048;
      v21 = v24;
      id v16 = v9;
      id v17 = v6;
      id v20 = v7;
      id v18 = v10;
      v19 = self;
      __int16 v22 = 120;
      [v11 rpcKnownBadState:v13 reply:v15];

      id v14 = v16;
    }

    else
    {
      id v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSError storeError:description:]( &OBJC_CLASS___NSError,  "storeError:description:",  5LL,  @"CKKS object allocation failed"));
      (*((void (**)(id, void, void *))v7 + 2))(v7, 0LL, v14);
      id v11 = 0LL;
    }
  }

  else
  {
    id v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSError storeError:description:]( &OBJC_CLASS___NSError,  "storeError:description:",  4LL,  @"Bad network parameter"));
    (*((void (**)(id, void, void *))v7 + 2))(v7, 0LL, v14);
    id v12 = 0LL;
    id v11 = 0LL;
  }

  _Block_object_dispose(v24, 8);
}

- (void)storeRecord:(id)a3 completion:(id)a4
{
}

- (void)storeRecord:(id)a3 waitForSync:(BOOL)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
  id v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_1001783F8;
  v14[3] = &unk_1002B5070;
  id v16 = self;
  id v17 = v9;
  BOOL v18 = a4;
  id v15 = v8;
  id v12 = v9;
  id v13 = v8;
  dispatch_async(v11, v14);
}

- (void)deleteRecordWithUniqueIdentifier:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
  id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_10017872C;
  v11[3] = &unk_1002B4F80;
  id v12 = v5;
  id v13 = v6;
  id v9 = v6;
  id v10 = v5;
  dispatch_async(v8, v11);
}

- (id)_doFetchOneActiveDataSetRecords:(id)a3 error:(id *)a4
{
  CFTypeRef result = 0LL;
  OSStatus v5 = SecItemCopyMatching((CFDictionaryRef)a3, &result);
  if (v5 == -25300) {
    return 0LL;
  }
  OSStatus v6 = v5;
  if (v5)
  {
    id v7 = (void *)SecCopyErrorMessageString(v5, 0LL);
    id v10 = sub_1001768B4(1);
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_1001943D8();
    }

    if (a4)
    {
      id v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSOSStatusErrorDomain,  v6,  0LL));
      *a4 = (id)objc_claimAutoreleasedReturnValue( +[NSError storeError:underlyingError:description:]( &OBJC_CLASS___NSError,  "storeError:underlyingError:description:",  2LL,  v12,  v7));
    }

- (id)_doFetchActiveDataSetRecords:(id)a3 error:(id *)a4
{
  CFTypeRef result = 0LL;
  OSStatus v5 = SecItemCopyMatching((CFDictionaryRef)a3, &result);
  if (v5)
  {
    OSStatus v7 = v5;
    if (v5 == -25300)
    {
      return (id)objc_claimAutoreleasedReturnValue(+[NSSet set](&OBJC_CLASS___NSSet, "set"));
    }

    else
    {
      v19 = (__CFString *)SecCopyErrorMessageString(v5, 0LL);
      id v20 = sub_1001768B4(1);
      v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
        sub_1001943D8();
      }

      if (a4)
      {
        __int16 v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSOSStatusErrorDomain,  v7,  0LL));
        *a4 = (id)objc_claimAutoreleasedReturnValue( +[NSError storeError:underlyingError:description:]( &OBJC_CLASS___NSError,  "storeError:underlyingError:description:",  2LL,  v22,  v19));
      }

      return 0LL;
    }
  }

  else
  {
    id v9 = (void *)result;
    if (result && (uint64_t v10 = objc_opt_class(&OBJC_CLASS___NSArray, v6), (objc_opt_isKindOfClass(v9, v10) & 1) == 0))
    {
      id v23 = sub_1001768B4(1);
      v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
        sub_1001942A0();
      }

      BOOL v18 = 0LL;
      if (a4) {
        *a4 = (id)objc_claimAutoreleasedReturnValue( +[NSError storeError:description:]( &OBJC_CLASS___NSError,  "storeError:description:",  3LL,  @"Bad return type from SecItemCopyMatching"));
      }
    }

    else
    {
      id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v9 count]));
      __int128 v25 = 0u;
      __int128 v26 = 0u;
      __int128 v27 = 0u;
      __int128 v28 = 0u;
      id v12 = v9;
      id v13 = [v12 countByEnumeratingWithState:&v25 objects:v30 count:16];
      if (v13)
      {
        id v14 = v13;
        uint64_t v15 = *(void *)v26;
        do
        {
          for (i = 0LL; i != v14; i = (char *)i + 1)
          {
            if (*(void *)v26 != v15) {
              objc_enumerationMutation(v12);
            }
            id v17 = (void *)objc_claimAutoreleasedReturnValue( +[THThreadNetworkCredentialsActiveDataSetRecord activeDataSetRecordFromKeychainDictionary:]( &OBJC_CLASS___THThreadNetworkCredentialsActiveDataSetRecord,  "activeDataSetRecordFromKeychainDictionary:",  *(void *)(*((void *)&v25 + 1) + 8LL * (void)i),  (void)v25));
            if (v17) {
              [v11 addObject:v17];
            }
          }

          id v14 = [v12 countByEnumeratingWithState:&v25 objects:v30 count:16];
        }

        while (v14);
      }

      BOOL v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v11));
    }

    return v18;
  }

- (id)_doFetchPreferredNetworks:(id)a3 error:(id *)a4
{
  CFTypeRef result = 0LL;
  OSStatus v5 = SecItemCopyMatching((CFDictionaryRef)a3, &result);
  if (v5)
  {
    OSStatus v7 = v5;
    if (v5 == -25300)
    {
      id v8 = sub_1001768B4(1);
      id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        sub_10019450C();
      }

      return (id)objc_claimAutoreleasedReturnValue(+[NSSet set](&OBJC_CLASS___NSSet, "set"));
    }

    else
    {
      v21 = (__CFString *)SecCopyErrorMessageString(v5, 0LL);
      id v22 = sub_1001768B4(1);
      id v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
        sub_1001944A8();
      }

      if (a4)
      {
        v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSOSStatusErrorDomain,  v7,  0LL));
        *a4 = (id)objc_claimAutoreleasedReturnValue( +[NSError storeError:underlyingError:description:]( &OBJC_CLASS___NSError,  "storeError:underlyingError:description:",  9LL,  v24,  v21));
      }

      return 0LL;
    }
  }

  else
  {
    id v11 = (void *)result;
    if (result && (uint64_t v12 = objc_opt_class(&OBJC_CLASS___NSArray, v6), (objc_opt_isKindOfClass(v11, v12) & 1) == 0))
    {
      id v25 = sub_1001768B4(1);
      __int128 v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
        sub_100194580();
      }

      id v20 = 0LL;
      if (a4) {
        *a4 = (id)objc_claimAutoreleasedReturnValue( +[NSError storeError:description:]( &OBJC_CLASS___NSError,  "storeError:description:",  9LL,  @"Bad return type from SecItemCopyMatching"));
      }
    }

    else
    {
      id v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v11 count]));
      __int128 v27 = 0u;
      __int128 v28 = 0u;
      __int128 v29 = 0u;
      __int128 v30 = 0u;
      id v14 = v11;
      id v15 = [v14 countByEnumeratingWithState:&v27 objects:v32 count:16];
      if (v15)
      {
        id v16 = v15;
        uint64_t v17 = *(void *)v28;
        do
        {
          for (i = 0LL; i != v16; i = (char *)i + 1)
          {
            if (*(void *)v28 != v17) {
              objc_enumerationMutation(v14);
            }
            v19 = (void *)objc_claimAutoreleasedReturnValue( +[THPreferredThreadNetwork preferredNetworkFromKeychainDictionary:]( &OBJC_CLASS___THPreferredThreadNetwork,  "preferredNetworkFromKeychainDictionary:",  *(void *)(*((void *)&v27 + 1) + 8LL * (void)i),  (void)v27));
            if (v19) {
              [v13 addObject:v19];
            }
          }

          id v16 = [v14 countByEnumeratingWithState:&v27 objects:v32 count:16];
        }

        while (v16);
      }

      id v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v13));
    }

    return v20;
  }

- (id)_doFetchFrozenThreadNetworks:(id)a3 error:(id *)a4
{
  CFTypeRef result = 0LL;
  OSStatus v5 = SecItemCopyMatching((CFDictionaryRef)a3, &result);
  if (v5)
  {
    OSStatus v7 = v5;
    if (v5 == -25300)
    {
      id v8 = sub_1001768B4(1);
      id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        sub_10019465C();
      }

      return (id)objc_claimAutoreleasedReturnValue(+[NSSet set](&OBJC_CLASS___NSSet, "set"));
    }

    else
    {
      v21 = (__CFString *)SecCopyErrorMessageString(v5, 0LL);
      id v22 = sub_1001768B4(1);
      id v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
        sub_1001945F8();
      }

      if (a4)
      {
        v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSOSStatusErrorDomain,  v7,  0LL));
        *a4 = (id)objc_claimAutoreleasedReturnValue( +[NSError storeError:underlyingError:description:]( &OBJC_CLASS___NSError,  "storeError:underlyingError:description:",  30LL,  v24,  v21));
      }

      return 0LL;
    }
  }

  else
  {
    id v11 = (void *)result;
    if (result && (uint64_t v12 = objc_opt_class(&OBJC_CLASS___NSArray, v6), (objc_opt_isKindOfClass(v11, v12) & 1) == 0))
    {
      id v25 = sub_1001768B4(1);
      __int128 v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
        sub_1001946D0();
      }

      id v20 = 0LL;
      if (a4) {
        *a4 = (id)objc_claimAutoreleasedReturnValue( +[NSError storeError:description:]( &OBJC_CLASS___NSError,  "storeError:description:",  30LL,  @"Bad return type from SecItemCopyMatching"));
      }
    }

    else
    {
      id v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v11 count]));
      __int128 v27 = 0u;
      __int128 v28 = 0u;
      __int128 v29 = 0u;
      __int128 v30 = 0u;
      id v14 = v11;
      id v15 = [v14 countByEnumeratingWithState:&v27 objects:v32 count:16];
      if (v15)
      {
        id v16 = v15;
        uint64_t v17 = *(void *)v28;
        do
        {
          for (i = 0LL; i != v16; i = (char *)i + 1)
          {
            if (*(void *)v28 != v17) {
              objc_enumerationMutation(v14);
            }
            v19 = (void *)objc_claimAutoreleasedReturnValue( +[THFrozenThreadNetwork frozenThreadNetworkFromKeychainDictionary:]( &OBJC_CLASS___THFrozenThreadNetwork,  "frozenThreadNetworkFromKeychainDictionary:",  *(void *)(*((void *)&v27 + 1) + 8LL * (void)i),  (void)v27));
            if (v19) {
              [v13 addObject:v19];
            }
          }

          id v16 = [v14 countByEnumeratingWithState:&v27 objects:v32 count:16];
        }

        while (v16);
      }

      id v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v13));
    }

    return v20;
  }

- (void)retrieveThirdPartyInfo:(id)a3
{
  v11[0] = 0LL;
  v11[1] = v11;
  v11[2] = 0x3032000000LL;
  v11[3] = sub_100179464;
  void v11[4] = sub_100179474;
  id v12 = 0LL;
  v9[0] = 0LL;
  v9[1] = v9;
  v9[2] = 0x3032000000LL;
  v9[3] = sub_100179464;
  v9[4] = sub_100179474;
  id v10 = 0LL;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10017947C;
  v5[3] = &unk_1002B5098;
  OSStatus v7 = v11;
  id v8 = v9;
  id v4 = a3;
  v5[4] = self;
  id v6 = v4;
  -[THThreadNetworkCredentialsKeychainBackingStore retrieveAllActiveDataSetRecordsWithCompletion:]( self,  "retrieveAllActiveDataSetRecordsWithCompletion:",  v5);

  _Block_object_dispose(v9, 8);
  _Block_object_dispose(v11, 8);
}

- (void)retrieveAllActiveDataSetRecordsForNetwork:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
  id v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100179AE4;
  block[3] = &unk_1002B4F58;
  id v13 = v6;
  id v14 = self;
  id v15 = v7;
  id v10 = v7;
  id v11 = v6;
  dispatch_async(v9, block);
}

- (void)retrieveAllActiveDataSetRecordsWithCompletion:(id)a3
{
  id v4 = a3;
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_100179CF8;
  v8[3] = &unk_1002B4F80;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(v6, v8);
}

- (void)retrieveActiveDataSetRecordWithUniqueIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
  id v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100179EA0;
  block[3] = &unk_1002B4F58;
  id v13 = v6;
  id v14 = self;
  id v15 = v7;
  id v10 = v7;
  id v11 = v6;
  dispatch_async(v9, block);
}

- (void)retrieveActiveDataSetRecordWithExtendedPANId:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
  id v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10017A0A0;
  block[3] = &unk_1002B4F58;
  id v13 = v6;
  id v14 = self;
  id v15 = v7;
  id v10 = v7;
  id v11 = v6;
  dispatch_async(v9, block);
}

- (void)retrieveActiveDataSetRecordOnMdnsWithExtendedPANId:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
  id v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10017A2A0;
  block[3] = &unk_1002B4F58;
  id v13 = v6;
  id v14 = self;
  id v15 = v7;
  id v10 = v7;
  id v11 = v6;
  dispatch_async(v9, block);
}

- (void)retrieveActiveDataSetRecordForThreadBorderAgent:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
  id v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10017A584;
  block[3] = &unk_1002B4F58;
  id v13 = v6;
  id v14 = self;
  id v15 = v7;
  id v10 = v7;
  id v11 = v6;
  dispatch_async(v9, block);
}

- (void)retrieveActiveDataSetRecordWithTLVsForThreadBorderAgent:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
  id v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10017A794;
  block[3] = &unk_1002B4F58;
  id v13 = v6;
  id v14 = self;
  id v15 = v7;
  id v10 = v7;
  id v11 = v6;
  dispatch_async(v9, block);
}

- (id)getActiveRecords:(id)a3
{
  id v4 = a3;
  id v5 = sub_1001768B4(1);
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v82 = "-[THThreadNetworkCredentialsKeychainBackingStore getActiveRecords:]";
    __int16 v83 = 1024;
    *(_DWORD *)v84 = 808;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_INFO,  "%s:%d: Entered. Matching records with Mdns records",  buf,  0x12u);
  }

  id v7 = objc_alloc_init(&OBJC_CLASS___ThreadBRFinder);
  if (!v7)
  {
    id v62 = sub_1001768B4(1);
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v62);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_100194988();
    }
    goto LABEL_69;
  }

  id v8 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  if (!v8)
  {
    id v63 = sub_1001768B4(1);
    v64 = (os_log_s *)objc_claimAutoreleasedReturnValue(v63);
    if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR)) {
      sub_1001949FC();
    }

LABEL_69:
    v61 = 0LL;
    goto LABEL_70;
  }

  unint64_t v9 = -[THThreadNetworkCredentialsKeychainBackingStore getCountOfThreadBorderRoutersWithMdns:]( self,  "getCountOfThreadBorderRoutersWithMdns:",  v7);
  if (v9)
  {
    unint64_t v11 = v9;
    uint64_t v12 = 0LL;
    *(void *)&__int128 v10 = 136315394LL;
    __int128 v66 = v10;
    id v13 = &AWDPostMetric_ptr;
    id v72 = v4;
    v68 = self;
    v69 = v7;
    unint64_t v67 = v9;
    do
    {
      id v14 = (void *)objc_claimAutoreleasedReturnValue(-[ThreadBRFinder getBorderAgentForIndex:](v7, "getBorderAgentForIndex:", v12, v66));
      id v15 = v14;
      if (v14)
      {
        id v16 = (void *)objc_claimAutoreleasedReturnValue([v14 addresses]);

        if (v16)
        {
          uint64_t v17 = v13[132];
          BOOL v18 = (void *)objc_claimAutoreleasedReturnValue([v15 TXTRecordData]);
          v19 = (void *)objc_claimAutoreleasedReturnValue([v17 dictionaryFromTXTRecordData:v18]);

          if (!v19)
          {
            id v35 = sub_1001768B4(1);
            int v36 = (os_log_s *)objc_claimAutoreleasedReturnValue(v35);
            if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136315650;
              v82 = "-[THThreadNetworkCredentialsKeychainBackingStore getActiveRecords:]";
              __int16 v83 = 1024;
              *(_DWORD *)v84 = 842;
              *(_WORD *)&v84[4] = 2112;
              *(void *)&v84[6] = v15;
              _os_log_error_impl( (void *)&_mh_execute_header,  v36,  OS_LOG_TYPE_ERROR,  "%s : %d No text record data available for the server : %@, continue to next network",  buf,  0x1Cu);
            }

            goto LABEL_54;
          }

          v75 = v19;
          id v20 = (void *)objc_claimAutoreleasedReturnValue([v19 objectForKey:@"xa"]);
          id v21 = sub_1001768B4(1);
          id v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315650;
            v82 = "-[THThreadNetworkCredentialsKeychainBackingStore getActiveRecords:]";
            __int16 v83 = 1024;
            *(_DWORD *)v84 = 849;
            *(_WORD *)&v84[4] = 2112;
            *(void *)&v84[6] = v75;
            _os_log_error_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_ERROR,  "%s:%d BorderAgent MDNS Text Record Data : %@",  buf,  0x1Cu);
          }

          v73 = v15;
          if (v20)
          {
            if ([v20 length] != (id)16)
            {
              v40 = self;
              v41 = v20;
              id v42 = [v20 length];
              id v43 = sub_1001768B4(1);
              __int128 v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v43);
              BOOL v44 = os_log_type_enabled(v28, OS_LOG_TYPE_ERROR);
              if (v42 == (id)8)
              {
                id v20 = v41;
                if (v44)
                {
                  id v59 = [v41 length];
                  *(_DWORD *)buf = 136315650;
                  v82 = "-[THThreadNetworkCredentialsKeychainBackingStore getActiveRecords:]";
                  __int16 v83 = 1024;
                  *(_DWORD *)v84 = 861;
                  *(_WORD *)&v84[4] = 2048;
                  *(void *)&v84[6] = v59;
                  _os_log_error_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_ERROR,  "%s:%d BorderAgent ID is of NEW format (binary based) with length : %lu",  buf,  0x1Cu);
                }

                id v26 = v41;
                v74 = 0LL;
                self = v40;
                id v4 = v72;
LABEL_34:
                __int128 v78 = 0u;
                __int128 v79 = 0u;
                __int128 v76 = 0u;
                __int128 v77 = 0u;
                __int128 v28 = (os_log_s *)v4;
                id v45 = -[os_log_s countByEnumeratingWithState:objects:count:]( v28,  "countByEnumeratingWithState:objects:count:",  &v76,  v80,  16LL);
                if (v45)
                {
                  id v46 = v45;
                  v70 = v20;
                  uint64_t v71 = v12;
                  uint64_t v47 = *(void *)v77;
                  do
                  {
                    for (i = 0LL; i != v46; i = (char *)i + 1)
                    {
                      if (*(void *)v77 != v47) {
                        objc_enumerationMutation(v28);
                      }
                      v49 = *(void **)(*((void *)&v76 + 1) + 8LL * (void)i);
                      v50 = (void *)objc_claimAutoreleasedReturnValue([v49 borderAgent]);
                      v51 = (void *)objc_claimAutoreleasedReturnValue([v50 discriminatorId]);
                      unsigned int v52 = [v51 isEqualToData:v26];

                      if (v52)
                      {
                        id v53 = sub_1001768B4(1);
                        v54 = (os_log_s *)objc_claimAutoreleasedReturnValue(v53);
                        if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
                        {
                          v55 = (void *)objc_claimAutoreleasedReturnValue([v49 borderAgent]);
                          v56 = (void *)objc_claimAutoreleasedReturnValue([v55 discriminatorId]);
                          *(_DWORD *)buf = 136315906;
                          v82 = "-[THThreadNetworkCredentialsKeychainBackingStore getActiveRecords:]";
                          __int16 v83 = 1024;
                          *(_DWORD *)v84 = 892;
                          *(_WORD *)&v84[4] = 2112;
                          *(void *)&v84[6] = v56;
                          __int16 v85 = 2112;
                          id v86 = v26;
                          _os_log_error_impl( (void *)&_mh_execute_header,  v54,  OS_LOG_TYPE_ERROR,  "%s : %d: baID :%@ matches with mdns record :%@",  buf,  0x26u);
                        }

                        -[os_log_s addObject:](v8, "addObject:", v49);
                      }
                    }

                    id v46 = -[os_log_s countByEnumeratingWithState:objects:count:]( v28,  "countByEnumeratingWithState:objects:count:",  &v76,  v80,  16LL);
                  }

                  while (v46);
                  uint64_t v12 = v71;
                  id v4 = v72;
                  self = v68;
                  id v7 = v69;
                  unint64_t v11 = v67;
                  id v13 = &AWDPostMetric_ptr;
                  id v20 = v70;
                }

                else
                {
                  id v13 = &AWDPostMetric_ptr;
                }
              }

              else
              {
                if (v44)
                {
                  id v20 = v41;
                  id v60 = [v41 length];
                  *(_DWORD *)buf = 136315650;
                  v82 = "-[THThreadNetworkCredentialsKeychainBackingStore getActiveRecords:]";
                  __int16 v83 = 1024;
                  *(_DWORD *)v84 = 865;
                  *(_WORD *)&v84[4] = 2048;
                  *(void *)&v84[6] = v60;
                  _os_log_error_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_ERROR,  "%s:%d Continuing... BorderAgent ID length mismatch !!! border agent id length : %lu",  buf,  0x1Cu);
                  id v26 = 0LL;
                  v74 = 0LL;
                }

                else
                {
                  id v26 = 0LL;
                  v74 = 0LL;
                  id v20 = v41;
                }

                self = v40;
                id v4 = v72;
              }

              goto LABEL_53;
            }

            id v23 = sub_1001768B4(1);
            v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
            if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
            {
              id v58 = [v20 length];
              *(_DWORD *)buf = 136315650;
              v82 = "-[THThreadNetworkCredentialsKeychainBackingStore getActiveRecords:]";
              __int16 v83 = 1024;
              *(_DWORD *)v84 = 857;
              *(_WORD *)&v84[4] = 2048;
              *(void *)&v84[6] = v58;
              _os_log_error_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_ERROR,  "%s:%d BorderAgent IDis of OLD format (string based) with length : %lu",  buf,  0x1Cu);
            }

            id v25 = -[NSString initWithData:encoding:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithData:encoding:",  v20,  4LL);
            if (v25)
            {
              v74 = v25;
              id v26 = (id)objc_claimAutoreleasedReturnValue( -[THThreadNetworkCredentialsKeychainBackingStore dataFromHexString:]( self,  "dataFromHexString:"));
              id v27 = sub_1001768B4(1);
              __int128 v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
              BOOL v29 = os_log_type_enabled(v28, OS_LOG_TYPE_ERROR);
              if (v26)
              {
                if (v29)
                {
                  *(_DWORD *)buf = 136315906;
                  v82 = "-[THThreadNetworkCredentialsKeychainBackingStore getActiveRecords:]";
                  __int16 v83 = 1024;
                  *(_DWORD *)v84 = 884;
                  *(_WORD *)&v84[4] = 2112;
                  *(void *)&v84[6] = v74;
                  __int16 v85 = 2112;
                  id v86 = v26;
                  _os_log_error_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_ERROR,  "%s:%d: baid str : %@, foundbaid : %@",  buf,  0x26u);
                }

                goto LABEL_34;
              }

              if (v29)
              {
                *(_DWORD *)buf = 136315650;
                v82 = "-[THThreadNetworkCredentialsKeychainBackingStore getActiveRecords:]";
                __int16 v83 = 1024;
                *(_DWORD *)v84 = 880;
                *(_WORD *)&v84[4] = 2112;
                *(void *)&v84[6] = v73;
                _os_log_error_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_ERROR,  "%s : %d hex string conversion to nsdata failure for server : %@, continue to next network",  buf,  0x1Cu);
              }

              id v26 = 0LL;
LABEL_53:

              id v15 = v73;
              int v36 = (os_log_s *)v74;
              v19 = v75;
LABEL_54:

              goto LABEL_55;
            }

            id v57 = sub_1001768B4(1);
            __int128 v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v57);
            if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136315650;
              v82 = "-[THThreadNetworkCredentialsKeychainBackingStore getActiveRecords:]";
              __int16 v83 = 1024;
              *(_DWORD *)v84 = 873;
              *(_WORD *)&v84[4] = 2112;
              *(void *)&v84[6] = v15;
              v38 = v28;
              v39 = "%s : %d baid nsstring conversion failure, server : %@, continue to next network";
LABEL_51:
              _os_log_error_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_ERROR, v39, buf, 0x1Cu);
            }
          }

          else
          {
            id v37 = sub_1001768B4(1);
            __int128 v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v37);
            if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136315650;
              v82 = "-[THThreadNetworkCredentialsKeychainBackingStore getActiveRecords:]";
              __int16 v83 = 1024;
              *(_DWORD *)v84 = 852;
              *(_WORD *)&v84[4] = 2112;
              *(void *)&v84[6] = v15;
              v38 = v28;
              v39 = "%s : %d cannot parse dictionary data for server : %@, continue to next network";
              goto LABEL_51;
            }
          }

          id v26 = 0LL;
          v74 = 0LL;
          goto LABEL_53;
        }

        id v34 = sub_1001768B4(1);
        v19 = (void *)objc_claimAutoreleasedReturnValue(v34);
        if (os_log_type_enabled((os_log_t)v19, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = v66;
          v82 = "-[THThreadNetworkCredentialsKeychainBackingStore getActiveRecords:]";
          __int16 v83 = 2112;
          *(void *)v84 = v15;
          __int128 v31 = (os_log_s *)v19;
          v32 = "%s : No IP address is available for the server : %@, continue to next BR";
          uint32_t v33 = 22;
          goto LABEL_25;
        }
      }

      else
      {
        id v30 = sub_1001768B4(1);
        v19 = (void *)objc_claimAutoreleasedReturnValue(v30);
        if (os_log_type_enabled((os_log_t)v19, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = v66;
          v82 = "-[THThreadNetworkCredentialsKeychainBackingStore getActiveRecords:]";
          __int16 v83 = 1024;
          *(_DWORD *)v84 = 831;
          __int128 v31 = (os_log_s *)v19;
          v32 = "%s:%d: Failed to get the server";
          uint32_t v33 = 18;
LABEL_25:
          _os_log_error_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_ERROR, v32, buf, v33);
        }
      }

- (void)retrieveAllActiveDataSetRecordsWithFlagForClientKeychainAccessGroup:(id)a3 activeFlag:(BOOL)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
  unint64_t v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_10017B514;
  v14[3] = &unk_1002B50C0;
  BOOL v18 = a4;
  id v15 = v8;
  id v16 = self;
  id v17 = v9;
  id v12 = v9;
  id v13 = v8;
  dispatch_async(v11, v14);
}

- (void)retrieveAllActiveDataSetRecordsForClientKeychainAccessGroup:(id)a3 completion:(id)a4
{
}

- (void)retrieveAllActiveDataSetRecordsWithFlagForClientKeychainAccessGroup:(id)a3 activeFlag:(BOOL)a4 compleiton:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
  unint64_t v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_10017B82C;
  v14[3] = &unk_1002B50C0;
  BOOL v18 = a4;
  id v15 = v8;
  id v16 = self;
  id v17 = v9;
  id v12 = v9;
  id v13 = v8;
  dispatch_async(v11, v14);
}

- (void)retrieveAllActiveDataSetRecordsForClientKeychainAccessGroup:(id)a3 compleiton:(id)a4
{
}

- (void)deleteActiveDataSetRecordWithUniqueIdentifier:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
  id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_10017BB2C;
  v11[3] = &unk_1002B4F80;
  id v12 = v5;
  id v13 = v6;
  id v9 = v6;
  id v10 = v5;
  dispatch_async(v8, v11);
}

- (void)deleteActiveDataSetRecordForThreadBorderAgent:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
  id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_10017BDF0;
  v11[3] = &unk_1002B4F80;
  id v12 = v5;
  id v13 = v6;
  id v9 = v6;
  id v10 = v5;
  dispatch_async(v8, v11);
}

- (void)storeActiveDataSetRecordAndSync:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void, void *))a4;
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(global_queue);
  v24[0] = 0LL;
  v24[1] = v24;
  v24[2] = 0x2020000000LL;
  char v25 = 0;
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v6 keyChainItemRepresentationForActiveDataSetRecordAddOperation]);
  if (!v10)
  {
    id v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSError storeError:description:]( &OBJC_CLASS___NSError,  "storeError:description:",  4LL,  @"Bad network parameter"));
    v7[2](v7, 0LL, v14);

    id v12 = 0LL;
LABEL_6:
    unint64_t v11 = 0LL;
    goto LABEL_7;
  }

  id v23 = 0LL;
  unint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[CKKSControl controlObject:](&OBJC_CLASS___CKKSControl, "controlObject:", &v23));
  id v12 = v23;
  if (!v11)
  {
    id v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSError storeError:description:]( &OBJC_CLASS___NSError,  "storeError:description:",  5LL,  @"CKKS object allocation failed"));
    v7[2](v7, 0LL, v15);

    goto LABEL_6;
  }

  uint64_t v13 = kSecAttrViewHintHome;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_10017C238;
  v16[3] = &unk_1002B5110;
  id v21 = v24;
  v16[4] = self;
  id v17 = v6;
  id v18 = v9;
  id v20 = v7;
  id v19 = v10;
  __int16 v22 = 120;
  [v11 rpcKnownBadState:v13 reply:v16];

LABEL_7:
  _Block_object_dispose(v24, 8);
}

- (BOOL)isFrozenRecord:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc(&OBJC_CLASS___THFrozenThreadNetwork);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 credentialsDataSet]);
  id v7 = -[THFrozenThreadNetwork initWithCredentialsDataSet:creationDate:lastModificationDate:]( v5,  "initWithCredentialsDataSet:creationDate:lastModificationDate:",  v6,  0LL,  0LL);

  if (v7)
  {
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[THFrozenThreadNetwork keyChainQueryForFrozenThreadNetworkRecordOperationForCredentialsDataSet:]( &OBJC_CLASS___THFrozenThreadNetwork,  "keyChainQueryForFrozenThreadNetworkRecordOperationForCredentialsDataSet:",  v7));
    if (v8)
    {
      id v23 = 0LL;
      id v9 = (void *)objc_claimAutoreleasedReturnValue( -[THThreadNetworkCredentialsKeychainBackingStore _doFetchFrozenThreadNetworks:error:]( self,  "_doFetchFrozenThreadNetworks:error:",  v8,  &v23));
      id v10 = (os_log_s *)v23;
      id v11 = sub_1001768B4(1);
      id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        id v13 = [v9 count];
        *(_DWORD *)buf = 136315650;
        char v25 = "-[THThreadNetworkCredentialsKeychainBackingStore isFrozenRecord:]";
        __int16 v26 = 1024;
        int v27 = 1234;
        __int16 v28 = 2048;
        id v29 = v13;
        _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_INFO,  "%s : %d - Frozen network in Database = %lu",  buf,  0x1Cu);
      }

      -[THThreadNetworkCredentialsKeychainBackingStore dumpFrozenThreadNetworks:](self, "dumpFrozenThreadNetworks:", v9);
      if (v9 && [v9 count])
      {
        BOOL v14 = 1;
        id v15 = sub_1001768B4(1);
        id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          id v17 = (void *)objc_claimAutoreleasedReturnValue([v4 network]);
          id v18 = (void *)objc_claimAutoreleasedReturnValue([v17 networkName]);
          *(_DWORD *)buf = 136315650;
          char v25 = "-[THThreadNetworkCredentialsKeychainBackingStore isFrozenRecord:]";
          __int16 v26 = 1024;
          int v27 = 1244;
          __int16 v28 = 2112;
          id v29 = v18;
          _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_INFO,  "%s:%d: Record(name : %@) credentials are marked frozen network in the Database ",  buf,  0x1Cu);
        }
      }

      else
      {
        id v20 = sub_1001768B4(1);
        id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315394;
          char v25 = "-[THThreadNetworkCredentialsKeychainBackingStore isFrozenRecord:]";
          __int16 v26 = 1024;
          int v27 = 1240;
          _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "%s:%d: No frozen network found in Database ",  buf,  0x12u);
        }

        BOOL v14 = 0;
      }
    }

    else
    {
      BOOL v14 = 1;
      id v21 = sub_1001768B4(1);
      id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        sub_100194C2C();
      }
    }
  }

  else
  {
    BOOL v14 = 1;
    id v19 = sub_1001768B4(1);
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_100194BB8();
    }
  }

  return v14;
}

- (void)updatePreferredNetworkWithNewDatasetRecord:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
  id v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10017D354;
  block[3] = &unk_1002B5138;
  BOOL v14 = self;
  id v15 = v7;
  id v13 = v6;
  id v10 = v7;
  id v11 = v6;
  dispatch_async(v9, block);
}

- (void)validateAODInternally:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
  id v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10017DA44;
  block[3] = &unk_1002B4F58;
  id v13 = v6;
  BOOL v14 = self;
  id v15 = v7;
  id v10 = v7;
  id v11 = v6;
  dispatch_async(v9, block);
}

- (void)storeCachedAODasPreferredNetwork:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
  id v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10017DC94;
  block[3] = &unk_1002B4F58;
  id v13 = v6;
  BOOL v14 = self;
  id v15 = v7;
  id v10 = v7;
  id v11 = v6;
  dispatch_async(v9, block);
}

- (void)storeThreadCredentialActiveDataSetRecord:(id)a3 waitForSync:(BOOL)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
  id v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_10017DF3C;
  v14[3] = &unk_1002B5070;
  id v16 = self;
  id v17 = v9;
  id v15 = v8;
  BOOL v18 = a4;
  id v12 = v9;
  id v13 = v8;
  dispatch_async(v11, v14);
}

- (void)retrieveActiveDataSetRecordWithUniqueIdentifierWithKeychainAccessGroup:(id)a3 keychainAccessGroup:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
  id v12 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_10017EC58;
  v16[3] = &unk_1002B5188;
  id v17 = v8;
  id v18 = v9;
  id v19 = self;
  id v20 = v10;
  id v13 = v10;
  id v14 = v9;
  id v15 = v8;
  dispatch_async(v12, v16);
}

- (void)retrieveActiveDataSetRecordForThreadBorderAgentWithKeychainAccessGroup:(id)a3 keychainAccessGroup:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
  id v12 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_10017EE80;
  v16[3] = &unk_1002B5188;
  id v17 = v8;
  id v18 = v9;
  id v19 = self;
  id v20 = v10;
  id v13 = v10;
  id v14 = v9;
  id v15 = v8;
  dispatch_async(v12, v16);
}

- (void)deleteActiveDataSetRecordWithUniqueIdentifierWithKeychainAccessGroup:(id)a3 keychainAccessGroup:(id)a4 completion:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
  id v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10017F0AC;
  block[3] = &unk_1002B4F58;
  id v16 = v7;
  id v17 = v8;
  id v18 = v9;
  id v12 = v9;
  id v13 = v8;
  id v14 = v7;
  dispatch_async(v11, block);
}

- (void)deleteActiveDataSetRecordForThreadBorderAgentWithKeychainAccessGroup:(id)a3 keychainAccessGroup:(id)a4 completion:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
  id v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10017F394;
  block[3] = &unk_1002B4F58;
  id v16 = v7;
  id v17 = v8;
  id v18 = v9;
  id v12 = v9;
  id v13 = v8;
  id v14 = v7;
  dispatch_async(v11, block);
}

- (BOOL)checkWiFiStatus
{
  id v2 = [[NWPathEvaluator alloc] initWithEndpoint:0 parameters:0];
  if (v2)
  {
    v3 = v2;
    id v4 = (void *)objc_claimAutoreleasedReturnValue([v2 path]);
    unsigned __int8 v5 = [v4 usesInterfaceType:1];

    LOBYTE(v2) = v5;
  }

  return (char)v2;
}

- (BOOL)checkIfXpanIDMatchToMDNSScan:(id)a3
{
  id v3 = a3;
  id v4 = sub_1001768B4(1);
  unsigned __int8 v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[THThreadNetworkCredentialsKeychainBackingStore checkIfXpanIDMatchToMDNSScan:]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 1621;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "%s:%d: Entered. Checking if Network extendedPANID matches with Mdns",  buf,  0x12u);
  }

  *(void *)buf = 0LL;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000LL;
  int v27 = sub_100179464;
  __int16 v28 = sub_100179474;
  id v29 = objc_alloc_init(&OBJC_CLASS___ThreadBRFinder);
  id v6 = *(void **)(*(void *)&buf[8] + 40LL);
  if (!v6)
  {
    id v14 = sub_1001768B4(1);
    id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int16 v22 = 136315394;
      id v23 = "-[THThreadNetworkCredentialsKeychainBackingStore checkIfXpanIDMatchToMDNSScan:]";
      __int16 v24 = 1024;
      int v25 = 1626;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%s:%d: baFinder is nil..", v22, 0x12u);
    }

    goto LABEL_15;
  }

  if (([v6 dispatchStartScan:0 extendedPanIdToFind:v3 borderAgentIdToFind:0] & 1) == 0)
  {
    id v16 = sub_1001768B4(1);
    id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_10019503C();
    }
LABEL_15:

LABEL_16:
    BOOL v17 = 0;
    goto LABEL_17;
  }

  id v7 = sub_1001768B4(1);
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)__int16 v22 = 136315394;
    id v23 = "-[THThreadNetworkCredentialsKeychainBackingStore checkIfXpanIDMatchToMDNSScan:]";
    __int16 v24 = 1024;
    int v25 = 1635;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_INFO,  "%s:%d: Waiting for extendedPANID network record to match on Mdns meshcop",  v22,  0x12u);
  }

  dispatch_time_t v9 = dispatch_time(0LL, 10000000000LL);
  id v10 = (dispatch_semaphore_s *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)&buf[8] + 40) baFinderSemaphore]);
  uint64_t v11 = dispatch_semaphore_wait(v10, v9);

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10017F9E0;
  block[3] = &unk_1002B51B0;
  void block[4] = buf;
  dispatch_async(&_dispatch_main_q, block);
  if (v11)
  {
    id v12 = sub_1001768B4(1);
    id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_100194FC8();
    }

    [*(id *)(*(void *)&buf[8] + 40) clear];
    goto LABEL_16;
  }

  id v19 = sub_1001768B4(1);
  id v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)__int16 v22 = 136315394;
    id v23 = "-[THThreadNetworkCredentialsKeychainBackingStore checkIfXpanIDMatchToMDNSScan:]";
    __int16 v24 = 1024;
    int v25 = 1651;
    _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_INFO,  "%s:%d: extendedPANID network record matches on Mdns meshcop",  v22,  0x12u);
  }

  [*(id *)(*(void *)&buf[8] + 40) clear];
  BOOL v17 = 1;
LABEL_17:
  _Block_object_dispose(buf, 8);

  return v17;
}

- (BOOL)checkIfNetworkMatchToMDNSScan:(id)a3 borderAgentID:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = sub_1001768B4(1);
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[THThreadNetworkCredentialsKeychainBackingStore checkIfNetworkMatchToMDNSScan:borderAgentID:]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 1660;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "%s:%d: Entered. Checking if borderAgentID Network matches with Mdns",  buf,  0x12u);
  }

  *(void *)buf = 0LL;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000LL;
  uint32_t v33 = sub_100179464;
  id v34 = sub_100179474;
  id v35 = objc_alloc_init(&OBJC_CLASS___ThreadBRFinder);
  dispatch_time_t v9 = *(void **)(*(void *)&buf[8] + 40LL);
  if (!v9)
  {
    id v20 = sub_1001768B4(1);
    id v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int16 v28 = 136315394;
      id v29 = "-[THThreadNetworkCredentialsKeychainBackingStore checkIfNetworkMatchToMDNSScan:borderAgentID:]";
      __int16 v30 = 1024;
      int v31 = 1665;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "%s:%d: baFinder is nil..", v28, 0x12u);
    }

    goto LABEL_15;
  }

  id v10 = (void *)objc_claimAutoreleasedReturnValue([v5 networkName]);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v5 extendedPANID]);
  unsigned __int8 v12 = [v9 dispatchStartScan:v10 extendedPanIdToFind:v11 borderAgentIdToFind:v6];

  if ((v12 & 1) == 0)
  {
    id v22 = sub_1001768B4(1);
    id v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      sub_100195124();
    }
LABEL_15:

LABEL_16:
    BOOL v23 = 0;
    goto LABEL_17;
  }

  id v13 = sub_1001768B4(1);
  id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)__int16 v28 = 136315394;
    id v29 = "-[THThreadNetworkCredentialsKeychainBackingStore checkIfNetworkMatchToMDNSScan:borderAgentID:]";
    __int16 v30 = 1024;
    int v31 = 1674;
    _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_INFO,  "%s:%d: Waiting for borderAgentID network record to match on Mdns meshcop",  v28,  0x12u);
  }

  dispatch_time_t v15 = dispatch_time(0LL, 10000000000LL);
  id v16 = (dispatch_semaphore_s *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)&buf[8] + 40) baFinderSemaphore]);
  uint64_t v17 = dispatch_semaphore_wait(v16, v15);

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10017FDF4;
  block[3] = &unk_1002B51B0;
  void block[4] = buf;
  dispatch_async(&_dispatch_main_q, block);
  if (v17)
  {
    id v18 = sub_1001768B4(1);
    id v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      sub_1001950B0();
    }

    [*(id *)(*(void *)&buf[8] + 40) clear];
    goto LABEL_16;
  }

  id v25 = sub_1001768B4(1);
  __int16 v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
  if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)__int16 v28 = 136315394;
    id v29 = "-[THThreadNetworkCredentialsKeychainBackingStore checkIfNetworkMatchToMDNSScan:borderAgentID:]";
    __int16 v30 = 1024;
    int v31 = 1689;
    _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_INFO,  "%s:%d: borderAgentID network record matches on Mdns meshcop",  v28,  0x12u);
  }

  [*(id *)(*(void *)&buf[8] + 40) clear];
  BOOL v23 = 1;
LABEL_17:
  _Block_object_dispose(buf, 8);

  return v23;
}

- (void)validateRecordWithMdnsScan:(id)a3 borderAgentID:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
  unsigned __int8 v12 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_10017FEEC;
  v16[3] = &unk_1002B51D8;
  id v17 = v8;
  id v18 = self;
  id v19 = v9;
  id v20 = v10;
  id v13 = v9;
  id v14 = v10;
  id v15 = v8;
  dispatch_async(v12, v16);
}

- (void)checkIfRecordForPreferredNetworkIsPresentWithCompletion:(id)a3
{
  id v4 = a3;
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_10018016C;
  v8[3] = &unk_1002B4F80;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(v6, v8);
}

- (id)getRecordForPreferredNetwork:(BOOL)a3 anyDsFormat:(BOOL)a4
{
  return -[THThreadNetworkCredentialsKeychainBackingStore getRecordForPreferredNetwork:anyDsFormat:skipScan:]( self,  "getRecordForPreferredNetwork:anyDsFormat:skipScan:",  a3,  a4,  0LL);
}

- (id)getRecordForPreferredNetwork:(BOOL)a3 anyDsFormat:(BOOL)a4 skipScan:(BOOL)a5
{
  uint64_t v84 = 0LL;
  __int16 v85 = &v84;
  uint64_t v86 = 0x3032000000LL;
  v87 = sub_100179464;
  v88 = sub_100179474;
  id v89 = 0LL;
  uint64_t v78 = 0LL;
  __int128 v79 = (id *)&v78;
  uint64_t v80 = 0x3032000000LL;
  v81 = sub_100179464;
  v82 = sub_100179474;
  id v83 = 0LL;
  uint64_t v5 = objc_claimAutoreleasedReturnValue( -[THThreadNetworkCredentialsKeychainBackingStore getPreferredNetwork:skipScan:]( self,  "getPreferredNetwork:skipScan:",  a3,  a5));
  id v6 = (void *)v85[5];
  v85[5] = v5;

  id v7 = (void *)v85[5];
  if (!v7)
  {
    id v25 = sub_1001768B4(1);
    __int128 v66 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR)) {
      sub_100195198();
    }
    id v24 = 0LL;
LABEL_44:

    goto LABEL_45;
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 credentialsDataSetRecord]);
  if (!v8) {
    goto LABEL_12;
  }
  id v9 = (void *)objc_claimAutoreleasedReturnValue([(id)v85[5] credentialsDataSetRecord]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 credentialsDataSet]);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 dataSetArray]);
  if (!v11)
  {

    goto LABEL_12;
  }

  unsigned __int8 v12 = (void *)objc_claimAutoreleasedReturnValue([(id)v85[5] credentialsDataSetRecord]);
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 credentialsDataSet]);
  id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 dataSetArray]);
  BOOL v15 = [v14 length] == 0;

  if (v15)
  {
LABEL_12:
    id v26 = sub_1001768B4(1);
    int v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      __int16 v28 = (void *)objc_claimAutoreleasedReturnValue([(id)v85[5] network]);
      id v29 = (void *)objc_claimAutoreleasedReturnValue([v28 networkName]);
      __int16 v30 = (void *)objc_claimAutoreleasedReturnValue([(id)v85[5] network]);
      int v31 = (void *)objc_claimAutoreleasedReturnValue([v30 extendedPANID]);
      *(_DWORD *)buf = 136315906;
      v92 = "-[THThreadNetworkCredentialsKeychainBackingStore getRecordForPreferredNetwork:anyDsFormat:skipScan:]";
      __int16 v93 = 1024;
      int v94 = 1791;
      __int16 v95 = 2112;
      id v96 = v29;
      __int16 v97 = 2112;
      v98 = v31;
      _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_INFO,  "%s : %d - Request to fetch all active dataset records for preferred network (name=%@, xpanid=%@)",  buf,  0x26u);
    }

    v32 = (void *)objc_claimAutoreleasedReturnValue([(id)v85[5] network]);
    __int128 v66 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[THThreadNetworkCredentialsActiveDataSetRecord keyChainQueryForFetchActiveDataSetRecordsOperationForNetwork:]( &OBJC_CLASS___THThreadNetworkCredentialsActiveDataSetRecord,  "keyChainQueryForFetchActiveDataSetRecordsOperationForNetwork:",  v32));

    id v77 = 0LL;
    v64 = (void *)objc_claimAutoreleasedReturnValue( -[THThreadNetworkCredentialsKeychainBackingStore _doFetchActiveDataSetRecords:error:]( self,  "_doFetchActiveDataSetRecords:error:",  v66,  &v77));
    id v63 = v77;
    id v33 = sub_1001768B4(1);
    id v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
    if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
    {
      id v35 = [v64 count];
      *(_DWORD *)buf = 136315650;
      v92 = "-[THThreadNetworkCredentialsKeychainBackingStore getRecordForPreferredNetwork:anyDsFormat:skipScan:]";
      __int16 v93 = 1024;
      int v94 = 1797;
      __int16 v95 = 2048;
      id v96 = v35;
      _os_log_impl( (void *)&_mh_execute_header,  v34,  OS_LOG_TYPE_INFO,  "%s:%d: Active dataset records size is: %lu",  buf,  0x1Cu);
    }

    int v36 = (void *)objc_claimAutoreleasedReturnValue([v64 allObjects]);
    v65 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithArray:](&OBJC_CLASS___NSMutableArray, "arrayWithArray:", v36));

    if (v65)
    {
      [v65 sortUsingComparator:&stru_1002B5218];
      __int128 v75 = 0u;
      __int128 v76 = 0u;
      __int128 v73 = 0u;
      __int128 v74 = 0u;
      id obj = v65;
      id v37 = [obj countByEnumeratingWithState:&v73 objects:v90 count:16];
      if (v37)
      {
        uint64_t v70 = *(void *)v74;
        do
        {
          for (i = 0LL; i != v37; i = (char *)i + 1)
          {
            if (*(void *)v74 != v70) {
              objc_enumerationMutation(obj);
            }
            v39 = *(void **)(*((void *)&v73 + 1) + 8LL * (void)i);
            v40 = (void *)objc_claimAutoreleasedReturnValue([v39 borderAgent]);
            v41 = (void *)objc_claimAutoreleasedReturnValue([v40 discriminatorId]);
            if (v41)
            {
              id v42 = (void *)objc_claimAutoreleasedReturnValue([v39 credentialsDataSet]);
              id v43 = (void *)objc_claimAutoreleasedReturnValue([v42 dataSetArray]);
              int v44 = v43 == 0LL;
              if (v43 && !a4)
              {
                id v45 = (void *)objc_claimAutoreleasedReturnValue([v39 credentialsDataSet]);
                id v46 = (void *)objc_claimAutoreleasedReturnValue([v45 dataSetArray]);
                unsigned int v47 = -[THThreadNetworkCredentialsKeychainBackingStore areValidDataSetTLVs:]( self,  "areValidDataSetTLVs:",  v46);

                int v44 = v47 ^ 1;
              }

              if (!v44)
              {
                objc_storeStrong(v79 + 5, v39);
                goto LABEL_37;
              }
            }

            else
            {
            }

            id v48 = sub_1001768B4(1);
            v49 = (os_log_s *)objc_claimAutoreleasedReturnValue(v48);
            if (os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
            {
              v50 = (void *)objc_claimAutoreleasedReturnValue([v39 network]);
              v51 = (void *)objc_claimAutoreleasedReturnValue([v50 networkName]);
              *(_DWORD *)buf = 136315650;
              v92 = "-[THThreadNetworkCredentialsKeychainBackingStore getRecordForPreferredNetwork:anyDsFormat:skipScan:]";
              __int16 v93 = 1024;
              int v94 = 1827;
              __int16 v95 = 2112;
              id v96 = v51;
              _os_log_impl( (void *)&_mh_execute_header,  v49,  OS_LOG_TYPE_INFO,  "%s : %d : skipping older format credentials : name : %@",  buf,  0x1Cu);
            }
          }

          id v37 = [obj countByEnumeratingWithState:&v73 objects:v90 count:16];
        }

        while (v37);
      }

- (void)retrievePreferredNetworkOfAnyDSFormatWithCompletion:(id)a3
{
  id v4 = a3;
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_1001811BC;
  v8[3] = &unk_1002B4F80;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(v6, v8);
}

- (void)retrievePreferredNetworkWithCompletion:(id)a3
{
  id v4 = a3;
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_1001814A0;
  v8[3] = &unk_1002B4F80;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(v6, v8);
}

- (void)retrievePreferredNetworkInternallyWithCompletion:(id)a3
{
  id v4 = a3;
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_1001817A8;
  v8[3] = &unk_1002B4F80;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(v6, v8);
}

- (void)retrievePreferredNetworkWithNoScanWithCompletion:(id)a3
{
  id v4 = a3;
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_100181AB0;
  v8[3] = &unk_1002B4F80;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(v6, v8);
}

- (BOOL)storePreferredNetworkWithRecord:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[THThreadNetworkCredentialsKeychainBackingStore getNetworkSignature](self, "getNetworkSignature"));
  if (v5)
  {
    id v6 = objc_alloc(&OBJC_CLASS___THThreadNetwork);
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 network]);
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 networkName]);
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v4 network]);
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 extendedPANID]);
    uint64_t v11 = (os_log_s *)[v6 initWithName:v8 extendedPANID:v10];

    if (!v11)
    {
      id v25 = sub_1001768B4(1);
      id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        sub_1001954C4(v16, v26, v27);
      }
      BOOL v17 = 0;
      goto LABEL_18;
    }

    unsigned __int8 v12 = (void *)objc_claimAutoreleasedReturnValue([v4 borderAgent]);
    id v13 = (void *)objc_claimAutoreleasedReturnValue( -[THThreadNetworkCredentialsKeychainBackingStore getActiveDataSetRecord:]( self,  "getActiveDataSetRecord:",  v12));

    id v14 = objc_alloc(&OBJC_CLASS___THPreferredThreadNetwork);
    BOOL v15 = (void *)objc_claimAutoreleasedReturnValue([v4 keychainAccessGroup]);
    id v16 = -[THPreferredThreadNetwork initWithThreadNetwork:networkSignature:credentialsDataSetRecord:creationDate:lastModificationDate:userInfo:]( v14,  "initWithThreadNetwork:networkSignature:credentialsDataSetRecord:creationDate:lastModificationDate:userInfo:",  v11,  v5,  v13,  0LL,  0LL,  v15);

    BOOL v17 = v16 != 0LL;
    if (v16)
    {
      if (!-[THThreadNetworkCredentialsKeychainBackingStore storePreferred:](self, "storePreferred:", v16))
      {
        BOOL v17 = 0;
        goto LABEL_17;
      }

      id v18 = sub_1001768B4(1);
      id v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        sub_100195538(v19, v20, v21);
      }
    }

    else
    {
      id v28 = sub_1001768B4(1);
      id v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        sub_1001955AC(v19, v29, v30);
      }
    }

LABEL_17:
LABEL_18:

    goto LABEL_19;
  }

  id v22 = sub_1001768B4(1);
  uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
    sub_100195450(v11, v23, v24);
  }
  BOOL v17 = 0;
LABEL_19:

  return v17;
}

- (void)retrieveOrGeneratePreferredNetworkInternallyWithCompletion:(id)a3
{
  id v4 = a3;
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_100181FDC;
  v8[3] = &unk_1002B4F80;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(v6, v8);
}

- (void)addPreferredNetworkWithCompletionInternally:(id)a3 borderAgentID:(id)a4 ipV4NwSignature:(id)a5 ipv6NwSignature:(id)a6 wifiSSID:(id)a7 wifiPassword:(id)a8 completion:(id)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  id v21 = a9;
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
  uint64_t v23 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472LL;
  v31[2] = sub_100182634;
  v31[3] = &unk_1002B5268;
  id v32 = v17;
  id v33 = v18;
  id v34 = v19;
  id v35 = v20;
  id v36 = v16;
  id v37 = self;
  id v38 = v15;
  id v39 = v21;
  id v24 = v15;
  id v25 = v16;
  id v26 = v21;
  id v27 = v20;
  id v28 = v19;
  id v29 = v18;
  id v30 = v17;
  dispatch_async(v23, v31);
}

- (void)deletePreferredNetworkForNetworkSignatureInternallyWithCompletion:(id)a3 ipv6NwSignature:(id)a4 wifiSSID:(id)a5 completion:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
  id v14 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_100182EA0;
  v19[3] = &unk_1002B5188;
  id v20 = v9;
  id v21 = v10;
  id v22 = v11;
  id v23 = v12;
  id v15 = v12;
  id v16 = v11;
  id v17 = v10;
  id v18 = v9;
  dispatch_async(v14, v19);
}

- (void)deletePreferredNetworkWithCompletion:(id)a3
{
  id v4 = a3;
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_1001834D0;
  v8[3] = &unk_1002B5290;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(v6, v8);
}

- (void)deletePreferredNetworkEntryWithCompletion:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
  id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_100183BB4;
  v11[3] = &unk_1002B4F80;
  id v12 = v5;
  id v13 = v6;
  id v9 = v6;
  id v10 = v5;
  dispatch_async(v8, v11);
}

- (void)deletePreferredAndFrozenThreadNetworksWithCompletion:(id)a3
{
  id v4 = a3;
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_100183EF0;
  v8[3] = &unk_1002B5290;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(v6, v8);
}

- (void)updatePreferredNetworkInternallyWithCompletion:(id)a3
{
  id v4 = a3;
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_1001843E4;
  v8[3] = &unk_1002B5290;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(v6, v8);
}

- (id)getOneRecordForNetwork:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[THThreadNetworkCredentialsActiveDataSetRecord keyChainQueryFetchForOneActiveDataSetOperationForThreadNetwork:]( &OBJC_CLASS___THThreadNetworkCredentialsActiveDataSetRecord,  "keyChainQueryFetchForOneActiveDataSetOperationForThreadNetwork:",  a3));
  if (!v4)
  {
    id v5 = sub_1001768B4(1);
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_100196118();
    }
  }

  uint64_t v13 = 0LL;
  id v7 = (void *)objc_claimAutoreleasedReturnValue( -[THThreadNetworkCredentialsKeychainBackingStore _doFetchOneActiveDataSetRecords:error:]( self,  "_doFetchOneActiveDataSetRecords:error:",  v4,  &v13));
  id v8 = v7;
  if (v7)
  {
    id v9 = v7;
  }

  else
  {
    id v10 = sub_1001768B4(1);
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_1001960A4();
    }
  }

  return v8;
}

- (id)getNumberOfRecordsForKeychainAccessGroup:(id)a3 count:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[THThreadNetworkCredentialsActiveDataSetRecord keyChainQueryFetchForNumberOfActiveDataSetOperationForKeychainAccessGroup:count:]( &OBJC_CLASS___THThreadNetworkCredentialsActiveDataSetRecord,  "keyChainQueryFetchForNumberOfActiveDataSetOperationForKeychainAccessGroup:count:",  v6,  v4));
  if (!v7)
  {
    id v8 = sub_1001768B4(1);
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_10019618C();
    }
  }

  uint64_t v16 = 0LL;
  id v10 = (void *)objc_claimAutoreleasedReturnValue( -[THThreadNetworkCredentialsKeychainBackingStore _doFetchActiveDataSetRecords:error:]( self,  "_doFetchActiveDataSetRecords:error:",  v7,  &v16));
  id v11 = sub_1001768B4(1);
  id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    id v13 = [v10 count];
    *(_DWORD *)buf = 136315906;
    id v18 = "-[THThreadNetworkCredentialsKeychainBackingStore getNumberOfRecordsForKeychainAccessGroup:count:]";
    __int16 v19 = 1024;
    int v20 = 2427;
    __int16 v21 = 1024;
    int v22 = v4;
    __int16 v23 = 2048;
    id v24 = v13;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_INFO,  "%s:%d: Fetched Active dataset records for the count : %d, size of the recods is: %lu",  buf,  0x22u);
  }

  if (v10 && [v10 count]) {
    id v14 = v10;
  }
  else {
    id v14 = 0LL;
  }

  return v14;
}

- (BOOL)deleteAllRecordsForKeychainAccessGroup:(id)a3
{
  id v3 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue( +[THThreadNetworkCredentialsActiveDataSetRecord keyChainQueryForDeleteAllActiveDataSetOperationWithKeychainAccessGroup:]( &OBJC_CLASS___THThreadNetworkCredentialsActiveDataSetRecord,  "keyChainQueryForDeleteAllActiveDataSetOperationWithKeychainAccessGroup:",  a3));
  uint64_t v4 = v3;
  if (v3)
  {
    OSStatus v5 = SecItemDelete(v3);
    id v6 = sub_1001768B4(1);
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      int v13 = 136315650;
      id v14 = "-[THThreadNetworkCredentialsKeychainBackingStore deleteAllRecordsForKeychainAccessGroup:]";
      __int16 v15 = 1024;
      int v16 = 2446;
      __int16 v17 = 1024;
      OSStatus v18 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "%s:%d: Deleting all records for com.apple.thread.dataset, Deletion result :(err=%d)",  (uint8_t *)&v13,  0x18u);
    }

    if (!v5)
    {
      BOOL v11 = 1;
      goto LABEL_11;
    }

    id v8 = sub_1001768B4(1);
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_100196290();
    }
  }

  else
  {
    id v10 = sub_1001768B4(1);
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_10019621C();
    }
  }

  BOOL v11 = 0;
LABEL_11:

  return v11;
}

- (BOOL)checkIfActiveDatasetRecordIsPresentInTheGivenList:(id)a3 Missinglist:(id)a4 record:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  __int128 v37 = 0u;
  __int128 v38 = 0u;
  __int128 v39 = 0u;
  __int128 v40 = 0u;
  id obj = v8;
  id v11 = [obj countByEnumeratingWithState:&v37 objects:v41 count:16];
  if (v11)
  {
    id v12 = v11;
    id v30 = self;
    int v31 = v9;
    uint64_t v13 = *(void *)v38;
    uint64_t v33 = *(void *)v38;
    while (2)
    {
      id v14 = 0LL;
      id v34 = v12;
      do
      {
        if (*(void *)v38 != v13) {
          objc_enumerationMutation(obj);
        }
        __int16 v15 = *(void **)(*((void *)&v37 + 1) + 8LL * (void)v14);
        int v16 = (void *)objc_claimAutoreleasedReturnValue([v15 borderAgent]);
        __int16 v17 = (void *)objc_claimAutoreleasedReturnValue([v16 discriminatorId]);
        OSStatus v18 = (void *)objc_claimAutoreleasedReturnValue([v10 borderAgent]);
        __int16 v19 = (void *)objc_claimAutoreleasedReturnValue([v18 discriminatorId]);
        if ([v17 isEqualToData:v19])
        {
          id v32 = v15;
          int v20 = (void *)objc_claimAutoreleasedReturnValue([v15 credentialsDataSet]);
          __int16 v21 = (void *)objc_claimAutoreleasedReturnValue([v20 dataSetArray]);
          int v22 = (void *)objc_claimAutoreleasedReturnValue([v10 credentialsDataSet]);
          id v23 = v10;
          id v24 = (void *)objc_claimAutoreleasedReturnValue([v22 dataSetArray]);
          unsigned int v36 = [v21 isEqualToData:v24];

          id v10 = v23;
          id v12 = v34;

          uint64_t v13 = v33;
          if (v36)
          {
            id v26 = sub_1001768B4(1);
            id v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
            if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
              sub_100196304(v10, v32, v27);
            }

            -[THThreadNetworkCredentialsKeychainBackingStore thDumpActiveDatasetRecord:]( v30,  "thDumpActiveDatasetRecord:",  v10);
            -[THThreadNetworkCredentialsKeychainBackingStore thDumpActiveDatasetRecord:]( v30,  "thDumpActiveDatasetRecord:",  v32);
            id v9 = v31;
            [v31 removeObject:v32];
            BOOL v25 = 1;
            goto LABEL_17;
          }
        }

        else
        {
        }

        id v14 = (char *)v14 + 1;
      }

      while (v12 != v14);
      id v12 = [obj countByEnumeratingWithState:&v37 objects:v41 count:16];
      if (v12) {
        continue;
      }
      break;
    }

    BOOL v25 = 0;
    id v9 = v31;
  }

  else
  {
    BOOL v25 = 0;
  }

- (void)thDumpActiveDatasetRecord:(id)a3
{
  id v3 = a3;
  id v4 = sub_1001768B4(1);
  OSStatus v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    sub_100196CE4();
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue([v3 uniqueIdentifier]);
  if (v6)
  {
    id v7 = sub_1001768B4(1);
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_100196C48(v3, v8);
    }
  }

  id v9 = sub_1001768B4(1);
  id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
    sub_100196BB4(v3, v10);
  }

  id v11 = sub_1001768B4(1);
  id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
    sub_100196B20(v3, v12);
  }

  id v13 = sub_1001768B4(1);
  id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
    sub_100196A8C(v3, v14);
  }

  __int16 v15 = (void *)objc_claimAutoreleasedReturnValue([v3 credentials]);
  int v16 = (void *)objc_claimAutoreleasedReturnValue([v15 PANID]);

  if (v16)
  {
    id v17 = sub_1001768B4(1);
    OSStatus v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      sub_1001969F8(v3, v18);
    }
  }

  __int16 v19 = (void *)objc_claimAutoreleasedReturnValue([v3 credentials]);
  int v20 = (void *)objc_claimAutoreleasedReturnValue([v19 masterKey]);

  if (v20)
  {
    id v21 = sub_1001768B4(1);
    int v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      sub_100196964(v3, v22);
    }
  }

  id v23 = (void *)objc_claimAutoreleasedReturnValue([v3 credentials]);
  id v24 = (void *)objc_claimAutoreleasedReturnValue([v23 PSKc]);

  if (v24)
  {
    id v25 = sub_1001768B4(1);
    id v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
      sub_1001968D0(v3, v26);
    }
  }

  id v27 = (void *)objc_claimAutoreleasedReturnValue([v3 credentials]);
  id v28 = (void *)objc_claimAutoreleasedReturnValue([v27 passPhrase]);

  if (v28)
  {
    id v29 = sub_1001768B4(1);
    id v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
      sub_10019683C(v3, v30);
    }
  }

  int v31 = (void *)objc_claimAutoreleasedReturnValue([v3 credentials]);
  unsigned int v32 = [v31 channel];
  int v33 = kTHNetworkChannel_None;

  if (v32 != v33)
  {
    id v34 = sub_1001768B4(1);
    id v35 = (os_log_s *)objc_claimAutoreleasedReturnValue(v34);
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
      sub_1001967B8(v3);
    }
  }

  id v36 = sub_1001768B4(1);
  __int128 v37 = (os_log_s *)objc_claimAutoreleasedReturnValue(v36);
  if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
    sub_100196724(v3, v37);
  }

  __int128 v38 = (void *)objc_claimAutoreleasedReturnValue([v3 credentials]);
  __int128 v39 = (void *)objc_claimAutoreleasedReturnValue([v38 userInfo]);

  if (v39)
  {
    id v40 = sub_1001768B4(1);
    v41 = (os_log_s *)objc_claimAutoreleasedReturnValue(v40);
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR)) {
      sub_100196690(v3, v41);
    }
  }

  id v42 = (void *)objc_claimAutoreleasedReturnValue([v3 keychainAccessGroup]);

  if (v42)
  {
    id v43 = sub_1001768B4(1);
    int v44 = (os_log_s *)objc_claimAutoreleasedReturnValue(v43);
    if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR)) {
      sub_10019660C(v3, v44);
    }
  }

  id v45 = (void *)objc_claimAutoreleasedReturnValue([v3 creationDate]);

  if (v45)
  {
    id v46 = sub_1001768B4(1);
    unsigned int v47 = (os_log_s *)objc_claimAutoreleasedReturnValue(v46);
    if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR)) {
      sub_100196588(v3, v47);
    }
  }

  id v48 = (void *)objc_claimAutoreleasedReturnValue([v3 lastModificationDate]);

  if (v48)
  {
    id v49 = sub_1001768B4(1);
    v50 = (os_log_s *)objc_claimAutoreleasedReturnValue(v49);
    if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR)) {
      sub_100196504(v3, v50);
    }
  }

  id v51 = sub_1001768B4(1);
  id v52 = (os_log_s *)objc_claimAutoreleasedReturnValue(v51);
  if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR)) {
    sub_1001964D8();
  }
}

- (id)getTheKeyFromPreferredNetworkEntry:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 networkSignature]);
  uint64_t v5 = objc_claimAutoreleasedReturnValue([v4 wifiPassword]);
  if (!v5)
  {

    goto LABEL_6;
  }

  id v6 = (void *)v5;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v3 networkSignature]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 wifiPassword]);
  id v9 = [v8 length];

  if (!v9)
  {
LABEL_6:
    id v14 = (void *)objc_claimAutoreleasedReturnValue([v3 network]);
    int v16 = (void *)objc_claimAutoreleasedReturnValue([v14 networkName]);
    id v17 = (void *)objc_claimAutoreleasedReturnValue([v3 network]);
    OSStatus v18 = (void *)objc_claimAutoreleasedReturnValue([v17 extendedPANID]);
    __int16 v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@%@", v16, v18));

    goto LABEL_9;
  }

  id v10 = (void *)objc_claimAutoreleasedReturnValue([v3 networkSignature]);
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 wifiPassword]);
  unsigned __int8 v12 = [v11 isEqualToString:@"ApplePreferredNetworkRecordLabel"];

  id v13 = (void *)objc_claimAutoreleasedReturnValue([v3 networkSignature]);
  id v14 = v13;
  if ((v12 & 1) != 0) {
    uint64_t v15 = objc_claimAutoreleasedReturnValue([v13 wifiSSID]);
  }
  else {
    uint64_t v15 = objc_claimAutoreleasedReturnValue([v13 wifiPassword]);
  }
  __int16 v19 = (void *)v15;
LABEL_9:

  return v19;
}

- (id)checkIfPrefItemPresentInTheCleanupList:(id)a3 cleanupList:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = v6;
  if (!v5)
  {
    id v30 = 0LL;
    goto LABEL_30;
  }

  __int128 v56 = 0u;
  __int128 v57 = 0u;
  __int128 v54 = 0u;
  __int128 v55 = 0u;
  id obj = v6;
  id v8 = [obj countByEnumeratingWithState:&v54 objects:v58 count:16];
  if (!v8)
  {
    id v30 = 0LL;
    goto LABEL_29;
  }

  id v9 = v8;
  unsigned int v32 = v7;
  uint64_t v10 = *(void *)v55;
  id v53 = v5;
  uint64_t v50 = *(void *)v55;
  while (2)
  {
    id v11 = 0LL;
    id v51 = v9;
    do
    {
      if (*(void *)v55 != v10) {
        objc_enumerationMutation(obj);
      }
      unsigned __int8 v12 = *(void **)(*((void *)&v54 + 1) + 8LL * (void)v11);
      if (v12)
      {
        id v13 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v54 + 1) + 8 * (void)v11) network]);
        id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 networkName]);
        uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v5 network]);
        int v16 = (void *)objc_claimAutoreleasedReturnValue([v15 networkName]);
        id v17 = (void *)objc_claimAutoreleasedReturnValue([v12 network]);
        OSStatus v18 = (void *)objc_claimAutoreleasedReturnValue([v17 extendedPANID]);
        __int16 v19 = (void *)objc_claimAutoreleasedReturnValue([v5 network]);
        int v20 = (void *)objc_claimAutoreleasedReturnValue([v19 extendedPANID]);
        if (![v18 isEqualToData:v20])
        {

          id v5 = v53;
          uint64_t v10 = v50;
          id v9 = v51;
LABEL_15:

          goto LABEL_22;
        }

        unsigned int v47 = v13;
        int v44 = v20;
        id v21 = v17;
        id v49 = (void *)objc_claimAutoreleasedReturnValue([v12 networkSignature]);
        int v22 = (void *)objc_claimAutoreleasedReturnValue([v49 ipv4NwSignature]);
        id v46 = (void *)objc_claimAutoreleasedReturnValue([v53 networkSignature]);
        id v48 = v22;
        id v45 = (void *)objc_claimAutoreleasedReturnValue([v46 ipv4NwSignature]);
        if (objc_msgSend(v22, "isEqualToData:"))
        {
          id v40 = (void *)objc_claimAutoreleasedReturnValue([v12 networkSignature]);
          id v23 = (void *)objc_claimAutoreleasedReturnValue([v40 ipv6NwSignature]);
          v41 = (void *)objc_claimAutoreleasedReturnValue([v53 networkSignature]);
          id v24 = (void *)objc_claimAutoreleasedReturnValue([v41 ipv6NwSignature]);
          id v42 = v23;
          if ([v23 isEqualToData:v24])
          {
            __int128 v39 = (void *)objc_claimAutoreleasedReturnValue([v12 networkSignature]);
            id v25 = (void *)objc_claimAutoreleasedReturnValue([v39 wifiSSID]);
            __int128 v37 = (void *)objc_claimAutoreleasedReturnValue([v53 networkSignature]);
            __int128 v38 = v25;
            id v36 = (void *)objc_claimAutoreleasedReturnValue([v37 wifiSSID]);
            if (objc_msgSend(v25, "isEqualToString:"))
            {
              id v35 = (void *)objc_claimAutoreleasedReturnValue([v12 networkSignature]);
              int v33 = (void *)objc_claimAutoreleasedReturnValue([v35 wifiPassword]);
              id v34 = (void *)objc_claimAutoreleasedReturnValue([v53 networkSignature]);
              id v26 = (void *)objc_claimAutoreleasedReturnValue([v34 wifiPassword]);
              unsigned __int8 v43 = objc_msgSend(v33, "isEqualToString:");
            }

            else
            {
              unsigned __int8 v43 = 0;
            }

            id v29 = v40;
          }

          else
          {
            unsigned __int8 v43 = 0;
            id v29 = v40;
          }

          id v28 = v47;
          id v27 = v44;
        }

        else
        {
          unsigned __int8 v43 = 0;
          id v27 = v44;
          id v28 = v47;
        }

        id v5 = v53;
        uint64_t v10 = v50;
        id v9 = v51;
        if ((v43 & 1) != 0)
        {
          id v30 = v12;
          goto LABEL_27;
        }
      }

- (void)sendCAMetricsForCleanUpRecordInfo:(cleanUpStats *)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  a3->var0));
  [v4 setObject:v5 forKey:@"number_of_first_party_BR_records_count"];

  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  a3->var2));
  [v4 setObject:v6 forKey:@"number_of_first_party_BR_records_updated_count"];

  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  a3->var1));
  [v4 setObject:v7 forKey:@"number_of_first_party_BR_records_cleaned_up_count"];

  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  a3->var3));
  [v4 setObject:v8 forKey:@"number_of_pref_nw_records_count"];

  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  a3->var5));
  [v4 setObject:v9 forKey:@"number_of_pref_nw_records_updated_count"];

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  a3->var4));
  [v4 setObject:v10 forKey:@"number_of_pref_nw_records_cleaned_up_count"];

  id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  a3->var6));
  [v4 setObject:v11 forKey:@"number_of_third_party_BR_records_count"];

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_1001856EC;
  v13[3] = &unk_1002B52B8;
  id v14 = v4;
  id v12 = v4;
  AnalyticsSendEventLazy(@"com.apple.Flagstone.flagstoneThreadNetworkCredentialsCleanUpRecords", v13);
}

- (void)cleanThreadKeychainDatabase:(id)a3
{
  id v4 = a3;
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_100185790;
  v8[3] = &unk_1002B5290;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(v6, v8);
}

- (BOOL)updateRecord:(id)a3
{
  id v3 = a3;
  id v4 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue([v3 keyChainItemRepresentationForActiveDataSetRecordAddOperation]);
  id v5 = v4;
  if (v4)
  {
    OSStatus v6 = SecItemAdd(v4, 0LL);
    if (v6 == -25299)
    {
      id v7 = sub_1001768B4(1);
      id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        int v13 = 136315138;
        id v14 = "-[THThreadNetworkCredentialsKeychainBackingStore updateRecord:]";
        _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "%s: Credential exists. Will update instead.",  (uint8_t *)&v13,  0xCu);
      }

      id v9 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue([v3 keyChainQueryForActiveDataSetRecordUpdateOperation]);
      uint64_t v10 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue( [v3 keyChainItemRepresentationForActiveDataSetRecordUpdateOperation]);
      OSStatus v6 = SecItemUpdate(v9, v10);
    }

    BOOL v11 = v6 == 0;
  }

  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

- (BOOL)isPreferred:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 network]);
  OSStatus v6 = (void *)objc_claimAutoreleasedReturnValue( +[THPreferredThreadNetwork keyChainQueryForPreferredNetworkRecordsOperationForNetwork:]( &OBJC_CLASS___THPreferredThreadNetwork,  "keyChainQueryForPreferredNetworkRecordsOperationForNetwork:",  v5));

  if (v6)
  {
    id v37 = 0LL;
    id v7 = (void *)objc_claimAutoreleasedReturnValue( -[THThreadNetworkCredentialsKeychainBackingStore _doFetchPreferredNetworks:error:]( self,  "_doFetchPreferredNetworks:error:",  v6,  &v37));
    id v8 = (os_log_s *)v37;
    id v9 = sub_1001768B4(1);
    uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      BOOL v11 = (void *)objc_claimAutoreleasedReturnValue([v4 network]);
      id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 networkName]);
      *(_DWORD *)buf = 136315650;
      id v40 = "-[THThreadNetworkCredentialsKeychainBackingStore isPreferred:]";
      __int16 v41 = 1024;
      int v42 = 3082;
      __int16 v43 = 2112;
      int v44 = v12;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_INFO,  "%s : %d - Preferred Networks in Database for Network  = %@",  buf,  0x1Cu);
    }

    if (v7 && [v7 count])
    {
      int v13 = (void *)objc_claimAutoreleasedReturnValue([v4 network]);
      id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[THThreadNetworkCredentialsActiveDataSetRecord keyChainQueryForFetchActiveDataSetRecordsOperationForNetwork:]( &OBJC_CLASS___THThreadNetworkCredentialsActiveDataSetRecord,  "keyChainQueryForFetchActiveDataSetRecordsOperationForNetwork:",  v13));

      id v36 = 0LL;
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue( -[THThreadNetworkCredentialsKeychainBackingStore _doFetchActiveDataSetRecords:error:]( self,  "_doFetchActiveDataSetRecords:error:",  v14,  &v36));
      id v16 = v36;
      __int128 v32 = 0u;
      __int128 v33 = 0u;
      __int128 v34 = 0u;
      __int128 v35 = 0u;
      id v17 = v15;
      id v18 = [v17 countByEnumeratingWithState:&v32 objects:v38 count:16];
      if (v18)
      {
        id v19 = v18;
        id v29 = v16;
        id v30 = v7;
        int v31 = v8;
        uint64_t v20 = 0LL;
        uint64_t v21 = *(void *)v33;
        while (2)
        {
          for (i = 0LL; i != v19; i = (char *)i + 1)
          {
            if (*(void *)v33 != v21) {
              objc_enumerationMutation(v17);
            }
            id v23 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v32 + 1) + 8 * (void)i) borderAgent]);
            id v24 = (void *)objc_claimAutoreleasedReturnValue([v23 discriminatorId]);

            if (v24)
            {
              if (v20)
              {
                BOOL v25 = 0;
                goto LABEL_23;
              }

              uint64_t v20 = 1LL;
            }
          }

          id v19 = [v17 countByEnumeratingWithState:&v32 objects:v38 count:16];
          if (v19) {
            continue;
          }
          break;
        }

        BOOL v25 = 1;
LABEL_23:
        id v7 = v30;
        id v8 = v31;
        id v16 = v29;
      }

      else
      {
        BOOL v25 = 1;
      }
    }

    else
    {
      id v26 = sub_1001768B4(1);
      id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        sub_10019736C(v4);
      }
      BOOL v25 = 0;
    }
  }

  else
  {
    BOOL v25 = 1;
    id v27 = sub_1001768B4(1);
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_1001972F8();
    }
  }

  return v25;
}

- (BOOL)fetchRecord:(id)a3
{
  id v19 = 0LL;
  id v4 = (void *)objc_claimAutoreleasedReturnValue( -[THThreadNetworkCredentialsKeychainBackingStore _doFetchActiveDataSetRecords:error:]( self,  "_doFetchActiveDataSetRecords:error:",  a3,  &v19));
  id v5 = v19;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v15 objects:v20 count:16];
  if (v7)
  {
    id v8 = v7;
    int v9 = 0;
    uint64_t v10 = *(void *)v16;
    do
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v6);
        }
        id v12 = *(void **)(*((void *)&v15 + 1) + 8LL * (void)i);
        if (-[THThreadNetworkCredentialsKeychainBackingStore isPreferred:](self, "isPreferred:", v12, (void)v15))
        {
          int v13 = (void *)objc_claimAutoreleasedReturnValue([v12 credentials]);
          [v13 setIsActiveDevice:0];

          v9 |= -[THThreadNetworkCredentialsKeychainBackingStore updateRecord:](self, "updateRecord:", v12);
        }
      }

      id v8 = [v6 countByEnumeratingWithState:&v15 objects:v20 count:16];
    }

    while (v8);
  }

  else
  {
    LOBYTE(v9) = 0;
  }

  return v9 & 1;
}

- (BOOL)skipDeleteWithBorderAgent:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[THThreadNetworkCredentialsActiveDataSetRecord keyChainQueryForFetchActiveDataSetRecordOperationForBorderAgent:]( &OBJC_CLASS___THThreadNetworkCredentialsActiveDataSetRecord,  "keyChainQueryForFetchActiveDataSetRecordOperationForBorderAgent:",  a3));
  LOBYTE(self) = -[THThreadNetworkCredentialsKeychainBackingStore fetchRecord:](self, "fetchRecord:", v4);

  return (char)self;
}

- (BOOL)skipDeleteWithUUID:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[THThreadNetworkCredentialsActiveDataSetRecord keyChainQueryForFetchOneActiveDataSetRecordOperationForUniqueIdentifier:]( &OBJC_CLASS___THThreadNetworkCredentialsActiveDataSetRecord,  "keyChainQueryForFetchOneActiveDataSetRecordOperationForUniqueIdentifier:",  a3));
  LOBYTE(self) = -[THThreadNetworkCredentialsKeychainBackingStore fetchRecord:](self, "fetchRecord:", v4);

  return (char)self;
}

- (unint64_t)getCountOfThreadBorderRoutersWithMdns:(id)a3
{
  id v3 = (ThreadBRFinder *)a3;
  if (!v3) {
    id v3 = -[ThreadBRFinder init](objc_opt_new(&OBJC_CLASS___ThreadBRFinder), "init");
  }
  uint64_t v21 = 0LL;
  int v22 = &v21;
  uint64_t v23 = 0x3032000000LL;
  id v24 = sub_100179464;
  BOOL v25 = sub_100179474;
  id v4 = v3;
  id v26 = v4;
  dispatch_semaphore_t v5 = dispatch_semaphore_create(0LL);
  id v6 = (void *)v22[5];
  __int128 v15 = _NSConcreteStackBlock;
  uint64_t v16 = 3221225472LL;
  __int128 v17 = sub_100189040;
  __int128 v18 = &unk_1002B52E0;
  uint64_t v20 = &v21;
  id v7 = v5;
  id v19 = v7;
  id v8 = &_dispatch_main_q;
  [v6 startScan:&v15 queue:&_dispatch_main_q timeInSec:5];

  id v9 = sub_1001768B4(1);
  uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
    sub_100197484();
  }

  dispatch_semaphore_wait(v7, 0xFFFFFFFFFFFFFFFFLL);
  id v11 = objc_msgSend((id)v22[5], "findNWs", v15, v16, v17, v18);
  id v12 = sub_1001768B4(1);
  int v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
    sub_10019740C();
  }

  _Block_object_dispose(&v21, 8);
  return (unint64_t)v11;
}

- (id)dataFromHexString:(id)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue([a3 lowercaseString]);
  id v4 = objc_opt_new(&OBJC_CLASS___NSMutableData);
  __str[2] = 0;
  int v5 = [v3 length];
  if (v5 >= 2)
  {
    int v6 = 0;
    int v7 = v5 - 1;
    do
    {
      int v8 = v6 + 1;
      unsigned __int8 v9 = [v3 characterAtIndex:v6];
      if ((char)v9 >= 48 && v9 <= 0x66u && v9 - 58 >= 0x27)
      {
        __str[0] = v9;
        __str[1] = [v3 characterAtIndex:v8];
        char v12 = strtol(__str, 0LL, 16);
        -[NSMutableData appendBytes:length:](v4, "appendBytes:length:", &v12, 1LL);
        int v8 = v6 + 2;
      }

      int v6 = v8;
    }

    while (v8 < v7);
  }

  return v4;
}

- (BOOL)isMatchingMdnsRecords:(id)a3 preferredNw:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  int v7 = v6;
  if (!v5 || !v6)
  {
    id v16 = sub_1001768B4(1);
    int v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      int v18 = 136315906;
      id v19 = "-[THThreadNetworkCredentialsKeychainBackingStore isMatchingMdnsRecords:preferredNw:]";
      __int16 v20 = 1024;
      int v21 = 3185;
      __int16 v22 = 2112;
      id v23 = v5;
      __int16 v24 = 2112;
      BOOL v25 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_INFO,  "%s:%d Nil parameter, mdnsNW : %@, preferredNw : %@ ",  (uint8_t *)&v18,  0x26u);
    }

    goto LABEL_11;
  }

  int v8 = (os_log_s *)objc_claimAutoreleasedReturnValue([v5 networkName]);
  unsigned __int8 v9 = (void *)objc_claimAutoreleasedReturnValue([v7 networkName]);
  if ((-[os_log_s isEqualToString:](v8, "isEqualToString:", v9) & 1) == 0)
  {

LABEL_11:
    goto LABEL_12;
  }

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v5 extendedPANID]);
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v7 extendedPANID]);
  unsigned int v12 = [v10 isEqualToData:v11];

  if (!v12)
  {
LABEL_12:
    BOOL v15 = 0;
    goto LABEL_13;
  }

  id v13 = sub_1001768B4(1);
  id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
    sub_1001974F8(v7, v5, v14);
  }

  BOOL v15 = 1;
LABEL_13:

  return v15;
}

- (BOOL)isMatchingNetworkSignature:(id)a3 preferredNwSignature:(id)a4
{
  uint64_t v5 = 0LL;
  return -[THThreadNetworkCredentialsKeychainBackingStore isMatchingNetworkSignature:preferredNwSignature:preferred:signaturePrefEntries:updatedPreferred:]( self,  "isMatchingNetworkSignature:preferredNwSignature:preferred:signaturePrefEntries:updatedPreferred:",  a3,  a4,  0LL,  0LL,  &v5);
}

- (BOOL)isMatchingNetworkSignature:(id)a3 preferredNwSignature:(id)a4 preferred:(id)a5 signaturePrefEntries:(id)a6 updatedPreferred:(id *)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v79 = a6;
  if (v79)
  {
    id v14 = (void *)objc_claimAutoreleasedReturnValue([v79 allObjects]);
    BOOL v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithArray:](&OBJC_CLASS___NSMutableArray, "arrayWithArray:", v14));

    if (!v15)
    {
      id v56 = sub_1001768B4(1);
      __int128 v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v56);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        sub_1001976A4();
      }
      BOOL v15 = 0LL;
      goto LABEL_39;
    }

    -[os_log_s sortUsingComparator:](v15, "sortUsingComparator:", &stru_1002B5300);
  }

  else
  {
    BOOL v15 = 0LL;
  }

  if (!-[THThreadNetworkCredentialsKeychainBackingStore wifiInfoAvailable:](self, "wifiInfoAvailable:", v11)
    && !-[THThreadNetworkCredentialsKeychainBackingStore wifiInfoAvailable:](self, "wifiInfoAvailable:", v12))
  {
    BOOL v18 = 1;
    id v57 = sub_1001768B4(1);
    __int128 v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v57);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v86 = "-[THThreadNetworkCredentialsKeychainBackingStore isMatchingNetworkSignature:preferredNwSignature:preferred:s"
            "ignaturePrefEntries:updatedPreferred:]";
      __int16 v87 = 1024;
      int v88 = 3258;
      _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "%s:%d : Current device WiFi info and Preferred Network WiFi info are empty, no need to update !",  buf,  0x12u);
    }

    goto LABEL_54;
  }

  if (!-[THThreadNetworkCredentialsKeychainBackingStore wifiInfoAvailable:](self, "wifiInfoAvailable:", v12)
    && -[THThreadNetworkCredentialsKeychainBackingStore wifiInfoAvailable:](self, "wifiInfoAvailable:", v11))
  {
    id v16 = sub_1001768B4(1);
    __int128 v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      sub_100197630();
    }
LABEL_39:
    BOOL v18 = 0;
    goto LABEL_54;
  }

  if (!-[THThreadNetworkCredentialsKeychainBackingStore wifiInfoAvailable:](self, "wifiInfoAvailable:", v11)
    && -[THThreadNetworkCredentialsKeychainBackingStore wifiInfoAvailable:](self, "wifiInfoAvailable:", v12))
  {
    BOOL v18 = 1;
    id v19 = sub_1001768B4(1);
    __int128 v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      sub_1001975BC();
    }
    goto LABEL_54;
  }

  __int16 v20 = (void *)objc_claimAutoreleasedReturnValue([v11 wifiSSID]);
  int v21 = (void *)objc_claimAutoreleasedReturnValue([v12 wifiSSID]);
  unsigned int v22 = [v20 isEqualToString:v21];

  if (v22)
  {
    id v23 = sub_1001768B4(1);
    __int16 v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v25 = (void *)objc_claimAutoreleasedReturnValue([v11 wifiSSID]);
      *(_DWORD *)buf = 136315650;
      uint64_t v86 = "-[THThreadNetworkCredentialsKeychainBackingStore isMatchingNetworkSignature:preferredNwSignature:preferred:s"
            "ignaturePrefEntries:updatedPreferred:]";
      __int16 v87 = 1024;
      int v88 = 3290;
      __int16 v89 = 2112;
      v90 = v25;
      _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "%s:%d : Networks SSIDs (%@) are matching!!",  buf,  0x1Cu);
    }

    if (v79)
    {
      __int128 v82 = 0u;
      __int128 v83 = 0u;
      __int128 v80 = 0u;
      __int128 v81 = 0u;
      __int128 v17 = v15;
      id v78 = -[os_log_s countByEnumeratingWithState:objects:count:]( v17,  "countByEnumeratingWithState:objects:count:",  &v80,  v84,  16LL);
      if (v78)
      {
        __int128 v75 = self;
        id v70 = v12;
        id v71 = v11;
        uint64_t v77 = *(void *)v81;
        __int128 v74 = v17;
LABEL_21:
        uint64_t v26 = 0LL;
        id v27 = v75;
        while (1)
        {
          if (*(void *)v81 != v77) {
            objc_enumerationMutation(v17);
          }
          id v28 = *(void **)(*((void *)&v80 + 1) + 8 * v26);
          id v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "networkSignature", v70, v71));
          unsigned __int8 v30 = -[THThreadNetworkCredentialsKeychainBackingStore wifiInfoAvailable:](v27, "wifiInfoAvailable:", v29);

          if ((v30 & 1) == 0)
          {
            int v31 = (void *)objc_claimAutoreleasedReturnValue([v28 network]);
            __int128 v32 = (void *)objc_claimAutoreleasedReturnValue([v31 networkName]);
            __int128 v33 = (void *)objc_claimAutoreleasedReturnValue([v13 network]);
            __int128 v34 = (void *)objc_claimAutoreleasedReturnValue([v33 networkName]);
            if (![v32 isEqualToString:v34])
            {

LABEL_29:
              __int16 v41 = (void *)objc_claimAutoreleasedReturnValue([v28 creationDate]);
              int v42 = (void *)objc_claimAutoreleasedReturnValue([v13 creationDate]);
              id v43 = [v41 compare:v42];

              id v44 = sub_1001768B4(1);
              id v45 = (os_log_s *)objc_claimAutoreleasedReturnValue(v44);
              BOOL v46 = os_log_type_enabled(v45, OS_LOG_TYPE_INFO);
              if (v43 != (id)-1LL)
              {
                id v58 = v28;
                id v12 = v70;
                id v11 = v71;
                if (v46)
                {
                  BOOL v59 = (void *)objc_claimAutoreleasedReturnValue([v58 network]);
                  id v60 = (void *)objc_claimAutoreleasedReturnValue([v59 networkName]);
                  *(_DWORD *)buf = 136315650;
                  uint64_t v86 = "-[THThreadNetworkCredentialsKeychainBackingStore isMatchingNetworkSignature:preferredNwSignature"
                        ":preferred:signaturePrefEntries:updatedPreferred:]";
                  __int16 v87 = 1024;
                  int v88 = 3307;
                  __int16 v89 = 2112;
                  v90 = v60;
                  _os_log_impl( (void *)&_mh_execute_header,  v45,  OS_LOG_TYPE_INFO,  "%s:%d: No need to update signature for  : %@",  buf,  0x1Cu);
                }

                BOOL v18 = 1;
                __int128 v17 = v74;
                goto LABEL_53;
              }

              if (v46)
              {
                unsigned int v47 = (void *)objc_claimAutoreleasedReturnValue([v28 network]);
                id v48 = (void *)objc_claimAutoreleasedReturnValue([v47 networkName]);
                *(_DWORD *)buf = 136315650;
                uint64_t v86 = "-[THThreadNetworkCredentialsKeychainBackingStore isMatchingNetworkSignature:preferredNwSignature:p"
                      "referred:signaturePrefEntries:updatedPreferred:]";
                __int16 v87 = 1024;
                int v88 = 3311;
                __int16 v89 = 2112;
                v90 = v48;
                _os_log_impl( (void *)&_mh_execute_header,  v45,  OS_LOG_TYPE_INFO,  "%s:%d: WiFi Info is not available for the Preferred Network Entry : %@, updating it",  buf,  0x1Cu);
              }

              id v27 = v75;
              -[THThreadNetworkCredentialsKeychainBackingStore dumpPreferredNetwork:](v75, "dumpPreferredNetwork:", v28);
              id v49 = objc_alloc(&OBJC_CLASS___THPreferredThreadNetwork);
              uint64_t v50 = (void *)objc_claimAutoreleasedReturnValue([v28 network]);
              id v51 = (void *)objc_claimAutoreleasedReturnValue([v13 networkSignature]);
              id v52 = (void *)objc_claimAutoreleasedReturnValue([v28 credentialsDataSetRecord]);
              id v53 = (void *)objc_claimAutoreleasedReturnValue([v28 creationDate]);
              __int128 v54 = v28;
              __int128 v55 = (void *)objc_claimAutoreleasedReturnValue([v28 userInfo]);
              *a7 =  -[THPreferredThreadNetwork initWithThreadNetwork:networkSignature:credentialsDataSetRecord:creationDate:lastModificationDate:userInfo:]( v49,  "initWithThreadNetwork:networkSignature:credentialsDataSetRecord:creationDate:lastModificationDate:userInfo:",  v50,  v51,  v52,  v53,  0LL,  v55);

              __int128 v17 = v74;
              if (-[THThreadNetworkCredentialsKeychainBackingStore storePreferred:](v75, "storePreferred:", *a7))
              {
                id v61 = sub_1001768B4(1);
                id v62 = (os_log_s *)objc_claimAutoreleasedReturnValue(v61);
                if (os_log_type_enabled(v62, OS_LOG_TYPE_INFO))
                {
                  id v63 = (void *)objc_claimAutoreleasedReturnValue([v13 network]);
                  v64 = (void *)objc_claimAutoreleasedReturnValue([v63 networkName]);
                  *(_DWORD *)buf = 136315650;
                  uint64_t v86 = "-[THThreadNetworkCredentialsKeychainBackingStore isMatchingNetworkSignature:preferredNwSignature"
                        ":preferred:signaturePrefEntries:updatedPreferred:]";
                  __int16 v87 = 1024;
                  int v88 = 3319;
                  __int16 v89 = 2112;
                  v90 = v64;
                  _os_log_impl( (void *)&_mh_execute_header,  v62,  OS_LOG_TYPE_INFO,  "%s:%d: Original Preferred Network with the name : %@",  buf,  0x1Cu);

                  __int128 v17 = v74;
                }

                -[THThreadNetworkCredentialsKeychainBackingStore dumpPreferredNetwork:]( v75,  "dumpPreferredNetwork:",  v13);
                id v65 = sub_1001768B4(1);
                __int128 v66 = (os_log_s *)objc_claimAutoreleasedReturnValue(v65);
                id v12 = v70;
                id v11 = v71;
                if (os_log_type_enabled(v66, OS_LOG_TYPE_INFO))
                {
                  unint64_t v67 = (void *)objc_claimAutoreleasedReturnValue([*a7 network]);
                  v68 = (void *)objc_claimAutoreleasedReturnValue([v67 networkName]);
                  *(_DWORD *)buf = 136315650;
                  uint64_t v86 = "-[THThreadNetworkCredentialsKeychainBackingStore isMatchingNetworkSignature:preferredNwSignature"
                        ":preferred:signaturePrefEntries:updatedPreferred:]";
                  __int16 v87 = 1024;
                  int v88 = 3321;
                  __int16 v89 = 2112;
                  v90 = v68;
                  _os_log_impl( (void *)&_mh_execute_header,  v66,  OS_LOG_TYPE_INFO,  "%s:%d: Stored updated Preferred Network with the name : %@",  buf,  0x1Cu);

                  __int128 v17 = v74;
                }

                -[THThreadNetworkCredentialsKeychainBackingStore dumpPreferredNetwork:]( v75,  "dumpPreferredNetwork:",  *a7);
                -[THThreadNetworkCredentialsKeychainBackingStore deletePreferredNetworkEntryWithoutRecords:]( v75,  "deletePreferredNetworkEntryWithoutRecords:",  v54);
                -[THThreadNetworkCredentialsKeychainBackingStore deletePreferredNetworkEntryWithoutRecords:]( v75,  "deletePreferredNetworkEntryWithoutRecords:",  v13);
                BOOL v18 = 0;
                goto LABEL_53;
              }

              goto LABEL_33;
            }

            __int128 v35 = (void *)objc_claimAutoreleasedReturnValue([v28 network]);
            id v36 = (void *)objc_claimAutoreleasedReturnValue([v35 extendedPANID]);
            __int128 v73 = v31;
            id v37 = (void *)objc_claimAutoreleasedReturnValue([v13 network]);
            __int128 v38 = v28;
            id v39 = v13;
            id v40 = (void *)objc_claimAutoreleasedReturnValue([v37 extendedPANID]);
            unsigned __int8 v72 = [v36 isEqualToData:v40];

            id v13 = v39;
            id v28 = v38;

            __int128 v17 = v74;
            id v27 = v75;
            if ((v72 & 1) == 0) {
              goto LABEL_29;
            }
          }

- (BOOL)matchPreferredNetworkRecordWithMdns:(id)a3
{
  id v3 = a3;
  id v4 = sub_1001768B4(1);
  uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[THThreadNetworkCredentialsKeychainBackingStore matchPreferredNetworkRecordWithMdns:]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 3368;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_INFO,  "%s:%d: Entered. Trying to match Preferred with Mdns records",  buf,  0x12u);
  }

  *(void *)buf = 0LL;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000LL;
  __int128 v32 = sub_100179464;
  __int128 v33 = sub_100179474;
  __int128 v34 = objc_alloc_init(&OBJC_CLASS___ThreadBRFinder);
  id v6 = *(void **)(*(void *)&buf[8] + 40LL);
  if (!v6)
  {
    id v19 = sub_1001768B4(1);
    __int16 v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)id v27 = 136315394;
      id v28 = "-[THThreadNetworkCredentialsKeychainBackingStore matchPreferredNetworkRecordWithMdns:]";
      __int16 v29 = 1024;
      int v30 = 3372;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "%s:%d: baFinder is nil..", v27, 0x12u);
    }

    goto LABEL_15;
  }

  int v7 = (void *)objc_claimAutoreleasedReturnValue([v3 network]);
  int v8 = (void *)objc_claimAutoreleasedReturnValue([v7 networkName]);
  unsigned __int8 v9 = (void *)objc_claimAutoreleasedReturnValue([v3 network]);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 extendedPANID]);
  unsigned __int8 v11 = [v6 dispatchStartScan:v8 extendedPanIdToFind:v10 borderAgentIdToFind:0];

  if ((v11 & 1) == 0)
  {
    id v21 = sub_1001768B4(1);
    __int16 v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      sub_10019778C();
    }
LABEL_15:

LABEL_16:
    BOOL v22 = 0;
    goto LABEL_17;
  }

  id v12 = sub_1001768B4(1);
  id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)id v27 = 136315394;
    id v28 = "-[THThreadNetworkCredentialsKeychainBackingStore matchPreferredNetworkRecordWithMdns:]";
    __int16 v29 = 1024;
    int v30 = 3381;
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_INFO,  "%s:%d: Waiting for Preferred network record to match on Mdns meshcop",  v27,  0x12u);
  }

  dispatch_time_t v14 = dispatch_time(0LL, 10000000000LL);
  BOOL v15 = (dispatch_semaphore_s *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)&buf[8] + 40) baFinderSemaphore]);
  uint64_t v16 = dispatch_semaphore_wait(v15, v14);

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10018A0BC;
  block[3] = &unk_1002B51B0;
  void block[4] = buf;
  dispatch_async(&_dispatch_main_q, block);
  if (v16)
  {
    id v17 = sub_1001768B4(1);
    BOOL v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      sub_100197718();
    }

    [*(id *)(*(void *)&buf[8] + 40) clear];
    goto LABEL_16;
  }

  id v24 = sub_1001768B4(1);
  BOOL v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
  if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)id v27 = 136315394;
    id v28 = "-[THThreadNetworkCredentialsKeychainBackingStore matchPreferredNetworkRecordWithMdns:]";
    __int16 v29 = 1024;
    int v30 = 3396;
    _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_INFO,  "%s:%d: Preferred network record matches on Mdns meshcop",  v27,  0x12u);
  }

  [*(id *)(*(void *)&buf[8] + 40) clear];
  BOOL v22 = 1;
LABEL_17:
  _Block_object_dispose(buf, 8);

  return v22;
}

- (id)matchPreferredNetworkWithMdns:(id)a3
{
  id v4 = a3;
  id v5 = sub_1001768B4(1);
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    id v23 = "-[THThreadNetworkCredentialsKeychainBackingStore matchPreferredNetworkWithMdns:]";
    __int16 v24 = 1024;
    int v25 = 3403;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_INFO,  "%s:%d: Entered. Matching Preferred with Mdns records",  buf,  0x12u);
  }

  int v7 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  id v8 = v4;
  id v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (!v9)
  {

LABEL_15:
    BOOL v15 = 0LL;
    goto LABEL_16;
  }

  id v10 = v9;
  char v11 = 0;
  uint64_t v12 = *(void *)v18;
  do
  {
    for (i = 0LL; i != v10; i = (char *)i + 1)
    {
      if (*(void *)v18 != v12) {
        objc_enumerationMutation(v8);
      }
      uint64_t v14 = *(void *)(*((void *)&v17 + 1) + 8LL * (void)i);
      if (-[THThreadNetworkCredentialsKeychainBackingStore matchPreferredNetworkRecordWithMdns:]( self,  "matchPreferredNetworkRecordWithMdns:",  v14,  (void)v17))
      {
        -[NSMutableArray addObject:](v7, "addObject:", v14);
        char v11 = 1;
      }
    }

    id v10 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
  }

  while (v10);

  if ((v11 & 1) == 0) {
    goto LABEL_15;
  }
  BOOL v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v7));
LABEL_16:

  return v15;
}

- (id)getTheMdnsMatchingEntryFromTheList:(id)a3
{
  id v3 = a3;
  uint64_t v23 = 0LL;
  __int16 v24 = &v23;
  uint64_t v25 = 0x3032000000LL;
  uint64_t v26 = sub_100179464;
  id v27 = sub_100179474;
  id v28 = objc_alloc_init(&OBJC_CLASS___ThreadBRFinder);
  id v4 = (void *)v24[5];
  if (!v4)
  {
    id v12 = sub_1001768B4(1);
    id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      int v30 = "-[THThreadNetworkCredentialsKeychainBackingStore getTheMdnsMatchingEntryFromTheList:]";
      __int16 v31 = 1024;
      int v32 = 3429;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%s:%d: baFinder is nil..", buf, 0x12u);
    }

    goto LABEL_14;
  }

  if (([v4 disPatchStartScanToMatchListOfPreferredNetworkEntries:v3] & 1) == 0)
  {
    id v14 = sub_1001768B4(1);
    id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_100197874();
    }
LABEL_14:

LABEL_15:
    id v15 = 0LL;
    goto LABEL_16;
  }

  id v5 = sub_1001768B4(1);
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    int v30 = "-[THThreadNetworkCredentialsKeychainBackingStore getTheMdnsMatchingEntryFromTheList:]";
    __int16 v31 = 1024;
    int v32 = 3439;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_INFO,  "%s:%d: Waiting for Preferred network records to match on Mdns meshcop",  buf,  0x12u);
  }

  dispatch_time_t v7 = dispatch_time(0LL, 10000000000LL);
  id v8 = (dispatch_semaphore_s *)objc_claimAutoreleasedReturnValue([(id)v24[5] baFinderSemaphore]);
  uint64_t v9 = dispatch_semaphore_wait(v8, v7);

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10018A644;
  block[3] = &unk_1002B51B0;
  void block[4] = &v23;
  dispatch_async(&_dispatch_main_q, block);
  if (v9)
  {
    id v10 = sub_1001768B4(1);
    char v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_100197800();
    }

    [(id)v24[5] clear];
    goto LABEL_15;
  }

  __int128 v17 = (void *)objc_claimAutoreleasedReturnValue([(id)v24[5] preferredRecord]);
  id v18 = sub_1001768B4(1);
  __int128 v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    __int128 v20 = (void *)objc_claimAutoreleasedReturnValue([v17 network]);
    id v21 = (void *)objc_claimAutoreleasedReturnValue([v20 networkName]);
    *(_DWORD *)buf = 136315650;
    int v30 = "-[THThreadNetworkCredentialsKeychainBackingStore getTheMdnsMatchingEntryFromTheList:]";
    __int16 v31 = 1024;
    int v32 = 3456;
    __int16 v33 = 2112;
    __int128 v34 = v21;
    _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_INFO,  "%s:%d: Preferred network record matches on Mdns meshcop preferred network name : %@",  buf,  0x1Cu);
  }

  [(id)v24[5] clear];
  id v15 = v17;
LABEL_16:
  _Block_object_dispose(&v23, 8);

  return v15;
}

- (BOOL)deletePreferredNetworkEntry:(id)a3
{
  id v3 = a3;
  id v4 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue( +[THPreferredThreadNetwork keyChainQueryForDeletePreferredNetworkRecord:]( &OBJC_CLASS___THPreferredThreadNetwork,  "keyChainQueryForDeletePreferredNetworkRecord:",  v3));
  id v5 = v4;
  if (!v4)
  {
    id v13 = sub_1001768B4(1);
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_1001978E8();
    }
    goto LABEL_15;
  }

  OSStatus v6 = SecItemDelete(v4);
  id v7 = sub_1001768B4(1);
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v3 network]);
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 networkName]);
    int v22 = 136315650;
    uint64_t v23 = "-[THThreadNetworkCredentialsKeychainBackingStore deletePreferredNetworkEntry:]";
    __int16 v24 = 2112;
    uint64_t v25 = v10;
    __int16 v26 = 1024;
    OSStatus v27 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "%s: Preferred Network : %@, Deletion result :(err=%d)",  (uint8_t *)&v22,  0x1Cu);
  }

  if (v6)
  {
    id v11 = sub_1001768B4(1);
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_1001979FC(v3, v12);
    }
LABEL_15:
    BOOL v18 = 0;
    goto LABEL_16;
  }

  id v14 = (void *)objc_claimAutoreleasedReturnValue([v3 network]);
  id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[THThreadNetworkCredentialsActiveDataSetRecord keyChainQueryForDeleteAllActiveDataSetOperationForThreadNetwork:]( &OBJC_CLASS___THThreadNetworkCredentialsActiveDataSetRecord,  "keyChainQueryForDeleteAllActiveDataSetOperationForThreadNetwork:",  v14));

  OSStatus v15 = SecItemDelete(v12);
  id v16 = sub_1001768B4(1);
  __int128 v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    int v22 = 136315394;
    uint64_t v23 = "-[THThreadNetworkCredentialsKeychainBackingStore deletePreferredNetworkEntry:]";
    __int16 v24 = 1024;
    LODWORD(v25) = v15;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "%s: GOT: (err=%d)", (uint8_t *)&v22, 0x12u);
  }

  BOOL v18 = v15 == 0;
  if (v15)
  {
    id v19 = sub_1001768B4(1);
    __int128 v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      sub_10019795C(v3);
    }

    goto LABEL_15;
  }

- (BOOL)deletePreferredNetworkEntryWithoutRecords:(id)a3
{
  id v3 = a3;
  id v4 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue( +[THPreferredThreadNetwork keyChainQueryForDeletePreferredNetworkRecord:]( &OBJC_CLASS___THPreferredThreadNetwork,  "keyChainQueryForDeletePreferredNetworkRecord:",  v3));
  id v5 = sub_1001768B4(1);
  OSStatus v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  id v7 = v6;
  if (v4)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      int v16 = 136315650;
      __int128 v17 = "-[THThreadNetworkCredentialsKeychainBackingStore deletePreferredNetworkEntryWithoutRecords:]";
      __int16 v18 = 1024;
      *(_DWORD *)id v19 = 3501;
      *(_WORD *)&void v19[4] = 2112;
      *(void *)&v19[6] = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "%s:%d: SID: Delete keychain query dictionary keyChainDelete: %@",  (uint8_t *)&v16,  0x1Cu);
    }

    OSStatus v8 = SecItemDelete(v4);
    id v9 = sub_1001768B4(1);
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      id v11 = (void *)objc_claimAutoreleasedReturnValue([v3 network]);
      id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 networkName]);
      int v16 = 136315650;
      __int128 v17 = "-[THThreadNetworkCredentialsKeychainBackingStore deletePreferredNetworkEntryWithoutRecords:]";
      __int16 v18 = 2112;
      *(void *)id v19 = v12;
      *(_WORD *)&v19[8] = 1024;
      *(_DWORD *)&v19[10] = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "%s: Preferred Network : %@, Deletion result :(err=%d)",  (uint8_t *)&v16,  0x1Cu);
    }

    if (!v8)
    {
      BOOL v14 = 1;
      goto LABEL_13;
    }

    id v13 = sub_1001768B4(1);
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_100197B04(v3);
    }
  }

  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    sub_100197A90();
  }

  BOOL v14 = 0;
LABEL_13:

  return v14;
}

- (BOOL)deleteOldEntryForTheNetworkSignatureIfThreadNetworkIsDifferent:(id)a3 nwSignature:(id)a4
{
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue( -[THThreadNetworkCredentialsKeychainBackingStore getPrefEntriesForSignature:]( self,  "getPrefEntriesForSignature:",  a4));
  OSStatus v8 = v7;
  if (!v7 || ![v7 count])
  {
    BOOL v27 = 1;
    goto LABEL_25;
  }

  __int128 v39 = 0u;
  __int128 v40 = 0u;
  __int128 v37 = 0u;
  __int128 v38 = 0u;
  id obj = v8;
  id v9 = [obj countByEnumeratingWithState:&v37 objects:v47 count:16];
  if (!v9)
  {
    BOOL v27 = 1;
    goto LABEL_24;
  }

  id v10 = v9;
  __int16 v29 = v8;
  uint64_t v11 = *(void *)v38;
  int v30 = self;
  id v31 = v6;
  uint64_t v34 = *(void *)v38;
  while (2)
  {
    id v12 = 0LL;
    id v35 = v10;
    do
    {
      if (*(void *)v38 != v11) {
        objc_enumerationMutation(obj);
      }
      id v13 = *(void **)(*((void *)&v37 + 1) + 8LL * (void)v12);
      -[THThreadNetworkCredentialsKeychainBackingStore dumpPreferredNetwork:](self, "dumpPreferredNetwork:", v13);
      BOOL v14 = (void *)objc_claimAutoreleasedReturnValue([v13 networkSignature]);
      if (-[THThreadNetworkCredentialsKeychainBackingStore wifiInfoAvailable:](self, "wifiInfoAvailable:", v14))
      {
        OSStatus v15 = (void *)objc_claimAutoreleasedReturnValue([v13 network]);
        int v16 = (void *)objc_claimAutoreleasedReturnValue([v15 networkName]);
        __int128 v17 = (void *)objc_claimAutoreleasedReturnValue([v6 network]);
        __int16 v18 = (void *)objc_claimAutoreleasedReturnValue([v17 networkName]);
        if ([v16 isEqualToString:v18])
        {
          id v19 = (void *)objc_claimAutoreleasedReturnValue([v13 network]);
          __int16 v33 = v15;
          __int128 v20 = (void *)objc_claimAutoreleasedReturnValue([v19 extendedPANID]);
          id v21 = (void *)objc_claimAutoreleasedReturnValue([v6 network]);
          int v22 = (void *)objc_claimAutoreleasedReturnValue([v21 extendedPANID]);
          unsigned __int8 v32 = [v20 isEqualToData:v22];

          id v6 = v31;
          self = v30;

          uint64_t v11 = v34;
          id v10 = v35;
          if ((v32 & 1) != 0) {
            goto LABEL_17;
          }
          goto LABEL_14;
        }

        uint64_t v11 = v34;
        id v10 = v35;
      }

LABEL_14:
      id v23 = sub_1001768B4(1);
      __int16 v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue([v13 network]);
        __int16 v26 = (void *)objc_claimAutoreleasedReturnValue([v25 networkName]);
        *(_DWORD *)buf = 136315650;
        int v42 = "-[THThreadNetworkCredentialsKeychainBackingStore deleteOldEntryForTheNetworkSignatureIfThreadNetworkIsDiff"
              "erent:nwSignature:]";
        __int16 v43 = 1024;
        int v44 = 3531;
        __int16 v45 = 2112;
        BOOL v46 = v26;
        _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_INFO,  "%s:%d: Deleting the Preferred Network Entry : %@",  buf,  0x1Cu);
      }

      if (!-[THThreadNetworkCredentialsKeychainBackingStore deletePreferredNetworkEntry:]( self,  "deletePreferredNetworkEntry:",  v13))
      {
        BOOL v27 = 0;
        goto LABEL_22;
      }

- (id)checkIfNetworkSignatureUpdateIsRequiredForPreferredNetwork:(id)a3 nwSignature:(id)a4
{
  return -[THThreadNetworkCredentialsKeychainBackingStore checkIfNetworkSignatureUpdateIsRequiredForPreferredNetwork:nwSignature:signaturePrefEntries:]( self,  "checkIfNetworkSignatureUpdateIsRequiredForPreferredNetwork:nwSignature:signaturePrefEntries:",  a3,  a4,  0LL);
}

- (id)checkIfNetworkSignatureUpdateIsRequiredForPreferredNetwork:(id)a3 nwSignature:(id)a4 signaturePrefEntries:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v8 networkSignature]);
  id v34 = 0LL;
  unsigned int v12 = -[THThreadNetworkCredentialsKeychainBackingStore isMatchingNetworkSignature:preferredNwSignature:preferred:signaturePrefEntries:updatedPreferred:]( self,  "isMatchingNetworkSignature:preferredNwSignature:preferred:signaturePrefEntries:updatedPreferred:",  v9,  v11,  v8,  v10,  &v34);

  id v13 = (THPreferredThreadNetwork *)v34;
  id v14 = sub_1001768B4(1);
  OSStatus v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
  int v16 = v15;
  if (v12)
  {
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      id v36 = "-[THThreadNetworkCredentialsKeychainBackingStore checkIfNetworkSignatureUpdateIsRequiredForPreferredNetwork:"
            "nwSignature:signaturePrefEntries:]";
      __int16 v37 = 1024;
      int v38 = 3558;
      _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "%s:%d: Current Network Signature matches with Preferred Network Signature",  buf,  0x12u);
    }

    goto LABEL_5;
  }

  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    id v36 = "-[THThreadNetworkCredentialsKeychainBackingStore checkIfNetworkSignatureUpdateIsRequiredForPreferredNetwork:nw"
          "Signature:signaturePrefEntries:]";
    __int16 v37 = 1024;
    int v38 = 3562;
    _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_INFO,  "%s:%d: Update is required for the preferred network ssid",  buf,  0x12u);
  }

  if (v13)
  {
LABEL_9:
    id v13 = v13;
    __int128 v17 = v13;
    goto LABEL_10;
  }

  id v19 = objc_alloc(&OBJC_CLASS___THPreferredThreadNetwork);
  __int128 v20 = (void *)objc_claimAutoreleasedReturnValue([v8 network]);
  id v21 = (void *)objc_claimAutoreleasedReturnValue([v8 credentialsDataSetRecord]);
  int v22 = (void *)objc_claimAutoreleasedReturnValue([v8 creationDate]);
  id v23 = (void *)objc_claimAutoreleasedReturnValue([v8 userInfo]);
  id v13 = -[THPreferredThreadNetwork initWithThreadNetwork:networkSignature:credentialsDataSetRecord:creationDate:lastModificationDate:userInfo:]( v19,  "initWithThreadNetwork:networkSignature:credentialsDataSetRecord:creationDate:lastModificationDate:userInfo:",  v20,  v9,  v21,  v22,  0LL,  v23);

  if (!v13)
  {
    id v32 = sub_1001768B4(1);
    __int16 v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
      sub_100197BA4();
    }

    id v13 = 0LL;
    goto LABEL_5;
  }

  if (-[THThreadNetworkCredentialsKeychainBackingStore storePreferred:](self, "storePreferred:", v13))
  {
    id v24 = sub_1001768B4(1);
    uint64_t v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      __int16 v26 = (void *)objc_claimAutoreleasedReturnValue([v8 network]);
      BOOL v27 = (void *)objc_claimAutoreleasedReturnValue([v26 networkName]);
      *(_DWORD *)buf = 136315650;
      id v36 = "-[THThreadNetworkCredentialsKeychainBackingStore checkIfNetworkSignatureUpdateIsRequiredForPreferredNetwork:"
            "nwSignature:signaturePrefEntries:]";
      __int16 v37 = 1024;
      int v38 = 3579;
      __int16 v39 = 2112;
      __int128 v40 = v27;
      _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_INFO,  "%s:%d: Original Preferred Network with the name : %@",  buf,  0x1Cu);
    }

    -[THThreadNetworkCredentialsKeychainBackingStore dumpPreferredNetwork:](self, "dumpPreferredNetwork:", v8);
    id v28 = sub_1001768B4(1);
    __int16 v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
    {
      int v30 = (void *)objc_claimAutoreleasedReturnValue(-[THPreferredThreadNetwork network](v13, "network"));
      id v31 = (void *)objc_claimAutoreleasedReturnValue([v30 networkName]);
      *(_DWORD *)buf = 136315650;
      id v36 = "-[THThreadNetworkCredentialsKeychainBackingStore checkIfNetworkSignatureUpdateIsRequiredForPreferredNetwork:"
            "nwSignature:signaturePrefEntries:]";
      __int16 v37 = 1024;
      int v38 = 3581;
      __int16 v39 = 2112;
      __int128 v40 = v31;
      _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_INFO,  "%s:%d: Stored updated Preferred Network with the name : %@",  buf,  0x1Cu);
    }

    -[THThreadNetworkCredentialsKeychainBackingStore dumpPreferredNetwork:](self, "dumpPreferredNetwork:", v13);
    goto LABEL_9;
  }

- (id)matchPreferredNetworkWithNetworkSignature:(id)a3 nwSignature:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = sub_1001768B4(1);
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    int v30 = "-[THThreadNetworkCredentialsKeychainBackingStore matchPreferredNetworkWithNetworkSignature:nwSignature:]";
    __int16 v31 = 1024;
    int v32 = 3591;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_INFO,  "%s:%d: Entered. Matching Preferred with Network Signatures ",  buf,  0x12u);
  }

  if (!v7)
  {
    id v20 = sub_1001768B4(1);
    id v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      sub_100197C18();
    }
    goto LABEL_18;
  }

  id v23 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  id v10 = v6;
  id v11 = [v10 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (!v11)
  {

LABEL_18:
    id v19 = 0LL;
    goto LABEL_21;
  }

  id v12 = v11;
  id v22 = v6;
  char v13 = 0;
  uint64_t v14 = *(void *)v25;
  do
  {
    for (i = 0LL; i != v12; i = (char *)i + 1)
    {
      if (*(void *)v25 != v14) {
        objc_enumerationMutation(v10);
      }
      int v16 = *(void **)(*((void *)&v24 + 1) + 8LL * (void)i);
      __int128 v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "networkSignature", v22));
      unsigned int v18 = -[THThreadNetworkCredentialsKeychainBackingStore isMatchingNetworkSignature:preferredNwSignature:]( self,  "isMatchingNetworkSignature:preferredNwSignature:",  v7,  v17);

      if (v18)
      {
        -[os_log_s addObject:](v23, "addObject:", v16);
        char v13 = 1;
      }
    }

    id v12 = [v10 countByEnumeratingWithState:&v24 objects:v28 count:16];
  }

  while (v12);

  if ((v13 & 1) != 0) {
    id v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v23));
  }
  else {
    id v19 = 0LL;
  }
  id v6 = v22;
LABEL_21:

  return v19;
}

- (void)dumpPreferredNetwork:(id)a3
{
  id v3 = a3;
  id v4 = sub_1001768B4(1);
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  id v6 = v5;
  if (v3)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      id v7 = (void *)objc_claimAutoreleasedReturnValue([v3 network]);
      id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 networkName]);
      int v34 = 136315650;
      id v35 = "-[THThreadNetworkCredentialsKeychainBackingStore dumpPreferredNetwork:]";
      __int16 v36 = 1024;
      int v37 = 3623;
      __int16 v38 = 2112;
      __int16 v39 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_INFO,  "%s:%d: Preferred Network Name : %@",  (uint8_t *)&v34,  0x1Cu);
    }

    id v9 = sub_1001768B4(1);
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      id v11 = (void *)objc_claimAutoreleasedReturnValue([v3 network]);
      id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 extendedPANID]);
      int v34 = 136315650;
      id v35 = "-[THThreadNetworkCredentialsKeychainBackingStore dumpPreferredNetwork:]";
      __int16 v36 = 1024;
      int v37 = 3625;
      __int16 v38 = 2112;
      __int16 v39 = v12;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_INFO,  "%s:%d: Preferred Network Extended Pan Id : %@",  (uint8_t *)&v34,  0x1Cu);
    }

    id v13 = sub_1001768B4(1);
    uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      OSStatus v15 = (void *)objc_claimAutoreleasedReturnValue([v3 networkSignature]);
      int v16 = (void *)objc_claimAutoreleasedReturnValue([v15 ipv4NwSignature]);
      int v34 = 136315650;
      id v35 = "-[THThreadNetworkCredentialsKeychainBackingStore dumpPreferredNetwork:]";
      __int16 v36 = 1024;
      int v37 = 3627;
      __int16 v38 = 2112;
      __int16 v39 = v16;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_INFO,  "%s:%d: Preferred Network IPv4 NwSignature : %@",  (uint8_t *)&v34,  0x1Cu);
    }

    id v17 = sub_1001768B4(1);
    unsigned int v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      id v19 = (void *)objc_claimAutoreleasedReturnValue([v3 networkSignature]);
      id v20 = (void *)objc_claimAutoreleasedReturnValue([v19 ipv6NwSignature]);
      int v34 = 136315650;
      id v35 = "-[THThreadNetworkCredentialsKeychainBackingStore dumpPreferredNetwork:]";
      __int16 v36 = 1024;
      int v37 = 3629;
      __int16 v38 = 2112;
      __int16 v39 = v20;
      _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_INFO,  "%s:%d: Preferred Network IPv6 NwSignature : %@",  (uint8_t *)&v34,  0x1Cu);
    }

    id v21 = (void *)objc_claimAutoreleasedReturnValue([v3 networkSignature]);
    uint64_t v22 = objc_claimAutoreleasedReturnValue([v21 wifiSSID]);
    if (v22)
    {
      id v23 = (void *)v22;
      __int128 v24 = (void *)objc_claimAutoreleasedReturnValue([v3 networkSignature]);
      __int128 v25 = (void *)objc_claimAutoreleasedReturnValue([v24 wifiPassword]);

      if (!v25)
      {
LABEL_15:
        id v29 = sub_1001768B4(1);
        int v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
        if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
        {
          __int16 v31 = (void *)objc_claimAutoreleasedReturnValue([v3 creationDate]);
          int v34 = 136315650;
          id v35 = "-[THThreadNetworkCredentialsKeychainBackingStore dumpPreferredNetwork:]";
          __int16 v36 = 1024;
          int v37 = 3635;
          __int16 v38 = 2112;
          __int16 v39 = v31;
          _os_log_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_INFO,  "%s:%d: Preferred Network creation dated : %@",  (uint8_t *)&v34,  0x1Cu);
        }

        id v32 = sub_1001768B4(1);
        id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
        if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
        {
          __int16 v33 = (void *)objc_claimAutoreleasedReturnValue([v3 lastModificationDate]);
          int v34 = 136315650;
          id v35 = "-[THThreadNetworkCredentialsKeychainBackingStore dumpPreferredNetwork:]";
          __int16 v36 = 1024;
          int v37 = 3637;
          __int16 v38 = 2112;
          __int16 v39 = v33;
          _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_INFO,  "%s:%d: Preferred Network last modified : %@",  (uint8_t *)&v34,  0x1Cu);
        }

        goto LABEL_21;
      }

      id v26 = sub_1001768B4(1);
      id v21 = (void *)objc_claimAutoreleasedReturnValue(v26);
      if (os_log_type_enabled((os_log_t)v21, OS_LOG_TYPE_DEFAULT))
      {
        __int128 v27 = (void *)objc_claimAutoreleasedReturnValue([v3 networkSignature]);
        id v28 = (void *)objc_claimAutoreleasedReturnValue([v27 wifiSSID]);
        int v34 = 136315650;
        id v35 = "-[THThreadNetworkCredentialsKeychainBackingStore dumpPreferredNetwork:]";
        __int16 v36 = 1024;
        int v37 = 3632;
        __int16 v38 = 2112;
        __int16 v39 = v28;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v21,  OS_LOG_TYPE_DEFAULT,  "%s:%d: Preferred Network wifi ssid : %@",  (uint8_t *)&v34,  0x1Cu);
      }
    }

    goto LABEL_15;
  }

  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    sub_100197C8C();
  }
LABEL_21:
}

- (void)dumpPreferredNetworksArray:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4 && [v4 count])
  {
    id v6 = sub_1001768B4(1);
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      __int128 v25 = "-[THThreadNetworkCredentialsKeychainBackingStore dumpPreferredNetworksArray:]";
      __int16 v26 = 1024;
      int v27 = 3648;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "%s:%d: === Sorted List of Preferred Networks  ===",  buf,  0x12u);
    }

    __int128 v21 = 0u;
    __int128 v22 = 0u;
    __int128 v19 = 0u;
    __int128 v20 = 0u;
    id v8 = v5;
    id v9 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v9)
    {
      id v10 = v9;
      int v11 = 0;
      uint64_t v12 = *(void *)v20;
      while (2)
      {
        for (i = 0LL; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v20 != v12) {
            objc_enumerationMutation(v8);
          }
          if (v11 + (_DWORD)i == 10)
          {
            id v16 = sub_1001768B4(1);
            id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
            if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
              sub_100197D74();
            }

            goto LABEL_19;
          }

          -[THThreadNetworkCredentialsKeychainBackingStore dumpPreferredNetwork:]( self,  "dumpPreferredNetwork:",  *(void *)(*((void *)&v19 + 1) + 8LL * (void)i),  (void)v19);
        }

        id v10 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
        v11 += (int)i;
        if (v10) {
          continue;
        }
        break;
      }
    }

- (void)dumpPreferredNetworks:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4 && [v4 count])
  {
    id v6 = sub_1001768B4(1);
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      __int128 v25 = "-[THThreadNetworkCredentialsKeychainBackingStore dumpPreferredNetworks:]";
      __int16 v26 = 1024;
      int v27 = 3672;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "%s:%d: === List of Preferred Networks ===",  buf,  0x12u);
    }

    __int128 v21 = 0u;
    __int128 v22 = 0u;
    __int128 v19 = 0u;
    __int128 v20 = 0u;
    id v8 = v5;
    id v9 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v9)
    {
      id v10 = v9;
      int v11 = 0;
      uint64_t v12 = *(void *)v20;
      while (2)
      {
        for (i = 0LL; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v20 != v12) {
            objc_enumerationMutation(v8);
          }
          if (v11 + (_DWORD)i == 10)
          {
            id v16 = sub_1001768B4(1);
            id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
            if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
              sub_100197E5C();
            }

            goto LABEL_19;
          }

          -[THThreadNetworkCredentialsKeychainBackingStore dumpPreferredNetwork:]( self,  "dumpPreferredNetwork:",  *(void *)(*((void *)&v19 + 1) + 8LL * (void)i),  (void)v19);
        }

        id v10 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
        v11 += (int)i;
        if (v10) {
          continue;
        }
        break;
      }
    }

- (void)dumpFrozenThreadNetworks:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (v3 && [v3 count])
  {
    id v5 = sub_1001768B4(1);
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      int v27 = "-[THThreadNetworkCredentialsKeychainBackingStore dumpFrozenThreadNetworks:]";
      __int16 v28 = 1024;
      int v29 = 3696;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_INFO,  "%s:%d: === List of Frozen Thread Networks ===",  buf,  0x12u);
    }

    __int128 v24 = 0u;
    __int128 v25 = 0u;
    __int128 v22 = 0u;
    __int128 v23 = 0u;
    id v7 = v4;
    id v8 = [v7 countByEnumeratingWithState:&v22 objects:v34 count:16];
    if (v8)
    {
      id v9 = v8;
      int v10 = 0;
      uint64_t v11 = *(void *)v23;
      while (2)
      {
        for (i = 0LL; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v23 != v11) {
            objc_enumerationMutation(v7);
          }
          id v13 = *(void **)(*((void *)&v22 + 1) + 8LL * (void)i);
          id v14 = sub_1001768B4(1);
          OSStatus v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
          id v16 = v15;
          if (v10 + (_DWORD)i == 10)
          {
            if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
              sub_100197ED0();
            }

            goto LABEL_21;
          }

          if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
          {
            id v17 = (void *)objc_claimAutoreleasedReturnValue([v13 credentialsDataSet]);
            id v18 = (void *)objc_claimAutoreleasedReturnValue([v17 dataSetArray]);
            *(_DWORD *)buf = 136315906;
            int v27 = "-[THThreadNetworkCredentialsKeychainBackingStore dumpFrozenThreadNetworks:]";
            __int16 v28 = 1024;
            int v29 = 3704;
            __int16 v30 = 1024;
            int v31 = v10 + (_DWORD)i;
            __int16 v32 = 2112;
            __int16 v33 = v18;
            _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_INFO,  "%s:%d: %d> Frozen Thread Network  : %@",  buf,  0x22u);
          }
        }

        id v9 = [v7 countByEnumeratingWithState:&v22 objects:v34 count:16];
        v10 += (int)i;
        if (v9) {
          continue;
        }
        break;
      }
    }

- (id)getPreferredNetworkInternally
{
  return -[THThreadNetworkCredentialsKeychainBackingStore getPreferredNetwork:](self, "getPreferredNetwork:", 1LL);
}

- (id)sortAndReturnPreferredNetwork:(id)a3
{
  return -[THThreadNetworkCredentialsKeychainBackingStore sortAndReturnPreferredNetwork:onlyMdns:]( self,  "sortAndReturnPreferredNetwork:onlyMdns:",  a3,  0LL);
}

- (id)sortAndReturnPreferredNetwork:(id)a3 onlyMdns:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = objc_autoreleasePoolPush();
  id v8 = sub_1001768B4(1);
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    id v56 = "-[THThreadNetworkCredentialsKeychainBackingStore sortAndReturnPreferredNetwork:onlyMdns:]";
    __int16 v57 = 1024;
    *(_DWORD *)id v58 = 3731;
    *(_WORD *)&v58[4] = 2048;
    *(void *)&v58[6] = [v6 count];
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_INFO,  "%s : %d - Networks in the Database = %lu",  buf,  0x1Cu);
  }

  int v10 = (void *)objc_claimAutoreleasedReturnValue([v6 allObjects]);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithArray:](&OBJC_CLASS___NSMutableArray, "arrayWithArray:", v10));

  if (!v11)
  {
    id v15 = sub_1001768B4(1);
    id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_100197F44();
    }
    id v17 = 0LL;
    goto LABEL_11;
  }

  [v11 sortUsingComparator:&stru_1002B5320];
  -[THThreadNetworkCredentialsKeychainBackingStore dumpPreferredNetworksArray:]( self,  "dumpPreferredNetworksArray:",  v11);
  if (v4)
  {
    id v12 = sub_1001768B4(1);
    id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_10019802C(v6);
    }

    uint64_t v14 = objc_claimAutoreleasedReturnValue( -[THThreadNetworkCredentialsKeychainBackingStore getTheMdnsMatchingEntryFromTheList:]( self,  "getTheMdnsMatchingEntryFromTheList:",  v11));
  }

  else
  {
    if (![v11 count])
    {
      id v17 = 0LL;
      goto LABEL_32;
    }

    uint64_t v14 = objc_claimAutoreleasedReturnValue([v11 objectAtIndexedSubscript:0]);
  }

  id v17 = (void *)v14;
  if (v14)
  {
    id v18 = sub_1001768B4(1);
    id v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      __int128 v20 = (void *)objc_claimAutoreleasedReturnValue([v17 network]);
      id v21 = (void *)objc_claimAutoreleasedReturnValue([v20 networkName]);
      *(_DWORD *)buf = 136315650;
      id v56 = "-[THThreadNetworkCredentialsKeychainBackingStore sortAndReturnPreferredNetwork:onlyMdns:]";
      __int16 v57 = 1024;
      *(_DWORD *)id v58 = 3775;
      *(_WORD *)&v58[4] = 2112;
      *(void *)&v58[6] = v21;
      _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "%s:%d: Found the Preferred Network : %@",  buf,  0x1Cu);
    }

    uint64_t v22 = objc_claimAutoreleasedReturnValue([v17 credentialsDataSetRecord]);
    if (v22)
    {
      id v16 = (os_log_s *)v22;
      __int128 v23 = (void *)objc_claimAutoreleasedReturnValue([v17 credentialsDataSetRecord]);
      __int128 v24 = (void *)objc_claimAutoreleasedReturnValue([v23 credentialsDataSet]);
      uint64_t v25 = objc_claimAutoreleasedReturnValue([v24 dataSetArray]);
      if (!v25)
      {

LABEL_11:
        goto LABEL_32;
      }

      __int16 v26 = (void *)v25;
      id v52 = self;
      __int128 v54 = v7;
      int v27 = (void *)objc_claimAutoreleasedReturnValue([v17 credentialsDataSetRecord]);
      __int16 v28 = (void *)objc_claimAutoreleasedReturnValue([v27 credentialsDataSet]);
      int v29 = (void *)objc_claimAutoreleasedReturnValue([v28 dataSetArray]);
      id v53 = [v29 length];

      if (!v53) {
        goto LABEL_31;
      }
      id v30 = sub_1001768B4(1);
      int v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v32 = (void *)objc_claimAutoreleasedReturnValue([v17 credentialsDataSetRecord]);
        __int16 v33 = (void *)objc_claimAutoreleasedReturnValue([v32 network]);
        int v34 = (void *)objc_claimAutoreleasedReturnValue([v33 networkName]);
        id v35 = (void *)objc_claimAutoreleasedReturnValue([v17 credentialsDataSetRecord]);
        __int16 v36 = (void *)objc_claimAutoreleasedReturnValue([v35 credentialsDataSet]);
        int v37 = (void *)objc_claimAutoreleasedReturnValue([v36 dataSetArray]);
        *(_DWORD *)buf = 136315906;
        id v56 = "-[THThreadNetworkCredentialsKeychainBackingStore sortAndReturnPreferredNetwork:onlyMdns:]";
        __int16 v57 = 1024;
        *(_DWORD *)id v58 = 3782;
        *(_WORD *)&v58[4] = 2112;
        *(void *)&v58[6] = v34;
        __int16 v59 = 2112;
        id v60 = v37;
        _os_log_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_DEFAULT,  "%s:%d: This preferred network entry has a record associated with it, record name : %@, dataset : %@, check if it is frozen or not",  buf,  0x26u);
      }

      __int16 v38 = (void *)objc_claimAutoreleasedReturnValue([v17 credentialsDataSetRecord]);
      unsigned int v39 = -[THThreadNetworkCredentialsKeychainBackingStore isFrozenRecord:](v52, "isFrozenRecord:", v38);

      if (!v39)
      {
LABEL_31:
        id v7 = v54;
        goto LABEL_32;
      }

      __int128 v40 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue( +[THPreferredThreadNetwork keyChainQueryForDeletePreferredNetworkRecord:]( &OBJC_CLASS___THPreferredThreadNetwork,  "keyChainQueryForDeletePreferredNetworkRecord:",  v17));
      __int16 v41 = v40;
      if (v40)
      {
        OSStatus v42 = SecItemDelete(v40);
        id v43 = sub_1001768B4(1);
        int v44 = (os_log_s *)objc_claimAutoreleasedReturnValue(v43);
        if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
        {
          __int16 v45 = (void *)objc_claimAutoreleasedReturnValue([v17 network]);
          BOOL v46 = (void *)objc_claimAutoreleasedReturnValue([v45 networkName]);
          *(_DWORD *)buf = 136315650;
          id v56 = "-[THThreadNetworkCredentialsKeychainBackingStore sortAndReturnPreferredNetwork:onlyMdns:]";
          __int16 v57 = 2112;
          *(void *)id v58 = v46;
          *(_WORD *)&v58[8] = 1024;
          *(_DWORD *)&v58[10] = v42;
          _os_log_impl( (void *)&_mh_execute_header,  v44,  OS_LOG_TYPE_DEFAULT,  "%s: Frozen Preferred Network : %@, Deletion result :(err=%d)",  buf,  0x1Cu);
        }

        if (!v42) {
          goto LABEL_37;
        }
        unsigned int v47 = (os_log_s *)SecCopyErrorMessageString(v42, 0LL);
        id v48 = sub_1001768B4(1);
        id v49 = (os_log_s *)objc_claimAutoreleasedReturnValue(v48);
        if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR)) {
          sub_100195A24();
        }
      }

      else
      {
        id v51 = sub_1001768B4(1);
        unsigned int v47 = (os_log_s *)objc_claimAutoreleasedReturnValue(v51);
        if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR)) {
          sub_100197FB8();
        }
      }

LABEL_37:
      id v16 = (os_log_s *)v17;
      id v17 = 0LL;
      id v7 = v54;
      goto LABEL_11;
    }
  }

- (BOOL)wifiInfoAvailable:(id)a3
{
  id v3 = a3;
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue([v3 wifiSSID]);
  if (v4)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 wifiSSID]);
    BOOL v6 = [v5 length] != 0;
  }

  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (id)getPrefEntriesForLabelAsSSID:(id)a3
{
  id v4 = a3;
  id v5 = sub_1001768B4(1);
  BOOL v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    __int128 v20 = "-[THThreadNetworkCredentialsKeychainBackingStore getPrefEntriesForLabelAsSSID:]";
    __int16 v21 = 1024;
    int v22 = 3827;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%s:%d: Get preferred network for SSID", buf, 0x12u);
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[THPreferredThreadNetwork keyChainQueryForPreferredNetworkRecordsOperationForLabelAsSSID:]( &OBJC_CLASS___THPreferredThreadNetwork,  "keyChainQueryForPreferredNetworkRecordsOperationForLabelAsSSID:",  v4));
  if (v7)
  {
    id v18 = 0LL;
    id v8 = (void *)objc_claimAutoreleasedReturnValue( -[THThreadNetworkCredentialsKeychainBackingStore _doFetchPreferredNetworks:error:]( self,  "_doFetchPreferredNetworks:error:",  v7,  &v18));
    id v9 = v18;
    if (v8)
    {
      id v10 = sub_1001768B4(1);
      uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        id v12 = [v8 count];
        id v13 = (void *)objc_claimAutoreleasedReturnValue([v4 wifiSSID]);
        *(_DWORD *)buf = 136315906;
        __int128 v20 = "-[THThreadNetworkCredentialsKeychainBackingStore getPrefEntriesForLabelAsSSID:]";
        __int16 v21 = 1024;
        int v22 = 3837;
        __int16 v23 = 2048;
        id v24 = v12;
        __int16 v25 = 2112;
        __int16 v26 = v13;
        _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_INFO,  "%s : %d - Preferred Networks in Database = %lu, for network ssid :(%@)",  buf,  0x26u);
      }
    }

    uint64_t v14 = v8;

    id v15 = v14;
  }

  else
  {
    id v16 = sub_1001768B4(1);
    uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_1001980AC();
    }
    id v15 = 0LL;
  }

  return v15;
}

- (id)getPrefEntriesForSSIDAndSignature:(id)a3
{
  id v4 = a3;
  id v5 = sub_1001768B4(1);
  BOOL v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    int v22 = "-[THThreadNetworkCredentialsKeychainBackingStore getPrefEntriesForSSIDAndSignature:]";
    __int16 v23 = 1024;
    int v24 = 3847;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_INFO,  "%s:%d: Get preferred network for SSID and signature",  buf,  0x12u);
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[THPreferredThreadNetwork keyChainQueryForPreferredNetworkRecordsOperationForWifiNetworkWithSignature:]( &OBJC_CLASS___THPreferredThreadNetwork,  "keyChainQueryForPreferredNetworkRecordsOperationForWifiNetworkWithSignature:",  v4));
  if (v7)
  {
    id v20 = 0LL;
    id v8 = (void *)objc_claimAutoreleasedReturnValue( -[THThreadNetworkCredentialsKeychainBackingStore _doFetchPreferredNetworks:error:]( self,  "_doFetchPreferredNetworks:error:",  v7,  &v20));
    id v9 = v20;
    if (v8)
    {
      id v10 = sub_1001768B4(1);
      uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        id v12 = [v8 count];
        id v13 = (void *)objc_claimAutoreleasedReturnValue([v4 wifiSSID]);
        uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v4 ipv4NwSignature]);
        id v15 = (void *)objc_claimAutoreleasedReturnValue([v4 ipv6NwSignature]);
        *(_DWORD *)buf = 136316418;
        int v22 = "-[THThreadNetworkCredentialsKeychainBackingStore getPrefEntriesForSSIDAndSignature:]";
        __int16 v23 = 1024;
        int v24 = 3857;
        __int16 v25 = 2048;
        id v26 = v12;
        __int16 v27 = 2112;
        __int16 v28 = v13;
        __int16 v29 = 2112;
        id v30 = v14;
        __int16 v31 = 2112;
        __int16 v32 = v15;
        _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_INFO,  "%s : %d - Preferred Networks in Database = %lu, for network ssid :(%@), and network signature(ipv4 : %@, ipv6 : %@)",  buf,  0x3Au);
      }
    }

    id v16 = v8;

    id v17 = v16;
  }

  else
  {
    id v18 = sub_1001768B4(1);
    id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_100198120();
    }
    id v17 = 0LL;
  }

  return v17;
}

- (id)getPrefEntriesForSSID:(id)a3
{
  id v4 = a3;
  id v5 = sub_1001768B4(1);
  BOOL v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    id v20 = "-[THThreadNetworkCredentialsKeychainBackingStore getPrefEntriesForSSID:]";
    __int16 v21 = 1024;
    int v22 = 3867;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%s:%d: Get preferred network for SSID", buf, 0x12u);
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[THPreferredThreadNetwork keyChainQueryForPreferredNetworkRecordsOperationForWifiNetwork:]( &OBJC_CLASS___THPreferredThreadNetwork,  "keyChainQueryForPreferredNetworkRecordsOperationForWifiNetwork:",  v4));
  if (v7)
  {
    id v18 = 0LL;
    id v8 = (void *)objc_claimAutoreleasedReturnValue( -[THThreadNetworkCredentialsKeychainBackingStore _doFetchPreferredNetworks:error:]( self,  "_doFetchPreferredNetworks:error:",  v7,  &v18));
    id v9 = v18;
    if (v8)
    {
      id v10 = sub_1001768B4(1);
      uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        id v12 = [v8 count];
        id v13 = (void *)objc_claimAutoreleasedReturnValue([v4 wifiSSID]);
        *(_DWORD *)buf = 136315906;
        id v20 = "-[THThreadNetworkCredentialsKeychainBackingStore getPrefEntriesForSSID:]";
        __int16 v21 = 1024;
        int v22 = 3877;
        __int16 v23 = 2048;
        id v24 = v12;
        __int16 v25 = 2112;
        id v26 = v13;
        _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_INFO,  "%s : %d - Preferred Networks in Database = %lu, for network ssid :(%@)",  buf,  0x26u);
      }
    }

    uint64_t v14 = v8;

    id v15 = v14;
  }

  else
  {
    id v16 = sub_1001768B4(1);
    uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_100198194(v4);
    }
    id v15 = 0LL;
  }

  return v15;
}

- (id)getPrefEntriesForSignature:(id)a3
{
  id v4 = a3;
  id v5 = sub_1001768B4(1);
  BOOL v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 ipv4NwSignature]);
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v4 ipv6NwSignature]);
    *(_DWORD *)buf = 136315906;
    __int16 v23 = "-[THThreadNetworkCredentialsKeychainBackingStore getPrefEntriesForSignature:]";
    __int16 v24 = 1024;
    int v25 = 3887;
    __int16 v26 = 2112;
    id v27 = v7;
    __int16 v28 = 2112;
    __int16 v29 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_INFO,  "%s:%d: Get preferred network for network signature(ipv4 : %@, ipv6 : %@)",  buf,  0x26u);
  }

  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[THPreferredThreadNetwork keyChainQueryForPreferredNetworkRecordsOperationForNetworkSignature:]( &OBJC_CLASS___THPreferredThreadNetwork,  "keyChainQueryForPreferredNetworkRecordsOperationForNetworkSignature:",  v4));
  if (v9)
  {
    id v21 = 0LL;
    id v10 = (void *)objc_claimAutoreleasedReturnValue( -[THThreadNetworkCredentialsKeychainBackingStore _doFetchPreferredNetworks:error:]( self,  "_doFetchPreferredNetworks:error:",  v9,  &v21));
    id v11 = v21;
    if (v10)
    {
      id v12 = sub_1001768B4(1);
      id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        id v14 = [v10 count];
        id v15 = (void *)objc_claimAutoreleasedReturnValue([v4 ipv4NwSignature]);
        id v16 = (void *)objc_claimAutoreleasedReturnValue([v4 ipv6NwSignature]);
        *(_DWORD *)buf = 136316162;
        __int16 v23 = "-[THThreadNetworkCredentialsKeychainBackingStore getPrefEntriesForSignature:]";
        __int16 v24 = 1024;
        int v25 = 3898;
        __int16 v26 = 2048;
        id v27 = v14;
        __int16 v28 = 2112;
        __int16 v29 = v15;
        __int16 v30 = 2112;
        __int16 v31 = v16;
        _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_INFO,  "%s : %d - Preferred Networks in Database = %lu, for network signature(ipv4 : %@, ipv6 : %@)",  buf,  0x30u);
      }
    }

    id v17 = v10;

    id v18 = v17;
  }

  else
  {
    id v19 = sub_1001768B4(1);
    id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      sub_100198224();
    }
    id v18 = 0LL;
  }

  return v18;
}

- (id)getAllPrefEntries
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue( +[THPreferredThreadNetwork keyChainQueryForFetchPreferredNetworkRecordsOperation]( &OBJC_CLASS___THPreferredThreadNetwork,  "keyChainQueryForFetchPreferredNetworkRecordsOperation"));
  if (v3)
  {
    id v13 = 0LL;
    id v4 = (void *)objc_claimAutoreleasedReturnValue( -[THThreadNetworkCredentialsKeychainBackingStore _doFetchPreferredNetworks:error:]( self,  "_doFetchPreferredNetworks:error:",  v3,  &v13));
    id v5 = (os_log_s *)v13;
    id v6 = sub_1001768B4(1);
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_100198380(v4);
    }

    if (v4 && [v4 count])
    {
      id v8 = v4;
    }

    else
    {
      id v9 = sub_1001768B4(1);
      id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        sub_10019830C();
      }

      id v8 = 0LL;
    }
  }

  else
  {
    id v11 = sub_1001768B4(1);
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_100198298();
    }
    id v8 = 0LL;
  }

  return v8;
}

- (id)getNumberOfPrefEntriesForTheCount:(int)a3
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[THPreferredThreadNetwork keyChainQueryForFetchPreferredNetworkRecordsOperationForTheCount:]( &OBJC_CLASS___THPreferredThreadNetwork,  "keyChainQueryForFetchPreferredNetworkRecordsOperationForTheCount:"));
  if (v5)
  {
    id v15 = 0LL;
    id v6 = (void *)objc_claimAutoreleasedReturnValue( -[THThreadNetworkCredentialsKeychainBackingStore _doFetchPreferredNetworks:error:]( self,  "_doFetchPreferredNetworks:error:",  v5,  &v15));
    id v7 = (os_log_s *)v15;
    id v8 = sub_1001768B4(1);
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_1001984E8(v6, a3, v9);
    }

    if (v6 && [v6 count])
    {
      id v10 = v6;
    }

    else
    {
      id v11 = sub_1001768B4(1);
      id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        sub_100198474();
      }

      id v10 = 0LL;
    }
  }

  else
  {
    id v13 = sub_1001768B4(1);
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_100198400();
    }
    id v10 = 0LL;
  }

  return v10;
}

- (BOOL)checkIfPrefEntryForCurrentSignatureIsMissingSSID:(id)a3 nwSignature:(id)a4
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue( -[THThreadNetworkCredentialsKeychainBackingStore getPrefEntriesForSignature:]( self,  "getPrefEntriesForSignature:",  a4));
  id v6 = v5;
  if (v5
    && [v5 count]
    && (id v7 = (void *)objc_claimAutoreleasedReturnValue( -[THThreadNetworkCredentialsKeychainBackingStore sortAndReturnPreferredNetwork:]( self,  "sortAndReturnPreferredNetwork:",  v6))) != 0LL)
  {
    id v8 = v7;
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 networkSignature]);
    unsigned __int8 v10 = -[THThreadNetworkCredentialsKeychainBackingStore wifiInfoAvailable:](self, "wifiInfoAvailable:", v9);

    char v11 = v10 ^ 1;
  }

  else
  {
    char v11 = 0;
  }

  return v11;
}

- (BOOL)updatePreferredNetwork
{
  id v3 = sub_1001768B4(1);
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v23 = 136315394;
    __int16 v24 = "-[THThreadNetworkCredentialsKeychainBackingStore updatePreferredNetwork]";
    __int16 v25 = 1024;
    int v26 = 3978;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_INFO,  "%s:%d: Update preferred NW",  (uint8_t *)&v23,  0x12u);
  }

  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[THThreadNetworkCredentialsKeychainBackingStore getNetworkSignature](self, "getNetworkSignature"));
  if (!v5)
  {
    id v10 = sub_1001768B4(1);
    char v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_100198588();
    }
    goto LABEL_29;
  }

  if (-[THThreadNetworkCredentialsKeychainBackingStore wifiInfoAvailable:](self, "wifiInfoAvailable:", v5))
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue( -[THThreadNetworkCredentialsKeychainBackingStore getPrefEntriesForSSID:]( self,  "getPrefEntriesForSSID:",  v5));
    id v7 = v6;
    if (v6 && [v6 count]
      || (v8 = objc_claimAutoreleasedReturnValue( -[THThreadNetworkCredentialsKeychainBackingStore getPrefEntriesForLabelAsSSID:]( self,  "getPrefEntriesForLabelAsSSID:",  v5)),  v7,  (id v7 = (void *)v8) != 0LL))
    {
      id v9 = v7;
      if ([v7 count]) {
        goto LABEL_14;
      }
    }
  }

  else
  {
    id v7 = 0LL;
  }

  id v9 = (id)objc_claimAutoreleasedReturnValue( -[THThreadNetworkCredentialsKeychainBackingStore getPrefEntriesForSignature:]( self,  "getPrefEntriesForSignature:",  v5));

  if (!v9)
  {
LABEL_23:
    id v19 = 0LL;
    char v11 = 0LL;
LABEL_26:
    id v20 = sub_1001768B4(1);
    id v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      int v23 = 136315394;
      __int16 v24 = "-[THThreadNetworkCredentialsKeychainBackingStore updatePreferredNetwork]";
      __int16 v25 = 1024;
      int v26 = 4035;
      _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_INFO,  "%s : %d Preferred Network update is not required",  (uint8_t *)&v23,  0x12u);
    }

LABEL_29:
    BOOL v18 = 0;
    goto LABEL_30;
  }

- (id)getPreferredNetwork:(BOOL)a3
{
  return -[THThreadNetworkCredentialsKeychainBackingStore getPreferredNetwork:skipScan:]( self,  "getPreferredNetwork:skipScan:",  a3,  0LL);
}

- (id)getPreferredNetwork:(BOOL)a3 skipScan:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  id v7 = sub_1001768B4(1);
  uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    id v70 = "-[THThreadNetworkCredentialsKeychainBackingStore getPreferredNetwork:skipScan:]";
    __int16 v71 = 1024;
    int v72 = 4045;
    __int16 v73 = 1024;
    LODWORD(v74) = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "%s:%d: Get preferred NW, onlyMdns : %d",  buf,  0x18u);
  }

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[THThreadNetworkCredentialsKeychainBackingStore getNetworkSignature](self, "getNetworkSignature"));
  if (!v9)
  {
    id v13 = sub_1001768B4(1);
    char v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_10019867C();
    }
    goto LABEL_25;
  }

  if (-[THThreadNetworkCredentialsKeychainBackingStore wifiInfoAvailable:](self, "wifiInfoAvailable:", v9))
  {
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue( -[THThreadNetworkCredentialsKeychainBackingStore getPrefEntriesForSSID:]( self,  "getPrefEntriesForSSID:",  v9));
    char v11 = v10;
    if (v10 && -[os_log_s count](v10, "count"))
    {
      uint64_t v12 = objc_claimAutoreleasedReturnValue( -[THThreadNetworkCredentialsKeychainBackingStore getPrefEntriesForSignature:]( self,  "getPrefEntriesForSignature:",  v9));
      goto LABEL_12;
    }

    uint64_t v16 = objc_claimAutoreleasedReturnValue( -[THThreadNetworkCredentialsKeychainBackingStore getPrefEntriesForLabelAsSSID:]( self,  "getPrefEntriesForLabelAsSSID:",  v9));

    uint64_t v12 = 0LL;
    uint64_t v14 = 0LL;
    id v15 = 0LL;
    char v11 = (os_log_s *)v16;
    if (v16)
    {
LABEL_12:
      uint64_t v14 = v11;
      id v15 = (void *)v12;
      if (-[os_log_s count](v11, "count")) {
        goto LABEL_14;
      }
    }
  }

  else
  {
    uint64_t v14 = 0LL;
    id v15 = 0LL;
  }

  char v11 = (os_log_s *)objc_claimAutoreleasedReturnValue( -[THThreadNetworkCredentialsKeychainBackingStore getPrefEntriesForSignature:]( self,  "getPrefEntriesForSignature:",  v9));

  if (!v11) {
    goto LABEL_21;
  }
LABEL_14:
  if (!-[os_log_s count](v11, "count"))
  {
LABEL_21:
    id v27 = sub_1001768B4(1);
    __int16 v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
    __int16 v29 = v28;
    if (v4)
    {
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
        sub_1001986F0();
      }

LABEL_25:
      __int16 v30 = 0LL;
      goto LABEL_54;
    }

    if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
    {
      id v31 = -[os_log_s count](v11, "count");
      __int16 v32 = (void *)objc_claimAutoreleasedReturnValue([v9 ipv4NwSignature]);
      __int16 v33 = (__CFString *)objc_claimAutoreleasedReturnValue([v9 ipv6NwSignature]);
      *(_DWORD *)buf = 136316162;
      id v70 = "-[THThreadNetworkCredentialsKeychainBackingStore getPreferredNetwork:skipScan:]";
      __int16 v71 = 1024;
      int v72 = 4104;
      __int16 v73 = 2048;
      id v74 = v31;
      __int16 v75 = 2112;
      __int128 v76 = v32;
      __int16 v77 = 2112;
      id v78 = v33;
      _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_INFO,  "%s : %d - Finding network on mdns and checking if it matches to any of the preferred network entry, because, at present, Preferred Networks in Database = %lu, for network signature(ipv4 : %@, ipv6 : %@)",  buf,  0x30u);
    }

    int v34 = (void *)objc_claimAutoreleasedReturnValue(-[THThreadNetworkCredentialsKeychainBackingStore getAllPrefEntries](self, "getAllPrefEntries"));
    id v35 = v34;
    if (v34 && [v34 count])
    {
      id v36 = sub_1001768B4(1);
      int v37 = (os_log_s *)objc_claimAutoreleasedReturnValue(v36);
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
        sub_1001987D8(v35);
      }

      __int16 v30 = (os_log_s *)objc_claimAutoreleasedReturnValue( -[THThreadNetworkCredentialsKeychainBackingStore sortAndReturnPreferredNetwork:onlyMdns:]( self,  "sortAndReturnPreferredNetwork:onlyMdns:",  v35,  1LL));
      if (!v30) {
        goto LABEL_53;
      }
      __int16 v38 = (os_log_s *)objc_claimAutoreleasedReturnValue( -[THThreadNetworkCredentialsKeychainBackingStore checkIfNetworkSignatureUpdateIsRequiredForPreferredNetwork:nwSignature:]( self,  "checkIfNetworkSignatureUpdateIsRequiredForPreferredNetwork:nwSignature:",  v30,  v9));
      unsigned int v39 = v38;
      if (v38)
      {
        __int128 v40 = v38;

        __int16 v30 = v40;
      }

      id v41 = sub_1001768B4(1);
      OSStatus v42 = (os_log_s *)objc_claimAutoreleasedReturnValue(v41);
      if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
      {
        id v43 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s network](v30, "network"));
        v68 = (void *)objc_claimAutoreleasedReturnValue([v43 networkName]);
        int v44 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s network](v30, "network"));
        __int128 v66 = (void *)objc_claimAutoreleasedReturnValue([v44 extendedPANID]);
        __int16 v45 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s networkSignature](v30, "networkSignature"));
        id v56 = (void *)objc_claimAutoreleasedReturnValue([v45 wifiSSID]);
        id v58 = v45;
        id v60 = v44;
        id v62 = v43;
        if (v56)
        {
          __int128 v54 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s networkSignature](v30, "networkSignature"));
          v64 = (__CFString *)objc_claimAutoreleasedReturnValue([v54 wifiSSID]);
        }

        else
        {
          v64 = &stru_1002B93F8;
        }

        uint64_t v50 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s credentialsDataSetRecord](v30, "credentialsDataSetRecord"));
        id v51 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s networkSignature](v30, "networkSignature"));
        id v52 = (void *)objc_claimAutoreleasedReturnValue([v51 wifiPassword]);
        *(_DWORD *)buf = 136316674;
        id v70 = "-[THThreadNetworkCredentialsKeychainBackingStore getPreferredNetwork:skipScan:]";
        __int16 v71 = 1024;
        int v72 = 4131;
        __int16 v73 = 2112;
        id v74 = v68;
        __int16 v75 = 2112;
        __int128 v76 = v66;
        __int16 v77 = 2112;
        id v78 = v64;
        __int16 v79 = 2048;
        __int128 v80 = v50;
        __int16 v81 = 2112;
        __int128 v82 = v52;
        _os_log_impl( (void *)&_mh_execute_header,  v42,  OS_LOG_TYPE_INFO,  "%s:%d: Returning the preferred network : (name : %@ | xpanid : %@), ssid : %@, DS Record = %p, label = %@",  buf,  0x44u);

        if (v56)
        {
        }
      }
    }

    else
    {
      id v46 = sub_1001768B4(1);
      unsigned int v39 = (os_log_s *)objc_claimAutoreleasedReturnValue(v46);
      if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR)) {
        sub_100198764();
      }
      __int16 v30 = 0LL;
    }

LABEL_53:
    goto LABEL_54;
  }

  id v17 = (void *)objc_claimAutoreleasedReturnValue( -[THThreadNetworkCredentialsKeychainBackingStore sortAndReturnPreferredNetwork:onlyMdns:]( self,  "sortAndReturnPreferredNetwork:onlyMdns:",  v11,  v5));
  if (v17)
  {
    BOOL v18 = (void *)objc_claimAutoreleasedReturnValue( -[THThreadNetworkCredentialsKeychainBackingStore checkIfNetworkSignatureUpdateIsRequiredForPreferredNetwork:nwSignature:signaturePrefEntries:]( self,  "checkIfNetworkSignatureUpdateIsRequiredForPreferredNetwork:nwSignature:signaturePrefEntries:",  v17,  v9,  v15));
    id v19 = v18;
    if (v18)
    {
      id v20 = v18;

      id v17 = v20;
    }

    id v21 = sub_1001768B4(1);
    int v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      int v23 = (void *)objc_claimAutoreleasedReturnValue([v17 network]);
      unint64_t v67 = (void *)objc_claimAutoreleasedReturnValue([v23 networkName]);
      __int16 v24 = (void *)objc_claimAutoreleasedReturnValue([v17 network]);
      id v65 = (void *)objc_claimAutoreleasedReturnValue([v24 extendedPANID]);
      __int16 v25 = (void *)objc_claimAutoreleasedReturnValue([v17 networkSignature]);
      int v26 = (void *)objc_claimAutoreleasedReturnValue([v25 wifiSSID]);
      __int16 v59 = v24;
      id v61 = v23;
      __int16 v57 = v25;
      if (v26)
      {
        __int128 v55 = (void *)objc_claimAutoreleasedReturnValue([v17 networkSignature]);
        id v63 = (__CFString *)objc_claimAutoreleasedReturnValue([v55 wifiSSID]);
      }

      else
      {
        id v63 = &stru_1002B93F8;
      }

      unsigned int v47 = (void *)objc_claimAutoreleasedReturnValue([v17 credentialsDataSetRecord]);
      id v48 = (void *)objc_claimAutoreleasedReturnValue([v17 networkSignature]);
      id v49 = (void *)objc_claimAutoreleasedReturnValue([v48 wifiPassword]);
      *(_DWORD *)buf = 136316674;
      id v70 = "-[THThreadNetworkCredentialsKeychainBackingStore getPreferredNetwork:skipScan:]";
      __int16 v71 = 1024;
      int v72 = 4092;
      __int16 v73 = 2112;
      id v74 = v67;
      __int16 v75 = 2112;
      __int128 v76 = v65;
      __int16 v77 = 2112;
      id v78 = v63;
      __int16 v79 = 2048;
      __int128 v80 = v47;
      __int16 v81 = 2112;
      __int128 v82 = v49;
      _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_INFO,  "%s:%d: Returning the preferred network : (name : %@ | xpanid : %@), ssid : %@, DS Record = %p, label = %@",  buf,  0x44u);

      if (v26)
      {
      }
    }
  }

  __int16 v30 = v17;

  char v11 = v30;
LABEL_54:

  return v30;
}

- (BOOL)DBGstorePreferred:(id)a3
{
  id v3 = a3;
  id v4 = sub_1001768B4(1);
  BOOL v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v37 = (void *)objc_claimAutoreleasedReturnValue([v3 network]);
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v37 networkName]);
    id v36 = (void *)objc_claimAutoreleasedReturnValue([v3 network]);
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v36 extendedPANID]);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v3 credentialsDataSetRecord]);
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 network]);
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 networkName]);
    id v11 = v3;
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v3 credentialsDataSetRecord]);
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 credentialsDataSet]);
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v13 dataSetArray]);
    *(_DWORD *)buf = 136316418;
    unsigned int v39 = "-[THThreadNetworkCredentialsKeychainBackingStore DBGstorePreferred:]";
    __int16 v40 = 1024;
    int v41 = 4139;
    __int16 v42 = 2112;
    id v43 = v6;
    __int16 v44 = 2112;
    __int16 v45 = v7;
    __int16 v46 = 2112;
    unsigned int v47 = v10;
    __int16 v48 = 2112;
    id v49 = v14;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_INFO,  "%s:%d:Request to store Preferred Network (networkName=%@, xpanid=%@), with record name : %@ dataset : %@",  buf,  0x3Au);

    id v3 = v11;
  }

  id v15 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue([v3 DEBUGkeyChainItemRepresentationForpreferredNetworkAddOperation]);
  uint64_t v16 = v15;
  if (!v15)
  {
    id v29 = sub_1001768B4(1);
    __int16 v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
      sub_100198858();
    }
    goto LABEL_17;
  }

  OSStatus v17 = SecItemAdd(v15, 0LL);
  if (v17 == -25299)
  {
    id v18 = sub_1001768B4(1);
    id v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      id v20 = (void *)objc_claimAutoreleasedReturnValue([v3 network]);
      id v21 = (void *)objc_claimAutoreleasedReturnValue([v20 networkName]);
      *(_DWORD *)buf = 136315650;
      unsigned int v39 = "-[THThreadNetworkCredentialsKeychainBackingStore DBGstorePreferred:]";
      __int16 v40 = 1024;
      int v41 = 4152;
      __int16 v42 = 2112;
      id v43 = v21;
      _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_INFO,  "%s:%d: Preferred network (name : %@) already exists. Updating the existing entry",  buf,  0x1Cu);
    }

    int v22 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue([v3 DEBUGkeyChainQueryForpreferredNetworkUpdateOperation]);
    int v23 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue([v3 keyChainItemRepresentationForpreferredNetworkUpdateOperation]);
    OSStatus v17 = SecItemUpdate(v22, v23);
    if (v17)
    {
      id v24 = sub_1001768B4(1);
      __int16 v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        unsigned int v39 = "-[THThreadNetworkCredentialsKeychainBackingStore DBGstorePreferred:]";
        __int16 v40 = 1024;
        int v41 = 4158;
        _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "%s:%d SecItemUpdate returned error while updating preferred network entry",  buf,  0x12u);
      }
    }
  }

  id v26 = sub_1001768B4(1);
  id v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
  __int16 v28 = v27;
  if (v17)
  {
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
      sub_10019891C();
    }
LABEL_17:
    BOOL v30 = 0;
    goto LABEL_18;
  }

  BOOL v30 = 1;
  if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
  {
    __int16 v32 = (void *)objc_claimAutoreleasedReturnValue([v3 network]);
    __int16 v33 = (void *)objc_claimAutoreleasedReturnValue([v32 networkName]);
    int v34 = (void *)objc_claimAutoreleasedReturnValue([v3 network]);
    id v35 = (void *)objc_claimAutoreleasedReturnValue([v34 extendedPANID]);
    *(_DWORD *)buf = 136315906;
    unsigned int v39 = "-[THThreadNetworkCredentialsKeychainBackingStore DBGstorePreferred:]";
    __int16 v40 = 1024;
    int v41 = 4167;
    __int16 v42 = 2112;
    id v43 = v33;
    __int16 v44 = 2112;
    __int16 v45 = v35;
    _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_INFO,  "%s:%d:#mOS:Successfully stored Preferred Network (networkName=%@, xpanid=%@)",  buf,  0x26u);
  }

- (BOOL)storePreferred:(id)a3
{
  id v3 = a3;
  id v4 = sub_1001768B4(1);
  BOOL v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v37 = (void *)objc_claimAutoreleasedReturnValue([v3 network]);
    id v6 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue([v37 networkName]);
    id v36 = (void *)objc_claimAutoreleasedReturnValue([v3 network]);
    id v7 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue([v36 extendedPANID]);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v3 credentialsDataSetRecord]);
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 network]);
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 networkName]);
    id v11 = v3;
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v3 credentialsDataSetRecord]);
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 credentialsDataSet]);
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v13 dataSetArray]);
    *(_DWORD *)buf = 136316418;
    unsigned int v39 = "-[THThreadNetworkCredentialsKeychainBackingStore storePreferred:]";
    __int16 v40 = 1024;
    int v41 = 4173;
    __int16 v42 = 2112;
    id v43 = v6;
    __int16 v44 = 2112;
    __int16 v45 = v7;
    __int16 v46 = 2112;
    unsigned int v47 = v10;
    __int16 v48 = 2112;
    id v49 = v14;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_INFO,  "%s:%d:Request to store Preferred Network (networkName=%@, xpanid=%@), with record name : %@ dataset : %@",  buf,  0x3Au);

    id v3 = v11;
  }

  id v15 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue([v3 keyChainItemRepresentationForpreferredNetworkAddOperation]);
  id v16 = sub_1001768B4(1);
  OSStatus v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
  id v18 = v17;
  if (!v15)
  {
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      sub_1001989E4();
    }
    goto LABEL_21;
  }

  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    unsigned int v39 = "-[THThreadNetworkCredentialsKeychainBackingStore storePreferred:]";
    __int16 v40 = 1024;
    int v41 = 4182;
    __int16 v42 = 2112;
    id v43 = v15;
    _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_INFO,  "%s:%d: SIA: Add keychain query dictionary keychainAddDict: %@",  buf,  0x1Cu);
  }

  OSStatus v19 = SecItemAdd(v15, 0LL);
  if (v19 == -25299)
  {
    id v20 = sub_1001768B4(1);
    id v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      sub_100198B70(v3);
    }

    int v22 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue([v3 keyChainQueryForpreferredNetworkUpdateOperation]);
    int v23 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue([v3 keyChainItemRepresentationForpreferredNetworkUpdateOperation]);
    id v24 = sub_1001768B4(1);
    __int16 v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315906;
      unsigned int v39 = "-[THThreadNetworkCredentialsKeychainBackingStore storePreferred:]";
      __int16 v40 = 1024;
      int v41 = 4193;
      __int16 v42 = 2112;
      id v43 = v22;
      __int16 v44 = 2112;
      __int16 v45 = v23;
      _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_INFO,  "%s:%d: SIU: Update keychain query dictionary keychainQueryDict: %@, representation keychainUpdateDict : %@",  buf,  0x26u);
    }

    OSStatus v19 = SecItemUpdate(v22, v23);
    if (v19)
    {
      id v26 = sub_1001768B4(1);
      id v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        unsigned int v39 = "-[THThreadNetworkCredentialsKeychainBackingStore storePreferred:]";
        __int16 v40 = 1024;
        int v41 = 4197;
        __int16 v42 = 1024;
        LODWORD(v43) = v19;
        _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_DEFAULT,  "%s:%d SecItemUpdate returned error while updating preferred network entry err=%d",  buf,  0x18u);
      }
    }
  }

  id v28 = sub_1001768B4(1);
  id v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
  id v18 = v29;
  if (v19)
  {
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
      sub_100198AA8();
    }
LABEL_21:
    BOOL v30 = 0;
    goto LABEL_22;
  }

  BOOL v30 = 1;
  if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
  {
    __int16 v32 = (void *)objc_claimAutoreleasedReturnValue([v3 network]);
    __int16 v33 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue([v32 networkName]);
    int v34 = (void *)objc_claimAutoreleasedReturnValue([v3 network]);
    id v35 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue([v34 extendedPANID]);
    *(_DWORD *)buf = 136315906;
    unsigned int v39 = "-[THThreadNetworkCredentialsKeychainBackingStore storePreferred:]";
    __int16 v40 = 1024;
    int v41 = 4206;
    __int16 v42 = 2112;
    id v43 = v33;
    __int16 v44 = 2112;
    __int16 v45 = v35;
    _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_INFO,  "%s:%d:#mOS:Successfully stored Preferred Network (networkName=%@, xpanid=%@)",  buf,  0x26u);
  }

- (BOOL)storePreferredEntryAndCheckForDup:(id)a3 isDuplicate:(int *)a4
{
  id v5 = a3;
  id v6 = sub_1001768B4(1);
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    __int16 v42 = (void *)objc_claimAutoreleasedReturnValue([v5 network]);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v42 networkName]);
    int v41 = (void *)objc_claimAutoreleasedReturnValue([v5 network]);
    id v9 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue([v41 extendedPANID]);
    id v43 = a4;
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v5 credentialsDataSetRecord]);
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 network]);
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 networkName]);
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v5 credentialsDataSetRecord]);
    id v14 = v5;
    id v15 = (void *)objc_claimAutoreleasedReturnValue([v13 credentialsDataSet]);
    id v16 = (void *)objc_claimAutoreleasedReturnValue([v15 dataSetArray]);
    *(_DWORD *)buf = 136316418;
    __int16 v45 = "-[THThreadNetworkCredentialsKeychainBackingStore storePreferredEntryAndCheckForDup:isDuplicate:]";
    __int16 v46 = 1024;
    int v47 = 4213;
    __int16 v48 = 2112;
    *(void *)id v49 = v8;
    *(_WORD *)&v49[8] = 2112;
    uint64_t v50 = v9;
    __int16 v51 = 2112;
    id v52 = v12;
    __int16 v53 = 2112;
    __int128 v54 = v16;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "%s:%d:Request to store Preferred Network (networkName=%@, xpanid=%@), with record name : %@ dataset : %@",  buf,  0x3Au);

    id v5 = v14;
    a4 = v43;
  }

  OSStatus v17 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue([v5 keyChainItemRepresentationForpreferredNetworkAddOperation]);
  id v18 = sub_1001768B4(1);
  OSStatus v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
  id v20 = v19;
  if (!v17)
  {
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      sub_100198C10();
    }
    goto LABEL_22;
  }

  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    __int16 v45 = "-[THThreadNetworkCredentialsKeychainBackingStore storePreferredEntryAndCheckForDup:isDuplicate:]";
    __int16 v46 = 1024;
    int v47 = 4222;
    __int16 v48 = 2112;
    *(void *)id v49 = v17;
    _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_INFO,  "%s:%d: SIA: Add keychain query dictionary keychainAddDict: %@",  buf,  0x1Cu);
  }

  OSStatus v21 = SecItemAdd(v17, 0LL);
  if (v21 == -25299)
  {
    id v22 = sub_1001768B4(1);
    int v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      sub_100198E10(v5);
    }

    id v24 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue([v5 keyChainQueryForpreferredNetworkUpdateOperation]);
    __int16 v25 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue([v5 keyChainItemRepresentationForpreferredNetworkUpdateOperation]);
    id v26 = sub_1001768B4(1);
    id v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315906;
      __int16 v45 = "-[THThreadNetworkCredentialsKeychainBackingStore storePreferredEntryAndCheckForDup:isDuplicate:]";
      __int16 v46 = 1024;
      int v47 = 4233;
      __int16 v48 = 2112;
      *(void *)id v49 = v24;
      *(_WORD *)&v49[8] = 2112;
      uint64_t v50 = v25;
      _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_INFO,  "%s:%d: SIU: Update keychain query dictionary keychainQueryDict: %@, representation keychainUpdateDict : %@",  buf,  0x26u);
    }

    OSStatus v21 = SecItemUpdate(v24, v25);
    if (v21)
    {
      id v28 = sub_1001768B4(1);
      id v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
        sub_100198D9C();
      }
    }

    else
    {
      *a4 = 1;
      id v30 = sub_1001768B4(1);
      id v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
      if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
      {
        int v31 = *a4;
        *(_DWORD *)buf = 136315906;
        __int16 v45 = "-[THThreadNetworkCredentialsKeychainBackingStore storePreferredEntryAndCheckForDup:isDuplicate:]";
        __int16 v46 = 1024;
        int v47 = 4240;
        __int16 v48 = 1024;
        *(_DWORD *)id v49 = 0;
        *(_WORD *)&v49[4] = 1024;
        *(_DWORD *)&v49[6] = v31;
        _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_INFO,  "%s:%d SecItemUpdate is successful in updating preferred network entry !!  (err=%d) isDuplicate : %d",  buf,  0x1Eu);
      }
    }
  }

  id v32 = sub_1001768B4(1);
  __int16 v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
  id v20 = v33;
  if (v21)
  {
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
      sub_100198CD4();
    }
LABEL_22:
    BOOL v34 = 0;
    goto LABEL_23;
  }

  BOOL v34 = 1;
  if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
  {
    id v36 = (void *)objc_claimAutoreleasedReturnValue([v5 network]);
    int v37 = v5;
    __int16 v38 = (void *)objc_claimAutoreleasedReturnValue([v36 networkName]);
    unsigned int v39 = (void *)objc_claimAutoreleasedReturnValue([v37 network]);
    __int16 v40 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue([v39 extendedPANID]);
    *(_DWORD *)buf = 136315906;
    __int16 v45 = "-[THThreadNetworkCredentialsKeychainBackingStore storePreferredEntryAndCheckForDup:isDuplicate:]";
    __int16 v46 = 1024;
    int v47 = 4250;
    __int16 v48 = 2112;
    *(void *)id v49 = v38;
    *(_WORD *)&v49[8] = 2112;
    uint64_t v50 = v40;
    _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_INFO,  "%s:%d:#mOS:Successfully stored Preferred Network (networkName=%@, xpanid=%@)",  buf,  0x26u);

    id v5 = v37;
  }

- (BOOL)storeFrozenThreadNetwork:(id)a3
{
  id v3 = a3;
  id v4 = sub_1001768B4(1);
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v3 credentialsDataSet]);
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 dataSetArray]);
    int v20 = 136315650;
    OSStatus v21 = "-[THThreadNetworkCredentialsKeychainBackingStore storeFrozenThreadNetwork:]";
    __int16 v22 = 1024;
    int v23 = 4256;
    __int16 v24 = 2112;
    __int16 v25 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_INFO,  "%s:%d: Request to freeze thread network with dataset %@",  (uint8_t *)&v20,  0x1Cu);
  }

  uint64_t v8 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue([v3 keyChainItemRepresentationForFrozenThreadNetworkAddOperation]);
  id v9 = v8;
  if (!v8)
  {
    id v14 = sub_1001768B4(1);
    id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_100198EB0(v3);
    }
    goto LABEL_14;
  }

  OSStatus v10 = SecItemAdd(v8, 0LL);
  if (v10)
  {
    if (v10 == -25299)
    {
      BOOL v11 = 1;
      id v12 = sub_1001768B4(1);
      id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        sub_100198FF0();
      }
      goto LABEL_15;
    }

    id v18 = sub_1001768B4(1);
    id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_100198F50(v3);
    }
LABEL_14:
    BOOL v11 = 0;
    goto LABEL_15;
  }

  BOOL v11 = 1;
  id v15 = sub_1001768B4(1);
  id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    id v16 = (void *)objc_claimAutoreleasedReturnValue([v3 credentialsDataSet]);
    OSStatus v17 = (void *)objc_claimAutoreleasedReturnValue([v16 dataSetArray]);
    int v20 = 136315650;
    OSStatus v21 = "-[THThreadNetworkCredentialsKeychainBackingStore storeFrozenThreadNetwork:]";
    __int16 v22 = 1024;
    int v23 = 4278;
    __int16 v24 = 2112;
    __int16 v25 = v17;
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_INFO,  "%s:%d: Successfully stored frozen thread network to keychain : %@",  (uint8_t *)&v20,  0x1Cu);
  }

- (BOOL)isWiFiNetwork
{
  id v2 = [[NWPathEvaluator alloc] initWithEndpoint:0 parameters:0];
  if (v2)
  {
    id v3 = v2;
    id v4 = (void *)objc_claimAutoreleasedReturnValue([v2 path]);
    unsigned __int8 v5 = [v4 usesInterfaceType:1];

    LOBYTE(v2) = v5;
  }

  return (char)v2;
}

- (BOOL)isEthernetNetwork
{
  id v2 = [[NWPathEvaluator alloc] initWithEndpoint:0 parameters:0];
  if (v2)
  {
    id v3 = v2;
    id v4 = (void *)objc_claimAutoreleasedReturnValue([v2 path]);
    unsigned __int8 v5 = [v4 usesInterfaceType:3];

    LOBYTE(v2) = v5;
  }

  return (char)v2;
}

- (id)getNetworkSignature
{
  unsigned __int8 v55 = 20;
  unsigned __int8 v54 = 20;
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
  [v3 getUUIDBytes:v70];

  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
  [v4 getUUIDBytes:v69];

  uint64_t v5 = objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:", v70, 20LL));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:", v69, 20LL));
  id v7 = sub_1001768B4(1);
  uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    id v58 = "-[THThreadNetworkCredentialsKeychainBackingStore getNetworkSignature]";
    __int16 v59 = 1024;
    int v60 = 4336;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_INFO,  "%s:%d Entered to get the nw signature ",  buf,  0x12u);
  }

  unsigned int v9 = -[THThreadNetworkCredentialsKeychainBackingStore isEthernetNetwork](self, "isEthernetNetwork");
  if (v9)
  {
    id v10 = sub_1001768B4(1);
    BOOL v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      id v58 = "-[THThreadNetworkCredentialsKeychainBackingStore getNetworkSignature]";
      __int16 v59 = 1024;
      int v60 = 4343;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%s:%d Device is on Ethernet", buf, 0x12u);
    }
  }

  if (-[THThreadNetworkCredentialsKeychainBackingStore isWiFiNetwork](self, "isWiFiNetwork"))
  {
    id v13 = sub_1001768B4(1);
    id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      id v58 = "-[THThreadNetworkCredentialsKeychainBackingStore getNetworkSignature]";
      __int16 v59 = 1024;
      int v60 = 4348;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%s:%d Device is on WiFi", buf, 0x12u);
    }
  }

  else if (v9 != 1)
  {
    id v49 = sub_1001768B4(1);
    id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v49);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_1001990D8();
    }
    __int16 v44 = 0LL;
    goto LABEL_59;
  }

  id v52 = v6;
  uint64_t v53 = v5;
  int v15 = 0;
  id v16 = 0LL;
  LOBYTE(v5) = 0;
  char v17 = 0;
  *(void *)&__int128 v12 = 136315906LL;
  __int128 v51 = v12;
  do
  {
    id v18 = v16;
    if (v15) {
      sleep(2u);
    }
    id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[NetworkPathFinder getNetworkPath](&OBJC_CLASS___NetworkPathFinder, "getNetworkPath", v51));

    id v19 = sub_1001768B4(1);
    int v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
    OSStatus v21 = v20;
    if (v16)
    {
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        id v58 = "-[THThreadNetworkCredentialsKeychainBackingStore getNetworkSignature]";
        __int16 v59 = 1024;
        int v60 = 4369;
        __int16 v61 = 2112;
        *(void *)id v62 = v16;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "%s:%d Network path = %@", buf, 0x1Cu);
      }

      OSStatus v21 = (os_log_s *)nw_path_copy_interface(v16);
      has_ipid v4 = nw_path_has_ipv4(v16);
      has_ipid v6 = nw_path_has_ipv6(v16);
      id v24 = sub_1001768B4(1);
      __int16 v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316418;
        id v58 = "-[THThreadNetworkCredentialsKeychainBackingStore getNetworkSignature]";
        __int16 v59 = 1024;
        int v60 = 4374;
        __int16 v61 = 2112;
        *(void *)id v62 = v21;
        *(_WORD *)&v62[8] = 1024;
        *(_DWORD *)&v62[10] = has_ipv4;
        __int16 v63 = 1024;
        int v64 = has_ipv6;
        __int16 v65 = 1024;
        LODWORD(v66) = v15;
        _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "%s:%d Network path Interface = %@, has_ipv4 = %d, has_ipid v6 = %d, retry : %d",  buf,  0x2Eu);
      }

      if (!has_ipv4 && !has_ipv6)
      {
        id v28 = sub_1001768B4(1);
        id v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
        if (!os_log_type_enabled((os_log_t)v29, OS_LOG_TYPE_ERROR))
        {
LABEL_38:

          goto LABEL_39;
        }

        *(_DWORD *)buf = 136315394;
        id v58 = "-[THThreadNetworkCredentialsKeychainBackingStore getNetworkSignature]";
        __int16 v59 = 1024;
        int v60 = 4377;
        id v30 = (os_log_s *)v29;
        int v31 = "%s:%d Error : doesn't have ipv4 and ipv6 network signatures, retrying...";
LABEL_34:
        _os_log_error_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, v31, buf, 0x12u);
        goto LABEL_38;
      }

      LODWORD(v5) = nw_path_get_ipv4_network_signature(v16, v72, &v55);
      int ipv6_network_signature = nw_path_get_ipv6_network_signature(v16, v71, &v54);
      char v17 = ipv6_network_signature;
      if ((_DWORD)v5)
      {
        if ((ipv6_network_signature & 1) == 0)
        {
          int v27 = 0;
          unsigned __int8 v54 = 0;
          goto LABEL_30;
        }
      }

      else
      {
        unsigned __int8 v55 = 0;
        if (!ipv6_network_signature)
        {
          unsigned __int8 v54 = 0;
          id v34 = sub_1001768B4(1);
          id v29 = (void *)objc_claimAutoreleasedReturnValue(v34);
          if (os_log_type_enabled((os_log_t)v29, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v51;
            id v58 = "-[THThreadNetworkCredentialsKeychainBackingStore getNetworkSignature]";
            __int16 v59 = 1024;
            int v60 = 4389;
            __int16 v61 = 1024;
            *(_DWORD *)id v62 = 0;
            *(_WORD *)&v62[4] = 1024;
            *(_DWORD *)&v62[6] = 0;
            _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)v29,  OS_LOG_TYPE_ERROR,  "%s:%d Error : doesn't have the correct ipv4 [ret = %d] and ipv6 [ret = %d] network signatures, retrying..",  buf,  0x1Eu);
            char v17 = 0;
          }

          LOBYTE(v5) = 0;
          goto LABEL_38;
        }
      }

      int v27 = v54;
LABEL_30:
      int v32 = 1;
      if (v55 || v27) {
        goto LABEL_43;
      }
      id v33 = sub_1001768B4(1);
      id v29 = (void *)objc_claimAutoreleasedReturnValue(v33);
      if (!os_log_type_enabled((os_log_t)v29, OS_LOG_TYPE_ERROR)) {
        goto LABEL_38;
      }
      *(_DWORD *)buf = 136315394;
      id v58 = "-[THThreadNetworkCredentialsKeychainBackingStore getNetworkSignature]";
      __int16 v59 = 1024;
      int v60 = 4394;
      id v30 = (os_log_s *)v29;
      int v31 = "%s:%d Error : ipv4 and ipv6 network signature length is zero, retrying";
      goto LABEL_34;
    }

    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      id v58 = "-[THThreadNetworkCredentialsKeychainBackingStore getNetworkSignature]";
      __int16 v59 = 1024;
      int v60 = 4365;
      _os_log_error_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_ERROR,  "%s:%d Failed to create Network Path Finder",  buf,  0x12u);
    }

- (void)dispatchRemoveInActiveRecords:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_autoreleasePoolPush();
  id v6 = sub_1001768B4(1);
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v4 network]);
    unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue([v8 networkName]);
    *(_DWORD *)buf = 136315650;
    id v70 = "-[THThreadNetworkCredentialsKeychainBackingStore dispatchRemoveInActiveRecords:]";
    __int16 v71 = 1024;
    *(_DWORD *)int v72 = 4440;
    *(_WORD *)&v72[4] = 2112;
    *(void *)&v72[6] = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "%s:%d: Remove inactive records for Preferred network Network Name : %@",  buf,  0x1Cu);
  }

  id v10 = (void *)objc_claimAutoreleasedReturnValue([v4 network]);
  BOOL v11 = (void *)objc_claimAutoreleasedReturnValue( +[THThreadNetworkCredentialsActiveDataSetRecord keyChainQueryForFetchActiveDataSetRecordsOperationForNetwork:]( &OBJC_CLASS___THThreadNetworkCredentialsActiveDataSetRecord,  "keyChainQueryForFetchActiveDataSetRecordsOperationForNetwork:",  v10));

  id v67 = 0LL;
  __int128 v12 = (void *)objc_claimAutoreleasedReturnValue( -[THThreadNetworkCredentialsKeychainBackingStore _doFetchActiveDataSetRecords:error:]( self,  "_doFetchActiveDataSetRecords:error:",  v11,  &v67));
  id v13 = v67;
  id v14 = sub_1001768B4(1);
  int v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    id v16 = [v12 count];
    *(_DWORD *)buf = 136315650;
    id v70 = "-[THThreadNetworkCredentialsKeychainBackingStore dispatchRemoveInActiveRecords:]";
    __int16 v71 = 1024;
    *(_DWORD *)int v72 = 4449;
    *(_WORD *)&v72[4] = 2048;
    *(void *)&v72[6] = v16;
    _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "%s:%d: : Size of record list : %lu",  buf,  0x1Cu);
  }

  id v62 = v12;
  if ((unint64_t)[v12 count] > 1)
  {
    __int16 v59 = v5;
    id v60 = v13;
    __int16 v61 = v11;
    if ((unint64_t)[v12 count] >= 0x191)
    {
      OSStatus v21 = (void *)objc_claimAutoreleasedReturnValue([v12 allObjects]);
      __int16 v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithArray:](&OBJC_CLASS___NSMutableArray, "arrayWithArray:", v21));

      if (v22)
      {
        id v23 = sub_1001768B4(1);
        id v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
        if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315394;
          id v70 = "-[THThreadNetworkCredentialsKeychainBackingStore dispatchRemoveInActiveRecords:]";
          __int16 v71 = 1024;
          *(_DWORD *)int v72 = 4466;
          _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_INFO,  "%s:%d: Deleting excess active dataset record",  buf,  0x12u);
        }

        [v22 sortUsingComparator:&stru_1002B5340];
        if ([v12 count] != (id)400)
        {
          __int16 v25 = 0LL;
          do
          {
            id v26 = (void *)objc_claimAutoreleasedReturnValue([v22 objectAtIndexedSubscript:v25]);
            int v27 = (void *)objc_claimAutoreleasedReturnValue([v26 borderAgent]);
            id v28 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue( +[THThreadNetworkCredentialsActiveDataSetRecord keyChainQueryForDeleteActiveDataSetOperationForThreadNetworkBorderAgent:]( &OBJC_CLASS___THThreadNetworkCredentialsActiveDataSetRecord,  "keyChainQueryForDeleteActiveDataSetOperationForThreadNetworkBorderAgent:",  v27));

            if (v28)
            {
              OSStatus v29 = SecItemDelete(v28);
              id v30 = sub_1001768B4(1);
              int v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
              if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
              {
                int v32 = (void *)objc_claimAutoreleasedReturnValue([v22 objectAtIndexedSubscript:0]);
                id v33 = (void *)objc_claimAutoreleasedReturnValue([v32 borderAgent]);
                id v34 = (void *)objc_claimAutoreleasedReturnValue([v33 discriminatorId]);
                *(_DWORD *)buf = 136315650;
                id v70 = "-[THThreadNetworkCredentialsKeychainBackingStore dispatchRemoveInActiveRecords:]";
                __int16 v71 = 2112;
                *(void *)int v72 = v34;
                *(_WORD *)&v72[8] = 1024;
                *(_DWORD *)&v72[10] = v29;
                _os_log_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_INFO,  "%s : Deleting excess record BA ID : %@, got on deletion : (err=%d)",  buf,  0x1Cu);

                __int128 v12 = v62;
              }
            }

            ++v25;
          }

          while (v25 < (char *)[v12 count] - 400);
        }
      }

      id v13 = v60;
      BOOL v11 = v61;
    }

    __int128 v65 = 0u;
    __int128 v66 = 0u;
    __int128 v63 = 0u;
    __int128 v64 = 0u;
    id v18 = v12;
    id v35 = [v18 countByEnumeratingWithState:&v63 objects:v68 count:16];
    if (v35)
    {
      id v36 = v35;
      uint64_t v37 = *(void *)v64;
      id v38 = &AWDPostMetric_ptr;
      do
      {
        for (i = 0LL; i != v36; i = (char *)i + 1)
        {
          if (*(void *)v64 != v37) {
            objc_enumerationMutation(v18);
          }
          __int16 v40 = *(void **)(*((void *)&v63 + 1) + 8LL * (void)i);
          uint64_t v41 = (void *)objc_claimAutoreleasedReturnValue([v40 credentials]);
          unsigned __int8 v42 = [v41 isActiveDevice];

          if ((v42 & 1) == 0)
          {
            id v43 = (void *)objc_claimAutoreleasedReturnValue([v40 borderAgent]);
            __int16 v44 = (void *)objc_claimAutoreleasedReturnValue([v43 discriminatorId]);

            if (v44)
            {
              id v45 = v38[148];
              __int16 v46 = (void *)objc_claimAutoreleasedReturnValue([v40 borderAgent]);
              int v47 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue( [v45 keyChainQueryForDeleteActiveDataSetOperationForThreadNetworkBorderAgent:v46]);

              if (v47)
              {
                OSStatus v48 = SecItemDelete(v47);
                id v49 = sub_1001768B4(1);
                uint64_t v50 = (os_log_s *)objc_claimAutoreleasedReturnValue(v49);
                if (os_log_type_enabled(v50, OS_LOG_TYPE_INFO))
                {
                  __int128 v51 = (void *)objc_claimAutoreleasedReturnValue([v40 borderAgent]);
                  id v52 = (void *)objc_claimAutoreleasedReturnValue([v51 discriminatorId]);
                  *(_DWORD *)buf = 136315650;
                  id v70 = "-[THThreadNetworkCredentialsKeychainBackingStore dispatchRemoveInActiveRecords:]";
                  __int16 v71 = 2112;
                  *(void *)int v72 = v52;
                  *(_WORD *)&v72[8] = 1024;
                  *(_DWORD *)&v72[10] = v48;
                  _os_log_impl( (void *)&_mh_execute_header,  v50,  OS_LOG_TYPE_INFO,  "%s : BA ID : %@, got on deletion : (err=%d)",  buf,  0x1Cu);

                  id v38 = &AWDPostMetric_ptr;
                }
              }

              else
              {
                id v56 = sub_1001768B4(1);
                uint64_t v50 = (os_log_s *)objc_claimAutoreleasedReturnValue(v56);
                if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
                {
                  __int16 v57 = (void *)objc_claimAutoreleasedReturnValue([v40 network]);
                  id v58 = (void *)objc_claimAutoreleasedReturnValue([v57 networkName]);
                  *(_DWORD *)buf = 136315394;
                  id v70 = "-[THThreadNetworkCredentialsKeychainBackingStore dispatchRemoveInActiveRecords:]";
                  __int16 v71 = 2112;
                  *(void *)int v72 = v58;
                  _os_log_error_impl( (void *)&_mh_execute_header,  v50,  OS_LOG_TYPE_ERROR,  "%s : Could not form Keychain Query for Network : %@, continue..",  buf,  0x16u);
                }
              }
            }

            else
            {
              id v53 = sub_1001768B4(1);
              int v47 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue(v53);
              if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
              {
                unsigned __int8 v54 = (void *)objc_claimAutoreleasedReturnValue([v40 network]);
                unsigned __int8 v55 = (void *)objc_claimAutoreleasedReturnValue([v54 networkName]);
                *(_DWORD *)buf = 136315394;
                id v70 = "-[THThreadNetworkCredentialsKeychainBackingStore dispatchRemoveInActiveRecords:]";
                __int16 v71 = 2112;
                *(void *)int v72 = v55;
                _os_log_impl( (void *)&_mh_execute_header,  v47,  OS_LOG_TYPE_INFO,  "%s : Border Agent DiscriminatorId is Nil.. for Network : %@, continue..",  buf,  0x16u);
              }
            }
          }
        }

        id v36 = [v18 countByEnumeratingWithState:&v63 objects:v68 count:16];
      }

      while (v36);
      uint64_t v5 = v59;
      id v13 = v60;
      BOOL v11 = v61;
    }
  }

  else
  {
    id v17 = sub_1001768B4(1);
    id v18 = (id)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled((os_log_t)v18, OS_LOG_TYPE_DEFAULT))
    {
      id v19 = (void *)objc_claimAutoreleasedReturnValue([v4 network]);
      int v20 = (void *)objc_claimAutoreleasedReturnValue([v19 networkName]);
      *(_DWORD *)buf = 136315650;
      id v70 = "-[THThreadNetworkCredentialsKeychainBackingStore dispatchRemoveInActiveRecords:]";
      __int16 v71 = 1024;
      *(_DWORD *)int v72 = 4453;
      *(_WORD *)&v72[4] = 2112;
      *(void *)&v72[6] = v20;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v18,  OS_LOG_TYPE_DEFAULT,  "%s:%d: Skip clearing it: %@",  buf,  0x1Cu);
    }
  }

  objc_autoreleasePoolPop(v5);
}

- (void)dispatchRemoveExcessPreferredEntry
{
  id v3 = sub_1001768B4(1);
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    id v26 = "-[THThreadNetworkCredentialsKeychainBackingStore dispatchRemoveExcessPreferredEntry]";
    __int16 v27 = 1024;
    int v28 = 4523;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_INFO,  "%s:%d: Remove Excess preferred network entry",  buf,  0x12u);
  }

  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[THPreferredThreadNetwork keyChainQueryForFetchPreferredNetworkRecordsOperation]( &OBJC_CLASS___THPreferredThreadNetwork,  "keyChainQueryForFetchPreferredNetworkRecordsOperation"));
  if (v5)
  {
    uint64_t v24 = 0LL;
    id v6 = (void *)objc_claimAutoreleasedReturnValue( -[THThreadNetworkCredentialsKeychainBackingStore _doFetchPreferredNetworks:error:]( self,  "_doFetchPreferredNetworks:error:",  v5,  &v24));
    if (v6)
    {
      id v7 = sub_1001768B4(1);
      uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        sub_100199234(v6);
      }

      if ((unint64_t)[v6 count] >= 0xC9)
      {
        unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue([v6 allObjects]);
        id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithArray:](&OBJC_CLASS___NSMutableArray, "arrayWithArray:", v9));

        if (v10)
        {
          [v10 sortUsingComparator:&stru_1002B5360];
          id v11 = sub_1001768B4(1);
          __int128 v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
          if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 136315394;
            id v26 = "-[THThreadNetworkCredentialsKeychainBackingStore dispatchRemoveExcessPreferredEntry]";
            __int16 v27 = 1024;
            int v28 = 4573;
            _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_INFO,  "%s:%d: Deleting excess preferred entry",  buf,  0x12u);
          }

          if ([v6 count] != (id)200)
          {
            id v14 = 0LL;
            *(void *)&__int128 v13 = 136315650LL;
            __int128 v23 = v13;
            do
            {
              int v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectAtIndexedSubscript:", 0, v23));
              id v16 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue( +[THPreferredThreadNetwork keyChainQueryForDeletePreferredNetworkRecord:]( &OBJC_CLASS___THPreferredThreadNetwork,  "keyChainQueryForDeletePreferredNetworkRecord:",  v15));

              if (v16)
              {
                OSStatus v17 = SecItemDelete(v16);
                id v18 = sub_1001768B4(1);
                id v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
                if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = v23;
                  id v26 = "-[THThreadNetworkCredentialsKeychainBackingStore dispatchRemoveExcessPreferredEntry]";
                  __int16 v27 = 1024;
                  int v28 = 4582;
                  __int16 v29 = 1024;
                  OSStatus v30 = v17;
                  _os_log_error_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_ERROR,  "%s:%d: Deleting excess preferred entry, got on deletion : (err=%d)",  buf,  0x18u);
                }
              }

              ++v14;
            }

            while (v14 < (char *)[v6 count] - 200);
          }
        }

        else
        {
          id v21 = sub_1001768B4(1);
          __int16 v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
            sub_1001991C0();
          }
        }
      }
    }
  }

  else
  {
    id v20 = sub_1001768B4(1);
    id v6 = (void *)objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled((os_log_t)v6, OS_LOG_TYPE_ERROR)) {
      sub_10019914C();
    }
  }
}

- (id)getPreferredNetworkWithRecords
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue( -[THThreadNetworkCredentialsKeychainBackingStore getPreferredNetwork:]( self,  "getPreferredNetwork:",  0LL));
  id v4 = v3;
  if (v3)
  {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v3 credentialsDataSetRecord]);

    id v6 = sub_1001768B4(1);
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_INFO);
    if (v5)
    {
      if (v8)
      {
        id v43 = (void *)objc_claimAutoreleasedReturnValue([v4 network]);
        unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue([v43 networkName]);
        unsigned __int8 v42 = (void *)objc_claimAutoreleasedReturnValue([v4 network]);
        id v10 = (void *)objc_claimAutoreleasedReturnValue([v42 extendedPANID]);
        id v11 = (void *)objc_claimAutoreleasedReturnValue([v4 credentialsDataSetRecord]);
        __int128 v12 = (void *)objc_claimAutoreleasedReturnValue([v11 network]);
        __int128 v13 = (void *)objc_claimAutoreleasedReturnValue([v12 networkName]);
        id v14 = (void *)objc_claimAutoreleasedReturnValue([v4 credentialsDataSetRecord]);
        int v15 = (void *)objc_claimAutoreleasedReturnValue([v14 credentialsDataSet]);
        id v16 = (void *)objc_claimAutoreleasedReturnValue([v15 dataSetArray]);
        *(_DWORD *)buf = 136316418;
        __int16 v46 = "-[THThreadNetworkCredentialsKeychainBackingStore getPreferredNetworkWithRecords]";
        __int16 v47 = 1024;
        *(_DWORD *)OSStatus v48 = 4598;
        *(_WORD *)&v48[4] = 2112;
        *(void *)&v48[6] = v9;
        __int16 v49 = 2112;
        uint64_t v50 = v10;
        __int16 v51 = 2112;
        id v52 = v13;
        __int16 v53 = 2112;
        unsigned __int8 v54 = v16;
        _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "%s:%d: This preferred network entry has record associated with it, returning the same preferred network : (net workName=%@, xpanid=%@), with record name : %@ dataset : %@",  buf,  0x3Au);
      }

      id v17 = v4;
      goto LABEL_26;
    }

    if (v8)
    {
      id v20 = (void *)objc_claimAutoreleasedReturnValue([v4 network]);
      id v21 = (void *)objc_claimAutoreleasedReturnValue([v20 networkName]);
      __int16 v22 = (void *)objc_claimAutoreleasedReturnValue([v4 network]);
      __int128 v23 = (void *)objc_claimAutoreleasedReturnValue([v22 extendedPANID]);
      *(_DWORD *)buf = 136315906;
      __int16 v46 = "-[THThreadNetworkCredentialsKeychainBackingStore getPreferredNetworkWithRecords]";
      __int16 v47 = 1024;
      *(_DWORD *)OSStatus v48 = 4606;
      *(_WORD *)&v48[4] = 2112;
      *(void *)&v48[6] = v21;
      __int16 v49 = 2112;
      uint64_t v50 = v23;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "%s : %d - Request to check how many active dataset records are present for preferred network (name=%@, xpanid=%@)",  buf,  0x26u);
    }

    uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue([v4 network]);
    __int16 v25 = (void *)objc_claimAutoreleasedReturnValue( +[THThreadNetworkCredentialsActiveDataSetRecord keyChainQueryForFetchActiveDataSetRecordsOperationForNetwork:]( &OBJC_CLASS___THThreadNetworkCredentialsActiveDataSetRecord,  "keyChainQueryForFetchActiveDataSetRecordsOperationForNetwork:",  v24));

    id v44 = 0LL;
    id v26 = (void *)objc_claimAutoreleasedReturnValue( -[THThreadNetworkCredentialsKeychainBackingStore _doFetchActiveDataSetRecords:error:]( self,  "_doFetchActiveDataSetRecords:error:",  v25,  &v44));
    id v27 = v44;
    id v28 = sub_1001768B4(1);
    __int16 v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
    {
      id v30 = [v26 count];
      *(_DWORD *)buf = 136315650;
      __int16 v46 = "-[THThreadNetworkCredentialsKeychainBackingStore getPreferredNetworkWithRecords]";
      __int16 v47 = 1024;
      *(_DWORD *)OSStatus v48 = 4613;
      *(_WORD *)&v48[4] = 2048;
      *(void *)&v48[6] = v30;
      _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_INFO,  "%s:%d: Preferred Network present and the matching Active dataset records size is: %lu",  buf,  0x1Cu);
    }

    if ([v26 count])
    {
      id v17 = v4;
LABEL_25:

      goto LABEL_26;
    }

    int v31 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue( +[THPreferredThreadNetwork keyChainQueryForDeletePreferredNetworkRecord:]( &OBJC_CLASS___THPreferredThreadNetwork,  "keyChainQueryForDeletePreferredNetworkRecord:",  v4));
    int v32 = v31;
    if (v31)
    {
      OSStatus v33 = SecItemDelete(v31);
      id v34 = sub_1001768B4(1);
      id v35 = (os_log_s *)objc_claimAutoreleasedReturnValue(v34);
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
      {
        id v36 = (void *)objc_claimAutoreleasedReturnValue([v4 network]);
        uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue([v36 networkName]);
        *(_DWORD *)buf = 136315650;
        __int16 v46 = "-[THThreadNetworkCredentialsKeychainBackingStore getPreferredNetworkWithRecords]";
        __int16 v47 = 2112;
        *(void *)OSStatus v48 = v37;
        *(_WORD *)&v48[8] = 1024;
        *(_DWORD *)&v48[10] = v33;
        _os_log_impl( (void *)&_mh_execute_header,  v35,  OS_LOG_TYPE_DEFAULT,  "%s: Preferred Network : %@, Deletion result :(err=%d)",  buf,  0x1Cu);
      }

      if (!v33) {
        goto LABEL_24;
      }
      id v38 = sub_1001768B4(1);
      unsigned int v39 = (os_log_s *)objc_claimAutoreleasedReturnValue(v38);
      if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR)) {
        sub_10019939C(v4, v39);
      }
    }

    else
    {
      id v40 = sub_1001768B4(1);
      unsigned int v39 = (os_log_s *)objc_claimAutoreleasedReturnValue(v40);
      if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR)) {
        sub_100199328();
      }
    }

LABEL_24:
    id v17 = 0LL;
    goto LABEL_25;
  }

  id v18 = sub_1001768B4(1);
  id v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
    sub_1001992B4();
  }

  id v17 = 0LL;
LABEL_26:

  return v17;
}

- (BOOL)updatePreferredNetworkEntry:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (!v4 || (uint64_t v6 = objc_claimAutoreleasedReturnValue([v4 credentialsDataSet])) == 0)
  {
LABEL_14:
    id v36 = sub_1001768B4(1);
    id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v36);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_100199430();
    }
    goto LABEL_16;
  }

  id v7 = (void *)v6;
  BOOL v8 = (void *)objc_claimAutoreleasedReturnValue([v5 credentialsDataSet]);
  uint64_t v9 = objc_claimAutoreleasedReturnValue([v8 dataSetArray]);
  if (!v9)
  {

    goto LABEL_14;
  }

  id v10 = (void *)v9;
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v5 credentialsDataSet]);
  __int128 v12 = (void *)objc_claimAutoreleasedReturnValue([v11 dataSetArray]);
  id v13 = [v12 length];

  if (!v13) {
    goto LABEL_14;
  }
  id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue( -[THThreadNetworkCredentialsKeychainBackingStore getPreferredNetwork:]( self,  "getPreferredNetwork:",  0LL));
  if (v14)
  {
    int v15 = (void *)objc_claimAutoreleasedReturnValue([v5 network]);
    id v16 = (void *)objc_claimAutoreleasedReturnValue([v5 borderAgent]);
    id v17 = (void *)objc_claimAutoreleasedReturnValue( -[THThreadNetworkCredentialsKeychainBackingStore getActiveDataSetRecordForNetworkAndBorderAgentId:borderAgent:]( self,  "getActiveDataSetRecordForNetworkAndBorderAgentId:borderAgent:",  v15,  v16));

    id v18 = objc_alloc(&OBJC_CLASS___THPreferredThreadNetwork);
    id v19 = (void *)objc_claimAutoreleasedReturnValue([v17 network]);
    id v20 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s networkSignature](v14, "networkSignature"));
    id v21 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s userInfo](v14, "userInfo"));
    __int16 v22 = -[THPreferredThreadNetwork initWithThreadNetwork:networkSignature:credentialsDataSetRecord:creationDate:lastModificationDate:userInfo:]( v18,  "initWithThreadNetwork:networkSignature:credentialsDataSetRecord:creationDate:lastModificationDate:userInfo:",  v19,  v20,  v17,  0LL,  0LL,  v21);

    if (v22)
    {
      unsigned int v23 = -[THThreadNetworkCredentialsKeychainBackingStore storePreferred:](self, "storePreferred:", v22);
      id v24 = sub_1001768B4(1);
      __int16 v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
      id v26 = v25;
      if (v23)
      {
        if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
        {
          id v27 = (void *)objc_claimAutoreleasedReturnValue(-[THPreferredThreadNetwork network](v22, "network"));
          id v28 = (void *)objc_claimAutoreleasedReturnValue([v27 networkName]);
          *(_DWORD *)buf = 136315650;
          __int16 v46 = "-[THThreadNetworkCredentialsKeychainBackingStore updatePreferredNetworkEntry:]";
          __int16 v47 = 1024;
          int v48 = 4665;
          __int16 v49 = 2112;
          uint64_t v50 = v28;
          _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_INFO,  "%s:%d: Updated Preferred Network with the name : %@",  buf,  0x1Cu);
        }

        __int16 v29 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s network](v14, "network"));
        id v30 = (void *)objc_claimAutoreleasedReturnValue([v29 networkName]);
        int v31 = (void *)objc_claimAutoreleasedReturnValue([v5 network]);
        int v32 = (void *)objc_claimAutoreleasedReturnValue([v31 networkName]);
        if ([v30 isEqualToString:v32])
        {
          unsigned __int8 v42 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s network](v14, "network"));
          id v44 = v29;
          OSStatus v33 = (void *)objc_claimAutoreleasedReturnValue([v42 extendedPANID]);
          id v34 = (void *)objc_claimAutoreleasedReturnValue([v5 network]);
          id v43 = v30;
          id v35 = (void *)objc_claimAutoreleasedReturnValue([v34 extendedPANID]);
          unsigned __int8 v41 = [v33 isEqualToData:v35];

          if ((v41 & 1) != 0) {
            goto LABEL_27;
          }
        }

        else
        {
        }

        if (-[THThreadNetworkCredentialsKeychainBackingStore deletePreferredNetworkEntry:]( self,  "deletePreferredNetworkEntry:",  v14))
        {
LABEL_27:
          BOOL v37 = 1;
          goto LABEL_24;
        }

        BOOL v37 = 1;
        id v40 = sub_1001768B4(1);
        id v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v40);
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
          sub_100199518();
        }
LABEL_23:

LABEL_24:
        goto LABEL_17;
      }

      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
        sub_1001995DC();
      }
    }

    else
    {
      id v39 = sub_1001768B4(1);
      id v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v39);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
        sub_1001994A4();
      }
    }

    BOOL v37 = 0;
    goto LABEL_23;
  }

- (BOOL)updateRecordToPreferredNetworkEntry:(id)a3 credentialsDataSetRecord:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = v7;
  if (!v7 || (uint64_t v9 = objc_claimAutoreleasedReturnValue([v7 credentialsDataSet])) == 0)
  {
LABEL_18:
    id v54 = sub_1001768B4(1);
    __int16 v53 = (os_log_s *)objc_claimAutoreleasedReturnValue(v54);
    if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR)) {
      sub_100199650();
    }
    goto LABEL_20;
  }

  id v10 = (void *)v9;
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v8 credentialsDataSet]);
  uint64_t v12 = objc_claimAutoreleasedReturnValue([v11 dataSetArray]);
  if (!v12)
  {

    goto LABEL_18;
  }

  id v13 = (void *)v12;
  id v14 = (void *)objc_claimAutoreleasedReturnValue([v8 credentialsDataSet]);
  int v15 = (void *)objc_claimAutoreleasedReturnValue([v14 dataSetArray]);
  id v16 = [v15 length];

  if (!v16) {
    goto LABEL_18;
  }
  v99 = self;
  id v17 = (void *)objc_claimAutoreleasedReturnValue([v6 network]);
  id v18 = (void *)objc_claimAutoreleasedReturnValue([v17 networkName]);
  id v19 = (void *)objc_claimAutoreleasedReturnValue([v8 network]);
  id v20 = (void *)objc_claimAutoreleasedReturnValue([v19 networkName]);
  if (![v18 isEqualToString:v20])
  {

    goto LABEL_23;
  }

  id v21 = (void *)objc_claimAutoreleasedReturnValue([v6 network]);
  __int16 v22 = (void *)objc_claimAutoreleasedReturnValue([v21 extendedPANID]);
  v98 = v6;
  unsigned int v23 = (void *)objc_claimAutoreleasedReturnValue([v8 network]);
  id v24 = (void *)objc_claimAutoreleasedReturnValue([v23 extendedPANID]);
  unsigned int v25 = [v22 isEqualToData:v24];

  id v6 = v98;
  if (!v25)
  {
LABEL_23:
    id v56 = (void *)objc_claimAutoreleasedReturnValue([v6 network]);
    __int16 v57 = (void *)objc_claimAutoreleasedReturnValue([v8 borderAgent]);
    id v58 = v99;
    __int16 v53 = (os_log_s *)objc_claimAutoreleasedReturnValue( -[THThreadNetworkCredentialsKeychainBackingStore getActiveDataSetRecordForNetworkAndBorderAgentId:borderAgent:]( v99,  "getActiveDataSetRecordForNetworkAndBorderAgentId:borderAgent:",  v56,  v57));

    if (!v53)
    {
LABEL_50:
      BOOL v51 = 1;
      goto LABEL_21;
    }

    __int16 v59 = (void *)objc_claimAutoreleasedReturnValue([v8 network]);
    id v60 = (void *)objc_claimAutoreleasedReturnValue([v8 borderAgent]);
    __int16 v61 = (THPreferredThreadNetwork *)objc_claimAutoreleasedReturnValue( -[THThreadNetworkCredentialsKeychainBackingStore getActiveDataSetRecordForNetworkAndBorderAgentId:borderAgent:]( v99,  "getActiveDataSetRecordForNetworkAndBorderAgentId:borderAgent:",  v59,  v60));

    id v62 = objc_alloc(&OBJC_CLASS___THPreferredThreadNetwork);
    __int128 v63 = (void *)objc_claimAutoreleasedReturnValue(-[THPreferredThreadNetwork network](v61, "network"));
    __int128 v64 = (void *)objc_claimAutoreleasedReturnValue([v6 networkSignature]);
    __int128 v65 = (void *)objc_claimAutoreleasedReturnValue([v6 userInfo]);
    __int128 v66 = -[THPreferredThreadNetwork initWithThreadNetwork:networkSignature:credentialsDataSetRecord:creationDate:lastModificationDate:userInfo:]( v62,  "initWithThreadNetwork:networkSignature:credentialsDataSetRecord:creationDate:lastModificationDate:userInfo:",  v63,  v64,  v61,  0LL,  0LL,  v65);

    if (v66)
    {
      unsigned int v67 = -[THThreadNetworkCredentialsKeychainBackingStore storePreferred:](v99, "storePreferred:", v66);
      id v68 = sub_1001768B4(1);
      v69 = (os_log_s *)objc_claimAutoreleasedReturnValue(v68);
      id v70 = v69;
      if (v67)
      {
        if (os_log_type_enabled(v69, OS_LOG_TYPE_INFO))
        {
          __int16 v71 = (void *)objc_claimAutoreleasedReturnValue(-[THPreferredThreadNetwork network](v66, "network"));
          int v72 = (void *)objc_claimAutoreleasedReturnValue([v71 networkName]);
          *(_DWORD *)buf = 136315650;
          v101 = "-[THThreadNetworkCredentialsKeychainBackingStore updateRecordToPreferredNetworkEntry:credentialsDataSetRecord:]";
          __int16 v102 = 1024;
          int v103 = 4749;
          __int16 v104 = 2112;
          v105 = v72;
          _os_log_impl( (void *)&_mh_execute_header,  v70,  OS_LOG_TYPE_INFO,  "%s:%d: Updated Preferred Network with the name : %@",  buf,  0x1Cu);

          id v58 = v99;
        }

        if (-[THThreadNetworkCredentialsKeychainBackingStore deletePreferredNetworkEntry:]( v58,  "deletePreferredNetworkEntry:",  v6))
        {
          __int16 v73 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s network](v53, "network"));
          id v74 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s borderAgent](v53, "borderAgent"));
          __int16 v75 = (void *)objc_claimAutoreleasedReturnValue( -[THThreadNetworkCredentialsKeychainBackingStore deleteActiveDataSetRecordForNetworkAndBorderAgentId:borderAgent:]( v58,  "deleteActiveDataSetRecordForNetworkAndBorderAgentId:borderAgent:",  v73,  v74));

          if (!v75)
          {

LABEL_49:
            goto LABEL_50;
          }

          id v76 = sub_1001768B4(1);
          id v70 = (os_log_s *)objc_claimAutoreleasedReturnValue(v76);
          if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR)) {
            sub_10019998C(v53);
          }
        }

        else
        {
          id v78 = sub_1001768B4(1);
          id v70 = (os_log_s *)objc_claimAutoreleasedReturnValue(v78);
          if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR)) {
            sub_100199A2C(v6);
          }
        }
      }

      else if (os_log_type_enabled(v69, OS_LOG_TYPE_ERROR))
      {
        sub_100199ACC();
      }
    }

    else
    {
      id v77 = sub_1001768B4(1);
      id v70 = (os_log_s *)objc_claimAutoreleasedReturnValue(v77);
      if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR)) {
        sub_100199918();
      }
    }

    goto LABEL_56;
  }

  id v26 = sub_1001768B4(1);
  id v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
  if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
  {
    id v28 = (void *)objc_claimAutoreleasedReturnValue([v98 network]);
    __int16 v29 = (void *)objc_claimAutoreleasedReturnValue([v28 networkName]);
    id v30 = (void *)objc_claimAutoreleasedReturnValue([v98 network]);
    int v31 = (void *)objc_claimAutoreleasedReturnValue([v30 extendedPANID]);
    int v32 = (void *)objc_claimAutoreleasedReturnValue([v8 network]);
    OSStatus v33 = (void *)objc_claimAutoreleasedReturnValue([v32 networkName]);
    id v34 = (void *)objc_claimAutoreleasedReturnValue([v8 network]);
    id v35 = (void *)objc_claimAutoreleasedReturnValue([v34 extendedPANID]);
    *(_DWORD *)buf = 136316418;
    v101 = "-[THThreadNetworkCredentialsKeychainBackingStore updateRecordToPreferredNetworkEntry:credentialsDataSetRecord:]";
    __int16 v102 = 1024;
    int v103 = 4697;
    __int16 v104 = 2112;
    v105 = v29;
    __int16 v106 = 2112;
    v107 = v31;
    __int16 v108 = 2112;
    v109 = v33;
    __int16 v110 = 2112;
    v111 = v35;
    _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_INFO,  "%s:%d:Preferred network entry (name : %@, xpanid : %@) And record netowrk (name : %@, xpanid : %@) are matching, u pdate record to Preferred Network",  buf,  0x3Au);

    id v6 = v98;
  }

  uint64_t v36 = objc_claimAutoreleasedReturnValue([v6 credentialsDataSetRecord]);
  BOOL v37 = v99;
  if (!v36) {
    goto LABEL_44;
  }
  id v38 = (void *)v36;
  id v39 = (void *)objc_claimAutoreleasedReturnValue([v6 credentialsDataSetRecord]);
  uint64_t v40 = objc_claimAutoreleasedReturnValue([v39 credentialsDataSet]);
  if (!v40) {
    goto LABEL_43;
  }
  unsigned __int8 v41 = (void *)v40;
  uint64_t v42 = objc_claimAutoreleasedReturnValue([v8 credentialsDataSet]);
  if (!v42)
  {
LABEL_42:

LABEL_43:
    goto LABEL_44;
  }

  id v43 = (void *)v42;
  id v44 = (void *)objc_claimAutoreleasedReturnValue([v6 credentialsDataSetRecord]);
  id v45 = (void *)objc_claimAutoreleasedReturnValue([v44 credentialsDataSet]);
  __int16 v46 = (void *)objc_claimAutoreleasedReturnValue([v45 dataSetArray]);
  if (![v46 length])
  {
LABEL_41:

    id v6 = v98;
    goto LABEL_42;
  }

  __int16 v47 = (void *)objc_claimAutoreleasedReturnValue([v8 credentialsDataSet]);
  __int16 v97 = (void *)objc_claimAutoreleasedReturnValue([v47 dataSetArray]);
  if (![v97 length])
  {

    goto LABEL_41;
  }

  int v94 = (void *)objc_claimAutoreleasedReturnValue([v98 credentialsDataSetRecord]);
  v92 = (void *)objc_claimAutoreleasedReturnValue([v94 credentialsDataSet]);
  __int16 v95 = v44;
  int v48 = (void *)objc_claimAutoreleasedReturnValue([v92 dataSetArray]);
  __int16 v49 = (void *)objc_claimAutoreleasedReturnValue([v8 credentialsDataSet]);
  __int16 v93 = v47;
  uint64_t v50 = (void *)objc_claimAutoreleasedReturnValue([v49 dataSetArray]);
  unsigned int v96 = [v48 isEqualToData:v50];

  BOOL v37 = v99;
  id v6 = v98;

  if (!v96)
  {
LABEL_44:
    __int16 v79 = (void *)objc_claimAutoreleasedReturnValue([v8 borderAgent]);
    __int16 v53 = (os_log_s *)objc_claimAutoreleasedReturnValue( -[THThreadNetworkCredentialsKeychainBackingStore getActiveDataSetRecord:]( v37,  "getActiveDataSetRecord:",  v79));

    __int128 v80 = objc_alloc(&OBJC_CLASS___THPreferredThreadNetwork);
    __int16 v81 = v37;
    __int128 v82 = (void *)objc_claimAutoreleasedReturnValue([v6 network]);
    __int128 v83 = (void *)objc_claimAutoreleasedReturnValue([v6 networkSignature]);
    uint64_t v84 = (void *)objc_claimAutoreleasedReturnValue([v6 userInfo]);
    __int16 v61 = -[THPreferredThreadNetwork initWithThreadNetwork:networkSignature:credentialsDataSetRecord:creationDate:lastModificationDate:userInfo:]( v80,  "initWithThreadNetwork:networkSignature:credentialsDataSetRecord:creationDate:lastModificationDate:userInfo:",  v82,  v83,  v53,  0LL,  0LL,  v84);

    if (v61)
    {
      unsigned int v85 = -[THThreadNetworkCredentialsKeychainBackingStore storePreferred:](v81, "storePreferred:", v61);
      id v86 = sub_1001768B4(1);
      __int16 v87 = (os_log_s *)objc_claimAutoreleasedReturnValue(v86);
      int v88 = v87;
      if (v85)
      {
        if (os_log_type_enabled(v87, OS_LOG_TYPE_INFO))
        {
          __int16 v89 = (void *)objc_claimAutoreleasedReturnValue(-[THPreferredThreadNetwork network](v61, "network"));
          v90 = (void *)objc_claimAutoreleasedReturnValue([v89 networkName]);
          *(_DWORD *)buf = 136315650;
          v101 = "-[THThreadNetworkCredentialsKeychainBackingStore updateRecordToPreferredNetworkEntry:credentialsDataSetRecord:]";
          __int16 v102 = 1024;
          int v103 = 4723;
          __int16 v104 = 2112;
          v105 = v90;
          _os_log_impl( (void *)&_mh_execute_header,  v88,  OS_LOG_TYPE_INFO,  "%s:%d: Updated Preferred Network with the name : %@",  buf,  0x1Cu);
        }

        goto LABEL_49;
      }

      if (os_log_type_enabled(v87, OS_LOG_TYPE_ERROR)) {
        sub_100199738();
      }
    }

    else
    {
      id v91 = sub_1001768B4(1);
      int v88 = (os_log_s *)objc_claimAutoreleasedReturnValue(v91);
      if (os_log_type_enabled(v88, OS_LOG_TYPE_ERROR)) {
        sub_1001996C4();
      }
    }

LABEL_56:
LABEL_20:
    BOOL v51 = 0;
    goto LABEL_21;
  }

  BOOL v51 = 1;
  id v52 = sub_1001768B4(1);
  __int16 v53 = (os_log_s *)objc_claimAutoreleasedReturnValue(v52);
  if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR)) {
    sub_1001997AC(v98, v8, v53);
  }
LABEL_21:

  return v51;
}

- (id)deleteActiveDataSetRecordForNetworkAndBorderAgentId:(id)a3 borderAgent:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = sub_1001768B4(1);
  BOOL v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v5 networkName]);
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v5 extendedPANID]);
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v6 discriminatorId]);
    int v22 = 136316162;
    unsigned int v23 = "-[THThreadNetworkCredentialsKeychainBackingStore deleteActiveDataSetRecordForNetworkAndBorderAgentId:borderAgent:]";
    __int16 v24 = 1024;
    int v25 = 4774;
    __int16 v26 = 2112;
    id v27 = v9;
    __int16 v28 = 2112;
    __int16 v29 = v10;
    __int16 v30 = 2112;
    int v31 = v11;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "%s:%d: Fetch active dataset record with network name : %@, network xpanid : %@, borderAgent %@",  (uint8_t *)&v22,  0x30u);
  }

  uint64_t v12 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue( +[THThreadNetworkCredentialsActiveDataSetRecord keyChainQueryForDeleteActiveDataSetOperationForNetworkAndBorderAgent:borderAgent:]( &OBJC_CLASS___THThreadNetworkCredentialsActiveDataSetRecord,  "keyChainQueryForDeleteActiveDataSetOperationForNetworkAndBorderAgent:borderAgent:",  v5,  v6));
  OSStatus v13 = SecItemDelete(v12);
  id v14 = sub_1001768B4(1);
  int v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    int v22 = 136315650;
    unsigned int v23 = "-[THThreadNetworkCredentialsKeychainBackingStore deleteActiveDataSetRecordForNetworkAndBorderAgentId:borderAgent:]";
    __int16 v24 = 1024;
    int v25 = 4779;
    __int16 v26 = 1024;
    LODWORD(v27) = v13;
    _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "%s:%d Result for deletion operation : (err=%d)",  (uint8_t *)&v22,  0x18u);
  }

  if (v13)
  {
    id v16 = (__CFString *)SecCopyErrorMessageString(v13, 0LL);
    id v17 = sub_1001768B4(1);
    id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      sub_100199B40();
    }

    id v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSOSStatusErrorDomain,  v13,  0LL));
    id v20 = (id)objc_claimAutoreleasedReturnValue( +[NSError storeError:underlyingError:description:]( &OBJC_CLASS___NSError,  "storeError:underlyingError:description:",  2LL,  v19,  v16));
  }

  else
  {
    id v20 = 0LL;
  }

  return v20;
}

- (id)getActiveDataSetRecordForNetworkAndBorderAgentId:(id)a3 borderAgent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = sub_1001768B4(1);
  uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v6 networkName]);
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v6 extendedPANID]);
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v7 discriminatorId]);
    *(_DWORD *)buf = 136316162;
    id v20 = "-[THThreadNetworkCredentialsKeychainBackingStore getActiveDataSetRecordForNetworkAndBorderAgentId:borderAgent:]";
    __int16 v21 = 1024;
    int v22 = 4795;
    __int16 v23 = 2112;
    __int16 v24 = v10;
    __int16 v25 = 2112;
    __int16 v26 = v11;
    __int16 v27 = 2112;
    __int16 v28 = v12;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "%s:%d: Fetch active dataset record with network name : %@, network xpanid : %@, borderAgent %@",  buf,  0x30u);
  }

  OSStatus v13 = (void *)objc_claimAutoreleasedReturnValue( +[THThreadNetworkCredentialsActiveDataSetRecord keyChainQueryForFetchActiveDataSetRecordOperationForNetworkAndBorderAgent:borderAgent:]( &OBJC_CLASS___THThreadNetworkCredentialsActiveDataSetRecord,  "keyChainQueryForFetchActiveDataSetRecordOperationForNetworkAndBorderAgent:borderAgent:",  v6,  v7));
  uint64_t v18 = 0LL;
  id v14 = (void *)objc_claimAutoreleasedReturnValue( -[THThreadNetworkCredentialsKeychainBackingStore _doFetchActiveDataSetRecords:error:]( self,  "_doFetchActiveDataSetRecords:error:",  v13,  &v18));
  int v15 = v14;
  id v16 = 0LL;
  if (!v18) {
    id v16 = (void *)objc_claimAutoreleasedReturnValue([v14 anyObject]);
  }

  return v16;
}

- (id)getActiveDataSetRecord:(id)a3
{
  id v4 = a3;
  id v5 = sub_1001768B4(1);
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 discriminatorId]);
    *(_DWORD *)buf = 136315650;
    int v15 = "-[THThreadNetworkCredentialsKeychainBackingStore getActiveDataSetRecord:]";
    __int16 v16 = 1024;
    int v17 = 4806;
    __int16 v18 = 2112;
    id v19 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "%s:%d: Fetch active dataset record with borderAgent %@",  buf,  0x1Cu);
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[THThreadNetworkCredentialsActiveDataSetRecord keyChainQueryForFetchActiveDataSetRecordOperationForBorderAgent:]( &OBJC_CLASS___THThreadNetworkCredentialsActiveDataSetRecord,  "keyChainQueryForFetchActiveDataSetRecordOperationForBorderAgent:",  v4));
  uint64_t v13 = 0LL;
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( -[THThreadNetworkCredentialsKeychainBackingStore _doFetchActiveDataSetRecords:error:]( self,  "_doFetchActiveDataSetRecords:error:",  v8,  &v13));
  id v10 = v9;
  id v11 = 0LL;
  if (!v13) {
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v9 anyObject]);
  }

  return v11;
}

- (BOOL)markAsPreferred:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    id v5 = sub_1001768B4(1);
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_100199C2C();
    }
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue( -[THThreadNetworkCredentialsKeychainBackingStore getPreferredNetwork:]( self,  "getPreferredNetwork:",  0LL));
  if (v7)
  {
    if (-[THThreadNetworkCredentialsKeychainBackingStore updateRecordToPreferredNetworkEntry:credentialsDataSetRecord:]( self,  "updateRecordToPreferredNetworkEntry:credentialsDataSetRecord:",  v7,  v4))
    {
      -[THThreadNetworkCredentialsKeychainBackingStore dispatchRemoveInActiveRecords:]( self,  "dispatchRemoveInActiveRecords:",  v7);
      BOOL v8 = 1;
    }

    else
    {
      id v9 = sub_1001768B4(1);
      id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        sub_100199BB8();
      }

      BOOL v8 = 0;
    }
  }

  else
  {
    BOOL v8 = -[THThreadNetworkCredentialsKeychainBackingStore storePreferredNetworkWithRecord:]( self,  "storePreferredNetworkWithRecord:",  v4);
  }

  return v8;
}

- (BOOL)areValidDataSetTLVs:(id)a3
{
  uint64_t v4 = 0LL;
  return -[THThreadNetworkCredentialsKeychainBackingStore areValidDataSetTLVs:creds:]( self,  "areValidDataSetTLVs:creds:",  a3,  &v4);
}

- (BOOL)areValidDataSetTLVs:(id)a3 creds:(id *)a4
{
  id v4 = a3;
  id v5 = [v4 bytes];
  unsigned int v6 = [v4 length];
  id v7 = sub_1001768B4(1);
  BOOL v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v145 = "-[THThreadNetworkCredentialsKeychainBackingStore areValidDataSetTLVs:creds:]";
    __int16 v146 = 1024;
    int v147 = 4926;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s: Validating Dataset : %d", buf, 0x12u);
  }

  id v9 = sub_1001768B4(1);
  id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v145 = "-[THThreadNetworkCredentialsKeychainBackingStore areValidDataSetTLVs:creds:]";
    __int16 v146 = 1024;
    int v147 = v6;
    __int16 v148 = 1024;
    int v149 = 4928;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "%s: #MOS : data_len : %d, Line : %d",  buf,  0x18u);
  }

  sub_100159A78((unint64_t)v5, v6, buf, 0x3E8uLL, 0);
  id v11 = sub_1001768B4(1);
  uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)v150 = 136315651;
    v151 = "-[THThreadNetworkCredentialsKeychainBackingStore areValidDataSetTLVs:creds:]";
    __int16 v152 = 2085;
    v153 = buf;
    __int16 v154 = 1024;
    int v155 = 4930;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "%s: #MOS : dump: %{sensitive}s, Line : %d",  v150,  0x1Cu);
  }

  id v135 = v4;

  if (v6)
  {
    uint64_t v13 = 0LL;
    v136 = 0LL;
    v137 = 0LL;
    v138 = 0LL;
    v139 = 0LL;
    LOBYTE(v14) = 0;
    unsigned int v15 = 0;
    while (1)
    {
      uint64_t v16 = v15 + 1LL;
      if (v16 >= v6)
      {
        id v89 = sub_1001768B4(1);
        __int16 v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v89);
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
          sub_10019A620();
        }
        goto LABEL_112;
      }

      uint64_t v17 = v5[v16];
      uint64_t v18 = v15 + 2LL;
      unsigned int v19 = v15 + 2 + v17;
      if (v19 > v6)
      {
        id v90 = sub_1001768B4(1);
        __int16 v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v90);
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
          sub_100199F48();
        }
        goto LABEL_112;
      }

      int v20 = v5[v15];
      switch(v5[v15])
      {
        case 0:
          id v21 = sub_1001768B4(1);
          int v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)v140 = 136315394;
            v141 = "-[THThreadNetworkCredentialsKeychainBackingStore areValidDataSetTLVs:creds:]";
            __int16 v142 = 1024;
            LODWORD(v143[0]) = 5034;
            _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "%s: #MOS : ==> Decoded channel Line : %d",  v140,  0x12u);
          }

          if ((_DWORD)v17 == 3)
          {
            if (v5[v18])
            {
              id v114 = sub_1001768B4(1);
              __int16 v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v114);
              if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
                sub_10019A204((uint64_t)&v5[v18], v25, v115, v116, v117, v118, v119, v120);
              }
            }

            else
            {
              uint64_t v14 = v5[v15 + 4];
              id v23 = sub_1001768B4(1);
              __int16 v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
              __int16 v25 = v24;
              if ((v14 - 27) > 0xEFu)
              {
                if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)v140 = 136315394;
                  v141 = "-[THThreadNetworkCredentialsKeychainBackingStore areValidDataSetTLVs:creds:]";
                  __int16 v142 = 1024;
                  LODWORD(v143[0]) = v14;
                  _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "%s: #MOS : Channel : %d",  v140,  0x12u);
                }

                goto LABEL_73;
              }

              if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
                sub_10019A18C(v14, v25, v121, v122, v123, v124, v125, v126);
              }
            }
          }

          else
          {
            id v104 = sub_1001768B4(1);
            __int16 v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v104);
            if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
              sub_10019A280();
            }
          }

          goto LABEL_112;
        case 1:
          id v32 = sub_1001768B4(1);
          OSStatus v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
          if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)v140 = 136315394;
            v141 = "-[THThreadNetworkCredentialsKeychainBackingStore areValidDataSetTLVs:creds:]";
            __int16 v142 = 1024;
            LODWORD(v143[0]) = 5068;
            _os_log_impl( (void *)&_mh_execute_header,  v33,  OS_LOG_TYPE_DEFAULT,  "%s: #MOS : ==> Decoded pan id Line : %d",  v140,  0x12u);
          }

          if ((_DWORD)v17 != 2)
          {
            id v105 = sub_1001768B4(1);
            __int16 v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v105);
            if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
              sub_10019A2F4();
            }
            goto LABEL_112;
          }

          uint64_t v34 = objc_claimAutoreleasedReturnValue( +[NSData dataWithBytes:length:]( &OBJC_CLASS___NSData,  "dataWithBytes:length:",  &v5[v18],  2LL));

          id v35 = sub_1001768B4(1);
          __int16 v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v35);
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)v140 = 136315394;
            v141 = "-[THThreadNetworkCredentialsKeychainBackingStore areValidDataSetTLVs:creds:]";
            __int16 v142 = 2112;
            v143[0] = v34;
            _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "%s: #MOS : PANID : %@", v140, 0x16u);
          }

          v136 = (void *)v34;
          goto LABEL_73;
        case 2:
          id v36 = sub_1001768B4(1);
          BOOL v37 = (os_log_s *)objc_claimAutoreleasedReturnValue(v36);
          if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)v140 = 136315394;
            v141 = "-[THThreadNetworkCredentialsKeychainBackingStore areValidDataSetTLVs:creds:]";
            __int16 v142 = 1024;
            LODWORD(v143[0]) = 5083;
            _os_log_impl( (void *)&_mh_execute_header,  v37,  OS_LOG_TYPE_DEFAULT,  "%s: #MOS : ==> Decoded XPAN ID : %d",  v140,  0x12u);
          }

          if ((_DWORD)v17 != 8)
          {
            id v106 = sub_1001768B4(1);
            __int16 v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v106);
            if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
              sub_10019A368();
            }
            goto LABEL_112;
          }

          uint64_t v38 = objc_claimAutoreleasedReturnValue( +[NSData dataWithBytes:length:]( &OBJC_CLASS___NSData,  "dataWithBytes:length:",  &v5[v18],  8LL));

          id v39 = sub_1001768B4(1);
          __int16 v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v39);
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)v140 = 136315394;
            v141 = "-[THThreadNetworkCredentialsKeychainBackingStore areValidDataSetTLVs:creds:]";
            __int16 v142 = 2112;
            v143[0] = v38;
            _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "%s: #MOS : XPAN ID: %@", v140, 0x16u);
          }

          v137 = (void *)v38;
          goto LABEL_73;
        case 3:
          __memcpy_chk(v150, &v5[v18], v5[v16], 255LL);
          v150[v17] = 0;
          id v40 = sub_1001768B4(1);
          unsigned __int8 v41 = (os_log_s *)objc_claimAutoreleasedReturnValue(v40);
          if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)v140 = 136315394;
            v141 = "-[THThreadNetworkCredentialsKeychainBackingStore areValidDataSetTLVs:creds:]";
            __int16 v142 = 1024;
            LODWORD(v143[0]) = 5023;
            _os_log_impl( (void *)&_mh_execute_header,  v41,  OS_LOG_TYPE_DEFAULT,  "%s: #MOS : ==> Decoded Network Name Line : %d",  v140,  0x12u);
          }

          uint64_t v42 = objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v150));
          id v43 = sub_1001768B4(1);
          id v44 = (os_log_s *)objc_claimAutoreleasedReturnValue(v43);
          __int16 v25 = v44;
          if (!v42)
          {
            if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR)) {
              sub_10019A118(v25, v107, v108);
            }
            uint64_t v13 = 0LL;
            goto LABEL_112;
          }

          if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)v140 = 136315394;
            v141 = "-[THThreadNetworkCredentialsKeychainBackingStore areValidDataSetTLVs:creds:]";
            __int16 v142 = 2112;
            v143[0] = v42;
            _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "%s : #MOS : Network Name : %@",  v140,  0x16u);
          }

          goto LABEL_74;
        case 4:
          id v45 = sub_1001768B4(1);
          __int16 v46 = (os_log_s *)objc_claimAutoreleasedReturnValue(v45);
          if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)v140 = 136315394;
            v141 = "-[THThreadNetworkCredentialsKeychainBackingStore areValidDataSetTLVs:creds:]";
            __int16 v142 = 1024;
            LODWORD(v143[0]) = 5098;
            _os_log_impl( (void *)&_mh_execute_header,  v46,  OS_LOG_TYPE_DEFAULT,  "%s: #MOS : ==> Decoded pskc Line : %d",  v140,  0x12u);
          }

          if ((_DWORD)v17 != 16)
          {
            id v109 = sub_1001768B4(1);
            __int16 v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v109);
            if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
              sub_10019A3DC();
            }
            goto LABEL_112;
          }

          uint64_t v47 = objc_claimAutoreleasedReturnValue( +[NSData dataWithBytes:length:]( &OBJC_CLASS___NSData,  "dataWithBytes:length:",  &v5[v18],  16LL));

          id v48 = sub_1001768B4(1);
          __int16 v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v48);
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)v140 = 136315395;
            v141 = "-[THThreadNetworkCredentialsKeychainBackingStore areValidDataSetTLVs:creds:]";
            __int16 v142 = 2117;
            v143[0] = v47;
            _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "%s: #MOS : PSKc : %{sensitive}@",  v140,  0x16u);
          }

          v138 = (void *)v47;
          goto LABEL_73;
        case 5:
          id v49 = sub_1001768B4(1);
          uint64_t v50 = (os_log_s *)objc_claimAutoreleasedReturnValue(v49);
          if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)v140 = 136315394;
            v141 = "-[THThreadNetworkCredentialsKeychainBackingStore areValidDataSetTLVs:creds:]";
            __int16 v142 = 1024;
            LODWORD(v143[0]) = 5114;
            _os_log_impl( (void *)&_mh_execute_header,  v50,  OS_LOG_TYPE_DEFAULT,  "%s: #MOS : ==> Decoded master key Line : %d",  v140,  0x12u);
          }

          if ((_DWORD)v17 != 16)
          {
            id v110 = sub_1001768B4(1);
            __int16 v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v110);
            if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
              sub_10019A450();
            }
            goto LABEL_112;
          }

          uint64_t v51 = objc_claimAutoreleasedReturnValue( +[NSData dataWithBytes:length:]( &OBJC_CLASS___NSData,  "dataWithBytes:length:",  &v5[v18],  16LL));

          id v52 = sub_1001768B4(1);
          __int16 v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v52);
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)v140 = 136315395;
            v141 = "-[THThreadNetworkCredentialsKeychainBackingStore areValidDataSetTLVs:creds:]";
            __int16 v142 = 2117;
            v143[0] = v51;
            _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "%s: #MOS : Master Key: %{sensitive}@",  v140,  0x16u);
          }

          v139 = (void *)v51;
          goto LABEL_73;
        case 6:
        case 8:
        case 9:
        case 0xA:
        case 0xB:
          goto LABEL_31;
        case 7:
          id v53 = sub_1001768B4(1);
          id v54 = (os_log_s *)objc_claimAutoreleasedReturnValue(v53);
          if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)v140 = 136315394;
            v141 = "-[THThreadNetworkCredentialsKeychainBackingStore areValidDataSetTLVs:creds:]";
            __int16 v142 = 1024;
            LODWORD(v143[0]) = 5145;
            _os_log_impl( (void *)&_mh_execute_header,  v54,  OS_LOG_TYPE_DEFAULT,  "%s: #MOS : ==> Decoded mesh local prefix Line : %d",  v140,  0x12u);
          }

          if ((_DWORD)v17 == 8) {
            goto LABEL_75;
          }
          id v111 = sub_1001768B4(1);
          __int16 v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v111);
          if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
            sub_10019A5AC();
          }
          goto LABEL_112;
        case 0xC:
          id v55 = sub_1001768B4(1);
          id v56 = (os_log_s *)objc_claimAutoreleasedReturnValue(v55);
          if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)v140 = 136315650;
            v141 = "-[THThreadNetworkCredentialsKeychainBackingStore areValidDataSetTLVs:creds:]";
            __int16 v142 = 1024;
            LODWORD(v143[0]) = 5129;
            WORD2(v143[0]) = 1024;
            *(_DWORD *)((char *)v143 + 6) = v17;
            _os_log_impl( (void *)&_mh_execute_header,  v56,  OS_LOG_TYPE_DEFAULT,  "%s: #MOS : ==> Decoded security policy Line : %d, len : %d",  v140,  0x18u);
          }

          if ((v17 - 3) >= 2)
          {
            id v113 = sub_1001768B4(1);
            __int16 v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v113);
            if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
              sub_10019A538();
            }
            goto LABEL_112;
          }

          __int16 v57 = &v5[v18];
          if (!*v57 && !v5[v15 + 3])
          {
            id v127 = sub_1001768B4(1);
            __int16 v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v127);
            if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
              sub_10019A4C4();
            }
            goto LABEL_112;
          }

          id v58 = sub_1001768B4(1);
          __int16 v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v58);
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
          {
            __int16 v59 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:", v57, v17));
            *(_DWORD *)v140 = 136315394;
            v141 = "-[THThreadNetworkCredentialsKeychainBackingStore areValidDataSetTLVs:creds:]";
            __int16 v142 = 2112;
            v143[0] = v59;
            _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "%s: #MOS : security policy : %@",  v140,  0x16u);
          }

          goto LABEL_73;
        default:
          if (v20 == 53)
          {
            id v26 = sub_1001768B4(1);
            __int16 v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
            if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)v140 = 136315394;
              v141 = "-[THThreadNetworkCredentialsKeychainBackingStore areValidDataSetTLVs:creds:]";
              __int16 v142 = 1024;
              LODWORD(v143[0]) = 4985;
              _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_DEFAULT,  "%s: #MOS : ==> Decoded Channel Mask TLV Line : %d",  v140,  0x12u);
            }

            unsigned int v28 = v15 + 3;
            while (1)
            {
              if (v28 - 1 >= v19) {
                goto LABEL_75;
              }
              if (v28 >= v19 || v28 + 5 > v19) {
                break;
              }
              if ((v5[v28 - 1] & 0xFD) != 0)
              {
                id v93 = sub_1001768B4(1);
                __int16 v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v93);
                if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
                  sub_10019A0A4();
                }
                goto LABEL_112;
              }

              int v30 = v5[v28];
              v28 += 6;
              if (v30 != 4)
              {
                id v94 = sub_1001768B4(1);
                __int16 v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v94);
                if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
                  sub_10019A030();
                }
                goto LABEL_112;
              }
            }

            id v91 = sub_1001768B4(1);
            __int16 v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v91);
            if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
              sub_100199FBC();
            }
LABEL_112:
            id v68 = v135;
            __int128 v64 = v136;
            __int128 v63 = v137;

            id v96 = sub_1001768B4(1);
            __int16 v61 = (os_log_s *)objc_claimAutoreleasedReturnValue(v96);
            if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR)) {
              sub_100199ED4();
            }
LABEL_114:
            BOOL v81 = 0;
            goto LABEL_115;
          }

- (void)getSecFlags:(char *)a3
{
  *a3 |= 0xF7u;
  a3[1] |= 0xF8u;
}

- (id)generateCredentials
{
  __int16 v56 = 0;
  id v3 = sub_1001768B4(1);
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    BOOL v62 = "-[THThreadNetworkCredentialsKeychainBackingStore generateCredentials]";
    __int16 v63 = 1024;
    int v64 = 5347;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s:%d Generating Credentials", buf, 0x12u);
  }

  if (-[THThreadNetworkCredentialsKeychainBackingStore isEthernetNetwork](self, "isEthernetNetwork"))
  {
    id v5 = sub_1001768B4(1);
    unsigned int v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_10019A708();
    }

    if (!-[THThreadNetworkCredentialsKeychainBackingStore isWiFiNetwork](self, "isWiFiNetwork")) {
      goto LABEL_12;
    }
    goto LABEL_9;
  }

  if (-[THThreadNetworkCredentialsKeychainBackingStore isWiFiNetwork](self, "isWiFiNetwork"))
  {
LABEL_9:
    id v7 = sub_1001768B4(1);
    BOOL v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      BOOL v62 = "-[THThreadNetworkCredentialsKeychainBackingStore generateCredentials]";
      __int16 v63 = 1024;
      int v64 = 5356;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s:%d Device is on WiFi", buf, 0x12u);
    }

LABEL_12:
    memset(v68, 0, sizeof(v68));
    int v65 = -1610480628;
    -[THThreadNetworkCredentialsKeychainBackingStore getSecFlags:](self, "getSecFlags:", &v56);
    __int16 v66 = v56;
    id v9 = (void *)objc_claimAutoreleasedReturnValue( -[THThreadNetworkCredentialsKeychainBackingStore dataFromHexString:]( self,  "dataFromHexString:",  @"0004001fffc0"));
    __int16 v67 = ((unsigned __int16)[v9 length] << 8) | 0x35;
    id v10 = v9;
    __memcpy_chk(v68, [v10 bytes], objc_msgSend(v10, "length"), 246);
    unsigned __int8 v50 = [v10 length];
    id v52 = v10;
    unsigned int v11 = [v10 length];
    id v12 = sub_1001937E4();
    uint64_t v51 = (void *)objc_claimAutoreleasedReturnValue(v12);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[THThreadNetworkCredentialsKeychainBackingStore dataFromHexString:](self, "dataFromHexString:"));
    *(_WORD *)((char *)&v65 + (v11 + 8)) = ((unsigned __int16)[v13 length] << 8) | 2;
    id v14 = v13;
    memcpy( (char *)&v65 + (v11 + 10),  [v14 bytes],  objc_msgSend(v14, "length"));
    unsigned __int8 v49 = [v14 length];
    unsigned int v15 = v11 + 10 + [v14 length];
    uint64_t v16 = sub_1001938D8();
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    *(_WORD *)((char *)&v65 + v15) = ((unsigned __int16)[v17 length] << 8) | 5;
    unsigned int v18 = v15 + 2;
    id v19 = v17;
    memcpy( (char *)&v65 + v18,  [v19 bytes],  objc_msgSend(v19, "length"));
    unsigned __int8 v48 = [v19 length];
    unsigned int v20 = [v19 length];
    unsigned int v21 = v18 + v20;
    *(_WORD *)((char *)&v65 + (v18 + v20)) = 768;
    *((_BYTE *)&v65 + (v18 + v20 + 2)) = 0;
    *(_WORD *)((char *)&v65 + (v18 + v20 + 3)) = 6400;
    LOBYTE(v17) = v18 + v20 + 5;
    uint32_t v22 = arc4random();
    *(_WORD *)((char *)&v65 + v17) = 513;
    *(_WORD *)((char *)&v65 + (v21 + 7)) = v22 + ((v22 / 0xF) & 0xF000) + 4096;
    id v23 = sub_100193A60();
    __int16 v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
    *(_WORD *)((char *)&v65 + (v21 + 9)) = ((unsigned __int16)[v24 length] << 8) | 3;
    unsigned int v25 = v21 + 11;
    id v26 = v24;
    memcpy( (char *)&v65 + v25,  [v26 cStringUsingEncoding:4],  (size_t)objc_msgSend(v26, "length"));
    LOBYTE(v24) = [v26 length];
    unsigned int v27 = v25 + [v26 length];
    unsigned int v28 = sub_1001938D8();
    __int16 v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
    *(_WORD *)((char *)&v65 + v27) = ((unsigned __int16)[v29 length] << 8) | 4;
    LODWORD(v10) = v27 + 2;
    id v30 = v29;
    memcpy( (char *)&v65 + (v27 + 2),  [v30 bytes],  objc_msgSend(v30, "length"));
    LOBYTE(v27) = [v30 length];
    LODWORD(v10) = (_DWORD)v10 + [v30 length];
    gettimeofday(&v55, 0LL);
    __darwin_time_t tv_sec = v55.tv_sec;
    *(_WORD *)((char *)&v65 + v10) = 2062;
    *(void *)((char *)&v65 + ((_BYTE)v10 + 2)) = bswap64(tv_sec) >> 16;
    __int128 v54 = 0uLL;
    arc4random_buf((char *)&v54 + 1, 5uLL);
    *(_WORD *)((char *)&v65 + ((_BYTE)v10 + 10)) = 2055;
    LOBYTE(v54) = -3;
    *(_OWORD *)((char *)&v65 + ((_BYTE)v10 + 12)) = v54;
    uint64_t v32 = (v50 + v49 + v48 + (_BYTE)v24 + v27 + 45);
    sub_100159A78((unint64_t)&v65, v32, buf, 0x3E8uLL, 0);
    id v33 = sub_1001768B4(1);
    uint64_t v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int16 v57 = 136315394;
      id v58 = buf;
      __int16 v59 = 1024;
      int v60 = 5598;
      _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "dump: %s, Line : %d", v57, 0x12u);
    }

    id v35 = -[NSData initWithBytes:length:](objc_alloc(&OBJC_CLASS___NSData), "initWithBytes:length:", &v65, v32);
    id v36 = sub_1001768B4(1);
    BOOL v37 = (os_log_s *)objc_claimAutoreleasedReturnValue(v36);
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int16 v57 = 138412546;
      id v58 = (uint8_t *)v35;
      __int16 v59 = 1024;
      int v60 = 5602;
      _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "datasetTlvs : %@, Line : %d", v57, 0x12u);
    }

    id v53 = 0LL;
    unsigned int v38 = -[THThreadNetworkCredentialsKeychainBackingStore areValidDataSetTLVs:creds:]( self,  "areValidDataSetTLVs:creds:",  v35,  &v53);
    id v39 = v53;
    id v40 = sub_1001768B4(1);
    unsigned __int8 v41 = (os_log_s *)objc_claimAutoreleasedReturnValue(v40);
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v42 = "InValid";
      if (v38) {
        uint64_t v42 = "Valid";
      }
      *(_DWORD *)__int16 v57 = 136315394;
      id v58 = (uint8_t *)v42;
      __int16 v59 = 1024;
      int v60 = 5606;
      _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEFAULT, "isValid : %s, Line : %d", v57, 0x12u);
    }

    if ((v38 & 1) != 0)
    {
      id v43 = v39;
    }

    else
    {
      id v44 = sub_1001768B4(1);
      id v45 = (os_log_s *)objc_claimAutoreleasedReturnValue(v44);
      if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR)) {
        sub_10019A694();
      }

      id v43 = 0LL;
    }

    goto LABEL_29;
  }

  id v46 = sub_1001768B4(1);
  id v39 = (id)objc_claimAutoreleasedReturnValue(v46);
  if (os_log_type_enabled((os_log_t)v39, OS_LOG_TYPE_ERROR)) {
    sub_10019A77C();
  }
  id v43 = 0LL;
LABEL_29:

  return v43;
}

@end
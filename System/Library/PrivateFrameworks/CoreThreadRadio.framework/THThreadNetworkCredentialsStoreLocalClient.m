@interface THThreadNetworkCredentialsStoreLocalClient
- (NSString)keychainAccessGroup;
- (THThreadNetworkCredentialsBackingStore)backingStore;
- (THThreadNetworkCredentialsStoreLocalClient)initWithKeychainAccessGroup:(id)a3 backingStore:(id)a4;
- (id)initApplePrivateStoreWithBackingStore:(id)a3;
- (id)parseActiveOperationalDataSet:(id)a3;
- (id)parseCredsFromTLVs:(const char *)a3 data_len:(unsigned int)a4;
- (id)parseDataSetFromSpinel:(const char *)a3 data_len:(unsigned int)a4;
- (id)parseDataSetFromTLVs:(const char *)a3 data_len:(unsigned int)a4;
- (id)parseThreadNetworkActiveDataSet:(id)a3;
- (id)setFromSpinelFrame:(const char *)a3 data_len:(unsigned int)a4;
- (void)addPreferredNetworkWithCompletionInternally:(id)a3 borderAgentID:(id)a4 ipV4NwSignature:(id)a5 ipv6NwSignature:(id)a6 wifiSSID:(id)a7 wifiPassword:(id)a8 completion:(id)a9;
- (void)checkIfRecordForPreferredNetworkIsPresentWithCompletion:(id)a3;
- (void)checkIsPreferredNetworkForActiveOperationalDataset:(id)a3 completion:(id)a4;
- (void)cleanThreadKeychainDatabase:(id)a3;
- (void)deleteActiveDataSetRecordForThreadBorderAgent:(id)a3 completion:(id)a4;
- (void)deleteActiveDataSetRecordForThreadBorderAgentWithKeychainAccessGroup:(id)a3 completion:(id)a4;
- (void)deleteActiveDataSetRecordWithUniqueIdentifier:(id)a3 completion:(id)a4;
- (void)deleteActiveDataSetRecordWithUniqueIdentifierWithKeychainAccessGroup:(id)a3 completion:(id)a4;
- (void)deletePreferredAndFrozenThreadNetworksWithCompletion:(id)a3;
- (void)deletePreferredNetworkEntryWithCompletion:(id)a3 completion:(id)a4;
- (void)deletePreferredNetworkForNetworkSignatureInternallyWithCompletion:(id)a3 ipv6NwSignature:(id)a4 wifiSSID:(id)a5 completion:(id)a6;
- (void)deletePreferredNetworkWithCompletion:(id)a3;
- (void)deleteRecordForNetwork:(id)a3 completion:(id)a4;
- (void)deleteRecordWithUniqueIdentifier:(id)a3 completion:(id)a4;
- (void)retrieveActiveDataSetRecordForThreadBorderAgent:(id)a3 completion:(id)a4;
- (void)retrieveActiveDataSetRecordForThreadBorderAgentWithKeychainAccessGroup:(id)a3 completion:(id)a4;
- (void)retrieveActiveDataSetRecordOnMdnsWithExtendedPANId:(id)a3 completion:(id)a4;
- (void)retrieveActiveDataSetRecordWithExtendedPANId:(id)a3 completion:(id)a4;
- (void)retrieveActiveDataSetRecordWithTLVsForThreadBorderAgent:(id)a3 completion:(id)a4;
- (void)retrieveActiveDataSetRecordWithUniqueIdentifier:(id)a3 completion:(id)a4;
- (void)retrieveActiveDataSetRecordWithUniqueIdentifierWithKeychainAccessGroup:(id)a3 completion:(id)a4;
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
- (void)storeCachedAODasPreferredNetwork:(id)a3 completion:(id)a4;
- (void)storeCredentials:(id)a3 forNetwork:(id)a4 completion:(id)a5;
- (void)storeCredentials:(id)a3 waitForSync:(BOOL)a4 forNetwork:(id)a5 completion:(id)a6;
- (void)storeThreadNetworkCredentialActiveDataSet:(id)a3 network:(id)a4 credentials:(id)a5 credentialsDataSet:(id)a6 waitForSync:(BOOL)a7 completion:(id)a8;
- (void)storeThreadNetworkCredentialActiveDataSet:(id)a3 network:(id)a4 credentialsDataSet:(id)a5 waitForSync:(BOOL)a6 completion:(id)a7;
- (void)updatePreferredNetworkInternallyWithCompletion:(id)a3;
- (void)updatePreferredNetworkWithNewDataset:(id)a3 network:(id)a4 credentialsDataSet:(id)a5 completion:(id)a6;
- (void)validateAODInternally:(id)a3 completion:(id)a4;
- (void)validateRecordWithMdnsScanWithDataSet:(id)a3 borderAgentID:(id)a4 completion:(id)a5;
@end

@implementation THThreadNetworkCredentialsStoreLocalClient

- (id)initApplePrivateStoreWithBackingStore:(id)a3
{
  return -[THThreadNetworkCredentialsStoreLocalClient initWithKeychainAccessGroup:backingStore:]( self,  "initWithKeychainAccessGroup:backingStore:",  @"0000000000",  a3);
}

- (THThreadNetworkCredentialsStoreLocalClient)initWithKeychainAccessGroup:(id)a3 backingStore:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___THThreadNetworkCredentialsStoreLocalClient;
  v9 = -[THThreadNetworkCredentialsStoreLocalClient init](&v12, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_keychainAccessGroup, a3);
    objc_storeWeak((id *)&v10->_backingStore, v8);
  }

  return v10;
}

- (void)deleteRecordWithUniqueIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[THThreadNetworkCredentialsStoreLocalClient backingStore](self, "backingStore"));
  if (v8)
  {
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_1001A17CC;
    v14[3] = &unk_1002B53A8;
    v9 = &v15;
    id v15 = v7;
    id v10 = v7;
    [v8 deleteRecordWithUniqueIdentifier:v6 completion:v14];
  }

  else
  {
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
    objc_super v12 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1001A1774;
    block[3] = &unk_1002B5020;
    v9 = &v17;
    id v17 = v7;
    id v13 = v7;
    dispatch_async(v12, block);
  }
}

- (void)retrieveAllRecordsForNetwork:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[THThreadNetworkCredentialsStoreLocalClient backingStore](self, "backingStore"));
  if (v8)
  {
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_1001A1950;
    v14[3] = &unk_1002B53D0;
    v9 = &v15;
    id v15 = v7;
    id v10 = v7;
    [v8 retrieveAllRecordsForNetwork:v6 completion:v14];
  }

  else
  {
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
    objc_super v12 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1001A18F4;
    block[3] = &unk_1002B5020;
    v9 = &v17;
    id v17 = v7;
    id v13 = v7;
    dispatch_async(v12, block);
  }
}

- (void)retrieveAllRecordsWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[THThreadNetworkCredentialsStoreLocalClient backingStore](self, "backingStore"));
  if (v5)
  {
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_1001A1C50;
    v11[3] = &unk_1002B53D0;
    id v6 = &v12;
    id v12 = v4;
    id v7 = v4;
    [v5 retrieveAllRecordsWithCompletion:v11];
  }

  else
  {
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
    v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1001A1BF4;
    block[3] = &unk_1002B5020;
    id v6 = &v14;
    id v14 = v4;
    id v10 = v4;
    dispatch_async(v9, block);
  }
}

- (void)retrieveRecordWithUniqueIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[THThreadNetworkCredentialsStoreLocalClient backingStore](self, "backingStore"));
  if (v8)
  {
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_1001A1E2C;
    v14[3] = &unk_1002B53F8;
    v9 = &v15;
    id v15 = v7;
    id v10 = v7;
    [v8 retrieveRecordWithUniqueIdentifier:v6 completion:v14];
  }

  else
  {
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
    id v12 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1001A1DD0;
    block[3] = &unk_1002B5020;
    v9 = &v17;
    id v17 = v7;
    id v13 = v7;
    dispatch_async(v12, block);
  }
}

- (void)deleteRecordForNetwork:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[THThreadNetworkCredentialsStoreLocalClient keychainAccessGroup](self, "keychainAccessGroup"));
  v9 = (void *)objc_claimAutoreleasedReturnValue( +[THThreadNetworkCredentialsStoreRecord computedUniqueIdentifierForNetwork:keychainAccessGroup:]( &OBJC_CLASS___THThreadNetworkCredentialsStoreRecord,  "computedUniqueIdentifierForNetwork:keychainAccessGroup:",  v7,  v8));

  if (v9)
  {
    -[THThreadNetworkCredentialsStoreLocalClient deleteRecordWithUniqueIdentifier:completion:]( self,  "deleteRecordWithUniqueIdentifier:completion:",  v9,  v6);
  }

  else
  {
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
    v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1001A1F80;
    block[3] = &unk_1002B5020;
    id v13 = v6;
    dispatch_async(v11, block);
  }
}

- (void)storeCredentials:(id)a3 forNetwork:(id)a4 completion:(id)a5
{
}

- (void)storeCredentials:(id)a3 waitForSync:(BOOL)a4 forNetwork:(id)a5 completion:(id)a6
{
  BOOL v8 = a4;
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  id v13 = (void *)objc_claimAutoreleasedReturnValue(-[THThreadNetworkCredentialsStoreLocalClient backingStore](self, "backingStore"));
  if (v13)
  {
    id v14 = objc_alloc(&OBJC_CLASS___THThreadNetworkCredentialsStoreRecord);
    id v15 = (void *)objc_claimAutoreleasedReturnValue(-[THThreadNetworkCredentialsStoreLocalClient keychainAccessGroup](self, "keychainAccessGroup"));
    v16 = -[THThreadNetworkCredentialsStoreRecord initWithNetwork:credentials:uniqueIdentifier:keychainAccessGroup:creationDate:lastModificationDate:]( v14,  "initWithNetwork:credentials:uniqueIdentifier:keychainAccessGroup:creationDate:lastModificationDate:",  v11,  v10,  0LL,  v15,  0LL,  0LL);

    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472LL;
    v20[2] = sub_1001A21C8;
    v20[3] = &unk_1002B5160;
    id v21 = v12;
    id v17 = v12;
    [v13 storeRecord:v16 waitForSync:v8 completion:v20];
  }

  else
  {
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
    v19 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1001A216C;
    block[3] = &unk_1002B5020;
    id v23 = v12;
    v16 = (THThreadNetworkCredentialsStoreRecord *)v12;
    dispatch_async(v19, block);

    id v17 = v23;
  }
}

- (void)deleteActiveDataSetRecordWithUniqueIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = (void *)objc_claimAutoreleasedReturnValue(-[THThreadNetworkCredentialsStoreLocalClient backingStore](self, "backingStore"));
  if (v8)
  {
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_1001A2348;
    v14[3] = &unk_1002B53A8;
    v9 = &v15;
    id v15 = v7;
    id v10 = v7;
    [v8 deleteActiveDataSetRecordWithUniqueIdentifier:v6 completion:v14];
  }

  else
  {
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
    id v12 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1001A22F0;
    block[3] = &unk_1002B5020;
    v9 = &v17;
    id v17 = v7;
    id v13 = v7;
    dispatch_async(v12, block);
  }
}

- (void)deleteActiveDataSetRecordForThreadBorderAgent:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = (void *)objc_claimAutoreleasedReturnValue(-[THThreadNetworkCredentialsStoreLocalClient backingStore](self, "backingStore"));
  if (v8)
  {
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_1001A24C8;
    v14[3] = &unk_1002B53A8;
    v9 = &v15;
    id v15 = v7;
    id v10 = v7;
    [v8 deleteActiveDataSetRecordForThreadBorderAgent:v6 completion:v14];
  }

  else
  {
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
    id v12 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1001A2470;
    block[3] = &unk_1002B5020;
    v9 = &v17;
    id v17 = v7;
    id v13 = v7;
    dispatch_async(v12, block);
  }
}

- (void)retrieveAllActiveDataSetRecordsForNetwork:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = (void *)objc_claimAutoreleasedReturnValue(-[THThreadNetworkCredentialsStoreLocalClient backingStore](self, "backingStore"));
  if (v8)
  {
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_1001A264C;
    v14[3] = &unk_1002B53D0;
    v9 = &v15;
    id v15 = v7;
    id v10 = v7;
    [v8 retrieveAllActiveDataSetRecordsForNetwork:v6 completion:v14];
  }

  else
  {
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
    id v12 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1001A25F0;
    block[3] = &unk_1002B5020;
    v9 = &v17;
    id v17 = v7;
    id v13 = v7;
    dispatch_async(v12, block);
  }
}

- (void)retrieveAllActiveDataSetRecordsWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[THThreadNetworkCredentialsStoreLocalClient backingStore](self, "backingStore"));
  if (v5)
  {
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_1001A280C;
    v11[3] = &unk_1002B53D0;
    id v6 = &v12;
    id v12 = v4;
    id v7 = v4;
    [v5 retrieveAllActiveDataSetRecordsWithCompletion:v11];
  }

  else
  {
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
    v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1001A27B0;
    block[3] = &unk_1002B5020;
    id v6 = &v14;
    id v14 = v4;
    id v10 = v4;
    dispatch_async(v9, block);
  }
}

- (void)retrieveActiveDataSetRecordWithUniqueIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = (void *)objc_claimAutoreleasedReturnValue(-[THThreadNetworkCredentialsStoreLocalClient backingStore](self, "backingStore"));
  if (v8)
  {
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_1001A29E8;
    v14[3] = &unk_1002B5420;
    v9 = &v15;
    id v15 = v7;
    id v10 = v7;
    [v8 retrieveActiveDataSetRecordWithUniqueIdentifier:v6 completion:v14];
  }

  else
  {
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
    id v12 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1001A298C;
    block[3] = &unk_1002B5020;
    v9 = &v17;
    id v17 = v7;
    id v13 = v7;
    dispatch_async(v12, block);
  }
}

- (void)retrieveThirdPartyInfo:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[THThreadNetworkCredentialsStoreLocalClient backingStore](self, "backingStore"));
  id v6 = v5;
  if (v5)
  {
    [v5 retrieveThirdPartyInfo:v4];
  }

  else
  {
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
    BOOL v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1001A2AF8;
    block[3] = &unk_1002B5020;
    id v10 = v4;
    dispatch_async(v8, block);
  }
}

- (void)retrieveActiveDataSetRecordWithExtendedPANId:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = (void *)objc_claimAutoreleasedReturnValue(-[THThreadNetworkCredentialsStoreLocalClient backingStore](self, "backingStore"));
  if (v8)
  {
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_1001A2CD4;
    v14[3] = &unk_1002B5420;
    v9 = &v15;
    id v15 = v7;
    id v10 = v7;
    [v8 retrieveActiveDataSetRecordWithExtendedPANId:v6 completion:v14];
  }

  else
  {
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
    id v12 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1001A2C78;
    block[3] = &unk_1002B5020;
    v9 = &v17;
    id v17 = v7;
    id v13 = v7;
    dispatch_async(v12, block);
  }
}

- (void)retrieveActiveDataSetRecordOnMdnsWithExtendedPANId:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = (void *)objc_claimAutoreleasedReturnValue(-[THThreadNetworkCredentialsStoreLocalClient backingStore](self, "backingStore"));
  if (v8)
  {
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_1001A2EA0;
    v14[3] = &unk_1002B5420;
    v9 = &v15;
    id v15 = v7;
    id v10 = v7;
    [v8 retrieveActiveDataSetRecordOnMdnsWithExtendedPANId:v6 completion:v14];
  }

  else
  {
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
    id v12 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1001A2E44;
    block[3] = &unk_1002B5020;
    v9 = &v17;
    id v17 = v7;
    id v13 = v7;
    dispatch_async(v12, block);
  }
}

- (void)retrieveActiveDataSetRecordWithTLVsForThreadBorderAgent:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = (void *)objc_claimAutoreleasedReturnValue(-[THThreadNetworkCredentialsStoreLocalClient backingStore](self, "backingStore"));
  if (v8)
  {
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_1001A306C;
    v14[3] = &unk_1002B5420;
    v9 = &v15;
    id v15 = v7;
    id v10 = v7;
    [v8 retrieveActiveDataSetRecordWithTLVsForThreadBorderAgent:v6 completion:v14];
  }

  else
  {
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
    id v12 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1001A3010;
    block[3] = &unk_1002B5020;
    v9 = &v17;
    id v17 = v7;
    id v13 = v7;
    dispatch_async(v12, block);
  }
}

- (void)retrieveActiveDataSetRecordForThreadBorderAgent:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = (void *)objc_claimAutoreleasedReturnValue(-[THThreadNetworkCredentialsStoreLocalClient backingStore](self, "backingStore"));
  if (v8)
  {
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_1001A3238;
    v14[3] = &unk_1002B5420;
    v9 = &v15;
    id v15 = v7;
    id v10 = v7;
    [v8 retrieveActiveDataSetRecordForThreadBorderAgent:v6 completion:v14];
  }

  else
  {
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
    id v12 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1001A31DC;
    block[3] = &unk_1002B5020;
    v9 = &v17;
    id v17 = v7;
    id v13 = v7;
    dispatch_async(v12, block);
  }
}

- (void)retrieveAllActiveDataSetRecordsForClientKeychainAccessGroup:(id)a3 completion:(id)a4
{
}

- (void)retrieveAllActiveDataSetRecordsWithFlagForClientKeychainAccessGroup:(id)a3 activeFlag:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[THThreadNetworkCredentialsStoreLocalClient backingStore](self, "backingStore"));
  if (v10)
  {
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472LL;
    v16[2] = sub_1001A3418;
    v16[3] = &unk_1002B53D0;
    id v11 = &v17;
    id v17 = v9;
    id v12 = v9;
    [v10 retrieveAllActiveDataSetRecordsWithFlagForClientKeychainAccessGroup:v8 activeFlag:v6 compleiton:v16];
  }

  else
  {
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
    id v14 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1001A33BC;
    block[3] = &unk_1002B5020;
    id v11 = &v19;
    id v19 = v9;
    id v15 = v9;
    dispatch_async(v14, block);
  }
}

- (void)retrieveAllActiveDataSetRecordsForClientKeychainAccessGroup:(id)a3 compleiton:(id)a4
{
}

- (void)retrieveAllActiveDataSetRecordsWithFlagForClientKeychainAccessGroup:(id)a3 activeFlag:(BOOL)a4 compleiton:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[THThreadNetworkCredentialsStoreLocalClient backingStore](self, "backingStore"));
  if (v10)
  {
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472LL;
    v16[2] = sub_1001A3608;
    v16[3] = &unk_1002B53D0;
    id v11 = &v17;
    id v17 = v9;
    id v12 = v9;
    [v10 retrieveAllActiveDataSetRecordsWithFlagForClientKeychainAccessGroup:v8 activeFlag:v6 compleiton:v16];
  }

  else
  {
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
    id v14 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1001A35AC;
    block[3] = &unk_1002B5020;
    id v11 = &v19;
    id v19 = v9;
    id v15 = v9;
    dispatch_async(v14, block);
  }
}

- (void)checkIfRecordForPreferredNetworkIsPresentWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[THThreadNetworkCredentialsStoreLocalClient backingStore](self, "backingStore"));
  if (!v5)
  {
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
    id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1001A37BC;
    block[3] = &unk_1002B5020;
    id v14 = v4;
    dispatch_async(v8, block);

    BOOL v6 = v14;
    goto LABEL_5;
  }

  if ((_os_feature_enabled_impl("Home", "ThreadCommissioningService") & 1) != 0)
  {
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_1001A37D0;
    v11[3] = &unk_1002B5448;
    id v12 = v4;
    [v5 checkIfRecordForPreferredNetworkIsPresentWithCompletion:v11];
    BOOL v6 = v12;
LABEL_5:

    goto LABEL_9;
  }

  id v9 = sub_1001768B4(1);
  id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
    sub_1001A966C();
  }

  (*((void (**)(id, uint64_t, void))v4 + 2))(v4, 1LL, 0LL);
LABEL_9:
}

- (void)retrievePreferredNetworkWithNoScanWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[THThreadNetworkCredentialsStoreLocalClient backingStore](self, "backingStore"));
  if (v5)
  {
    if ((_os_feature_enabled_impl("Home", "ThreadCommissioningService") & 1) != 0)
    {
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472LL;
      v11[2] = sub_1001A39A8;
      v11[3] = &unk_1002B5420;
      id v12 = v4;
      [v5 retrievePreferredNetworkWithNoScanWithCompletion:v11];
      BOOL v6 = v12;
    }

    else
    {
      id v9 = sub_1001768B4(1);
      id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        sub_1001A96E0();
      }

      BOOL v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSError storeError:description:]( &OBJC_CLASS___NSError,  "storeError:description:",  17LL,  @"Feature is unsupported"));
      (*((void (**)(id, void, void *))v4 + 2))(v4, 0LL, v6);
    }
  }

  else
  {
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
    id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1001A394C;
    block[3] = &unk_1002B5020;
    id v14 = v4;
    dispatch_async(v8, block);

    BOOL v6 = v14;
  }
}

- (void)retrievePreferredNetworkWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[THThreadNetworkCredentialsStoreLocalClient backingStore](self, "backingStore"));
  if (v5)
  {
    if ((_os_feature_enabled_impl("Home", "ThreadCommissioningService") & 1) != 0)
    {
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472LL;
      v11[2] = sub_1001A3BFC;
      v11[3] = &unk_1002B5420;
      id v12 = v4;
      [v5 retrievePreferredNetworkWithCompletion:v11];
      BOOL v6 = v12;
    }

    else
    {
      id v9 = sub_1001768B4(1);
      id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        sub_1001A97C8();
      }

      BOOL v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSError storeError:description:]( &OBJC_CLASS___NSError,  "storeError:description:",  17LL,  @"Feature is unsupported"));
      (*((void (**)(id, void, void *))v4 + 2))(v4, 0LL, v6);
    }
  }

  else
  {
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
    id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1001A3BA0;
    block[3] = &unk_1002B5020;
    id v14 = v4;
    dispatch_async(v8, block);

    BOOL v6 = v14;
  }
}

- (void)retrievePreferredNetworkInternallyWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[THThreadNetworkCredentialsStoreLocalClient backingStore](self, "backingStore"));
  if (v5)
  {
    if ((_os_feature_enabled_impl("Home", "ThreadCommissioningService") & 1) != 0)
    {
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472LL;
      v11[2] = sub_1001A3E50;
      v11[3] = &unk_1002B5420;
      id v12 = v4;
      [v5 retrievePreferredNetworkInternallyWithCompletion:v11];
      BOOL v6 = v12;
    }

    else
    {
      id v9 = sub_1001768B4(1);
      id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        sub_1001A98B0();
      }

      BOOL v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSError storeError:description:]( &OBJC_CLASS___NSError,  "storeError:description:",  17LL,  @"Feature is unsupported"));
      (*((void (**)(id, void, void *))v4 + 2))(v4, 0LL, v6);
    }
  }

  else
  {
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
    id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1001A3DF4;
    block[3] = &unk_1002B5020;
    id v14 = v4;
    dispatch_async(v8, block);

    BOOL v6 = v14;
  }
}

- (void)retrievePreferredNetworkOfAnyDSFormatWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[THThreadNetworkCredentialsStoreLocalClient backingStore](self, "backingStore"));
  if (v5)
  {
    if ((_os_feature_enabled_impl("Home", "ThreadCommissioningService") & 1) != 0)
    {
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472LL;
      v11[2] = sub_1001A40A4;
      v11[3] = &unk_1002B5420;
      id v12 = v4;
      [v5 retrievePreferredNetworkOfAnyDSFormatWithCompletion:v11];
      BOOL v6 = v12;
    }

    else
    {
      id v9 = sub_1001768B4(1);
      id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        sub_1001A9998();
      }

      BOOL v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSError storeError:description:]( &OBJC_CLASS___NSError,  "storeError:description:",  17LL,  @"Feature is unsupported"));
      (*((void (**)(id, void, void *))v4 + 2))(v4, 0LL, v6);
    }
  }

  else
  {
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
    id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1001A4048;
    block[3] = &unk_1002B5020;
    id v14 = v4;
    dispatch_async(v8, block);

    BOOL v6 = v14;
  }
}

- (void)retrieveOrGeneratePreferredNetworkInternallyWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[THThreadNetworkCredentialsStoreLocalClient backingStore](self, "backingStore"));
  if (v5)
  {
    if ((_os_feature_enabled_impl("Home", "ThreadCommissioningService") & 1) != 0)
    {
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472LL;
      v11[2] = sub_1001A42C4;
      v11[3] = &unk_1002B5420;
      id v12 = v4;
      [v5 retrieveOrGeneratePreferredNetworkInternallyWithCompletion:v11];
      BOOL v6 = v12;
    }

    else
    {
      id v9 = sub_1001768B4(1);
      id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        sub_1001A9A0C();
      }

      BOOL v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSError storeError:description:]( &OBJC_CLASS___NSError,  "storeError:description:",  17LL,  @"Feature is unsupported"));
      (*((void (**)(id, void, void *))v4 + 2))(v4, 0LL, v6);
    }
  }

  else
  {
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
    id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1001A4268;
    block[3] = &unk_1002B5020;
    id v14 = v4;
    dispatch_async(v8, block);

    BOOL v6 = v14;
  }
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
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[THThreadNetworkCredentialsStoreLocalClient backingStore](self, "backingStore"));
  if (v22)
  {
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472LL;
    v28[2] = sub_1001A4500;
    v28[3] = &unk_1002B53A8;
    id v23 = &v29;
    id v29 = v21;
    id v24 = v21;
    [v22 addPreferredNetworkWithCompletionInternally:v15 borderAgentID:v16 ipV4NwSignature:v17 ipv6NwSignature:v18 wifiSSID:v19 wifiPassword:v20 completion:v28];
  }

  else
  {
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
    v26 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1001A44A8;
    block[3] = &unk_1002B5020;
    id v23 = &v31;
    id v31 = v21;
    id v27 = v21;
    dispatch_async(v26, block);
  }
}

- (void)deletePreferredNetworkForNetworkSignatureInternallyWithCompletion:(id)a3 ipv6NwSignature:(id)a4 wifiSSID:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = (void *)objc_claimAutoreleasedReturnValue(-[THThreadNetworkCredentialsStoreLocalClient backingStore](self, "backingStore"));
  if (v14)
  {
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472LL;
    v20[2] = sub_1001A46B0;
    v20[3] = &unk_1002B53A8;
    id v15 = &v21;
    id v21 = v13;
    id v16 = v13;
    [v14 deletePreferredNetworkForNetworkSignatureInternallyWithCompletion:v10 ipv6NwSignature:v11 wifiSSID:v12 completion:v20];
  }

  else
  {
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
    id v18 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1001A4658;
    block[3] = &unk_1002B5020;
    id v15 = &v23;
    id v23 = v13;
    id v19 = v13;
    dispatch_async(v18, block);
  }
}

- (void)deletePreferredNetworkEntryWithCompletion:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[THThreadNetworkCredentialsStoreLocalClient backingStore](self, "backingStore"));
  if (v8)
  {
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_1001A4830;
    v14[3] = &unk_1002B53A8;
    id v9 = &v15;
    id v15 = v7;
    id v10 = v7;
    [v8 deletePreferredNetworkEntryWithCompletion:v6 completion:v14];
  }

  else
  {
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
    id v12 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1001A47D8;
    block[3] = &unk_1002B5020;
    id v9 = &v17;
    id v17 = v7;
    id v13 = v7;
    dispatch_async(v12, block);
  }
}

- (void)deletePreferredNetworkWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[THThreadNetworkCredentialsStoreLocalClient backingStore](self, "backingStore"));
  if (v5)
  {
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_1001A4994;
    v11[3] = &unk_1002B53A8;
    id v6 = &v12;
    id v12 = v4;
    id v7 = v4;
    [v5 deletePreferredNetworkWithCompletion:v11];
  }

  else
  {
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
    id v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1001A493C;
    block[3] = &unk_1002B5020;
    id v6 = &v14;
    id v14 = v4;
    id v10 = v4;
    dispatch_async(v9, block);
  }
}

- (void)deletePreferredAndFrozenThreadNetworksWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[THThreadNetworkCredentialsStoreLocalClient backingStore](self, "backingStore"));
  if (v5)
  {
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_1001A4AF8;
    v11[3] = &unk_1002B53A8;
    id v6 = &v12;
    id v12 = v4;
    id v7 = v4;
    [v5 deletePreferredAndFrozenThreadNetworksWithCompletion:v11];
  }

  else
  {
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
    id v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1001A4AA0;
    block[3] = &unk_1002B5020;
    id v6 = &v14;
    id v14 = v4;
    id v10 = v4;
    dispatch_async(v9, block);
  }
}

- (void)storeCachedAODasPreferredNetwork:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[THThreadNetworkCredentialsStoreLocalClient backingStore](self, "backingStore"));
  if (v8)
  {
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_1001A4C7C;
    v14[3] = &unk_1002B5160;
    id v9 = &v15;
    id v15 = v7;
    id v10 = v7;
    [v8 storeCachedAODasPreferredNetwork:v6 completion:v14];
  }

  else
  {
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
    id v12 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1001A4C20;
    block[3] = &unk_1002B5020;
    id v9 = &v17;
    id v17 = v7;
    id v13 = v7;
    dispatch_async(v12, block);
  }
}

- (void)storeThreadNetworkCredentialActiveDataSet:(id)a3 network:(id)a4 credentialsDataSet:(id)a5 waitForSync:(BOOL)a6 completion:(id)a7
{
  BOOL v8 = a6;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  id v16 = (void *)objc_claimAutoreleasedReturnValue(-[THThreadNetworkCredentialsStoreLocalClient backingStore](self, "backingStore"));
  if (v16)
  {
    id v17 = (void *)objc_claimAutoreleasedReturnValue([v14 dataSetArray]);
    id v18 = (void *)objc_claimAutoreleasedReturnValue( -[THThreadNetworkCredentialsStoreLocalClient parseThreadNetworkActiveDataSet:]( self,  "parseThreadNetworkActiveDataSet:",  v17));

    if (v18)
    {
      id v19 = objc_alloc(&OBJC_CLASS___THThreadNetworkCredentialsActiveDataSetRecord);
      id v20 = (void *)objc_claimAutoreleasedReturnValue(-[THThreadNetworkCredentialsStoreLocalClient keychainAccessGroup](self, "keychainAccessGroup"));
      id v21 = -[THThreadNetworkCredentialsActiveDataSetRecord initWithBorderAgent:credentialsDataSet:network:credentials:uniqueIdentifier:keychainAccessGroup:creationDate:lastModificationDate:]( v19,  "initWithBorderAgent:credentialsDataSet:network:credentials:uniqueIdentifier:keychainAccessGroup:creationDa te:lastModificationDate:",  v12,  v14,  v13,  v18,  0LL,  v20,  0LL,  0LL);

      v28[0] = _NSConcreteStackBlock;
      v28[1] = 3221225472LL;
      v28[2] = sub_1001A4F94;
      v28[3] = &unk_1002B5160;
      id v29 = v15;
      [v16 storeThreadCredentialActiveDataSetRecord:v21 waitForSync:v8 completion:v28];
    }

    else
    {
      id v24 = sub_1001768B4(1);
      v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
        sub_1001A9A80();
      }

      dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
      id v27 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
      v30[0] = _NSConcreteStackBlock;
      v30[1] = 3221225472LL;
      v30[2] = sub_1001A4F38;
      v30[3] = &unk_1002B5020;
      id v31 = (THThreadNetworkCredentialsActiveDataSetRecord *)v15;
      dispatch_async(v27, v30);

      id v21 = v31;
    }
  }

  else
  {
    dispatch_queue_global_t v22 = dispatch_get_global_queue(0LL, 0LL);
    id v23 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v22);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1001A4EDC;
    block[3] = &unk_1002B5020;
    id v33 = v15;
    dispatch_async(v23, block);

    id v18 = v33;
  }
}

- (void)updatePreferredNetworkWithNewDataset:(id)a3 network:(id)a4 credentialsDataSet:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = (void *)objc_claimAutoreleasedReturnValue(-[THThreadNetworkCredentialsStoreLocalClient backingStore](self, "backingStore"));
  if (v14)
  {
    id v15 = (void *)objc_claimAutoreleasedReturnValue([v12 dataSetArray]);
    id v16 = (void *)objc_claimAutoreleasedReturnValue( -[THThreadNetworkCredentialsStoreLocalClient parseThreadNetworkActiveDataSet:]( self,  "parseThreadNetworkActiveDataSet:",  v15));

    if (v16)
    {
      id v17 = objc_alloc(&OBJC_CLASS___THThreadNetworkCredentialsActiveDataSetRecord);
      id v18 = (void *)objc_claimAutoreleasedReturnValue(-[THThreadNetworkCredentialsStoreLocalClient keychainAccessGroup](self, "keychainAccessGroup"));
      id v19 = -[THThreadNetworkCredentialsActiveDataSetRecord initWithBorderAgent:credentialsDataSet:network:credentials:uniqueIdentifier:keychainAccessGroup:creationDate:lastModificationDate:]( v17,  "initWithBorderAgent:credentialsDataSet:network:credentials:uniqueIdentifier:keychainAccessGroup:creationDa te:lastModificationDate:",  v10,  v12,  v11,  v16,  0LL,  v18,  0LL,  0LL);

      v26[0] = _NSConcreteStackBlock;
      v26[1] = 3221225472LL;
      v26[2] = sub_1001A52AC;
      v26[3] = &unk_1002B5470;
      id v27 = v13;
      [v14 updatePreferredNetworkWithNewDatasetRecord:v19 completion:v26];
    }

    else
    {
      id v22 = sub_1001768B4(1);
      id v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
        sub_1001A9A80();
      }

      dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
      v25 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
      v28[0] = _NSConcreteStackBlock;
      v28[1] = 3221225472LL;
      v28[2] = sub_1001A524C;
      v28[3] = &unk_1002B5020;
      id v29 = (THThreadNetworkCredentialsActiveDataSetRecord *)v13;
      dispatch_async(v25, v28);

      id v19 = v29;
    }
  }

  else
  {
    dispatch_queue_global_t v20 = dispatch_get_global_queue(0LL, 0LL);
    id v21 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v20);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1001A51EC;
    block[3] = &unk_1002B5020;
    id v31 = v13;
    dispatch_async(v21, block);

    id v16 = v31;
  }
}

- (void)storeThreadNetworkCredentialActiveDataSet:(id)a3 network:(id)a4 credentials:(id)a5 credentialsDataSet:(id)a6 waitForSync:(BOOL)a7 completion:(id)a8
{
  BOOL v9 = a7;
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a8;
  id v19 = (void *)objc_claimAutoreleasedReturnValue(-[THThreadNetworkCredentialsStoreLocalClient backingStore](self, "backingStore"));
  if (v19)
  {
    dispatch_queue_global_t v20 = objc_alloc(&OBJC_CLASS___THThreadNetworkCredentialsActiveDataSetRecord);
    id v21 = (void *)objc_claimAutoreleasedReturnValue(-[THThreadNetworkCredentialsStoreLocalClient keychainAccessGroup](self, "keychainAccessGroup"));
    id v22 = -[THThreadNetworkCredentialsActiveDataSetRecord initWithBorderAgent:credentialsDataSet:network:credentials:uniqueIdentifier:keychainAccessGroup:creationDate:lastModificationDate:]( v20,  "initWithBorderAgent:credentialsDataSet:network:credentials:uniqueIdentifier:keychainAccessGroup:creationDate :lastModificationDate:",  v14,  v17,  v15,  v16,  0LL,  v21,  0LL,  0LL);

    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472LL;
    v26[2] = sub_1001A54C4;
    v26[3] = &unk_1002B5160;
    id v27 = v18;
    id v23 = v18;
    [v19 storeThreadCredentialActiveDataSetRecord:v22 waitForSync:v9 completion:v26];
  }

  else
  {
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
    v25 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1001A5468;
    block[3] = &unk_1002B5020;
    id v29 = v18;
    id v22 = (THThreadNetworkCredentialsActiveDataSetRecord *)v18;
    dispatch_async(v25, block);

    id v23 = v29;
  }
}

- (void)retrieveActiveDataSetRecordWithUniqueIdentifierWithKeychainAccessGroup:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = (void *)objc_claimAutoreleasedReturnValue(-[THThreadNetworkCredentialsStoreLocalClient backingStore](self, "backingStore"));
  if (v8)
  {
    BOOL v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue( -[THThreadNetworkCredentialsStoreLocalClient keychainAccessGroup]( self,  "keychainAccessGroup"));
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_1001A565C;
    v14[3] = &unk_1002B5420;
    id v10 = &v15;
    id v15 = v7;
    id v11 = v7;
    [v8 retrieveActiveDataSetRecordWithUniqueIdentifierWithKeychainAccessGroup:v6 keychainAccessGroup:v9 completion:v14];
  }

  else
  {
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
    BOOL v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1001A5600;
    block[3] = &unk_1002B5020;
    id v10 = &v17;
    id v17 = v7;
    id v13 = v7;
    dispatch_async(v9, block);
  }
}

- (void)retrieveActiveDataSetRecordForThreadBorderAgentWithKeychainAccessGroup:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = (void *)objc_claimAutoreleasedReturnValue(-[THThreadNetworkCredentialsStoreLocalClient backingStore](self, "backingStore"));
  if (v8)
  {
    BOOL v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue( -[THThreadNetworkCredentialsStoreLocalClient keychainAccessGroup]( self,  "keychainAccessGroup"));
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_1001A583C;
    v14[3] = &unk_1002B5420;
    id v10 = &v15;
    id v15 = v7;
    id v11 = v7;
    [v8 retrieveActiveDataSetRecordForThreadBorderAgentWithKeychainAccessGroup:v6 keychainAccessGroup:v9 completion:v14];
  }

  else
  {
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
    BOOL v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1001A57E0;
    block[3] = &unk_1002B5020;
    id v10 = &v17;
    id v17 = v7;
    id v13 = v7;
    dispatch_async(v9, block);
  }
}

- (void)deleteActiveDataSetRecordWithUniqueIdentifierWithKeychainAccessGroup:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = (void *)objc_claimAutoreleasedReturnValue(-[THThreadNetworkCredentialsStoreLocalClient backingStore](self, "backingStore"));
  if (v8)
  {
    BOOL v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue( -[THThreadNetworkCredentialsStoreLocalClient keychainAccessGroup]( self,  "keychainAccessGroup"));
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_1001A5A18;
    v14[3] = &unk_1002B53A8;
    id v10 = &v15;
    id v15 = v7;
    id v11 = v7;
    [v8 deleteActiveDataSetRecordWithUniqueIdentifierWithKeychainAccessGroup:v6 keychainAccessGroup:v9 completion:v14];
  }

  else
  {
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
    BOOL v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1001A59C0;
    block[3] = &unk_1002B5020;
    id v10 = &v17;
    id v17 = v7;
    id v13 = v7;
    dispatch_async(v9, block);
  }
}

- (void)deleteActiveDataSetRecordForThreadBorderAgentWithKeychainAccessGroup:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = (void *)objc_claimAutoreleasedReturnValue(-[THThreadNetworkCredentialsStoreLocalClient backingStore](self, "backingStore"));
  if (v8)
  {
    BOOL v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue( -[THThreadNetworkCredentialsStoreLocalClient keychainAccessGroup]( self,  "keychainAccessGroup"));
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_1001A5BAC;
    v14[3] = &unk_1002B53A8;
    id v10 = &v15;
    id v15 = v7;
    id v11 = v7;
    [v8 deleteActiveDataSetRecordForThreadBorderAgentWithKeychainAccessGroup:v6 keychainAccessGroup:v9 completion:v14];
  }

  else
  {
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
    BOOL v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1001A5B54;
    block[3] = &unk_1002B5020;
    id v10 = &v17;
    id v17 = v7;
    id v13 = v7;
    dispatch_async(v9, block);
  }
}

- (void)validateRecordWithMdnsScanWithDataSet:(id)a3 borderAgentID:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[THThreadNetworkCredentialsStoreLocalClient backingStore](self, "backingStore"));
  if (v11)
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue( -[THThreadNetworkCredentialsStoreLocalClient parseActiveOperationalDataSet:]( self,  "parseActiveOperationalDataSet:",  v8));
    id v13 = v12;
    if (v12)
    {
      id v14 = (void *)objc_claimAutoreleasedReturnValue([v12 network]);
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472LL;
      v20[2] = sub_1001A5E48;
      v20[3] = &unk_1002B5498;
      id v15 = &v22;
      id v22 = v10;
      id v21 = v13;
      [v11 validateRecordWithMdnsScan:v14 borderAgentID:v9 completion:v20];

      id v16 = v21;
    }

    else
    {
      dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
      id v16 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
      v23[0] = _NSConcreteStackBlock;
      v23[1] = 3221225472LL;
      v23[2] = sub_1001A5DE8;
      v23[3] = &unk_1002B5020;
      id v15 = &v24;
      id v24 = v10;
      dispatch_async(v16, v23);
    }
  }

  else
  {
    dispatch_queue_global_t v17 = dispatch_get_global_queue(0LL, 0LL);
    id v18 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v17);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1001A5D88;
    block[3] = &unk_1002B5020;
    id v26 = v10;
    dispatch_async(v18, block);

    id v13 = v26;
  }
}

- (void)checkIsPreferredNetworkForActiveOperationalDataset:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[THThreadNetworkCredentialsStoreLocalClient backingStore](self, "backingStore"));
    if (!v8)
    {
      dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
      id v13 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472LL;
      v19[2] = sub_1001A6100;
      v19[3] = &unk_1002B5020;
      id v20 = v7;
      dispatch_async(v13, v19);

      id v9 = v20;
      goto LABEL_7;
    }

    if ((_os_feature_enabled_impl("Home", "ThreadCommissioningService") & 1) != 0)
    {
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472LL;
      v16[2] = sub_1001A6158;
      v16[3] = &unk_1002B54C0;
      id v17 = v6;
      id v18 = v7;
      [v8 retrievePreferredNetworkWithCompletion:v16];

      id v9 = v17;
LABEL_7:

      goto LABEL_11;
    }

    id v14 = sub_1001768B4(1);
    id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_1001A9AAC();
    }

    (*((void (**)(id, void))v7 + 2))(v7, 0LL);
  }

  else
  {
    dispatch_queue_global_t v10 = dispatch_get_global_queue(0LL, 0LL);
    id v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v10);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1001A60A8;
    block[3] = &unk_1002B5020;
    id v22 = v7;
    dispatch_async(v11, block);

    id v8 = v22;
  }

- (void)updatePreferredNetworkInternallyWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[THThreadNetworkCredentialsStoreLocalClient backingStore](self, "backingStore"));
  if (v5)
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472LL;
    v6[2] = sub_1001A63A8;
    v6[3] = &unk_1002B54E8;
    id v7 = v4;
    [v5 updatePreferredNetworkInternallyWithCompletion:v6];
  }

  else
  {
    (*((void (**)(id, void))v4 + 2))(v4, 0LL);
  }
}

- (void)cleanThreadKeychainDatabase:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[THThreadNetworkCredentialsStoreLocalClient backingStore](self, "backingStore"));
  if (v5)
  {
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_1001A650C;
    v11[3] = &unk_1002B53A8;
    id v6 = &v12;
    id v12 = v4;
    id v7 = v4;
    [v5 cleanThreadKeychainDatabase:v11];
  }

  else
  {
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
    id v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1001A64B4;
    block[3] = &unk_1002B5020;
    id v6 = &v14;
    id v14 = v4;
    id v10 = v4;
    dispatch_async(v9, block);
  }
}

- (void)validateAODInternally:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[THThreadNetworkCredentialsStoreLocalClient backingStore](self, "backingStore"));
  if (v8)
  {
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_1001A6690;
    v14[3] = &unk_1002B5420;
    id v9 = &v15;
    id v15 = v7;
    id v10 = v7;
    [v8 validateAODInternally:v6 completion:v14];
  }

  else
  {
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
    id v12 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1001A6634;
    block[3] = &unk_1002B5020;
    id v9 = &v17;
    id v17 = v7;
    id v13 = v7;
    dispatch_async(v12, block);
  }
}

- (id)setFromSpinelFrame:(const char *)a3 data_len:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = sub_1001768B4(1);
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    sub_1001A9EFC(v4, v7);
  }

  sub_100159A78((unint64_t)a3, v4, v84, 0x3E8uLL, 0);
  id v8 = sub_1001768B4(1);
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
    sub_1001A9E8C();
  }

  if ((_DWORD)v4)
  {
    id v10 = 0LL;
    id v11 = 0LL;
    id v12 = 0LL;
    unsigned __int8 v63 = 0;
    while (1)
    {
      id v13 = sub_1001768B4(1);
      id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109376;
        *(_DWORD *)v81 = v4;
        *(_WORD *)&v81[4] = 1024;
        *(_DWORD *)&v81[6] = 955;
        _os_log_error_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_ERROR,  "#MOS : data_len : %d, Line : %d",  buf,  0xEu);
      }

      int v20 = spinel_datatype_unpack(a3, v4, "d", v15, v16, v17, v18, v19, (uint64_t)&v69);
      id v21 = sub_1001768B4(1);
      id v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109376;
        *(_DWORD *)v81 = v20;
        *(_WORD *)&v81[4] = 1024;
        *(_DWORD *)&v81[6] = 967;
        _os_log_error_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_ERROR,  "#MOS : length : %d, Line : %d",  buf,  0xEu);
      }

      if (v20 < 1) {
        goto LABEL_53;
      }
      v62 = &v67;
      int v28 = spinel_datatype_unpack(v69, v68[1], "iD", v23, v24, v25, v26, v27, (uint64_t)v68);
      id v29 = sub_1001768B4(1);
      v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109632;
        *(_DWORD *)v81 = v68[0];
        *(_WORD *)&v81[4] = 1024;
        *(_DWORD *)&v81[6] = v28;
        __int16 v82 = 1024;
        int v83 = 988;
        _os_log_error_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_ERROR,  "#MOS : propkey : %d, length: %d, Line : %d",  buf,  0x14u);
      }

      if (v28 < 1) {
        goto LABEL_53;
      }
      if (v68[0] > 69)
      {
        if (v68[0] == 75)
        {
          id v51 = sub_1001768B4(1);
          v52 = (os_log_s *)objc_claimAutoreleasedReturnValue(v51);
          if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR)) {
            sub_1001A9E50(v72, v73, v52);
          }

          uint64_t v53 = objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:", v67, v66));
          id v54 = sub_1001768B4(1);
          v55 = (os_log_s *)objc_claimAutoreleasedReturnValue(v54);
          if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138739971;
            *(void *)v81 = v53;
            _os_log_error_impl( (void *)&_mh_execute_header,  v55,  OS_LOG_TYPE_ERROR,  "#MOS : PSKc : %{sensitive}@",  buf,  0xCu);
          }

          id v12 = (void *)v53;
          goto LABEL_45;
        }

        if (v68[0] == 70)
        {
          if (!v66) {
            goto LABEL_53;
          }
          id v42 = sub_1001768B4(1);
          v43 = (os_log_s *)objc_claimAutoreleasedReturnValue(v42);
          if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR)) {
            sub_1001A9D9C(v78, v79, v43);
          }

          v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:", v67, v66));
          id v44 = sub_1001768B4(1);
          v45 = (os_log_s *)objc_claimAutoreleasedReturnValue(v44);
          if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138739971;
            *(void *)v81 = v41;
            _os_log_error_impl( (void *)&_mh_execute_header,  v45,  OS_LOG_TYPE_ERROR,  "#MOS : Master Key: %{sensitive}@",  buf,  0xCu);
          }

          goto LABEL_46;
        }
      }

      else
      {
        if (v68[0] == 33)
        {
          id v48 = sub_1001768B4(1);
          v49 = (os_log_s *)objc_claimAutoreleasedReturnValue(v48);
          if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR)) {
            sub_1001A9E14(v74, v75, v49);
          }

          unsigned __int8 v63 = v65;
          id v50 = sub_1001768B4(1);
          v47 = (os_log_s *)objc_claimAutoreleasedReturnValue(v50);
          if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 67109120;
            *(_DWORD *)v81 = v65;
            _os_log_error_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_ERROR, "#MOS : Channel : %d", buf, 8u);
          }

          goto LABEL_39;
        }

        if (v68[0] == 54)
        {
          id v36 = sub_1001768B4(1);
          v37 = (os_log_s *)objc_claimAutoreleasedReturnValue(v36);
          if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
            sub_1001A9DD8(v76, v77, v37);
          }

          unsigned __int16 v64 = bswap32(v65) >> 16;
          uint64_t v38 = objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:", &v64, 2LL));

          id v39 = sub_1001768B4(1);
          v40 = (os_log_s *)objc_claimAutoreleasedReturnValue(v39);
          if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 67109120;
            *(_DWORD *)v81 = v64;
            _os_log_error_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_ERROR, "#MOS : PANID : %hu", buf, 8u);
          }

          v41 = v11;
          id v10 = (void *)v38;
          goto LABEL_46;
        }
      }

      id v46 = sub_1001768B4(1);
      v47 = (os_log_s *)objc_claimAutoreleasedReturnValue(v46);
      if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR)) {
        sub_1001A9D60(v70, v71, v47);
      }
LABEL_39:

LABEL_45:
      v41 = v11;
LABEL_46:
      a3 += v20;
      id v11 = v41;
      uint64_t v4 = (v4 - v20);
      if (!(_DWORD)v4) {
        goto LABEL_49;
      }
    }
  }

  unsigned __int8 v63 = 0;
  id v12 = 0LL;
  v41 = 0LL;
  id v10 = 0LL;
LABEL_49:
  LOBYTE(v62) = 1;
  v56 = -[THThreadNetworkCredentials initWithMasterKey:passPhrase:PSKc:channel:PANID:userInfo:credentialDataSet:isActiveDevice:]( objc_alloc(&OBJC_CLASS___THThreadNetworkCredentials),  "initWithMasterKey:passPhrase:PSKc:channel:PANID:userInfo:credentialDataSet:isActiveDevice:",  v41,  0LL,  v12,  v63,  v10,  0LL,  0LL,  v62);
  if (v56)
  {
    v57 = v56;
    id v58 = sub_1001768B4(1);
    v59 = (os_log_s *)objc_claimAutoreleasedReturnValue(v58);
    if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR)) {
      sub_1001A9CF0();
    }
  }

  else
  {
    id v11 = v41;
LABEL_53:
    id v60 = sub_1001768B4(1);
    v59 = (os_log_s *)objc_claimAutoreleasedReturnValue(v60);
    if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR)) {
      sub_1001A9C7C();
    }
    v57 = 0LL;
    v41 = v11;
  }

  return v57;
}

- (id)parseDataSetFromSpinel:(const char *)a3 data_len:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = sub_1001768B4(1);
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    sub_1001AA164();
  }

  sub_100159A78((unint64_t)a3, v4, v105, 0x3E8uLL, 0);
  id v8 = sub_1001768B4(1);
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
    sub_1001AA0F0();
  }

  if (!(_DWORD)v4)
  {
    unsigned __int8 v90 = 0;
    id v14 = 0LL;
    id v13 = 0LL;
    id v12 = 0LL;
    id v11 = 0LL;
    v40 = 0LL;
LABEL_60:
    LOBYTE(v89) = 1;
    v76 = -[THThreadNetworkCredentials initWithMasterKey:passPhrase:PSKc:channel:PANID:userInfo:credentialDataSet:isActiveDevice:]( objc_alloc(&OBJC_CLASS___THThreadNetworkCredentials),  "initWithMasterKey:passPhrase:PSKc:channel:PANID:userInfo:credentialDataSet:isActiveDevice:",  v13,  0LL,  v14,  v90,  v12,  0LL,  0LL,  v89);
    id v77 = sub_1001768B4(1);
    v78 = (os_log_s *)objc_claimAutoreleasedReturnValue(v77);
    BOOL v79 = os_log_type_enabled(v78, OS_LOG_TYPE_ERROR);
    if (v76)
    {
      if (v79) {
        sub_1001A9FD4();
      }

      id v80 = [[THThreadNetwork alloc] initWithName:v40 extendedPANID:v11];
      if (v80)
      {
        v81 = v80;
        __int16 v82 = -[THThreadNetworkCredentialsStoreRecord initWithNetwork:credentials:uniqueIdentifier:keychainAccessGroup:creationDate:lastModificationDate:]( objc_alloc(&OBJC_CLASS___THThreadNetworkCredentialsStoreRecord),  "initWithNetwork:credentials:uniqueIdentifier:keychainAccessGroup:creationDate:lastModificationDate:",  v80,  v76,  0LL,  @"com.apple.thread.network",  0LL,  0LL);
        if (v82)
        {
          int v83 = v82;

          goto LABEL_81;
        }

        id v86 = sub_1001768B4(1);
        v87 = (os_log_s *)objc_claimAutoreleasedReturnValue(v86);
        if (os_log_type_enabled(v87, OS_LOG_TYPE_ERROR)) {
          sub_100199D50();
        }
      }

      else
      {
        id v84 = sub_1001768B4(1);
        v85 = (os_log_s *)objc_claimAutoreleasedReturnValue(v84);
        if (os_log_type_enabled(v85, OS_LOG_TYPE_ERROR)) {
          sub_1001A9FA8();
        }
      }
    }

    else
    {
      if (v79) {
        sub_1001A9F7C();
      }
    }

    int v83 = 0LL;
    goto LABEL_81;
  }

  id v10 = 0LL;
  id v11 = 0LL;
  id v12 = 0LL;
  id v13 = 0LL;
  id v14 = 0LL;
  unsigned __int8 v90 = 0;
  while (1)
  {
    id v15 = sub_1001768B4(1);
    uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v100 = "-[THThreadNetworkCredentialsStoreLocalClient parseDataSetFromSpinel:data_len:]";
      __int16 v101 = 1024;
      *(_DWORD *)v102 = v4;
      *(_WORD *)&v102[4] = 1024;
      *(_DWORD *)&v102[6] = 1101;
      _os_log_error_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_ERROR,  "%s: #MOS : data_len : %d, Line : %d",  buf,  0x18u);
    }

    int v22 = spinel_datatype_unpack(a3, v4, "d", v17, v18, v19, v20, v21, (uint64_t)&v96);
    id v23 = sub_1001768B4(1);
    uint64_t v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v100 = "-[THThreadNetworkCredentialsStoreLocalClient parseDataSetFromSpinel:data_len:]";
      __int16 v101 = 1024;
      *(_DWORD *)v102 = v22;
      *(_WORD *)&v102[4] = 1024;
      *(_DWORD *)&v102[6] = 1113;
      _os_log_error_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_ERROR,  "%s: #MOS : length : %d, Line : %d",  buf,  0x18u);
    }

    if (v22 < 1) {
      break;
    }
    v89 = &v94;
    int v30 = spinel_datatype_unpack(v96, v95[1], "iD", v25, v26, v27, v28, v29, (uint64_t)v95);
    id v31 = sub_1001768B4(1);
    uint64_t v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v100 = "-[THThreadNetworkCredentialsStoreLocalClient parseDataSetFromSpinel:data_len:]";
      __int16 v101 = 1024;
      *(_DWORD *)v102 = v95[0];
      *(_WORD *)&v102[4] = 1024;
      *(_DWORD *)&v102[6] = v30;
      __int16 v103 = 1024;
      int v104 = 1134;
      _os_log_error_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_ERROR,  "%s: #MOS : propkey : %d, length: %d, Line : %d",  buf,  0x1Eu);
    }

    if (v30 < 1) {
      break;
    }
    switch(v95[0])
    {
      case 'D':
        id v38 = sub_1001768B4(1);
        id v39 = (os_log_s *)objc_claimAutoreleasedReturnValue(v38);
        if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          v100 = "-[THThreadNetworkCredentialsStoreLocalClient parseDataSetFromSpinel:data_len:]";
          __int16 v101 = 1024;
          *(_DWORD *)v102 = 1152;
          _os_log_error_impl( (void *)&_mh_execute_header,  v39,  OS_LOG_TYPE_ERROR,  "%s: #MOS : ==> Decoded Network Name Line : %d",  buf,  0x12u);
        }

        v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v92));
        id v41 = sub_1001768B4(1);
        id v42 = (os_log_s *)objc_claimAutoreleasedReturnValue(v41);
        BOOL v43 = os_log_type_enabled(v42, OS_LOG_TYPE_ERROR);
        if (v40)
        {
          if (v43)
          {
            *(_DWORD *)buf = 136315394;
            v100 = "-[THThreadNetworkCredentialsStoreLocalClient parseDataSetFromSpinel:data_len:]";
            __int16 v101 = 2112;
            *(void *)v102 = v40;
            _os_log_error_impl( (void *)&_mh_execute_header,  v42,  OS_LOG_TYPE_ERROR,  "%s : #MOS : Network Name : %@",  buf,  0x16u);
          }

          goto LABEL_57;
        }

        if (v43) {
          sub_1001AA080(v42, v44, v45, v46, v47, v48, v49, v50);
        }

        id v10 = 0LL;
        goto LABEL_80;
      case 'E':
        if (!v93) {
          goto LABEL_80;
        }
        id v58 = sub_1001768B4(1);
        v59 = (os_log_s *)objc_claimAutoreleasedReturnValue(v58);
        if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          v100 = "-[THThreadNetworkCredentialsStoreLocalClient parseDataSetFromSpinel:data_len:]";
          __int16 v101 = 1024;
          *(_DWORD *)v102 = 1166;
          _os_log_error_impl( (void *)&_mh_execute_header,  v59,  OS_LOG_TYPE_ERROR,  "%s: #MOS : ==> Decoded XPAN ID : %d",  buf,  0x12u);
        }

        uint64_t v60 = objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:", v94, v93));
        id v61 = sub_1001768B4(1);
        v62 = (os_log_s *)objc_claimAutoreleasedReturnValue(v61);
        if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          v100 = "-[THThreadNetworkCredentialsStoreLocalClient parseDataSetFromSpinel:data_len:]";
          __int16 v101 = 2112;
          *(void *)v102 = v60;
          _os_log_error_impl((void *)&_mh_execute_header, v62, OS_LOG_TYPE_ERROR, "%s: #MOS : XPAN ID: %@", buf, 0x16u);
        }

        id v11 = (void *)v60;
        goto LABEL_56;
      case 'F':
        if (!v93) {
          goto LABEL_80;
        }
        id v63 = sub_1001768B4(1);
        unsigned __int16 v64 = (os_log_s *)objc_claimAutoreleasedReturnValue(v63);
        if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          v100 = "-[THThreadNetworkCredentialsStoreLocalClient parseDataSetFromSpinel:data_len:]";
          __int16 v101 = 1024;
          *(_DWORD *)v102 = 1176;
          _os_log_error_impl( (void *)&_mh_execute_header,  v64,  OS_LOG_TYPE_ERROR,  "%s: #MOS : ==> Decoded master key Line : %d",  buf,  0x12u);
        }

        uint64_t v65 = objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:", v94, v93));
        id v66 = sub_1001768B4(1);
        v67 = (os_log_s *)objc_claimAutoreleasedReturnValue(v66);
        if (os_log_type_enabled(v67, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315395;
          v100 = "-[THThreadNetworkCredentialsStoreLocalClient parseDataSetFromSpinel:data_len:]";
          __int16 v101 = 2117;
          *(void *)v102 = v65;
          _os_log_error_impl( (void *)&_mh_execute_header,  v67,  OS_LOG_TYPE_ERROR,  "%s: #MOS : Master Key: %{sensitive}@",  buf,  0x16u);
        }

        id v13 = (void *)v65;
        goto LABEL_56;
      case 'G':
      case 'H':
      case 'I':
      case 'J':
        goto LABEL_31;
      case 'K':
        id v68 = sub_1001768B4(1);
        v69 = (os_log_s *)objc_claimAutoreleasedReturnValue(v68);
        if (os_log_type_enabled(v69, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          v100 = "-[THThreadNetworkCredentialsStoreLocalClient parseDataSetFromSpinel:data_len:]";
          __int16 v101 = 1024;
          *(_DWORD *)v102 = 1225;
          _os_log_error_impl( (void *)&_mh_execute_header,  v69,  OS_LOG_TYPE_ERROR,  "%s: #MOS : ==> Decoded pskc Line : %d",  buf,  0x12u);
        }

        uint64_t v70 = objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:", v94, v93));
        id v71 = sub_1001768B4(1);
        v72 = (os_log_s *)objc_claimAutoreleasedReturnValue(v71);
        if (os_log_type_enabled(v72, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315395;
          v100 = "-[THThreadNetworkCredentialsStoreLocalClient parseDataSetFromSpinel:data_len:]";
          __int16 v101 = 2117;
          *(void *)v102 = v70;
          _os_log_error_impl( (void *)&_mh_execute_header,  v72,  OS_LOG_TYPE_ERROR,  "%s: #MOS : PSKc : %{sensitive}@",  buf,  0x16u);
        }

        id v14 = (void *)v70;
        goto LABEL_56;
      default:
        if (v95[0] == 33)
        {
          id v73 = sub_1001768B4(1);
          v74 = (os_log_s *)objc_claimAutoreleasedReturnValue(v73);
          if (os_log_type_enabled(v74, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315394;
            v100 = "-[THThreadNetworkCredentialsStoreLocalClient parseDataSetFromSpinel:data_len:]";
            __int16 v101 = 1024;
            *(_DWORD *)v102 = 1215;
            _os_log_error_impl( (void *)&_mh_execute_header,  v74,  OS_LOG_TYPE_ERROR,  "%s: #MOS : ==> Decoded channel Line : %d",  buf,  0x12u);
          }

          unsigned __int8 v90 = v92;
          id v75 = sub_1001768B4(1);
          v57 = (os_log_s *)objc_claimAutoreleasedReturnValue(v75);
          if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315394;
            v100 = "-[THThreadNetworkCredentialsStoreLocalClient parseDataSetFromSpinel:data_len:]";
            __int16 v101 = 1024;
            *(_DWORD *)v102 = v92;
            _os_log_error_impl( (void *)&_mh_execute_header,  v57,  OS_LOG_TYPE_ERROR,  "%s: #MOS : Channel : %d",  buf,  0x12u);
          }

          goto LABEL_55;
        }

        if (v95[0] != 54)
        {
LABEL_31:
          id v56 = sub_1001768B4(1);
          v57 = (os_log_s *)objc_claimAutoreleasedReturnValue(v56);
          if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR)) {
            sub_1001AA044(v97, v98, v57);
          }
LABEL_55:

          goto LABEL_56;
        }

        id v51 = sub_1001768B4(1);
        v52 = (os_log_s *)objc_claimAutoreleasedReturnValue(v51);
        if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          v100 = "-[THThreadNetworkCredentialsStoreLocalClient parseDataSetFromSpinel:data_len:]";
          __int16 v101 = 1024;
          *(_DWORD *)v102 = 1195;
          _os_log_error_impl( (void *)&_mh_execute_header,  v52,  OS_LOG_TYPE_ERROR,  "%s: #MOS : ==> Decoded pan id Line : %d",  buf,  0x12u);
        }

        unsigned __int16 v91 = bswap32((unsigned __int16)v92) >> 16;
        uint64_t v53 = objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:", &v91, 2LL));

        id v54 = sub_1001768B4(1);
        v55 = (os_log_s *)objc_claimAutoreleasedReturnValue(v54);
        if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          v100 = "-[THThreadNetworkCredentialsStoreLocalClient parseDataSetFromSpinel:data_len:]";
          __int16 v101 = 1024;
          *(_DWORD *)v102 = v91;
          _os_log_error_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_ERROR, "%s: #MOS : PANID : %hu", buf, 0x12u);
        }

        id v12 = (void *)v53;
LABEL_56:
        v40 = v10;
LABEL_57:
        a3 += v22;
        id v10 = v40;
        uint64_t v4 = (v4 - v22);
        if (!(_DWORD)v4) {
          goto LABEL_60;
        }
        break;
    }
  }

- (id)parseActiveOperationalDataSet:(id)a3
{
  id v4 = a3;
  id v5 = [v4 bytes];
  id v6 = [v4 length];

  return -[THThreadNetworkCredentialsStoreLocalClient parseDataSetFromTLVs:data_len:]( self,  "parseDataSetFromTLVs:data_len:",  v5,  v6);
}

- (id)parseThreadNetworkActiveDataSet:(id)a3
{
  id v4 = a3;
  id v5 = [v4 bytes];
  id v6 = [v4 length];

  return -[THThreadNetworkCredentialsStoreLocalClient parseCredsFromTLVs:data_len:]( self,  "parseCredsFromTLVs:data_len:",  v5,  v6);
}

- (id)parseDataSetFromTLVs:(const char *)a3 data_len:(unsigned int)a4
{
  id v6 = sub_1001768B4(1);
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    sub_1001AAA60();
  }

  sub_100159A78((unint64_t)a3, a4, v106, 0x3E8uLL, 0);
  id v8 = sub_1001768B4(1);
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
    sub_1001AA9EC();
  }

  if (a4)
  {
    id v10 = 0LL;
    v100 = 0LL;
    __int16 v101 = 0LL;
    v98 = 0LL;
    v99 = 0LL;
    LOBYTE(v11) = 0;
    unsigned int v12 = 0;
    while (1)
    {
      uint64_t v13 = v12 + 1LL;
      uint64_t v14 = a3[v13];
      uint64_t v15 = v12 + 2LL;
      unsigned int v16 = v12 + 2 + v14;
      if (v16 > a4)
      {
        id v76 = sub_1001768B4(1);
        uint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v76);
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
          sub_1001AA2BC();
        }
LABEL_132:
        id v73 = 0LL;
        goto LABEL_133;
      }

      int v17 = a3[v12];
      switch(a3[v12])
      {
        case 0:
          id v18 = sub_1001768B4(1);
          uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315394;
            __int16 v103 = "-[THThreadNetworkCredentialsStoreLocalClient parseDataSetFromTLVs:data_len:]";
            __int16 v104 = 1024;
            *(_DWORD *)v105 = 1468;
            _os_log_error_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_ERROR,  "%s: #MOS : ==> Decoded channel Line : %d",  buf,  0x12u);
          }

          if ((_DWORD)v14 != 3)
          {
            id v85 = sub_1001768B4(1);
            uint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v85);
            if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
              sub_1001AA5D8();
            }
            goto LABEL_132;
          }

          if (a3[v15])
          {
            id v93 = sub_1001768B4(1);
            uint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v93);
            if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
              sub_1001AA568();
            }
            goto LABEL_132;
          }

          int v11 = a3[v12 + 4];
          id v20 = sub_1001768B4(1);
          uint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
          BOOL v22 = os_log_type_enabled(v21, OS_LOG_TYPE_ERROR);
          if ((v11 - 27) <= 0xEFu)
          {
            if (v22) {
              sub_1001AA4FC();
            }
            goto LABEL_132;
          }

          if (!v22) {
            goto LABEL_61;
          }
          *(_DWORD *)buf = 136315394;
          __int16 v103 = "-[THThreadNetworkCredentialsStoreLocalClient parseDataSetFromTLVs:data_len:]";
          __int16 v104 = 1024;
          *(_DWORD *)v105 = v11;
          id v23 = v21;
          uint64_t v24 = "%s: #MOS : Channel : %d";
          uint32_t v25 = 18;
          goto LABEL_31;
        case 1:
          id v32 = sub_1001768B4(1);
          uint64_t v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
          if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315394;
            __int16 v103 = "-[THThreadNetworkCredentialsStoreLocalClient parseDataSetFromTLVs:data_len:]";
            __int16 v104 = 1024;
            *(_DWORD *)v105 = 1502;
            _os_log_error_impl( (void *)&_mh_execute_header,  v33,  OS_LOG_TYPE_ERROR,  "%s: #MOS : ==> Decoded pan id Line : %d",  buf,  0x12u);
          }

          if ((_DWORD)v14 != 2)
          {
            id v86 = sub_1001768B4(1);
            uint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v86);
            if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
              sub_1001AA64C();
            }
            goto LABEL_132;
          }

          uint64_t v34 = objc_claimAutoreleasedReturnValue( +[NSData dataWithBytes:length:]( &OBJC_CLASS___NSData,  "dataWithBytes:length:",  &a3[v15],  2LL));

          id v35 = sub_1001768B4(1);
          uint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v35);
          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315394;
            __int16 v103 = "-[THThreadNetworkCredentialsStoreLocalClient parseDataSetFromTLVs:data_len:]";
            __int16 v104 = 2112;
            *(void *)v105 = v34;
            _os_log_error_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "%s: #MOS : PANID : %@", buf, 0x16u);
          }

          v99 = (void *)v34;
          goto LABEL_61;
        case 2:
          id v36 = sub_1001768B4(1);
          uint64_t v37 = (os_log_s *)objc_claimAutoreleasedReturnValue(v36);
          if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315394;
            __int16 v103 = "-[THThreadNetworkCredentialsStoreLocalClient parseDataSetFromTLVs:data_len:]";
            __int16 v104 = 1024;
            *(_DWORD *)v105 = 1517;
            _os_log_error_impl( (void *)&_mh_execute_header,  v37,  OS_LOG_TYPE_ERROR,  "%s: #MOS : ==> Decoded XPAN ID : %d",  buf,  0x12u);
          }

          if ((_DWORD)v14 != 8)
          {
            id v87 = sub_1001768B4(1);
            uint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v87);
            if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
              sub_1001AA6C0();
            }
            goto LABEL_132;
          }

          uint64_t v38 = objc_claimAutoreleasedReturnValue( +[NSData dataWithBytes:length:]( &OBJC_CLASS___NSData,  "dataWithBytes:length:",  &a3[v15],  8LL));

          id v39 = sub_1001768B4(1);
          uint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v39);
          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315394;
            __int16 v103 = "-[THThreadNetworkCredentialsStoreLocalClient parseDataSetFromTLVs:data_len:]";
            __int16 v104 = 2112;
            *(void *)v105 = v38;
            _os_log_error_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_ERROR,  "%s: #MOS : XPAN ID: %@",  buf,  0x16u);
          }

          __int16 v101 = (void *)v38;
          goto LABEL_61;
        case 3:
          __memcpy_chk(v107, &a3[v15], a3[v13], 255LL);
          v107[v14] = 0;
          id v40 = sub_1001768B4(1);
          id v41 = (os_log_s *)objc_claimAutoreleasedReturnValue(v40);
          if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315394;
            __int16 v103 = "-[THThreadNetworkCredentialsStoreLocalClient parseDataSetFromTLVs:data_len:]";
            __int16 v104 = 1024;
            *(_DWORD *)v105 = 1457;
            _os_log_error_impl( (void *)&_mh_execute_header,  v41,  OS_LOG_TYPE_ERROR,  "%s: #MOS : ==> Decoded Network Name Line : %d",  buf,  0x12u);
          }

          uint64_t v42 = objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v107));
          id v43 = sub_1001768B4(1);
          uint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v43);
          BOOL v44 = os_log_type_enabled(v21, OS_LOG_TYPE_ERROR);
          if (!v42)
          {
            if (v44) {
              sub_1001AA48C(v21, v45, v46, v47, v48, v49, v50, v51);
            }
            id v73 = 0LL;
            id v10 = 0LL;
            goto LABEL_133;
          }

          if (v44)
          {
            *(_DWORD *)buf = 136315394;
            __int16 v103 = "-[THThreadNetworkCredentialsStoreLocalClient parseDataSetFromTLVs:data_len:]";
            __int16 v104 = 2112;
            *(void *)v105 = v42;
            _os_log_error_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_ERROR,  "%s : #MOS : Network Name : %@",  buf,  0x16u);
          }

          goto LABEL_62;
        case 4:
          id v52 = sub_1001768B4(1);
          uint64_t v53 = (os_log_s *)objc_claimAutoreleasedReturnValue(v52);
          if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315394;
            __int16 v103 = "-[THThreadNetworkCredentialsStoreLocalClient parseDataSetFromTLVs:data_len:]";
            __int16 v104 = 1024;
            *(_DWORD *)v105 = 1532;
            _os_log_error_impl( (void *)&_mh_execute_header,  v53,  OS_LOG_TYPE_ERROR,  "%s: #MOS : ==> Decoded pskc Line : %d",  buf,  0x12u);
          }

          if ((_DWORD)v14 != 16)
          {
            id v88 = sub_1001768B4(1);
            uint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v88);
            if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
              sub_1001AA734();
            }
            goto LABEL_132;
          }

          uint64_t v54 = objc_claimAutoreleasedReturnValue( +[NSData dataWithBytes:length:]( &OBJC_CLASS___NSData,  "dataWithBytes:length:",  &a3[v15],  16LL));

          id v55 = sub_1001768B4(1);
          uint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v55);
          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315395;
            __int16 v103 = "-[THThreadNetworkCredentialsStoreLocalClient parseDataSetFromTLVs:data_len:]";
            __int16 v104 = 2117;
            *(void *)v105 = v54;
            _os_log_error_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_ERROR,  "%s: #MOS : PSKc : %{sensitive}@",  buf,  0x16u);
          }

          v98 = (void *)v54;
          goto LABEL_61;
        case 5:
          id v56 = sub_1001768B4(1);
          v57 = (os_log_s *)objc_claimAutoreleasedReturnValue(v56);
          if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315394;
            __int16 v103 = "-[THThreadNetworkCredentialsStoreLocalClient parseDataSetFromTLVs:data_len:]";
            __int16 v104 = 1024;
            *(_DWORD *)v105 = 1548;
            _os_log_error_impl( (void *)&_mh_execute_header,  v57,  OS_LOG_TYPE_ERROR,  "%s: #MOS : ==> Decoded master key Line : %d",  buf,  0x12u);
          }

          if ((_DWORD)v14 != 16)
          {
            id v89 = sub_1001768B4(1);
            uint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v89);
            if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
              sub_1001AA7A8();
            }
            goto LABEL_132;
          }

          uint64_t v58 = objc_claimAutoreleasedReturnValue( +[NSData dataWithBytes:length:]( &OBJC_CLASS___NSData,  "dataWithBytes:length:",  &a3[v15],  16LL));

          id v59 = sub_1001768B4(1);
          uint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v59);
          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315395;
            __int16 v103 = "-[THThreadNetworkCredentialsStoreLocalClient parseDataSetFromTLVs:data_len:]";
            __int16 v104 = 2117;
            *(void *)v105 = v58;
            _os_log_error_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_ERROR,  "%s: #MOS : Master Key: %{sensitive}@",  buf,  0x16u);
          }

          v100 = (void *)v58;
          goto LABEL_61;
        case 6:
        case 8:
        case 9:
        case 0xA:
        case 0xB:
          goto LABEL_29;
        case 7:
          id v60 = sub_1001768B4(1);
          id v61 = (os_log_s *)objc_claimAutoreleasedReturnValue(v60);
          if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315394;
            __int16 v103 = "-[THThreadNetworkCredentialsStoreLocalClient parseDataSetFromTLVs:data_len:]";
            __int16 v104 = 1024;
            *(_DWORD *)v105 = 1578;
            _os_log_error_impl( (void *)&_mh_execute_header,  v61,  OS_LOG_TYPE_ERROR,  "%s: #MOS : ==> Decoded mesh local prefix Line : %d",  buf,  0x12u);
          }

          if ((_DWORD)v14 == 8) {
            goto LABEL_63;
          }
          id v90 = sub_1001768B4(1);
          uint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v90);
          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
            sub_1001AA904();
          }
          goto LABEL_132;
        case 0xC:
          id v62 = sub_1001768B4(1);
          id v63 = (os_log_s *)objc_claimAutoreleasedReturnValue(v62);
          if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315394;
            __int16 v103 = "-[THThreadNetworkCredentialsStoreLocalClient parseDataSetFromTLVs:data_len:]";
            __int16 v104 = 1024;
            *(_DWORD *)v105 = 1563;
            _os_log_error_impl( (void *)&_mh_execute_header,  v63,  OS_LOG_TYPE_ERROR,  "%s: #MOS : ==> Decoded security policy Line : %d",  buf,  0x12u);
          }

          if ((v14 - 3) >= 2)
          {
            id v92 = sub_1001768B4(1);
            uint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v92);
            if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
              sub_1001AA890();
            }
            goto LABEL_132;
          }

          if (!a3[v15] && !a3[v12 + 3])
          {
            id v94 = sub_1001768B4(1);
            uint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v94);
            if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
              sub_1001AA81C();
            }
            goto LABEL_132;
          }

          goto LABEL_63;
        default:
          if (v17 == 53)
          {
            id v26 = sub_1001768B4(1);
            uint64_t v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
            if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136315394;
              __int16 v103 = "-[THThreadNetworkCredentialsStoreLocalClient parseDataSetFromTLVs:data_len:]";
              __int16 v104 = 1024;
              *(_DWORD *)v105 = 1419;
              _os_log_error_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_ERROR,  "%s: #MOS : ==> Decoded Channel Mask TLV Line : %d",  buf,  0x12u);
            }

            unsigned int v28 = v12 + 3;
            while (1)
            {
              if (v28 - 1 >= v16) {
                goto LABEL_63;
              }
              if (v28 >= v16 || v28 + 5 > v16) {
                break;
              }
              if ((a3[v28 - 1] & 0xFD) != 0)
              {
                id v80 = sub_1001768B4(1);
                uint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v80);
                if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
                  sub_1001AA418();
                }
                goto LABEL_132;
              }

              int v30 = a3[v28];
              v28 += 6;
              if (v30 != 4)
              {
                id v81 = sub_1001768B4(1);
                uint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v81);
                if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
                  sub_1001AA3A4();
                }
                goto LABEL_132;
              }
            }

            id v77 = sub_1001768B4(1);
            uint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v77);
            if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
              sub_1001AA330();
            }
            goto LABEL_132;
          }

- (id)parseCredsFromTLVs:(const char *)a3 data_len:(unsigned int)a4
{
  id v6 = sub_1001768B4(1);
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    sub_1001AB3D0();
  }

  sub_100159A78((unint64_t)a3, a4, v97, 0x3E8uLL, 0);
  id v8 = sub_1001768B4(1);
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
    sub_1001AB35C();
  }

  if (a4)
  {
    id v10 = 0LL;
    id v89 = 0LL;
    id v90 = 0LL;
    unsigned __int16 v91 = 0LL;
    id v92 = 0LL;
    LOBYTE(v11) = 0;
    unsigned int v12 = 0;
    while (1)
    {
      uint64_t v13 = v12 + 1LL;
      if (v13 >= a4)
      {
        id v69 = sub_1001768B4(1);
        uint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v69);
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
          sub_1001AB2E8();
        }
        goto LABEL_96;
      }

      uint64_t v14 = a3[v13];
      uint64_t v15 = v12 + 2LL;
      unsigned int v16 = v12 + 2 + v14;
      if (v16 > a4)
      {
        id v70 = sub_1001768B4(1);
        uint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v70);
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
          sub_1001AAC2C();
        }
        goto LABEL_96;
      }

      int v17 = a3[v12];
      switch(a3[v12])
      {
        case 0:
          id v18 = sub_1001768B4(1);
          uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315394;
            id v94 = "-[THThreadNetworkCredentialsStoreLocalClient parseCredsFromTLVs:data_len:]";
            __int16 v95 = 1024;
            *(_DWORD *)v96 = 1756;
            _os_log_error_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_ERROR,  "%s: #MOS : ==> Decoded channel Line : %d",  buf,  0x12u);
          }

          if ((_DWORD)v14 != 3)
          {
            id v77 = sub_1001768B4(1);
            uint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v77);
            if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
              sub_1001AAF48();
            }
            goto LABEL_96;
          }

          if (a3[v15])
          {
            id v85 = sub_1001768B4(1);
            uint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v85);
            if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
              sub_1001AAED8();
            }
            goto LABEL_96;
          }

          int v11 = a3[v12 + 4];
          id v20 = sub_1001768B4(1);
          uint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
          BOOL v22 = os_log_type_enabled(v21, OS_LOG_TYPE_ERROR);
          if ((v11 - 27) <= 0xEFu)
          {
            if (v22) {
              sub_1001AAE6C();
            }
            goto LABEL_96;
          }

          if (!v22) {
            goto LABEL_61;
          }
          *(_DWORD *)buf = 136315394;
          id v94 = "-[THThreadNetworkCredentialsStoreLocalClient parseCredsFromTLVs:data_len:]";
          __int16 v95 = 1024;
          *(_DWORD *)v96 = v11;
          id v23 = v21;
          uint64_t v24 = "%s: #MOS : Channel : %d";
          uint32_t v25 = 18;
          goto LABEL_31;
        case 1:
          id v32 = sub_1001768B4(1);
          uint64_t v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
          if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315394;
            id v94 = "-[THThreadNetworkCredentialsStoreLocalClient parseCredsFromTLVs:data_len:]";
            __int16 v95 = 1024;
            *(_DWORD *)v96 = 1790;
            _os_log_error_impl( (void *)&_mh_execute_header,  v33,  OS_LOG_TYPE_ERROR,  "%s: #MOS : ==> Decoded pan id Line : %d",  buf,  0x12u);
          }

          if ((_DWORD)v14 != 2)
          {
            id v78 = sub_1001768B4(1);
            uint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v78);
            if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
              sub_1001AAFBC();
            }
            goto LABEL_96;
          }

          uint64_t v34 = objc_claimAutoreleasedReturnValue( +[NSData dataWithBytes:length:]( &OBJC_CLASS___NSData,  "dataWithBytes:length:",  &a3[v15],  2LL));

          id v35 = sub_1001768B4(1);
          uint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v35);
          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315394;
            id v94 = "-[THThreadNetworkCredentialsStoreLocalClient parseCredsFromTLVs:data_len:]";
            __int16 v95 = 2112;
            *(void *)v96 = v34;
            _os_log_error_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "%s: #MOS : PANID : %@", buf, 0x16u);
          }

          id v90 = (void *)v34;
          goto LABEL_61;
        case 2:
          id v36 = sub_1001768B4(1);
          uint64_t v37 = (os_log_s *)objc_claimAutoreleasedReturnValue(v36);
          if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315394;
            id v94 = "-[THThreadNetworkCredentialsStoreLocalClient parseCredsFromTLVs:data_len:]";
            __int16 v95 = 1024;
            *(_DWORD *)v96 = 1805;
            _os_log_error_impl( (void *)&_mh_execute_header,  v37,  OS_LOG_TYPE_ERROR,  "%s: #MOS : ==> Decoded XPAN ID : %d",  buf,  0x12u);
          }

          if ((_DWORD)v14 != 8)
          {
            id v79 = sub_1001768B4(1);
            uint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v79);
            if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
              sub_1001AB030();
            }
            goto LABEL_96;
          }

          uint64_t v38 = objc_claimAutoreleasedReturnValue( +[NSData dataWithBytes:length:]( &OBJC_CLASS___NSData,  "dataWithBytes:length:",  &a3[v15],  8LL));

          id v39 = sub_1001768B4(1);
          uint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v39);
          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315394;
            id v94 = "-[THThreadNetworkCredentialsStoreLocalClient parseCredsFromTLVs:data_len:]";
            __int16 v95 = 2112;
            *(void *)v96 = v38;
            _os_log_error_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_ERROR,  "%s: #MOS : XPAN ID: %@",  buf,  0x16u);
          }

          id v89 = (void *)v38;
          goto LABEL_61;
        case 3:
          __memcpy_chk(v98, &a3[v15], a3[v13], 255LL);
          v98[v14] = 0;
          id v40 = sub_1001768B4(1);
          id v41 = (os_log_s *)objc_claimAutoreleasedReturnValue(v40);
          if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315394;
            id v94 = "-[THThreadNetworkCredentialsStoreLocalClient parseCredsFromTLVs:data_len:]";
            __int16 v95 = 1024;
            *(_DWORD *)v96 = 1745;
            _os_log_error_impl( (void *)&_mh_execute_header,  v41,  OS_LOG_TYPE_ERROR,  "%s: #MOS : ==> Decoded Network Name Line : %d",  buf,  0x12u);
          }

          uint64_t v42 = objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v98));
          id v43 = sub_1001768B4(1);
          uint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v43);
          BOOL v44 = os_log_type_enabled(v21, OS_LOG_TYPE_ERROR);
          if (!v42)
          {
            if (v44) {
              sub_1001AADFC(v21, v45, v46, v47, v48, v49, v50, v51);
            }
            id v10 = 0LL;
            goto LABEL_96;
          }

          if (v44)
          {
            *(_DWORD *)buf = 136315394;
            id v94 = "-[THThreadNetworkCredentialsStoreLocalClient parseCredsFromTLVs:data_len:]";
            __int16 v95 = 2112;
            *(void *)v96 = v42;
            _os_log_error_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_ERROR,  "%s : #MOS : Network Name : %@",  buf,  0x16u);
          }

          goto LABEL_62;
        case 4:
          id v52 = sub_1001768B4(1);
          uint64_t v53 = (os_log_s *)objc_claimAutoreleasedReturnValue(v52);
          if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315394;
            id v94 = "-[THThreadNetworkCredentialsStoreLocalClient parseCredsFromTLVs:data_len:]";
            __int16 v95 = 1024;
            *(_DWORD *)v96 = 1820;
            _os_log_error_impl( (void *)&_mh_execute_header,  v53,  OS_LOG_TYPE_ERROR,  "%s: #MOS : ==> Decoded pskc Line : %d",  buf,  0x12u);
          }

          if ((_DWORD)v14 != 16)
          {
            id v80 = sub_1001768B4(1);
            uint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v80);
            if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
              sub_1001AB0A4();
            }
            goto LABEL_96;
          }

          uint64_t v54 = objc_claimAutoreleasedReturnValue( +[NSData dataWithBytes:length:]( &OBJC_CLASS___NSData,  "dataWithBytes:length:",  &a3[v15],  16LL));

          id v55 = sub_1001768B4(1);
          uint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v55);
          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315395;
            id v94 = "-[THThreadNetworkCredentialsStoreLocalClient parseCredsFromTLVs:data_len:]";
            __int16 v95 = 2117;
            *(void *)v96 = v54;
            _os_log_error_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_ERROR,  "%s: #MOS : PSKc : %{sensitive}@",  buf,  0x16u);
          }

          unsigned __int16 v91 = (void *)v54;
          goto LABEL_61;
        case 5:
          id v56 = sub_1001768B4(1);
          v57 = (os_log_s *)objc_claimAutoreleasedReturnValue(v56);
          if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315394;
            id v94 = "-[THThreadNetworkCredentialsStoreLocalClient parseCredsFromTLVs:data_len:]";
            __int16 v95 = 1024;
            *(_DWORD *)v96 = 1836;
            _os_log_error_impl( (void *)&_mh_execute_header,  v57,  OS_LOG_TYPE_ERROR,  "%s: #MOS : ==> Decoded master key Line : %d",  buf,  0x12u);
          }

          if ((_DWORD)v14 != 16)
          {
            id v81 = sub_1001768B4(1);
            uint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v81);
            if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
              sub_1001AB118();
            }
            goto LABEL_96;
          }

          uint64_t v58 = objc_claimAutoreleasedReturnValue( +[NSData dataWithBytes:length:]( &OBJC_CLASS___NSData,  "dataWithBytes:length:",  &a3[v15],  16LL));

          id v59 = sub_1001768B4(1);
          uint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v59);
          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315395;
            id v94 = "-[THThreadNetworkCredentialsStoreLocalClient parseCredsFromTLVs:data_len:]";
            __int16 v95 = 2117;
            *(void *)v96 = v58;
            _os_log_error_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_ERROR,  "%s: #MOS : Master Key: %{sensitive}@",  buf,  0x16u);
          }

          id v92 = (void *)v58;
          goto LABEL_61;
        case 6:
        case 8:
        case 9:
        case 0xA:
        case 0xB:
          goto LABEL_29;
        case 7:
          id v60 = sub_1001768B4(1);
          id v61 = (os_log_s *)objc_claimAutoreleasedReturnValue(v60);
          if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315394;
            id v94 = "-[THThreadNetworkCredentialsStoreLocalClient parseCredsFromTLVs:data_len:]";
            __int16 v95 = 1024;
            *(_DWORD *)v96 = 1866;
            _os_log_error_impl( (void *)&_mh_execute_header,  v61,  OS_LOG_TYPE_ERROR,  "%s: #MOS : ==> Decoded mesh local prefix Line : %d",  buf,  0x12u);
          }

          if ((_DWORD)v14 == 8) {
            goto LABEL_63;
          }
          id v82 = sub_1001768B4(1);
          uint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v82);
          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
            sub_1001AB274();
          }
          goto LABEL_96;
        case 0xC:
          id v62 = sub_1001768B4(1);
          id v63 = (os_log_s *)objc_claimAutoreleasedReturnValue(v62);
          if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315394;
            id v94 = "-[THThreadNetworkCredentialsStoreLocalClient parseCredsFromTLVs:data_len:]";
            __int16 v95 = 1024;
            *(_DWORD *)v96 = 1851;
            _os_log_error_impl( (void *)&_mh_execute_header,  v63,  OS_LOG_TYPE_ERROR,  "%s: #MOS : ==> Decoded security policy Line : %d",  buf,  0x12u);
          }

          if ((v14 - 3) >= 2)
          {
            id v84 = sub_1001768B4(1);
            uint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v84);
            if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
              sub_1001AB200();
            }
            goto LABEL_96;
          }

          if (!a3[v15] && !a3[v12 + 3])
          {
            id v86 = sub_1001768B4(1);
            uint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v86);
            if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
              sub_1001AB18C();
            }
            goto LABEL_96;
          }

          goto LABEL_63;
        default:
          if (v17 == 53)
          {
            id v26 = sub_1001768B4(1);
            uint64_t v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
            if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136315394;
              id v94 = "-[THThreadNetworkCredentialsStoreLocalClient parseCredsFromTLVs:data_len:]";
              __int16 v95 = 1024;
              *(_DWORD *)v96 = 1707;
              _os_log_error_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_ERROR,  "%s: #MOS : ==> Decoded Channel Mask TLV Line : %d",  buf,  0x12u);
            }

            unsigned int v28 = v12 + 3;
            while (1)
            {
              if (v28 - 1 >= v16) {
                goto LABEL_63;
              }
              if (v28 >= v16 || v28 + 5 > v16) {
                break;
              }
              if ((a3[v28 - 1] & 0xFD) != 0)
              {
                id v72 = sub_1001768B4(1);
                uint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v72);
                if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
                  sub_1001AAD88();
                }
                goto LABEL_96;
              }

              int v30 = a3[v28];
              v28 += 6;
              if (v30 != 4)
              {
                id v73 = sub_1001768B4(1);
                uint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v73);
                if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
                  sub_1001AAD14();
                }
                goto LABEL_96;
              }
            }

            id v71 = sub_1001768B4(1);
            uint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v71);
            if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
              sub_1001AACA0();
            }
LABEL_96:

LABEL_97:
            id v75 = sub_1001768B4(1);
            id v67 = (os_log_s *)objc_claimAutoreleasedReturnValue(v75);
            if (os_log_type_enabled(v67, OS_LOG_TYPE_ERROR)) {
              sub_1001AAAD4();
            }
LABEL_99:
            uint64_t v65 = 0LL;
            goto LABEL_100;
          }

- (NSString)keychainAccessGroup
{
  return self->_keychainAccessGroup;
}

- (THThreadNetworkCredentialsBackingStore)backingStore
{
  return (THThreadNetworkCredentialsBackingStore *)objc_loadWeakRetained((id *)&self->_backingStore);
}

- (void).cxx_destruct
{
}

  ;
}

@end
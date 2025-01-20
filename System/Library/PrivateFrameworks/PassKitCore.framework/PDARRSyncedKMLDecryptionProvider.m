@interface PDARRSyncedKMLDecryptionProvider
- (BOOL)requiresNFSESessionForOperation:(unint64_t)a3;
- (void)_longTermPrivacyKeyForRequirement:(id)a3 context:(id)a4 reuseExisting:(BOOL)a5 completion:(id)a6;
- (void)existingKeyMaterialForRequirement:(id)a3 context:(id)a4 completion:(id)a5;
- (void)generateKeyMaterialForRequirement:(id)a3 context:(id)a4 completion:(id)a5;
- (void)isRegisteredForRequirement:(id)a3 context:(id)a4 completion:(id)a5;
- (void)requirementRegistrationSuccess:(id)a3 serverKeyMaterial:(id)a4 forRequirement:(id)a5 context:(id)a6 completion:(id)a7;
- (void)requiresMetadataToGenerateKeyMaterial:(id)a3 context:(id)a4 completion:(id)a5;
@end

@implementation PDARRSyncedKMLDecryptionProvider

- (void)generateKeyMaterialForRequirement:(id)a3 context:(id)a4 completion:(id)a5
{
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_10022E0B4;
  v9[3] = &unk_10064DD20;
  id v10 = a5;
  id v8 = v10;
  -[PDARRSyncedKMLDecryptionProvider _longTermPrivacyKeyForRequirement:context:reuseExisting:completion:]( self,  "_longTermPrivacyKeyForRequirement:context:reuseExisting:completion:",  a3,  a4,  0LL,  v9);
}

- (void)isRegisteredForRequirement:(id)a3 context:(id)a4 completion:(id)a5
{
  id v7 = a5;
  id v8 = a3;
  v9 = (void *)objc_claimAutoreleasedReturnValue([a4 secureElement]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v8 groupIdentifier]);

  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_10022E188;
  v12[3] = &unk_10063B3A0;
  id v13 = v7;
  id v11 = v7;
  [v9 hasLongTermPrivacyKeyForCredentialGroupIdentifier:v10 completion:v12];
}

- (void)existingKeyMaterialForRequirement:(id)a3 context:(id)a4 completion:(id)a5
{
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_10022E26C;
  v11[3] = &unk_100644BF8;
  id v12 = a3;
  id v13 = self;
  id v14 = a4;
  id v15 = a5;
  id v8 = v15;
  id v9 = v14;
  id v10 = v12;
  -[PDARRSyncedKMLDecryptionProvider isRegisteredForRequirement:context:completion:]( self,  "isRegisteredForRequirement:context:completion:",  v10,  v9,  v11);
}

- (void)requirementRegistrationSuccess:(id)a3 serverKeyMaterial:(id)a4 forRequirement:(id)a5 context:(id)a6 completion:(id)a7
{
}

- (BOOL)requiresNFSESessionForOperation:(unint64_t)a3
{
  return 0;
}

- (void)requiresMetadataToGenerateKeyMaterial:(id)a3 context:(id)a4 completion:(id)a5
{
}

- (void)_longTermPrivacyKeyForRequirement:(id)a3 context:(id)a4 reuseExisting:(BOOL)a5 completion:(id)a6
{
  BOOL v6 = a5;
  id v9 = a6;
  id v10 = a3;
  id v11 = (void *)objc_claimAutoreleasedReturnValue([a4 secureElement]);
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v10 groupIdentifier]);

  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_10022E44C;
  v14[3] = &unk_100641F00;
  id v15 = v9;
  id v13 = v9;
  [v11 longTermPrivacyKeyForCredentialGroupIdentifier:v12 reuseExisting:v6 completion:v14];
}

@end
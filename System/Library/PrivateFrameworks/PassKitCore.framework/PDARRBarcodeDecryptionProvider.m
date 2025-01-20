@interface PDARRBarcodeDecryptionProvider
- (BOOL)requiresNFSESessionForOperation:(unint64_t)a3;
- (PDARRBarcodeDecryptionProvider)init;
- (PDARRBarcodeDecryptionProvider)initWithBarcodeCertificateManager:(id)a3;
- (void)existingKeyMaterialForRequirement:(id)a3 context:(id)a4 completion:(id)a5;
- (void)generateKeyMaterialForRequirement:(id)a3 context:(id)a4 completion:(id)a5;
- (void)isRegisteredForRequirement:(id)a3 context:(id)a4 completion:(id)a5;
- (void)requirementRegistrationSuccess:(id)a3 serverKeyMaterial:(id)a4 forRequirement:(id)a5 context:(id)a6 completion:(id)a7;
- (void)requiresMetadataToGenerateKeyMaterial:(id)a3 context:(id)a4 completion:(id)a5;
@end

@implementation PDARRBarcodeDecryptionProvider

- (PDARRBarcodeDecryptionProvider)init
{
  return 0LL;
}

- (PDARRBarcodeDecryptionProvider)initWithBarcodeCertificateManager:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___PDARRBarcodeDecryptionProvider;
  v6 = -[PDARRBarcodeDecryptionProvider init](&v9, "init");
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_barcodeCertManager, a3);
  }

  return v7;
}

- (void)generateKeyMaterialForRequirement:(id)a3 context:(id)a4 completion:(id)a5
{
}

- (void)requirementRegistrationSuccess:(id)a3 serverKeyMaterial:(id)a4 forRequirement:(id)a5 context:(id)a6 completion:(id)a7
{
  id v28 = a3;
  v11 = (void (**)(id, id))a7;
  id v12 = a4;
  v13 = (void *)objc_claimAutoreleasedReturnValue([a6 pass]);
  v14 = (void *)objc_claimAutoreleasedReturnValue([v13 paymentPass]);

  v15 = (void *)objc_claimAutoreleasedReturnValue([v28 contents]);
  if ([v15 count])
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue([v28 contents]);
    v17 = (void *)objc_claimAutoreleasedReturnValue([v16 firstObject]);
    v18 = (void *)objc_claimAutoreleasedReturnValue([v17 certificateChain]);
  }

  else
  {
    v18 = 0LL;
  }

  v19 = (void *)objc_claimAutoreleasedReturnValue( -[PDBarcodeCertificateManager validateAndStoreCertificateChain:withCertificateType:forPass:]( self->_barcodeCertManager,  "validateAndStoreCertificateChain:withCertificateType:forPass:",  v18,  1LL,  v14));
  v20 = (void *)objc_claimAutoreleasedReturnValue([v12 contents]);

  if ([v20 count])
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue([v28 contents]);
    v22 = (void *)objc_claimAutoreleasedReturnValue([v21 firstObject]);
    v23 = (void *)objc_claimAutoreleasedReturnValue([v22 certificateChain]);
  }

  else
  {
    v23 = 0LL;
  }

  uint64_t v24 = objc_claimAutoreleasedReturnValue( -[PDBarcodeCertificateManager validateAndStoreCertificateChain:withCertificateType:forPass:]( self->_barcodeCertManager,  "validateAndStoreCertificateChain:withCertificateType:forPass:",  v23,  3LL,  v14));
  v25 = (void *)v24;
  if (v19) {
    v26 = v19;
  }
  else {
    v26 = (void *)v24;
  }
  id v27 = v26;
  v11[2](v11, v27);
}

- (void)isRegisteredForRequirement:(id)a3 context:(id)a4 completion:(id)a5
{
}

- (void)existingKeyMaterialForRequirement:(id)a3 context:(id)a4 completion:(id)a5
{
}

- (BOOL)requiresNFSESessionForOperation:(unint64_t)a3
{
  return a3 == 0;
}

- (void)requiresMetadataToGenerateKeyMaterial:(id)a3 context:(id)a4 completion:(id)a5
{
}

- (void).cxx_destruct
{
}

@end
@interface PDARRISO18013SignatureProvider
- (BOOL)requiresNFSESessionForOperation:(unint64_t)a3;
- (PDARRISO18013SignatureProvider)init;
- (PDARRISO18013SignatureProvider)initWithISO18013Manager:(id)a3;
- (id)associatedRequirementsForRequirement:(id)a3 context:(id)a4;
- (void)existingKeyMaterialForRequirement:(id)a3 context:(id)a4 completion:(id)a5;
- (void)generateKeyMaterialForRequirement:(id)a3 context:(id)a4 completion:(id)a5;
- (void)isRegisteredForRequirement:(id)a3 context:(id)a4 completion:(id)a5;
- (void)requirementRegistrationSuccess:(id)a3 serverKeyMaterial:(id)a4 forRequirement:(id)a5 context:(id)a6 completion:(id)a7;
- (void)requiresMetadataToGenerateKeyMaterial:(id)a3 context:(id)a4 completion:(id)a5;
@end

@implementation PDARRISO18013SignatureProvider

- (PDARRISO18013SignatureProvider)init
{
  return 0LL;
}

- (PDARRISO18013SignatureProvider)initWithISO18013Manager:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___PDARRISO18013SignatureProvider;
  v6 = -[PDARRISO18013SignatureProvider init](&v9, "init");
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_isoManager, a3);
  }

  return v7;
}

- (void)generateKeyMaterialForRequirement:(id)a3 context:(id)a4 completion:(id)a5
{
}

- (void)isRegisteredForRequirement:(id)a3 context:(id)a4 completion:(id)a5
{
}

- (void)existingKeyMaterialForRequirement:(id)a3 context:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v9 isPerformingInitialRegistration])
  {
    (*((void (**)(id, void, void))v10 + 2))(v10, 0LL, 0LL);
  }

  else
  {
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_10010E3E4;
    v11[3] = &unk_100644B30;
    id v12 = v10;
    -[PDARRISO18013SignatureProvider isRegisteredForRequirement:context:completion:]( self,  "isRegisteredForRequirement:context:completion:",  v8,  v9,  v11);
  }
}

- (void)requirementRegistrationSuccess:(id)a3 serverKeyMaterial:(id)a4 forRequirement:(id)a5 context:(id)a6 completion:(id)a7
{
}

- (BOOL)requiresNFSESessionForOperation:(unint64_t)a3
{
  return 0;
}

- (id)associatedRequirementsForRequirement:(id)a3 context:(id)a4
{
  unsigned int v4 = objc_msgSend(a4, "isPerformingInitialRegistration", a3);
  id v5 = objc_alloc(&OBJC_CLASS___PDAuxiliaryRegistrationRequirementReference);
  if (v4)
  {
    v6 = -[PDAuxiliaryRegistrationRequirementReference initWithSignatureType:](v5, "initWithSignatureType:", 12LL);
    v11[0] = v6;
    v7 = -[PDAuxiliaryRegistrationRequirementReference initWithSignatureType:]( objc_alloc(&OBJC_CLASS___PDAuxiliaryRegistrationRequirementReference),  "initWithSignatureType:",  11LL);
    v11[1] = v7;
    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v11, 2LL));
  }

  else
  {
    v6 = -[PDAuxiliaryRegistrationRequirementReference initWithDecryptionType:](v5, "initWithDecryptionType:", 1LL);
    id v10 = v6;
    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v10, 1LL));
  }

  return v8;
}

- (void)requiresMetadataToGenerateKeyMaterial:(id)a3 context:(id)a4 completion:(id)a5
{
}

- (void).cxx_destruct
{
}

@end
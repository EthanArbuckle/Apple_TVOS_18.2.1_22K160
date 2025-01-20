@interface PDARRISO18013DecryptionProvider
- (BOOL)requiresNFSESessionForOperation:(unint64_t)a3;
- (PDARRISO18013DecryptionProvider)init;
- (PDARRISO18013DecryptionProvider)initWithISO18013Manager:(id)a3;
- (id)associatedRequirementsForRequirement:(id)a3 context:(id)a4;
- (void)existingKeyMaterialForRequirement:(id)a3 context:(id)a4 completion:(id)a5;
- (void)generateKeyMaterialForRequirement:(id)a3 context:(id)a4 completion:(id)a5;
- (void)isRegisteredForRequirement:(id)a3 context:(id)a4 completion:(id)a5;
- (void)requirementRegistrationSuccess:(id)a3 serverKeyMaterial:(id)a4 forRequirement:(id)a5 context:(id)a6 completion:(id)a7;
- (void)requiresMetadataToGenerateKeyMaterial:(id)a3 context:(id)a4 completion:(id)a5;
@end

@implementation PDARRISO18013DecryptionProvider

- (PDARRISO18013DecryptionProvider)init
{
  return 0LL;
}

- (PDARRISO18013DecryptionProvider)initWithISO18013Manager:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___PDARRISO18013DecryptionProvider;
  v6 = -[PDARRISO18013DecryptionProvider init](&v9, "init");
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
    v11[2] = sub_100298398;
    v11[3] = &unk_100644B30;
    id v12 = v10;
    -[PDARRISO18013DecryptionProvider isRegisteredForRequirement:context:completion:]( self,  "isRegisteredForRequirement:context:completion:",  v8,  v9,  v11);
  }
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

- (id)associatedRequirementsForRequirement:(id)a3 context:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v6 isPerformingInitialRegistration])
  {
    id v7 = v5;
    id v8 = v6;
    if ([v8 isPerformingInitialRegistration])
    {
      id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 keyCreationMetadata]);
      id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 decryptionISO18013]);

      if (!v10)
      {

        goto LABEL_8;
      }

      v11 = v10;
    }

    else
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue([v8 pass]);
      id v10 = v11;
    }

    id v12 = [v11 cardType];

    if (v12 == (id)3)
    {
      v13 = -[PDAuxiliaryRegistrationRequirementReference initWithSignatureType:]( objc_alloc(&OBJC_CLASS___PDAuxiliaryRegistrationRequirementReference),  "initWithSignatureType:",  1LL);
      v17 = v13;
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v17, 1LL));
      goto LABEL_11;
    }

    if (v12 == (id)4)
    {
LABEL_8:
      v13 = -[PDAuxiliaryRegistrationRequirementReference initWithSignatureType:]( objc_alloc(&OBJC_CLASS___PDAuxiliaryRegistrationRequirementReference),  "initWithSignatureType:",  12LL);
      v18[0] = v13;
      v14 = -[PDAuxiliaryRegistrationRequirementReference initWithSignatureType:]( objc_alloc(&OBJC_CLASS___PDAuxiliaryRegistrationRequirementReference),  "initWithSignatureType:",  11LL);
      v18[1] = v14;
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v18, 2LL));

LABEL_11:
      goto LABEL_12;
    }
  }

  v15 = 0LL;
LABEL_12:

  return v15;
}

- (void).cxx_destruct
{
}

@end
@interface PDISO18013Manager
- (PDISO18013Manager)initWithSecureElement:(id)a3 userNotificationManager:(id)a4;
- (void)activateCredentialsForCredentialIds:(id)a3 completion:(id)a4;
- (void)addISO18013Blobs:(id)a3 cardType:(int64_t)a4 completion:(id)a5;
- (void)allCredentialsWithCompletion:(id)a3;
- (void)deleteCredentialsForCredentialIds:(id)a3 completion:(id)a4;
- (void)generateAccountKeyAuthorizationForSubcredentialID:(id)a3 cardType:(int64_t)a4 accountKeyIdentifier:(id)a5 completion:(id)a6;
- (void)generateISOEncryptionCertificateForSubCredentialId:(id)a3 completion:(id)a4;
- (void)handlePaymentPassUpdateFrom:(id)a3 priorPaymentApplications:(id)a4 completion:(id)a5;
- (void)isAccountKeySigningKeyAvailableForAccountKeyIdentifier:(id)a3 completion:(id)a4;
- (void)passWillBeRemoved:(id)a3;
- (void)suspendCredentialsForCredentialIds:(id)a3 completion:(id)a4;
@end

@implementation PDISO18013Manager

- (PDISO18013Manager)initWithSecureElement:(id)a3 userNotificationManager:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___PDISO18013Manager;
  v9 = -[PDISO18013Manager init](&v12, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_secureElement, a3);
    objc_storeStrong((id *)&v10->_userNotificationManager, a4);
  }

  return v10;
}

- (void)handlePaymentPassUpdateFrom:(id)a3 priorPaymentApplications:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  v60 = self;
  v61 = (void (**)(id, void))a5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[PKSecureElement secureElementIdentifiers](self->_secureElement, "secureElementIdentifiers"));
  v62 = v8;
  id v59 = [v8 cardType];
  v11 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  __int128 v91 = 0u;
  __int128 v92 = 0u;
  __int128 v93 = 0u;
  __int128 v94 = 0u;
  id obj = v9;
  id v12 = [obj countByEnumeratingWithState:&v91 objects:v100 count:16];
  v63 = v10;
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v92;
    do
    {
      for (i = 0LL; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v92 != v14) {
          objc_enumerationMutation(obj);
        }
        v16 = *(void **)(*((void *)&v91 + 1) + 8LL * (void)i);
        v17 = (void *)objc_claimAutoreleasedReturnValue([v16 secureElementIdentifier]);
        if ([v10 containsObject:v17])
        {
          v18 = (char *)[v16 paymentType] - 1002;

          __int128 v89 = 0u;
          __int128 v90 = 0u;
          __int128 v87 = 0u;
          __int128 v88 = 0u;
          v17 = (void *)objc_claimAutoreleasedReturnValue([v16 subcredentials]);
          id v19 = [v17 countByEnumeratingWithState:&v87 objects:v99 count:16];
          if (v19)
          {
            id v20 = v19;
            uint64_t v21 = *(void *)v88;
            do
            {
              for (j = 0LL; j != v20; j = (char *)j + 1)
              {
                if (*(void *)v88 != v21) {
                  objc_enumerationMutation(v17);
                }
                -[NSMutableSet addObject:](v11, "addObject:", v23);
              }

              id v20 = [v17 countByEnumeratingWithState:&v87 objects:v99 count:16];
            }

            while (v20);
            v10 = v63;
          }
        }
      }

      id v13 = [obj countByEnumeratingWithState:&v91 objects:v100 count:16];
    }

    while (v13);
  }

  v24 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  v25 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  v26 = v10;
  v27 = v25;
  __int128 v83 = 0u;
  __int128 v84 = 0u;
  __int128 v85 = 0u;
  __int128 v86 = 0u;
  id v69 = (id)objc_claimAutoreleasedReturnValue([v8 paymentApplicationsForSecureElementIdentifiers:v26]);
  id v28 = [v69 countByEnumeratingWithState:&v83 objects:v98 count:16];
  if (v28)
  {
    id v29 = v28;
    uint64_t v30 = *(void *)v84;
    uint64_t v64 = *(void *)v84;
    do
    {
      v31 = 0LL;
      id v66 = v29;
      do
      {
        if (*(void *)v84 != v30) {
          objc_enumerationMutation(v69);
        }
        v32 = *(void **)(*((void *)&v83 + 1) + 8LL * (void)v31);
        if ((char *)[v32 paymentType] - 1002 <= (char *)3)
        {
          __int128 v81 = 0u;
          __int128 v82 = 0u;
          __int128 v79 = 0u;
          __int128 v80 = 0u;
          v33 = (void *)objc_claimAutoreleasedReturnValue([v32 subcredentials]);
          id v34 = [v33 countByEnumeratingWithState:&v79 objects:v97 count:16];
          if (v34)
          {
            id v35 = v34;
            uint64_t v36 = *(void *)v80;
            do
            {
              for (k = 0LL; k != v35; k = (char *)k + 1)
              {
                if (*(void *)v80 != v36) {
                  objc_enumerationMutation(v33);
                }
                v38 = *(void **)(*((void *)&v79 + 1) + 8LL * (void)k);
                v39 = (void *)objc_claimAutoreleasedReturnValue([v38 identifier]);
                -[NSMutableSet addObject:](v24, "addObject:", v39);

                -[NSMutableSet addObject:](v27, "addObject:", v38);
              }

              id v35 = [v33 countByEnumeratingWithState:&v79 objects:v97 count:16];
            }

            while (v35);
          }

          uint64_t v30 = v64;
          id v29 = v66;
        }

        v31 = (char *)v31 + 1;
      }

      while (v31 != v29);
      id v29 = [v69 countByEnumeratingWithState:&v83 objects:v98 count:16];
    }

    while (v29);
  }

  v40 = (void *)objc_claimAutoreleasedReturnValue([v62 iso18013BlobsForSecureElementIdentifiers:v63]);
  v65 = (void *)objc_claimAutoreleasedReturnValue([v62 iso18013BlobsMetdataForSecureElementIdentifiers:v63]);
  v41 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  v70 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  __int128 v75 = 0u;
  __int128 v76 = 0u;
  __int128 v77 = 0u;
  __int128 v78 = 0u;
  id v42 = v40;
  id v43 = [v42 countByEnumeratingWithState:&v75 objects:v96 count:16];
  if (v43)
  {
    id v44 = v43;
    uint64_t v45 = *(void *)v76;
    do
    {
      for (m = 0LL; m != v44; m = (char *)m + 1)
      {
        if (*(void *)v76 != v45) {
          objc_enumerationMutation(v42);
        }
        v47 = *(void **)(*((void *)&v75 + 1) + 8LL * (void)m);
        v48 = (void *)objc_claimAutoreleasedReturnValue([v42 objectForKey:v47]);
        v49 = (void *)objc_claimAutoreleasedReturnValue([v47 identifier]);
        -[NSMutableDictionary setObject:forKey:](v41, "setObject:forKey:", v48, v49);
      }

      id v44 = [v42 countByEnumeratingWithState:&v75 objects:v96 count:16];
    }

    while (v44);
  }

  v67 = v41;

  __int128 v73 = 0u;
  __int128 v74 = 0u;
  __int128 v71 = 0u;
  __int128 v72 = 0u;
  id v50 = v65;
  id v51 = [v50 countByEnumeratingWithState:&v71 objects:v95 count:16];
  if (v51)
  {
    id v52 = v51;
    uint64_t v53 = *(void *)v72;
    do
    {
      for (n = 0LL; n != v52; n = (char *)n + 1)
      {
        if (*(void *)v72 != v53) {
          objc_enumerationMutation(v50);
        }
        v55 = *(void **)(*((void *)&v71 + 1) + 8LL * (void)n);
        v56 = (void *)objc_claimAutoreleasedReturnValue([v50 objectForKey:v55]);
        v57 = (void *)objc_claimAutoreleasedReturnValue([v55 identifier]);
        -[NSMutableDictionary setObject:forKey:](v70, "setObject:forKey:", v56, v57);
      }

      id v52 = [v50 countByEnumeratingWithState:&v71 objects:v95 count:16];
    }

    while (v52);
  }

  id v58 = -[NSMutableSet mutableCopy](v11, "mutableCopy");
  [v58 minusSet:v24];
  if (v61) {
    v61[2](v61, 0LL);
  }
  -[PDISO18013Manager deleteSubCredentialIdentifiers:cardType:]( v60,  "deleteSubCredentialIdentifiers:cardType:",  v58,  v59);
}

- (void)passWillBeRemoved:(id)a3
{
  id v4 = a3;
  id v20 = self;
  uint64_t v5 = objc_claimAutoreleasedReturnValue(-[PKSecureElement secureElementIdentifiers](self->_secureElement, "secureElementIdentifiers"));
  v6 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  uint64_t v21 = v4;
  id v19 = (void *)v5;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 paymentApplicationsForSecureElementIdentifiers:v5]);
  id v8 = [v7 countByEnumeratingWithState:&v26 objects:v31 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v27;
    do
    {
      for (i = 0LL; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v27 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = *(void **)(*((void *)&v26 + 1) + 8LL * (void)i);
        if ((char *)[v12 paymentType] - 1002 <= (char *)3)
        {
          __int128 v24 = 0u;
          __int128 v25 = 0u;
          __int128 v22 = 0u;
          __int128 v23 = 0u;
          id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 subcredentials]);
          id v14 = [v13 countByEnumeratingWithState:&v22 objects:v30 count:16];
          if (v14)
          {
            id v15 = v14;
            uint64_t v16 = *(void *)v23;
            do
            {
              for (j = 0LL; j != v15; j = (char *)j + 1)
              {
                if (*(void *)v23 != v16) {
                  objc_enumerationMutation(v13);
                }
                -[NSMutableSet addObject:](v6, "addObject:", v18);
              }

              id v15 = [v13 countByEnumeratingWithState:&v22 objects:v30 count:16];
            }

            while (v15);
          }
        }
      }

      id v9 = [v7 countByEnumeratingWithState:&v26 objects:v31 count:16];
    }

    while (v9);
  }

  -[PDISO18013Manager deleteSubCredentialIdentifiers:cardType:]( v20,  "deleteSubCredentialIdentifiers:cardType:",  v6,  [v21 cardType]);
}

- (void)addISO18013Blobs:(id)a3 cardType:(int64_t)a4 completion:(id)a5
{
}

- (void)generateISOEncryptionCertificateForSubCredentialId:(id)a3 completion:(id)a4
{
}

- (void)allCredentialsWithCompletion:(id)a3
{
  if (a3) {
    (*((void (**)(id, void))a3 + 2))(a3, 0LL);
  }
}

- (void)deleteCredentialsForCredentialIds:(id)a3 completion:(id)a4
{
  if (a4) {
    (*((void (**)(id, void))a4 + 2))(a4, 0LL);
  }
}

- (void)activateCredentialsForCredentialIds:(id)a3 completion:(id)a4
{
  if (a4) {
    (*((void (**)(id, void))a4 + 2))(a4, 0LL);
  }
}

- (void)suspendCredentialsForCredentialIds:(id)a3 completion:(id)a4
{
  if (a4) {
    (*((void (**)(id, void))a4 + 2))(a4, 0LL);
  }
}

- (void)generateAccountKeyAuthorizationForSubcredentialID:(id)a3 cardType:(int64_t)a4 accountKeyIdentifier:(id)a5 completion:(id)a6
{
}

- (void)isAccountKeySigningKeyAvailableForAccountKeyIdentifier:(id)a3 completion:(id)a4
{
}

- (void).cxx_destruct
{
}

@end
@interface CloudServiceCapabilitiesOperation
- (BOOL)allowsBypassOfPrivacyAcknowledgement;
- (BOOL)allowsPromptingForPrivacyAcknowledgement;
- (id)_newResponseWithSubscriptionStatus:(id)a3;
- (id)responseBlock;
- (void)run;
- (void)setAllowsBypassOfPrivacyAcknowledgement:(BOOL)a3;
- (void)setAllowsPromptingForPrivacyAcknowledgement:(BOOL)a3;
- (void)setResponseBlock:(id)a3;
@end

@implementation CloudServiceCapabilitiesOperation

- (BOOL)allowsPromptingForPrivacyAcknowledgement
{
  BOOL allowsPromptingForPrivacyAcknowledgement = self->_allowsPromptingForPrivacyAcknowledgement;
  -[CloudServiceCapabilitiesOperation unlock](self, "unlock");
  return allowsPromptingForPrivacyAcknowledgement;
}

- (BOOL)allowsBypassOfPrivacyAcknowledgement
{
  BOOL allowsBypassOfPrivacyAcknowledgement = self->_allowsBypassOfPrivacyAcknowledgement;
  -[CloudServiceCapabilitiesOperation unlock](self, "unlock");
  return allowsBypassOfPrivacyAcknowledgement;
}

- (id)responseBlock
{
  id v3 = [self->_responseBlock copy];
  -[CloudServiceCapabilitiesOperation unlock](self, "unlock");
  id v4 = objc_retainBlock(v3);

  return v4;
}

- (void)setAllowsPromptingForPrivacyAcknowledgement:(BOOL)a3
{
  self->_BOOL allowsPromptingForPrivacyAcknowledgement = a3;
  -[CloudServiceCapabilitiesOperation unlock](self, "unlock");
}

- (void)setAllowsBypassOfPrivacyAcknowledgement:(BOOL)a3
{
  self->_BOOL allowsBypassOfPrivacyAcknowledgement = a3;
  -[CloudServiceCapabilitiesOperation unlock](self, "unlock");
}

- (void)setResponseBlock:(id)a3
{
  id v6 = a3;
  -[CloudServiceCapabilitiesOperation lock](self, "lock");
  if (self->_responseBlock != v6)
  {
    id v4 = [v6 copy];
    id responseBlock = self->_responseBlock;
    self->_id responseBlock = v4;
  }

  -[CloudServiceCapabilitiesOperation unlock](self, "unlock");
}

- (void)run
{
  BOOL allowsPromptingForPrivacyAcknowledgement = self->_allowsPromptingForPrivacyAcknowledgement;
  BOOL allowsBypassOfPrivacyAcknowledgement = self->_allowsBypassOfPrivacyAcknowledgement;
  v5 = (void (**)(id, id, id))objc_retainBlock(self->_responseBlock);
  id responseBlock = self->_responseBlock;
  self->_id responseBlock = 0LL;

  -[CloudServiceCapabilitiesOperation unlock](self, "unlock");
  if (allowsPromptingForPrivacyAcknowledgement && !allowsBypassOfPrivacyAcknowledgement)
  {
    v10 = objc_alloc(&OBJC_CLASS___PrivacyPromptOperation);
    v11 = -[PrivacyPromptOperation initWithPrivacyIdentifier:]( v10,  "initWithPrivacyIdentifier:",  SSPrivacyIdentifierMusicStore);
    id v54 = 0LL;
    unsigned int v12 = -[CloudServiceCapabilitiesOperation runSubOperation:returningError:]( self,  "runSubOperation:returningError:",  v11,  &v54);
    id v9 = v54;
    int v8 = v12 ^ 1;
  }

  else
  {
    int v8 = +[SSPrivacyController shouldDisplayPrivacyLinkWithIdentifier:]( &OBJC_CLASS___SSPrivacyController,  "shouldDisplayPrivacyLinkWithIdentifier:",  SSPrivacyIdentifierMusicStore);
    id v9 = 0LL;
  }

  if (allowsBypassOfPrivacyAcknowledgement || v8 == 0)
  {
    uint64_t v48 = 0LL;
    v49 = &v48;
    uint64_t v50 = 0x3032000000LL;
    v51 = sub_10017FAC4;
    v52 = sub_10017FAD4;
    id v53 = 0LL;
    v14 = objc_alloc_init(&OBJC_CLASS___SubscriptionStatusOperation);
    -[SubscriptionStatusOperation setAllowsBypassOfPrivacyAcknowledgement:]( v14,  "setAllowsBypassOfPrivacyAcknowledgement:",  allowsBypassOfPrivacyAcknowledgement);
    -[SubscriptionStatusOperation setCarrierBundleProvisioningStyle:](v14, "setCarrierBundleProvisioningStyle:", 0LL);
    -[SubscriptionStatusOperation setAuthenticatesIfNecessary:](v14, "setAuthenticatesIfNecessary:", 0LL);
    v47[0] = _NSConcreteStackBlock;
    v47[1] = 3221225472LL;
    v47[2] = sub_10017FADC;
    v47[3] = &unk_1003507D8;
    v47[4] = &v48;
    -[SubscriptionStatusOperation setStatusBlock:](v14, "setStatusBlock:", v47);
    id v46 = v9;
    unsigned int v15 = -[CloudServiceCapabilitiesOperation runSubOperation:returningError:]( self,  "runSubOperation:returningError:",  v14,  &v46);
    id v25 = v46;

    if (v15)
    {
      id v26 = objc_alloc_init(&OBJC_CLASS___SSVCloudServiceCapabilitiesResponse);
      [v26 setSubscriptionStatus:v49[5]];
      id v16 = [(id)v49[5] accountStatus];
      id v17 = [(id)v49[5] carrierBundlingStatus];
      id v18 = v17;
      if (v16 == (id)3 || v17 == (id)4 || v17 == (id)1) {
        [v26 setSupportsMusicCatalogPlayback:1];
      }
      if (v16 == (id)3 || v18 == (id)1)
      {
        v19 = (void *)objc_claimAutoreleasedReturnValue(+[SSAccountStore defaultStore](&OBJC_CLASS___SSAccountStore, "defaultStore"));
        v20 = (void *)objc_claimAutoreleasedReturnValue([v19 activeLockerAccount]);

        if (v20) {
          [v26 setSupportsAddToCloudMusicLibrary:1];
        }
      }

      if (([v26 supportsMusicCatalogPlayback] & 1) == 0)
      {
        v21 = (void *)objc_claimAutoreleasedReturnValue(+[SSAccountStore defaultStore](&OBJC_CLASS___SSAccountStore, "defaultStore"));
        v22 = (void *)objc_claimAutoreleasedReturnValue([v21 activeAccount]);
        unsigned __int8 v23 = [v22 isManagedAppleID];

        if ((v23 & 1) != 0)
        {
          BOOL v24 = 0LL;
        }

        else
        {
          v34 = objc_alloc_init(&OBJC_CLASS___SSURLBagContext);
          -[SSURLBagContext setBagType:](v34, "setBagType:", 0LL);
          v35 = (void *)objc_claimAutoreleasedReturnValue(+[SSDevice currentDevice](&OBJC_CLASS___SSDevice, "currentDevice"));
          v36 = (void *)objc_claimAutoreleasedReturnValue([v35 userAgentWithClientName:@"Music" version:@"3.1"]);
          -[SSURLBagContext setValue:forHTTPHeaderField:]( v34,  "setValue:forHTTPHeaderField:",  v36,  SSHTTPHeaderUserAgent);

          v37 = -[ISLoadURLBagOperation initWithBagContext:]( objc_alloc(&OBJC_CLASS___ISLoadURLBagOperation),  "initWithBagContext:",  v34);
          id v45 = 0LL;
          unsigned int v38 = -[CloudServiceCapabilitiesOperation runSubOperation:returningError:]( self,  "runSubOperation:returningError:",  v37,  &v45);
          id v39 = v45;
          if (v39) {
            unsigned int v40 = 0;
          }
          else {
            unsigned int v40 = v38;
          }
          if (v40 == 1
            && (v41 = (void *)objc_claimAutoreleasedReturnValue(-[ISLoadURLBagOperation URLBag](v37, "URLBag")),
                (v42 = v41) != 0LL))
          {
            v43 = (void *)objc_claimAutoreleasedReturnValue([v41 valueForKey:SSVURLBagKeyMusicSubscription]);
            BOOL v24 = v43 != 0LL;
          }

          else
          {
            if (!v25)
            {
              if (v39) {
                id v44 = v39;
              }
              else {
                id v44 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  SSErrorDomain,  100LL,  0LL));
              }
              id v25 = v44;
            }

            BOOL v24 = 1LL;
          }
        }

        [v26 setCanSubscribeToMusicCatalog:v24];
      }

      BOOL v27 = v25 == 0LL;
      goto LABEL_47;
    }

    v28 = (void *)objc_claimAutoreleasedReturnValue([v25 domain]);
    uint64_t v29 = SSErrorDomain;
    id v30 = [v25 code];

    if (v30 != (id)107)
    {
LABEL_31:
      id v26 = 0LL;
      BOOL v27 = 0LL;
LABEL_47:

      _Block_object_dispose(&v48, 8);
      goto LABEL_48;
    }

    v31 = (void *)objc_claimAutoreleasedReturnValue([v25 userInfo]);
    v28 = (void *)objc_claimAutoreleasedReturnValue([v31 valueForKey:NSUnderlyingErrorKey]);

    v32 = (void *)objc_claimAutoreleasedReturnValue([v28 domain]);
    if ([v32 isEqualToString:v29])
    {
      id v33 = [v28 code];

      if (v33 != (id)154)
      {
LABEL_30:

        goto LABEL_31;
      }

      v32 = v25;
      id v25 = v28;
    }

    goto LABEL_30;
  }

  id v25 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  SSErrorDomain,  154LL,  0LL));

  id v26 = 0LL;
  BOOL v27 = 0LL;
LABEL_48:
  v5[2](v5, v26, v25);
  -[CloudServiceCapabilitiesOperation setError:](self, "setError:", v25);
  -[CloudServiceCapabilitiesOperation setSuccess:](self, "setSuccess:", v27);
}

- (id)_newResponseWithSubscriptionStatus:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(&OBJC_CLASS___SSVCloudServiceCapabilitiesResponse);
  [v4 setSubscriptionStatus:v3];
  id v5 = [v3 accountStatus];
  id v6 = [v3 carrierBundlingStatus];

  if (v5 == (id)3 || v6 == (id)4 || v6 == (id)1) {
    [v4 setSupportsMusicCatalogPlayback:1];
  }
  if (v5 == (id)3 || v6 == (id)1)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[SSAccountStore defaultStore](&OBJC_CLASS___SSAccountStore, "defaultStore"));
    int v8 = (void *)objc_claimAutoreleasedReturnValue([v7 activeLockerAccount]);

    if (v8) {
      [v4 setSupportsAddToCloudMusicLibrary:1];
    }
  }

  return v4;
}

- (void).cxx_destruct
{
}

@end
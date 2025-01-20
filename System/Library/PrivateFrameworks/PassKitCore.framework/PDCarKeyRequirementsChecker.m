@interface PDCarKeyRequirementsChecker
- (BOOL)carAccessFeatureAvailable;
- (BOOL)deviceSupportsCredentials;
- (PDCarKeyRequirementsChecker)initWithWebServiceCoordinator:(id)a3 databaseManager:(id)a4;
- (id)_carAccessFeature;
- (id)supportedTerminalForConfiguration:(id)a3;
- (id)supportedTerminalForTCIs:(id)a3 brandCode:(int64_t)a4;
- (void)canAddCarKeyPassWithConfiguration:(id)a3 completion:(id)a4;
@end

@implementation PDCarKeyRequirementsChecker

- (PDCarKeyRequirementsChecker)initWithWebServiceCoordinator:(id)a3 databaseManager:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___PDCarKeyRequirementsChecker;
  v9 = -[PDCarKeyRequirementsChecker init](&v12, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_webServiceCoordinator, a3);
    objc_storeStrong((id *)&v10->_databaseManager, a4);
  }

  return v10;
}

- (BOOL)deviceSupportsCredentials
{
  if (qword_100707970 != -1) {
    dispatch_once(&qword_100707970, &stru_100641F88);
  }
  if (byte_100707968) {
    return PKIsBeneficiaryAccount() ^ 1;
  }
  else {
    return 0;
  }
}

- (BOOL)carAccessFeatureAvailable
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PDCarKeyRequirementsChecker _carAccessFeature](self, "_carAccessFeature"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 supportedTerminals]);
  BOOL v4 = [v3 count] != 0;

  return v4;
}

- (void)canAddCarKeyPassWithConfiguration:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    uint64_t v8 = (uint64_t)[v6 supportedRadioTechnologies];
    if (!v8)
    {
      uint64_t Object = PKLogFacilityTypeGetObject(22LL);
      v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v71 = (uint64_t)v6;
        _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Defaulting to NFC due to missing or invalid radioTechnologies for configuration: %@",  buf,  0xCu);
      }

      uint64_t v8 = 1LL;
    }

    if (PKRadioTechnologyForConfigurationTechnology(v8))
    {
      if (-[PDCarKeyRequirementsChecker deviceSupportsCredentials](self, "deviceSupportsCredentials"))
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue([v6 manufacturerIdentifier]);
        if (v11 || (v11 = (void *)objc_claimAutoreleasedReturnValue([v6 issuerIdentifier])) != 0)
        {
          objc_super v12 = (void *)objc_claimAutoreleasedReturnValue([v6 issuerIdentifier]);
          unsigned __int8 v13 = +[PKDAManager isCarKeySupportedForManufacturerIdentifier:issuerIdentifier:productPlanIdentifier:]( &OBJC_CLASS___PKDAManager,  "isCarKeySupportedForManufacturerIdentifier:issuerIdentifier:productPlanIdentifier:",  v11,  v12,  0LL);

          if ((v13 & 1) == 0)
          {
            uint64_t v27 = PKLogFacilityTypeGetObject(22LL);
            v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
            if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              uint64_t v71 = (uint64_t)v6;
              _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_DEFAULT,  "Vehicle onboarding check failed for configuration: %@",  buf,  0xCu);
            }

            v16 = (void (*)(void *, uint64_t, void, void))v7[2];
            v17 = v7;
            uint64_t v18 = 0LL;
            goto LABEL_25;
          }
        }

        if (PKPassbookIsCurrentlyDeletedByUser())
        {
          uint64_t v14 = PKLogFacilityTypeGetObject(22LL);
          v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "Skipping feature enabled check because Wallet is deleted. User will be prompted to redownload Wallet befor e the configuration can be used.",  buf,  2u);
          }

          v16 = (void (*)(void *, uint64_t, void, void))v7[2];
          v17 = v7;
          uint64_t v18 = 1LL;
LABEL_25:
          v16(v17, v18, 0LL, 0LL);
          goto LABEL_26;
        }

        v29 = (void *)objc_claimAutoreleasedReturnValue([v6 pairedReaderIdentifier]);
        if ([v29 length])
        {
          v30 = (void *)objc_claimAutoreleasedReturnValue( -[PDDatabaseManager passesWithPairedReaderIdentifier:]( self->_databaseManager,  "passesWithPairedReaderIdentifier:",  v29));
          if (objc_msgSend(v30, "pk_hasObjectPassingTest:", &stru_100641FC8))
          {
            uint64_t v31 = PKLogFacilityTypeGetObject(22LL);
            v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
            if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              uint64_t v71 = (uint64_t)v29;
              _os_log_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_DEFAULT,  "Active credentialed pass already provisioned for '%@'",  buf,  0xCu);
            }

            uint64_t v33 = PKSubcredentialProvisioningErrorDomain;
            NSErrorUserInfoKey v64 = NSDebugDescriptionErrorKey;
            v65 = @"pass already provisioned";
            v34 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v65,  &v64,  1LL));
            uint64_t v35 = v33;
            uint64_t v36 = 11LL;
            goto LABEL_50;
          }
        }

        v30 = (void *)objc_claimAutoreleasedReturnValue(-[PDCarKeyRequirementsChecker _carAccessFeature](self, "_carAccessFeature"));
        if (v30)
        {
          uint64_t v37 = objc_claimAutoreleasedReturnValue([v6 issuerIdentifier]);
          v38 = (void *)v37;
          if (v37)
          {
            v39 = (void *)v37;
            v54 = v30;
            v55 = v29;
            __int128 v59 = 0u;
            __int128 v60 = 0u;
            __int128 v57 = 0u;
            __int128 v58 = 0u;
            id obj = (id)objc_claimAutoreleasedReturnValue([v30 supportedTerminals]);
            id v40 = [obj countByEnumeratingWithState:&v57 objects:v61 count:16];
            if (v40)
            {
              id v41 = v40;
              uint64_t v42 = *(void *)v58;
              while (2)
              {
                for (i = 0LL; i != v41; i = (char *)i + 1)
                {
                  if (*(void *)v58 != v42) {
                    objc_enumerationMutation(obj);
                  }
                  v44 = *(void **)(*((void *)&v57 + 1) + 8LL * (void)i);
                  v45 = (void *)objc_claimAutoreleasedReturnValue([v44 partnerIdentifier]);
                  unsigned int v46 = [v45 isEqualToString:v39];

                  if (v46)
                  {
                    ((void (*)(void *, uint64_t, void *, void))v7[2])(v7, 1LL, v44, 0LL);

                    v30 = v54;
                    v29 = v55;
                    v38 = v39;
                    goto LABEL_55;
                  }
                }

                id v41 = [obj countByEnumeratingWithState:&v57 objects:v61 count:16];
                if (v41) {
                  continue;
                }
                break;
              }
            }

            uint64_t v47 = PKLogFacilityTypeGetObject(22LL);
            v48 = (os_log_s *)objc_claimAutoreleasedReturnValue(v47);
            v38 = v39;
            if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              uint64_t v71 = (uint64_t)v39;
              _os_log_impl( (void *)&_mh_execute_header,  v48,  OS_LOG_TYPE_DEFAULT,  "Credentialed pass feature is supported on device but not with issuer: %@",  buf,  0xCu);
            }

            ((void (*)(void *, void, void, void))v7[2])(v7, 0LL, 0LL, 0LL);
            v30 = v54;
            v29 = v55;
          }

          else
          {
            uint64_t v52 = PKLogFacilityTypeGetObject(22LL);
            v53 = (os_log_s *)objc_claimAutoreleasedReturnValue(v52);
            if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl( (void *)&_mh_execute_header,  v53,  OS_LOG_TYPE_DEFAULT,  "Credentialed pass feature is supported and no issuer provided. Allowing flow to proceed because it will be blocked with SLG if issuer unsupported.",  buf,  2u);
            }

            ((void (*)(void *, uint64_t, void, void))v7[2])(v7, 1LL, 0LL, 0LL);
          }

          goto LABEL_55;
        }

        uint64_t v49 = PKLogFacilityTypeGetObject(22LL);
        v50 = (os_log_s *)objc_claimAutoreleasedReturnValue(v49);
        if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v50,  OS_LOG_TYPE_DEFAULT,  "Credentialed pass feature is not supported on device",  buf,  2u);
        }

        uint64_t v51 = PKSubcredentialProvisioningErrorDomain;
        NSErrorUserInfoKey v62 = NSDebugDescriptionErrorKey;
        v63 = @"Software not supported";
        v34 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v63,  &v62,  1LL));
        uint64_t v35 = v51;
        uint64_t v36 = 21LL;
LABEL_50:
        v38 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v35,  v36,  v34));

        ((void (*)(void *, void, void, void *))v7[2])(v7, 0LL, 0LL, v38);
LABEL_55:

        goto LABEL_26;
      }

      uint64_t v24 = PKLogFacilityTypeGetObject(22LL);
      v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "Device does not support provisioning passes with credentials",  buf,  2u);
      }

      uint64_t v21 = PKSubcredentialProvisioningErrorDomain;
      NSErrorUserInfoKey v66 = NSDebugDescriptionErrorKey;
      v67 = @"Hardware not supported";
      v22 = &v67;
      v23 = &v66;
    }

    else
    {
      uint64_t v19 = PKLogFacilityTypeGetObject(22LL);
      v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        uint64_t v71 = v8;
        _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "Device does not support the radio technologies %lu",  buf,  0xCu);
      }

      uint64_t v21 = PKSubcredentialProvisioningErrorDomain;
      NSErrorUserInfoKey v68 = NSDebugDescriptionErrorKey;
      v69 = @"Hardware not supported";
      v22 = &v69;
      v23 = &v68;
    }

    v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v22,  v23,  1LL));
    v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v21,  20LL,  v26));

    ((void (*)(void *, void, void, void *))v7[2])(v7, 0LL, 0LL, v11);
LABEL_26:
  }
}

- (id)supportedTerminalForTCIs:(id)a3 brandCode:(int64_t)a4
{
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[PDCarKeyRequirementsChecker _carAccessFeature](self, "_carAccessFeature"));
  v34 = v7;
  if (!v7)
  {
    uint64_t Object = PKLogFacilityTypeGetObject(22LL);
    a4 = objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled((os_log_t)a4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)a4,  OS_LOG_TYPE_DEFAULT,  "Native pairing feature is not supported on device",  buf,  2u);
    }

    objc_super v12 = 0LL;
    goto LABEL_36;
  }

  uint64_t v8 = v7;
  if (a4)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue([v7 brandIdentifierForBrandCode]);
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a4));
    a4 = objc_claimAutoreleasedReturnValue([v9 objectForKey:v10]);
  }

  __int128 v45 = 0u;
  __int128 v46 = 0u;
  __int128 v43 = 0u;
  __int128 v44 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue([v8 supportedTerminals]);
  id v37 = [obj countByEnumeratingWithState:&v43 objects:v52 count:16];
  if (!v37) {
    goto LABEL_31;
  }
  uint64_t v36 = *(void *)v44;
  do
  {
    uint64_t v11 = 0LL;
    do
    {
      if (*(void *)v44 != v36) {
        objc_enumerationMutation(obj);
      }
      uint64_t v38 = v11;
      objc_super v12 = *(void **)(*((void *)&v43 + 1) + 8 * v11);
      __int128 v39 = 0u;
      __int128 v40 = 0u;
      __int128 v41 = 0u;
      __int128 v42 = 0u;
      unsigned __int8 v13 = (void *)objc_claimAutoreleasedReturnValue([v12 terminalCriteria]);
      id v14 = [v13 countByEnumeratingWithState:&v39 objects:v51 count:16];
      if (!v14)
      {
LABEL_22:

        goto LABEL_29;
      }

      id v15 = v14;
      uint64_t v16 = *(void *)v40;
LABEL_11:
      uint64_t v17 = 0LL;
      while (1)
      {
        if (*(void *)v40 != v16) {
          objc_enumerationMutation(v13);
        }
        uint64_t v18 = *(void **)(*((void *)&v39 + 1) + 8 * v17);
        if ([v18 technologyType] != (id)4) {
          goto LABEL_20;
        }
        uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v18 primaryTCIs]);
        if ([v6 intersectsSet:v19])
        {
        }

        else
        {
          v20 = (void *)objc_claimAutoreleasedReturnValue([v18 TCIs]);
          unsigned int v21 = [v6 intersectsSet:v20];

          if (!v21) {
            goto LABEL_20;
          }
        }

        if (!a4)
        {
          id v24 = v12;
          uint64_t v25 = PKLogFacilityTypeGetObject(22LL);
          v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
          if (!os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_28;
          }
          *(_DWORD *)buf = 138412290;
          id v48 = v24;
          uint64_t v27 = v26;
          v28 = "Found associated terminal for field: %@";
          uint32_t v29 = 12;
          goto LABEL_27;
        }

        v22 = (void *)objc_claimAutoreleasedReturnValue([v12 partnerIdentifier]);
        unsigned int v23 = [(id)a4 isEqualToString:v22];

        if (v23) {
          break;
        }
LABEL_20:
        if (v15 == (id)++v17)
        {
          id v15 = [v13 countByEnumeratingWithState:&v39 objects:v51 count:16];
          if (v15) {
            goto LABEL_11;
          }
          goto LABEL_22;
        }
      }

      id v30 = v12;
      uint64_t v31 = PKLogFacilityTypeGetObject(22LL);
      v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
      if (!os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_28;
      }
      *(_DWORD *)buf = 138412546;
      id v48 = v30;
      __int16 v49 = 2112;
      int64_t v50 = a4;
      uint64_t v27 = v26;
      v28 = "Found associated terminal for field: %@ brandIdentifier: %@";
      uint32_t v29 = 22;
LABEL_27:
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, v28, buf, v29);
LABEL_28:

      if (v12) {
        goto LABEL_32;
      }
LABEL_29:
      uint64_t v11 = v38 + 1;
    }

    while ((id)(v38 + 1) != v37);
    id v37 = [obj countByEnumeratingWithState:&v43 objects:v52 count:16];
  }

  while (v37);
LABEL_31:
  objc_super v12 = 0LL;
LABEL_32:

LABEL_36:
  return v12;
}

- (id)supportedTerminalForConfiguration:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PDCarKeyRequirementsChecker _carAccessFeature](self, "_carAccessFeature"));
  if (v5)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 issuerIdentifier]);
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    __int128 v20 = 0u;
    __int128 v21 = 0u;
    id v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "supportedTerminals", 0));
    id v8 = [v7 countByEnumeratingWithState:&v18 objects:v24 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v19;
      while (2)
      {
        for (i = 0LL; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v19 != v10) {
            objc_enumerationMutation(v7);
          }
          objc_super v12 = *(void **)(*((void *)&v18 + 1) + 8LL * (void)i);
          unsigned __int8 v13 = (void *)objc_claimAutoreleasedReturnValue([v12 partnerIdentifier]);
          unsigned __int8 v14 = [v13 isEqualToString:v6];

          if ((v14 & 1) != 0)
          {
            id v16 = v12;
            goto LABEL_14;
          }
        }

        id v9 = [v7 countByEnumeratingWithState:&v18 objects:v24 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }

    uint64_t Object = PKLogFacilityTypeGetObject(22LL);
    id v7 = (void *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      unsigned int v23 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v7,  OS_LOG_TYPE_DEFAULT,  "Credentialed pass feature is supported on device but not with issuer: %@",  buf,  0xCu);
    }

    id v16 = 0LL;
LABEL_14:
  }

  else
  {
    id v16 = 0LL;
  }

  return v16;
}

- (id)_carAccessFeature
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( -[PDPaymentWebServiceCoordinator sharedWebServiceContext]( self->_webServiceCoordinator,  "sharedWebServiceContext"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 configuration]);
  uint64_t v4 = PKCurrentRegion();
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v3 featureWithType:2 inRegion:v5]);

  return v6;
}

- (void).cxx_destruct
{
}

@end
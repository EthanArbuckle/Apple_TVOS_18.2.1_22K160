@interface IDSKeyTransparencyRegistrationDataSource
- (BOOL)iCloudAccountDoesMatchAccountForIdentifier:(id)a3;
- (BOOL)isiCloudSignedIn;
- (id)_dependentRegistrationPropertyForKey:(id)a3 serviceIdentifier:(id)a4 pushToken:(id)a5;
- (id)currentLocalKeyTransparencyEligibleServiceIdentifiers;
- (id)currentLocalKeyTransparencyEnrolledURIsForServiceIdentifier:(id)a3;
- (id)trustedRemoteKeyTransparencySignatureForServiceIdentifier:(id)a3 pushToken:(id)a4;
- (int64_t)expectedRemoteKeyTransparencyEligibilityForServiceIdentifier:(id)a3 pushToken:(id)a4;
@end

@implementation IDSKeyTransparencyRegistrationDataSource

- (id)_dependentRegistrationPropertyForKey:(id)a3 serviceIdentifier:(id)a4 pushToken:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = v9;
  v11 = 0LL;
  if (v7 && v8 && v9)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[IDSDServiceController sharedInstance](&OBJC_CLASS___IDSDServiceController, "sharedInstance"));
    v13 = (void *)objc_claimAutoreleasedReturnValue([v12 serviceWithIdentifier:v8]);

    v14 = (void *)objc_claimAutoreleasedReturnValue(+[IDSDAccountController sharedInstance](&OBJC_CLASS___IDSDAccountController, "sharedInstance"));
    v15 = (void *)objc_claimAutoreleasedReturnValue([v14 appleIDAccountOnService:v13]);

    __int128 v29 = 0u;
    __int128 v30 = 0u;
    __int128 v31 = 0u;
    __int128 v32 = 0u;
    id v16 = (id)objc_claimAutoreleasedReturnValue([v15 dependentRegistrationsIncludingCurrentDevice]);
    id v17 = [v16 countByEnumeratingWithState:&v29 objects:v43 count:16];
    if (v17)
    {
      v27 = v15;
      v28 = v13;
      uint64_t v18 = *(void *)v30;
      uint64_t v19 = IDSDevicePropertyPushToken;
      while (2)
      {
        for (i = 0LL; i != v17; i = (char *)i + 1)
        {
          if (*(void *)v30 != v18) {
            objc_enumerationMutation(v16);
          }
          v21 = *(void **)(*((void *)&v29 + 1) + 8LL * (void)i);
          v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "objectForKey:", v19, v27, v28, (void)v29));
          if ([v10 isEqualToData:v22])
          {
            id v17 = v21;

            goto LABEL_14;
          }
        }

        id v17 = [v16 countByEnumeratingWithState:&v29 objects:v43 count:16];
        if (v17) {
          continue;
        }
        break;
      }

- (id)trustedRemoteKeyTransparencySignatureForServiceIdentifier:(id)a3 pushToken:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = im_primary_base_queue(v7);
  id v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v8);
  dispatch_assert_queue_V2(v9);

  v11 = (void *)objc_claimAutoreleasedReturnValue( -[IDSKeyTransparencyRegistrationDataSource _dependentRegistrationPropertyForKey:serviceIdentifier:pushToken:]( self,  "_dependentRegistrationPropertyForKey:serviceIdentifier:pushToken:",  IDSPrivateDeviceDataServiceSignatures,  v6,  v7));
  v12 = &IMInsertBoolsToXPCDictionary_ptr;
  if (!v11 || (uint64_t v13 = objc_opt_class(&OBJC_CLASS___NSString, v10), (objc_opt_isKindOfClass(v11, v13) & 1) == 0))
  {
    v15 = 0LL;
LABEL_19:
    v25 = 0LL;
    goto LABEL_20;
  }

  v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog KeyTransparency](&OBJC_CLASS___IDSFoundationLog, "KeyTransparency"));
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
    sub_1006ACA40();
  }

  v15 = -[NSData initWithBase64EncodedString:options:]( objc_alloc(&OBJC_CLASS___NSData),  "initWithBase64EncodedString:options:",  v11,  0LL);
  if (!v15) {
    goto LABEL_19;
  }
  id v16 = -[IDSProtoKeyTransparencyTrustedServiceSignatures initWithData:]( objc_alloc(&OBJC_CLASS___IDSProtoKeyTransparencyTrustedServiceSignatures),  "initWithData:",  v15);
  id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog KeyTransparency](&OBJC_CLASS___IDSFoundationLog, "KeyTransparency"));
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
    sub_1006AC9DC();
  }

  __int128 v32 = 0u;
  __int128 v33 = 0u;
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(-[IDSProtoKeyTransparencyTrustedServiceSignatures serviceSignatures](v16, "serviceSignatures"));
  id v19 = [v18 countByEnumeratingWithState:&v30 objects:v42 count:16];
  if (v19)
  {
    id v20 = v19;
    __int128 v29 = v16;
    uint64_t v21 = *(void *)v31;
    while (2)
    {
      for (i = 0LL; i != v20; i = (char *)i + 1)
      {
        if (*(void *)v31 != v21) {
          objc_enumerationMutation(v18);
        }
        v23 = *(void **)(*((void *)&v30 + 1) + 8LL * (void)i);
        v24 = (void *)objc_claimAutoreleasedReturnValue([v23 serviceIdentifier]);
        v25 = (void *)objc_claimAutoreleasedReturnValue([v23 signature]);
        if (v24 && [v6 isEqualToString:v24])
        {

          goto LABEL_26;
        }
      }

      id v20 = [v18 countByEnumeratingWithState:&v30 objects:v42 count:16];
      if (v20) {
        continue;
      }
      break;
    }

    v25 = 0LL;
LABEL_26:
    v12 = &IMInsertBoolsToXPCDictionary_ptr;
    id v16 = v29;
  }

  else
  {
    v25 = 0LL;
  }

LABEL_20:
  v26 = (os_log_s *)objc_claimAutoreleasedReturnValue([v12[219] KeyTransparency]);
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    v27 = @"YES";
    *(_DWORD *)buf = 138413058;
    id v35 = v6;
    if (!v11) {
      v27 = @"NO";
    }
    __int16 v36 = 2112;
    id v37 = v7;
    __int16 v38 = 2112;
    __int16 v39 = v27;
    __int16 v40 = 2112;
    __int16 v41 = v25;
    _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEFAULT,  "Returning KT signature for device { serviceIdentifier: %@, pushToken: %@, KTLoggableDataSignaturesString: %@, KTLo ggableDataSignature: %@ }",  buf,  0x2Au);
  }

  return v25;
}

- (int64_t)expectedRemoteKeyTransparencyEligibilityForServiceIdentifier:(id)a3 pushToken:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = im_primary_base_queue(v7);
  id v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v8);
  dispatch_assert_queue_V2(v9);

  if (([v6 isEqualToString:IDSiMessageKeyTransparencyService] & 1) != 0
    || ([v6 isEqualToString:IDSFaceTimeMultiKeyTransparencyService] & 1) != 0
    || [v6 isEqualToString:IDSMultiplex1KeyTransparencyService])
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue( -[IDSKeyTransparencyRegistrationDataSource _dependentRegistrationPropertyForKey:serviceIdentifier:pushToken:]( self,  "_dependentRegistrationPropertyForKey:serviceIdentifier:pushToken:",  IDSPrivateDeviceDataKeyTransparencyFlags,  v6,  v7));
    if (v11 && (uint64_t v12 = objc_opt_class(&OBJC_CLASS___NSString, v10), (objc_opt_isKindOfClass(v11, v12) & 1) != 0))
    {
      uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog KeyTransparency](&OBJC_CLASS___IDSFoundationLog, "KeyTransparency"));
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        int v17 = 138412802;
        id v18 = v6;
        __int16 v19 = 2112;
        id v20 = v7;
        __int16 v21 = 2112;
        v22 = v11;
        _os_log_debug_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEBUG,  "Key transparency flags { serviceIdentifier: %@, pushToken: %@, keyTransparencyFlagsString: %@ }",  (uint8_t *)&v17,  0x20u);
      }

      unint64_t v14 = (unint64_t)[v11 integerValue] & 1;
    }

    else
    {
      unint64_t v14 = -1LL;
    }

    v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog KeyTransparency](&OBJC_CLASS___IDSFoundationLog, "KeyTransparency"));
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 138413058;
      id v18 = v6;
      __int16 v19 = 2112;
      id v20 = v7;
      __int16 v21 = 2112;
      v22 = v11;
      __int16 v23 = 2048;
      unint64_t v24 = v14;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "Returning KT eligibility value { serviceIdentifier: %@, pushToken: %@, keyTransparencyFlagsString: %@, eligibility: %ld }",  (uint8_t *)&v17,  0x2Au);
    }
  }

  else
  {
    unint64_t v14 = -1LL;
  }

  return v14;
}

- (BOOL)iCloudAccountDoesMatchAccountForIdentifier:(id)a3
{
  id v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[IDSDServiceController sharedInstance](&OBJC_CLASS___IDSDServiceController, "sharedInstance"));
  __int128 v32 = v3;
  id v16 = (void *)objc_claimAutoreleasedReturnValue([v4 serviceWithIdentifier:v3]);

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[IDSDAccountController sharedInstance](&OBJC_CLASS___IDSDAccountController, "sharedInstance"));
  __int128 v31 = v16;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 appleIDAccountOnService:v16]);

  id v7 = objc_alloc(&OBJC_CLASS___IDSSystemAccountAdapter);
  uint64_t v9 = im_primary_queue(v7, v8);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v11 = -[IDSSystemAccountAdapter initWithQueue:](v7, "initWithQueue:", v10);

  id v33 = 0LL;
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[IDSSystemAccountAdapter iCloudSystemAccountWithError:](v11, "iCloudSystemAccountWithError:", &v33));
  id v13 = v33;
  uint64_t v14 = objc_claimAutoreleasedReturnValue([v12 DSID]);
  v15 = (void *)v14;
  LODWORD(v16) = 0;
  if (v6 && v14)
  {
    int v17 = (void *)objc_claimAutoreleasedReturnValue([v6 registration]);
    if ((uint64_t)[v17 registrationStatus] <= 4 && (int)objc_msgSend(v6, "registrationStatus") < 2)
    {
      LODWORD(v16) = 0;
    }

    else
    {
      id v18 = (void *)objc_claimAutoreleasedReturnValue([v6 dsID]);
      __int16 v19 = (void *)objc_claimAutoreleasedReturnValue([v12 DSID]);
      LODWORD(v16) = [v18 isEqualToString:v19];
    }
  }

  id v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog KeyTransparency](&OBJC_CLASS___IDSFoundationLog, "KeyTransparency"));
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    __int128 v30 = v15;
    id v21 = v13;
    if ((_DWORD)v16) {
      v22 = @"YES";
    }
    else {
      v22 = @"NO";
    }
    __int16 v23 = (void *)objc_claimAutoreleasedReturnValue([v6 loginID]);
    unint64_t v24 = (void *)objc_claimAutoreleasedReturnValue([v6 dsID]);
    uint64_t v25 = _IDSStringFromIDSRegistrationStatus([v6 registrationStatus]);
    char v29 = (char)v16;
    v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
    id v16 = (void *)objc_claimAutoreleasedReturnValue([v6 registration]);
    id v27 = [v16 registrationStatus];
    *(_DWORD *)buf = 138414082;
    id v35 = v32;
    __int16 v36 = 2112;
    id v37 = v22;
    id v13 = v21;
    v15 = v30;
    __int16 v38 = 2112;
    __int16 v39 = v12;
    __int16 v40 = 2112;
    id v41 = v13;
    __int16 v42 = 2112;
    v43 = v23;
    __int16 v44 = 2112;
    v45 = v24;
    __int16 v46 = 2112;
    v47 = v26;
    __int16 v48 = 2048;
    id v49 = v27;
    _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "Checked for iCloud account mismatch { serviceIdentifier: %@, iCloudAccountDoesMatchServiceAccount: %@, iCloudAccou nt: %@, iCloudAccountError: %@, serviceLoginID: %@, serviceDSID: %@, serviceAccountRegistrationStatus: %@, service RegistrationStatus: %ld }",  buf,  0x52u);

    LOBYTE(v16) = v29;
  }

  return (char)v16;
}

- (id)currentLocalKeyTransparencyEligibleServiceIdentifiers
{
  uint64_t v3 = im_primary_base_queue(self);
  v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v3);
  dispatch_assert_queue_V2(v4);

  v5 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  uint64_t v6 = IDSiMessageKeyTransparencyService;
  if (-[IDSKeyTransparencyRegistrationDataSource iCloudAccountDoesMatchAccountForIdentifier:]( self,  "iCloudAccountDoesMatchAccountForIdentifier:",  IDSiMessageKeyTransparencyService))
  {
    -[NSMutableArray addObject:](v5, "addObject:", v6);
  }

  uint64_t v7 = IDSMultiplex1KeyTransparencyService;
  if (-[IDSKeyTransparencyRegistrationDataSource iCloudAccountDoesMatchAccountForIdentifier:]( self,  "iCloudAccountDoesMatchAccountForIdentifier:",  IDSMultiplex1KeyTransparencyService))
  {
    -[NSMutableArray addObject:](v5, "addObject:", v7);
  }

  uint64_t v8 = IDSFaceTimeMultiKeyTransparencyService;
  if (-[IDSKeyTransparencyRegistrationDataSource iCloudAccountDoesMatchAccountForIdentifier:]( self,  "iCloudAccountDoesMatchAccountForIdentifier:",  IDSFaceTimeMultiKeyTransparencyService))
  {
    -[NSMutableArray addObject:](v5, "addObject:", v8);
  }

  return v5;
}

- (id)currentLocalKeyTransparencyEnrolledURIsForServiceIdentifier:(id)a3
{
  id v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[IDSDServiceController sharedInstance](&OBJC_CLASS___IDSDServiceController, "sharedInstance"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 serviceWithIdentifier:v3]);

  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[IDSDAccountController sharedInstance](&OBJC_CLASS___IDSDAccountController, "sharedInstance"));
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 accountsOnService:v5]);

  uint64_t v8 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  id v9 = v7;
  id v10 = [v9 countByEnumeratingWithState:&v19 objects:v27 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v20;
    do
    {
      id v13 = 0LL;
      do
      {
        if (*(void *)v20 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * (void)v13), "registration", (void)v19));
        v15 = (void *)objc_claimAutoreleasedReturnValue([v14 keyTransparencyEnrolledURIs]);
        -[NSMutableSet addObjectsFromArray:](v8, "addObjectsFromArray:", v15);

        id v13 = (char *)v13 + 1;
      }

      while (v11 != v13);
      id v11 = [v9 countByEnumeratingWithState:&v19 objects:v27 count:16];
    }

    while (v11);
  }

  id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog KeyTransparency](&OBJC_CLASS___IDSFoundationLog, "KeyTransparency"));
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v24 = v3;
    __int16 v25 = 2112;
    v26 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "Returning key transparency enrolled URIs { serviceIdentifier: %@, enrolledURIs: %@ }",  buf,  0x16u);
  }

  int v17 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableSet allObjects](v8, "allObjects"));
  return v17;
}

- (BOOL)isiCloudSignedIn
{
  v2 = objc_alloc(&OBJC_CLASS___IDSSystemAccountAdapter);
  uint64_t v4 = im_primary_queue(v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  uint64_t v6 = -[IDSSystemAccountAdapter initWithQueue:](v2, "initWithQueue:", v5);

  id v11 = 0LL;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[IDSSystemAccountAdapter iCloudSystemAccountWithError:](v6, "iCloudSystemAccountWithError:", &v11));
  id v8 = v11;
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog KeyTransparency](&OBJC_CLASS___IDSFoundationLog, "KeyTransparency"));
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v13 = v7;
    __int16 v14 = 2112;
    id v15 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Returning iCloud sign-in status for key transparency { iCloudAccount: %@, iCloudAccountError: %@ }",  buf,  0x16u);
  }

  return v7 != 0LL;
}

@end
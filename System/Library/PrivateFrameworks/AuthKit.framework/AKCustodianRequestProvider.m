@interface AKCustodianRequestProvider
- (AKCustodianContext)custodianContext;
- (AKCustodianRequestProvider)initWithContext:(id)a3 urlBagKey:(id)a4;
- (BOOL)authenticatedRequest;
- (BOOL)signRequest:(id)a3 error:(id *)a4;
- (BOOL)signWithIdentityToken;
- (BOOL)validateResponseData:(id)a3 error:(id *)a4;
- (id)_bodyForAddAndRevokeCustodianRequest;
- (id)_bodyForCustodianUpdateRecoveryKeyRequest;
- (id)_bodyForEmbargoEndFeedback;
- (id)_bodyForFinalizeCustodianRequest;
- (id)_bodyForRecoveryCircle;
- (id)_bodyForTrustedContactsDataSync;
- (id)authKitBody;
- (unint64_t)expectedResponseType;
- (unint64_t)requestBodyType;
- (void)setAuthenticatedRequest:(BOOL)a3;
- (void)setCustodianContext:(id)a3;
- (void)setSignWithIdentityToken:(BOOL)a3;
@end

@implementation AKCustodianRequestProvider

- (AKCustodianRequestProvider)initWithContext:(id)a3 urlBagKey:(id)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___AKCustodianRequestProvider;
  v8 = -[AKURLRequestProviderImpl initWithContext:urlBagKey:shouldCacheResource:]( &v11,  "initWithContext:urlBagKey:shouldCacheResource:",  v7,  a4,  0LL);
  v9 = v8;
  if (v8) {
    objc_storeStrong((id *)&v8->_custodianContext, a3);
  }

  return v9;
}

- (unint64_t)expectedResponseType
{
  return 1LL;
}

- (unint64_t)requestBodyType
{
  return 1LL;
}

- (BOOL)signRequest:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = objc_alloc(&OBJC_CLASS___AKDServerUIController);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[AKURLRequestProviderImpl client](self, "client"));
  v9 = -[AKDServerUIController initWithClient:](v7, "initWithClient:", v8);

  v10 = objc_alloc(&OBJC_CLASS___AKAppleIDAuthenticationContext);
  objc_super v11 = (void *)objc_claimAutoreleasedReturnValue(-[AKCustodianRequestProvider custodianContext](self, "custodianContext"));
  v12 = -[AKAppleIDAuthenticationContext initWithAuthenticatedServerRequestContext:]( v10,  "initWithAuthenticatedServerRequestContext:",  v11);

  -[AKAppleIDAuthenticationContext set_shouldSendIdentityTokenForRemoteUI:]( v12,  "set_shouldSendIdentityTokenForRemoteUI:",  -[AKCustodianRequestProvider signWithIdentityToken](self, "signWithIdentityToken"));
  -[AKAppleIDAuthenticationContext set_shouldSendGrandSlamTokensForRemoteUI:]( v12,  "set_shouldSendGrandSlamTokensForRemoteUI:",  1LL);
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[AKDServerUIController resourceLoadDelegateWithContext:](v9, "resourceLoadDelegateWithContext:", v12));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[AKURLRequestProviderImpl urlBagKey](self, "urlBagKey"));
  [v13 setInitialURLRequestKey:v14];

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[AKURLRequestProviderImpl urlBagKey](self, "urlBagKey"));
  [v13 setBagUrlKey:v15];

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[AKURLRequestProviderImpl dataCenterIdentifier](self, "dataCenterIdentifier"));
  [v13 setDataCenterIdentifier:v16];

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[AKCustodianRequestProvider custodianContext](self, "custodianContext"));
  objc_msgSend(v13, "setCliMode:", objc_msgSend(v17, "cliMode"));

  if (!-[AKCustodianRequestProvider authenticatedRequest](self, "authenticatedRequest"))
  {
    [v13 signRequestWithBasicHeaders:v6];
    goto LABEL_9;
  }

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[AKCustodianRequestProvider custodianContext](self, "custodianContext"));
  v19 = (void *)objc_claimAutoreleasedReturnValue([v18 custodianSetupToken]);
  [v13 setServiceToken:v19];

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[AKCustodianRequestProvider custodianContext](self, "custodianContext"));
  v21 = (void *)objc_claimAutoreleasedReturnValue([v20 custodianRecoveryToken]);
  [v13 setCustodianRecoveryToken:v21];

  v22 = (void *)objc_claimAutoreleasedReturnValue(-[AKCustodianRequestProvider custodianContext](self, "custodianContext"));
  LODWORD(v21) = [v22 isCustodianSyncAction];

  if ((_DWORD)v21)
  {
    uint64_t v24 = _AKLogSystem(v23);
    v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG)) {
      sub_10012FD80();
    }

    objc_msgSend(v6, "ak_addCustodianSyncActionHeader");
  }

  v26 = (void *)objc_claimAutoreleasedReturnValue([v13 heartbeatToken]);

  if (v26)
  {
    [v13 signRequestWithCommonHeaders:v6];
LABEL_9:
    BOOL v28 = 1;
    goto LABEL_10;
  }

  uint64_t v30 = _AKLogSystem(v27);
  v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
  if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
    sub_10012FCE4(self);
  }

  BOOL v28 = 0;
  if (a4) {
    *a4 = (id)objc_claimAutoreleasedReturnValue(+[NSError ak_errorWithCode:](&OBJC_CLASS___NSError, "ak_errorWithCode:", -7042LL));
  }
LABEL_10:

  return v28;
}

- (id)authKitBody
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[AKURLRequestProviderImpl urlBagKey](self, "urlBagKey"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[AKURLRequestProviderImpl urlBagKey](self, "urlBagKey"));
  if (v4 == (void *)AKURLBagKeyCustodianPostCircle)
  {
LABEL_8:

LABEL_9:
    goto LABEL_10;
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[AKURLRequestProviderImpl urlBagKey](self, "urlBagKey"));
  id v6 = v5;
  if (v5 == (void *)AKURLBagKeyCustodianRecoveryWrappingKey)
  {

    goto LABEL_8;
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[AKURLRequestProviderImpl urlBagKey](self, "urlBagKey"));
  v8 = (void *)AKURLBagKeyCustodianRecoveryRequest;

  if (v7 == v8)
  {
LABEL_10:
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[AKCustodianRequestProvider _bodyForRecoveryCircle](self, "_bodyForRecoveryCircle"));
    return v10;
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[AKURLRequestProviderImpl urlBagKey](self, "urlBagKey"));
  if ([v9 isEqualToString:AKURLBagKeyCustodianInitiation])
  {

LABEL_13:
    v10 = (void *)objc_claimAutoreleasedReturnValue( -[AKCustodianRequestProvider _bodyForAddAndRevokeCustodianRequest]( self,  "_bodyForAddAndRevokeCustodianRequest"));
    return v10;
  }

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[AKURLRequestProviderImpl urlBagKey](self, "urlBagKey"));
  unsigned int v13 = [v12 isEqualToString:AKURLBagKeyCustodianDeletion];

  if (v13) {
    goto LABEL_13;
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[AKURLRequestProviderImpl urlBagKey](self, "urlBagKey"));
  unsigned int v15 = [v14 isEqualToString:AKURLBagKeyCustodianApproval];

  if (v15)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue( -[AKCustodianRequestProvider _bodyForFinalizeCustodianRequest]( self,  "_bodyForFinalizeCustodianRequest"));
  }

  else
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[AKURLRequestProviderImpl urlBagKey](self, "urlBagKey"));
    unsigned int v17 = [v16 isEqualToString:AKURLBagKeyCustodianUpdateRecoveryKey];

    if (v17)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue( -[AKCustodianRequestProvider _bodyForCustodianUpdateRecoveryKeyRequest]( self,  "_bodyForCustodianUpdateRecoveryKeyRequest"));
    }

    else
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[AKURLRequestProviderImpl urlBagKey](self, "urlBagKey"));
      unsigned int v19 = [v18 isEqualToString:AKURLBagKeyCustodianRecoveryFeedback];

      if (v19)
      {
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[AKCustodianRequestProvider _bodyForEmbargoEndFeedback](self, "_bodyForEmbargoEndFeedback"));
      }

      else
      {
        v20 = (void *)objc_claimAutoreleasedReturnValue(-[AKURLRequestProviderImpl urlBagKey](self, "urlBagKey"));
        unsigned int v21 = [v20 isEqualToString:AKURLBagKeyTrustedContactsDataSync];

        if (v21) {
          v10 = (void *)objc_claimAutoreleasedReturnValue( -[AKCustodianRequestProvider _bodyForTrustedContactsDataSync]( self,  "_bodyForTrustedContactsDataSync"));
        }
        else {
          v10 = 0LL;
        }
      }
    }
  }

  return v10;
}

- (id)_bodyForRecoveryCircle
{
  v3 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[AKCustodianRequestProvider custodianContext](self, "custodianContext"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 pushToken]);

  if (v5)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[AKCustodianRequestProvider custodianContext](self, "custodianContext"));
    v8 = (void *)objc_claimAutoreleasedReturnValue([v7 pushToken]);
    -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v8, @"ptkn");
  }

  else
  {
    uint64_t v9 = _AKLogSystem(v6);
    id v7 = (void *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_ERROR)) {
      sub_10012FE2C();
    }
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[AKCustodianRequestProvider custodianContext](self, "custodianContext"));
  objc_super v11 = (void *)objc_claimAutoreleasedReturnValue([v10 recoverySessionID]);

  if (v11)
  {
    unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue(-[AKCustodianRequestProvider custodianContext](self, "custodianContext"));
    v14 = (void *)objc_claimAutoreleasedReturnValue([v13 recoverySessionID]);
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  v14,  @"recoverySessionId");
  }

  else
  {
    uint64_t v15 = _AKLogSystem(v12);
    unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled((os_log_t)v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v65 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v13,  OS_LOG_TYPE_DEFAULT,  "There was no custodian recovery session ID. This should only happen on Start CLI",  v65,  2u);
    }
  }

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[AKCustodianRequestProvider custodianContext](self, "custodianContext"));
  unsigned int v17 = (void *)objc_claimAutoreleasedReturnValue([v16 recoveryStep]);

  if (v17)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[AKCustodianRequestProvider custodianContext](self, "custodianContext"));
    unsigned int v19 = (void *)objc_claimAutoreleasedReturnValue([v18 recoveryStep]);
    -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v19, @"nextStep");
  }

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[AKCustodianRequestProvider custodianContext](self, "custodianContext"));
  unsigned int v21 = (void *)objc_claimAutoreleasedReturnValue([v20 recoverySessionID]);

  if (v21)
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[AKCustodianRequestProvider custodianContext](self, "custodianContext"));
    uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([v22 recoverySessionID]);
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  v23,  @"recoverySessionId");
  }

  uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue(-[AKCustodianRequestProvider custodianContext](self, "custodianContext"));
  v25 = (void *)objc_claimAutoreleasedReturnValue([v24 ownerAppleID]);

  if (v25)
  {
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[AKCustodianRequestProvider custodianContext](self, "custodianContext"));
    uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue([v26 ownerAppleID]);
    -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v27, @"ownerAppleId");
  }

  BOOL v28 = (void *)objc_claimAutoreleasedReturnValue(-[AKCustodianRequestProvider custodianContext](self, "custodianContext"));
  v29 = (void *)objc_claimAutoreleasedReturnValue([v28 ownerCustodianAltDSID]);

  if (v29)
  {
    uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue(-[AKCustodianRequestProvider custodianContext](self, "custodianContext"));
    v31 = (void *)objc_claimAutoreleasedReturnValue([v30 ownerCustodianAltDSID]);
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  v31,  @"ownerCustodianAltDSID");
  }

  v32 = (void *)objc_claimAutoreleasedReturnValue(-[AKCustodianRequestProvider custodianContext](self, "custodianContext"));
  v33 = (void *)objc_claimAutoreleasedReturnValue([v32 custodianUUID]);

  if (v33)
  {
    v34 = (void *)objc_claimAutoreleasedReturnValue(-[AKCustodianRequestProvider custodianContext](self, "custodianContext"));
    v35 = (void *)objc_claimAutoreleasedReturnValue([v34 custodianUUID]);
    v36 = (void *)objc_claimAutoreleasedReturnValue([v35 UUIDString]);
    -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v36, @"custodianUUID");
  }

  v37 = (void *)objc_claimAutoreleasedReturnValue(-[AKCustodianRequestProvider custodianContext](self, "custodianContext"));
  v38 = (void *)objc_claimAutoreleasedReturnValue([v37 idmsData]);

  if (v38)
  {
    v39 = (void *)objc_claimAutoreleasedReturnValue(-[AKCustodianRequestProvider custodianContext](self, "custodianContext"));
    v40 = (void *)objc_claimAutoreleasedReturnValue([v39 idmsData]);
    v41 = (void *)objc_claimAutoreleasedReturnValue([v40 base64EncodedStringWithOptions:0]);

    -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v41, @"idmsdata");
  }

  v42 = (void *)objc_claimAutoreleasedReturnValue(-[AKCustodianRequestProvider custodianContext](self, "custodianContext"));
  v43 = (void *)objc_claimAutoreleasedReturnValue([v42 aaData]);

  if (v43)
  {
    v44 = (void *)objc_claimAutoreleasedReturnValue(-[AKCustodianRequestProvider custodianContext](self, "custodianContext"));
    v45 = (void *)objc_claimAutoreleasedReturnValue([v44 aaData]);
    v46 = (void *)objc_claimAutoreleasedReturnValue([v45 base64EncodedStringWithOptions:0]);

    -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v46, @"aadata");
  }

  v47 = (void *)objc_claimAutoreleasedReturnValue(-[AKCustodianRequestProvider custodianContext](self, "custodianContext"));
  v48 = (void *)objc_claimAutoreleasedReturnValue([v47 encryptedPRKC]);

  if (v48)
  {
    v49 = (void *)objc_claimAutoreleasedReturnValue(-[AKCustodianRequestProvider custodianContext](self, "custodianContext"));
    v50 = (void *)objc_claimAutoreleasedReturnValue([v49 encryptedPRKC]);
    v51 = (void *)objc_claimAutoreleasedReturnValue([v50 base64EncodedStringWithOptions:0]);

    -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v51, @"encryptedPRKC");
  }

  v52 = (void *)objc_claimAutoreleasedReturnValue(-[AKCustodianRequestProvider custodianContext](self, "custodianContext"));
  id v53 = [v52 clientErrorCode];

  if (v53)
  {
    v54 = (void *)objc_claimAutoreleasedReturnValue(-[AKCustodianRequestProvider custodianContext](self, "custodianContext"));
    v55 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [v54 clientErrorCode]));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v55, @"ec");
  }

  v56 = (void *)objc_claimAutoreleasedReturnValue(-[AKCustodianRequestProvider custodianContext](self, "custodianContext"));
  v57 = (void *)objc_claimAutoreleasedReturnValue([v56 recordBuildVersion]);

  if (v57)
  {
    v59 = (void *)objc_claimAutoreleasedReturnValue(-[AKCustodianRequestProvider custodianContext](self, "custodianContext"));
    v60 = (void *)objc_claimAutoreleasedReturnValue([v59 recordBuildVersion]);
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  v60,  @"recordBuildVersion");
  }

  uint64_t v61 = _AKLogSystem(v58);
  v62 = (os_log_s *)objc_claimAutoreleasedReturnValue(v61);
  if (os_log_type_enabled(v62, OS_LOG_TYPE_DEBUG)) {
    sub_10012FDB8((uint64_t)v3, v62);
  }

  id v63 = -[NSMutableDictionary copy](v3, "copy");
  return v63;
}

- (id)_bodyForAddAndRevokeCustodianRequest
{
  v3 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[AKCustodianRequestProvider custodianContext](self, "custodianContext"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 custodianUUID]);

  if (v5)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[AKCustodianRequestProvider custodianContext](self, "custodianContext"));
    v8 = (void *)objc_claimAutoreleasedReturnValue([v7 custodianUUID]);
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 UUIDString]);
    -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v9, @"custodianUUID");
  }

  else
  {
    uint64_t v10 = _AKLogSystem(v6);
    id v7 = (void *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_ERROR)) {
      sub_10012FE58();
    }
  }

  id v11 = -[NSMutableDictionary copy](v3, "copy");
  return v11;
}

- (id)_bodyForFinalizeCustodianRequest
{
  v3 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[AKCustodianRequestProvider custodianContext](self, "custodianContext"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 custodianUUID]);

  if (v5)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[AKCustodianRequestProvider custodianContext](self, "custodianContext"));
    v8 = (void *)objc_claimAutoreleasedReturnValue([v7 custodianUUID]);
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 UUIDString]);
    -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v9, @"custodianUUID");
  }

  else
  {
    uint64_t v10 = _AKLogSystem(v6);
    id v7 = (void *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_ERROR)) {
      sub_10012FE84();
    }
  }

  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[AKCustodianRequestProvider custodianContext](self, "custodianContext"));
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 wrappingKeyRKC]);

  if (v12)
  {
    unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue(-[AKCustodianRequestProvider custodianContext](self, "custodianContext"));
    v14 = (void *)objc_claimAutoreleasedReturnValue([v13 wrappingKeyRKC]);
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v14 base64EncodedStringWithOptions:0]);

    -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  v15,  @"wrappingKeyRKC");
  }

  id v16 = -[NSMutableDictionary copy](v3, "copy");

  return v16;
}

- (id)_bodyForCustodianUpdateRecoveryKeyRequest
{
  v3 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[AKCustodianRequestProvider custodianContext](self, "custodianContext"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 custodianUUID]);

  if (v5)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[AKCustodianRequestProvider custodianContext](self, "custodianContext"));
    v8 = (void *)objc_claimAutoreleasedReturnValue([v7 custodianUUID]);
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 UUIDString]);
    -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v9, @"custodianUUID");
  }

  else
  {
    uint64_t v10 = _AKLogSystem(v6);
    id v7 = (void *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_ERROR)) {
      sub_10012FEDC();
    }
  }

  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[AKCustodianRequestProvider custodianContext](self, "custodianContext"));
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 wrappingKeyRKC]);

  if (v12)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[AKCustodianRequestProvider custodianContext](self, "custodianContext"));
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v14 wrappingKeyRKC]);
    id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue([v15 base64EncodedStringWithOptions:0]);

    -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  v16,  @"wrappingKeyRKC");
  }

  else
  {
    uint64_t v17 = _AKLogSystem(v13);
    id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_10012FEB0();
    }
  }

  id v18 = -[NSMutableDictionary copy](v3, "copy");
  return v18;
}

- (id)_bodyForEmbargoEndFeedback
{
  v3 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[AKCustodianRequestProvider custodianContext](self, "custodianContext"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 transactionID]);

  if (v5)
  {
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[AKCustodianRequestProvider custodianContext](self, "custodianContext"));
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 transactionID]);
    -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v7, @"txnid");
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[AKCustodianRequestProvider custodianContext](self, "custodianContext"));
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [v8 notificationAction]));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v9, @"action");

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[AKCustodianRequestProvider custodianContext](self, "custodianContext"));
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 recoverySessionID]);

  if (v11)
  {
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[AKCustodianRequestProvider custodianContext](self, "custodianContext"));
    v14 = (void *)objc_claimAutoreleasedReturnValue([v13 recoverySessionID]);
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  v14,  @"recoverySessionId");
  }

  else
  {
    uint64_t v15 = _AKLogSystem(v12);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled((os_log_t)v13, OS_LOG_TYPE_ERROR)) {
      sub_10012FF34();
    }
  }

  id v16 = (void *)objc_claimAutoreleasedReturnValue(-[AKCustodianRequestProvider custodianContext](self, "custodianContext"));
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v16 altDSID]);

  if (v17)
  {
    unsigned int v19 = (void *)objc_claimAutoreleasedReturnValue(-[AKCustodianRequestProvider custodianContext](self, "custodianContext"));
    v20 = (void *)objc_claimAutoreleasedReturnValue([v19 altDSID]);
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  v20,  @"recoveryAlternateDsId");
  }

  else
  {
    uint64_t v21 = _AKLogSystem(v18);
    unsigned int v19 = (void *)objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled((os_log_t)v19, OS_LOG_TYPE_ERROR)) {
      sub_10012FF08();
    }
  }

  id v22 = -[NSMutableDictionary copy](v3, "copy");
  return v22;
}

- (id)_bodyForTrustedContactsDataSync
{
  v3 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[AKCustodianRequestProvider custodianContext](self, "custodianContext"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 custodianContacts]);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "aaf_map:", &stru_1001C7790));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v6, @"custodianUUIDs");

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[AKCustodianRequestProvider custodianContext](self, "custodianContext"));
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 beneficiaryContacts]);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "aaf_map:", &stru_1001C7790));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v9, @"beneficiaryUUIDs");

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[AKCustodianRequestProvider custodianContext](self, "custodianContext"));
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 lastDataSyncTimestamp]);

  if (v11)
  {
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[AKCustodianRequestProvider custodianContext](self, "custodianContext"));
    v14 = (void *)objc_claimAutoreleasedReturnValue([v13 lastDataSyncTimestamp]);
    [v14 timeIntervalSince1970];
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v15, @"timestampOnCK");
  }

  else
  {
    uint64_t v16 = _AKLogSystem(v12);
    uint64_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      sub_10012FF60(self);
    }
  }

  id v18 = -[NSMutableDictionary copy](v3, "copy");

  return v18;
}

- (BOOL)validateResponseData:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___AKCustodianRequestProvider;
  if (-[AKURLRequestProviderImpl validateResponseData:error:](&v19, "validateResponseData:error:", v6, a4))
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue( +[AAFSerialization dictionaryFromObject:ofType:]( &OBJC_CLASS___AAFSerialization,  "dictionaryFromObject:ofType:",  v6,  @"application/json"));
    v8 = v7;
    if (v7)
    {
      uint64_t v9 = AKErrorStatusCodeKey;
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:AKErrorStatusCodeKey]);
      id v11 = v10;
      if (v10 && (id v12 = [v10 integerValue]) != 0)
      {
        uint64_t v13 = _AKLogSystem(v12);
        v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
          sub_10012FFE4(v11, v14);
        }

        v20[0] = NSLocalizedDescriptionKey;
        uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:AKErrorMessageKey]);
        v20[1] = v9;
        v21[0] = v15;
        v21[1] = v11;
        uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v21,  v20,  2LL));

        *a4 = (id)objc_claimAutoreleasedReturnValue( +[NSError ak_errorWithCode:userInfo:]( &OBJC_CLASS___NSError,  "ak_errorWithCode:userInfo:",  -7010LL,  v16));
        BOOL v17 = 0;
      }

      else
      {
        BOOL v17 = 1;
      }
    }

    else
    {
      BOOL v17 = 1;
    }
  }

  else
  {
    BOOL v17 = 0;
  }

  return v17;
}

- (BOOL)authenticatedRequest
{
  return self->_authenticatedRequest;
}

- (void)setAuthenticatedRequest:(BOOL)a3
{
  self->_authenticatedRequest = a3;
}

- (BOOL)signWithIdentityToken
{
  return self->_signWithIdentityToken;
}

- (void)setSignWithIdentityToken:(BOOL)a3
{
  self->_signWithIdentityToken = a3;
}

- (AKCustodianContext)custodianContext
{
  return self->_custodianContext;
}

- (void)setCustodianContext:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
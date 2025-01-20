@interface PDGeneralSharingManagementService
- (PDGeneralSharingManagementService)init;
- (PDGeneralSharingManagementService)initWithWebServiceCoordinator:(id)a3;
- (void)createShareInvitationFromShare:(id)a3 forPass:(id)a4 authorization:(id)a5 completion:(id)a6;
- (void)prewarmCreateShareForPass:(id)a3 completion:(id)a4;
- (void)revokeShares:(id)a3 forPass:(id)a4 shouldCascade:(BOOL)a5 completion:(id)a6;
- (void)updateShare:(id)a3 forPass:(id)a4 authorization:(id)a5 completion:(id)a6;
@end

@implementation PDGeneralSharingManagementService

- (PDGeneralSharingManagementService)init
{
  return 0LL;
}

- (PDGeneralSharingManagementService)initWithWebServiceCoordinator:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___PDGeneralSharingManagementService;
  v6 = -[PDGeneralSharingManagementService init](&v11, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_webServiceCoordinator, a3);
    v8 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    cachedFidoChallenges = v7->_cachedFidoChallenges;
    v7->_cachedFidoChallenges = v8;
  }

  return v7;
}

- (void)createShareInvitationFromShare:(id)a3 forPass:(id)a4 authorization:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v35 = a6;
  v38 = (void *)objc_claimAutoreleasedReturnValue([v10 share]);
  uint64_t Object = PKLogFacilityTypeGetObject(33LL);
  v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue([v11 uniqueID]);
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v15;
    _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "SharingManagementService: Creating share for %@",  (uint8_t *)&buf,  0xCu);
  }

  v16 = (void *)objc_claimAutoreleasedReturnValue([v11 devicePrimaryPaymentApplication]);
  v37 = (void *)objc_claimAutoreleasedReturnValue([v16 dpanIdentifier]);

  if (v37)
  {
    v36 = (void *)objc_claimAutoreleasedReturnValue([v11 longTermPrivacyKeyGroupIdentifier]);
    if (v36)
    {
      v17 = objc_alloc_init(&OBJC_CLASS___PDSharingManagementCreateShareRequest);
      -[PDSharingManagementCreateShareRequest setDpanIdentifier:](v17, "setDpanIdentifier:", v37);
      v18 = (void *)objc_claimAutoreleasedReturnValue([v38 sharedEntitlements]);
      -[PDSharingManagementCreateShareRequest setSharedEntitlements:](v17, "setSharedEntitlements:", v18);

      v19 = (void *)objc_claimAutoreleasedReturnValue([v38 recipientNickname]);
      -[PDSharingManagementCreateShareRequest setRecipient:](v17, "setRecipient:", v19);

      v20 = (void *)objc_claimAutoreleasedReturnValue([v11 passTypeIdentifier]);
      -[PDSharingManagementRequest setRegionIdentifier:](v17, "setRegionIdentifier:", v20);

      id v77 = 0LL;
      id v21 = sub_1001BA110((uint64_t)self, v38, &v77);
      v32 = (void *)objc_claimAutoreleasedReturnValue(v21);
      id v34 = v77;
      -[PDSharingManagementCreateShareRequest setVerificationCode:](v17, "setVerificationCode:");
      id v33 = objc_alloc_init(&OBJC_CLASS___PKAsyncUnaryOperationComposer);
      *(void *)&__int128 buf = 0LL;
      *((void *)&buf + 1) = &buf;
      uint64_t v79 = 0x3032000000LL;
      v80 = sub_1001BA27C;
      v81 = sub_1001BA28C;
      id v82 = 0LL;
      v73[0] = _NSConcreteStackBlock;
      v73[1] = 3221225472LL;
      v73[2] = sub_1001BA294;
      v73[3] = &unk_1006433B0;
      v73[4] = self;
      v22 = v17;
      v74 = v22;
      id v23 = v11;
      id v75 = v23;
      p___int128 buf = &buf;
      [v33 addOperation:v73];
      v24 = (void *)objc_claimAutoreleasedReturnValue([v23 fidoProfile]);

      if (v24)
      {
        v68[0] = _NSConcreteStackBlock;
        v68[1] = 3221225472LL;
        v68[2] = sub_1001BA560;
        v68[3] = &unk_10063EE70;
        v68[4] = self;
        id v69 = v23;
        id v70 = v12;
        v71 = v22;
        v72 = &buf;
        [v33 addOperation:v68];
      }

      v66[0] = 0LL;
      v66[1] = v66;
      v66[2] = 0x3032000000LL;
      v66[3] = sub_1001BA27C;
      v66[4] = sub_1001BA28C;
      id v67 = 0LL;
      v64[0] = 0LL;
      v64[1] = v64;
      v64[2] = 0x3032000000LL;
      v64[3] = sub_1001BA27C;
      v64[4] = sub_1001BA28C;
      id v65 = [v38 copy];
      v62[0] = 0LL;
      v62[1] = v62;
      v62[2] = 0x3032000000LL;
      v62[3] = sub_1001BA27C;
      v62[4] = sub_1001BA28C;
      id v63 = 0LL;
      v56[0] = _NSConcreteStackBlock;
      v56[1] = 3221225472LL;
      v56[2] = sub_1001BA9DC;
      v56[3] = &unk_10063C860;
      v56[4] = self;
      v25 = v22;
      v57 = v25;
      v58 = &buf;
      v59 = v66;
      v60 = v62;
      v61 = v64;
      [v33 addOperation:v56];
      v54[0] = 0LL;
      v54[1] = v54;
      v54[2] = 0x3032000000LL;
      v54[3] = sub_1001BA27C;
      v54[4] = sub_1001BA28C;
      id v55 = 0LL;
      v49[0] = _NSConcreteStackBlock;
      v49[1] = 3221225472LL;
      v49[2] = sub_1001BAD2C;
      v49[3] = &unk_10064A5F8;
      v51 = v54;
      v49[4] = self;
      v52 = v66;
      id v50 = v36;
      v53 = &buf;
      [v33 addOperation:v49];
      v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
      v39[0] = _NSConcreteStackBlock;
      v39[1] = 3221225472LL;
      v39[2] = sub_1001BAF64;
      v39[3] = &unk_10064A620;
      v45 = &buf;
      v46 = v54;
      id v40 = v23;
      v41 = self;
      v47 = v62;
      id v42 = v38;
      id v27 = v32;
      id v43 = v27;
      id v44 = v35;
      v48 = v64;
      id v28 = [v33 evaluateWithInput:v26 completion:v39];

      _Block_object_dispose(v54, 8);
      _Block_object_dispose(v62, 8);

      _Block_object_dispose(v64, 8);
      _Block_object_dispose(v66, 8);

      _Block_object_dispose(&buf, 8);
    }

    else
    {
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        v31 = (void *)objc_claimAutoreleasedReturnValue([v11 uniqueID]);
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = v31;
        _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "SharingManagementService: Pass %@ does not have a LTPK group identifier",  (uint8_t *)&buf,  0xCu);
      }

      v83[0] = NSLocalizedDescriptionKey;
      v83[1] = NSLocalizedFailureReasonErrorKey;
      v84[0] = @"Unable to decrypt share voucher";
      v84[1] = @"LTPK not found";
      v25 = (PDSharingManagementCreateShareRequest *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v84,  v83,  2LL));
      id v34 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  PKAddSecureElementPassErrorDomain,  0LL,  v25));
      (*((void (**)(id, void, void, id))v35 + 2))(v35, 0LL, 0LL, v34);
    }
  }

  else
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v29 = (void *)objc_claimAutoreleasedReturnValue([v11 uniqueID]);
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v29;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "SharingManagementService: Unable to find dpanIdentifier for %@",  (uint8_t *)&buf,  0xCu);
    }

    uint64_t v30 = PKDisplayableErrorForCommonType(-1LL, 0LL);
    v36 = (void *)objc_claimAutoreleasedReturnValue(v30);
    (*((void (**)(id, void, void, void *))v35 + 2))(v35, 0LL, 0LL, v36);
  }
}

- (void)updateShare:(id)a3 forPass:(id)a4 authorization:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v31 = a5;
  id v12 = a6;
  uint64_t Object = PKLogFacilityTypeGetObject(33LL);
  v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue([v11 uniqueID]);
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v15;
    _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "SharingManagementService: Updating share for %@",  (uint8_t *)&buf,  0xCu);
  }

  v16 = (void *)objc_claimAutoreleasedReturnValue([v11 devicePrimaryPaymentApplication]);
  v17 = (void *)objc_claimAutoreleasedReturnValue([v16 dpanIdentifier]);

  if (v17)
  {
    v18 = objc_alloc_init(&OBJC_CLASS___PDSharingManagementUpdateShareRequest);
    -[PDSharingManagementCreateShareRequest setDpanIdentifier:](v18, "setDpanIdentifier:", v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue([v10 sharedEntitlements]);
    -[PDSharingManagementCreateShareRequest setSharedEntitlements:](v18, "setSharedEntitlements:", v19);

    v20 = (void *)objc_claimAutoreleasedReturnValue([v10 identifier]);
    -[PDSharingManagementUpdateShareRequest setShareIdentifier:](v18, "setShareIdentifier:", v20);

    id v21 = (void *)objc_claimAutoreleasedReturnValue([v11 passTypeIdentifier]);
    -[PDSharingManagementRequest setRegionIdentifier:](v18, "setRegionIdentifier:", v21);

    id v22 = objc_alloc_init(&OBJC_CLASS___PKAsyncUnaryOperationComposer);
    *(void *)&__int128 buf = 0LL;
    *((void *)&buf + 1) = &buf;
    uint64_t v54 = 0x3032000000LL;
    id v55 = sub_1001BA27C;
    v56 = sub_1001BA28C;
    id v57 = 0LL;
    v51[0] = 0LL;
    v51[1] = v51;
    v51[2] = 0x2020000000LL;
    char v52 = 0;
    v47[0] = _NSConcreteStackBlock;
    v47[1] = 3221225472LL;
    v47[2] = sub_1001BB718;
    v47[3] = &unk_1006433B0;
    v47[4] = self;
    id v23 = v18;
    v48 = v23;
    id v24 = v11;
    id v49 = v24;
    p___int128 buf = &buf;
    [v22 addOperation:v47];
    v25 = (void *)objc_claimAutoreleasedReturnValue([v24 fidoProfile]);

    if (v25)
    {
      v42[0] = _NSConcreteStackBlock;
      v42[1] = 3221225472LL;
      v42[2] = sub_1001BB840;
      v42[3] = &unk_10063EE70;
      v42[4] = self;
      id v43 = v24;
      id v44 = v31;
      v45 = v23;
      v46 = &buf;
      [v22 addOperation:v42];
    }

    v38[0] = _NSConcreteStackBlock;
    v38[1] = 3221225472LL;
    v38[2] = sub_1001BB994;
    v38[3] = &unk_100639750;
    v38[4] = self;
    v26 = v23;
    v39 = v26;
    id v40 = &buf;
    v41 = v51;
    [v22 addOperation:v38];
    id v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472LL;
    v32[2] = sub_1001BBAF8;
    v32[3] = &unk_10064A698;
    id v33 = v24;
    v36 = &buf;
    v37 = v51;
    id v35 = v12;
    id v34 = v10;
    id v28 = [v22 evaluateWithInput:v27 completion:v32];

    _Block_object_dispose(v51, 8);
    _Block_object_dispose(&buf, 8);
  }

  else
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v29 = (void *)objc_claimAutoreleasedReturnValue([v11 uniqueID]);
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v29;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "SharingManagementService: Unable to find dpanIdentifier for %@",  (uint8_t *)&buf,  0xCu);
    }

    uint64_t v30 = PKDisplayableErrorForCommonType(-1LL, 0LL);
    v26 = (PDSharingManagementUpdateShareRequest *)objc_claimAutoreleasedReturnValue(v30);
    (*((void (**)(id, void, void, PDSharingManagementUpdateShareRequest *))v12 + 2))(v12, 0LL, 0LL, v26);
  }
}

- (void)revokeShares:(id)a3 forPass:(id)a4 shouldCascade:(BOOL)a5 completion:(id)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  v13 = (void *)objc_claimAutoreleasedReturnValue([v11 devicePrimaryPaymentApplication]);
  v14 = (void *)objc_claimAutoreleasedReturnValue([v13 dpanIdentifier]);

  if (v14)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "pk_indexDictionaryByApplyingBlock:", &stru_10064A6D8));
    v16 = objc_alloc_init(&OBJC_CLASS___PDSharingManagementBulkRevokeShareRequest);
    -[PDSharingManagementBulkRevokeShareRequest setDpanIdentifier:](v16, "setDpanIdentifier:", v14);
    v17 = (void *)objc_claimAutoreleasedReturnValue([v15 allKeys]);
    -[PDSharingManagementBulkRevokeShareRequest setShareIdentifiers:](v16, "setShareIdentifiers:", v17);

    -[PDSharingManagementBulkRevokeShareRequest setShouldCascade:](v16, "setShouldCascade:", v7);
    v18 = (void *)objc_claimAutoreleasedReturnValue([v11 passTypeIdentifier]);
    -[PDSharingManagementRequest setRegionIdentifier:](v16, "setRegionIdentifier:", v18);

    uint64_t v20 = objc_opt_class(&OBJC_CLASS___PDSharingManagementBulkRevokeShareResponse, v19);
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472LL;
    v26[2] = sub_1001BBEAC;
    v26[3] = &unk_10064A728;
    id v29 = v12;
    id v27 = v15;
    id v28 = v10;
    id v21 = v15;
    sub_1001BAC74((uint64_t)self, v16, v20, v26);
  }

  else
  {
    uint64_t Object = PKLogFacilityTypeGetObject(33LL);
    id v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      id v24 = (void *)objc_claimAutoreleasedReturnValue([v11 uniqueID]);
      *(_DWORD *)__int128 buf = 138412290;
      id v31 = v24;
      _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEFAULT,  "SharingManagementService: Unable to find dpanIdentifier for %@",  buf,  0xCu);
    }

    uint64_t v25 = PKDisplayableErrorForCommonType(-1LL, 0LL);
    v16 = (PDSharingManagementBulkRevokeShareRequest *)objc_claimAutoreleasedReturnValue(v25);
    (*((void (**)(id, void, void, PDSharingManagementBulkRevokeShareRequest *))v12 + 2))( v12,  0LL,  0LL,  v16);
  }
}

- (void)prewarmCreateShareForPass:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue([v6 devicePrimaryPaymentApplication]);
  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 dpanIdentifier]);

  if (v9)
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_1001BC278;
    v10[3] = &unk_10064A778;
    v10[4] = self;
    id v11 = v6;
    id v12 = v7;
    sub_1001BC62C((uint64_t)self, v11, v10);
  }

  else
  {
    (*((void (**)(id, void))v7 + 2))(v7, 0LL);
  }
}

- (void).cxx_destruct
{
}

@end
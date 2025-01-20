@interface MSDHomeCloudShareCreate
+ (id)cloudShareForHome:(id)a3;
+ (void)acceptInvitation:(id)a3 completion:(id)a4;
- (HMHome)home;
- (MSDHomeCloudShareCreate)initWithHome:(id)a3;
- (void)_handleMultiplePeopleOnShare:(id)a3 completion:(id)a4;
- (void)_saveRecordAndShare:(id)a3 completion:(id)a4;
- (void)setupShareForHomeParticipant:(id)a3 completion:(id)a4;
- (void)shareRecordWithOwner:(id)a3 completion:(id)a4;
@end

@implementation MSDHomeCloudShareCreate

+ (id)cloudShareForHome:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)a1) initWithHome:v4];

  return v5;
}

- (MSDHomeCloudShareCreate)initWithHome:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___MSDHomeCloudShareCreate;
  v6 = -[MSDHomeCloudShareCreate self](&v12, "self");
  v7 = (id *)objc_claimAutoreleasedReturnValue(v6);

  if (!v7) {
    goto LABEL_4;
  }
  if (v5)
  {
    objc_storeStrong(v7 + 1, a3);
LABEL_4:
    v8 = v7;
    goto LABEL_8;
  }

  id v9 = sub_10003E9DC();
  v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
    sub_10001CA18();
  }

  v8 = 0LL;
LABEL_8:

  return v8;
}

+ (void)acceptInvitation:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = sub_10003E9DC();
  v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v5 shareToken]);
    v10 = (void *)objc_claimAutoreleasedReturnValue([v5 shareURL]);
    v11 = (void *)objc_claimAutoreleasedReturnValue([v5 user]);
    objc_super v12 = (void *)objc_claimAutoreleasedReturnValue([v5 fromUser]);
    *(_DWORD *)buf = 138478595;
    v23 = v9;
    __int16 v24 = 2113;
    v25 = v10;
    __int16 v26 = 2113;
    v27 = v11;
    __int16 v28 = 2113;
    v29 = v12;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Invitation details shareToken %{private}@, shareURL %{private}@, ToUSer %{private}@, fromUSer %{private}@",  buf,  0x2Au);
  }

  v13 = (void *)objc_claimAutoreleasedReturnValue([v5 containerID]);
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[CKContainer containerWithIdentifier:](&OBJC_CLASS___CKContainer, "containerWithIdentifier:", v13));

  v15 = (void *)objc_claimAutoreleasedReturnValue([v5 shareURL]);
  v16 = (void *)objc_claimAutoreleasedReturnValue([v5 shareToken]);
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_10001B9E4;
  v19[3] = &unk_100061858;
  id v20 = v14;
  id v21 = v6;
  id v17 = v6;
  id v18 = v14;
  [v18 fetchShareMetadataForShareURL:v15 withShareToken:v16 completion:v19];
}

- (void)setupShareForHomeParticipant:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = sub_10003E9DC();
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue([v6 recordID]);
    home = self->_home;
    *(_DWORD *)buf = 136315651;
    v42 = "-[MSDHomeCloudShareCreate setupShareForHomeParticipant:completion:]";
    __int16 v43 = 2113;
    v44 = v10;
    __int16 v45 = 2113;
    v46 = home;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "%s for recordID %{private}@ and home %{private}@",  buf,  0x20u);
  }

  if (v7)
  {
    objc_super v12 = (void *)objc_claimAutoreleasedReturnValue([v6 recordType]);
    if ([v12 isEqualToString:MSServiceAccountRecordType])
    {

LABEL_9:
      __int16 v24 = objc_alloc(&OBJC_CLASS___CKShare);
      v25 = (void *)objc_claimAutoreleasedReturnValue([v6 recordID]);
      __int16 v26 = (void *)objc_claimAutoreleasedReturnValue([v25 zoneID]);
      v27 = -[CKShare initWithRecordZoneID:](v24, "initWithRecordZoneID:", v26);

      id v28 = sub_10003E9DC();
      v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        v30 = (char *)objc_claimAutoreleasedReturnValue(-[CKShare recordID](v27, "recordID"));
        *(_DWORD *)buf = 138477827;
        v42 = v30;
        _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_DEFAULT,  "Created CKShare with recordID %{private}@",  buf,  0xCu);
      }

      v31 = (void *)objc_claimAutoreleasedReturnValue(+[CKContainer MSDCloudKitContainer](&OBJC_CLASS___CKContainer, "MSDCloudKitContainer"));
      v14 = (void *)objc_claimAutoreleasedReturnValue([v31 privateCloudDatabase]);

      v32 = objc_alloc_init(&OBJC_CLASS___MSDFetchCKDataOptions);
      -[MSDFetchCKDataOptions setUserInitiatedRequest:](v32, "setUserInitiatedRequest:", 0LL);
      v33 = (void *)objc_claimAutoreleasedReturnValue(-[CKShare recordID](v27, "recordID"));
      v37[0] = _NSConcreteStackBlock;
      v37[1] = 3221225472LL;
      v37[2] = sub_10001BF68;
      v37[3] = &unk_100061880;
      v38 = v27;
      v39 = self;
      id v40 = v7;
      v34 = v27;
      [v14 fetchRecordWithID:v33 withOptions:v32 completion:v37];

      goto LABEL_15;
    }

    v22 = (void *)objc_claimAutoreleasedReturnValue([v6 recordType]);
    unsigned __int8 v23 = [v22 isEqualToString:MSDefaultServiceRecordType];

    if ((v23 & 1) != 0) {
      goto LABEL_9;
    }
    id v35 = sub_10003E9DC();
    v36 = (os_log_s *)objc_claimAutoreleasedReturnValue(v35);
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
      sub_10001CB74();
    }

    v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  MSErrorDomain,  1LL,  0LL));
    (*((void (**)(id, void, void *))v7 + 2))(v7, 0LL, v14);
  }

  else
  {
    id v13 = sub_10003E9DC();
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled((os_log_t)v14, OS_LOG_TYPE_ERROR)) {
      sub_10001CB04((os_log_s *)v14, v15, v16, v17, v18, v19, v20, v21);
    }
  }

- (void)shareRecordWithOwner:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    id v8 = sub_10003E9DC();
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    v10 = v9;
    if (v6)
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        home = self->_home;
        *(_DWORD *)buf = 136315651;
        __int16 v26 = "-[MSDHomeCloudShareCreate shareRecordWithOwner:completion:]";
        __int16 v27 = 2113;
        id v28 = v6;
        __int16 v29 = 2113;
        v30 = home;
        _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "%s for record %{private}@ home %{private}@",  buf,  0x20u);
      }

      objc_super v12 = self->_home;
      id v13 = (void *)objc_claimAutoreleasedReturnValue(+[CKContainer MSDCloudKitContainer](&OBJC_CLASS___CKContainer, "MSDCloudKitContainer"));
      v23[0] = _NSConcreteStackBlock;
      v23[1] = 3221225472LL;
      v23[2] = sub_10001C3B4;
      v23[3] = &unk_1000618A8;
      __int16 v24 = (os_log_s *)v7;
      -[HMHome establishShareWithHomeOwner:container:allowWriteAccess:completionHandler:]( v12,  "establishShareWithHomeOwner:container:allowWriteAccess:completionHandler:",  v6,  v13,  1LL,  v23);

      v14 = v24;
    }

    else
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        sub_10001CD1C();
      }

      v14 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  CKErrorDomain,  12LL,  0LL));
      (*((void (**)(id, void, os_log_s *))v7 + 2))(v7, 0LL, v14);
    }
  }

  else
  {
    id v15 = sub_10003E9DC();
    v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_10001CCAC(v14, v16, v17, v18, v19, v20, v21, v22);
    }
  }
}

- (void)_handleMultiplePeopleOnShare:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 participants]);
    id v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "na_firstObjectPassingTest:", &stru_1000618E8));

    if (v9)
    {
      id v10 = [v9 permission];
      id v11 = [v9 acceptanceStatus];
      id v12 = sub_10003E9DC();
      id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v14 = CKStringFromParticipantAcceptanceStatus(v11);
        id v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
        uint64_t v16 = CKStringFromParticipantPermission(v10);
        uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
        int v24 = 138412546;
        v25 = v15;
        __int16 v26 = 2112;
        __int16 v27 = v17;
        _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Current Participant status: Acceptance: %@ Permission: %@",  (uint8_t *)&v24,  0x16u);
      }

      if (v11 == (id)2 && v10 == (id)3)
      {
        id v18 = sub_10003E9DC();
        uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v24) = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "All Participants in share have accepted with permission read/write",  (uint8_t *)&v24,  2u);
        }

        if (v7) {
          (*((void (**)(id, void, void))v7 + 2))(v7, 0LL, 0LL);
        }
        goto LABEL_21;
      }

      if (v10 == (id)2)
      {
        [v9 setPermission:3];
        [v6 addParticipant:v9];
        -[MSDHomeCloudShareCreate _saveRecordAndShare:completion:](self, "_saveRecordAndShare:completion:", v6, v7);
        goto LABEL_21;
      }

      if (v10 != (id)3 || v11 == (id)2) {
        goto LABEL_21;
      }
    }

    else
    {
      id v22 = sub_10003E9DC();
      unsigned __int8 v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
        sub_10001CDD4();
      }
    }

    -[MSDHomeCloudShareCreate shareRecordWithOwner:completion:](self, "shareRecordWithOwner:completion:", v6, v7);
LABEL_21:

    goto LABEL_22;
  }

  id v20 = sub_10003E9DC();
  uint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
    sub_10001CDA8();
  }

  if (v7)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  MSErrorDomain,  1LL,  0LL));
    (*((void (**)(id, void, void *))v7 + 2))(v7, 0LL, v9);
    goto LABEL_21;
  }

- (void)_saveRecordAndShare:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[CKContainer MSDCloudKitContainer](&OBJC_CLASS___CKContainer, "MSDCloudKitContainer"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 privateCloudDatabase]);

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_10001C854;
  v11[3] = &unk_100061458;
  v11[4] = self;
  id v12 = v6;
  id v10 = v6;
  [v9 saveRecord:v7 withOptions:0 completion:v11];
}

- (HMHome)home
{
  return self->_home;
}

- (void).cxx_destruct
{
}

@end
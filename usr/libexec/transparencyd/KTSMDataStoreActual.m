@interface KTSMDataStoreActual
- (BOOL)clearDataStore:(id *)a3;
- (BOOL)clearDeviceSignatures:(id *)a3;
- (BOOL)haveDoneFixup:(id)a3;
- (BOOL)storeIDMSDeviceList:(id)a3 error:(id *)a4;
- (BOOL)storeQueryRequest:(id)a3 queryResponse:(id)a4 serverHint:(id)a5 uri:(id)a6 application:(id)a7 error:(id *)a8;
- (BOOL)storeSelfVerificationInfo:(id)a3 application:(id)a4 error:(id *)a5;
- (KTSMDataStoreActual)initWithPersistentContainer:(id)a3;
- (NSPersistentContainer)container;
- (id)errorFromData:(id)a3;
- (id)errorFromJson:(id)a3;
- (id)getSettingsData:(id)a3;
- (id)getSettingsDate:(id)a3;
- (id)getSettingsNumber:(id)a3;
- (id)jsonifyError:(id)a3;
- (id)managedObjectContextWithMergePolicy;
- (id)pushTokenForService:(id)a3;
- (void)_onQueueClearDeviceSignatureSignatures;
- (void)delete:(id)a3 onMOC:(id)a4;
- (void)deleteFixup:(id)a3;
- (void)deleteSelfVerificationInfoForApplication:(id)a3 error:(id *)a4;
- (void)fetchDeviceSignature:(id)a3 complete:(id)a4;
- (void)fetchIDMSDeviceList:(id)a3;
- (void)fetchKTInfoForApplication:(id)a3 uri:(id)a4 complete:(id)a5;
- (void)fetchSelfVerificationInfoForApplication:(id)a3 complete:(id)a4;
- (void)setContainer:(id)a3;
- (void)setSettingsData:(id)a3 data:(id)a4;
- (void)setSettingsDate:(id)a3 date:(id)a4;
- (void)setSettingsNumber:(id)a3 number:(id)a4;
- (void)storeDeviceSignature:(id)a3 complete:(id)a4;
- (void)storeFixup:(id)a3;
- (void)uploadedDeviceSignature:(id)a3 tbs:(id)a4 uploadedAt:(id)a5 complete:(id)a6;
@end

@implementation KTSMDataStoreActual

- (KTSMDataStoreActual)initWithPersistentContainer:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___KTSMDataStoreActual;
  v5 = -[KTSMDataStoreActual init](&v9, "init");
  v6 = v5;
  if (v5)
  {
    -[KTSMDataStoreActual setContainer:](v5, "setContainer:", v4);
    v7 = v6;
  }

  return v6;
}

- (id)managedObjectContextWithMergePolicy
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMDataStoreActual container](self, "container"));
  id v3 = [v2 newBackgroundContext];

  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSMergePolicy mergeByPropertyStoreTrumpMergePolicy]( &OBJC_CLASS___NSMergePolicy,  "mergeByPropertyStoreTrumpMergePolicy"));
  [v3 setMergePolicy:v4];

  return v3;
}

- (void)fetchSelfVerificationInfoForApplication:(id)a3 complete:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(id, void *, uint64_t, uint64_t))a4;
  if (qword_1002EEA18 != -1) {
    dispatch_once(&qword_1002EEA18, &stru_100284728);
  }
  v8 = (os_log_s *)qword_1002EEA20;
  if (os_log_type_enabled((os_log_t)qword_1002EEA20, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_INFO,  "fetchSelfVerificationInfoForApplication:application:",  buf,  2u);
  }

  objc_super v9 = (void *)objc_claimAutoreleasedReturnValue(+[CachedData fetchRequest](&OBJC_CLASS___CachedData, "fetchRequest"));
  v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"key = %@ AND application = %@ AND unique = %@",  @"SelfVerificationInfo",  v6,  &stru_10028E390));
  [v9 setPredicate:v10];

  *(void *)buf = 0LL;
  v40 = buf;
  uint64_t v41 = 0x3032000000LL;
  v42 = sub_10015647C;
  v43 = sub_10015648C;
  id v44 = 0LL;
  uint64_t v33 = 0LL;
  v34 = &v33;
  uint64_t v35 = 0x3032000000LL;
  v36 = sub_10015647C;
  v37 = sub_10015648C;
  id v38 = 0LL;
  uint64_t v27 = 0LL;
  v28 = &v27;
  uint64_t v29 = 0x3032000000LL;
  v30 = sub_10015647C;
  v31 = sub_10015648C;
  id v32 = 0LL;
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472LL;
  v21[2] = sub_100156494;
  v21[3] = &unk_100284750;
  id v11 = (id)objc_claimAutoreleasedReturnValue( -[KTSMDataStoreActual managedObjectContextWithMergePolicy]( self,  "managedObjectContextWithMergePolicy"));
  id v22 = v11;
  id v12 = v9;
  id v23 = v12;
  v24 = &v27;
  v25 = buf;
  v26 = &v33;
  [v11 performBlockAndWait:v21];
  if (*((void *)v40 + 5))
  {
    uint64_t v14 = objc_opt_class(&OBJC_CLASS___KTSelfVerificationInfo, v13);
    uint64_t v15 = *((void *)v40 + 5);
    v16 = (id *)(v28 + 5);
    id obj = (id)v28[5];
    v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedUnarchiver unarchivedObjectOfClass:fromData:error:]( &OBJC_CLASS___NSKeyedUnarchiver,  "unarchivedObjectOfClass:fromData:error:",  v14,  v15,  &obj));
    objc_storeStrong(v16, obj);
    v7[2](v7, v17, v34[5], v28[5]);
  }

  else
  {
    if (qword_1002EEA18 != -1) {
      dispatch_once(&qword_1002EEA18, &stru_100284770);
    }
    v18 = (os_log_s *)qword_1002EEA20;
    if (os_log_type_enabled((os_log_t)qword_1002EEA20, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v20 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_INFO,  "fetchSelfVerificationInfoForApplication: no data",  v20,  2u);
    }

    v7[2](v7, 0LL, 0LL, v28[5]);
  }

  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(&v33, 8);

  _Block_object_dispose(buf, 8);
}

- (BOOL)storeSelfVerificationInfo:(id)a3 application:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  if (qword_1002EEA18 != -1) {
    dispatch_once(&qword_1002EEA18, &stru_100284790);
  }
  v10 = (void *)qword_1002EEA20;
  if (os_log_type_enabled((os_log_t)qword_1002EEA20, OS_LOG_TYPE_INFO))
  {
    id v11 = v10;
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v8 syncedLoggableDatas]);
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v12;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_INFO,  "storeSelfVerificationInfo: syncedLoggableDatas %@",  (uint8_t *)&buf,  0xCu);
  }

  if (qword_1002EEA18 != -1) {
    dispatch_once(&qword_1002EEA18, &stru_1002847B0);
  }
  uint64_t v13 = (void *)qword_1002EEA20;
  if (os_log_type_enabled((os_log_t)qword_1002EEA20, OS_LOG_TYPE_INFO))
  {
    uint64_t v14 = v13;
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v8 uriToServerLoggableDatas]);
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v15;
    _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_INFO,  "storeSelfVerificationInfo: uriToServerLoggableDatas: %@",  (uint8_t *)&buf,  0xCu);
  }

  if (qword_1002EEA18 != -1) {
    dispatch_once(&qword_1002EEA18, &stru_1002847D0);
  }
  v16 = (void *)qword_1002EEA20;
  if (os_log_type_enabled((os_log_t)qword_1002EEA20, OS_LOG_TYPE_INFO))
  {
    v17 = v16;
    v18 = (void *)objc_claimAutoreleasedReturnValue([v8 selfDeviceID]);
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v18;
    _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_INFO,  "storeSelfVerificationInfo: selfDeviceID: %@",  (uint8_t *)&buf,  0xCu);
  }

  v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  v8,  1LL,  a5));
  if (v19)
  {
    uint64_t v35 = 0LL;
    v36 = &v35;
    uint64_t v37 = 0x2020000000LL;
    char v38 = 0;
    *(void *)&__int128 buf = 0LL;
    *((void *)&buf + 1) = &buf;
    uint64_t v42 = 0x3032000000LL;
    v43 = sub_10015647C;
    id v44 = sub_10015648C;
    id v45 = 0LL;
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMDataStoreActual container](self, "container"));
    id v21 = [v20 newBackgroundContext];

    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472LL;
    v29[2] = sub_100156B70;
    v29[3] = &unk_100278F60;
    id v30 = v9;
    id v22 = v21;
    id v31 = v22;
    p___int128 buf = &buf;
    id v32 = v19;
    v34 = &v35;
    [v22 performBlockAndWait:v29];
    int v23 = *((unsigned __int8 *)v36 + 24);
    if (a5 && !*((_BYTE *)v36 + 24))
    {
      if (qword_1002EEA18 != -1) {
        dispatch_once(&qword_1002EEA18, &stru_100284870);
      }
      v24 = (os_log_s *)qword_1002EEA20;
      if (os_log_type_enabled((os_log_t)qword_1002EEA20, OS_LOG_TYPE_ERROR))
      {
        uint64_t v25 = *(void *)(*((void *)&buf + 1) + 40LL);
        *(_DWORD *)v39 = 138412290;
        uint64_t v40 = v25;
        _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_ERROR,  "storeSelfVerificationInfo: error %@",  v39,  0xCu);
      }

      *a5 = *(id *)(*((void *)&buf + 1) + 40LL);
      int v23 = *((unsigned __int8 *)v36 + 24);
    }

    BOOL v26 = v23 != 0;

    _Block_object_dispose(&buf, 8);
    _Block_object_dispose(&v35, 8);
  }

  else
  {
    if (qword_1002EEA18 != -1) {
      dispatch_once(&qword_1002EEA18, &stru_1002847F0);
    }
    uint64_t v27 = (os_log_s *)qword_1002EEA20;
    if (os_log_type_enabled((os_log_t)qword_1002EEA20, OS_LOG_TYPE_ERROR))
    {
      LOWORD(buf) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_ERROR,  "storeSelfVerificationInfo: archivedDataWithRootObject",  (uint8_t *)&buf,  2u);
    }

    BOOL v26 = 0;
  }

  return v26;
}

- (void)deleteSelfVerificationInfoForApplication:(id)a3 error:(id *)a4
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_100157004;
  v8[3] = &unk_1002794B0;
  id v9 = a3;
  id v10 = (id)objc_claimAutoreleasedReturnValue(-[KTSMDataStoreActual managedObjectContextWithMergePolicy](self, "managedObjectContextWithMergePolicy"));
  id v11 = a4;
  id v6 = v10;
  id v7 = v9;
  [v6 performBlockAndWait:v8];
}

- (void)fetchIDMSDeviceList:(id)a3
{
  id v4 = (void (**)(id, void *, void, uint64_t))a3;
  if (qword_1002EEA18 != -1) {
    dispatch_once(&qword_1002EEA18, &stru_100284890);
  }
  v5 = (os_log_s *)qword_1002EEA20;
  if (os_log_type_enabled((os_log_t)qword_1002EEA20, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)__int128 buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "fetchIDMSDeviceList", buf, 2u);
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[CachedData fetchRequest](&OBJC_CLASS___CachedData, "fetchRequest"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"key = %@ AND application = %@ AND unique = %@",  @"IDMSDeviceList",  @"global",  &stru_10028E390));
  [v6 setPredicate:v7];

  *(void *)__int128 buf = 0LL;
  uint64_t v40 = buf;
  uint64_t v41 = 0x3032000000LL;
  uint64_t v42 = sub_10015647C;
  v43 = sub_10015648C;
  id v44 = 0LL;
  uint64_t v33 = 0LL;
  v34 = &v33;
  uint64_t v35 = 0x3032000000LL;
  v36 = sub_10015647C;
  uint64_t v37 = sub_10015648C;
  id v38 = 0LL;
  uint64_t v27 = 0LL;
  v28 = &v27;
  uint64_t v29 = 0x3032000000LL;
  id v30 = sub_10015647C;
  id v31 = sub_10015648C;
  id v32 = 0LL;
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472LL;
  v21[2] = sub_1001575A4;
  v21[3] = &unk_100284750;
  id v8 = (id)objc_claimAutoreleasedReturnValue( -[KTSMDataStoreActual managedObjectContextWithMergePolicy]( self,  "managedObjectContextWithMergePolicy"));
  id v22 = v8;
  id v9 = v6;
  id v23 = v9;
  v24 = &v27;
  uint64_t v25 = buf;
  BOOL v26 = &v33;
  [v8 performBlockAndWait:v21];
  if (*((void *)v40 + 5))
  {
    v47[0] = objc_opt_class(&OBJC_CLASS___KTIDMSDevice, v10);
    v47[1] = objc_opt_class(&OBJC_CLASS___NSArray, v11);
    id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v47, 2LL));
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v12));
    uint64_t v14 = *((void *)v40 + 5);
    uint64_t v15 = (id *)(v28 + 5);
    id obj = (id)v28[5];
    v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedUnarchiver unarchivedObjectOfClasses:fromData:error:]( &OBJC_CLASS___NSKeyedUnarchiver,  "unarchivedObjectOfClasses:fromData:error:",  v13,  v14,  &obj));
    objc_storeStrong(v15, obj);

    if (v28[5])
    {
      if (qword_1002EEA18 != -1) {
        dispatch_once(&qword_1002EEA18, &stru_1002848D0);
      }
      v17 = (os_log_s *)qword_1002EEA20;
      if (os_log_type_enabled((os_log_t)qword_1002EEA20, OS_LOG_TYPE_ERROR))
      {
        uint64_t v18 = v28[5];
        *(_DWORD *)id v45 = 138412290;
        uint64_t v46 = v18;
        _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_ERROR,  "fetchIDMSDeviceList: unarchivedObjectOfClasses %@",  v45,  0xCu);
      }

      uint64_t v19 = v28[5];
    }

    else
    {
      uint64_t v19 = 0LL;
    }

    v4[2](v4, v16, v34[5], v19);
  }

  else
  {
    v4[2](v4, 0LL, 0LL, v28[5]);
  }

  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(&v33, 8);

  _Block_object_dispose(buf, 8);
}

- (BOOL)storeIDMSDeviceList:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (qword_1002EEA18 != -1) {
    dispatch_once(&qword_1002EEA18, &stru_1002848F0);
  }
  id v7 = (os_log_s *)qword_1002EEA20;
  if (os_log_type_enabled((os_log_t)qword_1002EEA20, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "storeIDMSDeviceList: %@", (uint8_t *)&buf, 0xCu);
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  v6,  1LL,  a4));
  if (v8)
  {
    uint64_t v21 = 0LL;
    id v22 = &v21;
    uint64_t v23 = 0x2020000000LL;
    char v24 = 0;
    *(void *)&__int128 buf = 0LL;
    *((void *)&buf + 1) = &buf;
    uint64_t v28 = 0x3032000000LL;
    uint64_t v29 = sub_10015647C;
    id v30 = sub_10015648C;
    id v31 = 0LL;
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472LL;
    v16[2] = sub_100157B98;
    v16[3] = &unk_100284998;
    id v9 = (id)objc_claimAutoreleasedReturnValue( -[KTSMDataStoreActual managedObjectContextWithMergePolicy]( self,  "managedObjectContextWithMergePolicy"));
    id v17 = v9;
    p___int128 buf = &buf;
    id v18 = v8;
    v20 = &v21;
    [v9 performBlockAndWait:v16];
    int v10 = *((unsigned __int8 *)v22 + 24);
    if (a4 && !*((_BYTE *)v22 + 24))
    {
      if (qword_1002EEA18 != -1) {
        dispatch_once(&qword_1002EEA18, &stru_1002849B8);
      }
      uint64_t v11 = (os_log_s *)qword_1002EEA20;
      if (os_log_type_enabled((os_log_t)qword_1002EEA20, OS_LOG_TYPE_ERROR))
      {
        uint64_t v12 = *(void *)(*((void *)&buf + 1) + 40LL);
        *(_DWORD *)uint64_t v25 = 138412290;
        uint64_t v26 = v12;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "storeIDMSDeviceList: error %@", v25, 0xCu);
      }

      *a4 = *(id *)(*((void *)&buf + 1) + 40LL);
      int v10 = *((unsigned __int8 *)v22 + 24);
    }

    BOOL v13 = v10 != 0;

    _Block_object_dispose(&buf, 8);
    _Block_object_dispose(&v21, 8);
  }

  else
  {
    if (qword_1002EEA18 != -1) {
      dispatch_once(&qword_1002EEA18, &stru_100284910);
    }
    uint64_t v14 = (os_log_s *)qword_1002EEA20;
    if (os_log_type_enabled((os_log_t)qword_1002EEA20, OS_LOG_TYPE_ERROR))
    {
      LOWORD(buf) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_ERROR,  "storeIDMSDeviceList: archivedDataWithRootObject",  (uint8_t *)&buf,  2u);
    }

    BOOL v13 = 0;
  }

  return v13;
}

- (void)fetchKTInfoForApplication:(id)a3 uri:(id)a4 complete:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (qword_1002EEA18 != -1) {
    dispatch_once(&qword_1002EEA18, &stru_1002849D8);
  }
  uint64_t v11 = (os_log_s *)qword_1002EEA20;
  if (os_log_type_enabled((os_log_t)qword_1002EEA20, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)__int128 buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "fetchKTInfoForApplication:uri:", buf, 2u);
  }

  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[CachedData fetchRequest](&OBJC_CLASS___CachedData, "fetchRequest"));
  BOOL v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"key = %@ AND application = %@ AND unique = %@",  @"QueryResponse",  v8,  v9));
  [v12 setPredicate:v13];

  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_100158154;
  v17[3] = &unk_100279880;
  id v18 = (id)objc_claimAutoreleasedReturnValue(-[KTSMDataStoreActual managedObjectContextWithMergePolicy](self, "managedObjectContextWithMergePolicy"));
  id v19 = v12;
  id v20 = v10;
  id v14 = v10;
  id v15 = v12;
  id v16 = v18;
  [v16 performBlockAndWait:v17];
}

- (BOOL)storeQueryRequest:(id)a3 queryResponse:(id)a4 serverHint:(id)a5 uri:(id)a6 application:(id)a7 error:(id *)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v30 = a7;
  if (qword_1002EEA18 != -1) {
    dispatch_once(&qword_1002EEA18, &stru_100284A38);
  }
  id v18 = (os_log_s *)qword_1002EEA20;
  if (os_log_type_enabled((os_log_t)qword_1002EEA20, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v17;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "storeQueryResponse %@", (uint8_t *)&buf, 0xCu);
  }

  id v19 = objc_alloc_init(&OBJC_CLASS___KTQueryInfo);
  -[KTQueryInfo setQueryRequest:](v19, "setQueryRequest:", v14);
  -[KTQueryInfo setQueryResponse:](v19, "setQueryResponse:", v15);
  -[KTQueryInfo setServerHint:](v19, "setServerHint:", v16);
  id v20 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyGPBMessage data](v19, "data"));
  uint64_t v39 = 0LL;
  uint64_t v40 = &v39;
  uint64_t v41 = 0x2020000000LL;
  char v42 = 0;
  *(void *)&__int128 buf = 0LL;
  *((void *)&buf + 1) = &buf;
  uint64_t v46 = 0x3032000000LL;
  v47 = sub_10015647C;
  v48 = sub_10015648C;
  id v49 = 0LL;
  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue( -[KTSMDataStoreActual managedObjectContextWithMergePolicy]( self,  "managedObjectContextWithMergePolicy"));
  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472LL;
  v32[2] = sub_100158824;
  v32[3] = &unk_100284AC0;
  id v31 = v30;
  id v33 = v31;
  id v29 = v17;
  id v34 = v29;
  id v22 = v21;
  id v35 = v22;
  p___int128 buf = &buf;
  id v23 = v20;
  id v36 = v23;
  id v38 = &v39;
  [v22 performBlockAndWait:v32];
  int v24 = *((unsigned __int8 *)v40 + 24);
  if (a8 && !*((_BYTE *)v40 + 24))
  {
    if (qword_1002EEA18 != -1) {
      dispatch_once(&qword_1002EEA18, &stru_100284AE0);
    }
    uint64_t v25 = (os_log_s *)qword_1002EEA20;
    if (os_log_type_enabled((os_log_t)qword_1002EEA20, OS_LOG_TYPE_ERROR))
    {
      uint64_t v26 = *(void *)(*((void *)&buf + 1) + 40LL);
      *(_DWORD *)v43 = 138412290;
      uint64_t v44 = v26;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "storeQueryResponse: error %@", v43, 0xCu);
    }

    *a8 = *(id *)(*((void *)&buf + 1) + 40LL);
    int v24 = *((unsigned __int8 *)v40 + 24);
  }

  BOOL v27 = v24 != 0;

  _Block_object_dispose(&buf, 8);
  _Block_object_dispose(&v39, 8);

  return v27;
}

- (id)jsonifyError:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    v19[0] = @"code";
    id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [v4 code]));
    v19[1] = @"domain";
    v20[0] = v6;
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 domain]);
    v20[1] = v7;
    id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v20,  v19,  2LL));
    id v9 = [v8 mutableCopy];

    id v10 = (void *)objc_claimAutoreleasedReturnValue([v5 userInfo]);
    id v11 = [v10 count];

    if (v11)
    {
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
      BOOL v13 = (void *)objc_claimAutoreleasedReturnValue([v5 userInfo]);
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472LL;
      v16[2] = sub_100158DAC;
      v16[3] = &unk_100284B08;
      id v17 = v12;
      id v18 = self;
      id v14 = v12;
      [v13 enumerateKeysAndObjectsUsingBlock:v16];

      [v9 setObject:v14 forKeyedSubscript:@"userinfo"];
    }
  }

  else
  {
    id v9 = 0LL;
  }

  return v9;
}

- (id)errorFromData:(id)a3
{
  if (a3)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSJSONSerialization JSONObjectWithData:options:error:]( &OBJC_CLASS___NSJSONSerialization,  "JSONObjectWithData:options:error:",  a3,  0LL,  0LL));
    uint64_t v6 = objc_opt_class(&OBJC_CLASS___NSDictionary, v5);
    id v7 = 0LL;
    if ((objc_opt_isKindOfClass(v4, v6) & 1) != 0) {
      id v7 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMDataStoreActual errorFromJson:](self, "errorFromJson:", v4));
    }
  }

  else
  {
    id v7 = 0LL;
  }

  return v7;
}

- (id)errorFromJson:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"code"]);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"domain"]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"userinfo"]);

  uint64_t v9 = objc_opt_class(&OBJC_CLASS___NSNumber, v8);
  if ((objc_opt_isKindOfClass(v5, v9) & 1) != 0
    || (uint64_t v11 = objc_opt_class(&OBJC_CLASS___NSString, v10), (objc_opt_isKindOfClass(v6, v11) & 1) != 0))
  {
    uint64_t v12 = objc_opt_class(&OBJC_CLASS___NSDictionary, v10);
    if ((objc_opt_isKindOfClass(v7, v12) & 1) != 0 && [v7 count])
    {
      id v16 = _NSConcreteStackBlock;
      uint64_t v17 = 3221225472LL;
      id v18 = sub_100159090;
      id v19 = &unk_100284B30;
      id v13 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
      id v20 = v13;
      uint64_t v21 = self;
      [v7 enumerateKeysAndObjectsUsingBlock:&v16];
    }

    else
    {
      id v13 = 0LL;
    }

    id v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( NSError,  "errorWithDomain:code:userInfo:",  v6,  objc_msgSend(v5, "longValue", v16, v17, v18, v19),  v13));
  }

  else
  {
    id v14 = 0LL;
  }

  return v14;
}

- (id)pushTokenForService:(id)a3
{
  id v4 = a3;
  uint64_t v16 = 0LL;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x3032000000LL;
  id v19 = sub_10015647C;
  id v20 = sub_10015648C;
  id v21 = 0LL;
  id v22 = v4;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v22, 1LL));
  uint64_t v10 = _NSConcreteStackBlock;
  uint64_t v11 = 3221225472LL;
  uint64_t v12 = sub_1001592B0;
  id v13 = &unk_100284B58;
  id v15 = &v16;
  id v6 = v4;
  id v14 = v6;
  -[KTSMDataStoreActual fetchDeviceSignature:complete:](self, "fetchDeviceSignature:complete:", v5, &v10);

  id v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v17[5], "objectForKeyedSubscript:", v6, v10, v11, v12, v13));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 pushToken]);

  _Block_object_dispose(&v16, 8);
  return v8;
}

- (void)fetchDeviceSignature:(id)a3 complete:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, uint64_t, uint64_t))a4;
  uint64_t v21 = 0LL;
  id v22 = &v21;
  uint64_t v23 = 0x3032000000LL;
  int v24 = sub_10015647C;
  uint64_t v25 = sub_10015648C;
  id v26 = 0LL;
  uint64_t v15 = 0LL;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x3032000000LL;
  uint64_t v18 = sub_10015647C;
  id v19 = sub_10015648C;
  id v20 = 0LL;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMDataStoreActual managedObjectContextWithMergePolicy](self, "managedObjectContextWithMergePolicy"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_10015945C;
  v10[3] = &unk_10027B090;
  id v9 = v6;
  id v13 = &v15;
  id v14 = &v21;
  id v11 = v9;
  uint64_t v12 = self;
  [v8 performBlockAndWait:v10];
  v7[2](v7, v22[5], v16[5]);

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v21, 8);
}

- (void)storeDeviceSignature:(id)a3 complete:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void *))a4;
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  id v8 = v6;
  id v9 = [v8 countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v29;
    while (2)
    {
      id v11 = 0LL;
      do
      {
        if (*(void *)v29 != v10) {
          objc_enumerationMutation(v8);
        }
        uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v28 + 1) + 8 * (void)v11) tbsKTIDSRegistrationData]);
        BOOL v13 = v12 == 0LL;

        if (v13)
        {
          uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue( +[TransparencyError errorWithDomain:code:underlyingError:description:]( &OBJC_CLASS___TransparencyError,  "errorWithDomain:code:underlyingError:description:",  kTransparencyErrorDecode,  -324LL,  0LL,  @"missing tbs data"));
          v7[2](v7, v16);

          id v15 = v8;
          goto LABEL_11;
        }

        id v11 = (char *)v11 + 1;
      }

      while (v9 != v11);
      id v9 = [v8 countByEnumeratingWithState:&v28 objects:v32 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }

  id v14 = (void *)objc_claimAutoreleasedReturnValue( -[KTSMDataStoreActual managedObjectContextWithMergePolicy]( self,  "managedObjectContextWithMergePolicy"));
  uint64_t v22 = 0LL;
  uint64_t v23 = &v22;
  uint64_t v24 = 0x3032000000LL;
  uint64_t v25 = sub_10015647C;
  id v26 = sub_10015648C;
  id v27 = 0LL;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_100159A6C;
  v17[3] = &unk_100284B80;
  id v18 = v8;
  id v15 = v14;
  id v19 = v15;
  id v20 = self;
  uint64_t v21 = &v22;
  [v15 performBlockAndWait:v17];
  v7[2](v7, (void *)v23[5]);

  _Block_object_dispose(&v22, 8);
LABEL_11:
}

- (void)uploadedDeviceSignature:(id)a3 tbs:(id)a4 uploadedAt:(id)a5 complete:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  BOOL v13 = (void (**)(id, void))a6;
  id v14 = (void *)objc_claimAutoreleasedReturnValue( -[KTSMDataStoreActual managedObjectContextWithMergePolicy]( self,  "managedObjectContextWithMergePolicy"));
  uint64_t v25 = 0LL;
  id v26 = &v25;
  uint64_t v27 = 0x3032000000LL;
  __int128 v28 = sub_10015647C;
  __int128 v29 = sub_10015648C;
  id v30 = 0LL;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  void v19[2] = sub_100159FCC;
  v19[3] = &unk_100284BC8;
  id v15 = v10;
  id v20 = v15;
  id v16 = v11;
  id v21 = v16;
  uint64_t v24 = &v25;
  id v17 = v12;
  id v22 = v17;
  id v18 = v14;
  id v23 = v18;
  [v18 performBlockAndWait:v19];
  v13[2](v13, v26[5]);

  _Block_object_dispose(&v25, 8);
}

- (void)delete:(id)a3 onMOC:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = -[NSBatchDeleteRequest initWithFetchRequest:]( objc_alloc(&OBJC_CLASS___NSBatchDeleteRequest),  "initWithFetchRequest:",  v6);

  -[NSBatchDeleteRequest setResultType:](v7, "setResultType:", 1LL);
  id v11 = 0LL;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v5 executeRequest:v7 error:&v11]);

  id v9 = v11;
  if (!v8)
  {
    if (qword_1002EEA18 != -1) {
      dispatch_once(&qword_1002EEA18, &stru_100284BE8);
    }
    id v10 = (os_log_s *)qword_1002EEA20;
    if (os_log_type_enabled((os_log_t)qword_1002EEA20, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)__int128 buf = 138412290;
      id v13 = v9;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "bulk delete failed: %@", buf, 0xCu);
    }
  }
}

- (void)_onQueueClearDeviceSignatureSignatures
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[DeviceSignature fetchRequest](&OBJC_CLASS___DeviceSignature, "fetchRequest"));
  id v16 = 0LL;
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 execute:&v16]);
  id v4 = v16;
  if (v3)
  {
    __int128 v14 = 0u;
    __int128 v15 = 0u;
    __int128 v12 = 0u;
    __int128 v13 = 0u;
    id v5 = v3;
    id v6 = [v5 countByEnumeratingWithState:&v12 objects:v17 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v13;
      do
      {
        for (i = 0LL; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v5);
          }
          id v10 = *(void **)(*((void *)&v12 + 1) + 8LL * (void)i);
          objc_msgSend(v10, "setSignedAt:", 0, (void)v12);
          [v10 setUploadedAt:0];
          [v10 setSignature:0];
          [v10 setPublicKey:0];
          [v10 setState:@"tbs"];
          [v10 setCurrentItemPointerModificationTime:0];
          [v10 setAltDSID:0];
          [v10 setError:0];
        }

        id v7 = [v5 countByEnumeratingWithState:&v12 objects:v17 count:16];
      }

      while (v7);
    }
  }

  else
  {
    if (qword_1002EEA18 != -1) {
      dispatch_once(&qword_1002EEA18, &stru_100284C08);
    }
    id v11 = (os_log_s *)qword_1002EEA20;
    if (os_log_type_enabled((os_log_t)qword_1002EEA20, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)__int128 buf = 138412290;
      id v19 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_ERROR,  "deleting DeviceSignatures failes: %@",  buf,  0xCu);
    }
  }
}

- (BOOL)clearDeviceSignatures:(id *)a3
{
  uint64_t v21 = 0LL;
  id v22 = &v21;
  uint64_t v23 = 0x2020000000LL;
  char v24 = 0;
  uint64_t v15 = 0LL;
  id v16 = &v15;
  uint64_t v17 = 0x3032000000LL;
  id v18 = sub_10015647C;
  id v19 = sub_10015648C;
  id v20 = 0LL;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_10015A834;
  v11[3] = &unk_100284998;
  v11[4] = self;
  __int128 v13 = &v21;
  id v4 = (id)objc_claimAutoreleasedReturnValue( -[KTSMDataStoreActual managedObjectContextWithMergePolicy]( self,  "managedObjectContextWithMergePolicy"));
  id v12 = v4;
  __int128 v14 = &v15;
  [v4 performBlockAndWait:v11];
  if (a3)
  {
    id v5 = (void *)v16[5];
    if (v5) {
      *a3 = v5;
    }
  }

  if (qword_1002EEA18 != -1) {
    dispatch_once(&qword_1002EEA18, &stru_100284C28);
  }
  id v6 = (os_log_s *)qword_1002EEA20;
  if (os_log_type_enabled((os_log_t)qword_1002EEA20, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = *((unsigned __int8 *)v22 + 24);
    uint64_t v8 = v16[5];
    *(_DWORD *)__int128 buf = 67109378;
    int v26 = v7;
    __int16 v27 = 2112;
    uint64_t v28 = v8;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "done clearing signatures %d: %@", buf, 0x12u);
  }

  BOOL v9 = *((_BYTE *)v22 + 24) != 0;

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v21, 8);
  return v9;
}

- (BOOL)clearDataStore:(id *)a3
{
  if (qword_1002EEA18 != -1) {
    dispatch_once(&qword_1002EEA18, &stru_100284C48);
  }
  id v5 = (os_log_s *)qword_1002EEA20;
  if (os_log_type_enabled((os_log_t)qword_1002EEA20, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)__int128 buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "deleting KTSMDataStore", buf, 2u);
  }

  uint64_t v23 = 0LL;
  char v24 = &v23;
  uint64_t v25 = 0x2020000000LL;
  char v26 = 0;
  *(void *)__int128 buf = 0LL;
  id v18 = buf;
  uint64_t v19 = 0x3032000000LL;
  id v20 = sub_10015647C;
  uint64_t v21 = sub_10015648C;
  id v22 = 0LL;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_10015AB78;
  v13[3] = &unk_100284C70;
  v13[4] = self;
  id v6 = (id)objc_claimAutoreleasedReturnValue( -[KTSMDataStoreActual managedObjectContextWithMergePolicy]( self,  "managedObjectContextWithMergePolicy"));
  id v14 = v6;
  uint64_t v15 = &v23;
  id v16 = buf;
  [v6 performBlockAndWait:v13];
  if (a3)
  {
    int v7 = (void *)*((void *)v18 + 5);
    if (v7) {
      *a3 = v7;
    }
  }

  if (qword_1002EEA18 != -1) {
    dispatch_once(&qword_1002EEA18, &stru_100284C90);
  }
  uint64_t v8 = (os_log_s *)qword_1002EEA20;
  if (os_log_type_enabled((os_log_t)qword_1002EEA20, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = *((unsigned __int8 *)v24 + 24);
    uint64_t v10 = *((void *)v18 + 5);
    *(_DWORD *)__int16 v27 = 67109378;
    int v28 = v9;
    __int16 v29 = 2112;
    uint64_t v30 = v10;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "done deleting KTSMDataStore %d: %@", v27, 0x12u);
  }

  BOOL v11 = *((_BYTE *)v24 + 24) != 0;

  _Block_object_dispose(buf, 8);
  _Block_object_dispose(&v23, 8);
  return v11;
}

- (void)storeFixup:(id)a3
{
  id v4 = a3;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10015ACDC;
  v7[3] = &unk_1002777A0;
  id v8 = (id)objc_claimAutoreleasedReturnValue(-[KTSMDataStoreActual managedObjectContextWithMergePolicy](self, "managedObjectContextWithMergePolicy"));
  id v9 = v4;
  id v5 = v4;
  id v6 = v8;
  [v6 performBlockAndWait:v7];
}

- (void)deleteFixup:(id)a3
{
  id v4 = a3;
  id v7 = (id)objc_claimAutoreleasedReturnValue(-[KTSMDataStoreActual managedObjectContextWithMergePolicy](self, "managedObjectContextWithMergePolicy"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[CachedData fetchRequest](&OBJC_CLASS___CachedData, "fetchRequest"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"key = %@ AND application = %@",  @"FixUps",  v4));

  [v5 setPredicate:v6];
  -[KTSMDataStoreActual delete:onMOC:](self, "delete:onMOC:", v5, v7);
}

- (BOOL)haveDoneFixup:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMDataStoreActual managedObjectContextWithMergePolicy](self, "managedObjectContextWithMergePolicy"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[CachedData fetchRequest](&OBJC_CLASS___CachedData, "fetchRequest"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"key = %@ AND application = %@",  @"FixUps",  v4));
  [v6 setPredicate:v7];

  uint64_t v15 = 0LL;
  id v16 = &v15;
  uint64_t v17 = 0x2020000000LL;
  uint64_t v18 = 0LL;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_10015B080;
  v11[3] = &unk_100278EC8;
  id v14 = &v15;
  id v8 = v5;
  id v12 = v8;
  id v9 = v6;
  id v13 = v9;
  [v8 performBlockAndWait:v11];
  LOBYTE(v7) = v16[3] != 0;

  _Block_object_dispose(&v15, 8);
  return (char)v7;
}

- (void)setSettingsDate:(id)a3 date:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v18 = 0LL;
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  v7,  1LL,  &v18));
  id v9 = v18;
  if (v8)
  {
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( -[KTSMDataStoreActual managedObjectContextWithMergePolicy]( self,  "managedObjectContextWithMergePolicy"));
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_10015B3B0;
    v13[3] = &unk_100278E78;
    id v14 = v6;
    id v15 = v7;
    id v16 = v10;
    id v17 = v8;
    id v11 = v10;
    [v11 performBlockAndWait:v13];
  }

  else
  {
    if (qword_1002EEA18 != -1) {
      dispatch_once(&qword_1002EEA18, &stru_100284CF0);
    }
    id v12 = (os_log_s *)qword_1002EEA20;
    if (os_log_type_enabled((os_log_t)qword_1002EEA20, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)__int128 buf = 138412290;
      id v20 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_ERROR,  "setSettingsDate: archivedDataWithRootObject: %@",  buf,  0xCu);
    }
  }
}

- (id)getSettingsDate:(id)a3
{
  id v4 = a3;
  uint64_t v15 = 0LL;
  id v16 = &v15;
  uint64_t v17 = 0x3032000000LL;
  id v18 = sub_10015647C;
  uint64_t v19 = sub_10015648C;
  id v20 = 0LL;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[CachedData fetchRequest](&OBJC_CLASS___CachedData, "fetchRequest"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"key = %@ AND application = %@",  @"SettingsDate",  v4));
  [v5 setPredicate:v6];

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_10015B824;
  v11[3] = &unk_100284D58;
  id v7 = (id)objc_claimAutoreleasedReturnValue( -[KTSMDataStoreActual managedObjectContextWithMergePolicy]( self,  "managedObjectContextWithMergePolicy"));
  id v12 = v7;
  id v8 = v5;
  id v13 = v8;
  id v14 = &v15;
  [v7 performBlockAndWait:v11];
  id v9 = (id)v16[5];

  _Block_object_dispose(&v15, 8);
  return v9;
}

- (void)setSettingsData:(id)a3 data:(id)a4
{
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_10015BA7C;
  v9[3] = &unk_100279558;
  id v10 = a3;
  id v11 = a4;
  id v12 = (id)objc_claimAutoreleasedReturnValue(-[KTSMDataStoreActual managedObjectContextWithMergePolicy](self, "managedObjectContextWithMergePolicy"));
  id v6 = v12;
  id v7 = v11;
  id v8 = v10;
  [v6 performBlockAndWait:v9];
}

- (id)getSettingsData:(id)a3
{
  id v4 = a3;
  uint64_t v15 = 0LL;
  id v16 = &v15;
  uint64_t v17 = 0x3032000000LL;
  id v18 = sub_10015647C;
  uint64_t v19 = sub_10015648C;
  id v20 = 0LL;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[CachedData fetchRequest](&OBJC_CLASS___CachedData, "fetchRequest"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"key = %@ AND application = %@",  @"SettingsData",  v4));
  [v5 setPredicate:v6];

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_10015BEF0;
  v11[3] = &unk_100284D58;
  id v7 = (id)objc_claimAutoreleasedReturnValue( -[KTSMDataStoreActual managedObjectContextWithMergePolicy]( self,  "managedObjectContextWithMergePolicy"));
  id v12 = v7;
  id v8 = v5;
  id v13 = v8;
  id v14 = &v15;
  [v7 performBlockAndWait:v11];
  id v9 = (id)v16[5];

  _Block_object_dispose(&v15, 8);
  return v9;
}

- (void)setSettingsNumber:(id)a3 number:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v18 = 0LL;
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  v7,  1LL,  &v18));
  id v9 = v18;
  if (v8)
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue( -[KTSMDataStoreActual managedObjectContextWithMergePolicy]( self,  "managedObjectContextWithMergePolicy"));
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_10015C228;
    v13[3] = &unk_100278E78;
    id v14 = v6;
    id v15 = v7;
    id v16 = v10;
    id v17 = v8;
    id v11 = v10;
    [v11 performBlockAndWait:v13];
  }

  else
  {
    if (qword_1002EEA18 != -1) {
      dispatch_once(&qword_1002EEA18, &stru_100284DB8);
    }
    id v12 = (os_log_s *)qword_1002EEA20;
    if (os_log_type_enabled((os_log_t)qword_1002EEA20, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)__int128 buf = 138412290;
      id v20 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_ERROR,  "setSettingsNumber: archivedDataWithRootObject: %@",  buf,  0xCu);
    }
  }
}

- (id)getSettingsNumber:(id)a3
{
  id v4 = a3;
  uint64_t v15 = 0LL;
  id v16 = &v15;
  uint64_t v17 = 0x3032000000LL;
  id v18 = sub_10015647C;
  uint64_t v19 = sub_10015648C;
  id v20 = 0LL;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[CachedData fetchRequest](&OBJC_CLASS___CachedData, "fetchRequest"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"key = %@ AND application = %@",  @"SettingsNumber",  v4));
  [v5 setPredicate:v6];

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_10015C69C;
  v11[3] = &unk_100284D58;
  id v7 = (id)objc_claimAutoreleasedReturnValue( -[KTSMDataStoreActual managedObjectContextWithMergePolicy]( self,  "managedObjectContextWithMergePolicy"));
  id v12 = v7;
  id v8 = v5;
  id v13 = v8;
  id v14 = &v15;
  [v7 performBlockAndWait:v11];
  id v9 = (id)v16[5];

  _Block_object_dispose(&v15, 8);
  return v9;
}

- (NSPersistentContainer)container
{
  return (NSPersistentContainer *)objc_getProperty(self, a2, 8LL, 1);
}

- (void)setContainer:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
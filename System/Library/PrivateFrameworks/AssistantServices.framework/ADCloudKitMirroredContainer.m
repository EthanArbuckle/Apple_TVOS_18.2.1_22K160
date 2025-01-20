@interface ADCloudKitMirroredContainer
- (ADCloudKitMirroredContainer)initWithContainer:(id)a3 queue:(id)a4;
- (ADCloudKitRecordZoneInfo)accountStatusRecordZoneInfo;
- (ADCloudKitRecordZoneInfo)keyValueRecordZoneInfo;
- (ADCloudKitRecordZoneInfo)multiUserRecordZoneInfo;
- (CKContainer)container;
- (void)_createRecordZone:(id)a3 shared:(BOOL)a4;
- (void)createMirroredZonesWithCompletion:(id)a3;
- (void)resynchronizeMirroredZone:(id)a3 completion:(id)a4;
- (void)setAccountStatusRecordZoneInfo:(id)a3;
- (void)setContainer:(id)a3;
- (void)setKeyValueRecordZoneInfo:(id)a3;
- (void)setMultiUserRecordZoneInfo:(id)a3;
@end

@implementation ADCloudKitMirroredContainer

- (ADCloudKitMirroredContainer)initWithContainer:(id)a3 queue:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v39.receiver = self;
  v39.super_class = (Class)&OBJC_CLASS___ADCloudKitMirroredContainer;
  v9 = -[ADCloudKitMirroredContainer init](&v39, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_queue, a4);
    objc_storeStrong((id *)&v10->_containerIdentifier, a3);
    v11 = sub_1002FE578(v7, 0LL);
    uint64_t v12 = objc_claimAutoreleasedReturnValue(v11);
    container = v10->_container;
    v10->_container = (CKContainer *)v12;

    v10->_zoneCreationState = 0LL;
    v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@.%@.%@",  @"com.apple.assistant.backedup",  @"subscription",  @"AssistantKeyValueRecord"));
    v15 = -[ADCloudKitRecordZoneInfo initWithZoneName:subscriptionName:]( objc_alloc(&OBJC_CLASS___ADCloudKitRecordZoneInfo),  "initWithZoneName:subscriptionName:",  @"com.apple.assistant.backedup",  v14);
    keyValueRecordZoneInfo = v10->_keyValueRecordZoneInfo;
    v10->_keyValueRecordZoneInfo = v15;

    v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@.%@.%@",  @"com.apple.assistant.account.status",  @"subscription",  @"AssistantKeyValueRecord"));
    v18 = -[ADCloudKitRecordZoneInfo initWithZoneName:subscriptionName:]( objc_alloc(&OBJC_CLASS___ADCloudKitRecordZoneInfo),  "initWithZoneName:subscriptionName:",  @"com.apple.assistant.account.status",  v17);
    accountStatusRecordZoneInfo = v10->_accountStatusRecordZoneInfo;
    v10->_accountStatusRecordZoneInfo = v18;

    v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@.%@.%@",  @"com.apple.assistant.multiuser.shared",  @"subscription",  @"AssistantVoiceTriggerFileAssetRecord"));
    v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@.%@.%@",  @"com.apple.assistant.multiuser.shared",  @"subscription",  @"AssistantKeyValueRecord"));
    v22 = objc_alloc(&OBJC_CLASS___ADCloudKitRecordZoneInfo);
    v40[0] = v20;
    v40[1] = v21;
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v40, 2LL));
    v24 = -[ADCloudKitRecordZoneInfo initWithZoneName:subscriptionNames:]( v22,  "initWithZoneName:subscriptionNames:",  @"com.apple.assistant.multiuser.shared",  v23);
    multiUserRecordZoneInfo = v10->_multiUserRecordZoneInfo;
    v10->_multiUserRecordZoneInfo = v24;

    v26 = v10->_accountStatusRecordZoneInfo;
    v27 = objc_alloc_init(&OBJC_CLASS___ADCloudKitAccountStatusMirroredStore);
    -[ADCloudKitRecordZoneInfo setDataStore:](v26, "setDataStore:", v27);

    v28 = v10->_keyValueRecordZoneInfo;
    v29 = objc_alloc_init(&OBJC_CLASS___ADCloudKitKeyValueMirroredStore);
    -[ADCloudKitRecordZoneInfo setDataStore:](v28, "setDataStore:", v29);

    v30 = v10->_multiUserRecordZoneInfo;
    v31 = objc_alloc_init(&OBJC_CLASS___ADCloudKitMultiUserSharedDataStore);
    -[ADCloudKitRecordZoneInfo setDataStore:](v30, "setDataStore:", v31);

    v32 = (void *)objc_claimAutoreleasedReturnValue(-[ADCloudKitRecordZoneInfo dataStore](v10->_accountStatusRecordZoneInfo, "dataStore"));
    [v32 setIsMirroredDataStore:1];

    v33 = (void *)objc_claimAutoreleasedReturnValue(-[ADCloudKitRecordZoneInfo dataStore](v10->_keyValueRecordZoneInfo, "dataStore"));
    [v33 setIsMirroredDataStore:1];

    v34 = (void *)objc_claimAutoreleasedReturnValue(-[ADCloudKitRecordZoneInfo dataStore](v10->_multiUserRecordZoneInfo, "dataStore"));
    [v34 setIsMirroredDataStore:1];

    dispatch_group_t v35 = dispatch_group_create();
    group = v10->_group;
    v10->_group = (OS_dispatch_group *)v35;

    v37 = v10;
  }

  return v10;
}

- (void)createMirroredZonesWithCompletion:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1001210D0;
  v7[3] = &unk_1004FD990;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)_createRecordZone:(id)a3 shared:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = (void *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    id v8 = v7;
    v9 = (void *)objc_claimAutoreleasedReturnValue([v6 zoneName]);
    *(_DWORD *)buf = 136315394;
    v18 = "-[ADCloudKitMirroredContainer _createRecordZone:shared:]";
    __int16 v19 = 2112;
    v20 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s %@", buf, 0x16u);
  }

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v10 = objc_alloc(&OBJC_CLASS___CKRecordZoneID);
  v11 = (void *)objc_claimAutoreleasedReturnValue([v6 zoneName]);
  uint64_t v12 = -[CKRecordZoneID initWithZoneName:ownerName:](v10, "initWithZoneName:ownerName:", v11, CKCurrentUserDefaultName);

  dispatch_group_enter((dispatch_group_t)self->_group);
  container = self->_container;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_100120E64;
  v15[3] = &unk_1004F2110;
  v15[4] = self;
  id v16 = v6;
  id v14 = v6;
  sub_1002FE818(v12, container, v4, v15);
}

- (void)resynchronizeMirroredZone:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    v9 = v8;
    v10 = (void *)objc_claimAutoreleasedReturnValue([v6 zoneName]);
    *(_DWORD *)buf = 136315394;
    v27 = "-[ADCloudKitMirroredContainer resynchronizeMirroredZone:completion:]";
    __int16 v28 = 2112;
    v29 = v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%s %@", buf, 0x16u);
  }

  v11 = objc_alloc(&OBJC_CLASS___CKRecordZoneID);
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v6 zoneName]);
  v13 = -[CKRecordZoneID initWithZoneName:ownerName:](v11, "initWithZoneName:ownerName:", v12, CKCurrentUserDefaultName);

  id v14 = (void *)objc_claimAutoreleasedReturnValue([v6 zoneName]);
  unsigned __int8 v15 = [v14 isEqualToString:@"com.apple.assistant.multiuser.shared"];

  dispatch_time_t v16 = dispatch_time(0LL, 120000000000LL);
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100120A64;
  block[3] = &unk_1004F95C8;
  block[4] = self;
  v22 = v13;
  unsigned __int8 v25 = v15;
  id v23 = v6;
  id v24 = v7;
  id v18 = v6;
  __int16 v19 = v13;
  id v20 = v7;
  dispatch_after(v16, queue, block);
}

- (CKContainer)container
{
  return self->_container;
}

- (void)setContainer:(id)a3
{
}

- (ADCloudKitRecordZoneInfo)accountStatusRecordZoneInfo
{
  return self->_accountStatusRecordZoneInfo;
}

- (void)setAccountStatusRecordZoneInfo:(id)a3
{
}

- (ADCloudKitRecordZoneInfo)keyValueRecordZoneInfo
{
  return self->_keyValueRecordZoneInfo;
}

- (void)setKeyValueRecordZoneInfo:(id)a3
{
}

- (ADCloudKitRecordZoneInfo)multiUserRecordZoneInfo
{
  return self->_multiUserRecordZoneInfo;
}

- (void)setMultiUserRecordZoneInfo:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
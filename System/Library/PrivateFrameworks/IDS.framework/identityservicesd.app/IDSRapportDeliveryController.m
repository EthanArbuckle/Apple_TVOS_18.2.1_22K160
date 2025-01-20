@interface IDSRapportDeliveryController
+ (id)sharedInstance;
- (IDSRapportDeliveryController)init;
- (IDSRapportDeliveryController)initWithRapportClient:(id)a3;
- (IDSRapportDeliveryControllerDelegate)delegate;
- (IDSRapportDeliveryControllerRapportClient)rapportClient;
- (unsigned)_nextMessageID;
- (void)dealloc;
- (void)rapportClient:(id)a3 didReceiveMessage:(id)a4 fromID:(id)a5;
- (void)sendMessage:(id)a3 messageID:(id)a4 topic:(id)a5 command:(id)a6 destinationIDs:(id)a7 completionBlock:(id)a8;
- (void)setDelegate:(id)a3;
- (void)setRapportClient:(id)a3;
@end

@implementation IDSRapportDeliveryController

+ (id)sharedInstance
{
  if (qword_1009BE9E0 != -1) {
    dispatch_once(&qword_1009BE9E0, &stru_1008FA260);
  }
  return (id)qword_1009BE9E8;
}

- (IDSRapportDeliveryController)initWithRapportClient:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___IDSRapportDeliveryController;
  v6 = -[IDSRapportDeliveryController init](&v9, "init");
  v7 = v6;
  if (v6)
  {
    v6->_messageID = 0;
    objc_storeStrong((id *)&v6->_rapportClient, a3);
    -[IDSRapportClient addDelegate:](v7->_rapportClient, "addDelegate:", v7);
  }

  return v7;
}

- (IDSRapportDeliveryController)init
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[IDSRapportClient sharedInstance](&OBJC_CLASS___IDSRapportClient, "sharedInstance"));
  v4 = -[IDSRapportDeliveryController initWithRapportClient:](self, "initWithRapportClient:", v3);

  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___IDSRapportDeliveryController;
  -[IDSRapportDeliveryController dealloc](&v3, "dealloc");
}

- (void)sendMessage:(id)a3 messageID:(id)a4 topic:(id)a5 command:(id)a6 destinationIDs:(id)a7 completionBlock:(id)a8
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  v19 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog bonjourDeliveryController]( &OBJC_CLASS___IDSFoundationLog,  "bonjourDeliveryController"));
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v17 count]));
    *(_DWORD *)buf = 138544130;
    id v56 = v14;
    __int16 v57 = 2114;
    id v58 = v15;
    __int16 v59 = 2114;
    v60 = v20;
    __int16 v61 = 2114;
    id v62 = v16;
    _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "Bonjour request to send local message {guid: %{public}@, topic: %{public}@, deviceIDs.count: %{public}@ command: %{public}@}",  buf,  0x2Au);
  }

  v53[0] = _NSConcreteStackBlock;
  v53[1] = 3221225472LL;
  v53[2] = sub_1000F6F60;
  v53[3] = &unk_1008FA288;
  id v54 = v18;
  id v37 = v18;
  v21 = objc_retainBlock(v53);
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v17));
  v36 = v17;
  v23 = (void *)objc_claimAutoreleasedReturnValue([v22 allObjects]);

  id v24 = objc_alloc(&OBJC_CLASS___CUTAsyncReducer);
  v25 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  id v26 = [v24 initWithInput:v23 initialValue:v25];

  v46[0] = _NSConcreteStackBlock;
  v46[1] = 3221225472LL;
  v46[2] = sub_1000F6F74;
  v46[3] = &unk_1008FA2B0;
  id v27 = v14;
  id v47 = v27;
  id v28 = v15;
  id v48 = v28;
  id v49 = v16;
  id v50 = v13;
  v51 = self;
  v29 = v21;
  id v52 = v29;
  id v30 = v13;
  id v31 = v16;
  [v26 setReducerBlock:v46];
  v40[0] = _NSConcreteStackBlock;
  v40[1] = 3221225472LL;
  v40[2] = sub_1000F7374;
  v40[3] = &unk_1008FA2D8;
  v40[4] = self;
  id v41 = v27;
  id v42 = v28;
  id v43 = v23;
  id v44 = v29;
  SEL v45 = a2;
  v32 = v29;
  id v33 = v23;
  id v34 = v28;
  id v35 = v27;
  [v26 reduceWithCompletion:v40];
}

- (unsigned)_nextMessageID
{
  p_messageID = &self->_messageID;
  do
    unsigned int result = __ldaxr(p_messageID);
  while (__stlxr(result + 1, p_messageID));
  return result;
}

- (void)rapportClient:(id)a3 didReceiveMessage:(id)a4 fromID:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  objc_super v9 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:@"id"]);
  v10 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:@"t"]);
  v11 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:@"c"]);
  v12 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:@"p"]);

  id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog bonjourDeliveryController]( &OBJC_CLASS___IDSFoundationLog,  "bonjourDeliveryController"));
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 138544131;
    id v16 = v9;
    __int16 v17 = 2114;
    id v18 = v10;
    __int16 v19 = 2113;
    id v20 = v7;
    __int16 v21 = 2114;
    v22 = v11;
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Bonjour received message {guid: %{public}@, topic: %{public}@, deviceID: %{private}@, command: %{public}@}",  (uint8_t *)&v15,  0x2Au);
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained deliveryController:self didReceiveMessage:v12 topic:v10 command:v11 deviceID:v7 messageID:v9];
}

- (IDSRapportDeliveryControllerDelegate)delegate
{
  return (IDSRapportDeliveryControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (IDSRapportDeliveryControllerRapportClient)rapportClient
{
  return (IDSRapportDeliveryControllerRapportClient *)self->_rapportClient;
}

- (void)setRapportClient:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
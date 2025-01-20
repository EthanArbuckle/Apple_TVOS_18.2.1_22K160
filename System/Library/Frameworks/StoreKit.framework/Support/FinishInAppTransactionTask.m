@interface FinishInAppTransactionTask
- (FinishInAppTransactionTask)initWithTransactionID:(id)a3 client:(id)a4;
- (NSString)serverCorrelationID;
- (NSString)transactionID;
- (_TtC9storekitd6Client)client;
- (void)main;
@end

@implementation FinishInAppTransactionTask

- (FinishInAppTransactionTask)initWithTransactionID:(id)a3 client:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___FinishInAppTransactionTask;
  v9 = -[Task init](&v14, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)(v9 + 50), a4);
    uint64_t v11 = objc_claimAutoreleasedReturnValue(+[NSUUID lib_shortLogKey](&OBJC_CLASS___NSUUID, "lib_shortLogKey"));
    v12 = *(void **)(v10 + 42);
    *(void *)(v10 + 42) = v11;

    objc_storeStrong((id *)(v10 + 58), a3);
  }

  return (FinishInAppTransactionTask *)v10;
}

- (void)main
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FinishInAppTransactionTask transactionID](self, "transactionID"));
  id v4 = [v3 length];

  if (!v4)
  {
    if (qword_10032EA08 != -1) {
      dispatch_once(&qword_10032EA08, &stru_1002E9468);
    }
    objc_super v14 = (void *)qword_10032E9D8;
    if (os_log_type_enabled((os_log_t)qword_10032E9D8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v15 = *(void *)(&self->super.super._success + 2);
      v16 = v14;
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[FinishInAppTransactionTask client](self, "client"));
      v18 = (void *)objc_claimAutoreleasedReturnValue([v17 requestBundleID]);
      *(_DWORD *)buf = 138543618;
      uint64_t v51 = v15;
      __int16 v52 = 2114;
      id v53 = v18;
      _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "[%{public}@] Finishing transaction with no identifier for %{public}@",  buf,  0x16u);
    }

    goto LABEL_25;
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FinishInAppTransactionTask client](self, "client"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[ReceiptManager managerForClient:](&OBJC_CLASS___ReceiptManager, "managerForClient:", v5));

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[FinishInAppTransactionTask transactionID](self, "transactionID"));
  unsigned int v8 = [v6 isTransactionFinishedForID:v7];

  if (v8)
  {
    if (qword_10032EA08 != -1) {
      dispatch_once(&qword_10032EA08, &stru_1002E9468);
    }
    v9 = (void *)qword_10032E9D8;
    if (os_log_type_enabled((os_log_t)qword_10032E9D8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = *(void *)(&self->super.super._success + 2);
      uint64_t v11 = v9;
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[FinishInAppTransactionTask client](self, "client"));
      v13 = (void *)objc_claimAutoreleasedReturnValue([v12 requestBundleID]);
      *(_DWORD *)buf = 138543618;
      uint64_t v51 = v10;
      __int16 v52 = 2114;
      id v53 = v13;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "[%{public}@] Transaction is already finished for %{public}@",  buf,  0x16u);
    }

LABEL_25:
    -[AsyncTask completeWithSuccess](self, "completeWithSuccess");
    return;
  }

  if (qword_10032EA08 != -1) {
    dispatch_once(&qword_10032EA08, &stru_1002E9468);
  }
  v19 = (void *)qword_10032E9D8;
  if (os_log_type_enabled((os_log_t)qword_10032E9D8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v20 = *(void *)(&self->super.super._success + 2);
    v21 = v19;
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[FinishInAppTransactionTask transactionID](self, "transactionID"));
    id v23 = [v22 hash];
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[FinishInAppTransactionTask client](self, "client"));
    v25 = (void *)objc_claimAutoreleasedReturnValue([v24 requestBundleID]);
    *(_DWORD *)buf = 138543874;
    uint64_t v51 = v20;
    __int16 v52 = 2048;
    id v53 = v23;
    __int16 v54 = 2114;
    v55 = v25;
    _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "[%{public}@] Finishing transaction %lu for %{public}@",  buf,  0x20u);
  }

  v26 = (void *)objc_claimAutoreleasedReturnValue(-[FinishInAppTransactionTask client](self, "client"));
  v27 = (void *)objc_claimAutoreleasedReturnValue([v26 bag]);

  v28 = (void *)objc_claimAutoreleasedReturnValue(-[FinishInAppTransactionTask client](self, "client"));
  v29 = (void *)objc_claimAutoreleasedReturnValue([v28 urlSession]);

  v30 = (void *)objc_claimAutoreleasedReturnValue(-[FinishInAppTransactionTask client](self, "client"));
  v31 = (void *)objc_claimAutoreleasedReturnValue([v30 urlRequestEncoder]);

  v48 = @"transactionId";
  v32 = (void *)objc_claimAutoreleasedReturnValue(-[FinishInAppTransactionTask transactionID](self, "transactionID"));
  v49 = v32;
  v33 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v49,  &v48,  1LL));

  v34 = (void *)objc_claimAutoreleasedReturnValue(+[BagKey finishTransactionURL](&OBJC_CLASS____TtC9storekitd6BagKey, "finishTransactionURL"));
  v35 = (void *)objc_claimAutoreleasedReturnValue([v27 URLForKey:v34]);
  v36 = (void *)objc_claimAutoreleasedReturnValue([v31 requestWithMethod:2 bagURL:v35 parameters:v33]);

  id v47 = 0LL;
  v37 = (void *)objc_claimAutoreleasedReturnValue([v36 resultWithError:&v47]);
  id v38 = v47;
  if (!v38)
  {
    v39 = (void *)objc_claimAutoreleasedReturnValue([v29 dataTaskPromiseWithRequest:v37]);
    id v46 = 0LL;
    v45 = v29;
    v40 = (void *)objc_claimAutoreleasedReturnValue([v39 resultWithError:&v46]);
    id v38 = v46;

    v41 = (NSString *)objc_claimAutoreleasedReturnValue([v40 responseCorrelationId]);
    v42 = *(NSString **)((char *)&self->_logKey + 2);
    *(NSString **)((char *)&self->_logKey + 2) = v41;

    v29 = v45;
    if (!v38)
    {
      v43 = (void *)objc_claimAutoreleasedReturnValue(-[FinishInAppTransactionTask transactionID](self, "transactionID"));
      [v6 setFinishedForTransactionID:v43];

      v29 = v45;
    }
  }

  if (!v38) {
    goto LABEL_25;
  }
  if (qword_10032EA08 != -1) {
    dispatch_once(&qword_10032EA08, &stru_1002E9468);
  }
  v44 = (void *)qword_10032E9D8;
  if (os_log_type_enabled((os_log_t)qword_10032E9D8, OS_LOG_TYPE_ERROR)) {
    sub_1002623A4((uint64_t)self, v44, (uint64_t)v38);
  }
  -[AsyncTask completeWithError:](self, "completeWithError:", v38);
}

- (_TtC9storekitd6Client)client
{
  return *(_TtC9storekitd6Client **)((char *)&self->super.super._error + 2);
}

- (NSString)transactionID
{
  return *(NSString **)(&self->super._finished + 1);
}

- (NSString)serverCorrelationID
{
  return *(NSString **)((char *)&self->_logKey + 2);
}

- (void).cxx_destruct
{
}

@end
@interface AMSDFraudReportPrivacyTask
+ (id)_blindedTransactionWithTransactionID:(id)a3 pks:(id)a4 keyID:(id)a5 error:(id *)a6;
+ (id)performUnBlindingFraudReportForResponse:(id)a3 tdmToken:(id)a4 pks:(id)a5 error:(id *)a6;
- (AMSBagProtocol)bag;
- (AMSDFraudReportPrivacyTask)initWithBag:(id)a3;
- (id)performBlindingWithTransactionID:(id)a3 keyID:(id)a4;
@end

@implementation AMSDFraudReportPrivacyTask

- (AMSDFraudReportPrivacyTask)initWithBag:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    v6 = v5;
    v15.receiver = self;
    v15.super_class = (Class)&OBJC_CLASS___AMSDFraudReportPrivacyTask;
    v7 = -[AMSDFraudReportPrivacyTask init](&v15, "init");
    v8 = v7;
    if (v7) {
      objc_storeStrong((id *)&v7->_bag, a3);
    }

    return v8;
  }

  else
  {
    id v10 = (id)objc_claimAutoreleasedReturnValue( +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  NSInvalidArgumentException,  @"bag must not be nil",  0LL));
    objc_exception_throw(v10);
    return (AMSDFraudReportPrivacyTask *)-[AMSDFraudReportPrivacyTask performBlindingWithTransactionID:keyID:]( v11,  v12,  v13,  v14);
  }

- (id)performBlindingWithTransactionID:(id)a3 keyID:(id)a4
{
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_10001916C;
  v9[3] = &unk_1000D63F0;
  id v10 = self;
  id v11 = a3;
  id v12 = a4;
  id v5 = v12;
  id v6 = v11;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[AMSDFraudReportPrivacyTask performTaskWithPromiseBlock:](v10, "performTaskWithPromiseBlock:", v9));

  return v7;
}

+ (id)performUnBlindingFraudReportForResponse:(id)a3 tdmToken:(id)a4 pks:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v15 = AMSSetLogKeyIfNeeded(v12, v13, v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedFraudReportConfig](&OBJC_CLASS___AMSLogConfig, "sharedFraudReportConfig"));
  if (!v17) {
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
  }
  v18 = (os_log_s *)objc_claimAutoreleasedReturnValue([v17 OSLogObject]);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v36 = a1;
    __int16 v37 = 2114;
    v38 = v16;
    _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "%{public}@: [%{public}@] Running fraud report unblinding response task.",  buf,  0x16u);
  }

  v19 = (void *)objc_claimAutoreleasedReturnValue([v10 nameSpace]);
  v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@|%hhu|%hhu",  v19,  [v10 reportedScore],  objc_msgSend(v10, "newScore")));
  v21 = (void *)objc_claimAutoreleasedReturnValue([v20 dataUsingEncoding:4]);

  if (v21)
  {
    id v22 = a1;
    v33 = a6;
    v23 = (void *)objc_claimAutoreleasedReturnValue([v10 evaluatedElementData]);
    v24 = (void *)objc_claimAutoreleasedReturnValue([v10 proofData]);
    id v34 = 0LL;
    v25 = (void *)objc_claimAutoreleasedReturnValue( [v11 finalizeWithEvaluatedElement:v23 proof:v24 publicKey:v12 fsr:v21 error:&v34]);
    id v26 = v34;

    if (v25)
    {
      v27 = (void *)objc_claimAutoreleasedReturnValue([v25 base64EncodedStringWithOptions:0]);
      [v10 _setFinalizedElement:v27];

      id v28 = v10;
    }

    else
    {
      v30 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedFraudReportConfig](&OBJC_CLASS___AMSLogConfig, "sharedFraudReportConfig"));
      if (!v30) {
        v30 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
      }
      v31 = (os_log_s *)objc_claimAutoreleasedReturnValue([v30 OSLogObject]);
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543874;
        id v36 = v22;
        __int16 v37 = 2114;
        v38 = v16;
        __int16 v39 = 2114;
        id v40 = v26;
        _os_log_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_ERROR,  "%{public}@ [%{public}@] Error fraud report unblinding message, cannot create a finalized element: %{public}@",  buf,  0x20u);
      }

      id v28 = 0LL;
      if (v33) {
        id *v33 = v26;
      }
    }
  }

  else if (a6)
  {
    uint64_t v29 = AMSError(0LL, @"Unable to unblind fraud report response", @"Unable to create fsr data", 0LL);
    id v28 = 0LL;
    *a6 = (id)objc_claimAutoreleasedReturnValue(v29);
  }

  else
  {
    id v28 = 0LL;
  }

  return v28;
}

+ (id)_blindedTransactionWithTransactionID:(id)a3 pks:(id)a4 keyID:(id)a5 error:(id *)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a3;
  uint64_t v14 = AMSSetLogKeyIfNeeded(v11, v12, v13);
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue([v11 dataUsingEncoding:4]);

  if (v16)
  {
    v17 = -[TDMToken initWithTID:](objc_alloc(&OBJC_CLASS___TDMToken), "initWithTID:", v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[TDMToken blindedElement](v17, "blindedElement"));

    if (v18)
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue([v10 dataUsingEncoding:4]);
      v20 = -[AMSDFraudReportBlindedTransaction initWithTDMToken:pks:keyID:]( objc_alloc(&OBJC_CLASS___AMSDFraudReportBlindedTransaction),  "initWithTDMToken:pks:keyID:",  v17,  v9,  v19);
    }

    else if (a6)
    {
      uint64_t v22 = AMSError(0LL, @"Error fraud report blinding message", @"token.blindedElement is nil.", 0LL);
      v20 = 0LL;
      *a6 = (id)objc_claimAutoreleasedReturnValue(v22);
    }

    else
    {
      v20 = 0LL;
    }
  }

  else if (a6)
  {
    uint64_t v21 = AMSError(3LL, @"Error fraud report blinding message", @"Cannot create transactionIDData.", 0LL);
    v20 = 0LL;
    *a6 = (id)objc_claimAutoreleasedReturnValue(v21);
  }

  else
  {
    v20 = 0LL;
  }

  return v20;
}

- (AMSBagProtocol)bag
{
  return self->_bag;
}

- (void).cxx_destruct
{
}

@end
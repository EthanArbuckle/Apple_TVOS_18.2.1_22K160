@interface KTBackgroundSystemValidationOperation
+ (id)lastDutyCycle:(id)a3;
+ (id)lastDutyCycleSuccess:(id)a3;
+ (id)sysdiagnoseInfo:(id)a3;
+ (void)addErrorToBackgroundOp:(id)a3 smDataStore:(id)a4 failureDataString:(id)a5 type:(id)a6 serverHint:(id)a7 failure:(id)a8;
+ (void)saveErrorToDB:(id)a3 smDataStore:(id)a4;
- (KTBackgroundSystemValidationOperation)initWithDependencies:(id)a3;
- (KTOperationDependencies)deps;
- (KTResultOperation)finishedOp;
- (NSUUID)opUUID;
- (OS_os_transaction)transaction;
- (id)opUUIDData;
- (void)groupStart;
- (void)recordBackgroundActivity;
- (void)saveErrorToDB;
- (void)setDeps:(id)a3;
- (void)setFinishedOp:(id)a3;
- (void)setOpUUID:(id)a3;
- (void)setTransaction:(id)a3;
@end

@implementation KTBackgroundSystemValidationOperation

- (KTBackgroundSystemValidationOperation)initWithDependencies:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___KTBackgroundSystemValidationOperation;
  v5 = -[KTGroupOperation init](&v10, "init");
  v6 = v5;
  if (v5)
  {
    -[KTBackgroundSystemValidationOperation setDeps:](v5, "setDeps:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
    -[KTBackgroundSystemValidationOperation setOpUUID:](v6, "setOpUUID:", v7);

    v8 = v6;
  }

  return v6;
}

- (id)opUUIDData
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[KTBackgroundSystemValidationOperation opUUID](self, "opUUID"));

  if (v3)
  {
    v7[0] = 0LL;
    v7[1] = 0LL;
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[KTBackgroundSystemValidationOperation opUUID](self, "opUUID"));
    [v4 getUUIDBytes:v7];

    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:", v7, 16LL));
  }

  else
  {
    v5 = 0LL;
  }

  return v5;
}

- (void)recordBackgroundActivity
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[KTBackgroundSystemValidationOperation deps](self, "deps"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 smDataStore]);
  p_class_meths = &OBJC_PROTOCOL___TransparencyFollowUpProtocol.class_meths;
  uint64_t v6 = objc_claimAutoreleasedReturnValue([v4 getSettingsDate:off_1002DE040]);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[KTBackgroundSystemValidationOperation deps](self, "deps"));
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 smDataStore]);
  uint64_t v9 = objc_claimAutoreleasedReturnValue([v8 getSettingsNumber:off_1002DE048]);

  if (!(v6 | v9))
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[KTBackgroundSystemValidationOperation deps](self, "deps"));
    v13 = (void *)objc_claimAutoreleasedReturnValue([v12 smDataStore]);
    v14 = off_1002DE050;
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
    [v13 setSettingsDate:v14 date:v15];
LABEL_6:

    goto LABEL_7;
  }

  if (!v6) {
    goto LABEL_8;
  }
  if ([(id)v9 unsignedIntegerValue] == (id)1)
  {
    objc_super v10 = (void *)objc_claimAutoreleasedReturnValue(-[KTBackgroundSystemValidationOperation deps](self, "deps"));
    v11 = (void *)objc_claimAutoreleasedReturnValue([v10 smDataStore]);
    [v11 setSettingsDate:off_1002DE050 date:v6];

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[KTBackgroundSystemValidationOperation deps](self, "deps"));
    v13 = (void *)objc_claimAutoreleasedReturnValue([v12 smDataStore]);
    [v13 setSettingsNumber:off_1002DE060 number:&off_100299AC8];
LABEL_7:

    goto LABEL_8;
  }

  if (![(id)v9 unsignedIntegerValue])
  {
    v32 = (void *)objc_claimAutoreleasedReturnValue(-[KTBackgroundSystemValidationOperation deps](self, "deps"));
    v33 = (void *)objc_claimAutoreleasedReturnValue([v32 smDataStore]);
    v12 = (void *)objc_claimAutoreleasedReturnValue([v33 getSettingsNumber:off_1002DE060]);

    v34 = (char *)[v12 unsignedIntegerValue] + 1;
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[KTBackgroundSystemValidationOperation deps](self, "deps"));
    v15 = (void *)objc_claimAutoreleasedReturnValue([v13 smDataStore]);
    v35 = off_1002DE060;
    v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", v34));
    p_class_meths = (__objc2_meth_list **)(&OBJC_PROTOCOL___TransparencyFollowUpProtocol + 32);
    [v15 setSettingsNumber:v35 number:v36];

    goto LABEL_6;
  }

- (void)groupStart
{
  v3 = (void *)os_transaction_create("com.apple.transparencyd.BackgroundSystemValidationOp");
  -[KTBackgroundSystemValidationOperation setTransaction:](self, "setTransaction:", v3);

  if (qword_1002E6440 != -1) {
    dispatch_once(&qword_1002E6440, &stru_100277AB8);
  }
  id v4 = (void *)qword_1002E6448;
  if (os_log_type_enabled((os_log_t)qword_1002E6448, OS_LOG_TYPE_DEBUG))
  {
    v5 = v4;
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[KTBackgroundSystemValidationOperation opUUID](self, "opUUID"));
    *(_DWORD *)buf = 138543362;
    *(void *)&uint8_t buf[4] = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEBUG,  "BackgroundSystemValidation: start %{public}@",  buf,  0xCu);
  }

  -[KTBackgroundSystemValidationOperation recordBackgroundActivity](self, "recordBackgroundActivity");
  *(void *)buf = 0LL;
  objc_initWeak((id *)buf, self);
  v58[1] = 3221225472LL;
  v58[2] = sub_10001920C;
  v58[3] = &unk_100277AE0;
  v58[0] = _NSConcreteStackBlock;
  objc_copyWeak(&v59, (id *)buf);
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[KTResultOperation named:withBlockTakingSelf:]( &OBJC_CLASS___KTResultOperation,  "named:withBlockTakingSelf:",  @"background-finished",  v58));
  -[KTBackgroundSystemValidationOperation setFinishedOp:](self, "setFinishedOp:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[KTBackgroundSystemValidationOperation finishedOp](self, "finishedOp"));
  -[KTGroupOperation dependOnBeforeGroupFinished:](self, "dependOnBeforeGroupFinished:", v8);

  uint64_t v9 = objc_alloc(&OBJC_CLASS___KTVerifyPendingSignaturesOperation);
  objc_super v10 = (void *)objc_claimAutoreleasedReturnValue(-[KTBackgroundSystemValidationOperation deps](self, "deps"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[KTBackgroundSystemValidationOperation opUUID](self, "opUUID"));
  v12 = -[KTVerifyPendingSignaturesOperation initWithDependencies:opId:](v9, "initWithDependencies:opId:", v10, v11);

  v13 = objc_alloc(&OBJC_CLASS___KTVerifyMapHeadMMDOperation);
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[KTBackgroundSystemValidationOperation deps](self, "deps"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[KTBackgroundSystemValidationOperation opUUID](self, "opUUID"));
  v16 = -[KTVerifyMapHeadMMDOperation initWithDependencies:opId:](v13, "initWithDependencies:opId:", v14, v15);

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[KTBackgroundSystemValidationOperation finishedOp](self, "finishedOp"));
  [v17 addSuccessDependency:v12];

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[KTBackgroundSystemValidationOperation finishedOp](self, "finishedOp"));
  [v18 addSuccessDependency:v16];

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[KTGroupOperation operationQueue](self, "operationQueue"));
  [v19 addOperation:v12];

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[KTGroupOperation operationQueue](self, "operationQueue"));
  [v20 addOperation:v16];

  v21 = objc_alloc(&OBJC_CLASS___KTValidatePendingURIsOperation);
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[KTBackgroundSystemValidationOperation opUUID](self, "opUUID"));
  double v23 = (void *)objc_claimAutoreleasedReturnValue(-[KTBackgroundSystemValidationOperation deps](self, "deps"));
  uint64_t v24 = kKTApplicationIdentifierIDS;
  id v25 = -[KTValidatePendingURIsOperation initWithApplication:opId:dependencies:]( v21,  "initWithApplication:opId:dependencies:",  kKTApplicationIdentifierIDS,  v22,  v23);

  id v26 = objc_alloc(&OBJC_CLASS___KTValidatePendingRequestsOperation);
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[KTBackgroundSystemValidationOperation deps](self, "deps"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[KTBackgroundSystemValidationOperation opUUID](self, "opUUID"));
  v29 = -[KTValidatePendingRequestsOperation initWithApplication:dependencies:opId:]( v26,  "initWithApplication:dependencies:opId:",  v24,  v27,  v28);

  -[KTValidatePendingURIsOperation addNullableDependency:](v25, "addNullableDependency:", v12);
  -[KTValidatePendingRequestsOperation addNullableDependency:](v29, "addNullableDependency:", v12);
  -[KTValidatePendingURIsOperation addNullableDependency:](v25, "addNullableDependency:", v16);
  -[KTValidatePendingRequestsOperation addNullableDependency:](v29, "addNullableDependency:", v16);
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[KTBackgroundSystemValidationOperation finishedOp](self, "finishedOp"));
  [v30 addSuccessDependency:v25];

  v31 = (void *)objc_claimAutoreleasedReturnValue(-[KTBackgroundSystemValidationOperation finishedOp](self, "finishedOp"));
  [v31 addSuccessDependency:v29];

  v32 = (void *)objc_claimAutoreleasedReturnValue(-[KTGroupOperation operationQueue](self, "operationQueue"));
  [v32 addOperation:v25];

  v33 = (void *)objc_claimAutoreleasedReturnValue(-[KTGroupOperation operationQueue](self, "operationQueue"));
  [v33 addOperation:v29];

  v34 = objc_alloc(&OBJC_CLASS___KTVerifyConsistencyOperation);
  v35 = (void *)objc_claimAutoreleasedReturnValue(-[KTBackgroundSystemValidationOperation deps](self, "deps"));
  v36 = (void *)objc_claimAutoreleasedReturnValue(-[KTBackgroundSystemValidationOperation opUUID](self, "opUUID"));
  v37 = -[KTVerifyConsistencyOperation initWithDependencies:opId:](v34, "initWithDependencies:opId:", v35, v36);

  v38 = objc_alloc(&OBJC_CLASS___KTVerifyRevisionInclusionOperation);
  uint64_t v39 = (void *)objc_claimAutoreleasedReturnValue(-[KTBackgroundSystemValidationOperation deps](self, "deps"));
  uint64_t v40 = (void *)objc_claimAutoreleasedReturnValue(-[KTBackgroundSystemValidationOperation opUUID](self, "opUUID"));
  id v41 = -[KTVerifyRevisionInclusionOperation initWithDependencies:opId:](v38, "initWithDependencies:opId:", v39, v40);

  -[KTVerifyConsistencyOperation addNullableDependency:](v37, "addNullableDependency:", v25);
  -[KTVerifyConsistencyOperation addNullableDependency:](v37, "addNullableDependency:", v29);
  -[KTVerifyRevisionInclusionOperation addNullableDependency:](v41, "addNullableDependency:", v25);
  -[KTVerifyRevisionInclusionOperation addNullableDependency:](v41, "addNullableDependency:", v29);
  v42 = (void *)objc_claimAutoreleasedReturnValue(-[KTBackgroundSystemValidationOperation finishedOp](self, "finishedOp"));
  [v42 addSuccessDependency:v37];

  v43 = (void *)objc_claimAutoreleasedReturnValue(-[KTBackgroundSystemValidationOperation finishedOp](self, "finishedOp"));
  [v43 addSuccessDependency:v41];

  v44 = (void *)objc_claimAutoreleasedReturnValue(-[KTGroupOperation operationQueue](self, "operationQueue"));
  [v44 addOperation:v37];

  v45 = (void *)objc_claimAutoreleasedReturnValue(-[KTGroupOperation operationQueue](self, "operationQueue"));
  [v45 addOperation:v41];

  id v46 = objc_alloc(&OBJC_CLASS___KTGarbageCollectDBOperation);
  v47 = (void *)objc_claimAutoreleasedReturnValue(-[KTBackgroundSystemValidationOperation deps](self, "deps"));
  v48 = -[KTGarbageCollectDBOperation initWithDependencies:](v46, "initWithDependencies:", v47);

  v49 = objc_alloc(&OBJC_CLASS___KTReportDBMetricsOperation);
  v50 = (void *)objc_claimAutoreleasedReturnValue(-[KTBackgroundSystemValidationOperation deps](self, "deps"));
  v51 = -[KTReportDBMetricsOperation initWithDependencies:](v49, "initWithDependencies:", v50);

  -[KTGarbageCollectDBOperation addNullableDependency:](v48, "addNullableDependency:", v37);
  -[KTGarbageCollectDBOperation addNullableDependency:](v48, "addNullableDependency:", v41);
  -[KTReportDBMetricsOperation addNullableDependency:](v51, "addNullableDependency:", v48);
  v52 = (void *)objc_claimAutoreleasedReturnValue(-[KTBackgroundSystemValidationOperation finishedOp](self, "finishedOp"));
  [v52 addNullableDependency:v48];

  v53 = (void *)objc_claimAutoreleasedReturnValue(-[KTBackgroundSystemValidationOperation finishedOp](self, "finishedOp"));
  [v53 addNullableDependency:v51];

  v54 = (void *)objc_claimAutoreleasedReturnValue(-[KTGroupOperation operationQueue](self, "operationQueue"));
  [v54 addOperation:v48];

  v55 = (void *)objc_claimAutoreleasedReturnValue(-[KTGroupOperation operationQueue](self, "operationQueue"));
  [v55 addOperation:v51];

  v56 = (void *)objc_claimAutoreleasedReturnValue(-[KTGroupOperation operationQueue](self, "operationQueue"));
  v57 = (void *)objc_claimAutoreleasedReturnValue(-[KTBackgroundSystemValidationOperation finishedOp](self, "finishedOp"));
  [v56 addOperation:v57];

  objc_destroyWeak(&v59);
  objc_destroyWeak((id *)buf);
}

+ (id)lastDutyCycle:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue([a3 smDataStore]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 getSettingsDate:off_1002DE040]);

  return v4;
}

+ (id)lastDutyCycleSuccess:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue([a3 smDataStore]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 getSettingsDate:off_1002DE050]);

  return v4;
}

+ (id)sysdiagnoseInfo:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 smDataStore]);
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 getSettingsDate:off_1002DE040]);

  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v3 smDataStore]);
  v37 = (void *)objc_claimAutoreleasedReturnValue([v6 getSettingsDate:off_1002DE050]);

  v7 = (void *)objc_claimAutoreleasedReturnValue([v3 smDataStore]);
  v36 = (void *)objc_claimAutoreleasedReturnValue([v7 getSettingsNumber:off_1002DE048]);

  v8 = (void *)objc_claimAutoreleasedReturnValue([v3 smDataStore]);
  v35 = (void *)objc_claimAutoreleasedReturnValue([v8 getSettingsNumber:off_1002DE060]);

  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v3 smDataStore]);
  objc_super v10 = (void *)objc_claimAutoreleasedReturnValue([v9 getSettingsData:off_1002DE058]);

  v11 = (void *)objc_claimAutoreleasedReturnValue([v3 smDataStore]);
  uint64_t v12 = objc_claimAutoreleasedReturnValue([v11 getSettingsData:off_1002DE080]);

  v13 = (void *)objc_claimAutoreleasedReturnValue([v3 smDataStore]);
  uint64_t v14 = objc_claimAutoreleasedReturnValue([v13 getSettingsData:off_1002DE078]);

  v15 = (void *)objc_claimAutoreleasedReturnValue([v3 smDataStore]);
  v16 = (void *)objc_claimAutoreleasedReturnValue([v15 getSettingsData:off_1002DE070]);

  v33 = v10;
  if (v10) {
    v34 = -[NSUUID initWithUUIDBytes:]( [NSUUID alloc], "initWithUUIDBytes:", [v10 bytes]);
  }
  else {
    v34 = 0LL;
  }
  v17 = (void *)objc_claimAutoreleasedReturnValue([v3 smDataStore]);
  v18 = (void *)objc_claimAutoreleasedReturnValue([v17 getSettingsData:off_1002DE068]);

  if (v18)
  {
    id v19 = objc_alloc_init(&OBJC_CLASS___KTNSErrorValueTransformer);
    v20 = (void *)objc_claimAutoreleasedReturnValue([v19 transformedValue:v18]);
  }

  else
  {
    v20 = 0LL;
  }

  if (v12) {
    v21 = -[NSString initWithData:encoding:](objc_alloc(&OBJC_CLASS___NSString), "initWithData:encoding:", v12, 4LL);
  }
  else {
    v21 = 0LL;
  }
  v32 = (void *)v12;
  if (v14) {
    v22 = -[NSString initWithData:encoding:](objc_alloc(&OBJC_CLASS___NSString), "initWithData:encoding:", v14, 4LL);
  }
  else {
    v22 = 0LL;
  }
  v31 = (void *)v14;
  if (v16) {
    double v23 = -[NSString initWithData:encoding:](objc_alloc(&OBJC_CLASS___NSString), "initWithData:encoding:", v16, 4LL);
  }
  else {
    double v23 = 0LL;
  }
  uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  id v25 = v5;
  id v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "kt_toISO_8601_UTCString"));
  [v24 setObject:v26 forKeyedSubscript:@"lastDutyCycle"];

  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "kt_toISO_8601_UTCString"));
  [v24 setObject:v27 forKeyedSubscript:@"lastSuccess"];

  [v24 setObject:v36 forKeyedSubscript:@"lastResult"];
  [v24 setObject:v35 forKeyedSubscript:@"numSuccessiveFails"];
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[NSUUID UUIDString](v34, "UUIDString"));
  [v24 setObject:v28 forKeyedSubscript:@"lastUUID"];

  if (v20)
  {
    v29 = (void *)objc_claimAutoreleasedReturnValue( +[TransparencyError diagnosticError:depth:]( &OBJC_CLASS___TransparencyError,  "diagnosticError:depth:",  v20,  0LL));
    [v24 setObject:v29 forKeyedSubscript:@"lastError"];
  }

  [v24 setObject:v21 forKeyedSubscript:@"failureServerHints"];
  [v24 setObject:v22 forKeyedSubscript:@"failureType"];
  [v24 setObject:v23 forKeyedSubscript:@"failureData"];

  return v24;
}

+ (void)saveErrorToDB:(id)a3 smDataStore:(id)a4
{
  id v5 = a4;
  if (a3)
  {
    id v9 = v5;
    id v6 = a3;
    id v7 = objc_alloc_init(&OBJC_CLASS___KTNSErrorValueTransformer);
    v8 = (void *)objc_claimAutoreleasedReturnValue([v7 reverseTransformedValue:v6]);

    if (v8) {
      [v9 setSettingsData:off_1002DE068 data:v8];
    }

    id v5 = v9;
  }
}

- (void)saveErrorToDB
{
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[KTResultOperation error](self, "error"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[KTBackgroundSystemValidationOperation deps](self, "deps"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 smDataStore]);
  +[KTBackgroundSystemValidationOperation saveErrorToDB:smDataStore:]( &OBJC_CLASS___KTBackgroundSystemValidationOperation,  "saveErrorToDB:smDataStore:",  v5,  v4);
}

+ (void)addErrorToBackgroundOp:(id)a3 smDataStore:(id)a4 failureDataString:(id)a5 type:(id)a6 serverHint:(id)a7 failure:(id)a8
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  if (v13)
  {
    id v19 = (void *)objc_claimAutoreleasedReturnValue([v14 getSettingsData:off_1002DE058]);
    if (v19)
    {
      v20 = -[NSUUID initWithUUIDBytes:]( [NSUUID alloc], "initWithUUIDBytes:", [v19 bytes]);
      if ([v13 isEqual:v20])
      {
        [v14 setSettingsNumber:off_1002DE048 number:&off_100299AF8];
        +[KTBackgroundSystemValidationOperation saveErrorToDB:smDataStore:]( &OBJC_CLASS___KTBackgroundSystemValidationOperation,  "saveErrorToDB:smDataStore:",  v18,  v14);
        v21 = off_1002DE070;
        v22 = (void *)objc_claimAutoreleasedReturnValue([v15 dataUsingEncoding:4]);
        [v14 setSettingsData:v21 data:v22];

        double v23 = off_1002DE078;
        uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue([v16 dataUsingEncoding:4]);
        [v14 setSettingsData:v23 data:v24];

        id v25 = off_1002DE080;
        id v26 = (void *)objc_claimAutoreleasedReturnValue([v17 dataUsingEncoding:4]);
        [v14 setSettingsData:v25 data:v26];

        if (qword_1002E6440 != -1) {
          dispatch_once(&qword_1002E6440, &stru_100277B20);
        }
        v27 = (os_log_s *)qword_1002E6448;
        if (os_log_type_enabled((os_log_t)qword_1002E6448, OS_LOG_TYPE_ERROR))
        {
          int v29 = 138543362;
          id v30 = v13;
          _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_ERROR,  "BackgroundSystemValidation: failed %{public}@",  (uint8_t *)&v29,  0xCu);
        }
      }
    }

    else
    {
      if (qword_1002E6440 != -1) {
        dispatch_once(&qword_1002E6440, &stru_100277B00);
      }
      v28 = (os_log_s *)qword_1002E6448;
      if (os_log_type_enabled((os_log_t)qword_1002E6448, OS_LOG_TYPE_ERROR))
      {
        int v29 = 138543362;
        id v30 = v13;
        _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_ERROR,  "No saved background op UUID, but serverRPC has %{public}@",  (uint8_t *)&v29,  0xCu);
      }
    }
  }
}

- (NSUUID)opUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 120LL, 1);
}

- (void)setOpUUID:(id)a3
{
}

- (KTOperationDependencies)deps
{
  return (KTOperationDependencies *)objc_getProperty(self, a2, 128LL, 1);
}

- (void)setDeps:(id)a3
{
}

- (KTResultOperation)finishedOp
{
  return (KTResultOperation *)objc_getProperty(self, a2, 136LL, 1);
}

- (void)setFinishedOp:(id)a3
{
}

- (OS_os_transaction)transaction
{
  return (OS_os_transaction *)objc_getProperty(self, a2, 144LL, 1);
}

- (void)setTransaction:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
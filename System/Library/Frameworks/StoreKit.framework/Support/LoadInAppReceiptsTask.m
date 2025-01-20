@interface LoadInAppReceiptsTask
- (BOOL)includeFinishedConsumables;
- (BOOL)more;
- (LoadInAppReceiptsTask)initWithLocalRevision:(id)a3 reason:(int64_t)a4 includeFinishedConsumables:(BOOL)a5 client:(id)a6;
- (NSArray)receipts;
- (NSSet)unfinishedTransactionIDs;
- (NSString)localRevision;
- (NSString)logKey;
- (NSString)serverRevision;
- (_TtC9storekitd6Client)client;
- (int64_t)reason;
- (void)main;
- (void)setLogKey:(id)a3;
@end

@implementation LoadInAppReceiptsTask

- (LoadInAppReceiptsTask)initWithLocalRevision:(id)a3 reason:(int64_t)a4 includeFinishedConsumables:(BOOL)a5 client:(id)a6
{
  id v11 = a3;
  id v12 = a6;
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___LoadInAppReceiptsTask;
  v13 = -[Task init](&v18, "init");
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)(v13 + 50), a6);
    v14[42] = a5;
    objc_storeStrong((id *)(v14 + 58), a3);
    uint64_t v15 = objc_claimAutoreleasedReturnValue(+[NSUUID lib_shortLogKey](&OBJC_CLASS___NSUUID, "lib_shortLogKey"));
    v16 = *(void **)(v14 + 66);
    *(void *)(v14 + 66) = v15;

    *(void *)(v14 + 74) = a4;
    v14[43] = 0;
  }

  return (LoadInAppReceiptsTask *)v14;
}

- (void)main
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[LoadInAppReceiptsTask client](self, "client"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 bag]);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[LoadInAppReceiptsTask client](self, "client"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 urlSession]);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[LoadInAppReceiptsTask client](self, "client"));
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 urlRequestEncoder]);

  [v8 setRequestEncoding:3];
  if (-[LoadInAppReceiptsTask includeFinishedConsumables](self, "includeFinishedConsumables")) {
    uint64_t v9 = objc_claimAutoreleasedReturnValue(+[BagKey transactionReceiptsURLv2](&OBJC_CLASS____TtC9storekitd6BagKey, "transactionReceiptsURLv2"));
  }
  else {
    uint64_t v9 = objc_claimAutoreleasedReturnValue(+[BagKey transactionReceiptsURL](&OBJC_CLASS____TtC9storekitd6BagKey, "transactionReceiptsURL"));
  }
  v10 = (void *)v9;
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v4 URLForKey:v9]);
  id v103 = 0LL;
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 valueWithError:&v103]);
  id v13 = v103;
  if (!v13)
  {
    v97 = v10;
    v98 = v11;
    v99 = v6;
    uint64_t v15 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[AMSDevice deviceGUID](&OBJC_CLASS___AMSDevice, "deviceGUID"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v15, "setObject:forKeyedSubscript:", v16, @"guid");

    v17 = sub_100026EA4(-[LoadInAppReceiptsTask reason](self, "reason"));
    objc_super v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
    -[NSMutableDictionary setObject:forKeyedSubscript:](v15, "setObject:forKeyedSubscript:", v18, @"reason");

    v95 = v15;
    uint64_t v96 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "lib_URLByAppendingQueryDictionary:", v15));

    v19 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[LoadInAppReceiptsTask client](self, "client"));
    v21 = (void *)objc_claimAutoreleasedReturnValue([v20 account]);

    v22 = (void *)objc_claimAutoreleasedReturnValue(-[LoadInAppReceiptsTask client](self, "client"));
    LODWORD(v15) = objc_msgSend(v22, "objc_clientType");

    v94 = v21;
    if ((_DWORD)v15 != 3)
    {
      if (!v21)
      {
        if (qword_10032DCF8 != -1) {
          dispatch_once(&qword_10032DCF8, &stru_1002E6A70);
        }
        id v11 = v98;
        v6 = v99;
        v41 = (void *)v96;
        v10 = v97;
        v52 = (void *)qword_10032DCD8;
        if (os_log_type_enabled((os_log_t)qword_10032DCD8, OS_LOG_TYPE_ERROR)) {
          sub_10025B414(v52, self);
        }
        uint64_t v53 = ASDErrorWithTitleAndMessage(ASDErrorDomain, 509LL, @"No active account", 0LL);
        id v14 = (id)objc_claimAutoreleasedReturnValue(v53);
        -[AsyncTask completeWithError:](self, "completeWithError:", v14);
        goto LABEL_29;
      }

      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "ams_DSID"));
      v24 = (void *)objc_claimAutoreleasedReturnValue([v23 stringValue]);
      -[NSMutableDictionary setObject:forKeyedSubscript:](v19, "setObject:forKeyedSubscript:", v24, @"dsid");
    }

    v25 = (void *)objc_claimAutoreleasedReturnValue(-[LoadInAppReceiptsTask client](self, "client"));
    v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%lld",  [v25 storeItemID]));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v19, "setObject:forKeyedSubscript:", v26, @"appAdamId");

    v27 = (void *)objc_claimAutoreleasedReturnValue(-[LoadInAppReceiptsTask client](self, "client"));
    v28 = (void *)objc_claimAutoreleasedReturnValue([v27 requestBundleID]);
    -[NSMutableDictionary setObject:forKeyedSubscript:](v19, "setObject:forKeyedSubscript:", v28, @"bundleId");

    v29 = (void *)objc_claimAutoreleasedReturnValue(-[LoadInAppReceiptsTask client](self, "client"));
    v30 = (void *)objc_claimAutoreleasedReturnValue([v29 deviceVendorID]);
    v31 = (void *)objc_claimAutoreleasedReturnValue([v30 UUIDString]);
    v100 = v4;
    v32 = (void *)objc_claimAutoreleasedReturnValue([v31 lowercaseString]);
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v19,  "setObject:forKeyedSubscript:",  v32,  @"deviceVerification");

    v4 = v100;
    v33 = (void *)objc_claimAutoreleasedReturnValue(+[AMSDevice deviceGUID](&OBJC_CLASS___AMSDevice, "deviceGUID"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v19, "setObject:forKeyedSubscript:", v33, @"guid");

    v34 = sub_100026EA4(-[LoadInAppReceiptsTask reason](self, "reason"));
    v35 = (void *)objc_claimAutoreleasedReturnValue(v34);
    -[NSMutableDictionary setObject:forKeyedSubscript:](v19, "setObject:forKeyedSubscript:", v35, @"reason");

    v36 = (void *)objc_claimAutoreleasedReturnValue(-[LoadInAppReceiptsTask localRevision](self, "localRevision"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v19, "setObject:forKeyedSubscript:", v36, @"revision");

    v37 = (void *)objc_claimAutoreleasedReturnValue( +[BagKey transactionReceiptsMaxCount]( &OBJC_CLASS____TtC9storekitd6BagKey,  "transactionReceiptsMaxCount"));
    v38 = (void *)objc_claimAutoreleasedReturnValue([v100 integerForKey:v37]);

    v39 = (void *)objc_claimAutoreleasedReturnValue([v38 valueWithError:0]);
    v40 = (void *)objc_claimAutoreleasedReturnValue([v39 stringValue]);
    -[NSMutableDictionary setObject:forKeyedSubscript:](v19, "setObject:forKeyedSubscript:", v40, @"limit");

    v92 = v38;
    if (qword_10032DCF8 != -1) {
      dispatch_once(&qword_10032DCF8, &stru_1002E6A70);
    }
    v41 = (void *)v96;
    v42 = (void *)qword_10032DCD8;
    if (os_log_type_enabled((os_log_t)qword_10032DCD8, OS_LOG_TYPE_DEFAULT))
    {
      v43 = v42;
      v44 = (void *)objc_claimAutoreleasedReturnValue(-[LoadInAppReceiptsTask logKey](self, "logKey"));
      v45 = (void *)objc_opt_class(self);
      id v46 = v45;
      v47 = (void *)objc_claimAutoreleasedReturnValue(-[LoadInAppReceiptsTask localRevision](self, "localRevision"));
      *(_DWORD *)buf = 138543874;
      v105 = v44;
      __int16 v106 = 2114;
      v107 = v45;
      __int16 v108 = 2114;
      id v109 = v47;
      _os_log_impl( (void *)&_mh_execute_header,  v43,  OS_LOG_TYPE_DEFAULT,  "[%{public}@] [%{public}@]: Starting receipt request from revision %{public}@",  buf,  0x20u);

      v4 = v100;
    }

    id v102 = 0LL;
    v91 = (void *)objc_claimAutoreleasedReturnValue([v8 requestWithMethod:4 URL:v96 headers:&off_100302700 parameters:v19]);
    uint64_t v48 = objc_claimAutoreleasedReturnValue([v91 resultWithError:&v102]);
    id v49 = v102;
    id v11 = v98;
    v6 = v99;
    v90 = (void *)v48;
    if (v49)
    {
      id v14 = v49;
      v93 = 0LL;
    }

    else
    {
      v50 = (void *)objc_claimAutoreleasedReturnValue([v99 dataTaskPromiseWithRequest:v48]);
      id v101 = 0LL;
      v51 = (void *)objc_claimAutoreleasedReturnValue([v50 resultWithError:&v101]);
      id v14 = v101;
      if (v51) {
        +[SecureClock synchronizeWithURLResult:](&OBJC_CLASS___SecureClock, "synchronizeWithURLResult:", v51);
      }
      v93 = v51;

      if (!v14)
      {
        v10 = v97;
        if (qword_10032DCF8 != -1) {
          dispatch_once(&qword_10032DCF8, &stru_1002E6A70);
        }
        v41 = (void *)v96;
        v54 = (void *)qword_10032DCD8;
        if (os_log_type_enabled((os_log_t)qword_10032DCD8, OS_LOG_TYPE_DEFAULT))
        {
          v55 = v54;
          v56 = (void *)objc_claimAutoreleasedReturnValue(-[LoadInAppReceiptsTask logKey](self, "logKey"));
          v57 = (void *)objc_opt_class(self);
          *(_DWORD *)buf = 138543618;
          v105 = v56;
          __int16 v106 = 2114;
          v107 = v57;
          id v58 = v57;
          _os_log_impl( (void *)&_mh_execute_header,  v55,  OS_LOG_TYPE_DEFAULT,  "[%{public}@] [%{public}@]: Finished receipt request",  buf,  0x16u);

          id v11 = v98;
          v4 = v100;

          v6 = v99;
        }

        v59 = (void *)objc_claimAutoreleasedReturnValue([v51 object]);
        uint64_t v60 = objc_opt_class(&OBJC_CLASS___NSDictionary);
        v89 = v59;
        if ((objc_opt_isKindOfClass(v59, v60) & 1) != 0)
        {
          id v61 = v59;
          v62 = (void *)objc_claimAutoreleasedReturnValue([v61 objectForKeyedSubscript:@"signedTransactions"]);
          v63 = (void *)objc_claimAutoreleasedReturnValue([v61 objectForKeyedSubscript:@"revision"]);
          uint64_t v64 = objc_opt_class(&OBJC_CLASS___NSArray);
          id obj = v62;
          v85 = v63;
          if ((objc_opt_isKindOfClass(v62, v64) & 1) != 0
            && (uint64_t v65 = objc_opt_class(&OBJC_CLASS___NSString), (objc_opt_isKindOfClass(v63, v65) & 1) != 0))
          {
            objc_storeStrong((id *)((char *)&self->_logKey + 2), v62);
            objc_storeStrong((id *)((char *)&self->_localRevision + 2), v63);
            id v14 = 0LL;
            v66 = &type metadata for ClientOverrideRequest;
          }

          else
          {
            if (qword_10032DCF8 != -1) {
              dispatch_once(&qword_10032DCF8, &stru_1002E6A70);
            }
            v66 = &type metadata for ClientOverrideRequest;
            if (os_log_type_enabled((os_log_t)qword_10032DCD8, OS_LOG_TYPE_ERROR)) {
              sub_10025B270();
            }
            uint64_t v68 = ASDErrorWithTitleAndMessage( ASDErrorDomain,  507LL,  @"Missing required fields",  @"Receipt response missing revision or transactions");
            id v14 = (id)objc_claimAutoreleasedReturnValue(v68);
          }

          uint64_t v69 = objc_claimAutoreleasedReturnValue([v61 objectForKeyedSubscript:@"unfinishedTxnIds"]);
          uint64_t v70 = objc_opt_class(&OBJC_CLASS___NSArray);
          v87 = (void *)v69;
          v88 = v61;
          if ((objc_opt_isKindOfClass(v69, v70) & 1) != 0)
          {
            v41 = (void *)v96;
            if (qword_10032DCF8 != -1) {
              dispatch_once(&qword_10032DCF8, &stru_1002E6A70);
            }
            Description = v66[205].Description;
            if (os_log_type_enabled((os_log_t)Description, OS_LOG_TYPE_DEFAULT))
            {
              v72 = Description;
              v73 = (void *)objc_claimAutoreleasedReturnValue(-[LoadInAppReceiptsTask logKey](self, "logKey"));
              v74 = (void *)objc_opt_class(self);
              id v75 = v74;
              id v76 = [v87 count];
              *(_DWORD *)buf = 138543874;
              v105 = v73;
              __int16 v106 = 2114;
              v107 = v74;
              id v11 = v98;
              __int16 v108 = 2048;
              id v109 = v76;
              _os_log_impl( (void *)&_mh_execute_header,  v72,  OS_LOG_TYPE_DEFAULT,  "[%{public}@] [%{public}@]: Setting %lu unfinished transactions",  buf,  0x20u);

              v6 = v99;
              v4 = v100;
            }

            int64_t v77 = objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v87));
            v78 = *(void **)((char *)&self->_reason + 2);
            *(int64_t *)((char *)&self->_reason + 2) = v77;

            v79 = v85;
          }

          else
          {
            v41 = (void *)v96;
            if (qword_10032DCF8 != -1) {
              dispatch_once(&qword_10032DCF8, &stru_1002E6A70);
            }
            v80 = v66[205].Description;
            v79 = v85;
            if (os_log_type_enabled((os_log_t)v80, OS_LOG_TYPE_ERROR)) {
              sub_10025B1DC(v80, self);
            }
          }

          v81 = (void *)objc_claimAutoreleasedReturnValue([v88 objectForKeyedSubscript:@"hasMore"]);
          uint64_t v82 = objc_opt_class(&OBJC_CLASS___NSNumber);
          if ((objc_opt_isKindOfClass(v81, v82) & 1) != 0) {
            unsigned __int8 v83 = [v81 BOOLValue];
          }
          else {
            unsigned __int8 v83 = 0;
          }
          v84 = v81;
          v10 = v97;
          *(&self->super.super._success + 3) = v83;
        }

        else
        {
          if (qword_10032DCF8 != -1) {
            dispatch_once(&qword_10032DCF8, &stru_1002E6A70);
          }
          if (os_log_type_enabled((os_log_t)qword_10032DCD8, OS_LOG_TYPE_ERROR)) {
            sub_10025B2FC();
          }
          uint64_t v67 = ASDErrorWithTitleAndMessage( ASDErrorDomain,  507LL,  @"Error decoding object",  @"Attempted to decode receipt response");
          id v14 = (id)objc_claimAutoreleasedReturnValue(v67);
        }

        if (v14) {
          -[AsyncTask completeWithError:](self, "completeWithError:", v14);
        }
        else {
          -[AsyncTask completeWithSuccess](self, "completeWithSuccess");
        }

        goto LABEL_28;
      }

      v41 = (void *)v96;
    }

    if (qword_10032DCF8 != -1) {
      dispatch_once(&qword_10032DCF8, &stru_1002E6A70);
    }
    if (os_log_type_enabled((os_log_t)qword_10032DCD8, OS_LOG_TYPE_ERROR)) {
      sub_10025B388();
    }
    -[AsyncTask completeWithError:](self, "completeWithError:", v14);
    v10 = v97;
LABEL_28:

LABEL_29:
    id v12 = v41;
    goto LABEL_30;
  }

  id v14 = v13;
  if (qword_10032DCF8 != -1) {
    dispatch_once(&qword_10032DCF8, &stru_1002E6A70);
  }
  if (os_log_type_enabled((os_log_t)qword_10032DCD8, OS_LOG_TYPE_ERROR)) {
    sub_10025B4A8();
  }
  -[AsyncTask completeWithError:](self, "completeWithError:", v14);
LABEL_30:
}

- (_TtC9storekitd6Client)client
{
  return *(_TtC9storekitd6Client **)((char *)&self->super.super._error + 2);
}

- (BOOL)includeFinishedConsumables
{
  return *(&self->super.super._success + 2);
}

- (NSString)localRevision
{
  return *(NSString **)(&self->super._finished + 1);
}

- (NSString)logKey
{
  return *(NSString **)(&self->_more + 1);
}

- (void)setLogKey:(id)a3
{
}

- (int64_t)reason
{
  return *(int64_t *)((char *)&self->_client + 2);
}

- (BOOL)more
{
  return *(&self->super.super._success + 3);
}

- (NSString)serverRevision
{
  return *(NSString **)((char *)&self->_localRevision + 2);
}

- (NSArray)receipts
{
  return *(NSArray **)((char *)&self->_logKey + 2);
}

- (NSSet)unfinishedTransactionIDs
{
  return *(NSSet **)((char *)&self->_reason + 2);
}

- (void).cxx_destruct
{
}

@end
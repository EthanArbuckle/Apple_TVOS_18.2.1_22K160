@interface LoadSubscriptionStatusTask
- (LoadSubscriptionStatusTask)initWithSubscriptionGroupID:(id)a3 reason:(int64_t)a4 client:(id)a5;
- (NSArray)statuses;
- (NSString)logKey;
- (NSString)subscriptionGroupID;
- (_TtC9storekitd6Client)client;
- (int64_t)reason;
- (void)_parseResponse:(id)a3;
- (void)_replaceDate:(id *)a3 ifBeforeDate:(id)a4;
- (void)main;
- (void)setLogKey:(id)a3;
@end

@implementation LoadSubscriptionStatusTask

- (LoadSubscriptionStatusTask)initWithSubscriptionGroupID:(id)a3 reason:(int64_t)a4 client:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___LoadSubscriptionStatusTask;
  v11 = -[Task init](&v16, "init");
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)(v11 + 42), a5);
    uint64_t v13 = objc_claimAutoreleasedReturnValue(+[NSUUID lib_shortLogKey](&OBJC_CLASS___NSUUID, "lib_shortLogKey"));
    v14 = *(void **)(v12 + 50);
    *(void *)(v12 + 50) = v13;

    *(void *)(v12 + 58) = a4;
    objc_storeStrong((id *)(v12 + 66), a3);
  }

  return (LoadSubscriptionStatusTask *)v12;
}

- (void)main
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[LoadSubscriptionStatusTask client](self, "client"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 bag]);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[LoadSubscriptionStatusTask client](self, "client"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 urlSession]);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[LoadSubscriptionStatusTask client](self, "client"));
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 urlRequestEncoder]);

  v71 = v8;
  [v8 setRequestEncoding:3];
  id v9 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[LoadSubscriptionStatusTask client](self, "client"));
  v11 = (void *)objc_claimAutoreleasedReturnValue([v10 account]);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[LoadSubscriptionStatusTask client](self, "client"));
  LODWORD(v8) = objc_msgSend(v12, "objc_clientType");

  if ((_DWORD)v8 == 3)
  {
LABEL_4:
    v68 = v11;
    v70 = v6;
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[LoadSubscriptionStatusTask client](self, "client"));
    objc_super v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%lld",  [v15 storeItemID]));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v9, "setObject:forKeyedSubscript:", v16, @"appAdamId");

    v17 = (void *)objc_claimAutoreleasedReturnValue(-[LoadSubscriptionStatusTask client](self, "client"));
    v18 = (void *)objc_claimAutoreleasedReturnValue([v17 requestBundleID]);
    -[NSMutableDictionary setObject:forKeyedSubscript:](v9, "setObject:forKeyedSubscript:", v18, @"bundleId");

    v19 = (void *)objc_claimAutoreleasedReturnValue(-[LoadSubscriptionStatusTask client](self, "client"));
    v20 = (void *)objc_claimAutoreleasedReturnValue([v19 deviceVendorID]);
    v21 = (void *)objc_claimAutoreleasedReturnValue([v20 UUIDString]);
    v22 = (void *)objc_claimAutoreleasedReturnValue([v21 lowercaseString]);
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v9,  "setObject:forKeyedSubscript:",  v22,  @"deviceVerification");

    v23 = (void *)objc_claimAutoreleasedReturnValue(+[AMSDevice deviceGUID](&OBJC_CLASS___AMSDevice, "deviceGUID"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v9, "setObject:forKeyedSubscript:", v23, @"guid");

    v24 = sub_100026EA4(-[LoadSubscriptionStatusTask reason](self, "reason"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
    -[NSMutableDictionary setObject:forKeyedSubscript:](v9, "setObject:forKeyedSubscript:", v25, @"reason");

    if (qword_10032E8A0 != -1) {
      dispatch_once(&qword_10032E8A0, &stru_1002E9288);
    }
    v26 = (void *)qword_10032E880;
    if (os_log_type_enabled((os_log_t)qword_10032E880, OS_LOG_TYPE_DEFAULT))
    {
      v27 = v26;
      v28 = (void *)objc_claimAutoreleasedReturnValue(-[LoadSubscriptionStatusTask logKey](self, "logKey"));
      *(_DWORD *)buf = 138543618;
      v77 = v28;
      __int16 v78 = 2114;
      id v79 = (id)objc_opt_class(self);
      id v29 = v79;
      _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_DEFAULT,  "[%{public}@] [%{public}@]: Starting subscription status request",  buf,  0x16u);
    }

    v30 = (void *)objc_claimAutoreleasedReturnValue(+[BagKey subscriptionStatusURL](&OBJC_CLASS____TtC9storekitd6BagKey, "subscriptionStatusURL"));
    v69 = v4;
    v31 = (void *)objc_claimAutoreleasedReturnValue([v4 URLForKey:v30]);

    id v74 = 0LL;
    v32 = (void *)objc_claimAutoreleasedReturnValue([v31 valueWithError:&v74]);
    id v33 = v74;
    v34 = (void *)objc_claimAutoreleasedReturnValue(-[LoadSubscriptionStatusTask subscriptionGroupID](self, "subscriptionGroupID"));
    id v35 = [v34 length];

    if (v35)
    {
      v36 = (void *)objc_claimAutoreleasedReturnValue(-[LoadSubscriptionStatusTask subscriptionGroupID](self, "subscriptionGroupID"));
      uint64_t v37 = objc_claimAutoreleasedReturnValue([v32 URLByAppendingPathComponent:v36]);

      v32 = (void *)v37;
    }

    if (v32)
    {
      v38 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
      v39 = (void *)objc_claimAutoreleasedReturnValue(+[AMSDevice deviceGUID](&OBJC_CLASS___AMSDevice, "deviceGUID"));
      -[NSMutableDictionary setObject:forKeyedSubscript:](v38, "setObject:forKeyedSubscript:", v39, @"guid");

      v40 = sub_100026EA4(-[LoadSubscriptionStatusTask reason](self, "reason"));
      v41 = (void *)objc_claimAutoreleasedReturnValue(v40);
      -[NSMutableDictionary setObject:forKeyedSubscript:](v38, "setObject:forKeyedSubscript:", v41, @"reason");

      v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "lib_URLByAppendingQueryDictionary:", v38));
      v43 = (void *)objc_claimAutoreleasedReturnValue([v71 requestWithMethod:4 URL:v42 headers:&off_100302728 parameters:v9]);

      if (v43)
      {
        id v73 = v33;
        v44 = (void *)objc_claimAutoreleasedReturnValue([v43 resultWithError:&v73]);
        id v45 = v73;

        v46 = &qword_10032E000;
        if (v45)
        {
          v47 = 0LL;
          id v33 = v45;
        }

        else
        {
          v50 = (void *)objc_claimAutoreleasedReturnValue([v70 dataTaskPromiseWithRequest:v44]);
          id v72 = 0LL;
          v47 = (void *)objc_claimAutoreleasedReturnValue([v50 resultWithError:&v72]);
          id v33 = v72;
          if (v47) {
            +[SecureClock synchronizeWithURLResult:](&OBJC_CLASS___SecureClock, "synchronizeWithURLResult:", v47);
          }
        }

LABEL_25:
        uint64_t v51 = v46[276];
        if (v33)
        {
          if (v51 != -1) {
            dispatch_once(&qword_10032E8A0, &stru_1002E9288);
          }
          v52 = (void *)qword_10032E880;
          if (os_log_type_enabled((os_log_t)qword_10032E880, OS_LOG_TYPE_ERROR)) {
            sub_100261AF0(v52, self);
          }
          -[AsyncTask completeWithError:](self, "completeWithError:", v33);
          goto LABEL_56;
        }

        if (v51 != -1) {
          dispatch_once(&qword_10032E8A0, &stru_1002E9288);
        }
        v53 = (void *)qword_10032E880;
        if (os_log_type_enabled((os_log_t)qword_10032E880, OS_LOG_TYPE_DEFAULT))
        {
          v54 = v53;
          v55 = (void *)objc_claimAutoreleasedReturnValue(-[LoadSubscriptionStatusTask logKey](self, "logKey"));
          v56 = (void *)objc_opt_class(self);
          *(_DWORD *)buf = 138543618;
          v77 = v55;
          __int16 v78 = 2114;
          id v79 = v56;
          id v57 = v56;
          _os_log_impl( (void *)&_mh_execute_header,  v54,  OS_LOG_TYPE_DEFAULT,  "[%{public}@] [%{public}@]: Finished subscription status request",  buf,  0x16u);
        }

        v58 = (void *)objc_claimAutoreleasedReturnValue([v47 object]);
        uint64_t v59 = objc_opt_class(&OBJC_CLASS___NSDictionary);
        if ((objc_opt_isKindOfClass(v58, v59) & 1) == 0)
        {
          if (v46[276] != -1) {
            dispatch_once(&qword_10032E8A0, &stru_1002E9288);
          }
          v62 = (void *)qword_10032E880;
          if (os_log_type_enabled((os_log_t)qword_10032E880, OS_LOG_TYPE_ERROR)) {
            sub_100261A5C(v62, self);
          }
          uint64_t v63 = ASDErrorWithTitleAndMessage( ASDErrorDomain,  507LL,  @"Error decoding object",  @"Attempted to decode receipt response");
          id v33 = (id)objc_claimAutoreleasedReturnValue(v63);
          goto LABEL_52;
        }

        v60 = (void *)objc_claimAutoreleasedReturnValue([v58 objectForKeyedSubscript:@"data"]);
        uint64_t v61 = objc_opt_class(&OBJC_CLASS___NSArray);
        if ((objc_opt_isKindOfClass(v60, v61) & 1) != 0)
        {
          -[LoadSubscriptionStatusTask _parseResponse:](self, "_parseResponse:", v60);
        }

        else
        {
          uint64_t v64 = objc_opt_class(&OBJC_CLASS___NSDictionary);
          if ((objc_opt_isKindOfClass(v60, v64) & 1) == 0)
          {
            if (qword_10032E8A0 != -1) {
              dispatch_once(&qword_10032E8A0, &stru_1002E9288);
            }
            v66 = (void *)qword_10032E880;
            if (os_log_type_enabled((os_log_t)qword_10032E880, OS_LOG_TYPE_ERROR)) {
              sub_1002619C8(v66, self);
            }
            uint64_t v67 = ASDErrorWithTitleAndMessage( ASDErrorDomain,  507LL,  @"Missing required fields",  @"Subscription status response missing data");
            id v33 = (id)objc_claimAutoreleasedReturnValue(v67);
            goto LABEL_51;
          }

          v75 = v60;
          v65 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  &v75,  1LL));
          -[LoadSubscriptionStatusTask _parseResponse:](self, "_parseResponse:", v65);
        }

        id v33 = 0LL;
LABEL_51:

LABEL_52:
        if (v33) {
          -[AsyncTask completeWithError:](self, "completeWithError:", v33);
        }
        else {
          -[AsyncTask completeWithSuccess](self, "completeWithSuccess");
        }

LABEL_56:
        v4 = v69;
        v6 = v70;
        v11 = v68;
        goto LABEL_57;
      }
    }

    else
    {
      v43 = 0LL;
      v42 = 0LL;
    }

    v47 = 0LL;
    v46 = &qword_10032E000;
    goto LABEL_25;
  }

  if (v11)
  {
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "ams_DSID"));
    v14 = (void *)objc_claimAutoreleasedReturnValue([v13 stringValue]);
    -[NSMutableDictionary setObject:forKeyedSubscript:](v9, "setObject:forKeyedSubscript:", v14, @"dsid");

    goto LABEL_4;
  }

  if (qword_10032E8A0 != -1) {
    dispatch_once(&qword_10032E8A0, &stru_1002E9288);
  }
  v48 = (void *)qword_10032E880;
  if (os_log_type_enabled((os_log_t)qword_10032E880, OS_LOG_TYPE_ERROR)) {
    sub_100261B84(v48, self);
  }
  uint64_t v49 = ASDErrorWithTitleAndMessage(ASDErrorDomain, 509LL, @"No active account", 0LL);
  id v33 = (id)objc_claimAutoreleasedReturnValue(v49);
  -[AsyncTask completeWithError:](self, "completeWithError:", v33);
LABEL_57:
}

- (void)_parseResponse:(id)a3
{
  id v3 = a3;
  v4 = &_ss13OpaquePointerV16debugDescriptionSSvg_ptr;
  v82 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  __int128 v103 = 0u;
  __int128 v104 = 0u;
  __int128 v105 = 0u;
  __int128 v106 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v103 objects:v121 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v104;
    id v9 = &_ss13OpaquePointerV16debugDescriptionSSvg_ptr;
    id v10 = @"signedRenewalInfo";
    id v80 = v5;
    uint64_t v83 = *(void *)v104;
    do
    {
      uint64_t v11 = 0LL;
      id v81 = v7;
      do
      {
        if (*(void *)v104 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v87 = v11;
        v12 = *(void **)(*((void *)&v103 + 1) + 8 * v11);
        uint64_t v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", @"subscriptionGroupIdentifier", v80));
        uint64_t v14 = objc_opt_class(v9[374]);
        v88 = (void *)v13;
        if ((objc_opt_isKindOfClass(v13, v14) & 1) != 0)
        {
          uint64_t v15 = objc_claimAutoreleasedReturnValue([v4[352] array]);
          uint64_t v16 = objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:v10]);
          uint64_t v17 = objc_opt_class(&OBJC_CLASS___NSArray);
          v84 = (void *)v16;
          if ((objc_opt_isKindOfClass(v16, v17) & 1) != 0)
          {
            v18 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:@"status"]);
            uint64_t v19 = objc_opt_class(&OBJC_CLASS___NSNumber);
            if ((objc_opt_isKindOfClass(v18, v19) & 1) != 0)
            {
              v91 = (void *)v15;
              __int128 v102 = 0u;
              __int128 v100 = 0u;
              __int128 v101 = 0u;
              __int128 v99 = 0u;
              id v20 = v84;
              id v21 = [v20 countByEnumeratingWithState:&v99 objects:v112 count:16];
              if (v21)
              {
                id v22 = v21;
                id v23 = 0LL;
                uint64_t v24 = *(void *)v100;
                do
                {
                  v25 = 0LL;
                  v26 = v23;
                  do
                  {
                    if (*(void *)v100 != v24) {
                      objc_enumerationMutation(v20);
                    }
                    v27 = *(void **)(*((void *)&v99 + 1) + 8LL * (void)v25);
                    v110[0] = @"status";
                    v110[1] = v10;
                    v111[0] = v18;
                    v111[1] = v27;
                    v28 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v111,  v110,  2LL));
                    [v91 addObject:v28];

                    id v29 = sub_100025AE4(v27);
                    v30 = (void *)objc_claimAutoreleasedReturnValue(v29);
                    id v98 = v26;
                    -[LoadSubscriptionStatusTask _replaceDate:ifBeforeDate:]( self,  "_replaceDate:ifBeforeDate:",  &v98,  v30);
                    id v23 = v98;

                    v25 = (char *)v25 + 1;
                    v26 = v23;
                  }

                  while (v22 != v25);
                  id v22 = [v20 countByEnumeratingWithState:&v99 objects:v112 count:16];
                }

                while (v22);
                v4 = &_ss13OpaquePointerV16debugDescriptionSSvg_ptr;
                id v5 = v80;
                id v7 = v81;
                id v9 = &_ss13OpaquePointerV16debugDescriptionSSvg_ptr;
              }

              else
              {
                id v23 = 0LL;
              }

- (void)_replaceDate:(id *)a3 ifBeforeDate:(id)a4
{
  id v5 = a4;
  if (v5)
  {
    id v8 = v5;
    if (!*a3 || (v6 = [*a3 compare:v5], id v5 = v8, v6 == (id)-1))
    {
      id v7 = v5;
      id v5 = v8;
      *a3 = v7;
    }
  }
}

- (_TtC9storekitd6Client)client
{
  return *(_TtC9storekitd6Client **)(&self->super.super._success + 2);
}

- (NSString)logKey
{
  return *(NSString **)((char *)&self->super.super._error + 2);
}

- (void)setLogKey:(id)a3
{
}

- (int64_t)reason
{
  return *(void *)(&self->super._finished + 1);
}

- (NSString)subscriptionGroupID
{
  return *(NSString **)((char *)&self->_client + 2);
}

- (NSArray)statuses
{
  return *(NSArray **)((char *)&self->_logKey + 2);
}

- (void).cxx_destruct
{
}

@end
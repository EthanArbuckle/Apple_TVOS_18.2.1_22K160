@interface AMSDFetchMultiUserRecordZoneTask
- (AMSDCloudDataDatabase)database;
- (AMSDFetchMultiUserRecordZoneTask)initWithHome:(id)a3 homeUser:(id)a4 database:(id)a5 metrics:(id)a6;
- (AMSDHome)home;
- (AMSDHomeUser)user;
- (AMSDMultiUserMetrics)metrics;
- (BOOL)createIfMissing;
- (id)_createRecordZoneWithError:(id *)a3;
- (id)_fetchRecordZoneWithError:(id *)a3;
- (id)performTask;
- (int64_t)qualityOfService;
- (void)enqueBeginMetrics;
- (void)enqueFailedMetrics:(id)a3;
- (void)setCreateIfMissing:(BOOL)a3;
- (void)setMetrics:(id)a3;
- (void)setQualityOfService:(int64_t)a3;
@end

@implementation AMSDFetchMultiUserRecordZoneTask

- (AMSDFetchMultiUserRecordZoneTask)initWithHome:(id)a3 homeUser:(id)a4 database:(id)a5 metrics:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___AMSDFetchMultiUserRecordZoneTask;
  v15 = -[AMSDFetchMultiUserRecordZoneTask init](&v18, "init");
  v16 = v15;
  if (v15)
  {
    v15->_createIfMissing = 1;
    objc_storeStrong((id *)&v15->_database, a5);
    objc_storeStrong((id *)&v16->_home, a3);
    objc_storeStrong((id *)&v16->_user, a4);
    v16->_qualityOfService = 17LL;
    objc_storeStrong((id *)&v16->_metrics, a6);
  }

  return v16;
}

- (id)performTask
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_100017808;
  v3[3] = &unk_1000D6328;
  v3[4] = self;
  return (id)objc_claimAutoreleasedReturnValue( -[AMSDFetchMultiUserRecordZoneTask performTaskWithBlock:]( self,  "performTaskWithBlock:",  v3));
}

- (id)_createRecordZoneWithError:(id *)a3
{
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[AMSDFetchMultiUserRecordZoneTask database](self, "database"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 UUIDString]);
  v8 = (void *)objc_claimAutoreleasedReturnValue([v5 createRecordZoneWithRecordZoneName:v7]);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[AMSDFetchMultiUserRecordZoneTask database](self, "database"));
  v10 = (void *)objc_claimAutoreleasedReturnValue([v9 saveRecordZone:v8]);
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 resultWithError:a3]);

  if (v11)
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue(-[AMSDFetchMultiUserRecordZoneTask database](self, "database"));
    id v13 = (void *)objc_claimAutoreleasedReturnValue( [v12 createRecordWithRecordName:@"AMSHomeParticipant" recordType:@"AMSHomeParticipant" recordZone:v11]);

    id v14 = (void *)objc_claimAutoreleasedReturnValue(-[AMSDFetchMultiUserRecordZoneTask home](self, "home"));
    v15 = (void *)objc_claimAutoreleasedReturnValue([v14 identifier]);
    v16 = (void *)objc_claimAutoreleasedReturnValue([v15 UUIDString]);
    [v13 setField:v16 forKey:@"AMSHomeParticipant_HomeIdentifier"];

    v17 = (void *)objc_claimAutoreleasedReturnValue(-[AMSDFetchMultiUserRecordZoneTask user](self, "user"));
    objc_super v18 = (void *)objc_claimAutoreleasedReturnValue([v17 identifier]);
    v19 = (void *)objc_claimAutoreleasedReturnValue([v18 UUIDString]);
    [v13 setField:v19 forKey:@"AMSHomeParticipant_HomeUserIdentifier"];

    v20 = (void *)objc_claimAutoreleasedReturnValue(-[AMSDFetchMultiUserRecordZoneTask database](self, "database"));
    v21 = (void *)objc_claimAutoreleasedReturnValue([v20 saveRecord:v13]);
    id v52 = 0LL;
    v22 = (void *)objc_claimAutoreleasedReturnValue([v21 resultWithError:&v52]);
    id v23 = v52;

    if (v22)
    {
      id v24 = v11;
      id v25 = v23;
    }

    else
    {
      v26 = (void *)objc_claimAutoreleasedReturnValue( +[AMSLogConfig sharedAccountsMultiUserConfig]( &OBJC_CLASS___AMSLogConfig,  "sharedAccountsMultiUserConfig"));
      if (!v26) {
        v26 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
      }
      v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "OSLogObject", a3));
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        uint64_t v29 = objc_opt_class(self, v28);
        uint64_t v31 = AMSLogKey(v29, v30);
        v32 = (void *)objc_claimAutoreleasedReturnValue(v31);
        uint64_t v33 = AMSHashIfNeeded(v23);
        v34 = (void *)objc_claimAutoreleasedReturnValue(v33);
        *(_DWORD *)buf = 138543874;
        uint64_t v55 = v29;
        __int16 v56 = 2114;
        v57 = v32;
        __int16 v58 = 2114;
        v59 = v34;
        _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_ERROR,  "%{public}@: [%{public}@] Failed to create a HomeParticipant record inside a record zone. error = %{public}@",  buf,  0x20u);
      }

      v35 = (void *)objc_claimAutoreleasedReturnValue(-[AMSDFetchMultiUserRecordZoneTask database](self, "database"));
      v36 = (void *)objc_claimAutoreleasedReturnValue([v11 identifier]);
      v53 = v36;
      v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v53, 1LL));
      v38 = (void *)objc_claimAutoreleasedReturnValue([v35 deleteRecordZonesWithRecordZoneIdentifiers:v37]);
      id v51 = v23;
      v39 = (void *)objc_claimAutoreleasedReturnValue([v38 resultWithError:&v51]);
      id v25 = v51;

      if (!v39)
      {
        v40 = (void *)objc_claimAutoreleasedReturnValue( +[AMSLogConfig sharedAccountsMultiUserConfig]( &OBJC_CLASS___AMSLogConfig,  "sharedAccountsMultiUserConfig"));
        if (!v40) {
          v40 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
        }
        v41 = (os_log_s *)objc_claimAutoreleasedReturnValue([v40 OSLogObject]);
        if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
        {
          uint64_t v43 = objc_opt_class(self, v42);
          uint64_t v45 = AMSLogKey(v43, v44);
          v46 = (void *)objc_claimAutoreleasedReturnValue(v45);
          uint64_t v47 = AMSHashIfNeeded(v25);
          v48 = (void *)objc_claimAutoreleasedReturnValue(v47);
          *(_DWORD *)buf = 138543874;
          uint64_t v55 = v43;
          __int16 v56 = 2114;
          v57 = v46;
          __int16 v58 = 2114;
          v59 = v48;
          _os_log_impl( (void *)&_mh_execute_header,  v41,  OS_LOG_TYPE_ERROR,  "%{public}@: [%{public}@] Failed to delete the record zone. error = %{public}@",  buf,  0x20u);
        }
      }

      if (v50)
      {
        id v25 = v25;
        id v24 = 0LL;
        void *v50 = v25;
      }

      else
      {
        id v24 = 0LL;
      }
    }
  }

  else
  {
    id v24 = 0LL;
  }

  return v24;
}

- (void)enqueBeginMetrics
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[AMSDFetchMultiUserRecordZoneTask metrics](self, "metrics"));

  if (v3)
  {
    id v5 = (id)objc_claimAutoreleasedReturnValue(-[AMSDFetchMultiUserRecordZoneTask metrics](self, "metrics"));
    id v4 = [v5 enqueueCloudKitFetchBeganEvent];
  }

- (void)enqueFailedMetrics:(id)a3
{
  id v7 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[AMSDFetchMultiUserRecordZoneTask metrics](self, "metrics"));

  if (v4)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[AMSDFetchMultiUserRecordZoneTask metrics](self, "metrics"));
    id v6 = [v5 enqueueCloudKitFetchFailedEventWithError:v7];
  }
}

- (id)_fetchRecordZoneWithError:(id *)a3
{
  id v4 = self;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[AMSDFetchMultiUserRecordZoneTask database](self, "database"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v5,  "fetchRecordZonesWithQualityOfService:",  -[AMSDFetchMultiUserRecordZoneTask qualityOfService](v4, "qualityOfService")));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 resultWithError:a3]);

  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue([v7 results]);
    v9 = (void *)objc_claimAutoreleasedReturnValue([v8 allValues]);

    v112[0] = _NSConcreteStackBlock;
    v112[1] = 3221225472LL;
    v112[2] = sub_100018B08;
    v112[3] = &unk_1000D6350;
    v112[4] = v4;
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "ams_filterUsingTest:", v112));

    id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 firstObject]);
    v97 = v10;
    id v12 = &_s10Foundation11JSONDecoderC6decode_4fromxxm_AA4DataVtKSeRzlFTj_ptr;
    if ((unint64_t)[v10 count] >= 2)
    {
      id v13 = (void *)objc_claimAutoreleasedReturnValue( +[AMSLogConfig sharedAccountsMultiUserConfig]( &OBJC_CLASS___AMSLogConfig,  "sharedAccountsMultiUserConfig"));
      if (!v13) {
        id v13 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
      }
      id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue([v13 OSLogObject]);
      v94 = a3;
      v95 = v11;
      v102 = v4;
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        uint64_t v16 = objc_opt_class(v4, v15);
        uint64_t v18 = AMSLogKey(v16, v17);
        v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
        v20 = (void *)objc_claimAutoreleasedReturnValue(-[AMSDFetchMultiUserRecordZoneTask home](v4, "home"));
        uint64_t v21 = AMSHashIfNeeded(v20);
        v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
        id v23 = (void *)objc_claimAutoreleasedReturnValue(-[AMSDFetchMultiUserRecordZoneTask user](v4, "user"));
        uint64_t v24 = AMSHashIfNeeded(v23);
        id v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
        uint64_t v26 = AMSHashIfNeeded(v97);
        v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
        *(_DWORD *)buf = 138544386;
        uint64_t v117 = v16;
        __int16 v118 = 2114;
        v119 = v19;
        __int16 v120 = 2114;
        v121 = v22;
        __int16 v122 = 2114;
        v123 = v25;
        __int16 v124 = 2114;
        v125 = v27;
        _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_ERROR,  "%{public}@: [%{public}@] There are duplicate record zones for a home/user. home = %{public}@ | user = %{public }@ | recordZones = %{public}@",  buf,  0x34u);

        a3 = v94;
        id v12 = &_s10Foundation11JSONDecoderC6decode_4fromxxm_AA4DataVtKSeRzlFTj_ptr;

        id v4 = v102;
        id v11 = v95;
      }

      __int128 v110 = 0u;
      __int128 v111 = 0u;
      __int128 v108 = 0u;
      __int128 v109 = 0u;
      id obj = v97;
      id v28 = [obj countByEnumeratingWithState:&v108 objects:v115 count:16];
      v93 = v7;
      if (v28)
      {
        id v29 = v28;
        uint64_t v100 = *(void *)v109;
        while (2)
        {
          for (i = 0LL; i != v29; i = (char *)i + 1)
          {
            if (*(void *)v109 != v100) {
              objc_enumerationMutation(obj);
            }
            uint64_t v31 = *(void **)(*((void *)&v108 + 1) + 8LL * (void)i);
            v32 = (void *)objc_claimAutoreleasedReturnValue(-[AMSDFetchMultiUserRecordZoneTask database](v102, "database", v93));
            uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue([v31 identifier]);
            v34 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v32,  "fetchRecordWithName:zoneIdentifier:qualityOfService:",  @"AMSHomeParticipant",  v33,  -[AMSDFetchMultiUserRecordZoneTask qualityOfService](v102, "qualityOfService")));
            v35 = (void *)objc_claimAutoreleasedReturnValue([v34 resultWithError:0]);

            v36 = (void *)objc_claimAutoreleasedReturnValue([v35 fieldForKey:@"AMSHomeParticipant_MultiUserToken"]);
            uint64_t v38 = objc_opt_class(&OBJC_CLASS___NSString, v37);
            id v39 = 0LL;
            if ((objc_opt_isKindOfClass(v36, v38) & 1) != 0) {
              id v39 = v36;
            }

            v40 = (void *)objc_claimAutoreleasedReturnValue([v35 fieldForKey:@"AMSHomeParticipant_MultiUserTokenInvalid"]);
            uint64_t v42 = objc_opt_class(&OBJC_CLASS___NSNumber, v41);
            if ((objc_opt_isKindOfClass(v40, v42) & 1) != 0) {
              id v43 = v40;
            }
            else {
              id v43 = 0LL;
            }

            unsigned __int8 v44 = [v43 BOOLValue];
            if ([v39 length] && (v44 & 1) == 0)
            {
              id v45 = v31;

              id v11 = v45;
              id v7 = v93;
              a3 = v94;
              goto LABEL_24;
            }
          }

          id v29 = [obj countByEnumeratingWithState:&v108 objects:v115 count:16];
          if (v29) {
            continue;
          }
          break;
        }

        id v7 = v93;
        a3 = v94;
        id v11 = v95;
LABEL_24:
        id v4 = v102;
        id v12 = &_s10Foundation11JSONDecoderC6decode_4fromxxm_AA4DataVtKSeRzlFTj_ptr;
      }

      v46 = (void *)objc_claimAutoreleasedReturnValue(-[AMSDFetchMultiUserRecordZoneTask database](v4, "database"));
      unsigned int v47 = [v46 isPrivateDatabase];

      if (v47)
      {
        id v48 = [obj mutableCopy];
        v96 = v11;
        [v48 removeObject:v11];
        v49 = (void *)objc_claimAutoreleasedReturnValue([v12[507] sharedAccountsMultiUserConfig]);
        if (!v49) {
          v49 = (void *)objc_claimAutoreleasedReturnValue([v12[507] sharedConfig]);
        }
        v50 = (os_log_s *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "OSLogObject", v93));
        if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
        {
          uint64_t v52 = objc_opt_class(v4, v51);
          uint64_t v54 = AMSLogKey(v52, v53);
          uint64_t v55 = (void *)objc_claimAutoreleasedReturnValue(v54);
          uint64_t v56 = AMSHashIfNeeded(v48);
          v57 = (void *)objc_claimAutoreleasedReturnValue(v56);
          *(_DWORD *)buf = 138543874;
          uint64_t v117 = v52;
          __int16 v118 = 2114;
          v119 = v55;
          __int16 v120 = 2114;
          v121 = v57;
          _os_log_impl( (void *)&_mh_execute_header,  v50,  OS_LOG_TYPE_ERROR,  "%{public}@: [%{public}@] Removing duplicate record zones. duplicateRecordZones = %{public}@",  buf,  0x20u);
        }

        __int128 v106 = 0u;
        __int128 v107 = 0u;
        __int128 v104 = 0u;
        __int128 v105 = 0u;
        id obja = v48;
        id v58 = [obja countByEnumeratingWithState:&v104 objects:v114 count:16];
        if (v58)
        {
          id v59 = v58;
          uint64_t v101 = *(void *)v105;
          do
          {
            for (j = 0LL; j != v59; j = (char *)j + 1)
            {
              if (*(void *)v105 != v101) {
                objc_enumerationMutation(obja);
              }
              v61 = *(void **)(*((void *)&v104 + 1) + 8LL * (void)j);
              v62 = (void *)objc_claimAutoreleasedReturnValue(-[AMSDFetchMultiUserRecordZoneTask database](v4, "database"));
              v63 = (void *)objc_claimAutoreleasedReturnValue([v61 identifier]);
              v113 = v63;
              v64 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  &v113,  1LL));
              v65 = (void *)objc_claimAutoreleasedReturnValue([v62 deleteRecordZonesWithRecordZoneIdentifiers:v64]);
              v66 = (void *)objc_claimAutoreleasedReturnValue([v65 binaryPromiseAdapter]);
              id v103 = 0LL;
              unsigned __int8 v67 = [v66 resultWithError:&v103];
              id v68 = v103;

              if ((v67 & 1) == 0)
              {
                v69 = (void *)objc_claimAutoreleasedReturnValue( +[AMSLogConfig sharedAccountsMultiUserConfig]( &OBJC_CLASS___AMSLogConfig,  "sharedAccountsMultiUserConfig"));
                if (!v69) {
                  v69 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
                }
                v70 = (os_log_s *)objc_claimAutoreleasedReturnValue([v69 OSLogObject]);
                if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR))
                {
                  uint64_t v72 = objc_opt_class(v102, v71);
                  uint64_t v74 = AMSLogKey(v72, v73);
                  v75 = (void *)objc_claimAutoreleasedReturnValue(v74);
                  uint64_t v76 = AMSHashIfNeeded(v61);
                  v77 = (void *)objc_claimAutoreleasedReturnValue(v76);
                  uint64_t v78 = AMSHashIfNeeded(v68);
                  v79 = (void *)objc_claimAutoreleasedReturnValue(v78);
                  *(_DWORD *)buf = 138544130;
                  uint64_t v117 = v72;
                  __int16 v118 = 2114;
                  v119 = v75;
                  __int16 v120 = 2114;
                  v121 = v77;
                  __int16 v122 = 2114;
                  v123 = v79;
                  _os_log_impl( (void *)&_mh_execute_header,  v70,  OS_LOG_TYPE_ERROR,  "%{public}@: [%{public}@] Failed to remove a record zone. recordZone = %{public}@ | error = %{public}@",  buf,  0x2Au);
                }
              }

              id v4 = v102;
            }

            id v59 = [obja countByEnumeratingWithState:&v104 objects:v114 count:16];
          }

          while (v59);
        }

        id v7 = v93;
        a3 = v94;
        id v11 = v96;
        id v12 = &_s10Foundation11JSONDecoderC6decode_4fromxxm_AA4DataVtKSeRzlFTj_ptr;
      }
    }

    v80 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12[507], "sharedAccountsMultiUserConfig", v93));
    if (!v80) {
      v80 = (void *)objc_claimAutoreleasedReturnValue([v12[507] sharedConfig]);
    }
    v81 = (os_log_s *)objc_claimAutoreleasedReturnValue([v80 OSLogObject]);
    if (os_log_type_enabled(v81, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v83 = objc_opt_class(v4, v82);
      uint64_t v85 = AMSLogKey(v83, v84);
      v86 = v11;
      v87 = (void *)objc_claimAutoreleasedReturnValue(v85);
      uint64_t v88 = AMSHashIfNeeded(v86);
      v89 = v7;
      v90 = (void *)objc_claimAutoreleasedReturnValue(v88);
      *(_DWORD *)buf = 138543874;
      uint64_t v117 = v83;
      __int16 v118 = 2114;
      v119 = v87;
      __int16 v120 = 2114;
      v121 = v90;
      _os_log_impl( (void *)&_mh_execute_header,  v81,  OS_LOG_TYPE_DEFAULT,  "%{public}@: [%{public}@] Finished fetching record zone: %{public}@",  buf,  0x20u);

      id v7 = v89;
      id v11 = v86;
    }

    if (a3 && !v11)
    {
      uint64_t v91 = AMSCustomError( @"AMSDCloudDataErrorDomain",  7LL,  @"Unknown Record Zone",  @"The record zone doesn't exist.",  0LL,  0LL);
      *a3 = (id)objc_claimAutoreleasedReturnValue(v91);
    }
  }

  else
  {
    id v11 = 0LL;
  }

  return v11;
}

- (BOOL)createIfMissing
{
  return self->_createIfMissing;
}

- (void)setCreateIfMissing:(BOOL)a3
{
  self->_createIfMissing = a3;
}

- (AMSDCloudDataDatabase)database
{
  return self->_database;
}

- (AMSDHome)home
{
  return self->_home;
}

- (AMSDHomeUser)user
{
  return self->_user;
}

- (int64_t)qualityOfService
{
  return self->_qualityOfService;
}

- (void)setQualityOfService:(int64_t)a3
{
  self->_qualityOfService = a3;
}

- (AMSDMultiUserMetrics)metrics
{
  return self->_metrics;
}

- (void)setMetrics:(id)a3
{
}

- (void).cxx_destruct
{
}

@end